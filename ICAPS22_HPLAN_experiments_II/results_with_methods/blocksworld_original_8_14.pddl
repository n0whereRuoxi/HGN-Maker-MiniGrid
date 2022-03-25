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
      ?auto_191978 - BLOCK
      ?auto_191979 - BLOCK
      ?auto_191980 - BLOCK
      ?auto_191981 - BLOCK
      ?auto_191982 - BLOCK
      ?auto_191983 - BLOCK
      ?auto_191984 - BLOCK
      ?auto_191985 - BLOCK
    )
    :vars
    (
      ?auto_191986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191986 ?auto_191985 ) ( CLEAR ?auto_191986 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191978 ) ( ON ?auto_191979 ?auto_191978 ) ( ON ?auto_191980 ?auto_191979 ) ( ON ?auto_191981 ?auto_191980 ) ( ON ?auto_191982 ?auto_191981 ) ( ON ?auto_191983 ?auto_191982 ) ( ON ?auto_191984 ?auto_191983 ) ( ON ?auto_191985 ?auto_191984 ) ( not ( = ?auto_191978 ?auto_191979 ) ) ( not ( = ?auto_191978 ?auto_191980 ) ) ( not ( = ?auto_191978 ?auto_191981 ) ) ( not ( = ?auto_191978 ?auto_191982 ) ) ( not ( = ?auto_191978 ?auto_191983 ) ) ( not ( = ?auto_191978 ?auto_191984 ) ) ( not ( = ?auto_191978 ?auto_191985 ) ) ( not ( = ?auto_191978 ?auto_191986 ) ) ( not ( = ?auto_191979 ?auto_191980 ) ) ( not ( = ?auto_191979 ?auto_191981 ) ) ( not ( = ?auto_191979 ?auto_191982 ) ) ( not ( = ?auto_191979 ?auto_191983 ) ) ( not ( = ?auto_191979 ?auto_191984 ) ) ( not ( = ?auto_191979 ?auto_191985 ) ) ( not ( = ?auto_191979 ?auto_191986 ) ) ( not ( = ?auto_191980 ?auto_191981 ) ) ( not ( = ?auto_191980 ?auto_191982 ) ) ( not ( = ?auto_191980 ?auto_191983 ) ) ( not ( = ?auto_191980 ?auto_191984 ) ) ( not ( = ?auto_191980 ?auto_191985 ) ) ( not ( = ?auto_191980 ?auto_191986 ) ) ( not ( = ?auto_191981 ?auto_191982 ) ) ( not ( = ?auto_191981 ?auto_191983 ) ) ( not ( = ?auto_191981 ?auto_191984 ) ) ( not ( = ?auto_191981 ?auto_191985 ) ) ( not ( = ?auto_191981 ?auto_191986 ) ) ( not ( = ?auto_191982 ?auto_191983 ) ) ( not ( = ?auto_191982 ?auto_191984 ) ) ( not ( = ?auto_191982 ?auto_191985 ) ) ( not ( = ?auto_191982 ?auto_191986 ) ) ( not ( = ?auto_191983 ?auto_191984 ) ) ( not ( = ?auto_191983 ?auto_191985 ) ) ( not ( = ?auto_191983 ?auto_191986 ) ) ( not ( = ?auto_191984 ?auto_191985 ) ) ( not ( = ?auto_191984 ?auto_191986 ) ) ( not ( = ?auto_191985 ?auto_191986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191986 ?auto_191985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191988 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_191988 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_191988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_191989 - BLOCK
    )
    :vars
    (
      ?auto_191990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_191989 ?auto_191990 ) ( CLEAR ?auto_191989 ) ( HAND-EMPTY ) ( not ( = ?auto_191989 ?auto_191990 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_191989 ?auto_191990 )
      ( MAKE-1PILE ?auto_191989 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_191998 - BLOCK
      ?auto_191999 - BLOCK
      ?auto_192000 - BLOCK
      ?auto_192001 - BLOCK
      ?auto_192002 - BLOCK
      ?auto_192003 - BLOCK
      ?auto_192004 - BLOCK
    )
    :vars
    (
      ?auto_192005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192005 ?auto_192004 ) ( CLEAR ?auto_192005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_191998 ) ( ON ?auto_191999 ?auto_191998 ) ( ON ?auto_192000 ?auto_191999 ) ( ON ?auto_192001 ?auto_192000 ) ( ON ?auto_192002 ?auto_192001 ) ( ON ?auto_192003 ?auto_192002 ) ( ON ?auto_192004 ?auto_192003 ) ( not ( = ?auto_191998 ?auto_191999 ) ) ( not ( = ?auto_191998 ?auto_192000 ) ) ( not ( = ?auto_191998 ?auto_192001 ) ) ( not ( = ?auto_191998 ?auto_192002 ) ) ( not ( = ?auto_191998 ?auto_192003 ) ) ( not ( = ?auto_191998 ?auto_192004 ) ) ( not ( = ?auto_191998 ?auto_192005 ) ) ( not ( = ?auto_191999 ?auto_192000 ) ) ( not ( = ?auto_191999 ?auto_192001 ) ) ( not ( = ?auto_191999 ?auto_192002 ) ) ( not ( = ?auto_191999 ?auto_192003 ) ) ( not ( = ?auto_191999 ?auto_192004 ) ) ( not ( = ?auto_191999 ?auto_192005 ) ) ( not ( = ?auto_192000 ?auto_192001 ) ) ( not ( = ?auto_192000 ?auto_192002 ) ) ( not ( = ?auto_192000 ?auto_192003 ) ) ( not ( = ?auto_192000 ?auto_192004 ) ) ( not ( = ?auto_192000 ?auto_192005 ) ) ( not ( = ?auto_192001 ?auto_192002 ) ) ( not ( = ?auto_192001 ?auto_192003 ) ) ( not ( = ?auto_192001 ?auto_192004 ) ) ( not ( = ?auto_192001 ?auto_192005 ) ) ( not ( = ?auto_192002 ?auto_192003 ) ) ( not ( = ?auto_192002 ?auto_192004 ) ) ( not ( = ?auto_192002 ?auto_192005 ) ) ( not ( = ?auto_192003 ?auto_192004 ) ) ( not ( = ?auto_192003 ?auto_192005 ) ) ( not ( = ?auto_192004 ?auto_192005 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192005 ?auto_192004 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192006 - BLOCK
      ?auto_192007 - BLOCK
      ?auto_192008 - BLOCK
      ?auto_192009 - BLOCK
      ?auto_192010 - BLOCK
      ?auto_192011 - BLOCK
      ?auto_192012 - BLOCK
    )
    :vars
    (
      ?auto_192013 - BLOCK
      ?auto_192014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192013 ?auto_192012 ) ( CLEAR ?auto_192013 ) ( ON-TABLE ?auto_192006 ) ( ON ?auto_192007 ?auto_192006 ) ( ON ?auto_192008 ?auto_192007 ) ( ON ?auto_192009 ?auto_192008 ) ( ON ?auto_192010 ?auto_192009 ) ( ON ?auto_192011 ?auto_192010 ) ( ON ?auto_192012 ?auto_192011 ) ( not ( = ?auto_192006 ?auto_192007 ) ) ( not ( = ?auto_192006 ?auto_192008 ) ) ( not ( = ?auto_192006 ?auto_192009 ) ) ( not ( = ?auto_192006 ?auto_192010 ) ) ( not ( = ?auto_192006 ?auto_192011 ) ) ( not ( = ?auto_192006 ?auto_192012 ) ) ( not ( = ?auto_192006 ?auto_192013 ) ) ( not ( = ?auto_192007 ?auto_192008 ) ) ( not ( = ?auto_192007 ?auto_192009 ) ) ( not ( = ?auto_192007 ?auto_192010 ) ) ( not ( = ?auto_192007 ?auto_192011 ) ) ( not ( = ?auto_192007 ?auto_192012 ) ) ( not ( = ?auto_192007 ?auto_192013 ) ) ( not ( = ?auto_192008 ?auto_192009 ) ) ( not ( = ?auto_192008 ?auto_192010 ) ) ( not ( = ?auto_192008 ?auto_192011 ) ) ( not ( = ?auto_192008 ?auto_192012 ) ) ( not ( = ?auto_192008 ?auto_192013 ) ) ( not ( = ?auto_192009 ?auto_192010 ) ) ( not ( = ?auto_192009 ?auto_192011 ) ) ( not ( = ?auto_192009 ?auto_192012 ) ) ( not ( = ?auto_192009 ?auto_192013 ) ) ( not ( = ?auto_192010 ?auto_192011 ) ) ( not ( = ?auto_192010 ?auto_192012 ) ) ( not ( = ?auto_192010 ?auto_192013 ) ) ( not ( = ?auto_192011 ?auto_192012 ) ) ( not ( = ?auto_192011 ?auto_192013 ) ) ( not ( = ?auto_192012 ?auto_192013 ) ) ( HOLDING ?auto_192014 ) ( not ( = ?auto_192006 ?auto_192014 ) ) ( not ( = ?auto_192007 ?auto_192014 ) ) ( not ( = ?auto_192008 ?auto_192014 ) ) ( not ( = ?auto_192009 ?auto_192014 ) ) ( not ( = ?auto_192010 ?auto_192014 ) ) ( not ( = ?auto_192011 ?auto_192014 ) ) ( not ( = ?auto_192012 ?auto_192014 ) ) ( not ( = ?auto_192013 ?auto_192014 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_192014 )
      ( MAKE-7PILE ?auto_192006 ?auto_192007 ?auto_192008 ?auto_192009 ?auto_192010 ?auto_192011 ?auto_192012 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192015 - BLOCK
      ?auto_192016 - BLOCK
      ?auto_192017 - BLOCK
      ?auto_192018 - BLOCK
      ?auto_192019 - BLOCK
      ?auto_192020 - BLOCK
      ?auto_192021 - BLOCK
    )
    :vars
    (
      ?auto_192023 - BLOCK
      ?auto_192022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192023 ?auto_192021 ) ( ON-TABLE ?auto_192015 ) ( ON ?auto_192016 ?auto_192015 ) ( ON ?auto_192017 ?auto_192016 ) ( ON ?auto_192018 ?auto_192017 ) ( ON ?auto_192019 ?auto_192018 ) ( ON ?auto_192020 ?auto_192019 ) ( ON ?auto_192021 ?auto_192020 ) ( not ( = ?auto_192015 ?auto_192016 ) ) ( not ( = ?auto_192015 ?auto_192017 ) ) ( not ( = ?auto_192015 ?auto_192018 ) ) ( not ( = ?auto_192015 ?auto_192019 ) ) ( not ( = ?auto_192015 ?auto_192020 ) ) ( not ( = ?auto_192015 ?auto_192021 ) ) ( not ( = ?auto_192015 ?auto_192023 ) ) ( not ( = ?auto_192016 ?auto_192017 ) ) ( not ( = ?auto_192016 ?auto_192018 ) ) ( not ( = ?auto_192016 ?auto_192019 ) ) ( not ( = ?auto_192016 ?auto_192020 ) ) ( not ( = ?auto_192016 ?auto_192021 ) ) ( not ( = ?auto_192016 ?auto_192023 ) ) ( not ( = ?auto_192017 ?auto_192018 ) ) ( not ( = ?auto_192017 ?auto_192019 ) ) ( not ( = ?auto_192017 ?auto_192020 ) ) ( not ( = ?auto_192017 ?auto_192021 ) ) ( not ( = ?auto_192017 ?auto_192023 ) ) ( not ( = ?auto_192018 ?auto_192019 ) ) ( not ( = ?auto_192018 ?auto_192020 ) ) ( not ( = ?auto_192018 ?auto_192021 ) ) ( not ( = ?auto_192018 ?auto_192023 ) ) ( not ( = ?auto_192019 ?auto_192020 ) ) ( not ( = ?auto_192019 ?auto_192021 ) ) ( not ( = ?auto_192019 ?auto_192023 ) ) ( not ( = ?auto_192020 ?auto_192021 ) ) ( not ( = ?auto_192020 ?auto_192023 ) ) ( not ( = ?auto_192021 ?auto_192023 ) ) ( not ( = ?auto_192015 ?auto_192022 ) ) ( not ( = ?auto_192016 ?auto_192022 ) ) ( not ( = ?auto_192017 ?auto_192022 ) ) ( not ( = ?auto_192018 ?auto_192022 ) ) ( not ( = ?auto_192019 ?auto_192022 ) ) ( not ( = ?auto_192020 ?auto_192022 ) ) ( not ( = ?auto_192021 ?auto_192022 ) ) ( not ( = ?auto_192023 ?auto_192022 ) ) ( ON ?auto_192022 ?auto_192023 ) ( CLEAR ?auto_192022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192015 ?auto_192016 ?auto_192017 ?auto_192018 ?auto_192019 ?auto_192020 ?auto_192021 ?auto_192023 )
      ( MAKE-7PILE ?auto_192015 ?auto_192016 ?auto_192017 ?auto_192018 ?auto_192019 ?auto_192020 ?auto_192021 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192026 - BLOCK
      ?auto_192027 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_192027 ) ( CLEAR ?auto_192026 ) ( ON-TABLE ?auto_192026 ) ( not ( = ?auto_192026 ?auto_192027 ) ) )
    :subtasks
    ( ( !STACK ?auto_192027 ?auto_192026 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192028 - BLOCK
      ?auto_192029 - BLOCK
    )
    :vars
    (
      ?auto_192030 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_192028 ) ( ON-TABLE ?auto_192028 ) ( not ( = ?auto_192028 ?auto_192029 ) ) ( ON ?auto_192029 ?auto_192030 ) ( CLEAR ?auto_192029 ) ( HAND-EMPTY ) ( not ( = ?auto_192028 ?auto_192030 ) ) ( not ( = ?auto_192029 ?auto_192030 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192029 ?auto_192030 )
      ( MAKE-2PILE ?auto_192028 ?auto_192029 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192031 - BLOCK
      ?auto_192032 - BLOCK
    )
    :vars
    (
      ?auto_192033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_192031 ?auto_192032 ) ) ( ON ?auto_192032 ?auto_192033 ) ( CLEAR ?auto_192032 ) ( not ( = ?auto_192031 ?auto_192033 ) ) ( not ( = ?auto_192032 ?auto_192033 ) ) ( HOLDING ?auto_192031 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192031 )
      ( MAKE-2PILE ?auto_192031 ?auto_192032 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192034 - BLOCK
      ?auto_192035 - BLOCK
    )
    :vars
    (
      ?auto_192036 - BLOCK
      ?auto_192042 - BLOCK
      ?auto_192041 - BLOCK
      ?auto_192040 - BLOCK
      ?auto_192039 - BLOCK
      ?auto_192037 - BLOCK
      ?auto_192038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_192034 ?auto_192035 ) ) ( ON ?auto_192035 ?auto_192036 ) ( not ( = ?auto_192034 ?auto_192036 ) ) ( not ( = ?auto_192035 ?auto_192036 ) ) ( ON ?auto_192034 ?auto_192035 ) ( CLEAR ?auto_192034 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192042 ) ( ON ?auto_192041 ?auto_192042 ) ( ON ?auto_192040 ?auto_192041 ) ( ON ?auto_192039 ?auto_192040 ) ( ON ?auto_192037 ?auto_192039 ) ( ON ?auto_192038 ?auto_192037 ) ( ON ?auto_192036 ?auto_192038 ) ( not ( = ?auto_192042 ?auto_192041 ) ) ( not ( = ?auto_192042 ?auto_192040 ) ) ( not ( = ?auto_192042 ?auto_192039 ) ) ( not ( = ?auto_192042 ?auto_192037 ) ) ( not ( = ?auto_192042 ?auto_192038 ) ) ( not ( = ?auto_192042 ?auto_192036 ) ) ( not ( = ?auto_192042 ?auto_192035 ) ) ( not ( = ?auto_192042 ?auto_192034 ) ) ( not ( = ?auto_192041 ?auto_192040 ) ) ( not ( = ?auto_192041 ?auto_192039 ) ) ( not ( = ?auto_192041 ?auto_192037 ) ) ( not ( = ?auto_192041 ?auto_192038 ) ) ( not ( = ?auto_192041 ?auto_192036 ) ) ( not ( = ?auto_192041 ?auto_192035 ) ) ( not ( = ?auto_192041 ?auto_192034 ) ) ( not ( = ?auto_192040 ?auto_192039 ) ) ( not ( = ?auto_192040 ?auto_192037 ) ) ( not ( = ?auto_192040 ?auto_192038 ) ) ( not ( = ?auto_192040 ?auto_192036 ) ) ( not ( = ?auto_192040 ?auto_192035 ) ) ( not ( = ?auto_192040 ?auto_192034 ) ) ( not ( = ?auto_192039 ?auto_192037 ) ) ( not ( = ?auto_192039 ?auto_192038 ) ) ( not ( = ?auto_192039 ?auto_192036 ) ) ( not ( = ?auto_192039 ?auto_192035 ) ) ( not ( = ?auto_192039 ?auto_192034 ) ) ( not ( = ?auto_192037 ?auto_192038 ) ) ( not ( = ?auto_192037 ?auto_192036 ) ) ( not ( = ?auto_192037 ?auto_192035 ) ) ( not ( = ?auto_192037 ?auto_192034 ) ) ( not ( = ?auto_192038 ?auto_192036 ) ) ( not ( = ?auto_192038 ?auto_192035 ) ) ( not ( = ?auto_192038 ?auto_192034 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192042 ?auto_192041 ?auto_192040 ?auto_192039 ?auto_192037 ?auto_192038 ?auto_192036 ?auto_192035 )
      ( MAKE-2PILE ?auto_192034 ?auto_192035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192049 - BLOCK
      ?auto_192050 - BLOCK
      ?auto_192051 - BLOCK
      ?auto_192052 - BLOCK
      ?auto_192053 - BLOCK
      ?auto_192054 - BLOCK
    )
    :vars
    (
      ?auto_192055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192055 ?auto_192054 ) ( CLEAR ?auto_192055 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192049 ) ( ON ?auto_192050 ?auto_192049 ) ( ON ?auto_192051 ?auto_192050 ) ( ON ?auto_192052 ?auto_192051 ) ( ON ?auto_192053 ?auto_192052 ) ( ON ?auto_192054 ?auto_192053 ) ( not ( = ?auto_192049 ?auto_192050 ) ) ( not ( = ?auto_192049 ?auto_192051 ) ) ( not ( = ?auto_192049 ?auto_192052 ) ) ( not ( = ?auto_192049 ?auto_192053 ) ) ( not ( = ?auto_192049 ?auto_192054 ) ) ( not ( = ?auto_192049 ?auto_192055 ) ) ( not ( = ?auto_192050 ?auto_192051 ) ) ( not ( = ?auto_192050 ?auto_192052 ) ) ( not ( = ?auto_192050 ?auto_192053 ) ) ( not ( = ?auto_192050 ?auto_192054 ) ) ( not ( = ?auto_192050 ?auto_192055 ) ) ( not ( = ?auto_192051 ?auto_192052 ) ) ( not ( = ?auto_192051 ?auto_192053 ) ) ( not ( = ?auto_192051 ?auto_192054 ) ) ( not ( = ?auto_192051 ?auto_192055 ) ) ( not ( = ?auto_192052 ?auto_192053 ) ) ( not ( = ?auto_192052 ?auto_192054 ) ) ( not ( = ?auto_192052 ?auto_192055 ) ) ( not ( = ?auto_192053 ?auto_192054 ) ) ( not ( = ?auto_192053 ?auto_192055 ) ) ( not ( = ?auto_192054 ?auto_192055 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192055 ?auto_192054 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192056 - BLOCK
      ?auto_192057 - BLOCK
      ?auto_192058 - BLOCK
      ?auto_192059 - BLOCK
      ?auto_192060 - BLOCK
      ?auto_192061 - BLOCK
    )
    :vars
    (
      ?auto_192062 - BLOCK
      ?auto_192063 - BLOCK
      ?auto_192064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192062 ?auto_192061 ) ( CLEAR ?auto_192062 ) ( ON-TABLE ?auto_192056 ) ( ON ?auto_192057 ?auto_192056 ) ( ON ?auto_192058 ?auto_192057 ) ( ON ?auto_192059 ?auto_192058 ) ( ON ?auto_192060 ?auto_192059 ) ( ON ?auto_192061 ?auto_192060 ) ( not ( = ?auto_192056 ?auto_192057 ) ) ( not ( = ?auto_192056 ?auto_192058 ) ) ( not ( = ?auto_192056 ?auto_192059 ) ) ( not ( = ?auto_192056 ?auto_192060 ) ) ( not ( = ?auto_192056 ?auto_192061 ) ) ( not ( = ?auto_192056 ?auto_192062 ) ) ( not ( = ?auto_192057 ?auto_192058 ) ) ( not ( = ?auto_192057 ?auto_192059 ) ) ( not ( = ?auto_192057 ?auto_192060 ) ) ( not ( = ?auto_192057 ?auto_192061 ) ) ( not ( = ?auto_192057 ?auto_192062 ) ) ( not ( = ?auto_192058 ?auto_192059 ) ) ( not ( = ?auto_192058 ?auto_192060 ) ) ( not ( = ?auto_192058 ?auto_192061 ) ) ( not ( = ?auto_192058 ?auto_192062 ) ) ( not ( = ?auto_192059 ?auto_192060 ) ) ( not ( = ?auto_192059 ?auto_192061 ) ) ( not ( = ?auto_192059 ?auto_192062 ) ) ( not ( = ?auto_192060 ?auto_192061 ) ) ( not ( = ?auto_192060 ?auto_192062 ) ) ( not ( = ?auto_192061 ?auto_192062 ) ) ( HOLDING ?auto_192063 ) ( CLEAR ?auto_192064 ) ( not ( = ?auto_192056 ?auto_192063 ) ) ( not ( = ?auto_192056 ?auto_192064 ) ) ( not ( = ?auto_192057 ?auto_192063 ) ) ( not ( = ?auto_192057 ?auto_192064 ) ) ( not ( = ?auto_192058 ?auto_192063 ) ) ( not ( = ?auto_192058 ?auto_192064 ) ) ( not ( = ?auto_192059 ?auto_192063 ) ) ( not ( = ?auto_192059 ?auto_192064 ) ) ( not ( = ?auto_192060 ?auto_192063 ) ) ( not ( = ?auto_192060 ?auto_192064 ) ) ( not ( = ?auto_192061 ?auto_192063 ) ) ( not ( = ?auto_192061 ?auto_192064 ) ) ( not ( = ?auto_192062 ?auto_192063 ) ) ( not ( = ?auto_192062 ?auto_192064 ) ) ( not ( = ?auto_192063 ?auto_192064 ) ) )
    :subtasks
    ( ( !STACK ?auto_192063 ?auto_192064 )
      ( MAKE-6PILE ?auto_192056 ?auto_192057 ?auto_192058 ?auto_192059 ?auto_192060 ?auto_192061 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192065 - BLOCK
      ?auto_192066 - BLOCK
      ?auto_192067 - BLOCK
      ?auto_192068 - BLOCK
      ?auto_192069 - BLOCK
      ?auto_192070 - BLOCK
    )
    :vars
    (
      ?auto_192072 - BLOCK
      ?auto_192073 - BLOCK
      ?auto_192071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192072 ?auto_192070 ) ( ON-TABLE ?auto_192065 ) ( ON ?auto_192066 ?auto_192065 ) ( ON ?auto_192067 ?auto_192066 ) ( ON ?auto_192068 ?auto_192067 ) ( ON ?auto_192069 ?auto_192068 ) ( ON ?auto_192070 ?auto_192069 ) ( not ( = ?auto_192065 ?auto_192066 ) ) ( not ( = ?auto_192065 ?auto_192067 ) ) ( not ( = ?auto_192065 ?auto_192068 ) ) ( not ( = ?auto_192065 ?auto_192069 ) ) ( not ( = ?auto_192065 ?auto_192070 ) ) ( not ( = ?auto_192065 ?auto_192072 ) ) ( not ( = ?auto_192066 ?auto_192067 ) ) ( not ( = ?auto_192066 ?auto_192068 ) ) ( not ( = ?auto_192066 ?auto_192069 ) ) ( not ( = ?auto_192066 ?auto_192070 ) ) ( not ( = ?auto_192066 ?auto_192072 ) ) ( not ( = ?auto_192067 ?auto_192068 ) ) ( not ( = ?auto_192067 ?auto_192069 ) ) ( not ( = ?auto_192067 ?auto_192070 ) ) ( not ( = ?auto_192067 ?auto_192072 ) ) ( not ( = ?auto_192068 ?auto_192069 ) ) ( not ( = ?auto_192068 ?auto_192070 ) ) ( not ( = ?auto_192068 ?auto_192072 ) ) ( not ( = ?auto_192069 ?auto_192070 ) ) ( not ( = ?auto_192069 ?auto_192072 ) ) ( not ( = ?auto_192070 ?auto_192072 ) ) ( CLEAR ?auto_192073 ) ( not ( = ?auto_192065 ?auto_192071 ) ) ( not ( = ?auto_192065 ?auto_192073 ) ) ( not ( = ?auto_192066 ?auto_192071 ) ) ( not ( = ?auto_192066 ?auto_192073 ) ) ( not ( = ?auto_192067 ?auto_192071 ) ) ( not ( = ?auto_192067 ?auto_192073 ) ) ( not ( = ?auto_192068 ?auto_192071 ) ) ( not ( = ?auto_192068 ?auto_192073 ) ) ( not ( = ?auto_192069 ?auto_192071 ) ) ( not ( = ?auto_192069 ?auto_192073 ) ) ( not ( = ?auto_192070 ?auto_192071 ) ) ( not ( = ?auto_192070 ?auto_192073 ) ) ( not ( = ?auto_192072 ?auto_192071 ) ) ( not ( = ?auto_192072 ?auto_192073 ) ) ( not ( = ?auto_192071 ?auto_192073 ) ) ( ON ?auto_192071 ?auto_192072 ) ( CLEAR ?auto_192071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192065 ?auto_192066 ?auto_192067 ?auto_192068 ?auto_192069 ?auto_192070 ?auto_192072 )
      ( MAKE-6PILE ?auto_192065 ?auto_192066 ?auto_192067 ?auto_192068 ?auto_192069 ?auto_192070 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192074 - BLOCK
      ?auto_192075 - BLOCK
      ?auto_192076 - BLOCK
      ?auto_192077 - BLOCK
      ?auto_192078 - BLOCK
      ?auto_192079 - BLOCK
    )
    :vars
    (
      ?auto_192080 - BLOCK
      ?auto_192082 - BLOCK
      ?auto_192081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192080 ?auto_192079 ) ( ON-TABLE ?auto_192074 ) ( ON ?auto_192075 ?auto_192074 ) ( ON ?auto_192076 ?auto_192075 ) ( ON ?auto_192077 ?auto_192076 ) ( ON ?auto_192078 ?auto_192077 ) ( ON ?auto_192079 ?auto_192078 ) ( not ( = ?auto_192074 ?auto_192075 ) ) ( not ( = ?auto_192074 ?auto_192076 ) ) ( not ( = ?auto_192074 ?auto_192077 ) ) ( not ( = ?auto_192074 ?auto_192078 ) ) ( not ( = ?auto_192074 ?auto_192079 ) ) ( not ( = ?auto_192074 ?auto_192080 ) ) ( not ( = ?auto_192075 ?auto_192076 ) ) ( not ( = ?auto_192075 ?auto_192077 ) ) ( not ( = ?auto_192075 ?auto_192078 ) ) ( not ( = ?auto_192075 ?auto_192079 ) ) ( not ( = ?auto_192075 ?auto_192080 ) ) ( not ( = ?auto_192076 ?auto_192077 ) ) ( not ( = ?auto_192076 ?auto_192078 ) ) ( not ( = ?auto_192076 ?auto_192079 ) ) ( not ( = ?auto_192076 ?auto_192080 ) ) ( not ( = ?auto_192077 ?auto_192078 ) ) ( not ( = ?auto_192077 ?auto_192079 ) ) ( not ( = ?auto_192077 ?auto_192080 ) ) ( not ( = ?auto_192078 ?auto_192079 ) ) ( not ( = ?auto_192078 ?auto_192080 ) ) ( not ( = ?auto_192079 ?auto_192080 ) ) ( not ( = ?auto_192074 ?auto_192082 ) ) ( not ( = ?auto_192074 ?auto_192081 ) ) ( not ( = ?auto_192075 ?auto_192082 ) ) ( not ( = ?auto_192075 ?auto_192081 ) ) ( not ( = ?auto_192076 ?auto_192082 ) ) ( not ( = ?auto_192076 ?auto_192081 ) ) ( not ( = ?auto_192077 ?auto_192082 ) ) ( not ( = ?auto_192077 ?auto_192081 ) ) ( not ( = ?auto_192078 ?auto_192082 ) ) ( not ( = ?auto_192078 ?auto_192081 ) ) ( not ( = ?auto_192079 ?auto_192082 ) ) ( not ( = ?auto_192079 ?auto_192081 ) ) ( not ( = ?auto_192080 ?auto_192082 ) ) ( not ( = ?auto_192080 ?auto_192081 ) ) ( not ( = ?auto_192082 ?auto_192081 ) ) ( ON ?auto_192082 ?auto_192080 ) ( CLEAR ?auto_192082 ) ( HOLDING ?auto_192081 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192081 )
      ( MAKE-6PILE ?auto_192074 ?auto_192075 ?auto_192076 ?auto_192077 ?auto_192078 ?auto_192079 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192083 - BLOCK
      ?auto_192084 - BLOCK
      ?auto_192085 - BLOCK
      ?auto_192086 - BLOCK
      ?auto_192087 - BLOCK
      ?auto_192088 - BLOCK
    )
    :vars
    (
      ?auto_192090 - BLOCK
      ?auto_192089 - BLOCK
      ?auto_192091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192090 ?auto_192088 ) ( ON-TABLE ?auto_192083 ) ( ON ?auto_192084 ?auto_192083 ) ( ON ?auto_192085 ?auto_192084 ) ( ON ?auto_192086 ?auto_192085 ) ( ON ?auto_192087 ?auto_192086 ) ( ON ?auto_192088 ?auto_192087 ) ( not ( = ?auto_192083 ?auto_192084 ) ) ( not ( = ?auto_192083 ?auto_192085 ) ) ( not ( = ?auto_192083 ?auto_192086 ) ) ( not ( = ?auto_192083 ?auto_192087 ) ) ( not ( = ?auto_192083 ?auto_192088 ) ) ( not ( = ?auto_192083 ?auto_192090 ) ) ( not ( = ?auto_192084 ?auto_192085 ) ) ( not ( = ?auto_192084 ?auto_192086 ) ) ( not ( = ?auto_192084 ?auto_192087 ) ) ( not ( = ?auto_192084 ?auto_192088 ) ) ( not ( = ?auto_192084 ?auto_192090 ) ) ( not ( = ?auto_192085 ?auto_192086 ) ) ( not ( = ?auto_192085 ?auto_192087 ) ) ( not ( = ?auto_192085 ?auto_192088 ) ) ( not ( = ?auto_192085 ?auto_192090 ) ) ( not ( = ?auto_192086 ?auto_192087 ) ) ( not ( = ?auto_192086 ?auto_192088 ) ) ( not ( = ?auto_192086 ?auto_192090 ) ) ( not ( = ?auto_192087 ?auto_192088 ) ) ( not ( = ?auto_192087 ?auto_192090 ) ) ( not ( = ?auto_192088 ?auto_192090 ) ) ( not ( = ?auto_192083 ?auto_192089 ) ) ( not ( = ?auto_192083 ?auto_192091 ) ) ( not ( = ?auto_192084 ?auto_192089 ) ) ( not ( = ?auto_192084 ?auto_192091 ) ) ( not ( = ?auto_192085 ?auto_192089 ) ) ( not ( = ?auto_192085 ?auto_192091 ) ) ( not ( = ?auto_192086 ?auto_192089 ) ) ( not ( = ?auto_192086 ?auto_192091 ) ) ( not ( = ?auto_192087 ?auto_192089 ) ) ( not ( = ?auto_192087 ?auto_192091 ) ) ( not ( = ?auto_192088 ?auto_192089 ) ) ( not ( = ?auto_192088 ?auto_192091 ) ) ( not ( = ?auto_192090 ?auto_192089 ) ) ( not ( = ?auto_192090 ?auto_192091 ) ) ( not ( = ?auto_192089 ?auto_192091 ) ) ( ON ?auto_192089 ?auto_192090 ) ( ON ?auto_192091 ?auto_192089 ) ( CLEAR ?auto_192091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192083 ?auto_192084 ?auto_192085 ?auto_192086 ?auto_192087 ?auto_192088 ?auto_192090 ?auto_192089 )
      ( MAKE-6PILE ?auto_192083 ?auto_192084 ?auto_192085 ?auto_192086 ?auto_192087 ?auto_192088 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192095 - BLOCK
      ?auto_192096 - BLOCK
      ?auto_192097 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_192097 ) ( CLEAR ?auto_192096 ) ( ON-TABLE ?auto_192095 ) ( ON ?auto_192096 ?auto_192095 ) ( not ( = ?auto_192095 ?auto_192096 ) ) ( not ( = ?auto_192095 ?auto_192097 ) ) ( not ( = ?auto_192096 ?auto_192097 ) ) )
    :subtasks
    ( ( !STACK ?auto_192097 ?auto_192096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192098 - BLOCK
      ?auto_192099 - BLOCK
      ?auto_192100 - BLOCK
    )
    :vars
    (
      ?auto_192101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_192099 ) ( ON-TABLE ?auto_192098 ) ( ON ?auto_192099 ?auto_192098 ) ( not ( = ?auto_192098 ?auto_192099 ) ) ( not ( = ?auto_192098 ?auto_192100 ) ) ( not ( = ?auto_192099 ?auto_192100 ) ) ( ON ?auto_192100 ?auto_192101 ) ( CLEAR ?auto_192100 ) ( HAND-EMPTY ) ( not ( = ?auto_192098 ?auto_192101 ) ) ( not ( = ?auto_192099 ?auto_192101 ) ) ( not ( = ?auto_192100 ?auto_192101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192100 ?auto_192101 )
      ( MAKE-3PILE ?auto_192098 ?auto_192099 ?auto_192100 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192102 - BLOCK
      ?auto_192103 - BLOCK
      ?auto_192104 - BLOCK
    )
    :vars
    (
      ?auto_192105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192102 ) ( not ( = ?auto_192102 ?auto_192103 ) ) ( not ( = ?auto_192102 ?auto_192104 ) ) ( not ( = ?auto_192103 ?auto_192104 ) ) ( ON ?auto_192104 ?auto_192105 ) ( CLEAR ?auto_192104 ) ( not ( = ?auto_192102 ?auto_192105 ) ) ( not ( = ?auto_192103 ?auto_192105 ) ) ( not ( = ?auto_192104 ?auto_192105 ) ) ( HOLDING ?auto_192103 ) ( CLEAR ?auto_192102 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192102 ?auto_192103 )
      ( MAKE-3PILE ?auto_192102 ?auto_192103 ?auto_192104 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192106 - BLOCK
      ?auto_192107 - BLOCK
      ?auto_192108 - BLOCK
    )
    :vars
    (
      ?auto_192109 - BLOCK
      ?auto_192114 - BLOCK
      ?auto_192113 - BLOCK
      ?auto_192110 - BLOCK
      ?auto_192111 - BLOCK
      ?auto_192112 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192106 ) ( not ( = ?auto_192106 ?auto_192107 ) ) ( not ( = ?auto_192106 ?auto_192108 ) ) ( not ( = ?auto_192107 ?auto_192108 ) ) ( ON ?auto_192108 ?auto_192109 ) ( not ( = ?auto_192106 ?auto_192109 ) ) ( not ( = ?auto_192107 ?auto_192109 ) ) ( not ( = ?auto_192108 ?auto_192109 ) ) ( CLEAR ?auto_192106 ) ( ON ?auto_192107 ?auto_192108 ) ( CLEAR ?auto_192107 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192114 ) ( ON ?auto_192113 ?auto_192114 ) ( ON ?auto_192110 ?auto_192113 ) ( ON ?auto_192111 ?auto_192110 ) ( ON ?auto_192112 ?auto_192111 ) ( ON ?auto_192109 ?auto_192112 ) ( not ( = ?auto_192114 ?auto_192113 ) ) ( not ( = ?auto_192114 ?auto_192110 ) ) ( not ( = ?auto_192114 ?auto_192111 ) ) ( not ( = ?auto_192114 ?auto_192112 ) ) ( not ( = ?auto_192114 ?auto_192109 ) ) ( not ( = ?auto_192114 ?auto_192108 ) ) ( not ( = ?auto_192114 ?auto_192107 ) ) ( not ( = ?auto_192113 ?auto_192110 ) ) ( not ( = ?auto_192113 ?auto_192111 ) ) ( not ( = ?auto_192113 ?auto_192112 ) ) ( not ( = ?auto_192113 ?auto_192109 ) ) ( not ( = ?auto_192113 ?auto_192108 ) ) ( not ( = ?auto_192113 ?auto_192107 ) ) ( not ( = ?auto_192110 ?auto_192111 ) ) ( not ( = ?auto_192110 ?auto_192112 ) ) ( not ( = ?auto_192110 ?auto_192109 ) ) ( not ( = ?auto_192110 ?auto_192108 ) ) ( not ( = ?auto_192110 ?auto_192107 ) ) ( not ( = ?auto_192111 ?auto_192112 ) ) ( not ( = ?auto_192111 ?auto_192109 ) ) ( not ( = ?auto_192111 ?auto_192108 ) ) ( not ( = ?auto_192111 ?auto_192107 ) ) ( not ( = ?auto_192112 ?auto_192109 ) ) ( not ( = ?auto_192112 ?auto_192108 ) ) ( not ( = ?auto_192112 ?auto_192107 ) ) ( not ( = ?auto_192106 ?auto_192114 ) ) ( not ( = ?auto_192106 ?auto_192113 ) ) ( not ( = ?auto_192106 ?auto_192110 ) ) ( not ( = ?auto_192106 ?auto_192111 ) ) ( not ( = ?auto_192106 ?auto_192112 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192114 ?auto_192113 ?auto_192110 ?auto_192111 ?auto_192112 ?auto_192109 ?auto_192108 )
      ( MAKE-3PILE ?auto_192106 ?auto_192107 ?auto_192108 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192115 - BLOCK
      ?auto_192116 - BLOCK
      ?auto_192117 - BLOCK
    )
    :vars
    (
      ?auto_192120 - BLOCK
      ?auto_192121 - BLOCK
      ?auto_192118 - BLOCK
      ?auto_192119 - BLOCK
      ?auto_192123 - BLOCK
      ?auto_192122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_192115 ?auto_192116 ) ) ( not ( = ?auto_192115 ?auto_192117 ) ) ( not ( = ?auto_192116 ?auto_192117 ) ) ( ON ?auto_192117 ?auto_192120 ) ( not ( = ?auto_192115 ?auto_192120 ) ) ( not ( = ?auto_192116 ?auto_192120 ) ) ( not ( = ?auto_192117 ?auto_192120 ) ) ( ON ?auto_192116 ?auto_192117 ) ( CLEAR ?auto_192116 ) ( ON-TABLE ?auto_192121 ) ( ON ?auto_192118 ?auto_192121 ) ( ON ?auto_192119 ?auto_192118 ) ( ON ?auto_192123 ?auto_192119 ) ( ON ?auto_192122 ?auto_192123 ) ( ON ?auto_192120 ?auto_192122 ) ( not ( = ?auto_192121 ?auto_192118 ) ) ( not ( = ?auto_192121 ?auto_192119 ) ) ( not ( = ?auto_192121 ?auto_192123 ) ) ( not ( = ?auto_192121 ?auto_192122 ) ) ( not ( = ?auto_192121 ?auto_192120 ) ) ( not ( = ?auto_192121 ?auto_192117 ) ) ( not ( = ?auto_192121 ?auto_192116 ) ) ( not ( = ?auto_192118 ?auto_192119 ) ) ( not ( = ?auto_192118 ?auto_192123 ) ) ( not ( = ?auto_192118 ?auto_192122 ) ) ( not ( = ?auto_192118 ?auto_192120 ) ) ( not ( = ?auto_192118 ?auto_192117 ) ) ( not ( = ?auto_192118 ?auto_192116 ) ) ( not ( = ?auto_192119 ?auto_192123 ) ) ( not ( = ?auto_192119 ?auto_192122 ) ) ( not ( = ?auto_192119 ?auto_192120 ) ) ( not ( = ?auto_192119 ?auto_192117 ) ) ( not ( = ?auto_192119 ?auto_192116 ) ) ( not ( = ?auto_192123 ?auto_192122 ) ) ( not ( = ?auto_192123 ?auto_192120 ) ) ( not ( = ?auto_192123 ?auto_192117 ) ) ( not ( = ?auto_192123 ?auto_192116 ) ) ( not ( = ?auto_192122 ?auto_192120 ) ) ( not ( = ?auto_192122 ?auto_192117 ) ) ( not ( = ?auto_192122 ?auto_192116 ) ) ( not ( = ?auto_192115 ?auto_192121 ) ) ( not ( = ?auto_192115 ?auto_192118 ) ) ( not ( = ?auto_192115 ?auto_192119 ) ) ( not ( = ?auto_192115 ?auto_192123 ) ) ( not ( = ?auto_192115 ?auto_192122 ) ) ( HOLDING ?auto_192115 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192115 )
      ( MAKE-3PILE ?auto_192115 ?auto_192116 ?auto_192117 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192124 - BLOCK
      ?auto_192125 - BLOCK
      ?auto_192126 - BLOCK
    )
    :vars
    (
      ?auto_192132 - BLOCK
      ?auto_192127 - BLOCK
      ?auto_192130 - BLOCK
      ?auto_192128 - BLOCK
      ?auto_192129 - BLOCK
      ?auto_192131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_192124 ?auto_192125 ) ) ( not ( = ?auto_192124 ?auto_192126 ) ) ( not ( = ?auto_192125 ?auto_192126 ) ) ( ON ?auto_192126 ?auto_192132 ) ( not ( = ?auto_192124 ?auto_192132 ) ) ( not ( = ?auto_192125 ?auto_192132 ) ) ( not ( = ?auto_192126 ?auto_192132 ) ) ( ON ?auto_192125 ?auto_192126 ) ( ON-TABLE ?auto_192127 ) ( ON ?auto_192130 ?auto_192127 ) ( ON ?auto_192128 ?auto_192130 ) ( ON ?auto_192129 ?auto_192128 ) ( ON ?auto_192131 ?auto_192129 ) ( ON ?auto_192132 ?auto_192131 ) ( not ( = ?auto_192127 ?auto_192130 ) ) ( not ( = ?auto_192127 ?auto_192128 ) ) ( not ( = ?auto_192127 ?auto_192129 ) ) ( not ( = ?auto_192127 ?auto_192131 ) ) ( not ( = ?auto_192127 ?auto_192132 ) ) ( not ( = ?auto_192127 ?auto_192126 ) ) ( not ( = ?auto_192127 ?auto_192125 ) ) ( not ( = ?auto_192130 ?auto_192128 ) ) ( not ( = ?auto_192130 ?auto_192129 ) ) ( not ( = ?auto_192130 ?auto_192131 ) ) ( not ( = ?auto_192130 ?auto_192132 ) ) ( not ( = ?auto_192130 ?auto_192126 ) ) ( not ( = ?auto_192130 ?auto_192125 ) ) ( not ( = ?auto_192128 ?auto_192129 ) ) ( not ( = ?auto_192128 ?auto_192131 ) ) ( not ( = ?auto_192128 ?auto_192132 ) ) ( not ( = ?auto_192128 ?auto_192126 ) ) ( not ( = ?auto_192128 ?auto_192125 ) ) ( not ( = ?auto_192129 ?auto_192131 ) ) ( not ( = ?auto_192129 ?auto_192132 ) ) ( not ( = ?auto_192129 ?auto_192126 ) ) ( not ( = ?auto_192129 ?auto_192125 ) ) ( not ( = ?auto_192131 ?auto_192132 ) ) ( not ( = ?auto_192131 ?auto_192126 ) ) ( not ( = ?auto_192131 ?auto_192125 ) ) ( not ( = ?auto_192124 ?auto_192127 ) ) ( not ( = ?auto_192124 ?auto_192130 ) ) ( not ( = ?auto_192124 ?auto_192128 ) ) ( not ( = ?auto_192124 ?auto_192129 ) ) ( not ( = ?auto_192124 ?auto_192131 ) ) ( ON ?auto_192124 ?auto_192125 ) ( CLEAR ?auto_192124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192127 ?auto_192130 ?auto_192128 ?auto_192129 ?auto_192131 ?auto_192132 ?auto_192126 ?auto_192125 )
      ( MAKE-3PILE ?auto_192124 ?auto_192125 ?auto_192126 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192138 - BLOCK
      ?auto_192139 - BLOCK
      ?auto_192140 - BLOCK
      ?auto_192141 - BLOCK
      ?auto_192142 - BLOCK
    )
    :vars
    (
      ?auto_192143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192143 ?auto_192142 ) ( CLEAR ?auto_192143 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192138 ) ( ON ?auto_192139 ?auto_192138 ) ( ON ?auto_192140 ?auto_192139 ) ( ON ?auto_192141 ?auto_192140 ) ( ON ?auto_192142 ?auto_192141 ) ( not ( = ?auto_192138 ?auto_192139 ) ) ( not ( = ?auto_192138 ?auto_192140 ) ) ( not ( = ?auto_192138 ?auto_192141 ) ) ( not ( = ?auto_192138 ?auto_192142 ) ) ( not ( = ?auto_192138 ?auto_192143 ) ) ( not ( = ?auto_192139 ?auto_192140 ) ) ( not ( = ?auto_192139 ?auto_192141 ) ) ( not ( = ?auto_192139 ?auto_192142 ) ) ( not ( = ?auto_192139 ?auto_192143 ) ) ( not ( = ?auto_192140 ?auto_192141 ) ) ( not ( = ?auto_192140 ?auto_192142 ) ) ( not ( = ?auto_192140 ?auto_192143 ) ) ( not ( = ?auto_192141 ?auto_192142 ) ) ( not ( = ?auto_192141 ?auto_192143 ) ) ( not ( = ?auto_192142 ?auto_192143 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192143 ?auto_192142 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192144 - BLOCK
      ?auto_192145 - BLOCK
      ?auto_192146 - BLOCK
      ?auto_192147 - BLOCK
      ?auto_192148 - BLOCK
    )
    :vars
    (
      ?auto_192149 - BLOCK
      ?auto_192150 - BLOCK
      ?auto_192151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192149 ?auto_192148 ) ( CLEAR ?auto_192149 ) ( ON-TABLE ?auto_192144 ) ( ON ?auto_192145 ?auto_192144 ) ( ON ?auto_192146 ?auto_192145 ) ( ON ?auto_192147 ?auto_192146 ) ( ON ?auto_192148 ?auto_192147 ) ( not ( = ?auto_192144 ?auto_192145 ) ) ( not ( = ?auto_192144 ?auto_192146 ) ) ( not ( = ?auto_192144 ?auto_192147 ) ) ( not ( = ?auto_192144 ?auto_192148 ) ) ( not ( = ?auto_192144 ?auto_192149 ) ) ( not ( = ?auto_192145 ?auto_192146 ) ) ( not ( = ?auto_192145 ?auto_192147 ) ) ( not ( = ?auto_192145 ?auto_192148 ) ) ( not ( = ?auto_192145 ?auto_192149 ) ) ( not ( = ?auto_192146 ?auto_192147 ) ) ( not ( = ?auto_192146 ?auto_192148 ) ) ( not ( = ?auto_192146 ?auto_192149 ) ) ( not ( = ?auto_192147 ?auto_192148 ) ) ( not ( = ?auto_192147 ?auto_192149 ) ) ( not ( = ?auto_192148 ?auto_192149 ) ) ( HOLDING ?auto_192150 ) ( CLEAR ?auto_192151 ) ( not ( = ?auto_192144 ?auto_192150 ) ) ( not ( = ?auto_192144 ?auto_192151 ) ) ( not ( = ?auto_192145 ?auto_192150 ) ) ( not ( = ?auto_192145 ?auto_192151 ) ) ( not ( = ?auto_192146 ?auto_192150 ) ) ( not ( = ?auto_192146 ?auto_192151 ) ) ( not ( = ?auto_192147 ?auto_192150 ) ) ( not ( = ?auto_192147 ?auto_192151 ) ) ( not ( = ?auto_192148 ?auto_192150 ) ) ( not ( = ?auto_192148 ?auto_192151 ) ) ( not ( = ?auto_192149 ?auto_192150 ) ) ( not ( = ?auto_192149 ?auto_192151 ) ) ( not ( = ?auto_192150 ?auto_192151 ) ) )
    :subtasks
    ( ( !STACK ?auto_192150 ?auto_192151 )
      ( MAKE-5PILE ?auto_192144 ?auto_192145 ?auto_192146 ?auto_192147 ?auto_192148 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192152 - BLOCK
      ?auto_192153 - BLOCK
      ?auto_192154 - BLOCK
      ?auto_192155 - BLOCK
      ?auto_192156 - BLOCK
    )
    :vars
    (
      ?auto_192158 - BLOCK
      ?auto_192159 - BLOCK
      ?auto_192157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192158 ?auto_192156 ) ( ON-TABLE ?auto_192152 ) ( ON ?auto_192153 ?auto_192152 ) ( ON ?auto_192154 ?auto_192153 ) ( ON ?auto_192155 ?auto_192154 ) ( ON ?auto_192156 ?auto_192155 ) ( not ( = ?auto_192152 ?auto_192153 ) ) ( not ( = ?auto_192152 ?auto_192154 ) ) ( not ( = ?auto_192152 ?auto_192155 ) ) ( not ( = ?auto_192152 ?auto_192156 ) ) ( not ( = ?auto_192152 ?auto_192158 ) ) ( not ( = ?auto_192153 ?auto_192154 ) ) ( not ( = ?auto_192153 ?auto_192155 ) ) ( not ( = ?auto_192153 ?auto_192156 ) ) ( not ( = ?auto_192153 ?auto_192158 ) ) ( not ( = ?auto_192154 ?auto_192155 ) ) ( not ( = ?auto_192154 ?auto_192156 ) ) ( not ( = ?auto_192154 ?auto_192158 ) ) ( not ( = ?auto_192155 ?auto_192156 ) ) ( not ( = ?auto_192155 ?auto_192158 ) ) ( not ( = ?auto_192156 ?auto_192158 ) ) ( CLEAR ?auto_192159 ) ( not ( = ?auto_192152 ?auto_192157 ) ) ( not ( = ?auto_192152 ?auto_192159 ) ) ( not ( = ?auto_192153 ?auto_192157 ) ) ( not ( = ?auto_192153 ?auto_192159 ) ) ( not ( = ?auto_192154 ?auto_192157 ) ) ( not ( = ?auto_192154 ?auto_192159 ) ) ( not ( = ?auto_192155 ?auto_192157 ) ) ( not ( = ?auto_192155 ?auto_192159 ) ) ( not ( = ?auto_192156 ?auto_192157 ) ) ( not ( = ?auto_192156 ?auto_192159 ) ) ( not ( = ?auto_192158 ?auto_192157 ) ) ( not ( = ?auto_192158 ?auto_192159 ) ) ( not ( = ?auto_192157 ?auto_192159 ) ) ( ON ?auto_192157 ?auto_192158 ) ( CLEAR ?auto_192157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192152 ?auto_192153 ?auto_192154 ?auto_192155 ?auto_192156 ?auto_192158 )
      ( MAKE-5PILE ?auto_192152 ?auto_192153 ?auto_192154 ?auto_192155 ?auto_192156 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192160 - BLOCK
      ?auto_192161 - BLOCK
      ?auto_192162 - BLOCK
      ?auto_192163 - BLOCK
      ?auto_192164 - BLOCK
    )
    :vars
    (
      ?auto_192167 - BLOCK
      ?auto_192165 - BLOCK
      ?auto_192166 - BLOCK
      ?auto_192168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192167 ?auto_192164 ) ( ON-TABLE ?auto_192160 ) ( ON ?auto_192161 ?auto_192160 ) ( ON ?auto_192162 ?auto_192161 ) ( ON ?auto_192163 ?auto_192162 ) ( ON ?auto_192164 ?auto_192163 ) ( not ( = ?auto_192160 ?auto_192161 ) ) ( not ( = ?auto_192160 ?auto_192162 ) ) ( not ( = ?auto_192160 ?auto_192163 ) ) ( not ( = ?auto_192160 ?auto_192164 ) ) ( not ( = ?auto_192160 ?auto_192167 ) ) ( not ( = ?auto_192161 ?auto_192162 ) ) ( not ( = ?auto_192161 ?auto_192163 ) ) ( not ( = ?auto_192161 ?auto_192164 ) ) ( not ( = ?auto_192161 ?auto_192167 ) ) ( not ( = ?auto_192162 ?auto_192163 ) ) ( not ( = ?auto_192162 ?auto_192164 ) ) ( not ( = ?auto_192162 ?auto_192167 ) ) ( not ( = ?auto_192163 ?auto_192164 ) ) ( not ( = ?auto_192163 ?auto_192167 ) ) ( not ( = ?auto_192164 ?auto_192167 ) ) ( not ( = ?auto_192160 ?auto_192165 ) ) ( not ( = ?auto_192160 ?auto_192166 ) ) ( not ( = ?auto_192161 ?auto_192165 ) ) ( not ( = ?auto_192161 ?auto_192166 ) ) ( not ( = ?auto_192162 ?auto_192165 ) ) ( not ( = ?auto_192162 ?auto_192166 ) ) ( not ( = ?auto_192163 ?auto_192165 ) ) ( not ( = ?auto_192163 ?auto_192166 ) ) ( not ( = ?auto_192164 ?auto_192165 ) ) ( not ( = ?auto_192164 ?auto_192166 ) ) ( not ( = ?auto_192167 ?auto_192165 ) ) ( not ( = ?auto_192167 ?auto_192166 ) ) ( not ( = ?auto_192165 ?auto_192166 ) ) ( ON ?auto_192165 ?auto_192167 ) ( CLEAR ?auto_192165 ) ( HOLDING ?auto_192166 ) ( CLEAR ?auto_192168 ) ( ON-TABLE ?auto_192168 ) ( not ( = ?auto_192168 ?auto_192166 ) ) ( not ( = ?auto_192160 ?auto_192168 ) ) ( not ( = ?auto_192161 ?auto_192168 ) ) ( not ( = ?auto_192162 ?auto_192168 ) ) ( not ( = ?auto_192163 ?auto_192168 ) ) ( not ( = ?auto_192164 ?auto_192168 ) ) ( not ( = ?auto_192167 ?auto_192168 ) ) ( not ( = ?auto_192165 ?auto_192168 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192168 ?auto_192166 )
      ( MAKE-5PILE ?auto_192160 ?auto_192161 ?auto_192162 ?auto_192163 ?auto_192164 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192169 - BLOCK
      ?auto_192170 - BLOCK
      ?auto_192171 - BLOCK
      ?auto_192172 - BLOCK
      ?auto_192173 - BLOCK
    )
    :vars
    (
      ?auto_192176 - BLOCK
      ?auto_192177 - BLOCK
      ?auto_192174 - BLOCK
      ?auto_192175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192176 ?auto_192173 ) ( ON-TABLE ?auto_192169 ) ( ON ?auto_192170 ?auto_192169 ) ( ON ?auto_192171 ?auto_192170 ) ( ON ?auto_192172 ?auto_192171 ) ( ON ?auto_192173 ?auto_192172 ) ( not ( = ?auto_192169 ?auto_192170 ) ) ( not ( = ?auto_192169 ?auto_192171 ) ) ( not ( = ?auto_192169 ?auto_192172 ) ) ( not ( = ?auto_192169 ?auto_192173 ) ) ( not ( = ?auto_192169 ?auto_192176 ) ) ( not ( = ?auto_192170 ?auto_192171 ) ) ( not ( = ?auto_192170 ?auto_192172 ) ) ( not ( = ?auto_192170 ?auto_192173 ) ) ( not ( = ?auto_192170 ?auto_192176 ) ) ( not ( = ?auto_192171 ?auto_192172 ) ) ( not ( = ?auto_192171 ?auto_192173 ) ) ( not ( = ?auto_192171 ?auto_192176 ) ) ( not ( = ?auto_192172 ?auto_192173 ) ) ( not ( = ?auto_192172 ?auto_192176 ) ) ( not ( = ?auto_192173 ?auto_192176 ) ) ( not ( = ?auto_192169 ?auto_192177 ) ) ( not ( = ?auto_192169 ?auto_192174 ) ) ( not ( = ?auto_192170 ?auto_192177 ) ) ( not ( = ?auto_192170 ?auto_192174 ) ) ( not ( = ?auto_192171 ?auto_192177 ) ) ( not ( = ?auto_192171 ?auto_192174 ) ) ( not ( = ?auto_192172 ?auto_192177 ) ) ( not ( = ?auto_192172 ?auto_192174 ) ) ( not ( = ?auto_192173 ?auto_192177 ) ) ( not ( = ?auto_192173 ?auto_192174 ) ) ( not ( = ?auto_192176 ?auto_192177 ) ) ( not ( = ?auto_192176 ?auto_192174 ) ) ( not ( = ?auto_192177 ?auto_192174 ) ) ( ON ?auto_192177 ?auto_192176 ) ( CLEAR ?auto_192175 ) ( ON-TABLE ?auto_192175 ) ( not ( = ?auto_192175 ?auto_192174 ) ) ( not ( = ?auto_192169 ?auto_192175 ) ) ( not ( = ?auto_192170 ?auto_192175 ) ) ( not ( = ?auto_192171 ?auto_192175 ) ) ( not ( = ?auto_192172 ?auto_192175 ) ) ( not ( = ?auto_192173 ?auto_192175 ) ) ( not ( = ?auto_192176 ?auto_192175 ) ) ( not ( = ?auto_192177 ?auto_192175 ) ) ( ON ?auto_192174 ?auto_192177 ) ( CLEAR ?auto_192174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192169 ?auto_192170 ?auto_192171 ?auto_192172 ?auto_192173 ?auto_192176 ?auto_192177 )
      ( MAKE-5PILE ?auto_192169 ?auto_192170 ?auto_192171 ?auto_192172 ?auto_192173 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192178 - BLOCK
      ?auto_192179 - BLOCK
      ?auto_192180 - BLOCK
      ?auto_192181 - BLOCK
      ?auto_192182 - BLOCK
    )
    :vars
    (
      ?auto_192184 - BLOCK
      ?auto_192186 - BLOCK
      ?auto_192185 - BLOCK
      ?auto_192183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192184 ?auto_192182 ) ( ON-TABLE ?auto_192178 ) ( ON ?auto_192179 ?auto_192178 ) ( ON ?auto_192180 ?auto_192179 ) ( ON ?auto_192181 ?auto_192180 ) ( ON ?auto_192182 ?auto_192181 ) ( not ( = ?auto_192178 ?auto_192179 ) ) ( not ( = ?auto_192178 ?auto_192180 ) ) ( not ( = ?auto_192178 ?auto_192181 ) ) ( not ( = ?auto_192178 ?auto_192182 ) ) ( not ( = ?auto_192178 ?auto_192184 ) ) ( not ( = ?auto_192179 ?auto_192180 ) ) ( not ( = ?auto_192179 ?auto_192181 ) ) ( not ( = ?auto_192179 ?auto_192182 ) ) ( not ( = ?auto_192179 ?auto_192184 ) ) ( not ( = ?auto_192180 ?auto_192181 ) ) ( not ( = ?auto_192180 ?auto_192182 ) ) ( not ( = ?auto_192180 ?auto_192184 ) ) ( not ( = ?auto_192181 ?auto_192182 ) ) ( not ( = ?auto_192181 ?auto_192184 ) ) ( not ( = ?auto_192182 ?auto_192184 ) ) ( not ( = ?auto_192178 ?auto_192186 ) ) ( not ( = ?auto_192178 ?auto_192185 ) ) ( not ( = ?auto_192179 ?auto_192186 ) ) ( not ( = ?auto_192179 ?auto_192185 ) ) ( not ( = ?auto_192180 ?auto_192186 ) ) ( not ( = ?auto_192180 ?auto_192185 ) ) ( not ( = ?auto_192181 ?auto_192186 ) ) ( not ( = ?auto_192181 ?auto_192185 ) ) ( not ( = ?auto_192182 ?auto_192186 ) ) ( not ( = ?auto_192182 ?auto_192185 ) ) ( not ( = ?auto_192184 ?auto_192186 ) ) ( not ( = ?auto_192184 ?auto_192185 ) ) ( not ( = ?auto_192186 ?auto_192185 ) ) ( ON ?auto_192186 ?auto_192184 ) ( not ( = ?auto_192183 ?auto_192185 ) ) ( not ( = ?auto_192178 ?auto_192183 ) ) ( not ( = ?auto_192179 ?auto_192183 ) ) ( not ( = ?auto_192180 ?auto_192183 ) ) ( not ( = ?auto_192181 ?auto_192183 ) ) ( not ( = ?auto_192182 ?auto_192183 ) ) ( not ( = ?auto_192184 ?auto_192183 ) ) ( not ( = ?auto_192186 ?auto_192183 ) ) ( ON ?auto_192185 ?auto_192186 ) ( CLEAR ?auto_192185 ) ( HOLDING ?auto_192183 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192183 )
      ( MAKE-5PILE ?auto_192178 ?auto_192179 ?auto_192180 ?auto_192181 ?auto_192182 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192187 - BLOCK
      ?auto_192188 - BLOCK
      ?auto_192189 - BLOCK
      ?auto_192190 - BLOCK
      ?auto_192191 - BLOCK
    )
    :vars
    (
      ?auto_192192 - BLOCK
      ?auto_192193 - BLOCK
      ?auto_192195 - BLOCK
      ?auto_192194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192192 ?auto_192191 ) ( ON-TABLE ?auto_192187 ) ( ON ?auto_192188 ?auto_192187 ) ( ON ?auto_192189 ?auto_192188 ) ( ON ?auto_192190 ?auto_192189 ) ( ON ?auto_192191 ?auto_192190 ) ( not ( = ?auto_192187 ?auto_192188 ) ) ( not ( = ?auto_192187 ?auto_192189 ) ) ( not ( = ?auto_192187 ?auto_192190 ) ) ( not ( = ?auto_192187 ?auto_192191 ) ) ( not ( = ?auto_192187 ?auto_192192 ) ) ( not ( = ?auto_192188 ?auto_192189 ) ) ( not ( = ?auto_192188 ?auto_192190 ) ) ( not ( = ?auto_192188 ?auto_192191 ) ) ( not ( = ?auto_192188 ?auto_192192 ) ) ( not ( = ?auto_192189 ?auto_192190 ) ) ( not ( = ?auto_192189 ?auto_192191 ) ) ( not ( = ?auto_192189 ?auto_192192 ) ) ( not ( = ?auto_192190 ?auto_192191 ) ) ( not ( = ?auto_192190 ?auto_192192 ) ) ( not ( = ?auto_192191 ?auto_192192 ) ) ( not ( = ?auto_192187 ?auto_192193 ) ) ( not ( = ?auto_192187 ?auto_192195 ) ) ( not ( = ?auto_192188 ?auto_192193 ) ) ( not ( = ?auto_192188 ?auto_192195 ) ) ( not ( = ?auto_192189 ?auto_192193 ) ) ( not ( = ?auto_192189 ?auto_192195 ) ) ( not ( = ?auto_192190 ?auto_192193 ) ) ( not ( = ?auto_192190 ?auto_192195 ) ) ( not ( = ?auto_192191 ?auto_192193 ) ) ( not ( = ?auto_192191 ?auto_192195 ) ) ( not ( = ?auto_192192 ?auto_192193 ) ) ( not ( = ?auto_192192 ?auto_192195 ) ) ( not ( = ?auto_192193 ?auto_192195 ) ) ( ON ?auto_192193 ?auto_192192 ) ( not ( = ?auto_192194 ?auto_192195 ) ) ( not ( = ?auto_192187 ?auto_192194 ) ) ( not ( = ?auto_192188 ?auto_192194 ) ) ( not ( = ?auto_192189 ?auto_192194 ) ) ( not ( = ?auto_192190 ?auto_192194 ) ) ( not ( = ?auto_192191 ?auto_192194 ) ) ( not ( = ?auto_192192 ?auto_192194 ) ) ( not ( = ?auto_192193 ?auto_192194 ) ) ( ON ?auto_192195 ?auto_192193 ) ( ON ?auto_192194 ?auto_192195 ) ( CLEAR ?auto_192194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192187 ?auto_192188 ?auto_192189 ?auto_192190 ?auto_192191 ?auto_192192 ?auto_192193 ?auto_192195 )
      ( MAKE-5PILE ?auto_192187 ?auto_192188 ?auto_192189 ?auto_192190 ?auto_192191 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192200 - BLOCK
      ?auto_192201 - BLOCK
      ?auto_192202 - BLOCK
      ?auto_192203 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_192203 ) ( CLEAR ?auto_192202 ) ( ON-TABLE ?auto_192200 ) ( ON ?auto_192201 ?auto_192200 ) ( ON ?auto_192202 ?auto_192201 ) ( not ( = ?auto_192200 ?auto_192201 ) ) ( not ( = ?auto_192200 ?auto_192202 ) ) ( not ( = ?auto_192200 ?auto_192203 ) ) ( not ( = ?auto_192201 ?auto_192202 ) ) ( not ( = ?auto_192201 ?auto_192203 ) ) ( not ( = ?auto_192202 ?auto_192203 ) ) )
    :subtasks
    ( ( !STACK ?auto_192203 ?auto_192202 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192204 - BLOCK
      ?auto_192205 - BLOCK
      ?auto_192206 - BLOCK
      ?auto_192207 - BLOCK
    )
    :vars
    (
      ?auto_192208 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_192206 ) ( ON-TABLE ?auto_192204 ) ( ON ?auto_192205 ?auto_192204 ) ( ON ?auto_192206 ?auto_192205 ) ( not ( = ?auto_192204 ?auto_192205 ) ) ( not ( = ?auto_192204 ?auto_192206 ) ) ( not ( = ?auto_192204 ?auto_192207 ) ) ( not ( = ?auto_192205 ?auto_192206 ) ) ( not ( = ?auto_192205 ?auto_192207 ) ) ( not ( = ?auto_192206 ?auto_192207 ) ) ( ON ?auto_192207 ?auto_192208 ) ( CLEAR ?auto_192207 ) ( HAND-EMPTY ) ( not ( = ?auto_192204 ?auto_192208 ) ) ( not ( = ?auto_192205 ?auto_192208 ) ) ( not ( = ?auto_192206 ?auto_192208 ) ) ( not ( = ?auto_192207 ?auto_192208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192207 ?auto_192208 )
      ( MAKE-4PILE ?auto_192204 ?auto_192205 ?auto_192206 ?auto_192207 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192209 - BLOCK
      ?auto_192210 - BLOCK
      ?auto_192211 - BLOCK
      ?auto_192212 - BLOCK
    )
    :vars
    (
      ?auto_192213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192209 ) ( ON ?auto_192210 ?auto_192209 ) ( not ( = ?auto_192209 ?auto_192210 ) ) ( not ( = ?auto_192209 ?auto_192211 ) ) ( not ( = ?auto_192209 ?auto_192212 ) ) ( not ( = ?auto_192210 ?auto_192211 ) ) ( not ( = ?auto_192210 ?auto_192212 ) ) ( not ( = ?auto_192211 ?auto_192212 ) ) ( ON ?auto_192212 ?auto_192213 ) ( CLEAR ?auto_192212 ) ( not ( = ?auto_192209 ?auto_192213 ) ) ( not ( = ?auto_192210 ?auto_192213 ) ) ( not ( = ?auto_192211 ?auto_192213 ) ) ( not ( = ?auto_192212 ?auto_192213 ) ) ( HOLDING ?auto_192211 ) ( CLEAR ?auto_192210 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192209 ?auto_192210 ?auto_192211 )
      ( MAKE-4PILE ?auto_192209 ?auto_192210 ?auto_192211 ?auto_192212 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192214 - BLOCK
      ?auto_192215 - BLOCK
      ?auto_192216 - BLOCK
      ?auto_192217 - BLOCK
    )
    :vars
    (
      ?auto_192218 - BLOCK
      ?auto_192221 - BLOCK
      ?auto_192222 - BLOCK
      ?auto_192220 - BLOCK
      ?auto_192219 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192214 ) ( ON ?auto_192215 ?auto_192214 ) ( not ( = ?auto_192214 ?auto_192215 ) ) ( not ( = ?auto_192214 ?auto_192216 ) ) ( not ( = ?auto_192214 ?auto_192217 ) ) ( not ( = ?auto_192215 ?auto_192216 ) ) ( not ( = ?auto_192215 ?auto_192217 ) ) ( not ( = ?auto_192216 ?auto_192217 ) ) ( ON ?auto_192217 ?auto_192218 ) ( not ( = ?auto_192214 ?auto_192218 ) ) ( not ( = ?auto_192215 ?auto_192218 ) ) ( not ( = ?auto_192216 ?auto_192218 ) ) ( not ( = ?auto_192217 ?auto_192218 ) ) ( CLEAR ?auto_192215 ) ( ON ?auto_192216 ?auto_192217 ) ( CLEAR ?auto_192216 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192221 ) ( ON ?auto_192222 ?auto_192221 ) ( ON ?auto_192220 ?auto_192222 ) ( ON ?auto_192219 ?auto_192220 ) ( ON ?auto_192218 ?auto_192219 ) ( not ( = ?auto_192221 ?auto_192222 ) ) ( not ( = ?auto_192221 ?auto_192220 ) ) ( not ( = ?auto_192221 ?auto_192219 ) ) ( not ( = ?auto_192221 ?auto_192218 ) ) ( not ( = ?auto_192221 ?auto_192217 ) ) ( not ( = ?auto_192221 ?auto_192216 ) ) ( not ( = ?auto_192222 ?auto_192220 ) ) ( not ( = ?auto_192222 ?auto_192219 ) ) ( not ( = ?auto_192222 ?auto_192218 ) ) ( not ( = ?auto_192222 ?auto_192217 ) ) ( not ( = ?auto_192222 ?auto_192216 ) ) ( not ( = ?auto_192220 ?auto_192219 ) ) ( not ( = ?auto_192220 ?auto_192218 ) ) ( not ( = ?auto_192220 ?auto_192217 ) ) ( not ( = ?auto_192220 ?auto_192216 ) ) ( not ( = ?auto_192219 ?auto_192218 ) ) ( not ( = ?auto_192219 ?auto_192217 ) ) ( not ( = ?auto_192219 ?auto_192216 ) ) ( not ( = ?auto_192214 ?auto_192221 ) ) ( not ( = ?auto_192214 ?auto_192222 ) ) ( not ( = ?auto_192214 ?auto_192220 ) ) ( not ( = ?auto_192214 ?auto_192219 ) ) ( not ( = ?auto_192215 ?auto_192221 ) ) ( not ( = ?auto_192215 ?auto_192222 ) ) ( not ( = ?auto_192215 ?auto_192220 ) ) ( not ( = ?auto_192215 ?auto_192219 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192221 ?auto_192222 ?auto_192220 ?auto_192219 ?auto_192218 ?auto_192217 )
      ( MAKE-4PILE ?auto_192214 ?auto_192215 ?auto_192216 ?auto_192217 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192223 - BLOCK
      ?auto_192224 - BLOCK
      ?auto_192225 - BLOCK
      ?auto_192226 - BLOCK
    )
    :vars
    (
      ?auto_192227 - BLOCK
      ?auto_192229 - BLOCK
      ?auto_192228 - BLOCK
      ?auto_192230 - BLOCK
      ?auto_192231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192223 ) ( not ( = ?auto_192223 ?auto_192224 ) ) ( not ( = ?auto_192223 ?auto_192225 ) ) ( not ( = ?auto_192223 ?auto_192226 ) ) ( not ( = ?auto_192224 ?auto_192225 ) ) ( not ( = ?auto_192224 ?auto_192226 ) ) ( not ( = ?auto_192225 ?auto_192226 ) ) ( ON ?auto_192226 ?auto_192227 ) ( not ( = ?auto_192223 ?auto_192227 ) ) ( not ( = ?auto_192224 ?auto_192227 ) ) ( not ( = ?auto_192225 ?auto_192227 ) ) ( not ( = ?auto_192226 ?auto_192227 ) ) ( ON ?auto_192225 ?auto_192226 ) ( CLEAR ?auto_192225 ) ( ON-TABLE ?auto_192229 ) ( ON ?auto_192228 ?auto_192229 ) ( ON ?auto_192230 ?auto_192228 ) ( ON ?auto_192231 ?auto_192230 ) ( ON ?auto_192227 ?auto_192231 ) ( not ( = ?auto_192229 ?auto_192228 ) ) ( not ( = ?auto_192229 ?auto_192230 ) ) ( not ( = ?auto_192229 ?auto_192231 ) ) ( not ( = ?auto_192229 ?auto_192227 ) ) ( not ( = ?auto_192229 ?auto_192226 ) ) ( not ( = ?auto_192229 ?auto_192225 ) ) ( not ( = ?auto_192228 ?auto_192230 ) ) ( not ( = ?auto_192228 ?auto_192231 ) ) ( not ( = ?auto_192228 ?auto_192227 ) ) ( not ( = ?auto_192228 ?auto_192226 ) ) ( not ( = ?auto_192228 ?auto_192225 ) ) ( not ( = ?auto_192230 ?auto_192231 ) ) ( not ( = ?auto_192230 ?auto_192227 ) ) ( not ( = ?auto_192230 ?auto_192226 ) ) ( not ( = ?auto_192230 ?auto_192225 ) ) ( not ( = ?auto_192231 ?auto_192227 ) ) ( not ( = ?auto_192231 ?auto_192226 ) ) ( not ( = ?auto_192231 ?auto_192225 ) ) ( not ( = ?auto_192223 ?auto_192229 ) ) ( not ( = ?auto_192223 ?auto_192228 ) ) ( not ( = ?auto_192223 ?auto_192230 ) ) ( not ( = ?auto_192223 ?auto_192231 ) ) ( not ( = ?auto_192224 ?auto_192229 ) ) ( not ( = ?auto_192224 ?auto_192228 ) ) ( not ( = ?auto_192224 ?auto_192230 ) ) ( not ( = ?auto_192224 ?auto_192231 ) ) ( HOLDING ?auto_192224 ) ( CLEAR ?auto_192223 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192223 ?auto_192224 )
      ( MAKE-4PILE ?auto_192223 ?auto_192224 ?auto_192225 ?auto_192226 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192232 - BLOCK
      ?auto_192233 - BLOCK
      ?auto_192234 - BLOCK
      ?auto_192235 - BLOCK
    )
    :vars
    (
      ?auto_192239 - BLOCK
      ?auto_192238 - BLOCK
      ?auto_192240 - BLOCK
      ?auto_192237 - BLOCK
      ?auto_192236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192232 ) ( not ( = ?auto_192232 ?auto_192233 ) ) ( not ( = ?auto_192232 ?auto_192234 ) ) ( not ( = ?auto_192232 ?auto_192235 ) ) ( not ( = ?auto_192233 ?auto_192234 ) ) ( not ( = ?auto_192233 ?auto_192235 ) ) ( not ( = ?auto_192234 ?auto_192235 ) ) ( ON ?auto_192235 ?auto_192239 ) ( not ( = ?auto_192232 ?auto_192239 ) ) ( not ( = ?auto_192233 ?auto_192239 ) ) ( not ( = ?auto_192234 ?auto_192239 ) ) ( not ( = ?auto_192235 ?auto_192239 ) ) ( ON ?auto_192234 ?auto_192235 ) ( ON-TABLE ?auto_192238 ) ( ON ?auto_192240 ?auto_192238 ) ( ON ?auto_192237 ?auto_192240 ) ( ON ?auto_192236 ?auto_192237 ) ( ON ?auto_192239 ?auto_192236 ) ( not ( = ?auto_192238 ?auto_192240 ) ) ( not ( = ?auto_192238 ?auto_192237 ) ) ( not ( = ?auto_192238 ?auto_192236 ) ) ( not ( = ?auto_192238 ?auto_192239 ) ) ( not ( = ?auto_192238 ?auto_192235 ) ) ( not ( = ?auto_192238 ?auto_192234 ) ) ( not ( = ?auto_192240 ?auto_192237 ) ) ( not ( = ?auto_192240 ?auto_192236 ) ) ( not ( = ?auto_192240 ?auto_192239 ) ) ( not ( = ?auto_192240 ?auto_192235 ) ) ( not ( = ?auto_192240 ?auto_192234 ) ) ( not ( = ?auto_192237 ?auto_192236 ) ) ( not ( = ?auto_192237 ?auto_192239 ) ) ( not ( = ?auto_192237 ?auto_192235 ) ) ( not ( = ?auto_192237 ?auto_192234 ) ) ( not ( = ?auto_192236 ?auto_192239 ) ) ( not ( = ?auto_192236 ?auto_192235 ) ) ( not ( = ?auto_192236 ?auto_192234 ) ) ( not ( = ?auto_192232 ?auto_192238 ) ) ( not ( = ?auto_192232 ?auto_192240 ) ) ( not ( = ?auto_192232 ?auto_192237 ) ) ( not ( = ?auto_192232 ?auto_192236 ) ) ( not ( = ?auto_192233 ?auto_192238 ) ) ( not ( = ?auto_192233 ?auto_192240 ) ) ( not ( = ?auto_192233 ?auto_192237 ) ) ( not ( = ?auto_192233 ?auto_192236 ) ) ( CLEAR ?auto_192232 ) ( ON ?auto_192233 ?auto_192234 ) ( CLEAR ?auto_192233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192238 ?auto_192240 ?auto_192237 ?auto_192236 ?auto_192239 ?auto_192235 ?auto_192234 )
      ( MAKE-4PILE ?auto_192232 ?auto_192233 ?auto_192234 ?auto_192235 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192241 - BLOCK
      ?auto_192242 - BLOCK
      ?auto_192243 - BLOCK
      ?auto_192244 - BLOCK
    )
    :vars
    (
      ?auto_192247 - BLOCK
      ?auto_192248 - BLOCK
      ?auto_192249 - BLOCK
      ?auto_192245 - BLOCK
      ?auto_192246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_192241 ?auto_192242 ) ) ( not ( = ?auto_192241 ?auto_192243 ) ) ( not ( = ?auto_192241 ?auto_192244 ) ) ( not ( = ?auto_192242 ?auto_192243 ) ) ( not ( = ?auto_192242 ?auto_192244 ) ) ( not ( = ?auto_192243 ?auto_192244 ) ) ( ON ?auto_192244 ?auto_192247 ) ( not ( = ?auto_192241 ?auto_192247 ) ) ( not ( = ?auto_192242 ?auto_192247 ) ) ( not ( = ?auto_192243 ?auto_192247 ) ) ( not ( = ?auto_192244 ?auto_192247 ) ) ( ON ?auto_192243 ?auto_192244 ) ( ON-TABLE ?auto_192248 ) ( ON ?auto_192249 ?auto_192248 ) ( ON ?auto_192245 ?auto_192249 ) ( ON ?auto_192246 ?auto_192245 ) ( ON ?auto_192247 ?auto_192246 ) ( not ( = ?auto_192248 ?auto_192249 ) ) ( not ( = ?auto_192248 ?auto_192245 ) ) ( not ( = ?auto_192248 ?auto_192246 ) ) ( not ( = ?auto_192248 ?auto_192247 ) ) ( not ( = ?auto_192248 ?auto_192244 ) ) ( not ( = ?auto_192248 ?auto_192243 ) ) ( not ( = ?auto_192249 ?auto_192245 ) ) ( not ( = ?auto_192249 ?auto_192246 ) ) ( not ( = ?auto_192249 ?auto_192247 ) ) ( not ( = ?auto_192249 ?auto_192244 ) ) ( not ( = ?auto_192249 ?auto_192243 ) ) ( not ( = ?auto_192245 ?auto_192246 ) ) ( not ( = ?auto_192245 ?auto_192247 ) ) ( not ( = ?auto_192245 ?auto_192244 ) ) ( not ( = ?auto_192245 ?auto_192243 ) ) ( not ( = ?auto_192246 ?auto_192247 ) ) ( not ( = ?auto_192246 ?auto_192244 ) ) ( not ( = ?auto_192246 ?auto_192243 ) ) ( not ( = ?auto_192241 ?auto_192248 ) ) ( not ( = ?auto_192241 ?auto_192249 ) ) ( not ( = ?auto_192241 ?auto_192245 ) ) ( not ( = ?auto_192241 ?auto_192246 ) ) ( not ( = ?auto_192242 ?auto_192248 ) ) ( not ( = ?auto_192242 ?auto_192249 ) ) ( not ( = ?auto_192242 ?auto_192245 ) ) ( not ( = ?auto_192242 ?auto_192246 ) ) ( ON ?auto_192242 ?auto_192243 ) ( CLEAR ?auto_192242 ) ( HOLDING ?auto_192241 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192241 )
      ( MAKE-4PILE ?auto_192241 ?auto_192242 ?auto_192243 ?auto_192244 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192250 - BLOCK
      ?auto_192251 - BLOCK
      ?auto_192252 - BLOCK
      ?auto_192253 - BLOCK
    )
    :vars
    (
      ?auto_192258 - BLOCK
      ?auto_192254 - BLOCK
      ?auto_192257 - BLOCK
      ?auto_192256 - BLOCK
      ?auto_192255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_192250 ?auto_192251 ) ) ( not ( = ?auto_192250 ?auto_192252 ) ) ( not ( = ?auto_192250 ?auto_192253 ) ) ( not ( = ?auto_192251 ?auto_192252 ) ) ( not ( = ?auto_192251 ?auto_192253 ) ) ( not ( = ?auto_192252 ?auto_192253 ) ) ( ON ?auto_192253 ?auto_192258 ) ( not ( = ?auto_192250 ?auto_192258 ) ) ( not ( = ?auto_192251 ?auto_192258 ) ) ( not ( = ?auto_192252 ?auto_192258 ) ) ( not ( = ?auto_192253 ?auto_192258 ) ) ( ON ?auto_192252 ?auto_192253 ) ( ON-TABLE ?auto_192254 ) ( ON ?auto_192257 ?auto_192254 ) ( ON ?auto_192256 ?auto_192257 ) ( ON ?auto_192255 ?auto_192256 ) ( ON ?auto_192258 ?auto_192255 ) ( not ( = ?auto_192254 ?auto_192257 ) ) ( not ( = ?auto_192254 ?auto_192256 ) ) ( not ( = ?auto_192254 ?auto_192255 ) ) ( not ( = ?auto_192254 ?auto_192258 ) ) ( not ( = ?auto_192254 ?auto_192253 ) ) ( not ( = ?auto_192254 ?auto_192252 ) ) ( not ( = ?auto_192257 ?auto_192256 ) ) ( not ( = ?auto_192257 ?auto_192255 ) ) ( not ( = ?auto_192257 ?auto_192258 ) ) ( not ( = ?auto_192257 ?auto_192253 ) ) ( not ( = ?auto_192257 ?auto_192252 ) ) ( not ( = ?auto_192256 ?auto_192255 ) ) ( not ( = ?auto_192256 ?auto_192258 ) ) ( not ( = ?auto_192256 ?auto_192253 ) ) ( not ( = ?auto_192256 ?auto_192252 ) ) ( not ( = ?auto_192255 ?auto_192258 ) ) ( not ( = ?auto_192255 ?auto_192253 ) ) ( not ( = ?auto_192255 ?auto_192252 ) ) ( not ( = ?auto_192250 ?auto_192254 ) ) ( not ( = ?auto_192250 ?auto_192257 ) ) ( not ( = ?auto_192250 ?auto_192256 ) ) ( not ( = ?auto_192250 ?auto_192255 ) ) ( not ( = ?auto_192251 ?auto_192254 ) ) ( not ( = ?auto_192251 ?auto_192257 ) ) ( not ( = ?auto_192251 ?auto_192256 ) ) ( not ( = ?auto_192251 ?auto_192255 ) ) ( ON ?auto_192251 ?auto_192252 ) ( ON ?auto_192250 ?auto_192251 ) ( CLEAR ?auto_192250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192254 ?auto_192257 ?auto_192256 ?auto_192255 ?auto_192258 ?auto_192253 ?auto_192252 ?auto_192251 )
      ( MAKE-4PILE ?auto_192250 ?auto_192251 ?auto_192252 ?auto_192253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192263 - BLOCK
      ?auto_192264 - BLOCK
      ?auto_192265 - BLOCK
      ?auto_192266 - BLOCK
    )
    :vars
    (
      ?auto_192267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192267 ?auto_192266 ) ( CLEAR ?auto_192267 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192263 ) ( ON ?auto_192264 ?auto_192263 ) ( ON ?auto_192265 ?auto_192264 ) ( ON ?auto_192266 ?auto_192265 ) ( not ( = ?auto_192263 ?auto_192264 ) ) ( not ( = ?auto_192263 ?auto_192265 ) ) ( not ( = ?auto_192263 ?auto_192266 ) ) ( not ( = ?auto_192263 ?auto_192267 ) ) ( not ( = ?auto_192264 ?auto_192265 ) ) ( not ( = ?auto_192264 ?auto_192266 ) ) ( not ( = ?auto_192264 ?auto_192267 ) ) ( not ( = ?auto_192265 ?auto_192266 ) ) ( not ( = ?auto_192265 ?auto_192267 ) ) ( not ( = ?auto_192266 ?auto_192267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192267 ?auto_192266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192268 - BLOCK
      ?auto_192269 - BLOCK
      ?auto_192270 - BLOCK
      ?auto_192271 - BLOCK
    )
    :vars
    (
      ?auto_192272 - BLOCK
      ?auto_192273 - BLOCK
      ?auto_192274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192272 ?auto_192271 ) ( CLEAR ?auto_192272 ) ( ON-TABLE ?auto_192268 ) ( ON ?auto_192269 ?auto_192268 ) ( ON ?auto_192270 ?auto_192269 ) ( ON ?auto_192271 ?auto_192270 ) ( not ( = ?auto_192268 ?auto_192269 ) ) ( not ( = ?auto_192268 ?auto_192270 ) ) ( not ( = ?auto_192268 ?auto_192271 ) ) ( not ( = ?auto_192268 ?auto_192272 ) ) ( not ( = ?auto_192269 ?auto_192270 ) ) ( not ( = ?auto_192269 ?auto_192271 ) ) ( not ( = ?auto_192269 ?auto_192272 ) ) ( not ( = ?auto_192270 ?auto_192271 ) ) ( not ( = ?auto_192270 ?auto_192272 ) ) ( not ( = ?auto_192271 ?auto_192272 ) ) ( HOLDING ?auto_192273 ) ( CLEAR ?auto_192274 ) ( not ( = ?auto_192268 ?auto_192273 ) ) ( not ( = ?auto_192268 ?auto_192274 ) ) ( not ( = ?auto_192269 ?auto_192273 ) ) ( not ( = ?auto_192269 ?auto_192274 ) ) ( not ( = ?auto_192270 ?auto_192273 ) ) ( not ( = ?auto_192270 ?auto_192274 ) ) ( not ( = ?auto_192271 ?auto_192273 ) ) ( not ( = ?auto_192271 ?auto_192274 ) ) ( not ( = ?auto_192272 ?auto_192273 ) ) ( not ( = ?auto_192272 ?auto_192274 ) ) ( not ( = ?auto_192273 ?auto_192274 ) ) )
    :subtasks
    ( ( !STACK ?auto_192273 ?auto_192274 )
      ( MAKE-4PILE ?auto_192268 ?auto_192269 ?auto_192270 ?auto_192271 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192275 - BLOCK
      ?auto_192276 - BLOCK
      ?auto_192277 - BLOCK
      ?auto_192278 - BLOCK
    )
    :vars
    (
      ?auto_192280 - BLOCK
      ?auto_192281 - BLOCK
      ?auto_192279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192280 ?auto_192278 ) ( ON-TABLE ?auto_192275 ) ( ON ?auto_192276 ?auto_192275 ) ( ON ?auto_192277 ?auto_192276 ) ( ON ?auto_192278 ?auto_192277 ) ( not ( = ?auto_192275 ?auto_192276 ) ) ( not ( = ?auto_192275 ?auto_192277 ) ) ( not ( = ?auto_192275 ?auto_192278 ) ) ( not ( = ?auto_192275 ?auto_192280 ) ) ( not ( = ?auto_192276 ?auto_192277 ) ) ( not ( = ?auto_192276 ?auto_192278 ) ) ( not ( = ?auto_192276 ?auto_192280 ) ) ( not ( = ?auto_192277 ?auto_192278 ) ) ( not ( = ?auto_192277 ?auto_192280 ) ) ( not ( = ?auto_192278 ?auto_192280 ) ) ( CLEAR ?auto_192281 ) ( not ( = ?auto_192275 ?auto_192279 ) ) ( not ( = ?auto_192275 ?auto_192281 ) ) ( not ( = ?auto_192276 ?auto_192279 ) ) ( not ( = ?auto_192276 ?auto_192281 ) ) ( not ( = ?auto_192277 ?auto_192279 ) ) ( not ( = ?auto_192277 ?auto_192281 ) ) ( not ( = ?auto_192278 ?auto_192279 ) ) ( not ( = ?auto_192278 ?auto_192281 ) ) ( not ( = ?auto_192280 ?auto_192279 ) ) ( not ( = ?auto_192280 ?auto_192281 ) ) ( not ( = ?auto_192279 ?auto_192281 ) ) ( ON ?auto_192279 ?auto_192280 ) ( CLEAR ?auto_192279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192275 ?auto_192276 ?auto_192277 ?auto_192278 ?auto_192280 )
      ( MAKE-4PILE ?auto_192275 ?auto_192276 ?auto_192277 ?auto_192278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192282 - BLOCK
      ?auto_192283 - BLOCK
      ?auto_192284 - BLOCK
      ?auto_192285 - BLOCK
    )
    :vars
    (
      ?auto_192288 - BLOCK
      ?auto_192286 - BLOCK
      ?auto_192287 - BLOCK
      ?auto_192289 - BLOCK
      ?auto_192290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192288 ?auto_192285 ) ( ON-TABLE ?auto_192282 ) ( ON ?auto_192283 ?auto_192282 ) ( ON ?auto_192284 ?auto_192283 ) ( ON ?auto_192285 ?auto_192284 ) ( not ( = ?auto_192282 ?auto_192283 ) ) ( not ( = ?auto_192282 ?auto_192284 ) ) ( not ( = ?auto_192282 ?auto_192285 ) ) ( not ( = ?auto_192282 ?auto_192288 ) ) ( not ( = ?auto_192283 ?auto_192284 ) ) ( not ( = ?auto_192283 ?auto_192285 ) ) ( not ( = ?auto_192283 ?auto_192288 ) ) ( not ( = ?auto_192284 ?auto_192285 ) ) ( not ( = ?auto_192284 ?auto_192288 ) ) ( not ( = ?auto_192285 ?auto_192288 ) ) ( not ( = ?auto_192282 ?auto_192286 ) ) ( not ( = ?auto_192282 ?auto_192287 ) ) ( not ( = ?auto_192283 ?auto_192286 ) ) ( not ( = ?auto_192283 ?auto_192287 ) ) ( not ( = ?auto_192284 ?auto_192286 ) ) ( not ( = ?auto_192284 ?auto_192287 ) ) ( not ( = ?auto_192285 ?auto_192286 ) ) ( not ( = ?auto_192285 ?auto_192287 ) ) ( not ( = ?auto_192288 ?auto_192286 ) ) ( not ( = ?auto_192288 ?auto_192287 ) ) ( not ( = ?auto_192286 ?auto_192287 ) ) ( ON ?auto_192286 ?auto_192288 ) ( CLEAR ?auto_192286 ) ( HOLDING ?auto_192287 ) ( CLEAR ?auto_192289 ) ( ON-TABLE ?auto_192290 ) ( ON ?auto_192289 ?auto_192290 ) ( not ( = ?auto_192290 ?auto_192289 ) ) ( not ( = ?auto_192290 ?auto_192287 ) ) ( not ( = ?auto_192289 ?auto_192287 ) ) ( not ( = ?auto_192282 ?auto_192289 ) ) ( not ( = ?auto_192282 ?auto_192290 ) ) ( not ( = ?auto_192283 ?auto_192289 ) ) ( not ( = ?auto_192283 ?auto_192290 ) ) ( not ( = ?auto_192284 ?auto_192289 ) ) ( not ( = ?auto_192284 ?auto_192290 ) ) ( not ( = ?auto_192285 ?auto_192289 ) ) ( not ( = ?auto_192285 ?auto_192290 ) ) ( not ( = ?auto_192288 ?auto_192289 ) ) ( not ( = ?auto_192288 ?auto_192290 ) ) ( not ( = ?auto_192286 ?auto_192289 ) ) ( not ( = ?auto_192286 ?auto_192290 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192290 ?auto_192289 ?auto_192287 )
      ( MAKE-4PILE ?auto_192282 ?auto_192283 ?auto_192284 ?auto_192285 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192291 - BLOCK
      ?auto_192292 - BLOCK
      ?auto_192293 - BLOCK
      ?auto_192294 - BLOCK
    )
    :vars
    (
      ?auto_192299 - BLOCK
      ?auto_192296 - BLOCK
      ?auto_192298 - BLOCK
      ?auto_192295 - BLOCK
      ?auto_192297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192299 ?auto_192294 ) ( ON-TABLE ?auto_192291 ) ( ON ?auto_192292 ?auto_192291 ) ( ON ?auto_192293 ?auto_192292 ) ( ON ?auto_192294 ?auto_192293 ) ( not ( = ?auto_192291 ?auto_192292 ) ) ( not ( = ?auto_192291 ?auto_192293 ) ) ( not ( = ?auto_192291 ?auto_192294 ) ) ( not ( = ?auto_192291 ?auto_192299 ) ) ( not ( = ?auto_192292 ?auto_192293 ) ) ( not ( = ?auto_192292 ?auto_192294 ) ) ( not ( = ?auto_192292 ?auto_192299 ) ) ( not ( = ?auto_192293 ?auto_192294 ) ) ( not ( = ?auto_192293 ?auto_192299 ) ) ( not ( = ?auto_192294 ?auto_192299 ) ) ( not ( = ?auto_192291 ?auto_192296 ) ) ( not ( = ?auto_192291 ?auto_192298 ) ) ( not ( = ?auto_192292 ?auto_192296 ) ) ( not ( = ?auto_192292 ?auto_192298 ) ) ( not ( = ?auto_192293 ?auto_192296 ) ) ( not ( = ?auto_192293 ?auto_192298 ) ) ( not ( = ?auto_192294 ?auto_192296 ) ) ( not ( = ?auto_192294 ?auto_192298 ) ) ( not ( = ?auto_192299 ?auto_192296 ) ) ( not ( = ?auto_192299 ?auto_192298 ) ) ( not ( = ?auto_192296 ?auto_192298 ) ) ( ON ?auto_192296 ?auto_192299 ) ( CLEAR ?auto_192295 ) ( ON-TABLE ?auto_192297 ) ( ON ?auto_192295 ?auto_192297 ) ( not ( = ?auto_192297 ?auto_192295 ) ) ( not ( = ?auto_192297 ?auto_192298 ) ) ( not ( = ?auto_192295 ?auto_192298 ) ) ( not ( = ?auto_192291 ?auto_192295 ) ) ( not ( = ?auto_192291 ?auto_192297 ) ) ( not ( = ?auto_192292 ?auto_192295 ) ) ( not ( = ?auto_192292 ?auto_192297 ) ) ( not ( = ?auto_192293 ?auto_192295 ) ) ( not ( = ?auto_192293 ?auto_192297 ) ) ( not ( = ?auto_192294 ?auto_192295 ) ) ( not ( = ?auto_192294 ?auto_192297 ) ) ( not ( = ?auto_192299 ?auto_192295 ) ) ( not ( = ?auto_192299 ?auto_192297 ) ) ( not ( = ?auto_192296 ?auto_192295 ) ) ( not ( = ?auto_192296 ?auto_192297 ) ) ( ON ?auto_192298 ?auto_192296 ) ( CLEAR ?auto_192298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192291 ?auto_192292 ?auto_192293 ?auto_192294 ?auto_192299 ?auto_192296 )
      ( MAKE-4PILE ?auto_192291 ?auto_192292 ?auto_192293 ?auto_192294 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192300 - BLOCK
      ?auto_192301 - BLOCK
      ?auto_192302 - BLOCK
      ?auto_192303 - BLOCK
    )
    :vars
    (
      ?auto_192307 - BLOCK
      ?auto_192304 - BLOCK
      ?auto_192306 - BLOCK
      ?auto_192308 - BLOCK
      ?auto_192305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192307 ?auto_192303 ) ( ON-TABLE ?auto_192300 ) ( ON ?auto_192301 ?auto_192300 ) ( ON ?auto_192302 ?auto_192301 ) ( ON ?auto_192303 ?auto_192302 ) ( not ( = ?auto_192300 ?auto_192301 ) ) ( not ( = ?auto_192300 ?auto_192302 ) ) ( not ( = ?auto_192300 ?auto_192303 ) ) ( not ( = ?auto_192300 ?auto_192307 ) ) ( not ( = ?auto_192301 ?auto_192302 ) ) ( not ( = ?auto_192301 ?auto_192303 ) ) ( not ( = ?auto_192301 ?auto_192307 ) ) ( not ( = ?auto_192302 ?auto_192303 ) ) ( not ( = ?auto_192302 ?auto_192307 ) ) ( not ( = ?auto_192303 ?auto_192307 ) ) ( not ( = ?auto_192300 ?auto_192304 ) ) ( not ( = ?auto_192300 ?auto_192306 ) ) ( not ( = ?auto_192301 ?auto_192304 ) ) ( not ( = ?auto_192301 ?auto_192306 ) ) ( not ( = ?auto_192302 ?auto_192304 ) ) ( not ( = ?auto_192302 ?auto_192306 ) ) ( not ( = ?auto_192303 ?auto_192304 ) ) ( not ( = ?auto_192303 ?auto_192306 ) ) ( not ( = ?auto_192307 ?auto_192304 ) ) ( not ( = ?auto_192307 ?auto_192306 ) ) ( not ( = ?auto_192304 ?auto_192306 ) ) ( ON ?auto_192304 ?auto_192307 ) ( ON-TABLE ?auto_192308 ) ( not ( = ?auto_192308 ?auto_192305 ) ) ( not ( = ?auto_192308 ?auto_192306 ) ) ( not ( = ?auto_192305 ?auto_192306 ) ) ( not ( = ?auto_192300 ?auto_192305 ) ) ( not ( = ?auto_192300 ?auto_192308 ) ) ( not ( = ?auto_192301 ?auto_192305 ) ) ( not ( = ?auto_192301 ?auto_192308 ) ) ( not ( = ?auto_192302 ?auto_192305 ) ) ( not ( = ?auto_192302 ?auto_192308 ) ) ( not ( = ?auto_192303 ?auto_192305 ) ) ( not ( = ?auto_192303 ?auto_192308 ) ) ( not ( = ?auto_192307 ?auto_192305 ) ) ( not ( = ?auto_192307 ?auto_192308 ) ) ( not ( = ?auto_192304 ?auto_192305 ) ) ( not ( = ?auto_192304 ?auto_192308 ) ) ( ON ?auto_192306 ?auto_192304 ) ( CLEAR ?auto_192306 ) ( HOLDING ?auto_192305 ) ( CLEAR ?auto_192308 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192308 ?auto_192305 )
      ( MAKE-4PILE ?auto_192300 ?auto_192301 ?auto_192302 ?auto_192303 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192309 - BLOCK
      ?auto_192310 - BLOCK
      ?auto_192311 - BLOCK
      ?auto_192312 - BLOCK
    )
    :vars
    (
      ?auto_192314 - BLOCK
      ?auto_192313 - BLOCK
      ?auto_192317 - BLOCK
      ?auto_192316 - BLOCK
      ?auto_192315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192314 ?auto_192312 ) ( ON-TABLE ?auto_192309 ) ( ON ?auto_192310 ?auto_192309 ) ( ON ?auto_192311 ?auto_192310 ) ( ON ?auto_192312 ?auto_192311 ) ( not ( = ?auto_192309 ?auto_192310 ) ) ( not ( = ?auto_192309 ?auto_192311 ) ) ( not ( = ?auto_192309 ?auto_192312 ) ) ( not ( = ?auto_192309 ?auto_192314 ) ) ( not ( = ?auto_192310 ?auto_192311 ) ) ( not ( = ?auto_192310 ?auto_192312 ) ) ( not ( = ?auto_192310 ?auto_192314 ) ) ( not ( = ?auto_192311 ?auto_192312 ) ) ( not ( = ?auto_192311 ?auto_192314 ) ) ( not ( = ?auto_192312 ?auto_192314 ) ) ( not ( = ?auto_192309 ?auto_192313 ) ) ( not ( = ?auto_192309 ?auto_192317 ) ) ( not ( = ?auto_192310 ?auto_192313 ) ) ( not ( = ?auto_192310 ?auto_192317 ) ) ( not ( = ?auto_192311 ?auto_192313 ) ) ( not ( = ?auto_192311 ?auto_192317 ) ) ( not ( = ?auto_192312 ?auto_192313 ) ) ( not ( = ?auto_192312 ?auto_192317 ) ) ( not ( = ?auto_192314 ?auto_192313 ) ) ( not ( = ?auto_192314 ?auto_192317 ) ) ( not ( = ?auto_192313 ?auto_192317 ) ) ( ON ?auto_192313 ?auto_192314 ) ( ON-TABLE ?auto_192316 ) ( not ( = ?auto_192316 ?auto_192315 ) ) ( not ( = ?auto_192316 ?auto_192317 ) ) ( not ( = ?auto_192315 ?auto_192317 ) ) ( not ( = ?auto_192309 ?auto_192315 ) ) ( not ( = ?auto_192309 ?auto_192316 ) ) ( not ( = ?auto_192310 ?auto_192315 ) ) ( not ( = ?auto_192310 ?auto_192316 ) ) ( not ( = ?auto_192311 ?auto_192315 ) ) ( not ( = ?auto_192311 ?auto_192316 ) ) ( not ( = ?auto_192312 ?auto_192315 ) ) ( not ( = ?auto_192312 ?auto_192316 ) ) ( not ( = ?auto_192314 ?auto_192315 ) ) ( not ( = ?auto_192314 ?auto_192316 ) ) ( not ( = ?auto_192313 ?auto_192315 ) ) ( not ( = ?auto_192313 ?auto_192316 ) ) ( ON ?auto_192317 ?auto_192313 ) ( CLEAR ?auto_192316 ) ( ON ?auto_192315 ?auto_192317 ) ( CLEAR ?auto_192315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192309 ?auto_192310 ?auto_192311 ?auto_192312 ?auto_192314 ?auto_192313 ?auto_192317 )
      ( MAKE-4PILE ?auto_192309 ?auto_192310 ?auto_192311 ?auto_192312 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192318 - BLOCK
      ?auto_192319 - BLOCK
      ?auto_192320 - BLOCK
      ?auto_192321 - BLOCK
    )
    :vars
    (
      ?auto_192324 - BLOCK
      ?auto_192325 - BLOCK
      ?auto_192322 - BLOCK
      ?auto_192323 - BLOCK
      ?auto_192326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192324 ?auto_192321 ) ( ON-TABLE ?auto_192318 ) ( ON ?auto_192319 ?auto_192318 ) ( ON ?auto_192320 ?auto_192319 ) ( ON ?auto_192321 ?auto_192320 ) ( not ( = ?auto_192318 ?auto_192319 ) ) ( not ( = ?auto_192318 ?auto_192320 ) ) ( not ( = ?auto_192318 ?auto_192321 ) ) ( not ( = ?auto_192318 ?auto_192324 ) ) ( not ( = ?auto_192319 ?auto_192320 ) ) ( not ( = ?auto_192319 ?auto_192321 ) ) ( not ( = ?auto_192319 ?auto_192324 ) ) ( not ( = ?auto_192320 ?auto_192321 ) ) ( not ( = ?auto_192320 ?auto_192324 ) ) ( not ( = ?auto_192321 ?auto_192324 ) ) ( not ( = ?auto_192318 ?auto_192325 ) ) ( not ( = ?auto_192318 ?auto_192322 ) ) ( not ( = ?auto_192319 ?auto_192325 ) ) ( not ( = ?auto_192319 ?auto_192322 ) ) ( not ( = ?auto_192320 ?auto_192325 ) ) ( not ( = ?auto_192320 ?auto_192322 ) ) ( not ( = ?auto_192321 ?auto_192325 ) ) ( not ( = ?auto_192321 ?auto_192322 ) ) ( not ( = ?auto_192324 ?auto_192325 ) ) ( not ( = ?auto_192324 ?auto_192322 ) ) ( not ( = ?auto_192325 ?auto_192322 ) ) ( ON ?auto_192325 ?auto_192324 ) ( not ( = ?auto_192323 ?auto_192326 ) ) ( not ( = ?auto_192323 ?auto_192322 ) ) ( not ( = ?auto_192326 ?auto_192322 ) ) ( not ( = ?auto_192318 ?auto_192326 ) ) ( not ( = ?auto_192318 ?auto_192323 ) ) ( not ( = ?auto_192319 ?auto_192326 ) ) ( not ( = ?auto_192319 ?auto_192323 ) ) ( not ( = ?auto_192320 ?auto_192326 ) ) ( not ( = ?auto_192320 ?auto_192323 ) ) ( not ( = ?auto_192321 ?auto_192326 ) ) ( not ( = ?auto_192321 ?auto_192323 ) ) ( not ( = ?auto_192324 ?auto_192326 ) ) ( not ( = ?auto_192324 ?auto_192323 ) ) ( not ( = ?auto_192325 ?auto_192326 ) ) ( not ( = ?auto_192325 ?auto_192323 ) ) ( ON ?auto_192322 ?auto_192325 ) ( ON ?auto_192326 ?auto_192322 ) ( CLEAR ?auto_192326 ) ( HOLDING ?auto_192323 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192323 )
      ( MAKE-4PILE ?auto_192318 ?auto_192319 ?auto_192320 ?auto_192321 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_192327 - BLOCK
      ?auto_192328 - BLOCK
      ?auto_192329 - BLOCK
      ?auto_192330 - BLOCK
    )
    :vars
    (
      ?auto_192334 - BLOCK
      ?auto_192332 - BLOCK
      ?auto_192335 - BLOCK
      ?auto_192333 - BLOCK
      ?auto_192331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192334 ?auto_192330 ) ( ON-TABLE ?auto_192327 ) ( ON ?auto_192328 ?auto_192327 ) ( ON ?auto_192329 ?auto_192328 ) ( ON ?auto_192330 ?auto_192329 ) ( not ( = ?auto_192327 ?auto_192328 ) ) ( not ( = ?auto_192327 ?auto_192329 ) ) ( not ( = ?auto_192327 ?auto_192330 ) ) ( not ( = ?auto_192327 ?auto_192334 ) ) ( not ( = ?auto_192328 ?auto_192329 ) ) ( not ( = ?auto_192328 ?auto_192330 ) ) ( not ( = ?auto_192328 ?auto_192334 ) ) ( not ( = ?auto_192329 ?auto_192330 ) ) ( not ( = ?auto_192329 ?auto_192334 ) ) ( not ( = ?auto_192330 ?auto_192334 ) ) ( not ( = ?auto_192327 ?auto_192332 ) ) ( not ( = ?auto_192327 ?auto_192335 ) ) ( not ( = ?auto_192328 ?auto_192332 ) ) ( not ( = ?auto_192328 ?auto_192335 ) ) ( not ( = ?auto_192329 ?auto_192332 ) ) ( not ( = ?auto_192329 ?auto_192335 ) ) ( not ( = ?auto_192330 ?auto_192332 ) ) ( not ( = ?auto_192330 ?auto_192335 ) ) ( not ( = ?auto_192334 ?auto_192332 ) ) ( not ( = ?auto_192334 ?auto_192335 ) ) ( not ( = ?auto_192332 ?auto_192335 ) ) ( ON ?auto_192332 ?auto_192334 ) ( not ( = ?auto_192333 ?auto_192331 ) ) ( not ( = ?auto_192333 ?auto_192335 ) ) ( not ( = ?auto_192331 ?auto_192335 ) ) ( not ( = ?auto_192327 ?auto_192331 ) ) ( not ( = ?auto_192327 ?auto_192333 ) ) ( not ( = ?auto_192328 ?auto_192331 ) ) ( not ( = ?auto_192328 ?auto_192333 ) ) ( not ( = ?auto_192329 ?auto_192331 ) ) ( not ( = ?auto_192329 ?auto_192333 ) ) ( not ( = ?auto_192330 ?auto_192331 ) ) ( not ( = ?auto_192330 ?auto_192333 ) ) ( not ( = ?auto_192334 ?auto_192331 ) ) ( not ( = ?auto_192334 ?auto_192333 ) ) ( not ( = ?auto_192332 ?auto_192331 ) ) ( not ( = ?auto_192332 ?auto_192333 ) ) ( ON ?auto_192335 ?auto_192332 ) ( ON ?auto_192331 ?auto_192335 ) ( ON ?auto_192333 ?auto_192331 ) ( CLEAR ?auto_192333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192327 ?auto_192328 ?auto_192329 ?auto_192330 ?auto_192334 ?auto_192332 ?auto_192335 ?auto_192331 )
      ( MAKE-4PILE ?auto_192327 ?auto_192328 ?auto_192329 ?auto_192330 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192341 - BLOCK
      ?auto_192342 - BLOCK
      ?auto_192343 - BLOCK
      ?auto_192344 - BLOCK
      ?auto_192345 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_192345 ) ( CLEAR ?auto_192344 ) ( ON-TABLE ?auto_192341 ) ( ON ?auto_192342 ?auto_192341 ) ( ON ?auto_192343 ?auto_192342 ) ( ON ?auto_192344 ?auto_192343 ) ( not ( = ?auto_192341 ?auto_192342 ) ) ( not ( = ?auto_192341 ?auto_192343 ) ) ( not ( = ?auto_192341 ?auto_192344 ) ) ( not ( = ?auto_192341 ?auto_192345 ) ) ( not ( = ?auto_192342 ?auto_192343 ) ) ( not ( = ?auto_192342 ?auto_192344 ) ) ( not ( = ?auto_192342 ?auto_192345 ) ) ( not ( = ?auto_192343 ?auto_192344 ) ) ( not ( = ?auto_192343 ?auto_192345 ) ) ( not ( = ?auto_192344 ?auto_192345 ) ) )
    :subtasks
    ( ( !STACK ?auto_192345 ?auto_192344 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192346 - BLOCK
      ?auto_192347 - BLOCK
      ?auto_192348 - BLOCK
      ?auto_192349 - BLOCK
      ?auto_192350 - BLOCK
    )
    :vars
    (
      ?auto_192351 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_192349 ) ( ON-TABLE ?auto_192346 ) ( ON ?auto_192347 ?auto_192346 ) ( ON ?auto_192348 ?auto_192347 ) ( ON ?auto_192349 ?auto_192348 ) ( not ( = ?auto_192346 ?auto_192347 ) ) ( not ( = ?auto_192346 ?auto_192348 ) ) ( not ( = ?auto_192346 ?auto_192349 ) ) ( not ( = ?auto_192346 ?auto_192350 ) ) ( not ( = ?auto_192347 ?auto_192348 ) ) ( not ( = ?auto_192347 ?auto_192349 ) ) ( not ( = ?auto_192347 ?auto_192350 ) ) ( not ( = ?auto_192348 ?auto_192349 ) ) ( not ( = ?auto_192348 ?auto_192350 ) ) ( not ( = ?auto_192349 ?auto_192350 ) ) ( ON ?auto_192350 ?auto_192351 ) ( CLEAR ?auto_192350 ) ( HAND-EMPTY ) ( not ( = ?auto_192346 ?auto_192351 ) ) ( not ( = ?auto_192347 ?auto_192351 ) ) ( not ( = ?auto_192348 ?auto_192351 ) ) ( not ( = ?auto_192349 ?auto_192351 ) ) ( not ( = ?auto_192350 ?auto_192351 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192350 ?auto_192351 )
      ( MAKE-5PILE ?auto_192346 ?auto_192347 ?auto_192348 ?auto_192349 ?auto_192350 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192352 - BLOCK
      ?auto_192353 - BLOCK
      ?auto_192354 - BLOCK
      ?auto_192355 - BLOCK
      ?auto_192356 - BLOCK
    )
    :vars
    (
      ?auto_192357 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192352 ) ( ON ?auto_192353 ?auto_192352 ) ( ON ?auto_192354 ?auto_192353 ) ( not ( = ?auto_192352 ?auto_192353 ) ) ( not ( = ?auto_192352 ?auto_192354 ) ) ( not ( = ?auto_192352 ?auto_192355 ) ) ( not ( = ?auto_192352 ?auto_192356 ) ) ( not ( = ?auto_192353 ?auto_192354 ) ) ( not ( = ?auto_192353 ?auto_192355 ) ) ( not ( = ?auto_192353 ?auto_192356 ) ) ( not ( = ?auto_192354 ?auto_192355 ) ) ( not ( = ?auto_192354 ?auto_192356 ) ) ( not ( = ?auto_192355 ?auto_192356 ) ) ( ON ?auto_192356 ?auto_192357 ) ( CLEAR ?auto_192356 ) ( not ( = ?auto_192352 ?auto_192357 ) ) ( not ( = ?auto_192353 ?auto_192357 ) ) ( not ( = ?auto_192354 ?auto_192357 ) ) ( not ( = ?auto_192355 ?auto_192357 ) ) ( not ( = ?auto_192356 ?auto_192357 ) ) ( HOLDING ?auto_192355 ) ( CLEAR ?auto_192354 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192352 ?auto_192353 ?auto_192354 ?auto_192355 )
      ( MAKE-5PILE ?auto_192352 ?auto_192353 ?auto_192354 ?auto_192355 ?auto_192356 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192358 - BLOCK
      ?auto_192359 - BLOCK
      ?auto_192360 - BLOCK
      ?auto_192361 - BLOCK
      ?auto_192362 - BLOCK
    )
    :vars
    (
      ?auto_192363 - BLOCK
      ?auto_192365 - BLOCK
      ?auto_192364 - BLOCK
      ?auto_192366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192358 ) ( ON ?auto_192359 ?auto_192358 ) ( ON ?auto_192360 ?auto_192359 ) ( not ( = ?auto_192358 ?auto_192359 ) ) ( not ( = ?auto_192358 ?auto_192360 ) ) ( not ( = ?auto_192358 ?auto_192361 ) ) ( not ( = ?auto_192358 ?auto_192362 ) ) ( not ( = ?auto_192359 ?auto_192360 ) ) ( not ( = ?auto_192359 ?auto_192361 ) ) ( not ( = ?auto_192359 ?auto_192362 ) ) ( not ( = ?auto_192360 ?auto_192361 ) ) ( not ( = ?auto_192360 ?auto_192362 ) ) ( not ( = ?auto_192361 ?auto_192362 ) ) ( ON ?auto_192362 ?auto_192363 ) ( not ( = ?auto_192358 ?auto_192363 ) ) ( not ( = ?auto_192359 ?auto_192363 ) ) ( not ( = ?auto_192360 ?auto_192363 ) ) ( not ( = ?auto_192361 ?auto_192363 ) ) ( not ( = ?auto_192362 ?auto_192363 ) ) ( CLEAR ?auto_192360 ) ( ON ?auto_192361 ?auto_192362 ) ( CLEAR ?auto_192361 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192365 ) ( ON ?auto_192364 ?auto_192365 ) ( ON ?auto_192366 ?auto_192364 ) ( ON ?auto_192363 ?auto_192366 ) ( not ( = ?auto_192365 ?auto_192364 ) ) ( not ( = ?auto_192365 ?auto_192366 ) ) ( not ( = ?auto_192365 ?auto_192363 ) ) ( not ( = ?auto_192365 ?auto_192362 ) ) ( not ( = ?auto_192365 ?auto_192361 ) ) ( not ( = ?auto_192364 ?auto_192366 ) ) ( not ( = ?auto_192364 ?auto_192363 ) ) ( not ( = ?auto_192364 ?auto_192362 ) ) ( not ( = ?auto_192364 ?auto_192361 ) ) ( not ( = ?auto_192366 ?auto_192363 ) ) ( not ( = ?auto_192366 ?auto_192362 ) ) ( not ( = ?auto_192366 ?auto_192361 ) ) ( not ( = ?auto_192358 ?auto_192365 ) ) ( not ( = ?auto_192358 ?auto_192364 ) ) ( not ( = ?auto_192358 ?auto_192366 ) ) ( not ( = ?auto_192359 ?auto_192365 ) ) ( not ( = ?auto_192359 ?auto_192364 ) ) ( not ( = ?auto_192359 ?auto_192366 ) ) ( not ( = ?auto_192360 ?auto_192365 ) ) ( not ( = ?auto_192360 ?auto_192364 ) ) ( not ( = ?auto_192360 ?auto_192366 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192365 ?auto_192364 ?auto_192366 ?auto_192363 ?auto_192362 )
      ( MAKE-5PILE ?auto_192358 ?auto_192359 ?auto_192360 ?auto_192361 ?auto_192362 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192367 - BLOCK
      ?auto_192368 - BLOCK
      ?auto_192369 - BLOCK
      ?auto_192370 - BLOCK
      ?auto_192371 - BLOCK
    )
    :vars
    (
      ?auto_192374 - BLOCK
      ?auto_192375 - BLOCK
      ?auto_192373 - BLOCK
      ?auto_192372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192367 ) ( ON ?auto_192368 ?auto_192367 ) ( not ( = ?auto_192367 ?auto_192368 ) ) ( not ( = ?auto_192367 ?auto_192369 ) ) ( not ( = ?auto_192367 ?auto_192370 ) ) ( not ( = ?auto_192367 ?auto_192371 ) ) ( not ( = ?auto_192368 ?auto_192369 ) ) ( not ( = ?auto_192368 ?auto_192370 ) ) ( not ( = ?auto_192368 ?auto_192371 ) ) ( not ( = ?auto_192369 ?auto_192370 ) ) ( not ( = ?auto_192369 ?auto_192371 ) ) ( not ( = ?auto_192370 ?auto_192371 ) ) ( ON ?auto_192371 ?auto_192374 ) ( not ( = ?auto_192367 ?auto_192374 ) ) ( not ( = ?auto_192368 ?auto_192374 ) ) ( not ( = ?auto_192369 ?auto_192374 ) ) ( not ( = ?auto_192370 ?auto_192374 ) ) ( not ( = ?auto_192371 ?auto_192374 ) ) ( ON ?auto_192370 ?auto_192371 ) ( CLEAR ?auto_192370 ) ( ON-TABLE ?auto_192375 ) ( ON ?auto_192373 ?auto_192375 ) ( ON ?auto_192372 ?auto_192373 ) ( ON ?auto_192374 ?auto_192372 ) ( not ( = ?auto_192375 ?auto_192373 ) ) ( not ( = ?auto_192375 ?auto_192372 ) ) ( not ( = ?auto_192375 ?auto_192374 ) ) ( not ( = ?auto_192375 ?auto_192371 ) ) ( not ( = ?auto_192375 ?auto_192370 ) ) ( not ( = ?auto_192373 ?auto_192372 ) ) ( not ( = ?auto_192373 ?auto_192374 ) ) ( not ( = ?auto_192373 ?auto_192371 ) ) ( not ( = ?auto_192373 ?auto_192370 ) ) ( not ( = ?auto_192372 ?auto_192374 ) ) ( not ( = ?auto_192372 ?auto_192371 ) ) ( not ( = ?auto_192372 ?auto_192370 ) ) ( not ( = ?auto_192367 ?auto_192375 ) ) ( not ( = ?auto_192367 ?auto_192373 ) ) ( not ( = ?auto_192367 ?auto_192372 ) ) ( not ( = ?auto_192368 ?auto_192375 ) ) ( not ( = ?auto_192368 ?auto_192373 ) ) ( not ( = ?auto_192368 ?auto_192372 ) ) ( not ( = ?auto_192369 ?auto_192375 ) ) ( not ( = ?auto_192369 ?auto_192373 ) ) ( not ( = ?auto_192369 ?auto_192372 ) ) ( HOLDING ?auto_192369 ) ( CLEAR ?auto_192368 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192367 ?auto_192368 ?auto_192369 )
      ( MAKE-5PILE ?auto_192367 ?auto_192368 ?auto_192369 ?auto_192370 ?auto_192371 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192376 - BLOCK
      ?auto_192377 - BLOCK
      ?auto_192378 - BLOCK
      ?auto_192379 - BLOCK
      ?auto_192380 - BLOCK
    )
    :vars
    (
      ?auto_192382 - BLOCK
      ?auto_192383 - BLOCK
      ?auto_192381 - BLOCK
      ?auto_192384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192376 ) ( ON ?auto_192377 ?auto_192376 ) ( not ( = ?auto_192376 ?auto_192377 ) ) ( not ( = ?auto_192376 ?auto_192378 ) ) ( not ( = ?auto_192376 ?auto_192379 ) ) ( not ( = ?auto_192376 ?auto_192380 ) ) ( not ( = ?auto_192377 ?auto_192378 ) ) ( not ( = ?auto_192377 ?auto_192379 ) ) ( not ( = ?auto_192377 ?auto_192380 ) ) ( not ( = ?auto_192378 ?auto_192379 ) ) ( not ( = ?auto_192378 ?auto_192380 ) ) ( not ( = ?auto_192379 ?auto_192380 ) ) ( ON ?auto_192380 ?auto_192382 ) ( not ( = ?auto_192376 ?auto_192382 ) ) ( not ( = ?auto_192377 ?auto_192382 ) ) ( not ( = ?auto_192378 ?auto_192382 ) ) ( not ( = ?auto_192379 ?auto_192382 ) ) ( not ( = ?auto_192380 ?auto_192382 ) ) ( ON ?auto_192379 ?auto_192380 ) ( ON-TABLE ?auto_192383 ) ( ON ?auto_192381 ?auto_192383 ) ( ON ?auto_192384 ?auto_192381 ) ( ON ?auto_192382 ?auto_192384 ) ( not ( = ?auto_192383 ?auto_192381 ) ) ( not ( = ?auto_192383 ?auto_192384 ) ) ( not ( = ?auto_192383 ?auto_192382 ) ) ( not ( = ?auto_192383 ?auto_192380 ) ) ( not ( = ?auto_192383 ?auto_192379 ) ) ( not ( = ?auto_192381 ?auto_192384 ) ) ( not ( = ?auto_192381 ?auto_192382 ) ) ( not ( = ?auto_192381 ?auto_192380 ) ) ( not ( = ?auto_192381 ?auto_192379 ) ) ( not ( = ?auto_192384 ?auto_192382 ) ) ( not ( = ?auto_192384 ?auto_192380 ) ) ( not ( = ?auto_192384 ?auto_192379 ) ) ( not ( = ?auto_192376 ?auto_192383 ) ) ( not ( = ?auto_192376 ?auto_192381 ) ) ( not ( = ?auto_192376 ?auto_192384 ) ) ( not ( = ?auto_192377 ?auto_192383 ) ) ( not ( = ?auto_192377 ?auto_192381 ) ) ( not ( = ?auto_192377 ?auto_192384 ) ) ( not ( = ?auto_192378 ?auto_192383 ) ) ( not ( = ?auto_192378 ?auto_192381 ) ) ( not ( = ?auto_192378 ?auto_192384 ) ) ( CLEAR ?auto_192377 ) ( ON ?auto_192378 ?auto_192379 ) ( CLEAR ?auto_192378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192383 ?auto_192381 ?auto_192384 ?auto_192382 ?auto_192380 ?auto_192379 )
      ( MAKE-5PILE ?auto_192376 ?auto_192377 ?auto_192378 ?auto_192379 ?auto_192380 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192385 - BLOCK
      ?auto_192386 - BLOCK
      ?auto_192387 - BLOCK
      ?auto_192388 - BLOCK
      ?auto_192389 - BLOCK
    )
    :vars
    (
      ?auto_192393 - BLOCK
      ?auto_192392 - BLOCK
      ?auto_192391 - BLOCK
      ?auto_192390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192385 ) ( not ( = ?auto_192385 ?auto_192386 ) ) ( not ( = ?auto_192385 ?auto_192387 ) ) ( not ( = ?auto_192385 ?auto_192388 ) ) ( not ( = ?auto_192385 ?auto_192389 ) ) ( not ( = ?auto_192386 ?auto_192387 ) ) ( not ( = ?auto_192386 ?auto_192388 ) ) ( not ( = ?auto_192386 ?auto_192389 ) ) ( not ( = ?auto_192387 ?auto_192388 ) ) ( not ( = ?auto_192387 ?auto_192389 ) ) ( not ( = ?auto_192388 ?auto_192389 ) ) ( ON ?auto_192389 ?auto_192393 ) ( not ( = ?auto_192385 ?auto_192393 ) ) ( not ( = ?auto_192386 ?auto_192393 ) ) ( not ( = ?auto_192387 ?auto_192393 ) ) ( not ( = ?auto_192388 ?auto_192393 ) ) ( not ( = ?auto_192389 ?auto_192393 ) ) ( ON ?auto_192388 ?auto_192389 ) ( ON-TABLE ?auto_192392 ) ( ON ?auto_192391 ?auto_192392 ) ( ON ?auto_192390 ?auto_192391 ) ( ON ?auto_192393 ?auto_192390 ) ( not ( = ?auto_192392 ?auto_192391 ) ) ( not ( = ?auto_192392 ?auto_192390 ) ) ( not ( = ?auto_192392 ?auto_192393 ) ) ( not ( = ?auto_192392 ?auto_192389 ) ) ( not ( = ?auto_192392 ?auto_192388 ) ) ( not ( = ?auto_192391 ?auto_192390 ) ) ( not ( = ?auto_192391 ?auto_192393 ) ) ( not ( = ?auto_192391 ?auto_192389 ) ) ( not ( = ?auto_192391 ?auto_192388 ) ) ( not ( = ?auto_192390 ?auto_192393 ) ) ( not ( = ?auto_192390 ?auto_192389 ) ) ( not ( = ?auto_192390 ?auto_192388 ) ) ( not ( = ?auto_192385 ?auto_192392 ) ) ( not ( = ?auto_192385 ?auto_192391 ) ) ( not ( = ?auto_192385 ?auto_192390 ) ) ( not ( = ?auto_192386 ?auto_192392 ) ) ( not ( = ?auto_192386 ?auto_192391 ) ) ( not ( = ?auto_192386 ?auto_192390 ) ) ( not ( = ?auto_192387 ?auto_192392 ) ) ( not ( = ?auto_192387 ?auto_192391 ) ) ( not ( = ?auto_192387 ?auto_192390 ) ) ( ON ?auto_192387 ?auto_192388 ) ( CLEAR ?auto_192387 ) ( HOLDING ?auto_192386 ) ( CLEAR ?auto_192385 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192385 ?auto_192386 )
      ( MAKE-5PILE ?auto_192385 ?auto_192386 ?auto_192387 ?auto_192388 ?auto_192389 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192394 - BLOCK
      ?auto_192395 - BLOCK
      ?auto_192396 - BLOCK
      ?auto_192397 - BLOCK
      ?auto_192398 - BLOCK
    )
    :vars
    (
      ?auto_192401 - BLOCK
      ?auto_192400 - BLOCK
      ?auto_192399 - BLOCK
      ?auto_192402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192394 ) ( not ( = ?auto_192394 ?auto_192395 ) ) ( not ( = ?auto_192394 ?auto_192396 ) ) ( not ( = ?auto_192394 ?auto_192397 ) ) ( not ( = ?auto_192394 ?auto_192398 ) ) ( not ( = ?auto_192395 ?auto_192396 ) ) ( not ( = ?auto_192395 ?auto_192397 ) ) ( not ( = ?auto_192395 ?auto_192398 ) ) ( not ( = ?auto_192396 ?auto_192397 ) ) ( not ( = ?auto_192396 ?auto_192398 ) ) ( not ( = ?auto_192397 ?auto_192398 ) ) ( ON ?auto_192398 ?auto_192401 ) ( not ( = ?auto_192394 ?auto_192401 ) ) ( not ( = ?auto_192395 ?auto_192401 ) ) ( not ( = ?auto_192396 ?auto_192401 ) ) ( not ( = ?auto_192397 ?auto_192401 ) ) ( not ( = ?auto_192398 ?auto_192401 ) ) ( ON ?auto_192397 ?auto_192398 ) ( ON-TABLE ?auto_192400 ) ( ON ?auto_192399 ?auto_192400 ) ( ON ?auto_192402 ?auto_192399 ) ( ON ?auto_192401 ?auto_192402 ) ( not ( = ?auto_192400 ?auto_192399 ) ) ( not ( = ?auto_192400 ?auto_192402 ) ) ( not ( = ?auto_192400 ?auto_192401 ) ) ( not ( = ?auto_192400 ?auto_192398 ) ) ( not ( = ?auto_192400 ?auto_192397 ) ) ( not ( = ?auto_192399 ?auto_192402 ) ) ( not ( = ?auto_192399 ?auto_192401 ) ) ( not ( = ?auto_192399 ?auto_192398 ) ) ( not ( = ?auto_192399 ?auto_192397 ) ) ( not ( = ?auto_192402 ?auto_192401 ) ) ( not ( = ?auto_192402 ?auto_192398 ) ) ( not ( = ?auto_192402 ?auto_192397 ) ) ( not ( = ?auto_192394 ?auto_192400 ) ) ( not ( = ?auto_192394 ?auto_192399 ) ) ( not ( = ?auto_192394 ?auto_192402 ) ) ( not ( = ?auto_192395 ?auto_192400 ) ) ( not ( = ?auto_192395 ?auto_192399 ) ) ( not ( = ?auto_192395 ?auto_192402 ) ) ( not ( = ?auto_192396 ?auto_192400 ) ) ( not ( = ?auto_192396 ?auto_192399 ) ) ( not ( = ?auto_192396 ?auto_192402 ) ) ( ON ?auto_192396 ?auto_192397 ) ( CLEAR ?auto_192394 ) ( ON ?auto_192395 ?auto_192396 ) ( CLEAR ?auto_192395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192400 ?auto_192399 ?auto_192402 ?auto_192401 ?auto_192398 ?auto_192397 ?auto_192396 )
      ( MAKE-5PILE ?auto_192394 ?auto_192395 ?auto_192396 ?auto_192397 ?auto_192398 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192403 - BLOCK
      ?auto_192404 - BLOCK
      ?auto_192405 - BLOCK
      ?auto_192406 - BLOCK
      ?auto_192407 - BLOCK
    )
    :vars
    (
      ?auto_192410 - BLOCK
      ?auto_192411 - BLOCK
      ?auto_192408 - BLOCK
      ?auto_192409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_192403 ?auto_192404 ) ) ( not ( = ?auto_192403 ?auto_192405 ) ) ( not ( = ?auto_192403 ?auto_192406 ) ) ( not ( = ?auto_192403 ?auto_192407 ) ) ( not ( = ?auto_192404 ?auto_192405 ) ) ( not ( = ?auto_192404 ?auto_192406 ) ) ( not ( = ?auto_192404 ?auto_192407 ) ) ( not ( = ?auto_192405 ?auto_192406 ) ) ( not ( = ?auto_192405 ?auto_192407 ) ) ( not ( = ?auto_192406 ?auto_192407 ) ) ( ON ?auto_192407 ?auto_192410 ) ( not ( = ?auto_192403 ?auto_192410 ) ) ( not ( = ?auto_192404 ?auto_192410 ) ) ( not ( = ?auto_192405 ?auto_192410 ) ) ( not ( = ?auto_192406 ?auto_192410 ) ) ( not ( = ?auto_192407 ?auto_192410 ) ) ( ON ?auto_192406 ?auto_192407 ) ( ON-TABLE ?auto_192411 ) ( ON ?auto_192408 ?auto_192411 ) ( ON ?auto_192409 ?auto_192408 ) ( ON ?auto_192410 ?auto_192409 ) ( not ( = ?auto_192411 ?auto_192408 ) ) ( not ( = ?auto_192411 ?auto_192409 ) ) ( not ( = ?auto_192411 ?auto_192410 ) ) ( not ( = ?auto_192411 ?auto_192407 ) ) ( not ( = ?auto_192411 ?auto_192406 ) ) ( not ( = ?auto_192408 ?auto_192409 ) ) ( not ( = ?auto_192408 ?auto_192410 ) ) ( not ( = ?auto_192408 ?auto_192407 ) ) ( not ( = ?auto_192408 ?auto_192406 ) ) ( not ( = ?auto_192409 ?auto_192410 ) ) ( not ( = ?auto_192409 ?auto_192407 ) ) ( not ( = ?auto_192409 ?auto_192406 ) ) ( not ( = ?auto_192403 ?auto_192411 ) ) ( not ( = ?auto_192403 ?auto_192408 ) ) ( not ( = ?auto_192403 ?auto_192409 ) ) ( not ( = ?auto_192404 ?auto_192411 ) ) ( not ( = ?auto_192404 ?auto_192408 ) ) ( not ( = ?auto_192404 ?auto_192409 ) ) ( not ( = ?auto_192405 ?auto_192411 ) ) ( not ( = ?auto_192405 ?auto_192408 ) ) ( not ( = ?auto_192405 ?auto_192409 ) ) ( ON ?auto_192405 ?auto_192406 ) ( ON ?auto_192404 ?auto_192405 ) ( CLEAR ?auto_192404 ) ( HOLDING ?auto_192403 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192403 )
      ( MAKE-5PILE ?auto_192403 ?auto_192404 ?auto_192405 ?auto_192406 ?auto_192407 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_192412 - BLOCK
      ?auto_192413 - BLOCK
      ?auto_192414 - BLOCK
      ?auto_192415 - BLOCK
      ?auto_192416 - BLOCK
    )
    :vars
    (
      ?auto_192417 - BLOCK
      ?auto_192420 - BLOCK
      ?auto_192418 - BLOCK
      ?auto_192419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_192412 ?auto_192413 ) ) ( not ( = ?auto_192412 ?auto_192414 ) ) ( not ( = ?auto_192412 ?auto_192415 ) ) ( not ( = ?auto_192412 ?auto_192416 ) ) ( not ( = ?auto_192413 ?auto_192414 ) ) ( not ( = ?auto_192413 ?auto_192415 ) ) ( not ( = ?auto_192413 ?auto_192416 ) ) ( not ( = ?auto_192414 ?auto_192415 ) ) ( not ( = ?auto_192414 ?auto_192416 ) ) ( not ( = ?auto_192415 ?auto_192416 ) ) ( ON ?auto_192416 ?auto_192417 ) ( not ( = ?auto_192412 ?auto_192417 ) ) ( not ( = ?auto_192413 ?auto_192417 ) ) ( not ( = ?auto_192414 ?auto_192417 ) ) ( not ( = ?auto_192415 ?auto_192417 ) ) ( not ( = ?auto_192416 ?auto_192417 ) ) ( ON ?auto_192415 ?auto_192416 ) ( ON-TABLE ?auto_192420 ) ( ON ?auto_192418 ?auto_192420 ) ( ON ?auto_192419 ?auto_192418 ) ( ON ?auto_192417 ?auto_192419 ) ( not ( = ?auto_192420 ?auto_192418 ) ) ( not ( = ?auto_192420 ?auto_192419 ) ) ( not ( = ?auto_192420 ?auto_192417 ) ) ( not ( = ?auto_192420 ?auto_192416 ) ) ( not ( = ?auto_192420 ?auto_192415 ) ) ( not ( = ?auto_192418 ?auto_192419 ) ) ( not ( = ?auto_192418 ?auto_192417 ) ) ( not ( = ?auto_192418 ?auto_192416 ) ) ( not ( = ?auto_192418 ?auto_192415 ) ) ( not ( = ?auto_192419 ?auto_192417 ) ) ( not ( = ?auto_192419 ?auto_192416 ) ) ( not ( = ?auto_192419 ?auto_192415 ) ) ( not ( = ?auto_192412 ?auto_192420 ) ) ( not ( = ?auto_192412 ?auto_192418 ) ) ( not ( = ?auto_192412 ?auto_192419 ) ) ( not ( = ?auto_192413 ?auto_192420 ) ) ( not ( = ?auto_192413 ?auto_192418 ) ) ( not ( = ?auto_192413 ?auto_192419 ) ) ( not ( = ?auto_192414 ?auto_192420 ) ) ( not ( = ?auto_192414 ?auto_192418 ) ) ( not ( = ?auto_192414 ?auto_192419 ) ) ( ON ?auto_192414 ?auto_192415 ) ( ON ?auto_192413 ?auto_192414 ) ( ON ?auto_192412 ?auto_192413 ) ( CLEAR ?auto_192412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192420 ?auto_192418 ?auto_192419 ?auto_192417 ?auto_192416 ?auto_192415 ?auto_192414 ?auto_192413 )
      ( MAKE-5PILE ?auto_192412 ?auto_192413 ?auto_192414 ?auto_192415 ?auto_192416 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192424 - BLOCK
      ?auto_192425 - BLOCK
      ?auto_192426 - BLOCK
    )
    :vars
    (
      ?auto_192427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192427 ?auto_192426 ) ( CLEAR ?auto_192427 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192424 ) ( ON ?auto_192425 ?auto_192424 ) ( ON ?auto_192426 ?auto_192425 ) ( not ( = ?auto_192424 ?auto_192425 ) ) ( not ( = ?auto_192424 ?auto_192426 ) ) ( not ( = ?auto_192424 ?auto_192427 ) ) ( not ( = ?auto_192425 ?auto_192426 ) ) ( not ( = ?auto_192425 ?auto_192427 ) ) ( not ( = ?auto_192426 ?auto_192427 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192427 ?auto_192426 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192428 - BLOCK
      ?auto_192429 - BLOCK
      ?auto_192430 - BLOCK
    )
    :vars
    (
      ?auto_192431 - BLOCK
      ?auto_192432 - BLOCK
      ?auto_192433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192431 ?auto_192430 ) ( CLEAR ?auto_192431 ) ( ON-TABLE ?auto_192428 ) ( ON ?auto_192429 ?auto_192428 ) ( ON ?auto_192430 ?auto_192429 ) ( not ( = ?auto_192428 ?auto_192429 ) ) ( not ( = ?auto_192428 ?auto_192430 ) ) ( not ( = ?auto_192428 ?auto_192431 ) ) ( not ( = ?auto_192429 ?auto_192430 ) ) ( not ( = ?auto_192429 ?auto_192431 ) ) ( not ( = ?auto_192430 ?auto_192431 ) ) ( HOLDING ?auto_192432 ) ( CLEAR ?auto_192433 ) ( not ( = ?auto_192428 ?auto_192432 ) ) ( not ( = ?auto_192428 ?auto_192433 ) ) ( not ( = ?auto_192429 ?auto_192432 ) ) ( not ( = ?auto_192429 ?auto_192433 ) ) ( not ( = ?auto_192430 ?auto_192432 ) ) ( not ( = ?auto_192430 ?auto_192433 ) ) ( not ( = ?auto_192431 ?auto_192432 ) ) ( not ( = ?auto_192431 ?auto_192433 ) ) ( not ( = ?auto_192432 ?auto_192433 ) ) )
    :subtasks
    ( ( !STACK ?auto_192432 ?auto_192433 )
      ( MAKE-3PILE ?auto_192428 ?auto_192429 ?auto_192430 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192434 - BLOCK
      ?auto_192435 - BLOCK
      ?auto_192436 - BLOCK
    )
    :vars
    (
      ?auto_192438 - BLOCK
      ?auto_192437 - BLOCK
      ?auto_192439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192438 ?auto_192436 ) ( ON-TABLE ?auto_192434 ) ( ON ?auto_192435 ?auto_192434 ) ( ON ?auto_192436 ?auto_192435 ) ( not ( = ?auto_192434 ?auto_192435 ) ) ( not ( = ?auto_192434 ?auto_192436 ) ) ( not ( = ?auto_192434 ?auto_192438 ) ) ( not ( = ?auto_192435 ?auto_192436 ) ) ( not ( = ?auto_192435 ?auto_192438 ) ) ( not ( = ?auto_192436 ?auto_192438 ) ) ( CLEAR ?auto_192437 ) ( not ( = ?auto_192434 ?auto_192439 ) ) ( not ( = ?auto_192434 ?auto_192437 ) ) ( not ( = ?auto_192435 ?auto_192439 ) ) ( not ( = ?auto_192435 ?auto_192437 ) ) ( not ( = ?auto_192436 ?auto_192439 ) ) ( not ( = ?auto_192436 ?auto_192437 ) ) ( not ( = ?auto_192438 ?auto_192439 ) ) ( not ( = ?auto_192438 ?auto_192437 ) ) ( not ( = ?auto_192439 ?auto_192437 ) ) ( ON ?auto_192439 ?auto_192438 ) ( CLEAR ?auto_192439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192434 ?auto_192435 ?auto_192436 ?auto_192438 )
      ( MAKE-3PILE ?auto_192434 ?auto_192435 ?auto_192436 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192440 - BLOCK
      ?auto_192441 - BLOCK
      ?auto_192442 - BLOCK
    )
    :vars
    (
      ?auto_192444 - BLOCK
      ?auto_192443 - BLOCK
      ?auto_192445 - BLOCK
      ?auto_192448 - BLOCK
      ?auto_192446 - BLOCK
      ?auto_192447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192444 ?auto_192442 ) ( ON-TABLE ?auto_192440 ) ( ON ?auto_192441 ?auto_192440 ) ( ON ?auto_192442 ?auto_192441 ) ( not ( = ?auto_192440 ?auto_192441 ) ) ( not ( = ?auto_192440 ?auto_192442 ) ) ( not ( = ?auto_192440 ?auto_192444 ) ) ( not ( = ?auto_192441 ?auto_192442 ) ) ( not ( = ?auto_192441 ?auto_192444 ) ) ( not ( = ?auto_192442 ?auto_192444 ) ) ( not ( = ?auto_192440 ?auto_192443 ) ) ( not ( = ?auto_192440 ?auto_192445 ) ) ( not ( = ?auto_192441 ?auto_192443 ) ) ( not ( = ?auto_192441 ?auto_192445 ) ) ( not ( = ?auto_192442 ?auto_192443 ) ) ( not ( = ?auto_192442 ?auto_192445 ) ) ( not ( = ?auto_192444 ?auto_192443 ) ) ( not ( = ?auto_192444 ?auto_192445 ) ) ( not ( = ?auto_192443 ?auto_192445 ) ) ( ON ?auto_192443 ?auto_192444 ) ( CLEAR ?auto_192443 ) ( HOLDING ?auto_192445 ) ( CLEAR ?auto_192448 ) ( ON-TABLE ?auto_192446 ) ( ON ?auto_192447 ?auto_192446 ) ( ON ?auto_192448 ?auto_192447 ) ( not ( = ?auto_192446 ?auto_192447 ) ) ( not ( = ?auto_192446 ?auto_192448 ) ) ( not ( = ?auto_192446 ?auto_192445 ) ) ( not ( = ?auto_192447 ?auto_192448 ) ) ( not ( = ?auto_192447 ?auto_192445 ) ) ( not ( = ?auto_192448 ?auto_192445 ) ) ( not ( = ?auto_192440 ?auto_192448 ) ) ( not ( = ?auto_192440 ?auto_192446 ) ) ( not ( = ?auto_192440 ?auto_192447 ) ) ( not ( = ?auto_192441 ?auto_192448 ) ) ( not ( = ?auto_192441 ?auto_192446 ) ) ( not ( = ?auto_192441 ?auto_192447 ) ) ( not ( = ?auto_192442 ?auto_192448 ) ) ( not ( = ?auto_192442 ?auto_192446 ) ) ( not ( = ?auto_192442 ?auto_192447 ) ) ( not ( = ?auto_192444 ?auto_192448 ) ) ( not ( = ?auto_192444 ?auto_192446 ) ) ( not ( = ?auto_192444 ?auto_192447 ) ) ( not ( = ?auto_192443 ?auto_192448 ) ) ( not ( = ?auto_192443 ?auto_192446 ) ) ( not ( = ?auto_192443 ?auto_192447 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192446 ?auto_192447 ?auto_192448 ?auto_192445 )
      ( MAKE-3PILE ?auto_192440 ?auto_192441 ?auto_192442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192449 - BLOCK
      ?auto_192450 - BLOCK
      ?auto_192451 - BLOCK
    )
    :vars
    (
      ?auto_192453 - BLOCK
      ?auto_192457 - BLOCK
      ?auto_192454 - BLOCK
      ?auto_192455 - BLOCK
      ?auto_192452 - BLOCK
      ?auto_192456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192453 ?auto_192451 ) ( ON-TABLE ?auto_192449 ) ( ON ?auto_192450 ?auto_192449 ) ( ON ?auto_192451 ?auto_192450 ) ( not ( = ?auto_192449 ?auto_192450 ) ) ( not ( = ?auto_192449 ?auto_192451 ) ) ( not ( = ?auto_192449 ?auto_192453 ) ) ( not ( = ?auto_192450 ?auto_192451 ) ) ( not ( = ?auto_192450 ?auto_192453 ) ) ( not ( = ?auto_192451 ?auto_192453 ) ) ( not ( = ?auto_192449 ?auto_192457 ) ) ( not ( = ?auto_192449 ?auto_192454 ) ) ( not ( = ?auto_192450 ?auto_192457 ) ) ( not ( = ?auto_192450 ?auto_192454 ) ) ( not ( = ?auto_192451 ?auto_192457 ) ) ( not ( = ?auto_192451 ?auto_192454 ) ) ( not ( = ?auto_192453 ?auto_192457 ) ) ( not ( = ?auto_192453 ?auto_192454 ) ) ( not ( = ?auto_192457 ?auto_192454 ) ) ( ON ?auto_192457 ?auto_192453 ) ( CLEAR ?auto_192455 ) ( ON-TABLE ?auto_192452 ) ( ON ?auto_192456 ?auto_192452 ) ( ON ?auto_192455 ?auto_192456 ) ( not ( = ?auto_192452 ?auto_192456 ) ) ( not ( = ?auto_192452 ?auto_192455 ) ) ( not ( = ?auto_192452 ?auto_192454 ) ) ( not ( = ?auto_192456 ?auto_192455 ) ) ( not ( = ?auto_192456 ?auto_192454 ) ) ( not ( = ?auto_192455 ?auto_192454 ) ) ( not ( = ?auto_192449 ?auto_192455 ) ) ( not ( = ?auto_192449 ?auto_192452 ) ) ( not ( = ?auto_192449 ?auto_192456 ) ) ( not ( = ?auto_192450 ?auto_192455 ) ) ( not ( = ?auto_192450 ?auto_192452 ) ) ( not ( = ?auto_192450 ?auto_192456 ) ) ( not ( = ?auto_192451 ?auto_192455 ) ) ( not ( = ?auto_192451 ?auto_192452 ) ) ( not ( = ?auto_192451 ?auto_192456 ) ) ( not ( = ?auto_192453 ?auto_192455 ) ) ( not ( = ?auto_192453 ?auto_192452 ) ) ( not ( = ?auto_192453 ?auto_192456 ) ) ( not ( = ?auto_192457 ?auto_192455 ) ) ( not ( = ?auto_192457 ?auto_192452 ) ) ( not ( = ?auto_192457 ?auto_192456 ) ) ( ON ?auto_192454 ?auto_192457 ) ( CLEAR ?auto_192454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192449 ?auto_192450 ?auto_192451 ?auto_192453 ?auto_192457 )
      ( MAKE-3PILE ?auto_192449 ?auto_192450 ?auto_192451 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192458 - BLOCK
      ?auto_192459 - BLOCK
      ?auto_192460 - BLOCK
    )
    :vars
    (
      ?auto_192465 - BLOCK
      ?auto_192466 - BLOCK
      ?auto_192464 - BLOCK
      ?auto_192462 - BLOCK
      ?auto_192461 - BLOCK
      ?auto_192463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192465 ?auto_192460 ) ( ON-TABLE ?auto_192458 ) ( ON ?auto_192459 ?auto_192458 ) ( ON ?auto_192460 ?auto_192459 ) ( not ( = ?auto_192458 ?auto_192459 ) ) ( not ( = ?auto_192458 ?auto_192460 ) ) ( not ( = ?auto_192458 ?auto_192465 ) ) ( not ( = ?auto_192459 ?auto_192460 ) ) ( not ( = ?auto_192459 ?auto_192465 ) ) ( not ( = ?auto_192460 ?auto_192465 ) ) ( not ( = ?auto_192458 ?auto_192466 ) ) ( not ( = ?auto_192458 ?auto_192464 ) ) ( not ( = ?auto_192459 ?auto_192466 ) ) ( not ( = ?auto_192459 ?auto_192464 ) ) ( not ( = ?auto_192460 ?auto_192466 ) ) ( not ( = ?auto_192460 ?auto_192464 ) ) ( not ( = ?auto_192465 ?auto_192466 ) ) ( not ( = ?auto_192465 ?auto_192464 ) ) ( not ( = ?auto_192466 ?auto_192464 ) ) ( ON ?auto_192466 ?auto_192465 ) ( ON-TABLE ?auto_192462 ) ( ON ?auto_192461 ?auto_192462 ) ( not ( = ?auto_192462 ?auto_192461 ) ) ( not ( = ?auto_192462 ?auto_192463 ) ) ( not ( = ?auto_192462 ?auto_192464 ) ) ( not ( = ?auto_192461 ?auto_192463 ) ) ( not ( = ?auto_192461 ?auto_192464 ) ) ( not ( = ?auto_192463 ?auto_192464 ) ) ( not ( = ?auto_192458 ?auto_192463 ) ) ( not ( = ?auto_192458 ?auto_192462 ) ) ( not ( = ?auto_192458 ?auto_192461 ) ) ( not ( = ?auto_192459 ?auto_192463 ) ) ( not ( = ?auto_192459 ?auto_192462 ) ) ( not ( = ?auto_192459 ?auto_192461 ) ) ( not ( = ?auto_192460 ?auto_192463 ) ) ( not ( = ?auto_192460 ?auto_192462 ) ) ( not ( = ?auto_192460 ?auto_192461 ) ) ( not ( = ?auto_192465 ?auto_192463 ) ) ( not ( = ?auto_192465 ?auto_192462 ) ) ( not ( = ?auto_192465 ?auto_192461 ) ) ( not ( = ?auto_192466 ?auto_192463 ) ) ( not ( = ?auto_192466 ?auto_192462 ) ) ( not ( = ?auto_192466 ?auto_192461 ) ) ( ON ?auto_192464 ?auto_192466 ) ( CLEAR ?auto_192464 ) ( HOLDING ?auto_192463 ) ( CLEAR ?auto_192461 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192462 ?auto_192461 ?auto_192463 )
      ( MAKE-3PILE ?auto_192458 ?auto_192459 ?auto_192460 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192467 - BLOCK
      ?auto_192468 - BLOCK
      ?auto_192469 - BLOCK
    )
    :vars
    (
      ?auto_192473 - BLOCK
      ?auto_192474 - BLOCK
      ?auto_192471 - BLOCK
      ?auto_192470 - BLOCK
      ?auto_192472 - BLOCK
      ?auto_192475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192473 ?auto_192469 ) ( ON-TABLE ?auto_192467 ) ( ON ?auto_192468 ?auto_192467 ) ( ON ?auto_192469 ?auto_192468 ) ( not ( = ?auto_192467 ?auto_192468 ) ) ( not ( = ?auto_192467 ?auto_192469 ) ) ( not ( = ?auto_192467 ?auto_192473 ) ) ( not ( = ?auto_192468 ?auto_192469 ) ) ( not ( = ?auto_192468 ?auto_192473 ) ) ( not ( = ?auto_192469 ?auto_192473 ) ) ( not ( = ?auto_192467 ?auto_192474 ) ) ( not ( = ?auto_192467 ?auto_192471 ) ) ( not ( = ?auto_192468 ?auto_192474 ) ) ( not ( = ?auto_192468 ?auto_192471 ) ) ( not ( = ?auto_192469 ?auto_192474 ) ) ( not ( = ?auto_192469 ?auto_192471 ) ) ( not ( = ?auto_192473 ?auto_192474 ) ) ( not ( = ?auto_192473 ?auto_192471 ) ) ( not ( = ?auto_192474 ?auto_192471 ) ) ( ON ?auto_192474 ?auto_192473 ) ( ON-TABLE ?auto_192470 ) ( ON ?auto_192472 ?auto_192470 ) ( not ( = ?auto_192470 ?auto_192472 ) ) ( not ( = ?auto_192470 ?auto_192475 ) ) ( not ( = ?auto_192470 ?auto_192471 ) ) ( not ( = ?auto_192472 ?auto_192475 ) ) ( not ( = ?auto_192472 ?auto_192471 ) ) ( not ( = ?auto_192475 ?auto_192471 ) ) ( not ( = ?auto_192467 ?auto_192475 ) ) ( not ( = ?auto_192467 ?auto_192470 ) ) ( not ( = ?auto_192467 ?auto_192472 ) ) ( not ( = ?auto_192468 ?auto_192475 ) ) ( not ( = ?auto_192468 ?auto_192470 ) ) ( not ( = ?auto_192468 ?auto_192472 ) ) ( not ( = ?auto_192469 ?auto_192475 ) ) ( not ( = ?auto_192469 ?auto_192470 ) ) ( not ( = ?auto_192469 ?auto_192472 ) ) ( not ( = ?auto_192473 ?auto_192475 ) ) ( not ( = ?auto_192473 ?auto_192470 ) ) ( not ( = ?auto_192473 ?auto_192472 ) ) ( not ( = ?auto_192474 ?auto_192475 ) ) ( not ( = ?auto_192474 ?auto_192470 ) ) ( not ( = ?auto_192474 ?auto_192472 ) ) ( ON ?auto_192471 ?auto_192474 ) ( CLEAR ?auto_192472 ) ( ON ?auto_192475 ?auto_192471 ) ( CLEAR ?auto_192475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192467 ?auto_192468 ?auto_192469 ?auto_192473 ?auto_192474 ?auto_192471 )
      ( MAKE-3PILE ?auto_192467 ?auto_192468 ?auto_192469 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192476 - BLOCK
      ?auto_192477 - BLOCK
      ?auto_192478 - BLOCK
    )
    :vars
    (
      ?auto_192483 - BLOCK
      ?auto_192479 - BLOCK
      ?auto_192480 - BLOCK
      ?auto_192484 - BLOCK
      ?auto_192481 - BLOCK
      ?auto_192482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192483 ?auto_192478 ) ( ON-TABLE ?auto_192476 ) ( ON ?auto_192477 ?auto_192476 ) ( ON ?auto_192478 ?auto_192477 ) ( not ( = ?auto_192476 ?auto_192477 ) ) ( not ( = ?auto_192476 ?auto_192478 ) ) ( not ( = ?auto_192476 ?auto_192483 ) ) ( not ( = ?auto_192477 ?auto_192478 ) ) ( not ( = ?auto_192477 ?auto_192483 ) ) ( not ( = ?auto_192478 ?auto_192483 ) ) ( not ( = ?auto_192476 ?auto_192479 ) ) ( not ( = ?auto_192476 ?auto_192480 ) ) ( not ( = ?auto_192477 ?auto_192479 ) ) ( not ( = ?auto_192477 ?auto_192480 ) ) ( not ( = ?auto_192478 ?auto_192479 ) ) ( not ( = ?auto_192478 ?auto_192480 ) ) ( not ( = ?auto_192483 ?auto_192479 ) ) ( not ( = ?auto_192483 ?auto_192480 ) ) ( not ( = ?auto_192479 ?auto_192480 ) ) ( ON ?auto_192479 ?auto_192483 ) ( ON-TABLE ?auto_192484 ) ( not ( = ?auto_192484 ?auto_192481 ) ) ( not ( = ?auto_192484 ?auto_192482 ) ) ( not ( = ?auto_192484 ?auto_192480 ) ) ( not ( = ?auto_192481 ?auto_192482 ) ) ( not ( = ?auto_192481 ?auto_192480 ) ) ( not ( = ?auto_192482 ?auto_192480 ) ) ( not ( = ?auto_192476 ?auto_192482 ) ) ( not ( = ?auto_192476 ?auto_192484 ) ) ( not ( = ?auto_192476 ?auto_192481 ) ) ( not ( = ?auto_192477 ?auto_192482 ) ) ( not ( = ?auto_192477 ?auto_192484 ) ) ( not ( = ?auto_192477 ?auto_192481 ) ) ( not ( = ?auto_192478 ?auto_192482 ) ) ( not ( = ?auto_192478 ?auto_192484 ) ) ( not ( = ?auto_192478 ?auto_192481 ) ) ( not ( = ?auto_192483 ?auto_192482 ) ) ( not ( = ?auto_192483 ?auto_192484 ) ) ( not ( = ?auto_192483 ?auto_192481 ) ) ( not ( = ?auto_192479 ?auto_192482 ) ) ( not ( = ?auto_192479 ?auto_192484 ) ) ( not ( = ?auto_192479 ?auto_192481 ) ) ( ON ?auto_192480 ?auto_192479 ) ( ON ?auto_192482 ?auto_192480 ) ( CLEAR ?auto_192482 ) ( HOLDING ?auto_192481 ) ( CLEAR ?auto_192484 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192484 ?auto_192481 )
      ( MAKE-3PILE ?auto_192476 ?auto_192477 ?auto_192478 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192485 - BLOCK
      ?auto_192486 - BLOCK
      ?auto_192487 - BLOCK
    )
    :vars
    (
      ?auto_192491 - BLOCK
      ?auto_192488 - BLOCK
      ?auto_192493 - BLOCK
      ?auto_192489 - BLOCK
      ?auto_192492 - BLOCK
      ?auto_192490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192491 ?auto_192487 ) ( ON-TABLE ?auto_192485 ) ( ON ?auto_192486 ?auto_192485 ) ( ON ?auto_192487 ?auto_192486 ) ( not ( = ?auto_192485 ?auto_192486 ) ) ( not ( = ?auto_192485 ?auto_192487 ) ) ( not ( = ?auto_192485 ?auto_192491 ) ) ( not ( = ?auto_192486 ?auto_192487 ) ) ( not ( = ?auto_192486 ?auto_192491 ) ) ( not ( = ?auto_192487 ?auto_192491 ) ) ( not ( = ?auto_192485 ?auto_192488 ) ) ( not ( = ?auto_192485 ?auto_192493 ) ) ( not ( = ?auto_192486 ?auto_192488 ) ) ( not ( = ?auto_192486 ?auto_192493 ) ) ( not ( = ?auto_192487 ?auto_192488 ) ) ( not ( = ?auto_192487 ?auto_192493 ) ) ( not ( = ?auto_192491 ?auto_192488 ) ) ( not ( = ?auto_192491 ?auto_192493 ) ) ( not ( = ?auto_192488 ?auto_192493 ) ) ( ON ?auto_192488 ?auto_192491 ) ( ON-TABLE ?auto_192489 ) ( not ( = ?auto_192489 ?auto_192492 ) ) ( not ( = ?auto_192489 ?auto_192490 ) ) ( not ( = ?auto_192489 ?auto_192493 ) ) ( not ( = ?auto_192492 ?auto_192490 ) ) ( not ( = ?auto_192492 ?auto_192493 ) ) ( not ( = ?auto_192490 ?auto_192493 ) ) ( not ( = ?auto_192485 ?auto_192490 ) ) ( not ( = ?auto_192485 ?auto_192489 ) ) ( not ( = ?auto_192485 ?auto_192492 ) ) ( not ( = ?auto_192486 ?auto_192490 ) ) ( not ( = ?auto_192486 ?auto_192489 ) ) ( not ( = ?auto_192486 ?auto_192492 ) ) ( not ( = ?auto_192487 ?auto_192490 ) ) ( not ( = ?auto_192487 ?auto_192489 ) ) ( not ( = ?auto_192487 ?auto_192492 ) ) ( not ( = ?auto_192491 ?auto_192490 ) ) ( not ( = ?auto_192491 ?auto_192489 ) ) ( not ( = ?auto_192491 ?auto_192492 ) ) ( not ( = ?auto_192488 ?auto_192490 ) ) ( not ( = ?auto_192488 ?auto_192489 ) ) ( not ( = ?auto_192488 ?auto_192492 ) ) ( ON ?auto_192493 ?auto_192488 ) ( ON ?auto_192490 ?auto_192493 ) ( CLEAR ?auto_192489 ) ( ON ?auto_192492 ?auto_192490 ) ( CLEAR ?auto_192492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192485 ?auto_192486 ?auto_192487 ?auto_192491 ?auto_192488 ?auto_192493 ?auto_192490 )
      ( MAKE-3PILE ?auto_192485 ?auto_192486 ?auto_192487 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192494 - BLOCK
      ?auto_192495 - BLOCK
      ?auto_192496 - BLOCK
    )
    :vars
    (
      ?auto_192501 - BLOCK
      ?auto_192498 - BLOCK
      ?auto_192499 - BLOCK
      ?auto_192500 - BLOCK
      ?auto_192502 - BLOCK
      ?auto_192497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192501 ?auto_192496 ) ( ON-TABLE ?auto_192494 ) ( ON ?auto_192495 ?auto_192494 ) ( ON ?auto_192496 ?auto_192495 ) ( not ( = ?auto_192494 ?auto_192495 ) ) ( not ( = ?auto_192494 ?auto_192496 ) ) ( not ( = ?auto_192494 ?auto_192501 ) ) ( not ( = ?auto_192495 ?auto_192496 ) ) ( not ( = ?auto_192495 ?auto_192501 ) ) ( not ( = ?auto_192496 ?auto_192501 ) ) ( not ( = ?auto_192494 ?auto_192498 ) ) ( not ( = ?auto_192494 ?auto_192499 ) ) ( not ( = ?auto_192495 ?auto_192498 ) ) ( not ( = ?auto_192495 ?auto_192499 ) ) ( not ( = ?auto_192496 ?auto_192498 ) ) ( not ( = ?auto_192496 ?auto_192499 ) ) ( not ( = ?auto_192501 ?auto_192498 ) ) ( not ( = ?auto_192501 ?auto_192499 ) ) ( not ( = ?auto_192498 ?auto_192499 ) ) ( ON ?auto_192498 ?auto_192501 ) ( not ( = ?auto_192500 ?auto_192502 ) ) ( not ( = ?auto_192500 ?auto_192497 ) ) ( not ( = ?auto_192500 ?auto_192499 ) ) ( not ( = ?auto_192502 ?auto_192497 ) ) ( not ( = ?auto_192502 ?auto_192499 ) ) ( not ( = ?auto_192497 ?auto_192499 ) ) ( not ( = ?auto_192494 ?auto_192497 ) ) ( not ( = ?auto_192494 ?auto_192500 ) ) ( not ( = ?auto_192494 ?auto_192502 ) ) ( not ( = ?auto_192495 ?auto_192497 ) ) ( not ( = ?auto_192495 ?auto_192500 ) ) ( not ( = ?auto_192495 ?auto_192502 ) ) ( not ( = ?auto_192496 ?auto_192497 ) ) ( not ( = ?auto_192496 ?auto_192500 ) ) ( not ( = ?auto_192496 ?auto_192502 ) ) ( not ( = ?auto_192501 ?auto_192497 ) ) ( not ( = ?auto_192501 ?auto_192500 ) ) ( not ( = ?auto_192501 ?auto_192502 ) ) ( not ( = ?auto_192498 ?auto_192497 ) ) ( not ( = ?auto_192498 ?auto_192500 ) ) ( not ( = ?auto_192498 ?auto_192502 ) ) ( ON ?auto_192499 ?auto_192498 ) ( ON ?auto_192497 ?auto_192499 ) ( ON ?auto_192502 ?auto_192497 ) ( CLEAR ?auto_192502 ) ( HOLDING ?auto_192500 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192500 )
      ( MAKE-3PILE ?auto_192494 ?auto_192495 ?auto_192496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_192503 - BLOCK
      ?auto_192504 - BLOCK
      ?auto_192505 - BLOCK
    )
    :vars
    (
      ?auto_192511 - BLOCK
      ?auto_192510 - BLOCK
      ?auto_192509 - BLOCK
      ?auto_192507 - BLOCK
      ?auto_192506 - BLOCK
      ?auto_192508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192511 ?auto_192505 ) ( ON-TABLE ?auto_192503 ) ( ON ?auto_192504 ?auto_192503 ) ( ON ?auto_192505 ?auto_192504 ) ( not ( = ?auto_192503 ?auto_192504 ) ) ( not ( = ?auto_192503 ?auto_192505 ) ) ( not ( = ?auto_192503 ?auto_192511 ) ) ( not ( = ?auto_192504 ?auto_192505 ) ) ( not ( = ?auto_192504 ?auto_192511 ) ) ( not ( = ?auto_192505 ?auto_192511 ) ) ( not ( = ?auto_192503 ?auto_192510 ) ) ( not ( = ?auto_192503 ?auto_192509 ) ) ( not ( = ?auto_192504 ?auto_192510 ) ) ( not ( = ?auto_192504 ?auto_192509 ) ) ( not ( = ?auto_192505 ?auto_192510 ) ) ( not ( = ?auto_192505 ?auto_192509 ) ) ( not ( = ?auto_192511 ?auto_192510 ) ) ( not ( = ?auto_192511 ?auto_192509 ) ) ( not ( = ?auto_192510 ?auto_192509 ) ) ( ON ?auto_192510 ?auto_192511 ) ( not ( = ?auto_192507 ?auto_192506 ) ) ( not ( = ?auto_192507 ?auto_192508 ) ) ( not ( = ?auto_192507 ?auto_192509 ) ) ( not ( = ?auto_192506 ?auto_192508 ) ) ( not ( = ?auto_192506 ?auto_192509 ) ) ( not ( = ?auto_192508 ?auto_192509 ) ) ( not ( = ?auto_192503 ?auto_192508 ) ) ( not ( = ?auto_192503 ?auto_192507 ) ) ( not ( = ?auto_192503 ?auto_192506 ) ) ( not ( = ?auto_192504 ?auto_192508 ) ) ( not ( = ?auto_192504 ?auto_192507 ) ) ( not ( = ?auto_192504 ?auto_192506 ) ) ( not ( = ?auto_192505 ?auto_192508 ) ) ( not ( = ?auto_192505 ?auto_192507 ) ) ( not ( = ?auto_192505 ?auto_192506 ) ) ( not ( = ?auto_192511 ?auto_192508 ) ) ( not ( = ?auto_192511 ?auto_192507 ) ) ( not ( = ?auto_192511 ?auto_192506 ) ) ( not ( = ?auto_192510 ?auto_192508 ) ) ( not ( = ?auto_192510 ?auto_192507 ) ) ( not ( = ?auto_192510 ?auto_192506 ) ) ( ON ?auto_192509 ?auto_192510 ) ( ON ?auto_192508 ?auto_192509 ) ( ON ?auto_192506 ?auto_192508 ) ( ON ?auto_192507 ?auto_192506 ) ( CLEAR ?auto_192507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192503 ?auto_192504 ?auto_192505 ?auto_192511 ?auto_192510 ?auto_192509 ?auto_192508 ?auto_192506 )
      ( MAKE-3PILE ?auto_192503 ?auto_192504 ?auto_192505 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192518 - BLOCK
      ?auto_192519 - BLOCK
      ?auto_192520 - BLOCK
      ?auto_192521 - BLOCK
      ?auto_192522 - BLOCK
      ?auto_192523 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_192523 ) ( CLEAR ?auto_192522 ) ( ON-TABLE ?auto_192518 ) ( ON ?auto_192519 ?auto_192518 ) ( ON ?auto_192520 ?auto_192519 ) ( ON ?auto_192521 ?auto_192520 ) ( ON ?auto_192522 ?auto_192521 ) ( not ( = ?auto_192518 ?auto_192519 ) ) ( not ( = ?auto_192518 ?auto_192520 ) ) ( not ( = ?auto_192518 ?auto_192521 ) ) ( not ( = ?auto_192518 ?auto_192522 ) ) ( not ( = ?auto_192518 ?auto_192523 ) ) ( not ( = ?auto_192519 ?auto_192520 ) ) ( not ( = ?auto_192519 ?auto_192521 ) ) ( not ( = ?auto_192519 ?auto_192522 ) ) ( not ( = ?auto_192519 ?auto_192523 ) ) ( not ( = ?auto_192520 ?auto_192521 ) ) ( not ( = ?auto_192520 ?auto_192522 ) ) ( not ( = ?auto_192520 ?auto_192523 ) ) ( not ( = ?auto_192521 ?auto_192522 ) ) ( not ( = ?auto_192521 ?auto_192523 ) ) ( not ( = ?auto_192522 ?auto_192523 ) ) )
    :subtasks
    ( ( !STACK ?auto_192523 ?auto_192522 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192524 - BLOCK
      ?auto_192525 - BLOCK
      ?auto_192526 - BLOCK
      ?auto_192527 - BLOCK
      ?auto_192528 - BLOCK
      ?auto_192529 - BLOCK
    )
    :vars
    (
      ?auto_192530 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_192528 ) ( ON-TABLE ?auto_192524 ) ( ON ?auto_192525 ?auto_192524 ) ( ON ?auto_192526 ?auto_192525 ) ( ON ?auto_192527 ?auto_192526 ) ( ON ?auto_192528 ?auto_192527 ) ( not ( = ?auto_192524 ?auto_192525 ) ) ( not ( = ?auto_192524 ?auto_192526 ) ) ( not ( = ?auto_192524 ?auto_192527 ) ) ( not ( = ?auto_192524 ?auto_192528 ) ) ( not ( = ?auto_192524 ?auto_192529 ) ) ( not ( = ?auto_192525 ?auto_192526 ) ) ( not ( = ?auto_192525 ?auto_192527 ) ) ( not ( = ?auto_192525 ?auto_192528 ) ) ( not ( = ?auto_192525 ?auto_192529 ) ) ( not ( = ?auto_192526 ?auto_192527 ) ) ( not ( = ?auto_192526 ?auto_192528 ) ) ( not ( = ?auto_192526 ?auto_192529 ) ) ( not ( = ?auto_192527 ?auto_192528 ) ) ( not ( = ?auto_192527 ?auto_192529 ) ) ( not ( = ?auto_192528 ?auto_192529 ) ) ( ON ?auto_192529 ?auto_192530 ) ( CLEAR ?auto_192529 ) ( HAND-EMPTY ) ( not ( = ?auto_192524 ?auto_192530 ) ) ( not ( = ?auto_192525 ?auto_192530 ) ) ( not ( = ?auto_192526 ?auto_192530 ) ) ( not ( = ?auto_192527 ?auto_192530 ) ) ( not ( = ?auto_192528 ?auto_192530 ) ) ( not ( = ?auto_192529 ?auto_192530 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192529 ?auto_192530 )
      ( MAKE-6PILE ?auto_192524 ?auto_192525 ?auto_192526 ?auto_192527 ?auto_192528 ?auto_192529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192531 - BLOCK
      ?auto_192532 - BLOCK
      ?auto_192533 - BLOCK
      ?auto_192534 - BLOCK
      ?auto_192535 - BLOCK
      ?auto_192536 - BLOCK
    )
    :vars
    (
      ?auto_192537 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192531 ) ( ON ?auto_192532 ?auto_192531 ) ( ON ?auto_192533 ?auto_192532 ) ( ON ?auto_192534 ?auto_192533 ) ( not ( = ?auto_192531 ?auto_192532 ) ) ( not ( = ?auto_192531 ?auto_192533 ) ) ( not ( = ?auto_192531 ?auto_192534 ) ) ( not ( = ?auto_192531 ?auto_192535 ) ) ( not ( = ?auto_192531 ?auto_192536 ) ) ( not ( = ?auto_192532 ?auto_192533 ) ) ( not ( = ?auto_192532 ?auto_192534 ) ) ( not ( = ?auto_192532 ?auto_192535 ) ) ( not ( = ?auto_192532 ?auto_192536 ) ) ( not ( = ?auto_192533 ?auto_192534 ) ) ( not ( = ?auto_192533 ?auto_192535 ) ) ( not ( = ?auto_192533 ?auto_192536 ) ) ( not ( = ?auto_192534 ?auto_192535 ) ) ( not ( = ?auto_192534 ?auto_192536 ) ) ( not ( = ?auto_192535 ?auto_192536 ) ) ( ON ?auto_192536 ?auto_192537 ) ( CLEAR ?auto_192536 ) ( not ( = ?auto_192531 ?auto_192537 ) ) ( not ( = ?auto_192532 ?auto_192537 ) ) ( not ( = ?auto_192533 ?auto_192537 ) ) ( not ( = ?auto_192534 ?auto_192537 ) ) ( not ( = ?auto_192535 ?auto_192537 ) ) ( not ( = ?auto_192536 ?auto_192537 ) ) ( HOLDING ?auto_192535 ) ( CLEAR ?auto_192534 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192531 ?auto_192532 ?auto_192533 ?auto_192534 ?auto_192535 )
      ( MAKE-6PILE ?auto_192531 ?auto_192532 ?auto_192533 ?auto_192534 ?auto_192535 ?auto_192536 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192538 - BLOCK
      ?auto_192539 - BLOCK
      ?auto_192540 - BLOCK
      ?auto_192541 - BLOCK
      ?auto_192542 - BLOCK
      ?auto_192543 - BLOCK
    )
    :vars
    (
      ?auto_192544 - BLOCK
      ?auto_192545 - BLOCK
      ?auto_192546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192538 ) ( ON ?auto_192539 ?auto_192538 ) ( ON ?auto_192540 ?auto_192539 ) ( ON ?auto_192541 ?auto_192540 ) ( not ( = ?auto_192538 ?auto_192539 ) ) ( not ( = ?auto_192538 ?auto_192540 ) ) ( not ( = ?auto_192538 ?auto_192541 ) ) ( not ( = ?auto_192538 ?auto_192542 ) ) ( not ( = ?auto_192538 ?auto_192543 ) ) ( not ( = ?auto_192539 ?auto_192540 ) ) ( not ( = ?auto_192539 ?auto_192541 ) ) ( not ( = ?auto_192539 ?auto_192542 ) ) ( not ( = ?auto_192539 ?auto_192543 ) ) ( not ( = ?auto_192540 ?auto_192541 ) ) ( not ( = ?auto_192540 ?auto_192542 ) ) ( not ( = ?auto_192540 ?auto_192543 ) ) ( not ( = ?auto_192541 ?auto_192542 ) ) ( not ( = ?auto_192541 ?auto_192543 ) ) ( not ( = ?auto_192542 ?auto_192543 ) ) ( ON ?auto_192543 ?auto_192544 ) ( not ( = ?auto_192538 ?auto_192544 ) ) ( not ( = ?auto_192539 ?auto_192544 ) ) ( not ( = ?auto_192540 ?auto_192544 ) ) ( not ( = ?auto_192541 ?auto_192544 ) ) ( not ( = ?auto_192542 ?auto_192544 ) ) ( not ( = ?auto_192543 ?auto_192544 ) ) ( CLEAR ?auto_192541 ) ( ON ?auto_192542 ?auto_192543 ) ( CLEAR ?auto_192542 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192545 ) ( ON ?auto_192546 ?auto_192545 ) ( ON ?auto_192544 ?auto_192546 ) ( not ( = ?auto_192545 ?auto_192546 ) ) ( not ( = ?auto_192545 ?auto_192544 ) ) ( not ( = ?auto_192545 ?auto_192543 ) ) ( not ( = ?auto_192545 ?auto_192542 ) ) ( not ( = ?auto_192546 ?auto_192544 ) ) ( not ( = ?auto_192546 ?auto_192543 ) ) ( not ( = ?auto_192546 ?auto_192542 ) ) ( not ( = ?auto_192538 ?auto_192545 ) ) ( not ( = ?auto_192538 ?auto_192546 ) ) ( not ( = ?auto_192539 ?auto_192545 ) ) ( not ( = ?auto_192539 ?auto_192546 ) ) ( not ( = ?auto_192540 ?auto_192545 ) ) ( not ( = ?auto_192540 ?auto_192546 ) ) ( not ( = ?auto_192541 ?auto_192545 ) ) ( not ( = ?auto_192541 ?auto_192546 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192545 ?auto_192546 ?auto_192544 ?auto_192543 )
      ( MAKE-6PILE ?auto_192538 ?auto_192539 ?auto_192540 ?auto_192541 ?auto_192542 ?auto_192543 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192547 - BLOCK
      ?auto_192548 - BLOCK
      ?auto_192549 - BLOCK
      ?auto_192550 - BLOCK
      ?auto_192551 - BLOCK
      ?auto_192552 - BLOCK
    )
    :vars
    (
      ?auto_192555 - BLOCK
      ?auto_192554 - BLOCK
      ?auto_192553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192547 ) ( ON ?auto_192548 ?auto_192547 ) ( ON ?auto_192549 ?auto_192548 ) ( not ( = ?auto_192547 ?auto_192548 ) ) ( not ( = ?auto_192547 ?auto_192549 ) ) ( not ( = ?auto_192547 ?auto_192550 ) ) ( not ( = ?auto_192547 ?auto_192551 ) ) ( not ( = ?auto_192547 ?auto_192552 ) ) ( not ( = ?auto_192548 ?auto_192549 ) ) ( not ( = ?auto_192548 ?auto_192550 ) ) ( not ( = ?auto_192548 ?auto_192551 ) ) ( not ( = ?auto_192548 ?auto_192552 ) ) ( not ( = ?auto_192549 ?auto_192550 ) ) ( not ( = ?auto_192549 ?auto_192551 ) ) ( not ( = ?auto_192549 ?auto_192552 ) ) ( not ( = ?auto_192550 ?auto_192551 ) ) ( not ( = ?auto_192550 ?auto_192552 ) ) ( not ( = ?auto_192551 ?auto_192552 ) ) ( ON ?auto_192552 ?auto_192555 ) ( not ( = ?auto_192547 ?auto_192555 ) ) ( not ( = ?auto_192548 ?auto_192555 ) ) ( not ( = ?auto_192549 ?auto_192555 ) ) ( not ( = ?auto_192550 ?auto_192555 ) ) ( not ( = ?auto_192551 ?auto_192555 ) ) ( not ( = ?auto_192552 ?auto_192555 ) ) ( ON ?auto_192551 ?auto_192552 ) ( CLEAR ?auto_192551 ) ( ON-TABLE ?auto_192554 ) ( ON ?auto_192553 ?auto_192554 ) ( ON ?auto_192555 ?auto_192553 ) ( not ( = ?auto_192554 ?auto_192553 ) ) ( not ( = ?auto_192554 ?auto_192555 ) ) ( not ( = ?auto_192554 ?auto_192552 ) ) ( not ( = ?auto_192554 ?auto_192551 ) ) ( not ( = ?auto_192553 ?auto_192555 ) ) ( not ( = ?auto_192553 ?auto_192552 ) ) ( not ( = ?auto_192553 ?auto_192551 ) ) ( not ( = ?auto_192547 ?auto_192554 ) ) ( not ( = ?auto_192547 ?auto_192553 ) ) ( not ( = ?auto_192548 ?auto_192554 ) ) ( not ( = ?auto_192548 ?auto_192553 ) ) ( not ( = ?auto_192549 ?auto_192554 ) ) ( not ( = ?auto_192549 ?auto_192553 ) ) ( not ( = ?auto_192550 ?auto_192554 ) ) ( not ( = ?auto_192550 ?auto_192553 ) ) ( HOLDING ?auto_192550 ) ( CLEAR ?auto_192549 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192547 ?auto_192548 ?auto_192549 ?auto_192550 )
      ( MAKE-6PILE ?auto_192547 ?auto_192548 ?auto_192549 ?auto_192550 ?auto_192551 ?auto_192552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192556 - BLOCK
      ?auto_192557 - BLOCK
      ?auto_192558 - BLOCK
      ?auto_192559 - BLOCK
      ?auto_192560 - BLOCK
      ?auto_192561 - BLOCK
    )
    :vars
    (
      ?auto_192562 - BLOCK
      ?auto_192564 - BLOCK
      ?auto_192563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192556 ) ( ON ?auto_192557 ?auto_192556 ) ( ON ?auto_192558 ?auto_192557 ) ( not ( = ?auto_192556 ?auto_192557 ) ) ( not ( = ?auto_192556 ?auto_192558 ) ) ( not ( = ?auto_192556 ?auto_192559 ) ) ( not ( = ?auto_192556 ?auto_192560 ) ) ( not ( = ?auto_192556 ?auto_192561 ) ) ( not ( = ?auto_192557 ?auto_192558 ) ) ( not ( = ?auto_192557 ?auto_192559 ) ) ( not ( = ?auto_192557 ?auto_192560 ) ) ( not ( = ?auto_192557 ?auto_192561 ) ) ( not ( = ?auto_192558 ?auto_192559 ) ) ( not ( = ?auto_192558 ?auto_192560 ) ) ( not ( = ?auto_192558 ?auto_192561 ) ) ( not ( = ?auto_192559 ?auto_192560 ) ) ( not ( = ?auto_192559 ?auto_192561 ) ) ( not ( = ?auto_192560 ?auto_192561 ) ) ( ON ?auto_192561 ?auto_192562 ) ( not ( = ?auto_192556 ?auto_192562 ) ) ( not ( = ?auto_192557 ?auto_192562 ) ) ( not ( = ?auto_192558 ?auto_192562 ) ) ( not ( = ?auto_192559 ?auto_192562 ) ) ( not ( = ?auto_192560 ?auto_192562 ) ) ( not ( = ?auto_192561 ?auto_192562 ) ) ( ON ?auto_192560 ?auto_192561 ) ( ON-TABLE ?auto_192564 ) ( ON ?auto_192563 ?auto_192564 ) ( ON ?auto_192562 ?auto_192563 ) ( not ( = ?auto_192564 ?auto_192563 ) ) ( not ( = ?auto_192564 ?auto_192562 ) ) ( not ( = ?auto_192564 ?auto_192561 ) ) ( not ( = ?auto_192564 ?auto_192560 ) ) ( not ( = ?auto_192563 ?auto_192562 ) ) ( not ( = ?auto_192563 ?auto_192561 ) ) ( not ( = ?auto_192563 ?auto_192560 ) ) ( not ( = ?auto_192556 ?auto_192564 ) ) ( not ( = ?auto_192556 ?auto_192563 ) ) ( not ( = ?auto_192557 ?auto_192564 ) ) ( not ( = ?auto_192557 ?auto_192563 ) ) ( not ( = ?auto_192558 ?auto_192564 ) ) ( not ( = ?auto_192558 ?auto_192563 ) ) ( not ( = ?auto_192559 ?auto_192564 ) ) ( not ( = ?auto_192559 ?auto_192563 ) ) ( CLEAR ?auto_192558 ) ( ON ?auto_192559 ?auto_192560 ) ( CLEAR ?auto_192559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192564 ?auto_192563 ?auto_192562 ?auto_192561 ?auto_192560 )
      ( MAKE-6PILE ?auto_192556 ?auto_192557 ?auto_192558 ?auto_192559 ?auto_192560 ?auto_192561 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192565 - BLOCK
      ?auto_192566 - BLOCK
      ?auto_192567 - BLOCK
      ?auto_192568 - BLOCK
      ?auto_192569 - BLOCK
      ?auto_192570 - BLOCK
    )
    :vars
    (
      ?auto_192571 - BLOCK
      ?auto_192573 - BLOCK
      ?auto_192572 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192565 ) ( ON ?auto_192566 ?auto_192565 ) ( not ( = ?auto_192565 ?auto_192566 ) ) ( not ( = ?auto_192565 ?auto_192567 ) ) ( not ( = ?auto_192565 ?auto_192568 ) ) ( not ( = ?auto_192565 ?auto_192569 ) ) ( not ( = ?auto_192565 ?auto_192570 ) ) ( not ( = ?auto_192566 ?auto_192567 ) ) ( not ( = ?auto_192566 ?auto_192568 ) ) ( not ( = ?auto_192566 ?auto_192569 ) ) ( not ( = ?auto_192566 ?auto_192570 ) ) ( not ( = ?auto_192567 ?auto_192568 ) ) ( not ( = ?auto_192567 ?auto_192569 ) ) ( not ( = ?auto_192567 ?auto_192570 ) ) ( not ( = ?auto_192568 ?auto_192569 ) ) ( not ( = ?auto_192568 ?auto_192570 ) ) ( not ( = ?auto_192569 ?auto_192570 ) ) ( ON ?auto_192570 ?auto_192571 ) ( not ( = ?auto_192565 ?auto_192571 ) ) ( not ( = ?auto_192566 ?auto_192571 ) ) ( not ( = ?auto_192567 ?auto_192571 ) ) ( not ( = ?auto_192568 ?auto_192571 ) ) ( not ( = ?auto_192569 ?auto_192571 ) ) ( not ( = ?auto_192570 ?auto_192571 ) ) ( ON ?auto_192569 ?auto_192570 ) ( ON-TABLE ?auto_192573 ) ( ON ?auto_192572 ?auto_192573 ) ( ON ?auto_192571 ?auto_192572 ) ( not ( = ?auto_192573 ?auto_192572 ) ) ( not ( = ?auto_192573 ?auto_192571 ) ) ( not ( = ?auto_192573 ?auto_192570 ) ) ( not ( = ?auto_192573 ?auto_192569 ) ) ( not ( = ?auto_192572 ?auto_192571 ) ) ( not ( = ?auto_192572 ?auto_192570 ) ) ( not ( = ?auto_192572 ?auto_192569 ) ) ( not ( = ?auto_192565 ?auto_192573 ) ) ( not ( = ?auto_192565 ?auto_192572 ) ) ( not ( = ?auto_192566 ?auto_192573 ) ) ( not ( = ?auto_192566 ?auto_192572 ) ) ( not ( = ?auto_192567 ?auto_192573 ) ) ( not ( = ?auto_192567 ?auto_192572 ) ) ( not ( = ?auto_192568 ?auto_192573 ) ) ( not ( = ?auto_192568 ?auto_192572 ) ) ( ON ?auto_192568 ?auto_192569 ) ( CLEAR ?auto_192568 ) ( HOLDING ?auto_192567 ) ( CLEAR ?auto_192566 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192565 ?auto_192566 ?auto_192567 )
      ( MAKE-6PILE ?auto_192565 ?auto_192566 ?auto_192567 ?auto_192568 ?auto_192569 ?auto_192570 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192574 - BLOCK
      ?auto_192575 - BLOCK
      ?auto_192576 - BLOCK
      ?auto_192577 - BLOCK
      ?auto_192578 - BLOCK
      ?auto_192579 - BLOCK
    )
    :vars
    (
      ?auto_192582 - BLOCK
      ?auto_192581 - BLOCK
      ?auto_192580 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192574 ) ( ON ?auto_192575 ?auto_192574 ) ( not ( = ?auto_192574 ?auto_192575 ) ) ( not ( = ?auto_192574 ?auto_192576 ) ) ( not ( = ?auto_192574 ?auto_192577 ) ) ( not ( = ?auto_192574 ?auto_192578 ) ) ( not ( = ?auto_192574 ?auto_192579 ) ) ( not ( = ?auto_192575 ?auto_192576 ) ) ( not ( = ?auto_192575 ?auto_192577 ) ) ( not ( = ?auto_192575 ?auto_192578 ) ) ( not ( = ?auto_192575 ?auto_192579 ) ) ( not ( = ?auto_192576 ?auto_192577 ) ) ( not ( = ?auto_192576 ?auto_192578 ) ) ( not ( = ?auto_192576 ?auto_192579 ) ) ( not ( = ?auto_192577 ?auto_192578 ) ) ( not ( = ?auto_192577 ?auto_192579 ) ) ( not ( = ?auto_192578 ?auto_192579 ) ) ( ON ?auto_192579 ?auto_192582 ) ( not ( = ?auto_192574 ?auto_192582 ) ) ( not ( = ?auto_192575 ?auto_192582 ) ) ( not ( = ?auto_192576 ?auto_192582 ) ) ( not ( = ?auto_192577 ?auto_192582 ) ) ( not ( = ?auto_192578 ?auto_192582 ) ) ( not ( = ?auto_192579 ?auto_192582 ) ) ( ON ?auto_192578 ?auto_192579 ) ( ON-TABLE ?auto_192581 ) ( ON ?auto_192580 ?auto_192581 ) ( ON ?auto_192582 ?auto_192580 ) ( not ( = ?auto_192581 ?auto_192580 ) ) ( not ( = ?auto_192581 ?auto_192582 ) ) ( not ( = ?auto_192581 ?auto_192579 ) ) ( not ( = ?auto_192581 ?auto_192578 ) ) ( not ( = ?auto_192580 ?auto_192582 ) ) ( not ( = ?auto_192580 ?auto_192579 ) ) ( not ( = ?auto_192580 ?auto_192578 ) ) ( not ( = ?auto_192574 ?auto_192581 ) ) ( not ( = ?auto_192574 ?auto_192580 ) ) ( not ( = ?auto_192575 ?auto_192581 ) ) ( not ( = ?auto_192575 ?auto_192580 ) ) ( not ( = ?auto_192576 ?auto_192581 ) ) ( not ( = ?auto_192576 ?auto_192580 ) ) ( not ( = ?auto_192577 ?auto_192581 ) ) ( not ( = ?auto_192577 ?auto_192580 ) ) ( ON ?auto_192577 ?auto_192578 ) ( CLEAR ?auto_192575 ) ( ON ?auto_192576 ?auto_192577 ) ( CLEAR ?auto_192576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192581 ?auto_192580 ?auto_192582 ?auto_192579 ?auto_192578 ?auto_192577 )
      ( MAKE-6PILE ?auto_192574 ?auto_192575 ?auto_192576 ?auto_192577 ?auto_192578 ?auto_192579 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192583 - BLOCK
      ?auto_192584 - BLOCK
      ?auto_192585 - BLOCK
      ?auto_192586 - BLOCK
      ?auto_192587 - BLOCK
      ?auto_192588 - BLOCK
    )
    :vars
    (
      ?auto_192589 - BLOCK
      ?auto_192591 - BLOCK
      ?auto_192590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192583 ) ( not ( = ?auto_192583 ?auto_192584 ) ) ( not ( = ?auto_192583 ?auto_192585 ) ) ( not ( = ?auto_192583 ?auto_192586 ) ) ( not ( = ?auto_192583 ?auto_192587 ) ) ( not ( = ?auto_192583 ?auto_192588 ) ) ( not ( = ?auto_192584 ?auto_192585 ) ) ( not ( = ?auto_192584 ?auto_192586 ) ) ( not ( = ?auto_192584 ?auto_192587 ) ) ( not ( = ?auto_192584 ?auto_192588 ) ) ( not ( = ?auto_192585 ?auto_192586 ) ) ( not ( = ?auto_192585 ?auto_192587 ) ) ( not ( = ?auto_192585 ?auto_192588 ) ) ( not ( = ?auto_192586 ?auto_192587 ) ) ( not ( = ?auto_192586 ?auto_192588 ) ) ( not ( = ?auto_192587 ?auto_192588 ) ) ( ON ?auto_192588 ?auto_192589 ) ( not ( = ?auto_192583 ?auto_192589 ) ) ( not ( = ?auto_192584 ?auto_192589 ) ) ( not ( = ?auto_192585 ?auto_192589 ) ) ( not ( = ?auto_192586 ?auto_192589 ) ) ( not ( = ?auto_192587 ?auto_192589 ) ) ( not ( = ?auto_192588 ?auto_192589 ) ) ( ON ?auto_192587 ?auto_192588 ) ( ON-TABLE ?auto_192591 ) ( ON ?auto_192590 ?auto_192591 ) ( ON ?auto_192589 ?auto_192590 ) ( not ( = ?auto_192591 ?auto_192590 ) ) ( not ( = ?auto_192591 ?auto_192589 ) ) ( not ( = ?auto_192591 ?auto_192588 ) ) ( not ( = ?auto_192591 ?auto_192587 ) ) ( not ( = ?auto_192590 ?auto_192589 ) ) ( not ( = ?auto_192590 ?auto_192588 ) ) ( not ( = ?auto_192590 ?auto_192587 ) ) ( not ( = ?auto_192583 ?auto_192591 ) ) ( not ( = ?auto_192583 ?auto_192590 ) ) ( not ( = ?auto_192584 ?auto_192591 ) ) ( not ( = ?auto_192584 ?auto_192590 ) ) ( not ( = ?auto_192585 ?auto_192591 ) ) ( not ( = ?auto_192585 ?auto_192590 ) ) ( not ( = ?auto_192586 ?auto_192591 ) ) ( not ( = ?auto_192586 ?auto_192590 ) ) ( ON ?auto_192586 ?auto_192587 ) ( ON ?auto_192585 ?auto_192586 ) ( CLEAR ?auto_192585 ) ( HOLDING ?auto_192584 ) ( CLEAR ?auto_192583 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192583 ?auto_192584 )
      ( MAKE-6PILE ?auto_192583 ?auto_192584 ?auto_192585 ?auto_192586 ?auto_192587 ?auto_192588 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192592 - BLOCK
      ?auto_192593 - BLOCK
      ?auto_192594 - BLOCK
      ?auto_192595 - BLOCK
      ?auto_192596 - BLOCK
      ?auto_192597 - BLOCK
    )
    :vars
    (
      ?auto_192599 - BLOCK
      ?auto_192600 - BLOCK
      ?auto_192598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192592 ) ( not ( = ?auto_192592 ?auto_192593 ) ) ( not ( = ?auto_192592 ?auto_192594 ) ) ( not ( = ?auto_192592 ?auto_192595 ) ) ( not ( = ?auto_192592 ?auto_192596 ) ) ( not ( = ?auto_192592 ?auto_192597 ) ) ( not ( = ?auto_192593 ?auto_192594 ) ) ( not ( = ?auto_192593 ?auto_192595 ) ) ( not ( = ?auto_192593 ?auto_192596 ) ) ( not ( = ?auto_192593 ?auto_192597 ) ) ( not ( = ?auto_192594 ?auto_192595 ) ) ( not ( = ?auto_192594 ?auto_192596 ) ) ( not ( = ?auto_192594 ?auto_192597 ) ) ( not ( = ?auto_192595 ?auto_192596 ) ) ( not ( = ?auto_192595 ?auto_192597 ) ) ( not ( = ?auto_192596 ?auto_192597 ) ) ( ON ?auto_192597 ?auto_192599 ) ( not ( = ?auto_192592 ?auto_192599 ) ) ( not ( = ?auto_192593 ?auto_192599 ) ) ( not ( = ?auto_192594 ?auto_192599 ) ) ( not ( = ?auto_192595 ?auto_192599 ) ) ( not ( = ?auto_192596 ?auto_192599 ) ) ( not ( = ?auto_192597 ?auto_192599 ) ) ( ON ?auto_192596 ?auto_192597 ) ( ON-TABLE ?auto_192600 ) ( ON ?auto_192598 ?auto_192600 ) ( ON ?auto_192599 ?auto_192598 ) ( not ( = ?auto_192600 ?auto_192598 ) ) ( not ( = ?auto_192600 ?auto_192599 ) ) ( not ( = ?auto_192600 ?auto_192597 ) ) ( not ( = ?auto_192600 ?auto_192596 ) ) ( not ( = ?auto_192598 ?auto_192599 ) ) ( not ( = ?auto_192598 ?auto_192597 ) ) ( not ( = ?auto_192598 ?auto_192596 ) ) ( not ( = ?auto_192592 ?auto_192600 ) ) ( not ( = ?auto_192592 ?auto_192598 ) ) ( not ( = ?auto_192593 ?auto_192600 ) ) ( not ( = ?auto_192593 ?auto_192598 ) ) ( not ( = ?auto_192594 ?auto_192600 ) ) ( not ( = ?auto_192594 ?auto_192598 ) ) ( not ( = ?auto_192595 ?auto_192600 ) ) ( not ( = ?auto_192595 ?auto_192598 ) ) ( ON ?auto_192595 ?auto_192596 ) ( ON ?auto_192594 ?auto_192595 ) ( CLEAR ?auto_192592 ) ( ON ?auto_192593 ?auto_192594 ) ( CLEAR ?auto_192593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192600 ?auto_192598 ?auto_192599 ?auto_192597 ?auto_192596 ?auto_192595 ?auto_192594 )
      ( MAKE-6PILE ?auto_192592 ?auto_192593 ?auto_192594 ?auto_192595 ?auto_192596 ?auto_192597 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192601 - BLOCK
      ?auto_192602 - BLOCK
      ?auto_192603 - BLOCK
      ?auto_192604 - BLOCK
      ?auto_192605 - BLOCK
      ?auto_192606 - BLOCK
    )
    :vars
    (
      ?auto_192607 - BLOCK
      ?auto_192609 - BLOCK
      ?auto_192608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_192601 ?auto_192602 ) ) ( not ( = ?auto_192601 ?auto_192603 ) ) ( not ( = ?auto_192601 ?auto_192604 ) ) ( not ( = ?auto_192601 ?auto_192605 ) ) ( not ( = ?auto_192601 ?auto_192606 ) ) ( not ( = ?auto_192602 ?auto_192603 ) ) ( not ( = ?auto_192602 ?auto_192604 ) ) ( not ( = ?auto_192602 ?auto_192605 ) ) ( not ( = ?auto_192602 ?auto_192606 ) ) ( not ( = ?auto_192603 ?auto_192604 ) ) ( not ( = ?auto_192603 ?auto_192605 ) ) ( not ( = ?auto_192603 ?auto_192606 ) ) ( not ( = ?auto_192604 ?auto_192605 ) ) ( not ( = ?auto_192604 ?auto_192606 ) ) ( not ( = ?auto_192605 ?auto_192606 ) ) ( ON ?auto_192606 ?auto_192607 ) ( not ( = ?auto_192601 ?auto_192607 ) ) ( not ( = ?auto_192602 ?auto_192607 ) ) ( not ( = ?auto_192603 ?auto_192607 ) ) ( not ( = ?auto_192604 ?auto_192607 ) ) ( not ( = ?auto_192605 ?auto_192607 ) ) ( not ( = ?auto_192606 ?auto_192607 ) ) ( ON ?auto_192605 ?auto_192606 ) ( ON-TABLE ?auto_192609 ) ( ON ?auto_192608 ?auto_192609 ) ( ON ?auto_192607 ?auto_192608 ) ( not ( = ?auto_192609 ?auto_192608 ) ) ( not ( = ?auto_192609 ?auto_192607 ) ) ( not ( = ?auto_192609 ?auto_192606 ) ) ( not ( = ?auto_192609 ?auto_192605 ) ) ( not ( = ?auto_192608 ?auto_192607 ) ) ( not ( = ?auto_192608 ?auto_192606 ) ) ( not ( = ?auto_192608 ?auto_192605 ) ) ( not ( = ?auto_192601 ?auto_192609 ) ) ( not ( = ?auto_192601 ?auto_192608 ) ) ( not ( = ?auto_192602 ?auto_192609 ) ) ( not ( = ?auto_192602 ?auto_192608 ) ) ( not ( = ?auto_192603 ?auto_192609 ) ) ( not ( = ?auto_192603 ?auto_192608 ) ) ( not ( = ?auto_192604 ?auto_192609 ) ) ( not ( = ?auto_192604 ?auto_192608 ) ) ( ON ?auto_192604 ?auto_192605 ) ( ON ?auto_192603 ?auto_192604 ) ( ON ?auto_192602 ?auto_192603 ) ( CLEAR ?auto_192602 ) ( HOLDING ?auto_192601 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192601 )
      ( MAKE-6PILE ?auto_192601 ?auto_192602 ?auto_192603 ?auto_192604 ?auto_192605 ?auto_192606 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_192610 - BLOCK
      ?auto_192611 - BLOCK
      ?auto_192612 - BLOCK
      ?auto_192613 - BLOCK
      ?auto_192614 - BLOCK
      ?auto_192615 - BLOCK
    )
    :vars
    (
      ?auto_192617 - BLOCK
      ?auto_192618 - BLOCK
      ?auto_192616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_192610 ?auto_192611 ) ) ( not ( = ?auto_192610 ?auto_192612 ) ) ( not ( = ?auto_192610 ?auto_192613 ) ) ( not ( = ?auto_192610 ?auto_192614 ) ) ( not ( = ?auto_192610 ?auto_192615 ) ) ( not ( = ?auto_192611 ?auto_192612 ) ) ( not ( = ?auto_192611 ?auto_192613 ) ) ( not ( = ?auto_192611 ?auto_192614 ) ) ( not ( = ?auto_192611 ?auto_192615 ) ) ( not ( = ?auto_192612 ?auto_192613 ) ) ( not ( = ?auto_192612 ?auto_192614 ) ) ( not ( = ?auto_192612 ?auto_192615 ) ) ( not ( = ?auto_192613 ?auto_192614 ) ) ( not ( = ?auto_192613 ?auto_192615 ) ) ( not ( = ?auto_192614 ?auto_192615 ) ) ( ON ?auto_192615 ?auto_192617 ) ( not ( = ?auto_192610 ?auto_192617 ) ) ( not ( = ?auto_192611 ?auto_192617 ) ) ( not ( = ?auto_192612 ?auto_192617 ) ) ( not ( = ?auto_192613 ?auto_192617 ) ) ( not ( = ?auto_192614 ?auto_192617 ) ) ( not ( = ?auto_192615 ?auto_192617 ) ) ( ON ?auto_192614 ?auto_192615 ) ( ON-TABLE ?auto_192618 ) ( ON ?auto_192616 ?auto_192618 ) ( ON ?auto_192617 ?auto_192616 ) ( not ( = ?auto_192618 ?auto_192616 ) ) ( not ( = ?auto_192618 ?auto_192617 ) ) ( not ( = ?auto_192618 ?auto_192615 ) ) ( not ( = ?auto_192618 ?auto_192614 ) ) ( not ( = ?auto_192616 ?auto_192617 ) ) ( not ( = ?auto_192616 ?auto_192615 ) ) ( not ( = ?auto_192616 ?auto_192614 ) ) ( not ( = ?auto_192610 ?auto_192618 ) ) ( not ( = ?auto_192610 ?auto_192616 ) ) ( not ( = ?auto_192611 ?auto_192618 ) ) ( not ( = ?auto_192611 ?auto_192616 ) ) ( not ( = ?auto_192612 ?auto_192618 ) ) ( not ( = ?auto_192612 ?auto_192616 ) ) ( not ( = ?auto_192613 ?auto_192618 ) ) ( not ( = ?auto_192613 ?auto_192616 ) ) ( ON ?auto_192613 ?auto_192614 ) ( ON ?auto_192612 ?auto_192613 ) ( ON ?auto_192611 ?auto_192612 ) ( ON ?auto_192610 ?auto_192611 ) ( CLEAR ?auto_192610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192618 ?auto_192616 ?auto_192617 ?auto_192615 ?auto_192614 ?auto_192613 ?auto_192612 ?auto_192611 )
      ( MAKE-6PILE ?auto_192610 ?auto_192611 ?auto_192612 ?auto_192613 ?auto_192614 ?auto_192615 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192621 - BLOCK
      ?auto_192622 - BLOCK
    )
    :vars
    (
      ?auto_192623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192623 ?auto_192622 ) ( CLEAR ?auto_192623 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192621 ) ( ON ?auto_192622 ?auto_192621 ) ( not ( = ?auto_192621 ?auto_192622 ) ) ( not ( = ?auto_192621 ?auto_192623 ) ) ( not ( = ?auto_192622 ?auto_192623 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192623 ?auto_192622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192624 - BLOCK
      ?auto_192625 - BLOCK
    )
    :vars
    (
      ?auto_192626 - BLOCK
      ?auto_192627 - BLOCK
      ?auto_192628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192626 ?auto_192625 ) ( CLEAR ?auto_192626 ) ( ON-TABLE ?auto_192624 ) ( ON ?auto_192625 ?auto_192624 ) ( not ( = ?auto_192624 ?auto_192625 ) ) ( not ( = ?auto_192624 ?auto_192626 ) ) ( not ( = ?auto_192625 ?auto_192626 ) ) ( HOLDING ?auto_192627 ) ( CLEAR ?auto_192628 ) ( not ( = ?auto_192624 ?auto_192627 ) ) ( not ( = ?auto_192624 ?auto_192628 ) ) ( not ( = ?auto_192625 ?auto_192627 ) ) ( not ( = ?auto_192625 ?auto_192628 ) ) ( not ( = ?auto_192626 ?auto_192627 ) ) ( not ( = ?auto_192626 ?auto_192628 ) ) ( not ( = ?auto_192627 ?auto_192628 ) ) )
    :subtasks
    ( ( !STACK ?auto_192627 ?auto_192628 )
      ( MAKE-2PILE ?auto_192624 ?auto_192625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192629 - BLOCK
      ?auto_192630 - BLOCK
    )
    :vars
    (
      ?auto_192633 - BLOCK
      ?auto_192632 - BLOCK
      ?auto_192631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192633 ?auto_192630 ) ( ON-TABLE ?auto_192629 ) ( ON ?auto_192630 ?auto_192629 ) ( not ( = ?auto_192629 ?auto_192630 ) ) ( not ( = ?auto_192629 ?auto_192633 ) ) ( not ( = ?auto_192630 ?auto_192633 ) ) ( CLEAR ?auto_192632 ) ( not ( = ?auto_192629 ?auto_192631 ) ) ( not ( = ?auto_192629 ?auto_192632 ) ) ( not ( = ?auto_192630 ?auto_192631 ) ) ( not ( = ?auto_192630 ?auto_192632 ) ) ( not ( = ?auto_192633 ?auto_192631 ) ) ( not ( = ?auto_192633 ?auto_192632 ) ) ( not ( = ?auto_192631 ?auto_192632 ) ) ( ON ?auto_192631 ?auto_192633 ) ( CLEAR ?auto_192631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192629 ?auto_192630 ?auto_192633 )
      ( MAKE-2PILE ?auto_192629 ?auto_192630 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192634 - BLOCK
      ?auto_192635 - BLOCK
    )
    :vars
    (
      ?auto_192638 - BLOCK
      ?auto_192636 - BLOCK
      ?auto_192637 - BLOCK
      ?auto_192642 - BLOCK
      ?auto_192641 - BLOCK
      ?auto_192639 - BLOCK
      ?auto_192640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192638 ?auto_192635 ) ( ON-TABLE ?auto_192634 ) ( ON ?auto_192635 ?auto_192634 ) ( not ( = ?auto_192634 ?auto_192635 ) ) ( not ( = ?auto_192634 ?auto_192638 ) ) ( not ( = ?auto_192635 ?auto_192638 ) ) ( not ( = ?auto_192634 ?auto_192636 ) ) ( not ( = ?auto_192634 ?auto_192637 ) ) ( not ( = ?auto_192635 ?auto_192636 ) ) ( not ( = ?auto_192635 ?auto_192637 ) ) ( not ( = ?auto_192638 ?auto_192636 ) ) ( not ( = ?auto_192638 ?auto_192637 ) ) ( not ( = ?auto_192636 ?auto_192637 ) ) ( ON ?auto_192636 ?auto_192638 ) ( CLEAR ?auto_192636 ) ( HOLDING ?auto_192637 ) ( CLEAR ?auto_192642 ) ( ON-TABLE ?auto_192641 ) ( ON ?auto_192639 ?auto_192641 ) ( ON ?auto_192640 ?auto_192639 ) ( ON ?auto_192642 ?auto_192640 ) ( not ( = ?auto_192641 ?auto_192639 ) ) ( not ( = ?auto_192641 ?auto_192640 ) ) ( not ( = ?auto_192641 ?auto_192642 ) ) ( not ( = ?auto_192641 ?auto_192637 ) ) ( not ( = ?auto_192639 ?auto_192640 ) ) ( not ( = ?auto_192639 ?auto_192642 ) ) ( not ( = ?auto_192639 ?auto_192637 ) ) ( not ( = ?auto_192640 ?auto_192642 ) ) ( not ( = ?auto_192640 ?auto_192637 ) ) ( not ( = ?auto_192642 ?auto_192637 ) ) ( not ( = ?auto_192634 ?auto_192642 ) ) ( not ( = ?auto_192634 ?auto_192641 ) ) ( not ( = ?auto_192634 ?auto_192639 ) ) ( not ( = ?auto_192634 ?auto_192640 ) ) ( not ( = ?auto_192635 ?auto_192642 ) ) ( not ( = ?auto_192635 ?auto_192641 ) ) ( not ( = ?auto_192635 ?auto_192639 ) ) ( not ( = ?auto_192635 ?auto_192640 ) ) ( not ( = ?auto_192638 ?auto_192642 ) ) ( not ( = ?auto_192638 ?auto_192641 ) ) ( not ( = ?auto_192638 ?auto_192639 ) ) ( not ( = ?auto_192638 ?auto_192640 ) ) ( not ( = ?auto_192636 ?auto_192642 ) ) ( not ( = ?auto_192636 ?auto_192641 ) ) ( not ( = ?auto_192636 ?auto_192639 ) ) ( not ( = ?auto_192636 ?auto_192640 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192641 ?auto_192639 ?auto_192640 ?auto_192642 ?auto_192637 )
      ( MAKE-2PILE ?auto_192634 ?auto_192635 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192643 - BLOCK
      ?auto_192644 - BLOCK
    )
    :vars
    (
      ?auto_192647 - BLOCK
      ?auto_192651 - BLOCK
      ?auto_192650 - BLOCK
      ?auto_192646 - BLOCK
      ?auto_192645 - BLOCK
      ?auto_192648 - BLOCK
      ?auto_192649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192647 ?auto_192644 ) ( ON-TABLE ?auto_192643 ) ( ON ?auto_192644 ?auto_192643 ) ( not ( = ?auto_192643 ?auto_192644 ) ) ( not ( = ?auto_192643 ?auto_192647 ) ) ( not ( = ?auto_192644 ?auto_192647 ) ) ( not ( = ?auto_192643 ?auto_192651 ) ) ( not ( = ?auto_192643 ?auto_192650 ) ) ( not ( = ?auto_192644 ?auto_192651 ) ) ( not ( = ?auto_192644 ?auto_192650 ) ) ( not ( = ?auto_192647 ?auto_192651 ) ) ( not ( = ?auto_192647 ?auto_192650 ) ) ( not ( = ?auto_192651 ?auto_192650 ) ) ( ON ?auto_192651 ?auto_192647 ) ( CLEAR ?auto_192646 ) ( ON-TABLE ?auto_192645 ) ( ON ?auto_192648 ?auto_192645 ) ( ON ?auto_192649 ?auto_192648 ) ( ON ?auto_192646 ?auto_192649 ) ( not ( = ?auto_192645 ?auto_192648 ) ) ( not ( = ?auto_192645 ?auto_192649 ) ) ( not ( = ?auto_192645 ?auto_192646 ) ) ( not ( = ?auto_192645 ?auto_192650 ) ) ( not ( = ?auto_192648 ?auto_192649 ) ) ( not ( = ?auto_192648 ?auto_192646 ) ) ( not ( = ?auto_192648 ?auto_192650 ) ) ( not ( = ?auto_192649 ?auto_192646 ) ) ( not ( = ?auto_192649 ?auto_192650 ) ) ( not ( = ?auto_192646 ?auto_192650 ) ) ( not ( = ?auto_192643 ?auto_192646 ) ) ( not ( = ?auto_192643 ?auto_192645 ) ) ( not ( = ?auto_192643 ?auto_192648 ) ) ( not ( = ?auto_192643 ?auto_192649 ) ) ( not ( = ?auto_192644 ?auto_192646 ) ) ( not ( = ?auto_192644 ?auto_192645 ) ) ( not ( = ?auto_192644 ?auto_192648 ) ) ( not ( = ?auto_192644 ?auto_192649 ) ) ( not ( = ?auto_192647 ?auto_192646 ) ) ( not ( = ?auto_192647 ?auto_192645 ) ) ( not ( = ?auto_192647 ?auto_192648 ) ) ( not ( = ?auto_192647 ?auto_192649 ) ) ( not ( = ?auto_192651 ?auto_192646 ) ) ( not ( = ?auto_192651 ?auto_192645 ) ) ( not ( = ?auto_192651 ?auto_192648 ) ) ( not ( = ?auto_192651 ?auto_192649 ) ) ( ON ?auto_192650 ?auto_192651 ) ( CLEAR ?auto_192650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192643 ?auto_192644 ?auto_192647 ?auto_192651 )
      ( MAKE-2PILE ?auto_192643 ?auto_192644 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192652 - BLOCK
      ?auto_192653 - BLOCK
    )
    :vars
    (
      ?auto_192654 - BLOCK
      ?auto_192657 - BLOCK
      ?auto_192656 - BLOCK
      ?auto_192655 - BLOCK
      ?auto_192659 - BLOCK
      ?auto_192658 - BLOCK
      ?auto_192660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192654 ?auto_192653 ) ( ON-TABLE ?auto_192652 ) ( ON ?auto_192653 ?auto_192652 ) ( not ( = ?auto_192652 ?auto_192653 ) ) ( not ( = ?auto_192652 ?auto_192654 ) ) ( not ( = ?auto_192653 ?auto_192654 ) ) ( not ( = ?auto_192652 ?auto_192657 ) ) ( not ( = ?auto_192652 ?auto_192656 ) ) ( not ( = ?auto_192653 ?auto_192657 ) ) ( not ( = ?auto_192653 ?auto_192656 ) ) ( not ( = ?auto_192654 ?auto_192657 ) ) ( not ( = ?auto_192654 ?auto_192656 ) ) ( not ( = ?auto_192657 ?auto_192656 ) ) ( ON ?auto_192657 ?auto_192654 ) ( ON-TABLE ?auto_192655 ) ( ON ?auto_192659 ?auto_192655 ) ( ON ?auto_192658 ?auto_192659 ) ( not ( = ?auto_192655 ?auto_192659 ) ) ( not ( = ?auto_192655 ?auto_192658 ) ) ( not ( = ?auto_192655 ?auto_192660 ) ) ( not ( = ?auto_192655 ?auto_192656 ) ) ( not ( = ?auto_192659 ?auto_192658 ) ) ( not ( = ?auto_192659 ?auto_192660 ) ) ( not ( = ?auto_192659 ?auto_192656 ) ) ( not ( = ?auto_192658 ?auto_192660 ) ) ( not ( = ?auto_192658 ?auto_192656 ) ) ( not ( = ?auto_192660 ?auto_192656 ) ) ( not ( = ?auto_192652 ?auto_192660 ) ) ( not ( = ?auto_192652 ?auto_192655 ) ) ( not ( = ?auto_192652 ?auto_192659 ) ) ( not ( = ?auto_192652 ?auto_192658 ) ) ( not ( = ?auto_192653 ?auto_192660 ) ) ( not ( = ?auto_192653 ?auto_192655 ) ) ( not ( = ?auto_192653 ?auto_192659 ) ) ( not ( = ?auto_192653 ?auto_192658 ) ) ( not ( = ?auto_192654 ?auto_192660 ) ) ( not ( = ?auto_192654 ?auto_192655 ) ) ( not ( = ?auto_192654 ?auto_192659 ) ) ( not ( = ?auto_192654 ?auto_192658 ) ) ( not ( = ?auto_192657 ?auto_192660 ) ) ( not ( = ?auto_192657 ?auto_192655 ) ) ( not ( = ?auto_192657 ?auto_192659 ) ) ( not ( = ?auto_192657 ?auto_192658 ) ) ( ON ?auto_192656 ?auto_192657 ) ( CLEAR ?auto_192656 ) ( HOLDING ?auto_192660 ) ( CLEAR ?auto_192658 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192655 ?auto_192659 ?auto_192658 ?auto_192660 )
      ( MAKE-2PILE ?auto_192652 ?auto_192653 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192661 - BLOCK
      ?auto_192662 - BLOCK
    )
    :vars
    (
      ?auto_192664 - BLOCK
      ?auto_192666 - BLOCK
      ?auto_192665 - BLOCK
      ?auto_192663 - BLOCK
      ?auto_192667 - BLOCK
      ?auto_192669 - BLOCK
      ?auto_192668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192664 ?auto_192662 ) ( ON-TABLE ?auto_192661 ) ( ON ?auto_192662 ?auto_192661 ) ( not ( = ?auto_192661 ?auto_192662 ) ) ( not ( = ?auto_192661 ?auto_192664 ) ) ( not ( = ?auto_192662 ?auto_192664 ) ) ( not ( = ?auto_192661 ?auto_192666 ) ) ( not ( = ?auto_192661 ?auto_192665 ) ) ( not ( = ?auto_192662 ?auto_192666 ) ) ( not ( = ?auto_192662 ?auto_192665 ) ) ( not ( = ?auto_192664 ?auto_192666 ) ) ( not ( = ?auto_192664 ?auto_192665 ) ) ( not ( = ?auto_192666 ?auto_192665 ) ) ( ON ?auto_192666 ?auto_192664 ) ( ON-TABLE ?auto_192663 ) ( ON ?auto_192667 ?auto_192663 ) ( ON ?auto_192669 ?auto_192667 ) ( not ( = ?auto_192663 ?auto_192667 ) ) ( not ( = ?auto_192663 ?auto_192669 ) ) ( not ( = ?auto_192663 ?auto_192668 ) ) ( not ( = ?auto_192663 ?auto_192665 ) ) ( not ( = ?auto_192667 ?auto_192669 ) ) ( not ( = ?auto_192667 ?auto_192668 ) ) ( not ( = ?auto_192667 ?auto_192665 ) ) ( not ( = ?auto_192669 ?auto_192668 ) ) ( not ( = ?auto_192669 ?auto_192665 ) ) ( not ( = ?auto_192668 ?auto_192665 ) ) ( not ( = ?auto_192661 ?auto_192668 ) ) ( not ( = ?auto_192661 ?auto_192663 ) ) ( not ( = ?auto_192661 ?auto_192667 ) ) ( not ( = ?auto_192661 ?auto_192669 ) ) ( not ( = ?auto_192662 ?auto_192668 ) ) ( not ( = ?auto_192662 ?auto_192663 ) ) ( not ( = ?auto_192662 ?auto_192667 ) ) ( not ( = ?auto_192662 ?auto_192669 ) ) ( not ( = ?auto_192664 ?auto_192668 ) ) ( not ( = ?auto_192664 ?auto_192663 ) ) ( not ( = ?auto_192664 ?auto_192667 ) ) ( not ( = ?auto_192664 ?auto_192669 ) ) ( not ( = ?auto_192666 ?auto_192668 ) ) ( not ( = ?auto_192666 ?auto_192663 ) ) ( not ( = ?auto_192666 ?auto_192667 ) ) ( not ( = ?auto_192666 ?auto_192669 ) ) ( ON ?auto_192665 ?auto_192666 ) ( CLEAR ?auto_192669 ) ( ON ?auto_192668 ?auto_192665 ) ( CLEAR ?auto_192668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192661 ?auto_192662 ?auto_192664 ?auto_192666 ?auto_192665 )
      ( MAKE-2PILE ?auto_192661 ?auto_192662 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192670 - BLOCK
      ?auto_192671 - BLOCK
    )
    :vars
    (
      ?auto_192675 - BLOCK
      ?auto_192674 - BLOCK
      ?auto_192676 - BLOCK
      ?auto_192673 - BLOCK
      ?auto_192678 - BLOCK
      ?auto_192677 - BLOCK
      ?auto_192672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192675 ?auto_192671 ) ( ON-TABLE ?auto_192670 ) ( ON ?auto_192671 ?auto_192670 ) ( not ( = ?auto_192670 ?auto_192671 ) ) ( not ( = ?auto_192670 ?auto_192675 ) ) ( not ( = ?auto_192671 ?auto_192675 ) ) ( not ( = ?auto_192670 ?auto_192674 ) ) ( not ( = ?auto_192670 ?auto_192676 ) ) ( not ( = ?auto_192671 ?auto_192674 ) ) ( not ( = ?auto_192671 ?auto_192676 ) ) ( not ( = ?auto_192675 ?auto_192674 ) ) ( not ( = ?auto_192675 ?auto_192676 ) ) ( not ( = ?auto_192674 ?auto_192676 ) ) ( ON ?auto_192674 ?auto_192675 ) ( ON-TABLE ?auto_192673 ) ( ON ?auto_192678 ?auto_192673 ) ( not ( = ?auto_192673 ?auto_192678 ) ) ( not ( = ?auto_192673 ?auto_192677 ) ) ( not ( = ?auto_192673 ?auto_192672 ) ) ( not ( = ?auto_192673 ?auto_192676 ) ) ( not ( = ?auto_192678 ?auto_192677 ) ) ( not ( = ?auto_192678 ?auto_192672 ) ) ( not ( = ?auto_192678 ?auto_192676 ) ) ( not ( = ?auto_192677 ?auto_192672 ) ) ( not ( = ?auto_192677 ?auto_192676 ) ) ( not ( = ?auto_192672 ?auto_192676 ) ) ( not ( = ?auto_192670 ?auto_192672 ) ) ( not ( = ?auto_192670 ?auto_192673 ) ) ( not ( = ?auto_192670 ?auto_192678 ) ) ( not ( = ?auto_192670 ?auto_192677 ) ) ( not ( = ?auto_192671 ?auto_192672 ) ) ( not ( = ?auto_192671 ?auto_192673 ) ) ( not ( = ?auto_192671 ?auto_192678 ) ) ( not ( = ?auto_192671 ?auto_192677 ) ) ( not ( = ?auto_192675 ?auto_192672 ) ) ( not ( = ?auto_192675 ?auto_192673 ) ) ( not ( = ?auto_192675 ?auto_192678 ) ) ( not ( = ?auto_192675 ?auto_192677 ) ) ( not ( = ?auto_192674 ?auto_192672 ) ) ( not ( = ?auto_192674 ?auto_192673 ) ) ( not ( = ?auto_192674 ?auto_192678 ) ) ( not ( = ?auto_192674 ?auto_192677 ) ) ( ON ?auto_192676 ?auto_192674 ) ( ON ?auto_192672 ?auto_192676 ) ( CLEAR ?auto_192672 ) ( HOLDING ?auto_192677 ) ( CLEAR ?auto_192678 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192673 ?auto_192678 ?auto_192677 )
      ( MAKE-2PILE ?auto_192670 ?auto_192671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192679 - BLOCK
      ?auto_192680 - BLOCK
    )
    :vars
    (
      ?auto_192686 - BLOCK
      ?auto_192685 - BLOCK
      ?auto_192684 - BLOCK
      ?auto_192681 - BLOCK
      ?auto_192682 - BLOCK
      ?auto_192683 - BLOCK
      ?auto_192687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192686 ?auto_192680 ) ( ON-TABLE ?auto_192679 ) ( ON ?auto_192680 ?auto_192679 ) ( not ( = ?auto_192679 ?auto_192680 ) ) ( not ( = ?auto_192679 ?auto_192686 ) ) ( not ( = ?auto_192680 ?auto_192686 ) ) ( not ( = ?auto_192679 ?auto_192685 ) ) ( not ( = ?auto_192679 ?auto_192684 ) ) ( not ( = ?auto_192680 ?auto_192685 ) ) ( not ( = ?auto_192680 ?auto_192684 ) ) ( not ( = ?auto_192686 ?auto_192685 ) ) ( not ( = ?auto_192686 ?auto_192684 ) ) ( not ( = ?auto_192685 ?auto_192684 ) ) ( ON ?auto_192685 ?auto_192686 ) ( ON-TABLE ?auto_192681 ) ( ON ?auto_192682 ?auto_192681 ) ( not ( = ?auto_192681 ?auto_192682 ) ) ( not ( = ?auto_192681 ?auto_192683 ) ) ( not ( = ?auto_192681 ?auto_192687 ) ) ( not ( = ?auto_192681 ?auto_192684 ) ) ( not ( = ?auto_192682 ?auto_192683 ) ) ( not ( = ?auto_192682 ?auto_192687 ) ) ( not ( = ?auto_192682 ?auto_192684 ) ) ( not ( = ?auto_192683 ?auto_192687 ) ) ( not ( = ?auto_192683 ?auto_192684 ) ) ( not ( = ?auto_192687 ?auto_192684 ) ) ( not ( = ?auto_192679 ?auto_192687 ) ) ( not ( = ?auto_192679 ?auto_192681 ) ) ( not ( = ?auto_192679 ?auto_192682 ) ) ( not ( = ?auto_192679 ?auto_192683 ) ) ( not ( = ?auto_192680 ?auto_192687 ) ) ( not ( = ?auto_192680 ?auto_192681 ) ) ( not ( = ?auto_192680 ?auto_192682 ) ) ( not ( = ?auto_192680 ?auto_192683 ) ) ( not ( = ?auto_192686 ?auto_192687 ) ) ( not ( = ?auto_192686 ?auto_192681 ) ) ( not ( = ?auto_192686 ?auto_192682 ) ) ( not ( = ?auto_192686 ?auto_192683 ) ) ( not ( = ?auto_192685 ?auto_192687 ) ) ( not ( = ?auto_192685 ?auto_192681 ) ) ( not ( = ?auto_192685 ?auto_192682 ) ) ( not ( = ?auto_192685 ?auto_192683 ) ) ( ON ?auto_192684 ?auto_192685 ) ( ON ?auto_192687 ?auto_192684 ) ( CLEAR ?auto_192682 ) ( ON ?auto_192683 ?auto_192687 ) ( CLEAR ?auto_192683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192679 ?auto_192680 ?auto_192686 ?auto_192685 ?auto_192684 ?auto_192687 )
      ( MAKE-2PILE ?auto_192679 ?auto_192680 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192688 - BLOCK
      ?auto_192689 - BLOCK
    )
    :vars
    (
      ?auto_192695 - BLOCK
      ?auto_192692 - BLOCK
      ?auto_192690 - BLOCK
      ?auto_192694 - BLOCK
      ?auto_192693 - BLOCK
      ?auto_192696 - BLOCK
      ?auto_192691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192695 ?auto_192689 ) ( ON-TABLE ?auto_192688 ) ( ON ?auto_192689 ?auto_192688 ) ( not ( = ?auto_192688 ?auto_192689 ) ) ( not ( = ?auto_192688 ?auto_192695 ) ) ( not ( = ?auto_192689 ?auto_192695 ) ) ( not ( = ?auto_192688 ?auto_192692 ) ) ( not ( = ?auto_192688 ?auto_192690 ) ) ( not ( = ?auto_192689 ?auto_192692 ) ) ( not ( = ?auto_192689 ?auto_192690 ) ) ( not ( = ?auto_192695 ?auto_192692 ) ) ( not ( = ?auto_192695 ?auto_192690 ) ) ( not ( = ?auto_192692 ?auto_192690 ) ) ( ON ?auto_192692 ?auto_192695 ) ( ON-TABLE ?auto_192694 ) ( not ( = ?auto_192694 ?auto_192693 ) ) ( not ( = ?auto_192694 ?auto_192696 ) ) ( not ( = ?auto_192694 ?auto_192691 ) ) ( not ( = ?auto_192694 ?auto_192690 ) ) ( not ( = ?auto_192693 ?auto_192696 ) ) ( not ( = ?auto_192693 ?auto_192691 ) ) ( not ( = ?auto_192693 ?auto_192690 ) ) ( not ( = ?auto_192696 ?auto_192691 ) ) ( not ( = ?auto_192696 ?auto_192690 ) ) ( not ( = ?auto_192691 ?auto_192690 ) ) ( not ( = ?auto_192688 ?auto_192691 ) ) ( not ( = ?auto_192688 ?auto_192694 ) ) ( not ( = ?auto_192688 ?auto_192693 ) ) ( not ( = ?auto_192688 ?auto_192696 ) ) ( not ( = ?auto_192689 ?auto_192691 ) ) ( not ( = ?auto_192689 ?auto_192694 ) ) ( not ( = ?auto_192689 ?auto_192693 ) ) ( not ( = ?auto_192689 ?auto_192696 ) ) ( not ( = ?auto_192695 ?auto_192691 ) ) ( not ( = ?auto_192695 ?auto_192694 ) ) ( not ( = ?auto_192695 ?auto_192693 ) ) ( not ( = ?auto_192695 ?auto_192696 ) ) ( not ( = ?auto_192692 ?auto_192691 ) ) ( not ( = ?auto_192692 ?auto_192694 ) ) ( not ( = ?auto_192692 ?auto_192693 ) ) ( not ( = ?auto_192692 ?auto_192696 ) ) ( ON ?auto_192690 ?auto_192692 ) ( ON ?auto_192691 ?auto_192690 ) ( ON ?auto_192696 ?auto_192691 ) ( CLEAR ?auto_192696 ) ( HOLDING ?auto_192693 ) ( CLEAR ?auto_192694 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192694 ?auto_192693 )
      ( MAKE-2PILE ?auto_192688 ?auto_192689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192697 - BLOCK
      ?auto_192698 - BLOCK
    )
    :vars
    (
      ?auto_192702 - BLOCK
      ?auto_192704 - BLOCK
      ?auto_192705 - BLOCK
      ?auto_192699 - BLOCK
      ?auto_192703 - BLOCK
      ?auto_192700 - BLOCK
      ?auto_192701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192702 ?auto_192698 ) ( ON-TABLE ?auto_192697 ) ( ON ?auto_192698 ?auto_192697 ) ( not ( = ?auto_192697 ?auto_192698 ) ) ( not ( = ?auto_192697 ?auto_192702 ) ) ( not ( = ?auto_192698 ?auto_192702 ) ) ( not ( = ?auto_192697 ?auto_192704 ) ) ( not ( = ?auto_192697 ?auto_192705 ) ) ( not ( = ?auto_192698 ?auto_192704 ) ) ( not ( = ?auto_192698 ?auto_192705 ) ) ( not ( = ?auto_192702 ?auto_192704 ) ) ( not ( = ?auto_192702 ?auto_192705 ) ) ( not ( = ?auto_192704 ?auto_192705 ) ) ( ON ?auto_192704 ?auto_192702 ) ( ON-TABLE ?auto_192699 ) ( not ( = ?auto_192699 ?auto_192703 ) ) ( not ( = ?auto_192699 ?auto_192700 ) ) ( not ( = ?auto_192699 ?auto_192701 ) ) ( not ( = ?auto_192699 ?auto_192705 ) ) ( not ( = ?auto_192703 ?auto_192700 ) ) ( not ( = ?auto_192703 ?auto_192701 ) ) ( not ( = ?auto_192703 ?auto_192705 ) ) ( not ( = ?auto_192700 ?auto_192701 ) ) ( not ( = ?auto_192700 ?auto_192705 ) ) ( not ( = ?auto_192701 ?auto_192705 ) ) ( not ( = ?auto_192697 ?auto_192701 ) ) ( not ( = ?auto_192697 ?auto_192699 ) ) ( not ( = ?auto_192697 ?auto_192703 ) ) ( not ( = ?auto_192697 ?auto_192700 ) ) ( not ( = ?auto_192698 ?auto_192701 ) ) ( not ( = ?auto_192698 ?auto_192699 ) ) ( not ( = ?auto_192698 ?auto_192703 ) ) ( not ( = ?auto_192698 ?auto_192700 ) ) ( not ( = ?auto_192702 ?auto_192701 ) ) ( not ( = ?auto_192702 ?auto_192699 ) ) ( not ( = ?auto_192702 ?auto_192703 ) ) ( not ( = ?auto_192702 ?auto_192700 ) ) ( not ( = ?auto_192704 ?auto_192701 ) ) ( not ( = ?auto_192704 ?auto_192699 ) ) ( not ( = ?auto_192704 ?auto_192703 ) ) ( not ( = ?auto_192704 ?auto_192700 ) ) ( ON ?auto_192705 ?auto_192704 ) ( ON ?auto_192701 ?auto_192705 ) ( ON ?auto_192700 ?auto_192701 ) ( CLEAR ?auto_192699 ) ( ON ?auto_192703 ?auto_192700 ) ( CLEAR ?auto_192703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192697 ?auto_192698 ?auto_192702 ?auto_192704 ?auto_192705 ?auto_192701 ?auto_192700 )
      ( MAKE-2PILE ?auto_192697 ?auto_192698 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192706 - BLOCK
      ?auto_192707 - BLOCK
    )
    :vars
    (
      ?auto_192711 - BLOCK
      ?auto_192708 - BLOCK
      ?auto_192710 - BLOCK
      ?auto_192709 - BLOCK
      ?auto_192712 - BLOCK
      ?auto_192713 - BLOCK
      ?auto_192714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192711 ?auto_192707 ) ( ON-TABLE ?auto_192706 ) ( ON ?auto_192707 ?auto_192706 ) ( not ( = ?auto_192706 ?auto_192707 ) ) ( not ( = ?auto_192706 ?auto_192711 ) ) ( not ( = ?auto_192707 ?auto_192711 ) ) ( not ( = ?auto_192706 ?auto_192708 ) ) ( not ( = ?auto_192706 ?auto_192710 ) ) ( not ( = ?auto_192707 ?auto_192708 ) ) ( not ( = ?auto_192707 ?auto_192710 ) ) ( not ( = ?auto_192711 ?auto_192708 ) ) ( not ( = ?auto_192711 ?auto_192710 ) ) ( not ( = ?auto_192708 ?auto_192710 ) ) ( ON ?auto_192708 ?auto_192711 ) ( not ( = ?auto_192709 ?auto_192712 ) ) ( not ( = ?auto_192709 ?auto_192713 ) ) ( not ( = ?auto_192709 ?auto_192714 ) ) ( not ( = ?auto_192709 ?auto_192710 ) ) ( not ( = ?auto_192712 ?auto_192713 ) ) ( not ( = ?auto_192712 ?auto_192714 ) ) ( not ( = ?auto_192712 ?auto_192710 ) ) ( not ( = ?auto_192713 ?auto_192714 ) ) ( not ( = ?auto_192713 ?auto_192710 ) ) ( not ( = ?auto_192714 ?auto_192710 ) ) ( not ( = ?auto_192706 ?auto_192714 ) ) ( not ( = ?auto_192706 ?auto_192709 ) ) ( not ( = ?auto_192706 ?auto_192712 ) ) ( not ( = ?auto_192706 ?auto_192713 ) ) ( not ( = ?auto_192707 ?auto_192714 ) ) ( not ( = ?auto_192707 ?auto_192709 ) ) ( not ( = ?auto_192707 ?auto_192712 ) ) ( not ( = ?auto_192707 ?auto_192713 ) ) ( not ( = ?auto_192711 ?auto_192714 ) ) ( not ( = ?auto_192711 ?auto_192709 ) ) ( not ( = ?auto_192711 ?auto_192712 ) ) ( not ( = ?auto_192711 ?auto_192713 ) ) ( not ( = ?auto_192708 ?auto_192714 ) ) ( not ( = ?auto_192708 ?auto_192709 ) ) ( not ( = ?auto_192708 ?auto_192712 ) ) ( not ( = ?auto_192708 ?auto_192713 ) ) ( ON ?auto_192710 ?auto_192708 ) ( ON ?auto_192714 ?auto_192710 ) ( ON ?auto_192713 ?auto_192714 ) ( ON ?auto_192712 ?auto_192713 ) ( CLEAR ?auto_192712 ) ( HOLDING ?auto_192709 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192709 )
      ( MAKE-2PILE ?auto_192706 ?auto_192707 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_192715 - BLOCK
      ?auto_192716 - BLOCK
    )
    :vars
    (
      ?auto_192718 - BLOCK
      ?auto_192723 - BLOCK
      ?auto_192720 - BLOCK
      ?auto_192719 - BLOCK
      ?auto_192721 - BLOCK
      ?auto_192717 - BLOCK
      ?auto_192722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192718 ?auto_192716 ) ( ON-TABLE ?auto_192715 ) ( ON ?auto_192716 ?auto_192715 ) ( not ( = ?auto_192715 ?auto_192716 ) ) ( not ( = ?auto_192715 ?auto_192718 ) ) ( not ( = ?auto_192716 ?auto_192718 ) ) ( not ( = ?auto_192715 ?auto_192723 ) ) ( not ( = ?auto_192715 ?auto_192720 ) ) ( not ( = ?auto_192716 ?auto_192723 ) ) ( not ( = ?auto_192716 ?auto_192720 ) ) ( not ( = ?auto_192718 ?auto_192723 ) ) ( not ( = ?auto_192718 ?auto_192720 ) ) ( not ( = ?auto_192723 ?auto_192720 ) ) ( ON ?auto_192723 ?auto_192718 ) ( not ( = ?auto_192719 ?auto_192721 ) ) ( not ( = ?auto_192719 ?auto_192717 ) ) ( not ( = ?auto_192719 ?auto_192722 ) ) ( not ( = ?auto_192719 ?auto_192720 ) ) ( not ( = ?auto_192721 ?auto_192717 ) ) ( not ( = ?auto_192721 ?auto_192722 ) ) ( not ( = ?auto_192721 ?auto_192720 ) ) ( not ( = ?auto_192717 ?auto_192722 ) ) ( not ( = ?auto_192717 ?auto_192720 ) ) ( not ( = ?auto_192722 ?auto_192720 ) ) ( not ( = ?auto_192715 ?auto_192722 ) ) ( not ( = ?auto_192715 ?auto_192719 ) ) ( not ( = ?auto_192715 ?auto_192721 ) ) ( not ( = ?auto_192715 ?auto_192717 ) ) ( not ( = ?auto_192716 ?auto_192722 ) ) ( not ( = ?auto_192716 ?auto_192719 ) ) ( not ( = ?auto_192716 ?auto_192721 ) ) ( not ( = ?auto_192716 ?auto_192717 ) ) ( not ( = ?auto_192718 ?auto_192722 ) ) ( not ( = ?auto_192718 ?auto_192719 ) ) ( not ( = ?auto_192718 ?auto_192721 ) ) ( not ( = ?auto_192718 ?auto_192717 ) ) ( not ( = ?auto_192723 ?auto_192722 ) ) ( not ( = ?auto_192723 ?auto_192719 ) ) ( not ( = ?auto_192723 ?auto_192721 ) ) ( not ( = ?auto_192723 ?auto_192717 ) ) ( ON ?auto_192720 ?auto_192723 ) ( ON ?auto_192722 ?auto_192720 ) ( ON ?auto_192717 ?auto_192722 ) ( ON ?auto_192721 ?auto_192717 ) ( ON ?auto_192719 ?auto_192721 ) ( CLEAR ?auto_192719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192715 ?auto_192716 ?auto_192718 ?auto_192723 ?auto_192720 ?auto_192722 ?auto_192717 ?auto_192721 )
      ( MAKE-2PILE ?auto_192715 ?auto_192716 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192731 - BLOCK
      ?auto_192732 - BLOCK
      ?auto_192733 - BLOCK
      ?auto_192734 - BLOCK
      ?auto_192735 - BLOCK
      ?auto_192736 - BLOCK
      ?auto_192737 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_192737 ) ( CLEAR ?auto_192736 ) ( ON-TABLE ?auto_192731 ) ( ON ?auto_192732 ?auto_192731 ) ( ON ?auto_192733 ?auto_192732 ) ( ON ?auto_192734 ?auto_192733 ) ( ON ?auto_192735 ?auto_192734 ) ( ON ?auto_192736 ?auto_192735 ) ( not ( = ?auto_192731 ?auto_192732 ) ) ( not ( = ?auto_192731 ?auto_192733 ) ) ( not ( = ?auto_192731 ?auto_192734 ) ) ( not ( = ?auto_192731 ?auto_192735 ) ) ( not ( = ?auto_192731 ?auto_192736 ) ) ( not ( = ?auto_192731 ?auto_192737 ) ) ( not ( = ?auto_192732 ?auto_192733 ) ) ( not ( = ?auto_192732 ?auto_192734 ) ) ( not ( = ?auto_192732 ?auto_192735 ) ) ( not ( = ?auto_192732 ?auto_192736 ) ) ( not ( = ?auto_192732 ?auto_192737 ) ) ( not ( = ?auto_192733 ?auto_192734 ) ) ( not ( = ?auto_192733 ?auto_192735 ) ) ( not ( = ?auto_192733 ?auto_192736 ) ) ( not ( = ?auto_192733 ?auto_192737 ) ) ( not ( = ?auto_192734 ?auto_192735 ) ) ( not ( = ?auto_192734 ?auto_192736 ) ) ( not ( = ?auto_192734 ?auto_192737 ) ) ( not ( = ?auto_192735 ?auto_192736 ) ) ( not ( = ?auto_192735 ?auto_192737 ) ) ( not ( = ?auto_192736 ?auto_192737 ) ) )
    :subtasks
    ( ( !STACK ?auto_192737 ?auto_192736 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192738 - BLOCK
      ?auto_192739 - BLOCK
      ?auto_192740 - BLOCK
      ?auto_192741 - BLOCK
      ?auto_192742 - BLOCK
      ?auto_192743 - BLOCK
      ?auto_192744 - BLOCK
    )
    :vars
    (
      ?auto_192745 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_192743 ) ( ON-TABLE ?auto_192738 ) ( ON ?auto_192739 ?auto_192738 ) ( ON ?auto_192740 ?auto_192739 ) ( ON ?auto_192741 ?auto_192740 ) ( ON ?auto_192742 ?auto_192741 ) ( ON ?auto_192743 ?auto_192742 ) ( not ( = ?auto_192738 ?auto_192739 ) ) ( not ( = ?auto_192738 ?auto_192740 ) ) ( not ( = ?auto_192738 ?auto_192741 ) ) ( not ( = ?auto_192738 ?auto_192742 ) ) ( not ( = ?auto_192738 ?auto_192743 ) ) ( not ( = ?auto_192738 ?auto_192744 ) ) ( not ( = ?auto_192739 ?auto_192740 ) ) ( not ( = ?auto_192739 ?auto_192741 ) ) ( not ( = ?auto_192739 ?auto_192742 ) ) ( not ( = ?auto_192739 ?auto_192743 ) ) ( not ( = ?auto_192739 ?auto_192744 ) ) ( not ( = ?auto_192740 ?auto_192741 ) ) ( not ( = ?auto_192740 ?auto_192742 ) ) ( not ( = ?auto_192740 ?auto_192743 ) ) ( not ( = ?auto_192740 ?auto_192744 ) ) ( not ( = ?auto_192741 ?auto_192742 ) ) ( not ( = ?auto_192741 ?auto_192743 ) ) ( not ( = ?auto_192741 ?auto_192744 ) ) ( not ( = ?auto_192742 ?auto_192743 ) ) ( not ( = ?auto_192742 ?auto_192744 ) ) ( not ( = ?auto_192743 ?auto_192744 ) ) ( ON ?auto_192744 ?auto_192745 ) ( CLEAR ?auto_192744 ) ( HAND-EMPTY ) ( not ( = ?auto_192738 ?auto_192745 ) ) ( not ( = ?auto_192739 ?auto_192745 ) ) ( not ( = ?auto_192740 ?auto_192745 ) ) ( not ( = ?auto_192741 ?auto_192745 ) ) ( not ( = ?auto_192742 ?auto_192745 ) ) ( not ( = ?auto_192743 ?auto_192745 ) ) ( not ( = ?auto_192744 ?auto_192745 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192744 ?auto_192745 )
      ( MAKE-7PILE ?auto_192738 ?auto_192739 ?auto_192740 ?auto_192741 ?auto_192742 ?auto_192743 ?auto_192744 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192746 - BLOCK
      ?auto_192747 - BLOCK
      ?auto_192748 - BLOCK
      ?auto_192749 - BLOCK
      ?auto_192750 - BLOCK
      ?auto_192751 - BLOCK
      ?auto_192752 - BLOCK
    )
    :vars
    (
      ?auto_192753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192746 ) ( ON ?auto_192747 ?auto_192746 ) ( ON ?auto_192748 ?auto_192747 ) ( ON ?auto_192749 ?auto_192748 ) ( ON ?auto_192750 ?auto_192749 ) ( not ( = ?auto_192746 ?auto_192747 ) ) ( not ( = ?auto_192746 ?auto_192748 ) ) ( not ( = ?auto_192746 ?auto_192749 ) ) ( not ( = ?auto_192746 ?auto_192750 ) ) ( not ( = ?auto_192746 ?auto_192751 ) ) ( not ( = ?auto_192746 ?auto_192752 ) ) ( not ( = ?auto_192747 ?auto_192748 ) ) ( not ( = ?auto_192747 ?auto_192749 ) ) ( not ( = ?auto_192747 ?auto_192750 ) ) ( not ( = ?auto_192747 ?auto_192751 ) ) ( not ( = ?auto_192747 ?auto_192752 ) ) ( not ( = ?auto_192748 ?auto_192749 ) ) ( not ( = ?auto_192748 ?auto_192750 ) ) ( not ( = ?auto_192748 ?auto_192751 ) ) ( not ( = ?auto_192748 ?auto_192752 ) ) ( not ( = ?auto_192749 ?auto_192750 ) ) ( not ( = ?auto_192749 ?auto_192751 ) ) ( not ( = ?auto_192749 ?auto_192752 ) ) ( not ( = ?auto_192750 ?auto_192751 ) ) ( not ( = ?auto_192750 ?auto_192752 ) ) ( not ( = ?auto_192751 ?auto_192752 ) ) ( ON ?auto_192752 ?auto_192753 ) ( CLEAR ?auto_192752 ) ( not ( = ?auto_192746 ?auto_192753 ) ) ( not ( = ?auto_192747 ?auto_192753 ) ) ( not ( = ?auto_192748 ?auto_192753 ) ) ( not ( = ?auto_192749 ?auto_192753 ) ) ( not ( = ?auto_192750 ?auto_192753 ) ) ( not ( = ?auto_192751 ?auto_192753 ) ) ( not ( = ?auto_192752 ?auto_192753 ) ) ( HOLDING ?auto_192751 ) ( CLEAR ?auto_192750 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192746 ?auto_192747 ?auto_192748 ?auto_192749 ?auto_192750 ?auto_192751 )
      ( MAKE-7PILE ?auto_192746 ?auto_192747 ?auto_192748 ?auto_192749 ?auto_192750 ?auto_192751 ?auto_192752 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192754 - BLOCK
      ?auto_192755 - BLOCK
      ?auto_192756 - BLOCK
      ?auto_192757 - BLOCK
      ?auto_192758 - BLOCK
      ?auto_192759 - BLOCK
      ?auto_192760 - BLOCK
    )
    :vars
    (
      ?auto_192761 - BLOCK
      ?auto_192762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192754 ) ( ON ?auto_192755 ?auto_192754 ) ( ON ?auto_192756 ?auto_192755 ) ( ON ?auto_192757 ?auto_192756 ) ( ON ?auto_192758 ?auto_192757 ) ( not ( = ?auto_192754 ?auto_192755 ) ) ( not ( = ?auto_192754 ?auto_192756 ) ) ( not ( = ?auto_192754 ?auto_192757 ) ) ( not ( = ?auto_192754 ?auto_192758 ) ) ( not ( = ?auto_192754 ?auto_192759 ) ) ( not ( = ?auto_192754 ?auto_192760 ) ) ( not ( = ?auto_192755 ?auto_192756 ) ) ( not ( = ?auto_192755 ?auto_192757 ) ) ( not ( = ?auto_192755 ?auto_192758 ) ) ( not ( = ?auto_192755 ?auto_192759 ) ) ( not ( = ?auto_192755 ?auto_192760 ) ) ( not ( = ?auto_192756 ?auto_192757 ) ) ( not ( = ?auto_192756 ?auto_192758 ) ) ( not ( = ?auto_192756 ?auto_192759 ) ) ( not ( = ?auto_192756 ?auto_192760 ) ) ( not ( = ?auto_192757 ?auto_192758 ) ) ( not ( = ?auto_192757 ?auto_192759 ) ) ( not ( = ?auto_192757 ?auto_192760 ) ) ( not ( = ?auto_192758 ?auto_192759 ) ) ( not ( = ?auto_192758 ?auto_192760 ) ) ( not ( = ?auto_192759 ?auto_192760 ) ) ( ON ?auto_192760 ?auto_192761 ) ( not ( = ?auto_192754 ?auto_192761 ) ) ( not ( = ?auto_192755 ?auto_192761 ) ) ( not ( = ?auto_192756 ?auto_192761 ) ) ( not ( = ?auto_192757 ?auto_192761 ) ) ( not ( = ?auto_192758 ?auto_192761 ) ) ( not ( = ?auto_192759 ?auto_192761 ) ) ( not ( = ?auto_192760 ?auto_192761 ) ) ( CLEAR ?auto_192758 ) ( ON ?auto_192759 ?auto_192760 ) ( CLEAR ?auto_192759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192762 ) ( ON ?auto_192761 ?auto_192762 ) ( not ( = ?auto_192762 ?auto_192761 ) ) ( not ( = ?auto_192762 ?auto_192760 ) ) ( not ( = ?auto_192762 ?auto_192759 ) ) ( not ( = ?auto_192754 ?auto_192762 ) ) ( not ( = ?auto_192755 ?auto_192762 ) ) ( not ( = ?auto_192756 ?auto_192762 ) ) ( not ( = ?auto_192757 ?auto_192762 ) ) ( not ( = ?auto_192758 ?auto_192762 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192762 ?auto_192761 ?auto_192760 )
      ( MAKE-7PILE ?auto_192754 ?auto_192755 ?auto_192756 ?auto_192757 ?auto_192758 ?auto_192759 ?auto_192760 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192763 - BLOCK
      ?auto_192764 - BLOCK
      ?auto_192765 - BLOCK
      ?auto_192766 - BLOCK
      ?auto_192767 - BLOCK
      ?auto_192768 - BLOCK
      ?auto_192769 - BLOCK
    )
    :vars
    (
      ?auto_192770 - BLOCK
      ?auto_192771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192763 ) ( ON ?auto_192764 ?auto_192763 ) ( ON ?auto_192765 ?auto_192764 ) ( ON ?auto_192766 ?auto_192765 ) ( not ( = ?auto_192763 ?auto_192764 ) ) ( not ( = ?auto_192763 ?auto_192765 ) ) ( not ( = ?auto_192763 ?auto_192766 ) ) ( not ( = ?auto_192763 ?auto_192767 ) ) ( not ( = ?auto_192763 ?auto_192768 ) ) ( not ( = ?auto_192763 ?auto_192769 ) ) ( not ( = ?auto_192764 ?auto_192765 ) ) ( not ( = ?auto_192764 ?auto_192766 ) ) ( not ( = ?auto_192764 ?auto_192767 ) ) ( not ( = ?auto_192764 ?auto_192768 ) ) ( not ( = ?auto_192764 ?auto_192769 ) ) ( not ( = ?auto_192765 ?auto_192766 ) ) ( not ( = ?auto_192765 ?auto_192767 ) ) ( not ( = ?auto_192765 ?auto_192768 ) ) ( not ( = ?auto_192765 ?auto_192769 ) ) ( not ( = ?auto_192766 ?auto_192767 ) ) ( not ( = ?auto_192766 ?auto_192768 ) ) ( not ( = ?auto_192766 ?auto_192769 ) ) ( not ( = ?auto_192767 ?auto_192768 ) ) ( not ( = ?auto_192767 ?auto_192769 ) ) ( not ( = ?auto_192768 ?auto_192769 ) ) ( ON ?auto_192769 ?auto_192770 ) ( not ( = ?auto_192763 ?auto_192770 ) ) ( not ( = ?auto_192764 ?auto_192770 ) ) ( not ( = ?auto_192765 ?auto_192770 ) ) ( not ( = ?auto_192766 ?auto_192770 ) ) ( not ( = ?auto_192767 ?auto_192770 ) ) ( not ( = ?auto_192768 ?auto_192770 ) ) ( not ( = ?auto_192769 ?auto_192770 ) ) ( ON ?auto_192768 ?auto_192769 ) ( CLEAR ?auto_192768 ) ( ON-TABLE ?auto_192771 ) ( ON ?auto_192770 ?auto_192771 ) ( not ( = ?auto_192771 ?auto_192770 ) ) ( not ( = ?auto_192771 ?auto_192769 ) ) ( not ( = ?auto_192771 ?auto_192768 ) ) ( not ( = ?auto_192763 ?auto_192771 ) ) ( not ( = ?auto_192764 ?auto_192771 ) ) ( not ( = ?auto_192765 ?auto_192771 ) ) ( not ( = ?auto_192766 ?auto_192771 ) ) ( not ( = ?auto_192767 ?auto_192771 ) ) ( HOLDING ?auto_192767 ) ( CLEAR ?auto_192766 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192763 ?auto_192764 ?auto_192765 ?auto_192766 ?auto_192767 )
      ( MAKE-7PILE ?auto_192763 ?auto_192764 ?auto_192765 ?auto_192766 ?auto_192767 ?auto_192768 ?auto_192769 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192772 - BLOCK
      ?auto_192773 - BLOCK
      ?auto_192774 - BLOCK
      ?auto_192775 - BLOCK
      ?auto_192776 - BLOCK
      ?auto_192777 - BLOCK
      ?auto_192778 - BLOCK
    )
    :vars
    (
      ?auto_192780 - BLOCK
      ?auto_192779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192772 ) ( ON ?auto_192773 ?auto_192772 ) ( ON ?auto_192774 ?auto_192773 ) ( ON ?auto_192775 ?auto_192774 ) ( not ( = ?auto_192772 ?auto_192773 ) ) ( not ( = ?auto_192772 ?auto_192774 ) ) ( not ( = ?auto_192772 ?auto_192775 ) ) ( not ( = ?auto_192772 ?auto_192776 ) ) ( not ( = ?auto_192772 ?auto_192777 ) ) ( not ( = ?auto_192772 ?auto_192778 ) ) ( not ( = ?auto_192773 ?auto_192774 ) ) ( not ( = ?auto_192773 ?auto_192775 ) ) ( not ( = ?auto_192773 ?auto_192776 ) ) ( not ( = ?auto_192773 ?auto_192777 ) ) ( not ( = ?auto_192773 ?auto_192778 ) ) ( not ( = ?auto_192774 ?auto_192775 ) ) ( not ( = ?auto_192774 ?auto_192776 ) ) ( not ( = ?auto_192774 ?auto_192777 ) ) ( not ( = ?auto_192774 ?auto_192778 ) ) ( not ( = ?auto_192775 ?auto_192776 ) ) ( not ( = ?auto_192775 ?auto_192777 ) ) ( not ( = ?auto_192775 ?auto_192778 ) ) ( not ( = ?auto_192776 ?auto_192777 ) ) ( not ( = ?auto_192776 ?auto_192778 ) ) ( not ( = ?auto_192777 ?auto_192778 ) ) ( ON ?auto_192778 ?auto_192780 ) ( not ( = ?auto_192772 ?auto_192780 ) ) ( not ( = ?auto_192773 ?auto_192780 ) ) ( not ( = ?auto_192774 ?auto_192780 ) ) ( not ( = ?auto_192775 ?auto_192780 ) ) ( not ( = ?auto_192776 ?auto_192780 ) ) ( not ( = ?auto_192777 ?auto_192780 ) ) ( not ( = ?auto_192778 ?auto_192780 ) ) ( ON ?auto_192777 ?auto_192778 ) ( ON-TABLE ?auto_192779 ) ( ON ?auto_192780 ?auto_192779 ) ( not ( = ?auto_192779 ?auto_192780 ) ) ( not ( = ?auto_192779 ?auto_192778 ) ) ( not ( = ?auto_192779 ?auto_192777 ) ) ( not ( = ?auto_192772 ?auto_192779 ) ) ( not ( = ?auto_192773 ?auto_192779 ) ) ( not ( = ?auto_192774 ?auto_192779 ) ) ( not ( = ?auto_192775 ?auto_192779 ) ) ( not ( = ?auto_192776 ?auto_192779 ) ) ( CLEAR ?auto_192775 ) ( ON ?auto_192776 ?auto_192777 ) ( CLEAR ?auto_192776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192779 ?auto_192780 ?auto_192778 ?auto_192777 )
      ( MAKE-7PILE ?auto_192772 ?auto_192773 ?auto_192774 ?auto_192775 ?auto_192776 ?auto_192777 ?auto_192778 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192781 - BLOCK
      ?auto_192782 - BLOCK
      ?auto_192783 - BLOCK
      ?auto_192784 - BLOCK
      ?auto_192785 - BLOCK
      ?auto_192786 - BLOCK
      ?auto_192787 - BLOCK
    )
    :vars
    (
      ?auto_192789 - BLOCK
      ?auto_192788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192781 ) ( ON ?auto_192782 ?auto_192781 ) ( ON ?auto_192783 ?auto_192782 ) ( not ( = ?auto_192781 ?auto_192782 ) ) ( not ( = ?auto_192781 ?auto_192783 ) ) ( not ( = ?auto_192781 ?auto_192784 ) ) ( not ( = ?auto_192781 ?auto_192785 ) ) ( not ( = ?auto_192781 ?auto_192786 ) ) ( not ( = ?auto_192781 ?auto_192787 ) ) ( not ( = ?auto_192782 ?auto_192783 ) ) ( not ( = ?auto_192782 ?auto_192784 ) ) ( not ( = ?auto_192782 ?auto_192785 ) ) ( not ( = ?auto_192782 ?auto_192786 ) ) ( not ( = ?auto_192782 ?auto_192787 ) ) ( not ( = ?auto_192783 ?auto_192784 ) ) ( not ( = ?auto_192783 ?auto_192785 ) ) ( not ( = ?auto_192783 ?auto_192786 ) ) ( not ( = ?auto_192783 ?auto_192787 ) ) ( not ( = ?auto_192784 ?auto_192785 ) ) ( not ( = ?auto_192784 ?auto_192786 ) ) ( not ( = ?auto_192784 ?auto_192787 ) ) ( not ( = ?auto_192785 ?auto_192786 ) ) ( not ( = ?auto_192785 ?auto_192787 ) ) ( not ( = ?auto_192786 ?auto_192787 ) ) ( ON ?auto_192787 ?auto_192789 ) ( not ( = ?auto_192781 ?auto_192789 ) ) ( not ( = ?auto_192782 ?auto_192789 ) ) ( not ( = ?auto_192783 ?auto_192789 ) ) ( not ( = ?auto_192784 ?auto_192789 ) ) ( not ( = ?auto_192785 ?auto_192789 ) ) ( not ( = ?auto_192786 ?auto_192789 ) ) ( not ( = ?auto_192787 ?auto_192789 ) ) ( ON ?auto_192786 ?auto_192787 ) ( ON-TABLE ?auto_192788 ) ( ON ?auto_192789 ?auto_192788 ) ( not ( = ?auto_192788 ?auto_192789 ) ) ( not ( = ?auto_192788 ?auto_192787 ) ) ( not ( = ?auto_192788 ?auto_192786 ) ) ( not ( = ?auto_192781 ?auto_192788 ) ) ( not ( = ?auto_192782 ?auto_192788 ) ) ( not ( = ?auto_192783 ?auto_192788 ) ) ( not ( = ?auto_192784 ?auto_192788 ) ) ( not ( = ?auto_192785 ?auto_192788 ) ) ( ON ?auto_192785 ?auto_192786 ) ( CLEAR ?auto_192785 ) ( HOLDING ?auto_192784 ) ( CLEAR ?auto_192783 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192781 ?auto_192782 ?auto_192783 ?auto_192784 )
      ( MAKE-7PILE ?auto_192781 ?auto_192782 ?auto_192783 ?auto_192784 ?auto_192785 ?auto_192786 ?auto_192787 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192790 - BLOCK
      ?auto_192791 - BLOCK
      ?auto_192792 - BLOCK
      ?auto_192793 - BLOCK
      ?auto_192794 - BLOCK
      ?auto_192795 - BLOCK
      ?auto_192796 - BLOCK
    )
    :vars
    (
      ?auto_192797 - BLOCK
      ?auto_192798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192790 ) ( ON ?auto_192791 ?auto_192790 ) ( ON ?auto_192792 ?auto_192791 ) ( not ( = ?auto_192790 ?auto_192791 ) ) ( not ( = ?auto_192790 ?auto_192792 ) ) ( not ( = ?auto_192790 ?auto_192793 ) ) ( not ( = ?auto_192790 ?auto_192794 ) ) ( not ( = ?auto_192790 ?auto_192795 ) ) ( not ( = ?auto_192790 ?auto_192796 ) ) ( not ( = ?auto_192791 ?auto_192792 ) ) ( not ( = ?auto_192791 ?auto_192793 ) ) ( not ( = ?auto_192791 ?auto_192794 ) ) ( not ( = ?auto_192791 ?auto_192795 ) ) ( not ( = ?auto_192791 ?auto_192796 ) ) ( not ( = ?auto_192792 ?auto_192793 ) ) ( not ( = ?auto_192792 ?auto_192794 ) ) ( not ( = ?auto_192792 ?auto_192795 ) ) ( not ( = ?auto_192792 ?auto_192796 ) ) ( not ( = ?auto_192793 ?auto_192794 ) ) ( not ( = ?auto_192793 ?auto_192795 ) ) ( not ( = ?auto_192793 ?auto_192796 ) ) ( not ( = ?auto_192794 ?auto_192795 ) ) ( not ( = ?auto_192794 ?auto_192796 ) ) ( not ( = ?auto_192795 ?auto_192796 ) ) ( ON ?auto_192796 ?auto_192797 ) ( not ( = ?auto_192790 ?auto_192797 ) ) ( not ( = ?auto_192791 ?auto_192797 ) ) ( not ( = ?auto_192792 ?auto_192797 ) ) ( not ( = ?auto_192793 ?auto_192797 ) ) ( not ( = ?auto_192794 ?auto_192797 ) ) ( not ( = ?auto_192795 ?auto_192797 ) ) ( not ( = ?auto_192796 ?auto_192797 ) ) ( ON ?auto_192795 ?auto_192796 ) ( ON-TABLE ?auto_192798 ) ( ON ?auto_192797 ?auto_192798 ) ( not ( = ?auto_192798 ?auto_192797 ) ) ( not ( = ?auto_192798 ?auto_192796 ) ) ( not ( = ?auto_192798 ?auto_192795 ) ) ( not ( = ?auto_192790 ?auto_192798 ) ) ( not ( = ?auto_192791 ?auto_192798 ) ) ( not ( = ?auto_192792 ?auto_192798 ) ) ( not ( = ?auto_192793 ?auto_192798 ) ) ( not ( = ?auto_192794 ?auto_192798 ) ) ( ON ?auto_192794 ?auto_192795 ) ( CLEAR ?auto_192792 ) ( ON ?auto_192793 ?auto_192794 ) ( CLEAR ?auto_192793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192798 ?auto_192797 ?auto_192796 ?auto_192795 ?auto_192794 )
      ( MAKE-7PILE ?auto_192790 ?auto_192791 ?auto_192792 ?auto_192793 ?auto_192794 ?auto_192795 ?auto_192796 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192799 - BLOCK
      ?auto_192800 - BLOCK
      ?auto_192801 - BLOCK
      ?auto_192802 - BLOCK
      ?auto_192803 - BLOCK
      ?auto_192804 - BLOCK
      ?auto_192805 - BLOCK
    )
    :vars
    (
      ?auto_192807 - BLOCK
      ?auto_192806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192799 ) ( ON ?auto_192800 ?auto_192799 ) ( not ( = ?auto_192799 ?auto_192800 ) ) ( not ( = ?auto_192799 ?auto_192801 ) ) ( not ( = ?auto_192799 ?auto_192802 ) ) ( not ( = ?auto_192799 ?auto_192803 ) ) ( not ( = ?auto_192799 ?auto_192804 ) ) ( not ( = ?auto_192799 ?auto_192805 ) ) ( not ( = ?auto_192800 ?auto_192801 ) ) ( not ( = ?auto_192800 ?auto_192802 ) ) ( not ( = ?auto_192800 ?auto_192803 ) ) ( not ( = ?auto_192800 ?auto_192804 ) ) ( not ( = ?auto_192800 ?auto_192805 ) ) ( not ( = ?auto_192801 ?auto_192802 ) ) ( not ( = ?auto_192801 ?auto_192803 ) ) ( not ( = ?auto_192801 ?auto_192804 ) ) ( not ( = ?auto_192801 ?auto_192805 ) ) ( not ( = ?auto_192802 ?auto_192803 ) ) ( not ( = ?auto_192802 ?auto_192804 ) ) ( not ( = ?auto_192802 ?auto_192805 ) ) ( not ( = ?auto_192803 ?auto_192804 ) ) ( not ( = ?auto_192803 ?auto_192805 ) ) ( not ( = ?auto_192804 ?auto_192805 ) ) ( ON ?auto_192805 ?auto_192807 ) ( not ( = ?auto_192799 ?auto_192807 ) ) ( not ( = ?auto_192800 ?auto_192807 ) ) ( not ( = ?auto_192801 ?auto_192807 ) ) ( not ( = ?auto_192802 ?auto_192807 ) ) ( not ( = ?auto_192803 ?auto_192807 ) ) ( not ( = ?auto_192804 ?auto_192807 ) ) ( not ( = ?auto_192805 ?auto_192807 ) ) ( ON ?auto_192804 ?auto_192805 ) ( ON-TABLE ?auto_192806 ) ( ON ?auto_192807 ?auto_192806 ) ( not ( = ?auto_192806 ?auto_192807 ) ) ( not ( = ?auto_192806 ?auto_192805 ) ) ( not ( = ?auto_192806 ?auto_192804 ) ) ( not ( = ?auto_192799 ?auto_192806 ) ) ( not ( = ?auto_192800 ?auto_192806 ) ) ( not ( = ?auto_192801 ?auto_192806 ) ) ( not ( = ?auto_192802 ?auto_192806 ) ) ( not ( = ?auto_192803 ?auto_192806 ) ) ( ON ?auto_192803 ?auto_192804 ) ( ON ?auto_192802 ?auto_192803 ) ( CLEAR ?auto_192802 ) ( HOLDING ?auto_192801 ) ( CLEAR ?auto_192800 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192799 ?auto_192800 ?auto_192801 )
      ( MAKE-7PILE ?auto_192799 ?auto_192800 ?auto_192801 ?auto_192802 ?auto_192803 ?auto_192804 ?auto_192805 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192808 - BLOCK
      ?auto_192809 - BLOCK
      ?auto_192810 - BLOCK
      ?auto_192811 - BLOCK
      ?auto_192812 - BLOCK
      ?auto_192813 - BLOCK
      ?auto_192814 - BLOCK
    )
    :vars
    (
      ?auto_192816 - BLOCK
      ?auto_192815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192808 ) ( ON ?auto_192809 ?auto_192808 ) ( not ( = ?auto_192808 ?auto_192809 ) ) ( not ( = ?auto_192808 ?auto_192810 ) ) ( not ( = ?auto_192808 ?auto_192811 ) ) ( not ( = ?auto_192808 ?auto_192812 ) ) ( not ( = ?auto_192808 ?auto_192813 ) ) ( not ( = ?auto_192808 ?auto_192814 ) ) ( not ( = ?auto_192809 ?auto_192810 ) ) ( not ( = ?auto_192809 ?auto_192811 ) ) ( not ( = ?auto_192809 ?auto_192812 ) ) ( not ( = ?auto_192809 ?auto_192813 ) ) ( not ( = ?auto_192809 ?auto_192814 ) ) ( not ( = ?auto_192810 ?auto_192811 ) ) ( not ( = ?auto_192810 ?auto_192812 ) ) ( not ( = ?auto_192810 ?auto_192813 ) ) ( not ( = ?auto_192810 ?auto_192814 ) ) ( not ( = ?auto_192811 ?auto_192812 ) ) ( not ( = ?auto_192811 ?auto_192813 ) ) ( not ( = ?auto_192811 ?auto_192814 ) ) ( not ( = ?auto_192812 ?auto_192813 ) ) ( not ( = ?auto_192812 ?auto_192814 ) ) ( not ( = ?auto_192813 ?auto_192814 ) ) ( ON ?auto_192814 ?auto_192816 ) ( not ( = ?auto_192808 ?auto_192816 ) ) ( not ( = ?auto_192809 ?auto_192816 ) ) ( not ( = ?auto_192810 ?auto_192816 ) ) ( not ( = ?auto_192811 ?auto_192816 ) ) ( not ( = ?auto_192812 ?auto_192816 ) ) ( not ( = ?auto_192813 ?auto_192816 ) ) ( not ( = ?auto_192814 ?auto_192816 ) ) ( ON ?auto_192813 ?auto_192814 ) ( ON-TABLE ?auto_192815 ) ( ON ?auto_192816 ?auto_192815 ) ( not ( = ?auto_192815 ?auto_192816 ) ) ( not ( = ?auto_192815 ?auto_192814 ) ) ( not ( = ?auto_192815 ?auto_192813 ) ) ( not ( = ?auto_192808 ?auto_192815 ) ) ( not ( = ?auto_192809 ?auto_192815 ) ) ( not ( = ?auto_192810 ?auto_192815 ) ) ( not ( = ?auto_192811 ?auto_192815 ) ) ( not ( = ?auto_192812 ?auto_192815 ) ) ( ON ?auto_192812 ?auto_192813 ) ( ON ?auto_192811 ?auto_192812 ) ( CLEAR ?auto_192809 ) ( ON ?auto_192810 ?auto_192811 ) ( CLEAR ?auto_192810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192815 ?auto_192816 ?auto_192814 ?auto_192813 ?auto_192812 ?auto_192811 )
      ( MAKE-7PILE ?auto_192808 ?auto_192809 ?auto_192810 ?auto_192811 ?auto_192812 ?auto_192813 ?auto_192814 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192817 - BLOCK
      ?auto_192818 - BLOCK
      ?auto_192819 - BLOCK
      ?auto_192820 - BLOCK
      ?auto_192821 - BLOCK
      ?auto_192822 - BLOCK
      ?auto_192823 - BLOCK
    )
    :vars
    (
      ?auto_192824 - BLOCK
      ?auto_192825 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192817 ) ( not ( = ?auto_192817 ?auto_192818 ) ) ( not ( = ?auto_192817 ?auto_192819 ) ) ( not ( = ?auto_192817 ?auto_192820 ) ) ( not ( = ?auto_192817 ?auto_192821 ) ) ( not ( = ?auto_192817 ?auto_192822 ) ) ( not ( = ?auto_192817 ?auto_192823 ) ) ( not ( = ?auto_192818 ?auto_192819 ) ) ( not ( = ?auto_192818 ?auto_192820 ) ) ( not ( = ?auto_192818 ?auto_192821 ) ) ( not ( = ?auto_192818 ?auto_192822 ) ) ( not ( = ?auto_192818 ?auto_192823 ) ) ( not ( = ?auto_192819 ?auto_192820 ) ) ( not ( = ?auto_192819 ?auto_192821 ) ) ( not ( = ?auto_192819 ?auto_192822 ) ) ( not ( = ?auto_192819 ?auto_192823 ) ) ( not ( = ?auto_192820 ?auto_192821 ) ) ( not ( = ?auto_192820 ?auto_192822 ) ) ( not ( = ?auto_192820 ?auto_192823 ) ) ( not ( = ?auto_192821 ?auto_192822 ) ) ( not ( = ?auto_192821 ?auto_192823 ) ) ( not ( = ?auto_192822 ?auto_192823 ) ) ( ON ?auto_192823 ?auto_192824 ) ( not ( = ?auto_192817 ?auto_192824 ) ) ( not ( = ?auto_192818 ?auto_192824 ) ) ( not ( = ?auto_192819 ?auto_192824 ) ) ( not ( = ?auto_192820 ?auto_192824 ) ) ( not ( = ?auto_192821 ?auto_192824 ) ) ( not ( = ?auto_192822 ?auto_192824 ) ) ( not ( = ?auto_192823 ?auto_192824 ) ) ( ON ?auto_192822 ?auto_192823 ) ( ON-TABLE ?auto_192825 ) ( ON ?auto_192824 ?auto_192825 ) ( not ( = ?auto_192825 ?auto_192824 ) ) ( not ( = ?auto_192825 ?auto_192823 ) ) ( not ( = ?auto_192825 ?auto_192822 ) ) ( not ( = ?auto_192817 ?auto_192825 ) ) ( not ( = ?auto_192818 ?auto_192825 ) ) ( not ( = ?auto_192819 ?auto_192825 ) ) ( not ( = ?auto_192820 ?auto_192825 ) ) ( not ( = ?auto_192821 ?auto_192825 ) ) ( ON ?auto_192821 ?auto_192822 ) ( ON ?auto_192820 ?auto_192821 ) ( ON ?auto_192819 ?auto_192820 ) ( CLEAR ?auto_192819 ) ( HOLDING ?auto_192818 ) ( CLEAR ?auto_192817 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192817 ?auto_192818 )
      ( MAKE-7PILE ?auto_192817 ?auto_192818 ?auto_192819 ?auto_192820 ?auto_192821 ?auto_192822 ?auto_192823 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192826 - BLOCK
      ?auto_192827 - BLOCK
      ?auto_192828 - BLOCK
      ?auto_192829 - BLOCK
      ?auto_192830 - BLOCK
      ?auto_192831 - BLOCK
      ?auto_192832 - BLOCK
    )
    :vars
    (
      ?auto_192833 - BLOCK
      ?auto_192834 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192826 ) ( not ( = ?auto_192826 ?auto_192827 ) ) ( not ( = ?auto_192826 ?auto_192828 ) ) ( not ( = ?auto_192826 ?auto_192829 ) ) ( not ( = ?auto_192826 ?auto_192830 ) ) ( not ( = ?auto_192826 ?auto_192831 ) ) ( not ( = ?auto_192826 ?auto_192832 ) ) ( not ( = ?auto_192827 ?auto_192828 ) ) ( not ( = ?auto_192827 ?auto_192829 ) ) ( not ( = ?auto_192827 ?auto_192830 ) ) ( not ( = ?auto_192827 ?auto_192831 ) ) ( not ( = ?auto_192827 ?auto_192832 ) ) ( not ( = ?auto_192828 ?auto_192829 ) ) ( not ( = ?auto_192828 ?auto_192830 ) ) ( not ( = ?auto_192828 ?auto_192831 ) ) ( not ( = ?auto_192828 ?auto_192832 ) ) ( not ( = ?auto_192829 ?auto_192830 ) ) ( not ( = ?auto_192829 ?auto_192831 ) ) ( not ( = ?auto_192829 ?auto_192832 ) ) ( not ( = ?auto_192830 ?auto_192831 ) ) ( not ( = ?auto_192830 ?auto_192832 ) ) ( not ( = ?auto_192831 ?auto_192832 ) ) ( ON ?auto_192832 ?auto_192833 ) ( not ( = ?auto_192826 ?auto_192833 ) ) ( not ( = ?auto_192827 ?auto_192833 ) ) ( not ( = ?auto_192828 ?auto_192833 ) ) ( not ( = ?auto_192829 ?auto_192833 ) ) ( not ( = ?auto_192830 ?auto_192833 ) ) ( not ( = ?auto_192831 ?auto_192833 ) ) ( not ( = ?auto_192832 ?auto_192833 ) ) ( ON ?auto_192831 ?auto_192832 ) ( ON-TABLE ?auto_192834 ) ( ON ?auto_192833 ?auto_192834 ) ( not ( = ?auto_192834 ?auto_192833 ) ) ( not ( = ?auto_192834 ?auto_192832 ) ) ( not ( = ?auto_192834 ?auto_192831 ) ) ( not ( = ?auto_192826 ?auto_192834 ) ) ( not ( = ?auto_192827 ?auto_192834 ) ) ( not ( = ?auto_192828 ?auto_192834 ) ) ( not ( = ?auto_192829 ?auto_192834 ) ) ( not ( = ?auto_192830 ?auto_192834 ) ) ( ON ?auto_192830 ?auto_192831 ) ( ON ?auto_192829 ?auto_192830 ) ( ON ?auto_192828 ?auto_192829 ) ( CLEAR ?auto_192826 ) ( ON ?auto_192827 ?auto_192828 ) ( CLEAR ?auto_192827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192834 ?auto_192833 ?auto_192832 ?auto_192831 ?auto_192830 ?auto_192829 ?auto_192828 )
      ( MAKE-7PILE ?auto_192826 ?auto_192827 ?auto_192828 ?auto_192829 ?auto_192830 ?auto_192831 ?auto_192832 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192835 - BLOCK
      ?auto_192836 - BLOCK
      ?auto_192837 - BLOCK
      ?auto_192838 - BLOCK
      ?auto_192839 - BLOCK
      ?auto_192840 - BLOCK
      ?auto_192841 - BLOCK
    )
    :vars
    (
      ?auto_192843 - BLOCK
      ?auto_192842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_192835 ?auto_192836 ) ) ( not ( = ?auto_192835 ?auto_192837 ) ) ( not ( = ?auto_192835 ?auto_192838 ) ) ( not ( = ?auto_192835 ?auto_192839 ) ) ( not ( = ?auto_192835 ?auto_192840 ) ) ( not ( = ?auto_192835 ?auto_192841 ) ) ( not ( = ?auto_192836 ?auto_192837 ) ) ( not ( = ?auto_192836 ?auto_192838 ) ) ( not ( = ?auto_192836 ?auto_192839 ) ) ( not ( = ?auto_192836 ?auto_192840 ) ) ( not ( = ?auto_192836 ?auto_192841 ) ) ( not ( = ?auto_192837 ?auto_192838 ) ) ( not ( = ?auto_192837 ?auto_192839 ) ) ( not ( = ?auto_192837 ?auto_192840 ) ) ( not ( = ?auto_192837 ?auto_192841 ) ) ( not ( = ?auto_192838 ?auto_192839 ) ) ( not ( = ?auto_192838 ?auto_192840 ) ) ( not ( = ?auto_192838 ?auto_192841 ) ) ( not ( = ?auto_192839 ?auto_192840 ) ) ( not ( = ?auto_192839 ?auto_192841 ) ) ( not ( = ?auto_192840 ?auto_192841 ) ) ( ON ?auto_192841 ?auto_192843 ) ( not ( = ?auto_192835 ?auto_192843 ) ) ( not ( = ?auto_192836 ?auto_192843 ) ) ( not ( = ?auto_192837 ?auto_192843 ) ) ( not ( = ?auto_192838 ?auto_192843 ) ) ( not ( = ?auto_192839 ?auto_192843 ) ) ( not ( = ?auto_192840 ?auto_192843 ) ) ( not ( = ?auto_192841 ?auto_192843 ) ) ( ON ?auto_192840 ?auto_192841 ) ( ON-TABLE ?auto_192842 ) ( ON ?auto_192843 ?auto_192842 ) ( not ( = ?auto_192842 ?auto_192843 ) ) ( not ( = ?auto_192842 ?auto_192841 ) ) ( not ( = ?auto_192842 ?auto_192840 ) ) ( not ( = ?auto_192835 ?auto_192842 ) ) ( not ( = ?auto_192836 ?auto_192842 ) ) ( not ( = ?auto_192837 ?auto_192842 ) ) ( not ( = ?auto_192838 ?auto_192842 ) ) ( not ( = ?auto_192839 ?auto_192842 ) ) ( ON ?auto_192839 ?auto_192840 ) ( ON ?auto_192838 ?auto_192839 ) ( ON ?auto_192837 ?auto_192838 ) ( ON ?auto_192836 ?auto_192837 ) ( CLEAR ?auto_192836 ) ( HOLDING ?auto_192835 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192835 )
      ( MAKE-7PILE ?auto_192835 ?auto_192836 ?auto_192837 ?auto_192838 ?auto_192839 ?auto_192840 ?auto_192841 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_192844 - BLOCK
      ?auto_192845 - BLOCK
      ?auto_192846 - BLOCK
      ?auto_192847 - BLOCK
      ?auto_192848 - BLOCK
      ?auto_192849 - BLOCK
      ?auto_192850 - BLOCK
    )
    :vars
    (
      ?auto_192852 - BLOCK
      ?auto_192851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_192844 ?auto_192845 ) ) ( not ( = ?auto_192844 ?auto_192846 ) ) ( not ( = ?auto_192844 ?auto_192847 ) ) ( not ( = ?auto_192844 ?auto_192848 ) ) ( not ( = ?auto_192844 ?auto_192849 ) ) ( not ( = ?auto_192844 ?auto_192850 ) ) ( not ( = ?auto_192845 ?auto_192846 ) ) ( not ( = ?auto_192845 ?auto_192847 ) ) ( not ( = ?auto_192845 ?auto_192848 ) ) ( not ( = ?auto_192845 ?auto_192849 ) ) ( not ( = ?auto_192845 ?auto_192850 ) ) ( not ( = ?auto_192846 ?auto_192847 ) ) ( not ( = ?auto_192846 ?auto_192848 ) ) ( not ( = ?auto_192846 ?auto_192849 ) ) ( not ( = ?auto_192846 ?auto_192850 ) ) ( not ( = ?auto_192847 ?auto_192848 ) ) ( not ( = ?auto_192847 ?auto_192849 ) ) ( not ( = ?auto_192847 ?auto_192850 ) ) ( not ( = ?auto_192848 ?auto_192849 ) ) ( not ( = ?auto_192848 ?auto_192850 ) ) ( not ( = ?auto_192849 ?auto_192850 ) ) ( ON ?auto_192850 ?auto_192852 ) ( not ( = ?auto_192844 ?auto_192852 ) ) ( not ( = ?auto_192845 ?auto_192852 ) ) ( not ( = ?auto_192846 ?auto_192852 ) ) ( not ( = ?auto_192847 ?auto_192852 ) ) ( not ( = ?auto_192848 ?auto_192852 ) ) ( not ( = ?auto_192849 ?auto_192852 ) ) ( not ( = ?auto_192850 ?auto_192852 ) ) ( ON ?auto_192849 ?auto_192850 ) ( ON-TABLE ?auto_192851 ) ( ON ?auto_192852 ?auto_192851 ) ( not ( = ?auto_192851 ?auto_192852 ) ) ( not ( = ?auto_192851 ?auto_192850 ) ) ( not ( = ?auto_192851 ?auto_192849 ) ) ( not ( = ?auto_192844 ?auto_192851 ) ) ( not ( = ?auto_192845 ?auto_192851 ) ) ( not ( = ?auto_192846 ?auto_192851 ) ) ( not ( = ?auto_192847 ?auto_192851 ) ) ( not ( = ?auto_192848 ?auto_192851 ) ) ( ON ?auto_192848 ?auto_192849 ) ( ON ?auto_192847 ?auto_192848 ) ( ON ?auto_192846 ?auto_192847 ) ( ON ?auto_192845 ?auto_192846 ) ( ON ?auto_192844 ?auto_192845 ) ( CLEAR ?auto_192844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192851 ?auto_192852 ?auto_192850 ?auto_192849 ?auto_192848 ?auto_192847 ?auto_192846 ?auto_192845 )
      ( MAKE-7PILE ?auto_192844 ?auto_192845 ?auto_192846 ?auto_192847 ?auto_192848 ?auto_192849 ?auto_192850 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192854 - BLOCK
    )
    :vars
    (
      ?auto_192855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192855 ?auto_192854 ) ( CLEAR ?auto_192855 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192854 ) ( not ( = ?auto_192854 ?auto_192855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192855 ?auto_192854 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192856 - BLOCK
    )
    :vars
    (
      ?auto_192857 - BLOCK
      ?auto_192858 - BLOCK
      ?auto_192859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192857 ?auto_192856 ) ( CLEAR ?auto_192857 ) ( ON-TABLE ?auto_192856 ) ( not ( = ?auto_192856 ?auto_192857 ) ) ( HOLDING ?auto_192858 ) ( CLEAR ?auto_192859 ) ( not ( = ?auto_192856 ?auto_192858 ) ) ( not ( = ?auto_192856 ?auto_192859 ) ) ( not ( = ?auto_192857 ?auto_192858 ) ) ( not ( = ?auto_192857 ?auto_192859 ) ) ( not ( = ?auto_192858 ?auto_192859 ) ) )
    :subtasks
    ( ( !STACK ?auto_192858 ?auto_192859 )
      ( MAKE-1PILE ?auto_192856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192860 - BLOCK
    )
    :vars
    (
      ?auto_192861 - BLOCK
      ?auto_192863 - BLOCK
      ?auto_192862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192861 ?auto_192860 ) ( ON-TABLE ?auto_192860 ) ( not ( = ?auto_192860 ?auto_192861 ) ) ( CLEAR ?auto_192863 ) ( not ( = ?auto_192860 ?auto_192862 ) ) ( not ( = ?auto_192860 ?auto_192863 ) ) ( not ( = ?auto_192861 ?auto_192862 ) ) ( not ( = ?auto_192861 ?auto_192863 ) ) ( not ( = ?auto_192862 ?auto_192863 ) ) ( ON ?auto_192862 ?auto_192861 ) ( CLEAR ?auto_192862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192860 ?auto_192861 )
      ( MAKE-1PILE ?auto_192860 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192864 - BLOCK
    )
    :vars
    (
      ?auto_192865 - BLOCK
      ?auto_192867 - BLOCK
      ?auto_192866 - BLOCK
      ?auto_192871 - BLOCK
      ?auto_192869 - BLOCK
      ?auto_192870 - BLOCK
      ?auto_192868 - BLOCK
      ?auto_192872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192865 ?auto_192864 ) ( ON-TABLE ?auto_192864 ) ( not ( = ?auto_192864 ?auto_192865 ) ) ( not ( = ?auto_192864 ?auto_192867 ) ) ( not ( = ?auto_192864 ?auto_192866 ) ) ( not ( = ?auto_192865 ?auto_192867 ) ) ( not ( = ?auto_192865 ?auto_192866 ) ) ( not ( = ?auto_192867 ?auto_192866 ) ) ( ON ?auto_192867 ?auto_192865 ) ( CLEAR ?auto_192867 ) ( HOLDING ?auto_192866 ) ( CLEAR ?auto_192871 ) ( ON-TABLE ?auto_192869 ) ( ON ?auto_192870 ?auto_192869 ) ( ON ?auto_192868 ?auto_192870 ) ( ON ?auto_192872 ?auto_192868 ) ( ON ?auto_192871 ?auto_192872 ) ( not ( = ?auto_192869 ?auto_192870 ) ) ( not ( = ?auto_192869 ?auto_192868 ) ) ( not ( = ?auto_192869 ?auto_192872 ) ) ( not ( = ?auto_192869 ?auto_192871 ) ) ( not ( = ?auto_192869 ?auto_192866 ) ) ( not ( = ?auto_192870 ?auto_192868 ) ) ( not ( = ?auto_192870 ?auto_192872 ) ) ( not ( = ?auto_192870 ?auto_192871 ) ) ( not ( = ?auto_192870 ?auto_192866 ) ) ( not ( = ?auto_192868 ?auto_192872 ) ) ( not ( = ?auto_192868 ?auto_192871 ) ) ( not ( = ?auto_192868 ?auto_192866 ) ) ( not ( = ?auto_192872 ?auto_192871 ) ) ( not ( = ?auto_192872 ?auto_192866 ) ) ( not ( = ?auto_192871 ?auto_192866 ) ) ( not ( = ?auto_192864 ?auto_192871 ) ) ( not ( = ?auto_192864 ?auto_192869 ) ) ( not ( = ?auto_192864 ?auto_192870 ) ) ( not ( = ?auto_192864 ?auto_192868 ) ) ( not ( = ?auto_192864 ?auto_192872 ) ) ( not ( = ?auto_192865 ?auto_192871 ) ) ( not ( = ?auto_192865 ?auto_192869 ) ) ( not ( = ?auto_192865 ?auto_192870 ) ) ( not ( = ?auto_192865 ?auto_192868 ) ) ( not ( = ?auto_192865 ?auto_192872 ) ) ( not ( = ?auto_192867 ?auto_192871 ) ) ( not ( = ?auto_192867 ?auto_192869 ) ) ( not ( = ?auto_192867 ?auto_192870 ) ) ( not ( = ?auto_192867 ?auto_192868 ) ) ( not ( = ?auto_192867 ?auto_192872 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192869 ?auto_192870 ?auto_192868 ?auto_192872 ?auto_192871 ?auto_192866 )
      ( MAKE-1PILE ?auto_192864 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192873 - BLOCK
    )
    :vars
    (
      ?auto_192880 - BLOCK
      ?auto_192878 - BLOCK
      ?auto_192881 - BLOCK
      ?auto_192876 - BLOCK
      ?auto_192877 - BLOCK
      ?auto_192875 - BLOCK
      ?auto_192879 - BLOCK
      ?auto_192874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192880 ?auto_192873 ) ( ON-TABLE ?auto_192873 ) ( not ( = ?auto_192873 ?auto_192880 ) ) ( not ( = ?auto_192873 ?auto_192878 ) ) ( not ( = ?auto_192873 ?auto_192881 ) ) ( not ( = ?auto_192880 ?auto_192878 ) ) ( not ( = ?auto_192880 ?auto_192881 ) ) ( not ( = ?auto_192878 ?auto_192881 ) ) ( ON ?auto_192878 ?auto_192880 ) ( CLEAR ?auto_192876 ) ( ON-TABLE ?auto_192877 ) ( ON ?auto_192875 ?auto_192877 ) ( ON ?auto_192879 ?auto_192875 ) ( ON ?auto_192874 ?auto_192879 ) ( ON ?auto_192876 ?auto_192874 ) ( not ( = ?auto_192877 ?auto_192875 ) ) ( not ( = ?auto_192877 ?auto_192879 ) ) ( not ( = ?auto_192877 ?auto_192874 ) ) ( not ( = ?auto_192877 ?auto_192876 ) ) ( not ( = ?auto_192877 ?auto_192881 ) ) ( not ( = ?auto_192875 ?auto_192879 ) ) ( not ( = ?auto_192875 ?auto_192874 ) ) ( not ( = ?auto_192875 ?auto_192876 ) ) ( not ( = ?auto_192875 ?auto_192881 ) ) ( not ( = ?auto_192879 ?auto_192874 ) ) ( not ( = ?auto_192879 ?auto_192876 ) ) ( not ( = ?auto_192879 ?auto_192881 ) ) ( not ( = ?auto_192874 ?auto_192876 ) ) ( not ( = ?auto_192874 ?auto_192881 ) ) ( not ( = ?auto_192876 ?auto_192881 ) ) ( not ( = ?auto_192873 ?auto_192876 ) ) ( not ( = ?auto_192873 ?auto_192877 ) ) ( not ( = ?auto_192873 ?auto_192875 ) ) ( not ( = ?auto_192873 ?auto_192879 ) ) ( not ( = ?auto_192873 ?auto_192874 ) ) ( not ( = ?auto_192880 ?auto_192876 ) ) ( not ( = ?auto_192880 ?auto_192877 ) ) ( not ( = ?auto_192880 ?auto_192875 ) ) ( not ( = ?auto_192880 ?auto_192879 ) ) ( not ( = ?auto_192880 ?auto_192874 ) ) ( not ( = ?auto_192878 ?auto_192876 ) ) ( not ( = ?auto_192878 ?auto_192877 ) ) ( not ( = ?auto_192878 ?auto_192875 ) ) ( not ( = ?auto_192878 ?auto_192879 ) ) ( not ( = ?auto_192878 ?auto_192874 ) ) ( ON ?auto_192881 ?auto_192878 ) ( CLEAR ?auto_192881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192873 ?auto_192880 ?auto_192878 )
      ( MAKE-1PILE ?auto_192873 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192882 - BLOCK
    )
    :vars
    (
      ?auto_192889 - BLOCK
      ?auto_192888 - BLOCK
      ?auto_192890 - BLOCK
      ?auto_192885 - BLOCK
      ?auto_192883 - BLOCK
      ?auto_192886 - BLOCK
      ?auto_192887 - BLOCK
      ?auto_192884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192889 ?auto_192882 ) ( ON-TABLE ?auto_192882 ) ( not ( = ?auto_192882 ?auto_192889 ) ) ( not ( = ?auto_192882 ?auto_192888 ) ) ( not ( = ?auto_192882 ?auto_192890 ) ) ( not ( = ?auto_192889 ?auto_192888 ) ) ( not ( = ?auto_192889 ?auto_192890 ) ) ( not ( = ?auto_192888 ?auto_192890 ) ) ( ON ?auto_192888 ?auto_192889 ) ( ON-TABLE ?auto_192885 ) ( ON ?auto_192883 ?auto_192885 ) ( ON ?auto_192886 ?auto_192883 ) ( ON ?auto_192887 ?auto_192886 ) ( not ( = ?auto_192885 ?auto_192883 ) ) ( not ( = ?auto_192885 ?auto_192886 ) ) ( not ( = ?auto_192885 ?auto_192887 ) ) ( not ( = ?auto_192885 ?auto_192884 ) ) ( not ( = ?auto_192885 ?auto_192890 ) ) ( not ( = ?auto_192883 ?auto_192886 ) ) ( not ( = ?auto_192883 ?auto_192887 ) ) ( not ( = ?auto_192883 ?auto_192884 ) ) ( not ( = ?auto_192883 ?auto_192890 ) ) ( not ( = ?auto_192886 ?auto_192887 ) ) ( not ( = ?auto_192886 ?auto_192884 ) ) ( not ( = ?auto_192886 ?auto_192890 ) ) ( not ( = ?auto_192887 ?auto_192884 ) ) ( not ( = ?auto_192887 ?auto_192890 ) ) ( not ( = ?auto_192884 ?auto_192890 ) ) ( not ( = ?auto_192882 ?auto_192884 ) ) ( not ( = ?auto_192882 ?auto_192885 ) ) ( not ( = ?auto_192882 ?auto_192883 ) ) ( not ( = ?auto_192882 ?auto_192886 ) ) ( not ( = ?auto_192882 ?auto_192887 ) ) ( not ( = ?auto_192889 ?auto_192884 ) ) ( not ( = ?auto_192889 ?auto_192885 ) ) ( not ( = ?auto_192889 ?auto_192883 ) ) ( not ( = ?auto_192889 ?auto_192886 ) ) ( not ( = ?auto_192889 ?auto_192887 ) ) ( not ( = ?auto_192888 ?auto_192884 ) ) ( not ( = ?auto_192888 ?auto_192885 ) ) ( not ( = ?auto_192888 ?auto_192883 ) ) ( not ( = ?auto_192888 ?auto_192886 ) ) ( not ( = ?auto_192888 ?auto_192887 ) ) ( ON ?auto_192890 ?auto_192888 ) ( CLEAR ?auto_192890 ) ( HOLDING ?auto_192884 ) ( CLEAR ?auto_192887 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192885 ?auto_192883 ?auto_192886 ?auto_192887 ?auto_192884 )
      ( MAKE-1PILE ?auto_192882 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192891 - BLOCK
    )
    :vars
    (
      ?auto_192898 - BLOCK
      ?auto_192895 - BLOCK
      ?auto_192897 - BLOCK
      ?auto_192899 - BLOCK
      ?auto_192896 - BLOCK
      ?auto_192894 - BLOCK
      ?auto_192892 - BLOCK
      ?auto_192893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192898 ?auto_192891 ) ( ON-TABLE ?auto_192891 ) ( not ( = ?auto_192891 ?auto_192898 ) ) ( not ( = ?auto_192891 ?auto_192895 ) ) ( not ( = ?auto_192891 ?auto_192897 ) ) ( not ( = ?auto_192898 ?auto_192895 ) ) ( not ( = ?auto_192898 ?auto_192897 ) ) ( not ( = ?auto_192895 ?auto_192897 ) ) ( ON ?auto_192895 ?auto_192898 ) ( ON-TABLE ?auto_192899 ) ( ON ?auto_192896 ?auto_192899 ) ( ON ?auto_192894 ?auto_192896 ) ( ON ?auto_192892 ?auto_192894 ) ( not ( = ?auto_192899 ?auto_192896 ) ) ( not ( = ?auto_192899 ?auto_192894 ) ) ( not ( = ?auto_192899 ?auto_192892 ) ) ( not ( = ?auto_192899 ?auto_192893 ) ) ( not ( = ?auto_192899 ?auto_192897 ) ) ( not ( = ?auto_192896 ?auto_192894 ) ) ( not ( = ?auto_192896 ?auto_192892 ) ) ( not ( = ?auto_192896 ?auto_192893 ) ) ( not ( = ?auto_192896 ?auto_192897 ) ) ( not ( = ?auto_192894 ?auto_192892 ) ) ( not ( = ?auto_192894 ?auto_192893 ) ) ( not ( = ?auto_192894 ?auto_192897 ) ) ( not ( = ?auto_192892 ?auto_192893 ) ) ( not ( = ?auto_192892 ?auto_192897 ) ) ( not ( = ?auto_192893 ?auto_192897 ) ) ( not ( = ?auto_192891 ?auto_192893 ) ) ( not ( = ?auto_192891 ?auto_192899 ) ) ( not ( = ?auto_192891 ?auto_192896 ) ) ( not ( = ?auto_192891 ?auto_192894 ) ) ( not ( = ?auto_192891 ?auto_192892 ) ) ( not ( = ?auto_192898 ?auto_192893 ) ) ( not ( = ?auto_192898 ?auto_192899 ) ) ( not ( = ?auto_192898 ?auto_192896 ) ) ( not ( = ?auto_192898 ?auto_192894 ) ) ( not ( = ?auto_192898 ?auto_192892 ) ) ( not ( = ?auto_192895 ?auto_192893 ) ) ( not ( = ?auto_192895 ?auto_192899 ) ) ( not ( = ?auto_192895 ?auto_192896 ) ) ( not ( = ?auto_192895 ?auto_192894 ) ) ( not ( = ?auto_192895 ?auto_192892 ) ) ( ON ?auto_192897 ?auto_192895 ) ( CLEAR ?auto_192892 ) ( ON ?auto_192893 ?auto_192897 ) ( CLEAR ?auto_192893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192891 ?auto_192898 ?auto_192895 ?auto_192897 )
      ( MAKE-1PILE ?auto_192891 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192900 - BLOCK
    )
    :vars
    (
      ?auto_192907 - BLOCK
      ?auto_192906 - BLOCK
      ?auto_192903 - BLOCK
      ?auto_192904 - BLOCK
      ?auto_192905 - BLOCK
      ?auto_192902 - BLOCK
      ?auto_192901 - BLOCK
      ?auto_192908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192907 ?auto_192900 ) ( ON-TABLE ?auto_192900 ) ( not ( = ?auto_192900 ?auto_192907 ) ) ( not ( = ?auto_192900 ?auto_192906 ) ) ( not ( = ?auto_192900 ?auto_192903 ) ) ( not ( = ?auto_192907 ?auto_192906 ) ) ( not ( = ?auto_192907 ?auto_192903 ) ) ( not ( = ?auto_192906 ?auto_192903 ) ) ( ON ?auto_192906 ?auto_192907 ) ( ON-TABLE ?auto_192904 ) ( ON ?auto_192905 ?auto_192904 ) ( ON ?auto_192902 ?auto_192905 ) ( not ( = ?auto_192904 ?auto_192905 ) ) ( not ( = ?auto_192904 ?auto_192902 ) ) ( not ( = ?auto_192904 ?auto_192901 ) ) ( not ( = ?auto_192904 ?auto_192908 ) ) ( not ( = ?auto_192904 ?auto_192903 ) ) ( not ( = ?auto_192905 ?auto_192902 ) ) ( not ( = ?auto_192905 ?auto_192901 ) ) ( not ( = ?auto_192905 ?auto_192908 ) ) ( not ( = ?auto_192905 ?auto_192903 ) ) ( not ( = ?auto_192902 ?auto_192901 ) ) ( not ( = ?auto_192902 ?auto_192908 ) ) ( not ( = ?auto_192902 ?auto_192903 ) ) ( not ( = ?auto_192901 ?auto_192908 ) ) ( not ( = ?auto_192901 ?auto_192903 ) ) ( not ( = ?auto_192908 ?auto_192903 ) ) ( not ( = ?auto_192900 ?auto_192908 ) ) ( not ( = ?auto_192900 ?auto_192904 ) ) ( not ( = ?auto_192900 ?auto_192905 ) ) ( not ( = ?auto_192900 ?auto_192902 ) ) ( not ( = ?auto_192900 ?auto_192901 ) ) ( not ( = ?auto_192907 ?auto_192908 ) ) ( not ( = ?auto_192907 ?auto_192904 ) ) ( not ( = ?auto_192907 ?auto_192905 ) ) ( not ( = ?auto_192907 ?auto_192902 ) ) ( not ( = ?auto_192907 ?auto_192901 ) ) ( not ( = ?auto_192906 ?auto_192908 ) ) ( not ( = ?auto_192906 ?auto_192904 ) ) ( not ( = ?auto_192906 ?auto_192905 ) ) ( not ( = ?auto_192906 ?auto_192902 ) ) ( not ( = ?auto_192906 ?auto_192901 ) ) ( ON ?auto_192903 ?auto_192906 ) ( ON ?auto_192908 ?auto_192903 ) ( CLEAR ?auto_192908 ) ( HOLDING ?auto_192901 ) ( CLEAR ?auto_192902 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_192904 ?auto_192905 ?auto_192902 ?auto_192901 )
      ( MAKE-1PILE ?auto_192900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192909 - BLOCK
    )
    :vars
    (
      ?auto_192912 - BLOCK
      ?auto_192915 - BLOCK
      ?auto_192910 - BLOCK
      ?auto_192916 - BLOCK
      ?auto_192911 - BLOCK
      ?auto_192913 - BLOCK
      ?auto_192914 - BLOCK
      ?auto_192917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192912 ?auto_192909 ) ( ON-TABLE ?auto_192909 ) ( not ( = ?auto_192909 ?auto_192912 ) ) ( not ( = ?auto_192909 ?auto_192915 ) ) ( not ( = ?auto_192909 ?auto_192910 ) ) ( not ( = ?auto_192912 ?auto_192915 ) ) ( not ( = ?auto_192912 ?auto_192910 ) ) ( not ( = ?auto_192915 ?auto_192910 ) ) ( ON ?auto_192915 ?auto_192912 ) ( ON-TABLE ?auto_192916 ) ( ON ?auto_192911 ?auto_192916 ) ( ON ?auto_192913 ?auto_192911 ) ( not ( = ?auto_192916 ?auto_192911 ) ) ( not ( = ?auto_192916 ?auto_192913 ) ) ( not ( = ?auto_192916 ?auto_192914 ) ) ( not ( = ?auto_192916 ?auto_192917 ) ) ( not ( = ?auto_192916 ?auto_192910 ) ) ( not ( = ?auto_192911 ?auto_192913 ) ) ( not ( = ?auto_192911 ?auto_192914 ) ) ( not ( = ?auto_192911 ?auto_192917 ) ) ( not ( = ?auto_192911 ?auto_192910 ) ) ( not ( = ?auto_192913 ?auto_192914 ) ) ( not ( = ?auto_192913 ?auto_192917 ) ) ( not ( = ?auto_192913 ?auto_192910 ) ) ( not ( = ?auto_192914 ?auto_192917 ) ) ( not ( = ?auto_192914 ?auto_192910 ) ) ( not ( = ?auto_192917 ?auto_192910 ) ) ( not ( = ?auto_192909 ?auto_192917 ) ) ( not ( = ?auto_192909 ?auto_192916 ) ) ( not ( = ?auto_192909 ?auto_192911 ) ) ( not ( = ?auto_192909 ?auto_192913 ) ) ( not ( = ?auto_192909 ?auto_192914 ) ) ( not ( = ?auto_192912 ?auto_192917 ) ) ( not ( = ?auto_192912 ?auto_192916 ) ) ( not ( = ?auto_192912 ?auto_192911 ) ) ( not ( = ?auto_192912 ?auto_192913 ) ) ( not ( = ?auto_192912 ?auto_192914 ) ) ( not ( = ?auto_192915 ?auto_192917 ) ) ( not ( = ?auto_192915 ?auto_192916 ) ) ( not ( = ?auto_192915 ?auto_192911 ) ) ( not ( = ?auto_192915 ?auto_192913 ) ) ( not ( = ?auto_192915 ?auto_192914 ) ) ( ON ?auto_192910 ?auto_192915 ) ( ON ?auto_192917 ?auto_192910 ) ( CLEAR ?auto_192913 ) ( ON ?auto_192914 ?auto_192917 ) ( CLEAR ?auto_192914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_192909 ?auto_192912 ?auto_192915 ?auto_192910 ?auto_192917 )
      ( MAKE-1PILE ?auto_192909 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192918 - BLOCK
    )
    :vars
    (
      ?auto_192922 - BLOCK
      ?auto_192923 - BLOCK
      ?auto_192924 - BLOCK
      ?auto_192925 - BLOCK
      ?auto_192926 - BLOCK
      ?auto_192920 - BLOCK
      ?auto_192919 - BLOCK
      ?auto_192921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192922 ?auto_192918 ) ( ON-TABLE ?auto_192918 ) ( not ( = ?auto_192918 ?auto_192922 ) ) ( not ( = ?auto_192918 ?auto_192923 ) ) ( not ( = ?auto_192918 ?auto_192924 ) ) ( not ( = ?auto_192922 ?auto_192923 ) ) ( not ( = ?auto_192922 ?auto_192924 ) ) ( not ( = ?auto_192923 ?auto_192924 ) ) ( ON ?auto_192923 ?auto_192922 ) ( ON-TABLE ?auto_192925 ) ( ON ?auto_192926 ?auto_192925 ) ( not ( = ?auto_192925 ?auto_192926 ) ) ( not ( = ?auto_192925 ?auto_192920 ) ) ( not ( = ?auto_192925 ?auto_192919 ) ) ( not ( = ?auto_192925 ?auto_192921 ) ) ( not ( = ?auto_192925 ?auto_192924 ) ) ( not ( = ?auto_192926 ?auto_192920 ) ) ( not ( = ?auto_192926 ?auto_192919 ) ) ( not ( = ?auto_192926 ?auto_192921 ) ) ( not ( = ?auto_192926 ?auto_192924 ) ) ( not ( = ?auto_192920 ?auto_192919 ) ) ( not ( = ?auto_192920 ?auto_192921 ) ) ( not ( = ?auto_192920 ?auto_192924 ) ) ( not ( = ?auto_192919 ?auto_192921 ) ) ( not ( = ?auto_192919 ?auto_192924 ) ) ( not ( = ?auto_192921 ?auto_192924 ) ) ( not ( = ?auto_192918 ?auto_192921 ) ) ( not ( = ?auto_192918 ?auto_192925 ) ) ( not ( = ?auto_192918 ?auto_192926 ) ) ( not ( = ?auto_192918 ?auto_192920 ) ) ( not ( = ?auto_192918 ?auto_192919 ) ) ( not ( = ?auto_192922 ?auto_192921 ) ) ( not ( = ?auto_192922 ?auto_192925 ) ) ( not ( = ?auto_192922 ?auto_192926 ) ) ( not ( = ?auto_192922 ?auto_192920 ) ) ( not ( = ?auto_192922 ?auto_192919 ) ) ( not ( = ?auto_192923 ?auto_192921 ) ) ( not ( = ?auto_192923 ?auto_192925 ) ) ( not ( = ?auto_192923 ?auto_192926 ) ) ( not ( = ?auto_192923 ?auto_192920 ) ) ( not ( = ?auto_192923 ?auto_192919 ) ) ( ON ?auto_192924 ?auto_192923 ) ( ON ?auto_192921 ?auto_192924 ) ( ON ?auto_192919 ?auto_192921 ) ( CLEAR ?auto_192919 ) ( HOLDING ?auto_192920 ) ( CLEAR ?auto_192926 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_192925 ?auto_192926 ?auto_192920 )
      ( MAKE-1PILE ?auto_192918 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192927 - BLOCK
    )
    :vars
    (
      ?auto_192932 - BLOCK
      ?auto_192935 - BLOCK
      ?auto_192930 - BLOCK
      ?auto_192929 - BLOCK
      ?auto_192933 - BLOCK
      ?auto_192931 - BLOCK
      ?auto_192928 - BLOCK
      ?auto_192934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192932 ?auto_192927 ) ( ON-TABLE ?auto_192927 ) ( not ( = ?auto_192927 ?auto_192932 ) ) ( not ( = ?auto_192927 ?auto_192935 ) ) ( not ( = ?auto_192927 ?auto_192930 ) ) ( not ( = ?auto_192932 ?auto_192935 ) ) ( not ( = ?auto_192932 ?auto_192930 ) ) ( not ( = ?auto_192935 ?auto_192930 ) ) ( ON ?auto_192935 ?auto_192932 ) ( ON-TABLE ?auto_192929 ) ( ON ?auto_192933 ?auto_192929 ) ( not ( = ?auto_192929 ?auto_192933 ) ) ( not ( = ?auto_192929 ?auto_192931 ) ) ( not ( = ?auto_192929 ?auto_192928 ) ) ( not ( = ?auto_192929 ?auto_192934 ) ) ( not ( = ?auto_192929 ?auto_192930 ) ) ( not ( = ?auto_192933 ?auto_192931 ) ) ( not ( = ?auto_192933 ?auto_192928 ) ) ( not ( = ?auto_192933 ?auto_192934 ) ) ( not ( = ?auto_192933 ?auto_192930 ) ) ( not ( = ?auto_192931 ?auto_192928 ) ) ( not ( = ?auto_192931 ?auto_192934 ) ) ( not ( = ?auto_192931 ?auto_192930 ) ) ( not ( = ?auto_192928 ?auto_192934 ) ) ( not ( = ?auto_192928 ?auto_192930 ) ) ( not ( = ?auto_192934 ?auto_192930 ) ) ( not ( = ?auto_192927 ?auto_192934 ) ) ( not ( = ?auto_192927 ?auto_192929 ) ) ( not ( = ?auto_192927 ?auto_192933 ) ) ( not ( = ?auto_192927 ?auto_192931 ) ) ( not ( = ?auto_192927 ?auto_192928 ) ) ( not ( = ?auto_192932 ?auto_192934 ) ) ( not ( = ?auto_192932 ?auto_192929 ) ) ( not ( = ?auto_192932 ?auto_192933 ) ) ( not ( = ?auto_192932 ?auto_192931 ) ) ( not ( = ?auto_192932 ?auto_192928 ) ) ( not ( = ?auto_192935 ?auto_192934 ) ) ( not ( = ?auto_192935 ?auto_192929 ) ) ( not ( = ?auto_192935 ?auto_192933 ) ) ( not ( = ?auto_192935 ?auto_192931 ) ) ( not ( = ?auto_192935 ?auto_192928 ) ) ( ON ?auto_192930 ?auto_192935 ) ( ON ?auto_192934 ?auto_192930 ) ( ON ?auto_192928 ?auto_192934 ) ( CLEAR ?auto_192933 ) ( ON ?auto_192931 ?auto_192928 ) ( CLEAR ?auto_192931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_192927 ?auto_192932 ?auto_192935 ?auto_192930 ?auto_192934 ?auto_192928 )
      ( MAKE-1PILE ?auto_192927 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192936 - BLOCK
    )
    :vars
    (
      ?auto_192944 - BLOCK
      ?auto_192939 - BLOCK
      ?auto_192943 - BLOCK
      ?auto_192942 - BLOCK
      ?auto_192941 - BLOCK
      ?auto_192940 - BLOCK
      ?auto_192938 - BLOCK
      ?auto_192937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192944 ?auto_192936 ) ( ON-TABLE ?auto_192936 ) ( not ( = ?auto_192936 ?auto_192944 ) ) ( not ( = ?auto_192936 ?auto_192939 ) ) ( not ( = ?auto_192936 ?auto_192943 ) ) ( not ( = ?auto_192944 ?auto_192939 ) ) ( not ( = ?auto_192944 ?auto_192943 ) ) ( not ( = ?auto_192939 ?auto_192943 ) ) ( ON ?auto_192939 ?auto_192944 ) ( ON-TABLE ?auto_192942 ) ( not ( = ?auto_192942 ?auto_192941 ) ) ( not ( = ?auto_192942 ?auto_192940 ) ) ( not ( = ?auto_192942 ?auto_192938 ) ) ( not ( = ?auto_192942 ?auto_192937 ) ) ( not ( = ?auto_192942 ?auto_192943 ) ) ( not ( = ?auto_192941 ?auto_192940 ) ) ( not ( = ?auto_192941 ?auto_192938 ) ) ( not ( = ?auto_192941 ?auto_192937 ) ) ( not ( = ?auto_192941 ?auto_192943 ) ) ( not ( = ?auto_192940 ?auto_192938 ) ) ( not ( = ?auto_192940 ?auto_192937 ) ) ( not ( = ?auto_192940 ?auto_192943 ) ) ( not ( = ?auto_192938 ?auto_192937 ) ) ( not ( = ?auto_192938 ?auto_192943 ) ) ( not ( = ?auto_192937 ?auto_192943 ) ) ( not ( = ?auto_192936 ?auto_192937 ) ) ( not ( = ?auto_192936 ?auto_192942 ) ) ( not ( = ?auto_192936 ?auto_192941 ) ) ( not ( = ?auto_192936 ?auto_192940 ) ) ( not ( = ?auto_192936 ?auto_192938 ) ) ( not ( = ?auto_192944 ?auto_192937 ) ) ( not ( = ?auto_192944 ?auto_192942 ) ) ( not ( = ?auto_192944 ?auto_192941 ) ) ( not ( = ?auto_192944 ?auto_192940 ) ) ( not ( = ?auto_192944 ?auto_192938 ) ) ( not ( = ?auto_192939 ?auto_192937 ) ) ( not ( = ?auto_192939 ?auto_192942 ) ) ( not ( = ?auto_192939 ?auto_192941 ) ) ( not ( = ?auto_192939 ?auto_192940 ) ) ( not ( = ?auto_192939 ?auto_192938 ) ) ( ON ?auto_192943 ?auto_192939 ) ( ON ?auto_192937 ?auto_192943 ) ( ON ?auto_192938 ?auto_192937 ) ( ON ?auto_192940 ?auto_192938 ) ( CLEAR ?auto_192940 ) ( HOLDING ?auto_192941 ) ( CLEAR ?auto_192942 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192942 ?auto_192941 )
      ( MAKE-1PILE ?auto_192936 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192945 - BLOCK
    )
    :vars
    (
      ?auto_192949 - BLOCK
      ?auto_192946 - BLOCK
      ?auto_192952 - BLOCK
      ?auto_192950 - BLOCK
      ?auto_192947 - BLOCK
      ?auto_192951 - BLOCK
      ?auto_192953 - BLOCK
      ?auto_192948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192949 ?auto_192945 ) ( ON-TABLE ?auto_192945 ) ( not ( = ?auto_192945 ?auto_192949 ) ) ( not ( = ?auto_192945 ?auto_192946 ) ) ( not ( = ?auto_192945 ?auto_192952 ) ) ( not ( = ?auto_192949 ?auto_192946 ) ) ( not ( = ?auto_192949 ?auto_192952 ) ) ( not ( = ?auto_192946 ?auto_192952 ) ) ( ON ?auto_192946 ?auto_192949 ) ( ON-TABLE ?auto_192950 ) ( not ( = ?auto_192950 ?auto_192947 ) ) ( not ( = ?auto_192950 ?auto_192951 ) ) ( not ( = ?auto_192950 ?auto_192953 ) ) ( not ( = ?auto_192950 ?auto_192948 ) ) ( not ( = ?auto_192950 ?auto_192952 ) ) ( not ( = ?auto_192947 ?auto_192951 ) ) ( not ( = ?auto_192947 ?auto_192953 ) ) ( not ( = ?auto_192947 ?auto_192948 ) ) ( not ( = ?auto_192947 ?auto_192952 ) ) ( not ( = ?auto_192951 ?auto_192953 ) ) ( not ( = ?auto_192951 ?auto_192948 ) ) ( not ( = ?auto_192951 ?auto_192952 ) ) ( not ( = ?auto_192953 ?auto_192948 ) ) ( not ( = ?auto_192953 ?auto_192952 ) ) ( not ( = ?auto_192948 ?auto_192952 ) ) ( not ( = ?auto_192945 ?auto_192948 ) ) ( not ( = ?auto_192945 ?auto_192950 ) ) ( not ( = ?auto_192945 ?auto_192947 ) ) ( not ( = ?auto_192945 ?auto_192951 ) ) ( not ( = ?auto_192945 ?auto_192953 ) ) ( not ( = ?auto_192949 ?auto_192948 ) ) ( not ( = ?auto_192949 ?auto_192950 ) ) ( not ( = ?auto_192949 ?auto_192947 ) ) ( not ( = ?auto_192949 ?auto_192951 ) ) ( not ( = ?auto_192949 ?auto_192953 ) ) ( not ( = ?auto_192946 ?auto_192948 ) ) ( not ( = ?auto_192946 ?auto_192950 ) ) ( not ( = ?auto_192946 ?auto_192947 ) ) ( not ( = ?auto_192946 ?auto_192951 ) ) ( not ( = ?auto_192946 ?auto_192953 ) ) ( ON ?auto_192952 ?auto_192946 ) ( ON ?auto_192948 ?auto_192952 ) ( ON ?auto_192953 ?auto_192948 ) ( ON ?auto_192951 ?auto_192953 ) ( CLEAR ?auto_192950 ) ( ON ?auto_192947 ?auto_192951 ) ( CLEAR ?auto_192947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192945 ?auto_192949 ?auto_192946 ?auto_192952 ?auto_192948 ?auto_192953 ?auto_192951 )
      ( MAKE-1PILE ?auto_192945 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192954 - BLOCK
    )
    :vars
    (
      ?auto_192958 - BLOCK
      ?auto_192962 - BLOCK
      ?auto_192960 - BLOCK
      ?auto_192957 - BLOCK
      ?auto_192961 - BLOCK
      ?auto_192955 - BLOCK
      ?auto_192956 - BLOCK
      ?auto_192959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192958 ?auto_192954 ) ( ON-TABLE ?auto_192954 ) ( not ( = ?auto_192954 ?auto_192958 ) ) ( not ( = ?auto_192954 ?auto_192962 ) ) ( not ( = ?auto_192954 ?auto_192960 ) ) ( not ( = ?auto_192958 ?auto_192962 ) ) ( not ( = ?auto_192958 ?auto_192960 ) ) ( not ( = ?auto_192962 ?auto_192960 ) ) ( ON ?auto_192962 ?auto_192958 ) ( not ( = ?auto_192957 ?auto_192961 ) ) ( not ( = ?auto_192957 ?auto_192955 ) ) ( not ( = ?auto_192957 ?auto_192956 ) ) ( not ( = ?auto_192957 ?auto_192959 ) ) ( not ( = ?auto_192957 ?auto_192960 ) ) ( not ( = ?auto_192961 ?auto_192955 ) ) ( not ( = ?auto_192961 ?auto_192956 ) ) ( not ( = ?auto_192961 ?auto_192959 ) ) ( not ( = ?auto_192961 ?auto_192960 ) ) ( not ( = ?auto_192955 ?auto_192956 ) ) ( not ( = ?auto_192955 ?auto_192959 ) ) ( not ( = ?auto_192955 ?auto_192960 ) ) ( not ( = ?auto_192956 ?auto_192959 ) ) ( not ( = ?auto_192956 ?auto_192960 ) ) ( not ( = ?auto_192959 ?auto_192960 ) ) ( not ( = ?auto_192954 ?auto_192959 ) ) ( not ( = ?auto_192954 ?auto_192957 ) ) ( not ( = ?auto_192954 ?auto_192961 ) ) ( not ( = ?auto_192954 ?auto_192955 ) ) ( not ( = ?auto_192954 ?auto_192956 ) ) ( not ( = ?auto_192958 ?auto_192959 ) ) ( not ( = ?auto_192958 ?auto_192957 ) ) ( not ( = ?auto_192958 ?auto_192961 ) ) ( not ( = ?auto_192958 ?auto_192955 ) ) ( not ( = ?auto_192958 ?auto_192956 ) ) ( not ( = ?auto_192962 ?auto_192959 ) ) ( not ( = ?auto_192962 ?auto_192957 ) ) ( not ( = ?auto_192962 ?auto_192961 ) ) ( not ( = ?auto_192962 ?auto_192955 ) ) ( not ( = ?auto_192962 ?auto_192956 ) ) ( ON ?auto_192960 ?auto_192962 ) ( ON ?auto_192959 ?auto_192960 ) ( ON ?auto_192956 ?auto_192959 ) ( ON ?auto_192955 ?auto_192956 ) ( ON ?auto_192961 ?auto_192955 ) ( CLEAR ?auto_192961 ) ( HOLDING ?auto_192957 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_192957 )
      ( MAKE-1PILE ?auto_192954 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_192963 - BLOCK
    )
    :vars
    (
      ?auto_192970 - BLOCK
      ?auto_192969 - BLOCK
      ?auto_192967 - BLOCK
      ?auto_192971 - BLOCK
      ?auto_192965 - BLOCK
      ?auto_192966 - BLOCK
      ?auto_192964 - BLOCK
      ?auto_192968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_192970 ?auto_192963 ) ( ON-TABLE ?auto_192963 ) ( not ( = ?auto_192963 ?auto_192970 ) ) ( not ( = ?auto_192963 ?auto_192969 ) ) ( not ( = ?auto_192963 ?auto_192967 ) ) ( not ( = ?auto_192970 ?auto_192969 ) ) ( not ( = ?auto_192970 ?auto_192967 ) ) ( not ( = ?auto_192969 ?auto_192967 ) ) ( ON ?auto_192969 ?auto_192970 ) ( not ( = ?auto_192971 ?auto_192965 ) ) ( not ( = ?auto_192971 ?auto_192966 ) ) ( not ( = ?auto_192971 ?auto_192964 ) ) ( not ( = ?auto_192971 ?auto_192968 ) ) ( not ( = ?auto_192971 ?auto_192967 ) ) ( not ( = ?auto_192965 ?auto_192966 ) ) ( not ( = ?auto_192965 ?auto_192964 ) ) ( not ( = ?auto_192965 ?auto_192968 ) ) ( not ( = ?auto_192965 ?auto_192967 ) ) ( not ( = ?auto_192966 ?auto_192964 ) ) ( not ( = ?auto_192966 ?auto_192968 ) ) ( not ( = ?auto_192966 ?auto_192967 ) ) ( not ( = ?auto_192964 ?auto_192968 ) ) ( not ( = ?auto_192964 ?auto_192967 ) ) ( not ( = ?auto_192968 ?auto_192967 ) ) ( not ( = ?auto_192963 ?auto_192968 ) ) ( not ( = ?auto_192963 ?auto_192971 ) ) ( not ( = ?auto_192963 ?auto_192965 ) ) ( not ( = ?auto_192963 ?auto_192966 ) ) ( not ( = ?auto_192963 ?auto_192964 ) ) ( not ( = ?auto_192970 ?auto_192968 ) ) ( not ( = ?auto_192970 ?auto_192971 ) ) ( not ( = ?auto_192970 ?auto_192965 ) ) ( not ( = ?auto_192970 ?auto_192966 ) ) ( not ( = ?auto_192970 ?auto_192964 ) ) ( not ( = ?auto_192969 ?auto_192968 ) ) ( not ( = ?auto_192969 ?auto_192971 ) ) ( not ( = ?auto_192969 ?auto_192965 ) ) ( not ( = ?auto_192969 ?auto_192966 ) ) ( not ( = ?auto_192969 ?auto_192964 ) ) ( ON ?auto_192967 ?auto_192969 ) ( ON ?auto_192968 ?auto_192967 ) ( ON ?auto_192964 ?auto_192968 ) ( ON ?auto_192966 ?auto_192964 ) ( ON ?auto_192965 ?auto_192966 ) ( ON ?auto_192971 ?auto_192965 ) ( CLEAR ?auto_192971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_192963 ?auto_192970 ?auto_192969 ?auto_192967 ?auto_192968 ?auto_192964 ?auto_192966 ?auto_192965 )
      ( MAKE-1PILE ?auto_192963 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_192980 - BLOCK
      ?auto_192981 - BLOCK
      ?auto_192982 - BLOCK
      ?auto_192983 - BLOCK
      ?auto_192984 - BLOCK
      ?auto_192985 - BLOCK
      ?auto_192986 - BLOCK
      ?auto_192987 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_192987 ) ( CLEAR ?auto_192986 ) ( ON-TABLE ?auto_192980 ) ( ON ?auto_192981 ?auto_192980 ) ( ON ?auto_192982 ?auto_192981 ) ( ON ?auto_192983 ?auto_192982 ) ( ON ?auto_192984 ?auto_192983 ) ( ON ?auto_192985 ?auto_192984 ) ( ON ?auto_192986 ?auto_192985 ) ( not ( = ?auto_192980 ?auto_192981 ) ) ( not ( = ?auto_192980 ?auto_192982 ) ) ( not ( = ?auto_192980 ?auto_192983 ) ) ( not ( = ?auto_192980 ?auto_192984 ) ) ( not ( = ?auto_192980 ?auto_192985 ) ) ( not ( = ?auto_192980 ?auto_192986 ) ) ( not ( = ?auto_192980 ?auto_192987 ) ) ( not ( = ?auto_192981 ?auto_192982 ) ) ( not ( = ?auto_192981 ?auto_192983 ) ) ( not ( = ?auto_192981 ?auto_192984 ) ) ( not ( = ?auto_192981 ?auto_192985 ) ) ( not ( = ?auto_192981 ?auto_192986 ) ) ( not ( = ?auto_192981 ?auto_192987 ) ) ( not ( = ?auto_192982 ?auto_192983 ) ) ( not ( = ?auto_192982 ?auto_192984 ) ) ( not ( = ?auto_192982 ?auto_192985 ) ) ( not ( = ?auto_192982 ?auto_192986 ) ) ( not ( = ?auto_192982 ?auto_192987 ) ) ( not ( = ?auto_192983 ?auto_192984 ) ) ( not ( = ?auto_192983 ?auto_192985 ) ) ( not ( = ?auto_192983 ?auto_192986 ) ) ( not ( = ?auto_192983 ?auto_192987 ) ) ( not ( = ?auto_192984 ?auto_192985 ) ) ( not ( = ?auto_192984 ?auto_192986 ) ) ( not ( = ?auto_192984 ?auto_192987 ) ) ( not ( = ?auto_192985 ?auto_192986 ) ) ( not ( = ?auto_192985 ?auto_192987 ) ) ( not ( = ?auto_192986 ?auto_192987 ) ) )
    :subtasks
    ( ( !STACK ?auto_192987 ?auto_192986 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_192988 - BLOCK
      ?auto_192989 - BLOCK
      ?auto_192990 - BLOCK
      ?auto_192991 - BLOCK
      ?auto_192992 - BLOCK
      ?auto_192993 - BLOCK
      ?auto_192994 - BLOCK
      ?auto_192995 - BLOCK
    )
    :vars
    (
      ?auto_192996 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_192994 ) ( ON-TABLE ?auto_192988 ) ( ON ?auto_192989 ?auto_192988 ) ( ON ?auto_192990 ?auto_192989 ) ( ON ?auto_192991 ?auto_192990 ) ( ON ?auto_192992 ?auto_192991 ) ( ON ?auto_192993 ?auto_192992 ) ( ON ?auto_192994 ?auto_192993 ) ( not ( = ?auto_192988 ?auto_192989 ) ) ( not ( = ?auto_192988 ?auto_192990 ) ) ( not ( = ?auto_192988 ?auto_192991 ) ) ( not ( = ?auto_192988 ?auto_192992 ) ) ( not ( = ?auto_192988 ?auto_192993 ) ) ( not ( = ?auto_192988 ?auto_192994 ) ) ( not ( = ?auto_192988 ?auto_192995 ) ) ( not ( = ?auto_192989 ?auto_192990 ) ) ( not ( = ?auto_192989 ?auto_192991 ) ) ( not ( = ?auto_192989 ?auto_192992 ) ) ( not ( = ?auto_192989 ?auto_192993 ) ) ( not ( = ?auto_192989 ?auto_192994 ) ) ( not ( = ?auto_192989 ?auto_192995 ) ) ( not ( = ?auto_192990 ?auto_192991 ) ) ( not ( = ?auto_192990 ?auto_192992 ) ) ( not ( = ?auto_192990 ?auto_192993 ) ) ( not ( = ?auto_192990 ?auto_192994 ) ) ( not ( = ?auto_192990 ?auto_192995 ) ) ( not ( = ?auto_192991 ?auto_192992 ) ) ( not ( = ?auto_192991 ?auto_192993 ) ) ( not ( = ?auto_192991 ?auto_192994 ) ) ( not ( = ?auto_192991 ?auto_192995 ) ) ( not ( = ?auto_192992 ?auto_192993 ) ) ( not ( = ?auto_192992 ?auto_192994 ) ) ( not ( = ?auto_192992 ?auto_192995 ) ) ( not ( = ?auto_192993 ?auto_192994 ) ) ( not ( = ?auto_192993 ?auto_192995 ) ) ( not ( = ?auto_192994 ?auto_192995 ) ) ( ON ?auto_192995 ?auto_192996 ) ( CLEAR ?auto_192995 ) ( HAND-EMPTY ) ( not ( = ?auto_192988 ?auto_192996 ) ) ( not ( = ?auto_192989 ?auto_192996 ) ) ( not ( = ?auto_192990 ?auto_192996 ) ) ( not ( = ?auto_192991 ?auto_192996 ) ) ( not ( = ?auto_192992 ?auto_192996 ) ) ( not ( = ?auto_192993 ?auto_192996 ) ) ( not ( = ?auto_192994 ?auto_192996 ) ) ( not ( = ?auto_192995 ?auto_192996 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_192995 ?auto_192996 )
      ( MAKE-8PILE ?auto_192988 ?auto_192989 ?auto_192990 ?auto_192991 ?auto_192992 ?auto_192993 ?auto_192994 ?auto_192995 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_192997 - BLOCK
      ?auto_192998 - BLOCK
      ?auto_192999 - BLOCK
      ?auto_193000 - BLOCK
      ?auto_193001 - BLOCK
      ?auto_193002 - BLOCK
      ?auto_193003 - BLOCK
      ?auto_193004 - BLOCK
    )
    :vars
    (
      ?auto_193005 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_192997 ) ( ON ?auto_192998 ?auto_192997 ) ( ON ?auto_192999 ?auto_192998 ) ( ON ?auto_193000 ?auto_192999 ) ( ON ?auto_193001 ?auto_193000 ) ( ON ?auto_193002 ?auto_193001 ) ( not ( = ?auto_192997 ?auto_192998 ) ) ( not ( = ?auto_192997 ?auto_192999 ) ) ( not ( = ?auto_192997 ?auto_193000 ) ) ( not ( = ?auto_192997 ?auto_193001 ) ) ( not ( = ?auto_192997 ?auto_193002 ) ) ( not ( = ?auto_192997 ?auto_193003 ) ) ( not ( = ?auto_192997 ?auto_193004 ) ) ( not ( = ?auto_192998 ?auto_192999 ) ) ( not ( = ?auto_192998 ?auto_193000 ) ) ( not ( = ?auto_192998 ?auto_193001 ) ) ( not ( = ?auto_192998 ?auto_193002 ) ) ( not ( = ?auto_192998 ?auto_193003 ) ) ( not ( = ?auto_192998 ?auto_193004 ) ) ( not ( = ?auto_192999 ?auto_193000 ) ) ( not ( = ?auto_192999 ?auto_193001 ) ) ( not ( = ?auto_192999 ?auto_193002 ) ) ( not ( = ?auto_192999 ?auto_193003 ) ) ( not ( = ?auto_192999 ?auto_193004 ) ) ( not ( = ?auto_193000 ?auto_193001 ) ) ( not ( = ?auto_193000 ?auto_193002 ) ) ( not ( = ?auto_193000 ?auto_193003 ) ) ( not ( = ?auto_193000 ?auto_193004 ) ) ( not ( = ?auto_193001 ?auto_193002 ) ) ( not ( = ?auto_193001 ?auto_193003 ) ) ( not ( = ?auto_193001 ?auto_193004 ) ) ( not ( = ?auto_193002 ?auto_193003 ) ) ( not ( = ?auto_193002 ?auto_193004 ) ) ( not ( = ?auto_193003 ?auto_193004 ) ) ( ON ?auto_193004 ?auto_193005 ) ( CLEAR ?auto_193004 ) ( not ( = ?auto_192997 ?auto_193005 ) ) ( not ( = ?auto_192998 ?auto_193005 ) ) ( not ( = ?auto_192999 ?auto_193005 ) ) ( not ( = ?auto_193000 ?auto_193005 ) ) ( not ( = ?auto_193001 ?auto_193005 ) ) ( not ( = ?auto_193002 ?auto_193005 ) ) ( not ( = ?auto_193003 ?auto_193005 ) ) ( not ( = ?auto_193004 ?auto_193005 ) ) ( HOLDING ?auto_193003 ) ( CLEAR ?auto_193002 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_192997 ?auto_192998 ?auto_192999 ?auto_193000 ?auto_193001 ?auto_193002 ?auto_193003 )
      ( MAKE-8PILE ?auto_192997 ?auto_192998 ?auto_192999 ?auto_193000 ?auto_193001 ?auto_193002 ?auto_193003 ?auto_193004 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_193006 - BLOCK
      ?auto_193007 - BLOCK
      ?auto_193008 - BLOCK
      ?auto_193009 - BLOCK
      ?auto_193010 - BLOCK
      ?auto_193011 - BLOCK
      ?auto_193012 - BLOCK
      ?auto_193013 - BLOCK
    )
    :vars
    (
      ?auto_193014 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193006 ) ( ON ?auto_193007 ?auto_193006 ) ( ON ?auto_193008 ?auto_193007 ) ( ON ?auto_193009 ?auto_193008 ) ( ON ?auto_193010 ?auto_193009 ) ( ON ?auto_193011 ?auto_193010 ) ( not ( = ?auto_193006 ?auto_193007 ) ) ( not ( = ?auto_193006 ?auto_193008 ) ) ( not ( = ?auto_193006 ?auto_193009 ) ) ( not ( = ?auto_193006 ?auto_193010 ) ) ( not ( = ?auto_193006 ?auto_193011 ) ) ( not ( = ?auto_193006 ?auto_193012 ) ) ( not ( = ?auto_193006 ?auto_193013 ) ) ( not ( = ?auto_193007 ?auto_193008 ) ) ( not ( = ?auto_193007 ?auto_193009 ) ) ( not ( = ?auto_193007 ?auto_193010 ) ) ( not ( = ?auto_193007 ?auto_193011 ) ) ( not ( = ?auto_193007 ?auto_193012 ) ) ( not ( = ?auto_193007 ?auto_193013 ) ) ( not ( = ?auto_193008 ?auto_193009 ) ) ( not ( = ?auto_193008 ?auto_193010 ) ) ( not ( = ?auto_193008 ?auto_193011 ) ) ( not ( = ?auto_193008 ?auto_193012 ) ) ( not ( = ?auto_193008 ?auto_193013 ) ) ( not ( = ?auto_193009 ?auto_193010 ) ) ( not ( = ?auto_193009 ?auto_193011 ) ) ( not ( = ?auto_193009 ?auto_193012 ) ) ( not ( = ?auto_193009 ?auto_193013 ) ) ( not ( = ?auto_193010 ?auto_193011 ) ) ( not ( = ?auto_193010 ?auto_193012 ) ) ( not ( = ?auto_193010 ?auto_193013 ) ) ( not ( = ?auto_193011 ?auto_193012 ) ) ( not ( = ?auto_193011 ?auto_193013 ) ) ( not ( = ?auto_193012 ?auto_193013 ) ) ( ON ?auto_193013 ?auto_193014 ) ( not ( = ?auto_193006 ?auto_193014 ) ) ( not ( = ?auto_193007 ?auto_193014 ) ) ( not ( = ?auto_193008 ?auto_193014 ) ) ( not ( = ?auto_193009 ?auto_193014 ) ) ( not ( = ?auto_193010 ?auto_193014 ) ) ( not ( = ?auto_193011 ?auto_193014 ) ) ( not ( = ?auto_193012 ?auto_193014 ) ) ( not ( = ?auto_193013 ?auto_193014 ) ) ( CLEAR ?auto_193011 ) ( ON ?auto_193012 ?auto_193013 ) ( CLEAR ?auto_193012 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193014 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193014 ?auto_193013 )
      ( MAKE-8PILE ?auto_193006 ?auto_193007 ?auto_193008 ?auto_193009 ?auto_193010 ?auto_193011 ?auto_193012 ?auto_193013 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_193015 - BLOCK
      ?auto_193016 - BLOCK
      ?auto_193017 - BLOCK
      ?auto_193018 - BLOCK
      ?auto_193019 - BLOCK
      ?auto_193020 - BLOCK
      ?auto_193021 - BLOCK
      ?auto_193022 - BLOCK
    )
    :vars
    (
      ?auto_193023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193015 ) ( ON ?auto_193016 ?auto_193015 ) ( ON ?auto_193017 ?auto_193016 ) ( ON ?auto_193018 ?auto_193017 ) ( ON ?auto_193019 ?auto_193018 ) ( not ( = ?auto_193015 ?auto_193016 ) ) ( not ( = ?auto_193015 ?auto_193017 ) ) ( not ( = ?auto_193015 ?auto_193018 ) ) ( not ( = ?auto_193015 ?auto_193019 ) ) ( not ( = ?auto_193015 ?auto_193020 ) ) ( not ( = ?auto_193015 ?auto_193021 ) ) ( not ( = ?auto_193015 ?auto_193022 ) ) ( not ( = ?auto_193016 ?auto_193017 ) ) ( not ( = ?auto_193016 ?auto_193018 ) ) ( not ( = ?auto_193016 ?auto_193019 ) ) ( not ( = ?auto_193016 ?auto_193020 ) ) ( not ( = ?auto_193016 ?auto_193021 ) ) ( not ( = ?auto_193016 ?auto_193022 ) ) ( not ( = ?auto_193017 ?auto_193018 ) ) ( not ( = ?auto_193017 ?auto_193019 ) ) ( not ( = ?auto_193017 ?auto_193020 ) ) ( not ( = ?auto_193017 ?auto_193021 ) ) ( not ( = ?auto_193017 ?auto_193022 ) ) ( not ( = ?auto_193018 ?auto_193019 ) ) ( not ( = ?auto_193018 ?auto_193020 ) ) ( not ( = ?auto_193018 ?auto_193021 ) ) ( not ( = ?auto_193018 ?auto_193022 ) ) ( not ( = ?auto_193019 ?auto_193020 ) ) ( not ( = ?auto_193019 ?auto_193021 ) ) ( not ( = ?auto_193019 ?auto_193022 ) ) ( not ( = ?auto_193020 ?auto_193021 ) ) ( not ( = ?auto_193020 ?auto_193022 ) ) ( not ( = ?auto_193021 ?auto_193022 ) ) ( ON ?auto_193022 ?auto_193023 ) ( not ( = ?auto_193015 ?auto_193023 ) ) ( not ( = ?auto_193016 ?auto_193023 ) ) ( not ( = ?auto_193017 ?auto_193023 ) ) ( not ( = ?auto_193018 ?auto_193023 ) ) ( not ( = ?auto_193019 ?auto_193023 ) ) ( not ( = ?auto_193020 ?auto_193023 ) ) ( not ( = ?auto_193021 ?auto_193023 ) ) ( not ( = ?auto_193022 ?auto_193023 ) ) ( ON ?auto_193021 ?auto_193022 ) ( CLEAR ?auto_193021 ) ( ON-TABLE ?auto_193023 ) ( HOLDING ?auto_193020 ) ( CLEAR ?auto_193019 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193015 ?auto_193016 ?auto_193017 ?auto_193018 ?auto_193019 ?auto_193020 )
      ( MAKE-8PILE ?auto_193015 ?auto_193016 ?auto_193017 ?auto_193018 ?auto_193019 ?auto_193020 ?auto_193021 ?auto_193022 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_193024 - BLOCK
      ?auto_193025 - BLOCK
      ?auto_193026 - BLOCK
      ?auto_193027 - BLOCK
      ?auto_193028 - BLOCK
      ?auto_193029 - BLOCK
      ?auto_193030 - BLOCK
      ?auto_193031 - BLOCK
    )
    :vars
    (
      ?auto_193032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193024 ) ( ON ?auto_193025 ?auto_193024 ) ( ON ?auto_193026 ?auto_193025 ) ( ON ?auto_193027 ?auto_193026 ) ( ON ?auto_193028 ?auto_193027 ) ( not ( = ?auto_193024 ?auto_193025 ) ) ( not ( = ?auto_193024 ?auto_193026 ) ) ( not ( = ?auto_193024 ?auto_193027 ) ) ( not ( = ?auto_193024 ?auto_193028 ) ) ( not ( = ?auto_193024 ?auto_193029 ) ) ( not ( = ?auto_193024 ?auto_193030 ) ) ( not ( = ?auto_193024 ?auto_193031 ) ) ( not ( = ?auto_193025 ?auto_193026 ) ) ( not ( = ?auto_193025 ?auto_193027 ) ) ( not ( = ?auto_193025 ?auto_193028 ) ) ( not ( = ?auto_193025 ?auto_193029 ) ) ( not ( = ?auto_193025 ?auto_193030 ) ) ( not ( = ?auto_193025 ?auto_193031 ) ) ( not ( = ?auto_193026 ?auto_193027 ) ) ( not ( = ?auto_193026 ?auto_193028 ) ) ( not ( = ?auto_193026 ?auto_193029 ) ) ( not ( = ?auto_193026 ?auto_193030 ) ) ( not ( = ?auto_193026 ?auto_193031 ) ) ( not ( = ?auto_193027 ?auto_193028 ) ) ( not ( = ?auto_193027 ?auto_193029 ) ) ( not ( = ?auto_193027 ?auto_193030 ) ) ( not ( = ?auto_193027 ?auto_193031 ) ) ( not ( = ?auto_193028 ?auto_193029 ) ) ( not ( = ?auto_193028 ?auto_193030 ) ) ( not ( = ?auto_193028 ?auto_193031 ) ) ( not ( = ?auto_193029 ?auto_193030 ) ) ( not ( = ?auto_193029 ?auto_193031 ) ) ( not ( = ?auto_193030 ?auto_193031 ) ) ( ON ?auto_193031 ?auto_193032 ) ( not ( = ?auto_193024 ?auto_193032 ) ) ( not ( = ?auto_193025 ?auto_193032 ) ) ( not ( = ?auto_193026 ?auto_193032 ) ) ( not ( = ?auto_193027 ?auto_193032 ) ) ( not ( = ?auto_193028 ?auto_193032 ) ) ( not ( = ?auto_193029 ?auto_193032 ) ) ( not ( = ?auto_193030 ?auto_193032 ) ) ( not ( = ?auto_193031 ?auto_193032 ) ) ( ON ?auto_193030 ?auto_193031 ) ( ON-TABLE ?auto_193032 ) ( CLEAR ?auto_193028 ) ( ON ?auto_193029 ?auto_193030 ) ( CLEAR ?auto_193029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_193032 ?auto_193031 ?auto_193030 )
      ( MAKE-8PILE ?auto_193024 ?auto_193025 ?auto_193026 ?auto_193027 ?auto_193028 ?auto_193029 ?auto_193030 ?auto_193031 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_193033 - BLOCK
      ?auto_193034 - BLOCK
      ?auto_193035 - BLOCK
      ?auto_193036 - BLOCK
      ?auto_193037 - BLOCK
      ?auto_193038 - BLOCK
      ?auto_193039 - BLOCK
      ?auto_193040 - BLOCK
    )
    :vars
    (
      ?auto_193041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193033 ) ( ON ?auto_193034 ?auto_193033 ) ( ON ?auto_193035 ?auto_193034 ) ( ON ?auto_193036 ?auto_193035 ) ( not ( = ?auto_193033 ?auto_193034 ) ) ( not ( = ?auto_193033 ?auto_193035 ) ) ( not ( = ?auto_193033 ?auto_193036 ) ) ( not ( = ?auto_193033 ?auto_193037 ) ) ( not ( = ?auto_193033 ?auto_193038 ) ) ( not ( = ?auto_193033 ?auto_193039 ) ) ( not ( = ?auto_193033 ?auto_193040 ) ) ( not ( = ?auto_193034 ?auto_193035 ) ) ( not ( = ?auto_193034 ?auto_193036 ) ) ( not ( = ?auto_193034 ?auto_193037 ) ) ( not ( = ?auto_193034 ?auto_193038 ) ) ( not ( = ?auto_193034 ?auto_193039 ) ) ( not ( = ?auto_193034 ?auto_193040 ) ) ( not ( = ?auto_193035 ?auto_193036 ) ) ( not ( = ?auto_193035 ?auto_193037 ) ) ( not ( = ?auto_193035 ?auto_193038 ) ) ( not ( = ?auto_193035 ?auto_193039 ) ) ( not ( = ?auto_193035 ?auto_193040 ) ) ( not ( = ?auto_193036 ?auto_193037 ) ) ( not ( = ?auto_193036 ?auto_193038 ) ) ( not ( = ?auto_193036 ?auto_193039 ) ) ( not ( = ?auto_193036 ?auto_193040 ) ) ( not ( = ?auto_193037 ?auto_193038 ) ) ( not ( = ?auto_193037 ?auto_193039 ) ) ( not ( = ?auto_193037 ?auto_193040 ) ) ( not ( = ?auto_193038 ?auto_193039 ) ) ( not ( = ?auto_193038 ?auto_193040 ) ) ( not ( = ?auto_193039 ?auto_193040 ) ) ( ON ?auto_193040 ?auto_193041 ) ( not ( = ?auto_193033 ?auto_193041 ) ) ( not ( = ?auto_193034 ?auto_193041 ) ) ( not ( = ?auto_193035 ?auto_193041 ) ) ( not ( = ?auto_193036 ?auto_193041 ) ) ( not ( = ?auto_193037 ?auto_193041 ) ) ( not ( = ?auto_193038 ?auto_193041 ) ) ( not ( = ?auto_193039 ?auto_193041 ) ) ( not ( = ?auto_193040 ?auto_193041 ) ) ( ON ?auto_193039 ?auto_193040 ) ( ON-TABLE ?auto_193041 ) ( ON ?auto_193038 ?auto_193039 ) ( CLEAR ?auto_193038 ) ( HOLDING ?auto_193037 ) ( CLEAR ?auto_193036 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_193033 ?auto_193034 ?auto_193035 ?auto_193036 ?auto_193037 )
      ( MAKE-8PILE ?auto_193033 ?auto_193034 ?auto_193035 ?auto_193036 ?auto_193037 ?auto_193038 ?auto_193039 ?auto_193040 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_193042 - BLOCK
      ?auto_193043 - BLOCK
      ?auto_193044 - BLOCK
      ?auto_193045 - BLOCK
      ?auto_193046 - BLOCK
      ?auto_193047 - BLOCK
      ?auto_193048 - BLOCK
      ?auto_193049 - BLOCK
    )
    :vars
    (
      ?auto_193050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193042 ) ( ON ?auto_193043 ?auto_193042 ) ( ON ?auto_193044 ?auto_193043 ) ( ON ?auto_193045 ?auto_193044 ) ( not ( = ?auto_193042 ?auto_193043 ) ) ( not ( = ?auto_193042 ?auto_193044 ) ) ( not ( = ?auto_193042 ?auto_193045 ) ) ( not ( = ?auto_193042 ?auto_193046 ) ) ( not ( = ?auto_193042 ?auto_193047 ) ) ( not ( = ?auto_193042 ?auto_193048 ) ) ( not ( = ?auto_193042 ?auto_193049 ) ) ( not ( = ?auto_193043 ?auto_193044 ) ) ( not ( = ?auto_193043 ?auto_193045 ) ) ( not ( = ?auto_193043 ?auto_193046 ) ) ( not ( = ?auto_193043 ?auto_193047 ) ) ( not ( = ?auto_193043 ?auto_193048 ) ) ( not ( = ?auto_193043 ?auto_193049 ) ) ( not ( = ?auto_193044 ?auto_193045 ) ) ( not ( = ?auto_193044 ?auto_193046 ) ) ( not ( = ?auto_193044 ?auto_193047 ) ) ( not ( = ?auto_193044 ?auto_193048 ) ) ( not ( = ?auto_193044 ?auto_193049 ) ) ( not ( = ?auto_193045 ?auto_193046 ) ) ( not ( = ?auto_193045 ?auto_193047 ) ) ( not ( = ?auto_193045 ?auto_193048 ) ) ( not ( = ?auto_193045 ?auto_193049 ) ) ( not ( = ?auto_193046 ?auto_193047 ) ) ( not ( = ?auto_193046 ?auto_193048 ) ) ( not ( = ?auto_193046 ?auto_193049 ) ) ( not ( = ?auto_193047 ?auto_193048 ) ) ( not ( = ?auto_193047 ?auto_193049 ) ) ( not ( = ?auto_193048 ?auto_193049 ) ) ( ON ?auto_193049 ?auto_193050 ) ( not ( = ?auto_193042 ?auto_193050 ) ) ( not ( = ?auto_193043 ?auto_193050 ) ) ( not ( = ?auto_193044 ?auto_193050 ) ) ( not ( = ?auto_193045 ?auto_193050 ) ) ( not ( = ?auto_193046 ?auto_193050 ) ) ( not ( = ?auto_193047 ?auto_193050 ) ) ( not ( = ?auto_193048 ?auto_193050 ) ) ( not ( = ?auto_193049 ?auto_193050 ) ) ( ON ?auto_193048 ?auto_193049 ) ( ON-TABLE ?auto_193050 ) ( ON ?auto_193047 ?auto_193048 ) ( CLEAR ?auto_193045 ) ( ON ?auto_193046 ?auto_193047 ) ( CLEAR ?auto_193046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193050 ?auto_193049 ?auto_193048 ?auto_193047 )
      ( MAKE-8PILE ?auto_193042 ?auto_193043 ?auto_193044 ?auto_193045 ?auto_193046 ?auto_193047 ?auto_193048 ?auto_193049 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_193051 - BLOCK
      ?auto_193052 - BLOCK
      ?auto_193053 - BLOCK
      ?auto_193054 - BLOCK
      ?auto_193055 - BLOCK
      ?auto_193056 - BLOCK
      ?auto_193057 - BLOCK
      ?auto_193058 - BLOCK
    )
    :vars
    (
      ?auto_193059 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193051 ) ( ON ?auto_193052 ?auto_193051 ) ( ON ?auto_193053 ?auto_193052 ) ( not ( = ?auto_193051 ?auto_193052 ) ) ( not ( = ?auto_193051 ?auto_193053 ) ) ( not ( = ?auto_193051 ?auto_193054 ) ) ( not ( = ?auto_193051 ?auto_193055 ) ) ( not ( = ?auto_193051 ?auto_193056 ) ) ( not ( = ?auto_193051 ?auto_193057 ) ) ( not ( = ?auto_193051 ?auto_193058 ) ) ( not ( = ?auto_193052 ?auto_193053 ) ) ( not ( = ?auto_193052 ?auto_193054 ) ) ( not ( = ?auto_193052 ?auto_193055 ) ) ( not ( = ?auto_193052 ?auto_193056 ) ) ( not ( = ?auto_193052 ?auto_193057 ) ) ( not ( = ?auto_193052 ?auto_193058 ) ) ( not ( = ?auto_193053 ?auto_193054 ) ) ( not ( = ?auto_193053 ?auto_193055 ) ) ( not ( = ?auto_193053 ?auto_193056 ) ) ( not ( = ?auto_193053 ?auto_193057 ) ) ( not ( = ?auto_193053 ?auto_193058 ) ) ( not ( = ?auto_193054 ?auto_193055 ) ) ( not ( = ?auto_193054 ?auto_193056 ) ) ( not ( = ?auto_193054 ?auto_193057 ) ) ( not ( = ?auto_193054 ?auto_193058 ) ) ( not ( = ?auto_193055 ?auto_193056 ) ) ( not ( = ?auto_193055 ?auto_193057 ) ) ( not ( = ?auto_193055 ?auto_193058 ) ) ( not ( = ?auto_193056 ?auto_193057 ) ) ( not ( = ?auto_193056 ?auto_193058 ) ) ( not ( = ?auto_193057 ?auto_193058 ) ) ( ON ?auto_193058 ?auto_193059 ) ( not ( = ?auto_193051 ?auto_193059 ) ) ( not ( = ?auto_193052 ?auto_193059 ) ) ( not ( = ?auto_193053 ?auto_193059 ) ) ( not ( = ?auto_193054 ?auto_193059 ) ) ( not ( = ?auto_193055 ?auto_193059 ) ) ( not ( = ?auto_193056 ?auto_193059 ) ) ( not ( = ?auto_193057 ?auto_193059 ) ) ( not ( = ?auto_193058 ?auto_193059 ) ) ( ON ?auto_193057 ?auto_193058 ) ( ON-TABLE ?auto_193059 ) ( ON ?auto_193056 ?auto_193057 ) ( ON ?auto_193055 ?auto_193056 ) ( CLEAR ?auto_193055 ) ( HOLDING ?auto_193054 ) ( CLEAR ?auto_193053 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193051 ?auto_193052 ?auto_193053 ?auto_193054 )
      ( MAKE-8PILE ?auto_193051 ?auto_193052 ?auto_193053 ?auto_193054 ?auto_193055 ?auto_193056 ?auto_193057 ?auto_193058 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_193060 - BLOCK
      ?auto_193061 - BLOCK
      ?auto_193062 - BLOCK
      ?auto_193063 - BLOCK
      ?auto_193064 - BLOCK
      ?auto_193065 - BLOCK
      ?auto_193066 - BLOCK
      ?auto_193067 - BLOCK
    )
    :vars
    (
      ?auto_193068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193060 ) ( ON ?auto_193061 ?auto_193060 ) ( ON ?auto_193062 ?auto_193061 ) ( not ( = ?auto_193060 ?auto_193061 ) ) ( not ( = ?auto_193060 ?auto_193062 ) ) ( not ( = ?auto_193060 ?auto_193063 ) ) ( not ( = ?auto_193060 ?auto_193064 ) ) ( not ( = ?auto_193060 ?auto_193065 ) ) ( not ( = ?auto_193060 ?auto_193066 ) ) ( not ( = ?auto_193060 ?auto_193067 ) ) ( not ( = ?auto_193061 ?auto_193062 ) ) ( not ( = ?auto_193061 ?auto_193063 ) ) ( not ( = ?auto_193061 ?auto_193064 ) ) ( not ( = ?auto_193061 ?auto_193065 ) ) ( not ( = ?auto_193061 ?auto_193066 ) ) ( not ( = ?auto_193061 ?auto_193067 ) ) ( not ( = ?auto_193062 ?auto_193063 ) ) ( not ( = ?auto_193062 ?auto_193064 ) ) ( not ( = ?auto_193062 ?auto_193065 ) ) ( not ( = ?auto_193062 ?auto_193066 ) ) ( not ( = ?auto_193062 ?auto_193067 ) ) ( not ( = ?auto_193063 ?auto_193064 ) ) ( not ( = ?auto_193063 ?auto_193065 ) ) ( not ( = ?auto_193063 ?auto_193066 ) ) ( not ( = ?auto_193063 ?auto_193067 ) ) ( not ( = ?auto_193064 ?auto_193065 ) ) ( not ( = ?auto_193064 ?auto_193066 ) ) ( not ( = ?auto_193064 ?auto_193067 ) ) ( not ( = ?auto_193065 ?auto_193066 ) ) ( not ( = ?auto_193065 ?auto_193067 ) ) ( not ( = ?auto_193066 ?auto_193067 ) ) ( ON ?auto_193067 ?auto_193068 ) ( not ( = ?auto_193060 ?auto_193068 ) ) ( not ( = ?auto_193061 ?auto_193068 ) ) ( not ( = ?auto_193062 ?auto_193068 ) ) ( not ( = ?auto_193063 ?auto_193068 ) ) ( not ( = ?auto_193064 ?auto_193068 ) ) ( not ( = ?auto_193065 ?auto_193068 ) ) ( not ( = ?auto_193066 ?auto_193068 ) ) ( not ( = ?auto_193067 ?auto_193068 ) ) ( ON ?auto_193066 ?auto_193067 ) ( ON-TABLE ?auto_193068 ) ( ON ?auto_193065 ?auto_193066 ) ( ON ?auto_193064 ?auto_193065 ) ( CLEAR ?auto_193062 ) ( ON ?auto_193063 ?auto_193064 ) ( CLEAR ?auto_193063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_193068 ?auto_193067 ?auto_193066 ?auto_193065 ?auto_193064 )
      ( MAKE-8PILE ?auto_193060 ?auto_193061 ?auto_193062 ?auto_193063 ?auto_193064 ?auto_193065 ?auto_193066 ?auto_193067 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_193069 - BLOCK
      ?auto_193070 - BLOCK
      ?auto_193071 - BLOCK
      ?auto_193072 - BLOCK
      ?auto_193073 - BLOCK
      ?auto_193074 - BLOCK
      ?auto_193075 - BLOCK
      ?auto_193076 - BLOCK
    )
    :vars
    (
      ?auto_193077 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193069 ) ( ON ?auto_193070 ?auto_193069 ) ( not ( = ?auto_193069 ?auto_193070 ) ) ( not ( = ?auto_193069 ?auto_193071 ) ) ( not ( = ?auto_193069 ?auto_193072 ) ) ( not ( = ?auto_193069 ?auto_193073 ) ) ( not ( = ?auto_193069 ?auto_193074 ) ) ( not ( = ?auto_193069 ?auto_193075 ) ) ( not ( = ?auto_193069 ?auto_193076 ) ) ( not ( = ?auto_193070 ?auto_193071 ) ) ( not ( = ?auto_193070 ?auto_193072 ) ) ( not ( = ?auto_193070 ?auto_193073 ) ) ( not ( = ?auto_193070 ?auto_193074 ) ) ( not ( = ?auto_193070 ?auto_193075 ) ) ( not ( = ?auto_193070 ?auto_193076 ) ) ( not ( = ?auto_193071 ?auto_193072 ) ) ( not ( = ?auto_193071 ?auto_193073 ) ) ( not ( = ?auto_193071 ?auto_193074 ) ) ( not ( = ?auto_193071 ?auto_193075 ) ) ( not ( = ?auto_193071 ?auto_193076 ) ) ( not ( = ?auto_193072 ?auto_193073 ) ) ( not ( = ?auto_193072 ?auto_193074 ) ) ( not ( = ?auto_193072 ?auto_193075 ) ) ( not ( = ?auto_193072 ?auto_193076 ) ) ( not ( = ?auto_193073 ?auto_193074 ) ) ( not ( = ?auto_193073 ?auto_193075 ) ) ( not ( = ?auto_193073 ?auto_193076 ) ) ( not ( = ?auto_193074 ?auto_193075 ) ) ( not ( = ?auto_193074 ?auto_193076 ) ) ( not ( = ?auto_193075 ?auto_193076 ) ) ( ON ?auto_193076 ?auto_193077 ) ( not ( = ?auto_193069 ?auto_193077 ) ) ( not ( = ?auto_193070 ?auto_193077 ) ) ( not ( = ?auto_193071 ?auto_193077 ) ) ( not ( = ?auto_193072 ?auto_193077 ) ) ( not ( = ?auto_193073 ?auto_193077 ) ) ( not ( = ?auto_193074 ?auto_193077 ) ) ( not ( = ?auto_193075 ?auto_193077 ) ) ( not ( = ?auto_193076 ?auto_193077 ) ) ( ON ?auto_193075 ?auto_193076 ) ( ON-TABLE ?auto_193077 ) ( ON ?auto_193074 ?auto_193075 ) ( ON ?auto_193073 ?auto_193074 ) ( ON ?auto_193072 ?auto_193073 ) ( CLEAR ?auto_193072 ) ( HOLDING ?auto_193071 ) ( CLEAR ?auto_193070 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_193069 ?auto_193070 ?auto_193071 )
      ( MAKE-8PILE ?auto_193069 ?auto_193070 ?auto_193071 ?auto_193072 ?auto_193073 ?auto_193074 ?auto_193075 ?auto_193076 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_193078 - BLOCK
      ?auto_193079 - BLOCK
      ?auto_193080 - BLOCK
      ?auto_193081 - BLOCK
      ?auto_193082 - BLOCK
      ?auto_193083 - BLOCK
      ?auto_193084 - BLOCK
      ?auto_193085 - BLOCK
    )
    :vars
    (
      ?auto_193086 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193078 ) ( ON ?auto_193079 ?auto_193078 ) ( not ( = ?auto_193078 ?auto_193079 ) ) ( not ( = ?auto_193078 ?auto_193080 ) ) ( not ( = ?auto_193078 ?auto_193081 ) ) ( not ( = ?auto_193078 ?auto_193082 ) ) ( not ( = ?auto_193078 ?auto_193083 ) ) ( not ( = ?auto_193078 ?auto_193084 ) ) ( not ( = ?auto_193078 ?auto_193085 ) ) ( not ( = ?auto_193079 ?auto_193080 ) ) ( not ( = ?auto_193079 ?auto_193081 ) ) ( not ( = ?auto_193079 ?auto_193082 ) ) ( not ( = ?auto_193079 ?auto_193083 ) ) ( not ( = ?auto_193079 ?auto_193084 ) ) ( not ( = ?auto_193079 ?auto_193085 ) ) ( not ( = ?auto_193080 ?auto_193081 ) ) ( not ( = ?auto_193080 ?auto_193082 ) ) ( not ( = ?auto_193080 ?auto_193083 ) ) ( not ( = ?auto_193080 ?auto_193084 ) ) ( not ( = ?auto_193080 ?auto_193085 ) ) ( not ( = ?auto_193081 ?auto_193082 ) ) ( not ( = ?auto_193081 ?auto_193083 ) ) ( not ( = ?auto_193081 ?auto_193084 ) ) ( not ( = ?auto_193081 ?auto_193085 ) ) ( not ( = ?auto_193082 ?auto_193083 ) ) ( not ( = ?auto_193082 ?auto_193084 ) ) ( not ( = ?auto_193082 ?auto_193085 ) ) ( not ( = ?auto_193083 ?auto_193084 ) ) ( not ( = ?auto_193083 ?auto_193085 ) ) ( not ( = ?auto_193084 ?auto_193085 ) ) ( ON ?auto_193085 ?auto_193086 ) ( not ( = ?auto_193078 ?auto_193086 ) ) ( not ( = ?auto_193079 ?auto_193086 ) ) ( not ( = ?auto_193080 ?auto_193086 ) ) ( not ( = ?auto_193081 ?auto_193086 ) ) ( not ( = ?auto_193082 ?auto_193086 ) ) ( not ( = ?auto_193083 ?auto_193086 ) ) ( not ( = ?auto_193084 ?auto_193086 ) ) ( not ( = ?auto_193085 ?auto_193086 ) ) ( ON ?auto_193084 ?auto_193085 ) ( ON-TABLE ?auto_193086 ) ( ON ?auto_193083 ?auto_193084 ) ( ON ?auto_193082 ?auto_193083 ) ( ON ?auto_193081 ?auto_193082 ) ( CLEAR ?auto_193079 ) ( ON ?auto_193080 ?auto_193081 ) ( CLEAR ?auto_193080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193086 ?auto_193085 ?auto_193084 ?auto_193083 ?auto_193082 ?auto_193081 )
      ( MAKE-8PILE ?auto_193078 ?auto_193079 ?auto_193080 ?auto_193081 ?auto_193082 ?auto_193083 ?auto_193084 ?auto_193085 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_193087 - BLOCK
      ?auto_193088 - BLOCK
      ?auto_193089 - BLOCK
      ?auto_193090 - BLOCK
      ?auto_193091 - BLOCK
      ?auto_193092 - BLOCK
      ?auto_193093 - BLOCK
      ?auto_193094 - BLOCK
    )
    :vars
    (
      ?auto_193095 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193087 ) ( not ( = ?auto_193087 ?auto_193088 ) ) ( not ( = ?auto_193087 ?auto_193089 ) ) ( not ( = ?auto_193087 ?auto_193090 ) ) ( not ( = ?auto_193087 ?auto_193091 ) ) ( not ( = ?auto_193087 ?auto_193092 ) ) ( not ( = ?auto_193087 ?auto_193093 ) ) ( not ( = ?auto_193087 ?auto_193094 ) ) ( not ( = ?auto_193088 ?auto_193089 ) ) ( not ( = ?auto_193088 ?auto_193090 ) ) ( not ( = ?auto_193088 ?auto_193091 ) ) ( not ( = ?auto_193088 ?auto_193092 ) ) ( not ( = ?auto_193088 ?auto_193093 ) ) ( not ( = ?auto_193088 ?auto_193094 ) ) ( not ( = ?auto_193089 ?auto_193090 ) ) ( not ( = ?auto_193089 ?auto_193091 ) ) ( not ( = ?auto_193089 ?auto_193092 ) ) ( not ( = ?auto_193089 ?auto_193093 ) ) ( not ( = ?auto_193089 ?auto_193094 ) ) ( not ( = ?auto_193090 ?auto_193091 ) ) ( not ( = ?auto_193090 ?auto_193092 ) ) ( not ( = ?auto_193090 ?auto_193093 ) ) ( not ( = ?auto_193090 ?auto_193094 ) ) ( not ( = ?auto_193091 ?auto_193092 ) ) ( not ( = ?auto_193091 ?auto_193093 ) ) ( not ( = ?auto_193091 ?auto_193094 ) ) ( not ( = ?auto_193092 ?auto_193093 ) ) ( not ( = ?auto_193092 ?auto_193094 ) ) ( not ( = ?auto_193093 ?auto_193094 ) ) ( ON ?auto_193094 ?auto_193095 ) ( not ( = ?auto_193087 ?auto_193095 ) ) ( not ( = ?auto_193088 ?auto_193095 ) ) ( not ( = ?auto_193089 ?auto_193095 ) ) ( not ( = ?auto_193090 ?auto_193095 ) ) ( not ( = ?auto_193091 ?auto_193095 ) ) ( not ( = ?auto_193092 ?auto_193095 ) ) ( not ( = ?auto_193093 ?auto_193095 ) ) ( not ( = ?auto_193094 ?auto_193095 ) ) ( ON ?auto_193093 ?auto_193094 ) ( ON-TABLE ?auto_193095 ) ( ON ?auto_193092 ?auto_193093 ) ( ON ?auto_193091 ?auto_193092 ) ( ON ?auto_193090 ?auto_193091 ) ( ON ?auto_193089 ?auto_193090 ) ( CLEAR ?auto_193089 ) ( HOLDING ?auto_193088 ) ( CLEAR ?auto_193087 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193087 ?auto_193088 )
      ( MAKE-8PILE ?auto_193087 ?auto_193088 ?auto_193089 ?auto_193090 ?auto_193091 ?auto_193092 ?auto_193093 ?auto_193094 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_193096 - BLOCK
      ?auto_193097 - BLOCK
      ?auto_193098 - BLOCK
      ?auto_193099 - BLOCK
      ?auto_193100 - BLOCK
      ?auto_193101 - BLOCK
      ?auto_193102 - BLOCK
      ?auto_193103 - BLOCK
    )
    :vars
    (
      ?auto_193104 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193096 ) ( not ( = ?auto_193096 ?auto_193097 ) ) ( not ( = ?auto_193096 ?auto_193098 ) ) ( not ( = ?auto_193096 ?auto_193099 ) ) ( not ( = ?auto_193096 ?auto_193100 ) ) ( not ( = ?auto_193096 ?auto_193101 ) ) ( not ( = ?auto_193096 ?auto_193102 ) ) ( not ( = ?auto_193096 ?auto_193103 ) ) ( not ( = ?auto_193097 ?auto_193098 ) ) ( not ( = ?auto_193097 ?auto_193099 ) ) ( not ( = ?auto_193097 ?auto_193100 ) ) ( not ( = ?auto_193097 ?auto_193101 ) ) ( not ( = ?auto_193097 ?auto_193102 ) ) ( not ( = ?auto_193097 ?auto_193103 ) ) ( not ( = ?auto_193098 ?auto_193099 ) ) ( not ( = ?auto_193098 ?auto_193100 ) ) ( not ( = ?auto_193098 ?auto_193101 ) ) ( not ( = ?auto_193098 ?auto_193102 ) ) ( not ( = ?auto_193098 ?auto_193103 ) ) ( not ( = ?auto_193099 ?auto_193100 ) ) ( not ( = ?auto_193099 ?auto_193101 ) ) ( not ( = ?auto_193099 ?auto_193102 ) ) ( not ( = ?auto_193099 ?auto_193103 ) ) ( not ( = ?auto_193100 ?auto_193101 ) ) ( not ( = ?auto_193100 ?auto_193102 ) ) ( not ( = ?auto_193100 ?auto_193103 ) ) ( not ( = ?auto_193101 ?auto_193102 ) ) ( not ( = ?auto_193101 ?auto_193103 ) ) ( not ( = ?auto_193102 ?auto_193103 ) ) ( ON ?auto_193103 ?auto_193104 ) ( not ( = ?auto_193096 ?auto_193104 ) ) ( not ( = ?auto_193097 ?auto_193104 ) ) ( not ( = ?auto_193098 ?auto_193104 ) ) ( not ( = ?auto_193099 ?auto_193104 ) ) ( not ( = ?auto_193100 ?auto_193104 ) ) ( not ( = ?auto_193101 ?auto_193104 ) ) ( not ( = ?auto_193102 ?auto_193104 ) ) ( not ( = ?auto_193103 ?auto_193104 ) ) ( ON ?auto_193102 ?auto_193103 ) ( ON-TABLE ?auto_193104 ) ( ON ?auto_193101 ?auto_193102 ) ( ON ?auto_193100 ?auto_193101 ) ( ON ?auto_193099 ?auto_193100 ) ( ON ?auto_193098 ?auto_193099 ) ( CLEAR ?auto_193096 ) ( ON ?auto_193097 ?auto_193098 ) ( CLEAR ?auto_193097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193104 ?auto_193103 ?auto_193102 ?auto_193101 ?auto_193100 ?auto_193099 ?auto_193098 )
      ( MAKE-8PILE ?auto_193096 ?auto_193097 ?auto_193098 ?auto_193099 ?auto_193100 ?auto_193101 ?auto_193102 ?auto_193103 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_193105 - BLOCK
      ?auto_193106 - BLOCK
      ?auto_193107 - BLOCK
      ?auto_193108 - BLOCK
      ?auto_193109 - BLOCK
      ?auto_193110 - BLOCK
      ?auto_193111 - BLOCK
      ?auto_193112 - BLOCK
    )
    :vars
    (
      ?auto_193113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193105 ?auto_193106 ) ) ( not ( = ?auto_193105 ?auto_193107 ) ) ( not ( = ?auto_193105 ?auto_193108 ) ) ( not ( = ?auto_193105 ?auto_193109 ) ) ( not ( = ?auto_193105 ?auto_193110 ) ) ( not ( = ?auto_193105 ?auto_193111 ) ) ( not ( = ?auto_193105 ?auto_193112 ) ) ( not ( = ?auto_193106 ?auto_193107 ) ) ( not ( = ?auto_193106 ?auto_193108 ) ) ( not ( = ?auto_193106 ?auto_193109 ) ) ( not ( = ?auto_193106 ?auto_193110 ) ) ( not ( = ?auto_193106 ?auto_193111 ) ) ( not ( = ?auto_193106 ?auto_193112 ) ) ( not ( = ?auto_193107 ?auto_193108 ) ) ( not ( = ?auto_193107 ?auto_193109 ) ) ( not ( = ?auto_193107 ?auto_193110 ) ) ( not ( = ?auto_193107 ?auto_193111 ) ) ( not ( = ?auto_193107 ?auto_193112 ) ) ( not ( = ?auto_193108 ?auto_193109 ) ) ( not ( = ?auto_193108 ?auto_193110 ) ) ( not ( = ?auto_193108 ?auto_193111 ) ) ( not ( = ?auto_193108 ?auto_193112 ) ) ( not ( = ?auto_193109 ?auto_193110 ) ) ( not ( = ?auto_193109 ?auto_193111 ) ) ( not ( = ?auto_193109 ?auto_193112 ) ) ( not ( = ?auto_193110 ?auto_193111 ) ) ( not ( = ?auto_193110 ?auto_193112 ) ) ( not ( = ?auto_193111 ?auto_193112 ) ) ( ON ?auto_193112 ?auto_193113 ) ( not ( = ?auto_193105 ?auto_193113 ) ) ( not ( = ?auto_193106 ?auto_193113 ) ) ( not ( = ?auto_193107 ?auto_193113 ) ) ( not ( = ?auto_193108 ?auto_193113 ) ) ( not ( = ?auto_193109 ?auto_193113 ) ) ( not ( = ?auto_193110 ?auto_193113 ) ) ( not ( = ?auto_193111 ?auto_193113 ) ) ( not ( = ?auto_193112 ?auto_193113 ) ) ( ON ?auto_193111 ?auto_193112 ) ( ON-TABLE ?auto_193113 ) ( ON ?auto_193110 ?auto_193111 ) ( ON ?auto_193109 ?auto_193110 ) ( ON ?auto_193108 ?auto_193109 ) ( ON ?auto_193107 ?auto_193108 ) ( ON ?auto_193106 ?auto_193107 ) ( CLEAR ?auto_193106 ) ( HOLDING ?auto_193105 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_193105 )
      ( MAKE-8PILE ?auto_193105 ?auto_193106 ?auto_193107 ?auto_193108 ?auto_193109 ?auto_193110 ?auto_193111 ?auto_193112 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_193114 - BLOCK
      ?auto_193115 - BLOCK
      ?auto_193116 - BLOCK
      ?auto_193117 - BLOCK
      ?auto_193118 - BLOCK
      ?auto_193119 - BLOCK
      ?auto_193120 - BLOCK
      ?auto_193121 - BLOCK
    )
    :vars
    (
      ?auto_193122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193114 ?auto_193115 ) ) ( not ( = ?auto_193114 ?auto_193116 ) ) ( not ( = ?auto_193114 ?auto_193117 ) ) ( not ( = ?auto_193114 ?auto_193118 ) ) ( not ( = ?auto_193114 ?auto_193119 ) ) ( not ( = ?auto_193114 ?auto_193120 ) ) ( not ( = ?auto_193114 ?auto_193121 ) ) ( not ( = ?auto_193115 ?auto_193116 ) ) ( not ( = ?auto_193115 ?auto_193117 ) ) ( not ( = ?auto_193115 ?auto_193118 ) ) ( not ( = ?auto_193115 ?auto_193119 ) ) ( not ( = ?auto_193115 ?auto_193120 ) ) ( not ( = ?auto_193115 ?auto_193121 ) ) ( not ( = ?auto_193116 ?auto_193117 ) ) ( not ( = ?auto_193116 ?auto_193118 ) ) ( not ( = ?auto_193116 ?auto_193119 ) ) ( not ( = ?auto_193116 ?auto_193120 ) ) ( not ( = ?auto_193116 ?auto_193121 ) ) ( not ( = ?auto_193117 ?auto_193118 ) ) ( not ( = ?auto_193117 ?auto_193119 ) ) ( not ( = ?auto_193117 ?auto_193120 ) ) ( not ( = ?auto_193117 ?auto_193121 ) ) ( not ( = ?auto_193118 ?auto_193119 ) ) ( not ( = ?auto_193118 ?auto_193120 ) ) ( not ( = ?auto_193118 ?auto_193121 ) ) ( not ( = ?auto_193119 ?auto_193120 ) ) ( not ( = ?auto_193119 ?auto_193121 ) ) ( not ( = ?auto_193120 ?auto_193121 ) ) ( ON ?auto_193121 ?auto_193122 ) ( not ( = ?auto_193114 ?auto_193122 ) ) ( not ( = ?auto_193115 ?auto_193122 ) ) ( not ( = ?auto_193116 ?auto_193122 ) ) ( not ( = ?auto_193117 ?auto_193122 ) ) ( not ( = ?auto_193118 ?auto_193122 ) ) ( not ( = ?auto_193119 ?auto_193122 ) ) ( not ( = ?auto_193120 ?auto_193122 ) ) ( not ( = ?auto_193121 ?auto_193122 ) ) ( ON ?auto_193120 ?auto_193121 ) ( ON-TABLE ?auto_193122 ) ( ON ?auto_193119 ?auto_193120 ) ( ON ?auto_193118 ?auto_193119 ) ( ON ?auto_193117 ?auto_193118 ) ( ON ?auto_193116 ?auto_193117 ) ( ON ?auto_193115 ?auto_193116 ) ( ON ?auto_193114 ?auto_193115 ) ( CLEAR ?auto_193114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193122 ?auto_193121 ?auto_193120 ?auto_193119 ?auto_193118 ?auto_193117 ?auto_193116 ?auto_193115 )
      ( MAKE-8PILE ?auto_193114 ?auto_193115 ?auto_193116 ?auto_193117 ?auto_193118 ?auto_193119 ?auto_193120 ?auto_193121 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193130 - BLOCK
      ?auto_193131 - BLOCK
      ?auto_193132 - BLOCK
      ?auto_193133 - BLOCK
      ?auto_193134 - BLOCK
      ?auto_193135 - BLOCK
      ?auto_193136 - BLOCK
    )
    :vars
    (
      ?auto_193137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193137 ?auto_193136 ) ( CLEAR ?auto_193137 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193130 ) ( ON ?auto_193131 ?auto_193130 ) ( ON ?auto_193132 ?auto_193131 ) ( ON ?auto_193133 ?auto_193132 ) ( ON ?auto_193134 ?auto_193133 ) ( ON ?auto_193135 ?auto_193134 ) ( ON ?auto_193136 ?auto_193135 ) ( not ( = ?auto_193130 ?auto_193131 ) ) ( not ( = ?auto_193130 ?auto_193132 ) ) ( not ( = ?auto_193130 ?auto_193133 ) ) ( not ( = ?auto_193130 ?auto_193134 ) ) ( not ( = ?auto_193130 ?auto_193135 ) ) ( not ( = ?auto_193130 ?auto_193136 ) ) ( not ( = ?auto_193130 ?auto_193137 ) ) ( not ( = ?auto_193131 ?auto_193132 ) ) ( not ( = ?auto_193131 ?auto_193133 ) ) ( not ( = ?auto_193131 ?auto_193134 ) ) ( not ( = ?auto_193131 ?auto_193135 ) ) ( not ( = ?auto_193131 ?auto_193136 ) ) ( not ( = ?auto_193131 ?auto_193137 ) ) ( not ( = ?auto_193132 ?auto_193133 ) ) ( not ( = ?auto_193132 ?auto_193134 ) ) ( not ( = ?auto_193132 ?auto_193135 ) ) ( not ( = ?auto_193132 ?auto_193136 ) ) ( not ( = ?auto_193132 ?auto_193137 ) ) ( not ( = ?auto_193133 ?auto_193134 ) ) ( not ( = ?auto_193133 ?auto_193135 ) ) ( not ( = ?auto_193133 ?auto_193136 ) ) ( not ( = ?auto_193133 ?auto_193137 ) ) ( not ( = ?auto_193134 ?auto_193135 ) ) ( not ( = ?auto_193134 ?auto_193136 ) ) ( not ( = ?auto_193134 ?auto_193137 ) ) ( not ( = ?auto_193135 ?auto_193136 ) ) ( not ( = ?auto_193135 ?auto_193137 ) ) ( not ( = ?auto_193136 ?auto_193137 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_193137 ?auto_193136 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193155 - BLOCK
      ?auto_193156 - BLOCK
      ?auto_193157 - BLOCK
      ?auto_193158 - BLOCK
      ?auto_193159 - BLOCK
      ?auto_193160 - BLOCK
      ?auto_193161 - BLOCK
    )
    :vars
    (
      ?auto_193162 - BLOCK
      ?auto_193163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193155 ) ( ON ?auto_193156 ?auto_193155 ) ( ON ?auto_193157 ?auto_193156 ) ( ON ?auto_193158 ?auto_193157 ) ( ON ?auto_193159 ?auto_193158 ) ( ON ?auto_193160 ?auto_193159 ) ( not ( = ?auto_193155 ?auto_193156 ) ) ( not ( = ?auto_193155 ?auto_193157 ) ) ( not ( = ?auto_193155 ?auto_193158 ) ) ( not ( = ?auto_193155 ?auto_193159 ) ) ( not ( = ?auto_193155 ?auto_193160 ) ) ( not ( = ?auto_193155 ?auto_193161 ) ) ( not ( = ?auto_193155 ?auto_193162 ) ) ( not ( = ?auto_193156 ?auto_193157 ) ) ( not ( = ?auto_193156 ?auto_193158 ) ) ( not ( = ?auto_193156 ?auto_193159 ) ) ( not ( = ?auto_193156 ?auto_193160 ) ) ( not ( = ?auto_193156 ?auto_193161 ) ) ( not ( = ?auto_193156 ?auto_193162 ) ) ( not ( = ?auto_193157 ?auto_193158 ) ) ( not ( = ?auto_193157 ?auto_193159 ) ) ( not ( = ?auto_193157 ?auto_193160 ) ) ( not ( = ?auto_193157 ?auto_193161 ) ) ( not ( = ?auto_193157 ?auto_193162 ) ) ( not ( = ?auto_193158 ?auto_193159 ) ) ( not ( = ?auto_193158 ?auto_193160 ) ) ( not ( = ?auto_193158 ?auto_193161 ) ) ( not ( = ?auto_193158 ?auto_193162 ) ) ( not ( = ?auto_193159 ?auto_193160 ) ) ( not ( = ?auto_193159 ?auto_193161 ) ) ( not ( = ?auto_193159 ?auto_193162 ) ) ( not ( = ?auto_193160 ?auto_193161 ) ) ( not ( = ?auto_193160 ?auto_193162 ) ) ( not ( = ?auto_193161 ?auto_193162 ) ) ( ON ?auto_193162 ?auto_193163 ) ( CLEAR ?auto_193162 ) ( not ( = ?auto_193155 ?auto_193163 ) ) ( not ( = ?auto_193156 ?auto_193163 ) ) ( not ( = ?auto_193157 ?auto_193163 ) ) ( not ( = ?auto_193158 ?auto_193163 ) ) ( not ( = ?auto_193159 ?auto_193163 ) ) ( not ( = ?auto_193160 ?auto_193163 ) ) ( not ( = ?auto_193161 ?auto_193163 ) ) ( not ( = ?auto_193162 ?auto_193163 ) ) ( HOLDING ?auto_193161 ) ( CLEAR ?auto_193160 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193155 ?auto_193156 ?auto_193157 ?auto_193158 ?auto_193159 ?auto_193160 ?auto_193161 ?auto_193162 )
      ( MAKE-7PILE ?auto_193155 ?auto_193156 ?auto_193157 ?auto_193158 ?auto_193159 ?auto_193160 ?auto_193161 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193164 - BLOCK
      ?auto_193165 - BLOCK
      ?auto_193166 - BLOCK
      ?auto_193167 - BLOCK
      ?auto_193168 - BLOCK
      ?auto_193169 - BLOCK
      ?auto_193170 - BLOCK
    )
    :vars
    (
      ?auto_193171 - BLOCK
      ?auto_193172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193164 ) ( ON ?auto_193165 ?auto_193164 ) ( ON ?auto_193166 ?auto_193165 ) ( ON ?auto_193167 ?auto_193166 ) ( ON ?auto_193168 ?auto_193167 ) ( ON ?auto_193169 ?auto_193168 ) ( not ( = ?auto_193164 ?auto_193165 ) ) ( not ( = ?auto_193164 ?auto_193166 ) ) ( not ( = ?auto_193164 ?auto_193167 ) ) ( not ( = ?auto_193164 ?auto_193168 ) ) ( not ( = ?auto_193164 ?auto_193169 ) ) ( not ( = ?auto_193164 ?auto_193170 ) ) ( not ( = ?auto_193164 ?auto_193171 ) ) ( not ( = ?auto_193165 ?auto_193166 ) ) ( not ( = ?auto_193165 ?auto_193167 ) ) ( not ( = ?auto_193165 ?auto_193168 ) ) ( not ( = ?auto_193165 ?auto_193169 ) ) ( not ( = ?auto_193165 ?auto_193170 ) ) ( not ( = ?auto_193165 ?auto_193171 ) ) ( not ( = ?auto_193166 ?auto_193167 ) ) ( not ( = ?auto_193166 ?auto_193168 ) ) ( not ( = ?auto_193166 ?auto_193169 ) ) ( not ( = ?auto_193166 ?auto_193170 ) ) ( not ( = ?auto_193166 ?auto_193171 ) ) ( not ( = ?auto_193167 ?auto_193168 ) ) ( not ( = ?auto_193167 ?auto_193169 ) ) ( not ( = ?auto_193167 ?auto_193170 ) ) ( not ( = ?auto_193167 ?auto_193171 ) ) ( not ( = ?auto_193168 ?auto_193169 ) ) ( not ( = ?auto_193168 ?auto_193170 ) ) ( not ( = ?auto_193168 ?auto_193171 ) ) ( not ( = ?auto_193169 ?auto_193170 ) ) ( not ( = ?auto_193169 ?auto_193171 ) ) ( not ( = ?auto_193170 ?auto_193171 ) ) ( ON ?auto_193171 ?auto_193172 ) ( not ( = ?auto_193164 ?auto_193172 ) ) ( not ( = ?auto_193165 ?auto_193172 ) ) ( not ( = ?auto_193166 ?auto_193172 ) ) ( not ( = ?auto_193167 ?auto_193172 ) ) ( not ( = ?auto_193168 ?auto_193172 ) ) ( not ( = ?auto_193169 ?auto_193172 ) ) ( not ( = ?auto_193170 ?auto_193172 ) ) ( not ( = ?auto_193171 ?auto_193172 ) ) ( CLEAR ?auto_193169 ) ( ON ?auto_193170 ?auto_193171 ) ( CLEAR ?auto_193170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193172 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193172 ?auto_193171 )
      ( MAKE-7PILE ?auto_193164 ?auto_193165 ?auto_193166 ?auto_193167 ?auto_193168 ?auto_193169 ?auto_193170 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193173 - BLOCK
      ?auto_193174 - BLOCK
      ?auto_193175 - BLOCK
      ?auto_193176 - BLOCK
      ?auto_193177 - BLOCK
      ?auto_193178 - BLOCK
      ?auto_193179 - BLOCK
    )
    :vars
    (
      ?auto_193180 - BLOCK
      ?auto_193181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193173 ) ( ON ?auto_193174 ?auto_193173 ) ( ON ?auto_193175 ?auto_193174 ) ( ON ?auto_193176 ?auto_193175 ) ( ON ?auto_193177 ?auto_193176 ) ( not ( = ?auto_193173 ?auto_193174 ) ) ( not ( = ?auto_193173 ?auto_193175 ) ) ( not ( = ?auto_193173 ?auto_193176 ) ) ( not ( = ?auto_193173 ?auto_193177 ) ) ( not ( = ?auto_193173 ?auto_193178 ) ) ( not ( = ?auto_193173 ?auto_193179 ) ) ( not ( = ?auto_193173 ?auto_193180 ) ) ( not ( = ?auto_193174 ?auto_193175 ) ) ( not ( = ?auto_193174 ?auto_193176 ) ) ( not ( = ?auto_193174 ?auto_193177 ) ) ( not ( = ?auto_193174 ?auto_193178 ) ) ( not ( = ?auto_193174 ?auto_193179 ) ) ( not ( = ?auto_193174 ?auto_193180 ) ) ( not ( = ?auto_193175 ?auto_193176 ) ) ( not ( = ?auto_193175 ?auto_193177 ) ) ( not ( = ?auto_193175 ?auto_193178 ) ) ( not ( = ?auto_193175 ?auto_193179 ) ) ( not ( = ?auto_193175 ?auto_193180 ) ) ( not ( = ?auto_193176 ?auto_193177 ) ) ( not ( = ?auto_193176 ?auto_193178 ) ) ( not ( = ?auto_193176 ?auto_193179 ) ) ( not ( = ?auto_193176 ?auto_193180 ) ) ( not ( = ?auto_193177 ?auto_193178 ) ) ( not ( = ?auto_193177 ?auto_193179 ) ) ( not ( = ?auto_193177 ?auto_193180 ) ) ( not ( = ?auto_193178 ?auto_193179 ) ) ( not ( = ?auto_193178 ?auto_193180 ) ) ( not ( = ?auto_193179 ?auto_193180 ) ) ( ON ?auto_193180 ?auto_193181 ) ( not ( = ?auto_193173 ?auto_193181 ) ) ( not ( = ?auto_193174 ?auto_193181 ) ) ( not ( = ?auto_193175 ?auto_193181 ) ) ( not ( = ?auto_193176 ?auto_193181 ) ) ( not ( = ?auto_193177 ?auto_193181 ) ) ( not ( = ?auto_193178 ?auto_193181 ) ) ( not ( = ?auto_193179 ?auto_193181 ) ) ( not ( = ?auto_193180 ?auto_193181 ) ) ( ON ?auto_193179 ?auto_193180 ) ( CLEAR ?auto_193179 ) ( ON-TABLE ?auto_193181 ) ( HOLDING ?auto_193178 ) ( CLEAR ?auto_193177 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193173 ?auto_193174 ?auto_193175 ?auto_193176 ?auto_193177 ?auto_193178 )
      ( MAKE-7PILE ?auto_193173 ?auto_193174 ?auto_193175 ?auto_193176 ?auto_193177 ?auto_193178 ?auto_193179 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193182 - BLOCK
      ?auto_193183 - BLOCK
      ?auto_193184 - BLOCK
      ?auto_193185 - BLOCK
      ?auto_193186 - BLOCK
      ?auto_193187 - BLOCK
      ?auto_193188 - BLOCK
    )
    :vars
    (
      ?auto_193189 - BLOCK
      ?auto_193190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193182 ) ( ON ?auto_193183 ?auto_193182 ) ( ON ?auto_193184 ?auto_193183 ) ( ON ?auto_193185 ?auto_193184 ) ( ON ?auto_193186 ?auto_193185 ) ( not ( = ?auto_193182 ?auto_193183 ) ) ( not ( = ?auto_193182 ?auto_193184 ) ) ( not ( = ?auto_193182 ?auto_193185 ) ) ( not ( = ?auto_193182 ?auto_193186 ) ) ( not ( = ?auto_193182 ?auto_193187 ) ) ( not ( = ?auto_193182 ?auto_193188 ) ) ( not ( = ?auto_193182 ?auto_193189 ) ) ( not ( = ?auto_193183 ?auto_193184 ) ) ( not ( = ?auto_193183 ?auto_193185 ) ) ( not ( = ?auto_193183 ?auto_193186 ) ) ( not ( = ?auto_193183 ?auto_193187 ) ) ( not ( = ?auto_193183 ?auto_193188 ) ) ( not ( = ?auto_193183 ?auto_193189 ) ) ( not ( = ?auto_193184 ?auto_193185 ) ) ( not ( = ?auto_193184 ?auto_193186 ) ) ( not ( = ?auto_193184 ?auto_193187 ) ) ( not ( = ?auto_193184 ?auto_193188 ) ) ( not ( = ?auto_193184 ?auto_193189 ) ) ( not ( = ?auto_193185 ?auto_193186 ) ) ( not ( = ?auto_193185 ?auto_193187 ) ) ( not ( = ?auto_193185 ?auto_193188 ) ) ( not ( = ?auto_193185 ?auto_193189 ) ) ( not ( = ?auto_193186 ?auto_193187 ) ) ( not ( = ?auto_193186 ?auto_193188 ) ) ( not ( = ?auto_193186 ?auto_193189 ) ) ( not ( = ?auto_193187 ?auto_193188 ) ) ( not ( = ?auto_193187 ?auto_193189 ) ) ( not ( = ?auto_193188 ?auto_193189 ) ) ( ON ?auto_193189 ?auto_193190 ) ( not ( = ?auto_193182 ?auto_193190 ) ) ( not ( = ?auto_193183 ?auto_193190 ) ) ( not ( = ?auto_193184 ?auto_193190 ) ) ( not ( = ?auto_193185 ?auto_193190 ) ) ( not ( = ?auto_193186 ?auto_193190 ) ) ( not ( = ?auto_193187 ?auto_193190 ) ) ( not ( = ?auto_193188 ?auto_193190 ) ) ( not ( = ?auto_193189 ?auto_193190 ) ) ( ON ?auto_193188 ?auto_193189 ) ( ON-TABLE ?auto_193190 ) ( CLEAR ?auto_193186 ) ( ON ?auto_193187 ?auto_193188 ) ( CLEAR ?auto_193187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_193190 ?auto_193189 ?auto_193188 )
      ( MAKE-7PILE ?auto_193182 ?auto_193183 ?auto_193184 ?auto_193185 ?auto_193186 ?auto_193187 ?auto_193188 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193191 - BLOCK
      ?auto_193192 - BLOCK
      ?auto_193193 - BLOCK
      ?auto_193194 - BLOCK
      ?auto_193195 - BLOCK
      ?auto_193196 - BLOCK
      ?auto_193197 - BLOCK
    )
    :vars
    (
      ?auto_193198 - BLOCK
      ?auto_193199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193191 ) ( ON ?auto_193192 ?auto_193191 ) ( ON ?auto_193193 ?auto_193192 ) ( ON ?auto_193194 ?auto_193193 ) ( not ( = ?auto_193191 ?auto_193192 ) ) ( not ( = ?auto_193191 ?auto_193193 ) ) ( not ( = ?auto_193191 ?auto_193194 ) ) ( not ( = ?auto_193191 ?auto_193195 ) ) ( not ( = ?auto_193191 ?auto_193196 ) ) ( not ( = ?auto_193191 ?auto_193197 ) ) ( not ( = ?auto_193191 ?auto_193198 ) ) ( not ( = ?auto_193192 ?auto_193193 ) ) ( not ( = ?auto_193192 ?auto_193194 ) ) ( not ( = ?auto_193192 ?auto_193195 ) ) ( not ( = ?auto_193192 ?auto_193196 ) ) ( not ( = ?auto_193192 ?auto_193197 ) ) ( not ( = ?auto_193192 ?auto_193198 ) ) ( not ( = ?auto_193193 ?auto_193194 ) ) ( not ( = ?auto_193193 ?auto_193195 ) ) ( not ( = ?auto_193193 ?auto_193196 ) ) ( not ( = ?auto_193193 ?auto_193197 ) ) ( not ( = ?auto_193193 ?auto_193198 ) ) ( not ( = ?auto_193194 ?auto_193195 ) ) ( not ( = ?auto_193194 ?auto_193196 ) ) ( not ( = ?auto_193194 ?auto_193197 ) ) ( not ( = ?auto_193194 ?auto_193198 ) ) ( not ( = ?auto_193195 ?auto_193196 ) ) ( not ( = ?auto_193195 ?auto_193197 ) ) ( not ( = ?auto_193195 ?auto_193198 ) ) ( not ( = ?auto_193196 ?auto_193197 ) ) ( not ( = ?auto_193196 ?auto_193198 ) ) ( not ( = ?auto_193197 ?auto_193198 ) ) ( ON ?auto_193198 ?auto_193199 ) ( not ( = ?auto_193191 ?auto_193199 ) ) ( not ( = ?auto_193192 ?auto_193199 ) ) ( not ( = ?auto_193193 ?auto_193199 ) ) ( not ( = ?auto_193194 ?auto_193199 ) ) ( not ( = ?auto_193195 ?auto_193199 ) ) ( not ( = ?auto_193196 ?auto_193199 ) ) ( not ( = ?auto_193197 ?auto_193199 ) ) ( not ( = ?auto_193198 ?auto_193199 ) ) ( ON ?auto_193197 ?auto_193198 ) ( ON-TABLE ?auto_193199 ) ( ON ?auto_193196 ?auto_193197 ) ( CLEAR ?auto_193196 ) ( HOLDING ?auto_193195 ) ( CLEAR ?auto_193194 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_193191 ?auto_193192 ?auto_193193 ?auto_193194 ?auto_193195 )
      ( MAKE-7PILE ?auto_193191 ?auto_193192 ?auto_193193 ?auto_193194 ?auto_193195 ?auto_193196 ?auto_193197 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193200 - BLOCK
      ?auto_193201 - BLOCK
      ?auto_193202 - BLOCK
      ?auto_193203 - BLOCK
      ?auto_193204 - BLOCK
      ?auto_193205 - BLOCK
      ?auto_193206 - BLOCK
    )
    :vars
    (
      ?auto_193208 - BLOCK
      ?auto_193207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193200 ) ( ON ?auto_193201 ?auto_193200 ) ( ON ?auto_193202 ?auto_193201 ) ( ON ?auto_193203 ?auto_193202 ) ( not ( = ?auto_193200 ?auto_193201 ) ) ( not ( = ?auto_193200 ?auto_193202 ) ) ( not ( = ?auto_193200 ?auto_193203 ) ) ( not ( = ?auto_193200 ?auto_193204 ) ) ( not ( = ?auto_193200 ?auto_193205 ) ) ( not ( = ?auto_193200 ?auto_193206 ) ) ( not ( = ?auto_193200 ?auto_193208 ) ) ( not ( = ?auto_193201 ?auto_193202 ) ) ( not ( = ?auto_193201 ?auto_193203 ) ) ( not ( = ?auto_193201 ?auto_193204 ) ) ( not ( = ?auto_193201 ?auto_193205 ) ) ( not ( = ?auto_193201 ?auto_193206 ) ) ( not ( = ?auto_193201 ?auto_193208 ) ) ( not ( = ?auto_193202 ?auto_193203 ) ) ( not ( = ?auto_193202 ?auto_193204 ) ) ( not ( = ?auto_193202 ?auto_193205 ) ) ( not ( = ?auto_193202 ?auto_193206 ) ) ( not ( = ?auto_193202 ?auto_193208 ) ) ( not ( = ?auto_193203 ?auto_193204 ) ) ( not ( = ?auto_193203 ?auto_193205 ) ) ( not ( = ?auto_193203 ?auto_193206 ) ) ( not ( = ?auto_193203 ?auto_193208 ) ) ( not ( = ?auto_193204 ?auto_193205 ) ) ( not ( = ?auto_193204 ?auto_193206 ) ) ( not ( = ?auto_193204 ?auto_193208 ) ) ( not ( = ?auto_193205 ?auto_193206 ) ) ( not ( = ?auto_193205 ?auto_193208 ) ) ( not ( = ?auto_193206 ?auto_193208 ) ) ( ON ?auto_193208 ?auto_193207 ) ( not ( = ?auto_193200 ?auto_193207 ) ) ( not ( = ?auto_193201 ?auto_193207 ) ) ( not ( = ?auto_193202 ?auto_193207 ) ) ( not ( = ?auto_193203 ?auto_193207 ) ) ( not ( = ?auto_193204 ?auto_193207 ) ) ( not ( = ?auto_193205 ?auto_193207 ) ) ( not ( = ?auto_193206 ?auto_193207 ) ) ( not ( = ?auto_193208 ?auto_193207 ) ) ( ON ?auto_193206 ?auto_193208 ) ( ON-TABLE ?auto_193207 ) ( ON ?auto_193205 ?auto_193206 ) ( CLEAR ?auto_193203 ) ( ON ?auto_193204 ?auto_193205 ) ( CLEAR ?auto_193204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193207 ?auto_193208 ?auto_193206 ?auto_193205 )
      ( MAKE-7PILE ?auto_193200 ?auto_193201 ?auto_193202 ?auto_193203 ?auto_193204 ?auto_193205 ?auto_193206 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193209 - BLOCK
      ?auto_193210 - BLOCK
      ?auto_193211 - BLOCK
      ?auto_193212 - BLOCK
      ?auto_193213 - BLOCK
      ?auto_193214 - BLOCK
      ?auto_193215 - BLOCK
    )
    :vars
    (
      ?auto_193216 - BLOCK
      ?auto_193217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193209 ) ( ON ?auto_193210 ?auto_193209 ) ( ON ?auto_193211 ?auto_193210 ) ( not ( = ?auto_193209 ?auto_193210 ) ) ( not ( = ?auto_193209 ?auto_193211 ) ) ( not ( = ?auto_193209 ?auto_193212 ) ) ( not ( = ?auto_193209 ?auto_193213 ) ) ( not ( = ?auto_193209 ?auto_193214 ) ) ( not ( = ?auto_193209 ?auto_193215 ) ) ( not ( = ?auto_193209 ?auto_193216 ) ) ( not ( = ?auto_193210 ?auto_193211 ) ) ( not ( = ?auto_193210 ?auto_193212 ) ) ( not ( = ?auto_193210 ?auto_193213 ) ) ( not ( = ?auto_193210 ?auto_193214 ) ) ( not ( = ?auto_193210 ?auto_193215 ) ) ( not ( = ?auto_193210 ?auto_193216 ) ) ( not ( = ?auto_193211 ?auto_193212 ) ) ( not ( = ?auto_193211 ?auto_193213 ) ) ( not ( = ?auto_193211 ?auto_193214 ) ) ( not ( = ?auto_193211 ?auto_193215 ) ) ( not ( = ?auto_193211 ?auto_193216 ) ) ( not ( = ?auto_193212 ?auto_193213 ) ) ( not ( = ?auto_193212 ?auto_193214 ) ) ( not ( = ?auto_193212 ?auto_193215 ) ) ( not ( = ?auto_193212 ?auto_193216 ) ) ( not ( = ?auto_193213 ?auto_193214 ) ) ( not ( = ?auto_193213 ?auto_193215 ) ) ( not ( = ?auto_193213 ?auto_193216 ) ) ( not ( = ?auto_193214 ?auto_193215 ) ) ( not ( = ?auto_193214 ?auto_193216 ) ) ( not ( = ?auto_193215 ?auto_193216 ) ) ( ON ?auto_193216 ?auto_193217 ) ( not ( = ?auto_193209 ?auto_193217 ) ) ( not ( = ?auto_193210 ?auto_193217 ) ) ( not ( = ?auto_193211 ?auto_193217 ) ) ( not ( = ?auto_193212 ?auto_193217 ) ) ( not ( = ?auto_193213 ?auto_193217 ) ) ( not ( = ?auto_193214 ?auto_193217 ) ) ( not ( = ?auto_193215 ?auto_193217 ) ) ( not ( = ?auto_193216 ?auto_193217 ) ) ( ON ?auto_193215 ?auto_193216 ) ( ON-TABLE ?auto_193217 ) ( ON ?auto_193214 ?auto_193215 ) ( ON ?auto_193213 ?auto_193214 ) ( CLEAR ?auto_193213 ) ( HOLDING ?auto_193212 ) ( CLEAR ?auto_193211 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193209 ?auto_193210 ?auto_193211 ?auto_193212 )
      ( MAKE-7PILE ?auto_193209 ?auto_193210 ?auto_193211 ?auto_193212 ?auto_193213 ?auto_193214 ?auto_193215 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193218 - BLOCK
      ?auto_193219 - BLOCK
      ?auto_193220 - BLOCK
      ?auto_193221 - BLOCK
      ?auto_193222 - BLOCK
      ?auto_193223 - BLOCK
      ?auto_193224 - BLOCK
    )
    :vars
    (
      ?auto_193226 - BLOCK
      ?auto_193225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193218 ) ( ON ?auto_193219 ?auto_193218 ) ( ON ?auto_193220 ?auto_193219 ) ( not ( = ?auto_193218 ?auto_193219 ) ) ( not ( = ?auto_193218 ?auto_193220 ) ) ( not ( = ?auto_193218 ?auto_193221 ) ) ( not ( = ?auto_193218 ?auto_193222 ) ) ( not ( = ?auto_193218 ?auto_193223 ) ) ( not ( = ?auto_193218 ?auto_193224 ) ) ( not ( = ?auto_193218 ?auto_193226 ) ) ( not ( = ?auto_193219 ?auto_193220 ) ) ( not ( = ?auto_193219 ?auto_193221 ) ) ( not ( = ?auto_193219 ?auto_193222 ) ) ( not ( = ?auto_193219 ?auto_193223 ) ) ( not ( = ?auto_193219 ?auto_193224 ) ) ( not ( = ?auto_193219 ?auto_193226 ) ) ( not ( = ?auto_193220 ?auto_193221 ) ) ( not ( = ?auto_193220 ?auto_193222 ) ) ( not ( = ?auto_193220 ?auto_193223 ) ) ( not ( = ?auto_193220 ?auto_193224 ) ) ( not ( = ?auto_193220 ?auto_193226 ) ) ( not ( = ?auto_193221 ?auto_193222 ) ) ( not ( = ?auto_193221 ?auto_193223 ) ) ( not ( = ?auto_193221 ?auto_193224 ) ) ( not ( = ?auto_193221 ?auto_193226 ) ) ( not ( = ?auto_193222 ?auto_193223 ) ) ( not ( = ?auto_193222 ?auto_193224 ) ) ( not ( = ?auto_193222 ?auto_193226 ) ) ( not ( = ?auto_193223 ?auto_193224 ) ) ( not ( = ?auto_193223 ?auto_193226 ) ) ( not ( = ?auto_193224 ?auto_193226 ) ) ( ON ?auto_193226 ?auto_193225 ) ( not ( = ?auto_193218 ?auto_193225 ) ) ( not ( = ?auto_193219 ?auto_193225 ) ) ( not ( = ?auto_193220 ?auto_193225 ) ) ( not ( = ?auto_193221 ?auto_193225 ) ) ( not ( = ?auto_193222 ?auto_193225 ) ) ( not ( = ?auto_193223 ?auto_193225 ) ) ( not ( = ?auto_193224 ?auto_193225 ) ) ( not ( = ?auto_193226 ?auto_193225 ) ) ( ON ?auto_193224 ?auto_193226 ) ( ON-TABLE ?auto_193225 ) ( ON ?auto_193223 ?auto_193224 ) ( ON ?auto_193222 ?auto_193223 ) ( CLEAR ?auto_193220 ) ( ON ?auto_193221 ?auto_193222 ) ( CLEAR ?auto_193221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_193225 ?auto_193226 ?auto_193224 ?auto_193223 ?auto_193222 )
      ( MAKE-7PILE ?auto_193218 ?auto_193219 ?auto_193220 ?auto_193221 ?auto_193222 ?auto_193223 ?auto_193224 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193227 - BLOCK
      ?auto_193228 - BLOCK
      ?auto_193229 - BLOCK
      ?auto_193230 - BLOCK
      ?auto_193231 - BLOCK
      ?auto_193232 - BLOCK
      ?auto_193233 - BLOCK
    )
    :vars
    (
      ?auto_193235 - BLOCK
      ?auto_193234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193227 ) ( ON ?auto_193228 ?auto_193227 ) ( not ( = ?auto_193227 ?auto_193228 ) ) ( not ( = ?auto_193227 ?auto_193229 ) ) ( not ( = ?auto_193227 ?auto_193230 ) ) ( not ( = ?auto_193227 ?auto_193231 ) ) ( not ( = ?auto_193227 ?auto_193232 ) ) ( not ( = ?auto_193227 ?auto_193233 ) ) ( not ( = ?auto_193227 ?auto_193235 ) ) ( not ( = ?auto_193228 ?auto_193229 ) ) ( not ( = ?auto_193228 ?auto_193230 ) ) ( not ( = ?auto_193228 ?auto_193231 ) ) ( not ( = ?auto_193228 ?auto_193232 ) ) ( not ( = ?auto_193228 ?auto_193233 ) ) ( not ( = ?auto_193228 ?auto_193235 ) ) ( not ( = ?auto_193229 ?auto_193230 ) ) ( not ( = ?auto_193229 ?auto_193231 ) ) ( not ( = ?auto_193229 ?auto_193232 ) ) ( not ( = ?auto_193229 ?auto_193233 ) ) ( not ( = ?auto_193229 ?auto_193235 ) ) ( not ( = ?auto_193230 ?auto_193231 ) ) ( not ( = ?auto_193230 ?auto_193232 ) ) ( not ( = ?auto_193230 ?auto_193233 ) ) ( not ( = ?auto_193230 ?auto_193235 ) ) ( not ( = ?auto_193231 ?auto_193232 ) ) ( not ( = ?auto_193231 ?auto_193233 ) ) ( not ( = ?auto_193231 ?auto_193235 ) ) ( not ( = ?auto_193232 ?auto_193233 ) ) ( not ( = ?auto_193232 ?auto_193235 ) ) ( not ( = ?auto_193233 ?auto_193235 ) ) ( ON ?auto_193235 ?auto_193234 ) ( not ( = ?auto_193227 ?auto_193234 ) ) ( not ( = ?auto_193228 ?auto_193234 ) ) ( not ( = ?auto_193229 ?auto_193234 ) ) ( not ( = ?auto_193230 ?auto_193234 ) ) ( not ( = ?auto_193231 ?auto_193234 ) ) ( not ( = ?auto_193232 ?auto_193234 ) ) ( not ( = ?auto_193233 ?auto_193234 ) ) ( not ( = ?auto_193235 ?auto_193234 ) ) ( ON ?auto_193233 ?auto_193235 ) ( ON-TABLE ?auto_193234 ) ( ON ?auto_193232 ?auto_193233 ) ( ON ?auto_193231 ?auto_193232 ) ( ON ?auto_193230 ?auto_193231 ) ( CLEAR ?auto_193230 ) ( HOLDING ?auto_193229 ) ( CLEAR ?auto_193228 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_193227 ?auto_193228 ?auto_193229 )
      ( MAKE-7PILE ?auto_193227 ?auto_193228 ?auto_193229 ?auto_193230 ?auto_193231 ?auto_193232 ?auto_193233 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193236 - BLOCK
      ?auto_193237 - BLOCK
      ?auto_193238 - BLOCK
      ?auto_193239 - BLOCK
      ?auto_193240 - BLOCK
      ?auto_193241 - BLOCK
      ?auto_193242 - BLOCK
    )
    :vars
    (
      ?auto_193243 - BLOCK
      ?auto_193244 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193236 ) ( ON ?auto_193237 ?auto_193236 ) ( not ( = ?auto_193236 ?auto_193237 ) ) ( not ( = ?auto_193236 ?auto_193238 ) ) ( not ( = ?auto_193236 ?auto_193239 ) ) ( not ( = ?auto_193236 ?auto_193240 ) ) ( not ( = ?auto_193236 ?auto_193241 ) ) ( not ( = ?auto_193236 ?auto_193242 ) ) ( not ( = ?auto_193236 ?auto_193243 ) ) ( not ( = ?auto_193237 ?auto_193238 ) ) ( not ( = ?auto_193237 ?auto_193239 ) ) ( not ( = ?auto_193237 ?auto_193240 ) ) ( not ( = ?auto_193237 ?auto_193241 ) ) ( not ( = ?auto_193237 ?auto_193242 ) ) ( not ( = ?auto_193237 ?auto_193243 ) ) ( not ( = ?auto_193238 ?auto_193239 ) ) ( not ( = ?auto_193238 ?auto_193240 ) ) ( not ( = ?auto_193238 ?auto_193241 ) ) ( not ( = ?auto_193238 ?auto_193242 ) ) ( not ( = ?auto_193238 ?auto_193243 ) ) ( not ( = ?auto_193239 ?auto_193240 ) ) ( not ( = ?auto_193239 ?auto_193241 ) ) ( not ( = ?auto_193239 ?auto_193242 ) ) ( not ( = ?auto_193239 ?auto_193243 ) ) ( not ( = ?auto_193240 ?auto_193241 ) ) ( not ( = ?auto_193240 ?auto_193242 ) ) ( not ( = ?auto_193240 ?auto_193243 ) ) ( not ( = ?auto_193241 ?auto_193242 ) ) ( not ( = ?auto_193241 ?auto_193243 ) ) ( not ( = ?auto_193242 ?auto_193243 ) ) ( ON ?auto_193243 ?auto_193244 ) ( not ( = ?auto_193236 ?auto_193244 ) ) ( not ( = ?auto_193237 ?auto_193244 ) ) ( not ( = ?auto_193238 ?auto_193244 ) ) ( not ( = ?auto_193239 ?auto_193244 ) ) ( not ( = ?auto_193240 ?auto_193244 ) ) ( not ( = ?auto_193241 ?auto_193244 ) ) ( not ( = ?auto_193242 ?auto_193244 ) ) ( not ( = ?auto_193243 ?auto_193244 ) ) ( ON ?auto_193242 ?auto_193243 ) ( ON-TABLE ?auto_193244 ) ( ON ?auto_193241 ?auto_193242 ) ( ON ?auto_193240 ?auto_193241 ) ( ON ?auto_193239 ?auto_193240 ) ( CLEAR ?auto_193237 ) ( ON ?auto_193238 ?auto_193239 ) ( CLEAR ?auto_193238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193244 ?auto_193243 ?auto_193242 ?auto_193241 ?auto_193240 ?auto_193239 )
      ( MAKE-7PILE ?auto_193236 ?auto_193237 ?auto_193238 ?auto_193239 ?auto_193240 ?auto_193241 ?auto_193242 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193245 - BLOCK
      ?auto_193246 - BLOCK
      ?auto_193247 - BLOCK
      ?auto_193248 - BLOCK
      ?auto_193249 - BLOCK
      ?auto_193250 - BLOCK
      ?auto_193251 - BLOCK
    )
    :vars
    (
      ?auto_193252 - BLOCK
      ?auto_193253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193245 ) ( not ( = ?auto_193245 ?auto_193246 ) ) ( not ( = ?auto_193245 ?auto_193247 ) ) ( not ( = ?auto_193245 ?auto_193248 ) ) ( not ( = ?auto_193245 ?auto_193249 ) ) ( not ( = ?auto_193245 ?auto_193250 ) ) ( not ( = ?auto_193245 ?auto_193251 ) ) ( not ( = ?auto_193245 ?auto_193252 ) ) ( not ( = ?auto_193246 ?auto_193247 ) ) ( not ( = ?auto_193246 ?auto_193248 ) ) ( not ( = ?auto_193246 ?auto_193249 ) ) ( not ( = ?auto_193246 ?auto_193250 ) ) ( not ( = ?auto_193246 ?auto_193251 ) ) ( not ( = ?auto_193246 ?auto_193252 ) ) ( not ( = ?auto_193247 ?auto_193248 ) ) ( not ( = ?auto_193247 ?auto_193249 ) ) ( not ( = ?auto_193247 ?auto_193250 ) ) ( not ( = ?auto_193247 ?auto_193251 ) ) ( not ( = ?auto_193247 ?auto_193252 ) ) ( not ( = ?auto_193248 ?auto_193249 ) ) ( not ( = ?auto_193248 ?auto_193250 ) ) ( not ( = ?auto_193248 ?auto_193251 ) ) ( not ( = ?auto_193248 ?auto_193252 ) ) ( not ( = ?auto_193249 ?auto_193250 ) ) ( not ( = ?auto_193249 ?auto_193251 ) ) ( not ( = ?auto_193249 ?auto_193252 ) ) ( not ( = ?auto_193250 ?auto_193251 ) ) ( not ( = ?auto_193250 ?auto_193252 ) ) ( not ( = ?auto_193251 ?auto_193252 ) ) ( ON ?auto_193252 ?auto_193253 ) ( not ( = ?auto_193245 ?auto_193253 ) ) ( not ( = ?auto_193246 ?auto_193253 ) ) ( not ( = ?auto_193247 ?auto_193253 ) ) ( not ( = ?auto_193248 ?auto_193253 ) ) ( not ( = ?auto_193249 ?auto_193253 ) ) ( not ( = ?auto_193250 ?auto_193253 ) ) ( not ( = ?auto_193251 ?auto_193253 ) ) ( not ( = ?auto_193252 ?auto_193253 ) ) ( ON ?auto_193251 ?auto_193252 ) ( ON-TABLE ?auto_193253 ) ( ON ?auto_193250 ?auto_193251 ) ( ON ?auto_193249 ?auto_193250 ) ( ON ?auto_193248 ?auto_193249 ) ( ON ?auto_193247 ?auto_193248 ) ( CLEAR ?auto_193247 ) ( HOLDING ?auto_193246 ) ( CLEAR ?auto_193245 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193245 ?auto_193246 )
      ( MAKE-7PILE ?auto_193245 ?auto_193246 ?auto_193247 ?auto_193248 ?auto_193249 ?auto_193250 ?auto_193251 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193254 - BLOCK
      ?auto_193255 - BLOCK
      ?auto_193256 - BLOCK
      ?auto_193257 - BLOCK
      ?auto_193258 - BLOCK
      ?auto_193259 - BLOCK
      ?auto_193260 - BLOCK
    )
    :vars
    (
      ?auto_193261 - BLOCK
      ?auto_193262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193254 ) ( not ( = ?auto_193254 ?auto_193255 ) ) ( not ( = ?auto_193254 ?auto_193256 ) ) ( not ( = ?auto_193254 ?auto_193257 ) ) ( not ( = ?auto_193254 ?auto_193258 ) ) ( not ( = ?auto_193254 ?auto_193259 ) ) ( not ( = ?auto_193254 ?auto_193260 ) ) ( not ( = ?auto_193254 ?auto_193261 ) ) ( not ( = ?auto_193255 ?auto_193256 ) ) ( not ( = ?auto_193255 ?auto_193257 ) ) ( not ( = ?auto_193255 ?auto_193258 ) ) ( not ( = ?auto_193255 ?auto_193259 ) ) ( not ( = ?auto_193255 ?auto_193260 ) ) ( not ( = ?auto_193255 ?auto_193261 ) ) ( not ( = ?auto_193256 ?auto_193257 ) ) ( not ( = ?auto_193256 ?auto_193258 ) ) ( not ( = ?auto_193256 ?auto_193259 ) ) ( not ( = ?auto_193256 ?auto_193260 ) ) ( not ( = ?auto_193256 ?auto_193261 ) ) ( not ( = ?auto_193257 ?auto_193258 ) ) ( not ( = ?auto_193257 ?auto_193259 ) ) ( not ( = ?auto_193257 ?auto_193260 ) ) ( not ( = ?auto_193257 ?auto_193261 ) ) ( not ( = ?auto_193258 ?auto_193259 ) ) ( not ( = ?auto_193258 ?auto_193260 ) ) ( not ( = ?auto_193258 ?auto_193261 ) ) ( not ( = ?auto_193259 ?auto_193260 ) ) ( not ( = ?auto_193259 ?auto_193261 ) ) ( not ( = ?auto_193260 ?auto_193261 ) ) ( ON ?auto_193261 ?auto_193262 ) ( not ( = ?auto_193254 ?auto_193262 ) ) ( not ( = ?auto_193255 ?auto_193262 ) ) ( not ( = ?auto_193256 ?auto_193262 ) ) ( not ( = ?auto_193257 ?auto_193262 ) ) ( not ( = ?auto_193258 ?auto_193262 ) ) ( not ( = ?auto_193259 ?auto_193262 ) ) ( not ( = ?auto_193260 ?auto_193262 ) ) ( not ( = ?auto_193261 ?auto_193262 ) ) ( ON ?auto_193260 ?auto_193261 ) ( ON-TABLE ?auto_193262 ) ( ON ?auto_193259 ?auto_193260 ) ( ON ?auto_193258 ?auto_193259 ) ( ON ?auto_193257 ?auto_193258 ) ( ON ?auto_193256 ?auto_193257 ) ( CLEAR ?auto_193254 ) ( ON ?auto_193255 ?auto_193256 ) ( CLEAR ?auto_193255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193262 ?auto_193261 ?auto_193260 ?auto_193259 ?auto_193258 ?auto_193257 ?auto_193256 )
      ( MAKE-7PILE ?auto_193254 ?auto_193255 ?auto_193256 ?auto_193257 ?auto_193258 ?auto_193259 ?auto_193260 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193263 - BLOCK
      ?auto_193264 - BLOCK
      ?auto_193265 - BLOCK
      ?auto_193266 - BLOCK
      ?auto_193267 - BLOCK
      ?auto_193268 - BLOCK
      ?auto_193269 - BLOCK
    )
    :vars
    (
      ?auto_193271 - BLOCK
      ?auto_193270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193263 ?auto_193264 ) ) ( not ( = ?auto_193263 ?auto_193265 ) ) ( not ( = ?auto_193263 ?auto_193266 ) ) ( not ( = ?auto_193263 ?auto_193267 ) ) ( not ( = ?auto_193263 ?auto_193268 ) ) ( not ( = ?auto_193263 ?auto_193269 ) ) ( not ( = ?auto_193263 ?auto_193271 ) ) ( not ( = ?auto_193264 ?auto_193265 ) ) ( not ( = ?auto_193264 ?auto_193266 ) ) ( not ( = ?auto_193264 ?auto_193267 ) ) ( not ( = ?auto_193264 ?auto_193268 ) ) ( not ( = ?auto_193264 ?auto_193269 ) ) ( not ( = ?auto_193264 ?auto_193271 ) ) ( not ( = ?auto_193265 ?auto_193266 ) ) ( not ( = ?auto_193265 ?auto_193267 ) ) ( not ( = ?auto_193265 ?auto_193268 ) ) ( not ( = ?auto_193265 ?auto_193269 ) ) ( not ( = ?auto_193265 ?auto_193271 ) ) ( not ( = ?auto_193266 ?auto_193267 ) ) ( not ( = ?auto_193266 ?auto_193268 ) ) ( not ( = ?auto_193266 ?auto_193269 ) ) ( not ( = ?auto_193266 ?auto_193271 ) ) ( not ( = ?auto_193267 ?auto_193268 ) ) ( not ( = ?auto_193267 ?auto_193269 ) ) ( not ( = ?auto_193267 ?auto_193271 ) ) ( not ( = ?auto_193268 ?auto_193269 ) ) ( not ( = ?auto_193268 ?auto_193271 ) ) ( not ( = ?auto_193269 ?auto_193271 ) ) ( ON ?auto_193271 ?auto_193270 ) ( not ( = ?auto_193263 ?auto_193270 ) ) ( not ( = ?auto_193264 ?auto_193270 ) ) ( not ( = ?auto_193265 ?auto_193270 ) ) ( not ( = ?auto_193266 ?auto_193270 ) ) ( not ( = ?auto_193267 ?auto_193270 ) ) ( not ( = ?auto_193268 ?auto_193270 ) ) ( not ( = ?auto_193269 ?auto_193270 ) ) ( not ( = ?auto_193271 ?auto_193270 ) ) ( ON ?auto_193269 ?auto_193271 ) ( ON-TABLE ?auto_193270 ) ( ON ?auto_193268 ?auto_193269 ) ( ON ?auto_193267 ?auto_193268 ) ( ON ?auto_193266 ?auto_193267 ) ( ON ?auto_193265 ?auto_193266 ) ( ON ?auto_193264 ?auto_193265 ) ( CLEAR ?auto_193264 ) ( HOLDING ?auto_193263 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_193263 )
      ( MAKE-7PILE ?auto_193263 ?auto_193264 ?auto_193265 ?auto_193266 ?auto_193267 ?auto_193268 ?auto_193269 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_193272 - BLOCK
      ?auto_193273 - BLOCK
      ?auto_193274 - BLOCK
      ?auto_193275 - BLOCK
      ?auto_193276 - BLOCK
      ?auto_193277 - BLOCK
      ?auto_193278 - BLOCK
    )
    :vars
    (
      ?auto_193280 - BLOCK
      ?auto_193279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193272 ?auto_193273 ) ) ( not ( = ?auto_193272 ?auto_193274 ) ) ( not ( = ?auto_193272 ?auto_193275 ) ) ( not ( = ?auto_193272 ?auto_193276 ) ) ( not ( = ?auto_193272 ?auto_193277 ) ) ( not ( = ?auto_193272 ?auto_193278 ) ) ( not ( = ?auto_193272 ?auto_193280 ) ) ( not ( = ?auto_193273 ?auto_193274 ) ) ( not ( = ?auto_193273 ?auto_193275 ) ) ( not ( = ?auto_193273 ?auto_193276 ) ) ( not ( = ?auto_193273 ?auto_193277 ) ) ( not ( = ?auto_193273 ?auto_193278 ) ) ( not ( = ?auto_193273 ?auto_193280 ) ) ( not ( = ?auto_193274 ?auto_193275 ) ) ( not ( = ?auto_193274 ?auto_193276 ) ) ( not ( = ?auto_193274 ?auto_193277 ) ) ( not ( = ?auto_193274 ?auto_193278 ) ) ( not ( = ?auto_193274 ?auto_193280 ) ) ( not ( = ?auto_193275 ?auto_193276 ) ) ( not ( = ?auto_193275 ?auto_193277 ) ) ( not ( = ?auto_193275 ?auto_193278 ) ) ( not ( = ?auto_193275 ?auto_193280 ) ) ( not ( = ?auto_193276 ?auto_193277 ) ) ( not ( = ?auto_193276 ?auto_193278 ) ) ( not ( = ?auto_193276 ?auto_193280 ) ) ( not ( = ?auto_193277 ?auto_193278 ) ) ( not ( = ?auto_193277 ?auto_193280 ) ) ( not ( = ?auto_193278 ?auto_193280 ) ) ( ON ?auto_193280 ?auto_193279 ) ( not ( = ?auto_193272 ?auto_193279 ) ) ( not ( = ?auto_193273 ?auto_193279 ) ) ( not ( = ?auto_193274 ?auto_193279 ) ) ( not ( = ?auto_193275 ?auto_193279 ) ) ( not ( = ?auto_193276 ?auto_193279 ) ) ( not ( = ?auto_193277 ?auto_193279 ) ) ( not ( = ?auto_193278 ?auto_193279 ) ) ( not ( = ?auto_193280 ?auto_193279 ) ) ( ON ?auto_193278 ?auto_193280 ) ( ON-TABLE ?auto_193279 ) ( ON ?auto_193277 ?auto_193278 ) ( ON ?auto_193276 ?auto_193277 ) ( ON ?auto_193275 ?auto_193276 ) ( ON ?auto_193274 ?auto_193275 ) ( ON ?auto_193273 ?auto_193274 ) ( ON ?auto_193272 ?auto_193273 ) ( CLEAR ?auto_193272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193279 ?auto_193280 ?auto_193278 ?auto_193277 ?auto_193276 ?auto_193275 ?auto_193274 ?auto_193273 )
      ( MAKE-7PILE ?auto_193272 ?auto_193273 ?auto_193274 ?auto_193275 ?auto_193276 ?auto_193277 ?auto_193278 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193282 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_193282 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_193282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193283 - BLOCK
    )
    :vars
    (
      ?auto_193284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193283 ?auto_193284 ) ( CLEAR ?auto_193283 ) ( HAND-EMPTY ) ( not ( = ?auto_193283 ?auto_193284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_193283 ?auto_193284 )
      ( MAKE-1PILE ?auto_193283 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193285 - BLOCK
    )
    :vars
    (
      ?auto_193286 - BLOCK
      ?auto_193292 - BLOCK
      ?auto_193287 - BLOCK
      ?auto_193289 - BLOCK
      ?auto_193288 - BLOCK
      ?auto_193290 - BLOCK
      ?auto_193291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193285 ?auto_193286 ) ) ( HOLDING ?auto_193285 ) ( CLEAR ?auto_193286 ) ( ON-TABLE ?auto_193292 ) ( ON ?auto_193287 ?auto_193292 ) ( ON ?auto_193289 ?auto_193287 ) ( ON ?auto_193288 ?auto_193289 ) ( ON ?auto_193290 ?auto_193288 ) ( ON ?auto_193291 ?auto_193290 ) ( ON ?auto_193286 ?auto_193291 ) ( not ( = ?auto_193292 ?auto_193287 ) ) ( not ( = ?auto_193292 ?auto_193289 ) ) ( not ( = ?auto_193292 ?auto_193288 ) ) ( not ( = ?auto_193292 ?auto_193290 ) ) ( not ( = ?auto_193292 ?auto_193291 ) ) ( not ( = ?auto_193292 ?auto_193286 ) ) ( not ( = ?auto_193292 ?auto_193285 ) ) ( not ( = ?auto_193287 ?auto_193289 ) ) ( not ( = ?auto_193287 ?auto_193288 ) ) ( not ( = ?auto_193287 ?auto_193290 ) ) ( not ( = ?auto_193287 ?auto_193291 ) ) ( not ( = ?auto_193287 ?auto_193286 ) ) ( not ( = ?auto_193287 ?auto_193285 ) ) ( not ( = ?auto_193289 ?auto_193288 ) ) ( not ( = ?auto_193289 ?auto_193290 ) ) ( not ( = ?auto_193289 ?auto_193291 ) ) ( not ( = ?auto_193289 ?auto_193286 ) ) ( not ( = ?auto_193289 ?auto_193285 ) ) ( not ( = ?auto_193288 ?auto_193290 ) ) ( not ( = ?auto_193288 ?auto_193291 ) ) ( not ( = ?auto_193288 ?auto_193286 ) ) ( not ( = ?auto_193288 ?auto_193285 ) ) ( not ( = ?auto_193290 ?auto_193291 ) ) ( not ( = ?auto_193290 ?auto_193286 ) ) ( not ( = ?auto_193290 ?auto_193285 ) ) ( not ( = ?auto_193291 ?auto_193286 ) ) ( not ( = ?auto_193291 ?auto_193285 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193292 ?auto_193287 ?auto_193289 ?auto_193288 ?auto_193290 ?auto_193291 ?auto_193286 ?auto_193285 )
      ( MAKE-1PILE ?auto_193285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193293 - BLOCK
    )
    :vars
    (
      ?auto_193296 - BLOCK
      ?auto_193297 - BLOCK
      ?auto_193294 - BLOCK
      ?auto_193298 - BLOCK
      ?auto_193299 - BLOCK
      ?auto_193295 - BLOCK
      ?auto_193300 - BLOCK
      ?auto_193301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193293 ?auto_193296 ) ) ( CLEAR ?auto_193296 ) ( ON-TABLE ?auto_193297 ) ( ON ?auto_193294 ?auto_193297 ) ( ON ?auto_193298 ?auto_193294 ) ( ON ?auto_193299 ?auto_193298 ) ( ON ?auto_193295 ?auto_193299 ) ( ON ?auto_193300 ?auto_193295 ) ( ON ?auto_193296 ?auto_193300 ) ( not ( = ?auto_193297 ?auto_193294 ) ) ( not ( = ?auto_193297 ?auto_193298 ) ) ( not ( = ?auto_193297 ?auto_193299 ) ) ( not ( = ?auto_193297 ?auto_193295 ) ) ( not ( = ?auto_193297 ?auto_193300 ) ) ( not ( = ?auto_193297 ?auto_193296 ) ) ( not ( = ?auto_193297 ?auto_193293 ) ) ( not ( = ?auto_193294 ?auto_193298 ) ) ( not ( = ?auto_193294 ?auto_193299 ) ) ( not ( = ?auto_193294 ?auto_193295 ) ) ( not ( = ?auto_193294 ?auto_193300 ) ) ( not ( = ?auto_193294 ?auto_193296 ) ) ( not ( = ?auto_193294 ?auto_193293 ) ) ( not ( = ?auto_193298 ?auto_193299 ) ) ( not ( = ?auto_193298 ?auto_193295 ) ) ( not ( = ?auto_193298 ?auto_193300 ) ) ( not ( = ?auto_193298 ?auto_193296 ) ) ( not ( = ?auto_193298 ?auto_193293 ) ) ( not ( = ?auto_193299 ?auto_193295 ) ) ( not ( = ?auto_193299 ?auto_193300 ) ) ( not ( = ?auto_193299 ?auto_193296 ) ) ( not ( = ?auto_193299 ?auto_193293 ) ) ( not ( = ?auto_193295 ?auto_193300 ) ) ( not ( = ?auto_193295 ?auto_193296 ) ) ( not ( = ?auto_193295 ?auto_193293 ) ) ( not ( = ?auto_193300 ?auto_193296 ) ) ( not ( = ?auto_193300 ?auto_193293 ) ) ( ON ?auto_193293 ?auto_193301 ) ( CLEAR ?auto_193293 ) ( HAND-EMPTY ) ( not ( = ?auto_193293 ?auto_193301 ) ) ( not ( = ?auto_193296 ?auto_193301 ) ) ( not ( = ?auto_193297 ?auto_193301 ) ) ( not ( = ?auto_193294 ?auto_193301 ) ) ( not ( = ?auto_193298 ?auto_193301 ) ) ( not ( = ?auto_193299 ?auto_193301 ) ) ( not ( = ?auto_193295 ?auto_193301 ) ) ( not ( = ?auto_193300 ?auto_193301 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_193293 ?auto_193301 )
      ( MAKE-1PILE ?auto_193293 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193302 - BLOCK
    )
    :vars
    (
      ?auto_193309 - BLOCK
      ?auto_193310 - BLOCK
      ?auto_193303 - BLOCK
      ?auto_193304 - BLOCK
      ?auto_193306 - BLOCK
      ?auto_193308 - BLOCK
      ?auto_193307 - BLOCK
      ?auto_193305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193302 ?auto_193309 ) ) ( ON-TABLE ?auto_193310 ) ( ON ?auto_193303 ?auto_193310 ) ( ON ?auto_193304 ?auto_193303 ) ( ON ?auto_193306 ?auto_193304 ) ( ON ?auto_193308 ?auto_193306 ) ( ON ?auto_193307 ?auto_193308 ) ( not ( = ?auto_193310 ?auto_193303 ) ) ( not ( = ?auto_193310 ?auto_193304 ) ) ( not ( = ?auto_193310 ?auto_193306 ) ) ( not ( = ?auto_193310 ?auto_193308 ) ) ( not ( = ?auto_193310 ?auto_193307 ) ) ( not ( = ?auto_193310 ?auto_193309 ) ) ( not ( = ?auto_193310 ?auto_193302 ) ) ( not ( = ?auto_193303 ?auto_193304 ) ) ( not ( = ?auto_193303 ?auto_193306 ) ) ( not ( = ?auto_193303 ?auto_193308 ) ) ( not ( = ?auto_193303 ?auto_193307 ) ) ( not ( = ?auto_193303 ?auto_193309 ) ) ( not ( = ?auto_193303 ?auto_193302 ) ) ( not ( = ?auto_193304 ?auto_193306 ) ) ( not ( = ?auto_193304 ?auto_193308 ) ) ( not ( = ?auto_193304 ?auto_193307 ) ) ( not ( = ?auto_193304 ?auto_193309 ) ) ( not ( = ?auto_193304 ?auto_193302 ) ) ( not ( = ?auto_193306 ?auto_193308 ) ) ( not ( = ?auto_193306 ?auto_193307 ) ) ( not ( = ?auto_193306 ?auto_193309 ) ) ( not ( = ?auto_193306 ?auto_193302 ) ) ( not ( = ?auto_193308 ?auto_193307 ) ) ( not ( = ?auto_193308 ?auto_193309 ) ) ( not ( = ?auto_193308 ?auto_193302 ) ) ( not ( = ?auto_193307 ?auto_193309 ) ) ( not ( = ?auto_193307 ?auto_193302 ) ) ( ON ?auto_193302 ?auto_193305 ) ( CLEAR ?auto_193302 ) ( not ( = ?auto_193302 ?auto_193305 ) ) ( not ( = ?auto_193309 ?auto_193305 ) ) ( not ( = ?auto_193310 ?auto_193305 ) ) ( not ( = ?auto_193303 ?auto_193305 ) ) ( not ( = ?auto_193304 ?auto_193305 ) ) ( not ( = ?auto_193306 ?auto_193305 ) ) ( not ( = ?auto_193308 ?auto_193305 ) ) ( not ( = ?auto_193307 ?auto_193305 ) ) ( HOLDING ?auto_193309 ) ( CLEAR ?auto_193307 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193310 ?auto_193303 ?auto_193304 ?auto_193306 ?auto_193308 ?auto_193307 ?auto_193309 )
      ( MAKE-1PILE ?auto_193302 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193311 - BLOCK
    )
    :vars
    (
      ?auto_193319 - BLOCK
      ?auto_193313 - BLOCK
      ?auto_193312 - BLOCK
      ?auto_193314 - BLOCK
      ?auto_193315 - BLOCK
      ?auto_193316 - BLOCK
      ?auto_193317 - BLOCK
      ?auto_193318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193311 ?auto_193319 ) ) ( ON-TABLE ?auto_193313 ) ( ON ?auto_193312 ?auto_193313 ) ( ON ?auto_193314 ?auto_193312 ) ( ON ?auto_193315 ?auto_193314 ) ( ON ?auto_193316 ?auto_193315 ) ( ON ?auto_193317 ?auto_193316 ) ( not ( = ?auto_193313 ?auto_193312 ) ) ( not ( = ?auto_193313 ?auto_193314 ) ) ( not ( = ?auto_193313 ?auto_193315 ) ) ( not ( = ?auto_193313 ?auto_193316 ) ) ( not ( = ?auto_193313 ?auto_193317 ) ) ( not ( = ?auto_193313 ?auto_193319 ) ) ( not ( = ?auto_193313 ?auto_193311 ) ) ( not ( = ?auto_193312 ?auto_193314 ) ) ( not ( = ?auto_193312 ?auto_193315 ) ) ( not ( = ?auto_193312 ?auto_193316 ) ) ( not ( = ?auto_193312 ?auto_193317 ) ) ( not ( = ?auto_193312 ?auto_193319 ) ) ( not ( = ?auto_193312 ?auto_193311 ) ) ( not ( = ?auto_193314 ?auto_193315 ) ) ( not ( = ?auto_193314 ?auto_193316 ) ) ( not ( = ?auto_193314 ?auto_193317 ) ) ( not ( = ?auto_193314 ?auto_193319 ) ) ( not ( = ?auto_193314 ?auto_193311 ) ) ( not ( = ?auto_193315 ?auto_193316 ) ) ( not ( = ?auto_193315 ?auto_193317 ) ) ( not ( = ?auto_193315 ?auto_193319 ) ) ( not ( = ?auto_193315 ?auto_193311 ) ) ( not ( = ?auto_193316 ?auto_193317 ) ) ( not ( = ?auto_193316 ?auto_193319 ) ) ( not ( = ?auto_193316 ?auto_193311 ) ) ( not ( = ?auto_193317 ?auto_193319 ) ) ( not ( = ?auto_193317 ?auto_193311 ) ) ( ON ?auto_193311 ?auto_193318 ) ( not ( = ?auto_193311 ?auto_193318 ) ) ( not ( = ?auto_193319 ?auto_193318 ) ) ( not ( = ?auto_193313 ?auto_193318 ) ) ( not ( = ?auto_193312 ?auto_193318 ) ) ( not ( = ?auto_193314 ?auto_193318 ) ) ( not ( = ?auto_193315 ?auto_193318 ) ) ( not ( = ?auto_193316 ?auto_193318 ) ) ( not ( = ?auto_193317 ?auto_193318 ) ) ( CLEAR ?auto_193317 ) ( ON ?auto_193319 ?auto_193311 ) ( CLEAR ?auto_193319 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193318 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193318 ?auto_193311 )
      ( MAKE-1PILE ?auto_193311 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193320 - BLOCK
    )
    :vars
    (
      ?auto_193321 - BLOCK
      ?auto_193325 - BLOCK
      ?auto_193322 - BLOCK
      ?auto_193326 - BLOCK
      ?auto_193323 - BLOCK
      ?auto_193324 - BLOCK
      ?auto_193328 - BLOCK
      ?auto_193327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193320 ?auto_193321 ) ) ( ON-TABLE ?auto_193325 ) ( ON ?auto_193322 ?auto_193325 ) ( ON ?auto_193326 ?auto_193322 ) ( ON ?auto_193323 ?auto_193326 ) ( ON ?auto_193324 ?auto_193323 ) ( not ( = ?auto_193325 ?auto_193322 ) ) ( not ( = ?auto_193325 ?auto_193326 ) ) ( not ( = ?auto_193325 ?auto_193323 ) ) ( not ( = ?auto_193325 ?auto_193324 ) ) ( not ( = ?auto_193325 ?auto_193328 ) ) ( not ( = ?auto_193325 ?auto_193321 ) ) ( not ( = ?auto_193325 ?auto_193320 ) ) ( not ( = ?auto_193322 ?auto_193326 ) ) ( not ( = ?auto_193322 ?auto_193323 ) ) ( not ( = ?auto_193322 ?auto_193324 ) ) ( not ( = ?auto_193322 ?auto_193328 ) ) ( not ( = ?auto_193322 ?auto_193321 ) ) ( not ( = ?auto_193322 ?auto_193320 ) ) ( not ( = ?auto_193326 ?auto_193323 ) ) ( not ( = ?auto_193326 ?auto_193324 ) ) ( not ( = ?auto_193326 ?auto_193328 ) ) ( not ( = ?auto_193326 ?auto_193321 ) ) ( not ( = ?auto_193326 ?auto_193320 ) ) ( not ( = ?auto_193323 ?auto_193324 ) ) ( not ( = ?auto_193323 ?auto_193328 ) ) ( not ( = ?auto_193323 ?auto_193321 ) ) ( not ( = ?auto_193323 ?auto_193320 ) ) ( not ( = ?auto_193324 ?auto_193328 ) ) ( not ( = ?auto_193324 ?auto_193321 ) ) ( not ( = ?auto_193324 ?auto_193320 ) ) ( not ( = ?auto_193328 ?auto_193321 ) ) ( not ( = ?auto_193328 ?auto_193320 ) ) ( ON ?auto_193320 ?auto_193327 ) ( not ( = ?auto_193320 ?auto_193327 ) ) ( not ( = ?auto_193321 ?auto_193327 ) ) ( not ( = ?auto_193325 ?auto_193327 ) ) ( not ( = ?auto_193322 ?auto_193327 ) ) ( not ( = ?auto_193326 ?auto_193327 ) ) ( not ( = ?auto_193323 ?auto_193327 ) ) ( not ( = ?auto_193324 ?auto_193327 ) ) ( not ( = ?auto_193328 ?auto_193327 ) ) ( ON ?auto_193321 ?auto_193320 ) ( CLEAR ?auto_193321 ) ( ON-TABLE ?auto_193327 ) ( HOLDING ?auto_193328 ) ( CLEAR ?auto_193324 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193325 ?auto_193322 ?auto_193326 ?auto_193323 ?auto_193324 ?auto_193328 )
      ( MAKE-1PILE ?auto_193320 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193329 - BLOCK
    )
    :vars
    (
      ?auto_193336 - BLOCK
      ?auto_193337 - BLOCK
      ?auto_193332 - BLOCK
      ?auto_193334 - BLOCK
      ?auto_193333 - BLOCK
      ?auto_193335 - BLOCK
      ?auto_193331 - BLOCK
      ?auto_193330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193329 ?auto_193336 ) ) ( ON-TABLE ?auto_193337 ) ( ON ?auto_193332 ?auto_193337 ) ( ON ?auto_193334 ?auto_193332 ) ( ON ?auto_193333 ?auto_193334 ) ( ON ?auto_193335 ?auto_193333 ) ( not ( = ?auto_193337 ?auto_193332 ) ) ( not ( = ?auto_193337 ?auto_193334 ) ) ( not ( = ?auto_193337 ?auto_193333 ) ) ( not ( = ?auto_193337 ?auto_193335 ) ) ( not ( = ?auto_193337 ?auto_193331 ) ) ( not ( = ?auto_193337 ?auto_193336 ) ) ( not ( = ?auto_193337 ?auto_193329 ) ) ( not ( = ?auto_193332 ?auto_193334 ) ) ( not ( = ?auto_193332 ?auto_193333 ) ) ( not ( = ?auto_193332 ?auto_193335 ) ) ( not ( = ?auto_193332 ?auto_193331 ) ) ( not ( = ?auto_193332 ?auto_193336 ) ) ( not ( = ?auto_193332 ?auto_193329 ) ) ( not ( = ?auto_193334 ?auto_193333 ) ) ( not ( = ?auto_193334 ?auto_193335 ) ) ( not ( = ?auto_193334 ?auto_193331 ) ) ( not ( = ?auto_193334 ?auto_193336 ) ) ( not ( = ?auto_193334 ?auto_193329 ) ) ( not ( = ?auto_193333 ?auto_193335 ) ) ( not ( = ?auto_193333 ?auto_193331 ) ) ( not ( = ?auto_193333 ?auto_193336 ) ) ( not ( = ?auto_193333 ?auto_193329 ) ) ( not ( = ?auto_193335 ?auto_193331 ) ) ( not ( = ?auto_193335 ?auto_193336 ) ) ( not ( = ?auto_193335 ?auto_193329 ) ) ( not ( = ?auto_193331 ?auto_193336 ) ) ( not ( = ?auto_193331 ?auto_193329 ) ) ( ON ?auto_193329 ?auto_193330 ) ( not ( = ?auto_193329 ?auto_193330 ) ) ( not ( = ?auto_193336 ?auto_193330 ) ) ( not ( = ?auto_193337 ?auto_193330 ) ) ( not ( = ?auto_193332 ?auto_193330 ) ) ( not ( = ?auto_193334 ?auto_193330 ) ) ( not ( = ?auto_193333 ?auto_193330 ) ) ( not ( = ?auto_193335 ?auto_193330 ) ) ( not ( = ?auto_193331 ?auto_193330 ) ) ( ON ?auto_193336 ?auto_193329 ) ( ON-TABLE ?auto_193330 ) ( CLEAR ?auto_193335 ) ( ON ?auto_193331 ?auto_193336 ) ( CLEAR ?auto_193331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_193330 ?auto_193329 ?auto_193336 )
      ( MAKE-1PILE ?auto_193329 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193338 - BLOCK
    )
    :vars
    (
      ?auto_193343 - BLOCK
      ?auto_193344 - BLOCK
      ?auto_193342 - BLOCK
      ?auto_193340 - BLOCK
      ?auto_193345 - BLOCK
      ?auto_193339 - BLOCK
      ?auto_193341 - BLOCK
      ?auto_193346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193338 ?auto_193343 ) ) ( ON-TABLE ?auto_193344 ) ( ON ?auto_193342 ?auto_193344 ) ( ON ?auto_193340 ?auto_193342 ) ( ON ?auto_193345 ?auto_193340 ) ( not ( = ?auto_193344 ?auto_193342 ) ) ( not ( = ?auto_193344 ?auto_193340 ) ) ( not ( = ?auto_193344 ?auto_193345 ) ) ( not ( = ?auto_193344 ?auto_193339 ) ) ( not ( = ?auto_193344 ?auto_193341 ) ) ( not ( = ?auto_193344 ?auto_193343 ) ) ( not ( = ?auto_193344 ?auto_193338 ) ) ( not ( = ?auto_193342 ?auto_193340 ) ) ( not ( = ?auto_193342 ?auto_193345 ) ) ( not ( = ?auto_193342 ?auto_193339 ) ) ( not ( = ?auto_193342 ?auto_193341 ) ) ( not ( = ?auto_193342 ?auto_193343 ) ) ( not ( = ?auto_193342 ?auto_193338 ) ) ( not ( = ?auto_193340 ?auto_193345 ) ) ( not ( = ?auto_193340 ?auto_193339 ) ) ( not ( = ?auto_193340 ?auto_193341 ) ) ( not ( = ?auto_193340 ?auto_193343 ) ) ( not ( = ?auto_193340 ?auto_193338 ) ) ( not ( = ?auto_193345 ?auto_193339 ) ) ( not ( = ?auto_193345 ?auto_193341 ) ) ( not ( = ?auto_193345 ?auto_193343 ) ) ( not ( = ?auto_193345 ?auto_193338 ) ) ( not ( = ?auto_193339 ?auto_193341 ) ) ( not ( = ?auto_193339 ?auto_193343 ) ) ( not ( = ?auto_193339 ?auto_193338 ) ) ( not ( = ?auto_193341 ?auto_193343 ) ) ( not ( = ?auto_193341 ?auto_193338 ) ) ( ON ?auto_193338 ?auto_193346 ) ( not ( = ?auto_193338 ?auto_193346 ) ) ( not ( = ?auto_193343 ?auto_193346 ) ) ( not ( = ?auto_193344 ?auto_193346 ) ) ( not ( = ?auto_193342 ?auto_193346 ) ) ( not ( = ?auto_193340 ?auto_193346 ) ) ( not ( = ?auto_193345 ?auto_193346 ) ) ( not ( = ?auto_193339 ?auto_193346 ) ) ( not ( = ?auto_193341 ?auto_193346 ) ) ( ON ?auto_193343 ?auto_193338 ) ( ON-TABLE ?auto_193346 ) ( ON ?auto_193341 ?auto_193343 ) ( CLEAR ?auto_193341 ) ( HOLDING ?auto_193339 ) ( CLEAR ?auto_193345 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_193344 ?auto_193342 ?auto_193340 ?auto_193345 ?auto_193339 )
      ( MAKE-1PILE ?auto_193338 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193347 - BLOCK
    )
    :vars
    (
      ?auto_193354 - BLOCK
      ?auto_193348 - BLOCK
      ?auto_193350 - BLOCK
      ?auto_193351 - BLOCK
      ?auto_193352 - BLOCK
      ?auto_193349 - BLOCK
      ?auto_193353 - BLOCK
      ?auto_193355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193347 ?auto_193354 ) ) ( ON-TABLE ?auto_193348 ) ( ON ?auto_193350 ?auto_193348 ) ( ON ?auto_193351 ?auto_193350 ) ( ON ?auto_193352 ?auto_193351 ) ( not ( = ?auto_193348 ?auto_193350 ) ) ( not ( = ?auto_193348 ?auto_193351 ) ) ( not ( = ?auto_193348 ?auto_193352 ) ) ( not ( = ?auto_193348 ?auto_193349 ) ) ( not ( = ?auto_193348 ?auto_193353 ) ) ( not ( = ?auto_193348 ?auto_193354 ) ) ( not ( = ?auto_193348 ?auto_193347 ) ) ( not ( = ?auto_193350 ?auto_193351 ) ) ( not ( = ?auto_193350 ?auto_193352 ) ) ( not ( = ?auto_193350 ?auto_193349 ) ) ( not ( = ?auto_193350 ?auto_193353 ) ) ( not ( = ?auto_193350 ?auto_193354 ) ) ( not ( = ?auto_193350 ?auto_193347 ) ) ( not ( = ?auto_193351 ?auto_193352 ) ) ( not ( = ?auto_193351 ?auto_193349 ) ) ( not ( = ?auto_193351 ?auto_193353 ) ) ( not ( = ?auto_193351 ?auto_193354 ) ) ( not ( = ?auto_193351 ?auto_193347 ) ) ( not ( = ?auto_193352 ?auto_193349 ) ) ( not ( = ?auto_193352 ?auto_193353 ) ) ( not ( = ?auto_193352 ?auto_193354 ) ) ( not ( = ?auto_193352 ?auto_193347 ) ) ( not ( = ?auto_193349 ?auto_193353 ) ) ( not ( = ?auto_193349 ?auto_193354 ) ) ( not ( = ?auto_193349 ?auto_193347 ) ) ( not ( = ?auto_193353 ?auto_193354 ) ) ( not ( = ?auto_193353 ?auto_193347 ) ) ( ON ?auto_193347 ?auto_193355 ) ( not ( = ?auto_193347 ?auto_193355 ) ) ( not ( = ?auto_193354 ?auto_193355 ) ) ( not ( = ?auto_193348 ?auto_193355 ) ) ( not ( = ?auto_193350 ?auto_193355 ) ) ( not ( = ?auto_193351 ?auto_193355 ) ) ( not ( = ?auto_193352 ?auto_193355 ) ) ( not ( = ?auto_193349 ?auto_193355 ) ) ( not ( = ?auto_193353 ?auto_193355 ) ) ( ON ?auto_193354 ?auto_193347 ) ( ON-TABLE ?auto_193355 ) ( ON ?auto_193353 ?auto_193354 ) ( CLEAR ?auto_193352 ) ( ON ?auto_193349 ?auto_193353 ) ( CLEAR ?auto_193349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193355 ?auto_193347 ?auto_193354 ?auto_193353 )
      ( MAKE-1PILE ?auto_193347 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193356 - BLOCK
    )
    :vars
    (
      ?auto_193364 - BLOCK
      ?auto_193361 - BLOCK
      ?auto_193362 - BLOCK
      ?auto_193360 - BLOCK
      ?auto_193358 - BLOCK
      ?auto_193357 - BLOCK
      ?auto_193359 - BLOCK
      ?auto_193363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193356 ?auto_193364 ) ) ( ON-TABLE ?auto_193361 ) ( ON ?auto_193362 ?auto_193361 ) ( ON ?auto_193360 ?auto_193362 ) ( not ( = ?auto_193361 ?auto_193362 ) ) ( not ( = ?auto_193361 ?auto_193360 ) ) ( not ( = ?auto_193361 ?auto_193358 ) ) ( not ( = ?auto_193361 ?auto_193357 ) ) ( not ( = ?auto_193361 ?auto_193359 ) ) ( not ( = ?auto_193361 ?auto_193364 ) ) ( not ( = ?auto_193361 ?auto_193356 ) ) ( not ( = ?auto_193362 ?auto_193360 ) ) ( not ( = ?auto_193362 ?auto_193358 ) ) ( not ( = ?auto_193362 ?auto_193357 ) ) ( not ( = ?auto_193362 ?auto_193359 ) ) ( not ( = ?auto_193362 ?auto_193364 ) ) ( not ( = ?auto_193362 ?auto_193356 ) ) ( not ( = ?auto_193360 ?auto_193358 ) ) ( not ( = ?auto_193360 ?auto_193357 ) ) ( not ( = ?auto_193360 ?auto_193359 ) ) ( not ( = ?auto_193360 ?auto_193364 ) ) ( not ( = ?auto_193360 ?auto_193356 ) ) ( not ( = ?auto_193358 ?auto_193357 ) ) ( not ( = ?auto_193358 ?auto_193359 ) ) ( not ( = ?auto_193358 ?auto_193364 ) ) ( not ( = ?auto_193358 ?auto_193356 ) ) ( not ( = ?auto_193357 ?auto_193359 ) ) ( not ( = ?auto_193357 ?auto_193364 ) ) ( not ( = ?auto_193357 ?auto_193356 ) ) ( not ( = ?auto_193359 ?auto_193364 ) ) ( not ( = ?auto_193359 ?auto_193356 ) ) ( ON ?auto_193356 ?auto_193363 ) ( not ( = ?auto_193356 ?auto_193363 ) ) ( not ( = ?auto_193364 ?auto_193363 ) ) ( not ( = ?auto_193361 ?auto_193363 ) ) ( not ( = ?auto_193362 ?auto_193363 ) ) ( not ( = ?auto_193360 ?auto_193363 ) ) ( not ( = ?auto_193358 ?auto_193363 ) ) ( not ( = ?auto_193357 ?auto_193363 ) ) ( not ( = ?auto_193359 ?auto_193363 ) ) ( ON ?auto_193364 ?auto_193356 ) ( ON-TABLE ?auto_193363 ) ( ON ?auto_193359 ?auto_193364 ) ( ON ?auto_193357 ?auto_193359 ) ( CLEAR ?auto_193357 ) ( HOLDING ?auto_193358 ) ( CLEAR ?auto_193360 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193361 ?auto_193362 ?auto_193360 ?auto_193358 )
      ( MAKE-1PILE ?auto_193356 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193365 - BLOCK
    )
    :vars
    (
      ?auto_193373 - BLOCK
      ?auto_193366 - BLOCK
      ?auto_193369 - BLOCK
      ?auto_193370 - BLOCK
      ?auto_193372 - BLOCK
      ?auto_193368 - BLOCK
      ?auto_193367 - BLOCK
      ?auto_193371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193365 ?auto_193373 ) ) ( ON-TABLE ?auto_193366 ) ( ON ?auto_193369 ?auto_193366 ) ( ON ?auto_193370 ?auto_193369 ) ( not ( = ?auto_193366 ?auto_193369 ) ) ( not ( = ?auto_193366 ?auto_193370 ) ) ( not ( = ?auto_193366 ?auto_193372 ) ) ( not ( = ?auto_193366 ?auto_193368 ) ) ( not ( = ?auto_193366 ?auto_193367 ) ) ( not ( = ?auto_193366 ?auto_193373 ) ) ( not ( = ?auto_193366 ?auto_193365 ) ) ( not ( = ?auto_193369 ?auto_193370 ) ) ( not ( = ?auto_193369 ?auto_193372 ) ) ( not ( = ?auto_193369 ?auto_193368 ) ) ( not ( = ?auto_193369 ?auto_193367 ) ) ( not ( = ?auto_193369 ?auto_193373 ) ) ( not ( = ?auto_193369 ?auto_193365 ) ) ( not ( = ?auto_193370 ?auto_193372 ) ) ( not ( = ?auto_193370 ?auto_193368 ) ) ( not ( = ?auto_193370 ?auto_193367 ) ) ( not ( = ?auto_193370 ?auto_193373 ) ) ( not ( = ?auto_193370 ?auto_193365 ) ) ( not ( = ?auto_193372 ?auto_193368 ) ) ( not ( = ?auto_193372 ?auto_193367 ) ) ( not ( = ?auto_193372 ?auto_193373 ) ) ( not ( = ?auto_193372 ?auto_193365 ) ) ( not ( = ?auto_193368 ?auto_193367 ) ) ( not ( = ?auto_193368 ?auto_193373 ) ) ( not ( = ?auto_193368 ?auto_193365 ) ) ( not ( = ?auto_193367 ?auto_193373 ) ) ( not ( = ?auto_193367 ?auto_193365 ) ) ( ON ?auto_193365 ?auto_193371 ) ( not ( = ?auto_193365 ?auto_193371 ) ) ( not ( = ?auto_193373 ?auto_193371 ) ) ( not ( = ?auto_193366 ?auto_193371 ) ) ( not ( = ?auto_193369 ?auto_193371 ) ) ( not ( = ?auto_193370 ?auto_193371 ) ) ( not ( = ?auto_193372 ?auto_193371 ) ) ( not ( = ?auto_193368 ?auto_193371 ) ) ( not ( = ?auto_193367 ?auto_193371 ) ) ( ON ?auto_193373 ?auto_193365 ) ( ON-TABLE ?auto_193371 ) ( ON ?auto_193367 ?auto_193373 ) ( ON ?auto_193368 ?auto_193367 ) ( CLEAR ?auto_193370 ) ( ON ?auto_193372 ?auto_193368 ) ( CLEAR ?auto_193372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_193371 ?auto_193365 ?auto_193373 ?auto_193367 ?auto_193368 )
      ( MAKE-1PILE ?auto_193365 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193374 - BLOCK
    )
    :vars
    (
      ?auto_193381 - BLOCK
      ?auto_193380 - BLOCK
      ?auto_193379 - BLOCK
      ?auto_193377 - BLOCK
      ?auto_193375 - BLOCK
      ?auto_193382 - BLOCK
      ?auto_193376 - BLOCK
      ?auto_193378 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193374 ?auto_193381 ) ) ( ON-TABLE ?auto_193380 ) ( ON ?auto_193379 ?auto_193380 ) ( not ( = ?auto_193380 ?auto_193379 ) ) ( not ( = ?auto_193380 ?auto_193377 ) ) ( not ( = ?auto_193380 ?auto_193375 ) ) ( not ( = ?auto_193380 ?auto_193382 ) ) ( not ( = ?auto_193380 ?auto_193376 ) ) ( not ( = ?auto_193380 ?auto_193381 ) ) ( not ( = ?auto_193380 ?auto_193374 ) ) ( not ( = ?auto_193379 ?auto_193377 ) ) ( not ( = ?auto_193379 ?auto_193375 ) ) ( not ( = ?auto_193379 ?auto_193382 ) ) ( not ( = ?auto_193379 ?auto_193376 ) ) ( not ( = ?auto_193379 ?auto_193381 ) ) ( not ( = ?auto_193379 ?auto_193374 ) ) ( not ( = ?auto_193377 ?auto_193375 ) ) ( not ( = ?auto_193377 ?auto_193382 ) ) ( not ( = ?auto_193377 ?auto_193376 ) ) ( not ( = ?auto_193377 ?auto_193381 ) ) ( not ( = ?auto_193377 ?auto_193374 ) ) ( not ( = ?auto_193375 ?auto_193382 ) ) ( not ( = ?auto_193375 ?auto_193376 ) ) ( not ( = ?auto_193375 ?auto_193381 ) ) ( not ( = ?auto_193375 ?auto_193374 ) ) ( not ( = ?auto_193382 ?auto_193376 ) ) ( not ( = ?auto_193382 ?auto_193381 ) ) ( not ( = ?auto_193382 ?auto_193374 ) ) ( not ( = ?auto_193376 ?auto_193381 ) ) ( not ( = ?auto_193376 ?auto_193374 ) ) ( ON ?auto_193374 ?auto_193378 ) ( not ( = ?auto_193374 ?auto_193378 ) ) ( not ( = ?auto_193381 ?auto_193378 ) ) ( not ( = ?auto_193380 ?auto_193378 ) ) ( not ( = ?auto_193379 ?auto_193378 ) ) ( not ( = ?auto_193377 ?auto_193378 ) ) ( not ( = ?auto_193375 ?auto_193378 ) ) ( not ( = ?auto_193382 ?auto_193378 ) ) ( not ( = ?auto_193376 ?auto_193378 ) ) ( ON ?auto_193381 ?auto_193374 ) ( ON-TABLE ?auto_193378 ) ( ON ?auto_193376 ?auto_193381 ) ( ON ?auto_193382 ?auto_193376 ) ( ON ?auto_193375 ?auto_193382 ) ( CLEAR ?auto_193375 ) ( HOLDING ?auto_193377 ) ( CLEAR ?auto_193379 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_193380 ?auto_193379 ?auto_193377 )
      ( MAKE-1PILE ?auto_193374 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193383 - BLOCK
    )
    :vars
    (
      ?auto_193390 - BLOCK
      ?auto_193385 - BLOCK
      ?auto_193386 - BLOCK
      ?auto_193388 - BLOCK
      ?auto_193391 - BLOCK
      ?auto_193389 - BLOCK
      ?auto_193384 - BLOCK
      ?auto_193387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193383 ?auto_193390 ) ) ( ON-TABLE ?auto_193385 ) ( ON ?auto_193386 ?auto_193385 ) ( not ( = ?auto_193385 ?auto_193386 ) ) ( not ( = ?auto_193385 ?auto_193388 ) ) ( not ( = ?auto_193385 ?auto_193391 ) ) ( not ( = ?auto_193385 ?auto_193389 ) ) ( not ( = ?auto_193385 ?auto_193384 ) ) ( not ( = ?auto_193385 ?auto_193390 ) ) ( not ( = ?auto_193385 ?auto_193383 ) ) ( not ( = ?auto_193386 ?auto_193388 ) ) ( not ( = ?auto_193386 ?auto_193391 ) ) ( not ( = ?auto_193386 ?auto_193389 ) ) ( not ( = ?auto_193386 ?auto_193384 ) ) ( not ( = ?auto_193386 ?auto_193390 ) ) ( not ( = ?auto_193386 ?auto_193383 ) ) ( not ( = ?auto_193388 ?auto_193391 ) ) ( not ( = ?auto_193388 ?auto_193389 ) ) ( not ( = ?auto_193388 ?auto_193384 ) ) ( not ( = ?auto_193388 ?auto_193390 ) ) ( not ( = ?auto_193388 ?auto_193383 ) ) ( not ( = ?auto_193391 ?auto_193389 ) ) ( not ( = ?auto_193391 ?auto_193384 ) ) ( not ( = ?auto_193391 ?auto_193390 ) ) ( not ( = ?auto_193391 ?auto_193383 ) ) ( not ( = ?auto_193389 ?auto_193384 ) ) ( not ( = ?auto_193389 ?auto_193390 ) ) ( not ( = ?auto_193389 ?auto_193383 ) ) ( not ( = ?auto_193384 ?auto_193390 ) ) ( not ( = ?auto_193384 ?auto_193383 ) ) ( ON ?auto_193383 ?auto_193387 ) ( not ( = ?auto_193383 ?auto_193387 ) ) ( not ( = ?auto_193390 ?auto_193387 ) ) ( not ( = ?auto_193385 ?auto_193387 ) ) ( not ( = ?auto_193386 ?auto_193387 ) ) ( not ( = ?auto_193388 ?auto_193387 ) ) ( not ( = ?auto_193391 ?auto_193387 ) ) ( not ( = ?auto_193389 ?auto_193387 ) ) ( not ( = ?auto_193384 ?auto_193387 ) ) ( ON ?auto_193390 ?auto_193383 ) ( ON-TABLE ?auto_193387 ) ( ON ?auto_193384 ?auto_193390 ) ( ON ?auto_193389 ?auto_193384 ) ( ON ?auto_193391 ?auto_193389 ) ( CLEAR ?auto_193386 ) ( ON ?auto_193388 ?auto_193391 ) ( CLEAR ?auto_193388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193387 ?auto_193383 ?auto_193390 ?auto_193384 ?auto_193389 ?auto_193391 )
      ( MAKE-1PILE ?auto_193383 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193392 - BLOCK
    )
    :vars
    (
      ?auto_193393 - BLOCK
      ?auto_193399 - BLOCK
      ?auto_193396 - BLOCK
      ?auto_193398 - BLOCK
      ?auto_193397 - BLOCK
      ?auto_193394 - BLOCK
      ?auto_193395 - BLOCK
      ?auto_193400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193392 ?auto_193393 ) ) ( ON-TABLE ?auto_193399 ) ( not ( = ?auto_193399 ?auto_193396 ) ) ( not ( = ?auto_193399 ?auto_193398 ) ) ( not ( = ?auto_193399 ?auto_193397 ) ) ( not ( = ?auto_193399 ?auto_193394 ) ) ( not ( = ?auto_193399 ?auto_193395 ) ) ( not ( = ?auto_193399 ?auto_193393 ) ) ( not ( = ?auto_193399 ?auto_193392 ) ) ( not ( = ?auto_193396 ?auto_193398 ) ) ( not ( = ?auto_193396 ?auto_193397 ) ) ( not ( = ?auto_193396 ?auto_193394 ) ) ( not ( = ?auto_193396 ?auto_193395 ) ) ( not ( = ?auto_193396 ?auto_193393 ) ) ( not ( = ?auto_193396 ?auto_193392 ) ) ( not ( = ?auto_193398 ?auto_193397 ) ) ( not ( = ?auto_193398 ?auto_193394 ) ) ( not ( = ?auto_193398 ?auto_193395 ) ) ( not ( = ?auto_193398 ?auto_193393 ) ) ( not ( = ?auto_193398 ?auto_193392 ) ) ( not ( = ?auto_193397 ?auto_193394 ) ) ( not ( = ?auto_193397 ?auto_193395 ) ) ( not ( = ?auto_193397 ?auto_193393 ) ) ( not ( = ?auto_193397 ?auto_193392 ) ) ( not ( = ?auto_193394 ?auto_193395 ) ) ( not ( = ?auto_193394 ?auto_193393 ) ) ( not ( = ?auto_193394 ?auto_193392 ) ) ( not ( = ?auto_193395 ?auto_193393 ) ) ( not ( = ?auto_193395 ?auto_193392 ) ) ( ON ?auto_193392 ?auto_193400 ) ( not ( = ?auto_193392 ?auto_193400 ) ) ( not ( = ?auto_193393 ?auto_193400 ) ) ( not ( = ?auto_193399 ?auto_193400 ) ) ( not ( = ?auto_193396 ?auto_193400 ) ) ( not ( = ?auto_193398 ?auto_193400 ) ) ( not ( = ?auto_193397 ?auto_193400 ) ) ( not ( = ?auto_193394 ?auto_193400 ) ) ( not ( = ?auto_193395 ?auto_193400 ) ) ( ON ?auto_193393 ?auto_193392 ) ( ON-TABLE ?auto_193400 ) ( ON ?auto_193395 ?auto_193393 ) ( ON ?auto_193394 ?auto_193395 ) ( ON ?auto_193397 ?auto_193394 ) ( ON ?auto_193398 ?auto_193397 ) ( CLEAR ?auto_193398 ) ( HOLDING ?auto_193396 ) ( CLEAR ?auto_193399 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193399 ?auto_193396 )
      ( MAKE-1PILE ?auto_193392 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193401 - BLOCK
    )
    :vars
    (
      ?auto_193404 - BLOCK
      ?auto_193402 - BLOCK
      ?auto_193408 - BLOCK
      ?auto_193407 - BLOCK
      ?auto_193406 - BLOCK
      ?auto_193405 - BLOCK
      ?auto_193409 - BLOCK
      ?auto_193403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193401 ?auto_193404 ) ) ( ON-TABLE ?auto_193402 ) ( not ( = ?auto_193402 ?auto_193408 ) ) ( not ( = ?auto_193402 ?auto_193407 ) ) ( not ( = ?auto_193402 ?auto_193406 ) ) ( not ( = ?auto_193402 ?auto_193405 ) ) ( not ( = ?auto_193402 ?auto_193409 ) ) ( not ( = ?auto_193402 ?auto_193404 ) ) ( not ( = ?auto_193402 ?auto_193401 ) ) ( not ( = ?auto_193408 ?auto_193407 ) ) ( not ( = ?auto_193408 ?auto_193406 ) ) ( not ( = ?auto_193408 ?auto_193405 ) ) ( not ( = ?auto_193408 ?auto_193409 ) ) ( not ( = ?auto_193408 ?auto_193404 ) ) ( not ( = ?auto_193408 ?auto_193401 ) ) ( not ( = ?auto_193407 ?auto_193406 ) ) ( not ( = ?auto_193407 ?auto_193405 ) ) ( not ( = ?auto_193407 ?auto_193409 ) ) ( not ( = ?auto_193407 ?auto_193404 ) ) ( not ( = ?auto_193407 ?auto_193401 ) ) ( not ( = ?auto_193406 ?auto_193405 ) ) ( not ( = ?auto_193406 ?auto_193409 ) ) ( not ( = ?auto_193406 ?auto_193404 ) ) ( not ( = ?auto_193406 ?auto_193401 ) ) ( not ( = ?auto_193405 ?auto_193409 ) ) ( not ( = ?auto_193405 ?auto_193404 ) ) ( not ( = ?auto_193405 ?auto_193401 ) ) ( not ( = ?auto_193409 ?auto_193404 ) ) ( not ( = ?auto_193409 ?auto_193401 ) ) ( ON ?auto_193401 ?auto_193403 ) ( not ( = ?auto_193401 ?auto_193403 ) ) ( not ( = ?auto_193404 ?auto_193403 ) ) ( not ( = ?auto_193402 ?auto_193403 ) ) ( not ( = ?auto_193408 ?auto_193403 ) ) ( not ( = ?auto_193407 ?auto_193403 ) ) ( not ( = ?auto_193406 ?auto_193403 ) ) ( not ( = ?auto_193405 ?auto_193403 ) ) ( not ( = ?auto_193409 ?auto_193403 ) ) ( ON ?auto_193404 ?auto_193401 ) ( ON-TABLE ?auto_193403 ) ( ON ?auto_193409 ?auto_193404 ) ( ON ?auto_193405 ?auto_193409 ) ( ON ?auto_193406 ?auto_193405 ) ( ON ?auto_193407 ?auto_193406 ) ( CLEAR ?auto_193402 ) ( ON ?auto_193408 ?auto_193407 ) ( CLEAR ?auto_193408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193403 ?auto_193401 ?auto_193404 ?auto_193409 ?auto_193405 ?auto_193406 ?auto_193407 )
      ( MAKE-1PILE ?auto_193401 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193410 - BLOCK
    )
    :vars
    (
      ?auto_193411 - BLOCK
      ?auto_193417 - BLOCK
      ?auto_193413 - BLOCK
      ?auto_193414 - BLOCK
      ?auto_193416 - BLOCK
      ?auto_193415 - BLOCK
      ?auto_193412 - BLOCK
      ?auto_193418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193410 ?auto_193411 ) ) ( not ( = ?auto_193417 ?auto_193413 ) ) ( not ( = ?auto_193417 ?auto_193414 ) ) ( not ( = ?auto_193417 ?auto_193416 ) ) ( not ( = ?auto_193417 ?auto_193415 ) ) ( not ( = ?auto_193417 ?auto_193412 ) ) ( not ( = ?auto_193417 ?auto_193411 ) ) ( not ( = ?auto_193417 ?auto_193410 ) ) ( not ( = ?auto_193413 ?auto_193414 ) ) ( not ( = ?auto_193413 ?auto_193416 ) ) ( not ( = ?auto_193413 ?auto_193415 ) ) ( not ( = ?auto_193413 ?auto_193412 ) ) ( not ( = ?auto_193413 ?auto_193411 ) ) ( not ( = ?auto_193413 ?auto_193410 ) ) ( not ( = ?auto_193414 ?auto_193416 ) ) ( not ( = ?auto_193414 ?auto_193415 ) ) ( not ( = ?auto_193414 ?auto_193412 ) ) ( not ( = ?auto_193414 ?auto_193411 ) ) ( not ( = ?auto_193414 ?auto_193410 ) ) ( not ( = ?auto_193416 ?auto_193415 ) ) ( not ( = ?auto_193416 ?auto_193412 ) ) ( not ( = ?auto_193416 ?auto_193411 ) ) ( not ( = ?auto_193416 ?auto_193410 ) ) ( not ( = ?auto_193415 ?auto_193412 ) ) ( not ( = ?auto_193415 ?auto_193411 ) ) ( not ( = ?auto_193415 ?auto_193410 ) ) ( not ( = ?auto_193412 ?auto_193411 ) ) ( not ( = ?auto_193412 ?auto_193410 ) ) ( ON ?auto_193410 ?auto_193418 ) ( not ( = ?auto_193410 ?auto_193418 ) ) ( not ( = ?auto_193411 ?auto_193418 ) ) ( not ( = ?auto_193417 ?auto_193418 ) ) ( not ( = ?auto_193413 ?auto_193418 ) ) ( not ( = ?auto_193414 ?auto_193418 ) ) ( not ( = ?auto_193416 ?auto_193418 ) ) ( not ( = ?auto_193415 ?auto_193418 ) ) ( not ( = ?auto_193412 ?auto_193418 ) ) ( ON ?auto_193411 ?auto_193410 ) ( ON-TABLE ?auto_193418 ) ( ON ?auto_193412 ?auto_193411 ) ( ON ?auto_193415 ?auto_193412 ) ( ON ?auto_193416 ?auto_193415 ) ( ON ?auto_193414 ?auto_193416 ) ( ON ?auto_193413 ?auto_193414 ) ( CLEAR ?auto_193413 ) ( HOLDING ?auto_193417 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_193417 )
      ( MAKE-1PILE ?auto_193410 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_193419 - BLOCK
    )
    :vars
    (
      ?auto_193420 - BLOCK
      ?auto_193423 - BLOCK
      ?auto_193426 - BLOCK
      ?auto_193424 - BLOCK
      ?auto_193427 - BLOCK
      ?auto_193422 - BLOCK
      ?auto_193425 - BLOCK
      ?auto_193421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193419 ?auto_193420 ) ) ( not ( = ?auto_193423 ?auto_193426 ) ) ( not ( = ?auto_193423 ?auto_193424 ) ) ( not ( = ?auto_193423 ?auto_193427 ) ) ( not ( = ?auto_193423 ?auto_193422 ) ) ( not ( = ?auto_193423 ?auto_193425 ) ) ( not ( = ?auto_193423 ?auto_193420 ) ) ( not ( = ?auto_193423 ?auto_193419 ) ) ( not ( = ?auto_193426 ?auto_193424 ) ) ( not ( = ?auto_193426 ?auto_193427 ) ) ( not ( = ?auto_193426 ?auto_193422 ) ) ( not ( = ?auto_193426 ?auto_193425 ) ) ( not ( = ?auto_193426 ?auto_193420 ) ) ( not ( = ?auto_193426 ?auto_193419 ) ) ( not ( = ?auto_193424 ?auto_193427 ) ) ( not ( = ?auto_193424 ?auto_193422 ) ) ( not ( = ?auto_193424 ?auto_193425 ) ) ( not ( = ?auto_193424 ?auto_193420 ) ) ( not ( = ?auto_193424 ?auto_193419 ) ) ( not ( = ?auto_193427 ?auto_193422 ) ) ( not ( = ?auto_193427 ?auto_193425 ) ) ( not ( = ?auto_193427 ?auto_193420 ) ) ( not ( = ?auto_193427 ?auto_193419 ) ) ( not ( = ?auto_193422 ?auto_193425 ) ) ( not ( = ?auto_193422 ?auto_193420 ) ) ( not ( = ?auto_193422 ?auto_193419 ) ) ( not ( = ?auto_193425 ?auto_193420 ) ) ( not ( = ?auto_193425 ?auto_193419 ) ) ( ON ?auto_193419 ?auto_193421 ) ( not ( = ?auto_193419 ?auto_193421 ) ) ( not ( = ?auto_193420 ?auto_193421 ) ) ( not ( = ?auto_193423 ?auto_193421 ) ) ( not ( = ?auto_193426 ?auto_193421 ) ) ( not ( = ?auto_193424 ?auto_193421 ) ) ( not ( = ?auto_193427 ?auto_193421 ) ) ( not ( = ?auto_193422 ?auto_193421 ) ) ( not ( = ?auto_193425 ?auto_193421 ) ) ( ON ?auto_193420 ?auto_193419 ) ( ON-TABLE ?auto_193421 ) ( ON ?auto_193425 ?auto_193420 ) ( ON ?auto_193422 ?auto_193425 ) ( ON ?auto_193427 ?auto_193422 ) ( ON ?auto_193424 ?auto_193427 ) ( ON ?auto_193426 ?auto_193424 ) ( ON ?auto_193423 ?auto_193426 ) ( CLEAR ?auto_193423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193421 ?auto_193419 ?auto_193420 ?auto_193425 ?auto_193422 ?auto_193427 ?auto_193424 ?auto_193426 )
      ( MAKE-1PILE ?auto_193419 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193434 - BLOCK
      ?auto_193435 - BLOCK
      ?auto_193436 - BLOCK
      ?auto_193437 - BLOCK
      ?auto_193438 - BLOCK
      ?auto_193439 - BLOCK
    )
    :vars
    (
      ?auto_193440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193440 ?auto_193439 ) ( CLEAR ?auto_193440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193434 ) ( ON ?auto_193435 ?auto_193434 ) ( ON ?auto_193436 ?auto_193435 ) ( ON ?auto_193437 ?auto_193436 ) ( ON ?auto_193438 ?auto_193437 ) ( ON ?auto_193439 ?auto_193438 ) ( not ( = ?auto_193434 ?auto_193435 ) ) ( not ( = ?auto_193434 ?auto_193436 ) ) ( not ( = ?auto_193434 ?auto_193437 ) ) ( not ( = ?auto_193434 ?auto_193438 ) ) ( not ( = ?auto_193434 ?auto_193439 ) ) ( not ( = ?auto_193434 ?auto_193440 ) ) ( not ( = ?auto_193435 ?auto_193436 ) ) ( not ( = ?auto_193435 ?auto_193437 ) ) ( not ( = ?auto_193435 ?auto_193438 ) ) ( not ( = ?auto_193435 ?auto_193439 ) ) ( not ( = ?auto_193435 ?auto_193440 ) ) ( not ( = ?auto_193436 ?auto_193437 ) ) ( not ( = ?auto_193436 ?auto_193438 ) ) ( not ( = ?auto_193436 ?auto_193439 ) ) ( not ( = ?auto_193436 ?auto_193440 ) ) ( not ( = ?auto_193437 ?auto_193438 ) ) ( not ( = ?auto_193437 ?auto_193439 ) ) ( not ( = ?auto_193437 ?auto_193440 ) ) ( not ( = ?auto_193438 ?auto_193439 ) ) ( not ( = ?auto_193438 ?auto_193440 ) ) ( not ( = ?auto_193439 ?auto_193440 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_193440 ?auto_193439 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193441 - BLOCK
      ?auto_193442 - BLOCK
      ?auto_193443 - BLOCK
      ?auto_193444 - BLOCK
      ?auto_193445 - BLOCK
      ?auto_193446 - BLOCK
    )
    :vars
    (
      ?auto_193447 - BLOCK
      ?auto_193448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193447 ?auto_193446 ) ( CLEAR ?auto_193447 ) ( ON-TABLE ?auto_193441 ) ( ON ?auto_193442 ?auto_193441 ) ( ON ?auto_193443 ?auto_193442 ) ( ON ?auto_193444 ?auto_193443 ) ( ON ?auto_193445 ?auto_193444 ) ( ON ?auto_193446 ?auto_193445 ) ( not ( = ?auto_193441 ?auto_193442 ) ) ( not ( = ?auto_193441 ?auto_193443 ) ) ( not ( = ?auto_193441 ?auto_193444 ) ) ( not ( = ?auto_193441 ?auto_193445 ) ) ( not ( = ?auto_193441 ?auto_193446 ) ) ( not ( = ?auto_193441 ?auto_193447 ) ) ( not ( = ?auto_193442 ?auto_193443 ) ) ( not ( = ?auto_193442 ?auto_193444 ) ) ( not ( = ?auto_193442 ?auto_193445 ) ) ( not ( = ?auto_193442 ?auto_193446 ) ) ( not ( = ?auto_193442 ?auto_193447 ) ) ( not ( = ?auto_193443 ?auto_193444 ) ) ( not ( = ?auto_193443 ?auto_193445 ) ) ( not ( = ?auto_193443 ?auto_193446 ) ) ( not ( = ?auto_193443 ?auto_193447 ) ) ( not ( = ?auto_193444 ?auto_193445 ) ) ( not ( = ?auto_193444 ?auto_193446 ) ) ( not ( = ?auto_193444 ?auto_193447 ) ) ( not ( = ?auto_193445 ?auto_193446 ) ) ( not ( = ?auto_193445 ?auto_193447 ) ) ( not ( = ?auto_193446 ?auto_193447 ) ) ( HOLDING ?auto_193448 ) ( not ( = ?auto_193441 ?auto_193448 ) ) ( not ( = ?auto_193442 ?auto_193448 ) ) ( not ( = ?auto_193443 ?auto_193448 ) ) ( not ( = ?auto_193444 ?auto_193448 ) ) ( not ( = ?auto_193445 ?auto_193448 ) ) ( not ( = ?auto_193446 ?auto_193448 ) ) ( not ( = ?auto_193447 ?auto_193448 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_193448 )
      ( MAKE-6PILE ?auto_193441 ?auto_193442 ?auto_193443 ?auto_193444 ?auto_193445 ?auto_193446 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193449 - BLOCK
      ?auto_193450 - BLOCK
      ?auto_193451 - BLOCK
      ?auto_193452 - BLOCK
      ?auto_193453 - BLOCK
      ?auto_193454 - BLOCK
    )
    :vars
    (
      ?auto_193455 - BLOCK
      ?auto_193456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193455 ?auto_193454 ) ( ON-TABLE ?auto_193449 ) ( ON ?auto_193450 ?auto_193449 ) ( ON ?auto_193451 ?auto_193450 ) ( ON ?auto_193452 ?auto_193451 ) ( ON ?auto_193453 ?auto_193452 ) ( ON ?auto_193454 ?auto_193453 ) ( not ( = ?auto_193449 ?auto_193450 ) ) ( not ( = ?auto_193449 ?auto_193451 ) ) ( not ( = ?auto_193449 ?auto_193452 ) ) ( not ( = ?auto_193449 ?auto_193453 ) ) ( not ( = ?auto_193449 ?auto_193454 ) ) ( not ( = ?auto_193449 ?auto_193455 ) ) ( not ( = ?auto_193450 ?auto_193451 ) ) ( not ( = ?auto_193450 ?auto_193452 ) ) ( not ( = ?auto_193450 ?auto_193453 ) ) ( not ( = ?auto_193450 ?auto_193454 ) ) ( not ( = ?auto_193450 ?auto_193455 ) ) ( not ( = ?auto_193451 ?auto_193452 ) ) ( not ( = ?auto_193451 ?auto_193453 ) ) ( not ( = ?auto_193451 ?auto_193454 ) ) ( not ( = ?auto_193451 ?auto_193455 ) ) ( not ( = ?auto_193452 ?auto_193453 ) ) ( not ( = ?auto_193452 ?auto_193454 ) ) ( not ( = ?auto_193452 ?auto_193455 ) ) ( not ( = ?auto_193453 ?auto_193454 ) ) ( not ( = ?auto_193453 ?auto_193455 ) ) ( not ( = ?auto_193454 ?auto_193455 ) ) ( not ( = ?auto_193449 ?auto_193456 ) ) ( not ( = ?auto_193450 ?auto_193456 ) ) ( not ( = ?auto_193451 ?auto_193456 ) ) ( not ( = ?auto_193452 ?auto_193456 ) ) ( not ( = ?auto_193453 ?auto_193456 ) ) ( not ( = ?auto_193454 ?auto_193456 ) ) ( not ( = ?auto_193455 ?auto_193456 ) ) ( ON ?auto_193456 ?auto_193455 ) ( CLEAR ?auto_193456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193449 ?auto_193450 ?auto_193451 ?auto_193452 ?auto_193453 ?auto_193454 ?auto_193455 )
      ( MAKE-6PILE ?auto_193449 ?auto_193450 ?auto_193451 ?auto_193452 ?auto_193453 ?auto_193454 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193457 - BLOCK
      ?auto_193458 - BLOCK
      ?auto_193459 - BLOCK
      ?auto_193460 - BLOCK
      ?auto_193461 - BLOCK
      ?auto_193462 - BLOCK
    )
    :vars
    (
      ?auto_193463 - BLOCK
      ?auto_193464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193463 ?auto_193462 ) ( ON-TABLE ?auto_193457 ) ( ON ?auto_193458 ?auto_193457 ) ( ON ?auto_193459 ?auto_193458 ) ( ON ?auto_193460 ?auto_193459 ) ( ON ?auto_193461 ?auto_193460 ) ( ON ?auto_193462 ?auto_193461 ) ( not ( = ?auto_193457 ?auto_193458 ) ) ( not ( = ?auto_193457 ?auto_193459 ) ) ( not ( = ?auto_193457 ?auto_193460 ) ) ( not ( = ?auto_193457 ?auto_193461 ) ) ( not ( = ?auto_193457 ?auto_193462 ) ) ( not ( = ?auto_193457 ?auto_193463 ) ) ( not ( = ?auto_193458 ?auto_193459 ) ) ( not ( = ?auto_193458 ?auto_193460 ) ) ( not ( = ?auto_193458 ?auto_193461 ) ) ( not ( = ?auto_193458 ?auto_193462 ) ) ( not ( = ?auto_193458 ?auto_193463 ) ) ( not ( = ?auto_193459 ?auto_193460 ) ) ( not ( = ?auto_193459 ?auto_193461 ) ) ( not ( = ?auto_193459 ?auto_193462 ) ) ( not ( = ?auto_193459 ?auto_193463 ) ) ( not ( = ?auto_193460 ?auto_193461 ) ) ( not ( = ?auto_193460 ?auto_193462 ) ) ( not ( = ?auto_193460 ?auto_193463 ) ) ( not ( = ?auto_193461 ?auto_193462 ) ) ( not ( = ?auto_193461 ?auto_193463 ) ) ( not ( = ?auto_193462 ?auto_193463 ) ) ( not ( = ?auto_193457 ?auto_193464 ) ) ( not ( = ?auto_193458 ?auto_193464 ) ) ( not ( = ?auto_193459 ?auto_193464 ) ) ( not ( = ?auto_193460 ?auto_193464 ) ) ( not ( = ?auto_193461 ?auto_193464 ) ) ( not ( = ?auto_193462 ?auto_193464 ) ) ( not ( = ?auto_193463 ?auto_193464 ) ) ( HOLDING ?auto_193464 ) ( CLEAR ?auto_193463 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193457 ?auto_193458 ?auto_193459 ?auto_193460 ?auto_193461 ?auto_193462 ?auto_193463 ?auto_193464 )
      ( MAKE-6PILE ?auto_193457 ?auto_193458 ?auto_193459 ?auto_193460 ?auto_193461 ?auto_193462 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193465 - BLOCK
      ?auto_193466 - BLOCK
      ?auto_193467 - BLOCK
      ?auto_193468 - BLOCK
      ?auto_193469 - BLOCK
      ?auto_193470 - BLOCK
    )
    :vars
    (
      ?auto_193472 - BLOCK
      ?auto_193471 - BLOCK
      ?auto_193473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193472 ?auto_193470 ) ( ON-TABLE ?auto_193465 ) ( ON ?auto_193466 ?auto_193465 ) ( ON ?auto_193467 ?auto_193466 ) ( ON ?auto_193468 ?auto_193467 ) ( ON ?auto_193469 ?auto_193468 ) ( ON ?auto_193470 ?auto_193469 ) ( not ( = ?auto_193465 ?auto_193466 ) ) ( not ( = ?auto_193465 ?auto_193467 ) ) ( not ( = ?auto_193465 ?auto_193468 ) ) ( not ( = ?auto_193465 ?auto_193469 ) ) ( not ( = ?auto_193465 ?auto_193470 ) ) ( not ( = ?auto_193465 ?auto_193472 ) ) ( not ( = ?auto_193466 ?auto_193467 ) ) ( not ( = ?auto_193466 ?auto_193468 ) ) ( not ( = ?auto_193466 ?auto_193469 ) ) ( not ( = ?auto_193466 ?auto_193470 ) ) ( not ( = ?auto_193466 ?auto_193472 ) ) ( not ( = ?auto_193467 ?auto_193468 ) ) ( not ( = ?auto_193467 ?auto_193469 ) ) ( not ( = ?auto_193467 ?auto_193470 ) ) ( not ( = ?auto_193467 ?auto_193472 ) ) ( not ( = ?auto_193468 ?auto_193469 ) ) ( not ( = ?auto_193468 ?auto_193470 ) ) ( not ( = ?auto_193468 ?auto_193472 ) ) ( not ( = ?auto_193469 ?auto_193470 ) ) ( not ( = ?auto_193469 ?auto_193472 ) ) ( not ( = ?auto_193470 ?auto_193472 ) ) ( not ( = ?auto_193465 ?auto_193471 ) ) ( not ( = ?auto_193466 ?auto_193471 ) ) ( not ( = ?auto_193467 ?auto_193471 ) ) ( not ( = ?auto_193468 ?auto_193471 ) ) ( not ( = ?auto_193469 ?auto_193471 ) ) ( not ( = ?auto_193470 ?auto_193471 ) ) ( not ( = ?auto_193472 ?auto_193471 ) ) ( CLEAR ?auto_193472 ) ( ON ?auto_193471 ?auto_193473 ) ( CLEAR ?auto_193471 ) ( HAND-EMPTY ) ( not ( = ?auto_193465 ?auto_193473 ) ) ( not ( = ?auto_193466 ?auto_193473 ) ) ( not ( = ?auto_193467 ?auto_193473 ) ) ( not ( = ?auto_193468 ?auto_193473 ) ) ( not ( = ?auto_193469 ?auto_193473 ) ) ( not ( = ?auto_193470 ?auto_193473 ) ) ( not ( = ?auto_193472 ?auto_193473 ) ) ( not ( = ?auto_193471 ?auto_193473 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_193471 ?auto_193473 )
      ( MAKE-6PILE ?auto_193465 ?auto_193466 ?auto_193467 ?auto_193468 ?auto_193469 ?auto_193470 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193492 - BLOCK
      ?auto_193493 - BLOCK
      ?auto_193494 - BLOCK
      ?auto_193495 - BLOCK
      ?auto_193496 - BLOCK
      ?auto_193497 - BLOCK
    )
    :vars
    (
      ?auto_193499 - BLOCK
      ?auto_193500 - BLOCK
      ?auto_193498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193492 ) ( ON ?auto_193493 ?auto_193492 ) ( ON ?auto_193494 ?auto_193493 ) ( ON ?auto_193495 ?auto_193494 ) ( ON ?auto_193496 ?auto_193495 ) ( not ( = ?auto_193492 ?auto_193493 ) ) ( not ( = ?auto_193492 ?auto_193494 ) ) ( not ( = ?auto_193492 ?auto_193495 ) ) ( not ( = ?auto_193492 ?auto_193496 ) ) ( not ( = ?auto_193492 ?auto_193497 ) ) ( not ( = ?auto_193492 ?auto_193499 ) ) ( not ( = ?auto_193493 ?auto_193494 ) ) ( not ( = ?auto_193493 ?auto_193495 ) ) ( not ( = ?auto_193493 ?auto_193496 ) ) ( not ( = ?auto_193493 ?auto_193497 ) ) ( not ( = ?auto_193493 ?auto_193499 ) ) ( not ( = ?auto_193494 ?auto_193495 ) ) ( not ( = ?auto_193494 ?auto_193496 ) ) ( not ( = ?auto_193494 ?auto_193497 ) ) ( not ( = ?auto_193494 ?auto_193499 ) ) ( not ( = ?auto_193495 ?auto_193496 ) ) ( not ( = ?auto_193495 ?auto_193497 ) ) ( not ( = ?auto_193495 ?auto_193499 ) ) ( not ( = ?auto_193496 ?auto_193497 ) ) ( not ( = ?auto_193496 ?auto_193499 ) ) ( not ( = ?auto_193497 ?auto_193499 ) ) ( not ( = ?auto_193492 ?auto_193500 ) ) ( not ( = ?auto_193493 ?auto_193500 ) ) ( not ( = ?auto_193494 ?auto_193500 ) ) ( not ( = ?auto_193495 ?auto_193500 ) ) ( not ( = ?auto_193496 ?auto_193500 ) ) ( not ( = ?auto_193497 ?auto_193500 ) ) ( not ( = ?auto_193499 ?auto_193500 ) ) ( ON ?auto_193500 ?auto_193498 ) ( not ( = ?auto_193492 ?auto_193498 ) ) ( not ( = ?auto_193493 ?auto_193498 ) ) ( not ( = ?auto_193494 ?auto_193498 ) ) ( not ( = ?auto_193495 ?auto_193498 ) ) ( not ( = ?auto_193496 ?auto_193498 ) ) ( not ( = ?auto_193497 ?auto_193498 ) ) ( not ( = ?auto_193499 ?auto_193498 ) ) ( not ( = ?auto_193500 ?auto_193498 ) ) ( ON ?auto_193499 ?auto_193500 ) ( CLEAR ?auto_193499 ) ( HOLDING ?auto_193497 ) ( CLEAR ?auto_193496 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193492 ?auto_193493 ?auto_193494 ?auto_193495 ?auto_193496 ?auto_193497 ?auto_193499 )
      ( MAKE-6PILE ?auto_193492 ?auto_193493 ?auto_193494 ?auto_193495 ?auto_193496 ?auto_193497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193501 - BLOCK
      ?auto_193502 - BLOCK
      ?auto_193503 - BLOCK
      ?auto_193504 - BLOCK
      ?auto_193505 - BLOCK
      ?auto_193506 - BLOCK
    )
    :vars
    (
      ?auto_193509 - BLOCK
      ?auto_193508 - BLOCK
      ?auto_193507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193501 ) ( ON ?auto_193502 ?auto_193501 ) ( ON ?auto_193503 ?auto_193502 ) ( ON ?auto_193504 ?auto_193503 ) ( ON ?auto_193505 ?auto_193504 ) ( not ( = ?auto_193501 ?auto_193502 ) ) ( not ( = ?auto_193501 ?auto_193503 ) ) ( not ( = ?auto_193501 ?auto_193504 ) ) ( not ( = ?auto_193501 ?auto_193505 ) ) ( not ( = ?auto_193501 ?auto_193506 ) ) ( not ( = ?auto_193501 ?auto_193509 ) ) ( not ( = ?auto_193502 ?auto_193503 ) ) ( not ( = ?auto_193502 ?auto_193504 ) ) ( not ( = ?auto_193502 ?auto_193505 ) ) ( not ( = ?auto_193502 ?auto_193506 ) ) ( not ( = ?auto_193502 ?auto_193509 ) ) ( not ( = ?auto_193503 ?auto_193504 ) ) ( not ( = ?auto_193503 ?auto_193505 ) ) ( not ( = ?auto_193503 ?auto_193506 ) ) ( not ( = ?auto_193503 ?auto_193509 ) ) ( not ( = ?auto_193504 ?auto_193505 ) ) ( not ( = ?auto_193504 ?auto_193506 ) ) ( not ( = ?auto_193504 ?auto_193509 ) ) ( not ( = ?auto_193505 ?auto_193506 ) ) ( not ( = ?auto_193505 ?auto_193509 ) ) ( not ( = ?auto_193506 ?auto_193509 ) ) ( not ( = ?auto_193501 ?auto_193508 ) ) ( not ( = ?auto_193502 ?auto_193508 ) ) ( not ( = ?auto_193503 ?auto_193508 ) ) ( not ( = ?auto_193504 ?auto_193508 ) ) ( not ( = ?auto_193505 ?auto_193508 ) ) ( not ( = ?auto_193506 ?auto_193508 ) ) ( not ( = ?auto_193509 ?auto_193508 ) ) ( ON ?auto_193508 ?auto_193507 ) ( not ( = ?auto_193501 ?auto_193507 ) ) ( not ( = ?auto_193502 ?auto_193507 ) ) ( not ( = ?auto_193503 ?auto_193507 ) ) ( not ( = ?auto_193504 ?auto_193507 ) ) ( not ( = ?auto_193505 ?auto_193507 ) ) ( not ( = ?auto_193506 ?auto_193507 ) ) ( not ( = ?auto_193509 ?auto_193507 ) ) ( not ( = ?auto_193508 ?auto_193507 ) ) ( ON ?auto_193509 ?auto_193508 ) ( CLEAR ?auto_193505 ) ( ON ?auto_193506 ?auto_193509 ) ( CLEAR ?auto_193506 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193507 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_193507 ?auto_193508 ?auto_193509 )
      ( MAKE-6PILE ?auto_193501 ?auto_193502 ?auto_193503 ?auto_193504 ?auto_193505 ?auto_193506 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193510 - BLOCK
      ?auto_193511 - BLOCK
      ?auto_193512 - BLOCK
      ?auto_193513 - BLOCK
      ?auto_193514 - BLOCK
      ?auto_193515 - BLOCK
    )
    :vars
    (
      ?auto_193516 - BLOCK
      ?auto_193517 - BLOCK
      ?auto_193518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193510 ) ( ON ?auto_193511 ?auto_193510 ) ( ON ?auto_193512 ?auto_193511 ) ( ON ?auto_193513 ?auto_193512 ) ( not ( = ?auto_193510 ?auto_193511 ) ) ( not ( = ?auto_193510 ?auto_193512 ) ) ( not ( = ?auto_193510 ?auto_193513 ) ) ( not ( = ?auto_193510 ?auto_193514 ) ) ( not ( = ?auto_193510 ?auto_193515 ) ) ( not ( = ?auto_193510 ?auto_193516 ) ) ( not ( = ?auto_193511 ?auto_193512 ) ) ( not ( = ?auto_193511 ?auto_193513 ) ) ( not ( = ?auto_193511 ?auto_193514 ) ) ( not ( = ?auto_193511 ?auto_193515 ) ) ( not ( = ?auto_193511 ?auto_193516 ) ) ( not ( = ?auto_193512 ?auto_193513 ) ) ( not ( = ?auto_193512 ?auto_193514 ) ) ( not ( = ?auto_193512 ?auto_193515 ) ) ( not ( = ?auto_193512 ?auto_193516 ) ) ( not ( = ?auto_193513 ?auto_193514 ) ) ( not ( = ?auto_193513 ?auto_193515 ) ) ( not ( = ?auto_193513 ?auto_193516 ) ) ( not ( = ?auto_193514 ?auto_193515 ) ) ( not ( = ?auto_193514 ?auto_193516 ) ) ( not ( = ?auto_193515 ?auto_193516 ) ) ( not ( = ?auto_193510 ?auto_193517 ) ) ( not ( = ?auto_193511 ?auto_193517 ) ) ( not ( = ?auto_193512 ?auto_193517 ) ) ( not ( = ?auto_193513 ?auto_193517 ) ) ( not ( = ?auto_193514 ?auto_193517 ) ) ( not ( = ?auto_193515 ?auto_193517 ) ) ( not ( = ?auto_193516 ?auto_193517 ) ) ( ON ?auto_193517 ?auto_193518 ) ( not ( = ?auto_193510 ?auto_193518 ) ) ( not ( = ?auto_193511 ?auto_193518 ) ) ( not ( = ?auto_193512 ?auto_193518 ) ) ( not ( = ?auto_193513 ?auto_193518 ) ) ( not ( = ?auto_193514 ?auto_193518 ) ) ( not ( = ?auto_193515 ?auto_193518 ) ) ( not ( = ?auto_193516 ?auto_193518 ) ) ( not ( = ?auto_193517 ?auto_193518 ) ) ( ON ?auto_193516 ?auto_193517 ) ( ON ?auto_193515 ?auto_193516 ) ( CLEAR ?auto_193515 ) ( ON-TABLE ?auto_193518 ) ( HOLDING ?auto_193514 ) ( CLEAR ?auto_193513 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_193510 ?auto_193511 ?auto_193512 ?auto_193513 ?auto_193514 )
      ( MAKE-6PILE ?auto_193510 ?auto_193511 ?auto_193512 ?auto_193513 ?auto_193514 ?auto_193515 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193519 - BLOCK
      ?auto_193520 - BLOCK
      ?auto_193521 - BLOCK
      ?auto_193522 - BLOCK
      ?auto_193523 - BLOCK
      ?auto_193524 - BLOCK
    )
    :vars
    (
      ?auto_193526 - BLOCK
      ?auto_193525 - BLOCK
      ?auto_193527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193519 ) ( ON ?auto_193520 ?auto_193519 ) ( ON ?auto_193521 ?auto_193520 ) ( ON ?auto_193522 ?auto_193521 ) ( not ( = ?auto_193519 ?auto_193520 ) ) ( not ( = ?auto_193519 ?auto_193521 ) ) ( not ( = ?auto_193519 ?auto_193522 ) ) ( not ( = ?auto_193519 ?auto_193523 ) ) ( not ( = ?auto_193519 ?auto_193524 ) ) ( not ( = ?auto_193519 ?auto_193526 ) ) ( not ( = ?auto_193520 ?auto_193521 ) ) ( not ( = ?auto_193520 ?auto_193522 ) ) ( not ( = ?auto_193520 ?auto_193523 ) ) ( not ( = ?auto_193520 ?auto_193524 ) ) ( not ( = ?auto_193520 ?auto_193526 ) ) ( not ( = ?auto_193521 ?auto_193522 ) ) ( not ( = ?auto_193521 ?auto_193523 ) ) ( not ( = ?auto_193521 ?auto_193524 ) ) ( not ( = ?auto_193521 ?auto_193526 ) ) ( not ( = ?auto_193522 ?auto_193523 ) ) ( not ( = ?auto_193522 ?auto_193524 ) ) ( not ( = ?auto_193522 ?auto_193526 ) ) ( not ( = ?auto_193523 ?auto_193524 ) ) ( not ( = ?auto_193523 ?auto_193526 ) ) ( not ( = ?auto_193524 ?auto_193526 ) ) ( not ( = ?auto_193519 ?auto_193525 ) ) ( not ( = ?auto_193520 ?auto_193525 ) ) ( not ( = ?auto_193521 ?auto_193525 ) ) ( not ( = ?auto_193522 ?auto_193525 ) ) ( not ( = ?auto_193523 ?auto_193525 ) ) ( not ( = ?auto_193524 ?auto_193525 ) ) ( not ( = ?auto_193526 ?auto_193525 ) ) ( ON ?auto_193525 ?auto_193527 ) ( not ( = ?auto_193519 ?auto_193527 ) ) ( not ( = ?auto_193520 ?auto_193527 ) ) ( not ( = ?auto_193521 ?auto_193527 ) ) ( not ( = ?auto_193522 ?auto_193527 ) ) ( not ( = ?auto_193523 ?auto_193527 ) ) ( not ( = ?auto_193524 ?auto_193527 ) ) ( not ( = ?auto_193526 ?auto_193527 ) ) ( not ( = ?auto_193525 ?auto_193527 ) ) ( ON ?auto_193526 ?auto_193525 ) ( ON ?auto_193524 ?auto_193526 ) ( ON-TABLE ?auto_193527 ) ( CLEAR ?auto_193522 ) ( ON ?auto_193523 ?auto_193524 ) ( CLEAR ?auto_193523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193527 ?auto_193525 ?auto_193526 ?auto_193524 )
      ( MAKE-6PILE ?auto_193519 ?auto_193520 ?auto_193521 ?auto_193522 ?auto_193523 ?auto_193524 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193528 - BLOCK
      ?auto_193529 - BLOCK
      ?auto_193530 - BLOCK
      ?auto_193531 - BLOCK
      ?auto_193532 - BLOCK
      ?auto_193533 - BLOCK
    )
    :vars
    (
      ?auto_193534 - BLOCK
      ?auto_193535 - BLOCK
      ?auto_193536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193528 ) ( ON ?auto_193529 ?auto_193528 ) ( ON ?auto_193530 ?auto_193529 ) ( not ( = ?auto_193528 ?auto_193529 ) ) ( not ( = ?auto_193528 ?auto_193530 ) ) ( not ( = ?auto_193528 ?auto_193531 ) ) ( not ( = ?auto_193528 ?auto_193532 ) ) ( not ( = ?auto_193528 ?auto_193533 ) ) ( not ( = ?auto_193528 ?auto_193534 ) ) ( not ( = ?auto_193529 ?auto_193530 ) ) ( not ( = ?auto_193529 ?auto_193531 ) ) ( not ( = ?auto_193529 ?auto_193532 ) ) ( not ( = ?auto_193529 ?auto_193533 ) ) ( not ( = ?auto_193529 ?auto_193534 ) ) ( not ( = ?auto_193530 ?auto_193531 ) ) ( not ( = ?auto_193530 ?auto_193532 ) ) ( not ( = ?auto_193530 ?auto_193533 ) ) ( not ( = ?auto_193530 ?auto_193534 ) ) ( not ( = ?auto_193531 ?auto_193532 ) ) ( not ( = ?auto_193531 ?auto_193533 ) ) ( not ( = ?auto_193531 ?auto_193534 ) ) ( not ( = ?auto_193532 ?auto_193533 ) ) ( not ( = ?auto_193532 ?auto_193534 ) ) ( not ( = ?auto_193533 ?auto_193534 ) ) ( not ( = ?auto_193528 ?auto_193535 ) ) ( not ( = ?auto_193529 ?auto_193535 ) ) ( not ( = ?auto_193530 ?auto_193535 ) ) ( not ( = ?auto_193531 ?auto_193535 ) ) ( not ( = ?auto_193532 ?auto_193535 ) ) ( not ( = ?auto_193533 ?auto_193535 ) ) ( not ( = ?auto_193534 ?auto_193535 ) ) ( ON ?auto_193535 ?auto_193536 ) ( not ( = ?auto_193528 ?auto_193536 ) ) ( not ( = ?auto_193529 ?auto_193536 ) ) ( not ( = ?auto_193530 ?auto_193536 ) ) ( not ( = ?auto_193531 ?auto_193536 ) ) ( not ( = ?auto_193532 ?auto_193536 ) ) ( not ( = ?auto_193533 ?auto_193536 ) ) ( not ( = ?auto_193534 ?auto_193536 ) ) ( not ( = ?auto_193535 ?auto_193536 ) ) ( ON ?auto_193534 ?auto_193535 ) ( ON ?auto_193533 ?auto_193534 ) ( ON-TABLE ?auto_193536 ) ( ON ?auto_193532 ?auto_193533 ) ( CLEAR ?auto_193532 ) ( HOLDING ?auto_193531 ) ( CLEAR ?auto_193530 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193528 ?auto_193529 ?auto_193530 ?auto_193531 )
      ( MAKE-6PILE ?auto_193528 ?auto_193529 ?auto_193530 ?auto_193531 ?auto_193532 ?auto_193533 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193537 - BLOCK
      ?auto_193538 - BLOCK
      ?auto_193539 - BLOCK
      ?auto_193540 - BLOCK
      ?auto_193541 - BLOCK
      ?auto_193542 - BLOCK
    )
    :vars
    (
      ?auto_193544 - BLOCK
      ?auto_193543 - BLOCK
      ?auto_193545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193537 ) ( ON ?auto_193538 ?auto_193537 ) ( ON ?auto_193539 ?auto_193538 ) ( not ( = ?auto_193537 ?auto_193538 ) ) ( not ( = ?auto_193537 ?auto_193539 ) ) ( not ( = ?auto_193537 ?auto_193540 ) ) ( not ( = ?auto_193537 ?auto_193541 ) ) ( not ( = ?auto_193537 ?auto_193542 ) ) ( not ( = ?auto_193537 ?auto_193544 ) ) ( not ( = ?auto_193538 ?auto_193539 ) ) ( not ( = ?auto_193538 ?auto_193540 ) ) ( not ( = ?auto_193538 ?auto_193541 ) ) ( not ( = ?auto_193538 ?auto_193542 ) ) ( not ( = ?auto_193538 ?auto_193544 ) ) ( not ( = ?auto_193539 ?auto_193540 ) ) ( not ( = ?auto_193539 ?auto_193541 ) ) ( not ( = ?auto_193539 ?auto_193542 ) ) ( not ( = ?auto_193539 ?auto_193544 ) ) ( not ( = ?auto_193540 ?auto_193541 ) ) ( not ( = ?auto_193540 ?auto_193542 ) ) ( not ( = ?auto_193540 ?auto_193544 ) ) ( not ( = ?auto_193541 ?auto_193542 ) ) ( not ( = ?auto_193541 ?auto_193544 ) ) ( not ( = ?auto_193542 ?auto_193544 ) ) ( not ( = ?auto_193537 ?auto_193543 ) ) ( not ( = ?auto_193538 ?auto_193543 ) ) ( not ( = ?auto_193539 ?auto_193543 ) ) ( not ( = ?auto_193540 ?auto_193543 ) ) ( not ( = ?auto_193541 ?auto_193543 ) ) ( not ( = ?auto_193542 ?auto_193543 ) ) ( not ( = ?auto_193544 ?auto_193543 ) ) ( ON ?auto_193543 ?auto_193545 ) ( not ( = ?auto_193537 ?auto_193545 ) ) ( not ( = ?auto_193538 ?auto_193545 ) ) ( not ( = ?auto_193539 ?auto_193545 ) ) ( not ( = ?auto_193540 ?auto_193545 ) ) ( not ( = ?auto_193541 ?auto_193545 ) ) ( not ( = ?auto_193542 ?auto_193545 ) ) ( not ( = ?auto_193544 ?auto_193545 ) ) ( not ( = ?auto_193543 ?auto_193545 ) ) ( ON ?auto_193544 ?auto_193543 ) ( ON ?auto_193542 ?auto_193544 ) ( ON-TABLE ?auto_193545 ) ( ON ?auto_193541 ?auto_193542 ) ( CLEAR ?auto_193539 ) ( ON ?auto_193540 ?auto_193541 ) ( CLEAR ?auto_193540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_193545 ?auto_193543 ?auto_193544 ?auto_193542 ?auto_193541 )
      ( MAKE-6PILE ?auto_193537 ?auto_193538 ?auto_193539 ?auto_193540 ?auto_193541 ?auto_193542 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193546 - BLOCK
      ?auto_193547 - BLOCK
      ?auto_193548 - BLOCK
      ?auto_193549 - BLOCK
      ?auto_193550 - BLOCK
      ?auto_193551 - BLOCK
    )
    :vars
    (
      ?auto_193552 - BLOCK
      ?auto_193553 - BLOCK
      ?auto_193554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193546 ) ( ON ?auto_193547 ?auto_193546 ) ( not ( = ?auto_193546 ?auto_193547 ) ) ( not ( = ?auto_193546 ?auto_193548 ) ) ( not ( = ?auto_193546 ?auto_193549 ) ) ( not ( = ?auto_193546 ?auto_193550 ) ) ( not ( = ?auto_193546 ?auto_193551 ) ) ( not ( = ?auto_193546 ?auto_193552 ) ) ( not ( = ?auto_193547 ?auto_193548 ) ) ( not ( = ?auto_193547 ?auto_193549 ) ) ( not ( = ?auto_193547 ?auto_193550 ) ) ( not ( = ?auto_193547 ?auto_193551 ) ) ( not ( = ?auto_193547 ?auto_193552 ) ) ( not ( = ?auto_193548 ?auto_193549 ) ) ( not ( = ?auto_193548 ?auto_193550 ) ) ( not ( = ?auto_193548 ?auto_193551 ) ) ( not ( = ?auto_193548 ?auto_193552 ) ) ( not ( = ?auto_193549 ?auto_193550 ) ) ( not ( = ?auto_193549 ?auto_193551 ) ) ( not ( = ?auto_193549 ?auto_193552 ) ) ( not ( = ?auto_193550 ?auto_193551 ) ) ( not ( = ?auto_193550 ?auto_193552 ) ) ( not ( = ?auto_193551 ?auto_193552 ) ) ( not ( = ?auto_193546 ?auto_193553 ) ) ( not ( = ?auto_193547 ?auto_193553 ) ) ( not ( = ?auto_193548 ?auto_193553 ) ) ( not ( = ?auto_193549 ?auto_193553 ) ) ( not ( = ?auto_193550 ?auto_193553 ) ) ( not ( = ?auto_193551 ?auto_193553 ) ) ( not ( = ?auto_193552 ?auto_193553 ) ) ( ON ?auto_193553 ?auto_193554 ) ( not ( = ?auto_193546 ?auto_193554 ) ) ( not ( = ?auto_193547 ?auto_193554 ) ) ( not ( = ?auto_193548 ?auto_193554 ) ) ( not ( = ?auto_193549 ?auto_193554 ) ) ( not ( = ?auto_193550 ?auto_193554 ) ) ( not ( = ?auto_193551 ?auto_193554 ) ) ( not ( = ?auto_193552 ?auto_193554 ) ) ( not ( = ?auto_193553 ?auto_193554 ) ) ( ON ?auto_193552 ?auto_193553 ) ( ON ?auto_193551 ?auto_193552 ) ( ON-TABLE ?auto_193554 ) ( ON ?auto_193550 ?auto_193551 ) ( ON ?auto_193549 ?auto_193550 ) ( CLEAR ?auto_193549 ) ( HOLDING ?auto_193548 ) ( CLEAR ?auto_193547 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_193546 ?auto_193547 ?auto_193548 )
      ( MAKE-6PILE ?auto_193546 ?auto_193547 ?auto_193548 ?auto_193549 ?auto_193550 ?auto_193551 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193555 - BLOCK
      ?auto_193556 - BLOCK
      ?auto_193557 - BLOCK
      ?auto_193558 - BLOCK
      ?auto_193559 - BLOCK
      ?auto_193560 - BLOCK
    )
    :vars
    (
      ?auto_193562 - BLOCK
      ?auto_193563 - BLOCK
      ?auto_193561 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193555 ) ( ON ?auto_193556 ?auto_193555 ) ( not ( = ?auto_193555 ?auto_193556 ) ) ( not ( = ?auto_193555 ?auto_193557 ) ) ( not ( = ?auto_193555 ?auto_193558 ) ) ( not ( = ?auto_193555 ?auto_193559 ) ) ( not ( = ?auto_193555 ?auto_193560 ) ) ( not ( = ?auto_193555 ?auto_193562 ) ) ( not ( = ?auto_193556 ?auto_193557 ) ) ( not ( = ?auto_193556 ?auto_193558 ) ) ( not ( = ?auto_193556 ?auto_193559 ) ) ( not ( = ?auto_193556 ?auto_193560 ) ) ( not ( = ?auto_193556 ?auto_193562 ) ) ( not ( = ?auto_193557 ?auto_193558 ) ) ( not ( = ?auto_193557 ?auto_193559 ) ) ( not ( = ?auto_193557 ?auto_193560 ) ) ( not ( = ?auto_193557 ?auto_193562 ) ) ( not ( = ?auto_193558 ?auto_193559 ) ) ( not ( = ?auto_193558 ?auto_193560 ) ) ( not ( = ?auto_193558 ?auto_193562 ) ) ( not ( = ?auto_193559 ?auto_193560 ) ) ( not ( = ?auto_193559 ?auto_193562 ) ) ( not ( = ?auto_193560 ?auto_193562 ) ) ( not ( = ?auto_193555 ?auto_193563 ) ) ( not ( = ?auto_193556 ?auto_193563 ) ) ( not ( = ?auto_193557 ?auto_193563 ) ) ( not ( = ?auto_193558 ?auto_193563 ) ) ( not ( = ?auto_193559 ?auto_193563 ) ) ( not ( = ?auto_193560 ?auto_193563 ) ) ( not ( = ?auto_193562 ?auto_193563 ) ) ( ON ?auto_193563 ?auto_193561 ) ( not ( = ?auto_193555 ?auto_193561 ) ) ( not ( = ?auto_193556 ?auto_193561 ) ) ( not ( = ?auto_193557 ?auto_193561 ) ) ( not ( = ?auto_193558 ?auto_193561 ) ) ( not ( = ?auto_193559 ?auto_193561 ) ) ( not ( = ?auto_193560 ?auto_193561 ) ) ( not ( = ?auto_193562 ?auto_193561 ) ) ( not ( = ?auto_193563 ?auto_193561 ) ) ( ON ?auto_193562 ?auto_193563 ) ( ON ?auto_193560 ?auto_193562 ) ( ON-TABLE ?auto_193561 ) ( ON ?auto_193559 ?auto_193560 ) ( ON ?auto_193558 ?auto_193559 ) ( CLEAR ?auto_193556 ) ( ON ?auto_193557 ?auto_193558 ) ( CLEAR ?auto_193557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193561 ?auto_193563 ?auto_193562 ?auto_193560 ?auto_193559 ?auto_193558 )
      ( MAKE-6PILE ?auto_193555 ?auto_193556 ?auto_193557 ?auto_193558 ?auto_193559 ?auto_193560 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193564 - BLOCK
      ?auto_193565 - BLOCK
      ?auto_193566 - BLOCK
      ?auto_193567 - BLOCK
      ?auto_193568 - BLOCK
      ?auto_193569 - BLOCK
    )
    :vars
    (
      ?auto_193571 - BLOCK
      ?auto_193570 - BLOCK
      ?auto_193572 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193564 ) ( not ( = ?auto_193564 ?auto_193565 ) ) ( not ( = ?auto_193564 ?auto_193566 ) ) ( not ( = ?auto_193564 ?auto_193567 ) ) ( not ( = ?auto_193564 ?auto_193568 ) ) ( not ( = ?auto_193564 ?auto_193569 ) ) ( not ( = ?auto_193564 ?auto_193571 ) ) ( not ( = ?auto_193565 ?auto_193566 ) ) ( not ( = ?auto_193565 ?auto_193567 ) ) ( not ( = ?auto_193565 ?auto_193568 ) ) ( not ( = ?auto_193565 ?auto_193569 ) ) ( not ( = ?auto_193565 ?auto_193571 ) ) ( not ( = ?auto_193566 ?auto_193567 ) ) ( not ( = ?auto_193566 ?auto_193568 ) ) ( not ( = ?auto_193566 ?auto_193569 ) ) ( not ( = ?auto_193566 ?auto_193571 ) ) ( not ( = ?auto_193567 ?auto_193568 ) ) ( not ( = ?auto_193567 ?auto_193569 ) ) ( not ( = ?auto_193567 ?auto_193571 ) ) ( not ( = ?auto_193568 ?auto_193569 ) ) ( not ( = ?auto_193568 ?auto_193571 ) ) ( not ( = ?auto_193569 ?auto_193571 ) ) ( not ( = ?auto_193564 ?auto_193570 ) ) ( not ( = ?auto_193565 ?auto_193570 ) ) ( not ( = ?auto_193566 ?auto_193570 ) ) ( not ( = ?auto_193567 ?auto_193570 ) ) ( not ( = ?auto_193568 ?auto_193570 ) ) ( not ( = ?auto_193569 ?auto_193570 ) ) ( not ( = ?auto_193571 ?auto_193570 ) ) ( ON ?auto_193570 ?auto_193572 ) ( not ( = ?auto_193564 ?auto_193572 ) ) ( not ( = ?auto_193565 ?auto_193572 ) ) ( not ( = ?auto_193566 ?auto_193572 ) ) ( not ( = ?auto_193567 ?auto_193572 ) ) ( not ( = ?auto_193568 ?auto_193572 ) ) ( not ( = ?auto_193569 ?auto_193572 ) ) ( not ( = ?auto_193571 ?auto_193572 ) ) ( not ( = ?auto_193570 ?auto_193572 ) ) ( ON ?auto_193571 ?auto_193570 ) ( ON ?auto_193569 ?auto_193571 ) ( ON-TABLE ?auto_193572 ) ( ON ?auto_193568 ?auto_193569 ) ( ON ?auto_193567 ?auto_193568 ) ( ON ?auto_193566 ?auto_193567 ) ( CLEAR ?auto_193566 ) ( HOLDING ?auto_193565 ) ( CLEAR ?auto_193564 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193564 ?auto_193565 )
      ( MAKE-6PILE ?auto_193564 ?auto_193565 ?auto_193566 ?auto_193567 ?auto_193568 ?auto_193569 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193573 - BLOCK
      ?auto_193574 - BLOCK
      ?auto_193575 - BLOCK
      ?auto_193576 - BLOCK
      ?auto_193577 - BLOCK
      ?auto_193578 - BLOCK
    )
    :vars
    (
      ?auto_193579 - BLOCK
      ?auto_193580 - BLOCK
      ?auto_193581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193573 ) ( not ( = ?auto_193573 ?auto_193574 ) ) ( not ( = ?auto_193573 ?auto_193575 ) ) ( not ( = ?auto_193573 ?auto_193576 ) ) ( not ( = ?auto_193573 ?auto_193577 ) ) ( not ( = ?auto_193573 ?auto_193578 ) ) ( not ( = ?auto_193573 ?auto_193579 ) ) ( not ( = ?auto_193574 ?auto_193575 ) ) ( not ( = ?auto_193574 ?auto_193576 ) ) ( not ( = ?auto_193574 ?auto_193577 ) ) ( not ( = ?auto_193574 ?auto_193578 ) ) ( not ( = ?auto_193574 ?auto_193579 ) ) ( not ( = ?auto_193575 ?auto_193576 ) ) ( not ( = ?auto_193575 ?auto_193577 ) ) ( not ( = ?auto_193575 ?auto_193578 ) ) ( not ( = ?auto_193575 ?auto_193579 ) ) ( not ( = ?auto_193576 ?auto_193577 ) ) ( not ( = ?auto_193576 ?auto_193578 ) ) ( not ( = ?auto_193576 ?auto_193579 ) ) ( not ( = ?auto_193577 ?auto_193578 ) ) ( not ( = ?auto_193577 ?auto_193579 ) ) ( not ( = ?auto_193578 ?auto_193579 ) ) ( not ( = ?auto_193573 ?auto_193580 ) ) ( not ( = ?auto_193574 ?auto_193580 ) ) ( not ( = ?auto_193575 ?auto_193580 ) ) ( not ( = ?auto_193576 ?auto_193580 ) ) ( not ( = ?auto_193577 ?auto_193580 ) ) ( not ( = ?auto_193578 ?auto_193580 ) ) ( not ( = ?auto_193579 ?auto_193580 ) ) ( ON ?auto_193580 ?auto_193581 ) ( not ( = ?auto_193573 ?auto_193581 ) ) ( not ( = ?auto_193574 ?auto_193581 ) ) ( not ( = ?auto_193575 ?auto_193581 ) ) ( not ( = ?auto_193576 ?auto_193581 ) ) ( not ( = ?auto_193577 ?auto_193581 ) ) ( not ( = ?auto_193578 ?auto_193581 ) ) ( not ( = ?auto_193579 ?auto_193581 ) ) ( not ( = ?auto_193580 ?auto_193581 ) ) ( ON ?auto_193579 ?auto_193580 ) ( ON ?auto_193578 ?auto_193579 ) ( ON-TABLE ?auto_193581 ) ( ON ?auto_193577 ?auto_193578 ) ( ON ?auto_193576 ?auto_193577 ) ( ON ?auto_193575 ?auto_193576 ) ( CLEAR ?auto_193573 ) ( ON ?auto_193574 ?auto_193575 ) ( CLEAR ?auto_193574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193581 ?auto_193580 ?auto_193579 ?auto_193578 ?auto_193577 ?auto_193576 ?auto_193575 )
      ( MAKE-6PILE ?auto_193573 ?auto_193574 ?auto_193575 ?auto_193576 ?auto_193577 ?auto_193578 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193582 - BLOCK
      ?auto_193583 - BLOCK
      ?auto_193584 - BLOCK
      ?auto_193585 - BLOCK
      ?auto_193586 - BLOCK
      ?auto_193587 - BLOCK
    )
    :vars
    (
      ?auto_193589 - BLOCK
      ?auto_193590 - BLOCK
      ?auto_193588 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193582 ?auto_193583 ) ) ( not ( = ?auto_193582 ?auto_193584 ) ) ( not ( = ?auto_193582 ?auto_193585 ) ) ( not ( = ?auto_193582 ?auto_193586 ) ) ( not ( = ?auto_193582 ?auto_193587 ) ) ( not ( = ?auto_193582 ?auto_193589 ) ) ( not ( = ?auto_193583 ?auto_193584 ) ) ( not ( = ?auto_193583 ?auto_193585 ) ) ( not ( = ?auto_193583 ?auto_193586 ) ) ( not ( = ?auto_193583 ?auto_193587 ) ) ( not ( = ?auto_193583 ?auto_193589 ) ) ( not ( = ?auto_193584 ?auto_193585 ) ) ( not ( = ?auto_193584 ?auto_193586 ) ) ( not ( = ?auto_193584 ?auto_193587 ) ) ( not ( = ?auto_193584 ?auto_193589 ) ) ( not ( = ?auto_193585 ?auto_193586 ) ) ( not ( = ?auto_193585 ?auto_193587 ) ) ( not ( = ?auto_193585 ?auto_193589 ) ) ( not ( = ?auto_193586 ?auto_193587 ) ) ( not ( = ?auto_193586 ?auto_193589 ) ) ( not ( = ?auto_193587 ?auto_193589 ) ) ( not ( = ?auto_193582 ?auto_193590 ) ) ( not ( = ?auto_193583 ?auto_193590 ) ) ( not ( = ?auto_193584 ?auto_193590 ) ) ( not ( = ?auto_193585 ?auto_193590 ) ) ( not ( = ?auto_193586 ?auto_193590 ) ) ( not ( = ?auto_193587 ?auto_193590 ) ) ( not ( = ?auto_193589 ?auto_193590 ) ) ( ON ?auto_193590 ?auto_193588 ) ( not ( = ?auto_193582 ?auto_193588 ) ) ( not ( = ?auto_193583 ?auto_193588 ) ) ( not ( = ?auto_193584 ?auto_193588 ) ) ( not ( = ?auto_193585 ?auto_193588 ) ) ( not ( = ?auto_193586 ?auto_193588 ) ) ( not ( = ?auto_193587 ?auto_193588 ) ) ( not ( = ?auto_193589 ?auto_193588 ) ) ( not ( = ?auto_193590 ?auto_193588 ) ) ( ON ?auto_193589 ?auto_193590 ) ( ON ?auto_193587 ?auto_193589 ) ( ON-TABLE ?auto_193588 ) ( ON ?auto_193586 ?auto_193587 ) ( ON ?auto_193585 ?auto_193586 ) ( ON ?auto_193584 ?auto_193585 ) ( ON ?auto_193583 ?auto_193584 ) ( CLEAR ?auto_193583 ) ( HOLDING ?auto_193582 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_193582 )
      ( MAKE-6PILE ?auto_193582 ?auto_193583 ?auto_193584 ?auto_193585 ?auto_193586 ?auto_193587 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_193591 - BLOCK
      ?auto_193592 - BLOCK
      ?auto_193593 - BLOCK
      ?auto_193594 - BLOCK
      ?auto_193595 - BLOCK
      ?auto_193596 - BLOCK
    )
    :vars
    (
      ?auto_193599 - BLOCK
      ?auto_193598 - BLOCK
      ?auto_193597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193591 ?auto_193592 ) ) ( not ( = ?auto_193591 ?auto_193593 ) ) ( not ( = ?auto_193591 ?auto_193594 ) ) ( not ( = ?auto_193591 ?auto_193595 ) ) ( not ( = ?auto_193591 ?auto_193596 ) ) ( not ( = ?auto_193591 ?auto_193599 ) ) ( not ( = ?auto_193592 ?auto_193593 ) ) ( not ( = ?auto_193592 ?auto_193594 ) ) ( not ( = ?auto_193592 ?auto_193595 ) ) ( not ( = ?auto_193592 ?auto_193596 ) ) ( not ( = ?auto_193592 ?auto_193599 ) ) ( not ( = ?auto_193593 ?auto_193594 ) ) ( not ( = ?auto_193593 ?auto_193595 ) ) ( not ( = ?auto_193593 ?auto_193596 ) ) ( not ( = ?auto_193593 ?auto_193599 ) ) ( not ( = ?auto_193594 ?auto_193595 ) ) ( not ( = ?auto_193594 ?auto_193596 ) ) ( not ( = ?auto_193594 ?auto_193599 ) ) ( not ( = ?auto_193595 ?auto_193596 ) ) ( not ( = ?auto_193595 ?auto_193599 ) ) ( not ( = ?auto_193596 ?auto_193599 ) ) ( not ( = ?auto_193591 ?auto_193598 ) ) ( not ( = ?auto_193592 ?auto_193598 ) ) ( not ( = ?auto_193593 ?auto_193598 ) ) ( not ( = ?auto_193594 ?auto_193598 ) ) ( not ( = ?auto_193595 ?auto_193598 ) ) ( not ( = ?auto_193596 ?auto_193598 ) ) ( not ( = ?auto_193599 ?auto_193598 ) ) ( ON ?auto_193598 ?auto_193597 ) ( not ( = ?auto_193591 ?auto_193597 ) ) ( not ( = ?auto_193592 ?auto_193597 ) ) ( not ( = ?auto_193593 ?auto_193597 ) ) ( not ( = ?auto_193594 ?auto_193597 ) ) ( not ( = ?auto_193595 ?auto_193597 ) ) ( not ( = ?auto_193596 ?auto_193597 ) ) ( not ( = ?auto_193599 ?auto_193597 ) ) ( not ( = ?auto_193598 ?auto_193597 ) ) ( ON ?auto_193599 ?auto_193598 ) ( ON ?auto_193596 ?auto_193599 ) ( ON-TABLE ?auto_193597 ) ( ON ?auto_193595 ?auto_193596 ) ( ON ?auto_193594 ?auto_193595 ) ( ON ?auto_193593 ?auto_193594 ) ( ON ?auto_193592 ?auto_193593 ) ( ON ?auto_193591 ?auto_193592 ) ( CLEAR ?auto_193591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193597 ?auto_193598 ?auto_193599 ?auto_193596 ?auto_193595 ?auto_193594 ?auto_193593 ?auto_193592 )
      ( MAKE-6PILE ?auto_193591 ?auto_193592 ?auto_193593 ?auto_193594 ?auto_193595 ?auto_193596 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193602 - BLOCK
      ?auto_193603 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_193603 ) ( CLEAR ?auto_193602 ) ( ON-TABLE ?auto_193602 ) ( not ( = ?auto_193602 ?auto_193603 ) ) )
    :subtasks
    ( ( !STACK ?auto_193603 ?auto_193602 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193604 - BLOCK
      ?auto_193605 - BLOCK
    )
    :vars
    (
      ?auto_193606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_193604 ) ( ON-TABLE ?auto_193604 ) ( not ( = ?auto_193604 ?auto_193605 ) ) ( ON ?auto_193605 ?auto_193606 ) ( CLEAR ?auto_193605 ) ( HAND-EMPTY ) ( not ( = ?auto_193604 ?auto_193606 ) ) ( not ( = ?auto_193605 ?auto_193606 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_193605 ?auto_193606 )
      ( MAKE-2PILE ?auto_193604 ?auto_193605 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193607 - BLOCK
      ?auto_193608 - BLOCK
    )
    :vars
    (
      ?auto_193609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193607 ?auto_193608 ) ) ( ON ?auto_193608 ?auto_193609 ) ( CLEAR ?auto_193608 ) ( not ( = ?auto_193607 ?auto_193609 ) ) ( not ( = ?auto_193608 ?auto_193609 ) ) ( HOLDING ?auto_193607 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_193607 )
      ( MAKE-2PILE ?auto_193607 ?auto_193608 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193610 - BLOCK
      ?auto_193611 - BLOCK
    )
    :vars
    (
      ?auto_193612 - BLOCK
      ?auto_193617 - BLOCK
      ?auto_193616 - BLOCK
      ?auto_193614 - BLOCK
      ?auto_193615 - BLOCK
      ?auto_193613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193610 ?auto_193611 ) ) ( ON ?auto_193611 ?auto_193612 ) ( not ( = ?auto_193610 ?auto_193612 ) ) ( not ( = ?auto_193611 ?auto_193612 ) ) ( ON ?auto_193610 ?auto_193611 ) ( CLEAR ?auto_193610 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193617 ) ( ON ?auto_193616 ?auto_193617 ) ( ON ?auto_193614 ?auto_193616 ) ( ON ?auto_193615 ?auto_193614 ) ( ON ?auto_193613 ?auto_193615 ) ( ON ?auto_193612 ?auto_193613 ) ( not ( = ?auto_193617 ?auto_193616 ) ) ( not ( = ?auto_193617 ?auto_193614 ) ) ( not ( = ?auto_193617 ?auto_193615 ) ) ( not ( = ?auto_193617 ?auto_193613 ) ) ( not ( = ?auto_193617 ?auto_193612 ) ) ( not ( = ?auto_193617 ?auto_193611 ) ) ( not ( = ?auto_193617 ?auto_193610 ) ) ( not ( = ?auto_193616 ?auto_193614 ) ) ( not ( = ?auto_193616 ?auto_193615 ) ) ( not ( = ?auto_193616 ?auto_193613 ) ) ( not ( = ?auto_193616 ?auto_193612 ) ) ( not ( = ?auto_193616 ?auto_193611 ) ) ( not ( = ?auto_193616 ?auto_193610 ) ) ( not ( = ?auto_193614 ?auto_193615 ) ) ( not ( = ?auto_193614 ?auto_193613 ) ) ( not ( = ?auto_193614 ?auto_193612 ) ) ( not ( = ?auto_193614 ?auto_193611 ) ) ( not ( = ?auto_193614 ?auto_193610 ) ) ( not ( = ?auto_193615 ?auto_193613 ) ) ( not ( = ?auto_193615 ?auto_193612 ) ) ( not ( = ?auto_193615 ?auto_193611 ) ) ( not ( = ?auto_193615 ?auto_193610 ) ) ( not ( = ?auto_193613 ?auto_193612 ) ) ( not ( = ?auto_193613 ?auto_193611 ) ) ( not ( = ?auto_193613 ?auto_193610 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193617 ?auto_193616 ?auto_193614 ?auto_193615 ?auto_193613 ?auto_193612 ?auto_193611 )
      ( MAKE-2PILE ?auto_193610 ?auto_193611 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193618 - BLOCK
      ?auto_193619 - BLOCK
    )
    :vars
    (
      ?auto_193622 - BLOCK
      ?auto_193623 - BLOCK
      ?auto_193621 - BLOCK
      ?auto_193625 - BLOCK
      ?auto_193624 - BLOCK
      ?auto_193620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193618 ?auto_193619 ) ) ( ON ?auto_193619 ?auto_193622 ) ( not ( = ?auto_193618 ?auto_193622 ) ) ( not ( = ?auto_193619 ?auto_193622 ) ) ( ON-TABLE ?auto_193623 ) ( ON ?auto_193621 ?auto_193623 ) ( ON ?auto_193625 ?auto_193621 ) ( ON ?auto_193624 ?auto_193625 ) ( ON ?auto_193620 ?auto_193624 ) ( ON ?auto_193622 ?auto_193620 ) ( not ( = ?auto_193623 ?auto_193621 ) ) ( not ( = ?auto_193623 ?auto_193625 ) ) ( not ( = ?auto_193623 ?auto_193624 ) ) ( not ( = ?auto_193623 ?auto_193620 ) ) ( not ( = ?auto_193623 ?auto_193622 ) ) ( not ( = ?auto_193623 ?auto_193619 ) ) ( not ( = ?auto_193623 ?auto_193618 ) ) ( not ( = ?auto_193621 ?auto_193625 ) ) ( not ( = ?auto_193621 ?auto_193624 ) ) ( not ( = ?auto_193621 ?auto_193620 ) ) ( not ( = ?auto_193621 ?auto_193622 ) ) ( not ( = ?auto_193621 ?auto_193619 ) ) ( not ( = ?auto_193621 ?auto_193618 ) ) ( not ( = ?auto_193625 ?auto_193624 ) ) ( not ( = ?auto_193625 ?auto_193620 ) ) ( not ( = ?auto_193625 ?auto_193622 ) ) ( not ( = ?auto_193625 ?auto_193619 ) ) ( not ( = ?auto_193625 ?auto_193618 ) ) ( not ( = ?auto_193624 ?auto_193620 ) ) ( not ( = ?auto_193624 ?auto_193622 ) ) ( not ( = ?auto_193624 ?auto_193619 ) ) ( not ( = ?auto_193624 ?auto_193618 ) ) ( not ( = ?auto_193620 ?auto_193622 ) ) ( not ( = ?auto_193620 ?auto_193619 ) ) ( not ( = ?auto_193620 ?auto_193618 ) ) ( HOLDING ?auto_193618 ) ( CLEAR ?auto_193619 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193623 ?auto_193621 ?auto_193625 ?auto_193624 ?auto_193620 ?auto_193622 ?auto_193619 ?auto_193618 )
      ( MAKE-2PILE ?auto_193618 ?auto_193619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193626 - BLOCK
      ?auto_193627 - BLOCK
    )
    :vars
    (
      ?auto_193630 - BLOCK
      ?auto_193631 - BLOCK
      ?auto_193632 - BLOCK
      ?auto_193628 - BLOCK
      ?auto_193633 - BLOCK
      ?auto_193629 - BLOCK
      ?auto_193634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193626 ?auto_193627 ) ) ( ON ?auto_193627 ?auto_193630 ) ( not ( = ?auto_193626 ?auto_193630 ) ) ( not ( = ?auto_193627 ?auto_193630 ) ) ( ON-TABLE ?auto_193631 ) ( ON ?auto_193632 ?auto_193631 ) ( ON ?auto_193628 ?auto_193632 ) ( ON ?auto_193633 ?auto_193628 ) ( ON ?auto_193629 ?auto_193633 ) ( ON ?auto_193630 ?auto_193629 ) ( not ( = ?auto_193631 ?auto_193632 ) ) ( not ( = ?auto_193631 ?auto_193628 ) ) ( not ( = ?auto_193631 ?auto_193633 ) ) ( not ( = ?auto_193631 ?auto_193629 ) ) ( not ( = ?auto_193631 ?auto_193630 ) ) ( not ( = ?auto_193631 ?auto_193627 ) ) ( not ( = ?auto_193631 ?auto_193626 ) ) ( not ( = ?auto_193632 ?auto_193628 ) ) ( not ( = ?auto_193632 ?auto_193633 ) ) ( not ( = ?auto_193632 ?auto_193629 ) ) ( not ( = ?auto_193632 ?auto_193630 ) ) ( not ( = ?auto_193632 ?auto_193627 ) ) ( not ( = ?auto_193632 ?auto_193626 ) ) ( not ( = ?auto_193628 ?auto_193633 ) ) ( not ( = ?auto_193628 ?auto_193629 ) ) ( not ( = ?auto_193628 ?auto_193630 ) ) ( not ( = ?auto_193628 ?auto_193627 ) ) ( not ( = ?auto_193628 ?auto_193626 ) ) ( not ( = ?auto_193633 ?auto_193629 ) ) ( not ( = ?auto_193633 ?auto_193630 ) ) ( not ( = ?auto_193633 ?auto_193627 ) ) ( not ( = ?auto_193633 ?auto_193626 ) ) ( not ( = ?auto_193629 ?auto_193630 ) ) ( not ( = ?auto_193629 ?auto_193627 ) ) ( not ( = ?auto_193629 ?auto_193626 ) ) ( CLEAR ?auto_193627 ) ( ON ?auto_193626 ?auto_193634 ) ( CLEAR ?auto_193626 ) ( HAND-EMPTY ) ( not ( = ?auto_193626 ?auto_193634 ) ) ( not ( = ?auto_193627 ?auto_193634 ) ) ( not ( = ?auto_193630 ?auto_193634 ) ) ( not ( = ?auto_193631 ?auto_193634 ) ) ( not ( = ?auto_193632 ?auto_193634 ) ) ( not ( = ?auto_193628 ?auto_193634 ) ) ( not ( = ?auto_193633 ?auto_193634 ) ) ( not ( = ?auto_193629 ?auto_193634 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_193626 ?auto_193634 )
      ( MAKE-2PILE ?auto_193626 ?auto_193627 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193635 - BLOCK
      ?auto_193636 - BLOCK
    )
    :vars
    (
      ?auto_193641 - BLOCK
      ?auto_193639 - BLOCK
      ?auto_193637 - BLOCK
      ?auto_193643 - BLOCK
      ?auto_193638 - BLOCK
      ?auto_193642 - BLOCK
      ?auto_193640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193635 ?auto_193636 ) ) ( not ( = ?auto_193635 ?auto_193641 ) ) ( not ( = ?auto_193636 ?auto_193641 ) ) ( ON-TABLE ?auto_193639 ) ( ON ?auto_193637 ?auto_193639 ) ( ON ?auto_193643 ?auto_193637 ) ( ON ?auto_193638 ?auto_193643 ) ( ON ?auto_193642 ?auto_193638 ) ( ON ?auto_193641 ?auto_193642 ) ( not ( = ?auto_193639 ?auto_193637 ) ) ( not ( = ?auto_193639 ?auto_193643 ) ) ( not ( = ?auto_193639 ?auto_193638 ) ) ( not ( = ?auto_193639 ?auto_193642 ) ) ( not ( = ?auto_193639 ?auto_193641 ) ) ( not ( = ?auto_193639 ?auto_193636 ) ) ( not ( = ?auto_193639 ?auto_193635 ) ) ( not ( = ?auto_193637 ?auto_193643 ) ) ( not ( = ?auto_193637 ?auto_193638 ) ) ( not ( = ?auto_193637 ?auto_193642 ) ) ( not ( = ?auto_193637 ?auto_193641 ) ) ( not ( = ?auto_193637 ?auto_193636 ) ) ( not ( = ?auto_193637 ?auto_193635 ) ) ( not ( = ?auto_193643 ?auto_193638 ) ) ( not ( = ?auto_193643 ?auto_193642 ) ) ( not ( = ?auto_193643 ?auto_193641 ) ) ( not ( = ?auto_193643 ?auto_193636 ) ) ( not ( = ?auto_193643 ?auto_193635 ) ) ( not ( = ?auto_193638 ?auto_193642 ) ) ( not ( = ?auto_193638 ?auto_193641 ) ) ( not ( = ?auto_193638 ?auto_193636 ) ) ( not ( = ?auto_193638 ?auto_193635 ) ) ( not ( = ?auto_193642 ?auto_193641 ) ) ( not ( = ?auto_193642 ?auto_193636 ) ) ( not ( = ?auto_193642 ?auto_193635 ) ) ( ON ?auto_193635 ?auto_193640 ) ( CLEAR ?auto_193635 ) ( not ( = ?auto_193635 ?auto_193640 ) ) ( not ( = ?auto_193636 ?auto_193640 ) ) ( not ( = ?auto_193641 ?auto_193640 ) ) ( not ( = ?auto_193639 ?auto_193640 ) ) ( not ( = ?auto_193637 ?auto_193640 ) ) ( not ( = ?auto_193643 ?auto_193640 ) ) ( not ( = ?auto_193638 ?auto_193640 ) ) ( not ( = ?auto_193642 ?auto_193640 ) ) ( HOLDING ?auto_193636 ) ( CLEAR ?auto_193641 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193639 ?auto_193637 ?auto_193643 ?auto_193638 ?auto_193642 ?auto_193641 ?auto_193636 )
      ( MAKE-2PILE ?auto_193635 ?auto_193636 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193644 - BLOCK
      ?auto_193645 - BLOCK
    )
    :vars
    (
      ?auto_193646 - BLOCK
      ?auto_193649 - BLOCK
      ?auto_193651 - BLOCK
      ?auto_193648 - BLOCK
      ?auto_193652 - BLOCK
      ?auto_193647 - BLOCK
      ?auto_193650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193644 ?auto_193645 ) ) ( not ( = ?auto_193644 ?auto_193646 ) ) ( not ( = ?auto_193645 ?auto_193646 ) ) ( ON-TABLE ?auto_193649 ) ( ON ?auto_193651 ?auto_193649 ) ( ON ?auto_193648 ?auto_193651 ) ( ON ?auto_193652 ?auto_193648 ) ( ON ?auto_193647 ?auto_193652 ) ( ON ?auto_193646 ?auto_193647 ) ( not ( = ?auto_193649 ?auto_193651 ) ) ( not ( = ?auto_193649 ?auto_193648 ) ) ( not ( = ?auto_193649 ?auto_193652 ) ) ( not ( = ?auto_193649 ?auto_193647 ) ) ( not ( = ?auto_193649 ?auto_193646 ) ) ( not ( = ?auto_193649 ?auto_193645 ) ) ( not ( = ?auto_193649 ?auto_193644 ) ) ( not ( = ?auto_193651 ?auto_193648 ) ) ( not ( = ?auto_193651 ?auto_193652 ) ) ( not ( = ?auto_193651 ?auto_193647 ) ) ( not ( = ?auto_193651 ?auto_193646 ) ) ( not ( = ?auto_193651 ?auto_193645 ) ) ( not ( = ?auto_193651 ?auto_193644 ) ) ( not ( = ?auto_193648 ?auto_193652 ) ) ( not ( = ?auto_193648 ?auto_193647 ) ) ( not ( = ?auto_193648 ?auto_193646 ) ) ( not ( = ?auto_193648 ?auto_193645 ) ) ( not ( = ?auto_193648 ?auto_193644 ) ) ( not ( = ?auto_193652 ?auto_193647 ) ) ( not ( = ?auto_193652 ?auto_193646 ) ) ( not ( = ?auto_193652 ?auto_193645 ) ) ( not ( = ?auto_193652 ?auto_193644 ) ) ( not ( = ?auto_193647 ?auto_193646 ) ) ( not ( = ?auto_193647 ?auto_193645 ) ) ( not ( = ?auto_193647 ?auto_193644 ) ) ( ON ?auto_193644 ?auto_193650 ) ( not ( = ?auto_193644 ?auto_193650 ) ) ( not ( = ?auto_193645 ?auto_193650 ) ) ( not ( = ?auto_193646 ?auto_193650 ) ) ( not ( = ?auto_193649 ?auto_193650 ) ) ( not ( = ?auto_193651 ?auto_193650 ) ) ( not ( = ?auto_193648 ?auto_193650 ) ) ( not ( = ?auto_193652 ?auto_193650 ) ) ( not ( = ?auto_193647 ?auto_193650 ) ) ( CLEAR ?auto_193646 ) ( ON ?auto_193645 ?auto_193644 ) ( CLEAR ?auto_193645 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193650 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193650 ?auto_193644 )
      ( MAKE-2PILE ?auto_193644 ?auto_193645 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193653 - BLOCK
      ?auto_193654 - BLOCK
    )
    :vars
    (
      ?auto_193658 - BLOCK
      ?auto_193661 - BLOCK
      ?auto_193656 - BLOCK
      ?auto_193660 - BLOCK
      ?auto_193655 - BLOCK
      ?auto_193657 - BLOCK
      ?auto_193659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193653 ?auto_193654 ) ) ( not ( = ?auto_193653 ?auto_193658 ) ) ( not ( = ?auto_193654 ?auto_193658 ) ) ( ON-TABLE ?auto_193661 ) ( ON ?auto_193656 ?auto_193661 ) ( ON ?auto_193660 ?auto_193656 ) ( ON ?auto_193655 ?auto_193660 ) ( ON ?auto_193657 ?auto_193655 ) ( not ( = ?auto_193661 ?auto_193656 ) ) ( not ( = ?auto_193661 ?auto_193660 ) ) ( not ( = ?auto_193661 ?auto_193655 ) ) ( not ( = ?auto_193661 ?auto_193657 ) ) ( not ( = ?auto_193661 ?auto_193658 ) ) ( not ( = ?auto_193661 ?auto_193654 ) ) ( not ( = ?auto_193661 ?auto_193653 ) ) ( not ( = ?auto_193656 ?auto_193660 ) ) ( not ( = ?auto_193656 ?auto_193655 ) ) ( not ( = ?auto_193656 ?auto_193657 ) ) ( not ( = ?auto_193656 ?auto_193658 ) ) ( not ( = ?auto_193656 ?auto_193654 ) ) ( not ( = ?auto_193656 ?auto_193653 ) ) ( not ( = ?auto_193660 ?auto_193655 ) ) ( not ( = ?auto_193660 ?auto_193657 ) ) ( not ( = ?auto_193660 ?auto_193658 ) ) ( not ( = ?auto_193660 ?auto_193654 ) ) ( not ( = ?auto_193660 ?auto_193653 ) ) ( not ( = ?auto_193655 ?auto_193657 ) ) ( not ( = ?auto_193655 ?auto_193658 ) ) ( not ( = ?auto_193655 ?auto_193654 ) ) ( not ( = ?auto_193655 ?auto_193653 ) ) ( not ( = ?auto_193657 ?auto_193658 ) ) ( not ( = ?auto_193657 ?auto_193654 ) ) ( not ( = ?auto_193657 ?auto_193653 ) ) ( ON ?auto_193653 ?auto_193659 ) ( not ( = ?auto_193653 ?auto_193659 ) ) ( not ( = ?auto_193654 ?auto_193659 ) ) ( not ( = ?auto_193658 ?auto_193659 ) ) ( not ( = ?auto_193661 ?auto_193659 ) ) ( not ( = ?auto_193656 ?auto_193659 ) ) ( not ( = ?auto_193660 ?auto_193659 ) ) ( not ( = ?auto_193655 ?auto_193659 ) ) ( not ( = ?auto_193657 ?auto_193659 ) ) ( ON ?auto_193654 ?auto_193653 ) ( CLEAR ?auto_193654 ) ( ON-TABLE ?auto_193659 ) ( HOLDING ?auto_193658 ) ( CLEAR ?auto_193657 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193661 ?auto_193656 ?auto_193660 ?auto_193655 ?auto_193657 ?auto_193658 )
      ( MAKE-2PILE ?auto_193653 ?auto_193654 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193662 - BLOCK
      ?auto_193663 - BLOCK
    )
    :vars
    (
      ?auto_193664 - BLOCK
      ?auto_193670 - BLOCK
      ?auto_193668 - BLOCK
      ?auto_193669 - BLOCK
      ?auto_193666 - BLOCK
      ?auto_193667 - BLOCK
      ?auto_193665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193662 ?auto_193663 ) ) ( not ( = ?auto_193662 ?auto_193664 ) ) ( not ( = ?auto_193663 ?auto_193664 ) ) ( ON-TABLE ?auto_193670 ) ( ON ?auto_193668 ?auto_193670 ) ( ON ?auto_193669 ?auto_193668 ) ( ON ?auto_193666 ?auto_193669 ) ( ON ?auto_193667 ?auto_193666 ) ( not ( = ?auto_193670 ?auto_193668 ) ) ( not ( = ?auto_193670 ?auto_193669 ) ) ( not ( = ?auto_193670 ?auto_193666 ) ) ( not ( = ?auto_193670 ?auto_193667 ) ) ( not ( = ?auto_193670 ?auto_193664 ) ) ( not ( = ?auto_193670 ?auto_193663 ) ) ( not ( = ?auto_193670 ?auto_193662 ) ) ( not ( = ?auto_193668 ?auto_193669 ) ) ( not ( = ?auto_193668 ?auto_193666 ) ) ( not ( = ?auto_193668 ?auto_193667 ) ) ( not ( = ?auto_193668 ?auto_193664 ) ) ( not ( = ?auto_193668 ?auto_193663 ) ) ( not ( = ?auto_193668 ?auto_193662 ) ) ( not ( = ?auto_193669 ?auto_193666 ) ) ( not ( = ?auto_193669 ?auto_193667 ) ) ( not ( = ?auto_193669 ?auto_193664 ) ) ( not ( = ?auto_193669 ?auto_193663 ) ) ( not ( = ?auto_193669 ?auto_193662 ) ) ( not ( = ?auto_193666 ?auto_193667 ) ) ( not ( = ?auto_193666 ?auto_193664 ) ) ( not ( = ?auto_193666 ?auto_193663 ) ) ( not ( = ?auto_193666 ?auto_193662 ) ) ( not ( = ?auto_193667 ?auto_193664 ) ) ( not ( = ?auto_193667 ?auto_193663 ) ) ( not ( = ?auto_193667 ?auto_193662 ) ) ( ON ?auto_193662 ?auto_193665 ) ( not ( = ?auto_193662 ?auto_193665 ) ) ( not ( = ?auto_193663 ?auto_193665 ) ) ( not ( = ?auto_193664 ?auto_193665 ) ) ( not ( = ?auto_193670 ?auto_193665 ) ) ( not ( = ?auto_193668 ?auto_193665 ) ) ( not ( = ?auto_193669 ?auto_193665 ) ) ( not ( = ?auto_193666 ?auto_193665 ) ) ( not ( = ?auto_193667 ?auto_193665 ) ) ( ON ?auto_193663 ?auto_193662 ) ( ON-TABLE ?auto_193665 ) ( CLEAR ?auto_193667 ) ( ON ?auto_193664 ?auto_193663 ) ( CLEAR ?auto_193664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_193665 ?auto_193662 ?auto_193663 )
      ( MAKE-2PILE ?auto_193662 ?auto_193663 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193671 - BLOCK
      ?auto_193672 - BLOCK
    )
    :vars
    (
      ?auto_193676 - BLOCK
      ?auto_193677 - BLOCK
      ?auto_193678 - BLOCK
      ?auto_193673 - BLOCK
      ?auto_193674 - BLOCK
      ?auto_193679 - BLOCK
      ?auto_193675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193671 ?auto_193672 ) ) ( not ( = ?auto_193671 ?auto_193676 ) ) ( not ( = ?auto_193672 ?auto_193676 ) ) ( ON-TABLE ?auto_193677 ) ( ON ?auto_193678 ?auto_193677 ) ( ON ?auto_193673 ?auto_193678 ) ( ON ?auto_193674 ?auto_193673 ) ( not ( = ?auto_193677 ?auto_193678 ) ) ( not ( = ?auto_193677 ?auto_193673 ) ) ( not ( = ?auto_193677 ?auto_193674 ) ) ( not ( = ?auto_193677 ?auto_193679 ) ) ( not ( = ?auto_193677 ?auto_193676 ) ) ( not ( = ?auto_193677 ?auto_193672 ) ) ( not ( = ?auto_193677 ?auto_193671 ) ) ( not ( = ?auto_193678 ?auto_193673 ) ) ( not ( = ?auto_193678 ?auto_193674 ) ) ( not ( = ?auto_193678 ?auto_193679 ) ) ( not ( = ?auto_193678 ?auto_193676 ) ) ( not ( = ?auto_193678 ?auto_193672 ) ) ( not ( = ?auto_193678 ?auto_193671 ) ) ( not ( = ?auto_193673 ?auto_193674 ) ) ( not ( = ?auto_193673 ?auto_193679 ) ) ( not ( = ?auto_193673 ?auto_193676 ) ) ( not ( = ?auto_193673 ?auto_193672 ) ) ( not ( = ?auto_193673 ?auto_193671 ) ) ( not ( = ?auto_193674 ?auto_193679 ) ) ( not ( = ?auto_193674 ?auto_193676 ) ) ( not ( = ?auto_193674 ?auto_193672 ) ) ( not ( = ?auto_193674 ?auto_193671 ) ) ( not ( = ?auto_193679 ?auto_193676 ) ) ( not ( = ?auto_193679 ?auto_193672 ) ) ( not ( = ?auto_193679 ?auto_193671 ) ) ( ON ?auto_193671 ?auto_193675 ) ( not ( = ?auto_193671 ?auto_193675 ) ) ( not ( = ?auto_193672 ?auto_193675 ) ) ( not ( = ?auto_193676 ?auto_193675 ) ) ( not ( = ?auto_193677 ?auto_193675 ) ) ( not ( = ?auto_193678 ?auto_193675 ) ) ( not ( = ?auto_193673 ?auto_193675 ) ) ( not ( = ?auto_193674 ?auto_193675 ) ) ( not ( = ?auto_193679 ?auto_193675 ) ) ( ON ?auto_193672 ?auto_193671 ) ( ON-TABLE ?auto_193675 ) ( ON ?auto_193676 ?auto_193672 ) ( CLEAR ?auto_193676 ) ( HOLDING ?auto_193679 ) ( CLEAR ?auto_193674 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_193677 ?auto_193678 ?auto_193673 ?auto_193674 ?auto_193679 )
      ( MAKE-2PILE ?auto_193671 ?auto_193672 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193680 - BLOCK
      ?auto_193681 - BLOCK
    )
    :vars
    (
      ?auto_193687 - BLOCK
      ?auto_193688 - BLOCK
      ?auto_193683 - BLOCK
      ?auto_193682 - BLOCK
      ?auto_193684 - BLOCK
      ?auto_193685 - BLOCK
      ?auto_193686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193680 ?auto_193681 ) ) ( not ( = ?auto_193680 ?auto_193687 ) ) ( not ( = ?auto_193681 ?auto_193687 ) ) ( ON-TABLE ?auto_193688 ) ( ON ?auto_193683 ?auto_193688 ) ( ON ?auto_193682 ?auto_193683 ) ( ON ?auto_193684 ?auto_193682 ) ( not ( = ?auto_193688 ?auto_193683 ) ) ( not ( = ?auto_193688 ?auto_193682 ) ) ( not ( = ?auto_193688 ?auto_193684 ) ) ( not ( = ?auto_193688 ?auto_193685 ) ) ( not ( = ?auto_193688 ?auto_193687 ) ) ( not ( = ?auto_193688 ?auto_193681 ) ) ( not ( = ?auto_193688 ?auto_193680 ) ) ( not ( = ?auto_193683 ?auto_193682 ) ) ( not ( = ?auto_193683 ?auto_193684 ) ) ( not ( = ?auto_193683 ?auto_193685 ) ) ( not ( = ?auto_193683 ?auto_193687 ) ) ( not ( = ?auto_193683 ?auto_193681 ) ) ( not ( = ?auto_193683 ?auto_193680 ) ) ( not ( = ?auto_193682 ?auto_193684 ) ) ( not ( = ?auto_193682 ?auto_193685 ) ) ( not ( = ?auto_193682 ?auto_193687 ) ) ( not ( = ?auto_193682 ?auto_193681 ) ) ( not ( = ?auto_193682 ?auto_193680 ) ) ( not ( = ?auto_193684 ?auto_193685 ) ) ( not ( = ?auto_193684 ?auto_193687 ) ) ( not ( = ?auto_193684 ?auto_193681 ) ) ( not ( = ?auto_193684 ?auto_193680 ) ) ( not ( = ?auto_193685 ?auto_193687 ) ) ( not ( = ?auto_193685 ?auto_193681 ) ) ( not ( = ?auto_193685 ?auto_193680 ) ) ( ON ?auto_193680 ?auto_193686 ) ( not ( = ?auto_193680 ?auto_193686 ) ) ( not ( = ?auto_193681 ?auto_193686 ) ) ( not ( = ?auto_193687 ?auto_193686 ) ) ( not ( = ?auto_193688 ?auto_193686 ) ) ( not ( = ?auto_193683 ?auto_193686 ) ) ( not ( = ?auto_193682 ?auto_193686 ) ) ( not ( = ?auto_193684 ?auto_193686 ) ) ( not ( = ?auto_193685 ?auto_193686 ) ) ( ON ?auto_193681 ?auto_193680 ) ( ON-TABLE ?auto_193686 ) ( ON ?auto_193687 ?auto_193681 ) ( CLEAR ?auto_193684 ) ( ON ?auto_193685 ?auto_193687 ) ( CLEAR ?auto_193685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193686 ?auto_193680 ?auto_193681 ?auto_193687 )
      ( MAKE-2PILE ?auto_193680 ?auto_193681 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193689 - BLOCK
      ?auto_193690 - BLOCK
    )
    :vars
    (
      ?auto_193691 - BLOCK
      ?auto_193694 - BLOCK
      ?auto_193693 - BLOCK
      ?auto_193695 - BLOCK
      ?auto_193696 - BLOCK
      ?auto_193697 - BLOCK
      ?auto_193692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193689 ?auto_193690 ) ) ( not ( = ?auto_193689 ?auto_193691 ) ) ( not ( = ?auto_193690 ?auto_193691 ) ) ( ON-TABLE ?auto_193694 ) ( ON ?auto_193693 ?auto_193694 ) ( ON ?auto_193695 ?auto_193693 ) ( not ( = ?auto_193694 ?auto_193693 ) ) ( not ( = ?auto_193694 ?auto_193695 ) ) ( not ( = ?auto_193694 ?auto_193696 ) ) ( not ( = ?auto_193694 ?auto_193697 ) ) ( not ( = ?auto_193694 ?auto_193691 ) ) ( not ( = ?auto_193694 ?auto_193690 ) ) ( not ( = ?auto_193694 ?auto_193689 ) ) ( not ( = ?auto_193693 ?auto_193695 ) ) ( not ( = ?auto_193693 ?auto_193696 ) ) ( not ( = ?auto_193693 ?auto_193697 ) ) ( not ( = ?auto_193693 ?auto_193691 ) ) ( not ( = ?auto_193693 ?auto_193690 ) ) ( not ( = ?auto_193693 ?auto_193689 ) ) ( not ( = ?auto_193695 ?auto_193696 ) ) ( not ( = ?auto_193695 ?auto_193697 ) ) ( not ( = ?auto_193695 ?auto_193691 ) ) ( not ( = ?auto_193695 ?auto_193690 ) ) ( not ( = ?auto_193695 ?auto_193689 ) ) ( not ( = ?auto_193696 ?auto_193697 ) ) ( not ( = ?auto_193696 ?auto_193691 ) ) ( not ( = ?auto_193696 ?auto_193690 ) ) ( not ( = ?auto_193696 ?auto_193689 ) ) ( not ( = ?auto_193697 ?auto_193691 ) ) ( not ( = ?auto_193697 ?auto_193690 ) ) ( not ( = ?auto_193697 ?auto_193689 ) ) ( ON ?auto_193689 ?auto_193692 ) ( not ( = ?auto_193689 ?auto_193692 ) ) ( not ( = ?auto_193690 ?auto_193692 ) ) ( not ( = ?auto_193691 ?auto_193692 ) ) ( not ( = ?auto_193694 ?auto_193692 ) ) ( not ( = ?auto_193693 ?auto_193692 ) ) ( not ( = ?auto_193695 ?auto_193692 ) ) ( not ( = ?auto_193696 ?auto_193692 ) ) ( not ( = ?auto_193697 ?auto_193692 ) ) ( ON ?auto_193690 ?auto_193689 ) ( ON-TABLE ?auto_193692 ) ( ON ?auto_193691 ?auto_193690 ) ( ON ?auto_193697 ?auto_193691 ) ( CLEAR ?auto_193697 ) ( HOLDING ?auto_193696 ) ( CLEAR ?auto_193695 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193694 ?auto_193693 ?auto_193695 ?auto_193696 )
      ( MAKE-2PILE ?auto_193689 ?auto_193690 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193698 - BLOCK
      ?auto_193699 - BLOCK
    )
    :vars
    (
      ?auto_193705 - BLOCK
      ?auto_193702 - BLOCK
      ?auto_193701 - BLOCK
      ?auto_193704 - BLOCK
      ?auto_193706 - BLOCK
      ?auto_193703 - BLOCK
      ?auto_193700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193698 ?auto_193699 ) ) ( not ( = ?auto_193698 ?auto_193705 ) ) ( not ( = ?auto_193699 ?auto_193705 ) ) ( ON-TABLE ?auto_193702 ) ( ON ?auto_193701 ?auto_193702 ) ( ON ?auto_193704 ?auto_193701 ) ( not ( = ?auto_193702 ?auto_193701 ) ) ( not ( = ?auto_193702 ?auto_193704 ) ) ( not ( = ?auto_193702 ?auto_193706 ) ) ( not ( = ?auto_193702 ?auto_193703 ) ) ( not ( = ?auto_193702 ?auto_193705 ) ) ( not ( = ?auto_193702 ?auto_193699 ) ) ( not ( = ?auto_193702 ?auto_193698 ) ) ( not ( = ?auto_193701 ?auto_193704 ) ) ( not ( = ?auto_193701 ?auto_193706 ) ) ( not ( = ?auto_193701 ?auto_193703 ) ) ( not ( = ?auto_193701 ?auto_193705 ) ) ( not ( = ?auto_193701 ?auto_193699 ) ) ( not ( = ?auto_193701 ?auto_193698 ) ) ( not ( = ?auto_193704 ?auto_193706 ) ) ( not ( = ?auto_193704 ?auto_193703 ) ) ( not ( = ?auto_193704 ?auto_193705 ) ) ( not ( = ?auto_193704 ?auto_193699 ) ) ( not ( = ?auto_193704 ?auto_193698 ) ) ( not ( = ?auto_193706 ?auto_193703 ) ) ( not ( = ?auto_193706 ?auto_193705 ) ) ( not ( = ?auto_193706 ?auto_193699 ) ) ( not ( = ?auto_193706 ?auto_193698 ) ) ( not ( = ?auto_193703 ?auto_193705 ) ) ( not ( = ?auto_193703 ?auto_193699 ) ) ( not ( = ?auto_193703 ?auto_193698 ) ) ( ON ?auto_193698 ?auto_193700 ) ( not ( = ?auto_193698 ?auto_193700 ) ) ( not ( = ?auto_193699 ?auto_193700 ) ) ( not ( = ?auto_193705 ?auto_193700 ) ) ( not ( = ?auto_193702 ?auto_193700 ) ) ( not ( = ?auto_193701 ?auto_193700 ) ) ( not ( = ?auto_193704 ?auto_193700 ) ) ( not ( = ?auto_193706 ?auto_193700 ) ) ( not ( = ?auto_193703 ?auto_193700 ) ) ( ON ?auto_193699 ?auto_193698 ) ( ON-TABLE ?auto_193700 ) ( ON ?auto_193705 ?auto_193699 ) ( ON ?auto_193703 ?auto_193705 ) ( CLEAR ?auto_193704 ) ( ON ?auto_193706 ?auto_193703 ) ( CLEAR ?auto_193706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_193700 ?auto_193698 ?auto_193699 ?auto_193705 ?auto_193703 )
      ( MAKE-2PILE ?auto_193698 ?auto_193699 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193707 - BLOCK
      ?auto_193708 - BLOCK
    )
    :vars
    (
      ?auto_193709 - BLOCK
      ?auto_193710 - BLOCK
      ?auto_193714 - BLOCK
      ?auto_193712 - BLOCK
      ?auto_193713 - BLOCK
      ?auto_193711 - BLOCK
      ?auto_193715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193707 ?auto_193708 ) ) ( not ( = ?auto_193707 ?auto_193709 ) ) ( not ( = ?auto_193708 ?auto_193709 ) ) ( ON-TABLE ?auto_193710 ) ( ON ?auto_193714 ?auto_193710 ) ( not ( = ?auto_193710 ?auto_193714 ) ) ( not ( = ?auto_193710 ?auto_193712 ) ) ( not ( = ?auto_193710 ?auto_193713 ) ) ( not ( = ?auto_193710 ?auto_193711 ) ) ( not ( = ?auto_193710 ?auto_193709 ) ) ( not ( = ?auto_193710 ?auto_193708 ) ) ( not ( = ?auto_193710 ?auto_193707 ) ) ( not ( = ?auto_193714 ?auto_193712 ) ) ( not ( = ?auto_193714 ?auto_193713 ) ) ( not ( = ?auto_193714 ?auto_193711 ) ) ( not ( = ?auto_193714 ?auto_193709 ) ) ( not ( = ?auto_193714 ?auto_193708 ) ) ( not ( = ?auto_193714 ?auto_193707 ) ) ( not ( = ?auto_193712 ?auto_193713 ) ) ( not ( = ?auto_193712 ?auto_193711 ) ) ( not ( = ?auto_193712 ?auto_193709 ) ) ( not ( = ?auto_193712 ?auto_193708 ) ) ( not ( = ?auto_193712 ?auto_193707 ) ) ( not ( = ?auto_193713 ?auto_193711 ) ) ( not ( = ?auto_193713 ?auto_193709 ) ) ( not ( = ?auto_193713 ?auto_193708 ) ) ( not ( = ?auto_193713 ?auto_193707 ) ) ( not ( = ?auto_193711 ?auto_193709 ) ) ( not ( = ?auto_193711 ?auto_193708 ) ) ( not ( = ?auto_193711 ?auto_193707 ) ) ( ON ?auto_193707 ?auto_193715 ) ( not ( = ?auto_193707 ?auto_193715 ) ) ( not ( = ?auto_193708 ?auto_193715 ) ) ( not ( = ?auto_193709 ?auto_193715 ) ) ( not ( = ?auto_193710 ?auto_193715 ) ) ( not ( = ?auto_193714 ?auto_193715 ) ) ( not ( = ?auto_193712 ?auto_193715 ) ) ( not ( = ?auto_193713 ?auto_193715 ) ) ( not ( = ?auto_193711 ?auto_193715 ) ) ( ON ?auto_193708 ?auto_193707 ) ( ON-TABLE ?auto_193715 ) ( ON ?auto_193709 ?auto_193708 ) ( ON ?auto_193711 ?auto_193709 ) ( ON ?auto_193713 ?auto_193711 ) ( CLEAR ?auto_193713 ) ( HOLDING ?auto_193712 ) ( CLEAR ?auto_193714 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_193710 ?auto_193714 ?auto_193712 )
      ( MAKE-2PILE ?auto_193707 ?auto_193708 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193716 - BLOCK
      ?auto_193717 - BLOCK
    )
    :vars
    (
      ?auto_193718 - BLOCK
      ?auto_193720 - BLOCK
      ?auto_193723 - BLOCK
      ?auto_193719 - BLOCK
      ?auto_193721 - BLOCK
      ?auto_193722 - BLOCK
      ?auto_193724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193716 ?auto_193717 ) ) ( not ( = ?auto_193716 ?auto_193718 ) ) ( not ( = ?auto_193717 ?auto_193718 ) ) ( ON-TABLE ?auto_193720 ) ( ON ?auto_193723 ?auto_193720 ) ( not ( = ?auto_193720 ?auto_193723 ) ) ( not ( = ?auto_193720 ?auto_193719 ) ) ( not ( = ?auto_193720 ?auto_193721 ) ) ( not ( = ?auto_193720 ?auto_193722 ) ) ( not ( = ?auto_193720 ?auto_193718 ) ) ( not ( = ?auto_193720 ?auto_193717 ) ) ( not ( = ?auto_193720 ?auto_193716 ) ) ( not ( = ?auto_193723 ?auto_193719 ) ) ( not ( = ?auto_193723 ?auto_193721 ) ) ( not ( = ?auto_193723 ?auto_193722 ) ) ( not ( = ?auto_193723 ?auto_193718 ) ) ( not ( = ?auto_193723 ?auto_193717 ) ) ( not ( = ?auto_193723 ?auto_193716 ) ) ( not ( = ?auto_193719 ?auto_193721 ) ) ( not ( = ?auto_193719 ?auto_193722 ) ) ( not ( = ?auto_193719 ?auto_193718 ) ) ( not ( = ?auto_193719 ?auto_193717 ) ) ( not ( = ?auto_193719 ?auto_193716 ) ) ( not ( = ?auto_193721 ?auto_193722 ) ) ( not ( = ?auto_193721 ?auto_193718 ) ) ( not ( = ?auto_193721 ?auto_193717 ) ) ( not ( = ?auto_193721 ?auto_193716 ) ) ( not ( = ?auto_193722 ?auto_193718 ) ) ( not ( = ?auto_193722 ?auto_193717 ) ) ( not ( = ?auto_193722 ?auto_193716 ) ) ( ON ?auto_193716 ?auto_193724 ) ( not ( = ?auto_193716 ?auto_193724 ) ) ( not ( = ?auto_193717 ?auto_193724 ) ) ( not ( = ?auto_193718 ?auto_193724 ) ) ( not ( = ?auto_193720 ?auto_193724 ) ) ( not ( = ?auto_193723 ?auto_193724 ) ) ( not ( = ?auto_193719 ?auto_193724 ) ) ( not ( = ?auto_193721 ?auto_193724 ) ) ( not ( = ?auto_193722 ?auto_193724 ) ) ( ON ?auto_193717 ?auto_193716 ) ( ON-TABLE ?auto_193724 ) ( ON ?auto_193718 ?auto_193717 ) ( ON ?auto_193722 ?auto_193718 ) ( ON ?auto_193721 ?auto_193722 ) ( CLEAR ?auto_193723 ) ( ON ?auto_193719 ?auto_193721 ) ( CLEAR ?auto_193719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193724 ?auto_193716 ?auto_193717 ?auto_193718 ?auto_193722 ?auto_193721 )
      ( MAKE-2PILE ?auto_193716 ?auto_193717 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193725 - BLOCK
      ?auto_193726 - BLOCK
    )
    :vars
    (
      ?auto_193727 - BLOCK
      ?auto_193728 - BLOCK
      ?auto_193732 - BLOCK
      ?auto_193729 - BLOCK
      ?auto_193731 - BLOCK
      ?auto_193730 - BLOCK
      ?auto_193733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193725 ?auto_193726 ) ) ( not ( = ?auto_193725 ?auto_193727 ) ) ( not ( = ?auto_193726 ?auto_193727 ) ) ( ON-TABLE ?auto_193728 ) ( not ( = ?auto_193728 ?auto_193732 ) ) ( not ( = ?auto_193728 ?auto_193729 ) ) ( not ( = ?auto_193728 ?auto_193731 ) ) ( not ( = ?auto_193728 ?auto_193730 ) ) ( not ( = ?auto_193728 ?auto_193727 ) ) ( not ( = ?auto_193728 ?auto_193726 ) ) ( not ( = ?auto_193728 ?auto_193725 ) ) ( not ( = ?auto_193732 ?auto_193729 ) ) ( not ( = ?auto_193732 ?auto_193731 ) ) ( not ( = ?auto_193732 ?auto_193730 ) ) ( not ( = ?auto_193732 ?auto_193727 ) ) ( not ( = ?auto_193732 ?auto_193726 ) ) ( not ( = ?auto_193732 ?auto_193725 ) ) ( not ( = ?auto_193729 ?auto_193731 ) ) ( not ( = ?auto_193729 ?auto_193730 ) ) ( not ( = ?auto_193729 ?auto_193727 ) ) ( not ( = ?auto_193729 ?auto_193726 ) ) ( not ( = ?auto_193729 ?auto_193725 ) ) ( not ( = ?auto_193731 ?auto_193730 ) ) ( not ( = ?auto_193731 ?auto_193727 ) ) ( not ( = ?auto_193731 ?auto_193726 ) ) ( not ( = ?auto_193731 ?auto_193725 ) ) ( not ( = ?auto_193730 ?auto_193727 ) ) ( not ( = ?auto_193730 ?auto_193726 ) ) ( not ( = ?auto_193730 ?auto_193725 ) ) ( ON ?auto_193725 ?auto_193733 ) ( not ( = ?auto_193725 ?auto_193733 ) ) ( not ( = ?auto_193726 ?auto_193733 ) ) ( not ( = ?auto_193727 ?auto_193733 ) ) ( not ( = ?auto_193728 ?auto_193733 ) ) ( not ( = ?auto_193732 ?auto_193733 ) ) ( not ( = ?auto_193729 ?auto_193733 ) ) ( not ( = ?auto_193731 ?auto_193733 ) ) ( not ( = ?auto_193730 ?auto_193733 ) ) ( ON ?auto_193726 ?auto_193725 ) ( ON-TABLE ?auto_193733 ) ( ON ?auto_193727 ?auto_193726 ) ( ON ?auto_193730 ?auto_193727 ) ( ON ?auto_193731 ?auto_193730 ) ( ON ?auto_193729 ?auto_193731 ) ( CLEAR ?auto_193729 ) ( HOLDING ?auto_193732 ) ( CLEAR ?auto_193728 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193728 ?auto_193732 )
      ( MAKE-2PILE ?auto_193725 ?auto_193726 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193734 - BLOCK
      ?auto_193735 - BLOCK
    )
    :vars
    (
      ?auto_193736 - BLOCK
      ?auto_193740 - BLOCK
      ?auto_193738 - BLOCK
      ?auto_193741 - BLOCK
      ?auto_193739 - BLOCK
      ?auto_193737 - BLOCK
      ?auto_193742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193734 ?auto_193735 ) ) ( not ( = ?auto_193734 ?auto_193736 ) ) ( not ( = ?auto_193735 ?auto_193736 ) ) ( ON-TABLE ?auto_193740 ) ( not ( = ?auto_193740 ?auto_193738 ) ) ( not ( = ?auto_193740 ?auto_193741 ) ) ( not ( = ?auto_193740 ?auto_193739 ) ) ( not ( = ?auto_193740 ?auto_193737 ) ) ( not ( = ?auto_193740 ?auto_193736 ) ) ( not ( = ?auto_193740 ?auto_193735 ) ) ( not ( = ?auto_193740 ?auto_193734 ) ) ( not ( = ?auto_193738 ?auto_193741 ) ) ( not ( = ?auto_193738 ?auto_193739 ) ) ( not ( = ?auto_193738 ?auto_193737 ) ) ( not ( = ?auto_193738 ?auto_193736 ) ) ( not ( = ?auto_193738 ?auto_193735 ) ) ( not ( = ?auto_193738 ?auto_193734 ) ) ( not ( = ?auto_193741 ?auto_193739 ) ) ( not ( = ?auto_193741 ?auto_193737 ) ) ( not ( = ?auto_193741 ?auto_193736 ) ) ( not ( = ?auto_193741 ?auto_193735 ) ) ( not ( = ?auto_193741 ?auto_193734 ) ) ( not ( = ?auto_193739 ?auto_193737 ) ) ( not ( = ?auto_193739 ?auto_193736 ) ) ( not ( = ?auto_193739 ?auto_193735 ) ) ( not ( = ?auto_193739 ?auto_193734 ) ) ( not ( = ?auto_193737 ?auto_193736 ) ) ( not ( = ?auto_193737 ?auto_193735 ) ) ( not ( = ?auto_193737 ?auto_193734 ) ) ( ON ?auto_193734 ?auto_193742 ) ( not ( = ?auto_193734 ?auto_193742 ) ) ( not ( = ?auto_193735 ?auto_193742 ) ) ( not ( = ?auto_193736 ?auto_193742 ) ) ( not ( = ?auto_193740 ?auto_193742 ) ) ( not ( = ?auto_193738 ?auto_193742 ) ) ( not ( = ?auto_193741 ?auto_193742 ) ) ( not ( = ?auto_193739 ?auto_193742 ) ) ( not ( = ?auto_193737 ?auto_193742 ) ) ( ON ?auto_193735 ?auto_193734 ) ( ON-TABLE ?auto_193742 ) ( ON ?auto_193736 ?auto_193735 ) ( ON ?auto_193737 ?auto_193736 ) ( ON ?auto_193739 ?auto_193737 ) ( ON ?auto_193741 ?auto_193739 ) ( CLEAR ?auto_193740 ) ( ON ?auto_193738 ?auto_193741 ) ( CLEAR ?auto_193738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193742 ?auto_193734 ?auto_193735 ?auto_193736 ?auto_193737 ?auto_193739 ?auto_193741 )
      ( MAKE-2PILE ?auto_193734 ?auto_193735 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193743 - BLOCK
      ?auto_193744 - BLOCK
    )
    :vars
    (
      ?auto_193748 - BLOCK
      ?auto_193749 - BLOCK
      ?auto_193747 - BLOCK
      ?auto_193745 - BLOCK
      ?auto_193751 - BLOCK
      ?auto_193750 - BLOCK
      ?auto_193746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193743 ?auto_193744 ) ) ( not ( = ?auto_193743 ?auto_193748 ) ) ( not ( = ?auto_193744 ?auto_193748 ) ) ( not ( = ?auto_193749 ?auto_193747 ) ) ( not ( = ?auto_193749 ?auto_193745 ) ) ( not ( = ?auto_193749 ?auto_193751 ) ) ( not ( = ?auto_193749 ?auto_193750 ) ) ( not ( = ?auto_193749 ?auto_193748 ) ) ( not ( = ?auto_193749 ?auto_193744 ) ) ( not ( = ?auto_193749 ?auto_193743 ) ) ( not ( = ?auto_193747 ?auto_193745 ) ) ( not ( = ?auto_193747 ?auto_193751 ) ) ( not ( = ?auto_193747 ?auto_193750 ) ) ( not ( = ?auto_193747 ?auto_193748 ) ) ( not ( = ?auto_193747 ?auto_193744 ) ) ( not ( = ?auto_193747 ?auto_193743 ) ) ( not ( = ?auto_193745 ?auto_193751 ) ) ( not ( = ?auto_193745 ?auto_193750 ) ) ( not ( = ?auto_193745 ?auto_193748 ) ) ( not ( = ?auto_193745 ?auto_193744 ) ) ( not ( = ?auto_193745 ?auto_193743 ) ) ( not ( = ?auto_193751 ?auto_193750 ) ) ( not ( = ?auto_193751 ?auto_193748 ) ) ( not ( = ?auto_193751 ?auto_193744 ) ) ( not ( = ?auto_193751 ?auto_193743 ) ) ( not ( = ?auto_193750 ?auto_193748 ) ) ( not ( = ?auto_193750 ?auto_193744 ) ) ( not ( = ?auto_193750 ?auto_193743 ) ) ( ON ?auto_193743 ?auto_193746 ) ( not ( = ?auto_193743 ?auto_193746 ) ) ( not ( = ?auto_193744 ?auto_193746 ) ) ( not ( = ?auto_193748 ?auto_193746 ) ) ( not ( = ?auto_193749 ?auto_193746 ) ) ( not ( = ?auto_193747 ?auto_193746 ) ) ( not ( = ?auto_193745 ?auto_193746 ) ) ( not ( = ?auto_193751 ?auto_193746 ) ) ( not ( = ?auto_193750 ?auto_193746 ) ) ( ON ?auto_193744 ?auto_193743 ) ( ON-TABLE ?auto_193746 ) ( ON ?auto_193748 ?auto_193744 ) ( ON ?auto_193750 ?auto_193748 ) ( ON ?auto_193751 ?auto_193750 ) ( ON ?auto_193745 ?auto_193751 ) ( ON ?auto_193747 ?auto_193745 ) ( CLEAR ?auto_193747 ) ( HOLDING ?auto_193749 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_193749 )
      ( MAKE-2PILE ?auto_193743 ?auto_193744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_193752 - BLOCK
      ?auto_193753 - BLOCK
    )
    :vars
    (
      ?auto_193760 - BLOCK
      ?auto_193759 - BLOCK
      ?auto_193755 - BLOCK
      ?auto_193754 - BLOCK
      ?auto_193756 - BLOCK
      ?auto_193758 - BLOCK
      ?auto_193757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193752 ?auto_193753 ) ) ( not ( = ?auto_193752 ?auto_193760 ) ) ( not ( = ?auto_193753 ?auto_193760 ) ) ( not ( = ?auto_193759 ?auto_193755 ) ) ( not ( = ?auto_193759 ?auto_193754 ) ) ( not ( = ?auto_193759 ?auto_193756 ) ) ( not ( = ?auto_193759 ?auto_193758 ) ) ( not ( = ?auto_193759 ?auto_193760 ) ) ( not ( = ?auto_193759 ?auto_193753 ) ) ( not ( = ?auto_193759 ?auto_193752 ) ) ( not ( = ?auto_193755 ?auto_193754 ) ) ( not ( = ?auto_193755 ?auto_193756 ) ) ( not ( = ?auto_193755 ?auto_193758 ) ) ( not ( = ?auto_193755 ?auto_193760 ) ) ( not ( = ?auto_193755 ?auto_193753 ) ) ( not ( = ?auto_193755 ?auto_193752 ) ) ( not ( = ?auto_193754 ?auto_193756 ) ) ( not ( = ?auto_193754 ?auto_193758 ) ) ( not ( = ?auto_193754 ?auto_193760 ) ) ( not ( = ?auto_193754 ?auto_193753 ) ) ( not ( = ?auto_193754 ?auto_193752 ) ) ( not ( = ?auto_193756 ?auto_193758 ) ) ( not ( = ?auto_193756 ?auto_193760 ) ) ( not ( = ?auto_193756 ?auto_193753 ) ) ( not ( = ?auto_193756 ?auto_193752 ) ) ( not ( = ?auto_193758 ?auto_193760 ) ) ( not ( = ?auto_193758 ?auto_193753 ) ) ( not ( = ?auto_193758 ?auto_193752 ) ) ( ON ?auto_193752 ?auto_193757 ) ( not ( = ?auto_193752 ?auto_193757 ) ) ( not ( = ?auto_193753 ?auto_193757 ) ) ( not ( = ?auto_193760 ?auto_193757 ) ) ( not ( = ?auto_193759 ?auto_193757 ) ) ( not ( = ?auto_193755 ?auto_193757 ) ) ( not ( = ?auto_193754 ?auto_193757 ) ) ( not ( = ?auto_193756 ?auto_193757 ) ) ( not ( = ?auto_193758 ?auto_193757 ) ) ( ON ?auto_193753 ?auto_193752 ) ( ON-TABLE ?auto_193757 ) ( ON ?auto_193760 ?auto_193753 ) ( ON ?auto_193758 ?auto_193760 ) ( ON ?auto_193756 ?auto_193758 ) ( ON ?auto_193754 ?auto_193756 ) ( ON ?auto_193755 ?auto_193754 ) ( ON ?auto_193759 ?auto_193755 ) ( CLEAR ?auto_193759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193757 ?auto_193752 ?auto_193753 ?auto_193760 ?auto_193758 ?auto_193756 ?auto_193754 ?auto_193755 )
      ( MAKE-2PILE ?auto_193752 ?auto_193753 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193766 - BLOCK
      ?auto_193767 - BLOCK
      ?auto_193768 - BLOCK
      ?auto_193769 - BLOCK
      ?auto_193770 - BLOCK
    )
    :vars
    (
      ?auto_193771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193771 ?auto_193770 ) ( CLEAR ?auto_193771 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193766 ) ( ON ?auto_193767 ?auto_193766 ) ( ON ?auto_193768 ?auto_193767 ) ( ON ?auto_193769 ?auto_193768 ) ( ON ?auto_193770 ?auto_193769 ) ( not ( = ?auto_193766 ?auto_193767 ) ) ( not ( = ?auto_193766 ?auto_193768 ) ) ( not ( = ?auto_193766 ?auto_193769 ) ) ( not ( = ?auto_193766 ?auto_193770 ) ) ( not ( = ?auto_193766 ?auto_193771 ) ) ( not ( = ?auto_193767 ?auto_193768 ) ) ( not ( = ?auto_193767 ?auto_193769 ) ) ( not ( = ?auto_193767 ?auto_193770 ) ) ( not ( = ?auto_193767 ?auto_193771 ) ) ( not ( = ?auto_193768 ?auto_193769 ) ) ( not ( = ?auto_193768 ?auto_193770 ) ) ( not ( = ?auto_193768 ?auto_193771 ) ) ( not ( = ?auto_193769 ?auto_193770 ) ) ( not ( = ?auto_193769 ?auto_193771 ) ) ( not ( = ?auto_193770 ?auto_193771 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_193771 ?auto_193770 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193772 - BLOCK
      ?auto_193773 - BLOCK
      ?auto_193774 - BLOCK
      ?auto_193775 - BLOCK
      ?auto_193776 - BLOCK
    )
    :vars
    (
      ?auto_193777 - BLOCK
      ?auto_193778 - BLOCK
      ?auto_193779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193777 ?auto_193776 ) ( CLEAR ?auto_193777 ) ( ON-TABLE ?auto_193772 ) ( ON ?auto_193773 ?auto_193772 ) ( ON ?auto_193774 ?auto_193773 ) ( ON ?auto_193775 ?auto_193774 ) ( ON ?auto_193776 ?auto_193775 ) ( not ( = ?auto_193772 ?auto_193773 ) ) ( not ( = ?auto_193772 ?auto_193774 ) ) ( not ( = ?auto_193772 ?auto_193775 ) ) ( not ( = ?auto_193772 ?auto_193776 ) ) ( not ( = ?auto_193772 ?auto_193777 ) ) ( not ( = ?auto_193773 ?auto_193774 ) ) ( not ( = ?auto_193773 ?auto_193775 ) ) ( not ( = ?auto_193773 ?auto_193776 ) ) ( not ( = ?auto_193773 ?auto_193777 ) ) ( not ( = ?auto_193774 ?auto_193775 ) ) ( not ( = ?auto_193774 ?auto_193776 ) ) ( not ( = ?auto_193774 ?auto_193777 ) ) ( not ( = ?auto_193775 ?auto_193776 ) ) ( not ( = ?auto_193775 ?auto_193777 ) ) ( not ( = ?auto_193776 ?auto_193777 ) ) ( HOLDING ?auto_193778 ) ( CLEAR ?auto_193779 ) ( not ( = ?auto_193772 ?auto_193778 ) ) ( not ( = ?auto_193772 ?auto_193779 ) ) ( not ( = ?auto_193773 ?auto_193778 ) ) ( not ( = ?auto_193773 ?auto_193779 ) ) ( not ( = ?auto_193774 ?auto_193778 ) ) ( not ( = ?auto_193774 ?auto_193779 ) ) ( not ( = ?auto_193775 ?auto_193778 ) ) ( not ( = ?auto_193775 ?auto_193779 ) ) ( not ( = ?auto_193776 ?auto_193778 ) ) ( not ( = ?auto_193776 ?auto_193779 ) ) ( not ( = ?auto_193777 ?auto_193778 ) ) ( not ( = ?auto_193777 ?auto_193779 ) ) ( not ( = ?auto_193778 ?auto_193779 ) ) )
    :subtasks
    ( ( !STACK ?auto_193778 ?auto_193779 )
      ( MAKE-5PILE ?auto_193772 ?auto_193773 ?auto_193774 ?auto_193775 ?auto_193776 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193780 - BLOCK
      ?auto_193781 - BLOCK
      ?auto_193782 - BLOCK
      ?auto_193783 - BLOCK
      ?auto_193784 - BLOCK
    )
    :vars
    (
      ?auto_193787 - BLOCK
      ?auto_193786 - BLOCK
      ?auto_193785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193787 ?auto_193784 ) ( ON-TABLE ?auto_193780 ) ( ON ?auto_193781 ?auto_193780 ) ( ON ?auto_193782 ?auto_193781 ) ( ON ?auto_193783 ?auto_193782 ) ( ON ?auto_193784 ?auto_193783 ) ( not ( = ?auto_193780 ?auto_193781 ) ) ( not ( = ?auto_193780 ?auto_193782 ) ) ( not ( = ?auto_193780 ?auto_193783 ) ) ( not ( = ?auto_193780 ?auto_193784 ) ) ( not ( = ?auto_193780 ?auto_193787 ) ) ( not ( = ?auto_193781 ?auto_193782 ) ) ( not ( = ?auto_193781 ?auto_193783 ) ) ( not ( = ?auto_193781 ?auto_193784 ) ) ( not ( = ?auto_193781 ?auto_193787 ) ) ( not ( = ?auto_193782 ?auto_193783 ) ) ( not ( = ?auto_193782 ?auto_193784 ) ) ( not ( = ?auto_193782 ?auto_193787 ) ) ( not ( = ?auto_193783 ?auto_193784 ) ) ( not ( = ?auto_193783 ?auto_193787 ) ) ( not ( = ?auto_193784 ?auto_193787 ) ) ( CLEAR ?auto_193786 ) ( not ( = ?auto_193780 ?auto_193785 ) ) ( not ( = ?auto_193780 ?auto_193786 ) ) ( not ( = ?auto_193781 ?auto_193785 ) ) ( not ( = ?auto_193781 ?auto_193786 ) ) ( not ( = ?auto_193782 ?auto_193785 ) ) ( not ( = ?auto_193782 ?auto_193786 ) ) ( not ( = ?auto_193783 ?auto_193785 ) ) ( not ( = ?auto_193783 ?auto_193786 ) ) ( not ( = ?auto_193784 ?auto_193785 ) ) ( not ( = ?auto_193784 ?auto_193786 ) ) ( not ( = ?auto_193787 ?auto_193785 ) ) ( not ( = ?auto_193787 ?auto_193786 ) ) ( not ( = ?auto_193785 ?auto_193786 ) ) ( ON ?auto_193785 ?auto_193787 ) ( CLEAR ?auto_193785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193780 ?auto_193781 ?auto_193782 ?auto_193783 ?auto_193784 ?auto_193787 )
      ( MAKE-5PILE ?auto_193780 ?auto_193781 ?auto_193782 ?auto_193783 ?auto_193784 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193788 - BLOCK
      ?auto_193789 - BLOCK
      ?auto_193790 - BLOCK
      ?auto_193791 - BLOCK
      ?auto_193792 - BLOCK
    )
    :vars
    (
      ?auto_193794 - BLOCK
      ?auto_193793 - BLOCK
      ?auto_193795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193794 ?auto_193792 ) ( ON-TABLE ?auto_193788 ) ( ON ?auto_193789 ?auto_193788 ) ( ON ?auto_193790 ?auto_193789 ) ( ON ?auto_193791 ?auto_193790 ) ( ON ?auto_193792 ?auto_193791 ) ( not ( = ?auto_193788 ?auto_193789 ) ) ( not ( = ?auto_193788 ?auto_193790 ) ) ( not ( = ?auto_193788 ?auto_193791 ) ) ( not ( = ?auto_193788 ?auto_193792 ) ) ( not ( = ?auto_193788 ?auto_193794 ) ) ( not ( = ?auto_193789 ?auto_193790 ) ) ( not ( = ?auto_193789 ?auto_193791 ) ) ( not ( = ?auto_193789 ?auto_193792 ) ) ( not ( = ?auto_193789 ?auto_193794 ) ) ( not ( = ?auto_193790 ?auto_193791 ) ) ( not ( = ?auto_193790 ?auto_193792 ) ) ( not ( = ?auto_193790 ?auto_193794 ) ) ( not ( = ?auto_193791 ?auto_193792 ) ) ( not ( = ?auto_193791 ?auto_193794 ) ) ( not ( = ?auto_193792 ?auto_193794 ) ) ( not ( = ?auto_193788 ?auto_193793 ) ) ( not ( = ?auto_193788 ?auto_193795 ) ) ( not ( = ?auto_193789 ?auto_193793 ) ) ( not ( = ?auto_193789 ?auto_193795 ) ) ( not ( = ?auto_193790 ?auto_193793 ) ) ( not ( = ?auto_193790 ?auto_193795 ) ) ( not ( = ?auto_193791 ?auto_193793 ) ) ( not ( = ?auto_193791 ?auto_193795 ) ) ( not ( = ?auto_193792 ?auto_193793 ) ) ( not ( = ?auto_193792 ?auto_193795 ) ) ( not ( = ?auto_193794 ?auto_193793 ) ) ( not ( = ?auto_193794 ?auto_193795 ) ) ( not ( = ?auto_193793 ?auto_193795 ) ) ( ON ?auto_193793 ?auto_193794 ) ( CLEAR ?auto_193793 ) ( HOLDING ?auto_193795 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_193795 )
      ( MAKE-5PILE ?auto_193788 ?auto_193789 ?auto_193790 ?auto_193791 ?auto_193792 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193796 - BLOCK
      ?auto_193797 - BLOCK
      ?auto_193798 - BLOCK
      ?auto_193799 - BLOCK
      ?auto_193800 - BLOCK
    )
    :vars
    (
      ?auto_193803 - BLOCK
      ?auto_193801 - BLOCK
      ?auto_193802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193803 ?auto_193800 ) ( ON-TABLE ?auto_193796 ) ( ON ?auto_193797 ?auto_193796 ) ( ON ?auto_193798 ?auto_193797 ) ( ON ?auto_193799 ?auto_193798 ) ( ON ?auto_193800 ?auto_193799 ) ( not ( = ?auto_193796 ?auto_193797 ) ) ( not ( = ?auto_193796 ?auto_193798 ) ) ( not ( = ?auto_193796 ?auto_193799 ) ) ( not ( = ?auto_193796 ?auto_193800 ) ) ( not ( = ?auto_193796 ?auto_193803 ) ) ( not ( = ?auto_193797 ?auto_193798 ) ) ( not ( = ?auto_193797 ?auto_193799 ) ) ( not ( = ?auto_193797 ?auto_193800 ) ) ( not ( = ?auto_193797 ?auto_193803 ) ) ( not ( = ?auto_193798 ?auto_193799 ) ) ( not ( = ?auto_193798 ?auto_193800 ) ) ( not ( = ?auto_193798 ?auto_193803 ) ) ( not ( = ?auto_193799 ?auto_193800 ) ) ( not ( = ?auto_193799 ?auto_193803 ) ) ( not ( = ?auto_193800 ?auto_193803 ) ) ( not ( = ?auto_193796 ?auto_193801 ) ) ( not ( = ?auto_193796 ?auto_193802 ) ) ( not ( = ?auto_193797 ?auto_193801 ) ) ( not ( = ?auto_193797 ?auto_193802 ) ) ( not ( = ?auto_193798 ?auto_193801 ) ) ( not ( = ?auto_193798 ?auto_193802 ) ) ( not ( = ?auto_193799 ?auto_193801 ) ) ( not ( = ?auto_193799 ?auto_193802 ) ) ( not ( = ?auto_193800 ?auto_193801 ) ) ( not ( = ?auto_193800 ?auto_193802 ) ) ( not ( = ?auto_193803 ?auto_193801 ) ) ( not ( = ?auto_193803 ?auto_193802 ) ) ( not ( = ?auto_193801 ?auto_193802 ) ) ( ON ?auto_193801 ?auto_193803 ) ( ON ?auto_193802 ?auto_193801 ) ( CLEAR ?auto_193802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193796 ?auto_193797 ?auto_193798 ?auto_193799 ?auto_193800 ?auto_193803 ?auto_193801 )
      ( MAKE-5PILE ?auto_193796 ?auto_193797 ?auto_193798 ?auto_193799 ?auto_193800 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193804 - BLOCK
      ?auto_193805 - BLOCK
      ?auto_193806 - BLOCK
      ?auto_193807 - BLOCK
      ?auto_193808 - BLOCK
    )
    :vars
    (
      ?auto_193809 - BLOCK
      ?auto_193810 - BLOCK
      ?auto_193811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193809 ?auto_193808 ) ( ON-TABLE ?auto_193804 ) ( ON ?auto_193805 ?auto_193804 ) ( ON ?auto_193806 ?auto_193805 ) ( ON ?auto_193807 ?auto_193806 ) ( ON ?auto_193808 ?auto_193807 ) ( not ( = ?auto_193804 ?auto_193805 ) ) ( not ( = ?auto_193804 ?auto_193806 ) ) ( not ( = ?auto_193804 ?auto_193807 ) ) ( not ( = ?auto_193804 ?auto_193808 ) ) ( not ( = ?auto_193804 ?auto_193809 ) ) ( not ( = ?auto_193805 ?auto_193806 ) ) ( not ( = ?auto_193805 ?auto_193807 ) ) ( not ( = ?auto_193805 ?auto_193808 ) ) ( not ( = ?auto_193805 ?auto_193809 ) ) ( not ( = ?auto_193806 ?auto_193807 ) ) ( not ( = ?auto_193806 ?auto_193808 ) ) ( not ( = ?auto_193806 ?auto_193809 ) ) ( not ( = ?auto_193807 ?auto_193808 ) ) ( not ( = ?auto_193807 ?auto_193809 ) ) ( not ( = ?auto_193808 ?auto_193809 ) ) ( not ( = ?auto_193804 ?auto_193810 ) ) ( not ( = ?auto_193804 ?auto_193811 ) ) ( not ( = ?auto_193805 ?auto_193810 ) ) ( not ( = ?auto_193805 ?auto_193811 ) ) ( not ( = ?auto_193806 ?auto_193810 ) ) ( not ( = ?auto_193806 ?auto_193811 ) ) ( not ( = ?auto_193807 ?auto_193810 ) ) ( not ( = ?auto_193807 ?auto_193811 ) ) ( not ( = ?auto_193808 ?auto_193810 ) ) ( not ( = ?auto_193808 ?auto_193811 ) ) ( not ( = ?auto_193809 ?auto_193810 ) ) ( not ( = ?auto_193809 ?auto_193811 ) ) ( not ( = ?auto_193810 ?auto_193811 ) ) ( ON ?auto_193810 ?auto_193809 ) ( HOLDING ?auto_193811 ) ( CLEAR ?auto_193810 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193804 ?auto_193805 ?auto_193806 ?auto_193807 ?auto_193808 ?auto_193809 ?auto_193810 ?auto_193811 )
      ( MAKE-5PILE ?auto_193804 ?auto_193805 ?auto_193806 ?auto_193807 ?auto_193808 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193812 - BLOCK
      ?auto_193813 - BLOCK
      ?auto_193814 - BLOCK
      ?auto_193815 - BLOCK
      ?auto_193816 - BLOCK
    )
    :vars
    (
      ?auto_193818 - BLOCK
      ?auto_193819 - BLOCK
      ?auto_193817 - BLOCK
      ?auto_193820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193818 ?auto_193816 ) ( ON-TABLE ?auto_193812 ) ( ON ?auto_193813 ?auto_193812 ) ( ON ?auto_193814 ?auto_193813 ) ( ON ?auto_193815 ?auto_193814 ) ( ON ?auto_193816 ?auto_193815 ) ( not ( = ?auto_193812 ?auto_193813 ) ) ( not ( = ?auto_193812 ?auto_193814 ) ) ( not ( = ?auto_193812 ?auto_193815 ) ) ( not ( = ?auto_193812 ?auto_193816 ) ) ( not ( = ?auto_193812 ?auto_193818 ) ) ( not ( = ?auto_193813 ?auto_193814 ) ) ( not ( = ?auto_193813 ?auto_193815 ) ) ( not ( = ?auto_193813 ?auto_193816 ) ) ( not ( = ?auto_193813 ?auto_193818 ) ) ( not ( = ?auto_193814 ?auto_193815 ) ) ( not ( = ?auto_193814 ?auto_193816 ) ) ( not ( = ?auto_193814 ?auto_193818 ) ) ( not ( = ?auto_193815 ?auto_193816 ) ) ( not ( = ?auto_193815 ?auto_193818 ) ) ( not ( = ?auto_193816 ?auto_193818 ) ) ( not ( = ?auto_193812 ?auto_193819 ) ) ( not ( = ?auto_193812 ?auto_193817 ) ) ( not ( = ?auto_193813 ?auto_193819 ) ) ( not ( = ?auto_193813 ?auto_193817 ) ) ( not ( = ?auto_193814 ?auto_193819 ) ) ( not ( = ?auto_193814 ?auto_193817 ) ) ( not ( = ?auto_193815 ?auto_193819 ) ) ( not ( = ?auto_193815 ?auto_193817 ) ) ( not ( = ?auto_193816 ?auto_193819 ) ) ( not ( = ?auto_193816 ?auto_193817 ) ) ( not ( = ?auto_193818 ?auto_193819 ) ) ( not ( = ?auto_193818 ?auto_193817 ) ) ( not ( = ?auto_193819 ?auto_193817 ) ) ( ON ?auto_193819 ?auto_193818 ) ( CLEAR ?auto_193819 ) ( ON ?auto_193817 ?auto_193820 ) ( CLEAR ?auto_193817 ) ( HAND-EMPTY ) ( not ( = ?auto_193812 ?auto_193820 ) ) ( not ( = ?auto_193813 ?auto_193820 ) ) ( not ( = ?auto_193814 ?auto_193820 ) ) ( not ( = ?auto_193815 ?auto_193820 ) ) ( not ( = ?auto_193816 ?auto_193820 ) ) ( not ( = ?auto_193818 ?auto_193820 ) ) ( not ( = ?auto_193819 ?auto_193820 ) ) ( not ( = ?auto_193817 ?auto_193820 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_193817 ?auto_193820 )
      ( MAKE-5PILE ?auto_193812 ?auto_193813 ?auto_193814 ?auto_193815 ?auto_193816 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193821 - BLOCK
      ?auto_193822 - BLOCK
      ?auto_193823 - BLOCK
      ?auto_193824 - BLOCK
      ?auto_193825 - BLOCK
    )
    :vars
    (
      ?auto_193827 - BLOCK
      ?auto_193826 - BLOCK
      ?auto_193828 - BLOCK
      ?auto_193829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193827 ?auto_193825 ) ( ON-TABLE ?auto_193821 ) ( ON ?auto_193822 ?auto_193821 ) ( ON ?auto_193823 ?auto_193822 ) ( ON ?auto_193824 ?auto_193823 ) ( ON ?auto_193825 ?auto_193824 ) ( not ( = ?auto_193821 ?auto_193822 ) ) ( not ( = ?auto_193821 ?auto_193823 ) ) ( not ( = ?auto_193821 ?auto_193824 ) ) ( not ( = ?auto_193821 ?auto_193825 ) ) ( not ( = ?auto_193821 ?auto_193827 ) ) ( not ( = ?auto_193822 ?auto_193823 ) ) ( not ( = ?auto_193822 ?auto_193824 ) ) ( not ( = ?auto_193822 ?auto_193825 ) ) ( not ( = ?auto_193822 ?auto_193827 ) ) ( not ( = ?auto_193823 ?auto_193824 ) ) ( not ( = ?auto_193823 ?auto_193825 ) ) ( not ( = ?auto_193823 ?auto_193827 ) ) ( not ( = ?auto_193824 ?auto_193825 ) ) ( not ( = ?auto_193824 ?auto_193827 ) ) ( not ( = ?auto_193825 ?auto_193827 ) ) ( not ( = ?auto_193821 ?auto_193826 ) ) ( not ( = ?auto_193821 ?auto_193828 ) ) ( not ( = ?auto_193822 ?auto_193826 ) ) ( not ( = ?auto_193822 ?auto_193828 ) ) ( not ( = ?auto_193823 ?auto_193826 ) ) ( not ( = ?auto_193823 ?auto_193828 ) ) ( not ( = ?auto_193824 ?auto_193826 ) ) ( not ( = ?auto_193824 ?auto_193828 ) ) ( not ( = ?auto_193825 ?auto_193826 ) ) ( not ( = ?auto_193825 ?auto_193828 ) ) ( not ( = ?auto_193827 ?auto_193826 ) ) ( not ( = ?auto_193827 ?auto_193828 ) ) ( not ( = ?auto_193826 ?auto_193828 ) ) ( ON ?auto_193828 ?auto_193829 ) ( CLEAR ?auto_193828 ) ( not ( = ?auto_193821 ?auto_193829 ) ) ( not ( = ?auto_193822 ?auto_193829 ) ) ( not ( = ?auto_193823 ?auto_193829 ) ) ( not ( = ?auto_193824 ?auto_193829 ) ) ( not ( = ?auto_193825 ?auto_193829 ) ) ( not ( = ?auto_193827 ?auto_193829 ) ) ( not ( = ?auto_193826 ?auto_193829 ) ) ( not ( = ?auto_193828 ?auto_193829 ) ) ( HOLDING ?auto_193826 ) ( CLEAR ?auto_193827 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193821 ?auto_193822 ?auto_193823 ?auto_193824 ?auto_193825 ?auto_193827 ?auto_193826 )
      ( MAKE-5PILE ?auto_193821 ?auto_193822 ?auto_193823 ?auto_193824 ?auto_193825 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193830 - BLOCK
      ?auto_193831 - BLOCK
      ?auto_193832 - BLOCK
      ?auto_193833 - BLOCK
      ?auto_193834 - BLOCK
    )
    :vars
    (
      ?auto_193838 - BLOCK
      ?auto_193837 - BLOCK
      ?auto_193836 - BLOCK
      ?auto_193835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_193838 ?auto_193834 ) ( ON-TABLE ?auto_193830 ) ( ON ?auto_193831 ?auto_193830 ) ( ON ?auto_193832 ?auto_193831 ) ( ON ?auto_193833 ?auto_193832 ) ( ON ?auto_193834 ?auto_193833 ) ( not ( = ?auto_193830 ?auto_193831 ) ) ( not ( = ?auto_193830 ?auto_193832 ) ) ( not ( = ?auto_193830 ?auto_193833 ) ) ( not ( = ?auto_193830 ?auto_193834 ) ) ( not ( = ?auto_193830 ?auto_193838 ) ) ( not ( = ?auto_193831 ?auto_193832 ) ) ( not ( = ?auto_193831 ?auto_193833 ) ) ( not ( = ?auto_193831 ?auto_193834 ) ) ( not ( = ?auto_193831 ?auto_193838 ) ) ( not ( = ?auto_193832 ?auto_193833 ) ) ( not ( = ?auto_193832 ?auto_193834 ) ) ( not ( = ?auto_193832 ?auto_193838 ) ) ( not ( = ?auto_193833 ?auto_193834 ) ) ( not ( = ?auto_193833 ?auto_193838 ) ) ( not ( = ?auto_193834 ?auto_193838 ) ) ( not ( = ?auto_193830 ?auto_193837 ) ) ( not ( = ?auto_193830 ?auto_193836 ) ) ( not ( = ?auto_193831 ?auto_193837 ) ) ( not ( = ?auto_193831 ?auto_193836 ) ) ( not ( = ?auto_193832 ?auto_193837 ) ) ( not ( = ?auto_193832 ?auto_193836 ) ) ( not ( = ?auto_193833 ?auto_193837 ) ) ( not ( = ?auto_193833 ?auto_193836 ) ) ( not ( = ?auto_193834 ?auto_193837 ) ) ( not ( = ?auto_193834 ?auto_193836 ) ) ( not ( = ?auto_193838 ?auto_193837 ) ) ( not ( = ?auto_193838 ?auto_193836 ) ) ( not ( = ?auto_193837 ?auto_193836 ) ) ( ON ?auto_193836 ?auto_193835 ) ( not ( = ?auto_193830 ?auto_193835 ) ) ( not ( = ?auto_193831 ?auto_193835 ) ) ( not ( = ?auto_193832 ?auto_193835 ) ) ( not ( = ?auto_193833 ?auto_193835 ) ) ( not ( = ?auto_193834 ?auto_193835 ) ) ( not ( = ?auto_193838 ?auto_193835 ) ) ( not ( = ?auto_193837 ?auto_193835 ) ) ( not ( = ?auto_193836 ?auto_193835 ) ) ( CLEAR ?auto_193838 ) ( ON ?auto_193837 ?auto_193836 ) ( CLEAR ?auto_193837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193835 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193835 ?auto_193836 )
      ( MAKE-5PILE ?auto_193830 ?auto_193831 ?auto_193832 ?auto_193833 ?auto_193834 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193857 - BLOCK
      ?auto_193858 - BLOCK
      ?auto_193859 - BLOCK
      ?auto_193860 - BLOCK
      ?auto_193861 - BLOCK
    )
    :vars
    (
      ?auto_193862 - BLOCK
      ?auto_193863 - BLOCK
      ?auto_193864 - BLOCK
      ?auto_193865 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193857 ) ( ON ?auto_193858 ?auto_193857 ) ( ON ?auto_193859 ?auto_193858 ) ( ON ?auto_193860 ?auto_193859 ) ( not ( = ?auto_193857 ?auto_193858 ) ) ( not ( = ?auto_193857 ?auto_193859 ) ) ( not ( = ?auto_193857 ?auto_193860 ) ) ( not ( = ?auto_193857 ?auto_193861 ) ) ( not ( = ?auto_193857 ?auto_193862 ) ) ( not ( = ?auto_193858 ?auto_193859 ) ) ( not ( = ?auto_193858 ?auto_193860 ) ) ( not ( = ?auto_193858 ?auto_193861 ) ) ( not ( = ?auto_193858 ?auto_193862 ) ) ( not ( = ?auto_193859 ?auto_193860 ) ) ( not ( = ?auto_193859 ?auto_193861 ) ) ( not ( = ?auto_193859 ?auto_193862 ) ) ( not ( = ?auto_193860 ?auto_193861 ) ) ( not ( = ?auto_193860 ?auto_193862 ) ) ( not ( = ?auto_193861 ?auto_193862 ) ) ( not ( = ?auto_193857 ?auto_193863 ) ) ( not ( = ?auto_193857 ?auto_193864 ) ) ( not ( = ?auto_193858 ?auto_193863 ) ) ( not ( = ?auto_193858 ?auto_193864 ) ) ( not ( = ?auto_193859 ?auto_193863 ) ) ( not ( = ?auto_193859 ?auto_193864 ) ) ( not ( = ?auto_193860 ?auto_193863 ) ) ( not ( = ?auto_193860 ?auto_193864 ) ) ( not ( = ?auto_193861 ?auto_193863 ) ) ( not ( = ?auto_193861 ?auto_193864 ) ) ( not ( = ?auto_193862 ?auto_193863 ) ) ( not ( = ?auto_193862 ?auto_193864 ) ) ( not ( = ?auto_193863 ?auto_193864 ) ) ( ON ?auto_193864 ?auto_193865 ) ( not ( = ?auto_193857 ?auto_193865 ) ) ( not ( = ?auto_193858 ?auto_193865 ) ) ( not ( = ?auto_193859 ?auto_193865 ) ) ( not ( = ?auto_193860 ?auto_193865 ) ) ( not ( = ?auto_193861 ?auto_193865 ) ) ( not ( = ?auto_193862 ?auto_193865 ) ) ( not ( = ?auto_193863 ?auto_193865 ) ) ( not ( = ?auto_193864 ?auto_193865 ) ) ( ON ?auto_193863 ?auto_193864 ) ( ON-TABLE ?auto_193865 ) ( ON ?auto_193862 ?auto_193863 ) ( CLEAR ?auto_193862 ) ( HOLDING ?auto_193861 ) ( CLEAR ?auto_193860 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193857 ?auto_193858 ?auto_193859 ?auto_193860 ?auto_193861 ?auto_193862 )
      ( MAKE-5PILE ?auto_193857 ?auto_193858 ?auto_193859 ?auto_193860 ?auto_193861 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193866 - BLOCK
      ?auto_193867 - BLOCK
      ?auto_193868 - BLOCK
      ?auto_193869 - BLOCK
      ?auto_193870 - BLOCK
    )
    :vars
    (
      ?auto_193873 - BLOCK
      ?auto_193871 - BLOCK
      ?auto_193872 - BLOCK
      ?auto_193874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193866 ) ( ON ?auto_193867 ?auto_193866 ) ( ON ?auto_193868 ?auto_193867 ) ( ON ?auto_193869 ?auto_193868 ) ( not ( = ?auto_193866 ?auto_193867 ) ) ( not ( = ?auto_193866 ?auto_193868 ) ) ( not ( = ?auto_193866 ?auto_193869 ) ) ( not ( = ?auto_193866 ?auto_193870 ) ) ( not ( = ?auto_193866 ?auto_193873 ) ) ( not ( = ?auto_193867 ?auto_193868 ) ) ( not ( = ?auto_193867 ?auto_193869 ) ) ( not ( = ?auto_193867 ?auto_193870 ) ) ( not ( = ?auto_193867 ?auto_193873 ) ) ( not ( = ?auto_193868 ?auto_193869 ) ) ( not ( = ?auto_193868 ?auto_193870 ) ) ( not ( = ?auto_193868 ?auto_193873 ) ) ( not ( = ?auto_193869 ?auto_193870 ) ) ( not ( = ?auto_193869 ?auto_193873 ) ) ( not ( = ?auto_193870 ?auto_193873 ) ) ( not ( = ?auto_193866 ?auto_193871 ) ) ( not ( = ?auto_193866 ?auto_193872 ) ) ( not ( = ?auto_193867 ?auto_193871 ) ) ( not ( = ?auto_193867 ?auto_193872 ) ) ( not ( = ?auto_193868 ?auto_193871 ) ) ( not ( = ?auto_193868 ?auto_193872 ) ) ( not ( = ?auto_193869 ?auto_193871 ) ) ( not ( = ?auto_193869 ?auto_193872 ) ) ( not ( = ?auto_193870 ?auto_193871 ) ) ( not ( = ?auto_193870 ?auto_193872 ) ) ( not ( = ?auto_193873 ?auto_193871 ) ) ( not ( = ?auto_193873 ?auto_193872 ) ) ( not ( = ?auto_193871 ?auto_193872 ) ) ( ON ?auto_193872 ?auto_193874 ) ( not ( = ?auto_193866 ?auto_193874 ) ) ( not ( = ?auto_193867 ?auto_193874 ) ) ( not ( = ?auto_193868 ?auto_193874 ) ) ( not ( = ?auto_193869 ?auto_193874 ) ) ( not ( = ?auto_193870 ?auto_193874 ) ) ( not ( = ?auto_193873 ?auto_193874 ) ) ( not ( = ?auto_193871 ?auto_193874 ) ) ( not ( = ?auto_193872 ?auto_193874 ) ) ( ON ?auto_193871 ?auto_193872 ) ( ON-TABLE ?auto_193874 ) ( ON ?auto_193873 ?auto_193871 ) ( CLEAR ?auto_193869 ) ( ON ?auto_193870 ?auto_193873 ) ( CLEAR ?auto_193870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193874 ?auto_193872 ?auto_193871 ?auto_193873 )
      ( MAKE-5PILE ?auto_193866 ?auto_193867 ?auto_193868 ?auto_193869 ?auto_193870 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193875 - BLOCK
      ?auto_193876 - BLOCK
      ?auto_193877 - BLOCK
      ?auto_193878 - BLOCK
      ?auto_193879 - BLOCK
    )
    :vars
    (
      ?auto_193883 - BLOCK
      ?auto_193880 - BLOCK
      ?auto_193882 - BLOCK
      ?auto_193881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193875 ) ( ON ?auto_193876 ?auto_193875 ) ( ON ?auto_193877 ?auto_193876 ) ( not ( = ?auto_193875 ?auto_193876 ) ) ( not ( = ?auto_193875 ?auto_193877 ) ) ( not ( = ?auto_193875 ?auto_193878 ) ) ( not ( = ?auto_193875 ?auto_193879 ) ) ( not ( = ?auto_193875 ?auto_193883 ) ) ( not ( = ?auto_193876 ?auto_193877 ) ) ( not ( = ?auto_193876 ?auto_193878 ) ) ( not ( = ?auto_193876 ?auto_193879 ) ) ( not ( = ?auto_193876 ?auto_193883 ) ) ( not ( = ?auto_193877 ?auto_193878 ) ) ( not ( = ?auto_193877 ?auto_193879 ) ) ( not ( = ?auto_193877 ?auto_193883 ) ) ( not ( = ?auto_193878 ?auto_193879 ) ) ( not ( = ?auto_193878 ?auto_193883 ) ) ( not ( = ?auto_193879 ?auto_193883 ) ) ( not ( = ?auto_193875 ?auto_193880 ) ) ( not ( = ?auto_193875 ?auto_193882 ) ) ( not ( = ?auto_193876 ?auto_193880 ) ) ( not ( = ?auto_193876 ?auto_193882 ) ) ( not ( = ?auto_193877 ?auto_193880 ) ) ( not ( = ?auto_193877 ?auto_193882 ) ) ( not ( = ?auto_193878 ?auto_193880 ) ) ( not ( = ?auto_193878 ?auto_193882 ) ) ( not ( = ?auto_193879 ?auto_193880 ) ) ( not ( = ?auto_193879 ?auto_193882 ) ) ( not ( = ?auto_193883 ?auto_193880 ) ) ( not ( = ?auto_193883 ?auto_193882 ) ) ( not ( = ?auto_193880 ?auto_193882 ) ) ( ON ?auto_193882 ?auto_193881 ) ( not ( = ?auto_193875 ?auto_193881 ) ) ( not ( = ?auto_193876 ?auto_193881 ) ) ( not ( = ?auto_193877 ?auto_193881 ) ) ( not ( = ?auto_193878 ?auto_193881 ) ) ( not ( = ?auto_193879 ?auto_193881 ) ) ( not ( = ?auto_193883 ?auto_193881 ) ) ( not ( = ?auto_193880 ?auto_193881 ) ) ( not ( = ?auto_193882 ?auto_193881 ) ) ( ON ?auto_193880 ?auto_193882 ) ( ON-TABLE ?auto_193881 ) ( ON ?auto_193883 ?auto_193880 ) ( ON ?auto_193879 ?auto_193883 ) ( CLEAR ?auto_193879 ) ( HOLDING ?auto_193878 ) ( CLEAR ?auto_193877 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_193875 ?auto_193876 ?auto_193877 ?auto_193878 )
      ( MAKE-5PILE ?auto_193875 ?auto_193876 ?auto_193877 ?auto_193878 ?auto_193879 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193884 - BLOCK
      ?auto_193885 - BLOCK
      ?auto_193886 - BLOCK
      ?auto_193887 - BLOCK
      ?auto_193888 - BLOCK
    )
    :vars
    (
      ?auto_193890 - BLOCK
      ?auto_193892 - BLOCK
      ?auto_193889 - BLOCK
      ?auto_193891 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193884 ) ( ON ?auto_193885 ?auto_193884 ) ( ON ?auto_193886 ?auto_193885 ) ( not ( = ?auto_193884 ?auto_193885 ) ) ( not ( = ?auto_193884 ?auto_193886 ) ) ( not ( = ?auto_193884 ?auto_193887 ) ) ( not ( = ?auto_193884 ?auto_193888 ) ) ( not ( = ?auto_193884 ?auto_193890 ) ) ( not ( = ?auto_193885 ?auto_193886 ) ) ( not ( = ?auto_193885 ?auto_193887 ) ) ( not ( = ?auto_193885 ?auto_193888 ) ) ( not ( = ?auto_193885 ?auto_193890 ) ) ( not ( = ?auto_193886 ?auto_193887 ) ) ( not ( = ?auto_193886 ?auto_193888 ) ) ( not ( = ?auto_193886 ?auto_193890 ) ) ( not ( = ?auto_193887 ?auto_193888 ) ) ( not ( = ?auto_193887 ?auto_193890 ) ) ( not ( = ?auto_193888 ?auto_193890 ) ) ( not ( = ?auto_193884 ?auto_193892 ) ) ( not ( = ?auto_193884 ?auto_193889 ) ) ( not ( = ?auto_193885 ?auto_193892 ) ) ( not ( = ?auto_193885 ?auto_193889 ) ) ( not ( = ?auto_193886 ?auto_193892 ) ) ( not ( = ?auto_193886 ?auto_193889 ) ) ( not ( = ?auto_193887 ?auto_193892 ) ) ( not ( = ?auto_193887 ?auto_193889 ) ) ( not ( = ?auto_193888 ?auto_193892 ) ) ( not ( = ?auto_193888 ?auto_193889 ) ) ( not ( = ?auto_193890 ?auto_193892 ) ) ( not ( = ?auto_193890 ?auto_193889 ) ) ( not ( = ?auto_193892 ?auto_193889 ) ) ( ON ?auto_193889 ?auto_193891 ) ( not ( = ?auto_193884 ?auto_193891 ) ) ( not ( = ?auto_193885 ?auto_193891 ) ) ( not ( = ?auto_193886 ?auto_193891 ) ) ( not ( = ?auto_193887 ?auto_193891 ) ) ( not ( = ?auto_193888 ?auto_193891 ) ) ( not ( = ?auto_193890 ?auto_193891 ) ) ( not ( = ?auto_193892 ?auto_193891 ) ) ( not ( = ?auto_193889 ?auto_193891 ) ) ( ON ?auto_193892 ?auto_193889 ) ( ON-TABLE ?auto_193891 ) ( ON ?auto_193890 ?auto_193892 ) ( ON ?auto_193888 ?auto_193890 ) ( CLEAR ?auto_193886 ) ( ON ?auto_193887 ?auto_193888 ) ( CLEAR ?auto_193887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_193891 ?auto_193889 ?auto_193892 ?auto_193890 ?auto_193888 )
      ( MAKE-5PILE ?auto_193884 ?auto_193885 ?auto_193886 ?auto_193887 ?auto_193888 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193893 - BLOCK
      ?auto_193894 - BLOCK
      ?auto_193895 - BLOCK
      ?auto_193896 - BLOCK
      ?auto_193897 - BLOCK
    )
    :vars
    (
      ?auto_193898 - BLOCK
      ?auto_193901 - BLOCK
      ?auto_193899 - BLOCK
      ?auto_193900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193893 ) ( ON ?auto_193894 ?auto_193893 ) ( not ( = ?auto_193893 ?auto_193894 ) ) ( not ( = ?auto_193893 ?auto_193895 ) ) ( not ( = ?auto_193893 ?auto_193896 ) ) ( not ( = ?auto_193893 ?auto_193897 ) ) ( not ( = ?auto_193893 ?auto_193898 ) ) ( not ( = ?auto_193894 ?auto_193895 ) ) ( not ( = ?auto_193894 ?auto_193896 ) ) ( not ( = ?auto_193894 ?auto_193897 ) ) ( not ( = ?auto_193894 ?auto_193898 ) ) ( not ( = ?auto_193895 ?auto_193896 ) ) ( not ( = ?auto_193895 ?auto_193897 ) ) ( not ( = ?auto_193895 ?auto_193898 ) ) ( not ( = ?auto_193896 ?auto_193897 ) ) ( not ( = ?auto_193896 ?auto_193898 ) ) ( not ( = ?auto_193897 ?auto_193898 ) ) ( not ( = ?auto_193893 ?auto_193901 ) ) ( not ( = ?auto_193893 ?auto_193899 ) ) ( not ( = ?auto_193894 ?auto_193901 ) ) ( not ( = ?auto_193894 ?auto_193899 ) ) ( not ( = ?auto_193895 ?auto_193901 ) ) ( not ( = ?auto_193895 ?auto_193899 ) ) ( not ( = ?auto_193896 ?auto_193901 ) ) ( not ( = ?auto_193896 ?auto_193899 ) ) ( not ( = ?auto_193897 ?auto_193901 ) ) ( not ( = ?auto_193897 ?auto_193899 ) ) ( not ( = ?auto_193898 ?auto_193901 ) ) ( not ( = ?auto_193898 ?auto_193899 ) ) ( not ( = ?auto_193901 ?auto_193899 ) ) ( ON ?auto_193899 ?auto_193900 ) ( not ( = ?auto_193893 ?auto_193900 ) ) ( not ( = ?auto_193894 ?auto_193900 ) ) ( not ( = ?auto_193895 ?auto_193900 ) ) ( not ( = ?auto_193896 ?auto_193900 ) ) ( not ( = ?auto_193897 ?auto_193900 ) ) ( not ( = ?auto_193898 ?auto_193900 ) ) ( not ( = ?auto_193901 ?auto_193900 ) ) ( not ( = ?auto_193899 ?auto_193900 ) ) ( ON ?auto_193901 ?auto_193899 ) ( ON-TABLE ?auto_193900 ) ( ON ?auto_193898 ?auto_193901 ) ( ON ?auto_193897 ?auto_193898 ) ( ON ?auto_193896 ?auto_193897 ) ( CLEAR ?auto_193896 ) ( HOLDING ?auto_193895 ) ( CLEAR ?auto_193894 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_193893 ?auto_193894 ?auto_193895 )
      ( MAKE-5PILE ?auto_193893 ?auto_193894 ?auto_193895 ?auto_193896 ?auto_193897 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193902 - BLOCK
      ?auto_193903 - BLOCK
      ?auto_193904 - BLOCK
      ?auto_193905 - BLOCK
      ?auto_193906 - BLOCK
    )
    :vars
    (
      ?auto_193908 - BLOCK
      ?auto_193909 - BLOCK
      ?auto_193910 - BLOCK
      ?auto_193907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193902 ) ( ON ?auto_193903 ?auto_193902 ) ( not ( = ?auto_193902 ?auto_193903 ) ) ( not ( = ?auto_193902 ?auto_193904 ) ) ( not ( = ?auto_193902 ?auto_193905 ) ) ( not ( = ?auto_193902 ?auto_193906 ) ) ( not ( = ?auto_193902 ?auto_193908 ) ) ( not ( = ?auto_193903 ?auto_193904 ) ) ( not ( = ?auto_193903 ?auto_193905 ) ) ( not ( = ?auto_193903 ?auto_193906 ) ) ( not ( = ?auto_193903 ?auto_193908 ) ) ( not ( = ?auto_193904 ?auto_193905 ) ) ( not ( = ?auto_193904 ?auto_193906 ) ) ( not ( = ?auto_193904 ?auto_193908 ) ) ( not ( = ?auto_193905 ?auto_193906 ) ) ( not ( = ?auto_193905 ?auto_193908 ) ) ( not ( = ?auto_193906 ?auto_193908 ) ) ( not ( = ?auto_193902 ?auto_193909 ) ) ( not ( = ?auto_193902 ?auto_193910 ) ) ( not ( = ?auto_193903 ?auto_193909 ) ) ( not ( = ?auto_193903 ?auto_193910 ) ) ( not ( = ?auto_193904 ?auto_193909 ) ) ( not ( = ?auto_193904 ?auto_193910 ) ) ( not ( = ?auto_193905 ?auto_193909 ) ) ( not ( = ?auto_193905 ?auto_193910 ) ) ( not ( = ?auto_193906 ?auto_193909 ) ) ( not ( = ?auto_193906 ?auto_193910 ) ) ( not ( = ?auto_193908 ?auto_193909 ) ) ( not ( = ?auto_193908 ?auto_193910 ) ) ( not ( = ?auto_193909 ?auto_193910 ) ) ( ON ?auto_193910 ?auto_193907 ) ( not ( = ?auto_193902 ?auto_193907 ) ) ( not ( = ?auto_193903 ?auto_193907 ) ) ( not ( = ?auto_193904 ?auto_193907 ) ) ( not ( = ?auto_193905 ?auto_193907 ) ) ( not ( = ?auto_193906 ?auto_193907 ) ) ( not ( = ?auto_193908 ?auto_193907 ) ) ( not ( = ?auto_193909 ?auto_193907 ) ) ( not ( = ?auto_193910 ?auto_193907 ) ) ( ON ?auto_193909 ?auto_193910 ) ( ON-TABLE ?auto_193907 ) ( ON ?auto_193908 ?auto_193909 ) ( ON ?auto_193906 ?auto_193908 ) ( ON ?auto_193905 ?auto_193906 ) ( CLEAR ?auto_193903 ) ( ON ?auto_193904 ?auto_193905 ) ( CLEAR ?auto_193904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193907 ?auto_193910 ?auto_193909 ?auto_193908 ?auto_193906 ?auto_193905 )
      ( MAKE-5PILE ?auto_193902 ?auto_193903 ?auto_193904 ?auto_193905 ?auto_193906 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193911 - BLOCK
      ?auto_193912 - BLOCK
      ?auto_193913 - BLOCK
      ?auto_193914 - BLOCK
      ?auto_193915 - BLOCK
    )
    :vars
    (
      ?auto_193919 - BLOCK
      ?auto_193916 - BLOCK
      ?auto_193918 - BLOCK
      ?auto_193917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193911 ) ( not ( = ?auto_193911 ?auto_193912 ) ) ( not ( = ?auto_193911 ?auto_193913 ) ) ( not ( = ?auto_193911 ?auto_193914 ) ) ( not ( = ?auto_193911 ?auto_193915 ) ) ( not ( = ?auto_193911 ?auto_193919 ) ) ( not ( = ?auto_193912 ?auto_193913 ) ) ( not ( = ?auto_193912 ?auto_193914 ) ) ( not ( = ?auto_193912 ?auto_193915 ) ) ( not ( = ?auto_193912 ?auto_193919 ) ) ( not ( = ?auto_193913 ?auto_193914 ) ) ( not ( = ?auto_193913 ?auto_193915 ) ) ( not ( = ?auto_193913 ?auto_193919 ) ) ( not ( = ?auto_193914 ?auto_193915 ) ) ( not ( = ?auto_193914 ?auto_193919 ) ) ( not ( = ?auto_193915 ?auto_193919 ) ) ( not ( = ?auto_193911 ?auto_193916 ) ) ( not ( = ?auto_193911 ?auto_193918 ) ) ( not ( = ?auto_193912 ?auto_193916 ) ) ( not ( = ?auto_193912 ?auto_193918 ) ) ( not ( = ?auto_193913 ?auto_193916 ) ) ( not ( = ?auto_193913 ?auto_193918 ) ) ( not ( = ?auto_193914 ?auto_193916 ) ) ( not ( = ?auto_193914 ?auto_193918 ) ) ( not ( = ?auto_193915 ?auto_193916 ) ) ( not ( = ?auto_193915 ?auto_193918 ) ) ( not ( = ?auto_193919 ?auto_193916 ) ) ( not ( = ?auto_193919 ?auto_193918 ) ) ( not ( = ?auto_193916 ?auto_193918 ) ) ( ON ?auto_193918 ?auto_193917 ) ( not ( = ?auto_193911 ?auto_193917 ) ) ( not ( = ?auto_193912 ?auto_193917 ) ) ( not ( = ?auto_193913 ?auto_193917 ) ) ( not ( = ?auto_193914 ?auto_193917 ) ) ( not ( = ?auto_193915 ?auto_193917 ) ) ( not ( = ?auto_193919 ?auto_193917 ) ) ( not ( = ?auto_193916 ?auto_193917 ) ) ( not ( = ?auto_193918 ?auto_193917 ) ) ( ON ?auto_193916 ?auto_193918 ) ( ON-TABLE ?auto_193917 ) ( ON ?auto_193919 ?auto_193916 ) ( ON ?auto_193915 ?auto_193919 ) ( ON ?auto_193914 ?auto_193915 ) ( ON ?auto_193913 ?auto_193914 ) ( CLEAR ?auto_193913 ) ( HOLDING ?auto_193912 ) ( CLEAR ?auto_193911 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193911 ?auto_193912 )
      ( MAKE-5PILE ?auto_193911 ?auto_193912 ?auto_193913 ?auto_193914 ?auto_193915 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193920 - BLOCK
      ?auto_193921 - BLOCK
      ?auto_193922 - BLOCK
      ?auto_193923 - BLOCK
      ?auto_193924 - BLOCK
    )
    :vars
    (
      ?auto_193928 - BLOCK
      ?auto_193926 - BLOCK
      ?auto_193925 - BLOCK
      ?auto_193927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193920 ) ( not ( = ?auto_193920 ?auto_193921 ) ) ( not ( = ?auto_193920 ?auto_193922 ) ) ( not ( = ?auto_193920 ?auto_193923 ) ) ( not ( = ?auto_193920 ?auto_193924 ) ) ( not ( = ?auto_193920 ?auto_193928 ) ) ( not ( = ?auto_193921 ?auto_193922 ) ) ( not ( = ?auto_193921 ?auto_193923 ) ) ( not ( = ?auto_193921 ?auto_193924 ) ) ( not ( = ?auto_193921 ?auto_193928 ) ) ( not ( = ?auto_193922 ?auto_193923 ) ) ( not ( = ?auto_193922 ?auto_193924 ) ) ( not ( = ?auto_193922 ?auto_193928 ) ) ( not ( = ?auto_193923 ?auto_193924 ) ) ( not ( = ?auto_193923 ?auto_193928 ) ) ( not ( = ?auto_193924 ?auto_193928 ) ) ( not ( = ?auto_193920 ?auto_193926 ) ) ( not ( = ?auto_193920 ?auto_193925 ) ) ( not ( = ?auto_193921 ?auto_193926 ) ) ( not ( = ?auto_193921 ?auto_193925 ) ) ( not ( = ?auto_193922 ?auto_193926 ) ) ( not ( = ?auto_193922 ?auto_193925 ) ) ( not ( = ?auto_193923 ?auto_193926 ) ) ( not ( = ?auto_193923 ?auto_193925 ) ) ( not ( = ?auto_193924 ?auto_193926 ) ) ( not ( = ?auto_193924 ?auto_193925 ) ) ( not ( = ?auto_193928 ?auto_193926 ) ) ( not ( = ?auto_193928 ?auto_193925 ) ) ( not ( = ?auto_193926 ?auto_193925 ) ) ( ON ?auto_193925 ?auto_193927 ) ( not ( = ?auto_193920 ?auto_193927 ) ) ( not ( = ?auto_193921 ?auto_193927 ) ) ( not ( = ?auto_193922 ?auto_193927 ) ) ( not ( = ?auto_193923 ?auto_193927 ) ) ( not ( = ?auto_193924 ?auto_193927 ) ) ( not ( = ?auto_193928 ?auto_193927 ) ) ( not ( = ?auto_193926 ?auto_193927 ) ) ( not ( = ?auto_193925 ?auto_193927 ) ) ( ON ?auto_193926 ?auto_193925 ) ( ON-TABLE ?auto_193927 ) ( ON ?auto_193928 ?auto_193926 ) ( ON ?auto_193924 ?auto_193928 ) ( ON ?auto_193923 ?auto_193924 ) ( ON ?auto_193922 ?auto_193923 ) ( CLEAR ?auto_193920 ) ( ON ?auto_193921 ?auto_193922 ) ( CLEAR ?auto_193921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193927 ?auto_193925 ?auto_193926 ?auto_193928 ?auto_193924 ?auto_193923 ?auto_193922 )
      ( MAKE-5PILE ?auto_193920 ?auto_193921 ?auto_193922 ?auto_193923 ?auto_193924 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193929 - BLOCK
      ?auto_193930 - BLOCK
      ?auto_193931 - BLOCK
      ?auto_193932 - BLOCK
      ?auto_193933 - BLOCK
    )
    :vars
    (
      ?auto_193937 - BLOCK
      ?auto_193936 - BLOCK
      ?auto_193934 - BLOCK
      ?auto_193935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193929 ?auto_193930 ) ) ( not ( = ?auto_193929 ?auto_193931 ) ) ( not ( = ?auto_193929 ?auto_193932 ) ) ( not ( = ?auto_193929 ?auto_193933 ) ) ( not ( = ?auto_193929 ?auto_193937 ) ) ( not ( = ?auto_193930 ?auto_193931 ) ) ( not ( = ?auto_193930 ?auto_193932 ) ) ( not ( = ?auto_193930 ?auto_193933 ) ) ( not ( = ?auto_193930 ?auto_193937 ) ) ( not ( = ?auto_193931 ?auto_193932 ) ) ( not ( = ?auto_193931 ?auto_193933 ) ) ( not ( = ?auto_193931 ?auto_193937 ) ) ( not ( = ?auto_193932 ?auto_193933 ) ) ( not ( = ?auto_193932 ?auto_193937 ) ) ( not ( = ?auto_193933 ?auto_193937 ) ) ( not ( = ?auto_193929 ?auto_193936 ) ) ( not ( = ?auto_193929 ?auto_193934 ) ) ( not ( = ?auto_193930 ?auto_193936 ) ) ( not ( = ?auto_193930 ?auto_193934 ) ) ( not ( = ?auto_193931 ?auto_193936 ) ) ( not ( = ?auto_193931 ?auto_193934 ) ) ( not ( = ?auto_193932 ?auto_193936 ) ) ( not ( = ?auto_193932 ?auto_193934 ) ) ( not ( = ?auto_193933 ?auto_193936 ) ) ( not ( = ?auto_193933 ?auto_193934 ) ) ( not ( = ?auto_193937 ?auto_193936 ) ) ( not ( = ?auto_193937 ?auto_193934 ) ) ( not ( = ?auto_193936 ?auto_193934 ) ) ( ON ?auto_193934 ?auto_193935 ) ( not ( = ?auto_193929 ?auto_193935 ) ) ( not ( = ?auto_193930 ?auto_193935 ) ) ( not ( = ?auto_193931 ?auto_193935 ) ) ( not ( = ?auto_193932 ?auto_193935 ) ) ( not ( = ?auto_193933 ?auto_193935 ) ) ( not ( = ?auto_193937 ?auto_193935 ) ) ( not ( = ?auto_193936 ?auto_193935 ) ) ( not ( = ?auto_193934 ?auto_193935 ) ) ( ON ?auto_193936 ?auto_193934 ) ( ON-TABLE ?auto_193935 ) ( ON ?auto_193937 ?auto_193936 ) ( ON ?auto_193933 ?auto_193937 ) ( ON ?auto_193932 ?auto_193933 ) ( ON ?auto_193931 ?auto_193932 ) ( ON ?auto_193930 ?auto_193931 ) ( CLEAR ?auto_193930 ) ( HOLDING ?auto_193929 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_193929 )
      ( MAKE-5PILE ?auto_193929 ?auto_193930 ?auto_193931 ?auto_193932 ?auto_193933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_193938 - BLOCK
      ?auto_193939 - BLOCK
      ?auto_193940 - BLOCK
      ?auto_193941 - BLOCK
      ?auto_193942 - BLOCK
    )
    :vars
    (
      ?auto_193945 - BLOCK
      ?auto_193944 - BLOCK
      ?auto_193946 - BLOCK
      ?auto_193943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193938 ?auto_193939 ) ) ( not ( = ?auto_193938 ?auto_193940 ) ) ( not ( = ?auto_193938 ?auto_193941 ) ) ( not ( = ?auto_193938 ?auto_193942 ) ) ( not ( = ?auto_193938 ?auto_193945 ) ) ( not ( = ?auto_193939 ?auto_193940 ) ) ( not ( = ?auto_193939 ?auto_193941 ) ) ( not ( = ?auto_193939 ?auto_193942 ) ) ( not ( = ?auto_193939 ?auto_193945 ) ) ( not ( = ?auto_193940 ?auto_193941 ) ) ( not ( = ?auto_193940 ?auto_193942 ) ) ( not ( = ?auto_193940 ?auto_193945 ) ) ( not ( = ?auto_193941 ?auto_193942 ) ) ( not ( = ?auto_193941 ?auto_193945 ) ) ( not ( = ?auto_193942 ?auto_193945 ) ) ( not ( = ?auto_193938 ?auto_193944 ) ) ( not ( = ?auto_193938 ?auto_193946 ) ) ( not ( = ?auto_193939 ?auto_193944 ) ) ( not ( = ?auto_193939 ?auto_193946 ) ) ( not ( = ?auto_193940 ?auto_193944 ) ) ( not ( = ?auto_193940 ?auto_193946 ) ) ( not ( = ?auto_193941 ?auto_193944 ) ) ( not ( = ?auto_193941 ?auto_193946 ) ) ( not ( = ?auto_193942 ?auto_193944 ) ) ( not ( = ?auto_193942 ?auto_193946 ) ) ( not ( = ?auto_193945 ?auto_193944 ) ) ( not ( = ?auto_193945 ?auto_193946 ) ) ( not ( = ?auto_193944 ?auto_193946 ) ) ( ON ?auto_193946 ?auto_193943 ) ( not ( = ?auto_193938 ?auto_193943 ) ) ( not ( = ?auto_193939 ?auto_193943 ) ) ( not ( = ?auto_193940 ?auto_193943 ) ) ( not ( = ?auto_193941 ?auto_193943 ) ) ( not ( = ?auto_193942 ?auto_193943 ) ) ( not ( = ?auto_193945 ?auto_193943 ) ) ( not ( = ?auto_193944 ?auto_193943 ) ) ( not ( = ?auto_193946 ?auto_193943 ) ) ( ON ?auto_193944 ?auto_193946 ) ( ON-TABLE ?auto_193943 ) ( ON ?auto_193945 ?auto_193944 ) ( ON ?auto_193942 ?auto_193945 ) ( ON ?auto_193941 ?auto_193942 ) ( ON ?auto_193940 ?auto_193941 ) ( ON ?auto_193939 ?auto_193940 ) ( ON ?auto_193938 ?auto_193939 ) ( CLEAR ?auto_193938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193943 ?auto_193946 ?auto_193944 ?auto_193945 ?auto_193942 ?auto_193941 ?auto_193940 ?auto_193939 )
      ( MAKE-5PILE ?auto_193938 ?auto_193939 ?auto_193940 ?auto_193941 ?auto_193942 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_193950 - BLOCK
      ?auto_193951 - BLOCK
      ?auto_193952 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_193952 ) ( CLEAR ?auto_193951 ) ( ON-TABLE ?auto_193950 ) ( ON ?auto_193951 ?auto_193950 ) ( not ( = ?auto_193950 ?auto_193951 ) ) ( not ( = ?auto_193950 ?auto_193952 ) ) ( not ( = ?auto_193951 ?auto_193952 ) ) )
    :subtasks
    ( ( !STACK ?auto_193952 ?auto_193951 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_193953 - BLOCK
      ?auto_193954 - BLOCK
      ?auto_193955 - BLOCK
    )
    :vars
    (
      ?auto_193956 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_193954 ) ( ON-TABLE ?auto_193953 ) ( ON ?auto_193954 ?auto_193953 ) ( not ( = ?auto_193953 ?auto_193954 ) ) ( not ( = ?auto_193953 ?auto_193955 ) ) ( not ( = ?auto_193954 ?auto_193955 ) ) ( ON ?auto_193955 ?auto_193956 ) ( CLEAR ?auto_193955 ) ( HAND-EMPTY ) ( not ( = ?auto_193953 ?auto_193956 ) ) ( not ( = ?auto_193954 ?auto_193956 ) ) ( not ( = ?auto_193955 ?auto_193956 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_193955 ?auto_193956 )
      ( MAKE-3PILE ?auto_193953 ?auto_193954 ?auto_193955 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_193957 - BLOCK
      ?auto_193958 - BLOCK
      ?auto_193959 - BLOCK
    )
    :vars
    (
      ?auto_193960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193957 ) ( not ( = ?auto_193957 ?auto_193958 ) ) ( not ( = ?auto_193957 ?auto_193959 ) ) ( not ( = ?auto_193958 ?auto_193959 ) ) ( ON ?auto_193959 ?auto_193960 ) ( CLEAR ?auto_193959 ) ( not ( = ?auto_193957 ?auto_193960 ) ) ( not ( = ?auto_193958 ?auto_193960 ) ) ( not ( = ?auto_193959 ?auto_193960 ) ) ( HOLDING ?auto_193958 ) ( CLEAR ?auto_193957 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_193957 ?auto_193958 )
      ( MAKE-3PILE ?auto_193957 ?auto_193958 ?auto_193959 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_193961 - BLOCK
      ?auto_193962 - BLOCK
      ?auto_193963 - BLOCK
    )
    :vars
    (
      ?auto_193964 - BLOCK
      ?auto_193966 - BLOCK
      ?auto_193968 - BLOCK
      ?auto_193967 - BLOCK
      ?auto_193965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_193961 ) ( not ( = ?auto_193961 ?auto_193962 ) ) ( not ( = ?auto_193961 ?auto_193963 ) ) ( not ( = ?auto_193962 ?auto_193963 ) ) ( ON ?auto_193963 ?auto_193964 ) ( not ( = ?auto_193961 ?auto_193964 ) ) ( not ( = ?auto_193962 ?auto_193964 ) ) ( not ( = ?auto_193963 ?auto_193964 ) ) ( CLEAR ?auto_193961 ) ( ON ?auto_193962 ?auto_193963 ) ( CLEAR ?auto_193962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_193966 ) ( ON ?auto_193968 ?auto_193966 ) ( ON ?auto_193967 ?auto_193968 ) ( ON ?auto_193965 ?auto_193967 ) ( ON ?auto_193964 ?auto_193965 ) ( not ( = ?auto_193966 ?auto_193968 ) ) ( not ( = ?auto_193966 ?auto_193967 ) ) ( not ( = ?auto_193966 ?auto_193965 ) ) ( not ( = ?auto_193966 ?auto_193964 ) ) ( not ( = ?auto_193966 ?auto_193963 ) ) ( not ( = ?auto_193966 ?auto_193962 ) ) ( not ( = ?auto_193968 ?auto_193967 ) ) ( not ( = ?auto_193968 ?auto_193965 ) ) ( not ( = ?auto_193968 ?auto_193964 ) ) ( not ( = ?auto_193968 ?auto_193963 ) ) ( not ( = ?auto_193968 ?auto_193962 ) ) ( not ( = ?auto_193967 ?auto_193965 ) ) ( not ( = ?auto_193967 ?auto_193964 ) ) ( not ( = ?auto_193967 ?auto_193963 ) ) ( not ( = ?auto_193967 ?auto_193962 ) ) ( not ( = ?auto_193965 ?auto_193964 ) ) ( not ( = ?auto_193965 ?auto_193963 ) ) ( not ( = ?auto_193965 ?auto_193962 ) ) ( not ( = ?auto_193961 ?auto_193966 ) ) ( not ( = ?auto_193961 ?auto_193968 ) ) ( not ( = ?auto_193961 ?auto_193967 ) ) ( not ( = ?auto_193961 ?auto_193965 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_193966 ?auto_193968 ?auto_193967 ?auto_193965 ?auto_193964 ?auto_193963 )
      ( MAKE-3PILE ?auto_193961 ?auto_193962 ?auto_193963 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_193969 - BLOCK
      ?auto_193970 - BLOCK
      ?auto_193971 - BLOCK
    )
    :vars
    (
      ?auto_193975 - BLOCK
      ?auto_193973 - BLOCK
      ?auto_193976 - BLOCK
      ?auto_193972 - BLOCK
      ?auto_193974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193969 ?auto_193970 ) ) ( not ( = ?auto_193969 ?auto_193971 ) ) ( not ( = ?auto_193970 ?auto_193971 ) ) ( ON ?auto_193971 ?auto_193975 ) ( not ( = ?auto_193969 ?auto_193975 ) ) ( not ( = ?auto_193970 ?auto_193975 ) ) ( not ( = ?auto_193971 ?auto_193975 ) ) ( ON ?auto_193970 ?auto_193971 ) ( CLEAR ?auto_193970 ) ( ON-TABLE ?auto_193973 ) ( ON ?auto_193976 ?auto_193973 ) ( ON ?auto_193972 ?auto_193976 ) ( ON ?auto_193974 ?auto_193972 ) ( ON ?auto_193975 ?auto_193974 ) ( not ( = ?auto_193973 ?auto_193976 ) ) ( not ( = ?auto_193973 ?auto_193972 ) ) ( not ( = ?auto_193973 ?auto_193974 ) ) ( not ( = ?auto_193973 ?auto_193975 ) ) ( not ( = ?auto_193973 ?auto_193971 ) ) ( not ( = ?auto_193973 ?auto_193970 ) ) ( not ( = ?auto_193976 ?auto_193972 ) ) ( not ( = ?auto_193976 ?auto_193974 ) ) ( not ( = ?auto_193976 ?auto_193975 ) ) ( not ( = ?auto_193976 ?auto_193971 ) ) ( not ( = ?auto_193976 ?auto_193970 ) ) ( not ( = ?auto_193972 ?auto_193974 ) ) ( not ( = ?auto_193972 ?auto_193975 ) ) ( not ( = ?auto_193972 ?auto_193971 ) ) ( not ( = ?auto_193972 ?auto_193970 ) ) ( not ( = ?auto_193974 ?auto_193975 ) ) ( not ( = ?auto_193974 ?auto_193971 ) ) ( not ( = ?auto_193974 ?auto_193970 ) ) ( not ( = ?auto_193969 ?auto_193973 ) ) ( not ( = ?auto_193969 ?auto_193976 ) ) ( not ( = ?auto_193969 ?auto_193972 ) ) ( not ( = ?auto_193969 ?auto_193974 ) ) ( HOLDING ?auto_193969 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_193969 )
      ( MAKE-3PILE ?auto_193969 ?auto_193970 ?auto_193971 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_193977 - BLOCK
      ?auto_193978 - BLOCK
      ?auto_193979 - BLOCK
    )
    :vars
    (
      ?auto_193984 - BLOCK
      ?auto_193981 - BLOCK
      ?auto_193982 - BLOCK
      ?auto_193983 - BLOCK
      ?auto_193980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193977 ?auto_193978 ) ) ( not ( = ?auto_193977 ?auto_193979 ) ) ( not ( = ?auto_193978 ?auto_193979 ) ) ( ON ?auto_193979 ?auto_193984 ) ( not ( = ?auto_193977 ?auto_193984 ) ) ( not ( = ?auto_193978 ?auto_193984 ) ) ( not ( = ?auto_193979 ?auto_193984 ) ) ( ON ?auto_193978 ?auto_193979 ) ( ON-TABLE ?auto_193981 ) ( ON ?auto_193982 ?auto_193981 ) ( ON ?auto_193983 ?auto_193982 ) ( ON ?auto_193980 ?auto_193983 ) ( ON ?auto_193984 ?auto_193980 ) ( not ( = ?auto_193981 ?auto_193982 ) ) ( not ( = ?auto_193981 ?auto_193983 ) ) ( not ( = ?auto_193981 ?auto_193980 ) ) ( not ( = ?auto_193981 ?auto_193984 ) ) ( not ( = ?auto_193981 ?auto_193979 ) ) ( not ( = ?auto_193981 ?auto_193978 ) ) ( not ( = ?auto_193982 ?auto_193983 ) ) ( not ( = ?auto_193982 ?auto_193980 ) ) ( not ( = ?auto_193982 ?auto_193984 ) ) ( not ( = ?auto_193982 ?auto_193979 ) ) ( not ( = ?auto_193982 ?auto_193978 ) ) ( not ( = ?auto_193983 ?auto_193980 ) ) ( not ( = ?auto_193983 ?auto_193984 ) ) ( not ( = ?auto_193983 ?auto_193979 ) ) ( not ( = ?auto_193983 ?auto_193978 ) ) ( not ( = ?auto_193980 ?auto_193984 ) ) ( not ( = ?auto_193980 ?auto_193979 ) ) ( not ( = ?auto_193980 ?auto_193978 ) ) ( not ( = ?auto_193977 ?auto_193981 ) ) ( not ( = ?auto_193977 ?auto_193982 ) ) ( not ( = ?auto_193977 ?auto_193983 ) ) ( not ( = ?auto_193977 ?auto_193980 ) ) ( ON ?auto_193977 ?auto_193978 ) ( CLEAR ?auto_193977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_193981 ?auto_193982 ?auto_193983 ?auto_193980 ?auto_193984 ?auto_193979 ?auto_193978 )
      ( MAKE-3PILE ?auto_193977 ?auto_193978 ?auto_193979 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_193985 - BLOCK
      ?auto_193986 - BLOCK
      ?auto_193987 - BLOCK
    )
    :vars
    (
      ?auto_193990 - BLOCK
      ?auto_193989 - BLOCK
      ?auto_193991 - BLOCK
      ?auto_193992 - BLOCK
      ?auto_193988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193985 ?auto_193986 ) ) ( not ( = ?auto_193985 ?auto_193987 ) ) ( not ( = ?auto_193986 ?auto_193987 ) ) ( ON ?auto_193987 ?auto_193990 ) ( not ( = ?auto_193985 ?auto_193990 ) ) ( not ( = ?auto_193986 ?auto_193990 ) ) ( not ( = ?auto_193987 ?auto_193990 ) ) ( ON ?auto_193986 ?auto_193987 ) ( ON-TABLE ?auto_193989 ) ( ON ?auto_193991 ?auto_193989 ) ( ON ?auto_193992 ?auto_193991 ) ( ON ?auto_193988 ?auto_193992 ) ( ON ?auto_193990 ?auto_193988 ) ( not ( = ?auto_193989 ?auto_193991 ) ) ( not ( = ?auto_193989 ?auto_193992 ) ) ( not ( = ?auto_193989 ?auto_193988 ) ) ( not ( = ?auto_193989 ?auto_193990 ) ) ( not ( = ?auto_193989 ?auto_193987 ) ) ( not ( = ?auto_193989 ?auto_193986 ) ) ( not ( = ?auto_193991 ?auto_193992 ) ) ( not ( = ?auto_193991 ?auto_193988 ) ) ( not ( = ?auto_193991 ?auto_193990 ) ) ( not ( = ?auto_193991 ?auto_193987 ) ) ( not ( = ?auto_193991 ?auto_193986 ) ) ( not ( = ?auto_193992 ?auto_193988 ) ) ( not ( = ?auto_193992 ?auto_193990 ) ) ( not ( = ?auto_193992 ?auto_193987 ) ) ( not ( = ?auto_193992 ?auto_193986 ) ) ( not ( = ?auto_193988 ?auto_193990 ) ) ( not ( = ?auto_193988 ?auto_193987 ) ) ( not ( = ?auto_193988 ?auto_193986 ) ) ( not ( = ?auto_193985 ?auto_193989 ) ) ( not ( = ?auto_193985 ?auto_193991 ) ) ( not ( = ?auto_193985 ?auto_193992 ) ) ( not ( = ?auto_193985 ?auto_193988 ) ) ( HOLDING ?auto_193985 ) ( CLEAR ?auto_193986 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_193989 ?auto_193991 ?auto_193992 ?auto_193988 ?auto_193990 ?auto_193987 ?auto_193986 ?auto_193985 )
      ( MAKE-3PILE ?auto_193985 ?auto_193986 ?auto_193987 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_193993 - BLOCK
      ?auto_193994 - BLOCK
      ?auto_193995 - BLOCK
    )
    :vars
    (
      ?auto_193997 - BLOCK
      ?auto_193996 - BLOCK
      ?auto_193999 - BLOCK
      ?auto_194000 - BLOCK
      ?auto_193998 - BLOCK
      ?auto_194001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_193993 ?auto_193994 ) ) ( not ( = ?auto_193993 ?auto_193995 ) ) ( not ( = ?auto_193994 ?auto_193995 ) ) ( ON ?auto_193995 ?auto_193997 ) ( not ( = ?auto_193993 ?auto_193997 ) ) ( not ( = ?auto_193994 ?auto_193997 ) ) ( not ( = ?auto_193995 ?auto_193997 ) ) ( ON ?auto_193994 ?auto_193995 ) ( ON-TABLE ?auto_193996 ) ( ON ?auto_193999 ?auto_193996 ) ( ON ?auto_194000 ?auto_193999 ) ( ON ?auto_193998 ?auto_194000 ) ( ON ?auto_193997 ?auto_193998 ) ( not ( = ?auto_193996 ?auto_193999 ) ) ( not ( = ?auto_193996 ?auto_194000 ) ) ( not ( = ?auto_193996 ?auto_193998 ) ) ( not ( = ?auto_193996 ?auto_193997 ) ) ( not ( = ?auto_193996 ?auto_193995 ) ) ( not ( = ?auto_193996 ?auto_193994 ) ) ( not ( = ?auto_193999 ?auto_194000 ) ) ( not ( = ?auto_193999 ?auto_193998 ) ) ( not ( = ?auto_193999 ?auto_193997 ) ) ( not ( = ?auto_193999 ?auto_193995 ) ) ( not ( = ?auto_193999 ?auto_193994 ) ) ( not ( = ?auto_194000 ?auto_193998 ) ) ( not ( = ?auto_194000 ?auto_193997 ) ) ( not ( = ?auto_194000 ?auto_193995 ) ) ( not ( = ?auto_194000 ?auto_193994 ) ) ( not ( = ?auto_193998 ?auto_193997 ) ) ( not ( = ?auto_193998 ?auto_193995 ) ) ( not ( = ?auto_193998 ?auto_193994 ) ) ( not ( = ?auto_193993 ?auto_193996 ) ) ( not ( = ?auto_193993 ?auto_193999 ) ) ( not ( = ?auto_193993 ?auto_194000 ) ) ( not ( = ?auto_193993 ?auto_193998 ) ) ( CLEAR ?auto_193994 ) ( ON ?auto_193993 ?auto_194001 ) ( CLEAR ?auto_193993 ) ( HAND-EMPTY ) ( not ( = ?auto_193993 ?auto_194001 ) ) ( not ( = ?auto_193994 ?auto_194001 ) ) ( not ( = ?auto_193995 ?auto_194001 ) ) ( not ( = ?auto_193997 ?auto_194001 ) ) ( not ( = ?auto_193996 ?auto_194001 ) ) ( not ( = ?auto_193999 ?auto_194001 ) ) ( not ( = ?auto_194000 ?auto_194001 ) ) ( not ( = ?auto_193998 ?auto_194001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_193993 ?auto_194001 )
      ( MAKE-3PILE ?auto_193993 ?auto_193994 ?auto_193995 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194002 - BLOCK
      ?auto_194003 - BLOCK
      ?auto_194004 - BLOCK
    )
    :vars
    (
      ?auto_194009 - BLOCK
      ?auto_194007 - BLOCK
      ?auto_194006 - BLOCK
      ?auto_194008 - BLOCK
      ?auto_194005 - BLOCK
      ?auto_194010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194002 ?auto_194003 ) ) ( not ( = ?auto_194002 ?auto_194004 ) ) ( not ( = ?auto_194003 ?auto_194004 ) ) ( ON ?auto_194004 ?auto_194009 ) ( not ( = ?auto_194002 ?auto_194009 ) ) ( not ( = ?auto_194003 ?auto_194009 ) ) ( not ( = ?auto_194004 ?auto_194009 ) ) ( ON-TABLE ?auto_194007 ) ( ON ?auto_194006 ?auto_194007 ) ( ON ?auto_194008 ?auto_194006 ) ( ON ?auto_194005 ?auto_194008 ) ( ON ?auto_194009 ?auto_194005 ) ( not ( = ?auto_194007 ?auto_194006 ) ) ( not ( = ?auto_194007 ?auto_194008 ) ) ( not ( = ?auto_194007 ?auto_194005 ) ) ( not ( = ?auto_194007 ?auto_194009 ) ) ( not ( = ?auto_194007 ?auto_194004 ) ) ( not ( = ?auto_194007 ?auto_194003 ) ) ( not ( = ?auto_194006 ?auto_194008 ) ) ( not ( = ?auto_194006 ?auto_194005 ) ) ( not ( = ?auto_194006 ?auto_194009 ) ) ( not ( = ?auto_194006 ?auto_194004 ) ) ( not ( = ?auto_194006 ?auto_194003 ) ) ( not ( = ?auto_194008 ?auto_194005 ) ) ( not ( = ?auto_194008 ?auto_194009 ) ) ( not ( = ?auto_194008 ?auto_194004 ) ) ( not ( = ?auto_194008 ?auto_194003 ) ) ( not ( = ?auto_194005 ?auto_194009 ) ) ( not ( = ?auto_194005 ?auto_194004 ) ) ( not ( = ?auto_194005 ?auto_194003 ) ) ( not ( = ?auto_194002 ?auto_194007 ) ) ( not ( = ?auto_194002 ?auto_194006 ) ) ( not ( = ?auto_194002 ?auto_194008 ) ) ( not ( = ?auto_194002 ?auto_194005 ) ) ( ON ?auto_194002 ?auto_194010 ) ( CLEAR ?auto_194002 ) ( not ( = ?auto_194002 ?auto_194010 ) ) ( not ( = ?auto_194003 ?auto_194010 ) ) ( not ( = ?auto_194004 ?auto_194010 ) ) ( not ( = ?auto_194009 ?auto_194010 ) ) ( not ( = ?auto_194007 ?auto_194010 ) ) ( not ( = ?auto_194006 ?auto_194010 ) ) ( not ( = ?auto_194008 ?auto_194010 ) ) ( not ( = ?auto_194005 ?auto_194010 ) ) ( HOLDING ?auto_194003 ) ( CLEAR ?auto_194004 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194007 ?auto_194006 ?auto_194008 ?auto_194005 ?auto_194009 ?auto_194004 ?auto_194003 )
      ( MAKE-3PILE ?auto_194002 ?auto_194003 ?auto_194004 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194011 - BLOCK
      ?auto_194012 - BLOCK
      ?auto_194013 - BLOCK
    )
    :vars
    (
      ?auto_194019 - BLOCK
      ?auto_194018 - BLOCK
      ?auto_194017 - BLOCK
      ?auto_194016 - BLOCK
      ?auto_194014 - BLOCK
      ?auto_194015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194011 ?auto_194012 ) ) ( not ( = ?auto_194011 ?auto_194013 ) ) ( not ( = ?auto_194012 ?auto_194013 ) ) ( ON ?auto_194013 ?auto_194019 ) ( not ( = ?auto_194011 ?auto_194019 ) ) ( not ( = ?auto_194012 ?auto_194019 ) ) ( not ( = ?auto_194013 ?auto_194019 ) ) ( ON-TABLE ?auto_194018 ) ( ON ?auto_194017 ?auto_194018 ) ( ON ?auto_194016 ?auto_194017 ) ( ON ?auto_194014 ?auto_194016 ) ( ON ?auto_194019 ?auto_194014 ) ( not ( = ?auto_194018 ?auto_194017 ) ) ( not ( = ?auto_194018 ?auto_194016 ) ) ( not ( = ?auto_194018 ?auto_194014 ) ) ( not ( = ?auto_194018 ?auto_194019 ) ) ( not ( = ?auto_194018 ?auto_194013 ) ) ( not ( = ?auto_194018 ?auto_194012 ) ) ( not ( = ?auto_194017 ?auto_194016 ) ) ( not ( = ?auto_194017 ?auto_194014 ) ) ( not ( = ?auto_194017 ?auto_194019 ) ) ( not ( = ?auto_194017 ?auto_194013 ) ) ( not ( = ?auto_194017 ?auto_194012 ) ) ( not ( = ?auto_194016 ?auto_194014 ) ) ( not ( = ?auto_194016 ?auto_194019 ) ) ( not ( = ?auto_194016 ?auto_194013 ) ) ( not ( = ?auto_194016 ?auto_194012 ) ) ( not ( = ?auto_194014 ?auto_194019 ) ) ( not ( = ?auto_194014 ?auto_194013 ) ) ( not ( = ?auto_194014 ?auto_194012 ) ) ( not ( = ?auto_194011 ?auto_194018 ) ) ( not ( = ?auto_194011 ?auto_194017 ) ) ( not ( = ?auto_194011 ?auto_194016 ) ) ( not ( = ?auto_194011 ?auto_194014 ) ) ( ON ?auto_194011 ?auto_194015 ) ( not ( = ?auto_194011 ?auto_194015 ) ) ( not ( = ?auto_194012 ?auto_194015 ) ) ( not ( = ?auto_194013 ?auto_194015 ) ) ( not ( = ?auto_194019 ?auto_194015 ) ) ( not ( = ?auto_194018 ?auto_194015 ) ) ( not ( = ?auto_194017 ?auto_194015 ) ) ( not ( = ?auto_194016 ?auto_194015 ) ) ( not ( = ?auto_194014 ?auto_194015 ) ) ( CLEAR ?auto_194013 ) ( ON ?auto_194012 ?auto_194011 ) ( CLEAR ?auto_194012 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194015 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194015 ?auto_194011 )
      ( MAKE-3PILE ?auto_194011 ?auto_194012 ?auto_194013 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194020 - BLOCK
      ?auto_194021 - BLOCK
      ?auto_194022 - BLOCK
    )
    :vars
    (
      ?auto_194023 - BLOCK
      ?auto_194024 - BLOCK
      ?auto_194026 - BLOCK
      ?auto_194027 - BLOCK
      ?auto_194025 - BLOCK
      ?auto_194028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194020 ?auto_194021 ) ) ( not ( = ?auto_194020 ?auto_194022 ) ) ( not ( = ?auto_194021 ?auto_194022 ) ) ( not ( = ?auto_194020 ?auto_194023 ) ) ( not ( = ?auto_194021 ?auto_194023 ) ) ( not ( = ?auto_194022 ?auto_194023 ) ) ( ON-TABLE ?auto_194024 ) ( ON ?auto_194026 ?auto_194024 ) ( ON ?auto_194027 ?auto_194026 ) ( ON ?auto_194025 ?auto_194027 ) ( ON ?auto_194023 ?auto_194025 ) ( not ( = ?auto_194024 ?auto_194026 ) ) ( not ( = ?auto_194024 ?auto_194027 ) ) ( not ( = ?auto_194024 ?auto_194025 ) ) ( not ( = ?auto_194024 ?auto_194023 ) ) ( not ( = ?auto_194024 ?auto_194022 ) ) ( not ( = ?auto_194024 ?auto_194021 ) ) ( not ( = ?auto_194026 ?auto_194027 ) ) ( not ( = ?auto_194026 ?auto_194025 ) ) ( not ( = ?auto_194026 ?auto_194023 ) ) ( not ( = ?auto_194026 ?auto_194022 ) ) ( not ( = ?auto_194026 ?auto_194021 ) ) ( not ( = ?auto_194027 ?auto_194025 ) ) ( not ( = ?auto_194027 ?auto_194023 ) ) ( not ( = ?auto_194027 ?auto_194022 ) ) ( not ( = ?auto_194027 ?auto_194021 ) ) ( not ( = ?auto_194025 ?auto_194023 ) ) ( not ( = ?auto_194025 ?auto_194022 ) ) ( not ( = ?auto_194025 ?auto_194021 ) ) ( not ( = ?auto_194020 ?auto_194024 ) ) ( not ( = ?auto_194020 ?auto_194026 ) ) ( not ( = ?auto_194020 ?auto_194027 ) ) ( not ( = ?auto_194020 ?auto_194025 ) ) ( ON ?auto_194020 ?auto_194028 ) ( not ( = ?auto_194020 ?auto_194028 ) ) ( not ( = ?auto_194021 ?auto_194028 ) ) ( not ( = ?auto_194022 ?auto_194028 ) ) ( not ( = ?auto_194023 ?auto_194028 ) ) ( not ( = ?auto_194024 ?auto_194028 ) ) ( not ( = ?auto_194026 ?auto_194028 ) ) ( not ( = ?auto_194027 ?auto_194028 ) ) ( not ( = ?auto_194025 ?auto_194028 ) ) ( ON ?auto_194021 ?auto_194020 ) ( CLEAR ?auto_194021 ) ( ON-TABLE ?auto_194028 ) ( HOLDING ?auto_194022 ) ( CLEAR ?auto_194023 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194024 ?auto_194026 ?auto_194027 ?auto_194025 ?auto_194023 ?auto_194022 )
      ( MAKE-3PILE ?auto_194020 ?auto_194021 ?auto_194022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194029 - BLOCK
      ?auto_194030 - BLOCK
      ?auto_194031 - BLOCK
    )
    :vars
    (
      ?auto_194032 - BLOCK
      ?auto_194035 - BLOCK
      ?auto_194036 - BLOCK
      ?auto_194037 - BLOCK
      ?auto_194034 - BLOCK
      ?auto_194033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194029 ?auto_194030 ) ) ( not ( = ?auto_194029 ?auto_194031 ) ) ( not ( = ?auto_194030 ?auto_194031 ) ) ( not ( = ?auto_194029 ?auto_194032 ) ) ( not ( = ?auto_194030 ?auto_194032 ) ) ( not ( = ?auto_194031 ?auto_194032 ) ) ( ON-TABLE ?auto_194035 ) ( ON ?auto_194036 ?auto_194035 ) ( ON ?auto_194037 ?auto_194036 ) ( ON ?auto_194034 ?auto_194037 ) ( ON ?auto_194032 ?auto_194034 ) ( not ( = ?auto_194035 ?auto_194036 ) ) ( not ( = ?auto_194035 ?auto_194037 ) ) ( not ( = ?auto_194035 ?auto_194034 ) ) ( not ( = ?auto_194035 ?auto_194032 ) ) ( not ( = ?auto_194035 ?auto_194031 ) ) ( not ( = ?auto_194035 ?auto_194030 ) ) ( not ( = ?auto_194036 ?auto_194037 ) ) ( not ( = ?auto_194036 ?auto_194034 ) ) ( not ( = ?auto_194036 ?auto_194032 ) ) ( not ( = ?auto_194036 ?auto_194031 ) ) ( not ( = ?auto_194036 ?auto_194030 ) ) ( not ( = ?auto_194037 ?auto_194034 ) ) ( not ( = ?auto_194037 ?auto_194032 ) ) ( not ( = ?auto_194037 ?auto_194031 ) ) ( not ( = ?auto_194037 ?auto_194030 ) ) ( not ( = ?auto_194034 ?auto_194032 ) ) ( not ( = ?auto_194034 ?auto_194031 ) ) ( not ( = ?auto_194034 ?auto_194030 ) ) ( not ( = ?auto_194029 ?auto_194035 ) ) ( not ( = ?auto_194029 ?auto_194036 ) ) ( not ( = ?auto_194029 ?auto_194037 ) ) ( not ( = ?auto_194029 ?auto_194034 ) ) ( ON ?auto_194029 ?auto_194033 ) ( not ( = ?auto_194029 ?auto_194033 ) ) ( not ( = ?auto_194030 ?auto_194033 ) ) ( not ( = ?auto_194031 ?auto_194033 ) ) ( not ( = ?auto_194032 ?auto_194033 ) ) ( not ( = ?auto_194035 ?auto_194033 ) ) ( not ( = ?auto_194036 ?auto_194033 ) ) ( not ( = ?auto_194037 ?auto_194033 ) ) ( not ( = ?auto_194034 ?auto_194033 ) ) ( ON ?auto_194030 ?auto_194029 ) ( ON-TABLE ?auto_194033 ) ( CLEAR ?auto_194032 ) ( ON ?auto_194031 ?auto_194030 ) ( CLEAR ?auto_194031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194033 ?auto_194029 ?auto_194030 )
      ( MAKE-3PILE ?auto_194029 ?auto_194030 ?auto_194031 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194038 - BLOCK
      ?auto_194039 - BLOCK
      ?auto_194040 - BLOCK
    )
    :vars
    (
      ?auto_194045 - BLOCK
      ?auto_194046 - BLOCK
      ?auto_194042 - BLOCK
      ?auto_194041 - BLOCK
      ?auto_194043 - BLOCK
      ?auto_194044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194038 ?auto_194039 ) ) ( not ( = ?auto_194038 ?auto_194040 ) ) ( not ( = ?auto_194039 ?auto_194040 ) ) ( not ( = ?auto_194038 ?auto_194045 ) ) ( not ( = ?auto_194039 ?auto_194045 ) ) ( not ( = ?auto_194040 ?auto_194045 ) ) ( ON-TABLE ?auto_194046 ) ( ON ?auto_194042 ?auto_194046 ) ( ON ?auto_194041 ?auto_194042 ) ( ON ?auto_194043 ?auto_194041 ) ( not ( = ?auto_194046 ?auto_194042 ) ) ( not ( = ?auto_194046 ?auto_194041 ) ) ( not ( = ?auto_194046 ?auto_194043 ) ) ( not ( = ?auto_194046 ?auto_194045 ) ) ( not ( = ?auto_194046 ?auto_194040 ) ) ( not ( = ?auto_194046 ?auto_194039 ) ) ( not ( = ?auto_194042 ?auto_194041 ) ) ( not ( = ?auto_194042 ?auto_194043 ) ) ( not ( = ?auto_194042 ?auto_194045 ) ) ( not ( = ?auto_194042 ?auto_194040 ) ) ( not ( = ?auto_194042 ?auto_194039 ) ) ( not ( = ?auto_194041 ?auto_194043 ) ) ( not ( = ?auto_194041 ?auto_194045 ) ) ( not ( = ?auto_194041 ?auto_194040 ) ) ( not ( = ?auto_194041 ?auto_194039 ) ) ( not ( = ?auto_194043 ?auto_194045 ) ) ( not ( = ?auto_194043 ?auto_194040 ) ) ( not ( = ?auto_194043 ?auto_194039 ) ) ( not ( = ?auto_194038 ?auto_194046 ) ) ( not ( = ?auto_194038 ?auto_194042 ) ) ( not ( = ?auto_194038 ?auto_194041 ) ) ( not ( = ?auto_194038 ?auto_194043 ) ) ( ON ?auto_194038 ?auto_194044 ) ( not ( = ?auto_194038 ?auto_194044 ) ) ( not ( = ?auto_194039 ?auto_194044 ) ) ( not ( = ?auto_194040 ?auto_194044 ) ) ( not ( = ?auto_194045 ?auto_194044 ) ) ( not ( = ?auto_194046 ?auto_194044 ) ) ( not ( = ?auto_194042 ?auto_194044 ) ) ( not ( = ?auto_194041 ?auto_194044 ) ) ( not ( = ?auto_194043 ?auto_194044 ) ) ( ON ?auto_194039 ?auto_194038 ) ( ON-TABLE ?auto_194044 ) ( ON ?auto_194040 ?auto_194039 ) ( CLEAR ?auto_194040 ) ( HOLDING ?auto_194045 ) ( CLEAR ?auto_194043 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194046 ?auto_194042 ?auto_194041 ?auto_194043 ?auto_194045 )
      ( MAKE-3PILE ?auto_194038 ?auto_194039 ?auto_194040 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194047 - BLOCK
      ?auto_194048 - BLOCK
      ?auto_194049 - BLOCK
    )
    :vars
    (
      ?auto_194055 - BLOCK
      ?auto_194053 - BLOCK
      ?auto_194054 - BLOCK
      ?auto_194050 - BLOCK
      ?auto_194052 - BLOCK
      ?auto_194051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194047 ?auto_194048 ) ) ( not ( = ?auto_194047 ?auto_194049 ) ) ( not ( = ?auto_194048 ?auto_194049 ) ) ( not ( = ?auto_194047 ?auto_194055 ) ) ( not ( = ?auto_194048 ?auto_194055 ) ) ( not ( = ?auto_194049 ?auto_194055 ) ) ( ON-TABLE ?auto_194053 ) ( ON ?auto_194054 ?auto_194053 ) ( ON ?auto_194050 ?auto_194054 ) ( ON ?auto_194052 ?auto_194050 ) ( not ( = ?auto_194053 ?auto_194054 ) ) ( not ( = ?auto_194053 ?auto_194050 ) ) ( not ( = ?auto_194053 ?auto_194052 ) ) ( not ( = ?auto_194053 ?auto_194055 ) ) ( not ( = ?auto_194053 ?auto_194049 ) ) ( not ( = ?auto_194053 ?auto_194048 ) ) ( not ( = ?auto_194054 ?auto_194050 ) ) ( not ( = ?auto_194054 ?auto_194052 ) ) ( not ( = ?auto_194054 ?auto_194055 ) ) ( not ( = ?auto_194054 ?auto_194049 ) ) ( not ( = ?auto_194054 ?auto_194048 ) ) ( not ( = ?auto_194050 ?auto_194052 ) ) ( not ( = ?auto_194050 ?auto_194055 ) ) ( not ( = ?auto_194050 ?auto_194049 ) ) ( not ( = ?auto_194050 ?auto_194048 ) ) ( not ( = ?auto_194052 ?auto_194055 ) ) ( not ( = ?auto_194052 ?auto_194049 ) ) ( not ( = ?auto_194052 ?auto_194048 ) ) ( not ( = ?auto_194047 ?auto_194053 ) ) ( not ( = ?auto_194047 ?auto_194054 ) ) ( not ( = ?auto_194047 ?auto_194050 ) ) ( not ( = ?auto_194047 ?auto_194052 ) ) ( ON ?auto_194047 ?auto_194051 ) ( not ( = ?auto_194047 ?auto_194051 ) ) ( not ( = ?auto_194048 ?auto_194051 ) ) ( not ( = ?auto_194049 ?auto_194051 ) ) ( not ( = ?auto_194055 ?auto_194051 ) ) ( not ( = ?auto_194053 ?auto_194051 ) ) ( not ( = ?auto_194054 ?auto_194051 ) ) ( not ( = ?auto_194050 ?auto_194051 ) ) ( not ( = ?auto_194052 ?auto_194051 ) ) ( ON ?auto_194048 ?auto_194047 ) ( ON-TABLE ?auto_194051 ) ( ON ?auto_194049 ?auto_194048 ) ( CLEAR ?auto_194052 ) ( ON ?auto_194055 ?auto_194049 ) ( CLEAR ?auto_194055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194051 ?auto_194047 ?auto_194048 ?auto_194049 )
      ( MAKE-3PILE ?auto_194047 ?auto_194048 ?auto_194049 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194056 - BLOCK
      ?auto_194057 - BLOCK
      ?auto_194058 - BLOCK
    )
    :vars
    (
      ?auto_194060 - BLOCK
      ?auto_194063 - BLOCK
      ?auto_194061 - BLOCK
      ?auto_194062 - BLOCK
      ?auto_194064 - BLOCK
      ?auto_194059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194056 ?auto_194057 ) ) ( not ( = ?auto_194056 ?auto_194058 ) ) ( not ( = ?auto_194057 ?auto_194058 ) ) ( not ( = ?auto_194056 ?auto_194060 ) ) ( not ( = ?auto_194057 ?auto_194060 ) ) ( not ( = ?auto_194058 ?auto_194060 ) ) ( ON-TABLE ?auto_194063 ) ( ON ?auto_194061 ?auto_194063 ) ( ON ?auto_194062 ?auto_194061 ) ( not ( = ?auto_194063 ?auto_194061 ) ) ( not ( = ?auto_194063 ?auto_194062 ) ) ( not ( = ?auto_194063 ?auto_194064 ) ) ( not ( = ?auto_194063 ?auto_194060 ) ) ( not ( = ?auto_194063 ?auto_194058 ) ) ( not ( = ?auto_194063 ?auto_194057 ) ) ( not ( = ?auto_194061 ?auto_194062 ) ) ( not ( = ?auto_194061 ?auto_194064 ) ) ( not ( = ?auto_194061 ?auto_194060 ) ) ( not ( = ?auto_194061 ?auto_194058 ) ) ( not ( = ?auto_194061 ?auto_194057 ) ) ( not ( = ?auto_194062 ?auto_194064 ) ) ( not ( = ?auto_194062 ?auto_194060 ) ) ( not ( = ?auto_194062 ?auto_194058 ) ) ( not ( = ?auto_194062 ?auto_194057 ) ) ( not ( = ?auto_194064 ?auto_194060 ) ) ( not ( = ?auto_194064 ?auto_194058 ) ) ( not ( = ?auto_194064 ?auto_194057 ) ) ( not ( = ?auto_194056 ?auto_194063 ) ) ( not ( = ?auto_194056 ?auto_194061 ) ) ( not ( = ?auto_194056 ?auto_194062 ) ) ( not ( = ?auto_194056 ?auto_194064 ) ) ( ON ?auto_194056 ?auto_194059 ) ( not ( = ?auto_194056 ?auto_194059 ) ) ( not ( = ?auto_194057 ?auto_194059 ) ) ( not ( = ?auto_194058 ?auto_194059 ) ) ( not ( = ?auto_194060 ?auto_194059 ) ) ( not ( = ?auto_194063 ?auto_194059 ) ) ( not ( = ?auto_194061 ?auto_194059 ) ) ( not ( = ?auto_194062 ?auto_194059 ) ) ( not ( = ?auto_194064 ?auto_194059 ) ) ( ON ?auto_194057 ?auto_194056 ) ( ON-TABLE ?auto_194059 ) ( ON ?auto_194058 ?auto_194057 ) ( ON ?auto_194060 ?auto_194058 ) ( CLEAR ?auto_194060 ) ( HOLDING ?auto_194064 ) ( CLEAR ?auto_194062 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194063 ?auto_194061 ?auto_194062 ?auto_194064 )
      ( MAKE-3PILE ?auto_194056 ?auto_194057 ?auto_194058 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194065 - BLOCK
      ?auto_194066 - BLOCK
      ?auto_194067 - BLOCK
    )
    :vars
    (
      ?auto_194069 - BLOCK
      ?auto_194071 - BLOCK
      ?auto_194068 - BLOCK
      ?auto_194072 - BLOCK
      ?auto_194070 - BLOCK
      ?auto_194073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194065 ?auto_194066 ) ) ( not ( = ?auto_194065 ?auto_194067 ) ) ( not ( = ?auto_194066 ?auto_194067 ) ) ( not ( = ?auto_194065 ?auto_194069 ) ) ( not ( = ?auto_194066 ?auto_194069 ) ) ( not ( = ?auto_194067 ?auto_194069 ) ) ( ON-TABLE ?auto_194071 ) ( ON ?auto_194068 ?auto_194071 ) ( ON ?auto_194072 ?auto_194068 ) ( not ( = ?auto_194071 ?auto_194068 ) ) ( not ( = ?auto_194071 ?auto_194072 ) ) ( not ( = ?auto_194071 ?auto_194070 ) ) ( not ( = ?auto_194071 ?auto_194069 ) ) ( not ( = ?auto_194071 ?auto_194067 ) ) ( not ( = ?auto_194071 ?auto_194066 ) ) ( not ( = ?auto_194068 ?auto_194072 ) ) ( not ( = ?auto_194068 ?auto_194070 ) ) ( not ( = ?auto_194068 ?auto_194069 ) ) ( not ( = ?auto_194068 ?auto_194067 ) ) ( not ( = ?auto_194068 ?auto_194066 ) ) ( not ( = ?auto_194072 ?auto_194070 ) ) ( not ( = ?auto_194072 ?auto_194069 ) ) ( not ( = ?auto_194072 ?auto_194067 ) ) ( not ( = ?auto_194072 ?auto_194066 ) ) ( not ( = ?auto_194070 ?auto_194069 ) ) ( not ( = ?auto_194070 ?auto_194067 ) ) ( not ( = ?auto_194070 ?auto_194066 ) ) ( not ( = ?auto_194065 ?auto_194071 ) ) ( not ( = ?auto_194065 ?auto_194068 ) ) ( not ( = ?auto_194065 ?auto_194072 ) ) ( not ( = ?auto_194065 ?auto_194070 ) ) ( ON ?auto_194065 ?auto_194073 ) ( not ( = ?auto_194065 ?auto_194073 ) ) ( not ( = ?auto_194066 ?auto_194073 ) ) ( not ( = ?auto_194067 ?auto_194073 ) ) ( not ( = ?auto_194069 ?auto_194073 ) ) ( not ( = ?auto_194071 ?auto_194073 ) ) ( not ( = ?auto_194068 ?auto_194073 ) ) ( not ( = ?auto_194072 ?auto_194073 ) ) ( not ( = ?auto_194070 ?auto_194073 ) ) ( ON ?auto_194066 ?auto_194065 ) ( ON-TABLE ?auto_194073 ) ( ON ?auto_194067 ?auto_194066 ) ( ON ?auto_194069 ?auto_194067 ) ( CLEAR ?auto_194072 ) ( ON ?auto_194070 ?auto_194069 ) ( CLEAR ?auto_194070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194073 ?auto_194065 ?auto_194066 ?auto_194067 ?auto_194069 )
      ( MAKE-3PILE ?auto_194065 ?auto_194066 ?auto_194067 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194074 - BLOCK
      ?auto_194075 - BLOCK
      ?auto_194076 - BLOCK
    )
    :vars
    (
      ?auto_194077 - BLOCK
      ?auto_194080 - BLOCK
      ?auto_194081 - BLOCK
      ?auto_194078 - BLOCK
      ?auto_194082 - BLOCK
      ?auto_194079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194074 ?auto_194075 ) ) ( not ( = ?auto_194074 ?auto_194076 ) ) ( not ( = ?auto_194075 ?auto_194076 ) ) ( not ( = ?auto_194074 ?auto_194077 ) ) ( not ( = ?auto_194075 ?auto_194077 ) ) ( not ( = ?auto_194076 ?auto_194077 ) ) ( ON-TABLE ?auto_194080 ) ( ON ?auto_194081 ?auto_194080 ) ( not ( = ?auto_194080 ?auto_194081 ) ) ( not ( = ?auto_194080 ?auto_194078 ) ) ( not ( = ?auto_194080 ?auto_194082 ) ) ( not ( = ?auto_194080 ?auto_194077 ) ) ( not ( = ?auto_194080 ?auto_194076 ) ) ( not ( = ?auto_194080 ?auto_194075 ) ) ( not ( = ?auto_194081 ?auto_194078 ) ) ( not ( = ?auto_194081 ?auto_194082 ) ) ( not ( = ?auto_194081 ?auto_194077 ) ) ( not ( = ?auto_194081 ?auto_194076 ) ) ( not ( = ?auto_194081 ?auto_194075 ) ) ( not ( = ?auto_194078 ?auto_194082 ) ) ( not ( = ?auto_194078 ?auto_194077 ) ) ( not ( = ?auto_194078 ?auto_194076 ) ) ( not ( = ?auto_194078 ?auto_194075 ) ) ( not ( = ?auto_194082 ?auto_194077 ) ) ( not ( = ?auto_194082 ?auto_194076 ) ) ( not ( = ?auto_194082 ?auto_194075 ) ) ( not ( = ?auto_194074 ?auto_194080 ) ) ( not ( = ?auto_194074 ?auto_194081 ) ) ( not ( = ?auto_194074 ?auto_194078 ) ) ( not ( = ?auto_194074 ?auto_194082 ) ) ( ON ?auto_194074 ?auto_194079 ) ( not ( = ?auto_194074 ?auto_194079 ) ) ( not ( = ?auto_194075 ?auto_194079 ) ) ( not ( = ?auto_194076 ?auto_194079 ) ) ( not ( = ?auto_194077 ?auto_194079 ) ) ( not ( = ?auto_194080 ?auto_194079 ) ) ( not ( = ?auto_194081 ?auto_194079 ) ) ( not ( = ?auto_194078 ?auto_194079 ) ) ( not ( = ?auto_194082 ?auto_194079 ) ) ( ON ?auto_194075 ?auto_194074 ) ( ON-TABLE ?auto_194079 ) ( ON ?auto_194076 ?auto_194075 ) ( ON ?auto_194077 ?auto_194076 ) ( ON ?auto_194082 ?auto_194077 ) ( CLEAR ?auto_194082 ) ( HOLDING ?auto_194078 ) ( CLEAR ?auto_194081 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194080 ?auto_194081 ?auto_194078 )
      ( MAKE-3PILE ?auto_194074 ?auto_194075 ?auto_194076 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194083 - BLOCK
      ?auto_194084 - BLOCK
      ?auto_194085 - BLOCK
    )
    :vars
    (
      ?auto_194087 - BLOCK
      ?auto_194088 - BLOCK
      ?auto_194086 - BLOCK
      ?auto_194090 - BLOCK
      ?auto_194091 - BLOCK
      ?auto_194089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194083 ?auto_194084 ) ) ( not ( = ?auto_194083 ?auto_194085 ) ) ( not ( = ?auto_194084 ?auto_194085 ) ) ( not ( = ?auto_194083 ?auto_194087 ) ) ( not ( = ?auto_194084 ?auto_194087 ) ) ( not ( = ?auto_194085 ?auto_194087 ) ) ( ON-TABLE ?auto_194088 ) ( ON ?auto_194086 ?auto_194088 ) ( not ( = ?auto_194088 ?auto_194086 ) ) ( not ( = ?auto_194088 ?auto_194090 ) ) ( not ( = ?auto_194088 ?auto_194091 ) ) ( not ( = ?auto_194088 ?auto_194087 ) ) ( not ( = ?auto_194088 ?auto_194085 ) ) ( not ( = ?auto_194088 ?auto_194084 ) ) ( not ( = ?auto_194086 ?auto_194090 ) ) ( not ( = ?auto_194086 ?auto_194091 ) ) ( not ( = ?auto_194086 ?auto_194087 ) ) ( not ( = ?auto_194086 ?auto_194085 ) ) ( not ( = ?auto_194086 ?auto_194084 ) ) ( not ( = ?auto_194090 ?auto_194091 ) ) ( not ( = ?auto_194090 ?auto_194087 ) ) ( not ( = ?auto_194090 ?auto_194085 ) ) ( not ( = ?auto_194090 ?auto_194084 ) ) ( not ( = ?auto_194091 ?auto_194087 ) ) ( not ( = ?auto_194091 ?auto_194085 ) ) ( not ( = ?auto_194091 ?auto_194084 ) ) ( not ( = ?auto_194083 ?auto_194088 ) ) ( not ( = ?auto_194083 ?auto_194086 ) ) ( not ( = ?auto_194083 ?auto_194090 ) ) ( not ( = ?auto_194083 ?auto_194091 ) ) ( ON ?auto_194083 ?auto_194089 ) ( not ( = ?auto_194083 ?auto_194089 ) ) ( not ( = ?auto_194084 ?auto_194089 ) ) ( not ( = ?auto_194085 ?auto_194089 ) ) ( not ( = ?auto_194087 ?auto_194089 ) ) ( not ( = ?auto_194088 ?auto_194089 ) ) ( not ( = ?auto_194086 ?auto_194089 ) ) ( not ( = ?auto_194090 ?auto_194089 ) ) ( not ( = ?auto_194091 ?auto_194089 ) ) ( ON ?auto_194084 ?auto_194083 ) ( ON-TABLE ?auto_194089 ) ( ON ?auto_194085 ?auto_194084 ) ( ON ?auto_194087 ?auto_194085 ) ( ON ?auto_194091 ?auto_194087 ) ( CLEAR ?auto_194086 ) ( ON ?auto_194090 ?auto_194091 ) ( CLEAR ?auto_194090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194089 ?auto_194083 ?auto_194084 ?auto_194085 ?auto_194087 ?auto_194091 )
      ( MAKE-3PILE ?auto_194083 ?auto_194084 ?auto_194085 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194092 - BLOCK
      ?auto_194093 - BLOCK
      ?auto_194094 - BLOCK
    )
    :vars
    (
      ?auto_194098 - BLOCK
      ?auto_194095 - BLOCK
      ?auto_194097 - BLOCK
      ?auto_194100 - BLOCK
      ?auto_194096 - BLOCK
      ?auto_194099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194092 ?auto_194093 ) ) ( not ( = ?auto_194092 ?auto_194094 ) ) ( not ( = ?auto_194093 ?auto_194094 ) ) ( not ( = ?auto_194092 ?auto_194098 ) ) ( not ( = ?auto_194093 ?auto_194098 ) ) ( not ( = ?auto_194094 ?auto_194098 ) ) ( ON-TABLE ?auto_194095 ) ( not ( = ?auto_194095 ?auto_194097 ) ) ( not ( = ?auto_194095 ?auto_194100 ) ) ( not ( = ?auto_194095 ?auto_194096 ) ) ( not ( = ?auto_194095 ?auto_194098 ) ) ( not ( = ?auto_194095 ?auto_194094 ) ) ( not ( = ?auto_194095 ?auto_194093 ) ) ( not ( = ?auto_194097 ?auto_194100 ) ) ( not ( = ?auto_194097 ?auto_194096 ) ) ( not ( = ?auto_194097 ?auto_194098 ) ) ( not ( = ?auto_194097 ?auto_194094 ) ) ( not ( = ?auto_194097 ?auto_194093 ) ) ( not ( = ?auto_194100 ?auto_194096 ) ) ( not ( = ?auto_194100 ?auto_194098 ) ) ( not ( = ?auto_194100 ?auto_194094 ) ) ( not ( = ?auto_194100 ?auto_194093 ) ) ( not ( = ?auto_194096 ?auto_194098 ) ) ( not ( = ?auto_194096 ?auto_194094 ) ) ( not ( = ?auto_194096 ?auto_194093 ) ) ( not ( = ?auto_194092 ?auto_194095 ) ) ( not ( = ?auto_194092 ?auto_194097 ) ) ( not ( = ?auto_194092 ?auto_194100 ) ) ( not ( = ?auto_194092 ?auto_194096 ) ) ( ON ?auto_194092 ?auto_194099 ) ( not ( = ?auto_194092 ?auto_194099 ) ) ( not ( = ?auto_194093 ?auto_194099 ) ) ( not ( = ?auto_194094 ?auto_194099 ) ) ( not ( = ?auto_194098 ?auto_194099 ) ) ( not ( = ?auto_194095 ?auto_194099 ) ) ( not ( = ?auto_194097 ?auto_194099 ) ) ( not ( = ?auto_194100 ?auto_194099 ) ) ( not ( = ?auto_194096 ?auto_194099 ) ) ( ON ?auto_194093 ?auto_194092 ) ( ON-TABLE ?auto_194099 ) ( ON ?auto_194094 ?auto_194093 ) ( ON ?auto_194098 ?auto_194094 ) ( ON ?auto_194096 ?auto_194098 ) ( ON ?auto_194100 ?auto_194096 ) ( CLEAR ?auto_194100 ) ( HOLDING ?auto_194097 ) ( CLEAR ?auto_194095 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194095 ?auto_194097 )
      ( MAKE-3PILE ?auto_194092 ?auto_194093 ?auto_194094 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194101 - BLOCK
      ?auto_194102 - BLOCK
      ?auto_194103 - BLOCK
    )
    :vars
    (
      ?auto_194104 - BLOCK
      ?auto_194106 - BLOCK
      ?auto_194109 - BLOCK
      ?auto_194107 - BLOCK
      ?auto_194108 - BLOCK
      ?auto_194105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194101 ?auto_194102 ) ) ( not ( = ?auto_194101 ?auto_194103 ) ) ( not ( = ?auto_194102 ?auto_194103 ) ) ( not ( = ?auto_194101 ?auto_194104 ) ) ( not ( = ?auto_194102 ?auto_194104 ) ) ( not ( = ?auto_194103 ?auto_194104 ) ) ( ON-TABLE ?auto_194106 ) ( not ( = ?auto_194106 ?auto_194109 ) ) ( not ( = ?auto_194106 ?auto_194107 ) ) ( not ( = ?auto_194106 ?auto_194108 ) ) ( not ( = ?auto_194106 ?auto_194104 ) ) ( not ( = ?auto_194106 ?auto_194103 ) ) ( not ( = ?auto_194106 ?auto_194102 ) ) ( not ( = ?auto_194109 ?auto_194107 ) ) ( not ( = ?auto_194109 ?auto_194108 ) ) ( not ( = ?auto_194109 ?auto_194104 ) ) ( not ( = ?auto_194109 ?auto_194103 ) ) ( not ( = ?auto_194109 ?auto_194102 ) ) ( not ( = ?auto_194107 ?auto_194108 ) ) ( not ( = ?auto_194107 ?auto_194104 ) ) ( not ( = ?auto_194107 ?auto_194103 ) ) ( not ( = ?auto_194107 ?auto_194102 ) ) ( not ( = ?auto_194108 ?auto_194104 ) ) ( not ( = ?auto_194108 ?auto_194103 ) ) ( not ( = ?auto_194108 ?auto_194102 ) ) ( not ( = ?auto_194101 ?auto_194106 ) ) ( not ( = ?auto_194101 ?auto_194109 ) ) ( not ( = ?auto_194101 ?auto_194107 ) ) ( not ( = ?auto_194101 ?auto_194108 ) ) ( ON ?auto_194101 ?auto_194105 ) ( not ( = ?auto_194101 ?auto_194105 ) ) ( not ( = ?auto_194102 ?auto_194105 ) ) ( not ( = ?auto_194103 ?auto_194105 ) ) ( not ( = ?auto_194104 ?auto_194105 ) ) ( not ( = ?auto_194106 ?auto_194105 ) ) ( not ( = ?auto_194109 ?auto_194105 ) ) ( not ( = ?auto_194107 ?auto_194105 ) ) ( not ( = ?auto_194108 ?auto_194105 ) ) ( ON ?auto_194102 ?auto_194101 ) ( ON-TABLE ?auto_194105 ) ( ON ?auto_194103 ?auto_194102 ) ( ON ?auto_194104 ?auto_194103 ) ( ON ?auto_194108 ?auto_194104 ) ( ON ?auto_194107 ?auto_194108 ) ( CLEAR ?auto_194106 ) ( ON ?auto_194109 ?auto_194107 ) ( CLEAR ?auto_194109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194105 ?auto_194101 ?auto_194102 ?auto_194103 ?auto_194104 ?auto_194108 ?auto_194107 )
      ( MAKE-3PILE ?auto_194101 ?auto_194102 ?auto_194103 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194110 - BLOCK
      ?auto_194111 - BLOCK
      ?auto_194112 - BLOCK
    )
    :vars
    (
      ?auto_194115 - BLOCK
      ?auto_194117 - BLOCK
      ?auto_194113 - BLOCK
      ?auto_194118 - BLOCK
      ?auto_194114 - BLOCK
      ?auto_194116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194110 ?auto_194111 ) ) ( not ( = ?auto_194110 ?auto_194112 ) ) ( not ( = ?auto_194111 ?auto_194112 ) ) ( not ( = ?auto_194110 ?auto_194115 ) ) ( not ( = ?auto_194111 ?auto_194115 ) ) ( not ( = ?auto_194112 ?auto_194115 ) ) ( not ( = ?auto_194117 ?auto_194113 ) ) ( not ( = ?auto_194117 ?auto_194118 ) ) ( not ( = ?auto_194117 ?auto_194114 ) ) ( not ( = ?auto_194117 ?auto_194115 ) ) ( not ( = ?auto_194117 ?auto_194112 ) ) ( not ( = ?auto_194117 ?auto_194111 ) ) ( not ( = ?auto_194113 ?auto_194118 ) ) ( not ( = ?auto_194113 ?auto_194114 ) ) ( not ( = ?auto_194113 ?auto_194115 ) ) ( not ( = ?auto_194113 ?auto_194112 ) ) ( not ( = ?auto_194113 ?auto_194111 ) ) ( not ( = ?auto_194118 ?auto_194114 ) ) ( not ( = ?auto_194118 ?auto_194115 ) ) ( not ( = ?auto_194118 ?auto_194112 ) ) ( not ( = ?auto_194118 ?auto_194111 ) ) ( not ( = ?auto_194114 ?auto_194115 ) ) ( not ( = ?auto_194114 ?auto_194112 ) ) ( not ( = ?auto_194114 ?auto_194111 ) ) ( not ( = ?auto_194110 ?auto_194117 ) ) ( not ( = ?auto_194110 ?auto_194113 ) ) ( not ( = ?auto_194110 ?auto_194118 ) ) ( not ( = ?auto_194110 ?auto_194114 ) ) ( ON ?auto_194110 ?auto_194116 ) ( not ( = ?auto_194110 ?auto_194116 ) ) ( not ( = ?auto_194111 ?auto_194116 ) ) ( not ( = ?auto_194112 ?auto_194116 ) ) ( not ( = ?auto_194115 ?auto_194116 ) ) ( not ( = ?auto_194117 ?auto_194116 ) ) ( not ( = ?auto_194113 ?auto_194116 ) ) ( not ( = ?auto_194118 ?auto_194116 ) ) ( not ( = ?auto_194114 ?auto_194116 ) ) ( ON ?auto_194111 ?auto_194110 ) ( ON-TABLE ?auto_194116 ) ( ON ?auto_194112 ?auto_194111 ) ( ON ?auto_194115 ?auto_194112 ) ( ON ?auto_194114 ?auto_194115 ) ( ON ?auto_194118 ?auto_194114 ) ( ON ?auto_194113 ?auto_194118 ) ( CLEAR ?auto_194113 ) ( HOLDING ?auto_194117 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194117 )
      ( MAKE-3PILE ?auto_194110 ?auto_194111 ?auto_194112 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194119 - BLOCK
      ?auto_194120 - BLOCK
      ?auto_194121 - BLOCK
    )
    :vars
    (
      ?auto_194126 - BLOCK
      ?auto_194124 - BLOCK
      ?auto_194122 - BLOCK
      ?auto_194125 - BLOCK
      ?auto_194123 - BLOCK
      ?auto_194127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194119 ?auto_194120 ) ) ( not ( = ?auto_194119 ?auto_194121 ) ) ( not ( = ?auto_194120 ?auto_194121 ) ) ( not ( = ?auto_194119 ?auto_194126 ) ) ( not ( = ?auto_194120 ?auto_194126 ) ) ( not ( = ?auto_194121 ?auto_194126 ) ) ( not ( = ?auto_194124 ?auto_194122 ) ) ( not ( = ?auto_194124 ?auto_194125 ) ) ( not ( = ?auto_194124 ?auto_194123 ) ) ( not ( = ?auto_194124 ?auto_194126 ) ) ( not ( = ?auto_194124 ?auto_194121 ) ) ( not ( = ?auto_194124 ?auto_194120 ) ) ( not ( = ?auto_194122 ?auto_194125 ) ) ( not ( = ?auto_194122 ?auto_194123 ) ) ( not ( = ?auto_194122 ?auto_194126 ) ) ( not ( = ?auto_194122 ?auto_194121 ) ) ( not ( = ?auto_194122 ?auto_194120 ) ) ( not ( = ?auto_194125 ?auto_194123 ) ) ( not ( = ?auto_194125 ?auto_194126 ) ) ( not ( = ?auto_194125 ?auto_194121 ) ) ( not ( = ?auto_194125 ?auto_194120 ) ) ( not ( = ?auto_194123 ?auto_194126 ) ) ( not ( = ?auto_194123 ?auto_194121 ) ) ( not ( = ?auto_194123 ?auto_194120 ) ) ( not ( = ?auto_194119 ?auto_194124 ) ) ( not ( = ?auto_194119 ?auto_194122 ) ) ( not ( = ?auto_194119 ?auto_194125 ) ) ( not ( = ?auto_194119 ?auto_194123 ) ) ( ON ?auto_194119 ?auto_194127 ) ( not ( = ?auto_194119 ?auto_194127 ) ) ( not ( = ?auto_194120 ?auto_194127 ) ) ( not ( = ?auto_194121 ?auto_194127 ) ) ( not ( = ?auto_194126 ?auto_194127 ) ) ( not ( = ?auto_194124 ?auto_194127 ) ) ( not ( = ?auto_194122 ?auto_194127 ) ) ( not ( = ?auto_194125 ?auto_194127 ) ) ( not ( = ?auto_194123 ?auto_194127 ) ) ( ON ?auto_194120 ?auto_194119 ) ( ON-TABLE ?auto_194127 ) ( ON ?auto_194121 ?auto_194120 ) ( ON ?auto_194126 ?auto_194121 ) ( ON ?auto_194123 ?auto_194126 ) ( ON ?auto_194125 ?auto_194123 ) ( ON ?auto_194122 ?auto_194125 ) ( ON ?auto_194124 ?auto_194122 ) ( CLEAR ?auto_194124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_194127 ?auto_194119 ?auto_194120 ?auto_194121 ?auto_194126 ?auto_194123 ?auto_194125 ?auto_194122 )
      ( MAKE-3PILE ?auto_194119 ?auto_194120 ?auto_194121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194132 - BLOCK
      ?auto_194133 - BLOCK
      ?auto_194134 - BLOCK
      ?auto_194135 - BLOCK
    )
    :vars
    (
      ?auto_194136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194136 ?auto_194135 ) ( CLEAR ?auto_194136 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194132 ) ( ON ?auto_194133 ?auto_194132 ) ( ON ?auto_194134 ?auto_194133 ) ( ON ?auto_194135 ?auto_194134 ) ( not ( = ?auto_194132 ?auto_194133 ) ) ( not ( = ?auto_194132 ?auto_194134 ) ) ( not ( = ?auto_194132 ?auto_194135 ) ) ( not ( = ?auto_194132 ?auto_194136 ) ) ( not ( = ?auto_194133 ?auto_194134 ) ) ( not ( = ?auto_194133 ?auto_194135 ) ) ( not ( = ?auto_194133 ?auto_194136 ) ) ( not ( = ?auto_194134 ?auto_194135 ) ) ( not ( = ?auto_194134 ?auto_194136 ) ) ( not ( = ?auto_194135 ?auto_194136 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194136 ?auto_194135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194137 - BLOCK
      ?auto_194138 - BLOCK
      ?auto_194139 - BLOCK
      ?auto_194140 - BLOCK
    )
    :vars
    (
      ?auto_194141 - BLOCK
      ?auto_194142 - BLOCK
      ?auto_194143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194141 ?auto_194140 ) ( CLEAR ?auto_194141 ) ( ON-TABLE ?auto_194137 ) ( ON ?auto_194138 ?auto_194137 ) ( ON ?auto_194139 ?auto_194138 ) ( ON ?auto_194140 ?auto_194139 ) ( not ( = ?auto_194137 ?auto_194138 ) ) ( not ( = ?auto_194137 ?auto_194139 ) ) ( not ( = ?auto_194137 ?auto_194140 ) ) ( not ( = ?auto_194137 ?auto_194141 ) ) ( not ( = ?auto_194138 ?auto_194139 ) ) ( not ( = ?auto_194138 ?auto_194140 ) ) ( not ( = ?auto_194138 ?auto_194141 ) ) ( not ( = ?auto_194139 ?auto_194140 ) ) ( not ( = ?auto_194139 ?auto_194141 ) ) ( not ( = ?auto_194140 ?auto_194141 ) ) ( HOLDING ?auto_194142 ) ( CLEAR ?auto_194143 ) ( not ( = ?auto_194137 ?auto_194142 ) ) ( not ( = ?auto_194137 ?auto_194143 ) ) ( not ( = ?auto_194138 ?auto_194142 ) ) ( not ( = ?auto_194138 ?auto_194143 ) ) ( not ( = ?auto_194139 ?auto_194142 ) ) ( not ( = ?auto_194139 ?auto_194143 ) ) ( not ( = ?auto_194140 ?auto_194142 ) ) ( not ( = ?auto_194140 ?auto_194143 ) ) ( not ( = ?auto_194141 ?auto_194142 ) ) ( not ( = ?auto_194141 ?auto_194143 ) ) ( not ( = ?auto_194142 ?auto_194143 ) ) )
    :subtasks
    ( ( !STACK ?auto_194142 ?auto_194143 )
      ( MAKE-4PILE ?auto_194137 ?auto_194138 ?auto_194139 ?auto_194140 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194144 - BLOCK
      ?auto_194145 - BLOCK
      ?auto_194146 - BLOCK
      ?auto_194147 - BLOCK
    )
    :vars
    (
      ?auto_194148 - BLOCK
      ?auto_194149 - BLOCK
      ?auto_194150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194148 ?auto_194147 ) ( ON-TABLE ?auto_194144 ) ( ON ?auto_194145 ?auto_194144 ) ( ON ?auto_194146 ?auto_194145 ) ( ON ?auto_194147 ?auto_194146 ) ( not ( = ?auto_194144 ?auto_194145 ) ) ( not ( = ?auto_194144 ?auto_194146 ) ) ( not ( = ?auto_194144 ?auto_194147 ) ) ( not ( = ?auto_194144 ?auto_194148 ) ) ( not ( = ?auto_194145 ?auto_194146 ) ) ( not ( = ?auto_194145 ?auto_194147 ) ) ( not ( = ?auto_194145 ?auto_194148 ) ) ( not ( = ?auto_194146 ?auto_194147 ) ) ( not ( = ?auto_194146 ?auto_194148 ) ) ( not ( = ?auto_194147 ?auto_194148 ) ) ( CLEAR ?auto_194149 ) ( not ( = ?auto_194144 ?auto_194150 ) ) ( not ( = ?auto_194144 ?auto_194149 ) ) ( not ( = ?auto_194145 ?auto_194150 ) ) ( not ( = ?auto_194145 ?auto_194149 ) ) ( not ( = ?auto_194146 ?auto_194150 ) ) ( not ( = ?auto_194146 ?auto_194149 ) ) ( not ( = ?auto_194147 ?auto_194150 ) ) ( not ( = ?auto_194147 ?auto_194149 ) ) ( not ( = ?auto_194148 ?auto_194150 ) ) ( not ( = ?auto_194148 ?auto_194149 ) ) ( not ( = ?auto_194150 ?auto_194149 ) ) ( ON ?auto_194150 ?auto_194148 ) ( CLEAR ?auto_194150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194144 ?auto_194145 ?auto_194146 ?auto_194147 ?auto_194148 )
      ( MAKE-4PILE ?auto_194144 ?auto_194145 ?auto_194146 ?auto_194147 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194151 - BLOCK
      ?auto_194152 - BLOCK
      ?auto_194153 - BLOCK
      ?auto_194154 - BLOCK
    )
    :vars
    (
      ?auto_194157 - BLOCK
      ?auto_194155 - BLOCK
      ?auto_194156 - BLOCK
      ?auto_194158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194157 ?auto_194154 ) ( ON-TABLE ?auto_194151 ) ( ON ?auto_194152 ?auto_194151 ) ( ON ?auto_194153 ?auto_194152 ) ( ON ?auto_194154 ?auto_194153 ) ( not ( = ?auto_194151 ?auto_194152 ) ) ( not ( = ?auto_194151 ?auto_194153 ) ) ( not ( = ?auto_194151 ?auto_194154 ) ) ( not ( = ?auto_194151 ?auto_194157 ) ) ( not ( = ?auto_194152 ?auto_194153 ) ) ( not ( = ?auto_194152 ?auto_194154 ) ) ( not ( = ?auto_194152 ?auto_194157 ) ) ( not ( = ?auto_194153 ?auto_194154 ) ) ( not ( = ?auto_194153 ?auto_194157 ) ) ( not ( = ?auto_194154 ?auto_194157 ) ) ( not ( = ?auto_194151 ?auto_194155 ) ) ( not ( = ?auto_194151 ?auto_194156 ) ) ( not ( = ?auto_194152 ?auto_194155 ) ) ( not ( = ?auto_194152 ?auto_194156 ) ) ( not ( = ?auto_194153 ?auto_194155 ) ) ( not ( = ?auto_194153 ?auto_194156 ) ) ( not ( = ?auto_194154 ?auto_194155 ) ) ( not ( = ?auto_194154 ?auto_194156 ) ) ( not ( = ?auto_194157 ?auto_194155 ) ) ( not ( = ?auto_194157 ?auto_194156 ) ) ( not ( = ?auto_194155 ?auto_194156 ) ) ( ON ?auto_194155 ?auto_194157 ) ( CLEAR ?auto_194155 ) ( HOLDING ?auto_194156 ) ( CLEAR ?auto_194158 ) ( ON-TABLE ?auto_194158 ) ( not ( = ?auto_194158 ?auto_194156 ) ) ( not ( = ?auto_194151 ?auto_194158 ) ) ( not ( = ?auto_194152 ?auto_194158 ) ) ( not ( = ?auto_194153 ?auto_194158 ) ) ( not ( = ?auto_194154 ?auto_194158 ) ) ( not ( = ?auto_194157 ?auto_194158 ) ) ( not ( = ?auto_194155 ?auto_194158 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194158 ?auto_194156 )
      ( MAKE-4PILE ?auto_194151 ?auto_194152 ?auto_194153 ?auto_194154 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194159 - BLOCK
      ?auto_194160 - BLOCK
      ?auto_194161 - BLOCK
      ?auto_194162 - BLOCK
    )
    :vars
    (
      ?auto_194164 - BLOCK
      ?auto_194165 - BLOCK
      ?auto_194163 - BLOCK
      ?auto_194166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194164 ?auto_194162 ) ( ON-TABLE ?auto_194159 ) ( ON ?auto_194160 ?auto_194159 ) ( ON ?auto_194161 ?auto_194160 ) ( ON ?auto_194162 ?auto_194161 ) ( not ( = ?auto_194159 ?auto_194160 ) ) ( not ( = ?auto_194159 ?auto_194161 ) ) ( not ( = ?auto_194159 ?auto_194162 ) ) ( not ( = ?auto_194159 ?auto_194164 ) ) ( not ( = ?auto_194160 ?auto_194161 ) ) ( not ( = ?auto_194160 ?auto_194162 ) ) ( not ( = ?auto_194160 ?auto_194164 ) ) ( not ( = ?auto_194161 ?auto_194162 ) ) ( not ( = ?auto_194161 ?auto_194164 ) ) ( not ( = ?auto_194162 ?auto_194164 ) ) ( not ( = ?auto_194159 ?auto_194165 ) ) ( not ( = ?auto_194159 ?auto_194163 ) ) ( not ( = ?auto_194160 ?auto_194165 ) ) ( not ( = ?auto_194160 ?auto_194163 ) ) ( not ( = ?auto_194161 ?auto_194165 ) ) ( not ( = ?auto_194161 ?auto_194163 ) ) ( not ( = ?auto_194162 ?auto_194165 ) ) ( not ( = ?auto_194162 ?auto_194163 ) ) ( not ( = ?auto_194164 ?auto_194165 ) ) ( not ( = ?auto_194164 ?auto_194163 ) ) ( not ( = ?auto_194165 ?auto_194163 ) ) ( ON ?auto_194165 ?auto_194164 ) ( CLEAR ?auto_194166 ) ( ON-TABLE ?auto_194166 ) ( not ( = ?auto_194166 ?auto_194163 ) ) ( not ( = ?auto_194159 ?auto_194166 ) ) ( not ( = ?auto_194160 ?auto_194166 ) ) ( not ( = ?auto_194161 ?auto_194166 ) ) ( not ( = ?auto_194162 ?auto_194166 ) ) ( not ( = ?auto_194164 ?auto_194166 ) ) ( not ( = ?auto_194165 ?auto_194166 ) ) ( ON ?auto_194163 ?auto_194165 ) ( CLEAR ?auto_194163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194159 ?auto_194160 ?auto_194161 ?auto_194162 ?auto_194164 ?auto_194165 )
      ( MAKE-4PILE ?auto_194159 ?auto_194160 ?auto_194161 ?auto_194162 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194167 - BLOCK
      ?auto_194168 - BLOCK
      ?auto_194169 - BLOCK
      ?auto_194170 - BLOCK
    )
    :vars
    (
      ?auto_194174 - BLOCK
      ?auto_194172 - BLOCK
      ?auto_194173 - BLOCK
      ?auto_194171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194174 ?auto_194170 ) ( ON-TABLE ?auto_194167 ) ( ON ?auto_194168 ?auto_194167 ) ( ON ?auto_194169 ?auto_194168 ) ( ON ?auto_194170 ?auto_194169 ) ( not ( = ?auto_194167 ?auto_194168 ) ) ( not ( = ?auto_194167 ?auto_194169 ) ) ( not ( = ?auto_194167 ?auto_194170 ) ) ( not ( = ?auto_194167 ?auto_194174 ) ) ( not ( = ?auto_194168 ?auto_194169 ) ) ( not ( = ?auto_194168 ?auto_194170 ) ) ( not ( = ?auto_194168 ?auto_194174 ) ) ( not ( = ?auto_194169 ?auto_194170 ) ) ( not ( = ?auto_194169 ?auto_194174 ) ) ( not ( = ?auto_194170 ?auto_194174 ) ) ( not ( = ?auto_194167 ?auto_194172 ) ) ( not ( = ?auto_194167 ?auto_194173 ) ) ( not ( = ?auto_194168 ?auto_194172 ) ) ( not ( = ?auto_194168 ?auto_194173 ) ) ( not ( = ?auto_194169 ?auto_194172 ) ) ( not ( = ?auto_194169 ?auto_194173 ) ) ( not ( = ?auto_194170 ?auto_194172 ) ) ( not ( = ?auto_194170 ?auto_194173 ) ) ( not ( = ?auto_194174 ?auto_194172 ) ) ( not ( = ?auto_194174 ?auto_194173 ) ) ( not ( = ?auto_194172 ?auto_194173 ) ) ( ON ?auto_194172 ?auto_194174 ) ( not ( = ?auto_194171 ?auto_194173 ) ) ( not ( = ?auto_194167 ?auto_194171 ) ) ( not ( = ?auto_194168 ?auto_194171 ) ) ( not ( = ?auto_194169 ?auto_194171 ) ) ( not ( = ?auto_194170 ?auto_194171 ) ) ( not ( = ?auto_194174 ?auto_194171 ) ) ( not ( = ?auto_194172 ?auto_194171 ) ) ( ON ?auto_194173 ?auto_194172 ) ( CLEAR ?auto_194173 ) ( HOLDING ?auto_194171 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194171 )
      ( MAKE-4PILE ?auto_194167 ?auto_194168 ?auto_194169 ?auto_194170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194175 - BLOCK
      ?auto_194176 - BLOCK
      ?auto_194177 - BLOCK
      ?auto_194178 - BLOCK
    )
    :vars
    (
      ?auto_194179 - BLOCK
      ?auto_194182 - BLOCK
      ?auto_194180 - BLOCK
      ?auto_194181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194179 ?auto_194178 ) ( ON-TABLE ?auto_194175 ) ( ON ?auto_194176 ?auto_194175 ) ( ON ?auto_194177 ?auto_194176 ) ( ON ?auto_194178 ?auto_194177 ) ( not ( = ?auto_194175 ?auto_194176 ) ) ( not ( = ?auto_194175 ?auto_194177 ) ) ( not ( = ?auto_194175 ?auto_194178 ) ) ( not ( = ?auto_194175 ?auto_194179 ) ) ( not ( = ?auto_194176 ?auto_194177 ) ) ( not ( = ?auto_194176 ?auto_194178 ) ) ( not ( = ?auto_194176 ?auto_194179 ) ) ( not ( = ?auto_194177 ?auto_194178 ) ) ( not ( = ?auto_194177 ?auto_194179 ) ) ( not ( = ?auto_194178 ?auto_194179 ) ) ( not ( = ?auto_194175 ?auto_194182 ) ) ( not ( = ?auto_194175 ?auto_194180 ) ) ( not ( = ?auto_194176 ?auto_194182 ) ) ( not ( = ?auto_194176 ?auto_194180 ) ) ( not ( = ?auto_194177 ?auto_194182 ) ) ( not ( = ?auto_194177 ?auto_194180 ) ) ( not ( = ?auto_194178 ?auto_194182 ) ) ( not ( = ?auto_194178 ?auto_194180 ) ) ( not ( = ?auto_194179 ?auto_194182 ) ) ( not ( = ?auto_194179 ?auto_194180 ) ) ( not ( = ?auto_194182 ?auto_194180 ) ) ( ON ?auto_194182 ?auto_194179 ) ( not ( = ?auto_194181 ?auto_194180 ) ) ( not ( = ?auto_194175 ?auto_194181 ) ) ( not ( = ?auto_194176 ?auto_194181 ) ) ( not ( = ?auto_194177 ?auto_194181 ) ) ( not ( = ?auto_194178 ?auto_194181 ) ) ( not ( = ?auto_194179 ?auto_194181 ) ) ( not ( = ?auto_194182 ?auto_194181 ) ) ( ON ?auto_194180 ?auto_194182 ) ( ON ?auto_194181 ?auto_194180 ) ( CLEAR ?auto_194181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194175 ?auto_194176 ?auto_194177 ?auto_194178 ?auto_194179 ?auto_194182 ?auto_194180 )
      ( MAKE-4PILE ?auto_194175 ?auto_194176 ?auto_194177 ?auto_194178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194183 - BLOCK
      ?auto_194184 - BLOCK
      ?auto_194185 - BLOCK
      ?auto_194186 - BLOCK
    )
    :vars
    (
      ?auto_194189 - BLOCK
      ?auto_194188 - BLOCK
      ?auto_194190 - BLOCK
      ?auto_194187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194189 ?auto_194186 ) ( ON-TABLE ?auto_194183 ) ( ON ?auto_194184 ?auto_194183 ) ( ON ?auto_194185 ?auto_194184 ) ( ON ?auto_194186 ?auto_194185 ) ( not ( = ?auto_194183 ?auto_194184 ) ) ( not ( = ?auto_194183 ?auto_194185 ) ) ( not ( = ?auto_194183 ?auto_194186 ) ) ( not ( = ?auto_194183 ?auto_194189 ) ) ( not ( = ?auto_194184 ?auto_194185 ) ) ( not ( = ?auto_194184 ?auto_194186 ) ) ( not ( = ?auto_194184 ?auto_194189 ) ) ( not ( = ?auto_194185 ?auto_194186 ) ) ( not ( = ?auto_194185 ?auto_194189 ) ) ( not ( = ?auto_194186 ?auto_194189 ) ) ( not ( = ?auto_194183 ?auto_194188 ) ) ( not ( = ?auto_194183 ?auto_194190 ) ) ( not ( = ?auto_194184 ?auto_194188 ) ) ( not ( = ?auto_194184 ?auto_194190 ) ) ( not ( = ?auto_194185 ?auto_194188 ) ) ( not ( = ?auto_194185 ?auto_194190 ) ) ( not ( = ?auto_194186 ?auto_194188 ) ) ( not ( = ?auto_194186 ?auto_194190 ) ) ( not ( = ?auto_194189 ?auto_194188 ) ) ( not ( = ?auto_194189 ?auto_194190 ) ) ( not ( = ?auto_194188 ?auto_194190 ) ) ( ON ?auto_194188 ?auto_194189 ) ( not ( = ?auto_194187 ?auto_194190 ) ) ( not ( = ?auto_194183 ?auto_194187 ) ) ( not ( = ?auto_194184 ?auto_194187 ) ) ( not ( = ?auto_194185 ?auto_194187 ) ) ( not ( = ?auto_194186 ?auto_194187 ) ) ( not ( = ?auto_194189 ?auto_194187 ) ) ( not ( = ?auto_194188 ?auto_194187 ) ) ( ON ?auto_194190 ?auto_194188 ) ( HOLDING ?auto_194187 ) ( CLEAR ?auto_194190 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_194183 ?auto_194184 ?auto_194185 ?auto_194186 ?auto_194189 ?auto_194188 ?auto_194190 ?auto_194187 )
      ( MAKE-4PILE ?auto_194183 ?auto_194184 ?auto_194185 ?auto_194186 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194191 - BLOCK
      ?auto_194192 - BLOCK
      ?auto_194193 - BLOCK
      ?auto_194194 - BLOCK
    )
    :vars
    (
      ?auto_194196 - BLOCK
      ?auto_194195 - BLOCK
      ?auto_194198 - BLOCK
      ?auto_194197 - BLOCK
      ?auto_194199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194196 ?auto_194194 ) ( ON-TABLE ?auto_194191 ) ( ON ?auto_194192 ?auto_194191 ) ( ON ?auto_194193 ?auto_194192 ) ( ON ?auto_194194 ?auto_194193 ) ( not ( = ?auto_194191 ?auto_194192 ) ) ( not ( = ?auto_194191 ?auto_194193 ) ) ( not ( = ?auto_194191 ?auto_194194 ) ) ( not ( = ?auto_194191 ?auto_194196 ) ) ( not ( = ?auto_194192 ?auto_194193 ) ) ( not ( = ?auto_194192 ?auto_194194 ) ) ( not ( = ?auto_194192 ?auto_194196 ) ) ( not ( = ?auto_194193 ?auto_194194 ) ) ( not ( = ?auto_194193 ?auto_194196 ) ) ( not ( = ?auto_194194 ?auto_194196 ) ) ( not ( = ?auto_194191 ?auto_194195 ) ) ( not ( = ?auto_194191 ?auto_194198 ) ) ( not ( = ?auto_194192 ?auto_194195 ) ) ( not ( = ?auto_194192 ?auto_194198 ) ) ( not ( = ?auto_194193 ?auto_194195 ) ) ( not ( = ?auto_194193 ?auto_194198 ) ) ( not ( = ?auto_194194 ?auto_194195 ) ) ( not ( = ?auto_194194 ?auto_194198 ) ) ( not ( = ?auto_194196 ?auto_194195 ) ) ( not ( = ?auto_194196 ?auto_194198 ) ) ( not ( = ?auto_194195 ?auto_194198 ) ) ( ON ?auto_194195 ?auto_194196 ) ( not ( = ?auto_194197 ?auto_194198 ) ) ( not ( = ?auto_194191 ?auto_194197 ) ) ( not ( = ?auto_194192 ?auto_194197 ) ) ( not ( = ?auto_194193 ?auto_194197 ) ) ( not ( = ?auto_194194 ?auto_194197 ) ) ( not ( = ?auto_194196 ?auto_194197 ) ) ( not ( = ?auto_194195 ?auto_194197 ) ) ( ON ?auto_194198 ?auto_194195 ) ( CLEAR ?auto_194198 ) ( ON ?auto_194197 ?auto_194199 ) ( CLEAR ?auto_194197 ) ( HAND-EMPTY ) ( not ( = ?auto_194191 ?auto_194199 ) ) ( not ( = ?auto_194192 ?auto_194199 ) ) ( not ( = ?auto_194193 ?auto_194199 ) ) ( not ( = ?auto_194194 ?auto_194199 ) ) ( not ( = ?auto_194196 ?auto_194199 ) ) ( not ( = ?auto_194195 ?auto_194199 ) ) ( not ( = ?auto_194198 ?auto_194199 ) ) ( not ( = ?auto_194197 ?auto_194199 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194197 ?auto_194199 )
      ( MAKE-4PILE ?auto_194191 ?auto_194192 ?auto_194193 ?auto_194194 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194200 - BLOCK
      ?auto_194201 - BLOCK
      ?auto_194202 - BLOCK
      ?auto_194203 - BLOCK
    )
    :vars
    (
      ?auto_194208 - BLOCK
      ?auto_194206 - BLOCK
      ?auto_194204 - BLOCK
      ?auto_194207 - BLOCK
      ?auto_194205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194208 ?auto_194203 ) ( ON-TABLE ?auto_194200 ) ( ON ?auto_194201 ?auto_194200 ) ( ON ?auto_194202 ?auto_194201 ) ( ON ?auto_194203 ?auto_194202 ) ( not ( = ?auto_194200 ?auto_194201 ) ) ( not ( = ?auto_194200 ?auto_194202 ) ) ( not ( = ?auto_194200 ?auto_194203 ) ) ( not ( = ?auto_194200 ?auto_194208 ) ) ( not ( = ?auto_194201 ?auto_194202 ) ) ( not ( = ?auto_194201 ?auto_194203 ) ) ( not ( = ?auto_194201 ?auto_194208 ) ) ( not ( = ?auto_194202 ?auto_194203 ) ) ( not ( = ?auto_194202 ?auto_194208 ) ) ( not ( = ?auto_194203 ?auto_194208 ) ) ( not ( = ?auto_194200 ?auto_194206 ) ) ( not ( = ?auto_194200 ?auto_194204 ) ) ( not ( = ?auto_194201 ?auto_194206 ) ) ( not ( = ?auto_194201 ?auto_194204 ) ) ( not ( = ?auto_194202 ?auto_194206 ) ) ( not ( = ?auto_194202 ?auto_194204 ) ) ( not ( = ?auto_194203 ?auto_194206 ) ) ( not ( = ?auto_194203 ?auto_194204 ) ) ( not ( = ?auto_194208 ?auto_194206 ) ) ( not ( = ?auto_194208 ?auto_194204 ) ) ( not ( = ?auto_194206 ?auto_194204 ) ) ( ON ?auto_194206 ?auto_194208 ) ( not ( = ?auto_194207 ?auto_194204 ) ) ( not ( = ?auto_194200 ?auto_194207 ) ) ( not ( = ?auto_194201 ?auto_194207 ) ) ( not ( = ?auto_194202 ?auto_194207 ) ) ( not ( = ?auto_194203 ?auto_194207 ) ) ( not ( = ?auto_194208 ?auto_194207 ) ) ( not ( = ?auto_194206 ?auto_194207 ) ) ( ON ?auto_194207 ?auto_194205 ) ( CLEAR ?auto_194207 ) ( not ( = ?auto_194200 ?auto_194205 ) ) ( not ( = ?auto_194201 ?auto_194205 ) ) ( not ( = ?auto_194202 ?auto_194205 ) ) ( not ( = ?auto_194203 ?auto_194205 ) ) ( not ( = ?auto_194208 ?auto_194205 ) ) ( not ( = ?auto_194206 ?auto_194205 ) ) ( not ( = ?auto_194204 ?auto_194205 ) ) ( not ( = ?auto_194207 ?auto_194205 ) ) ( HOLDING ?auto_194204 ) ( CLEAR ?auto_194206 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194200 ?auto_194201 ?auto_194202 ?auto_194203 ?auto_194208 ?auto_194206 ?auto_194204 )
      ( MAKE-4PILE ?auto_194200 ?auto_194201 ?auto_194202 ?auto_194203 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194209 - BLOCK
      ?auto_194210 - BLOCK
      ?auto_194211 - BLOCK
      ?auto_194212 - BLOCK
    )
    :vars
    (
      ?auto_194215 - BLOCK
      ?auto_194217 - BLOCK
      ?auto_194213 - BLOCK
      ?auto_194216 - BLOCK
      ?auto_194214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194215 ?auto_194212 ) ( ON-TABLE ?auto_194209 ) ( ON ?auto_194210 ?auto_194209 ) ( ON ?auto_194211 ?auto_194210 ) ( ON ?auto_194212 ?auto_194211 ) ( not ( = ?auto_194209 ?auto_194210 ) ) ( not ( = ?auto_194209 ?auto_194211 ) ) ( not ( = ?auto_194209 ?auto_194212 ) ) ( not ( = ?auto_194209 ?auto_194215 ) ) ( not ( = ?auto_194210 ?auto_194211 ) ) ( not ( = ?auto_194210 ?auto_194212 ) ) ( not ( = ?auto_194210 ?auto_194215 ) ) ( not ( = ?auto_194211 ?auto_194212 ) ) ( not ( = ?auto_194211 ?auto_194215 ) ) ( not ( = ?auto_194212 ?auto_194215 ) ) ( not ( = ?auto_194209 ?auto_194217 ) ) ( not ( = ?auto_194209 ?auto_194213 ) ) ( not ( = ?auto_194210 ?auto_194217 ) ) ( not ( = ?auto_194210 ?auto_194213 ) ) ( not ( = ?auto_194211 ?auto_194217 ) ) ( not ( = ?auto_194211 ?auto_194213 ) ) ( not ( = ?auto_194212 ?auto_194217 ) ) ( not ( = ?auto_194212 ?auto_194213 ) ) ( not ( = ?auto_194215 ?auto_194217 ) ) ( not ( = ?auto_194215 ?auto_194213 ) ) ( not ( = ?auto_194217 ?auto_194213 ) ) ( ON ?auto_194217 ?auto_194215 ) ( not ( = ?auto_194216 ?auto_194213 ) ) ( not ( = ?auto_194209 ?auto_194216 ) ) ( not ( = ?auto_194210 ?auto_194216 ) ) ( not ( = ?auto_194211 ?auto_194216 ) ) ( not ( = ?auto_194212 ?auto_194216 ) ) ( not ( = ?auto_194215 ?auto_194216 ) ) ( not ( = ?auto_194217 ?auto_194216 ) ) ( ON ?auto_194216 ?auto_194214 ) ( not ( = ?auto_194209 ?auto_194214 ) ) ( not ( = ?auto_194210 ?auto_194214 ) ) ( not ( = ?auto_194211 ?auto_194214 ) ) ( not ( = ?auto_194212 ?auto_194214 ) ) ( not ( = ?auto_194215 ?auto_194214 ) ) ( not ( = ?auto_194217 ?auto_194214 ) ) ( not ( = ?auto_194213 ?auto_194214 ) ) ( not ( = ?auto_194216 ?auto_194214 ) ) ( CLEAR ?auto_194217 ) ( ON ?auto_194213 ?auto_194216 ) ( CLEAR ?auto_194213 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194214 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194214 ?auto_194216 )
      ( MAKE-4PILE ?auto_194209 ?auto_194210 ?auto_194211 ?auto_194212 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194218 - BLOCK
      ?auto_194219 - BLOCK
      ?auto_194220 - BLOCK
      ?auto_194221 - BLOCK
    )
    :vars
    (
      ?auto_194222 - BLOCK
      ?auto_194224 - BLOCK
      ?auto_194226 - BLOCK
      ?auto_194223 - BLOCK
      ?auto_194225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194222 ?auto_194221 ) ( ON-TABLE ?auto_194218 ) ( ON ?auto_194219 ?auto_194218 ) ( ON ?auto_194220 ?auto_194219 ) ( ON ?auto_194221 ?auto_194220 ) ( not ( = ?auto_194218 ?auto_194219 ) ) ( not ( = ?auto_194218 ?auto_194220 ) ) ( not ( = ?auto_194218 ?auto_194221 ) ) ( not ( = ?auto_194218 ?auto_194222 ) ) ( not ( = ?auto_194219 ?auto_194220 ) ) ( not ( = ?auto_194219 ?auto_194221 ) ) ( not ( = ?auto_194219 ?auto_194222 ) ) ( not ( = ?auto_194220 ?auto_194221 ) ) ( not ( = ?auto_194220 ?auto_194222 ) ) ( not ( = ?auto_194221 ?auto_194222 ) ) ( not ( = ?auto_194218 ?auto_194224 ) ) ( not ( = ?auto_194218 ?auto_194226 ) ) ( not ( = ?auto_194219 ?auto_194224 ) ) ( not ( = ?auto_194219 ?auto_194226 ) ) ( not ( = ?auto_194220 ?auto_194224 ) ) ( not ( = ?auto_194220 ?auto_194226 ) ) ( not ( = ?auto_194221 ?auto_194224 ) ) ( not ( = ?auto_194221 ?auto_194226 ) ) ( not ( = ?auto_194222 ?auto_194224 ) ) ( not ( = ?auto_194222 ?auto_194226 ) ) ( not ( = ?auto_194224 ?auto_194226 ) ) ( not ( = ?auto_194223 ?auto_194226 ) ) ( not ( = ?auto_194218 ?auto_194223 ) ) ( not ( = ?auto_194219 ?auto_194223 ) ) ( not ( = ?auto_194220 ?auto_194223 ) ) ( not ( = ?auto_194221 ?auto_194223 ) ) ( not ( = ?auto_194222 ?auto_194223 ) ) ( not ( = ?auto_194224 ?auto_194223 ) ) ( ON ?auto_194223 ?auto_194225 ) ( not ( = ?auto_194218 ?auto_194225 ) ) ( not ( = ?auto_194219 ?auto_194225 ) ) ( not ( = ?auto_194220 ?auto_194225 ) ) ( not ( = ?auto_194221 ?auto_194225 ) ) ( not ( = ?auto_194222 ?auto_194225 ) ) ( not ( = ?auto_194224 ?auto_194225 ) ) ( not ( = ?auto_194226 ?auto_194225 ) ) ( not ( = ?auto_194223 ?auto_194225 ) ) ( ON ?auto_194226 ?auto_194223 ) ( CLEAR ?auto_194226 ) ( ON-TABLE ?auto_194225 ) ( HOLDING ?auto_194224 ) ( CLEAR ?auto_194222 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194218 ?auto_194219 ?auto_194220 ?auto_194221 ?auto_194222 ?auto_194224 )
      ( MAKE-4PILE ?auto_194218 ?auto_194219 ?auto_194220 ?auto_194221 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194227 - BLOCK
      ?auto_194228 - BLOCK
      ?auto_194229 - BLOCK
      ?auto_194230 - BLOCK
    )
    :vars
    (
      ?auto_194232 - BLOCK
      ?auto_194233 - BLOCK
      ?auto_194235 - BLOCK
      ?auto_194234 - BLOCK
      ?auto_194231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194232 ?auto_194230 ) ( ON-TABLE ?auto_194227 ) ( ON ?auto_194228 ?auto_194227 ) ( ON ?auto_194229 ?auto_194228 ) ( ON ?auto_194230 ?auto_194229 ) ( not ( = ?auto_194227 ?auto_194228 ) ) ( not ( = ?auto_194227 ?auto_194229 ) ) ( not ( = ?auto_194227 ?auto_194230 ) ) ( not ( = ?auto_194227 ?auto_194232 ) ) ( not ( = ?auto_194228 ?auto_194229 ) ) ( not ( = ?auto_194228 ?auto_194230 ) ) ( not ( = ?auto_194228 ?auto_194232 ) ) ( not ( = ?auto_194229 ?auto_194230 ) ) ( not ( = ?auto_194229 ?auto_194232 ) ) ( not ( = ?auto_194230 ?auto_194232 ) ) ( not ( = ?auto_194227 ?auto_194233 ) ) ( not ( = ?auto_194227 ?auto_194235 ) ) ( not ( = ?auto_194228 ?auto_194233 ) ) ( not ( = ?auto_194228 ?auto_194235 ) ) ( not ( = ?auto_194229 ?auto_194233 ) ) ( not ( = ?auto_194229 ?auto_194235 ) ) ( not ( = ?auto_194230 ?auto_194233 ) ) ( not ( = ?auto_194230 ?auto_194235 ) ) ( not ( = ?auto_194232 ?auto_194233 ) ) ( not ( = ?auto_194232 ?auto_194235 ) ) ( not ( = ?auto_194233 ?auto_194235 ) ) ( not ( = ?auto_194234 ?auto_194235 ) ) ( not ( = ?auto_194227 ?auto_194234 ) ) ( not ( = ?auto_194228 ?auto_194234 ) ) ( not ( = ?auto_194229 ?auto_194234 ) ) ( not ( = ?auto_194230 ?auto_194234 ) ) ( not ( = ?auto_194232 ?auto_194234 ) ) ( not ( = ?auto_194233 ?auto_194234 ) ) ( ON ?auto_194234 ?auto_194231 ) ( not ( = ?auto_194227 ?auto_194231 ) ) ( not ( = ?auto_194228 ?auto_194231 ) ) ( not ( = ?auto_194229 ?auto_194231 ) ) ( not ( = ?auto_194230 ?auto_194231 ) ) ( not ( = ?auto_194232 ?auto_194231 ) ) ( not ( = ?auto_194233 ?auto_194231 ) ) ( not ( = ?auto_194235 ?auto_194231 ) ) ( not ( = ?auto_194234 ?auto_194231 ) ) ( ON ?auto_194235 ?auto_194234 ) ( ON-TABLE ?auto_194231 ) ( CLEAR ?auto_194232 ) ( ON ?auto_194233 ?auto_194235 ) ( CLEAR ?auto_194233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194231 ?auto_194234 ?auto_194235 )
      ( MAKE-4PILE ?auto_194227 ?auto_194228 ?auto_194229 ?auto_194230 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194254 - BLOCK
      ?auto_194255 - BLOCK
      ?auto_194256 - BLOCK
      ?auto_194257 - BLOCK
    )
    :vars
    (
      ?auto_194258 - BLOCK
      ?auto_194262 - BLOCK
      ?auto_194259 - BLOCK
      ?auto_194260 - BLOCK
      ?auto_194261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194254 ) ( ON ?auto_194255 ?auto_194254 ) ( ON ?auto_194256 ?auto_194255 ) ( not ( = ?auto_194254 ?auto_194255 ) ) ( not ( = ?auto_194254 ?auto_194256 ) ) ( not ( = ?auto_194254 ?auto_194257 ) ) ( not ( = ?auto_194254 ?auto_194258 ) ) ( not ( = ?auto_194255 ?auto_194256 ) ) ( not ( = ?auto_194255 ?auto_194257 ) ) ( not ( = ?auto_194255 ?auto_194258 ) ) ( not ( = ?auto_194256 ?auto_194257 ) ) ( not ( = ?auto_194256 ?auto_194258 ) ) ( not ( = ?auto_194257 ?auto_194258 ) ) ( not ( = ?auto_194254 ?auto_194262 ) ) ( not ( = ?auto_194254 ?auto_194259 ) ) ( not ( = ?auto_194255 ?auto_194262 ) ) ( not ( = ?auto_194255 ?auto_194259 ) ) ( not ( = ?auto_194256 ?auto_194262 ) ) ( not ( = ?auto_194256 ?auto_194259 ) ) ( not ( = ?auto_194257 ?auto_194262 ) ) ( not ( = ?auto_194257 ?auto_194259 ) ) ( not ( = ?auto_194258 ?auto_194262 ) ) ( not ( = ?auto_194258 ?auto_194259 ) ) ( not ( = ?auto_194262 ?auto_194259 ) ) ( not ( = ?auto_194260 ?auto_194259 ) ) ( not ( = ?auto_194254 ?auto_194260 ) ) ( not ( = ?auto_194255 ?auto_194260 ) ) ( not ( = ?auto_194256 ?auto_194260 ) ) ( not ( = ?auto_194257 ?auto_194260 ) ) ( not ( = ?auto_194258 ?auto_194260 ) ) ( not ( = ?auto_194262 ?auto_194260 ) ) ( ON ?auto_194260 ?auto_194261 ) ( not ( = ?auto_194254 ?auto_194261 ) ) ( not ( = ?auto_194255 ?auto_194261 ) ) ( not ( = ?auto_194256 ?auto_194261 ) ) ( not ( = ?auto_194257 ?auto_194261 ) ) ( not ( = ?auto_194258 ?auto_194261 ) ) ( not ( = ?auto_194262 ?auto_194261 ) ) ( not ( = ?auto_194259 ?auto_194261 ) ) ( not ( = ?auto_194260 ?auto_194261 ) ) ( ON ?auto_194259 ?auto_194260 ) ( ON-TABLE ?auto_194261 ) ( ON ?auto_194262 ?auto_194259 ) ( ON ?auto_194258 ?auto_194262 ) ( CLEAR ?auto_194258 ) ( HOLDING ?auto_194257 ) ( CLEAR ?auto_194256 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194254 ?auto_194255 ?auto_194256 ?auto_194257 ?auto_194258 )
      ( MAKE-4PILE ?auto_194254 ?auto_194255 ?auto_194256 ?auto_194257 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194263 - BLOCK
      ?auto_194264 - BLOCK
      ?auto_194265 - BLOCK
      ?auto_194266 - BLOCK
    )
    :vars
    (
      ?auto_194270 - BLOCK
      ?auto_194267 - BLOCK
      ?auto_194271 - BLOCK
      ?auto_194268 - BLOCK
      ?auto_194269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194263 ) ( ON ?auto_194264 ?auto_194263 ) ( ON ?auto_194265 ?auto_194264 ) ( not ( = ?auto_194263 ?auto_194264 ) ) ( not ( = ?auto_194263 ?auto_194265 ) ) ( not ( = ?auto_194263 ?auto_194266 ) ) ( not ( = ?auto_194263 ?auto_194270 ) ) ( not ( = ?auto_194264 ?auto_194265 ) ) ( not ( = ?auto_194264 ?auto_194266 ) ) ( not ( = ?auto_194264 ?auto_194270 ) ) ( not ( = ?auto_194265 ?auto_194266 ) ) ( not ( = ?auto_194265 ?auto_194270 ) ) ( not ( = ?auto_194266 ?auto_194270 ) ) ( not ( = ?auto_194263 ?auto_194267 ) ) ( not ( = ?auto_194263 ?auto_194271 ) ) ( not ( = ?auto_194264 ?auto_194267 ) ) ( not ( = ?auto_194264 ?auto_194271 ) ) ( not ( = ?auto_194265 ?auto_194267 ) ) ( not ( = ?auto_194265 ?auto_194271 ) ) ( not ( = ?auto_194266 ?auto_194267 ) ) ( not ( = ?auto_194266 ?auto_194271 ) ) ( not ( = ?auto_194270 ?auto_194267 ) ) ( not ( = ?auto_194270 ?auto_194271 ) ) ( not ( = ?auto_194267 ?auto_194271 ) ) ( not ( = ?auto_194268 ?auto_194271 ) ) ( not ( = ?auto_194263 ?auto_194268 ) ) ( not ( = ?auto_194264 ?auto_194268 ) ) ( not ( = ?auto_194265 ?auto_194268 ) ) ( not ( = ?auto_194266 ?auto_194268 ) ) ( not ( = ?auto_194270 ?auto_194268 ) ) ( not ( = ?auto_194267 ?auto_194268 ) ) ( ON ?auto_194268 ?auto_194269 ) ( not ( = ?auto_194263 ?auto_194269 ) ) ( not ( = ?auto_194264 ?auto_194269 ) ) ( not ( = ?auto_194265 ?auto_194269 ) ) ( not ( = ?auto_194266 ?auto_194269 ) ) ( not ( = ?auto_194270 ?auto_194269 ) ) ( not ( = ?auto_194267 ?auto_194269 ) ) ( not ( = ?auto_194271 ?auto_194269 ) ) ( not ( = ?auto_194268 ?auto_194269 ) ) ( ON ?auto_194271 ?auto_194268 ) ( ON-TABLE ?auto_194269 ) ( ON ?auto_194267 ?auto_194271 ) ( ON ?auto_194270 ?auto_194267 ) ( CLEAR ?auto_194265 ) ( ON ?auto_194266 ?auto_194270 ) ( CLEAR ?auto_194266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194269 ?auto_194268 ?auto_194271 ?auto_194267 ?auto_194270 )
      ( MAKE-4PILE ?auto_194263 ?auto_194264 ?auto_194265 ?auto_194266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194272 - BLOCK
      ?auto_194273 - BLOCK
      ?auto_194274 - BLOCK
      ?auto_194275 - BLOCK
    )
    :vars
    (
      ?auto_194278 - BLOCK
      ?auto_194277 - BLOCK
      ?auto_194280 - BLOCK
      ?auto_194279 - BLOCK
      ?auto_194276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194272 ) ( ON ?auto_194273 ?auto_194272 ) ( not ( = ?auto_194272 ?auto_194273 ) ) ( not ( = ?auto_194272 ?auto_194274 ) ) ( not ( = ?auto_194272 ?auto_194275 ) ) ( not ( = ?auto_194272 ?auto_194278 ) ) ( not ( = ?auto_194273 ?auto_194274 ) ) ( not ( = ?auto_194273 ?auto_194275 ) ) ( not ( = ?auto_194273 ?auto_194278 ) ) ( not ( = ?auto_194274 ?auto_194275 ) ) ( not ( = ?auto_194274 ?auto_194278 ) ) ( not ( = ?auto_194275 ?auto_194278 ) ) ( not ( = ?auto_194272 ?auto_194277 ) ) ( not ( = ?auto_194272 ?auto_194280 ) ) ( not ( = ?auto_194273 ?auto_194277 ) ) ( not ( = ?auto_194273 ?auto_194280 ) ) ( not ( = ?auto_194274 ?auto_194277 ) ) ( not ( = ?auto_194274 ?auto_194280 ) ) ( not ( = ?auto_194275 ?auto_194277 ) ) ( not ( = ?auto_194275 ?auto_194280 ) ) ( not ( = ?auto_194278 ?auto_194277 ) ) ( not ( = ?auto_194278 ?auto_194280 ) ) ( not ( = ?auto_194277 ?auto_194280 ) ) ( not ( = ?auto_194279 ?auto_194280 ) ) ( not ( = ?auto_194272 ?auto_194279 ) ) ( not ( = ?auto_194273 ?auto_194279 ) ) ( not ( = ?auto_194274 ?auto_194279 ) ) ( not ( = ?auto_194275 ?auto_194279 ) ) ( not ( = ?auto_194278 ?auto_194279 ) ) ( not ( = ?auto_194277 ?auto_194279 ) ) ( ON ?auto_194279 ?auto_194276 ) ( not ( = ?auto_194272 ?auto_194276 ) ) ( not ( = ?auto_194273 ?auto_194276 ) ) ( not ( = ?auto_194274 ?auto_194276 ) ) ( not ( = ?auto_194275 ?auto_194276 ) ) ( not ( = ?auto_194278 ?auto_194276 ) ) ( not ( = ?auto_194277 ?auto_194276 ) ) ( not ( = ?auto_194280 ?auto_194276 ) ) ( not ( = ?auto_194279 ?auto_194276 ) ) ( ON ?auto_194280 ?auto_194279 ) ( ON-TABLE ?auto_194276 ) ( ON ?auto_194277 ?auto_194280 ) ( ON ?auto_194278 ?auto_194277 ) ( ON ?auto_194275 ?auto_194278 ) ( CLEAR ?auto_194275 ) ( HOLDING ?auto_194274 ) ( CLEAR ?auto_194273 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194272 ?auto_194273 ?auto_194274 )
      ( MAKE-4PILE ?auto_194272 ?auto_194273 ?auto_194274 ?auto_194275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194281 - BLOCK
      ?auto_194282 - BLOCK
      ?auto_194283 - BLOCK
      ?auto_194284 - BLOCK
    )
    :vars
    (
      ?auto_194286 - BLOCK
      ?auto_194289 - BLOCK
      ?auto_194285 - BLOCK
      ?auto_194287 - BLOCK
      ?auto_194288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194281 ) ( ON ?auto_194282 ?auto_194281 ) ( not ( = ?auto_194281 ?auto_194282 ) ) ( not ( = ?auto_194281 ?auto_194283 ) ) ( not ( = ?auto_194281 ?auto_194284 ) ) ( not ( = ?auto_194281 ?auto_194286 ) ) ( not ( = ?auto_194282 ?auto_194283 ) ) ( not ( = ?auto_194282 ?auto_194284 ) ) ( not ( = ?auto_194282 ?auto_194286 ) ) ( not ( = ?auto_194283 ?auto_194284 ) ) ( not ( = ?auto_194283 ?auto_194286 ) ) ( not ( = ?auto_194284 ?auto_194286 ) ) ( not ( = ?auto_194281 ?auto_194289 ) ) ( not ( = ?auto_194281 ?auto_194285 ) ) ( not ( = ?auto_194282 ?auto_194289 ) ) ( not ( = ?auto_194282 ?auto_194285 ) ) ( not ( = ?auto_194283 ?auto_194289 ) ) ( not ( = ?auto_194283 ?auto_194285 ) ) ( not ( = ?auto_194284 ?auto_194289 ) ) ( not ( = ?auto_194284 ?auto_194285 ) ) ( not ( = ?auto_194286 ?auto_194289 ) ) ( not ( = ?auto_194286 ?auto_194285 ) ) ( not ( = ?auto_194289 ?auto_194285 ) ) ( not ( = ?auto_194287 ?auto_194285 ) ) ( not ( = ?auto_194281 ?auto_194287 ) ) ( not ( = ?auto_194282 ?auto_194287 ) ) ( not ( = ?auto_194283 ?auto_194287 ) ) ( not ( = ?auto_194284 ?auto_194287 ) ) ( not ( = ?auto_194286 ?auto_194287 ) ) ( not ( = ?auto_194289 ?auto_194287 ) ) ( ON ?auto_194287 ?auto_194288 ) ( not ( = ?auto_194281 ?auto_194288 ) ) ( not ( = ?auto_194282 ?auto_194288 ) ) ( not ( = ?auto_194283 ?auto_194288 ) ) ( not ( = ?auto_194284 ?auto_194288 ) ) ( not ( = ?auto_194286 ?auto_194288 ) ) ( not ( = ?auto_194289 ?auto_194288 ) ) ( not ( = ?auto_194285 ?auto_194288 ) ) ( not ( = ?auto_194287 ?auto_194288 ) ) ( ON ?auto_194285 ?auto_194287 ) ( ON-TABLE ?auto_194288 ) ( ON ?auto_194289 ?auto_194285 ) ( ON ?auto_194286 ?auto_194289 ) ( ON ?auto_194284 ?auto_194286 ) ( CLEAR ?auto_194282 ) ( ON ?auto_194283 ?auto_194284 ) ( CLEAR ?auto_194283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194288 ?auto_194287 ?auto_194285 ?auto_194289 ?auto_194286 ?auto_194284 )
      ( MAKE-4PILE ?auto_194281 ?auto_194282 ?auto_194283 ?auto_194284 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194290 - BLOCK
      ?auto_194291 - BLOCK
      ?auto_194292 - BLOCK
      ?auto_194293 - BLOCK
    )
    :vars
    (
      ?auto_194297 - BLOCK
      ?auto_194294 - BLOCK
      ?auto_194296 - BLOCK
      ?auto_194298 - BLOCK
      ?auto_194295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194290 ) ( not ( = ?auto_194290 ?auto_194291 ) ) ( not ( = ?auto_194290 ?auto_194292 ) ) ( not ( = ?auto_194290 ?auto_194293 ) ) ( not ( = ?auto_194290 ?auto_194297 ) ) ( not ( = ?auto_194291 ?auto_194292 ) ) ( not ( = ?auto_194291 ?auto_194293 ) ) ( not ( = ?auto_194291 ?auto_194297 ) ) ( not ( = ?auto_194292 ?auto_194293 ) ) ( not ( = ?auto_194292 ?auto_194297 ) ) ( not ( = ?auto_194293 ?auto_194297 ) ) ( not ( = ?auto_194290 ?auto_194294 ) ) ( not ( = ?auto_194290 ?auto_194296 ) ) ( not ( = ?auto_194291 ?auto_194294 ) ) ( not ( = ?auto_194291 ?auto_194296 ) ) ( not ( = ?auto_194292 ?auto_194294 ) ) ( not ( = ?auto_194292 ?auto_194296 ) ) ( not ( = ?auto_194293 ?auto_194294 ) ) ( not ( = ?auto_194293 ?auto_194296 ) ) ( not ( = ?auto_194297 ?auto_194294 ) ) ( not ( = ?auto_194297 ?auto_194296 ) ) ( not ( = ?auto_194294 ?auto_194296 ) ) ( not ( = ?auto_194298 ?auto_194296 ) ) ( not ( = ?auto_194290 ?auto_194298 ) ) ( not ( = ?auto_194291 ?auto_194298 ) ) ( not ( = ?auto_194292 ?auto_194298 ) ) ( not ( = ?auto_194293 ?auto_194298 ) ) ( not ( = ?auto_194297 ?auto_194298 ) ) ( not ( = ?auto_194294 ?auto_194298 ) ) ( ON ?auto_194298 ?auto_194295 ) ( not ( = ?auto_194290 ?auto_194295 ) ) ( not ( = ?auto_194291 ?auto_194295 ) ) ( not ( = ?auto_194292 ?auto_194295 ) ) ( not ( = ?auto_194293 ?auto_194295 ) ) ( not ( = ?auto_194297 ?auto_194295 ) ) ( not ( = ?auto_194294 ?auto_194295 ) ) ( not ( = ?auto_194296 ?auto_194295 ) ) ( not ( = ?auto_194298 ?auto_194295 ) ) ( ON ?auto_194296 ?auto_194298 ) ( ON-TABLE ?auto_194295 ) ( ON ?auto_194294 ?auto_194296 ) ( ON ?auto_194297 ?auto_194294 ) ( ON ?auto_194293 ?auto_194297 ) ( ON ?auto_194292 ?auto_194293 ) ( CLEAR ?auto_194292 ) ( HOLDING ?auto_194291 ) ( CLEAR ?auto_194290 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194290 ?auto_194291 )
      ( MAKE-4PILE ?auto_194290 ?auto_194291 ?auto_194292 ?auto_194293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194299 - BLOCK
      ?auto_194300 - BLOCK
      ?auto_194301 - BLOCK
      ?auto_194302 - BLOCK
    )
    :vars
    (
      ?auto_194306 - BLOCK
      ?auto_194305 - BLOCK
      ?auto_194303 - BLOCK
      ?auto_194304 - BLOCK
      ?auto_194307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194299 ) ( not ( = ?auto_194299 ?auto_194300 ) ) ( not ( = ?auto_194299 ?auto_194301 ) ) ( not ( = ?auto_194299 ?auto_194302 ) ) ( not ( = ?auto_194299 ?auto_194306 ) ) ( not ( = ?auto_194300 ?auto_194301 ) ) ( not ( = ?auto_194300 ?auto_194302 ) ) ( not ( = ?auto_194300 ?auto_194306 ) ) ( not ( = ?auto_194301 ?auto_194302 ) ) ( not ( = ?auto_194301 ?auto_194306 ) ) ( not ( = ?auto_194302 ?auto_194306 ) ) ( not ( = ?auto_194299 ?auto_194305 ) ) ( not ( = ?auto_194299 ?auto_194303 ) ) ( not ( = ?auto_194300 ?auto_194305 ) ) ( not ( = ?auto_194300 ?auto_194303 ) ) ( not ( = ?auto_194301 ?auto_194305 ) ) ( not ( = ?auto_194301 ?auto_194303 ) ) ( not ( = ?auto_194302 ?auto_194305 ) ) ( not ( = ?auto_194302 ?auto_194303 ) ) ( not ( = ?auto_194306 ?auto_194305 ) ) ( not ( = ?auto_194306 ?auto_194303 ) ) ( not ( = ?auto_194305 ?auto_194303 ) ) ( not ( = ?auto_194304 ?auto_194303 ) ) ( not ( = ?auto_194299 ?auto_194304 ) ) ( not ( = ?auto_194300 ?auto_194304 ) ) ( not ( = ?auto_194301 ?auto_194304 ) ) ( not ( = ?auto_194302 ?auto_194304 ) ) ( not ( = ?auto_194306 ?auto_194304 ) ) ( not ( = ?auto_194305 ?auto_194304 ) ) ( ON ?auto_194304 ?auto_194307 ) ( not ( = ?auto_194299 ?auto_194307 ) ) ( not ( = ?auto_194300 ?auto_194307 ) ) ( not ( = ?auto_194301 ?auto_194307 ) ) ( not ( = ?auto_194302 ?auto_194307 ) ) ( not ( = ?auto_194306 ?auto_194307 ) ) ( not ( = ?auto_194305 ?auto_194307 ) ) ( not ( = ?auto_194303 ?auto_194307 ) ) ( not ( = ?auto_194304 ?auto_194307 ) ) ( ON ?auto_194303 ?auto_194304 ) ( ON-TABLE ?auto_194307 ) ( ON ?auto_194305 ?auto_194303 ) ( ON ?auto_194306 ?auto_194305 ) ( ON ?auto_194302 ?auto_194306 ) ( ON ?auto_194301 ?auto_194302 ) ( CLEAR ?auto_194299 ) ( ON ?auto_194300 ?auto_194301 ) ( CLEAR ?auto_194300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194307 ?auto_194304 ?auto_194303 ?auto_194305 ?auto_194306 ?auto_194302 ?auto_194301 )
      ( MAKE-4PILE ?auto_194299 ?auto_194300 ?auto_194301 ?auto_194302 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194308 - BLOCK
      ?auto_194309 - BLOCK
      ?auto_194310 - BLOCK
      ?auto_194311 - BLOCK
    )
    :vars
    (
      ?auto_194312 - BLOCK
      ?auto_194314 - BLOCK
      ?auto_194315 - BLOCK
      ?auto_194316 - BLOCK
      ?auto_194313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194308 ?auto_194309 ) ) ( not ( = ?auto_194308 ?auto_194310 ) ) ( not ( = ?auto_194308 ?auto_194311 ) ) ( not ( = ?auto_194308 ?auto_194312 ) ) ( not ( = ?auto_194309 ?auto_194310 ) ) ( not ( = ?auto_194309 ?auto_194311 ) ) ( not ( = ?auto_194309 ?auto_194312 ) ) ( not ( = ?auto_194310 ?auto_194311 ) ) ( not ( = ?auto_194310 ?auto_194312 ) ) ( not ( = ?auto_194311 ?auto_194312 ) ) ( not ( = ?auto_194308 ?auto_194314 ) ) ( not ( = ?auto_194308 ?auto_194315 ) ) ( not ( = ?auto_194309 ?auto_194314 ) ) ( not ( = ?auto_194309 ?auto_194315 ) ) ( not ( = ?auto_194310 ?auto_194314 ) ) ( not ( = ?auto_194310 ?auto_194315 ) ) ( not ( = ?auto_194311 ?auto_194314 ) ) ( not ( = ?auto_194311 ?auto_194315 ) ) ( not ( = ?auto_194312 ?auto_194314 ) ) ( not ( = ?auto_194312 ?auto_194315 ) ) ( not ( = ?auto_194314 ?auto_194315 ) ) ( not ( = ?auto_194316 ?auto_194315 ) ) ( not ( = ?auto_194308 ?auto_194316 ) ) ( not ( = ?auto_194309 ?auto_194316 ) ) ( not ( = ?auto_194310 ?auto_194316 ) ) ( not ( = ?auto_194311 ?auto_194316 ) ) ( not ( = ?auto_194312 ?auto_194316 ) ) ( not ( = ?auto_194314 ?auto_194316 ) ) ( ON ?auto_194316 ?auto_194313 ) ( not ( = ?auto_194308 ?auto_194313 ) ) ( not ( = ?auto_194309 ?auto_194313 ) ) ( not ( = ?auto_194310 ?auto_194313 ) ) ( not ( = ?auto_194311 ?auto_194313 ) ) ( not ( = ?auto_194312 ?auto_194313 ) ) ( not ( = ?auto_194314 ?auto_194313 ) ) ( not ( = ?auto_194315 ?auto_194313 ) ) ( not ( = ?auto_194316 ?auto_194313 ) ) ( ON ?auto_194315 ?auto_194316 ) ( ON-TABLE ?auto_194313 ) ( ON ?auto_194314 ?auto_194315 ) ( ON ?auto_194312 ?auto_194314 ) ( ON ?auto_194311 ?auto_194312 ) ( ON ?auto_194310 ?auto_194311 ) ( ON ?auto_194309 ?auto_194310 ) ( CLEAR ?auto_194309 ) ( HOLDING ?auto_194308 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194308 )
      ( MAKE-4PILE ?auto_194308 ?auto_194309 ?auto_194310 ?auto_194311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194317 - BLOCK
      ?auto_194318 - BLOCK
      ?auto_194319 - BLOCK
      ?auto_194320 - BLOCK
    )
    :vars
    (
      ?auto_194323 - BLOCK
      ?auto_194322 - BLOCK
      ?auto_194325 - BLOCK
      ?auto_194324 - BLOCK
      ?auto_194321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194317 ?auto_194318 ) ) ( not ( = ?auto_194317 ?auto_194319 ) ) ( not ( = ?auto_194317 ?auto_194320 ) ) ( not ( = ?auto_194317 ?auto_194323 ) ) ( not ( = ?auto_194318 ?auto_194319 ) ) ( not ( = ?auto_194318 ?auto_194320 ) ) ( not ( = ?auto_194318 ?auto_194323 ) ) ( not ( = ?auto_194319 ?auto_194320 ) ) ( not ( = ?auto_194319 ?auto_194323 ) ) ( not ( = ?auto_194320 ?auto_194323 ) ) ( not ( = ?auto_194317 ?auto_194322 ) ) ( not ( = ?auto_194317 ?auto_194325 ) ) ( not ( = ?auto_194318 ?auto_194322 ) ) ( not ( = ?auto_194318 ?auto_194325 ) ) ( not ( = ?auto_194319 ?auto_194322 ) ) ( not ( = ?auto_194319 ?auto_194325 ) ) ( not ( = ?auto_194320 ?auto_194322 ) ) ( not ( = ?auto_194320 ?auto_194325 ) ) ( not ( = ?auto_194323 ?auto_194322 ) ) ( not ( = ?auto_194323 ?auto_194325 ) ) ( not ( = ?auto_194322 ?auto_194325 ) ) ( not ( = ?auto_194324 ?auto_194325 ) ) ( not ( = ?auto_194317 ?auto_194324 ) ) ( not ( = ?auto_194318 ?auto_194324 ) ) ( not ( = ?auto_194319 ?auto_194324 ) ) ( not ( = ?auto_194320 ?auto_194324 ) ) ( not ( = ?auto_194323 ?auto_194324 ) ) ( not ( = ?auto_194322 ?auto_194324 ) ) ( ON ?auto_194324 ?auto_194321 ) ( not ( = ?auto_194317 ?auto_194321 ) ) ( not ( = ?auto_194318 ?auto_194321 ) ) ( not ( = ?auto_194319 ?auto_194321 ) ) ( not ( = ?auto_194320 ?auto_194321 ) ) ( not ( = ?auto_194323 ?auto_194321 ) ) ( not ( = ?auto_194322 ?auto_194321 ) ) ( not ( = ?auto_194325 ?auto_194321 ) ) ( not ( = ?auto_194324 ?auto_194321 ) ) ( ON ?auto_194325 ?auto_194324 ) ( ON-TABLE ?auto_194321 ) ( ON ?auto_194322 ?auto_194325 ) ( ON ?auto_194323 ?auto_194322 ) ( ON ?auto_194320 ?auto_194323 ) ( ON ?auto_194319 ?auto_194320 ) ( ON ?auto_194318 ?auto_194319 ) ( ON ?auto_194317 ?auto_194318 ) ( CLEAR ?auto_194317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_194321 ?auto_194324 ?auto_194325 ?auto_194322 ?auto_194323 ?auto_194320 ?auto_194319 ?auto_194318 )
      ( MAKE-4PILE ?auto_194317 ?auto_194318 ?auto_194319 ?auto_194320 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194330 - BLOCK
      ?auto_194331 - BLOCK
      ?auto_194332 - BLOCK
      ?auto_194333 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_194333 ) ( CLEAR ?auto_194332 ) ( ON-TABLE ?auto_194330 ) ( ON ?auto_194331 ?auto_194330 ) ( ON ?auto_194332 ?auto_194331 ) ( not ( = ?auto_194330 ?auto_194331 ) ) ( not ( = ?auto_194330 ?auto_194332 ) ) ( not ( = ?auto_194330 ?auto_194333 ) ) ( not ( = ?auto_194331 ?auto_194332 ) ) ( not ( = ?auto_194331 ?auto_194333 ) ) ( not ( = ?auto_194332 ?auto_194333 ) ) )
    :subtasks
    ( ( !STACK ?auto_194333 ?auto_194332 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194334 - BLOCK
      ?auto_194335 - BLOCK
      ?auto_194336 - BLOCK
      ?auto_194337 - BLOCK
    )
    :vars
    (
      ?auto_194338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194336 ) ( ON-TABLE ?auto_194334 ) ( ON ?auto_194335 ?auto_194334 ) ( ON ?auto_194336 ?auto_194335 ) ( not ( = ?auto_194334 ?auto_194335 ) ) ( not ( = ?auto_194334 ?auto_194336 ) ) ( not ( = ?auto_194334 ?auto_194337 ) ) ( not ( = ?auto_194335 ?auto_194336 ) ) ( not ( = ?auto_194335 ?auto_194337 ) ) ( not ( = ?auto_194336 ?auto_194337 ) ) ( ON ?auto_194337 ?auto_194338 ) ( CLEAR ?auto_194337 ) ( HAND-EMPTY ) ( not ( = ?auto_194334 ?auto_194338 ) ) ( not ( = ?auto_194335 ?auto_194338 ) ) ( not ( = ?auto_194336 ?auto_194338 ) ) ( not ( = ?auto_194337 ?auto_194338 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194337 ?auto_194338 )
      ( MAKE-4PILE ?auto_194334 ?auto_194335 ?auto_194336 ?auto_194337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194339 - BLOCK
      ?auto_194340 - BLOCK
      ?auto_194341 - BLOCK
      ?auto_194342 - BLOCK
    )
    :vars
    (
      ?auto_194343 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194339 ) ( ON ?auto_194340 ?auto_194339 ) ( not ( = ?auto_194339 ?auto_194340 ) ) ( not ( = ?auto_194339 ?auto_194341 ) ) ( not ( = ?auto_194339 ?auto_194342 ) ) ( not ( = ?auto_194340 ?auto_194341 ) ) ( not ( = ?auto_194340 ?auto_194342 ) ) ( not ( = ?auto_194341 ?auto_194342 ) ) ( ON ?auto_194342 ?auto_194343 ) ( CLEAR ?auto_194342 ) ( not ( = ?auto_194339 ?auto_194343 ) ) ( not ( = ?auto_194340 ?auto_194343 ) ) ( not ( = ?auto_194341 ?auto_194343 ) ) ( not ( = ?auto_194342 ?auto_194343 ) ) ( HOLDING ?auto_194341 ) ( CLEAR ?auto_194340 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194339 ?auto_194340 ?auto_194341 )
      ( MAKE-4PILE ?auto_194339 ?auto_194340 ?auto_194341 ?auto_194342 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194344 - BLOCK
      ?auto_194345 - BLOCK
      ?auto_194346 - BLOCK
      ?auto_194347 - BLOCK
    )
    :vars
    (
      ?auto_194348 - BLOCK
      ?auto_194350 - BLOCK
      ?auto_194349 - BLOCK
      ?auto_194351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194344 ) ( ON ?auto_194345 ?auto_194344 ) ( not ( = ?auto_194344 ?auto_194345 ) ) ( not ( = ?auto_194344 ?auto_194346 ) ) ( not ( = ?auto_194344 ?auto_194347 ) ) ( not ( = ?auto_194345 ?auto_194346 ) ) ( not ( = ?auto_194345 ?auto_194347 ) ) ( not ( = ?auto_194346 ?auto_194347 ) ) ( ON ?auto_194347 ?auto_194348 ) ( not ( = ?auto_194344 ?auto_194348 ) ) ( not ( = ?auto_194345 ?auto_194348 ) ) ( not ( = ?auto_194346 ?auto_194348 ) ) ( not ( = ?auto_194347 ?auto_194348 ) ) ( CLEAR ?auto_194345 ) ( ON ?auto_194346 ?auto_194347 ) ( CLEAR ?auto_194346 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194350 ) ( ON ?auto_194349 ?auto_194350 ) ( ON ?auto_194351 ?auto_194349 ) ( ON ?auto_194348 ?auto_194351 ) ( not ( = ?auto_194350 ?auto_194349 ) ) ( not ( = ?auto_194350 ?auto_194351 ) ) ( not ( = ?auto_194350 ?auto_194348 ) ) ( not ( = ?auto_194350 ?auto_194347 ) ) ( not ( = ?auto_194350 ?auto_194346 ) ) ( not ( = ?auto_194349 ?auto_194351 ) ) ( not ( = ?auto_194349 ?auto_194348 ) ) ( not ( = ?auto_194349 ?auto_194347 ) ) ( not ( = ?auto_194349 ?auto_194346 ) ) ( not ( = ?auto_194351 ?auto_194348 ) ) ( not ( = ?auto_194351 ?auto_194347 ) ) ( not ( = ?auto_194351 ?auto_194346 ) ) ( not ( = ?auto_194344 ?auto_194350 ) ) ( not ( = ?auto_194344 ?auto_194349 ) ) ( not ( = ?auto_194344 ?auto_194351 ) ) ( not ( = ?auto_194345 ?auto_194350 ) ) ( not ( = ?auto_194345 ?auto_194349 ) ) ( not ( = ?auto_194345 ?auto_194351 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194350 ?auto_194349 ?auto_194351 ?auto_194348 ?auto_194347 )
      ( MAKE-4PILE ?auto_194344 ?auto_194345 ?auto_194346 ?auto_194347 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194352 - BLOCK
      ?auto_194353 - BLOCK
      ?auto_194354 - BLOCK
      ?auto_194355 - BLOCK
    )
    :vars
    (
      ?auto_194356 - BLOCK
      ?auto_194357 - BLOCK
      ?auto_194358 - BLOCK
      ?auto_194359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194352 ) ( not ( = ?auto_194352 ?auto_194353 ) ) ( not ( = ?auto_194352 ?auto_194354 ) ) ( not ( = ?auto_194352 ?auto_194355 ) ) ( not ( = ?auto_194353 ?auto_194354 ) ) ( not ( = ?auto_194353 ?auto_194355 ) ) ( not ( = ?auto_194354 ?auto_194355 ) ) ( ON ?auto_194355 ?auto_194356 ) ( not ( = ?auto_194352 ?auto_194356 ) ) ( not ( = ?auto_194353 ?auto_194356 ) ) ( not ( = ?auto_194354 ?auto_194356 ) ) ( not ( = ?auto_194355 ?auto_194356 ) ) ( ON ?auto_194354 ?auto_194355 ) ( CLEAR ?auto_194354 ) ( ON-TABLE ?auto_194357 ) ( ON ?auto_194358 ?auto_194357 ) ( ON ?auto_194359 ?auto_194358 ) ( ON ?auto_194356 ?auto_194359 ) ( not ( = ?auto_194357 ?auto_194358 ) ) ( not ( = ?auto_194357 ?auto_194359 ) ) ( not ( = ?auto_194357 ?auto_194356 ) ) ( not ( = ?auto_194357 ?auto_194355 ) ) ( not ( = ?auto_194357 ?auto_194354 ) ) ( not ( = ?auto_194358 ?auto_194359 ) ) ( not ( = ?auto_194358 ?auto_194356 ) ) ( not ( = ?auto_194358 ?auto_194355 ) ) ( not ( = ?auto_194358 ?auto_194354 ) ) ( not ( = ?auto_194359 ?auto_194356 ) ) ( not ( = ?auto_194359 ?auto_194355 ) ) ( not ( = ?auto_194359 ?auto_194354 ) ) ( not ( = ?auto_194352 ?auto_194357 ) ) ( not ( = ?auto_194352 ?auto_194358 ) ) ( not ( = ?auto_194352 ?auto_194359 ) ) ( not ( = ?auto_194353 ?auto_194357 ) ) ( not ( = ?auto_194353 ?auto_194358 ) ) ( not ( = ?auto_194353 ?auto_194359 ) ) ( HOLDING ?auto_194353 ) ( CLEAR ?auto_194352 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194352 ?auto_194353 )
      ( MAKE-4PILE ?auto_194352 ?auto_194353 ?auto_194354 ?auto_194355 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194360 - BLOCK
      ?auto_194361 - BLOCK
      ?auto_194362 - BLOCK
      ?auto_194363 - BLOCK
    )
    :vars
    (
      ?auto_194365 - BLOCK
      ?auto_194367 - BLOCK
      ?auto_194364 - BLOCK
      ?auto_194366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194360 ) ( not ( = ?auto_194360 ?auto_194361 ) ) ( not ( = ?auto_194360 ?auto_194362 ) ) ( not ( = ?auto_194360 ?auto_194363 ) ) ( not ( = ?auto_194361 ?auto_194362 ) ) ( not ( = ?auto_194361 ?auto_194363 ) ) ( not ( = ?auto_194362 ?auto_194363 ) ) ( ON ?auto_194363 ?auto_194365 ) ( not ( = ?auto_194360 ?auto_194365 ) ) ( not ( = ?auto_194361 ?auto_194365 ) ) ( not ( = ?auto_194362 ?auto_194365 ) ) ( not ( = ?auto_194363 ?auto_194365 ) ) ( ON ?auto_194362 ?auto_194363 ) ( ON-TABLE ?auto_194367 ) ( ON ?auto_194364 ?auto_194367 ) ( ON ?auto_194366 ?auto_194364 ) ( ON ?auto_194365 ?auto_194366 ) ( not ( = ?auto_194367 ?auto_194364 ) ) ( not ( = ?auto_194367 ?auto_194366 ) ) ( not ( = ?auto_194367 ?auto_194365 ) ) ( not ( = ?auto_194367 ?auto_194363 ) ) ( not ( = ?auto_194367 ?auto_194362 ) ) ( not ( = ?auto_194364 ?auto_194366 ) ) ( not ( = ?auto_194364 ?auto_194365 ) ) ( not ( = ?auto_194364 ?auto_194363 ) ) ( not ( = ?auto_194364 ?auto_194362 ) ) ( not ( = ?auto_194366 ?auto_194365 ) ) ( not ( = ?auto_194366 ?auto_194363 ) ) ( not ( = ?auto_194366 ?auto_194362 ) ) ( not ( = ?auto_194360 ?auto_194367 ) ) ( not ( = ?auto_194360 ?auto_194364 ) ) ( not ( = ?auto_194360 ?auto_194366 ) ) ( not ( = ?auto_194361 ?auto_194367 ) ) ( not ( = ?auto_194361 ?auto_194364 ) ) ( not ( = ?auto_194361 ?auto_194366 ) ) ( CLEAR ?auto_194360 ) ( ON ?auto_194361 ?auto_194362 ) ( CLEAR ?auto_194361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194367 ?auto_194364 ?auto_194366 ?auto_194365 ?auto_194363 ?auto_194362 )
      ( MAKE-4PILE ?auto_194360 ?auto_194361 ?auto_194362 ?auto_194363 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194368 - BLOCK
      ?auto_194369 - BLOCK
      ?auto_194370 - BLOCK
      ?auto_194371 - BLOCK
    )
    :vars
    (
      ?auto_194372 - BLOCK
      ?auto_194374 - BLOCK
      ?auto_194375 - BLOCK
      ?auto_194373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194368 ?auto_194369 ) ) ( not ( = ?auto_194368 ?auto_194370 ) ) ( not ( = ?auto_194368 ?auto_194371 ) ) ( not ( = ?auto_194369 ?auto_194370 ) ) ( not ( = ?auto_194369 ?auto_194371 ) ) ( not ( = ?auto_194370 ?auto_194371 ) ) ( ON ?auto_194371 ?auto_194372 ) ( not ( = ?auto_194368 ?auto_194372 ) ) ( not ( = ?auto_194369 ?auto_194372 ) ) ( not ( = ?auto_194370 ?auto_194372 ) ) ( not ( = ?auto_194371 ?auto_194372 ) ) ( ON ?auto_194370 ?auto_194371 ) ( ON-TABLE ?auto_194374 ) ( ON ?auto_194375 ?auto_194374 ) ( ON ?auto_194373 ?auto_194375 ) ( ON ?auto_194372 ?auto_194373 ) ( not ( = ?auto_194374 ?auto_194375 ) ) ( not ( = ?auto_194374 ?auto_194373 ) ) ( not ( = ?auto_194374 ?auto_194372 ) ) ( not ( = ?auto_194374 ?auto_194371 ) ) ( not ( = ?auto_194374 ?auto_194370 ) ) ( not ( = ?auto_194375 ?auto_194373 ) ) ( not ( = ?auto_194375 ?auto_194372 ) ) ( not ( = ?auto_194375 ?auto_194371 ) ) ( not ( = ?auto_194375 ?auto_194370 ) ) ( not ( = ?auto_194373 ?auto_194372 ) ) ( not ( = ?auto_194373 ?auto_194371 ) ) ( not ( = ?auto_194373 ?auto_194370 ) ) ( not ( = ?auto_194368 ?auto_194374 ) ) ( not ( = ?auto_194368 ?auto_194375 ) ) ( not ( = ?auto_194368 ?auto_194373 ) ) ( not ( = ?auto_194369 ?auto_194374 ) ) ( not ( = ?auto_194369 ?auto_194375 ) ) ( not ( = ?auto_194369 ?auto_194373 ) ) ( ON ?auto_194369 ?auto_194370 ) ( CLEAR ?auto_194369 ) ( HOLDING ?auto_194368 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194368 )
      ( MAKE-4PILE ?auto_194368 ?auto_194369 ?auto_194370 ?auto_194371 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194376 - BLOCK
      ?auto_194377 - BLOCK
      ?auto_194378 - BLOCK
      ?auto_194379 - BLOCK
    )
    :vars
    (
      ?auto_194383 - BLOCK
      ?auto_194380 - BLOCK
      ?auto_194382 - BLOCK
      ?auto_194381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194376 ?auto_194377 ) ) ( not ( = ?auto_194376 ?auto_194378 ) ) ( not ( = ?auto_194376 ?auto_194379 ) ) ( not ( = ?auto_194377 ?auto_194378 ) ) ( not ( = ?auto_194377 ?auto_194379 ) ) ( not ( = ?auto_194378 ?auto_194379 ) ) ( ON ?auto_194379 ?auto_194383 ) ( not ( = ?auto_194376 ?auto_194383 ) ) ( not ( = ?auto_194377 ?auto_194383 ) ) ( not ( = ?auto_194378 ?auto_194383 ) ) ( not ( = ?auto_194379 ?auto_194383 ) ) ( ON ?auto_194378 ?auto_194379 ) ( ON-TABLE ?auto_194380 ) ( ON ?auto_194382 ?auto_194380 ) ( ON ?auto_194381 ?auto_194382 ) ( ON ?auto_194383 ?auto_194381 ) ( not ( = ?auto_194380 ?auto_194382 ) ) ( not ( = ?auto_194380 ?auto_194381 ) ) ( not ( = ?auto_194380 ?auto_194383 ) ) ( not ( = ?auto_194380 ?auto_194379 ) ) ( not ( = ?auto_194380 ?auto_194378 ) ) ( not ( = ?auto_194382 ?auto_194381 ) ) ( not ( = ?auto_194382 ?auto_194383 ) ) ( not ( = ?auto_194382 ?auto_194379 ) ) ( not ( = ?auto_194382 ?auto_194378 ) ) ( not ( = ?auto_194381 ?auto_194383 ) ) ( not ( = ?auto_194381 ?auto_194379 ) ) ( not ( = ?auto_194381 ?auto_194378 ) ) ( not ( = ?auto_194376 ?auto_194380 ) ) ( not ( = ?auto_194376 ?auto_194382 ) ) ( not ( = ?auto_194376 ?auto_194381 ) ) ( not ( = ?auto_194377 ?auto_194380 ) ) ( not ( = ?auto_194377 ?auto_194382 ) ) ( not ( = ?auto_194377 ?auto_194381 ) ) ( ON ?auto_194377 ?auto_194378 ) ( ON ?auto_194376 ?auto_194377 ) ( CLEAR ?auto_194376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194380 ?auto_194382 ?auto_194381 ?auto_194383 ?auto_194379 ?auto_194378 ?auto_194377 )
      ( MAKE-4PILE ?auto_194376 ?auto_194377 ?auto_194378 ?auto_194379 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194384 - BLOCK
      ?auto_194385 - BLOCK
      ?auto_194386 - BLOCK
      ?auto_194387 - BLOCK
    )
    :vars
    (
      ?auto_194390 - BLOCK
      ?auto_194389 - BLOCK
      ?auto_194388 - BLOCK
      ?auto_194391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194384 ?auto_194385 ) ) ( not ( = ?auto_194384 ?auto_194386 ) ) ( not ( = ?auto_194384 ?auto_194387 ) ) ( not ( = ?auto_194385 ?auto_194386 ) ) ( not ( = ?auto_194385 ?auto_194387 ) ) ( not ( = ?auto_194386 ?auto_194387 ) ) ( ON ?auto_194387 ?auto_194390 ) ( not ( = ?auto_194384 ?auto_194390 ) ) ( not ( = ?auto_194385 ?auto_194390 ) ) ( not ( = ?auto_194386 ?auto_194390 ) ) ( not ( = ?auto_194387 ?auto_194390 ) ) ( ON ?auto_194386 ?auto_194387 ) ( ON-TABLE ?auto_194389 ) ( ON ?auto_194388 ?auto_194389 ) ( ON ?auto_194391 ?auto_194388 ) ( ON ?auto_194390 ?auto_194391 ) ( not ( = ?auto_194389 ?auto_194388 ) ) ( not ( = ?auto_194389 ?auto_194391 ) ) ( not ( = ?auto_194389 ?auto_194390 ) ) ( not ( = ?auto_194389 ?auto_194387 ) ) ( not ( = ?auto_194389 ?auto_194386 ) ) ( not ( = ?auto_194388 ?auto_194391 ) ) ( not ( = ?auto_194388 ?auto_194390 ) ) ( not ( = ?auto_194388 ?auto_194387 ) ) ( not ( = ?auto_194388 ?auto_194386 ) ) ( not ( = ?auto_194391 ?auto_194390 ) ) ( not ( = ?auto_194391 ?auto_194387 ) ) ( not ( = ?auto_194391 ?auto_194386 ) ) ( not ( = ?auto_194384 ?auto_194389 ) ) ( not ( = ?auto_194384 ?auto_194388 ) ) ( not ( = ?auto_194384 ?auto_194391 ) ) ( not ( = ?auto_194385 ?auto_194389 ) ) ( not ( = ?auto_194385 ?auto_194388 ) ) ( not ( = ?auto_194385 ?auto_194391 ) ) ( ON ?auto_194385 ?auto_194386 ) ( HOLDING ?auto_194384 ) ( CLEAR ?auto_194385 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_194389 ?auto_194388 ?auto_194391 ?auto_194390 ?auto_194387 ?auto_194386 ?auto_194385 ?auto_194384 )
      ( MAKE-4PILE ?auto_194384 ?auto_194385 ?auto_194386 ?auto_194387 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194392 - BLOCK
      ?auto_194393 - BLOCK
      ?auto_194394 - BLOCK
      ?auto_194395 - BLOCK
    )
    :vars
    (
      ?auto_194396 - BLOCK
      ?auto_194397 - BLOCK
      ?auto_194399 - BLOCK
      ?auto_194398 - BLOCK
      ?auto_194400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194392 ?auto_194393 ) ) ( not ( = ?auto_194392 ?auto_194394 ) ) ( not ( = ?auto_194392 ?auto_194395 ) ) ( not ( = ?auto_194393 ?auto_194394 ) ) ( not ( = ?auto_194393 ?auto_194395 ) ) ( not ( = ?auto_194394 ?auto_194395 ) ) ( ON ?auto_194395 ?auto_194396 ) ( not ( = ?auto_194392 ?auto_194396 ) ) ( not ( = ?auto_194393 ?auto_194396 ) ) ( not ( = ?auto_194394 ?auto_194396 ) ) ( not ( = ?auto_194395 ?auto_194396 ) ) ( ON ?auto_194394 ?auto_194395 ) ( ON-TABLE ?auto_194397 ) ( ON ?auto_194399 ?auto_194397 ) ( ON ?auto_194398 ?auto_194399 ) ( ON ?auto_194396 ?auto_194398 ) ( not ( = ?auto_194397 ?auto_194399 ) ) ( not ( = ?auto_194397 ?auto_194398 ) ) ( not ( = ?auto_194397 ?auto_194396 ) ) ( not ( = ?auto_194397 ?auto_194395 ) ) ( not ( = ?auto_194397 ?auto_194394 ) ) ( not ( = ?auto_194399 ?auto_194398 ) ) ( not ( = ?auto_194399 ?auto_194396 ) ) ( not ( = ?auto_194399 ?auto_194395 ) ) ( not ( = ?auto_194399 ?auto_194394 ) ) ( not ( = ?auto_194398 ?auto_194396 ) ) ( not ( = ?auto_194398 ?auto_194395 ) ) ( not ( = ?auto_194398 ?auto_194394 ) ) ( not ( = ?auto_194392 ?auto_194397 ) ) ( not ( = ?auto_194392 ?auto_194399 ) ) ( not ( = ?auto_194392 ?auto_194398 ) ) ( not ( = ?auto_194393 ?auto_194397 ) ) ( not ( = ?auto_194393 ?auto_194399 ) ) ( not ( = ?auto_194393 ?auto_194398 ) ) ( ON ?auto_194393 ?auto_194394 ) ( CLEAR ?auto_194393 ) ( ON ?auto_194392 ?auto_194400 ) ( CLEAR ?auto_194392 ) ( HAND-EMPTY ) ( not ( = ?auto_194392 ?auto_194400 ) ) ( not ( = ?auto_194393 ?auto_194400 ) ) ( not ( = ?auto_194394 ?auto_194400 ) ) ( not ( = ?auto_194395 ?auto_194400 ) ) ( not ( = ?auto_194396 ?auto_194400 ) ) ( not ( = ?auto_194397 ?auto_194400 ) ) ( not ( = ?auto_194399 ?auto_194400 ) ) ( not ( = ?auto_194398 ?auto_194400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194392 ?auto_194400 )
      ( MAKE-4PILE ?auto_194392 ?auto_194393 ?auto_194394 ?auto_194395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194401 - BLOCK
      ?auto_194402 - BLOCK
      ?auto_194403 - BLOCK
      ?auto_194404 - BLOCK
    )
    :vars
    (
      ?auto_194406 - BLOCK
      ?auto_194409 - BLOCK
      ?auto_194407 - BLOCK
      ?auto_194408 - BLOCK
      ?auto_194405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194401 ?auto_194402 ) ) ( not ( = ?auto_194401 ?auto_194403 ) ) ( not ( = ?auto_194401 ?auto_194404 ) ) ( not ( = ?auto_194402 ?auto_194403 ) ) ( not ( = ?auto_194402 ?auto_194404 ) ) ( not ( = ?auto_194403 ?auto_194404 ) ) ( ON ?auto_194404 ?auto_194406 ) ( not ( = ?auto_194401 ?auto_194406 ) ) ( not ( = ?auto_194402 ?auto_194406 ) ) ( not ( = ?auto_194403 ?auto_194406 ) ) ( not ( = ?auto_194404 ?auto_194406 ) ) ( ON ?auto_194403 ?auto_194404 ) ( ON-TABLE ?auto_194409 ) ( ON ?auto_194407 ?auto_194409 ) ( ON ?auto_194408 ?auto_194407 ) ( ON ?auto_194406 ?auto_194408 ) ( not ( = ?auto_194409 ?auto_194407 ) ) ( not ( = ?auto_194409 ?auto_194408 ) ) ( not ( = ?auto_194409 ?auto_194406 ) ) ( not ( = ?auto_194409 ?auto_194404 ) ) ( not ( = ?auto_194409 ?auto_194403 ) ) ( not ( = ?auto_194407 ?auto_194408 ) ) ( not ( = ?auto_194407 ?auto_194406 ) ) ( not ( = ?auto_194407 ?auto_194404 ) ) ( not ( = ?auto_194407 ?auto_194403 ) ) ( not ( = ?auto_194408 ?auto_194406 ) ) ( not ( = ?auto_194408 ?auto_194404 ) ) ( not ( = ?auto_194408 ?auto_194403 ) ) ( not ( = ?auto_194401 ?auto_194409 ) ) ( not ( = ?auto_194401 ?auto_194407 ) ) ( not ( = ?auto_194401 ?auto_194408 ) ) ( not ( = ?auto_194402 ?auto_194409 ) ) ( not ( = ?auto_194402 ?auto_194407 ) ) ( not ( = ?auto_194402 ?auto_194408 ) ) ( ON ?auto_194401 ?auto_194405 ) ( CLEAR ?auto_194401 ) ( not ( = ?auto_194401 ?auto_194405 ) ) ( not ( = ?auto_194402 ?auto_194405 ) ) ( not ( = ?auto_194403 ?auto_194405 ) ) ( not ( = ?auto_194404 ?auto_194405 ) ) ( not ( = ?auto_194406 ?auto_194405 ) ) ( not ( = ?auto_194409 ?auto_194405 ) ) ( not ( = ?auto_194407 ?auto_194405 ) ) ( not ( = ?auto_194408 ?auto_194405 ) ) ( HOLDING ?auto_194402 ) ( CLEAR ?auto_194403 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194409 ?auto_194407 ?auto_194408 ?auto_194406 ?auto_194404 ?auto_194403 ?auto_194402 )
      ( MAKE-4PILE ?auto_194401 ?auto_194402 ?auto_194403 ?auto_194404 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194410 - BLOCK
      ?auto_194411 - BLOCK
      ?auto_194412 - BLOCK
      ?auto_194413 - BLOCK
    )
    :vars
    (
      ?auto_194418 - BLOCK
      ?auto_194417 - BLOCK
      ?auto_194414 - BLOCK
      ?auto_194416 - BLOCK
      ?auto_194415 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194410 ?auto_194411 ) ) ( not ( = ?auto_194410 ?auto_194412 ) ) ( not ( = ?auto_194410 ?auto_194413 ) ) ( not ( = ?auto_194411 ?auto_194412 ) ) ( not ( = ?auto_194411 ?auto_194413 ) ) ( not ( = ?auto_194412 ?auto_194413 ) ) ( ON ?auto_194413 ?auto_194418 ) ( not ( = ?auto_194410 ?auto_194418 ) ) ( not ( = ?auto_194411 ?auto_194418 ) ) ( not ( = ?auto_194412 ?auto_194418 ) ) ( not ( = ?auto_194413 ?auto_194418 ) ) ( ON ?auto_194412 ?auto_194413 ) ( ON-TABLE ?auto_194417 ) ( ON ?auto_194414 ?auto_194417 ) ( ON ?auto_194416 ?auto_194414 ) ( ON ?auto_194418 ?auto_194416 ) ( not ( = ?auto_194417 ?auto_194414 ) ) ( not ( = ?auto_194417 ?auto_194416 ) ) ( not ( = ?auto_194417 ?auto_194418 ) ) ( not ( = ?auto_194417 ?auto_194413 ) ) ( not ( = ?auto_194417 ?auto_194412 ) ) ( not ( = ?auto_194414 ?auto_194416 ) ) ( not ( = ?auto_194414 ?auto_194418 ) ) ( not ( = ?auto_194414 ?auto_194413 ) ) ( not ( = ?auto_194414 ?auto_194412 ) ) ( not ( = ?auto_194416 ?auto_194418 ) ) ( not ( = ?auto_194416 ?auto_194413 ) ) ( not ( = ?auto_194416 ?auto_194412 ) ) ( not ( = ?auto_194410 ?auto_194417 ) ) ( not ( = ?auto_194410 ?auto_194414 ) ) ( not ( = ?auto_194410 ?auto_194416 ) ) ( not ( = ?auto_194411 ?auto_194417 ) ) ( not ( = ?auto_194411 ?auto_194414 ) ) ( not ( = ?auto_194411 ?auto_194416 ) ) ( ON ?auto_194410 ?auto_194415 ) ( not ( = ?auto_194410 ?auto_194415 ) ) ( not ( = ?auto_194411 ?auto_194415 ) ) ( not ( = ?auto_194412 ?auto_194415 ) ) ( not ( = ?auto_194413 ?auto_194415 ) ) ( not ( = ?auto_194418 ?auto_194415 ) ) ( not ( = ?auto_194417 ?auto_194415 ) ) ( not ( = ?auto_194414 ?auto_194415 ) ) ( not ( = ?auto_194416 ?auto_194415 ) ) ( CLEAR ?auto_194412 ) ( ON ?auto_194411 ?auto_194410 ) ( CLEAR ?auto_194411 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194415 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194415 ?auto_194410 )
      ( MAKE-4PILE ?auto_194410 ?auto_194411 ?auto_194412 ?auto_194413 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194419 - BLOCK
      ?auto_194420 - BLOCK
      ?auto_194421 - BLOCK
      ?auto_194422 - BLOCK
    )
    :vars
    (
      ?auto_194425 - BLOCK
      ?auto_194424 - BLOCK
      ?auto_194423 - BLOCK
      ?auto_194426 - BLOCK
      ?auto_194427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194419 ?auto_194420 ) ) ( not ( = ?auto_194419 ?auto_194421 ) ) ( not ( = ?auto_194419 ?auto_194422 ) ) ( not ( = ?auto_194420 ?auto_194421 ) ) ( not ( = ?auto_194420 ?auto_194422 ) ) ( not ( = ?auto_194421 ?auto_194422 ) ) ( ON ?auto_194422 ?auto_194425 ) ( not ( = ?auto_194419 ?auto_194425 ) ) ( not ( = ?auto_194420 ?auto_194425 ) ) ( not ( = ?auto_194421 ?auto_194425 ) ) ( not ( = ?auto_194422 ?auto_194425 ) ) ( ON-TABLE ?auto_194424 ) ( ON ?auto_194423 ?auto_194424 ) ( ON ?auto_194426 ?auto_194423 ) ( ON ?auto_194425 ?auto_194426 ) ( not ( = ?auto_194424 ?auto_194423 ) ) ( not ( = ?auto_194424 ?auto_194426 ) ) ( not ( = ?auto_194424 ?auto_194425 ) ) ( not ( = ?auto_194424 ?auto_194422 ) ) ( not ( = ?auto_194424 ?auto_194421 ) ) ( not ( = ?auto_194423 ?auto_194426 ) ) ( not ( = ?auto_194423 ?auto_194425 ) ) ( not ( = ?auto_194423 ?auto_194422 ) ) ( not ( = ?auto_194423 ?auto_194421 ) ) ( not ( = ?auto_194426 ?auto_194425 ) ) ( not ( = ?auto_194426 ?auto_194422 ) ) ( not ( = ?auto_194426 ?auto_194421 ) ) ( not ( = ?auto_194419 ?auto_194424 ) ) ( not ( = ?auto_194419 ?auto_194423 ) ) ( not ( = ?auto_194419 ?auto_194426 ) ) ( not ( = ?auto_194420 ?auto_194424 ) ) ( not ( = ?auto_194420 ?auto_194423 ) ) ( not ( = ?auto_194420 ?auto_194426 ) ) ( ON ?auto_194419 ?auto_194427 ) ( not ( = ?auto_194419 ?auto_194427 ) ) ( not ( = ?auto_194420 ?auto_194427 ) ) ( not ( = ?auto_194421 ?auto_194427 ) ) ( not ( = ?auto_194422 ?auto_194427 ) ) ( not ( = ?auto_194425 ?auto_194427 ) ) ( not ( = ?auto_194424 ?auto_194427 ) ) ( not ( = ?auto_194423 ?auto_194427 ) ) ( not ( = ?auto_194426 ?auto_194427 ) ) ( ON ?auto_194420 ?auto_194419 ) ( CLEAR ?auto_194420 ) ( ON-TABLE ?auto_194427 ) ( HOLDING ?auto_194421 ) ( CLEAR ?auto_194422 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194424 ?auto_194423 ?auto_194426 ?auto_194425 ?auto_194422 ?auto_194421 )
      ( MAKE-4PILE ?auto_194419 ?auto_194420 ?auto_194421 ?auto_194422 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194428 - BLOCK
      ?auto_194429 - BLOCK
      ?auto_194430 - BLOCK
      ?auto_194431 - BLOCK
    )
    :vars
    (
      ?auto_194432 - BLOCK
      ?auto_194434 - BLOCK
      ?auto_194435 - BLOCK
      ?auto_194436 - BLOCK
      ?auto_194433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194428 ?auto_194429 ) ) ( not ( = ?auto_194428 ?auto_194430 ) ) ( not ( = ?auto_194428 ?auto_194431 ) ) ( not ( = ?auto_194429 ?auto_194430 ) ) ( not ( = ?auto_194429 ?auto_194431 ) ) ( not ( = ?auto_194430 ?auto_194431 ) ) ( ON ?auto_194431 ?auto_194432 ) ( not ( = ?auto_194428 ?auto_194432 ) ) ( not ( = ?auto_194429 ?auto_194432 ) ) ( not ( = ?auto_194430 ?auto_194432 ) ) ( not ( = ?auto_194431 ?auto_194432 ) ) ( ON-TABLE ?auto_194434 ) ( ON ?auto_194435 ?auto_194434 ) ( ON ?auto_194436 ?auto_194435 ) ( ON ?auto_194432 ?auto_194436 ) ( not ( = ?auto_194434 ?auto_194435 ) ) ( not ( = ?auto_194434 ?auto_194436 ) ) ( not ( = ?auto_194434 ?auto_194432 ) ) ( not ( = ?auto_194434 ?auto_194431 ) ) ( not ( = ?auto_194434 ?auto_194430 ) ) ( not ( = ?auto_194435 ?auto_194436 ) ) ( not ( = ?auto_194435 ?auto_194432 ) ) ( not ( = ?auto_194435 ?auto_194431 ) ) ( not ( = ?auto_194435 ?auto_194430 ) ) ( not ( = ?auto_194436 ?auto_194432 ) ) ( not ( = ?auto_194436 ?auto_194431 ) ) ( not ( = ?auto_194436 ?auto_194430 ) ) ( not ( = ?auto_194428 ?auto_194434 ) ) ( not ( = ?auto_194428 ?auto_194435 ) ) ( not ( = ?auto_194428 ?auto_194436 ) ) ( not ( = ?auto_194429 ?auto_194434 ) ) ( not ( = ?auto_194429 ?auto_194435 ) ) ( not ( = ?auto_194429 ?auto_194436 ) ) ( ON ?auto_194428 ?auto_194433 ) ( not ( = ?auto_194428 ?auto_194433 ) ) ( not ( = ?auto_194429 ?auto_194433 ) ) ( not ( = ?auto_194430 ?auto_194433 ) ) ( not ( = ?auto_194431 ?auto_194433 ) ) ( not ( = ?auto_194432 ?auto_194433 ) ) ( not ( = ?auto_194434 ?auto_194433 ) ) ( not ( = ?auto_194435 ?auto_194433 ) ) ( not ( = ?auto_194436 ?auto_194433 ) ) ( ON ?auto_194429 ?auto_194428 ) ( ON-TABLE ?auto_194433 ) ( CLEAR ?auto_194431 ) ( ON ?auto_194430 ?auto_194429 ) ( CLEAR ?auto_194430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194433 ?auto_194428 ?auto_194429 )
      ( MAKE-4PILE ?auto_194428 ?auto_194429 ?auto_194430 ?auto_194431 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194437 - BLOCK
      ?auto_194438 - BLOCK
      ?auto_194439 - BLOCK
      ?auto_194440 - BLOCK
    )
    :vars
    (
      ?auto_194441 - BLOCK
      ?auto_194443 - BLOCK
      ?auto_194445 - BLOCK
      ?auto_194444 - BLOCK
      ?auto_194442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194437 ?auto_194438 ) ) ( not ( = ?auto_194437 ?auto_194439 ) ) ( not ( = ?auto_194437 ?auto_194440 ) ) ( not ( = ?auto_194438 ?auto_194439 ) ) ( not ( = ?auto_194438 ?auto_194440 ) ) ( not ( = ?auto_194439 ?auto_194440 ) ) ( not ( = ?auto_194437 ?auto_194441 ) ) ( not ( = ?auto_194438 ?auto_194441 ) ) ( not ( = ?auto_194439 ?auto_194441 ) ) ( not ( = ?auto_194440 ?auto_194441 ) ) ( ON-TABLE ?auto_194443 ) ( ON ?auto_194445 ?auto_194443 ) ( ON ?auto_194444 ?auto_194445 ) ( ON ?auto_194441 ?auto_194444 ) ( not ( = ?auto_194443 ?auto_194445 ) ) ( not ( = ?auto_194443 ?auto_194444 ) ) ( not ( = ?auto_194443 ?auto_194441 ) ) ( not ( = ?auto_194443 ?auto_194440 ) ) ( not ( = ?auto_194443 ?auto_194439 ) ) ( not ( = ?auto_194445 ?auto_194444 ) ) ( not ( = ?auto_194445 ?auto_194441 ) ) ( not ( = ?auto_194445 ?auto_194440 ) ) ( not ( = ?auto_194445 ?auto_194439 ) ) ( not ( = ?auto_194444 ?auto_194441 ) ) ( not ( = ?auto_194444 ?auto_194440 ) ) ( not ( = ?auto_194444 ?auto_194439 ) ) ( not ( = ?auto_194437 ?auto_194443 ) ) ( not ( = ?auto_194437 ?auto_194445 ) ) ( not ( = ?auto_194437 ?auto_194444 ) ) ( not ( = ?auto_194438 ?auto_194443 ) ) ( not ( = ?auto_194438 ?auto_194445 ) ) ( not ( = ?auto_194438 ?auto_194444 ) ) ( ON ?auto_194437 ?auto_194442 ) ( not ( = ?auto_194437 ?auto_194442 ) ) ( not ( = ?auto_194438 ?auto_194442 ) ) ( not ( = ?auto_194439 ?auto_194442 ) ) ( not ( = ?auto_194440 ?auto_194442 ) ) ( not ( = ?auto_194441 ?auto_194442 ) ) ( not ( = ?auto_194443 ?auto_194442 ) ) ( not ( = ?auto_194445 ?auto_194442 ) ) ( not ( = ?auto_194444 ?auto_194442 ) ) ( ON ?auto_194438 ?auto_194437 ) ( ON-TABLE ?auto_194442 ) ( ON ?auto_194439 ?auto_194438 ) ( CLEAR ?auto_194439 ) ( HOLDING ?auto_194440 ) ( CLEAR ?auto_194441 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194443 ?auto_194445 ?auto_194444 ?auto_194441 ?auto_194440 )
      ( MAKE-4PILE ?auto_194437 ?auto_194438 ?auto_194439 ?auto_194440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194446 - BLOCK
      ?auto_194447 - BLOCK
      ?auto_194448 - BLOCK
      ?auto_194449 - BLOCK
    )
    :vars
    (
      ?auto_194454 - BLOCK
      ?auto_194450 - BLOCK
      ?auto_194452 - BLOCK
      ?auto_194453 - BLOCK
      ?auto_194451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194446 ?auto_194447 ) ) ( not ( = ?auto_194446 ?auto_194448 ) ) ( not ( = ?auto_194446 ?auto_194449 ) ) ( not ( = ?auto_194447 ?auto_194448 ) ) ( not ( = ?auto_194447 ?auto_194449 ) ) ( not ( = ?auto_194448 ?auto_194449 ) ) ( not ( = ?auto_194446 ?auto_194454 ) ) ( not ( = ?auto_194447 ?auto_194454 ) ) ( not ( = ?auto_194448 ?auto_194454 ) ) ( not ( = ?auto_194449 ?auto_194454 ) ) ( ON-TABLE ?auto_194450 ) ( ON ?auto_194452 ?auto_194450 ) ( ON ?auto_194453 ?auto_194452 ) ( ON ?auto_194454 ?auto_194453 ) ( not ( = ?auto_194450 ?auto_194452 ) ) ( not ( = ?auto_194450 ?auto_194453 ) ) ( not ( = ?auto_194450 ?auto_194454 ) ) ( not ( = ?auto_194450 ?auto_194449 ) ) ( not ( = ?auto_194450 ?auto_194448 ) ) ( not ( = ?auto_194452 ?auto_194453 ) ) ( not ( = ?auto_194452 ?auto_194454 ) ) ( not ( = ?auto_194452 ?auto_194449 ) ) ( not ( = ?auto_194452 ?auto_194448 ) ) ( not ( = ?auto_194453 ?auto_194454 ) ) ( not ( = ?auto_194453 ?auto_194449 ) ) ( not ( = ?auto_194453 ?auto_194448 ) ) ( not ( = ?auto_194446 ?auto_194450 ) ) ( not ( = ?auto_194446 ?auto_194452 ) ) ( not ( = ?auto_194446 ?auto_194453 ) ) ( not ( = ?auto_194447 ?auto_194450 ) ) ( not ( = ?auto_194447 ?auto_194452 ) ) ( not ( = ?auto_194447 ?auto_194453 ) ) ( ON ?auto_194446 ?auto_194451 ) ( not ( = ?auto_194446 ?auto_194451 ) ) ( not ( = ?auto_194447 ?auto_194451 ) ) ( not ( = ?auto_194448 ?auto_194451 ) ) ( not ( = ?auto_194449 ?auto_194451 ) ) ( not ( = ?auto_194454 ?auto_194451 ) ) ( not ( = ?auto_194450 ?auto_194451 ) ) ( not ( = ?auto_194452 ?auto_194451 ) ) ( not ( = ?auto_194453 ?auto_194451 ) ) ( ON ?auto_194447 ?auto_194446 ) ( ON-TABLE ?auto_194451 ) ( ON ?auto_194448 ?auto_194447 ) ( CLEAR ?auto_194454 ) ( ON ?auto_194449 ?auto_194448 ) ( CLEAR ?auto_194449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194451 ?auto_194446 ?auto_194447 ?auto_194448 )
      ( MAKE-4PILE ?auto_194446 ?auto_194447 ?auto_194448 ?auto_194449 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194455 - BLOCK
      ?auto_194456 - BLOCK
      ?auto_194457 - BLOCK
      ?auto_194458 - BLOCK
    )
    :vars
    (
      ?auto_194461 - BLOCK
      ?auto_194459 - BLOCK
      ?auto_194460 - BLOCK
      ?auto_194463 - BLOCK
      ?auto_194462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194455 ?auto_194456 ) ) ( not ( = ?auto_194455 ?auto_194457 ) ) ( not ( = ?auto_194455 ?auto_194458 ) ) ( not ( = ?auto_194456 ?auto_194457 ) ) ( not ( = ?auto_194456 ?auto_194458 ) ) ( not ( = ?auto_194457 ?auto_194458 ) ) ( not ( = ?auto_194455 ?auto_194461 ) ) ( not ( = ?auto_194456 ?auto_194461 ) ) ( not ( = ?auto_194457 ?auto_194461 ) ) ( not ( = ?auto_194458 ?auto_194461 ) ) ( ON-TABLE ?auto_194459 ) ( ON ?auto_194460 ?auto_194459 ) ( ON ?auto_194463 ?auto_194460 ) ( not ( = ?auto_194459 ?auto_194460 ) ) ( not ( = ?auto_194459 ?auto_194463 ) ) ( not ( = ?auto_194459 ?auto_194461 ) ) ( not ( = ?auto_194459 ?auto_194458 ) ) ( not ( = ?auto_194459 ?auto_194457 ) ) ( not ( = ?auto_194460 ?auto_194463 ) ) ( not ( = ?auto_194460 ?auto_194461 ) ) ( not ( = ?auto_194460 ?auto_194458 ) ) ( not ( = ?auto_194460 ?auto_194457 ) ) ( not ( = ?auto_194463 ?auto_194461 ) ) ( not ( = ?auto_194463 ?auto_194458 ) ) ( not ( = ?auto_194463 ?auto_194457 ) ) ( not ( = ?auto_194455 ?auto_194459 ) ) ( not ( = ?auto_194455 ?auto_194460 ) ) ( not ( = ?auto_194455 ?auto_194463 ) ) ( not ( = ?auto_194456 ?auto_194459 ) ) ( not ( = ?auto_194456 ?auto_194460 ) ) ( not ( = ?auto_194456 ?auto_194463 ) ) ( ON ?auto_194455 ?auto_194462 ) ( not ( = ?auto_194455 ?auto_194462 ) ) ( not ( = ?auto_194456 ?auto_194462 ) ) ( not ( = ?auto_194457 ?auto_194462 ) ) ( not ( = ?auto_194458 ?auto_194462 ) ) ( not ( = ?auto_194461 ?auto_194462 ) ) ( not ( = ?auto_194459 ?auto_194462 ) ) ( not ( = ?auto_194460 ?auto_194462 ) ) ( not ( = ?auto_194463 ?auto_194462 ) ) ( ON ?auto_194456 ?auto_194455 ) ( ON-TABLE ?auto_194462 ) ( ON ?auto_194457 ?auto_194456 ) ( ON ?auto_194458 ?auto_194457 ) ( CLEAR ?auto_194458 ) ( HOLDING ?auto_194461 ) ( CLEAR ?auto_194463 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194459 ?auto_194460 ?auto_194463 ?auto_194461 )
      ( MAKE-4PILE ?auto_194455 ?auto_194456 ?auto_194457 ?auto_194458 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194464 - BLOCK
      ?auto_194465 - BLOCK
      ?auto_194466 - BLOCK
      ?auto_194467 - BLOCK
    )
    :vars
    (
      ?auto_194468 - BLOCK
      ?auto_194472 - BLOCK
      ?auto_194470 - BLOCK
      ?auto_194471 - BLOCK
      ?auto_194469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194464 ?auto_194465 ) ) ( not ( = ?auto_194464 ?auto_194466 ) ) ( not ( = ?auto_194464 ?auto_194467 ) ) ( not ( = ?auto_194465 ?auto_194466 ) ) ( not ( = ?auto_194465 ?auto_194467 ) ) ( not ( = ?auto_194466 ?auto_194467 ) ) ( not ( = ?auto_194464 ?auto_194468 ) ) ( not ( = ?auto_194465 ?auto_194468 ) ) ( not ( = ?auto_194466 ?auto_194468 ) ) ( not ( = ?auto_194467 ?auto_194468 ) ) ( ON-TABLE ?auto_194472 ) ( ON ?auto_194470 ?auto_194472 ) ( ON ?auto_194471 ?auto_194470 ) ( not ( = ?auto_194472 ?auto_194470 ) ) ( not ( = ?auto_194472 ?auto_194471 ) ) ( not ( = ?auto_194472 ?auto_194468 ) ) ( not ( = ?auto_194472 ?auto_194467 ) ) ( not ( = ?auto_194472 ?auto_194466 ) ) ( not ( = ?auto_194470 ?auto_194471 ) ) ( not ( = ?auto_194470 ?auto_194468 ) ) ( not ( = ?auto_194470 ?auto_194467 ) ) ( not ( = ?auto_194470 ?auto_194466 ) ) ( not ( = ?auto_194471 ?auto_194468 ) ) ( not ( = ?auto_194471 ?auto_194467 ) ) ( not ( = ?auto_194471 ?auto_194466 ) ) ( not ( = ?auto_194464 ?auto_194472 ) ) ( not ( = ?auto_194464 ?auto_194470 ) ) ( not ( = ?auto_194464 ?auto_194471 ) ) ( not ( = ?auto_194465 ?auto_194472 ) ) ( not ( = ?auto_194465 ?auto_194470 ) ) ( not ( = ?auto_194465 ?auto_194471 ) ) ( ON ?auto_194464 ?auto_194469 ) ( not ( = ?auto_194464 ?auto_194469 ) ) ( not ( = ?auto_194465 ?auto_194469 ) ) ( not ( = ?auto_194466 ?auto_194469 ) ) ( not ( = ?auto_194467 ?auto_194469 ) ) ( not ( = ?auto_194468 ?auto_194469 ) ) ( not ( = ?auto_194472 ?auto_194469 ) ) ( not ( = ?auto_194470 ?auto_194469 ) ) ( not ( = ?auto_194471 ?auto_194469 ) ) ( ON ?auto_194465 ?auto_194464 ) ( ON-TABLE ?auto_194469 ) ( ON ?auto_194466 ?auto_194465 ) ( ON ?auto_194467 ?auto_194466 ) ( CLEAR ?auto_194471 ) ( ON ?auto_194468 ?auto_194467 ) ( CLEAR ?auto_194468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194469 ?auto_194464 ?auto_194465 ?auto_194466 ?auto_194467 )
      ( MAKE-4PILE ?auto_194464 ?auto_194465 ?auto_194466 ?auto_194467 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194473 - BLOCK
      ?auto_194474 - BLOCK
      ?auto_194475 - BLOCK
      ?auto_194476 - BLOCK
    )
    :vars
    (
      ?auto_194480 - BLOCK
      ?auto_194479 - BLOCK
      ?auto_194478 - BLOCK
      ?auto_194477 - BLOCK
      ?auto_194481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194473 ?auto_194474 ) ) ( not ( = ?auto_194473 ?auto_194475 ) ) ( not ( = ?auto_194473 ?auto_194476 ) ) ( not ( = ?auto_194474 ?auto_194475 ) ) ( not ( = ?auto_194474 ?auto_194476 ) ) ( not ( = ?auto_194475 ?auto_194476 ) ) ( not ( = ?auto_194473 ?auto_194480 ) ) ( not ( = ?auto_194474 ?auto_194480 ) ) ( not ( = ?auto_194475 ?auto_194480 ) ) ( not ( = ?auto_194476 ?auto_194480 ) ) ( ON-TABLE ?auto_194479 ) ( ON ?auto_194478 ?auto_194479 ) ( not ( = ?auto_194479 ?auto_194478 ) ) ( not ( = ?auto_194479 ?auto_194477 ) ) ( not ( = ?auto_194479 ?auto_194480 ) ) ( not ( = ?auto_194479 ?auto_194476 ) ) ( not ( = ?auto_194479 ?auto_194475 ) ) ( not ( = ?auto_194478 ?auto_194477 ) ) ( not ( = ?auto_194478 ?auto_194480 ) ) ( not ( = ?auto_194478 ?auto_194476 ) ) ( not ( = ?auto_194478 ?auto_194475 ) ) ( not ( = ?auto_194477 ?auto_194480 ) ) ( not ( = ?auto_194477 ?auto_194476 ) ) ( not ( = ?auto_194477 ?auto_194475 ) ) ( not ( = ?auto_194473 ?auto_194479 ) ) ( not ( = ?auto_194473 ?auto_194478 ) ) ( not ( = ?auto_194473 ?auto_194477 ) ) ( not ( = ?auto_194474 ?auto_194479 ) ) ( not ( = ?auto_194474 ?auto_194478 ) ) ( not ( = ?auto_194474 ?auto_194477 ) ) ( ON ?auto_194473 ?auto_194481 ) ( not ( = ?auto_194473 ?auto_194481 ) ) ( not ( = ?auto_194474 ?auto_194481 ) ) ( not ( = ?auto_194475 ?auto_194481 ) ) ( not ( = ?auto_194476 ?auto_194481 ) ) ( not ( = ?auto_194480 ?auto_194481 ) ) ( not ( = ?auto_194479 ?auto_194481 ) ) ( not ( = ?auto_194478 ?auto_194481 ) ) ( not ( = ?auto_194477 ?auto_194481 ) ) ( ON ?auto_194474 ?auto_194473 ) ( ON-TABLE ?auto_194481 ) ( ON ?auto_194475 ?auto_194474 ) ( ON ?auto_194476 ?auto_194475 ) ( ON ?auto_194480 ?auto_194476 ) ( CLEAR ?auto_194480 ) ( HOLDING ?auto_194477 ) ( CLEAR ?auto_194478 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194479 ?auto_194478 ?auto_194477 )
      ( MAKE-4PILE ?auto_194473 ?auto_194474 ?auto_194475 ?auto_194476 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194482 - BLOCK
      ?auto_194483 - BLOCK
      ?auto_194484 - BLOCK
      ?auto_194485 - BLOCK
    )
    :vars
    (
      ?auto_194488 - BLOCK
      ?auto_194490 - BLOCK
      ?auto_194487 - BLOCK
      ?auto_194486 - BLOCK
      ?auto_194489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194482 ?auto_194483 ) ) ( not ( = ?auto_194482 ?auto_194484 ) ) ( not ( = ?auto_194482 ?auto_194485 ) ) ( not ( = ?auto_194483 ?auto_194484 ) ) ( not ( = ?auto_194483 ?auto_194485 ) ) ( not ( = ?auto_194484 ?auto_194485 ) ) ( not ( = ?auto_194482 ?auto_194488 ) ) ( not ( = ?auto_194483 ?auto_194488 ) ) ( not ( = ?auto_194484 ?auto_194488 ) ) ( not ( = ?auto_194485 ?auto_194488 ) ) ( ON-TABLE ?auto_194490 ) ( ON ?auto_194487 ?auto_194490 ) ( not ( = ?auto_194490 ?auto_194487 ) ) ( not ( = ?auto_194490 ?auto_194486 ) ) ( not ( = ?auto_194490 ?auto_194488 ) ) ( not ( = ?auto_194490 ?auto_194485 ) ) ( not ( = ?auto_194490 ?auto_194484 ) ) ( not ( = ?auto_194487 ?auto_194486 ) ) ( not ( = ?auto_194487 ?auto_194488 ) ) ( not ( = ?auto_194487 ?auto_194485 ) ) ( not ( = ?auto_194487 ?auto_194484 ) ) ( not ( = ?auto_194486 ?auto_194488 ) ) ( not ( = ?auto_194486 ?auto_194485 ) ) ( not ( = ?auto_194486 ?auto_194484 ) ) ( not ( = ?auto_194482 ?auto_194490 ) ) ( not ( = ?auto_194482 ?auto_194487 ) ) ( not ( = ?auto_194482 ?auto_194486 ) ) ( not ( = ?auto_194483 ?auto_194490 ) ) ( not ( = ?auto_194483 ?auto_194487 ) ) ( not ( = ?auto_194483 ?auto_194486 ) ) ( ON ?auto_194482 ?auto_194489 ) ( not ( = ?auto_194482 ?auto_194489 ) ) ( not ( = ?auto_194483 ?auto_194489 ) ) ( not ( = ?auto_194484 ?auto_194489 ) ) ( not ( = ?auto_194485 ?auto_194489 ) ) ( not ( = ?auto_194488 ?auto_194489 ) ) ( not ( = ?auto_194490 ?auto_194489 ) ) ( not ( = ?auto_194487 ?auto_194489 ) ) ( not ( = ?auto_194486 ?auto_194489 ) ) ( ON ?auto_194483 ?auto_194482 ) ( ON-TABLE ?auto_194489 ) ( ON ?auto_194484 ?auto_194483 ) ( ON ?auto_194485 ?auto_194484 ) ( ON ?auto_194488 ?auto_194485 ) ( CLEAR ?auto_194487 ) ( ON ?auto_194486 ?auto_194488 ) ( CLEAR ?auto_194486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194489 ?auto_194482 ?auto_194483 ?auto_194484 ?auto_194485 ?auto_194488 )
      ( MAKE-4PILE ?auto_194482 ?auto_194483 ?auto_194484 ?auto_194485 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194491 - BLOCK
      ?auto_194492 - BLOCK
      ?auto_194493 - BLOCK
      ?auto_194494 - BLOCK
    )
    :vars
    (
      ?auto_194496 - BLOCK
      ?auto_194497 - BLOCK
      ?auto_194499 - BLOCK
      ?auto_194495 - BLOCK
      ?auto_194498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194491 ?auto_194492 ) ) ( not ( = ?auto_194491 ?auto_194493 ) ) ( not ( = ?auto_194491 ?auto_194494 ) ) ( not ( = ?auto_194492 ?auto_194493 ) ) ( not ( = ?auto_194492 ?auto_194494 ) ) ( not ( = ?auto_194493 ?auto_194494 ) ) ( not ( = ?auto_194491 ?auto_194496 ) ) ( not ( = ?auto_194492 ?auto_194496 ) ) ( not ( = ?auto_194493 ?auto_194496 ) ) ( not ( = ?auto_194494 ?auto_194496 ) ) ( ON-TABLE ?auto_194497 ) ( not ( = ?auto_194497 ?auto_194499 ) ) ( not ( = ?auto_194497 ?auto_194495 ) ) ( not ( = ?auto_194497 ?auto_194496 ) ) ( not ( = ?auto_194497 ?auto_194494 ) ) ( not ( = ?auto_194497 ?auto_194493 ) ) ( not ( = ?auto_194499 ?auto_194495 ) ) ( not ( = ?auto_194499 ?auto_194496 ) ) ( not ( = ?auto_194499 ?auto_194494 ) ) ( not ( = ?auto_194499 ?auto_194493 ) ) ( not ( = ?auto_194495 ?auto_194496 ) ) ( not ( = ?auto_194495 ?auto_194494 ) ) ( not ( = ?auto_194495 ?auto_194493 ) ) ( not ( = ?auto_194491 ?auto_194497 ) ) ( not ( = ?auto_194491 ?auto_194499 ) ) ( not ( = ?auto_194491 ?auto_194495 ) ) ( not ( = ?auto_194492 ?auto_194497 ) ) ( not ( = ?auto_194492 ?auto_194499 ) ) ( not ( = ?auto_194492 ?auto_194495 ) ) ( ON ?auto_194491 ?auto_194498 ) ( not ( = ?auto_194491 ?auto_194498 ) ) ( not ( = ?auto_194492 ?auto_194498 ) ) ( not ( = ?auto_194493 ?auto_194498 ) ) ( not ( = ?auto_194494 ?auto_194498 ) ) ( not ( = ?auto_194496 ?auto_194498 ) ) ( not ( = ?auto_194497 ?auto_194498 ) ) ( not ( = ?auto_194499 ?auto_194498 ) ) ( not ( = ?auto_194495 ?auto_194498 ) ) ( ON ?auto_194492 ?auto_194491 ) ( ON-TABLE ?auto_194498 ) ( ON ?auto_194493 ?auto_194492 ) ( ON ?auto_194494 ?auto_194493 ) ( ON ?auto_194496 ?auto_194494 ) ( ON ?auto_194495 ?auto_194496 ) ( CLEAR ?auto_194495 ) ( HOLDING ?auto_194499 ) ( CLEAR ?auto_194497 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194497 ?auto_194499 )
      ( MAKE-4PILE ?auto_194491 ?auto_194492 ?auto_194493 ?auto_194494 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194500 - BLOCK
      ?auto_194501 - BLOCK
      ?auto_194502 - BLOCK
      ?auto_194503 - BLOCK
    )
    :vars
    (
      ?auto_194505 - BLOCK
      ?auto_194506 - BLOCK
      ?auto_194508 - BLOCK
      ?auto_194507 - BLOCK
      ?auto_194504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194500 ?auto_194501 ) ) ( not ( = ?auto_194500 ?auto_194502 ) ) ( not ( = ?auto_194500 ?auto_194503 ) ) ( not ( = ?auto_194501 ?auto_194502 ) ) ( not ( = ?auto_194501 ?auto_194503 ) ) ( not ( = ?auto_194502 ?auto_194503 ) ) ( not ( = ?auto_194500 ?auto_194505 ) ) ( not ( = ?auto_194501 ?auto_194505 ) ) ( not ( = ?auto_194502 ?auto_194505 ) ) ( not ( = ?auto_194503 ?auto_194505 ) ) ( ON-TABLE ?auto_194506 ) ( not ( = ?auto_194506 ?auto_194508 ) ) ( not ( = ?auto_194506 ?auto_194507 ) ) ( not ( = ?auto_194506 ?auto_194505 ) ) ( not ( = ?auto_194506 ?auto_194503 ) ) ( not ( = ?auto_194506 ?auto_194502 ) ) ( not ( = ?auto_194508 ?auto_194507 ) ) ( not ( = ?auto_194508 ?auto_194505 ) ) ( not ( = ?auto_194508 ?auto_194503 ) ) ( not ( = ?auto_194508 ?auto_194502 ) ) ( not ( = ?auto_194507 ?auto_194505 ) ) ( not ( = ?auto_194507 ?auto_194503 ) ) ( not ( = ?auto_194507 ?auto_194502 ) ) ( not ( = ?auto_194500 ?auto_194506 ) ) ( not ( = ?auto_194500 ?auto_194508 ) ) ( not ( = ?auto_194500 ?auto_194507 ) ) ( not ( = ?auto_194501 ?auto_194506 ) ) ( not ( = ?auto_194501 ?auto_194508 ) ) ( not ( = ?auto_194501 ?auto_194507 ) ) ( ON ?auto_194500 ?auto_194504 ) ( not ( = ?auto_194500 ?auto_194504 ) ) ( not ( = ?auto_194501 ?auto_194504 ) ) ( not ( = ?auto_194502 ?auto_194504 ) ) ( not ( = ?auto_194503 ?auto_194504 ) ) ( not ( = ?auto_194505 ?auto_194504 ) ) ( not ( = ?auto_194506 ?auto_194504 ) ) ( not ( = ?auto_194508 ?auto_194504 ) ) ( not ( = ?auto_194507 ?auto_194504 ) ) ( ON ?auto_194501 ?auto_194500 ) ( ON-TABLE ?auto_194504 ) ( ON ?auto_194502 ?auto_194501 ) ( ON ?auto_194503 ?auto_194502 ) ( ON ?auto_194505 ?auto_194503 ) ( ON ?auto_194507 ?auto_194505 ) ( CLEAR ?auto_194506 ) ( ON ?auto_194508 ?auto_194507 ) ( CLEAR ?auto_194508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194504 ?auto_194500 ?auto_194501 ?auto_194502 ?auto_194503 ?auto_194505 ?auto_194507 )
      ( MAKE-4PILE ?auto_194500 ?auto_194501 ?auto_194502 ?auto_194503 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194509 - BLOCK
      ?auto_194510 - BLOCK
      ?auto_194511 - BLOCK
      ?auto_194512 - BLOCK
    )
    :vars
    (
      ?auto_194513 - BLOCK
      ?auto_194515 - BLOCK
      ?auto_194514 - BLOCK
      ?auto_194516 - BLOCK
      ?auto_194517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194509 ?auto_194510 ) ) ( not ( = ?auto_194509 ?auto_194511 ) ) ( not ( = ?auto_194509 ?auto_194512 ) ) ( not ( = ?auto_194510 ?auto_194511 ) ) ( not ( = ?auto_194510 ?auto_194512 ) ) ( not ( = ?auto_194511 ?auto_194512 ) ) ( not ( = ?auto_194509 ?auto_194513 ) ) ( not ( = ?auto_194510 ?auto_194513 ) ) ( not ( = ?auto_194511 ?auto_194513 ) ) ( not ( = ?auto_194512 ?auto_194513 ) ) ( not ( = ?auto_194515 ?auto_194514 ) ) ( not ( = ?auto_194515 ?auto_194516 ) ) ( not ( = ?auto_194515 ?auto_194513 ) ) ( not ( = ?auto_194515 ?auto_194512 ) ) ( not ( = ?auto_194515 ?auto_194511 ) ) ( not ( = ?auto_194514 ?auto_194516 ) ) ( not ( = ?auto_194514 ?auto_194513 ) ) ( not ( = ?auto_194514 ?auto_194512 ) ) ( not ( = ?auto_194514 ?auto_194511 ) ) ( not ( = ?auto_194516 ?auto_194513 ) ) ( not ( = ?auto_194516 ?auto_194512 ) ) ( not ( = ?auto_194516 ?auto_194511 ) ) ( not ( = ?auto_194509 ?auto_194515 ) ) ( not ( = ?auto_194509 ?auto_194514 ) ) ( not ( = ?auto_194509 ?auto_194516 ) ) ( not ( = ?auto_194510 ?auto_194515 ) ) ( not ( = ?auto_194510 ?auto_194514 ) ) ( not ( = ?auto_194510 ?auto_194516 ) ) ( ON ?auto_194509 ?auto_194517 ) ( not ( = ?auto_194509 ?auto_194517 ) ) ( not ( = ?auto_194510 ?auto_194517 ) ) ( not ( = ?auto_194511 ?auto_194517 ) ) ( not ( = ?auto_194512 ?auto_194517 ) ) ( not ( = ?auto_194513 ?auto_194517 ) ) ( not ( = ?auto_194515 ?auto_194517 ) ) ( not ( = ?auto_194514 ?auto_194517 ) ) ( not ( = ?auto_194516 ?auto_194517 ) ) ( ON ?auto_194510 ?auto_194509 ) ( ON-TABLE ?auto_194517 ) ( ON ?auto_194511 ?auto_194510 ) ( ON ?auto_194512 ?auto_194511 ) ( ON ?auto_194513 ?auto_194512 ) ( ON ?auto_194516 ?auto_194513 ) ( ON ?auto_194514 ?auto_194516 ) ( CLEAR ?auto_194514 ) ( HOLDING ?auto_194515 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194515 )
      ( MAKE-4PILE ?auto_194509 ?auto_194510 ?auto_194511 ?auto_194512 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_194518 - BLOCK
      ?auto_194519 - BLOCK
      ?auto_194520 - BLOCK
      ?auto_194521 - BLOCK
    )
    :vars
    (
      ?auto_194522 - BLOCK
      ?auto_194523 - BLOCK
      ?auto_194524 - BLOCK
      ?auto_194525 - BLOCK
      ?auto_194526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194518 ?auto_194519 ) ) ( not ( = ?auto_194518 ?auto_194520 ) ) ( not ( = ?auto_194518 ?auto_194521 ) ) ( not ( = ?auto_194519 ?auto_194520 ) ) ( not ( = ?auto_194519 ?auto_194521 ) ) ( not ( = ?auto_194520 ?auto_194521 ) ) ( not ( = ?auto_194518 ?auto_194522 ) ) ( not ( = ?auto_194519 ?auto_194522 ) ) ( not ( = ?auto_194520 ?auto_194522 ) ) ( not ( = ?auto_194521 ?auto_194522 ) ) ( not ( = ?auto_194523 ?auto_194524 ) ) ( not ( = ?auto_194523 ?auto_194525 ) ) ( not ( = ?auto_194523 ?auto_194522 ) ) ( not ( = ?auto_194523 ?auto_194521 ) ) ( not ( = ?auto_194523 ?auto_194520 ) ) ( not ( = ?auto_194524 ?auto_194525 ) ) ( not ( = ?auto_194524 ?auto_194522 ) ) ( not ( = ?auto_194524 ?auto_194521 ) ) ( not ( = ?auto_194524 ?auto_194520 ) ) ( not ( = ?auto_194525 ?auto_194522 ) ) ( not ( = ?auto_194525 ?auto_194521 ) ) ( not ( = ?auto_194525 ?auto_194520 ) ) ( not ( = ?auto_194518 ?auto_194523 ) ) ( not ( = ?auto_194518 ?auto_194524 ) ) ( not ( = ?auto_194518 ?auto_194525 ) ) ( not ( = ?auto_194519 ?auto_194523 ) ) ( not ( = ?auto_194519 ?auto_194524 ) ) ( not ( = ?auto_194519 ?auto_194525 ) ) ( ON ?auto_194518 ?auto_194526 ) ( not ( = ?auto_194518 ?auto_194526 ) ) ( not ( = ?auto_194519 ?auto_194526 ) ) ( not ( = ?auto_194520 ?auto_194526 ) ) ( not ( = ?auto_194521 ?auto_194526 ) ) ( not ( = ?auto_194522 ?auto_194526 ) ) ( not ( = ?auto_194523 ?auto_194526 ) ) ( not ( = ?auto_194524 ?auto_194526 ) ) ( not ( = ?auto_194525 ?auto_194526 ) ) ( ON ?auto_194519 ?auto_194518 ) ( ON-TABLE ?auto_194526 ) ( ON ?auto_194520 ?auto_194519 ) ( ON ?auto_194521 ?auto_194520 ) ( ON ?auto_194522 ?auto_194521 ) ( ON ?auto_194525 ?auto_194522 ) ( ON ?auto_194524 ?auto_194525 ) ( ON ?auto_194523 ?auto_194524 ) ( CLEAR ?auto_194523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_194526 ?auto_194518 ?auto_194519 ?auto_194520 ?auto_194521 ?auto_194522 ?auto_194525 ?auto_194524 )
      ( MAKE-4PILE ?auto_194518 ?auto_194519 ?auto_194520 ?auto_194521 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194530 - BLOCK
      ?auto_194531 - BLOCK
      ?auto_194532 - BLOCK
    )
    :vars
    (
      ?auto_194533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194533 ?auto_194532 ) ( CLEAR ?auto_194533 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194530 ) ( ON ?auto_194531 ?auto_194530 ) ( ON ?auto_194532 ?auto_194531 ) ( not ( = ?auto_194530 ?auto_194531 ) ) ( not ( = ?auto_194530 ?auto_194532 ) ) ( not ( = ?auto_194530 ?auto_194533 ) ) ( not ( = ?auto_194531 ?auto_194532 ) ) ( not ( = ?auto_194531 ?auto_194533 ) ) ( not ( = ?auto_194532 ?auto_194533 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194533 ?auto_194532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194534 - BLOCK
      ?auto_194535 - BLOCK
      ?auto_194536 - BLOCK
    )
    :vars
    (
      ?auto_194537 - BLOCK
      ?auto_194538 - BLOCK
      ?auto_194539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194537 ?auto_194536 ) ( CLEAR ?auto_194537 ) ( ON-TABLE ?auto_194534 ) ( ON ?auto_194535 ?auto_194534 ) ( ON ?auto_194536 ?auto_194535 ) ( not ( = ?auto_194534 ?auto_194535 ) ) ( not ( = ?auto_194534 ?auto_194536 ) ) ( not ( = ?auto_194534 ?auto_194537 ) ) ( not ( = ?auto_194535 ?auto_194536 ) ) ( not ( = ?auto_194535 ?auto_194537 ) ) ( not ( = ?auto_194536 ?auto_194537 ) ) ( HOLDING ?auto_194538 ) ( CLEAR ?auto_194539 ) ( not ( = ?auto_194534 ?auto_194538 ) ) ( not ( = ?auto_194534 ?auto_194539 ) ) ( not ( = ?auto_194535 ?auto_194538 ) ) ( not ( = ?auto_194535 ?auto_194539 ) ) ( not ( = ?auto_194536 ?auto_194538 ) ) ( not ( = ?auto_194536 ?auto_194539 ) ) ( not ( = ?auto_194537 ?auto_194538 ) ) ( not ( = ?auto_194537 ?auto_194539 ) ) ( not ( = ?auto_194538 ?auto_194539 ) ) )
    :subtasks
    ( ( !STACK ?auto_194538 ?auto_194539 )
      ( MAKE-3PILE ?auto_194534 ?auto_194535 ?auto_194536 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194540 - BLOCK
      ?auto_194541 - BLOCK
      ?auto_194542 - BLOCK
    )
    :vars
    (
      ?auto_194544 - BLOCK
      ?auto_194543 - BLOCK
      ?auto_194545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194544 ?auto_194542 ) ( ON-TABLE ?auto_194540 ) ( ON ?auto_194541 ?auto_194540 ) ( ON ?auto_194542 ?auto_194541 ) ( not ( = ?auto_194540 ?auto_194541 ) ) ( not ( = ?auto_194540 ?auto_194542 ) ) ( not ( = ?auto_194540 ?auto_194544 ) ) ( not ( = ?auto_194541 ?auto_194542 ) ) ( not ( = ?auto_194541 ?auto_194544 ) ) ( not ( = ?auto_194542 ?auto_194544 ) ) ( CLEAR ?auto_194543 ) ( not ( = ?auto_194540 ?auto_194545 ) ) ( not ( = ?auto_194540 ?auto_194543 ) ) ( not ( = ?auto_194541 ?auto_194545 ) ) ( not ( = ?auto_194541 ?auto_194543 ) ) ( not ( = ?auto_194542 ?auto_194545 ) ) ( not ( = ?auto_194542 ?auto_194543 ) ) ( not ( = ?auto_194544 ?auto_194545 ) ) ( not ( = ?auto_194544 ?auto_194543 ) ) ( not ( = ?auto_194545 ?auto_194543 ) ) ( ON ?auto_194545 ?auto_194544 ) ( CLEAR ?auto_194545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194540 ?auto_194541 ?auto_194542 ?auto_194544 )
      ( MAKE-3PILE ?auto_194540 ?auto_194541 ?auto_194542 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194546 - BLOCK
      ?auto_194547 - BLOCK
      ?auto_194548 - BLOCK
    )
    :vars
    (
      ?auto_194550 - BLOCK
      ?auto_194549 - BLOCK
      ?auto_194551 - BLOCK
      ?auto_194553 - BLOCK
      ?auto_194552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194550 ?auto_194548 ) ( ON-TABLE ?auto_194546 ) ( ON ?auto_194547 ?auto_194546 ) ( ON ?auto_194548 ?auto_194547 ) ( not ( = ?auto_194546 ?auto_194547 ) ) ( not ( = ?auto_194546 ?auto_194548 ) ) ( not ( = ?auto_194546 ?auto_194550 ) ) ( not ( = ?auto_194547 ?auto_194548 ) ) ( not ( = ?auto_194547 ?auto_194550 ) ) ( not ( = ?auto_194548 ?auto_194550 ) ) ( not ( = ?auto_194546 ?auto_194549 ) ) ( not ( = ?auto_194546 ?auto_194551 ) ) ( not ( = ?auto_194547 ?auto_194549 ) ) ( not ( = ?auto_194547 ?auto_194551 ) ) ( not ( = ?auto_194548 ?auto_194549 ) ) ( not ( = ?auto_194548 ?auto_194551 ) ) ( not ( = ?auto_194550 ?auto_194549 ) ) ( not ( = ?auto_194550 ?auto_194551 ) ) ( not ( = ?auto_194549 ?auto_194551 ) ) ( ON ?auto_194549 ?auto_194550 ) ( CLEAR ?auto_194549 ) ( HOLDING ?auto_194551 ) ( CLEAR ?auto_194553 ) ( ON-TABLE ?auto_194552 ) ( ON ?auto_194553 ?auto_194552 ) ( not ( = ?auto_194552 ?auto_194553 ) ) ( not ( = ?auto_194552 ?auto_194551 ) ) ( not ( = ?auto_194553 ?auto_194551 ) ) ( not ( = ?auto_194546 ?auto_194553 ) ) ( not ( = ?auto_194546 ?auto_194552 ) ) ( not ( = ?auto_194547 ?auto_194553 ) ) ( not ( = ?auto_194547 ?auto_194552 ) ) ( not ( = ?auto_194548 ?auto_194553 ) ) ( not ( = ?auto_194548 ?auto_194552 ) ) ( not ( = ?auto_194550 ?auto_194553 ) ) ( not ( = ?auto_194550 ?auto_194552 ) ) ( not ( = ?auto_194549 ?auto_194553 ) ) ( not ( = ?auto_194549 ?auto_194552 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194552 ?auto_194553 ?auto_194551 )
      ( MAKE-3PILE ?auto_194546 ?auto_194547 ?auto_194548 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194554 - BLOCK
      ?auto_194555 - BLOCK
      ?auto_194556 - BLOCK
    )
    :vars
    (
      ?auto_194558 - BLOCK
      ?auto_194557 - BLOCK
      ?auto_194559 - BLOCK
      ?auto_194560 - BLOCK
      ?auto_194561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194558 ?auto_194556 ) ( ON-TABLE ?auto_194554 ) ( ON ?auto_194555 ?auto_194554 ) ( ON ?auto_194556 ?auto_194555 ) ( not ( = ?auto_194554 ?auto_194555 ) ) ( not ( = ?auto_194554 ?auto_194556 ) ) ( not ( = ?auto_194554 ?auto_194558 ) ) ( not ( = ?auto_194555 ?auto_194556 ) ) ( not ( = ?auto_194555 ?auto_194558 ) ) ( not ( = ?auto_194556 ?auto_194558 ) ) ( not ( = ?auto_194554 ?auto_194557 ) ) ( not ( = ?auto_194554 ?auto_194559 ) ) ( not ( = ?auto_194555 ?auto_194557 ) ) ( not ( = ?auto_194555 ?auto_194559 ) ) ( not ( = ?auto_194556 ?auto_194557 ) ) ( not ( = ?auto_194556 ?auto_194559 ) ) ( not ( = ?auto_194558 ?auto_194557 ) ) ( not ( = ?auto_194558 ?auto_194559 ) ) ( not ( = ?auto_194557 ?auto_194559 ) ) ( ON ?auto_194557 ?auto_194558 ) ( CLEAR ?auto_194560 ) ( ON-TABLE ?auto_194561 ) ( ON ?auto_194560 ?auto_194561 ) ( not ( = ?auto_194561 ?auto_194560 ) ) ( not ( = ?auto_194561 ?auto_194559 ) ) ( not ( = ?auto_194560 ?auto_194559 ) ) ( not ( = ?auto_194554 ?auto_194560 ) ) ( not ( = ?auto_194554 ?auto_194561 ) ) ( not ( = ?auto_194555 ?auto_194560 ) ) ( not ( = ?auto_194555 ?auto_194561 ) ) ( not ( = ?auto_194556 ?auto_194560 ) ) ( not ( = ?auto_194556 ?auto_194561 ) ) ( not ( = ?auto_194558 ?auto_194560 ) ) ( not ( = ?auto_194558 ?auto_194561 ) ) ( not ( = ?auto_194557 ?auto_194560 ) ) ( not ( = ?auto_194557 ?auto_194561 ) ) ( ON ?auto_194559 ?auto_194557 ) ( CLEAR ?auto_194559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194554 ?auto_194555 ?auto_194556 ?auto_194558 ?auto_194557 )
      ( MAKE-3PILE ?auto_194554 ?auto_194555 ?auto_194556 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194562 - BLOCK
      ?auto_194563 - BLOCK
      ?auto_194564 - BLOCK
    )
    :vars
    (
      ?auto_194568 - BLOCK
      ?auto_194565 - BLOCK
      ?auto_194569 - BLOCK
      ?auto_194566 - BLOCK
      ?auto_194567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194568 ?auto_194564 ) ( ON-TABLE ?auto_194562 ) ( ON ?auto_194563 ?auto_194562 ) ( ON ?auto_194564 ?auto_194563 ) ( not ( = ?auto_194562 ?auto_194563 ) ) ( not ( = ?auto_194562 ?auto_194564 ) ) ( not ( = ?auto_194562 ?auto_194568 ) ) ( not ( = ?auto_194563 ?auto_194564 ) ) ( not ( = ?auto_194563 ?auto_194568 ) ) ( not ( = ?auto_194564 ?auto_194568 ) ) ( not ( = ?auto_194562 ?auto_194565 ) ) ( not ( = ?auto_194562 ?auto_194569 ) ) ( not ( = ?auto_194563 ?auto_194565 ) ) ( not ( = ?auto_194563 ?auto_194569 ) ) ( not ( = ?auto_194564 ?auto_194565 ) ) ( not ( = ?auto_194564 ?auto_194569 ) ) ( not ( = ?auto_194568 ?auto_194565 ) ) ( not ( = ?auto_194568 ?auto_194569 ) ) ( not ( = ?auto_194565 ?auto_194569 ) ) ( ON ?auto_194565 ?auto_194568 ) ( ON-TABLE ?auto_194566 ) ( not ( = ?auto_194566 ?auto_194567 ) ) ( not ( = ?auto_194566 ?auto_194569 ) ) ( not ( = ?auto_194567 ?auto_194569 ) ) ( not ( = ?auto_194562 ?auto_194567 ) ) ( not ( = ?auto_194562 ?auto_194566 ) ) ( not ( = ?auto_194563 ?auto_194567 ) ) ( not ( = ?auto_194563 ?auto_194566 ) ) ( not ( = ?auto_194564 ?auto_194567 ) ) ( not ( = ?auto_194564 ?auto_194566 ) ) ( not ( = ?auto_194568 ?auto_194567 ) ) ( not ( = ?auto_194568 ?auto_194566 ) ) ( not ( = ?auto_194565 ?auto_194567 ) ) ( not ( = ?auto_194565 ?auto_194566 ) ) ( ON ?auto_194569 ?auto_194565 ) ( CLEAR ?auto_194569 ) ( HOLDING ?auto_194567 ) ( CLEAR ?auto_194566 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194566 ?auto_194567 )
      ( MAKE-3PILE ?auto_194562 ?auto_194563 ?auto_194564 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194570 - BLOCK
      ?auto_194571 - BLOCK
      ?auto_194572 - BLOCK
    )
    :vars
    (
      ?auto_194576 - BLOCK
      ?auto_194573 - BLOCK
      ?auto_194574 - BLOCK
      ?auto_194575 - BLOCK
      ?auto_194577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194576 ?auto_194572 ) ( ON-TABLE ?auto_194570 ) ( ON ?auto_194571 ?auto_194570 ) ( ON ?auto_194572 ?auto_194571 ) ( not ( = ?auto_194570 ?auto_194571 ) ) ( not ( = ?auto_194570 ?auto_194572 ) ) ( not ( = ?auto_194570 ?auto_194576 ) ) ( not ( = ?auto_194571 ?auto_194572 ) ) ( not ( = ?auto_194571 ?auto_194576 ) ) ( not ( = ?auto_194572 ?auto_194576 ) ) ( not ( = ?auto_194570 ?auto_194573 ) ) ( not ( = ?auto_194570 ?auto_194574 ) ) ( not ( = ?auto_194571 ?auto_194573 ) ) ( not ( = ?auto_194571 ?auto_194574 ) ) ( not ( = ?auto_194572 ?auto_194573 ) ) ( not ( = ?auto_194572 ?auto_194574 ) ) ( not ( = ?auto_194576 ?auto_194573 ) ) ( not ( = ?auto_194576 ?auto_194574 ) ) ( not ( = ?auto_194573 ?auto_194574 ) ) ( ON ?auto_194573 ?auto_194576 ) ( ON-TABLE ?auto_194575 ) ( not ( = ?auto_194575 ?auto_194577 ) ) ( not ( = ?auto_194575 ?auto_194574 ) ) ( not ( = ?auto_194577 ?auto_194574 ) ) ( not ( = ?auto_194570 ?auto_194577 ) ) ( not ( = ?auto_194570 ?auto_194575 ) ) ( not ( = ?auto_194571 ?auto_194577 ) ) ( not ( = ?auto_194571 ?auto_194575 ) ) ( not ( = ?auto_194572 ?auto_194577 ) ) ( not ( = ?auto_194572 ?auto_194575 ) ) ( not ( = ?auto_194576 ?auto_194577 ) ) ( not ( = ?auto_194576 ?auto_194575 ) ) ( not ( = ?auto_194573 ?auto_194577 ) ) ( not ( = ?auto_194573 ?auto_194575 ) ) ( ON ?auto_194574 ?auto_194573 ) ( CLEAR ?auto_194575 ) ( ON ?auto_194577 ?auto_194574 ) ( CLEAR ?auto_194577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194570 ?auto_194571 ?auto_194572 ?auto_194576 ?auto_194573 ?auto_194574 )
      ( MAKE-3PILE ?auto_194570 ?auto_194571 ?auto_194572 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194578 - BLOCK
      ?auto_194579 - BLOCK
      ?auto_194580 - BLOCK
    )
    :vars
    (
      ?auto_194584 - BLOCK
      ?auto_194582 - BLOCK
      ?auto_194583 - BLOCK
      ?auto_194585 - BLOCK
      ?auto_194581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194584 ?auto_194580 ) ( ON-TABLE ?auto_194578 ) ( ON ?auto_194579 ?auto_194578 ) ( ON ?auto_194580 ?auto_194579 ) ( not ( = ?auto_194578 ?auto_194579 ) ) ( not ( = ?auto_194578 ?auto_194580 ) ) ( not ( = ?auto_194578 ?auto_194584 ) ) ( not ( = ?auto_194579 ?auto_194580 ) ) ( not ( = ?auto_194579 ?auto_194584 ) ) ( not ( = ?auto_194580 ?auto_194584 ) ) ( not ( = ?auto_194578 ?auto_194582 ) ) ( not ( = ?auto_194578 ?auto_194583 ) ) ( not ( = ?auto_194579 ?auto_194582 ) ) ( not ( = ?auto_194579 ?auto_194583 ) ) ( not ( = ?auto_194580 ?auto_194582 ) ) ( not ( = ?auto_194580 ?auto_194583 ) ) ( not ( = ?auto_194584 ?auto_194582 ) ) ( not ( = ?auto_194584 ?auto_194583 ) ) ( not ( = ?auto_194582 ?auto_194583 ) ) ( ON ?auto_194582 ?auto_194584 ) ( not ( = ?auto_194585 ?auto_194581 ) ) ( not ( = ?auto_194585 ?auto_194583 ) ) ( not ( = ?auto_194581 ?auto_194583 ) ) ( not ( = ?auto_194578 ?auto_194581 ) ) ( not ( = ?auto_194578 ?auto_194585 ) ) ( not ( = ?auto_194579 ?auto_194581 ) ) ( not ( = ?auto_194579 ?auto_194585 ) ) ( not ( = ?auto_194580 ?auto_194581 ) ) ( not ( = ?auto_194580 ?auto_194585 ) ) ( not ( = ?auto_194584 ?auto_194581 ) ) ( not ( = ?auto_194584 ?auto_194585 ) ) ( not ( = ?auto_194582 ?auto_194581 ) ) ( not ( = ?auto_194582 ?auto_194585 ) ) ( ON ?auto_194583 ?auto_194582 ) ( ON ?auto_194581 ?auto_194583 ) ( CLEAR ?auto_194581 ) ( HOLDING ?auto_194585 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194585 )
      ( MAKE-3PILE ?auto_194578 ?auto_194579 ?auto_194580 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194586 - BLOCK
      ?auto_194587 - BLOCK
      ?auto_194588 - BLOCK
    )
    :vars
    (
      ?auto_194589 - BLOCK
      ?auto_194590 - BLOCK
      ?auto_194592 - BLOCK
      ?auto_194591 - BLOCK
      ?auto_194593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194589 ?auto_194588 ) ( ON-TABLE ?auto_194586 ) ( ON ?auto_194587 ?auto_194586 ) ( ON ?auto_194588 ?auto_194587 ) ( not ( = ?auto_194586 ?auto_194587 ) ) ( not ( = ?auto_194586 ?auto_194588 ) ) ( not ( = ?auto_194586 ?auto_194589 ) ) ( not ( = ?auto_194587 ?auto_194588 ) ) ( not ( = ?auto_194587 ?auto_194589 ) ) ( not ( = ?auto_194588 ?auto_194589 ) ) ( not ( = ?auto_194586 ?auto_194590 ) ) ( not ( = ?auto_194586 ?auto_194592 ) ) ( not ( = ?auto_194587 ?auto_194590 ) ) ( not ( = ?auto_194587 ?auto_194592 ) ) ( not ( = ?auto_194588 ?auto_194590 ) ) ( not ( = ?auto_194588 ?auto_194592 ) ) ( not ( = ?auto_194589 ?auto_194590 ) ) ( not ( = ?auto_194589 ?auto_194592 ) ) ( not ( = ?auto_194590 ?auto_194592 ) ) ( ON ?auto_194590 ?auto_194589 ) ( not ( = ?auto_194591 ?auto_194593 ) ) ( not ( = ?auto_194591 ?auto_194592 ) ) ( not ( = ?auto_194593 ?auto_194592 ) ) ( not ( = ?auto_194586 ?auto_194593 ) ) ( not ( = ?auto_194586 ?auto_194591 ) ) ( not ( = ?auto_194587 ?auto_194593 ) ) ( not ( = ?auto_194587 ?auto_194591 ) ) ( not ( = ?auto_194588 ?auto_194593 ) ) ( not ( = ?auto_194588 ?auto_194591 ) ) ( not ( = ?auto_194589 ?auto_194593 ) ) ( not ( = ?auto_194589 ?auto_194591 ) ) ( not ( = ?auto_194590 ?auto_194593 ) ) ( not ( = ?auto_194590 ?auto_194591 ) ) ( ON ?auto_194592 ?auto_194590 ) ( ON ?auto_194593 ?auto_194592 ) ( ON ?auto_194591 ?auto_194593 ) ( CLEAR ?auto_194591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194586 ?auto_194587 ?auto_194588 ?auto_194589 ?auto_194590 ?auto_194592 ?auto_194593 )
      ( MAKE-3PILE ?auto_194586 ?auto_194587 ?auto_194588 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194594 - BLOCK
      ?auto_194595 - BLOCK
      ?auto_194596 - BLOCK
    )
    :vars
    (
      ?auto_194601 - BLOCK
      ?auto_194600 - BLOCK
      ?auto_194599 - BLOCK
      ?auto_194597 - BLOCK
      ?auto_194598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194601 ?auto_194596 ) ( ON-TABLE ?auto_194594 ) ( ON ?auto_194595 ?auto_194594 ) ( ON ?auto_194596 ?auto_194595 ) ( not ( = ?auto_194594 ?auto_194595 ) ) ( not ( = ?auto_194594 ?auto_194596 ) ) ( not ( = ?auto_194594 ?auto_194601 ) ) ( not ( = ?auto_194595 ?auto_194596 ) ) ( not ( = ?auto_194595 ?auto_194601 ) ) ( not ( = ?auto_194596 ?auto_194601 ) ) ( not ( = ?auto_194594 ?auto_194600 ) ) ( not ( = ?auto_194594 ?auto_194599 ) ) ( not ( = ?auto_194595 ?auto_194600 ) ) ( not ( = ?auto_194595 ?auto_194599 ) ) ( not ( = ?auto_194596 ?auto_194600 ) ) ( not ( = ?auto_194596 ?auto_194599 ) ) ( not ( = ?auto_194601 ?auto_194600 ) ) ( not ( = ?auto_194601 ?auto_194599 ) ) ( not ( = ?auto_194600 ?auto_194599 ) ) ( ON ?auto_194600 ?auto_194601 ) ( not ( = ?auto_194597 ?auto_194598 ) ) ( not ( = ?auto_194597 ?auto_194599 ) ) ( not ( = ?auto_194598 ?auto_194599 ) ) ( not ( = ?auto_194594 ?auto_194598 ) ) ( not ( = ?auto_194594 ?auto_194597 ) ) ( not ( = ?auto_194595 ?auto_194598 ) ) ( not ( = ?auto_194595 ?auto_194597 ) ) ( not ( = ?auto_194596 ?auto_194598 ) ) ( not ( = ?auto_194596 ?auto_194597 ) ) ( not ( = ?auto_194601 ?auto_194598 ) ) ( not ( = ?auto_194601 ?auto_194597 ) ) ( not ( = ?auto_194600 ?auto_194598 ) ) ( not ( = ?auto_194600 ?auto_194597 ) ) ( ON ?auto_194599 ?auto_194600 ) ( ON ?auto_194598 ?auto_194599 ) ( HOLDING ?auto_194597 ) ( CLEAR ?auto_194598 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_194594 ?auto_194595 ?auto_194596 ?auto_194601 ?auto_194600 ?auto_194599 ?auto_194598 ?auto_194597 )
      ( MAKE-3PILE ?auto_194594 ?auto_194595 ?auto_194596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194602 - BLOCK
      ?auto_194603 - BLOCK
      ?auto_194604 - BLOCK
    )
    :vars
    (
      ?auto_194607 - BLOCK
      ?auto_194609 - BLOCK
      ?auto_194608 - BLOCK
      ?auto_194605 - BLOCK
      ?auto_194606 - BLOCK
      ?auto_194610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194607 ?auto_194604 ) ( ON-TABLE ?auto_194602 ) ( ON ?auto_194603 ?auto_194602 ) ( ON ?auto_194604 ?auto_194603 ) ( not ( = ?auto_194602 ?auto_194603 ) ) ( not ( = ?auto_194602 ?auto_194604 ) ) ( not ( = ?auto_194602 ?auto_194607 ) ) ( not ( = ?auto_194603 ?auto_194604 ) ) ( not ( = ?auto_194603 ?auto_194607 ) ) ( not ( = ?auto_194604 ?auto_194607 ) ) ( not ( = ?auto_194602 ?auto_194609 ) ) ( not ( = ?auto_194602 ?auto_194608 ) ) ( not ( = ?auto_194603 ?auto_194609 ) ) ( not ( = ?auto_194603 ?auto_194608 ) ) ( not ( = ?auto_194604 ?auto_194609 ) ) ( not ( = ?auto_194604 ?auto_194608 ) ) ( not ( = ?auto_194607 ?auto_194609 ) ) ( not ( = ?auto_194607 ?auto_194608 ) ) ( not ( = ?auto_194609 ?auto_194608 ) ) ( ON ?auto_194609 ?auto_194607 ) ( not ( = ?auto_194605 ?auto_194606 ) ) ( not ( = ?auto_194605 ?auto_194608 ) ) ( not ( = ?auto_194606 ?auto_194608 ) ) ( not ( = ?auto_194602 ?auto_194606 ) ) ( not ( = ?auto_194602 ?auto_194605 ) ) ( not ( = ?auto_194603 ?auto_194606 ) ) ( not ( = ?auto_194603 ?auto_194605 ) ) ( not ( = ?auto_194604 ?auto_194606 ) ) ( not ( = ?auto_194604 ?auto_194605 ) ) ( not ( = ?auto_194607 ?auto_194606 ) ) ( not ( = ?auto_194607 ?auto_194605 ) ) ( not ( = ?auto_194609 ?auto_194606 ) ) ( not ( = ?auto_194609 ?auto_194605 ) ) ( ON ?auto_194608 ?auto_194609 ) ( ON ?auto_194606 ?auto_194608 ) ( CLEAR ?auto_194606 ) ( ON ?auto_194605 ?auto_194610 ) ( CLEAR ?auto_194605 ) ( HAND-EMPTY ) ( not ( = ?auto_194602 ?auto_194610 ) ) ( not ( = ?auto_194603 ?auto_194610 ) ) ( not ( = ?auto_194604 ?auto_194610 ) ) ( not ( = ?auto_194607 ?auto_194610 ) ) ( not ( = ?auto_194609 ?auto_194610 ) ) ( not ( = ?auto_194608 ?auto_194610 ) ) ( not ( = ?auto_194605 ?auto_194610 ) ) ( not ( = ?auto_194606 ?auto_194610 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194605 ?auto_194610 )
      ( MAKE-3PILE ?auto_194602 ?auto_194603 ?auto_194604 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194611 - BLOCK
      ?auto_194612 - BLOCK
      ?auto_194613 - BLOCK
    )
    :vars
    (
      ?auto_194615 - BLOCK
      ?auto_194618 - BLOCK
      ?auto_194614 - BLOCK
      ?auto_194616 - BLOCK
      ?auto_194619 - BLOCK
      ?auto_194617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194615 ?auto_194613 ) ( ON-TABLE ?auto_194611 ) ( ON ?auto_194612 ?auto_194611 ) ( ON ?auto_194613 ?auto_194612 ) ( not ( = ?auto_194611 ?auto_194612 ) ) ( not ( = ?auto_194611 ?auto_194613 ) ) ( not ( = ?auto_194611 ?auto_194615 ) ) ( not ( = ?auto_194612 ?auto_194613 ) ) ( not ( = ?auto_194612 ?auto_194615 ) ) ( not ( = ?auto_194613 ?auto_194615 ) ) ( not ( = ?auto_194611 ?auto_194618 ) ) ( not ( = ?auto_194611 ?auto_194614 ) ) ( not ( = ?auto_194612 ?auto_194618 ) ) ( not ( = ?auto_194612 ?auto_194614 ) ) ( not ( = ?auto_194613 ?auto_194618 ) ) ( not ( = ?auto_194613 ?auto_194614 ) ) ( not ( = ?auto_194615 ?auto_194618 ) ) ( not ( = ?auto_194615 ?auto_194614 ) ) ( not ( = ?auto_194618 ?auto_194614 ) ) ( ON ?auto_194618 ?auto_194615 ) ( not ( = ?auto_194616 ?auto_194619 ) ) ( not ( = ?auto_194616 ?auto_194614 ) ) ( not ( = ?auto_194619 ?auto_194614 ) ) ( not ( = ?auto_194611 ?auto_194619 ) ) ( not ( = ?auto_194611 ?auto_194616 ) ) ( not ( = ?auto_194612 ?auto_194619 ) ) ( not ( = ?auto_194612 ?auto_194616 ) ) ( not ( = ?auto_194613 ?auto_194619 ) ) ( not ( = ?auto_194613 ?auto_194616 ) ) ( not ( = ?auto_194615 ?auto_194619 ) ) ( not ( = ?auto_194615 ?auto_194616 ) ) ( not ( = ?auto_194618 ?auto_194619 ) ) ( not ( = ?auto_194618 ?auto_194616 ) ) ( ON ?auto_194614 ?auto_194618 ) ( ON ?auto_194616 ?auto_194617 ) ( CLEAR ?auto_194616 ) ( not ( = ?auto_194611 ?auto_194617 ) ) ( not ( = ?auto_194612 ?auto_194617 ) ) ( not ( = ?auto_194613 ?auto_194617 ) ) ( not ( = ?auto_194615 ?auto_194617 ) ) ( not ( = ?auto_194618 ?auto_194617 ) ) ( not ( = ?auto_194614 ?auto_194617 ) ) ( not ( = ?auto_194616 ?auto_194617 ) ) ( not ( = ?auto_194619 ?auto_194617 ) ) ( HOLDING ?auto_194619 ) ( CLEAR ?auto_194614 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194611 ?auto_194612 ?auto_194613 ?auto_194615 ?auto_194618 ?auto_194614 ?auto_194619 )
      ( MAKE-3PILE ?auto_194611 ?auto_194612 ?auto_194613 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194620 - BLOCK
      ?auto_194621 - BLOCK
      ?auto_194622 - BLOCK
    )
    :vars
    (
      ?auto_194624 - BLOCK
      ?auto_194628 - BLOCK
      ?auto_194623 - BLOCK
      ?auto_194627 - BLOCK
      ?auto_194626 - BLOCK
      ?auto_194625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194624 ?auto_194622 ) ( ON-TABLE ?auto_194620 ) ( ON ?auto_194621 ?auto_194620 ) ( ON ?auto_194622 ?auto_194621 ) ( not ( = ?auto_194620 ?auto_194621 ) ) ( not ( = ?auto_194620 ?auto_194622 ) ) ( not ( = ?auto_194620 ?auto_194624 ) ) ( not ( = ?auto_194621 ?auto_194622 ) ) ( not ( = ?auto_194621 ?auto_194624 ) ) ( not ( = ?auto_194622 ?auto_194624 ) ) ( not ( = ?auto_194620 ?auto_194628 ) ) ( not ( = ?auto_194620 ?auto_194623 ) ) ( not ( = ?auto_194621 ?auto_194628 ) ) ( not ( = ?auto_194621 ?auto_194623 ) ) ( not ( = ?auto_194622 ?auto_194628 ) ) ( not ( = ?auto_194622 ?auto_194623 ) ) ( not ( = ?auto_194624 ?auto_194628 ) ) ( not ( = ?auto_194624 ?auto_194623 ) ) ( not ( = ?auto_194628 ?auto_194623 ) ) ( ON ?auto_194628 ?auto_194624 ) ( not ( = ?auto_194627 ?auto_194626 ) ) ( not ( = ?auto_194627 ?auto_194623 ) ) ( not ( = ?auto_194626 ?auto_194623 ) ) ( not ( = ?auto_194620 ?auto_194626 ) ) ( not ( = ?auto_194620 ?auto_194627 ) ) ( not ( = ?auto_194621 ?auto_194626 ) ) ( not ( = ?auto_194621 ?auto_194627 ) ) ( not ( = ?auto_194622 ?auto_194626 ) ) ( not ( = ?auto_194622 ?auto_194627 ) ) ( not ( = ?auto_194624 ?auto_194626 ) ) ( not ( = ?auto_194624 ?auto_194627 ) ) ( not ( = ?auto_194628 ?auto_194626 ) ) ( not ( = ?auto_194628 ?auto_194627 ) ) ( ON ?auto_194623 ?auto_194628 ) ( ON ?auto_194627 ?auto_194625 ) ( not ( = ?auto_194620 ?auto_194625 ) ) ( not ( = ?auto_194621 ?auto_194625 ) ) ( not ( = ?auto_194622 ?auto_194625 ) ) ( not ( = ?auto_194624 ?auto_194625 ) ) ( not ( = ?auto_194628 ?auto_194625 ) ) ( not ( = ?auto_194623 ?auto_194625 ) ) ( not ( = ?auto_194627 ?auto_194625 ) ) ( not ( = ?auto_194626 ?auto_194625 ) ) ( CLEAR ?auto_194623 ) ( ON ?auto_194626 ?auto_194627 ) ( CLEAR ?auto_194626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194625 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194625 ?auto_194627 )
      ( MAKE-3PILE ?auto_194620 ?auto_194621 ?auto_194622 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194629 - BLOCK
      ?auto_194630 - BLOCK
      ?auto_194631 - BLOCK
    )
    :vars
    (
      ?auto_194633 - BLOCK
      ?auto_194634 - BLOCK
      ?auto_194637 - BLOCK
      ?auto_194635 - BLOCK
      ?auto_194636 - BLOCK
      ?auto_194632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194633 ?auto_194631 ) ( ON-TABLE ?auto_194629 ) ( ON ?auto_194630 ?auto_194629 ) ( ON ?auto_194631 ?auto_194630 ) ( not ( = ?auto_194629 ?auto_194630 ) ) ( not ( = ?auto_194629 ?auto_194631 ) ) ( not ( = ?auto_194629 ?auto_194633 ) ) ( not ( = ?auto_194630 ?auto_194631 ) ) ( not ( = ?auto_194630 ?auto_194633 ) ) ( not ( = ?auto_194631 ?auto_194633 ) ) ( not ( = ?auto_194629 ?auto_194634 ) ) ( not ( = ?auto_194629 ?auto_194637 ) ) ( not ( = ?auto_194630 ?auto_194634 ) ) ( not ( = ?auto_194630 ?auto_194637 ) ) ( not ( = ?auto_194631 ?auto_194634 ) ) ( not ( = ?auto_194631 ?auto_194637 ) ) ( not ( = ?auto_194633 ?auto_194634 ) ) ( not ( = ?auto_194633 ?auto_194637 ) ) ( not ( = ?auto_194634 ?auto_194637 ) ) ( ON ?auto_194634 ?auto_194633 ) ( not ( = ?auto_194635 ?auto_194636 ) ) ( not ( = ?auto_194635 ?auto_194637 ) ) ( not ( = ?auto_194636 ?auto_194637 ) ) ( not ( = ?auto_194629 ?auto_194636 ) ) ( not ( = ?auto_194629 ?auto_194635 ) ) ( not ( = ?auto_194630 ?auto_194636 ) ) ( not ( = ?auto_194630 ?auto_194635 ) ) ( not ( = ?auto_194631 ?auto_194636 ) ) ( not ( = ?auto_194631 ?auto_194635 ) ) ( not ( = ?auto_194633 ?auto_194636 ) ) ( not ( = ?auto_194633 ?auto_194635 ) ) ( not ( = ?auto_194634 ?auto_194636 ) ) ( not ( = ?auto_194634 ?auto_194635 ) ) ( ON ?auto_194635 ?auto_194632 ) ( not ( = ?auto_194629 ?auto_194632 ) ) ( not ( = ?auto_194630 ?auto_194632 ) ) ( not ( = ?auto_194631 ?auto_194632 ) ) ( not ( = ?auto_194633 ?auto_194632 ) ) ( not ( = ?auto_194634 ?auto_194632 ) ) ( not ( = ?auto_194637 ?auto_194632 ) ) ( not ( = ?auto_194635 ?auto_194632 ) ) ( not ( = ?auto_194636 ?auto_194632 ) ) ( ON ?auto_194636 ?auto_194635 ) ( CLEAR ?auto_194636 ) ( ON-TABLE ?auto_194632 ) ( HOLDING ?auto_194637 ) ( CLEAR ?auto_194634 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194629 ?auto_194630 ?auto_194631 ?auto_194633 ?auto_194634 ?auto_194637 )
      ( MAKE-3PILE ?auto_194629 ?auto_194630 ?auto_194631 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194638 - BLOCK
      ?auto_194639 - BLOCK
      ?auto_194640 - BLOCK
    )
    :vars
    (
      ?auto_194645 - BLOCK
      ?auto_194642 - BLOCK
      ?auto_194643 - BLOCK
      ?auto_194644 - BLOCK
      ?auto_194646 - BLOCK
      ?auto_194641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194645 ?auto_194640 ) ( ON-TABLE ?auto_194638 ) ( ON ?auto_194639 ?auto_194638 ) ( ON ?auto_194640 ?auto_194639 ) ( not ( = ?auto_194638 ?auto_194639 ) ) ( not ( = ?auto_194638 ?auto_194640 ) ) ( not ( = ?auto_194638 ?auto_194645 ) ) ( not ( = ?auto_194639 ?auto_194640 ) ) ( not ( = ?auto_194639 ?auto_194645 ) ) ( not ( = ?auto_194640 ?auto_194645 ) ) ( not ( = ?auto_194638 ?auto_194642 ) ) ( not ( = ?auto_194638 ?auto_194643 ) ) ( not ( = ?auto_194639 ?auto_194642 ) ) ( not ( = ?auto_194639 ?auto_194643 ) ) ( not ( = ?auto_194640 ?auto_194642 ) ) ( not ( = ?auto_194640 ?auto_194643 ) ) ( not ( = ?auto_194645 ?auto_194642 ) ) ( not ( = ?auto_194645 ?auto_194643 ) ) ( not ( = ?auto_194642 ?auto_194643 ) ) ( ON ?auto_194642 ?auto_194645 ) ( not ( = ?auto_194644 ?auto_194646 ) ) ( not ( = ?auto_194644 ?auto_194643 ) ) ( not ( = ?auto_194646 ?auto_194643 ) ) ( not ( = ?auto_194638 ?auto_194646 ) ) ( not ( = ?auto_194638 ?auto_194644 ) ) ( not ( = ?auto_194639 ?auto_194646 ) ) ( not ( = ?auto_194639 ?auto_194644 ) ) ( not ( = ?auto_194640 ?auto_194646 ) ) ( not ( = ?auto_194640 ?auto_194644 ) ) ( not ( = ?auto_194645 ?auto_194646 ) ) ( not ( = ?auto_194645 ?auto_194644 ) ) ( not ( = ?auto_194642 ?auto_194646 ) ) ( not ( = ?auto_194642 ?auto_194644 ) ) ( ON ?auto_194644 ?auto_194641 ) ( not ( = ?auto_194638 ?auto_194641 ) ) ( not ( = ?auto_194639 ?auto_194641 ) ) ( not ( = ?auto_194640 ?auto_194641 ) ) ( not ( = ?auto_194645 ?auto_194641 ) ) ( not ( = ?auto_194642 ?auto_194641 ) ) ( not ( = ?auto_194643 ?auto_194641 ) ) ( not ( = ?auto_194644 ?auto_194641 ) ) ( not ( = ?auto_194646 ?auto_194641 ) ) ( ON ?auto_194646 ?auto_194644 ) ( ON-TABLE ?auto_194641 ) ( CLEAR ?auto_194642 ) ( ON ?auto_194643 ?auto_194646 ) ( CLEAR ?auto_194643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194641 ?auto_194644 ?auto_194646 )
      ( MAKE-3PILE ?auto_194638 ?auto_194639 ?auto_194640 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194647 - BLOCK
      ?auto_194648 - BLOCK
      ?auto_194649 - BLOCK
    )
    :vars
    (
      ?auto_194654 - BLOCK
      ?auto_194650 - BLOCK
      ?auto_194653 - BLOCK
      ?auto_194651 - BLOCK
      ?auto_194652 - BLOCK
      ?auto_194655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194654 ?auto_194649 ) ( ON-TABLE ?auto_194647 ) ( ON ?auto_194648 ?auto_194647 ) ( ON ?auto_194649 ?auto_194648 ) ( not ( = ?auto_194647 ?auto_194648 ) ) ( not ( = ?auto_194647 ?auto_194649 ) ) ( not ( = ?auto_194647 ?auto_194654 ) ) ( not ( = ?auto_194648 ?auto_194649 ) ) ( not ( = ?auto_194648 ?auto_194654 ) ) ( not ( = ?auto_194649 ?auto_194654 ) ) ( not ( = ?auto_194647 ?auto_194650 ) ) ( not ( = ?auto_194647 ?auto_194653 ) ) ( not ( = ?auto_194648 ?auto_194650 ) ) ( not ( = ?auto_194648 ?auto_194653 ) ) ( not ( = ?auto_194649 ?auto_194650 ) ) ( not ( = ?auto_194649 ?auto_194653 ) ) ( not ( = ?auto_194654 ?auto_194650 ) ) ( not ( = ?auto_194654 ?auto_194653 ) ) ( not ( = ?auto_194650 ?auto_194653 ) ) ( not ( = ?auto_194651 ?auto_194652 ) ) ( not ( = ?auto_194651 ?auto_194653 ) ) ( not ( = ?auto_194652 ?auto_194653 ) ) ( not ( = ?auto_194647 ?auto_194652 ) ) ( not ( = ?auto_194647 ?auto_194651 ) ) ( not ( = ?auto_194648 ?auto_194652 ) ) ( not ( = ?auto_194648 ?auto_194651 ) ) ( not ( = ?auto_194649 ?auto_194652 ) ) ( not ( = ?auto_194649 ?auto_194651 ) ) ( not ( = ?auto_194654 ?auto_194652 ) ) ( not ( = ?auto_194654 ?auto_194651 ) ) ( not ( = ?auto_194650 ?auto_194652 ) ) ( not ( = ?auto_194650 ?auto_194651 ) ) ( ON ?auto_194651 ?auto_194655 ) ( not ( = ?auto_194647 ?auto_194655 ) ) ( not ( = ?auto_194648 ?auto_194655 ) ) ( not ( = ?auto_194649 ?auto_194655 ) ) ( not ( = ?auto_194654 ?auto_194655 ) ) ( not ( = ?auto_194650 ?auto_194655 ) ) ( not ( = ?auto_194653 ?auto_194655 ) ) ( not ( = ?auto_194651 ?auto_194655 ) ) ( not ( = ?auto_194652 ?auto_194655 ) ) ( ON ?auto_194652 ?auto_194651 ) ( ON-TABLE ?auto_194655 ) ( ON ?auto_194653 ?auto_194652 ) ( CLEAR ?auto_194653 ) ( HOLDING ?auto_194650 ) ( CLEAR ?auto_194654 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194647 ?auto_194648 ?auto_194649 ?auto_194654 ?auto_194650 )
      ( MAKE-3PILE ?auto_194647 ?auto_194648 ?auto_194649 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194656 - BLOCK
      ?auto_194657 - BLOCK
      ?auto_194658 - BLOCK
    )
    :vars
    (
      ?auto_194659 - BLOCK
      ?auto_194661 - BLOCK
      ?auto_194660 - BLOCK
      ?auto_194663 - BLOCK
      ?auto_194662 - BLOCK
      ?auto_194664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194659 ?auto_194658 ) ( ON-TABLE ?auto_194656 ) ( ON ?auto_194657 ?auto_194656 ) ( ON ?auto_194658 ?auto_194657 ) ( not ( = ?auto_194656 ?auto_194657 ) ) ( not ( = ?auto_194656 ?auto_194658 ) ) ( not ( = ?auto_194656 ?auto_194659 ) ) ( not ( = ?auto_194657 ?auto_194658 ) ) ( not ( = ?auto_194657 ?auto_194659 ) ) ( not ( = ?auto_194658 ?auto_194659 ) ) ( not ( = ?auto_194656 ?auto_194661 ) ) ( not ( = ?auto_194656 ?auto_194660 ) ) ( not ( = ?auto_194657 ?auto_194661 ) ) ( not ( = ?auto_194657 ?auto_194660 ) ) ( not ( = ?auto_194658 ?auto_194661 ) ) ( not ( = ?auto_194658 ?auto_194660 ) ) ( not ( = ?auto_194659 ?auto_194661 ) ) ( not ( = ?auto_194659 ?auto_194660 ) ) ( not ( = ?auto_194661 ?auto_194660 ) ) ( not ( = ?auto_194663 ?auto_194662 ) ) ( not ( = ?auto_194663 ?auto_194660 ) ) ( not ( = ?auto_194662 ?auto_194660 ) ) ( not ( = ?auto_194656 ?auto_194662 ) ) ( not ( = ?auto_194656 ?auto_194663 ) ) ( not ( = ?auto_194657 ?auto_194662 ) ) ( not ( = ?auto_194657 ?auto_194663 ) ) ( not ( = ?auto_194658 ?auto_194662 ) ) ( not ( = ?auto_194658 ?auto_194663 ) ) ( not ( = ?auto_194659 ?auto_194662 ) ) ( not ( = ?auto_194659 ?auto_194663 ) ) ( not ( = ?auto_194661 ?auto_194662 ) ) ( not ( = ?auto_194661 ?auto_194663 ) ) ( ON ?auto_194663 ?auto_194664 ) ( not ( = ?auto_194656 ?auto_194664 ) ) ( not ( = ?auto_194657 ?auto_194664 ) ) ( not ( = ?auto_194658 ?auto_194664 ) ) ( not ( = ?auto_194659 ?auto_194664 ) ) ( not ( = ?auto_194661 ?auto_194664 ) ) ( not ( = ?auto_194660 ?auto_194664 ) ) ( not ( = ?auto_194663 ?auto_194664 ) ) ( not ( = ?auto_194662 ?auto_194664 ) ) ( ON ?auto_194662 ?auto_194663 ) ( ON-TABLE ?auto_194664 ) ( ON ?auto_194660 ?auto_194662 ) ( CLEAR ?auto_194659 ) ( ON ?auto_194661 ?auto_194660 ) ( CLEAR ?auto_194661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194664 ?auto_194663 ?auto_194662 ?auto_194660 )
      ( MAKE-3PILE ?auto_194656 ?auto_194657 ?auto_194658 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194683 - BLOCK
      ?auto_194684 - BLOCK
      ?auto_194685 - BLOCK
    )
    :vars
    (
      ?auto_194691 - BLOCK
      ?auto_194686 - BLOCK
      ?auto_194689 - BLOCK
      ?auto_194690 - BLOCK
      ?auto_194688 - BLOCK
      ?auto_194687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194683 ) ( ON ?auto_194684 ?auto_194683 ) ( not ( = ?auto_194683 ?auto_194684 ) ) ( not ( = ?auto_194683 ?auto_194685 ) ) ( not ( = ?auto_194683 ?auto_194691 ) ) ( not ( = ?auto_194684 ?auto_194685 ) ) ( not ( = ?auto_194684 ?auto_194691 ) ) ( not ( = ?auto_194685 ?auto_194691 ) ) ( not ( = ?auto_194683 ?auto_194686 ) ) ( not ( = ?auto_194683 ?auto_194689 ) ) ( not ( = ?auto_194684 ?auto_194686 ) ) ( not ( = ?auto_194684 ?auto_194689 ) ) ( not ( = ?auto_194685 ?auto_194686 ) ) ( not ( = ?auto_194685 ?auto_194689 ) ) ( not ( = ?auto_194691 ?auto_194686 ) ) ( not ( = ?auto_194691 ?auto_194689 ) ) ( not ( = ?auto_194686 ?auto_194689 ) ) ( not ( = ?auto_194690 ?auto_194688 ) ) ( not ( = ?auto_194690 ?auto_194689 ) ) ( not ( = ?auto_194688 ?auto_194689 ) ) ( not ( = ?auto_194683 ?auto_194688 ) ) ( not ( = ?auto_194683 ?auto_194690 ) ) ( not ( = ?auto_194684 ?auto_194688 ) ) ( not ( = ?auto_194684 ?auto_194690 ) ) ( not ( = ?auto_194685 ?auto_194688 ) ) ( not ( = ?auto_194685 ?auto_194690 ) ) ( not ( = ?auto_194691 ?auto_194688 ) ) ( not ( = ?auto_194691 ?auto_194690 ) ) ( not ( = ?auto_194686 ?auto_194688 ) ) ( not ( = ?auto_194686 ?auto_194690 ) ) ( ON ?auto_194690 ?auto_194687 ) ( not ( = ?auto_194683 ?auto_194687 ) ) ( not ( = ?auto_194684 ?auto_194687 ) ) ( not ( = ?auto_194685 ?auto_194687 ) ) ( not ( = ?auto_194691 ?auto_194687 ) ) ( not ( = ?auto_194686 ?auto_194687 ) ) ( not ( = ?auto_194689 ?auto_194687 ) ) ( not ( = ?auto_194690 ?auto_194687 ) ) ( not ( = ?auto_194688 ?auto_194687 ) ) ( ON ?auto_194688 ?auto_194690 ) ( ON-TABLE ?auto_194687 ) ( ON ?auto_194689 ?auto_194688 ) ( ON ?auto_194686 ?auto_194689 ) ( ON ?auto_194691 ?auto_194686 ) ( CLEAR ?auto_194691 ) ( HOLDING ?auto_194685 ) ( CLEAR ?auto_194684 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194683 ?auto_194684 ?auto_194685 ?auto_194691 )
      ( MAKE-3PILE ?auto_194683 ?auto_194684 ?auto_194685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194692 - BLOCK
      ?auto_194693 - BLOCK
      ?auto_194694 - BLOCK
    )
    :vars
    (
      ?auto_194697 - BLOCK
      ?auto_194700 - BLOCK
      ?auto_194698 - BLOCK
      ?auto_194695 - BLOCK
      ?auto_194696 - BLOCK
      ?auto_194699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194692 ) ( ON ?auto_194693 ?auto_194692 ) ( not ( = ?auto_194692 ?auto_194693 ) ) ( not ( = ?auto_194692 ?auto_194694 ) ) ( not ( = ?auto_194692 ?auto_194697 ) ) ( not ( = ?auto_194693 ?auto_194694 ) ) ( not ( = ?auto_194693 ?auto_194697 ) ) ( not ( = ?auto_194694 ?auto_194697 ) ) ( not ( = ?auto_194692 ?auto_194700 ) ) ( not ( = ?auto_194692 ?auto_194698 ) ) ( not ( = ?auto_194693 ?auto_194700 ) ) ( not ( = ?auto_194693 ?auto_194698 ) ) ( not ( = ?auto_194694 ?auto_194700 ) ) ( not ( = ?auto_194694 ?auto_194698 ) ) ( not ( = ?auto_194697 ?auto_194700 ) ) ( not ( = ?auto_194697 ?auto_194698 ) ) ( not ( = ?auto_194700 ?auto_194698 ) ) ( not ( = ?auto_194695 ?auto_194696 ) ) ( not ( = ?auto_194695 ?auto_194698 ) ) ( not ( = ?auto_194696 ?auto_194698 ) ) ( not ( = ?auto_194692 ?auto_194696 ) ) ( not ( = ?auto_194692 ?auto_194695 ) ) ( not ( = ?auto_194693 ?auto_194696 ) ) ( not ( = ?auto_194693 ?auto_194695 ) ) ( not ( = ?auto_194694 ?auto_194696 ) ) ( not ( = ?auto_194694 ?auto_194695 ) ) ( not ( = ?auto_194697 ?auto_194696 ) ) ( not ( = ?auto_194697 ?auto_194695 ) ) ( not ( = ?auto_194700 ?auto_194696 ) ) ( not ( = ?auto_194700 ?auto_194695 ) ) ( ON ?auto_194695 ?auto_194699 ) ( not ( = ?auto_194692 ?auto_194699 ) ) ( not ( = ?auto_194693 ?auto_194699 ) ) ( not ( = ?auto_194694 ?auto_194699 ) ) ( not ( = ?auto_194697 ?auto_194699 ) ) ( not ( = ?auto_194700 ?auto_194699 ) ) ( not ( = ?auto_194698 ?auto_194699 ) ) ( not ( = ?auto_194695 ?auto_194699 ) ) ( not ( = ?auto_194696 ?auto_194699 ) ) ( ON ?auto_194696 ?auto_194695 ) ( ON-TABLE ?auto_194699 ) ( ON ?auto_194698 ?auto_194696 ) ( ON ?auto_194700 ?auto_194698 ) ( ON ?auto_194697 ?auto_194700 ) ( CLEAR ?auto_194693 ) ( ON ?auto_194694 ?auto_194697 ) ( CLEAR ?auto_194694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194699 ?auto_194695 ?auto_194696 ?auto_194698 ?auto_194700 ?auto_194697 )
      ( MAKE-3PILE ?auto_194692 ?auto_194693 ?auto_194694 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194701 - BLOCK
      ?auto_194702 - BLOCK
      ?auto_194703 - BLOCK
    )
    :vars
    (
      ?auto_194708 - BLOCK
      ?auto_194704 - BLOCK
      ?auto_194707 - BLOCK
      ?auto_194705 - BLOCK
      ?auto_194706 - BLOCK
      ?auto_194709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194701 ) ( not ( = ?auto_194701 ?auto_194702 ) ) ( not ( = ?auto_194701 ?auto_194703 ) ) ( not ( = ?auto_194701 ?auto_194708 ) ) ( not ( = ?auto_194702 ?auto_194703 ) ) ( not ( = ?auto_194702 ?auto_194708 ) ) ( not ( = ?auto_194703 ?auto_194708 ) ) ( not ( = ?auto_194701 ?auto_194704 ) ) ( not ( = ?auto_194701 ?auto_194707 ) ) ( not ( = ?auto_194702 ?auto_194704 ) ) ( not ( = ?auto_194702 ?auto_194707 ) ) ( not ( = ?auto_194703 ?auto_194704 ) ) ( not ( = ?auto_194703 ?auto_194707 ) ) ( not ( = ?auto_194708 ?auto_194704 ) ) ( not ( = ?auto_194708 ?auto_194707 ) ) ( not ( = ?auto_194704 ?auto_194707 ) ) ( not ( = ?auto_194705 ?auto_194706 ) ) ( not ( = ?auto_194705 ?auto_194707 ) ) ( not ( = ?auto_194706 ?auto_194707 ) ) ( not ( = ?auto_194701 ?auto_194706 ) ) ( not ( = ?auto_194701 ?auto_194705 ) ) ( not ( = ?auto_194702 ?auto_194706 ) ) ( not ( = ?auto_194702 ?auto_194705 ) ) ( not ( = ?auto_194703 ?auto_194706 ) ) ( not ( = ?auto_194703 ?auto_194705 ) ) ( not ( = ?auto_194708 ?auto_194706 ) ) ( not ( = ?auto_194708 ?auto_194705 ) ) ( not ( = ?auto_194704 ?auto_194706 ) ) ( not ( = ?auto_194704 ?auto_194705 ) ) ( ON ?auto_194705 ?auto_194709 ) ( not ( = ?auto_194701 ?auto_194709 ) ) ( not ( = ?auto_194702 ?auto_194709 ) ) ( not ( = ?auto_194703 ?auto_194709 ) ) ( not ( = ?auto_194708 ?auto_194709 ) ) ( not ( = ?auto_194704 ?auto_194709 ) ) ( not ( = ?auto_194707 ?auto_194709 ) ) ( not ( = ?auto_194705 ?auto_194709 ) ) ( not ( = ?auto_194706 ?auto_194709 ) ) ( ON ?auto_194706 ?auto_194705 ) ( ON-TABLE ?auto_194709 ) ( ON ?auto_194707 ?auto_194706 ) ( ON ?auto_194704 ?auto_194707 ) ( ON ?auto_194708 ?auto_194704 ) ( ON ?auto_194703 ?auto_194708 ) ( CLEAR ?auto_194703 ) ( HOLDING ?auto_194702 ) ( CLEAR ?auto_194701 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194701 ?auto_194702 )
      ( MAKE-3PILE ?auto_194701 ?auto_194702 ?auto_194703 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194710 - BLOCK
      ?auto_194711 - BLOCK
      ?auto_194712 - BLOCK
    )
    :vars
    (
      ?auto_194713 - BLOCK
      ?auto_194714 - BLOCK
      ?auto_194717 - BLOCK
      ?auto_194715 - BLOCK
      ?auto_194716 - BLOCK
      ?auto_194718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194710 ) ( not ( = ?auto_194710 ?auto_194711 ) ) ( not ( = ?auto_194710 ?auto_194712 ) ) ( not ( = ?auto_194710 ?auto_194713 ) ) ( not ( = ?auto_194711 ?auto_194712 ) ) ( not ( = ?auto_194711 ?auto_194713 ) ) ( not ( = ?auto_194712 ?auto_194713 ) ) ( not ( = ?auto_194710 ?auto_194714 ) ) ( not ( = ?auto_194710 ?auto_194717 ) ) ( not ( = ?auto_194711 ?auto_194714 ) ) ( not ( = ?auto_194711 ?auto_194717 ) ) ( not ( = ?auto_194712 ?auto_194714 ) ) ( not ( = ?auto_194712 ?auto_194717 ) ) ( not ( = ?auto_194713 ?auto_194714 ) ) ( not ( = ?auto_194713 ?auto_194717 ) ) ( not ( = ?auto_194714 ?auto_194717 ) ) ( not ( = ?auto_194715 ?auto_194716 ) ) ( not ( = ?auto_194715 ?auto_194717 ) ) ( not ( = ?auto_194716 ?auto_194717 ) ) ( not ( = ?auto_194710 ?auto_194716 ) ) ( not ( = ?auto_194710 ?auto_194715 ) ) ( not ( = ?auto_194711 ?auto_194716 ) ) ( not ( = ?auto_194711 ?auto_194715 ) ) ( not ( = ?auto_194712 ?auto_194716 ) ) ( not ( = ?auto_194712 ?auto_194715 ) ) ( not ( = ?auto_194713 ?auto_194716 ) ) ( not ( = ?auto_194713 ?auto_194715 ) ) ( not ( = ?auto_194714 ?auto_194716 ) ) ( not ( = ?auto_194714 ?auto_194715 ) ) ( ON ?auto_194715 ?auto_194718 ) ( not ( = ?auto_194710 ?auto_194718 ) ) ( not ( = ?auto_194711 ?auto_194718 ) ) ( not ( = ?auto_194712 ?auto_194718 ) ) ( not ( = ?auto_194713 ?auto_194718 ) ) ( not ( = ?auto_194714 ?auto_194718 ) ) ( not ( = ?auto_194717 ?auto_194718 ) ) ( not ( = ?auto_194715 ?auto_194718 ) ) ( not ( = ?auto_194716 ?auto_194718 ) ) ( ON ?auto_194716 ?auto_194715 ) ( ON-TABLE ?auto_194718 ) ( ON ?auto_194717 ?auto_194716 ) ( ON ?auto_194714 ?auto_194717 ) ( ON ?auto_194713 ?auto_194714 ) ( ON ?auto_194712 ?auto_194713 ) ( CLEAR ?auto_194710 ) ( ON ?auto_194711 ?auto_194712 ) ( CLEAR ?auto_194711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194718 ?auto_194715 ?auto_194716 ?auto_194717 ?auto_194714 ?auto_194713 ?auto_194712 )
      ( MAKE-3PILE ?auto_194710 ?auto_194711 ?auto_194712 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194719 - BLOCK
      ?auto_194720 - BLOCK
      ?auto_194721 - BLOCK
    )
    :vars
    (
      ?auto_194726 - BLOCK
      ?auto_194722 - BLOCK
      ?auto_194725 - BLOCK
      ?auto_194724 - BLOCK
      ?auto_194727 - BLOCK
      ?auto_194723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194719 ?auto_194720 ) ) ( not ( = ?auto_194719 ?auto_194721 ) ) ( not ( = ?auto_194719 ?auto_194726 ) ) ( not ( = ?auto_194720 ?auto_194721 ) ) ( not ( = ?auto_194720 ?auto_194726 ) ) ( not ( = ?auto_194721 ?auto_194726 ) ) ( not ( = ?auto_194719 ?auto_194722 ) ) ( not ( = ?auto_194719 ?auto_194725 ) ) ( not ( = ?auto_194720 ?auto_194722 ) ) ( not ( = ?auto_194720 ?auto_194725 ) ) ( not ( = ?auto_194721 ?auto_194722 ) ) ( not ( = ?auto_194721 ?auto_194725 ) ) ( not ( = ?auto_194726 ?auto_194722 ) ) ( not ( = ?auto_194726 ?auto_194725 ) ) ( not ( = ?auto_194722 ?auto_194725 ) ) ( not ( = ?auto_194724 ?auto_194727 ) ) ( not ( = ?auto_194724 ?auto_194725 ) ) ( not ( = ?auto_194727 ?auto_194725 ) ) ( not ( = ?auto_194719 ?auto_194727 ) ) ( not ( = ?auto_194719 ?auto_194724 ) ) ( not ( = ?auto_194720 ?auto_194727 ) ) ( not ( = ?auto_194720 ?auto_194724 ) ) ( not ( = ?auto_194721 ?auto_194727 ) ) ( not ( = ?auto_194721 ?auto_194724 ) ) ( not ( = ?auto_194726 ?auto_194727 ) ) ( not ( = ?auto_194726 ?auto_194724 ) ) ( not ( = ?auto_194722 ?auto_194727 ) ) ( not ( = ?auto_194722 ?auto_194724 ) ) ( ON ?auto_194724 ?auto_194723 ) ( not ( = ?auto_194719 ?auto_194723 ) ) ( not ( = ?auto_194720 ?auto_194723 ) ) ( not ( = ?auto_194721 ?auto_194723 ) ) ( not ( = ?auto_194726 ?auto_194723 ) ) ( not ( = ?auto_194722 ?auto_194723 ) ) ( not ( = ?auto_194725 ?auto_194723 ) ) ( not ( = ?auto_194724 ?auto_194723 ) ) ( not ( = ?auto_194727 ?auto_194723 ) ) ( ON ?auto_194727 ?auto_194724 ) ( ON-TABLE ?auto_194723 ) ( ON ?auto_194725 ?auto_194727 ) ( ON ?auto_194722 ?auto_194725 ) ( ON ?auto_194726 ?auto_194722 ) ( ON ?auto_194721 ?auto_194726 ) ( ON ?auto_194720 ?auto_194721 ) ( CLEAR ?auto_194720 ) ( HOLDING ?auto_194719 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194719 )
      ( MAKE-3PILE ?auto_194719 ?auto_194720 ?auto_194721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_194728 - BLOCK
      ?auto_194729 - BLOCK
      ?auto_194730 - BLOCK
    )
    :vars
    (
      ?auto_194732 - BLOCK
      ?auto_194736 - BLOCK
      ?auto_194731 - BLOCK
      ?auto_194733 - BLOCK
      ?auto_194735 - BLOCK
      ?auto_194734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194728 ?auto_194729 ) ) ( not ( = ?auto_194728 ?auto_194730 ) ) ( not ( = ?auto_194728 ?auto_194732 ) ) ( not ( = ?auto_194729 ?auto_194730 ) ) ( not ( = ?auto_194729 ?auto_194732 ) ) ( not ( = ?auto_194730 ?auto_194732 ) ) ( not ( = ?auto_194728 ?auto_194736 ) ) ( not ( = ?auto_194728 ?auto_194731 ) ) ( not ( = ?auto_194729 ?auto_194736 ) ) ( not ( = ?auto_194729 ?auto_194731 ) ) ( not ( = ?auto_194730 ?auto_194736 ) ) ( not ( = ?auto_194730 ?auto_194731 ) ) ( not ( = ?auto_194732 ?auto_194736 ) ) ( not ( = ?auto_194732 ?auto_194731 ) ) ( not ( = ?auto_194736 ?auto_194731 ) ) ( not ( = ?auto_194733 ?auto_194735 ) ) ( not ( = ?auto_194733 ?auto_194731 ) ) ( not ( = ?auto_194735 ?auto_194731 ) ) ( not ( = ?auto_194728 ?auto_194735 ) ) ( not ( = ?auto_194728 ?auto_194733 ) ) ( not ( = ?auto_194729 ?auto_194735 ) ) ( not ( = ?auto_194729 ?auto_194733 ) ) ( not ( = ?auto_194730 ?auto_194735 ) ) ( not ( = ?auto_194730 ?auto_194733 ) ) ( not ( = ?auto_194732 ?auto_194735 ) ) ( not ( = ?auto_194732 ?auto_194733 ) ) ( not ( = ?auto_194736 ?auto_194735 ) ) ( not ( = ?auto_194736 ?auto_194733 ) ) ( ON ?auto_194733 ?auto_194734 ) ( not ( = ?auto_194728 ?auto_194734 ) ) ( not ( = ?auto_194729 ?auto_194734 ) ) ( not ( = ?auto_194730 ?auto_194734 ) ) ( not ( = ?auto_194732 ?auto_194734 ) ) ( not ( = ?auto_194736 ?auto_194734 ) ) ( not ( = ?auto_194731 ?auto_194734 ) ) ( not ( = ?auto_194733 ?auto_194734 ) ) ( not ( = ?auto_194735 ?auto_194734 ) ) ( ON ?auto_194735 ?auto_194733 ) ( ON-TABLE ?auto_194734 ) ( ON ?auto_194731 ?auto_194735 ) ( ON ?auto_194736 ?auto_194731 ) ( ON ?auto_194732 ?auto_194736 ) ( ON ?auto_194730 ?auto_194732 ) ( ON ?auto_194729 ?auto_194730 ) ( ON ?auto_194728 ?auto_194729 ) ( CLEAR ?auto_194728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_194734 ?auto_194733 ?auto_194735 ?auto_194731 ?auto_194736 ?auto_194732 ?auto_194730 ?auto_194729 )
      ( MAKE-3PILE ?auto_194728 ?auto_194729 ?auto_194730 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194742 - BLOCK
      ?auto_194743 - BLOCK
      ?auto_194744 - BLOCK
      ?auto_194745 - BLOCK
      ?auto_194746 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_194746 ) ( CLEAR ?auto_194745 ) ( ON-TABLE ?auto_194742 ) ( ON ?auto_194743 ?auto_194742 ) ( ON ?auto_194744 ?auto_194743 ) ( ON ?auto_194745 ?auto_194744 ) ( not ( = ?auto_194742 ?auto_194743 ) ) ( not ( = ?auto_194742 ?auto_194744 ) ) ( not ( = ?auto_194742 ?auto_194745 ) ) ( not ( = ?auto_194742 ?auto_194746 ) ) ( not ( = ?auto_194743 ?auto_194744 ) ) ( not ( = ?auto_194743 ?auto_194745 ) ) ( not ( = ?auto_194743 ?auto_194746 ) ) ( not ( = ?auto_194744 ?auto_194745 ) ) ( not ( = ?auto_194744 ?auto_194746 ) ) ( not ( = ?auto_194745 ?auto_194746 ) ) )
    :subtasks
    ( ( !STACK ?auto_194746 ?auto_194745 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194747 - BLOCK
      ?auto_194748 - BLOCK
      ?auto_194749 - BLOCK
      ?auto_194750 - BLOCK
      ?auto_194751 - BLOCK
    )
    :vars
    (
      ?auto_194752 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_194750 ) ( ON-TABLE ?auto_194747 ) ( ON ?auto_194748 ?auto_194747 ) ( ON ?auto_194749 ?auto_194748 ) ( ON ?auto_194750 ?auto_194749 ) ( not ( = ?auto_194747 ?auto_194748 ) ) ( not ( = ?auto_194747 ?auto_194749 ) ) ( not ( = ?auto_194747 ?auto_194750 ) ) ( not ( = ?auto_194747 ?auto_194751 ) ) ( not ( = ?auto_194748 ?auto_194749 ) ) ( not ( = ?auto_194748 ?auto_194750 ) ) ( not ( = ?auto_194748 ?auto_194751 ) ) ( not ( = ?auto_194749 ?auto_194750 ) ) ( not ( = ?auto_194749 ?auto_194751 ) ) ( not ( = ?auto_194750 ?auto_194751 ) ) ( ON ?auto_194751 ?auto_194752 ) ( CLEAR ?auto_194751 ) ( HAND-EMPTY ) ( not ( = ?auto_194747 ?auto_194752 ) ) ( not ( = ?auto_194748 ?auto_194752 ) ) ( not ( = ?auto_194749 ?auto_194752 ) ) ( not ( = ?auto_194750 ?auto_194752 ) ) ( not ( = ?auto_194751 ?auto_194752 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194751 ?auto_194752 )
      ( MAKE-5PILE ?auto_194747 ?auto_194748 ?auto_194749 ?auto_194750 ?auto_194751 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194753 - BLOCK
      ?auto_194754 - BLOCK
      ?auto_194755 - BLOCK
      ?auto_194756 - BLOCK
      ?auto_194757 - BLOCK
    )
    :vars
    (
      ?auto_194758 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194753 ) ( ON ?auto_194754 ?auto_194753 ) ( ON ?auto_194755 ?auto_194754 ) ( not ( = ?auto_194753 ?auto_194754 ) ) ( not ( = ?auto_194753 ?auto_194755 ) ) ( not ( = ?auto_194753 ?auto_194756 ) ) ( not ( = ?auto_194753 ?auto_194757 ) ) ( not ( = ?auto_194754 ?auto_194755 ) ) ( not ( = ?auto_194754 ?auto_194756 ) ) ( not ( = ?auto_194754 ?auto_194757 ) ) ( not ( = ?auto_194755 ?auto_194756 ) ) ( not ( = ?auto_194755 ?auto_194757 ) ) ( not ( = ?auto_194756 ?auto_194757 ) ) ( ON ?auto_194757 ?auto_194758 ) ( CLEAR ?auto_194757 ) ( not ( = ?auto_194753 ?auto_194758 ) ) ( not ( = ?auto_194754 ?auto_194758 ) ) ( not ( = ?auto_194755 ?auto_194758 ) ) ( not ( = ?auto_194756 ?auto_194758 ) ) ( not ( = ?auto_194757 ?auto_194758 ) ) ( HOLDING ?auto_194756 ) ( CLEAR ?auto_194755 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194753 ?auto_194754 ?auto_194755 ?auto_194756 )
      ( MAKE-5PILE ?auto_194753 ?auto_194754 ?auto_194755 ?auto_194756 ?auto_194757 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194759 - BLOCK
      ?auto_194760 - BLOCK
      ?auto_194761 - BLOCK
      ?auto_194762 - BLOCK
      ?auto_194763 - BLOCK
    )
    :vars
    (
      ?auto_194764 - BLOCK
      ?auto_194765 - BLOCK
      ?auto_194766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194759 ) ( ON ?auto_194760 ?auto_194759 ) ( ON ?auto_194761 ?auto_194760 ) ( not ( = ?auto_194759 ?auto_194760 ) ) ( not ( = ?auto_194759 ?auto_194761 ) ) ( not ( = ?auto_194759 ?auto_194762 ) ) ( not ( = ?auto_194759 ?auto_194763 ) ) ( not ( = ?auto_194760 ?auto_194761 ) ) ( not ( = ?auto_194760 ?auto_194762 ) ) ( not ( = ?auto_194760 ?auto_194763 ) ) ( not ( = ?auto_194761 ?auto_194762 ) ) ( not ( = ?auto_194761 ?auto_194763 ) ) ( not ( = ?auto_194762 ?auto_194763 ) ) ( ON ?auto_194763 ?auto_194764 ) ( not ( = ?auto_194759 ?auto_194764 ) ) ( not ( = ?auto_194760 ?auto_194764 ) ) ( not ( = ?auto_194761 ?auto_194764 ) ) ( not ( = ?auto_194762 ?auto_194764 ) ) ( not ( = ?auto_194763 ?auto_194764 ) ) ( CLEAR ?auto_194761 ) ( ON ?auto_194762 ?auto_194763 ) ( CLEAR ?auto_194762 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194765 ) ( ON ?auto_194766 ?auto_194765 ) ( ON ?auto_194764 ?auto_194766 ) ( not ( = ?auto_194765 ?auto_194766 ) ) ( not ( = ?auto_194765 ?auto_194764 ) ) ( not ( = ?auto_194765 ?auto_194763 ) ) ( not ( = ?auto_194765 ?auto_194762 ) ) ( not ( = ?auto_194766 ?auto_194764 ) ) ( not ( = ?auto_194766 ?auto_194763 ) ) ( not ( = ?auto_194766 ?auto_194762 ) ) ( not ( = ?auto_194759 ?auto_194765 ) ) ( not ( = ?auto_194759 ?auto_194766 ) ) ( not ( = ?auto_194760 ?auto_194765 ) ) ( not ( = ?auto_194760 ?auto_194766 ) ) ( not ( = ?auto_194761 ?auto_194765 ) ) ( not ( = ?auto_194761 ?auto_194766 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194765 ?auto_194766 ?auto_194764 ?auto_194763 )
      ( MAKE-5PILE ?auto_194759 ?auto_194760 ?auto_194761 ?auto_194762 ?auto_194763 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194767 - BLOCK
      ?auto_194768 - BLOCK
      ?auto_194769 - BLOCK
      ?auto_194770 - BLOCK
      ?auto_194771 - BLOCK
    )
    :vars
    (
      ?auto_194773 - BLOCK
      ?auto_194774 - BLOCK
      ?auto_194772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194767 ) ( ON ?auto_194768 ?auto_194767 ) ( not ( = ?auto_194767 ?auto_194768 ) ) ( not ( = ?auto_194767 ?auto_194769 ) ) ( not ( = ?auto_194767 ?auto_194770 ) ) ( not ( = ?auto_194767 ?auto_194771 ) ) ( not ( = ?auto_194768 ?auto_194769 ) ) ( not ( = ?auto_194768 ?auto_194770 ) ) ( not ( = ?auto_194768 ?auto_194771 ) ) ( not ( = ?auto_194769 ?auto_194770 ) ) ( not ( = ?auto_194769 ?auto_194771 ) ) ( not ( = ?auto_194770 ?auto_194771 ) ) ( ON ?auto_194771 ?auto_194773 ) ( not ( = ?auto_194767 ?auto_194773 ) ) ( not ( = ?auto_194768 ?auto_194773 ) ) ( not ( = ?auto_194769 ?auto_194773 ) ) ( not ( = ?auto_194770 ?auto_194773 ) ) ( not ( = ?auto_194771 ?auto_194773 ) ) ( ON ?auto_194770 ?auto_194771 ) ( CLEAR ?auto_194770 ) ( ON-TABLE ?auto_194774 ) ( ON ?auto_194772 ?auto_194774 ) ( ON ?auto_194773 ?auto_194772 ) ( not ( = ?auto_194774 ?auto_194772 ) ) ( not ( = ?auto_194774 ?auto_194773 ) ) ( not ( = ?auto_194774 ?auto_194771 ) ) ( not ( = ?auto_194774 ?auto_194770 ) ) ( not ( = ?auto_194772 ?auto_194773 ) ) ( not ( = ?auto_194772 ?auto_194771 ) ) ( not ( = ?auto_194772 ?auto_194770 ) ) ( not ( = ?auto_194767 ?auto_194774 ) ) ( not ( = ?auto_194767 ?auto_194772 ) ) ( not ( = ?auto_194768 ?auto_194774 ) ) ( not ( = ?auto_194768 ?auto_194772 ) ) ( not ( = ?auto_194769 ?auto_194774 ) ) ( not ( = ?auto_194769 ?auto_194772 ) ) ( HOLDING ?auto_194769 ) ( CLEAR ?auto_194768 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194767 ?auto_194768 ?auto_194769 )
      ( MAKE-5PILE ?auto_194767 ?auto_194768 ?auto_194769 ?auto_194770 ?auto_194771 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194775 - BLOCK
      ?auto_194776 - BLOCK
      ?auto_194777 - BLOCK
      ?auto_194778 - BLOCK
      ?auto_194779 - BLOCK
    )
    :vars
    (
      ?auto_194780 - BLOCK
      ?auto_194782 - BLOCK
      ?auto_194781 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194775 ) ( ON ?auto_194776 ?auto_194775 ) ( not ( = ?auto_194775 ?auto_194776 ) ) ( not ( = ?auto_194775 ?auto_194777 ) ) ( not ( = ?auto_194775 ?auto_194778 ) ) ( not ( = ?auto_194775 ?auto_194779 ) ) ( not ( = ?auto_194776 ?auto_194777 ) ) ( not ( = ?auto_194776 ?auto_194778 ) ) ( not ( = ?auto_194776 ?auto_194779 ) ) ( not ( = ?auto_194777 ?auto_194778 ) ) ( not ( = ?auto_194777 ?auto_194779 ) ) ( not ( = ?auto_194778 ?auto_194779 ) ) ( ON ?auto_194779 ?auto_194780 ) ( not ( = ?auto_194775 ?auto_194780 ) ) ( not ( = ?auto_194776 ?auto_194780 ) ) ( not ( = ?auto_194777 ?auto_194780 ) ) ( not ( = ?auto_194778 ?auto_194780 ) ) ( not ( = ?auto_194779 ?auto_194780 ) ) ( ON ?auto_194778 ?auto_194779 ) ( ON-TABLE ?auto_194782 ) ( ON ?auto_194781 ?auto_194782 ) ( ON ?auto_194780 ?auto_194781 ) ( not ( = ?auto_194782 ?auto_194781 ) ) ( not ( = ?auto_194782 ?auto_194780 ) ) ( not ( = ?auto_194782 ?auto_194779 ) ) ( not ( = ?auto_194782 ?auto_194778 ) ) ( not ( = ?auto_194781 ?auto_194780 ) ) ( not ( = ?auto_194781 ?auto_194779 ) ) ( not ( = ?auto_194781 ?auto_194778 ) ) ( not ( = ?auto_194775 ?auto_194782 ) ) ( not ( = ?auto_194775 ?auto_194781 ) ) ( not ( = ?auto_194776 ?auto_194782 ) ) ( not ( = ?auto_194776 ?auto_194781 ) ) ( not ( = ?auto_194777 ?auto_194782 ) ) ( not ( = ?auto_194777 ?auto_194781 ) ) ( CLEAR ?auto_194776 ) ( ON ?auto_194777 ?auto_194778 ) ( CLEAR ?auto_194777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194782 ?auto_194781 ?auto_194780 ?auto_194779 ?auto_194778 )
      ( MAKE-5PILE ?auto_194775 ?auto_194776 ?auto_194777 ?auto_194778 ?auto_194779 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194783 - BLOCK
      ?auto_194784 - BLOCK
      ?auto_194785 - BLOCK
      ?auto_194786 - BLOCK
      ?auto_194787 - BLOCK
    )
    :vars
    (
      ?auto_194790 - BLOCK
      ?auto_194788 - BLOCK
      ?auto_194789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194783 ) ( not ( = ?auto_194783 ?auto_194784 ) ) ( not ( = ?auto_194783 ?auto_194785 ) ) ( not ( = ?auto_194783 ?auto_194786 ) ) ( not ( = ?auto_194783 ?auto_194787 ) ) ( not ( = ?auto_194784 ?auto_194785 ) ) ( not ( = ?auto_194784 ?auto_194786 ) ) ( not ( = ?auto_194784 ?auto_194787 ) ) ( not ( = ?auto_194785 ?auto_194786 ) ) ( not ( = ?auto_194785 ?auto_194787 ) ) ( not ( = ?auto_194786 ?auto_194787 ) ) ( ON ?auto_194787 ?auto_194790 ) ( not ( = ?auto_194783 ?auto_194790 ) ) ( not ( = ?auto_194784 ?auto_194790 ) ) ( not ( = ?auto_194785 ?auto_194790 ) ) ( not ( = ?auto_194786 ?auto_194790 ) ) ( not ( = ?auto_194787 ?auto_194790 ) ) ( ON ?auto_194786 ?auto_194787 ) ( ON-TABLE ?auto_194788 ) ( ON ?auto_194789 ?auto_194788 ) ( ON ?auto_194790 ?auto_194789 ) ( not ( = ?auto_194788 ?auto_194789 ) ) ( not ( = ?auto_194788 ?auto_194790 ) ) ( not ( = ?auto_194788 ?auto_194787 ) ) ( not ( = ?auto_194788 ?auto_194786 ) ) ( not ( = ?auto_194789 ?auto_194790 ) ) ( not ( = ?auto_194789 ?auto_194787 ) ) ( not ( = ?auto_194789 ?auto_194786 ) ) ( not ( = ?auto_194783 ?auto_194788 ) ) ( not ( = ?auto_194783 ?auto_194789 ) ) ( not ( = ?auto_194784 ?auto_194788 ) ) ( not ( = ?auto_194784 ?auto_194789 ) ) ( not ( = ?auto_194785 ?auto_194788 ) ) ( not ( = ?auto_194785 ?auto_194789 ) ) ( ON ?auto_194785 ?auto_194786 ) ( CLEAR ?auto_194785 ) ( HOLDING ?auto_194784 ) ( CLEAR ?auto_194783 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194783 ?auto_194784 )
      ( MAKE-5PILE ?auto_194783 ?auto_194784 ?auto_194785 ?auto_194786 ?auto_194787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194791 - BLOCK
      ?auto_194792 - BLOCK
      ?auto_194793 - BLOCK
      ?auto_194794 - BLOCK
      ?auto_194795 - BLOCK
    )
    :vars
    (
      ?auto_194797 - BLOCK
      ?auto_194796 - BLOCK
      ?auto_194798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_194791 ) ( not ( = ?auto_194791 ?auto_194792 ) ) ( not ( = ?auto_194791 ?auto_194793 ) ) ( not ( = ?auto_194791 ?auto_194794 ) ) ( not ( = ?auto_194791 ?auto_194795 ) ) ( not ( = ?auto_194792 ?auto_194793 ) ) ( not ( = ?auto_194792 ?auto_194794 ) ) ( not ( = ?auto_194792 ?auto_194795 ) ) ( not ( = ?auto_194793 ?auto_194794 ) ) ( not ( = ?auto_194793 ?auto_194795 ) ) ( not ( = ?auto_194794 ?auto_194795 ) ) ( ON ?auto_194795 ?auto_194797 ) ( not ( = ?auto_194791 ?auto_194797 ) ) ( not ( = ?auto_194792 ?auto_194797 ) ) ( not ( = ?auto_194793 ?auto_194797 ) ) ( not ( = ?auto_194794 ?auto_194797 ) ) ( not ( = ?auto_194795 ?auto_194797 ) ) ( ON ?auto_194794 ?auto_194795 ) ( ON-TABLE ?auto_194796 ) ( ON ?auto_194798 ?auto_194796 ) ( ON ?auto_194797 ?auto_194798 ) ( not ( = ?auto_194796 ?auto_194798 ) ) ( not ( = ?auto_194796 ?auto_194797 ) ) ( not ( = ?auto_194796 ?auto_194795 ) ) ( not ( = ?auto_194796 ?auto_194794 ) ) ( not ( = ?auto_194798 ?auto_194797 ) ) ( not ( = ?auto_194798 ?auto_194795 ) ) ( not ( = ?auto_194798 ?auto_194794 ) ) ( not ( = ?auto_194791 ?auto_194796 ) ) ( not ( = ?auto_194791 ?auto_194798 ) ) ( not ( = ?auto_194792 ?auto_194796 ) ) ( not ( = ?auto_194792 ?auto_194798 ) ) ( not ( = ?auto_194793 ?auto_194796 ) ) ( not ( = ?auto_194793 ?auto_194798 ) ) ( ON ?auto_194793 ?auto_194794 ) ( CLEAR ?auto_194791 ) ( ON ?auto_194792 ?auto_194793 ) ( CLEAR ?auto_194792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194796 ?auto_194798 ?auto_194797 ?auto_194795 ?auto_194794 ?auto_194793 )
      ( MAKE-5PILE ?auto_194791 ?auto_194792 ?auto_194793 ?auto_194794 ?auto_194795 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194799 - BLOCK
      ?auto_194800 - BLOCK
      ?auto_194801 - BLOCK
      ?auto_194802 - BLOCK
      ?auto_194803 - BLOCK
    )
    :vars
    (
      ?auto_194805 - BLOCK
      ?auto_194804 - BLOCK
      ?auto_194806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194799 ?auto_194800 ) ) ( not ( = ?auto_194799 ?auto_194801 ) ) ( not ( = ?auto_194799 ?auto_194802 ) ) ( not ( = ?auto_194799 ?auto_194803 ) ) ( not ( = ?auto_194800 ?auto_194801 ) ) ( not ( = ?auto_194800 ?auto_194802 ) ) ( not ( = ?auto_194800 ?auto_194803 ) ) ( not ( = ?auto_194801 ?auto_194802 ) ) ( not ( = ?auto_194801 ?auto_194803 ) ) ( not ( = ?auto_194802 ?auto_194803 ) ) ( ON ?auto_194803 ?auto_194805 ) ( not ( = ?auto_194799 ?auto_194805 ) ) ( not ( = ?auto_194800 ?auto_194805 ) ) ( not ( = ?auto_194801 ?auto_194805 ) ) ( not ( = ?auto_194802 ?auto_194805 ) ) ( not ( = ?auto_194803 ?auto_194805 ) ) ( ON ?auto_194802 ?auto_194803 ) ( ON-TABLE ?auto_194804 ) ( ON ?auto_194806 ?auto_194804 ) ( ON ?auto_194805 ?auto_194806 ) ( not ( = ?auto_194804 ?auto_194806 ) ) ( not ( = ?auto_194804 ?auto_194805 ) ) ( not ( = ?auto_194804 ?auto_194803 ) ) ( not ( = ?auto_194804 ?auto_194802 ) ) ( not ( = ?auto_194806 ?auto_194805 ) ) ( not ( = ?auto_194806 ?auto_194803 ) ) ( not ( = ?auto_194806 ?auto_194802 ) ) ( not ( = ?auto_194799 ?auto_194804 ) ) ( not ( = ?auto_194799 ?auto_194806 ) ) ( not ( = ?auto_194800 ?auto_194804 ) ) ( not ( = ?auto_194800 ?auto_194806 ) ) ( not ( = ?auto_194801 ?auto_194804 ) ) ( not ( = ?auto_194801 ?auto_194806 ) ) ( ON ?auto_194801 ?auto_194802 ) ( ON ?auto_194800 ?auto_194801 ) ( CLEAR ?auto_194800 ) ( HOLDING ?auto_194799 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194799 )
      ( MAKE-5PILE ?auto_194799 ?auto_194800 ?auto_194801 ?auto_194802 ?auto_194803 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194807 - BLOCK
      ?auto_194808 - BLOCK
      ?auto_194809 - BLOCK
      ?auto_194810 - BLOCK
      ?auto_194811 - BLOCK
    )
    :vars
    (
      ?auto_194814 - BLOCK
      ?auto_194812 - BLOCK
      ?auto_194813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194807 ?auto_194808 ) ) ( not ( = ?auto_194807 ?auto_194809 ) ) ( not ( = ?auto_194807 ?auto_194810 ) ) ( not ( = ?auto_194807 ?auto_194811 ) ) ( not ( = ?auto_194808 ?auto_194809 ) ) ( not ( = ?auto_194808 ?auto_194810 ) ) ( not ( = ?auto_194808 ?auto_194811 ) ) ( not ( = ?auto_194809 ?auto_194810 ) ) ( not ( = ?auto_194809 ?auto_194811 ) ) ( not ( = ?auto_194810 ?auto_194811 ) ) ( ON ?auto_194811 ?auto_194814 ) ( not ( = ?auto_194807 ?auto_194814 ) ) ( not ( = ?auto_194808 ?auto_194814 ) ) ( not ( = ?auto_194809 ?auto_194814 ) ) ( not ( = ?auto_194810 ?auto_194814 ) ) ( not ( = ?auto_194811 ?auto_194814 ) ) ( ON ?auto_194810 ?auto_194811 ) ( ON-TABLE ?auto_194812 ) ( ON ?auto_194813 ?auto_194812 ) ( ON ?auto_194814 ?auto_194813 ) ( not ( = ?auto_194812 ?auto_194813 ) ) ( not ( = ?auto_194812 ?auto_194814 ) ) ( not ( = ?auto_194812 ?auto_194811 ) ) ( not ( = ?auto_194812 ?auto_194810 ) ) ( not ( = ?auto_194813 ?auto_194814 ) ) ( not ( = ?auto_194813 ?auto_194811 ) ) ( not ( = ?auto_194813 ?auto_194810 ) ) ( not ( = ?auto_194807 ?auto_194812 ) ) ( not ( = ?auto_194807 ?auto_194813 ) ) ( not ( = ?auto_194808 ?auto_194812 ) ) ( not ( = ?auto_194808 ?auto_194813 ) ) ( not ( = ?auto_194809 ?auto_194812 ) ) ( not ( = ?auto_194809 ?auto_194813 ) ) ( ON ?auto_194809 ?auto_194810 ) ( ON ?auto_194808 ?auto_194809 ) ( ON ?auto_194807 ?auto_194808 ) ( CLEAR ?auto_194807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194812 ?auto_194813 ?auto_194814 ?auto_194811 ?auto_194810 ?auto_194809 ?auto_194808 )
      ( MAKE-5PILE ?auto_194807 ?auto_194808 ?auto_194809 ?auto_194810 ?auto_194811 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194815 - BLOCK
      ?auto_194816 - BLOCK
      ?auto_194817 - BLOCK
      ?auto_194818 - BLOCK
      ?auto_194819 - BLOCK
    )
    :vars
    (
      ?auto_194821 - BLOCK
      ?auto_194822 - BLOCK
      ?auto_194820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194815 ?auto_194816 ) ) ( not ( = ?auto_194815 ?auto_194817 ) ) ( not ( = ?auto_194815 ?auto_194818 ) ) ( not ( = ?auto_194815 ?auto_194819 ) ) ( not ( = ?auto_194816 ?auto_194817 ) ) ( not ( = ?auto_194816 ?auto_194818 ) ) ( not ( = ?auto_194816 ?auto_194819 ) ) ( not ( = ?auto_194817 ?auto_194818 ) ) ( not ( = ?auto_194817 ?auto_194819 ) ) ( not ( = ?auto_194818 ?auto_194819 ) ) ( ON ?auto_194819 ?auto_194821 ) ( not ( = ?auto_194815 ?auto_194821 ) ) ( not ( = ?auto_194816 ?auto_194821 ) ) ( not ( = ?auto_194817 ?auto_194821 ) ) ( not ( = ?auto_194818 ?auto_194821 ) ) ( not ( = ?auto_194819 ?auto_194821 ) ) ( ON ?auto_194818 ?auto_194819 ) ( ON-TABLE ?auto_194822 ) ( ON ?auto_194820 ?auto_194822 ) ( ON ?auto_194821 ?auto_194820 ) ( not ( = ?auto_194822 ?auto_194820 ) ) ( not ( = ?auto_194822 ?auto_194821 ) ) ( not ( = ?auto_194822 ?auto_194819 ) ) ( not ( = ?auto_194822 ?auto_194818 ) ) ( not ( = ?auto_194820 ?auto_194821 ) ) ( not ( = ?auto_194820 ?auto_194819 ) ) ( not ( = ?auto_194820 ?auto_194818 ) ) ( not ( = ?auto_194815 ?auto_194822 ) ) ( not ( = ?auto_194815 ?auto_194820 ) ) ( not ( = ?auto_194816 ?auto_194822 ) ) ( not ( = ?auto_194816 ?auto_194820 ) ) ( not ( = ?auto_194817 ?auto_194822 ) ) ( not ( = ?auto_194817 ?auto_194820 ) ) ( ON ?auto_194817 ?auto_194818 ) ( ON ?auto_194816 ?auto_194817 ) ( HOLDING ?auto_194815 ) ( CLEAR ?auto_194816 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_194822 ?auto_194820 ?auto_194821 ?auto_194819 ?auto_194818 ?auto_194817 ?auto_194816 ?auto_194815 )
      ( MAKE-5PILE ?auto_194815 ?auto_194816 ?auto_194817 ?auto_194818 ?auto_194819 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194823 - BLOCK
      ?auto_194824 - BLOCK
      ?auto_194825 - BLOCK
      ?auto_194826 - BLOCK
      ?auto_194827 - BLOCK
    )
    :vars
    (
      ?auto_194829 - BLOCK
      ?auto_194830 - BLOCK
      ?auto_194828 - BLOCK
      ?auto_194831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194823 ?auto_194824 ) ) ( not ( = ?auto_194823 ?auto_194825 ) ) ( not ( = ?auto_194823 ?auto_194826 ) ) ( not ( = ?auto_194823 ?auto_194827 ) ) ( not ( = ?auto_194824 ?auto_194825 ) ) ( not ( = ?auto_194824 ?auto_194826 ) ) ( not ( = ?auto_194824 ?auto_194827 ) ) ( not ( = ?auto_194825 ?auto_194826 ) ) ( not ( = ?auto_194825 ?auto_194827 ) ) ( not ( = ?auto_194826 ?auto_194827 ) ) ( ON ?auto_194827 ?auto_194829 ) ( not ( = ?auto_194823 ?auto_194829 ) ) ( not ( = ?auto_194824 ?auto_194829 ) ) ( not ( = ?auto_194825 ?auto_194829 ) ) ( not ( = ?auto_194826 ?auto_194829 ) ) ( not ( = ?auto_194827 ?auto_194829 ) ) ( ON ?auto_194826 ?auto_194827 ) ( ON-TABLE ?auto_194830 ) ( ON ?auto_194828 ?auto_194830 ) ( ON ?auto_194829 ?auto_194828 ) ( not ( = ?auto_194830 ?auto_194828 ) ) ( not ( = ?auto_194830 ?auto_194829 ) ) ( not ( = ?auto_194830 ?auto_194827 ) ) ( not ( = ?auto_194830 ?auto_194826 ) ) ( not ( = ?auto_194828 ?auto_194829 ) ) ( not ( = ?auto_194828 ?auto_194827 ) ) ( not ( = ?auto_194828 ?auto_194826 ) ) ( not ( = ?auto_194823 ?auto_194830 ) ) ( not ( = ?auto_194823 ?auto_194828 ) ) ( not ( = ?auto_194824 ?auto_194830 ) ) ( not ( = ?auto_194824 ?auto_194828 ) ) ( not ( = ?auto_194825 ?auto_194830 ) ) ( not ( = ?auto_194825 ?auto_194828 ) ) ( ON ?auto_194825 ?auto_194826 ) ( ON ?auto_194824 ?auto_194825 ) ( CLEAR ?auto_194824 ) ( ON ?auto_194823 ?auto_194831 ) ( CLEAR ?auto_194823 ) ( HAND-EMPTY ) ( not ( = ?auto_194823 ?auto_194831 ) ) ( not ( = ?auto_194824 ?auto_194831 ) ) ( not ( = ?auto_194825 ?auto_194831 ) ) ( not ( = ?auto_194826 ?auto_194831 ) ) ( not ( = ?auto_194827 ?auto_194831 ) ) ( not ( = ?auto_194829 ?auto_194831 ) ) ( not ( = ?auto_194830 ?auto_194831 ) ) ( not ( = ?auto_194828 ?auto_194831 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194823 ?auto_194831 )
      ( MAKE-5PILE ?auto_194823 ?auto_194824 ?auto_194825 ?auto_194826 ?auto_194827 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194832 - BLOCK
      ?auto_194833 - BLOCK
      ?auto_194834 - BLOCK
      ?auto_194835 - BLOCK
      ?auto_194836 - BLOCK
    )
    :vars
    (
      ?auto_194840 - BLOCK
      ?auto_194839 - BLOCK
      ?auto_194837 - BLOCK
      ?auto_194838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194832 ?auto_194833 ) ) ( not ( = ?auto_194832 ?auto_194834 ) ) ( not ( = ?auto_194832 ?auto_194835 ) ) ( not ( = ?auto_194832 ?auto_194836 ) ) ( not ( = ?auto_194833 ?auto_194834 ) ) ( not ( = ?auto_194833 ?auto_194835 ) ) ( not ( = ?auto_194833 ?auto_194836 ) ) ( not ( = ?auto_194834 ?auto_194835 ) ) ( not ( = ?auto_194834 ?auto_194836 ) ) ( not ( = ?auto_194835 ?auto_194836 ) ) ( ON ?auto_194836 ?auto_194840 ) ( not ( = ?auto_194832 ?auto_194840 ) ) ( not ( = ?auto_194833 ?auto_194840 ) ) ( not ( = ?auto_194834 ?auto_194840 ) ) ( not ( = ?auto_194835 ?auto_194840 ) ) ( not ( = ?auto_194836 ?auto_194840 ) ) ( ON ?auto_194835 ?auto_194836 ) ( ON-TABLE ?auto_194839 ) ( ON ?auto_194837 ?auto_194839 ) ( ON ?auto_194840 ?auto_194837 ) ( not ( = ?auto_194839 ?auto_194837 ) ) ( not ( = ?auto_194839 ?auto_194840 ) ) ( not ( = ?auto_194839 ?auto_194836 ) ) ( not ( = ?auto_194839 ?auto_194835 ) ) ( not ( = ?auto_194837 ?auto_194840 ) ) ( not ( = ?auto_194837 ?auto_194836 ) ) ( not ( = ?auto_194837 ?auto_194835 ) ) ( not ( = ?auto_194832 ?auto_194839 ) ) ( not ( = ?auto_194832 ?auto_194837 ) ) ( not ( = ?auto_194833 ?auto_194839 ) ) ( not ( = ?auto_194833 ?auto_194837 ) ) ( not ( = ?auto_194834 ?auto_194839 ) ) ( not ( = ?auto_194834 ?auto_194837 ) ) ( ON ?auto_194834 ?auto_194835 ) ( ON ?auto_194832 ?auto_194838 ) ( CLEAR ?auto_194832 ) ( not ( = ?auto_194832 ?auto_194838 ) ) ( not ( = ?auto_194833 ?auto_194838 ) ) ( not ( = ?auto_194834 ?auto_194838 ) ) ( not ( = ?auto_194835 ?auto_194838 ) ) ( not ( = ?auto_194836 ?auto_194838 ) ) ( not ( = ?auto_194840 ?auto_194838 ) ) ( not ( = ?auto_194839 ?auto_194838 ) ) ( not ( = ?auto_194837 ?auto_194838 ) ) ( HOLDING ?auto_194833 ) ( CLEAR ?auto_194834 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194839 ?auto_194837 ?auto_194840 ?auto_194836 ?auto_194835 ?auto_194834 ?auto_194833 )
      ( MAKE-5PILE ?auto_194832 ?auto_194833 ?auto_194834 ?auto_194835 ?auto_194836 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194841 - BLOCK
      ?auto_194842 - BLOCK
      ?auto_194843 - BLOCK
      ?auto_194844 - BLOCK
      ?auto_194845 - BLOCK
    )
    :vars
    (
      ?auto_194846 - BLOCK
      ?auto_194849 - BLOCK
      ?auto_194847 - BLOCK
      ?auto_194848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194841 ?auto_194842 ) ) ( not ( = ?auto_194841 ?auto_194843 ) ) ( not ( = ?auto_194841 ?auto_194844 ) ) ( not ( = ?auto_194841 ?auto_194845 ) ) ( not ( = ?auto_194842 ?auto_194843 ) ) ( not ( = ?auto_194842 ?auto_194844 ) ) ( not ( = ?auto_194842 ?auto_194845 ) ) ( not ( = ?auto_194843 ?auto_194844 ) ) ( not ( = ?auto_194843 ?auto_194845 ) ) ( not ( = ?auto_194844 ?auto_194845 ) ) ( ON ?auto_194845 ?auto_194846 ) ( not ( = ?auto_194841 ?auto_194846 ) ) ( not ( = ?auto_194842 ?auto_194846 ) ) ( not ( = ?auto_194843 ?auto_194846 ) ) ( not ( = ?auto_194844 ?auto_194846 ) ) ( not ( = ?auto_194845 ?auto_194846 ) ) ( ON ?auto_194844 ?auto_194845 ) ( ON-TABLE ?auto_194849 ) ( ON ?auto_194847 ?auto_194849 ) ( ON ?auto_194846 ?auto_194847 ) ( not ( = ?auto_194849 ?auto_194847 ) ) ( not ( = ?auto_194849 ?auto_194846 ) ) ( not ( = ?auto_194849 ?auto_194845 ) ) ( not ( = ?auto_194849 ?auto_194844 ) ) ( not ( = ?auto_194847 ?auto_194846 ) ) ( not ( = ?auto_194847 ?auto_194845 ) ) ( not ( = ?auto_194847 ?auto_194844 ) ) ( not ( = ?auto_194841 ?auto_194849 ) ) ( not ( = ?auto_194841 ?auto_194847 ) ) ( not ( = ?auto_194842 ?auto_194849 ) ) ( not ( = ?auto_194842 ?auto_194847 ) ) ( not ( = ?auto_194843 ?auto_194849 ) ) ( not ( = ?auto_194843 ?auto_194847 ) ) ( ON ?auto_194843 ?auto_194844 ) ( ON ?auto_194841 ?auto_194848 ) ( not ( = ?auto_194841 ?auto_194848 ) ) ( not ( = ?auto_194842 ?auto_194848 ) ) ( not ( = ?auto_194843 ?auto_194848 ) ) ( not ( = ?auto_194844 ?auto_194848 ) ) ( not ( = ?auto_194845 ?auto_194848 ) ) ( not ( = ?auto_194846 ?auto_194848 ) ) ( not ( = ?auto_194849 ?auto_194848 ) ) ( not ( = ?auto_194847 ?auto_194848 ) ) ( CLEAR ?auto_194843 ) ( ON ?auto_194842 ?auto_194841 ) ( CLEAR ?auto_194842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194848 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194848 ?auto_194841 )
      ( MAKE-5PILE ?auto_194841 ?auto_194842 ?auto_194843 ?auto_194844 ?auto_194845 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194850 - BLOCK
      ?auto_194851 - BLOCK
      ?auto_194852 - BLOCK
      ?auto_194853 - BLOCK
      ?auto_194854 - BLOCK
    )
    :vars
    (
      ?auto_194857 - BLOCK
      ?auto_194858 - BLOCK
      ?auto_194855 - BLOCK
      ?auto_194856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194850 ?auto_194851 ) ) ( not ( = ?auto_194850 ?auto_194852 ) ) ( not ( = ?auto_194850 ?auto_194853 ) ) ( not ( = ?auto_194850 ?auto_194854 ) ) ( not ( = ?auto_194851 ?auto_194852 ) ) ( not ( = ?auto_194851 ?auto_194853 ) ) ( not ( = ?auto_194851 ?auto_194854 ) ) ( not ( = ?auto_194852 ?auto_194853 ) ) ( not ( = ?auto_194852 ?auto_194854 ) ) ( not ( = ?auto_194853 ?auto_194854 ) ) ( ON ?auto_194854 ?auto_194857 ) ( not ( = ?auto_194850 ?auto_194857 ) ) ( not ( = ?auto_194851 ?auto_194857 ) ) ( not ( = ?auto_194852 ?auto_194857 ) ) ( not ( = ?auto_194853 ?auto_194857 ) ) ( not ( = ?auto_194854 ?auto_194857 ) ) ( ON ?auto_194853 ?auto_194854 ) ( ON-TABLE ?auto_194858 ) ( ON ?auto_194855 ?auto_194858 ) ( ON ?auto_194857 ?auto_194855 ) ( not ( = ?auto_194858 ?auto_194855 ) ) ( not ( = ?auto_194858 ?auto_194857 ) ) ( not ( = ?auto_194858 ?auto_194854 ) ) ( not ( = ?auto_194858 ?auto_194853 ) ) ( not ( = ?auto_194855 ?auto_194857 ) ) ( not ( = ?auto_194855 ?auto_194854 ) ) ( not ( = ?auto_194855 ?auto_194853 ) ) ( not ( = ?auto_194850 ?auto_194858 ) ) ( not ( = ?auto_194850 ?auto_194855 ) ) ( not ( = ?auto_194851 ?auto_194858 ) ) ( not ( = ?auto_194851 ?auto_194855 ) ) ( not ( = ?auto_194852 ?auto_194858 ) ) ( not ( = ?auto_194852 ?auto_194855 ) ) ( ON ?auto_194850 ?auto_194856 ) ( not ( = ?auto_194850 ?auto_194856 ) ) ( not ( = ?auto_194851 ?auto_194856 ) ) ( not ( = ?auto_194852 ?auto_194856 ) ) ( not ( = ?auto_194853 ?auto_194856 ) ) ( not ( = ?auto_194854 ?auto_194856 ) ) ( not ( = ?auto_194857 ?auto_194856 ) ) ( not ( = ?auto_194858 ?auto_194856 ) ) ( not ( = ?auto_194855 ?auto_194856 ) ) ( ON ?auto_194851 ?auto_194850 ) ( CLEAR ?auto_194851 ) ( ON-TABLE ?auto_194856 ) ( HOLDING ?auto_194852 ) ( CLEAR ?auto_194853 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194858 ?auto_194855 ?auto_194857 ?auto_194854 ?auto_194853 ?auto_194852 )
      ( MAKE-5PILE ?auto_194850 ?auto_194851 ?auto_194852 ?auto_194853 ?auto_194854 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194859 - BLOCK
      ?auto_194860 - BLOCK
      ?auto_194861 - BLOCK
      ?auto_194862 - BLOCK
      ?auto_194863 - BLOCK
    )
    :vars
    (
      ?auto_194867 - BLOCK
      ?auto_194865 - BLOCK
      ?auto_194864 - BLOCK
      ?auto_194866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194859 ?auto_194860 ) ) ( not ( = ?auto_194859 ?auto_194861 ) ) ( not ( = ?auto_194859 ?auto_194862 ) ) ( not ( = ?auto_194859 ?auto_194863 ) ) ( not ( = ?auto_194860 ?auto_194861 ) ) ( not ( = ?auto_194860 ?auto_194862 ) ) ( not ( = ?auto_194860 ?auto_194863 ) ) ( not ( = ?auto_194861 ?auto_194862 ) ) ( not ( = ?auto_194861 ?auto_194863 ) ) ( not ( = ?auto_194862 ?auto_194863 ) ) ( ON ?auto_194863 ?auto_194867 ) ( not ( = ?auto_194859 ?auto_194867 ) ) ( not ( = ?auto_194860 ?auto_194867 ) ) ( not ( = ?auto_194861 ?auto_194867 ) ) ( not ( = ?auto_194862 ?auto_194867 ) ) ( not ( = ?auto_194863 ?auto_194867 ) ) ( ON ?auto_194862 ?auto_194863 ) ( ON-TABLE ?auto_194865 ) ( ON ?auto_194864 ?auto_194865 ) ( ON ?auto_194867 ?auto_194864 ) ( not ( = ?auto_194865 ?auto_194864 ) ) ( not ( = ?auto_194865 ?auto_194867 ) ) ( not ( = ?auto_194865 ?auto_194863 ) ) ( not ( = ?auto_194865 ?auto_194862 ) ) ( not ( = ?auto_194864 ?auto_194867 ) ) ( not ( = ?auto_194864 ?auto_194863 ) ) ( not ( = ?auto_194864 ?auto_194862 ) ) ( not ( = ?auto_194859 ?auto_194865 ) ) ( not ( = ?auto_194859 ?auto_194864 ) ) ( not ( = ?auto_194860 ?auto_194865 ) ) ( not ( = ?auto_194860 ?auto_194864 ) ) ( not ( = ?auto_194861 ?auto_194865 ) ) ( not ( = ?auto_194861 ?auto_194864 ) ) ( ON ?auto_194859 ?auto_194866 ) ( not ( = ?auto_194859 ?auto_194866 ) ) ( not ( = ?auto_194860 ?auto_194866 ) ) ( not ( = ?auto_194861 ?auto_194866 ) ) ( not ( = ?auto_194862 ?auto_194866 ) ) ( not ( = ?auto_194863 ?auto_194866 ) ) ( not ( = ?auto_194867 ?auto_194866 ) ) ( not ( = ?auto_194865 ?auto_194866 ) ) ( not ( = ?auto_194864 ?auto_194866 ) ) ( ON ?auto_194860 ?auto_194859 ) ( ON-TABLE ?auto_194866 ) ( CLEAR ?auto_194862 ) ( ON ?auto_194861 ?auto_194860 ) ( CLEAR ?auto_194861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194866 ?auto_194859 ?auto_194860 )
      ( MAKE-5PILE ?auto_194859 ?auto_194860 ?auto_194861 ?auto_194862 ?auto_194863 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194868 - BLOCK
      ?auto_194869 - BLOCK
      ?auto_194870 - BLOCK
      ?auto_194871 - BLOCK
      ?auto_194872 - BLOCK
    )
    :vars
    (
      ?auto_194873 - BLOCK
      ?auto_194875 - BLOCK
      ?auto_194876 - BLOCK
      ?auto_194874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194868 ?auto_194869 ) ) ( not ( = ?auto_194868 ?auto_194870 ) ) ( not ( = ?auto_194868 ?auto_194871 ) ) ( not ( = ?auto_194868 ?auto_194872 ) ) ( not ( = ?auto_194869 ?auto_194870 ) ) ( not ( = ?auto_194869 ?auto_194871 ) ) ( not ( = ?auto_194869 ?auto_194872 ) ) ( not ( = ?auto_194870 ?auto_194871 ) ) ( not ( = ?auto_194870 ?auto_194872 ) ) ( not ( = ?auto_194871 ?auto_194872 ) ) ( ON ?auto_194872 ?auto_194873 ) ( not ( = ?auto_194868 ?auto_194873 ) ) ( not ( = ?auto_194869 ?auto_194873 ) ) ( not ( = ?auto_194870 ?auto_194873 ) ) ( not ( = ?auto_194871 ?auto_194873 ) ) ( not ( = ?auto_194872 ?auto_194873 ) ) ( ON-TABLE ?auto_194875 ) ( ON ?auto_194876 ?auto_194875 ) ( ON ?auto_194873 ?auto_194876 ) ( not ( = ?auto_194875 ?auto_194876 ) ) ( not ( = ?auto_194875 ?auto_194873 ) ) ( not ( = ?auto_194875 ?auto_194872 ) ) ( not ( = ?auto_194875 ?auto_194871 ) ) ( not ( = ?auto_194876 ?auto_194873 ) ) ( not ( = ?auto_194876 ?auto_194872 ) ) ( not ( = ?auto_194876 ?auto_194871 ) ) ( not ( = ?auto_194868 ?auto_194875 ) ) ( not ( = ?auto_194868 ?auto_194876 ) ) ( not ( = ?auto_194869 ?auto_194875 ) ) ( not ( = ?auto_194869 ?auto_194876 ) ) ( not ( = ?auto_194870 ?auto_194875 ) ) ( not ( = ?auto_194870 ?auto_194876 ) ) ( ON ?auto_194868 ?auto_194874 ) ( not ( = ?auto_194868 ?auto_194874 ) ) ( not ( = ?auto_194869 ?auto_194874 ) ) ( not ( = ?auto_194870 ?auto_194874 ) ) ( not ( = ?auto_194871 ?auto_194874 ) ) ( not ( = ?auto_194872 ?auto_194874 ) ) ( not ( = ?auto_194873 ?auto_194874 ) ) ( not ( = ?auto_194875 ?auto_194874 ) ) ( not ( = ?auto_194876 ?auto_194874 ) ) ( ON ?auto_194869 ?auto_194868 ) ( ON-TABLE ?auto_194874 ) ( ON ?auto_194870 ?auto_194869 ) ( CLEAR ?auto_194870 ) ( HOLDING ?auto_194871 ) ( CLEAR ?auto_194872 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194875 ?auto_194876 ?auto_194873 ?auto_194872 ?auto_194871 )
      ( MAKE-5PILE ?auto_194868 ?auto_194869 ?auto_194870 ?auto_194871 ?auto_194872 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194877 - BLOCK
      ?auto_194878 - BLOCK
      ?auto_194879 - BLOCK
      ?auto_194880 - BLOCK
      ?auto_194881 - BLOCK
    )
    :vars
    (
      ?auto_194883 - BLOCK
      ?auto_194885 - BLOCK
      ?auto_194884 - BLOCK
      ?auto_194882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194877 ?auto_194878 ) ) ( not ( = ?auto_194877 ?auto_194879 ) ) ( not ( = ?auto_194877 ?auto_194880 ) ) ( not ( = ?auto_194877 ?auto_194881 ) ) ( not ( = ?auto_194878 ?auto_194879 ) ) ( not ( = ?auto_194878 ?auto_194880 ) ) ( not ( = ?auto_194878 ?auto_194881 ) ) ( not ( = ?auto_194879 ?auto_194880 ) ) ( not ( = ?auto_194879 ?auto_194881 ) ) ( not ( = ?auto_194880 ?auto_194881 ) ) ( ON ?auto_194881 ?auto_194883 ) ( not ( = ?auto_194877 ?auto_194883 ) ) ( not ( = ?auto_194878 ?auto_194883 ) ) ( not ( = ?auto_194879 ?auto_194883 ) ) ( not ( = ?auto_194880 ?auto_194883 ) ) ( not ( = ?auto_194881 ?auto_194883 ) ) ( ON-TABLE ?auto_194885 ) ( ON ?auto_194884 ?auto_194885 ) ( ON ?auto_194883 ?auto_194884 ) ( not ( = ?auto_194885 ?auto_194884 ) ) ( not ( = ?auto_194885 ?auto_194883 ) ) ( not ( = ?auto_194885 ?auto_194881 ) ) ( not ( = ?auto_194885 ?auto_194880 ) ) ( not ( = ?auto_194884 ?auto_194883 ) ) ( not ( = ?auto_194884 ?auto_194881 ) ) ( not ( = ?auto_194884 ?auto_194880 ) ) ( not ( = ?auto_194877 ?auto_194885 ) ) ( not ( = ?auto_194877 ?auto_194884 ) ) ( not ( = ?auto_194878 ?auto_194885 ) ) ( not ( = ?auto_194878 ?auto_194884 ) ) ( not ( = ?auto_194879 ?auto_194885 ) ) ( not ( = ?auto_194879 ?auto_194884 ) ) ( ON ?auto_194877 ?auto_194882 ) ( not ( = ?auto_194877 ?auto_194882 ) ) ( not ( = ?auto_194878 ?auto_194882 ) ) ( not ( = ?auto_194879 ?auto_194882 ) ) ( not ( = ?auto_194880 ?auto_194882 ) ) ( not ( = ?auto_194881 ?auto_194882 ) ) ( not ( = ?auto_194883 ?auto_194882 ) ) ( not ( = ?auto_194885 ?auto_194882 ) ) ( not ( = ?auto_194884 ?auto_194882 ) ) ( ON ?auto_194878 ?auto_194877 ) ( ON-TABLE ?auto_194882 ) ( ON ?auto_194879 ?auto_194878 ) ( CLEAR ?auto_194881 ) ( ON ?auto_194880 ?auto_194879 ) ( CLEAR ?auto_194880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194882 ?auto_194877 ?auto_194878 ?auto_194879 )
      ( MAKE-5PILE ?auto_194877 ?auto_194878 ?auto_194879 ?auto_194880 ?auto_194881 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194886 - BLOCK
      ?auto_194887 - BLOCK
      ?auto_194888 - BLOCK
      ?auto_194889 - BLOCK
      ?auto_194890 - BLOCK
    )
    :vars
    (
      ?auto_194893 - BLOCK
      ?auto_194891 - BLOCK
      ?auto_194892 - BLOCK
      ?auto_194894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194886 ?auto_194887 ) ) ( not ( = ?auto_194886 ?auto_194888 ) ) ( not ( = ?auto_194886 ?auto_194889 ) ) ( not ( = ?auto_194886 ?auto_194890 ) ) ( not ( = ?auto_194887 ?auto_194888 ) ) ( not ( = ?auto_194887 ?auto_194889 ) ) ( not ( = ?auto_194887 ?auto_194890 ) ) ( not ( = ?auto_194888 ?auto_194889 ) ) ( not ( = ?auto_194888 ?auto_194890 ) ) ( not ( = ?auto_194889 ?auto_194890 ) ) ( not ( = ?auto_194886 ?auto_194893 ) ) ( not ( = ?auto_194887 ?auto_194893 ) ) ( not ( = ?auto_194888 ?auto_194893 ) ) ( not ( = ?auto_194889 ?auto_194893 ) ) ( not ( = ?auto_194890 ?auto_194893 ) ) ( ON-TABLE ?auto_194891 ) ( ON ?auto_194892 ?auto_194891 ) ( ON ?auto_194893 ?auto_194892 ) ( not ( = ?auto_194891 ?auto_194892 ) ) ( not ( = ?auto_194891 ?auto_194893 ) ) ( not ( = ?auto_194891 ?auto_194890 ) ) ( not ( = ?auto_194891 ?auto_194889 ) ) ( not ( = ?auto_194892 ?auto_194893 ) ) ( not ( = ?auto_194892 ?auto_194890 ) ) ( not ( = ?auto_194892 ?auto_194889 ) ) ( not ( = ?auto_194886 ?auto_194891 ) ) ( not ( = ?auto_194886 ?auto_194892 ) ) ( not ( = ?auto_194887 ?auto_194891 ) ) ( not ( = ?auto_194887 ?auto_194892 ) ) ( not ( = ?auto_194888 ?auto_194891 ) ) ( not ( = ?auto_194888 ?auto_194892 ) ) ( ON ?auto_194886 ?auto_194894 ) ( not ( = ?auto_194886 ?auto_194894 ) ) ( not ( = ?auto_194887 ?auto_194894 ) ) ( not ( = ?auto_194888 ?auto_194894 ) ) ( not ( = ?auto_194889 ?auto_194894 ) ) ( not ( = ?auto_194890 ?auto_194894 ) ) ( not ( = ?auto_194893 ?auto_194894 ) ) ( not ( = ?auto_194891 ?auto_194894 ) ) ( not ( = ?auto_194892 ?auto_194894 ) ) ( ON ?auto_194887 ?auto_194886 ) ( ON-TABLE ?auto_194894 ) ( ON ?auto_194888 ?auto_194887 ) ( ON ?auto_194889 ?auto_194888 ) ( CLEAR ?auto_194889 ) ( HOLDING ?auto_194890 ) ( CLEAR ?auto_194893 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194891 ?auto_194892 ?auto_194893 ?auto_194890 )
      ( MAKE-5PILE ?auto_194886 ?auto_194887 ?auto_194888 ?auto_194889 ?auto_194890 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194895 - BLOCK
      ?auto_194896 - BLOCK
      ?auto_194897 - BLOCK
      ?auto_194898 - BLOCK
      ?auto_194899 - BLOCK
    )
    :vars
    (
      ?auto_194902 - BLOCK
      ?auto_194900 - BLOCK
      ?auto_194903 - BLOCK
      ?auto_194901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194895 ?auto_194896 ) ) ( not ( = ?auto_194895 ?auto_194897 ) ) ( not ( = ?auto_194895 ?auto_194898 ) ) ( not ( = ?auto_194895 ?auto_194899 ) ) ( not ( = ?auto_194896 ?auto_194897 ) ) ( not ( = ?auto_194896 ?auto_194898 ) ) ( not ( = ?auto_194896 ?auto_194899 ) ) ( not ( = ?auto_194897 ?auto_194898 ) ) ( not ( = ?auto_194897 ?auto_194899 ) ) ( not ( = ?auto_194898 ?auto_194899 ) ) ( not ( = ?auto_194895 ?auto_194902 ) ) ( not ( = ?auto_194896 ?auto_194902 ) ) ( not ( = ?auto_194897 ?auto_194902 ) ) ( not ( = ?auto_194898 ?auto_194902 ) ) ( not ( = ?auto_194899 ?auto_194902 ) ) ( ON-TABLE ?auto_194900 ) ( ON ?auto_194903 ?auto_194900 ) ( ON ?auto_194902 ?auto_194903 ) ( not ( = ?auto_194900 ?auto_194903 ) ) ( not ( = ?auto_194900 ?auto_194902 ) ) ( not ( = ?auto_194900 ?auto_194899 ) ) ( not ( = ?auto_194900 ?auto_194898 ) ) ( not ( = ?auto_194903 ?auto_194902 ) ) ( not ( = ?auto_194903 ?auto_194899 ) ) ( not ( = ?auto_194903 ?auto_194898 ) ) ( not ( = ?auto_194895 ?auto_194900 ) ) ( not ( = ?auto_194895 ?auto_194903 ) ) ( not ( = ?auto_194896 ?auto_194900 ) ) ( not ( = ?auto_194896 ?auto_194903 ) ) ( not ( = ?auto_194897 ?auto_194900 ) ) ( not ( = ?auto_194897 ?auto_194903 ) ) ( ON ?auto_194895 ?auto_194901 ) ( not ( = ?auto_194895 ?auto_194901 ) ) ( not ( = ?auto_194896 ?auto_194901 ) ) ( not ( = ?auto_194897 ?auto_194901 ) ) ( not ( = ?auto_194898 ?auto_194901 ) ) ( not ( = ?auto_194899 ?auto_194901 ) ) ( not ( = ?auto_194902 ?auto_194901 ) ) ( not ( = ?auto_194900 ?auto_194901 ) ) ( not ( = ?auto_194903 ?auto_194901 ) ) ( ON ?auto_194896 ?auto_194895 ) ( ON-TABLE ?auto_194901 ) ( ON ?auto_194897 ?auto_194896 ) ( ON ?auto_194898 ?auto_194897 ) ( CLEAR ?auto_194902 ) ( ON ?auto_194899 ?auto_194898 ) ( CLEAR ?auto_194899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194901 ?auto_194895 ?auto_194896 ?auto_194897 ?auto_194898 )
      ( MAKE-5PILE ?auto_194895 ?auto_194896 ?auto_194897 ?auto_194898 ?auto_194899 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194904 - BLOCK
      ?auto_194905 - BLOCK
      ?auto_194906 - BLOCK
      ?auto_194907 - BLOCK
      ?auto_194908 - BLOCK
    )
    :vars
    (
      ?auto_194911 - BLOCK
      ?auto_194910 - BLOCK
      ?auto_194912 - BLOCK
      ?auto_194909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194904 ?auto_194905 ) ) ( not ( = ?auto_194904 ?auto_194906 ) ) ( not ( = ?auto_194904 ?auto_194907 ) ) ( not ( = ?auto_194904 ?auto_194908 ) ) ( not ( = ?auto_194905 ?auto_194906 ) ) ( not ( = ?auto_194905 ?auto_194907 ) ) ( not ( = ?auto_194905 ?auto_194908 ) ) ( not ( = ?auto_194906 ?auto_194907 ) ) ( not ( = ?auto_194906 ?auto_194908 ) ) ( not ( = ?auto_194907 ?auto_194908 ) ) ( not ( = ?auto_194904 ?auto_194911 ) ) ( not ( = ?auto_194905 ?auto_194911 ) ) ( not ( = ?auto_194906 ?auto_194911 ) ) ( not ( = ?auto_194907 ?auto_194911 ) ) ( not ( = ?auto_194908 ?auto_194911 ) ) ( ON-TABLE ?auto_194910 ) ( ON ?auto_194912 ?auto_194910 ) ( not ( = ?auto_194910 ?auto_194912 ) ) ( not ( = ?auto_194910 ?auto_194911 ) ) ( not ( = ?auto_194910 ?auto_194908 ) ) ( not ( = ?auto_194910 ?auto_194907 ) ) ( not ( = ?auto_194912 ?auto_194911 ) ) ( not ( = ?auto_194912 ?auto_194908 ) ) ( not ( = ?auto_194912 ?auto_194907 ) ) ( not ( = ?auto_194904 ?auto_194910 ) ) ( not ( = ?auto_194904 ?auto_194912 ) ) ( not ( = ?auto_194905 ?auto_194910 ) ) ( not ( = ?auto_194905 ?auto_194912 ) ) ( not ( = ?auto_194906 ?auto_194910 ) ) ( not ( = ?auto_194906 ?auto_194912 ) ) ( ON ?auto_194904 ?auto_194909 ) ( not ( = ?auto_194904 ?auto_194909 ) ) ( not ( = ?auto_194905 ?auto_194909 ) ) ( not ( = ?auto_194906 ?auto_194909 ) ) ( not ( = ?auto_194907 ?auto_194909 ) ) ( not ( = ?auto_194908 ?auto_194909 ) ) ( not ( = ?auto_194911 ?auto_194909 ) ) ( not ( = ?auto_194910 ?auto_194909 ) ) ( not ( = ?auto_194912 ?auto_194909 ) ) ( ON ?auto_194905 ?auto_194904 ) ( ON-TABLE ?auto_194909 ) ( ON ?auto_194906 ?auto_194905 ) ( ON ?auto_194907 ?auto_194906 ) ( ON ?auto_194908 ?auto_194907 ) ( CLEAR ?auto_194908 ) ( HOLDING ?auto_194911 ) ( CLEAR ?auto_194912 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194910 ?auto_194912 ?auto_194911 )
      ( MAKE-5PILE ?auto_194904 ?auto_194905 ?auto_194906 ?auto_194907 ?auto_194908 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194913 - BLOCK
      ?auto_194914 - BLOCK
      ?auto_194915 - BLOCK
      ?auto_194916 - BLOCK
      ?auto_194917 - BLOCK
    )
    :vars
    (
      ?auto_194920 - BLOCK
      ?auto_194918 - BLOCK
      ?auto_194919 - BLOCK
      ?auto_194921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194913 ?auto_194914 ) ) ( not ( = ?auto_194913 ?auto_194915 ) ) ( not ( = ?auto_194913 ?auto_194916 ) ) ( not ( = ?auto_194913 ?auto_194917 ) ) ( not ( = ?auto_194914 ?auto_194915 ) ) ( not ( = ?auto_194914 ?auto_194916 ) ) ( not ( = ?auto_194914 ?auto_194917 ) ) ( not ( = ?auto_194915 ?auto_194916 ) ) ( not ( = ?auto_194915 ?auto_194917 ) ) ( not ( = ?auto_194916 ?auto_194917 ) ) ( not ( = ?auto_194913 ?auto_194920 ) ) ( not ( = ?auto_194914 ?auto_194920 ) ) ( not ( = ?auto_194915 ?auto_194920 ) ) ( not ( = ?auto_194916 ?auto_194920 ) ) ( not ( = ?auto_194917 ?auto_194920 ) ) ( ON-TABLE ?auto_194918 ) ( ON ?auto_194919 ?auto_194918 ) ( not ( = ?auto_194918 ?auto_194919 ) ) ( not ( = ?auto_194918 ?auto_194920 ) ) ( not ( = ?auto_194918 ?auto_194917 ) ) ( not ( = ?auto_194918 ?auto_194916 ) ) ( not ( = ?auto_194919 ?auto_194920 ) ) ( not ( = ?auto_194919 ?auto_194917 ) ) ( not ( = ?auto_194919 ?auto_194916 ) ) ( not ( = ?auto_194913 ?auto_194918 ) ) ( not ( = ?auto_194913 ?auto_194919 ) ) ( not ( = ?auto_194914 ?auto_194918 ) ) ( not ( = ?auto_194914 ?auto_194919 ) ) ( not ( = ?auto_194915 ?auto_194918 ) ) ( not ( = ?auto_194915 ?auto_194919 ) ) ( ON ?auto_194913 ?auto_194921 ) ( not ( = ?auto_194913 ?auto_194921 ) ) ( not ( = ?auto_194914 ?auto_194921 ) ) ( not ( = ?auto_194915 ?auto_194921 ) ) ( not ( = ?auto_194916 ?auto_194921 ) ) ( not ( = ?auto_194917 ?auto_194921 ) ) ( not ( = ?auto_194920 ?auto_194921 ) ) ( not ( = ?auto_194918 ?auto_194921 ) ) ( not ( = ?auto_194919 ?auto_194921 ) ) ( ON ?auto_194914 ?auto_194913 ) ( ON-TABLE ?auto_194921 ) ( ON ?auto_194915 ?auto_194914 ) ( ON ?auto_194916 ?auto_194915 ) ( ON ?auto_194917 ?auto_194916 ) ( CLEAR ?auto_194919 ) ( ON ?auto_194920 ?auto_194917 ) ( CLEAR ?auto_194920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_194921 ?auto_194913 ?auto_194914 ?auto_194915 ?auto_194916 ?auto_194917 )
      ( MAKE-5PILE ?auto_194913 ?auto_194914 ?auto_194915 ?auto_194916 ?auto_194917 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194922 - BLOCK
      ?auto_194923 - BLOCK
      ?auto_194924 - BLOCK
      ?auto_194925 - BLOCK
      ?auto_194926 - BLOCK
    )
    :vars
    (
      ?auto_194930 - BLOCK
      ?auto_194927 - BLOCK
      ?auto_194929 - BLOCK
      ?auto_194928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194922 ?auto_194923 ) ) ( not ( = ?auto_194922 ?auto_194924 ) ) ( not ( = ?auto_194922 ?auto_194925 ) ) ( not ( = ?auto_194922 ?auto_194926 ) ) ( not ( = ?auto_194923 ?auto_194924 ) ) ( not ( = ?auto_194923 ?auto_194925 ) ) ( not ( = ?auto_194923 ?auto_194926 ) ) ( not ( = ?auto_194924 ?auto_194925 ) ) ( not ( = ?auto_194924 ?auto_194926 ) ) ( not ( = ?auto_194925 ?auto_194926 ) ) ( not ( = ?auto_194922 ?auto_194930 ) ) ( not ( = ?auto_194923 ?auto_194930 ) ) ( not ( = ?auto_194924 ?auto_194930 ) ) ( not ( = ?auto_194925 ?auto_194930 ) ) ( not ( = ?auto_194926 ?auto_194930 ) ) ( ON-TABLE ?auto_194927 ) ( not ( = ?auto_194927 ?auto_194929 ) ) ( not ( = ?auto_194927 ?auto_194930 ) ) ( not ( = ?auto_194927 ?auto_194926 ) ) ( not ( = ?auto_194927 ?auto_194925 ) ) ( not ( = ?auto_194929 ?auto_194930 ) ) ( not ( = ?auto_194929 ?auto_194926 ) ) ( not ( = ?auto_194929 ?auto_194925 ) ) ( not ( = ?auto_194922 ?auto_194927 ) ) ( not ( = ?auto_194922 ?auto_194929 ) ) ( not ( = ?auto_194923 ?auto_194927 ) ) ( not ( = ?auto_194923 ?auto_194929 ) ) ( not ( = ?auto_194924 ?auto_194927 ) ) ( not ( = ?auto_194924 ?auto_194929 ) ) ( ON ?auto_194922 ?auto_194928 ) ( not ( = ?auto_194922 ?auto_194928 ) ) ( not ( = ?auto_194923 ?auto_194928 ) ) ( not ( = ?auto_194924 ?auto_194928 ) ) ( not ( = ?auto_194925 ?auto_194928 ) ) ( not ( = ?auto_194926 ?auto_194928 ) ) ( not ( = ?auto_194930 ?auto_194928 ) ) ( not ( = ?auto_194927 ?auto_194928 ) ) ( not ( = ?auto_194929 ?auto_194928 ) ) ( ON ?auto_194923 ?auto_194922 ) ( ON-TABLE ?auto_194928 ) ( ON ?auto_194924 ?auto_194923 ) ( ON ?auto_194925 ?auto_194924 ) ( ON ?auto_194926 ?auto_194925 ) ( ON ?auto_194930 ?auto_194926 ) ( CLEAR ?auto_194930 ) ( HOLDING ?auto_194929 ) ( CLEAR ?auto_194927 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_194927 ?auto_194929 )
      ( MAKE-5PILE ?auto_194922 ?auto_194923 ?auto_194924 ?auto_194925 ?auto_194926 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194931 - BLOCK
      ?auto_194932 - BLOCK
      ?auto_194933 - BLOCK
      ?auto_194934 - BLOCK
      ?auto_194935 - BLOCK
    )
    :vars
    (
      ?auto_194936 - BLOCK
      ?auto_194939 - BLOCK
      ?auto_194938 - BLOCK
      ?auto_194937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194931 ?auto_194932 ) ) ( not ( = ?auto_194931 ?auto_194933 ) ) ( not ( = ?auto_194931 ?auto_194934 ) ) ( not ( = ?auto_194931 ?auto_194935 ) ) ( not ( = ?auto_194932 ?auto_194933 ) ) ( not ( = ?auto_194932 ?auto_194934 ) ) ( not ( = ?auto_194932 ?auto_194935 ) ) ( not ( = ?auto_194933 ?auto_194934 ) ) ( not ( = ?auto_194933 ?auto_194935 ) ) ( not ( = ?auto_194934 ?auto_194935 ) ) ( not ( = ?auto_194931 ?auto_194936 ) ) ( not ( = ?auto_194932 ?auto_194936 ) ) ( not ( = ?auto_194933 ?auto_194936 ) ) ( not ( = ?auto_194934 ?auto_194936 ) ) ( not ( = ?auto_194935 ?auto_194936 ) ) ( ON-TABLE ?auto_194939 ) ( not ( = ?auto_194939 ?auto_194938 ) ) ( not ( = ?auto_194939 ?auto_194936 ) ) ( not ( = ?auto_194939 ?auto_194935 ) ) ( not ( = ?auto_194939 ?auto_194934 ) ) ( not ( = ?auto_194938 ?auto_194936 ) ) ( not ( = ?auto_194938 ?auto_194935 ) ) ( not ( = ?auto_194938 ?auto_194934 ) ) ( not ( = ?auto_194931 ?auto_194939 ) ) ( not ( = ?auto_194931 ?auto_194938 ) ) ( not ( = ?auto_194932 ?auto_194939 ) ) ( not ( = ?auto_194932 ?auto_194938 ) ) ( not ( = ?auto_194933 ?auto_194939 ) ) ( not ( = ?auto_194933 ?auto_194938 ) ) ( ON ?auto_194931 ?auto_194937 ) ( not ( = ?auto_194931 ?auto_194937 ) ) ( not ( = ?auto_194932 ?auto_194937 ) ) ( not ( = ?auto_194933 ?auto_194937 ) ) ( not ( = ?auto_194934 ?auto_194937 ) ) ( not ( = ?auto_194935 ?auto_194937 ) ) ( not ( = ?auto_194936 ?auto_194937 ) ) ( not ( = ?auto_194939 ?auto_194937 ) ) ( not ( = ?auto_194938 ?auto_194937 ) ) ( ON ?auto_194932 ?auto_194931 ) ( ON-TABLE ?auto_194937 ) ( ON ?auto_194933 ?auto_194932 ) ( ON ?auto_194934 ?auto_194933 ) ( ON ?auto_194935 ?auto_194934 ) ( ON ?auto_194936 ?auto_194935 ) ( CLEAR ?auto_194939 ) ( ON ?auto_194938 ?auto_194936 ) ( CLEAR ?auto_194938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_194937 ?auto_194931 ?auto_194932 ?auto_194933 ?auto_194934 ?auto_194935 ?auto_194936 )
      ( MAKE-5PILE ?auto_194931 ?auto_194932 ?auto_194933 ?auto_194934 ?auto_194935 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194940 - BLOCK
      ?auto_194941 - BLOCK
      ?auto_194942 - BLOCK
      ?auto_194943 - BLOCK
      ?auto_194944 - BLOCK
    )
    :vars
    (
      ?auto_194945 - BLOCK
      ?auto_194948 - BLOCK
      ?auto_194947 - BLOCK
      ?auto_194946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194940 ?auto_194941 ) ) ( not ( = ?auto_194940 ?auto_194942 ) ) ( not ( = ?auto_194940 ?auto_194943 ) ) ( not ( = ?auto_194940 ?auto_194944 ) ) ( not ( = ?auto_194941 ?auto_194942 ) ) ( not ( = ?auto_194941 ?auto_194943 ) ) ( not ( = ?auto_194941 ?auto_194944 ) ) ( not ( = ?auto_194942 ?auto_194943 ) ) ( not ( = ?auto_194942 ?auto_194944 ) ) ( not ( = ?auto_194943 ?auto_194944 ) ) ( not ( = ?auto_194940 ?auto_194945 ) ) ( not ( = ?auto_194941 ?auto_194945 ) ) ( not ( = ?auto_194942 ?auto_194945 ) ) ( not ( = ?auto_194943 ?auto_194945 ) ) ( not ( = ?auto_194944 ?auto_194945 ) ) ( not ( = ?auto_194948 ?auto_194947 ) ) ( not ( = ?auto_194948 ?auto_194945 ) ) ( not ( = ?auto_194948 ?auto_194944 ) ) ( not ( = ?auto_194948 ?auto_194943 ) ) ( not ( = ?auto_194947 ?auto_194945 ) ) ( not ( = ?auto_194947 ?auto_194944 ) ) ( not ( = ?auto_194947 ?auto_194943 ) ) ( not ( = ?auto_194940 ?auto_194948 ) ) ( not ( = ?auto_194940 ?auto_194947 ) ) ( not ( = ?auto_194941 ?auto_194948 ) ) ( not ( = ?auto_194941 ?auto_194947 ) ) ( not ( = ?auto_194942 ?auto_194948 ) ) ( not ( = ?auto_194942 ?auto_194947 ) ) ( ON ?auto_194940 ?auto_194946 ) ( not ( = ?auto_194940 ?auto_194946 ) ) ( not ( = ?auto_194941 ?auto_194946 ) ) ( not ( = ?auto_194942 ?auto_194946 ) ) ( not ( = ?auto_194943 ?auto_194946 ) ) ( not ( = ?auto_194944 ?auto_194946 ) ) ( not ( = ?auto_194945 ?auto_194946 ) ) ( not ( = ?auto_194948 ?auto_194946 ) ) ( not ( = ?auto_194947 ?auto_194946 ) ) ( ON ?auto_194941 ?auto_194940 ) ( ON-TABLE ?auto_194946 ) ( ON ?auto_194942 ?auto_194941 ) ( ON ?auto_194943 ?auto_194942 ) ( ON ?auto_194944 ?auto_194943 ) ( ON ?auto_194945 ?auto_194944 ) ( ON ?auto_194947 ?auto_194945 ) ( CLEAR ?auto_194947 ) ( HOLDING ?auto_194948 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_194948 )
      ( MAKE-5PILE ?auto_194940 ?auto_194941 ?auto_194942 ?auto_194943 ?auto_194944 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_194949 - BLOCK
      ?auto_194950 - BLOCK
      ?auto_194951 - BLOCK
      ?auto_194952 - BLOCK
      ?auto_194953 - BLOCK
    )
    :vars
    (
      ?auto_194956 - BLOCK
      ?auto_194957 - BLOCK
      ?auto_194955 - BLOCK
      ?auto_194954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_194949 ?auto_194950 ) ) ( not ( = ?auto_194949 ?auto_194951 ) ) ( not ( = ?auto_194949 ?auto_194952 ) ) ( not ( = ?auto_194949 ?auto_194953 ) ) ( not ( = ?auto_194950 ?auto_194951 ) ) ( not ( = ?auto_194950 ?auto_194952 ) ) ( not ( = ?auto_194950 ?auto_194953 ) ) ( not ( = ?auto_194951 ?auto_194952 ) ) ( not ( = ?auto_194951 ?auto_194953 ) ) ( not ( = ?auto_194952 ?auto_194953 ) ) ( not ( = ?auto_194949 ?auto_194956 ) ) ( not ( = ?auto_194950 ?auto_194956 ) ) ( not ( = ?auto_194951 ?auto_194956 ) ) ( not ( = ?auto_194952 ?auto_194956 ) ) ( not ( = ?auto_194953 ?auto_194956 ) ) ( not ( = ?auto_194957 ?auto_194955 ) ) ( not ( = ?auto_194957 ?auto_194956 ) ) ( not ( = ?auto_194957 ?auto_194953 ) ) ( not ( = ?auto_194957 ?auto_194952 ) ) ( not ( = ?auto_194955 ?auto_194956 ) ) ( not ( = ?auto_194955 ?auto_194953 ) ) ( not ( = ?auto_194955 ?auto_194952 ) ) ( not ( = ?auto_194949 ?auto_194957 ) ) ( not ( = ?auto_194949 ?auto_194955 ) ) ( not ( = ?auto_194950 ?auto_194957 ) ) ( not ( = ?auto_194950 ?auto_194955 ) ) ( not ( = ?auto_194951 ?auto_194957 ) ) ( not ( = ?auto_194951 ?auto_194955 ) ) ( ON ?auto_194949 ?auto_194954 ) ( not ( = ?auto_194949 ?auto_194954 ) ) ( not ( = ?auto_194950 ?auto_194954 ) ) ( not ( = ?auto_194951 ?auto_194954 ) ) ( not ( = ?auto_194952 ?auto_194954 ) ) ( not ( = ?auto_194953 ?auto_194954 ) ) ( not ( = ?auto_194956 ?auto_194954 ) ) ( not ( = ?auto_194957 ?auto_194954 ) ) ( not ( = ?auto_194955 ?auto_194954 ) ) ( ON ?auto_194950 ?auto_194949 ) ( ON-TABLE ?auto_194954 ) ( ON ?auto_194951 ?auto_194950 ) ( ON ?auto_194952 ?auto_194951 ) ( ON ?auto_194953 ?auto_194952 ) ( ON ?auto_194956 ?auto_194953 ) ( ON ?auto_194955 ?auto_194956 ) ( ON ?auto_194957 ?auto_194955 ) ( CLEAR ?auto_194957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_194954 ?auto_194949 ?auto_194950 ?auto_194951 ?auto_194952 ?auto_194953 ?auto_194956 ?auto_194955 )
      ( MAKE-5PILE ?auto_194949 ?auto_194950 ?auto_194951 ?auto_194952 ?auto_194953 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_194960 - BLOCK
      ?auto_194961 - BLOCK
    )
    :vars
    (
      ?auto_194962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194962 ?auto_194961 ) ( CLEAR ?auto_194962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194960 ) ( ON ?auto_194961 ?auto_194960 ) ( not ( = ?auto_194960 ?auto_194961 ) ) ( not ( = ?auto_194960 ?auto_194962 ) ) ( not ( = ?auto_194961 ?auto_194962 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_194962 ?auto_194961 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_194963 - BLOCK
      ?auto_194964 - BLOCK
    )
    :vars
    (
      ?auto_194965 - BLOCK
      ?auto_194966 - BLOCK
      ?auto_194967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194965 ?auto_194964 ) ( CLEAR ?auto_194965 ) ( ON-TABLE ?auto_194963 ) ( ON ?auto_194964 ?auto_194963 ) ( not ( = ?auto_194963 ?auto_194964 ) ) ( not ( = ?auto_194963 ?auto_194965 ) ) ( not ( = ?auto_194964 ?auto_194965 ) ) ( HOLDING ?auto_194966 ) ( CLEAR ?auto_194967 ) ( not ( = ?auto_194963 ?auto_194966 ) ) ( not ( = ?auto_194963 ?auto_194967 ) ) ( not ( = ?auto_194964 ?auto_194966 ) ) ( not ( = ?auto_194964 ?auto_194967 ) ) ( not ( = ?auto_194965 ?auto_194966 ) ) ( not ( = ?auto_194965 ?auto_194967 ) ) ( not ( = ?auto_194966 ?auto_194967 ) ) )
    :subtasks
    ( ( !STACK ?auto_194966 ?auto_194967 )
      ( MAKE-2PILE ?auto_194963 ?auto_194964 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_194968 - BLOCK
      ?auto_194969 - BLOCK
    )
    :vars
    (
      ?auto_194970 - BLOCK
      ?auto_194971 - BLOCK
      ?auto_194972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194970 ?auto_194969 ) ( ON-TABLE ?auto_194968 ) ( ON ?auto_194969 ?auto_194968 ) ( not ( = ?auto_194968 ?auto_194969 ) ) ( not ( = ?auto_194968 ?auto_194970 ) ) ( not ( = ?auto_194969 ?auto_194970 ) ) ( CLEAR ?auto_194971 ) ( not ( = ?auto_194968 ?auto_194972 ) ) ( not ( = ?auto_194968 ?auto_194971 ) ) ( not ( = ?auto_194969 ?auto_194972 ) ) ( not ( = ?auto_194969 ?auto_194971 ) ) ( not ( = ?auto_194970 ?auto_194972 ) ) ( not ( = ?auto_194970 ?auto_194971 ) ) ( not ( = ?auto_194972 ?auto_194971 ) ) ( ON ?auto_194972 ?auto_194970 ) ( CLEAR ?auto_194972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194968 ?auto_194969 ?auto_194970 )
      ( MAKE-2PILE ?auto_194968 ?auto_194969 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_194973 - BLOCK
      ?auto_194974 - BLOCK
    )
    :vars
    (
      ?auto_194975 - BLOCK
      ?auto_194976 - BLOCK
      ?auto_194977 - BLOCK
      ?auto_194980 - BLOCK
      ?auto_194979 - BLOCK
      ?auto_194978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194975 ?auto_194974 ) ( ON-TABLE ?auto_194973 ) ( ON ?auto_194974 ?auto_194973 ) ( not ( = ?auto_194973 ?auto_194974 ) ) ( not ( = ?auto_194973 ?auto_194975 ) ) ( not ( = ?auto_194974 ?auto_194975 ) ) ( not ( = ?auto_194973 ?auto_194976 ) ) ( not ( = ?auto_194973 ?auto_194977 ) ) ( not ( = ?auto_194974 ?auto_194976 ) ) ( not ( = ?auto_194974 ?auto_194977 ) ) ( not ( = ?auto_194975 ?auto_194976 ) ) ( not ( = ?auto_194975 ?auto_194977 ) ) ( not ( = ?auto_194976 ?auto_194977 ) ) ( ON ?auto_194976 ?auto_194975 ) ( CLEAR ?auto_194976 ) ( HOLDING ?auto_194977 ) ( CLEAR ?auto_194980 ) ( ON-TABLE ?auto_194979 ) ( ON ?auto_194978 ?auto_194979 ) ( ON ?auto_194980 ?auto_194978 ) ( not ( = ?auto_194979 ?auto_194978 ) ) ( not ( = ?auto_194979 ?auto_194980 ) ) ( not ( = ?auto_194979 ?auto_194977 ) ) ( not ( = ?auto_194978 ?auto_194980 ) ) ( not ( = ?auto_194978 ?auto_194977 ) ) ( not ( = ?auto_194980 ?auto_194977 ) ) ( not ( = ?auto_194973 ?auto_194980 ) ) ( not ( = ?auto_194973 ?auto_194979 ) ) ( not ( = ?auto_194973 ?auto_194978 ) ) ( not ( = ?auto_194974 ?auto_194980 ) ) ( not ( = ?auto_194974 ?auto_194979 ) ) ( not ( = ?auto_194974 ?auto_194978 ) ) ( not ( = ?auto_194975 ?auto_194980 ) ) ( not ( = ?auto_194975 ?auto_194979 ) ) ( not ( = ?auto_194975 ?auto_194978 ) ) ( not ( = ?auto_194976 ?auto_194980 ) ) ( not ( = ?auto_194976 ?auto_194979 ) ) ( not ( = ?auto_194976 ?auto_194978 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194979 ?auto_194978 ?auto_194980 ?auto_194977 )
      ( MAKE-2PILE ?auto_194973 ?auto_194974 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_194981 - BLOCK
      ?auto_194982 - BLOCK
    )
    :vars
    (
      ?auto_194984 - BLOCK
      ?auto_194985 - BLOCK
      ?auto_194986 - BLOCK
      ?auto_194983 - BLOCK
      ?auto_194988 - BLOCK
      ?auto_194987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194984 ?auto_194982 ) ( ON-TABLE ?auto_194981 ) ( ON ?auto_194982 ?auto_194981 ) ( not ( = ?auto_194981 ?auto_194982 ) ) ( not ( = ?auto_194981 ?auto_194984 ) ) ( not ( = ?auto_194982 ?auto_194984 ) ) ( not ( = ?auto_194981 ?auto_194985 ) ) ( not ( = ?auto_194981 ?auto_194986 ) ) ( not ( = ?auto_194982 ?auto_194985 ) ) ( not ( = ?auto_194982 ?auto_194986 ) ) ( not ( = ?auto_194984 ?auto_194985 ) ) ( not ( = ?auto_194984 ?auto_194986 ) ) ( not ( = ?auto_194985 ?auto_194986 ) ) ( ON ?auto_194985 ?auto_194984 ) ( CLEAR ?auto_194983 ) ( ON-TABLE ?auto_194988 ) ( ON ?auto_194987 ?auto_194988 ) ( ON ?auto_194983 ?auto_194987 ) ( not ( = ?auto_194988 ?auto_194987 ) ) ( not ( = ?auto_194988 ?auto_194983 ) ) ( not ( = ?auto_194988 ?auto_194986 ) ) ( not ( = ?auto_194987 ?auto_194983 ) ) ( not ( = ?auto_194987 ?auto_194986 ) ) ( not ( = ?auto_194983 ?auto_194986 ) ) ( not ( = ?auto_194981 ?auto_194983 ) ) ( not ( = ?auto_194981 ?auto_194988 ) ) ( not ( = ?auto_194981 ?auto_194987 ) ) ( not ( = ?auto_194982 ?auto_194983 ) ) ( not ( = ?auto_194982 ?auto_194988 ) ) ( not ( = ?auto_194982 ?auto_194987 ) ) ( not ( = ?auto_194984 ?auto_194983 ) ) ( not ( = ?auto_194984 ?auto_194988 ) ) ( not ( = ?auto_194984 ?auto_194987 ) ) ( not ( = ?auto_194985 ?auto_194983 ) ) ( not ( = ?auto_194985 ?auto_194988 ) ) ( not ( = ?auto_194985 ?auto_194987 ) ) ( ON ?auto_194986 ?auto_194985 ) ( CLEAR ?auto_194986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_194981 ?auto_194982 ?auto_194984 ?auto_194985 )
      ( MAKE-2PILE ?auto_194981 ?auto_194982 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_194989 - BLOCK
      ?auto_194990 - BLOCK
    )
    :vars
    (
      ?auto_194992 - BLOCK
      ?auto_194995 - BLOCK
      ?auto_194996 - BLOCK
      ?auto_194994 - BLOCK
      ?auto_194991 - BLOCK
      ?auto_194993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_194992 ?auto_194990 ) ( ON-TABLE ?auto_194989 ) ( ON ?auto_194990 ?auto_194989 ) ( not ( = ?auto_194989 ?auto_194990 ) ) ( not ( = ?auto_194989 ?auto_194992 ) ) ( not ( = ?auto_194990 ?auto_194992 ) ) ( not ( = ?auto_194989 ?auto_194995 ) ) ( not ( = ?auto_194989 ?auto_194996 ) ) ( not ( = ?auto_194990 ?auto_194995 ) ) ( not ( = ?auto_194990 ?auto_194996 ) ) ( not ( = ?auto_194992 ?auto_194995 ) ) ( not ( = ?auto_194992 ?auto_194996 ) ) ( not ( = ?auto_194995 ?auto_194996 ) ) ( ON ?auto_194995 ?auto_194992 ) ( ON-TABLE ?auto_194994 ) ( ON ?auto_194991 ?auto_194994 ) ( not ( = ?auto_194994 ?auto_194991 ) ) ( not ( = ?auto_194994 ?auto_194993 ) ) ( not ( = ?auto_194994 ?auto_194996 ) ) ( not ( = ?auto_194991 ?auto_194993 ) ) ( not ( = ?auto_194991 ?auto_194996 ) ) ( not ( = ?auto_194993 ?auto_194996 ) ) ( not ( = ?auto_194989 ?auto_194993 ) ) ( not ( = ?auto_194989 ?auto_194994 ) ) ( not ( = ?auto_194989 ?auto_194991 ) ) ( not ( = ?auto_194990 ?auto_194993 ) ) ( not ( = ?auto_194990 ?auto_194994 ) ) ( not ( = ?auto_194990 ?auto_194991 ) ) ( not ( = ?auto_194992 ?auto_194993 ) ) ( not ( = ?auto_194992 ?auto_194994 ) ) ( not ( = ?auto_194992 ?auto_194991 ) ) ( not ( = ?auto_194995 ?auto_194993 ) ) ( not ( = ?auto_194995 ?auto_194994 ) ) ( not ( = ?auto_194995 ?auto_194991 ) ) ( ON ?auto_194996 ?auto_194995 ) ( CLEAR ?auto_194996 ) ( HOLDING ?auto_194993 ) ( CLEAR ?auto_194991 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_194994 ?auto_194991 ?auto_194993 )
      ( MAKE-2PILE ?auto_194989 ?auto_194990 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_194997 - BLOCK
      ?auto_194998 - BLOCK
    )
    :vars
    (
      ?auto_195000 - BLOCK
      ?auto_195004 - BLOCK
      ?auto_194999 - BLOCK
      ?auto_195001 - BLOCK
      ?auto_195003 - BLOCK
      ?auto_195002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195000 ?auto_194998 ) ( ON-TABLE ?auto_194997 ) ( ON ?auto_194998 ?auto_194997 ) ( not ( = ?auto_194997 ?auto_194998 ) ) ( not ( = ?auto_194997 ?auto_195000 ) ) ( not ( = ?auto_194998 ?auto_195000 ) ) ( not ( = ?auto_194997 ?auto_195004 ) ) ( not ( = ?auto_194997 ?auto_194999 ) ) ( not ( = ?auto_194998 ?auto_195004 ) ) ( not ( = ?auto_194998 ?auto_194999 ) ) ( not ( = ?auto_195000 ?auto_195004 ) ) ( not ( = ?auto_195000 ?auto_194999 ) ) ( not ( = ?auto_195004 ?auto_194999 ) ) ( ON ?auto_195004 ?auto_195000 ) ( ON-TABLE ?auto_195001 ) ( ON ?auto_195003 ?auto_195001 ) ( not ( = ?auto_195001 ?auto_195003 ) ) ( not ( = ?auto_195001 ?auto_195002 ) ) ( not ( = ?auto_195001 ?auto_194999 ) ) ( not ( = ?auto_195003 ?auto_195002 ) ) ( not ( = ?auto_195003 ?auto_194999 ) ) ( not ( = ?auto_195002 ?auto_194999 ) ) ( not ( = ?auto_194997 ?auto_195002 ) ) ( not ( = ?auto_194997 ?auto_195001 ) ) ( not ( = ?auto_194997 ?auto_195003 ) ) ( not ( = ?auto_194998 ?auto_195002 ) ) ( not ( = ?auto_194998 ?auto_195001 ) ) ( not ( = ?auto_194998 ?auto_195003 ) ) ( not ( = ?auto_195000 ?auto_195002 ) ) ( not ( = ?auto_195000 ?auto_195001 ) ) ( not ( = ?auto_195000 ?auto_195003 ) ) ( not ( = ?auto_195004 ?auto_195002 ) ) ( not ( = ?auto_195004 ?auto_195001 ) ) ( not ( = ?auto_195004 ?auto_195003 ) ) ( ON ?auto_194999 ?auto_195004 ) ( CLEAR ?auto_195003 ) ( ON ?auto_195002 ?auto_194999 ) ( CLEAR ?auto_195002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_194997 ?auto_194998 ?auto_195000 ?auto_195004 ?auto_194999 )
      ( MAKE-2PILE ?auto_194997 ?auto_194998 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195005 - BLOCK
      ?auto_195006 - BLOCK
    )
    :vars
    (
      ?auto_195008 - BLOCK
      ?auto_195010 - BLOCK
      ?auto_195012 - BLOCK
      ?auto_195011 - BLOCK
      ?auto_195007 - BLOCK
      ?auto_195009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195008 ?auto_195006 ) ( ON-TABLE ?auto_195005 ) ( ON ?auto_195006 ?auto_195005 ) ( not ( = ?auto_195005 ?auto_195006 ) ) ( not ( = ?auto_195005 ?auto_195008 ) ) ( not ( = ?auto_195006 ?auto_195008 ) ) ( not ( = ?auto_195005 ?auto_195010 ) ) ( not ( = ?auto_195005 ?auto_195012 ) ) ( not ( = ?auto_195006 ?auto_195010 ) ) ( not ( = ?auto_195006 ?auto_195012 ) ) ( not ( = ?auto_195008 ?auto_195010 ) ) ( not ( = ?auto_195008 ?auto_195012 ) ) ( not ( = ?auto_195010 ?auto_195012 ) ) ( ON ?auto_195010 ?auto_195008 ) ( ON-TABLE ?auto_195011 ) ( not ( = ?auto_195011 ?auto_195007 ) ) ( not ( = ?auto_195011 ?auto_195009 ) ) ( not ( = ?auto_195011 ?auto_195012 ) ) ( not ( = ?auto_195007 ?auto_195009 ) ) ( not ( = ?auto_195007 ?auto_195012 ) ) ( not ( = ?auto_195009 ?auto_195012 ) ) ( not ( = ?auto_195005 ?auto_195009 ) ) ( not ( = ?auto_195005 ?auto_195011 ) ) ( not ( = ?auto_195005 ?auto_195007 ) ) ( not ( = ?auto_195006 ?auto_195009 ) ) ( not ( = ?auto_195006 ?auto_195011 ) ) ( not ( = ?auto_195006 ?auto_195007 ) ) ( not ( = ?auto_195008 ?auto_195009 ) ) ( not ( = ?auto_195008 ?auto_195011 ) ) ( not ( = ?auto_195008 ?auto_195007 ) ) ( not ( = ?auto_195010 ?auto_195009 ) ) ( not ( = ?auto_195010 ?auto_195011 ) ) ( not ( = ?auto_195010 ?auto_195007 ) ) ( ON ?auto_195012 ?auto_195010 ) ( ON ?auto_195009 ?auto_195012 ) ( CLEAR ?auto_195009 ) ( HOLDING ?auto_195007 ) ( CLEAR ?auto_195011 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195011 ?auto_195007 )
      ( MAKE-2PILE ?auto_195005 ?auto_195006 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195013 - BLOCK
      ?auto_195014 - BLOCK
    )
    :vars
    (
      ?auto_195017 - BLOCK
      ?auto_195020 - BLOCK
      ?auto_195016 - BLOCK
      ?auto_195015 - BLOCK
      ?auto_195018 - BLOCK
      ?auto_195019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195017 ?auto_195014 ) ( ON-TABLE ?auto_195013 ) ( ON ?auto_195014 ?auto_195013 ) ( not ( = ?auto_195013 ?auto_195014 ) ) ( not ( = ?auto_195013 ?auto_195017 ) ) ( not ( = ?auto_195014 ?auto_195017 ) ) ( not ( = ?auto_195013 ?auto_195020 ) ) ( not ( = ?auto_195013 ?auto_195016 ) ) ( not ( = ?auto_195014 ?auto_195020 ) ) ( not ( = ?auto_195014 ?auto_195016 ) ) ( not ( = ?auto_195017 ?auto_195020 ) ) ( not ( = ?auto_195017 ?auto_195016 ) ) ( not ( = ?auto_195020 ?auto_195016 ) ) ( ON ?auto_195020 ?auto_195017 ) ( ON-TABLE ?auto_195015 ) ( not ( = ?auto_195015 ?auto_195018 ) ) ( not ( = ?auto_195015 ?auto_195019 ) ) ( not ( = ?auto_195015 ?auto_195016 ) ) ( not ( = ?auto_195018 ?auto_195019 ) ) ( not ( = ?auto_195018 ?auto_195016 ) ) ( not ( = ?auto_195019 ?auto_195016 ) ) ( not ( = ?auto_195013 ?auto_195019 ) ) ( not ( = ?auto_195013 ?auto_195015 ) ) ( not ( = ?auto_195013 ?auto_195018 ) ) ( not ( = ?auto_195014 ?auto_195019 ) ) ( not ( = ?auto_195014 ?auto_195015 ) ) ( not ( = ?auto_195014 ?auto_195018 ) ) ( not ( = ?auto_195017 ?auto_195019 ) ) ( not ( = ?auto_195017 ?auto_195015 ) ) ( not ( = ?auto_195017 ?auto_195018 ) ) ( not ( = ?auto_195020 ?auto_195019 ) ) ( not ( = ?auto_195020 ?auto_195015 ) ) ( not ( = ?auto_195020 ?auto_195018 ) ) ( ON ?auto_195016 ?auto_195020 ) ( ON ?auto_195019 ?auto_195016 ) ( CLEAR ?auto_195015 ) ( ON ?auto_195018 ?auto_195019 ) ( CLEAR ?auto_195018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195013 ?auto_195014 ?auto_195017 ?auto_195020 ?auto_195016 ?auto_195019 )
      ( MAKE-2PILE ?auto_195013 ?auto_195014 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195021 - BLOCK
      ?auto_195022 - BLOCK
    )
    :vars
    (
      ?auto_195026 - BLOCK
      ?auto_195024 - BLOCK
      ?auto_195023 - BLOCK
      ?auto_195025 - BLOCK
      ?auto_195027 - BLOCK
      ?auto_195028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195026 ?auto_195022 ) ( ON-TABLE ?auto_195021 ) ( ON ?auto_195022 ?auto_195021 ) ( not ( = ?auto_195021 ?auto_195022 ) ) ( not ( = ?auto_195021 ?auto_195026 ) ) ( not ( = ?auto_195022 ?auto_195026 ) ) ( not ( = ?auto_195021 ?auto_195024 ) ) ( not ( = ?auto_195021 ?auto_195023 ) ) ( not ( = ?auto_195022 ?auto_195024 ) ) ( not ( = ?auto_195022 ?auto_195023 ) ) ( not ( = ?auto_195026 ?auto_195024 ) ) ( not ( = ?auto_195026 ?auto_195023 ) ) ( not ( = ?auto_195024 ?auto_195023 ) ) ( ON ?auto_195024 ?auto_195026 ) ( not ( = ?auto_195025 ?auto_195027 ) ) ( not ( = ?auto_195025 ?auto_195028 ) ) ( not ( = ?auto_195025 ?auto_195023 ) ) ( not ( = ?auto_195027 ?auto_195028 ) ) ( not ( = ?auto_195027 ?auto_195023 ) ) ( not ( = ?auto_195028 ?auto_195023 ) ) ( not ( = ?auto_195021 ?auto_195028 ) ) ( not ( = ?auto_195021 ?auto_195025 ) ) ( not ( = ?auto_195021 ?auto_195027 ) ) ( not ( = ?auto_195022 ?auto_195028 ) ) ( not ( = ?auto_195022 ?auto_195025 ) ) ( not ( = ?auto_195022 ?auto_195027 ) ) ( not ( = ?auto_195026 ?auto_195028 ) ) ( not ( = ?auto_195026 ?auto_195025 ) ) ( not ( = ?auto_195026 ?auto_195027 ) ) ( not ( = ?auto_195024 ?auto_195028 ) ) ( not ( = ?auto_195024 ?auto_195025 ) ) ( not ( = ?auto_195024 ?auto_195027 ) ) ( ON ?auto_195023 ?auto_195024 ) ( ON ?auto_195028 ?auto_195023 ) ( ON ?auto_195027 ?auto_195028 ) ( CLEAR ?auto_195027 ) ( HOLDING ?auto_195025 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_195025 )
      ( MAKE-2PILE ?auto_195021 ?auto_195022 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195029 - BLOCK
      ?auto_195030 - BLOCK
    )
    :vars
    (
      ?auto_195032 - BLOCK
      ?auto_195036 - BLOCK
      ?auto_195033 - BLOCK
      ?auto_195035 - BLOCK
      ?auto_195031 - BLOCK
      ?auto_195034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195032 ?auto_195030 ) ( ON-TABLE ?auto_195029 ) ( ON ?auto_195030 ?auto_195029 ) ( not ( = ?auto_195029 ?auto_195030 ) ) ( not ( = ?auto_195029 ?auto_195032 ) ) ( not ( = ?auto_195030 ?auto_195032 ) ) ( not ( = ?auto_195029 ?auto_195036 ) ) ( not ( = ?auto_195029 ?auto_195033 ) ) ( not ( = ?auto_195030 ?auto_195036 ) ) ( not ( = ?auto_195030 ?auto_195033 ) ) ( not ( = ?auto_195032 ?auto_195036 ) ) ( not ( = ?auto_195032 ?auto_195033 ) ) ( not ( = ?auto_195036 ?auto_195033 ) ) ( ON ?auto_195036 ?auto_195032 ) ( not ( = ?auto_195035 ?auto_195031 ) ) ( not ( = ?auto_195035 ?auto_195034 ) ) ( not ( = ?auto_195035 ?auto_195033 ) ) ( not ( = ?auto_195031 ?auto_195034 ) ) ( not ( = ?auto_195031 ?auto_195033 ) ) ( not ( = ?auto_195034 ?auto_195033 ) ) ( not ( = ?auto_195029 ?auto_195034 ) ) ( not ( = ?auto_195029 ?auto_195035 ) ) ( not ( = ?auto_195029 ?auto_195031 ) ) ( not ( = ?auto_195030 ?auto_195034 ) ) ( not ( = ?auto_195030 ?auto_195035 ) ) ( not ( = ?auto_195030 ?auto_195031 ) ) ( not ( = ?auto_195032 ?auto_195034 ) ) ( not ( = ?auto_195032 ?auto_195035 ) ) ( not ( = ?auto_195032 ?auto_195031 ) ) ( not ( = ?auto_195036 ?auto_195034 ) ) ( not ( = ?auto_195036 ?auto_195035 ) ) ( not ( = ?auto_195036 ?auto_195031 ) ) ( ON ?auto_195033 ?auto_195036 ) ( ON ?auto_195034 ?auto_195033 ) ( ON ?auto_195031 ?auto_195034 ) ( ON ?auto_195035 ?auto_195031 ) ( CLEAR ?auto_195035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195029 ?auto_195030 ?auto_195032 ?auto_195036 ?auto_195033 ?auto_195034 ?auto_195031 )
      ( MAKE-2PILE ?auto_195029 ?auto_195030 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195037 - BLOCK
      ?auto_195038 - BLOCK
    )
    :vars
    (
      ?auto_195044 - BLOCK
      ?auto_195043 - BLOCK
      ?auto_195039 - BLOCK
      ?auto_195040 - BLOCK
      ?auto_195041 - BLOCK
      ?auto_195042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195044 ?auto_195038 ) ( ON-TABLE ?auto_195037 ) ( ON ?auto_195038 ?auto_195037 ) ( not ( = ?auto_195037 ?auto_195038 ) ) ( not ( = ?auto_195037 ?auto_195044 ) ) ( not ( = ?auto_195038 ?auto_195044 ) ) ( not ( = ?auto_195037 ?auto_195043 ) ) ( not ( = ?auto_195037 ?auto_195039 ) ) ( not ( = ?auto_195038 ?auto_195043 ) ) ( not ( = ?auto_195038 ?auto_195039 ) ) ( not ( = ?auto_195044 ?auto_195043 ) ) ( not ( = ?auto_195044 ?auto_195039 ) ) ( not ( = ?auto_195043 ?auto_195039 ) ) ( ON ?auto_195043 ?auto_195044 ) ( not ( = ?auto_195040 ?auto_195041 ) ) ( not ( = ?auto_195040 ?auto_195042 ) ) ( not ( = ?auto_195040 ?auto_195039 ) ) ( not ( = ?auto_195041 ?auto_195042 ) ) ( not ( = ?auto_195041 ?auto_195039 ) ) ( not ( = ?auto_195042 ?auto_195039 ) ) ( not ( = ?auto_195037 ?auto_195042 ) ) ( not ( = ?auto_195037 ?auto_195040 ) ) ( not ( = ?auto_195037 ?auto_195041 ) ) ( not ( = ?auto_195038 ?auto_195042 ) ) ( not ( = ?auto_195038 ?auto_195040 ) ) ( not ( = ?auto_195038 ?auto_195041 ) ) ( not ( = ?auto_195044 ?auto_195042 ) ) ( not ( = ?auto_195044 ?auto_195040 ) ) ( not ( = ?auto_195044 ?auto_195041 ) ) ( not ( = ?auto_195043 ?auto_195042 ) ) ( not ( = ?auto_195043 ?auto_195040 ) ) ( not ( = ?auto_195043 ?auto_195041 ) ) ( ON ?auto_195039 ?auto_195043 ) ( ON ?auto_195042 ?auto_195039 ) ( ON ?auto_195041 ?auto_195042 ) ( HOLDING ?auto_195040 ) ( CLEAR ?auto_195041 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_195037 ?auto_195038 ?auto_195044 ?auto_195043 ?auto_195039 ?auto_195042 ?auto_195041 ?auto_195040 )
      ( MAKE-2PILE ?auto_195037 ?auto_195038 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195045 - BLOCK
      ?auto_195046 - BLOCK
    )
    :vars
    (
      ?auto_195052 - BLOCK
      ?auto_195048 - BLOCK
      ?auto_195051 - BLOCK
      ?auto_195047 - BLOCK
      ?auto_195049 - BLOCK
      ?auto_195050 - BLOCK
      ?auto_195053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195052 ?auto_195046 ) ( ON-TABLE ?auto_195045 ) ( ON ?auto_195046 ?auto_195045 ) ( not ( = ?auto_195045 ?auto_195046 ) ) ( not ( = ?auto_195045 ?auto_195052 ) ) ( not ( = ?auto_195046 ?auto_195052 ) ) ( not ( = ?auto_195045 ?auto_195048 ) ) ( not ( = ?auto_195045 ?auto_195051 ) ) ( not ( = ?auto_195046 ?auto_195048 ) ) ( not ( = ?auto_195046 ?auto_195051 ) ) ( not ( = ?auto_195052 ?auto_195048 ) ) ( not ( = ?auto_195052 ?auto_195051 ) ) ( not ( = ?auto_195048 ?auto_195051 ) ) ( ON ?auto_195048 ?auto_195052 ) ( not ( = ?auto_195047 ?auto_195049 ) ) ( not ( = ?auto_195047 ?auto_195050 ) ) ( not ( = ?auto_195047 ?auto_195051 ) ) ( not ( = ?auto_195049 ?auto_195050 ) ) ( not ( = ?auto_195049 ?auto_195051 ) ) ( not ( = ?auto_195050 ?auto_195051 ) ) ( not ( = ?auto_195045 ?auto_195050 ) ) ( not ( = ?auto_195045 ?auto_195047 ) ) ( not ( = ?auto_195045 ?auto_195049 ) ) ( not ( = ?auto_195046 ?auto_195050 ) ) ( not ( = ?auto_195046 ?auto_195047 ) ) ( not ( = ?auto_195046 ?auto_195049 ) ) ( not ( = ?auto_195052 ?auto_195050 ) ) ( not ( = ?auto_195052 ?auto_195047 ) ) ( not ( = ?auto_195052 ?auto_195049 ) ) ( not ( = ?auto_195048 ?auto_195050 ) ) ( not ( = ?auto_195048 ?auto_195047 ) ) ( not ( = ?auto_195048 ?auto_195049 ) ) ( ON ?auto_195051 ?auto_195048 ) ( ON ?auto_195050 ?auto_195051 ) ( ON ?auto_195049 ?auto_195050 ) ( CLEAR ?auto_195049 ) ( ON ?auto_195047 ?auto_195053 ) ( CLEAR ?auto_195047 ) ( HAND-EMPTY ) ( not ( = ?auto_195045 ?auto_195053 ) ) ( not ( = ?auto_195046 ?auto_195053 ) ) ( not ( = ?auto_195052 ?auto_195053 ) ) ( not ( = ?auto_195048 ?auto_195053 ) ) ( not ( = ?auto_195051 ?auto_195053 ) ) ( not ( = ?auto_195047 ?auto_195053 ) ) ( not ( = ?auto_195049 ?auto_195053 ) ) ( not ( = ?auto_195050 ?auto_195053 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195047 ?auto_195053 )
      ( MAKE-2PILE ?auto_195045 ?auto_195046 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195054 - BLOCK
      ?auto_195055 - BLOCK
    )
    :vars
    (
      ?auto_195058 - BLOCK
      ?auto_195060 - BLOCK
      ?auto_195056 - BLOCK
      ?auto_195059 - BLOCK
      ?auto_195057 - BLOCK
      ?auto_195062 - BLOCK
      ?auto_195061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195058 ?auto_195055 ) ( ON-TABLE ?auto_195054 ) ( ON ?auto_195055 ?auto_195054 ) ( not ( = ?auto_195054 ?auto_195055 ) ) ( not ( = ?auto_195054 ?auto_195058 ) ) ( not ( = ?auto_195055 ?auto_195058 ) ) ( not ( = ?auto_195054 ?auto_195060 ) ) ( not ( = ?auto_195054 ?auto_195056 ) ) ( not ( = ?auto_195055 ?auto_195060 ) ) ( not ( = ?auto_195055 ?auto_195056 ) ) ( not ( = ?auto_195058 ?auto_195060 ) ) ( not ( = ?auto_195058 ?auto_195056 ) ) ( not ( = ?auto_195060 ?auto_195056 ) ) ( ON ?auto_195060 ?auto_195058 ) ( not ( = ?auto_195059 ?auto_195057 ) ) ( not ( = ?auto_195059 ?auto_195062 ) ) ( not ( = ?auto_195059 ?auto_195056 ) ) ( not ( = ?auto_195057 ?auto_195062 ) ) ( not ( = ?auto_195057 ?auto_195056 ) ) ( not ( = ?auto_195062 ?auto_195056 ) ) ( not ( = ?auto_195054 ?auto_195062 ) ) ( not ( = ?auto_195054 ?auto_195059 ) ) ( not ( = ?auto_195054 ?auto_195057 ) ) ( not ( = ?auto_195055 ?auto_195062 ) ) ( not ( = ?auto_195055 ?auto_195059 ) ) ( not ( = ?auto_195055 ?auto_195057 ) ) ( not ( = ?auto_195058 ?auto_195062 ) ) ( not ( = ?auto_195058 ?auto_195059 ) ) ( not ( = ?auto_195058 ?auto_195057 ) ) ( not ( = ?auto_195060 ?auto_195062 ) ) ( not ( = ?auto_195060 ?auto_195059 ) ) ( not ( = ?auto_195060 ?auto_195057 ) ) ( ON ?auto_195056 ?auto_195060 ) ( ON ?auto_195062 ?auto_195056 ) ( ON ?auto_195059 ?auto_195061 ) ( CLEAR ?auto_195059 ) ( not ( = ?auto_195054 ?auto_195061 ) ) ( not ( = ?auto_195055 ?auto_195061 ) ) ( not ( = ?auto_195058 ?auto_195061 ) ) ( not ( = ?auto_195060 ?auto_195061 ) ) ( not ( = ?auto_195056 ?auto_195061 ) ) ( not ( = ?auto_195059 ?auto_195061 ) ) ( not ( = ?auto_195057 ?auto_195061 ) ) ( not ( = ?auto_195062 ?auto_195061 ) ) ( HOLDING ?auto_195057 ) ( CLEAR ?auto_195062 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195054 ?auto_195055 ?auto_195058 ?auto_195060 ?auto_195056 ?auto_195062 ?auto_195057 )
      ( MAKE-2PILE ?auto_195054 ?auto_195055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195063 - BLOCK
      ?auto_195064 - BLOCK
    )
    :vars
    (
      ?auto_195065 - BLOCK
      ?auto_195066 - BLOCK
      ?auto_195071 - BLOCK
      ?auto_195069 - BLOCK
      ?auto_195070 - BLOCK
      ?auto_195067 - BLOCK
      ?auto_195068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195065 ?auto_195064 ) ( ON-TABLE ?auto_195063 ) ( ON ?auto_195064 ?auto_195063 ) ( not ( = ?auto_195063 ?auto_195064 ) ) ( not ( = ?auto_195063 ?auto_195065 ) ) ( not ( = ?auto_195064 ?auto_195065 ) ) ( not ( = ?auto_195063 ?auto_195066 ) ) ( not ( = ?auto_195063 ?auto_195071 ) ) ( not ( = ?auto_195064 ?auto_195066 ) ) ( not ( = ?auto_195064 ?auto_195071 ) ) ( not ( = ?auto_195065 ?auto_195066 ) ) ( not ( = ?auto_195065 ?auto_195071 ) ) ( not ( = ?auto_195066 ?auto_195071 ) ) ( ON ?auto_195066 ?auto_195065 ) ( not ( = ?auto_195069 ?auto_195070 ) ) ( not ( = ?auto_195069 ?auto_195067 ) ) ( not ( = ?auto_195069 ?auto_195071 ) ) ( not ( = ?auto_195070 ?auto_195067 ) ) ( not ( = ?auto_195070 ?auto_195071 ) ) ( not ( = ?auto_195067 ?auto_195071 ) ) ( not ( = ?auto_195063 ?auto_195067 ) ) ( not ( = ?auto_195063 ?auto_195069 ) ) ( not ( = ?auto_195063 ?auto_195070 ) ) ( not ( = ?auto_195064 ?auto_195067 ) ) ( not ( = ?auto_195064 ?auto_195069 ) ) ( not ( = ?auto_195064 ?auto_195070 ) ) ( not ( = ?auto_195065 ?auto_195067 ) ) ( not ( = ?auto_195065 ?auto_195069 ) ) ( not ( = ?auto_195065 ?auto_195070 ) ) ( not ( = ?auto_195066 ?auto_195067 ) ) ( not ( = ?auto_195066 ?auto_195069 ) ) ( not ( = ?auto_195066 ?auto_195070 ) ) ( ON ?auto_195071 ?auto_195066 ) ( ON ?auto_195067 ?auto_195071 ) ( ON ?auto_195069 ?auto_195068 ) ( not ( = ?auto_195063 ?auto_195068 ) ) ( not ( = ?auto_195064 ?auto_195068 ) ) ( not ( = ?auto_195065 ?auto_195068 ) ) ( not ( = ?auto_195066 ?auto_195068 ) ) ( not ( = ?auto_195071 ?auto_195068 ) ) ( not ( = ?auto_195069 ?auto_195068 ) ) ( not ( = ?auto_195070 ?auto_195068 ) ) ( not ( = ?auto_195067 ?auto_195068 ) ) ( CLEAR ?auto_195067 ) ( ON ?auto_195070 ?auto_195069 ) ( CLEAR ?auto_195070 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_195068 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195068 ?auto_195069 )
      ( MAKE-2PILE ?auto_195063 ?auto_195064 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195072 - BLOCK
      ?auto_195073 - BLOCK
    )
    :vars
    (
      ?auto_195074 - BLOCK
      ?auto_195079 - BLOCK
      ?auto_195076 - BLOCK
      ?auto_195077 - BLOCK
      ?auto_195078 - BLOCK
      ?auto_195075 - BLOCK
      ?auto_195080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195074 ?auto_195073 ) ( ON-TABLE ?auto_195072 ) ( ON ?auto_195073 ?auto_195072 ) ( not ( = ?auto_195072 ?auto_195073 ) ) ( not ( = ?auto_195072 ?auto_195074 ) ) ( not ( = ?auto_195073 ?auto_195074 ) ) ( not ( = ?auto_195072 ?auto_195079 ) ) ( not ( = ?auto_195072 ?auto_195076 ) ) ( not ( = ?auto_195073 ?auto_195079 ) ) ( not ( = ?auto_195073 ?auto_195076 ) ) ( not ( = ?auto_195074 ?auto_195079 ) ) ( not ( = ?auto_195074 ?auto_195076 ) ) ( not ( = ?auto_195079 ?auto_195076 ) ) ( ON ?auto_195079 ?auto_195074 ) ( not ( = ?auto_195077 ?auto_195078 ) ) ( not ( = ?auto_195077 ?auto_195075 ) ) ( not ( = ?auto_195077 ?auto_195076 ) ) ( not ( = ?auto_195078 ?auto_195075 ) ) ( not ( = ?auto_195078 ?auto_195076 ) ) ( not ( = ?auto_195075 ?auto_195076 ) ) ( not ( = ?auto_195072 ?auto_195075 ) ) ( not ( = ?auto_195072 ?auto_195077 ) ) ( not ( = ?auto_195072 ?auto_195078 ) ) ( not ( = ?auto_195073 ?auto_195075 ) ) ( not ( = ?auto_195073 ?auto_195077 ) ) ( not ( = ?auto_195073 ?auto_195078 ) ) ( not ( = ?auto_195074 ?auto_195075 ) ) ( not ( = ?auto_195074 ?auto_195077 ) ) ( not ( = ?auto_195074 ?auto_195078 ) ) ( not ( = ?auto_195079 ?auto_195075 ) ) ( not ( = ?auto_195079 ?auto_195077 ) ) ( not ( = ?auto_195079 ?auto_195078 ) ) ( ON ?auto_195076 ?auto_195079 ) ( ON ?auto_195077 ?auto_195080 ) ( not ( = ?auto_195072 ?auto_195080 ) ) ( not ( = ?auto_195073 ?auto_195080 ) ) ( not ( = ?auto_195074 ?auto_195080 ) ) ( not ( = ?auto_195079 ?auto_195080 ) ) ( not ( = ?auto_195076 ?auto_195080 ) ) ( not ( = ?auto_195077 ?auto_195080 ) ) ( not ( = ?auto_195078 ?auto_195080 ) ) ( not ( = ?auto_195075 ?auto_195080 ) ) ( ON ?auto_195078 ?auto_195077 ) ( CLEAR ?auto_195078 ) ( ON-TABLE ?auto_195080 ) ( HOLDING ?auto_195075 ) ( CLEAR ?auto_195076 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195072 ?auto_195073 ?auto_195074 ?auto_195079 ?auto_195076 ?auto_195075 )
      ( MAKE-2PILE ?auto_195072 ?auto_195073 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195081 - BLOCK
      ?auto_195082 - BLOCK
    )
    :vars
    (
      ?auto_195087 - BLOCK
      ?auto_195085 - BLOCK
      ?auto_195088 - BLOCK
      ?auto_195083 - BLOCK
      ?auto_195084 - BLOCK
      ?auto_195089 - BLOCK
      ?auto_195086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195087 ?auto_195082 ) ( ON-TABLE ?auto_195081 ) ( ON ?auto_195082 ?auto_195081 ) ( not ( = ?auto_195081 ?auto_195082 ) ) ( not ( = ?auto_195081 ?auto_195087 ) ) ( not ( = ?auto_195082 ?auto_195087 ) ) ( not ( = ?auto_195081 ?auto_195085 ) ) ( not ( = ?auto_195081 ?auto_195088 ) ) ( not ( = ?auto_195082 ?auto_195085 ) ) ( not ( = ?auto_195082 ?auto_195088 ) ) ( not ( = ?auto_195087 ?auto_195085 ) ) ( not ( = ?auto_195087 ?auto_195088 ) ) ( not ( = ?auto_195085 ?auto_195088 ) ) ( ON ?auto_195085 ?auto_195087 ) ( not ( = ?auto_195083 ?auto_195084 ) ) ( not ( = ?auto_195083 ?auto_195089 ) ) ( not ( = ?auto_195083 ?auto_195088 ) ) ( not ( = ?auto_195084 ?auto_195089 ) ) ( not ( = ?auto_195084 ?auto_195088 ) ) ( not ( = ?auto_195089 ?auto_195088 ) ) ( not ( = ?auto_195081 ?auto_195089 ) ) ( not ( = ?auto_195081 ?auto_195083 ) ) ( not ( = ?auto_195081 ?auto_195084 ) ) ( not ( = ?auto_195082 ?auto_195089 ) ) ( not ( = ?auto_195082 ?auto_195083 ) ) ( not ( = ?auto_195082 ?auto_195084 ) ) ( not ( = ?auto_195087 ?auto_195089 ) ) ( not ( = ?auto_195087 ?auto_195083 ) ) ( not ( = ?auto_195087 ?auto_195084 ) ) ( not ( = ?auto_195085 ?auto_195089 ) ) ( not ( = ?auto_195085 ?auto_195083 ) ) ( not ( = ?auto_195085 ?auto_195084 ) ) ( ON ?auto_195088 ?auto_195085 ) ( ON ?auto_195083 ?auto_195086 ) ( not ( = ?auto_195081 ?auto_195086 ) ) ( not ( = ?auto_195082 ?auto_195086 ) ) ( not ( = ?auto_195087 ?auto_195086 ) ) ( not ( = ?auto_195085 ?auto_195086 ) ) ( not ( = ?auto_195088 ?auto_195086 ) ) ( not ( = ?auto_195083 ?auto_195086 ) ) ( not ( = ?auto_195084 ?auto_195086 ) ) ( not ( = ?auto_195089 ?auto_195086 ) ) ( ON ?auto_195084 ?auto_195083 ) ( ON-TABLE ?auto_195086 ) ( CLEAR ?auto_195088 ) ( ON ?auto_195089 ?auto_195084 ) ( CLEAR ?auto_195089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195086 ?auto_195083 ?auto_195084 )
      ( MAKE-2PILE ?auto_195081 ?auto_195082 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195090 - BLOCK
      ?auto_195091 - BLOCK
    )
    :vars
    (
      ?auto_195096 - BLOCK
      ?auto_195098 - BLOCK
      ?auto_195094 - BLOCK
      ?auto_195092 - BLOCK
      ?auto_195093 - BLOCK
      ?auto_195097 - BLOCK
      ?auto_195095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195096 ?auto_195091 ) ( ON-TABLE ?auto_195090 ) ( ON ?auto_195091 ?auto_195090 ) ( not ( = ?auto_195090 ?auto_195091 ) ) ( not ( = ?auto_195090 ?auto_195096 ) ) ( not ( = ?auto_195091 ?auto_195096 ) ) ( not ( = ?auto_195090 ?auto_195098 ) ) ( not ( = ?auto_195090 ?auto_195094 ) ) ( not ( = ?auto_195091 ?auto_195098 ) ) ( not ( = ?auto_195091 ?auto_195094 ) ) ( not ( = ?auto_195096 ?auto_195098 ) ) ( not ( = ?auto_195096 ?auto_195094 ) ) ( not ( = ?auto_195098 ?auto_195094 ) ) ( ON ?auto_195098 ?auto_195096 ) ( not ( = ?auto_195092 ?auto_195093 ) ) ( not ( = ?auto_195092 ?auto_195097 ) ) ( not ( = ?auto_195092 ?auto_195094 ) ) ( not ( = ?auto_195093 ?auto_195097 ) ) ( not ( = ?auto_195093 ?auto_195094 ) ) ( not ( = ?auto_195097 ?auto_195094 ) ) ( not ( = ?auto_195090 ?auto_195097 ) ) ( not ( = ?auto_195090 ?auto_195092 ) ) ( not ( = ?auto_195090 ?auto_195093 ) ) ( not ( = ?auto_195091 ?auto_195097 ) ) ( not ( = ?auto_195091 ?auto_195092 ) ) ( not ( = ?auto_195091 ?auto_195093 ) ) ( not ( = ?auto_195096 ?auto_195097 ) ) ( not ( = ?auto_195096 ?auto_195092 ) ) ( not ( = ?auto_195096 ?auto_195093 ) ) ( not ( = ?auto_195098 ?auto_195097 ) ) ( not ( = ?auto_195098 ?auto_195092 ) ) ( not ( = ?auto_195098 ?auto_195093 ) ) ( ON ?auto_195092 ?auto_195095 ) ( not ( = ?auto_195090 ?auto_195095 ) ) ( not ( = ?auto_195091 ?auto_195095 ) ) ( not ( = ?auto_195096 ?auto_195095 ) ) ( not ( = ?auto_195098 ?auto_195095 ) ) ( not ( = ?auto_195094 ?auto_195095 ) ) ( not ( = ?auto_195092 ?auto_195095 ) ) ( not ( = ?auto_195093 ?auto_195095 ) ) ( not ( = ?auto_195097 ?auto_195095 ) ) ( ON ?auto_195093 ?auto_195092 ) ( ON-TABLE ?auto_195095 ) ( ON ?auto_195097 ?auto_195093 ) ( CLEAR ?auto_195097 ) ( HOLDING ?auto_195094 ) ( CLEAR ?auto_195098 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195090 ?auto_195091 ?auto_195096 ?auto_195098 ?auto_195094 )
      ( MAKE-2PILE ?auto_195090 ?auto_195091 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195099 - BLOCK
      ?auto_195100 - BLOCK
    )
    :vars
    (
      ?auto_195101 - BLOCK
      ?auto_195102 - BLOCK
      ?auto_195103 - BLOCK
      ?auto_195107 - BLOCK
      ?auto_195105 - BLOCK
      ?auto_195106 - BLOCK
      ?auto_195104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195101 ?auto_195100 ) ( ON-TABLE ?auto_195099 ) ( ON ?auto_195100 ?auto_195099 ) ( not ( = ?auto_195099 ?auto_195100 ) ) ( not ( = ?auto_195099 ?auto_195101 ) ) ( not ( = ?auto_195100 ?auto_195101 ) ) ( not ( = ?auto_195099 ?auto_195102 ) ) ( not ( = ?auto_195099 ?auto_195103 ) ) ( not ( = ?auto_195100 ?auto_195102 ) ) ( not ( = ?auto_195100 ?auto_195103 ) ) ( not ( = ?auto_195101 ?auto_195102 ) ) ( not ( = ?auto_195101 ?auto_195103 ) ) ( not ( = ?auto_195102 ?auto_195103 ) ) ( ON ?auto_195102 ?auto_195101 ) ( not ( = ?auto_195107 ?auto_195105 ) ) ( not ( = ?auto_195107 ?auto_195106 ) ) ( not ( = ?auto_195107 ?auto_195103 ) ) ( not ( = ?auto_195105 ?auto_195106 ) ) ( not ( = ?auto_195105 ?auto_195103 ) ) ( not ( = ?auto_195106 ?auto_195103 ) ) ( not ( = ?auto_195099 ?auto_195106 ) ) ( not ( = ?auto_195099 ?auto_195107 ) ) ( not ( = ?auto_195099 ?auto_195105 ) ) ( not ( = ?auto_195100 ?auto_195106 ) ) ( not ( = ?auto_195100 ?auto_195107 ) ) ( not ( = ?auto_195100 ?auto_195105 ) ) ( not ( = ?auto_195101 ?auto_195106 ) ) ( not ( = ?auto_195101 ?auto_195107 ) ) ( not ( = ?auto_195101 ?auto_195105 ) ) ( not ( = ?auto_195102 ?auto_195106 ) ) ( not ( = ?auto_195102 ?auto_195107 ) ) ( not ( = ?auto_195102 ?auto_195105 ) ) ( ON ?auto_195107 ?auto_195104 ) ( not ( = ?auto_195099 ?auto_195104 ) ) ( not ( = ?auto_195100 ?auto_195104 ) ) ( not ( = ?auto_195101 ?auto_195104 ) ) ( not ( = ?auto_195102 ?auto_195104 ) ) ( not ( = ?auto_195103 ?auto_195104 ) ) ( not ( = ?auto_195107 ?auto_195104 ) ) ( not ( = ?auto_195105 ?auto_195104 ) ) ( not ( = ?auto_195106 ?auto_195104 ) ) ( ON ?auto_195105 ?auto_195107 ) ( ON-TABLE ?auto_195104 ) ( ON ?auto_195106 ?auto_195105 ) ( CLEAR ?auto_195102 ) ( ON ?auto_195103 ?auto_195106 ) ( CLEAR ?auto_195103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195104 ?auto_195107 ?auto_195105 ?auto_195106 )
      ( MAKE-2PILE ?auto_195099 ?auto_195100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195108 - BLOCK
      ?auto_195109 - BLOCK
    )
    :vars
    (
      ?auto_195114 - BLOCK
      ?auto_195111 - BLOCK
      ?auto_195110 - BLOCK
      ?auto_195112 - BLOCK
      ?auto_195116 - BLOCK
      ?auto_195115 - BLOCK
      ?auto_195113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195114 ?auto_195109 ) ( ON-TABLE ?auto_195108 ) ( ON ?auto_195109 ?auto_195108 ) ( not ( = ?auto_195108 ?auto_195109 ) ) ( not ( = ?auto_195108 ?auto_195114 ) ) ( not ( = ?auto_195109 ?auto_195114 ) ) ( not ( = ?auto_195108 ?auto_195111 ) ) ( not ( = ?auto_195108 ?auto_195110 ) ) ( not ( = ?auto_195109 ?auto_195111 ) ) ( not ( = ?auto_195109 ?auto_195110 ) ) ( not ( = ?auto_195114 ?auto_195111 ) ) ( not ( = ?auto_195114 ?auto_195110 ) ) ( not ( = ?auto_195111 ?auto_195110 ) ) ( not ( = ?auto_195112 ?auto_195116 ) ) ( not ( = ?auto_195112 ?auto_195115 ) ) ( not ( = ?auto_195112 ?auto_195110 ) ) ( not ( = ?auto_195116 ?auto_195115 ) ) ( not ( = ?auto_195116 ?auto_195110 ) ) ( not ( = ?auto_195115 ?auto_195110 ) ) ( not ( = ?auto_195108 ?auto_195115 ) ) ( not ( = ?auto_195108 ?auto_195112 ) ) ( not ( = ?auto_195108 ?auto_195116 ) ) ( not ( = ?auto_195109 ?auto_195115 ) ) ( not ( = ?auto_195109 ?auto_195112 ) ) ( not ( = ?auto_195109 ?auto_195116 ) ) ( not ( = ?auto_195114 ?auto_195115 ) ) ( not ( = ?auto_195114 ?auto_195112 ) ) ( not ( = ?auto_195114 ?auto_195116 ) ) ( not ( = ?auto_195111 ?auto_195115 ) ) ( not ( = ?auto_195111 ?auto_195112 ) ) ( not ( = ?auto_195111 ?auto_195116 ) ) ( ON ?auto_195112 ?auto_195113 ) ( not ( = ?auto_195108 ?auto_195113 ) ) ( not ( = ?auto_195109 ?auto_195113 ) ) ( not ( = ?auto_195114 ?auto_195113 ) ) ( not ( = ?auto_195111 ?auto_195113 ) ) ( not ( = ?auto_195110 ?auto_195113 ) ) ( not ( = ?auto_195112 ?auto_195113 ) ) ( not ( = ?auto_195116 ?auto_195113 ) ) ( not ( = ?auto_195115 ?auto_195113 ) ) ( ON ?auto_195116 ?auto_195112 ) ( ON-TABLE ?auto_195113 ) ( ON ?auto_195115 ?auto_195116 ) ( ON ?auto_195110 ?auto_195115 ) ( CLEAR ?auto_195110 ) ( HOLDING ?auto_195111 ) ( CLEAR ?auto_195114 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195108 ?auto_195109 ?auto_195114 ?auto_195111 )
      ( MAKE-2PILE ?auto_195108 ?auto_195109 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195117 - BLOCK
      ?auto_195118 - BLOCK
    )
    :vars
    (
      ?auto_195122 - BLOCK
      ?auto_195123 - BLOCK
      ?auto_195121 - BLOCK
      ?auto_195120 - BLOCK
      ?auto_195125 - BLOCK
      ?auto_195119 - BLOCK
      ?auto_195124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195122 ?auto_195118 ) ( ON-TABLE ?auto_195117 ) ( ON ?auto_195118 ?auto_195117 ) ( not ( = ?auto_195117 ?auto_195118 ) ) ( not ( = ?auto_195117 ?auto_195122 ) ) ( not ( = ?auto_195118 ?auto_195122 ) ) ( not ( = ?auto_195117 ?auto_195123 ) ) ( not ( = ?auto_195117 ?auto_195121 ) ) ( not ( = ?auto_195118 ?auto_195123 ) ) ( not ( = ?auto_195118 ?auto_195121 ) ) ( not ( = ?auto_195122 ?auto_195123 ) ) ( not ( = ?auto_195122 ?auto_195121 ) ) ( not ( = ?auto_195123 ?auto_195121 ) ) ( not ( = ?auto_195120 ?auto_195125 ) ) ( not ( = ?auto_195120 ?auto_195119 ) ) ( not ( = ?auto_195120 ?auto_195121 ) ) ( not ( = ?auto_195125 ?auto_195119 ) ) ( not ( = ?auto_195125 ?auto_195121 ) ) ( not ( = ?auto_195119 ?auto_195121 ) ) ( not ( = ?auto_195117 ?auto_195119 ) ) ( not ( = ?auto_195117 ?auto_195120 ) ) ( not ( = ?auto_195117 ?auto_195125 ) ) ( not ( = ?auto_195118 ?auto_195119 ) ) ( not ( = ?auto_195118 ?auto_195120 ) ) ( not ( = ?auto_195118 ?auto_195125 ) ) ( not ( = ?auto_195122 ?auto_195119 ) ) ( not ( = ?auto_195122 ?auto_195120 ) ) ( not ( = ?auto_195122 ?auto_195125 ) ) ( not ( = ?auto_195123 ?auto_195119 ) ) ( not ( = ?auto_195123 ?auto_195120 ) ) ( not ( = ?auto_195123 ?auto_195125 ) ) ( ON ?auto_195120 ?auto_195124 ) ( not ( = ?auto_195117 ?auto_195124 ) ) ( not ( = ?auto_195118 ?auto_195124 ) ) ( not ( = ?auto_195122 ?auto_195124 ) ) ( not ( = ?auto_195123 ?auto_195124 ) ) ( not ( = ?auto_195121 ?auto_195124 ) ) ( not ( = ?auto_195120 ?auto_195124 ) ) ( not ( = ?auto_195125 ?auto_195124 ) ) ( not ( = ?auto_195119 ?auto_195124 ) ) ( ON ?auto_195125 ?auto_195120 ) ( ON-TABLE ?auto_195124 ) ( ON ?auto_195119 ?auto_195125 ) ( ON ?auto_195121 ?auto_195119 ) ( CLEAR ?auto_195122 ) ( ON ?auto_195123 ?auto_195121 ) ( CLEAR ?auto_195123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195124 ?auto_195120 ?auto_195125 ?auto_195119 ?auto_195121 )
      ( MAKE-2PILE ?auto_195117 ?auto_195118 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195144 - BLOCK
      ?auto_195145 - BLOCK
    )
    :vars
    (
      ?auto_195146 - BLOCK
      ?auto_195152 - BLOCK
      ?auto_195148 - BLOCK
      ?auto_195150 - BLOCK
      ?auto_195149 - BLOCK
      ?auto_195147 - BLOCK
      ?auto_195151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195144 ) ( not ( = ?auto_195144 ?auto_195145 ) ) ( not ( = ?auto_195144 ?auto_195146 ) ) ( not ( = ?auto_195145 ?auto_195146 ) ) ( not ( = ?auto_195144 ?auto_195152 ) ) ( not ( = ?auto_195144 ?auto_195148 ) ) ( not ( = ?auto_195145 ?auto_195152 ) ) ( not ( = ?auto_195145 ?auto_195148 ) ) ( not ( = ?auto_195146 ?auto_195152 ) ) ( not ( = ?auto_195146 ?auto_195148 ) ) ( not ( = ?auto_195152 ?auto_195148 ) ) ( not ( = ?auto_195150 ?auto_195149 ) ) ( not ( = ?auto_195150 ?auto_195147 ) ) ( not ( = ?auto_195150 ?auto_195148 ) ) ( not ( = ?auto_195149 ?auto_195147 ) ) ( not ( = ?auto_195149 ?auto_195148 ) ) ( not ( = ?auto_195147 ?auto_195148 ) ) ( not ( = ?auto_195144 ?auto_195147 ) ) ( not ( = ?auto_195144 ?auto_195150 ) ) ( not ( = ?auto_195144 ?auto_195149 ) ) ( not ( = ?auto_195145 ?auto_195147 ) ) ( not ( = ?auto_195145 ?auto_195150 ) ) ( not ( = ?auto_195145 ?auto_195149 ) ) ( not ( = ?auto_195146 ?auto_195147 ) ) ( not ( = ?auto_195146 ?auto_195150 ) ) ( not ( = ?auto_195146 ?auto_195149 ) ) ( not ( = ?auto_195152 ?auto_195147 ) ) ( not ( = ?auto_195152 ?auto_195150 ) ) ( not ( = ?auto_195152 ?auto_195149 ) ) ( ON ?auto_195150 ?auto_195151 ) ( not ( = ?auto_195144 ?auto_195151 ) ) ( not ( = ?auto_195145 ?auto_195151 ) ) ( not ( = ?auto_195146 ?auto_195151 ) ) ( not ( = ?auto_195152 ?auto_195151 ) ) ( not ( = ?auto_195148 ?auto_195151 ) ) ( not ( = ?auto_195150 ?auto_195151 ) ) ( not ( = ?auto_195149 ?auto_195151 ) ) ( not ( = ?auto_195147 ?auto_195151 ) ) ( ON ?auto_195149 ?auto_195150 ) ( ON-TABLE ?auto_195151 ) ( ON ?auto_195147 ?auto_195149 ) ( ON ?auto_195148 ?auto_195147 ) ( ON ?auto_195152 ?auto_195148 ) ( ON ?auto_195146 ?auto_195152 ) ( CLEAR ?auto_195146 ) ( HOLDING ?auto_195145 ) ( CLEAR ?auto_195144 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195144 ?auto_195145 ?auto_195146 )
      ( MAKE-2PILE ?auto_195144 ?auto_195145 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195153 - BLOCK
      ?auto_195154 - BLOCK
    )
    :vars
    (
      ?auto_195158 - BLOCK
      ?auto_195160 - BLOCK
      ?auto_195159 - BLOCK
      ?auto_195161 - BLOCK
      ?auto_195156 - BLOCK
      ?auto_195157 - BLOCK
      ?auto_195155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195153 ) ( not ( = ?auto_195153 ?auto_195154 ) ) ( not ( = ?auto_195153 ?auto_195158 ) ) ( not ( = ?auto_195154 ?auto_195158 ) ) ( not ( = ?auto_195153 ?auto_195160 ) ) ( not ( = ?auto_195153 ?auto_195159 ) ) ( not ( = ?auto_195154 ?auto_195160 ) ) ( not ( = ?auto_195154 ?auto_195159 ) ) ( not ( = ?auto_195158 ?auto_195160 ) ) ( not ( = ?auto_195158 ?auto_195159 ) ) ( not ( = ?auto_195160 ?auto_195159 ) ) ( not ( = ?auto_195161 ?auto_195156 ) ) ( not ( = ?auto_195161 ?auto_195157 ) ) ( not ( = ?auto_195161 ?auto_195159 ) ) ( not ( = ?auto_195156 ?auto_195157 ) ) ( not ( = ?auto_195156 ?auto_195159 ) ) ( not ( = ?auto_195157 ?auto_195159 ) ) ( not ( = ?auto_195153 ?auto_195157 ) ) ( not ( = ?auto_195153 ?auto_195161 ) ) ( not ( = ?auto_195153 ?auto_195156 ) ) ( not ( = ?auto_195154 ?auto_195157 ) ) ( not ( = ?auto_195154 ?auto_195161 ) ) ( not ( = ?auto_195154 ?auto_195156 ) ) ( not ( = ?auto_195158 ?auto_195157 ) ) ( not ( = ?auto_195158 ?auto_195161 ) ) ( not ( = ?auto_195158 ?auto_195156 ) ) ( not ( = ?auto_195160 ?auto_195157 ) ) ( not ( = ?auto_195160 ?auto_195161 ) ) ( not ( = ?auto_195160 ?auto_195156 ) ) ( ON ?auto_195161 ?auto_195155 ) ( not ( = ?auto_195153 ?auto_195155 ) ) ( not ( = ?auto_195154 ?auto_195155 ) ) ( not ( = ?auto_195158 ?auto_195155 ) ) ( not ( = ?auto_195160 ?auto_195155 ) ) ( not ( = ?auto_195159 ?auto_195155 ) ) ( not ( = ?auto_195161 ?auto_195155 ) ) ( not ( = ?auto_195156 ?auto_195155 ) ) ( not ( = ?auto_195157 ?auto_195155 ) ) ( ON ?auto_195156 ?auto_195161 ) ( ON-TABLE ?auto_195155 ) ( ON ?auto_195157 ?auto_195156 ) ( ON ?auto_195159 ?auto_195157 ) ( ON ?auto_195160 ?auto_195159 ) ( ON ?auto_195158 ?auto_195160 ) ( CLEAR ?auto_195153 ) ( ON ?auto_195154 ?auto_195158 ) ( CLEAR ?auto_195154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195155 ?auto_195161 ?auto_195156 ?auto_195157 ?auto_195159 ?auto_195160 ?auto_195158 )
      ( MAKE-2PILE ?auto_195153 ?auto_195154 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195162 - BLOCK
      ?auto_195163 - BLOCK
    )
    :vars
    (
      ?auto_195166 - BLOCK
      ?auto_195168 - BLOCK
      ?auto_195165 - BLOCK
      ?auto_195167 - BLOCK
      ?auto_195170 - BLOCK
      ?auto_195164 - BLOCK
      ?auto_195169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195162 ?auto_195163 ) ) ( not ( = ?auto_195162 ?auto_195166 ) ) ( not ( = ?auto_195163 ?auto_195166 ) ) ( not ( = ?auto_195162 ?auto_195168 ) ) ( not ( = ?auto_195162 ?auto_195165 ) ) ( not ( = ?auto_195163 ?auto_195168 ) ) ( not ( = ?auto_195163 ?auto_195165 ) ) ( not ( = ?auto_195166 ?auto_195168 ) ) ( not ( = ?auto_195166 ?auto_195165 ) ) ( not ( = ?auto_195168 ?auto_195165 ) ) ( not ( = ?auto_195167 ?auto_195170 ) ) ( not ( = ?auto_195167 ?auto_195164 ) ) ( not ( = ?auto_195167 ?auto_195165 ) ) ( not ( = ?auto_195170 ?auto_195164 ) ) ( not ( = ?auto_195170 ?auto_195165 ) ) ( not ( = ?auto_195164 ?auto_195165 ) ) ( not ( = ?auto_195162 ?auto_195164 ) ) ( not ( = ?auto_195162 ?auto_195167 ) ) ( not ( = ?auto_195162 ?auto_195170 ) ) ( not ( = ?auto_195163 ?auto_195164 ) ) ( not ( = ?auto_195163 ?auto_195167 ) ) ( not ( = ?auto_195163 ?auto_195170 ) ) ( not ( = ?auto_195166 ?auto_195164 ) ) ( not ( = ?auto_195166 ?auto_195167 ) ) ( not ( = ?auto_195166 ?auto_195170 ) ) ( not ( = ?auto_195168 ?auto_195164 ) ) ( not ( = ?auto_195168 ?auto_195167 ) ) ( not ( = ?auto_195168 ?auto_195170 ) ) ( ON ?auto_195167 ?auto_195169 ) ( not ( = ?auto_195162 ?auto_195169 ) ) ( not ( = ?auto_195163 ?auto_195169 ) ) ( not ( = ?auto_195166 ?auto_195169 ) ) ( not ( = ?auto_195168 ?auto_195169 ) ) ( not ( = ?auto_195165 ?auto_195169 ) ) ( not ( = ?auto_195167 ?auto_195169 ) ) ( not ( = ?auto_195170 ?auto_195169 ) ) ( not ( = ?auto_195164 ?auto_195169 ) ) ( ON ?auto_195170 ?auto_195167 ) ( ON-TABLE ?auto_195169 ) ( ON ?auto_195164 ?auto_195170 ) ( ON ?auto_195165 ?auto_195164 ) ( ON ?auto_195168 ?auto_195165 ) ( ON ?auto_195166 ?auto_195168 ) ( ON ?auto_195163 ?auto_195166 ) ( CLEAR ?auto_195163 ) ( HOLDING ?auto_195162 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_195162 )
      ( MAKE-2PILE ?auto_195162 ?auto_195163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_195171 - BLOCK
      ?auto_195172 - BLOCK
    )
    :vars
    (
      ?auto_195174 - BLOCK
      ?auto_195173 - BLOCK
      ?auto_195179 - BLOCK
      ?auto_195177 - BLOCK
      ?auto_195176 - BLOCK
      ?auto_195175 - BLOCK
      ?auto_195178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195171 ?auto_195172 ) ) ( not ( = ?auto_195171 ?auto_195174 ) ) ( not ( = ?auto_195172 ?auto_195174 ) ) ( not ( = ?auto_195171 ?auto_195173 ) ) ( not ( = ?auto_195171 ?auto_195179 ) ) ( not ( = ?auto_195172 ?auto_195173 ) ) ( not ( = ?auto_195172 ?auto_195179 ) ) ( not ( = ?auto_195174 ?auto_195173 ) ) ( not ( = ?auto_195174 ?auto_195179 ) ) ( not ( = ?auto_195173 ?auto_195179 ) ) ( not ( = ?auto_195177 ?auto_195176 ) ) ( not ( = ?auto_195177 ?auto_195175 ) ) ( not ( = ?auto_195177 ?auto_195179 ) ) ( not ( = ?auto_195176 ?auto_195175 ) ) ( not ( = ?auto_195176 ?auto_195179 ) ) ( not ( = ?auto_195175 ?auto_195179 ) ) ( not ( = ?auto_195171 ?auto_195175 ) ) ( not ( = ?auto_195171 ?auto_195177 ) ) ( not ( = ?auto_195171 ?auto_195176 ) ) ( not ( = ?auto_195172 ?auto_195175 ) ) ( not ( = ?auto_195172 ?auto_195177 ) ) ( not ( = ?auto_195172 ?auto_195176 ) ) ( not ( = ?auto_195174 ?auto_195175 ) ) ( not ( = ?auto_195174 ?auto_195177 ) ) ( not ( = ?auto_195174 ?auto_195176 ) ) ( not ( = ?auto_195173 ?auto_195175 ) ) ( not ( = ?auto_195173 ?auto_195177 ) ) ( not ( = ?auto_195173 ?auto_195176 ) ) ( ON ?auto_195177 ?auto_195178 ) ( not ( = ?auto_195171 ?auto_195178 ) ) ( not ( = ?auto_195172 ?auto_195178 ) ) ( not ( = ?auto_195174 ?auto_195178 ) ) ( not ( = ?auto_195173 ?auto_195178 ) ) ( not ( = ?auto_195179 ?auto_195178 ) ) ( not ( = ?auto_195177 ?auto_195178 ) ) ( not ( = ?auto_195176 ?auto_195178 ) ) ( not ( = ?auto_195175 ?auto_195178 ) ) ( ON ?auto_195176 ?auto_195177 ) ( ON-TABLE ?auto_195178 ) ( ON ?auto_195175 ?auto_195176 ) ( ON ?auto_195179 ?auto_195175 ) ( ON ?auto_195173 ?auto_195179 ) ( ON ?auto_195174 ?auto_195173 ) ( ON ?auto_195172 ?auto_195174 ) ( ON ?auto_195171 ?auto_195172 ) ( CLEAR ?auto_195171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_195178 ?auto_195177 ?auto_195176 ?auto_195175 ?auto_195179 ?auto_195173 ?auto_195174 ?auto_195172 )
      ( MAKE-2PILE ?auto_195171 ?auto_195172 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195186 - BLOCK
      ?auto_195187 - BLOCK
      ?auto_195188 - BLOCK
      ?auto_195189 - BLOCK
      ?auto_195190 - BLOCK
      ?auto_195191 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_195191 ) ( CLEAR ?auto_195190 ) ( ON-TABLE ?auto_195186 ) ( ON ?auto_195187 ?auto_195186 ) ( ON ?auto_195188 ?auto_195187 ) ( ON ?auto_195189 ?auto_195188 ) ( ON ?auto_195190 ?auto_195189 ) ( not ( = ?auto_195186 ?auto_195187 ) ) ( not ( = ?auto_195186 ?auto_195188 ) ) ( not ( = ?auto_195186 ?auto_195189 ) ) ( not ( = ?auto_195186 ?auto_195190 ) ) ( not ( = ?auto_195186 ?auto_195191 ) ) ( not ( = ?auto_195187 ?auto_195188 ) ) ( not ( = ?auto_195187 ?auto_195189 ) ) ( not ( = ?auto_195187 ?auto_195190 ) ) ( not ( = ?auto_195187 ?auto_195191 ) ) ( not ( = ?auto_195188 ?auto_195189 ) ) ( not ( = ?auto_195188 ?auto_195190 ) ) ( not ( = ?auto_195188 ?auto_195191 ) ) ( not ( = ?auto_195189 ?auto_195190 ) ) ( not ( = ?auto_195189 ?auto_195191 ) ) ( not ( = ?auto_195190 ?auto_195191 ) ) )
    :subtasks
    ( ( !STACK ?auto_195191 ?auto_195190 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195192 - BLOCK
      ?auto_195193 - BLOCK
      ?auto_195194 - BLOCK
      ?auto_195195 - BLOCK
      ?auto_195196 - BLOCK
      ?auto_195197 - BLOCK
    )
    :vars
    (
      ?auto_195198 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_195196 ) ( ON-TABLE ?auto_195192 ) ( ON ?auto_195193 ?auto_195192 ) ( ON ?auto_195194 ?auto_195193 ) ( ON ?auto_195195 ?auto_195194 ) ( ON ?auto_195196 ?auto_195195 ) ( not ( = ?auto_195192 ?auto_195193 ) ) ( not ( = ?auto_195192 ?auto_195194 ) ) ( not ( = ?auto_195192 ?auto_195195 ) ) ( not ( = ?auto_195192 ?auto_195196 ) ) ( not ( = ?auto_195192 ?auto_195197 ) ) ( not ( = ?auto_195193 ?auto_195194 ) ) ( not ( = ?auto_195193 ?auto_195195 ) ) ( not ( = ?auto_195193 ?auto_195196 ) ) ( not ( = ?auto_195193 ?auto_195197 ) ) ( not ( = ?auto_195194 ?auto_195195 ) ) ( not ( = ?auto_195194 ?auto_195196 ) ) ( not ( = ?auto_195194 ?auto_195197 ) ) ( not ( = ?auto_195195 ?auto_195196 ) ) ( not ( = ?auto_195195 ?auto_195197 ) ) ( not ( = ?auto_195196 ?auto_195197 ) ) ( ON ?auto_195197 ?auto_195198 ) ( CLEAR ?auto_195197 ) ( HAND-EMPTY ) ( not ( = ?auto_195192 ?auto_195198 ) ) ( not ( = ?auto_195193 ?auto_195198 ) ) ( not ( = ?auto_195194 ?auto_195198 ) ) ( not ( = ?auto_195195 ?auto_195198 ) ) ( not ( = ?auto_195196 ?auto_195198 ) ) ( not ( = ?auto_195197 ?auto_195198 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195197 ?auto_195198 )
      ( MAKE-6PILE ?auto_195192 ?auto_195193 ?auto_195194 ?auto_195195 ?auto_195196 ?auto_195197 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195199 - BLOCK
      ?auto_195200 - BLOCK
      ?auto_195201 - BLOCK
      ?auto_195202 - BLOCK
      ?auto_195203 - BLOCK
      ?auto_195204 - BLOCK
    )
    :vars
    (
      ?auto_195205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195199 ) ( ON ?auto_195200 ?auto_195199 ) ( ON ?auto_195201 ?auto_195200 ) ( ON ?auto_195202 ?auto_195201 ) ( not ( = ?auto_195199 ?auto_195200 ) ) ( not ( = ?auto_195199 ?auto_195201 ) ) ( not ( = ?auto_195199 ?auto_195202 ) ) ( not ( = ?auto_195199 ?auto_195203 ) ) ( not ( = ?auto_195199 ?auto_195204 ) ) ( not ( = ?auto_195200 ?auto_195201 ) ) ( not ( = ?auto_195200 ?auto_195202 ) ) ( not ( = ?auto_195200 ?auto_195203 ) ) ( not ( = ?auto_195200 ?auto_195204 ) ) ( not ( = ?auto_195201 ?auto_195202 ) ) ( not ( = ?auto_195201 ?auto_195203 ) ) ( not ( = ?auto_195201 ?auto_195204 ) ) ( not ( = ?auto_195202 ?auto_195203 ) ) ( not ( = ?auto_195202 ?auto_195204 ) ) ( not ( = ?auto_195203 ?auto_195204 ) ) ( ON ?auto_195204 ?auto_195205 ) ( CLEAR ?auto_195204 ) ( not ( = ?auto_195199 ?auto_195205 ) ) ( not ( = ?auto_195200 ?auto_195205 ) ) ( not ( = ?auto_195201 ?auto_195205 ) ) ( not ( = ?auto_195202 ?auto_195205 ) ) ( not ( = ?auto_195203 ?auto_195205 ) ) ( not ( = ?auto_195204 ?auto_195205 ) ) ( HOLDING ?auto_195203 ) ( CLEAR ?auto_195202 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195199 ?auto_195200 ?auto_195201 ?auto_195202 ?auto_195203 )
      ( MAKE-6PILE ?auto_195199 ?auto_195200 ?auto_195201 ?auto_195202 ?auto_195203 ?auto_195204 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195206 - BLOCK
      ?auto_195207 - BLOCK
      ?auto_195208 - BLOCK
      ?auto_195209 - BLOCK
      ?auto_195210 - BLOCK
      ?auto_195211 - BLOCK
    )
    :vars
    (
      ?auto_195212 - BLOCK
      ?auto_195213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195206 ) ( ON ?auto_195207 ?auto_195206 ) ( ON ?auto_195208 ?auto_195207 ) ( ON ?auto_195209 ?auto_195208 ) ( not ( = ?auto_195206 ?auto_195207 ) ) ( not ( = ?auto_195206 ?auto_195208 ) ) ( not ( = ?auto_195206 ?auto_195209 ) ) ( not ( = ?auto_195206 ?auto_195210 ) ) ( not ( = ?auto_195206 ?auto_195211 ) ) ( not ( = ?auto_195207 ?auto_195208 ) ) ( not ( = ?auto_195207 ?auto_195209 ) ) ( not ( = ?auto_195207 ?auto_195210 ) ) ( not ( = ?auto_195207 ?auto_195211 ) ) ( not ( = ?auto_195208 ?auto_195209 ) ) ( not ( = ?auto_195208 ?auto_195210 ) ) ( not ( = ?auto_195208 ?auto_195211 ) ) ( not ( = ?auto_195209 ?auto_195210 ) ) ( not ( = ?auto_195209 ?auto_195211 ) ) ( not ( = ?auto_195210 ?auto_195211 ) ) ( ON ?auto_195211 ?auto_195212 ) ( not ( = ?auto_195206 ?auto_195212 ) ) ( not ( = ?auto_195207 ?auto_195212 ) ) ( not ( = ?auto_195208 ?auto_195212 ) ) ( not ( = ?auto_195209 ?auto_195212 ) ) ( not ( = ?auto_195210 ?auto_195212 ) ) ( not ( = ?auto_195211 ?auto_195212 ) ) ( CLEAR ?auto_195209 ) ( ON ?auto_195210 ?auto_195211 ) ( CLEAR ?auto_195210 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_195213 ) ( ON ?auto_195212 ?auto_195213 ) ( not ( = ?auto_195213 ?auto_195212 ) ) ( not ( = ?auto_195213 ?auto_195211 ) ) ( not ( = ?auto_195213 ?auto_195210 ) ) ( not ( = ?auto_195206 ?auto_195213 ) ) ( not ( = ?auto_195207 ?auto_195213 ) ) ( not ( = ?auto_195208 ?auto_195213 ) ) ( not ( = ?auto_195209 ?auto_195213 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195213 ?auto_195212 ?auto_195211 )
      ( MAKE-6PILE ?auto_195206 ?auto_195207 ?auto_195208 ?auto_195209 ?auto_195210 ?auto_195211 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195214 - BLOCK
      ?auto_195215 - BLOCK
      ?auto_195216 - BLOCK
      ?auto_195217 - BLOCK
      ?auto_195218 - BLOCK
      ?auto_195219 - BLOCK
    )
    :vars
    (
      ?auto_195221 - BLOCK
      ?auto_195220 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195214 ) ( ON ?auto_195215 ?auto_195214 ) ( ON ?auto_195216 ?auto_195215 ) ( not ( = ?auto_195214 ?auto_195215 ) ) ( not ( = ?auto_195214 ?auto_195216 ) ) ( not ( = ?auto_195214 ?auto_195217 ) ) ( not ( = ?auto_195214 ?auto_195218 ) ) ( not ( = ?auto_195214 ?auto_195219 ) ) ( not ( = ?auto_195215 ?auto_195216 ) ) ( not ( = ?auto_195215 ?auto_195217 ) ) ( not ( = ?auto_195215 ?auto_195218 ) ) ( not ( = ?auto_195215 ?auto_195219 ) ) ( not ( = ?auto_195216 ?auto_195217 ) ) ( not ( = ?auto_195216 ?auto_195218 ) ) ( not ( = ?auto_195216 ?auto_195219 ) ) ( not ( = ?auto_195217 ?auto_195218 ) ) ( not ( = ?auto_195217 ?auto_195219 ) ) ( not ( = ?auto_195218 ?auto_195219 ) ) ( ON ?auto_195219 ?auto_195221 ) ( not ( = ?auto_195214 ?auto_195221 ) ) ( not ( = ?auto_195215 ?auto_195221 ) ) ( not ( = ?auto_195216 ?auto_195221 ) ) ( not ( = ?auto_195217 ?auto_195221 ) ) ( not ( = ?auto_195218 ?auto_195221 ) ) ( not ( = ?auto_195219 ?auto_195221 ) ) ( ON ?auto_195218 ?auto_195219 ) ( CLEAR ?auto_195218 ) ( ON-TABLE ?auto_195220 ) ( ON ?auto_195221 ?auto_195220 ) ( not ( = ?auto_195220 ?auto_195221 ) ) ( not ( = ?auto_195220 ?auto_195219 ) ) ( not ( = ?auto_195220 ?auto_195218 ) ) ( not ( = ?auto_195214 ?auto_195220 ) ) ( not ( = ?auto_195215 ?auto_195220 ) ) ( not ( = ?auto_195216 ?auto_195220 ) ) ( not ( = ?auto_195217 ?auto_195220 ) ) ( HOLDING ?auto_195217 ) ( CLEAR ?auto_195216 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195214 ?auto_195215 ?auto_195216 ?auto_195217 )
      ( MAKE-6PILE ?auto_195214 ?auto_195215 ?auto_195216 ?auto_195217 ?auto_195218 ?auto_195219 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195222 - BLOCK
      ?auto_195223 - BLOCK
      ?auto_195224 - BLOCK
      ?auto_195225 - BLOCK
      ?auto_195226 - BLOCK
      ?auto_195227 - BLOCK
    )
    :vars
    (
      ?auto_195229 - BLOCK
      ?auto_195228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195222 ) ( ON ?auto_195223 ?auto_195222 ) ( ON ?auto_195224 ?auto_195223 ) ( not ( = ?auto_195222 ?auto_195223 ) ) ( not ( = ?auto_195222 ?auto_195224 ) ) ( not ( = ?auto_195222 ?auto_195225 ) ) ( not ( = ?auto_195222 ?auto_195226 ) ) ( not ( = ?auto_195222 ?auto_195227 ) ) ( not ( = ?auto_195223 ?auto_195224 ) ) ( not ( = ?auto_195223 ?auto_195225 ) ) ( not ( = ?auto_195223 ?auto_195226 ) ) ( not ( = ?auto_195223 ?auto_195227 ) ) ( not ( = ?auto_195224 ?auto_195225 ) ) ( not ( = ?auto_195224 ?auto_195226 ) ) ( not ( = ?auto_195224 ?auto_195227 ) ) ( not ( = ?auto_195225 ?auto_195226 ) ) ( not ( = ?auto_195225 ?auto_195227 ) ) ( not ( = ?auto_195226 ?auto_195227 ) ) ( ON ?auto_195227 ?auto_195229 ) ( not ( = ?auto_195222 ?auto_195229 ) ) ( not ( = ?auto_195223 ?auto_195229 ) ) ( not ( = ?auto_195224 ?auto_195229 ) ) ( not ( = ?auto_195225 ?auto_195229 ) ) ( not ( = ?auto_195226 ?auto_195229 ) ) ( not ( = ?auto_195227 ?auto_195229 ) ) ( ON ?auto_195226 ?auto_195227 ) ( ON-TABLE ?auto_195228 ) ( ON ?auto_195229 ?auto_195228 ) ( not ( = ?auto_195228 ?auto_195229 ) ) ( not ( = ?auto_195228 ?auto_195227 ) ) ( not ( = ?auto_195228 ?auto_195226 ) ) ( not ( = ?auto_195222 ?auto_195228 ) ) ( not ( = ?auto_195223 ?auto_195228 ) ) ( not ( = ?auto_195224 ?auto_195228 ) ) ( not ( = ?auto_195225 ?auto_195228 ) ) ( CLEAR ?auto_195224 ) ( ON ?auto_195225 ?auto_195226 ) ( CLEAR ?auto_195225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195228 ?auto_195229 ?auto_195227 ?auto_195226 )
      ( MAKE-6PILE ?auto_195222 ?auto_195223 ?auto_195224 ?auto_195225 ?auto_195226 ?auto_195227 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195230 - BLOCK
      ?auto_195231 - BLOCK
      ?auto_195232 - BLOCK
      ?auto_195233 - BLOCK
      ?auto_195234 - BLOCK
      ?auto_195235 - BLOCK
    )
    :vars
    (
      ?auto_195236 - BLOCK
      ?auto_195237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195230 ) ( ON ?auto_195231 ?auto_195230 ) ( not ( = ?auto_195230 ?auto_195231 ) ) ( not ( = ?auto_195230 ?auto_195232 ) ) ( not ( = ?auto_195230 ?auto_195233 ) ) ( not ( = ?auto_195230 ?auto_195234 ) ) ( not ( = ?auto_195230 ?auto_195235 ) ) ( not ( = ?auto_195231 ?auto_195232 ) ) ( not ( = ?auto_195231 ?auto_195233 ) ) ( not ( = ?auto_195231 ?auto_195234 ) ) ( not ( = ?auto_195231 ?auto_195235 ) ) ( not ( = ?auto_195232 ?auto_195233 ) ) ( not ( = ?auto_195232 ?auto_195234 ) ) ( not ( = ?auto_195232 ?auto_195235 ) ) ( not ( = ?auto_195233 ?auto_195234 ) ) ( not ( = ?auto_195233 ?auto_195235 ) ) ( not ( = ?auto_195234 ?auto_195235 ) ) ( ON ?auto_195235 ?auto_195236 ) ( not ( = ?auto_195230 ?auto_195236 ) ) ( not ( = ?auto_195231 ?auto_195236 ) ) ( not ( = ?auto_195232 ?auto_195236 ) ) ( not ( = ?auto_195233 ?auto_195236 ) ) ( not ( = ?auto_195234 ?auto_195236 ) ) ( not ( = ?auto_195235 ?auto_195236 ) ) ( ON ?auto_195234 ?auto_195235 ) ( ON-TABLE ?auto_195237 ) ( ON ?auto_195236 ?auto_195237 ) ( not ( = ?auto_195237 ?auto_195236 ) ) ( not ( = ?auto_195237 ?auto_195235 ) ) ( not ( = ?auto_195237 ?auto_195234 ) ) ( not ( = ?auto_195230 ?auto_195237 ) ) ( not ( = ?auto_195231 ?auto_195237 ) ) ( not ( = ?auto_195232 ?auto_195237 ) ) ( not ( = ?auto_195233 ?auto_195237 ) ) ( ON ?auto_195233 ?auto_195234 ) ( CLEAR ?auto_195233 ) ( HOLDING ?auto_195232 ) ( CLEAR ?auto_195231 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195230 ?auto_195231 ?auto_195232 )
      ( MAKE-6PILE ?auto_195230 ?auto_195231 ?auto_195232 ?auto_195233 ?auto_195234 ?auto_195235 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195238 - BLOCK
      ?auto_195239 - BLOCK
      ?auto_195240 - BLOCK
      ?auto_195241 - BLOCK
      ?auto_195242 - BLOCK
      ?auto_195243 - BLOCK
    )
    :vars
    (
      ?auto_195244 - BLOCK
      ?auto_195245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195238 ) ( ON ?auto_195239 ?auto_195238 ) ( not ( = ?auto_195238 ?auto_195239 ) ) ( not ( = ?auto_195238 ?auto_195240 ) ) ( not ( = ?auto_195238 ?auto_195241 ) ) ( not ( = ?auto_195238 ?auto_195242 ) ) ( not ( = ?auto_195238 ?auto_195243 ) ) ( not ( = ?auto_195239 ?auto_195240 ) ) ( not ( = ?auto_195239 ?auto_195241 ) ) ( not ( = ?auto_195239 ?auto_195242 ) ) ( not ( = ?auto_195239 ?auto_195243 ) ) ( not ( = ?auto_195240 ?auto_195241 ) ) ( not ( = ?auto_195240 ?auto_195242 ) ) ( not ( = ?auto_195240 ?auto_195243 ) ) ( not ( = ?auto_195241 ?auto_195242 ) ) ( not ( = ?auto_195241 ?auto_195243 ) ) ( not ( = ?auto_195242 ?auto_195243 ) ) ( ON ?auto_195243 ?auto_195244 ) ( not ( = ?auto_195238 ?auto_195244 ) ) ( not ( = ?auto_195239 ?auto_195244 ) ) ( not ( = ?auto_195240 ?auto_195244 ) ) ( not ( = ?auto_195241 ?auto_195244 ) ) ( not ( = ?auto_195242 ?auto_195244 ) ) ( not ( = ?auto_195243 ?auto_195244 ) ) ( ON ?auto_195242 ?auto_195243 ) ( ON-TABLE ?auto_195245 ) ( ON ?auto_195244 ?auto_195245 ) ( not ( = ?auto_195245 ?auto_195244 ) ) ( not ( = ?auto_195245 ?auto_195243 ) ) ( not ( = ?auto_195245 ?auto_195242 ) ) ( not ( = ?auto_195238 ?auto_195245 ) ) ( not ( = ?auto_195239 ?auto_195245 ) ) ( not ( = ?auto_195240 ?auto_195245 ) ) ( not ( = ?auto_195241 ?auto_195245 ) ) ( ON ?auto_195241 ?auto_195242 ) ( CLEAR ?auto_195239 ) ( ON ?auto_195240 ?auto_195241 ) ( CLEAR ?auto_195240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195245 ?auto_195244 ?auto_195243 ?auto_195242 ?auto_195241 )
      ( MAKE-6PILE ?auto_195238 ?auto_195239 ?auto_195240 ?auto_195241 ?auto_195242 ?auto_195243 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195246 - BLOCK
      ?auto_195247 - BLOCK
      ?auto_195248 - BLOCK
      ?auto_195249 - BLOCK
      ?auto_195250 - BLOCK
      ?auto_195251 - BLOCK
    )
    :vars
    (
      ?auto_195252 - BLOCK
      ?auto_195253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195246 ) ( not ( = ?auto_195246 ?auto_195247 ) ) ( not ( = ?auto_195246 ?auto_195248 ) ) ( not ( = ?auto_195246 ?auto_195249 ) ) ( not ( = ?auto_195246 ?auto_195250 ) ) ( not ( = ?auto_195246 ?auto_195251 ) ) ( not ( = ?auto_195247 ?auto_195248 ) ) ( not ( = ?auto_195247 ?auto_195249 ) ) ( not ( = ?auto_195247 ?auto_195250 ) ) ( not ( = ?auto_195247 ?auto_195251 ) ) ( not ( = ?auto_195248 ?auto_195249 ) ) ( not ( = ?auto_195248 ?auto_195250 ) ) ( not ( = ?auto_195248 ?auto_195251 ) ) ( not ( = ?auto_195249 ?auto_195250 ) ) ( not ( = ?auto_195249 ?auto_195251 ) ) ( not ( = ?auto_195250 ?auto_195251 ) ) ( ON ?auto_195251 ?auto_195252 ) ( not ( = ?auto_195246 ?auto_195252 ) ) ( not ( = ?auto_195247 ?auto_195252 ) ) ( not ( = ?auto_195248 ?auto_195252 ) ) ( not ( = ?auto_195249 ?auto_195252 ) ) ( not ( = ?auto_195250 ?auto_195252 ) ) ( not ( = ?auto_195251 ?auto_195252 ) ) ( ON ?auto_195250 ?auto_195251 ) ( ON-TABLE ?auto_195253 ) ( ON ?auto_195252 ?auto_195253 ) ( not ( = ?auto_195253 ?auto_195252 ) ) ( not ( = ?auto_195253 ?auto_195251 ) ) ( not ( = ?auto_195253 ?auto_195250 ) ) ( not ( = ?auto_195246 ?auto_195253 ) ) ( not ( = ?auto_195247 ?auto_195253 ) ) ( not ( = ?auto_195248 ?auto_195253 ) ) ( not ( = ?auto_195249 ?auto_195253 ) ) ( ON ?auto_195249 ?auto_195250 ) ( ON ?auto_195248 ?auto_195249 ) ( CLEAR ?auto_195248 ) ( HOLDING ?auto_195247 ) ( CLEAR ?auto_195246 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195246 ?auto_195247 )
      ( MAKE-6PILE ?auto_195246 ?auto_195247 ?auto_195248 ?auto_195249 ?auto_195250 ?auto_195251 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195254 - BLOCK
      ?auto_195255 - BLOCK
      ?auto_195256 - BLOCK
      ?auto_195257 - BLOCK
      ?auto_195258 - BLOCK
      ?auto_195259 - BLOCK
    )
    :vars
    (
      ?auto_195260 - BLOCK
      ?auto_195261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195254 ) ( not ( = ?auto_195254 ?auto_195255 ) ) ( not ( = ?auto_195254 ?auto_195256 ) ) ( not ( = ?auto_195254 ?auto_195257 ) ) ( not ( = ?auto_195254 ?auto_195258 ) ) ( not ( = ?auto_195254 ?auto_195259 ) ) ( not ( = ?auto_195255 ?auto_195256 ) ) ( not ( = ?auto_195255 ?auto_195257 ) ) ( not ( = ?auto_195255 ?auto_195258 ) ) ( not ( = ?auto_195255 ?auto_195259 ) ) ( not ( = ?auto_195256 ?auto_195257 ) ) ( not ( = ?auto_195256 ?auto_195258 ) ) ( not ( = ?auto_195256 ?auto_195259 ) ) ( not ( = ?auto_195257 ?auto_195258 ) ) ( not ( = ?auto_195257 ?auto_195259 ) ) ( not ( = ?auto_195258 ?auto_195259 ) ) ( ON ?auto_195259 ?auto_195260 ) ( not ( = ?auto_195254 ?auto_195260 ) ) ( not ( = ?auto_195255 ?auto_195260 ) ) ( not ( = ?auto_195256 ?auto_195260 ) ) ( not ( = ?auto_195257 ?auto_195260 ) ) ( not ( = ?auto_195258 ?auto_195260 ) ) ( not ( = ?auto_195259 ?auto_195260 ) ) ( ON ?auto_195258 ?auto_195259 ) ( ON-TABLE ?auto_195261 ) ( ON ?auto_195260 ?auto_195261 ) ( not ( = ?auto_195261 ?auto_195260 ) ) ( not ( = ?auto_195261 ?auto_195259 ) ) ( not ( = ?auto_195261 ?auto_195258 ) ) ( not ( = ?auto_195254 ?auto_195261 ) ) ( not ( = ?auto_195255 ?auto_195261 ) ) ( not ( = ?auto_195256 ?auto_195261 ) ) ( not ( = ?auto_195257 ?auto_195261 ) ) ( ON ?auto_195257 ?auto_195258 ) ( ON ?auto_195256 ?auto_195257 ) ( CLEAR ?auto_195254 ) ( ON ?auto_195255 ?auto_195256 ) ( CLEAR ?auto_195255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195261 ?auto_195260 ?auto_195259 ?auto_195258 ?auto_195257 ?auto_195256 )
      ( MAKE-6PILE ?auto_195254 ?auto_195255 ?auto_195256 ?auto_195257 ?auto_195258 ?auto_195259 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195262 - BLOCK
      ?auto_195263 - BLOCK
      ?auto_195264 - BLOCK
      ?auto_195265 - BLOCK
      ?auto_195266 - BLOCK
      ?auto_195267 - BLOCK
    )
    :vars
    (
      ?auto_195268 - BLOCK
      ?auto_195269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195262 ?auto_195263 ) ) ( not ( = ?auto_195262 ?auto_195264 ) ) ( not ( = ?auto_195262 ?auto_195265 ) ) ( not ( = ?auto_195262 ?auto_195266 ) ) ( not ( = ?auto_195262 ?auto_195267 ) ) ( not ( = ?auto_195263 ?auto_195264 ) ) ( not ( = ?auto_195263 ?auto_195265 ) ) ( not ( = ?auto_195263 ?auto_195266 ) ) ( not ( = ?auto_195263 ?auto_195267 ) ) ( not ( = ?auto_195264 ?auto_195265 ) ) ( not ( = ?auto_195264 ?auto_195266 ) ) ( not ( = ?auto_195264 ?auto_195267 ) ) ( not ( = ?auto_195265 ?auto_195266 ) ) ( not ( = ?auto_195265 ?auto_195267 ) ) ( not ( = ?auto_195266 ?auto_195267 ) ) ( ON ?auto_195267 ?auto_195268 ) ( not ( = ?auto_195262 ?auto_195268 ) ) ( not ( = ?auto_195263 ?auto_195268 ) ) ( not ( = ?auto_195264 ?auto_195268 ) ) ( not ( = ?auto_195265 ?auto_195268 ) ) ( not ( = ?auto_195266 ?auto_195268 ) ) ( not ( = ?auto_195267 ?auto_195268 ) ) ( ON ?auto_195266 ?auto_195267 ) ( ON-TABLE ?auto_195269 ) ( ON ?auto_195268 ?auto_195269 ) ( not ( = ?auto_195269 ?auto_195268 ) ) ( not ( = ?auto_195269 ?auto_195267 ) ) ( not ( = ?auto_195269 ?auto_195266 ) ) ( not ( = ?auto_195262 ?auto_195269 ) ) ( not ( = ?auto_195263 ?auto_195269 ) ) ( not ( = ?auto_195264 ?auto_195269 ) ) ( not ( = ?auto_195265 ?auto_195269 ) ) ( ON ?auto_195265 ?auto_195266 ) ( ON ?auto_195264 ?auto_195265 ) ( ON ?auto_195263 ?auto_195264 ) ( CLEAR ?auto_195263 ) ( HOLDING ?auto_195262 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_195262 )
      ( MAKE-6PILE ?auto_195262 ?auto_195263 ?auto_195264 ?auto_195265 ?auto_195266 ?auto_195267 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195270 - BLOCK
      ?auto_195271 - BLOCK
      ?auto_195272 - BLOCK
      ?auto_195273 - BLOCK
      ?auto_195274 - BLOCK
      ?auto_195275 - BLOCK
    )
    :vars
    (
      ?auto_195276 - BLOCK
      ?auto_195277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195270 ?auto_195271 ) ) ( not ( = ?auto_195270 ?auto_195272 ) ) ( not ( = ?auto_195270 ?auto_195273 ) ) ( not ( = ?auto_195270 ?auto_195274 ) ) ( not ( = ?auto_195270 ?auto_195275 ) ) ( not ( = ?auto_195271 ?auto_195272 ) ) ( not ( = ?auto_195271 ?auto_195273 ) ) ( not ( = ?auto_195271 ?auto_195274 ) ) ( not ( = ?auto_195271 ?auto_195275 ) ) ( not ( = ?auto_195272 ?auto_195273 ) ) ( not ( = ?auto_195272 ?auto_195274 ) ) ( not ( = ?auto_195272 ?auto_195275 ) ) ( not ( = ?auto_195273 ?auto_195274 ) ) ( not ( = ?auto_195273 ?auto_195275 ) ) ( not ( = ?auto_195274 ?auto_195275 ) ) ( ON ?auto_195275 ?auto_195276 ) ( not ( = ?auto_195270 ?auto_195276 ) ) ( not ( = ?auto_195271 ?auto_195276 ) ) ( not ( = ?auto_195272 ?auto_195276 ) ) ( not ( = ?auto_195273 ?auto_195276 ) ) ( not ( = ?auto_195274 ?auto_195276 ) ) ( not ( = ?auto_195275 ?auto_195276 ) ) ( ON ?auto_195274 ?auto_195275 ) ( ON-TABLE ?auto_195277 ) ( ON ?auto_195276 ?auto_195277 ) ( not ( = ?auto_195277 ?auto_195276 ) ) ( not ( = ?auto_195277 ?auto_195275 ) ) ( not ( = ?auto_195277 ?auto_195274 ) ) ( not ( = ?auto_195270 ?auto_195277 ) ) ( not ( = ?auto_195271 ?auto_195277 ) ) ( not ( = ?auto_195272 ?auto_195277 ) ) ( not ( = ?auto_195273 ?auto_195277 ) ) ( ON ?auto_195273 ?auto_195274 ) ( ON ?auto_195272 ?auto_195273 ) ( ON ?auto_195271 ?auto_195272 ) ( ON ?auto_195270 ?auto_195271 ) ( CLEAR ?auto_195270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195277 ?auto_195276 ?auto_195275 ?auto_195274 ?auto_195273 ?auto_195272 ?auto_195271 )
      ( MAKE-6PILE ?auto_195270 ?auto_195271 ?auto_195272 ?auto_195273 ?auto_195274 ?auto_195275 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195278 - BLOCK
      ?auto_195279 - BLOCK
      ?auto_195280 - BLOCK
      ?auto_195281 - BLOCK
      ?auto_195282 - BLOCK
      ?auto_195283 - BLOCK
    )
    :vars
    (
      ?auto_195284 - BLOCK
      ?auto_195285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195278 ?auto_195279 ) ) ( not ( = ?auto_195278 ?auto_195280 ) ) ( not ( = ?auto_195278 ?auto_195281 ) ) ( not ( = ?auto_195278 ?auto_195282 ) ) ( not ( = ?auto_195278 ?auto_195283 ) ) ( not ( = ?auto_195279 ?auto_195280 ) ) ( not ( = ?auto_195279 ?auto_195281 ) ) ( not ( = ?auto_195279 ?auto_195282 ) ) ( not ( = ?auto_195279 ?auto_195283 ) ) ( not ( = ?auto_195280 ?auto_195281 ) ) ( not ( = ?auto_195280 ?auto_195282 ) ) ( not ( = ?auto_195280 ?auto_195283 ) ) ( not ( = ?auto_195281 ?auto_195282 ) ) ( not ( = ?auto_195281 ?auto_195283 ) ) ( not ( = ?auto_195282 ?auto_195283 ) ) ( ON ?auto_195283 ?auto_195284 ) ( not ( = ?auto_195278 ?auto_195284 ) ) ( not ( = ?auto_195279 ?auto_195284 ) ) ( not ( = ?auto_195280 ?auto_195284 ) ) ( not ( = ?auto_195281 ?auto_195284 ) ) ( not ( = ?auto_195282 ?auto_195284 ) ) ( not ( = ?auto_195283 ?auto_195284 ) ) ( ON ?auto_195282 ?auto_195283 ) ( ON-TABLE ?auto_195285 ) ( ON ?auto_195284 ?auto_195285 ) ( not ( = ?auto_195285 ?auto_195284 ) ) ( not ( = ?auto_195285 ?auto_195283 ) ) ( not ( = ?auto_195285 ?auto_195282 ) ) ( not ( = ?auto_195278 ?auto_195285 ) ) ( not ( = ?auto_195279 ?auto_195285 ) ) ( not ( = ?auto_195280 ?auto_195285 ) ) ( not ( = ?auto_195281 ?auto_195285 ) ) ( ON ?auto_195281 ?auto_195282 ) ( ON ?auto_195280 ?auto_195281 ) ( ON ?auto_195279 ?auto_195280 ) ( HOLDING ?auto_195278 ) ( CLEAR ?auto_195279 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_195285 ?auto_195284 ?auto_195283 ?auto_195282 ?auto_195281 ?auto_195280 ?auto_195279 ?auto_195278 )
      ( MAKE-6PILE ?auto_195278 ?auto_195279 ?auto_195280 ?auto_195281 ?auto_195282 ?auto_195283 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195286 - BLOCK
      ?auto_195287 - BLOCK
      ?auto_195288 - BLOCK
      ?auto_195289 - BLOCK
      ?auto_195290 - BLOCK
      ?auto_195291 - BLOCK
    )
    :vars
    (
      ?auto_195292 - BLOCK
      ?auto_195293 - BLOCK
      ?auto_195294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195286 ?auto_195287 ) ) ( not ( = ?auto_195286 ?auto_195288 ) ) ( not ( = ?auto_195286 ?auto_195289 ) ) ( not ( = ?auto_195286 ?auto_195290 ) ) ( not ( = ?auto_195286 ?auto_195291 ) ) ( not ( = ?auto_195287 ?auto_195288 ) ) ( not ( = ?auto_195287 ?auto_195289 ) ) ( not ( = ?auto_195287 ?auto_195290 ) ) ( not ( = ?auto_195287 ?auto_195291 ) ) ( not ( = ?auto_195288 ?auto_195289 ) ) ( not ( = ?auto_195288 ?auto_195290 ) ) ( not ( = ?auto_195288 ?auto_195291 ) ) ( not ( = ?auto_195289 ?auto_195290 ) ) ( not ( = ?auto_195289 ?auto_195291 ) ) ( not ( = ?auto_195290 ?auto_195291 ) ) ( ON ?auto_195291 ?auto_195292 ) ( not ( = ?auto_195286 ?auto_195292 ) ) ( not ( = ?auto_195287 ?auto_195292 ) ) ( not ( = ?auto_195288 ?auto_195292 ) ) ( not ( = ?auto_195289 ?auto_195292 ) ) ( not ( = ?auto_195290 ?auto_195292 ) ) ( not ( = ?auto_195291 ?auto_195292 ) ) ( ON ?auto_195290 ?auto_195291 ) ( ON-TABLE ?auto_195293 ) ( ON ?auto_195292 ?auto_195293 ) ( not ( = ?auto_195293 ?auto_195292 ) ) ( not ( = ?auto_195293 ?auto_195291 ) ) ( not ( = ?auto_195293 ?auto_195290 ) ) ( not ( = ?auto_195286 ?auto_195293 ) ) ( not ( = ?auto_195287 ?auto_195293 ) ) ( not ( = ?auto_195288 ?auto_195293 ) ) ( not ( = ?auto_195289 ?auto_195293 ) ) ( ON ?auto_195289 ?auto_195290 ) ( ON ?auto_195288 ?auto_195289 ) ( ON ?auto_195287 ?auto_195288 ) ( CLEAR ?auto_195287 ) ( ON ?auto_195286 ?auto_195294 ) ( CLEAR ?auto_195286 ) ( HAND-EMPTY ) ( not ( = ?auto_195286 ?auto_195294 ) ) ( not ( = ?auto_195287 ?auto_195294 ) ) ( not ( = ?auto_195288 ?auto_195294 ) ) ( not ( = ?auto_195289 ?auto_195294 ) ) ( not ( = ?auto_195290 ?auto_195294 ) ) ( not ( = ?auto_195291 ?auto_195294 ) ) ( not ( = ?auto_195292 ?auto_195294 ) ) ( not ( = ?auto_195293 ?auto_195294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195286 ?auto_195294 )
      ( MAKE-6PILE ?auto_195286 ?auto_195287 ?auto_195288 ?auto_195289 ?auto_195290 ?auto_195291 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195295 - BLOCK
      ?auto_195296 - BLOCK
      ?auto_195297 - BLOCK
      ?auto_195298 - BLOCK
      ?auto_195299 - BLOCK
      ?auto_195300 - BLOCK
    )
    :vars
    (
      ?auto_195302 - BLOCK
      ?auto_195303 - BLOCK
      ?auto_195301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195295 ?auto_195296 ) ) ( not ( = ?auto_195295 ?auto_195297 ) ) ( not ( = ?auto_195295 ?auto_195298 ) ) ( not ( = ?auto_195295 ?auto_195299 ) ) ( not ( = ?auto_195295 ?auto_195300 ) ) ( not ( = ?auto_195296 ?auto_195297 ) ) ( not ( = ?auto_195296 ?auto_195298 ) ) ( not ( = ?auto_195296 ?auto_195299 ) ) ( not ( = ?auto_195296 ?auto_195300 ) ) ( not ( = ?auto_195297 ?auto_195298 ) ) ( not ( = ?auto_195297 ?auto_195299 ) ) ( not ( = ?auto_195297 ?auto_195300 ) ) ( not ( = ?auto_195298 ?auto_195299 ) ) ( not ( = ?auto_195298 ?auto_195300 ) ) ( not ( = ?auto_195299 ?auto_195300 ) ) ( ON ?auto_195300 ?auto_195302 ) ( not ( = ?auto_195295 ?auto_195302 ) ) ( not ( = ?auto_195296 ?auto_195302 ) ) ( not ( = ?auto_195297 ?auto_195302 ) ) ( not ( = ?auto_195298 ?auto_195302 ) ) ( not ( = ?auto_195299 ?auto_195302 ) ) ( not ( = ?auto_195300 ?auto_195302 ) ) ( ON ?auto_195299 ?auto_195300 ) ( ON-TABLE ?auto_195303 ) ( ON ?auto_195302 ?auto_195303 ) ( not ( = ?auto_195303 ?auto_195302 ) ) ( not ( = ?auto_195303 ?auto_195300 ) ) ( not ( = ?auto_195303 ?auto_195299 ) ) ( not ( = ?auto_195295 ?auto_195303 ) ) ( not ( = ?auto_195296 ?auto_195303 ) ) ( not ( = ?auto_195297 ?auto_195303 ) ) ( not ( = ?auto_195298 ?auto_195303 ) ) ( ON ?auto_195298 ?auto_195299 ) ( ON ?auto_195297 ?auto_195298 ) ( ON ?auto_195295 ?auto_195301 ) ( CLEAR ?auto_195295 ) ( not ( = ?auto_195295 ?auto_195301 ) ) ( not ( = ?auto_195296 ?auto_195301 ) ) ( not ( = ?auto_195297 ?auto_195301 ) ) ( not ( = ?auto_195298 ?auto_195301 ) ) ( not ( = ?auto_195299 ?auto_195301 ) ) ( not ( = ?auto_195300 ?auto_195301 ) ) ( not ( = ?auto_195302 ?auto_195301 ) ) ( not ( = ?auto_195303 ?auto_195301 ) ) ( HOLDING ?auto_195296 ) ( CLEAR ?auto_195297 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195303 ?auto_195302 ?auto_195300 ?auto_195299 ?auto_195298 ?auto_195297 ?auto_195296 )
      ( MAKE-6PILE ?auto_195295 ?auto_195296 ?auto_195297 ?auto_195298 ?auto_195299 ?auto_195300 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195304 - BLOCK
      ?auto_195305 - BLOCK
      ?auto_195306 - BLOCK
      ?auto_195307 - BLOCK
      ?auto_195308 - BLOCK
      ?auto_195309 - BLOCK
    )
    :vars
    (
      ?auto_195310 - BLOCK
      ?auto_195311 - BLOCK
      ?auto_195312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195304 ?auto_195305 ) ) ( not ( = ?auto_195304 ?auto_195306 ) ) ( not ( = ?auto_195304 ?auto_195307 ) ) ( not ( = ?auto_195304 ?auto_195308 ) ) ( not ( = ?auto_195304 ?auto_195309 ) ) ( not ( = ?auto_195305 ?auto_195306 ) ) ( not ( = ?auto_195305 ?auto_195307 ) ) ( not ( = ?auto_195305 ?auto_195308 ) ) ( not ( = ?auto_195305 ?auto_195309 ) ) ( not ( = ?auto_195306 ?auto_195307 ) ) ( not ( = ?auto_195306 ?auto_195308 ) ) ( not ( = ?auto_195306 ?auto_195309 ) ) ( not ( = ?auto_195307 ?auto_195308 ) ) ( not ( = ?auto_195307 ?auto_195309 ) ) ( not ( = ?auto_195308 ?auto_195309 ) ) ( ON ?auto_195309 ?auto_195310 ) ( not ( = ?auto_195304 ?auto_195310 ) ) ( not ( = ?auto_195305 ?auto_195310 ) ) ( not ( = ?auto_195306 ?auto_195310 ) ) ( not ( = ?auto_195307 ?auto_195310 ) ) ( not ( = ?auto_195308 ?auto_195310 ) ) ( not ( = ?auto_195309 ?auto_195310 ) ) ( ON ?auto_195308 ?auto_195309 ) ( ON-TABLE ?auto_195311 ) ( ON ?auto_195310 ?auto_195311 ) ( not ( = ?auto_195311 ?auto_195310 ) ) ( not ( = ?auto_195311 ?auto_195309 ) ) ( not ( = ?auto_195311 ?auto_195308 ) ) ( not ( = ?auto_195304 ?auto_195311 ) ) ( not ( = ?auto_195305 ?auto_195311 ) ) ( not ( = ?auto_195306 ?auto_195311 ) ) ( not ( = ?auto_195307 ?auto_195311 ) ) ( ON ?auto_195307 ?auto_195308 ) ( ON ?auto_195306 ?auto_195307 ) ( ON ?auto_195304 ?auto_195312 ) ( not ( = ?auto_195304 ?auto_195312 ) ) ( not ( = ?auto_195305 ?auto_195312 ) ) ( not ( = ?auto_195306 ?auto_195312 ) ) ( not ( = ?auto_195307 ?auto_195312 ) ) ( not ( = ?auto_195308 ?auto_195312 ) ) ( not ( = ?auto_195309 ?auto_195312 ) ) ( not ( = ?auto_195310 ?auto_195312 ) ) ( not ( = ?auto_195311 ?auto_195312 ) ) ( CLEAR ?auto_195306 ) ( ON ?auto_195305 ?auto_195304 ) ( CLEAR ?auto_195305 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_195312 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195312 ?auto_195304 )
      ( MAKE-6PILE ?auto_195304 ?auto_195305 ?auto_195306 ?auto_195307 ?auto_195308 ?auto_195309 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195313 - BLOCK
      ?auto_195314 - BLOCK
      ?auto_195315 - BLOCK
      ?auto_195316 - BLOCK
      ?auto_195317 - BLOCK
      ?auto_195318 - BLOCK
    )
    :vars
    (
      ?auto_195320 - BLOCK
      ?auto_195319 - BLOCK
      ?auto_195321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195313 ?auto_195314 ) ) ( not ( = ?auto_195313 ?auto_195315 ) ) ( not ( = ?auto_195313 ?auto_195316 ) ) ( not ( = ?auto_195313 ?auto_195317 ) ) ( not ( = ?auto_195313 ?auto_195318 ) ) ( not ( = ?auto_195314 ?auto_195315 ) ) ( not ( = ?auto_195314 ?auto_195316 ) ) ( not ( = ?auto_195314 ?auto_195317 ) ) ( not ( = ?auto_195314 ?auto_195318 ) ) ( not ( = ?auto_195315 ?auto_195316 ) ) ( not ( = ?auto_195315 ?auto_195317 ) ) ( not ( = ?auto_195315 ?auto_195318 ) ) ( not ( = ?auto_195316 ?auto_195317 ) ) ( not ( = ?auto_195316 ?auto_195318 ) ) ( not ( = ?auto_195317 ?auto_195318 ) ) ( ON ?auto_195318 ?auto_195320 ) ( not ( = ?auto_195313 ?auto_195320 ) ) ( not ( = ?auto_195314 ?auto_195320 ) ) ( not ( = ?auto_195315 ?auto_195320 ) ) ( not ( = ?auto_195316 ?auto_195320 ) ) ( not ( = ?auto_195317 ?auto_195320 ) ) ( not ( = ?auto_195318 ?auto_195320 ) ) ( ON ?auto_195317 ?auto_195318 ) ( ON-TABLE ?auto_195319 ) ( ON ?auto_195320 ?auto_195319 ) ( not ( = ?auto_195319 ?auto_195320 ) ) ( not ( = ?auto_195319 ?auto_195318 ) ) ( not ( = ?auto_195319 ?auto_195317 ) ) ( not ( = ?auto_195313 ?auto_195319 ) ) ( not ( = ?auto_195314 ?auto_195319 ) ) ( not ( = ?auto_195315 ?auto_195319 ) ) ( not ( = ?auto_195316 ?auto_195319 ) ) ( ON ?auto_195316 ?auto_195317 ) ( ON ?auto_195313 ?auto_195321 ) ( not ( = ?auto_195313 ?auto_195321 ) ) ( not ( = ?auto_195314 ?auto_195321 ) ) ( not ( = ?auto_195315 ?auto_195321 ) ) ( not ( = ?auto_195316 ?auto_195321 ) ) ( not ( = ?auto_195317 ?auto_195321 ) ) ( not ( = ?auto_195318 ?auto_195321 ) ) ( not ( = ?auto_195320 ?auto_195321 ) ) ( not ( = ?auto_195319 ?auto_195321 ) ) ( ON ?auto_195314 ?auto_195313 ) ( CLEAR ?auto_195314 ) ( ON-TABLE ?auto_195321 ) ( HOLDING ?auto_195315 ) ( CLEAR ?auto_195316 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195319 ?auto_195320 ?auto_195318 ?auto_195317 ?auto_195316 ?auto_195315 )
      ( MAKE-6PILE ?auto_195313 ?auto_195314 ?auto_195315 ?auto_195316 ?auto_195317 ?auto_195318 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195322 - BLOCK
      ?auto_195323 - BLOCK
      ?auto_195324 - BLOCK
      ?auto_195325 - BLOCK
      ?auto_195326 - BLOCK
      ?auto_195327 - BLOCK
    )
    :vars
    (
      ?auto_195328 - BLOCK
      ?auto_195329 - BLOCK
      ?auto_195330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195322 ?auto_195323 ) ) ( not ( = ?auto_195322 ?auto_195324 ) ) ( not ( = ?auto_195322 ?auto_195325 ) ) ( not ( = ?auto_195322 ?auto_195326 ) ) ( not ( = ?auto_195322 ?auto_195327 ) ) ( not ( = ?auto_195323 ?auto_195324 ) ) ( not ( = ?auto_195323 ?auto_195325 ) ) ( not ( = ?auto_195323 ?auto_195326 ) ) ( not ( = ?auto_195323 ?auto_195327 ) ) ( not ( = ?auto_195324 ?auto_195325 ) ) ( not ( = ?auto_195324 ?auto_195326 ) ) ( not ( = ?auto_195324 ?auto_195327 ) ) ( not ( = ?auto_195325 ?auto_195326 ) ) ( not ( = ?auto_195325 ?auto_195327 ) ) ( not ( = ?auto_195326 ?auto_195327 ) ) ( ON ?auto_195327 ?auto_195328 ) ( not ( = ?auto_195322 ?auto_195328 ) ) ( not ( = ?auto_195323 ?auto_195328 ) ) ( not ( = ?auto_195324 ?auto_195328 ) ) ( not ( = ?auto_195325 ?auto_195328 ) ) ( not ( = ?auto_195326 ?auto_195328 ) ) ( not ( = ?auto_195327 ?auto_195328 ) ) ( ON ?auto_195326 ?auto_195327 ) ( ON-TABLE ?auto_195329 ) ( ON ?auto_195328 ?auto_195329 ) ( not ( = ?auto_195329 ?auto_195328 ) ) ( not ( = ?auto_195329 ?auto_195327 ) ) ( not ( = ?auto_195329 ?auto_195326 ) ) ( not ( = ?auto_195322 ?auto_195329 ) ) ( not ( = ?auto_195323 ?auto_195329 ) ) ( not ( = ?auto_195324 ?auto_195329 ) ) ( not ( = ?auto_195325 ?auto_195329 ) ) ( ON ?auto_195325 ?auto_195326 ) ( ON ?auto_195322 ?auto_195330 ) ( not ( = ?auto_195322 ?auto_195330 ) ) ( not ( = ?auto_195323 ?auto_195330 ) ) ( not ( = ?auto_195324 ?auto_195330 ) ) ( not ( = ?auto_195325 ?auto_195330 ) ) ( not ( = ?auto_195326 ?auto_195330 ) ) ( not ( = ?auto_195327 ?auto_195330 ) ) ( not ( = ?auto_195328 ?auto_195330 ) ) ( not ( = ?auto_195329 ?auto_195330 ) ) ( ON ?auto_195323 ?auto_195322 ) ( ON-TABLE ?auto_195330 ) ( CLEAR ?auto_195325 ) ( ON ?auto_195324 ?auto_195323 ) ( CLEAR ?auto_195324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195330 ?auto_195322 ?auto_195323 )
      ( MAKE-6PILE ?auto_195322 ?auto_195323 ?auto_195324 ?auto_195325 ?auto_195326 ?auto_195327 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195331 - BLOCK
      ?auto_195332 - BLOCK
      ?auto_195333 - BLOCK
      ?auto_195334 - BLOCK
      ?auto_195335 - BLOCK
      ?auto_195336 - BLOCK
    )
    :vars
    (
      ?auto_195337 - BLOCK
      ?auto_195338 - BLOCK
      ?auto_195339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195331 ?auto_195332 ) ) ( not ( = ?auto_195331 ?auto_195333 ) ) ( not ( = ?auto_195331 ?auto_195334 ) ) ( not ( = ?auto_195331 ?auto_195335 ) ) ( not ( = ?auto_195331 ?auto_195336 ) ) ( not ( = ?auto_195332 ?auto_195333 ) ) ( not ( = ?auto_195332 ?auto_195334 ) ) ( not ( = ?auto_195332 ?auto_195335 ) ) ( not ( = ?auto_195332 ?auto_195336 ) ) ( not ( = ?auto_195333 ?auto_195334 ) ) ( not ( = ?auto_195333 ?auto_195335 ) ) ( not ( = ?auto_195333 ?auto_195336 ) ) ( not ( = ?auto_195334 ?auto_195335 ) ) ( not ( = ?auto_195334 ?auto_195336 ) ) ( not ( = ?auto_195335 ?auto_195336 ) ) ( ON ?auto_195336 ?auto_195337 ) ( not ( = ?auto_195331 ?auto_195337 ) ) ( not ( = ?auto_195332 ?auto_195337 ) ) ( not ( = ?auto_195333 ?auto_195337 ) ) ( not ( = ?auto_195334 ?auto_195337 ) ) ( not ( = ?auto_195335 ?auto_195337 ) ) ( not ( = ?auto_195336 ?auto_195337 ) ) ( ON ?auto_195335 ?auto_195336 ) ( ON-TABLE ?auto_195338 ) ( ON ?auto_195337 ?auto_195338 ) ( not ( = ?auto_195338 ?auto_195337 ) ) ( not ( = ?auto_195338 ?auto_195336 ) ) ( not ( = ?auto_195338 ?auto_195335 ) ) ( not ( = ?auto_195331 ?auto_195338 ) ) ( not ( = ?auto_195332 ?auto_195338 ) ) ( not ( = ?auto_195333 ?auto_195338 ) ) ( not ( = ?auto_195334 ?auto_195338 ) ) ( ON ?auto_195331 ?auto_195339 ) ( not ( = ?auto_195331 ?auto_195339 ) ) ( not ( = ?auto_195332 ?auto_195339 ) ) ( not ( = ?auto_195333 ?auto_195339 ) ) ( not ( = ?auto_195334 ?auto_195339 ) ) ( not ( = ?auto_195335 ?auto_195339 ) ) ( not ( = ?auto_195336 ?auto_195339 ) ) ( not ( = ?auto_195337 ?auto_195339 ) ) ( not ( = ?auto_195338 ?auto_195339 ) ) ( ON ?auto_195332 ?auto_195331 ) ( ON-TABLE ?auto_195339 ) ( ON ?auto_195333 ?auto_195332 ) ( CLEAR ?auto_195333 ) ( HOLDING ?auto_195334 ) ( CLEAR ?auto_195335 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195338 ?auto_195337 ?auto_195336 ?auto_195335 ?auto_195334 )
      ( MAKE-6PILE ?auto_195331 ?auto_195332 ?auto_195333 ?auto_195334 ?auto_195335 ?auto_195336 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195340 - BLOCK
      ?auto_195341 - BLOCK
      ?auto_195342 - BLOCK
      ?auto_195343 - BLOCK
      ?auto_195344 - BLOCK
      ?auto_195345 - BLOCK
    )
    :vars
    (
      ?auto_195348 - BLOCK
      ?auto_195347 - BLOCK
      ?auto_195346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195340 ?auto_195341 ) ) ( not ( = ?auto_195340 ?auto_195342 ) ) ( not ( = ?auto_195340 ?auto_195343 ) ) ( not ( = ?auto_195340 ?auto_195344 ) ) ( not ( = ?auto_195340 ?auto_195345 ) ) ( not ( = ?auto_195341 ?auto_195342 ) ) ( not ( = ?auto_195341 ?auto_195343 ) ) ( not ( = ?auto_195341 ?auto_195344 ) ) ( not ( = ?auto_195341 ?auto_195345 ) ) ( not ( = ?auto_195342 ?auto_195343 ) ) ( not ( = ?auto_195342 ?auto_195344 ) ) ( not ( = ?auto_195342 ?auto_195345 ) ) ( not ( = ?auto_195343 ?auto_195344 ) ) ( not ( = ?auto_195343 ?auto_195345 ) ) ( not ( = ?auto_195344 ?auto_195345 ) ) ( ON ?auto_195345 ?auto_195348 ) ( not ( = ?auto_195340 ?auto_195348 ) ) ( not ( = ?auto_195341 ?auto_195348 ) ) ( not ( = ?auto_195342 ?auto_195348 ) ) ( not ( = ?auto_195343 ?auto_195348 ) ) ( not ( = ?auto_195344 ?auto_195348 ) ) ( not ( = ?auto_195345 ?auto_195348 ) ) ( ON ?auto_195344 ?auto_195345 ) ( ON-TABLE ?auto_195347 ) ( ON ?auto_195348 ?auto_195347 ) ( not ( = ?auto_195347 ?auto_195348 ) ) ( not ( = ?auto_195347 ?auto_195345 ) ) ( not ( = ?auto_195347 ?auto_195344 ) ) ( not ( = ?auto_195340 ?auto_195347 ) ) ( not ( = ?auto_195341 ?auto_195347 ) ) ( not ( = ?auto_195342 ?auto_195347 ) ) ( not ( = ?auto_195343 ?auto_195347 ) ) ( ON ?auto_195340 ?auto_195346 ) ( not ( = ?auto_195340 ?auto_195346 ) ) ( not ( = ?auto_195341 ?auto_195346 ) ) ( not ( = ?auto_195342 ?auto_195346 ) ) ( not ( = ?auto_195343 ?auto_195346 ) ) ( not ( = ?auto_195344 ?auto_195346 ) ) ( not ( = ?auto_195345 ?auto_195346 ) ) ( not ( = ?auto_195348 ?auto_195346 ) ) ( not ( = ?auto_195347 ?auto_195346 ) ) ( ON ?auto_195341 ?auto_195340 ) ( ON-TABLE ?auto_195346 ) ( ON ?auto_195342 ?auto_195341 ) ( CLEAR ?auto_195344 ) ( ON ?auto_195343 ?auto_195342 ) ( CLEAR ?auto_195343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195346 ?auto_195340 ?auto_195341 ?auto_195342 )
      ( MAKE-6PILE ?auto_195340 ?auto_195341 ?auto_195342 ?auto_195343 ?auto_195344 ?auto_195345 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195349 - BLOCK
      ?auto_195350 - BLOCK
      ?auto_195351 - BLOCK
      ?auto_195352 - BLOCK
      ?auto_195353 - BLOCK
      ?auto_195354 - BLOCK
    )
    :vars
    (
      ?auto_195356 - BLOCK
      ?auto_195355 - BLOCK
      ?auto_195357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195349 ?auto_195350 ) ) ( not ( = ?auto_195349 ?auto_195351 ) ) ( not ( = ?auto_195349 ?auto_195352 ) ) ( not ( = ?auto_195349 ?auto_195353 ) ) ( not ( = ?auto_195349 ?auto_195354 ) ) ( not ( = ?auto_195350 ?auto_195351 ) ) ( not ( = ?auto_195350 ?auto_195352 ) ) ( not ( = ?auto_195350 ?auto_195353 ) ) ( not ( = ?auto_195350 ?auto_195354 ) ) ( not ( = ?auto_195351 ?auto_195352 ) ) ( not ( = ?auto_195351 ?auto_195353 ) ) ( not ( = ?auto_195351 ?auto_195354 ) ) ( not ( = ?auto_195352 ?auto_195353 ) ) ( not ( = ?auto_195352 ?auto_195354 ) ) ( not ( = ?auto_195353 ?auto_195354 ) ) ( ON ?auto_195354 ?auto_195356 ) ( not ( = ?auto_195349 ?auto_195356 ) ) ( not ( = ?auto_195350 ?auto_195356 ) ) ( not ( = ?auto_195351 ?auto_195356 ) ) ( not ( = ?auto_195352 ?auto_195356 ) ) ( not ( = ?auto_195353 ?auto_195356 ) ) ( not ( = ?auto_195354 ?auto_195356 ) ) ( ON-TABLE ?auto_195355 ) ( ON ?auto_195356 ?auto_195355 ) ( not ( = ?auto_195355 ?auto_195356 ) ) ( not ( = ?auto_195355 ?auto_195354 ) ) ( not ( = ?auto_195355 ?auto_195353 ) ) ( not ( = ?auto_195349 ?auto_195355 ) ) ( not ( = ?auto_195350 ?auto_195355 ) ) ( not ( = ?auto_195351 ?auto_195355 ) ) ( not ( = ?auto_195352 ?auto_195355 ) ) ( ON ?auto_195349 ?auto_195357 ) ( not ( = ?auto_195349 ?auto_195357 ) ) ( not ( = ?auto_195350 ?auto_195357 ) ) ( not ( = ?auto_195351 ?auto_195357 ) ) ( not ( = ?auto_195352 ?auto_195357 ) ) ( not ( = ?auto_195353 ?auto_195357 ) ) ( not ( = ?auto_195354 ?auto_195357 ) ) ( not ( = ?auto_195356 ?auto_195357 ) ) ( not ( = ?auto_195355 ?auto_195357 ) ) ( ON ?auto_195350 ?auto_195349 ) ( ON-TABLE ?auto_195357 ) ( ON ?auto_195351 ?auto_195350 ) ( ON ?auto_195352 ?auto_195351 ) ( CLEAR ?auto_195352 ) ( HOLDING ?auto_195353 ) ( CLEAR ?auto_195354 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195355 ?auto_195356 ?auto_195354 ?auto_195353 )
      ( MAKE-6PILE ?auto_195349 ?auto_195350 ?auto_195351 ?auto_195352 ?auto_195353 ?auto_195354 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195358 - BLOCK
      ?auto_195359 - BLOCK
      ?auto_195360 - BLOCK
      ?auto_195361 - BLOCK
      ?auto_195362 - BLOCK
      ?auto_195363 - BLOCK
    )
    :vars
    (
      ?auto_195364 - BLOCK
      ?auto_195366 - BLOCK
      ?auto_195365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195358 ?auto_195359 ) ) ( not ( = ?auto_195358 ?auto_195360 ) ) ( not ( = ?auto_195358 ?auto_195361 ) ) ( not ( = ?auto_195358 ?auto_195362 ) ) ( not ( = ?auto_195358 ?auto_195363 ) ) ( not ( = ?auto_195359 ?auto_195360 ) ) ( not ( = ?auto_195359 ?auto_195361 ) ) ( not ( = ?auto_195359 ?auto_195362 ) ) ( not ( = ?auto_195359 ?auto_195363 ) ) ( not ( = ?auto_195360 ?auto_195361 ) ) ( not ( = ?auto_195360 ?auto_195362 ) ) ( not ( = ?auto_195360 ?auto_195363 ) ) ( not ( = ?auto_195361 ?auto_195362 ) ) ( not ( = ?auto_195361 ?auto_195363 ) ) ( not ( = ?auto_195362 ?auto_195363 ) ) ( ON ?auto_195363 ?auto_195364 ) ( not ( = ?auto_195358 ?auto_195364 ) ) ( not ( = ?auto_195359 ?auto_195364 ) ) ( not ( = ?auto_195360 ?auto_195364 ) ) ( not ( = ?auto_195361 ?auto_195364 ) ) ( not ( = ?auto_195362 ?auto_195364 ) ) ( not ( = ?auto_195363 ?auto_195364 ) ) ( ON-TABLE ?auto_195366 ) ( ON ?auto_195364 ?auto_195366 ) ( not ( = ?auto_195366 ?auto_195364 ) ) ( not ( = ?auto_195366 ?auto_195363 ) ) ( not ( = ?auto_195366 ?auto_195362 ) ) ( not ( = ?auto_195358 ?auto_195366 ) ) ( not ( = ?auto_195359 ?auto_195366 ) ) ( not ( = ?auto_195360 ?auto_195366 ) ) ( not ( = ?auto_195361 ?auto_195366 ) ) ( ON ?auto_195358 ?auto_195365 ) ( not ( = ?auto_195358 ?auto_195365 ) ) ( not ( = ?auto_195359 ?auto_195365 ) ) ( not ( = ?auto_195360 ?auto_195365 ) ) ( not ( = ?auto_195361 ?auto_195365 ) ) ( not ( = ?auto_195362 ?auto_195365 ) ) ( not ( = ?auto_195363 ?auto_195365 ) ) ( not ( = ?auto_195364 ?auto_195365 ) ) ( not ( = ?auto_195366 ?auto_195365 ) ) ( ON ?auto_195359 ?auto_195358 ) ( ON-TABLE ?auto_195365 ) ( ON ?auto_195360 ?auto_195359 ) ( ON ?auto_195361 ?auto_195360 ) ( CLEAR ?auto_195363 ) ( ON ?auto_195362 ?auto_195361 ) ( CLEAR ?auto_195362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195365 ?auto_195358 ?auto_195359 ?auto_195360 ?auto_195361 )
      ( MAKE-6PILE ?auto_195358 ?auto_195359 ?auto_195360 ?auto_195361 ?auto_195362 ?auto_195363 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195367 - BLOCK
      ?auto_195368 - BLOCK
      ?auto_195369 - BLOCK
      ?auto_195370 - BLOCK
      ?auto_195371 - BLOCK
      ?auto_195372 - BLOCK
    )
    :vars
    (
      ?auto_195374 - BLOCK
      ?auto_195375 - BLOCK
      ?auto_195373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195367 ?auto_195368 ) ) ( not ( = ?auto_195367 ?auto_195369 ) ) ( not ( = ?auto_195367 ?auto_195370 ) ) ( not ( = ?auto_195367 ?auto_195371 ) ) ( not ( = ?auto_195367 ?auto_195372 ) ) ( not ( = ?auto_195368 ?auto_195369 ) ) ( not ( = ?auto_195368 ?auto_195370 ) ) ( not ( = ?auto_195368 ?auto_195371 ) ) ( not ( = ?auto_195368 ?auto_195372 ) ) ( not ( = ?auto_195369 ?auto_195370 ) ) ( not ( = ?auto_195369 ?auto_195371 ) ) ( not ( = ?auto_195369 ?auto_195372 ) ) ( not ( = ?auto_195370 ?auto_195371 ) ) ( not ( = ?auto_195370 ?auto_195372 ) ) ( not ( = ?auto_195371 ?auto_195372 ) ) ( not ( = ?auto_195367 ?auto_195374 ) ) ( not ( = ?auto_195368 ?auto_195374 ) ) ( not ( = ?auto_195369 ?auto_195374 ) ) ( not ( = ?auto_195370 ?auto_195374 ) ) ( not ( = ?auto_195371 ?auto_195374 ) ) ( not ( = ?auto_195372 ?auto_195374 ) ) ( ON-TABLE ?auto_195375 ) ( ON ?auto_195374 ?auto_195375 ) ( not ( = ?auto_195375 ?auto_195374 ) ) ( not ( = ?auto_195375 ?auto_195372 ) ) ( not ( = ?auto_195375 ?auto_195371 ) ) ( not ( = ?auto_195367 ?auto_195375 ) ) ( not ( = ?auto_195368 ?auto_195375 ) ) ( not ( = ?auto_195369 ?auto_195375 ) ) ( not ( = ?auto_195370 ?auto_195375 ) ) ( ON ?auto_195367 ?auto_195373 ) ( not ( = ?auto_195367 ?auto_195373 ) ) ( not ( = ?auto_195368 ?auto_195373 ) ) ( not ( = ?auto_195369 ?auto_195373 ) ) ( not ( = ?auto_195370 ?auto_195373 ) ) ( not ( = ?auto_195371 ?auto_195373 ) ) ( not ( = ?auto_195372 ?auto_195373 ) ) ( not ( = ?auto_195374 ?auto_195373 ) ) ( not ( = ?auto_195375 ?auto_195373 ) ) ( ON ?auto_195368 ?auto_195367 ) ( ON-TABLE ?auto_195373 ) ( ON ?auto_195369 ?auto_195368 ) ( ON ?auto_195370 ?auto_195369 ) ( ON ?auto_195371 ?auto_195370 ) ( CLEAR ?auto_195371 ) ( HOLDING ?auto_195372 ) ( CLEAR ?auto_195374 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195375 ?auto_195374 ?auto_195372 )
      ( MAKE-6PILE ?auto_195367 ?auto_195368 ?auto_195369 ?auto_195370 ?auto_195371 ?auto_195372 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195376 - BLOCK
      ?auto_195377 - BLOCK
      ?auto_195378 - BLOCK
      ?auto_195379 - BLOCK
      ?auto_195380 - BLOCK
      ?auto_195381 - BLOCK
    )
    :vars
    (
      ?auto_195383 - BLOCK
      ?auto_195382 - BLOCK
      ?auto_195384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195376 ?auto_195377 ) ) ( not ( = ?auto_195376 ?auto_195378 ) ) ( not ( = ?auto_195376 ?auto_195379 ) ) ( not ( = ?auto_195376 ?auto_195380 ) ) ( not ( = ?auto_195376 ?auto_195381 ) ) ( not ( = ?auto_195377 ?auto_195378 ) ) ( not ( = ?auto_195377 ?auto_195379 ) ) ( not ( = ?auto_195377 ?auto_195380 ) ) ( not ( = ?auto_195377 ?auto_195381 ) ) ( not ( = ?auto_195378 ?auto_195379 ) ) ( not ( = ?auto_195378 ?auto_195380 ) ) ( not ( = ?auto_195378 ?auto_195381 ) ) ( not ( = ?auto_195379 ?auto_195380 ) ) ( not ( = ?auto_195379 ?auto_195381 ) ) ( not ( = ?auto_195380 ?auto_195381 ) ) ( not ( = ?auto_195376 ?auto_195383 ) ) ( not ( = ?auto_195377 ?auto_195383 ) ) ( not ( = ?auto_195378 ?auto_195383 ) ) ( not ( = ?auto_195379 ?auto_195383 ) ) ( not ( = ?auto_195380 ?auto_195383 ) ) ( not ( = ?auto_195381 ?auto_195383 ) ) ( ON-TABLE ?auto_195382 ) ( ON ?auto_195383 ?auto_195382 ) ( not ( = ?auto_195382 ?auto_195383 ) ) ( not ( = ?auto_195382 ?auto_195381 ) ) ( not ( = ?auto_195382 ?auto_195380 ) ) ( not ( = ?auto_195376 ?auto_195382 ) ) ( not ( = ?auto_195377 ?auto_195382 ) ) ( not ( = ?auto_195378 ?auto_195382 ) ) ( not ( = ?auto_195379 ?auto_195382 ) ) ( ON ?auto_195376 ?auto_195384 ) ( not ( = ?auto_195376 ?auto_195384 ) ) ( not ( = ?auto_195377 ?auto_195384 ) ) ( not ( = ?auto_195378 ?auto_195384 ) ) ( not ( = ?auto_195379 ?auto_195384 ) ) ( not ( = ?auto_195380 ?auto_195384 ) ) ( not ( = ?auto_195381 ?auto_195384 ) ) ( not ( = ?auto_195383 ?auto_195384 ) ) ( not ( = ?auto_195382 ?auto_195384 ) ) ( ON ?auto_195377 ?auto_195376 ) ( ON-TABLE ?auto_195384 ) ( ON ?auto_195378 ?auto_195377 ) ( ON ?auto_195379 ?auto_195378 ) ( ON ?auto_195380 ?auto_195379 ) ( CLEAR ?auto_195383 ) ( ON ?auto_195381 ?auto_195380 ) ( CLEAR ?auto_195381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195384 ?auto_195376 ?auto_195377 ?auto_195378 ?auto_195379 ?auto_195380 )
      ( MAKE-6PILE ?auto_195376 ?auto_195377 ?auto_195378 ?auto_195379 ?auto_195380 ?auto_195381 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195385 - BLOCK
      ?auto_195386 - BLOCK
      ?auto_195387 - BLOCK
      ?auto_195388 - BLOCK
      ?auto_195389 - BLOCK
      ?auto_195390 - BLOCK
    )
    :vars
    (
      ?auto_195392 - BLOCK
      ?auto_195393 - BLOCK
      ?auto_195391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195385 ?auto_195386 ) ) ( not ( = ?auto_195385 ?auto_195387 ) ) ( not ( = ?auto_195385 ?auto_195388 ) ) ( not ( = ?auto_195385 ?auto_195389 ) ) ( not ( = ?auto_195385 ?auto_195390 ) ) ( not ( = ?auto_195386 ?auto_195387 ) ) ( not ( = ?auto_195386 ?auto_195388 ) ) ( not ( = ?auto_195386 ?auto_195389 ) ) ( not ( = ?auto_195386 ?auto_195390 ) ) ( not ( = ?auto_195387 ?auto_195388 ) ) ( not ( = ?auto_195387 ?auto_195389 ) ) ( not ( = ?auto_195387 ?auto_195390 ) ) ( not ( = ?auto_195388 ?auto_195389 ) ) ( not ( = ?auto_195388 ?auto_195390 ) ) ( not ( = ?auto_195389 ?auto_195390 ) ) ( not ( = ?auto_195385 ?auto_195392 ) ) ( not ( = ?auto_195386 ?auto_195392 ) ) ( not ( = ?auto_195387 ?auto_195392 ) ) ( not ( = ?auto_195388 ?auto_195392 ) ) ( not ( = ?auto_195389 ?auto_195392 ) ) ( not ( = ?auto_195390 ?auto_195392 ) ) ( ON-TABLE ?auto_195393 ) ( not ( = ?auto_195393 ?auto_195392 ) ) ( not ( = ?auto_195393 ?auto_195390 ) ) ( not ( = ?auto_195393 ?auto_195389 ) ) ( not ( = ?auto_195385 ?auto_195393 ) ) ( not ( = ?auto_195386 ?auto_195393 ) ) ( not ( = ?auto_195387 ?auto_195393 ) ) ( not ( = ?auto_195388 ?auto_195393 ) ) ( ON ?auto_195385 ?auto_195391 ) ( not ( = ?auto_195385 ?auto_195391 ) ) ( not ( = ?auto_195386 ?auto_195391 ) ) ( not ( = ?auto_195387 ?auto_195391 ) ) ( not ( = ?auto_195388 ?auto_195391 ) ) ( not ( = ?auto_195389 ?auto_195391 ) ) ( not ( = ?auto_195390 ?auto_195391 ) ) ( not ( = ?auto_195392 ?auto_195391 ) ) ( not ( = ?auto_195393 ?auto_195391 ) ) ( ON ?auto_195386 ?auto_195385 ) ( ON-TABLE ?auto_195391 ) ( ON ?auto_195387 ?auto_195386 ) ( ON ?auto_195388 ?auto_195387 ) ( ON ?auto_195389 ?auto_195388 ) ( ON ?auto_195390 ?auto_195389 ) ( CLEAR ?auto_195390 ) ( HOLDING ?auto_195392 ) ( CLEAR ?auto_195393 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195393 ?auto_195392 )
      ( MAKE-6PILE ?auto_195385 ?auto_195386 ?auto_195387 ?auto_195388 ?auto_195389 ?auto_195390 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195394 - BLOCK
      ?auto_195395 - BLOCK
      ?auto_195396 - BLOCK
      ?auto_195397 - BLOCK
      ?auto_195398 - BLOCK
      ?auto_195399 - BLOCK
    )
    :vars
    (
      ?auto_195400 - BLOCK
      ?auto_195401 - BLOCK
      ?auto_195402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195394 ?auto_195395 ) ) ( not ( = ?auto_195394 ?auto_195396 ) ) ( not ( = ?auto_195394 ?auto_195397 ) ) ( not ( = ?auto_195394 ?auto_195398 ) ) ( not ( = ?auto_195394 ?auto_195399 ) ) ( not ( = ?auto_195395 ?auto_195396 ) ) ( not ( = ?auto_195395 ?auto_195397 ) ) ( not ( = ?auto_195395 ?auto_195398 ) ) ( not ( = ?auto_195395 ?auto_195399 ) ) ( not ( = ?auto_195396 ?auto_195397 ) ) ( not ( = ?auto_195396 ?auto_195398 ) ) ( not ( = ?auto_195396 ?auto_195399 ) ) ( not ( = ?auto_195397 ?auto_195398 ) ) ( not ( = ?auto_195397 ?auto_195399 ) ) ( not ( = ?auto_195398 ?auto_195399 ) ) ( not ( = ?auto_195394 ?auto_195400 ) ) ( not ( = ?auto_195395 ?auto_195400 ) ) ( not ( = ?auto_195396 ?auto_195400 ) ) ( not ( = ?auto_195397 ?auto_195400 ) ) ( not ( = ?auto_195398 ?auto_195400 ) ) ( not ( = ?auto_195399 ?auto_195400 ) ) ( ON-TABLE ?auto_195401 ) ( not ( = ?auto_195401 ?auto_195400 ) ) ( not ( = ?auto_195401 ?auto_195399 ) ) ( not ( = ?auto_195401 ?auto_195398 ) ) ( not ( = ?auto_195394 ?auto_195401 ) ) ( not ( = ?auto_195395 ?auto_195401 ) ) ( not ( = ?auto_195396 ?auto_195401 ) ) ( not ( = ?auto_195397 ?auto_195401 ) ) ( ON ?auto_195394 ?auto_195402 ) ( not ( = ?auto_195394 ?auto_195402 ) ) ( not ( = ?auto_195395 ?auto_195402 ) ) ( not ( = ?auto_195396 ?auto_195402 ) ) ( not ( = ?auto_195397 ?auto_195402 ) ) ( not ( = ?auto_195398 ?auto_195402 ) ) ( not ( = ?auto_195399 ?auto_195402 ) ) ( not ( = ?auto_195400 ?auto_195402 ) ) ( not ( = ?auto_195401 ?auto_195402 ) ) ( ON ?auto_195395 ?auto_195394 ) ( ON-TABLE ?auto_195402 ) ( ON ?auto_195396 ?auto_195395 ) ( ON ?auto_195397 ?auto_195396 ) ( ON ?auto_195398 ?auto_195397 ) ( ON ?auto_195399 ?auto_195398 ) ( CLEAR ?auto_195401 ) ( ON ?auto_195400 ?auto_195399 ) ( CLEAR ?auto_195400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195402 ?auto_195394 ?auto_195395 ?auto_195396 ?auto_195397 ?auto_195398 ?auto_195399 )
      ( MAKE-6PILE ?auto_195394 ?auto_195395 ?auto_195396 ?auto_195397 ?auto_195398 ?auto_195399 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195403 - BLOCK
      ?auto_195404 - BLOCK
      ?auto_195405 - BLOCK
      ?auto_195406 - BLOCK
      ?auto_195407 - BLOCK
      ?auto_195408 - BLOCK
    )
    :vars
    (
      ?auto_195409 - BLOCK
      ?auto_195411 - BLOCK
      ?auto_195410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195403 ?auto_195404 ) ) ( not ( = ?auto_195403 ?auto_195405 ) ) ( not ( = ?auto_195403 ?auto_195406 ) ) ( not ( = ?auto_195403 ?auto_195407 ) ) ( not ( = ?auto_195403 ?auto_195408 ) ) ( not ( = ?auto_195404 ?auto_195405 ) ) ( not ( = ?auto_195404 ?auto_195406 ) ) ( not ( = ?auto_195404 ?auto_195407 ) ) ( not ( = ?auto_195404 ?auto_195408 ) ) ( not ( = ?auto_195405 ?auto_195406 ) ) ( not ( = ?auto_195405 ?auto_195407 ) ) ( not ( = ?auto_195405 ?auto_195408 ) ) ( not ( = ?auto_195406 ?auto_195407 ) ) ( not ( = ?auto_195406 ?auto_195408 ) ) ( not ( = ?auto_195407 ?auto_195408 ) ) ( not ( = ?auto_195403 ?auto_195409 ) ) ( not ( = ?auto_195404 ?auto_195409 ) ) ( not ( = ?auto_195405 ?auto_195409 ) ) ( not ( = ?auto_195406 ?auto_195409 ) ) ( not ( = ?auto_195407 ?auto_195409 ) ) ( not ( = ?auto_195408 ?auto_195409 ) ) ( not ( = ?auto_195411 ?auto_195409 ) ) ( not ( = ?auto_195411 ?auto_195408 ) ) ( not ( = ?auto_195411 ?auto_195407 ) ) ( not ( = ?auto_195403 ?auto_195411 ) ) ( not ( = ?auto_195404 ?auto_195411 ) ) ( not ( = ?auto_195405 ?auto_195411 ) ) ( not ( = ?auto_195406 ?auto_195411 ) ) ( ON ?auto_195403 ?auto_195410 ) ( not ( = ?auto_195403 ?auto_195410 ) ) ( not ( = ?auto_195404 ?auto_195410 ) ) ( not ( = ?auto_195405 ?auto_195410 ) ) ( not ( = ?auto_195406 ?auto_195410 ) ) ( not ( = ?auto_195407 ?auto_195410 ) ) ( not ( = ?auto_195408 ?auto_195410 ) ) ( not ( = ?auto_195409 ?auto_195410 ) ) ( not ( = ?auto_195411 ?auto_195410 ) ) ( ON ?auto_195404 ?auto_195403 ) ( ON-TABLE ?auto_195410 ) ( ON ?auto_195405 ?auto_195404 ) ( ON ?auto_195406 ?auto_195405 ) ( ON ?auto_195407 ?auto_195406 ) ( ON ?auto_195408 ?auto_195407 ) ( ON ?auto_195409 ?auto_195408 ) ( CLEAR ?auto_195409 ) ( HOLDING ?auto_195411 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_195411 )
      ( MAKE-6PILE ?auto_195403 ?auto_195404 ?auto_195405 ?auto_195406 ?auto_195407 ?auto_195408 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_195412 - BLOCK
      ?auto_195413 - BLOCK
      ?auto_195414 - BLOCK
      ?auto_195415 - BLOCK
      ?auto_195416 - BLOCK
      ?auto_195417 - BLOCK
    )
    :vars
    (
      ?auto_195420 - BLOCK
      ?auto_195419 - BLOCK
      ?auto_195418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195412 ?auto_195413 ) ) ( not ( = ?auto_195412 ?auto_195414 ) ) ( not ( = ?auto_195412 ?auto_195415 ) ) ( not ( = ?auto_195412 ?auto_195416 ) ) ( not ( = ?auto_195412 ?auto_195417 ) ) ( not ( = ?auto_195413 ?auto_195414 ) ) ( not ( = ?auto_195413 ?auto_195415 ) ) ( not ( = ?auto_195413 ?auto_195416 ) ) ( not ( = ?auto_195413 ?auto_195417 ) ) ( not ( = ?auto_195414 ?auto_195415 ) ) ( not ( = ?auto_195414 ?auto_195416 ) ) ( not ( = ?auto_195414 ?auto_195417 ) ) ( not ( = ?auto_195415 ?auto_195416 ) ) ( not ( = ?auto_195415 ?auto_195417 ) ) ( not ( = ?auto_195416 ?auto_195417 ) ) ( not ( = ?auto_195412 ?auto_195420 ) ) ( not ( = ?auto_195413 ?auto_195420 ) ) ( not ( = ?auto_195414 ?auto_195420 ) ) ( not ( = ?auto_195415 ?auto_195420 ) ) ( not ( = ?auto_195416 ?auto_195420 ) ) ( not ( = ?auto_195417 ?auto_195420 ) ) ( not ( = ?auto_195419 ?auto_195420 ) ) ( not ( = ?auto_195419 ?auto_195417 ) ) ( not ( = ?auto_195419 ?auto_195416 ) ) ( not ( = ?auto_195412 ?auto_195419 ) ) ( not ( = ?auto_195413 ?auto_195419 ) ) ( not ( = ?auto_195414 ?auto_195419 ) ) ( not ( = ?auto_195415 ?auto_195419 ) ) ( ON ?auto_195412 ?auto_195418 ) ( not ( = ?auto_195412 ?auto_195418 ) ) ( not ( = ?auto_195413 ?auto_195418 ) ) ( not ( = ?auto_195414 ?auto_195418 ) ) ( not ( = ?auto_195415 ?auto_195418 ) ) ( not ( = ?auto_195416 ?auto_195418 ) ) ( not ( = ?auto_195417 ?auto_195418 ) ) ( not ( = ?auto_195420 ?auto_195418 ) ) ( not ( = ?auto_195419 ?auto_195418 ) ) ( ON ?auto_195413 ?auto_195412 ) ( ON-TABLE ?auto_195418 ) ( ON ?auto_195414 ?auto_195413 ) ( ON ?auto_195415 ?auto_195414 ) ( ON ?auto_195416 ?auto_195415 ) ( ON ?auto_195417 ?auto_195416 ) ( ON ?auto_195420 ?auto_195417 ) ( ON ?auto_195419 ?auto_195420 ) ( CLEAR ?auto_195419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_195418 ?auto_195412 ?auto_195413 ?auto_195414 ?auto_195415 ?auto_195416 ?auto_195417 ?auto_195420 )
      ( MAKE-6PILE ?auto_195412 ?auto_195413 ?auto_195414 ?auto_195415 ?auto_195416 ?auto_195417 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195422 - BLOCK
    )
    :vars
    (
      ?auto_195423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195423 ?auto_195422 ) ( CLEAR ?auto_195423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_195422 ) ( not ( = ?auto_195422 ?auto_195423 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195423 ?auto_195422 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195424 - BLOCK
    )
    :vars
    (
      ?auto_195425 - BLOCK
      ?auto_195426 - BLOCK
      ?auto_195427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195425 ?auto_195424 ) ( CLEAR ?auto_195425 ) ( ON-TABLE ?auto_195424 ) ( not ( = ?auto_195424 ?auto_195425 ) ) ( HOLDING ?auto_195426 ) ( CLEAR ?auto_195427 ) ( not ( = ?auto_195424 ?auto_195426 ) ) ( not ( = ?auto_195424 ?auto_195427 ) ) ( not ( = ?auto_195425 ?auto_195426 ) ) ( not ( = ?auto_195425 ?auto_195427 ) ) ( not ( = ?auto_195426 ?auto_195427 ) ) )
    :subtasks
    ( ( !STACK ?auto_195426 ?auto_195427 )
      ( MAKE-1PILE ?auto_195424 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195428 - BLOCK
    )
    :vars
    (
      ?auto_195430 - BLOCK
      ?auto_195429 - BLOCK
      ?auto_195431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195430 ?auto_195428 ) ( ON-TABLE ?auto_195428 ) ( not ( = ?auto_195428 ?auto_195430 ) ) ( CLEAR ?auto_195429 ) ( not ( = ?auto_195428 ?auto_195431 ) ) ( not ( = ?auto_195428 ?auto_195429 ) ) ( not ( = ?auto_195430 ?auto_195431 ) ) ( not ( = ?auto_195430 ?auto_195429 ) ) ( not ( = ?auto_195431 ?auto_195429 ) ) ( ON ?auto_195431 ?auto_195430 ) ( CLEAR ?auto_195431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195428 ?auto_195430 )
      ( MAKE-1PILE ?auto_195428 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195432 - BLOCK
    )
    :vars
    (
      ?auto_195433 - BLOCK
      ?auto_195435 - BLOCK
      ?auto_195434 - BLOCK
      ?auto_195437 - BLOCK
      ?auto_195438 - BLOCK
      ?auto_195439 - BLOCK
      ?auto_195436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195433 ?auto_195432 ) ( ON-TABLE ?auto_195432 ) ( not ( = ?auto_195432 ?auto_195433 ) ) ( not ( = ?auto_195432 ?auto_195435 ) ) ( not ( = ?auto_195432 ?auto_195434 ) ) ( not ( = ?auto_195433 ?auto_195435 ) ) ( not ( = ?auto_195433 ?auto_195434 ) ) ( not ( = ?auto_195435 ?auto_195434 ) ) ( ON ?auto_195435 ?auto_195433 ) ( CLEAR ?auto_195435 ) ( HOLDING ?auto_195434 ) ( CLEAR ?auto_195437 ) ( ON-TABLE ?auto_195438 ) ( ON ?auto_195439 ?auto_195438 ) ( ON ?auto_195436 ?auto_195439 ) ( ON ?auto_195437 ?auto_195436 ) ( not ( = ?auto_195438 ?auto_195439 ) ) ( not ( = ?auto_195438 ?auto_195436 ) ) ( not ( = ?auto_195438 ?auto_195437 ) ) ( not ( = ?auto_195438 ?auto_195434 ) ) ( not ( = ?auto_195439 ?auto_195436 ) ) ( not ( = ?auto_195439 ?auto_195437 ) ) ( not ( = ?auto_195439 ?auto_195434 ) ) ( not ( = ?auto_195436 ?auto_195437 ) ) ( not ( = ?auto_195436 ?auto_195434 ) ) ( not ( = ?auto_195437 ?auto_195434 ) ) ( not ( = ?auto_195432 ?auto_195437 ) ) ( not ( = ?auto_195432 ?auto_195438 ) ) ( not ( = ?auto_195432 ?auto_195439 ) ) ( not ( = ?auto_195432 ?auto_195436 ) ) ( not ( = ?auto_195433 ?auto_195437 ) ) ( not ( = ?auto_195433 ?auto_195438 ) ) ( not ( = ?auto_195433 ?auto_195439 ) ) ( not ( = ?auto_195433 ?auto_195436 ) ) ( not ( = ?auto_195435 ?auto_195437 ) ) ( not ( = ?auto_195435 ?auto_195438 ) ) ( not ( = ?auto_195435 ?auto_195439 ) ) ( not ( = ?auto_195435 ?auto_195436 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195438 ?auto_195439 ?auto_195436 ?auto_195437 ?auto_195434 )
      ( MAKE-1PILE ?auto_195432 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195440 - BLOCK
    )
    :vars
    (
      ?auto_195444 - BLOCK
      ?auto_195445 - BLOCK
      ?auto_195446 - BLOCK
      ?auto_195443 - BLOCK
      ?auto_195442 - BLOCK
      ?auto_195441 - BLOCK
      ?auto_195447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195444 ?auto_195440 ) ( ON-TABLE ?auto_195440 ) ( not ( = ?auto_195440 ?auto_195444 ) ) ( not ( = ?auto_195440 ?auto_195445 ) ) ( not ( = ?auto_195440 ?auto_195446 ) ) ( not ( = ?auto_195444 ?auto_195445 ) ) ( not ( = ?auto_195444 ?auto_195446 ) ) ( not ( = ?auto_195445 ?auto_195446 ) ) ( ON ?auto_195445 ?auto_195444 ) ( CLEAR ?auto_195443 ) ( ON-TABLE ?auto_195442 ) ( ON ?auto_195441 ?auto_195442 ) ( ON ?auto_195447 ?auto_195441 ) ( ON ?auto_195443 ?auto_195447 ) ( not ( = ?auto_195442 ?auto_195441 ) ) ( not ( = ?auto_195442 ?auto_195447 ) ) ( not ( = ?auto_195442 ?auto_195443 ) ) ( not ( = ?auto_195442 ?auto_195446 ) ) ( not ( = ?auto_195441 ?auto_195447 ) ) ( not ( = ?auto_195441 ?auto_195443 ) ) ( not ( = ?auto_195441 ?auto_195446 ) ) ( not ( = ?auto_195447 ?auto_195443 ) ) ( not ( = ?auto_195447 ?auto_195446 ) ) ( not ( = ?auto_195443 ?auto_195446 ) ) ( not ( = ?auto_195440 ?auto_195443 ) ) ( not ( = ?auto_195440 ?auto_195442 ) ) ( not ( = ?auto_195440 ?auto_195441 ) ) ( not ( = ?auto_195440 ?auto_195447 ) ) ( not ( = ?auto_195444 ?auto_195443 ) ) ( not ( = ?auto_195444 ?auto_195442 ) ) ( not ( = ?auto_195444 ?auto_195441 ) ) ( not ( = ?auto_195444 ?auto_195447 ) ) ( not ( = ?auto_195445 ?auto_195443 ) ) ( not ( = ?auto_195445 ?auto_195442 ) ) ( not ( = ?auto_195445 ?auto_195441 ) ) ( not ( = ?auto_195445 ?auto_195447 ) ) ( ON ?auto_195446 ?auto_195445 ) ( CLEAR ?auto_195446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195440 ?auto_195444 ?auto_195445 )
      ( MAKE-1PILE ?auto_195440 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195448 - BLOCK
    )
    :vars
    (
      ?auto_195449 - BLOCK
      ?auto_195455 - BLOCK
      ?auto_195452 - BLOCK
      ?auto_195451 - BLOCK
      ?auto_195454 - BLOCK
      ?auto_195453 - BLOCK
      ?auto_195450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195449 ?auto_195448 ) ( ON-TABLE ?auto_195448 ) ( not ( = ?auto_195448 ?auto_195449 ) ) ( not ( = ?auto_195448 ?auto_195455 ) ) ( not ( = ?auto_195448 ?auto_195452 ) ) ( not ( = ?auto_195449 ?auto_195455 ) ) ( not ( = ?auto_195449 ?auto_195452 ) ) ( not ( = ?auto_195455 ?auto_195452 ) ) ( ON ?auto_195455 ?auto_195449 ) ( ON-TABLE ?auto_195451 ) ( ON ?auto_195454 ?auto_195451 ) ( ON ?auto_195453 ?auto_195454 ) ( not ( = ?auto_195451 ?auto_195454 ) ) ( not ( = ?auto_195451 ?auto_195453 ) ) ( not ( = ?auto_195451 ?auto_195450 ) ) ( not ( = ?auto_195451 ?auto_195452 ) ) ( not ( = ?auto_195454 ?auto_195453 ) ) ( not ( = ?auto_195454 ?auto_195450 ) ) ( not ( = ?auto_195454 ?auto_195452 ) ) ( not ( = ?auto_195453 ?auto_195450 ) ) ( not ( = ?auto_195453 ?auto_195452 ) ) ( not ( = ?auto_195450 ?auto_195452 ) ) ( not ( = ?auto_195448 ?auto_195450 ) ) ( not ( = ?auto_195448 ?auto_195451 ) ) ( not ( = ?auto_195448 ?auto_195454 ) ) ( not ( = ?auto_195448 ?auto_195453 ) ) ( not ( = ?auto_195449 ?auto_195450 ) ) ( not ( = ?auto_195449 ?auto_195451 ) ) ( not ( = ?auto_195449 ?auto_195454 ) ) ( not ( = ?auto_195449 ?auto_195453 ) ) ( not ( = ?auto_195455 ?auto_195450 ) ) ( not ( = ?auto_195455 ?auto_195451 ) ) ( not ( = ?auto_195455 ?auto_195454 ) ) ( not ( = ?auto_195455 ?auto_195453 ) ) ( ON ?auto_195452 ?auto_195455 ) ( CLEAR ?auto_195452 ) ( HOLDING ?auto_195450 ) ( CLEAR ?auto_195453 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195451 ?auto_195454 ?auto_195453 ?auto_195450 )
      ( MAKE-1PILE ?auto_195448 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195456 - BLOCK
    )
    :vars
    (
      ?auto_195460 - BLOCK
      ?auto_195457 - BLOCK
      ?auto_195463 - BLOCK
      ?auto_195462 - BLOCK
      ?auto_195458 - BLOCK
      ?auto_195461 - BLOCK
      ?auto_195459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195460 ?auto_195456 ) ( ON-TABLE ?auto_195456 ) ( not ( = ?auto_195456 ?auto_195460 ) ) ( not ( = ?auto_195456 ?auto_195457 ) ) ( not ( = ?auto_195456 ?auto_195463 ) ) ( not ( = ?auto_195460 ?auto_195457 ) ) ( not ( = ?auto_195460 ?auto_195463 ) ) ( not ( = ?auto_195457 ?auto_195463 ) ) ( ON ?auto_195457 ?auto_195460 ) ( ON-TABLE ?auto_195462 ) ( ON ?auto_195458 ?auto_195462 ) ( ON ?auto_195461 ?auto_195458 ) ( not ( = ?auto_195462 ?auto_195458 ) ) ( not ( = ?auto_195462 ?auto_195461 ) ) ( not ( = ?auto_195462 ?auto_195459 ) ) ( not ( = ?auto_195462 ?auto_195463 ) ) ( not ( = ?auto_195458 ?auto_195461 ) ) ( not ( = ?auto_195458 ?auto_195459 ) ) ( not ( = ?auto_195458 ?auto_195463 ) ) ( not ( = ?auto_195461 ?auto_195459 ) ) ( not ( = ?auto_195461 ?auto_195463 ) ) ( not ( = ?auto_195459 ?auto_195463 ) ) ( not ( = ?auto_195456 ?auto_195459 ) ) ( not ( = ?auto_195456 ?auto_195462 ) ) ( not ( = ?auto_195456 ?auto_195458 ) ) ( not ( = ?auto_195456 ?auto_195461 ) ) ( not ( = ?auto_195460 ?auto_195459 ) ) ( not ( = ?auto_195460 ?auto_195462 ) ) ( not ( = ?auto_195460 ?auto_195458 ) ) ( not ( = ?auto_195460 ?auto_195461 ) ) ( not ( = ?auto_195457 ?auto_195459 ) ) ( not ( = ?auto_195457 ?auto_195462 ) ) ( not ( = ?auto_195457 ?auto_195458 ) ) ( not ( = ?auto_195457 ?auto_195461 ) ) ( ON ?auto_195463 ?auto_195457 ) ( CLEAR ?auto_195461 ) ( ON ?auto_195459 ?auto_195463 ) ( CLEAR ?auto_195459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195456 ?auto_195460 ?auto_195457 ?auto_195463 )
      ( MAKE-1PILE ?auto_195456 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195464 - BLOCK
    )
    :vars
    (
      ?auto_195469 - BLOCK
      ?auto_195468 - BLOCK
      ?auto_195467 - BLOCK
      ?auto_195466 - BLOCK
      ?auto_195470 - BLOCK
      ?auto_195465 - BLOCK
      ?auto_195471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195469 ?auto_195464 ) ( ON-TABLE ?auto_195464 ) ( not ( = ?auto_195464 ?auto_195469 ) ) ( not ( = ?auto_195464 ?auto_195468 ) ) ( not ( = ?auto_195464 ?auto_195467 ) ) ( not ( = ?auto_195469 ?auto_195468 ) ) ( not ( = ?auto_195469 ?auto_195467 ) ) ( not ( = ?auto_195468 ?auto_195467 ) ) ( ON ?auto_195468 ?auto_195469 ) ( ON-TABLE ?auto_195466 ) ( ON ?auto_195470 ?auto_195466 ) ( not ( = ?auto_195466 ?auto_195470 ) ) ( not ( = ?auto_195466 ?auto_195465 ) ) ( not ( = ?auto_195466 ?auto_195471 ) ) ( not ( = ?auto_195466 ?auto_195467 ) ) ( not ( = ?auto_195470 ?auto_195465 ) ) ( not ( = ?auto_195470 ?auto_195471 ) ) ( not ( = ?auto_195470 ?auto_195467 ) ) ( not ( = ?auto_195465 ?auto_195471 ) ) ( not ( = ?auto_195465 ?auto_195467 ) ) ( not ( = ?auto_195471 ?auto_195467 ) ) ( not ( = ?auto_195464 ?auto_195471 ) ) ( not ( = ?auto_195464 ?auto_195466 ) ) ( not ( = ?auto_195464 ?auto_195470 ) ) ( not ( = ?auto_195464 ?auto_195465 ) ) ( not ( = ?auto_195469 ?auto_195471 ) ) ( not ( = ?auto_195469 ?auto_195466 ) ) ( not ( = ?auto_195469 ?auto_195470 ) ) ( not ( = ?auto_195469 ?auto_195465 ) ) ( not ( = ?auto_195468 ?auto_195471 ) ) ( not ( = ?auto_195468 ?auto_195466 ) ) ( not ( = ?auto_195468 ?auto_195470 ) ) ( not ( = ?auto_195468 ?auto_195465 ) ) ( ON ?auto_195467 ?auto_195468 ) ( ON ?auto_195471 ?auto_195467 ) ( CLEAR ?auto_195471 ) ( HOLDING ?auto_195465 ) ( CLEAR ?auto_195470 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195466 ?auto_195470 ?auto_195465 )
      ( MAKE-1PILE ?auto_195464 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195472 - BLOCK
    )
    :vars
    (
      ?auto_195478 - BLOCK
      ?auto_195479 - BLOCK
      ?auto_195476 - BLOCK
      ?auto_195475 - BLOCK
      ?auto_195473 - BLOCK
      ?auto_195477 - BLOCK
      ?auto_195474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195478 ?auto_195472 ) ( ON-TABLE ?auto_195472 ) ( not ( = ?auto_195472 ?auto_195478 ) ) ( not ( = ?auto_195472 ?auto_195479 ) ) ( not ( = ?auto_195472 ?auto_195476 ) ) ( not ( = ?auto_195478 ?auto_195479 ) ) ( not ( = ?auto_195478 ?auto_195476 ) ) ( not ( = ?auto_195479 ?auto_195476 ) ) ( ON ?auto_195479 ?auto_195478 ) ( ON-TABLE ?auto_195475 ) ( ON ?auto_195473 ?auto_195475 ) ( not ( = ?auto_195475 ?auto_195473 ) ) ( not ( = ?auto_195475 ?auto_195477 ) ) ( not ( = ?auto_195475 ?auto_195474 ) ) ( not ( = ?auto_195475 ?auto_195476 ) ) ( not ( = ?auto_195473 ?auto_195477 ) ) ( not ( = ?auto_195473 ?auto_195474 ) ) ( not ( = ?auto_195473 ?auto_195476 ) ) ( not ( = ?auto_195477 ?auto_195474 ) ) ( not ( = ?auto_195477 ?auto_195476 ) ) ( not ( = ?auto_195474 ?auto_195476 ) ) ( not ( = ?auto_195472 ?auto_195474 ) ) ( not ( = ?auto_195472 ?auto_195475 ) ) ( not ( = ?auto_195472 ?auto_195473 ) ) ( not ( = ?auto_195472 ?auto_195477 ) ) ( not ( = ?auto_195478 ?auto_195474 ) ) ( not ( = ?auto_195478 ?auto_195475 ) ) ( not ( = ?auto_195478 ?auto_195473 ) ) ( not ( = ?auto_195478 ?auto_195477 ) ) ( not ( = ?auto_195479 ?auto_195474 ) ) ( not ( = ?auto_195479 ?auto_195475 ) ) ( not ( = ?auto_195479 ?auto_195473 ) ) ( not ( = ?auto_195479 ?auto_195477 ) ) ( ON ?auto_195476 ?auto_195479 ) ( ON ?auto_195474 ?auto_195476 ) ( CLEAR ?auto_195473 ) ( ON ?auto_195477 ?auto_195474 ) ( CLEAR ?auto_195477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195472 ?auto_195478 ?auto_195479 ?auto_195476 ?auto_195474 )
      ( MAKE-1PILE ?auto_195472 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195480 - BLOCK
    )
    :vars
    (
      ?auto_195485 - BLOCK
      ?auto_195486 - BLOCK
      ?auto_195487 - BLOCK
      ?auto_195481 - BLOCK
      ?auto_195483 - BLOCK
      ?auto_195482 - BLOCK
      ?auto_195484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195485 ?auto_195480 ) ( ON-TABLE ?auto_195480 ) ( not ( = ?auto_195480 ?auto_195485 ) ) ( not ( = ?auto_195480 ?auto_195486 ) ) ( not ( = ?auto_195480 ?auto_195487 ) ) ( not ( = ?auto_195485 ?auto_195486 ) ) ( not ( = ?auto_195485 ?auto_195487 ) ) ( not ( = ?auto_195486 ?auto_195487 ) ) ( ON ?auto_195486 ?auto_195485 ) ( ON-TABLE ?auto_195481 ) ( not ( = ?auto_195481 ?auto_195483 ) ) ( not ( = ?auto_195481 ?auto_195482 ) ) ( not ( = ?auto_195481 ?auto_195484 ) ) ( not ( = ?auto_195481 ?auto_195487 ) ) ( not ( = ?auto_195483 ?auto_195482 ) ) ( not ( = ?auto_195483 ?auto_195484 ) ) ( not ( = ?auto_195483 ?auto_195487 ) ) ( not ( = ?auto_195482 ?auto_195484 ) ) ( not ( = ?auto_195482 ?auto_195487 ) ) ( not ( = ?auto_195484 ?auto_195487 ) ) ( not ( = ?auto_195480 ?auto_195484 ) ) ( not ( = ?auto_195480 ?auto_195481 ) ) ( not ( = ?auto_195480 ?auto_195483 ) ) ( not ( = ?auto_195480 ?auto_195482 ) ) ( not ( = ?auto_195485 ?auto_195484 ) ) ( not ( = ?auto_195485 ?auto_195481 ) ) ( not ( = ?auto_195485 ?auto_195483 ) ) ( not ( = ?auto_195485 ?auto_195482 ) ) ( not ( = ?auto_195486 ?auto_195484 ) ) ( not ( = ?auto_195486 ?auto_195481 ) ) ( not ( = ?auto_195486 ?auto_195483 ) ) ( not ( = ?auto_195486 ?auto_195482 ) ) ( ON ?auto_195487 ?auto_195486 ) ( ON ?auto_195484 ?auto_195487 ) ( ON ?auto_195482 ?auto_195484 ) ( CLEAR ?auto_195482 ) ( HOLDING ?auto_195483 ) ( CLEAR ?auto_195481 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195481 ?auto_195483 )
      ( MAKE-1PILE ?auto_195480 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195488 - BLOCK
    )
    :vars
    (
      ?auto_195493 - BLOCK
      ?auto_195490 - BLOCK
      ?auto_195489 - BLOCK
      ?auto_195491 - BLOCK
      ?auto_195494 - BLOCK
      ?auto_195492 - BLOCK
      ?auto_195495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195493 ?auto_195488 ) ( ON-TABLE ?auto_195488 ) ( not ( = ?auto_195488 ?auto_195493 ) ) ( not ( = ?auto_195488 ?auto_195490 ) ) ( not ( = ?auto_195488 ?auto_195489 ) ) ( not ( = ?auto_195493 ?auto_195490 ) ) ( not ( = ?auto_195493 ?auto_195489 ) ) ( not ( = ?auto_195490 ?auto_195489 ) ) ( ON ?auto_195490 ?auto_195493 ) ( ON-TABLE ?auto_195491 ) ( not ( = ?auto_195491 ?auto_195494 ) ) ( not ( = ?auto_195491 ?auto_195492 ) ) ( not ( = ?auto_195491 ?auto_195495 ) ) ( not ( = ?auto_195491 ?auto_195489 ) ) ( not ( = ?auto_195494 ?auto_195492 ) ) ( not ( = ?auto_195494 ?auto_195495 ) ) ( not ( = ?auto_195494 ?auto_195489 ) ) ( not ( = ?auto_195492 ?auto_195495 ) ) ( not ( = ?auto_195492 ?auto_195489 ) ) ( not ( = ?auto_195495 ?auto_195489 ) ) ( not ( = ?auto_195488 ?auto_195495 ) ) ( not ( = ?auto_195488 ?auto_195491 ) ) ( not ( = ?auto_195488 ?auto_195494 ) ) ( not ( = ?auto_195488 ?auto_195492 ) ) ( not ( = ?auto_195493 ?auto_195495 ) ) ( not ( = ?auto_195493 ?auto_195491 ) ) ( not ( = ?auto_195493 ?auto_195494 ) ) ( not ( = ?auto_195493 ?auto_195492 ) ) ( not ( = ?auto_195490 ?auto_195495 ) ) ( not ( = ?auto_195490 ?auto_195491 ) ) ( not ( = ?auto_195490 ?auto_195494 ) ) ( not ( = ?auto_195490 ?auto_195492 ) ) ( ON ?auto_195489 ?auto_195490 ) ( ON ?auto_195495 ?auto_195489 ) ( ON ?auto_195492 ?auto_195495 ) ( CLEAR ?auto_195491 ) ( ON ?auto_195494 ?auto_195492 ) ( CLEAR ?auto_195494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195488 ?auto_195493 ?auto_195490 ?auto_195489 ?auto_195495 ?auto_195492 )
      ( MAKE-1PILE ?auto_195488 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195496 - BLOCK
    )
    :vars
    (
      ?auto_195498 - BLOCK
      ?auto_195497 - BLOCK
      ?auto_195502 - BLOCK
      ?auto_195500 - BLOCK
      ?auto_195503 - BLOCK
      ?auto_195499 - BLOCK
      ?auto_195501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195498 ?auto_195496 ) ( ON-TABLE ?auto_195496 ) ( not ( = ?auto_195496 ?auto_195498 ) ) ( not ( = ?auto_195496 ?auto_195497 ) ) ( not ( = ?auto_195496 ?auto_195502 ) ) ( not ( = ?auto_195498 ?auto_195497 ) ) ( not ( = ?auto_195498 ?auto_195502 ) ) ( not ( = ?auto_195497 ?auto_195502 ) ) ( ON ?auto_195497 ?auto_195498 ) ( not ( = ?auto_195500 ?auto_195503 ) ) ( not ( = ?auto_195500 ?auto_195499 ) ) ( not ( = ?auto_195500 ?auto_195501 ) ) ( not ( = ?auto_195500 ?auto_195502 ) ) ( not ( = ?auto_195503 ?auto_195499 ) ) ( not ( = ?auto_195503 ?auto_195501 ) ) ( not ( = ?auto_195503 ?auto_195502 ) ) ( not ( = ?auto_195499 ?auto_195501 ) ) ( not ( = ?auto_195499 ?auto_195502 ) ) ( not ( = ?auto_195501 ?auto_195502 ) ) ( not ( = ?auto_195496 ?auto_195501 ) ) ( not ( = ?auto_195496 ?auto_195500 ) ) ( not ( = ?auto_195496 ?auto_195503 ) ) ( not ( = ?auto_195496 ?auto_195499 ) ) ( not ( = ?auto_195498 ?auto_195501 ) ) ( not ( = ?auto_195498 ?auto_195500 ) ) ( not ( = ?auto_195498 ?auto_195503 ) ) ( not ( = ?auto_195498 ?auto_195499 ) ) ( not ( = ?auto_195497 ?auto_195501 ) ) ( not ( = ?auto_195497 ?auto_195500 ) ) ( not ( = ?auto_195497 ?auto_195503 ) ) ( not ( = ?auto_195497 ?auto_195499 ) ) ( ON ?auto_195502 ?auto_195497 ) ( ON ?auto_195501 ?auto_195502 ) ( ON ?auto_195499 ?auto_195501 ) ( ON ?auto_195503 ?auto_195499 ) ( CLEAR ?auto_195503 ) ( HOLDING ?auto_195500 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_195500 )
      ( MAKE-1PILE ?auto_195496 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195504 - BLOCK
    )
    :vars
    (
      ?auto_195507 - BLOCK
      ?auto_195505 - BLOCK
      ?auto_195506 - BLOCK
      ?auto_195510 - BLOCK
      ?auto_195508 - BLOCK
      ?auto_195511 - BLOCK
      ?auto_195509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195507 ?auto_195504 ) ( ON-TABLE ?auto_195504 ) ( not ( = ?auto_195504 ?auto_195507 ) ) ( not ( = ?auto_195504 ?auto_195505 ) ) ( not ( = ?auto_195504 ?auto_195506 ) ) ( not ( = ?auto_195507 ?auto_195505 ) ) ( not ( = ?auto_195507 ?auto_195506 ) ) ( not ( = ?auto_195505 ?auto_195506 ) ) ( ON ?auto_195505 ?auto_195507 ) ( not ( = ?auto_195510 ?auto_195508 ) ) ( not ( = ?auto_195510 ?auto_195511 ) ) ( not ( = ?auto_195510 ?auto_195509 ) ) ( not ( = ?auto_195510 ?auto_195506 ) ) ( not ( = ?auto_195508 ?auto_195511 ) ) ( not ( = ?auto_195508 ?auto_195509 ) ) ( not ( = ?auto_195508 ?auto_195506 ) ) ( not ( = ?auto_195511 ?auto_195509 ) ) ( not ( = ?auto_195511 ?auto_195506 ) ) ( not ( = ?auto_195509 ?auto_195506 ) ) ( not ( = ?auto_195504 ?auto_195509 ) ) ( not ( = ?auto_195504 ?auto_195510 ) ) ( not ( = ?auto_195504 ?auto_195508 ) ) ( not ( = ?auto_195504 ?auto_195511 ) ) ( not ( = ?auto_195507 ?auto_195509 ) ) ( not ( = ?auto_195507 ?auto_195510 ) ) ( not ( = ?auto_195507 ?auto_195508 ) ) ( not ( = ?auto_195507 ?auto_195511 ) ) ( not ( = ?auto_195505 ?auto_195509 ) ) ( not ( = ?auto_195505 ?auto_195510 ) ) ( not ( = ?auto_195505 ?auto_195508 ) ) ( not ( = ?auto_195505 ?auto_195511 ) ) ( ON ?auto_195506 ?auto_195505 ) ( ON ?auto_195509 ?auto_195506 ) ( ON ?auto_195511 ?auto_195509 ) ( ON ?auto_195508 ?auto_195511 ) ( ON ?auto_195510 ?auto_195508 ) ( CLEAR ?auto_195510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195504 ?auto_195507 ?auto_195505 ?auto_195506 ?auto_195509 ?auto_195511 ?auto_195508 )
      ( MAKE-1PILE ?auto_195504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195512 - BLOCK
    )
    :vars
    (
      ?auto_195516 - BLOCK
      ?auto_195514 - BLOCK
      ?auto_195519 - BLOCK
      ?auto_195517 - BLOCK
      ?auto_195518 - BLOCK
      ?auto_195513 - BLOCK
      ?auto_195515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195516 ?auto_195512 ) ( ON-TABLE ?auto_195512 ) ( not ( = ?auto_195512 ?auto_195516 ) ) ( not ( = ?auto_195512 ?auto_195514 ) ) ( not ( = ?auto_195512 ?auto_195519 ) ) ( not ( = ?auto_195516 ?auto_195514 ) ) ( not ( = ?auto_195516 ?auto_195519 ) ) ( not ( = ?auto_195514 ?auto_195519 ) ) ( ON ?auto_195514 ?auto_195516 ) ( not ( = ?auto_195517 ?auto_195518 ) ) ( not ( = ?auto_195517 ?auto_195513 ) ) ( not ( = ?auto_195517 ?auto_195515 ) ) ( not ( = ?auto_195517 ?auto_195519 ) ) ( not ( = ?auto_195518 ?auto_195513 ) ) ( not ( = ?auto_195518 ?auto_195515 ) ) ( not ( = ?auto_195518 ?auto_195519 ) ) ( not ( = ?auto_195513 ?auto_195515 ) ) ( not ( = ?auto_195513 ?auto_195519 ) ) ( not ( = ?auto_195515 ?auto_195519 ) ) ( not ( = ?auto_195512 ?auto_195515 ) ) ( not ( = ?auto_195512 ?auto_195517 ) ) ( not ( = ?auto_195512 ?auto_195518 ) ) ( not ( = ?auto_195512 ?auto_195513 ) ) ( not ( = ?auto_195516 ?auto_195515 ) ) ( not ( = ?auto_195516 ?auto_195517 ) ) ( not ( = ?auto_195516 ?auto_195518 ) ) ( not ( = ?auto_195516 ?auto_195513 ) ) ( not ( = ?auto_195514 ?auto_195515 ) ) ( not ( = ?auto_195514 ?auto_195517 ) ) ( not ( = ?auto_195514 ?auto_195518 ) ) ( not ( = ?auto_195514 ?auto_195513 ) ) ( ON ?auto_195519 ?auto_195514 ) ( ON ?auto_195515 ?auto_195519 ) ( ON ?auto_195513 ?auto_195515 ) ( ON ?auto_195518 ?auto_195513 ) ( HOLDING ?auto_195517 ) ( CLEAR ?auto_195518 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_195512 ?auto_195516 ?auto_195514 ?auto_195519 ?auto_195515 ?auto_195513 ?auto_195518 ?auto_195517 )
      ( MAKE-1PILE ?auto_195512 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195520 - BLOCK
    )
    :vars
    (
      ?auto_195521 - BLOCK
      ?auto_195526 - BLOCK
      ?auto_195522 - BLOCK
      ?auto_195523 - BLOCK
      ?auto_195524 - BLOCK
      ?auto_195525 - BLOCK
      ?auto_195527 - BLOCK
      ?auto_195528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195521 ?auto_195520 ) ( ON-TABLE ?auto_195520 ) ( not ( = ?auto_195520 ?auto_195521 ) ) ( not ( = ?auto_195520 ?auto_195526 ) ) ( not ( = ?auto_195520 ?auto_195522 ) ) ( not ( = ?auto_195521 ?auto_195526 ) ) ( not ( = ?auto_195521 ?auto_195522 ) ) ( not ( = ?auto_195526 ?auto_195522 ) ) ( ON ?auto_195526 ?auto_195521 ) ( not ( = ?auto_195523 ?auto_195524 ) ) ( not ( = ?auto_195523 ?auto_195525 ) ) ( not ( = ?auto_195523 ?auto_195527 ) ) ( not ( = ?auto_195523 ?auto_195522 ) ) ( not ( = ?auto_195524 ?auto_195525 ) ) ( not ( = ?auto_195524 ?auto_195527 ) ) ( not ( = ?auto_195524 ?auto_195522 ) ) ( not ( = ?auto_195525 ?auto_195527 ) ) ( not ( = ?auto_195525 ?auto_195522 ) ) ( not ( = ?auto_195527 ?auto_195522 ) ) ( not ( = ?auto_195520 ?auto_195527 ) ) ( not ( = ?auto_195520 ?auto_195523 ) ) ( not ( = ?auto_195520 ?auto_195524 ) ) ( not ( = ?auto_195520 ?auto_195525 ) ) ( not ( = ?auto_195521 ?auto_195527 ) ) ( not ( = ?auto_195521 ?auto_195523 ) ) ( not ( = ?auto_195521 ?auto_195524 ) ) ( not ( = ?auto_195521 ?auto_195525 ) ) ( not ( = ?auto_195526 ?auto_195527 ) ) ( not ( = ?auto_195526 ?auto_195523 ) ) ( not ( = ?auto_195526 ?auto_195524 ) ) ( not ( = ?auto_195526 ?auto_195525 ) ) ( ON ?auto_195522 ?auto_195526 ) ( ON ?auto_195527 ?auto_195522 ) ( ON ?auto_195525 ?auto_195527 ) ( ON ?auto_195524 ?auto_195525 ) ( CLEAR ?auto_195524 ) ( ON ?auto_195523 ?auto_195528 ) ( CLEAR ?auto_195523 ) ( HAND-EMPTY ) ( not ( = ?auto_195520 ?auto_195528 ) ) ( not ( = ?auto_195521 ?auto_195528 ) ) ( not ( = ?auto_195526 ?auto_195528 ) ) ( not ( = ?auto_195522 ?auto_195528 ) ) ( not ( = ?auto_195523 ?auto_195528 ) ) ( not ( = ?auto_195524 ?auto_195528 ) ) ( not ( = ?auto_195525 ?auto_195528 ) ) ( not ( = ?auto_195527 ?auto_195528 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195523 ?auto_195528 )
      ( MAKE-1PILE ?auto_195520 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195529 - BLOCK
    )
    :vars
    (
      ?auto_195530 - BLOCK
      ?auto_195532 - BLOCK
      ?auto_195531 - BLOCK
      ?auto_195534 - BLOCK
      ?auto_195533 - BLOCK
      ?auto_195535 - BLOCK
      ?auto_195536 - BLOCK
      ?auto_195537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195530 ?auto_195529 ) ( ON-TABLE ?auto_195529 ) ( not ( = ?auto_195529 ?auto_195530 ) ) ( not ( = ?auto_195529 ?auto_195532 ) ) ( not ( = ?auto_195529 ?auto_195531 ) ) ( not ( = ?auto_195530 ?auto_195532 ) ) ( not ( = ?auto_195530 ?auto_195531 ) ) ( not ( = ?auto_195532 ?auto_195531 ) ) ( ON ?auto_195532 ?auto_195530 ) ( not ( = ?auto_195534 ?auto_195533 ) ) ( not ( = ?auto_195534 ?auto_195535 ) ) ( not ( = ?auto_195534 ?auto_195536 ) ) ( not ( = ?auto_195534 ?auto_195531 ) ) ( not ( = ?auto_195533 ?auto_195535 ) ) ( not ( = ?auto_195533 ?auto_195536 ) ) ( not ( = ?auto_195533 ?auto_195531 ) ) ( not ( = ?auto_195535 ?auto_195536 ) ) ( not ( = ?auto_195535 ?auto_195531 ) ) ( not ( = ?auto_195536 ?auto_195531 ) ) ( not ( = ?auto_195529 ?auto_195536 ) ) ( not ( = ?auto_195529 ?auto_195534 ) ) ( not ( = ?auto_195529 ?auto_195533 ) ) ( not ( = ?auto_195529 ?auto_195535 ) ) ( not ( = ?auto_195530 ?auto_195536 ) ) ( not ( = ?auto_195530 ?auto_195534 ) ) ( not ( = ?auto_195530 ?auto_195533 ) ) ( not ( = ?auto_195530 ?auto_195535 ) ) ( not ( = ?auto_195532 ?auto_195536 ) ) ( not ( = ?auto_195532 ?auto_195534 ) ) ( not ( = ?auto_195532 ?auto_195533 ) ) ( not ( = ?auto_195532 ?auto_195535 ) ) ( ON ?auto_195531 ?auto_195532 ) ( ON ?auto_195536 ?auto_195531 ) ( ON ?auto_195535 ?auto_195536 ) ( ON ?auto_195534 ?auto_195537 ) ( CLEAR ?auto_195534 ) ( not ( = ?auto_195529 ?auto_195537 ) ) ( not ( = ?auto_195530 ?auto_195537 ) ) ( not ( = ?auto_195532 ?auto_195537 ) ) ( not ( = ?auto_195531 ?auto_195537 ) ) ( not ( = ?auto_195534 ?auto_195537 ) ) ( not ( = ?auto_195533 ?auto_195537 ) ) ( not ( = ?auto_195535 ?auto_195537 ) ) ( not ( = ?auto_195536 ?auto_195537 ) ) ( HOLDING ?auto_195533 ) ( CLEAR ?auto_195535 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195529 ?auto_195530 ?auto_195532 ?auto_195531 ?auto_195536 ?auto_195535 ?auto_195533 )
      ( MAKE-1PILE ?auto_195529 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195538 - BLOCK
    )
    :vars
    (
      ?auto_195542 - BLOCK
      ?auto_195541 - BLOCK
      ?auto_195539 - BLOCK
      ?auto_195543 - BLOCK
      ?auto_195545 - BLOCK
      ?auto_195546 - BLOCK
      ?auto_195544 - BLOCK
      ?auto_195540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195542 ?auto_195538 ) ( ON-TABLE ?auto_195538 ) ( not ( = ?auto_195538 ?auto_195542 ) ) ( not ( = ?auto_195538 ?auto_195541 ) ) ( not ( = ?auto_195538 ?auto_195539 ) ) ( not ( = ?auto_195542 ?auto_195541 ) ) ( not ( = ?auto_195542 ?auto_195539 ) ) ( not ( = ?auto_195541 ?auto_195539 ) ) ( ON ?auto_195541 ?auto_195542 ) ( not ( = ?auto_195543 ?auto_195545 ) ) ( not ( = ?auto_195543 ?auto_195546 ) ) ( not ( = ?auto_195543 ?auto_195544 ) ) ( not ( = ?auto_195543 ?auto_195539 ) ) ( not ( = ?auto_195545 ?auto_195546 ) ) ( not ( = ?auto_195545 ?auto_195544 ) ) ( not ( = ?auto_195545 ?auto_195539 ) ) ( not ( = ?auto_195546 ?auto_195544 ) ) ( not ( = ?auto_195546 ?auto_195539 ) ) ( not ( = ?auto_195544 ?auto_195539 ) ) ( not ( = ?auto_195538 ?auto_195544 ) ) ( not ( = ?auto_195538 ?auto_195543 ) ) ( not ( = ?auto_195538 ?auto_195545 ) ) ( not ( = ?auto_195538 ?auto_195546 ) ) ( not ( = ?auto_195542 ?auto_195544 ) ) ( not ( = ?auto_195542 ?auto_195543 ) ) ( not ( = ?auto_195542 ?auto_195545 ) ) ( not ( = ?auto_195542 ?auto_195546 ) ) ( not ( = ?auto_195541 ?auto_195544 ) ) ( not ( = ?auto_195541 ?auto_195543 ) ) ( not ( = ?auto_195541 ?auto_195545 ) ) ( not ( = ?auto_195541 ?auto_195546 ) ) ( ON ?auto_195539 ?auto_195541 ) ( ON ?auto_195544 ?auto_195539 ) ( ON ?auto_195546 ?auto_195544 ) ( ON ?auto_195543 ?auto_195540 ) ( not ( = ?auto_195538 ?auto_195540 ) ) ( not ( = ?auto_195542 ?auto_195540 ) ) ( not ( = ?auto_195541 ?auto_195540 ) ) ( not ( = ?auto_195539 ?auto_195540 ) ) ( not ( = ?auto_195543 ?auto_195540 ) ) ( not ( = ?auto_195545 ?auto_195540 ) ) ( not ( = ?auto_195546 ?auto_195540 ) ) ( not ( = ?auto_195544 ?auto_195540 ) ) ( CLEAR ?auto_195546 ) ( ON ?auto_195545 ?auto_195543 ) ( CLEAR ?auto_195545 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_195540 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195540 ?auto_195543 )
      ( MAKE-1PILE ?auto_195538 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195547 - BLOCK
    )
    :vars
    (
      ?auto_195548 - BLOCK
      ?auto_195549 - BLOCK
      ?auto_195554 - BLOCK
      ?auto_195553 - BLOCK
      ?auto_195555 - BLOCK
      ?auto_195552 - BLOCK
      ?auto_195551 - BLOCK
      ?auto_195550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195548 ?auto_195547 ) ( ON-TABLE ?auto_195547 ) ( not ( = ?auto_195547 ?auto_195548 ) ) ( not ( = ?auto_195547 ?auto_195549 ) ) ( not ( = ?auto_195547 ?auto_195554 ) ) ( not ( = ?auto_195548 ?auto_195549 ) ) ( not ( = ?auto_195548 ?auto_195554 ) ) ( not ( = ?auto_195549 ?auto_195554 ) ) ( ON ?auto_195549 ?auto_195548 ) ( not ( = ?auto_195553 ?auto_195555 ) ) ( not ( = ?auto_195553 ?auto_195552 ) ) ( not ( = ?auto_195553 ?auto_195551 ) ) ( not ( = ?auto_195553 ?auto_195554 ) ) ( not ( = ?auto_195555 ?auto_195552 ) ) ( not ( = ?auto_195555 ?auto_195551 ) ) ( not ( = ?auto_195555 ?auto_195554 ) ) ( not ( = ?auto_195552 ?auto_195551 ) ) ( not ( = ?auto_195552 ?auto_195554 ) ) ( not ( = ?auto_195551 ?auto_195554 ) ) ( not ( = ?auto_195547 ?auto_195551 ) ) ( not ( = ?auto_195547 ?auto_195553 ) ) ( not ( = ?auto_195547 ?auto_195555 ) ) ( not ( = ?auto_195547 ?auto_195552 ) ) ( not ( = ?auto_195548 ?auto_195551 ) ) ( not ( = ?auto_195548 ?auto_195553 ) ) ( not ( = ?auto_195548 ?auto_195555 ) ) ( not ( = ?auto_195548 ?auto_195552 ) ) ( not ( = ?auto_195549 ?auto_195551 ) ) ( not ( = ?auto_195549 ?auto_195553 ) ) ( not ( = ?auto_195549 ?auto_195555 ) ) ( not ( = ?auto_195549 ?auto_195552 ) ) ( ON ?auto_195554 ?auto_195549 ) ( ON ?auto_195551 ?auto_195554 ) ( ON ?auto_195553 ?auto_195550 ) ( not ( = ?auto_195547 ?auto_195550 ) ) ( not ( = ?auto_195548 ?auto_195550 ) ) ( not ( = ?auto_195549 ?auto_195550 ) ) ( not ( = ?auto_195554 ?auto_195550 ) ) ( not ( = ?auto_195553 ?auto_195550 ) ) ( not ( = ?auto_195555 ?auto_195550 ) ) ( not ( = ?auto_195552 ?auto_195550 ) ) ( not ( = ?auto_195551 ?auto_195550 ) ) ( ON ?auto_195555 ?auto_195553 ) ( CLEAR ?auto_195555 ) ( ON-TABLE ?auto_195550 ) ( HOLDING ?auto_195552 ) ( CLEAR ?auto_195551 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195547 ?auto_195548 ?auto_195549 ?auto_195554 ?auto_195551 ?auto_195552 )
      ( MAKE-1PILE ?auto_195547 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195556 - BLOCK
    )
    :vars
    (
      ?auto_195560 - BLOCK
      ?auto_195564 - BLOCK
      ?auto_195562 - BLOCK
      ?auto_195561 - BLOCK
      ?auto_195559 - BLOCK
      ?auto_195563 - BLOCK
      ?auto_195558 - BLOCK
      ?auto_195557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195560 ?auto_195556 ) ( ON-TABLE ?auto_195556 ) ( not ( = ?auto_195556 ?auto_195560 ) ) ( not ( = ?auto_195556 ?auto_195564 ) ) ( not ( = ?auto_195556 ?auto_195562 ) ) ( not ( = ?auto_195560 ?auto_195564 ) ) ( not ( = ?auto_195560 ?auto_195562 ) ) ( not ( = ?auto_195564 ?auto_195562 ) ) ( ON ?auto_195564 ?auto_195560 ) ( not ( = ?auto_195561 ?auto_195559 ) ) ( not ( = ?auto_195561 ?auto_195563 ) ) ( not ( = ?auto_195561 ?auto_195558 ) ) ( not ( = ?auto_195561 ?auto_195562 ) ) ( not ( = ?auto_195559 ?auto_195563 ) ) ( not ( = ?auto_195559 ?auto_195558 ) ) ( not ( = ?auto_195559 ?auto_195562 ) ) ( not ( = ?auto_195563 ?auto_195558 ) ) ( not ( = ?auto_195563 ?auto_195562 ) ) ( not ( = ?auto_195558 ?auto_195562 ) ) ( not ( = ?auto_195556 ?auto_195558 ) ) ( not ( = ?auto_195556 ?auto_195561 ) ) ( not ( = ?auto_195556 ?auto_195559 ) ) ( not ( = ?auto_195556 ?auto_195563 ) ) ( not ( = ?auto_195560 ?auto_195558 ) ) ( not ( = ?auto_195560 ?auto_195561 ) ) ( not ( = ?auto_195560 ?auto_195559 ) ) ( not ( = ?auto_195560 ?auto_195563 ) ) ( not ( = ?auto_195564 ?auto_195558 ) ) ( not ( = ?auto_195564 ?auto_195561 ) ) ( not ( = ?auto_195564 ?auto_195559 ) ) ( not ( = ?auto_195564 ?auto_195563 ) ) ( ON ?auto_195562 ?auto_195564 ) ( ON ?auto_195558 ?auto_195562 ) ( ON ?auto_195561 ?auto_195557 ) ( not ( = ?auto_195556 ?auto_195557 ) ) ( not ( = ?auto_195560 ?auto_195557 ) ) ( not ( = ?auto_195564 ?auto_195557 ) ) ( not ( = ?auto_195562 ?auto_195557 ) ) ( not ( = ?auto_195561 ?auto_195557 ) ) ( not ( = ?auto_195559 ?auto_195557 ) ) ( not ( = ?auto_195563 ?auto_195557 ) ) ( not ( = ?auto_195558 ?auto_195557 ) ) ( ON ?auto_195559 ?auto_195561 ) ( ON-TABLE ?auto_195557 ) ( CLEAR ?auto_195558 ) ( ON ?auto_195563 ?auto_195559 ) ( CLEAR ?auto_195563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195557 ?auto_195561 ?auto_195559 )
      ( MAKE-1PILE ?auto_195556 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195565 - BLOCK
    )
    :vars
    (
      ?auto_195567 - BLOCK
      ?auto_195570 - BLOCK
      ?auto_195571 - BLOCK
      ?auto_195566 - BLOCK
      ?auto_195572 - BLOCK
      ?auto_195569 - BLOCK
      ?auto_195573 - BLOCK
      ?auto_195568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195567 ?auto_195565 ) ( ON-TABLE ?auto_195565 ) ( not ( = ?auto_195565 ?auto_195567 ) ) ( not ( = ?auto_195565 ?auto_195570 ) ) ( not ( = ?auto_195565 ?auto_195571 ) ) ( not ( = ?auto_195567 ?auto_195570 ) ) ( not ( = ?auto_195567 ?auto_195571 ) ) ( not ( = ?auto_195570 ?auto_195571 ) ) ( ON ?auto_195570 ?auto_195567 ) ( not ( = ?auto_195566 ?auto_195572 ) ) ( not ( = ?auto_195566 ?auto_195569 ) ) ( not ( = ?auto_195566 ?auto_195573 ) ) ( not ( = ?auto_195566 ?auto_195571 ) ) ( not ( = ?auto_195572 ?auto_195569 ) ) ( not ( = ?auto_195572 ?auto_195573 ) ) ( not ( = ?auto_195572 ?auto_195571 ) ) ( not ( = ?auto_195569 ?auto_195573 ) ) ( not ( = ?auto_195569 ?auto_195571 ) ) ( not ( = ?auto_195573 ?auto_195571 ) ) ( not ( = ?auto_195565 ?auto_195573 ) ) ( not ( = ?auto_195565 ?auto_195566 ) ) ( not ( = ?auto_195565 ?auto_195572 ) ) ( not ( = ?auto_195565 ?auto_195569 ) ) ( not ( = ?auto_195567 ?auto_195573 ) ) ( not ( = ?auto_195567 ?auto_195566 ) ) ( not ( = ?auto_195567 ?auto_195572 ) ) ( not ( = ?auto_195567 ?auto_195569 ) ) ( not ( = ?auto_195570 ?auto_195573 ) ) ( not ( = ?auto_195570 ?auto_195566 ) ) ( not ( = ?auto_195570 ?auto_195572 ) ) ( not ( = ?auto_195570 ?auto_195569 ) ) ( ON ?auto_195571 ?auto_195570 ) ( ON ?auto_195566 ?auto_195568 ) ( not ( = ?auto_195565 ?auto_195568 ) ) ( not ( = ?auto_195567 ?auto_195568 ) ) ( not ( = ?auto_195570 ?auto_195568 ) ) ( not ( = ?auto_195571 ?auto_195568 ) ) ( not ( = ?auto_195566 ?auto_195568 ) ) ( not ( = ?auto_195572 ?auto_195568 ) ) ( not ( = ?auto_195569 ?auto_195568 ) ) ( not ( = ?auto_195573 ?auto_195568 ) ) ( ON ?auto_195572 ?auto_195566 ) ( ON-TABLE ?auto_195568 ) ( ON ?auto_195569 ?auto_195572 ) ( CLEAR ?auto_195569 ) ( HOLDING ?auto_195573 ) ( CLEAR ?auto_195571 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195565 ?auto_195567 ?auto_195570 ?auto_195571 ?auto_195573 )
      ( MAKE-1PILE ?auto_195565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195574 - BLOCK
    )
    :vars
    (
      ?auto_195576 - BLOCK
      ?auto_195582 - BLOCK
      ?auto_195575 - BLOCK
      ?auto_195580 - BLOCK
      ?auto_195577 - BLOCK
      ?auto_195581 - BLOCK
      ?auto_195579 - BLOCK
      ?auto_195578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195576 ?auto_195574 ) ( ON-TABLE ?auto_195574 ) ( not ( = ?auto_195574 ?auto_195576 ) ) ( not ( = ?auto_195574 ?auto_195582 ) ) ( not ( = ?auto_195574 ?auto_195575 ) ) ( not ( = ?auto_195576 ?auto_195582 ) ) ( not ( = ?auto_195576 ?auto_195575 ) ) ( not ( = ?auto_195582 ?auto_195575 ) ) ( ON ?auto_195582 ?auto_195576 ) ( not ( = ?auto_195580 ?auto_195577 ) ) ( not ( = ?auto_195580 ?auto_195581 ) ) ( not ( = ?auto_195580 ?auto_195579 ) ) ( not ( = ?auto_195580 ?auto_195575 ) ) ( not ( = ?auto_195577 ?auto_195581 ) ) ( not ( = ?auto_195577 ?auto_195579 ) ) ( not ( = ?auto_195577 ?auto_195575 ) ) ( not ( = ?auto_195581 ?auto_195579 ) ) ( not ( = ?auto_195581 ?auto_195575 ) ) ( not ( = ?auto_195579 ?auto_195575 ) ) ( not ( = ?auto_195574 ?auto_195579 ) ) ( not ( = ?auto_195574 ?auto_195580 ) ) ( not ( = ?auto_195574 ?auto_195577 ) ) ( not ( = ?auto_195574 ?auto_195581 ) ) ( not ( = ?auto_195576 ?auto_195579 ) ) ( not ( = ?auto_195576 ?auto_195580 ) ) ( not ( = ?auto_195576 ?auto_195577 ) ) ( not ( = ?auto_195576 ?auto_195581 ) ) ( not ( = ?auto_195582 ?auto_195579 ) ) ( not ( = ?auto_195582 ?auto_195580 ) ) ( not ( = ?auto_195582 ?auto_195577 ) ) ( not ( = ?auto_195582 ?auto_195581 ) ) ( ON ?auto_195575 ?auto_195582 ) ( ON ?auto_195580 ?auto_195578 ) ( not ( = ?auto_195574 ?auto_195578 ) ) ( not ( = ?auto_195576 ?auto_195578 ) ) ( not ( = ?auto_195582 ?auto_195578 ) ) ( not ( = ?auto_195575 ?auto_195578 ) ) ( not ( = ?auto_195580 ?auto_195578 ) ) ( not ( = ?auto_195577 ?auto_195578 ) ) ( not ( = ?auto_195581 ?auto_195578 ) ) ( not ( = ?auto_195579 ?auto_195578 ) ) ( ON ?auto_195577 ?auto_195580 ) ( ON-TABLE ?auto_195578 ) ( ON ?auto_195581 ?auto_195577 ) ( CLEAR ?auto_195575 ) ( ON ?auto_195579 ?auto_195581 ) ( CLEAR ?auto_195579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195578 ?auto_195580 ?auto_195577 ?auto_195581 )
      ( MAKE-1PILE ?auto_195574 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195583 - BLOCK
    )
    :vars
    (
      ?auto_195585 - BLOCK
      ?auto_195590 - BLOCK
      ?auto_195591 - BLOCK
      ?auto_195588 - BLOCK
      ?auto_195587 - BLOCK
      ?auto_195589 - BLOCK
      ?auto_195586 - BLOCK
      ?auto_195584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195585 ?auto_195583 ) ( ON-TABLE ?auto_195583 ) ( not ( = ?auto_195583 ?auto_195585 ) ) ( not ( = ?auto_195583 ?auto_195590 ) ) ( not ( = ?auto_195583 ?auto_195591 ) ) ( not ( = ?auto_195585 ?auto_195590 ) ) ( not ( = ?auto_195585 ?auto_195591 ) ) ( not ( = ?auto_195590 ?auto_195591 ) ) ( ON ?auto_195590 ?auto_195585 ) ( not ( = ?auto_195588 ?auto_195587 ) ) ( not ( = ?auto_195588 ?auto_195589 ) ) ( not ( = ?auto_195588 ?auto_195586 ) ) ( not ( = ?auto_195588 ?auto_195591 ) ) ( not ( = ?auto_195587 ?auto_195589 ) ) ( not ( = ?auto_195587 ?auto_195586 ) ) ( not ( = ?auto_195587 ?auto_195591 ) ) ( not ( = ?auto_195589 ?auto_195586 ) ) ( not ( = ?auto_195589 ?auto_195591 ) ) ( not ( = ?auto_195586 ?auto_195591 ) ) ( not ( = ?auto_195583 ?auto_195586 ) ) ( not ( = ?auto_195583 ?auto_195588 ) ) ( not ( = ?auto_195583 ?auto_195587 ) ) ( not ( = ?auto_195583 ?auto_195589 ) ) ( not ( = ?auto_195585 ?auto_195586 ) ) ( not ( = ?auto_195585 ?auto_195588 ) ) ( not ( = ?auto_195585 ?auto_195587 ) ) ( not ( = ?auto_195585 ?auto_195589 ) ) ( not ( = ?auto_195590 ?auto_195586 ) ) ( not ( = ?auto_195590 ?auto_195588 ) ) ( not ( = ?auto_195590 ?auto_195587 ) ) ( not ( = ?auto_195590 ?auto_195589 ) ) ( ON ?auto_195588 ?auto_195584 ) ( not ( = ?auto_195583 ?auto_195584 ) ) ( not ( = ?auto_195585 ?auto_195584 ) ) ( not ( = ?auto_195590 ?auto_195584 ) ) ( not ( = ?auto_195591 ?auto_195584 ) ) ( not ( = ?auto_195588 ?auto_195584 ) ) ( not ( = ?auto_195587 ?auto_195584 ) ) ( not ( = ?auto_195589 ?auto_195584 ) ) ( not ( = ?auto_195586 ?auto_195584 ) ) ( ON ?auto_195587 ?auto_195588 ) ( ON-TABLE ?auto_195584 ) ( ON ?auto_195589 ?auto_195587 ) ( ON ?auto_195586 ?auto_195589 ) ( CLEAR ?auto_195586 ) ( HOLDING ?auto_195591 ) ( CLEAR ?auto_195590 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195583 ?auto_195585 ?auto_195590 ?auto_195591 )
      ( MAKE-1PILE ?auto_195583 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195592 - BLOCK
    )
    :vars
    (
      ?auto_195594 - BLOCK
      ?auto_195598 - BLOCK
      ?auto_195600 - BLOCK
      ?auto_195599 - BLOCK
      ?auto_195595 - BLOCK
      ?auto_195597 - BLOCK
      ?auto_195596 - BLOCK
      ?auto_195593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195594 ?auto_195592 ) ( ON-TABLE ?auto_195592 ) ( not ( = ?auto_195592 ?auto_195594 ) ) ( not ( = ?auto_195592 ?auto_195598 ) ) ( not ( = ?auto_195592 ?auto_195600 ) ) ( not ( = ?auto_195594 ?auto_195598 ) ) ( not ( = ?auto_195594 ?auto_195600 ) ) ( not ( = ?auto_195598 ?auto_195600 ) ) ( ON ?auto_195598 ?auto_195594 ) ( not ( = ?auto_195599 ?auto_195595 ) ) ( not ( = ?auto_195599 ?auto_195597 ) ) ( not ( = ?auto_195599 ?auto_195596 ) ) ( not ( = ?auto_195599 ?auto_195600 ) ) ( not ( = ?auto_195595 ?auto_195597 ) ) ( not ( = ?auto_195595 ?auto_195596 ) ) ( not ( = ?auto_195595 ?auto_195600 ) ) ( not ( = ?auto_195597 ?auto_195596 ) ) ( not ( = ?auto_195597 ?auto_195600 ) ) ( not ( = ?auto_195596 ?auto_195600 ) ) ( not ( = ?auto_195592 ?auto_195596 ) ) ( not ( = ?auto_195592 ?auto_195599 ) ) ( not ( = ?auto_195592 ?auto_195595 ) ) ( not ( = ?auto_195592 ?auto_195597 ) ) ( not ( = ?auto_195594 ?auto_195596 ) ) ( not ( = ?auto_195594 ?auto_195599 ) ) ( not ( = ?auto_195594 ?auto_195595 ) ) ( not ( = ?auto_195594 ?auto_195597 ) ) ( not ( = ?auto_195598 ?auto_195596 ) ) ( not ( = ?auto_195598 ?auto_195599 ) ) ( not ( = ?auto_195598 ?auto_195595 ) ) ( not ( = ?auto_195598 ?auto_195597 ) ) ( ON ?auto_195599 ?auto_195593 ) ( not ( = ?auto_195592 ?auto_195593 ) ) ( not ( = ?auto_195594 ?auto_195593 ) ) ( not ( = ?auto_195598 ?auto_195593 ) ) ( not ( = ?auto_195600 ?auto_195593 ) ) ( not ( = ?auto_195599 ?auto_195593 ) ) ( not ( = ?auto_195595 ?auto_195593 ) ) ( not ( = ?auto_195597 ?auto_195593 ) ) ( not ( = ?auto_195596 ?auto_195593 ) ) ( ON ?auto_195595 ?auto_195599 ) ( ON-TABLE ?auto_195593 ) ( ON ?auto_195597 ?auto_195595 ) ( ON ?auto_195596 ?auto_195597 ) ( CLEAR ?auto_195598 ) ( ON ?auto_195600 ?auto_195596 ) ( CLEAR ?auto_195600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195593 ?auto_195599 ?auto_195595 ?auto_195597 ?auto_195596 )
      ( MAKE-1PILE ?auto_195592 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195601 - BLOCK
    )
    :vars
    (
      ?auto_195609 - BLOCK
      ?auto_195603 - BLOCK
      ?auto_195604 - BLOCK
      ?auto_195608 - BLOCK
      ?auto_195607 - BLOCK
      ?auto_195605 - BLOCK
      ?auto_195606 - BLOCK
      ?auto_195602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195609 ?auto_195601 ) ( ON-TABLE ?auto_195601 ) ( not ( = ?auto_195601 ?auto_195609 ) ) ( not ( = ?auto_195601 ?auto_195603 ) ) ( not ( = ?auto_195601 ?auto_195604 ) ) ( not ( = ?auto_195609 ?auto_195603 ) ) ( not ( = ?auto_195609 ?auto_195604 ) ) ( not ( = ?auto_195603 ?auto_195604 ) ) ( not ( = ?auto_195608 ?auto_195607 ) ) ( not ( = ?auto_195608 ?auto_195605 ) ) ( not ( = ?auto_195608 ?auto_195606 ) ) ( not ( = ?auto_195608 ?auto_195604 ) ) ( not ( = ?auto_195607 ?auto_195605 ) ) ( not ( = ?auto_195607 ?auto_195606 ) ) ( not ( = ?auto_195607 ?auto_195604 ) ) ( not ( = ?auto_195605 ?auto_195606 ) ) ( not ( = ?auto_195605 ?auto_195604 ) ) ( not ( = ?auto_195606 ?auto_195604 ) ) ( not ( = ?auto_195601 ?auto_195606 ) ) ( not ( = ?auto_195601 ?auto_195608 ) ) ( not ( = ?auto_195601 ?auto_195607 ) ) ( not ( = ?auto_195601 ?auto_195605 ) ) ( not ( = ?auto_195609 ?auto_195606 ) ) ( not ( = ?auto_195609 ?auto_195608 ) ) ( not ( = ?auto_195609 ?auto_195607 ) ) ( not ( = ?auto_195609 ?auto_195605 ) ) ( not ( = ?auto_195603 ?auto_195606 ) ) ( not ( = ?auto_195603 ?auto_195608 ) ) ( not ( = ?auto_195603 ?auto_195607 ) ) ( not ( = ?auto_195603 ?auto_195605 ) ) ( ON ?auto_195608 ?auto_195602 ) ( not ( = ?auto_195601 ?auto_195602 ) ) ( not ( = ?auto_195609 ?auto_195602 ) ) ( not ( = ?auto_195603 ?auto_195602 ) ) ( not ( = ?auto_195604 ?auto_195602 ) ) ( not ( = ?auto_195608 ?auto_195602 ) ) ( not ( = ?auto_195607 ?auto_195602 ) ) ( not ( = ?auto_195605 ?auto_195602 ) ) ( not ( = ?auto_195606 ?auto_195602 ) ) ( ON ?auto_195607 ?auto_195608 ) ( ON-TABLE ?auto_195602 ) ( ON ?auto_195605 ?auto_195607 ) ( ON ?auto_195606 ?auto_195605 ) ( ON ?auto_195604 ?auto_195606 ) ( CLEAR ?auto_195604 ) ( HOLDING ?auto_195603 ) ( CLEAR ?auto_195609 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195601 ?auto_195609 ?auto_195603 )
      ( MAKE-1PILE ?auto_195601 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195610 - BLOCK
    )
    :vars
    (
      ?auto_195616 - BLOCK
      ?auto_195613 - BLOCK
      ?auto_195611 - BLOCK
      ?auto_195612 - BLOCK
      ?auto_195618 - BLOCK
      ?auto_195614 - BLOCK
      ?auto_195615 - BLOCK
      ?auto_195617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195616 ?auto_195610 ) ( ON-TABLE ?auto_195610 ) ( not ( = ?auto_195610 ?auto_195616 ) ) ( not ( = ?auto_195610 ?auto_195613 ) ) ( not ( = ?auto_195610 ?auto_195611 ) ) ( not ( = ?auto_195616 ?auto_195613 ) ) ( not ( = ?auto_195616 ?auto_195611 ) ) ( not ( = ?auto_195613 ?auto_195611 ) ) ( not ( = ?auto_195612 ?auto_195618 ) ) ( not ( = ?auto_195612 ?auto_195614 ) ) ( not ( = ?auto_195612 ?auto_195615 ) ) ( not ( = ?auto_195612 ?auto_195611 ) ) ( not ( = ?auto_195618 ?auto_195614 ) ) ( not ( = ?auto_195618 ?auto_195615 ) ) ( not ( = ?auto_195618 ?auto_195611 ) ) ( not ( = ?auto_195614 ?auto_195615 ) ) ( not ( = ?auto_195614 ?auto_195611 ) ) ( not ( = ?auto_195615 ?auto_195611 ) ) ( not ( = ?auto_195610 ?auto_195615 ) ) ( not ( = ?auto_195610 ?auto_195612 ) ) ( not ( = ?auto_195610 ?auto_195618 ) ) ( not ( = ?auto_195610 ?auto_195614 ) ) ( not ( = ?auto_195616 ?auto_195615 ) ) ( not ( = ?auto_195616 ?auto_195612 ) ) ( not ( = ?auto_195616 ?auto_195618 ) ) ( not ( = ?auto_195616 ?auto_195614 ) ) ( not ( = ?auto_195613 ?auto_195615 ) ) ( not ( = ?auto_195613 ?auto_195612 ) ) ( not ( = ?auto_195613 ?auto_195618 ) ) ( not ( = ?auto_195613 ?auto_195614 ) ) ( ON ?auto_195612 ?auto_195617 ) ( not ( = ?auto_195610 ?auto_195617 ) ) ( not ( = ?auto_195616 ?auto_195617 ) ) ( not ( = ?auto_195613 ?auto_195617 ) ) ( not ( = ?auto_195611 ?auto_195617 ) ) ( not ( = ?auto_195612 ?auto_195617 ) ) ( not ( = ?auto_195618 ?auto_195617 ) ) ( not ( = ?auto_195614 ?auto_195617 ) ) ( not ( = ?auto_195615 ?auto_195617 ) ) ( ON ?auto_195618 ?auto_195612 ) ( ON-TABLE ?auto_195617 ) ( ON ?auto_195614 ?auto_195618 ) ( ON ?auto_195615 ?auto_195614 ) ( ON ?auto_195611 ?auto_195615 ) ( CLEAR ?auto_195616 ) ( ON ?auto_195613 ?auto_195611 ) ( CLEAR ?auto_195613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195617 ?auto_195612 ?auto_195618 ?auto_195614 ?auto_195615 ?auto_195611 )
      ( MAKE-1PILE ?auto_195610 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195637 - BLOCK
    )
    :vars
    (
      ?auto_195645 - BLOCK
      ?auto_195640 - BLOCK
      ?auto_195643 - BLOCK
      ?auto_195644 - BLOCK
      ?auto_195642 - BLOCK
      ?auto_195639 - BLOCK
      ?auto_195638 - BLOCK
      ?auto_195641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195637 ?auto_195645 ) ) ( not ( = ?auto_195637 ?auto_195640 ) ) ( not ( = ?auto_195637 ?auto_195643 ) ) ( not ( = ?auto_195645 ?auto_195640 ) ) ( not ( = ?auto_195645 ?auto_195643 ) ) ( not ( = ?auto_195640 ?auto_195643 ) ) ( not ( = ?auto_195644 ?auto_195642 ) ) ( not ( = ?auto_195644 ?auto_195639 ) ) ( not ( = ?auto_195644 ?auto_195638 ) ) ( not ( = ?auto_195644 ?auto_195643 ) ) ( not ( = ?auto_195642 ?auto_195639 ) ) ( not ( = ?auto_195642 ?auto_195638 ) ) ( not ( = ?auto_195642 ?auto_195643 ) ) ( not ( = ?auto_195639 ?auto_195638 ) ) ( not ( = ?auto_195639 ?auto_195643 ) ) ( not ( = ?auto_195638 ?auto_195643 ) ) ( not ( = ?auto_195637 ?auto_195638 ) ) ( not ( = ?auto_195637 ?auto_195644 ) ) ( not ( = ?auto_195637 ?auto_195642 ) ) ( not ( = ?auto_195637 ?auto_195639 ) ) ( not ( = ?auto_195645 ?auto_195638 ) ) ( not ( = ?auto_195645 ?auto_195644 ) ) ( not ( = ?auto_195645 ?auto_195642 ) ) ( not ( = ?auto_195645 ?auto_195639 ) ) ( not ( = ?auto_195640 ?auto_195638 ) ) ( not ( = ?auto_195640 ?auto_195644 ) ) ( not ( = ?auto_195640 ?auto_195642 ) ) ( not ( = ?auto_195640 ?auto_195639 ) ) ( ON ?auto_195644 ?auto_195641 ) ( not ( = ?auto_195637 ?auto_195641 ) ) ( not ( = ?auto_195645 ?auto_195641 ) ) ( not ( = ?auto_195640 ?auto_195641 ) ) ( not ( = ?auto_195643 ?auto_195641 ) ) ( not ( = ?auto_195644 ?auto_195641 ) ) ( not ( = ?auto_195642 ?auto_195641 ) ) ( not ( = ?auto_195639 ?auto_195641 ) ) ( not ( = ?auto_195638 ?auto_195641 ) ) ( ON ?auto_195642 ?auto_195644 ) ( ON-TABLE ?auto_195641 ) ( ON ?auto_195639 ?auto_195642 ) ( ON ?auto_195638 ?auto_195639 ) ( ON ?auto_195643 ?auto_195638 ) ( ON ?auto_195640 ?auto_195643 ) ( ON ?auto_195645 ?auto_195640 ) ( CLEAR ?auto_195645 ) ( HOLDING ?auto_195637 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195637 ?auto_195645 )
      ( MAKE-1PILE ?auto_195637 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_195646 - BLOCK
    )
    :vars
    (
      ?auto_195647 - BLOCK
      ?auto_195653 - BLOCK
      ?auto_195654 - BLOCK
      ?auto_195652 - BLOCK
      ?auto_195649 - BLOCK
      ?auto_195648 - BLOCK
      ?auto_195651 - BLOCK
      ?auto_195650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195646 ?auto_195647 ) ) ( not ( = ?auto_195646 ?auto_195653 ) ) ( not ( = ?auto_195646 ?auto_195654 ) ) ( not ( = ?auto_195647 ?auto_195653 ) ) ( not ( = ?auto_195647 ?auto_195654 ) ) ( not ( = ?auto_195653 ?auto_195654 ) ) ( not ( = ?auto_195652 ?auto_195649 ) ) ( not ( = ?auto_195652 ?auto_195648 ) ) ( not ( = ?auto_195652 ?auto_195651 ) ) ( not ( = ?auto_195652 ?auto_195654 ) ) ( not ( = ?auto_195649 ?auto_195648 ) ) ( not ( = ?auto_195649 ?auto_195651 ) ) ( not ( = ?auto_195649 ?auto_195654 ) ) ( not ( = ?auto_195648 ?auto_195651 ) ) ( not ( = ?auto_195648 ?auto_195654 ) ) ( not ( = ?auto_195651 ?auto_195654 ) ) ( not ( = ?auto_195646 ?auto_195651 ) ) ( not ( = ?auto_195646 ?auto_195652 ) ) ( not ( = ?auto_195646 ?auto_195649 ) ) ( not ( = ?auto_195646 ?auto_195648 ) ) ( not ( = ?auto_195647 ?auto_195651 ) ) ( not ( = ?auto_195647 ?auto_195652 ) ) ( not ( = ?auto_195647 ?auto_195649 ) ) ( not ( = ?auto_195647 ?auto_195648 ) ) ( not ( = ?auto_195653 ?auto_195651 ) ) ( not ( = ?auto_195653 ?auto_195652 ) ) ( not ( = ?auto_195653 ?auto_195649 ) ) ( not ( = ?auto_195653 ?auto_195648 ) ) ( ON ?auto_195652 ?auto_195650 ) ( not ( = ?auto_195646 ?auto_195650 ) ) ( not ( = ?auto_195647 ?auto_195650 ) ) ( not ( = ?auto_195653 ?auto_195650 ) ) ( not ( = ?auto_195654 ?auto_195650 ) ) ( not ( = ?auto_195652 ?auto_195650 ) ) ( not ( = ?auto_195649 ?auto_195650 ) ) ( not ( = ?auto_195648 ?auto_195650 ) ) ( not ( = ?auto_195651 ?auto_195650 ) ) ( ON ?auto_195649 ?auto_195652 ) ( ON-TABLE ?auto_195650 ) ( ON ?auto_195648 ?auto_195649 ) ( ON ?auto_195651 ?auto_195648 ) ( ON ?auto_195654 ?auto_195651 ) ( ON ?auto_195653 ?auto_195654 ) ( ON ?auto_195647 ?auto_195653 ) ( ON ?auto_195646 ?auto_195647 ) ( CLEAR ?auto_195646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_195650 ?auto_195652 ?auto_195649 ?auto_195648 ?auto_195651 ?auto_195654 ?auto_195653 ?auto_195647 )
      ( MAKE-1PILE ?auto_195646 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195662 - BLOCK
      ?auto_195663 - BLOCK
      ?auto_195664 - BLOCK
      ?auto_195665 - BLOCK
      ?auto_195666 - BLOCK
      ?auto_195667 - BLOCK
      ?auto_195668 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_195668 ) ( CLEAR ?auto_195667 ) ( ON-TABLE ?auto_195662 ) ( ON ?auto_195663 ?auto_195662 ) ( ON ?auto_195664 ?auto_195663 ) ( ON ?auto_195665 ?auto_195664 ) ( ON ?auto_195666 ?auto_195665 ) ( ON ?auto_195667 ?auto_195666 ) ( not ( = ?auto_195662 ?auto_195663 ) ) ( not ( = ?auto_195662 ?auto_195664 ) ) ( not ( = ?auto_195662 ?auto_195665 ) ) ( not ( = ?auto_195662 ?auto_195666 ) ) ( not ( = ?auto_195662 ?auto_195667 ) ) ( not ( = ?auto_195662 ?auto_195668 ) ) ( not ( = ?auto_195663 ?auto_195664 ) ) ( not ( = ?auto_195663 ?auto_195665 ) ) ( not ( = ?auto_195663 ?auto_195666 ) ) ( not ( = ?auto_195663 ?auto_195667 ) ) ( not ( = ?auto_195663 ?auto_195668 ) ) ( not ( = ?auto_195664 ?auto_195665 ) ) ( not ( = ?auto_195664 ?auto_195666 ) ) ( not ( = ?auto_195664 ?auto_195667 ) ) ( not ( = ?auto_195664 ?auto_195668 ) ) ( not ( = ?auto_195665 ?auto_195666 ) ) ( not ( = ?auto_195665 ?auto_195667 ) ) ( not ( = ?auto_195665 ?auto_195668 ) ) ( not ( = ?auto_195666 ?auto_195667 ) ) ( not ( = ?auto_195666 ?auto_195668 ) ) ( not ( = ?auto_195667 ?auto_195668 ) ) )
    :subtasks
    ( ( !STACK ?auto_195668 ?auto_195667 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195669 - BLOCK
      ?auto_195670 - BLOCK
      ?auto_195671 - BLOCK
      ?auto_195672 - BLOCK
      ?auto_195673 - BLOCK
      ?auto_195674 - BLOCK
      ?auto_195675 - BLOCK
    )
    :vars
    (
      ?auto_195676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_195674 ) ( ON-TABLE ?auto_195669 ) ( ON ?auto_195670 ?auto_195669 ) ( ON ?auto_195671 ?auto_195670 ) ( ON ?auto_195672 ?auto_195671 ) ( ON ?auto_195673 ?auto_195672 ) ( ON ?auto_195674 ?auto_195673 ) ( not ( = ?auto_195669 ?auto_195670 ) ) ( not ( = ?auto_195669 ?auto_195671 ) ) ( not ( = ?auto_195669 ?auto_195672 ) ) ( not ( = ?auto_195669 ?auto_195673 ) ) ( not ( = ?auto_195669 ?auto_195674 ) ) ( not ( = ?auto_195669 ?auto_195675 ) ) ( not ( = ?auto_195670 ?auto_195671 ) ) ( not ( = ?auto_195670 ?auto_195672 ) ) ( not ( = ?auto_195670 ?auto_195673 ) ) ( not ( = ?auto_195670 ?auto_195674 ) ) ( not ( = ?auto_195670 ?auto_195675 ) ) ( not ( = ?auto_195671 ?auto_195672 ) ) ( not ( = ?auto_195671 ?auto_195673 ) ) ( not ( = ?auto_195671 ?auto_195674 ) ) ( not ( = ?auto_195671 ?auto_195675 ) ) ( not ( = ?auto_195672 ?auto_195673 ) ) ( not ( = ?auto_195672 ?auto_195674 ) ) ( not ( = ?auto_195672 ?auto_195675 ) ) ( not ( = ?auto_195673 ?auto_195674 ) ) ( not ( = ?auto_195673 ?auto_195675 ) ) ( not ( = ?auto_195674 ?auto_195675 ) ) ( ON ?auto_195675 ?auto_195676 ) ( CLEAR ?auto_195675 ) ( HAND-EMPTY ) ( not ( = ?auto_195669 ?auto_195676 ) ) ( not ( = ?auto_195670 ?auto_195676 ) ) ( not ( = ?auto_195671 ?auto_195676 ) ) ( not ( = ?auto_195672 ?auto_195676 ) ) ( not ( = ?auto_195673 ?auto_195676 ) ) ( not ( = ?auto_195674 ?auto_195676 ) ) ( not ( = ?auto_195675 ?auto_195676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195675 ?auto_195676 )
      ( MAKE-7PILE ?auto_195669 ?auto_195670 ?auto_195671 ?auto_195672 ?auto_195673 ?auto_195674 ?auto_195675 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195677 - BLOCK
      ?auto_195678 - BLOCK
      ?auto_195679 - BLOCK
      ?auto_195680 - BLOCK
      ?auto_195681 - BLOCK
      ?auto_195682 - BLOCK
      ?auto_195683 - BLOCK
    )
    :vars
    (
      ?auto_195684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195677 ) ( ON ?auto_195678 ?auto_195677 ) ( ON ?auto_195679 ?auto_195678 ) ( ON ?auto_195680 ?auto_195679 ) ( ON ?auto_195681 ?auto_195680 ) ( not ( = ?auto_195677 ?auto_195678 ) ) ( not ( = ?auto_195677 ?auto_195679 ) ) ( not ( = ?auto_195677 ?auto_195680 ) ) ( not ( = ?auto_195677 ?auto_195681 ) ) ( not ( = ?auto_195677 ?auto_195682 ) ) ( not ( = ?auto_195677 ?auto_195683 ) ) ( not ( = ?auto_195678 ?auto_195679 ) ) ( not ( = ?auto_195678 ?auto_195680 ) ) ( not ( = ?auto_195678 ?auto_195681 ) ) ( not ( = ?auto_195678 ?auto_195682 ) ) ( not ( = ?auto_195678 ?auto_195683 ) ) ( not ( = ?auto_195679 ?auto_195680 ) ) ( not ( = ?auto_195679 ?auto_195681 ) ) ( not ( = ?auto_195679 ?auto_195682 ) ) ( not ( = ?auto_195679 ?auto_195683 ) ) ( not ( = ?auto_195680 ?auto_195681 ) ) ( not ( = ?auto_195680 ?auto_195682 ) ) ( not ( = ?auto_195680 ?auto_195683 ) ) ( not ( = ?auto_195681 ?auto_195682 ) ) ( not ( = ?auto_195681 ?auto_195683 ) ) ( not ( = ?auto_195682 ?auto_195683 ) ) ( ON ?auto_195683 ?auto_195684 ) ( CLEAR ?auto_195683 ) ( not ( = ?auto_195677 ?auto_195684 ) ) ( not ( = ?auto_195678 ?auto_195684 ) ) ( not ( = ?auto_195679 ?auto_195684 ) ) ( not ( = ?auto_195680 ?auto_195684 ) ) ( not ( = ?auto_195681 ?auto_195684 ) ) ( not ( = ?auto_195682 ?auto_195684 ) ) ( not ( = ?auto_195683 ?auto_195684 ) ) ( HOLDING ?auto_195682 ) ( CLEAR ?auto_195681 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195677 ?auto_195678 ?auto_195679 ?auto_195680 ?auto_195681 ?auto_195682 )
      ( MAKE-7PILE ?auto_195677 ?auto_195678 ?auto_195679 ?auto_195680 ?auto_195681 ?auto_195682 ?auto_195683 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195685 - BLOCK
      ?auto_195686 - BLOCK
      ?auto_195687 - BLOCK
      ?auto_195688 - BLOCK
      ?auto_195689 - BLOCK
      ?auto_195690 - BLOCK
      ?auto_195691 - BLOCK
    )
    :vars
    (
      ?auto_195692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195685 ) ( ON ?auto_195686 ?auto_195685 ) ( ON ?auto_195687 ?auto_195686 ) ( ON ?auto_195688 ?auto_195687 ) ( ON ?auto_195689 ?auto_195688 ) ( not ( = ?auto_195685 ?auto_195686 ) ) ( not ( = ?auto_195685 ?auto_195687 ) ) ( not ( = ?auto_195685 ?auto_195688 ) ) ( not ( = ?auto_195685 ?auto_195689 ) ) ( not ( = ?auto_195685 ?auto_195690 ) ) ( not ( = ?auto_195685 ?auto_195691 ) ) ( not ( = ?auto_195686 ?auto_195687 ) ) ( not ( = ?auto_195686 ?auto_195688 ) ) ( not ( = ?auto_195686 ?auto_195689 ) ) ( not ( = ?auto_195686 ?auto_195690 ) ) ( not ( = ?auto_195686 ?auto_195691 ) ) ( not ( = ?auto_195687 ?auto_195688 ) ) ( not ( = ?auto_195687 ?auto_195689 ) ) ( not ( = ?auto_195687 ?auto_195690 ) ) ( not ( = ?auto_195687 ?auto_195691 ) ) ( not ( = ?auto_195688 ?auto_195689 ) ) ( not ( = ?auto_195688 ?auto_195690 ) ) ( not ( = ?auto_195688 ?auto_195691 ) ) ( not ( = ?auto_195689 ?auto_195690 ) ) ( not ( = ?auto_195689 ?auto_195691 ) ) ( not ( = ?auto_195690 ?auto_195691 ) ) ( ON ?auto_195691 ?auto_195692 ) ( not ( = ?auto_195685 ?auto_195692 ) ) ( not ( = ?auto_195686 ?auto_195692 ) ) ( not ( = ?auto_195687 ?auto_195692 ) ) ( not ( = ?auto_195688 ?auto_195692 ) ) ( not ( = ?auto_195689 ?auto_195692 ) ) ( not ( = ?auto_195690 ?auto_195692 ) ) ( not ( = ?auto_195691 ?auto_195692 ) ) ( CLEAR ?auto_195689 ) ( ON ?auto_195690 ?auto_195691 ) ( CLEAR ?auto_195690 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_195692 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195692 ?auto_195691 )
      ( MAKE-7PILE ?auto_195685 ?auto_195686 ?auto_195687 ?auto_195688 ?auto_195689 ?auto_195690 ?auto_195691 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195693 - BLOCK
      ?auto_195694 - BLOCK
      ?auto_195695 - BLOCK
      ?auto_195696 - BLOCK
      ?auto_195697 - BLOCK
      ?auto_195698 - BLOCK
      ?auto_195699 - BLOCK
    )
    :vars
    (
      ?auto_195700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195693 ) ( ON ?auto_195694 ?auto_195693 ) ( ON ?auto_195695 ?auto_195694 ) ( ON ?auto_195696 ?auto_195695 ) ( not ( = ?auto_195693 ?auto_195694 ) ) ( not ( = ?auto_195693 ?auto_195695 ) ) ( not ( = ?auto_195693 ?auto_195696 ) ) ( not ( = ?auto_195693 ?auto_195697 ) ) ( not ( = ?auto_195693 ?auto_195698 ) ) ( not ( = ?auto_195693 ?auto_195699 ) ) ( not ( = ?auto_195694 ?auto_195695 ) ) ( not ( = ?auto_195694 ?auto_195696 ) ) ( not ( = ?auto_195694 ?auto_195697 ) ) ( not ( = ?auto_195694 ?auto_195698 ) ) ( not ( = ?auto_195694 ?auto_195699 ) ) ( not ( = ?auto_195695 ?auto_195696 ) ) ( not ( = ?auto_195695 ?auto_195697 ) ) ( not ( = ?auto_195695 ?auto_195698 ) ) ( not ( = ?auto_195695 ?auto_195699 ) ) ( not ( = ?auto_195696 ?auto_195697 ) ) ( not ( = ?auto_195696 ?auto_195698 ) ) ( not ( = ?auto_195696 ?auto_195699 ) ) ( not ( = ?auto_195697 ?auto_195698 ) ) ( not ( = ?auto_195697 ?auto_195699 ) ) ( not ( = ?auto_195698 ?auto_195699 ) ) ( ON ?auto_195699 ?auto_195700 ) ( not ( = ?auto_195693 ?auto_195700 ) ) ( not ( = ?auto_195694 ?auto_195700 ) ) ( not ( = ?auto_195695 ?auto_195700 ) ) ( not ( = ?auto_195696 ?auto_195700 ) ) ( not ( = ?auto_195697 ?auto_195700 ) ) ( not ( = ?auto_195698 ?auto_195700 ) ) ( not ( = ?auto_195699 ?auto_195700 ) ) ( ON ?auto_195698 ?auto_195699 ) ( CLEAR ?auto_195698 ) ( ON-TABLE ?auto_195700 ) ( HOLDING ?auto_195697 ) ( CLEAR ?auto_195696 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195693 ?auto_195694 ?auto_195695 ?auto_195696 ?auto_195697 )
      ( MAKE-7PILE ?auto_195693 ?auto_195694 ?auto_195695 ?auto_195696 ?auto_195697 ?auto_195698 ?auto_195699 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195701 - BLOCK
      ?auto_195702 - BLOCK
      ?auto_195703 - BLOCK
      ?auto_195704 - BLOCK
      ?auto_195705 - BLOCK
      ?auto_195706 - BLOCK
      ?auto_195707 - BLOCK
    )
    :vars
    (
      ?auto_195708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195701 ) ( ON ?auto_195702 ?auto_195701 ) ( ON ?auto_195703 ?auto_195702 ) ( ON ?auto_195704 ?auto_195703 ) ( not ( = ?auto_195701 ?auto_195702 ) ) ( not ( = ?auto_195701 ?auto_195703 ) ) ( not ( = ?auto_195701 ?auto_195704 ) ) ( not ( = ?auto_195701 ?auto_195705 ) ) ( not ( = ?auto_195701 ?auto_195706 ) ) ( not ( = ?auto_195701 ?auto_195707 ) ) ( not ( = ?auto_195702 ?auto_195703 ) ) ( not ( = ?auto_195702 ?auto_195704 ) ) ( not ( = ?auto_195702 ?auto_195705 ) ) ( not ( = ?auto_195702 ?auto_195706 ) ) ( not ( = ?auto_195702 ?auto_195707 ) ) ( not ( = ?auto_195703 ?auto_195704 ) ) ( not ( = ?auto_195703 ?auto_195705 ) ) ( not ( = ?auto_195703 ?auto_195706 ) ) ( not ( = ?auto_195703 ?auto_195707 ) ) ( not ( = ?auto_195704 ?auto_195705 ) ) ( not ( = ?auto_195704 ?auto_195706 ) ) ( not ( = ?auto_195704 ?auto_195707 ) ) ( not ( = ?auto_195705 ?auto_195706 ) ) ( not ( = ?auto_195705 ?auto_195707 ) ) ( not ( = ?auto_195706 ?auto_195707 ) ) ( ON ?auto_195707 ?auto_195708 ) ( not ( = ?auto_195701 ?auto_195708 ) ) ( not ( = ?auto_195702 ?auto_195708 ) ) ( not ( = ?auto_195703 ?auto_195708 ) ) ( not ( = ?auto_195704 ?auto_195708 ) ) ( not ( = ?auto_195705 ?auto_195708 ) ) ( not ( = ?auto_195706 ?auto_195708 ) ) ( not ( = ?auto_195707 ?auto_195708 ) ) ( ON ?auto_195706 ?auto_195707 ) ( ON-TABLE ?auto_195708 ) ( CLEAR ?auto_195704 ) ( ON ?auto_195705 ?auto_195706 ) ( CLEAR ?auto_195705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195708 ?auto_195707 ?auto_195706 )
      ( MAKE-7PILE ?auto_195701 ?auto_195702 ?auto_195703 ?auto_195704 ?auto_195705 ?auto_195706 ?auto_195707 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195709 - BLOCK
      ?auto_195710 - BLOCK
      ?auto_195711 - BLOCK
      ?auto_195712 - BLOCK
      ?auto_195713 - BLOCK
      ?auto_195714 - BLOCK
      ?auto_195715 - BLOCK
    )
    :vars
    (
      ?auto_195716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195709 ) ( ON ?auto_195710 ?auto_195709 ) ( ON ?auto_195711 ?auto_195710 ) ( not ( = ?auto_195709 ?auto_195710 ) ) ( not ( = ?auto_195709 ?auto_195711 ) ) ( not ( = ?auto_195709 ?auto_195712 ) ) ( not ( = ?auto_195709 ?auto_195713 ) ) ( not ( = ?auto_195709 ?auto_195714 ) ) ( not ( = ?auto_195709 ?auto_195715 ) ) ( not ( = ?auto_195710 ?auto_195711 ) ) ( not ( = ?auto_195710 ?auto_195712 ) ) ( not ( = ?auto_195710 ?auto_195713 ) ) ( not ( = ?auto_195710 ?auto_195714 ) ) ( not ( = ?auto_195710 ?auto_195715 ) ) ( not ( = ?auto_195711 ?auto_195712 ) ) ( not ( = ?auto_195711 ?auto_195713 ) ) ( not ( = ?auto_195711 ?auto_195714 ) ) ( not ( = ?auto_195711 ?auto_195715 ) ) ( not ( = ?auto_195712 ?auto_195713 ) ) ( not ( = ?auto_195712 ?auto_195714 ) ) ( not ( = ?auto_195712 ?auto_195715 ) ) ( not ( = ?auto_195713 ?auto_195714 ) ) ( not ( = ?auto_195713 ?auto_195715 ) ) ( not ( = ?auto_195714 ?auto_195715 ) ) ( ON ?auto_195715 ?auto_195716 ) ( not ( = ?auto_195709 ?auto_195716 ) ) ( not ( = ?auto_195710 ?auto_195716 ) ) ( not ( = ?auto_195711 ?auto_195716 ) ) ( not ( = ?auto_195712 ?auto_195716 ) ) ( not ( = ?auto_195713 ?auto_195716 ) ) ( not ( = ?auto_195714 ?auto_195716 ) ) ( not ( = ?auto_195715 ?auto_195716 ) ) ( ON ?auto_195714 ?auto_195715 ) ( ON-TABLE ?auto_195716 ) ( ON ?auto_195713 ?auto_195714 ) ( CLEAR ?auto_195713 ) ( HOLDING ?auto_195712 ) ( CLEAR ?auto_195711 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195709 ?auto_195710 ?auto_195711 ?auto_195712 )
      ( MAKE-7PILE ?auto_195709 ?auto_195710 ?auto_195711 ?auto_195712 ?auto_195713 ?auto_195714 ?auto_195715 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195717 - BLOCK
      ?auto_195718 - BLOCK
      ?auto_195719 - BLOCK
      ?auto_195720 - BLOCK
      ?auto_195721 - BLOCK
      ?auto_195722 - BLOCK
      ?auto_195723 - BLOCK
    )
    :vars
    (
      ?auto_195724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195717 ) ( ON ?auto_195718 ?auto_195717 ) ( ON ?auto_195719 ?auto_195718 ) ( not ( = ?auto_195717 ?auto_195718 ) ) ( not ( = ?auto_195717 ?auto_195719 ) ) ( not ( = ?auto_195717 ?auto_195720 ) ) ( not ( = ?auto_195717 ?auto_195721 ) ) ( not ( = ?auto_195717 ?auto_195722 ) ) ( not ( = ?auto_195717 ?auto_195723 ) ) ( not ( = ?auto_195718 ?auto_195719 ) ) ( not ( = ?auto_195718 ?auto_195720 ) ) ( not ( = ?auto_195718 ?auto_195721 ) ) ( not ( = ?auto_195718 ?auto_195722 ) ) ( not ( = ?auto_195718 ?auto_195723 ) ) ( not ( = ?auto_195719 ?auto_195720 ) ) ( not ( = ?auto_195719 ?auto_195721 ) ) ( not ( = ?auto_195719 ?auto_195722 ) ) ( not ( = ?auto_195719 ?auto_195723 ) ) ( not ( = ?auto_195720 ?auto_195721 ) ) ( not ( = ?auto_195720 ?auto_195722 ) ) ( not ( = ?auto_195720 ?auto_195723 ) ) ( not ( = ?auto_195721 ?auto_195722 ) ) ( not ( = ?auto_195721 ?auto_195723 ) ) ( not ( = ?auto_195722 ?auto_195723 ) ) ( ON ?auto_195723 ?auto_195724 ) ( not ( = ?auto_195717 ?auto_195724 ) ) ( not ( = ?auto_195718 ?auto_195724 ) ) ( not ( = ?auto_195719 ?auto_195724 ) ) ( not ( = ?auto_195720 ?auto_195724 ) ) ( not ( = ?auto_195721 ?auto_195724 ) ) ( not ( = ?auto_195722 ?auto_195724 ) ) ( not ( = ?auto_195723 ?auto_195724 ) ) ( ON ?auto_195722 ?auto_195723 ) ( ON-TABLE ?auto_195724 ) ( ON ?auto_195721 ?auto_195722 ) ( CLEAR ?auto_195719 ) ( ON ?auto_195720 ?auto_195721 ) ( CLEAR ?auto_195720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195724 ?auto_195723 ?auto_195722 ?auto_195721 )
      ( MAKE-7PILE ?auto_195717 ?auto_195718 ?auto_195719 ?auto_195720 ?auto_195721 ?auto_195722 ?auto_195723 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195725 - BLOCK
      ?auto_195726 - BLOCK
      ?auto_195727 - BLOCK
      ?auto_195728 - BLOCK
      ?auto_195729 - BLOCK
      ?auto_195730 - BLOCK
      ?auto_195731 - BLOCK
    )
    :vars
    (
      ?auto_195732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195725 ) ( ON ?auto_195726 ?auto_195725 ) ( not ( = ?auto_195725 ?auto_195726 ) ) ( not ( = ?auto_195725 ?auto_195727 ) ) ( not ( = ?auto_195725 ?auto_195728 ) ) ( not ( = ?auto_195725 ?auto_195729 ) ) ( not ( = ?auto_195725 ?auto_195730 ) ) ( not ( = ?auto_195725 ?auto_195731 ) ) ( not ( = ?auto_195726 ?auto_195727 ) ) ( not ( = ?auto_195726 ?auto_195728 ) ) ( not ( = ?auto_195726 ?auto_195729 ) ) ( not ( = ?auto_195726 ?auto_195730 ) ) ( not ( = ?auto_195726 ?auto_195731 ) ) ( not ( = ?auto_195727 ?auto_195728 ) ) ( not ( = ?auto_195727 ?auto_195729 ) ) ( not ( = ?auto_195727 ?auto_195730 ) ) ( not ( = ?auto_195727 ?auto_195731 ) ) ( not ( = ?auto_195728 ?auto_195729 ) ) ( not ( = ?auto_195728 ?auto_195730 ) ) ( not ( = ?auto_195728 ?auto_195731 ) ) ( not ( = ?auto_195729 ?auto_195730 ) ) ( not ( = ?auto_195729 ?auto_195731 ) ) ( not ( = ?auto_195730 ?auto_195731 ) ) ( ON ?auto_195731 ?auto_195732 ) ( not ( = ?auto_195725 ?auto_195732 ) ) ( not ( = ?auto_195726 ?auto_195732 ) ) ( not ( = ?auto_195727 ?auto_195732 ) ) ( not ( = ?auto_195728 ?auto_195732 ) ) ( not ( = ?auto_195729 ?auto_195732 ) ) ( not ( = ?auto_195730 ?auto_195732 ) ) ( not ( = ?auto_195731 ?auto_195732 ) ) ( ON ?auto_195730 ?auto_195731 ) ( ON-TABLE ?auto_195732 ) ( ON ?auto_195729 ?auto_195730 ) ( ON ?auto_195728 ?auto_195729 ) ( CLEAR ?auto_195728 ) ( HOLDING ?auto_195727 ) ( CLEAR ?auto_195726 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195725 ?auto_195726 ?auto_195727 )
      ( MAKE-7PILE ?auto_195725 ?auto_195726 ?auto_195727 ?auto_195728 ?auto_195729 ?auto_195730 ?auto_195731 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195733 - BLOCK
      ?auto_195734 - BLOCK
      ?auto_195735 - BLOCK
      ?auto_195736 - BLOCK
      ?auto_195737 - BLOCK
      ?auto_195738 - BLOCK
      ?auto_195739 - BLOCK
    )
    :vars
    (
      ?auto_195740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195733 ) ( ON ?auto_195734 ?auto_195733 ) ( not ( = ?auto_195733 ?auto_195734 ) ) ( not ( = ?auto_195733 ?auto_195735 ) ) ( not ( = ?auto_195733 ?auto_195736 ) ) ( not ( = ?auto_195733 ?auto_195737 ) ) ( not ( = ?auto_195733 ?auto_195738 ) ) ( not ( = ?auto_195733 ?auto_195739 ) ) ( not ( = ?auto_195734 ?auto_195735 ) ) ( not ( = ?auto_195734 ?auto_195736 ) ) ( not ( = ?auto_195734 ?auto_195737 ) ) ( not ( = ?auto_195734 ?auto_195738 ) ) ( not ( = ?auto_195734 ?auto_195739 ) ) ( not ( = ?auto_195735 ?auto_195736 ) ) ( not ( = ?auto_195735 ?auto_195737 ) ) ( not ( = ?auto_195735 ?auto_195738 ) ) ( not ( = ?auto_195735 ?auto_195739 ) ) ( not ( = ?auto_195736 ?auto_195737 ) ) ( not ( = ?auto_195736 ?auto_195738 ) ) ( not ( = ?auto_195736 ?auto_195739 ) ) ( not ( = ?auto_195737 ?auto_195738 ) ) ( not ( = ?auto_195737 ?auto_195739 ) ) ( not ( = ?auto_195738 ?auto_195739 ) ) ( ON ?auto_195739 ?auto_195740 ) ( not ( = ?auto_195733 ?auto_195740 ) ) ( not ( = ?auto_195734 ?auto_195740 ) ) ( not ( = ?auto_195735 ?auto_195740 ) ) ( not ( = ?auto_195736 ?auto_195740 ) ) ( not ( = ?auto_195737 ?auto_195740 ) ) ( not ( = ?auto_195738 ?auto_195740 ) ) ( not ( = ?auto_195739 ?auto_195740 ) ) ( ON ?auto_195738 ?auto_195739 ) ( ON-TABLE ?auto_195740 ) ( ON ?auto_195737 ?auto_195738 ) ( ON ?auto_195736 ?auto_195737 ) ( CLEAR ?auto_195734 ) ( ON ?auto_195735 ?auto_195736 ) ( CLEAR ?auto_195735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195740 ?auto_195739 ?auto_195738 ?auto_195737 ?auto_195736 )
      ( MAKE-7PILE ?auto_195733 ?auto_195734 ?auto_195735 ?auto_195736 ?auto_195737 ?auto_195738 ?auto_195739 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195741 - BLOCK
      ?auto_195742 - BLOCK
      ?auto_195743 - BLOCK
      ?auto_195744 - BLOCK
      ?auto_195745 - BLOCK
      ?auto_195746 - BLOCK
      ?auto_195747 - BLOCK
    )
    :vars
    (
      ?auto_195748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195741 ) ( not ( = ?auto_195741 ?auto_195742 ) ) ( not ( = ?auto_195741 ?auto_195743 ) ) ( not ( = ?auto_195741 ?auto_195744 ) ) ( not ( = ?auto_195741 ?auto_195745 ) ) ( not ( = ?auto_195741 ?auto_195746 ) ) ( not ( = ?auto_195741 ?auto_195747 ) ) ( not ( = ?auto_195742 ?auto_195743 ) ) ( not ( = ?auto_195742 ?auto_195744 ) ) ( not ( = ?auto_195742 ?auto_195745 ) ) ( not ( = ?auto_195742 ?auto_195746 ) ) ( not ( = ?auto_195742 ?auto_195747 ) ) ( not ( = ?auto_195743 ?auto_195744 ) ) ( not ( = ?auto_195743 ?auto_195745 ) ) ( not ( = ?auto_195743 ?auto_195746 ) ) ( not ( = ?auto_195743 ?auto_195747 ) ) ( not ( = ?auto_195744 ?auto_195745 ) ) ( not ( = ?auto_195744 ?auto_195746 ) ) ( not ( = ?auto_195744 ?auto_195747 ) ) ( not ( = ?auto_195745 ?auto_195746 ) ) ( not ( = ?auto_195745 ?auto_195747 ) ) ( not ( = ?auto_195746 ?auto_195747 ) ) ( ON ?auto_195747 ?auto_195748 ) ( not ( = ?auto_195741 ?auto_195748 ) ) ( not ( = ?auto_195742 ?auto_195748 ) ) ( not ( = ?auto_195743 ?auto_195748 ) ) ( not ( = ?auto_195744 ?auto_195748 ) ) ( not ( = ?auto_195745 ?auto_195748 ) ) ( not ( = ?auto_195746 ?auto_195748 ) ) ( not ( = ?auto_195747 ?auto_195748 ) ) ( ON ?auto_195746 ?auto_195747 ) ( ON-TABLE ?auto_195748 ) ( ON ?auto_195745 ?auto_195746 ) ( ON ?auto_195744 ?auto_195745 ) ( ON ?auto_195743 ?auto_195744 ) ( CLEAR ?auto_195743 ) ( HOLDING ?auto_195742 ) ( CLEAR ?auto_195741 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195741 ?auto_195742 )
      ( MAKE-7PILE ?auto_195741 ?auto_195742 ?auto_195743 ?auto_195744 ?auto_195745 ?auto_195746 ?auto_195747 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195749 - BLOCK
      ?auto_195750 - BLOCK
      ?auto_195751 - BLOCK
      ?auto_195752 - BLOCK
      ?auto_195753 - BLOCK
      ?auto_195754 - BLOCK
      ?auto_195755 - BLOCK
    )
    :vars
    (
      ?auto_195756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195749 ) ( not ( = ?auto_195749 ?auto_195750 ) ) ( not ( = ?auto_195749 ?auto_195751 ) ) ( not ( = ?auto_195749 ?auto_195752 ) ) ( not ( = ?auto_195749 ?auto_195753 ) ) ( not ( = ?auto_195749 ?auto_195754 ) ) ( not ( = ?auto_195749 ?auto_195755 ) ) ( not ( = ?auto_195750 ?auto_195751 ) ) ( not ( = ?auto_195750 ?auto_195752 ) ) ( not ( = ?auto_195750 ?auto_195753 ) ) ( not ( = ?auto_195750 ?auto_195754 ) ) ( not ( = ?auto_195750 ?auto_195755 ) ) ( not ( = ?auto_195751 ?auto_195752 ) ) ( not ( = ?auto_195751 ?auto_195753 ) ) ( not ( = ?auto_195751 ?auto_195754 ) ) ( not ( = ?auto_195751 ?auto_195755 ) ) ( not ( = ?auto_195752 ?auto_195753 ) ) ( not ( = ?auto_195752 ?auto_195754 ) ) ( not ( = ?auto_195752 ?auto_195755 ) ) ( not ( = ?auto_195753 ?auto_195754 ) ) ( not ( = ?auto_195753 ?auto_195755 ) ) ( not ( = ?auto_195754 ?auto_195755 ) ) ( ON ?auto_195755 ?auto_195756 ) ( not ( = ?auto_195749 ?auto_195756 ) ) ( not ( = ?auto_195750 ?auto_195756 ) ) ( not ( = ?auto_195751 ?auto_195756 ) ) ( not ( = ?auto_195752 ?auto_195756 ) ) ( not ( = ?auto_195753 ?auto_195756 ) ) ( not ( = ?auto_195754 ?auto_195756 ) ) ( not ( = ?auto_195755 ?auto_195756 ) ) ( ON ?auto_195754 ?auto_195755 ) ( ON-TABLE ?auto_195756 ) ( ON ?auto_195753 ?auto_195754 ) ( ON ?auto_195752 ?auto_195753 ) ( ON ?auto_195751 ?auto_195752 ) ( CLEAR ?auto_195749 ) ( ON ?auto_195750 ?auto_195751 ) ( CLEAR ?auto_195750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195756 ?auto_195755 ?auto_195754 ?auto_195753 ?auto_195752 ?auto_195751 )
      ( MAKE-7PILE ?auto_195749 ?auto_195750 ?auto_195751 ?auto_195752 ?auto_195753 ?auto_195754 ?auto_195755 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195757 - BLOCK
      ?auto_195758 - BLOCK
      ?auto_195759 - BLOCK
      ?auto_195760 - BLOCK
      ?auto_195761 - BLOCK
      ?auto_195762 - BLOCK
      ?auto_195763 - BLOCK
    )
    :vars
    (
      ?auto_195764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195757 ?auto_195758 ) ) ( not ( = ?auto_195757 ?auto_195759 ) ) ( not ( = ?auto_195757 ?auto_195760 ) ) ( not ( = ?auto_195757 ?auto_195761 ) ) ( not ( = ?auto_195757 ?auto_195762 ) ) ( not ( = ?auto_195757 ?auto_195763 ) ) ( not ( = ?auto_195758 ?auto_195759 ) ) ( not ( = ?auto_195758 ?auto_195760 ) ) ( not ( = ?auto_195758 ?auto_195761 ) ) ( not ( = ?auto_195758 ?auto_195762 ) ) ( not ( = ?auto_195758 ?auto_195763 ) ) ( not ( = ?auto_195759 ?auto_195760 ) ) ( not ( = ?auto_195759 ?auto_195761 ) ) ( not ( = ?auto_195759 ?auto_195762 ) ) ( not ( = ?auto_195759 ?auto_195763 ) ) ( not ( = ?auto_195760 ?auto_195761 ) ) ( not ( = ?auto_195760 ?auto_195762 ) ) ( not ( = ?auto_195760 ?auto_195763 ) ) ( not ( = ?auto_195761 ?auto_195762 ) ) ( not ( = ?auto_195761 ?auto_195763 ) ) ( not ( = ?auto_195762 ?auto_195763 ) ) ( ON ?auto_195763 ?auto_195764 ) ( not ( = ?auto_195757 ?auto_195764 ) ) ( not ( = ?auto_195758 ?auto_195764 ) ) ( not ( = ?auto_195759 ?auto_195764 ) ) ( not ( = ?auto_195760 ?auto_195764 ) ) ( not ( = ?auto_195761 ?auto_195764 ) ) ( not ( = ?auto_195762 ?auto_195764 ) ) ( not ( = ?auto_195763 ?auto_195764 ) ) ( ON ?auto_195762 ?auto_195763 ) ( ON-TABLE ?auto_195764 ) ( ON ?auto_195761 ?auto_195762 ) ( ON ?auto_195760 ?auto_195761 ) ( ON ?auto_195759 ?auto_195760 ) ( ON ?auto_195758 ?auto_195759 ) ( CLEAR ?auto_195758 ) ( HOLDING ?auto_195757 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_195757 )
      ( MAKE-7PILE ?auto_195757 ?auto_195758 ?auto_195759 ?auto_195760 ?auto_195761 ?auto_195762 ?auto_195763 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195765 - BLOCK
      ?auto_195766 - BLOCK
      ?auto_195767 - BLOCK
      ?auto_195768 - BLOCK
      ?auto_195769 - BLOCK
      ?auto_195770 - BLOCK
      ?auto_195771 - BLOCK
    )
    :vars
    (
      ?auto_195772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195765 ?auto_195766 ) ) ( not ( = ?auto_195765 ?auto_195767 ) ) ( not ( = ?auto_195765 ?auto_195768 ) ) ( not ( = ?auto_195765 ?auto_195769 ) ) ( not ( = ?auto_195765 ?auto_195770 ) ) ( not ( = ?auto_195765 ?auto_195771 ) ) ( not ( = ?auto_195766 ?auto_195767 ) ) ( not ( = ?auto_195766 ?auto_195768 ) ) ( not ( = ?auto_195766 ?auto_195769 ) ) ( not ( = ?auto_195766 ?auto_195770 ) ) ( not ( = ?auto_195766 ?auto_195771 ) ) ( not ( = ?auto_195767 ?auto_195768 ) ) ( not ( = ?auto_195767 ?auto_195769 ) ) ( not ( = ?auto_195767 ?auto_195770 ) ) ( not ( = ?auto_195767 ?auto_195771 ) ) ( not ( = ?auto_195768 ?auto_195769 ) ) ( not ( = ?auto_195768 ?auto_195770 ) ) ( not ( = ?auto_195768 ?auto_195771 ) ) ( not ( = ?auto_195769 ?auto_195770 ) ) ( not ( = ?auto_195769 ?auto_195771 ) ) ( not ( = ?auto_195770 ?auto_195771 ) ) ( ON ?auto_195771 ?auto_195772 ) ( not ( = ?auto_195765 ?auto_195772 ) ) ( not ( = ?auto_195766 ?auto_195772 ) ) ( not ( = ?auto_195767 ?auto_195772 ) ) ( not ( = ?auto_195768 ?auto_195772 ) ) ( not ( = ?auto_195769 ?auto_195772 ) ) ( not ( = ?auto_195770 ?auto_195772 ) ) ( not ( = ?auto_195771 ?auto_195772 ) ) ( ON ?auto_195770 ?auto_195771 ) ( ON-TABLE ?auto_195772 ) ( ON ?auto_195769 ?auto_195770 ) ( ON ?auto_195768 ?auto_195769 ) ( ON ?auto_195767 ?auto_195768 ) ( ON ?auto_195766 ?auto_195767 ) ( ON ?auto_195765 ?auto_195766 ) ( CLEAR ?auto_195765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195772 ?auto_195771 ?auto_195770 ?auto_195769 ?auto_195768 ?auto_195767 ?auto_195766 )
      ( MAKE-7PILE ?auto_195765 ?auto_195766 ?auto_195767 ?auto_195768 ?auto_195769 ?auto_195770 ?auto_195771 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195773 - BLOCK
      ?auto_195774 - BLOCK
      ?auto_195775 - BLOCK
      ?auto_195776 - BLOCK
      ?auto_195777 - BLOCK
      ?auto_195778 - BLOCK
      ?auto_195779 - BLOCK
    )
    :vars
    (
      ?auto_195780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195773 ?auto_195774 ) ) ( not ( = ?auto_195773 ?auto_195775 ) ) ( not ( = ?auto_195773 ?auto_195776 ) ) ( not ( = ?auto_195773 ?auto_195777 ) ) ( not ( = ?auto_195773 ?auto_195778 ) ) ( not ( = ?auto_195773 ?auto_195779 ) ) ( not ( = ?auto_195774 ?auto_195775 ) ) ( not ( = ?auto_195774 ?auto_195776 ) ) ( not ( = ?auto_195774 ?auto_195777 ) ) ( not ( = ?auto_195774 ?auto_195778 ) ) ( not ( = ?auto_195774 ?auto_195779 ) ) ( not ( = ?auto_195775 ?auto_195776 ) ) ( not ( = ?auto_195775 ?auto_195777 ) ) ( not ( = ?auto_195775 ?auto_195778 ) ) ( not ( = ?auto_195775 ?auto_195779 ) ) ( not ( = ?auto_195776 ?auto_195777 ) ) ( not ( = ?auto_195776 ?auto_195778 ) ) ( not ( = ?auto_195776 ?auto_195779 ) ) ( not ( = ?auto_195777 ?auto_195778 ) ) ( not ( = ?auto_195777 ?auto_195779 ) ) ( not ( = ?auto_195778 ?auto_195779 ) ) ( ON ?auto_195779 ?auto_195780 ) ( not ( = ?auto_195773 ?auto_195780 ) ) ( not ( = ?auto_195774 ?auto_195780 ) ) ( not ( = ?auto_195775 ?auto_195780 ) ) ( not ( = ?auto_195776 ?auto_195780 ) ) ( not ( = ?auto_195777 ?auto_195780 ) ) ( not ( = ?auto_195778 ?auto_195780 ) ) ( not ( = ?auto_195779 ?auto_195780 ) ) ( ON ?auto_195778 ?auto_195779 ) ( ON-TABLE ?auto_195780 ) ( ON ?auto_195777 ?auto_195778 ) ( ON ?auto_195776 ?auto_195777 ) ( ON ?auto_195775 ?auto_195776 ) ( ON ?auto_195774 ?auto_195775 ) ( HOLDING ?auto_195773 ) ( CLEAR ?auto_195774 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_195780 ?auto_195779 ?auto_195778 ?auto_195777 ?auto_195776 ?auto_195775 ?auto_195774 ?auto_195773 )
      ( MAKE-7PILE ?auto_195773 ?auto_195774 ?auto_195775 ?auto_195776 ?auto_195777 ?auto_195778 ?auto_195779 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195781 - BLOCK
      ?auto_195782 - BLOCK
      ?auto_195783 - BLOCK
      ?auto_195784 - BLOCK
      ?auto_195785 - BLOCK
      ?auto_195786 - BLOCK
      ?auto_195787 - BLOCK
    )
    :vars
    (
      ?auto_195788 - BLOCK
      ?auto_195789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195781 ?auto_195782 ) ) ( not ( = ?auto_195781 ?auto_195783 ) ) ( not ( = ?auto_195781 ?auto_195784 ) ) ( not ( = ?auto_195781 ?auto_195785 ) ) ( not ( = ?auto_195781 ?auto_195786 ) ) ( not ( = ?auto_195781 ?auto_195787 ) ) ( not ( = ?auto_195782 ?auto_195783 ) ) ( not ( = ?auto_195782 ?auto_195784 ) ) ( not ( = ?auto_195782 ?auto_195785 ) ) ( not ( = ?auto_195782 ?auto_195786 ) ) ( not ( = ?auto_195782 ?auto_195787 ) ) ( not ( = ?auto_195783 ?auto_195784 ) ) ( not ( = ?auto_195783 ?auto_195785 ) ) ( not ( = ?auto_195783 ?auto_195786 ) ) ( not ( = ?auto_195783 ?auto_195787 ) ) ( not ( = ?auto_195784 ?auto_195785 ) ) ( not ( = ?auto_195784 ?auto_195786 ) ) ( not ( = ?auto_195784 ?auto_195787 ) ) ( not ( = ?auto_195785 ?auto_195786 ) ) ( not ( = ?auto_195785 ?auto_195787 ) ) ( not ( = ?auto_195786 ?auto_195787 ) ) ( ON ?auto_195787 ?auto_195788 ) ( not ( = ?auto_195781 ?auto_195788 ) ) ( not ( = ?auto_195782 ?auto_195788 ) ) ( not ( = ?auto_195783 ?auto_195788 ) ) ( not ( = ?auto_195784 ?auto_195788 ) ) ( not ( = ?auto_195785 ?auto_195788 ) ) ( not ( = ?auto_195786 ?auto_195788 ) ) ( not ( = ?auto_195787 ?auto_195788 ) ) ( ON ?auto_195786 ?auto_195787 ) ( ON-TABLE ?auto_195788 ) ( ON ?auto_195785 ?auto_195786 ) ( ON ?auto_195784 ?auto_195785 ) ( ON ?auto_195783 ?auto_195784 ) ( ON ?auto_195782 ?auto_195783 ) ( CLEAR ?auto_195782 ) ( ON ?auto_195781 ?auto_195789 ) ( CLEAR ?auto_195781 ) ( HAND-EMPTY ) ( not ( = ?auto_195781 ?auto_195789 ) ) ( not ( = ?auto_195782 ?auto_195789 ) ) ( not ( = ?auto_195783 ?auto_195789 ) ) ( not ( = ?auto_195784 ?auto_195789 ) ) ( not ( = ?auto_195785 ?auto_195789 ) ) ( not ( = ?auto_195786 ?auto_195789 ) ) ( not ( = ?auto_195787 ?auto_195789 ) ) ( not ( = ?auto_195788 ?auto_195789 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195781 ?auto_195789 )
      ( MAKE-7PILE ?auto_195781 ?auto_195782 ?auto_195783 ?auto_195784 ?auto_195785 ?auto_195786 ?auto_195787 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195790 - BLOCK
      ?auto_195791 - BLOCK
      ?auto_195792 - BLOCK
      ?auto_195793 - BLOCK
      ?auto_195794 - BLOCK
      ?auto_195795 - BLOCK
      ?auto_195796 - BLOCK
    )
    :vars
    (
      ?auto_195798 - BLOCK
      ?auto_195797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195790 ?auto_195791 ) ) ( not ( = ?auto_195790 ?auto_195792 ) ) ( not ( = ?auto_195790 ?auto_195793 ) ) ( not ( = ?auto_195790 ?auto_195794 ) ) ( not ( = ?auto_195790 ?auto_195795 ) ) ( not ( = ?auto_195790 ?auto_195796 ) ) ( not ( = ?auto_195791 ?auto_195792 ) ) ( not ( = ?auto_195791 ?auto_195793 ) ) ( not ( = ?auto_195791 ?auto_195794 ) ) ( not ( = ?auto_195791 ?auto_195795 ) ) ( not ( = ?auto_195791 ?auto_195796 ) ) ( not ( = ?auto_195792 ?auto_195793 ) ) ( not ( = ?auto_195792 ?auto_195794 ) ) ( not ( = ?auto_195792 ?auto_195795 ) ) ( not ( = ?auto_195792 ?auto_195796 ) ) ( not ( = ?auto_195793 ?auto_195794 ) ) ( not ( = ?auto_195793 ?auto_195795 ) ) ( not ( = ?auto_195793 ?auto_195796 ) ) ( not ( = ?auto_195794 ?auto_195795 ) ) ( not ( = ?auto_195794 ?auto_195796 ) ) ( not ( = ?auto_195795 ?auto_195796 ) ) ( ON ?auto_195796 ?auto_195798 ) ( not ( = ?auto_195790 ?auto_195798 ) ) ( not ( = ?auto_195791 ?auto_195798 ) ) ( not ( = ?auto_195792 ?auto_195798 ) ) ( not ( = ?auto_195793 ?auto_195798 ) ) ( not ( = ?auto_195794 ?auto_195798 ) ) ( not ( = ?auto_195795 ?auto_195798 ) ) ( not ( = ?auto_195796 ?auto_195798 ) ) ( ON ?auto_195795 ?auto_195796 ) ( ON-TABLE ?auto_195798 ) ( ON ?auto_195794 ?auto_195795 ) ( ON ?auto_195793 ?auto_195794 ) ( ON ?auto_195792 ?auto_195793 ) ( ON ?auto_195790 ?auto_195797 ) ( CLEAR ?auto_195790 ) ( not ( = ?auto_195790 ?auto_195797 ) ) ( not ( = ?auto_195791 ?auto_195797 ) ) ( not ( = ?auto_195792 ?auto_195797 ) ) ( not ( = ?auto_195793 ?auto_195797 ) ) ( not ( = ?auto_195794 ?auto_195797 ) ) ( not ( = ?auto_195795 ?auto_195797 ) ) ( not ( = ?auto_195796 ?auto_195797 ) ) ( not ( = ?auto_195798 ?auto_195797 ) ) ( HOLDING ?auto_195791 ) ( CLEAR ?auto_195792 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195798 ?auto_195796 ?auto_195795 ?auto_195794 ?auto_195793 ?auto_195792 ?auto_195791 )
      ( MAKE-7PILE ?auto_195790 ?auto_195791 ?auto_195792 ?auto_195793 ?auto_195794 ?auto_195795 ?auto_195796 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195799 - BLOCK
      ?auto_195800 - BLOCK
      ?auto_195801 - BLOCK
      ?auto_195802 - BLOCK
      ?auto_195803 - BLOCK
      ?auto_195804 - BLOCK
      ?auto_195805 - BLOCK
    )
    :vars
    (
      ?auto_195806 - BLOCK
      ?auto_195807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195799 ?auto_195800 ) ) ( not ( = ?auto_195799 ?auto_195801 ) ) ( not ( = ?auto_195799 ?auto_195802 ) ) ( not ( = ?auto_195799 ?auto_195803 ) ) ( not ( = ?auto_195799 ?auto_195804 ) ) ( not ( = ?auto_195799 ?auto_195805 ) ) ( not ( = ?auto_195800 ?auto_195801 ) ) ( not ( = ?auto_195800 ?auto_195802 ) ) ( not ( = ?auto_195800 ?auto_195803 ) ) ( not ( = ?auto_195800 ?auto_195804 ) ) ( not ( = ?auto_195800 ?auto_195805 ) ) ( not ( = ?auto_195801 ?auto_195802 ) ) ( not ( = ?auto_195801 ?auto_195803 ) ) ( not ( = ?auto_195801 ?auto_195804 ) ) ( not ( = ?auto_195801 ?auto_195805 ) ) ( not ( = ?auto_195802 ?auto_195803 ) ) ( not ( = ?auto_195802 ?auto_195804 ) ) ( not ( = ?auto_195802 ?auto_195805 ) ) ( not ( = ?auto_195803 ?auto_195804 ) ) ( not ( = ?auto_195803 ?auto_195805 ) ) ( not ( = ?auto_195804 ?auto_195805 ) ) ( ON ?auto_195805 ?auto_195806 ) ( not ( = ?auto_195799 ?auto_195806 ) ) ( not ( = ?auto_195800 ?auto_195806 ) ) ( not ( = ?auto_195801 ?auto_195806 ) ) ( not ( = ?auto_195802 ?auto_195806 ) ) ( not ( = ?auto_195803 ?auto_195806 ) ) ( not ( = ?auto_195804 ?auto_195806 ) ) ( not ( = ?auto_195805 ?auto_195806 ) ) ( ON ?auto_195804 ?auto_195805 ) ( ON-TABLE ?auto_195806 ) ( ON ?auto_195803 ?auto_195804 ) ( ON ?auto_195802 ?auto_195803 ) ( ON ?auto_195801 ?auto_195802 ) ( ON ?auto_195799 ?auto_195807 ) ( not ( = ?auto_195799 ?auto_195807 ) ) ( not ( = ?auto_195800 ?auto_195807 ) ) ( not ( = ?auto_195801 ?auto_195807 ) ) ( not ( = ?auto_195802 ?auto_195807 ) ) ( not ( = ?auto_195803 ?auto_195807 ) ) ( not ( = ?auto_195804 ?auto_195807 ) ) ( not ( = ?auto_195805 ?auto_195807 ) ) ( not ( = ?auto_195806 ?auto_195807 ) ) ( CLEAR ?auto_195801 ) ( ON ?auto_195800 ?auto_195799 ) ( CLEAR ?auto_195800 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_195807 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195807 ?auto_195799 )
      ( MAKE-7PILE ?auto_195799 ?auto_195800 ?auto_195801 ?auto_195802 ?auto_195803 ?auto_195804 ?auto_195805 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195808 - BLOCK
      ?auto_195809 - BLOCK
      ?auto_195810 - BLOCK
      ?auto_195811 - BLOCK
      ?auto_195812 - BLOCK
      ?auto_195813 - BLOCK
      ?auto_195814 - BLOCK
    )
    :vars
    (
      ?auto_195816 - BLOCK
      ?auto_195815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195808 ?auto_195809 ) ) ( not ( = ?auto_195808 ?auto_195810 ) ) ( not ( = ?auto_195808 ?auto_195811 ) ) ( not ( = ?auto_195808 ?auto_195812 ) ) ( not ( = ?auto_195808 ?auto_195813 ) ) ( not ( = ?auto_195808 ?auto_195814 ) ) ( not ( = ?auto_195809 ?auto_195810 ) ) ( not ( = ?auto_195809 ?auto_195811 ) ) ( not ( = ?auto_195809 ?auto_195812 ) ) ( not ( = ?auto_195809 ?auto_195813 ) ) ( not ( = ?auto_195809 ?auto_195814 ) ) ( not ( = ?auto_195810 ?auto_195811 ) ) ( not ( = ?auto_195810 ?auto_195812 ) ) ( not ( = ?auto_195810 ?auto_195813 ) ) ( not ( = ?auto_195810 ?auto_195814 ) ) ( not ( = ?auto_195811 ?auto_195812 ) ) ( not ( = ?auto_195811 ?auto_195813 ) ) ( not ( = ?auto_195811 ?auto_195814 ) ) ( not ( = ?auto_195812 ?auto_195813 ) ) ( not ( = ?auto_195812 ?auto_195814 ) ) ( not ( = ?auto_195813 ?auto_195814 ) ) ( ON ?auto_195814 ?auto_195816 ) ( not ( = ?auto_195808 ?auto_195816 ) ) ( not ( = ?auto_195809 ?auto_195816 ) ) ( not ( = ?auto_195810 ?auto_195816 ) ) ( not ( = ?auto_195811 ?auto_195816 ) ) ( not ( = ?auto_195812 ?auto_195816 ) ) ( not ( = ?auto_195813 ?auto_195816 ) ) ( not ( = ?auto_195814 ?auto_195816 ) ) ( ON ?auto_195813 ?auto_195814 ) ( ON-TABLE ?auto_195816 ) ( ON ?auto_195812 ?auto_195813 ) ( ON ?auto_195811 ?auto_195812 ) ( ON ?auto_195808 ?auto_195815 ) ( not ( = ?auto_195808 ?auto_195815 ) ) ( not ( = ?auto_195809 ?auto_195815 ) ) ( not ( = ?auto_195810 ?auto_195815 ) ) ( not ( = ?auto_195811 ?auto_195815 ) ) ( not ( = ?auto_195812 ?auto_195815 ) ) ( not ( = ?auto_195813 ?auto_195815 ) ) ( not ( = ?auto_195814 ?auto_195815 ) ) ( not ( = ?auto_195816 ?auto_195815 ) ) ( ON ?auto_195809 ?auto_195808 ) ( CLEAR ?auto_195809 ) ( ON-TABLE ?auto_195815 ) ( HOLDING ?auto_195810 ) ( CLEAR ?auto_195811 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195816 ?auto_195814 ?auto_195813 ?auto_195812 ?auto_195811 ?auto_195810 )
      ( MAKE-7PILE ?auto_195808 ?auto_195809 ?auto_195810 ?auto_195811 ?auto_195812 ?auto_195813 ?auto_195814 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195817 - BLOCK
      ?auto_195818 - BLOCK
      ?auto_195819 - BLOCK
      ?auto_195820 - BLOCK
      ?auto_195821 - BLOCK
      ?auto_195822 - BLOCK
      ?auto_195823 - BLOCK
    )
    :vars
    (
      ?auto_195824 - BLOCK
      ?auto_195825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195817 ?auto_195818 ) ) ( not ( = ?auto_195817 ?auto_195819 ) ) ( not ( = ?auto_195817 ?auto_195820 ) ) ( not ( = ?auto_195817 ?auto_195821 ) ) ( not ( = ?auto_195817 ?auto_195822 ) ) ( not ( = ?auto_195817 ?auto_195823 ) ) ( not ( = ?auto_195818 ?auto_195819 ) ) ( not ( = ?auto_195818 ?auto_195820 ) ) ( not ( = ?auto_195818 ?auto_195821 ) ) ( not ( = ?auto_195818 ?auto_195822 ) ) ( not ( = ?auto_195818 ?auto_195823 ) ) ( not ( = ?auto_195819 ?auto_195820 ) ) ( not ( = ?auto_195819 ?auto_195821 ) ) ( not ( = ?auto_195819 ?auto_195822 ) ) ( not ( = ?auto_195819 ?auto_195823 ) ) ( not ( = ?auto_195820 ?auto_195821 ) ) ( not ( = ?auto_195820 ?auto_195822 ) ) ( not ( = ?auto_195820 ?auto_195823 ) ) ( not ( = ?auto_195821 ?auto_195822 ) ) ( not ( = ?auto_195821 ?auto_195823 ) ) ( not ( = ?auto_195822 ?auto_195823 ) ) ( ON ?auto_195823 ?auto_195824 ) ( not ( = ?auto_195817 ?auto_195824 ) ) ( not ( = ?auto_195818 ?auto_195824 ) ) ( not ( = ?auto_195819 ?auto_195824 ) ) ( not ( = ?auto_195820 ?auto_195824 ) ) ( not ( = ?auto_195821 ?auto_195824 ) ) ( not ( = ?auto_195822 ?auto_195824 ) ) ( not ( = ?auto_195823 ?auto_195824 ) ) ( ON ?auto_195822 ?auto_195823 ) ( ON-TABLE ?auto_195824 ) ( ON ?auto_195821 ?auto_195822 ) ( ON ?auto_195820 ?auto_195821 ) ( ON ?auto_195817 ?auto_195825 ) ( not ( = ?auto_195817 ?auto_195825 ) ) ( not ( = ?auto_195818 ?auto_195825 ) ) ( not ( = ?auto_195819 ?auto_195825 ) ) ( not ( = ?auto_195820 ?auto_195825 ) ) ( not ( = ?auto_195821 ?auto_195825 ) ) ( not ( = ?auto_195822 ?auto_195825 ) ) ( not ( = ?auto_195823 ?auto_195825 ) ) ( not ( = ?auto_195824 ?auto_195825 ) ) ( ON ?auto_195818 ?auto_195817 ) ( ON-TABLE ?auto_195825 ) ( CLEAR ?auto_195820 ) ( ON ?auto_195819 ?auto_195818 ) ( CLEAR ?auto_195819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195825 ?auto_195817 ?auto_195818 )
      ( MAKE-7PILE ?auto_195817 ?auto_195818 ?auto_195819 ?auto_195820 ?auto_195821 ?auto_195822 ?auto_195823 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195826 - BLOCK
      ?auto_195827 - BLOCK
      ?auto_195828 - BLOCK
      ?auto_195829 - BLOCK
      ?auto_195830 - BLOCK
      ?auto_195831 - BLOCK
      ?auto_195832 - BLOCK
    )
    :vars
    (
      ?auto_195834 - BLOCK
      ?auto_195833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195826 ?auto_195827 ) ) ( not ( = ?auto_195826 ?auto_195828 ) ) ( not ( = ?auto_195826 ?auto_195829 ) ) ( not ( = ?auto_195826 ?auto_195830 ) ) ( not ( = ?auto_195826 ?auto_195831 ) ) ( not ( = ?auto_195826 ?auto_195832 ) ) ( not ( = ?auto_195827 ?auto_195828 ) ) ( not ( = ?auto_195827 ?auto_195829 ) ) ( not ( = ?auto_195827 ?auto_195830 ) ) ( not ( = ?auto_195827 ?auto_195831 ) ) ( not ( = ?auto_195827 ?auto_195832 ) ) ( not ( = ?auto_195828 ?auto_195829 ) ) ( not ( = ?auto_195828 ?auto_195830 ) ) ( not ( = ?auto_195828 ?auto_195831 ) ) ( not ( = ?auto_195828 ?auto_195832 ) ) ( not ( = ?auto_195829 ?auto_195830 ) ) ( not ( = ?auto_195829 ?auto_195831 ) ) ( not ( = ?auto_195829 ?auto_195832 ) ) ( not ( = ?auto_195830 ?auto_195831 ) ) ( not ( = ?auto_195830 ?auto_195832 ) ) ( not ( = ?auto_195831 ?auto_195832 ) ) ( ON ?auto_195832 ?auto_195834 ) ( not ( = ?auto_195826 ?auto_195834 ) ) ( not ( = ?auto_195827 ?auto_195834 ) ) ( not ( = ?auto_195828 ?auto_195834 ) ) ( not ( = ?auto_195829 ?auto_195834 ) ) ( not ( = ?auto_195830 ?auto_195834 ) ) ( not ( = ?auto_195831 ?auto_195834 ) ) ( not ( = ?auto_195832 ?auto_195834 ) ) ( ON ?auto_195831 ?auto_195832 ) ( ON-TABLE ?auto_195834 ) ( ON ?auto_195830 ?auto_195831 ) ( ON ?auto_195826 ?auto_195833 ) ( not ( = ?auto_195826 ?auto_195833 ) ) ( not ( = ?auto_195827 ?auto_195833 ) ) ( not ( = ?auto_195828 ?auto_195833 ) ) ( not ( = ?auto_195829 ?auto_195833 ) ) ( not ( = ?auto_195830 ?auto_195833 ) ) ( not ( = ?auto_195831 ?auto_195833 ) ) ( not ( = ?auto_195832 ?auto_195833 ) ) ( not ( = ?auto_195834 ?auto_195833 ) ) ( ON ?auto_195827 ?auto_195826 ) ( ON-TABLE ?auto_195833 ) ( ON ?auto_195828 ?auto_195827 ) ( CLEAR ?auto_195828 ) ( HOLDING ?auto_195829 ) ( CLEAR ?auto_195830 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195834 ?auto_195832 ?auto_195831 ?auto_195830 ?auto_195829 )
      ( MAKE-7PILE ?auto_195826 ?auto_195827 ?auto_195828 ?auto_195829 ?auto_195830 ?auto_195831 ?auto_195832 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195835 - BLOCK
      ?auto_195836 - BLOCK
      ?auto_195837 - BLOCK
      ?auto_195838 - BLOCK
      ?auto_195839 - BLOCK
      ?auto_195840 - BLOCK
      ?auto_195841 - BLOCK
    )
    :vars
    (
      ?auto_195842 - BLOCK
      ?auto_195843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195835 ?auto_195836 ) ) ( not ( = ?auto_195835 ?auto_195837 ) ) ( not ( = ?auto_195835 ?auto_195838 ) ) ( not ( = ?auto_195835 ?auto_195839 ) ) ( not ( = ?auto_195835 ?auto_195840 ) ) ( not ( = ?auto_195835 ?auto_195841 ) ) ( not ( = ?auto_195836 ?auto_195837 ) ) ( not ( = ?auto_195836 ?auto_195838 ) ) ( not ( = ?auto_195836 ?auto_195839 ) ) ( not ( = ?auto_195836 ?auto_195840 ) ) ( not ( = ?auto_195836 ?auto_195841 ) ) ( not ( = ?auto_195837 ?auto_195838 ) ) ( not ( = ?auto_195837 ?auto_195839 ) ) ( not ( = ?auto_195837 ?auto_195840 ) ) ( not ( = ?auto_195837 ?auto_195841 ) ) ( not ( = ?auto_195838 ?auto_195839 ) ) ( not ( = ?auto_195838 ?auto_195840 ) ) ( not ( = ?auto_195838 ?auto_195841 ) ) ( not ( = ?auto_195839 ?auto_195840 ) ) ( not ( = ?auto_195839 ?auto_195841 ) ) ( not ( = ?auto_195840 ?auto_195841 ) ) ( ON ?auto_195841 ?auto_195842 ) ( not ( = ?auto_195835 ?auto_195842 ) ) ( not ( = ?auto_195836 ?auto_195842 ) ) ( not ( = ?auto_195837 ?auto_195842 ) ) ( not ( = ?auto_195838 ?auto_195842 ) ) ( not ( = ?auto_195839 ?auto_195842 ) ) ( not ( = ?auto_195840 ?auto_195842 ) ) ( not ( = ?auto_195841 ?auto_195842 ) ) ( ON ?auto_195840 ?auto_195841 ) ( ON-TABLE ?auto_195842 ) ( ON ?auto_195839 ?auto_195840 ) ( ON ?auto_195835 ?auto_195843 ) ( not ( = ?auto_195835 ?auto_195843 ) ) ( not ( = ?auto_195836 ?auto_195843 ) ) ( not ( = ?auto_195837 ?auto_195843 ) ) ( not ( = ?auto_195838 ?auto_195843 ) ) ( not ( = ?auto_195839 ?auto_195843 ) ) ( not ( = ?auto_195840 ?auto_195843 ) ) ( not ( = ?auto_195841 ?auto_195843 ) ) ( not ( = ?auto_195842 ?auto_195843 ) ) ( ON ?auto_195836 ?auto_195835 ) ( ON-TABLE ?auto_195843 ) ( ON ?auto_195837 ?auto_195836 ) ( CLEAR ?auto_195839 ) ( ON ?auto_195838 ?auto_195837 ) ( CLEAR ?auto_195838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195843 ?auto_195835 ?auto_195836 ?auto_195837 )
      ( MAKE-7PILE ?auto_195835 ?auto_195836 ?auto_195837 ?auto_195838 ?auto_195839 ?auto_195840 ?auto_195841 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195844 - BLOCK
      ?auto_195845 - BLOCK
      ?auto_195846 - BLOCK
      ?auto_195847 - BLOCK
      ?auto_195848 - BLOCK
      ?auto_195849 - BLOCK
      ?auto_195850 - BLOCK
    )
    :vars
    (
      ?auto_195852 - BLOCK
      ?auto_195851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195844 ?auto_195845 ) ) ( not ( = ?auto_195844 ?auto_195846 ) ) ( not ( = ?auto_195844 ?auto_195847 ) ) ( not ( = ?auto_195844 ?auto_195848 ) ) ( not ( = ?auto_195844 ?auto_195849 ) ) ( not ( = ?auto_195844 ?auto_195850 ) ) ( not ( = ?auto_195845 ?auto_195846 ) ) ( not ( = ?auto_195845 ?auto_195847 ) ) ( not ( = ?auto_195845 ?auto_195848 ) ) ( not ( = ?auto_195845 ?auto_195849 ) ) ( not ( = ?auto_195845 ?auto_195850 ) ) ( not ( = ?auto_195846 ?auto_195847 ) ) ( not ( = ?auto_195846 ?auto_195848 ) ) ( not ( = ?auto_195846 ?auto_195849 ) ) ( not ( = ?auto_195846 ?auto_195850 ) ) ( not ( = ?auto_195847 ?auto_195848 ) ) ( not ( = ?auto_195847 ?auto_195849 ) ) ( not ( = ?auto_195847 ?auto_195850 ) ) ( not ( = ?auto_195848 ?auto_195849 ) ) ( not ( = ?auto_195848 ?auto_195850 ) ) ( not ( = ?auto_195849 ?auto_195850 ) ) ( ON ?auto_195850 ?auto_195852 ) ( not ( = ?auto_195844 ?auto_195852 ) ) ( not ( = ?auto_195845 ?auto_195852 ) ) ( not ( = ?auto_195846 ?auto_195852 ) ) ( not ( = ?auto_195847 ?auto_195852 ) ) ( not ( = ?auto_195848 ?auto_195852 ) ) ( not ( = ?auto_195849 ?auto_195852 ) ) ( not ( = ?auto_195850 ?auto_195852 ) ) ( ON ?auto_195849 ?auto_195850 ) ( ON-TABLE ?auto_195852 ) ( ON ?auto_195844 ?auto_195851 ) ( not ( = ?auto_195844 ?auto_195851 ) ) ( not ( = ?auto_195845 ?auto_195851 ) ) ( not ( = ?auto_195846 ?auto_195851 ) ) ( not ( = ?auto_195847 ?auto_195851 ) ) ( not ( = ?auto_195848 ?auto_195851 ) ) ( not ( = ?auto_195849 ?auto_195851 ) ) ( not ( = ?auto_195850 ?auto_195851 ) ) ( not ( = ?auto_195852 ?auto_195851 ) ) ( ON ?auto_195845 ?auto_195844 ) ( ON-TABLE ?auto_195851 ) ( ON ?auto_195846 ?auto_195845 ) ( ON ?auto_195847 ?auto_195846 ) ( CLEAR ?auto_195847 ) ( HOLDING ?auto_195848 ) ( CLEAR ?auto_195849 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195852 ?auto_195850 ?auto_195849 ?auto_195848 )
      ( MAKE-7PILE ?auto_195844 ?auto_195845 ?auto_195846 ?auto_195847 ?auto_195848 ?auto_195849 ?auto_195850 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195853 - BLOCK
      ?auto_195854 - BLOCK
      ?auto_195855 - BLOCK
      ?auto_195856 - BLOCK
      ?auto_195857 - BLOCK
      ?auto_195858 - BLOCK
      ?auto_195859 - BLOCK
    )
    :vars
    (
      ?auto_195860 - BLOCK
      ?auto_195861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195853 ?auto_195854 ) ) ( not ( = ?auto_195853 ?auto_195855 ) ) ( not ( = ?auto_195853 ?auto_195856 ) ) ( not ( = ?auto_195853 ?auto_195857 ) ) ( not ( = ?auto_195853 ?auto_195858 ) ) ( not ( = ?auto_195853 ?auto_195859 ) ) ( not ( = ?auto_195854 ?auto_195855 ) ) ( not ( = ?auto_195854 ?auto_195856 ) ) ( not ( = ?auto_195854 ?auto_195857 ) ) ( not ( = ?auto_195854 ?auto_195858 ) ) ( not ( = ?auto_195854 ?auto_195859 ) ) ( not ( = ?auto_195855 ?auto_195856 ) ) ( not ( = ?auto_195855 ?auto_195857 ) ) ( not ( = ?auto_195855 ?auto_195858 ) ) ( not ( = ?auto_195855 ?auto_195859 ) ) ( not ( = ?auto_195856 ?auto_195857 ) ) ( not ( = ?auto_195856 ?auto_195858 ) ) ( not ( = ?auto_195856 ?auto_195859 ) ) ( not ( = ?auto_195857 ?auto_195858 ) ) ( not ( = ?auto_195857 ?auto_195859 ) ) ( not ( = ?auto_195858 ?auto_195859 ) ) ( ON ?auto_195859 ?auto_195860 ) ( not ( = ?auto_195853 ?auto_195860 ) ) ( not ( = ?auto_195854 ?auto_195860 ) ) ( not ( = ?auto_195855 ?auto_195860 ) ) ( not ( = ?auto_195856 ?auto_195860 ) ) ( not ( = ?auto_195857 ?auto_195860 ) ) ( not ( = ?auto_195858 ?auto_195860 ) ) ( not ( = ?auto_195859 ?auto_195860 ) ) ( ON ?auto_195858 ?auto_195859 ) ( ON-TABLE ?auto_195860 ) ( ON ?auto_195853 ?auto_195861 ) ( not ( = ?auto_195853 ?auto_195861 ) ) ( not ( = ?auto_195854 ?auto_195861 ) ) ( not ( = ?auto_195855 ?auto_195861 ) ) ( not ( = ?auto_195856 ?auto_195861 ) ) ( not ( = ?auto_195857 ?auto_195861 ) ) ( not ( = ?auto_195858 ?auto_195861 ) ) ( not ( = ?auto_195859 ?auto_195861 ) ) ( not ( = ?auto_195860 ?auto_195861 ) ) ( ON ?auto_195854 ?auto_195853 ) ( ON-TABLE ?auto_195861 ) ( ON ?auto_195855 ?auto_195854 ) ( ON ?auto_195856 ?auto_195855 ) ( CLEAR ?auto_195858 ) ( ON ?auto_195857 ?auto_195856 ) ( CLEAR ?auto_195857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195861 ?auto_195853 ?auto_195854 ?auto_195855 ?auto_195856 )
      ( MAKE-7PILE ?auto_195853 ?auto_195854 ?auto_195855 ?auto_195856 ?auto_195857 ?auto_195858 ?auto_195859 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195862 - BLOCK
      ?auto_195863 - BLOCK
      ?auto_195864 - BLOCK
      ?auto_195865 - BLOCK
      ?auto_195866 - BLOCK
      ?auto_195867 - BLOCK
      ?auto_195868 - BLOCK
    )
    :vars
    (
      ?auto_195869 - BLOCK
      ?auto_195870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195862 ?auto_195863 ) ) ( not ( = ?auto_195862 ?auto_195864 ) ) ( not ( = ?auto_195862 ?auto_195865 ) ) ( not ( = ?auto_195862 ?auto_195866 ) ) ( not ( = ?auto_195862 ?auto_195867 ) ) ( not ( = ?auto_195862 ?auto_195868 ) ) ( not ( = ?auto_195863 ?auto_195864 ) ) ( not ( = ?auto_195863 ?auto_195865 ) ) ( not ( = ?auto_195863 ?auto_195866 ) ) ( not ( = ?auto_195863 ?auto_195867 ) ) ( not ( = ?auto_195863 ?auto_195868 ) ) ( not ( = ?auto_195864 ?auto_195865 ) ) ( not ( = ?auto_195864 ?auto_195866 ) ) ( not ( = ?auto_195864 ?auto_195867 ) ) ( not ( = ?auto_195864 ?auto_195868 ) ) ( not ( = ?auto_195865 ?auto_195866 ) ) ( not ( = ?auto_195865 ?auto_195867 ) ) ( not ( = ?auto_195865 ?auto_195868 ) ) ( not ( = ?auto_195866 ?auto_195867 ) ) ( not ( = ?auto_195866 ?auto_195868 ) ) ( not ( = ?auto_195867 ?auto_195868 ) ) ( ON ?auto_195868 ?auto_195869 ) ( not ( = ?auto_195862 ?auto_195869 ) ) ( not ( = ?auto_195863 ?auto_195869 ) ) ( not ( = ?auto_195864 ?auto_195869 ) ) ( not ( = ?auto_195865 ?auto_195869 ) ) ( not ( = ?auto_195866 ?auto_195869 ) ) ( not ( = ?auto_195867 ?auto_195869 ) ) ( not ( = ?auto_195868 ?auto_195869 ) ) ( ON-TABLE ?auto_195869 ) ( ON ?auto_195862 ?auto_195870 ) ( not ( = ?auto_195862 ?auto_195870 ) ) ( not ( = ?auto_195863 ?auto_195870 ) ) ( not ( = ?auto_195864 ?auto_195870 ) ) ( not ( = ?auto_195865 ?auto_195870 ) ) ( not ( = ?auto_195866 ?auto_195870 ) ) ( not ( = ?auto_195867 ?auto_195870 ) ) ( not ( = ?auto_195868 ?auto_195870 ) ) ( not ( = ?auto_195869 ?auto_195870 ) ) ( ON ?auto_195863 ?auto_195862 ) ( ON-TABLE ?auto_195870 ) ( ON ?auto_195864 ?auto_195863 ) ( ON ?auto_195865 ?auto_195864 ) ( ON ?auto_195866 ?auto_195865 ) ( CLEAR ?auto_195866 ) ( HOLDING ?auto_195867 ) ( CLEAR ?auto_195868 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195869 ?auto_195868 ?auto_195867 )
      ( MAKE-7PILE ?auto_195862 ?auto_195863 ?auto_195864 ?auto_195865 ?auto_195866 ?auto_195867 ?auto_195868 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195871 - BLOCK
      ?auto_195872 - BLOCK
      ?auto_195873 - BLOCK
      ?auto_195874 - BLOCK
      ?auto_195875 - BLOCK
      ?auto_195876 - BLOCK
      ?auto_195877 - BLOCK
    )
    :vars
    (
      ?auto_195878 - BLOCK
      ?auto_195879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195871 ?auto_195872 ) ) ( not ( = ?auto_195871 ?auto_195873 ) ) ( not ( = ?auto_195871 ?auto_195874 ) ) ( not ( = ?auto_195871 ?auto_195875 ) ) ( not ( = ?auto_195871 ?auto_195876 ) ) ( not ( = ?auto_195871 ?auto_195877 ) ) ( not ( = ?auto_195872 ?auto_195873 ) ) ( not ( = ?auto_195872 ?auto_195874 ) ) ( not ( = ?auto_195872 ?auto_195875 ) ) ( not ( = ?auto_195872 ?auto_195876 ) ) ( not ( = ?auto_195872 ?auto_195877 ) ) ( not ( = ?auto_195873 ?auto_195874 ) ) ( not ( = ?auto_195873 ?auto_195875 ) ) ( not ( = ?auto_195873 ?auto_195876 ) ) ( not ( = ?auto_195873 ?auto_195877 ) ) ( not ( = ?auto_195874 ?auto_195875 ) ) ( not ( = ?auto_195874 ?auto_195876 ) ) ( not ( = ?auto_195874 ?auto_195877 ) ) ( not ( = ?auto_195875 ?auto_195876 ) ) ( not ( = ?auto_195875 ?auto_195877 ) ) ( not ( = ?auto_195876 ?auto_195877 ) ) ( ON ?auto_195877 ?auto_195878 ) ( not ( = ?auto_195871 ?auto_195878 ) ) ( not ( = ?auto_195872 ?auto_195878 ) ) ( not ( = ?auto_195873 ?auto_195878 ) ) ( not ( = ?auto_195874 ?auto_195878 ) ) ( not ( = ?auto_195875 ?auto_195878 ) ) ( not ( = ?auto_195876 ?auto_195878 ) ) ( not ( = ?auto_195877 ?auto_195878 ) ) ( ON-TABLE ?auto_195878 ) ( ON ?auto_195871 ?auto_195879 ) ( not ( = ?auto_195871 ?auto_195879 ) ) ( not ( = ?auto_195872 ?auto_195879 ) ) ( not ( = ?auto_195873 ?auto_195879 ) ) ( not ( = ?auto_195874 ?auto_195879 ) ) ( not ( = ?auto_195875 ?auto_195879 ) ) ( not ( = ?auto_195876 ?auto_195879 ) ) ( not ( = ?auto_195877 ?auto_195879 ) ) ( not ( = ?auto_195878 ?auto_195879 ) ) ( ON ?auto_195872 ?auto_195871 ) ( ON-TABLE ?auto_195879 ) ( ON ?auto_195873 ?auto_195872 ) ( ON ?auto_195874 ?auto_195873 ) ( ON ?auto_195875 ?auto_195874 ) ( CLEAR ?auto_195877 ) ( ON ?auto_195876 ?auto_195875 ) ( CLEAR ?auto_195876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195879 ?auto_195871 ?auto_195872 ?auto_195873 ?auto_195874 ?auto_195875 )
      ( MAKE-7PILE ?auto_195871 ?auto_195872 ?auto_195873 ?auto_195874 ?auto_195875 ?auto_195876 ?auto_195877 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195880 - BLOCK
      ?auto_195881 - BLOCK
      ?auto_195882 - BLOCK
      ?auto_195883 - BLOCK
      ?auto_195884 - BLOCK
      ?auto_195885 - BLOCK
      ?auto_195886 - BLOCK
    )
    :vars
    (
      ?auto_195888 - BLOCK
      ?auto_195887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195880 ?auto_195881 ) ) ( not ( = ?auto_195880 ?auto_195882 ) ) ( not ( = ?auto_195880 ?auto_195883 ) ) ( not ( = ?auto_195880 ?auto_195884 ) ) ( not ( = ?auto_195880 ?auto_195885 ) ) ( not ( = ?auto_195880 ?auto_195886 ) ) ( not ( = ?auto_195881 ?auto_195882 ) ) ( not ( = ?auto_195881 ?auto_195883 ) ) ( not ( = ?auto_195881 ?auto_195884 ) ) ( not ( = ?auto_195881 ?auto_195885 ) ) ( not ( = ?auto_195881 ?auto_195886 ) ) ( not ( = ?auto_195882 ?auto_195883 ) ) ( not ( = ?auto_195882 ?auto_195884 ) ) ( not ( = ?auto_195882 ?auto_195885 ) ) ( not ( = ?auto_195882 ?auto_195886 ) ) ( not ( = ?auto_195883 ?auto_195884 ) ) ( not ( = ?auto_195883 ?auto_195885 ) ) ( not ( = ?auto_195883 ?auto_195886 ) ) ( not ( = ?auto_195884 ?auto_195885 ) ) ( not ( = ?auto_195884 ?auto_195886 ) ) ( not ( = ?auto_195885 ?auto_195886 ) ) ( not ( = ?auto_195880 ?auto_195888 ) ) ( not ( = ?auto_195881 ?auto_195888 ) ) ( not ( = ?auto_195882 ?auto_195888 ) ) ( not ( = ?auto_195883 ?auto_195888 ) ) ( not ( = ?auto_195884 ?auto_195888 ) ) ( not ( = ?auto_195885 ?auto_195888 ) ) ( not ( = ?auto_195886 ?auto_195888 ) ) ( ON-TABLE ?auto_195888 ) ( ON ?auto_195880 ?auto_195887 ) ( not ( = ?auto_195880 ?auto_195887 ) ) ( not ( = ?auto_195881 ?auto_195887 ) ) ( not ( = ?auto_195882 ?auto_195887 ) ) ( not ( = ?auto_195883 ?auto_195887 ) ) ( not ( = ?auto_195884 ?auto_195887 ) ) ( not ( = ?auto_195885 ?auto_195887 ) ) ( not ( = ?auto_195886 ?auto_195887 ) ) ( not ( = ?auto_195888 ?auto_195887 ) ) ( ON ?auto_195881 ?auto_195880 ) ( ON-TABLE ?auto_195887 ) ( ON ?auto_195882 ?auto_195881 ) ( ON ?auto_195883 ?auto_195882 ) ( ON ?auto_195884 ?auto_195883 ) ( ON ?auto_195885 ?auto_195884 ) ( CLEAR ?auto_195885 ) ( HOLDING ?auto_195886 ) ( CLEAR ?auto_195888 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195888 ?auto_195886 )
      ( MAKE-7PILE ?auto_195880 ?auto_195881 ?auto_195882 ?auto_195883 ?auto_195884 ?auto_195885 ?auto_195886 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195889 - BLOCK
      ?auto_195890 - BLOCK
      ?auto_195891 - BLOCK
      ?auto_195892 - BLOCK
      ?auto_195893 - BLOCK
      ?auto_195894 - BLOCK
      ?auto_195895 - BLOCK
    )
    :vars
    (
      ?auto_195897 - BLOCK
      ?auto_195896 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195889 ?auto_195890 ) ) ( not ( = ?auto_195889 ?auto_195891 ) ) ( not ( = ?auto_195889 ?auto_195892 ) ) ( not ( = ?auto_195889 ?auto_195893 ) ) ( not ( = ?auto_195889 ?auto_195894 ) ) ( not ( = ?auto_195889 ?auto_195895 ) ) ( not ( = ?auto_195890 ?auto_195891 ) ) ( not ( = ?auto_195890 ?auto_195892 ) ) ( not ( = ?auto_195890 ?auto_195893 ) ) ( not ( = ?auto_195890 ?auto_195894 ) ) ( not ( = ?auto_195890 ?auto_195895 ) ) ( not ( = ?auto_195891 ?auto_195892 ) ) ( not ( = ?auto_195891 ?auto_195893 ) ) ( not ( = ?auto_195891 ?auto_195894 ) ) ( not ( = ?auto_195891 ?auto_195895 ) ) ( not ( = ?auto_195892 ?auto_195893 ) ) ( not ( = ?auto_195892 ?auto_195894 ) ) ( not ( = ?auto_195892 ?auto_195895 ) ) ( not ( = ?auto_195893 ?auto_195894 ) ) ( not ( = ?auto_195893 ?auto_195895 ) ) ( not ( = ?auto_195894 ?auto_195895 ) ) ( not ( = ?auto_195889 ?auto_195897 ) ) ( not ( = ?auto_195890 ?auto_195897 ) ) ( not ( = ?auto_195891 ?auto_195897 ) ) ( not ( = ?auto_195892 ?auto_195897 ) ) ( not ( = ?auto_195893 ?auto_195897 ) ) ( not ( = ?auto_195894 ?auto_195897 ) ) ( not ( = ?auto_195895 ?auto_195897 ) ) ( ON-TABLE ?auto_195897 ) ( ON ?auto_195889 ?auto_195896 ) ( not ( = ?auto_195889 ?auto_195896 ) ) ( not ( = ?auto_195890 ?auto_195896 ) ) ( not ( = ?auto_195891 ?auto_195896 ) ) ( not ( = ?auto_195892 ?auto_195896 ) ) ( not ( = ?auto_195893 ?auto_195896 ) ) ( not ( = ?auto_195894 ?auto_195896 ) ) ( not ( = ?auto_195895 ?auto_195896 ) ) ( not ( = ?auto_195897 ?auto_195896 ) ) ( ON ?auto_195890 ?auto_195889 ) ( ON-TABLE ?auto_195896 ) ( ON ?auto_195891 ?auto_195890 ) ( ON ?auto_195892 ?auto_195891 ) ( ON ?auto_195893 ?auto_195892 ) ( ON ?auto_195894 ?auto_195893 ) ( CLEAR ?auto_195897 ) ( ON ?auto_195895 ?auto_195894 ) ( CLEAR ?auto_195895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195896 ?auto_195889 ?auto_195890 ?auto_195891 ?auto_195892 ?auto_195893 ?auto_195894 )
      ( MAKE-7PILE ?auto_195889 ?auto_195890 ?auto_195891 ?auto_195892 ?auto_195893 ?auto_195894 ?auto_195895 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195898 - BLOCK
      ?auto_195899 - BLOCK
      ?auto_195900 - BLOCK
      ?auto_195901 - BLOCK
      ?auto_195902 - BLOCK
      ?auto_195903 - BLOCK
      ?auto_195904 - BLOCK
    )
    :vars
    (
      ?auto_195906 - BLOCK
      ?auto_195905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195898 ?auto_195899 ) ) ( not ( = ?auto_195898 ?auto_195900 ) ) ( not ( = ?auto_195898 ?auto_195901 ) ) ( not ( = ?auto_195898 ?auto_195902 ) ) ( not ( = ?auto_195898 ?auto_195903 ) ) ( not ( = ?auto_195898 ?auto_195904 ) ) ( not ( = ?auto_195899 ?auto_195900 ) ) ( not ( = ?auto_195899 ?auto_195901 ) ) ( not ( = ?auto_195899 ?auto_195902 ) ) ( not ( = ?auto_195899 ?auto_195903 ) ) ( not ( = ?auto_195899 ?auto_195904 ) ) ( not ( = ?auto_195900 ?auto_195901 ) ) ( not ( = ?auto_195900 ?auto_195902 ) ) ( not ( = ?auto_195900 ?auto_195903 ) ) ( not ( = ?auto_195900 ?auto_195904 ) ) ( not ( = ?auto_195901 ?auto_195902 ) ) ( not ( = ?auto_195901 ?auto_195903 ) ) ( not ( = ?auto_195901 ?auto_195904 ) ) ( not ( = ?auto_195902 ?auto_195903 ) ) ( not ( = ?auto_195902 ?auto_195904 ) ) ( not ( = ?auto_195903 ?auto_195904 ) ) ( not ( = ?auto_195898 ?auto_195906 ) ) ( not ( = ?auto_195899 ?auto_195906 ) ) ( not ( = ?auto_195900 ?auto_195906 ) ) ( not ( = ?auto_195901 ?auto_195906 ) ) ( not ( = ?auto_195902 ?auto_195906 ) ) ( not ( = ?auto_195903 ?auto_195906 ) ) ( not ( = ?auto_195904 ?auto_195906 ) ) ( ON ?auto_195898 ?auto_195905 ) ( not ( = ?auto_195898 ?auto_195905 ) ) ( not ( = ?auto_195899 ?auto_195905 ) ) ( not ( = ?auto_195900 ?auto_195905 ) ) ( not ( = ?auto_195901 ?auto_195905 ) ) ( not ( = ?auto_195902 ?auto_195905 ) ) ( not ( = ?auto_195903 ?auto_195905 ) ) ( not ( = ?auto_195904 ?auto_195905 ) ) ( not ( = ?auto_195906 ?auto_195905 ) ) ( ON ?auto_195899 ?auto_195898 ) ( ON-TABLE ?auto_195905 ) ( ON ?auto_195900 ?auto_195899 ) ( ON ?auto_195901 ?auto_195900 ) ( ON ?auto_195902 ?auto_195901 ) ( ON ?auto_195903 ?auto_195902 ) ( ON ?auto_195904 ?auto_195903 ) ( CLEAR ?auto_195904 ) ( HOLDING ?auto_195906 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_195906 )
      ( MAKE-7PILE ?auto_195898 ?auto_195899 ?auto_195900 ?auto_195901 ?auto_195902 ?auto_195903 ?auto_195904 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_195907 - BLOCK
      ?auto_195908 - BLOCK
      ?auto_195909 - BLOCK
      ?auto_195910 - BLOCK
      ?auto_195911 - BLOCK
      ?auto_195912 - BLOCK
      ?auto_195913 - BLOCK
    )
    :vars
    (
      ?auto_195915 - BLOCK
      ?auto_195914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_195907 ?auto_195908 ) ) ( not ( = ?auto_195907 ?auto_195909 ) ) ( not ( = ?auto_195907 ?auto_195910 ) ) ( not ( = ?auto_195907 ?auto_195911 ) ) ( not ( = ?auto_195907 ?auto_195912 ) ) ( not ( = ?auto_195907 ?auto_195913 ) ) ( not ( = ?auto_195908 ?auto_195909 ) ) ( not ( = ?auto_195908 ?auto_195910 ) ) ( not ( = ?auto_195908 ?auto_195911 ) ) ( not ( = ?auto_195908 ?auto_195912 ) ) ( not ( = ?auto_195908 ?auto_195913 ) ) ( not ( = ?auto_195909 ?auto_195910 ) ) ( not ( = ?auto_195909 ?auto_195911 ) ) ( not ( = ?auto_195909 ?auto_195912 ) ) ( not ( = ?auto_195909 ?auto_195913 ) ) ( not ( = ?auto_195910 ?auto_195911 ) ) ( not ( = ?auto_195910 ?auto_195912 ) ) ( not ( = ?auto_195910 ?auto_195913 ) ) ( not ( = ?auto_195911 ?auto_195912 ) ) ( not ( = ?auto_195911 ?auto_195913 ) ) ( not ( = ?auto_195912 ?auto_195913 ) ) ( not ( = ?auto_195907 ?auto_195915 ) ) ( not ( = ?auto_195908 ?auto_195915 ) ) ( not ( = ?auto_195909 ?auto_195915 ) ) ( not ( = ?auto_195910 ?auto_195915 ) ) ( not ( = ?auto_195911 ?auto_195915 ) ) ( not ( = ?auto_195912 ?auto_195915 ) ) ( not ( = ?auto_195913 ?auto_195915 ) ) ( ON ?auto_195907 ?auto_195914 ) ( not ( = ?auto_195907 ?auto_195914 ) ) ( not ( = ?auto_195908 ?auto_195914 ) ) ( not ( = ?auto_195909 ?auto_195914 ) ) ( not ( = ?auto_195910 ?auto_195914 ) ) ( not ( = ?auto_195911 ?auto_195914 ) ) ( not ( = ?auto_195912 ?auto_195914 ) ) ( not ( = ?auto_195913 ?auto_195914 ) ) ( not ( = ?auto_195915 ?auto_195914 ) ) ( ON ?auto_195908 ?auto_195907 ) ( ON-TABLE ?auto_195914 ) ( ON ?auto_195909 ?auto_195908 ) ( ON ?auto_195910 ?auto_195909 ) ( ON ?auto_195911 ?auto_195910 ) ( ON ?auto_195912 ?auto_195911 ) ( ON ?auto_195913 ?auto_195912 ) ( ON ?auto_195915 ?auto_195913 ) ( CLEAR ?auto_195915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_195914 ?auto_195907 ?auto_195908 ?auto_195909 ?auto_195910 ?auto_195911 ?auto_195912 ?auto_195913 )
      ( MAKE-7PILE ?auto_195907 ?auto_195908 ?auto_195909 ?auto_195910 ?auto_195911 ?auto_195912 ?auto_195913 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195924 - BLOCK
      ?auto_195925 - BLOCK
      ?auto_195926 - BLOCK
      ?auto_195927 - BLOCK
      ?auto_195928 - BLOCK
      ?auto_195929 - BLOCK
      ?auto_195930 - BLOCK
      ?auto_195931 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_195931 ) ( CLEAR ?auto_195930 ) ( ON-TABLE ?auto_195924 ) ( ON ?auto_195925 ?auto_195924 ) ( ON ?auto_195926 ?auto_195925 ) ( ON ?auto_195927 ?auto_195926 ) ( ON ?auto_195928 ?auto_195927 ) ( ON ?auto_195929 ?auto_195928 ) ( ON ?auto_195930 ?auto_195929 ) ( not ( = ?auto_195924 ?auto_195925 ) ) ( not ( = ?auto_195924 ?auto_195926 ) ) ( not ( = ?auto_195924 ?auto_195927 ) ) ( not ( = ?auto_195924 ?auto_195928 ) ) ( not ( = ?auto_195924 ?auto_195929 ) ) ( not ( = ?auto_195924 ?auto_195930 ) ) ( not ( = ?auto_195924 ?auto_195931 ) ) ( not ( = ?auto_195925 ?auto_195926 ) ) ( not ( = ?auto_195925 ?auto_195927 ) ) ( not ( = ?auto_195925 ?auto_195928 ) ) ( not ( = ?auto_195925 ?auto_195929 ) ) ( not ( = ?auto_195925 ?auto_195930 ) ) ( not ( = ?auto_195925 ?auto_195931 ) ) ( not ( = ?auto_195926 ?auto_195927 ) ) ( not ( = ?auto_195926 ?auto_195928 ) ) ( not ( = ?auto_195926 ?auto_195929 ) ) ( not ( = ?auto_195926 ?auto_195930 ) ) ( not ( = ?auto_195926 ?auto_195931 ) ) ( not ( = ?auto_195927 ?auto_195928 ) ) ( not ( = ?auto_195927 ?auto_195929 ) ) ( not ( = ?auto_195927 ?auto_195930 ) ) ( not ( = ?auto_195927 ?auto_195931 ) ) ( not ( = ?auto_195928 ?auto_195929 ) ) ( not ( = ?auto_195928 ?auto_195930 ) ) ( not ( = ?auto_195928 ?auto_195931 ) ) ( not ( = ?auto_195929 ?auto_195930 ) ) ( not ( = ?auto_195929 ?auto_195931 ) ) ( not ( = ?auto_195930 ?auto_195931 ) ) )
    :subtasks
    ( ( !STACK ?auto_195931 ?auto_195930 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195932 - BLOCK
      ?auto_195933 - BLOCK
      ?auto_195934 - BLOCK
      ?auto_195935 - BLOCK
      ?auto_195936 - BLOCK
      ?auto_195937 - BLOCK
      ?auto_195938 - BLOCK
      ?auto_195939 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_195938 ) ( ON-TABLE ?auto_195932 ) ( ON ?auto_195933 ?auto_195932 ) ( ON ?auto_195934 ?auto_195933 ) ( ON ?auto_195935 ?auto_195934 ) ( ON ?auto_195936 ?auto_195935 ) ( ON ?auto_195937 ?auto_195936 ) ( ON ?auto_195938 ?auto_195937 ) ( not ( = ?auto_195932 ?auto_195933 ) ) ( not ( = ?auto_195932 ?auto_195934 ) ) ( not ( = ?auto_195932 ?auto_195935 ) ) ( not ( = ?auto_195932 ?auto_195936 ) ) ( not ( = ?auto_195932 ?auto_195937 ) ) ( not ( = ?auto_195932 ?auto_195938 ) ) ( not ( = ?auto_195932 ?auto_195939 ) ) ( not ( = ?auto_195933 ?auto_195934 ) ) ( not ( = ?auto_195933 ?auto_195935 ) ) ( not ( = ?auto_195933 ?auto_195936 ) ) ( not ( = ?auto_195933 ?auto_195937 ) ) ( not ( = ?auto_195933 ?auto_195938 ) ) ( not ( = ?auto_195933 ?auto_195939 ) ) ( not ( = ?auto_195934 ?auto_195935 ) ) ( not ( = ?auto_195934 ?auto_195936 ) ) ( not ( = ?auto_195934 ?auto_195937 ) ) ( not ( = ?auto_195934 ?auto_195938 ) ) ( not ( = ?auto_195934 ?auto_195939 ) ) ( not ( = ?auto_195935 ?auto_195936 ) ) ( not ( = ?auto_195935 ?auto_195937 ) ) ( not ( = ?auto_195935 ?auto_195938 ) ) ( not ( = ?auto_195935 ?auto_195939 ) ) ( not ( = ?auto_195936 ?auto_195937 ) ) ( not ( = ?auto_195936 ?auto_195938 ) ) ( not ( = ?auto_195936 ?auto_195939 ) ) ( not ( = ?auto_195937 ?auto_195938 ) ) ( not ( = ?auto_195937 ?auto_195939 ) ) ( not ( = ?auto_195938 ?auto_195939 ) ) ( ON-TABLE ?auto_195939 ) ( CLEAR ?auto_195939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_195939 )
      ( MAKE-8PILE ?auto_195932 ?auto_195933 ?auto_195934 ?auto_195935 ?auto_195936 ?auto_195937 ?auto_195938 ?auto_195939 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195940 - BLOCK
      ?auto_195941 - BLOCK
      ?auto_195942 - BLOCK
      ?auto_195943 - BLOCK
      ?auto_195944 - BLOCK
      ?auto_195945 - BLOCK
      ?auto_195946 - BLOCK
      ?auto_195947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195940 ) ( ON ?auto_195941 ?auto_195940 ) ( ON ?auto_195942 ?auto_195941 ) ( ON ?auto_195943 ?auto_195942 ) ( ON ?auto_195944 ?auto_195943 ) ( ON ?auto_195945 ?auto_195944 ) ( not ( = ?auto_195940 ?auto_195941 ) ) ( not ( = ?auto_195940 ?auto_195942 ) ) ( not ( = ?auto_195940 ?auto_195943 ) ) ( not ( = ?auto_195940 ?auto_195944 ) ) ( not ( = ?auto_195940 ?auto_195945 ) ) ( not ( = ?auto_195940 ?auto_195946 ) ) ( not ( = ?auto_195940 ?auto_195947 ) ) ( not ( = ?auto_195941 ?auto_195942 ) ) ( not ( = ?auto_195941 ?auto_195943 ) ) ( not ( = ?auto_195941 ?auto_195944 ) ) ( not ( = ?auto_195941 ?auto_195945 ) ) ( not ( = ?auto_195941 ?auto_195946 ) ) ( not ( = ?auto_195941 ?auto_195947 ) ) ( not ( = ?auto_195942 ?auto_195943 ) ) ( not ( = ?auto_195942 ?auto_195944 ) ) ( not ( = ?auto_195942 ?auto_195945 ) ) ( not ( = ?auto_195942 ?auto_195946 ) ) ( not ( = ?auto_195942 ?auto_195947 ) ) ( not ( = ?auto_195943 ?auto_195944 ) ) ( not ( = ?auto_195943 ?auto_195945 ) ) ( not ( = ?auto_195943 ?auto_195946 ) ) ( not ( = ?auto_195943 ?auto_195947 ) ) ( not ( = ?auto_195944 ?auto_195945 ) ) ( not ( = ?auto_195944 ?auto_195946 ) ) ( not ( = ?auto_195944 ?auto_195947 ) ) ( not ( = ?auto_195945 ?auto_195946 ) ) ( not ( = ?auto_195945 ?auto_195947 ) ) ( not ( = ?auto_195946 ?auto_195947 ) ) ( ON-TABLE ?auto_195947 ) ( CLEAR ?auto_195947 ) ( HOLDING ?auto_195946 ) ( CLEAR ?auto_195945 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_195940 ?auto_195941 ?auto_195942 ?auto_195943 ?auto_195944 ?auto_195945 ?auto_195946 )
      ( MAKE-8PILE ?auto_195940 ?auto_195941 ?auto_195942 ?auto_195943 ?auto_195944 ?auto_195945 ?auto_195946 ?auto_195947 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195948 - BLOCK
      ?auto_195949 - BLOCK
      ?auto_195950 - BLOCK
      ?auto_195951 - BLOCK
      ?auto_195952 - BLOCK
      ?auto_195953 - BLOCK
      ?auto_195954 - BLOCK
      ?auto_195955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195948 ) ( ON ?auto_195949 ?auto_195948 ) ( ON ?auto_195950 ?auto_195949 ) ( ON ?auto_195951 ?auto_195950 ) ( ON ?auto_195952 ?auto_195951 ) ( ON ?auto_195953 ?auto_195952 ) ( not ( = ?auto_195948 ?auto_195949 ) ) ( not ( = ?auto_195948 ?auto_195950 ) ) ( not ( = ?auto_195948 ?auto_195951 ) ) ( not ( = ?auto_195948 ?auto_195952 ) ) ( not ( = ?auto_195948 ?auto_195953 ) ) ( not ( = ?auto_195948 ?auto_195954 ) ) ( not ( = ?auto_195948 ?auto_195955 ) ) ( not ( = ?auto_195949 ?auto_195950 ) ) ( not ( = ?auto_195949 ?auto_195951 ) ) ( not ( = ?auto_195949 ?auto_195952 ) ) ( not ( = ?auto_195949 ?auto_195953 ) ) ( not ( = ?auto_195949 ?auto_195954 ) ) ( not ( = ?auto_195949 ?auto_195955 ) ) ( not ( = ?auto_195950 ?auto_195951 ) ) ( not ( = ?auto_195950 ?auto_195952 ) ) ( not ( = ?auto_195950 ?auto_195953 ) ) ( not ( = ?auto_195950 ?auto_195954 ) ) ( not ( = ?auto_195950 ?auto_195955 ) ) ( not ( = ?auto_195951 ?auto_195952 ) ) ( not ( = ?auto_195951 ?auto_195953 ) ) ( not ( = ?auto_195951 ?auto_195954 ) ) ( not ( = ?auto_195951 ?auto_195955 ) ) ( not ( = ?auto_195952 ?auto_195953 ) ) ( not ( = ?auto_195952 ?auto_195954 ) ) ( not ( = ?auto_195952 ?auto_195955 ) ) ( not ( = ?auto_195953 ?auto_195954 ) ) ( not ( = ?auto_195953 ?auto_195955 ) ) ( not ( = ?auto_195954 ?auto_195955 ) ) ( ON-TABLE ?auto_195955 ) ( CLEAR ?auto_195953 ) ( ON ?auto_195954 ?auto_195955 ) ( CLEAR ?auto_195954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_195955 )
      ( MAKE-8PILE ?auto_195948 ?auto_195949 ?auto_195950 ?auto_195951 ?auto_195952 ?auto_195953 ?auto_195954 ?auto_195955 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195956 - BLOCK
      ?auto_195957 - BLOCK
      ?auto_195958 - BLOCK
      ?auto_195959 - BLOCK
      ?auto_195960 - BLOCK
      ?auto_195961 - BLOCK
      ?auto_195962 - BLOCK
      ?auto_195963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195956 ) ( ON ?auto_195957 ?auto_195956 ) ( ON ?auto_195958 ?auto_195957 ) ( ON ?auto_195959 ?auto_195958 ) ( ON ?auto_195960 ?auto_195959 ) ( not ( = ?auto_195956 ?auto_195957 ) ) ( not ( = ?auto_195956 ?auto_195958 ) ) ( not ( = ?auto_195956 ?auto_195959 ) ) ( not ( = ?auto_195956 ?auto_195960 ) ) ( not ( = ?auto_195956 ?auto_195961 ) ) ( not ( = ?auto_195956 ?auto_195962 ) ) ( not ( = ?auto_195956 ?auto_195963 ) ) ( not ( = ?auto_195957 ?auto_195958 ) ) ( not ( = ?auto_195957 ?auto_195959 ) ) ( not ( = ?auto_195957 ?auto_195960 ) ) ( not ( = ?auto_195957 ?auto_195961 ) ) ( not ( = ?auto_195957 ?auto_195962 ) ) ( not ( = ?auto_195957 ?auto_195963 ) ) ( not ( = ?auto_195958 ?auto_195959 ) ) ( not ( = ?auto_195958 ?auto_195960 ) ) ( not ( = ?auto_195958 ?auto_195961 ) ) ( not ( = ?auto_195958 ?auto_195962 ) ) ( not ( = ?auto_195958 ?auto_195963 ) ) ( not ( = ?auto_195959 ?auto_195960 ) ) ( not ( = ?auto_195959 ?auto_195961 ) ) ( not ( = ?auto_195959 ?auto_195962 ) ) ( not ( = ?auto_195959 ?auto_195963 ) ) ( not ( = ?auto_195960 ?auto_195961 ) ) ( not ( = ?auto_195960 ?auto_195962 ) ) ( not ( = ?auto_195960 ?auto_195963 ) ) ( not ( = ?auto_195961 ?auto_195962 ) ) ( not ( = ?auto_195961 ?auto_195963 ) ) ( not ( = ?auto_195962 ?auto_195963 ) ) ( ON-TABLE ?auto_195963 ) ( ON ?auto_195962 ?auto_195963 ) ( CLEAR ?auto_195962 ) ( HOLDING ?auto_195961 ) ( CLEAR ?auto_195960 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_195956 ?auto_195957 ?auto_195958 ?auto_195959 ?auto_195960 ?auto_195961 )
      ( MAKE-8PILE ?auto_195956 ?auto_195957 ?auto_195958 ?auto_195959 ?auto_195960 ?auto_195961 ?auto_195962 ?auto_195963 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195964 - BLOCK
      ?auto_195965 - BLOCK
      ?auto_195966 - BLOCK
      ?auto_195967 - BLOCK
      ?auto_195968 - BLOCK
      ?auto_195969 - BLOCK
      ?auto_195970 - BLOCK
      ?auto_195971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195964 ) ( ON ?auto_195965 ?auto_195964 ) ( ON ?auto_195966 ?auto_195965 ) ( ON ?auto_195967 ?auto_195966 ) ( ON ?auto_195968 ?auto_195967 ) ( not ( = ?auto_195964 ?auto_195965 ) ) ( not ( = ?auto_195964 ?auto_195966 ) ) ( not ( = ?auto_195964 ?auto_195967 ) ) ( not ( = ?auto_195964 ?auto_195968 ) ) ( not ( = ?auto_195964 ?auto_195969 ) ) ( not ( = ?auto_195964 ?auto_195970 ) ) ( not ( = ?auto_195964 ?auto_195971 ) ) ( not ( = ?auto_195965 ?auto_195966 ) ) ( not ( = ?auto_195965 ?auto_195967 ) ) ( not ( = ?auto_195965 ?auto_195968 ) ) ( not ( = ?auto_195965 ?auto_195969 ) ) ( not ( = ?auto_195965 ?auto_195970 ) ) ( not ( = ?auto_195965 ?auto_195971 ) ) ( not ( = ?auto_195966 ?auto_195967 ) ) ( not ( = ?auto_195966 ?auto_195968 ) ) ( not ( = ?auto_195966 ?auto_195969 ) ) ( not ( = ?auto_195966 ?auto_195970 ) ) ( not ( = ?auto_195966 ?auto_195971 ) ) ( not ( = ?auto_195967 ?auto_195968 ) ) ( not ( = ?auto_195967 ?auto_195969 ) ) ( not ( = ?auto_195967 ?auto_195970 ) ) ( not ( = ?auto_195967 ?auto_195971 ) ) ( not ( = ?auto_195968 ?auto_195969 ) ) ( not ( = ?auto_195968 ?auto_195970 ) ) ( not ( = ?auto_195968 ?auto_195971 ) ) ( not ( = ?auto_195969 ?auto_195970 ) ) ( not ( = ?auto_195969 ?auto_195971 ) ) ( not ( = ?auto_195970 ?auto_195971 ) ) ( ON-TABLE ?auto_195971 ) ( ON ?auto_195970 ?auto_195971 ) ( CLEAR ?auto_195968 ) ( ON ?auto_195969 ?auto_195970 ) ( CLEAR ?auto_195969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_195971 ?auto_195970 )
      ( MAKE-8PILE ?auto_195964 ?auto_195965 ?auto_195966 ?auto_195967 ?auto_195968 ?auto_195969 ?auto_195970 ?auto_195971 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195972 - BLOCK
      ?auto_195973 - BLOCK
      ?auto_195974 - BLOCK
      ?auto_195975 - BLOCK
      ?auto_195976 - BLOCK
      ?auto_195977 - BLOCK
      ?auto_195978 - BLOCK
      ?auto_195979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195972 ) ( ON ?auto_195973 ?auto_195972 ) ( ON ?auto_195974 ?auto_195973 ) ( ON ?auto_195975 ?auto_195974 ) ( not ( = ?auto_195972 ?auto_195973 ) ) ( not ( = ?auto_195972 ?auto_195974 ) ) ( not ( = ?auto_195972 ?auto_195975 ) ) ( not ( = ?auto_195972 ?auto_195976 ) ) ( not ( = ?auto_195972 ?auto_195977 ) ) ( not ( = ?auto_195972 ?auto_195978 ) ) ( not ( = ?auto_195972 ?auto_195979 ) ) ( not ( = ?auto_195973 ?auto_195974 ) ) ( not ( = ?auto_195973 ?auto_195975 ) ) ( not ( = ?auto_195973 ?auto_195976 ) ) ( not ( = ?auto_195973 ?auto_195977 ) ) ( not ( = ?auto_195973 ?auto_195978 ) ) ( not ( = ?auto_195973 ?auto_195979 ) ) ( not ( = ?auto_195974 ?auto_195975 ) ) ( not ( = ?auto_195974 ?auto_195976 ) ) ( not ( = ?auto_195974 ?auto_195977 ) ) ( not ( = ?auto_195974 ?auto_195978 ) ) ( not ( = ?auto_195974 ?auto_195979 ) ) ( not ( = ?auto_195975 ?auto_195976 ) ) ( not ( = ?auto_195975 ?auto_195977 ) ) ( not ( = ?auto_195975 ?auto_195978 ) ) ( not ( = ?auto_195975 ?auto_195979 ) ) ( not ( = ?auto_195976 ?auto_195977 ) ) ( not ( = ?auto_195976 ?auto_195978 ) ) ( not ( = ?auto_195976 ?auto_195979 ) ) ( not ( = ?auto_195977 ?auto_195978 ) ) ( not ( = ?auto_195977 ?auto_195979 ) ) ( not ( = ?auto_195978 ?auto_195979 ) ) ( ON-TABLE ?auto_195979 ) ( ON ?auto_195978 ?auto_195979 ) ( ON ?auto_195977 ?auto_195978 ) ( CLEAR ?auto_195977 ) ( HOLDING ?auto_195976 ) ( CLEAR ?auto_195975 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_195972 ?auto_195973 ?auto_195974 ?auto_195975 ?auto_195976 )
      ( MAKE-8PILE ?auto_195972 ?auto_195973 ?auto_195974 ?auto_195975 ?auto_195976 ?auto_195977 ?auto_195978 ?auto_195979 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195980 - BLOCK
      ?auto_195981 - BLOCK
      ?auto_195982 - BLOCK
      ?auto_195983 - BLOCK
      ?auto_195984 - BLOCK
      ?auto_195985 - BLOCK
      ?auto_195986 - BLOCK
      ?auto_195987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195980 ) ( ON ?auto_195981 ?auto_195980 ) ( ON ?auto_195982 ?auto_195981 ) ( ON ?auto_195983 ?auto_195982 ) ( not ( = ?auto_195980 ?auto_195981 ) ) ( not ( = ?auto_195980 ?auto_195982 ) ) ( not ( = ?auto_195980 ?auto_195983 ) ) ( not ( = ?auto_195980 ?auto_195984 ) ) ( not ( = ?auto_195980 ?auto_195985 ) ) ( not ( = ?auto_195980 ?auto_195986 ) ) ( not ( = ?auto_195980 ?auto_195987 ) ) ( not ( = ?auto_195981 ?auto_195982 ) ) ( not ( = ?auto_195981 ?auto_195983 ) ) ( not ( = ?auto_195981 ?auto_195984 ) ) ( not ( = ?auto_195981 ?auto_195985 ) ) ( not ( = ?auto_195981 ?auto_195986 ) ) ( not ( = ?auto_195981 ?auto_195987 ) ) ( not ( = ?auto_195982 ?auto_195983 ) ) ( not ( = ?auto_195982 ?auto_195984 ) ) ( not ( = ?auto_195982 ?auto_195985 ) ) ( not ( = ?auto_195982 ?auto_195986 ) ) ( not ( = ?auto_195982 ?auto_195987 ) ) ( not ( = ?auto_195983 ?auto_195984 ) ) ( not ( = ?auto_195983 ?auto_195985 ) ) ( not ( = ?auto_195983 ?auto_195986 ) ) ( not ( = ?auto_195983 ?auto_195987 ) ) ( not ( = ?auto_195984 ?auto_195985 ) ) ( not ( = ?auto_195984 ?auto_195986 ) ) ( not ( = ?auto_195984 ?auto_195987 ) ) ( not ( = ?auto_195985 ?auto_195986 ) ) ( not ( = ?auto_195985 ?auto_195987 ) ) ( not ( = ?auto_195986 ?auto_195987 ) ) ( ON-TABLE ?auto_195987 ) ( ON ?auto_195986 ?auto_195987 ) ( ON ?auto_195985 ?auto_195986 ) ( CLEAR ?auto_195983 ) ( ON ?auto_195984 ?auto_195985 ) ( CLEAR ?auto_195984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_195987 ?auto_195986 ?auto_195985 )
      ( MAKE-8PILE ?auto_195980 ?auto_195981 ?auto_195982 ?auto_195983 ?auto_195984 ?auto_195985 ?auto_195986 ?auto_195987 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195988 - BLOCK
      ?auto_195989 - BLOCK
      ?auto_195990 - BLOCK
      ?auto_195991 - BLOCK
      ?auto_195992 - BLOCK
      ?auto_195993 - BLOCK
      ?auto_195994 - BLOCK
      ?auto_195995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195988 ) ( ON ?auto_195989 ?auto_195988 ) ( ON ?auto_195990 ?auto_195989 ) ( not ( = ?auto_195988 ?auto_195989 ) ) ( not ( = ?auto_195988 ?auto_195990 ) ) ( not ( = ?auto_195988 ?auto_195991 ) ) ( not ( = ?auto_195988 ?auto_195992 ) ) ( not ( = ?auto_195988 ?auto_195993 ) ) ( not ( = ?auto_195988 ?auto_195994 ) ) ( not ( = ?auto_195988 ?auto_195995 ) ) ( not ( = ?auto_195989 ?auto_195990 ) ) ( not ( = ?auto_195989 ?auto_195991 ) ) ( not ( = ?auto_195989 ?auto_195992 ) ) ( not ( = ?auto_195989 ?auto_195993 ) ) ( not ( = ?auto_195989 ?auto_195994 ) ) ( not ( = ?auto_195989 ?auto_195995 ) ) ( not ( = ?auto_195990 ?auto_195991 ) ) ( not ( = ?auto_195990 ?auto_195992 ) ) ( not ( = ?auto_195990 ?auto_195993 ) ) ( not ( = ?auto_195990 ?auto_195994 ) ) ( not ( = ?auto_195990 ?auto_195995 ) ) ( not ( = ?auto_195991 ?auto_195992 ) ) ( not ( = ?auto_195991 ?auto_195993 ) ) ( not ( = ?auto_195991 ?auto_195994 ) ) ( not ( = ?auto_195991 ?auto_195995 ) ) ( not ( = ?auto_195992 ?auto_195993 ) ) ( not ( = ?auto_195992 ?auto_195994 ) ) ( not ( = ?auto_195992 ?auto_195995 ) ) ( not ( = ?auto_195993 ?auto_195994 ) ) ( not ( = ?auto_195993 ?auto_195995 ) ) ( not ( = ?auto_195994 ?auto_195995 ) ) ( ON-TABLE ?auto_195995 ) ( ON ?auto_195994 ?auto_195995 ) ( ON ?auto_195993 ?auto_195994 ) ( ON ?auto_195992 ?auto_195993 ) ( CLEAR ?auto_195992 ) ( HOLDING ?auto_195991 ) ( CLEAR ?auto_195990 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_195988 ?auto_195989 ?auto_195990 ?auto_195991 )
      ( MAKE-8PILE ?auto_195988 ?auto_195989 ?auto_195990 ?auto_195991 ?auto_195992 ?auto_195993 ?auto_195994 ?auto_195995 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_195996 - BLOCK
      ?auto_195997 - BLOCK
      ?auto_195998 - BLOCK
      ?auto_195999 - BLOCK
      ?auto_196000 - BLOCK
      ?auto_196001 - BLOCK
      ?auto_196002 - BLOCK
      ?auto_196003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_195996 ) ( ON ?auto_195997 ?auto_195996 ) ( ON ?auto_195998 ?auto_195997 ) ( not ( = ?auto_195996 ?auto_195997 ) ) ( not ( = ?auto_195996 ?auto_195998 ) ) ( not ( = ?auto_195996 ?auto_195999 ) ) ( not ( = ?auto_195996 ?auto_196000 ) ) ( not ( = ?auto_195996 ?auto_196001 ) ) ( not ( = ?auto_195996 ?auto_196002 ) ) ( not ( = ?auto_195996 ?auto_196003 ) ) ( not ( = ?auto_195997 ?auto_195998 ) ) ( not ( = ?auto_195997 ?auto_195999 ) ) ( not ( = ?auto_195997 ?auto_196000 ) ) ( not ( = ?auto_195997 ?auto_196001 ) ) ( not ( = ?auto_195997 ?auto_196002 ) ) ( not ( = ?auto_195997 ?auto_196003 ) ) ( not ( = ?auto_195998 ?auto_195999 ) ) ( not ( = ?auto_195998 ?auto_196000 ) ) ( not ( = ?auto_195998 ?auto_196001 ) ) ( not ( = ?auto_195998 ?auto_196002 ) ) ( not ( = ?auto_195998 ?auto_196003 ) ) ( not ( = ?auto_195999 ?auto_196000 ) ) ( not ( = ?auto_195999 ?auto_196001 ) ) ( not ( = ?auto_195999 ?auto_196002 ) ) ( not ( = ?auto_195999 ?auto_196003 ) ) ( not ( = ?auto_196000 ?auto_196001 ) ) ( not ( = ?auto_196000 ?auto_196002 ) ) ( not ( = ?auto_196000 ?auto_196003 ) ) ( not ( = ?auto_196001 ?auto_196002 ) ) ( not ( = ?auto_196001 ?auto_196003 ) ) ( not ( = ?auto_196002 ?auto_196003 ) ) ( ON-TABLE ?auto_196003 ) ( ON ?auto_196002 ?auto_196003 ) ( ON ?auto_196001 ?auto_196002 ) ( ON ?auto_196000 ?auto_196001 ) ( CLEAR ?auto_195998 ) ( ON ?auto_195999 ?auto_196000 ) ( CLEAR ?auto_195999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196003 ?auto_196002 ?auto_196001 ?auto_196000 )
      ( MAKE-8PILE ?auto_195996 ?auto_195997 ?auto_195998 ?auto_195999 ?auto_196000 ?auto_196001 ?auto_196002 ?auto_196003 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196004 - BLOCK
      ?auto_196005 - BLOCK
      ?auto_196006 - BLOCK
      ?auto_196007 - BLOCK
      ?auto_196008 - BLOCK
      ?auto_196009 - BLOCK
      ?auto_196010 - BLOCK
      ?auto_196011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196004 ) ( ON ?auto_196005 ?auto_196004 ) ( not ( = ?auto_196004 ?auto_196005 ) ) ( not ( = ?auto_196004 ?auto_196006 ) ) ( not ( = ?auto_196004 ?auto_196007 ) ) ( not ( = ?auto_196004 ?auto_196008 ) ) ( not ( = ?auto_196004 ?auto_196009 ) ) ( not ( = ?auto_196004 ?auto_196010 ) ) ( not ( = ?auto_196004 ?auto_196011 ) ) ( not ( = ?auto_196005 ?auto_196006 ) ) ( not ( = ?auto_196005 ?auto_196007 ) ) ( not ( = ?auto_196005 ?auto_196008 ) ) ( not ( = ?auto_196005 ?auto_196009 ) ) ( not ( = ?auto_196005 ?auto_196010 ) ) ( not ( = ?auto_196005 ?auto_196011 ) ) ( not ( = ?auto_196006 ?auto_196007 ) ) ( not ( = ?auto_196006 ?auto_196008 ) ) ( not ( = ?auto_196006 ?auto_196009 ) ) ( not ( = ?auto_196006 ?auto_196010 ) ) ( not ( = ?auto_196006 ?auto_196011 ) ) ( not ( = ?auto_196007 ?auto_196008 ) ) ( not ( = ?auto_196007 ?auto_196009 ) ) ( not ( = ?auto_196007 ?auto_196010 ) ) ( not ( = ?auto_196007 ?auto_196011 ) ) ( not ( = ?auto_196008 ?auto_196009 ) ) ( not ( = ?auto_196008 ?auto_196010 ) ) ( not ( = ?auto_196008 ?auto_196011 ) ) ( not ( = ?auto_196009 ?auto_196010 ) ) ( not ( = ?auto_196009 ?auto_196011 ) ) ( not ( = ?auto_196010 ?auto_196011 ) ) ( ON-TABLE ?auto_196011 ) ( ON ?auto_196010 ?auto_196011 ) ( ON ?auto_196009 ?auto_196010 ) ( ON ?auto_196008 ?auto_196009 ) ( ON ?auto_196007 ?auto_196008 ) ( CLEAR ?auto_196007 ) ( HOLDING ?auto_196006 ) ( CLEAR ?auto_196005 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_196004 ?auto_196005 ?auto_196006 )
      ( MAKE-8PILE ?auto_196004 ?auto_196005 ?auto_196006 ?auto_196007 ?auto_196008 ?auto_196009 ?auto_196010 ?auto_196011 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196012 - BLOCK
      ?auto_196013 - BLOCK
      ?auto_196014 - BLOCK
      ?auto_196015 - BLOCK
      ?auto_196016 - BLOCK
      ?auto_196017 - BLOCK
      ?auto_196018 - BLOCK
      ?auto_196019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196012 ) ( ON ?auto_196013 ?auto_196012 ) ( not ( = ?auto_196012 ?auto_196013 ) ) ( not ( = ?auto_196012 ?auto_196014 ) ) ( not ( = ?auto_196012 ?auto_196015 ) ) ( not ( = ?auto_196012 ?auto_196016 ) ) ( not ( = ?auto_196012 ?auto_196017 ) ) ( not ( = ?auto_196012 ?auto_196018 ) ) ( not ( = ?auto_196012 ?auto_196019 ) ) ( not ( = ?auto_196013 ?auto_196014 ) ) ( not ( = ?auto_196013 ?auto_196015 ) ) ( not ( = ?auto_196013 ?auto_196016 ) ) ( not ( = ?auto_196013 ?auto_196017 ) ) ( not ( = ?auto_196013 ?auto_196018 ) ) ( not ( = ?auto_196013 ?auto_196019 ) ) ( not ( = ?auto_196014 ?auto_196015 ) ) ( not ( = ?auto_196014 ?auto_196016 ) ) ( not ( = ?auto_196014 ?auto_196017 ) ) ( not ( = ?auto_196014 ?auto_196018 ) ) ( not ( = ?auto_196014 ?auto_196019 ) ) ( not ( = ?auto_196015 ?auto_196016 ) ) ( not ( = ?auto_196015 ?auto_196017 ) ) ( not ( = ?auto_196015 ?auto_196018 ) ) ( not ( = ?auto_196015 ?auto_196019 ) ) ( not ( = ?auto_196016 ?auto_196017 ) ) ( not ( = ?auto_196016 ?auto_196018 ) ) ( not ( = ?auto_196016 ?auto_196019 ) ) ( not ( = ?auto_196017 ?auto_196018 ) ) ( not ( = ?auto_196017 ?auto_196019 ) ) ( not ( = ?auto_196018 ?auto_196019 ) ) ( ON-TABLE ?auto_196019 ) ( ON ?auto_196018 ?auto_196019 ) ( ON ?auto_196017 ?auto_196018 ) ( ON ?auto_196016 ?auto_196017 ) ( ON ?auto_196015 ?auto_196016 ) ( CLEAR ?auto_196013 ) ( ON ?auto_196014 ?auto_196015 ) ( CLEAR ?auto_196014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196019 ?auto_196018 ?auto_196017 ?auto_196016 ?auto_196015 )
      ( MAKE-8PILE ?auto_196012 ?auto_196013 ?auto_196014 ?auto_196015 ?auto_196016 ?auto_196017 ?auto_196018 ?auto_196019 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196020 - BLOCK
      ?auto_196021 - BLOCK
      ?auto_196022 - BLOCK
      ?auto_196023 - BLOCK
      ?auto_196024 - BLOCK
      ?auto_196025 - BLOCK
      ?auto_196026 - BLOCK
      ?auto_196027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196020 ) ( not ( = ?auto_196020 ?auto_196021 ) ) ( not ( = ?auto_196020 ?auto_196022 ) ) ( not ( = ?auto_196020 ?auto_196023 ) ) ( not ( = ?auto_196020 ?auto_196024 ) ) ( not ( = ?auto_196020 ?auto_196025 ) ) ( not ( = ?auto_196020 ?auto_196026 ) ) ( not ( = ?auto_196020 ?auto_196027 ) ) ( not ( = ?auto_196021 ?auto_196022 ) ) ( not ( = ?auto_196021 ?auto_196023 ) ) ( not ( = ?auto_196021 ?auto_196024 ) ) ( not ( = ?auto_196021 ?auto_196025 ) ) ( not ( = ?auto_196021 ?auto_196026 ) ) ( not ( = ?auto_196021 ?auto_196027 ) ) ( not ( = ?auto_196022 ?auto_196023 ) ) ( not ( = ?auto_196022 ?auto_196024 ) ) ( not ( = ?auto_196022 ?auto_196025 ) ) ( not ( = ?auto_196022 ?auto_196026 ) ) ( not ( = ?auto_196022 ?auto_196027 ) ) ( not ( = ?auto_196023 ?auto_196024 ) ) ( not ( = ?auto_196023 ?auto_196025 ) ) ( not ( = ?auto_196023 ?auto_196026 ) ) ( not ( = ?auto_196023 ?auto_196027 ) ) ( not ( = ?auto_196024 ?auto_196025 ) ) ( not ( = ?auto_196024 ?auto_196026 ) ) ( not ( = ?auto_196024 ?auto_196027 ) ) ( not ( = ?auto_196025 ?auto_196026 ) ) ( not ( = ?auto_196025 ?auto_196027 ) ) ( not ( = ?auto_196026 ?auto_196027 ) ) ( ON-TABLE ?auto_196027 ) ( ON ?auto_196026 ?auto_196027 ) ( ON ?auto_196025 ?auto_196026 ) ( ON ?auto_196024 ?auto_196025 ) ( ON ?auto_196023 ?auto_196024 ) ( ON ?auto_196022 ?auto_196023 ) ( CLEAR ?auto_196022 ) ( HOLDING ?auto_196021 ) ( CLEAR ?auto_196020 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196020 ?auto_196021 )
      ( MAKE-8PILE ?auto_196020 ?auto_196021 ?auto_196022 ?auto_196023 ?auto_196024 ?auto_196025 ?auto_196026 ?auto_196027 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196028 - BLOCK
      ?auto_196029 - BLOCK
      ?auto_196030 - BLOCK
      ?auto_196031 - BLOCK
      ?auto_196032 - BLOCK
      ?auto_196033 - BLOCK
      ?auto_196034 - BLOCK
      ?auto_196035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_196028 ) ( not ( = ?auto_196028 ?auto_196029 ) ) ( not ( = ?auto_196028 ?auto_196030 ) ) ( not ( = ?auto_196028 ?auto_196031 ) ) ( not ( = ?auto_196028 ?auto_196032 ) ) ( not ( = ?auto_196028 ?auto_196033 ) ) ( not ( = ?auto_196028 ?auto_196034 ) ) ( not ( = ?auto_196028 ?auto_196035 ) ) ( not ( = ?auto_196029 ?auto_196030 ) ) ( not ( = ?auto_196029 ?auto_196031 ) ) ( not ( = ?auto_196029 ?auto_196032 ) ) ( not ( = ?auto_196029 ?auto_196033 ) ) ( not ( = ?auto_196029 ?auto_196034 ) ) ( not ( = ?auto_196029 ?auto_196035 ) ) ( not ( = ?auto_196030 ?auto_196031 ) ) ( not ( = ?auto_196030 ?auto_196032 ) ) ( not ( = ?auto_196030 ?auto_196033 ) ) ( not ( = ?auto_196030 ?auto_196034 ) ) ( not ( = ?auto_196030 ?auto_196035 ) ) ( not ( = ?auto_196031 ?auto_196032 ) ) ( not ( = ?auto_196031 ?auto_196033 ) ) ( not ( = ?auto_196031 ?auto_196034 ) ) ( not ( = ?auto_196031 ?auto_196035 ) ) ( not ( = ?auto_196032 ?auto_196033 ) ) ( not ( = ?auto_196032 ?auto_196034 ) ) ( not ( = ?auto_196032 ?auto_196035 ) ) ( not ( = ?auto_196033 ?auto_196034 ) ) ( not ( = ?auto_196033 ?auto_196035 ) ) ( not ( = ?auto_196034 ?auto_196035 ) ) ( ON-TABLE ?auto_196035 ) ( ON ?auto_196034 ?auto_196035 ) ( ON ?auto_196033 ?auto_196034 ) ( ON ?auto_196032 ?auto_196033 ) ( ON ?auto_196031 ?auto_196032 ) ( ON ?auto_196030 ?auto_196031 ) ( CLEAR ?auto_196028 ) ( ON ?auto_196029 ?auto_196030 ) ( CLEAR ?auto_196029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196035 ?auto_196034 ?auto_196033 ?auto_196032 ?auto_196031 ?auto_196030 )
      ( MAKE-8PILE ?auto_196028 ?auto_196029 ?auto_196030 ?auto_196031 ?auto_196032 ?auto_196033 ?auto_196034 ?auto_196035 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196036 - BLOCK
      ?auto_196037 - BLOCK
      ?auto_196038 - BLOCK
      ?auto_196039 - BLOCK
      ?auto_196040 - BLOCK
      ?auto_196041 - BLOCK
      ?auto_196042 - BLOCK
      ?auto_196043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196036 ?auto_196037 ) ) ( not ( = ?auto_196036 ?auto_196038 ) ) ( not ( = ?auto_196036 ?auto_196039 ) ) ( not ( = ?auto_196036 ?auto_196040 ) ) ( not ( = ?auto_196036 ?auto_196041 ) ) ( not ( = ?auto_196036 ?auto_196042 ) ) ( not ( = ?auto_196036 ?auto_196043 ) ) ( not ( = ?auto_196037 ?auto_196038 ) ) ( not ( = ?auto_196037 ?auto_196039 ) ) ( not ( = ?auto_196037 ?auto_196040 ) ) ( not ( = ?auto_196037 ?auto_196041 ) ) ( not ( = ?auto_196037 ?auto_196042 ) ) ( not ( = ?auto_196037 ?auto_196043 ) ) ( not ( = ?auto_196038 ?auto_196039 ) ) ( not ( = ?auto_196038 ?auto_196040 ) ) ( not ( = ?auto_196038 ?auto_196041 ) ) ( not ( = ?auto_196038 ?auto_196042 ) ) ( not ( = ?auto_196038 ?auto_196043 ) ) ( not ( = ?auto_196039 ?auto_196040 ) ) ( not ( = ?auto_196039 ?auto_196041 ) ) ( not ( = ?auto_196039 ?auto_196042 ) ) ( not ( = ?auto_196039 ?auto_196043 ) ) ( not ( = ?auto_196040 ?auto_196041 ) ) ( not ( = ?auto_196040 ?auto_196042 ) ) ( not ( = ?auto_196040 ?auto_196043 ) ) ( not ( = ?auto_196041 ?auto_196042 ) ) ( not ( = ?auto_196041 ?auto_196043 ) ) ( not ( = ?auto_196042 ?auto_196043 ) ) ( ON-TABLE ?auto_196043 ) ( ON ?auto_196042 ?auto_196043 ) ( ON ?auto_196041 ?auto_196042 ) ( ON ?auto_196040 ?auto_196041 ) ( ON ?auto_196039 ?auto_196040 ) ( ON ?auto_196038 ?auto_196039 ) ( ON ?auto_196037 ?auto_196038 ) ( CLEAR ?auto_196037 ) ( HOLDING ?auto_196036 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196036 )
      ( MAKE-8PILE ?auto_196036 ?auto_196037 ?auto_196038 ?auto_196039 ?auto_196040 ?auto_196041 ?auto_196042 ?auto_196043 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196044 - BLOCK
      ?auto_196045 - BLOCK
      ?auto_196046 - BLOCK
      ?auto_196047 - BLOCK
      ?auto_196048 - BLOCK
      ?auto_196049 - BLOCK
      ?auto_196050 - BLOCK
      ?auto_196051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196044 ?auto_196045 ) ) ( not ( = ?auto_196044 ?auto_196046 ) ) ( not ( = ?auto_196044 ?auto_196047 ) ) ( not ( = ?auto_196044 ?auto_196048 ) ) ( not ( = ?auto_196044 ?auto_196049 ) ) ( not ( = ?auto_196044 ?auto_196050 ) ) ( not ( = ?auto_196044 ?auto_196051 ) ) ( not ( = ?auto_196045 ?auto_196046 ) ) ( not ( = ?auto_196045 ?auto_196047 ) ) ( not ( = ?auto_196045 ?auto_196048 ) ) ( not ( = ?auto_196045 ?auto_196049 ) ) ( not ( = ?auto_196045 ?auto_196050 ) ) ( not ( = ?auto_196045 ?auto_196051 ) ) ( not ( = ?auto_196046 ?auto_196047 ) ) ( not ( = ?auto_196046 ?auto_196048 ) ) ( not ( = ?auto_196046 ?auto_196049 ) ) ( not ( = ?auto_196046 ?auto_196050 ) ) ( not ( = ?auto_196046 ?auto_196051 ) ) ( not ( = ?auto_196047 ?auto_196048 ) ) ( not ( = ?auto_196047 ?auto_196049 ) ) ( not ( = ?auto_196047 ?auto_196050 ) ) ( not ( = ?auto_196047 ?auto_196051 ) ) ( not ( = ?auto_196048 ?auto_196049 ) ) ( not ( = ?auto_196048 ?auto_196050 ) ) ( not ( = ?auto_196048 ?auto_196051 ) ) ( not ( = ?auto_196049 ?auto_196050 ) ) ( not ( = ?auto_196049 ?auto_196051 ) ) ( not ( = ?auto_196050 ?auto_196051 ) ) ( ON-TABLE ?auto_196051 ) ( ON ?auto_196050 ?auto_196051 ) ( ON ?auto_196049 ?auto_196050 ) ( ON ?auto_196048 ?auto_196049 ) ( ON ?auto_196047 ?auto_196048 ) ( ON ?auto_196046 ?auto_196047 ) ( ON ?auto_196045 ?auto_196046 ) ( ON ?auto_196044 ?auto_196045 ) ( CLEAR ?auto_196044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196051 ?auto_196050 ?auto_196049 ?auto_196048 ?auto_196047 ?auto_196046 ?auto_196045 )
      ( MAKE-8PILE ?auto_196044 ?auto_196045 ?auto_196046 ?auto_196047 ?auto_196048 ?auto_196049 ?auto_196050 ?auto_196051 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196052 - BLOCK
      ?auto_196053 - BLOCK
      ?auto_196054 - BLOCK
      ?auto_196055 - BLOCK
      ?auto_196056 - BLOCK
      ?auto_196057 - BLOCK
      ?auto_196058 - BLOCK
      ?auto_196059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196052 ?auto_196053 ) ) ( not ( = ?auto_196052 ?auto_196054 ) ) ( not ( = ?auto_196052 ?auto_196055 ) ) ( not ( = ?auto_196052 ?auto_196056 ) ) ( not ( = ?auto_196052 ?auto_196057 ) ) ( not ( = ?auto_196052 ?auto_196058 ) ) ( not ( = ?auto_196052 ?auto_196059 ) ) ( not ( = ?auto_196053 ?auto_196054 ) ) ( not ( = ?auto_196053 ?auto_196055 ) ) ( not ( = ?auto_196053 ?auto_196056 ) ) ( not ( = ?auto_196053 ?auto_196057 ) ) ( not ( = ?auto_196053 ?auto_196058 ) ) ( not ( = ?auto_196053 ?auto_196059 ) ) ( not ( = ?auto_196054 ?auto_196055 ) ) ( not ( = ?auto_196054 ?auto_196056 ) ) ( not ( = ?auto_196054 ?auto_196057 ) ) ( not ( = ?auto_196054 ?auto_196058 ) ) ( not ( = ?auto_196054 ?auto_196059 ) ) ( not ( = ?auto_196055 ?auto_196056 ) ) ( not ( = ?auto_196055 ?auto_196057 ) ) ( not ( = ?auto_196055 ?auto_196058 ) ) ( not ( = ?auto_196055 ?auto_196059 ) ) ( not ( = ?auto_196056 ?auto_196057 ) ) ( not ( = ?auto_196056 ?auto_196058 ) ) ( not ( = ?auto_196056 ?auto_196059 ) ) ( not ( = ?auto_196057 ?auto_196058 ) ) ( not ( = ?auto_196057 ?auto_196059 ) ) ( not ( = ?auto_196058 ?auto_196059 ) ) ( ON-TABLE ?auto_196059 ) ( ON ?auto_196058 ?auto_196059 ) ( ON ?auto_196057 ?auto_196058 ) ( ON ?auto_196056 ?auto_196057 ) ( ON ?auto_196055 ?auto_196056 ) ( ON ?auto_196054 ?auto_196055 ) ( ON ?auto_196053 ?auto_196054 ) ( HOLDING ?auto_196052 ) ( CLEAR ?auto_196053 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196059 ?auto_196058 ?auto_196057 ?auto_196056 ?auto_196055 ?auto_196054 ?auto_196053 ?auto_196052 )
      ( MAKE-8PILE ?auto_196052 ?auto_196053 ?auto_196054 ?auto_196055 ?auto_196056 ?auto_196057 ?auto_196058 ?auto_196059 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196060 - BLOCK
      ?auto_196061 - BLOCK
      ?auto_196062 - BLOCK
      ?auto_196063 - BLOCK
      ?auto_196064 - BLOCK
      ?auto_196065 - BLOCK
      ?auto_196066 - BLOCK
      ?auto_196067 - BLOCK
    )
    :vars
    (
      ?auto_196068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196060 ?auto_196061 ) ) ( not ( = ?auto_196060 ?auto_196062 ) ) ( not ( = ?auto_196060 ?auto_196063 ) ) ( not ( = ?auto_196060 ?auto_196064 ) ) ( not ( = ?auto_196060 ?auto_196065 ) ) ( not ( = ?auto_196060 ?auto_196066 ) ) ( not ( = ?auto_196060 ?auto_196067 ) ) ( not ( = ?auto_196061 ?auto_196062 ) ) ( not ( = ?auto_196061 ?auto_196063 ) ) ( not ( = ?auto_196061 ?auto_196064 ) ) ( not ( = ?auto_196061 ?auto_196065 ) ) ( not ( = ?auto_196061 ?auto_196066 ) ) ( not ( = ?auto_196061 ?auto_196067 ) ) ( not ( = ?auto_196062 ?auto_196063 ) ) ( not ( = ?auto_196062 ?auto_196064 ) ) ( not ( = ?auto_196062 ?auto_196065 ) ) ( not ( = ?auto_196062 ?auto_196066 ) ) ( not ( = ?auto_196062 ?auto_196067 ) ) ( not ( = ?auto_196063 ?auto_196064 ) ) ( not ( = ?auto_196063 ?auto_196065 ) ) ( not ( = ?auto_196063 ?auto_196066 ) ) ( not ( = ?auto_196063 ?auto_196067 ) ) ( not ( = ?auto_196064 ?auto_196065 ) ) ( not ( = ?auto_196064 ?auto_196066 ) ) ( not ( = ?auto_196064 ?auto_196067 ) ) ( not ( = ?auto_196065 ?auto_196066 ) ) ( not ( = ?auto_196065 ?auto_196067 ) ) ( not ( = ?auto_196066 ?auto_196067 ) ) ( ON-TABLE ?auto_196067 ) ( ON ?auto_196066 ?auto_196067 ) ( ON ?auto_196065 ?auto_196066 ) ( ON ?auto_196064 ?auto_196065 ) ( ON ?auto_196063 ?auto_196064 ) ( ON ?auto_196062 ?auto_196063 ) ( ON ?auto_196061 ?auto_196062 ) ( CLEAR ?auto_196061 ) ( ON ?auto_196060 ?auto_196068 ) ( CLEAR ?auto_196060 ) ( HAND-EMPTY ) ( not ( = ?auto_196060 ?auto_196068 ) ) ( not ( = ?auto_196061 ?auto_196068 ) ) ( not ( = ?auto_196062 ?auto_196068 ) ) ( not ( = ?auto_196063 ?auto_196068 ) ) ( not ( = ?auto_196064 ?auto_196068 ) ) ( not ( = ?auto_196065 ?auto_196068 ) ) ( not ( = ?auto_196066 ?auto_196068 ) ) ( not ( = ?auto_196067 ?auto_196068 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_196060 ?auto_196068 )
      ( MAKE-8PILE ?auto_196060 ?auto_196061 ?auto_196062 ?auto_196063 ?auto_196064 ?auto_196065 ?auto_196066 ?auto_196067 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196069 - BLOCK
      ?auto_196070 - BLOCK
      ?auto_196071 - BLOCK
      ?auto_196072 - BLOCK
      ?auto_196073 - BLOCK
      ?auto_196074 - BLOCK
      ?auto_196075 - BLOCK
      ?auto_196076 - BLOCK
    )
    :vars
    (
      ?auto_196077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196069 ?auto_196070 ) ) ( not ( = ?auto_196069 ?auto_196071 ) ) ( not ( = ?auto_196069 ?auto_196072 ) ) ( not ( = ?auto_196069 ?auto_196073 ) ) ( not ( = ?auto_196069 ?auto_196074 ) ) ( not ( = ?auto_196069 ?auto_196075 ) ) ( not ( = ?auto_196069 ?auto_196076 ) ) ( not ( = ?auto_196070 ?auto_196071 ) ) ( not ( = ?auto_196070 ?auto_196072 ) ) ( not ( = ?auto_196070 ?auto_196073 ) ) ( not ( = ?auto_196070 ?auto_196074 ) ) ( not ( = ?auto_196070 ?auto_196075 ) ) ( not ( = ?auto_196070 ?auto_196076 ) ) ( not ( = ?auto_196071 ?auto_196072 ) ) ( not ( = ?auto_196071 ?auto_196073 ) ) ( not ( = ?auto_196071 ?auto_196074 ) ) ( not ( = ?auto_196071 ?auto_196075 ) ) ( not ( = ?auto_196071 ?auto_196076 ) ) ( not ( = ?auto_196072 ?auto_196073 ) ) ( not ( = ?auto_196072 ?auto_196074 ) ) ( not ( = ?auto_196072 ?auto_196075 ) ) ( not ( = ?auto_196072 ?auto_196076 ) ) ( not ( = ?auto_196073 ?auto_196074 ) ) ( not ( = ?auto_196073 ?auto_196075 ) ) ( not ( = ?auto_196073 ?auto_196076 ) ) ( not ( = ?auto_196074 ?auto_196075 ) ) ( not ( = ?auto_196074 ?auto_196076 ) ) ( not ( = ?auto_196075 ?auto_196076 ) ) ( ON-TABLE ?auto_196076 ) ( ON ?auto_196075 ?auto_196076 ) ( ON ?auto_196074 ?auto_196075 ) ( ON ?auto_196073 ?auto_196074 ) ( ON ?auto_196072 ?auto_196073 ) ( ON ?auto_196071 ?auto_196072 ) ( ON ?auto_196069 ?auto_196077 ) ( CLEAR ?auto_196069 ) ( not ( = ?auto_196069 ?auto_196077 ) ) ( not ( = ?auto_196070 ?auto_196077 ) ) ( not ( = ?auto_196071 ?auto_196077 ) ) ( not ( = ?auto_196072 ?auto_196077 ) ) ( not ( = ?auto_196073 ?auto_196077 ) ) ( not ( = ?auto_196074 ?auto_196077 ) ) ( not ( = ?auto_196075 ?auto_196077 ) ) ( not ( = ?auto_196076 ?auto_196077 ) ) ( HOLDING ?auto_196070 ) ( CLEAR ?auto_196071 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196076 ?auto_196075 ?auto_196074 ?auto_196073 ?auto_196072 ?auto_196071 ?auto_196070 )
      ( MAKE-8PILE ?auto_196069 ?auto_196070 ?auto_196071 ?auto_196072 ?auto_196073 ?auto_196074 ?auto_196075 ?auto_196076 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196078 - BLOCK
      ?auto_196079 - BLOCK
      ?auto_196080 - BLOCK
      ?auto_196081 - BLOCK
      ?auto_196082 - BLOCK
      ?auto_196083 - BLOCK
      ?auto_196084 - BLOCK
      ?auto_196085 - BLOCK
    )
    :vars
    (
      ?auto_196086 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196078 ?auto_196079 ) ) ( not ( = ?auto_196078 ?auto_196080 ) ) ( not ( = ?auto_196078 ?auto_196081 ) ) ( not ( = ?auto_196078 ?auto_196082 ) ) ( not ( = ?auto_196078 ?auto_196083 ) ) ( not ( = ?auto_196078 ?auto_196084 ) ) ( not ( = ?auto_196078 ?auto_196085 ) ) ( not ( = ?auto_196079 ?auto_196080 ) ) ( not ( = ?auto_196079 ?auto_196081 ) ) ( not ( = ?auto_196079 ?auto_196082 ) ) ( not ( = ?auto_196079 ?auto_196083 ) ) ( not ( = ?auto_196079 ?auto_196084 ) ) ( not ( = ?auto_196079 ?auto_196085 ) ) ( not ( = ?auto_196080 ?auto_196081 ) ) ( not ( = ?auto_196080 ?auto_196082 ) ) ( not ( = ?auto_196080 ?auto_196083 ) ) ( not ( = ?auto_196080 ?auto_196084 ) ) ( not ( = ?auto_196080 ?auto_196085 ) ) ( not ( = ?auto_196081 ?auto_196082 ) ) ( not ( = ?auto_196081 ?auto_196083 ) ) ( not ( = ?auto_196081 ?auto_196084 ) ) ( not ( = ?auto_196081 ?auto_196085 ) ) ( not ( = ?auto_196082 ?auto_196083 ) ) ( not ( = ?auto_196082 ?auto_196084 ) ) ( not ( = ?auto_196082 ?auto_196085 ) ) ( not ( = ?auto_196083 ?auto_196084 ) ) ( not ( = ?auto_196083 ?auto_196085 ) ) ( not ( = ?auto_196084 ?auto_196085 ) ) ( ON-TABLE ?auto_196085 ) ( ON ?auto_196084 ?auto_196085 ) ( ON ?auto_196083 ?auto_196084 ) ( ON ?auto_196082 ?auto_196083 ) ( ON ?auto_196081 ?auto_196082 ) ( ON ?auto_196080 ?auto_196081 ) ( ON ?auto_196078 ?auto_196086 ) ( not ( = ?auto_196078 ?auto_196086 ) ) ( not ( = ?auto_196079 ?auto_196086 ) ) ( not ( = ?auto_196080 ?auto_196086 ) ) ( not ( = ?auto_196081 ?auto_196086 ) ) ( not ( = ?auto_196082 ?auto_196086 ) ) ( not ( = ?auto_196083 ?auto_196086 ) ) ( not ( = ?auto_196084 ?auto_196086 ) ) ( not ( = ?auto_196085 ?auto_196086 ) ) ( CLEAR ?auto_196080 ) ( ON ?auto_196079 ?auto_196078 ) ( CLEAR ?auto_196079 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_196086 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196086 ?auto_196078 )
      ( MAKE-8PILE ?auto_196078 ?auto_196079 ?auto_196080 ?auto_196081 ?auto_196082 ?auto_196083 ?auto_196084 ?auto_196085 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196087 - BLOCK
      ?auto_196088 - BLOCK
      ?auto_196089 - BLOCK
      ?auto_196090 - BLOCK
      ?auto_196091 - BLOCK
      ?auto_196092 - BLOCK
      ?auto_196093 - BLOCK
      ?auto_196094 - BLOCK
    )
    :vars
    (
      ?auto_196095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196087 ?auto_196088 ) ) ( not ( = ?auto_196087 ?auto_196089 ) ) ( not ( = ?auto_196087 ?auto_196090 ) ) ( not ( = ?auto_196087 ?auto_196091 ) ) ( not ( = ?auto_196087 ?auto_196092 ) ) ( not ( = ?auto_196087 ?auto_196093 ) ) ( not ( = ?auto_196087 ?auto_196094 ) ) ( not ( = ?auto_196088 ?auto_196089 ) ) ( not ( = ?auto_196088 ?auto_196090 ) ) ( not ( = ?auto_196088 ?auto_196091 ) ) ( not ( = ?auto_196088 ?auto_196092 ) ) ( not ( = ?auto_196088 ?auto_196093 ) ) ( not ( = ?auto_196088 ?auto_196094 ) ) ( not ( = ?auto_196089 ?auto_196090 ) ) ( not ( = ?auto_196089 ?auto_196091 ) ) ( not ( = ?auto_196089 ?auto_196092 ) ) ( not ( = ?auto_196089 ?auto_196093 ) ) ( not ( = ?auto_196089 ?auto_196094 ) ) ( not ( = ?auto_196090 ?auto_196091 ) ) ( not ( = ?auto_196090 ?auto_196092 ) ) ( not ( = ?auto_196090 ?auto_196093 ) ) ( not ( = ?auto_196090 ?auto_196094 ) ) ( not ( = ?auto_196091 ?auto_196092 ) ) ( not ( = ?auto_196091 ?auto_196093 ) ) ( not ( = ?auto_196091 ?auto_196094 ) ) ( not ( = ?auto_196092 ?auto_196093 ) ) ( not ( = ?auto_196092 ?auto_196094 ) ) ( not ( = ?auto_196093 ?auto_196094 ) ) ( ON-TABLE ?auto_196094 ) ( ON ?auto_196093 ?auto_196094 ) ( ON ?auto_196092 ?auto_196093 ) ( ON ?auto_196091 ?auto_196092 ) ( ON ?auto_196090 ?auto_196091 ) ( ON ?auto_196087 ?auto_196095 ) ( not ( = ?auto_196087 ?auto_196095 ) ) ( not ( = ?auto_196088 ?auto_196095 ) ) ( not ( = ?auto_196089 ?auto_196095 ) ) ( not ( = ?auto_196090 ?auto_196095 ) ) ( not ( = ?auto_196091 ?auto_196095 ) ) ( not ( = ?auto_196092 ?auto_196095 ) ) ( not ( = ?auto_196093 ?auto_196095 ) ) ( not ( = ?auto_196094 ?auto_196095 ) ) ( ON ?auto_196088 ?auto_196087 ) ( CLEAR ?auto_196088 ) ( ON-TABLE ?auto_196095 ) ( HOLDING ?auto_196089 ) ( CLEAR ?auto_196090 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196094 ?auto_196093 ?auto_196092 ?auto_196091 ?auto_196090 ?auto_196089 )
      ( MAKE-8PILE ?auto_196087 ?auto_196088 ?auto_196089 ?auto_196090 ?auto_196091 ?auto_196092 ?auto_196093 ?auto_196094 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196096 - BLOCK
      ?auto_196097 - BLOCK
      ?auto_196098 - BLOCK
      ?auto_196099 - BLOCK
      ?auto_196100 - BLOCK
      ?auto_196101 - BLOCK
      ?auto_196102 - BLOCK
      ?auto_196103 - BLOCK
    )
    :vars
    (
      ?auto_196104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196096 ?auto_196097 ) ) ( not ( = ?auto_196096 ?auto_196098 ) ) ( not ( = ?auto_196096 ?auto_196099 ) ) ( not ( = ?auto_196096 ?auto_196100 ) ) ( not ( = ?auto_196096 ?auto_196101 ) ) ( not ( = ?auto_196096 ?auto_196102 ) ) ( not ( = ?auto_196096 ?auto_196103 ) ) ( not ( = ?auto_196097 ?auto_196098 ) ) ( not ( = ?auto_196097 ?auto_196099 ) ) ( not ( = ?auto_196097 ?auto_196100 ) ) ( not ( = ?auto_196097 ?auto_196101 ) ) ( not ( = ?auto_196097 ?auto_196102 ) ) ( not ( = ?auto_196097 ?auto_196103 ) ) ( not ( = ?auto_196098 ?auto_196099 ) ) ( not ( = ?auto_196098 ?auto_196100 ) ) ( not ( = ?auto_196098 ?auto_196101 ) ) ( not ( = ?auto_196098 ?auto_196102 ) ) ( not ( = ?auto_196098 ?auto_196103 ) ) ( not ( = ?auto_196099 ?auto_196100 ) ) ( not ( = ?auto_196099 ?auto_196101 ) ) ( not ( = ?auto_196099 ?auto_196102 ) ) ( not ( = ?auto_196099 ?auto_196103 ) ) ( not ( = ?auto_196100 ?auto_196101 ) ) ( not ( = ?auto_196100 ?auto_196102 ) ) ( not ( = ?auto_196100 ?auto_196103 ) ) ( not ( = ?auto_196101 ?auto_196102 ) ) ( not ( = ?auto_196101 ?auto_196103 ) ) ( not ( = ?auto_196102 ?auto_196103 ) ) ( ON-TABLE ?auto_196103 ) ( ON ?auto_196102 ?auto_196103 ) ( ON ?auto_196101 ?auto_196102 ) ( ON ?auto_196100 ?auto_196101 ) ( ON ?auto_196099 ?auto_196100 ) ( ON ?auto_196096 ?auto_196104 ) ( not ( = ?auto_196096 ?auto_196104 ) ) ( not ( = ?auto_196097 ?auto_196104 ) ) ( not ( = ?auto_196098 ?auto_196104 ) ) ( not ( = ?auto_196099 ?auto_196104 ) ) ( not ( = ?auto_196100 ?auto_196104 ) ) ( not ( = ?auto_196101 ?auto_196104 ) ) ( not ( = ?auto_196102 ?auto_196104 ) ) ( not ( = ?auto_196103 ?auto_196104 ) ) ( ON ?auto_196097 ?auto_196096 ) ( ON-TABLE ?auto_196104 ) ( CLEAR ?auto_196099 ) ( ON ?auto_196098 ?auto_196097 ) ( CLEAR ?auto_196098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_196104 ?auto_196096 ?auto_196097 )
      ( MAKE-8PILE ?auto_196096 ?auto_196097 ?auto_196098 ?auto_196099 ?auto_196100 ?auto_196101 ?auto_196102 ?auto_196103 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196105 - BLOCK
      ?auto_196106 - BLOCK
      ?auto_196107 - BLOCK
      ?auto_196108 - BLOCK
      ?auto_196109 - BLOCK
      ?auto_196110 - BLOCK
      ?auto_196111 - BLOCK
      ?auto_196112 - BLOCK
    )
    :vars
    (
      ?auto_196113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196105 ?auto_196106 ) ) ( not ( = ?auto_196105 ?auto_196107 ) ) ( not ( = ?auto_196105 ?auto_196108 ) ) ( not ( = ?auto_196105 ?auto_196109 ) ) ( not ( = ?auto_196105 ?auto_196110 ) ) ( not ( = ?auto_196105 ?auto_196111 ) ) ( not ( = ?auto_196105 ?auto_196112 ) ) ( not ( = ?auto_196106 ?auto_196107 ) ) ( not ( = ?auto_196106 ?auto_196108 ) ) ( not ( = ?auto_196106 ?auto_196109 ) ) ( not ( = ?auto_196106 ?auto_196110 ) ) ( not ( = ?auto_196106 ?auto_196111 ) ) ( not ( = ?auto_196106 ?auto_196112 ) ) ( not ( = ?auto_196107 ?auto_196108 ) ) ( not ( = ?auto_196107 ?auto_196109 ) ) ( not ( = ?auto_196107 ?auto_196110 ) ) ( not ( = ?auto_196107 ?auto_196111 ) ) ( not ( = ?auto_196107 ?auto_196112 ) ) ( not ( = ?auto_196108 ?auto_196109 ) ) ( not ( = ?auto_196108 ?auto_196110 ) ) ( not ( = ?auto_196108 ?auto_196111 ) ) ( not ( = ?auto_196108 ?auto_196112 ) ) ( not ( = ?auto_196109 ?auto_196110 ) ) ( not ( = ?auto_196109 ?auto_196111 ) ) ( not ( = ?auto_196109 ?auto_196112 ) ) ( not ( = ?auto_196110 ?auto_196111 ) ) ( not ( = ?auto_196110 ?auto_196112 ) ) ( not ( = ?auto_196111 ?auto_196112 ) ) ( ON-TABLE ?auto_196112 ) ( ON ?auto_196111 ?auto_196112 ) ( ON ?auto_196110 ?auto_196111 ) ( ON ?auto_196109 ?auto_196110 ) ( ON ?auto_196105 ?auto_196113 ) ( not ( = ?auto_196105 ?auto_196113 ) ) ( not ( = ?auto_196106 ?auto_196113 ) ) ( not ( = ?auto_196107 ?auto_196113 ) ) ( not ( = ?auto_196108 ?auto_196113 ) ) ( not ( = ?auto_196109 ?auto_196113 ) ) ( not ( = ?auto_196110 ?auto_196113 ) ) ( not ( = ?auto_196111 ?auto_196113 ) ) ( not ( = ?auto_196112 ?auto_196113 ) ) ( ON ?auto_196106 ?auto_196105 ) ( ON-TABLE ?auto_196113 ) ( ON ?auto_196107 ?auto_196106 ) ( CLEAR ?auto_196107 ) ( HOLDING ?auto_196108 ) ( CLEAR ?auto_196109 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196112 ?auto_196111 ?auto_196110 ?auto_196109 ?auto_196108 )
      ( MAKE-8PILE ?auto_196105 ?auto_196106 ?auto_196107 ?auto_196108 ?auto_196109 ?auto_196110 ?auto_196111 ?auto_196112 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196114 - BLOCK
      ?auto_196115 - BLOCK
      ?auto_196116 - BLOCK
      ?auto_196117 - BLOCK
      ?auto_196118 - BLOCK
      ?auto_196119 - BLOCK
      ?auto_196120 - BLOCK
      ?auto_196121 - BLOCK
    )
    :vars
    (
      ?auto_196122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196114 ?auto_196115 ) ) ( not ( = ?auto_196114 ?auto_196116 ) ) ( not ( = ?auto_196114 ?auto_196117 ) ) ( not ( = ?auto_196114 ?auto_196118 ) ) ( not ( = ?auto_196114 ?auto_196119 ) ) ( not ( = ?auto_196114 ?auto_196120 ) ) ( not ( = ?auto_196114 ?auto_196121 ) ) ( not ( = ?auto_196115 ?auto_196116 ) ) ( not ( = ?auto_196115 ?auto_196117 ) ) ( not ( = ?auto_196115 ?auto_196118 ) ) ( not ( = ?auto_196115 ?auto_196119 ) ) ( not ( = ?auto_196115 ?auto_196120 ) ) ( not ( = ?auto_196115 ?auto_196121 ) ) ( not ( = ?auto_196116 ?auto_196117 ) ) ( not ( = ?auto_196116 ?auto_196118 ) ) ( not ( = ?auto_196116 ?auto_196119 ) ) ( not ( = ?auto_196116 ?auto_196120 ) ) ( not ( = ?auto_196116 ?auto_196121 ) ) ( not ( = ?auto_196117 ?auto_196118 ) ) ( not ( = ?auto_196117 ?auto_196119 ) ) ( not ( = ?auto_196117 ?auto_196120 ) ) ( not ( = ?auto_196117 ?auto_196121 ) ) ( not ( = ?auto_196118 ?auto_196119 ) ) ( not ( = ?auto_196118 ?auto_196120 ) ) ( not ( = ?auto_196118 ?auto_196121 ) ) ( not ( = ?auto_196119 ?auto_196120 ) ) ( not ( = ?auto_196119 ?auto_196121 ) ) ( not ( = ?auto_196120 ?auto_196121 ) ) ( ON-TABLE ?auto_196121 ) ( ON ?auto_196120 ?auto_196121 ) ( ON ?auto_196119 ?auto_196120 ) ( ON ?auto_196118 ?auto_196119 ) ( ON ?auto_196114 ?auto_196122 ) ( not ( = ?auto_196114 ?auto_196122 ) ) ( not ( = ?auto_196115 ?auto_196122 ) ) ( not ( = ?auto_196116 ?auto_196122 ) ) ( not ( = ?auto_196117 ?auto_196122 ) ) ( not ( = ?auto_196118 ?auto_196122 ) ) ( not ( = ?auto_196119 ?auto_196122 ) ) ( not ( = ?auto_196120 ?auto_196122 ) ) ( not ( = ?auto_196121 ?auto_196122 ) ) ( ON ?auto_196115 ?auto_196114 ) ( ON-TABLE ?auto_196122 ) ( ON ?auto_196116 ?auto_196115 ) ( CLEAR ?auto_196118 ) ( ON ?auto_196117 ?auto_196116 ) ( CLEAR ?auto_196117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196122 ?auto_196114 ?auto_196115 ?auto_196116 )
      ( MAKE-8PILE ?auto_196114 ?auto_196115 ?auto_196116 ?auto_196117 ?auto_196118 ?auto_196119 ?auto_196120 ?auto_196121 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196123 - BLOCK
      ?auto_196124 - BLOCK
      ?auto_196125 - BLOCK
      ?auto_196126 - BLOCK
      ?auto_196127 - BLOCK
      ?auto_196128 - BLOCK
      ?auto_196129 - BLOCK
      ?auto_196130 - BLOCK
    )
    :vars
    (
      ?auto_196131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196123 ?auto_196124 ) ) ( not ( = ?auto_196123 ?auto_196125 ) ) ( not ( = ?auto_196123 ?auto_196126 ) ) ( not ( = ?auto_196123 ?auto_196127 ) ) ( not ( = ?auto_196123 ?auto_196128 ) ) ( not ( = ?auto_196123 ?auto_196129 ) ) ( not ( = ?auto_196123 ?auto_196130 ) ) ( not ( = ?auto_196124 ?auto_196125 ) ) ( not ( = ?auto_196124 ?auto_196126 ) ) ( not ( = ?auto_196124 ?auto_196127 ) ) ( not ( = ?auto_196124 ?auto_196128 ) ) ( not ( = ?auto_196124 ?auto_196129 ) ) ( not ( = ?auto_196124 ?auto_196130 ) ) ( not ( = ?auto_196125 ?auto_196126 ) ) ( not ( = ?auto_196125 ?auto_196127 ) ) ( not ( = ?auto_196125 ?auto_196128 ) ) ( not ( = ?auto_196125 ?auto_196129 ) ) ( not ( = ?auto_196125 ?auto_196130 ) ) ( not ( = ?auto_196126 ?auto_196127 ) ) ( not ( = ?auto_196126 ?auto_196128 ) ) ( not ( = ?auto_196126 ?auto_196129 ) ) ( not ( = ?auto_196126 ?auto_196130 ) ) ( not ( = ?auto_196127 ?auto_196128 ) ) ( not ( = ?auto_196127 ?auto_196129 ) ) ( not ( = ?auto_196127 ?auto_196130 ) ) ( not ( = ?auto_196128 ?auto_196129 ) ) ( not ( = ?auto_196128 ?auto_196130 ) ) ( not ( = ?auto_196129 ?auto_196130 ) ) ( ON-TABLE ?auto_196130 ) ( ON ?auto_196129 ?auto_196130 ) ( ON ?auto_196128 ?auto_196129 ) ( ON ?auto_196123 ?auto_196131 ) ( not ( = ?auto_196123 ?auto_196131 ) ) ( not ( = ?auto_196124 ?auto_196131 ) ) ( not ( = ?auto_196125 ?auto_196131 ) ) ( not ( = ?auto_196126 ?auto_196131 ) ) ( not ( = ?auto_196127 ?auto_196131 ) ) ( not ( = ?auto_196128 ?auto_196131 ) ) ( not ( = ?auto_196129 ?auto_196131 ) ) ( not ( = ?auto_196130 ?auto_196131 ) ) ( ON ?auto_196124 ?auto_196123 ) ( ON-TABLE ?auto_196131 ) ( ON ?auto_196125 ?auto_196124 ) ( ON ?auto_196126 ?auto_196125 ) ( CLEAR ?auto_196126 ) ( HOLDING ?auto_196127 ) ( CLEAR ?auto_196128 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_196130 ?auto_196129 ?auto_196128 ?auto_196127 )
      ( MAKE-8PILE ?auto_196123 ?auto_196124 ?auto_196125 ?auto_196126 ?auto_196127 ?auto_196128 ?auto_196129 ?auto_196130 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196132 - BLOCK
      ?auto_196133 - BLOCK
      ?auto_196134 - BLOCK
      ?auto_196135 - BLOCK
      ?auto_196136 - BLOCK
      ?auto_196137 - BLOCK
      ?auto_196138 - BLOCK
      ?auto_196139 - BLOCK
    )
    :vars
    (
      ?auto_196140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196132 ?auto_196133 ) ) ( not ( = ?auto_196132 ?auto_196134 ) ) ( not ( = ?auto_196132 ?auto_196135 ) ) ( not ( = ?auto_196132 ?auto_196136 ) ) ( not ( = ?auto_196132 ?auto_196137 ) ) ( not ( = ?auto_196132 ?auto_196138 ) ) ( not ( = ?auto_196132 ?auto_196139 ) ) ( not ( = ?auto_196133 ?auto_196134 ) ) ( not ( = ?auto_196133 ?auto_196135 ) ) ( not ( = ?auto_196133 ?auto_196136 ) ) ( not ( = ?auto_196133 ?auto_196137 ) ) ( not ( = ?auto_196133 ?auto_196138 ) ) ( not ( = ?auto_196133 ?auto_196139 ) ) ( not ( = ?auto_196134 ?auto_196135 ) ) ( not ( = ?auto_196134 ?auto_196136 ) ) ( not ( = ?auto_196134 ?auto_196137 ) ) ( not ( = ?auto_196134 ?auto_196138 ) ) ( not ( = ?auto_196134 ?auto_196139 ) ) ( not ( = ?auto_196135 ?auto_196136 ) ) ( not ( = ?auto_196135 ?auto_196137 ) ) ( not ( = ?auto_196135 ?auto_196138 ) ) ( not ( = ?auto_196135 ?auto_196139 ) ) ( not ( = ?auto_196136 ?auto_196137 ) ) ( not ( = ?auto_196136 ?auto_196138 ) ) ( not ( = ?auto_196136 ?auto_196139 ) ) ( not ( = ?auto_196137 ?auto_196138 ) ) ( not ( = ?auto_196137 ?auto_196139 ) ) ( not ( = ?auto_196138 ?auto_196139 ) ) ( ON-TABLE ?auto_196139 ) ( ON ?auto_196138 ?auto_196139 ) ( ON ?auto_196137 ?auto_196138 ) ( ON ?auto_196132 ?auto_196140 ) ( not ( = ?auto_196132 ?auto_196140 ) ) ( not ( = ?auto_196133 ?auto_196140 ) ) ( not ( = ?auto_196134 ?auto_196140 ) ) ( not ( = ?auto_196135 ?auto_196140 ) ) ( not ( = ?auto_196136 ?auto_196140 ) ) ( not ( = ?auto_196137 ?auto_196140 ) ) ( not ( = ?auto_196138 ?auto_196140 ) ) ( not ( = ?auto_196139 ?auto_196140 ) ) ( ON ?auto_196133 ?auto_196132 ) ( ON-TABLE ?auto_196140 ) ( ON ?auto_196134 ?auto_196133 ) ( ON ?auto_196135 ?auto_196134 ) ( CLEAR ?auto_196137 ) ( ON ?auto_196136 ?auto_196135 ) ( CLEAR ?auto_196136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_196140 ?auto_196132 ?auto_196133 ?auto_196134 ?auto_196135 )
      ( MAKE-8PILE ?auto_196132 ?auto_196133 ?auto_196134 ?auto_196135 ?auto_196136 ?auto_196137 ?auto_196138 ?auto_196139 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196141 - BLOCK
      ?auto_196142 - BLOCK
      ?auto_196143 - BLOCK
      ?auto_196144 - BLOCK
      ?auto_196145 - BLOCK
      ?auto_196146 - BLOCK
      ?auto_196147 - BLOCK
      ?auto_196148 - BLOCK
    )
    :vars
    (
      ?auto_196149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196141 ?auto_196142 ) ) ( not ( = ?auto_196141 ?auto_196143 ) ) ( not ( = ?auto_196141 ?auto_196144 ) ) ( not ( = ?auto_196141 ?auto_196145 ) ) ( not ( = ?auto_196141 ?auto_196146 ) ) ( not ( = ?auto_196141 ?auto_196147 ) ) ( not ( = ?auto_196141 ?auto_196148 ) ) ( not ( = ?auto_196142 ?auto_196143 ) ) ( not ( = ?auto_196142 ?auto_196144 ) ) ( not ( = ?auto_196142 ?auto_196145 ) ) ( not ( = ?auto_196142 ?auto_196146 ) ) ( not ( = ?auto_196142 ?auto_196147 ) ) ( not ( = ?auto_196142 ?auto_196148 ) ) ( not ( = ?auto_196143 ?auto_196144 ) ) ( not ( = ?auto_196143 ?auto_196145 ) ) ( not ( = ?auto_196143 ?auto_196146 ) ) ( not ( = ?auto_196143 ?auto_196147 ) ) ( not ( = ?auto_196143 ?auto_196148 ) ) ( not ( = ?auto_196144 ?auto_196145 ) ) ( not ( = ?auto_196144 ?auto_196146 ) ) ( not ( = ?auto_196144 ?auto_196147 ) ) ( not ( = ?auto_196144 ?auto_196148 ) ) ( not ( = ?auto_196145 ?auto_196146 ) ) ( not ( = ?auto_196145 ?auto_196147 ) ) ( not ( = ?auto_196145 ?auto_196148 ) ) ( not ( = ?auto_196146 ?auto_196147 ) ) ( not ( = ?auto_196146 ?auto_196148 ) ) ( not ( = ?auto_196147 ?auto_196148 ) ) ( ON-TABLE ?auto_196148 ) ( ON ?auto_196147 ?auto_196148 ) ( ON ?auto_196141 ?auto_196149 ) ( not ( = ?auto_196141 ?auto_196149 ) ) ( not ( = ?auto_196142 ?auto_196149 ) ) ( not ( = ?auto_196143 ?auto_196149 ) ) ( not ( = ?auto_196144 ?auto_196149 ) ) ( not ( = ?auto_196145 ?auto_196149 ) ) ( not ( = ?auto_196146 ?auto_196149 ) ) ( not ( = ?auto_196147 ?auto_196149 ) ) ( not ( = ?auto_196148 ?auto_196149 ) ) ( ON ?auto_196142 ?auto_196141 ) ( ON-TABLE ?auto_196149 ) ( ON ?auto_196143 ?auto_196142 ) ( ON ?auto_196144 ?auto_196143 ) ( ON ?auto_196145 ?auto_196144 ) ( CLEAR ?auto_196145 ) ( HOLDING ?auto_196146 ) ( CLEAR ?auto_196147 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_196148 ?auto_196147 ?auto_196146 )
      ( MAKE-8PILE ?auto_196141 ?auto_196142 ?auto_196143 ?auto_196144 ?auto_196145 ?auto_196146 ?auto_196147 ?auto_196148 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196150 - BLOCK
      ?auto_196151 - BLOCK
      ?auto_196152 - BLOCK
      ?auto_196153 - BLOCK
      ?auto_196154 - BLOCK
      ?auto_196155 - BLOCK
      ?auto_196156 - BLOCK
      ?auto_196157 - BLOCK
    )
    :vars
    (
      ?auto_196158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196150 ?auto_196151 ) ) ( not ( = ?auto_196150 ?auto_196152 ) ) ( not ( = ?auto_196150 ?auto_196153 ) ) ( not ( = ?auto_196150 ?auto_196154 ) ) ( not ( = ?auto_196150 ?auto_196155 ) ) ( not ( = ?auto_196150 ?auto_196156 ) ) ( not ( = ?auto_196150 ?auto_196157 ) ) ( not ( = ?auto_196151 ?auto_196152 ) ) ( not ( = ?auto_196151 ?auto_196153 ) ) ( not ( = ?auto_196151 ?auto_196154 ) ) ( not ( = ?auto_196151 ?auto_196155 ) ) ( not ( = ?auto_196151 ?auto_196156 ) ) ( not ( = ?auto_196151 ?auto_196157 ) ) ( not ( = ?auto_196152 ?auto_196153 ) ) ( not ( = ?auto_196152 ?auto_196154 ) ) ( not ( = ?auto_196152 ?auto_196155 ) ) ( not ( = ?auto_196152 ?auto_196156 ) ) ( not ( = ?auto_196152 ?auto_196157 ) ) ( not ( = ?auto_196153 ?auto_196154 ) ) ( not ( = ?auto_196153 ?auto_196155 ) ) ( not ( = ?auto_196153 ?auto_196156 ) ) ( not ( = ?auto_196153 ?auto_196157 ) ) ( not ( = ?auto_196154 ?auto_196155 ) ) ( not ( = ?auto_196154 ?auto_196156 ) ) ( not ( = ?auto_196154 ?auto_196157 ) ) ( not ( = ?auto_196155 ?auto_196156 ) ) ( not ( = ?auto_196155 ?auto_196157 ) ) ( not ( = ?auto_196156 ?auto_196157 ) ) ( ON-TABLE ?auto_196157 ) ( ON ?auto_196156 ?auto_196157 ) ( ON ?auto_196150 ?auto_196158 ) ( not ( = ?auto_196150 ?auto_196158 ) ) ( not ( = ?auto_196151 ?auto_196158 ) ) ( not ( = ?auto_196152 ?auto_196158 ) ) ( not ( = ?auto_196153 ?auto_196158 ) ) ( not ( = ?auto_196154 ?auto_196158 ) ) ( not ( = ?auto_196155 ?auto_196158 ) ) ( not ( = ?auto_196156 ?auto_196158 ) ) ( not ( = ?auto_196157 ?auto_196158 ) ) ( ON ?auto_196151 ?auto_196150 ) ( ON-TABLE ?auto_196158 ) ( ON ?auto_196152 ?auto_196151 ) ( ON ?auto_196153 ?auto_196152 ) ( ON ?auto_196154 ?auto_196153 ) ( CLEAR ?auto_196156 ) ( ON ?auto_196155 ?auto_196154 ) ( CLEAR ?auto_196155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_196158 ?auto_196150 ?auto_196151 ?auto_196152 ?auto_196153 ?auto_196154 )
      ( MAKE-8PILE ?auto_196150 ?auto_196151 ?auto_196152 ?auto_196153 ?auto_196154 ?auto_196155 ?auto_196156 ?auto_196157 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196159 - BLOCK
      ?auto_196160 - BLOCK
      ?auto_196161 - BLOCK
      ?auto_196162 - BLOCK
      ?auto_196163 - BLOCK
      ?auto_196164 - BLOCK
      ?auto_196165 - BLOCK
      ?auto_196166 - BLOCK
    )
    :vars
    (
      ?auto_196167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196159 ?auto_196160 ) ) ( not ( = ?auto_196159 ?auto_196161 ) ) ( not ( = ?auto_196159 ?auto_196162 ) ) ( not ( = ?auto_196159 ?auto_196163 ) ) ( not ( = ?auto_196159 ?auto_196164 ) ) ( not ( = ?auto_196159 ?auto_196165 ) ) ( not ( = ?auto_196159 ?auto_196166 ) ) ( not ( = ?auto_196160 ?auto_196161 ) ) ( not ( = ?auto_196160 ?auto_196162 ) ) ( not ( = ?auto_196160 ?auto_196163 ) ) ( not ( = ?auto_196160 ?auto_196164 ) ) ( not ( = ?auto_196160 ?auto_196165 ) ) ( not ( = ?auto_196160 ?auto_196166 ) ) ( not ( = ?auto_196161 ?auto_196162 ) ) ( not ( = ?auto_196161 ?auto_196163 ) ) ( not ( = ?auto_196161 ?auto_196164 ) ) ( not ( = ?auto_196161 ?auto_196165 ) ) ( not ( = ?auto_196161 ?auto_196166 ) ) ( not ( = ?auto_196162 ?auto_196163 ) ) ( not ( = ?auto_196162 ?auto_196164 ) ) ( not ( = ?auto_196162 ?auto_196165 ) ) ( not ( = ?auto_196162 ?auto_196166 ) ) ( not ( = ?auto_196163 ?auto_196164 ) ) ( not ( = ?auto_196163 ?auto_196165 ) ) ( not ( = ?auto_196163 ?auto_196166 ) ) ( not ( = ?auto_196164 ?auto_196165 ) ) ( not ( = ?auto_196164 ?auto_196166 ) ) ( not ( = ?auto_196165 ?auto_196166 ) ) ( ON-TABLE ?auto_196166 ) ( ON ?auto_196159 ?auto_196167 ) ( not ( = ?auto_196159 ?auto_196167 ) ) ( not ( = ?auto_196160 ?auto_196167 ) ) ( not ( = ?auto_196161 ?auto_196167 ) ) ( not ( = ?auto_196162 ?auto_196167 ) ) ( not ( = ?auto_196163 ?auto_196167 ) ) ( not ( = ?auto_196164 ?auto_196167 ) ) ( not ( = ?auto_196165 ?auto_196167 ) ) ( not ( = ?auto_196166 ?auto_196167 ) ) ( ON ?auto_196160 ?auto_196159 ) ( ON-TABLE ?auto_196167 ) ( ON ?auto_196161 ?auto_196160 ) ( ON ?auto_196162 ?auto_196161 ) ( ON ?auto_196163 ?auto_196162 ) ( ON ?auto_196164 ?auto_196163 ) ( CLEAR ?auto_196164 ) ( HOLDING ?auto_196165 ) ( CLEAR ?auto_196166 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_196166 ?auto_196165 )
      ( MAKE-8PILE ?auto_196159 ?auto_196160 ?auto_196161 ?auto_196162 ?auto_196163 ?auto_196164 ?auto_196165 ?auto_196166 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196168 - BLOCK
      ?auto_196169 - BLOCK
      ?auto_196170 - BLOCK
      ?auto_196171 - BLOCK
      ?auto_196172 - BLOCK
      ?auto_196173 - BLOCK
      ?auto_196174 - BLOCK
      ?auto_196175 - BLOCK
    )
    :vars
    (
      ?auto_196176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196168 ?auto_196169 ) ) ( not ( = ?auto_196168 ?auto_196170 ) ) ( not ( = ?auto_196168 ?auto_196171 ) ) ( not ( = ?auto_196168 ?auto_196172 ) ) ( not ( = ?auto_196168 ?auto_196173 ) ) ( not ( = ?auto_196168 ?auto_196174 ) ) ( not ( = ?auto_196168 ?auto_196175 ) ) ( not ( = ?auto_196169 ?auto_196170 ) ) ( not ( = ?auto_196169 ?auto_196171 ) ) ( not ( = ?auto_196169 ?auto_196172 ) ) ( not ( = ?auto_196169 ?auto_196173 ) ) ( not ( = ?auto_196169 ?auto_196174 ) ) ( not ( = ?auto_196169 ?auto_196175 ) ) ( not ( = ?auto_196170 ?auto_196171 ) ) ( not ( = ?auto_196170 ?auto_196172 ) ) ( not ( = ?auto_196170 ?auto_196173 ) ) ( not ( = ?auto_196170 ?auto_196174 ) ) ( not ( = ?auto_196170 ?auto_196175 ) ) ( not ( = ?auto_196171 ?auto_196172 ) ) ( not ( = ?auto_196171 ?auto_196173 ) ) ( not ( = ?auto_196171 ?auto_196174 ) ) ( not ( = ?auto_196171 ?auto_196175 ) ) ( not ( = ?auto_196172 ?auto_196173 ) ) ( not ( = ?auto_196172 ?auto_196174 ) ) ( not ( = ?auto_196172 ?auto_196175 ) ) ( not ( = ?auto_196173 ?auto_196174 ) ) ( not ( = ?auto_196173 ?auto_196175 ) ) ( not ( = ?auto_196174 ?auto_196175 ) ) ( ON-TABLE ?auto_196175 ) ( ON ?auto_196168 ?auto_196176 ) ( not ( = ?auto_196168 ?auto_196176 ) ) ( not ( = ?auto_196169 ?auto_196176 ) ) ( not ( = ?auto_196170 ?auto_196176 ) ) ( not ( = ?auto_196171 ?auto_196176 ) ) ( not ( = ?auto_196172 ?auto_196176 ) ) ( not ( = ?auto_196173 ?auto_196176 ) ) ( not ( = ?auto_196174 ?auto_196176 ) ) ( not ( = ?auto_196175 ?auto_196176 ) ) ( ON ?auto_196169 ?auto_196168 ) ( ON-TABLE ?auto_196176 ) ( ON ?auto_196170 ?auto_196169 ) ( ON ?auto_196171 ?auto_196170 ) ( ON ?auto_196172 ?auto_196171 ) ( ON ?auto_196173 ?auto_196172 ) ( CLEAR ?auto_196175 ) ( ON ?auto_196174 ?auto_196173 ) ( CLEAR ?auto_196174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_196176 ?auto_196168 ?auto_196169 ?auto_196170 ?auto_196171 ?auto_196172 ?auto_196173 )
      ( MAKE-8PILE ?auto_196168 ?auto_196169 ?auto_196170 ?auto_196171 ?auto_196172 ?auto_196173 ?auto_196174 ?auto_196175 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196177 - BLOCK
      ?auto_196178 - BLOCK
      ?auto_196179 - BLOCK
      ?auto_196180 - BLOCK
      ?auto_196181 - BLOCK
      ?auto_196182 - BLOCK
      ?auto_196183 - BLOCK
      ?auto_196184 - BLOCK
    )
    :vars
    (
      ?auto_196185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196177 ?auto_196178 ) ) ( not ( = ?auto_196177 ?auto_196179 ) ) ( not ( = ?auto_196177 ?auto_196180 ) ) ( not ( = ?auto_196177 ?auto_196181 ) ) ( not ( = ?auto_196177 ?auto_196182 ) ) ( not ( = ?auto_196177 ?auto_196183 ) ) ( not ( = ?auto_196177 ?auto_196184 ) ) ( not ( = ?auto_196178 ?auto_196179 ) ) ( not ( = ?auto_196178 ?auto_196180 ) ) ( not ( = ?auto_196178 ?auto_196181 ) ) ( not ( = ?auto_196178 ?auto_196182 ) ) ( not ( = ?auto_196178 ?auto_196183 ) ) ( not ( = ?auto_196178 ?auto_196184 ) ) ( not ( = ?auto_196179 ?auto_196180 ) ) ( not ( = ?auto_196179 ?auto_196181 ) ) ( not ( = ?auto_196179 ?auto_196182 ) ) ( not ( = ?auto_196179 ?auto_196183 ) ) ( not ( = ?auto_196179 ?auto_196184 ) ) ( not ( = ?auto_196180 ?auto_196181 ) ) ( not ( = ?auto_196180 ?auto_196182 ) ) ( not ( = ?auto_196180 ?auto_196183 ) ) ( not ( = ?auto_196180 ?auto_196184 ) ) ( not ( = ?auto_196181 ?auto_196182 ) ) ( not ( = ?auto_196181 ?auto_196183 ) ) ( not ( = ?auto_196181 ?auto_196184 ) ) ( not ( = ?auto_196182 ?auto_196183 ) ) ( not ( = ?auto_196182 ?auto_196184 ) ) ( not ( = ?auto_196183 ?auto_196184 ) ) ( ON ?auto_196177 ?auto_196185 ) ( not ( = ?auto_196177 ?auto_196185 ) ) ( not ( = ?auto_196178 ?auto_196185 ) ) ( not ( = ?auto_196179 ?auto_196185 ) ) ( not ( = ?auto_196180 ?auto_196185 ) ) ( not ( = ?auto_196181 ?auto_196185 ) ) ( not ( = ?auto_196182 ?auto_196185 ) ) ( not ( = ?auto_196183 ?auto_196185 ) ) ( not ( = ?auto_196184 ?auto_196185 ) ) ( ON ?auto_196178 ?auto_196177 ) ( ON-TABLE ?auto_196185 ) ( ON ?auto_196179 ?auto_196178 ) ( ON ?auto_196180 ?auto_196179 ) ( ON ?auto_196181 ?auto_196180 ) ( ON ?auto_196182 ?auto_196181 ) ( ON ?auto_196183 ?auto_196182 ) ( CLEAR ?auto_196183 ) ( HOLDING ?auto_196184 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_196184 )
      ( MAKE-8PILE ?auto_196177 ?auto_196178 ?auto_196179 ?auto_196180 ?auto_196181 ?auto_196182 ?auto_196183 ?auto_196184 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_196186 - BLOCK
      ?auto_196187 - BLOCK
      ?auto_196188 - BLOCK
      ?auto_196189 - BLOCK
      ?auto_196190 - BLOCK
      ?auto_196191 - BLOCK
      ?auto_196192 - BLOCK
      ?auto_196193 - BLOCK
    )
    :vars
    (
      ?auto_196194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_196186 ?auto_196187 ) ) ( not ( = ?auto_196186 ?auto_196188 ) ) ( not ( = ?auto_196186 ?auto_196189 ) ) ( not ( = ?auto_196186 ?auto_196190 ) ) ( not ( = ?auto_196186 ?auto_196191 ) ) ( not ( = ?auto_196186 ?auto_196192 ) ) ( not ( = ?auto_196186 ?auto_196193 ) ) ( not ( = ?auto_196187 ?auto_196188 ) ) ( not ( = ?auto_196187 ?auto_196189 ) ) ( not ( = ?auto_196187 ?auto_196190 ) ) ( not ( = ?auto_196187 ?auto_196191 ) ) ( not ( = ?auto_196187 ?auto_196192 ) ) ( not ( = ?auto_196187 ?auto_196193 ) ) ( not ( = ?auto_196188 ?auto_196189 ) ) ( not ( = ?auto_196188 ?auto_196190 ) ) ( not ( = ?auto_196188 ?auto_196191 ) ) ( not ( = ?auto_196188 ?auto_196192 ) ) ( not ( = ?auto_196188 ?auto_196193 ) ) ( not ( = ?auto_196189 ?auto_196190 ) ) ( not ( = ?auto_196189 ?auto_196191 ) ) ( not ( = ?auto_196189 ?auto_196192 ) ) ( not ( = ?auto_196189 ?auto_196193 ) ) ( not ( = ?auto_196190 ?auto_196191 ) ) ( not ( = ?auto_196190 ?auto_196192 ) ) ( not ( = ?auto_196190 ?auto_196193 ) ) ( not ( = ?auto_196191 ?auto_196192 ) ) ( not ( = ?auto_196191 ?auto_196193 ) ) ( not ( = ?auto_196192 ?auto_196193 ) ) ( ON ?auto_196186 ?auto_196194 ) ( not ( = ?auto_196186 ?auto_196194 ) ) ( not ( = ?auto_196187 ?auto_196194 ) ) ( not ( = ?auto_196188 ?auto_196194 ) ) ( not ( = ?auto_196189 ?auto_196194 ) ) ( not ( = ?auto_196190 ?auto_196194 ) ) ( not ( = ?auto_196191 ?auto_196194 ) ) ( not ( = ?auto_196192 ?auto_196194 ) ) ( not ( = ?auto_196193 ?auto_196194 ) ) ( ON ?auto_196187 ?auto_196186 ) ( ON-TABLE ?auto_196194 ) ( ON ?auto_196188 ?auto_196187 ) ( ON ?auto_196189 ?auto_196188 ) ( ON ?auto_196190 ?auto_196189 ) ( ON ?auto_196191 ?auto_196190 ) ( ON ?auto_196192 ?auto_196191 ) ( ON ?auto_196193 ?auto_196192 ) ( CLEAR ?auto_196193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_196194 ?auto_196186 ?auto_196187 ?auto_196188 ?auto_196189 ?auto_196190 ?auto_196191 ?auto_196192 )
      ( MAKE-8PILE ?auto_196186 ?auto_196187 ?auto_196188 ?auto_196189 ?auto_196190 ?auto_196191 ?auto_196192 ?auto_196193 ) )
  )

)

