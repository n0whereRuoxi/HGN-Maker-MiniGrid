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
      ?auto_577855 - BLOCK
    )
    :vars
    (
      ?auto_577856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577855 ?auto_577856 ) ( CLEAR ?auto_577855 ) ( HAND-EMPTY ) ( not ( = ?auto_577855 ?auto_577856 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_577855 ?auto_577856 )
      ( !PUTDOWN ?auto_577855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_577862 - BLOCK
      ?auto_577863 - BLOCK
    )
    :vars
    (
      ?auto_577864 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_577862 ) ( ON ?auto_577863 ?auto_577864 ) ( CLEAR ?auto_577863 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_577862 ) ( not ( = ?auto_577862 ?auto_577863 ) ) ( not ( = ?auto_577862 ?auto_577864 ) ) ( not ( = ?auto_577863 ?auto_577864 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_577863 ?auto_577864 )
      ( !STACK ?auto_577863 ?auto_577862 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_577872 - BLOCK
      ?auto_577873 - BLOCK
    )
    :vars
    (
      ?auto_577874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577873 ?auto_577874 ) ( not ( = ?auto_577872 ?auto_577873 ) ) ( not ( = ?auto_577872 ?auto_577874 ) ) ( not ( = ?auto_577873 ?auto_577874 ) ) ( ON ?auto_577872 ?auto_577873 ) ( CLEAR ?auto_577872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_577872 )
      ( MAKE-2PILE ?auto_577872 ?auto_577873 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_577883 - BLOCK
      ?auto_577884 - BLOCK
      ?auto_577885 - BLOCK
    )
    :vars
    (
      ?auto_577886 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_577884 ) ( ON ?auto_577885 ?auto_577886 ) ( CLEAR ?auto_577885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_577883 ) ( ON ?auto_577884 ?auto_577883 ) ( not ( = ?auto_577883 ?auto_577884 ) ) ( not ( = ?auto_577883 ?auto_577885 ) ) ( not ( = ?auto_577883 ?auto_577886 ) ) ( not ( = ?auto_577884 ?auto_577885 ) ) ( not ( = ?auto_577884 ?auto_577886 ) ) ( not ( = ?auto_577885 ?auto_577886 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_577885 ?auto_577886 )
      ( !STACK ?auto_577885 ?auto_577884 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_577897 - BLOCK
      ?auto_577898 - BLOCK
      ?auto_577899 - BLOCK
    )
    :vars
    (
      ?auto_577900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577899 ?auto_577900 ) ( ON-TABLE ?auto_577897 ) ( not ( = ?auto_577897 ?auto_577898 ) ) ( not ( = ?auto_577897 ?auto_577899 ) ) ( not ( = ?auto_577897 ?auto_577900 ) ) ( not ( = ?auto_577898 ?auto_577899 ) ) ( not ( = ?auto_577898 ?auto_577900 ) ) ( not ( = ?auto_577899 ?auto_577900 ) ) ( CLEAR ?auto_577897 ) ( ON ?auto_577898 ?auto_577899 ) ( CLEAR ?auto_577898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_577897 ?auto_577898 )
      ( MAKE-3PILE ?auto_577897 ?auto_577898 ?auto_577899 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_577911 - BLOCK
      ?auto_577912 - BLOCK
      ?auto_577913 - BLOCK
    )
    :vars
    (
      ?auto_577914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577913 ?auto_577914 ) ( not ( = ?auto_577911 ?auto_577912 ) ) ( not ( = ?auto_577911 ?auto_577913 ) ) ( not ( = ?auto_577911 ?auto_577914 ) ) ( not ( = ?auto_577912 ?auto_577913 ) ) ( not ( = ?auto_577912 ?auto_577914 ) ) ( not ( = ?auto_577913 ?auto_577914 ) ) ( ON ?auto_577912 ?auto_577913 ) ( ON ?auto_577911 ?auto_577912 ) ( CLEAR ?auto_577911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_577911 )
      ( MAKE-3PILE ?auto_577911 ?auto_577912 ?auto_577913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_577926 - BLOCK
      ?auto_577927 - BLOCK
      ?auto_577928 - BLOCK
      ?auto_577929 - BLOCK
    )
    :vars
    (
      ?auto_577930 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_577928 ) ( ON ?auto_577929 ?auto_577930 ) ( CLEAR ?auto_577929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_577926 ) ( ON ?auto_577927 ?auto_577926 ) ( ON ?auto_577928 ?auto_577927 ) ( not ( = ?auto_577926 ?auto_577927 ) ) ( not ( = ?auto_577926 ?auto_577928 ) ) ( not ( = ?auto_577926 ?auto_577929 ) ) ( not ( = ?auto_577926 ?auto_577930 ) ) ( not ( = ?auto_577927 ?auto_577928 ) ) ( not ( = ?auto_577927 ?auto_577929 ) ) ( not ( = ?auto_577927 ?auto_577930 ) ) ( not ( = ?auto_577928 ?auto_577929 ) ) ( not ( = ?auto_577928 ?auto_577930 ) ) ( not ( = ?auto_577929 ?auto_577930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_577929 ?auto_577930 )
      ( !STACK ?auto_577929 ?auto_577928 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_577944 - BLOCK
      ?auto_577945 - BLOCK
      ?auto_577946 - BLOCK
      ?auto_577947 - BLOCK
    )
    :vars
    (
      ?auto_577948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577947 ?auto_577948 ) ( ON-TABLE ?auto_577944 ) ( ON ?auto_577945 ?auto_577944 ) ( not ( = ?auto_577944 ?auto_577945 ) ) ( not ( = ?auto_577944 ?auto_577946 ) ) ( not ( = ?auto_577944 ?auto_577947 ) ) ( not ( = ?auto_577944 ?auto_577948 ) ) ( not ( = ?auto_577945 ?auto_577946 ) ) ( not ( = ?auto_577945 ?auto_577947 ) ) ( not ( = ?auto_577945 ?auto_577948 ) ) ( not ( = ?auto_577946 ?auto_577947 ) ) ( not ( = ?auto_577946 ?auto_577948 ) ) ( not ( = ?auto_577947 ?auto_577948 ) ) ( CLEAR ?auto_577945 ) ( ON ?auto_577946 ?auto_577947 ) ( CLEAR ?auto_577946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_577944 ?auto_577945 ?auto_577946 )
      ( MAKE-4PILE ?auto_577944 ?auto_577945 ?auto_577946 ?auto_577947 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_577962 - BLOCK
      ?auto_577963 - BLOCK
      ?auto_577964 - BLOCK
      ?auto_577965 - BLOCK
    )
    :vars
    (
      ?auto_577966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577965 ?auto_577966 ) ( ON-TABLE ?auto_577962 ) ( not ( = ?auto_577962 ?auto_577963 ) ) ( not ( = ?auto_577962 ?auto_577964 ) ) ( not ( = ?auto_577962 ?auto_577965 ) ) ( not ( = ?auto_577962 ?auto_577966 ) ) ( not ( = ?auto_577963 ?auto_577964 ) ) ( not ( = ?auto_577963 ?auto_577965 ) ) ( not ( = ?auto_577963 ?auto_577966 ) ) ( not ( = ?auto_577964 ?auto_577965 ) ) ( not ( = ?auto_577964 ?auto_577966 ) ) ( not ( = ?auto_577965 ?auto_577966 ) ) ( ON ?auto_577964 ?auto_577965 ) ( CLEAR ?auto_577962 ) ( ON ?auto_577963 ?auto_577964 ) ( CLEAR ?auto_577963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_577962 ?auto_577963 )
      ( MAKE-4PILE ?auto_577962 ?auto_577963 ?auto_577964 ?auto_577965 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_577980 - BLOCK
      ?auto_577981 - BLOCK
      ?auto_577982 - BLOCK
      ?auto_577983 - BLOCK
    )
    :vars
    (
      ?auto_577984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_577983 ?auto_577984 ) ( not ( = ?auto_577980 ?auto_577981 ) ) ( not ( = ?auto_577980 ?auto_577982 ) ) ( not ( = ?auto_577980 ?auto_577983 ) ) ( not ( = ?auto_577980 ?auto_577984 ) ) ( not ( = ?auto_577981 ?auto_577982 ) ) ( not ( = ?auto_577981 ?auto_577983 ) ) ( not ( = ?auto_577981 ?auto_577984 ) ) ( not ( = ?auto_577982 ?auto_577983 ) ) ( not ( = ?auto_577982 ?auto_577984 ) ) ( not ( = ?auto_577983 ?auto_577984 ) ) ( ON ?auto_577982 ?auto_577983 ) ( ON ?auto_577981 ?auto_577982 ) ( ON ?auto_577980 ?auto_577981 ) ( CLEAR ?auto_577980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_577980 )
      ( MAKE-4PILE ?auto_577980 ?auto_577981 ?auto_577982 ?auto_577983 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_577999 - BLOCK
      ?auto_578000 - BLOCK
      ?auto_578001 - BLOCK
      ?auto_578002 - BLOCK
      ?auto_578003 - BLOCK
    )
    :vars
    (
      ?auto_578004 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_578002 ) ( ON ?auto_578003 ?auto_578004 ) ( CLEAR ?auto_578003 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_577999 ) ( ON ?auto_578000 ?auto_577999 ) ( ON ?auto_578001 ?auto_578000 ) ( ON ?auto_578002 ?auto_578001 ) ( not ( = ?auto_577999 ?auto_578000 ) ) ( not ( = ?auto_577999 ?auto_578001 ) ) ( not ( = ?auto_577999 ?auto_578002 ) ) ( not ( = ?auto_577999 ?auto_578003 ) ) ( not ( = ?auto_577999 ?auto_578004 ) ) ( not ( = ?auto_578000 ?auto_578001 ) ) ( not ( = ?auto_578000 ?auto_578002 ) ) ( not ( = ?auto_578000 ?auto_578003 ) ) ( not ( = ?auto_578000 ?auto_578004 ) ) ( not ( = ?auto_578001 ?auto_578002 ) ) ( not ( = ?auto_578001 ?auto_578003 ) ) ( not ( = ?auto_578001 ?auto_578004 ) ) ( not ( = ?auto_578002 ?auto_578003 ) ) ( not ( = ?auto_578002 ?auto_578004 ) ) ( not ( = ?auto_578003 ?auto_578004 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_578003 ?auto_578004 )
      ( !STACK ?auto_578003 ?auto_578002 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_578021 - BLOCK
      ?auto_578022 - BLOCK
      ?auto_578023 - BLOCK
      ?auto_578024 - BLOCK
      ?auto_578025 - BLOCK
    )
    :vars
    (
      ?auto_578026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578025 ?auto_578026 ) ( ON-TABLE ?auto_578021 ) ( ON ?auto_578022 ?auto_578021 ) ( ON ?auto_578023 ?auto_578022 ) ( not ( = ?auto_578021 ?auto_578022 ) ) ( not ( = ?auto_578021 ?auto_578023 ) ) ( not ( = ?auto_578021 ?auto_578024 ) ) ( not ( = ?auto_578021 ?auto_578025 ) ) ( not ( = ?auto_578021 ?auto_578026 ) ) ( not ( = ?auto_578022 ?auto_578023 ) ) ( not ( = ?auto_578022 ?auto_578024 ) ) ( not ( = ?auto_578022 ?auto_578025 ) ) ( not ( = ?auto_578022 ?auto_578026 ) ) ( not ( = ?auto_578023 ?auto_578024 ) ) ( not ( = ?auto_578023 ?auto_578025 ) ) ( not ( = ?auto_578023 ?auto_578026 ) ) ( not ( = ?auto_578024 ?auto_578025 ) ) ( not ( = ?auto_578024 ?auto_578026 ) ) ( not ( = ?auto_578025 ?auto_578026 ) ) ( CLEAR ?auto_578023 ) ( ON ?auto_578024 ?auto_578025 ) ( CLEAR ?auto_578024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_578021 ?auto_578022 ?auto_578023 ?auto_578024 )
      ( MAKE-5PILE ?auto_578021 ?auto_578022 ?auto_578023 ?auto_578024 ?auto_578025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_578043 - BLOCK
      ?auto_578044 - BLOCK
      ?auto_578045 - BLOCK
      ?auto_578046 - BLOCK
      ?auto_578047 - BLOCK
    )
    :vars
    (
      ?auto_578048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578047 ?auto_578048 ) ( ON-TABLE ?auto_578043 ) ( ON ?auto_578044 ?auto_578043 ) ( not ( = ?auto_578043 ?auto_578044 ) ) ( not ( = ?auto_578043 ?auto_578045 ) ) ( not ( = ?auto_578043 ?auto_578046 ) ) ( not ( = ?auto_578043 ?auto_578047 ) ) ( not ( = ?auto_578043 ?auto_578048 ) ) ( not ( = ?auto_578044 ?auto_578045 ) ) ( not ( = ?auto_578044 ?auto_578046 ) ) ( not ( = ?auto_578044 ?auto_578047 ) ) ( not ( = ?auto_578044 ?auto_578048 ) ) ( not ( = ?auto_578045 ?auto_578046 ) ) ( not ( = ?auto_578045 ?auto_578047 ) ) ( not ( = ?auto_578045 ?auto_578048 ) ) ( not ( = ?auto_578046 ?auto_578047 ) ) ( not ( = ?auto_578046 ?auto_578048 ) ) ( not ( = ?auto_578047 ?auto_578048 ) ) ( ON ?auto_578046 ?auto_578047 ) ( CLEAR ?auto_578044 ) ( ON ?auto_578045 ?auto_578046 ) ( CLEAR ?auto_578045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_578043 ?auto_578044 ?auto_578045 )
      ( MAKE-5PILE ?auto_578043 ?auto_578044 ?auto_578045 ?auto_578046 ?auto_578047 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_578065 - BLOCK
      ?auto_578066 - BLOCK
      ?auto_578067 - BLOCK
      ?auto_578068 - BLOCK
      ?auto_578069 - BLOCK
    )
    :vars
    (
      ?auto_578070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578069 ?auto_578070 ) ( ON-TABLE ?auto_578065 ) ( not ( = ?auto_578065 ?auto_578066 ) ) ( not ( = ?auto_578065 ?auto_578067 ) ) ( not ( = ?auto_578065 ?auto_578068 ) ) ( not ( = ?auto_578065 ?auto_578069 ) ) ( not ( = ?auto_578065 ?auto_578070 ) ) ( not ( = ?auto_578066 ?auto_578067 ) ) ( not ( = ?auto_578066 ?auto_578068 ) ) ( not ( = ?auto_578066 ?auto_578069 ) ) ( not ( = ?auto_578066 ?auto_578070 ) ) ( not ( = ?auto_578067 ?auto_578068 ) ) ( not ( = ?auto_578067 ?auto_578069 ) ) ( not ( = ?auto_578067 ?auto_578070 ) ) ( not ( = ?auto_578068 ?auto_578069 ) ) ( not ( = ?auto_578068 ?auto_578070 ) ) ( not ( = ?auto_578069 ?auto_578070 ) ) ( ON ?auto_578068 ?auto_578069 ) ( ON ?auto_578067 ?auto_578068 ) ( CLEAR ?auto_578065 ) ( ON ?auto_578066 ?auto_578067 ) ( CLEAR ?auto_578066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_578065 ?auto_578066 )
      ( MAKE-5PILE ?auto_578065 ?auto_578066 ?auto_578067 ?auto_578068 ?auto_578069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_578087 - BLOCK
      ?auto_578088 - BLOCK
      ?auto_578089 - BLOCK
      ?auto_578090 - BLOCK
      ?auto_578091 - BLOCK
    )
    :vars
    (
      ?auto_578092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578091 ?auto_578092 ) ( not ( = ?auto_578087 ?auto_578088 ) ) ( not ( = ?auto_578087 ?auto_578089 ) ) ( not ( = ?auto_578087 ?auto_578090 ) ) ( not ( = ?auto_578087 ?auto_578091 ) ) ( not ( = ?auto_578087 ?auto_578092 ) ) ( not ( = ?auto_578088 ?auto_578089 ) ) ( not ( = ?auto_578088 ?auto_578090 ) ) ( not ( = ?auto_578088 ?auto_578091 ) ) ( not ( = ?auto_578088 ?auto_578092 ) ) ( not ( = ?auto_578089 ?auto_578090 ) ) ( not ( = ?auto_578089 ?auto_578091 ) ) ( not ( = ?auto_578089 ?auto_578092 ) ) ( not ( = ?auto_578090 ?auto_578091 ) ) ( not ( = ?auto_578090 ?auto_578092 ) ) ( not ( = ?auto_578091 ?auto_578092 ) ) ( ON ?auto_578090 ?auto_578091 ) ( ON ?auto_578089 ?auto_578090 ) ( ON ?auto_578088 ?auto_578089 ) ( ON ?auto_578087 ?auto_578088 ) ( CLEAR ?auto_578087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_578087 )
      ( MAKE-5PILE ?auto_578087 ?auto_578088 ?auto_578089 ?auto_578090 ?auto_578091 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_578110 - BLOCK
      ?auto_578111 - BLOCK
      ?auto_578112 - BLOCK
      ?auto_578113 - BLOCK
      ?auto_578114 - BLOCK
      ?auto_578115 - BLOCK
    )
    :vars
    (
      ?auto_578116 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_578114 ) ( ON ?auto_578115 ?auto_578116 ) ( CLEAR ?auto_578115 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_578110 ) ( ON ?auto_578111 ?auto_578110 ) ( ON ?auto_578112 ?auto_578111 ) ( ON ?auto_578113 ?auto_578112 ) ( ON ?auto_578114 ?auto_578113 ) ( not ( = ?auto_578110 ?auto_578111 ) ) ( not ( = ?auto_578110 ?auto_578112 ) ) ( not ( = ?auto_578110 ?auto_578113 ) ) ( not ( = ?auto_578110 ?auto_578114 ) ) ( not ( = ?auto_578110 ?auto_578115 ) ) ( not ( = ?auto_578110 ?auto_578116 ) ) ( not ( = ?auto_578111 ?auto_578112 ) ) ( not ( = ?auto_578111 ?auto_578113 ) ) ( not ( = ?auto_578111 ?auto_578114 ) ) ( not ( = ?auto_578111 ?auto_578115 ) ) ( not ( = ?auto_578111 ?auto_578116 ) ) ( not ( = ?auto_578112 ?auto_578113 ) ) ( not ( = ?auto_578112 ?auto_578114 ) ) ( not ( = ?auto_578112 ?auto_578115 ) ) ( not ( = ?auto_578112 ?auto_578116 ) ) ( not ( = ?auto_578113 ?auto_578114 ) ) ( not ( = ?auto_578113 ?auto_578115 ) ) ( not ( = ?auto_578113 ?auto_578116 ) ) ( not ( = ?auto_578114 ?auto_578115 ) ) ( not ( = ?auto_578114 ?auto_578116 ) ) ( not ( = ?auto_578115 ?auto_578116 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_578115 ?auto_578116 )
      ( !STACK ?auto_578115 ?auto_578114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_578136 - BLOCK
      ?auto_578137 - BLOCK
      ?auto_578138 - BLOCK
      ?auto_578139 - BLOCK
      ?auto_578140 - BLOCK
      ?auto_578141 - BLOCK
    )
    :vars
    (
      ?auto_578142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578141 ?auto_578142 ) ( ON-TABLE ?auto_578136 ) ( ON ?auto_578137 ?auto_578136 ) ( ON ?auto_578138 ?auto_578137 ) ( ON ?auto_578139 ?auto_578138 ) ( not ( = ?auto_578136 ?auto_578137 ) ) ( not ( = ?auto_578136 ?auto_578138 ) ) ( not ( = ?auto_578136 ?auto_578139 ) ) ( not ( = ?auto_578136 ?auto_578140 ) ) ( not ( = ?auto_578136 ?auto_578141 ) ) ( not ( = ?auto_578136 ?auto_578142 ) ) ( not ( = ?auto_578137 ?auto_578138 ) ) ( not ( = ?auto_578137 ?auto_578139 ) ) ( not ( = ?auto_578137 ?auto_578140 ) ) ( not ( = ?auto_578137 ?auto_578141 ) ) ( not ( = ?auto_578137 ?auto_578142 ) ) ( not ( = ?auto_578138 ?auto_578139 ) ) ( not ( = ?auto_578138 ?auto_578140 ) ) ( not ( = ?auto_578138 ?auto_578141 ) ) ( not ( = ?auto_578138 ?auto_578142 ) ) ( not ( = ?auto_578139 ?auto_578140 ) ) ( not ( = ?auto_578139 ?auto_578141 ) ) ( not ( = ?auto_578139 ?auto_578142 ) ) ( not ( = ?auto_578140 ?auto_578141 ) ) ( not ( = ?auto_578140 ?auto_578142 ) ) ( not ( = ?auto_578141 ?auto_578142 ) ) ( CLEAR ?auto_578139 ) ( ON ?auto_578140 ?auto_578141 ) ( CLEAR ?auto_578140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_578136 ?auto_578137 ?auto_578138 ?auto_578139 ?auto_578140 )
      ( MAKE-6PILE ?auto_578136 ?auto_578137 ?auto_578138 ?auto_578139 ?auto_578140 ?auto_578141 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_578162 - BLOCK
      ?auto_578163 - BLOCK
      ?auto_578164 - BLOCK
      ?auto_578165 - BLOCK
      ?auto_578166 - BLOCK
      ?auto_578167 - BLOCK
    )
    :vars
    (
      ?auto_578168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578167 ?auto_578168 ) ( ON-TABLE ?auto_578162 ) ( ON ?auto_578163 ?auto_578162 ) ( ON ?auto_578164 ?auto_578163 ) ( not ( = ?auto_578162 ?auto_578163 ) ) ( not ( = ?auto_578162 ?auto_578164 ) ) ( not ( = ?auto_578162 ?auto_578165 ) ) ( not ( = ?auto_578162 ?auto_578166 ) ) ( not ( = ?auto_578162 ?auto_578167 ) ) ( not ( = ?auto_578162 ?auto_578168 ) ) ( not ( = ?auto_578163 ?auto_578164 ) ) ( not ( = ?auto_578163 ?auto_578165 ) ) ( not ( = ?auto_578163 ?auto_578166 ) ) ( not ( = ?auto_578163 ?auto_578167 ) ) ( not ( = ?auto_578163 ?auto_578168 ) ) ( not ( = ?auto_578164 ?auto_578165 ) ) ( not ( = ?auto_578164 ?auto_578166 ) ) ( not ( = ?auto_578164 ?auto_578167 ) ) ( not ( = ?auto_578164 ?auto_578168 ) ) ( not ( = ?auto_578165 ?auto_578166 ) ) ( not ( = ?auto_578165 ?auto_578167 ) ) ( not ( = ?auto_578165 ?auto_578168 ) ) ( not ( = ?auto_578166 ?auto_578167 ) ) ( not ( = ?auto_578166 ?auto_578168 ) ) ( not ( = ?auto_578167 ?auto_578168 ) ) ( ON ?auto_578166 ?auto_578167 ) ( CLEAR ?auto_578164 ) ( ON ?auto_578165 ?auto_578166 ) ( CLEAR ?auto_578165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_578162 ?auto_578163 ?auto_578164 ?auto_578165 )
      ( MAKE-6PILE ?auto_578162 ?auto_578163 ?auto_578164 ?auto_578165 ?auto_578166 ?auto_578167 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_578188 - BLOCK
      ?auto_578189 - BLOCK
      ?auto_578190 - BLOCK
      ?auto_578191 - BLOCK
      ?auto_578192 - BLOCK
      ?auto_578193 - BLOCK
    )
    :vars
    (
      ?auto_578194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578193 ?auto_578194 ) ( ON-TABLE ?auto_578188 ) ( ON ?auto_578189 ?auto_578188 ) ( not ( = ?auto_578188 ?auto_578189 ) ) ( not ( = ?auto_578188 ?auto_578190 ) ) ( not ( = ?auto_578188 ?auto_578191 ) ) ( not ( = ?auto_578188 ?auto_578192 ) ) ( not ( = ?auto_578188 ?auto_578193 ) ) ( not ( = ?auto_578188 ?auto_578194 ) ) ( not ( = ?auto_578189 ?auto_578190 ) ) ( not ( = ?auto_578189 ?auto_578191 ) ) ( not ( = ?auto_578189 ?auto_578192 ) ) ( not ( = ?auto_578189 ?auto_578193 ) ) ( not ( = ?auto_578189 ?auto_578194 ) ) ( not ( = ?auto_578190 ?auto_578191 ) ) ( not ( = ?auto_578190 ?auto_578192 ) ) ( not ( = ?auto_578190 ?auto_578193 ) ) ( not ( = ?auto_578190 ?auto_578194 ) ) ( not ( = ?auto_578191 ?auto_578192 ) ) ( not ( = ?auto_578191 ?auto_578193 ) ) ( not ( = ?auto_578191 ?auto_578194 ) ) ( not ( = ?auto_578192 ?auto_578193 ) ) ( not ( = ?auto_578192 ?auto_578194 ) ) ( not ( = ?auto_578193 ?auto_578194 ) ) ( ON ?auto_578192 ?auto_578193 ) ( ON ?auto_578191 ?auto_578192 ) ( CLEAR ?auto_578189 ) ( ON ?auto_578190 ?auto_578191 ) ( CLEAR ?auto_578190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_578188 ?auto_578189 ?auto_578190 )
      ( MAKE-6PILE ?auto_578188 ?auto_578189 ?auto_578190 ?auto_578191 ?auto_578192 ?auto_578193 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_578214 - BLOCK
      ?auto_578215 - BLOCK
      ?auto_578216 - BLOCK
      ?auto_578217 - BLOCK
      ?auto_578218 - BLOCK
      ?auto_578219 - BLOCK
    )
    :vars
    (
      ?auto_578220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578219 ?auto_578220 ) ( ON-TABLE ?auto_578214 ) ( not ( = ?auto_578214 ?auto_578215 ) ) ( not ( = ?auto_578214 ?auto_578216 ) ) ( not ( = ?auto_578214 ?auto_578217 ) ) ( not ( = ?auto_578214 ?auto_578218 ) ) ( not ( = ?auto_578214 ?auto_578219 ) ) ( not ( = ?auto_578214 ?auto_578220 ) ) ( not ( = ?auto_578215 ?auto_578216 ) ) ( not ( = ?auto_578215 ?auto_578217 ) ) ( not ( = ?auto_578215 ?auto_578218 ) ) ( not ( = ?auto_578215 ?auto_578219 ) ) ( not ( = ?auto_578215 ?auto_578220 ) ) ( not ( = ?auto_578216 ?auto_578217 ) ) ( not ( = ?auto_578216 ?auto_578218 ) ) ( not ( = ?auto_578216 ?auto_578219 ) ) ( not ( = ?auto_578216 ?auto_578220 ) ) ( not ( = ?auto_578217 ?auto_578218 ) ) ( not ( = ?auto_578217 ?auto_578219 ) ) ( not ( = ?auto_578217 ?auto_578220 ) ) ( not ( = ?auto_578218 ?auto_578219 ) ) ( not ( = ?auto_578218 ?auto_578220 ) ) ( not ( = ?auto_578219 ?auto_578220 ) ) ( ON ?auto_578218 ?auto_578219 ) ( ON ?auto_578217 ?auto_578218 ) ( ON ?auto_578216 ?auto_578217 ) ( CLEAR ?auto_578214 ) ( ON ?auto_578215 ?auto_578216 ) ( CLEAR ?auto_578215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_578214 ?auto_578215 )
      ( MAKE-6PILE ?auto_578214 ?auto_578215 ?auto_578216 ?auto_578217 ?auto_578218 ?auto_578219 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_578240 - BLOCK
      ?auto_578241 - BLOCK
      ?auto_578242 - BLOCK
      ?auto_578243 - BLOCK
      ?auto_578244 - BLOCK
      ?auto_578245 - BLOCK
    )
    :vars
    (
      ?auto_578246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578245 ?auto_578246 ) ( not ( = ?auto_578240 ?auto_578241 ) ) ( not ( = ?auto_578240 ?auto_578242 ) ) ( not ( = ?auto_578240 ?auto_578243 ) ) ( not ( = ?auto_578240 ?auto_578244 ) ) ( not ( = ?auto_578240 ?auto_578245 ) ) ( not ( = ?auto_578240 ?auto_578246 ) ) ( not ( = ?auto_578241 ?auto_578242 ) ) ( not ( = ?auto_578241 ?auto_578243 ) ) ( not ( = ?auto_578241 ?auto_578244 ) ) ( not ( = ?auto_578241 ?auto_578245 ) ) ( not ( = ?auto_578241 ?auto_578246 ) ) ( not ( = ?auto_578242 ?auto_578243 ) ) ( not ( = ?auto_578242 ?auto_578244 ) ) ( not ( = ?auto_578242 ?auto_578245 ) ) ( not ( = ?auto_578242 ?auto_578246 ) ) ( not ( = ?auto_578243 ?auto_578244 ) ) ( not ( = ?auto_578243 ?auto_578245 ) ) ( not ( = ?auto_578243 ?auto_578246 ) ) ( not ( = ?auto_578244 ?auto_578245 ) ) ( not ( = ?auto_578244 ?auto_578246 ) ) ( not ( = ?auto_578245 ?auto_578246 ) ) ( ON ?auto_578244 ?auto_578245 ) ( ON ?auto_578243 ?auto_578244 ) ( ON ?auto_578242 ?auto_578243 ) ( ON ?auto_578241 ?auto_578242 ) ( ON ?auto_578240 ?auto_578241 ) ( CLEAR ?auto_578240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_578240 )
      ( MAKE-6PILE ?auto_578240 ?auto_578241 ?auto_578242 ?auto_578243 ?auto_578244 ?auto_578245 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_578267 - BLOCK
      ?auto_578268 - BLOCK
      ?auto_578269 - BLOCK
      ?auto_578270 - BLOCK
      ?auto_578271 - BLOCK
      ?auto_578272 - BLOCK
      ?auto_578273 - BLOCK
    )
    :vars
    (
      ?auto_578274 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_578272 ) ( ON ?auto_578273 ?auto_578274 ) ( CLEAR ?auto_578273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_578267 ) ( ON ?auto_578268 ?auto_578267 ) ( ON ?auto_578269 ?auto_578268 ) ( ON ?auto_578270 ?auto_578269 ) ( ON ?auto_578271 ?auto_578270 ) ( ON ?auto_578272 ?auto_578271 ) ( not ( = ?auto_578267 ?auto_578268 ) ) ( not ( = ?auto_578267 ?auto_578269 ) ) ( not ( = ?auto_578267 ?auto_578270 ) ) ( not ( = ?auto_578267 ?auto_578271 ) ) ( not ( = ?auto_578267 ?auto_578272 ) ) ( not ( = ?auto_578267 ?auto_578273 ) ) ( not ( = ?auto_578267 ?auto_578274 ) ) ( not ( = ?auto_578268 ?auto_578269 ) ) ( not ( = ?auto_578268 ?auto_578270 ) ) ( not ( = ?auto_578268 ?auto_578271 ) ) ( not ( = ?auto_578268 ?auto_578272 ) ) ( not ( = ?auto_578268 ?auto_578273 ) ) ( not ( = ?auto_578268 ?auto_578274 ) ) ( not ( = ?auto_578269 ?auto_578270 ) ) ( not ( = ?auto_578269 ?auto_578271 ) ) ( not ( = ?auto_578269 ?auto_578272 ) ) ( not ( = ?auto_578269 ?auto_578273 ) ) ( not ( = ?auto_578269 ?auto_578274 ) ) ( not ( = ?auto_578270 ?auto_578271 ) ) ( not ( = ?auto_578270 ?auto_578272 ) ) ( not ( = ?auto_578270 ?auto_578273 ) ) ( not ( = ?auto_578270 ?auto_578274 ) ) ( not ( = ?auto_578271 ?auto_578272 ) ) ( not ( = ?auto_578271 ?auto_578273 ) ) ( not ( = ?auto_578271 ?auto_578274 ) ) ( not ( = ?auto_578272 ?auto_578273 ) ) ( not ( = ?auto_578272 ?auto_578274 ) ) ( not ( = ?auto_578273 ?auto_578274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_578273 ?auto_578274 )
      ( !STACK ?auto_578273 ?auto_578272 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_578297 - BLOCK
      ?auto_578298 - BLOCK
      ?auto_578299 - BLOCK
      ?auto_578300 - BLOCK
      ?auto_578301 - BLOCK
      ?auto_578302 - BLOCK
      ?auto_578303 - BLOCK
    )
    :vars
    (
      ?auto_578304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578303 ?auto_578304 ) ( ON-TABLE ?auto_578297 ) ( ON ?auto_578298 ?auto_578297 ) ( ON ?auto_578299 ?auto_578298 ) ( ON ?auto_578300 ?auto_578299 ) ( ON ?auto_578301 ?auto_578300 ) ( not ( = ?auto_578297 ?auto_578298 ) ) ( not ( = ?auto_578297 ?auto_578299 ) ) ( not ( = ?auto_578297 ?auto_578300 ) ) ( not ( = ?auto_578297 ?auto_578301 ) ) ( not ( = ?auto_578297 ?auto_578302 ) ) ( not ( = ?auto_578297 ?auto_578303 ) ) ( not ( = ?auto_578297 ?auto_578304 ) ) ( not ( = ?auto_578298 ?auto_578299 ) ) ( not ( = ?auto_578298 ?auto_578300 ) ) ( not ( = ?auto_578298 ?auto_578301 ) ) ( not ( = ?auto_578298 ?auto_578302 ) ) ( not ( = ?auto_578298 ?auto_578303 ) ) ( not ( = ?auto_578298 ?auto_578304 ) ) ( not ( = ?auto_578299 ?auto_578300 ) ) ( not ( = ?auto_578299 ?auto_578301 ) ) ( not ( = ?auto_578299 ?auto_578302 ) ) ( not ( = ?auto_578299 ?auto_578303 ) ) ( not ( = ?auto_578299 ?auto_578304 ) ) ( not ( = ?auto_578300 ?auto_578301 ) ) ( not ( = ?auto_578300 ?auto_578302 ) ) ( not ( = ?auto_578300 ?auto_578303 ) ) ( not ( = ?auto_578300 ?auto_578304 ) ) ( not ( = ?auto_578301 ?auto_578302 ) ) ( not ( = ?auto_578301 ?auto_578303 ) ) ( not ( = ?auto_578301 ?auto_578304 ) ) ( not ( = ?auto_578302 ?auto_578303 ) ) ( not ( = ?auto_578302 ?auto_578304 ) ) ( not ( = ?auto_578303 ?auto_578304 ) ) ( CLEAR ?auto_578301 ) ( ON ?auto_578302 ?auto_578303 ) ( CLEAR ?auto_578302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_578297 ?auto_578298 ?auto_578299 ?auto_578300 ?auto_578301 ?auto_578302 )
      ( MAKE-7PILE ?auto_578297 ?auto_578298 ?auto_578299 ?auto_578300 ?auto_578301 ?auto_578302 ?auto_578303 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_578327 - BLOCK
      ?auto_578328 - BLOCK
      ?auto_578329 - BLOCK
      ?auto_578330 - BLOCK
      ?auto_578331 - BLOCK
      ?auto_578332 - BLOCK
      ?auto_578333 - BLOCK
    )
    :vars
    (
      ?auto_578334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578333 ?auto_578334 ) ( ON-TABLE ?auto_578327 ) ( ON ?auto_578328 ?auto_578327 ) ( ON ?auto_578329 ?auto_578328 ) ( ON ?auto_578330 ?auto_578329 ) ( not ( = ?auto_578327 ?auto_578328 ) ) ( not ( = ?auto_578327 ?auto_578329 ) ) ( not ( = ?auto_578327 ?auto_578330 ) ) ( not ( = ?auto_578327 ?auto_578331 ) ) ( not ( = ?auto_578327 ?auto_578332 ) ) ( not ( = ?auto_578327 ?auto_578333 ) ) ( not ( = ?auto_578327 ?auto_578334 ) ) ( not ( = ?auto_578328 ?auto_578329 ) ) ( not ( = ?auto_578328 ?auto_578330 ) ) ( not ( = ?auto_578328 ?auto_578331 ) ) ( not ( = ?auto_578328 ?auto_578332 ) ) ( not ( = ?auto_578328 ?auto_578333 ) ) ( not ( = ?auto_578328 ?auto_578334 ) ) ( not ( = ?auto_578329 ?auto_578330 ) ) ( not ( = ?auto_578329 ?auto_578331 ) ) ( not ( = ?auto_578329 ?auto_578332 ) ) ( not ( = ?auto_578329 ?auto_578333 ) ) ( not ( = ?auto_578329 ?auto_578334 ) ) ( not ( = ?auto_578330 ?auto_578331 ) ) ( not ( = ?auto_578330 ?auto_578332 ) ) ( not ( = ?auto_578330 ?auto_578333 ) ) ( not ( = ?auto_578330 ?auto_578334 ) ) ( not ( = ?auto_578331 ?auto_578332 ) ) ( not ( = ?auto_578331 ?auto_578333 ) ) ( not ( = ?auto_578331 ?auto_578334 ) ) ( not ( = ?auto_578332 ?auto_578333 ) ) ( not ( = ?auto_578332 ?auto_578334 ) ) ( not ( = ?auto_578333 ?auto_578334 ) ) ( ON ?auto_578332 ?auto_578333 ) ( CLEAR ?auto_578330 ) ( ON ?auto_578331 ?auto_578332 ) ( CLEAR ?auto_578331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_578327 ?auto_578328 ?auto_578329 ?auto_578330 ?auto_578331 )
      ( MAKE-7PILE ?auto_578327 ?auto_578328 ?auto_578329 ?auto_578330 ?auto_578331 ?auto_578332 ?auto_578333 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_578357 - BLOCK
      ?auto_578358 - BLOCK
      ?auto_578359 - BLOCK
      ?auto_578360 - BLOCK
      ?auto_578361 - BLOCK
      ?auto_578362 - BLOCK
      ?auto_578363 - BLOCK
    )
    :vars
    (
      ?auto_578364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578363 ?auto_578364 ) ( ON-TABLE ?auto_578357 ) ( ON ?auto_578358 ?auto_578357 ) ( ON ?auto_578359 ?auto_578358 ) ( not ( = ?auto_578357 ?auto_578358 ) ) ( not ( = ?auto_578357 ?auto_578359 ) ) ( not ( = ?auto_578357 ?auto_578360 ) ) ( not ( = ?auto_578357 ?auto_578361 ) ) ( not ( = ?auto_578357 ?auto_578362 ) ) ( not ( = ?auto_578357 ?auto_578363 ) ) ( not ( = ?auto_578357 ?auto_578364 ) ) ( not ( = ?auto_578358 ?auto_578359 ) ) ( not ( = ?auto_578358 ?auto_578360 ) ) ( not ( = ?auto_578358 ?auto_578361 ) ) ( not ( = ?auto_578358 ?auto_578362 ) ) ( not ( = ?auto_578358 ?auto_578363 ) ) ( not ( = ?auto_578358 ?auto_578364 ) ) ( not ( = ?auto_578359 ?auto_578360 ) ) ( not ( = ?auto_578359 ?auto_578361 ) ) ( not ( = ?auto_578359 ?auto_578362 ) ) ( not ( = ?auto_578359 ?auto_578363 ) ) ( not ( = ?auto_578359 ?auto_578364 ) ) ( not ( = ?auto_578360 ?auto_578361 ) ) ( not ( = ?auto_578360 ?auto_578362 ) ) ( not ( = ?auto_578360 ?auto_578363 ) ) ( not ( = ?auto_578360 ?auto_578364 ) ) ( not ( = ?auto_578361 ?auto_578362 ) ) ( not ( = ?auto_578361 ?auto_578363 ) ) ( not ( = ?auto_578361 ?auto_578364 ) ) ( not ( = ?auto_578362 ?auto_578363 ) ) ( not ( = ?auto_578362 ?auto_578364 ) ) ( not ( = ?auto_578363 ?auto_578364 ) ) ( ON ?auto_578362 ?auto_578363 ) ( ON ?auto_578361 ?auto_578362 ) ( CLEAR ?auto_578359 ) ( ON ?auto_578360 ?auto_578361 ) ( CLEAR ?auto_578360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_578357 ?auto_578358 ?auto_578359 ?auto_578360 )
      ( MAKE-7PILE ?auto_578357 ?auto_578358 ?auto_578359 ?auto_578360 ?auto_578361 ?auto_578362 ?auto_578363 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_578387 - BLOCK
      ?auto_578388 - BLOCK
      ?auto_578389 - BLOCK
      ?auto_578390 - BLOCK
      ?auto_578391 - BLOCK
      ?auto_578392 - BLOCK
      ?auto_578393 - BLOCK
    )
    :vars
    (
      ?auto_578394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578393 ?auto_578394 ) ( ON-TABLE ?auto_578387 ) ( ON ?auto_578388 ?auto_578387 ) ( not ( = ?auto_578387 ?auto_578388 ) ) ( not ( = ?auto_578387 ?auto_578389 ) ) ( not ( = ?auto_578387 ?auto_578390 ) ) ( not ( = ?auto_578387 ?auto_578391 ) ) ( not ( = ?auto_578387 ?auto_578392 ) ) ( not ( = ?auto_578387 ?auto_578393 ) ) ( not ( = ?auto_578387 ?auto_578394 ) ) ( not ( = ?auto_578388 ?auto_578389 ) ) ( not ( = ?auto_578388 ?auto_578390 ) ) ( not ( = ?auto_578388 ?auto_578391 ) ) ( not ( = ?auto_578388 ?auto_578392 ) ) ( not ( = ?auto_578388 ?auto_578393 ) ) ( not ( = ?auto_578388 ?auto_578394 ) ) ( not ( = ?auto_578389 ?auto_578390 ) ) ( not ( = ?auto_578389 ?auto_578391 ) ) ( not ( = ?auto_578389 ?auto_578392 ) ) ( not ( = ?auto_578389 ?auto_578393 ) ) ( not ( = ?auto_578389 ?auto_578394 ) ) ( not ( = ?auto_578390 ?auto_578391 ) ) ( not ( = ?auto_578390 ?auto_578392 ) ) ( not ( = ?auto_578390 ?auto_578393 ) ) ( not ( = ?auto_578390 ?auto_578394 ) ) ( not ( = ?auto_578391 ?auto_578392 ) ) ( not ( = ?auto_578391 ?auto_578393 ) ) ( not ( = ?auto_578391 ?auto_578394 ) ) ( not ( = ?auto_578392 ?auto_578393 ) ) ( not ( = ?auto_578392 ?auto_578394 ) ) ( not ( = ?auto_578393 ?auto_578394 ) ) ( ON ?auto_578392 ?auto_578393 ) ( ON ?auto_578391 ?auto_578392 ) ( ON ?auto_578390 ?auto_578391 ) ( CLEAR ?auto_578388 ) ( ON ?auto_578389 ?auto_578390 ) ( CLEAR ?auto_578389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_578387 ?auto_578388 ?auto_578389 )
      ( MAKE-7PILE ?auto_578387 ?auto_578388 ?auto_578389 ?auto_578390 ?auto_578391 ?auto_578392 ?auto_578393 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_578417 - BLOCK
      ?auto_578418 - BLOCK
      ?auto_578419 - BLOCK
      ?auto_578420 - BLOCK
      ?auto_578421 - BLOCK
      ?auto_578422 - BLOCK
      ?auto_578423 - BLOCK
    )
    :vars
    (
      ?auto_578424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578423 ?auto_578424 ) ( ON-TABLE ?auto_578417 ) ( not ( = ?auto_578417 ?auto_578418 ) ) ( not ( = ?auto_578417 ?auto_578419 ) ) ( not ( = ?auto_578417 ?auto_578420 ) ) ( not ( = ?auto_578417 ?auto_578421 ) ) ( not ( = ?auto_578417 ?auto_578422 ) ) ( not ( = ?auto_578417 ?auto_578423 ) ) ( not ( = ?auto_578417 ?auto_578424 ) ) ( not ( = ?auto_578418 ?auto_578419 ) ) ( not ( = ?auto_578418 ?auto_578420 ) ) ( not ( = ?auto_578418 ?auto_578421 ) ) ( not ( = ?auto_578418 ?auto_578422 ) ) ( not ( = ?auto_578418 ?auto_578423 ) ) ( not ( = ?auto_578418 ?auto_578424 ) ) ( not ( = ?auto_578419 ?auto_578420 ) ) ( not ( = ?auto_578419 ?auto_578421 ) ) ( not ( = ?auto_578419 ?auto_578422 ) ) ( not ( = ?auto_578419 ?auto_578423 ) ) ( not ( = ?auto_578419 ?auto_578424 ) ) ( not ( = ?auto_578420 ?auto_578421 ) ) ( not ( = ?auto_578420 ?auto_578422 ) ) ( not ( = ?auto_578420 ?auto_578423 ) ) ( not ( = ?auto_578420 ?auto_578424 ) ) ( not ( = ?auto_578421 ?auto_578422 ) ) ( not ( = ?auto_578421 ?auto_578423 ) ) ( not ( = ?auto_578421 ?auto_578424 ) ) ( not ( = ?auto_578422 ?auto_578423 ) ) ( not ( = ?auto_578422 ?auto_578424 ) ) ( not ( = ?auto_578423 ?auto_578424 ) ) ( ON ?auto_578422 ?auto_578423 ) ( ON ?auto_578421 ?auto_578422 ) ( ON ?auto_578420 ?auto_578421 ) ( ON ?auto_578419 ?auto_578420 ) ( CLEAR ?auto_578417 ) ( ON ?auto_578418 ?auto_578419 ) ( CLEAR ?auto_578418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_578417 ?auto_578418 )
      ( MAKE-7PILE ?auto_578417 ?auto_578418 ?auto_578419 ?auto_578420 ?auto_578421 ?auto_578422 ?auto_578423 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_578447 - BLOCK
      ?auto_578448 - BLOCK
      ?auto_578449 - BLOCK
      ?auto_578450 - BLOCK
      ?auto_578451 - BLOCK
      ?auto_578452 - BLOCK
      ?auto_578453 - BLOCK
    )
    :vars
    (
      ?auto_578454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578453 ?auto_578454 ) ( not ( = ?auto_578447 ?auto_578448 ) ) ( not ( = ?auto_578447 ?auto_578449 ) ) ( not ( = ?auto_578447 ?auto_578450 ) ) ( not ( = ?auto_578447 ?auto_578451 ) ) ( not ( = ?auto_578447 ?auto_578452 ) ) ( not ( = ?auto_578447 ?auto_578453 ) ) ( not ( = ?auto_578447 ?auto_578454 ) ) ( not ( = ?auto_578448 ?auto_578449 ) ) ( not ( = ?auto_578448 ?auto_578450 ) ) ( not ( = ?auto_578448 ?auto_578451 ) ) ( not ( = ?auto_578448 ?auto_578452 ) ) ( not ( = ?auto_578448 ?auto_578453 ) ) ( not ( = ?auto_578448 ?auto_578454 ) ) ( not ( = ?auto_578449 ?auto_578450 ) ) ( not ( = ?auto_578449 ?auto_578451 ) ) ( not ( = ?auto_578449 ?auto_578452 ) ) ( not ( = ?auto_578449 ?auto_578453 ) ) ( not ( = ?auto_578449 ?auto_578454 ) ) ( not ( = ?auto_578450 ?auto_578451 ) ) ( not ( = ?auto_578450 ?auto_578452 ) ) ( not ( = ?auto_578450 ?auto_578453 ) ) ( not ( = ?auto_578450 ?auto_578454 ) ) ( not ( = ?auto_578451 ?auto_578452 ) ) ( not ( = ?auto_578451 ?auto_578453 ) ) ( not ( = ?auto_578451 ?auto_578454 ) ) ( not ( = ?auto_578452 ?auto_578453 ) ) ( not ( = ?auto_578452 ?auto_578454 ) ) ( not ( = ?auto_578453 ?auto_578454 ) ) ( ON ?auto_578452 ?auto_578453 ) ( ON ?auto_578451 ?auto_578452 ) ( ON ?auto_578450 ?auto_578451 ) ( ON ?auto_578449 ?auto_578450 ) ( ON ?auto_578448 ?auto_578449 ) ( ON ?auto_578447 ?auto_578448 ) ( CLEAR ?auto_578447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_578447 )
      ( MAKE-7PILE ?auto_578447 ?auto_578448 ?auto_578449 ?auto_578450 ?auto_578451 ?auto_578452 ?auto_578453 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_578478 - BLOCK
      ?auto_578479 - BLOCK
      ?auto_578480 - BLOCK
      ?auto_578481 - BLOCK
      ?auto_578482 - BLOCK
      ?auto_578483 - BLOCK
      ?auto_578484 - BLOCK
      ?auto_578485 - BLOCK
    )
    :vars
    (
      ?auto_578486 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_578484 ) ( ON ?auto_578485 ?auto_578486 ) ( CLEAR ?auto_578485 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_578478 ) ( ON ?auto_578479 ?auto_578478 ) ( ON ?auto_578480 ?auto_578479 ) ( ON ?auto_578481 ?auto_578480 ) ( ON ?auto_578482 ?auto_578481 ) ( ON ?auto_578483 ?auto_578482 ) ( ON ?auto_578484 ?auto_578483 ) ( not ( = ?auto_578478 ?auto_578479 ) ) ( not ( = ?auto_578478 ?auto_578480 ) ) ( not ( = ?auto_578478 ?auto_578481 ) ) ( not ( = ?auto_578478 ?auto_578482 ) ) ( not ( = ?auto_578478 ?auto_578483 ) ) ( not ( = ?auto_578478 ?auto_578484 ) ) ( not ( = ?auto_578478 ?auto_578485 ) ) ( not ( = ?auto_578478 ?auto_578486 ) ) ( not ( = ?auto_578479 ?auto_578480 ) ) ( not ( = ?auto_578479 ?auto_578481 ) ) ( not ( = ?auto_578479 ?auto_578482 ) ) ( not ( = ?auto_578479 ?auto_578483 ) ) ( not ( = ?auto_578479 ?auto_578484 ) ) ( not ( = ?auto_578479 ?auto_578485 ) ) ( not ( = ?auto_578479 ?auto_578486 ) ) ( not ( = ?auto_578480 ?auto_578481 ) ) ( not ( = ?auto_578480 ?auto_578482 ) ) ( not ( = ?auto_578480 ?auto_578483 ) ) ( not ( = ?auto_578480 ?auto_578484 ) ) ( not ( = ?auto_578480 ?auto_578485 ) ) ( not ( = ?auto_578480 ?auto_578486 ) ) ( not ( = ?auto_578481 ?auto_578482 ) ) ( not ( = ?auto_578481 ?auto_578483 ) ) ( not ( = ?auto_578481 ?auto_578484 ) ) ( not ( = ?auto_578481 ?auto_578485 ) ) ( not ( = ?auto_578481 ?auto_578486 ) ) ( not ( = ?auto_578482 ?auto_578483 ) ) ( not ( = ?auto_578482 ?auto_578484 ) ) ( not ( = ?auto_578482 ?auto_578485 ) ) ( not ( = ?auto_578482 ?auto_578486 ) ) ( not ( = ?auto_578483 ?auto_578484 ) ) ( not ( = ?auto_578483 ?auto_578485 ) ) ( not ( = ?auto_578483 ?auto_578486 ) ) ( not ( = ?auto_578484 ?auto_578485 ) ) ( not ( = ?auto_578484 ?auto_578486 ) ) ( not ( = ?auto_578485 ?auto_578486 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_578485 ?auto_578486 )
      ( !STACK ?auto_578485 ?auto_578484 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_578512 - BLOCK
      ?auto_578513 - BLOCK
      ?auto_578514 - BLOCK
      ?auto_578515 - BLOCK
      ?auto_578516 - BLOCK
      ?auto_578517 - BLOCK
      ?auto_578518 - BLOCK
      ?auto_578519 - BLOCK
    )
    :vars
    (
      ?auto_578520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578519 ?auto_578520 ) ( ON-TABLE ?auto_578512 ) ( ON ?auto_578513 ?auto_578512 ) ( ON ?auto_578514 ?auto_578513 ) ( ON ?auto_578515 ?auto_578514 ) ( ON ?auto_578516 ?auto_578515 ) ( ON ?auto_578517 ?auto_578516 ) ( not ( = ?auto_578512 ?auto_578513 ) ) ( not ( = ?auto_578512 ?auto_578514 ) ) ( not ( = ?auto_578512 ?auto_578515 ) ) ( not ( = ?auto_578512 ?auto_578516 ) ) ( not ( = ?auto_578512 ?auto_578517 ) ) ( not ( = ?auto_578512 ?auto_578518 ) ) ( not ( = ?auto_578512 ?auto_578519 ) ) ( not ( = ?auto_578512 ?auto_578520 ) ) ( not ( = ?auto_578513 ?auto_578514 ) ) ( not ( = ?auto_578513 ?auto_578515 ) ) ( not ( = ?auto_578513 ?auto_578516 ) ) ( not ( = ?auto_578513 ?auto_578517 ) ) ( not ( = ?auto_578513 ?auto_578518 ) ) ( not ( = ?auto_578513 ?auto_578519 ) ) ( not ( = ?auto_578513 ?auto_578520 ) ) ( not ( = ?auto_578514 ?auto_578515 ) ) ( not ( = ?auto_578514 ?auto_578516 ) ) ( not ( = ?auto_578514 ?auto_578517 ) ) ( not ( = ?auto_578514 ?auto_578518 ) ) ( not ( = ?auto_578514 ?auto_578519 ) ) ( not ( = ?auto_578514 ?auto_578520 ) ) ( not ( = ?auto_578515 ?auto_578516 ) ) ( not ( = ?auto_578515 ?auto_578517 ) ) ( not ( = ?auto_578515 ?auto_578518 ) ) ( not ( = ?auto_578515 ?auto_578519 ) ) ( not ( = ?auto_578515 ?auto_578520 ) ) ( not ( = ?auto_578516 ?auto_578517 ) ) ( not ( = ?auto_578516 ?auto_578518 ) ) ( not ( = ?auto_578516 ?auto_578519 ) ) ( not ( = ?auto_578516 ?auto_578520 ) ) ( not ( = ?auto_578517 ?auto_578518 ) ) ( not ( = ?auto_578517 ?auto_578519 ) ) ( not ( = ?auto_578517 ?auto_578520 ) ) ( not ( = ?auto_578518 ?auto_578519 ) ) ( not ( = ?auto_578518 ?auto_578520 ) ) ( not ( = ?auto_578519 ?auto_578520 ) ) ( CLEAR ?auto_578517 ) ( ON ?auto_578518 ?auto_578519 ) ( CLEAR ?auto_578518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_578512 ?auto_578513 ?auto_578514 ?auto_578515 ?auto_578516 ?auto_578517 ?auto_578518 )
      ( MAKE-8PILE ?auto_578512 ?auto_578513 ?auto_578514 ?auto_578515 ?auto_578516 ?auto_578517 ?auto_578518 ?auto_578519 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_578546 - BLOCK
      ?auto_578547 - BLOCK
      ?auto_578548 - BLOCK
      ?auto_578549 - BLOCK
      ?auto_578550 - BLOCK
      ?auto_578551 - BLOCK
      ?auto_578552 - BLOCK
      ?auto_578553 - BLOCK
    )
    :vars
    (
      ?auto_578554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578553 ?auto_578554 ) ( ON-TABLE ?auto_578546 ) ( ON ?auto_578547 ?auto_578546 ) ( ON ?auto_578548 ?auto_578547 ) ( ON ?auto_578549 ?auto_578548 ) ( ON ?auto_578550 ?auto_578549 ) ( not ( = ?auto_578546 ?auto_578547 ) ) ( not ( = ?auto_578546 ?auto_578548 ) ) ( not ( = ?auto_578546 ?auto_578549 ) ) ( not ( = ?auto_578546 ?auto_578550 ) ) ( not ( = ?auto_578546 ?auto_578551 ) ) ( not ( = ?auto_578546 ?auto_578552 ) ) ( not ( = ?auto_578546 ?auto_578553 ) ) ( not ( = ?auto_578546 ?auto_578554 ) ) ( not ( = ?auto_578547 ?auto_578548 ) ) ( not ( = ?auto_578547 ?auto_578549 ) ) ( not ( = ?auto_578547 ?auto_578550 ) ) ( not ( = ?auto_578547 ?auto_578551 ) ) ( not ( = ?auto_578547 ?auto_578552 ) ) ( not ( = ?auto_578547 ?auto_578553 ) ) ( not ( = ?auto_578547 ?auto_578554 ) ) ( not ( = ?auto_578548 ?auto_578549 ) ) ( not ( = ?auto_578548 ?auto_578550 ) ) ( not ( = ?auto_578548 ?auto_578551 ) ) ( not ( = ?auto_578548 ?auto_578552 ) ) ( not ( = ?auto_578548 ?auto_578553 ) ) ( not ( = ?auto_578548 ?auto_578554 ) ) ( not ( = ?auto_578549 ?auto_578550 ) ) ( not ( = ?auto_578549 ?auto_578551 ) ) ( not ( = ?auto_578549 ?auto_578552 ) ) ( not ( = ?auto_578549 ?auto_578553 ) ) ( not ( = ?auto_578549 ?auto_578554 ) ) ( not ( = ?auto_578550 ?auto_578551 ) ) ( not ( = ?auto_578550 ?auto_578552 ) ) ( not ( = ?auto_578550 ?auto_578553 ) ) ( not ( = ?auto_578550 ?auto_578554 ) ) ( not ( = ?auto_578551 ?auto_578552 ) ) ( not ( = ?auto_578551 ?auto_578553 ) ) ( not ( = ?auto_578551 ?auto_578554 ) ) ( not ( = ?auto_578552 ?auto_578553 ) ) ( not ( = ?auto_578552 ?auto_578554 ) ) ( not ( = ?auto_578553 ?auto_578554 ) ) ( ON ?auto_578552 ?auto_578553 ) ( CLEAR ?auto_578550 ) ( ON ?auto_578551 ?auto_578552 ) ( CLEAR ?auto_578551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_578546 ?auto_578547 ?auto_578548 ?auto_578549 ?auto_578550 ?auto_578551 )
      ( MAKE-8PILE ?auto_578546 ?auto_578547 ?auto_578548 ?auto_578549 ?auto_578550 ?auto_578551 ?auto_578552 ?auto_578553 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_578580 - BLOCK
      ?auto_578581 - BLOCK
      ?auto_578582 - BLOCK
      ?auto_578583 - BLOCK
      ?auto_578584 - BLOCK
      ?auto_578585 - BLOCK
      ?auto_578586 - BLOCK
      ?auto_578587 - BLOCK
    )
    :vars
    (
      ?auto_578588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578587 ?auto_578588 ) ( ON-TABLE ?auto_578580 ) ( ON ?auto_578581 ?auto_578580 ) ( ON ?auto_578582 ?auto_578581 ) ( ON ?auto_578583 ?auto_578582 ) ( not ( = ?auto_578580 ?auto_578581 ) ) ( not ( = ?auto_578580 ?auto_578582 ) ) ( not ( = ?auto_578580 ?auto_578583 ) ) ( not ( = ?auto_578580 ?auto_578584 ) ) ( not ( = ?auto_578580 ?auto_578585 ) ) ( not ( = ?auto_578580 ?auto_578586 ) ) ( not ( = ?auto_578580 ?auto_578587 ) ) ( not ( = ?auto_578580 ?auto_578588 ) ) ( not ( = ?auto_578581 ?auto_578582 ) ) ( not ( = ?auto_578581 ?auto_578583 ) ) ( not ( = ?auto_578581 ?auto_578584 ) ) ( not ( = ?auto_578581 ?auto_578585 ) ) ( not ( = ?auto_578581 ?auto_578586 ) ) ( not ( = ?auto_578581 ?auto_578587 ) ) ( not ( = ?auto_578581 ?auto_578588 ) ) ( not ( = ?auto_578582 ?auto_578583 ) ) ( not ( = ?auto_578582 ?auto_578584 ) ) ( not ( = ?auto_578582 ?auto_578585 ) ) ( not ( = ?auto_578582 ?auto_578586 ) ) ( not ( = ?auto_578582 ?auto_578587 ) ) ( not ( = ?auto_578582 ?auto_578588 ) ) ( not ( = ?auto_578583 ?auto_578584 ) ) ( not ( = ?auto_578583 ?auto_578585 ) ) ( not ( = ?auto_578583 ?auto_578586 ) ) ( not ( = ?auto_578583 ?auto_578587 ) ) ( not ( = ?auto_578583 ?auto_578588 ) ) ( not ( = ?auto_578584 ?auto_578585 ) ) ( not ( = ?auto_578584 ?auto_578586 ) ) ( not ( = ?auto_578584 ?auto_578587 ) ) ( not ( = ?auto_578584 ?auto_578588 ) ) ( not ( = ?auto_578585 ?auto_578586 ) ) ( not ( = ?auto_578585 ?auto_578587 ) ) ( not ( = ?auto_578585 ?auto_578588 ) ) ( not ( = ?auto_578586 ?auto_578587 ) ) ( not ( = ?auto_578586 ?auto_578588 ) ) ( not ( = ?auto_578587 ?auto_578588 ) ) ( ON ?auto_578586 ?auto_578587 ) ( ON ?auto_578585 ?auto_578586 ) ( CLEAR ?auto_578583 ) ( ON ?auto_578584 ?auto_578585 ) ( CLEAR ?auto_578584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_578580 ?auto_578581 ?auto_578582 ?auto_578583 ?auto_578584 )
      ( MAKE-8PILE ?auto_578580 ?auto_578581 ?auto_578582 ?auto_578583 ?auto_578584 ?auto_578585 ?auto_578586 ?auto_578587 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_578614 - BLOCK
      ?auto_578615 - BLOCK
      ?auto_578616 - BLOCK
      ?auto_578617 - BLOCK
      ?auto_578618 - BLOCK
      ?auto_578619 - BLOCK
      ?auto_578620 - BLOCK
      ?auto_578621 - BLOCK
    )
    :vars
    (
      ?auto_578622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578621 ?auto_578622 ) ( ON-TABLE ?auto_578614 ) ( ON ?auto_578615 ?auto_578614 ) ( ON ?auto_578616 ?auto_578615 ) ( not ( = ?auto_578614 ?auto_578615 ) ) ( not ( = ?auto_578614 ?auto_578616 ) ) ( not ( = ?auto_578614 ?auto_578617 ) ) ( not ( = ?auto_578614 ?auto_578618 ) ) ( not ( = ?auto_578614 ?auto_578619 ) ) ( not ( = ?auto_578614 ?auto_578620 ) ) ( not ( = ?auto_578614 ?auto_578621 ) ) ( not ( = ?auto_578614 ?auto_578622 ) ) ( not ( = ?auto_578615 ?auto_578616 ) ) ( not ( = ?auto_578615 ?auto_578617 ) ) ( not ( = ?auto_578615 ?auto_578618 ) ) ( not ( = ?auto_578615 ?auto_578619 ) ) ( not ( = ?auto_578615 ?auto_578620 ) ) ( not ( = ?auto_578615 ?auto_578621 ) ) ( not ( = ?auto_578615 ?auto_578622 ) ) ( not ( = ?auto_578616 ?auto_578617 ) ) ( not ( = ?auto_578616 ?auto_578618 ) ) ( not ( = ?auto_578616 ?auto_578619 ) ) ( not ( = ?auto_578616 ?auto_578620 ) ) ( not ( = ?auto_578616 ?auto_578621 ) ) ( not ( = ?auto_578616 ?auto_578622 ) ) ( not ( = ?auto_578617 ?auto_578618 ) ) ( not ( = ?auto_578617 ?auto_578619 ) ) ( not ( = ?auto_578617 ?auto_578620 ) ) ( not ( = ?auto_578617 ?auto_578621 ) ) ( not ( = ?auto_578617 ?auto_578622 ) ) ( not ( = ?auto_578618 ?auto_578619 ) ) ( not ( = ?auto_578618 ?auto_578620 ) ) ( not ( = ?auto_578618 ?auto_578621 ) ) ( not ( = ?auto_578618 ?auto_578622 ) ) ( not ( = ?auto_578619 ?auto_578620 ) ) ( not ( = ?auto_578619 ?auto_578621 ) ) ( not ( = ?auto_578619 ?auto_578622 ) ) ( not ( = ?auto_578620 ?auto_578621 ) ) ( not ( = ?auto_578620 ?auto_578622 ) ) ( not ( = ?auto_578621 ?auto_578622 ) ) ( ON ?auto_578620 ?auto_578621 ) ( ON ?auto_578619 ?auto_578620 ) ( ON ?auto_578618 ?auto_578619 ) ( CLEAR ?auto_578616 ) ( ON ?auto_578617 ?auto_578618 ) ( CLEAR ?auto_578617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_578614 ?auto_578615 ?auto_578616 ?auto_578617 )
      ( MAKE-8PILE ?auto_578614 ?auto_578615 ?auto_578616 ?auto_578617 ?auto_578618 ?auto_578619 ?auto_578620 ?auto_578621 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_578648 - BLOCK
      ?auto_578649 - BLOCK
      ?auto_578650 - BLOCK
      ?auto_578651 - BLOCK
      ?auto_578652 - BLOCK
      ?auto_578653 - BLOCK
      ?auto_578654 - BLOCK
      ?auto_578655 - BLOCK
    )
    :vars
    (
      ?auto_578656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578655 ?auto_578656 ) ( ON-TABLE ?auto_578648 ) ( ON ?auto_578649 ?auto_578648 ) ( not ( = ?auto_578648 ?auto_578649 ) ) ( not ( = ?auto_578648 ?auto_578650 ) ) ( not ( = ?auto_578648 ?auto_578651 ) ) ( not ( = ?auto_578648 ?auto_578652 ) ) ( not ( = ?auto_578648 ?auto_578653 ) ) ( not ( = ?auto_578648 ?auto_578654 ) ) ( not ( = ?auto_578648 ?auto_578655 ) ) ( not ( = ?auto_578648 ?auto_578656 ) ) ( not ( = ?auto_578649 ?auto_578650 ) ) ( not ( = ?auto_578649 ?auto_578651 ) ) ( not ( = ?auto_578649 ?auto_578652 ) ) ( not ( = ?auto_578649 ?auto_578653 ) ) ( not ( = ?auto_578649 ?auto_578654 ) ) ( not ( = ?auto_578649 ?auto_578655 ) ) ( not ( = ?auto_578649 ?auto_578656 ) ) ( not ( = ?auto_578650 ?auto_578651 ) ) ( not ( = ?auto_578650 ?auto_578652 ) ) ( not ( = ?auto_578650 ?auto_578653 ) ) ( not ( = ?auto_578650 ?auto_578654 ) ) ( not ( = ?auto_578650 ?auto_578655 ) ) ( not ( = ?auto_578650 ?auto_578656 ) ) ( not ( = ?auto_578651 ?auto_578652 ) ) ( not ( = ?auto_578651 ?auto_578653 ) ) ( not ( = ?auto_578651 ?auto_578654 ) ) ( not ( = ?auto_578651 ?auto_578655 ) ) ( not ( = ?auto_578651 ?auto_578656 ) ) ( not ( = ?auto_578652 ?auto_578653 ) ) ( not ( = ?auto_578652 ?auto_578654 ) ) ( not ( = ?auto_578652 ?auto_578655 ) ) ( not ( = ?auto_578652 ?auto_578656 ) ) ( not ( = ?auto_578653 ?auto_578654 ) ) ( not ( = ?auto_578653 ?auto_578655 ) ) ( not ( = ?auto_578653 ?auto_578656 ) ) ( not ( = ?auto_578654 ?auto_578655 ) ) ( not ( = ?auto_578654 ?auto_578656 ) ) ( not ( = ?auto_578655 ?auto_578656 ) ) ( ON ?auto_578654 ?auto_578655 ) ( ON ?auto_578653 ?auto_578654 ) ( ON ?auto_578652 ?auto_578653 ) ( ON ?auto_578651 ?auto_578652 ) ( CLEAR ?auto_578649 ) ( ON ?auto_578650 ?auto_578651 ) ( CLEAR ?auto_578650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_578648 ?auto_578649 ?auto_578650 )
      ( MAKE-8PILE ?auto_578648 ?auto_578649 ?auto_578650 ?auto_578651 ?auto_578652 ?auto_578653 ?auto_578654 ?auto_578655 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_578682 - BLOCK
      ?auto_578683 - BLOCK
      ?auto_578684 - BLOCK
      ?auto_578685 - BLOCK
      ?auto_578686 - BLOCK
      ?auto_578687 - BLOCK
      ?auto_578688 - BLOCK
      ?auto_578689 - BLOCK
    )
    :vars
    (
      ?auto_578690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578689 ?auto_578690 ) ( ON-TABLE ?auto_578682 ) ( not ( = ?auto_578682 ?auto_578683 ) ) ( not ( = ?auto_578682 ?auto_578684 ) ) ( not ( = ?auto_578682 ?auto_578685 ) ) ( not ( = ?auto_578682 ?auto_578686 ) ) ( not ( = ?auto_578682 ?auto_578687 ) ) ( not ( = ?auto_578682 ?auto_578688 ) ) ( not ( = ?auto_578682 ?auto_578689 ) ) ( not ( = ?auto_578682 ?auto_578690 ) ) ( not ( = ?auto_578683 ?auto_578684 ) ) ( not ( = ?auto_578683 ?auto_578685 ) ) ( not ( = ?auto_578683 ?auto_578686 ) ) ( not ( = ?auto_578683 ?auto_578687 ) ) ( not ( = ?auto_578683 ?auto_578688 ) ) ( not ( = ?auto_578683 ?auto_578689 ) ) ( not ( = ?auto_578683 ?auto_578690 ) ) ( not ( = ?auto_578684 ?auto_578685 ) ) ( not ( = ?auto_578684 ?auto_578686 ) ) ( not ( = ?auto_578684 ?auto_578687 ) ) ( not ( = ?auto_578684 ?auto_578688 ) ) ( not ( = ?auto_578684 ?auto_578689 ) ) ( not ( = ?auto_578684 ?auto_578690 ) ) ( not ( = ?auto_578685 ?auto_578686 ) ) ( not ( = ?auto_578685 ?auto_578687 ) ) ( not ( = ?auto_578685 ?auto_578688 ) ) ( not ( = ?auto_578685 ?auto_578689 ) ) ( not ( = ?auto_578685 ?auto_578690 ) ) ( not ( = ?auto_578686 ?auto_578687 ) ) ( not ( = ?auto_578686 ?auto_578688 ) ) ( not ( = ?auto_578686 ?auto_578689 ) ) ( not ( = ?auto_578686 ?auto_578690 ) ) ( not ( = ?auto_578687 ?auto_578688 ) ) ( not ( = ?auto_578687 ?auto_578689 ) ) ( not ( = ?auto_578687 ?auto_578690 ) ) ( not ( = ?auto_578688 ?auto_578689 ) ) ( not ( = ?auto_578688 ?auto_578690 ) ) ( not ( = ?auto_578689 ?auto_578690 ) ) ( ON ?auto_578688 ?auto_578689 ) ( ON ?auto_578687 ?auto_578688 ) ( ON ?auto_578686 ?auto_578687 ) ( ON ?auto_578685 ?auto_578686 ) ( ON ?auto_578684 ?auto_578685 ) ( CLEAR ?auto_578682 ) ( ON ?auto_578683 ?auto_578684 ) ( CLEAR ?auto_578683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_578682 ?auto_578683 )
      ( MAKE-8PILE ?auto_578682 ?auto_578683 ?auto_578684 ?auto_578685 ?auto_578686 ?auto_578687 ?auto_578688 ?auto_578689 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_578716 - BLOCK
      ?auto_578717 - BLOCK
      ?auto_578718 - BLOCK
      ?auto_578719 - BLOCK
      ?auto_578720 - BLOCK
      ?auto_578721 - BLOCK
      ?auto_578722 - BLOCK
      ?auto_578723 - BLOCK
    )
    :vars
    (
      ?auto_578724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578723 ?auto_578724 ) ( not ( = ?auto_578716 ?auto_578717 ) ) ( not ( = ?auto_578716 ?auto_578718 ) ) ( not ( = ?auto_578716 ?auto_578719 ) ) ( not ( = ?auto_578716 ?auto_578720 ) ) ( not ( = ?auto_578716 ?auto_578721 ) ) ( not ( = ?auto_578716 ?auto_578722 ) ) ( not ( = ?auto_578716 ?auto_578723 ) ) ( not ( = ?auto_578716 ?auto_578724 ) ) ( not ( = ?auto_578717 ?auto_578718 ) ) ( not ( = ?auto_578717 ?auto_578719 ) ) ( not ( = ?auto_578717 ?auto_578720 ) ) ( not ( = ?auto_578717 ?auto_578721 ) ) ( not ( = ?auto_578717 ?auto_578722 ) ) ( not ( = ?auto_578717 ?auto_578723 ) ) ( not ( = ?auto_578717 ?auto_578724 ) ) ( not ( = ?auto_578718 ?auto_578719 ) ) ( not ( = ?auto_578718 ?auto_578720 ) ) ( not ( = ?auto_578718 ?auto_578721 ) ) ( not ( = ?auto_578718 ?auto_578722 ) ) ( not ( = ?auto_578718 ?auto_578723 ) ) ( not ( = ?auto_578718 ?auto_578724 ) ) ( not ( = ?auto_578719 ?auto_578720 ) ) ( not ( = ?auto_578719 ?auto_578721 ) ) ( not ( = ?auto_578719 ?auto_578722 ) ) ( not ( = ?auto_578719 ?auto_578723 ) ) ( not ( = ?auto_578719 ?auto_578724 ) ) ( not ( = ?auto_578720 ?auto_578721 ) ) ( not ( = ?auto_578720 ?auto_578722 ) ) ( not ( = ?auto_578720 ?auto_578723 ) ) ( not ( = ?auto_578720 ?auto_578724 ) ) ( not ( = ?auto_578721 ?auto_578722 ) ) ( not ( = ?auto_578721 ?auto_578723 ) ) ( not ( = ?auto_578721 ?auto_578724 ) ) ( not ( = ?auto_578722 ?auto_578723 ) ) ( not ( = ?auto_578722 ?auto_578724 ) ) ( not ( = ?auto_578723 ?auto_578724 ) ) ( ON ?auto_578722 ?auto_578723 ) ( ON ?auto_578721 ?auto_578722 ) ( ON ?auto_578720 ?auto_578721 ) ( ON ?auto_578719 ?auto_578720 ) ( ON ?auto_578718 ?auto_578719 ) ( ON ?auto_578717 ?auto_578718 ) ( ON ?auto_578716 ?auto_578717 ) ( CLEAR ?auto_578716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_578716 )
      ( MAKE-8PILE ?auto_578716 ?auto_578717 ?auto_578718 ?auto_578719 ?auto_578720 ?auto_578721 ?auto_578722 ?auto_578723 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_578751 - BLOCK
      ?auto_578752 - BLOCK
      ?auto_578753 - BLOCK
      ?auto_578754 - BLOCK
      ?auto_578755 - BLOCK
      ?auto_578756 - BLOCK
      ?auto_578757 - BLOCK
      ?auto_578758 - BLOCK
      ?auto_578759 - BLOCK
    )
    :vars
    (
      ?auto_578760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_578758 ) ( ON ?auto_578759 ?auto_578760 ) ( CLEAR ?auto_578759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_578751 ) ( ON ?auto_578752 ?auto_578751 ) ( ON ?auto_578753 ?auto_578752 ) ( ON ?auto_578754 ?auto_578753 ) ( ON ?auto_578755 ?auto_578754 ) ( ON ?auto_578756 ?auto_578755 ) ( ON ?auto_578757 ?auto_578756 ) ( ON ?auto_578758 ?auto_578757 ) ( not ( = ?auto_578751 ?auto_578752 ) ) ( not ( = ?auto_578751 ?auto_578753 ) ) ( not ( = ?auto_578751 ?auto_578754 ) ) ( not ( = ?auto_578751 ?auto_578755 ) ) ( not ( = ?auto_578751 ?auto_578756 ) ) ( not ( = ?auto_578751 ?auto_578757 ) ) ( not ( = ?auto_578751 ?auto_578758 ) ) ( not ( = ?auto_578751 ?auto_578759 ) ) ( not ( = ?auto_578751 ?auto_578760 ) ) ( not ( = ?auto_578752 ?auto_578753 ) ) ( not ( = ?auto_578752 ?auto_578754 ) ) ( not ( = ?auto_578752 ?auto_578755 ) ) ( not ( = ?auto_578752 ?auto_578756 ) ) ( not ( = ?auto_578752 ?auto_578757 ) ) ( not ( = ?auto_578752 ?auto_578758 ) ) ( not ( = ?auto_578752 ?auto_578759 ) ) ( not ( = ?auto_578752 ?auto_578760 ) ) ( not ( = ?auto_578753 ?auto_578754 ) ) ( not ( = ?auto_578753 ?auto_578755 ) ) ( not ( = ?auto_578753 ?auto_578756 ) ) ( not ( = ?auto_578753 ?auto_578757 ) ) ( not ( = ?auto_578753 ?auto_578758 ) ) ( not ( = ?auto_578753 ?auto_578759 ) ) ( not ( = ?auto_578753 ?auto_578760 ) ) ( not ( = ?auto_578754 ?auto_578755 ) ) ( not ( = ?auto_578754 ?auto_578756 ) ) ( not ( = ?auto_578754 ?auto_578757 ) ) ( not ( = ?auto_578754 ?auto_578758 ) ) ( not ( = ?auto_578754 ?auto_578759 ) ) ( not ( = ?auto_578754 ?auto_578760 ) ) ( not ( = ?auto_578755 ?auto_578756 ) ) ( not ( = ?auto_578755 ?auto_578757 ) ) ( not ( = ?auto_578755 ?auto_578758 ) ) ( not ( = ?auto_578755 ?auto_578759 ) ) ( not ( = ?auto_578755 ?auto_578760 ) ) ( not ( = ?auto_578756 ?auto_578757 ) ) ( not ( = ?auto_578756 ?auto_578758 ) ) ( not ( = ?auto_578756 ?auto_578759 ) ) ( not ( = ?auto_578756 ?auto_578760 ) ) ( not ( = ?auto_578757 ?auto_578758 ) ) ( not ( = ?auto_578757 ?auto_578759 ) ) ( not ( = ?auto_578757 ?auto_578760 ) ) ( not ( = ?auto_578758 ?auto_578759 ) ) ( not ( = ?auto_578758 ?auto_578760 ) ) ( not ( = ?auto_578759 ?auto_578760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_578759 ?auto_578760 )
      ( !STACK ?auto_578759 ?auto_578758 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_578789 - BLOCK
      ?auto_578790 - BLOCK
      ?auto_578791 - BLOCK
      ?auto_578792 - BLOCK
      ?auto_578793 - BLOCK
      ?auto_578794 - BLOCK
      ?auto_578795 - BLOCK
      ?auto_578796 - BLOCK
      ?auto_578797 - BLOCK
    )
    :vars
    (
      ?auto_578798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578797 ?auto_578798 ) ( ON-TABLE ?auto_578789 ) ( ON ?auto_578790 ?auto_578789 ) ( ON ?auto_578791 ?auto_578790 ) ( ON ?auto_578792 ?auto_578791 ) ( ON ?auto_578793 ?auto_578792 ) ( ON ?auto_578794 ?auto_578793 ) ( ON ?auto_578795 ?auto_578794 ) ( not ( = ?auto_578789 ?auto_578790 ) ) ( not ( = ?auto_578789 ?auto_578791 ) ) ( not ( = ?auto_578789 ?auto_578792 ) ) ( not ( = ?auto_578789 ?auto_578793 ) ) ( not ( = ?auto_578789 ?auto_578794 ) ) ( not ( = ?auto_578789 ?auto_578795 ) ) ( not ( = ?auto_578789 ?auto_578796 ) ) ( not ( = ?auto_578789 ?auto_578797 ) ) ( not ( = ?auto_578789 ?auto_578798 ) ) ( not ( = ?auto_578790 ?auto_578791 ) ) ( not ( = ?auto_578790 ?auto_578792 ) ) ( not ( = ?auto_578790 ?auto_578793 ) ) ( not ( = ?auto_578790 ?auto_578794 ) ) ( not ( = ?auto_578790 ?auto_578795 ) ) ( not ( = ?auto_578790 ?auto_578796 ) ) ( not ( = ?auto_578790 ?auto_578797 ) ) ( not ( = ?auto_578790 ?auto_578798 ) ) ( not ( = ?auto_578791 ?auto_578792 ) ) ( not ( = ?auto_578791 ?auto_578793 ) ) ( not ( = ?auto_578791 ?auto_578794 ) ) ( not ( = ?auto_578791 ?auto_578795 ) ) ( not ( = ?auto_578791 ?auto_578796 ) ) ( not ( = ?auto_578791 ?auto_578797 ) ) ( not ( = ?auto_578791 ?auto_578798 ) ) ( not ( = ?auto_578792 ?auto_578793 ) ) ( not ( = ?auto_578792 ?auto_578794 ) ) ( not ( = ?auto_578792 ?auto_578795 ) ) ( not ( = ?auto_578792 ?auto_578796 ) ) ( not ( = ?auto_578792 ?auto_578797 ) ) ( not ( = ?auto_578792 ?auto_578798 ) ) ( not ( = ?auto_578793 ?auto_578794 ) ) ( not ( = ?auto_578793 ?auto_578795 ) ) ( not ( = ?auto_578793 ?auto_578796 ) ) ( not ( = ?auto_578793 ?auto_578797 ) ) ( not ( = ?auto_578793 ?auto_578798 ) ) ( not ( = ?auto_578794 ?auto_578795 ) ) ( not ( = ?auto_578794 ?auto_578796 ) ) ( not ( = ?auto_578794 ?auto_578797 ) ) ( not ( = ?auto_578794 ?auto_578798 ) ) ( not ( = ?auto_578795 ?auto_578796 ) ) ( not ( = ?auto_578795 ?auto_578797 ) ) ( not ( = ?auto_578795 ?auto_578798 ) ) ( not ( = ?auto_578796 ?auto_578797 ) ) ( not ( = ?auto_578796 ?auto_578798 ) ) ( not ( = ?auto_578797 ?auto_578798 ) ) ( CLEAR ?auto_578795 ) ( ON ?auto_578796 ?auto_578797 ) ( CLEAR ?auto_578796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_578789 ?auto_578790 ?auto_578791 ?auto_578792 ?auto_578793 ?auto_578794 ?auto_578795 ?auto_578796 )
      ( MAKE-9PILE ?auto_578789 ?auto_578790 ?auto_578791 ?auto_578792 ?auto_578793 ?auto_578794 ?auto_578795 ?auto_578796 ?auto_578797 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_578827 - BLOCK
      ?auto_578828 - BLOCK
      ?auto_578829 - BLOCK
      ?auto_578830 - BLOCK
      ?auto_578831 - BLOCK
      ?auto_578832 - BLOCK
      ?auto_578833 - BLOCK
      ?auto_578834 - BLOCK
      ?auto_578835 - BLOCK
    )
    :vars
    (
      ?auto_578836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578835 ?auto_578836 ) ( ON-TABLE ?auto_578827 ) ( ON ?auto_578828 ?auto_578827 ) ( ON ?auto_578829 ?auto_578828 ) ( ON ?auto_578830 ?auto_578829 ) ( ON ?auto_578831 ?auto_578830 ) ( ON ?auto_578832 ?auto_578831 ) ( not ( = ?auto_578827 ?auto_578828 ) ) ( not ( = ?auto_578827 ?auto_578829 ) ) ( not ( = ?auto_578827 ?auto_578830 ) ) ( not ( = ?auto_578827 ?auto_578831 ) ) ( not ( = ?auto_578827 ?auto_578832 ) ) ( not ( = ?auto_578827 ?auto_578833 ) ) ( not ( = ?auto_578827 ?auto_578834 ) ) ( not ( = ?auto_578827 ?auto_578835 ) ) ( not ( = ?auto_578827 ?auto_578836 ) ) ( not ( = ?auto_578828 ?auto_578829 ) ) ( not ( = ?auto_578828 ?auto_578830 ) ) ( not ( = ?auto_578828 ?auto_578831 ) ) ( not ( = ?auto_578828 ?auto_578832 ) ) ( not ( = ?auto_578828 ?auto_578833 ) ) ( not ( = ?auto_578828 ?auto_578834 ) ) ( not ( = ?auto_578828 ?auto_578835 ) ) ( not ( = ?auto_578828 ?auto_578836 ) ) ( not ( = ?auto_578829 ?auto_578830 ) ) ( not ( = ?auto_578829 ?auto_578831 ) ) ( not ( = ?auto_578829 ?auto_578832 ) ) ( not ( = ?auto_578829 ?auto_578833 ) ) ( not ( = ?auto_578829 ?auto_578834 ) ) ( not ( = ?auto_578829 ?auto_578835 ) ) ( not ( = ?auto_578829 ?auto_578836 ) ) ( not ( = ?auto_578830 ?auto_578831 ) ) ( not ( = ?auto_578830 ?auto_578832 ) ) ( not ( = ?auto_578830 ?auto_578833 ) ) ( not ( = ?auto_578830 ?auto_578834 ) ) ( not ( = ?auto_578830 ?auto_578835 ) ) ( not ( = ?auto_578830 ?auto_578836 ) ) ( not ( = ?auto_578831 ?auto_578832 ) ) ( not ( = ?auto_578831 ?auto_578833 ) ) ( not ( = ?auto_578831 ?auto_578834 ) ) ( not ( = ?auto_578831 ?auto_578835 ) ) ( not ( = ?auto_578831 ?auto_578836 ) ) ( not ( = ?auto_578832 ?auto_578833 ) ) ( not ( = ?auto_578832 ?auto_578834 ) ) ( not ( = ?auto_578832 ?auto_578835 ) ) ( not ( = ?auto_578832 ?auto_578836 ) ) ( not ( = ?auto_578833 ?auto_578834 ) ) ( not ( = ?auto_578833 ?auto_578835 ) ) ( not ( = ?auto_578833 ?auto_578836 ) ) ( not ( = ?auto_578834 ?auto_578835 ) ) ( not ( = ?auto_578834 ?auto_578836 ) ) ( not ( = ?auto_578835 ?auto_578836 ) ) ( ON ?auto_578834 ?auto_578835 ) ( CLEAR ?auto_578832 ) ( ON ?auto_578833 ?auto_578834 ) ( CLEAR ?auto_578833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_578827 ?auto_578828 ?auto_578829 ?auto_578830 ?auto_578831 ?auto_578832 ?auto_578833 )
      ( MAKE-9PILE ?auto_578827 ?auto_578828 ?auto_578829 ?auto_578830 ?auto_578831 ?auto_578832 ?auto_578833 ?auto_578834 ?auto_578835 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_578865 - BLOCK
      ?auto_578866 - BLOCK
      ?auto_578867 - BLOCK
      ?auto_578868 - BLOCK
      ?auto_578869 - BLOCK
      ?auto_578870 - BLOCK
      ?auto_578871 - BLOCK
      ?auto_578872 - BLOCK
      ?auto_578873 - BLOCK
    )
    :vars
    (
      ?auto_578874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578873 ?auto_578874 ) ( ON-TABLE ?auto_578865 ) ( ON ?auto_578866 ?auto_578865 ) ( ON ?auto_578867 ?auto_578866 ) ( ON ?auto_578868 ?auto_578867 ) ( ON ?auto_578869 ?auto_578868 ) ( not ( = ?auto_578865 ?auto_578866 ) ) ( not ( = ?auto_578865 ?auto_578867 ) ) ( not ( = ?auto_578865 ?auto_578868 ) ) ( not ( = ?auto_578865 ?auto_578869 ) ) ( not ( = ?auto_578865 ?auto_578870 ) ) ( not ( = ?auto_578865 ?auto_578871 ) ) ( not ( = ?auto_578865 ?auto_578872 ) ) ( not ( = ?auto_578865 ?auto_578873 ) ) ( not ( = ?auto_578865 ?auto_578874 ) ) ( not ( = ?auto_578866 ?auto_578867 ) ) ( not ( = ?auto_578866 ?auto_578868 ) ) ( not ( = ?auto_578866 ?auto_578869 ) ) ( not ( = ?auto_578866 ?auto_578870 ) ) ( not ( = ?auto_578866 ?auto_578871 ) ) ( not ( = ?auto_578866 ?auto_578872 ) ) ( not ( = ?auto_578866 ?auto_578873 ) ) ( not ( = ?auto_578866 ?auto_578874 ) ) ( not ( = ?auto_578867 ?auto_578868 ) ) ( not ( = ?auto_578867 ?auto_578869 ) ) ( not ( = ?auto_578867 ?auto_578870 ) ) ( not ( = ?auto_578867 ?auto_578871 ) ) ( not ( = ?auto_578867 ?auto_578872 ) ) ( not ( = ?auto_578867 ?auto_578873 ) ) ( not ( = ?auto_578867 ?auto_578874 ) ) ( not ( = ?auto_578868 ?auto_578869 ) ) ( not ( = ?auto_578868 ?auto_578870 ) ) ( not ( = ?auto_578868 ?auto_578871 ) ) ( not ( = ?auto_578868 ?auto_578872 ) ) ( not ( = ?auto_578868 ?auto_578873 ) ) ( not ( = ?auto_578868 ?auto_578874 ) ) ( not ( = ?auto_578869 ?auto_578870 ) ) ( not ( = ?auto_578869 ?auto_578871 ) ) ( not ( = ?auto_578869 ?auto_578872 ) ) ( not ( = ?auto_578869 ?auto_578873 ) ) ( not ( = ?auto_578869 ?auto_578874 ) ) ( not ( = ?auto_578870 ?auto_578871 ) ) ( not ( = ?auto_578870 ?auto_578872 ) ) ( not ( = ?auto_578870 ?auto_578873 ) ) ( not ( = ?auto_578870 ?auto_578874 ) ) ( not ( = ?auto_578871 ?auto_578872 ) ) ( not ( = ?auto_578871 ?auto_578873 ) ) ( not ( = ?auto_578871 ?auto_578874 ) ) ( not ( = ?auto_578872 ?auto_578873 ) ) ( not ( = ?auto_578872 ?auto_578874 ) ) ( not ( = ?auto_578873 ?auto_578874 ) ) ( ON ?auto_578872 ?auto_578873 ) ( ON ?auto_578871 ?auto_578872 ) ( CLEAR ?auto_578869 ) ( ON ?auto_578870 ?auto_578871 ) ( CLEAR ?auto_578870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_578865 ?auto_578866 ?auto_578867 ?auto_578868 ?auto_578869 ?auto_578870 )
      ( MAKE-9PILE ?auto_578865 ?auto_578866 ?auto_578867 ?auto_578868 ?auto_578869 ?auto_578870 ?auto_578871 ?auto_578872 ?auto_578873 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_578903 - BLOCK
      ?auto_578904 - BLOCK
      ?auto_578905 - BLOCK
      ?auto_578906 - BLOCK
      ?auto_578907 - BLOCK
      ?auto_578908 - BLOCK
      ?auto_578909 - BLOCK
      ?auto_578910 - BLOCK
      ?auto_578911 - BLOCK
    )
    :vars
    (
      ?auto_578912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578911 ?auto_578912 ) ( ON-TABLE ?auto_578903 ) ( ON ?auto_578904 ?auto_578903 ) ( ON ?auto_578905 ?auto_578904 ) ( ON ?auto_578906 ?auto_578905 ) ( not ( = ?auto_578903 ?auto_578904 ) ) ( not ( = ?auto_578903 ?auto_578905 ) ) ( not ( = ?auto_578903 ?auto_578906 ) ) ( not ( = ?auto_578903 ?auto_578907 ) ) ( not ( = ?auto_578903 ?auto_578908 ) ) ( not ( = ?auto_578903 ?auto_578909 ) ) ( not ( = ?auto_578903 ?auto_578910 ) ) ( not ( = ?auto_578903 ?auto_578911 ) ) ( not ( = ?auto_578903 ?auto_578912 ) ) ( not ( = ?auto_578904 ?auto_578905 ) ) ( not ( = ?auto_578904 ?auto_578906 ) ) ( not ( = ?auto_578904 ?auto_578907 ) ) ( not ( = ?auto_578904 ?auto_578908 ) ) ( not ( = ?auto_578904 ?auto_578909 ) ) ( not ( = ?auto_578904 ?auto_578910 ) ) ( not ( = ?auto_578904 ?auto_578911 ) ) ( not ( = ?auto_578904 ?auto_578912 ) ) ( not ( = ?auto_578905 ?auto_578906 ) ) ( not ( = ?auto_578905 ?auto_578907 ) ) ( not ( = ?auto_578905 ?auto_578908 ) ) ( not ( = ?auto_578905 ?auto_578909 ) ) ( not ( = ?auto_578905 ?auto_578910 ) ) ( not ( = ?auto_578905 ?auto_578911 ) ) ( not ( = ?auto_578905 ?auto_578912 ) ) ( not ( = ?auto_578906 ?auto_578907 ) ) ( not ( = ?auto_578906 ?auto_578908 ) ) ( not ( = ?auto_578906 ?auto_578909 ) ) ( not ( = ?auto_578906 ?auto_578910 ) ) ( not ( = ?auto_578906 ?auto_578911 ) ) ( not ( = ?auto_578906 ?auto_578912 ) ) ( not ( = ?auto_578907 ?auto_578908 ) ) ( not ( = ?auto_578907 ?auto_578909 ) ) ( not ( = ?auto_578907 ?auto_578910 ) ) ( not ( = ?auto_578907 ?auto_578911 ) ) ( not ( = ?auto_578907 ?auto_578912 ) ) ( not ( = ?auto_578908 ?auto_578909 ) ) ( not ( = ?auto_578908 ?auto_578910 ) ) ( not ( = ?auto_578908 ?auto_578911 ) ) ( not ( = ?auto_578908 ?auto_578912 ) ) ( not ( = ?auto_578909 ?auto_578910 ) ) ( not ( = ?auto_578909 ?auto_578911 ) ) ( not ( = ?auto_578909 ?auto_578912 ) ) ( not ( = ?auto_578910 ?auto_578911 ) ) ( not ( = ?auto_578910 ?auto_578912 ) ) ( not ( = ?auto_578911 ?auto_578912 ) ) ( ON ?auto_578910 ?auto_578911 ) ( ON ?auto_578909 ?auto_578910 ) ( ON ?auto_578908 ?auto_578909 ) ( CLEAR ?auto_578906 ) ( ON ?auto_578907 ?auto_578908 ) ( CLEAR ?auto_578907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_578903 ?auto_578904 ?auto_578905 ?auto_578906 ?auto_578907 )
      ( MAKE-9PILE ?auto_578903 ?auto_578904 ?auto_578905 ?auto_578906 ?auto_578907 ?auto_578908 ?auto_578909 ?auto_578910 ?auto_578911 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_578941 - BLOCK
      ?auto_578942 - BLOCK
      ?auto_578943 - BLOCK
      ?auto_578944 - BLOCK
      ?auto_578945 - BLOCK
      ?auto_578946 - BLOCK
      ?auto_578947 - BLOCK
      ?auto_578948 - BLOCK
      ?auto_578949 - BLOCK
    )
    :vars
    (
      ?auto_578950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578949 ?auto_578950 ) ( ON-TABLE ?auto_578941 ) ( ON ?auto_578942 ?auto_578941 ) ( ON ?auto_578943 ?auto_578942 ) ( not ( = ?auto_578941 ?auto_578942 ) ) ( not ( = ?auto_578941 ?auto_578943 ) ) ( not ( = ?auto_578941 ?auto_578944 ) ) ( not ( = ?auto_578941 ?auto_578945 ) ) ( not ( = ?auto_578941 ?auto_578946 ) ) ( not ( = ?auto_578941 ?auto_578947 ) ) ( not ( = ?auto_578941 ?auto_578948 ) ) ( not ( = ?auto_578941 ?auto_578949 ) ) ( not ( = ?auto_578941 ?auto_578950 ) ) ( not ( = ?auto_578942 ?auto_578943 ) ) ( not ( = ?auto_578942 ?auto_578944 ) ) ( not ( = ?auto_578942 ?auto_578945 ) ) ( not ( = ?auto_578942 ?auto_578946 ) ) ( not ( = ?auto_578942 ?auto_578947 ) ) ( not ( = ?auto_578942 ?auto_578948 ) ) ( not ( = ?auto_578942 ?auto_578949 ) ) ( not ( = ?auto_578942 ?auto_578950 ) ) ( not ( = ?auto_578943 ?auto_578944 ) ) ( not ( = ?auto_578943 ?auto_578945 ) ) ( not ( = ?auto_578943 ?auto_578946 ) ) ( not ( = ?auto_578943 ?auto_578947 ) ) ( not ( = ?auto_578943 ?auto_578948 ) ) ( not ( = ?auto_578943 ?auto_578949 ) ) ( not ( = ?auto_578943 ?auto_578950 ) ) ( not ( = ?auto_578944 ?auto_578945 ) ) ( not ( = ?auto_578944 ?auto_578946 ) ) ( not ( = ?auto_578944 ?auto_578947 ) ) ( not ( = ?auto_578944 ?auto_578948 ) ) ( not ( = ?auto_578944 ?auto_578949 ) ) ( not ( = ?auto_578944 ?auto_578950 ) ) ( not ( = ?auto_578945 ?auto_578946 ) ) ( not ( = ?auto_578945 ?auto_578947 ) ) ( not ( = ?auto_578945 ?auto_578948 ) ) ( not ( = ?auto_578945 ?auto_578949 ) ) ( not ( = ?auto_578945 ?auto_578950 ) ) ( not ( = ?auto_578946 ?auto_578947 ) ) ( not ( = ?auto_578946 ?auto_578948 ) ) ( not ( = ?auto_578946 ?auto_578949 ) ) ( not ( = ?auto_578946 ?auto_578950 ) ) ( not ( = ?auto_578947 ?auto_578948 ) ) ( not ( = ?auto_578947 ?auto_578949 ) ) ( not ( = ?auto_578947 ?auto_578950 ) ) ( not ( = ?auto_578948 ?auto_578949 ) ) ( not ( = ?auto_578948 ?auto_578950 ) ) ( not ( = ?auto_578949 ?auto_578950 ) ) ( ON ?auto_578948 ?auto_578949 ) ( ON ?auto_578947 ?auto_578948 ) ( ON ?auto_578946 ?auto_578947 ) ( ON ?auto_578945 ?auto_578946 ) ( CLEAR ?auto_578943 ) ( ON ?auto_578944 ?auto_578945 ) ( CLEAR ?auto_578944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_578941 ?auto_578942 ?auto_578943 ?auto_578944 )
      ( MAKE-9PILE ?auto_578941 ?auto_578942 ?auto_578943 ?auto_578944 ?auto_578945 ?auto_578946 ?auto_578947 ?auto_578948 ?auto_578949 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_578979 - BLOCK
      ?auto_578980 - BLOCK
      ?auto_578981 - BLOCK
      ?auto_578982 - BLOCK
      ?auto_578983 - BLOCK
      ?auto_578984 - BLOCK
      ?auto_578985 - BLOCK
      ?auto_578986 - BLOCK
      ?auto_578987 - BLOCK
    )
    :vars
    (
      ?auto_578988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_578987 ?auto_578988 ) ( ON-TABLE ?auto_578979 ) ( ON ?auto_578980 ?auto_578979 ) ( not ( = ?auto_578979 ?auto_578980 ) ) ( not ( = ?auto_578979 ?auto_578981 ) ) ( not ( = ?auto_578979 ?auto_578982 ) ) ( not ( = ?auto_578979 ?auto_578983 ) ) ( not ( = ?auto_578979 ?auto_578984 ) ) ( not ( = ?auto_578979 ?auto_578985 ) ) ( not ( = ?auto_578979 ?auto_578986 ) ) ( not ( = ?auto_578979 ?auto_578987 ) ) ( not ( = ?auto_578979 ?auto_578988 ) ) ( not ( = ?auto_578980 ?auto_578981 ) ) ( not ( = ?auto_578980 ?auto_578982 ) ) ( not ( = ?auto_578980 ?auto_578983 ) ) ( not ( = ?auto_578980 ?auto_578984 ) ) ( not ( = ?auto_578980 ?auto_578985 ) ) ( not ( = ?auto_578980 ?auto_578986 ) ) ( not ( = ?auto_578980 ?auto_578987 ) ) ( not ( = ?auto_578980 ?auto_578988 ) ) ( not ( = ?auto_578981 ?auto_578982 ) ) ( not ( = ?auto_578981 ?auto_578983 ) ) ( not ( = ?auto_578981 ?auto_578984 ) ) ( not ( = ?auto_578981 ?auto_578985 ) ) ( not ( = ?auto_578981 ?auto_578986 ) ) ( not ( = ?auto_578981 ?auto_578987 ) ) ( not ( = ?auto_578981 ?auto_578988 ) ) ( not ( = ?auto_578982 ?auto_578983 ) ) ( not ( = ?auto_578982 ?auto_578984 ) ) ( not ( = ?auto_578982 ?auto_578985 ) ) ( not ( = ?auto_578982 ?auto_578986 ) ) ( not ( = ?auto_578982 ?auto_578987 ) ) ( not ( = ?auto_578982 ?auto_578988 ) ) ( not ( = ?auto_578983 ?auto_578984 ) ) ( not ( = ?auto_578983 ?auto_578985 ) ) ( not ( = ?auto_578983 ?auto_578986 ) ) ( not ( = ?auto_578983 ?auto_578987 ) ) ( not ( = ?auto_578983 ?auto_578988 ) ) ( not ( = ?auto_578984 ?auto_578985 ) ) ( not ( = ?auto_578984 ?auto_578986 ) ) ( not ( = ?auto_578984 ?auto_578987 ) ) ( not ( = ?auto_578984 ?auto_578988 ) ) ( not ( = ?auto_578985 ?auto_578986 ) ) ( not ( = ?auto_578985 ?auto_578987 ) ) ( not ( = ?auto_578985 ?auto_578988 ) ) ( not ( = ?auto_578986 ?auto_578987 ) ) ( not ( = ?auto_578986 ?auto_578988 ) ) ( not ( = ?auto_578987 ?auto_578988 ) ) ( ON ?auto_578986 ?auto_578987 ) ( ON ?auto_578985 ?auto_578986 ) ( ON ?auto_578984 ?auto_578985 ) ( ON ?auto_578983 ?auto_578984 ) ( ON ?auto_578982 ?auto_578983 ) ( CLEAR ?auto_578980 ) ( ON ?auto_578981 ?auto_578982 ) ( CLEAR ?auto_578981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_578979 ?auto_578980 ?auto_578981 )
      ( MAKE-9PILE ?auto_578979 ?auto_578980 ?auto_578981 ?auto_578982 ?auto_578983 ?auto_578984 ?auto_578985 ?auto_578986 ?auto_578987 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_579017 - BLOCK
      ?auto_579018 - BLOCK
      ?auto_579019 - BLOCK
      ?auto_579020 - BLOCK
      ?auto_579021 - BLOCK
      ?auto_579022 - BLOCK
      ?auto_579023 - BLOCK
      ?auto_579024 - BLOCK
      ?auto_579025 - BLOCK
    )
    :vars
    (
      ?auto_579026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579025 ?auto_579026 ) ( ON-TABLE ?auto_579017 ) ( not ( = ?auto_579017 ?auto_579018 ) ) ( not ( = ?auto_579017 ?auto_579019 ) ) ( not ( = ?auto_579017 ?auto_579020 ) ) ( not ( = ?auto_579017 ?auto_579021 ) ) ( not ( = ?auto_579017 ?auto_579022 ) ) ( not ( = ?auto_579017 ?auto_579023 ) ) ( not ( = ?auto_579017 ?auto_579024 ) ) ( not ( = ?auto_579017 ?auto_579025 ) ) ( not ( = ?auto_579017 ?auto_579026 ) ) ( not ( = ?auto_579018 ?auto_579019 ) ) ( not ( = ?auto_579018 ?auto_579020 ) ) ( not ( = ?auto_579018 ?auto_579021 ) ) ( not ( = ?auto_579018 ?auto_579022 ) ) ( not ( = ?auto_579018 ?auto_579023 ) ) ( not ( = ?auto_579018 ?auto_579024 ) ) ( not ( = ?auto_579018 ?auto_579025 ) ) ( not ( = ?auto_579018 ?auto_579026 ) ) ( not ( = ?auto_579019 ?auto_579020 ) ) ( not ( = ?auto_579019 ?auto_579021 ) ) ( not ( = ?auto_579019 ?auto_579022 ) ) ( not ( = ?auto_579019 ?auto_579023 ) ) ( not ( = ?auto_579019 ?auto_579024 ) ) ( not ( = ?auto_579019 ?auto_579025 ) ) ( not ( = ?auto_579019 ?auto_579026 ) ) ( not ( = ?auto_579020 ?auto_579021 ) ) ( not ( = ?auto_579020 ?auto_579022 ) ) ( not ( = ?auto_579020 ?auto_579023 ) ) ( not ( = ?auto_579020 ?auto_579024 ) ) ( not ( = ?auto_579020 ?auto_579025 ) ) ( not ( = ?auto_579020 ?auto_579026 ) ) ( not ( = ?auto_579021 ?auto_579022 ) ) ( not ( = ?auto_579021 ?auto_579023 ) ) ( not ( = ?auto_579021 ?auto_579024 ) ) ( not ( = ?auto_579021 ?auto_579025 ) ) ( not ( = ?auto_579021 ?auto_579026 ) ) ( not ( = ?auto_579022 ?auto_579023 ) ) ( not ( = ?auto_579022 ?auto_579024 ) ) ( not ( = ?auto_579022 ?auto_579025 ) ) ( not ( = ?auto_579022 ?auto_579026 ) ) ( not ( = ?auto_579023 ?auto_579024 ) ) ( not ( = ?auto_579023 ?auto_579025 ) ) ( not ( = ?auto_579023 ?auto_579026 ) ) ( not ( = ?auto_579024 ?auto_579025 ) ) ( not ( = ?auto_579024 ?auto_579026 ) ) ( not ( = ?auto_579025 ?auto_579026 ) ) ( ON ?auto_579024 ?auto_579025 ) ( ON ?auto_579023 ?auto_579024 ) ( ON ?auto_579022 ?auto_579023 ) ( ON ?auto_579021 ?auto_579022 ) ( ON ?auto_579020 ?auto_579021 ) ( ON ?auto_579019 ?auto_579020 ) ( CLEAR ?auto_579017 ) ( ON ?auto_579018 ?auto_579019 ) ( CLEAR ?auto_579018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_579017 ?auto_579018 )
      ( MAKE-9PILE ?auto_579017 ?auto_579018 ?auto_579019 ?auto_579020 ?auto_579021 ?auto_579022 ?auto_579023 ?auto_579024 ?auto_579025 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_579055 - BLOCK
      ?auto_579056 - BLOCK
      ?auto_579057 - BLOCK
      ?auto_579058 - BLOCK
      ?auto_579059 - BLOCK
      ?auto_579060 - BLOCK
      ?auto_579061 - BLOCK
      ?auto_579062 - BLOCK
      ?auto_579063 - BLOCK
    )
    :vars
    (
      ?auto_579064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579063 ?auto_579064 ) ( not ( = ?auto_579055 ?auto_579056 ) ) ( not ( = ?auto_579055 ?auto_579057 ) ) ( not ( = ?auto_579055 ?auto_579058 ) ) ( not ( = ?auto_579055 ?auto_579059 ) ) ( not ( = ?auto_579055 ?auto_579060 ) ) ( not ( = ?auto_579055 ?auto_579061 ) ) ( not ( = ?auto_579055 ?auto_579062 ) ) ( not ( = ?auto_579055 ?auto_579063 ) ) ( not ( = ?auto_579055 ?auto_579064 ) ) ( not ( = ?auto_579056 ?auto_579057 ) ) ( not ( = ?auto_579056 ?auto_579058 ) ) ( not ( = ?auto_579056 ?auto_579059 ) ) ( not ( = ?auto_579056 ?auto_579060 ) ) ( not ( = ?auto_579056 ?auto_579061 ) ) ( not ( = ?auto_579056 ?auto_579062 ) ) ( not ( = ?auto_579056 ?auto_579063 ) ) ( not ( = ?auto_579056 ?auto_579064 ) ) ( not ( = ?auto_579057 ?auto_579058 ) ) ( not ( = ?auto_579057 ?auto_579059 ) ) ( not ( = ?auto_579057 ?auto_579060 ) ) ( not ( = ?auto_579057 ?auto_579061 ) ) ( not ( = ?auto_579057 ?auto_579062 ) ) ( not ( = ?auto_579057 ?auto_579063 ) ) ( not ( = ?auto_579057 ?auto_579064 ) ) ( not ( = ?auto_579058 ?auto_579059 ) ) ( not ( = ?auto_579058 ?auto_579060 ) ) ( not ( = ?auto_579058 ?auto_579061 ) ) ( not ( = ?auto_579058 ?auto_579062 ) ) ( not ( = ?auto_579058 ?auto_579063 ) ) ( not ( = ?auto_579058 ?auto_579064 ) ) ( not ( = ?auto_579059 ?auto_579060 ) ) ( not ( = ?auto_579059 ?auto_579061 ) ) ( not ( = ?auto_579059 ?auto_579062 ) ) ( not ( = ?auto_579059 ?auto_579063 ) ) ( not ( = ?auto_579059 ?auto_579064 ) ) ( not ( = ?auto_579060 ?auto_579061 ) ) ( not ( = ?auto_579060 ?auto_579062 ) ) ( not ( = ?auto_579060 ?auto_579063 ) ) ( not ( = ?auto_579060 ?auto_579064 ) ) ( not ( = ?auto_579061 ?auto_579062 ) ) ( not ( = ?auto_579061 ?auto_579063 ) ) ( not ( = ?auto_579061 ?auto_579064 ) ) ( not ( = ?auto_579062 ?auto_579063 ) ) ( not ( = ?auto_579062 ?auto_579064 ) ) ( not ( = ?auto_579063 ?auto_579064 ) ) ( ON ?auto_579062 ?auto_579063 ) ( ON ?auto_579061 ?auto_579062 ) ( ON ?auto_579060 ?auto_579061 ) ( ON ?auto_579059 ?auto_579060 ) ( ON ?auto_579058 ?auto_579059 ) ( ON ?auto_579057 ?auto_579058 ) ( ON ?auto_579056 ?auto_579057 ) ( ON ?auto_579055 ?auto_579056 ) ( CLEAR ?auto_579055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_579055 )
      ( MAKE-9PILE ?auto_579055 ?auto_579056 ?auto_579057 ?auto_579058 ?auto_579059 ?auto_579060 ?auto_579061 ?auto_579062 ?auto_579063 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_579094 - BLOCK
      ?auto_579095 - BLOCK
      ?auto_579096 - BLOCK
      ?auto_579097 - BLOCK
      ?auto_579098 - BLOCK
      ?auto_579099 - BLOCK
      ?auto_579100 - BLOCK
      ?auto_579101 - BLOCK
      ?auto_579102 - BLOCK
      ?auto_579103 - BLOCK
    )
    :vars
    (
      ?auto_579104 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_579102 ) ( ON ?auto_579103 ?auto_579104 ) ( CLEAR ?auto_579103 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_579094 ) ( ON ?auto_579095 ?auto_579094 ) ( ON ?auto_579096 ?auto_579095 ) ( ON ?auto_579097 ?auto_579096 ) ( ON ?auto_579098 ?auto_579097 ) ( ON ?auto_579099 ?auto_579098 ) ( ON ?auto_579100 ?auto_579099 ) ( ON ?auto_579101 ?auto_579100 ) ( ON ?auto_579102 ?auto_579101 ) ( not ( = ?auto_579094 ?auto_579095 ) ) ( not ( = ?auto_579094 ?auto_579096 ) ) ( not ( = ?auto_579094 ?auto_579097 ) ) ( not ( = ?auto_579094 ?auto_579098 ) ) ( not ( = ?auto_579094 ?auto_579099 ) ) ( not ( = ?auto_579094 ?auto_579100 ) ) ( not ( = ?auto_579094 ?auto_579101 ) ) ( not ( = ?auto_579094 ?auto_579102 ) ) ( not ( = ?auto_579094 ?auto_579103 ) ) ( not ( = ?auto_579094 ?auto_579104 ) ) ( not ( = ?auto_579095 ?auto_579096 ) ) ( not ( = ?auto_579095 ?auto_579097 ) ) ( not ( = ?auto_579095 ?auto_579098 ) ) ( not ( = ?auto_579095 ?auto_579099 ) ) ( not ( = ?auto_579095 ?auto_579100 ) ) ( not ( = ?auto_579095 ?auto_579101 ) ) ( not ( = ?auto_579095 ?auto_579102 ) ) ( not ( = ?auto_579095 ?auto_579103 ) ) ( not ( = ?auto_579095 ?auto_579104 ) ) ( not ( = ?auto_579096 ?auto_579097 ) ) ( not ( = ?auto_579096 ?auto_579098 ) ) ( not ( = ?auto_579096 ?auto_579099 ) ) ( not ( = ?auto_579096 ?auto_579100 ) ) ( not ( = ?auto_579096 ?auto_579101 ) ) ( not ( = ?auto_579096 ?auto_579102 ) ) ( not ( = ?auto_579096 ?auto_579103 ) ) ( not ( = ?auto_579096 ?auto_579104 ) ) ( not ( = ?auto_579097 ?auto_579098 ) ) ( not ( = ?auto_579097 ?auto_579099 ) ) ( not ( = ?auto_579097 ?auto_579100 ) ) ( not ( = ?auto_579097 ?auto_579101 ) ) ( not ( = ?auto_579097 ?auto_579102 ) ) ( not ( = ?auto_579097 ?auto_579103 ) ) ( not ( = ?auto_579097 ?auto_579104 ) ) ( not ( = ?auto_579098 ?auto_579099 ) ) ( not ( = ?auto_579098 ?auto_579100 ) ) ( not ( = ?auto_579098 ?auto_579101 ) ) ( not ( = ?auto_579098 ?auto_579102 ) ) ( not ( = ?auto_579098 ?auto_579103 ) ) ( not ( = ?auto_579098 ?auto_579104 ) ) ( not ( = ?auto_579099 ?auto_579100 ) ) ( not ( = ?auto_579099 ?auto_579101 ) ) ( not ( = ?auto_579099 ?auto_579102 ) ) ( not ( = ?auto_579099 ?auto_579103 ) ) ( not ( = ?auto_579099 ?auto_579104 ) ) ( not ( = ?auto_579100 ?auto_579101 ) ) ( not ( = ?auto_579100 ?auto_579102 ) ) ( not ( = ?auto_579100 ?auto_579103 ) ) ( not ( = ?auto_579100 ?auto_579104 ) ) ( not ( = ?auto_579101 ?auto_579102 ) ) ( not ( = ?auto_579101 ?auto_579103 ) ) ( not ( = ?auto_579101 ?auto_579104 ) ) ( not ( = ?auto_579102 ?auto_579103 ) ) ( not ( = ?auto_579102 ?auto_579104 ) ) ( not ( = ?auto_579103 ?auto_579104 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_579103 ?auto_579104 )
      ( !STACK ?auto_579103 ?auto_579102 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_579136 - BLOCK
      ?auto_579137 - BLOCK
      ?auto_579138 - BLOCK
      ?auto_579139 - BLOCK
      ?auto_579140 - BLOCK
      ?auto_579141 - BLOCK
      ?auto_579142 - BLOCK
      ?auto_579143 - BLOCK
      ?auto_579144 - BLOCK
      ?auto_579145 - BLOCK
    )
    :vars
    (
      ?auto_579146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579145 ?auto_579146 ) ( ON-TABLE ?auto_579136 ) ( ON ?auto_579137 ?auto_579136 ) ( ON ?auto_579138 ?auto_579137 ) ( ON ?auto_579139 ?auto_579138 ) ( ON ?auto_579140 ?auto_579139 ) ( ON ?auto_579141 ?auto_579140 ) ( ON ?auto_579142 ?auto_579141 ) ( ON ?auto_579143 ?auto_579142 ) ( not ( = ?auto_579136 ?auto_579137 ) ) ( not ( = ?auto_579136 ?auto_579138 ) ) ( not ( = ?auto_579136 ?auto_579139 ) ) ( not ( = ?auto_579136 ?auto_579140 ) ) ( not ( = ?auto_579136 ?auto_579141 ) ) ( not ( = ?auto_579136 ?auto_579142 ) ) ( not ( = ?auto_579136 ?auto_579143 ) ) ( not ( = ?auto_579136 ?auto_579144 ) ) ( not ( = ?auto_579136 ?auto_579145 ) ) ( not ( = ?auto_579136 ?auto_579146 ) ) ( not ( = ?auto_579137 ?auto_579138 ) ) ( not ( = ?auto_579137 ?auto_579139 ) ) ( not ( = ?auto_579137 ?auto_579140 ) ) ( not ( = ?auto_579137 ?auto_579141 ) ) ( not ( = ?auto_579137 ?auto_579142 ) ) ( not ( = ?auto_579137 ?auto_579143 ) ) ( not ( = ?auto_579137 ?auto_579144 ) ) ( not ( = ?auto_579137 ?auto_579145 ) ) ( not ( = ?auto_579137 ?auto_579146 ) ) ( not ( = ?auto_579138 ?auto_579139 ) ) ( not ( = ?auto_579138 ?auto_579140 ) ) ( not ( = ?auto_579138 ?auto_579141 ) ) ( not ( = ?auto_579138 ?auto_579142 ) ) ( not ( = ?auto_579138 ?auto_579143 ) ) ( not ( = ?auto_579138 ?auto_579144 ) ) ( not ( = ?auto_579138 ?auto_579145 ) ) ( not ( = ?auto_579138 ?auto_579146 ) ) ( not ( = ?auto_579139 ?auto_579140 ) ) ( not ( = ?auto_579139 ?auto_579141 ) ) ( not ( = ?auto_579139 ?auto_579142 ) ) ( not ( = ?auto_579139 ?auto_579143 ) ) ( not ( = ?auto_579139 ?auto_579144 ) ) ( not ( = ?auto_579139 ?auto_579145 ) ) ( not ( = ?auto_579139 ?auto_579146 ) ) ( not ( = ?auto_579140 ?auto_579141 ) ) ( not ( = ?auto_579140 ?auto_579142 ) ) ( not ( = ?auto_579140 ?auto_579143 ) ) ( not ( = ?auto_579140 ?auto_579144 ) ) ( not ( = ?auto_579140 ?auto_579145 ) ) ( not ( = ?auto_579140 ?auto_579146 ) ) ( not ( = ?auto_579141 ?auto_579142 ) ) ( not ( = ?auto_579141 ?auto_579143 ) ) ( not ( = ?auto_579141 ?auto_579144 ) ) ( not ( = ?auto_579141 ?auto_579145 ) ) ( not ( = ?auto_579141 ?auto_579146 ) ) ( not ( = ?auto_579142 ?auto_579143 ) ) ( not ( = ?auto_579142 ?auto_579144 ) ) ( not ( = ?auto_579142 ?auto_579145 ) ) ( not ( = ?auto_579142 ?auto_579146 ) ) ( not ( = ?auto_579143 ?auto_579144 ) ) ( not ( = ?auto_579143 ?auto_579145 ) ) ( not ( = ?auto_579143 ?auto_579146 ) ) ( not ( = ?auto_579144 ?auto_579145 ) ) ( not ( = ?auto_579144 ?auto_579146 ) ) ( not ( = ?auto_579145 ?auto_579146 ) ) ( CLEAR ?auto_579143 ) ( ON ?auto_579144 ?auto_579145 ) ( CLEAR ?auto_579144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_579136 ?auto_579137 ?auto_579138 ?auto_579139 ?auto_579140 ?auto_579141 ?auto_579142 ?auto_579143 ?auto_579144 )
      ( MAKE-10PILE ?auto_579136 ?auto_579137 ?auto_579138 ?auto_579139 ?auto_579140 ?auto_579141 ?auto_579142 ?auto_579143 ?auto_579144 ?auto_579145 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_579178 - BLOCK
      ?auto_579179 - BLOCK
      ?auto_579180 - BLOCK
      ?auto_579181 - BLOCK
      ?auto_579182 - BLOCK
      ?auto_579183 - BLOCK
      ?auto_579184 - BLOCK
      ?auto_579185 - BLOCK
      ?auto_579186 - BLOCK
      ?auto_579187 - BLOCK
    )
    :vars
    (
      ?auto_579188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579187 ?auto_579188 ) ( ON-TABLE ?auto_579178 ) ( ON ?auto_579179 ?auto_579178 ) ( ON ?auto_579180 ?auto_579179 ) ( ON ?auto_579181 ?auto_579180 ) ( ON ?auto_579182 ?auto_579181 ) ( ON ?auto_579183 ?auto_579182 ) ( ON ?auto_579184 ?auto_579183 ) ( not ( = ?auto_579178 ?auto_579179 ) ) ( not ( = ?auto_579178 ?auto_579180 ) ) ( not ( = ?auto_579178 ?auto_579181 ) ) ( not ( = ?auto_579178 ?auto_579182 ) ) ( not ( = ?auto_579178 ?auto_579183 ) ) ( not ( = ?auto_579178 ?auto_579184 ) ) ( not ( = ?auto_579178 ?auto_579185 ) ) ( not ( = ?auto_579178 ?auto_579186 ) ) ( not ( = ?auto_579178 ?auto_579187 ) ) ( not ( = ?auto_579178 ?auto_579188 ) ) ( not ( = ?auto_579179 ?auto_579180 ) ) ( not ( = ?auto_579179 ?auto_579181 ) ) ( not ( = ?auto_579179 ?auto_579182 ) ) ( not ( = ?auto_579179 ?auto_579183 ) ) ( not ( = ?auto_579179 ?auto_579184 ) ) ( not ( = ?auto_579179 ?auto_579185 ) ) ( not ( = ?auto_579179 ?auto_579186 ) ) ( not ( = ?auto_579179 ?auto_579187 ) ) ( not ( = ?auto_579179 ?auto_579188 ) ) ( not ( = ?auto_579180 ?auto_579181 ) ) ( not ( = ?auto_579180 ?auto_579182 ) ) ( not ( = ?auto_579180 ?auto_579183 ) ) ( not ( = ?auto_579180 ?auto_579184 ) ) ( not ( = ?auto_579180 ?auto_579185 ) ) ( not ( = ?auto_579180 ?auto_579186 ) ) ( not ( = ?auto_579180 ?auto_579187 ) ) ( not ( = ?auto_579180 ?auto_579188 ) ) ( not ( = ?auto_579181 ?auto_579182 ) ) ( not ( = ?auto_579181 ?auto_579183 ) ) ( not ( = ?auto_579181 ?auto_579184 ) ) ( not ( = ?auto_579181 ?auto_579185 ) ) ( not ( = ?auto_579181 ?auto_579186 ) ) ( not ( = ?auto_579181 ?auto_579187 ) ) ( not ( = ?auto_579181 ?auto_579188 ) ) ( not ( = ?auto_579182 ?auto_579183 ) ) ( not ( = ?auto_579182 ?auto_579184 ) ) ( not ( = ?auto_579182 ?auto_579185 ) ) ( not ( = ?auto_579182 ?auto_579186 ) ) ( not ( = ?auto_579182 ?auto_579187 ) ) ( not ( = ?auto_579182 ?auto_579188 ) ) ( not ( = ?auto_579183 ?auto_579184 ) ) ( not ( = ?auto_579183 ?auto_579185 ) ) ( not ( = ?auto_579183 ?auto_579186 ) ) ( not ( = ?auto_579183 ?auto_579187 ) ) ( not ( = ?auto_579183 ?auto_579188 ) ) ( not ( = ?auto_579184 ?auto_579185 ) ) ( not ( = ?auto_579184 ?auto_579186 ) ) ( not ( = ?auto_579184 ?auto_579187 ) ) ( not ( = ?auto_579184 ?auto_579188 ) ) ( not ( = ?auto_579185 ?auto_579186 ) ) ( not ( = ?auto_579185 ?auto_579187 ) ) ( not ( = ?auto_579185 ?auto_579188 ) ) ( not ( = ?auto_579186 ?auto_579187 ) ) ( not ( = ?auto_579186 ?auto_579188 ) ) ( not ( = ?auto_579187 ?auto_579188 ) ) ( ON ?auto_579186 ?auto_579187 ) ( CLEAR ?auto_579184 ) ( ON ?auto_579185 ?auto_579186 ) ( CLEAR ?auto_579185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_579178 ?auto_579179 ?auto_579180 ?auto_579181 ?auto_579182 ?auto_579183 ?auto_579184 ?auto_579185 )
      ( MAKE-10PILE ?auto_579178 ?auto_579179 ?auto_579180 ?auto_579181 ?auto_579182 ?auto_579183 ?auto_579184 ?auto_579185 ?auto_579186 ?auto_579187 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_579220 - BLOCK
      ?auto_579221 - BLOCK
      ?auto_579222 - BLOCK
      ?auto_579223 - BLOCK
      ?auto_579224 - BLOCK
      ?auto_579225 - BLOCK
      ?auto_579226 - BLOCK
      ?auto_579227 - BLOCK
      ?auto_579228 - BLOCK
      ?auto_579229 - BLOCK
    )
    :vars
    (
      ?auto_579230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579229 ?auto_579230 ) ( ON-TABLE ?auto_579220 ) ( ON ?auto_579221 ?auto_579220 ) ( ON ?auto_579222 ?auto_579221 ) ( ON ?auto_579223 ?auto_579222 ) ( ON ?auto_579224 ?auto_579223 ) ( ON ?auto_579225 ?auto_579224 ) ( not ( = ?auto_579220 ?auto_579221 ) ) ( not ( = ?auto_579220 ?auto_579222 ) ) ( not ( = ?auto_579220 ?auto_579223 ) ) ( not ( = ?auto_579220 ?auto_579224 ) ) ( not ( = ?auto_579220 ?auto_579225 ) ) ( not ( = ?auto_579220 ?auto_579226 ) ) ( not ( = ?auto_579220 ?auto_579227 ) ) ( not ( = ?auto_579220 ?auto_579228 ) ) ( not ( = ?auto_579220 ?auto_579229 ) ) ( not ( = ?auto_579220 ?auto_579230 ) ) ( not ( = ?auto_579221 ?auto_579222 ) ) ( not ( = ?auto_579221 ?auto_579223 ) ) ( not ( = ?auto_579221 ?auto_579224 ) ) ( not ( = ?auto_579221 ?auto_579225 ) ) ( not ( = ?auto_579221 ?auto_579226 ) ) ( not ( = ?auto_579221 ?auto_579227 ) ) ( not ( = ?auto_579221 ?auto_579228 ) ) ( not ( = ?auto_579221 ?auto_579229 ) ) ( not ( = ?auto_579221 ?auto_579230 ) ) ( not ( = ?auto_579222 ?auto_579223 ) ) ( not ( = ?auto_579222 ?auto_579224 ) ) ( not ( = ?auto_579222 ?auto_579225 ) ) ( not ( = ?auto_579222 ?auto_579226 ) ) ( not ( = ?auto_579222 ?auto_579227 ) ) ( not ( = ?auto_579222 ?auto_579228 ) ) ( not ( = ?auto_579222 ?auto_579229 ) ) ( not ( = ?auto_579222 ?auto_579230 ) ) ( not ( = ?auto_579223 ?auto_579224 ) ) ( not ( = ?auto_579223 ?auto_579225 ) ) ( not ( = ?auto_579223 ?auto_579226 ) ) ( not ( = ?auto_579223 ?auto_579227 ) ) ( not ( = ?auto_579223 ?auto_579228 ) ) ( not ( = ?auto_579223 ?auto_579229 ) ) ( not ( = ?auto_579223 ?auto_579230 ) ) ( not ( = ?auto_579224 ?auto_579225 ) ) ( not ( = ?auto_579224 ?auto_579226 ) ) ( not ( = ?auto_579224 ?auto_579227 ) ) ( not ( = ?auto_579224 ?auto_579228 ) ) ( not ( = ?auto_579224 ?auto_579229 ) ) ( not ( = ?auto_579224 ?auto_579230 ) ) ( not ( = ?auto_579225 ?auto_579226 ) ) ( not ( = ?auto_579225 ?auto_579227 ) ) ( not ( = ?auto_579225 ?auto_579228 ) ) ( not ( = ?auto_579225 ?auto_579229 ) ) ( not ( = ?auto_579225 ?auto_579230 ) ) ( not ( = ?auto_579226 ?auto_579227 ) ) ( not ( = ?auto_579226 ?auto_579228 ) ) ( not ( = ?auto_579226 ?auto_579229 ) ) ( not ( = ?auto_579226 ?auto_579230 ) ) ( not ( = ?auto_579227 ?auto_579228 ) ) ( not ( = ?auto_579227 ?auto_579229 ) ) ( not ( = ?auto_579227 ?auto_579230 ) ) ( not ( = ?auto_579228 ?auto_579229 ) ) ( not ( = ?auto_579228 ?auto_579230 ) ) ( not ( = ?auto_579229 ?auto_579230 ) ) ( ON ?auto_579228 ?auto_579229 ) ( ON ?auto_579227 ?auto_579228 ) ( CLEAR ?auto_579225 ) ( ON ?auto_579226 ?auto_579227 ) ( CLEAR ?auto_579226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_579220 ?auto_579221 ?auto_579222 ?auto_579223 ?auto_579224 ?auto_579225 ?auto_579226 )
      ( MAKE-10PILE ?auto_579220 ?auto_579221 ?auto_579222 ?auto_579223 ?auto_579224 ?auto_579225 ?auto_579226 ?auto_579227 ?auto_579228 ?auto_579229 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_579262 - BLOCK
      ?auto_579263 - BLOCK
      ?auto_579264 - BLOCK
      ?auto_579265 - BLOCK
      ?auto_579266 - BLOCK
      ?auto_579267 - BLOCK
      ?auto_579268 - BLOCK
      ?auto_579269 - BLOCK
      ?auto_579270 - BLOCK
      ?auto_579271 - BLOCK
    )
    :vars
    (
      ?auto_579272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579271 ?auto_579272 ) ( ON-TABLE ?auto_579262 ) ( ON ?auto_579263 ?auto_579262 ) ( ON ?auto_579264 ?auto_579263 ) ( ON ?auto_579265 ?auto_579264 ) ( ON ?auto_579266 ?auto_579265 ) ( not ( = ?auto_579262 ?auto_579263 ) ) ( not ( = ?auto_579262 ?auto_579264 ) ) ( not ( = ?auto_579262 ?auto_579265 ) ) ( not ( = ?auto_579262 ?auto_579266 ) ) ( not ( = ?auto_579262 ?auto_579267 ) ) ( not ( = ?auto_579262 ?auto_579268 ) ) ( not ( = ?auto_579262 ?auto_579269 ) ) ( not ( = ?auto_579262 ?auto_579270 ) ) ( not ( = ?auto_579262 ?auto_579271 ) ) ( not ( = ?auto_579262 ?auto_579272 ) ) ( not ( = ?auto_579263 ?auto_579264 ) ) ( not ( = ?auto_579263 ?auto_579265 ) ) ( not ( = ?auto_579263 ?auto_579266 ) ) ( not ( = ?auto_579263 ?auto_579267 ) ) ( not ( = ?auto_579263 ?auto_579268 ) ) ( not ( = ?auto_579263 ?auto_579269 ) ) ( not ( = ?auto_579263 ?auto_579270 ) ) ( not ( = ?auto_579263 ?auto_579271 ) ) ( not ( = ?auto_579263 ?auto_579272 ) ) ( not ( = ?auto_579264 ?auto_579265 ) ) ( not ( = ?auto_579264 ?auto_579266 ) ) ( not ( = ?auto_579264 ?auto_579267 ) ) ( not ( = ?auto_579264 ?auto_579268 ) ) ( not ( = ?auto_579264 ?auto_579269 ) ) ( not ( = ?auto_579264 ?auto_579270 ) ) ( not ( = ?auto_579264 ?auto_579271 ) ) ( not ( = ?auto_579264 ?auto_579272 ) ) ( not ( = ?auto_579265 ?auto_579266 ) ) ( not ( = ?auto_579265 ?auto_579267 ) ) ( not ( = ?auto_579265 ?auto_579268 ) ) ( not ( = ?auto_579265 ?auto_579269 ) ) ( not ( = ?auto_579265 ?auto_579270 ) ) ( not ( = ?auto_579265 ?auto_579271 ) ) ( not ( = ?auto_579265 ?auto_579272 ) ) ( not ( = ?auto_579266 ?auto_579267 ) ) ( not ( = ?auto_579266 ?auto_579268 ) ) ( not ( = ?auto_579266 ?auto_579269 ) ) ( not ( = ?auto_579266 ?auto_579270 ) ) ( not ( = ?auto_579266 ?auto_579271 ) ) ( not ( = ?auto_579266 ?auto_579272 ) ) ( not ( = ?auto_579267 ?auto_579268 ) ) ( not ( = ?auto_579267 ?auto_579269 ) ) ( not ( = ?auto_579267 ?auto_579270 ) ) ( not ( = ?auto_579267 ?auto_579271 ) ) ( not ( = ?auto_579267 ?auto_579272 ) ) ( not ( = ?auto_579268 ?auto_579269 ) ) ( not ( = ?auto_579268 ?auto_579270 ) ) ( not ( = ?auto_579268 ?auto_579271 ) ) ( not ( = ?auto_579268 ?auto_579272 ) ) ( not ( = ?auto_579269 ?auto_579270 ) ) ( not ( = ?auto_579269 ?auto_579271 ) ) ( not ( = ?auto_579269 ?auto_579272 ) ) ( not ( = ?auto_579270 ?auto_579271 ) ) ( not ( = ?auto_579270 ?auto_579272 ) ) ( not ( = ?auto_579271 ?auto_579272 ) ) ( ON ?auto_579270 ?auto_579271 ) ( ON ?auto_579269 ?auto_579270 ) ( ON ?auto_579268 ?auto_579269 ) ( CLEAR ?auto_579266 ) ( ON ?auto_579267 ?auto_579268 ) ( CLEAR ?auto_579267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_579262 ?auto_579263 ?auto_579264 ?auto_579265 ?auto_579266 ?auto_579267 )
      ( MAKE-10PILE ?auto_579262 ?auto_579263 ?auto_579264 ?auto_579265 ?auto_579266 ?auto_579267 ?auto_579268 ?auto_579269 ?auto_579270 ?auto_579271 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_579304 - BLOCK
      ?auto_579305 - BLOCK
      ?auto_579306 - BLOCK
      ?auto_579307 - BLOCK
      ?auto_579308 - BLOCK
      ?auto_579309 - BLOCK
      ?auto_579310 - BLOCK
      ?auto_579311 - BLOCK
      ?auto_579312 - BLOCK
      ?auto_579313 - BLOCK
    )
    :vars
    (
      ?auto_579314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579313 ?auto_579314 ) ( ON-TABLE ?auto_579304 ) ( ON ?auto_579305 ?auto_579304 ) ( ON ?auto_579306 ?auto_579305 ) ( ON ?auto_579307 ?auto_579306 ) ( not ( = ?auto_579304 ?auto_579305 ) ) ( not ( = ?auto_579304 ?auto_579306 ) ) ( not ( = ?auto_579304 ?auto_579307 ) ) ( not ( = ?auto_579304 ?auto_579308 ) ) ( not ( = ?auto_579304 ?auto_579309 ) ) ( not ( = ?auto_579304 ?auto_579310 ) ) ( not ( = ?auto_579304 ?auto_579311 ) ) ( not ( = ?auto_579304 ?auto_579312 ) ) ( not ( = ?auto_579304 ?auto_579313 ) ) ( not ( = ?auto_579304 ?auto_579314 ) ) ( not ( = ?auto_579305 ?auto_579306 ) ) ( not ( = ?auto_579305 ?auto_579307 ) ) ( not ( = ?auto_579305 ?auto_579308 ) ) ( not ( = ?auto_579305 ?auto_579309 ) ) ( not ( = ?auto_579305 ?auto_579310 ) ) ( not ( = ?auto_579305 ?auto_579311 ) ) ( not ( = ?auto_579305 ?auto_579312 ) ) ( not ( = ?auto_579305 ?auto_579313 ) ) ( not ( = ?auto_579305 ?auto_579314 ) ) ( not ( = ?auto_579306 ?auto_579307 ) ) ( not ( = ?auto_579306 ?auto_579308 ) ) ( not ( = ?auto_579306 ?auto_579309 ) ) ( not ( = ?auto_579306 ?auto_579310 ) ) ( not ( = ?auto_579306 ?auto_579311 ) ) ( not ( = ?auto_579306 ?auto_579312 ) ) ( not ( = ?auto_579306 ?auto_579313 ) ) ( not ( = ?auto_579306 ?auto_579314 ) ) ( not ( = ?auto_579307 ?auto_579308 ) ) ( not ( = ?auto_579307 ?auto_579309 ) ) ( not ( = ?auto_579307 ?auto_579310 ) ) ( not ( = ?auto_579307 ?auto_579311 ) ) ( not ( = ?auto_579307 ?auto_579312 ) ) ( not ( = ?auto_579307 ?auto_579313 ) ) ( not ( = ?auto_579307 ?auto_579314 ) ) ( not ( = ?auto_579308 ?auto_579309 ) ) ( not ( = ?auto_579308 ?auto_579310 ) ) ( not ( = ?auto_579308 ?auto_579311 ) ) ( not ( = ?auto_579308 ?auto_579312 ) ) ( not ( = ?auto_579308 ?auto_579313 ) ) ( not ( = ?auto_579308 ?auto_579314 ) ) ( not ( = ?auto_579309 ?auto_579310 ) ) ( not ( = ?auto_579309 ?auto_579311 ) ) ( not ( = ?auto_579309 ?auto_579312 ) ) ( not ( = ?auto_579309 ?auto_579313 ) ) ( not ( = ?auto_579309 ?auto_579314 ) ) ( not ( = ?auto_579310 ?auto_579311 ) ) ( not ( = ?auto_579310 ?auto_579312 ) ) ( not ( = ?auto_579310 ?auto_579313 ) ) ( not ( = ?auto_579310 ?auto_579314 ) ) ( not ( = ?auto_579311 ?auto_579312 ) ) ( not ( = ?auto_579311 ?auto_579313 ) ) ( not ( = ?auto_579311 ?auto_579314 ) ) ( not ( = ?auto_579312 ?auto_579313 ) ) ( not ( = ?auto_579312 ?auto_579314 ) ) ( not ( = ?auto_579313 ?auto_579314 ) ) ( ON ?auto_579312 ?auto_579313 ) ( ON ?auto_579311 ?auto_579312 ) ( ON ?auto_579310 ?auto_579311 ) ( ON ?auto_579309 ?auto_579310 ) ( CLEAR ?auto_579307 ) ( ON ?auto_579308 ?auto_579309 ) ( CLEAR ?auto_579308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_579304 ?auto_579305 ?auto_579306 ?auto_579307 ?auto_579308 )
      ( MAKE-10PILE ?auto_579304 ?auto_579305 ?auto_579306 ?auto_579307 ?auto_579308 ?auto_579309 ?auto_579310 ?auto_579311 ?auto_579312 ?auto_579313 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_579346 - BLOCK
      ?auto_579347 - BLOCK
      ?auto_579348 - BLOCK
      ?auto_579349 - BLOCK
      ?auto_579350 - BLOCK
      ?auto_579351 - BLOCK
      ?auto_579352 - BLOCK
      ?auto_579353 - BLOCK
      ?auto_579354 - BLOCK
      ?auto_579355 - BLOCK
    )
    :vars
    (
      ?auto_579356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579355 ?auto_579356 ) ( ON-TABLE ?auto_579346 ) ( ON ?auto_579347 ?auto_579346 ) ( ON ?auto_579348 ?auto_579347 ) ( not ( = ?auto_579346 ?auto_579347 ) ) ( not ( = ?auto_579346 ?auto_579348 ) ) ( not ( = ?auto_579346 ?auto_579349 ) ) ( not ( = ?auto_579346 ?auto_579350 ) ) ( not ( = ?auto_579346 ?auto_579351 ) ) ( not ( = ?auto_579346 ?auto_579352 ) ) ( not ( = ?auto_579346 ?auto_579353 ) ) ( not ( = ?auto_579346 ?auto_579354 ) ) ( not ( = ?auto_579346 ?auto_579355 ) ) ( not ( = ?auto_579346 ?auto_579356 ) ) ( not ( = ?auto_579347 ?auto_579348 ) ) ( not ( = ?auto_579347 ?auto_579349 ) ) ( not ( = ?auto_579347 ?auto_579350 ) ) ( not ( = ?auto_579347 ?auto_579351 ) ) ( not ( = ?auto_579347 ?auto_579352 ) ) ( not ( = ?auto_579347 ?auto_579353 ) ) ( not ( = ?auto_579347 ?auto_579354 ) ) ( not ( = ?auto_579347 ?auto_579355 ) ) ( not ( = ?auto_579347 ?auto_579356 ) ) ( not ( = ?auto_579348 ?auto_579349 ) ) ( not ( = ?auto_579348 ?auto_579350 ) ) ( not ( = ?auto_579348 ?auto_579351 ) ) ( not ( = ?auto_579348 ?auto_579352 ) ) ( not ( = ?auto_579348 ?auto_579353 ) ) ( not ( = ?auto_579348 ?auto_579354 ) ) ( not ( = ?auto_579348 ?auto_579355 ) ) ( not ( = ?auto_579348 ?auto_579356 ) ) ( not ( = ?auto_579349 ?auto_579350 ) ) ( not ( = ?auto_579349 ?auto_579351 ) ) ( not ( = ?auto_579349 ?auto_579352 ) ) ( not ( = ?auto_579349 ?auto_579353 ) ) ( not ( = ?auto_579349 ?auto_579354 ) ) ( not ( = ?auto_579349 ?auto_579355 ) ) ( not ( = ?auto_579349 ?auto_579356 ) ) ( not ( = ?auto_579350 ?auto_579351 ) ) ( not ( = ?auto_579350 ?auto_579352 ) ) ( not ( = ?auto_579350 ?auto_579353 ) ) ( not ( = ?auto_579350 ?auto_579354 ) ) ( not ( = ?auto_579350 ?auto_579355 ) ) ( not ( = ?auto_579350 ?auto_579356 ) ) ( not ( = ?auto_579351 ?auto_579352 ) ) ( not ( = ?auto_579351 ?auto_579353 ) ) ( not ( = ?auto_579351 ?auto_579354 ) ) ( not ( = ?auto_579351 ?auto_579355 ) ) ( not ( = ?auto_579351 ?auto_579356 ) ) ( not ( = ?auto_579352 ?auto_579353 ) ) ( not ( = ?auto_579352 ?auto_579354 ) ) ( not ( = ?auto_579352 ?auto_579355 ) ) ( not ( = ?auto_579352 ?auto_579356 ) ) ( not ( = ?auto_579353 ?auto_579354 ) ) ( not ( = ?auto_579353 ?auto_579355 ) ) ( not ( = ?auto_579353 ?auto_579356 ) ) ( not ( = ?auto_579354 ?auto_579355 ) ) ( not ( = ?auto_579354 ?auto_579356 ) ) ( not ( = ?auto_579355 ?auto_579356 ) ) ( ON ?auto_579354 ?auto_579355 ) ( ON ?auto_579353 ?auto_579354 ) ( ON ?auto_579352 ?auto_579353 ) ( ON ?auto_579351 ?auto_579352 ) ( ON ?auto_579350 ?auto_579351 ) ( CLEAR ?auto_579348 ) ( ON ?auto_579349 ?auto_579350 ) ( CLEAR ?auto_579349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_579346 ?auto_579347 ?auto_579348 ?auto_579349 )
      ( MAKE-10PILE ?auto_579346 ?auto_579347 ?auto_579348 ?auto_579349 ?auto_579350 ?auto_579351 ?auto_579352 ?auto_579353 ?auto_579354 ?auto_579355 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_579388 - BLOCK
      ?auto_579389 - BLOCK
      ?auto_579390 - BLOCK
      ?auto_579391 - BLOCK
      ?auto_579392 - BLOCK
      ?auto_579393 - BLOCK
      ?auto_579394 - BLOCK
      ?auto_579395 - BLOCK
      ?auto_579396 - BLOCK
      ?auto_579397 - BLOCK
    )
    :vars
    (
      ?auto_579398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579397 ?auto_579398 ) ( ON-TABLE ?auto_579388 ) ( ON ?auto_579389 ?auto_579388 ) ( not ( = ?auto_579388 ?auto_579389 ) ) ( not ( = ?auto_579388 ?auto_579390 ) ) ( not ( = ?auto_579388 ?auto_579391 ) ) ( not ( = ?auto_579388 ?auto_579392 ) ) ( not ( = ?auto_579388 ?auto_579393 ) ) ( not ( = ?auto_579388 ?auto_579394 ) ) ( not ( = ?auto_579388 ?auto_579395 ) ) ( not ( = ?auto_579388 ?auto_579396 ) ) ( not ( = ?auto_579388 ?auto_579397 ) ) ( not ( = ?auto_579388 ?auto_579398 ) ) ( not ( = ?auto_579389 ?auto_579390 ) ) ( not ( = ?auto_579389 ?auto_579391 ) ) ( not ( = ?auto_579389 ?auto_579392 ) ) ( not ( = ?auto_579389 ?auto_579393 ) ) ( not ( = ?auto_579389 ?auto_579394 ) ) ( not ( = ?auto_579389 ?auto_579395 ) ) ( not ( = ?auto_579389 ?auto_579396 ) ) ( not ( = ?auto_579389 ?auto_579397 ) ) ( not ( = ?auto_579389 ?auto_579398 ) ) ( not ( = ?auto_579390 ?auto_579391 ) ) ( not ( = ?auto_579390 ?auto_579392 ) ) ( not ( = ?auto_579390 ?auto_579393 ) ) ( not ( = ?auto_579390 ?auto_579394 ) ) ( not ( = ?auto_579390 ?auto_579395 ) ) ( not ( = ?auto_579390 ?auto_579396 ) ) ( not ( = ?auto_579390 ?auto_579397 ) ) ( not ( = ?auto_579390 ?auto_579398 ) ) ( not ( = ?auto_579391 ?auto_579392 ) ) ( not ( = ?auto_579391 ?auto_579393 ) ) ( not ( = ?auto_579391 ?auto_579394 ) ) ( not ( = ?auto_579391 ?auto_579395 ) ) ( not ( = ?auto_579391 ?auto_579396 ) ) ( not ( = ?auto_579391 ?auto_579397 ) ) ( not ( = ?auto_579391 ?auto_579398 ) ) ( not ( = ?auto_579392 ?auto_579393 ) ) ( not ( = ?auto_579392 ?auto_579394 ) ) ( not ( = ?auto_579392 ?auto_579395 ) ) ( not ( = ?auto_579392 ?auto_579396 ) ) ( not ( = ?auto_579392 ?auto_579397 ) ) ( not ( = ?auto_579392 ?auto_579398 ) ) ( not ( = ?auto_579393 ?auto_579394 ) ) ( not ( = ?auto_579393 ?auto_579395 ) ) ( not ( = ?auto_579393 ?auto_579396 ) ) ( not ( = ?auto_579393 ?auto_579397 ) ) ( not ( = ?auto_579393 ?auto_579398 ) ) ( not ( = ?auto_579394 ?auto_579395 ) ) ( not ( = ?auto_579394 ?auto_579396 ) ) ( not ( = ?auto_579394 ?auto_579397 ) ) ( not ( = ?auto_579394 ?auto_579398 ) ) ( not ( = ?auto_579395 ?auto_579396 ) ) ( not ( = ?auto_579395 ?auto_579397 ) ) ( not ( = ?auto_579395 ?auto_579398 ) ) ( not ( = ?auto_579396 ?auto_579397 ) ) ( not ( = ?auto_579396 ?auto_579398 ) ) ( not ( = ?auto_579397 ?auto_579398 ) ) ( ON ?auto_579396 ?auto_579397 ) ( ON ?auto_579395 ?auto_579396 ) ( ON ?auto_579394 ?auto_579395 ) ( ON ?auto_579393 ?auto_579394 ) ( ON ?auto_579392 ?auto_579393 ) ( ON ?auto_579391 ?auto_579392 ) ( CLEAR ?auto_579389 ) ( ON ?auto_579390 ?auto_579391 ) ( CLEAR ?auto_579390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_579388 ?auto_579389 ?auto_579390 )
      ( MAKE-10PILE ?auto_579388 ?auto_579389 ?auto_579390 ?auto_579391 ?auto_579392 ?auto_579393 ?auto_579394 ?auto_579395 ?auto_579396 ?auto_579397 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_579430 - BLOCK
      ?auto_579431 - BLOCK
      ?auto_579432 - BLOCK
      ?auto_579433 - BLOCK
      ?auto_579434 - BLOCK
      ?auto_579435 - BLOCK
      ?auto_579436 - BLOCK
      ?auto_579437 - BLOCK
      ?auto_579438 - BLOCK
      ?auto_579439 - BLOCK
    )
    :vars
    (
      ?auto_579440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579439 ?auto_579440 ) ( ON-TABLE ?auto_579430 ) ( not ( = ?auto_579430 ?auto_579431 ) ) ( not ( = ?auto_579430 ?auto_579432 ) ) ( not ( = ?auto_579430 ?auto_579433 ) ) ( not ( = ?auto_579430 ?auto_579434 ) ) ( not ( = ?auto_579430 ?auto_579435 ) ) ( not ( = ?auto_579430 ?auto_579436 ) ) ( not ( = ?auto_579430 ?auto_579437 ) ) ( not ( = ?auto_579430 ?auto_579438 ) ) ( not ( = ?auto_579430 ?auto_579439 ) ) ( not ( = ?auto_579430 ?auto_579440 ) ) ( not ( = ?auto_579431 ?auto_579432 ) ) ( not ( = ?auto_579431 ?auto_579433 ) ) ( not ( = ?auto_579431 ?auto_579434 ) ) ( not ( = ?auto_579431 ?auto_579435 ) ) ( not ( = ?auto_579431 ?auto_579436 ) ) ( not ( = ?auto_579431 ?auto_579437 ) ) ( not ( = ?auto_579431 ?auto_579438 ) ) ( not ( = ?auto_579431 ?auto_579439 ) ) ( not ( = ?auto_579431 ?auto_579440 ) ) ( not ( = ?auto_579432 ?auto_579433 ) ) ( not ( = ?auto_579432 ?auto_579434 ) ) ( not ( = ?auto_579432 ?auto_579435 ) ) ( not ( = ?auto_579432 ?auto_579436 ) ) ( not ( = ?auto_579432 ?auto_579437 ) ) ( not ( = ?auto_579432 ?auto_579438 ) ) ( not ( = ?auto_579432 ?auto_579439 ) ) ( not ( = ?auto_579432 ?auto_579440 ) ) ( not ( = ?auto_579433 ?auto_579434 ) ) ( not ( = ?auto_579433 ?auto_579435 ) ) ( not ( = ?auto_579433 ?auto_579436 ) ) ( not ( = ?auto_579433 ?auto_579437 ) ) ( not ( = ?auto_579433 ?auto_579438 ) ) ( not ( = ?auto_579433 ?auto_579439 ) ) ( not ( = ?auto_579433 ?auto_579440 ) ) ( not ( = ?auto_579434 ?auto_579435 ) ) ( not ( = ?auto_579434 ?auto_579436 ) ) ( not ( = ?auto_579434 ?auto_579437 ) ) ( not ( = ?auto_579434 ?auto_579438 ) ) ( not ( = ?auto_579434 ?auto_579439 ) ) ( not ( = ?auto_579434 ?auto_579440 ) ) ( not ( = ?auto_579435 ?auto_579436 ) ) ( not ( = ?auto_579435 ?auto_579437 ) ) ( not ( = ?auto_579435 ?auto_579438 ) ) ( not ( = ?auto_579435 ?auto_579439 ) ) ( not ( = ?auto_579435 ?auto_579440 ) ) ( not ( = ?auto_579436 ?auto_579437 ) ) ( not ( = ?auto_579436 ?auto_579438 ) ) ( not ( = ?auto_579436 ?auto_579439 ) ) ( not ( = ?auto_579436 ?auto_579440 ) ) ( not ( = ?auto_579437 ?auto_579438 ) ) ( not ( = ?auto_579437 ?auto_579439 ) ) ( not ( = ?auto_579437 ?auto_579440 ) ) ( not ( = ?auto_579438 ?auto_579439 ) ) ( not ( = ?auto_579438 ?auto_579440 ) ) ( not ( = ?auto_579439 ?auto_579440 ) ) ( ON ?auto_579438 ?auto_579439 ) ( ON ?auto_579437 ?auto_579438 ) ( ON ?auto_579436 ?auto_579437 ) ( ON ?auto_579435 ?auto_579436 ) ( ON ?auto_579434 ?auto_579435 ) ( ON ?auto_579433 ?auto_579434 ) ( ON ?auto_579432 ?auto_579433 ) ( CLEAR ?auto_579430 ) ( ON ?auto_579431 ?auto_579432 ) ( CLEAR ?auto_579431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_579430 ?auto_579431 )
      ( MAKE-10PILE ?auto_579430 ?auto_579431 ?auto_579432 ?auto_579433 ?auto_579434 ?auto_579435 ?auto_579436 ?auto_579437 ?auto_579438 ?auto_579439 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_579472 - BLOCK
      ?auto_579473 - BLOCK
      ?auto_579474 - BLOCK
      ?auto_579475 - BLOCK
      ?auto_579476 - BLOCK
      ?auto_579477 - BLOCK
      ?auto_579478 - BLOCK
      ?auto_579479 - BLOCK
      ?auto_579480 - BLOCK
      ?auto_579481 - BLOCK
    )
    :vars
    (
      ?auto_579482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579481 ?auto_579482 ) ( not ( = ?auto_579472 ?auto_579473 ) ) ( not ( = ?auto_579472 ?auto_579474 ) ) ( not ( = ?auto_579472 ?auto_579475 ) ) ( not ( = ?auto_579472 ?auto_579476 ) ) ( not ( = ?auto_579472 ?auto_579477 ) ) ( not ( = ?auto_579472 ?auto_579478 ) ) ( not ( = ?auto_579472 ?auto_579479 ) ) ( not ( = ?auto_579472 ?auto_579480 ) ) ( not ( = ?auto_579472 ?auto_579481 ) ) ( not ( = ?auto_579472 ?auto_579482 ) ) ( not ( = ?auto_579473 ?auto_579474 ) ) ( not ( = ?auto_579473 ?auto_579475 ) ) ( not ( = ?auto_579473 ?auto_579476 ) ) ( not ( = ?auto_579473 ?auto_579477 ) ) ( not ( = ?auto_579473 ?auto_579478 ) ) ( not ( = ?auto_579473 ?auto_579479 ) ) ( not ( = ?auto_579473 ?auto_579480 ) ) ( not ( = ?auto_579473 ?auto_579481 ) ) ( not ( = ?auto_579473 ?auto_579482 ) ) ( not ( = ?auto_579474 ?auto_579475 ) ) ( not ( = ?auto_579474 ?auto_579476 ) ) ( not ( = ?auto_579474 ?auto_579477 ) ) ( not ( = ?auto_579474 ?auto_579478 ) ) ( not ( = ?auto_579474 ?auto_579479 ) ) ( not ( = ?auto_579474 ?auto_579480 ) ) ( not ( = ?auto_579474 ?auto_579481 ) ) ( not ( = ?auto_579474 ?auto_579482 ) ) ( not ( = ?auto_579475 ?auto_579476 ) ) ( not ( = ?auto_579475 ?auto_579477 ) ) ( not ( = ?auto_579475 ?auto_579478 ) ) ( not ( = ?auto_579475 ?auto_579479 ) ) ( not ( = ?auto_579475 ?auto_579480 ) ) ( not ( = ?auto_579475 ?auto_579481 ) ) ( not ( = ?auto_579475 ?auto_579482 ) ) ( not ( = ?auto_579476 ?auto_579477 ) ) ( not ( = ?auto_579476 ?auto_579478 ) ) ( not ( = ?auto_579476 ?auto_579479 ) ) ( not ( = ?auto_579476 ?auto_579480 ) ) ( not ( = ?auto_579476 ?auto_579481 ) ) ( not ( = ?auto_579476 ?auto_579482 ) ) ( not ( = ?auto_579477 ?auto_579478 ) ) ( not ( = ?auto_579477 ?auto_579479 ) ) ( not ( = ?auto_579477 ?auto_579480 ) ) ( not ( = ?auto_579477 ?auto_579481 ) ) ( not ( = ?auto_579477 ?auto_579482 ) ) ( not ( = ?auto_579478 ?auto_579479 ) ) ( not ( = ?auto_579478 ?auto_579480 ) ) ( not ( = ?auto_579478 ?auto_579481 ) ) ( not ( = ?auto_579478 ?auto_579482 ) ) ( not ( = ?auto_579479 ?auto_579480 ) ) ( not ( = ?auto_579479 ?auto_579481 ) ) ( not ( = ?auto_579479 ?auto_579482 ) ) ( not ( = ?auto_579480 ?auto_579481 ) ) ( not ( = ?auto_579480 ?auto_579482 ) ) ( not ( = ?auto_579481 ?auto_579482 ) ) ( ON ?auto_579480 ?auto_579481 ) ( ON ?auto_579479 ?auto_579480 ) ( ON ?auto_579478 ?auto_579479 ) ( ON ?auto_579477 ?auto_579478 ) ( ON ?auto_579476 ?auto_579477 ) ( ON ?auto_579475 ?auto_579476 ) ( ON ?auto_579474 ?auto_579475 ) ( ON ?auto_579473 ?auto_579474 ) ( ON ?auto_579472 ?auto_579473 ) ( CLEAR ?auto_579472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_579472 )
      ( MAKE-10PILE ?auto_579472 ?auto_579473 ?auto_579474 ?auto_579475 ?auto_579476 ?auto_579477 ?auto_579478 ?auto_579479 ?auto_579480 ?auto_579481 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_579515 - BLOCK
      ?auto_579516 - BLOCK
      ?auto_579517 - BLOCK
      ?auto_579518 - BLOCK
      ?auto_579519 - BLOCK
      ?auto_579520 - BLOCK
      ?auto_579521 - BLOCK
      ?auto_579522 - BLOCK
      ?auto_579523 - BLOCK
      ?auto_579524 - BLOCK
      ?auto_579525 - BLOCK
    )
    :vars
    (
      ?auto_579526 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_579524 ) ( ON ?auto_579525 ?auto_579526 ) ( CLEAR ?auto_579525 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_579515 ) ( ON ?auto_579516 ?auto_579515 ) ( ON ?auto_579517 ?auto_579516 ) ( ON ?auto_579518 ?auto_579517 ) ( ON ?auto_579519 ?auto_579518 ) ( ON ?auto_579520 ?auto_579519 ) ( ON ?auto_579521 ?auto_579520 ) ( ON ?auto_579522 ?auto_579521 ) ( ON ?auto_579523 ?auto_579522 ) ( ON ?auto_579524 ?auto_579523 ) ( not ( = ?auto_579515 ?auto_579516 ) ) ( not ( = ?auto_579515 ?auto_579517 ) ) ( not ( = ?auto_579515 ?auto_579518 ) ) ( not ( = ?auto_579515 ?auto_579519 ) ) ( not ( = ?auto_579515 ?auto_579520 ) ) ( not ( = ?auto_579515 ?auto_579521 ) ) ( not ( = ?auto_579515 ?auto_579522 ) ) ( not ( = ?auto_579515 ?auto_579523 ) ) ( not ( = ?auto_579515 ?auto_579524 ) ) ( not ( = ?auto_579515 ?auto_579525 ) ) ( not ( = ?auto_579515 ?auto_579526 ) ) ( not ( = ?auto_579516 ?auto_579517 ) ) ( not ( = ?auto_579516 ?auto_579518 ) ) ( not ( = ?auto_579516 ?auto_579519 ) ) ( not ( = ?auto_579516 ?auto_579520 ) ) ( not ( = ?auto_579516 ?auto_579521 ) ) ( not ( = ?auto_579516 ?auto_579522 ) ) ( not ( = ?auto_579516 ?auto_579523 ) ) ( not ( = ?auto_579516 ?auto_579524 ) ) ( not ( = ?auto_579516 ?auto_579525 ) ) ( not ( = ?auto_579516 ?auto_579526 ) ) ( not ( = ?auto_579517 ?auto_579518 ) ) ( not ( = ?auto_579517 ?auto_579519 ) ) ( not ( = ?auto_579517 ?auto_579520 ) ) ( not ( = ?auto_579517 ?auto_579521 ) ) ( not ( = ?auto_579517 ?auto_579522 ) ) ( not ( = ?auto_579517 ?auto_579523 ) ) ( not ( = ?auto_579517 ?auto_579524 ) ) ( not ( = ?auto_579517 ?auto_579525 ) ) ( not ( = ?auto_579517 ?auto_579526 ) ) ( not ( = ?auto_579518 ?auto_579519 ) ) ( not ( = ?auto_579518 ?auto_579520 ) ) ( not ( = ?auto_579518 ?auto_579521 ) ) ( not ( = ?auto_579518 ?auto_579522 ) ) ( not ( = ?auto_579518 ?auto_579523 ) ) ( not ( = ?auto_579518 ?auto_579524 ) ) ( not ( = ?auto_579518 ?auto_579525 ) ) ( not ( = ?auto_579518 ?auto_579526 ) ) ( not ( = ?auto_579519 ?auto_579520 ) ) ( not ( = ?auto_579519 ?auto_579521 ) ) ( not ( = ?auto_579519 ?auto_579522 ) ) ( not ( = ?auto_579519 ?auto_579523 ) ) ( not ( = ?auto_579519 ?auto_579524 ) ) ( not ( = ?auto_579519 ?auto_579525 ) ) ( not ( = ?auto_579519 ?auto_579526 ) ) ( not ( = ?auto_579520 ?auto_579521 ) ) ( not ( = ?auto_579520 ?auto_579522 ) ) ( not ( = ?auto_579520 ?auto_579523 ) ) ( not ( = ?auto_579520 ?auto_579524 ) ) ( not ( = ?auto_579520 ?auto_579525 ) ) ( not ( = ?auto_579520 ?auto_579526 ) ) ( not ( = ?auto_579521 ?auto_579522 ) ) ( not ( = ?auto_579521 ?auto_579523 ) ) ( not ( = ?auto_579521 ?auto_579524 ) ) ( not ( = ?auto_579521 ?auto_579525 ) ) ( not ( = ?auto_579521 ?auto_579526 ) ) ( not ( = ?auto_579522 ?auto_579523 ) ) ( not ( = ?auto_579522 ?auto_579524 ) ) ( not ( = ?auto_579522 ?auto_579525 ) ) ( not ( = ?auto_579522 ?auto_579526 ) ) ( not ( = ?auto_579523 ?auto_579524 ) ) ( not ( = ?auto_579523 ?auto_579525 ) ) ( not ( = ?auto_579523 ?auto_579526 ) ) ( not ( = ?auto_579524 ?auto_579525 ) ) ( not ( = ?auto_579524 ?auto_579526 ) ) ( not ( = ?auto_579525 ?auto_579526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_579525 ?auto_579526 )
      ( !STACK ?auto_579525 ?auto_579524 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_579561 - BLOCK
      ?auto_579562 - BLOCK
      ?auto_579563 - BLOCK
      ?auto_579564 - BLOCK
      ?auto_579565 - BLOCK
      ?auto_579566 - BLOCK
      ?auto_579567 - BLOCK
      ?auto_579568 - BLOCK
      ?auto_579569 - BLOCK
      ?auto_579570 - BLOCK
      ?auto_579571 - BLOCK
    )
    :vars
    (
      ?auto_579572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579571 ?auto_579572 ) ( ON-TABLE ?auto_579561 ) ( ON ?auto_579562 ?auto_579561 ) ( ON ?auto_579563 ?auto_579562 ) ( ON ?auto_579564 ?auto_579563 ) ( ON ?auto_579565 ?auto_579564 ) ( ON ?auto_579566 ?auto_579565 ) ( ON ?auto_579567 ?auto_579566 ) ( ON ?auto_579568 ?auto_579567 ) ( ON ?auto_579569 ?auto_579568 ) ( not ( = ?auto_579561 ?auto_579562 ) ) ( not ( = ?auto_579561 ?auto_579563 ) ) ( not ( = ?auto_579561 ?auto_579564 ) ) ( not ( = ?auto_579561 ?auto_579565 ) ) ( not ( = ?auto_579561 ?auto_579566 ) ) ( not ( = ?auto_579561 ?auto_579567 ) ) ( not ( = ?auto_579561 ?auto_579568 ) ) ( not ( = ?auto_579561 ?auto_579569 ) ) ( not ( = ?auto_579561 ?auto_579570 ) ) ( not ( = ?auto_579561 ?auto_579571 ) ) ( not ( = ?auto_579561 ?auto_579572 ) ) ( not ( = ?auto_579562 ?auto_579563 ) ) ( not ( = ?auto_579562 ?auto_579564 ) ) ( not ( = ?auto_579562 ?auto_579565 ) ) ( not ( = ?auto_579562 ?auto_579566 ) ) ( not ( = ?auto_579562 ?auto_579567 ) ) ( not ( = ?auto_579562 ?auto_579568 ) ) ( not ( = ?auto_579562 ?auto_579569 ) ) ( not ( = ?auto_579562 ?auto_579570 ) ) ( not ( = ?auto_579562 ?auto_579571 ) ) ( not ( = ?auto_579562 ?auto_579572 ) ) ( not ( = ?auto_579563 ?auto_579564 ) ) ( not ( = ?auto_579563 ?auto_579565 ) ) ( not ( = ?auto_579563 ?auto_579566 ) ) ( not ( = ?auto_579563 ?auto_579567 ) ) ( not ( = ?auto_579563 ?auto_579568 ) ) ( not ( = ?auto_579563 ?auto_579569 ) ) ( not ( = ?auto_579563 ?auto_579570 ) ) ( not ( = ?auto_579563 ?auto_579571 ) ) ( not ( = ?auto_579563 ?auto_579572 ) ) ( not ( = ?auto_579564 ?auto_579565 ) ) ( not ( = ?auto_579564 ?auto_579566 ) ) ( not ( = ?auto_579564 ?auto_579567 ) ) ( not ( = ?auto_579564 ?auto_579568 ) ) ( not ( = ?auto_579564 ?auto_579569 ) ) ( not ( = ?auto_579564 ?auto_579570 ) ) ( not ( = ?auto_579564 ?auto_579571 ) ) ( not ( = ?auto_579564 ?auto_579572 ) ) ( not ( = ?auto_579565 ?auto_579566 ) ) ( not ( = ?auto_579565 ?auto_579567 ) ) ( not ( = ?auto_579565 ?auto_579568 ) ) ( not ( = ?auto_579565 ?auto_579569 ) ) ( not ( = ?auto_579565 ?auto_579570 ) ) ( not ( = ?auto_579565 ?auto_579571 ) ) ( not ( = ?auto_579565 ?auto_579572 ) ) ( not ( = ?auto_579566 ?auto_579567 ) ) ( not ( = ?auto_579566 ?auto_579568 ) ) ( not ( = ?auto_579566 ?auto_579569 ) ) ( not ( = ?auto_579566 ?auto_579570 ) ) ( not ( = ?auto_579566 ?auto_579571 ) ) ( not ( = ?auto_579566 ?auto_579572 ) ) ( not ( = ?auto_579567 ?auto_579568 ) ) ( not ( = ?auto_579567 ?auto_579569 ) ) ( not ( = ?auto_579567 ?auto_579570 ) ) ( not ( = ?auto_579567 ?auto_579571 ) ) ( not ( = ?auto_579567 ?auto_579572 ) ) ( not ( = ?auto_579568 ?auto_579569 ) ) ( not ( = ?auto_579568 ?auto_579570 ) ) ( not ( = ?auto_579568 ?auto_579571 ) ) ( not ( = ?auto_579568 ?auto_579572 ) ) ( not ( = ?auto_579569 ?auto_579570 ) ) ( not ( = ?auto_579569 ?auto_579571 ) ) ( not ( = ?auto_579569 ?auto_579572 ) ) ( not ( = ?auto_579570 ?auto_579571 ) ) ( not ( = ?auto_579570 ?auto_579572 ) ) ( not ( = ?auto_579571 ?auto_579572 ) ) ( CLEAR ?auto_579569 ) ( ON ?auto_579570 ?auto_579571 ) ( CLEAR ?auto_579570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_579561 ?auto_579562 ?auto_579563 ?auto_579564 ?auto_579565 ?auto_579566 ?auto_579567 ?auto_579568 ?auto_579569 ?auto_579570 )
      ( MAKE-11PILE ?auto_579561 ?auto_579562 ?auto_579563 ?auto_579564 ?auto_579565 ?auto_579566 ?auto_579567 ?auto_579568 ?auto_579569 ?auto_579570 ?auto_579571 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_579607 - BLOCK
      ?auto_579608 - BLOCK
      ?auto_579609 - BLOCK
      ?auto_579610 - BLOCK
      ?auto_579611 - BLOCK
      ?auto_579612 - BLOCK
      ?auto_579613 - BLOCK
      ?auto_579614 - BLOCK
      ?auto_579615 - BLOCK
      ?auto_579616 - BLOCK
      ?auto_579617 - BLOCK
    )
    :vars
    (
      ?auto_579618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579617 ?auto_579618 ) ( ON-TABLE ?auto_579607 ) ( ON ?auto_579608 ?auto_579607 ) ( ON ?auto_579609 ?auto_579608 ) ( ON ?auto_579610 ?auto_579609 ) ( ON ?auto_579611 ?auto_579610 ) ( ON ?auto_579612 ?auto_579611 ) ( ON ?auto_579613 ?auto_579612 ) ( ON ?auto_579614 ?auto_579613 ) ( not ( = ?auto_579607 ?auto_579608 ) ) ( not ( = ?auto_579607 ?auto_579609 ) ) ( not ( = ?auto_579607 ?auto_579610 ) ) ( not ( = ?auto_579607 ?auto_579611 ) ) ( not ( = ?auto_579607 ?auto_579612 ) ) ( not ( = ?auto_579607 ?auto_579613 ) ) ( not ( = ?auto_579607 ?auto_579614 ) ) ( not ( = ?auto_579607 ?auto_579615 ) ) ( not ( = ?auto_579607 ?auto_579616 ) ) ( not ( = ?auto_579607 ?auto_579617 ) ) ( not ( = ?auto_579607 ?auto_579618 ) ) ( not ( = ?auto_579608 ?auto_579609 ) ) ( not ( = ?auto_579608 ?auto_579610 ) ) ( not ( = ?auto_579608 ?auto_579611 ) ) ( not ( = ?auto_579608 ?auto_579612 ) ) ( not ( = ?auto_579608 ?auto_579613 ) ) ( not ( = ?auto_579608 ?auto_579614 ) ) ( not ( = ?auto_579608 ?auto_579615 ) ) ( not ( = ?auto_579608 ?auto_579616 ) ) ( not ( = ?auto_579608 ?auto_579617 ) ) ( not ( = ?auto_579608 ?auto_579618 ) ) ( not ( = ?auto_579609 ?auto_579610 ) ) ( not ( = ?auto_579609 ?auto_579611 ) ) ( not ( = ?auto_579609 ?auto_579612 ) ) ( not ( = ?auto_579609 ?auto_579613 ) ) ( not ( = ?auto_579609 ?auto_579614 ) ) ( not ( = ?auto_579609 ?auto_579615 ) ) ( not ( = ?auto_579609 ?auto_579616 ) ) ( not ( = ?auto_579609 ?auto_579617 ) ) ( not ( = ?auto_579609 ?auto_579618 ) ) ( not ( = ?auto_579610 ?auto_579611 ) ) ( not ( = ?auto_579610 ?auto_579612 ) ) ( not ( = ?auto_579610 ?auto_579613 ) ) ( not ( = ?auto_579610 ?auto_579614 ) ) ( not ( = ?auto_579610 ?auto_579615 ) ) ( not ( = ?auto_579610 ?auto_579616 ) ) ( not ( = ?auto_579610 ?auto_579617 ) ) ( not ( = ?auto_579610 ?auto_579618 ) ) ( not ( = ?auto_579611 ?auto_579612 ) ) ( not ( = ?auto_579611 ?auto_579613 ) ) ( not ( = ?auto_579611 ?auto_579614 ) ) ( not ( = ?auto_579611 ?auto_579615 ) ) ( not ( = ?auto_579611 ?auto_579616 ) ) ( not ( = ?auto_579611 ?auto_579617 ) ) ( not ( = ?auto_579611 ?auto_579618 ) ) ( not ( = ?auto_579612 ?auto_579613 ) ) ( not ( = ?auto_579612 ?auto_579614 ) ) ( not ( = ?auto_579612 ?auto_579615 ) ) ( not ( = ?auto_579612 ?auto_579616 ) ) ( not ( = ?auto_579612 ?auto_579617 ) ) ( not ( = ?auto_579612 ?auto_579618 ) ) ( not ( = ?auto_579613 ?auto_579614 ) ) ( not ( = ?auto_579613 ?auto_579615 ) ) ( not ( = ?auto_579613 ?auto_579616 ) ) ( not ( = ?auto_579613 ?auto_579617 ) ) ( not ( = ?auto_579613 ?auto_579618 ) ) ( not ( = ?auto_579614 ?auto_579615 ) ) ( not ( = ?auto_579614 ?auto_579616 ) ) ( not ( = ?auto_579614 ?auto_579617 ) ) ( not ( = ?auto_579614 ?auto_579618 ) ) ( not ( = ?auto_579615 ?auto_579616 ) ) ( not ( = ?auto_579615 ?auto_579617 ) ) ( not ( = ?auto_579615 ?auto_579618 ) ) ( not ( = ?auto_579616 ?auto_579617 ) ) ( not ( = ?auto_579616 ?auto_579618 ) ) ( not ( = ?auto_579617 ?auto_579618 ) ) ( ON ?auto_579616 ?auto_579617 ) ( CLEAR ?auto_579614 ) ( ON ?auto_579615 ?auto_579616 ) ( CLEAR ?auto_579615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_579607 ?auto_579608 ?auto_579609 ?auto_579610 ?auto_579611 ?auto_579612 ?auto_579613 ?auto_579614 ?auto_579615 )
      ( MAKE-11PILE ?auto_579607 ?auto_579608 ?auto_579609 ?auto_579610 ?auto_579611 ?auto_579612 ?auto_579613 ?auto_579614 ?auto_579615 ?auto_579616 ?auto_579617 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_579653 - BLOCK
      ?auto_579654 - BLOCK
      ?auto_579655 - BLOCK
      ?auto_579656 - BLOCK
      ?auto_579657 - BLOCK
      ?auto_579658 - BLOCK
      ?auto_579659 - BLOCK
      ?auto_579660 - BLOCK
      ?auto_579661 - BLOCK
      ?auto_579662 - BLOCK
      ?auto_579663 - BLOCK
    )
    :vars
    (
      ?auto_579664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579663 ?auto_579664 ) ( ON-TABLE ?auto_579653 ) ( ON ?auto_579654 ?auto_579653 ) ( ON ?auto_579655 ?auto_579654 ) ( ON ?auto_579656 ?auto_579655 ) ( ON ?auto_579657 ?auto_579656 ) ( ON ?auto_579658 ?auto_579657 ) ( ON ?auto_579659 ?auto_579658 ) ( not ( = ?auto_579653 ?auto_579654 ) ) ( not ( = ?auto_579653 ?auto_579655 ) ) ( not ( = ?auto_579653 ?auto_579656 ) ) ( not ( = ?auto_579653 ?auto_579657 ) ) ( not ( = ?auto_579653 ?auto_579658 ) ) ( not ( = ?auto_579653 ?auto_579659 ) ) ( not ( = ?auto_579653 ?auto_579660 ) ) ( not ( = ?auto_579653 ?auto_579661 ) ) ( not ( = ?auto_579653 ?auto_579662 ) ) ( not ( = ?auto_579653 ?auto_579663 ) ) ( not ( = ?auto_579653 ?auto_579664 ) ) ( not ( = ?auto_579654 ?auto_579655 ) ) ( not ( = ?auto_579654 ?auto_579656 ) ) ( not ( = ?auto_579654 ?auto_579657 ) ) ( not ( = ?auto_579654 ?auto_579658 ) ) ( not ( = ?auto_579654 ?auto_579659 ) ) ( not ( = ?auto_579654 ?auto_579660 ) ) ( not ( = ?auto_579654 ?auto_579661 ) ) ( not ( = ?auto_579654 ?auto_579662 ) ) ( not ( = ?auto_579654 ?auto_579663 ) ) ( not ( = ?auto_579654 ?auto_579664 ) ) ( not ( = ?auto_579655 ?auto_579656 ) ) ( not ( = ?auto_579655 ?auto_579657 ) ) ( not ( = ?auto_579655 ?auto_579658 ) ) ( not ( = ?auto_579655 ?auto_579659 ) ) ( not ( = ?auto_579655 ?auto_579660 ) ) ( not ( = ?auto_579655 ?auto_579661 ) ) ( not ( = ?auto_579655 ?auto_579662 ) ) ( not ( = ?auto_579655 ?auto_579663 ) ) ( not ( = ?auto_579655 ?auto_579664 ) ) ( not ( = ?auto_579656 ?auto_579657 ) ) ( not ( = ?auto_579656 ?auto_579658 ) ) ( not ( = ?auto_579656 ?auto_579659 ) ) ( not ( = ?auto_579656 ?auto_579660 ) ) ( not ( = ?auto_579656 ?auto_579661 ) ) ( not ( = ?auto_579656 ?auto_579662 ) ) ( not ( = ?auto_579656 ?auto_579663 ) ) ( not ( = ?auto_579656 ?auto_579664 ) ) ( not ( = ?auto_579657 ?auto_579658 ) ) ( not ( = ?auto_579657 ?auto_579659 ) ) ( not ( = ?auto_579657 ?auto_579660 ) ) ( not ( = ?auto_579657 ?auto_579661 ) ) ( not ( = ?auto_579657 ?auto_579662 ) ) ( not ( = ?auto_579657 ?auto_579663 ) ) ( not ( = ?auto_579657 ?auto_579664 ) ) ( not ( = ?auto_579658 ?auto_579659 ) ) ( not ( = ?auto_579658 ?auto_579660 ) ) ( not ( = ?auto_579658 ?auto_579661 ) ) ( not ( = ?auto_579658 ?auto_579662 ) ) ( not ( = ?auto_579658 ?auto_579663 ) ) ( not ( = ?auto_579658 ?auto_579664 ) ) ( not ( = ?auto_579659 ?auto_579660 ) ) ( not ( = ?auto_579659 ?auto_579661 ) ) ( not ( = ?auto_579659 ?auto_579662 ) ) ( not ( = ?auto_579659 ?auto_579663 ) ) ( not ( = ?auto_579659 ?auto_579664 ) ) ( not ( = ?auto_579660 ?auto_579661 ) ) ( not ( = ?auto_579660 ?auto_579662 ) ) ( not ( = ?auto_579660 ?auto_579663 ) ) ( not ( = ?auto_579660 ?auto_579664 ) ) ( not ( = ?auto_579661 ?auto_579662 ) ) ( not ( = ?auto_579661 ?auto_579663 ) ) ( not ( = ?auto_579661 ?auto_579664 ) ) ( not ( = ?auto_579662 ?auto_579663 ) ) ( not ( = ?auto_579662 ?auto_579664 ) ) ( not ( = ?auto_579663 ?auto_579664 ) ) ( ON ?auto_579662 ?auto_579663 ) ( ON ?auto_579661 ?auto_579662 ) ( CLEAR ?auto_579659 ) ( ON ?auto_579660 ?auto_579661 ) ( CLEAR ?auto_579660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_579653 ?auto_579654 ?auto_579655 ?auto_579656 ?auto_579657 ?auto_579658 ?auto_579659 ?auto_579660 )
      ( MAKE-11PILE ?auto_579653 ?auto_579654 ?auto_579655 ?auto_579656 ?auto_579657 ?auto_579658 ?auto_579659 ?auto_579660 ?auto_579661 ?auto_579662 ?auto_579663 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_579699 - BLOCK
      ?auto_579700 - BLOCK
      ?auto_579701 - BLOCK
      ?auto_579702 - BLOCK
      ?auto_579703 - BLOCK
      ?auto_579704 - BLOCK
      ?auto_579705 - BLOCK
      ?auto_579706 - BLOCK
      ?auto_579707 - BLOCK
      ?auto_579708 - BLOCK
      ?auto_579709 - BLOCK
    )
    :vars
    (
      ?auto_579710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579709 ?auto_579710 ) ( ON-TABLE ?auto_579699 ) ( ON ?auto_579700 ?auto_579699 ) ( ON ?auto_579701 ?auto_579700 ) ( ON ?auto_579702 ?auto_579701 ) ( ON ?auto_579703 ?auto_579702 ) ( ON ?auto_579704 ?auto_579703 ) ( not ( = ?auto_579699 ?auto_579700 ) ) ( not ( = ?auto_579699 ?auto_579701 ) ) ( not ( = ?auto_579699 ?auto_579702 ) ) ( not ( = ?auto_579699 ?auto_579703 ) ) ( not ( = ?auto_579699 ?auto_579704 ) ) ( not ( = ?auto_579699 ?auto_579705 ) ) ( not ( = ?auto_579699 ?auto_579706 ) ) ( not ( = ?auto_579699 ?auto_579707 ) ) ( not ( = ?auto_579699 ?auto_579708 ) ) ( not ( = ?auto_579699 ?auto_579709 ) ) ( not ( = ?auto_579699 ?auto_579710 ) ) ( not ( = ?auto_579700 ?auto_579701 ) ) ( not ( = ?auto_579700 ?auto_579702 ) ) ( not ( = ?auto_579700 ?auto_579703 ) ) ( not ( = ?auto_579700 ?auto_579704 ) ) ( not ( = ?auto_579700 ?auto_579705 ) ) ( not ( = ?auto_579700 ?auto_579706 ) ) ( not ( = ?auto_579700 ?auto_579707 ) ) ( not ( = ?auto_579700 ?auto_579708 ) ) ( not ( = ?auto_579700 ?auto_579709 ) ) ( not ( = ?auto_579700 ?auto_579710 ) ) ( not ( = ?auto_579701 ?auto_579702 ) ) ( not ( = ?auto_579701 ?auto_579703 ) ) ( not ( = ?auto_579701 ?auto_579704 ) ) ( not ( = ?auto_579701 ?auto_579705 ) ) ( not ( = ?auto_579701 ?auto_579706 ) ) ( not ( = ?auto_579701 ?auto_579707 ) ) ( not ( = ?auto_579701 ?auto_579708 ) ) ( not ( = ?auto_579701 ?auto_579709 ) ) ( not ( = ?auto_579701 ?auto_579710 ) ) ( not ( = ?auto_579702 ?auto_579703 ) ) ( not ( = ?auto_579702 ?auto_579704 ) ) ( not ( = ?auto_579702 ?auto_579705 ) ) ( not ( = ?auto_579702 ?auto_579706 ) ) ( not ( = ?auto_579702 ?auto_579707 ) ) ( not ( = ?auto_579702 ?auto_579708 ) ) ( not ( = ?auto_579702 ?auto_579709 ) ) ( not ( = ?auto_579702 ?auto_579710 ) ) ( not ( = ?auto_579703 ?auto_579704 ) ) ( not ( = ?auto_579703 ?auto_579705 ) ) ( not ( = ?auto_579703 ?auto_579706 ) ) ( not ( = ?auto_579703 ?auto_579707 ) ) ( not ( = ?auto_579703 ?auto_579708 ) ) ( not ( = ?auto_579703 ?auto_579709 ) ) ( not ( = ?auto_579703 ?auto_579710 ) ) ( not ( = ?auto_579704 ?auto_579705 ) ) ( not ( = ?auto_579704 ?auto_579706 ) ) ( not ( = ?auto_579704 ?auto_579707 ) ) ( not ( = ?auto_579704 ?auto_579708 ) ) ( not ( = ?auto_579704 ?auto_579709 ) ) ( not ( = ?auto_579704 ?auto_579710 ) ) ( not ( = ?auto_579705 ?auto_579706 ) ) ( not ( = ?auto_579705 ?auto_579707 ) ) ( not ( = ?auto_579705 ?auto_579708 ) ) ( not ( = ?auto_579705 ?auto_579709 ) ) ( not ( = ?auto_579705 ?auto_579710 ) ) ( not ( = ?auto_579706 ?auto_579707 ) ) ( not ( = ?auto_579706 ?auto_579708 ) ) ( not ( = ?auto_579706 ?auto_579709 ) ) ( not ( = ?auto_579706 ?auto_579710 ) ) ( not ( = ?auto_579707 ?auto_579708 ) ) ( not ( = ?auto_579707 ?auto_579709 ) ) ( not ( = ?auto_579707 ?auto_579710 ) ) ( not ( = ?auto_579708 ?auto_579709 ) ) ( not ( = ?auto_579708 ?auto_579710 ) ) ( not ( = ?auto_579709 ?auto_579710 ) ) ( ON ?auto_579708 ?auto_579709 ) ( ON ?auto_579707 ?auto_579708 ) ( ON ?auto_579706 ?auto_579707 ) ( CLEAR ?auto_579704 ) ( ON ?auto_579705 ?auto_579706 ) ( CLEAR ?auto_579705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_579699 ?auto_579700 ?auto_579701 ?auto_579702 ?auto_579703 ?auto_579704 ?auto_579705 )
      ( MAKE-11PILE ?auto_579699 ?auto_579700 ?auto_579701 ?auto_579702 ?auto_579703 ?auto_579704 ?auto_579705 ?auto_579706 ?auto_579707 ?auto_579708 ?auto_579709 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_579745 - BLOCK
      ?auto_579746 - BLOCK
      ?auto_579747 - BLOCK
      ?auto_579748 - BLOCK
      ?auto_579749 - BLOCK
      ?auto_579750 - BLOCK
      ?auto_579751 - BLOCK
      ?auto_579752 - BLOCK
      ?auto_579753 - BLOCK
      ?auto_579754 - BLOCK
      ?auto_579755 - BLOCK
    )
    :vars
    (
      ?auto_579756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579755 ?auto_579756 ) ( ON-TABLE ?auto_579745 ) ( ON ?auto_579746 ?auto_579745 ) ( ON ?auto_579747 ?auto_579746 ) ( ON ?auto_579748 ?auto_579747 ) ( ON ?auto_579749 ?auto_579748 ) ( not ( = ?auto_579745 ?auto_579746 ) ) ( not ( = ?auto_579745 ?auto_579747 ) ) ( not ( = ?auto_579745 ?auto_579748 ) ) ( not ( = ?auto_579745 ?auto_579749 ) ) ( not ( = ?auto_579745 ?auto_579750 ) ) ( not ( = ?auto_579745 ?auto_579751 ) ) ( not ( = ?auto_579745 ?auto_579752 ) ) ( not ( = ?auto_579745 ?auto_579753 ) ) ( not ( = ?auto_579745 ?auto_579754 ) ) ( not ( = ?auto_579745 ?auto_579755 ) ) ( not ( = ?auto_579745 ?auto_579756 ) ) ( not ( = ?auto_579746 ?auto_579747 ) ) ( not ( = ?auto_579746 ?auto_579748 ) ) ( not ( = ?auto_579746 ?auto_579749 ) ) ( not ( = ?auto_579746 ?auto_579750 ) ) ( not ( = ?auto_579746 ?auto_579751 ) ) ( not ( = ?auto_579746 ?auto_579752 ) ) ( not ( = ?auto_579746 ?auto_579753 ) ) ( not ( = ?auto_579746 ?auto_579754 ) ) ( not ( = ?auto_579746 ?auto_579755 ) ) ( not ( = ?auto_579746 ?auto_579756 ) ) ( not ( = ?auto_579747 ?auto_579748 ) ) ( not ( = ?auto_579747 ?auto_579749 ) ) ( not ( = ?auto_579747 ?auto_579750 ) ) ( not ( = ?auto_579747 ?auto_579751 ) ) ( not ( = ?auto_579747 ?auto_579752 ) ) ( not ( = ?auto_579747 ?auto_579753 ) ) ( not ( = ?auto_579747 ?auto_579754 ) ) ( not ( = ?auto_579747 ?auto_579755 ) ) ( not ( = ?auto_579747 ?auto_579756 ) ) ( not ( = ?auto_579748 ?auto_579749 ) ) ( not ( = ?auto_579748 ?auto_579750 ) ) ( not ( = ?auto_579748 ?auto_579751 ) ) ( not ( = ?auto_579748 ?auto_579752 ) ) ( not ( = ?auto_579748 ?auto_579753 ) ) ( not ( = ?auto_579748 ?auto_579754 ) ) ( not ( = ?auto_579748 ?auto_579755 ) ) ( not ( = ?auto_579748 ?auto_579756 ) ) ( not ( = ?auto_579749 ?auto_579750 ) ) ( not ( = ?auto_579749 ?auto_579751 ) ) ( not ( = ?auto_579749 ?auto_579752 ) ) ( not ( = ?auto_579749 ?auto_579753 ) ) ( not ( = ?auto_579749 ?auto_579754 ) ) ( not ( = ?auto_579749 ?auto_579755 ) ) ( not ( = ?auto_579749 ?auto_579756 ) ) ( not ( = ?auto_579750 ?auto_579751 ) ) ( not ( = ?auto_579750 ?auto_579752 ) ) ( not ( = ?auto_579750 ?auto_579753 ) ) ( not ( = ?auto_579750 ?auto_579754 ) ) ( not ( = ?auto_579750 ?auto_579755 ) ) ( not ( = ?auto_579750 ?auto_579756 ) ) ( not ( = ?auto_579751 ?auto_579752 ) ) ( not ( = ?auto_579751 ?auto_579753 ) ) ( not ( = ?auto_579751 ?auto_579754 ) ) ( not ( = ?auto_579751 ?auto_579755 ) ) ( not ( = ?auto_579751 ?auto_579756 ) ) ( not ( = ?auto_579752 ?auto_579753 ) ) ( not ( = ?auto_579752 ?auto_579754 ) ) ( not ( = ?auto_579752 ?auto_579755 ) ) ( not ( = ?auto_579752 ?auto_579756 ) ) ( not ( = ?auto_579753 ?auto_579754 ) ) ( not ( = ?auto_579753 ?auto_579755 ) ) ( not ( = ?auto_579753 ?auto_579756 ) ) ( not ( = ?auto_579754 ?auto_579755 ) ) ( not ( = ?auto_579754 ?auto_579756 ) ) ( not ( = ?auto_579755 ?auto_579756 ) ) ( ON ?auto_579754 ?auto_579755 ) ( ON ?auto_579753 ?auto_579754 ) ( ON ?auto_579752 ?auto_579753 ) ( ON ?auto_579751 ?auto_579752 ) ( CLEAR ?auto_579749 ) ( ON ?auto_579750 ?auto_579751 ) ( CLEAR ?auto_579750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_579745 ?auto_579746 ?auto_579747 ?auto_579748 ?auto_579749 ?auto_579750 )
      ( MAKE-11PILE ?auto_579745 ?auto_579746 ?auto_579747 ?auto_579748 ?auto_579749 ?auto_579750 ?auto_579751 ?auto_579752 ?auto_579753 ?auto_579754 ?auto_579755 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_579791 - BLOCK
      ?auto_579792 - BLOCK
      ?auto_579793 - BLOCK
      ?auto_579794 - BLOCK
      ?auto_579795 - BLOCK
      ?auto_579796 - BLOCK
      ?auto_579797 - BLOCK
      ?auto_579798 - BLOCK
      ?auto_579799 - BLOCK
      ?auto_579800 - BLOCK
      ?auto_579801 - BLOCK
    )
    :vars
    (
      ?auto_579802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579801 ?auto_579802 ) ( ON-TABLE ?auto_579791 ) ( ON ?auto_579792 ?auto_579791 ) ( ON ?auto_579793 ?auto_579792 ) ( ON ?auto_579794 ?auto_579793 ) ( not ( = ?auto_579791 ?auto_579792 ) ) ( not ( = ?auto_579791 ?auto_579793 ) ) ( not ( = ?auto_579791 ?auto_579794 ) ) ( not ( = ?auto_579791 ?auto_579795 ) ) ( not ( = ?auto_579791 ?auto_579796 ) ) ( not ( = ?auto_579791 ?auto_579797 ) ) ( not ( = ?auto_579791 ?auto_579798 ) ) ( not ( = ?auto_579791 ?auto_579799 ) ) ( not ( = ?auto_579791 ?auto_579800 ) ) ( not ( = ?auto_579791 ?auto_579801 ) ) ( not ( = ?auto_579791 ?auto_579802 ) ) ( not ( = ?auto_579792 ?auto_579793 ) ) ( not ( = ?auto_579792 ?auto_579794 ) ) ( not ( = ?auto_579792 ?auto_579795 ) ) ( not ( = ?auto_579792 ?auto_579796 ) ) ( not ( = ?auto_579792 ?auto_579797 ) ) ( not ( = ?auto_579792 ?auto_579798 ) ) ( not ( = ?auto_579792 ?auto_579799 ) ) ( not ( = ?auto_579792 ?auto_579800 ) ) ( not ( = ?auto_579792 ?auto_579801 ) ) ( not ( = ?auto_579792 ?auto_579802 ) ) ( not ( = ?auto_579793 ?auto_579794 ) ) ( not ( = ?auto_579793 ?auto_579795 ) ) ( not ( = ?auto_579793 ?auto_579796 ) ) ( not ( = ?auto_579793 ?auto_579797 ) ) ( not ( = ?auto_579793 ?auto_579798 ) ) ( not ( = ?auto_579793 ?auto_579799 ) ) ( not ( = ?auto_579793 ?auto_579800 ) ) ( not ( = ?auto_579793 ?auto_579801 ) ) ( not ( = ?auto_579793 ?auto_579802 ) ) ( not ( = ?auto_579794 ?auto_579795 ) ) ( not ( = ?auto_579794 ?auto_579796 ) ) ( not ( = ?auto_579794 ?auto_579797 ) ) ( not ( = ?auto_579794 ?auto_579798 ) ) ( not ( = ?auto_579794 ?auto_579799 ) ) ( not ( = ?auto_579794 ?auto_579800 ) ) ( not ( = ?auto_579794 ?auto_579801 ) ) ( not ( = ?auto_579794 ?auto_579802 ) ) ( not ( = ?auto_579795 ?auto_579796 ) ) ( not ( = ?auto_579795 ?auto_579797 ) ) ( not ( = ?auto_579795 ?auto_579798 ) ) ( not ( = ?auto_579795 ?auto_579799 ) ) ( not ( = ?auto_579795 ?auto_579800 ) ) ( not ( = ?auto_579795 ?auto_579801 ) ) ( not ( = ?auto_579795 ?auto_579802 ) ) ( not ( = ?auto_579796 ?auto_579797 ) ) ( not ( = ?auto_579796 ?auto_579798 ) ) ( not ( = ?auto_579796 ?auto_579799 ) ) ( not ( = ?auto_579796 ?auto_579800 ) ) ( not ( = ?auto_579796 ?auto_579801 ) ) ( not ( = ?auto_579796 ?auto_579802 ) ) ( not ( = ?auto_579797 ?auto_579798 ) ) ( not ( = ?auto_579797 ?auto_579799 ) ) ( not ( = ?auto_579797 ?auto_579800 ) ) ( not ( = ?auto_579797 ?auto_579801 ) ) ( not ( = ?auto_579797 ?auto_579802 ) ) ( not ( = ?auto_579798 ?auto_579799 ) ) ( not ( = ?auto_579798 ?auto_579800 ) ) ( not ( = ?auto_579798 ?auto_579801 ) ) ( not ( = ?auto_579798 ?auto_579802 ) ) ( not ( = ?auto_579799 ?auto_579800 ) ) ( not ( = ?auto_579799 ?auto_579801 ) ) ( not ( = ?auto_579799 ?auto_579802 ) ) ( not ( = ?auto_579800 ?auto_579801 ) ) ( not ( = ?auto_579800 ?auto_579802 ) ) ( not ( = ?auto_579801 ?auto_579802 ) ) ( ON ?auto_579800 ?auto_579801 ) ( ON ?auto_579799 ?auto_579800 ) ( ON ?auto_579798 ?auto_579799 ) ( ON ?auto_579797 ?auto_579798 ) ( ON ?auto_579796 ?auto_579797 ) ( CLEAR ?auto_579794 ) ( ON ?auto_579795 ?auto_579796 ) ( CLEAR ?auto_579795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_579791 ?auto_579792 ?auto_579793 ?auto_579794 ?auto_579795 )
      ( MAKE-11PILE ?auto_579791 ?auto_579792 ?auto_579793 ?auto_579794 ?auto_579795 ?auto_579796 ?auto_579797 ?auto_579798 ?auto_579799 ?auto_579800 ?auto_579801 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_579837 - BLOCK
      ?auto_579838 - BLOCK
      ?auto_579839 - BLOCK
      ?auto_579840 - BLOCK
      ?auto_579841 - BLOCK
      ?auto_579842 - BLOCK
      ?auto_579843 - BLOCK
      ?auto_579844 - BLOCK
      ?auto_579845 - BLOCK
      ?auto_579846 - BLOCK
      ?auto_579847 - BLOCK
    )
    :vars
    (
      ?auto_579848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579847 ?auto_579848 ) ( ON-TABLE ?auto_579837 ) ( ON ?auto_579838 ?auto_579837 ) ( ON ?auto_579839 ?auto_579838 ) ( not ( = ?auto_579837 ?auto_579838 ) ) ( not ( = ?auto_579837 ?auto_579839 ) ) ( not ( = ?auto_579837 ?auto_579840 ) ) ( not ( = ?auto_579837 ?auto_579841 ) ) ( not ( = ?auto_579837 ?auto_579842 ) ) ( not ( = ?auto_579837 ?auto_579843 ) ) ( not ( = ?auto_579837 ?auto_579844 ) ) ( not ( = ?auto_579837 ?auto_579845 ) ) ( not ( = ?auto_579837 ?auto_579846 ) ) ( not ( = ?auto_579837 ?auto_579847 ) ) ( not ( = ?auto_579837 ?auto_579848 ) ) ( not ( = ?auto_579838 ?auto_579839 ) ) ( not ( = ?auto_579838 ?auto_579840 ) ) ( not ( = ?auto_579838 ?auto_579841 ) ) ( not ( = ?auto_579838 ?auto_579842 ) ) ( not ( = ?auto_579838 ?auto_579843 ) ) ( not ( = ?auto_579838 ?auto_579844 ) ) ( not ( = ?auto_579838 ?auto_579845 ) ) ( not ( = ?auto_579838 ?auto_579846 ) ) ( not ( = ?auto_579838 ?auto_579847 ) ) ( not ( = ?auto_579838 ?auto_579848 ) ) ( not ( = ?auto_579839 ?auto_579840 ) ) ( not ( = ?auto_579839 ?auto_579841 ) ) ( not ( = ?auto_579839 ?auto_579842 ) ) ( not ( = ?auto_579839 ?auto_579843 ) ) ( not ( = ?auto_579839 ?auto_579844 ) ) ( not ( = ?auto_579839 ?auto_579845 ) ) ( not ( = ?auto_579839 ?auto_579846 ) ) ( not ( = ?auto_579839 ?auto_579847 ) ) ( not ( = ?auto_579839 ?auto_579848 ) ) ( not ( = ?auto_579840 ?auto_579841 ) ) ( not ( = ?auto_579840 ?auto_579842 ) ) ( not ( = ?auto_579840 ?auto_579843 ) ) ( not ( = ?auto_579840 ?auto_579844 ) ) ( not ( = ?auto_579840 ?auto_579845 ) ) ( not ( = ?auto_579840 ?auto_579846 ) ) ( not ( = ?auto_579840 ?auto_579847 ) ) ( not ( = ?auto_579840 ?auto_579848 ) ) ( not ( = ?auto_579841 ?auto_579842 ) ) ( not ( = ?auto_579841 ?auto_579843 ) ) ( not ( = ?auto_579841 ?auto_579844 ) ) ( not ( = ?auto_579841 ?auto_579845 ) ) ( not ( = ?auto_579841 ?auto_579846 ) ) ( not ( = ?auto_579841 ?auto_579847 ) ) ( not ( = ?auto_579841 ?auto_579848 ) ) ( not ( = ?auto_579842 ?auto_579843 ) ) ( not ( = ?auto_579842 ?auto_579844 ) ) ( not ( = ?auto_579842 ?auto_579845 ) ) ( not ( = ?auto_579842 ?auto_579846 ) ) ( not ( = ?auto_579842 ?auto_579847 ) ) ( not ( = ?auto_579842 ?auto_579848 ) ) ( not ( = ?auto_579843 ?auto_579844 ) ) ( not ( = ?auto_579843 ?auto_579845 ) ) ( not ( = ?auto_579843 ?auto_579846 ) ) ( not ( = ?auto_579843 ?auto_579847 ) ) ( not ( = ?auto_579843 ?auto_579848 ) ) ( not ( = ?auto_579844 ?auto_579845 ) ) ( not ( = ?auto_579844 ?auto_579846 ) ) ( not ( = ?auto_579844 ?auto_579847 ) ) ( not ( = ?auto_579844 ?auto_579848 ) ) ( not ( = ?auto_579845 ?auto_579846 ) ) ( not ( = ?auto_579845 ?auto_579847 ) ) ( not ( = ?auto_579845 ?auto_579848 ) ) ( not ( = ?auto_579846 ?auto_579847 ) ) ( not ( = ?auto_579846 ?auto_579848 ) ) ( not ( = ?auto_579847 ?auto_579848 ) ) ( ON ?auto_579846 ?auto_579847 ) ( ON ?auto_579845 ?auto_579846 ) ( ON ?auto_579844 ?auto_579845 ) ( ON ?auto_579843 ?auto_579844 ) ( ON ?auto_579842 ?auto_579843 ) ( ON ?auto_579841 ?auto_579842 ) ( CLEAR ?auto_579839 ) ( ON ?auto_579840 ?auto_579841 ) ( CLEAR ?auto_579840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_579837 ?auto_579838 ?auto_579839 ?auto_579840 )
      ( MAKE-11PILE ?auto_579837 ?auto_579838 ?auto_579839 ?auto_579840 ?auto_579841 ?auto_579842 ?auto_579843 ?auto_579844 ?auto_579845 ?auto_579846 ?auto_579847 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_579883 - BLOCK
      ?auto_579884 - BLOCK
      ?auto_579885 - BLOCK
      ?auto_579886 - BLOCK
      ?auto_579887 - BLOCK
      ?auto_579888 - BLOCK
      ?auto_579889 - BLOCK
      ?auto_579890 - BLOCK
      ?auto_579891 - BLOCK
      ?auto_579892 - BLOCK
      ?auto_579893 - BLOCK
    )
    :vars
    (
      ?auto_579894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579893 ?auto_579894 ) ( ON-TABLE ?auto_579883 ) ( ON ?auto_579884 ?auto_579883 ) ( not ( = ?auto_579883 ?auto_579884 ) ) ( not ( = ?auto_579883 ?auto_579885 ) ) ( not ( = ?auto_579883 ?auto_579886 ) ) ( not ( = ?auto_579883 ?auto_579887 ) ) ( not ( = ?auto_579883 ?auto_579888 ) ) ( not ( = ?auto_579883 ?auto_579889 ) ) ( not ( = ?auto_579883 ?auto_579890 ) ) ( not ( = ?auto_579883 ?auto_579891 ) ) ( not ( = ?auto_579883 ?auto_579892 ) ) ( not ( = ?auto_579883 ?auto_579893 ) ) ( not ( = ?auto_579883 ?auto_579894 ) ) ( not ( = ?auto_579884 ?auto_579885 ) ) ( not ( = ?auto_579884 ?auto_579886 ) ) ( not ( = ?auto_579884 ?auto_579887 ) ) ( not ( = ?auto_579884 ?auto_579888 ) ) ( not ( = ?auto_579884 ?auto_579889 ) ) ( not ( = ?auto_579884 ?auto_579890 ) ) ( not ( = ?auto_579884 ?auto_579891 ) ) ( not ( = ?auto_579884 ?auto_579892 ) ) ( not ( = ?auto_579884 ?auto_579893 ) ) ( not ( = ?auto_579884 ?auto_579894 ) ) ( not ( = ?auto_579885 ?auto_579886 ) ) ( not ( = ?auto_579885 ?auto_579887 ) ) ( not ( = ?auto_579885 ?auto_579888 ) ) ( not ( = ?auto_579885 ?auto_579889 ) ) ( not ( = ?auto_579885 ?auto_579890 ) ) ( not ( = ?auto_579885 ?auto_579891 ) ) ( not ( = ?auto_579885 ?auto_579892 ) ) ( not ( = ?auto_579885 ?auto_579893 ) ) ( not ( = ?auto_579885 ?auto_579894 ) ) ( not ( = ?auto_579886 ?auto_579887 ) ) ( not ( = ?auto_579886 ?auto_579888 ) ) ( not ( = ?auto_579886 ?auto_579889 ) ) ( not ( = ?auto_579886 ?auto_579890 ) ) ( not ( = ?auto_579886 ?auto_579891 ) ) ( not ( = ?auto_579886 ?auto_579892 ) ) ( not ( = ?auto_579886 ?auto_579893 ) ) ( not ( = ?auto_579886 ?auto_579894 ) ) ( not ( = ?auto_579887 ?auto_579888 ) ) ( not ( = ?auto_579887 ?auto_579889 ) ) ( not ( = ?auto_579887 ?auto_579890 ) ) ( not ( = ?auto_579887 ?auto_579891 ) ) ( not ( = ?auto_579887 ?auto_579892 ) ) ( not ( = ?auto_579887 ?auto_579893 ) ) ( not ( = ?auto_579887 ?auto_579894 ) ) ( not ( = ?auto_579888 ?auto_579889 ) ) ( not ( = ?auto_579888 ?auto_579890 ) ) ( not ( = ?auto_579888 ?auto_579891 ) ) ( not ( = ?auto_579888 ?auto_579892 ) ) ( not ( = ?auto_579888 ?auto_579893 ) ) ( not ( = ?auto_579888 ?auto_579894 ) ) ( not ( = ?auto_579889 ?auto_579890 ) ) ( not ( = ?auto_579889 ?auto_579891 ) ) ( not ( = ?auto_579889 ?auto_579892 ) ) ( not ( = ?auto_579889 ?auto_579893 ) ) ( not ( = ?auto_579889 ?auto_579894 ) ) ( not ( = ?auto_579890 ?auto_579891 ) ) ( not ( = ?auto_579890 ?auto_579892 ) ) ( not ( = ?auto_579890 ?auto_579893 ) ) ( not ( = ?auto_579890 ?auto_579894 ) ) ( not ( = ?auto_579891 ?auto_579892 ) ) ( not ( = ?auto_579891 ?auto_579893 ) ) ( not ( = ?auto_579891 ?auto_579894 ) ) ( not ( = ?auto_579892 ?auto_579893 ) ) ( not ( = ?auto_579892 ?auto_579894 ) ) ( not ( = ?auto_579893 ?auto_579894 ) ) ( ON ?auto_579892 ?auto_579893 ) ( ON ?auto_579891 ?auto_579892 ) ( ON ?auto_579890 ?auto_579891 ) ( ON ?auto_579889 ?auto_579890 ) ( ON ?auto_579888 ?auto_579889 ) ( ON ?auto_579887 ?auto_579888 ) ( ON ?auto_579886 ?auto_579887 ) ( CLEAR ?auto_579884 ) ( ON ?auto_579885 ?auto_579886 ) ( CLEAR ?auto_579885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_579883 ?auto_579884 ?auto_579885 )
      ( MAKE-11PILE ?auto_579883 ?auto_579884 ?auto_579885 ?auto_579886 ?auto_579887 ?auto_579888 ?auto_579889 ?auto_579890 ?auto_579891 ?auto_579892 ?auto_579893 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_579929 - BLOCK
      ?auto_579930 - BLOCK
      ?auto_579931 - BLOCK
      ?auto_579932 - BLOCK
      ?auto_579933 - BLOCK
      ?auto_579934 - BLOCK
      ?auto_579935 - BLOCK
      ?auto_579936 - BLOCK
      ?auto_579937 - BLOCK
      ?auto_579938 - BLOCK
      ?auto_579939 - BLOCK
    )
    :vars
    (
      ?auto_579940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579939 ?auto_579940 ) ( ON-TABLE ?auto_579929 ) ( not ( = ?auto_579929 ?auto_579930 ) ) ( not ( = ?auto_579929 ?auto_579931 ) ) ( not ( = ?auto_579929 ?auto_579932 ) ) ( not ( = ?auto_579929 ?auto_579933 ) ) ( not ( = ?auto_579929 ?auto_579934 ) ) ( not ( = ?auto_579929 ?auto_579935 ) ) ( not ( = ?auto_579929 ?auto_579936 ) ) ( not ( = ?auto_579929 ?auto_579937 ) ) ( not ( = ?auto_579929 ?auto_579938 ) ) ( not ( = ?auto_579929 ?auto_579939 ) ) ( not ( = ?auto_579929 ?auto_579940 ) ) ( not ( = ?auto_579930 ?auto_579931 ) ) ( not ( = ?auto_579930 ?auto_579932 ) ) ( not ( = ?auto_579930 ?auto_579933 ) ) ( not ( = ?auto_579930 ?auto_579934 ) ) ( not ( = ?auto_579930 ?auto_579935 ) ) ( not ( = ?auto_579930 ?auto_579936 ) ) ( not ( = ?auto_579930 ?auto_579937 ) ) ( not ( = ?auto_579930 ?auto_579938 ) ) ( not ( = ?auto_579930 ?auto_579939 ) ) ( not ( = ?auto_579930 ?auto_579940 ) ) ( not ( = ?auto_579931 ?auto_579932 ) ) ( not ( = ?auto_579931 ?auto_579933 ) ) ( not ( = ?auto_579931 ?auto_579934 ) ) ( not ( = ?auto_579931 ?auto_579935 ) ) ( not ( = ?auto_579931 ?auto_579936 ) ) ( not ( = ?auto_579931 ?auto_579937 ) ) ( not ( = ?auto_579931 ?auto_579938 ) ) ( not ( = ?auto_579931 ?auto_579939 ) ) ( not ( = ?auto_579931 ?auto_579940 ) ) ( not ( = ?auto_579932 ?auto_579933 ) ) ( not ( = ?auto_579932 ?auto_579934 ) ) ( not ( = ?auto_579932 ?auto_579935 ) ) ( not ( = ?auto_579932 ?auto_579936 ) ) ( not ( = ?auto_579932 ?auto_579937 ) ) ( not ( = ?auto_579932 ?auto_579938 ) ) ( not ( = ?auto_579932 ?auto_579939 ) ) ( not ( = ?auto_579932 ?auto_579940 ) ) ( not ( = ?auto_579933 ?auto_579934 ) ) ( not ( = ?auto_579933 ?auto_579935 ) ) ( not ( = ?auto_579933 ?auto_579936 ) ) ( not ( = ?auto_579933 ?auto_579937 ) ) ( not ( = ?auto_579933 ?auto_579938 ) ) ( not ( = ?auto_579933 ?auto_579939 ) ) ( not ( = ?auto_579933 ?auto_579940 ) ) ( not ( = ?auto_579934 ?auto_579935 ) ) ( not ( = ?auto_579934 ?auto_579936 ) ) ( not ( = ?auto_579934 ?auto_579937 ) ) ( not ( = ?auto_579934 ?auto_579938 ) ) ( not ( = ?auto_579934 ?auto_579939 ) ) ( not ( = ?auto_579934 ?auto_579940 ) ) ( not ( = ?auto_579935 ?auto_579936 ) ) ( not ( = ?auto_579935 ?auto_579937 ) ) ( not ( = ?auto_579935 ?auto_579938 ) ) ( not ( = ?auto_579935 ?auto_579939 ) ) ( not ( = ?auto_579935 ?auto_579940 ) ) ( not ( = ?auto_579936 ?auto_579937 ) ) ( not ( = ?auto_579936 ?auto_579938 ) ) ( not ( = ?auto_579936 ?auto_579939 ) ) ( not ( = ?auto_579936 ?auto_579940 ) ) ( not ( = ?auto_579937 ?auto_579938 ) ) ( not ( = ?auto_579937 ?auto_579939 ) ) ( not ( = ?auto_579937 ?auto_579940 ) ) ( not ( = ?auto_579938 ?auto_579939 ) ) ( not ( = ?auto_579938 ?auto_579940 ) ) ( not ( = ?auto_579939 ?auto_579940 ) ) ( ON ?auto_579938 ?auto_579939 ) ( ON ?auto_579937 ?auto_579938 ) ( ON ?auto_579936 ?auto_579937 ) ( ON ?auto_579935 ?auto_579936 ) ( ON ?auto_579934 ?auto_579935 ) ( ON ?auto_579933 ?auto_579934 ) ( ON ?auto_579932 ?auto_579933 ) ( ON ?auto_579931 ?auto_579932 ) ( CLEAR ?auto_579929 ) ( ON ?auto_579930 ?auto_579931 ) ( CLEAR ?auto_579930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_579929 ?auto_579930 )
      ( MAKE-11PILE ?auto_579929 ?auto_579930 ?auto_579931 ?auto_579932 ?auto_579933 ?auto_579934 ?auto_579935 ?auto_579936 ?auto_579937 ?auto_579938 ?auto_579939 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_579975 - BLOCK
      ?auto_579976 - BLOCK
      ?auto_579977 - BLOCK
      ?auto_579978 - BLOCK
      ?auto_579979 - BLOCK
      ?auto_579980 - BLOCK
      ?auto_579981 - BLOCK
      ?auto_579982 - BLOCK
      ?auto_579983 - BLOCK
      ?auto_579984 - BLOCK
      ?auto_579985 - BLOCK
    )
    :vars
    (
      ?auto_579986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_579985 ?auto_579986 ) ( not ( = ?auto_579975 ?auto_579976 ) ) ( not ( = ?auto_579975 ?auto_579977 ) ) ( not ( = ?auto_579975 ?auto_579978 ) ) ( not ( = ?auto_579975 ?auto_579979 ) ) ( not ( = ?auto_579975 ?auto_579980 ) ) ( not ( = ?auto_579975 ?auto_579981 ) ) ( not ( = ?auto_579975 ?auto_579982 ) ) ( not ( = ?auto_579975 ?auto_579983 ) ) ( not ( = ?auto_579975 ?auto_579984 ) ) ( not ( = ?auto_579975 ?auto_579985 ) ) ( not ( = ?auto_579975 ?auto_579986 ) ) ( not ( = ?auto_579976 ?auto_579977 ) ) ( not ( = ?auto_579976 ?auto_579978 ) ) ( not ( = ?auto_579976 ?auto_579979 ) ) ( not ( = ?auto_579976 ?auto_579980 ) ) ( not ( = ?auto_579976 ?auto_579981 ) ) ( not ( = ?auto_579976 ?auto_579982 ) ) ( not ( = ?auto_579976 ?auto_579983 ) ) ( not ( = ?auto_579976 ?auto_579984 ) ) ( not ( = ?auto_579976 ?auto_579985 ) ) ( not ( = ?auto_579976 ?auto_579986 ) ) ( not ( = ?auto_579977 ?auto_579978 ) ) ( not ( = ?auto_579977 ?auto_579979 ) ) ( not ( = ?auto_579977 ?auto_579980 ) ) ( not ( = ?auto_579977 ?auto_579981 ) ) ( not ( = ?auto_579977 ?auto_579982 ) ) ( not ( = ?auto_579977 ?auto_579983 ) ) ( not ( = ?auto_579977 ?auto_579984 ) ) ( not ( = ?auto_579977 ?auto_579985 ) ) ( not ( = ?auto_579977 ?auto_579986 ) ) ( not ( = ?auto_579978 ?auto_579979 ) ) ( not ( = ?auto_579978 ?auto_579980 ) ) ( not ( = ?auto_579978 ?auto_579981 ) ) ( not ( = ?auto_579978 ?auto_579982 ) ) ( not ( = ?auto_579978 ?auto_579983 ) ) ( not ( = ?auto_579978 ?auto_579984 ) ) ( not ( = ?auto_579978 ?auto_579985 ) ) ( not ( = ?auto_579978 ?auto_579986 ) ) ( not ( = ?auto_579979 ?auto_579980 ) ) ( not ( = ?auto_579979 ?auto_579981 ) ) ( not ( = ?auto_579979 ?auto_579982 ) ) ( not ( = ?auto_579979 ?auto_579983 ) ) ( not ( = ?auto_579979 ?auto_579984 ) ) ( not ( = ?auto_579979 ?auto_579985 ) ) ( not ( = ?auto_579979 ?auto_579986 ) ) ( not ( = ?auto_579980 ?auto_579981 ) ) ( not ( = ?auto_579980 ?auto_579982 ) ) ( not ( = ?auto_579980 ?auto_579983 ) ) ( not ( = ?auto_579980 ?auto_579984 ) ) ( not ( = ?auto_579980 ?auto_579985 ) ) ( not ( = ?auto_579980 ?auto_579986 ) ) ( not ( = ?auto_579981 ?auto_579982 ) ) ( not ( = ?auto_579981 ?auto_579983 ) ) ( not ( = ?auto_579981 ?auto_579984 ) ) ( not ( = ?auto_579981 ?auto_579985 ) ) ( not ( = ?auto_579981 ?auto_579986 ) ) ( not ( = ?auto_579982 ?auto_579983 ) ) ( not ( = ?auto_579982 ?auto_579984 ) ) ( not ( = ?auto_579982 ?auto_579985 ) ) ( not ( = ?auto_579982 ?auto_579986 ) ) ( not ( = ?auto_579983 ?auto_579984 ) ) ( not ( = ?auto_579983 ?auto_579985 ) ) ( not ( = ?auto_579983 ?auto_579986 ) ) ( not ( = ?auto_579984 ?auto_579985 ) ) ( not ( = ?auto_579984 ?auto_579986 ) ) ( not ( = ?auto_579985 ?auto_579986 ) ) ( ON ?auto_579984 ?auto_579985 ) ( ON ?auto_579983 ?auto_579984 ) ( ON ?auto_579982 ?auto_579983 ) ( ON ?auto_579981 ?auto_579982 ) ( ON ?auto_579980 ?auto_579981 ) ( ON ?auto_579979 ?auto_579980 ) ( ON ?auto_579978 ?auto_579979 ) ( ON ?auto_579977 ?auto_579978 ) ( ON ?auto_579976 ?auto_579977 ) ( ON ?auto_579975 ?auto_579976 ) ( CLEAR ?auto_579975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_579975 )
      ( MAKE-11PILE ?auto_579975 ?auto_579976 ?auto_579977 ?auto_579978 ?auto_579979 ?auto_579980 ?auto_579981 ?auto_579982 ?auto_579983 ?auto_579984 ?auto_579985 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_580022 - BLOCK
      ?auto_580023 - BLOCK
      ?auto_580024 - BLOCK
      ?auto_580025 - BLOCK
      ?auto_580026 - BLOCK
      ?auto_580027 - BLOCK
      ?auto_580028 - BLOCK
      ?auto_580029 - BLOCK
      ?auto_580030 - BLOCK
      ?auto_580031 - BLOCK
      ?auto_580032 - BLOCK
      ?auto_580033 - BLOCK
    )
    :vars
    (
      ?auto_580034 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_580032 ) ( ON ?auto_580033 ?auto_580034 ) ( CLEAR ?auto_580033 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_580022 ) ( ON ?auto_580023 ?auto_580022 ) ( ON ?auto_580024 ?auto_580023 ) ( ON ?auto_580025 ?auto_580024 ) ( ON ?auto_580026 ?auto_580025 ) ( ON ?auto_580027 ?auto_580026 ) ( ON ?auto_580028 ?auto_580027 ) ( ON ?auto_580029 ?auto_580028 ) ( ON ?auto_580030 ?auto_580029 ) ( ON ?auto_580031 ?auto_580030 ) ( ON ?auto_580032 ?auto_580031 ) ( not ( = ?auto_580022 ?auto_580023 ) ) ( not ( = ?auto_580022 ?auto_580024 ) ) ( not ( = ?auto_580022 ?auto_580025 ) ) ( not ( = ?auto_580022 ?auto_580026 ) ) ( not ( = ?auto_580022 ?auto_580027 ) ) ( not ( = ?auto_580022 ?auto_580028 ) ) ( not ( = ?auto_580022 ?auto_580029 ) ) ( not ( = ?auto_580022 ?auto_580030 ) ) ( not ( = ?auto_580022 ?auto_580031 ) ) ( not ( = ?auto_580022 ?auto_580032 ) ) ( not ( = ?auto_580022 ?auto_580033 ) ) ( not ( = ?auto_580022 ?auto_580034 ) ) ( not ( = ?auto_580023 ?auto_580024 ) ) ( not ( = ?auto_580023 ?auto_580025 ) ) ( not ( = ?auto_580023 ?auto_580026 ) ) ( not ( = ?auto_580023 ?auto_580027 ) ) ( not ( = ?auto_580023 ?auto_580028 ) ) ( not ( = ?auto_580023 ?auto_580029 ) ) ( not ( = ?auto_580023 ?auto_580030 ) ) ( not ( = ?auto_580023 ?auto_580031 ) ) ( not ( = ?auto_580023 ?auto_580032 ) ) ( not ( = ?auto_580023 ?auto_580033 ) ) ( not ( = ?auto_580023 ?auto_580034 ) ) ( not ( = ?auto_580024 ?auto_580025 ) ) ( not ( = ?auto_580024 ?auto_580026 ) ) ( not ( = ?auto_580024 ?auto_580027 ) ) ( not ( = ?auto_580024 ?auto_580028 ) ) ( not ( = ?auto_580024 ?auto_580029 ) ) ( not ( = ?auto_580024 ?auto_580030 ) ) ( not ( = ?auto_580024 ?auto_580031 ) ) ( not ( = ?auto_580024 ?auto_580032 ) ) ( not ( = ?auto_580024 ?auto_580033 ) ) ( not ( = ?auto_580024 ?auto_580034 ) ) ( not ( = ?auto_580025 ?auto_580026 ) ) ( not ( = ?auto_580025 ?auto_580027 ) ) ( not ( = ?auto_580025 ?auto_580028 ) ) ( not ( = ?auto_580025 ?auto_580029 ) ) ( not ( = ?auto_580025 ?auto_580030 ) ) ( not ( = ?auto_580025 ?auto_580031 ) ) ( not ( = ?auto_580025 ?auto_580032 ) ) ( not ( = ?auto_580025 ?auto_580033 ) ) ( not ( = ?auto_580025 ?auto_580034 ) ) ( not ( = ?auto_580026 ?auto_580027 ) ) ( not ( = ?auto_580026 ?auto_580028 ) ) ( not ( = ?auto_580026 ?auto_580029 ) ) ( not ( = ?auto_580026 ?auto_580030 ) ) ( not ( = ?auto_580026 ?auto_580031 ) ) ( not ( = ?auto_580026 ?auto_580032 ) ) ( not ( = ?auto_580026 ?auto_580033 ) ) ( not ( = ?auto_580026 ?auto_580034 ) ) ( not ( = ?auto_580027 ?auto_580028 ) ) ( not ( = ?auto_580027 ?auto_580029 ) ) ( not ( = ?auto_580027 ?auto_580030 ) ) ( not ( = ?auto_580027 ?auto_580031 ) ) ( not ( = ?auto_580027 ?auto_580032 ) ) ( not ( = ?auto_580027 ?auto_580033 ) ) ( not ( = ?auto_580027 ?auto_580034 ) ) ( not ( = ?auto_580028 ?auto_580029 ) ) ( not ( = ?auto_580028 ?auto_580030 ) ) ( not ( = ?auto_580028 ?auto_580031 ) ) ( not ( = ?auto_580028 ?auto_580032 ) ) ( not ( = ?auto_580028 ?auto_580033 ) ) ( not ( = ?auto_580028 ?auto_580034 ) ) ( not ( = ?auto_580029 ?auto_580030 ) ) ( not ( = ?auto_580029 ?auto_580031 ) ) ( not ( = ?auto_580029 ?auto_580032 ) ) ( not ( = ?auto_580029 ?auto_580033 ) ) ( not ( = ?auto_580029 ?auto_580034 ) ) ( not ( = ?auto_580030 ?auto_580031 ) ) ( not ( = ?auto_580030 ?auto_580032 ) ) ( not ( = ?auto_580030 ?auto_580033 ) ) ( not ( = ?auto_580030 ?auto_580034 ) ) ( not ( = ?auto_580031 ?auto_580032 ) ) ( not ( = ?auto_580031 ?auto_580033 ) ) ( not ( = ?auto_580031 ?auto_580034 ) ) ( not ( = ?auto_580032 ?auto_580033 ) ) ( not ( = ?auto_580032 ?auto_580034 ) ) ( not ( = ?auto_580033 ?auto_580034 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_580033 ?auto_580034 )
      ( !STACK ?auto_580033 ?auto_580032 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_580072 - BLOCK
      ?auto_580073 - BLOCK
      ?auto_580074 - BLOCK
      ?auto_580075 - BLOCK
      ?auto_580076 - BLOCK
      ?auto_580077 - BLOCK
      ?auto_580078 - BLOCK
      ?auto_580079 - BLOCK
      ?auto_580080 - BLOCK
      ?auto_580081 - BLOCK
      ?auto_580082 - BLOCK
      ?auto_580083 - BLOCK
    )
    :vars
    (
      ?auto_580084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580083 ?auto_580084 ) ( ON-TABLE ?auto_580072 ) ( ON ?auto_580073 ?auto_580072 ) ( ON ?auto_580074 ?auto_580073 ) ( ON ?auto_580075 ?auto_580074 ) ( ON ?auto_580076 ?auto_580075 ) ( ON ?auto_580077 ?auto_580076 ) ( ON ?auto_580078 ?auto_580077 ) ( ON ?auto_580079 ?auto_580078 ) ( ON ?auto_580080 ?auto_580079 ) ( ON ?auto_580081 ?auto_580080 ) ( not ( = ?auto_580072 ?auto_580073 ) ) ( not ( = ?auto_580072 ?auto_580074 ) ) ( not ( = ?auto_580072 ?auto_580075 ) ) ( not ( = ?auto_580072 ?auto_580076 ) ) ( not ( = ?auto_580072 ?auto_580077 ) ) ( not ( = ?auto_580072 ?auto_580078 ) ) ( not ( = ?auto_580072 ?auto_580079 ) ) ( not ( = ?auto_580072 ?auto_580080 ) ) ( not ( = ?auto_580072 ?auto_580081 ) ) ( not ( = ?auto_580072 ?auto_580082 ) ) ( not ( = ?auto_580072 ?auto_580083 ) ) ( not ( = ?auto_580072 ?auto_580084 ) ) ( not ( = ?auto_580073 ?auto_580074 ) ) ( not ( = ?auto_580073 ?auto_580075 ) ) ( not ( = ?auto_580073 ?auto_580076 ) ) ( not ( = ?auto_580073 ?auto_580077 ) ) ( not ( = ?auto_580073 ?auto_580078 ) ) ( not ( = ?auto_580073 ?auto_580079 ) ) ( not ( = ?auto_580073 ?auto_580080 ) ) ( not ( = ?auto_580073 ?auto_580081 ) ) ( not ( = ?auto_580073 ?auto_580082 ) ) ( not ( = ?auto_580073 ?auto_580083 ) ) ( not ( = ?auto_580073 ?auto_580084 ) ) ( not ( = ?auto_580074 ?auto_580075 ) ) ( not ( = ?auto_580074 ?auto_580076 ) ) ( not ( = ?auto_580074 ?auto_580077 ) ) ( not ( = ?auto_580074 ?auto_580078 ) ) ( not ( = ?auto_580074 ?auto_580079 ) ) ( not ( = ?auto_580074 ?auto_580080 ) ) ( not ( = ?auto_580074 ?auto_580081 ) ) ( not ( = ?auto_580074 ?auto_580082 ) ) ( not ( = ?auto_580074 ?auto_580083 ) ) ( not ( = ?auto_580074 ?auto_580084 ) ) ( not ( = ?auto_580075 ?auto_580076 ) ) ( not ( = ?auto_580075 ?auto_580077 ) ) ( not ( = ?auto_580075 ?auto_580078 ) ) ( not ( = ?auto_580075 ?auto_580079 ) ) ( not ( = ?auto_580075 ?auto_580080 ) ) ( not ( = ?auto_580075 ?auto_580081 ) ) ( not ( = ?auto_580075 ?auto_580082 ) ) ( not ( = ?auto_580075 ?auto_580083 ) ) ( not ( = ?auto_580075 ?auto_580084 ) ) ( not ( = ?auto_580076 ?auto_580077 ) ) ( not ( = ?auto_580076 ?auto_580078 ) ) ( not ( = ?auto_580076 ?auto_580079 ) ) ( not ( = ?auto_580076 ?auto_580080 ) ) ( not ( = ?auto_580076 ?auto_580081 ) ) ( not ( = ?auto_580076 ?auto_580082 ) ) ( not ( = ?auto_580076 ?auto_580083 ) ) ( not ( = ?auto_580076 ?auto_580084 ) ) ( not ( = ?auto_580077 ?auto_580078 ) ) ( not ( = ?auto_580077 ?auto_580079 ) ) ( not ( = ?auto_580077 ?auto_580080 ) ) ( not ( = ?auto_580077 ?auto_580081 ) ) ( not ( = ?auto_580077 ?auto_580082 ) ) ( not ( = ?auto_580077 ?auto_580083 ) ) ( not ( = ?auto_580077 ?auto_580084 ) ) ( not ( = ?auto_580078 ?auto_580079 ) ) ( not ( = ?auto_580078 ?auto_580080 ) ) ( not ( = ?auto_580078 ?auto_580081 ) ) ( not ( = ?auto_580078 ?auto_580082 ) ) ( not ( = ?auto_580078 ?auto_580083 ) ) ( not ( = ?auto_580078 ?auto_580084 ) ) ( not ( = ?auto_580079 ?auto_580080 ) ) ( not ( = ?auto_580079 ?auto_580081 ) ) ( not ( = ?auto_580079 ?auto_580082 ) ) ( not ( = ?auto_580079 ?auto_580083 ) ) ( not ( = ?auto_580079 ?auto_580084 ) ) ( not ( = ?auto_580080 ?auto_580081 ) ) ( not ( = ?auto_580080 ?auto_580082 ) ) ( not ( = ?auto_580080 ?auto_580083 ) ) ( not ( = ?auto_580080 ?auto_580084 ) ) ( not ( = ?auto_580081 ?auto_580082 ) ) ( not ( = ?auto_580081 ?auto_580083 ) ) ( not ( = ?auto_580081 ?auto_580084 ) ) ( not ( = ?auto_580082 ?auto_580083 ) ) ( not ( = ?auto_580082 ?auto_580084 ) ) ( not ( = ?auto_580083 ?auto_580084 ) ) ( CLEAR ?auto_580081 ) ( ON ?auto_580082 ?auto_580083 ) ( CLEAR ?auto_580082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_580072 ?auto_580073 ?auto_580074 ?auto_580075 ?auto_580076 ?auto_580077 ?auto_580078 ?auto_580079 ?auto_580080 ?auto_580081 ?auto_580082 )
      ( MAKE-12PILE ?auto_580072 ?auto_580073 ?auto_580074 ?auto_580075 ?auto_580076 ?auto_580077 ?auto_580078 ?auto_580079 ?auto_580080 ?auto_580081 ?auto_580082 ?auto_580083 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_580122 - BLOCK
      ?auto_580123 - BLOCK
      ?auto_580124 - BLOCK
      ?auto_580125 - BLOCK
      ?auto_580126 - BLOCK
      ?auto_580127 - BLOCK
      ?auto_580128 - BLOCK
      ?auto_580129 - BLOCK
      ?auto_580130 - BLOCK
      ?auto_580131 - BLOCK
      ?auto_580132 - BLOCK
      ?auto_580133 - BLOCK
    )
    :vars
    (
      ?auto_580134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580133 ?auto_580134 ) ( ON-TABLE ?auto_580122 ) ( ON ?auto_580123 ?auto_580122 ) ( ON ?auto_580124 ?auto_580123 ) ( ON ?auto_580125 ?auto_580124 ) ( ON ?auto_580126 ?auto_580125 ) ( ON ?auto_580127 ?auto_580126 ) ( ON ?auto_580128 ?auto_580127 ) ( ON ?auto_580129 ?auto_580128 ) ( ON ?auto_580130 ?auto_580129 ) ( not ( = ?auto_580122 ?auto_580123 ) ) ( not ( = ?auto_580122 ?auto_580124 ) ) ( not ( = ?auto_580122 ?auto_580125 ) ) ( not ( = ?auto_580122 ?auto_580126 ) ) ( not ( = ?auto_580122 ?auto_580127 ) ) ( not ( = ?auto_580122 ?auto_580128 ) ) ( not ( = ?auto_580122 ?auto_580129 ) ) ( not ( = ?auto_580122 ?auto_580130 ) ) ( not ( = ?auto_580122 ?auto_580131 ) ) ( not ( = ?auto_580122 ?auto_580132 ) ) ( not ( = ?auto_580122 ?auto_580133 ) ) ( not ( = ?auto_580122 ?auto_580134 ) ) ( not ( = ?auto_580123 ?auto_580124 ) ) ( not ( = ?auto_580123 ?auto_580125 ) ) ( not ( = ?auto_580123 ?auto_580126 ) ) ( not ( = ?auto_580123 ?auto_580127 ) ) ( not ( = ?auto_580123 ?auto_580128 ) ) ( not ( = ?auto_580123 ?auto_580129 ) ) ( not ( = ?auto_580123 ?auto_580130 ) ) ( not ( = ?auto_580123 ?auto_580131 ) ) ( not ( = ?auto_580123 ?auto_580132 ) ) ( not ( = ?auto_580123 ?auto_580133 ) ) ( not ( = ?auto_580123 ?auto_580134 ) ) ( not ( = ?auto_580124 ?auto_580125 ) ) ( not ( = ?auto_580124 ?auto_580126 ) ) ( not ( = ?auto_580124 ?auto_580127 ) ) ( not ( = ?auto_580124 ?auto_580128 ) ) ( not ( = ?auto_580124 ?auto_580129 ) ) ( not ( = ?auto_580124 ?auto_580130 ) ) ( not ( = ?auto_580124 ?auto_580131 ) ) ( not ( = ?auto_580124 ?auto_580132 ) ) ( not ( = ?auto_580124 ?auto_580133 ) ) ( not ( = ?auto_580124 ?auto_580134 ) ) ( not ( = ?auto_580125 ?auto_580126 ) ) ( not ( = ?auto_580125 ?auto_580127 ) ) ( not ( = ?auto_580125 ?auto_580128 ) ) ( not ( = ?auto_580125 ?auto_580129 ) ) ( not ( = ?auto_580125 ?auto_580130 ) ) ( not ( = ?auto_580125 ?auto_580131 ) ) ( not ( = ?auto_580125 ?auto_580132 ) ) ( not ( = ?auto_580125 ?auto_580133 ) ) ( not ( = ?auto_580125 ?auto_580134 ) ) ( not ( = ?auto_580126 ?auto_580127 ) ) ( not ( = ?auto_580126 ?auto_580128 ) ) ( not ( = ?auto_580126 ?auto_580129 ) ) ( not ( = ?auto_580126 ?auto_580130 ) ) ( not ( = ?auto_580126 ?auto_580131 ) ) ( not ( = ?auto_580126 ?auto_580132 ) ) ( not ( = ?auto_580126 ?auto_580133 ) ) ( not ( = ?auto_580126 ?auto_580134 ) ) ( not ( = ?auto_580127 ?auto_580128 ) ) ( not ( = ?auto_580127 ?auto_580129 ) ) ( not ( = ?auto_580127 ?auto_580130 ) ) ( not ( = ?auto_580127 ?auto_580131 ) ) ( not ( = ?auto_580127 ?auto_580132 ) ) ( not ( = ?auto_580127 ?auto_580133 ) ) ( not ( = ?auto_580127 ?auto_580134 ) ) ( not ( = ?auto_580128 ?auto_580129 ) ) ( not ( = ?auto_580128 ?auto_580130 ) ) ( not ( = ?auto_580128 ?auto_580131 ) ) ( not ( = ?auto_580128 ?auto_580132 ) ) ( not ( = ?auto_580128 ?auto_580133 ) ) ( not ( = ?auto_580128 ?auto_580134 ) ) ( not ( = ?auto_580129 ?auto_580130 ) ) ( not ( = ?auto_580129 ?auto_580131 ) ) ( not ( = ?auto_580129 ?auto_580132 ) ) ( not ( = ?auto_580129 ?auto_580133 ) ) ( not ( = ?auto_580129 ?auto_580134 ) ) ( not ( = ?auto_580130 ?auto_580131 ) ) ( not ( = ?auto_580130 ?auto_580132 ) ) ( not ( = ?auto_580130 ?auto_580133 ) ) ( not ( = ?auto_580130 ?auto_580134 ) ) ( not ( = ?auto_580131 ?auto_580132 ) ) ( not ( = ?auto_580131 ?auto_580133 ) ) ( not ( = ?auto_580131 ?auto_580134 ) ) ( not ( = ?auto_580132 ?auto_580133 ) ) ( not ( = ?auto_580132 ?auto_580134 ) ) ( not ( = ?auto_580133 ?auto_580134 ) ) ( ON ?auto_580132 ?auto_580133 ) ( CLEAR ?auto_580130 ) ( ON ?auto_580131 ?auto_580132 ) ( CLEAR ?auto_580131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_580122 ?auto_580123 ?auto_580124 ?auto_580125 ?auto_580126 ?auto_580127 ?auto_580128 ?auto_580129 ?auto_580130 ?auto_580131 )
      ( MAKE-12PILE ?auto_580122 ?auto_580123 ?auto_580124 ?auto_580125 ?auto_580126 ?auto_580127 ?auto_580128 ?auto_580129 ?auto_580130 ?auto_580131 ?auto_580132 ?auto_580133 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_580172 - BLOCK
      ?auto_580173 - BLOCK
      ?auto_580174 - BLOCK
      ?auto_580175 - BLOCK
      ?auto_580176 - BLOCK
      ?auto_580177 - BLOCK
      ?auto_580178 - BLOCK
      ?auto_580179 - BLOCK
      ?auto_580180 - BLOCK
      ?auto_580181 - BLOCK
      ?auto_580182 - BLOCK
      ?auto_580183 - BLOCK
    )
    :vars
    (
      ?auto_580184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580183 ?auto_580184 ) ( ON-TABLE ?auto_580172 ) ( ON ?auto_580173 ?auto_580172 ) ( ON ?auto_580174 ?auto_580173 ) ( ON ?auto_580175 ?auto_580174 ) ( ON ?auto_580176 ?auto_580175 ) ( ON ?auto_580177 ?auto_580176 ) ( ON ?auto_580178 ?auto_580177 ) ( ON ?auto_580179 ?auto_580178 ) ( not ( = ?auto_580172 ?auto_580173 ) ) ( not ( = ?auto_580172 ?auto_580174 ) ) ( not ( = ?auto_580172 ?auto_580175 ) ) ( not ( = ?auto_580172 ?auto_580176 ) ) ( not ( = ?auto_580172 ?auto_580177 ) ) ( not ( = ?auto_580172 ?auto_580178 ) ) ( not ( = ?auto_580172 ?auto_580179 ) ) ( not ( = ?auto_580172 ?auto_580180 ) ) ( not ( = ?auto_580172 ?auto_580181 ) ) ( not ( = ?auto_580172 ?auto_580182 ) ) ( not ( = ?auto_580172 ?auto_580183 ) ) ( not ( = ?auto_580172 ?auto_580184 ) ) ( not ( = ?auto_580173 ?auto_580174 ) ) ( not ( = ?auto_580173 ?auto_580175 ) ) ( not ( = ?auto_580173 ?auto_580176 ) ) ( not ( = ?auto_580173 ?auto_580177 ) ) ( not ( = ?auto_580173 ?auto_580178 ) ) ( not ( = ?auto_580173 ?auto_580179 ) ) ( not ( = ?auto_580173 ?auto_580180 ) ) ( not ( = ?auto_580173 ?auto_580181 ) ) ( not ( = ?auto_580173 ?auto_580182 ) ) ( not ( = ?auto_580173 ?auto_580183 ) ) ( not ( = ?auto_580173 ?auto_580184 ) ) ( not ( = ?auto_580174 ?auto_580175 ) ) ( not ( = ?auto_580174 ?auto_580176 ) ) ( not ( = ?auto_580174 ?auto_580177 ) ) ( not ( = ?auto_580174 ?auto_580178 ) ) ( not ( = ?auto_580174 ?auto_580179 ) ) ( not ( = ?auto_580174 ?auto_580180 ) ) ( not ( = ?auto_580174 ?auto_580181 ) ) ( not ( = ?auto_580174 ?auto_580182 ) ) ( not ( = ?auto_580174 ?auto_580183 ) ) ( not ( = ?auto_580174 ?auto_580184 ) ) ( not ( = ?auto_580175 ?auto_580176 ) ) ( not ( = ?auto_580175 ?auto_580177 ) ) ( not ( = ?auto_580175 ?auto_580178 ) ) ( not ( = ?auto_580175 ?auto_580179 ) ) ( not ( = ?auto_580175 ?auto_580180 ) ) ( not ( = ?auto_580175 ?auto_580181 ) ) ( not ( = ?auto_580175 ?auto_580182 ) ) ( not ( = ?auto_580175 ?auto_580183 ) ) ( not ( = ?auto_580175 ?auto_580184 ) ) ( not ( = ?auto_580176 ?auto_580177 ) ) ( not ( = ?auto_580176 ?auto_580178 ) ) ( not ( = ?auto_580176 ?auto_580179 ) ) ( not ( = ?auto_580176 ?auto_580180 ) ) ( not ( = ?auto_580176 ?auto_580181 ) ) ( not ( = ?auto_580176 ?auto_580182 ) ) ( not ( = ?auto_580176 ?auto_580183 ) ) ( not ( = ?auto_580176 ?auto_580184 ) ) ( not ( = ?auto_580177 ?auto_580178 ) ) ( not ( = ?auto_580177 ?auto_580179 ) ) ( not ( = ?auto_580177 ?auto_580180 ) ) ( not ( = ?auto_580177 ?auto_580181 ) ) ( not ( = ?auto_580177 ?auto_580182 ) ) ( not ( = ?auto_580177 ?auto_580183 ) ) ( not ( = ?auto_580177 ?auto_580184 ) ) ( not ( = ?auto_580178 ?auto_580179 ) ) ( not ( = ?auto_580178 ?auto_580180 ) ) ( not ( = ?auto_580178 ?auto_580181 ) ) ( not ( = ?auto_580178 ?auto_580182 ) ) ( not ( = ?auto_580178 ?auto_580183 ) ) ( not ( = ?auto_580178 ?auto_580184 ) ) ( not ( = ?auto_580179 ?auto_580180 ) ) ( not ( = ?auto_580179 ?auto_580181 ) ) ( not ( = ?auto_580179 ?auto_580182 ) ) ( not ( = ?auto_580179 ?auto_580183 ) ) ( not ( = ?auto_580179 ?auto_580184 ) ) ( not ( = ?auto_580180 ?auto_580181 ) ) ( not ( = ?auto_580180 ?auto_580182 ) ) ( not ( = ?auto_580180 ?auto_580183 ) ) ( not ( = ?auto_580180 ?auto_580184 ) ) ( not ( = ?auto_580181 ?auto_580182 ) ) ( not ( = ?auto_580181 ?auto_580183 ) ) ( not ( = ?auto_580181 ?auto_580184 ) ) ( not ( = ?auto_580182 ?auto_580183 ) ) ( not ( = ?auto_580182 ?auto_580184 ) ) ( not ( = ?auto_580183 ?auto_580184 ) ) ( ON ?auto_580182 ?auto_580183 ) ( ON ?auto_580181 ?auto_580182 ) ( CLEAR ?auto_580179 ) ( ON ?auto_580180 ?auto_580181 ) ( CLEAR ?auto_580180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_580172 ?auto_580173 ?auto_580174 ?auto_580175 ?auto_580176 ?auto_580177 ?auto_580178 ?auto_580179 ?auto_580180 )
      ( MAKE-12PILE ?auto_580172 ?auto_580173 ?auto_580174 ?auto_580175 ?auto_580176 ?auto_580177 ?auto_580178 ?auto_580179 ?auto_580180 ?auto_580181 ?auto_580182 ?auto_580183 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_580222 - BLOCK
      ?auto_580223 - BLOCK
      ?auto_580224 - BLOCK
      ?auto_580225 - BLOCK
      ?auto_580226 - BLOCK
      ?auto_580227 - BLOCK
      ?auto_580228 - BLOCK
      ?auto_580229 - BLOCK
      ?auto_580230 - BLOCK
      ?auto_580231 - BLOCK
      ?auto_580232 - BLOCK
      ?auto_580233 - BLOCK
    )
    :vars
    (
      ?auto_580234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580233 ?auto_580234 ) ( ON-TABLE ?auto_580222 ) ( ON ?auto_580223 ?auto_580222 ) ( ON ?auto_580224 ?auto_580223 ) ( ON ?auto_580225 ?auto_580224 ) ( ON ?auto_580226 ?auto_580225 ) ( ON ?auto_580227 ?auto_580226 ) ( ON ?auto_580228 ?auto_580227 ) ( not ( = ?auto_580222 ?auto_580223 ) ) ( not ( = ?auto_580222 ?auto_580224 ) ) ( not ( = ?auto_580222 ?auto_580225 ) ) ( not ( = ?auto_580222 ?auto_580226 ) ) ( not ( = ?auto_580222 ?auto_580227 ) ) ( not ( = ?auto_580222 ?auto_580228 ) ) ( not ( = ?auto_580222 ?auto_580229 ) ) ( not ( = ?auto_580222 ?auto_580230 ) ) ( not ( = ?auto_580222 ?auto_580231 ) ) ( not ( = ?auto_580222 ?auto_580232 ) ) ( not ( = ?auto_580222 ?auto_580233 ) ) ( not ( = ?auto_580222 ?auto_580234 ) ) ( not ( = ?auto_580223 ?auto_580224 ) ) ( not ( = ?auto_580223 ?auto_580225 ) ) ( not ( = ?auto_580223 ?auto_580226 ) ) ( not ( = ?auto_580223 ?auto_580227 ) ) ( not ( = ?auto_580223 ?auto_580228 ) ) ( not ( = ?auto_580223 ?auto_580229 ) ) ( not ( = ?auto_580223 ?auto_580230 ) ) ( not ( = ?auto_580223 ?auto_580231 ) ) ( not ( = ?auto_580223 ?auto_580232 ) ) ( not ( = ?auto_580223 ?auto_580233 ) ) ( not ( = ?auto_580223 ?auto_580234 ) ) ( not ( = ?auto_580224 ?auto_580225 ) ) ( not ( = ?auto_580224 ?auto_580226 ) ) ( not ( = ?auto_580224 ?auto_580227 ) ) ( not ( = ?auto_580224 ?auto_580228 ) ) ( not ( = ?auto_580224 ?auto_580229 ) ) ( not ( = ?auto_580224 ?auto_580230 ) ) ( not ( = ?auto_580224 ?auto_580231 ) ) ( not ( = ?auto_580224 ?auto_580232 ) ) ( not ( = ?auto_580224 ?auto_580233 ) ) ( not ( = ?auto_580224 ?auto_580234 ) ) ( not ( = ?auto_580225 ?auto_580226 ) ) ( not ( = ?auto_580225 ?auto_580227 ) ) ( not ( = ?auto_580225 ?auto_580228 ) ) ( not ( = ?auto_580225 ?auto_580229 ) ) ( not ( = ?auto_580225 ?auto_580230 ) ) ( not ( = ?auto_580225 ?auto_580231 ) ) ( not ( = ?auto_580225 ?auto_580232 ) ) ( not ( = ?auto_580225 ?auto_580233 ) ) ( not ( = ?auto_580225 ?auto_580234 ) ) ( not ( = ?auto_580226 ?auto_580227 ) ) ( not ( = ?auto_580226 ?auto_580228 ) ) ( not ( = ?auto_580226 ?auto_580229 ) ) ( not ( = ?auto_580226 ?auto_580230 ) ) ( not ( = ?auto_580226 ?auto_580231 ) ) ( not ( = ?auto_580226 ?auto_580232 ) ) ( not ( = ?auto_580226 ?auto_580233 ) ) ( not ( = ?auto_580226 ?auto_580234 ) ) ( not ( = ?auto_580227 ?auto_580228 ) ) ( not ( = ?auto_580227 ?auto_580229 ) ) ( not ( = ?auto_580227 ?auto_580230 ) ) ( not ( = ?auto_580227 ?auto_580231 ) ) ( not ( = ?auto_580227 ?auto_580232 ) ) ( not ( = ?auto_580227 ?auto_580233 ) ) ( not ( = ?auto_580227 ?auto_580234 ) ) ( not ( = ?auto_580228 ?auto_580229 ) ) ( not ( = ?auto_580228 ?auto_580230 ) ) ( not ( = ?auto_580228 ?auto_580231 ) ) ( not ( = ?auto_580228 ?auto_580232 ) ) ( not ( = ?auto_580228 ?auto_580233 ) ) ( not ( = ?auto_580228 ?auto_580234 ) ) ( not ( = ?auto_580229 ?auto_580230 ) ) ( not ( = ?auto_580229 ?auto_580231 ) ) ( not ( = ?auto_580229 ?auto_580232 ) ) ( not ( = ?auto_580229 ?auto_580233 ) ) ( not ( = ?auto_580229 ?auto_580234 ) ) ( not ( = ?auto_580230 ?auto_580231 ) ) ( not ( = ?auto_580230 ?auto_580232 ) ) ( not ( = ?auto_580230 ?auto_580233 ) ) ( not ( = ?auto_580230 ?auto_580234 ) ) ( not ( = ?auto_580231 ?auto_580232 ) ) ( not ( = ?auto_580231 ?auto_580233 ) ) ( not ( = ?auto_580231 ?auto_580234 ) ) ( not ( = ?auto_580232 ?auto_580233 ) ) ( not ( = ?auto_580232 ?auto_580234 ) ) ( not ( = ?auto_580233 ?auto_580234 ) ) ( ON ?auto_580232 ?auto_580233 ) ( ON ?auto_580231 ?auto_580232 ) ( ON ?auto_580230 ?auto_580231 ) ( CLEAR ?auto_580228 ) ( ON ?auto_580229 ?auto_580230 ) ( CLEAR ?auto_580229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_580222 ?auto_580223 ?auto_580224 ?auto_580225 ?auto_580226 ?auto_580227 ?auto_580228 ?auto_580229 )
      ( MAKE-12PILE ?auto_580222 ?auto_580223 ?auto_580224 ?auto_580225 ?auto_580226 ?auto_580227 ?auto_580228 ?auto_580229 ?auto_580230 ?auto_580231 ?auto_580232 ?auto_580233 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_580272 - BLOCK
      ?auto_580273 - BLOCK
      ?auto_580274 - BLOCK
      ?auto_580275 - BLOCK
      ?auto_580276 - BLOCK
      ?auto_580277 - BLOCK
      ?auto_580278 - BLOCK
      ?auto_580279 - BLOCK
      ?auto_580280 - BLOCK
      ?auto_580281 - BLOCK
      ?auto_580282 - BLOCK
      ?auto_580283 - BLOCK
    )
    :vars
    (
      ?auto_580284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580283 ?auto_580284 ) ( ON-TABLE ?auto_580272 ) ( ON ?auto_580273 ?auto_580272 ) ( ON ?auto_580274 ?auto_580273 ) ( ON ?auto_580275 ?auto_580274 ) ( ON ?auto_580276 ?auto_580275 ) ( ON ?auto_580277 ?auto_580276 ) ( not ( = ?auto_580272 ?auto_580273 ) ) ( not ( = ?auto_580272 ?auto_580274 ) ) ( not ( = ?auto_580272 ?auto_580275 ) ) ( not ( = ?auto_580272 ?auto_580276 ) ) ( not ( = ?auto_580272 ?auto_580277 ) ) ( not ( = ?auto_580272 ?auto_580278 ) ) ( not ( = ?auto_580272 ?auto_580279 ) ) ( not ( = ?auto_580272 ?auto_580280 ) ) ( not ( = ?auto_580272 ?auto_580281 ) ) ( not ( = ?auto_580272 ?auto_580282 ) ) ( not ( = ?auto_580272 ?auto_580283 ) ) ( not ( = ?auto_580272 ?auto_580284 ) ) ( not ( = ?auto_580273 ?auto_580274 ) ) ( not ( = ?auto_580273 ?auto_580275 ) ) ( not ( = ?auto_580273 ?auto_580276 ) ) ( not ( = ?auto_580273 ?auto_580277 ) ) ( not ( = ?auto_580273 ?auto_580278 ) ) ( not ( = ?auto_580273 ?auto_580279 ) ) ( not ( = ?auto_580273 ?auto_580280 ) ) ( not ( = ?auto_580273 ?auto_580281 ) ) ( not ( = ?auto_580273 ?auto_580282 ) ) ( not ( = ?auto_580273 ?auto_580283 ) ) ( not ( = ?auto_580273 ?auto_580284 ) ) ( not ( = ?auto_580274 ?auto_580275 ) ) ( not ( = ?auto_580274 ?auto_580276 ) ) ( not ( = ?auto_580274 ?auto_580277 ) ) ( not ( = ?auto_580274 ?auto_580278 ) ) ( not ( = ?auto_580274 ?auto_580279 ) ) ( not ( = ?auto_580274 ?auto_580280 ) ) ( not ( = ?auto_580274 ?auto_580281 ) ) ( not ( = ?auto_580274 ?auto_580282 ) ) ( not ( = ?auto_580274 ?auto_580283 ) ) ( not ( = ?auto_580274 ?auto_580284 ) ) ( not ( = ?auto_580275 ?auto_580276 ) ) ( not ( = ?auto_580275 ?auto_580277 ) ) ( not ( = ?auto_580275 ?auto_580278 ) ) ( not ( = ?auto_580275 ?auto_580279 ) ) ( not ( = ?auto_580275 ?auto_580280 ) ) ( not ( = ?auto_580275 ?auto_580281 ) ) ( not ( = ?auto_580275 ?auto_580282 ) ) ( not ( = ?auto_580275 ?auto_580283 ) ) ( not ( = ?auto_580275 ?auto_580284 ) ) ( not ( = ?auto_580276 ?auto_580277 ) ) ( not ( = ?auto_580276 ?auto_580278 ) ) ( not ( = ?auto_580276 ?auto_580279 ) ) ( not ( = ?auto_580276 ?auto_580280 ) ) ( not ( = ?auto_580276 ?auto_580281 ) ) ( not ( = ?auto_580276 ?auto_580282 ) ) ( not ( = ?auto_580276 ?auto_580283 ) ) ( not ( = ?auto_580276 ?auto_580284 ) ) ( not ( = ?auto_580277 ?auto_580278 ) ) ( not ( = ?auto_580277 ?auto_580279 ) ) ( not ( = ?auto_580277 ?auto_580280 ) ) ( not ( = ?auto_580277 ?auto_580281 ) ) ( not ( = ?auto_580277 ?auto_580282 ) ) ( not ( = ?auto_580277 ?auto_580283 ) ) ( not ( = ?auto_580277 ?auto_580284 ) ) ( not ( = ?auto_580278 ?auto_580279 ) ) ( not ( = ?auto_580278 ?auto_580280 ) ) ( not ( = ?auto_580278 ?auto_580281 ) ) ( not ( = ?auto_580278 ?auto_580282 ) ) ( not ( = ?auto_580278 ?auto_580283 ) ) ( not ( = ?auto_580278 ?auto_580284 ) ) ( not ( = ?auto_580279 ?auto_580280 ) ) ( not ( = ?auto_580279 ?auto_580281 ) ) ( not ( = ?auto_580279 ?auto_580282 ) ) ( not ( = ?auto_580279 ?auto_580283 ) ) ( not ( = ?auto_580279 ?auto_580284 ) ) ( not ( = ?auto_580280 ?auto_580281 ) ) ( not ( = ?auto_580280 ?auto_580282 ) ) ( not ( = ?auto_580280 ?auto_580283 ) ) ( not ( = ?auto_580280 ?auto_580284 ) ) ( not ( = ?auto_580281 ?auto_580282 ) ) ( not ( = ?auto_580281 ?auto_580283 ) ) ( not ( = ?auto_580281 ?auto_580284 ) ) ( not ( = ?auto_580282 ?auto_580283 ) ) ( not ( = ?auto_580282 ?auto_580284 ) ) ( not ( = ?auto_580283 ?auto_580284 ) ) ( ON ?auto_580282 ?auto_580283 ) ( ON ?auto_580281 ?auto_580282 ) ( ON ?auto_580280 ?auto_580281 ) ( ON ?auto_580279 ?auto_580280 ) ( CLEAR ?auto_580277 ) ( ON ?auto_580278 ?auto_580279 ) ( CLEAR ?auto_580278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_580272 ?auto_580273 ?auto_580274 ?auto_580275 ?auto_580276 ?auto_580277 ?auto_580278 )
      ( MAKE-12PILE ?auto_580272 ?auto_580273 ?auto_580274 ?auto_580275 ?auto_580276 ?auto_580277 ?auto_580278 ?auto_580279 ?auto_580280 ?auto_580281 ?auto_580282 ?auto_580283 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_580322 - BLOCK
      ?auto_580323 - BLOCK
      ?auto_580324 - BLOCK
      ?auto_580325 - BLOCK
      ?auto_580326 - BLOCK
      ?auto_580327 - BLOCK
      ?auto_580328 - BLOCK
      ?auto_580329 - BLOCK
      ?auto_580330 - BLOCK
      ?auto_580331 - BLOCK
      ?auto_580332 - BLOCK
      ?auto_580333 - BLOCK
    )
    :vars
    (
      ?auto_580334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580333 ?auto_580334 ) ( ON-TABLE ?auto_580322 ) ( ON ?auto_580323 ?auto_580322 ) ( ON ?auto_580324 ?auto_580323 ) ( ON ?auto_580325 ?auto_580324 ) ( ON ?auto_580326 ?auto_580325 ) ( not ( = ?auto_580322 ?auto_580323 ) ) ( not ( = ?auto_580322 ?auto_580324 ) ) ( not ( = ?auto_580322 ?auto_580325 ) ) ( not ( = ?auto_580322 ?auto_580326 ) ) ( not ( = ?auto_580322 ?auto_580327 ) ) ( not ( = ?auto_580322 ?auto_580328 ) ) ( not ( = ?auto_580322 ?auto_580329 ) ) ( not ( = ?auto_580322 ?auto_580330 ) ) ( not ( = ?auto_580322 ?auto_580331 ) ) ( not ( = ?auto_580322 ?auto_580332 ) ) ( not ( = ?auto_580322 ?auto_580333 ) ) ( not ( = ?auto_580322 ?auto_580334 ) ) ( not ( = ?auto_580323 ?auto_580324 ) ) ( not ( = ?auto_580323 ?auto_580325 ) ) ( not ( = ?auto_580323 ?auto_580326 ) ) ( not ( = ?auto_580323 ?auto_580327 ) ) ( not ( = ?auto_580323 ?auto_580328 ) ) ( not ( = ?auto_580323 ?auto_580329 ) ) ( not ( = ?auto_580323 ?auto_580330 ) ) ( not ( = ?auto_580323 ?auto_580331 ) ) ( not ( = ?auto_580323 ?auto_580332 ) ) ( not ( = ?auto_580323 ?auto_580333 ) ) ( not ( = ?auto_580323 ?auto_580334 ) ) ( not ( = ?auto_580324 ?auto_580325 ) ) ( not ( = ?auto_580324 ?auto_580326 ) ) ( not ( = ?auto_580324 ?auto_580327 ) ) ( not ( = ?auto_580324 ?auto_580328 ) ) ( not ( = ?auto_580324 ?auto_580329 ) ) ( not ( = ?auto_580324 ?auto_580330 ) ) ( not ( = ?auto_580324 ?auto_580331 ) ) ( not ( = ?auto_580324 ?auto_580332 ) ) ( not ( = ?auto_580324 ?auto_580333 ) ) ( not ( = ?auto_580324 ?auto_580334 ) ) ( not ( = ?auto_580325 ?auto_580326 ) ) ( not ( = ?auto_580325 ?auto_580327 ) ) ( not ( = ?auto_580325 ?auto_580328 ) ) ( not ( = ?auto_580325 ?auto_580329 ) ) ( not ( = ?auto_580325 ?auto_580330 ) ) ( not ( = ?auto_580325 ?auto_580331 ) ) ( not ( = ?auto_580325 ?auto_580332 ) ) ( not ( = ?auto_580325 ?auto_580333 ) ) ( not ( = ?auto_580325 ?auto_580334 ) ) ( not ( = ?auto_580326 ?auto_580327 ) ) ( not ( = ?auto_580326 ?auto_580328 ) ) ( not ( = ?auto_580326 ?auto_580329 ) ) ( not ( = ?auto_580326 ?auto_580330 ) ) ( not ( = ?auto_580326 ?auto_580331 ) ) ( not ( = ?auto_580326 ?auto_580332 ) ) ( not ( = ?auto_580326 ?auto_580333 ) ) ( not ( = ?auto_580326 ?auto_580334 ) ) ( not ( = ?auto_580327 ?auto_580328 ) ) ( not ( = ?auto_580327 ?auto_580329 ) ) ( not ( = ?auto_580327 ?auto_580330 ) ) ( not ( = ?auto_580327 ?auto_580331 ) ) ( not ( = ?auto_580327 ?auto_580332 ) ) ( not ( = ?auto_580327 ?auto_580333 ) ) ( not ( = ?auto_580327 ?auto_580334 ) ) ( not ( = ?auto_580328 ?auto_580329 ) ) ( not ( = ?auto_580328 ?auto_580330 ) ) ( not ( = ?auto_580328 ?auto_580331 ) ) ( not ( = ?auto_580328 ?auto_580332 ) ) ( not ( = ?auto_580328 ?auto_580333 ) ) ( not ( = ?auto_580328 ?auto_580334 ) ) ( not ( = ?auto_580329 ?auto_580330 ) ) ( not ( = ?auto_580329 ?auto_580331 ) ) ( not ( = ?auto_580329 ?auto_580332 ) ) ( not ( = ?auto_580329 ?auto_580333 ) ) ( not ( = ?auto_580329 ?auto_580334 ) ) ( not ( = ?auto_580330 ?auto_580331 ) ) ( not ( = ?auto_580330 ?auto_580332 ) ) ( not ( = ?auto_580330 ?auto_580333 ) ) ( not ( = ?auto_580330 ?auto_580334 ) ) ( not ( = ?auto_580331 ?auto_580332 ) ) ( not ( = ?auto_580331 ?auto_580333 ) ) ( not ( = ?auto_580331 ?auto_580334 ) ) ( not ( = ?auto_580332 ?auto_580333 ) ) ( not ( = ?auto_580332 ?auto_580334 ) ) ( not ( = ?auto_580333 ?auto_580334 ) ) ( ON ?auto_580332 ?auto_580333 ) ( ON ?auto_580331 ?auto_580332 ) ( ON ?auto_580330 ?auto_580331 ) ( ON ?auto_580329 ?auto_580330 ) ( ON ?auto_580328 ?auto_580329 ) ( CLEAR ?auto_580326 ) ( ON ?auto_580327 ?auto_580328 ) ( CLEAR ?auto_580327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_580322 ?auto_580323 ?auto_580324 ?auto_580325 ?auto_580326 ?auto_580327 )
      ( MAKE-12PILE ?auto_580322 ?auto_580323 ?auto_580324 ?auto_580325 ?auto_580326 ?auto_580327 ?auto_580328 ?auto_580329 ?auto_580330 ?auto_580331 ?auto_580332 ?auto_580333 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_580372 - BLOCK
      ?auto_580373 - BLOCK
      ?auto_580374 - BLOCK
      ?auto_580375 - BLOCK
      ?auto_580376 - BLOCK
      ?auto_580377 - BLOCK
      ?auto_580378 - BLOCK
      ?auto_580379 - BLOCK
      ?auto_580380 - BLOCK
      ?auto_580381 - BLOCK
      ?auto_580382 - BLOCK
      ?auto_580383 - BLOCK
    )
    :vars
    (
      ?auto_580384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580383 ?auto_580384 ) ( ON-TABLE ?auto_580372 ) ( ON ?auto_580373 ?auto_580372 ) ( ON ?auto_580374 ?auto_580373 ) ( ON ?auto_580375 ?auto_580374 ) ( not ( = ?auto_580372 ?auto_580373 ) ) ( not ( = ?auto_580372 ?auto_580374 ) ) ( not ( = ?auto_580372 ?auto_580375 ) ) ( not ( = ?auto_580372 ?auto_580376 ) ) ( not ( = ?auto_580372 ?auto_580377 ) ) ( not ( = ?auto_580372 ?auto_580378 ) ) ( not ( = ?auto_580372 ?auto_580379 ) ) ( not ( = ?auto_580372 ?auto_580380 ) ) ( not ( = ?auto_580372 ?auto_580381 ) ) ( not ( = ?auto_580372 ?auto_580382 ) ) ( not ( = ?auto_580372 ?auto_580383 ) ) ( not ( = ?auto_580372 ?auto_580384 ) ) ( not ( = ?auto_580373 ?auto_580374 ) ) ( not ( = ?auto_580373 ?auto_580375 ) ) ( not ( = ?auto_580373 ?auto_580376 ) ) ( not ( = ?auto_580373 ?auto_580377 ) ) ( not ( = ?auto_580373 ?auto_580378 ) ) ( not ( = ?auto_580373 ?auto_580379 ) ) ( not ( = ?auto_580373 ?auto_580380 ) ) ( not ( = ?auto_580373 ?auto_580381 ) ) ( not ( = ?auto_580373 ?auto_580382 ) ) ( not ( = ?auto_580373 ?auto_580383 ) ) ( not ( = ?auto_580373 ?auto_580384 ) ) ( not ( = ?auto_580374 ?auto_580375 ) ) ( not ( = ?auto_580374 ?auto_580376 ) ) ( not ( = ?auto_580374 ?auto_580377 ) ) ( not ( = ?auto_580374 ?auto_580378 ) ) ( not ( = ?auto_580374 ?auto_580379 ) ) ( not ( = ?auto_580374 ?auto_580380 ) ) ( not ( = ?auto_580374 ?auto_580381 ) ) ( not ( = ?auto_580374 ?auto_580382 ) ) ( not ( = ?auto_580374 ?auto_580383 ) ) ( not ( = ?auto_580374 ?auto_580384 ) ) ( not ( = ?auto_580375 ?auto_580376 ) ) ( not ( = ?auto_580375 ?auto_580377 ) ) ( not ( = ?auto_580375 ?auto_580378 ) ) ( not ( = ?auto_580375 ?auto_580379 ) ) ( not ( = ?auto_580375 ?auto_580380 ) ) ( not ( = ?auto_580375 ?auto_580381 ) ) ( not ( = ?auto_580375 ?auto_580382 ) ) ( not ( = ?auto_580375 ?auto_580383 ) ) ( not ( = ?auto_580375 ?auto_580384 ) ) ( not ( = ?auto_580376 ?auto_580377 ) ) ( not ( = ?auto_580376 ?auto_580378 ) ) ( not ( = ?auto_580376 ?auto_580379 ) ) ( not ( = ?auto_580376 ?auto_580380 ) ) ( not ( = ?auto_580376 ?auto_580381 ) ) ( not ( = ?auto_580376 ?auto_580382 ) ) ( not ( = ?auto_580376 ?auto_580383 ) ) ( not ( = ?auto_580376 ?auto_580384 ) ) ( not ( = ?auto_580377 ?auto_580378 ) ) ( not ( = ?auto_580377 ?auto_580379 ) ) ( not ( = ?auto_580377 ?auto_580380 ) ) ( not ( = ?auto_580377 ?auto_580381 ) ) ( not ( = ?auto_580377 ?auto_580382 ) ) ( not ( = ?auto_580377 ?auto_580383 ) ) ( not ( = ?auto_580377 ?auto_580384 ) ) ( not ( = ?auto_580378 ?auto_580379 ) ) ( not ( = ?auto_580378 ?auto_580380 ) ) ( not ( = ?auto_580378 ?auto_580381 ) ) ( not ( = ?auto_580378 ?auto_580382 ) ) ( not ( = ?auto_580378 ?auto_580383 ) ) ( not ( = ?auto_580378 ?auto_580384 ) ) ( not ( = ?auto_580379 ?auto_580380 ) ) ( not ( = ?auto_580379 ?auto_580381 ) ) ( not ( = ?auto_580379 ?auto_580382 ) ) ( not ( = ?auto_580379 ?auto_580383 ) ) ( not ( = ?auto_580379 ?auto_580384 ) ) ( not ( = ?auto_580380 ?auto_580381 ) ) ( not ( = ?auto_580380 ?auto_580382 ) ) ( not ( = ?auto_580380 ?auto_580383 ) ) ( not ( = ?auto_580380 ?auto_580384 ) ) ( not ( = ?auto_580381 ?auto_580382 ) ) ( not ( = ?auto_580381 ?auto_580383 ) ) ( not ( = ?auto_580381 ?auto_580384 ) ) ( not ( = ?auto_580382 ?auto_580383 ) ) ( not ( = ?auto_580382 ?auto_580384 ) ) ( not ( = ?auto_580383 ?auto_580384 ) ) ( ON ?auto_580382 ?auto_580383 ) ( ON ?auto_580381 ?auto_580382 ) ( ON ?auto_580380 ?auto_580381 ) ( ON ?auto_580379 ?auto_580380 ) ( ON ?auto_580378 ?auto_580379 ) ( ON ?auto_580377 ?auto_580378 ) ( CLEAR ?auto_580375 ) ( ON ?auto_580376 ?auto_580377 ) ( CLEAR ?auto_580376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_580372 ?auto_580373 ?auto_580374 ?auto_580375 ?auto_580376 )
      ( MAKE-12PILE ?auto_580372 ?auto_580373 ?auto_580374 ?auto_580375 ?auto_580376 ?auto_580377 ?auto_580378 ?auto_580379 ?auto_580380 ?auto_580381 ?auto_580382 ?auto_580383 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_580422 - BLOCK
      ?auto_580423 - BLOCK
      ?auto_580424 - BLOCK
      ?auto_580425 - BLOCK
      ?auto_580426 - BLOCK
      ?auto_580427 - BLOCK
      ?auto_580428 - BLOCK
      ?auto_580429 - BLOCK
      ?auto_580430 - BLOCK
      ?auto_580431 - BLOCK
      ?auto_580432 - BLOCK
      ?auto_580433 - BLOCK
    )
    :vars
    (
      ?auto_580434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580433 ?auto_580434 ) ( ON-TABLE ?auto_580422 ) ( ON ?auto_580423 ?auto_580422 ) ( ON ?auto_580424 ?auto_580423 ) ( not ( = ?auto_580422 ?auto_580423 ) ) ( not ( = ?auto_580422 ?auto_580424 ) ) ( not ( = ?auto_580422 ?auto_580425 ) ) ( not ( = ?auto_580422 ?auto_580426 ) ) ( not ( = ?auto_580422 ?auto_580427 ) ) ( not ( = ?auto_580422 ?auto_580428 ) ) ( not ( = ?auto_580422 ?auto_580429 ) ) ( not ( = ?auto_580422 ?auto_580430 ) ) ( not ( = ?auto_580422 ?auto_580431 ) ) ( not ( = ?auto_580422 ?auto_580432 ) ) ( not ( = ?auto_580422 ?auto_580433 ) ) ( not ( = ?auto_580422 ?auto_580434 ) ) ( not ( = ?auto_580423 ?auto_580424 ) ) ( not ( = ?auto_580423 ?auto_580425 ) ) ( not ( = ?auto_580423 ?auto_580426 ) ) ( not ( = ?auto_580423 ?auto_580427 ) ) ( not ( = ?auto_580423 ?auto_580428 ) ) ( not ( = ?auto_580423 ?auto_580429 ) ) ( not ( = ?auto_580423 ?auto_580430 ) ) ( not ( = ?auto_580423 ?auto_580431 ) ) ( not ( = ?auto_580423 ?auto_580432 ) ) ( not ( = ?auto_580423 ?auto_580433 ) ) ( not ( = ?auto_580423 ?auto_580434 ) ) ( not ( = ?auto_580424 ?auto_580425 ) ) ( not ( = ?auto_580424 ?auto_580426 ) ) ( not ( = ?auto_580424 ?auto_580427 ) ) ( not ( = ?auto_580424 ?auto_580428 ) ) ( not ( = ?auto_580424 ?auto_580429 ) ) ( not ( = ?auto_580424 ?auto_580430 ) ) ( not ( = ?auto_580424 ?auto_580431 ) ) ( not ( = ?auto_580424 ?auto_580432 ) ) ( not ( = ?auto_580424 ?auto_580433 ) ) ( not ( = ?auto_580424 ?auto_580434 ) ) ( not ( = ?auto_580425 ?auto_580426 ) ) ( not ( = ?auto_580425 ?auto_580427 ) ) ( not ( = ?auto_580425 ?auto_580428 ) ) ( not ( = ?auto_580425 ?auto_580429 ) ) ( not ( = ?auto_580425 ?auto_580430 ) ) ( not ( = ?auto_580425 ?auto_580431 ) ) ( not ( = ?auto_580425 ?auto_580432 ) ) ( not ( = ?auto_580425 ?auto_580433 ) ) ( not ( = ?auto_580425 ?auto_580434 ) ) ( not ( = ?auto_580426 ?auto_580427 ) ) ( not ( = ?auto_580426 ?auto_580428 ) ) ( not ( = ?auto_580426 ?auto_580429 ) ) ( not ( = ?auto_580426 ?auto_580430 ) ) ( not ( = ?auto_580426 ?auto_580431 ) ) ( not ( = ?auto_580426 ?auto_580432 ) ) ( not ( = ?auto_580426 ?auto_580433 ) ) ( not ( = ?auto_580426 ?auto_580434 ) ) ( not ( = ?auto_580427 ?auto_580428 ) ) ( not ( = ?auto_580427 ?auto_580429 ) ) ( not ( = ?auto_580427 ?auto_580430 ) ) ( not ( = ?auto_580427 ?auto_580431 ) ) ( not ( = ?auto_580427 ?auto_580432 ) ) ( not ( = ?auto_580427 ?auto_580433 ) ) ( not ( = ?auto_580427 ?auto_580434 ) ) ( not ( = ?auto_580428 ?auto_580429 ) ) ( not ( = ?auto_580428 ?auto_580430 ) ) ( not ( = ?auto_580428 ?auto_580431 ) ) ( not ( = ?auto_580428 ?auto_580432 ) ) ( not ( = ?auto_580428 ?auto_580433 ) ) ( not ( = ?auto_580428 ?auto_580434 ) ) ( not ( = ?auto_580429 ?auto_580430 ) ) ( not ( = ?auto_580429 ?auto_580431 ) ) ( not ( = ?auto_580429 ?auto_580432 ) ) ( not ( = ?auto_580429 ?auto_580433 ) ) ( not ( = ?auto_580429 ?auto_580434 ) ) ( not ( = ?auto_580430 ?auto_580431 ) ) ( not ( = ?auto_580430 ?auto_580432 ) ) ( not ( = ?auto_580430 ?auto_580433 ) ) ( not ( = ?auto_580430 ?auto_580434 ) ) ( not ( = ?auto_580431 ?auto_580432 ) ) ( not ( = ?auto_580431 ?auto_580433 ) ) ( not ( = ?auto_580431 ?auto_580434 ) ) ( not ( = ?auto_580432 ?auto_580433 ) ) ( not ( = ?auto_580432 ?auto_580434 ) ) ( not ( = ?auto_580433 ?auto_580434 ) ) ( ON ?auto_580432 ?auto_580433 ) ( ON ?auto_580431 ?auto_580432 ) ( ON ?auto_580430 ?auto_580431 ) ( ON ?auto_580429 ?auto_580430 ) ( ON ?auto_580428 ?auto_580429 ) ( ON ?auto_580427 ?auto_580428 ) ( ON ?auto_580426 ?auto_580427 ) ( CLEAR ?auto_580424 ) ( ON ?auto_580425 ?auto_580426 ) ( CLEAR ?auto_580425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_580422 ?auto_580423 ?auto_580424 ?auto_580425 )
      ( MAKE-12PILE ?auto_580422 ?auto_580423 ?auto_580424 ?auto_580425 ?auto_580426 ?auto_580427 ?auto_580428 ?auto_580429 ?auto_580430 ?auto_580431 ?auto_580432 ?auto_580433 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_580472 - BLOCK
      ?auto_580473 - BLOCK
      ?auto_580474 - BLOCK
      ?auto_580475 - BLOCK
      ?auto_580476 - BLOCK
      ?auto_580477 - BLOCK
      ?auto_580478 - BLOCK
      ?auto_580479 - BLOCK
      ?auto_580480 - BLOCK
      ?auto_580481 - BLOCK
      ?auto_580482 - BLOCK
      ?auto_580483 - BLOCK
    )
    :vars
    (
      ?auto_580484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580483 ?auto_580484 ) ( ON-TABLE ?auto_580472 ) ( ON ?auto_580473 ?auto_580472 ) ( not ( = ?auto_580472 ?auto_580473 ) ) ( not ( = ?auto_580472 ?auto_580474 ) ) ( not ( = ?auto_580472 ?auto_580475 ) ) ( not ( = ?auto_580472 ?auto_580476 ) ) ( not ( = ?auto_580472 ?auto_580477 ) ) ( not ( = ?auto_580472 ?auto_580478 ) ) ( not ( = ?auto_580472 ?auto_580479 ) ) ( not ( = ?auto_580472 ?auto_580480 ) ) ( not ( = ?auto_580472 ?auto_580481 ) ) ( not ( = ?auto_580472 ?auto_580482 ) ) ( not ( = ?auto_580472 ?auto_580483 ) ) ( not ( = ?auto_580472 ?auto_580484 ) ) ( not ( = ?auto_580473 ?auto_580474 ) ) ( not ( = ?auto_580473 ?auto_580475 ) ) ( not ( = ?auto_580473 ?auto_580476 ) ) ( not ( = ?auto_580473 ?auto_580477 ) ) ( not ( = ?auto_580473 ?auto_580478 ) ) ( not ( = ?auto_580473 ?auto_580479 ) ) ( not ( = ?auto_580473 ?auto_580480 ) ) ( not ( = ?auto_580473 ?auto_580481 ) ) ( not ( = ?auto_580473 ?auto_580482 ) ) ( not ( = ?auto_580473 ?auto_580483 ) ) ( not ( = ?auto_580473 ?auto_580484 ) ) ( not ( = ?auto_580474 ?auto_580475 ) ) ( not ( = ?auto_580474 ?auto_580476 ) ) ( not ( = ?auto_580474 ?auto_580477 ) ) ( not ( = ?auto_580474 ?auto_580478 ) ) ( not ( = ?auto_580474 ?auto_580479 ) ) ( not ( = ?auto_580474 ?auto_580480 ) ) ( not ( = ?auto_580474 ?auto_580481 ) ) ( not ( = ?auto_580474 ?auto_580482 ) ) ( not ( = ?auto_580474 ?auto_580483 ) ) ( not ( = ?auto_580474 ?auto_580484 ) ) ( not ( = ?auto_580475 ?auto_580476 ) ) ( not ( = ?auto_580475 ?auto_580477 ) ) ( not ( = ?auto_580475 ?auto_580478 ) ) ( not ( = ?auto_580475 ?auto_580479 ) ) ( not ( = ?auto_580475 ?auto_580480 ) ) ( not ( = ?auto_580475 ?auto_580481 ) ) ( not ( = ?auto_580475 ?auto_580482 ) ) ( not ( = ?auto_580475 ?auto_580483 ) ) ( not ( = ?auto_580475 ?auto_580484 ) ) ( not ( = ?auto_580476 ?auto_580477 ) ) ( not ( = ?auto_580476 ?auto_580478 ) ) ( not ( = ?auto_580476 ?auto_580479 ) ) ( not ( = ?auto_580476 ?auto_580480 ) ) ( not ( = ?auto_580476 ?auto_580481 ) ) ( not ( = ?auto_580476 ?auto_580482 ) ) ( not ( = ?auto_580476 ?auto_580483 ) ) ( not ( = ?auto_580476 ?auto_580484 ) ) ( not ( = ?auto_580477 ?auto_580478 ) ) ( not ( = ?auto_580477 ?auto_580479 ) ) ( not ( = ?auto_580477 ?auto_580480 ) ) ( not ( = ?auto_580477 ?auto_580481 ) ) ( not ( = ?auto_580477 ?auto_580482 ) ) ( not ( = ?auto_580477 ?auto_580483 ) ) ( not ( = ?auto_580477 ?auto_580484 ) ) ( not ( = ?auto_580478 ?auto_580479 ) ) ( not ( = ?auto_580478 ?auto_580480 ) ) ( not ( = ?auto_580478 ?auto_580481 ) ) ( not ( = ?auto_580478 ?auto_580482 ) ) ( not ( = ?auto_580478 ?auto_580483 ) ) ( not ( = ?auto_580478 ?auto_580484 ) ) ( not ( = ?auto_580479 ?auto_580480 ) ) ( not ( = ?auto_580479 ?auto_580481 ) ) ( not ( = ?auto_580479 ?auto_580482 ) ) ( not ( = ?auto_580479 ?auto_580483 ) ) ( not ( = ?auto_580479 ?auto_580484 ) ) ( not ( = ?auto_580480 ?auto_580481 ) ) ( not ( = ?auto_580480 ?auto_580482 ) ) ( not ( = ?auto_580480 ?auto_580483 ) ) ( not ( = ?auto_580480 ?auto_580484 ) ) ( not ( = ?auto_580481 ?auto_580482 ) ) ( not ( = ?auto_580481 ?auto_580483 ) ) ( not ( = ?auto_580481 ?auto_580484 ) ) ( not ( = ?auto_580482 ?auto_580483 ) ) ( not ( = ?auto_580482 ?auto_580484 ) ) ( not ( = ?auto_580483 ?auto_580484 ) ) ( ON ?auto_580482 ?auto_580483 ) ( ON ?auto_580481 ?auto_580482 ) ( ON ?auto_580480 ?auto_580481 ) ( ON ?auto_580479 ?auto_580480 ) ( ON ?auto_580478 ?auto_580479 ) ( ON ?auto_580477 ?auto_580478 ) ( ON ?auto_580476 ?auto_580477 ) ( ON ?auto_580475 ?auto_580476 ) ( CLEAR ?auto_580473 ) ( ON ?auto_580474 ?auto_580475 ) ( CLEAR ?auto_580474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_580472 ?auto_580473 ?auto_580474 )
      ( MAKE-12PILE ?auto_580472 ?auto_580473 ?auto_580474 ?auto_580475 ?auto_580476 ?auto_580477 ?auto_580478 ?auto_580479 ?auto_580480 ?auto_580481 ?auto_580482 ?auto_580483 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_580522 - BLOCK
      ?auto_580523 - BLOCK
      ?auto_580524 - BLOCK
      ?auto_580525 - BLOCK
      ?auto_580526 - BLOCK
      ?auto_580527 - BLOCK
      ?auto_580528 - BLOCK
      ?auto_580529 - BLOCK
      ?auto_580530 - BLOCK
      ?auto_580531 - BLOCK
      ?auto_580532 - BLOCK
      ?auto_580533 - BLOCK
    )
    :vars
    (
      ?auto_580534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580533 ?auto_580534 ) ( ON-TABLE ?auto_580522 ) ( not ( = ?auto_580522 ?auto_580523 ) ) ( not ( = ?auto_580522 ?auto_580524 ) ) ( not ( = ?auto_580522 ?auto_580525 ) ) ( not ( = ?auto_580522 ?auto_580526 ) ) ( not ( = ?auto_580522 ?auto_580527 ) ) ( not ( = ?auto_580522 ?auto_580528 ) ) ( not ( = ?auto_580522 ?auto_580529 ) ) ( not ( = ?auto_580522 ?auto_580530 ) ) ( not ( = ?auto_580522 ?auto_580531 ) ) ( not ( = ?auto_580522 ?auto_580532 ) ) ( not ( = ?auto_580522 ?auto_580533 ) ) ( not ( = ?auto_580522 ?auto_580534 ) ) ( not ( = ?auto_580523 ?auto_580524 ) ) ( not ( = ?auto_580523 ?auto_580525 ) ) ( not ( = ?auto_580523 ?auto_580526 ) ) ( not ( = ?auto_580523 ?auto_580527 ) ) ( not ( = ?auto_580523 ?auto_580528 ) ) ( not ( = ?auto_580523 ?auto_580529 ) ) ( not ( = ?auto_580523 ?auto_580530 ) ) ( not ( = ?auto_580523 ?auto_580531 ) ) ( not ( = ?auto_580523 ?auto_580532 ) ) ( not ( = ?auto_580523 ?auto_580533 ) ) ( not ( = ?auto_580523 ?auto_580534 ) ) ( not ( = ?auto_580524 ?auto_580525 ) ) ( not ( = ?auto_580524 ?auto_580526 ) ) ( not ( = ?auto_580524 ?auto_580527 ) ) ( not ( = ?auto_580524 ?auto_580528 ) ) ( not ( = ?auto_580524 ?auto_580529 ) ) ( not ( = ?auto_580524 ?auto_580530 ) ) ( not ( = ?auto_580524 ?auto_580531 ) ) ( not ( = ?auto_580524 ?auto_580532 ) ) ( not ( = ?auto_580524 ?auto_580533 ) ) ( not ( = ?auto_580524 ?auto_580534 ) ) ( not ( = ?auto_580525 ?auto_580526 ) ) ( not ( = ?auto_580525 ?auto_580527 ) ) ( not ( = ?auto_580525 ?auto_580528 ) ) ( not ( = ?auto_580525 ?auto_580529 ) ) ( not ( = ?auto_580525 ?auto_580530 ) ) ( not ( = ?auto_580525 ?auto_580531 ) ) ( not ( = ?auto_580525 ?auto_580532 ) ) ( not ( = ?auto_580525 ?auto_580533 ) ) ( not ( = ?auto_580525 ?auto_580534 ) ) ( not ( = ?auto_580526 ?auto_580527 ) ) ( not ( = ?auto_580526 ?auto_580528 ) ) ( not ( = ?auto_580526 ?auto_580529 ) ) ( not ( = ?auto_580526 ?auto_580530 ) ) ( not ( = ?auto_580526 ?auto_580531 ) ) ( not ( = ?auto_580526 ?auto_580532 ) ) ( not ( = ?auto_580526 ?auto_580533 ) ) ( not ( = ?auto_580526 ?auto_580534 ) ) ( not ( = ?auto_580527 ?auto_580528 ) ) ( not ( = ?auto_580527 ?auto_580529 ) ) ( not ( = ?auto_580527 ?auto_580530 ) ) ( not ( = ?auto_580527 ?auto_580531 ) ) ( not ( = ?auto_580527 ?auto_580532 ) ) ( not ( = ?auto_580527 ?auto_580533 ) ) ( not ( = ?auto_580527 ?auto_580534 ) ) ( not ( = ?auto_580528 ?auto_580529 ) ) ( not ( = ?auto_580528 ?auto_580530 ) ) ( not ( = ?auto_580528 ?auto_580531 ) ) ( not ( = ?auto_580528 ?auto_580532 ) ) ( not ( = ?auto_580528 ?auto_580533 ) ) ( not ( = ?auto_580528 ?auto_580534 ) ) ( not ( = ?auto_580529 ?auto_580530 ) ) ( not ( = ?auto_580529 ?auto_580531 ) ) ( not ( = ?auto_580529 ?auto_580532 ) ) ( not ( = ?auto_580529 ?auto_580533 ) ) ( not ( = ?auto_580529 ?auto_580534 ) ) ( not ( = ?auto_580530 ?auto_580531 ) ) ( not ( = ?auto_580530 ?auto_580532 ) ) ( not ( = ?auto_580530 ?auto_580533 ) ) ( not ( = ?auto_580530 ?auto_580534 ) ) ( not ( = ?auto_580531 ?auto_580532 ) ) ( not ( = ?auto_580531 ?auto_580533 ) ) ( not ( = ?auto_580531 ?auto_580534 ) ) ( not ( = ?auto_580532 ?auto_580533 ) ) ( not ( = ?auto_580532 ?auto_580534 ) ) ( not ( = ?auto_580533 ?auto_580534 ) ) ( ON ?auto_580532 ?auto_580533 ) ( ON ?auto_580531 ?auto_580532 ) ( ON ?auto_580530 ?auto_580531 ) ( ON ?auto_580529 ?auto_580530 ) ( ON ?auto_580528 ?auto_580529 ) ( ON ?auto_580527 ?auto_580528 ) ( ON ?auto_580526 ?auto_580527 ) ( ON ?auto_580525 ?auto_580526 ) ( ON ?auto_580524 ?auto_580525 ) ( CLEAR ?auto_580522 ) ( ON ?auto_580523 ?auto_580524 ) ( CLEAR ?auto_580523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_580522 ?auto_580523 )
      ( MAKE-12PILE ?auto_580522 ?auto_580523 ?auto_580524 ?auto_580525 ?auto_580526 ?auto_580527 ?auto_580528 ?auto_580529 ?auto_580530 ?auto_580531 ?auto_580532 ?auto_580533 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_580572 - BLOCK
      ?auto_580573 - BLOCK
      ?auto_580574 - BLOCK
      ?auto_580575 - BLOCK
      ?auto_580576 - BLOCK
      ?auto_580577 - BLOCK
      ?auto_580578 - BLOCK
      ?auto_580579 - BLOCK
      ?auto_580580 - BLOCK
      ?auto_580581 - BLOCK
      ?auto_580582 - BLOCK
      ?auto_580583 - BLOCK
    )
    :vars
    (
      ?auto_580584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580583 ?auto_580584 ) ( not ( = ?auto_580572 ?auto_580573 ) ) ( not ( = ?auto_580572 ?auto_580574 ) ) ( not ( = ?auto_580572 ?auto_580575 ) ) ( not ( = ?auto_580572 ?auto_580576 ) ) ( not ( = ?auto_580572 ?auto_580577 ) ) ( not ( = ?auto_580572 ?auto_580578 ) ) ( not ( = ?auto_580572 ?auto_580579 ) ) ( not ( = ?auto_580572 ?auto_580580 ) ) ( not ( = ?auto_580572 ?auto_580581 ) ) ( not ( = ?auto_580572 ?auto_580582 ) ) ( not ( = ?auto_580572 ?auto_580583 ) ) ( not ( = ?auto_580572 ?auto_580584 ) ) ( not ( = ?auto_580573 ?auto_580574 ) ) ( not ( = ?auto_580573 ?auto_580575 ) ) ( not ( = ?auto_580573 ?auto_580576 ) ) ( not ( = ?auto_580573 ?auto_580577 ) ) ( not ( = ?auto_580573 ?auto_580578 ) ) ( not ( = ?auto_580573 ?auto_580579 ) ) ( not ( = ?auto_580573 ?auto_580580 ) ) ( not ( = ?auto_580573 ?auto_580581 ) ) ( not ( = ?auto_580573 ?auto_580582 ) ) ( not ( = ?auto_580573 ?auto_580583 ) ) ( not ( = ?auto_580573 ?auto_580584 ) ) ( not ( = ?auto_580574 ?auto_580575 ) ) ( not ( = ?auto_580574 ?auto_580576 ) ) ( not ( = ?auto_580574 ?auto_580577 ) ) ( not ( = ?auto_580574 ?auto_580578 ) ) ( not ( = ?auto_580574 ?auto_580579 ) ) ( not ( = ?auto_580574 ?auto_580580 ) ) ( not ( = ?auto_580574 ?auto_580581 ) ) ( not ( = ?auto_580574 ?auto_580582 ) ) ( not ( = ?auto_580574 ?auto_580583 ) ) ( not ( = ?auto_580574 ?auto_580584 ) ) ( not ( = ?auto_580575 ?auto_580576 ) ) ( not ( = ?auto_580575 ?auto_580577 ) ) ( not ( = ?auto_580575 ?auto_580578 ) ) ( not ( = ?auto_580575 ?auto_580579 ) ) ( not ( = ?auto_580575 ?auto_580580 ) ) ( not ( = ?auto_580575 ?auto_580581 ) ) ( not ( = ?auto_580575 ?auto_580582 ) ) ( not ( = ?auto_580575 ?auto_580583 ) ) ( not ( = ?auto_580575 ?auto_580584 ) ) ( not ( = ?auto_580576 ?auto_580577 ) ) ( not ( = ?auto_580576 ?auto_580578 ) ) ( not ( = ?auto_580576 ?auto_580579 ) ) ( not ( = ?auto_580576 ?auto_580580 ) ) ( not ( = ?auto_580576 ?auto_580581 ) ) ( not ( = ?auto_580576 ?auto_580582 ) ) ( not ( = ?auto_580576 ?auto_580583 ) ) ( not ( = ?auto_580576 ?auto_580584 ) ) ( not ( = ?auto_580577 ?auto_580578 ) ) ( not ( = ?auto_580577 ?auto_580579 ) ) ( not ( = ?auto_580577 ?auto_580580 ) ) ( not ( = ?auto_580577 ?auto_580581 ) ) ( not ( = ?auto_580577 ?auto_580582 ) ) ( not ( = ?auto_580577 ?auto_580583 ) ) ( not ( = ?auto_580577 ?auto_580584 ) ) ( not ( = ?auto_580578 ?auto_580579 ) ) ( not ( = ?auto_580578 ?auto_580580 ) ) ( not ( = ?auto_580578 ?auto_580581 ) ) ( not ( = ?auto_580578 ?auto_580582 ) ) ( not ( = ?auto_580578 ?auto_580583 ) ) ( not ( = ?auto_580578 ?auto_580584 ) ) ( not ( = ?auto_580579 ?auto_580580 ) ) ( not ( = ?auto_580579 ?auto_580581 ) ) ( not ( = ?auto_580579 ?auto_580582 ) ) ( not ( = ?auto_580579 ?auto_580583 ) ) ( not ( = ?auto_580579 ?auto_580584 ) ) ( not ( = ?auto_580580 ?auto_580581 ) ) ( not ( = ?auto_580580 ?auto_580582 ) ) ( not ( = ?auto_580580 ?auto_580583 ) ) ( not ( = ?auto_580580 ?auto_580584 ) ) ( not ( = ?auto_580581 ?auto_580582 ) ) ( not ( = ?auto_580581 ?auto_580583 ) ) ( not ( = ?auto_580581 ?auto_580584 ) ) ( not ( = ?auto_580582 ?auto_580583 ) ) ( not ( = ?auto_580582 ?auto_580584 ) ) ( not ( = ?auto_580583 ?auto_580584 ) ) ( ON ?auto_580582 ?auto_580583 ) ( ON ?auto_580581 ?auto_580582 ) ( ON ?auto_580580 ?auto_580581 ) ( ON ?auto_580579 ?auto_580580 ) ( ON ?auto_580578 ?auto_580579 ) ( ON ?auto_580577 ?auto_580578 ) ( ON ?auto_580576 ?auto_580577 ) ( ON ?auto_580575 ?auto_580576 ) ( ON ?auto_580574 ?auto_580575 ) ( ON ?auto_580573 ?auto_580574 ) ( ON ?auto_580572 ?auto_580573 ) ( CLEAR ?auto_580572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_580572 )
      ( MAKE-12PILE ?auto_580572 ?auto_580573 ?auto_580574 ?auto_580575 ?auto_580576 ?auto_580577 ?auto_580578 ?auto_580579 ?auto_580580 ?auto_580581 ?auto_580582 ?auto_580583 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_580623 - BLOCK
      ?auto_580624 - BLOCK
      ?auto_580625 - BLOCK
      ?auto_580626 - BLOCK
      ?auto_580627 - BLOCK
      ?auto_580628 - BLOCK
      ?auto_580629 - BLOCK
      ?auto_580630 - BLOCK
      ?auto_580631 - BLOCK
      ?auto_580632 - BLOCK
      ?auto_580633 - BLOCK
      ?auto_580634 - BLOCK
      ?auto_580635 - BLOCK
    )
    :vars
    (
      ?auto_580636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_580634 ) ( ON ?auto_580635 ?auto_580636 ) ( CLEAR ?auto_580635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_580623 ) ( ON ?auto_580624 ?auto_580623 ) ( ON ?auto_580625 ?auto_580624 ) ( ON ?auto_580626 ?auto_580625 ) ( ON ?auto_580627 ?auto_580626 ) ( ON ?auto_580628 ?auto_580627 ) ( ON ?auto_580629 ?auto_580628 ) ( ON ?auto_580630 ?auto_580629 ) ( ON ?auto_580631 ?auto_580630 ) ( ON ?auto_580632 ?auto_580631 ) ( ON ?auto_580633 ?auto_580632 ) ( ON ?auto_580634 ?auto_580633 ) ( not ( = ?auto_580623 ?auto_580624 ) ) ( not ( = ?auto_580623 ?auto_580625 ) ) ( not ( = ?auto_580623 ?auto_580626 ) ) ( not ( = ?auto_580623 ?auto_580627 ) ) ( not ( = ?auto_580623 ?auto_580628 ) ) ( not ( = ?auto_580623 ?auto_580629 ) ) ( not ( = ?auto_580623 ?auto_580630 ) ) ( not ( = ?auto_580623 ?auto_580631 ) ) ( not ( = ?auto_580623 ?auto_580632 ) ) ( not ( = ?auto_580623 ?auto_580633 ) ) ( not ( = ?auto_580623 ?auto_580634 ) ) ( not ( = ?auto_580623 ?auto_580635 ) ) ( not ( = ?auto_580623 ?auto_580636 ) ) ( not ( = ?auto_580624 ?auto_580625 ) ) ( not ( = ?auto_580624 ?auto_580626 ) ) ( not ( = ?auto_580624 ?auto_580627 ) ) ( not ( = ?auto_580624 ?auto_580628 ) ) ( not ( = ?auto_580624 ?auto_580629 ) ) ( not ( = ?auto_580624 ?auto_580630 ) ) ( not ( = ?auto_580624 ?auto_580631 ) ) ( not ( = ?auto_580624 ?auto_580632 ) ) ( not ( = ?auto_580624 ?auto_580633 ) ) ( not ( = ?auto_580624 ?auto_580634 ) ) ( not ( = ?auto_580624 ?auto_580635 ) ) ( not ( = ?auto_580624 ?auto_580636 ) ) ( not ( = ?auto_580625 ?auto_580626 ) ) ( not ( = ?auto_580625 ?auto_580627 ) ) ( not ( = ?auto_580625 ?auto_580628 ) ) ( not ( = ?auto_580625 ?auto_580629 ) ) ( not ( = ?auto_580625 ?auto_580630 ) ) ( not ( = ?auto_580625 ?auto_580631 ) ) ( not ( = ?auto_580625 ?auto_580632 ) ) ( not ( = ?auto_580625 ?auto_580633 ) ) ( not ( = ?auto_580625 ?auto_580634 ) ) ( not ( = ?auto_580625 ?auto_580635 ) ) ( not ( = ?auto_580625 ?auto_580636 ) ) ( not ( = ?auto_580626 ?auto_580627 ) ) ( not ( = ?auto_580626 ?auto_580628 ) ) ( not ( = ?auto_580626 ?auto_580629 ) ) ( not ( = ?auto_580626 ?auto_580630 ) ) ( not ( = ?auto_580626 ?auto_580631 ) ) ( not ( = ?auto_580626 ?auto_580632 ) ) ( not ( = ?auto_580626 ?auto_580633 ) ) ( not ( = ?auto_580626 ?auto_580634 ) ) ( not ( = ?auto_580626 ?auto_580635 ) ) ( not ( = ?auto_580626 ?auto_580636 ) ) ( not ( = ?auto_580627 ?auto_580628 ) ) ( not ( = ?auto_580627 ?auto_580629 ) ) ( not ( = ?auto_580627 ?auto_580630 ) ) ( not ( = ?auto_580627 ?auto_580631 ) ) ( not ( = ?auto_580627 ?auto_580632 ) ) ( not ( = ?auto_580627 ?auto_580633 ) ) ( not ( = ?auto_580627 ?auto_580634 ) ) ( not ( = ?auto_580627 ?auto_580635 ) ) ( not ( = ?auto_580627 ?auto_580636 ) ) ( not ( = ?auto_580628 ?auto_580629 ) ) ( not ( = ?auto_580628 ?auto_580630 ) ) ( not ( = ?auto_580628 ?auto_580631 ) ) ( not ( = ?auto_580628 ?auto_580632 ) ) ( not ( = ?auto_580628 ?auto_580633 ) ) ( not ( = ?auto_580628 ?auto_580634 ) ) ( not ( = ?auto_580628 ?auto_580635 ) ) ( not ( = ?auto_580628 ?auto_580636 ) ) ( not ( = ?auto_580629 ?auto_580630 ) ) ( not ( = ?auto_580629 ?auto_580631 ) ) ( not ( = ?auto_580629 ?auto_580632 ) ) ( not ( = ?auto_580629 ?auto_580633 ) ) ( not ( = ?auto_580629 ?auto_580634 ) ) ( not ( = ?auto_580629 ?auto_580635 ) ) ( not ( = ?auto_580629 ?auto_580636 ) ) ( not ( = ?auto_580630 ?auto_580631 ) ) ( not ( = ?auto_580630 ?auto_580632 ) ) ( not ( = ?auto_580630 ?auto_580633 ) ) ( not ( = ?auto_580630 ?auto_580634 ) ) ( not ( = ?auto_580630 ?auto_580635 ) ) ( not ( = ?auto_580630 ?auto_580636 ) ) ( not ( = ?auto_580631 ?auto_580632 ) ) ( not ( = ?auto_580631 ?auto_580633 ) ) ( not ( = ?auto_580631 ?auto_580634 ) ) ( not ( = ?auto_580631 ?auto_580635 ) ) ( not ( = ?auto_580631 ?auto_580636 ) ) ( not ( = ?auto_580632 ?auto_580633 ) ) ( not ( = ?auto_580632 ?auto_580634 ) ) ( not ( = ?auto_580632 ?auto_580635 ) ) ( not ( = ?auto_580632 ?auto_580636 ) ) ( not ( = ?auto_580633 ?auto_580634 ) ) ( not ( = ?auto_580633 ?auto_580635 ) ) ( not ( = ?auto_580633 ?auto_580636 ) ) ( not ( = ?auto_580634 ?auto_580635 ) ) ( not ( = ?auto_580634 ?auto_580636 ) ) ( not ( = ?auto_580635 ?auto_580636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_580635 ?auto_580636 )
      ( !STACK ?auto_580635 ?auto_580634 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_580677 - BLOCK
      ?auto_580678 - BLOCK
      ?auto_580679 - BLOCK
      ?auto_580680 - BLOCK
      ?auto_580681 - BLOCK
      ?auto_580682 - BLOCK
      ?auto_580683 - BLOCK
      ?auto_580684 - BLOCK
      ?auto_580685 - BLOCK
      ?auto_580686 - BLOCK
      ?auto_580687 - BLOCK
      ?auto_580688 - BLOCK
      ?auto_580689 - BLOCK
    )
    :vars
    (
      ?auto_580690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580689 ?auto_580690 ) ( ON-TABLE ?auto_580677 ) ( ON ?auto_580678 ?auto_580677 ) ( ON ?auto_580679 ?auto_580678 ) ( ON ?auto_580680 ?auto_580679 ) ( ON ?auto_580681 ?auto_580680 ) ( ON ?auto_580682 ?auto_580681 ) ( ON ?auto_580683 ?auto_580682 ) ( ON ?auto_580684 ?auto_580683 ) ( ON ?auto_580685 ?auto_580684 ) ( ON ?auto_580686 ?auto_580685 ) ( ON ?auto_580687 ?auto_580686 ) ( not ( = ?auto_580677 ?auto_580678 ) ) ( not ( = ?auto_580677 ?auto_580679 ) ) ( not ( = ?auto_580677 ?auto_580680 ) ) ( not ( = ?auto_580677 ?auto_580681 ) ) ( not ( = ?auto_580677 ?auto_580682 ) ) ( not ( = ?auto_580677 ?auto_580683 ) ) ( not ( = ?auto_580677 ?auto_580684 ) ) ( not ( = ?auto_580677 ?auto_580685 ) ) ( not ( = ?auto_580677 ?auto_580686 ) ) ( not ( = ?auto_580677 ?auto_580687 ) ) ( not ( = ?auto_580677 ?auto_580688 ) ) ( not ( = ?auto_580677 ?auto_580689 ) ) ( not ( = ?auto_580677 ?auto_580690 ) ) ( not ( = ?auto_580678 ?auto_580679 ) ) ( not ( = ?auto_580678 ?auto_580680 ) ) ( not ( = ?auto_580678 ?auto_580681 ) ) ( not ( = ?auto_580678 ?auto_580682 ) ) ( not ( = ?auto_580678 ?auto_580683 ) ) ( not ( = ?auto_580678 ?auto_580684 ) ) ( not ( = ?auto_580678 ?auto_580685 ) ) ( not ( = ?auto_580678 ?auto_580686 ) ) ( not ( = ?auto_580678 ?auto_580687 ) ) ( not ( = ?auto_580678 ?auto_580688 ) ) ( not ( = ?auto_580678 ?auto_580689 ) ) ( not ( = ?auto_580678 ?auto_580690 ) ) ( not ( = ?auto_580679 ?auto_580680 ) ) ( not ( = ?auto_580679 ?auto_580681 ) ) ( not ( = ?auto_580679 ?auto_580682 ) ) ( not ( = ?auto_580679 ?auto_580683 ) ) ( not ( = ?auto_580679 ?auto_580684 ) ) ( not ( = ?auto_580679 ?auto_580685 ) ) ( not ( = ?auto_580679 ?auto_580686 ) ) ( not ( = ?auto_580679 ?auto_580687 ) ) ( not ( = ?auto_580679 ?auto_580688 ) ) ( not ( = ?auto_580679 ?auto_580689 ) ) ( not ( = ?auto_580679 ?auto_580690 ) ) ( not ( = ?auto_580680 ?auto_580681 ) ) ( not ( = ?auto_580680 ?auto_580682 ) ) ( not ( = ?auto_580680 ?auto_580683 ) ) ( not ( = ?auto_580680 ?auto_580684 ) ) ( not ( = ?auto_580680 ?auto_580685 ) ) ( not ( = ?auto_580680 ?auto_580686 ) ) ( not ( = ?auto_580680 ?auto_580687 ) ) ( not ( = ?auto_580680 ?auto_580688 ) ) ( not ( = ?auto_580680 ?auto_580689 ) ) ( not ( = ?auto_580680 ?auto_580690 ) ) ( not ( = ?auto_580681 ?auto_580682 ) ) ( not ( = ?auto_580681 ?auto_580683 ) ) ( not ( = ?auto_580681 ?auto_580684 ) ) ( not ( = ?auto_580681 ?auto_580685 ) ) ( not ( = ?auto_580681 ?auto_580686 ) ) ( not ( = ?auto_580681 ?auto_580687 ) ) ( not ( = ?auto_580681 ?auto_580688 ) ) ( not ( = ?auto_580681 ?auto_580689 ) ) ( not ( = ?auto_580681 ?auto_580690 ) ) ( not ( = ?auto_580682 ?auto_580683 ) ) ( not ( = ?auto_580682 ?auto_580684 ) ) ( not ( = ?auto_580682 ?auto_580685 ) ) ( not ( = ?auto_580682 ?auto_580686 ) ) ( not ( = ?auto_580682 ?auto_580687 ) ) ( not ( = ?auto_580682 ?auto_580688 ) ) ( not ( = ?auto_580682 ?auto_580689 ) ) ( not ( = ?auto_580682 ?auto_580690 ) ) ( not ( = ?auto_580683 ?auto_580684 ) ) ( not ( = ?auto_580683 ?auto_580685 ) ) ( not ( = ?auto_580683 ?auto_580686 ) ) ( not ( = ?auto_580683 ?auto_580687 ) ) ( not ( = ?auto_580683 ?auto_580688 ) ) ( not ( = ?auto_580683 ?auto_580689 ) ) ( not ( = ?auto_580683 ?auto_580690 ) ) ( not ( = ?auto_580684 ?auto_580685 ) ) ( not ( = ?auto_580684 ?auto_580686 ) ) ( not ( = ?auto_580684 ?auto_580687 ) ) ( not ( = ?auto_580684 ?auto_580688 ) ) ( not ( = ?auto_580684 ?auto_580689 ) ) ( not ( = ?auto_580684 ?auto_580690 ) ) ( not ( = ?auto_580685 ?auto_580686 ) ) ( not ( = ?auto_580685 ?auto_580687 ) ) ( not ( = ?auto_580685 ?auto_580688 ) ) ( not ( = ?auto_580685 ?auto_580689 ) ) ( not ( = ?auto_580685 ?auto_580690 ) ) ( not ( = ?auto_580686 ?auto_580687 ) ) ( not ( = ?auto_580686 ?auto_580688 ) ) ( not ( = ?auto_580686 ?auto_580689 ) ) ( not ( = ?auto_580686 ?auto_580690 ) ) ( not ( = ?auto_580687 ?auto_580688 ) ) ( not ( = ?auto_580687 ?auto_580689 ) ) ( not ( = ?auto_580687 ?auto_580690 ) ) ( not ( = ?auto_580688 ?auto_580689 ) ) ( not ( = ?auto_580688 ?auto_580690 ) ) ( not ( = ?auto_580689 ?auto_580690 ) ) ( CLEAR ?auto_580687 ) ( ON ?auto_580688 ?auto_580689 ) ( CLEAR ?auto_580688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_580677 ?auto_580678 ?auto_580679 ?auto_580680 ?auto_580681 ?auto_580682 ?auto_580683 ?auto_580684 ?auto_580685 ?auto_580686 ?auto_580687 ?auto_580688 )
      ( MAKE-13PILE ?auto_580677 ?auto_580678 ?auto_580679 ?auto_580680 ?auto_580681 ?auto_580682 ?auto_580683 ?auto_580684 ?auto_580685 ?auto_580686 ?auto_580687 ?auto_580688 ?auto_580689 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_580731 - BLOCK
      ?auto_580732 - BLOCK
      ?auto_580733 - BLOCK
      ?auto_580734 - BLOCK
      ?auto_580735 - BLOCK
      ?auto_580736 - BLOCK
      ?auto_580737 - BLOCK
      ?auto_580738 - BLOCK
      ?auto_580739 - BLOCK
      ?auto_580740 - BLOCK
      ?auto_580741 - BLOCK
      ?auto_580742 - BLOCK
      ?auto_580743 - BLOCK
    )
    :vars
    (
      ?auto_580744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580743 ?auto_580744 ) ( ON-TABLE ?auto_580731 ) ( ON ?auto_580732 ?auto_580731 ) ( ON ?auto_580733 ?auto_580732 ) ( ON ?auto_580734 ?auto_580733 ) ( ON ?auto_580735 ?auto_580734 ) ( ON ?auto_580736 ?auto_580735 ) ( ON ?auto_580737 ?auto_580736 ) ( ON ?auto_580738 ?auto_580737 ) ( ON ?auto_580739 ?auto_580738 ) ( ON ?auto_580740 ?auto_580739 ) ( not ( = ?auto_580731 ?auto_580732 ) ) ( not ( = ?auto_580731 ?auto_580733 ) ) ( not ( = ?auto_580731 ?auto_580734 ) ) ( not ( = ?auto_580731 ?auto_580735 ) ) ( not ( = ?auto_580731 ?auto_580736 ) ) ( not ( = ?auto_580731 ?auto_580737 ) ) ( not ( = ?auto_580731 ?auto_580738 ) ) ( not ( = ?auto_580731 ?auto_580739 ) ) ( not ( = ?auto_580731 ?auto_580740 ) ) ( not ( = ?auto_580731 ?auto_580741 ) ) ( not ( = ?auto_580731 ?auto_580742 ) ) ( not ( = ?auto_580731 ?auto_580743 ) ) ( not ( = ?auto_580731 ?auto_580744 ) ) ( not ( = ?auto_580732 ?auto_580733 ) ) ( not ( = ?auto_580732 ?auto_580734 ) ) ( not ( = ?auto_580732 ?auto_580735 ) ) ( not ( = ?auto_580732 ?auto_580736 ) ) ( not ( = ?auto_580732 ?auto_580737 ) ) ( not ( = ?auto_580732 ?auto_580738 ) ) ( not ( = ?auto_580732 ?auto_580739 ) ) ( not ( = ?auto_580732 ?auto_580740 ) ) ( not ( = ?auto_580732 ?auto_580741 ) ) ( not ( = ?auto_580732 ?auto_580742 ) ) ( not ( = ?auto_580732 ?auto_580743 ) ) ( not ( = ?auto_580732 ?auto_580744 ) ) ( not ( = ?auto_580733 ?auto_580734 ) ) ( not ( = ?auto_580733 ?auto_580735 ) ) ( not ( = ?auto_580733 ?auto_580736 ) ) ( not ( = ?auto_580733 ?auto_580737 ) ) ( not ( = ?auto_580733 ?auto_580738 ) ) ( not ( = ?auto_580733 ?auto_580739 ) ) ( not ( = ?auto_580733 ?auto_580740 ) ) ( not ( = ?auto_580733 ?auto_580741 ) ) ( not ( = ?auto_580733 ?auto_580742 ) ) ( not ( = ?auto_580733 ?auto_580743 ) ) ( not ( = ?auto_580733 ?auto_580744 ) ) ( not ( = ?auto_580734 ?auto_580735 ) ) ( not ( = ?auto_580734 ?auto_580736 ) ) ( not ( = ?auto_580734 ?auto_580737 ) ) ( not ( = ?auto_580734 ?auto_580738 ) ) ( not ( = ?auto_580734 ?auto_580739 ) ) ( not ( = ?auto_580734 ?auto_580740 ) ) ( not ( = ?auto_580734 ?auto_580741 ) ) ( not ( = ?auto_580734 ?auto_580742 ) ) ( not ( = ?auto_580734 ?auto_580743 ) ) ( not ( = ?auto_580734 ?auto_580744 ) ) ( not ( = ?auto_580735 ?auto_580736 ) ) ( not ( = ?auto_580735 ?auto_580737 ) ) ( not ( = ?auto_580735 ?auto_580738 ) ) ( not ( = ?auto_580735 ?auto_580739 ) ) ( not ( = ?auto_580735 ?auto_580740 ) ) ( not ( = ?auto_580735 ?auto_580741 ) ) ( not ( = ?auto_580735 ?auto_580742 ) ) ( not ( = ?auto_580735 ?auto_580743 ) ) ( not ( = ?auto_580735 ?auto_580744 ) ) ( not ( = ?auto_580736 ?auto_580737 ) ) ( not ( = ?auto_580736 ?auto_580738 ) ) ( not ( = ?auto_580736 ?auto_580739 ) ) ( not ( = ?auto_580736 ?auto_580740 ) ) ( not ( = ?auto_580736 ?auto_580741 ) ) ( not ( = ?auto_580736 ?auto_580742 ) ) ( not ( = ?auto_580736 ?auto_580743 ) ) ( not ( = ?auto_580736 ?auto_580744 ) ) ( not ( = ?auto_580737 ?auto_580738 ) ) ( not ( = ?auto_580737 ?auto_580739 ) ) ( not ( = ?auto_580737 ?auto_580740 ) ) ( not ( = ?auto_580737 ?auto_580741 ) ) ( not ( = ?auto_580737 ?auto_580742 ) ) ( not ( = ?auto_580737 ?auto_580743 ) ) ( not ( = ?auto_580737 ?auto_580744 ) ) ( not ( = ?auto_580738 ?auto_580739 ) ) ( not ( = ?auto_580738 ?auto_580740 ) ) ( not ( = ?auto_580738 ?auto_580741 ) ) ( not ( = ?auto_580738 ?auto_580742 ) ) ( not ( = ?auto_580738 ?auto_580743 ) ) ( not ( = ?auto_580738 ?auto_580744 ) ) ( not ( = ?auto_580739 ?auto_580740 ) ) ( not ( = ?auto_580739 ?auto_580741 ) ) ( not ( = ?auto_580739 ?auto_580742 ) ) ( not ( = ?auto_580739 ?auto_580743 ) ) ( not ( = ?auto_580739 ?auto_580744 ) ) ( not ( = ?auto_580740 ?auto_580741 ) ) ( not ( = ?auto_580740 ?auto_580742 ) ) ( not ( = ?auto_580740 ?auto_580743 ) ) ( not ( = ?auto_580740 ?auto_580744 ) ) ( not ( = ?auto_580741 ?auto_580742 ) ) ( not ( = ?auto_580741 ?auto_580743 ) ) ( not ( = ?auto_580741 ?auto_580744 ) ) ( not ( = ?auto_580742 ?auto_580743 ) ) ( not ( = ?auto_580742 ?auto_580744 ) ) ( not ( = ?auto_580743 ?auto_580744 ) ) ( ON ?auto_580742 ?auto_580743 ) ( CLEAR ?auto_580740 ) ( ON ?auto_580741 ?auto_580742 ) ( CLEAR ?auto_580741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_580731 ?auto_580732 ?auto_580733 ?auto_580734 ?auto_580735 ?auto_580736 ?auto_580737 ?auto_580738 ?auto_580739 ?auto_580740 ?auto_580741 )
      ( MAKE-13PILE ?auto_580731 ?auto_580732 ?auto_580733 ?auto_580734 ?auto_580735 ?auto_580736 ?auto_580737 ?auto_580738 ?auto_580739 ?auto_580740 ?auto_580741 ?auto_580742 ?auto_580743 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_580785 - BLOCK
      ?auto_580786 - BLOCK
      ?auto_580787 - BLOCK
      ?auto_580788 - BLOCK
      ?auto_580789 - BLOCK
      ?auto_580790 - BLOCK
      ?auto_580791 - BLOCK
      ?auto_580792 - BLOCK
      ?auto_580793 - BLOCK
      ?auto_580794 - BLOCK
      ?auto_580795 - BLOCK
      ?auto_580796 - BLOCK
      ?auto_580797 - BLOCK
    )
    :vars
    (
      ?auto_580798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580797 ?auto_580798 ) ( ON-TABLE ?auto_580785 ) ( ON ?auto_580786 ?auto_580785 ) ( ON ?auto_580787 ?auto_580786 ) ( ON ?auto_580788 ?auto_580787 ) ( ON ?auto_580789 ?auto_580788 ) ( ON ?auto_580790 ?auto_580789 ) ( ON ?auto_580791 ?auto_580790 ) ( ON ?auto_580792 ?auto_580791 ) ( ON ?auto_580793 ?auto_580792 ) ( not ( = ?auto_580785 ?auto_580786 ) ) ( not ( = ?auto_580785 ?auto_580787 ) ) ( not ( = ?auto_580785 ?auto_580788 ) ) ( not ( = ?auto_580785 ?auto_580789 ) ) ( not ( = ?auto_580785 ?auto_580790 ) ) ( not ( = ?auto_580785 ?auto_580791 ) ) ( not ( = ?auto_580785 ?auto_580792 ) ) ( not ( = ?auto_580785 ?auto_580793 ) ) ( not ( = ?auto_580785 ?auto_580794 ) ) ( not ( = ?auto_580785 ?auto_580795 ) ) ( not ( = ?auto_580785 ?auto_580796 ) ) ( not ( = ?auto_580785 ?auto_580797 ) ) ( not ( = ?auto_580785 ?auto_580798 ) ) ( not ( = ?auto_580786 ?auto_580787 ) ) ( not ( = ?auto_580786 ?auto_580788 ) ) ( not ( = ?auto_580786 ?auto_580789 ) ) ( not ( = ?auto_580786 ?auto_580790 ) ) ( not ( = ?auto_580786 ?auto_580791 ) ) ( not ( = ?auto_580786 ?auto_580792 ) ) ( not ( = ?auto_580786 ?auto_580793 ) ) ( not ( = ?auto_580786 ?auto_580794 ) ) ( not ( = ?auto_580786 ?auto_580795 ) ) ( not ( = ?auto_580786 ?auto_580796 ) ) ( not ( = ?auto_580786 ?auto_580797 ) ) ( not ( = ?auto_580786 ?auto_580798 ) ) ( not ( = ?auto_580787 ?auto_580788 ) ) ( not ( = ?auto_580787 ?auto_580789 ) ) ( not ( = ?auto_580787 ?auto_580790 ) ) ( not ( = ?auto_580787 ?auto_580791 ) ) ( not ( = ?auto_580787 ?auto_580792 ) ) ( not ( = ?auto_580787 ?auto_580793 ) ) ( not ( = ?auto_580787 ?auto_580794 ) ) ( not ( = ?auto_580787 ?auto_580795 ) ) ( not ( = ?auto_580787 ?auto_580796 ) ) ( not ( = ?auto_580787 ?auto_580797 ) ) ( not ( = ?auto_580787 ?auto_580798 ) ) ( not ( = ?auto_580788 ?auto_580789 ) ) ( not ( = ?auto_580788 ?auto_580790 ) ) ( not ( = ?auto_580788 ?auto_580791 ) ) ( not ( = ?auto_580788 ?auto_580792 ) ) ( not ( = ?auto_580788 ?auto_580793 ) ) ( not ( = ?auto_580788 ?auto_580794 ) ) ( not ( = ?auto_580788 ?auto_580795 ) ) ( not ( = ?auto_580788 ?auto_580796 ) ) ( not ( = ?auto_580788 ?auto_580797 ) ) ( not ( = ?auto_580788 ?auto_580798 ) ) ( not ( = ?auto_580789 ?auto_580790 ) ) ( not ( = ?auto_580789 ?auto_580791 ) ) ( not ( = ?auto_580789 ?auto_580792 ) ) ( not ( = ?auto_580789 ?auto_580793 ) ) ( not ( = ?auto_580789 ?auto_580794 ) ) ( not ( = ?auto_580789 ?auto_580795 ) ) ( not ( = ?auto_580789 ?auto_580796 ) ) ( not ( = ?auto_580789 ?auto_580797 ) ) ( not ( = ?auto_580789 ?auto_580798 ) ) ( not ( = ?auto_580790 ?auto_580791 ) ) ( not ( = ?auto_580790 ?auto_580792 ) ) ( not ( = ?auto_580790 ?auto_580793 ) ) ( not ( = ?auto_580790 ?auto_580794 ) ) ( not ( = ?auto_580790 ?auto_580795 ) ) ( not ( = ?auto_580790 ?auto_580796 ) ) ( not ( = ?auto_580790 ?auto_580797 ) ) ( not ( = ?auto_580790 ?auto_580798 ) ) ( not ( = ?auto_580791 ?auto_580792 ) ) ( not ( = ?auto_580791 ?auto_580793 ) ) ( not ( = ?auto_580791 ?auto_580794 ) ) ( not ( = ?auto_580791 ?auto_580795 ) ) ( not ( = ?auto_580791 ?auto_580796 ) ) ( not ( = ?auto_580791 ?auto_580797 ) ) ( not ( = ?auto_580791 ?auto_580798 ) ) ( not ( = ?auto_580792 ?auto_580793 ) ) ( not ( = ?auto_580792 ?auto_580794 ) ) ( not ( = ?auto_580792 ?auto_580795 ) ) ( not ( = ?auto_580792 ?auto_580796 ) ) ( not ( = ?auto_580792 ?auto_580797 ) ) ( not ( = ?auto_580792 ?auto_580798 ) ) ( not ( = ?auto_580793 ?auto_580794 ) ) ( not ( = ?auto_580793 ?auto_580795 ) ) ( not ( = ?auto_580793 ?auto_580796 ) ) ( not ( = ?auto_580793 ?auto_580797 ) ) ( not ( = ?auto_580793 ?auto_580798 ) ) ( not ( = ?auto_580794 ?auto_580795 ) ) ( not ( = ?auto_580794 ?auto_580796 ) ) ( not ( = ?auto_580794 ?auto_580797 ) ) ( not ( = ?auto_580794 ?auto_580798 ) ) ( not ( = ?auto_580795 ?auto_580796 ) ) ( not ( = ?auto_580795 ?auto_580797 ) ) ( not ( = ?auto_580795 ?auto_580798 ) ) ( not ( = ?auto_580796 ?auto_580797 ) ) ( not ( = ?auto_580796 ?auto_580798 ) ) ( not ( = ?auto_580797 ?auto_580798 ) ) ( ON ?auto_580796 ?auto_580797 ) ( ON ?auto_580795 ?auto_580796 ) ( CLEAR ?auto_580793 ) ( ON ?auto_580794 ?auto_580795 ) ( CLEAR ?auto_580794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_580785 ?auto_580786 ?auto_580787 ?auto_580788 ?auto_580789 ?auto_580790 ?auto_580791 ?auto_580792 ?auto_580793 ?auto_580794 )
      ( MAKE-13PILE ?auto_580785 ?auto_580786 ?auto_580787 ?auto_580788 ?auto_580789 ?auto_580790 ?auto_580791 ?auto_580792 ?auto_580793 ?auto_580794 ?auto_580795 ?auto_580796 ?auto_580797 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_580839 - BLOCK
      ?auto_580840 - BLOCK
      ?auto_580841 - BLOCK
      ?auto_580842 - BLOCK
      ?auto_580843 - BLOCK
      ?auto_580844 - BLOCK
      ?auto_580845 - BLOCK
      ?auto_580846 - BLOCK
      ?auto_580847 - BLOCK
      ?auto_580848 - BLOCK
      ?auto_580849 - BLOCK
      ?auto_580850 - BLOCK
      ?auto_580851 - BLOCK
    )
    :vars
    (
      ?auto_580852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580851 ?auto_580852 ) ( ON-TABLE ?auto_580839 ) ( ON ?auto_580840 ?auto_580839 ) ( ON ?auto_580841 ?auto_580840 ) ( ON ?auto_580842 ?auto_580841 ) ( ON ?auto_580843 ?auto_580842 ) ( ON ?auto_580844 ?auto_580843 ) ( ON ?auto_580845 ?auto_580844 ) ( ON ?auto_580846 ?auto_580845 ) ( not ( = ?auto_580839 ?auto_580840 ) ) ( not ( = ?auto_580839 ?auto_580841 ) ) ( not ( = ?auto_580839 ?auto_580842 ) ) ( not ( = ?auto_580839 ?auto_580843 ) ) ( not ( = ?auto_580839 ?auto_580844 ) ) ( not ( = ?auto_580839 ?auto_580845 ) ) ( not ( = ?auto_580839 ?auto_580846 ) ) ( not ( = ?auto_580839 ?auto_580847 ) ) ( not ( = ?auto_580839 ?auto_580848 ) ) ( not ( = ?auto_580839 ?auto_580849 ) ) ( not ( = ?auto_580839 ?auto_580850 ) ) ( not ( = ?auto_580839 ?auto_580851 ) ) ( not ( = ?auto_580839 ?auto_580852 ) ) ( not ( = ?auto_580840 ?auto_580841 ) ) ( not ( = ?auto_580840 ?auto_580842 ) ) ( not ( = ?auto_580840 ?auto_580843 ) ) ( not ( = ?auto_580840 ?auto_580844 ) ) ( not ( = ?auto_580840 ?auto_580845 ) ) ( not ( = ?auto_580840 ?auto_580846 ) ) ( not ( = ?auto_580840 ?auto_580847 ) ) ( not ( = ?auto_580840 ?auto_580848 ) ) ( not ( = ?auto_580840 ?auto_580849 ) ) ( not ( = ?auto_580840 ?auto_580850 ) ) ( not ( = ?auto_580840 ?auto_580851 ) ) ( not ( = ?auto_580840 ?auto_580852 ) ) ( not ( = ?auto_580841 ?auto_580842 ) ) ( not ( = ?auto_580841 ?auto_580843 ) ) ( not ( = ?auto_580841 ?auto_580844 ) ) ( not ( = ?auto_580841 ?auto_580845 ) ) ( not ( = ?auto_580841 ?auto_580846 ) ) ( not ( = ?auto_580841 ?auto_580847 ) ) ( not ( = ?auto_580841 ?auto_580848 ) ) ( not ( = ?auto_580841 ?auto_580849 ) ) ( not ( = ?auto_580841 ?auto_580850 ) ) ( not ( = ?auto_580841 ?auto_580851 ) ) ( not ( = ?auto_580841 ?auto_580852 ) ) ( not ( = ?auto_580842 ?auto_580843 ) ) ( not ( = ?auto_580842 ?auto_580844 ) ) ( not ( = ?auto_580842 ?auto_580845 ) ) ( not ( = ?auto_580842 ?auto_580846 ) ) ( not ( = ?auto_580842 ?auto_580847 ) ) ( not ( = ?auto_580842 ?auto_580848 ) ) ( not ( = ?auto_580842 ?auto_580849 ) ) ( not ( = ?auto_580842 ?auto_580850 ) ) ( not ( = ?auto_580842 ?auto_580851 ) ) ( not ( = ?auto_580842 ?auto_580852 ) ) ( not ( = ?auto_580843 ?auto_580844 ) ) ( not ( = ?auto_580843 ?auto_580845 ) ) ( not ( = ?auto_580843 ?auto_580846 ) ) ( not ( = ?auto_580843 ?auto_580847 ) ) ( not ( = ?auto_580843 ?auto_580848 ) ) ( not ( = ?auto_580843 ?auto_580849 ) ) ( not ( = ?auto_580843 ?auto_580850 ) ) ( not ( = ?auto_580843 ?auto_580851 ) ) ( not ( = ?auto_580843 ?auto_580852 ) ) ( not ( = ?auto_580844 ?auto_580845 ) ) ( not ( = ?auto_580844 ?auto_580846 ) ) ( not ( = ?auto_580844 ?auto_580847 ) ) ( not ( = ?auto_580844 ?auto_580848 ) ) ( not ( = ?auto_580844 ?auto_580849 ) ) ( not ( = ?auto_580844 ?auto_580850 ) ) ( not ( = ?auto_580844 ?auto_580851 ) ) ( not ( = ?auto_580844 ?auto_580852 ) ) ( not ( = ?auto_580845 ?auto_580846 ) ) ( not ( = ?auto_580845 ?auto_580847 ) ) ( not ( = ?auto_580845 ?auto_580848 ) ) ( not ( = ?auto_580845 ?auto_580849 ) ) ( not ( = ?auto_580845 ?auto_580850 ) ) ( not ( = ?auto_580845 ?auto_580851 ) ) ( not ( = ?auto_580845 ?auto_580852 ) ) ( not ( = ?auto_580846 ?auto_580847 ) ) ( not ( = ?auto_580846 ?auto_580848 ) ) ( not ( = ?auto_580846 ?auto_580849 ) ) ( not ( = ?auto_580846 ?auto_580850 ) ) ( not ( = ?auto_580846 ?auto_580851 ) ) ( not ( = ?auto_580846 ?auto_580852 ) ) ( not ( = ?auto_580847 ?auto_580848 ) ) ( not ( = ?auto_580847 ?auto_580849 ) ) ( not ( = ?auto_580847 ?auto_580850 ) ) ( not ( = ?auto_580847 ?auto_580851 ) ) ( not ( = ?auto_580847 ?auto_580852 ) ) ( not ( = ?auto_580848 ?auto_580849 ) ) ( not ( = ?auto_580848 ?auto_580850 ) ) ( not ( = ?auto_580848 ?auto_580851 ) ) ( not ( = ?auto_580848 ?auto_580852 ) ) ( not ( = ?auto_580849 ?auto_580850 ) ) ( not ( = ?auto_580849 ?auto_580851 ) ) ( not ( = ?auto_580849 ?auto_580852 ) ) ( not ( = ?auto_580850 ?auto_580851 ) ) ( not ( = ?auto_580850 ?auto_580852 ) ) ( not ( = ?auto_580851 ?auto_580852 ) ) ( ON ?auto_580850 ?auto_580851 ) ( ON ?auto_580849 ?auto_580850 ) ( ON ?auto_580848 ?auto_580849 ) ( CLEAR ?auto_580846 ) ( ON ?auto_580847 ?auto_580848 ) ( CLEAR ?auto_580847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_580839 ?auto_580840 ?auto_580841 ?auto_580842 ?auto_580843 ?auto_580844 ?auto_580845 ?auto_580846 ?auto_580847 )
      ( MAKE-13PILE ?auto_580839 ?auto_580840 ?auto_580841 ?auto_580842 ?auto_580843 ?auto_580844 ?auto_580845 ?auto_580846 ?auto_580847 ?auto_580848 ?auto_580849 ?auto_580850 ?auto_580851 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_580893 - BLOCK
      ?auto_580894 - BLOCK
      ?auto_580895 - BLOCK
      ?auto_580896 - BLOCK
      ?auto_580897 - BLOCK
      ?auto_580898 - BLOCK
      ?auto_580899 - BLOCK
      ?auto_580900 - BLOCK
      ?auto_580901 - BLOCK
      ?auto_580902 - BLOCK
      ?auto_580903 - BLOCK
      ?auto_580904 - BLOCK
      ?auto_580905 - BLOCK
    )
    :vars
    (
      ?auto_580906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580905 ?auto_580906 ) ( ON-TABLE ?auto_580893 ) ( ON ?auto_580894 ?auto_580893 ) ( ON ?auto_580895 ?auto_580894 ) ( ON ?auto_580896 ?auto_580895 ) ( ON ?auto_580897 ?auto_580896 ) ( ON ?auto_580898 ?auto_580897 ) ( ON ?auto_580899 ?auto_580898 ) ( not ( = ?auto_580893 ?auto_580894 ) ) ( not ( = ?auto_580893 ?auto_580895 ) ) ( not ( = ?auto_580893 ?auto_580896 ) ) ( not ( = ?auto_580893 ?auto_580897 ) ) ( not ( = ?auto_580893 ?auto_580898 ) ) ( not ( = ?auto_580893 ?auto_580899 ) ) ( not ( = ?auto_580893 ?auto_580900 ) ) ( not ( = ?auto_580893 ?auto_580901 ) ) ( not ( = ?auto_580893 ?auto_580902 ) ) ( not ( = ?auto_580893 ?auto_580903 ) ) ( not ( = ?auto_580893 ?auto_580904 ) ) ( not ( = ?auto_580893 ?auto_580905 ) ) ( not ( = ?auto_580893 ?auto_580906 ) ) ( not ( = ?auto_580894 ?auto_580895 ) ) ( not ( = ?auto_580894 ?auto_580896 ) ) ( not ( = ?auto_580894 ?auto_580897 ) ) ( not ( = ?auto_580894 ?auto_580898 ) ) ( not ( = ?auto_580894 ?auto_580899 ) ) ( not ( = ?auto_580894 ?auto_580900 ) ) ( not ( = ?auto_580894 ?auto_580901 ) ) ( not ( = ?auto_580894 ?auto_580902 ) ) ( not ( = ?auto_580894 ?auto_580903 ) ) ( not ( = ?auto_580894 ?auto_580904 ) ) ( not ( = ?auto_580894 ?auto_580905 ) ) ( not ( = ?auto_580894 ?auto_580906 ) ) ( not ( = ?auto_580895 ?auto_580896 ) ) ( not ( = ?auto_580895 ?auto_580897 ) ) ( not ( = ?auto_580895 ?auto_580898 ) ) ( not ( = ?auto_580895 ?auto_580899 ) ) ( not ( = ?auto_580895 ?auto_580900 ) ) ( not ( = ?auto_580895 ?auto_580901 ) ) ( not ( = ?auto_580895 ?auto_580902 ) ) ( not ( = ?auto_580895 ?auto_580903 ) ) ( not ( = ?auto_580895 ?auto_580904 ) ) ( not ( = ?auto_580895 ?auto_580905 ) ) ( not ( = ?auto_580895 ?auto_580906 ) ) ( not ( = ?auto_580896 ?auto_580897 ) ) ( not ( = ?auto_580896 ?auto_580898 ) ) ( not ( = ?auto_580896 ?auto_580899 ) ) ( not ( = ?auto_580896 ?auto_580900 ) ) ( not ( = ?auto_580896 ?auto_580901 ) ) ( not ( = ?auto_580896 ?auto_580902 ) ) ( not ( = ?auto_580896 ?auto_580903 ) ) ( not ( = ?auto_580896 ?auto_580904 ) ) ( not ( = ?auto_580896 ?auto_580905 ) ) ( not ( = ?auto_580896 ?auto_580906 ) ) ( not ( = ?auto_580897 ?auto_580898 ) ) ( not ( = ?auto_580897 ?auto_580899 ) ) ( not ( = ?auto_580897 ?auto_580900 ) ) ( not ( = ?auto_580897 ?auto_580901 ) ) ( not ( = ?auto_580897 ?auto_580902 ) ) ( not ( = ?auto_580897 ?auto_580903 ) ) ( not ( = ?auto_580897 ?auto_580904 ) ) ( not ( = ?auto_580897 ?auto_580905 ) ) ( not ( = ?auto_580897 ?auto_580906 ) ) ( not ( = ?auto_580898 ?auto_580899 ) ) ( not ( = ?auto_580898 ?auto_580900 ) ) ( not ( = ?auto_580898 ?auto_580901 ) ) ( not ( = ?auto_580898 ?auto_580902 ) ) ( not ( = ?auto_580898 ?auto_580903 ) ) ( not ( = ?auto_580898 ?auto_580904 ) ) ( not ( = ?auto_580898 ?auto_580905 ) ) ( not ( = ?auto_580898 ?auto_580906 ) ) ( not ( = ?auto_580899 ?auto_580900 ) ) ( not ( = ?auto_580899 ?auto_580901 ) ) ( not ( = ?auto_580899 ?auto_580902 ) ) ( not ( = ?auto_580899 ?auto_580903 ) ) ( not ( = ?auto_580899 ?auto_580904 ) ) ( not ( = ?auto_580899 ?auto_580905 ) ) ( not ( = ?auto_580899 ?auto_580906 ) ) ( not ( = ?auto_580900 ?auto_580901 ) ) ( not ( = ?auto_580900 ?auto_580902 ) ) ( not ( = ?auto_580900 ?auto_580903 ) ) ( not ( = ?auto_580900 ?auto_580904 ) ) ( not ( = ?auto_580900 ?auto_580905 ) ) ( not ( = ?auto_580900 ?auto_580906 ) ) ( not ( = ?auto_580901 ?auto_580902 ) ) ( not ( = ?auto_580901 ?auto_580903 ) ) ( not ( = ?auto_580901 ?auto_580904 ) ) ( not ( = ?auto_580901 ?auto_580905 ) ) ( not ( = ?auto_580901 ?auto_580906 ) ) ( not ( = ?auto_580902 ?auto_580903 ) ) ( not ( = ?auto_580902 ?auto_580904 ) ) ( not ( = ?auto_580902 ?auto_580905 ) ) ( not ( = ?auto_580902 ?auto_580906 ) ) ( not ( = ?auto_580903 ?auto_580904 ) ) ( not ( = ?auto_580903 ?auto_580905 ) ) ( not ( = ?auto_580903 ?auto_580906 ) ) ( not ( = ?auto_580904 ?auto_580905 ) ) ( not ( = ?auto_580904 ?auto_580906 ) ) ( not ( = ?auto_580905 ?auto_580906 ) ) ( ON ?auto_580904 ?auto_580905 ) ( ON ?auto_580903 ?auto_580904 ) ( ON ?auto_580902 ?auto_580903 ) ( ON ?auto_580901 ?auto_580902 ) ( CLEAR ?auto_580899 ) ( ON ?auto_580900 ?auto_580901 ) ( CLEAR ?auto_580900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_580893 ?auto_580894 ?auto_580895 ?auto_580896 ?auto_580897 ?auto_580898 ?auto_580899 ?auto_580900 )
      ( MAKE-13PILE ?auto_580893 ?auto_580894 ?auto_580895 ?auto_580896 ?auto_580897 ?auto_580898 ?auto_580899 ?auto_580900 ?auto_580901 ?auto_580902 ?auto_580903 ?auto_580904 ?auto_580905 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_580947 - BLOCK
      ?auto_580948 - BLOCK
      ?auto_580949 - BLOCK
      ?auto_580950 - BLOCK
      ?auto_580951 - BLOCK
      ?auto_580952 - BLOCK
      ?auto_580953 - BLOCK
      ?auto_580954 - BLOCK
      ?auto_580955 - BLOCK
      ?auto_580956 - BLOCK
      ?auto_580957 - BLOCK
      ?auto_580958 - BLOCK
      ?auto_580959 - BLOCK
    )
    :vars
    (
      ?auto_580960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_580959 ?auto_580960 ) ( ON-TABLE ?auto_580947 ) ( ON ?auto_580948 ?auto_580947 ) ( ON ?auto_580949 ?auto_580948 ) ( ON ?auto_580950 ?auto_580949 ) ( ON ?auto_580951 ?auto_580950 ) ( ON ?auto_580952 ?auto_580951 ) ( not ( = ?auto_580947 ?auto_580948 ) ) ( not ( = ?auto_580947 ?auto_580949 ) ) ( not ( = ?auto_580947 ?auto_580950 ) ) ( not ( = ?auto_580947 ?auto_580951 ) ) ( not ( = ?auto_580947 ?auto_580952 ) ) ( not ( = ?auto_580947 ?auto_580953 ) ) ( not ( = ?auto_580947 ?auto_580954 ) ) ( not ( = ?auto_580947 ?auto_580955 ) ) ( not ( = ?auto_580947 ?auto_580956 ) ) ( not ( = ?auto_580947 ?auto_580957 ) ) ( not ( = ?auto_580947 ?auto_580958 ) ) ( not ( = ?auto_580947 ?auto_580959 ) ) ( not ( = ?auto_580947 ?auto_580960 ) ) ( not ( = ?auto_580948 ?auto_580949 ) ) ( not ( = ?auto_580948 ?auto_580950 ) ) ( not ( = ?auto_580948 ?auto_580951 ) ) ( not ( = ?auto_580948 ?auto_580952 ) ) ( not ( = ?auto_580948 ?auto_580953 ) ) ( not ( = ?auto_580948 ?auto_580954 ) ) ( not ( = ?auto_580948 ?auto_580955 ) ) ( not ( = ?auto_580948 ?auto_580956 ) ) ( not ( = ?auto_580948 ?auto_580957 ) ) ( not ( = ?auto_580948 ?auto_580958 ) ) ( not ( = ?auto_580948 ?auto_580959 ) ) ( not ( = ?auto_580948 ?auto_580960 ) ) ( not ( = ?auto_580949 ?auto_580950 ) ) ( not ( = ?auto_580949 ?auto_580951 ) ) ( not ( = ?auto_580949 ?auto_580952 ) ) ( not ( = ?auto_580949 ?auto_580953 ) ) ( not ( = ?auto_580949 ?auto_580954 ) ) ( not ( = ?auto_580949 ?auto_580955 ) ) ( not ( = ?auto_580949 ?auto_580956 ) ) ( not ( = ?auto_580949 ?auto_580957 ) ) ( not ( = ?auto_580949 ?auto_580958 ) ) ( not ( = ?auto_580949 ?auto_580959 ) ) ( not ( = ?auto_580949 ?auto_580960 ) ) ( not ( = ?auto_580950 ?auto_580951 ) ) ( not ( = ?auto_580950 ?auto_580952 ) ) ( not ( = ?auto_580950 ?auto_580953 ) ) ( not ( = ?auto_580950 ?auto_580954 ) ) ( not ( = ?auto_580950 ?auto_580955 ) ) ( not ( = ?auto_580950 ?auto_580956 ) ) ( not ( = ?auto_580950 ?auto_580957 ) ) ( not ( = ?auto_580950 ?auto_580958 ) ) ( not ( = ?auto_580950 ?auto_580959 ) ) ( not ( = ?auto_580950 ?auto_580960 ) ) ( not ( = ?auto_580951 ?auto_580952 ) ) ( not ( = ?auto_580951 ?auto_580953 ) ) ( not ( = ?auto_580951 ?auto_580954 ) ) ( not ( = ?auto_580951 ?auto_580955 ) ) ( not ( = ?auto_580951 ?auto_580956 ) ) ( not ( = ?auto_580951 ?auto_580957 ) ) ( not ( = ?auto_580951 ?auto_580958 ) ) ( not ( = ?auto_580951 ?auto_580959 ) ) ( not ( = ?auto_580951 ?auto_580960 ) ) ( not ( = ?auto_580952 ?auto_580953 ) ) ( not ( = ?auto_580952 ?auto_580954 ) ) ( not ( = ?auto_580952 ?auto_580955 ) ) ( not ( = ?auto_580952 ?auto_580956 ) ) ( not ( = ?auto_580952 ?auto_580957 ) ) ( not ( = ?auto_580952 ?auto_580958 ) ) ( not ( = ?auto_580952 ?auto_580959 ) ) ( not ( = ?auto_580952 ?auto_580960 ) ) ( not ( = ?auto_580953 ?auto_580954 ) ) ( not ( = ?auto_580953 ?auto_580955 ) ) ( not ( = ?auto_580953 ?auto_580956 ) ) ( not ( = ?auto_580953 ?auto_580957 ) ) ( not ( = ?auto_580953 ?auto_580958 ) ) ( not ( = ?auto_580953 ?auto_580959 ) ) ( not ( = ?auto_580953 ?auto_580960 ) ) ( not ( = ?auto_580954 ?auto_580955 ) ) ( not ( = ?auto_580954 ?auto_580956 ) ) ( not ( = ?auto_580954 ?auto_580957 ) ) ( not ( = ?auto_580954 ?auto_580958 ) ) ( not ( = ?auto_580954 ?auto_580959 ) ) ( not ( = ?auto_580954 ?auto_580960 ) ) ( not ( = ?auto_580955 ?auto_580956 ) ) ( not ( = ?auto_580955 ?auto_580957 ) ) ( not ( = ?auto_580955 ?auto_580958 ) ) ( not ( = ?auto_580955 ?auto_580959 ) ) ( not ( = ?auto_580955 ?auto_580960 ) ) ( not ( = ?auto_580956 ?auto_580957 ) ) ( not ( = ?auto_580956 ?auto_580958 ) ) ( not ( = ?auto_580956 ?auto_580959 ) ) ( not ( = ?auto_580956 ?auto_580960 ) ) ( not ( = ?auto_580957 ?auto_580958 ) ) ( not ( = ?auto_580957 ?auto_580959 ) ) ( not ( = ?auto_580957 ?auto_580960 ) ) ( not ( = ?auto_580958 ?auto_580959 ) ) ( not ( = ?auto_580958 ?auto_580960 ) ) ( not ( = ?auto_580959 ?auto_580960 ) ) ( ON ?auto_580958 ?auto_580959 ) ( ON ?auto_580957 ?auto_580958 ) ( ON ?auto_580956 ?auto_580957 ) ( ON ?auto_580955 ?auto_580956 ) ( ON ?auto_580954 ?auto_580955 ) ( CLEAR ?auto_580952 ) ( ON ?auto_580953 ?auto_580954 ) ( CLEAR ?auto_580953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_580947 ?auto_580948 ?auto_580949 ?auto_580950 ?auto_580951 ?auto_580952 ?auto_580953 )
      ( MAKE-13PILE ?auto_580947 ?auto_580948 ?auto_580949 ?auto_580950 ?auto_580951 ?auto_580952 ?auto_580953 ?auto_580954 ?auto_580955 ?auto_580956 ?auto_580957 ?auto_580958 ?auto_580959 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_581001 - BLOCK
      ?auto_581002 - BLOCK
      ?auto_581003 - BLOCK
      ?auto_581004 - BLOCK
      ?auto_581005 - BLOCK
      ?auto_581006 - BLOCK
      ?auto_581007 - BLOCK
      ?auto_581008 - BLOCK
      ?auto_581009 - BLOCK
      ?auto_581010 - BLOCK
      ?auto_581011 - BLOCK
      ?auto_581012 - BLOCK
      ?auto_581013 - BLOCK
    )
    :vars
    (
      ?auto_581014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581013 ?auto_581014 ) ( ON-TABLE ?auto_581001 ) ( ON ?auto_581002 ?auto_581001 ) ( ON ?auto_581003 ?auto_581002 ) ( ON ?auto_581004 ?auto_581003 ) ( ON ?auto_581005 ?auto_581004 ) ( not ( = ?auto_581001 ?auto_581002 ) ) ( not ( = ?auto_581001 ?auto_581003 ) ) ( not ( = ?auto_581001 ?auto_581004 ) ) ( not ( = ?auto_581001 ?auto_581005 ) ) ( not ( = ?auto_581001 ?auto_581006 ) ) ( not ( = ?auto_581001 ?auto_581007 ) ) ( not ( = ?auto_581001 ?auto_581008 ) ) ( not ( = ?auto_581001 ?auto_581009 ) ) ( not ( = ?auto_581001 ?auto_581010 ) ) ( not ( = ?auto_581001 ?auto_581011 ) ) ( not ( = ?auto_581001 ?auto_581012 ) ) ( not ( = ?auto_581001 ?auto_581013 ) ) ( not ( = ?auto_581001 ?auto_581014 ) ) ( not ( = ?auto_581002 ?auto_581003 ) ) ( not ( = ?auto_581002 ?auto_581004 ) ) ( not ( = ?auto_581002 ?auto_581005 ) ) ( not ( = ?auto_581002 ?auto_581006 ) ) ( not ( = ?auto_581002 ?auto_581007 ) ) ( not ( = ?auto_581002 ?auto_581008 ) ) ( not ( = ?auto_581002 ?auto_581009 ) ) ( not ( = ?auto_581002 ?auto_581010 ) ) ( not ( = ?auto_581002 ?auto_581011 ) ) ( not ( = ?auto_581002 ?auto_581012 ) ) ( not ( = ?auto_581002 ?auto_581013 ) ) ( not ( = ?auto_581002 ?auto_581014 ) ) ( not ( = ?auto_581003 ?auto_581004 ) ) ( not ( = ?auto_581003 ?auto_581005 ) ) ( not ( = ?auto_581003 ?auto_581006 ) ) ( not ( = ?auto_581003 ?auto_581007 ) ) ( not ( = ?auto_581003 ?auto_581008 ) ) ( not ( = ?auto_581003 ?auto_581009 ) ) ( not ( = ?auto_581003 ?auto_581010 ) ) ( not ( = ?auto_581003 ?auto_581011 ) ) ( not ( = ?auto_581003 ?auto_581012 ) ) ( not ( = ?auto_581003 ?auto_581013 ) ) ( not ( = ?auto_581003 ?auto_581014 ) ) ( not ( = ?auto_581004 ?auto_581005 ) ) ( not ( = ?auto_581004 ?auto_581006 ) ) ( not ( = ?auto_581004 ?auto_581007 ) ) ( not ( = ?auto_581004 ?auto_581008 ) ) ( not ( = ?auto_581004 ?auto_581009 ) ) ( not ( = ?auto_581004 ?auto_581010 ) ) ( not ( = ?auto_581004 ?auto_581011 ) ) ( not ( = ?auto_581004 ?auto_581012 ) ) ( not ( = ?auto_581004 ?auto_581013 ) ) ( not ( = ?auto_581004 ?auto_581014 ) ) ( not ( = ?auto_581005 ?auto_581006 ) ) ( not ( = ?auto_581005 ?auto_581007 ) ) ( not ( = ?auto_581005 ?auto_581008 ) ) ( not ( = ?auto_581005 ?auto_581009 ) ) ( not ( = ?auto_581005 ?auto_581010 ) ) ( not ( = ?auto_581005 ?auto_581011 ) ) ( not ( = ?auto_581005 ?auto_581012 ) ) ( not ( = ?auto_581005 ?auto_581013 ) ) ( not ( = ?auto_581005 ?auto_581014 ) ) ( not ( = ?auto_581006 ?auto_581007 ) ) ( not ( = ?auto_581006 ?auto_581008 ) ) ( not ( = ?auto_581006 ?auto_581009 ) ) ( not ( = ?auto_581006 ?auto_581010 ) ) ( not ( = ?auto_581006 ?auto_581011 ) ) ( not ( = ?auto_581006 ?auto_581012 ) ) ( not ( = ?auto_581006 ?auto_581013 ) ) ( not ( = ?auto_581006 ?auto_581014 ) ) ( not ( = ?auto_581007 ?auto_581008 ) ) ( not ( = ?auto_581007 ?auto_581009 ) ) ( not ( = ?auto_581007 ?auto_581010 ) ) ( not ( = ?auto_581007 ?auto_581011 ) ) ( not ( = ?auto_581007 ?auto_581012 ) ) ( not ( = ?auto_581007 ?auto_581013 ) ) ( not ( = ?auto_581007 ?auto_581014 ) ) ( not ( = ?auto_581008 ?auto_581009 ) ) ( not ( = ?auto_581008 ?auto_581010 ) ) ( not ( = ?auto_581008 ?auto_581011 ) ) ( not ( = ?auto_581008 ?auto_581012 ) ) ( not ( = ?auto_581008 ?auto_581013 ) ) ( not ( = ?auto_581008 ?auto_581014 ) ) ( not ( = ?auto_581009 ?auto_581010 ) ) ( not ( = ?auto_581009 ?auto_581011 ) ) ( not ( = ?auto_581009 ?auto_581012 ) ) ( not ( = ?auto_581009 ?auto_581013 ) ) ( not ( = ?auto_581009 ?auto_581014 ) ) ( not ( = ?auto_581010 ?auto_581011 ) ) ( not ( = ?auto_581010 ?auto_581012 ) ) ( not ( = ?auto_581010 ?auto_581013 ) ) ( not ( = ?auto_581010 ?auto_581014 ) ) ( not ( = ?auto_581011 ?auto_581012 ) ) ( not ( = ?auto_581011 ?auto_581013 ) ) ( not ( = ?auto_581011 ?auto_581014 ) ) ( not ( = ?auto_581012 ?auto_581013 ) ) ( not ( = ?auto_581012 ?auto_581014 ) ) ( not ( = ?auto_581013 ?auto_581014 ) ) ( ON ?auto_581012 ?auto_581013 ) ( ON ?auto_581011 ?auto_581012 ) ( ON ?auto_581010 ?auto_581011 ) ( ON ?auto_581009 ?auto_581010 ) ( ON ?auto_581008 ?auto_581009 ) ( ON ?auto_581007 ?auto_581008 ) ( CLEAR ?auto_581005 ) ( ON ?auto_581006 ?auto_581007 ) ( CLEAR ?auto_581006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_581001 ?auto_581002 ?auto_581003 ?auto_581004 ?auto_581005 ?auto_581006 )
      ( MAKE-13PILE ?auto_581001 ?auto_581002 ?auto_581003 ?auto_581004 ?auto_581005 ?auto_581006 ?auto_581007 ?auto_581008 ?auto_581009 ?auto_581010 ?auto_581011 ?auto_581012 ?auto_581013 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_581055 - BLOCK
      ?auto_581056 - BLOCK
      ?auto_581057 - BLOCK
      ?auto_581058 - BLOCK
      ?auto_581059 - BLOCK
      ?auto_581060 - BLOCK
      ?auto_581061 - BLOCK
      ?auto_581062 - BLOCK
      ?auto_581063 - BLOCK
      ?auto_581064 - BLOCK
      ?auto_581065 - BLOCK
      ?auto_581066 - BLOCK
      ?auto_581067 - BLOCK
    )
    :vars
    (
      ?auto_581068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581067 ?auto_581068 ) ( ON-TABLE ?auto_581055 ) ( ON ?auto_581056 ?auto_581055 ) ( ON ?auto_581057 ?auto_581056 ) ( ON ?auto_581058 ?auto_581057 ) ( not ( = ?auto_581055 ?auto_581056 ) ) ( not ( = ?auto_581055 ?auto_581057 ) ) ( not ( = ?auto_581055 ?auto_581058 ) ) ( not ( = ?auto_581055 ?auto_581059 ) ) ( not ( = ?auto_581055 ?auto_581060 ) ) ( not ( = ?auto_581055 ?auto_581061 ) ) ( not ( = ?auto_581055 ?auto_581062 ) ) ( not ( = ?auto_581055 ?auto_581063 ) ) ( not ( = ?auto_581055 ?auto_581064 ) ) ( not ( = ?auto_581055 ?auto_581065 ) ) ( not ( = ?auto_581055 ?auto_581066 ) ) ( not ( = ?auto_581055 ?auto_581067 ) ) ( not ( = ?auto_581055 ?auto_581068 ) ) ( not ( = ?auto_581056 ?auto_581057 ) ) ( not ( = ?auto_581056 ?auto_581058 ) ) ( not ( = ?auto_581056 ?auto_581059 ) ) ( not ( = ?auto_581056 ?auto_581060 ) ) ( not ( = ?auto_581056 ?auto_581061 ) ) ( not ( = ?auto_581056 ?auto_581062 ) ) ( not ( = ?auto_581056 ?auto_581063 ) ) ( not ( = ?auto_581056 ?auto_581064 ) ) ( not ( = ?auto_581056 ?auto_581065 ) ) ( not ( = ?auto_581056 ?auto_581066 ) ) ( not ( = ?auto_581056 ?auto_581067 ) ) ( not ( = ?auto_581056 ?auto_581068 ) ) ( not ( = ?auto_581057 ?auto_581058 ) ) ( not ( = ?auto_581057 ?auto_581059 ) ) ( not ( = ?auto_581057 ?auto_581060 ) ) ( not ( = ?auto_581057 ?auto_581061 ) ) ( not ( = ?auto_581057 ?auto_581062 ) ) ( not ( = ?auto_581057 ?auto_581063 ) ) ( not ( = ?auto_581057 ?auto_581064 ) ) ( not ( = ?auto_581057 ?auto_581065 ) ) ( not ( = ?auto_581057 ?auto_581066 ) ) ( not ( = ?auto_581057 ?auto_581067 ) ) ( not ( = ?auto_581057 ?auto_581068 ) ) ( not ( = ?auto_581058 ?auto_581059 ) ) ( not ( = ?auto_581058 ?auto_581060 ) ) ( not ( = ?auto_581058 ?auto_581061 ) ) ( not ( = ?auto_581058 ?auto_581062 ) ) ( not ( = ?auto_581058 ?auto_581063 ) ) ( not ( = ?auto_581058 ?auto_581064 ) ) ( not ( = ?auto_581058 ?auto_581065 ) ) ( not ( = ?auto_581058 ?auto_581066 ) ) ( not ( = ?auto_581058 ?auto_581067 ) ) ( not ( = ?auto_581058 ?auto_581068 ) ) ( not ( = ?auto_581059 ?auto_581060 ) ) ( not ( = ?auto_581059 ?auto_581061 ) ) ( not ( = ?auto_581059 ?auto_581062 ) ) ( not ( = ?auto_581059 ?auto_581063 ) ) ( not ( = ?auto_581059 ?auto_581064 ) ) ( not ( = ?auto_581059 ?auto_581065 ) ) ( not ( = ?auto_581059 ?auto_581066 ) ) ( not ( = ?auto_581059 ?auto_581067 ) ) ( not ( = ?auto_581059 ?auto_581068 ) ) ( not ( = ?auto_581060 ?auto_581061 ) ) ( not ( = ?auto_581060 ?auto_581062 ) ) ( not ( = ?auto_581060 ?auto_581063 ) ) ( not ( = ?auto_581060 ?auto_581064 ) ) ( not ( = ?auto_581060 ?auto_581065 ) ) ( not ( = ?auto_581060 ?auto_581066 ) ) ( not ( = ?auto_581060 ?auto_581067 ) ) ( not ( = ?auto_581060 ?auto_581068 ) ) ( not ( = ?auto_581061 ?auto_581062 ) ) ( not ( = ?auto_581061 ?auto_581063 ) ) ( not ( = ?auto_581061 ?auto_581064 ) ) ( not ( = ?auto_581061 ?auto_581065 ) ) ( not ( = ?auto_581061 ?auto_581066 ) ) ( not ( = ?auto_581061 ?auto_581067 ) ) ( not ( = ?auto_581061 ?auto_581068 ) ) ( not ( = ?auto_581062 ?auto_581063 ) ) ( not ( = ?auto_581062 ?auto_581064 ) ) ( not ( = ?auto_581062 ?auto_581065 ) ) ( not ( = ?auto_581062 ?auto_581066 ) ) ( not ( = ?auto_581062 ?auto_581067 ) ) ( not ( = ?auto_581062 ?auto_581068 ) ) ( not ( = ?auto_581063 ?auto_581064 ) ) ( not ( = ?auto_581063 ?auto_581065 ) ) ( not ( = ?auto_581063 ?auto_581066 ) ) ( not ( = ?auto_581063 ?auto_581067 ) ) ( not ( = ?auto_581063 ?auto_581068 ) ) ( not ( = ?auto_581064 ?auto_581065 ) ) ( not ( = ?auto_581064 ?auto_581066 ) ) ( not ( = ?auto_581064 ?auto_581067 ) ) ( not ( = ?auto_581064 ?auto_581068 ) ) ( not ( = ?auto_581065 ?auto_581066 ) ) ( not ( = ?auto_581065 ?auto_581067 ) ) ( not ( = ?auto_581065 ?auto_581068 ) ) ( not ( = ?auto_581066 ?auto_581067 ) ) ( not ( = ?auto_581066 ?auto_581068 ) ) ( not ( = ?auto_581067 ?auto_581068 ) ) ( ON ?auto_581066 ?auto_581067 ) ( ON ?auto_581065 ?auto_581066 ) ( ON ?auto_581064 ?auto_581065 ) ( ON ?auto_581063 ?auto_581064 ) ( ON ?auto_581062 ?auto_581063 ) ( ON ?auto_581061 ?auto_581062 ) ( ON ?auto_581060 ?auto_581061 ) ( CLEAR ?auto_581058 ) ( ON ?auto_581059 ?auto_581060 ) ( CLEAR ?auto_581059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_581055 ?auto_581056 ?auto_581057 ?auto_581058 ?auto_581059 )
      ( MAKE-13PILE ?auto_581055 ?auto_581056 ?auto_581057 ?auto_581058 ?auto_581059 ?auto_581060 ?auto_581061 ?auto_581062 ?auto_581063 ?auto_581064 ?auto_581065 ?auto_581066 ?auto_581067 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_581109 - BLOCK
      ?auto_581110 - BLOCK
      ?auto_581111 - BLOCK
      ?auto_581112 - BLOCK
      ?auto_581113 - BLOCK
      ?auto_581114 - BLOCK
      ?auto_581115 - BLOCK
      ?auto_581116 - BLOCK
      ?auto_581117 - BLOCK
      ?auto_581118 - BLOCK
      ?auto_581119 - BLOCK
      ?auto_581120 - BLOCK
      ?auto_581121 - BLOCK
    )
    :vars
    (
      ?auto_581122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581121 ?auto_581122 ) ( ON-TABLE ?auto_581109 ) ( ON ?auto_581110 ?auto_581109 ) ( ON ?auto_581111 ?auto_581110 ) ( not ( = ?auto_581109 ?auto_581110 ) ) ( not ( = ?auto_581109 ?auto_581111 ) ) ( not ( = ?auto_581109 ?auto_581112 ) ) ( not ( = ?auto_581109 ?auto_581113 ) ) ( not ( = ?auto_581109 ?auto_581114 ) ) ( not ( = ?auto_581109 ?auto_581115 ) ) ( not ( = ?auto_581109 ?auto_581116 ) ) ( not ( = ?auto_581109 ?auto_581117 ) ) ( not ( = ?auto_581109 ?auto_581118 ) ) ( not ( = ?auto_581109 ?auto_581119 ) ) ( not ( = ?auto_581109 ?auto_581120 ) ) ( not ( = ?auto_581109 ?auto_581121 ) ) ( not ( = ?auto_581109 ?auto_581122 ) ) ( not ( = ?auto_581110 ?auto_581111 ) ) ( not ( = ?auto_581110 ?auto_581112 ) ) ( not ( = ?auto_581110 ?auto_581113 ) ) ( not ( = ?auto_581110 ?auto_581114 ) ) ( not ( = ?auto_581110 ?auto_581115 ) ) ( not ( = ?auto_581110 ?auto_581116 ) ) ( not ( = ?auto_581110 ?auto_581117 ) ) ( not ( = ?auto_581110 ?auto_581118 ) ) ( not ( = ?auto_581110 ?auto_581119 ) ) ( not ( = ?auto_581110 ?auto_581120 ) ) ( not ( = ?auto_581110 ?auto_581121 ) ) ( not ( = ?auto_581110 ?auto_581122 ) ) ( not ( = ?auto_581111 ?auto_581112 ) ) ( not ( = ?auto_581111 ?auto_581113 ) ) ( not ( = ?auto_581111 ?auto_581114 ) ) ( not ( = ?auto_581111 ?auto_581115 ) ) ( not ( = ?auto_581111 ?auto_581116 ) ) ( not ( = ?auto_581111 ?auto_581117 ) ) ( not ( = ?auto_581111 ?auto_581118 ) ) ( not ( = ?auto_581111 ?auto_581119 ) ) ( not ( = ?auto_581111 ?auto_581120 ) ) ( not ( = ?auto_581111 ?auto_581121 ) ) ( not ( = ?auto_581111 ?auto_581122 ) ) ( not ( = ?auto_581112 ?auto_581113 ) ) ( not ( = ?auto_581112 ?auto_581114 ) ) ( not ( = ?auto_581112 ?auto_581115 ) ) ( not ( = ?auto_581112 ?auto_581116 ) ) ( not ( = ?auto_581112 ?auto_581117 ) ) ( not ( = ?auto_581112 ?auto_581118 ) ) ( not ( = ?auto_581112 ?auto_581119 ) ) ( not ( = ?auto_581112 ?auto_581120 ) ) ( not ( = ?auto_581112 ?auto_581121 ) ) ( not ( = ?auto_581112 ?auto_581122 ) ) ( not ( = ?auto_581113 ?auto_581114 ) ) ( not ( = ?auto_581113 ?auto_581115 ) ) ( not ( = ?auto_581113 ?auto_581116 ) ) ( not ( = ?auto_581113 ?auto_581117 ) ) ( not ( = ?auto_581113 ?auto_581118 ) ) ( not ( = ?auto_581113 ?auto_581119 ) ) ( not ( = ?auto_581113 ?auto_581120 ) ) ( not ( = ?auto_581113 ?auto_581121 ) ) ( not ( = ?auto_581113 ?auto_581122 ) ) ( not ( = ?auto_581114 ?auto_581115 ) ) ( not ( = ?auto_581114 ?auto_581116 ) ) ( not ( = ?auto_581114 ?auto_581117 ) ) ( not ( = ?auto_581114 ?auto_581118 ) ) ( not ( = ?auto_581114 ?auto_581119 ) ) ( not ( = ?auto_581114 ?auto_581120 ) ) ( not ( = ?auto_581114 ?auto_581121 ) ) ( not ( = ?auto_581114 ?auto_581122 ) ) ( not ( = ?auto_581115 ?auto_581116 ) ) ( not ( = ?auto_581115 ?auto_581117 ) ) ( not ( = ?auto_581115 ?auto_581118 ) ) ( not ( = ?auto_581115 ?auto_581119 ) ) ( not ( = ?auto_581115 ?auto_581120 ) ) ( not ( = ?auto_581115 ?auto_581121 ) ) ( not ( = ?auto_581115 ?auto_581122 ) ) ( not ( = ?auto_581116 ?auto_581117 ) ) ( not ( = ?auto_581116 ?auto_581118 ) ) ( not ( = ?auto_581116 ?auto_581119 ) ) ( not ( = ?auto_581116 ?auto_581120 ) ) ( not ( = ?auto_581116 ?auto_581121 ) ) ( not ( = ?auto_581116 ?auto_581122 ) ) ( not ( = ?auto_581117 ?auto_581118 ) ) ( not ( = ?auto_581117 ?auto_581119 ) ) ( not ( = ?auto_581117 ?auto_581120 ) ) ( not ( = ?auto_581117 ?auto_581121 ) ) ( not ( = ?auto_581117 ?auto_581122 ) ) ( not ( = ?auto_581118 ?auto_581119 ) ) ( not ( = ?auto_581118 ?auto_581120 ) ) ( not ( = ?auto_581118 ?auto_581121 ) ) ( not ( = ?auto_581118 ?auto_581122 ) ) ( not ( = ?auto_581119 ?auto_581120 ) ) ( not ( = ?auto_581119 ?auto_581121 ) ) ( not ( = ?auto_581119 ?auto_581122 ) ) ( not ( = ?auto_581120 ?auto_581121 ) ) ( not ( = ?auto_581120 ?auto_581122 ) ) ( not ( = ?auto_581121 ?auto_581122 ) ) ( ON ?auto_581120 ?auto_581121 ) ( ON ?auto_581119 ?auto_581120 ) ( ON ?auto_581118 ?auto_581119 ) ( ON ?auto_581117 ?auto_581118 ) ( ON ?auto_581116 ?auto_581117 ) ( ON ?auto_581115 ?auto_581116 ) ( ON ?auto_581114 ?auto_581115 ) ( ON ?auto_581113 ?auto_581114 ) ( CLEAR ?auto_581111 ) ( ON ?auto_581112 ?auto_581113 ) ( CLEAR ?auto_581112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_581109 ?auto_581110 ?auto_581111 ?auto_581112 )
      ( MAKE-13PILE ?auto_581109 ?auto_581110 ?auto_581111 ?auto_581112 ?auto_581113 ?auto_581114 ?auto_581115 ?auto_581116 ?auto_581117 ?auto_581118 ?auto_581119 ?auto_581120 ?auto_581121 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_581163 - BLOCK
      ?auto_581164 - BLOCK
      ?auto_581165 - BLOCK
      ?auto_581166 - BLOCK
      ?auto_581167 - BLOCK
      ?auto_581168 - BLOCK
      ?auto_581169 - BLOCK
      ?auto_581170 - BLOCK
      ?auto_581171 - BLOCK
      ?auto_581172 - BLOCK
      ?auto_581173 - BLOCK
      ?auto_581174 - BLOCK
      ?auto_581175 - BLOCK
    )
    :vars
    (
      ?auto_581176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581175 ?auto_581176 ) ( ON-TABLE ?auto_581163 ) ( ON ?auto_581164 ?auto_581163 ) ( not ( = ?auto_581163 ?auto_581164 ) ) ( not ( = ?auto_581163 ?auto_581165 ) ) ( not ( = ?auto_581163 ?auto_581166 ) ) ( not ( = ?auto_581163 ?auto_581167 ) ) ( not ( = ?auto_581163 ?auto_581168 ) ) ( not ( = ?auto_581163 ?auto_581169 ) ) ( not ( = ?auto_581163 ?auto_581170 ) ) ( not ( = ?auto_581163 ?auto_581171 ) ) ( not ( = ?auto_581163 ?auto_581172 ) ) ( not ( = ?auto_581163 ?auto_581173 ) ) ( not ( = ?auto_581163 ?auto_581174 ) ) ( not ( = ?auto_581163 ?auto_581175 ) ) ( not ( = ?auto_581163 ?auto_581176 ) ) ( not ( = ?auto_581164 ?auto_581165 ) ) ( not ( = ?auto_581164 ?auto_581166 ) ) ( not ( = ?auto_581164 ?auto_581167 ) ) ( not ( = ?auto_581164 ?auto_581168 ) ) ( not ( = ?auto_581164 ?auto_581169 ) ) ( not ( = ?auto_581164 ?auto_581170 ) ) ( not ( = ?auto_581164 ?auto_581171 ) ) ( not ( = ?auto_581164 ?auto_581172 ) ) ( not ( = ?auto_581164 ?auto_581173 ) ) ( not ( = ?auto_581164 ?auto_581174 ) ) ( not ( = ?auto_581164 ?auto_581175 ) ) ( not ( = ?auto_581164 ?auto_581176 ) ) ( not ( = ?auto_581165 ?auto_581166 ) ) ( not ( = ?auto_581165 ?auto_581167 ) ) ( not ( = ?auto_581165 ?auto_581168 ) ) ( not ( = ?auto_581165 ?auto_581169 ) ) ( not ( = ?auto_581165 ?auto_581170 ) ) ( not ( = ?auto_581165 ?auto_581171 ) ) ( not ( = ?auto_581165 ?auto_581172 ) ) ( not ( = ?auto_581165 ?auto_581173 ) ) ( not ( = ?auto_581165 ?auto_581174 ) ) ( not ( = ?auto_581165 ?auto_581175 ) ) ( not ( = ?auto_581165 ?auto_581176 ) ) ( not ( = ?auto_581166 ?auto_581167 ) ) ( not ( = ?auto_581166 ?auto_581168 ) ) ( not ( = ?auto_581166 ?auto_581169 ) ) ( not ( = ?auto_581166 ?auto_581170 ) ) ( not ( = ?auto_581166 ?auto_581171 ) ) ( not ( = ?auto_581166 ?auto_581172 ) ) ( not ( = ?auto_581166 ?auto_581173 ) ) ( not ( = ?auto_581166 ?auto_581174 ) ) ( not ( = ?auto_581166 ?auto_581175 ) ) ( not ( = ?auto_581166 ?auto_581176 ) ) ( not ( = ?auto_581167 ?auto_581168 ) ) ( not ( = ?auto_581167 ?auto_581169 ) ) ( not ( = ?auto_581167 ?auto_581170 ) ) ( not ( = ?auto_581167 ?auto_581171 ) ) ( not ( = ?auto_581167 ?auto_581172 ) ) ( not ( = ?auto_581167 ?auto_581173 ) ) ( not ( = ?auto_581167 ?auto_581174 ) ) ( not ( = ?auto_581167 ?auto_581175 ) ) ( not ( = ?auto_581167 ?auto_581176 ) ) ( not ( = ?auto_581168 ?auto_581169 ) ) ( not ( = ?auto_581168 ?auto_581170 ) ) ( not ( = ?auto_581168 ?auto_581171 ) ) ( not ( = ?auto_581168 ?auto_581172 ) ) ( not ( = ?auto_581168 ?auto_581173 ) ) ( not ( = ?auto_581168 ?auto_581174 ) ) ( not ( = ?auto_581168 ?auto_581175 ) ) ( not ( = ?auto_581168 ?auto_581176 ) ) ( not ( = ?auto_581169 ?auto_581170 ) ) ( not ( = ?auto_581169 ?auto_581171 ) ) ( not ( = ?auto_581169 ?auto_581172 ) ) ( not ( = ?auto_581169 ?auto_581173 ) ) ( not ( = ?auto_581169 ?auto_581174 ) ) ( not ( = ?auto_581169 ?auto_581175 ) ) ( not ( = ?auto_581169 ?auto_581176 ) ) ( not ( = ?auto_581170 ?auto_581171 ) ) ( not ( = ?auto_581170 ?auto_581172 ) ) ( not ( = ?auto_581170 ?auto_581173 ) ) ( not ( = ?auto_581170 ?auto_581174 ) ) ( not ( = ?auto_581170 ?auto_581175 ) ) ( not ( = ?auto_581170 ?auto_581176 ) ) ( not ( = ?auto_581171 ?auto_581172 ) ) ( not ( = ?auto_581171 ?auto_581173 ) ) ( not ( = ?auto_581171 ?auto_581174 ) ) ( not ( = ?auto_581171 ?auto_581175 ) ) ( not ( = ?auto_581171 ?auto_581176 ) ) ( not ( = ?auto_581172 ?auto_581173 ) ) ( not ( = ?auto_581172 ?auto_581174 ) ) ( not ( = ?auto_581172 ?auto_581175 ) ) ( not ( = ?auto_581172 ?auto_581176 ) ) ( not ( = ?auto_581173 ?auto_581174 ) ) ( not ( = ?auto_581173 ?auto_581175 ) ) ( not ( = ?auto_581173 ?auto_581176 ) ) ( not ( = ?auto_581174 ?auto_581175 ) ) ( not ( = ?auto_581174 ?auto_581176 ) ) ( not ( = ?auto_581175 ?auto_581176 ) ) ( ON ?auto_581174 ?auto_581175 ) ( ON ?auto_581173 ?auto_581174 ) ( ON ?auto_581172 ?auto_581173 ) ( ON ?auto_581171 ?auto_581172 ) ( ON ?auto_581170 ?auto_581171 ) ( ON ?auto_581169 ?auto_581170 ) ( ON ?auto_581168 ?auto_581169 ) ( ON ?auto_581167 ?auto_581168 ) ( ON ?auto_581166 ?auto_581167 ) ( CLEAR ?auto_581164 ) ( ON ?auto_581165 ?auto_581166 ) ( CLEAR ?auto_581165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_581163 ?auto_581164 ?auto_581165 )
      ( MAKE-13PILE ?auto_581163 ?auto_581164 ?auto_581165 ?auto_581166 ?auto_581167 ?auto_581168 ?auto_581169 ?auto_581170 ?auto_581171 ?auto_581172 ?auto_581173 ?auto_581174 ?auto_581175 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_581217 - BLOCK
      ?auto_581218 - BLOCK
      ?auto_581219 - BLOCK
      ?auto_581220 - BLOCK
      ?auto_581221 - BLOCK
      ?auto_581222 - BLOCK
      ?auto_581223 - BLOCK
      ?auto_581224 - BLOCK
      ?auto_581225 - BLOCK
      ?auto_581226 - BLOCK
      ?auto_581227 - BLOCK
      ?auto_581228 - BLOCK
      ?auto_581229 - BLOCK
    )
    :vars
    (
      ?auto_581230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581229 ?auto_581230 ) ( ON-TABLE ?auto_581217 ) ( not ( = ?auto_581217 ?auto_581218 ) ) ( not ( = ?auto_581217 ?auto_581219 ) ) ( not ( = ?auto_581217 ?auto_581220 ) ) ( not ( = ?auto_581217 ?auto_581221 ) ) ( not ( = ?auto_581217 ?auto_581222 ) ) ( not ( = ?auto_581217 ?auto_581223 ) ) ( not ( = ?auto_581217 ?auto_581224 ) ) ( not ( = ?auto_581217 ?auto_581225 ) ) ( not ( = ?auto_581217 ?auto_581226 ) ) ( not ( = ?auto_581217 ?auto_581227 ) ) ( not ( = ?auto_581217 ?auto_581228 ) ) ( not ( = ?auto_581217 ?auto_581229 ) ) ( not ( = ?auto_581217 ?auto_581230 ) ) ( not ( = ?auto_581218 ?auto_581219 ) ) ( not ( = ?auto_581218 ?auto_581220 ) ) ( not ( = ?auto_581218 ?auto_581221 ) ) ( not ( = ?auto_581218 ?auto_581222 ) ) ( not ( = ?auto_581218 ?auto_581223 ) ) ( not ( = ?auto_581218 ?auto_581224 ) ) ( not ( = ?auto_581218 ?auto_581225 ) ) ( not ( = ?auto_581218 ?auto_581226 ) ) ( not ( = ?auto_581218 ?auto_581227 ) ) ( not ( = ?auto_581218 ?auto_581228 ) ) ( not ( = ?auto_581218 ?auto_581229 ) ) ( not ( = ?auto_581218 ?auto_581230 ) ) ( not ( = ?auto_581219 ?auto_581220 ) ) ( not ( = ?auto_581219 ?auto_581221 ) ) ( not ( = ?auto_581219 ?auto_581222 ) ) ( not ( = ?auto_581219 ?auto_581223 ) ) ( not ( = ?auto_581219 ?auto_581224 ) ) ( not ( = ?auto_581219 ?auto_581225 ) ) ( not ( = ?auto_581219 ?auto_581226 ) ) ( not ( = ?auto_581219 ?auto_581227 ) ) ( not ( = ?auto_581219 ?auto_581228 ) ) ( not ( = ?auto_581219 ?auto_581229 ) ) ( not ( = ?auto_581219 ?auto_581230 ) ) ( not ( = ?auto_581220 ?auto_581221 ) ) ( not ( = ?auto_581220 ?auto_581222 ) ) ( not ( = ?auto_581220 ?auto_581223 ) ) ( not ( = ?auto_581220 ?auto_581224 ) ) ( not ( = ?auto_581220 ?auto_581225 ) ) ( not ( = ?auto_581220 ?auto_581226 ) ) ( not ( = ?auto_581220 ?auto_581227 ) ) ( not ( = ?auto_581220 ?auto_581228 ) ) ( not ( = ?auto_581220 ?auto_581229 ) ) ( not ( = ?auto_581220 ?auto_581230 ) ) ( not ( = ?auto_581221 ?auto_581222 ) ) ( not ( = ?auto_581221 ?auto_581223 ) ) ( not ( = ?auto_581221 ?auto_581224 ) ) ( not ( = ?auto_581221 ?auto_581225 ) ) ( not ( = ?auto_581221 ?auto_581226 ) ) ( not ( = ?auto_581221 ?auto_581227 ) ) ( not ( = ?auto_581221 ?auto_581228 ) ) ( not ( = ?auto_581221 ?auto_581229 ) ) ( not ( = ?auto_581221 ?auto_581230 ) ) ( not ( = ?auto_581222 ?auto_581223 ) ) ( not ( = ?auto_581222 ?auto_581224 ) ) ( not ( = ?auto_581222 ?auto_581225 ) ) ( not ( = ?auto_581222 ?auto_581226 ) ) ( not ( = ?auto_581222 ?auto_581227 ) ) ( not ( = ?auto_581222 ?auto_581228 ) ) ( not ( = ?auto_581222 ?auto_581229 ) ) ( not ( = ?auto_581222 ?auto_581230 ) ) ( not ( = ?auto_581223 ?auto_581224 ) ) ( not ( = ?auto_581223 ?auto_581225 ) ) ( not ( = ?auto_581223 ?auto_581226 ) ) ( not ( = ?auto_581223 ?auto_581227 ) ) ( not ( = ?auto_581223 ?auto_581228 ) ) ( not ( = ?auto_581223 ?auto_581229 ) ) ( not ( = ?auto_581223 ?auto_581230 ) ) ( not ( = ?auto_581224 ?auto_581225 ) ) ( not ( = ?auto_581224 ?auto_581226 ) ) ( not ( = ?auto_581224 ?auto_581227 ) ) ( not ( = ?auto_581224 ?auto_581228 ) ) ( not ( = ?auto_581224 ?auto_581229 ) ) ( not ( = ?auto_581224 ?auto_581230 ) ) ( not ( = ?auto_581225 ?auto_581226 ) ) ( not ( = ?auto_581225 ?auto_581227 ) ) ( not ( = ?auto_581225 ?auto_581228 ) ) ( not ( = ?auto_581225 ?auto_581229 ) ) ( not ( = ?auto_581225 ?auto_581230 ) ) ( not ( = ?auto_581226 ?auto_581227 ) ) ( not ( = ?auto_581226 ?auto_581228 ) ) ( not ( = ?auto_581226 ?auto_581229 ) ) ( not ( = ?auto_581226 ?auto_581230 ) ) ( not ( = ?auto_581227 ?auto_581228 ) ) ( not ( = ?auto_581227 ?auto_581229 ) ) ( not ( = ?auto_581227 ?auto_581230 ) ) ( not ( = ?auto_581228 ?auto_581229 ) ) ( not ( = ?auto_581228 ?auto_581230 ) ) ( not ( = ?auto_581229 ?auto_581230 ) ) ( ON ?auto_581228 ?auto_581229 ) ( ON ?auto_581227 ?auto_581228 ) ( ON ?auto_581226 ?auto_581227 ) ( ON ?auto_581225 ?auto_581226 ) ( ON ?auto_581224 ?auto_581225 ) ( ON ?auto_581223 ?auto_581224 ) ( ON ?auto_581222 ?auto_581223 ) ( ON ?auto_581221 ?auto_581222 ) ( ON ?auto_581220 ?auto_581221 ) ( ON ?auto_581219 ?auto_581220 ) ( CLEAR ?auto_581217 ) ( ON ?auto_581218 ?auto_581219 ) ( CLEAR ?auto_581218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_581217 ?auto_581218 )
      ( MAKE-13PILE ?auto_581217 ?auto_581218 ?auto_581219 ?auto_581220 ?auto_581221 ?auto_581222 ?auto_581223 ?auto_581224 ?auto_581225 ?auto_581226 ?auto_581227 ?auto_581228 ?auto_581229 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_581271 - BLOCK
      ?auto_581272 - BLOCK
      ?auto_581273 - BLOCK
      ?auto_581274 - BLOCK
      ?auto_581275 - BLOCK
      ?auto_581276 - BLOCK
      ?auto_581277 - BLOCK
      ?auto_581278 - BLOCK
      ?auto_581279 - BLOCK
      ?auto_581280 - BLOCK
      ?auto_581281 - BLOCK
      ?auto_581282 - BLOCK
      ?auto_581283 - BLOCK
    )
    :vars
    (
      ?auto_581284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581283 ?auto_581284 ) ( not ( = ?auto_581271 ?auto_581272 ) ) ( not ( = ?auto_581271 ?auto_581273 ) ) ( not ( = ?auto_581271 ?auto_581274 ) ) ( not ( = ?auto_581271 ?auto_581275 ) ) ( not ( = ?auto_581271 ?auto_581276 ) ) ( not ( = ?auto_581271 ?auto_581277 ) ) ( not ( = ?auto_581271 ?auto_581278 ) ) ( not ( = ?auto_581271 ?auto_581279 ) ) ( not ( = ?auto_581271 ?auto_581280 ) ) ( not ( = ?auto_581271 ?auto_581281 ) ) ( not ( = ?auto_581271 ?auto_581282 ) ) ( not ( = ?auto_581271 ?auto_581283 ) ) ( not ( = ?auto_581271 ?auto_581284 ) ) ( not ( = ?auto_581272 ?auto_581273 ) ) ( not ( = ?auto_581272 ?auto_581274 ) ) ( not ( = ?auto_581272 ?auto_581275 ) ) ( not ( = ?auto_581272 ?auto_581276 ) ) ( not ( = ?auto_581272 ?auto_581277 ) ) ( not ( = ?auto_581272 ?auto_581278 ) ) ( not ( = ?auto_581272 ?auto_581279 ) ) ( not ( = ?auto_581272 ?auto_581280 ) ) ( not ( = ?auto_581272 ?auto_581281 ) ) ( not ( = ?auto_581272 ?auto_581282 ) ) ( not ( = ?auto_581272 ?auto_581283 ) ) ( not ( = ?auto_581272 ?auto_581284 ) ) ( not ( = ?auto_581273 ?auto_581274 ) ) ( not ( = ?auto_581273 ?auto_581275 ) ) ( not ( = ?auto_581273 ?auto_581276 ) ) ( not ( = ?auto_581273 ?auto_581277 ) ) ( not ( = ?auto_581273 ?auto_581278 ) ) ( not ( = ?auto_581273 ?auto_581279 ) ) ( not ( = ?auto_581273 ?auto_581280 ) ) ( not ( = ?auto_581273 ?auto_581281 ) ) ( not ( = ?auto_581273 ?auto_581282 ) ) ( not ( = ?auto_581273 ?auto_581283 ) ) ( not ( = ?auto_581273 ?auto_581284 ) ) ( not ( = ?auto_581274 ?auto_581275 ) ) ( not ( = ?auto_581274 ?auto_581276 ) ) ( not ( = ?auto_581274 ?auto_581277 ) ) ( not ( = ?auto_581274 ?auto_581278 ) ) ( not ( = ?auto_581274 ?auto_581279 ) ) ( not ( = ?auto_581274 ?auto_581280 ) ) ( not ( = ?auto_581274 ?auto_581281 ) ) ( not ( = ?auto_581274 ?auto_581282 ) ) ( not ( = ?auto_581274 ?auto_581283 ) ) ( not ( = ?auto_581274 ?auto_581284 ) ) ( not ( = ?auto_581275 ?auto_581276 ) ) ( not ( = ?auto_581275 ?auto_581277 ) ) ( not ( = ?auto_581275 ?auto_581278 ) ) ( not ( = ?auto_581275 ?auto_581279 ) ) ( not ( = ?auto_581275 ?auto_581280 ) ) ( not ( = ?auto_581275 ?auto_581281 ) ) ( not ( = ?auto_581275 ?auto_581282 ) ) ( not ( = ?auto_581275 ?auto_581283 ) ) ( not ( = ?auto_581275 ?auto_581284 ) ) ( not ( = ?auto_581276 ?auto_581277 ) ) ( not ( = ?auto_581276 ?auto_581278 ) ) ( not ( = ?auto_581276 ?auto_581279 ) ) ( not ( = ?auto_581276 ?auto_581280 ) ) ( not ( = ?auto_581276 ?auto_581281 ) ) ( not ( = ?auto_581276 ?auto_581282 ) ) ( not ( = ?auto_581276 ?auto_581283 ) ) ( not ( = ?auto_581276 ?auto_581284 ) ) ( not ( = ?auto_581277 ?auto_581278 ) ) ( not ( = ?auto_581277 ?auto_581279 ) ) ( not ( = ?auto_581277 ?auto_581280 ) ) ( not ( = ?auto_581277 ?auto_581281 ) ) ( not ( = ?auto_581277 ?auto_581282 ) ) ( not ( = ?auto_581277 ?auto_581283 ) ) ( not ( = ?auto_581277 ?auto_581284 ) ) ( not ( = ?auto_581278 ?auto_581279 ) ) ( not ( = ?auto_581278 ?auto_581280 ) ) ( not ( = ?auto_581278 ?auto_581281 ) ) ( not ( = ?auto_581278 ?auto_581282 ) ) ( not ( = ?auto_581278 ?auto_581283 ) ) ( not ( = ?auto_581278 ?auto_581284 ) ) ( not ( = ?auto_581279 ?auto_581280 ) ) ( not ( = ?auto_581279 ?auto_581281 ) ) ( not ( = ?auto_581279 ?auto_581282 ) ) ( not ( = ?auto_581279 ?auto_581283 ) ) ( not ( = ?auto_581279 ?auto_581284 ) ) ( not ( = ?auto_581280 ?auto_581281 ) ) ( not ( = ?auto_581280 ?auto_581282 ) ) ( not ( = ?auto_581280 ?auto_581283 ) ) ( not ( = ?auto_581280 ?auto_581284 ) ) ( not ( = ?auto_581281 ?auto_581282 ) ) ( not ( = ?auto_581281 ?auto_581283 ) ) ( not ( = ?auto_581281 ?auto_581284 ) ) ( not ( = ?auto_581282 ?auto_581283 ) ) ( not ( = ?auto_581282 ?auto_581284 ) ) ( not ( = ?auto_581283 ?auto_581284 ) ) ( ON ?auto_581282 ?auto_581283 ) ( ON ?auto_581281 ?auto_581282 ) ( ON ?auto_581280 ?auto_581281 ) ( ON ?auto_581279 ?auto_581280 ) ( ON ?auto_581278 ?auto_581279 ) ( ON ?auto_581277 ?auto_581278 ) ( ON ?auto_581276 ?auto_581277 ) ( ON ?auto_581275 ?auto_581276 ) ( ON ?auto_581274 ?auto_581275 ) ( ON ?auto_581273 ?auto_581274 ) ( ON ?auto_581272 ?auto_581273 ) ( ON ?auto_581271 ?auto_581272 ) ( CLEAR ?auto_581271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_581271 )
      ( MAKE-13PILE ?auto_581271 ?auto_581272 ?auto_581273 ?auto_581274 ?auto_581275 ?auto_581276 ?auto_581277 ?auto_581278 ?auto_581279 ?auto_581280 ?auto_581281 ?auto_581282 ?auto_581283 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_581326 - BLOCK
      ?auto_581327 - BLOCK
      ?auto_581328 - BLOCK
      ?auto_581329 - BLOCK
      ?auto_581330 - BLOCK
      ?auto_581331 - BLOCK
      ?auto_581332 - BLOCK
      ?auto_581333 - BLOCK
      ?auto_581334 - BLOCK
      ?auto_581335 - BLOCK
      ?auto_581336 - BLOCK
      ?auto_581337 - BLOCK
      ?auto_581338 - BLOCK
      ?auto_581339 - BLOCK
    )
    :vars
    (
      ?auto_581340 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_581338 ) ( ON ?auto_581339 ?auto_581340 ) ( CLEAR ?auto_581339 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_581326 ) ( ON ?auto_581327 ?auto_581326 ) ( ON ?auto_581328 ?auto_581327 ) ( ON ?auto_581329 ?auto_581328 ) ( ON ?auto_581330 ?auto_581329 ) ( ON ?auto_581331 ?auto_581330 ) ( ON ?auto_581332 ?auto_581331 ) ( ON ?auto_581333 ?auto_581332 ) ( ON ?auto_581334 ?auto_581333 ) ( ON ?auto_581335 ?auto_581334 ) ( ON ?auto_581336 ?auto_581335 ) ( ON ?auto_581337 ?auto_581336 ) ( ON ?auto_581338 ?auto_581337 ) ( not ( = ?auto_581326 ?auto_581327 ) ) ( not ( = ?auto_581326 ?auto_581328 ) ) ( not ( = ?auto_581326 ?auto_581329 ) ) ( not ( = ?auto_581326 ?auto_581330 ) ) ( not ( = ?auto_581326 ?auto_581331 ) ) ( not ( = ?auto_581326 ?auto_581332 ) ) ( not ( = ?auto_581326 ?auto_581333 ) ) ( not ( = ?auto_581326 ?auto_581334 ) ) ( not ( = ?auto_581326 ?auto_581335 ) ) ( not ( = ?auto_581326 ?auto_581336 ) ) ( not ( = ?auto_581326 ?auto_581337 ) ) ( not ( = ?auto_581326 ?auto_581338 ) ) ( not ( = ?auto_581326 ?auto_581339 ) ) ( not ( = ?auto_581326 ?auto_581340 ) ) ( not ( = ?auto_581327 ?auto_581328 ) ) ( not ( = ?auto_581327 ?auto_581329 ) ) ( not ( = ?auto_581327 ?auto_581330 ) ) ( not ( = ?auto_581327 ?auto_581331 ) ) ( not ( = ?auto_581327 ?auto_581332 ) ) ( not ( = ?auto_581327 ?auto_581333 ) ) ( not ( = ?auto_581327 ?auto_581334 ) ) ( not ( = ?auto_581327 ?auto_581335 ) ) ( not ( = ?auto_581327 ?auto_581336 ) ) ( not ( = ?auto_581327 ?auto_581337 ) ) ( not ( = ?auto_581327 ?auto_581338 ) ) ( not ( = ?auto_581327 ?auto_581339 ) ) ( not ( = ?auto_581327 ?auto_581340 ) ) ( not ( = ?auto_581328 ?auto_581329 ) ) ( not ( = ?auto_581328 ?auto_581330 ) ) ( not ( = ?auto_581328 ?auto_581331 ) ) ( not ( = ?auto_581328 ?auto_581332 ) ) ( not ( = ?auto_581328 ?auto_581333 ) ) ( not ( = ?auto_581328 ?auto_581334 ) ) ( not ( = ?auto_581328 ?auto_581335 ) ) ( not ( = ?auto_581328 ?auto_581336 ) ) ( not ( = ?auto_581328 ?auto_581337 ) ) ( not ( = ?auto_581328 ?auto_581338 ) ) ( not ( = ?auto_581328 ?auto_581339 ) ) ( not ( = ?auto_581328 ?auto_581340 ) ) ( not ( = ?auto_581329 ?auto_581330 ) ) ( not ( = ?auto_581329 ?auto_581331 ) ) ( not ( = ?auto_581329 ?auto_581332 ) ) ( not ( = ?auto_581329 ?auto_581333 ) ) ( not ( = ?auto_581329 ?auto_581334 ) ) ( not ( = ?auto_581329 ?auto_581335 ) ) ( not ( = ?auto_581329 ?auto_581336 ) ) ( not ( = ?auto_581329 ?auto_581337 ) ) ( not ( = ?auto_581329 ?auto_581338 ) ) ( not ( = ?auto_581329 ?auto_581339 ) ) ( not ( = ?auto_581329 ?auto_581340 ) ) ( not ( = ?auto_581330 ?auto_581331 ) ) ( not ( = ?auto_581330 ?auto_581332 ) ) ( not ( = ?auto_581330 ?auto_581333 ) ) ( not ( = ?auto_581330 ?auto_581334 ) ) ( not ( = ?auto_581330 ?auto_581335 ) ) ( not ( = ?auto_581330 ?auto_581336 ) ) ( not ( = ?auto_581330 ?auto_581337 ) ) ( not ( = ?auto_581330 ?auto_581338 ) ) ( not ( = ?auto_581330 ?auto_581339 ) ) ( not ( = ?auto_581330 ?auto_581340 ) ) ( not ( = ?auto_581331 ?auto_581332 ) ) ( not ( = ?auto_581331 ?auto_581333 ) ) ( not ( = ?auto_581331 ?auto_581334 ) ) ( not ( = ?auto_581331 ?auto_581335 ) ) ( not ( = ?auto_581331 ?auto_581336 ) ) ( not ( = ?auto_581331 ?auto_581337 ) ) ( not ( = ?auto_581331 ?auto_581338 ) ) ( not ( = ?auto_581331 ?auto_581339 ) ) ( not ( = ?auto_581331 ?auto_581340 ) ) ( not ( = ?auto_581332 ?auto_581333 ) ) ( not ( = ?auto_581332 ?auto_581334 ) ) ( not ( = ?auto_581332 ?auto_581335 ) ) ( not ( = ?auto_581332 ?auto_581336 ) ) ( not ( = ?auto_581332 ?auto_581337 ) ) ( not ( = ?auto_581332 ?auto_581338 ) ) ( not ( = ?auto_581332 ?auto_581339 ) ) ( not ( = ?auto_581332 ?auto_581340 ) ) ( not ( = ?auto_581333 ?auto_581334 ) ) ( not ( = ?auto_581333 ?auto_581335 ) ) ( not ( = ?auto_581333 ?auto_581336 ) ) ( not ( = ?auto_581333 ?auto_581337 ) ) ( not ( = ?auto_581333 ?auto_581338 ) ) ( not ( = ?auto_581333 ?auto_581339 ) ) ( not ( = ?auto_581333 ?auto_581340 ) ) ( not ( = ?auto_581334 ?auto_581335 ) ) ( not ( = ?auto_581334 ?auto_581336 ) ) ( not ( = ?auto_581334 ?auto_581337 ) ) ( not ( = ?auto_581334 ?auto_581338 ) ) ( not ( = ?auto_581334 ?auto_581339 ) ) ( not ( = ?auto_581334 ?auto_581340 ) ) ( not ( = ?auto_581335 ?auto_581336 ) ) ( not ( = ?auto_581335 ?auto_581337 ) ) ( not ( = ?auto_581335 ?auto_581338 ) ) ( not ( = ?auto_581335 ?auto_581339 ) ) ( not ( = ?auto_581335 ?auto_581340 ) ) ( not ( = ?auto_581336 ?auto_581337 ) ) ( not ( = ?auto_581336 ?auto_581338 ) ) ( not ( = ?auto_581336 ?auto_581339 ) ) ( not ( = ?auto_581336 ?auto_581340 ) ) ( not ( = ?auto_581337 ?auto_581338 ) ) ( not ( = ?auto_581337 ?auto_581339 ) ) ( not ( = ?auto_581337 ?auto_581340 ) ) ( not ( = ?auto_581338 ?auto_581339 ) ) ( not ( = ?auto_581338 ?auto_581340 ) ) ( not ( = ?auto_581339 ?auto_581340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_581339 ?auto_581340 )
      ( !STACK ?auto_581339 ?auto_581338 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_581384 - BLOCK
      ?auto_581385 - BLOCK
      ?auto_581386 - BLOCK
      ?auto_581387 - BLOCK
      ?auto_581388 - BLOCK
      ?auto_581389 - BLOCK
      ?auto_581390 - BLOCK
      ?auto_581391 - BLOCK
      ?auto_581392 - BLOCK
      ?auto_581393 - BLOCK
      ?auto_581394 - BLOCK
      ?auto_581395 - BLOCK
      ?auto_581396 - BLOCK
      ?auto_581397 - BLOCK
    )
    :vars
    (
      ?auto_581398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581397 ?auto_581398 ) ( ON-TABLE ?auto_581384 ) ( ON ?auto_581385 ?auto_581384 ) ( ON ?auto_581386 ?auto_581385 ) ( ON ?auto_581387 ?auto_581386 ) ( ON ?auto_581388 ?auto_581387 ) ( ON ?auto_581389 ?auto_581388 ) ( ON ?auto_581390 ?auto_581389 ) ( ON ?auto_581391 ?auto_581390 ) ( ON ?auto_581392 ?auto_581391 ) ( ON ?auto_581393 ?auto_581392 ) ( ON ?auto_581394 ?auto_581393 ) ( ON ?auto_581395 ?auto_581394 ) ( not ( = ?auto_581384 ?auto_581385 ) ) ( not ( = ?auto_581384 ?auto_581386 ) ) ( not ( = ?auto_581384 ?auto_581387 ) ) ( not ( = ?auto_581384 ?auto_581388 ) ) ( not ( = ?auto_581384 ?auto_581389 ) ) ( not ( = ?auto_581384 ?auto_581390 ) ) ( not ( = ?auto_581384 ?auto_581391 ) ) ( not ( = ?auto_581384 ?auto_581392 ) ) ( not ( = ?auto_581384 ?auto_581393 ) ) ( not ( = ?auto_581384 ?auto_581394 ) ) ( not ( = ?auto_581384 ?auto_581395 ) ) ( not ( = ?auto_581384 ?auto_581396 ) ) ( not ( = ?auto_581384 ?auto_581397 ) ) ( not ( = ?auto_581384 ?auto_581398 ) ) ( not ( = ?auto_581385 ?auto_581386 ) ) ( not ( = ?auto_581385 ?auto_581387 ) ) ( not ( = ?auto_581385 ?auto_581388 ) ) ( not ( = ?auto_581385 ?auto_581389 ) ) ( not ( = ?auto_581385 ?auto_581390 ) ) ( not ( = ?auto_581385 ?auto_581391 ) ) ( not ( = ?auto_581385 ?auto_581392 ) ) ( not ( = ?auto_581385 ?auto_581393 ) ) ( not ( = ?auto_581385 ?auto_581394 ) ) ( not ( = ?auto_581385 ?auto_581395 ) ) ( not ( = ?auto_581385 ?auto_581396 ) ) ( not ( = ?auto_581385 ?auto_581397 ) ) ( not ( = ?auto_581385 ?auto_581398 ) ) ( not ( = ?auto_581386 ?auto_581387 ) ) ( not ( = ?auto_581386 ?auto_581388 ) ) ( not ( = ?auto_581386 ?auto_581389 ) ) ( not ( = ?auto_581386 ?auto_581390 ) ) ( not ( = ?auto_581386 ?auto_581391 ) ) ( not ( = ?auto_581386 ?auto_581392 ) ) ( not ( = ?auto_581386 ?auto_581393 ) ) ( not ( = ?auto_581386 ?auto_581394 ) ) ( not ( = ?auto_581386 ?auto_581395 ) ) ( not ( = ?auto_581386 ?auto_581396 ) ) ( not ( = ?auto_581386 ?auto_581397 ) ) ( not ( = ?auto_581386 ?auto_581398 ) ) ( not ( = ?auto_581387 ?auto_581388 ) ) ( not ( = ?auto_581387 ?auto_581389 ) ) ( not ( = ?auto_581387 ?auto_581390 ) ) ( not ( = ?auto_581387 ?auto_581391 ) ) ( not ( = ?auto_581387 ?auto_581392 ) ) ( not ( = ?auto_581387 ?auto_581393 ) ) ( not ( = ?auto_581387 ?auto_581394 ) ) ( not ( = ?auto_581387 ?auto_581395 ) ) ( not ( = ?auto_581387 ?auto_581396 ) ) ( not ( = ?auto_581387 ?auto_581397 ) ) ( not ( = ?auto_581387 ?auto_581398 ) ) ( not ( = ?auto_581388 ?auto_581389 ) ) ( not ( = ?auto_581388 ?auto_581390 ) ) ( not ( = ?auto_581388 ?auto_581391 ) ) ( not ( = ?auto_581388 ?auto_581392 ) ) ( not ( = ?auto_581388 ?auto_581393 ) ) ( not ( = ?auto_581388 ?auto_581394 ) ) ( not ( = ?auto_581388 ?auto_581395 ) ) ( not ( = ?auto_581388 ?auto_581396 ) ) ( not ( = ?auto_581388 ?auto_581397 ) ) ( not ( = ?auto_581388 ?auto_581398 ) ) ( not ( = ?auto_581389 ?auto_581390 ) ) ( not ( = ?auto_581389 ?auto_581391 ) ) ( not ( = ?auto_581389 ?auto_581392 ) ) ( not ( = ?auto_581389 ?auto_581393 ) ) ( not ( = ?auto_581389 ?auto_581394 ) ) ( not ( = ?auto_581389 ?auto_581395 ) ) ( not ( = ?auto_581389 ?auto_581396 ) ) ( not ( = ?auto_581389 ?auto_581397 ) ) ( not ( = ?auto_581389 ?auto_581398 ) ) ( not ( = ?auto_581390 ?auto_581391 ) ) ( not ( = ?auto_581390 ?auto_581392 ) ) ( not ( = ?auto_581390 ?auto_581393 ) ) ( not ( = ?auto_581390 ?auto_581394 ) ) ( not ( = ?auto_581390 ?auto_581395 ) ) ( not ( = ?auto_581390 ?auto_581396 ) ) ( not ( = ?auto_581390 ?auto_581397 ) ) ( not ( = ?auto_581390 ?auto_581398 ) ) ( not ( = ?auto_581391 ?auto_581392 ) ) ( not ( = ?auto_581391 ?auto_581393 ) ) ( not ( = ?auto_581391 ?auto_581394 ) ) ( not ( = ?auto_581391 ?auto_581395 ) ) ( not ( = ?auto_581391 ?auto_581396 ) ) ( not ( = ?auto_581391 ?auto_581397 ) ) ( not ( = ?auto_581391 ?auto_581398 ) ) ( not ( = ?auto_581392 ?auto_581393 ) ) ( not ( = ?auto_581392 ?auto_581394 ) ) ( not ( = ?auto_581392 ?auto_581395 ) ) ( not ( = ?auto_581392 ?auto_581396 ) ) ( not ( = ?auto_581392 ?auto_581397 ) ) ( not ( = ?auto_581392 ?auto_581398 ) ) ( not ( = ?auto_581393 ?auto_581394 ) ) ( not ( = ?auto_581393 ?auto_581395 ) ) ( not ( = ?auto_581393 ?auto_581396 ) ) ( not ( = ?auto_581393 ?auto_581397 ) ) ( not ( = ?auto_581393 ?auto_581398 ) ) ( not ( = ?auto_581394 ?auto_581395 ) ) ( not ( = ?auto_581394 ?auto_581396 ) ) ( not ( = ?auto_581394 ?auto_581397 ) ) ( not ( = ?auto_581394 ?auto_581398 ) ) ( not ( = ?auto_581395 ?auto_581396 ) ) ( not ( = ?auto_581395 ?auto_581397 ) ) ( not ( = ?auto_581395 ?auto_581398 ) ) ( not ( = ?auto_581396 ?auto_581397 ) ) ( not ( = ?auto_581396 ?auto_581398 ) ) ( not ( = ?auto_581397 ?auto_581398 ) ) ( CLEAR ?auto_581395 ) ( ON ?auto_581396 ?auto_581397 ) ( CLEAR ?auto_581396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_581384 ?auto_581385 ?auto_581386 ?auto_581387 ?auto_581388 ?auto_581389 ?auto_581390 ?auto_581391 ?auto_581392 ?auto_581393 ?auto_581394 ?auto_581395 ?auto_581396 )
      ( MAKE-14PILE ?auto_581384 ?auto_581385 ?auto_581386 ?auto_581387 ?auto_581388 ?auto_581389 ?auto_581390 ?auto_581391 ?auto_581392 ?auto_581393 ?auto_581394 ?auto_581395 ?auto_581396 ?auto_581397 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_581442 - BLOCK
      ?auto_581443 - BLOCK
      ?auto_581444 - BLOCK
      ?auto_581445 - BLOCK
      ?auto_581446 - BLOCK
      ?auto_581447 - BLOCK
      ?auto_581448 - BLOCK
      ?auto_581449 - BLOCK
      ?auto_581450 - BLOCK
      ?auto_581451 - BLOCK
      ?auto_581452 - BLOCK
      ?auto_581453 - BLOCK
      ?auto_581454 - BLOCK
      ?auto_581455 - BLOCK
    )
    :vars
    (
      ?auto_581456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581455 ?auto_581456 ) ( ON-TABLE ?auto_581442 ) ( ON ?auto_581443 ?auto_581442 ) ( ON ?auto_581444 ?auto_581443 ) ( ON ?auto_581445 ?auto_581444 ) ( ON ?auto_581446 ?auto_581445 ) ( ON ?auto_581447 ?auto_581446 ) ( ON ?auto_581448 ?auto_581447 ) ( ON ?auto_581449 ?auto_581448 ) ( ON ?auto_581450 ?auto_581449 ) ( ON ?auto_581451 ?auto_581450 ) ( ON ?auto_581452 ?auto_581451 ) ( not ( = ?auto_581442 ?auto_581443 ) ) ( not ( = ?auto_581442 ?auto_581444 ) ) ( not ( = ?auto_581442 ?auto_581445 ) ) ( not ( = ?auto_581442 ?auto_581446 ) ) ( not ( = ?auto_581442 ?auto_581447 ) ) ( not ( = ?auto_581442 ?auto_581448 ) ) ( not ( = ?auto_581442 ?auto_581449 ) ) ( not ( = ?auto_581442 ?auto_581450 ) ) ( not ( = ?auto_581442 ?auto_581451 ) ) ( not ( = ?auto_581442 ?auto_581452 ) ) ( not ( = ?auto_581442 ?auto_581453 ) ) ( not ( = ?auto_581442 ?auto_581454 ) ) ( not ( = ?auto_581442 ?auto_581455 ) ) ( not ( = ?auto_581442 ?auto_581456 ) ) ( not ( = ?auto_581443 ?auto_581444 ) ) ( not ( = ?auto_581443 ?auto_581445 ) ) ( not ( = ?auto_581443 ?auto_581446 ) ) ( not ( = ?auto_581443 ?auto_581447 ) ) ( not ( = ?auto_581443 ?auto_581448 ) ) ( not ( = ?auto_581443 ?auto_581449 ) ) ( not ( = ?auto_581443 ?auto_581450 ) ) ( not ( = ?auto_581443 ?auto_581451 ) ) ( not ( = ?auto_581443 ?auto_581452 ) ) ( not ( = ?auto_581443 ?auto_581453 ) ) ( not ( = ?auto_581443 ?auto_581454 ) ) ( not ( = ?auto_581443 ?auto_581455 ) ) ( not ( = ?auto_581443 ?auto_581456 ) ) ( not ( = ?auto_581444 ?auto_581445 ) ) ( not ( = ?auto_581444 ?auto_581446 ) ) ( not ( = ?auto_581444 ?auto_581447 ) ) ( not ( = ?auto_581444 ?auto_581448 ) ) ( not ( = ?auto_581444 ?auto_581449 ) ) ( not ( = ?auto_581444 ?auto_581450 ) ) ( not ( = ?auto_581444 ?auto_581451 ) ) ( not ( = ?auto_581444 ?auto_581452 ) ) ( not ( = ?auto_581444 ?auto_581453 ) ) ( not ( = ?auto_581444 ?auto_581454 ) ) ( not ( = ?auto_581444 ?auto_581455 ) ) ( not ( = ?auto_581444 ?auto_581456 ) ) ( not ( = ?auto_581445 ?auto_581446 ) ) ( not ( = ?auto_581445 ?auto_581447 ) ) ( not ( = ?auto_581445 ?auto_581448 ) ) ( not ( = ?auto_581445 ?auto_581449 ) ) ( not ( = ?auto_581445 ?auto_581450 ) ) ( not ( = ?auto_581445 ?auto_581451 ) ) ( not ( = ?auto_581445 ?auto_581452 ) ) ( not ( = ?auto_581445 ?auto_581453 ) ) ( not ( = ?auto_581445 ?auto_581454 ) ) ( not ( = ?auto_581445 ?auto_581455 ) ) ( not ( = ?auto_581445 ?auto_581456 ) ) ( not ( = ?auto_581446 ?auto_581447 ) ) ( not ( = ?auto_581446 ?auto_581448 ) ) ( not ( = ?auto_581446 ?auto_581449 ) ) ( not ( = ?auto_581446 ?auto_581450 ) ) ( not ( = ?auto_581446 ?auto_581451 ) ) ( not ( = ?auto_581446 ?auto_581452 ) ) ( not ( = ?auto_581446 ?auto_581453 ) ) ( not ( = ?auto_581446 ?auto_581454 ) ) ( not ( = ?auto_581446 ?auto_581455 ) ) ( not ( = ?auto_581446 ?auto_581456 ) ) ( not ( = ?auto_581447 ?auto_581448 ) ) ( not ( = ?auto_581447 ?auto_581449 ) ) ( not ( = ?auto_581447 ?auto_581450 ) ) ( not ( = ?auto_581447 ?auto_581451 ) ) ( not ( = ?auto_581447 ?auto_581452 ) ) ( not ( = ?auto_581447 ?auto_581453 ) ) ( not ( = ?auto_581447 ?auto_581454 ) ) ( not ( = ?auto_581447 ?auto_581455 ) ) ( not ( = ?auto_581447 ?auto_581456 ) ) ( not ( = ?auto_581448 ?auto_581449 ) ) ( not ( = ?auto_581448 ?auto_581450 ) ) ( not ( = ?auto_581448 ?auto_581451 ) ) ( not ( = ?auto_581448 ?auto_581452 ) ) ( not ( = ?auto_581448 ?auto_581453 ) ) ( not ( = ?auto_581448 ?auto_581454 ) ) ( not ( = ?auto_581448 ?auto_581455 ) ) ( not ( = ?auto_581448 ?auto_581456 ) ) ( not ( = ?auto_581449 ?auto_581450 ) ) ( not ( = ?auto_581449 ?auto_581451 ) ) ( not ( = ?auto_581449 ?auto_581452 ) ) ( not ( = ?auto_581449 ?auto_581453 ) ) ( not ( = ?auto_581449 ?auto_581454 ) ) ( not ( = ?auto_581449 ?auto_581455 ) ) ( not ( = ?auto_581449 ?auto_581456 ) ) ( not ( = ?auto_581450 ?auto_581451 ) ) ( not ( = ?auto_581450 ?auto_581452 ) ) ( not ( = ?auto_581450 ?auto_581453 ) ) ( not ( = ?auto_581450 ?auto_581454 ) ) ( not ( = ?auto_581450 ?auto_581455 ) ) ( not ( = ?auto_581450 ?auto_581456 ) ) ( not ( = ?auto_581451 ?auto_581452 ) ) ( not ( = ?auto_581451 ?auto_581453 ) ) ( not ( = ?auto_581451 ?auto_581454 ) ) ( not ( = ?auto_581451 ?auto_581455 ) ) ( not ( = ?auto_581451 ?auto_581456 ) ) ( not ( = ?auto_581452 ?auto_581453 ) ) ( not ( = ?auto_581452 ?auto_581454 ) ) ( not ( = ?auto_581452 ?auto_581455 ) ) ( not ( = ?auto_581452 ?auto_581456 ) ) ( not ( = ?auto_581453 ?auto_581454 ) ) ( not ( = ?auto_581453 ?auto_581455 ) ) ( not ( = ?auto_581453 ?auto_581456 ) ) ( not ( = ?auto_581454 ?auto_581455 ) ) ( not ( = ?auto_581454 ?auto_581456 ) ) ( not ( = ?auto_581455 ?auto_581456 ) ) ( ON ?auto_581454 ?auto_581455 ) ( CLEAR ?auto_581452 ) ( ON ?auto_581453 ?auto_581454 ) ( CLEAR ?auto_581453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_581442 ?auto_581443 ?auto_581444 ?auto_581445 ?auto_581446 ?auto_581447 ?auto_581448 ?auto_581449 ?auto_581450 ?auto_581451 ?auto_581452 ?auto_581453 )
      ( MAKE-14PILE ?auto_581442 ?auto_581443 ?auto_581444 ?auto_581445 ?auto_581446 ?auto_581447 ?auto_581448 ?auto_581449 ?auto_581450 ?auto_581451 ?auto_581452 ?auto_581453 ?auto_581454 ?auto_581455 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_581500 - BLOCK
      ?auto_581501 - BLOCK
      ?auto_581502 - BLOCK
      ?auto_581503 - BLOCK
      ?auto_581504 - BLOCK
      ?auto_581505 - BLOCK
      ?auto_581506 - BLOCK
      ?auto_581507 - BLOCK
      ?auto_581508 - BLOCK
      ?auto_581509 - BLOCK
      ?auto_581510 - BLOCK
      ?auto_581511 - BLOCK
      ?auto_581512 - BLOCK
      ?auto_581513 - BLOCK
    )
    :vars
    (
      ?auto_581514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581513 ?auto_581514 ) ( ON-TABLE ?auto_581500 ) ( ON ?auto_581501 ?auto_581500 ) ( ON ?auto_581502 ?auto_581501 ) ( ON ?auto_581503 ?auto_581502 ) ( ON ?auto_581504 ?auto_581503 ) ( ON ?auto_581505 ?auto_581504 ) ( ON ?auto_581506 ?auto_581505 ) ( ON ?auto_581507 ?auto_581506 ) ( ON ?auto_581508 ?auto_581507 ) ( ON ?auto_581509 ?auto_581508 ) ( not ( = ?auto_581500 ?auto_581501 ) ) ( not ( = ?auto_581500 ?auto_581502 ) ) ( not ( = ?auto_581500 ?auto_581503 ) ) ( not ( = ?auto_581500 ?auto_581504 ) ) ( not ( = ?auto_581500 ?auto_581505 ) ) ( not ( = ?auto_581500 ?auto_581506 ) ) ( not ( = ?auto_581500 ?auto_581507 ) ) ( not ( = ?auto_581500 ?auto_581508 ) ) ( not ( = ?auto_581500 ?auto_581509 ) ) ( not ( = ?auto_581500 ?auto_581510 ) ) ( not ( = ?auto_581500 ?auto_581511 ) ) ( not ( = ?auto_581500 ?auto_581512 ) ) ( not ( = ?auto_581500 ?auto_581513 ) ) ( not ( = ?auto_581500 ?auto_581514 ) ) ( not ( = ?auto_581501 ?auto_581502 ) ) ( not ( = ?auto_581501 ?auto_581503 ) ) ( not ( = ?auto_581501 ?auto_581504 ) ) ( not ( = ?auto_581501 ?auto_581505 ) ) ( not ( = ?auto_581501 ?auto_581506 ) ) ( not ( = ?auto_581501 ?auto_581507 ) ) ( not ( = ?auto_581501 ?auto_581508 ) ) ( not ( = ?auto_581501 ?auto_581509 ) ) ( not ( = ?auto_581501 ?auto_581510 ) ) ( not ( = ?auto_581501 ?auto_581511 ) ) ( not ( = ?auto_581501 ?auto_581512 ) ) ( not ( = ?auto_581501 ?auto_581513 ) ) ( not ( = ?auto_581501 ?auto_581514 ) ) ( not ( = ?auto_581502 ?auto_581503 ) ) ( not ( = ?auto_581502 ?auto_581504 ) ) ( not ( = ?auto_581502 ?auto_581505 ) ) ( not ( = ?auto_581502 ?auto_581506 ) ) ( not ( = ?auto_581502 ?auto_581507 ) ) ( not ( = ?auto_581502 ?auto_581508 ) ) ( not ( = ?auto_581502 ?auto_581509 ) ) ( not ( = ?auto_581502 ?auto_581510 ) ) ( not ( = ?auto_581502 ?auto_581511 ) ) ( not ( = ?auto_581502 ?auto_581512 ) ) ( not ( = ?auto_581502 ?auto_581513 ) ) ( not ( = ?auto_581502 ?auto_581514 ) ) ( not ( = ?auto_581503 ?auto_581504 ) ) ( not ( = ?auto_581503 ?auto_581505 ) ) ( not ( = ?auto_581503 ?auto_581506 ) ) ( not ( = ?auto_581503 ?auto_581507 ) ) ( not ( = ?auto_581503 ?auto_581508 ) ) ( not ( = ?auto_581503 ?auto_581509 ) ) ( not ( = ?auto_581503 ?auto_581510 ) ) ( not ( = ?auto_581503 ?auto_581511 ) ) ( not ( = ?auto_581503 ?auto_581512 ) ) ( not ( = ?auto_581503 ?auto_581513 ) ) ( not ( = ?auto_581503 ?auto_581514 ) ) ( not ( = ?auto_581504 ?auto_581505 ) ) ( not ( = ?auto_581504 ?auto_581506 ) ) ( not ( = ?auto_581504 ?auto_581507 ) ) ( not ( = ?auto_581504 ?auto_581508 ) ) ( not ( = ?auto_581504 ?auto_581509 ) ) ( not ( = ?auto_581504 ?auto_581510 ) ) ( not ( = ?auto_581504 ?auto_581511 ) ) ( not ( = ?auto_581504 ?auto_581512 ) ) ( not ( = ?auto_581504 ?auto_581513 ) ) ( not ( = ?auto_581504 ?auto_581514 ) ) ( not ( = ?auto_581505 ?auto_581506 ) ) ( not ( = ?auto_581505 ?auto_581507 ) ) ( not ( = ?auto_581505 ?auto_581508 ) ) ( not ( = ?auto_581505 ?auto_581509 ) ) ( not ( = ?auto_581505 ?auto_581510 ) ) ( not ( = ?auto_581505 ?auto_581511 ) ) ( not ( = ?auto_581505 ?auto_581512 ) ) ( not ( = ?auto_581505 ?auto_581513 ) ) ( not ( = ?auto_581505 ?auto_581514 ) ) ( not ( = ?auto_581506 ?auto_581507 ) ) ( not ( = ?auto_581506 ?auto_581508 ) ) ( not ( = ?auto_581506 ?auto_581509 ) ) ( not ( = ?auto_581506 ?auto_581510 ) ) ( not ( = ?auto_581506 ?auto_581511 ) ) ( not ( = ?auto_581506 ?auto_581512 ) ) ( not ( = ?auto_581506 ?auto_581513 ) ) ( not ( = ?auto_581506 ?auto_581514 ) ) ( not ( = ?auto_581507 ?auto_581508 ) ) ( not ( = ?auto_581507 ?auto_581509 ) ) ( not ( = ?auto_581507 ?auto_581510 ) ) ( not ( = ?auto_581507 ?auto_581511 ) ) ( not ( = ?auto_581507 ?auto_581512 ) ) ( not ( = ?auto_581507 ?auto_581513 ) ) ( not ( = ?auto_581507 ?auto_581514 ) ) ( not ( = ?auto_581508 ?auto_581509 ) ) ( not ( = ?auto_581508 ?auto_581510 ) ) ( not ( = ?auto_581508 ?auto_581511 ) ) ( not ( = ?auto_581508 ?auto_581512 ) ) ( not ( = ?auto_581508 ?auto_581513 ) ) ( not ( = ?auto_581508 ?auto_581514 ) ) ( not ( = ?auto_581509 ?auto_581510 ) ) ( not ( = ?auto_581509 ?auto_581511 ) ) ( not ( = ?auto_581509 ?auto_581512 ) ) ( not ( = ?auto_581509 ?auto_581513 ) ) ( not ( = ?auto_581509 ?auto_581514 ) ) ( not ( = ?auto_581510 ?auto_581511 ) ) ( not ( = ?auto_581510 ?auto_581512 ) ) ( not ( = ?auto_581510 ?auto_581513 ) ) ( not ( = ?auto_581510 ?auto_581514 ) ) ( not ( = ?auto_581511 ?auto_581512 ) ) ( not ( = ?auto_581511 ?auto_581513 ) ) ( not ( = ?auto_581511 ?auto_581514 ) ) ( not ( = ?auto_581512 ?auto_581513 ) ) ( not ( = ?auto_581512 ?auto_581514 ) ) ( not ( = ?auto_581513 ?auto_581514 ) ) ( ON ?auto_581512 ?auto_581513 ) ( ON ?auto_581511 ?auto_581512 ) ( CLEAR ?auto_581509 ) ( ON ?auto_581510 ?auto_581511 ) ( CLEAR ?auto_581510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_581500 ?auto_581501 ?auto_581502 ?auto_581503 ?auto_581504 ?auto_581505 ?auto_581506 ?auto_581507 ?auto_581508 ?auto_581509 ?auto_581510 )
      ( MAKE-14PILE ?auto_581500 ?auto_581501 ?auto_581502 ?auto_581503 ?auto_581504 ?auto_581505 ?auto_581506 ?auto_581507 ?auto_581508 ?auto_581509 ?auto_581510 ?auto_581511 ?auto_581512 ?auto_581513 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_581558 - BLOCK
      ?auto_581559 - BLOCK
      ?auto_581560 - BLOCK
      ?auto_581561 - BLOCK
      ?auto_581562 - BLOCK
      ?auto_581563 - BLOCK
      ?auto_581564 - BLOCK
      ?auto_581565 - BLOCK
      ?auto_581566 - BLOCK
      ?auto_581567 - BLOCK
      ?auto_581568 - BLOCK
      ?auto_581569 - BLOCK
      ?auto_581570 - BLOCK
      ?auto_581571 - BLOCK
    )
    :vars
    (
      ?auto_581572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581571 ?auto_581572 ) ( ON-TABLE ?auto_581558 ) ( ON ?auto_581559 ?auto_581558 ) ( ON ?auto_581560 ?auto_581559 ) ( ON ?auto_581561 ?auto_581560 ) ( ON ?auto_581562 ?auto_581561 ) ( ON ?auto_581563 ?auto_581562 ) ( ON ?auto_581564 ?auto_581563 ) ( ON ?auto_581565 ?auto_581564 ) ( ON ?auto_581566 ?auto_581565 ) ( not ( = ?auto_581558 ?auto_581559 ) ) ( not ( = ?auto_581558 ?auto_581560 ) ) ( not ( = ?auto_581558 ?auto_581561 ) ) ( not ( = ?auto_581558 ?auto_581562 ) ) ( not ( = ?auto_581558 ?auto_581563 ) ) ( not ( = ?auto_581558 ?auto_581564 ) ) ( not ( = ?auto_581558 ?auto_581565 ) ) ( not ( = ?auto_581558 ?auto_581566 ) ) ( not ( = ?auto_581558 ?auto_581567 ) ) ( not ( = ?auto_581558 ?auto_581568 ) ) ( not ( = ?auto_581558 ?auto_581569 ) ) ( not ( = ?auto_581558 ?auto_581570 ) ) ( not ( = ?auto_581558 ?auto_581571 ) ) ( not ( = ?auto_581558 ?auto_581572 ) ) ( not ( = ?auto_581559 ?auto_581560 ) ) ( not ( = ?auto_581559 ?auto_581561 ) ) ( not ( = ?auto_581559 ?auto_581562 ) ) ( not ( = ?auto_581559 ?auto_581563 ) ) ( not ( = ?auto_581559 ?auto_581564 ) ) ( not ( = ?auto_581559 ?auto_581565 ) ) ( not ( = ?auto_581559 ?auto_581566 ) ) ( not ( = ?auto_581559 ?auto_581567 ) ) ( not ( = ?auto_581559 ?auto_581568 ) ) ( not ( = ?auto_581559 ?auto_581569 ) ) ( not ( = ?auto_581559 ?auto_581570 ) ) ( not ( = ?auto_581559 ?auto_581571 ) ) ( not ( = ?auto_581559 ?auto_581572 ) ) ( not ( = ?auto_581560 ?auto_581561 ) ) ( not ( = ?auto_581560 ?auto_581562 ) ) ( not ( = ?auto_581560 ?auto_581563 ) ) ( not ( = ?auto_581560 ?auto_581564 ) ) ( not ( = ?auto_581560 ?auto_581565 ) ) ( not ( = ?auto_581560 ?auto_581566 ) ) ( not ( = ?auto_581560 ?auto_581567 ) ) ( not ( = ?auto_581560 ?auto_581568 ) ) ( not ( = ?auto_581560 ?auto_581569 ) ) ( not ( = ?auto_581560 ?auto_581570 ) ) ( not ( = ?auto_581560 ?auto_581571 ) ) ( not ( = ?auto_581560 ?auto_581572 ) ) ( not ( = ?auto_581561 ?auto_581562 ) ) ( not ( = ?auto_581561 ?auto_581563 ) ) ( not ( = ?auto_581561 ?auto_581564 ) ) ( not ( = ?auto_581561 ?auto_581565 ) ) ( not ( = ?auto_581561 ?auto_581566 ) ) ( not ( = ?auto_581561 ?auto_581567 ) ) ( not ( = ?auto_581561 ?auto_581568 ) ) ( not ( = ?auto_581561 ?auto_581569 ) ) ( not ( = ?auto_581561 ?auto_581570 ) ) ( not ( = ?auto_581561 ?auto_581571 ) ) ( not ( = ?auto_581561 ?auto_581572 ) ) ( not ( = ?auto_581562 ?auto_581563 ) ) ( not ( = ?auto_581562 ?auto_581564 ) ) ( not ( = ?auto_581562 ?auto_581565 ) ) ( not ( = ?auto_581562 ?auto_581566 ) ) ( not ( = ?auto_581562 ?auto_581567 ) ) ( not ( = ?auto_581562 ?auto_581568 ) ) ( not ( = ?auto_581562 ?auto_581569 ) ) ( not ( = ?auto_581562 ?auto_581570 ) ) ( not ( = ?auto_581562 ?auto_581571 ) ) ( not ( = ?auto_581562 ?auto_581572 ) ) ( not ( = ?auto_581563 ?auto_581564 ) ) ( not ( = ?auto_581563 ?auto_581565 ) ) ( not ( = ?auto_581563 ?auto_581566 ) ) ( not ( = ?auto_581563 ?auto_581567 ) ) ( not ( = ?auto_581563 ?auto_581568 ) ) ( not ( = ?auto_581563 ?auto_581569 ) ) ( not ( = ?auto_581563 ?auto_581570 ) ) ( not ( = ?auto_581563 ?auto_581571 ) ) ( not ( = ?auto_581563 ?auto_581572 ) ) ( not ( = ?auto_581564 ?auto_581565 ) ) ( not ( = ?auto_581564 ?auto_581566 ) ) ( not ( = ?auto_581564 ?auto_581567 ) ) ( not ( = ?auto_581564 ?auto_581568 ) ) ( not ( = ?auto_581564 ?auto_581569 ) ) ( not ( = ?auto_581564 ?auto_581570 ) ) ( not ( = ?auto_581564 ?auto_581571 ) ) ( not ( = ?auto_581564 ?auto_581572 ) ) ( not ( = ?auto_581565 ?auto_581566 ) ) ( not ( = ?auto_581565 ?auto_581567 ) ) ( not ( = ?auto_581565 ?auto_581568 ) ) ( not ( = ?auto_581565 ?auto_581569 ) ) ( not ( = ?auto_581565 ?auto_581570 ) ) ( not ( = ?auto_581565 ?auto_581571 ) ) ( not ( = ?auto_581565 ?auto_581572 ) ) ( not ( = ?auto_581566 ?auto_581567 ) ) ( not ( = ?auto_581566 ?auto_581568 ) ) ( not ( = ?auto_581566 ?auto_581569 ) ) ( not ( = ?auto_581566 ?auto_581570 ) ) ( not ( = ?auto_581566 ?auto_581571 ) ) ( not ( = ?auto_581566 ?auto_581572 ) ) ( not ( = ?auto_581567 ?auto_581568 ) ) ( not ( = ?auto_581567 ?auto_581569 ) ) ( not ( = ?auto_581567 ?auto_581570 ) ) ( not ( = ?auto_581567 ?auto_581571 ) ) ( not ( = ?auto_581567 ?auto_581572 ) ) ( not ( = ?auto_581568 ?auto_581569 ) ) ( not ( = ?auto_581568 ?auto_581570 ) ) ( not ( = ?auto_581568 ?auto_581571 ) ) ( not ( = ?auto_581568 ?auto_581572 ) ) ( not ( = ?auto_581569 ?auto_581570 ) ) ( not ( = ?auto_581569 ?auto_581571 ) ) ( not ( = ?auto_581569 ?auto_581572 ) ) ( not ( = ?auto_581570 ?auto_581571 ) ) ( not ( = ?auto_581570 ?auto_581572 ) ) ( not ( = ?auto_581571 ?auto_581572 ) ) ( ON ?auto_581570 ?auto_581571 ) ( ON ?auto_581569 ?auto_581570 ) ( ON ?auto_581568 ?auto_581569 ) ( CLEAR ?auto_581566 ) ( ON ?auto_581567 ?auto_581568 ) ( CLEAR ?auto_581567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_581558 ?auto_581559 ?auto_581560 ?auto_581561 ?auto_581562 ?auto_581563 ?auto_581564 ?auto_581565 ?auto_581566 ?auto_581567 )
      ( MAKE-14PILE ?auto_581558 ?auto_581559 ?auto_581560 ?auto_581561 ?auto_581562 ?auto_581563 ?auto_581564 ?auto_581565 ?auto_581566 ?auto_581567 ?auto_581568 ?auto_581569 ?auto_581570 ?auto_581571 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_581616 - BLOCK
      ?auto_581617 - BLOCK
      ?auto_581618 - BLOCK
      ?auto_581619 - BLOCK
      ?auto_581620 - BLOCK
      ?auto_581621 - BLOCK
      ?auto_581622 - BLOCK
      ?auto_581623 - BLOCK
      ?auto_581624 - BLOCK
      ?auto_581625 - BLOCK
      ?auto_581626 - BLOCK
      ?auto_581627 - BLOCK
      ?auto_581628 - BLOCK
      ?auto_581629 - BLOCK
    )
    :vars
    (
      ?auto_581630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581629 ?auto_581630 ) ( ON-TABLE ?auto_581616 ) ( ON ?auto_581617 ?auto_581616 ) ( ON ?auto_581618 ?auto_581617 ) ( ON ?auto_581619 ?auto_581618 ) ( ON ?auto_581620 ?auto_581619 ) ( ON ?auto_581621 ?auto_581620 ) ( ON ?auto_581622 ?auto_581621 ) ( ON ?auto_581623 ?auto_581622 ) ( not ( = ?auto_581616 ?auto_581617 ) ) ( not ( = ?auto_581616 ?auto_581618 ) ) ( not ( = ?auto_581616 ?auto_581619 ) ) ( not ( = ?auto_581616 ?auto_581620 ) ) ( not ( = ?auto_581616 ?auto_581621 ) ) ( not ( = ?auto_581616 ?auto_581622 ) ) ( not ( = ?auto_581616 ?auto_581623 ) ) ( not ( = ?auto_581616 ?auto_581624 ) ) ( not ( = ?auto_581616 ?auto_581625 ) ) ( not ( = ?auto_581616 ?auto_581626 ) ) ( not ( = ?auto_581616 ?auto_581627 ) ) ( not ( = ?auto_581616 ?auto_581628 ) ) ( not ( = ?auto_581616 ?auto_581629 ) ) ( not ( = ?auto_581616 ?auto_581630 ) ) ( not ( = ?auto_581617 ?auto_581618 ) ) ( not ( = ?auto_581617 ?auto_581619 ) ) ( not ( = ?auto_581617 ?auto_581620 ) ) ( not ( = ?auto_581617 ?auto_581621 ) ) ( not ( = ?auto_581617 ?auto_581622 ) ) ( not ( = ?auto_581617 ?auto_581623 ) ) ( not ( = ?auto_581617 ?auto_581624 ) ) ( not ( = ?auto_581617 ?auto_581625 ) ) ( not ( = ?auto_581617 ?auto_581626 ) ) ( not ( = ?auto_581617 ?auto_581627 ) ) ( not ( = ?auto_581617 ?auto_581628 ) ) ( not ( = ?auto_581617 ?auto_581629 ) ) ( not ( = ?auto_581617 ?auto_581630 ) ) ( not ( = ?auto_581618 ?auto_581619 ) ) ( not ( = ?auto_581618 ?auto_581620 ) ) ( not ( = ?auto_581618 ?auto_581621 ) ) ( not ( = ?auto_581618 ?auto_581622 ) ) ( not ( = ?auto_581618 ?auto_581623 ) ) ( not ( = ?auto_581618 ?auto_581624 ) ) ( not ( = ?auto_581618 ?auto_581625 ) ) ( not ( = ?auto_581618 ?auto_581626 ) ) ( not ( = ?auto_581618 ?auto_581627 ) ) ( not ( = ?auto_581618 ?auto_581628 ) ) ( not ( = ?auto_581618 ?auto_581629 ) ) ( not ( = ?auto_581618 ?auto_581630 ) ) ( not ( = ?auto_581619 ?auto_581620 ) ) ( not ( = ?auto_581619 ?auto_581621 ) ) ( not ( = ?auto_581619 ?auto_581622 ) ) ( not ( = ?auto_581619 ?auto_581623 ) ) ( not ( = ?auto_581619 ?auto_581624 ) ) ( not ( = ?auto_581619 ?auto_581625 ) ) ( not ( = ?auto_581619 ?auto_581626 ) ) ( not ( = ?auto_581619 ?auto_581627 ) ) ( not ( = ?auto_581619 ?auto_581628 ) ) ( not ( = ?auto_581619 ?auto_581629 ) ) ( not ( = ?auto_581619 ?auto_581630 ) ) ( not ( = ?auto_581620 ?auto_581621 ) ) ( not ( = ?auto_581620 ?auto_581622 ) ) ( not ( = ?auto_581620 ?auto_581623 ) ) ( not ( = ?auto_581620 ?auto_581624 ) ) ( not ( = ?auto_581620 ?auto_581625 ) ) ( not ( = ?auto_581620 ?auto_581626 ) ) ( not ( = ?auto_581620 ?auto_581627 ) ) ( not ( = ?auto_581620 ?auto_581628 ) ) ( not ( = ?auto_581620 ?auto_581629 ) ) ( not ( = ?auto_581620 ?auto_581630 ) ) ( not ( = ?auto_581621 ?auto_581622 ) ) ( not ( = ?auto_581621 ?auto_581623 ) ) ( not ( = ?auto_581621 ?auto_581624 ) ) ( not ( = ?auto_581621 ?auto_581625 ) ) ( not ( = ?auto_581621 ?auto_581626 ) ) ( not ( = ?auto_581621 ?auto_581627 ) ) ( not ( = ?auto_581621 ?auto_581628 ) ) ( not ( = ?auto_581621 ?auto_581629 ) ) ( not ( = ?auto_581621 ?auto_581630 ) ) ( not ( = ?auto_581622 ?auto_581623 ) ) ( not ( = ?auto_581622 ?auto_581624 ) ) ( not ( = ?auto_581622 ?auto_581625 ) ) ( not ( = ?auto_581622 ?auto_581626 ) ) ( not ( = ?auto_581622 ?auto_581627 ) ) ( not ( = ?auto_581622 ?auto_581628 ) ) ( not ( = ?auto_581622 ?auto_581629 ) ) ( not ( = ?auto_581622 ?auto_581630 ) ) ( not ( = ?auto_581623 ?auto_581624 ) ) ( not ( = ?auto_581623 ?auto_581625 ) ) ( not ( = ?auto_581623 ?auto_581626 ) ) ( not ( = ?auto_581623 ?auto_581627 ) ) ( not ( = ?auto_581623 ?auto_581628 ) ) ( not ( = ?auto_581623 ?auto_581629 ) ) ( not ( = ?auto_581623 ?auto_581630 ) ) ( not ( = ?auto_581624 ?auto_581625 ) ) ( not ( = ?auto_581624 ?auto_581626 ) ) ( not ( = ?auto_581624 ?auto_581627 ) ) ( not ( = ?auto_581624 ?auto_581628 ) ) ( not ( = ?auto_581624 ?auto_581629 ) ) ( not ( = ?auto_581624 ?auto_581630 ) ) ( not ( = ?auto_581625 ?auto_581626 ) ) ( not ( = ?auto_581625 ?auto_581627 ) ) ( not ( = ?auto_581625 ?auto_581628 ) ) ( not ( = ?auto_581625 ?auto_581629 ) ) ( not ( = ?auto_581625 ?auto_581630 ) ) ( not ( = ?auto_581626 ?auto_581627 ) ) ( not ( = ?auto_581626 ?auto_581628 ) ) ( not ( = ?auto_581626 ?auto_581629 ) ) ( not ( = ?auto_581626 ?auto_581630 ) ) ( not ( = ?auto_581627 ?auto_581628 ) ) ( not ( = ?auto_581627 ?auto_581629 ) ) ( not ( = ?auto_581627 ?auto_581630 ) ) ( not ( = ?auto_581628 ?auto_581629 ) ) ( not ( = ?auto_581628 ?auto_581630 ) ) ( not ( = ?auto_581629 ?auto_581630 ) ) ( ON ?auto_581628 ?auto_581629 ) ( ON ?auto_581627 ?auto_581628 ) ( ON ?auto_581626 ?auto_581627 ) ( ON ?auto_581625 ?auto_581626 ) ( CLEAR ?auto_581623 ) ( ON ?auto_581624 ?auto_581625 ) ( CLEAR ?auto_581624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_581616 ?auto_581617 ?auto_581618 ?auto_581619 ?auto_581620 ?auto_581621 ?auto_581622 ?auto_581623 ?auto_581624 )
      ( MAKE-14PILE ?auto_581616 ?auto_581617 ?auto_581618 ?auto_581619 ?auto_581620 ?auto_581621 ?auto_581622 ?auto_581623 ?auto_581624 ?auto_581625 ?auto_581626 ?auto_581627 ?auto_581628 ?auto_581629 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_581674 - BLOCK
      ?auto_581675 - BLOCK
      ?auto_581676 - BLOCK
      ?auto_581677 - BLOCK
      ?auto_581678 - BLOCK
      ?auto_581679 - BLOCK
      ?auto_581680 - BLOCK
      ?auto_581681 - BLOCK
      ?auto_581682 - BLOCK
      ?auto_581683 - BLOCK
      ?auto_581684 - BLOCK
      ?auto_581685 - BLOCK
      ?auto_581686 - BLOCK
      ?auto_581687 - BLOCK
    )
    :vars
    (
      ?auto_581688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581687 ?auto_581688 ) ( ON-TABLE ?auto_581674 ) ( ON ?auto_581675 ?auto_581674 ) ( ON ?auto_581676 ?auto_581675 ) ( ON ?auto_581677 ?auto_581676 ) ( ON ?auto_581678 ?auto_581677 ) ( ON ?auto_581679 ?auto_581678 ) ( ON ?auto_581680 ?auto_581679 ) ( not ( = ?auto_581674 ?auto_581675 ) ) ( not ( = ?auto_581674 ?auto_581676 ) ) ( not ( = ?auto_581674 ?auto_581677 ) ) ( not ( = ?auto_581674 ?auto_581678 ) ) ( not ( = ?auto_581674 ?auto_581679 ) ) ( not ( = ?auto_581674 ?auto_581680 ) ) ( not ( = ?auto_581674 ?auto_581681 ) ) ( not ( = ?auto_581674 ?auto_581682 ) ) ( not ( = ?auto_581674 ?auto_581683 ) ) ( not ( = ?auto_581674 ?auto_581684 ) ) ( not ( = ?auto_581674 ?auto_581685 ) ) ( not ( = ?auto_581674 ?auto_581686 ) ) ( not ( = ?auto_581674 ?auto_581687 ) ) ( not ( = ?auto_581674 ?auto_581688 ) ) ( not ( = ?auto_581675 ?auto_581676 ) ) ( not ( = ?auto_581675 ?auto_581677 ) ) ( not ( = ?auto_581675 ?auto_581678 ) ) ( not ( = ?auto_581675 ?auto_581679 ) ) ( not ( = ?auto_581675 ?auto_581680 ) ) ( not ( = ?auto_581675 ?auto_581681 ) ) ( not ( = ?auto_581675 ?auto_581682 ) ) ( not ( = ?auto_581675 ?auto_581683 ) ) ( not ( = ?auto_581675 ?auto_581684 ) ) ( not ( = ?auto_581675 ?auto_581685 ) ) ( not ( = ?auto_581675 ?auto_581686 ) ) ( not ( = ?auto_581675 ?auto_581687 ) ) ( not ( = ?auto_581675 ?auto_581688 ) ) ( not ( = ?auto_581676 ?auto_581677 ) ) ( not ( = ?auto_581676 ?auto_581678 ) ) ( not ( = ?auto_581676 ?auto_581679 ) ) ( not ( = ?auto_581676 ?auto_581680 ) ) ( not ( = ?auto_581676 ?auto_581681 ) ) ( not ( = ?auto_581676 ?auto_581682 ) ) ( not ( = ?auto_581676 ?auto_581683 ) ) ( not ( = ?auto_581676 ?auto_581684 ) ) ( not ( = ?auto_581676 ?auto_581685 ) ) ( not ( = ?auto_581676 ?auto_581686 ) ) ( not ( = ?auto_581676 ?auto_581687 ) ) ( not ( = ?auto_581676 ?auto_581688 ) ) ( not ( = ?auto_581677 ?auto_581678 ) ) ( not ( = ?auto_581677 ?auto_581679 ) ) ( not ( = ?auto_581677 ?auto_581680 ) ) ( not ( = ?auto_581677 ?auto_581681 ) ) ( not ( = ?auto_581677 ?auto_581682 ) ) ( not ( = ?auto_581677 ?auto_581683 ) ) ( not ( = ?auto_581677 ?auto_581684 ) ) ( not ( = ?auto_581677 ?auto_581685 ) ) ( not ( = ?auto_581677 ?auto_581686 ) ) ( not ( = ?auto_581677 ?auto_581687 ) ) ( not ( = ?auto_581677 ?auto_581688 ) ) ( not ( = ?auto_581678 ?auto_581679 ) ) ( not ( = ?auto_581678 ?auto_581680 ) ) ( not ( = ?auto_581678 ?auto_581681 ) ) ( not ( = ?auto_581678 ?auto_581682 ) ) ( not ( = ?auto_581678 ?auto_581683 ) ) ( not ( = ?auto_581678 ?auto_581684 ) ) ( not ( = ?auto_581678 ?auto_581685 ) ) ( not ( = ?auto_581678 ?auto_581686 ) ) ( not ( = ?auto_581678 ?auto_581687 ) ) ( not ( = ?auto_581678 ?auto_581688 ) ) ( not ( = ?auto_581679 ?auto_581680 ) ) ( not ( = ?auto_581679 ?auto_581681 ) ) ( not ( = ?auto_581679 ?auto_581682 ) ) ( not ( = ?auto_581679 ?auto_581683 ) ) ( not ( = ?auto_581679 ?auto_581684 ) ) ( not ( = ?auto_581679 ?auto_581685 ) ) ( not ( = ?auto_581679 ?auto_581686 ) ) ( not ( = ?auto_581679 ?auto_581687 ) ) ( not ( = ?auto_581679 ?auto_581688 ) ) ( not ( = ?auto_581680 ?auto_581681 ) ) ( not ( = ?auto_581680 ?auto_581682 ) ) ( not ( = ?auto_581680 ?auto_581683 ) ) ( not ( = ?auto_581680 ?auto_581684 ) ) ( not ( = ?auto_581680 ?auto_581685 ) ) ( not ( = ?auto_581680 ?auto_581686 ) ) ( not ( = ?auto_581680 ?auto_581687 ) ) ( not ( = ?auto_581680 ?auto_581688 ) ) ( not ( = ?auto_581681 ?auto_581682 ) ) ( not ( = ?auto_581681 ?auto_581683 ) ) ( not ( = ?auto_581681 ?auto_581684 ) ) ( not ( = ?auto_581681 ?auto_581685 ) ) ( not ( = ?auto_581681 ?auto_581686 ) ) ( not ( = ?auto_581681 ?auto_581687 ) ) ( not ( = ?auto_581681 ?auto_581688 ) ) ( not ( = ?auto_581682 ?auto_581683 ) ) ( not ( = ?auto_581682 ?auto_581684 ) ) ( not ( = ?auto_581682 ?auto_581685 ) ) ( not ( = ?auto_581682 ?auto_581686 ) ) ( not ( = ?auto_581682 ?auto_581687 ) ) ( not ( = ?auto_581682 ?auto_581688 ) ) ( not ( = ?auto_581683 ?auto_581684 ) ) ( not ( = ?auto_581683 ?auto_581685 ) ) ( not ( = ?auto_581683 ?auto_581686 ) ) ( not ( = ?auto_581683 ?auto_581687 ) ) ( not ( = ?auto_581683 ?auto_581688 ) ) ( not ( = ?auto_581684 ?auto_581685 ) ) ( not ( = ?auto_581684 ?auto_581686 ) ) ( not ( = ?auto_581684 ?auto_581687 ) ) ( not ( = ?auto_581684 ?auto_581688 ) ) ( not ( = ?auto_581685 ?auto_581686 ) ) ( not ( = ?auto_581685 ?auto_581687 ) ) ( not ( = ?auto_581685 ?auto_581688 ) ) ( not ( = ?auto_581686 ?auto_581687 ) ) ( not ( = ?auto_581686 ?auto_581688 ) ) ( not ( = ?auto_581687 ?auto_581688 ) ) ( ON ?auto_581686 ?auto_581687 ) ( ON ?auto_581685 ?auto_581686 ) ( ON ?auto_581684 ?auto_581685 ) ( ON ?auto_581683 ?auto_581684 ) ( ON ?auto_581682 ?auto_581683 ) ( CLEAR ?auto_581680 ) ( ON ?auto_581681 ?auto_581682 ) ( CLEAR ?auto_581681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_581674 ?auto_581675 ?auto_581676 ?auto_581677 ?auto_581678 ?auto_581679 ?auto_581680 ?auto_581681 )
      ( MAKE-14PILE ?auto_581674 ?auto_581675 ?auto_581676 ?auto_581677 ?auto_581678 ?auto_581679 ?auto_581680 ?auto_581681 ?auto_581682 ?auto_581683 ?auto_581684 ?auto_581685 ?auto_581686 ?auto_581687 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_581732 - BLOCK
      ?auto_581733 - BLOCK
      ?auto_581734 - BLOCK
      ?auto_581735 - BLOCK
      ?auto_581736 - BLOCK
      ?auto_581737 - BLOCK
      ?auto_581738 - BLOCK
      ?auto_581739 - BLOCK
      ?auto_581740 - BLOCK
      ?auto_581741 - BLOCK
      ?auto_581742 - BLOCK
      ?auto_581743 - BLOCK
      ?auto_581744 - BLOCK
      ?auto_581745 - BLOCK
    )
    :vars
    (
      ?auto_581746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581745 ?auto_581746 ) ( ON-TABLE ?auto_581732 ) ( ON ?auto_581733 ?auto_581732 ) ( ON ?auto_581734 ?auto_581733 ) ( ON ?auto_581735 ?auto_581734 ) ( ON ?auto_581736 ?auto_581735 ) ( ON ?auto_581737 ?auto_581736 ) ( not ( = ?auto_581732 ?auto_581733 ) ) ( not ( = ?auto_581732 ?auto_581734 ) ) ( not ( = ?auto_581732 ?auto_581735 ) ) ( not ( = ?auto_581732 ?auto_581736 ) ) ( not ( = ?auto_581732 ?auto_581737 ) ) ( not ( = ?auto_581732 ?auto_581738 ) ) ( not ( = ?auto_581732 ?auto_581739 ) ) ( not ( = ?auto_581732 ?auto_581740 ) ) ( not ( = ?auto_581732 ?auto_581741 ) ) ( not ( = ?auto_581732 ?auto_581742 ) ) ( not ( = ?auto_581732 ?auto_581743 ) ) ( not ( = ?auto_581732 ?auto_581744 ) ) ( not ( = ?auto_581732 ?auto_581745 ) ) ( not ( = ?auto_581732 ?auto_581746 ) ) ( not ( = ?auto_581733 ?auto_581734 ) ) ( not ( = ?auto_581733 ?auto_581735 ) ) ( not ( = ?auto_581733 ?auto_581736 ) ) ( not ( = ?auto_581733 ?auto_581737 ) ) ( not ( = ?auto_581733 ?auto_581738 ) ) ( not ( = ?auto_581733 ?auto_581739 ) ) ( not ( = ?auto_581733 ?auto_581740 ) ) ( not ( = ?auto_581733 ?auto_581741 ) ) ( not ( = ?auto_581733 ?auto_581742 ) ) ( not ( = ?auto_581733 ?auto_581743 ) ) ( not ( = ?auto_581733 ?auto_581744 ) ) ( not ( = ?auto_581733 ?auto_581745 ) ) ( not ( = ?auto_581733 ?auto_581746 ) ) ( not ( = ?auto_581734 ?auto_581735 ) ) ( not ( = ?auto_581734 ?auto_581736 ) ) ( not ( = ?auto_581734 ?auto_581737 ) ) ( not ( = ?auto_581734 ?auto_581738 ) ) ( not ( = ?auto_581734 ?auto_581739 ) ) ( not ( = ?auto_581734 ?auto_581740 ) ) ( not ( = ?auto_581734 ?auto_581741 ) ) ( not ( = ?auto_581734 ?auto_581742 ) ) ( not ( = ?auto_581734 ?auto_581743 ) ) ( not ( = ?auto_581734 ?auto_581744 ) ) ( not ( = ?auto_581734 ?auto_581745 ) ) ( not ( = ?auto_581734 ?auto_581746 ) ) ( not ( = ?auto_581735 ?auto_581736 ) ) ( not ( = ?auto_581735 ?auto_581737 ) ) ( not ( = ?auto_581735 ?auto_581738 ) ) ( not ( = ?auto_581735 ?auto_581739 ) ) ( not ( = ?auto_581735 ?auto_581740 ) ) ( not ( = ?auto_581735 ?auto_581741 ) ) ( not ( = ?auto_581735 ?auto_581742 ) ) ( not ( = ?auto_581735 ?auto_581743 ) ) ( not ( = ?auto_581735 ?auto_581744 ) ) ( not ( = ?auto_581735 ?auto_581745 ) ) ( not ( = ?auto_581735 ?auto_581746 ) ) ( not ( = ?auto_581736 ?auto_581737 ) ) ( not ( = ?auto_581736 ?auto_581738 ) ) ( not ( = ?auto_581736 ?auto_581739 ) ) ( not ( = ?auto_581736 ?auto_581740 ) ) ( not ( = ?auto_581736 ?auto_581741 ) ) ( not ( = ?auto_581736 ?auto_581742 ) ) ( not ( = ?auto_581736 ?auto_581743 ) ) ( not ( = ?auto_581736 ?auto_581744 ) ) ( not ( = ?auto_581736 ?auto_581745 ) ) ( not ( = ?auto_581736 ?auto_581746 ) ) ( not ( = ?auto_581737 ?auto_581738 ) ) ( not ( = ?auto_581737 ?auto_581739 ) ) ( not ( = ?auto_581737 ?auto_581740 ) ) ( not ( = ?auto_581737 ?auto_581741 ) ) ( not ( = ?auto_581737 ?auto_581742 ) ) ( not ( = ?auto_581737 ?auto_581743 ) ) ( not ( = ?auto_581737 ?auto_581744 ) ) ( not ( = ?auto_581737 ?auto_581745 ) ) ( not ( = ?auto_581737 ?auto_581746 ) ) ( not ( = ?auto_581738 ?auto_581739 ) ) ( not ( = ?auto_581738 ?auto_581740 ) ) ( not ( = ?auto_581738 ?auto_581741 ) ) ( not ( = ?auto_581738 ?auto_581742 ) ) ( not ( = ?auto_581738 ?auto_581743 ) ) ( not ( = ?auto_581738 ?auto_581744 ) ) ( not ( = ?auto_581738 ?auto_581745 ) ) ( not ( = ?auto_581738 ?auto_581746 ) ) ( not ( = ?auto_581739 ?auto_581740 ) ) ( not ( = ?auto_581739 ?auto_581741 ) ) ( not ( = ?auto_581739 ?auto_581742 ) ) ( not ( = ?auto_581739 ?auto_581743 ) ) ( not ( = ?auto_581739 ?auto_581744 ) ) ( not ( = ?auto_581739 ?auto_581745 ) ) ( not ( = ?auto_581739 ?auto_581746 ) ) ( not ( = ?auto_581740 ?auto_581741 ) ) ( not ( = ?auto_581740 ?auto_581742 ) ) ( not ( = ?auto_581740 ?auto_581743 ) ) ( not ( = ?auto_581740 ?auto_581744 ) ) ( not ( = ?auto_581740 ?auto_581745 ) ) ( not ( = ?auto_581740 ?auto_581746 ) ) ( not ( = ?auto_581741 ?auto_581742 ) ) ( not ( = ?auto_581741 ?auto_581743 ) ) ( not ( = ?auto_581741 ?auto_581744 ) ) ( not ( = ?auto_581741 ?auto_581745 ) ) ( not ( = ?auto_581741 ?auto_581746 ) ) ( not ( = ?auto_581742 ?auto_581743 ) ) ( not ( = ?auto_581742 ?auto_581744 ) ) ( not ( = ?auto_581742 ?auto_581745 ) ) ( not ( = ?auto_581742 ?auto_581746 ) ) ( not ( = ?auto_581743 ?auto_581744 ) ) ( not ( = ?auto_581743 ?auto_581745 ) ) ( not ( = ?auto_581743 ?auto_581746 ) ) ( not ( = ?auto_581744 ?auto_581745 ) ) ( not ( = ?auto_581744 ?auto_581746 ) ) ( not ( = ?auto_581745 ?auto_581746 ) ) ( ON ?auto_581744 ?auto_581745 ) ( ON ?auto_581743 ?auto_581744 ) ( ON ?auto_581742 ?auto_581743 ) ( ON ?auto_581741 ?auto_581742 ) ( ON ?auto_581740 ?auto_581741 ) ( ON ?auto_581739 ?auto_581740 ) ( CLEAR ?auto_581737 ) ( ON ?auto_581738 ?auto_581739 ) ( CLEAR ?auto_581738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_581732 ?auto_581733 ?auto_581734 ?auto_581735 ?auto_581736 ?auto_581737 ?auto_581738 )
      ( MAKE-14PILE ?auto_581732 ?auto_581733 ?auto_581734 ?auto_581735 ?auto_581736 ?auto_581737 ?auto_581738 ?auto_581739 ?auto_581740 ?auto_581741 ?auto_581742 ?auto_581743 ?auto_581744 ?auto_581745 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_581790 - BLOCK
      ?auto_581791 - BLOCK
      ?auto_581792 - BLOCK
      ?auto_581793 - BLOCK
      ?auto_581794 - BLOCK
      ?auto_581795 - BLOCK
      ?auto_581796 - BLOCK
      ?auto_581797 - BLOCK
      ?auto_581798 - BLOCK
      ?auto_581799 - BLOCK
      ?auto_581800 - BLOCK
      ?auto_581801 - BLOCK
      ?auto_581802 - BLOCK
      ?auto_581803 - BLOCK
    )
    :vars
    (
      ?auto_581804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581803 ?auto_581804 ) ( ON-TABLE ?auto_581790 ) ( ON ?auto_581791 ?auto_581790 ) ( ON ?auto_581792 ?auto_581791 ) ( ON ?auto_581793 ?auto_581792 ) ( ON ?auto_581794 ?auto_581793 ) ( not ( = ?auto_581790 ?auto_581791 ) ) ( not ( = ?auto_581790 ?auto_581792 ) ) ( not ( = ?auto_581790 ?auto_581793 ) ) ( not ( = ?auto_581790 ?auto_581794 ) ) ( not ( = ?auto_581790 ?auto_581795 ) ) ( not ( = ?auto_581790 ?auto_581796 ) ) ( not ( = ?auto_581790 ?auto_581797 ) ) ( not ( = ?auto_581790 ?auto_581798 ) ) ( not ( = ?auto_581790 ?auto_581799 ) ) ( not ( = ?auto_581790 ?auto_581800 ) ) ( not ( = ?auto_581790 ?auto_581801 ) ) ( not ( = ?auto_581790 ?auto_581802 ) ) ( not ( = ?auto_581790 ?auto_581803 ) ) ( not ( = ?auto_581790 ?auto_581804 ) ) ( not ( = ?auto_581791 ?auto_581792 ) ) ( not ( = ?auto_581791 ?auto_581793 ) ) ( not ( = ?auto_581791 ?auto_581794 ) ) ( not ( = ?auto_581791 ?auto_581795 ) ) ( not ( = ?auto_581791 ?auto_581796 ) ) ( not ( = ?auto_581791 ?auto_581797 ) ) ( not ( = ?auto_581791 ?auto_581798 ) ) ( not ( = ?auto_581791 ?auto_581799 ) ) ( not ( = ?auto_581791 ?auto_581800 ) ) ( not ( = ?auto_581791 ?auto_581801 ) ) ( not ( = ?auto_581791 ?auto_581802 ) ) ( not ( = ?auto_581791 ?auto_581803 ) ) ( not ( = ?auto_581791 ?auto_581804 ) ) ( not ( = ?auto_581792 ?auto_581793 ) ) ( not ( = ?auto_581792 ?auto_581794 ) ) ( not ( = ?auto_581792 ?auto_581795 ) ) ( not ( = ?auto_581792 ?auto_581796 ) ) ( not ( = ?auto_581792 ?auto_581797 ) ) ( not ( = ?auto_581792 ?auto_581798 ) ) ( not ( = ?auto_581792 ?auto_581799 ) ) ( not ( = ?auto_581792 ?auto_581800 ) ) ( not ( = ?auto_581792 ?auto_581801 ) ) ( not ( = ?auto_581792 ?auto_581802 ) ) ( not ( = ?auto_581792 ?auto_581803 ) ) ( not ( = ?auto_581792 ?auto_581804 ) ) ( not ( = ?auto_581793 ?auto_581794 ) ) ( not ( = ?auto_581793 ?auto_581795 ) ) ( not ( = ?auto_581793 ?auto_581796 ) ) ( not ( = ?auto_581793 ?auto_581797 ) ) ( not ( = ?auto_581793 ?auto_581798 ) ) ( not ( = ?auto_581793 ?auto_581799 ) ) ( not ( = ?auto_581793 ?auto_581800 ) ) ( not ( = ?auto_581793 ?auto_581801 ) ) ( not ( = ?auto_581793 ?auto_581802 ) ) ( not ( = ?auto_581793 ?auto_581803 ) ) ( not ( = ?auto_581793 ?auto_581804 ) ) ( not ( = ?auto_581794 ?auto_581795 ) ) ( not ( = ?auto_581794 ?auto_581796 ) ) ( not ( = ?auto_581794 ?auto_581797 ) ) ( not ( = ?auto_581794 ?auto_581798 ) ) ( not ( = ?auto_581794 ?auto_581799 ) ) ( not ( = ?auto_581794 ?auto_581800 ) ) ( not ( = ?auto_581794 ?auto_581801 ) ) ( not ( = ?auto_581794 ?auto_581802 ) ) ( not ( = ?auto_581794 ?auto_581803 ) ) ( not ( = ?auto_581794 ?auto_581804 ) ) ( not ( = ?auto_581795 ?auto_581796 ) ) ( not ( = ?auto_581795 ?auto_581797 ) ) ( not ( = ?auto_581795 ?auto_581798 ) ) ( not ( = ?auto_581795 ?auto_581799 ) ) ( not ( = ?auto_581795 ?auto_581800 ) ) ( not ( = ?auto_581795 ?auto_581801 ) ) ( not ( = ?auto_581795 ?auto_581802 ) ) ( not ( = ?auto_581795 ?auto_581803 ) ) ( not ( = ?auto_581795 ?auto_581804 ) ) ( not ( = ?auto_581796 ?auto_581797 ) ) ( not ( = ?auto_581796 ?auto_581798 ) ) ( not ( = ?auto_581796 ?auto_581799 ) ) ( not ( = ?auto_581796 ?auto_581800 ) ) ( not ( = ?auto_581796 ?auto_581801 ) ) ( not ( = ?auto_581796 ?auto_581802 ) ) ( not ( = ?auto_581796 ?auto_581803 ) ) ( not ( = ?auto_581796 ?auto_581804 ) ) ( not ( = ?auto_581797 ?auto_581798 ) ) ( not ( = ?auto_581797 ?auto_581799 ) ) ( not ( = ?auto_581797 ?auto_581800 ) ) ( not ( = ?auto_581797 ?auto_581801 ) ) ( not ( = ?auto_581797 ?auto_581802 ) ) ( not ( = ?auto_581797 ?auto_581803 ) ) ( not ( = ?auto_581797 ?auto_581804 ) ) ( not ( = ?auto_581798 ?auto_581799 ) ) ( not ( = ?auto_581798 ?auto_581800 ) ) ( not ( = ?auto_581798 ?auto_581801 ) ) ( not ( = ?auto_581798 ?auto_581802 ) ) ( not ( = ?auto_581798 ?auto_581803 ) ) ( not ( = ?auto_581798 ?auto_581804 ) ) ( not ( = ?auto_581799 ?auto_581800 ) ) ( not ( = ?auto_581799 ?auto_581801 ) ) ( not ( = ?auto_581799 ?auto_581802 ) ) ( not ( = ?auto_581799 ?auto_581803 ) ) ( not ( = ?auto_581799 ?auto_581804 ) ) ( not ( = ?auto_581800 ?auto_581801 ) ) ( not ( = ?auto_581800 ?auto_581802 ) ) ( not ( = ?auto_581800 ?auto_581803 ) ) ( not ( = ?auto_581800 ?auto_581804 ) ) ( not ( = ?auto_581801 ?auto_581802 ) ) ( not ( = ?auto_581801 ?auto_581803 ) ) ( not ( = ?auto_581801 ?auto_581804 ) ) ( not ( = ?auto_581802 ?auto_581803 ) ) ( not ( = ?auto_581802 ?auto_581804 ) ) ( not ( = ?auto_581803 ?auto_581804 ) ) ( ON ?auto_581802 ?auto_581803 ) ( ON ?auto_581801 ?auto_581802 ) ( ON ?auto_581800 ?auto_581801 ) ( ON ?auto_581799 ?auto_581800 ) ( ON ?auto_581798 ?auto_581799 ) ( ON ?auto_581797 ?auto_581798 ) ( ON ?auto_581796 ?auto_581797 ) ( CLEAR ?auto_581794 ) ( ON ?auto_581795 ?auto_581796 ) ( CLEAR ?auto_581795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_581790 ?auto_581791 ?auto_581792 ?auto_581793 ?auto_581794 ?auto_581795 )
      ( MAKE-14PILE ?auto_581790 ?auto_581791 ?auto_581792 ?auto_581793 ?auto_581794 ?auto_581795 ?auto_581796 ?auto_581797 ?auto_581798 ?auto_581799 ?auto_581800 ?auto_581801 ?auto_581802 ?auto_581803 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_581848 - BLOCK
      ?auto_581849 - BLOCK
      ?auto_581850 - BLOCK
      ?auto_581851 - BLOCK
      ?auto_581852 - BLOCK
      ?auto_581853 - BLOCK
      ?auto_581854 - BLOCK
      ?auto_581855 - BLOCK
      ?auto_581856 - BLOCK
      ?auto_581857 - BLOCK
      ?auto_581858 - BLOCK
      ?auto_581859 - BLOCK
      ?auto_581860 - BLOCK
      ?auto_581861 - BLOCK
    )
    :vars
    (
      ?auto_581862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581861 ?auto_581862 ) ( ON-TABLE ?auto_581848 ) ( ON ?auto_581849 ?auto_581848 ) ( ON ?auto_581850 ?auto_581849 ) ( ON ?auto_581851 ?auto_581850 ) ( not ( = ?auto_581848 ?auto_581849 ) ) ( not ( = ?auto_581848 ?auto_581850 ) ) ( not ( = ?auto_581848 ?auto_581851 ) ) ( not ( = ?auto_581848 ?auto_581852 ) ) ( not ( = ?auto_581848 ?auto_581853 ) ) ( not ( = ?auto_581848 ?auto_581854 ) ) ( not ( = ?auto_581848 ?auto_581855 ) ) ( not ( = ?auto_581848 ?auto_581856 ) ) ( not ( = ?auto_581848 ?auto_581857 ) ) ( not ( = ?auto_581848 ?auto_581858 ) ) ( not ( = ?auto_581848 ?auto_581859 ) ) ( not ( = ?auto_581848 ?auto_581860 ) ) ( not ( = ?auto_581848 ?auto_581861 ) ) ( not ( = ?auto_581848 ?auto_581862 ) ) ( not ( = ?auto_581849 ?auto_581850 ) ) ( not ( = ?auto_581849 ?auto_581851 ) ) ( not ( = ?auto_581849 ?auto_581852 ) ) ( not ( = ?auto_581849 ?auto_581853 ) ) ( not ( = ?auto_581849 ?auto_581854 ) ) ( not ( = ?auto_581849 ?auto_581855 ) ) ( not ( = ?auto_581849 ?auto_581856 ) ) ( not ( = ?auto_581849 ?auto_581857 ) ) ( not ( = ?auto_581849 ?auto_581858 ) ) ( not ( = ?auto_581849 ?auto_581859 ) ) ( not ( = ?auto_581849 ?auto_581860 ) ) ( not ( = ?auto_581849 ?auto_581861 ) ) ( not ( = ?auto_581849 ?auto_581862 ) ) ( not ( = ?auto_581850 ?auto_581851 ) ) ( not ( = ?auto_581850 ?auto_581852 ) ) ( not ( = ?auto_581850 ?auto_581853 ) ) ( not ( = ?auto_581850 ?auto_581854 ) ) ( not ( = ?auto_581850 ?auto_581855 ) ) ( not ( = ?auto_581850 ?auto_581856 ) ) ( not ( = ?auto_581850 ?auto_581857 ) ) ( not ( = ?auto_581850 ?auto_581858 ) ) ( not ( = ?auto_581850 ?auto_581859 ) ) ( not ( = ?auto_581850 ?auto_581860 ) ) ( not ( = ?auto_581850 ?auto_581861 ) ) ( not ( = ?auto_581850 ?auto_581862 ) ) ( not ( = ?auto_581851 ?auto_581852 ) ) ( not ( = ?auto_581851 ?auto_581853 ) ) ( not ( = ?auto_581851 ?auto_581854 ) ) ( not ( = ?auto_581851 ?auto_581855 ) ) ( not ( = ?auto_581851 ?auto_581856 ) ) ( not ( = ?auto_581851 ?auto_581857 ) ) ( not ( = ?auto_581851 ?auto_581858 ) ) ( not ( = ?auto_581851 ?auto_581859 ) ) ( not ( = ?auto_581851 ?auto_581860 ) ) ( not ( = ?auto_581851 ?auto_581861 ) ) ( not ( = ?auto_581851 ?auto_581862 ) ) ( not ( = ?auto_581852 ?auto_581853 ) ) ( not ( = ?auto_581852 ?auto_581854 ) ) ( not ( = ?auto_581852 ?auto_581855 ) ) ( not ( = ?auto_581852 ?auto_581856 ) ) ( not ( = ?auto_581852 ?auto_581857 ) ) ( not ( = ?auto_581852 ?auto_581858 ) ) ( not ( = ?auto_581852 ?auto_581859 ) ) ( not ( = ?auto_581852 ?auto_581860 ) ) ( not ( = ?auto_581852 ?auto_581861 ) ) ( not ( = ?auto_581852 ?auto_581862 ) ) ( not ( = ?auto_581853 ?auto_581854 ) ) ( not ( = ?auto_581853 ?auto_581855 ) ) ( not ( = ?auto_581853 ?auto_581856 ) ) ( not ( = ?auto_581853 ?auto_581857 ) ) ( not ( = ?auto_581853 ?auto_581858 ) ) ( not ( = ?auto_581853 ?auto_581859 ) ) ( not ( = ?auto_581853 ?auto_581860 ) ) ( not ( = ?auto_581853 ?auto_581861 ) ) ( not ( = ?auto_581853 ?auto_581862 ) ) ( not ( = ?auto_581854 ?auto_581855 ) ) ( not ( = ?auto_581854 ?auto_581856 ) ) ( not ( = ?auto_581854 ?auto_581857 ) ) ( not ( = ?auto_581854 ?auto_581858 ) ) ( not ( = ?auto_581854 ?auto_581859 ) ) ( not ( = ?auto_581854 ?auto_581860 ) ) ( not ( = ?auto_581854 ?auto_581861 ) ) ( not ( = ?auto_581854 ?auto_581862 ) ) ( not ( = ?auto_581855 ?auto_581856 ) ) ( not ( = ?auto_581855 ?auto_581857 ) ) ( not ( = ?auto_581855 ?auto_581858 ) ) ( not ( = ?auto_581855 ?auto_581859 ) ) ( not ( = ?auto_581855 ?auto_581860 ) ) ( not ( = ?auto_581855 ?auto_581861 ) ) ( not ( = ?auto_581855 ?auto_581862 ) ) ( not ( = ?auto_581856 ?auto_581857 ) ) ( not ( = ?auto_581856 ?auto_581858 ) ) ( not ( = ?auto_581856 ?auto_581859 ) ) ( not ( = ?auto_581856 ?auto_581860 ) ) ( not ( = ?auto_581856 ?auto_581861 ) ) ( not ( = ?auto_581856 ?auto_581862 ) ) ( not ( = ?auto_581857 ?auto_581858 ) ) ( not ( = ?auto_581857 ?auto_581859 ) ) ( not ( = ?auto_581857 ?auto_581860 ) ) ( not ( = ?auto_581857 ?auto_581861 ) ) ( not ( = ?auto_581857 ?auto_581862 ) ) ( not ( = ?auto_581858 ?auto_581859 ) ) ( not ( = ?auto_581858 ?auto_581860 ) ) ( not ( = ?auto_581858 ?auto_581861 ) ) ( not ( = ?auto_581858 ?auto_581862 ) ) ( not ( = ?auto_581859 ?auto_581860 ) ) ( not ( = ?auto_581859 ?auto_581861 ) ) ( not ( = ?auto_581859 ?auto_581862 ) ) ( not ( = ?auto_581860 ?auto_581861 ) ) ( not ( = ?auto_581860 ?auto_581862 ) ) ( not ( = ?auto_581861 ?auto_581862 ) ) ( ON ?auto_581860 ?auto_581861 ) ( ON ?auto_581859 ?auto_581860 ) ( ON ?auto_581858 ?auto_581859 ) ( ON ?auto_581857 ?auto_581858 ) ( ON ?auto_581856 ?auto_581857 ) ( ON ?auto_581855 ?auto_581856 ) ( ON ?auto_581854 ?auto_581855 ) ( ON ?auto_581853 ?auto_581854 ) ( CLEAR ?auto_581851 ) ( ON ?auto_581852 ?auto_581853 ) ( CLEAR ?auto_581852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_581848 ?auto_581849 ?auto_581850 ?auto_581851 ?auto_581852 )
      ( MAKE-14PILE ?auto_581848 ?auto_581849 ?auto_581850 ?auto_581851 ?auto_581852 ?auto_581853 ?auto_581854 ?auto_581855 ?auto_581856 ?auto_581857 ?auto_581858 ?auto_581859 ?auto_581860 ?auto_581861 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_581906 - BLOCK
      ?auto_581907 - BLOCK
      ?auto_581908 - BLOCK
      ?auto_581909 - BLOCK
      ?auto_581910 - BLOCK
      ?auto_581911 - BLOCK
      ?auto_581912 - BLOCK
      ?auto_581913 - BLOCK
      ?auto_581914 - BLOCK
      ?auto_581915 - BLOCK
      ?auto_581916 - BLOCK
      ?auto_581917 - BLOCK
      ?auto_581918 - BLOCK
      ?auto_581919 - BLOCK
    )
    :vars
    (
      ?auto_581920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581919 ?auto_581920 ) ( ON-TABLE ?auto_581906 ) ( ON ?auto_581907 ?auto_581906 ) ( ON ?auto_581908 ?auto_581907 ) ( not ( = ?auto_581906 ?auto_581907 ) ) ( not ( = ?auto_581906 ?auto_581908 ) ) ( not ( = ?auto_581906 ?auto_581909 ) ) ( not ( = ?auto_581906 ?auto_581910 ) ) ( not ( = ?auto_581906 ?auto_581911 ) ) ( not ( = ?auto_581906 ?auto_581912 ) ) ( not ( = ?auto_581906 ?auto_581913 ) ) ( not ( = ?auto_581906 ?auto_581914 ) ) ( not ( = ?auto_581906 ?auto_581915 ) ) ( not ( = ?auto_581906 ?auto_581916 ) ) ( not ( = ?auto_581906 ?auto_581917 ) ) ( not ( = ?auto_581906 ?auto_581918 ) ) ( not ( = ?auto_581906 ?auto_581919 ) ) ( not ( = ?auto_581906 ?auto_581920 ) ) ( not ( = ?auto_581907 ?auto_581908 ) ) ( not ( = ?auto_581907 ?auto_581909 ) ) ( not ( = ?auto_581907 ?auto_581910 ) ) ( not ( = ?auto_581907 ?auto_581911 ) ) ( not ( = ?auto_581907 ?auto_581912 ) ) ( not ( = ?auto_581907 ?auto_581913 ) ) ( not ( = ?auto_581907 ?auto_581914 ) ) ( not ( = ?auto_581907 ?auto_581915 ) ) ( not ( = ?auto_581907 ?auto_581916 ) ) ( not ( = ?auto_581907 ?auto_581917 ) ) ( not ( = ?auto_581907 ?auto_581918 ) ) ( not ( = ?auto_581907 ?auto_581919 ) ) ( not ( = ?auto_581907 ?auto_581920 ) ) ( not ( = ?auto_581908 ?auto_581909 ) ) ( not ( = ?auto_581908 ?auto_581910 ) ) ( not ( = ?auto_581908 ?auto_581911 ) ) ( not ( = ?auto_581908 ?auto_581912 ) ) ( not ( = ?auto_581908 ?auto_581913 ) ) ( not ( = ?auto_581908 ?auto_581914 ) ) ( not ( = ?auto_581908 ?auto_581915 ) ) ( not ( = ?auto_581908 ?auto_581916 ) ) ( not ( = ?auto_581908 ?auto_581917 ) ) ( not ( = ?auto_581908 ?auto_581918 ) ) ( not ( = ?auto_581908 ?auto_581919 ) ) ( not ( = ?auto_581908 ?auto_581920 ) ) ( not ( = ?auto_581909 ?auto_581910 ) ) ( not ( = ?auto_581909 ?auto_581911 ) ) ( not ( = ?auto_581909 ?auto_581912 ) ) ( not ( = ?auto_581909 ?auto_581913 ) ) ( not ( = ?auto_581909 ?auto_581914 ) ) ( not ( = ?auto_581909 ?auto_581915 ) ) ( not ( = ?auto_581909 ?auto_581916 ) ) ( not ( = ?auto_581909 ?auto_581917 ) ) ( not ( = ?auto_581909 ?auto_581918 ) ) ( not ( = ?auto_581909 ?auto_581919 ) ) ( not ( = ?auto_581909 ?auto_581920 ) ) ( not ( = ?auto_581910 ?auto_581911 ) ) ( not ( = ?auto_581910 ?auto_581912 ) ) ( not ( = ?auto_581910 ?auto_581913 ) ) ( not ( = ?auto_581910 ?auto_581914 ) ) ( not ( = ?auto_581910 ?auto_581915 ) ) ( not ( = ?auto_581910 ?auto_581916 ) ) ( not ( = ?auto_581910 ?auto_581917 ) ) ( not ( = ?auto_581910 ?auto_581918 ) ) ( not ( = ?auto_581910 ?auto_581919 ) ) ( not ( = ?auto_581910 ?auto_581920 ) ) ( not ( = ?auto_581911 ?auto_581912 ) ) ( not ( = ?auto_581911 ?auto_581913 ) ) ( not ( = ?auto_581911 ?auto_581914 ) ) ( not ( = ?auto_581911 ?auto_581915 ) ) ( not ( = ?auto_581911 ?auto_581916 ) ) ( not ( = ?auto_581911 ?auto_581917 ) ) ( not ( = ?auto_581911 ?auto_581918 ) ) ( not ( = ?auto_581911 ?auto_581919 ) ) ( not ( = ?auto_581911 ?auto_581920 ) ) ( not ( = ?auto_581912 ?auto_581913 ) ) ( not ( = ?auto_581912 ?auto_581914 ) ) ( not ( = ?auto_581912 ?auto_581915 ) ) ( not ( = ?auto_581912 ?auto_581916 ) ) ( not ( = ?auto_581912 ?auto_581917 ) ) ( not ( = ?auto_581912 ?auto_581918 ) ) ( not ( = ?auto_581912 ?auto_581919 ) ) ( not ( = ?auto_581912 ?auto_581920 ) ) ( not ( = ?auto_581913 ?auto_581914 ) ) ( not ( = ?auto_581913 ?auto_581915 ) ) ( not ( = ?auto_581913 ?auto_581916 ) ) ( not ( = ?auto_581913 ?auto_581917 ) ) ( not ( = ?auto_581913 ?auto_581918 ) ) ( not ( = ?auto_581913 ?auto_581919 ) ) ( not ( = ?auto_581913 ?auto_581920 ) ) ( not ( = ?auto_581914 ?auto_581915 ) ) ( not ( = ?auto_581914 ?auto_581916 ) ) ( not ( = ?auto_581914 ?auto_581917 ) ) ( not ( = ?auto_581914 ?auto_581918 ) ) ( not ( = ?auto_581914 ?auto_581919 ) ) ( not ( = ?auto_581914 ?auto_581920 ) ) ( not ( = ?auto_581915 ?auto_581916 ) ) ( not ( = ?auto_581915 ?auto_581917 ) ) ( not ( = ?auto_581915 ?auto_581918 ) ) ( not ( = ?auto_581915 ?auto_581919 ) ) ( not ( = ?auto_581915 ?auto_581920 ) ) ( not ( = ?auto_581916 ?auto_581917 ) ) ( not ( = ?auto_581916 ?auto_581918 ) ) ( not ( = ?auto_581916 ?auto_581919 ) ) ( not ( = ?auto_581916 ?auto_581920 ) ) ( not ( = ?auto_581917 ?auto_581918 ) ) ( not ( = ?auto_581917 ?auto_581919 ) ) ( not ( = ?auto_581917 ?auto_581920 ) ) ( not ( = ?auto_581918 ?auto_581919 ) ) ( not ( = ?auto_581918 ?auto_581920 ) ) ( not ( = ?auto_581919 ?auto_581920 ) ) ( ON ?auto_581918 ?auto_581919 ) ( ON ?auto_581917 ?auto_581918 ) ( ON ?auto_581916 ?auto_581917 ) ( ON ?auto_581915 ?auto_581916 ) ( ON ?auto_581914 ?auto_581915 ) ( ON ?auto_581913 ?auto_581914 ) ( ON ?auto_581912 ?auto_581913 ) ( ON ?auto_581911 ?auto_581912 ) ( ON ?auto_581910 ?auto_581911 ) ( CLEAR ?auto_581908 ) ( ON ?auto_581909 ?auto_581910 ) ( CLEAR ?auto_581909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_581906 ?auto_581907 ?auto_581908 ?auto_581909 )
      ( MAKE-14PILE ?auto_581906 ?auto_581907 ?auto_581908 ?auto_581909 ?auto_581910 ?auto_581911 ?auto_581912 ?auto_581913 ?auto_581914 ?auto_581915 ?auto_581916 ?auto_581917 ?auto_581918 ?auto_581919 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_581964 - BLOCK
      ?auto_581965 - BLOCK
      ?auto_581966 - BLOCK
      ?auto_581967 - BLOCK
      ?auto_581968 - BLOCK
      ?auto_581969 - BLOCK
      ?auto_581970 - BLOCK
      ?auto_581971 - BLOCK
      ?auto_581972 - BLOCK
      ?auto_581973 - BLOCK
      ?auto_581974 - BLOCK
      ?auto_581975 - BLOCK
      ?auto_581976 - BLOCK
      ?auto_581977 - BLOCK
    )
    :vars
    (
      ?auto_581978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_581977 ?auto_581978 ) ( ON-TABLE ?auto_581964 ) ( ON ?auto_581965 ?auto_581964 ) ( not ( = ?auto_581964 ?auto_581965 ) ) ( not ( = ?auto_581964 ?auto_581966 ) ) ( not ( = ?auto_581964 ?auto_581967 ) ) ( not ( = ?auto_581964 ?auto_581968 ) ) ( not ( = ?auto_581964 ?auto_581969 ) ) ( not ( = ?auto_581964 ?auto_581970 ) ) ( not ( = ?auto_581964 ?auto_581971 ) ) ( not ( = ?auto_581964 ?auto_581972 ) ) ( not ( = ?auto_581964 ?auto_581973 ) ) ( not ( = ?auto_581964 ?auto_581974 ) ) ( not ( = ?auto_581964 ?auto_581975 ) ) ( not ( = ?auto_581964 ?auto_581976 ) ) ( not ( = ?auto_581964 ?auto_581977 ) ) ( not ( = ?auto_581964 ?auto_581978 ) ) ( not ( = ?auto_581965 ?auto_581966 ) ) ( not ( = ?auto_581965 ?auto_581967 ) ) ( not ( = ?auto_581965 ?auto_581968 ) ) ( not ( = ?auto_581965 ?auto_581969 ) ) ( not ( = ?auto_581965 ?auto_581970 ) ) ( not ( = ?auto_581965 ?auto_581971 ) ) ( not ( = ?auto_581965 ?auto_581972 ) ) ( not ( = ?auto_581965 ?auto_581973 ) ) ( not ( = ?auto_581965 ?auto_581974 ) ) ( not ( = ?auto_581965 ?auto_581975 ) ) ( not ( = ?auto_581965 ?auto_581976 ) ) ( not ( = ?auto_581965 ?auto_581977 ) ) ( not ( = ?auto_581965 ?auto_581978 ) ) ( not ( = ?auto_581966 ?auto_581967 ) ) ( not ( = ?auto_581966 ?auto_581968 ) ) ( not ( = ?auto_581966 ?auto_581969 ) ) ( not ( = ?auto_581966 ?auto_581970 ) ) ( not ( = ?auto_581966 ?auto_581971 ) ) ( not ( = ?auto_581966 ?auto_581972 ) ) ( not ( = ?auto_581966 ?auto_581973 ) ) ( not ( = ?auto_581966 ?auto_581974 ) ) ( not ( = ?auto_581966 ?auto_581975 ) ) ( not ( = ?auto_581966 ?auto_581976 ) ) ( not ( = ?auto_581966 ?auto_581977 ) ) ( not ( = ?auto_581966 ?auto_581978 ) ) ( not ( = ?auto_581967 ?auto_581968 ) ) ( not ( = ?auto_581967 ?auto_581969 ) ) ( not ( = ?auto_581967 ?auto_581970 ) ) ( not ( = ?auto_581967 ?auto_581971 ) ) ( not ( = ?auto_581967 ?auto_581972 ) ) ( not ( = ?auto_581967 ?auto_581973 ) ) ( not ( = ?auto_581967 ?auto_581974 ) ) ( not ( = ?auto_581967 ?auto_581975 ) ) ( not ( = ?auto_581967 ?auto_581976 ) ) ( not ( = ?auto_581967 ?auto_581977 ) ) ( not ( = ?auto_581967 ?auto_581978 ) ) ( not ( = ?auto_581968 ?auto_581969 ) ) ( not ( = ?auto_581968 ?auto_581970 ) ) ( not ( = ?auto_581968 ?auto_581971 ) ) ( not ( = ?auto_581968 ?auto_581972 ) ) ( not ( = ?auto_581968 ?auto_581973 ) ) ( not ( = ?auto_581968 ?auto_581974 ) ) ( not ( = ?auto_581968 ?auto_581975 ) ) ( not ( = ?auto_581968 ?auto_581976 ) ) ( not ( = ?auto_581968 ?auto_581977 ) ) ( not ( = ?auto_581968 ?auto_581978 ) ) ( not ( = ?auto_581969 ?auto_581970 ) ) ( not ( = ?auto_581969 ?auto_581971 ) ) ( not ( = ?auto_581969 ?auto_581972 ) ) ( not ( = ?auto_581969 ?auto_581973 ) ) ( not ( = ?auto_581969 ?auto_581974 ) ) ( not ( = ?auto_581969 ?auto_581975 ) ) ( not ( = ?auto_581969 ?auto_581976 ) ) ( not ( = ?auto_581969 ?auto_581977 ) ) ( not ( = ?auto_581969 ?auto_581978 ) ) ( not ( = ?auto_581970 ?auto_581971 ) ) ( not ( = ?auto_581970 ?auto_581972 ) ) ( not ( = ?auto_581970 ?auto_581973 ) ) ( not ( = ?auto_581970 ?auto_581974 ) ) ( not ( = ?auto_581970 ?auto_581975 ) ) ( not ( = ?auto_581970 ?auto_581976 ) ) ( not ( = ?auto_581970 ?auto_581977 ) ) ( not ( = ?auto_581970 ?auto_581978 ) ) ( not ( = ?auto_581971 ?auto_581972 ) ) ( not ( = ?auto_581971 ?auto_581973 ) ) ( not ( = ?auto_581971 ?auto_581974 ) ) ( not ( = ?auto_581971 ?auto_581975 ) ) ( not ( = ?auto_581971 ?auto_581976 ) ) ( not ( = ?auto_581971 ?auto_581977 ) ) ( not ( = ?auto_581971 ?auto_581978 ) ) ( not ( = ?auto_581972 ?auto_581973 ) ) ( not ( = ?auto_581972 ?auto_581974 ) ) ( not ( = ?auto_581972 ?auto_581975 ) ) ( not ( = ?auto_581972 ?auto_581976 ) ) ( not ( = ?auto_581972 ?auto_581977 ) ) ( not ( = ?auto_581972 ?auto_581978 ) ) ( not ( = ?auto_581973 ?auto_581974 ) ) ( not ( = ?auto_581973 ?auto_581975 ) ) ( not ( = ?auto_581973 ?auto_581976 ) ) ( not ( = ?auto_581973 ?auto_581977 ) ) ( not ( = ?auto_581973 ?auto_581978 ) ) ( not ( = ?auto_581974 ?auto_581975 ) ) ( not ( = ?auto_581974 ?auto_581976 ) ) ( not ( = ?auto_581974 ?auto_581977 ) ) ( not ( = ?auto_581974 ?auto_581978 ) ) ( not ( = ?auto_581975 ?auto_581976 ) ) ( not ( = ?auto_581975 ?auto_581977 ) ) ( not ( = ?auto_581975 ?auto_581978 ) ) ( not ( = ?auto_581976 ?auto_581977 ) ) ( not ( = ?auto_581976 ?auto_581978 ) ) ( not ( = ?auto_581977 ?auto_581978 ) ) ( ON ?auto_581976 ?auto_581977 ) ( ON ?auto_581975 ?auto_581976 ) ( ON ?auto_581974 ?auto_581975 ) ( ON ?auto_581973 ?auto_581974 ) ( ON ?auto_581972 ?auto_581973 ) ( ON ?auto_581971 ?auto_581972 ) ( ON ?auto_581970 ?auto_581971 ) ( ON ?auto_581969 ?auto_581970 ) ( ON ?auto_581968 ?auto_581969 ) ( ON ?auto_581967 ?auto_581968 ) ( CLEAR ?auto_581965 ) ( ON ?auto_581966 ?auto_581967 ) ( CLEAR ?auto_581966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_581964 ?auto_581965 ?auto_581966 )
      ( MAKE-14PILE ?auto_581964 ?auto_581965 ?auto_581966 ?auto_581967 ?auto_581968 ?auto_581969 ?auto_581970 ?auto_581971 ?auto_581972 ?auto_581973 ?auto_581974 ?auto_581975 ?auto_581976 ?auto_581977 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_582022 - BLOCK
      ?auto_582023 - BLOCK
      ?auto_582024 - BLOCK
      ?auto_582025 - BLOCK
      ?auto_582026 - BLOCK
      ?auto_582027 - BLOCK
      ?auto_582028 - BLOCK
      ?auto_582029 - BLOCK
      ?auto_582030 - BLOCK
      ?auto_582031 - BLOCK
      ?auto_582032 - BLOCK
      ?auto_582033 - BLOCK
      ?auto_582034 - BLOCK
      ?auto_582035 - BLOCK
    )
    :vars
    (
      ?auto_582036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582035 ?auto_582036 ) ( ON-TABLE ?auto_582022 ) ( not ( = ?auto_582022 ?auto_582023 ) ) ( not ( = ?auto_582022 ?auto_582024 ) ) ( not ( = ?auto_582022 ?auto_582025 ) ) ( not ( = ?auto_582022 ?auto_582026 ) ) ( not ( = ?auto_582022 ?auto_582027 ) ) ( not ( = ?auto_582022 ?auto_582028 ) ) ( not ( = ?auto_582022 ?auto_582029 ) ) ( not ( = ?auto_582022 ?auto_582030 ) ) ( not ( = ?auto_582022 ?auto_582031 ) ) ( not ( = ?auto_582022 ?auto_582032 ) ) ( not ( = ?auto_582022 ?auto_582033 ) ) ( not ( = ?auto_582022 ?auto_582034 ) ) ( not ( = ?auto_582022 ?auto_582035 ) ) ( not ( = ?auto_582022 ?auto_582036 ) ) ( not ( = ?auto_582023 ?auto_582024 ) ) ( not ( = ?auto_582023 ?auto_582025 ) ) ( not ( = ?auto_582023 ?auto_582026 ) ) ( not ( = ?auto_582023 ?auto_582027 ) ) ( not ( = ?auto_582023 ?auto_582028 ) ) ( not ( = ?auto_582023 ?auto_582029 ) ) ( not ( = ?auto_582023 ?auto_582030 ) ) ( not ( = ?auto_582023 ?auto_582031 ) ) ( not ( = ?auto_582023 ?auto_582032 ) ) ( not ( = ?auto_582023 ?auto_582033 ) ) ( not ( = ?auto_582023 ?auto_582034 ) ) ( not ( = ?auto_582023 ?auto_582035 ) ) ( not ( = ?auto_582023 ?auto_582036 ) ) ( not ( = ?auto_582024 ?auto_582025 ) ) ( not ( = ?auto_582024 ?auto_582026 ) ) ( not ( = ?auto_582024 ?auto_582027 ) ) ( not ( = ?auto_582024 ?auto_582028 ) ) ( not ( = ?auto_582024 ?auto_582029 ) ) ( not ( = ?auto_582024 ?auto_582030 ) ) ( not ( = ?auto_582024 ?auto_582031 ) ) ( not ( = ?auto_582024 ?auto_582032 ) ) ( not ( = ?auto_582024 ?auto_582033 ) ) ( not ( = ?auto_582024 ?auto_582034 ) ) ( not ( = ?auto_582024 ?auto_582035 ) ) ( not ( = ?auto_582024 ?auto_582036 ) ) ( not ( = ?auto_582025 ?auto_582026 ) ) ( not ( = ?auto_582025 ?auto_582027 ) ) ( not ( = ?auto_582025 ?auto_582028 ) ) ( not ( = ?auto_582025 ?auto_582029 ) ) ( not ( = ?auto_582025 ?auto_582030 ) ) ( not ( = ?auto_582025 ?auto_582031 ) ) ( not ( = ?auto_582025 ?auto_582032 ) ) ( not ( = ?auto_582025 ?auto_582033 ) ) ( not ( = ?auto_582025 ?auto_582034 ) ) ( not ( = ?auto_582025 ?auto_582035 ) ) ( not ( = ?auto_582025 ?auto_582036 ) ) ( not ( = ?auto_582026 ?auto_582027 ) ) ( not ( = ?auto_582026 ?auto_582028 ) ) ( not ( = ?auto_582026 ?auto_582029 ) ) ( not ( = ?auto_582026 ?auto_582030 ) ) ( not ( = ?auto_582026 ?auto_582031 ) ) ( not ( = ?auto_582026 ?auto_582032 ) ) ( not ( = ?auto_582026 ?auto_582033 ) ) ( not ( = ?auto_582026 ?auto_582034 ) ) ( not ( = ?auto_582026 ?auto_582035 ) ) ( not ( = ?auto_582026 ?auto_582036 ) ) ( not ( = ?auto_582027 ?auto_582028 ) ) ( not ( = ?auto_582027 ?auto_582029 ) ) ( not ( = ?auto_582027 ?auto_582030 ) ) ( not ( = ?auto_582027 ?auto_582031 ) ) ( not ( = ?auto_582027 ?auto_582032 ) ) ( not ( = ?auto_582027 ?auto_582033 ) ) ( not ( = ?auto_582027 ?auto_582034 ) ) ( not ( = ?auto_582027 ?auto_582035 ) ) ( not ( = ?auto_582027 ?auto_582036 ) ) ( not ( = ?auto_582028 ?auto_582029 ) ) ( not ( = ?auto_582028 ?auto_582030 ) ) ( not ( = ?auto_582028 ?auto_582031 ) ) ( not ( = ?auto_582028 ?auto_582032 ) ) ( not ( = ?auto_582028 ?auto_582033 ) ) ( not ( = ?auto_582028 ?auto_582034 ) ) ( not ( = ?auto_582028 ?auto_582035 ) ) ( not ( = ?auto_582028 ?auto_582036 ) ) ( not ( = ?auto_582029 ?auto_582030 ) ) ( not ( = ?auto_582029 ?auto_582031 ) ) ( not ( = ?auto_582029 ?auto_582032 ) ) ( not ( = ?auto_582029 ?auto_582033 ) ) ( not ( = ?auto_582029 ?auto_582034 ) ) ( not ( = ?auto_582029 ?auto_582035 ) ) ( not ( = ?auto_582029 ?auto_582036 ) ) ( not ( = ?auto_582030 ?auto_582031 ) ) ( not ( = ?auto_582030 ?auto_582032 ) ) ( not ( = ?auto_582030 ?auto_582033 ) ) ( not ( = ?auto_582030 ?auto_582034 ) ) ( not ( = ?auto_582030 ?auto_582035 ) ) ( not ( = ?auto_582030 ?auto_582036 ) ) ( not ( = ?auto_582031 ?auto_582032 ) ) ( not ( = ?auto_582031 ?auto_582033 ) ) ( not ( = ?auto_582031 ?auto_582034 ) ) ( not ( = ?auto_582031 ?auto_582035 ) ) ( not ( = ?auto_582031 ?auto_582036 ) ) ( not ( = ?auto_582032 ?auto_582033 ) ) ( not ( = ?auto_582032 ?auto_582034 ) ) ( not ( = ?auto_582032 ?auto_582035 ) ) ( not ( = ?auto_582032 ?auto_582036 ) ) ( not ( = ?auto_582033 ?auto_582034 ) ) ( not ( = ?auto_582033 ?auto_582035 ) ) ( not ( = ?auto_582033 ?auto_582036 ) ) ( not ( = ?auto_582034 ?auto_582035 ) ) ( not ( = ?auto_582034 ?auto_582036 ) ) ( not ( = ?auto_582035 ?auto_582036 ) ) ( ON ?auto_582034 ?auto_582035 ) ( ON ?auto_582033 ?auto_582034 ) ( ON ?auto_582032 ?auto_582033 ) ( ON ?auto_582031 ?auto_582032 ) ( ON ?auto_582030 ?auto_582031 ) ( ON ?auto_582029 ?auto_582030 ) ( ON ?auto_582028 ?auto_582029 ) ( ON ?auto_582027 ?auto_582028 ) ( ON ?auto_582026 ?auto_582027 ) ( ON ?auto_582025 ?auto_582026 ) ( ON ?auto_582024 ?auto_582025 ) ( CLEAR ?auto_582022 ) ( ON ?auto_582023 ?auto_582024 ) ( CLEAR ?auto_582023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_582022 ?auto_582023 )
      ( MAKE-14PILE ?auto_582022 ?auto_582023 ?auto_582024 ?auto_582025 ?auto_582026 ?auto_582027 ?auto_582028 ?auto_582029 ?auto_582030 ?auto_582031 ?auto_582032 ?auto_582033 ?auto_582034 ?auto_582035 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_582080 - BLOCK
      ?auto_582081 - BLOCK
      ?auto_582082 - BLOCK
      ?auto_582083 - BLOCK
      ?auto_582084 - BLOCK
      ?auto_582085 - BLOCK
      ?auto_582086 - BLOCK
      ?auto_582087 - BLOCK
      ?auto_582088 - BLOCK
      ?auto_582089 - BLOCK
      ?auto_582090 - BLOCK
      ?auto_582091 - BLOCK
      ?auto_582092 - BLOCK
      ?auto_582093 - BLOCK
    )
    :vars
    (
      ?auto_582094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582093 ?auto_582094 ) ( not ( = ?auto_582080 ?auto_582081 ) ) ( not ( = ?auto_582080 ?auto_582082 ) ) ( not ( = ?auto_582080 ?auto_582083 ) ) ( not ( = ?auto_582080 ?auto_582084 ) ) ( not ( = ?auto_582080 ?auto_582085 ) ) ( not ( = ?auto_582080 ?auto_582086 ) ) ( not ( = ?auto_582080 ?auto_582087 ) ) ( not ( = ?auto_582080 ?auto_582088 ) ) ( not ( = ?auto_582080 ?auto_582089 ) ) ( not ( = ?auto_582080 ?auto_582090 ) ) ( not ( = ?auto_582080 ?auto_582091 ) ) ( not ( = ?auto_582080 ?auto_582092 ) ) ( not ( = ?auto_582080 ?auto_582093 ) ) ( not ( = ?auto_582080 ?auto_582094 ) ) ( not ( = ?auto_582081 ?auto_582082 ) ) ( not ( = ?auto_582081 ?auto_582083 ) ) ( not ( = ?auto_582081 ?auto_582084 ) ) ( not ( = ?auto_582081 ?auto_582085 ) ) ( not ( = ?auto_582081 ?auto_582086 ) ) ( not ( = ?auto_582081 ?auto_582087 ) ) ( not ( = ?auto_582081 ?auto_582088 ) ) ( not ( = ?auto_582081 ?auto_582089 ) ) ( not ( = ?auto_582081 ?auto_582090 ) ) ( not ( = ?auto_582081 ?auto_582091 ) ) ( not ( = ?auto_582081 ?auto_582092 ) ) ( not ( = ?auto_582081 ?auto_582093 ) ) ( not ( = ?auto_582081 ?auto_582094 ) ) ( not ( = ?auto_582082 ?auto_582083 ) ) ( not ( = ?auto_582082 ?auto_582084 ) ) ( not ( = ?auto_582082 ?auto_582085 ) ) ( not ( = ?auto_582082 ?auto_582086 ) ) ( not ( = ?auto_582082 ?auto_582087 ) ) ( not ( = ?auto_582082 ?auto_582088 ) ) ( not ( = ?auto_582082 ?auto_582089 ) ) ( not ( = ?auto_582082 ?auto_582090 ) ) ( not ( = ?auto_582082 ?auto_582091 ) ) ( not ( = ?auto_582082 ?auto_582092 ) ) ( not ( = ?auto_582082 ?auto_582093 ) ) ( not ( = ?auto_582082 ?auto_582094 ) ) ( not ( = ?auto_582083 ?auto_582084 ) ) ( not ( = ?auto_582083 ?auto_582085 ) ) ( not ( = ?auto_582083 ?auto_582086 ) ) ( not ( = ?auto_582083 ?auto_582087 ) ) ( not ( = ?auto_582083 ?auto_582088 ) ) ( not ( = ?auto_582083 ?auto_582089 ) ) ( not ( = ?auto_582083 ?auto_582090 ) ) ( not ( = ?auto_582083 ?auto_582091 ) ) ( not ( = ?auto_582083 ?auto_582092 ) ) ( not ( = ?auto_582083 ?auto_582093 ) ) ( not ( = ?auto_582083 ?auto_582094 ) ) ( not ( = ?auto_582084 ?auto_582085 ) ) ( not ( = ?auto_582084 ?auto_582086 ) ) ( not ( = ?auto_582084 ?auto_582087 ) ) ( not ( = ?auto_582084 ?auto_582088 ) ) ( not ( = ?auto_582084 ?auto_582089 ) ) ( not ( = ?auto_582084 ?auto_582090 ) ) ( not ( = ?auto_582084 ?auto_582091 ) ) ( not ( = ?auto_582084 ?auto_582092 ) ) ( not ( = ?auto_582084 ?auto_582093 ) ) ( not ( = ?auto_582084 ?auto_582094 ) ) ( not ( = ?auto_582085 ?auto_582086 ) ) ( not ( = ?auto_582085 ?auto_582087 ) ) ( not ( = ?auto_582085 ?auto_582088 ) ) ( not ( = ?auto_582085 ?auto_582089 ) ) ( not ( = ?auto_582085 ?auto_582090 ) ) ( not ( = ?auto_582085 ?auto_582091 ) ) ( not ( = ?auto_582085 ?auto_582092 ) ) ( not ( = ?auto_582085 ?auto_582093 ) ) ( not ( = ?auto_582085 ?auto_582094 ) ) ( not ( = ?auto_582086 ?auto_582087 ) ) ( not ( = ?auto_582086 ?auto_582088 ) ) ( not ( = ?auto_582086 ?auto_582089 ) ) ( not ( = ?auto_582086 ?auto_582090 ) ) ( not ( = ?auto_582086 ?auto_582091 ) ) ( not ( = ?auto_582086 ?auto_582092 ) ) ( not ( = ?auto_582086 ?auto_582093 ) ) ( not ( = ?auto_582086 ?auto_582094 ) ) ( not ( = ?auto_582087 ?auto_582088 ) ) ( not ( = ?auto_582087 ?auto_582089 ) ) ( not ( = ?auto_582087 ?auto_582090 ) ) ( not ( = ?auto_582087 ?auto_582091 ) ) ( not ( = ?auto_582087 ?auto_582092 ) ) ( not ( = ?auto_582087 ?auto_582093 ) ) ( not ( = ?auto_582087 ?auto_582094 ) ) ( not ( = ?auto_582088 ?auto_582089 ) ) ( not ( = ?auto_582088 ?auto_582090 ) ) ( not ( = ?auto_582088 ?auto_582091 ) ) ( not ( = ?auto_582088 ?auto_582092 ) ) ( not ( = ?auto_582088 ?auto_582093 ) ) ( not ( = ?auto_582088 ?auto_582094 ) ) ( not ( = ?auto_582089 ?auto_582090 ) ) ( not ( = ?auto_582089 ?auto_582091 ) ) ( not ( = ?auto_582089 ?auto_582092 ) ) ( not ( = ?auto_582089 ?auto_582093 ) ) ( not ( = ?auto_582089 ?auto_582094 ) ) ( not ( = ?auto_582090 ?auto_582091 ) ) ( not ( = ?auto_582090 ?auto_582092 ) ) ( not ( = ?auto_582090 ?auto_582093 ) ) ( not ( = ?auto_582090 ?auto_582094 ) ) ( not ( = ?auto_582091 ?auto_582092 ) ) ( not ( = ?auto_582091 ?auto_582093 ) ) ( not ( = ?auto_582091 ?auto_582094 ) ) ( not ( = ?auto_582092 ?auto_582093 ) ) ( not ( = ?auto_582092 ?auto_582094 ) ) ( not ( = ?auto_582093 ?auto_582094 ) ) ( ON ?auto_582092 ?auto_582093 ) ( ON ?auto_582091 ?auto_582092 ) ( ON ?auto_582090 ?auto_582091 ) ( ON ?auto_582089 ?auto_582090 ) ( ON ?auto_582088 ?auto_582089 ) ( ON ?auto_582087 ?auto_582088 ) ( ON ?auto_582086 ?auto_582087 ) ( ON ?auto_582085 ?auto_582086 ) ( ON ?auto_582084 ?auto_582085 ) ( ON ?auto_582083 ?auto_582084 ) ( ON ?auto_582082 ?auto_582083 ) ( ON ?auto_582081 ?auto_582082 ) ( ON ?auto_582080 ?auto_582081 ) ( CLEAR ?auto_582080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_582080 )
      ( MAKE-14PILE ?auto_582080 ?auto_582081 ?auto_582082 ?auto_582083 ?auto_582084 ?auto_582085 ?auto_582086 ?auto_582087 ?auto_582088 ?auto_582089 ?auto_582090 ?auto_582091 ?auto_582092 ?auto_582093 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582139 - BLOCK
      ?auto_582140 - BLOCK
      ?auto_582141 - BLOCK
      ?auto_582142 - BLOCK
      ?auto_582143 - BLOCK
      ?auto_582144 - BLOCK
      ?auto_582145 - BLOCK
      ?auto_582146 - BLOCK
      ?auto_582147 - BLOCK
      ?auto_582148 - BLOCK
      ?auto_582149 - BLOCK
      ?auto_582150 - BLOCK
      ?auto_582151 - BLOCK
      ?auto_582152 - BLOCK
      ?auto_582153 - BLOCK
    )
    :vars
    (
      ?auto_582154 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_582152 ) ( ON ?auto_582153 ?auto_582154 ) ( CLEAR ?auto_582153 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_582139 ) ( ON ?auto_582140 ?auto_582139 ) ( ON ?auto_582141 ?auto_582140 ) ( ON ?auto_582142 ?auto_582141 ) ( ON ?auto_582143 ?auto_582142 ) ( ON ?auto_582144 ?auto_582143 ) ( ON ?auto_582145 ?auto_582144 ) ( ON ?auto_582146 ?auto_582145 ) ( ON ?auto_582147 ?auto_582146 ) ( ON ?auto_582148 ?auto_582147 ) ( ON ?auto_582149 ?auto_582148 ) ( ON ?auto_582150 ?auto_582149 ) ( ON ?auto_582151 ?auto_582150 ) ( ON ?auto_582152 ?auto_582151 ) ( not ( = ?auto_582139 ?auto_582140 ) ) ( not ( = ?auto_582139 ?auto_582141 ) ) ( not ( = ?auto_582139 ?auto_582142 ) ) ( not ( = ?auto_582139 ?auto_582143 ) ) ( not ( = ?auto_582139 ?auto_582144 ) ) ( not ( = ?auto_582139 ?auto_582145 ) ) ( not ( = ?auto_582139 ?auto_582146 ) ) ( not ( = ?auto_582139 ?auto_582147 ) ) ( not ( = ?auto_582139 ?auto_582148 ) ) ( not ( = ?auto_582139 ?auto_582149 ) ) ( not ( = ?auto_582139 ?auto_582150 ) ) ( not ( = ?auto_582139 ?auto_582151 ) ) ( not ( = ?auto_582139 ?auto_582152 ) ) ( not ( = ?auto_582139 ?auto_582153 ) ) ( not ( = ?auto_582139 ?auto_582154 ) ) ( not ( = ?auto_582140 ?auto_582141 ) ) ( not ( = ?auto_582140 ?auto_582142 ) ) ( not ( = ?auto_582140 ?auto_582143 ) ) ( not ( = ?auto_582140 ?auto_582144 ) ) ( not ( = ?auto_582140 ?auto_582145 ) ) ( not ( = ?auto_582140 ?auto_582146 ) ) ( not ( = ?auto_582140 ?auto_582147 ) ) ( not ( = ?auto_582140 ?auto_582148 ) ) ( not ( = ?auto_582140 ?auto_582149 ) ) ( not ( = ?auto_582140 ?auto_582150 ) ) ( not ( = ?auto_582140 ?auto_582151 ) ) ( not ( = ?auto_582140 ?auto_582152 ) ) ( not ( = ?auto_582140 ?auto_582153 ) ) ( not ( = ?auto_582140 ?auto_582154 ) ) ( not ( = ?auto_582141 ?auto_582142 ) ) ( not ( = ?auto_582141 ?auto_582143 ) ) ( not ( = ?auto_582141 ?auto_582144 ) ) ( not ( = ?auto_582141 ?auto_582145 ) ) ( not ( = ?auto_582141 ?auto_582146 ) ) ( not ( = ?auto_582141 ?auto_582147 ) ) ( not ( = ?auto_582141 ?auto_582148 ) ) ( not ( = ?auto_582141 ?auto_582149 ) ) ( not ( = ?auto_582141 ?auto_582150 ) ) ( not ( = ?auto_582141 ?auto_582151 ) ) ( not ( = ?auto_582141 ?auto_582152 ) ) ( not ( = ?auto_582141 ?auto_582153 ) ) ( not ( = ?auto_582141 ?auto_582154 ) ) ( not ( = ?auto_582142 ?auto_582143 ) ) ( not ( = ?auto_582142 ?auto_582144 ) ) ( not ( = ?auto_582142 ?auto_582145 ) ) ( not ( = ?auto_582142 ?auto_582146 ) ) ( not ( = ?auto_582142 ?auto_582147 ) ) ( not ( = ?auto_582142 ?auto_582148 ) ) ( not ( = ?auto_582142 ?auto_582149 ) ) ( not ( = ?auto_582142 ?auto_582150 ) ) ( not ( = ?auto_582142 ?auto_582151 ) ) ( not ( = ?auto_582142 ?auto_582152 ) ) ( not ( = ?auto_582142 ?auto_582153 ) ) ( not ( = ?auto_582142 ?auto_582154 ) ) ( not ( = ?auto_582143 ?auto_582144 ) ) ( not ( = ?auto_582143 ?auto_582145 ) ) ( not ( = ?auto_582143 ?auto_582146 ) ) ( not ( = ?auto_582143 ?auto_582147 ) ) ( not ( = ?auto_582143 ?auto_582148 ) ) ( not ( = ?auto_582143 ?auto_582149 ) ) ( not ( = ?auto_582143 ?auto_582150 ) ) ( not ( = ?auto_582143 ?auto_582151 ) ) ( not ( = ?auto_582143 ?auto_582152 ) ) ( not ( = ?auto_582143 ?auto_582153 ) ) ( not ( = ?auto_582143 ?auto_582154 ) ) ( not ( = ?auto_582144 ?auto_582145 ) ) ( not ( = ?auto_582144 ?auto_582146 ) ) ( not ( = ?auto_582144 ?auto_582147 ) ) ( not ( = ?auto_582144 ?auto_582148 ) ) ( not ( = ?auto_582144 ?auto_582149 ) ) ( not ( = ?auto_582144 ?auto_582150 ) ) ( not ( = ?auto_582144 ?auto_582151 ) ) ( not ( = ?auto_582144 ?auto_582152 ) ) ( not ( = ?auto_582144 ?auto_582153 ) ) ( not ( = ?auto_582144 ?auto_582154 ) ) ( not ( = ?auto_582145 ?auto_582146 ) ) ( not ( = ?auto_582145 ?auto_582147 ) ) ( not ( = ?auto_582145 ?auto_582148 ) ) ( not ( = ?auto_582145 ?auto_582149 ) ) ( not ( = ?auto_582145 ?auto_582150 ) ) ( not ( = ?auto_582145 ?auto_582151 ) ) ( not ( = ?auto_582145 ?auto_582152 ) ) ( not ( = ?auto_582145 ?auto_582153 ) ) ( not ( = ?auto_582145 ?auto_582154 ) ) ( not ( = ?auto_582146 ?auto_582147 ) ) ( not ( = ?auto_582146 ?auto_582148 ) ) ( not ( = ?auto_582146 ?auto_582149 ) ) ( not ( = ?auto_582146 ?auto_582150 ) ) ( not ( = ?auto_582146 ?auto_582151 ) ) ( not ( = ?auto_582146 ?auto_582152 ) ) ( not ( = ?auto_582146 ?auto_582153 ) ) ( not ( = ?auto_582146 ?auto_582154 ) ) ( not ( = ?auto_582147 ?auto_582148 ) ) ( not ( = ?auto_582147 ?auto_582149 ) ) ( not ( = ?auto_582147 ?auto_582150 ) ) ( not ( = ?auto_582147 ?auto_582151 ) ) ( not ( = ?auto_582147 ?auto_582152 ) ) ( not ( = ?auto_582147 ?auto_582153 ) ) ( not ( = ?auto_582147 ?auto_582154 ) ) ( not ( = ?auto_582148 ?auto_582149 ) ) ( not ( = ?auto_582148 ?auto_582150 ) ) ( not ( = ?auto_582148 ?auto_582151 ) ) ( not ( = ?auto_582148 ?auto_582152 ) ) ( not ( = ?auto_582148 ?auto_582153 ) ) ( not ( = ?auto_582148 ?auto_582154 ) ) ( not ( = ?auto_582149 ?auto_582150 ) ) ( not ( = ?auto_582149 ?auto_582151 ) ) ( not ( = ?auto_582149 ?auto_582152 ) ) ( not ( = ?auto_582149 ?auto_582153 ) ) ( not ( = ?auto_582149 ?auto_582154 ) ) ( not ( = ?auto_582150 ?auto_582151 ) ) ( not ( = ?auto_582150 ?auto_582152 ) ) ( not ( = ?auto_582150 ?auto_582153 ) ) ( not ( = ?auto_582150 ?auto_582154 ) ) ( not ( = ?auto_582151 ?auto_582152 ) ) ( not ( = ?auto_582151 ?auto_582153 ) ) ( not ( = ?auto_582151 ?auto_582154 ) ) ( not ( = ?auto_582152 ?auto_582153 ) ) ( not ( = ?auto_582152 ?auto_582154 ) ) ( not ( = ?auto_582153 ?auto_582154 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_582153 ?auto_582154 )
      ( !STACK ?auto_582153 ?auto_582152 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582201 - BLOCK
      ?auto_582202 - BLOCK
      ?auto_582203 - BLOCK
      ?auto_582204 - BLOCK
      ?auto_582205 - BLOCK
      ?auto_582206 - BLOCK
      ?auto_582207 - BLOCK
      ?auto_582208 - BLOCK
      ?auto_582209 - BLOCK
      ?auto_582210 - BLOCK
      ?auto_582211 - BLOCK
      ?auto_582212 - BLOCK
      ?auto_582213 - BLOCK
      ?auto_582214 - BLOCK
      ?auto_582215 - BLOCK
    )
    :vars
    (
      ?auto_582216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582215 ?auto_582216 ) ( ON-TABLE ?auto_582201 ) ( ON ?auto_582202 ?auto_582201 ) ( ON ?auto_582203 ?auto_582202 ) ( ON ?auto_582204 ?auto_582203 ) ( ON ?auto_582205 ?auto_582204 ) ( ON ?auto_582206 ?auto_582205 ) ( ON ?auto_582207 ?auto_582206 ) ( ON ?auto_582208 ?auto_582207 ) ( ON ?auto_582209 ?auto_582208 ) ( ON ?auto_582210 ?auto_582209 ) ( ON ?auto_582211 ?auto_582210 ) ( ON ?auto_582212 ?auto_582211 ) ( ON ?auto_582213 ?auto_582212 ) ( not ( = ?auto_582201 ?auto_582202 ) ) ( not ( = ?auto_582201 ?auto_582203 ) ) ( not ( = ?auto_582201 ?auto_582204 ) ) ( not ( = ?auto_582201 ?auto_582205 ) ) ( not ( = ?auto_582201 ?auto_582206 ) ) ( not ( = ?auto_582201 ?auto_582207 ) ) ( not ( = ?auto_582201 ?auto_582208 ) ) ( not ( = ?auto_582201 ?auto_582209 ) ) ( not ( = ?auto_582201 ?auto_582210 ) ) ( not ( = ?auto_582201 ?auto_582211 ) ) ( not ( = ?auto_582201 ?auto_582212 ) ) ( not ( = ?auto_582201 ?auto_582213 ) ) ( not ( = ?auto_582201 ?auto_582214 ) ) ( not ( = ?auto_582201 ?auto_582215 ) ) ( not ( = ?auto_582201 ?auto_582216 ) ) ( not ( = ?auto_582202 ?auto_582203 ) ) ( not ( = ?auto_582202 ?auto_582204 ) ) ( not ( = ?auto_582202 ?auto_582205 ) ) ( not ( = ?auto_582202 ?auto_582206 ) ) ( not ( = ?auto_582202 ?auto_582207 ) ) ( not ( = ?auto_582202 ?auto_582208 ) ) ( not ( = ?auto_582202 ?auto_582209 ) ) ( not ( = ?auto_582202 ?auto_582210 ) ) ( not ( = ?auto_582202 ?auto_582211 ) ) ( not ( = ?auto_582202 ?auto_582212 ) ) ( not ( = ?auto_582202 ?auto_582213 ) ) ( not ( = ?auto_582202 ?auto_582214 ) ) ( not ( = ?auto_582202 ?auto_582215 ) ) ( not ( = ?auto_582202 ?auto_582216 ) ) ( not ( = ?auto_582203 ?auto_582204 ) ) ( not ( = ?auto_582203 ?auto_582205 ) ) ( not ( = ?auto_582203 ?auto_582206 ) ) ( not ( = ?auto_582203 ?auto_582207 ) ) ( not ( = ?auto_582203 ?auto_582208 ) ) ( not ( = ?auto_582203 ?auto_582209 ) ) ( not ( = ?auto_582203 ?auto_582210 ) ) ( not ( = ?auto_582203 ?auto_582211 ) ) ( not ( = ?auto_582203 ?auto_582212 ) ) ( not ( = ?auto_582203 ?auto_582213 ) ) ( not ( = ?auto_582203 ?auto_582214 ) ) ( not ( = ?auto_582203 ?auto_582215 ) ) ( not ( = ?auto_582203 ?auto_582216 ) ) ( not ( = ?auto_582204 ?auto_582205 ) ) ( not ( = ?auto_582204 ?auto_582206 ) ) ( not ( = ?auto_582204 ?auto_582207 ) ) ( not ( = ?auto_582204 ?auto_582208 ) ) ( not ( = ?auto_582204 ?auto_582209 ) ) ( not ( = ?auto_582204 ?auto_582210 ) ) ( not ( = ?auto_582204 ?auto_582211 ) ) ( not ( = ?auto_582204 ?auto_582212 ) ) ( not ( = ?auto_582204 ?auto_582213 ) ) ( not ( = ?auto_582204 ?auto_582214 ) ) ( not ( = ?auto_582204 ?auto_582215 ) ) ( not ( = ?auto_582204 ?auto_582216 ) ) ( not ( = ?auto_582205 ?auto_582206 ) ) ( not ( = ?auto_582205 ?auto_582207 ) ) ( not ( = ?auto_582205 ?auto_582208 ) ) ( not ( = ?auto_582205 ?auto_582209 ) ) ( not ( = ?auto_582205 ?auto_582210 ) ) ( not ( = ?auto_582205 ?auto_582211 ) ) ( not ( = ?auto_582205 ?auto_582212 ) ) ( not ( = ?auto_582205 ?auto_582213 ) ) ( not ( = ?auto_582205 ?auto_582214 ) ) ( not ( = ?auto_582205 ?auto_582215 ) ) ( not ( = ?auto_582205 ?auto_582216 ) ) ( not ( = ?auto_582206 ?auto_582207 ) ) ( not ( = ?auto_582206 ?auto_582208 ) ) ( not ( = ?auto_582206 ?auto_582209 ) ) ( not ( = ?auto_582206 ?auto_582210 ) ) ( not ( = ?auto_582206 ?auto_582211 ) ) ( not ( = ?auto_582206 ?auto_582212 ) ) ( not ( = ?auto_582206 ?auto_582213 ) ) ( not ( = ?auto_582206 ?auto_582214 ) ) ( not ( = ?auto_582206 ?auto_582215 ) ) ( not ( = ?auto_582206 ?auto_582216 ) ) ( not ( = ?auto_582207 ?auto_582208 ) ) ( not ( = ?auto_582207 ?auto_582209 ) ) ( not ( = ?auto_582207 ?auto_582210 ) ) ( not ( = ?auto_582207 ?auto_582211 ) ) ( not ( = ?auto_582207 ?auto_582212 ) ) ( not ( = ?auto_582207 ?auto_582213 ) ) ( not ( = ?auto_582207 ?auto_582214 ) ) ( not ( = ?auto_582207 ?auto_582215 ) ) ( not ( = ?auto_582207 ?auto_582216 ) ) ( not ( = ?auto_582208 ?auto_582209 ) ) ( not ( = ?auto_582208 ?auto_582210 ) ) ( not ( = ?auto_582208 ?auto_582211 ) ) ( not ( = ?auto_582208 ?auto_582212 ) ) ( not ( = ?auto_582208 ?auto_582213 ) ) ( not ( = ?auto_582208 ?auto_582214 ) ) ( not ( = ?auto_582208 ?auto_582215 ) ) ( not ( = ?auto_582208 ?auto_582216 ) ) ( not ( = ?auto_582209 ?auto_582210 ) ) ( not ( = ?auto_582209 ?auto_582211 ) ) ( not ( = ?auto_582209 ?auto_582212 ) ) ( not ( = ?auto_582209 ?auto_582213 ) ) ( not ( = ?auto_582209 ?auto_582214 ) ) ( not ( = ?auto_582209 ?auto_582215 ) ) ( not ( = ?auto_582209 ?auto_582216 ) ) ( not ( = ?auto_582210 ?auto_582211 ) ) ( not ( = ?auto_582210 ?auto_582212 ) ) ( not ( = ?auto_582210 ?auto_582213 ) ) ( not ( = ?auto_582210 ?auto_582214 ) ) ( not ( = ?auto_582210 ?auto_582215 ) ) ( not ( = ?auto_582210 ?auto_582216 ) ) ( not ( = ?auto_582211 ?auto_582212 ) ) ( not ( = ?auto_582211 ?auto_582213 ) ) ( not ( = ?auto_582211 ?auto_582214 ) ) ( not ( = ?auto_582211 ?auto_582215 ) ) ( not ( = ?auto_582211 ?auto_582216 ) ) ( not ( = ?auto_582212 ?auto_582213 ) ) ( not ( = ?auto_582212 ?auto_582214 ) ) ( not ( = ?auto_582212 ?auto_582215 ) ) ( not ( = ?auto_582212 ?auto_582216 ) ) ( not ( = ?auto_582213 ?auto_582214 ) ) ( not ( = ?auto_582213 ?auto_582215 ) ) ( not ( = ?auto_582213 ?auto_582216 ) ) ( not ( = ?auto_582214 ?auto_582215 ) ) ( not ( = ?auto_582214 ?auto_582216 ) ) ( not ( = ?auto_582215 ?auto_582216 ) ) ( CLEAR ?auto_582213 ) ( ON ?auto_582214 ?auto_582215 ) ( CLEAR ?auto_582214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_582201 ?auto_582202 ?auto_582203 ?auto_582204 ?auto_582205 ?auto_582206 ?auto_582207 ?auto_582208 ?auto_582209 ?auto_582210 ?auto_582211 ?auto_582212 ?auto_582213 ?auto_582214 )
      ( MAKE-15PILE ?auto_582201 ?auto_582202 ?auto_582203 ?auto_582204 ?auto_582205 ?auto_582206 ?auto_582207 ?auto_582208 ?auto_582209 ?auto_582210 ?auto_582211 ?auto_582212 ?auto_582213 ?auto_582214 ?auto_582215 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582263 - BLOCK
      ?auto_582264 - BLOCK
      ?auto_582265 - BLOCK
      ?auto_582266 - BLOCK
      ?auto_582267 - BLOCK
      ?auto_582268 - BLOCK
      ?auto_582269 - BLOCK
      ?auto_582270 - BLOCK
      ?auto_582271 - BLOCK
      ?auto_582272 - BLOCK
      ?auto_582273 - BLOCK
      ?auto_582274 - BLOCK
      ?auto_582275 - BLOCK
      ?auto_582276 - BLOCK
      ?auto_582277 - BLOCK
    )
    :vars
    (
      ?auto_582278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582277 ?auto_582278 ) ( ON-TABLE ?auto_582263 ) ( ON ?auto_582264 ?auto_582263 ) ( ON ?auto_582265 ?auto_582264 ) ( ON ?auto_582266 ?auto_582265 ) ( ON ?auto_582267 ?auto_582266 ) ( ON ?auto_582268 ?auto_582267 ) ( ON ?auto_582269 ?auto_582268 ) ( ON ?auto_582270 ?auto_582269 ) ( ON ?auto_582271 ?auto_582270 ) ( ON ?auto_582272 ?auto_582271 ) ( ON ?auto_582273 ?auto_582272 ) ( ON ?auto_582274 ?auto_582273 ) ( not ( = ?auto_582263 ?auto_582264 ) ) ( not ( = ?auto_582263 ?auto_582265 ) ) ( not ( = ?auto_582263 ?auto_582266 ) ) ( not ( = ?auto_582263 ?auto_582267 ) ) ( not ( = ?auto_582263 ?auto_582268 ) ) ( not ( = ?auto_582263 ?auto_582269 ) ) ( not ( = ?auto_582263 ?auto_582270 ) ) ( not ( = ?auto_582263 ?auto_582271 ) ) ( not ( = ?auto_582263 ?auto_582272 ) ) ( not ( = ?auto_582263 ?auto_582273 ) ) ( not ( = ?auto_582263 ?auto_582274 ) ) ( not ( = ?auto_582263 ?auto_582275 ) ) ( not ( = ?auto_582263 ?auto_582276 ) ) ( not ( = ?auto_582263 ?auto_582277 ) ) ( not ( = ?auto_582263 ?auto_582278 ) ) ( not ( = ?auto_582264 ?auto_582265 ) ) ( not ( = ?auto_582264 ?auto_582266 ) ) ( not ( = ?auto_582264 ?auto_582267 ) ) ( not ( = ?auto_582264 ?auto_582268 ) ) ( not ( = ?auto_582264 ?auto_582269 ) ) ( not ( = ?auto_582264 ?auto_582270 ) ) ( not ( = ?auto_582264 ?auto_582271 ) ) ( not ( = ?auto_582264 ?auto_582272 ) ) ( not ( = ?auto_582264 ?auto_582273 ) ) ( not ( = ?auto_582264 ?auto_582274 ) ) ( not ( = ?auto_582264 ?auto_582275 ) ) ( not ( = ?auto_582264 ?auto_582276 ) ) ( not ( = ?auto_582264 ?auto_582277 ) ) ( not ( = ?auto_582264 ?auto_582278 ) ) ( not ( = ?auto_582265 ?auto_582266 ) ) ( not ( = ?auto_582265 ?auto_582267 ) ) ( not ( = ?auto_582265 ?auto_582268 ) ) ( not ( = ?auto_582265 ?auto_582269 ) ) ( not ( = ?auto_582265 ?auto_582270 ) ) ( not ( = ?auto_582265 ?auto_582271 ) ) ( not ( = ?auto_582265 ?auto_582272 ) ) ( not ( = ?auto_582265 ?auto_582273 ) ) ( not ( = ?auto_582265 ?auto_582274 ) ) ( not ( = ?auto_582265 ?auto_582275 ) ) ( not ( = ?auto_582265 ?auto_582276 ) ) ( not ( = ?auto_582265 ?auto_582277 ) ) ( not ( = ?auto_582265 ?auto_582278 ) ) ( not ( = ?auto_582266 ?auto_582267 ) ) ( not ( = ?auto_582266 ?auto_582268 ) ) ( not ( = ?auto_582266 ?auto_582269 ) ) ( not ( = ?auto_582266 ?auto_582270 ) ) ( not ( = ?auto_582266 ?auto_582271 ) ) ( not ( = ?auto_582266 ?auto_582272 ) ) ( not ( = ?auto_582266 ?auto_582273 ) ) ( not ( = ?auto_582266 ?auto_582274 ) ) ( not ( = ?auto_582266 ?auto_582275 ) ) ( not ( = ?auto_582266 ?auto_582276 ) ) ( not ( = ?auto_582266 ?auto_582277 ) ) ( not ( = ?auto_582266 ?auto_582278 ) ) ( not ( = ?auto_582267 ?auto_582268 ) ) ( not ( = ?auto_582267 ?auto_582269 ) ) ( not ( = ?auto_582267 ?auto_582270 ) ) ( not ( = ?auto_582267 ?auto_582271 ) ) ( not ( = ?auto_582267 ?auto_582272 ) ) ( not ( = ?auto_582267 ?auto_582273 ) ) ( not ( = ?auto_582267 ?auto_582274 ) ) ( not ( = ?auto_582267 ?auto_582275 ) ) ( not ( = ?auto_582267 ?auto_582276 ) ) ( not ( = ?auto_582267 ?auto_582277 ) ) ( not ( = ?auto_582267 ?auto_582278 ) ) ( not ( = ?auto_582268 ?auto_582269 ) ) ( not ( = ?auto_582268 ?auto_582270 ) ) ( not ( = ?auto_582268 ?auto_582271 ) ) ( not ( = ?auto_582268 ?auto_582272 ) ) ( not ( = ?auto_582268 ?auto_582273 ) ) ( not ( = ?auto_582268 ?auto_582274 ) ) ( not ( = ?auto_582268 ?auto_582275 ) ) ( not ( = ?auto_582268 ?auto_582276 ) ) ( not ( = ?auto_582268 ?auto_582277 ) ) ( not ( = ?auto_582268 ?auto_582278 ) ) ( not ( = ?auto_582269 ?auto_582270 ) ) ( not ( = ?auto_582269 ?auto_582271 ) ) ( not ( = ?auto_582269 ?auto_582272 ) ) ( not ( = ?auto_582269 ?auto_582273 ) ) ( not ( = ?auto_582269 ?auto_582274 ) ) ( not ( = ?auto_582269 ?auto_582275 ) ) ( not ( = ?auto_582269 ?auto_582276 ) ) ( not ( = ?auto_582269 ?auto_582277 ) ) ( not ( = ?auto_582269 ?auto_582278 ) ) ( not ( = ?auto_582270 ?auto_582271 ) ) ( not ( = ?auto_582270 ?auto_582272 ) ) ( not ( = ?auto_582270 ?auto_582273 ) ) ( not ( = ?auto_582270 ?auto_582274 ) ) ( not ( = ?auto_582270 ?auto_582275 ) ) ( not ( = ?auto_582270 ?auto_582276 ) ) ( not ( = ?auto_582270 ?auto_582277 ) ) ( not ( = ?auto_582270 ?auto_582278 ) ) ( not ( = ?auto_582271 ?auto_582272 ) ) ( not ( = ?auto_582271 ?auto_582273 ) ) ( not ( = ?auto_582271 ?auto_582274 ) ) ( not ( = ?auto_582271 ?auto_582275 ) ) ( not ( = ?auto_582271 ?auto_582276 ) ) ( not ( = ?auto_582271 ?auto_582277 ) ) ( not ( = ?auto_582271 ?auto_582278 ) ) ( not ( = ?auto_582272 ?auto_582273 ) ) ( not ( = ?auto_582272 ?auto_582274 ) ) ( not ( = ?auto_582272 ?auto_582275 ) ) ( not ( = ?auto_582272 ?auto_582276 ) ) ( not ( = ?auto_582272 ?auto_582277 ) ) ( not ( = ?auto_582272 ?auto_582278 ) ) ( not ( = ?auto_582273 ?auto_582274 ) ) ( not ( = ?auto_582273 ?auto_582275 ) ) ( not ( = ?auto_582273 ?auto_582276 ) ) ( not ( = ?auto_582273 ?auto_582277 ) ) ( not ( = ?auto_582273 ?auto_582278 ) ) ( not ( = ?auto_582274 ?auto_582275 ) ) ( not ( = ?auto_582274 ?auto_582276 ) ) ( not ( = ?auto_582274 ?auto_582277 ) ) ( not ( = ?auto_582274 ?auto_582278 ) ) ( not ( = ?auto_582275 ?auto_582276 ) ) ( not ( = ?auto_582275 ?auto_582277 ) ) ( not ( = ?auto_582275 ?auto_582278 ) ) ( not ( = ?auto_582276 ?auto_582277 ) ) ( not ( = ?auto_582276 ?auto_582278 ) ) ( not ( = ?auto_582277 ?auto_582278 ) ) ( ON ?auto_582276 ?auto_582277 ) ( CLEAR ?auto_582274 ) ( ON ?auto_582275 ?auto_582276 ) ( CLEAR ?auto_582275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_582263 ?auto_582264 ?auto_582265 ?auto_582266 ?auto_582267 ?auto_582268 ?auto_582269 ?auto_582270 ?auto_582271 ?auto_582272 ?auto_582273 ?auto_582274 ?auto_582275 )
      ( MAKE-15PILE ?auto_582263 ?auto_582264 ?auto_582265 ?auto_582266 ?auto_582267 ?auto_582268 ?auto_582269 ?auto_582270 ?auto_582271 ?auto_582272 ?auto_582273 ?auto_582274 ?auto_582275 ?auto_582276 ?auto_582277 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582325 - BLOCK
      ?auto_582326 - BLOCK
      ?auto_582327 - BLOCK
      ?auto_582328 - BLOCK
      ?auto_582329 - BLOCK
      ?auto_582330 - BLOCK
      ?auto_582331 - BLOCK
      ?auto_582332 - BLOCK
      ?auto_582333 - BLOCK
      ?auto_582334 - BLOCK
      ?auto_582335 - BLOCK
      ?auto_582336 - BLOCK
      ?auto_582337 - BLOCK
      ?auto_582338 - BLOCK
      ?auto_582339 - BLOCK
    )
    :vars
    (
      ?auto_582340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582339 ?auto_582340 ) ( ON-TABLE ?auto_582325 ) ( ON ?auto_582326 ?auto_582325 ) ( ON ?auto_582327 ?auto_582326 ) ( ON ?auto_582328 ?auto_582327 ) ( ON ?auto_582329 ?auto_582328 ) ( ON ?auto_582330 ?auto_582329 ) ( ON ?auto_582331 ?auto_582330 ) ( ON ?auto_582332 ?auto_582331 ) ( ON ?auto_582333 ?auto_582332 ) ( ON ?auto_582334 ?auto_582333 ) ( ON ?auto_582335 ?auto_582334 ) ( not ( = ?auto_582325 ?auto_582326 ) ) ( not ( = ?auto_582325 ?auto_582327 ) ) ( not ( = ?auto_582325 ?auto_582328 ) ) ( not ( = ?auto_582325 ?auto_582329 ) ) ( not ( = ?auto_582325 ?auto_582330 ) ) ( not ( = ?auto_582325 ?auto_582331 ) ) ( not ( = ?auto_582325 ?auto_582332 ) ) ( not ( = ?auto_582325 ?auto_582333 ) ) ( not ( = ?auto_582325 ?auto_582334 ) ) ( not ( = ?auto_582325 ?auto_582335 ) ) ( not ( = ?auto_582325 ?auto_582336 ) ) ( not ( = ?auto_582325 ?auto_582337 ) ) ( not ( = ?auto_582325 ?auto_582338 ) ) ( not ( = ?auto_582325 ?auto_582339 ) ) ( not ( = ?auto_582325 ?auto_582340 ) ) ( not ( = ?auto_582326 ?auto_582327 ) ) ( not ( = ?auto_582326 ?auto_582328 ) ) ( not ( = ?auto_582326 ?auto_582329 ) ) ( not ( = ?auto_582326 ?auto_582330 ) ) ( not ( = ?auto_582326 ?auto_582331 ) ) ( not ( = ?auto_582326 ?auto_582332 ) ) ( not ( = ?auto_582326 ?auto_582333 ) ) ( not ( = ?auto_582326 ?auto_582334 ) ) ( not ( = ?auto_582326 ?auto_582335 ) ) ( not ( = ?auto_582326 ?auto_582336 ) ) ( not ( = ?auto_582326 ?auto_582337 ) ) ( not ( = ?auto_582326 ?auto_582338 ) ) ( not ( = ?auto_582326 ?auto_582339 ) ) ( not ( = ?auto_582326 ?auto_582340 ) ) ( not ( = ?auto_582327 ?auto_582328 ) ) ( not ( = ?auto_582327 ?auto_582329 ) ) ( not ( = ?auto_582327 ?auto_582330 ) ) ( not ( = ?auto_582327 ?auto_582331 ) ) ( not ( = ?auto_582327 ?auto_582332 ) ) ( not ( = ?auto_582327 ?auto_582333 ) ) ( not ( = ?auto_582327 ?auto_582334 ) ) ( not ( = ?auto_582327 ?auto_582335 ) ) ( not ( = ?auto_582327 ?auto_582336 ) ) ( not ( = ?auto_582327 ?auto_582337 ) ) ( not ( = ?auto_582327 ?auto_582338 ) ) ( not ( = ?auto_582327 ?auto_582339 ) ) ( not ( = ?auto_582327 ?auto_582340 ) ) ( not ( = ?auto_582328 ?auto_582329 ) ) ( not ( = ?auto_582328 ?auto_582330 ) ) ( not ( = ?auto_582328 ?auto_582331 ) ) ( not ( = ?auto_582328 ?auto_582332 ) ) ( not ( = ?auto_582328 ?auto_582333 ) ) ( not ( = ?auto_582328 ?auto_582334 ) ) ( not ( = ?auto_582328 ?auto_582335 ) ) ( not ( = ?auto_582328 ?auto_582336 ) ) ( not ( = ?auto_582328 ?auto_582337 ) ) ( not ( = ?auto_582328 ?auto_582338 ) ) ( not ( = ?auto_582328 ?auto_582339 ) ) ( not ( = ?auto_582328 ?auto_582340 ) ) ( not ( = ?auto_582329 ?auto_582330 ) ) ( not ( = ?auto_582329 ?auto_582331 ) ) ( not ( = ?auto_582329 ?auto_582332 ) ) ( not ( = ?auto_582329 ?auto_582333 ) ) ( not ( = ?auto_582329 ?auto_582334 ) ) ( not ( = ?auto_582329 ?auto_582335 ) ) ( not ( = ?auto_582329 ?auto_582336 ) ) ( not ( = ?auto_582329 ?auto_582337 ) ) ( not ( = ?auto_582329 ?auto_582338 ) ) ( not ( = ?auto_582329 ?auto_582339 ) ) ( not ( = ?auto_582329 ?auto_582340 ) ) ( not ( = ?auto_582330 ?auto_582331 ) ) ( not ( = ?auto_582330 ?auto_582332 ) ) ( not ( = ?auto_582330 ?auto_582333 ) ) ( not ( = ?auto_582330 ?auto_582334 ) ) ( not ( = ?auto_582330 ?auto_582335 ) ) ( not ( = ?auto_582330 ?auto_582336 ) ) ( not ( = ?auto_582330 ?auto_582337 ) ) ( not ( = ?auto_582330 ?auto_582338 ) ) ( not ( = ?auto_582330 ?auto_582339 ) ) ( not ( = ?auto_582330 ?auto_582340 ) ) ( not ( = ?auto_582331 ?auto_582332 ) ) ( not ( = ?auto_582331 ?auto_582333 ) ) ( not ( = ?auto_582331 ?auto_582334 ) ) ( not ( = ?auto_582331 ?auto_582335 ) ) ( not ( = ?auto_582331 ?auto_582336 ) ) ( not ( = ?auto_582331 ?auto_582337 ) ) ( not ( = ?auto_582331 ?auto_582338 ) ) ( not ( = ?auto_582331 ?auto_582339 ) ) ( not ( = ?auto_582331 ?auto_582340 ) ) ( not ( = ?auto_582332 ?auto_582333 ) ) ( not ( = ?auto_582332 ?auto_582334 ) ) ( not ( = ?auto_582332 ?auto_582335 ) ) ( not ( = ?auto_582332 ?auto_582336 ) ) ( not ( = ?auto_582332 ?auto_582337 ) ) ( not ( = ?auto_582332 ?auto_582338 ) ) ( not ( = ?auto_582332 ?auto_582339 ) ) ( not ( = ?auto_582332 ?auto_582340 ) ) ( not ( = ?auto_582333 ?auto_582334 ) ) ( not ( = ?auto_582333 ?auto_582335 ) ) ( not ( = ?auto_582333 ?auto_582336 ) ) ( not ( = ?auto_582333 ?auto_582337 ) ) ( not ( = ?auto_582333 ?auto_582338 ) ) ( not ( = ?auto_582333 ?auto_582339 ) ) ( not ( = ?auto_582333 ?auto_582340 ) ) ( not ( = ?auto_582334 ?auto_582335 ) ) ( not ( = ?auto_582334 ?auto_582336 ) ) ( not ( = ?auto_582334 ?auto_582337 ) ) ( not ( = ?auto_582334 ?auto_582338 ) ) ( not ( = ?auto_582334 ?auto_582339 ) ) ( not ( = ?auto_582334 ?auto_582340 ) ) ( not ( = ?auto_582335 ?auto_582336 ) ) ( not ( = ?auto_582335 ?auto_582337 ) ) ( not ( = ?auto_582335 ?auto_582338 ) ) ( not ( = ?auto_582335 ?auto_582339 ) ) ( not ( = ?auto_582335 ?auto_582340 ) ) ( not ( = ?auto_582336 ?auto_582337 ) ) ( not ( = ?auto_582336 ?auto_582338 ) ) ( not ( = ?auto_582336 ?auto_582339 ) ) ( not ( = ?auto_582336 ?auto_582340 ) ) ( not ( = ?auto_582337 ?auto_582338 ) ) ( not ( = ?auto_582337 ?auto_582339 ) ) ( not ( = ?auto_582337 ?auto_582340 ) ) ( not ( = ?auto_582338 ?auto_582339 ) ) ( not ( = ?auto_582338 ?auto_582340 ) ) ( not ( = ?auto_582339 ?auto_582340 ) ) ( ON ?auto_582338 ?auto_582339 ) ( ON ?auto_582337 ?auto_582338 ) ( CLEAR ?auto_582335 ) ( ON ?auto_582336 ?auto_582337 ) ( CLEAR ?auto_582336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_582325 ?auto_582326 ?auto_582327 ?auto_582328 ?auto_582329 ?auto_582330 ?auto_582331 ?auto_582332 ?auto_582333 ?auto_582334 ?auto_582335 ?auto_582336 )
      ( MAKE-15PILE ?auto_582325 ?auto_582326 ?auto_582327 ?auto_582328 ?auto_582329 ?auto_582330 ?auto_582331 ?auto_582332 ?auto_582333 ?auto_582334 ?auto_582335 ?auto_582336 ?auto_582337 ?auto_582338 ?auto_582339 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582387 - BLOCK
      ?auto_582388 - BLOCK
      ?auto_582389 - BLOCK
      ?auto_582390 - BLOCK
      ?auto_582391 - BLOCK
      ?auto_582392 - BLOCK
      ?auto_582393 - BLOCK
      ?auto_582394 - BLOCK
      ?auto_582395 - BLOCK
      ?auto_582396 - BLOCK
      ?auto_582397 - BLOCK
      ?auto_582398 - BLOCK
      ?auto_582399 - BLOCK
      ?auto_582400 - BLOCK
      ?auto_582401 - BLOCK
    )
    :vars
    (
      ?auto_582402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582401 ?auto_582402 ) ( ON-TABLE ?auto_582387 ) ( ON ?auto_582388 ?auto_582387 ) ( ON ?auto_582389 ?auto_582388 ) ( ON ?auto_582390 ?auto_582389 ) ( ON ?auto_582391 ?auto_582390 ) ( ON ?auto_582392 ?auto_582391 ) ( ON ?auto_582393 ?auto_582392 ) ( ON ?auto_582394 ?auto_582393 ) ( ON ?auto_582395 ?auto_582394 ) ( ON ?auto_582396 ?auto_582395 ) ( not ( = ?auto_582387 ?auto_582388 ) ) ( not ( = ?auto_582387 ?auto_582389 ) ) ( not ( = ?auto_582387 ?auto_582390 ) ) ( not ( = ?auto_582387 ?auto_582391 ) ) ( not ( = ?auto_582387 ?auto_582392 ) ) ( not ( = ?auto_582387 ?auto_582393 ) ) ( not ( = ?auto_582387 ?auto_582394 ) ) ( not ( = ?auto_582387 ?auto_582395 ) ) ( not ( = ?auto_582387 ?auto_582396 ) ) ( not ( = ?auto_582387 ?auto_582397 ) ) ( not ( = ?auto_582387 ?auto_582398 ) ) ( not ( = ?auto_582387 ?auto_582399 ) ) ( not ( = ?auto_582387 ?auto_582400 ) ) ( not ( = ?auto_582387 ?auto_582401 ) ) ( not ( = ?auto_582387 ?auto_582402 ) ) ( not ( = ?auto_582388 ?auto_582389 ) ) ( not ( = ?auto_582388 ?auto_582390 ) ) ( not ( = ?auto_582388 ?auto_582391 ) ) ( not ( = ?auto_582388 ?auto_582392 ) ) ( not ( = ?auto_582388 ?auto_582393 ) ) ( not ( = ?auto_582388 ?auto_582394 ) ) ( not ( = ?auto_582388 ?auto_582395 ) ) ( not ( = ?auto_582388 ?auto_582396 ) ) ( not ( = ?auto_582388 ?auto_582397 ) ) ( not ( = ?auto_582388 ?auto_582398 ) ) ( not ( = ?auto_582388 ?auto_582399 ) ) ( not ( = ?auto_582388 ?auto_582400 ) ) ( not ( = ?auto_582388 ?auto_582401 ) ) ( not ( = ?auto_582388 ?auto_582402 ) ) ( not ( = ?auto_582389 ?auto_582390 ) ) ( not ( = ?auto_582389 ?auto_582391 ) ) ( not ( = ?auto_582389 ?auto_582392 ) ) ( not ( = ?auto_582389 ?auto_582393 ) ) ( not ( = ?auto_582389 ?auto_582394 ) ) ( not ( = ?auto_582389 ?auto_582395 ) ) ( not ( = ?auto_582389 ?auto_582396 ) ) ( not ( = ?auto_582389 ?auto_582397 ) ) ( not ( = ?auto_582389 ?auto_582398 ) ) ( not ( = ?auto_582389 ?auto_582399 ) ) ( not ( = ?auto_582389 ?auto_582400 ) ) ( not ( = ?auto_582389 ?auto_582401 ) ) ( not ( = ?auto_582389 ?auto_582402 ) ) ( not ( = ?auto_582390 ?auto_582391 ) ) ( not ( = ?auto_582390 ?auto_582392 ) ) ( not ( = ?auto_582390 ?auto_582393 ) ) ( not ( = ?auto_582390 ?auto_582394 ) ) ( not ( = ?auto_582390 ?auto_582395 ) ) ( not ( = ?auto_582390 ?auto_582396 ) ) ( not ( = ?auto_582390 ?auto_582397 ) ) ( not ( = ?auto_582390 ?auto_582398 ) ) ( not ( = ?auto_582390 ?auto_582399 ) ) ( not ( = ?auto_582390 ?auto_582400 ) ) ( not ( = ?auto_582390 ?auto_582401 ) ) ( not ( = ?auto_582390 ?auto_582402 ) ) ( not ( = ?auto_582391 ?auto_582392 ) ) ( not ( = ?auto_582391 ?auto_582393 ) ) ( not ( = ?auto_582391 ?auto_582394 ) ) ( not ( = ?auto_582391 ?auto_582395 ) ) ( not ( = ?auto_582391 ?auto_582396 ) ) ( not ( = ?auto_582391 ?auto_582397 ) ) ( not ( = ?auto_582391 ?auto_582398 ) ) ( not ( = ?auto_582391 ?auto_582399 ) ) ( not ( = ?auto_582391 ?auto_582400 ) ) ( not ( = ?auto_582391 ?auto_582401 ) ) ( not ( = ?auto_582391 ?auto_582402 ) ) ( not ( = ?auto_582392 ?auto_582393 ) ) ( not ( = ?auto_582392 ?auto_582394 ) ) ( not ( = ?auto_582392 ?auto_582395 ) ) ( not ( = ?auto_582392 ?auto_582396 ) ) ( not ( = ?auto_582392 ?auto_582397 ) ) ( not ( = ?auto_582392 ?auto_582398 ) ) ( not ( = ?auto_582392 ?auto_582399 ) ) ( not ( = ?auto_582392 ?auto_582400 ) ) ( not ( = ?auto_582392 ?auto_582401 ) ) ( not ( = ?auto_582392 ?auto_582402 ) ) ( not ( = ?auto_582393 ?auto_582394 ) ) ( not ( = ?auto_582393 ?auto_582395 ) ) ( not ( = ?auto_582393 ?auto_582396 ) ) ( not ( = ?auto_582393 ?auto_582397 ) ) ( not ( = ?auto_582393 ?auto_582398 ) ) ( not ( = ?auto_582393 ?auto_582399 ) ) ( not ( = ?auto_582393 ?auto_582400 ) ) ( not ( = ?auto_582393 ?auto_582401 ) ) ( not ( = ?auto_582393 ?auto_582402 ) ) ( not ( = ?auto_582394 ?auto_582395 ) ) ( not ( = ?auto_582394 ?auto_582396 ) ) ( not ( = ?auto_582394 ?auto_582397 ) ) ( not ( = ?auto_582394 ?auto_582398 ) ) ( not ( = ?auto_582394 ?auto_582399 ) ) ( not ( = ?auto_582394 ?auto_582400 ) ) ( not ( = ?auto_582394 ?auto_582401 ) ) ( not ( = ?auto_582394 ?auto_582402 ) ) ( not ( = ?auto_582395 ?auto_582396 ) ) ( not ( = ?auto_582395 ?auto_582397 ) ) ( not ( = ?auto_582395 ?auto_582398 ) ) ( not ( = ?auto_582395 ?auto_582399 ) ) ( not ( = ?auto_582395 ?auto_582400 ) ) ( not ( = ?auto_582395 ?auto_582401 ) ) ( not ( = ?auto_582395 ?auto_582402 ) ) ( not ( = ?auto_582396 ?auto_582397 ) ) ( not ( = ?auto_582396 ?auto_582398 ) ) ( not ( = ?auto_582396 ?auto_582399 ) ) ( not ( = ?auto_582396 ?auto_582400 ) ) ( not ( = ?auto_582396 ?auto_582401 ) ) ( not ( = ?auto_582396 ?auto_582402 ) ) ( not ( = ?auto_582397 ?auto_582398 ) ) ( not ( = ?auto_582397 ?auto_582399 ) ) ( not ( = ?auto_582397 ?auto_582400 ) ) ( not ( = ?auto_582397 ?auto_582401 ) ) ( not ( = ?auto_582397 ?auto_582402 ) ) ( not ( = ?auto_582398 ?auto_582399 ) ) ( not ( = ?auto_582398 ?auto_582400 ) ) ( not ( = ?auto_582398 ?auto_582401 ) ) ( not ( = ?auto_582398 ?auto_582402 ) ) ( not ( = ?auto_582399 ?auto_582400 ) ) ( not ( = ?auto_582399 ?auto_582401 ) ) ( not ( = ?auto_582399 ?auto_582402 ) ) ( not ( = ?auto_582400 ?auto_582401 ) ) ( not ( = ?auto_582400 ?auto_582402 ) ) ( not ( = ?auto_582401 ?auto_582402 ) ) ( ON ?auto_582400 ?auto_582401 ) ( ON ?auto_582399 ?auto_582400 ) ( ON ?auto_582398 ?auto_582399 ) ( CLEAR ?auto_582396 ) ( ON ?auto_582397 ?auto_582398 ) ( CLEAR ?auto_582397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_582387 ?auto_582388 ?auto_582389 ?auto_582390 ?auto_582391 ?auto_582392 ?auto_582393 ?auto_582394 ?auto_582395 ?auto_582396 ?auto_582397 )
      ( MAKE-15PILE ?auto_582387 ?auto_582388 ?auto_582389 ?auto_582390 ?auto_582391 ?auto_582392 ?auto_582393 ?auto_582394 ?auto_582395 ?auto_582396 ?auto_582397 ?auto_582398 ?auto_582399 ?auto_582400 ?auto_582401 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582449 - BLOCK
      ?auto_582450 - BLOCK
      ?auto_582451 - BLOCK
      ?auto_582452 - BLOCK
      ?auto_582453 - BLOCK
      ?auto_582454 - BLOCK
      ?auto_582455 - BLOCK
      ?auto_582456 - BLOCK
      ?auto_582457 - BLOCK
      ?auto_582458 - BLOCK
      ?auto_582459 - BLOCK
      ?auto_582460 - BLOCK
      ?auto_582461 - BLOCK
      ?auto_582462 - BLOCK
      ?auto_582463 - BLOCK
    )
    :vars
    (
      ?auto_582464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582463 ?auto_582464 ) ( ON-TABLE ?auto_582449 ) ( ON ?auto_582450 ?auto_582449 ) ( ON ?auto_582451 ?auto_582450 ) ( ON ?auto_582452 ?auto_582451 ) ( ON ?auto_582453 ?auto_582452 ) ( ON ?auto_582454 ?auto_582453 ) ( ON ?auto_582455 ?auto_582454 ) ( ON ?auto_582456 ?auto_582455 ) ( ON ?auto_582457 ?auto_582456 ) ( not ( = ?auto_582449 ?auto_582450 ) ) ( not ( = ?auto_582449 ?auto_582451 ) ) ( not ( = ?auto_582449 ?auto_582452 ) ) ( not ( = ?auto_582449 ?auto_582453 ) ) ( not ( = ?auto_582449 ?auto_582454 ) ) ( not ( = ?auto_582449 ?auto_582455 ) ) ( not ( = ?auto_582449 ?auto_582456 ) ) ( not ( = ?auto_582449 ?auto_582457 ) ) ( not ( = ?auto_582449 ?auto_582458 ) ) ( not ( = ?auto_582449 ?auto_582459 ) ) ( not ( = ?auto_582449 ?auto_582460 ) ) ( not ( = ?auto_582449 ?auto_582461 ) ) ( not ( = ?auto_582449 ?auto_582462 ) ) ( not ( = ?auto_582449 ?auto_582463 ) ) ( not ( = ?auto_582449 ?auto_582464 ) ) ( not ( = ?auto_582450 ?auto_582451 ) ) ( not ( = ?auto_582450 ?auto_582452 ) ) ( not ( = ?auto_582450 ?auto_582453 ) ) ( not ( = ?auto_582450 ?auto_582454 ) ) ( not ( = ?auto_582450 ?auto_582455 ) ) ( not ( = ?auto_582450 ?auto_582456 ) ) ( not ( = ?auto_582450 ?auto_582457 ) ) ( not ( = ?auto_582450 ?auto_582458 ) ) ( not ( = ?auto_582450 ?auto_582459 ) ) ( not ( = ?auto_582450 ?auto_582460 ) ) ( not ( = ?auto_582450 ?auto_582461 ) ) ( not ( = ?auto_582450 ?auto_582462 ) ) ( not ( = ?auto_582450 ?auto_582463 ) ) ( not ( = ?auto_582450 ?auto_582464 ) ) ( not ( = ?auto_582451 ?auto_582452 ) ) ( not ( = ?auto_582451 ?auto_582453 ) ) ( not ( = ?auto_582451 ?auto_582454 ) ) ( not ( = ?auto_582451 ?auto_582455 ) ) ( not ( = ?auto_582451 ?auto_582456 ) ) ( not ( = ?auto_582451 ?auto_582457 ) ) ( not ( = ?auto_582451 ?auto_582458 ) ) ( not ( = ?auto_582451 ?auto_582459 ) ) ( not ( = ?auto_582451 ?auto_582460 ) ) ( not ( = ?auto_582451 ?auto_582461 ) ) ( not ( = ?auto_582451 ?auto_582462 ) ) ( not ( = ?auto_582451 ?auto_582463 ) ) ( not ( = ?auto_582451 ?auto_582464 ) ) ( not ( = ?auto_582452 ?auto_582453 ) ) ( not ( = ?auto_582452 ?auto_582454 ) ) ( not ( = ?auto_582452 ?auto_582455 ) ) ( not ( = ?auto_582452 ?auto_582456 ) ) ( not ( = ?auto_582452 ?auto_582457 ) ) ( not ( = ?auto_582452 ?auto_582458 ) ) ( not ( = ?auto_582452 ?auto_582459 ) ) ( not ( = ?auto_582452 ?auto_582460 ) ) ( not ( = ?auto_582452 ?auto_582461 ) ) ( not ( = ?auto_582452 ?auto_582462 ) ) ( not ( = ?auto_582452 ?auto_582463 ) ) ( not ( = ?auto_582452 ?auto_582464 ) ) ( not ( = ?auto_582453 ?auto_582454 ) ) ( not ( = ?auto_582453 ?auto_582455 ) ) ( not ( = ?auto_582453 ?auto_582456 ) ) ( not ( = ?auto_582453 ?auto_582457 ) ) ( not ( = ?auto_582453 ?auto_582458 ) ) ( not ( = ?auto_582453 ?auto_582459 ) ) ( not ( = ?auto_582453 ?auto_582460 ) ) ( not ( = ?auto_582453 ?auto_582461 ) ) ( not ( = ?auto_582453 ?auto_582462 ) ) ( not ( = ?auto_582453 ?auto_582463 ) ) ( not ( = ?auto_582453 ?auto_582464 ) ) ( not ( = ?auto_582454 ?auto_582455 ) ) ( not ( = ?auto_582454 ?auto_582456 ) ) ( not ( = ?auto_582454 ?auto_582457 ) ) ( not ( = ?auto_582454 ?auto_582458 ) ) ( not ( = ?auto_582454 ?auto_582459 ) ) ( not ( = ?auto_582454 ?auto_582460 ) ) ( not ( = ?auto_582454 ?auto_582461 ) ) ( not ( = ?auto_582454 ?auto_582462 ) ) ( not ( = ?auto_582454 ?auto_582463 ) ) ( not ( = ?auto_582454 ?auto_582464 ) ) ( not ( = ?auto_582455 ?auto_582456 ) ) ( not ( = ?auto_582455 ?auto_582457 ) ) ( not ( = ?auto_582455 ?auto_582458 ) ) ( not ( = ?auto_582455 ?auto_582459 ) ) ( not ( = ?auto_582455 ?auto_582460 ) ) ( not ( = ?auto_582455 ?auto_582461 ) ) ( not ( = ?auto_582455 ?auto_582462 ) ) ( not ( = ?auto_582455 ?auto_582463 ) ) ( not ( = ?auto_582455 ?auto_582464 ) ) ( not ( = ?auto_582456 ?auto_582457 ) ) ( not ( = ?auto_582456 ?auto_582458 ) ) ( not ( = ?auto_582456 ?auto_582459 ) ) ( not ( = ?auto_582456 ?auto_582460 ) ) ( not ( = ?auto_582456 ?auto_582461 ) ) ( not ( = ?auto_582456 ?auto_582462 ) ) ( not ( = ?auto_582456 ?auto_582463 ) ) ( not ( = ?auto_582456 ?auto_582464 ) ) ( not ( = ?auto_582457 ?auto_582458 ) ) ( not ( = ?auto_582457 ?auto_582459 ) ) ( not ( = ?auto_582457 ?auto_582460 ) ) ( not ( = ?auto_582457 ?auto_582461 ) ) ( not ( = ?auto_582457 ?auto_582462 ) ) ( not ( = ?auto_582457 ?auto_582463 ) ) ( not ( = ?auto_582457 ?auto_582464 ) ) ( not ( = ?auto_582458 ?auto_582459 ) ) ( not ( = ?auto_582458 ?auto_582460 ) ) ( not ( = ?auto_582458 ?auto_582461 ) ) ( not ( = ?auto_582458 ?auto_582462 ) ) ( not ( = ?auto_582458 ?auto_582463 ) ) ( not ( = ?auto_582458 ?auto_582464 ) ) ( not ( = ?auto_582459 ?auto_582460 ) ) ( not ( = ?auto_582459 ?auto_582461 ) ) ( not ( = ?auto_582459 ?auto_582462 ) ) ( not ( = ?auto_582459 ?auto_582463 ) ) ( not ( = ?auto_582459 ?auto_582464 ) ) ( not ( = ?auto_582460 ?auto_582461 ) ) ( not ( = ?auto_582460 ?auto_582462 ) ) ( not ( = ?auto_582460 ?auto_582463 ) ) ( not ( = ?auto_582460 ?auto_582464 ) ) ( not ( = ?auto_582461 ?auto_582462 ) ) ( not ( = ?auto_582461 ?auto_582463 ) ) ( not ( = ?auto_582461 ?auto_582464 ) ) ( not ( = ?auto_582462 ?auto_582463 ) ) ( not ( = ?auto_582462 ?auto_582464 ) ) ( not ( = ?auto_582463 ?auto_582464 ) ) ( ON ?auto_582462 ?auto_582463 ) ( ON ?auto_582461 ?auto_582462 ) ( ON ?auto_582460 ?auto_582461 ) ( ON ?auto_582459 ?auto_582460 ) ( CLEAR ?auto_582457 ) ( ON ?auto_582458 ?auto_582459 ) ( CLEAR ?auto_582458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_582449 ?auto_582450 ?auto_582451 ?auto_582452 ?auto_582453 ?auto_582454 ?auto_582455 ?auto_582456 ?auto_582457 ?auto_582458 )
      ( MAKE-15PILE ?auto_582449 ?auto_582450 ?auto_582451 ?auto_582452 ?auto_582453 ?auto_582454 ?auto_582455 ?auto_582456 ?auto_582457 ?auto_582458 ?auto_582459 ?auto_582460 ?auto_582461 ?auto_582462 ?auto_582463 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582511 - BLOCK
      ?auto_582512 - BLOCK
      ?auto_582513 - BLOCK
      ?auto_582514 - BLOCK
      ?auto_582515 - BLOCK
      ?auto_582516 - BLOCK
      ?auto_582517 - BLOCK
      ?auto_582518 - BLOCK
      ?auto_582519 - BLOCK
      ?auto_582520 - BLOCK
      ?auto_582521 - BLOCK
      ?auto_582522 - BLOCK
      ?auto_582523 - BLOCK
      ?auto_582524 - BLOCK
      ?auto_582525 - BLOCK
    )
    :vars
    (
      ?auto_582526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582525 ?auto_582526 ) ( ON-TABLE ?auto_582511 ) ( ON ?auto_582512 ?auto_582511 ) ( ON ?auto_582513 ?auto_582512 ) ( ON ?auto_582514 ?auto_582513 ) ( ON ?auto_582515 ?auto_582514 ) ( ON ?auto_582516 ?auto_582515 ) ( ON ?auto_582517 ?auto_582516 ) ( ON ?auto_582518 ?auto_582517 ) ( not ( = ?auto_582511 ?auto_582512 ) ) ( not ( = ?auto_582511 ?auto_582513 ) ) ( not ( = ?auto_582511 ?auto_582514 ) ) ( not ( = ?auto_582511 ?auto_582515 ) ) ( not ( = ?auto_582511 ?auto_582516 ) ) ( not ( = ?auto_582511 ?auto_582517 ) ) ( not ( = ?auto_582511 ?auto_582518 ) ) ( not ( = ?auto_582511 ?auto_582519 ) ) ( not ( = ?auto_582511 ?auto_582520 ) ) ( not ( = ?auto_582511 ?auto_582521 ) ) ( not ( = ?auto_582511 ?auto_582522 ) ) ( not ( = ?auto_582511 ?auto_582523 ) ) ( not ( = ?auto_582511 ?auto_582524 ) ) ( not ( = ?auto_582511 ?auto_582525 ) ) ( not ( = ?auto_582511 ?auto_582526 ) ) ( not ( = ?auto_582512 ?auto_582513 ) ) ( not ( = ?auto_582512 ?auto_582514 ) ) ( not ( = ?auto_582512 ?auto_582515 ) ) ( not ( = ?auto_582512 ?auto_582516 ) ) ( not ( = ?auto_582512 ?auto_582517 ) ) ( not ( = ?auto_582512 ?auto_582518 ) ) ( not ( = ?auto_582512 ?auto_582519 ) ) ( not ( = ?auto_582512 ?auto_582520 ) ) ( not ( = ?auto_582512 ?auto_582521 ) ) ( not ( = ?auto_582512 ?auto_582522 ) ) ( not ( = ?auto_582512 ?auto_582523 ) ) ( not ( = ?auto_582512 ?auto_582524 ) ) ( not ( = ?auto_582512 ?auto_582525 ) ) ( not ( = ?auto_582512 ?auto_582526 ) ) ( not ( = ?auto_582513 ?auto_582514 ) ) ( not ( = ?auto_582513 ?auto_582515 ) ) ( not ( = ?auto_582513 ?auto_582516 ) ) ( not ( = ?auto_582513 ?auto_582517 ) ) ( not ( = ?auto_582513 ?auto_582518 ) ) ( not ( = ?auto_582513 ?auto_582519 ) ) ( not ( = ?auto_582513 ?auto_582520 ) ) ( not ( = ?auto_582513 ?auto_582521 ) ) ( not ( = ?auto_582513 ?auto_582522 ) ) ( not ( = ?auto_582513 ?auto_582523 ) ) ( not ( = ?auto_582513 ?auto_582524 ) ) ( not ( = ?auto_582513 ?auto_582525 ) ) ( not ( = ?auto_582513 ?auto_582526 ) ) ( not ( = ?auto_582514 ?auto_582515 ) ) ( not ( = ?auto_582514 ?auto_582516 ) ) ( not ( = ?auto_582514 ?auto_582517 ) ) ( not ( = ?auto_582514 ?auto_582518 ) ) ( not ( = ?auto_582514 ?auto_582519 ) ) ( not ( = ?auto_582514 ?auto_582520 ) ) ( not ( = ?auto_582514 ?auto_582521 ) ) ( not ( = ?auto_582514 ?auto_582522 ) ) ( not ( = ?auto_582514 ?auto_582523 ) ) ( not ( = ?auto_582514 ?auto_582524 ) ) ( not ( = ?auto_582514 ?auto_582525 ) ) ( not ( = ?auto_582514 ?auto_582526 ) ) ( not ( = ?auto_582515 ?auto_582516 ) ) ( not ( = ?auto_582515 ?auto_582517 ) ) ( not ( = ?auto_582515 ?auto_582518 ) ) ( not ( = ?auto_582515 ?auto_582519 ) ) ( not ( = ?auto_582515 ?auto_582520 ) ) ( not ( = ?auto_582515 ?auto_582521 ) ) ( not ( = ?auto_582515 ?auto_582522 ) ) ( not ( = ?auto_582515 ?auto_582523 ) ) ( not ( = ?auto_582515 ?auto_582524 ) ) ( not ( = ?auto_582515 ?auto_582525 ) ) ( not ( = ?auto_582515 ?auto_582526 ) ) ( not ( = ?auto_582516 ?auto_582517 ) ) ( not ( = ?auto_582516 ?auto_582518 ) ) ( not ( = ?auto_582516 ?auto_582519 ) ) ( not ( = ?auto_582516 ?auto_582520 ) ) ( not ( = ?auto_582516 ?auto_582521 ) ) ( not ( = ?auto_582516 ?auto_582522 ) ) ( not ( = ?auto_582516 ?auto_582523 ) ) ( not ( = ?auto_582516 ?auto_582524 ) ) ( not ( = ?auto_582516 ?auto_582525 ) ) ( not ( = ?auto_582516 ?auto_582526 ) ) ( not ( = ?auto_582517 ?auto_582518 ) ) ( not ( = ?auto_582517 ?auto_582519 ) ) ( not ( = ?auto_582517 ?auto_582520 ) ) ( not ( = ?auto_582517 ?auto_582521 ) ) ( not ( = ?auto_582517 ?auto_582522 ) ) ( not ( = ?auto_582517 ?auto_582523 ) ) ( not ( = ?auto_582517 ?auto_582524 ) ) ( not ( = ?auto_582517 ?auto_582525 ) ) ( not ( = ?auto_582517 ?auto_582526 ) ) ( not ( = ?auto_582518 ?auto_582519 ) ) ( not ( = ?auto_582518 ?auto_582520 ) ) ( not ( = ?auto_582518 ?auto_582521 ) ) ( not ( = ?auto_582518 ?auto_582522 ) ) ( not ( = ?auto_582518 ?auto_582523 ) ) ( not ( = ?auto_582518 ?auto_582524 ) ) ( not ( = ?auto_582518 ?auto_582525 ) ) ( not ( = ?auto_582518 ?auto_582526 ) ) ( not ( = ?auto_582519 ?auto_582520 ) ) ( not ( = ?auto_582519 ?auto_582521 ) ) ( not ( = ?auto_582519 ?auto_582522 ) ) ( not ( = ?auto_582519 ?auto_582523 ) ) ( not ( = ?auto_582519 ?auto_582524 ) ) ( not ( = ?auto_582519 ?auto_582525 ) ) ( not ( = ?auto_582519 ?auto_582526 ) ) ( not ( = ?auto_582520 ?auto_582521 ) ) ( not ( = ?auto_582520 ?auto_582522 ) ) ( not ( = ?auto_582520 ?auto_582523 ) ) ( not ( = ?auto_582520 ?auto_582524 ) ) ( not ( = ?auto_582520 ?auto_582525 ) ) ( not ( = ?auto_582520 ?auto_582526 ) ) ( not ( = ?auto_582521 ?auto_582522 ) ) ( not ( = ?auto_582521 ?auto_582523 ) ) ( not ( = ?auto_582521 ?auto_582524 ) ) ( not ( = ?auto_582521 ?auto_582525 ) ) ( not ( = ?auto_582521 ?auto_582526 ) ) ( not ( = ?auto_582522 ?auto_582523 ) ) ( not ( = ?auto_582522 ?auto_582524 ) ) ( not ( = ?auto_582522 ?auto_582525 ) ) ( not ( = ?auto_582522 ?auto_582526 ) ) ( not ( = ?auto_582523 ?auto_582524 ) ) ( not ( = ?auto_582523 ?auto_582525 ) ) ( not ( = ?auto_582523 ?auto_582526 ) ) ( not ( = ?auto_582524 ?auto_582525 ) ) ( not ( = ?auto_582524 ?auto_582526 ) ) ( not ( = ?auto_582525 ?auto_582526 ) ) ( ON ?auto_582524 ?auto_582525 ) ( ON ?auto_582523 ?auto_582524 ) ( ON ?auto_582522 ?auto_582523 ) ( ON ?auto_582521 ?auto_582522 ) ( ON ?auto_582520 ?auto_582521 ) ( CLEAR ?auto_582518 ) ( ON ?auto_582519 ?auto_582520 ) ( CLEAR ?auto_582519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_582511 ?auto_582512 ?auto_582513 ?auto_582514 ?auto_582515 ?auto_582516 ?auto_582517 ?auto_582518 ?auto_582519 )
      ( MAKE-15PILE ?auto_582511 ?auto_582512 ?auto_582513 ?auto_582514 ?auto_582515 ?auto_582516 ?auto_582517 ?auto_582518 ?auto_582519 ?auto_582520 ?auto_582521 ?auto_582522 ?auto_582523 ?auto_582524 ?auto_582525 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582573 - BLOCK
      ?auto_582574 - BLOCK
      ?auto_582575 - BLOCK
      ?auto_582576 - BLOCK
      ?auto_582577 - BLOCK
      ?auto_582578 - BLOCK
      ?auto_582579 - BLOCK
      ?auto_582580 - BLOCK
      ?auto_582581 - BLOCK
      ?auto_582582 - BLOCK
      ?auto_582583 - BLOCK
      ?auto_582584 - BLOCK
      ?auto_582585 - BLOCK
      ?auto_582586 - BLOCK
      ?auto_582587 - BLOCK
    )
    :vars
    (
      ?auto_582588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582587 ?auto_582588 ) ( ON-TABLE ?auto_582573 ) ( ON ?auto_582574 ?auto_582573 ) ( ON ?auto_582575 ?auto_582574 ) ( ON ?auto_582576 ?auto_582575 ) ( ON ?auto_582577 ?auto_582576 ) ( ON ?auto_582578 ?auto_582577 ) ( ON ?auto_582579 ?auto_582578 ) ( not ( = ?auto_582573 ?auto_582574 ) ) ( not ( = ?auto_582573 ?auto_582575 ) ) ( not ( = ?auto_582573 ?auto_582576 ) ) ( not ( = ?auto_582573 ?auto_582577 ) ) ( not ( = ?auto_582573 ?auto_582578 ) ) ( not ( = ?auto_582573 ?auto_582579 ) ) ( not ( = ?auto_582573 ?auto_582580 ) ) ( not ( = ?auto_582573 ?auto_582581 ) ) ( not ( = ?auto_582573 ?auto_582582 ) ) ( not ( = ?auto_582573 ?auto_582583 ) ) ( not ( = ?auto_582573 ?auto_582584 ) ) ( not ( = ?auto_582573 ?auto_582585 ) ) ( not ( = ?auto_582573 ?auto_582586 ) ) ( not ( = ?auto_582573 ?auto_582587 ) ) ( not ( = ?auto_582573 ?auto_582588 ) ) ( not ( = ?auto_582574 ?auto_582575 ) ) ( not ( = ?auto_582574 ?auto_582576 ) ) ( not ( = ?auto_582574 ?auto_582577 ) ) ( not ( = ?auto_582574 ?auto_582578 ) ) ( not ( = ?auto_582574 ?auto_582579 ) ) ( not ( = ?auto_582574 ?auto_582580 ) ) ( not ( = ?auto_582574 ?auto_582581 ) ) ( not ( = ?auto_582574 ?auto_582582 ) ) ( not ( = ?auto_582574 ?auto_582583 ) ) ( not ( = ?auto_582574 ?auto_582584 ) ) ( not ( = ?auto_582574 ?auto_582585 ) ) ( not ( = ?auto_582574 ?auto_582586 ) ) ( not ( = ?auto_582574 ?auto_582587 ) ) ( not ( = ?auto_582574 ?auto_582588 ) ) ( not ( = ?auto_582575 ?auto_582576 ) ) ( not ( = ?auto_582575 ?auto_582577 ) ) ( not ( = ?auto_582575 ?auto_582578 ) ) ( not ( = ?auto_582575 ?auto_582579 ) ) ( not ( = ?auto_582575 ?auto_582580 ) ) ( not ( = ?auto_582575 ?auto_582581 ) ) ( not ( = ?auto_582575 ?auto_582582 ) ) ( not ( = ?auto_582575 ?auto_582583 ) ) ( not ( = ?auto_582575 ?auto_582584 ) ) ( not ( = ?auto_582575 ?auto_582585 ) ) ( not ( = ?auto_582575 ?auto_582586 ) ) ( not ( = ?auto_582575 ?auto_582587 ) ) ( not ( = ?auto_582575 ?auto_582588 ) ) ( not ( = ?auto_582576 ?auto_582577 ) ) ( not ( = ?auto_582576 ?auto_582578 ) ) ( not ( = ?auto_582576 ?auto_582579 ) ) ( not ( = ?auto_582576 ?auto_582580 ) ) ( not ( = ?auto_582576 ?auto_582581 ) ) ( not ( = ?auto_582576 ?auto_582582 ) ) ( not ( = ?auto_582576 ?auto_582583 ) ) ( not ( = ?auto_582576 ?auto_582584 ) ) ( not ( = ?auto_582576 ?auto_582585 ) ) ( not ( = ?auto_582576 ?auto_582586 ) ) ( not ( = ?auto_582576 ?auto_582587 ) ) ( not ( = ?auto_582576 ?auto_582588 ) ) ( not ( = ?auto_582577 ?auto_582578 ) ) ( not ( = ?auto_582577 ?auto_582579 ) ) ( not ( = ?auto_582577 ?auto_582580 ) ) ( not ( = ?auto_582577 ?auto_582581 ) ) ( not ( = ?auto_582577 ?auto_582582 ) ) ( not ( = ?auto_582577 ?auto_582583 ) ) ( not ( = ?auto_582577 ?auto_582584 ) ) ( not ( = ?auto_582577 ?auto_582585 ) ) ( not ( = ?auto_582577 ?auto_582586 ) ) ( not ( = ?auto_582577 ?auto_582587 ) ) ( not ( = ?auto_582577 ?auto_582588 ) ) ( not ( = ?auto_582578 ?auto_582579 ) ) ( not ( = ?auto_582578 ?auto_582580 ) ) ( not ( = ?auto_582578 ?auto_582581 ) ) ( not ( = ?auto_582578 ?auto_582582 ) ) ( not ( = ?auto_582578 ?auto_582583 ) ) ( not ( = ?auto_582578 ?auto_582584 ) ) ( not ( = ?auto_582578 ?auto_582585 ) ) ( not ( = ?auto_582578 ?auto_582586 ) ) ( not ( = ?auto_582578 ?auto_582587 ) ) ( not ( = ?auto_582578 ?auto_582588 ) ) ( not ( = ?auto_582579 ?auto_582580 ) ) ( not ( = ?auto_582579 ?auto_582581 ) ) ( not ( = ?auto_582579 ?auto_582582 ) ) ( not ( = ?auto_582579 ?auto_582583 ) ) ( not ( = ?auto_582579 ?auto_582584 ) ) ( not ( = ?auto_582579 ?auto_582585 ) ) ( not ( = ?auto_582579 ?auto_582586 ) ) ( not ( = ?auto_582579 ?auto_582587 ) ) ( not ( = ?auto_582579 ?auto_582588 ) ) ( not ( = ?auto_582580 ?auto_582581 ) ) ( not ( = ?auto_582580 ?auto_582582 ) ) ( not ( = ?auto_582580 ?auto_582583 ) ) ( not ( = ?auto_582580 ?auto_582584 ) ) ( not ( = ?auto_582580 ?auto_582585 ) ) ( not ( = ?auto_582580 ?auto_582586 ) ) ( not ( = ?auto_582580 ?auto_582587 ) ) ( not ( = ?auto_582580 ?auto_582588 ) ) ( not ( = ?auto_582581 ?auto_582582 ) ) ( not ( = ?auto_582581 ?auto_582583 ) ) ( not ( = ?auto_582581 ?auto_582584 ) ) ( not ( = ?auto_582581 ?auto_582585 ) ) ( not ( = ?auto_582581 ?auto_582586 ) ) ( not ( = ?auto_582581 ?auto_582587 ) ) ( not ( = ?auto_582581 ?auto_582588 ) ) ( not ( = ?auto_582582 ?auto_582583 ) ) ( not ( = ?auto_582582 ?auto_582584 ) ) ( not ( = ?auto_582582 ?auto_582585 ) ) ( not ( = ?auto_582582 ?auto_582586 ) ) ( not ( = ?auto_582582 ?auto_582587 ) ) ( not ( = ?auto_582582 ?auto_582588 ) ) ( not ( = ?auto_582583 ?auto_582584 ) ) ( not ( = ?auto_582583 ?auto_582585 ) ) ( not ( = ?auto_582583 ?auto_582586 ) ) ( not ( = ?auto_582583 ?auto_582587 ) ) ( not ( = ?auto_582583 ?auto_582588 ) ) ( not ( = ?auto_582584 ?auto_582585 ) ) ( not ( = ?auto_582584 ?auto_582586 ) ) ( not ( = ?auto_582584 ?auto_582587 ) ) ( not ( = ?auto_582584 ?auto_582588 ) ) ( not ( = ?auto_582585 ?auto_582586 ) ) ( not ( = ?auto_582585 ?auto_582587 ) ) ( not ( = ?auto_582585 ?auto_582588 ) ) ( not ( = ?auto_582586 ?auto_582587 ) ) ( not ( = ?auto_582586 ?auto_582588 ) ) ( not ( = ?auto_582587 ?auto_582588 ) ) ( ON ?auto_582586 ?auto_582587 ) ( ON ?auto_582585 ?auto_582586 ) ( ON ?auto_582584 ?auto_582585 ) ( ON ?auto_582583 ?auto_582584 ) ( ON ?auto_582582 ?auto_582583 ) ( ON ?auto_582581 ?auto_582582 ) ( CLEAR ?auto_582579 ) ( ON ?auto_582580 ?auto_582581 ) ( CLEAR ?auto_582580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_582573 ?auto_582574 ?auto_582575 ?auto_582576 ?auto_582577 ?auto_582578 ?auto_582579 ?auto_582580 )
      ( MAKE-15PILE ?auto_582573 ?auto_582574 ?auto_582575 ?auto_582576 ?auto_582577 ?auto_582578 ?auto_582579 ?auto_582580 ?auto_582581 ?auto_582582 ?auto_582583 ?auto_582584 ?auto_582585 ?auto_582586 ?auto_582587 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582635 - BLOCK
      ?auto_582636 - BLOCK
      ?auto_582637 - BLOCK
      ?auto_582638 - BLOCK
      ?auto_582639 - BLOCK
      ?auto_582640 - BLOCK
      ?auto_582641 - BLOCK
      ?auto_582642 - BLOCK
      ?auto_582643 - BLOCK
      ?auto_582644 - BLOCK
      ?auto_582645 - BLOCK
      ?auto_582646 - BLOCK
      ?auto_582647 - BLOCK
      ?auto_582648 - BLOCK
      ?auto_582649 - BLOCK
    )
    :vars
    (
      ?auto_582650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582649 ?auto_582650 ) ( ON-TABLE ?auto_582635 ) ( ON ?auto_582636 ?auto_582635 ) ( ON ?auto_582637 ?auto_582636 ) ( ON ?auto_582638 ?auto_582637 ) ( ON ?auto_582639 ?auto_582638 ) ( ON ?auto_582640 ?auto_582639 ) ( not ( = ?auto_582635 ?auto_582636 ) ) ( not ( = ?auto_582635 ?auto_582637 ) ) ( not ( = ?auto_582635 ?auto_582638 ) ) ( not ( = ?auto_582635 ?auto_582639 ) ) ( not ( = ?auto_582635 ?auto_582640 ) ) ( not ( = ?auto_582635 ?auto_582641 ) ) ( not ( = ?auto_582635 ?auto_582642 ) ) ( not ( = ?auto_582635 ?auto_582643 ) ) ( not ( = ?auto_582635 ?auto_582644 ) ) ( not ( = ?auto_582635 ?auto_582645 ) ) ( not ( = ?auto_582635 ?auto_582646 ) ) ( not ( = ?auto_582635 ?auto_582647 ) ) ( not ( = ?auto_582635 ?auto_582648 ) ) ( not ( = ?auto_582635 ?auto_582649 ) ) ( not ( = ?auto_582635 ?auto_582650 ) ) ( not ( = ?auto_582636 ?auto_582637 ) ) ( not ( = ?auto_582636 ?auto_582638 ) ) ( not ( = ?auto_582636 ?auto_582639 ) ) ( not ( = ?auto_582636 ?auto_582640 ) ) ( not ( = ?auto_582636 ?auto_582641 ) ) ( not ( = ?auto_582636 ?auto_582642 ) ) ( not ( = ?auto_582636 ?auto_582643 ) ) ( not ( = ?auto_582636 ?auto_582644 ) ) ( not ( = ?auto_582636 ?auto_582645 ) ) ( not ( = ?auto_582636 ?auto_582646 ) ) ( not ( = ?auto_582636 ?auto_582647 ) ) ( not ( = ?auto_582636 ?auto_582648 ) ) ( not ( = ?auto_582636 ?auto_582649 ) ) ( not ( = ?auto_582636 ?auto_582650 ) ) ( not ( = ?auto_582637 ?auto_582638 ) ) ( not ( = ?auto_582637 ?auto_582639 ) ) ( not ( = ?auto_582637 ?auto_582640 ) ) ( not ( = ?auto_582637 ?auto_582641 ) ) ( not ( = ?auto_582637 ?auto_582642 ) ) ( not ( = ?auto_582637 ?auto_582643 ) ) ( not ( = ?auto_582637 ?auto_582644 ) ) ( not ( = ?auto_582637 ?auto_582645 ) ) ( not ( = ?auto_582637 ?auto_582646 ) ) ( not ( = ?auto_582637 ?auto_582647 ) ) ( not ( = ?auto_582637 ?auto_582648 ) ) ( not ( = ?auto_582637 ?auto_582649 ) ) ( not ( = ?auto_582637 ?auto_582650 ) ) ( not ( = ?auto_582638 ?auto_582639 ) ) ( not ( = ?auto_582638 ?auto_582640 ) ) ( not ( = ?auto_582638 ?auto_582641 ) ) ( not ( = ?auto_582638 ?auto_582642 ) ) ( not ( = ?auto_582638 ?auto_582643 ) ) ( not ( = ?auto_582638 ?auto_582644 ) ) ( not ( = ?auto_582638 ?auto_582645 ) ) ( not ( = ?auto_582638 ?auto_582646 ) ) ( not ( = ?auto_582638 ?auto_582647 ) ) ( not ( = ?auto_582638 ?auto_582648 ) ) ( not ( = ?auto_582638 ?auto_582649 ) ) ( not ( = ?auto_582638 ?auto_582650 ) ) ( not ( = ?auto_582639 ?auto_582640 ) ) ( not ( = ?auto_582639 ?auto_582641 ) ) ( not ( = ?auto_582639 ?auto_582642 ) ) ( not ( = ?auto_582639 ?auto_582643 ) ) ( not ( = ?auto_582639 ?auto_582644 ) ) ( not ( = ?auto_582639 ?auto_582645 ) ) ( not ( = ?auto_582639 ?auto_582646 ) ) ( not ( = ?auto_582639 ?auto_582647 ) ) ( not ( = ?auto_582639 ?auto_582648 ) ) ( not ( = ?auto_582639 ?auto_582649 ) ) ( not ( = ?auto_582639 ?auto_582650 ) ) ( not ( = ?auto_582640 ?auto_582641 ) ) ( not ( = ?auto_582640 ?auto_582642 ) ) ( not ( = ?auto_582640 ?auto_582643 ) ) ( not ( = ?auto_582640 ?auto_582644 ) ) ( not ( = ?auto_582640 ?auto_582645 ) ) ( not ( = ?auto_582640 ?auto_582646 ) ) ( not ( = ?auto_582640 ?auto_582647 ) ) ( not ( = ?auto_582640 ?auto_582648 ) ) ( not ( = ?auto_582640 ?auto_582649 ) ) ( not ( = ?auto_582640 ?auto_582650 ) ) ( not ( = ?auto_582641 ?auto_582642 ) ) ( not ( = ?auto_582641 ?auto_582643 ) ) ( not ( = ?auto_582641 ?auto_582644 ) ) ( not ( = ?auto_582641 ?auto_582645 ) ) ( not ( = ?auto_582641 ?auto_582646 ) ) ( not ( = ?auto_582641 ?auto_582647 ) ) ( not ( = ?auto_582641 ?auto_582648 ) ) ( not ( = ?auto_582641 ?auto_582649 ) ) ( not ( = ?auto_582641 ?auto_582650 ) ) ( not ( = ?auto_582642 ?auto_582643 ) ) ( not ( = ?auto_582642 ?auto_582644 ) ) ( not ( = ?auto_582642 ?auto_582645 ) ) ( not ( = ?auto_582642 ?auto_582646 ) ) ( not ( = ?auto_582642 ?auto_582647 ) ) ( not ( = ?auto_582642 ?auto_582648 ) ) ( not ( = ?auto_582642 ?auto_582649 ) ) ( not ( = ?auto_582642 ?auto_582650 ) ) ( not ( = ?auto_582643 ?auto_582644 ) ) ( not ( = ?auto_582643 ?auto_582645 ) ) ( not ( = ?auto_582643 ?auto_582646 ) ) ( not ( = ?auto_582643 ?auto_582647 ) ) ( not ( = ?auto_582643 ?auto_582648 ) ) ( not ( = ?auto_582643 ?auto_582649 ) ) ( not ( = ?auto_582643 ?auto_582650 ) ) ( not ( = ?auto_582644 ?auto_582645 ) ) ( not ( = ?auto_582644 ?auto_582646 ) ) ( not ( = ?auto_582644 ?auto_582647 ) ) ( not ( = ?auto_582644 ?auto_582648 ) ) ( not ( = ?auto_582644 ?auto_582649 ) ) ( not ( = ?auto_582644 ?auto_582650 ) ) ( not ( = ?auto_582645 ?auto_582646 ) ) ( not ( = ?auto_582645 ?auto_582647 ) ) ( not ( = ?auto_582645 ?auto_582648 ) ) ( not ( = ?auto_582645 ?auto_582649 ) ) ( not ( = ?auto_582645 ?auto_582650 ) ) ( not ( = ?auto_582646 ?auto_582647 ) ) ( not ( = ?auto_582646 ?auto_582648 ) ) ( not ( = ?auto_582646 ?auto_582649 ) ) ( not ( = ?auto_582646 ?auto_582650 ) ) ( not ( = ?auto_582647 ?auto_582648 ) ) ( not ( = ?auto_582647 ?auto_582649 ) ) ( not ( = ?auto_582647 ?auto_582650 ) ) ( not ( = ?auto_582648 ?auto_582649 ) ) ( not ( = ?auto_582648 ?auto_582650 ) ) ( not ( = ?auto_582649 ?auto_582650 ) ) ( ON ?auto_582648 ?auto_582649 ) ( ON ?auto_582647 ?auto_582648 ) ( ON ?auto_582646 ?auto_582647 ) ( ON ?auto_582645 ?auto_582646 ) ( ON ?auto_582644 ?auto_582645 ) ( ON ?auto_582643 ?auto_582644 ) ( ON ?auto_582642 ?auto_582643 ) ( CLEAR ?auto_582640 ) ( ON ?auto_582641 ?auto_582642 ) ( CLEAR ?auto_582641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_582635 ?auto_582636 ?auto_582637 ?auto_582638 ?auto_582639 ?auto_582640 ?auto_582641 )
      ( MAKE-15PILE ?auto_582635 ?auto_582636 ?auto_582637 ?auto_582638 ?auto_582639 ?auto_582640 ?auto_582641 ?auto_582642 ?auto_582643 ?auto_582644 ?auto_582645 ?auto_582646 ?auto_582647 ?auto_582648 ?auto_582649 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582697 - BLOCK
      ?auto_582698 - BLOCK
      ?auto_582699 - BLOCK
      ?auto_582700 - BLOCK
      ?auto_582701 - BLOCK
      ?auto_582702 - BLOCK
      ?auto_582703 - BLOCK
      ?auto_582704 - BLOCK
      ?auto_582705 - BLOCK
      ?auto_582706 - BLOCK
      ?auto_582707 - BLOCK
      ?auto_582708 - BLOCK
      ?auto_582709 - BLOCK
      ?auto_582710 - BLOCK
      ?auto_582711 - BLOCK
    )
    :vars
    (
      ?auto_582712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582711 ?auto_582712 ) ( ON-TABLE ?auto_582697 ) ( ON ?auto_582698 ?auto_582697 ) ( ON ?auto_582699 ?auto_582698 ) ( ON ?auto_582700 ?auto_582699 ) ( ON ?auto_582701 ?auto_582700 ) ( not ( = ?auto_582697 ?auto_582698 ) ) ( not ( = ?auto_582697 ?auto_582699 ) ) ( not ( = ?auto_582697 ?auto_582700 ) ) ( not ( = ?auto_582697 ?auto_582701 ) ) ( not ( = ?auto_582697 ?auto_582702 ) ) ( not ( = ?auto_582697 ?auto_582703 ) ) ( not ( = ?auto_582697 ?auto_582704 ) ) ( not ( = ?auto_582697 ?auto_582705 ) ) ( not ( = ?auto_582697 ?auto_582706 ) ) ( not ( = ?auto_582697 ?auto_582707 ) ) ( not ( = ?auto_582697 ?auto_582708 ) ) ( not ( = ?auto_582697 ?auto_582709 ) ) ( not ( = ?auto_582697 ?auto_582710 ) ) ( not ( = ?auto_582697 ?auto_582711 ) ) ( not ( = ?auto_582697 ?auto_582712 ) ) ( not ( = ?auto_582698 ?auto_582699 ) ) ( not ( = ?auto_582698 ?auto_582700 ) ) ( not ( = ?auto_582698 ?auto_582701 ) ) ( not ( = ?auto_582698 ?auto_582702 ) ) ( not ( = ?auto_582698 ?auto_582703 ) ) ( not ( = ?auto_582698 ?auto_582704 ) ) ( not ( = ?auto_582698 ?auto_582705 ) ) ( not ( = ?auto_582698 ?auto_582706 ) ) ( not ( = ?auto_582698 ?auto_582707 ) ) ( not ( = ?auto_582698 ?auto_582708 ) ) ( not ( = ?auto_582698 ?auto_582709 ) ) ( not ( = ?auto_582698 ?auto_582710 ) ) ( not ( = ?auto_582698 ?auto_582711 ) ) ( not ( = ?auto_582698 ?auto_582712 ) ) ( not ( = ?auto_582699 ?auto_582700 ) ) ( not ( = ?auto_582699 ?auto_582701 ) ) ( not ( = ?auto_582699 ?auto_582702 ) ) ( not ( = ?auto_582699 ?auto_582703 ) ) ( not ( = ?auto_582699 ?auto_582704 ) ) ( not ( = ?auto_582699 ?auto_582705 ) ) ( not ( = ?auto_582699 ?auto_582706 ) ) ( not ( = ?auto_582699 ?auto_582707 ) ) ( not ( = ?auto_582699 ?auto_582708 ) ) ( not ( = ?auto_582699 ?auto_582709 ) ) ( not ( = ?auto_582699 ?auto_582710 ) ) ( not ( = ?auto_582699 ?auto_582711 ) ) ( not ( = ?auto_582699 ?auto_582712 ) ) ( not ( = ?auto_582700 ?auto_582701 ) ) ( not ( = ?auto_582700 ?auto_582702 ) ) ( not ( = ?auto_582700 ?auto_582703 ) ) ( not ( = ?auto_582700 ?auto_582704 ) ) ( not ( = ?auto_582700 ?auto_582705 ) ) ( not ( = ?auto_582700 ?auto_582706 ) ) ( not ( = ?auto_582700 ?auto_582707 ) ) ( not ( = ?auto_582700 ?auto_582708 ) ) ( not ( = ?auto_582700 ?auto_582709 ) ) ( not ( = ?auto_582700 ?auto_582710 ) ) ( not ( = ?auto_582700 ?auto_582711 ) ) ( not ( = ?auto_582700 ?auto_582712 ) ) ( not ( = ?auto_582701 ?auto_582702 ) ) ( not ( = ?auto_582701 ?auto_582703 ) ) ( not ( = ?auto_582701 ?auto_582704 ) ) ( not ( = ?auto_582701 ?auto_582705 ) ) ( not ( = ?auto_582701 ?auto_582706 ) ) ( not ( = ?auto_582701 ?auto_582707 ) ) ( not ( = ?auto_582701 ?auto_582708 ) ) ( not ( = ?auto_582701 ?auto_582709 ) ) ( not ( = ?auto_582701 ?auto_582710 ) ) ( not ( = ?auto_582701 ?auto_582711 ) ) ( not ( = ?auto_582701 ?auto_582712 ) ) ( not ( = ?auto_582702 ?auto_582703 ) ) ( not ( = ?auto_582702 ?auto_582704 ) ) ( not ( = ?auto_582702 ?auto_582705 ) ) ( not ( = ?auto_582702 ?auto_582706 ) ) ( not ( = ?auto_582702 ?auto_582707 ) ) ( not ( = ?auto_582702 ?auto_582708 ) ) ( not ( = ?auto_582702 ?auto_582709 ) ) ( not ( = ?auto_582702 ?auto_582710 ) ) ( not ( = ?auto_582702 ?auto_582711 ) ) ( not ( = ?auto_582702 ?auto_582712 ) ) ( not ( = ?auto_582703 ?auto_582704 ) ) ( not ( = ?auto_582703 ?auto_582705 ) ) ( not ( = ?auto_582703 ?auto_582706 ) ) ( not ( = ?auto_582703 ?auto_582707 ) ) ( not ( = ?auto_582703 ?auto_582708 ) ) ( not ( = ?auto_582703 ?auto_582709 ) ) ( not ( = ?auto_582703 ?auto_582710 ) ) ( not ( = ?auto_582703 ?auto_582711 ) ) ( not ( = ?auto_582703 ?auto_582712 ) ) ( not ( = ?auto_582704 ?auto_582705 ) ) ( not ( = ?auto_582704 ?auto_582706 ) ) ( not ( = ?auto_582704 ?auto_582707 ) ) ( not ( = ?auto_582704 ?auto_582708 ) ) ( not ( = ?auto_582704 ?auto_582709 ) ) ( not ( = ?auto_582704 ?auto_582710 ) ) ( not ( = ?auto_582704 ?auto_582711 ) ) ( not ( = ?auto_582704 ?auto_582712 ) ) ( not ( = ?auto_582705 ?auto_582706 ) ) ( not ( = ?auto_582705 ?auto_582707 ) ) ( not ( = ?auto_582705 ?auto_582708 ) ) ( not ( = ?auto_582705 ?auto_582709 ) ) ( not ( = ?auto_582705 ?auto_582710 ) ) ( not ( = ?auto_582705 ?auto_582711 ) ) ( not ( = ?auto_582705 ?auto_582712 ) ) ( not ( = ?auto_582706 ?auto_582707 ) ) ( not ( = ?auto_582706 ?auto_582708 ) ) ( not ( = ?auto_582706 ?auto_582709 ) ) ( not ( = ?auto_582706 ?auto_582710 ) ) ( not ( = ?auto_582706 ?auto_582711 ) ) ( not ( = ?auto_582706 ?auto_582712 ) ) ( not ( = ?auto_582707 ?auto_582708 ) ) ( not ( = ?auto_582707 ?auto_582709 ) ) ( not ( = ?auto_582707 ?auto_582710 ) ) ( not ( = ?auto_582707 ?auto_582711 ) ) ( not ( = ?auto_582707 ?auto_582712 ) ) ( not ( = ?auto_582708 ?auto_582709 ) ) ( not ( = ?auto_582708 ?auto_582710 ) ) ( not ( = ?auto_582708 ?auto_582711 ) ) ( not ( = ?auto_582708 ?auto_582712 ) ) ( not ( = ?auto_582709 ?auto_582710 ) ) ( not ( = ?auto_582709 ?auto_582711 ) ) ( not ( = ?auto_582709 ?auto_582712 ) ) ( not ( = ?auto_582710 ?auto_582711 ) ) ( not ( = ?auto_582710 ?auto_582712 ) ) ( not ( = ?auto_582711 ?auto_582712 ) ) ( ON ?auto_582710 ?auto_582711 ) ( ON ?auto_582709 ?auto_582710 ) ( ON ?auto_582708 ?auto_582709 ) ( ON ?auto_582707 ?auto_582708 ) ( ON ?auto_582706 ?auto_582707 ) ( ON ?auto_582705 ?auto_582706 ) ( ON ?auto_582704 ?auto_582705 ) ( ON ?auto_582703 ?auto_582704 ) ( CLEAR ?auto_582701 ) ( ON ?auto_582702 ?auto_582703 ) ( CLEAR ?auto_582702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_582697 ?auto_582698 ?auto_582699 ?auto_582700 ?auto_582701 ?auto_582702 )
      ( MAKE-15PILE ?auto_582697 ?auto_582698 ?auto_582699 ?auto_582700 ?auto_582701 ?auto_582702 ?auto_582703 ?auto_582704 ?auto_582705 ?auto_582706 ?auto_582707 ?auto_582708 ?auto_582709 ?auto_582710 ?auto_582711 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582759 - BLOCK
      ?auto_582760 - BLOCK
      ?auto_582761 - BLOCK
      ?auto_582762 - BLOCK
      ?auto_582763 - BLOCK
      ?auto_582764 - BLOCK
      ?auto_582765 - BLOCK
      ?auto_582766 - BLOCK
      ?auto_582767 - BLOCK
      ?auto_582768 - BLOCK
      ?auto_582769 - BLOCK
      ?auto_582770 - BLOCK
      ?auto_582771 - BLOCK
      ?auto_582772 - BLOCK
      ?auto_582773 - BLOCK
    )
    :vars
    (
      ?auto_582774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582773 ?auto_582774 ) ( ON-TABLE ?auto_582759 ) ( ON ?auto_582760 ?auto_582759 ) ( ON ?auto_582761 ?auto_582760 ) ( ON ?auto_582762 ?auto_582761 ) ( not ( = ?auto_582759 ?auto_582760 ) ) ( not ( = ?auto_582759 ?auto_582761 ) ) ( not ( = ?auto_582759 ?auto_582762 ) ) ( not ( = ?auto_582759 ?auto_582763 ) ) ( not ( = ?auto_582759 ?auto_582764 ) ) ( not ( = ?auto_582759 ?auto_582765 ) ) ( not ( = ?auto_582759 ?auto_582766 ) ) ( not ( = ?auto_582759 ?auto_582767 ) ) ( not ( = ?auto_582759 ?auto_582768 ) ) ( not ( = ?auto_582759 ?auto_582769 ) ) ( not ( = ?auto_582759 ?auto_582770 ) ) ( not ( = ?auto_582759 ?auto_582771 ) ) ( not ( = ?auto_582759 ?auto_582772 ) ) ( not ( = ?auto_582759 ?auto_582773 ) ) ( not ( = ?auto_582759 ?auto_582774 ) ) ( not ( = ?auto_582760 ?auto_582761 ) ) ( not ( = ?auto_582760 ?auto_582762 ) ) ( not ( = ?auto_582760 ?auto_582763 ) ) ( not ( = ?auto_582760 ?auto_582764 ) ) ( not ( = ?auto_582760 ?auto_582765 ) ) ( not ( = ?auto_582760 ?auto_582766 ) ) ( not ( = ?auto_582760 ?auto_582767 ) ) ( not ( = ?auto_582760 ?auto_582768 ) ) ( not ( = ?auto_582760 ?auto_582769 ) ) ( not ( = ?auto_582760 ?auto_582770 ) ) ( not ( = ?auto_582760 ?auto_582771 ) ) ( not ( = ?auto_582760 ?auto_582772 ) ) ( not ( = ?auto_582760 ?auto_582773 ) ) ( not ( = ?auto_582760 ?auto_582774 ) ) ( not ( = ?auto_582761 ?auto_582762 ) ) ( not ( = ?auto_582761 ?auto_582763 ) ) ( not ( = ?auto_582761 ?auto_582764 ) ) ( not ( = ?auto_582761 ?auto_582765 ) ) ( not ( = ?auto_582761 ?auto_582766 ) ) ( not ( = ?auto_582761 ?auto_582767 ) ) ( not ( = ?auto_582761 ?auto_582768 ) ) ( not ( = ?auto_582761 ?auto_582769 ) ) ( not ( = ?auto_582761 ?auto_582770 ) ) ( not ( = ?auto_582761 ?auto_582771 ) ) ( not ( = ?auto_582761 ?auto_582772 ) ) ( not ( = ?auto_582761 ?auto_582773 ) ) ( not ( = ?auto_582761 ?auto_582774 ) ) ( not ( = ?auto_582762 ?auto_582763 ) ) ( not ( = ?auto_582762 ?auto_582764 ) ) ( not ( = ?auto_582762 ?auto_582765 ) ) ( not ( = ?auto_582762 ?auto_582766 ) ) ( not ( = ?auto_582762 ?auto_582767 ) ) ( not ( = ?auto_582762 ?auto_582768 ) ) ( not ( = ?auto_582762 ?auto_582769 ) ) ( not ( = ?auto_582762 ?auto_582770 ) ) ( not ( = ?auto_582762 ?auto_582771 ) ) ( not ( = ?auto_582762 ?auto_582772 ) ) ( not ( = ?auto_582762 ?auto_582773 ) ) ( not ( = ?auto_582762 ?auto_582774 ) ) ( not ( = ?auto_582763 ?auto_582764 ) ) ( not ( = ?auto_582763 ?auto_582765 ) ) ( not ( = ?auto_582763 ?auto_582766 ) ) ( not ( = ?auto_582763 ?auto_582767 ) ) ( not ( = ?auto_582763 ?auto_582768 ) ) ( not ( = ?auto_582763 ?auto_582769 ) ) ( not ( = ?auto_582763 ?auto_582770 ) ) ( not ( = ?auto_582763 ?auto_582771 ) ) ( not ( = ?auto_582763 ?auto_582772 ) ) ( not ( = ?auto_582763 ?auto_582773 ) ) ( not ( = ?auto_582763 ?auto_582774 ) ) ( not ( = ?auto_582764 ?auto_582765 ) ) ( not ( = ?auto_582764 ?auto_582766 ) ) ( not ( = ?auto_582764 ?auto_582767 ) ) ( not ( = ?auto_582764 ?auto_582768 ) ) ( not ( = ?auto_582764 ?auto_582769 ) ) ( not ( = ?auto_582764 ?auto_582770 ) ) ( not ( = ?auto_582764 ?auto_582771 ) ) ( not ( = ?auto_582764 ?auto_582772 ) ) ( not ( = ?auto_582764 ?auto_582773 ) ) ( not ( = ?auto_582764 ?auto_582774 ) ) ( not ( = ?auto_582765 ?auto_582766 ) ) ( not ( = ?auto_582765 ?auto_582767 ) ) ( not ( = ?auto_582765 ?auto_582768 ) ) ( not ( = ?auto_582765 ?auto_582769 ) ) ( not ( = ?auto_582765 ?auto_582770 ) ) ( not ( = ?auto_582765 ?auto_582771 ) ) ( not ( = ?auto_582765 ?auto_582772 ) ) ( not ( = ?auto_582765 ?auto_582773 ) ) ( not ( = ?auto_582765 ?auto_582774 ) ) ( not ( = ?auto_582766 ?auto_582767 ) ) ( not ( = ?auto_582766 ?auto_582768 ) ) ( not ( = ?auto_582766 ?auto_582769 ) ) ( not ( = ?auto_582766 ?auto_582770 ) ) ( not ( = ?auto_582766 ?auto_582771 ) ) ( not ( = ?auto_582766 ?auto_582772 ) ) ( not ( = ?auto_582766 ?auto_582773 ) ) ( not ( = ?auto_582766 ?auto_582774 ) ) ( not ( = ?auto_582767 ?auto_582768 ) ) ( not ( = ?auto_582767 ?auto_582769 ) ) ( not ( = ?auto_582767 ?auto_582770 ) ) ( not ( = ?auto_582767 ?auto_582771 ) ) ( not ( = ?auto_582767 ?auto_582772 ) ) ( not ( = ?auto_582767 ?auto_582773 ) ) ( not ( = ?auto_582767 ?auto_582774 ) ) ( not ( = ?auto_582768 ?auto_582769 ) ) ( not ( = ?auto_582768 ?auto_582770 ) ) ( not ( = ?auto_582768 ?auto_582771 ) ) ( not ( = ?auto_582768 ?auto_582772 ) ) ( not ( = ?auto_582768 ?auto_582773 ) ) ( not ( = ?auto_582768 ?auto_582774 ) ) ( not ( = ?auto_582769 ?auto_582770 ) ) ( not ( = ?auto_582769 ?auto_582771 ) ) ( not ( = ?auto_582769 ?auto_582772 ) ) ( not ( = ?auto_582769 ?auto_582773 ) ) ( not ( = ?auto_582769 ?auto_582774 ) ) ( not ( = ?auto_582770 ?auto_582771 ) ) ( not ( = ?auto_582770 ?auto_582772 ) ) ( not ( = ?auto_582770 ?auto_582773 ) ) ( not ( = ?auto_582770 ?auto_582774 ) ) ( not ( = ?auto_582771 ?auto_582772 ) ) ( not ( = ?auto_582771 ?auto_582773 ) ) ( not ( = ?auto_582771 ?auto_582774 ) ) ( not ( = ?auto_582772 ?auto_582773 ) ) ( not ( = ?auto_582772 ?auto_582774 ) ) ( not ( = ?auto_582773 ?auto_582774 ) ) ( ON ?auto_582772 ?auto_582773 ) ( ON ?auto_582771 ?auto_582772 ) ( ON ?auto_582770 ?auto_582771 ) ( ON ?auto_582769 ?auto_582770 ) ( ON ?auto_582768 ?auto_582769 ) ( ON ?auto_582767 ?auto_582768 ) ( ON ?auto_582766 ?auto_582767 ) ( ON ?auto_582765 ?auto_582766 ) ( ON ?auto_582764 ?auto_582765 ) ( CLEAR ?auto_582762 ) ( ON ?auto_582763 ?auto_582764 ) ( CLEAR ?auto_582763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_582759 ?auto_582760 ?auto_582761 ?auto_582762 ?auto_582763 )
      ( MAKE-15PILE ?auto_582759 ?auto_582760 ?auto_582761 ?auto_582762 ?auto_582763 ?auto_582764 ?auto_582765 ?auto_582766 ?auto_582767 ?auto_582768 ?auto_582769 ?auto_582770 ?auto_582771 ?auto_582772 ?auto_582773 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582821 - BLOCK
      ?auto_582822 - BLOCK
      ?auto_582823 - BLOCK
      ?auto_582824 - BLOCK
      ?auto_582825 - BLOCK
      ?auto_582826 - BLOCK
      ?auto_582827 - BLOCK
      ?auto_582828 - BLOCK
      ?auto_582829 - BLOCK
      ?auto_582830 - BLOCK
      ?auto_582831 - BLOCK
      ?auto_582832 - BLOCK
      ?auto_582833 - BLOCK
      ?auto_582834 - BLOCK
      ?auto_582835 - BLOCK
    )
    :vars
    (
      ?auto_582836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582835 ?auto_582836 ) ( ON-TABLE ?auto_582821 ) ( ON ?auto_582822 ?auto_582821 ) ( ON ?auto_582823 ?auto_582822 ) ( not ( = ?auto_582821 ?auto_582822 ) ) ( not ( = ?auto_582821 ?auto_582823 ) ) ( not ( = ?auto_582821 ?auto_582824 ) ) ( not ( = ?auto_582821 ?auto_582825 ) ) ( not ( = ?auto_582821 ?auto_582826 ) ) ( not ( = ?auto_582821 ?auto_582827 ) ) ( not ( = ?auto_582821 ?auto_582828 ) ) ( not ( = ?auto_582821 ?auto_582829 ) ) ( not ( = ?auto_582821 ?auto_582830 ) ) ( not ( = ?auto_582821 ?auto_582831 ) ) ( not ( = ?auto_582821 ?auto_582832 ) ) ( not ( = ?auto_582821 ?auto_582833 ) ) ( not ( = ?auto_582821 ?auto_582834 ) ) ( not ( = ?auto_582821 ?auto_582835 ) ) ( not ( = ?auto_582821 ?auto_582836 ) ) ( not ( = ?auto_582822 ?auto_582823 ) ) ( not ( = ?auto_582822 ?auto_582824 ) ) ( not ( = ?auto_582822 ?auto_582825 ) ) ( not ( = ?auto_582822 ?auto_582826 ) ) ( not ( = ?auto_582822 ?auto_582827 ) ) ( not ( = ?auto_582822 ?auto_582828 ) ) ( not ( = ?auto_582822 ?auto_582829 ) ) ( not ( = ?auto_582822 ?auto_582830 ) ) ( not ( = ?auto_582822 ?auto_582831 ) ) ( not ( = ?auto_582822 ?auto_582832 ) ) ( not ( = ?auto_582822 ?auto_582833 ) ) ( not ( = ?auto_582822 ?auto_582834 ) ) ( not ( = ?auto_582822 ?auto_582835 ) ) ( not ( = ?auto_582822 ?auto_582836 ) ) ( not ( = ?auto_582823 ?auto_582824 ) ) ( not ( = ?auto_582823 ?auto_582825 ) ) ( not ( = ?auto_582823 ?auto_582826 ) ) ( not ( = ?auto_582823 ?auto_582827 ) ) ( not ( = ?auto_582823 ?auto_582828 ) ) ( not ( = ?auto_582823 ?auto_582829 ) ) ( not ( = ?auto_582823 ?auto_582830 ) ) ( not ( = ?auto_582823 ?auto_582831 ) ) ( not ( = ?auto_582823 ?auto_582832 ) ) ( not ( = ?auto_582823 ?auto_582833 ) ) ( not ( = ?auto_582823 ?auto_582834 ) ) ( not ( = ?auto_582823 ?auto_582835 ) ) ( not ( = ?auto_582823 ?auto_582836 ) ) ( not ( = ?auto_582824 ?auto_582825 ) ) ( not ( = ?auto_582824 ?auto_582826 ) ) ( not ( = ?auto_582824 ?auto_582827 ) ) ( not ( = ?auto_582824 ?auto_582828 ) ) ( not ( = ?auto_582824 ?auto_582829 ) ) ( not ( = ?auto_582824 ?auto_582830 ) ) ( not ( = ?auto_582824 ?auto_582831 ) ) ( not ( = ?auto_582824 ?auto_582832 ) ) ( not ( = ?auto_582824 ?auto_582833 ) ) ( not ( = ?auto_582824 ?auto_582834 ) ) ( not ( = ?auto_582824 ?auto_582835 ) ) ( not ( = ?auto_582824 ?auto_582836 ) ) ( not ( = ?auto_582825 ?auto_582826 ) ) ( not ( = ?auto_582825 ?auto_582827 ) ) ( not ( = ?auto_582825 ?auto_582828 ) ) ( not ( = ?auto_582825 ?auto_582829 ) ) ( not ( = ?auto_582825 ?auto_582830 ) ) ( not ( = ?auto_582825 ?auto_582831 ) ) ( not ( = ?auto_582825 ?auto_582832 ) ) ( not ( = ?auto_582825 ?auto_582833 ) ) ( not ( = ?auto_582825 ?auto_582834 ) ) ( not ( = ?auto_582825 ?auto_582835 ) ) ( not ( = ?auto_582825 ?auto_582836 ) ) ( not ( = ?auto_582826 ?auto_582827 ) ) ( not ( = ?auto_582826 ?auto_582828 ) ) ( not ( = ?auto_582826 ?auto_582829 ) ) ( not ( = ?auto_582826 ?auto_582830 ) ) ( not ( = ?auto_582826 ?auto_582831 ) ) ( not ( = ?auto_582826 ?auto_582832 ) ) ( not ( = ?auto_582826 ?auto_582833 ) ) ( not ( = ?auto_582826 ?auto_582834 ) ) ( not ( = ?auto_582826 ?auto_582835 ) ) ( not ( = ?auto_582826 ?auto_582836 ) ) ( not ( = ?auto_582827 ?auto_582828 ) ) ( not ( = ?auto_582827 ?auto_582829 ) ) ( not ( = ?auto_582827 ?auto_582830 ) ) ( not ( = ?auto_582827 ?auto_582831 ) ) ( not ( = ?auto_582827 ?auto_582832 ) ) ( not ( = ?auto_582827 ?auto_582833 ) ) ( not ( = ?auto_582827 ?auto_582834 ) ) ( not ( = ?auto_582827 ?auto_582835 ) ) ( not ( = ?auto_582827 ?auto_582836 ) ) ( not ( = ?auto_582828 ?auto_582829 ) ) ( not ( = ?auto_582828 ?auto_582830 ) ) ( not ( = ?auto_582828 ?auto_582831 ) ) ( not ( = ?auto_582828 ?auto_582832 ) ) ( not ( = ?auto_582828 ?auto_582833 ) ) ( not ( = ?auto_582828 ?auto_582834 ) ) ( not ( = ?auto_582828 ?auto_582835 ) ) ( not ( = ?auto_582828 ?auto_582836 ) ) ( not ( = ?auto_582829 ?auto_582830 ) ) ( not ( = ?auto_582829 ?auto_582831 ) ) ( not ( = ?auto_582829 ?auto_582832 ) ) ( not ( = ?auto_582829 ?auto_582833 ) ) ( not ( = ?auto_582829 ?auto_582834 ) ) ( not ( = ?auto_582829 ?auto_582835 ) ) ( not ( = ?auto_582829 ?auto_582836 ) ) ( not ( = ?auto_582830 ?auto_582831 ) ) ( not ( = ?auto_582830 ?auto_582832 ) ) ( not ( = ?auto_582830 ?auto_582833 ) ) ( not ( = ?auto_582830 ?auto_582834 ) ) ( not ( = ?auto_582830 ?auto_582835 ) ) ( not ( = ?auto_582830 ?auto_582836 ) ) ( not ( = ?auto_582831 ?auto_582832 ) ) ( not ( = ?auto_582831 ?auto_582833 ) ) ( not ( = ?auto_582831 ?auto_582834 ) ) ( not ( = ?auto_582831 ?auto_582835 ) ) ( not ( = ?auto_582831 ?auto_582836 ) ) ( not ( = ?auto_582832 ?auto_582833 ) ) ( not ( = ?auto_582832 ?auto_582834 ) ) ( not ( = ?auto_582832 ?auto_582835 ) ) ( not ( = ?auto_582832 ?auto_582836 ) ) ( not ( = ?auto_582833 ?auto_582834 ) ) ( not ( = ?auto_582833 ?auto_582835 ) ) ( not ( = ?auto_582833 ?auto_582836 ) ) ( not ( = ?auto_582834 ?auto_582835 ) ) ( not ( = ?auto_582834 ?auto_582836 ) ) ( not ( = ?auto_582835 ?auto_582836 ) ) ( ON ?auto_582834 ?auto_582835 ) ( ON ?auto_582833 ?auto_582834 ) ( ON ?auto_582832 ?auto_582833 ) ( ON ?auto_582831 ?auto_582832 ) ( ON ?auto_582830 ?auto_582831 ) ( ON ?auto_582829 ?auto_582830 ) ( ON ?auto_582828 ?auto_582829 ) ( ON ?auto_582827 ?auto_582828 ) ( ON ?auto_582826 ?auto_582827 ) ( ON ?auto_582825 ?auto_582826 ) ( CLEAR ?auto_582823 ) ( ON ?auto_582824 ?auto_582825 ) ( CLEAR ?auto_582824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_582821 ?auto_582822 ?auto_582823 ?auto_582824 )
      ( MAKE-15PILE ?auto_582821 ?auto_582822 ?auto_582823 ?auto_582824 ?auto_582825 ?auto_582826 ?auto_582827 ?auto_582828 ?auto_582829 ?auto_582830 ?auto_582831 ?auto_582832 ?auto_582833 ?auto_582834 ?auto_582835 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582883 - BLOCK
      ?auto_582884 - BLOCK
      ?auto_582885 - BLOCK
      ?auto_582886 - BLOCK
      ?auto_582887 - BLOCK
      ?auto_582888 - BLOCK
      ?auto_582889 - BLOCK
      ?auto_582890 - BLOCK
      ?auto_582891 - BLOCK
      ?auto_582892 - BLOCK
      ?auto_582893 - BLOCK
      ?auto_582894 - BLOCK
      ?auto_582895 - BLOCK
      ?auto_582896 - BLOCK
      ?auto_582897 - BLOCK
    )
    :vars
    (
      ?auto_582898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582897 ?auto_582898 ) ( ON-TABLE ?auto_582883 ) ( ON ?auto_582884 ?auto_582883 ) ( not ( = ?auto_582883 ?auto_582884 ) ) ( not ( = ?auto_582883 ?auto_582885 ) ) ( not ( = ?auto_582883 ?auto_582886 ) ) ( not ( = ?auto_582883 ?auto_582887 ) ) ( not ( = ?auto_582883 ?auto_582888 ) ) ( not ( = ?auto_582883 ?auto_582889 ) ) ( not ( = ?auto_582883 ?auto_582890 ) ) ( not ( = ?auto_582883 ?auto_582891 ) ) ( not ( = ?auto_582883 ?auto_582892 ) ) ( not ( = ?auto_582883 ?auto_582893 ) ) ( not ( = ?auto_582883 ?auto_582894 ) ) ( not ( = ?auto_582883 ?auto_582895 ) ) ( not ( = ?auto_582883 ?auto_582896 ) ) ( not ( = ?auto_582883 ?auto_582897 ) ) ( not ( = ?auto_582883 ?auto_582898 ) ) ( not ( = ?auto_582884 ?auto_582885 ) ) ( not ( = ?auto_582884 ?auto_582886 ) ) ( not ( = ?auto_582884 ?auto_582887 ) ) ( not ( = ?auto_582884 ?auto_582888 ) ) ( not ( = ?auto_582884 ?auto_582889 ) ) ( not ( = ?auto_582884 ?auto_582890 ) ) ( not ( = ?auto_582884 ?auto_582891 ) ) ( not ( = ?auto_582884 ?auto_582892 ) ) ( not ( = ?auto_582884 ?auto_582893 ) ) ( not ( = ?auto_582884 ?auto_582894 ) ) ( not ( = ?auto_582884 ?auto_582895 ) ) ( not ( = ?auto_582884 ?auto_582896 ) ) ( not ( = ?auto_582884 ?auto_582897 ) ) ( not ( = ?auto_582884 ?auto_582898 ) ) ( not ( = ?auto_582885 ?auto_582886 ) ) ( not ( = ?auto_582885 ?auto_582887 ) ) ( not ( = ?auto_582885 ?auto_582888 ) ) ( not ( = ?auto_582885 ?auto_582889 ) ) ( not ( = ?auto_582885 ?auto_582890 ) ) ( not ( = ?auto_582885 ?auto_582891 ) ) ( not ( = ?auto_582885 ?auto_582892 ) ) ( not ( = ?auto_582885 ?auto_582893 ) ) ( not ( = ?auto_582885 ?auto_582894 ) ) ( not ( = ?auto_582885 ?auto_582895 ) ) ( not ( = ?auto_582885 ?auto_582896 ) ) ( not ( = ?auto_582885 ?auto_582897 ) ) ( not ( = ?auto_582885 ?auto_582898 ) ) ( not ( = ?auto_582886 ?auto_582887 ) ) ( not ( = ?auto_582886 ?auto_582888 ) ) ( not ( = ?auto_582886 ?auto_582889 ) ) ( not ( = ?auto_582886 ?auto_582890 ) ) ( not ( = ?auto_582886 ?auto_582891 ) ) ( not ( = ?auto_582886 ?auto_582892 ) ) ( not ( = ?auto_582886 ?auto_582893 ) ) ( not ( = ?auto_582886 ?auto_582894 ) ) ( not ( = ?auto_582886 ?auto_582895 ) ) ( not ( = ?auto_582886 ?auto_582896 ) ) ( not ( = ?auto_582886 ?auto_582897 ) ) ( not ( = ?auto_582886 ?auto_582898 ) ) ( not ( = ?auto_582887 ?auto_582888 ) ) ( not ( = ?auto_582887 ?auto_582889 ) ) ( not ( = ?auto_582887 ?auto_582890 ) ) ( not ( = ?auto_582887 ?auto_582891 ) ) ( not ( = ?auto_582887 ?auto_582892 ) ) ( not ( = ?auto_582887 ?auto_582893 ) ) ( not ( = ?auto_582887 ?auto_582894 ) ) ( not ( = ?auto_582887 ?auto_582895 ) ) ( not ( = ?auto_582887 ?auto_582896 ) ) ( not ( = ?auto_582887 ?auto_582897 ) ) ( not ( = ?auto_582887 ?auto_582898 ) ) ( not ( = ?auto_582888 ?auto_582889 ) ) ( not ( = ?auto_582888 ?auto_582890 ) ) ( not ( = ?auto_582888 ?auto_582891 ) ) ( not ( = ?auto_582888 ?auto_582892 ) ) ( not ( = ?auto_582888 ?auto_582893 ) ) ( not ( = ?auto_582888 ?auto_582894 ) ) ( not ( = ?auto_582888 ?auto_582895 ) ) ( not ( = ?auto_582888 ?auto_582896 ) ) ( not ( = ?auto_582888 ?auto_582897 ) ) ( not ( = ?auto_582888 ?auto_582898 ) ) ( not ( = ?auto_582889 ?auto_582890 ) ) ( not ( = ?auto_582889 ?auto_582891 ) ) ( not ( = ?auto_582889 ?auto_582892 ) ) ( not ( = ?auto_582889 ?auto_582893 ) ) ( not ( = ?auto_582889 ?auto_582894 ) ) ( not ( = ?auto_582889 ?auto_582895 ) ) ( not ( = ?auto_582889 ?auto_582896 ) ) ( not ( = ?auto_582889 ?auto_582897 ) ) ( not ( = ?auto_582889 ?auto_582898 ) ) ( not ( = ?auto_582890 ?auto_582891 ) ) ( not ( = ?auto_582890 ?auto_582892 ) ) ( not ( = ?auto_582890 ?auto_582893 ) ) ( not ( = ?auto_582890 ?auto_582894 ) ) ( not ( = ?auto_582890 ?auto_582895 ) ) ( not ( = ?auto_582890 ?auto_582896 ) ) ( not ( = ?auto_582890 ?auto_582897 ) ) ( not ( = ?auto_582890 ?auto_582898 ) ) ( not ( = ?auto_582891 ?auto_582892 ) ) ( not ( = ?auto_582891 ?auto_582893 ) ) ( not ( = ?auto_582891 ?auto_582894 ) ) ( not ( = ?auto_582891 ?auto_582895 ) ) ( not ( = ?auto_582891 ?auto_582896 ) ) ( not ( = ?auto_582891 ?auto_582897 ) ) ( not ( = ?auto_582891 ?auto_582898 ) ) ( not ( = ?auto_582892 ?auto_582893 ) ) ( not ( = ?auto_582892 ?auto_582894 ) ) ( not ( = ?auto_582892 ?auto_582895 ) ) ( not ( = ?auto_582892 ?auto_582896 ) ) ( not ( = ?auto_582892 ?auto_582897 ) ) ( not ( = ?auto_582892 ?auto_582898 ) ) ( not ( = ?auto_582893 ?auto_582894 ) ) ( not ( = ?auto_582893 ?auto_582895 ) ) ( not ( = ?auto_582893 ?auto_582896 ) ) ( not ( = ?auto_582893 ?auto_582897 ) ) ( not ( = ?auto_582893 ?auto_582898 ) ) ( not ( = ?auto_582894 ?auto_582895 ) ) ( not ( = ?auto_582894 ?auto_582896 ) ) ( not ( = ?auto_582894 ?auto_582897 ) ) ( not ( = ?auto_582894 ?auto_582898 ) ) ( not ( = ?auto_582895 ?auto_582896 ) ) ( not ( = ?auto_582895 ?auto_582897 ) ) ( not ( = ?auto_582895 ?auto_582898 ) ) ( not ( = ?auto_582896 ?auto_582897 ) ) ( not ( = ?auto_582896 ?auto_582898 ) ) ( not ( = ?auto_582897 ?auto_582898 ) ) ( ON ?auto_582896 ?auto_582897 ) ( ON ?auto_582895 ?auto_582896 ) ( ON ?auto_582894 ?auto_582895 ) ( ON ?auto_582893 ?auto_582894 ) ( ON ?auto_582892 ?auto_582893 ) ( ON ?auto_582891 ?auto_582892 ) ( ON ?auto_582890 ?auto_582891 ) ( ON ?auto_582889 ?auto_582890 ) ( ON ?auto_582888 ?auto_582889 ) ( ON ?auto_582887 ?auto_582888 ) ( ON ?auto_582886 ?auto_582887 ) ( CLEAR ?auto_582884 ) ( ON ?auto_582885 ?auto_582886 ) ( CLEAR ?auto_582885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_582883 ?auto_582884 ?auto_582885 )
      ( MAKE-15PILE ?auto_582883 ?auto_582884 ?auto_582885 ?auto_582886 ?auto_582887 ?auto_582888 ?auto_582889 ?auto_582890 ?auto_582891 ?auto_582892 ?auto_582893 ?auto_582894 ?auto_582895 ?auto_582896 ?auto_582897 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_582945 - BLOCK
      ?auto_582946 - BLOCK
      ?auto_582947 - BLOCK
      ?auto_582948 - BLOCK
      ?auto_582949 - BLOCK
      ?auto_582950 - BLOCK
      ?auto_582951 - BLOCK
      ?auto_582952 - BLOCK
      ?auto_582953 - BLOCK
      ?auto_582954 - BLOCK
      ?auto_582955 - BLOCK
      ?auto_582956 - BLOCK
      ?auto_582957 - BLOCK
      ?auto_582958 - BLOCK
      ?auto_582959 - BLOCK
    )
    :vars
    (
      ?auto_582960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_582959 ?auto_582960 ) ( ON-TABLE ?auto_582945 ) ( not ( = ?auto_582945 ?auto_582946 ) ) ( not ( = ?auto_582945 ?auto_582947 ) ) ( not ( = ?auto_582945 ?auto_582948 ) ) ( not ( = ?auto_582945 ?auto_582949 ) ) ( not ( = ?auto_582945 ?auto_582950 ) ) ( not ( = ?auto_582945 ?auto_582951 ) ) ( not ( = ?auto_582945 ?auto_582952 ) ) ( not ( = ?auto_582945 ?auto_582953 ) ) ( not ( = ?auto_582945 ?auto_582954 ) ) ( not ( = ?auto_582945 ?auto_582955 ) ) ( not ( = ?auto_582945 ?auto_582956 ) ) ( not ( = ?auto_582945 ?auto_582957 ) ) ( not ( = ?auto_582945 ?auto_582958 ) ) ( not ( = ?auto_582945 ?auto_582959 ) ) ( not ( = ?auto_582945 ?auto_582960 ) ) ( not ( = ?auto_582946 ?auto_582947 ) ) ( not ( = ?auto_582946 ?auto_582948 ) ) ( not ( = ?auto_582946 ?auto_582949 ) ) ( not ( = ?auto_582946 ?auto_582950 ) ) ( not ( = ?auto_582946 ?auto_582951 ) ) ( not ( = ?auto_582946 ?auto_582952 ) ) ( not ( = ?auto_582946 ?auto_582953 ) ) ( not ( = ?auto_582946 ?auto_582954 ) ) ( not ( = ?auto_582946 ?auto_582955 ) ) ( not ( = ?auto_582946 ?auto_582956 ) ) ( not ( = ?auto_582946 ?auto_582957 ) ) ( not ( = ?auto_582946 ?auto_582958 ) ) ( not ( = ?auto_582946 ?auto_582959 ) ) ( not ( = ?auto_582946 ?auto_582960 ) ) ( not ( = ?auto_582947 ?auto_582948 ) ) ( not ( = ?auto_582947 ?auto_582949 ) ) ( not ( = ?auto_582947 ?auto_582950 ) ) ( not ( = ?auto_582947 ?auto_582951 ) ) ( not ( = ?auto_582947 ?auto_582952 ) ) ( not ( = ?auto_582947 ?auto_582953 ) ) ( not ( = ?auto_582947 ?auto_582954 ) ) ( not ( = ?auto_582947 ?auto_582955 ) ) ( not ( = ?auto_582947 ?auto_582956 ) ) ( not ( = ?auto_582947 ?auto_582957 ) ) ( not ( = ?auto_582947 ?auto_582958 ) ) ( not ( = ?auto_582947 ?auto_582959 ) ) ( not ( = ?auto_582947 ?auto_582960 ) ) ( not ( = ?auto_582948 ?auto_582949 ) ) ( not ( = ?auto_582948 ?auto_582950 ) ) ( not ( = ?auto_582948 ?auto_582951 ) ) ( not ( = ?auto_582948 ?auto_582952 ) ) ( not ( = ?auto_582948 ?auto_582953 ) ) ( not ( = ?auto_582948 ?auto_582954 ) ) ( not ( = ?auto_582948 ?auto_582955 ) ) ( not ( = ?auto_582948 ?auto_582956 ) ) ( not ( = ?auto_582948 ?auto_582957 ) ) ( not ( = ?auto_582948 ?auto_582958 ) ) ( not ( = ?auto_582948 ?auto_582959 ) ) ( not ( = ?auto_582948 ?auto_582960 ) ) ( not ( = ?auto_582949 ?auto_582950 ) ) ( not ( = ?auto_582949 ?auto_582951 ) ) ( not ( = ?auto_582949 ?auto_582952 ) ) ( not ( = ?auto_582949 ?auto_582953 ) ) ( not ( = ?auto_582949 ?auto_582954 ) ) ( not ( = ?auto_582949 ?auto_582955 ) ) ( not ( = ?auto_582949 ?auto_582956 ) ) ( not ( = ?auto_582949 ?auto_582957 ) ) ( not ( = ?auto_582949 ?auto_582958 ) ) ( not ( = ?auto_582949 ?auto_582959 ) ) ( not ( = ?auto_582949 ?auto_582960 ) ) ( not ( = ?auto_582950 ?auto_582951 ) ) ( not ( = ?auto_582950 ?auto_582952 ) ) ( not ( = ?auto_582950 ?auto_582953 ) ) ( not ( = ?auto_582950 ?auto_582954 ) ) ( not ( = ?auto_582950 ?auto_582955 ) ) ( not ( = ?auto_582950 ?auto_582956 ) ) ( not ( = ?auto_582950 ?auto_582957 ) ) ( not ( = ?auto_582950 ?auto_582958 ) ) ( not ( = ?auto_582950 ?auto_582959 ) ) ( not ( = ?auto_582950 ?auto_582960 ) ) ( not ( = ?auto_582951 ?auto_582952 ) ) ( not ( = ?auto_582951 ?auto_582953 ) ) ( not ( = ?auto_582951 ?auto_582954 ) ) ( not ( = ?auto_582951 ?auto_582955 ) ) ( not ( = ?auto_582951 ?auto_582956 ) ) ( not ( = ?auto_582951 ?auto_582957 ) ) ( not ( = ?auto_582951 ?auto_582958 ) ) ( not ( = ?auto_582951 ?auto_582959 ) ) ( not ( = ?auto_582951 ?auto_582960 ) ) ( not ( = ?auto_582952 ?auto_582953 ) ) ( not ( = ?auto_582952 ?auto_582954 ) ) ( not ( = ?auto_582952 ?auto_582955 ) ) ( not ( = ?auto_582952 ?auto_582956 ) ) ( not ( = ?auto_582952 ?auto_582957 ) ) ( not ( = ?auto_582952 ?auto_582958 ) ) ( not ( = ?auto_582952 ?auto_582959 ) ) ( not ( = ?auto_582952 ?auto_582960 ) ) ( not ( = ?auto_582953 ?auto_582954 ) ) ( not ( = ?auto_582953 ?auto_582955 ) ) ( not ( = ?auto_582953 ?auto_582956 ) ) ( not ( = ?auto_582953 ?auto_582957 ) ) ( not ( = ?auto_582953 ?auto_582958 ) ) ( not ( = ?auto_582953 ?auto_582959 ) ) ( not ( = ?auto_582953 ?auto_582960 ) ) ( not ( = ?auto_582954 ?auto_582955 ) ) ( not ( = ?auto_582954 ?auto_582956 ) ) ( not ( = ?auto_582954 ?auto_582957 ) ) ( not ( = ?auto_582954 ?auto_582958 ) ) ( not ( = ?auto_582954 ?auto_582959 ) ) ( not ( = ?auto_582954 ?auto_582960 ) ) ( not ( = ?auto_582955 ?auto_582956 ) ) ( not ( = ?auto_582955 ?auto_582957 ) ) ( not ( = ?auto_582955 ?auto_582958 ) ) ( not ( = ?auto_582955 ?auto_582959 ) ) ( not ( = ?auto_582955 ?auto_582960 ) ) ( not ( = ?auto_582956 ?auto_582957 ) ) ( not ( = ?auto_582956 ?auto_582958 ) ) ( not ( = ?auto_582956 ?auto_582959 ) ) ( not ( = ?auto_582956 ?auto_582960 ) ) ( not ( = ?auto_582957 ?auto_582958 ) ) ( not ( = ?auto_582957 ?auto_582959 ) ) ( not ( = ?auto_582957 ?auto_582960 ) ) ( not ( = ?auto_582958 ?auto_582959 ) ) ( not ( = ?auto_582958 ?auto_582960 ) ) ( not ( = ?auto_582959 ?auto_582960 ) ) ( ON ?auto_582958 ?auto_582959 ) ( ON ?auto_582957 ?auto_582958 ) ( ON ?auto_582956 ?auto_582957 ) ( ON ?auto_582955 ?auto_582956 ) ( ON ?auto_582954 ?auto_582955 ) ( ON ?auto_582953 ?auto_582954 ) ( ON ?auto_582952 ?auto_582953 ) ( ON ?auto_582951 ?auto_582952 ) ( ON ?auto_582950 ?auto_582951 ) ( ON ?auto_582949 ?auto_582950 ) ( ON ?auto_582948 ?auto_582949 ) ( ON ?auto_582947 ?auto_582948 ) ( CLEAR ?auto_582945 ) ( ON ?auto_582946 ?auto_582947 ) ( CLEAR ?auto_582946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_582945 ?auto_582946 )
      ( MAKE-15PILE ?auto_582945 ?auto_582946 ?auto_582947 ?auto_582948 ?auto_582949 ?auto_582950 ?auto_582951 ?auto_582952 ?auto_582953 ?auto_582954 ?auto_582955 ?auto_582956 ?auto_582957 ?auto_582958 ?auto_582959 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_583007 - BLOCK
      ?auto_583008 - BLOCK
      ?auto_583009 - BLOCK
      ?auto_583010 - BLOCK
      ?auto_583011 - BLOCK
      ?auto_583012 - BLOCK
      ?auto_583013 - BLOCK
      ?auto_583014 - BLOCK
      ?auto_583015 - BLOCK
      ?auto_583016 - BLOCK
      ?auto_583017 - BLOCK
      ?auto_583018 - BLOCK
      ?auto_583019 - BLOCK
      ?auto_583020 - BLOCK
      ?auto_583021 - BLOCK
    )
    :vars
    (
      ?auto_583022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583021 ?auto_583022 ) ( not ( = ?auto_583007 ?auto_583008 ) ) ( not ( = ?auto_583007 ?auto_583009 ) ) ( not ( = ?auto_583007 ?auto_583010 ) ) ( not ( = ?auto_583007 ?auto_583011 ) ) ( not ( = ?auto_583007 ?auto_583012 ) ) ( not ( = ?auto_583007 ?auto_583013 ) ) ( not ( = ?auto_583007 ?auto_583014 ) ) ( not ( = ?auto_583007 ?auto_583015 ) ) ( not ( = ?auto_583007 ?auto_583016 ) ) ( not ( = ?auto_583007 ?auto_583017 ) ) ( not ( = ?auto_583007 ?auto_583018 ) ) ( not ( = ?auto_583007 ?auto_583019 ) ) ( not ( = ?auto_583007 ?auto_583020 ) ) ( not ( = ?auto_583007 ?auto_583021 ) ) ( not ( = ?auto_583007 ?auto_583022 ) ) ( not ( = ?auto_583008 ?auto_583009 ) ) ( not ( = ?auto_583008 ?auto_583010 ) ) ( not ( = ?auto_583008 ?auto_583011 ) ) ( not ( = ?auto_583008 ?auto_583012 ) ) ( not ( = ?auto_583008 ?auto_583013 ) ) ( not ( = ?auto_583008 ?auto_583014 ) ) ( not ( = ?auto_583008 ?auto_583015 ) ) ( not ( = ?auto_583008 ?auto_583016 ) ) ( not ( = ?auto_583008 ?auto_583017 ) ) ( not ( = ?auto_583008 ?auto_583018 ) ) ( not ( = ?auto_583008 ?auto_583019 ) ) ( not ( = ?auto_583008 ?auto_583020 ) ) ( not ( = ?auto_583008 ?auto_583021 ) ) ( not ( = ?auto_583008 ?auto_583022 ) ) ( not ( = ?auto_583009 ?auto_583010 ) ) ( not ( = ?auto_583009 ?auto_583011 ) ) ( not ( = ?auto_583009 ?auto_583012 ) ) ( not ( = ?auto_583009 ?auto_583013 ) ) ( not ( = ?auto_583009 ?auto_583014 ) ) ( not ( = ?auto_583009 ?auto_583015 ) ) ( not ( = ?auto_583009 ?auto_583016 ) ) ( not ( = ?auto_583009 ?auto_583017 ) ) ( not ( = ?auto_583009 ?auto_583018 ) ) ( not ( = ?auto_583009 ?auto_583019 ) ) ( not ( = ?auto_583009 ?auto_583020 ) ) ( not ( = ?auto_583009 ?auto_583021 ) ) ( not ( = ?auto_583009 ?auto_583022 ) ) ( not ( = ?auto_583010 ?auto_583011 ) ) ( not ( = ?auto_583010 ?auto_583012 ) ) ( not ( = ?auto_583010 ?auto_583013 ) ) ( not ( = ?auto_583010 ?auto_583014 ) ) ( not ( = ?auto_583010 ?auto_583015 ) ) ( not ( = ?auto_583010 ?auto_583016 ) ) ( not ( = ?auto_583010 ?auto_583017 ) ) ( not ( = ?auto_583010 ?auto_583018 ) ) ( not ( = ?auto_583010 ?auto_583019 ) ) ( not ( = ?auto_583010 ?auto_583020 ) ) ( not ( = ?auto_583010 ?auto_583021 ) ) ( not ( = ?auto_583010 ?auto_583022 ) ) ( not ( = ?auto_583011 ?auto_583012 ) ) ( not ( = ?auto_583011 ?auto_583013 ) ) ( not ( = ?auto_583011 ?auto_583014 ) ) ( not ( = ?auto_583011 ?auto_583015 ) ) ( not ( = ?auto_583011 ?auto_583016 ) ) ( not ( = ?auto_583011 ?auto_583017 ) ) ( not ( = ?auto_583011 ?auto_583018 ) ) ( not ( = ?auto_583011 ?auto_583019 ) ) ( not ( = ?auto_583011 ?auto_583020 ) ) ( not ( = ?auto_583011 ?auto_583021 ) ) ( not ( = ?auto_583011 ?auto_583022 ) ) ( not ( = ?auto_583012 ?auto_583013 ) ) ( not ( = ?auto_583012 ?auto_583014 ) ) ( not ( = ?auto_583012 ?auto_583015 ) ) ( not ( = ?auto_583012 ?auto_583016 ) ) ( not ( = ?auto_583012 ?auto_583017 ) ) ( not ( = ?auto_583012 ?auto_583018 ) ) ( not ( = ?auto_583012 ?auto_583019 ) ) ( not ( = ?auto_583012 ?auto_583020 ) ) ( not ( = ?auto_583012 ?auto_583021 ) ) ( not ( = ?auto_583012 ?auto_583022 ) ) ( not ( = ?auto_583013 ?auto_583014 ) ) ( not ( = ?auto_583013 ?auto_583015 ) ) ( not ( = ?auto_583013 ?auto_583016 ) ) ( not ( = ?auto_583013 ?auto_583017 ) ) ( not ( = ?auto_583013 ?auto_583018 ) ) ( not ( = ?auto_583013 ?auto_583019 ) ) ( not ( = ?auto_583013 ?auto_583020 ) ) ( not ( = ?auto_583013 ?auto_583021 ) ) ( not ( = ?auto_583013 ?auto_583022 ) ) ( not ( = ?auto_583014 ?auto_583015 ) ) ( not ( = ?auto_583014 ?auto_583016 ) ) ( not ( = ?auto_583014 ?auto_583017 ) ) ( not ( = ?auto_583014 ?auto_583018 ) ) ( not ( = ?auto_583014 ?auto_583019 ) ) ( not ( = ?auto_583014 ?auto_583020 ) ) ( not ( = ?auto_583014 ?auto_583021 ) ) ( not ( = ?auto_583014 ?auto_583022 ) ) ( not ( = ?auto_583015 ?auto_583016 ) ) ( not ( = ?auto_583015 ?auto_583017 ) ) ( not ( = ?auto_583015 ?auto_583018 ) ) ( not ( = ?auto_583015 ?auto_583019 ) ) ( not ( = ?auto_583015 ?auto_583020 ) ) ( not ( = ?auto_583015 ?auto_583021 ) ) ( not ( = ?auto_583015 ?auto_583022 ) ) ( not ( = ?auto_583016 ?auto_583017 ) ) ( not ( = ?auto_583016 ?auto_583018 ) ) ( not ( = ?auto_583016 ?auto_583019 ) ) ( not ( = ?auto_583016 ?auto_583020 ) ) ( not ( = ?auto_583016 ?auto_583021 ) ) ( not ( = ?auto_583016 ?auto_583022 ) ) ( not ( = ?auto_583017 ?auto_583018 ) ) ( not ( = ?auto_583017 ?auto_583019 ) ) ( not ( = ?auto_583017 ?auto_583020 ) ) ( not ( = ?auto_583017 ?auto_583021 ) ) ( not ( = ?auto_583017 ?auto_583022 ) ) ( not ( = ?auto_583018 ?auto_583019 ) ) ( not ( = ?auto_583018 ?auto_583020 ) ) ( not ( = ?auto_583018 ?auto_583021 ) ) ( not ( = ?auto_583018 ?auto_583022 ) ) ( not ( = ?auto_583019 ?auto_583020 ) ) ( not ( = ?auto_583019 ?auto_583021 ) ) ( not ( = ?auto_583019 ?auto_583022 ) ) ( not ( = ?auto_583020 ?auto_583021 ) ) ( not ( = ?auto_583020 ?auto_583022 ) ) ( not ( = ?auto_583021 ?auto_583022 ) ) ( ON ?auto_583020 ?auto_583021 ) ( ON ?auto_583019 ?auto_583020 ) ( ON ?auto_583018 ?auto_583019 ) ( ON ?auto_583017 ?auto_583018 ) ( ON ?auto_583016 ?auto_583017 ) ( ON ?auto_583015 ?auto_583016 ) ( ON ?auto_583014 ?auto_583015 ) ( ON ?auto_583013 ?auto_583014 ) ( ON ?auto_583012 ?auto_583013 ) ( ON ?auto_583011 ?auto_583012 ) ( ON ?auto_583010 ?auto_583011 ) ( ON ?auto_583009 ?auto_583010 ) ( ON ?auto_583008 ?auto_583009 ) ( ON ?auto_583007 ?auto_583008 ) ( CLEAR ?auto_583007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_583007 )
      ( MAKE-15PILE ?auto_583007 ?auto_583008 ?auto_583009 ?auto_583010 ?auto_583011 ?auto_583012 ?auto_583013 ?auto_583014 ?auto_583015 ?auto_583016 ?auto_583017 ?auto_583018 ?auto_583019 ?auto_583020 ?auto_583021 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583070 - BLOCK
      ?auto_583071 - BLOCK
      ?auto_583072 - BLOCK
      ?auto_583073 - BLOCK
      ?auto_583074 - BLOCK
      ?auto_583075 - BLOCK
      ?auto_583076 - BLOCK
      ?auto_583077 - BLOCK
      ?auto_583078 - BLOCK
      ?auto_583079 - BLOCK
      ?auto_583080 - BLOCK
      ?auto_583081 - BLOCK
      ?auto_583082 - BLOCK
      ?auto_583083 - BLOCK
      ?auto_583084 - BLOCK
      ?auto_583085 - BLOCK
    )
    :vars
    (
      ?auto_583086 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_583084 ) ( ON ?auto_583085 ?auto_583086 ) ( CLEAR ?auto_583085 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_583070 ) ( ON ?auto_583071 ?auto_583070 ) ( ON ?auto_583072 ?auto_583071 ) ( ON ?auto_583073 ?auto_583072 ) ( ON ?auto_583074 ?auto_583073 ) ( ON ?auto_583075 ?auto_583074 ) ( ON ?auto_583076 ?auto_583075 ) ( ON ?auto_583077 ?auto_583076 ) ( ON ?auto_583078 ?auto_583077 ) ( ON ?auto_583079 ?auto_583078 ) ( ON ?auto_583080 ?auto_583079 ) ( ON ?auto_583081 ?auto_583080 ) ( ON ?auto_583082 ?auto_583081 ) ( ON ?auto_583083 ?auto_583082 ) ( ON ?auto_583084 ?auto_583083 ) ( not ( = ?auto_583070 ?auto_583071 ) ) ( not ( = ?auto_583070 ?auto_583072 ) ) ( not ( = ?auto_583070 ?auto_583073 ) ) ( not ( = ?auto_583070 ?auto_583074 ) ) ( not ( = ?auto_583070 ?auto_583075 ) ) ( not ( = ?auto_583070 ?auto_583076 ) ) ( not ( = ?auto_583070 ?auto_583077 ) ) ( not ( = ?auto_583070 ?auto_583078 ) ) ( not ( = ?auto_583070 ?auto_583079 ) ) ( not ( = ?auto_583070 ?auto_583080 ) ) ( not ( = ?auto_583070 ?auto_583081 ) ) ( not ( = ?auto_583070 ?auto_583082 ) ) ( not ( = ?auto_583070 ?auto_583083 ) ) ( not ( = ?auto_583070 ?auto_583084 ) ) ( not ( = ?auto_583070 ?auto_583085 ) ) ( not ( = ?auto_583070 ?auto_583086 ) ) ( not ( = ?auto_583071 ?auto_583072 ) ) ( not ( = ?auto_583071 ?auto_583073 ) ) ( not ( = ?auto_583071 ?auto_583074 ) ) ( not ( = ?auto_583071 ?auto_583075 ) ) ( not ( = ?auto_583071 ?auto_583076 ) ) ( not ( = ?auto_583071 ?auto_583077 ) ) ( not ( = ?auto_583071 ?auto_583078 ) ) ( not ( = ?auto_583071 ?auto_583079 ) ) ( not ( = ?auto_583071 ?auto_583080 ) ) ( not ( = ?auto_583071 ?auto_583081 ) ) ( not ( = ?auto_583071 ?auto_583082 ) ) ( not ( = ?auto_583071 ?auto_583083 ) ) ( not ( = ?auto_583071 ?auto_583084 ) ) ( not ( = ?auto_583071 ?auto_583085 ) ) ( not ( = ?auto_583071 ?auto_583086 ) ) ( not ( = ?auto_583072 ?auto_583073 ) ) ( not ( = ?auto_583072 ?auto_583074 ) ) ( not ( = ?auto_583072 ?auto_583075 ) ) ( not ( = ?auto_583072 ?auto_583076 ) ) ( not ( = ?auto_583072 ?auto_583077 ) ) ( not ( = ?auto_583072 ?auto_583078 ) ) ( not ( = ?auto_583072 ?auto_583079 ) ) ( not ( = ?auto_583072 ?auto_583080 ) ) ( not ( = ?auto_583072 ?auto_583081 ) ) ( not ( = ?auto_583072 ?auto_583082 ) ) ( not ( = ?auto_583072 ?auto_583083 ) ) ( not ( = ?auto_583072 ?auto_583084 ) ) ( not ( = ?auto_583072 ?auto_583085 ) ) ( not ( = ?auto_583072 ?auto_583086 ) ) ( not ( = ?auto_583073 ?auto_583074 ) ) ( not ( = ?auto_583073 ?auto_583075 ) ) ( not ( = ?auto_583073 ?auto_583076 ) ) ( not ( = ?auto_583073 ?auto_583077 ) ) ( not ( = ?auto_583073 ?auto_583078 ) ) ( not ( = ?auto_583073 ?auto_583079 ) ) ( not ( = ?auto_583073 ?auto_583080 ) ) ( not ( = ?auto_583073 ?auto_583081 ) ) ( not ( = ?auto_583073 ?auto_583082 ) ) ( not ( = ?auto_583073 ?auto_583083 ) ) ( not ( = ?auto_583073 ?auto_583084 ) ) ( not ( = ?auto_583073 ?auto_583085 ) ) ( not ( = ?auto_583073 ?auto_583086 ) ) ( not ( = ?auto_583074 ?auto_583075 ) ) ( not ( = ?auto_583074 ?auto_583076 ) ) ( not ( = ?auto_583074 ?auto_583077 ) ) ( not ( = ?auto_583074 ?auto_583078 ) ) ( not ( = ?auto_583074 ?auto_583079 ) ) ( not ( = ?auto_583074 ?auto_583080 ) ) ( not ( = ?auto_583074 ?auto_583081 ) ) ( not ( = ?auto_583074 ?auto_583082 ) ) ( not ( = ?auto_583074 ?auto_583083 ) ) ( not ( = ?auto_583074 ?auto_583084 ) ) ( not ( = ?auto_583074 ?auto_583085 ) ) ( not ( = ?auto_583074 ?auto_583086 ) ) ( not ( = ?auto_583075 ?auto_583076 ) ) ( not ( = ?auto_583075 ?auto_583077 ) ) ( not ( = ?auto_583075 ?auto_583078 ) ) ( not ( = ?auto_583075 ?auto_583079 ) ) ( not ( = ?auto_583075 ?auto_583080 ) ) ( not ( = ?auto_583075 ?auto_583081 ) ) ( not ( = ?auto_583075 ?auto_583082 ) ) ( not ( = ?auto_583075 ?auto_583083 ) ) ( not ( = ?auto_583075 ?auto_583084 ) ) ( not ( = ?auto_583075 ?auto_583085 ) ) ( not ( = ?auto_583075 ?auto_583086 ) ) ( not ( = ?auto_583076 ?auto_583077 ) ) ( not ( = ?auto_583076 ?auto_583078 ) ) ( not ( = ?auto_583076 ?auto_583079 ) ) ( not ( = ?auto_583076 ?auto_583080 ) ) ( not ( = ?auto_583076 ?auto_583081 ) ) ( not ( = ?auto_583076 ?auto_583082 ) ) ( not ( = ?auto_583076 ?auto_583083 ) ) ( not ( = ?auto_583076 ?auto_583084 ) ) ( not ( = ?auto_583076 ?auto_583085 ) ) ( not ( = ?auto_583076 ?auto_583086 ) ) ( not ( = ?auto_583077 ?auto_583078 ) ) ( not ( = ?auto_583077 ?auto_583079 ) ) ( not ( = ?auto_583077 ?auto_583080 ) ) ( not ( = ?auto_583077 ?auto_583081 ) ) ( not ( = ?auto_583077 ?auto_583082 ) ) ( not ( = ?auto_583077 ?auto_583083 ) ) ( not ( = ?auto_583077 ?auto_583084 ) ) ( not ( = ?auto_583077 ?auto_583085 ) ) ( not ( = ?auto_583077 ?auto_583086 ) ) ( not ( = ?auto_583078 ?auto_583079 ) ) ( not ( = ?auto_583078 ?auto_583080 ) ) ( not ( = ?auto_583078 ?auto_583081 ) ) ( not ( = ?auto_583078 ?auto_583082 ) ) ( not ( = ?auto_583078 ?auto_583083 ) ) ( not ( = ?auto_583078 ?auto_583084 ) ) ( not ( = ?auto_583078 ?auto_583085 ) ) ( not ( = ?auto_583078 ?auto_583086 ) ) ( not ( = ?auto_583079 ?auto_583080 ) ) ( not ( = ?auto_583079 ?auto_583081 ) ) ( not ( = ?auto_583079 ?auto_583082 ) ) ( not ( = ?auto_583079 ?auto_583083 ) ) ( not ( = ?auto_583079 ?auto_583084 ) ) ( not ( = ?auto_583079 ?auto_583085 ) ) ( not ( = ?auto_583079 ?auto_583086 ) ) ( not ( = ?auto_583080 ?auto_583081 ) ) ( not ( = ?auto_583080 ?auto_583082 ) ) ( not ( = ?auto_583080 ?auto_583083 ) ) ( not ( = ?auto_583080 ?auto_583084 ) ) ( not ( = ?auto_583080 ?auto_583085 ) ) ( not ( = ?auto_583080 ?auto_583086 ) ) ( not ( = ?auto_583081 ?auto_583082 ) ) ( not ( = ?auto_583081 ?auto_583083 ) ) ( not ( = ?auto_583081 ?auto_583084 ) ) ( not ( = ?auto_583081 ?auto_583085 ) ) ( not ( = ?auto_583081 ?auto_583086 ) ) ( not ( = ?auto_583082 ?auto_583083 ) ) ( not ( = ?auto_583082 ?auto_583084 ) ) ( not ( = ?auto_583082 ?auto_583085 ) ) ( not ( = ?auto_583082 ?auto_583086 ) ) ( not ( = ?auto_583083 ?auto_583084 ) ) ( not ( = ?auto_583083 ?auto_583085 ) ) ( not ( = ?auto_583083 ?auto_583086 ) ) ( not ( = ?auto_583084 ?auto_583085 ) ) ( not ( = ?auto_583084 ?auto_583086 ) ) ( not ( = ?auto_583085 ?auto_583086 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_583085 ?auto_583086 )
      ( !STACK ?auto_583085 ?auto_583084 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583103 - BLOCK
      ?auto_583104 - BLOCK
      ?auto_583105 - BLOCK
      ?auto_583106 - BLOCK
      ?auto_583107 - BLOCK
      ?auto_583108 - BLOCK
      ?auto_583109 - BLOCK
      ?auto_583110 - BLOCK
      ?auto_583111 - BLOCK
      ?auto_583112 - BLOCK
      ?auto_583113 - BLOCK
      ?auto_583114 - BLOCK
      ?auto_583115 - BLOCK
      ?auto_583116 - BLOCK
      ?auto_583117 - BLOCK
      ?auto_583118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_583117 ) ( ON-TABLE ?auto_583118 ) ( CLEAR ?auto_583118 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_583103 ) ( ON ?auto_583104 ?auto_583103 ) ( ON ?auto_583105 ?auto_583104 ) ( ON ?auto_583106 ?auto_583105 ) ( ON ?auto_583107 ?auto_583106 ) ( ON ?auto_583108 ?auto_583107 ) ( ON ?auto_583109 ?auto_583108 ) ( ON ?auto_583110 ?auto_583109 ) ( ON ?auto_583111 ?auto_583110 ) ( ON ?auto_583112 ?auto_583111 ) ( ON ?auto_583113 ?auto_583112 ) ( ON ?auto_583114 ?auto_583113 ) ( ON ?auto_583115 ?auto_583114 ) ( ON ?auto_583116 ?auto_583115 ) ( ON ?auto_583117 ?auto_583116 ) ( not ( = ?auto_583103 ?auto_583104 ) ) ( not ( = ?auto_583103 ?auto_583105 ) ) ( not ( = ?auto_583103 ?auto_583106 ) ) ( not ( = ?auto_583103 ?auto_583107 ) ) ( not ( = ?auto_583103 ?auto_583108 ) ) ( not ( = ?auto_583103 ?auto_583109 ) ) ( not ( = ?auto_583103 ?auto_583110 ) ) ( not ( = ?auto_583103 ?auto_583111 ) ) ( not ( = ?auto_583103 ?auto_583112 ) ) ( not ( = ?auto_583103 ?auto_583113 ) ) ( not ( = ?auto_583103 ?auto_583114 ) ) ( not ( = ?auto_583103 ?auto_583115 ) ) ( not ( = ?auto_583103 ?auto_583116 ) ) ( not ( = ?auto_583103 ?auto_583117 ) ) ( not ( = ?auto_583103 ?auto_583118 ) ) ( not ( = ?auto_583104 ?auto_583105 ) ) ( not ( = ?auto_583104 ?auto_583106 ) ) ( not ( = ?auto_583104 ?auto_583107 ) ) ( not ( = ?auto_583104 ?auto_583108 ) ) ( not ( = ?auto_583104 ?auto_583109 ) ) ( not ( = ?auto_583104 ?auto_583110 ) ) ( not ( = ?auto_583104 ?auto_583111 ) ) ( not ( = ?auto_583104 ?auto_583112 ) ) ( not ( = ?auto_583104 ?auto_583113 ) ) ( not ( = ?auto_583104 ?auto_583114 ) ) ( not ( = ?auto_583104 ?auto_583115 ) ) ( not ( = ?auto_583104 ?auto_583116 ) ) ( not ( = ?auto_583104 ?auto_583117 ) ) ( not ( = ?auto_583104 ?auto_583118 ) ) ( not ( = ?auto_583105 ?auto_583106 ) ) ( not ( = ?auto_583105 ?auto_583107 ) ) ( not ( = ?auto_583105 ?auto_583108 ) ) ( not ( = ?auto_583105 ?auto_583109 ) ) ( not ( = ?auto_583105 ?auto_583110 ) ) ( not ( = ?auto_583105 ?auto_583111 ) ) ( not ( = ?auto_583105 ?auto_583112 ) ) ( not ( = ?auto_583105 ?auto_583113 ) ) ( not ( = ?auto_583105 ?auto_583114 ) ) ( not ( = ?auto_583105 ?auto_583115 ) ) ( not ( = ?auto_583105 ?auto_583116 ) ) ( not ( = ?auto_583105 ?auto_583117 ) ) ( not ( = ?auto_583105 ?auto_583118 ) ) ( not ( = ?auto_583106 ?auto_583107 ) ) ( not ( = ?auto_583106 ?auto_583108 ) ) ( not ( = ?auto_583106 ?auto_583109 ) ) ( not ( = ?auto_583106 ?auto_583110 ) ) ( not ( = ?auto_583106 ?auto_583111 ) ) ( not ( = ?auto_583106 ?auto_583112 ) ) ( not ( = ?auto_583106 ?auto_583113 ) ) ( not ( = ?auto_583106 ?auto_583114 ) ) ( not ( = ?auto_583106 ?auto_583115 ) ) ( not ( = ?auto_583106 ?auto_583116 ) ) ( not ( = ?auto_583106 ?auto_583117 ) ) ( not ( = ?auto_583106 ?auto_583118 ) ) ( not ( = ?auto_583107 ?auto_583108 ) ) ( not ( = ?auto_583107 ?auto_583109 ) ) ( not ( = ?auto_583107 ?auto_583110 ) ) ( not ( = ?auto_583107 ?auto_583111 ) ) ( not ( = ?auto_583107 ?auto_583112 ) ) ( not ( = ?auto_583107 ?auto_583113 ) ) ( not ( = ?auto_583107 ?auto_583114 ) ) ( not ( = ?auto_583107 ?auto_583115 ) ) ( not ( = ?auto_583107 ?auto_583116 ) ) ( not ( = ?auto_583107 ?auto_583117 ) ) ( not ( = ?auto_583107 ?auto_583118 ) ) ( not ( = ?auto_583108 ?auto_583109 ) ) ( not ( = ?auto_583108 ?auto_583110 ) ) ( not ( = ?auto_583108 ?auto_583111 ) ) ( not ( = ?auto_583108 ?auto_583112 ) ) ( not ( = ?auto_583108 ?auto_583113 ) ) ( not ( = ?auto_583108 ?auto_583114 ) ) ( not ( = ?auto_583108 ?auto_583115 ) ) ( not ( = ?auto_583108 ?auto_583116 ) ) ( not ( = ?auto_583108 ?auto_583117 ) ) ( not ( = ?auto_583108 ?auto_583118 ) ) ( not ( = ?auto_583109 ?auto_583110 ) ) ( not ( = ?auto_583109 ?auto_583111 ) ) ( not ( = ?auto_583109 ?auto_583112 ) ) ( not ( = ?auto_583109 ?auto_583113 ) ) ( not ( = ?auto_583109 ?auto_583114 ) ) ( not ( = ?auto_583109 ?auto_583115 ) ) ( not ( = ?auto_583109 ?auto_583116 ) ) ( not ( = ?auto_583109 ?auto_583117 ) ) ( not ( = ?auto_583109 ?auto_583118 ) ) ( not ( = ?auto_583110 ?auto_583111 ) ) ( not ( = ?auto_583110 ?auto_583112 ) ) ( not ( = ?auto_583110 ?auto_583113 ) ) ( not ( = ?auto_583110 ?auto_583114 ) ) ( not ( = ?auto_583110 ?auto_583115 ) ) ( not ( = ?auto_583110 ?auto_583116 ) ) ( not ( = ?auto_583110 ?auto_583117 ) ) ( not ( = ?auto_583110 ?auto_583118 ) ) ( not ( = ?auto_583111 ?auto_583112 ) ) ( not ( = ?auto_583111 ?auto_583113 ) ) ( not ( = ?auto_583111 ?auto_583114 ) ) ( not ( = ?auto_583111 ?auto_583115 ) ) ( not ( = ?auto_583111 ?auto_583116 ) ) ( not ( = ?auto_583111 ?auto_583117 ) ) ( not ( = ?auto_583111 ?auto_583118 ) ) ( not ( = ?auto_583112 ?auto_583113 ) ) ( not ( = ?auto_583112 ?auto_583114 ) ) ( not ( = ?auto_583112 ?auto_583115 ) ) ( not ( = ?auto_583112 ?auto_583116 ) ) ( not ( = ?auto_583112 ?auto_583117 ) ) ( not ( = ?auto_583112 ?auto_583118 ) ) ( not ( = ?auto_583113 ?auto_583114 ) ) ( not ( = ?auto_583113 ?auto_583115 ) ) ( not ( = ?auto_583113 ?auto_583116 ) ) ( not ( = ?auto_583113 ?auto_583117 ) ) ( not ( = ?auto_583113 ?auto_583118 ) ) ( not ( = ?auto_583114 ?auto_583115 ) ) ( not ( = ?auto_583114 ?auto_583116 ) ) ( not ( = ?auto_583114 ?auto_583117 ) ) ( not ( = ?auto_583114 ?auto_583118 ) ) ( not ( = ?auto_583115 ?auto_583116 ) ) ( not ( = ?auto_583115 ?auto_583117 ) ) ( not ( = ?auto_583115 ?auto_583118 ) ) ( not ( = ?auto_583116 ?auto_583117 ) ) ( not ( = ?auto_583116 ?auto_583118 ) ) ( not ( = ?auto_583117 ?auto_583118 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_583118 )
      ( !STACK ?auto_583118 ?auto_583117 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583135 - BLOCK
      ?auto_583136 - BLOCK
      ?auto_583137 - BLOCK
      ?auto_583138 - BLOCK
      ?auto_583139 - BLOCK
      ?auto_583140 - BLOCK
      ?auto_583141 - BLOCK
      ?auto_583142 - BLOCK
      ?auto_583143 - BLOCK
      ?auto_583144 - BLOCK
      ?auto_583145 - BLOCK
      ?auto_583146 - BLOCK
      ?auto_583147 - BLOCK
      ?auto_583148 - BLOCK
      ?auto_583149 - BLOCK
      ?auto_583150 - BLOCK
    )
    :vars
    (
      ?auto_583151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583150 ?auto_583151 ) ( ON-TABLE ?auto_583135 ) ( ON ?auto_583136 ?auto_583135 ) ( ON ?auto_583137 ?auto_583136 ) ( ON ?auto_583138 ?auto_583137 ) ( ON ?auto_583139 ?auto_583138 ) ( ON ?auto_583140 ?auto_583139 ) ( ON ?auto_583141 ?auto_583140 ) ( ON ?auto_583142 ?auto_583141 ) ( ON ?auto_583143 ?auto_583142 ) ( ON ?auto_583144 ?auto_583143 ) ( ON ?auto_583145 ?auto_583144 ) ( ON ?auto_583146 ?auto_583145 ) ( ON ?auto_583147 ?auto_583146 ) ( ON ?auto_583148 ?auto_583147 ) ( not ( = ?auto_583135 ?auto_583136 ) ) ( not ( = ?auto_583135 ?auto_583137 ) ) ( not ( = ?auto_583135 ?auto_583138 ) ) ( not ( = ?auto_583135 ?auto_583139 ) ) ( not ( = ?auto_583135 ?auto_583140 ) ) ( not ( = ?auto_583135 ?auto_583141 ) ) ( not ( = ?auto_583135 ?auto_583142 ) ) ( not ( = ?auto_583135 ?auto_583143 ) ) ( not ( = ?auto_583135 ?auto_583144 ) ) ( not ( = ?auto_583135 ?auto_583145 ) ) ( not ( = ?auto_583135 ?auto_583146 ) ) ( not ( = ?auto_583135 ?auto_583147 ) ) ( not ( = ?auto_583135 ?auto_583148 ) ) ( not ( = ?auto_583135 ?auto_583149 ) ) ( not ( = ?auto_583135 ?auto_583150 ) ) ( not ( = ?auto_583135 ?auto_583151 ) ) ( not ( = ?auto_583136 ?auto_583137 ) ) ( not ( = ?auto_583136 ?auto_583138 ) ) ( not ( = ?auto_583136 ?auto_583139 ) ) ( not ( = ?auto_583136 ?auto_583140 ) ) ( not ( = ?auto_583136 ?auto_583141 ) ) ( not ( = ?auto_583136 ?auto_583142 ) ) ( not ( = ?auto_583136 ?auto_583143 ) ) ( not ( = ?auto_583136 ?auto_583144 ) ) ( not ( = ?auto_583136 ?auto_583145 ) ) ( not ( = ?auto_583136 ?auto_583146 ) ) ( not ( = ?auto_583136 ?auto_583147 ) ) ( not ( = ?auto_583136 ?auto_583148 ) ) ( not ( = ?auto_583136 ?auto_583149 ) ) ( not ( = ?auto_583136 ?auto_583150 ) ) ( not ( = ?auto_583136 ?auto_583151 ) ) ( not ( = ?auto_583137 ?auto_583138 ) ) ( not ( = ?auto_583137 ?auto_583139 ) ) ( not ( = ?auto_583137 ?auto_583140 ) ) ( not ( = ?auto_583137 ?auto_583141 ) ) ( not ( = ?auto_583137 ?auto_583142 ) ) ( not ( = ?auto_583137 ?auto_583143 ) ) ( not ( = ?auto_583137 ?auto_583144 ) ) ( not ( = ?auto_583137 ?auto_583145 ) ) ( not ( = ?auto_583137 ?auto_583146 ) ) ( not ( = ?auto_583137 ?auto_583147 ) ) ( not ( = ?auto_583137 ?auto_583148 ) ) ( not ( = ?auto_583137 ?auto_583149 ) ) ( not ( = ?auto_583137 ?auto_583150 ) ) ( not ( = ?auto_583137 ?auto_583151 ) ) ( not ( = ?auto_583138 ?auto_583139 ) ) ( not ( = ?auto_583138 ?auto_583140 ) ) ( not ( = ?auto_583138 ?auto_583141 ) ) ( not ( = ?auto_583138 ?auto_583142 ) ) ( not ( = ?auto_583138 ?auto_583143 ) ) ( not ( = ?auto_583138 ?auto_583144 ) ) ( not ( = ?auto_583138 ?auto_583145 ) ) ( not ( = ?auto_583138 ?auto_583146 ) ) ( not ( = ?auto_583138 ?auto_583147 ) ) ( not ( = ?auto_583138 ?auto_583148 ) ) ( not ( = ?auto_583138 ?auto_583149 ) ) ( not ( = ?auto_583138 ?auto_583150 ) ) ( not ( = ?auto_583138 ?auto_583151 ) ) ( not ( = ?auto_583139 ?auto_583140 ) ) ( not ( = ?auto_583139 ?auto_583141 ) ) ( not ( = ?auto_583139 ?auto_583142 ) ) ( not ( = ?auto_583139 ?auto_583143 ) ) ( not ( = ?auto_583139 ?auto_583144 ) ) ( not ( = ?auto_583139 ?auto_583145 ) ) ( not ( = ?auto_583139 ?auto_583146 ) ) ( not ( = ?auto_583139 ?auto_583147 ) ) ( not ( = ?auto_583139 ?auto_583148 ) ) ( not ( = ?auto_583139 ?auto_583149 ) ) ( not ( = ?auto_583139 ?auto_583150 ) ) ( not ( = ?auto_583139 ?auto_583151 ) ) ( not ( = ?auto_583140 ?auto_583141 ) ) ( not ( = ?auto_583140 ?auto_583142 ) ) ( not ( = ?auto_583140 ?auto_583143 ) ) ( not ( = ?auto_583140 ?auto_583144 ) ) ( not ( = ?auto_583140 ?auto_583145 ) ) ( not ( = ?auto_583140 ?auto_583146 ) ) ( not ( = ?auto_583140 ?auto_583147 ) ) ( not ( = ?auto_583140 ?auto_583148 ) ) ( not ( = ?auto_583140 ?auto_583149 ) ) ( not ( = ?auto_583140 ?auto_583150 ) ) ( not ( = ?auto_583140 ?auto_583151 ) ) ( not ( = ?auto_583141 ?auto_583142 ) ) ( not ( = ?auto_583141 ?auto_583143 ) ) ( not ( = ?auto_583141 ?auto_583144 ) ) ( not ( = ?auto_583141 ?auto_583145 ) ) ( not ( = ?auto_583141 ?auto_583146 ) ) ( not ( = ?auto_583141 ?auto_583147 ) ) ( not ( = ?auto_583141 ?auto_583148 ) ) ( not ( = ?auto_583141 ?auto_583149 ) ) ( not ( = ?auto_583141 ?auto_583150 ) ) ( not ( = ?auto_583141 ?auto_583151 ) ) ( not ( = ?auto_583142 ?auto_583143 ) ) ( not ( = ?auto_583142 ?auto_583144 ) ) ( not ( = ?auto_583142 ?auto_583145 ) ) ( not ( = ?auto_583142 ?auto_583146 ) ) ( not ( = ?auto_583142 ?auto_583147 ) ) ( not ( = ?auto_583142 ?auto_583148 ) ) ( not ( = ?auto_583142 ?auto_583149 ) ) ( not ( = ?auto_583142 ?auto_583150 ) ) ( not ( = ?auto_583142 ?auto_583151 ) ) ( not ( = ?auto_583143 ?auto_583144 ) ) ( not ( = ?auto_583143 ?auto_583145 ) ) ( not ( = ?auto_583143 ?auto_583146 ) ) ( not ( = ?auto_583143 ?auto_583147 ) ) ( not ( = ?auto_583143 ?auto_583148 ) ) ( not ( = ?auto_583143 ?auto_583149 ) ) ( not ( = ?auto_583143 ?auto_583150 ) ) ( not ( = ?auto_583143 ?auto_583151 ) ) ( not ( = ?auto_583144 ?auto_583145 ) ) ( not ( = ?auto_583144 ?auto_583146 ) ) ( not ( = ?auto_583144 ?auto_583147 ) ) ( not ( = ?auto_583144 ?auto_583148 ) ) ( not ( = ?auto_583144 ?auto_583149 ) ) ( not ( = ?auto_583144 ?auto_583150 ) ) ( not ( = ?auto_583144 ?auto_583151 ) ) ( not ( = ?auto_583145 ?auto_583146 ) ) ( not ( = ?auto_583145 ?auto_583147 ) ) ( not ( = ?auto_583145 ?auto_583148 ) ) ( not ( = ?auto_583145 ?auto_583149 ) ) ( not ( = ?auto_583145 ?auto_583150 ) ) ( not ( = ?auto_583145 ?auto_583151 ) ) ( not ( = ?auto_583146 ?auto_583147 ) ) ( not ( = ?auto_583146 ?auto_583148 ) ) ( not ( = ?auto_583146 ?auto_583149 ) ) ( not ( = ?auto_583146 ?auto_583150 ) ) ( not ( = ?auto_583146 ?auto_583151 ) ) ( not ( = ?auto_583147 ?auto_583148 ) ) ( not ( = ?auto_583147 ?auto_583149 ) ) ( not ( = ?auto_583147 ?auto_583150 ) ) ( not ( = ?auto_583147 ?auto_583151 ) ) ( not ( = ?auto_583148 ?auto_583149 ) ) ( not ( = ?auto_583148 ?auto_583150 ) ) ( not ( = ?auto_583148 ?auto_583151 ) ) ( not ( = ?auto_583149 ?auto_583150 ) ) ( not ( = ?auto_583149 ?auto_583151 ) ) ( not ( = ?auto_583150 ?auto_583151 ) ) ( CLEAR ?auto_583148 ) ( ON ?auto_583149 ?auto_583150 ) ( CLEAR ?auto_583149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_583135 ?auto_583136 ?auto_583137 ?auto_583138 ?auto_583139 ?auto_583140 ?auto_583141 ?auto_583142 ?auto_583143 ?auto_583144 ?auto_583145 ?auto_583146 ?auto_583147 ?auto_583148 ?auto_583149 )
      ( MAKE-16PILE ?auto_583135 ?auto_583136 ?auto_583137 ?auto_583138 ?auto_583139 ?auto_583140 ?auto_583141 ?auto_583142 ?auto_583143 ?auto_583144 ?auto_583145 ?auto_583146 ?auto_583147 ?auto_583148 ?auto_583149 ?auto_583150 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583168 - BLOCK
      ?auto_583169 - BLOCK
      ?auto_583170 - BLOCK
      ?auto_583171 - BLOCK
      ?auto_583172 - BLOCK
      ?auto_583173 - BLOCK
      ?auto_583174 - BLOCK
      ?auto_583175 - BLOCK
      ?auto_583176 - BLOCK
      ?auto_583177 - BLOCK
      ?auto_583178 - BLOCK
      ?auto_583179 - BLOCK
      ?auto_583180 - BLOCK
      ?auto_583181 - BLOCK
      ?auto_583182 - BLOCK
      ?auto_583183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_583183 ) ( ON-TABLE ?auto_583168 ) ( ON ?auto_583169 ?auto_583168 ) ( ON ?auto_583170 ?auto_583169 ) ( ON ?auto_583171 ?auto_583170 ) ( ON ?auto_583172 ?auto_583171 ) ( ON ?auto_583173 ?auto_583172 ) ( ON ?auto_583174 ?auto_583173 ) ( ON ?auto_583175 ?auto_583174 ) ( ON ?auto_583176 ?auto_583175 ) ( ON ?auto_583177 ?auto_583176 ) ( ON ?auto_583178 ?auto_583177 ) ( ON ?auto_583179 ?auto_583178 ) ( ON ?auto_583180 ?auto_583179 ) ( ON ?auto_583181 ?auto_583180 ) ( not ( = ?auto_583168 ?auto_583169 ) ) ( not ( = ?auto_583168 ?auto_583170 ) ) ( not ( = ?auto_583168 ?auto_583171 ) ) ( not ( = ?auto_583168 ?auto_583172 ) ) ( not ( = ?auto_583168 ?auto_583173 ) ) ( not ( = ?auto_583168 ?auto_583174 ) ) ( not ( = ?auto_583168 ?auto_583175 ) ) ( not ( = ?auto_583168 ?auto_583176 ) ) ( not ( = ?auto_583168 ?auto_583177 ) ) ( not ( = ?auto_583168 ?auto_583178 ) ) ( not ( = ?auto_583168 ?auto_583179 ) ) ( not ( = ?auto_583168 ?auto_583180 ) ) ( not ( = ?auto_583168 ?auto_583181 ) ) ( not ( = ?auto_583168 ?auto_583182 ) ) ( not ( = ?auto_583168 ?auto_583183 ) ) ( not ( = ?auto_583169 ?auto_583170 ) ) ( not ( = ?auto_583169 ?auto_583171 ) ) ( not ( = ?auto_583169 ?auto_583172 ) ) ( not ( = ?auto_583169 ?auto_583173 ) ) ( not ( = ?auto_583169 ?auto_583174 ) ) ( not ( = ?auto_583169 ?auto_583175 ) ) ( not ( = ?auto_583169 ?auto_583176 ) ) ( not ( = ?auto_583169 ?auto_583177 ) ) ( not ( = ?auto_583169 ?auto_583178 ) ) ( not ( = ?auto_583169 ?auto_583179 ) ) ( not ( = ?auto_583169 ?auto_583180 ) ) ( not ( = ?auto_583169 ?auto_583181 ) ) ( not ( = ?auto_583169 ?auto_583182 ) ) ( not ( = ?auto_583169 ?auto_583183 ) ) ( not ( = ?auto_583170 ?auto_583171 ) ) ( not ( = ?auto_583170 ?auto_583172 ) ) ( not ( = ?auto_583170 ?auto_583173 ) ) ( not ( = ?auto_583170 ?auto_583174 ) ) ( not ( = ?auto_583170 ?auto_583175 ) ) ( not ( = ?auto_583170 ?auto_583176 ) ) ( not ( = ?auto_583170 ?auto_583177 ) ) ( not ( = ?auto_583170 ?auto_583178 ) ) ( not ( = ?auto_583170 ?auto_583179 ) ) ( not ( = ?auto_583170 ?auto_583180 ) ) ( not ( = ?auto_583170 ?auto_583181 ) ) ( not ( = ?auto_583170 ?auto_583182 ) ) ( not ( = ?auto_583170 ?auto_583183 ) ) ( not ( = ?auto_583171 ?auto_583172 ) ) ( not ( = ?auto_583171 ?auto_583173 ) ) ( not ( = ?auto_583171 ?auto_583174 ) ) ( not ( = ?auto_583171 ?auto_583175 ) ) ( not ( = ?auto_583171 ?auto_583176 ) ) ( not ( = ?auto_583171 ?auto_583177 ) ) ( not ( = ?auto_583171 ?auto_583178 ) ) ( not ( = ?auto_583171 ?auto_583179 ) ) ( not ( = ?auto_583171 ?auto_583180 ) ) ( not ( = ?auto_583171 ?auto_583181 ) ) ( not ( = ?auto_583171 ?auto_583182 ) ) ( not ( = ?auto_583171 ?auto_583183 ) ) ( not ( = ?auto_583172 ?auto_583173 ) ) ( not ( = ?auto_583172 ?auto_583174 ) ) ( not ( = ?auto_583172 ?auto_583175 ) ) ( not ( = ?auto_583172 ?auto_583176 ) ) ( not ( = ?auto_583172 ?auto_583177 ) ) ( not ( = ?auto_583172 ?auto_583178 ) ) ( not ( = ?auto_583172 ?auto_583179 ) ) ( not ( = ?auto_583172 ?auto_583180 ) ) ( not ( = ?auto_583172 ?auto_583181 ) ) ( not ( = ?auto_583172 ?auto_583182 ) ) ( not ( = ?auto_583172 ?auto_583183 ) ) ( not ( = ?auto_583173 ?auto_583174 ) ) ( not ( = ?auto_583173 ?auto_583175 ) ) ( not ( = ?auto_583173 ?auto_583176 ) ) ( not ( = ?auto_583173 ?auto_583177 ) ) ( not ( = ?auto_583173 ?auto_583178 ) ) ( not ( = ?auto_583173 ?auto_583179 ) ) ( not ( = ?auto_583173 ?auto_583180 ) ) ( not ( = ?auto_583173 ?auto_583181 ) ) ( not ( = ?auto_583173 ?auto_583182 ) ) ( not ( = ?auto_583173 ?auto_583183 ) ) ( not ( = ?auto_583174 ?auto_583175 ) ) ( not ( = ?auto_583174 ?auto_583176 ) ) ( not ( = ?auto_583174 ?auto_583177 ) ) ( not ( = ?auto_583174 ?auto_583178 ) ) ( not ( = ?auto_583174 ?auto_583179 ) ) ( not ( = ?auto_583174 ?auto_583180 ) ) ( not ( = ?auto_583174 ?auto_583181 ) ) ( not ( = ?auto_583174 ?auto_583182 ) ) ( not ( = ?auto_583174 ?auto_583183 ) ) ( not ( = ?auto_583175 ?auto_583176 ) ) ( not ( = ?auto_583175 ?auto_583177 ) ) ( not ( = ?auto_583175 ?auto_583178 ) ) ( not ( = ?auto_583175 ?auto_583179 ) ) ( not ( = ?auto_583175 ?auto_583180 ) ) ( not ( = ?auto_583175 ?auto_583181 ) ) ( not ( = ?auto_583175 ?auto_583182 ) ) ( not ( = ?auto_583175 ?auto_583183 ) ) ( not ( = ?auto_583176 ?auto_583177 ) ) ( not ( = ?auto_583176 ?auto_583178 ) ) ( not ( = ?auto_583176 ?auto_583179 ) ) ( not ( = ?auto_583176 ?auto_583180 ) ) ( not ( = ?auto_583176 ?auto_583181 ) ) ( not ( = ?auto_583176 ?auto_583182 ) ) ( not ( = ?auto_583176 ?auto_583183 ) ) ( not ( = ?auto_583177 ?auto_583178 ) ) ( not ( = ?auto_583177 ?auto_583179 ) ) ( not ( = ?auto_583177 ?auto_583180 ) ) ( not ( = ?auto_583177 ?auto_583181 ) ) ( not ( = ?auto_583177 ?auto_583182 ) ) ( not ( = ?auto_583177 ?auto_583183 ) ) ( not ( = ?auto_583178 ?auto_583179 ) ) ( not ( = ?auto_583178 ?auto_583180 ) ) ( not ( = ?auto_583178 ?auto_583181 ) ) ( not ( = ?auto_583178 ?auto_583182 ) ) ( not ( = ?auto_583178 ?auto_583183 ) ) ( not ( = ?auto_583179 ?auto_583180 ) ) ( not ( = ?auto_583179 ?auto_583181 ) ) ( not ( = ?auto_583179 ?auto_583182 ) ) ( not ( = ?auto_583179 ?auto_583183 ) ) ( not ( = ?auto_583180 ?auto_583181 ) ) ( not ( = ?auto_583180 ?auto_583182 ) ) ( not ( = ?auto_583180 ?auto_583183 ) ) ( not ( = ?auto_583181 ?auto_583182 ) ) ( not ( = ?auto_583181 ?auto_583183 ) ) ( not ( = ?auto_583182 ?auto_583183 ) ) ( CLEAR ?auto_583181 ) ( ON ?auto_583182 ?auto_583183 ) ( CLEAR ?auto_583182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_583168 ?auto_583169 ?auto_583170 ?auto_583171 ?auto_583172 ?auto_583173 ?auto_583174 ?auto_583175 ?auto_583176 ?auto_583177 ?auto_583178 ?auto_583179 ?auto_583180 ?auto_583181 ?auto_583182 )
      ( MAKE-16PILE ?auto_583168 ?auto_583169 ?auto_583170 ?auto_583171 ?auto_583172 ?auto_583173 ?auto_583174 ?auto_583175 ?auto_583176 ?auto_583177 ?auto_583178 ?auto_583179 ?auto_583180 ?auto_583181 ?auto_583182 ?auto_583183 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583200 - BLOCK
      ?auto_583201 - BLOCK
      ?auto_583202 - BLOCK
      ?auto_583203 - BLOCK
      ?auto_583204 - BLOCK
      ?auto_583205 - BLOCK
      ?auto_583206 - BLOCK
      ?auto_583207 - BLOCK
      ?auto_583208 - BLOCK
      ?auto_583209 - BLOCK
      ?auto_583210 - BLOCK
      ?auto_583211 - BLOCK
      ?auto_583212 - BLOCK
      ?auto_583213 - BLOCK
      ?auto_583214 - BLOCK
      ?auto_583215 - BLOCK
    )
    :vars
    (
      ?auto_583216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583215 ?auto_583216 ) ( ON-TABLE ?auto_583200 ) ( ON ?auto_583201 ?auto_583200 ) ( ON ?auto_583202 ?auto_583201 ) ( ON ?auto_583203 ?auto_583202 ) ( ON ?auto_583204 ?auto_583203 ) ( ON ?auto_583205 ?auto_583204 ) ( ON ?auto_583206 ?auto_583205 ) ( ON ?auto_583207 ?auto_583206 ) ( ON ?auto_583208 ?auto_583207 ) ( ON ?auto_583209 ?auto_583208 ) ( ON ?auto_583210 ?auto_583209 ) ( ON ?auto_583211 ?auto_583210 ) ( ON ?auto_583212 ?auto_583211 ) ( not ( = ?auto_583200 ?auto_583201 ) ) ( not ( = ?auto_583200 ?auto_583202 ) ) ( not ( = ?auto_583200 ?auto_583203 ) ) ( not ( = ?auto_583200 ?auto_583204 ) ) ( not ( = ?auto_583200 ?auto_583205 ) ) ( not ( = ?auto_583200 ?auto_583206 ) ) ( not ( = ?auto_583200 ?auto_583207 ) ) ( not ( = ?auto_583200 ?auto_583208 ) ) ( not ( = ?auto_583200 ?auto_583209 ) ) ( not ( = ?auto_583200 ?auto_583210 ) ) ( not ( = ?auto_583200 ?auto_583211 ) ) ( not ( = ?auto_583200 ?auto_583212 ) ) ( not ( = ?auto_583200 ?auto_583213 ) ) ( not ( = ?auto_583200 ?auto_583214 ) ) ( not ( = ?auto_583200 ?auto_583215 ) ) ( not ( = ?auto_583200 ?auto_583216 ) ) ( not ( = ?auto_583201 ?auto_583202 ) ) ( not ( = ?auto_583201 ?auto_583203 ) ) ( not ( = ?auto_583201 ?auto_583204 ) ) ( not ( = ?auto_583201 ?auto_583205 ) ) ( not ( = ?auto_583201 ?auto_583206 ) ) ( not ( = ?auto_583201 ?auto_583207 ) ) ( not ( = ?auto_583201 ?auto_583208 ) ) ( not ( = ?auto_583201 ?auto_583209 ) ) ( not ( = ?auto_583201 ?auto_583210 ) ) ( not ( = ?auto_583201 ?auto_583211 ) ) ( not ( = ?auto_583201 ?auto_583212 ) ) ( not ( = ?auto_583201 ?auto_583213 ) ) ( not ( = ?auto_583201 ?auto_583214 ) ) ( not ( = ?auto_583201 ?auto_583215 ) ) ( not ( = ?auto_583201 ?auto_583216 ) ) ( not ( = ?auto_583202 ?auto_583203 ) ) ( not ( = ?auto_583202 ?auto_583204 ) ) ( not ( = ?auto_583202 ?auto_583205 ) ) ( not ( = ?auto_583202 ?auto_583206 ) ) ( not ( = ?auto_583202 ?auto_583207 ) ) ( not ( = ?auto_583202 ?auto_583208 ) ) ( not ( = ?auto_583202 ?auto_583209 ) ) ( not ( = ?auto_583202 ?auto_583210 ) ) ( not ( = ?auto_583202 ?auto_583211 ) ) ( not ( = ?auto_583202 ?auto_583212 ) ) ( not ( = ?auto_583202 ?auto_583213 ) ) ( not ( = ?auto_583202 ?auto_583214 ) ) ( not ( = ?auto_583202 ?auto_583215 ) ) ( not ( = ?auto_583202 ?auto_583216 ) ) ( not ( = ?auto_583203 ?auto_583204 ) ) ( not ( = ?auto_583203 ?auto_583205 ) ) ( not ( = ?auto_583203 ?auto_583206 ) ) ( not ( = ?auto_583203 ?auto_583207 ) ) ( not ( = ?auto_583203 ?auto_583208 ) ) ( not ( = ?auto_583203 ?auto_583209 ) ) ( not ( = ?auto_583203 ?auto_583210 ) ) ( not ( = ?auto_583203 ?auto_583211 ) ) ( not ( = ?auto_583203 ?auto_583212 ) ) ( not ( = ?auto_583203 ?auto_583213 ) ) ( not ( = ?auto_583203 ?auto_583214 ) ) ( not ( = ?auto_583203 ?auto_583215 ) ) ( not ( = ?auto_583203 ?auto_583216 ) ) ( not ( = ?auto_583204 ?auto_583205 ) ) ( not ( = ?auto_583204 ?auto_583206 ) ) ( not ( = ?auto_583204 ?auto_583207 ) ) ( not ( = ?auto_583204 ?auto_583208 ) ) ( not ( = ?auto_583204 ?auto_583209 ) ) ( not ( = ?auto_583204 ?auto_583210 ) ) ( not ( = ?auto_583204 ?auto_583211 ) ) ( not ( = ?auto_583204 ?auto_583212 ) ) ( not ( = ?auto_583204 ?auto_583213 ) ) ( not ( = ?auto_583204 ?auto_583214 ) ) ( not ( = ?auto_583204 ?auto_583215 ) ) ( not ( = ?auto_583204 ?auto_583216 ) ) ( not ( = ?auto_583205 ?auto_583206 ) ) ( not ( = ?auto_583205 ?auto_583207 ) ) ( not ( = ?auto_583205 ?auto_583208 ) ) ( not ( = ?auto_583205 ?auto_583209 ) ) ( not ( = ?auto_583205 ?auto_583210 ) ) ( not ( = ?auto_583205 ?auto_583211 ) ) ( not ( = ?auto_583205 ?auto_583212 ) ) ( not ( = ?auto_583205 ?auto_583213 ) ) ( not ( = ?auto_583205 ?auto_583214 ) ) ( not ( = ?auto_583205 ?auto_583215 ) ) ( not ( = ?auto_583205 ?auto_583216 ) ) ( not ( = ?auto_583206 ?auto_583207 ) ) ( not ( = ?auto_583206 ?auto_583208 ) ) ( not ( = ?auto_583206 ?auto_583209 ) ) ( not ( = ?auto_583206 ?auto_583210 ) ) ( not ( = ?auto_583206 ?auto_583211 ) ) ( not ( = ?auto_583206 ?auto_583212 ) ) ( not ( = ?auto_583206 ?auto_583213 ) ) ( not ( = ?auto_583206 ?auto_583214 ) ) ( not ( = ?auto_583206 ?auto_583215 ) ) ( not ( = ?auto_583206 ?auto_583216 ) ) ( not ( = ?auto_583207 ?auto_583208 ) ) ( not ( = ?auto_583207 ?auto_583209 ) ) ( not ( = ?auto_583207 ?auto_583210 ) ) ( not ( = ?auto_583207 ?auto_583211 ) ) ( not ( = ?auto_583207 ?auto_583212 ) ) ( not ( = ?auto_583207 ?auto_583213 ) ) ( not ( = ?auto_583207 ?auto_583214 ) ) ( not ( = ?auto_583207 ?auto_583215 ) ) ( not ( = ?auto_583207 ?auto_583216 ) ) ( not ( = ?auto_583208 ?auto_583209 ) ) ( not ( = ?auto_583208 ?auto_583210 ) ) ( not ( = ?auto_583208 ?auto_583211 ) ) ( not ( = ?auto_583208 ?auto_583212 ) ) ( not ( = ?auto_583208 ?auto_583213 ) ) ( not ( = ?auto_583208 ?auto_583214 ) ) ( not ( = ?auto_583208 ?auto_583215 ) ) ( not ( = ?auto_583208 ?auto_583216 ) ) ( not ( = ?auto_583209 ?auto_583210 ) ) ( not ( = ?auto_583209 ?auto_583211 ) ) ( not ( = ?auto_583209 ?auto_583212 ) ) ( not ( = ?auto_583209 ?auto_583213 ) ) ( not ( = ?auto_583209 ?auto_583214 ) ) ( not ( = ?auto_583209 ?auto_583215 ) ) ( not ( = ?auto_583209 ?auto_583216 ) ) ( not ( = ?auto_583210 ?auto_583211 ) ) ( not ( = ?auto_583210 ?auto_583212 ) ) ( not ( = ?auto_583210 ?auto_583213 ) ) ( not ( = ?auto_583210 ?auto_583214 ) ) ( not ( = ?auto_583210 ?auto_583215 ) ) ( not ( = ?auto_583210 ?auto_583216 ) ) ( not ( = ?auto_583211 ?auto_583212 ) ) ( not ( = ?auto_583211 ?auto_583213 ) ) ( not ( = ?auto_583211 ?auto_583214 ) ) ( not ( = ?auto_583211 ?auto_583215 ) ) ( not ( = ?auto_583211 ?auto_583216 ) ) ( not ( = ?auto_583212 ?auto_583213 ) ) ( not ( = ?auto_583212 ?auto_583214 ) ) ( not ( = ?auto_583212 ?auto_583215 ) ) ( not ( = ?auto_583212 ?auto_583216 ) ) ( not ( = ?auto_583213 ?auto_583214 ) ) ( not ( = ?auto_583213 ?auto_583215 ) ) ( not ( = ?auto_583213 ?auto_583216 ) ) ( not ( = ?auto_583214 ?auto_583215 ) ) ( not ( = ?auto_583214 ?auto_583216 ) ) ( not ( = ?auto_583215 ?auto_583216 ) ) ( ON ?auto_583214 ?auto_583215 ) ( CLEAR ?auto_583212 ) ( ON ?auto_583213 ?auto_583214 ) ( CLEAR ?auto_583213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_583200 ?auto_583201 ?auto_583202 ?auto_583203 ?auto_583204 ?auto_583205 ?auto_583206 ?auto_583207 ?auto_583208 ?auto_583209 ?auto_583210 ?auto_583211 ?auto_583212 ?auto_583213 )
      ( MAKE-16PILE ?auto_583200 ?auto_583201 ?auto_583202 ?auto_583203 ?auto_583204 ?auto_583205 ?auto_583206 ?auto_583207 ?auto_583208 ?auto_583209 ?auto_583210 ?auto_583211 ?auto_583212 ?auto_583213 ?auto_583214 ?auto_583215 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583233 - BLOCK
      ?auto_583234 - BLOCK
      ?auto_583235 - BLOCK
      ?auto_583236 - BLOCK
      ?auto_583237 - BLOCK
      ?auto_583238 - BLOCK
      ?auto_583239 - BLOCK
      ?auto_583240 - BLOCK
      ?auto_583241 - BLOCK
      ?auto_583242 - BLOCK
      ?auto_583243 - BLOCK
      ?auto_583244 - BLOCK
      ?auto_583245 - BLOCK
      ?auto_583246 - BLOCK
      ?auto_583247 - BLOCK
      ?auto_583248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_583248 ) ( ON-TABLE ?auto_583233 ) ( ON ?auto_583234 ?auto_583233 ) ( ON ?auto_583235 ?auto_583234 ) ( ON ?auto_583236 ?auto_583235 ) ( ON ?auto_583237 ?auto_583236 ) ( ON ?auto_583238 ?auto_583237 ) ( ON ?auto_583239 ?auto_583238 ) ( ON ?auto_583240 ?auto_583239 ) ( ON ?auto_583241 ?auto_583240 ) ( ON ?auto_583242 ?auto_583241 ) ( ON ?auto_583243 ?auto_583242 ) ( ON ?auto_583244 ?auto_583243 ) ( ON ?auto_583245 ?auto_583244 ) ( not ( = ?auto_583233 ?auto_583234 ) ) ( not ( = ?auto_583233 ?auto_583235 ) ) ( not ( = ?auto_583233 ?auto_583236 ) ) ( not ( = ?auto_583233 ?auto_583237 ) ) ( not ( = ?auto_583233 ?auto_583238 ) ) ( not ( = ?auto_583233 ?auto_583239 ) ) ( not ( = ?auto_583233 ?auto_583240 ) ) ( not ( = ?auto_583233 ?auto_583241 ) ) ( not ( = ?auto_583233 ?auto_583242 ) ) ( not ( = ?auto_583233 ?auto_583243 ) ) ( not ( = ?auto_583233 ?auto_583244 ) ) ( not ( = ?auto_583233 ?auto_583245 ) ) ( not ( = ?auto_583233 ?auto_583246 ) ) ( not ( = ?auto_583233 ?auto_583247 ) ) ( not ( = ?auto_583233 ?auto_583248 ) ) ( not ( = ?auto_583234 ?auto_583235 ) ) ( not ( = ?auto_583234 ?auto_583236 ) ) ( not ( = ?auto_583234 ?auto_583237 ) ) ( not ( = ?auto_583234 ?auto_583238 ) ) ( not ( = ?auto_583234 ?auto_583239 ) ) ( not ( = ?auto_583234 ?auto_583240 ) ) ( not ( = ?auto_583234 ?auto_583241 ) ) ( not ( = ?auto_583234 ?auto_583242 ) ) ( not ( = ?auto_583234 ?auto_583243 ) ) ( not ( = ?auto_583234 ?auto_583244 ) ) ( not ( = ?auto_583234 ?auto_583245 ) ) ( not ( = ?auto_583234 ?auto_583246 ) ) ( not ( = ?auto_583234 ?auto_583247 ) ) ( not ( = ?auto_583234 ?auto_583248 ) ) ( not ( = ?auto_583235 ?auto_583236 ) ) ( not ( = ?auto_583235 ?auto_583237 ) ) ( not ( = ?auto_583235 ?auto_583238 ) ) ( not ( = ?auto_583235 ?auto_583239 ) ) ( not ( = ?auto_583235 ?auto_583240 ) ) ( not ( = ?auto_583235 ?auto_583241 ) ) ( not ( = ?auto_583235 ?auto_583242 ) ) ( not ( = ?auto_583235 ?auto_583243 ) ) ( not ( = ?auto_583235 ?auto_583244 ) ) ( not ( = ?auto_583235 ?auto_583245 ) ) ( not ( = ?auto_583235 ?auto_583246 ) ) ( not ( = ?auto_583235 ?auto_583247 ) ) ( not ( = ?auto_583235 ?auto_583248 ) ) ( not ( = ?auto_583236 ?auto_583237 ) ) ( not ( = ?auto_583236 ?auto_583238 ) ) ( not ( = ?auto_583236 ?auto_583239 ) ) ( not ( = ?auto_583236 ?auto_583240 ) ) ( not ( = ?auto_583236 ?auto_583241 ) ) ( not ( = ?auto_583236 ?auto_583242 ) ) ( not ( = ?auto_583236 ?auto_583243 ) ) ( not ( = ?auto_583236 ?auto_583244 ) ) ( not ( = ?auto_583236 ?auto_583245 ) ) ( not ( = ?auto_583236 ?auto_583246 ) ) ( not ( = ?auto_583236 ?auto_583247 ) ) ( not ( = ?auto_583236 ?auto_583248 ) ) ( not ( = ?auto_583237 ?auto_583238 ) ) ( not ( = ?auto_583237 ?auto_583239 ) ) ( not ( = ?auto_583237 ?auto_583240 ) ) ( not ( = ?auto_583237 ?auto_583241 ) ) ( not ( = ?auto_583237 ?auto_583242 ) ) ( not ( = ?auto_583237 ?auto_583243 ) ) ( not ( = ?auto_583237 ?auto_583244 ) ) ( not ( = ?auto_583237 ?auto_583245 ) ) ( not ( = ?auto_583237 ?auto_583246 ) ) ( not ( = ?auto_583237 ?auto_583247 ) ) ( not ( = ?auto_583237 ?auto_583248 ) ) ( not ( = ?auto_583238 ?auto_583239 ) ) ( not ( = ?auto_583238 ?auto_583240 ) ) ( not ( = ?auto_583238 ?auto_583241 ) ) ( not ( = ?auto_583238 ?auto_583242 ) ) ( not ( = ?auto_583238 ?auto_583243 ) ) ( not ( = ?auto_583238 ?auto_583244 ) ) ( not ( = ?auto_583238 ?auto_583245 ) ) ( not ( = ?auto_583238 ?auto_583246 ) ) ( not ( = ?auto_583238 ?auto_583247 ) ) ( not ( = ?auto_583238 ?auto_583248 ) ) ( not ( = ?auto_583239 ?auto_583240 ) ) ( not ( = ?auto_583239 ?auto_583241 ) ) ( not ( = ?auto_583239 ?auto_583242 ) ) ( not ( = ?auto_583239 ?auto_583243 ) ) ( not ( = ?auto_583239 ?auto_583244 ) ) ( not ( = ?auto_583239 ?auto_583245 ) ) ( not ( = ?auto_583239 ?auto_583246 ) ) ( not ( = ?auto_583239 ?auto_583247 ) ) ( not ( = ?auto_583239 ?auto_583248 ) ) ( not ( = ?auto_583240 ?auto_583241 ) ) ( not ( = ?auto_583240 ?auto_583242 ) ) ( not ( = ?auto_583240 ?auto_583243 ) ) ( not ( = ?auto_583240 ?auto_583244 ) ) ( not ( = ?auto_583240 ?auto_583245 ) ) ( not ( = ?auto_583240 ?auto_583246 ) ) ( not ( = ?auto_583240 ?auto_583247 ) ) ( not ( = ?auto_583240 ?auto_583248 ) ) ( not ( = ?auto_583241 ?auto_583242 ) ) ( not ( = ?auto_583241 ?auto_583243 ) ) ( not ( = ?auto_583241 ?auto_583244 ) ) ( not ( = ?auto_583241 ?auto_583245 ) ) ( not ( = ?auto_583241 ?auto_583246 ) ) ( not ( = ?auto_583241 ?auto_583247 ) ) ( not ( = ?auto_583241 ?auto_583248 ) ) ( not ( = ?auto_583242 ?auto_583243 ) ) ( not ( = ?auto_583242 ?auto_583244 ) ) ( not ( = ?auto_583242 ?auto_583245 ) ) ( not ( = ?auto_583242 ?auto_583246 ) ) ( not ( = ?auto_583242 ?auto_583247 ) ) ( not ( = ?auto_583242 ?auto_583248 ) ) ( not ( = ?auto_583243 ?auto_583244 ) ) ( not ( = ?auto_583243 ?auto_583245 ) ) ( not ( = ?auto_583243 ?auto_583246 ) ) ( not ( = ?auto_583243 ?auto_583247 ) ) ( not ( = ?auto_583243 ?auto_583248 ) ) ( not ( = ?auto_583244 ?auto_583245 ) ) ( not ( = ?auto_583244 ?auto_583246 ) ) ( not ( = ?auto_583244 ?auto_583247 ) ) ( not ( = ?auto_583244 ?auto_583248 ) ) ( not ( = ?auto_583245 ?auto_583246 ) ) ( not ( = ?auto_583245 ?auto_583247 ) ) ( not ( = ?auto_583245 ?auto_583248 ) ) ( not ( = ?auto_583246 ?auto_583247 ) ) ( not ( = ?auto_583246 ?auto_583248 ) ) ( not ( = ?auto_583247 ?auto_583248 ) ) ( ON ?auto_583247 ?auto_583248 ) ( CLEAR ?auto_583245 ) ( ON ?auto_583246 ?auto_583247 ) ( CLEAR ?auto_583246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_583233 ?auto_583234 ?auto_583235 ?auto_583236 ?auto_583237 ?auto_583238 ?auto_583239 ?auto_583240 ?auto_583241 ?auto_583242 ?auto_583243 ?auto_583244 ?auto_583245 ?auto_583246 )
      ( MAKE-16PILE ?auto_583233 ?auto_583234 ?auto_583235 ?auto_583236 ?auto_583237 ?auto_583238 ?auto_583239 ?auto_583240 ?auto_583241 ?auto_583242 ?auto_583243 ?auto_583244 ?auto_583245 ?auto_583246 ?auto_583247 ?auto_583248 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583265 - BLOCK
      ?auto_583266 - BLOCK
      ?auto_583267 - BLOCK
      ?auto_583268 - BLOCK
      ?auto_583269 - BLOCK
      ?auto_583270 - BLOCK
      ?auto_583271 - BLOCK
      ?auto_583272 - BLOCK
      ?auto_583273 - BLOCK
      ?auto_583274 - BLOCK
      ?auto_583275 - BLOCK
      ?auto_583276 - BLOCK
      ?auto_583277 - BLOCK
      ?auto_583278 - BLOCK
      ?auto_583279 - BLOCK
      ?auto_583280 - BLOCK
    )
    :vars
    (
      ?auto_583281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583280 ?auto_583281 ) ( ON-TABLE ?auto_583265 ) ( ON ?auto_583266 ?auto_583265 ) ( ON ?auto_583267 ?auto_583266 ) ( ON ?auto_583268 ?auto_583267 ) ( ON ?auto_583269 ?auto_583268 ) ( ON ?auto_583270 ?auto_583269 ) ( ON ?auto_583271 ?auto_583270 ) ( ON ?auto_583272 ?auto_583271 ) ( ON ?auto_583273 ?auto_583272 ) ( ON ?auto_583274 ?auto_583273 ) ( ON ?auto_583275 ?auto_583274 ) ( ON ?auto_583276 ?auto_583275 ) ( not ( = ?auto_583265 ?auto_583266 ) ) ( not ( = ?auto_583265 ?auto_583267 ) ) ( not ( = ?auto_583265 ?auto_583268 ) ) ( not ( = ?auto_583265 ?auto_583269 ) ) ( not ( = ?auto_583265 ?auto_583270 ) ) ( not ( = ?auto_583265 ?auto_583271 ) ) ( not ( = ?auto_583265 ?auto_583272 ) ) ( not ( = ?auto_583265 ?auto_583273 ) ) ( not ( = ?auto_583265 ?auto_583274 ) ) ( not ( = ?auto_583265 ?auto_583275 ) ) ( not ( = ?auto_583265 ?auto_583276 ) ) ( not ( = ?auto_583265 ?auto_583277 ) ) ( not ( = ?auto_583265 ?auto_583278 ) ) ( not ( = ?auto_583265 ?auto_583279 ) ) ( not ( = ?auto_583265 ?auto_583280 ) ) ( not ( = ?auto_583265 ?auto_583281 ) ) ( not ( = ?auto_583266 ?auto_583267 ) ) ( not ( = ?auto_583266 ?auto_583268 ) ) ( not ( = ?auto_583266 ?auto_583269 ) ) ( not ( = ?auto_583266 ?auto_583270 ) ) ( not ( = ?auto_583266 ?auto_583271 ) ) ( not ( = ?auto_583266 ?auto_583272 ) ) ( not ( = ?auto_583266 ?auto_583273 ) ) ( not ( = ?auto_583266 ?auto_583274 ) ) ( not ( = ?auto_583266 ?auto_583275 ) ) ( not ( = ?auto_583266 ?auto_583276 ) ) ( not ( = ?auto_583266 ?auto_583277 ) ) ( not ( = ?auto_583266 ?auto_583278 ) ) ( not ( = ?auto_583266 ?auto_583279 ) ) ( not ( = ?auto_583266 ?auto_583280 ) ) ( not ( = ?auto_583266 ?auto_583281 ) ) ( not ( = ?auto_583267 ?auto_583268 ) ) ( not ( = ?auto_583267 ?auto_583269 ) ) ( not ( = ?auto_583267 ?auto_583270 ) ) ( not ( = ?auto_583267 ?auto_583271 ) ) ( not ( = ?auto_583267 ?auto_583272 ) ) ( not ( = ?auto_583267 ?auto_583273 ) ) ( not ( = ?auto_583267 ?auto_583274 ) ) ( not ( = ?auto_583267 ?auto_583275 ) ) ( not ( = ?auto_583267 ?auto_583276 ) ) ( not ( = ?auto_583267 ?auto_583277 ) ) ( not ( = ?auto_583267 ?auto_583278 ) ) ( not ( = ?auto_583267 ?auto_583279 ) ) ( not ( = ?auto_583267 ?auto_583280 ) ) ( not ( = ?auto_583267 ?auto_583281 ) ) ( not ( = ?auto_583268 ?auto_583269 ) ) ( not ( = ?auto_583268 ?auto_583270 ) ) ( not ( = ?auto_583268 ?auto_583271 ) ) ( not ( = ?auto_583268 ?auto_583272 ) ) ( not ( = ?auto_583268 ?auto_583273 ) ) ( not ( = ?auto_583268 ?auto_583274 ) ) ( not ( = ?auto_583268 ?auto_583275 ) ) ( not ( = ?auto_583268 ?auto_583276 ) ) ( not ( = ?auto_583268 ?auto_583277 ) ) ( not ( = ?auto_583268 ?auto_583278 ) ) ( not ( = ?auto_583268 ?auto_583279 ) ) ( not ( = ?auto_583268 ?auto_583280 ) ) ( not ( = ?auto_583268 ?auto_583281 ) ) ( not ( = ?auto_583269 ?auto_583270 ) ) ( not ( = ?auto_583269 ?auto_583271 ) ) ( not ( = ?auto_583269 ?auto_583272 ) ) ( not ( = ?auto_583269 ?auto_583273 ) ) ( not ( = ?auto_583269 ?auto_583274 ) ) ( not ( = ?auto_583269 ?auto_583275 ) ) ( not ( = ?auto_583269 ?auto_583276 ) ) ( not ( = ?auto_583269 ?auto_583277 ) ) ( not ( = ?auto_583269 ?auto_583278 ) ) ( not ( = ?auto_583269 ?auto_583279 ) ) ( not ( = ?auto_583269 ?auto_583280 ) ) ( not ( = ?auto_583269 ?auto_583281 ) ) ( not ( = ?auto_583270 ?auto_583271 ) ) ( not ( = ?auto_583270 ?auto_583272 ) ) ( not ( = ?auto_583270 ?auto_583273 ) ) ( not ( = ?auto_583270 ?auto_583274 ) ) ( not ( = ?auto_583270 ?auto_583275 ) ) ( not ( = ?auto_583270 ?auto_583276 ) ) ( not ( = ?auto_583270 ?auto_583277 ) ) ( not ( = ?auto_583270 ?auto_583278 ) ) ( not ( = ?auto_583270 ?auto_583279 ) ) ( not ( = ?auto_583270 ?auto_583280 ) ) ( not ( = ?auto_583270 ?auto_583281 ) ) ( not ( = ?auto_583271 ?auto_583272 ) ) ( not ( = ?auto_583271 ?auto_583273 ) ) ( not ( = ?auto_583271 ?auto_583274 ) ) ( not ( = ?auto_583271 ?auto_583275 ) ) ( not ( = ?auto_583271 ?auto_583276 ) ) ( not ( = ?auto_583271 ?auto_583277 ) ) ( not ( = ?auto_583271 ?auto_583278 ) ) ( not ( = ?auto_583271 ?auto_583279 ) ) ( not ( = ?auto_583271 ?auto_583280 ) ) ( not ( = ?auto_583271 ?auto_583281 ) ) ( not ( = ?auto_583272 ?auto_583273 ) ) ( not ( = ?auto_583272 ?auto_583274 ) ) ( not ( = ?auto_583272 ?auto_583275 ) ) ( not ( = ?auto_583272 ?auto_583276 ) ) ( not ( = ?auto_583272 ?auto_583277 ) ) ( not ( = ?auto_583272 ?auto_583278 ) ) ( not ( = ?auto_583272 ?auto_583279 ) ) ( not ( = ?auto_583272 ?auto_583280 ) ) ( not ( = ?auto_583272 ?auto_583281 ) ) ( not ( = ?auto_583273 ?auto_583274 ) ) ( not ( = ?auto_583273 ?auto_583275 ) ) ( not ( = ?auto_583273 ?auto_583276 ) ) ( not ( = ?auto_583273 ?auto_583277 ) ) ( not ( = ?auto_583273 ?auto_583278 ) ) ( not ( = ?auto_583273 ?auto_583279 ) ) ( not ( = ?auto_583273 ?auto_583280 ) ) ( not ( = ?auto_583273 ?auto_583281 ) ) ( not ( = ?auto_583274 ?auto_583275 ) ) ( not ( = ?auto_583274 ?auto_583276 ) ) ( not ( = ?auto_583274 ?auto_583277 ) ) ( not ( = ?auto_583274 ?auto_583278 ) ) ( not ( = ?auto_583274 ?auto_583279 ) ) ( not ( = ?auto_583274 ?auto_583280 ) ) ( not ( = ?auto_583274 ?auto_583281 ) ) ( not ( = ?auto_583275 ?auto_583276 ) ) ( not ( = ?auto_583275 ?auto_583277 ) ) ( not ( = ?auto_583275 ?auto_583278 ) ) ( not ( = ?auto_583275 ?auto_583279 ) ) ( not ( = ?auto_583275 ?auto_583280 ) ) ( not ( = ?auto_583275 ?auto_583281 ) ) ( not ( = ?auto_583276 ?auto_583277 ) ) ( not ( = ?auto_583276 ?auto_583278 ) ) ( not ( = ?auto_583276 ?auto_583279 ) ) ( not ( = ?auto_583276 ?auto_583280 ) ) ( not ( = ?auto_583276 ?auto_583281 ) ) ( not ( = ?auto_583277 ?auto_583278 ) ) ( not ( = ?auto_583277 ?auto_583279 ) ) ( not ( = ?auto_583277 ?auto_583280 ) ) ( not ( = ?auto_583277 ?auto_583281 ) ) ( not ( = ?auto_583278 ?auto_583279 ) ) ( not ( = ?auto_583278 ?auto_583280 ) ) ( not ( = ?auto_583278 ?auto_583281 ) ) ( not ( = ?auto_583279 ?auto_583280 ) ) ( not ( = ?auto_583279 ?auto_583281 ) ) ( not ( = ?auto_583280 ?auto_583281 ) ) ( ON ?auto_583279 ?auto_583280 ) ( ON ?auto_583278 ?auto_583279 ) ( CLEAR ?auto_583276 ) ( ON ?auto_583277 ?auto_583278 ) ( CLEAR ?auto_583277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_583265 ?auto_583266 ?auto_583267 ?auto_583268 ?auto_583269 ?auto_583270 ?auto_583271 ?auto_583272 ?auto_583273 ?auto_583274 ?auto_583275 ?auto_583276 ?auto_583277 )
      ( MAKE-16PILE ?auto_583265 ?auto_583266 ?auto_583267 ?auto_583268 ?auto_583269 ?auto_583270 ?auto_583271 ?auto_583272 ?auto_583273 ?auto_583274 ?auto_583275 ?auto_583276 ?auto_583277 ?auto_583278 ?auto_583279 ?auto_583280 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583298 - BLOCK
      ?auto_583299 - BLOCK
      ?auto_583300 - BLOCK
      ?auto_583301 - BLOCK
      ?auto_583302 - BLOCK
      ?auto_583303 - BLOCK
      ?auto_583304 - BLOCK
      ?auto_583305 - BLOCK
      ?auto_583306 - BLOCK
      ?auto_583307 - BLOCK
      ?auto_583308 - BLOCK
      ?auto_583309 - BLOCK
      ?auto_583310 - BLOCK
      ?auto_583311 - BLOCK
      ?auto_583312 - BLOCK
      ?auto_583313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_583313 ) ( ON-TABLE ?auto_583298 ) ( ON ?auto_583299 ?auto_583298 ) ( ON ?auto_583300 ?auto_583299 ) ( ON ?auto_583301 ?auto_583300 ) ( ON ?auto_583302 ?auto_583301 ) ( ON ?auto_583303 ?auto_583302 ) ( ON ?auto_583304 ?auto_583303 ) ( ON ?auto_583305 ?auto_583304 ) ( ON ?auto_583306 ?auto_583305 ) ( ON ?auto_583307 ?auto_583306 ) ( ON ?auto_583308 ?auto_583307 ) ( ON ?auto_583309 ?auto_583308 ) ( not ( = ?auto_583298 ?auto_583299 ) ) ( not ( = ?auto_583298 ?auto_583300 ) ) ( not ( = ?auto_583298 ?auto_583301 ) ) ( not ( = ?auto_583298 ?auto_583302 ) ) ( not ( = ?auto_583298 ?auto_583303 ) ) ( not ( = ?auto_583298 ?auto_583304 ) ) ( not ( = ?auto_583298 ?auto_583305 ) ) ( not ( = ?auto_583298 ?auto_583306 ) ) ( not ( = ?auto_583298 ?auto_583307 ) ) ( not ( = ?auto_583298 ?auto_583308 ) ) ( not ( = ?auto_583298 ?auto_583309 ) ) ( not ( = ?auto_583298 ?auto_583310 ) ) ( not ( = ?auto_583298 ?auto_583311 ) ) ( not ( = ?auto_583298 ?auto_583312 ) ) ( not ( = ?auto_583298 ?auto_583313 ) ) ( not ( = ?auto_583299 ?auto_583300 ) ) ( not ( = ?auto_583299 ?auto_583301 ) ) ( not ( = ?auto_583299 ?auto_583302 ) ) ( not ( = ?auto_583299 ?auto_583303 ) ) ( not ( = ?auto_583299 ?auto_583304 ) ) ( not ( = ?auto_583299 ?auto_583305 ) ) ( not ( = ?auto_583299 ?auto_583306 ) ) ( not ( = ?auto_583299 ?auto_583307 ) ) ( not ( = ?auto_583299 ?auto_583308 ) ) ( not ( = ?auto_583299 ?auto_583309 ) ) ( not ( = ?auto_583299 ?auto_583310 ) ) ( not ( = ?auto_583299 ?auto_583311 ) ) ( not ( = ?auto_583299 ?auto_583312 ) ) ( not ( = ?auto_583299 ?auto_583313 ) ) ( not ( = ?auto_583300 ?auto_583301 ) ) ( not ( = ?auto_583300 ?auto_583302 ) ) ( not ( = ?auto_583300 ?auto_583303 ) ) ( not ( = ?auto_583300 ?auto_583304 ) ) ( not ( = ?auto_583300 ?auto_583305 ) ) ( not ( = ?auto_583300 ?auto_583306 ) ) ( not ( = ?auto_583300 ?auto_583307 ) ) ( not ( = ?auto_583300 ?auto_583308 ) ) ( not ( = ?auto_583300 ?auto_583309 ) ) ( not ( = ?auto_583300 ?auto_583310 ) ) ( not ( = ?auto_583300 ?auto_583311 ) ) ( not ( = ?auto_583300 ?auto_583312 ) ) ( not ( = ?auto_583300 ?auto_583313 ) ) ( not ( = ?auto_583301 ?auto_583302 ) ) ( not ( = ?auto_583301 ?auto_583303 ) ) ( not ( = ?auto_583301 ?auto_583304 ) ) ( not ( = ?auto_583301 ?auto_583305 ) ) ( not ( = ?auto_583301 ?auto_583306 ) ) ( not ( = ?auto_583301 ?auto_583307 ) ) ( not ( = ?auto_583301 ?auto_583308 ) ) ( not ( = ?auto_583301 ?auto_583309 ) ) ( not ( = ?auto_583301 ?auto_583310 ) ) ( not ( = ?auto_583301 ?auto_583311 ) ) ( not ( = ?auto_583301 ?auto_583312 ) ) ( not ( = ?auto_583301 ?auto_583313 ) ) ( not ( = ?auto_583302 ?auto_583303 ) ) ( not ( = ?auto_583302 ?auto_583304 ) ) ( not ( = ?auto_583302 ?auto_583305 ) ) ( not ( = ?auto_583302 ?auto_583306 ) ) ( not ( = ?auto_583302 ?auto_583307 ) ) ( not ( = ?auto_583302 ?auto_583308 ) ) ( not ( = ?auto_583302 ?auto_583309 ) ) ( not ( = ?auto_583302 ?auto_583310 ) ) ( not ( = ?auto_583302 ?auto_583311 ) ) ( not ( = ?auto_583302 ?auto_583312 ) ) ( not ( = ?auto_583302 ?auto_583313 ) ) ( not ( = ?auto_583303 ?auto_583304 ) ) ( not ( = ?auto_583303 ?auto_583305 ) ) ( not ( = ?auto_583303 ?auto_583306 ) ) ( not ( = ?auto_583303 ?auto_583307 ) ) ( not ( = ?auto_583303 ?auto_583308 ) ) ( not ( = ?auto_583303 ?auto_583309 ) ) ( not ( = ?auto_583303 ?auto_583310 ) ) ( not ( = ?auto_583303 ?auto_583311 ) ) ( not ( = ?auto_583303 ?auto_583312 ) ) ( not ( = ?auto_583303 ?auto_583313 ) ) ( not ( = ?auto_583304 ?auto_583305 ) ) ( not ( = ?auto_583304 ?auto_583306 ) ) ( not ( = ?auto_583304 ?auto_583307 ) ) ( not ( = ?auto_583304 ?auto_583308 ) ) ( not ( = ?auto_583304 ?auto_583309 ) ) ( not ( = ?auto_583304 ?auto_583310 ) ) ( not ( = ?auto_583304 ?auto_583311 ) ) ( not ( = ?auto_583304 ?auto_583312 ) ) ( not ( = ?auto_583304 ?auto_583313 ) ) ( not ( = ?auto_583305 ?auto_583306 ) ) ( not ( = ?auto_583305 ?auto_583307 ) ) ( not ( = ?auto_583305 ?auto_583308 ) ) ( not ( = ?auto_583305 ?auto_583309 ) ) ( not ( = ?auto_583305 ?auto_583310 ) ) ( not ( = ?auto_583305 ?auto_583311 ) ) ( not ( = ?auto_583305 ?auto_583312 ) ) ( not ( = ?auto_583305 ?auto_583313 ) ) ( not ( = ?auto_583306 ?auto_583307 ) ) ( not ( = ?auto_583306 ?auto_583308 ) ) ( not ( = ?auto_583306 ?auto_583309 ) ) ( not ( = ?auto_583306 ?auto_583310 ) ) ( not ( = ?auto_583306 ?auto_583311 ) ) ( not ( = ?auto_583306 ?auto_583312 ) ) ( not ( = ?auto_583306 ?auto_583313 ) ) ( not ( = ?auto_583307 ?auto_583308 ) ) ( not ( = ?auto_583307 ?auto_583309 ) ) ( not ( = ?auto_583307 ?auto_583310 ) ) ( not ( = ?auto_583307 ?auto_583311 ) ) ( not ( = ?auto_583307 ?auto_583312 ) ) ( not ( = ?auto_583307 ?auto_583313 ) ) ( not ( = ?auto_583308 ?auto_583309 ) ) ( not ( = ?auto_583308 ?auto_583310 ) ) ( not ( = ?auto_583308 ?auto_583311 ) ) ( not ( = ?auto_583308 ?auto_583312 ) ) ( not ( = ?auto_583308 ?auto_583313 ) ) ( not ( = ?auto_583309 ?auto_583310 ) ) ( not ( = ?auto_583309 ?auto_583311 ) ) ( not ( = ?auto_583309 ?auto_583312 ) ) ( not ( = ?auto_583309 ?auto_583313 ) ) ( not ( = ?auto_583310 ?auto_583311 ) ) ( not ( = ?auto_583310 ?auto_583312 ) ) ( not ( = ?auto_583310 ?auto_583313 ) ) ( not ( = ?auto_583311 ?auto_583312 ) ) ( not ( = ?auto_583311 ?auto_583313 ) ) ( not ( = ?auto_583312 ?auto_583313 ) ) ( ON ?auto_583312 ?auto_583313 ) ( ON ?auto_583311 ?auto_583312 ) ( CLEAR ?auto_583309 ) ( ON ?auto_583310 ?auto_583311 ) ( CLEAR ?auto_583310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_583298 ?auto_583299 ?auto_583300 ?auto_583301 ?auto_583302 ?auto_583303 ?auto_583304 ?auto_583305 ?auto_583306 ?auto_583307 ?auto_583308 ?auto_583309 ?auto_583310 )
      ( MAKE-16PILE ?auto_583298 ?auto_583299 ?auto_583300 ?auto_583301 ?auto_583302 ?auto_583303 ?auto_583304 ?auto_583305 ?auto_583306 ?auto_583307 ?auto_583308 ?auto_583309 ?auto_583310 ?auto_583311 ?auto_583312 ?auto_583313 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583330 - BLOCK
      ?auto_583331 - BLOCK
      ?auto_583332 - BLOCK
      ?auto_583333 - BLOCK
      ?auto_583334 - BLOCK
      ?auto_583335 - BLOCK
      ?auto_583336 - BLOCK
      ?auto_583337 - BLOCK
      ?auto_583338 - BLOCK
      ?auto_583339 - BLOCK
      ?auto_583340 - BLOCK
      ?auto_583341 - BLOCK
      ?auto_583342 - BLOCK
      ?auto_583343 - BLOCK
      ?auto_583344 - BLOCK
      ?auto_583345 - BLOCK
    )
    :vars
    (
      ?auto_583346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583345 ?auto_583346 ) ( ON-TABLE ?auto_583330 ) ( ON ?auto_583331 ?auto_583330 ) ( ON ?auto_583332 ?auto_583331 ) ( ON ?auto_583333 ?auto_583332 ) ( ON ?auto_583334 ?auto_583333 ) ( ON ?auto_583335 ?auto_583334 ) ( ON ?auto_583336 ?auto_583335 ) ( ON ?auto_583337 ?auto_583336 ) ( ON ?auto_583338 ?auto_583337 ) ( ON ?auto_583339 ?auto_583338 ) ( ON ?auto_583340 ?auto_583339 ) ( not ( = ?auto_583330 ?auto_583331 ) ) ( not ( = ?auto_583330 ?auto_583332 ) ) ( not ( = ?auto_583330 ?auto_583333 ) ) ( not ( = ?auto_583330 ?auto_583334 ) ) ( not ( = ?auto_583330 ?auto_583335 ) ) ( not ( = ?auto_583330 ?auto_583336 ) ) ( not ( = ?auto_583330 ?auto_583337 ) ) ( not ( = ?auto_583330 ?auto_583338 ) ) ( not ( = ?auto_583330 ?auto_583339 ) ) ( not ( = ?auto_583330 ?auto_583340 ) ) ( not ( = ?auto_583330 ?auto_583341 ) ) ( not ( = ?auto_583330 ?auto_583342 ) ) ( not ( = ?auto_583330 ?auto_583343 ) ) ( not ( = ?auto_583330 ?auto_583344 ) ) ( not ( = ?auto_583330 ?auto_583345 ) ) ( not ( = ?auto_583330 ?auto_583346 ) ) ( not ( = ?auto_583331 ?auto_583332 ) ) ( not ( = ?auto_583331 ?auto_583333 ) ) ( not ( = ?auto_583331 ?auto_583334 ) ) ( not ( = ?auto_583331 ?auto_583335 ) ) ( not ( = ?auto_583331 ?auto_583336 ) ) ( not ( = ?auto_583331 ?auto_583337 ) ) ( not ( = ?auto_583331 ?auto_583338 ) ) ( not ( = ?auto_583331 ?auto_583339 ) ) ( not ( = ?auto_583331 ?auto_583340 ) ) ( not ( = ?auto_583331 ?auto_583341 ) ) ( not ( = ?auto_583331 ?auto_583342 ) ) ( not ( = ?auto_583331 ?auto_583343 ) ) ( not ( = ?auto_583331 ?auto_583344 ) ) ( not ( = ?auto_583331 ?auto_583345 ) ) ( not ( = ?auto_583331 ?auto_583346 ) ) ( not ( = ?auto_583332 ?auto_583333 ) ) ( not ( = ?auto_583332 ?auto_583334 ) ) ( not ( = ?auto_583332 ?auto_583335 ) ) ( not ( = ?auto_583332 ?auto_583336 ) ) ( not ( = ?auto_583332 ?auto_583337 ) ) ( not ( = ?auto_583332 ?auto_583338 ) ) ( not ( = ?auto_583332 ?auto_583339 ) ) ( not ( = ?auto_583332 ?auto_583340 ) ) ( not ( = ?auto_583332 ?auto_583341 ) ) ( not ( = ?auto_583332 ?auto_583342 ) ) ( not ( = ?auto_583332 ?auto_583343 ) ) ( not ( = ?auto_583332 ?auto_583344 ) ) ( not ( = ?auto_583332 ?auto_583345 ) ) ( not ( = ?auto_583332 ?auto_583346 ) ) ( not ( = ?auto_583333 ?auto_583334 ) ) ( not ( = ?auto_583333 ?auto_583335 ) ) ( not ( = ?auto_583333 ?auto_583336 ) ) ( not ( = ?auto_583333 ?auto_583337 ) ) ( not ( = ?auto_583333 ?auto_583338 ) ) ( not ( = ?auto_583333 ?auto_583339 ) ) ( not ( = ?auto_583333 ?auto_583340 ) ) ( not ( = ?auto_583333 ?auto_583341 ) ) ( not ( = ?auto_583333 ?auto_583342 ) ) ( not ( = ?auto_583333 ?auto_583343 ) ) ( not ( = ?auto_583333 ?auto_583344 ) ) ( not ( = ?auto_583333 ?auto_583345 ) ) ( not ( = ?auto_583333 ?auto_583346 ) ) ( not ( = ?auto_583334 ?auto_583335 ) ) ( not ( = ?auto_583334 ?auto_583336 ) ) ( not ( = ?auto_583334 ?auto_583337 ) ) ( not ( = ?auto_583334 ?auto_583338 ) ) ( not ( = ?auto_583334 ?auto_583339 ) ) ( not ( = ?auto_583334 ?auto_583340 ) ) ( not ( = ?auto_583334 ?auto_583341 ) ) ( not ( = ?auto_583334 ?auto_583342 ) ) ( not ( = ?auto_583334 ?auto_583343 ) ) ( not ( = ?auto_583334 ?auto_583344 ) ) ( not ( = ?auto_583334 ?auto_583345 ) ) ( not ( = ?auto_583334 ?auto_583346 ) ) ( not ( = ?auto_583335 ?auto_583336 ) ) ( not ( = ?auto_583335 ?auto_583337 ) ) ( not ( = ?auto_583335 ?auto_583338 ) ) ( not ( = ?auto_583335 ?auto_583339 ) ) ( not ( = ?auto_583335 ?auto_583340 ) ) ( not ( = ?auto_583335 ?auto_583341 ) ) ( not ( = ?auto_583335 ?auto_583342 ) ) ( not ( = ?auto_583335 ?auto_583343 ) ) ( not ( = ?auto_583335 ?auto_583344 ) ) ( not ( = ?auto_583335 ?auto_583345 ) ) ( not ( = ?auto_583335 ?auto_583346 ) ) ( not ( = ?auto_583336 ?auto_583337 ) ) ( not ( = ?auto_583336 ?auto_583338 ) ) ( not ( = ?auto_583336 ?auto_583339 ) ) ( not ( = ?auto_583336 ?auto_583340 ) ) ( not ( = ?auto_583336 ?auto_583341 ) ) ( not ( = ?auto_583336 ?auto_583342 ) ) ( not ( = ?auto_583336 ?auto_583343 ) ) ( not ( = ?auto_583336 ?auto_583344 ) ) ( not ( = ?auto_583336 ?auto_583345 ) ) ( not ( = ?auto_583336 ?auto_583346 ) ) ( not ( = ?auto_583337 ?auto_583338 ) ) ( not ( = ?auto_583337 ?auto_583339 ) ) ( not ( = ?auto_583337 ?auto_583340 ) ) ( not ( = ?auto_583337 ?auto_583341 ) ) ( not ( = ?auto_583337 ?auto_583342 ) ) ( not ( = ?auto_583337 ?auto_583343 ) ) ( not ( = ?auto_583337 ?auto_583344 ) ) ( not ( = ?auto_583337 ?auto_583345 ) ) ( not ( = ?auto_583337 ?auto_583346 ) ) ( not ( = ?auto_583338 ?auto_583339 ) ) ( not ( = ?auto_583338 ?auto_583340 ) ) ( not ( = ?auto_583338 ?auto_583341 ) ) ( not ( = ?auto_583338 ?auto_583342 ) ) ( not ( = ?auto_583338 ?auto_583343 ) ) ( not ( = ?auto_583338 ?auto_583344 ) ) ( not ( = ?auto_583338 ?auto_583345 ) ) ( not ( = ?auto_583338 ?auto_583346 ) ) ( not ( = ?auto_583339 ?auto_583340 ) ) ( not ( = ?auto_583339 ?auto_583341 ) ) ( not ( = ?auto_583339 ?auto_583342 ) ) ( not ( = ?auto_583339 ?auto_583343 ) ) ( not ( = ?auto_583339 ?auto_583344 ) ) ( not ( = ?auto_583339 ?auto_583345 ) ) ( not ( = ?auto_583339 ?auto_583346 ) ) ( not ( = ?auto_583340 ?auto_583341 ) ) ( not ( = ?auto_583340 ?auto_583342 ) ) ( not ( = ?auto_583340 ?auto_583343 ) ) ( not ( = ?auto_583340 ?auto_583344 ) ) ( not ( = ?auto_583340 ?auto_583345 ) ) ( not ( = ?auto_583340 ?auto_583346 ) ) ( not ( = ?auto_583341 ?auto_583342 ) ) ( not ( = ?auto_583341 ?auto_583343 ) ) ( not ( = ?auto_583341 ?auto_583344 ) ) ( not ( = ?auto_583341 ?auto_583345 ) ) ( not ( = ?auto_583341 ?auto_583346 ) ) ( not ( = ?auto_583342 ?auto_583343 ) ) ( not ( = ?auto_583342 ?auto_583344 ) ) ( not ( = ?auto_583342 ?auto_583345 ) ) ( not ( = ?auto_583342 ?auto_583346 ) ) ( not ( = ?auto_583343 ?auto_583344 ) ) ( not ( = ?auto_583343 ?auto_583345 ) ) ( not ( = ?auto_583343 ?auto_583346 ) ) ( not ( = ?auto_583344 ?auto_583345 ) ) ( not ( = ?auto_583344 ?auto_583346 ) ) ( not ( = ?auto_583345 ?auto_583346 ) ) ( ON ?auto_583344 ?auto_583345 ) ( ON ?auto_583343 ?auto_583344 ) ( ON ?auto_583342 ?auto_583343 ) ( CLEAR ?auto_583340 ) ( ON ?auto_583341 ?auto_583342 ) ( CLEAR ?auto_583341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_583330 ?auto_583331 ?auto_583332 ?auto_583333 ?auto_583334 ?auto_583335 ?auto_583336 ?auto_583337 ?auto_583338 ?auto_583339 ?auto_583340 ?auto_583341 )
      ( MAKE-16PILE ?auto_583330 ?auto_583331 ?auto_583332 ?auto_583333 ?auto_583334 ?auto_583335 ?auto_583336 ?auto_583337 ?auto_583338 ?auto_583339 ?auto_583340 ?auto_583341 ?auto_583342 ?auto_583343 ?auto_583344 ?auto_583345 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583363 - BLOCK
      ?auto_583364 - BLOCK
      ?auto_583365 - BLOCK
      ?auto_583366 - BLOCK
      ?auto_583367 - BLOCK
      ?auto_583368 - BLOCK
      ?auto_583369 - BLOCK
      ?auto_583370 - BLOCK
      ?auto_583371 - BLOCK
      ?auto_583372 - BLOCK
      ?auto_583373 - BLOCK
      ?auto_583374 - BLOCK
      ?auto_583375 - BLOCK
      ?auto_583376 - BLOCK
      ?auto_583377 - BLOCK
      ?auto_583378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_583378 ) ( ON-TABLE ?auto_583363 ) ( ON ?auto_583364 ?auto_583363 ) ( ON ?auto_583365 ?auto_583364 ) ( ON ?auto_583366 ?auto_583365 ) ( ON ?auto_583367 ?auto_583366 ) ( ON ?auto_583368 ?auto_583367 ) ( ON ?auto_583369 ?auto_583368 ) ( ON ?auto_583370 ?auto_583369 ) ( ON ?auto_583371 ?auto_583370 ) ( ON ?auto_583372 ?auto_583371 ) ( ON ?auto_583373 ?auto_583372 ) ( not ( = ?auto_583363 ?auto_583364 ) ) ( not ( = ?auto_583363 ?auto_583365 ) ) ( not ( = ?auto_583363 ?auto_583366 ) ) ( not ( = ?auto_583363 ?auto_583367 ) ) ( not ( = ?auto_583363 ?auto_583368 ) ) ( not ( = ?auto_583363 ?auto_583369 ) ) ( not ( = ?auto_583363 ?auto_583370 ) ) ( not ( = ?auto_583363 ?auto_583371 ) ) ( not ( = ?auto_583363 ?auto_583372 ) ) ( not ( = ?auto_583363 ?auto_583373 ) ) ( not ( = ?auto_583363 ?auto_583374 ) ) ( not ( = ?auto_583363 ?auto_583375 ) ) ( not ( = ?auto_583363 ?auto_583376 ) ) ( not ( = ?auto_583363 ?auto_583377 ) ) ( not ( = ?auto_583363 ?auto_583378 ) ) ( not ( = ?auto_583364 ?auto_583365 ) ) ( not ( = ?auto_583364 ?auto_583366 ) ) ( not ( = ?auto_583364 ?auto_583367 ) ) ( not ( = ?auto_583364 ?auto_583368 ) ) ( not ( = ?auto_583364 ?auto_583369 ) ) ( not ( = ?auto_583364 ?auto_583370 ) ) ( not ( = ?auto_583364 ?auto_583371 ) ) ( not ( = ?auto_583364 ?auto_583372 ) ) ( not ( = ?auto_583364 ?auto_583373 ) ) ( not ( = ?auto_583364 ?auto_583374 ) ) ( not ( = ?auto_583364 ?auto_583375 ) ) ( not ( = ?auto_583364 ?auto_583376 ) ) ( not ( = ?auto_583364 ?auto_583377 ) ) ( not ( = ?auto_583364 ?auto_583378 ) ) ( not ( = ?auto_583365 ?auto_583366 ) ) ( not ( = ?auto_583365 ?auto_583367 ) ) ( not ( = ?auto_583365 ?auto_583368 ) ) ( not ( = ?auto_583365 ?auto_583369 ) ) ( not ( = ?auto_583365 ?auto_583370 ) ) ( not ( = ?auto_583365 ?auto_583371 ) ) ( not ( = ?auto_583365 ?auto_583372 ) ) ( not ( = ?auto_583365 ?auto_583373 ) ) ( not ( = ?auto_583365 ?auto_583374 ) ) ( not ( = ?auto_583365 ?auto_583375 ) ) ( not ( = ?auto_583365 ?auto_583376 ) ) ( not ( = ?auto_583365 ?auto_583377 ) ) ( not ( = ?auto_583365 ?auto_583378 ) ) ( not ( = ?auto_583366 ?auto_583367 ) ) ( not ( = ?auto_583366 ?auto_583368 ) ) ( not ( = ?auto_583366 ?auto_583369 ) ) ( not ( = ?auto_583366 ?auto_583370 ) ) ( not ( = ?auto_583366 ?auto_583371 ) ) ( not ( = ?auto_583366 ?auto_583372 ) ) ( not ( = ?auto_583366 ?auto_583373 ) ) ( not ( = ?auto_583366 ?auto_583374 ) ) ( not ( = ?auto_583366 ?auto_583375 ) ) ( not ( = ?auto_583366 ?auto_583376 ) ) ( not ( = ?auto_583366 ?auto_583377 ) ) ( not ( = ?auto_583366 ?auto_583378 ) ) ( not ( = ?auto_583367 ?auto_583368 ) ) ( not ( = ?auto_583367 ?auto_583369 ) ) ( not ( = ?auto_583367 ?auto_583370 ) ) ( not ( = ?auto_583367 ?auto_583371 ) ) ( not ( = ?auto_583367 ?auto_583372 ) ) ( not ( = ?auto_583367 ?auto_583373 ) ) ( not ( = ?auto_583367 ?auto_583374 ) ) ( not ( = ?auto_583367 ?auto_583375 ) ) ( not ( = ?auto_583367 ?auto_583376 ) ) ( not ( = ?auto_583367 ?auto_583377 ) ) ( not ( = ?auto_583367 ?auto_583378 ) ) ( not ( = ?auto_583368 ?auto_583369 ) ) ( not ( = ?auto_583368 ?auto_583370 ) ) ( not ( = ?auto_583368 ?auto_583371 ) ) ( not ( = ?auto_583368 ?auto_583372 ) ) ( not ( = ?auto_583368 ?auto_583373 ) ) ( not ( = ?auto_583368 ?auto_583374 ) ) ( not ( = ?auto_583368 ?auto_583375 ) ) ( not ( = ?auto_583368 ?auto_583376 ) ) ( not ( = ?auto_583368 ?auto_583377 ) ) ( not ( = ?auto_583368 ?auto_583378 ) ) ( not ( = ?auto_583369 ?auto_583370 ) ) ( not ( = ?auto_583369 ?auto_583371 ) ) ( not ( = ?auto_583369 ?auto_583372 ) ) ( not ( = ?auto_583369 ?auto_583373 ) ) ( not ( = ?auto_583369 ?auto_583374 ) ) ( not ( = ?auto_583369 ?auto_583375 ) ) ( not ( = ?auto_583369 ?auto_583376 ) ) ( not ( = ?auto_583369 ?auto_583377 ) ) ( not ( = ?auto_583369 ?auto_583378 ) ) ( not ( = ?auto_583370 ?auto_583371 ) ) ( not ( = ?auto_583370 ?auto_583372 ) ) ( not ( = ?auto_583370 ?auto_583373 ) ) ( not ( = ?auto_583370 ?auto_583374 ) ) ( not ( = ?auto_583370 ?auto_583375 ) ) ( not ( = ?auto_583370 ?auto_583376 ) ) ( not ( = ?auto_583370 ?auto_583377 ) ) ( not ( = ?auto_583370 ?auto_583378 ) ) ( not ( = ?auto_583371 ?auto_583372 ) ) ( not ( = ?auto_583371 ?auto_583373 ) ) ( not ( = ?auto_583371 ?auto_583374 ) ) ( not ( = ?auto_583371 ?auto_583375 ) ) ( not ( = ?auto_583371 ?auto_583376 ) ) ( not ( = ?auto_583371 ?auto_583377 ) ) ( not ( = ?auto_583371 ?auto_583378 ) ) ( not ( = ?auto_583372 ?auto_583373 ) ) ( not ( = ?auto_583372 ?auto_583374 ) ) ( not ( = ?auto_583372 ?auto_583375 ) ) ( not ( = ?auto_583372 ?auto_583376 ) ) ( not ( = ?auto_583372 ?auto_583377 ) ) ( not ( = ?auto_583372 ?auto_583378 ) ) ( not ( = ?auto_583373 ?auto_583374 ) ) ( not ( = ?auto_583373 ?auto_583375 ) ) ( not ( = ?auto_583373 ?auto_583376 ) ) ( not ( = ?auto_583373 ?auto_583377 ) ) ( not ( = ?auto_583373 ?auto_583378 ) ) ( not ( = ?auto_583374 ?auto_583375 ) ) ( not ( = ?auto_583374 ?auto_583376 ) ) ( not ( = ?auto_583374 ?auto_583377 ) ) ( not ( = ?auto_583374 ?auto_583378 ) ) ( not ( = ?auto_583375 ?auto_583376 ) ) ( not ( = ?auto_583375 ?auto_583377 ) ) ( not ( = ?auto_583375 ?auto_583378 ) ) ( not ( = ?auto_583376 ?auto_583377 ) ) ( not ( = ?auto_583376 ?auto_583378 ) ) ( not ( = ?auto_583377 ?auto_583378 ) ) ( ON ?auto_583377 ?auto_583378 ) ( ON ?auto_583376 ?auto_583377 ) ( ON ?auto_583375 ?auto_583376 ) ( CLEAR ?auto_583373 ) ( ON ?auto_583374 ?auto_583375 ) ( CLEAR ?auto_583374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_583363 ?auto_583364 ?auto_583365 ?auto_583366 ?auto_583367 ?auto_583368 ?auto_583369 ?auto_583370 ?auto_583371 ?auto_583372 ?auto_583373 ?auto_583374 )
      ( MAKE-16PILE ?auto_583363 ?auto_583364 ?auto_583365 ?auto_583366 ?auto_583367 ?auto_583368 ?auto_583369 ?auto_583370 ?auto_583371 ?auto_583372 ?auto_583373 ?auto_583374 ?auto_583375 ?auto_583376 ?auto_583377 ?auto_583378 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583395 - BLOCK
      ?auto_583396 - BLOCK
      ?auto_583397 - BLOCK
      ?auto_583398 - BLOCK
      ?auto_583399 - BLOCK
      ?auto_583400 - BLOCK
      ?auto_583401 - BLOCK
      ?auto_583402 - BLOCK
      ?auto_583403 - BLOCK
      ?auto_583404 - BLOCK
      ?auto_583405 - BLOCK
      ?auto_583406 - BLOCK
      ?auto_583407 - BLOCK
      ?auto_583408 - BLOCK
      ?auto_583409 - BLOCK
      ?auto_583410 - BLOCK
    )
    :vars
    (
      ?auto_583411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583410 ?auto_583411 ) ( ON-TABLE ?auto_583395 ) ( ON ?auto_583396 ?auto_583395 ) ( ON ?auto_583397 ?auto_583396 ) ( ON ?auto_583398 ?auto_583397 ) ( ON ?auto_583399 ?auto_583398 ) ( ON ?auto_583400 ?auto_583399 ) ( ON ?auto_583401 ?auto_583400 ) ( ON ?auto_583402 ?auto_583401 ) ( ON ?auto_583403 ?auto_583402 ) ( ON ?auto_583404 ?auto_583403 ) ( not ( = ?auto_583395 ?auto_583396 ) ) ( not ( = ?auto_583395 ?auto_583397 ) ) ( not ( = ?auto_583395 ?auto_583398 ) ) ( not ( = ?auto_583395 ?auto_583399 ) ) ( not ( = ?auto_583395 ?auto_583400 ) ) ( not ( = ?auto_583395 ?auto_583401 ) ) ( not ( = ?auto_583395 ?auto_583402 ) ) ( not ( = ?auto_583395 ?auto_583403 ) ) ( not ( = ?auto_583395 ?auto_583404 ) ) ( not ( = ?auto_583395 ?auto_583405 ) ) ( not ( = ?auto_583395 ?auto_583406 ) ) ( not ( = ?auto_583395 ?auto_583407 ) ) ( not ( = ?auto_583395 ?auto_583408 ) ) ( not ( = ?auto_583395 ?auto_583409 ) ) ( not ( = ?auto_583395 ?auto_583410 ) ) ( not ( = ?auto_583395 ?auto_583411 ) ) ( not ( = ?auto_583396 ?auto_583397 ) ) ( not ( = ?auto_583396 ?auto_583398 ) ) ( not ( = ?auto_583396 ?auto_583399 ) ) ( not ( = ?auto_583396 ?auto_583400 ) ) ( not ( = ?auto_583396 ?auto_583401 ) ) ( not ( = ?auto_583396 ?auto_583402 ) ) ( not ( = ?auto_583396 ?auto_583403 ) ) ( not ( = ?auto_583396 ?auto_583404 ) ) ( not ( = ?auto_583396 ?auto_583405 ) ) ( not ( = ?auto_583396 ?auto_583406 ) ) ( not ( = ?auto_583396 ?auto_583407 ) ) ( not ( = ?auto_583396 ?auto_583408 ) ) ( not ( = ?auto_583396 ?auto_583409 ) ) ( not ( = ?auto_583396 ?auto_583410 ) ) ( not ( = ?auto_583396 ?auto_583411 ) ) ( not ( = ?auto_583397 ?auto_583398 ) ) ( not ( = ?auto_583397 ?auto_583399 ) ) ( not ( = ?auto_583397 ?auto_583400 ) ) ( not ( = ?auto_583397 ?auto_583401 ) ) ( not ( = ?auto_583397 ?auto_583402 ) ) ( not ( = ?auto_583397 ?auto_583403 ) ) ( not ( = ?auto_583397 ?auto_583404 ) ) ( not ( = ?auto_583397 ?auto_583405 ) ) ( not ( = ?auto_583397 ?auto_583406 ) ) ( not ( = ?auto_583397 ?auto_583407 ) ) ( not ( = ?auto_583397 ?auto_583408 ) ) ( not ( = ?auto_583397 ?auto_583409 ) ) ( not ( = ?auto_583397 ?auto_583410 ) ) ( not ( = ?auto_583397 ?auto_583411 ) ) ( not ( = ?auto_583398 ?auto_583399 ) ) ( not ( = ?auto_583398 ?auto_583400 ) ) ( not ( = ?auto_583398 ?auto_583401 ) ) ( not ( = ?auto_583398 ?auto_583402 ) ) ( not ( = ?auto_583398 ?auto_583403 ) ) ( not ( = ?auto_583398 ?auto_583404 ) ) ( not ( = ?auto_583398 ?auto_583405 ) ) ( not ( = ?auto_583398 ?auto_583406 ) ) ( not ( = ?auto_583398 ?auto_583407 ) ) ( not ( = ?auto_583398 ?auto_583408 ) ) ( not ( = ?auto_583398 ?auto_583409 ) ) ( not ( = ?auto_583398 ?auto_583410 ) ) ( not ( = ?auto_583398 ?auto_583411 ) ) ( not ( = ?auto_583399 ?auto_583400 ) ) ( not ( = ?auto_583399 ?auto_583401 ) ) ( not ( = ?auto_583399 ?auto_583402 ) ) ( not ( = ?auto_583399 ?auto_583403 ) ) ( not ( = ?auto_583399 ?auto_583404 ) ) ( not ( = ?auto_583399 ?auto_583405 ) ) ( not ( = ?auto_583399 ?auto_583406 ) ) ( not ( = ?auto_583399 ?auto_583407 ) ) ( not ( = ?auto_583399 ?auto_583408 ) ) ( not ( = ?auto_583399 ?auto_583409 ) ) ( not ( = ?auto_583399 ?auto_583410 ) ) ( not ( = ?auto_583399 ?auto_583411 ) ) ( not ( = ?auto_583400 ?auto_583401 ) ) ( not ( = ?auto_583400 ?auto_583402 ) ) ( not ( = ?auto_583400 ?auto_583403 ) ) ( not ( = ?auto_583400 ?auto_583404 ) ) ( not ( = ?auto_583400 ?auto_583405 ) ) ( not ( = ?auto_583400 ?auto_583406 ) ) ( not ( = ?auto_583400 ?auto_583407 ) ) ( not ( = ?auto_583400 ?auto_583408 ) ) ( not ( = ?auto_583400 ?auto_583409 ) ) ( not ( = ?auto_583400 ?auto_583410 ) ) ( not ( = ?auto_583400 ?auto_583411 ) ) ( not ( = ?auto_583401 ?auto_583402 ) ) ( not ( = ?auto_583401 ?auto_583403 ) ) ( not ( = ?auto_583401 ?auto_583404 ) ) ( not ( = ?auto_583401 ?auto_583405 ) ) ( not ( = ?auto_583401 ?auto_583406 ) ) ( not ( = ?auto_583401 ?auto_583407 ) ) ( not ( = ?auto_583401 ?auto_583408 ) ) ( not ( = ?auto_583401 ?auto_583409 ) ) ( not ( = ?auto_583401 ?auto_583410 ) ) ( not ( = ?auto_583401 ?auto_583411 ) ) ( not ( = ?auto_583402 ?auto_583403 ) ) ( not ( = ?auto_583402 ?auto_583404 ) ) ( not ( = ?auto_583402 ?auto_583405 ) ) ( not ( = ?auto_583402 ?auto_583406 ) ) ( not ( = ?auto_583402 ?auto_583407 ) ) ( not ( = ?auto_583402 ?auto_583408 ) ) ( not ( = ?auto_583402 ?auto_583409 ) ) ( not ( = ?auto_583402 ?auto_583410 ) ) ( not ( = ?auto_583402 ?auto_583411 ) ) ( not ( = ?auto_583403 ?auto_583404 ) ) ( not ( = ?auto_583403 ?auto_583405 ) ) ( not ( = ?auto_583403 ?auto_583406 ) ) ( not ( = ?auto_583403 ?auto_583407 ) ) ( not ( = ?auto_583403 ?auto_583408 ) ) ( not ( = ?auto_583403 ?auto_583409 ) ) ( not ( = ?auto_583403 ?auto_583410 ) ) ( not ( = ?auto_583403 ?auto_583411 ) ) ( not ( = ?auto_583404 ?auto_583405 ) ) ( not ( = ?auto_583404 ?auto_583406 ) ) ( not ( = ?auto_583404 ?auto_583407 ) ) ( not ( = ?auto_583404 ?auto_583408 ) ) ( not ( = ?auto_583404 ?auto_583409 ) ) ( not ( = ?auto_583404 ?auto_583410 ) ) ( not ( = ?auto_583404 ?auto_583411 ) ) ( not ( = ?auto_583405 ?auto_583406 ) ) ( not ( = ?auto_583405 ?auto_583407 ) ) ( not ( = ?auto_583405 ?auto_583408 ) ) ( not ( = ?auto_583405 ?auto_583409 ) ) ( not ( = ?auto_583405 ?auto_583410 ) ) ( not ( = ?auto_583405 ?auto_583411 ) ) ( not ( = ?auto_583406 ?auto_583407 ) ) ( not ( = ?auto_583406 ?auto_583408 ) ) ( not ( = ?auto_583406 ?auto_583409 ) ) ( not ( = ?auto_583406 ?auto_583410 ) ) ( not ( = ?auto_583406 ?auto_583411 ) ) ( not ( = ?auto_583407 ?auto_583408 ) ) ( not ( = ?auto_583407 ?auto_583409 ) ) ( not ( = ?auto_583407 ?auto_583410 ) ) ( not ( = ?auto_583407 ?auto_583411 ) ) ( not ( = ?auto_583408 ?auto_583409 ) ) ( not ( = ?auto_583408 ?auto_583410 ) ) ( not ( = ?auto_583408 ?auto_583411 ) ) ( not ( = ?auto_583409 ?auto_583410 ) ) ( not ( = ?auto_583409 ?auto_583411 ) ) ( not ( = ?auto_583410 ?auto_583411 ) ) ( ON ?auto_583409 ?auto_583410 ) ( ON ?auto_583408 ?auto_583409 ) ( ON ?auto_583407 ?auto_583408 ) ( ON ?auto_583406 ?auto_583407 ) ( CLEAR ?auto_583404 ) ( ON ?auto_583405 ?auto_583406 ) ( CLEAR ?auto_583405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_583395 ?auto_583396 ?auto_583397 ?auto_583398 ?auto_583399 ?auto_583400 ?auto_583401 ?auto_583402 ?auto_583403 ?auto_583404 ?auto_583405 )
      ( MAKE-16PILE ?auto_583395 ?auto_583396 ?auto_583397 ?auto_583398 ?auto_583399 ?auto_583400 ?auto_583401 ?auto_583402 ?auto_583403 ?auto_583404 ?auto_583405 ?auto_583406 ?auto_583407 ?auto_583408 ?auto_583409 ?auto_583410 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583428 - BLOCK
      ?auto_583429 - BLOCK
      ?auto_583430 - BLOCK
      ?auto_583431 - BLOCK
      ?auto_583432 - BLOCK
      ?auto_583433 - BLOCK
      ?auto_583434 - BLOCK
      ?auto_583435 - BLOCK
      ?auto_583436 - BLOCK
      ?auto_583437 - BLOCK
      ?auto_583438 - BLOCK
      ?auto_583439 - BLOCK
      ?auto_583440 - BLOCK
      ?auto_583441 - BLOCK
      ?auto_583442 - BLOCK
      ?auto_583443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_583443 ) ( ON-TABLE ?auto_583428 ) ( ON ?auto_583429 ?auto_583428 ) ( ON ?auto_583430 ?auto_583429 ) ( ON ?auto_583431 ?auto_583430 ) ( ON ?auto_583432 ?auto_583431 ) ( ON ?auto_583433 ?auto_583432 ) ( ON ?auto_583434 ?auto_583433 ) ( ON ?auto_583435 ?auto_583434 ) ( ON ?auto_583436 ?auto_583435 ) ( ON ?auto_583437 ?auto_583436 ) ( not ( = ?auto_583428 ?auto_583429 ) ) ( not ( = ?auto_583428 ?auto_583430 ) ) ( not ( = ?auto_583428 ?auto_583431 ) ) ( not ( = ?auto_583428 ?auto_583432 ) ) ( not ( = ?auto_583428 ?auto_583433 ) ) ( not ( = ?auto_583428 ?auto_583434 ) ) ( not ( = ?auto_583428 ?auto_583435 ) ) ( not ( = ?auto_583428 ?auto_583436 ) ) ( not ( = ?auto_583428 ?auto_583437 ) ) ( not ( = ?auto_583428 ?auto_583438 ) ) ( not ( = ?auto_583428 ?auto_583439 ) ) ( not ( = ?auto_583428 ?auto_583440 ) ) ( not ( = ?auto_583428 ?auto_583441 ) ) ( not ( = ?auto_583428 ?auto_583442 ) ) ( not ( = ?auto_583428 ?auto_583443 ) ) ( not ( = ?auto_583429 ?auto_583430 ) ) ( not ( = ?auto_583429 ?auto_583431 ) ) ( not ( = ?auto_583429 ?auto_583432 ) ) ( not ( = ?auto_583429 ?auto_583433 ) ) ( not ( = ?auto_583429 ?auto_583434 ) ) ( not ( = ?auto_583429 ?auto_583435 ) ) ( not ( = ?auto_583429 ?auto_583436 ) ) ( not ( = ?auto_583429 ?auto_583437 ) ) ( not ( = ?auto_583429 ?auto_583438 ) ) ( not ( = ?auto_583429 ?auto_583439 ) ) ( not ( = ?auto_583429 ?auto_583440 ) ) ( not ( = ?auto_583429 ?auto_583441 ) ) ( not ( = ?auto_583429 ?auto_583442 ) ) ( not ( = ?auto_583429 ?auto_583443 ) ) ( not ( = ?auto_583430 ?auto_583431 ) ) ( not ( = ?auto_583430 ?auto_583432 ) ) ( not ( = ?auto_583430 ?auto_583433 ) ) ( not ( = ?auto_583430 ?auto_583434 ) ) ( not ( = ?auto_583430 ?auto_583435 ) ) ( not ( = ?auto_583430 ?auto_583436 ) ) ( not ( = ?auto_583430 ?auto_583437 ) ) ( not ( = ?auto_583430 ?auto_583438 ) ) ( not ( = ?auto_583430 ?auto_583439 ) ) ( not ( = ?auto_583430 ?auto_583440 ) ) ( not ( = ?auto_583430 ?auto_583441 ) ) ( not ( = ?auto_583430 ?auto_583442 ) ) ( not ( = ?auto_583430 ?auto_583443 ) ) ( not ( = ?auto_583431 ?auto_583432 ) ) ( not ( = ?auto_583431 ?auto_583433 ) ) ( not ( = ?auto_583431 ?auto_583434 ) ) ( not ( = ?auto_583431 ?auto_583435 ) ) ( not ( = ?auto_583431 ?auto_583436 ) ) ( not ( = ?auto_583431 ?auto_583437 ) ) ( not ( = ?auto_583431 ?auto_583438 ) ) ( not ( = ?auto_583431 ?auto_583439 ) ) ( not ( = ?auto_583431 ?auto_583440 ) ) ( not ( = ?auto_583431 ?auto_583441 ) ) ( not ( = ?auto_583431 ?auto_583442 ) ) ( not ( = ?auto_583431 ?auto_583443 ) ) ( not ( = ?auto_583432 ?auto_583433 ) ) ( not ( = ?auto_583432 ?auto_583434 ) ) ( not ( = ?auto_583432 ?auto_583435 ) ) ( not ( = ?auto_583432 ?auto_583436 ) ) ( not ( = ?auto_583432 ?auto_583437 ) ) ( not ( = ?auto_583432 ?auto_583438 ) ) ( not ( = ?auto_583432 ?auto_583439 ) ) ( not ( = ?auto_583432 ?auto_583440 ) ) ( not ( = ?auto_583432 ?auto_583441 ) ) ( not ( = ?auto_583432 ?auto_583442 ) ) ( not ( = ?auto_583432 ?auto_583443 ) ) ( not ( = ?auto_583433 ?auto_583434 ) ) ( not ( = ?auto_583433 ?auto_583435 ) ) ( not ( = ?auto_583433 ?auto_583436 ) ) ( not ( = ?auto_583433 ?auto_583437 ) ) ( not ( = ?auto_583433 ?auto_583438 ) ) ( not ( = ?auto_583433 ?auto_583439 ) ) ( not ( = ?auto_583433 ?auto_583440 ) ) ( not ( = ?auto_583433 ?auto_583441 ) ) ( not ( = ?auto_583433 ?auto_583442 ) ) ( not ( = ?auto_583433 ?auto_583443 ) ) ( not ( = ?auto_583434 ?auto_583435 ) ) ( not ( = ?auto_583434 ?auto_583436 ) ) ( not ( = ?auto_583434 ?auto_583437 ) ) ( not ( = ?auto_583434 ?auto_583438 ) ) ( not ( = ?auto_583434 ?auto_583439 ) ) ( not ( = ?auto_583434 ?auto_583440 ) ) ( not ( = ?auto_583434 ?auto_583441 ) ) ( not ( = ?auto_583434 ?auto_583442 ) ) ( not ( = ?auto_583434 ?auto_583443 ) ) ( not ( = ?auto_583435 ?auto_583436 ) ) ( not ( = ?auto_583435 ?auto_583437 ) ) ( not ( = ?auto_583435 ?auto_583438 ) ) ( not ( = ?auto_583435 ?auto_583439 ) ) ( not ( = ?auto_583435 ?auto_583440 ) ) ( not ( = ?auto_583435 ?auto_583441 ) ) ( not ( = ?auto_583435 ?auto_583442 ) ) ( not ( = ?auto_583435 ?auto_583443 ) ) ( not ( = ?auto_583436 ?auto_583437 ) ) ( not ( = ?auto_583436 ?auto_583438 ) ) ( not ( = ?auto_583436 ?auto_583439 ) ) ( not ( = ?auto_583436 ?auto_583440 ) ) ( not ( = ?auto_583436 ?auto_583441 ) ) ( not ( = ?auto_583436 ?auto_583442 ) ) ( not ( = ?auto_583436 ?auto_583443 ) ) ( not ( = ?auto_583437 ?auto_583438 ) ) ( not ( = ?auto_583437 ?auto_583439 ) ) ( not ( = ?auto_583437 ?auto_583440 ) ) ( not ( = ?auto_583437 ?auto_583441 ) ) ( not ( = ?auto_583437 ?auto_583442 ) ) ( not ( = ?auto_583437 ?auto_583443 ) ) ( not ( = ?auto_583438 ?auto_583439 ) ) ( not ( = ?auto_583438 ?auto_583440 ) ) ( not ( = ?auto_583438 ?auto_583441 ) ) ( not ( = ?auto_583438 ?auto_583442 ) ) ( not ( = ?auto_583438 ?auto_583443 ) ) ( not ( = ?auto_583439 ?auto_583440 ) ) ( not ( = ?auto_583439 ?auto_583441 ) ) ( not ( = ?auto_583439 ?auto_583442 ) ) ( not ( = ?auto_583439 ?auto_583443 ) ) ( not ( = ?auto_583440 ?auto_583441 ) ) ( not ( = ?auto_583440 ?auto_583442 ) ) ( not ( = ?auto_583440 ?auto_583443 ) ) ( not ( = ?auto_583441 ?auto_583442 ) ) ( not ( = ?auto_583441 ?auto_583443 ) ) ( not ( = ?auto_583442 ?auto_583443 ) ) ( ON ?auto_583442 ?auto_583443 ) ( ON ?auto_583441 ?auto_583442 ) ( ON ?auto_583440 ?auto_583441 ) ( ON ?auto_583439 ?auto_583440 ) ( CLEAR ?auto_583437 ) ( ON ?auto_583438 ?auto_583439 ) ( CLEAR ?auto_583438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_583428 ?auto_583429 ?auto_583430 ?auto_583431 ?auto_583432 ?auto_583433 ?auto_583434 ?auto_583435 ?auto_583436 ?auto_583437 ?auto_583438 )
      ( MAKE-16PILE ?auto_583428 ?auto_583429 ?auto_583430 ?auto_583431 ?auto_583432 ?auto_583433 ?auto_583434 ?auto_583435 ?auto_583436 ?auto_583437 ?auto_583438 ?auto_583439 ?auto_583440 ?auto_583441 ?auto_583442 ?auto_583443 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583460 - BLOCK
      ?auto_583461 - BLOCK
      ?auto_583462 - BLOCK
      ?auto_583463 - BLOCK
      ?auto_583464 - BLOCK
      ?auto_583465 - BLOCK
      ?auto_583466 - BLOCK
      ?auto_583467 - BLOCK
      ?auto_583468 - BLOCK
      ?auto_583469 - BLOCK
      ?auto_583470 - BLOCK
      ?auto_583471 - BLOCK
      ?auto_583472 - BLOCK
      ?auto_583473 - BLOCK
      ?auto_583474 - BLOCK
      ?auto_583475 - BLOCK
    )
    :vars
    (
      ?auto_583476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583475 ?auto_583476 ) ( ON-TABLE ?auto_583460 ) ( ON ?auto_583461 ?auto_583460 ) ( ON ?auto_583462 ?auto_583461 ) ( ON ?auto_583463 ?auto_583462 ) ( ON ?auto_583464 ?auto_583463 ) ( ON ?auto_583465 ?auto_583464 ) ( ON ?auto_583466 ?auto_583465 ) ( ON ?auto_583467 ?auto_583466 ) ( ON ?auto_583468 ?auto_583467 ) ( not ( = ?auto_583460 ?auto_583461 ) ) ( not ( = ?auto_583460 ?auto_583462 ) ) ( not ( = ?auto_583460 ?auto_583463 ) ) ( not ( = ?auto_583460 ?auto_583464 ) ) ( not ( = ?auto_583460 ?auto_583465 ) ) ( not ( = ?auto_583460 ?auto_583466 ) ) ( not ( = ?auto_583460 ?auto_583467 ) ) ( not ( = ?auto_583460 ?auto_583468 ) ) ( not ( = ?auto_583460 ?auto_583469 ) ) ( not ( = ?auto_583460 ?auto_583470 ) ) ( not ( = ?auto_583460 ?auto_583471 ) ) ( not ( = ?auto_583460 ?auto_583472 ) ) ( not ( = ?auto_583460 ?auto_583473 ) ) ( not ( = ?auto_583460 ?auto_583474 ) ) ( not ( = ?auto_583460 ?auto_583475 ) ) ( not ( = ?auto_583460 ?auto_583476 ) ) ( not ( = ?auto_583461 ?auto_583462 ) ) ( not ( = ?auto_583461 ?auto_583463 ) ) ( not ( = ?auto_583461 ?auto_583464 ) ) ( not ( = ?auto_583461 ?auto_583465 ) ) ( not ( = ?auto_583461 ?auto_583466 ) ) ( not ( = ?auto_583461 ?auto_583467 ) ) ( not ( = ?auto_583461 ?auto_583468 ) ) ( not ( = ?auto_583461 ?auto_583469 ) ) ( not ( = ?auto_583461 ?auto_583470 ) ) ( not ( = ?auto_583461 ?auto_583471 ) ) ( not ( = ?auto_583461 ?auto_583472 ) ) ( not ( = ?auto_583461 ?auto_583473 ) ) ( not ( = ?auto_583461 ?auto_583474 ) ) ( not ( = ?auto_583461 ?auto_583475 ) ) ( not ( = ?auto_583461 ?auto_583476 ) ) ( not ( = ?auto_583462 ?auto_583463 ) ) ( not ( = ?auto_583462 ?auto_583464 ) ) ( not ( = ?auto_583462 ?auto_583465 ) ) ( not ( = ?auto_583462 ?auto_583466 ) ) ( not ( = ?auto_583462 ?auto_583467 ) ) ( not ( = ?auto_583462 ?auto_583468 ) ) ( not ( = ?auto_583462 ?auto_583469 ) ) ( not ( = ?auto_583462 ?auto_583470 ) ) ( not ( = ?auto_583462 ?auto_583471 ) ) ( not ( = ?auto_583462 ?auto_583472 ) ) ( not ( = ?auto_583462 ?auto_583473 ) ) ( not ( = ?auto_583462 ?auto_583474 ) ) ( not ( = ?auto_583462 ?auto_583475 ) ) ( not ( = ?auto_583462 ?auto_583476 ) ) ( not ( = ?auto_583463 ?auto_583464 ) ) ( not ( = ?auto_583463 ?auto_583465 ) ) ( not ( = ?auto_583463 ?auto_583466 ) ) ( not ( = ?auto_583463 ?auto_583467 ) ) ( not ( = ?auto_583463 ?auto_583468 ) ) ( not ( = ?auto_583463 ?auto_583469 ) ) ( not ( = ?auto_583463 ?auto_583470 ) ) ( not ( = ?auto_583463 ?auto_583471 ) ) ( not ( = ?auto_583463 ?auto_583472 ) ) ( not ( = ?auto_583463 ?auto_583473 ) ) ( not ( = ?auto_583463 ?auto_583474 ) ) ( not ( = ?auto_583463 ?auto_583475 ) ) ( not ( = ?auto_583463 ?auto_583476 ) ) ( not ( = ?auto_583464 ?auto_583465 ) ) ( not ( = ?auto_583464 ?auto_583466 ) ) ( not ( = ?auto_583464 ?auto_583467 ) ) ( not ( = ?auto_583464 ?auto_583468 ) ) ( not ( = ?auto_583464 ?auto_583469 ) ) ( not ( = ?auto_583464 ?auto_583470 ) ) ( not ( = ?auto_583464 ?auto_583471 ) ) ( not ( = ?auto_583464 ?auto_583472 ) ) ( not ( = ?auto_583464 ?auto_583473 ) ) ( not ( = ?auto_583464 ?auto_583474 ) ) ( not ( = ?auto_583464 ?auto_583475 ) ) ( not ( = ?auto_583464 ?auto_583476 ) ) ( not ( = ?auto_583465 ?auto_583466 ) ) ( not ( = ?auto_583465 ?auto_583467 ) ) ( not ( = ?auto_583465 ?auto_583468 ) ) ( not ( = ?auto_583465 ?auto_583469 ) ) ( not ( = ?auto_583465 ?auto_583470 ) ) ( not ( = ?auto_583465 ?auto_583471 ) ) ( not ( = ?auto_583465 ?auto_583472 ) ) ( not ( = ?auto_583465 ?auto_583473 ) ) ( not ( = ?auto_583465 ?auto_583474 ) ) ( not ( = ?auto_583465 ?auto_583475 ) ) ( not ( = ?auto_583465 ?auto_583476 ) ) ( not ( = ?auto_583466 ?auto_583467 ) ) ( not ( = ?auto_583466 ?auto_583468 ) ) ( not ( = ?auto_583466 ?auto_583469 ) ) ( not ( = ?auto_583466 ?auto_583470 ) ) ( not ( = ?auto_583466 ?auto_583471 ) ) ( not ( = ?auto_583466 ?auto_583472 ) ) ( not ( = ?auto_583466 ?auto_583473 ) ) ( not ( = ?auto_583466 ?auto_583474 ) ) ( not ( = ?auto_583466 ?auto_583475 ) ) ( not ( = ?auto_583466 ?auto_583476 ) ) ( not ( = ?auto_583467 ?auto_583468 ) ) ( not ( = ?auto_583467 ?auto_583469 ) ) ( not ( = ?auto_583467 ?auto_583470 ) ) ( not ( = ?auto_583467 ?auto_583471 ) ) ( not ( = ?auto_583467 ?auto_583472 ) ) ( not ( = ?auto_583467 ?auto_583473 ) ) ( not ( = ?auto_583467 ?auto_583474 ) ) ( not ( = ?auto_583467 ?auto_583475 ) ) ( not ( = ?auto_583467 ?auto_583476 ) ) ( not ( = ?auto_583468 ?auto_583469 ) ) ( not ( = ?auto_583468 ?auto_583470 ) ) ( not ( = ?auto_583468 ?auto_583471 ) ) ( not ( = ?auto_583468 ?auto_583472 ) ) ( not ( = ?auto_583468 ?auto_583473 ) ) ( not ( = ?auto_583468 ?auto_583474 ) ) ( not ( = ?auto_583468 ?auto_583475 ) ) ( not ( = ?auto_583468 ?auto_583476 ) ) ( not ( = ?auto_583469 ?auto_583470 ) ) ( not ( = ?auto_583469 ?auto_583471 ) ) ( not ( = ?auto_583469 ?auto_583472 ) ) ( not ( = ?auto_583469 ?auto_583473 ) ) ( not ( = ?auto_583469 ?auto_583474 ) ) ( not ( = ?auto_583469 ?auto_583475 ) ) ( not ( = ?auto_583469 ?auto_583476 ) ) ( not ( = ?auto_583470 ?auto_583471 ) ) ( not ( = ?auto_583470 ?auto_583472 ) ) ( not ( = ?auto_583470 ?auto_583473 ) ) ( not ( = ?auto_583470 ?auto_583474 ) ) ( not ( = ?auto_583470 ?auto_583475 ) ) ( not ( = ?auto_583470 ?auto_583476 ) ) ( not ( = ?auto_583471 ?auto_583472 ) ) ( not ( = ?auto_583471 ?auto_583473 ) ) ( not ( = ?auto_583471 ?auto_583474 ) ) ( not ( = ?auto_583471 ?auto_583475 ) ) ( not ( = ?auto_583471 ?auto_583476 ) ) ( not ( = ?auto_583472 ?auto_583473 ) ) ( not ( = ?auto_583472 ?auto_583474 ) ) ( not ( = ?auto_583472 ?auto_583475 ) ) ( not ( = ?auto_583472 ?auto_583476 ) ) ( not ( = ?auto_583473 ?auto_583474 ) ) ( not ( = ?auto_583473 ?auto_583475 ) ) ( not ( = ?auto_583473 ?auto_583476 ) ) ( not ( = ?auto_583474 ?auto_583475 ) ) ( not ( = ?auto_583474 ?auto_583476 ) ) ( not ( = ?auto_583475 ?auto_583476 ) ) ( ON ?auto_583474 ?auto_583475 ) ( ON ?auto_583473 ?auto_583474 ) ( ON ?auto_583472 ?auto_583473 ) ( ON ?auto_583471 ?auto_583472 ) ( ON ?auto_583470 ?auto_583471 ) ( CLEAR ?auto_583468 ) ( ON ?auto_583469 ?auto_583470 ) ( CLEAR ?auto_583469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_583460 ?auto_583461 ?auto_583462 ?auto_583463 ?auto_583464 ?auto_583465 ?auto_583466 ?auto_583467 ?auto_583468 ?auto_583469 )
      ( MAKE-16PILE ?auto_583460 ?auto_583461 ?auto_583462 ?auto_583463 ?auto_583464 ?auto_583465 ?auto_583466 ?auto_583467 ?auto_583468 ?auto_583469 ?auto_583470 ?auto_583471 ?auto_583472 ?auto_583473 ?auto_583474 ?auto_583475 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583493 - BLOCK
      ?auto_583494 - BLOCK
      ?auto_583495 - BLOCK
      ?auto_583496 - BLOCK
      ?auto_583497 - BLOCK
      ?auto_583498 - BLOCK
      ?auto_583499 - BLOCK
      ?auto_583500 - BLOCK
      ?auto_583501 - BLOCK
      ?auto_583502 - BLOCK
      ?auto_583503 - BLOCK
      ?auto_583504 - BLOCK
      ?auto_583505 - BLOCK
      ?auto_583506 - BLOCK
      ?auto_583507 - BLOCK
      ?auto_583508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_583508 ) ( ON-TABLE ?auto_583493 ) ( ON ?auto_583494 ?auto_583493 ) ( ON ?auto_583495 ?auto_583494 ) ( ON ?auto_583496 ?auto_583495 ) ( ON ?auto_583497 ?auto_583496 ) ( ON ?auto_583498 ?auto_583497 ) ( ON ?auto_583499 ?auto_583498 ) ( ON ?auto_583500 ?auto_583499 ) ( ON ?auto_583501 ?auto_583500 ) ( not ( = ?auto_583493 ?auto_583494 ) ) ( not ( = ?auto_583493 ?auto_583495 ) ) ( not ( = ?auto_583493 ?auto_583496 ) ) ( not ( = ?auto_583493 ?auto_583497 ) ) ( not ( = ?auto_583493 ?auto_583498 ) ) ( not ( = ?auto_583493 ?auto_583499 ) ) ( not ( = ?auto_583493 ?auto_583500 ) ) ( not ( = ?auto_583493 ?auto_583501 ) ) ( not ( = ?auto_583493 ?auto_583502 ) ) ( not ( = ?auto_583493 ?auto_583503 ) ) ( not ( = ?auto_583493 ?auto_583504 ) ) ( not ( = ?auto_583493 ?auto_583505 ) ) ( not ( = ?auto_583493 ?auto_583506 ) ) ( not ( = ?auto_583493 ?auto_583507 ) ) ( not ( = ?auto_583493 ?auto_583508 ) ) ( not ( = ?auto_583494 ?auto_583495 ) ) ( not ( = ?auto_583494 ?auto_583496 ) ) ( not ( = ?auto_583494 ?auto_583497 ) ) ( not ( = ?auto_583494 ?auto_583498 ) ) ( not ( = ?auto_583494 ?auto_583499 ) ) ( not ( = ?auto_583494 ?auto_583500 ) ) ( not ( = ?auto_583494 ?auto_583501 ) ) ( not ( = ?auto_583494 ?auto_583502 ) ) ( not ( = ?auto_583494 ?auto_583503 ) ) ( not ( = ?auto_583494 ?auto_583504 ) ) ( not ( = ?auto_583494 ?auto_583505 ) ) ( not ( = ?auto_583494 ?auto_583506 ) ) ( not ( = ?auto_583494 ?auto_583507 ) ) ( not ( = ?auto_583494 ?auto_583508 ) ) ( not ( = ?auto_583495 ?auto_583496 ) ) ( not ( = ?auto_583495 ?auto_583497 ) ) ( not ( = ?auto_583495 ?auto_583498 ) ) ( not ( = ?auto_583495 ?auto_583499 ) ) ( not ( = ?auto_583495 ?auto_583500 ) ) ( not ( = ?auto_583495 ?auto_583501 ) ) ( not ( = ?auto_583495 ?auto_583502 ) ) ( not ( = ?auto_583495 ?auto_583503 ) ) ( not ( = ?auto_583495 ?auto_583504 ) ) ( not ( = ?auto_583495 ?auto_583505 ) ) ( not ( = ?auto_583495 ?auto_583506 ) ) ( not ( = ?auto_583495 ?auto_583507 ) ) ( not ( = ?auto_583495 ?auto_583508 ) ) ( not ( = ?auto_583496 ?auto_583497 ) ) ( not ( = ?auto_583496 ?auto_583498 ) ) ( not ( = ?auto_583496 ?auto_583499 ) ) ( not ( = ?auto_583496 ?auto_583500 ) ) ( not ( = ?auto_583496 ?auto_583501 ) ) ( not ( = ?auto_583496 ?auto_583502 ) ) ( not ( = ?auto_583496 ?auto_583503 ) ) ( not ( = ?auto_583496 ?auto_583504 ) ) ( not ( = ?auto_583496 ?auto_583505 ) ) ( not ( = ?auto_583496 ?auto_583506 ) ) ( not ( = ?auto_583496 ?auto_583507 ) ) ( not ( = ?auto_583496 ?auto_583508 ) ) ( not ( = ?auto_583497 ?auto_583498 ) ) ( not ( = ?auto_583497 ?auto_583499 ) ) ( not ( = ?auto_583497 ?auto_583500 ) ) ( not ( = ?auto_583497 ?auto_583501 ) ) ( not ( = ?auto_583497 ?auto_583502 ) ) ( not ( = ?auto_583497 ?auto_583503 ) ) ( not ( = ?auto_583497 ?auto_583504 ) ) ( not ( = ?auto_583497 ?auto_583505 ) ) ( not ( = ?auto_583497 ?auto_583506 ) ) ( not ( = ?auto_583497 ?auto_583507 ) ) ( not ( = ?auto_583497 ?auto_583508 ) ) ( not ( = ?auto_583498 ?auto_583499 ) ) ( not ( = ?auto_583498 ?auto_583500 ) ) ( not ( = ?auto_583498 ?auto_583501 ) ) ( not ( = ?auto_583498 ?auto_583502 ) ) ( not ( = ?auto_583498 ?auto_583503 ) ) ( not ( = ?auto_583498 ?auto_583504 ) ) ( not ( = ?auto_583498 ?auto_583505 ) ) ( not ( = ?auto_583498 ?auto_583506 ) ) ( not ( = ?auto_583498 ?auto_583507 ) ) ( not ( = ?auto_583498 ?auto_583508 ) ) ( not ( = ?auto_583499 ?auto_583500 ) ) ( not ( = ?auto_583499 ?auto_583501 ) ) ( not ( = ?auto_583499 ?auto_583502 ) ) ( not ( = ?auto_583499 ?auto_583503 ) ) ( not ( = ?auto_583499 ?auto_583504 ) ) ( not ( = ?auto_583499 ?auto_583505 ) ) ( not ( = ?auto_583499 ?auto_583506 ) ) ( not ( = ?auto_583499 ?auto_583507 ) ) ( not ( = ?auto_583499 ?auto_583508 ) ) ( not ( = ?auto_583500 ?auto_583501 ) ) ( not ( = ?auto_583500 ?auto_583502 ) ) ( not ( = ?auto_583500 ?auto_583503 ) ) ( not ( = ?auto_583500 ?auto_583504 ) ) ( not ( = ?auto_583500 ?auto_583505 ) ) ( not ( = ?auto_583500 ?auto_583506 ) ) ( not ( = ?auto_583500 ?auto_583507 ) ) ( not ( = ?auto_583500 ?auto_583508 ) ) ( not ( = ?auto_583501 ?auto_583502 ) ) ( not ( = ?auto_583501 ?auto_583503 ) ) ( not ( = ?auto_583501 ?auto_583504 ) ) ( not ( = ?auto_583501 ?auto_583505 ) ) ( not ( = ?auto_583501 ?auto_583506 ) ) ( not ( = ?auto_583501 ?auto_583507 ) ) ( not ( = ?auto_583501 ?auto_583508 ) ) ( not ( = ?auto_583502 ?auto_583503 ) ) ( not ( = ?auto_583502 ?auto_583504 ) ) ( not ( = ?auto_583502 ?auto_583505 ) ) ( not ( = ?auto_583502 ?auto_583506 ) ) ( not ( = ?auto_583502 ?auto_583507 ) ) ( not ( = ?auto_583502 ?auto_583508 ) ) ( not ( = ?auto_583503 ?auto_583504 ) ) ( not ( = ?auto_583503 ?auto_583505 ) ) ( not ( = ?auto_583503 ?auto_583506 ) ) ( not ( = ?auto_583503 ?auto_583507 ) ) ( not ( = ?auto_583503 ?auto_583508 ) ) ( not ( = ?auto_583504 ?auto_583505 ) ) ( not ( = ?auto_583504 ?auto_583506 ) ) ( not ( = ?auto_583504 ?auto_583507 ) ) ( not ( = ?auto_583504 ?auto_583508 ) ) ( not ( = ?auto_583505 ?auto_583506 ) ) ( not ( = ?auto_583505 ?auto_583507 ) ) ( not ( = ?auto_583505 ?auto_583508 ) ) ( not ( = ?auto_583506 ?auto_583507 ) ) ( not ( = ?auto_583506 ?auto_583508 ) ) ( not ( = ?auto_583507 ?auto_583508 ) ) ( ON ?auto_583507 ?auto_583508 ) ( ON ?auto_583506 ?auto_583507 ) ( ON ?auto_583505 ?auto_583506 ) ( ON ?auto_583504 ?auto_583505 ) ( ON ?auto_583503 ?auto_583504 ) ( CLEAR ?auto_583501 ) ( ON ?auto_583502 ?auto_583503 ) ( CLEAR ?auto_583502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_583493 ?auto_583494 ?auto_583495 ?auto_583496 ?auto_583497 ?auto_583498 ?auto_583499 ?auto_583500 ?auto_583501 ?auto_583502 )
      ( MAKE-16PILE ?auto_583493 ?auto_583494 ?auto_583495 ?auto_583496 ?auto_583497 ?auto_583498 ?auto_583499 ?auto_583500 ?auto_583501 ?auto_583502 ?auto_583503 ?auto_583504 ?auto_583505 ?auto_583506 ?auto_583507 ?auto_583508 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583525 - BLOCK
      ?auto_583526 - BLOCK
      ?auto_583527 - BLOCK
      ?auto_583528 - BLOCK
      ?auto_583529 - BLOCK
      ?auto_583530 - BLOCK
      ?auto_583531 - BLOCK
      ?auto_583532 - BLOCK
      ?auto_583533 - BLOCK
      ?auto_583534 - BLOCK
      ?auto_583535 - BLOCK
      ?auto_583536 - BLOCK
      ?auto_583537 - BLOCK
      ?auto_583538 - BLOCK
      ?auto_583539 - BLOCK
      ?auto_583540 - BLOCK
    )
    :vars
    (
      ?auto_583541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583540 ?auto_583541 ) ( ON-TABLE ?auto_583525 ) ( ON ?auto_583526 ?auto_583525 ) ( ON ?auto_583527 ?auto_583526 ) ( ON ?auto_583528 ?auto_583527 ) ( ON ?auto_583529 ?auto_583528 ) ( ON ?auto_583530 ?auto_583529 ) ( ON ?auto_583531 ?auto_583530 ) ( ON ?auto_583532 ?auto_583531 ) ( not ( = ?auto_583525 ?auto_583526 ) ) ( not ( = ?auto_583525 ?auto_583527 ) ) ( not ( = ?auto_583525 ?auto_583528 ) ) ( not ( = ?auto_583525 ?auto_583529 ) ) ( not ( = ?auto_583525 ?auto_583530 ) ) ( not ( = ?auto_583525 ?auto_583531 ) ) ( not ( = ?auto_583525 ?auto_583532 ) ) ( not ( = ?auto_583525 ?auto_583533 ) ) ( not ( = ?auto_583525 ?auto_583534 ) ) ( not ( = ?auto_583525 ?auto_583535 ) ) ( not ( = ?auto_583525 ?auto_583536 ) ) ( not ( = ?auto_583525 ?auto_583537 ) ) ( not ( = ?auto_583525 ?auto_583538 ) ) ( not ( = ?auto_583525 ?auto_583539 ) ) ( not ( = ?auto_583525 ?auto_583540 ) ) ( not ( = ?auto_583525 ?auto_583541 ) ) ( not ( = ?auto_583526 ?auto_583527 ) ) ( not ( = ?auto_583526 ?auto_583528 ) ) ( not ( = ?auto_583526 ?auto_583529 ) ) ( not ( = ?auto_583526 ?auto_583530 ) ) ( not ( = ?auto_583526 ?auto_583531 ) ) ( not ( = ?auto_583526 ?auto_583532 ) ) ( not ( = ?auto_583526 ?auto_583533 ) ) ( not ( = ?auto_583526 ?auto_583534 ) ) ( not ( = ?auto_583526 ?auto_583535 ) ) ( not ( = ?auto_583526 ?auto_583536 ) ) ( not ( = ?auto_583526 ?auto_583537 ) ) ( not ( = ?auto_583526 ?auto_583538 ) ) ( not ( = ?auto_583526 ?auto_583539 ) ) ( not ( = ?auto_583526 ?auto_583540 ) ) ( not ( = ?auto_583526 ?auto_583541 ) ) ( not ( = ?auto_583527 ?auto_583528 ) ) ( not ( = ?auto_583527 ?auto_583529 ) ) ( not ( = ?auto_583527 ?auto_583530 ) ) ( not ( = ?auto_583527 ?auto_583531 ) ) ( not ( = ?auto_583527 ?auto_583532 ) ) ( not ( = ?auto_583527 ?auto_583533 ) ) ( not ( = ?auto_583527 ?auto_583534 ) ) ( not ( = ?auto_583527 ?auto_583535 ) ) ( not ( = ?auto_583527 ?auto_583536 ) ) ( not ( = ?auto_583527 ?auto_583537 ) ) ( not ( = ?auto_583527 ?auto_583538 ) ) ( not ( = ?auto_583527 ?auto_583539 ) ) ( not ( = ?auto_583527 ?auto_583540 ) ) ( not ( = ?auto_583527 ?auto_583541 ) ) ( not ( = ?auto_583528 ?auto_583529 ) ) ( not ( = ?auto_583528 ?auto_583530 ) ) ( not ( = ?auto_583528 ?auto_583531 ) ) ( not ( = ?auto_583528 ?auto_583532 ) ) ( not ( = ?auto_583528 ?auto_583533 ) ) ( not ( = ?auto_583528 ?auto_583534 ) ) ( not ( = ?auto_583528 ?auto_583535 ) ) ( not ( = ?auto_583528 ?auto_583536 ) ) ( not ( = ?auto_583528 ?auto_583537 ) ) ( not ( = ?auto_583528 ?auto_583538 ) ) ( not ( = ?auto_583528 ?auto_583539 ) ) ( not ( = ?auto_583528 ?auto_583540 ) ) ( not ( = ?auto_583528 ?auto_583541 ) ) ( not ( = ?auto_583529 ?auto_583530 ) ) ( not ( = ?auto_583529 ?auto_583531 ) ) ( not ( = ?auto_583529 ?auto_583532 ) ) ( not ( = ?auto_583529 ?auto_583533 ) ) ( not ( = ?auto_583529 ?auto_583534 ) ) ( not ( = ?auto_583529 ?auto_583535 ) ) ( not ( = ?auto_583529 ?auto_583536 ) ) ( not ( = ?auto_583529 ?auto_583537 ) ) ( not ( = ?auto_583529 ?auto_583538 ) ) ( not ( = ?auto_583529 ?auto_583539 ) ) ( not ( = ?auto_583529 ?auto_583540 ) ) ( not ( = ?auto_583529 ?auto_583541 ) ) ( not ( = ?auto_583530 ?auto_583531 ) ) ( not ( = ?auto_583530 ?auto_583532 ) ) ( not ( = ?auto_583530 ?auto_583533 ) ) ( not ( = ?auto_583530 ?auto_583534 ) ) ( not ( = ?auto_583530 ?auto_583535 ) ) ( not ( = ?auto_583530 ?auto_583536 ) ) ( not ( = ?auto_583530 ?auto_583537 ) ) ( not ( = ?auto_583530 ?auto_583538 ) ) ( not ( = ?auto_583530 ?auto_583539 ) ) ( not ( = ?auto_583530 ?auto_583540 ) ) ( not ( = ?auto_583530 ?auto_583541 ) ) ( not ( = ?auto_583531 ?auto_583532 ) ) ( not ( = ?auto_583531 ?auto_583533 ) ) ( not ( = ?auto_583531 ?auto_583534 ) ) ( not ( = ?auto_583531 ?auto_583535 ) ) ( not ( = ?auto_583531 ?auto_583536 ) ) ( not ( = ?auto_583531 ?auto_583537 ) ) ( not ( = ?auto_583531 ?auto_583538 ) ) ( not ( = ?auto_583531 ?auto_583539 ) ) ( not ( = ?auto_583531 ?auto_583540 ) ) ( not ( = ?auto_583531 ?auto_583541 ) ) ( not ( = ?auto_583532 ?auto_583533 ) ) ( not ( = ?auto_583532 ?auto_583534 ) ) ( not ( = ?auto_583532 ?auto_583535 ) ) ( not ( = ?auto_583532 ?auto_583536 ) ) ( not ( = ?auto_583532 ?auto_583537 ) ) ( not ( = ?auto_583532 ?auto_583538 ) ) ( not ( = ?auto_583532 ?auto_583539 ) ) ( not ( = ?auto_583532 ?auto_583540 ) ) ( not ( = ?auto_583532 ?auto_583541 ) ) ( not ( = ?auto_583533 ?auto_583534 ) ) ( not ( = ?auto_583533 ?auto_583535 ) ) ( not ( = ?auto_583533 ?auto_583536 ) ) ( not ( = ?auto_583533 ?auto_583537 ) ) ( not ( = ?auto_583533 ?auto_583538 ) ) ( not ( = ?auto_583533 ?auto_583539 ) ) ( not ( = ?auto_583533 ?auto_583540 ) ) ( not ( = ?auto_583533 ?auto_583541 ) ) ( not ( = ?auto_583534 ?auto_583535 ) ) ( not ( = ?auto_583534 ?auto_583536 ) ) ( not ( = ?auto_583534 ?auto_583537 ) ) ( not ( = ?auto_583534 ?auto_583538 ) ) ( not ( = ?auto_583534 ?auto_583539 ) ) ( not ( = ?auto_583534 ?auto_583540 ) ) ( not ( = ?auto_583534 ?auto_583541 ) ) ( not ( = ?auto_583535 ?auto_583536 ) ) ( not ( = ?auto_583535 ?auto_583537 ) ) ( not ( = ?auto_583535 ?auto_583538 ) ) ( not ( = ?auto_583535 ?auto_583539 ) ) ( not ( = ?auto_583535 ?auto_583540 ) ) ( not ( = ?auto_583535 ?auto_583541 ) ) ( not ( = ?auto_583536 ?auto_583537 ) ) ( not ( = ?auto_583536 ?auto_583538 ) ) ( not ( = ?auto_583536 ?auto_583539 ) ) ( not ( = ?auto_583536 ?auto_583540 ) ) ( not ( = ?auto_583536 ?auto_583541 ) ) ( not ( = ?auto_583537 ?auto_583538 ) ) ( not ( = ?auto_583537 ?auto_583539 ) ) ( not ( = ?auto_583537 ?auto_583540 ) ) ( not ( = ?auto_583537 ?auto_583541 ) ) ( not ( = ?auto_583538 ?auto_583539 ) ) ( not ( = ?auto_583538 ?auto_583540 ) ) ( not ( = ?auto_583538 ?auto_583541 ) ) ( not ( = ?auto_583539 ?auto_583540 ) ) ( not ( = ?auto_583539 ?auto_583541 ) ) ( not ( = ?auto_583540 ?auto_583541 ) ) ( ON ?auto_583539 ?auto_583540 ) ( ON ?auto_583538 ?auto_583539 ) ( ON ?auto_583537 ?auto_583538 ) ( ON ?auto_583536 ?auto_583537 ) ( ON ?auto_583535 ?auto_583536 ) ( ON ?auto_583534 ?auto_583535 ) ( CLEAR ?auto_583532 ) ( ON ?auto_583533 ?auto_583534 ) ( CLEAR ?auto_583533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_583525 ?auto_583526 ?auto_583527 ?auto_583528 ?auto_583529 ?auto_583530 ?auto_583531 ?auto_583532 ?auto_583533 )
      ( MAKE-16PILE ?auto_583525 ?auto_583526 ?auto_583527 ?auto_583528 ?auto_583529 ?auto_583530 ?auto_583531 ?auto_583532 ?auto_583533 ?auto_583534 ?auto_583535 ?auto_583536 ?auto_583537 ?auto_583538 ?auto_583539 ?auto_583540 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583558 - BLOCK
      ?auto_583559 - BLOCK
      ?auto_583560 - BLOCK
      ?auto_583561 - BLOCK
      ?auto_583562 - BLOCK
      ?auto_583563 - BLOCK
      ?auto_583564 - BLOCK
      ?auto_583565 - BLOCK
      ?auto_583566 - BLOCK
      ?auto_583567 - BLOCK
      ?auto_583568 - BLOCK
      ?auto_583569 - BLOCK
      ?auto_583570 - BLOCK
      ?auto_583571 - BLOCK
      ?auto_583572 - BLOCK
      ?auto_583573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_583573 ) ( ON-TABLE ?auto_583558 ) ( ON ?auto_583559 ?auto_583558 ) ( ON ?auto_583560 ?auto_583559 ) ( ON ?auto_583561 ?auto_583560 ) ( ON ?auto_583562 ?auto_583561 ) ( ON ?auto_583563 ?auto_583562 ) ( ON ?auto_583564 ?auto_583563 ) ( ON ?auto_583565 ?auto_583564 ) ( not ( = ?auto_583558 ?auto_583559 ) ) ( not ( = ?auto_583558 ?auto_583560 ) ) ( not ( = ?auto_583558 ?auto_583561 ) ) ( not ( = ?auto_583558 ?auto_583562 ) ) ( not ( = ?auto_583558 ?auto_583563 ) ) ( not ( = ?auto_583558 ?auto_583564 ) ) ( not ( = ?auto_583558 ?auto_583565 ) ) ( not ( = ?auto_583558 ?auto_583566 ) ) ( not ( = ?auto_583558 ?auto_583567 ) ) ( not ( = ?auto_583558 ?auto_583568 ) ) ( not ( = ?auto_583558 ?auto_583569 ) ) ( not ( = ?auto_583558 ?auto_583570 ) ) ( not ( = ?auto_583558 ?auto_583571 ) ) ( not ( = ?auto_583558 ?auto_583572 ) ) ( not ( = ?auto_583558 ?auto_583573 ) ) ( not ( = ?auto_583559 ?auto_583560 ) ) ( not ( = ?auto_583559 ?auto_583561 ) ) ( not ( = ?auto_583559 ?auto_583562 ) ) ( not ( = ?auto_583559 ?auto_583563 ) ) ( not ( = ?auto_583559 ?auto_583564 ) ) ( not ( = ?auto_583559 ?auto_583565 ) ) ( not ( = ?auto_583559 ?auto_583566 ) ) ( not ( = ?auto_583559 ?auto_583567 ) ) ( not ( = ?auto_583559 ?auto_583568 ) ) ( not ( = ?auto_583559 ?auto_583569 ) ) ( not ( = ?auto_583559 ?auto_583570 ) ) ( not ( = ?auto_583559 ?auto_583571 ) ) ( not ( = ?auto_583559 ?auto_583572 ) ) ( not ( = ?auto_583559 ?auto_583573 ) ) ( not ( = ?auto_583560 ?auto_583561 ) ) ( not ( = ?auto_583560 ?auto_583562 ) ) ( not ( = ?auto_583560 ?auto_583563 ) ) ( not ( = ?auto_583560 ?auto_583564 ) ) ( not ( = ?auto_583560 ?auto_583565 ) ) ( not ( = ?auto_583560 ?auto_583566 ) ) ( not ( = ?auto_583560 ?auto_583567 ) ) ( not ( = ?auto_583560 ?auto_583568 ) ) ( not ( = ?auto_583560 ?auto_583569 ) ) ( not ( = ?auto_583560 ?auto_583570 ) ) ( not ( = ?auto_583560 ?auto_583571 ) ) ( not ( = ?auto_583560 ?auto_583572 ) ) ( not ( = ?auto_583560 ?auto_583573 ) ) ( not ( = ?auto_583561 ?auto_583562 ) ) ( not ( = ?auto_583561 ?auto_583563 ) ) ( not ( = ?auto_583561 ?auto_583564 ) ) ( not ( = ?auto_583561 ?auto_583565 ) ) ( not ( = ?auto_583561 ?auto_583566 ) ) ( not ( = ?auto_583561 ?auto_583567 ) ) ( not ( = ?auto_583561 ?auto_583568 ) ) ( not ( = ?auto_583561 ?auto_583569 ) ) ( not ( = ?auto_583561 ?auto_583570 ) ) ( not ( = ?auto_583561 ?auto_583571 ) ) ( not ( = ?auto_583561 ?auto_583572 ) ) ( not ( = ?auto_583561 ?auto_583573 ) ) ( not ( = ?auto_583562 ?auto_583563 ) ) ( not ( = ?auto_583562 ?auto_583564 ) ) ( not ( = ?auto_583562 ?auto_583565 ) ) ( not ( = ?auto_583562 ?auto_583566 ) ) ( not ( = ?auto_583562 ?auto_583567 ) ) ( not ( = ?auto_583562 ?auto_583568 ) ) ( not ( = ?auto_583562 ?auto_583569 ) ) ( not ( = ?auto_583562 ?auto_583570 ) ) ( not ( = ?auto_583562 ?auto_583571 ) ) ( not ( = ?auto_583562 ?auto_583572 ) ) ( not ( = ?auto_583562 ?auto_583573 ) ) ( not ( = ?auto_583563 ?auto_583564 ) ) ( not ( = ?auto_583563 ?auto_583565 ) ) ( not ( = ?auto_583563 ?auto_583566 ) ) ( not ( = ?auto_583563 ?auto_583567 ) ) ( not ( = ?auto_583563 ?auto_583568 ) ) ( not ( = ?auto_583563 ?auto_583569 ) ) ( not ( = ?auto_583563 ?auto_583570 ) ) ( not ( = ?auto_583563 ?auto_583571 ) ) ( not ( = ?auto_583563 ?auto_583572 ) ) ( not ( = ?auto_583563 ?auto_583573 ) ) ( not ( = ?auto_583564 ?auto_583565 ) ) ( not ( = ?auto_583564 ?auto_583566 ) ) ( not ( = ?auto_583564 ?auto_583567 ) ) ( not ( = ?auto_583564 ?auto_583568 ) ) ( not ( = ?auto_583564 ?auto_583569 ) ) ( not ( = ?auto_583564 ?auto_583570 ) ) ( not ( = ?auto_583564 ?auto_583571 ) ) ( not ( = ?auto_583564 ?auto_583572 ) ) ( not ( = ?auto_583564 ?auto_583573 ) ) ( not ( = ?auto_583565 ?auto_583566 ) ) ( not ( = ?auto_583565 ?auto_583567 ) ) ( not ( = ?auto_583565 ?auto_583568 ) ) ( not ( = ?auto_583565 ?auto_583569 ) ) ( not ( = ?auto_583565 ?auto_583570 ) ) ( not ( = ?auto_583565 ?auto_583571 ) ) ( not ( = ?auto_583565 ?auto_583572 ) ) ( not ( = ?auto_583565 ?auto_583573 ) ) ( not ( = ?auto_583566 ?auto_583567 ) ) ( not ( = ?auto_583566 ?auto_583568 ) ) ( not ( = ?auto_583566 ?auto_583569 ) ) ( not ( = ?auto_583566 ?auto_583570 ) ) ( not ( = ?auto_583566 ?auto_583571 ) ) ( not ( = ?auto_583566 ?auto_583572 ) ) ( not ( = ?auto_583566 ?auto_583573 ) ) ( not ( = ?auto_583567 ?auto_583568 ) ) ( not ( = ?auto_583567 ?auto_583569 ) ) ( not ( = ?auto_583567 ?auto_583570 ) ) ( not ( = ?auto_583567 ?auto_583571 ) ) ( not ( = ?auto_583567 ?auto_583572 ) ) ( not ( = ?auto_583567 ?auto_583573 ) ) ( not ( = ?auto_583568 ?auto_583569 ) ) ( not ( = ?auto_583568 ?auto_583570 ) ) ( not ( = ?auto_583568 ?auto_583571 ) ) ( not ( = ?auto_583568 ?auto_583572 ) ) ( not ( = ?auto_583568 ?auto_583573 ) ) ( not ( = ?auto_583569 ?auto_583570 ) ) ( not ( = ?auto_583569 ?auto_583571 ) ) ( not ( = ?auto_583569 ?auto_583572 ) ) ( not ( = ?auto_583569 ?auto_583573 ) ) ( not ( = ?auto_583570 ?auto_583571 ) ) ( not ( = ?auto_583570 ?auto_583572 ) ) ( not ( = ?auto_583570 ?auto_583573 ) ) ( not ( = ?auto_583571 ?auto_583572 ) ) ( not ( = ?auto_583571 ?auto_583573 ) ) ( not ( = ?auto_583572 ?auto_583573 ) ) ( ON ?auto_583572 ?auto_583573 ) ( ON ?auto_583571 ?auto_583572 ) ( ON ?auto_583570 ?auto_583571 ) ( ON ?auto_583569 ?auto_583570 ) ( ON ?auto_583568 ?auto_583569 ) ( ON ?auto_583567 ?auto_583568 ) ( CLEAR ?auto_583565 ) ( ON ?auto_583566 ?auto_583567 ) ( CLEAR ?auto_583566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_583558 ?auto_583559 ?auto_583560 ?auto_583561 ?auto_583562 ?auto_583563 ?auto_583564 ?auto_583565 ?auto_583566 )
      ( MAKE-16PILE ?auto_583558 ?auto_583559 ?auto_583560 ?auto_583561 ?auto_583562 ?auto_583563 ?auto_583564 ?auto_583565 ?auto_583566 ?auto_583567 ?auto_583568 ?auto_583569 ?auto_583570 ?auto_583571 ?auto_583572 ?auto_583573 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583590 - BLOCK
      ?auto_583591 - BLOCK
      ?auto_583592 - BLOCK
      ?auto_583593 - BLOCK
      ?auto_583594 - BLOCK
      ?auto_583595 - BLOCK
      ?auto_583596 - BLOCK
      ?auto_583597 - BLOCK
      ?auto_583598 - BLOCK
      ?auto_583599 - BLOCK
      ?auto_583600 - BLOCK
      ?auto_583601 - BLOCK
      ?auto_583602 - BLOCK
      ?auto_583603 - BLOCK
      ?auto_583604 - BLOCK
      ?auto_583605 - BLOCK
    )
    :vars
    (
      ?auto_583606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583605 ?auto_583606 ) ( ON-TABLE ?auto_583590 ) ( ON ?auto_583591 ?auto_583590 ) ( ON ?auto_583592 ?auto_583591 ) ( ON ?auto_583593 ?auto_583592 ) ( ON ?auto_583594 ?auto_583593 ) ( ON ?auto_583595 ?auto_583594 ) ( ON ?auto_583596 ?auto_583595 ) ( not ( = ?auto_583590 ?auto_583591 ) ) ( not ( = ?auto_583590 ?auto_583592 ) ) ( not ( = ?auto_583590 ?auto_583593 ) ) ( not ( = ?auto_583590 ?auto_583594 ) ) ( not ( = ?auto_583590 ?auto_583595 ) ) ( not ( = ?auto_583590 ?auto_583596 ) ) ( not ( = ?auto_583590 ?auto_583597 ) ) ( not ( = ?auto_583590 ?auto_583598 ) ) ( not ( = ?auto_583590 ?auto_583599 ) ) ( not ( = ?auto_583590 ?auto_583600 ) ) ( not ( = ?auto_583590 ?auto_583601 ) ) ( not ( = ?auto_583590 ?auto_583602 ) ) ( not ( = ?auto_583590 ?auto_583603 ) ) ( not ( = ?auto_583590 ?auto_583604 ) ) ( not ( = ?auto_583590 ?auto_583605 ) ) ( not ( = ?auto_583590 ?auto_583606 ) ) ( not ( = ?auto_583591 ?auto_583592 ) ) ( not ( = ?auto_583591 ?auto_583593 ) ) ( not ( = ?auto_583591 ?auto_583594 ) ) ( not ( = ?auto_583591 ?auto_583595 ) ) ( not ( = ?auto_583591 ?auto_583596 ) ) ( not ( = ?auto_583591 ?auto_583597 ) ) ( not ( = ?auto_583591 ?auto_583598 ) ) ( not ( = ?auto_583591 ?auto_583599 ) ) ( not ( = ?auto_583591 ?auto_583600 ) ) ( not ( = ?auto_583591 ?auto_583601 ) ) ( not ( = ?auto_583591 ?auto_583602 ) ) ( not ( = ?auto_583591 ?auto_583603 ) ) ( not ( = ?auto_583591 ?auto_583604 ) ) ( not ( = ?auto_583591 ?auto_583605 ) ) ( not ( = ?auto_583591 ?auto_583606 ) ) ( not ( = ?auto_583592 ?auto_583593 ) ) ( not ( = ?auto_583592 ?auto_583594 ) ) ( not ( = ?auto_583592 ?auto_583595 ) ) ( not ( = ?auto_583592 ?auto_583596 ) ) ( not ( = ?auto_583592 ?auto_583597 ) ) ( not ( = ?auto_583592 ?auto_583598 ) ) ( not ( = ?auto_583592 ?auto_583599 ) ) ( not ( = ?auto_583592 ?auto_583600 ) ) ( not ( = ?auto_583592 ?auto_583601 ) ) ( not ( = ?auto_583592 ?auto_583602 ) ) ( not ( = ?auto_583592 ?auto_583603 ) ) ( not ( = ?auto_583592 ?auto_583604 ) ) ( not ( = ?auto_583592 ?auto_583605 ) ) ( not ( = ?auto_583592 ?auto_583606 ) ) ( not ( = ?auto_583593 ?auto_583594 ) ) ( not ( = ?auto_583593 ?auto_583595 ) ) ( not ( = ?auto_583593 ?auto_583596 ) ) ( not ( = ?auto_583593 ?auto_583597 ) ) ( not ( = ?auto_583593 ?auto_583598 ) ) ( not ( = ?auto_583593 ?auto_583599 ) ) ( not ( = ?auto_583593 ?auto_583600 ) ) ( not ( = ?auto_583593 ?auto_583601 ) ) ( not ( = ?auto_583593 ?auto_583602 ) ) ( not ( = ?auto_583593 ?auto_583603 ) ) ( not ( = ?auto_583593 ?auto_583604 ) ) ( not ( = ?auto_583593 ?auto_583605 ) ) ( not ( = ?auto_583593 ?auto_583606 ) ) ( not ( = ?auto_583594 ?auto_583595 ) ) ( not ( = ?auto_583594 ?auto_583596 ) ) ( not ( = ?auto_583594 ?auto_583597 ) ) ( not ( = ?auto_583594 ?auto_583598 ) ) ( not ( = ?auto_583594 ?auto_583599 ) ) ( not ( = ?auto_583594 ?auto_583600 ) ) ( not ( = ?auto_583594 ?auto_583601 ) ) ( not ( = ?auto_583594 ?auto_583602 ) ) ( not ( = ?auto_583594 ?auto_583603 ) ) ( not ( = ?auto_583594 ?auto_583604 ) ) ( not ( = ?auto_583594 ?auto_583605 ) ) ( not ( = ?auto_583594 ?auto_583606 ) ) ( not ( = ?auto_583595 ?auto_583596 ) ) ( not ( = ?auto_583595 ?auto_583597 ) ) ( not ( = ?auto_583595 ?auto_583598 ) ) ( not ( = ?auto_583595 ?auto_583599 ) ) ( not ( = ?auto_583595 ?auto_583600 ) ) ( not ( = ?auto_583595 ?auto_583601 ) ) ( not ( = ?auto_583595 ?auto_583602 ) ) ( not ( = ?auto_583595 ?auto_583603 ) ) ( not ( = ?auto_583595 ?auto_583604 ) ) ( not ( = ?auto_583595 ?auto_583605 ) ) ( not ( = ?auto_583595 ?auto_583606 ) ) ( not ( = ?auto_583596 ?auto_583597 ) ) ( not ( = ?auto_583596 ?auto_583598 ) ) ( not ( = ?auto_583596 ?auto_583599 ) ) ( not ( = ?auto_583596 ?auto_583600 ) ) ( not ( = ?auto_583596 ?auto_583601 ) ) ( not ( = ?auto_583596 ?auto_583602 ) ) ( not ( = ?auto_583596 ?auto_583603 ) ) ( not ( = ?auto_583596 ?auto_583604 ) ) ( not ( = ?auto_583596 ?auto_583605 ) ) ( not ( = ?auto_583596 ?auto_583606 ) ) ( not ( = ?auto_583597 ?auto_583598 ) ) ( not ( = ?auto_583597 ?auto_583599 ) ) ( not ( = ?auto_583597 ?auto_583600 ) ) ( not ( = ?auto_583597 ?auto_583601 ) ) ( not ( = ?auto_583597 ?auto_583602 ) ) ( not ( = ?auto_583597 ?auto_583603 ) ) ( not ( = ?auto_583597 ?auto_583604 ) ) ( not ( = ?auto_583597 ?auto_583605 ) ) ( not ( = ?auto_583597 ?auto_583606 ) ) ( not ( = ?auto_583598 ?auto_583599 ) ) ( not ( = ?auto_583598 ?auto_583600 ) ) ( not ( = ?auto_583598 ?auto_583601 ) ) ( not ( = ?auto_583598 ?auto_583602 ) ) ( not ( = ?auto_583598 ?auto_583603 ) ) ( not ( = ?auto_583598 ?auto_583604 ) ) ( not ( = ?auto_583598 ?auto_583605 ) ) ( not ( = ?auto_583598 ?auto_583606 ) ) ( not ( = ?auto_583599 ?auto_583600 ) ) ( not ( = ?auto_583599 ?auto_583601 ) ) ( not ( = ?auto_583599 ?auto_583602 ) ) ( not ( = ?auto_583599 ?auto_583603 ) ) ( not ( = ?auto_583599 ?auto_583604 ) ) ( not ( = ?auto_583599 ?auto_583605 ) ) ( not ( = ?auto_583599 ?auto_583606 ) ) ( not ( = ?auto_583600 ?auto_583601 ) ) ( not ( = ?auto_583600 ?auto_583602 ) ) ( not ( = ?auto_583600 ?auto_583603 ) ) ( not ( = ?auto_583600 ?auto_583604 ) ) ( not ( = ?auto_583600 ?auto_583605 ) ) ( not ( = ?auto_583600 ?auto_583606 ) ) ( not ( = ?auto_583601 ?auto_583602 ) ) ( not ( = ?auto_583601 ?auto_583603 ) ) ( not ( = ?auto_583601 ?auto_583604 ) ) ( not ( = ?auto_583601 ?auto_583605 ) ) ( not ( = ?auto_583601 ?auto_583606 ) ) ( not ( = ?auto_583602 ?auto_583603 ) ) ( not ( = ?auto_583602 ?auto_583604 ) ) ( not ( = ?auto_583602 ?auto_583605 ) ) ( not ( = ?auto_583602 ?auto_583606 ) ) ( not ( = ?auto_583603 ?auto_583604 ) ) ( not ( = ?auto_583603 ?auto_583605 ) ) ( not ( = ?auto_583603 ?auto_583606 ) ) ( not ( = ?auto_583604 ?auto_583605 ) ) ( not ( = ?auto_583604 ?auto_583606 ) ) ( not ( = ?auto_583605 ?auto_583606 ) ) ( ON ?auto_583604 ?auto_583605 ) ( ON ?auto_583603 ?auto_583604 ) ( ON ?auto_583602 ?auto_583603 ) ( ON ?auto_583601 ?auto_583602 ) ( ON ?auto_583600 ?auto_583601 ) ( ON ?auto_583599 ?auto_583600 ) ( ON ?auto_583598 ?auto_583599 ) ( CLEAR ?auto_583596 ) ( ON ?auto_583597 ?auto_583598 ) ( CLEAR ?auto_583597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_583590 ?auto_583591 ?auto_583592 ?auto_583593 ?auto_583594 ?auto_583595 ?auto_583596 ?auto_583597 )
      ( MAKE-16PILE ?auto_583590 ?auto_583591 ?auto_583592 ?auto_583593 ?auto_583594 ?auto_583595 ?auto_583596 ?auto_583597 ?auto_583598 ?auto_583599 ?auto_583600 ?auto_583601 ?auto_583602 ?auto_583603 ?auto_583604 ?auto_583605 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583623 - BLOCK
      ?auto_583624 - BLOCK
      ?auto_583625 - BLOCK
      ?auto_583626 - BLOCK
      ?auto_583627 - BLOCK
      ?auto_583628 - BLOCK
      ?auto_583629 - BLOCK
      ?auto_583630 - BLOCK
      ?auto_583631 - BLOCK
      ?auto_583632 - BLOCK
      ?auto_583633 - BLOCK
      ?auto_583634 - BLOCK
      ?auto_583635 - BLOCK
      ?auto_583636 - BLOCK
      ?auto_583637 - BLOCK
      ?auto_583638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_583638 ) ( ON-TABLE ?auto_583623 ) ( ON ?auto_583624 ?auto_583623 ) ( ON ?auto_583625 ?auto_583624 ) ( ON ?auto_583626 ?auto_583625 ) ( ON ?auto_583627 ?auto_583626 ) ( ON ?auto_583628 ?auto_583627 ) ( ON ?auto_583629 ?auto_583628 ) ( not ( = ?auto_583623 ?auto_583624 ) ) ( not ( = ?auto_583623 ?auto_583625 ) ) ( not ( = ?auto_583623 ?auto_583626 ) ) ( not ( = ?auto_583623 ?auto_583627 ) ) ( not ( = ?auto_583623 ?auto_583628 ) ) ( not ( = ?auto_583623 ?auto_583629 ) ) ( not ( = ?auto_583623 ?auto_583630 ) ) ( not ( = ?auto_583623 ?auto_583631 ) ) ( not ( = ?auto_583623 ?auto_583632 ) ) ( not ( = ?auto_583623 ?auto_583633 ) ) ( not ( = ?auto_583623 ?auto_583634 ) ) ( not ( = ?auto_583623 ?auto_583635 ) ) ( not ( = ?auto_583623 ?auto_583636 ) ) ( not ( = ?auto_583623 ?auto_583637 ) ) ( not ( = ?auto_583623 ?auto_583638 ) ) ( not ( = ?auto_583624 ?auto_583625 ) ) ( not ( = ?auto_583624 ?auto_583626 ) ) ( not ( = ?auto_583624 ?auto_583627 ) ) ( not ( = ?auto_583624 ?auto_583628 ) ) ( not ( = ?auto_583624 ?auto_583629 ) ) ( not ( = ?auto_583624 ?auto_583630 ) ) ( not ( = ?auto_583624 ?auto_583631 ) ) ( not ( = ?auto_583624 ?auto_583632 ) ) ( not ( = ?auto_583624 ?auto_583633 ) ) ( not ( = ?auto_583624 ?auto_583634 ) ) ( not ( = ?auto_583624 ?auto_583635 ) ) ( not ( = ?auto_583624 ?auto_583636 ) ) ( not ( = ?auto_583624 ?auto_583637 ) ) ( not ( = ?auto_583624 ?auto_583638 ) ) ( not ( = ?auto_583625 ?auto_583626 ) ) ( not ( = ?auto_583625 ?auto_583627 ) ) ( not ( = ?auto_583625 ?auto_583628 ) ) ( not ( = ?auto_583625 ?auto_583629 ) ) ( not ( = ?auto_583625 ?auto_583630 ) ) ( not ( = ?auto_583625 ?auto_583631 ) ) ( not ( = ?auto_583625 ?auto_583632 ) ) ( not ( = ?auto_583625 ?auto_583633 ) ) ( not ( = ?auto_583625 ?auto_583634 ) ) ( not ( = ?auto_583625 ?auto_583635 ) ) ( not ( = ?auto_583625 ?auto_583636 ) ) ( not ( = ?auto_583625 ?auto_583637 ) ) ( not ( = ?auto_583625 ?auto_583638 ) ) ( not ( = ?auto_583626 ?auto_583627 ) ) ( not ( = ?auto_583626 ?auto_583628 ) ) ( not ( = ?auto_583626 ?auto_583629 ) ) ( not ( = ?auto_583626 ?auto_583630 ) ) ( not ( = ?auto_583626 ?auto_583631 ) ) ( not ( = ?auto_583626 ?auto_583632 ) ) ( not ( = ?auto_583626 ?auto_583633 ) ) ( not ( = ?auto_583626 ?auto_583634 ) ) ( not ( = ?auto_583626 ?auto_583635 ) ) ( not ( = ?auto_583626 ?auto_583636 ) ) ( not ( = ?auto_583626 ?auto_583637 ) ) ( not ( = ?auto_583626 ?auto_583638 ) ) ( not ( = ?auto_583627 ?auto_583628 ) ) ( not ( = ?auto_583627 ?auto_583629 ) ) ( not ( = ?auto_583627 ?auto_583630 ) ) ( not ( = ?auto_583627 ?auto_583631 ) ) ( not ( = ?auto_583627 ?auto_583632 ) ) ( not ( = ?auto_583627 ?auto_583633 ) ) ( not ( = ?auto_583627 ?auto_583634 ) ) ( not ( = ?auto_583627 ?auto_583635 ) ) ( not ( = ?auto_583627 ?auto_583636 ) ) ( not ( = ?auto_583627 ?auto_583637 ) ) ( not ( = ?auto_583627 ?auto_583638 ) ) ( not ( = ?auto_583628 ?auto_583629 ) ) ( not ( = ?auto_583628 ?auto_583630 ) ) ( not ( = ?auto_583628 ?auto_583631 ) ) ( not ( = ?auto_583628 ?auto_583632 ) ) ( not ( = ?auto_583628 ?auto_583633 ) ) ( not ( = ?auto_583628 ?auto_583634 ) ) ( not ( = ?auto_583628 ?auto_583635 ) ) ( not ( = ?auto_583628 ?auto_583636 ) ) ( not ( = ?auto_583628 ?auto_583637 ) ) ( not ( = ?auto_583628 ?auto_583638 ) ) ( not ( = ?auto_583629 ?auto_583630 ) ) ( not ( = ?auto_583629 ?auto_583631 ) ) ( not ( = ?auto_583629 ?auto_583632 ) ) ( not ( = ?auto_583629 ?auto_583633 ) ) ( not ( = ?auto_583629 ?auto_583634 ) ) ( not ( = ?auto_583629 ?auto_583635 ) ) ( not ( = ?auto_583629 ?auto_583636 ) ) ( not ( = ?auto_583629 ?auto_583637 ) ) ( not ( = ?auto_583629 ?auto_583638 ) ) ( not ( = ?auto_583630 ?auto_583631 ) ) ( not ( = ?auto_583630 ?auto_583632 ) ) ( not ( = ?auto_583630 ?auto_583633 ) ) ( not ( = ?auto_583630 ?auto_583634 ) ) ( not ( = ?auto_583630 ?auto_583635 ) ) ( not ( = ?auto_583630 ?auto_583636 ) ) ( not ( = ?auto_583630 ?auto_583637 ) ) ( not ( = ?auto_583630 ?auto_583638 ) ) ( not ( = ?auto_583631 ?auto_583632 ) ) ( not ( = ?auto_583631 ?auto_583633 ) ) ( not ( = ?auto_583631 ?auto_583634 ) ) ( not ( = ?auto_583631 ?auto_583635 ) ) ( not ( = ?auto_583631 ?auto_583636 ) ) ( not ( = ?auto_583631 ?auto_583637 ) ) ( not ( = ?auto_583631 ?auto_583638 ) ) ( not ( = ?auto_583632 ?auto_583633 ) ) ( not ( = ?auto_583632 ?auto_583634 ) ) ( not ( = ?auto_583632 ?auto_583635 ) ) ( not ( = ?auto_583632 ?auto_583636 ) ) ( not ( = ?auto_583632 ?auto_583637 ) ) ( not ( = ?auto_583632 ?auto_583638 ) ) ( not ( = ?auto_583633 ?auto_583634 ) ) ( not ( = ?auto_583633 ?auto_583635 ) ) ( not ( = ?auto_583633 ?auto_583636 ) ) ( not ( = ?auto_583633 ?auto_583637 ) ) ( not ( = ?auto_583633 ?auto_583638 ) ) ( not ( = ?auto_583634 ?auto_583635 ) ) ( not ( = ?auto_583634 ?auto_583636 ) ) ( not ( = ?auto_583634 ?auto_583637 ) ) ( not ( = ?auto_583634 ?auto_583638 ) ) ( not ( = ?auto_583635 ?auto_583636 ) ) ( not ( = ?auto_583635 ?auto_583637 ) ) ( not ( = ?auto_583635 ?auto_583638 ) ) ( not ( = ?auto_583636 ?auto_583637 ) ) ( not ( = ?auto_583636 ?auto_583638 ) ) ( not ( = ?auto_583637 ?auto_583638 ) ) ( ON ?auto_583637 ?auto_583638 ) ( ON ?auto_583636 ?auto_583637 ) ( ON ?auto_583635 ?auto_583636 ) ( ON ?auto_583634 ?auto_583635 ) ( ON ?auto_583633 ?auto_583634 ) ( ON ?auto_583632 ?auto_583633 ) ( ON ?auto_583631 ?auto_583632 ) ( CLEAR ?auto_583629 ) ( ON ?auto_583630 ?auto_583631 ) ( CLEAR ?auto_583630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_583623 ?auto_583624 ?auto_583625 ?auto_583626 ?auto_583627 ?auto_583628 ?auto_583629 ?auto_583630 )
      ( MAKE-16PILE ?auto_583623 ?auto_583624 ?auto_583625 ?auto_583626 ?auto_583627 ?auto_583628 ?auto_583629 ?auto_583630 ?auto_583631 ?auto_583632 ?auto_583633 ?auto_583634 ?auto_583635 ?auto_583636 ?auto_583637 ?auto_583638 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583655 - BLOCK
      ?auto_583656 - BLOCK
      ?auto_583657 - BLOCK
      ?auto_583658 - BLOCK
      ?auto_583659 - BLOCK
      ?auto_583660 - BLOCK
      ?auto_583661 - BLOCK
      ?auto_583662 - BLOCK
      ?auto_583663 - BLOCK
      ?auto_583664 - BLOCK
      ?auto_583665 - BLOCK
      ?auto_583666 - BLOCK
      ?auto_583667 - BLOCK
      ?auto_583668 - BLOCK
      ?auto_583669 - BLOCK
      ?auto_583670 - BLOCK
    )
    :vars
    (
      ?auto_583671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583670 ?auto_583671 ) ( ON-TABLE ?auto_583655 ) ( ON ?auto_583656 ?auto_583655 ) ( ON ?auto_583657 ?auto_583656 ) ( ON ?auto_583658 ?auto_583657 ) ( ON ?auto_583659 ?auto_583658 ) ( ON ?auto_583660 ?auto_583659 ) ( not ( = ?auto_583655 ?auto_583656 ) ) ( not ( = ?auto_583655 ?auto_583657 ) ) ( not ( = ?auto_583655 ?auto_583658 ) ) ( not ( = ?auto_583655 ?auto_583659 ) ) ( not ( = ?auto_583655 ?auto_583660 ) ) ( not ( = ?auto_583655 ?auto_583661 ) ) ( not ( = ?auto_583655 ?auto_583662 ) ) ( not ( = ?auto_583655 ?auto_583663 ) ) ( not ( = ?auto_583655 ?auto_583664 ) ) ( not ( = ?auto_583655 ?auto_583665 ) ) ( not ( = ?auto_583655 ?auto_583666 ) ) ( not ( = ?auto_583655 ?auto_583667 ) ) ( not ( = ?auto_583655 ?auto_583668 ) ) ( not ( = ?auto_583655 ?auto_583669 ) ) ( not ( = ?auto_583655 ?auto_583670 ) ) ( not ( = ?auto_583655 ?auto_583671 ) ) ( not ( = ?auto_583656 ?auto_583657 ) ) ( not ( = ?auto_583656 ?auto_583658 ) ) ( not ( = ?auto_583656 ?auto_583659 ) ) ( not ( = ?auto_583656 ?auto_583660 ) ) ( not ( = ?auto_583656 ?auto_583661 ) ) ( not ( = ?auto_583656 ?auto_583662 ) ) ( not ( = ?auto_583656 ?auto_583663 ) ) ( not ( = ?auto_583656 ?auto_583664 ) ) ( not ( = ?auto_583656 ?auto_583665 ) ) ( not ( = ?auto_583656 ?auto_583666 ) ) ( not ( = ?auto_583656 ?auto_583667 ) ) ( not ( = ?auto_583656 ?auto_583668 ) ) ( not ( = ?auto_583656 ?auto_583669 ) ) ( not ( = ?auto_583656 ?auto_583670 ) ) ( not ( = ?auto_583656 ?auto_583671 ) ) ( not ( = ?auto_583657 ?auto_583658 ) ) ( not ( = ?auto_583657 ?auto_583659 ) ) ( not ( = ?auto_583657 ?auto_583660 ) ) ( not ( = ?auto_583657 ?auto_583661 ) ) ( not ( = ?auto_583657 ?auto_583662 ) ) ( not ( = ?auto_583657 ?auto_583663 ) ) ( not ( = ?auto_583657 ?auto_583664 ) ) ( not ( = ?auto_583657 ?auto_583665 ) ) ( not ( = ?auto_583657 ?auto_583666 ) ) ( not ( = ?auto_583657 ?auto_583667 ) ) ( not ( = ?auto_583657 ?auto_583668 ) ) ( not ( = ?auto_583657 ?auto_583669 ) ) ( not ( = ?auto_583657 ?auto_583670 ) ) ( not ( = ?auto_583657 ?auto_583671 ) ) ( not ( = ?auto_583658 ?auto_583659 ) ) ( not ( = ?auto_583658 ?auto_583660 ) ) ( not ( = ?auto_583658 ?auto_583661 ) ) ( not ( = ?auto_583658 ?auto_583662 ) ) ( not ( = ?auto_583658 ?auto_583663 ) ) ( not ( = ?auto_583658 ?auto_583664 ) ) ( not ( = ?auto_583658 ?auto_583665 ) ) ( not ( = ?auto_583658 ?auto_583666 ) ) ( not ( = ?auto_583658 ?auto_583667 ) ) ( not ( = ?auto_583658 ?auto_583668 ) ) ( not ( = ?auto_583658 ?auto_583669 ) ) ( not ( = ?auto_583658 ?auto_583670 ) ) ( not ( = ?auto_583658 ?auto_583671 ) ) ( not ( = ?auto_583659 ?auto_583660 ) ) ( not ( = ?auto_583659 ?auto_583661 ) ) ( not ( = ?auto_583659 ?auto_583662 ) ) ( not ( = ?auto_583659 ?auto_583663 ) ) ( not ( = ?auto_583659 ?auto_583664 ) ) ( not ( = ?auto_583659 ?auto_583665 ) ) ( not ( = ?auto_583659 ?auto_583666 ) ) ( not ( = ?auto_583659 ?auto_583667 ) ) ( not ( = ?auto_583659 ?auto_583668 ) ) ( not ( = ?auto_583659 ?auto_583669 ) ) ( not ( = ?auto_583659 ?auto_583670 ) ) ( not ( = ?auto_583659 ?auto_583671 ) ) ( not ( = ?auto_583660 ?auto_583661 ) ) ( not ( = ?auto_583660 ?auto_583662 ) ) ( not ( = ?auto_583660 ?auto_583663 ) ) ( not ( = ?auto_583660 ?auto_583664 ) ) ( not ( = ?auto_583660 ?auto_583665 ) ) ( not ( = ?auto_583660 ?auto_583666 ) ) ( not ( = ?auto_583660 ?auto_583667 ) ) ( not ( = ?auto_583660 ?auto_583668 ) ) ( not ( = ?auto_583660 ?auto_583669 ) ) ( not ( = ?auto_583660 ?auto_583670 ) ) ( not ( = ?auto_583660 ?auto_583671 ) ) ( not ( = ?auto_583661 ?auto_583662 ) ) ( not ( = ?auto_583661 ?auto_583663 ) ) ( not ( = ?auto_583661 ?auto_583664 ) ) ( not ( = ?auto_583661 ?auto_583665 ) ) ( not ( = ?auto_583661 ?auto_583666 ) ) ( not ( = ?auto_583661 ?auto_583667 ) ) ( not ( = ?auto_583661 ?auto_583668 ) ) ( not ( = ?auto_583661 ?auto_583669 ) ) ( not ( = ?auto_583661 ?auto_583670 ) ) ( not ( = ?auto_583661 ?auto_583671 ) ) ( not ( = ?auto_583662 ?auto_583663 ) ) ( not ( = ?auto_583662 ?auto_583664 ) ) ( not ( = ?auto_583662 ?auto_583665 ) ) ( not ( = ?auto_583662 ?auto_583666 ) ) ( not ( = ?auto_583662 ?auto_583667 ) ) ( not ( = ?auto_583662 ?auto_583668 ) ) ( not ( = ?auto_583662 ?auto_583669 ) ) ( not ( = ?auto_583662 ?auto_583670 ) ) ( not ( = ?auto_583662 ?auto_583671 ) ) ( not ( = ?auto_583663 ?auto_583664 ) ) ( not ( = ?auto_583663 ?auto_583665 ) ) ( not ( = ?auto_583663 ?auto_583666 ) ) ( not ( = ?auto_583663 ?auto_583667 ) ) ( not ( = ?auto_583663 ?auto_583668 ) ) ( not ( = ?auto_583663 ?auto_583669 ) ) ( not ( = ?auto_583663 ?auto_583670 ) ) ( not ( = ?auto_583663 ?auto_583671 ) ) ( not ( = ?auto_583664 ?auto_583665 ) ) ( not ( = ?auto_583664 ?auto_583666 ) ) ( not ( = ?auto_583664 ?auto_583667 ) ) ( not ( = ?auto_583664 ?auto_583668 ) ) ( not ( = ?auto_583664 ?auto_583669 ) ) ( not ( = ?auto_583664 ?auto_583670 ) ) ( not ( = ?auto_583664 ?auto_583671 ) ) ( not ( = ?auto_583665 ?auto_583666 ) ) ( not ( = ?auto_583665 ?auto_583667 ) ) ( not ( = ?auto_583665 ?auto_583668 ) ) ( not ( = ?auto_583665 ?auto_583669 ) ) ( not ( = ?auto_583665 ?auto_583670 ) ) ( not ( = ?auto_583665 ?auto_583671 ) ) ( not ( = ?auto_583666 ?auto_583667 ) ) ( not ( = ?auto_583666 ?auto_583668 ) ) ( not ( = ?auto_583666 ?auto_583669 ) ) ( not ( = ?auto_583666 ?auto_583670 ) ) ( not ( = ?auto_583666 ?auto_583671 ) ) ( not ( = ?auto_583667 ?auto_583668 ) ) ( not ( = ?auto_583667 ?auto_583669 ) ) ( not ( = ?auto_583667 ?auto_583670 ) ) ( not ( = ?auto_583667 ?auto_583671 ) ) ( not ( = ?auto_583668 ?auto_583669 ) ) ( not ( = ?auto_583668 ?auto_583670 ) ) ( not ( = ?auto_583668 ?auto_583671 ) ) ( not ( = ?auto_583669 ?auto_583670 ) ) ( not ( = ?auto_583669 ?auto_583671 ) ) ( not ( = ?auto_583670 ?auto_583671 ) ) ( ON ?auto_583669 ?auto_583670 ) ( ON ?auto_583668 ?auto_583669 ) ( ON ?auto_583667 ?auto_583668 ) ( ON ?auto_583666 ?auto_583667 ) ( ON ?auto_583665 ?auto_583666 ) ( ON ?auto_583664 ?auto_583665 ) ( ON ?auto_583663 ?auto_583664 ) ( ON ?auto_583662 ?auto_583663 ) ( CLEAR ?auto_583660 ) ( ON ?auto_583661 ?auto_583662 ) ( CLEAR ?auto_583661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_583655 ?auto_583656 ?auto_583657 ?auto_583658 ?auto_583659 ?auto_583660 ?auto_583661 )
      ( MAKE-16PILE ?auto_583655 ?auto_583656 ?auto_583657 ?auto_583658 ?auto_583659 ?auto_583660 ?auto_583661 ?auto_583662 ?auto_583663 ?auto_583664 ?auto_583665 ?auto_583666 ?auto_583667 ?auto_583668 ?auto_583669 ?auto_583670 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583688 - BLOCK
      ?auto_583689 - BLOCK
      ?auto_583690 - BLOCK
      ?auto_583691 - BLOCK
      ?auto_583692 - BLOCK
      ?auto_583693 - BLOCK
      ?auto_583694 - BLOCK
      ?auto_583695 - BLOCK
      ?auto_583696 - BLOCK
      ?auto_583697 - BLOCK
      ?auto_583698 - BLOCK
      ?auto_583699 - BLOCK
      ?auto_583700 - BLOCK
      ?auto_583701 - BLOCK
      ?auto_583702 - BLOCK
      ?auto_583703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_583703 ) ( ON-TABLE ?auto_583688 ) ( ON ?auto_583689 ?auto_583688 ) ( ON ?auto_583690 ?auto_583689 ) ( ON ?auto_583691 ?auto_583690 ) ( ON ?auto_583692 ?auto_583691 ) ( ON ?auto_583693 ?auto_583692 ) ( not ( = ?auto_583688 ?auto_583689 ) ) ( not ( = ?auto_583688 ?auto_583690 ) ) ( not ( = ?auto_583688 ?auto_583691 ) ) ( not ( = ?auto_583688 ?auto_583692 ) ) ( not ( = ?auto_583688 ?auto_583693 ) ) ( not ( = ?auto_583688 ?auto_583694 ) ) ( not ( = ?auto_583688 ?auto_583695 ) ) ( not ( = ?auto_583688 ?auto_583696 ) ) ( not ( = ?auto_583688 ?auto_583697 ) ) ( not ( = ?auto_583688 ?auto_583698 ) ) ( not ( = ?auto_583688 ?auto_583699 ) ) ( not ( = ?auto_583688 ?auto_583700 ) ) ( not ( = ?auto_583688 ?auto_583701 ) ) ( not ( = ?auto_583688 ?auto_583702 ) ) ( not ( = ?auto_583688 ?auto_583703 ) ) ( not ( = ?auto_583689 ?auto_583690 ) ) ( not ( = ?auto_583689 ?auto_583691 ) ) ( not ( = ?auto_583689 ?auto_583692 ) ) ( not ( = ?auto_583689 ?auto_583693 ) ) ( not ( = ?auto_583689 ?auto_583694 ) ) ( not ( = ?auto_583689 ?auto_583695 ) ) ( not ( = ?auto_583689 ?auto_583696 ) ) ( not ( = ?auto_583689 ?auto_583697 ) ) ( not ( = ?auto_583689 ?auto_583698 ) ) ( not ( = ?auto_583689 ?auto_583699 ) ) ( not ( = ?auto_583689 ?auto_583700 ) ) ( not ( = ?auto_583689 ?auto_583701 ) ) ( not ( = ?auto_583689 ?auto_583702 ) ) ( not ( = ?auto_583689 ?auto_583703 ) ) ( not ( = ?auto_583690 ?auto_583691 ) ) ( not ( = ?auto_583690 ?auto_583692 ) ) ( not ( = ?auto_583690 ?auto_583693 ) ) ( not ( = ?auto_583690 ?auto_583694 ) ) ( not ( = ?auto_583690 ?auto_583695 ) ) ( not ( = ?auto_583690 ?auto_583696 ) ) ( not ( = ?auto_583690 ?auto_583697 ) ) ( not ( = ?auto_583690 ?auto_583698 ) ) ( not ( = ?auto_583690 ?auto_583699 ) ) ( not ( = ?auto_583690 ?auto_583700 ) ) ( not ( = ?auto_583690 ?auto_583701 ) ) ( not ( = ?auto_583690 ?auto_583702 ) ) ( not ( = ?auto_583690 ?auto_583703 ) ) ( not ( = ?auto_583691 ?auto_583692 ) ) ( not ( = ?auto_583691 ?auto_583693 ) ) ( not ( = ?auto_583691 ?auto_583694 ) ) ( not ( = ?auto_583691 ?auto_583695 ) ) ( not ( = ?auto_583691 ?auto_583696 ) ) ( not ( = ?auto_583691 ?auto_583697 ) ) ( not ( = ?auto_583691 ?auto_583698 ) ) ( not ( = ?auto_583691 ?auto_583699 ) ) ( not ( = ?auto_583691 ?auto_583700 ) ) ( not ( = ?auto_583691 ?auto_583701 ) ) ( not ( = ?auto_583691 ?auto_583702 ) ) ( not ( = ?auto_583691 ?auto_583703 ) ) ( not ( = ?auto_583692 ?auto_583693 ) ) ( not ( = ?auto_583692 ?auto_583694 ) ) ( not ( = ?auto_583692 ?auto_583695 ) ) ( not ( = ?auto_583692 ?auto_583696 ) ) ( not ( = ?auto_583692 ?auto_583697 ) ) ( not ( = ?auto_583692 ?auto_583698 ) ) ( not ( = ?auto_583692 ?auto_583699 ) ) ( not ( = ?auto_583692 ?auto_583700 ) ) ( not ( = ?auto_583692 ?auto_583701 ) ) ( not ( = ?auto_583692 ?auto_583702 ) ) ( not ( = ?auto_583692 ?auto_583703 ) ) ( not ( = ?auto_583693 ?auto_583694 ) ) ( not ( = ?auto_583693 ?auto_583695 ) ) ( not ( = ?auto_583693 ?auto_583696 ) ) ( not ( = ?auto_583693 ?auto_583697 ) ) ( not ( = ?auto_583693 ?auto_583698 ) ) ( not ( = ?auto_583693 ?auto_583699 ) ) ( not ( = ?auto_583693 ?auto_583700 ) ) ( not ( = ?auto_583693 ?auto_583701 ) ) ( not ( = ?auto_583693 ?auto_583702 ) ) ( not ( = ?auto_583693 ?auto_583703 ) ) ( not ( = ?auto_583694 ?auto_583695 ) ) ( not ( = ?auto_583694 ?auto_583696 ) ) ( not ( = ?auto_583694 ?auto_583697 ) ) ( not ( = ?auto_583694 ?auto_583698 ) ) ( not ( = ?auto_583694 ?auto_583699 ) ) ( not ( = ?auto_583694 ?auto_583700 ) ) ( not ( = ?auto_583694 ?auto_583701 ) ) ( not ( = ?auto_583694 ?auto_583702 ) ) ( not ( = ?auto_583694 ?auto_583703 ) ) ( not ( = ?auto_583695 ?auto_583696 ) ) ( not ( = ?auto_583695 ?auto_583697 ) ) ( not ( = ?auto_583695 ?auto_583698 ) ) ( not ( = ?auto_583695 ?auto_583699 ) ) ( not ( = ?auto_583695 ?auto_583700 ) ) ( not ( = ?auto_583695 ?auto_583701 ) ) ( not ( = ?auto_583695 ?auto_583702 ) ) ( not ( = ?auto_583695 ?auto_583703 ) ) ( not ( = ?auto_583696 ?auto_583697 ) ) ( not ( = ?auto_583696 ?auto_583698 ) ) ( not ( = ?auto_583696 ?auto_583699 ) ) ( not ( = ?auto_583696 ?auto_583700 ) ) ( not ( = ?auto_583696 ?auto_583701 ) ) ( not ( = ?auto_583696 ?auto_583702 ) ) ( not ( = ?auto_583696 ?auto_583703 ) ) ( not ( = ?auto_583697 ?auto_583698 ) ) ( not ( = ?auto_583697 ?auto_583699 ) ) ( not ( = ?auto_583697 ?auto_583700 ) ) ( not ( = ?auto_583697 ?auto_583701 ) ) ( not ( = ?auto_583697 ?auto_583702 ) ) ( not ( = ?auto_583697 ?auto_583703 ) ) ( not ( = ?auto_583698 ?auto_583699 ) ) ( not ( = ?auto_583698 ?auto_583700 ) ) ( not ( = ?auto_583698 ?auto_583701 ) ) ( not ( = ?auto_583698 ?auto_583702 ) ) ( not ( = ?auto_583698 ?auto_583703 ) ) ( not ( = ?auto_583699 ?auto_583700 ) ) ( not ( = ?auto_583699 ?auto_583701 ) ) ( not ( = ?auto_583699 ?auto_583702 ) ) ( not ( = ?auto_583699 ?auto_583703 ) ) ( not ( = ?auto_583700 ?auto_583701 ) ) ( not ( = ?auto_583700 ?auto_583702 ) ) ( not ( = ?auto_583700 ?auto_583703 ) ) ( not ( = ?auto_583701 ?auto_583702 ) ) ( not ( = ?auto_583701 ?auto_583703 ) ) ( not ( = ?auto_583702 ?auto_583703 ) ) ( ON ?auto_583702 ?auto_583703 ) ( ON ?auto_583701 ?auto_583702 ) ( ON ?auto_583700 ?auto_583701 ) ( ON ?auto_583699 ?auto_583700 ) ( ON ?auto_583698 ?auto_583699 ) ( ON ?auto_583697 ?auto_583698 ) ( ON ?auto_583696 ?auto_583697 ) ( ON ?auto_583695 ?auto_583696 ) ( CLEAR ?auto_583693 ) ( ON ?auto_583694 ?auto_583695 ) ( CLEAR ?auto_583694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_583688 ?auto_583689 ?auto_583690 ?auto_583691 ?auto_583692 ?auto_583693 ?auto_583694 )
      ( MAKE-16PILE ?auto_583688 ?auto_583689 ?auto_583690 ?auto_583691 ?auto_583692 ?auto_583693 ?auto_583694 ?auto_583695 ?auto_583696 ?auto_583697 ?auto_583698 ?auto_583699 ?auto_583700 ?auto_583701 ?auto_583702 ?auto_583703 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583720 - BLOCK
      ?auto_583721 - BLOCK
      ?auto_583722 - BLOCK
      ?auto_583723 - BLOCK
      ?auto_583724 - BLOCK
      ?auto_583725 - BLOCK
      ?auto_583726 - BLOCK
      ?auto_583727 - BLOCK
      ?auto_583728 - BLOCK
      ?auto_583729 - BLOCK
      ?auto_583730 - BLOCK
      ?auto_583731 - BLOCK
      ?auto_583732 - BLOCK
      ?auto_583733 - BLOCK
      ?auto_583734 - BLOCK
      ?auto_583735 - BLOCK
    )
    :vars
    (
      ?auto_583736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583735 ?auto_583736 ) ( ON-TABLE ?auto_583720 ) ( ON ?auto_583721 ?auto_583720 ) ( ON ?auto_583722 ?auto_583721 ) ( ON ?auto_583723 ?auto_583722 ) ( ON ?auto_583724 ?auto_583723 ) ( not ( = ?auto_583720 ?auto_583721 ) ) ( not ( = ?auto_583720 ?auto_583722 ) ) ( not ( = ?auto_583720 ?auto_583723 ) ) ( not ( = ?auto_583720 ?auto_583724 ) ) ( not ( = ?auto_583720 ?auto_583725 ) ) ( not ( = ?auto_583720 ?auto_583726 ) ) ( not ( = ?auto_583720 ?auto_583727 ) ) ( not ( = ?auto_583720 ?auto_583728 ) ) ( not ( = ?auto_583720 ?auto_583729 ) ) ( not ( = ?auto_583720 ?auto_583730 ) ) ( not ( = ?auto_583720 ?auto_583731 ) ) ( not ( = ?auto_583720 ?auto_583732 ) ) ( not ( = ?auto_583720 ?auto_583733 ) ) ( not ( = ?auto_583720 ?auto_583734 ) ) ( not ( = ?auto_583720 ?auto_583735 ) ) ( not ( = ?auto_583720 ?auto_583736 ) ) ( not ( = ?auto_583721 ?auto_583722 ) ) ( not ( = ?auto_583721 ?auto_583723 ) ) ( not ( = ?auto_583721 ?auto_583724 ) ) ( not ( = ?auto_583721 ?auto_583725 ) ) ( not ( = ?auto_583721 ?auto_583726 ) ) ( not ( = ?auto_583721 ?auto_583727 ) ) ( not ( = ?auto_583721 ?auto_583728 ) ) ( not ( = ?auto_583721 ?auto_583729 ) ) ( not ( = ?auto_583721 ?auto_583730 ) ) ( not ( = ?auto_583721 ?auto_583731 ) ) ( not ( = ?auto_583721 ?auto_583732 ) ) ( not ( = ?auto_583721 ?auto_583733 ) ) ( not ( = ?auto_583721 ?auto_583734 ) ) ( not ( = ?auto_583721 ?auto_583735 ) ) ( not ( = ?auto_583721 ?auto_583736 ) ) ( not ( = ?auto_583722 ?auto_583723 ) ) ( not ( = ?auto_583722 ?auto_583724 ) ) ( not ( = ?auto_583722 ?auto_583725 ) ) ( not ( = ?auto_583722 ?auto_583726 ) ) ( not ( = ?auto_583722 ?auto_583727 ) ) ( not ( = ?auto_583722 ?auto_583728 ) ) ( not ( = ?auto_583722 ?auto_583729 ) ) ( not ( = ?auto_583722 ?auto_583730 ) ) ( not ( = ?auto_583722 ?auto_583731 ) ) ( not ( = ?auto_583722 ?auto_583732 ) ) ( not ( = ?auto_583722 ?auto_583733 ) ) ( not ( = ?auto_583722 ?auto_583734 ) ) ( not ( = ?auto_583722 ?auto_583735 ) ) ( not ( = ?auto_583722 ?auto_583736 ) ) ( not ( = ?auto_583723 ?auto_583724 ) ) ( not ( = ?auto_583723 ?auto_583725 ) ) ( not ( = ?auto_583723 ?auto_583726 ) ) ( not ( = ?auto_583723 ?auto_583727 ) ) ( not ( = ?auto_583723 ?auto_583728 ) ) ( not ( = ?auto_583723 ?auto_583729 ) ) ( not ( = ?auto_583723 ?auto_583730 ) ) ( not ( = ?auto_583723 ?auto_583731 ) ) ( not ( = ?auto_583723 ?auto_583732 ) ) ( not ( = ?auto_583723 ?auto_583733 ) ) ( not ( = ?auto_583723 ?auto_583734 ) ) ( not ( = ?auto_583723 ?auto_583735 ) ) ( not ( = ?auto_583723 ?auto_583736 ) ) ( not ( = ?auto_583724 ?auto_583725 ) ) ( not ( = ?auto_583724 ?auto_583726 ) ) ( not ( = ?auto_583724 ?auto_583727 ) ) ( not ( = ?auto_583724 ?auto_583728 ) ) ( not ( = ?auto_583724 ?auto_583729 ) ) ( not ( = ?auto_583724 ?auto_583730 ) ) ( not ( = ?auto_583724 ?auto_583731 ) ) ( not ( = ?auto_583724 ?auto_583732 ) ) ( not ( = ?auto_583724 ?auto_583733 ) ) ( not ( = ?auto_583724 ?auto_583734 ) ) ( not ( = ?auto_583724 ?auto_583735 ) ) ( not ( = ?auto_583724 ?auto_583736 ) ) ( not ( = ?auto_583725 ?auto_583726 ) ) ( not ( = ?auto_583725 ?auto_583727 ) ) ( not ( = ?auto_583725 ?auto_583728 ) ) ( not ( = ?auto_583725 ?auto_583729 ) ) ( not ( = ?auto_583725 ?auto_583730 ) ) ( not ( = ?auto_583725 ?auto_583731 ) ) ( not ( = ?auto_583725 ?auto_583732 ) ) ( not ( = ?auto_583725 ?auto_583733 ) ) ( not ( = ?auto_583725 ?auto_583734 ) ) ( not ( = ?auto_583725 ?auto_583735 ) ) ( not ( = ?auto_583725 ?auto_583736 ) ) ( not ( = ?auto_583726 ?auto_583727 ) ) ( not ( = ?auto_583726 ?auto_583728 ) ) ( not ( = ?auto_583726 ?auto_583729 ) ) ( not ( = ?auto_583726 ?auto_583730 ) ) ( not ( = ?auto_583726 ?auto_583731 ) ) ( not ( = ?auto_583726 ?auto_583732 ) ) ( not ( = ?auto_583726 ?auto_583733 ) ) ( not ( = ?auto_583726 ?auto_583734 ) ) ( not ( = ?auto_583726 ?auto_583735 ) ) ( not ( = ?auto_583726 ?auto_583736 ) ) ( not ( = ?auto_583727 ?auto_583728 ) ) ( not ( = ?auto_583727 ?auto_583729 ) ) ( not ( = ?auto_583727 ?auto_583730 ) ) ( not ( = ?auto_583727 ?auto_583731 ) ) ( not ( = ?auto_583727 ?auto_583732 ) ) ( not ( = ?auto_583727 ?auto_583733 ) ) ( not ( = ?auto_583727 ?auto_583734 ) ) ( not ( = ?auto_583727 ?auto_583735 ) ) ( not ( = ?auto_583727 ?auto_583736 ) ) ( not ( = ?auto_583728 ?auto_583729 ) ) ( not ( = ?auto_583728 ?auto_583730 ) ) ( not ( = ?auto_583728 ?auto_583731 ) ) ( not ( = ?auto_583728 ?auto_583732 ) ) ( not ( = ?auto_583728 ?auto_583733 ) ) ( not ( = ?auto_583728 ?auto_583734 ) ) ( not ( = ?auto_583728 ?auto_583735 ) ) ( not ( = ?auto_583728 ?auto_583736 ) ) ( not ( = ?auto_583729 ?auto_583730 ) ) ( not ( = ?auto_583729 ?auto_583731 ) ) ( not ( = ?auto_583729 ?auto_583732 ) ) ( not ( = ?auto_583729 ?auto_583733 ) ) ( not ( = ?auto_583729 ?auto_583734 ) ) ( not ( = ?auto_583729 ?auto_583735 ) ) ( not ( = ?auto_583729 ?auto_583736 ) ) ( not ( = ?auto_583730 ?auto_583731 ) ) ( not ( = ?auto_583730 ?auto_583732 ) ) ( not ( = ?auto_583730 ?auto_583733 ) ) ( not ( = ?auto_583730 ?auto_583734 ) ) ( not ( = ?auto_583730 ?auto_583735 ) ) ( not ( = ?auto_583730 ?auto_583736 ) ) ( not ( = ?auto_583731 ?auto_583732 ) ) ( not ( = ?auto_583731 ?auto_583733 ) ) ( not ( = ?auto_583731 ?auto_583734 ) ) ( not ( = ?auto_583731 ?auto_583735 ) ) ( not ( = ?auto_583731 ?auto_583736 ) ) ( not ( = ?auto_583732 ?auto_583733 ) ) ( not ( = ?auto_583732 ?auto_583734 ) ) ( not ( = ?auto_583732 ?auto_583735 ) ) ( not ( = ?auto_583732 ?auto_583736 ) ) ( not ( = ?auto_583733 ?auto_583734 ) ) ( not ( = ?auto_583733 ?auto_583735 ) ) ( not ( = ?auto_583733 ?auto_583736 ) ) ( not ( = ?auto_583734 ?auto_583735 ) ) ( not ( = ?auto_583734 ?auto_583736 ) ) ( not ( = ?auto_583735 ?auto_583736 ) ) ( ON ?auto_583734 ?auto_583735 ) ( ON ?auto_583733 ?auto_583734 ) ( ON ?auto_583732 ?auto_583733 ) ( ON ?auto_583731 ?auto_583732 ) ( ON ?auto_583730 ?auto_583731 ) ( ON ?auto_583729 ?auto_583730 ) ( ON ?auto_583728 ?auto_583729 ) ( ON ?auto_583727 ?auto_583728 ) ( ON ?auto_583726 ?auto_583727 ) ( CLEAR ?auto_583724 ) ( ON ?auto_583725 ?auto_583726 ) ( CLEAR ?auto_583725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_583720 ?auto_583721 ?auto_583722 ?auto_583723 ?auto_583724 ?auto_583725 )
      ( MAKE-16PILE ?auto_583720 ?auto_583721 ?auto_583722 ?auto_583723 ?auto_583724 ?auto_583725 ?auto_583726 ?auto_583727 ?auto_583728 ?auto_583729 ?auto_583730 ?auto_583731 ?auto_583732 ?auto_583733 ?auto_583734 ?auto_583735 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583753 - BLOCK
      ?auto_583754 - BLOCK
      ?auto_583755 - BLOCK
      ?auto_583756 - BLOCK
      ?auto_583757 - BLOCK
      ?auto_583758 - BLOCK
      ?auto_583759 - BLOCK
      ?auto_583760 - BLOCK
      ?auto_583761 - BLOCK
      ?auto_583762 - BLOCK
      ?auto_583763 - BLOCK
      ?auto_583764 - BLOCK
      ?auto_583765 - BLOCK
      ?auto_583766 - BLOCK
      ?auto_583767 - BLOCK
      ?auto_583768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_583768 ) ( ON-TABLE ?auto_583753 ) ( ON ?auto_583754 ?auto_583753 ) ( ON ?auto_583755 ?auto_583754 ) ( ON ?auto_583756 ?auto_583755 ) ( ON ?auto_583757 ?auto_583756 ) ( not ( = ?auto_583753 ?auto_583754 ) ) ( not ( = ?auto_583753 ?auto_583755 ) ) ( not ( = ?auto_583753 ?auto_583756 ) ) ( not ( = ?auto_583753 ?auto_583757 ) ) ( not ( = ?auto_583753 ?auto_583758 ) ) ( not ( = ?auto_583753 ?auto_583759 ) ) ( not ( = ?auto_583753 ?auto_583760 ) ) ( not ( = ?auto_583753 ?auto_583761 ) ) ( not ( = ?auto_583753 ?auto_583762 ) ) ( not ( = ?auto_583753 ?auto_583763 ) ) ( not ( = ?auto_583753 ?auto_583764 ) ) ( not ( = ?auto_583753 ?auto_583765 ) ) ( not ( = ?auto_583753 ?auto_583766 ) ) ( not ( = ?auto_583753 ?auto_583767 ) ) ( not ( = ?auto_583753 ?auto_583768 ) ) ( not ( = ?auto_583754 ?auto_583755 ) ) ( not ( = ?auto_583754 ?auto_583756 ) ) ( not ( = ?auto_583754 ?auto_583757 ) ) ( not ( = ?auto_583754 ?auto_583758 ) ) ( not ( = ?auto_583754 ?auto_583759 ) ) ( not ( = ?auto_583754 ?auto_583760 ) ) ( not ( = ?auto_583754 ?auto_583761 ) ) ( not ( = ?auto_583754 ?auto_583762 ) ) ( not ( = ?auto_583754 ?auto_583763 ) ) ( not ( = ?auto_583754 ?auto_583764 ) ) ( not ( = ?auto_583754 ?auto_583765 ) ) ( not ( = ?auto_583754 ?auto_583766 ) ) ( not ( = ?auto_583754 ?auto_583767 ) ) ( not ( = ?auto_583754 ?auto_583768 ) ) ( not ( = ?auto_583755 ?auto_583756 ) ) ( not ( = ?auto_583755 ?auto_583757 ) ) ( not ( = ?auto_583755 ?auto_583758 ) ) ( not ( = ?auto_583755 ?auto_583759 ) ) ( not ( = ?auto_583755 ?auto_583760 ) ) ( not ( = ?auto_583755 ?auto_583761 ) ) ( not ( = ?auto_583755 ?auto_583762 ) ) ( not ( = ?auto_583755 ?auto_583763 ) ) ( not ( = ?auto_583755 ?auto_583764 ) ) ( not ( = ?auto_583755 ?auto_583765 ) ) ( not ( = ?auto_583755 ?auto_583766 ) ) ( not ( = ?auto_583755 ?auto_583767 ) ) ( not ( = ?auto_583755 ?auto_583768 ) ) ( not ( = ?auto_583756 ?auto_583757 ) ) ( not ( = ?auto_583756 ?auto_583758 ) ) ( not ( = ?auto_583756 ?auto_583759 ) ) ( not ( = ?auto_583756 ?auto_583760 ) ) ( not ( = ?auto_583756 ?auto_583761 ) ) ( not ( = ?auto_583756 ?auto_583762 ) ) ( not ( = ?auto_583756 ?auto_583763 ) ) ( not ( = ?auto_583756 ?auto_583764 ) ) ( not ( = ?auto_583756 ?auto_583765 ) ) ( not ( = ?auto_583756 ?auto_583766 ) ) ( not ( = ?auto_583756 ?auto_583767 ) ) ( not ( = ?auto_583756 ?auto_583768 ) ) ( not ( = ?auto_583757 ?auto_583758 ) ) ( not ( = ?auto_583757 ?auto_583759 ) ) ( not ( = ?auto_583757 ?auto_583760 ) ) ( not ( = ?auto_583757 ?auto_583761 ) ) ( not ( = ?auto_583757 ?auto_583762 ) ) ( not ( = ?auto_583757 ?auto_583763 ) ) ( not ( = ?auto_583757 ?auto_583764 ) ) ( not ( = ?auto_583757 ?auto_583765 ) ) ( not ( = ?auto_583757 ?auto_583766 ) ) ( not ( = ?auto_583757 ?auto_583767 ) ) ( not ( = ?auto_583757 ?auto_583768 ) ) ( not ( = ?auto_583758 ?auto_583759 ) ) ( not ( = ?auto_583758 ?auto_583760 ) ) ( not ( = ?auto_583758 ?auto_583761 ) ) ( not ( = ?auto_583758 ?auto_583762 ) ) ( not ( = ?auto_583758 ?auto_583763 ) ) ( not ( = ?auto_583758 ?auto_583764 ) ) ( not ( = ?auto_583758 ?auto_583765 ) ) ( not ( = ?auto_583758 ?auto_583766 ) ) ( not ( = ?auto_583758 ?auto_583767 ) ) ( not ( = ?auto_583758 ?auto_583768 ) ) ( not ( = ?auto_583759 ?auto_583760 ) ) ( not ( = ?auto_583759 ?auto_583761 ) ) ( not ( = ?auto_583759 ?auto_583762 ) ) ( not ( = ?auto_583759 ?auto_583763 ) ) ( not ( = ?auto_583759 ?auto_583764 ) ) ( not ( = ?auto_583759 ?auto_583765 ) ) ( not ( = ?auto_583759 ?auto_583766 ) ) ( not ( = ?auto_583759 ?auto_583767 ) ) ( not ( = ?auto_583759 ?auto_583768 ) ) ( not ( = ?auto_583760 ?auto_583761 ) ) ( not ( = ?auto_583760 ?auto_583762 ) ) ( not ( = ?auto_583760 ?auto_583763 ) ) ( not ( = ?auto_583760 ?auto_583764 ) ) ( not ( = ?auto_583760 ?auto_583765 ) ) ( not ( = ?auto_583760 ?auto_583766 ) ) ( not ( = ?auto_583760 ?auto_583767 ) ) ( not ( = ?auto_583760 ?auto_583768 ) ) ( not ( = ?auto_583761 ?auto_583762 ) ) ( not ( = ?auto_583761 ?auto_583763 ) ) ( not ( = ?auto_583761 ?auto_583764 ) ) ( not ( = ?auto_583761 ?auto_583765 ) ) ( not ( = ?auto_583761 ?auto_583766 ) ) ( not ( = ?auto_583761 ?auto_583767 ) ) ( not ( = ?auto_583761 ?auto_583768 ) ) ( not ( = ?auto_583762 ?auto_583763 ) ) ( not ( = ?auto_583762 ?auto_583764 ) ) ( not ( = ?auto_583762 ?auto_583765 ) ) ( not ( = ?auto_583762 ?auto_583766 ) ) ( not ( = ?auto_583762 ?auto_583767 ) ) ( not ( = ?auto_583762 ?auto_583768 ) ) ( not ( = ?auto_583763 ?auto_583764 ) ) ( not ( = ?auto_583763 ?auto_583765 ) ) ( not ( = ?auto_583763 ?auto_583766 ) ) ( not ( = ?auto_583763 ?auto_583767 ) ) ( not ( = ?auto_583763 ?auto_583768 ) ) ( not ( = ?auto_583764 ?auto_583765 ) ) ( not ( = ?auto_583764 ?auto_583766 ) ) ( not ( = ?auto_583764 ?auto_583767 ) ) ( not ( = ?auto_583764 ?auto_583768 ) ) ( not ( = ?auto_583765 ?auto_583766 ) ) ( not ( = ?auto_583765 ?auto_583767 ) ) ( not ( = ?auto_583765 ?auto_583768 ) ) ( not ( = ?auto_583766 ?auto_583767 ) ) ( not ( = ?auto_583766 ?auto_583768 ) ) ( not ( = ?auto_583767 ?auto_583768 ) ) ( ON ?auto_583767 ?auto_583768 ) ( ON ?auto_583766 ?auto_583767 ) ( ON ?auto_583765 ?auto_583766 ) ( ON ?auto_583764 ?auto_583765 ) ( ON ?auto_583763 ?auto_583764 ) ( ON ?auto_583762 ?auto_583763 ) ( ON ?auto_583761 ?auto_583762 ) ( ON ?auto_583760 ?auto_583761 ) ( ON ?auto_583759 ?auto_583760 ) ( CLEAR ?auto_583757 ) ( ON ?auto_583758 ?auto_583759 ) ( CLEAR ?auto_583758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_583753 ?auto_583754 ?auto_583755 ?auto_583756 ?auto_583757 ?auto_583758 )
      ( MAKE-16PILE ?auto_583753 ?auto_583754 ?auto_583755 ?auto_583756 ?auto_583757 ?auto_583758 ?auto_583759 ?auto_583760 ?auto_583761 ?auto_583762 ?auto_583763 ?auto_583764 ?auto_583765 ?auto_583766 ?auto_583767 ?auto_583768 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583785 - BLOCK
      ?auto_583786 - BLOCK
      ?auto_583787 - BLOCK
      ?auto_583788 - BLOCK
      ?auto_583789 - BLOCK
      ?auto_583790 - BLOCK
      ?auto_583791 - BLOCK
      ?auto_583792 - BLOCK
      ?auto_583793 - BLOCK
      ?auto_583794 - BLOCK
      ?auto_583795 - BLOCK
      ?auto_583796 - BLOCK
      ?auto_583797 - BLOCK
      ?auto_583798 - BLOCK
      ?auto_583799 - BLOCK
      ?auto_583800 - BLOCK
    )
    :vars
    (
      ?auto_583801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583800 ?auto_583801 ) ( ON-TABLE ?auto_583785 ) ( ON ?auto_583786 ?auto_583785 ) ( ON ?auto_583787 ?auto_583786 ) ( ON ?auto_583788 ?auto_583787 ) ( not ( = ?auto_583785 ?auto_583786 ) ) ( not ( = ?auto_583785 ?auto_583787 ) ) ( not ( = ?auto_583785 ?auto_583788 ) ) ( not ( = ?auto_583785 ?auto_583789 ) ) ( not ( = ?auto_583785 ?auto_583790 ) ) ( not ( = ?auto_583785 ?auto_583791 ) ) ( not ( = ?auto_583785 ?auto_583792 ) ) ( not ( = ?auto_583785 ?auto_583793 ) ) ( not ( = ?auto_583785 ?auto_583794 ) ) ( not ( = ?auto_583785 ?auto_583795 ) ) ( not ( = ?auto_583785 ?auto_583796 ) ) ( not ( = ?auto_583785 ?auto_583797 ) ) ( not ( = ?auto_583785 ?auto_583798 ) ) ( not ( = ?auto_583785 ?auto_583799 ) ) ( not ( = ?auto_583785 ?auto_583800 ) ) ( not ( = ?auto_583785 ?auto_583801 ) ) ( not ( = ?auto_583786 ?auto_583787 ) ) ( not ( = ?auto_583786 ?auto_583788 ) ) ( not ( = ?auto_583786 ?auto_583789 ) ) ( not ( = ?auto_583786 ?auto_583790 ) ) ( not ( = ?auto_583786 ?auto_583791 ) ) ( not ( = ?auto_583786 ?auto_583792 ) ) ( not ( = ?auto_583786 ?auto_583793 ) ) ( not ( = ?auto_583786 ?auto_583794 ) ) ( not ( = ?auto_583786 ?auto_583795 ) ) ( not ( = ?auto_583786 ?auto_583796 ) ) ( not ( = ?auto_583786 ?auto_583797 ) ) ( not ( = ?auto_583786 ?auto_583798 ) ) ( not ( = ?auto_583786 ?auto_583799 ) ) ( not ( = ?auto_583786 ?auto_583800 ) ) ( not ( = ?auto_583786 ?auto_583801 ) ) ( not ( = ?auto_583787 ?auto_583788 ) ) ( not ( = ?auto_583787 ?auto_583789 ) ) ( not ( = ?auto_583787 ?auto_583790 ) ) ( not ( = ?auto_583787 ?auto_583791 ) ) ( not ( = ?auto_583787 ?auto_583792 ) ) ( not ( = ?auto_583787 ?auto_583793 ) ) ( not ( = ?auto_583787 ?auto_583794 ) ) ( not ( = ?auto_583787 ?auto_583795 ) ) ( not ( = ?auto_583787 ?auto_583796 ) ) ( not ( = ?auto_583787 ?auto_583797 ) ) ( not ( = ?auto_583787 ?auto_583798 ) ) ( not ( = ?auto_583787 ?auto_583799 ) ) ( not ( = ?auto_583787 ?auto_583800 ) ) ( not ( = ?auto_583787 ?auto_583801 ) ) ( not ( = ?auto_583788 ?auto_583789 ) ) ( not ( = ?auto_583788 ?auto_583790 ) ) ( not ( = ?auto_583788 ?auto_583791 ) ) ( not ( = ?auto_583788 ?auto_583792 ) ) ( not ( = ?auto_583788 ?auto_583793 ) ) ( not ( = ?auto_583788 ?auto_583794 ) ) ( not ( = ?auto_583788 ?auto_583795 ) ) ( not ( = ?auto_583788 ?auto_583796 ) ) ( not ( = ?auto_583788 ?auto_583797 ) ) ( not ( = ?auto_583788 ?auto_583798 ) ) ( not ( = ?auto_583788 ?auto_583799 ) ) ( not ( = ?auto_583788 ?auto_583800 ) ) ( not ( = ?auto_583788 ?auto_583801 ) ) ( not ( = ?auto_583789 ?auto_583790 ) ) ( not ( = ?auto_583789 ?auto_583791 ) ) ( not ( = ?auto_583789 ?auto_583792 ) ) ( not ( = ?auto_583789 ?auto_583793 ) ) ( not ( = ?auto_583789 ?auto_583794 ) ) ( not ( = ?auto_583789 ?auto_583795 ) ) ( not ( = ?auto_583789 ?auto_583796 ) ) ( not ( = ?auto_583789 ?auto_583797 ) ) ( not ( = ?auto_583789 ?auto_583798 ) ) ( not ( = ?auto_583789 ?auto_583799 ) ) ( not ( = ?auto_583789 ?auto_583800 ) ) ( not ( = ?auto_583789 ?auto_583801 ) ) ( not ( = ?auto_583790 ?auto_583791 ) ) ( not ( = ?auto_583790 ?auto_583792 ) ) ( not ( = ?auto_583790 ?auto_583793 ) ) ( not ( = ?auto_583790 ?auto_583794 ) ) ( not ( = ?auto_583790 ?auto_583795 ) ) ( not ( = ?auto_583790 ?auto_583796 ) ) ( not ( = ?auto_583790 ?auto_583797 ) ) ( not ( = ?auto_583790 ?auto_583798 ) ) ( not ( = ?auto_583790 ?auto_583799 ) ) ( not ( = ?auto_583790 ?auto_583800 ) ) ( not ( = ?auto_583790 ?auto_583801 ) ) ( not ( = ?auto_583791 ?auto_583792 ) ) ( not ( = ?auto_583791 ?auto_583793 ) ) ( not ( = ?auto_583791 ?auto_583794 ) ) ( not ( = ?auto_583791 ?auto_583795 ) ) ( not ( = ?auto_583791 ?auto_583796 ) ) ( not ( = ?auto_583791 ?auto_583797 ) ) ( not ( = ?auto_583791 ?auto_583798 ) ) ( not ( = ?auto_583791 ?auto_583799 ) ) ( not ( = ?auto_583791 ?auto_583800 ) ) ( not ( = ?auto_583791 ?auto_583801 ) ) ( not ( = ?auto_583792 ?auto_583793 ) ) ( not ( = ?auto_583792 ?auto_583794 ) ) ( not ( = ?auto_583792 ?auto_583795 ) ) ( not ( = ?auto_583792 ?auto_583796 ) ) ( not ( = ?auto_583792 ?auto_583797 ) ) ( not ( = ?auto_583792 ?auto_583798 ) ) ( not ( = ?auto_583792 ?auto_583799 ) ) ( not ( = ?auto_583792 ?auto_583800 ) ) ( not ( = ?auto_583792 ?auto_583801 ) ) ( not ( = ?auto_583793 ?auto_583794 ) ) ( not ( = ?auto_583793 ?auto_583795 ) ) ( not ( = ?auto_583793 ?auto_583796 ) ) ( not ( = ?auto_583793 ?auto_583797 ) ) ( not ( = ?auto_583793 ?auto_583798 ) ) ( not ( = ?auto_583793 ?auto_583799 ) ) ( not ( = ?auto_583793 ?auto_583800 ) ) ( not ( = ?auto_583793 ?auto_583801 ) ) ( not ( = ?auto_583794 ?auto_583795 ) ) ( not ( = ?auto_583794 ?auto_583796 ) ) ( not ( = ?auto_583794 ?auto_583797 ) ) ( not ( = ?auto_583794 ?auto_583798 ) ) ( not ( = ?auto_583794 ?auto_583799 ) ) ( not ( = ?auto_583794 ?auto_583800 ) ) ( not ( = ?auto_583794 ?auto_583801 ) ) ( not ( = ?auto_583795 ?auto_583796 ) ) ( not ( = ?auto_583795 ?auto_583797 ) ) ( not ( = ?auto_583795 ?auto_583798 ) ) ( not ( = ?auto_583795 ?auto_583799 ) ) ( not ( = ?auto_583795 ?auto_583800 ) ) ( not ( = ?auto_583795 ?auto_583801 ) ) ( not ( = ?auto_583796 ?auto_583797 ) ) ( not ( = ?auto_583796 ?auto_583798 ) ) ( not ( = ?auto_583796 ?auto_583799 ) ) ( not ( = ?auto_583796 ?auto_583800 ) ) ( not ( = ?auto_583796 ?auto_583801 ) ) ( not ( = ?auto_583797 ?auto_583798 ) ) ( not ( = ?auto_583797 ?auto_583799 ) ) ( not ( = ?auto_583797 ?auto_583800 ) ) ( not ( = ?auto_583797 ?auto_583801 ) ) ( not ( = ?auto_583798 ?auto_583799 ) ) ( not ( = ?auto_583798 ?auto_583800 ) ) ( not ( = ?auto_583798 ?auto_583801 ) ) ( not ( = ?auto_583799 ?auto_583800 ) ) ( not ( = ?auto_583799 ?auto_583801 ) ) ( not ( = ?auto_583800 ?auto_583801 ) ) ( ON ?auto_583799 ?auto_583800 ) ( ON ?auto_583798 ?auto_583799 ) ( ON ?auto_583797 ?auto_583798 ) ( ON ?auto_583796 ?auto_583797 ) ( ON ?auto_583795 ?auto_583796 ) ( ON ?auto_583794 ?auto_583795 ) ( ON ?auto_583793 ?auto_583794 ) ( ON ?auto_583792 ?auto_583793 ) ( ON ?auto_583791 ?auto_583792 ) ( ON ?auto_583790 ?auto_583791 ) ( CLEAR ?auto_583788 ) ( ON ?auto_583789 ?auto_583790 ) ( CLEAR ?auto_583789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_583785 ?auto_583786 ?auto_583787 ?auto_583788 ?auto_583789 )
      ( MAKE-16PILE ?auto_583785 ?auto_583786 ?auto_583787 ?auto_583788 ?auto_583789 ?auto_583790 ?auto_583791 ?auto_583792 ?auto_583793 ?auto_583794 ?auto_583795 ?auto_583796 ?auto_583797 ?auto_583798 ?auto_583799 ?auto_583800 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583818 - BLOCK
      ?auto_583819 - BLOCK
      ?auto_583820 - BLOCK
      ?auto_583821 - BLOCK
      ?auto_583822 - BLOCK
      ?auto_583823 - BLOCK
      ?auto_583824 - BLOCK
      ?auto_583825 - BLOCK
      ?auto_583826 - BLOCK
      ?auto_583827 - BLOCK
      ?auto_583828 - BLOCK
      ?auto_583829 - BLOCK
      ?auto_583830 - BLOCK
      ?auto_583831 - BLOCK
      ?auto_583832 - BLOCK
      ?auto_583833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_583833 ) ( ON-TABLE ?auto_583818 ) ( ON ?auto_583819 ?auto_583818 ) ( ON ?auto_583820 ?auto_583819 ) ( ON ?auto_583821 ?auto_583820 ) ( not ( = ?auto_583818 ?auto_583819 ) ) ( not ( = ?auto_583818 ?auto_583820 ) ) ( not ( = ?auto_583818 ?auto_583821 ) ) ( not ( = ?auto_583818 ?auto_583822 ) ) ( not ( = ?auto_583818 ?auto_583823 ) ) ( not ( = ?auto_583818 ?auto_583824 ) ) ( not ( = ?auto_583818 ?auto_583825 ) ) ( not ( = ?auto_583818 ?auto_583826 ) ) ( not ( = ?auto_583818 ?auto_583827 ) ) ( not ( = ?auto_583818 ?auto_583828 ) ) ( not ( = ?auto_583818 ?auto_583829 ) ) ( not ( = ?auto_583818 ?auto_583830 ) ) ( not ( = ?auto_583818 ?auto_583831 ) ) ( not ( = ?auto_583818 ?auto_583832 ) ) ( not ( = ?auto_583818 ?auto_583833 ) ) ( not ( = ?auto_583819 ?auto_583820 ) ) ( not ( = ?auto_583819 ?auto_583821 ) ) ( not ( = ?auto_583819 ?auto_583822 ) ) ( not ( = ?auto_583819 ?auto_583823 ) ) ( not ( = ?auto_583819 ?auto_583824 ) ) ( not ( = ?auto_583819 ?auto_583825 ) ) ( not ( = ?auto_583819 ?auto_583826 ) ) ( not ( = ?auto_583819 ?auto_583827 ) ) ( not ( = ?auto_583819 ?auto_583828 ) ) ( not ( = ?auto_583819 ?auto_583829 ) ) ( not ( = ?auto_583819 ?auto_583830 ) ) ( not ( = ?auto_583819 ?auto_583831 ) ) ( not ( = ?auto_583819 ?auto_583832 ) ) ( not ( = ?auto_583819 ?auto_583833 ) ) ( not ( = ?auto_583820 ?auto_583821 ) ) ( not ( = ?auto_583820 ?auto_583822 ) ) ( not ( = ?auto_583820 ?auto_583823 ) ) ( not ( = ?auto_583820 ?auto_583824 ) ) ( not ( = ?auto_583820 ?auto_583825 ) ) ( not ( = ?auto_583820 ?auto_583826 ) ) ( not ( = ?auto_583820 ?auto_583827 ) ) ( not ( = ?auto_583820 ?auto_583828 ) ) ( not ( = ?auto_583820 ?auto_583829 ) ) ( not ( = ?auto_583820 ?auto_583830 ) ) ( not ( = ?auto_583820 ?auto_583831 ) ) ( not ( = ?auto_583820 ?auto_583832 ) ) ( not ( = ?auto_583820 ?auto_583833 ) ) ( not ( = ?auto_583821 ?auto_583822 ) ) ( not ( = ?auto_583821 ?auto_583823 ) ) ( not ( = ?auto_583821 ?auto_583824 ) ) ( not ( = ?auto_583821 ?auto_583825 ) ) ( not ( = ?auto_583821 ?auto_583826 ) ) ( not ( = ?auto_583821 ?auto_583827 ) ) ( not ( = ?auto_583821 ?auto_583828 ) ) ( not ( = ?auto_583821 ?auto_583829 ) ) ( not ( = ?auto_583821 ?auto_583830 ) ) ( not ( = ?auto_583821 ?auto_583831 ) ) ( not ( = ?auto_583821 ?auto_583832 ) ) ( not ( = ?auto_583821 ?auto_583833 ) ) ( not ( = ?auto_583822 ?auto_583823 ) ) ( not ( = ?auto_583822 ?auto_583824 ) ) ( not ( = ?auto_583822 ?auto_583825 ) ) ( not ( = ?auto_583822 ?auto_583826 ) ) ( not ( = ?auto_583822 ?auto_583827 ) ) ( not ( = ?auto_583822 ?auto_583828 ) ) ( not ( = ?auto_583822 ?auto_583829 ) ) ( not ( = ?auto_583822 ?auto_583830 ) ) ( not ( = ?auto_583822 ?auto_583831 ) ) ( not ( = ?auto_583822 ?auto_583832 ) ) ( not ( = ?auto_583822 ?auto_583833 ) ) ( not ( = ?auto_583823 ?auto_583824 ) ) ( not ( = ?auto_583823 ?auto_583825 ) ) ( not ( = ?auto_583823 ?auto_583826 ) ) ( not ( = ?auto_583823 ?auto_583827 ) ) ( not ( = ?auto_583823 ?auto_583828 ) ) ( not ( = ?auto_583823 ?auto_583829 ) ) ( not ( = ?auto_583823 ?auto_583830 ) ) ( not ( = ?auto_583823 ?auto_583831 ) ) ( not ( = ?auto_583823 ?auto_583832 ) ) ( not ( = ?auto_583823 ?auto_583833 ) ) ( not ( = ?auto_583824 ?auto_583825 ) ) ( not ( = ?auto_583824 ?auto_583826 ) ) ( not ( = ?auto_583824 ?auto_583827 ) ) ( not ( = ?auto_583824 ?auto_583828 ) ) ( not ( = ?auto_583824 ?auto_583829 ) ) ( not ( = ?auto_583824 ?auto_583830 ) ) ( not ( = ?auto_583824 ?auto_583831 ) ) ( not ( = ?auto_583824 ?auto_583832 ) ) ( not ( = ?auto_583824 ?auto_583833 ) ) ( not ( = ?auto_583825 ?auto_583826 ) ) ( not ( = ?auto_583825 ?auto_583827 ) ) ( not ( = ?auto_583825 ?auto_583828 ) ) ( not ( = ?auto_583825 ?auto_583829 ) ) ( not ( = ?auto_583825 ?auto_583830 ) ) ( not ( = ?auto_583825 ?auto_583831 ) ) ( not ( = ?auto_583825 ?auto_583832 ) ) ( not ( = ?auto_583825 ?auto_583833 ) ) ( not ( = ?auto_583826 ?auto_583827 ) ) ( not ( = ?auto_583826 ?auto_583828 ) ) ( not ( = ?auto_583826 ?auto_583829 ) ) ( not ( = ?auto_583826 ?auto_583830 ) ) ( not ( = ?auto_583826 ?auto_583831 ) ) ( not ( = ?auto_583826 ?auto_583832 ) ) ( not ( = ?auto_583826 ?auto_583833 ) ) ( not ( = ?auto_583827 ?auto_583828 ) ) ( not ( = ?auto_583827 ?auto_583829 ) ) ( not ( = ?auto_583827 ?auto_583830 ) ) ( not ( = ?auto_583827 ?auto_583831 ) ) ( not ( = ?auto_583827 ?auto_583832 ) ) ( not ( = ?auto_583827 ?auto_583833 ) ) ( not ( = ?auto_583828 ?auto_583829 ) ) ( not ( = ?auto_583828 ?auto_583830 ) ) ( not ( = ?auto_583828 ?auto_583831 ) ) ( not ( = ?auto_583828 ?auto_583832 ) ) ( not ( = ?auto_583828 ?auto_583833 ) ) ( not ( = ?auto_583829 ?auto_583830 ) ) ( not ( = ?auto_583829 ?auto_583831 ) ) ( not ( = ?auto_583829 ?auto_583832 ) ) ( not ( = ?auto_583829 ?auto_583833 ) ) ( not ( = ?auto_583830 ?auto_583831 ) ) ( not ( = ?auto_583830 ?auto_583832 ) ) ( not ( = ?auto_583830 ?auto_583833 ) ) ( not ( = ?auto_583831 ?auto_583832 ) ) ( not ( = ?auto_583831 ?auto_583833 ) ) ( not ( = ?auto_583832 ?auto_583833 ) ) ( ON ?auto_583832 ?auto_583833 ) ( ON ?auto_583831 ?auto_583832 ) ( ON ?auto_583830 ?auto_583831 ) ( ON ?auto_583829 ?auto_583830 ) ( ON ?auto_583828 ?auto_583829 ) ( ON ?auto_583827 ?auto_583828 ) ( ON ?auto_583826 ?auto_583827 ) ( ON ?auto_583825 ?auto_583826 ) ( ON ?auto_583824 ?auto_583825 ) ( ON ?auto_583823 ?auto_583824 ) ( CLEAR ?auto_583821 ) ( ON ?auto_583822 ?auto_583823 ) ( CLEAR ?auto_583822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_583818 ?auto_583819 ?auto_583820 ?auto_583821 ?auto_583822 )
      ( MAKE-16PILE ?auto_583818 ?auto_583819 ?auto_583820 ?auto_583821 ?auto_583822 ?auto_583823 ?auto_583824 ?auto_583825 ?auto_583826 ?auto_583827 ?auto_583828 ?auto_583829 ?auto_583830 ?auto_583831 ?auto_583832 ?auto_583833 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583850 - BLOCK
      ?auto_583851 - BLOCK
      ?auto_583852 - BLOCK
      ?auto_583853 - BLOCK
      ?auto_583854 - BLOCK
      ?auto_583855 - BLOCK
      ?auto_583856 - BLOCK
      ?auto_583857 - BLOCK
      ?auto_583858 - BLOCK
      ?auto_583859 - BLOCK
      ?auto_583860 - BLOCK
      ?auto_583861 - BLOCK
      ?auto_583862 - BLOCK
      ?auto_583863 - BLOCK
      ?auto_583864 - BLOCK
      ?auto_583865 - BLOCK
    )
    :vars
    (
      ?auto_583866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583865 ?auto_583866 ) ( ON-TABLE ?auto_583850 ) ( ON ?auto_583851 ?auto_583850 ) ( ON ?auto_583852 ?auto_583851 ) ( not ( = ?auto_583850 ?auto_583851 ) ) ( not ( = ?auto_583850 ?auto_583852 ) ) ( not ( = ?auto_583850 ?auto_583853 ) ) ( not ( = ?auto_583850 ?auto_583854 ) ) ( not ( = ?auto_583850 ?auto_583855 ) ) ( not ( = ?auto_583850 ?auto_583856 ) ) ( not ( = ?auto_583850 ?auto_583857 ) ) ( not ( = ?auto_583850 ?auto_583858 ) ) ( not ( = ?auto_583850 ?auto_583859 ) ) ( not ( = ?auto_583850 ?auto_583860 ) ) ( not ( = ?auto_583850 ?auto_583861 ) ) ( not ( = ?auto_583850 ?auto_583862 ) ) ( not ( = ?auto_583850 ?auto_583863 ) ) ( not ( = ?auto_583850 ?auto_583864 ) ) ( not ( = ?auto_583850 ?auto_583865 ) ) ( not ( = ?auto_583850 ?auto_583866 ) ) ( not ( = ?auto_583851 ?auto_583852 ) ) ( not ( = ?auto_583851 ?auto_583853 ) ) ( not ( = ?auto_583851 ?auto_583854 ) ) ( not ( = ?auto_583851 ?auto_583855 ) ) ( not ( = ?auto_583851 ?auto_583856 ) ) ( not ( = ?auto_583851 ?auto_583857 ) ) ( not ( = ?auto_583851 ?auto_583858 ) ) ( not ( = ?auto_583851 ?auto_583859 ) ) ( not ( = ?auto_583851 ?auto_583860 ) ) ( not ( = ?auto_583851 ?auto_583861 ) ) ( not ( = ?auto_583851 ?auto_583862 ) ) ( not ( = ?auto_583851 ?auto_583863 ) ) ( not ( = ?auto_583851 ?auto_583864 ) ) ( not ( = ?auto_583851 ?auto_583865 ) ) ( not ( = ?auto_583851 ?auto_583866 ) ) ( not ( = ?auto_583852 ?auto_583853 ) ) ( not ( = ?auto_583852 ?auto_583854 ) ) ( not ( = ?auto_583852 ?auto_583855 ) ) ( not ( = ?auto_583852 ?auto_583856 ) ) ( not ( = ?auto_583852 ?auto_583857 ) ) ( not ( = ?auto_583852 ?auto_583858 ) ) ( not ( = ?auto_583852 ?auto_583859 ) ) ( not ( = ?auto_583852 ?auto_583860 ) ) ( not ( = ?auto_583852 ?auto_583861 ) ) ( not ( = ?auto_583852 ?auto_583862 ) ) ( not ( = ?auto_583852 ?auto_583863 ) ) ( not ( = ?auto_583852 ?auto_583864 ) ) ( not ( = ?auto_583852 ?auto_583865 ) ) ( not ( = ?auto_583852 ?auto_583866 ) ) ( not ( = ?auto_583853 ?auto_583854 ) ) ( not ( = ?auto_583853 ?auto_583855 ) ) ( not ( = ?auto_583853 ?auto_583856 ) ) ( not ( = ?auto_583853 ?auto_583857 ) ) ( not ( = ?auto_583853 ?auto_583858 ) ) ( not ( = ?auto_583853 ?auto_583859 ) ) ( not ( = ?auto_583853 ?auto_583860 ) ) ( not ( = ?auto_583853 ?auto_583861 ) ) ( not ( = ?auto_583853 ?auto_583862 ) ) ( not ( = ?auto_583853 ?auto_583863 ) ) ( not ( = ?auto_583853 ?auto_583864 ) ) ( not ( = ?auto_583853 ?auto_583865 ) ) ( not ( = ?auto_583853 ?auto_583866 ) ) ( not ( = ?auto_583854 ?auto_583855 ) ) ( not ( = ?auto_583854 ?auto_583856 ) ) ( not ( = ?auto_583854 ?auto_583857 ) ) ( not ( = ?auto_583854 ?auto_583858 ) ) ( not ( = ?auto_583854 ?auto_583859 ) ) ( not ( = ?auto_583854 ?auto_583860 ) ) ( not ( = ?auto_583854 ?auto_583861 ) ) ( not ( = ?auto_583854 ?auto_583862 ) ) ( not ( = ?auto_583854 ?auto_583863 ) ) ( not ( = ?auto_583854 ?auto_583864 ) ) ( not ( = ?auto_583854 ?auto_583865 ) ) ( not ( = ?auto_583854 ?auto_583866 ) ) ( not ( = ?auto_583855 ?auto_583856 ) ) ( not ( = ?auto_583855 ?auto_583857 ) ) ( not ( = ?auto_583855 ?auto_583858 ) ) ( not ( = ?auto_583855 ?auto_583859 ) ) ( not ( = ?auto_583855 ?auto_583860 ) ) ( not ( = ?auto_583855 ?auto_583861 ) ) ( not ( = ?auto_583855 ?auto_583862 ) ) ( not ( = ?auto_583855 ?auto_583863 ) ) ( not ( = ?auto_583855 ?auto_583864 ) ) ( not ( = ?auto_583855 ?auto_583865 ) ) ( not ( = ?auto_583855 ?auto_583866 ) ) ( not ( = ?auto_583856 ?auto_583857 ) ) ( not ( = ?auto_583856 ?auto_583858 ) ) ( not ( = ?auto_583856 ?auto_583859 ) ) ( not ( = ?auto_583856 ?auto_583860 ) ) ( not ( = ?auto_583856 ?auto_583861 ) ) ( not ( = ?auto_583856 ?auto_583862 ) ) ( not ( = ?auto_583856 ?auto_583863 ) ) ( not ( = ?auto_583856 ?auto_583864 ) ) ( not ( = ?auto_583856 ?auto_583865 ) ) ( not ( = ?auto_583856 ?auto_583866 ) ) ( not ( = ?auto_583857 ?auto_583858 ) ) ( not ( = ?auto_583857 ?auto_583859 ) ) ( not ( = ?auto_583857 ?auto_583860 ) ) ( not ( = ?auto_583857 ?auto_583861 ) ) ( not ( = ?auto_583857 ?auto_583862 ) ) ( not ( = ?auto_583857 ?auto_583863 ) ) ( not ( = ?auto_583857 ?auto_583864 ) ) ( not ( = ?auto_583857 ?auto_583865 ) ) ( not ( = ?auto_583857 ?auto_583866 ) ) ( not ( = ?auto_583858 ?auto_583859 ) ) ( not ( = ?auto_583858 ?auto_583860 ) ) ( not ( = ?auto_583858 ?auto_583861 ) ) ( not ( = ?auto_583858 ?auto_583862 ) ) ( not ( = ?auto_583858 ?auto_583863 ) ) ( not ( = ?auto_583858 ?auto_583864 ) ) ( not ( = ?auto_583858 ?auto_583865 ) ) ( not ( = ?auto_583858 ?auto_583866 ) ) ( not ( = ?auto_583859 ?auto_583860 ) ) ( not ( = ?auto_583859 ?auto_583861 ) ) ( not ( = ?auto_583859 ?auto_583862 ) ) ( not ( = ?auto_583859 ?auto_583863 ) ) ( not ( = ?auto_583859 ?auto_583864 ) ) ( not ( = ?auto_583859 ?auto_583865 ) ) ( not ( = ?auto_583859 ?auto_583866 ) ) ( not ( = ?auto_583860 ?auto_583861 ) ) ( not ( = ?auto_583860 ?auto_583862 ) ) ( not ( = ?auto_583860 ?auto_583863 ) ) ( not ( = ?auto_583860 ?auto_583864 ) ) ( not ( = ?auto_583860 ?auto_583865 ) ) ( not ( = ?auto_583860 ?auto_583866 ) ) ( not ( = ?auto_583861 ?auto_583862 ) ) ( not ( = ?auto_583861 ?auto_583863 ) ) ( not ( = ?auto_583861 ?auto_583864 ) ) ( not ( = ?auto_583861 ?auto_583865 ) ) ( not ( = ?auto_583861 ?auto_583866 ) ) ( not ( = ?auto_583862 ?auto_583863 ) ) ( not ( = ?auto_583862 ?auto_583864 ) ) ( not ( = ?auto_583862 ?auto_583865 ) ) ( not ( = ?auto_583862 ?auto_583866 ) ) ( not ( = ?auto_583863 ?auto_583864 ) ) ( not ( = ?auto_583863 ?auto_583865 ) ) ( not ( = ?auto_583863 ?auto_583866 ) ) ( not ( = ?auto_583864 ?auto_583865 ) ) ( not ( = ?auto_583864 ?auto_583866 ) ) ( not ( = ?auto_583865 ?auto_583866 ) ) ( ON ?auto_583864 ?auto_583865 ) ( ON ?auto_583863 ?auto_583864 ) ( ON ?auto_583862 ?auto_583863 ) ( ON ?auto_583861 ?auto_583862 ) ( ON ?auto_583860 ?auto_583861 ) ( ON ?auto_583859 ?auto_583860 ) ( ON ?auto_583858 ?auto_583859 ) ( ON ?auto_583857 ?auto_583858 ) ( ON ?auto_583856 ?auto_583857 ) ( ON ?auto_583855 ?auto_583856 ) ( ON ?auto_583854 ?auto_583855 ) ( CLEAR ?auto_583852 ) ( ON ?auto_583853 ?auto_583854 ) ( CLEAR ?auto_583853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_583850 ?auto_583851 ?auto_583852 ?auto_583853 )
      ( MAKE-16PILE ?auto_583850 ?auto_583851 ?auto_583852 ?auto_583853 ?auto_583854 ?auto_583855 ?auto_583856 ?auto_583857 ?auto_583858 ?auto_583859 ?auto_583860 ?auto_583861 ?auto_583862 ?auto_583863 ?auto_583864 ?auto_583865 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583883 - BLOCK
      ?auto_583884 - BLOCK
      ?auto_583885 - BLOCK
      ?auto_583886 - BLOCK
      ?auto_583887 - BLOCK
      ?auto_583888 - BLOCK
      ?auto_583889 - BLOCK
      ?auto_583890 - BLOCK
      ?auto_583891 - BLOCK
      ?auto_583892 - BLOCK
      ?auto_583893 - BLOCK
      ?auto_583894 - BLOCK
      ?auto_583895 - BLOCK
      ?auto_583896 - BLOCK
      ?auto_583897 - BLOCK
      ?auto_583898 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_583898 ) ( ON-TABLE ?auto_583883 ) ( ON ?auto_583884 ?auto_583883 ) ( ON ?auto_583885 ?auto_583884 ) ( not ( = ?auto_583883 ?auto_583884 ) ) ( not ( = ?auto_583883 ?auto_583885 ) ) ( not ( = ?auto_583883 ?auto_583886 ) ) ( not ( = ?auto_583883 ?auto_583887 ) ) ( not ( = ?auto_583883 ?auto_583888 ) ) ( not ( = ?auto_583883 ?auto_583889 ) ) ( not ( = ?auto_583883 ?auto_583890 ) ) ( not ( = ?auto_583883 ?auto_583891 ) ) ( not ( = ?auto_583883 ?auto_583892 ) ) ( not ( = ?auto_583883 ?auto_583893 ) ) ( not ( = ?auto_583883 ?auto_583894 ) ) ( not ( = ?auto_583883 ?auto_583895 ) ) ( not ( = ?auto_583883 ?auto_583896 ) ) ( not ( = ?auto_583883 ?auto_583897 ) ) ( not ( = ?auto_583883 ?auto_583898 ) ) ( not ( = ?auto_583884 ?auto_583885 ) ) ( not ( = ?auto_583884 ?auto_583886 ) ) ( not ( = ?auto_583884 ?auto_583887 ) ) ( not ( = ?auto_583884 ?auto_583888 ) ) ( not ( = ?auto_583884 ?auto_583889 ) ) ( not ( = ?auto_583884 ?auto_583890 ) ) ( not ( = ?auto_583884 ?auto_583891 ) ) ( not ( = ?auto_583884 ?auto_583892 ) ) ( not ( = ?auto_583884 ?auto_583893 ) ) ( not ( = ?auto_583884 ?auto_583894 ) ) ( not ( = ?auto_583884 ?auto_583895 ) ) ( not ( = ?auto_583884 ?auto_583896 ) ) ( not ( = ?auto_583884 ?auto_583897 ) ) ( not ( = ?auto_583884 ?auto_583898 ) ) ( not ( = ?auto_583885 ?auto_583886 ) ) ( not ( = ?auto_583885 ?auto_583887 ) ) ( not ( = ?auto_583885 ?auto_583888 ) ) ( not ( = ?auto_583885 ?auto_583889 ) ) ( not ( = ?auto_583885 ?auto_583890 ) ) ( not ( = ?auto_583885 ?auto_583891 ) ) ( not ( = ?auto_583885 ?auto_583892 ) ) ( not ( = ?auto_583885 ?auto_583893 ) ) ( not ( = ?auto_583885 ?auto_583894 ) ) ( not ( = ?auto_583885 ?auto_583895 ) ) ( not ( = ?auto_583885 ?auto_583896 ) ) ( not ( = ?auto_583885 ?auto_583897 ) ) ( not ( = ?auto_583885 ?auto_583898 ) ) ( not ( = ?auto_583886 ?auto_583887 ) ) ( not ( = ?auto_583886 ?auto_583888 ) ) ( not ( = ?auto_583886 ?auto_583889 ) ) ( not ( = ?auto_583886 ?auto_583890 ) ) ( not ( = ?auto_583886 ?auto_583891 ) ) ( not ( = ?auto_583886 ?auto_583892 ) ) ( not ( = ?auto_583886 ?auto_583893 ) ) ( not ( = ?auto_583886 ?auto_583894 ) ) ( not ( = ?auto_583886 ?auto_583895 ) ) ( not ( = ?auto_583886 ?auto_583896 ) ) ( not ( = ?auto_583886 ?auto_583897 ) ) ( not ( = ?auto_583886 ?auto_583898 ) ) ( not ( = ?auto_583887 ?auto_583888 ) ) ( not ( = ?auto_583887 ?auto_583889 ) ) ( not ( = ?auto_583887 ?auto_583890 ) ) ( not ( = ?auto_583887 ?auto_583891 ) ) ( not ( = ?auto_583887 ?auto_583892 ) ) ( not ( = ?auto_583887 ?auto_583893 ) ) ( not ( = ?auto_583887 ?auto_583894 ) ) ( not ( = ?auto_583887 ?auto_583895 ) ) ( not ( = ?auto_583887 ?auto_583896 ) ) ( not ( = ?auto_583887 ?auto_583897 ) ) ( not ( = ?auto_583887 ?auto_583898 ) ) ( not ( = ?auto_583888 ?auto_583889 ) ) ( not ( = ?auto_583888 ?auto_583890 ) ) ( not ( = ?auto_583888 ?auto_583891 ) ) ( not ( = ?auto_583888 ?auto_583892 ) ) ( not ( = ?auto_583888 ?auto_583893 ) ) ( not ( = ?auto_583888 ?auto_583894 ) ) ( not ( = ?auto_583888 ?auto_583895 ) ) ( not ( = ?auto_583888 ?auto_583896 ) ) ( not ( = ?auto_583888 ?auto_583897 ) ) ( not ( = ?auto_583888 ?auto_583898 ) ) ( not ( = ?auto_583889 ?auto_583890 ) ) ( not ( = ?auto_583889 ?auto_583891 ) ) ( not ( = ?auto_583889 ?auto_583892 ) ) ( not ( = ?auto_583889 ?auto_583893 ) ) ( not ( = ?auto_583889 ?auto_583894 ) ) ( not ( = ?auto_583889 ?auto_583895 ) ) ( not ( = ?auto_583889 ?auto_583896 ) ) ( not ( = ?auto_583889 ?auto_583897 ) ) ( not ( = ?auto_583889 ?auto_583898 ) ) ( not ( = ?auto_583890 ?auto_583891 ) ) ( not ( = ?auto_583890 ?auto_583892 ) ) ( not ( = ?auto_583890 ?auto_583893 ) ) ( not ( = ?auto_583890 ?auto_583894 ) ) ( not ( = ?auto_583890 ?auto_583895 ) ) ( not ( = ?auto_583890 ?auto_583896 ) ) ( not ( = ?auto_583890 ?auto_583897 ) ) ( not ( = ?auto_583890 ?auto_583898 ) ) ( not ( = ?auto_583891 ?auto_583892 ) ) ( not ( = ?auto_583891 ?auto_583893 ) ) ( not ( = ?auto_583891 ?auto_583894 ) ) ( not ( = ?auto_583891 ?auto_583895 ) ) ( not ( = ?auto_583891 ?auto_583896 ) ) ( not ( = ?auto_583891 ?auto_583897 ) ) ( not ( = ?auto_583891 ?auto_583898 ) ) ( not ( = ?auto_583892 ?auto_583893 ) ) ( not ( = ?auto_583892 ?auto_583894 ) ) ( not ( = ?auto_583892 ?auto_583895 ) ) ( not ( = ?auto_583892 ?auto_583896 ) ) ( not ( = ?auto_583892 ?auto_583897 ) ) ( not ( = ?auto_583892 ?auto_583898 ) ) ( not ( = ?auto_583893 ?auto_583894 ) ) ( not ( = ?auto_583893 ?auto_583895 ) ) ( not ( = ?auto_583893 ?auto_583896 ) ) ( not ( = ?auto_583893 ?auto_583897 ) ) ( not ( = ?auto_583893 ?auto_583898 ) ) ( not ( = ?auto_583894 ?auto_583895 ) ) ( not ( = ?auto_583894 ?auto_583896 ) ) ( not ( = ?auto_583894 ?auto_583897 ) ) ( not ( = ?auto_583894 ?auto_583898 ) ) ( not ( = ?auto_583895 ?auto_583896 ) ) ( not ( = ?auto_583895 ?auto_583897 ) ) ( not ( = ?auto_583895 ?auto_583898 ) ) ( not ( = ?auto_583896 ?auto_583897 ) ) ( not ( = ?auto_583896 ?auto_583898 ) ) ( not ( = ?auto_583897 ?auto_583898 ) ) ( ON ?auto_583897 ?auto_583898 ) ( ON ?auto_583896 ?auto_583897 ) ( ON ?auto_583895 ?auto_583896 ) ( ON ?auto_583894 ?auto_583895 ) ( ON ?auto_583893 ?auto_583894 ) ( ON ?auto_583892 ?auto_583893 ) ( ON ?auto_583891 ?auto_583892 ) ( ON ?auto_583890 ?auto_583891 ) ( ON ?auto_583889 ?auto_583890 ) ( ON ?auto_583888 ?auto_583889 ) ( ON ?auto_583887 ?auto_583888 ) ( CLEAR ?auto_583885 ) ( ON ?auto_583886 ?auto_583887 ) ( CLEAR ?auto_583886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_583883 ?auto_583884 ?auto_583885 ?auto_583886 )
      ( MAKE-16PILE ?auto_583883 ?auto_583884 ?auto_583885 ?auto_583886 ?auto_583887 ?auto_583888 ?auto_583889 ?auto_583890 ?auto_583891 ?auto_583892 ?auto_583893 ?auto_583894 ?auto_583895 ?auto_583896 ?auto_583897 ?auto_583898 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583915 - BLOCK
      ?auto_583916 - BLOCK
      ?auto_583917 - BLOCK
      ?auto_583918 - BLOCK
      ?auto_583919 - BLOCK
      ?auto_583920 - BLOCK
      ?auto_583921 - BLOCK
      ?auto_583922 - BLOCK
      ?auto_583923 - BLOCK
      ?auto_583924 - BLOCK
      ?auto_583925 - BLOCK
      ?auto_583926 - BLOCK
      ?auto_583927 - BLOCK
      ?auto_583928 - BLOCK
      ?auto_583929 - BLOCK
      ?auto_583930 - BLOCK
    )
    :vars
    (
      ?auto_583931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583930 ?auto_583931 ) ( ON-TABLE ?auto_583915 ) ( ON ?auto_583916 ?auto_583915 ) ( not ( = ?auto_583915 ?auto_583916 ) ) ( not ( = ?auto_583915 ?auto_583917 ) ) ( not ( = ?auto_583915 ?auto_583918 ) ) ( not ( = ?auto_583915 ?auto_583919 ) ) ( not ( = ?auto_583915 ?auto_583920 ) ) ( not ( = ?auto_583915 ?auto_583921 ) ) ( not ( = ?auto_583915 ?auto_583922 ) ) ( not ( = ?auto_583915 ?auto_583923 ) ) ( not ( = ?auto_583915 ?auto_583924 ) ) ( not ( = ?auto_583915 ?auto_583925 ) ) ( not ( = ?auto_583915 ?auto_583926 ) ) ( not ( = ?auto_583915 ?auto_583927 ) ) ( not ( = ?auto_583915 ?auto_583928 ) ) ( not ( = ?auto_583915 ?auto_583929 ) ) ( not ( = ?auto_583915 ?auto_583930 ) ) ( not ( = ?auto_583915 ?auto_583931 ) ) ( not ( = ?auto_583916 ?auto_583917 ) ) ( not ( = ?auto_583916 ?auto_583918 ) ) ( not ( = ?auto_583916 ?auto_583919 ) ) ( not ( = ?auto_583916 ?auto_583920 ) ) ( not ( = ?auto_583916 ?auto_583921 ) ) ( not ( = ?auto_583916 ?auto_583922 ) ) ( not ( = ?auto_583916 ?auto_583923 ) ) ( not ( = ?auto_583916 ?auto_583924 ) ) ( not ( = ?auto_583916 ?auto_583925 ) ) ( not ( = ?auto_583916 ?auto_583926 ) ) ( not ( = ?auto_583916 ?auto_583927 ) ) ( not ( = ?auto_583916 ?auto_583928 ) ) ( not ( = ?auto_583916 ?auto_583929 ) ) ( not ( = ?auto_583916 ?auto_583930 ) ) ( not ( = ?auto_583916 ?auto_583931 ) ) ( not ( = ?auto_583917 ?auto_583918 ) ) ( not ( = ?auto_583917 ?auto_583919 ) ) ( not ( = ?auto_583917 ?auto_583920 ) ) ( not ( = ?auto_583917 ?auto_583921 ) ) ( not ( = ?auto_583917 ?auto_583922 ) ) ( not ( = ?auto_583917 ?auto_583923 ) ) ( not ( = ?auto_583917 ?auto_583924 ) ) ( not ( = ?auto_583917 ?auto_583925 ) ) ( not ( = ?auto_583917 ?auto_583926 ) ) ( not ( = ?auto_583917 ?auto_583927 ) ) ( not ( = ?auto_583917 ?auto_583928 ) ) ( not ( = ?auto_583917 ?auto_583929 ) ) ( not ( = ?auto_583917 ?auto_583930 ) ) ( not ( = ?auto_583917 ?auto_583931 ) ) ( not ( = ?auto_583918 ?auto_583919 ) ) ( not ( = ?auto_583918 ?auto_583920 ) ) ( not ( = ?auto_583918 ?auto_583921 ) ) ( not ( = ?auto_583918 ?auto_583922 ) ) ( not ( = ?auto_583918 ?auto_583923 ) ) ( not ( = ?auto_583918 ?auto_583924 ) ) ( not ( = ?auto_583918 ?auto_583925 ) ) ( not ( = ?auto_583918 ?auto_583926 ) ) ( not ( = ?auto_583918 ?auto_583927 ) ) ( not ( = ?auto_583918 ?auto_583928 ) ) ( not ( = ?auto_583918 ?auto_583929 ) ) ( not ( = ?auto_583918 ?auto_583930 ) ) ( not ( = ?auto_583918 ?auto_583931 ) ) ( not ( = ?auto_583919 ?auto_583920 ) ) ( not ( = ?auto_583919 ?auto_583921 ) ) ( not ( = ?auto_583919 ?auto_583922 ) ) ( not ( = ?auto_583919 ?auto_583923 ) ) ( not ( = ?auto_583919 ?auto_583924 ) ) ( not ( = ?auto_583919 ?auto_583925 ) ) ( not ( = ?auto_583919 ?auto_583926 ) ) ( not ( = ?auto_583919 ?auto_583927 ) ) ( not ( = ?auto_583919 ?auto_583928 ) ) ( not ( = ?auto_583919 ?auto_583929 ) ) ( not ( = ?auto_583919 ?auto_583930 ) ) ( not ( = ?auto_583919 ?auto_583931 ) ) ( not ( = ?auto_583920 ?auto_583921 ) ) ( not ( = ?auto_583920 ?auto_583922 ) ) ( not ( = ?auto_583920 ?auto_583923 ) ) ( not ( = ?auto_583920 ?auto_583924 ) ) ( not ( = ?auto_583920 ?auto_583925 ) ) ( not ( = ?auto_583920 ?auto_583926 ) ) ( not ( = ?auto_583920 ?auto_583927 ) ) ( not ( = ?auto_583920 ?auto_583928 ) ) ( not ( = ?auto_583920 ?auto_583929 ) ) ( not ( = ?auto_583920 ?auto_583930 ) ) ( not ( = ?auto_583920 ?auto_583931 ) ) ( not ( = ?auto_583921 ?auto_583922 ) ) ( not ( = ?auto_583921 ?auto_583923 ) ) ( not ( = ?auto_583921 ?auto_583924 ) ) ( not ( = ?auto_583921 ?auto_583925 ) ) ( not ( = ?auto_583921 ?auto_583926 ) ) ( not ( = ?auto_583921 ?auto_583927 ) ) ( not ( = ?auto_583921 ?auto_583928 ) ) ( not ( = ?auto_583921 ?auto_583929 ) ) ( not ( = ?auto_583921 ?auto_583930 ) ) ( not ( = ?auto_583921 ?auto_583931 ) ) ( not ( = ?auto_583922 ?auto_583923 ) ) ( not ( = ?auto_583922 ?auto_583924 ) ) ( not ( = ?auto_583922 ?auto_583925 ) ) ( not ( = ?auto_583922 ?auto_583926 ) ) ( not ( = ?auto_583922 ?auto_583927 ) ) ( not ( = ?auto_583922 ?auto_583928 ) ) ( not ( = ?auto_583922 ?auto_583929 ) ) ( not ( = ?auto_583922 ?auto_583930 ) ) ( not ( = ?auto_583922 ?auto_583931 ) ) ( not ( = ?auto_583923 ?auto_583924 ) ) ( not ( = ?auto_583923 ?auto_583925 ) ) ( not ( = ?auto_583923 ?auto_583926 ) ) ( not ( = ?auto_583923 ?auto_583927 ) ) ( not ( = ?auto_583923 ?auto_583928 ) ) ( not ( = ?auto_583923 ?auto_583929 ) ) ( not ( = ?auto_583923 ?auto_583930 ) ) ( not ( = ?auto_583923 ?auto_583931 ) ) ( not ( = ?auto_583924 ?auto_583925 ) ) ( not ( = ?auto_583924 ?auto_583926 ) ) ( not ( = ?auto_583924 ?auto_583927 ) ) ( not ( = ?auto_583924 ?auto_583928 ) ) ( not ( = ?auto_583924 ?auto_583929 ) ) ( not ( = ?auto_583924 ?auto_583930 ) ) ( not ( = ?auto_583924 ?auto_583931 ) ) ( not ( = ?auto_583925 ?auto_583926 ) ) ( not ( = ?auto_583925 ?auto_583927 ) ) ( not ( = ?auto_583925 ?auto_583928 ) ) ( not ( = ?auto_583925 ?auto_583929 ) ) ( not ( = ?auto_583925 ?auto_583930 ) ) ( not ( = ?auto_583925 ?auto_583931 ) ) ( not ( = ?auto_583926 ?auto_583927 ) ) ( not ( = ?auto_583926 ?auto_583928 ) ) ( not ( = ?auto_583926 ?auto_583929 ) ) ( not ( = ?auto_583926 ?auto_583930 ) ) ( not ( = ?auto_583926 ?auto_583931 ) ) ( not ( = ?auto_583927 ?auto_583928 ) ) ( not ( = ?auto_583927 ?auto_583929 ) ) ( not ( = ?auto_583927 ?auto_583930 ) ) ( not ( = ?auto_583927 ?auto_583931 ) ) ( not ( = ?auto_583928 ?auto_583929 ) ) ( not ( = ?auto_583928 ?auto_583930 ) ) ( not ( = ?auto_583928 ?auto_583931 ) ) ( not ( = ?auto_583929 ?auto_583930 ) ) ( not ( = ?auto_583929 ?auto_583931 ) ) ( not ( = ?auto_583930 ?auto_583931 ) ) ( ON ?auto_583929 ?auto_583930 ) ( ON ?auto_583928 ?auto_583929 ) ( ON ?auto_583927 ?auto_583928 ) ( ON ?auto_583926 ?auto_583927 ) ( ON ?auto_583925 ?auto_583926 ) ( ON ?auto_583924 ?auto_583925 ) ( ON ?auto_583923 ?auto_583924 ) ( ON ?auto_583922 ?auto_583923 ) ( ON ?auto_583921 ?auto_583922 ) ( ON ?auto_583920 ?auto_583921 ) ( ON ?auto_583919 ?auto_583920 ) ( ON ?auto_583918 ?auto_583919 ) ( CLEAR ?auto_583916 ) ( ON ?auto_583917 ?auto_583918 ) ( CLEAR ?auto_583917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_583915 ?auto_583916 ?auto_583917 )
      ( MAKE-16PILE ?auto_583915 ?auto_583916 ?auto_583917 ?auto_583918 ?auto_583919 ?auto_583920 ?auto_583921 ?auto_583922 ?auto_583923 ?auto_583924 ?auto_583925 ?auto_583926 ?auto_583927 ?auto_583928 ?auto_583929 ?auto_583930 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583948 - BLOCK
      ?auto_583949 - BLOCK
      ?auto_583950 - BLOCK
      ?auto_583951 - BLOCK
      ?auto_583952 - BLOCK
      ?auto_583953 - BLOCK
      ?auto_583954 - BLOCK
      ?auto_583955 - BLOCK
      ?auto_583956 - BLOCK
      ?auto_583957 - BLOCK
      ?auto_583958 - BLOCK
      ?auto_583959 - BLOCK
      ?auto_583960 - BLOCK
      ?auto_583961 - BLOCK
      ?auto_583962 - BLOCK
      ?auto_583963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_583963 ) ( ON-TABLE ?auto_583948 ) ( ON ?auto_583949 ?auto_583948 ) ( not ( = ?auto_583948 ?auto_583949 ) ) ( not ( = ?auto_583948 ?auto_583950 ) ) ( not ( = ?auto_583948 ?auto_583951 ) ) ( not ( = ?auto_583948 ?auto_583952 ) ) ( not ( = ?auto_583948 ?auto_583953 ) ) ( not ( = ?auto_583948 ?auto_583954 ) ) ( not ( = ?auto_583948 ?auto_583955 ) ) ( not ( = ?auto_583948 ?auto_583956 ) ) ( not ( = ?auto_583948 ?auto_583957 ) ) ( not ( = ?auto_583948 ?auto_583958 ) ) ( not ( = ?auto_583948 ?auto_583959 ) ) ( not ( = ?auto_583948 ?auto_583960 ) ) ( not ( = ?auto_583948 ?auto_583961 ) ) ( not ( = ?auto_583948 ?auto_583962 ) ) ( not ( = ?auto_583948 ?auto_583963 ) ) ( not ( = ?auto_583949 ?auto_583950 ) ) ( not ( = ?auto_583949 ?auto_583951 ) ) ( not ( = ?auto_583949 ?auto_583952 ) ) ( not ( = ?auto_583949 ?auto_583953 ) ) ( not ( = ?auto_583949 ?auto_583954 ) ) ( not ( = ?auto_583949 ?auto_583955 ) ) ( not ( = ?auto_583949 ?auto_583956 ) ) ( not ( = ?auto_583949 ?auto_583957 ) ) ( not ( = ?auto_583949 ?auto_583958 ) ) ( not ( = ?auto_583949 ?auto_583959 ) ) ( not ( = ?auto_583949 ?auto_583960 ) ) ( not ( = ?auto_583949 ?auto_583961 ) ) ( not ( = ?auto_583949 ?auto_583962 ) ) ( not ( = ?auto_583949 ?auto_583963 ) ) ( not ( = ?auto_583950 ?auto_583951 ) ) ( not ( = ?auto_583950 ?auto_583952 ) ) ( not ( = ?auto_583950 ?auto_583953 ) ) ( not ( = ?auto_583950 ?auto_583954 ) ) ( not ( = ?auto_583950 ?auto_583955 ) ) ( not ( = ?auto_583950 ?auto_583956 ) ) ( not ( = ?auto_583950 ?auto_583957 ) ) ( not ( = ?auto_583950 ?auto_583958 ) ) ( not ( = ?auto_583950 ?auto_583959 ) ) ( not ( = ?auto_583950 ?auto_583960 ) ) ( not ( = ?auto_583950 ?auto_583961 ) ) ( not ( = ?auto_583950 ?auto_583962 ) ) ( not ( = ?auto_583950 ?auto_583963 ) ) ( not ( = ?auto_583951 ?auto_583952 ) ) ( not ( = ?auto_583951 ?auto_583953 ) ) ( not ( = ?auto_583951 ?auto_583954 ) ) ( not ( = ?auto_583951 ?auto_583955 ) ) ( not ( = ?auto_583951 ?auto_583956 ) ) ( not ( = ?auto_583951 ?auto_583957 ) ) ( not ( = ?auto_583951 ?auto_583958 ) ) ( not ( = ?auto_583951 ?auto_583959 ) ) ( not ( = ?auto_583951 ?auto_583960 ) ) ( not ( = ?auto_583951 ?auto_583961 ) ) ( not ( = ?auto_583951 ?auto_583962 ) ) ( not ( = ?auto_583951 ?auto_583963 ) ) ( not ( = ?auto_583952 ?auto_583953 ) ) ( not ( = ?auto_583952 ?auto_583954 ) ) ( not ( = ?auto_583952 ?auto_583955 ) ) ( not ( = ?auto_583952 ?auto_583956 ) ) ( not ( = ?auto_583952 ?auto_583957 ) ) ( not ( = ?auto_583952 ?auto_583958 ) ) ( not ( = ?auto_583952 ?auto_583959 ) ) ( not ( = ?auto_583952 ?auto_583960 ) ) ( not ( = ?auto_583952 ?auto_583961 ) ) ( not ( = ?auto_583952 ?auto_583962 ) ) ( not ( = ?auto_583952 ?auto_583963 ) ) ( not ( = ?auto_583953 ?auto_583954 ) ) ( not ( = ?auto_583953 ?auto_583955 ) ) ( not ( = ?auto_583953 ?auto_583956 ) ) ( not ( = ?auto_583953 ?auto_583957 ) ) ( not ( = ?auto_583953 ?auto_583958 ) ) ( not ( = ?auto_583953 ?auto_583959 ) ) ( not ( = ?auto_583953 ?auto_583960 ) ) ( not ( = ?auto_583953 ?auto_583961 ) ) ( not ( = ?auto_583953 ?auto_583962 ) ) ( not ( = ?auto_583953 ?auto_583963 ) ) ( not ( = ?auto_583954 ?auto_583955 ) ) ( not ( = ?auto_583954 ?auto_583956 ) ) ( not ( = ?auto_583954 ?auto_583957 ) ) ( not ( = ?auto_583954 ?auto_583958 ) ) ( not ( = ?auto_583954 ?auto_583959 ) ) ( not ( = ?auto_583954 ?auto_583960 ) ) ( not ( = ?auto_583954 ?auto_583961 ) ) ( not ( = ?auto_583954 ?auto_583962 ) ) ( not ( = ?auto_583954 ?auto_583963 ) ) ( not ( = ?auto_583955 ?auto_583956 ) ) ( not ( = ?auto_583955 ?auto_583957 ) ) ( not ( = ?auto_583955 ?auto_583958 ) ) ( not ( = ?auto_583955 ?auto_583959 ) ) ( not ( = ?auto_583955 ?auto_583960 ) ) ( not ( = ?auto_583955 ?auto_583961 ) ) ( not ( = ?auto_583955 ?auto_583962 ) ) ( not ( = ?auto_583955 ?auto_583963 ) ) ( not ( = ?auto_583956 ?auto_583957 ) ) ( not ( = ?auto_583956 ?auto_583958 ) ) ( not ( = ?auto_583956 ?auto_583959 ) ) ( not ( = ?auto_583956 ?auto_583960 ) ) ( not ( = ?auto_583956 ?auto_583961 ) ) ( not ( = ?auto_583956 ?auto_583962 ) ) ( not ( = ?auto_583956 ?auto_583963 ) ) ( not ( = ?auto_583957 ?auto_583958 ) ) ( not ( = ?auto_583957 ?auto_583959 ) ) ( not ( = ?auto_583957 ?auto_583960 ) ) ( not ( = ?auto_583957 ?auto_583961 ) ) ( not ( = ?auto_583957 ?auto_583962 ) ) ( not ( = ?auto_583957 ?auto_583963 ) ) ( not ( = ?auto_583958 ?auto_583959 ) ) ( not ( = ?auto_583958 ?auto_583960 ) ) ( not ( = ?auto_583958 ?auto_583961 ) ) ( not ( = ?auto_583958 ?auto_583962 ) ) ( not ( = ?auto_583958 ?auto_583963 ) ) ( not ( = ?auto_583959 ?auto_583960 ) ) ( not ( = ?auto_583959 ?auto_583961 ) ) ( not ( = ?auto_583959 ?auto_583962 ) ) ( not ( = ?auto_583959 ?auto_583963 ) ) ( not ( = ?auto_583960 ?auto_583961 ) ) ( not ( = ?auto_583960 ?auto_583962 ) ) ( not ( = ?auto_583960 ?auto_583963 ) ) ( not ( = ?auto_583961 ?auto_583962 ) ) ( not ( = ?auto_583961 ?auto_583963 ) ) ( not ( = ?auto_583962 ?auto_583963 ) ) ( ON ?auto_583962 ?auto_583963 ) ( ON ?auto_583961 ?auto_583962 ) ( ON ?auto_583960 ?auto_583961 ) ( ON ?auto_583959 ?auto_583960 ) ( ON ?auto_583958 ?auto_583959 ) ( ON ?auto_583957 ?auto_583958 ) ( ON ?auto_583956 ?auto_583957 ) ( ON ?auto_583955 ?auto_583956 ) ( ON ?auto_583954 ?auto_583955 ) ( ON ?auto_583953 ?auto_583954 ) ( ON ?auto_583952 ?auto_583953 ) ( ON ?auto_583951 ?auto_583952 ) ( CLEAR ?auto_583949 ) ( ON ?auto_583950 ?auto_583951 ) ( CLEAR ?auto_583950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_583948 ?auto_583949 ?auto_583950 )
      ( MAKE-16PILE ?auto_583948 ?auto_583949 ?auto_583950 ?auto_583951 ?auto_583952 ?auto_583953 ?auto_583954 ?auto_583955 ?auto_583956 ?auto_583957 ?auto_583958 ?auto_583959 ?auto_583960 ?auto_583961 ?auto_583962 ?auto_583963 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_583980 - BLOCK
      ?auto_583981 - BLOCK
      ?auto_583982 - BLOCK
      ?auto_583983 - BLOCK
      ?auto_583984 - BLOCK
      ?auto_583985 - BLOCK
      ?auto_583986 - BLOCK
      ?auto_583987 - BLOCK
      ?auto_583988 - BLOCK
      ?auto_583989 - BLOCK
      ?auto_583990 - BLOCK
      ?auto_583991 - BLOCK
      ?auto_583992 - BLOCK
      ?auto_583993 - BLOCK
      ?auto_583994 - BLOCK
      ?auto_583995 - BLOCK
    )
    :vars
    (
      ?auto_583996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_583995 ?auto_583996 ) ( ON-TABLE ?auto_583980 ) ( not ( = ?auto_583980 ?auto_583981 ) ) ( not ( = ?auto_583980 ?auto_583982 ) ) ( not ( = ?auto_583980 ?auto_583983 ) ) ( not ( = ?auto_583980 ?auto_583984 ) ) ( not ( = ?auto_583980 ?auto_583985 ) ) ( not ( = ?auto_583980 ?auto_583986 ) ) ( not ( = ?auto_583980 ?auto_583987 ) ) ( not ( = ?auto_583980 ?auto_583988 ) ) ( not ( = ?auto_583980 ?auto_583989 ) ) ( not ( = ?auto_583980 ?auto_583990 ) ) ( not ( = ?auto_583980 ?auto_583991 ) ) ( not ( = ?auto_583980 ?auto_583992 ) ) ( not ( = ?auto_583980 ?auto_583993 ) ) ( not ( = ?auto_583980 ?auto_583994 ) ) ( not ( = ?auto_583980 ?auto_583995 ) ) ( not ( = ?auto_583980 ?auto_583996 ) ) ( not ( = ?auto_583981 ?auto_583982 ) ) ( not ( = ?auto_583981 ?auto_583983 ) ) ( not ( = ?auto_583981 ?auto_583984 ) ) ( not ( = ?auto_583981 ?auto_583985 ) ) ( not ( = ?auto_583981 ?auto_583986 ) ) ( not ( = ?auto_583981 ?auto_583987 ) ) ( not ( = ?auto_583981 ?auto_583988 ) ) ( not ( = ?auto_583981 ?auto_583989 ) ) ( not ( = ?auto_583981 ?auto_583990 ) ) ( not ( = ?auto_583981 ?auto_583991 ) ) ( not ( = ?auto_583981 ?auto_583992 ) ) ( not ( = ?auto_583981 ?auto_583993 ) ) ( not ( = ?auto_583981 ?auto_583994 ) ) ( not ( = ?auto_583981 ?auto_583995 ) ) ( not ( = ?auto_583981 ?auto_583996 ) ) ( not ( = ?auto_583982 ?auto_583983 ) ) ( not ( = ?auto_583982 ?auto_583984 ) ) ( not ( = ?auto_583982 ?auto_583985 ) ) ( not ( = ?auto_583982 ?auto_583986 ) ) ( not ( = ?auto_583982 ?auto_583987 ) ) ( not ( = ?auto_583982 ?auto_583988 ) ) ( not ( = ?auto_583982 ?auto_583989 ) ) ( not ( = ?auto_583982 ?auto_583990 ) ) ( not ( = ?auto_583982 ?auto_583991 ) ) ( not ( = ?auto_583982 ?auto_583992 ) ) ( not ( = ?auto_583982 ?auto_583993 ) ) ( not ( = ?auto_583982 ?auto_583994 ) ) ( not ( = ?auto_583982 ?auto_583995 ) ) ( not ( = ?auto_583982 ?auto_583996 ) ) ( not ( = ?auto_583983 ?auto_583984 ) ) ( not ( = ?auto_583983 ?auto_583985 ) ) ( not ( = ?auto_583983 ?auto_583986 ) ) ( not ( = ?auto_583983 ?auto_583987 ) ) ( not ( = ?auto_583983 ?auto_583988 ) ) ( not ( = ?auto_583983 ?auto_583989 ) ) ( not ( = ?auto_583983 ?auto_583990 ) ) ( not ( = ?auto_583983 ?auto_583991 ) ) ( not ( = ?auto_583983 ?auto_583992 ) ) ( not ( = ?auto_583983 ?auto_583993 ) ) ( not ( = ?auto_583983 ?auto_583994 ) ) ( not ( = ?auto_583983 ?auto_583995 ) ) ( not ( = ?auto_583983 ?auto_583996 ) ) ( not ( = ?auto_583984 ?auto_583985 ) ) ( not ( = ?auto_583984 ?auto_583986 ) ) ( not ( = ?auto_583984 ?auto_583987 ) ) ( not ( = ?auto_583984 ?auto_583988 ) ) ( not ( = ?auto_583984 ?auto_583989 ) ) ( not ( = ?auto_583984 ?auto_583990 ) ) ( not ( = ?auto_583984 ?auto_583991 ) ) ( not ( = ?auto_583984 ?auto_583992 ) ) ( not ( = ?auto_583984 ?auto_583993 ) ) ( not ( = ?auto_583984 ?auto_583994 ) ) ( not ( = ?auto_583984 ?auto_583995 ) ) ( not ( = ?auto_583984 ?auto_583996 ) ) ( not ( = ?auto_583985 ?auto_583986 ) ) ( not ( = ?auto_583985 ?auto_583987 ) ) ( not ( = ?auto_583985 ?auto_583988 ) ) ( not ( = ?auto_583985 ?auto_583989 ) ) ( not ( = ?auto_583985 ?auto_583990 ) ) ( not ( = ?auto_583985 ?auto_583991 ) ) ( not ( = ?auto_583985 ?auto_583992 ) ) ( not ( = ?auto_583985 ?auto_583993 ) ) ( not ( = ?auto_583985 ?auto_583994 ) ) ( not ( = ?auto_583985 ?auto_583995 ) ) ( not ( = ?auto_583985 ?auto_583996 ) ) ( not ( = ?auto_583986 ?auto_583987 ) ) ( not ( = ?auto_583986 ?auto_583988 ) ) ( not ( = ?auto_583986 ?auto_583989 ) ) ( not ( = ?auto_583986 ?auto_583990 ) ) ( not ( = ?auto_583986 ?auto_583991 ) ) ( not ( = ?auto_583986 ?auto_583992 ) ) ( not ( = ?auto_583986 ?auto_583993 ) ) ( not ( = ?auto_583986 ?auto_583994 ) ) ( not ( = ?auto_583986 ?auto_583995 ) ) ( not ( = ?auto_583986 ?auto_583996 ) ) ( not ( = ?auto_583987 ?auto_583988 ) ) ( not ( = ?auto_583987 ?auto_583989 ) ) ( not ( = ?auto_583987 ?auto_583990 ) ) ( not ( = ?auto_583987 ?auto_583991 ) ) ( not ( = ?auto_583987 ?auto_583992 ) ) ( not ( = ?auto_583987 ?auto_583993 ) ) ( not ( = ?auto_583987 ?auto_583994 ) ) ( not ( = ?auto_583987 ?auto_583995 ) ) ( not ( = ?auto_583987 ?auto_583996 ) ) ( not ( = ?auto_583988 ?auto_583989 ) ) ( not ( = ?auto_583988 ?auto_583990 ) ) ( not ( = ?auto_583988 ?auto_583991 ) ) ( not ( = ?auto_583988 ?auto_583992 ) ) ( not ( = ?auto_583988 ?auto_583993 ) ) ( not ( = ?auto_583988 ?auto_583994 ) ) ( not ( = ?auto_583988 ?auto_583995 ) ) ( not ( = ?auto_583988 ?auto_583996 ) ) ( not ( = ?auto_583989 ?auto_583990 ) ) ( not ( = ?auto_583989 ?auto_583991 ) ) ( not ( = ?auto_583989 ?auto_583992 ) ) ( not ( = ?auto_583989 ?auto_583993 ) ) ( not ( = ?auto_583989 ?auto_583994 ) ) ( not ( = ?auto_583989 ?auto_583995 ) ) ( not ( = ?auto_583989 ?auto_583996 ) ) ( not ( = ?auto_583990 ?auto_583991 ) ) ( not ( = ?auto_583990 ?auto_583992 ) ) ( not ( = ?auto_583990 ?auto_583993 ) ) ( not ( = ?auto_583990 ?auto_583994 ) ) ( not ( = ?auto_583990 ?auto_583995 ) ) ( not ( = ?auto_583990 ?auto_583996 ) ) ( not ( = ?auto_583991 ?auto_583992 ) ) ( not ( = ?auto_583991 ?auto_583993 ) ) ( not ( = ?auto_583991 ?auto_583994 ) ) ( not ( = ?auto_583991 ?auto_583995 ) ) ( not ( = ?auto_583991 ?auto_583996 ) ) ( not ( = ?auto_583992 ?auto_583993 ) ) ( not ( = ?auto_583992 ?auto_583994 ) ) ( not ( = ?auto_583992 ?auto_583995 ) ) ( not ( = ?auto_583992 ?auto_583996 ) ) ( not ( = ?auto_583993 ?auto_583994 ) ) ( not ( = ?auto_583993 ?auto_583995 ) ) ( not ( = ?auto_583993 ?auto_583996 ) ) ( not ( = ?auto_583994 ?auto_583995 ) ) ( not ( = ?auto_583994 ?auto_583996 ) ) ( not ( = ?auto_583995 ?auto_583996 ) ) ( ON ?auto_583994 ?auto_583995 ) ( ON ?auto_583993 ?auto_583994 ) ( ON ?auto_583992 ?auto_583993 ) ( ON ?auto_583991 ?auto_583992 ) ( ON ?auto_583990 ?auto_583991 ) ( ON ?auto_583989 ?auto_583990 ) ( ON ?auto_583988 ?auto_583989 ) ( ON ?auto_583987 ?auto_583988 ) ( ON ?auto_583986 ?auto_583987 ) ( ON ?auto_583985 ?auto_583986 ) ( ON ?auto_583984 ?auto_583985 ) ( ON ?auto_583983 ?auto_583984 ) ( ON ?auto_583982 ?auto_583983 ) ( CLEAR ?auto_583980 ) ( ON ?auto_583981 ?auto_583982 ) ( CLEAR ?auto_583981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_583980 ?auto_583981 )
      ( MAKE-16PILE ?auto_583980 ?auto_583981 ?auto_583982 ?auto_583983 ?auto_583984 ?auto_583985 ?auto_583986 ?auto_583987 ?auto_583988 ?auto_583989 ?auto_583990 ?auto_583991 ?auto_583992 ?auto_583993 ?auto_583994 ?auto_583995 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_584013 - BLOCK
      ?auto_584014 - BLOCK
      ?auto_584015 - BLOCK
      ?auto_584016 - BLOCK
      ?auto_584017 - BLOCK
      ?auto_584018 - BLOCK
      ?auto_584019 - BLOCK
      ?auto_584020 - BLOCK
      ?auto_584021 - BLOCK
      ?auto_584022 - BLOCK
      ?auto_584023 - BLOCK
      ?auto_584024 - BLOCK
      ?auto_584025 - BLOCK
      ?auto_584026 - BLOCK
      ?auto_584027 - BLOCK
      ?auto_584028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_584028 ) ( ON-TABLE ?auto_584013 ) ( not ( = ?auto_584013 ?auto_584014 ) ) ( not ( = ?auto_584013 ?auto_584015 ) ) ( not ( = ?auto_584013 ?auto_584016 ) ) ( not ( = ?auto_584013 ?auto_584017 ) ) ( not ( = ?auto_584013 ?auto_584018 ) ) ( not ( = ?auto_584013 ?auto_584019 ) ) ( not ( = ?auto_584013 ?auto_584020 ) ) ( not ( = ?auto_584013 ?auto_584021 ) ) ( not ( = ?auto_584013 ?auto_584022 ) ) ( not ( = ?auto_584013 ?auto_584023 ) ) ( not ( = ?auto_584013 ?auto_584024 ) ) ( not ( = ?auto_584013 ?auto_584025 ) ) ( not ( = ?auto_584013 ?auto_584026 ) ) ( not ( = ?auto_584013 ?auto_584027 ) ) ( not ( = ?auto_584013 ?auto_584028 ) ) ( not ( = ?auto_584014 ?auto_584015 ) ) ( not ( = ?auto_584014 ?auto_584016 ) ) ( not ( = ?auto_584014 ?auto_584017 ) ) ( not ( = ?auto_584014 ?auto_584018 ) ) ( not ( = ?auto_584014 ?auto_584019 ) ) ( not ( = ?auto_584014 ?auto_584020 ) ) ( not ( = ?auto_584014 ?auto_584021 ) ) ( not ( = ?auto_584014 ?auto_584022 ) ) ( not ( = ?auto_584014 ?auto_584023 ) ) ( not ( = ?auto_584014 ?auto_584024 ) ) ( not ( = ?auto_584014 ?auto_584025 ) ) ( not ( = ?auto_584014 ?auto_584026 ) ) ( not ( = ?auto_584014 ?auto_584027 ) ) ( not ( = ?auto_584014 ?auto_584028 ) ) ( not ( = ?auto_584015 ?auto_584016 ) ) ( not ( = ?auto_584015 ?auto_584017 ) ) ( not ( = ?auto_584015 ?auto_584018 ) ) ( not ( = ?auto_584015 ?auto_584019 ) ) ( not ( = ?auto_584015 ?auto_584020 ) ) ( not ( = ?auto_584015 ?auto_584021 ) ) ( not ( = ?auto_584015 ?auto_584022 ) ) ( not ( = ?auto_584015 ?auto_584023 ) ) ( not ( = ?auto_584015 ?auto_584024 ) ) ( not ( = ?auto_584015 ?auto_584025 ) ) ( not ( = ?auto_584015 ?auto_584026 ) ) ( not ( = ?auto_584015 ?auto_584027 ) ) ( not ( = ?auto_584015 ?auto_584028 ) ) ( not ( = ?auto_584016 ?auto_584017 ) ) ( not ( = ?auto_584016 ?auto_584018 ) ) ( not ( = ?auto_584016 ?auto_584019 ) ) ( not ( = ?auto_584016 ?auto_584020 ) ) ( not ( = ?auto_584016 ?auto_584021 ) ) ( not ( = ?auto_584016 ?auto_584022 ) ) ( not ( = ?auto_584016 ?auto_584023 ) ) ( not ( = ?auto_584016 ?auto_584024 ) ) ( not ( = ?auto_584016 ?auto_584025 ) ) ( not ( = ?auto_584016 ?auto_584026 ) ) ( not ( = ?auto_584016 ?auto_584027 ) ) ( not ( = ?auto_584016 ?auto_584028 ) ) ( not ( = ?auto_584017 ?auto_584018 ) ) ( not ( = ?auto_584017 ?auto_584019 ) ) ( not ( = ?auto_584017 ?auto_584020 ) ) ( not ( = ?auto_584017 ?auto_584021 ) ) ( not ( = ?auto_584017 ?auto_584022 ) ) ( not ( = ?auto_584017 ?auto_584023 ) ) ( not ( = ?auto_584017 ?auto_584024 ) ) ( not ( = ?auto_584017 ?auto_584025 ) ) ( not ( = ?auto_584017 ?auto_584026 ) ) ( not ( = ?auto_584017 ?auto_584027 ) ) ( not ( = ?auto_584017 ?auto_584028 ) ) ( not ( = ?auto_584018 ?auto_584019 ) ) ( not ( = ?auto_584018 ?auto_584020 ) ) ( not ( = ?auto_584018 ?auto_584021 ) ) ( not ( = ?auto_584018 ?auto_584022 ) ) ( not ( = ?auto_584018 ?auto_584023 ) ) ( not ( = ?auto_584018 ?auto_584024 ) ) ( not ( = ?auto_584018 ?auto_584025 ) ) ( not ( = ?auto_584018 ?auto_584026 ) ) ( not ( = ?auto_584018 ?auto_584027 ) ) ( not ( = ?auto_584018 ?auto_584028 ) ) ( not ( = ?auto_584019 ?auto_584020 ) ) ( not ( = ?auto_584019 ?auto_584021 ) ) ( not ( = ?auto_584019 ?auto_584022 ) ) ( not ( = ?auto_584019 ?auto_584023 ) ) ( not ( = ?auto_584019 ?auto_584024 ) ) ( not ( = ?auto_584019 ?auto_584025 ) ) ( not ( = ?auto_584019 ?auto_584026 ) ) ( not ( = ?auto_584019 ?auto_584027 ) ) ( not ( = ?auto_584019 ?auto_584028 ) ) ( not ( = ?auto_584020 ?auto_584021 ) ) ( not ( = ?auto_584020 ?auto_584022 ) ) ( not ( = ?auto_584020 ?auto_584023 ) ) ( not ( = ?auto_584020 ?auto_584024 ) ) ( not ( = ?auto_584020 ?auto_584025 ) ) ( not ( = ?auto_584020 ?auto_584026 ) ) ( not ( = ?auto_584020 ?auto_584027 ) ) ( not ( = ?auto_584020 ?auto_584028 ) ) ( not ( = ?auto_584021 ?auto_584022 ) ) ( not ( = ?auto_584021 ?auto_584023 ) ) ( not ( = ?auto_584021 ?auto_584024 ) ) ( not ( = ?auto_584021 ?auto_584025 ) ) ( not ( = ?auto_584021 ?auto_584026 ) ) ( not ( = ?auto_584021 ?auto_584027 ) ) ( not ( = ?auto_584021 ?auto_584028 ) ) ( not ( = ?auto_584022 ?auto_584023 ) ) ( not ( = ?auto_584022 ?auto_584024 ) ) ( not ( = ?auto_584022 ?auto_584025 ) ) ( not ( = ?auto_584022 ?auto_584026 ) ) ( not ( = ?auto_584022 ?auto_584027 ) ) ( not ( = ?auto_584022 ?auto_584028 ) ) ( not ( = ?auto_584023 ?auto_584024 ) ) ( not ( = ?auto_584023 ?auto_584025 ) ) ( not ( = ?auto_584023 ?auto_584026 ) ) ( not ( = ?auto_584023 ?auto_584027 ) ) ( not ( = ?auto_584023 ?auto_584028 ) ) ( not ( = ?auto_584024 ?auto_584025 ) ) ( not ( = ?auto_584024 ?auto_584026 ) ) ( not ( = ?auto_584024 ?auto_584027 ) ) ( not ( = ?auto_584024 ?auto_584028 ) ) ( not ( = ?auto_584025 ?auto_584026 ) ) ( not ( = ?auto_584025 ?auto_584027 ) ) ( not ( = ?auto_584025 ?auto_584028 ) ) ( not ( = ?auto_584026 ?auto_584027 ) ) ( not ( = ?auto_584026 ?auto_584028 ) ) ( not ( = ?auto_584027 ?auto_584028 ) ) ( ON ?auto_584027 ?auto_584028 ) ( ON ?auto_584026 ?auto_584027 ) ( ON ?auto_584025 ?auto_584026 ) ( ON ?auto_584024 ?auto_584025 ) ( ON ?auto_584023 ?auto_584024 ) ( ON ?auto_584022 ?auto_584023 ) ( ON ?auto_584021 ?auto_584022 ) ( ON ?auto_584020 ?auto_584021 ) ( ON ?auto_584019 ?auto_584020 ) ( ON ?auto_584018 ?auto_584019 ) ( ON ?auto_584017 ?auto_584018 ) ( ON ?auto_584016 ?auto_584017 ) ( ON ?auto_584015 ?auto_584016 ) ( CLEAR ?auto_584013 ) ( ON ?auto_584014 ?auto_584015 ) ( CLEAR ?auto_584014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_584013 ?auto_584014 )
      ( MAKE-16PILE ?auto_584013 ?auto_584014 ?auto_584015 ?auto_584016 ?auto_584017 ?auto_584018 ?auto_584019 ?auto_584020 ?auto_584021 ?auto_584022 ?auto_584023 ?auto_584024 ?auto_584025 ?auto_584026 ?auto_584027 ?auto_584028 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_584045 - BLOCK
      ?auto_584046 - BLOCK
      ?auto_584047 - BLOCK
      ?auto_584048 - BLOCK
      ?auto_584049 - BLOCK
      ?auto_584050 - BLOCK
      ?auto_584051 - BLOCK
      ?auto_584052 - BLOCK
      ?auto_584053 - BLOCK
      ?auto_584054 - BLOCK
      ?auto_584055 - BLOCK
      ?auto_584056 - BLOCK
      ?auto_584057 - BLOCK
      ?auto_584058 - BLOCK
      ?auto_584059 - BLOCK
      ?auto_584060 - BLOCK
    )
    :vars
    (
      ?auto_584061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584060 ?auto_584061 ) ( not ( = ?auto_584045 ?auto_584046 ) ) ( not ( = ?auto_584045 ?auto_584047 ) ) ( not ( = ?auto_584045 ?auto_584048 ) ) ( not ( = ?auto_584045 ?auto_584049 ) ) ( not ( = ?auto_584045 ?auto_584050 ) ) ( not ( = ?auto_584045 ?auto_584051 ) ) ( not ( = ?auto_584045 ?auto_584052 ) ) ( not ( = ?auto_584045 ?auto_584053 ) ) ( not ( = ?auto_584045 ?auto_584054 ) ) ( not ( = ?auto_584045 ?auto_584055 ) ) ( not ( = ?auto_584045 ?auto_584056 ) ) ( not ( = ?auto_584045 ?auto_584057 ) ) ( not ( = ?auto_584045 ?auto_584058 ) ) ( not ( = ?auto_584045 ?auto_584059 ) ) ( not ( = ?auto_584045 ?auto_584060 ) ) ( not ( = ?auto_584045 ?auto_584061 ) ) ( not ( = ?auto_584046 ?auto_584047 ) ) ( not ( = ?auto_584046 ?auto_584048 ) ) ( not ( = ?auto_584046 ?auto_584049 ) ) ( not ( = ?auto_584046 ?auto_584050 ) ) ( not ( = ?auto_584046 ?auto_584051 ) ) ( not ( = ?auto_584046 ?auto_584052 ) ) ( not ( = ?auto_584046 ?auto_584053 ) ) ( not ( = ?auto_584046 ?auto_584054 ) ) ( not ( = ?auto_584046 ?auto_584055 ) ) ( not ( = ?auto_584046 ?auto_584056 ) ) ( not ( = ?auto_584046 ?auto_584057 ) ) ( not ( = ?auto_584046 ?auto_584058 ) ) ( not ( = ?auto_584046 ?auto_584059 ) ) ( not ( = ?auto_584046 ?auto_584060 ) ) ( not ( = ?auto_584046 ?auto_584061 ) ) ( not ( = ?auto_584047 ?auto_584048 ) ) ( not ( = ?auto_584047 ?auto_584049 ) ) ( not ( = ?auto_584047 ?auto_584050 ) ) ( not ( = ?auto_584047 ?auto_584051 ) ) ( not ( = ?auto_584047 ?auto_584052 ) ) ( not ( = ?auto_584047 ?auto_584053 ) ) ( not ( = ?auto_584047 ?auto_584054 ) ) ( not ( = ?auto_584047 ?auto_584055 ) ) ( not ( = ?auto_584047 ?auto_584056 ) ) ( not ( = ?auto_584047 ?auto_584057 ) ) ( not ( = ?auto_584047 ?auto_584058 ) ) ( not ( = ?auto_584047 ?auto_584059 ) ) ( not ( = ?auto_584047 ?auto_584060 ) ) ( not ( = ?auto_584047 ?auto_584061 ) ) ( not ( = ?auto_584048 ?auto_584049 ) ) ( not ( = ?auto_584048 ?auto_584050 ) ) ( not ( = ?auto_584048 ?auto_584051 ) ) ( not ( = ?auto_584048 ?auto_584052 ) ) ( not ( = ?auto_584048 ?auto_584053 ) ) ( not ( = ?auto_584048 ?auto_584054 ) ) ( not ( = ?auto_584048 ?auto_584055 ) ) ( not ( = ?auto_584048 ?auto_584056 ) ) ( not ( = ?auto_584048 ?auto_584057 ) ) ( not ( = ?auto_584048 ?auto_584058 ) ) ( not ( = ?auto_584048 ?auto_584059 ) ) ( not ( = ?auto_584048 ?auto_584060 ) ) ( not ( = ?auto_584048 ?auto_584061 ) ) ( not ( = ?auto_584049 ?auto_584050 ) ) ( not ( = ?auto_584049 ?auto_584051 ) ) ( not ( = ?auto_584049 ?auto_584052 ) ) ( not ( = ?auto_584049 ?auto_584053 ) ) ( not ( = ?auto_584049 ?auto_584054 ) ) ( not ( = ?auto_584049 ?auto_584055 ) ) ( not ( = ?auto_584049 ?auto_584056 ) ) ( not ( = ?auto_584049 ?auto_584057 ) ) ( not ( = ?auto_584049 ?auto_584058 ) ) ( not ( = ?auto_584049 ?auto_584059 ) ) ( not ( = ?auto_584049 ?auto_584060 ) ) ( not ( = ?auto_584049 ?auto_584061 ) ) ( not ( = ?auto_584050 ?auto_584051 ) ) ( not ( = ?auto_584050 ?auto_584052 ) ) ( not ( = ?auto_584050 ?auto_584053 ) ) ( not ( = ?auto_584050 ?auto_584054 ) ) ( not ( = ?auto_584050 ?auto_584055 ) ) ( not ( = ?auto_584050 ?auto_584056 ) ) ( not ( = ?auto_584050 ?auto_584057 ) ) ( not ( = ?auto_584050 ?auto_584058 ) ) ( not ( = ?auto_584050 ?auto_584059 ) ) ( not ( = ?auto_584050 ?auto_584060 ) ) ( not ( = ?auto_584050 ?auto_584061 ) ) ( not ( = ?auto_584051 ?auto_584052 ) ) ( not ( = ?auto_584051 ?auto_584053 ) ) ( not ( = ?auto_584051 ?auto_584054 ) ) ( not ( = ?auto_584051 ?auto_584055 ) ) ( not ( = ?auto_584051 ?auto_584056 ) ) ( not ( = ?auto_584051 ?auto_584057 ) ) ( not ( = ?auto_584051 ?auto_584058 ) ) ( not ( = ?auto_584051 ?auto_584059 ) ) ( not ( = ?auto_584051 ?auto_584060 ) ) ( not ( = ?auto_584051 ?auto_584061 ) ) ( not ( = ?auto_584052 ?auto_584053 ) ) ( not ( = ?auto_584052 ?auto_584054 ) ) ( not ( = ?auto_584052 ?auto_584055 ) ) ( not ( = ?auto_584052 ?auto_584056 ) ) ( not ( = ?auto_584052 ?auto_584057 ) ) ( not ( = ?auto_584052 ?auto_584058 ) ) ( not ( = ?auto_584052 ?auto_584059 ) ) ( not ( = ?auto_584052 ?auto_584060 ) ) ( not ( = ?auto_584052 ?auto_584061 ) ) ( not ( = ?auto_584053 ?auto_584054 ) ) ( not ( = ?auto_584053 ?auto_584055 ) ) ( not ( = ?auto_584053 ?auto_584056 ) ) ( not ( = ?auto_584053 ?auto_584057 ) ) ( not ( = ?auto_584053 ?auto_584058 ) ) ( not ( = ?auto_584053 ?auto_584059 ) ) ( not ( = ?auto_584053 ?auto_584060 ) ) ( not ( = ?auto_584053 ?auto_584061 ) ) ( not ( = ?auto_584054 ?auto_584055 ) ) ( not ( = ?auto_584054 ?auto_584056 ) ) ( not ( = ?auto_584054 ?auto_584057 ) ) ( not ( = ?auto_584054 ?auto_584058 ) ) ( not ( = ?auto_584054 ?auto_584059 ) ) ( not ( = ?auto_584054 ?auto_584060 ) ) ( not ( = ?auto_584054 ?auto_584061 ) ) ( not ( = ?auto_584055 ?auto_584056 ) ) ( not ( = ?auto_584055 ?auto_584057 ) ) ( not ( = ?auto_584055 ?auto_584058 ) ) ( not ( = ?auto_584055 ?auto_584059 ) ) ( not ( = ?auto_584055 ?auto_584060 ) ) ( not ( = ?auto_584055 ?auto_584061 ) ) ( not ( = ?auto_584056 ?auto_584057 ) ) ( not ( = ?auto_584056 ?auto_584058 ) ) ( not ( = ?auto_584056 ?auto_584059 ) ) ( not ( = ?auto_584056 ?auto_584060 ) ) ( not ( = ?auto_584056 ?auto_584061 ) ) ( not ( = ?auto_584057 ?auto_584058 ) ) ( not ( = ?auto_584057 ?auto_584059 ) ) ( not ( = ?auto_584057 ?auto_584060 ) ) ( not ( = ?auto_584057 ?auto_584061 ) ) ( not ( = ?auto_584058 ?auto_584059 ) ) ( not ( = ?auto_584058 ?auto_584060 ) ) ( not ( = ?auto_584058 ?auto_584061 ) ) ( not ( = ?auto_584059 ?auto_584060 ) ) ( not ( = ?auto_584059 ?auto_584061 ) ) ( not ( = ?auto_584060 ?auto_584061 ) ) ( ON ?auto_584059 ?auto_584060 ) ( ON ?auto_584058 ?auto_584059 ) ( ON ?auto_584057 ?auto_584058 ) ( ON ?auto_584056 ?auto_584057 ) ( ON ?auto_584055 ?auto_584056 ) ( ON ?auto_584054 ?auto_584055 ) ( ON ?auto_584053 ?auto_584054 ) ( ON ?auto_584052 ?auto_584053 ) ( ON ?auto_584051 ?auto_584052 ) ( ON ?auto_584050 ?auto_584051 ) ( ON ?auto_584049 ?auto_584050 ) ( ON ?auto_584048 ?auto_584049 ) ( ON ?auto_584047 ?auto_584048 ) ( ON ?auto_584046 ?auto_584047 ) ( ON ?auto_584045 ?auto_584046 ) ( CLEAR ?auto_584045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_584045 )
      ( MAKE-16PILE ?auto_584045 ?auto_584046 ?auto_584047 ?auto_584048 ?auto_584049 ?auto_584050 ?auto_584051 ?auto_584052 ?auto_584053 ?auto_584054 ?auto_584055 ?auto_584056 ?auto_584057 ?auto_584058 ?auto_584059 ?auto_584060 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_584078 - BLOCK
      ?auto_584079 - BLOCK
      ?auto_584080 - BLOCK
      ?auto_584081 - BLOCK
      ?auto_584082 - BLOCK
      ?auto_584083 - BLOCK
      ?auto_584084 - BLOCK
      ?auto_584085 - BLOCK
      ?auto_584086 - BLOCK
      ?auto_584087 - BLOCK
      ?auto_584088 - BLOCK
      ?auto_584089 - BLOCK
      ?auto_584090 - BLOCK
      ?auto_584091 - BLOCK
      ?auto_584092 - BLOCK
      ?auto_584093 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_584093 ) ( not ( = ?auto_584078 ?auto_584079 ) ) ( not ( = ?auto_584078 ?auto_584080 ) ) ( not ( = ?auto_584078 ?auto_584081 ) ) ( not ( = ?auto_584078 ?auto_584082 ) ) ( not ( = ?auto_584078 ?auto_584083 ) ) ( not ( = ?auto_584078 ?auto_584084 ) ) ( not ( = ?auto_584078 ?auto_584085 ) ) ( not ( = ?auto_584078 ?auto_584086 ) ) ( not ( = ?auto_584078 ?auto_584087 ) ) ( not ( = ?auto_584078 ?auto_584088 ) ) ( not ( = ?auto_584078 ?auto_584089 ) ) ( not ( = ?auto_584078 ?auto_584090 ) ) ( not ( = ?auto_584078 ?auto_584091 ) ) ( not ( = ?auto_584078 ?auto_584092 ) ) ( not ( = ?auto_584078 ?auto_584093 ) ) ( not ( = ?auto_584079 ?auto_584080 ) ) ( not ( = ?auto_584079 ?auto_584081 ) ) ( not ( = ?auto_584079 ?auto_584082 ) ) ( not ( = ?auto_584079 ?auto_584083 ) ) ( not ( = ?auto_584079 ?auto_584084 ) ) ( not ( = ?auto_584079 ?auto_584085 ) ) ( not ( = ?auto_584079 ?auto_584086 ) ) ( not ( = ?auto_584079 ?auto_584087 ) ) ( not ( = ?auto_584079 ?auto_584088 ) ) ( not ( = ?auto_584079 ?auto_584089 ) ) ( not ( = ?auto_584079 ?auto_584090 ) ) ( not ( = ?auto_584079 ?auto_584091 ) ) ( not ( = ?auto_584079 ?auto_584092 ) ) ( not ( = ?auto_584079 ?auto_584093 ) ) ( not ( = ?auto_584080 ?auto_584081 ) ) ( not ( = ?auto_584080 ?auto_584082 ) ) ( not ( = ?auto_584080 ?auto_584083 ) ) ( not ( = ?auto_584080 ?auto_584084 ) ) ( not ( = ?auto_584080 ?auto_584085 ) ) ( not ( = ?auto_584080 ?auto_584086 ) ) ( not ( = ?auto_584080 ?auto_584087 ) ) ( not ( = ?auto_584080 ?auto_584088 ) ) ( not ( = ?auto_584080 ?auto_584089 ) ) ( not ( = ?auto_584080 ?auto_584090 ) ) ( not ( = ?auto_584080 ?auto_584091 ) ) ( not ( = ?auto_584080 ?auto_584092 ) ) ( not ( = ?auto_584080 ?auto_584093 ) ) ( not ( = ?auto_584081 ?auto_584082 ) ) ( not ( = ?auto_584081 ?auto_584083 ) ) ( not ( = ?auto_584081 ?auto_584084 ) ) ( not ( = ?auto_584081 ?auto_584085 ) ) ( not ( = ?auto_584081 ?auto_584086 ) ) ( not ( = ?auto_584081 ?auto_584087 ) ) ( not ( = ?auto_584081 ?auto_584088 ) ) ( not ( = ?auto_584081 ?auto_584089 ) ) ( not ( = ?auto_584081 ?auto_584090 ) ) ( not ( = ?auto_584081 ?auto_584091 ) ) ( not ( = ?auto_584081 ?auto_584092 ) ) ( not ( = ?auto_584081 ?auto_584093 ) ) ( not ( = ?auto_584082 ?auto_584083 ) ) ( not ( = ?auto_584082 ?auto_584084 ) ) ( not ( = ?auto_584082 ?auto_584085 ) ) ( not ( = ?auto_584082 ?auto_584086 ) ) ( not ( = ?auto_584082 ?auto_584087 ) ) ( not ( = ?auto_584082 ?auto_584088 ) ) ( not ( = ?auto_584082 ?auto_584089 ) ) ( not ( = ?auto_584082 ?auto_584090 ) ) ( not ( = ?auto_584082 ?auto_584091 ) ) ( not ( = ?auto_584082 ?auto_584092 ) ) ( not ( = ?auto_584082 ?auto_584093 ) ) ( not ( = ?auto_584083 ?auto_584084 ) ) ( not ( = ?auto_584083 ?auto_584085 ) ) ( not ( = ?auto_584083 ?auto_584086 ) ) ( not ( = ?auto_584083 ?auto_584087 ) ) ( not ( = ?auto_584083 ?auto_584088 ) ) ( not ( = ?auto_584083 ?auto_584089 ) ) ( not ( = ?auto_584083 ?auto_584090 ) ) ( not ( = ?auto_584083 ?auto_584091 ) ) ( not ( = ?auto_584083 ?auto_584092 ) ) ( not ( = ?auto_584083 ?auto_584093 ) ) ( not ( = ?auto_584084 ?auto_584085 ) ) ( not ( = ?auto_584084 ?auto_584086 ) ) ( not ( = ?auto_584084 ?auto_584087 ) ) ( not ( = ?auto_584084 ?auto_584088 ) ) ( not ( = ?auto_584084 ?auto_584089 ) ) ( not ( = ?auto_584084 ?auto_584090 ) ) ( not ( = ?auto_584084 ?auto_584091 ) ) ( not ( = ?auto_584084 ?auto_584092 ) ) ( not ( = ?auto_584084 ?auto_584093 ) ) ( not ( = ?auto_584085 ?auto_584086 ) ) ( not ( = ?auto_584085 ?auto_584087 ) ) ( not ( = ?auto_584085 ?auto_584088 ) ) ( not ( = ?auto_584085 ?auto_584089 ) ) ( not ( = ?auto_584085 ?auto_584090 ) ) ( not ( = ?auto_584085 ?auto_584091 ) ) ( not ( = ?auto_584085 ?auto_584092 ) ) ( not ( = ?auto_584085 ?auto_584093 ) ) ( not ( = ?auto_584086 ?auto_584087 ) ) ( not ( = ?auto_584086 ?auto_584088 ) ) ( not ( = ?auto_584086 ?auto_584089 ) ) ( not ( = ?auto_584086 ?auto_584090 ) ) ( not ( = ?auto_584086 ?auto_584091 ) ) ( not ( = ?auto_584086 ?auto_584092 ) ) ( not ( = ?auto_584086 ?auto_584093 ) ) ( not ( = ?auto_584087 ?auto_584088 ) ) ( not ( = ?auto_584087 ?auto_584089 ) ) ( not ( = ?auto_584087 ?auto_584090 ) ) ( not ( = ?auto_584087 ?auto_584091 ) ) ( not ( = ?auto_584087 ?auto_584092 ) ) ( not ( = ?auto_584087 ?auto_584093 ) ) ( not ( = ?auto_584088 ?auto_584089 ) ) ( not ( = ?auto_584088 ?auto_584090 ) ) ( not ( = ?auto_584088 ?auto_584091 ) ) ( not ( = ?auto_584088 ?auto_584092 ) ) ( not ( = ?auto_584088 ?auto_584093 ) ) ( not ( = ?auto_584089 ?auto_584090 ) ) ( not ( = ?auto_584089 ?auto_584091 ) ) ( not ( = ?auto_584089 ?auto_584092 ) ) ( not ( = ?auto_584089 ?auto_584093 ) ) ( not ( = ?auto_584090 ?auto_584091 ) ) ( not ( = ?auto_584090 ?auto_584092 ) ) ( not ( = ?auto_584090 ?auto_584093 ) ) ( not ( = ?auto_584091 ?auto_584092 ) ) ( not ( = ?auto_584091 ?auto_584093 ) ) ( not ( = ?auto_584092 ?auto_584093 ) ) ( ON ?auto_584092 ?auto_584093 ) ( ON ?auto_584091 ?auto_584092 ) ( ON ?auto_584090 ?auto_584091 ) ( ON ?auto_584089 ?auto_584090 ) ( ON ?auto_584088 ?auto_584089 ) ( ON ?auto_584087 ?auto_584088 ) ( ON ?auto_584086 ?auto_584087 ) ( ON ?auto_584085 ?auto_584086 ) ( ON ?auto_584084 ?auto_584085 ) ( ON ?auto_584083 ?auto_584084 ) ( ON ?auto_584082 ?auto_584083 ) ( ON ?auto_584081 ?auto_584082 ) ( ON ?auto_584080 ?auto_584081 ) ( ON ?auto_584079 ?auto_584080 ) ( ON ?auto_584078 ?auto_584079 ) ( CLEAR ?auto_584078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_584078 )
      ( MAKE-16PILE ?auto_584078 ?auto_584079 ?auto_584080 ?auto_584081 ?auto_584082 ?auto_584083 ?auto_584084 ?auto_584085 ?auto_584086 ?auto_584087 ?auto_584088 ?auto_584089 ?auto_584090 ?auto_584091 ?auto_584092 ?auto_584093 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_584110 - BLOCK
      ?auto_584111 - BLOCK
      ?auto_584112 - BLOCK
      ?auto_584113 - BLOCK
      ?auto_584114 - BLOCK
      ?auto_584115 - BLOCK
      ?auto_584116 - BLOCK
      ?auto_584117 - BLOCK
      ?auto_584118 - BLOCK
      ?auto_584119 - BLOCK
      ?auto_584120 - BLOCK
      ?auto_584121 - BLOCK
      ?auto_584122 - BLOCK
      ?auto_584123 - BLOCK
      ?auto_584124 - BLOCK
      ?auto_584125 - BLOCK
    )
    :vars
    (
      ?auto_584126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_584110 ?auto_584111 ) ) ( not ( = ?auto_584110 ?auto_584112 ) ) ( not ( = ?auto_584110 ?auto_584113 ) ) ( not ( = ?auto_584110 ?auto_584114 ) ) ( not ( = ?auto_584110 ?auto_584115 ) ) ( not ( = ?auto_584110 ?auto_584116 ) ) ( not ( = ?auto_584110 ?auto_584117 ) ) ( not ( = ?auto_584110 ?auto_584118 ) ) ( not ( = ?auto_584110 ?auto_584119 ) ) ( not ( = ?auto_584110 ?auto_584120 ) ) ( not ( = ?auto_584110 ?auto_584121 ) ) ( not ( = ?auto_584110 ?auto_584122 ) ) ( not ( = ?auto_584110 ?auto_584123 ) ) ( not ( = ?auto_584110 ?auto_584124 ) ) ( not ( = ?auto_584110 ?auto_584125 ) ) ( not ( = ?auto_584111 ?auto_584112 ) ) ( not ( = ?auto_584111 ?auto_584113 ) ) ( not ( = ?auto_584111 ?auto_584114 ) ) ( not ( = ?auto_584111 ?auto_584115 ) ) ( not ( = ?auto_584111 ?auto_584116 ) ) ( not ( = ?auto_584111 ?auto_584117 ) ) ( not ( = ?auto_584111 ?auto_584118 ) ) ( not ( = ?auto_584111 ?auto_584119 ) ) ( not ( = ?auto_584111 ?auto_584120 ) ) ( not ( = ?auto_584111 ?auto_584121 ) ) ( not ( = ?auto_584111 ?auto_584122 ) ) ( not ( = ?auto_584111 ?auto_584123 ) ) ( not ( = ?auto_584111 ?auto_584124 ) ) ( not ( = ?auto_584111 ?auto_584125 ) ) ( not ( = ?auto_584112 ?auto_584113 ) ) ( not ( = ?auto_584112 ?auto_584114 ) ) ( not ( = ?auto_584112 ?auto_584115 ) ) ( not ( = ?auto_584112 ?auto_584116 ) ) ( not ( = ?auto_584112 ?auto_584117 ) ) ( not ( = ?auto_584112 ?auto_584118 ) ) ( not ( = ?auto_584112 ?auto_584119 ) ) ( not ( = ?auto_584112 ?auto_584120 ) ) ( not ( = ?auto_584112 ?auto_584121 ) ) ( not ( = ?auto_584112 ?auto_584122 ) ) ( not ( = ?auto_584112 ?auto_584123 ) ) ( not ( = ?auto_584112 ?auto_584124 ) ) ( not ( = ?auto_584112 ?auto_584125 ) ) ( not ( = ?auto_584113 ?auto_584114 ) ) ( not ( = ?auto_584113 ?auto_584115 ) ) ( not ( = ?auto_584113 ?auto_584116 ) ) ( not ( = ?auto_584113 ?auto_584117 ) ) ( not ( = ?auto_584113 ?auto_584118 ) ) ( not ( = ?auto_584113 ?auto_584119 ) ) ( not ( = ?auto_584113 ?auto_584120 ) ) ( not ( = ?auto_584113 ?auto_584121 ) ) ( not ( = ?auto_584113 ?auto_584122 ) ) ( not ( = ?auto_584113 ?auto_584123 ) ) ( not ( = ?auto_584113 ?auto_584124 ) ) ( not ( = ?auto_584113 ?auto_584125 ) ) ( not ( = ?auto_584114 ?auto_584115 ) ) ( not ( = ?auto_584114 ?auto_584116 ) ) ( not ( = ?auto_584114 ?auto_584117 ) ) ( not ( = ?auto_584114 ?auto_584118 ) ) ( not ( = ?auto_584114 ?auto_584119 ) ) ( not ( = ?auto_584114 ?auto_584120 ) ) ( not ( = ?auto_584114 ?auto_584121 ) ) ( not ( = ?auto_584114 ?auto_584122 ) ) ( not ( = ?auto_584114 ?auto_584123 ) ) ( not ( = ?auto_584114 ?auto_584124 ) ) ( not ( = ?auto_584114 ?auto_584125 ) ) ( not ( = ?auto_584115 ?auto_584116 ) ) ( not ( = ?auto_584115 ?auto_584117 ) ) ( not ( = ?auto_584115 ?auto_584118 ) ) ( not ( = ?auto_584115 ?auto_584119 ) ) ( not ( = ?auto_584115 ?auto_584120 ) ) ( not ( = ?auto_584115 ?auto_584121 ) ) ( not ( = ?auto_584115 ?auto_584122 ) ) ( not ( = ?auto_584115 ?auto_584123 ) ) ( not ( = ?auto_584115 ?auto_584124 ) ) ( not ( = ?auto_584115 ?auto_584125 ) ) ( not ( = ?auto_584116 ?auto_584117 ) ) ( not ( = ?auto_584116 ?auto_584118 ) ) ( not ( = ?auto_584116 ?auto_584119 ) ) ( not ( = ?auto_584116 ?auto_584120 ) ) ( not ( = ?auto_584116 ?auto_584121 ) ) ( not ( = ?auto_584116 ?auto_584122 ) ) ( not ( = ?auto_584116 ?auto_584123 ) ) ( not ( = ?auto_584116 ?auto_584124 ) ) ( not ( = ?auto_584116 ?auto_584125 ) ) ( not ( = ?auto_584117 ?auto_584118 ) ) ( not ( = ?auto_584117 ?auto_584119 ) ) ( not ( = ?auto_584117 ?auto_584120 ) ) ( not ( = ?auto_584117 ?auto_584121 ) ) ( not ( = ?auto_584117 ?auto_584122 ) ) ( not ( = ?auto_584117 ?auto_584123 ) ) ( not ( = ?auto_584117 ?auto_584124 ) ) ( not ( = ?auto_584117 ?auto_584125 ) ) ( not ( = ?auto_584118 ?auto_584119 ) ) ( not ( = ?auto_584118 ?auto_584120 ) ) ( not ( = ?auto_584118 ?auto_584121 ) ) ( not ( = ?auto_584118 ?auto_584122 ) ) ( not ( = ?auto_584118 ?auto_584123 ) ) ( not ( = ?auto_584118 ?auto_584124 ) ) ( not ( = ?auto_584118 ?auto_584125 ) ) ( not ( = ?auto_584119 ?auto_584120 ) ) ( not ( = ?auto_584119 ?auto_584121 ) ) ( not ( = ?auto_584119 ?auto_584122 ) ) ( not ( = ?auto_584119 ?auto_584123 ) ) ( not ( = ?auto_584119 ?auto_584124 ) ) ( not ( = ?auto_584119 ?auto_584125 ) ) ( not ( = ?auto_584120 ?auto_584121 ) ) ( not ( = ?auto_584120 ?auto_584122 ) ) ( not ( = ?auto_584120 ?auto_584123 ) ) ( not ( = ?auto_584120 ?auto_584124 ) ) ( not ( = ?auto_584120 ?auto_584125 ) ) ( not ( = ?auto_584121 ?auto_584122 ) ) ( not ( = ?auto_584121 ?auto_584123 ) ) ( not ( = ?auto_584121 ?auto_584124 ) ) ( not ( = ?auto_584121 ?auto_584125 ) ) ( not ( = ?auto_584122 ?auto_584123 ) ) ( not ( = ?auto_584122 ?auto_584124 ) ) ( not ( = ?auto_584122 ?auto_584125 ) ) ( not ( = ?auto_584123 ?auto_584124 ) ) ( not ( = ?auto_584123 ?auto_584125 ) ) ( not ( = ?auto_584124 ?auto_584125 ) ) ( ON ?auto_584110 ?auto_584126 ) ( not ( = ?auto_584125 ?auto_584126 ) ) ( not ( = ?auto_584124 ?auto_584126 ) ) ( not ( = ?auto_584123 ?auto_584126 ) ) ( not ( = ?auto_584122 ?auto_584126 ) ) ( not ( = ?auto_584121 ?auto_584126 ) ) ( not ( = ?auto_584120 ?auto_584126 ) ) ( not ( = ?auto_584119 ?auto_584126 ) ) ( not ( = ?auto_584118 ?auto_584126 ) ) ( not ( = ?auto_584117 ?auto_584126 ) ) ( not ( = ?auto_584116 ?auto_584126 ) ) ( not ( = ?auto_584115 ?auto_584126 ) ) ( not ( = ?auto_584114 ?auto_584126 ) ) ( not ( = ?auto_584113 ?auto_584126 ) ) ( not ( = ?auto_584112 ?auto_584126 ) ) ( not ( = ?auto_584111 ?auto_584126 ) ) ( not ( = ?auto_584110 ?auto_584126 ) ) ( ON ?auto_584111 ?auto_584110 ) ( ON ?auto_584112 ?auto_584111 ) ( ON ?auto_584113 ?auto_584112 ) ( ON ?auto_584114 ?auto_584113 ) ( ON ?auto_584115 ?auto_584114 ) ( ON ?auto_584116 ?auto_584115 ) ( ON ?auto_584117 ?auto_584116 ) ( ON ?auto_584118 ?auto_584117 ) ( ON ?auto_584119 ?auto_584118 ) ( ON ?auto_584120 ?auto_584119 ) ( ON ?auto_584121 ?auto_584120 ) ( ON ?auto_584122 ?auto_584121 ) ( ON ?auto_584123 ?auto_584122 ) ( ON ?auto_584124 ?auto_584123 ) ( ON ?auto_584125 ?auto_584124 ) ( CLEAR ?auto_584125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_584125 ?auto_584124 ?auto_584123 ?auto_584122 ?auto_584121 ?auto_584120 ?auto_584119 ?auto_584118 ?auto_584117 ?auto_584116 ?auto_584115 ?auto_584114 ?auto_584113 ?auto_584112 ?auto_584111 ?auto_584110 )
      ( MAKE-16PILE ?auto_584110 ?auto_584111 ?auto_584112 ?auto_584113 ?auto_584114 ?auto_584115 ?auto_584116 ?auto_584117 ?auto_584118 ?auto_584119 ?auto_584120 ?auto_584121 ?auto_584122 ?auto_584123 ?auto_584124 ?auto_584125 ) )
  )

)

