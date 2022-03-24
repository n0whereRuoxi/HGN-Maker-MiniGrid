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
      ?auto_818854 - BLOCK
    )
    :vars
    (
      ?auto_818855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818854 ?auto_818855 ) ( CLEAR ?auto_818854 ) ( HAND-EMPTY ) ( not ( = ?auto_818854 ?auto_818855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_818854 ?auto_818855 )
      ( !PUTDOWN ?auto_818854 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_818861 - BLOCK
      ?auto_818862 - BLOCK
    )
    :vars
    (
      ?auto_818863 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_818861 ) ( ON ?auto_818862 ?auto_818863 ) ( CLEAR ?auto_818862 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_818861 ) ( not ( = ?auto_818861 ?auto_818862 ) ) ( not ( = ?auto_818861 ?auto_818863 ) ) ( not ( = ?auto_818862 ?auto_818863 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_818862 ?auto_818863 )
      ( !STACK ?auto_818862 ?auto_818861 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_818871 - BLOCK
      ?auto_818872 - BLOCK
    )
    :vars
    (
      ?auto_818873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818872 ?auto_818873 ) ( not ( = ?auto_818871 ?auto_818872 ) ) ( not ( = ?auto_818871 ?auto_818873 ) ) ( not ( = ?auto_818872 ?auto_818873 ) ) ( ON ?auto_818871 ?auto_818872 ) ( CLEAR ?auto_818871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_818871 )
      ( MAKE-2PILE ?auto_818871 ?auto_818872 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_818882 - BLOCK
      ?auto_818883 - BLOCK
      ?auto_818884 - BLOCK
    )
    :vars
    (
      ?auto_818885 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_818883 ) ( ON ?auto_818884 ?auto_818885 ) ( CLEAR ?auto_818884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_818882 ) ( ON ?auto_818883 ?auto_818882 ) ( not ( = ?auto_818882 ?auto_818883 ) ) ( not ( = ?auto_818882 ?auto_818884 ) ) ( not ( = ?auto_818882 ?auto_818885 ) ) ( not ( = ?auto_818883 ?auto_818884 ) ) ( not ( = ?auto_818883 ?auto_818885 ) ) ( not ( = ?auto_818884 ?auto_818885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_818884 ?auto_818885 )
      ( !STACK ?auto_818884 ?auto_818883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_818896 - BLOCK
      ?auto_818897 - BLOCK
      ?auto_818898 - BLOCK
    )
    :vars
    (
      ?auto_818899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818898 ?auto_818899 ) ( ON-TABLE ?auto_818896 ) ( not ( = ?auto_818896 ?auto_818897 ) ) ( not ( = ?auto_818896 ?auto_818898 ) ) ( not ( = ?auto_818896 ?auto_818899 ) ) ( not ( = ?auto_818897 ?auto_818898 ) ) ( not ( = ?auto_818897 ?auto_818899 ) ) ( not ( = ?auto_818898 ?auto_818899 ) ) ( CLEAR ?auto_818896 ) ( ON ?auto_818897 ?auto_818898 ) ( CLEAR ?auto_818897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_818896 ?auto_818897 )
      ( MAKE-3PILE ?auto_818896 ?auto_818897 ?auto_818898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_818910 - BLOCK
      ?auto_818911 - BLOCK
      ?auto_818912 - BLOCK
    )
    :vars
    (
      ?auto_818913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818912 ?auto_818913 ) ( not ( = ?auto_818910 ?auto_818911 ) ) ( not ( = ?auto_818910 ?auto_818912 ) ) ( not ( = ?auto_818910 ?auto_818913 ) ) ( not ( = ?auto_818911 ?auto_818912 ) ) ( not ( = ?auto_818911 ?auto_818913 ) ) ( not ( = ?auto_818912 ?auto_818913 ) ) ( ON ?auto_818911 ?auto_818912 ) ( ON ?auto_818910 ?auto_818911 ) ( CLEAR ?auto_818910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_818910 )
      ( MAKE-3PILE ?auto_818910 ?auto_818911 ?auto_818912 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_818925 - BLOCK
      ?auto_818926 - BLOCK
      ?auto_818927 - BLOCK
      ?auto_818928 - BLOCK
    )
    :vars
    (
      ?auto_818929 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_818927 ) ( ON ?auto_818928 ?auto_818929 ) ( CLEAR ?auto_818928 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_818925 ) ( ON ?auto_818926 ?auto_818925 ) ( ON ?auto_818927 ?auto_818926 ) ( not ( = ?auto_818925 ?auto_818926 ) ) ( not ( = ?auto_818925 ?auto_818927 ) ) ( not ( = ?auto_818925 ?auto_818928 ) ) ( not ( = ?auto_818925 ?auto_818929 ) ) ( not ( = ?auto_818926 ?auto_818927 ) ) ( not ( = ?auto_818926 ?auto_818928 ) ) ( not ( = ?auto_818926 ?auto_818929 ) ) ( not ( = ?auto_818927 ?auto_818928 ) ) ( not ( = ?auto_818927 ?auto_818929 ) ) ( not ( = ?auto_818928 ?auto_818929 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_818928 ?auto_818929 )
      ( !STACK ?auto_818928 ?auto_818927 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_818943 - BLOCK
      ?auto_818944 - BLOCK
      ?auto_818945 - BLOCK
      ?auto_818946 - BLOCK
    )
    :vars
    (
      ?auto_818947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818946 ?auto_818947 ) ( ON-TABLE ?auto_818943 ) ( ON ?auto_818944 ?auto_818943 ) ( not ( = ?auto_818943 ?auto_818944 ) ) ( not ( = ?auto_818943 ?auto_818945 ) ) ( not ( = ?auto_818943 ?auto_818946 ) ) ( not ( = ?auto_818943 ?auto_818947 ) ) ( not ( = ?auto_818944 ?auto_818945 ) ) ( not ( = ?auto_818944 ?auto_818946 ) ) ( not ( = ?auto_818944 ?auto_818947 ) ) ( not ( = ?auto_818945 ?auto_818946 ) ) ( not ( = ?auto_818945 ?auto_818947 ) ) ( not ( = ?auto_818946 ?auto_818947 ) ) ( CLEAR ?auto_818944 ) ( ON ?auto_818945 ?auto_818946 ) ( CLEAR ?auto_818945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_818943 ?auto_818944 ?auto_818945 )
      ( MAKE-4PILE ?auto_818943 ?auto_818944 ?auto_818945 ?auto_818946 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_818961 - BLOCK
      ?auto_818962 - BLOCK
      ?auto_818963 - BLOCK
      ?auto_818964 - BLOCK
    )
    :vars
    (
      ?auto_818965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818964 ?auto_818965 ) ( ON-TABLE ?auto_818961 ) ( not ( = ?auto_818961 ?auto_818962 ) ) ( not ( = ?auto_818961 ?auto_818963 ) ) ( not ( = ?auto_818961 ?auto_818964 ) ) ( not ( = ?auto_818961 ?auto_818965 ) ) ( not ( = ?auto_818962 ?auto_818963 ) ) ( not ( = ?auto_818962 ?auto_818964 ) ) ( not ( = ?auto_818962 ?auto_818965 ) ) ( not ( = ?auto_818963 ?auto_818964 ) ) ( not ( = ?auto_818963 ?auto_818965 ) ) ( not ( = ?auto_818964 ?auto_818965 ) ) ( ON ?auto_818963 ?auto_818964 ) ( CLEAR ?auto_818961 ) ( ON ?auto_818962 ?auto_818963 ) ( CLEAR ?auto_818962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_818961 ?auto_818962 )
      ( MAKE-4PILE ?auto_818961 ?auto_818962 ?auto_818963 ?auto_818964 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_818979 - BLOCK
      ?auto_818980 - BLOCK
      ?auto_818981 - BLOCK
      ?auto_818982 - BLOCK
    )
    :vars
    (
      ?auto_818983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_818982 ?auto_818983 ) ( not ( = ?auto_818979 ?auto_818980 ) ) ( not ( = ?auto_818979 ?auto_818981 ) ) ( not ( = ?auto_818979 ?auto_818982 ) ) ( not ( = ?auto_818979 ?auto_818983 ) ) ( not ( = ?auto_818980 ?auto_818981 ) ) ( not ( = ?auto_818980 ?auto_818982 ) ) ( not ( = ?auto_818980 ?auto_818983 ) ) ( not ( = ?auto_818981 ?auto_818982 ) ) ( not ( = ?auto_818981 ?auto_818983 ) ) ( not ( = ?auto_818982 ?auto_818983 ) ) ( ON ?auto_818981 ?auto_818982 ) ( ON ?auto_818980 ?auto_818981 ) ( ON ?auto_818979 ?auto_818980 ) ( CLEAR ?auto_818979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_818979 )
      ( MAKE-4PILE ?auto_818979 ?auto_818980 ?auto_818981 ?auto_818982 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_818998 - BLOCK
      ?auto_818999 - BLOCK
      ?auto_819000 - BLOCK
      ?auto_819001 - BLOCK
      ?auto_819002 - BLOCK
    )
    :vars
    (
      ?auto_819003 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_819001 ) ( ON ?auto_819002 ?auto_819003 ) ( CLEAR ?auto_819002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_818998 ) ( ON ?auto_818999 ?auto_818998 ) ( ON ?auto_819000 ?auto_818999 ) ( ON ?auto_819001 ?auto_819000 ) ( not ( = ?auto_818998 ?auto_818999 ) ) ( not ( = ?auto_818998 ?auto_819000 ) ) ( not ( = ?auto_818998 ?auto_819001 ) ) ( not ( = ?auto_818998 ?auto_819002 ) ) ( not ( = ?auto_818998 ?auto_819003 ) ) ( not ( = ?auto_818999 ?auto_819000 ) ) ( not ( = ?auto_818999 ?auto_819001 ) ) ( not ( = ?auto_818999 ?auto_819002 ) ) ( not ( = ?auto_818999 ?auto_819003 ) ) ( not ( = ?auto_819000 ?auto_819001 ) ) ( not ( = ?auto_819000 ?auto_819002 ) ) ( not ( = ?auto_819000 ?auto_819003 ) ) ( not ( = ?auto_819001 ?auto_819002 ) ) ( not ( = ?auto_819001 ?auto_819003 ) ) ( not ( = ?auto_819002 ?auto_819003 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_819002 ?auto_819003 )
      ( !STACK ?auto_819002 ?auto_819001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_819020 - BLOCK
      ?auto_819021 - BLOCK
      ?auto_819022 - BLOCK
      ?auto_819023 - BLOCK
      ?auto_819024 - BLOCK
    )
    :vars
    (
      ?auto_819025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819024 ?auto_819025 ) ( ON-TABLE ?auto_819020 ) ( ON ?auto_819021 ?auto_819020 ) ( ON ?auto_819022 ?auto_819021 ) ( not ( = ?auto_819020 ?auto_819021 ) ) ( not ( = ?auto_819020 ?auto_819022 ) ) ( not ( = ?auto_819020 ?auto_819023 ) ) ( not ( = ?auto_819020 ?auto_819024 ) ) ( not ( = ?auto_819020 ?auto_819025 ) ) ( not ( = ?auto_819021 ?auto_819022 ) ) ( not ( = ?auto_819021 ?auto_819023 ) ) ( not ( = ?auto_819021 ?auto_819024 ) ) ( not ( = ?auto_819021 ?auto_819025 ) ) ( not ( = ?auto_819022 ?auto_819023 ) ) ( not ( = ?auto_819022 ?auto_819024 ) ) ( not ( = ?auto_819022 ?auto_819025 ) ) ( not ( = ?auto_819023 ?auto_819024 ) ) ( not ( = ?auto_819023 ?auto_819025 ) ) ( not ( = ?auto_819024 ?auto_819025 ) ) ( CLEAR ?auto_819022 ) ( ON ?auto_819023 ?auto_819024 ) ( CLEAR ?auto_819023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_819020 ?auto_819021 ?auto_819022 ?auto_819023 )
      ( MAKE-5PILE ?auto_819020 ?auto_819021 ?auto_819022 ?auto_819023 ?auto_819024 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_819042 - BLOCK
      ?auto_819043 - BLOCK
      ?auto_819044 - BLOCK
      ?auto_819045 - BLOCK
      ?auto_819046 - BLOCK
    )
    :vars
    (
      ?auto_819047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819046 ?auto_819047 ) ( ON-TABLE ?auto_819042 ) ( ON ?auto_819043 ?auto_819042 ) ( not ( = ?auto_819042 ?auto_819043 ) ) ( not ( = ?auto_819042 ?auto_819044 ) ) ( not ( = ?auto_819042 ?auto_819045 ) ) ( not ( = ?auto_819042 ?auto_819046 ) ) ( not ( = ?auto_819042 ?auto_819047 ) ) ( not ( = ?auto_819043 ?auto_819044 ) ) ( not ( = ?auto_819043 ?auto_819045 ) ) ( not ( = ?auto_819043 ?auto_819046 ) ) ( not ( = ?auto_819043 ?auto_819047 ) ) ( not ( = ?auto_819044 ?auto_819045 ) ) ( not ( = ?auto_819044 ?auto_819046 ) ) ( not ( = ?auto_819044 ?auto_819047 ) ) ( not ( = ?auto_819045 ?auto_819046 ) ) ( not ( = ?auto_819045 ?auto_819047 ) ) ( not ( = ?auto_819046 ?auto_819047 ) ) ( ON ?auto_819045 ?auto_819046 ) ( CLEAR ?auto_819043 ) ( ON ?auto_819044 ?auto_819045 ) ( CLEAR ?auto_819044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_819042 ?auto_819043 ?auto_819044 )
      ( MAKE-5PILE ?auto_819042 ?auto_819043 ?auto_819044 ?auto_819045 ?auto_819046 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_819064 - BLOCK
      ?auto_819065 - BLOCK
      ?auto_819066 - BLOCK
      ?auto_819067 - BLOCK
      ?auto_819068 - BLOCK
    )
    :vars
    (
      ?auto_819069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819068 ?auto_819069 ) ( ON-TABLE ?auto_819064 ) ( not ( = ?auto_819064 ?auto_819065 ) ) ( not ( = ?auto_819064 ?auto_819066 ) ) ( not ( = ?auto_819064 ?auto_819067 ) ) ( not ( = ?auto_819064 ?auto_819068 ) ) ( not ( = ?auto_819064 ?auto_819069 ) ) ( not ( = ?auto_819065 ?auto_819066 ) ) ( not ( = ?auto_819065 ?auto_819067 ) ) ( not ( = ?auto_819065 ?auto_819068 ) ) ( not ( = ?auto_819065 ?auto_819069 ) ) ( not ( = ?auto_819066 ?auto_819067 ) ) ( not ( = ?auto_819066 ?auto_819068 ) ) ( not ( = ?auto_819066 ?auto_819069 ) ) ( not ( = ?auto_819067 ?auto_819068 ) ) ( not ( = ?auto_819067 ?auto_819069 ) ) ( not ( = ?auto_819068 ?auto_819069 ) ) ( ON ?auto_819067 ?auto_819068 ) ( ON ?auto_819066 ?auto_819067 ) ( CLEAR ?auto_819064 ) ( ON ?auto_819065 ?auto_819066 ) ( CLEAR ?auto_819065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_819064 ?auto_819065 )
      ( MAKE-5PILE ?auto_819064 ?auto_819065 ?auto_819066 ?auto_819067 ?auto_819068 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_819086 - BLOCK
      ?auto_819087 - BLOCK
      ?auto_819088 - BLOCK
      ?auto_819089 - BLOCK
      ?auto_819090 - BLOCK
    )
    :vars
    (
      ?auto_819091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819090 ?auto_819091 ) ( not ( = ?auto_819086 ?auto_819087 ) ) ( not ( = ?auto_819086 ?auto_819088 ) ) ( not ( = ?auto_819086 ?auto_819089 ) ) ( not ( = ?auto_819086 ?auto_819090 ) ) ( not ( = ?auto_819086 ?auto_819091 ) ) ( not ( = ?auto_819087 ?auto_819088 ) ) ( not ( = ?auto_819087 ?auto_819089 ) ) ( not ( = ?auto_819087 ?auto_819090 ) ) ( not ( = ?auto_819087 ?auto_819091 ) ) ( not ( = ?auto_819088 ?auto_819089 ) ) ( not ( = ?auto_819088 ?auto_819090 ) ) ( not ( = ?auto_819088 ?auto_819091 ) ) ( not ( = ?auto_819089 ?auto_819090 ) ) ( not ( = ?auto_819089 ?auto_819091 ) ) ( not ( = ?auto_819090 ?auto_819091 ) ) ( ON ?auto_819089 ?auto_819090 ) ( ON ?auto_819088 ?auto_819089 ) ( ON ?auto_819087 ?auto_819088 ) ( ON ?auto_819086 ?auto_819087 ) ( CLEAR ?auto_819086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_819086 )
      ( MAKE-5PILE ?auto_819086 ?auto_819087 ?auto_819088 ?auto_819089 ?auto_819090 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_819109 - BLOCK
      ?auto_819110 - BLOCK
      ?auto_819111 - BLOCK
      ?auto_819112 - BLOCK
      ?auto_819113 - BLOCK
      ?auto_819114 - BLOCK
    )
    :vars
    (
      ?auto_819115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_819113 ) ( ON ?auto_819114 ?auto_819115 ) ( CLEAR ?auto_819114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_819109 ) ( ON ?auto_819110 ?auto_819109 ) ( ON ?auto_819111 ?auto_819110 ) ( ON ?auto_819112 ?auto_819111 ) ( ON ?auto_819113 ?auto_819112 ) ( not ( = ?auto_819109 ?auto_819110 ) ) ( not ( = ?auto_819109 ?auto_819111 ) ) ( not ( = ?auto_819109 ?auto_819112 ) ) ( not ( = ?auto_819109 ?auto_819113 ) ) ( not ( = ?auto_819109 ?auto_819114 ) ) ( not ( = ?auto_819109 ?auto_819115 ) ) ( not ( = ?auto_819110 ?auto_819111 ) ) ( not ( = ?auto_819110 ?auto_819112 ) ) ( not ( = ?auto_819110 ?auto_819113 ) ) ( not ( = ?auto_819110 ?auto_819114 ) ) ( not ( = ?auto_819110 ?auto_819115 ) ) ( not ( = ?auto_819111 ?auto_819112 ) ) ( not ( = ?auto_819111 ?auto_819113 ) ) ( not ( = ?auto_819111 ?auto_819114 ) ) ( not ( = ?auto_819111 ?auto_819115 ) ) ( not ( = ?auto_819112 ?auto_819113 ) ) ( not ( = ?auto_819112 ?auto_819114 ) ) ( not ( = ?auto_819112 ?auto_819115 ) ) ( not ( = ?auto_819113 ?auto_819114 ) ) ( not ( = ?auto_819113 ?auto_819115 ) ) ( not ( = ?auto_819114 ?auto_819115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_819114 ?auto_819115 )
      ( !STACK ?auto_819114 ?auto_819113 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_819135 - BLOCK
      ?auto_819136 - BLOCK
      ?auto_819137 - BLOCK
      ?auto_819138 - BLOCK
      ?auto_819139 - BLOCK
      ?auto_819140 - BLOCK
    )
    :vars
    (
      ?auto_819141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819140 ?auto_819141 ) ( ON-TABLE ?auto_819135 ) ( ON ?auto_819136 ?auto_819135 ) ( ON ?auto_819137 ?auto_819136 ) ( ON ?auto_819138 ?auto_819137 ) ( not ( = ?auto_819135 ?auto_819136 ) ) ( not ( = ?auto_819135 ?auto_819137 ) ) ( not ( = ?auto_819135 ?auto_819138 ) ) ( not ( = ?auto_819135 ?auto_819139 ) ) ( not ( = ?auto_819135 ?auto_819140 ) ) ( not ( = ?auto_819135 ?auto_819141 ) ) ( not ( = ?auto_819136 ?auto_819137 ) ) ( not ( = ?auto_819136 ?auto_819138 ) ) ( not ( = ?auto_819136 ?auto_819139 ) ) ( not ( = ?auto_819136 ?auto_819140 ) ) ( not ( = ?auto_819136 ?auto_819141 ) ) ( not ( = ?auto_819137 ?auto_819138 ) ) ( not ( = ?auto_819137 ?auto_819139 ) ) ( not ( = ?auto_819137 ?auto_819140 ) ) ( not ( = ?auto_819137 ?auto_819141 ) ) ( not ( = ?auto_819138 ?auto_819139 ) ) ( not ( = ?auto_819138 ?auto_819140 ) ) ( not ( = ?auto_819138 ?auto_819141 ) ) ( not ( = ?auto_819139 ?auto_819140 ) ) ( not ( = ?auto_819139 ?auto_819141 ) ) ( not ( = ?auto_819140 ?auto_819141 ) ) ( CLEAR ?auto_819138 ) ( ON ?auto_819139 ?auto_819140 ) ( CLEAR ?auto_819139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_819135 ?auto_819136 ?auto_819137 ?auto_819138 ?auto_819139 )
      ( MAKE-6PILE ?auto_819135 ?auto_819136 ?auto_819137 ?auto_819138 ?auto_819139 ?auto_819140 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_819161 - BLOCK
      ?auto_819162 - BLOCK
      ?auto_819163 - BLOCK
      ?auto_819164 - BLOCK
      ?auto_819165 - BLOCK
      ?auto_819166 - BLOCK
    )
    :vars
    (
      ?auto_819167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819166 ?auto_819167 ) ( ON-TABLE ?auto_819161 ) ( ON ?auto_819162 ?auto_819161 ) ( ON ?auto_819163 ?auto_819162 ) ( not ( = ?auto_819161 ?auto_819162 ) ) ( not ( = ?auto_819161 ?auto_819163 ) ) ( not ( = ?auto_819161 ?auto_819164 ) ) ( not ( = ?auto_819161 ?auto_819165 ) ) ( not ( = ?auto_819161 ?auto_819166 ) ) ( not ( = ?auto_819161 ?auto_819167 ) ) ( not ( = ?auto_819162 ?auto_819163 ) ) ( not ( = ?auto_819162 ?auto_819164 ) ) ( not ( = ?auto_819162 ?auto_819165 ) ) ( not ( = ?auto_819162 ?auto_819166 ) ) ( not ( = ?auto_819162 ?auto_819167 ) ) ( not ( = ?auto_819163 ?auto_819164 ) ) ( not ( = ?auto_819163 ?auto_819165 ) ) ( not ( = ?auto_819163 ?auto_819166 ) ) ( not ( = ?auto_819163 ?auto_819167 ) ) ( not ( = ?auto_819164 ?auto_819165 ) ) ( not ( = ?auto_819164 ?auto_819166 ) ) ( not ( = ?auto_819164 ?auto_819167 ) ) ( not ( = ?auto_819165 ?auto_819166 ) ) ( not ( = ?auto_819165 ?auto_819167 ) ) ( not ( = ?auto_819166 ?auto_819167 ) ) ( ON ?auto_819165 ?auto_819166 ) ( CLEAR ?auto_819163 ) ( ON ?auto_819164 ?auto_819165 ) ( CLEAR ?auto_819164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_819161 ?auto_819162 ?auto_819163 ?auto_819164 )
      ( MAKE-6PILE ?auto_819161 ?auto_819162 ?auto_819163 ?auto_819164 ?auto_819165 ?auto_819166 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_819187 - BLOCK
      ?auto_819188 - BLOCK
      ?auto_819189 - BLOCK
      ?auto_819190 - BLOCK
      ?auto_819191 - BLOCK
      ?auto_819192 - BLOCK
    )
    :vars
    (
      ?auto_819193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819192 ?auto_819193 ) ( ON-TABLE ?auto_819187 ) ( ON ?auto_819188 ?auto_819187 ) ( not ( = ?auto_819187 ?auto_819188 ) ) ( not ( = ?auto_819187 ?auto_819189 ) ) ( not ( = ?auto_819187 ?auto_819190 ) ) ( not ( = ?auto_819187 ?auto_819191 ) ) ( not ( = ?auto_819187 ?auto_819192 ) ) ( not ( = ?auto_819187 ?auto_819193 ) ) ( not ( = ?auto_819188 ?auto_819189 ) ) ( not ( = ?auto_819188 ?auto_819190 ) ) ( not ( = ?auto_819188 ?auto_819191 ) ) ( not ( = ?auto_819188 ?auto_819192 ) ) ( not ( = ?auto_819188 ?auto_819193 ) ) ( not ( = ?auto_819189 ?auto_819190 ) ) ( not ( = ?auto_819189 ?auto_819191 ) ) ( not ( = ?auto_819189 ?auto_819192 ) ) ( not ( = ?auto_819189 ?auto_819193 ) ) ( not ( = ?auto_819190 ?auto_819191 ) ) ( not ( = ?auto_819190 ?auto_819192 ) ) ( not ( = ?auto_819190 ?auto_819193 ) ) ( not ( = ?auto_819191 ?auto_819192 ) ) ( not ( = ?auto_819191 ?auto_819193 ) ) ( not ( = ?auto_819192 ?auto_819193 ) ) ( ON ?auto_819191 ?auto_819192 ) ( ON ?auto_819190 ?auto_819191 ) ( CLEAR ?auto_819188 ) ( ON ?auto_819189 ?auto_819190 ) ( CLEAR ?auto_819189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_819187 ?auto_819188 ?auto_819189 )
      ( MAKE-6PILE ?auto_819187 ?auto_819188 ?auto_819189 ?auto_819190 ?auto_819191 ?auto_819192 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_819213 - BLOCK
      ?auto_819214 - BLOCK
      ?auto_819215 - BLOCK
      ?auto_819216 - BLOCK
      ?auto_819217 - BLOCK
      ?auto_819218 - BLOCK
    )
    :vars
    (
      ?auto_819219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819218 ?auto_819219 ) ( ON-TABLE ?auto_819213 ) ( not ( = ?auto_819213 ?auto_819214 ) ) ( not ( = ?auto_819213 ?auto_819215 ) ) ( not ( = ?auto_819213 ?auto_819216 ) ) ( not ( = ?auto_819213 ?auto_819217 ) ) ( not ( = ?auto_819213 ?auto_819218 ) ) ( not ( = ?auto_819213 ?auto_819219 ) ) ( not ( = ?auto_819214 ?auto_819215 ) ) ( not ( = ?auto_819214 ?auto_819216 ) ) ( not ( = ?auto_819214 ?auto_819217 ) ) ( not ( = ?auto_819214 ?auto_819218 ) ) ( not ( = ?auto_819214 ?auto_819219 ) ) ( not ( = ?auto_819215 ?auto_819216 ) ) ( not ( = ?auto_819215 ?auto_819217 ) ) ( not ( = ?auto_819215 ?auto_819218 ) ) ( not ( = ?auto_819215 ?auto_819219 ) ) ( not ( = ?auto_819216 ?auto_819217 ) ) ( not ( = ?auto_819216 ?auto_819218 ) ) ( not ( = ?auto_819216 ?auto_819219 ) ) ( not ( = ?auto_819217 ?auto_819218 ) ) ( not ( = ?auto_819217 ?auto_819219 ) ) ( not ( = ?auto_819218 ?auto_819219 ) ) ( ON ?auto_819217 ?auto_819218 ) ( ON ?auto_819216 ?auto_819217 ) ( ON ?auto_819215 ?auto_819216 ) ( CLEAR ?auto_819213 ) ( ON ?auto_819214 ?auto_819215 ) ( CLEAR ?auto_819214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_819213 ?auto_819214 )
      ( MAKE-6PILE ?auto_819213 ?auto_819214 ?auto_819215 ?auto_819216 ?auto_819217 ?auto_819218 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_819239 - BLOCK
      ?auto_819240 - BLOCK
      ?auto_819241 - BLOCK
      ?auto_819242 - BLOCK
      ?auto_819243 - BLOCK
      ?auto_819244 - BLOCK
    )
    :vars
    (
      ?auto_819245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819244 ?auto_819245 ) ( not ( = ?auto_819239 ?auto_819240 ) ) ( not ( = ?auto_819239 ?auto_819241 ) ) ( not ( = ?auto_819239 ?auto_819242 ) ) ( not ( = ?auto_819239 ?auto_819243 ) ) ( not ( = ?auto_819239 ?auto_819244 ) ) ( not ( = ?auto_819239 ?auto_819245 ) ) ( not ( = ?auto_819240 ?auto_819241 ) ) ( not ( = ?auto_819240 ?auto_819242 ) ) ( not ( = ?auto_819240 ?auto_819243 ) ) ( not ( = ?auto_819240 ?auto_819244 ) ) ( not ( = ?auto_819240 ?auto_819245 ) ) ( not ( = ?auto_819241 ?auto_819242 ) ) ( not ( = ?auto_819241 ?auto_819243 ) ) ( not ( = ?auto_819241 ?auto_819244 ) ) ( not ( = ?auto_819241 ?auto_819245 ) ) ( not ( = ?auto_819242 ?auto_819243 ) ) ( not ( = ?auto_819242 ?auto_819244 ) ) ( not ( = ?auto_819242 ?auto_819245 ) ) ( not ( = ?auto_819243 ?auto_819244 ) ) ( not ( = ?auto_819243 ?auto_819245 ) ) ( not ( = ?auto_819244 ?auto_819245 ) ) ( ON ?auto_819243 ?auto_819244 ) ( ON ?auto_819242 ?auto_819243 ) ( ON ?auto_819241 ?auto_819242 ) ( ON ?auto_819240 ?auto_819241 ) ( ON ?auto_819239 ?auto_819240 ) ( CLEAR ?auto_819239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_819239 )
      ( MAKE-6PILE ?auto_819239 ?auto_819240 ?auto_819241 ?auto_819242 ?auto_819243 ?auto_819244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_819266 - BLOCK
      ?auto_819267 - BLOCK
      ?auto_819268 - BLOCK
      ?auto_819269 - BLOCK
      ?auto_819270 - BLOCK
      ?auto_819271 - BLOCK
      ?auto_819272 - BLOCK
    )
    :vars
    (
      ?auto_819273 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_819271 ) ( ON ?auto_819272 ?auto_819273 ) ( CLEAR ?auto_819272 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_819266 ) ( ON ?auto_819267 ?auto_819266 ) ( ON ?auto_819268 ?auto_819267 ) ( ON ?auto_819269 ?auto_819268 ) ( ON ?auto_819270 ?auto_819269 ) ( ON ?auto_819271 ?auto_819270 ) ( not ( = ?auto_819266 ?auto_819267 ) ) ( not ( = ?auto_819266 ?auto_819268 ) ) ( not ( = ?auto_819266 ?auto_819269 ) ) ( not ( = ?auto_819266 ?auto_819270 ) ) ( not ( = ?auto_819266 ?auto_819271 ) ) ( not ( = ?auto_819266 ?auto_819272 ) ) ( not ( = ?auto_819266 ?auto_819273 ) ) ( not ( = ?auto_819267 ?auto_819268 ) ) ( not ( = ?auto_819267 ?auto_819269 ) ) ( not ( = ?auto_819267 ?auto_819270 ) ) ( not ( = ?auto_819267 ?auto_819271 ) ) ( not ( = ?auto_819267 ?auto_819272 ) ) ( not ( = ?auto_819267 ?auto_819273 ) ) ( not ( = ?auto_819268 ?auto_819269 ) ) ( not ( = ?auto_819268 ?auto_819270 ) ) ( not ( = ?auto_819268 ?auto_819271 ) ) ( not ( = ?auto_819268 ?auto_819272 ) ) ( not ( = ?auto_819268 ?auto_819273 ) ) ( not ( = ?auto_819269 ?auto_819270 ) ) ( not ( = ?auto_819269 ?auto_819271 ) ) ( not ( = ?auto_819269 ?auto_819272 ) ) ( not ( = ?auto_819269 ?auto_819273 ) ) ( not ( = ?auto_819270 ?auto_819271 ) ) ( not ( = ?auto_819270 ?auto_819272 ) ) ( not ( = ?auto_819270 ?auto_819273 ) ) ( not ( = ?auto_819271 ?auto_819272 ) ) ( not ( = ?auto_819271 ?auto_819273 ) ) ( not ( = ?auto_819272 ?auto_819273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_819272 ?auto_819273 )
      ( !STACK ?auto_819272 ?auto_819271 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_819296 - BLOCK
      ?auto_819297 - BLOCK
      ?auto_819298 - BLOCK
      ?auto_819299 - BLOCK
      ?auto_819300 - BLOCK
      ?auto_819301 - BLOCK
      ?auto_819302 - BLOCK
    )
    :vars
    (
      ?auto_819303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819302 ?auto_819303 ) ( ON-TABLE ?auto_819296 ) ( ON ?auto_819297 ?auto_819296 ) ( ON ?auto_819298 ?auto_819297 ) ( ON ?auto_819299 ?auto_819298 ) ( ON ?auto_819300 ?auto_819299 ) ( not ( = ?auto_819296 ?auto_819297 ) ) ( not ( = ?auto_819296 ?auto_819298 ) ) ( not ( = ?auto_819296 ?auto_819299 ) ) ( not ( = ?auto_819296 ?auto_819300 ) ) ( not ( = ?auto_819296 ?auto_819301 ) ) ( not ( = ?auto_819296 ?auto_819302 ) ) ( not ( = ?auto_819296 ?auto_819303 ) ) ( not ( = ?auto_819297 ?auto_819298 ) ) ( not ( = ?auto_819297 ?auto_819299 ) ) ( not ( = ?auto_819297 ?auto_819300 ) ) ( not ( = ?auto_819297 ?auto_819301 ) ) ( not ( = ?auto_819297 ?auto_819302 ) ) ( not ( = ?auto_819297 ?auto_819303 ) ) ( not ( = ?auto_819298 ?auto_819299 ) ) ( not ( = ?auto_819298 ?auto_819300 ) ) ( not ( = ?auto_819298 ?auto_819301 ) ) ( not ( = ?auto_819298 ?auto_819302 ) ) ( not ( = ?auto_819298 ?auto_819303 ) ) ( not ( = ?auto_819299 ?auto_819300 ) ) ( not ( = ?auto_819299 ?auto_819301 ) ) ( not ( = ?auto_819299 ?auto_819302 ) ) ( not ( = ?auto_819299 ?auto_819303 ) ) ( not ( = ?auto_819300 ?auto_819301 ) ) ( not ( = ?auto_819300 ?auto_819302 ) ) ( not ( = ?auto_819300 ?auto_819303 ) ) ( not ( = ?auto_819301 ?auto_819302 ) ) ( not ( = ?auto_819301 ?auto_819303 ) ) ( not ( = ?auto_819302 ?auto_819303 ) ) ( CLEAR ?auto_819300 ) ( ON ?auto_819301 ?auto_819302 ) ( CLEAR ?auto_819301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_819296 ?auto_819297 ?auto_819298 ?auto_819299 ?auto_819300 ?auto_819301 )
      ( MAKE-7PILE ?auto_819296 ?auto_819297 ?auto_819298 ?auto_819299 ?auto_819300 ?auto_819301 ?auto_819302 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_819326 - BLOCK
      ?auto_819327 - BLOCK
      ?auto_819328 - BLOCK
      ?auto_819329 - BLOCK
      ?auto_819330 - BLOCK
      ?auto_819331 - BLOCK
      ?auto_819332 - BLOCK
    )
    :vars
    (
      ?auto_819333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819332 ?auto_819333 ) ( ON-TABLE ?auto_819326 ) ( ON ?auto_819327 ?auto_819326 ) ( ON ?auto_819328 ?auto_819327 ) ( ON ?auto_819329 ?auto_819328 ) ( not ( = ?auto_819326 ?auto_819327 ) ) ( not ( = ?auto_819326 ?auto_819328 ) ) ( not ( = ?auto_819326 ?auto_819329 ) ) ( not ( = ?auto_819326 ?auto_819330 ) ) ( not ( = ?auto_819326 ?auto_819331 ) ) ( not ( = ?auto_819326 ?auto_819332 ) ) ( not ( = ?auto_819326 ?auto_819333 ) ) ( not ( = ?auto_819327 ?auto_819328 ) ) ( not ( = ?auto_819327 ?auto_819329 ) ) ( not ( = ?auto_819327 ?auto_819330 ) ) ( not ( = ?auto_819327 ?auto_819331 ) ) ( not ( = ?auto_819327 ?auto_819332 ) ) ( not ( = ?auto_819327 ?auto_819333 ) ) ( not ( = ?auto_819328 ?auto_819329 ) ) ( not ( = ?auto_819328 ?auto_819330 ) ) ( not ( = ?auto_819328 ?auto_819331 ) ) ( not ( = ?auto_819328 ?auto_819332 ) ) ( not ( = ?auto_819328 ?auto_819333 ) ) ( not ( = ?auto_819329 ?auto_819330 ) ) ( not ( = ?auto_819329 ?auto_819331 ) ) ( not ( = ?auto_819329 ?auto_819332 ) ) ( not ( = ?auto_819329 ?auto_819333 ) ) ( not ( = ?auto_819330 ?auto_819331 ) ) ( not ( = ?auto_819330 ?auto_819332 ) ) ( not ( = ?auto_819330 ?auto_819333 ) ) ( not ( = ?auto_819331 ?auto_819332 ) ) ( not ( = ?auto_819331 ?auto_819333 ) ) ( not ( = ?auto_819332 ?auto_819333 ) ) ( ON ?auto_819331 ?auto_819332 ) ( CLEAR ?auto_819329 ) ( ON ?auto_819330 ?auto_819331 ) ( CLEAR ?auto_819330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_819326 ?auto_819327 ?auto_819328 ?auto_819329 ?auto_819330 )
      ( MAKE-7PILE ?auto_819326 ?auto_819327 ?auto_819328 ?auto_819329 ?auto_819330 ?auto_819331 ?auto_819332 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_819356 - BLOCK
      ?auto_819357 - BLOCK
      ?auto_819358 - BLOCK
      ?auto_819359 - BLOCK
      ?auto_819360 - BLOCK
      ?auto_819361 - BLOCK
      ?auto_819362 - BLOCK
    )
    :vars
    (
      ?auto_819363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819362 ?auto_819363 ) ( ON-TABLE ?auto_819356 ) ( ON ?auto_819357 ?auto_819356 ) ( ON ?auto_819358 ?auto_819357 ) ( not ( = ?auto_819356 ?auto_819357 ) ) ( not ( = ?auto_819356 ?auto_819358 ) ) ( not ( = ?auto_819356 ?auto_819359 ) ) ( not ( = ?auto_819356 ?auto_819360 ) ) ( not ( = ?auto_819356 ?auto_819361 ) ) ( not ( = ?auto_819356 ?auto_819362 ) ) ( not ( = ?auto_819356 ?auto_819363 ) ) ( not ( = ?auto_819357 ?auto_819358 ) ) ( not ( = ?auto_819357 ?auto_819359 ) ) ( not ( = ?auto_819357 ?auto_819360 ) ) ( not ( = ?auto_819357 ?auto_819361 ) ) ( not ( = ?auto_819357 ?auto_819362 ) ) ( not ( = ?auto_819357 ?auto_819363 ) ) ( not ( = ?auto_819358 ?auto_819359 ) ) ( not ( = ?auto_819358 ?auto_819360 ) ) ( not ( = ?auto_819358 ?auto_819361 ) ) ( not ( = ?auto_819358 ?auto_819362 ) ) ( not ( = ?auto_819358 ?auto_819363 ) ) ( not ( = ?auto_819359 ?auto_819360 ) ) ( not ( = ?auto_819359 ?auto_819361 ) ) ( not ( = ?auto_819359 ?auto_819362 ) ) ( not ( = ?auto_819359 ?auto_819363 ) ) ( not ( = ?auto_819360 ?auto_819361 ) ) ( not ( = ?auto_819360 ?auto_819362 ) ) ( not ( = ?auto_819360 ?auto_819363 ) ) ( not ( = ?auto_819361 ?auto_819362 ) ) ( not ( = ?auto_819361 ?auto_819363 ) ) ( not ( = ?auto_819362 ?auto_819363 ) ) ( ON ?auto_819361 ?auto_819362 ) ( ON ?auto_819360 ?auto_819361 ) ( CLEAR ?auto_819358 ) ( ON ?auto_819359 ?auto_819360 ) ( CLEAR ?auto_819359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_819356 ?auto_819357 ?auto_819358 ?auto_819359 )
      ( MAKE-7PILE ?auto_819356 ?auto_819357 ?auto_819358 ?auto_819359 ?auto_819360 ?auto_819361 ?auto_819362 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_819386 - BLOCK
      ?auto_819387 - BLOCK
      ?auto_819388 - BLOCK
      ?auto_819389 - BLOCK
      ?auto_819390 - BLOCK
      ?auto_819391 - BLOCK
      ?auto_819392 - BLOCK
    )
    :vars
    (
      ?auto_819393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819392 ?auto_819393 ) ( ON-TABLE ?auto_819386 ) ( ON ?auto_819387 ?auto_819386 ) ( not ( = ?auto_819386 ?auto_819387 ) ) ( not ( = ?auto_819386 ?auto_819388 ) ) ( not ( = ?auto_819386 ?auto_819389 ) ) ( not ( = ?auto_819386 ?auto_819390 ) ) ( not ( = ?auto_819386 ?auto_819391 ) ) ( not ( = ?auto_819386 ?auto_819392 ) ) ( not ( = ?auto_819386 ?auto_819393 ) ) ( not ( = ?auto_819387 ?auto_819388 ) ) ( not ( = ?auto_819387 ?auto_819389 ) ) ( not ( = ?auto_819387 ?auto_819390 ) ) ( not ( = ?auto_819387 ?auto_819391 ) ) ( not ( = ?auto_819387 ?auto_819392 ) ) ( not ( = ?auto_819387 ?auto_819393 ) ) ( not ( = ?auto_819388 ?auto_819389 ) ) ( not ( = ?auto_819388 ?auto_819390 ) ) ( not ( = ?auto_819388 ?auto_819391 ) ) ( not ( = ?auto_819388 ?auto_819392 ) ) ( not ( = ?auto_819388 ?auto_819393 ) ) ( not ( = ?auto_819389 ?auto_819390 ) ) ( not ( = ?auto_819389 ?auto_819391 ) ) ( not ( = ?auto_819389 ?auto_819392 ) ) ( not ( = ?auto_819389 ?auto_819393 ) ) ( not ( = ?auto_819390 ?auto_819391 ) ) ( not ( = ?auto_819390 ?auto_819392 ) ) ( not ( = ?auto_819390 ?auto_819393 ) ) ( not ( = ?auto_819391 ?auto_819392 ) ) ( not ( = ?auto_819391 ?auto_819393 ) ) ( not ( = ?auto_819392 ?auto_819393 ) ) ( ON ?auto_819391 ?auto_819392 ) ( ON ?auto_819390 ?auto_819391 ) ( ON ?auto_819389 ?auto_819390 ) ( CLEAR ?auto_819387 ) ( ON ?auto_819388 ?auto_819389 ) ( CLEAR ?auto_819388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_819386 ?auto_819387 ?auto_819388 )
      ( MAKE-7PILE ?auto_819386 ?auto_819387 ?auto_819388 ?auto_819389 ?auto_819390 ?auto_819391 ?auto_819392 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_819416 - BLOCK
      ?auto_819417 - BLOCK
      ?auto_819418 - BLOCK
      ?auto_819419 - BLOCK
      ?auto_819420 - BLOCK
      ?auto_819421 - BLOCK
      ?auto_819422 - BLOCK
    )
    :vars
    (
      ?auto_819423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819422 ?auto_819423 ) ( ON-TABLE ?auto_819416 ) ( not ( = ?auto_819416 ?auto_819417 ) ) ( not ( = ?auto_819416 ?auto_819418 ) ) ( not ( = ?auto_819416 ?auto_819419 ) ) ( not ( = ?auto_819416 ?auto_819420 ) ) ( not ( = ?auto_819416 ?auto_819421 ) ) ( not ( = ?auto_819416 ?auto_819422 ) ) ( not ( = ?auto_819416 ?auto_819423 ) ) ( not ( = ?auto_819417 ?auto_819418 ) ) ( not ( = ?auto_819417 ?auto_819419 ) ) ( not ( = ?auto_819417 ?auto_819420 ) ) ( not ( = ?auto_819417 ?auto_819421 ) ) ( not ( = ?auto_819417 ?auto_819422 ) ) ( not ( = ?auto_819417 ?auto_819423 ) ) ( not ( = ?auto_819418 ?auto_819419 ) ) ( not ( = ?auto_819418 ?auto_819420 ) ) ( not ( = ?auto_819418 ?auto_819421 ) ) ( not ( = ?auto_819418 ?auto_819422 ) ) ( not ( = ?auto_819418 ?auto_819423 ) ) ( not ( = ?auto_819419 ?auto_819420 ) ) ( not ( = ?auto_819419 ?auto_819421 ) ) ( not ( = ?auto_819419 ?auto_819422 ) ) ( not ( = ?auto_819419 ?auto_819423 ) ) ( not ( = ?auto_819420 ?auto_819421 ) ) ( not ( = ?auto_819420 ?auto_819422 ) ) ( not ( = ?auto_819420 ?auto_819423 ) ) ( not ( = ?auto_819421 ?auto_819422 ) ) ( not ( = ?auto_819421 ?auto_819423 ) ) ( not ( = ?auto_819422 ?auto_819423 ) ) ( ON ?auto_819421 ?auto_819422 ) ( ON ?auto_819420 ?auto_819421 ) ( ON ?auto_819419 ?auto_819420 ) ( ON ?auto_819418 ?auto_819419 ) ( CLEAR ?auto_819416 ) ( ON ?auto_819417 ?auto_819418 ) ( CLEAR ?auto_819417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_819416 ?auto_819417 )
      ( MAKE-7PILE ?auto_819416 ?auto_819417 ?auto_819418 ?auto_819419 ?auto_819420 ?auto_819421 ?auto_819422 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_819446 - BLOCK
      ?auto_819447 - BLOCK
      ?auto_819448 - BLOCK
      ?auto_819449 - BLOCK
      ?auto_819450 - BLOCK
      ?auto_819451 - BLOCK
      ?auto_819452 - BLOCK
    )
    :vars
    (
      ?auto_819453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819452 ?auto_819453 ) ( not ( = ?auto_819446 ?auto_819447 ) ) ( not ( = ?auto_819446 ?auto_819448 ) ) ( not ( = ?auto_819446 ?auto_819449 ) ) ( not ( = ?auto_819446 ?auto_819450 ) ) ( not ( = ?auto_819446 ?auto_819451 ) ) ( not ( = ?auto_819446 ?auto_819452 ) ) ( not ( = ?auto_819446 ?auto_819453 ) ) ( not ( = ?auto_819447 ?auto_819448 ) ) ( not ( = ?auto_819447 ?auto_819449 ) ) ( not ( = ?auto_819447 ?auto_819450 ) ) ( not ( = ?auto_819447 ?auto_819451 ) ) ( not ( = ?auto_819447 ?auto_819452 ) ) ( not ( = ?auto_819447 ?auto_819453 ) ) ( not ( = ?auto_819448 ?auto_819449 ) ) ( not ( = ?auto_819448 ?auto_819450 ) ) ( not ( = ?auto_819448 ?auto_819451 ) ) ( not ( = ?auto_819448 ?auto_819452 ) ) ( not ( = ?auto_819448 ?auto_819453 ) ) ( not ( = ?auto_819449 ?auto_819450 ) ) ( not ( = ?auto_819449 ?auto_819451 ) ) ( not ( = ?auto_819449 ?auto_819452 ) ) ( not ( = ?auto_819449 ?auto_819453 ) ) ( not ( = ?auto_819450 ?auto_819451 ) ) ( not ( = ?auto_819450 ?auto_819452 ) ) ( not ( = ?auto_819450 ?auto_819453 ) ) ( not ( = ?auto_819451 ?auto_819452 ) ) ( not ( = ?auto_819451 ?auto_819453 ) ) ( not ( = ?auto_819452 ?auto_819453 ) ) ( ON ?auto_819451 ?auto_819452 ) ( ON ?auto_819450 ?auto_819451 ) ( ON ?auto_819449 ?auto_819450 ) ( ON ?auto_819448 ?auto_819449 ) ( ON ?auto_819447 ?auto_819448 ) ( ON ?auto_819446 ?auto_819447 ) ( CLEAR ?auto_819446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_819446 )
      ( MAKE-7PILE ?auto_819446 ?auto_819447 ?auto_819448 ?auto_819449 ?auto_819450 ?auto_819451 ?auto_819452 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_819477 - BLOCK
      ?auto_819478 - BLOCK
      ?auto_819479 - BLOCK
      ?auto_819480 - BLOCK
      ?auto_819481 - BLOCK
      ?auto_819482 - BLOCK
      ?auto_819483 - BLOCK
      ?auto_819484 - BLOCK
    )
    :vars
    (
      ?auto_819485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_819483 ) ( ON ?auto_819484 ?auto_819485 ) ( CLEAR ?auto_819484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_819477 ) ( ON ?auto_819478 ?auto_819477 ) ( ON ?auto_819479 ?auto_819478 ) ( ON ?auto_819480 ?auto_819479 ) ( ON ?auto_819481 ?auto_819480 ) ( ON ?auto_819482 ?auto_819481 ) ( ON ?auto_819483 ?auto_819482 ) ( not ( = ?auto_819477 ?auto_819478 ) ) ( not ( = ?auto_819477 ?auto_819479 ) ) ( not ( = ?auto_819477 ?auto_819480 ) ) ( not ( = ?auto_819477 ?auto_819481 ) ) ( not ( = ?auto_819477 ?auto_819482 ) ) ( not ( = ?auto_819477 ?auto_819483 ) ) ( not ( = ?auto_819477 ?auto_819484 ) ) ( not ( = ?auto_819477 ?auto_819485 ) ) ( not ( = ?auto_819478 ?auto_819479 ) ) ( not ( = ?auto_819478 ?auto_819480 ) ) ( not ( = ?auto_819478 ?auto_819481 ) ) ( not ( = ?auto_819478 ?auto_819482 ) ) ( not ( = ?auto_819478 ?auto_819483 ) ) ( not ( = ?auto_819478 ?auto_819484 ) ) ( not ( = ?auto_819478 ?auto_819485 ) ) ( not ( = ?auto_819479 ?auto_819480 ) ) ( not ( = ?auto_819479 ?auto_819481 ) ) ( not ( = ?auto_819479 ?auto_819482 ) ) ( not ( = ?auto_819479 ?auto_819483 ) ) ( not ( = ?auto_819479 ?auto_819484 ) ) ( not ( = ?auto_819479 ?auto_819485 ) ) ( not ( = ?auto_819480 ?auto_819481 ) ) ( not ( = ?auto_819480 ?auto_819482 ) ) ( not ( = ?auto_819480 ?auto_819483 ) ) ( not ( = ?auto_819480 ?auto_819484 ) ) ( not ( = ?auto_819480 ?auto_819485 ) ) ( not ( = ?auto_819481 ?auto_819482 ) ) ( not ( = ?auto_819481 ?auto_819483 ) ) ( not ( = ?auto_819481 ?auto_819484 ) ) ( not ( = ?auto_819481 ?auto_819485 ) ) ( not ( = ?auto_819482 ?auto_819483 ) ) ( not ( = ?auto_819482 ?auto_819484 ) ) ( not ( = ?auto_819482 ?auto_819485 ) ) ( not ( = ?auto_819483 ?auto_819484 ) ) ( not ( = ?auto_819483 ?auto_819485 ) ) ( not ( = ?auto_819484 ?auto_819485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_819484 ?auto_819485 )
      ( !STACK ?auto_819484 ?auto_819483 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_819511 - BLOCK
      ?auto_819512 - BLOCK
      ?auto_819513 - BLOCK
      ?auto_819514 - BLOCK
      ?auto_819515 - BLOCK
      ?auto_819516 - BLOCK
      ?auto_819517 - BLOCK
      ?auto_819518 - BLOCK
    )
    :vars
    (
      ?auto_819519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819518 ?auto_819519 ) ( ON-TABLE ?auto_819511 ) ( ON ?auto_819512 ?auto_819511 ) ( ON ?auto_819513 ?auto_819512 ) ( ON ?auto_819514 ?auto_819513 ) ( ON ?auto_819515 ?auto_819514 ) ( ON ?auto_819516 ?auto_819515 ) ( not ( = ?auto_819511 ?auto_819512 ) ) ( not ( = ?auto_819511 ?auto_819513 ) ) ( not ( = ?auto_819511 ?auto_819514 ) ) ( not ( = ?auto_819511 ?auto_819515 ) ) ( not ( = ?auto_819511 ?auto_819516 ) ) ( not ( = ?auto_819511 ?auto_819517 ) ) ( not ( = ?auto_819511 ?auto_819518 ) ) ( not ( = ?auto_819511 ?auto_819519 ) ) ( not ( = ?auto_819512 ?auto_819513 ) ) ( not ( = ?auto_819512 ?auto_819514 ) ) ( not ( = ?auto_819512 ?auto_819515 ) ) ( not ( = ?auto_819512 ?auto_819516 ) ) ( not ( = ?auto_819512 ?auto_819517 ) ) ( not ( = ?auto_819512 ?auto_819518 ) ) ( not ( = ?auto_819512 ?auto_819519 ) ) ( not ( = ?auto_819513 ?auto_819514 ) ) ( not ( = ?auto_819513 ?auto_819515 ) ) ( not ( = ?auto_819513 ?auto_819516 ) ) ( not ( = ?auto_819513 ?auto_819517 ) ) ( not ( = ?auto_819513 ?auto_819518 ) ) ( not ( = ?auto_819513 ?auto_819519 ) ) ( not ( = ?auto_819514 ?auto_819515 ) ) ( not ( = ?auto_819514 ?auto_819516 ) ) ( not ( = ?auto_819514 ?auto_819517 ) ) ( not ( = ?auto_819514 ?auto_819518 ) ) ( not ( = ?auto_819514 ?auto_819519 ) ) ( not ( = ?auto_819515 ?auto_819516 ) ) ( not ( = ?auto_819515 ?auto_819517 ) ) ( not ( = ?auto_819515 ?auto_819518 ) ) ( not ( = ?auto_819515 ?auto_819519 ) ) ( not ( = ?auto_819516 ?auto_819517 ) ) ( not ( = ?auto_819516 ?auto_819518 ) ) ( not ( = ?auto_819516 ?auto_819519 ) ) ( not ( = ?auto_819517 ?auto_819518 ) ) ( not ( = ?auto_819517 ?auto_819519 ) ) ( not ( = ?auto_819518 ?auto_819519 ) ) ( CLEAR ?auto_819516 ) ( ON ?auto_819517 ?auto_819518 ) ( CLEAR ?auto_819517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_819511 ?auto_819512 ?auto_819513 ?auto_819514 ?auto_819515 ?auto_819516 ?auto_819517 )
      ( MAKE-8PILE ?auto_819511 ?auto_819512 ?auto_819513 ?auto_819514 ?auto_819515 ?auto_819516 ?auto_819517 ?auto_819518 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_819545 - BLOCK
      ?auto_819546 - BLOCK
      ?auto_819547 - BLOCK
      ?auto_819548 - BLOCK
      ?auto_819549 - BLOCK
      ?auto_819550 - BLOCK
      ?auto_819551 - BLOCK
      ?auto_819552 - BLOCK
    )
    :vars
    (
      ?auto_819553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819552 ?auto_819553 ) ( ON-TABLE ?auto_819545 ) ( ON ?auto_819546 ?auto_819545 ) ( ON ?auto_819547 ?auto_819546 ) ( ON ?auto_819548 ?auto_819547 ) ( ON ?auto_819549 ?auto_819548 ) ( not ( = ?auto_819545 ?auto_819546 ) ) ( not ( = ?auto_819545 ?auto_819547 ) ) ( not ( = ?auto_819545 ?auto_819548 ) ) ( not ( = ?auto_819545 ?auto_819549 ) ) ( not ( = ?auto_819545 ?auto_819550 ) ) ( not ( = ?auto_819545 ?auto_819551 ) ) ( not ( = ?auto_819545 ?auto_819552 ) ) ( not ( = ?auto_819545 ?auto_819553 ) ) ( not ( = ?auto_819546 ?auto_819547 ) ) ( not ( = ?auto_819546 ?auto_819548 ) ) ( not ( = ?auto_819546 ?auto_819549 ) ) ( not ( = ?auto_819546 ?auto_819550 ) ) ( not ( = ?auto_819546 ?auto_819551 ) ) ( not ( = ?auto_819546 ?auto_819552 ) ) ( not ( = ?auto_819546 ?auto_819553 ) ) ( not ( = ?auto_819547 ?auto_819548 ) ) ( not ( = ?auto_819547 ?auto_819549 ) ) ( not ( = ?auto_819547 ?auto_819550 ) ) ( not ( = ?auto_819547 ?auto_819551 ) ) ( not ( = ?auto_819547 ?auto_819552 ) ) ( not ( = ?auto_819547 ?auto_819553 ) ) ( not ( = ?auto_819548 ?auto_819549 ) ) ( not ( = ?auto_819548 ?auto_819550 ) ) ( not ( = ?auto_819548 ?auto_819551 ) ) ( not ( = ?auto_819548 ?auto_819552 ) ) ( not ( = ?auto_819548 ?auto_819553 ) ) ( not ( = ?auto_819549 ?auto_819550 ) ) ( not ( = ?auto_819549 ?auto_819551 ) ) ( not ( = ?auto_819549 ?auto_819552 ) ) ( not ( = ?auto_819549 ?auto_819553 ) ) ( not ( = ?auto_819550 ?auto_819551 ) ) ( not ( = ?auto_819550 ?auto_819552 ) ) ( not ( = ?auto_819550 ?auto_819553 ) ) ( not ( = ?auto_819551 ?auto_819552 ) ) ( not ( = ?auto_819551 ?auto_819553 ) ) ( not ( = ?auto_819552 ?auto_819553 ) ) ( ON ?auto_819551 ?auto_819552 ) ( CLEAR ?auto_819549 ) ( ON ?auto_819550 ?auto_819551 ) ( CLEAR ?auto_819550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_819545 ?auto_819546 ?auto_819547 ?auto_819548 ?auto_819549 ?auto_819550 )
      ( MAKE-8PILE ?auto_819545 ?auto_819546 ?auto_819547 ?auto_819548 ?auto_819549 ?auto_819550 ?auto_819551 ?auto_819552 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_819579 - BLOCK
      ?auto_819580 - BLOCK
      ?auto_819581 - BLOCK
      ?auto_819582 - BLOCK
      ?auto_819583 - BLOCK
      ?auto_819584 - BLOCK
      ?auto_819585 - BLOCK
      ?auto_819586 - BLOCK
    )
    :vars
    (
      ?auto_819587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819586 ?auto_819587 ) ( ON-TABLE ?auto_819579 ) ( ON ?auto_819580 ?auto_819579 ) ( ON ?auto_819581 ?auto_819580 ) ( ON ?auto_819582 ?auto_819581 ) ( not ( = ?auto_819579 ?auto_819580 ) ) ( not ( = ?auto_819579 ?auto_819581 ) ) ( not ( = ?auto_819579 ?auto_819582 ) ) ( not ( = ?auto_819579 ?auto_819583 ) ) ( not ( = ?auto_819579 ?auto_819584 ) ) ( not ( = ?auto_819579 ?auto_819585 ) ) ( not ( = ?auto_819579 ?auto_819586 ) ) ( not ( = ?auto_819579 ?auto_819587 ) ) ( not ( = ?auto_819580 ?auto_819581 ) ) ( not ( = ?auto_819580 ?auto_819582 ) ) ( not ( = ?auto_819580 ?auto_819583 ) ) ( not ( = ?auto_819580 ?auto_819584 ) ) ( not ( = ?auto_819580 ?auto_819585 ) ) ( not ( = ?auto_819580 ?auto_819586 ) ) ( not ( = ?auto_819580 ?auto_819587 ) ) ( not ( = ?auto_819581 ?auto_819582 ) ) ( not ( = ?auto_819581 ?auto_819583 ) ) ( not ( = ?auto_819581 ?auto_819584 ) ) ( not ( = ?auto_819581 ?auto_819585 ) ) ( not ( = ?auto_819581 ?auto_819586 ) ) ( not ( = ?auto_819581 ?auto_819587 ) ) ( not ( = ?auto_819582 ?auto_819583 ) ) ( not ( = ?auto_819582 ?auto_819584 ) ) ( not ( = ?auto_819582 ?auto_819585 ) ) ( not ( = ?auto_819582 ?auto_819586 ) ) ( not ( = ?auto_819582 ?auto_819587 ) ) ( not ( = ?auto_819583 ?auto_819584 ) ) ( not ( = ?auto_819583 ?auto_819585 ) ) ( not ( = ?auto_819583 ?auto_819586 ) ) ( not ( = ?auto_819583 ?auto_819587 ) ) ( not ( = ?auto_819584 ?auto_819585 ) ) ( not ( = ?auto_819584 ?auto_819586 ) ) ( not ( = ?auto_819584 ?auto_819587 ) ) ( not ( = ?auto_819585 ?auto_819586 ) ) ( not ( = ?auto_819585 ?auto_819587 ) ) ( not ( = ?auto_819586 ?auto_819587 ) ) ( ON ?auto_819585 ?auto_819586 ) ( ON ?auto_819584 ?auto_819585 ) ( CLEAR ?auto_819582 ) ( ON ?auto_819583 ?auto_819584 ) ( CLEAR ?auto_819583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_819579 ?auto_819580 ?auto_819581 ?auto_819582 ?auto_819583 )
      ( MAKE-8PILE ?auto_819579 ?auto_819580 ?auto_819581 ?auto_819582 ?auto_819583 ?auto_819584 ?auto_819585 ?auto_819586 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_819613 - BLOCK
      ?auto_819614 - BLOCK
      ?auto_819615 - BLOCK
      ?auto_819616 - BLOCK
      ?auto_819617 - BLOCK
      ?auto_819618 - BLOCK
      ?auto_819619 - BLOCK
      ?auto_819620 - BLOCK
    )
    :vars
    (
      ?auto_819621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819620 ?auto_819621 ) ( ON-TABLE ?auto_819613 ) ( ON ?auto_819614 ?auto_819613 ) ( ON ?auto_819615 ?auto_819614 ) ( not ( = ?auto_819613 ?auto_819614 ) ) ( not ( = ?auto_819613 ?auto_819615 ) ) ( not ( = ?auto_819613 ?auto_819616 ) ) ( not ( = ?auto_819613 ?auto_819617 ) ) ( not ( = ?auto_819613 ?auto_819618 ) ) ( not ( = ?auto_819613 ?auto_819619 ) ) ( not ( = ?auto_819613 ?auto_819620 ) ) ( not ( = ?auto_819613 ?auto_819621 ) ) ( not ( = ?auto_819614 ?auto_819615 ) ) ( not ( = ?auto_819614 ?auto_819616 ) ) ( not ( = ?auto_819614 ?auto_819617 ) ) ( not ( = ?auto_819614 ?auto_819618 ) ) ( not ( = ?auto_819614 ?auto_819619 ) ) ( not ( = ?auto_819614 ?auto_819620 ) ) ( not ( = ?auto_819614 ?auto_819621 ) ) ( not ( = ?auto_819615 ?auto_819616 ) ) ( not ( = ?auto_819615 ?auto_819617 ) ) ( not ( = ?auto_819615 ?auto_819618 ) ) ( not ( = ?auto_819615 ?auto_819619 ) ) ( not ( = ?auto_819615 ?auto_819620 ) ) ( not ( = ?auto_819615 ?auto_819621 ) ) ( not ( = ?auto_819616 ?auto_819617 ) ) ( not ( = ?auto_819616 ?auto_819618 ) ) ( not ( = ?auto_819616 ?auto_819619 ) ) ( not ( = ?auto_819616 ?auto_819620 ) ) ( not ( = ?auto_819616 ?auto_819621 ) ) ( not ( = ?auto_819617 ?auto_819618 ) ) ( not ( = ?auto_819617 ?auto_819619 ) ) ( not ( = ?auto_819617 ?auto_819620 ) ) ( not ( = ?auto_819617 ?auto_819621 ) ) ( not ( = ?auto_819618 ?auto_819619 ) ) ( not ( = ?auto_819618 ?auto_819620 ) ) ( not ( = ?auto_819618 ?auto_819621 ) ) ( not ( = ?auto_819619 ?auto_819620 ) ) ( not ( = ?auto_819619 ?auto_819621 ) ) ( not ( = ?auto_819620 ?auto_819621 ) ) ( ON ?auto_819619 ?auto_819620 ) ( ON ?auto_819618 ?auto_819619 ) ( ON ?auto_819617 ?auto_819618 ) ( CLEAR ?auto_819615 ) ( ON ?auto_819616 ?auto_819617 ) ( CLEAR ?auto_819616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_819613 ?auto_819614 ?auto_819615 ?auto_819616 )
      ( MAKE-8PILE ?auto_819613 ?auto_819614 ?auto_819615 ?auto_819616 ?auto_819617 ?auto_819618 ?auto_819619 ?auto_819620 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_819647 - BLOCK
      ?auto_819648 - BLOCK
      ?auto_819649 - BLOCK
      ?auto_819650 - BLOCK
      ?auto_819651 - BLOCK
      ?auto_819652 - BLOCK
      ?auto_819653 - BLOCK
      ?auto_819654 - BLOCK
    )
    :vars
    (
      ?auto_819655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819654 ?auto_819655 ) ( ON-TABLE ?auto_819647 ) ( ON ?auto_819648 ?auto_819647 ) ( not ( = ?auto_819647 ?auto_819648 ) ) ( not ( = ?auto_819647 ?auto_819649 ) ) ( not ( = ?auto_819647 ?auto_819650 ) ) ( not ( = ?auto_819647 ?auto_819651 ) ) ( not ( = ?auto_819647 ?auto_819652 ) ) ( not ( = ?auto_819647 ?auto_819653 ) ) ( not ( = ?auto_819647 ?auto_819654 ) ) ( not ( = ?auto_819647 ?auto_819655 ) ) ( not ( = ?auto_819648 ?auto_819649 ) ) ( not ( = ?auto_819648 ?auto_819650 ) ) ( not ( = ?auto_819648 ?auto_819651 ) ) ( not ( = ?auto_819648 ?auto_819652 ) ) ( not ( = ?auto_819648 ?auto_819653 ) ) ( not ( = ?auto_819648 ?auto_819654 ) ) ( not ( = ?auto_819648 ?auto_819655 ) ) ( not ( = ?auto_819649 ?auto_819650 ) ) ( not ( = ?auto_819649 ?auto_819651 ) ) ( not ( = ?auto_819649 ?auto_819652 ) ) ( not ( = ?auto_819649 ?auto_819653 ) ) ( not ( = ?auto_819649 ?auto_819654 ) ) ( not ( = ?auto_819649 ?auto_819655 ) ) ( not ( = ?auto_819650 ?auto_819651 ) ) ( not ( = ?auto_819650 ?auto_819652 ) ) ( not ( = ?auto_819650 ?auto_819653 ) ) ( not ( = ?auto_819650 ?auto_819654 ) ) ( not ( = ?auto_819650 ?auto_819655 ) ) ( not ( = ?auto_819651 ?auto_819652 ) ) ( not ( = ?auto_819651 ?auto_819653 ) ) ( not ( = ?auto_819651 ?auto_819654 ) ) ( not ( = ?auto_819651 ?auto_819655 ) ) ( not ( = ?auto_819652 ?auto_819653 ) ) ( not ( = ?auto_819652 ?auto_819654 ) ) ( not ( = ?auto_819652 ?auto_819655 ) ) ( not ( = ?auto_819653 ?auto_819654 ) ) ( not ( = ?auto_819653 ?auto_819655 ) ) ( not ( = ?auto_819654 ?auto_819655 ) ) ( ON ?auto_819653 ?auto_819654 ) ( ON ?auto_819652 ?auto_819653 ) ( ON ?auto_819651 ?auto_819652 ) ( ON ?auto_819650 ?auto_819651 ) ( CLEAR ?auto_819648 ) ( ON ?auto_819649 ?auto_819650 ) ( CLEAR ?auto_819649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_819647 ?auto_819648 ?auto_819649 )
      ( MAKE-8PILE ?auto_819647 ?auto_819648 ?auto_819649 ?auto_819650 ?auto_819651 ?auto_819652 ?auto_819653 ?auto_819654 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_819681 - BLOCK
      ?auto_819682 - BLOCK
      ?auto_819683 - BLOCK
      ?auto_819684 - BLOCK
      ?auto_819685 - BLOCK
      ?auto_819686 - BLOCK
      ?auto_819687 - BLOCK
      ?auto_819688 - BLOCK
    )
    :vars
    (
      ?auto_819689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819688 ?auto_819689 ) ( ON-TABLE ?auto_819681 ) ( not ( = ?auto_819681 ?auto_819682 ) ) ( not ( = ?auto_819681 ?auto_819683 ) ) ( not ( = ?auto_819681 ?auto_819684 ) ) ( not ( = ?auto_819681 ?auto_819685 ) ) ( not ( = ?auto_819681 ?auto_819686 ) ) ( not ( = ?auto_819681 ?auto_819687 ) ) ( not ( = ?auto_819681 ?auto_819688 ) ) ( not ( = ?auto_819681 ?auto_819689 ) ) ( not ( = ?auto_819682 ?auto_819683 ) ) ( not ( = ?auto_819682 ?auto_819684 ) ) ( not ( = ?auto_819682 ?auto_819685 ) ) ( not ( = ?auto_819682 ?auto_819686 ) ) ( not ( = ?auto_819682 ?auto_819687 ) ) ( not ( = ?auto_819682 ?auto_819688 ) ) ( not ( = ?auto_819682 ?auto_819689 ) ) ( not ( = ?auto_819683 ?auto_819684 ) ) ( not ( = ?auto_819683 ?auto_819685 ) ) ( not ( = ?auto_819683 ?auto_819686 ) ) ( not ( = ?auto_819683 ?auto_819687 ) ) ( not ( = ?auto_819683 ?auto_819688 ) ) ( not ( = ?auto_819683 ?auto_819689 ) ) ( not ( = ?auto_819684 ?auto_819685 ) ) ( not ( = ?auto_819684 ?auto_819686 ) ) ( not ( = ?auto_819684 ?auto_819687 ) ) ( not ( = ?auto_819684 ?auto_819688 ) ) ( not ( = ?auto_819684 ?auto_819689 ) ) ( not ( = ?auto_819685 ?auto_819686 ) ) ( not ( = ?auto_819685 ?auto_819687 ) ) ( not ( = ?auto_819685 ?auto_819688 ) ) ( not ( = ?auto_819685 ?auto_819689 ) ) ( not ( = ?auto_819686 ?auto_819687 ) ) ( not ( = ?auto_819686 ?auto_819688 ) ) ( not ( = ?auto_819686 ?auto_819689 ) ) ( not ( = ?auto_819687 ?auto_819688 ) ) ( not ( = ?auto_819687 ?auto_819689 ) ) ( not ( = ?auto_819688 ?auto_819689 ) ) ( ON ?auto_819687 ?auto_819688 ) ( ON ?auto_819686 ?auto_819687 ) ( ON ?auto_819685 ?auto_819686 ) ( ON ?auto_819684 ?auto_819685 ) ( ON ?auto_819683 ?auto_819684 ) ( CLEAR ?auto_819681 ) ( ON ?auto_819682 ?auto_819683 ) ( CLEAR ?auto_819682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_819681 ?auto_819682 )
      ( MAKE-8PILE ?auto_819681 ?auto_819682 ?auto_819683 ?auto_819684 ?auto_819685 ?auto_819686 ?auto_819687 ?auto_819688 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_819715 - BLOCK
      ?auto_819716 - BLOCK
      ?auto_819717 - BLOCK
      ?auto_819718 - BLOCK
      ?auto_819719 - BLOCK
      ?auto_819720 - BLOCK
      ?auto_819721 - BLOCK
      ?auto_819722 - BLOCK
    )
    :vars
    (
      ?auto_819723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819722 ?auto_819723 ) ( not ( = ?auto_819715 ?auto_819716 ) ) ( not ( = ?auto_819715 ?auto_819717 ) ) ( not ( = ?auto_819715 ?auto_819718 ) ) ( not ( = ?auto_819715 ?auto_819719 ) ) ( not ( = ?auto_819715 ?auto_819720 ) ) ( not ( = ?auto_819715 ?auto_819721 ) ) ( not ( = ?auto_819715 ?auto_819722 ) ) ( not ( = ?auto_819715 ?auto_819723 ) ) ( not ( = ?auto_819716 ?auto_819717 ) ) ( not ( = ?auto_819716 ?auto_819718 ) ) ( not ( = ?auto_819716 ?auto_819719 ) ) ( not ( = ?auto_819716 ?auto_819720 ) ) ( not ( = ?auto_819716 ?auto_819721 ) ) ( not ( = ?auto_819716 ?auto_819722 ) ) ( not ( = ?auto_819716 ?auto_819723 ) ) ( not ( = ?auto_819717 ?auto_819718 ) ) ( not ( = ?auto_819717 ?auto_819719 ) ) ( not ( = ?auto_819717 ?auto_819720 ) ) ( not ( = ?auto_819717 ?auto_819721 ) ) ( not ( = ?auto_819717 ?auto_819722 ) ) ( not ( = ?auto_819717 ?auto_819723 ) ) ( not ( = ?auto_819718 ?auto_819719 ) ) ( not ( = ?auto_819718 ?auto_819720 ) ) ( not ( = ?auto_819718 ?auto_819721 ) ) ( not ( = ?auto_819718 ?auto_819722 ) ) ( not ( = ?auto_819718 ?auto_819723 ) ) ( not ( = ?auto_819719 ?auto_819720 ) ) ( not ( = ?auto_819719 ?auto_819721 ) ) ( not ( = ?auto_819719 ?auto_819722 ) ) ( not ( = ?auto_819719 ?auto_819723 ) ) ( not ( = ?auto_819720 ?auto_819721 ) ) ( not ( = ?auto_819720 ?auto_819722 ) ) ( not ( = ?auto_819720 ?auto_819723 ) ) ( not ( = ?auto_819721 ?auto_819722 ) ) ( not ( = ?auto_819721 ?auto_819723 ) ) ( not ( = ?auto_819722 ?auto_819723 ) ) ( ON ?auto_819721 ?auto_819722 ) ( ON ?auto_819720 ?auto_819721 ) ( ON ?auto_819719 ?auto_819720 ) ( ON ?auto_819718 ?auto_819719 ) ( ON ?auto_819717 ?auto_819718 ) ( ON ?auto_819716 ?auto_819717 ) ( ON ?auto_819715 ?auto_819716 ) ( CLEAR ?auto_819715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_819715 )
      ( MAKE-8PILE ?auto_819715 ?auto_819716 ?auto_819717 ?auto_819718 ?auto_819719 ?auto_819720 ?auto_819721 ?auto_819722 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_819750 - BLOCK
      ?auto_819751 - BLOCK
      ?auto_819752 - BLOCK
      ?auto_819753 - BLOCK
      ?auto_819754 - BLOCK
      ?auto_819755 - BLOCK
      ?auto_819756 - BLOCK
      ?auto_819757 - BLOCK
      ?auto_819758 - BLOCK
    )
    :vars
    (
      ?auto_819759 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_819757 ) ( ON ?auto_819758 ?auto_819759 ) ( CLEAR ?auto_819758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_819750 ) ( ON ?auto_819751 ?auto_819750 ) ( ON ?auto_819752 ?auto_819751 ) ( ON ?auto_819753 ?auto_819752 ) ( ON ?auto_819754 ?auto_819753 ) ( ON ?auto_819755 ?auto_819754 ) ( ON ?auto_819756 ?auto_819755 ) ( ON ?auto_819757 ?auto_819756 ) ( not ( = ?auto_819750 ?auto_819751 ) ) ( not ( = ?auto_819750 ?auto_819752 ) ) ( not ( = ?auto_819750 ?auto_819753 ) ) ( not ( = ?auto_819750 ?auto_819754 ) ) ( not ( = ?auto_819750 ?auto_819755 ) ) ( not ( = ?auto_819750 ?auto_819756 ) ) ( not ( = ?auto_819750 ?auto_819757 ) ) ( not ( = ?auto_819750 ?auto_819758 ) ) ( not ( = ?auto_819750 ?auto_819759 ) ) ( not ( = ?auto_819751 ?auto_819752 ) ) ( not ( = ?auto_819751 ?auto_819753 ) ) ( not ( = ?auto_819751 ?auto_819754 ) ) ( not ( = ?auto_819751 ?auto_819755 ) ) ( not ( = ?auto_819751 ?auto_819756 ) ) ( not ( = ?auto_819751 ?auto_819757 ) ) ( not ( = ?auto_819751 ?auto_819758 ) ) ( not ( = ?auto_819751 ?auto_819759 ) ) ( not ( = ?auto_819752 ?auto_819753 ) ) ( not ( = ?auto_819752 ?auto_819754 ) ) ( not ( = ?auto_819752 ?auto_819755 ) ) ( not ( = ?auto_819752 ?auto_819756 ) ) ( not ( = ?auto_819752 ?auto_819757 ) ) ( not ( = ?auto_819752 ?auto_819758 ) ) ( not ( = ?auto_819752 ?auto_819759 ) ) ( not ( = ?auto_819753 ?auto_819754 ) ) ( not ( = ?auto_819753 ?auto_819755 ) ) ( not ( = ?auto_819753 ?auto_819756 ) ) ( not ( = ?auto_819753 ?auto_819757 ) ) ( not ( = ?auto_819753 ?auto_819758 ) ) ( not ( = ?auto_819753 ?auto_819759 ) ) ( not ( = ?auto_819754 ?auto_819755 ) ) ( not ( = ?auto_819754 ?auto_819756 ) ) ( not ( = ?auto_819754 ?auto_819757 ) ) ( not ( = ?auto_819754 ?auto_819758 ) ) ( not ( = ?auto_819754 ?auto_819759 ) ) ( not ( = ?auto_819755 ?auto_819756 ) ) ( not ( = ?auto_819755 ?auto_819757 ) ) ( not ( = ?auto_819755 ?auto_819758 ) ) ( not ( = ?auto_819755 ?auto_819759 ) ) ( not ( = ?auto_819756 ?auto_819757 ) ) ( not ( = ?auto_819756 ?auto_819758 ) ) ( not ( = ?auto_819756 ?auto_819759 ) ) ( not ( = ?auto_819757 ?auto_819758 ) ) ( not ( = ?auto_819757 ?auto_819759 ) ) ( not ( = ?auto_819758 ?auto_819759 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_819758 ?auto_819759 )
      ( !STACK ?auto_819758 ?auto_819757 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_819788 - BLOCK
      ?auto_819789 - BLOCK
      ?auto_819790 - BLOCK
      ?auto_819791 - BLOCK
      ?auto_819792 - BLOCK
      ?auto_819793 - BLOCK
      ?auto_819794 - BLOCK
      ?auto_819795 - BLOCK
      ?auto_819796 - BLOCK
    )
    :vars
    (
      ?auto_819797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819796 ?auto_819797 ) ( ON-TABLE ?auto_819788 ) ( ON ?auto_819789 ?auto_819788 ) ( ON ?auto_819790 ?auto_819789 ) ( ON ?auto_819791 ?auto_819790 ) ( ON ?auto_819792 ?auto_819791 ) ( ON ?auto_819793 ?auto_819792 ) ( ON ?auto_819794 ?auto_819793 ) ( not ( = ?auto_819788 ?auto_819789 ) ) ( not ( = ?auto_819788 ?auto_819790 ) ) ( not ( = ?auto_819788 ?auto_819791 ) ) ( not ( = ?auto_819788 ?auto_819792 ) ) ( not ( = ?auto_819788 ?auto_819793 ) ) ( not ( = ?auto_819788 ?auto_819794 ) ) ( not ( = ?auto_819788 ?auto_819795 ) ) ( not ( = ?auto_819788 ?auto_819796 ) ) ( not ( = ?auto_819788 ?auto_819797 ) ) ( not ( = ?auto_819789 ?auto_819790 ) ) ( not ( = ?auto_819789 ?auto_819791 ) ) ( not ( = ?auto_819789 ?auto_819792 ) ) ( not ( = ?auto_819789 ?auto_819793 ) ) ( not ( = ?auto_819789 ?auto_819794 ) ) ( not ( = ?auto_819789 ?auto_819795 ) ) ( not ( = ?auto_819789 ?auto_819796 ) ) ( not ( = ?auto_819789 ?auto_819797 ) ) ( not ( = ?auto_819790 ?auto_819791 ) ) ( not ( = ?auto_819790 ?auto_819792 ) ) ( not ( = ?auto_819790 ?auto_819793 ) ) ( not ( = ?auto_819790 ?auto_819794 ) ) ( not ( = ?auto_819790 ?auto_819795 ) ) ( not ( = ?auto_819790 ?auto_819796 ) ) ( not ( = ?auto_819790 ?auto_819797 ) ) ( not ( = ?auto_819791 ?auto_819792 ) ) ( not ( = ?auto_819791 ?auto_819793 ) ) ( not ( = ?auto_819791 ?auto_819794 ) ) ( not ( = ?auto_819791 ?auto_819795 ) ) ( not ( = ?auto_819791 ?auto_819796 ) ) ( not ( = ?auto_819791 ?auto_819797 ) ) ( not ( = ?auto_819792 ?auto_819793 ) ) ( not ( = ?auto_819792 ?auto_819794 ) ) ( not ( = ?auto_819792 ?auto_819795 ) ) ( not ( = ?auto_819792 ?auto_819796 ) ) ( not ( = ?auto_819792 ?auto_819797 ) ) ( not ( = ?auto_819793 ?auto_819794 ) ) ( not ( = ?auto_819793 ?auto_819795 ) ) ( not ( = ?auto_819793 ?auto_819796 ) ) ( not ( = ?auto_819793 ?auto_819797 ) ) ( not ( = ?auto_819794 ?auto_819795 ) ) ( not ( = ?auto_819794 ?auto_819796 ) ) ( not ( = ?auto_819794 ?auto_819797 ) ) ( not ( = ?auto_819795 ?auto_819796 ) ) ( not ( = ?auto_819795 ?auto_819797 ) ) ( not ( = ?auto_819796 ?auto_819797 ) ) ( CLEAR ?auto_819794 ) ( ON ?auto_819795 ?auto_819796 ) ( CLEAR ?auto_819795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_819788 ?auto_819789 ?auto_819790 ?auto_819791 ?auto_819792 ?auto_819793 ?auto_819794 ?auto_819795 )
      ( MAKE-9PILE ?auto_819788 ?auto_819789 ?auto_819790 ?auto_819791 ?auto_819792 ?auto_819793 ?auto_819794 ?auto_819795 ?auto_819796 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_819826 - BLOCK
      ?auto_819827 - BLOCK
      ?auto_819828 - BLOCK
      ?auto_819829 - BLOCK
      ?auto_819830 - BLOCK
      ?auto_819831 - BLOCK
      ?auto_819832 - BLOCK
      ?auto_819833 - BLOCK
      ?auto_819834 - BLOCK
    )
    :vars
    (
      ?auto_819835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819834 ?auto_819835 ) ( ON-TABLE ?auto_819826 ) ( ON ?auto_819827 ?auto_819826 ) ( ON ?auto_819828 ?auto_819827 ) ( ON ?auto_819829 ?auto_819828 ) ( ON ?auto_819830 ?auto_819829 ) ( ON ?auto_819831 ?auto_819830 ) ( not ( = ?auto_819826 ?auto_819827 ) ) ( not ( = ?auto_819826 ?auto_819828 ) ) ( not ( = ?auto_819826 ?auto_819829 ) ) ( not ( = ?auto_819826 ?auto_819830 ) ) ( not ( = ?auto_819826 ?auto_819831 ) ) ( not ( = ?auto_819826 ?auto_819832 ) ) ( not ( = ?auto_819826 ?auto_819833 ) ) ( not ( = ?auto_819826 ?auto_819834 ) ) ( not ( = ?auto_819826 ?auto_819835 ) ) ( not ( = ?auto_819827 ?auto_819828 ) ) ( not ( = ?auto_819827 ?auto_819829 ) ) ( not ( = ?auto_819827 ?auto_819830 ) ) ( not ( = ?auto_819827 ?auto_819831 ) ) ( not ( = ?auto_819827 ?auto_819832 ) ) ( not ( = ?auto_819827 ?auto_819833 ) ) ( not ( = ?auto_819827 ?auto_819834 ) ) ( not ( = ?auto_819827 ?auto_819835 ) ) ( not ( = ?auto_819828 ?auto_819829 ) ) ( not ( = ?auto_819828 ?auto_819830 ) ) ( not ( = ?auto_819828 ?auto_819831 ) ) ( not ( = ?auto_819828 ?auto_819832 ) ) ( not ( = ?auto_819828 ?auto_819833 ) ) ( not ( = ?auto_819828 ?auto_819834 ) ) ( not ( = ?auto_819828 ?auto_819835 ) ) ( not ( = ?auto_819829 ?auto_819830 ) ) ( not ( = ?auto_819829 ?auto_819831 ) ) ( not ( = ?auto_819829 ?auto_819832 ) ) ( not ( = ?auto_819829 ?auto_819833 ) ) ( not ( = ?auto_819829 ?auto_819834 ) ) ( not ( = ?auto_819829 ?auto_819835 ) ) ( not ( = ?auto_819830 ?auto_819831 ) ) ( not ( = ?auto_819830 ?auto_819832 ) ) ( not ( = ?auto_819830 ?auto_819833 ) ) ( not ( = ?auto_819830 ?auto_819834 ) ) ( not ( = ?auto_819830 ?auto_819835 ) ) ( not ( = ?auto_819831 ?auto_819832 ) ) ( not ( = ?auto_819831 ?auto_819833 ) ) ( not ( = ?auto_819831 ?auto_819834 ) ) ( not ( = ?auto_819831 ?auto_819835 ) ) ( not ( = ?auto_819832 ?auto_819833 ) ) ( not ( = ?auto_819832 ?auto_819834 ) ) ( not ( = ?auto_819832 ?auto_819835 ) ) ( not ( = ?auto_819833 ?auto_819834 ) ) ( not ( = ?auto_819833 ?auto_819835 ) ) ( not ( = ?auto_819834 ?auto_819835 ) ) ( ON ?auto_819833 ?auto_819834 ) ( CLEAR ?auto_819831 ) ( ON ?auto_819832 ?auto_819833 ) ( CLEAR ?auto_819832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_819826 ?auto_819827 ?auto_819828 ?auto_819829 ?auto_819830 ?auto_819831 ?auto_819832 )
      ( MAKE-9PILE ?auto_819826 ?auto_819827 ?auto_819828 ?auto_819829 ?auto_819830 ?auto_819831 ?auto_819832 ?auto_819833 ?auto_819834 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_819864 - BLOCK
      ?auto_819865 - BLOCK
      ?auto_819866 - BLOCK
      ?auto_819867 - BLOCK
      ?auto_819868 - BLOCK
      ?auto_819869 - BLOCK
      ?auto_819870 - BLOCK
      ?auto_819871 - BLOCK
      ?auto_819872 - BLOCK
    )
    :vars
    (
      ?auto_819873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819872 ?auto_819873 ) ( ON-TABLE ?auto_819864 ) ( ON ?auto_819865 ?auto_819864 ) ( ON ?auto_819866 ?auto_819865 ) ( ON ?auto_819867 ?auto_819866 ) ( ON ?auto_819868 ?auto_819867 ) ( not ( = ?auto_819864 ?auto_819865 ) ) ( not ( = ?auto_819864 ?auto_819866 ) ) ( not ( = ?auto_819864 ?auto_819867 ) ) ( not ( = ?auto_819864 ?auto_819868 ) ) ( not ( = ?auto_819864 ?auto_819869 ) ) ( not ( = ?auto_819864 ?auto_819870 ) ) ( not ( = ?auto_819864 ?auto_819871 ) ) ( not ( = ?auto_819864 ?auto_819872 ) ) ( not ( = ?auto_819864 ?auto_819873 ) ) ( not ( = ?auto_819865 ?auto_819866 ) ) ( not ( = ?auto_819865 ?auto_819867 ) ) ( not ( = ?auto_819865 ?auto_819868 ) ) ( not ( = ?auto_819865 ?auto_819869 ) ) ( not ( = ?auto_819865 ?auto_819870 ) ) ( not ( = ?auto_819865 ?auto_819871 ) ) ( not ( = ?auto_819865 ?auto_819872 ) ) ( not ( = ?auto_819865 ?auto_819873 ) ) ( not ( = ?auto_819866 ?auto_819867 ) ) ( not ( = ?auto_819866 ?auto_819868 ) ) ( not ( = ?auto_819866 ?auto_819869 ) ) ( not ( = ?auto_819866 ?auto_819870 ) ) ( not ( = ?auto_819866 ?auto_819871 ) ) ( not ( = ?auto_819866 ?auto_819872 ) ) ( not ( = ?auto_819866 ?auto_819873 ) ) ( not ( = ?auto_819867 ?auto_819868 ) ) ( not ( = ?auto_819867 ?auto_819869 ) ) ( not ( = ?auto_819867 ?auto_819870 ) ) ( not ( = ?auto_819867 ?auto_819871 ) ) ( not ( = ?auto_819867 ?auto_819872 ) ) ( not ( = ?auto_819867 ?auto_819873 ) ) ( not ( = ?auto_819868 ?auto_819869 ) ) ( not ( = ?auto_819868 ?auto_819870 ) ) ( not ( = ?auto_819868 ?auto_819871 ) ) ( not ( = ?auto_819868 ?auto_819872 ) ) ( not ( = ?auto_819868 ?auto_819873 ) ) ( not ( = ?auto_819869 ?auto_819870 ) ) ( not ( = ?auto_819869 ?auto_819871 ) ) ( not ( = ?auto_819869 ?auto_819872 ) ) ( not ( = ?auto_819869 ?auto_819873 ) ) ( not ( = ?auto_819870 ?auto_819871 ) ) ( not ( = ?auto_819870 ?auto_819872 ) ) ( not ( = ?auto_819870 ?auto_819873 ) ) ( not ( = ?auto_819871 ?auto_819872 ) ) ( not ( = ?auto_819871 ?auto_819873 ) ) ( not ( = ?auto_819872 ?auto_819873 ) ) ( ON ?auto_819871 ?auto_819872 ) ( ON ?auto_819870 ?auto_819871 ) ( CLEAR ?auto_819868 ) ( ON ?auto_819869 ?auto_819870 ) ( CLEAR ?auto_819869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_819864 ?auto_819865 ?auto_819866 ?auto_819867 ?auto_819868 ?auto_819869 )
      ( MAKE-9PILE ?auto_819864 ?auto_819865 ?auto_819866 ?auto_819867 ?auto_819868 ?auto_819869 ?auto_819870 ?auto_819871 ?auto_819872 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_819902 - BLOCK
      ?auto_819903 - BLOCK
      ?auto_819904 - BLOCK
      ?auto_819905 - BLOCK
      ?auto_819906 - BLOCK
      ?auto_819907 - BLOCK
      ?auto_819908 - BLOCK
      ?auto_819909 - BLOCK
      ?auto_819910 - BLOCK
    )
    :vars
    (
      ?auto_819911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819910 ?auto_819911 ) ( ON-TABLE ?auto_819902 ) ( ON ?auto_819903 ?auto_819902 ) ( ON ?auto_819904 ?auto_819903 ) ( ON ?auto_819905 ?auto_819904 ) ( not ( = ?auto_819902 ?auto_819903 ) ) ( not ( = ?auto_819902 ?auto_819904 ) ) ( not ( = ?auto_819902 ?auto_819905 ) ) ( not ( = ?auto_819902 ?auto_819906 ) ) ( not ( = ?auto_819902 ?auto_819907 ) ) ( not ( = ?auto_819902 ?auto_819908 ) ) ( not ( = ?auto_819902 ?auto_819909 ) ) ( not ( = ?auto_819902 ?auto_819910 ) ) ( not ( = ?auto_819902 ?auto_819911 ) ) ( not ( = ?auto_819903 ?auto_819904 ) ) ( not ( = ?auto_819903 ?auto_819905 ) ) ( not ( = ?auto_819903 ?auto_819906 ) ) ( not ( = ?auto_819903 ?auto_819907 ) ) ( not ( = ?auto_819903 ?auto_819908 ) ) ( not ( = ?auto_819903 ?auto_819909 ) ) ( not ( = ?auto_819903 ?auto_819910 ) ) ( not ( = ?auto_819903 ?auto_819911 ) ) ( not ( = ?auto_819904 ?auto_819905 ) ) ( not ( = ?auto_819904 ?auto_819906 ) ) ( not ( = ?auto_819904 ?auto_819907 ) ) ( not ( = ?auto_819904 ?auto_819908 ) ) ( not ( = ?auto_819904 ?auto_819909 ) ) ( not ( = ?auto_819904 ?auto_819910 ) ) ( not ( = ?auto_819904 ?auto_819911 ) ) ( not ( = ?auto_819905 ?auto_819906 ) ) ( not ( = ?auto_819905 ?auto_819907 ) ) ( not ( = ?auto_819905 ?auto_819908 ) ) ( not ( = ?auto_819905 ?auto_819909 ) ) ( not ( = ?auto_819905 ?auto_819910 ) ) ( not ( = ?auto_819905 ?auto_819911 ) ) ( not ( = ?auto_819906 ?auto_819907 ) ) ( not ( = ?auto_819906 ?auto_819908 ) ) ( not ( = ?auto_819906 ?auto_819909 ) ) ( not ( = ?auto_819906 ?auto_819910 ) ) ( not ( = ?auto_819906 ?auto_819911 ) ) ( not ( = ?auto_819907 ?auto_819908 ) ) ( not ( = ?auto_819907 ?auto_819909 ) ) ( not ( = ?auto_819907 ?auto_819910 ) ) ( not ( = ?auto_819907 ?auto_819911 ) ) ( not ( = ?auto_819908 ?auto_819909 ) ) ( not ( = ?auto_819908 ?auto_819910 ) ) ( not ( = ?auto_819908 ?auto_819911 ) ) ( not ( = ?auto_819909 ?auto_819910 ) ) ( not ( = ?auto_819909 ?auto_819911 ) ) ( not ( = ?auto_819910 ?auto_819911 ) ) ( ON ?auto_819909 ?auto_819910 ) ( ON ?auto_819908 ?auto_819909 ) ( ON ?auto_819907 ?auto_819908 ) ( CLEAR ?auto_819905 ) ( ON ?auto_819906 ?auto_819907 ) ( CLEAR ?auto_819906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_819902 ?auto_819903 ?auto_819904 ?auto_819905 ?auto_819906 )
      ( MAKE-9PILE ?auto_819902 ?auto_819903 ?auto_819904 ?auto_819905 ?auto_819906 ?auto_819907 ?auto_819908 ?auto_819909 ?auto_819910 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_819940 - BLOCK
      ?auto_819941 - BLOCK
      ?auto_819942 - BLOCK
      ?auto_819943 - BLOCK
      ?auto_819944 - BLOCK
      ?auto_819945 - BLOCK
      ?auto_819946 - BLOCK
      ?auto_819947 - BLOCK
      ?auto_819948 - BLOCK
    )
    :vars
    (
      ?auto_819949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819948 ?auto_819949 ) ( ON-TABLE ?auto_819940 ) ( ON ?auto_819941 ?auto_819940 ) ( ON ?auto_819942 ?auto_819941 ) ( not ( = ?auto_819940 ?auto_819941 ) ) ( not ( = ?auto_819940 ?auto_819942 ) ) ( not ( = ?auto_819940 ?auto_819943 ) ) ( not ( = ?auto_819940 ?auto_819944 ) ) ( not ( = ?auto_819940 ?auto_819945 ) ) ( not ( = ?auto_819940 ?auto_819946 ) ) ( not ( = ?auto_819940 ?auto_819947 ) ) ( not ( = ?auto_819940 ?auto_819948 ) ) ( not ( = ?auto_819940 ?auto_819949 ) ) ( not ( = ?auto_819941 ?auto_819942 ) ) ( not ( = ?auto_819941 ?auto_819943 ) ) ( not ( = ?auto_819941 ?auto_819944 ) ) ( not ( = ?auto_819941 ?auto_819945 ) ) ( not ( = ?auto_819941 ?auto_819946 ) ) ( not ( = ?auto_819941 ?auto_819947 ) ) ( not ( = ?auto_819941 ?auto_819948 ) ) ( not ( = ?auto_819941 ?auto_819949 ) ) ( not ( = ?auto_819942 ?auto_819943 ) ) ( not ( = ?auto_819942 ?auto_819944 ) ) ( not ( = ?auto_819942 ?auto_819945 ) ) ( not ( = ?auto_819942 ?auto_819946 ) ) ( not ( = ?auto_819942 ?auto_819947 ) ) ( not ( = ?auto_819942 ?auto_819948 ) ) ( not ( = ?auto_819942 ?auto_819949 ) ) ( not ( = ?auto_819943 ?auto_819944 ) ) ( not ( = ?auto_819943 ?auto_819945 ) ) ( not ( = ?auto_819943 ?auto_819946 ) ) ( not ( = ?auto_819943 ?auto_819947 ) ) ( not ( = ?auto_819943 ?auto_819948 ) ) ( not ( = ?auto_819943 ?auto_819949 ) ) ( not ( = ?auto_819944 ?auto_819945 ) ) ( not ( = ?auto_819944 ?auto_819946 ) ) ( not ( = ?auto_819944 ?auto_819947 ) ) ( not ( = ?auto_819944 ?auto_819948 ) ) ( not ( = ?auto_819944 ?auto_819949 ) ) ( not ( = ?auto_819945 ?auto_819946 ) ) ( not ( = ?auto_819945 ?auto_819947 ) ) ( not ( = ?auto_819945 ?auto_819948 ) ) ( not ( = ?auto_819945 ?auto_819949 ) ) ( not ( = ?auto_819946 ?auto_819947 ) ) ( not ( = ?auto_819946 ?auto_819948 ) ) ( not ( = ?auto_819946 ?auto_819949 ) ) ( not ( = ?auto_819947 ?auto_819948 ) ) ( not ( = ?auto_819947 ?auto_819949 ) ) ( not ( = ?auto_819948 ?auto_819949 ) ) ( ON ?auto_819947 ?auto_819948 ) ( ON ?auto_819946 ?auto_819947 ) ( ON ?auto_819945 ?auto_819946 ) ( ON ?auto_819944 ?auto_819945 ) ( CLEAR ?auto_819942 ) ( ON ?auto_819943 ?auto_819944 ) ( CLEAR ?auto_819943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_819940 ?auto_819941 ?auto_819942 ?auto_819943 )
      ( MAKE-9PILE ?auto_819940 ?auto_819941 ?auto_819942 ?auto_819943 ?auto_819944 ?auto_819945 ?auto_819946 ?auto_819947 ?auto_819948 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_819978 - BLOCK
      ?auto_819979 - BLOCK
      ?auto_819980 - BLOCK
      ?auto_819981 - BLOCK
      ?auto_819982 - BLOCK
      ?auto_819983 - BLOCK
      ?auto_819984 - BLOCK
      ?auto_819985 - BLOCK
      ?auto_819986 - BLOCK
    )
    :vars
    (
      ?auto_819987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_819986 ?auto_819987 ) ( ON-TABLE ?auto_819978 ) ( ON ?auto_819979 ?auto_819978 ) ( not ( = ?auto_819978 ?auto_819979 ) ) ( not ( = ?auto_819978 ?auto_819980 ) ) ( not ( = ?auto_819978 ?auto_819981 ) ) ( not ( = ?auto_819978 ?auto_819982 ) ) ( not ( = ?auto_819978 ?auto_819983 ) ) ( not ( = ?auto_819978 ?auto_819984 ) ) ( not ( = ?auto_819978 ?auto_819985 ) ) ( not ( = ?auto_819978 ?auto_819986 ) ) ( not ( = ?auto_819978 ?auto_819987 ) ) ( not ( = ?auto_819979 ?auto_819980 ) ) ( not ( = ?auto_819979 ?auto_819981 ) ) ( not ( = ?auto_819979 ?auto_819982 ) ) ( not ( = ?auto_819979 ?auto_819983 ) ) ( not ( = ?auto_819979 ?auto_819984 ) ) ( not ( = ?auto_819979 ?auto_819985 ) ) ( not ( = ?auto_819979 ?auto_819986 ) ) ( not ( = ?auto_819979 ?auto_819987 ) ) ( not ( = ?auto_819980 ?auto_819981 ) ) ( not ( = ?auto_819980 ?auto_819982 ) ) ( not ( = ?auto_819980 ?auto_819983 ) ) ( not ( = ?auto_819980 ?auto_819984 ) ) ( not ( = ?auto_819980 ?auto_819985 ) ) ( not ( = ?auto_819980 ?auto_819986 ) ) ( not ( = ?auto_819980 ?auto_819987 ) ) ( not ( = ?auto_819981 ?auto_819982 ) ) ( not ( = ?auto_819981 ?auto_819983 ) ) ( not ( = ?auto_819981 ?auto_819984 ) ) ( not ( = ?auto_819981 ?auto_819985 ) ) ( not ( = ?auto_819981 ?auto_819986 ) ) ( not ( = ?auto_819981 ?auto_819987 ) ) ( not ( = ?auto_819982 ?auto_819983 ) ) ( not ( = ?auto_819982 ?auto_819984 ) ) ( not ( = ?auto_819982 ?auto_819985 ) ) ( not ( = ?auto_819982 ?auto_819986 ) ) ( not ( = ?auto_819982 ?auto_819987 ) ) ( not ( = ?auto_819983 ?auto_819984 ) ) ( not ( = ?auto_819983 ?auto_819985 ) ) ( not ( = ?auto_819983 ?auto_819986 ) ) ( not ( = ?auto_819983 ?auto_819987 ) ) ( not ( = ?auto_819984 ?auto_819985 ) ) ( not ( = ?auto_819984 ?auto_819986 ) ) ( not ( = ?auto_819984 ?auto_819987 ) ) ( not ( = ?auto_819985 ?auto_819986 ) ) ( not ( = ?auto_819985 ?auto_819987 ) ) ( not ( = ?auto_819986 ?auto_819987 ) ) ( ON ?auto_819985 ?auto_819986 ) ( ON ?auto_819984 ?auto_819985 ) ( ON ?auto_819983 ?auto_819984 ) ( ON ?auto_819982 ?auto_819983 ) ( ON ?auto_819981 ?auto_819982 ) ( CLEAR ?auto_819979 ) ( ON ?auto_819980 ?auto_819981 ) ( CLEAR ?auto_819980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_819978 ?auto_819979 ?auto_819980 )
      ( MAKE-9PILE ?auto_819978 ?auto_819979 ?auto_819980 ?auto_819981 ?auto_819982 ?auto_819983 ?auto_819984 ?auto_819985 ?auto_819986 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_820016 - BLOCK
      ?auto_820017 - BLOCK
      ?auto_820018 - BLOCK
      ?auto_820019 - BLOCK
      ?auto_820020 - BLOCK
      ?auto_820021 - BLOCK
      ?auto_820022 - BLOCK
      ?auto_820023 - BLOCK
      ?auto_820024 - BLOCK
    )
    :vars
    (
      ?auto_820025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820024 ?auto_820025 ) ( ON-TABLE ?auto_820016 ) ( not ( = ?auto_820016 ?auto_820017 ) ) ( not ( = ?auto_820016 ?auto_820018 ) ) ( not ( = ?auto_820016 ?auto_820019 ) ) ( not ( = ?auto_820016 ?auto_820020 ) ) ( not ( = ?auto_820016 ?auto_820021 ) ) ( not ( = ?auto_820016 ?auto_820022 ) ) ( not ( = ?auto_820016 ?auto_820023 ) ) ( not ( = ?auto_820016 ?auto_820024 ) ) ( not ( = ?auto_820016 ?auto_820025 ) ) ( not ( = ?auto_820017 ?auto_820018 ) ) ( not ( = ?auto_820017 ?auto_820019 ) ) ( not ( = ?auto_820017 ?auto_820020 ) ) ( not ( = ?auto_820017 ?auto_820021 ) ) ( not ( = ?auto_820017 ?auto_820022 ) ) ( not ( = ?auto_820017 ?auto_820023 ) ) ( not ( = ?auto_820017 ?auto_820024 ) ) ( not ( = ?auto_820017 ?auto_820025 ) ) ( not ( = ?auto_820018 ?auto_820019 ) ) ( not ( = ?auto_820018 ?auto_820020 ) ) ( not ( = ?auto_820018 ?auto_820021 ) ) ( not ( = ?auto_820018 ?auto_820022 ) ) ( not ( = ?auto_820018 ?auto_820023 ) ) ( not ( = ?auto_820018 ?auto_820024 ) ) ( not ( = ?auto_820018 ?auto_820025 ) ) ( not ( = ?auto_820019 ?auto_820020 ) ) ( not ( = ?auto_820019 ?auto_820021 ) ) ( not ( = ?auto_820019 ?auto_820022 ) ) ( not ( = ?auto_820019 ?auto_820023 ) ) ( not ( = ?auto_820019 ?auto_820024 ) ) ( not ( = ?auto_820019 ?auto_820025 ) ) ( not ( = ?auto_820020 ?auto_820021 ) ) ( not ( = ?auto_820020 ?auto_820022 ) ) ( not ( = ?auto_820020 ?auto_820023 ) ) ( not ( = ?auto_820020 ?auto_820024 ) ) ( not ( = ?auto_820020 ?auto_820025 ) ) ( not ( = ?auto_820021 ?auto_820022 ) ) ( not ( = ?auto_820021 ?auto_820023 ) ) ( not ( = ?auto_820021 ?auto_820024 ) ) ( not ( = ?auto_820021 ?auto_820025 ) ) ( not ( = ?auto_820022 ?auto_820023 ) ) ( not ( = ?auto_820022 ?auto_820024 ) ) ( not ( = ?auto_820022 ?auto_820025 ) ) ( not ( = ?auto_820023 ?auto_820024 ) ) ( not ( = ?auto_820023 ?auto_820025 ) ) ( not ( = ?auto_820024 ?auto_820025 ) ) ( ON ?auto_820023 ?auto_820024 ) ( ON ?auto_820022 ?auto_820023 ) ( ON ?auto_820021 ?auto_820022 ) ( ON ?auto_820020 ?auto_820021 ) ( ON ?auto_820019 ?auto_820020 ) ( ON ?auto_820018 ?auto_820019 ) ( CLEAR ?auto_820016 ) ( ON ?auto_820017 ?auto_820018 ) ( CLEAR ?auto_820017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_820016 ?auto_820017 )
      ( MAKE-9PILE ?auto_820016 ?auto_820017 ?auto_820018 ?auto_820019 ?auto_820020 ?auto_820021 ?auto_820022 ?auto_820023 ?auto_820024 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_820054 - BLOCK
      ?auto_820055 - BLOCK
      ?auto_820056 - BLOCK
      ?auto_820057 - BLOCK
      ?auto_820058 - BLOCK
      ?auto_820059 - BLOCK
      ?auto_820060 - BLOCK
      ?auto_820061 - BLOCK
      ?auto_820062 - BLOCK
    )
    :vars
    (
      ?auto_820063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820062 ?auto_820063 ) ( not ( = ?auto_820054 ?auto_820055 ) ) ( not ( = ?auto_820054 ?auto_820056 ) ) ( not ( = ?auto_820054 ?auto_820057 ) ) ( not ( = ?auto_820054 ?auto_820058 ) ) ( not ( = ?auto_820054 ?auto_820059 ) ) ( not ( = ?auto_820054 ?auto_820060 ) ) ( not ( = ?auto_820054 ?auto_820061 ) ) ( not ( = ?auto_820054 ?auto_820062 ) ) ( not ( = ?auto_820054 ?auto_820063 ) ) ( not ( = ?auto_820055 ?auto_820056 ) ) ( not ( = ?auto_820055 ?auto_820057 ) ) ( not ( = ?auto_820055 ?auto_820058 ) ) ( not ( = ?auto_820055 ?auto_820059 ) ) ( not ( = ?auto_820055 ?auto_820060 ) ) ( not ( = ?auto_820055 ?auto_820061 ) ) ( not ( = ?auto_820055 ?auto_820062 ) ) ( not ( = ?auto_820055 ?auto_820063 ) ) ( not ( = ?auto_820056 ?auto_820057 ) ) ( not ( = ?auto_820056 ?auto_820058 ) ) ( not ( = ?auto_820056 ?auto_820059 ) ) ( not ( = ?auto_820056 ?auto_820060 ) ) ( not ( = ?auto_820056 ?auto_820061 ) ) ( not ( = ?auto_820056 ?auto_820062 ) ) ( not ( = ?auto_820056 ?auto_820063 ) ) ( not ( = ?auto_820057 ?auto_820058 ) ) ( not ( = ?auto_820057 ?auto_820059 ) ) ( not ( = ?auto_820057 ?auto_820060 ) ) ( not ( = ?auto_820057 ?auto_820061 ) ) ( not ( = ?auto_820057 ?auto_820062 ) ) ( not ( = ?auto_820057 ?auto_820063 ) ) ( not ( = ?auto_820058 ?auto_820059 ) ) ( not ( = ?auto_820058 ?auto_820060 ) ) ( not ( = ?auto_820058 ?auto_820061 ) ) ( not ( = ?auto_820058 ?auto_820062 ) ) ( not ( = ?auto_820058 ?auto_820063 ) ) ( not ( = ?auto_820059 ?auto_820060 ) ) ( not ( = ?auto_820059 ?auto_820061 ) ) ( not ( = ?auto_820059 ?auto_820062 ) ) ( not ( = ?auto_820059 ?auto_820063 ) ) ( not ( = ?auto_820060 ?auto_820061 ) ) ( not ( = ?auto_820060 ?auto_820062 ) ) ( not ( = ?auto_820060 ?auto_820063 ) ) ( not ( = ?auto_820061 ?auto_820062 ) ) ( not ( = ?auto_820061 ?auto_820063 ) ) ( not ( = ?auto_820062 ?auto_820063 ) ) ( ON ?auto_820061 ?auto_820062 ) ( ON ?auto_820060 ?auto_820061 ) ( ON ?auto_820059 ?auto_820060 ) ( ON ?auto_820058 ?auto_820059 ) ( ON ?auto_820057 ?auto_820058 ) ( ON ?auto_820056 ?auto_820057 ) ( ON ?auto_820055 ?auto_820056 ) ( ON ?auto_820054 ?auto_820055 ) ( CLEAR ?auto_820054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_820054 )
      ( MAKE-9PILE ?auto_820054 ?auto_820055 ?auto_820056 ?auto_820057 ?auto_820058 ?auto_820059 ?auto_820060 ?auto_820061 ?auto_820062 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_820093 - BLOCK
      ?auto_820094 - BLOCK
      ?auto_820095 - BLOCK
      ?auto_820096 - BLOCK
      ?auto_820097 - BLOCK
      ?auto_820098 - BLOCK
      ?auto_820099 - BLOCK
      ?auto_820100 - BLOCK
      ?auto_820101 - BLOCK
      ?auto_820102 - BLOCK
    )
    :vars
    (
      ?auto_820103 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_820101 ) ( ON ?auto_820102 ?auto_820103 ) ( CLEAR ?auto_820102 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_820093 ) ( ON ?auto_820094 ?auto_820093 ) ( ON ?auto_820095 ?auto_820094 ) ( ON ?auto_820096 ?auto_820095 ) ( ON ?auto_820097 ?auto_820096 ) ( ON ?auto_820098 ?auto_820097 ) ( ON ?auto_820099 ?auto_820098 ) ( ON ?auto_820100 ?auto_820099 ) ( ON ?auto_820101 ?auto_820100 ) ( not ( = ?auto_820093 ?auto_820094 ) ) ( not ( = ?auto_820093 ?auto_820095 ) ) ( not ( = ?auto_820093 ?auto_820096 ) ) ( not ( = ?auto_820093 ?auto_820097 ) ) ( not ( = ?auto_820093 ?auto_820098 ) ) ( not ( = ?auto_820093 ?auto_820099 ) ) ( not ( = ?auto_820093 ?auto_820100 ) ) ( not ( = ?auto_820093 ?auto_820101 ) ) ( not ( = ?auto_820093 ?auto_820102 ) ) ( not ( = ?auto_820093 ?auto_820103 ) ) ( not ( = ?auto_820094 ?auto_820095 ) ) ( not ( = ?auto_820094 ?auto_820096 ) ) ( not ( = ?auto_820094 ?auto_820097 ) ) ( not ( = ?auto_820094 ?auto_820098 ) ) ( not ( = ?auto_820094 ?auto_820099 ) ) ( not ( = ?auto_820094 ?auto_820100 ) ) ( not ( = ?auto_820094 ?auto_820101 ) ) ( not ( = ?auto_820094 ?auto_820102 ) ) ( not ( = ?auto_820094 ?auto_820103 ) ) ( not ( = ?auto_820095 ?auto_820096 ) ) ( not ( = ?auto_820095 ?auto_820097 ) ) ( not ( = ?auto_820095 ?auto_820098 ) ) ( not ( = ?auto_820095 ?auto_820099 ) ) ( not ( = ?auto_820095 ?auto_820100 ) ) ( not ( = ?auto_820095 ?auto_820101 ) ) ( not ( = ?auto_820095 ?auto_820102 ) ) ( not ( = ?auto_820095 ?auto_820103 ) ) ( not ( = ?auto_820096 ?auto_820097 ) ) ( not ( = ?auto_820096 ?auto_820098 ) ) ( not ( = ?auto_820096 ?auto_820099 ) ) ( not ( = ?auto_820096 ?auto_820100 ) ) ( not ( = ?auto_820096 ?auto_820101 ) ) ( not ( = ?auto_820096 ?auto_820102 ) ) ( not ( = ?auto_820096 ?auto_820103 ) ) ( not ( = ?auto_820097 ?auto_820098 ) ) ( not ( = ?auto_820097 ?auto_820099 ) ) ( not ( = ?auto_820097 ?auto_820100 ) ) ( not ( = ?auto_820097 ?auto_820101 ) ) ( not ( = ?auto_820097 ?auto_820102 ) ) ( not ( = ?auto_820097 ?auto_820103 ) ) ( not ( = ?auto_820098 ?auto_820099 ) ) ( not ( = ?auto_820098 ?auto_820100 ) ) ( not ( = ?auto_820098 ?auto_820101 ) ) ( not ( = ?auto_820098 ?auto_820102 ) ) ( not ( = ?auto_820098 ?auto_820103 ) ) ( not ( = ?auto_820099 ?auto_820100 ) ) ( not ( = ?auto_820099 ?auto_820101 ) ) ( not ( = ?auto_820099 ?auto_820102 ) ) ( not ( = ?auto_820099 ?auto_820103 ) ) ( not ( = ?auto_820100 ?auto_820101 ) ) ( not ( = ?auto_820100 ?auto_820102 ) ) ( not ( = ?auto_820100 ?auto_820103 ) ) ( not ( = ?auto_820101 ?auto_820102 ) ) ( not ( = ?auto_820101 ?auto_820103 ) ) ( not ( = ?auto_820102 ?auto_820103 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_820102 ?auto_820103 )
      ( !STACK ?auto_820102 ?auto_820101 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_820135 - BLOCK
      ?auto_820136 - BLOCK
      ?auto_820137 - BLOCK
      ?auto_820138 - BLOCK
      ?auto_820139 - BLOCK
      ?auto_820140 - BLOCK
      ?auto_820141 - BLOCK
      ?auto_820142 - BLOCK
      ?auto_820143 - BLOCK
      ?auto_820144 - BLOCK
    )
    :vars
    (
      ?auto_820145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820144 ?auto_820145 ) ( ON-TABLE ?auto_820135 ) ( ON ?auto_820136 ?auto_820135 ) ( ON ?auto_820137 ?auto_820136 ) ( ON ?auto_820138 ?auto_820137 ) ( ON ?auto_820139 ?auto_820138 ) ( ON ?auto_820140 ?auto_820139 ) ( ON ?auto_820141 ?auto_820140 ) ( ON ?auto_820142 ?auto_820141 ) ( not ( = ?auto_820135 ?auto_820136 ) ) ( not ( = ?auto_820135 ?auto_820137 ) ) ( not ( = ?auto_820135 ?auto_820138 ) ) ( not ( = ?auto_820135 ?auto_820139 ) ) ( not ( = ?auto_820135 ?auto_820140 ) ) ( not ( = ?auto_820135 ?auto_820141 ) ) ( not ( = ?auto_820135 ?auto_820142 ) ) ( not ( = ?auto_820135 ?auto_820143 ) ) ( not ( = ?auto_820135 ?auto_820144 ) ) ( not ( = ?auto_820135 ?auto_820145 ) ) ( not ( = ?auto_820136 ?auto_820137 ) ) ( not ( = ?auto_820136 ?auto_820138 ) ) ( not ( = ?auto_820136 ?auto_820139 ) ) ( not ( = ?auto_820136 ?auto_820140 ) ) ( not ( = ?auto_820136 ?auto_820141 ) ) ( not ( = ?auto_820136 ?auto_820142 ) ) ( not ( = ?auto_820136 ?auto_820143 ) ) ( not ( = ?auto_820136 ?auto_820144 ) ) ( not ( = ?auto_820136 ?auto_820145 ) ) ( not ( = ?auto_820137 ?auto_820138 ) ) ( not ( = ?auto_820137 ?auto_820139 ) ) ( not ( = ?auto_820137 ?auto_820140 ) ) ( not ( = ?auto_820137 ?auto_820141 ) ) ( not ( = ?auto_820137 ?auto_820142 ) ) ( not ( = ?auto_820137 ?auto_820143 ) ) ( not ( = ?auto_820137 ?auto_820144 ) ) ( not ( = ?auto_820137 ?auto_820145 ) ) ( not ( = ?auto_820138 ?auto_820139 ) ) ( not ( = ?auto_820138 ?auto_820140 ) ) ( not ( = ?auto_820138 ?auto_820141 ) ) ( not ( = ?auto_820138 ?auto_820142 ) ) ( not ( = ?auto_820138 ?auto_820143 ) ) ( not ( = ?auto_820138 ?auto_820144 ) ) ( not ( = ?auto_820138 ?auto_820145 ) ) ( not ( = ?auto_820139 ?auto_820140 ) ) ( not ( = ?auto_820139 ?auto_820141 ) ) ( not ( = ?auto_820139 ?auto_820142 ) ) ( not ( = ?auto_820139 ?auto_820143 ) ) ( not ( = ?auto_820139 ?auto_820144 ) ) ( not ( = ?auto_820139 ?auto_820145 ) ) ( not ( = ?auto_820140 ?auto_820141 ) ) ( not ( = ?auto_820140 ?auto_820142 ) ) ( not ( = ?auto_820140 ?auto_820143 ) ) ( not ( = ?auto_820140 ?auto_820144 ) ) ( not ( = ?auto_820140 ?auto_820145 ) ) ( not ( = ?auto_820141 ?auto_820142 ) ) ( not ( = ?auto_820141 ?auto_820143 ) ) ( not ( = ?auto_820141 ?auto_820144 ) ) ( not ( = ?auto_820141 ?auto_820145 ) ) ( not ( = ?auto_820142 ?auto_820143 ) ) ( not ( = ?auto_820142 ?auto_820144 ) ) ( not ( = ?auto_820142 ?auto_820145 ) ) ( not ( = ?auto_820143 ?auto_820144 ) ) ( not ( = ?auto_820143 ?auto_820145 ) ) ( not ( = ?auto_820144 ?auto_820145 ) ) ( CLEAR ?auto_820142 ) ( ON ?auto_820143 ?auto_820144 ) ( CLEAR ?auto_820143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_820135 ?auto_820136 ?auto_820137 ?auto_820138 ?auto_820139 ?auto_820140 ?auto_820141 ?auto_820142 ?auto_820143 )
      ( MAKE-10PILE ?auto_820135 ?auto_820136 ?auto_820137 ?auto_820138 ?auto_820139 ?auto_820140 ?auto_820141 ?auto_820142 ?auto_820143 ?auto_820144 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_820177 - BLOCK
      ?auto_820178 - BLOCK
      ?auto_820179 - BLOCK
      ?auto_820180 - BLOCK
      ?auto_820181 - BLOCK
      ?auto_820182 - BLOCK
      ?auto_820183 - BLOCK
      ?auto_820184 - BLOCK
      ?auto_820185 - BLOCK
      ?auto_820186 - BLOCK
    )
    :vars
    (
      ?auto_820187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820186 ?auto_820187 ) ( ON-TABLE ?auto_820177 ) ( ON ?auto_820178 ?auto_820177 ) ( ON ?auto_820179 ?auto_820178 ) ( ON ?auto_820180 ?auto_820179 ) ( ON ?auto_820181 ?auto_820180 ) ( ON ?auto_820182 ?auto_820181 ) ( ON ?auto_820183 ?auto_820182 ) ( not ( = ?auto_820177 ?auto_820178 ) ) ( not ( = ?auto_820177 ?auto_820179 ) ) ( not ( = ?auto_820177 ?auto_820180 ) ) ( not ( = ?auto_820177 ?auto_820181 ) ) ( not ( = ?auto_820177 ?auto_820182 ) ) ( not ( = ?auto_820177 ?auto_820183 ) ) ( not ( = ?auto_820177 ?auto_820184 ) ) ( not ( = ?auto_820177 ?auto_820185 ) ) ( not ( = ?auto_820177 ?auto_820186 ) ) ( not ( = ?auto_820177 ?auto_820187 ) ) ( not ( = ?auto_820178 ?auto_820179 ) ) ( not ( = ?auto_820178 ?auto_820180 ) ) ( not ( = ?auto_820178 ?auto_820181 ) ) ( not ( = ?auto_820178 ?auto_820182 ) ) ( not ( = ?auto_820178 ?auto_820183 ) ) ( not ( = ?auto_820178 ?auto_820184 ) ) ( not ( = ?auto_820178 ?auto_820185 ) ) ( not ( = ?auto_820178 ?auto_820186 ) ) ( not ( = ?auto_820178 ?auto_820187 ) ) ( not ( = ?auto_820179 ?auto_820180 ) ) ( not ( = ?auto_820179 ?auto_820181 ) ) ( not ( = ?auto_820179 ?auto_820182 ) ) ( not ( = ?auto_820179 ?auto_820183 ) ) ( not ( = ?auto_820179 ?auto_820184 ) ) ( not ( = ?auto_820179 ?auto_820185 ) ) ( not ( = ?auto_820179 ?auto_820186 ) ) ( not ( = ?auto_820179 ?auto_820187 ) ) ( not ( = ?auto_820180 ?auto_820181 ) ) ( not ( = ?auto_820180 ?auto_820182 ) ) ( not ( = ?auto_820180 ?auto_820183 ) ) ( not ( = ?auto_820180 ?auto_820184 ) ) ( not ( = ?auto_820180 ?auto_820185 ) ) ( not ( = ?auto_820180 ?auto_820186 ) ) ( not ( = ?auto_820180 ?auto_820187 ) ) ( not ( = ?auto_820181 ?auto_820182 ) ) ( not ( = ?auto_820181 ?auto_820183 ) ) ( not ( = ?auto_820181 ?auto_820184 ) ) ( not ( = ?auto_820181 ?auto_820185 ) ) ( not ( = ?auto_820181 ?auto_820186 ) ) ( not ( = ?auto_820181 ?auto_820187 ) ) ( not ( = ?auto_820182 ?auto_820183 ) ) ( not ( = ?auto_820182 ?auto_820184 ) ) ( not ( = ?auto_820182 ?auto_820185 ) ) ( not ( = ?auto_820182 ?auto_820186 ) ) ( not ( = ?auto_820182 ?auto_820187 ) ) ( not ( = ?auto_820183 ?auto_820184 ) ) ( not ( = ?auto_820183 ?auto_820185 ) ) ( not ( = ?auto_820183 ?auto_820186 ) ) ( not ( = ?auto_820183 ?auto_820187 ) ) ( not ( = ?auto_820184 ?auto_820185 ) ) ( not ( = ?auto_820184 ?auto_820186 ) ) ( not ( = ?auto_820184 ?auto_820187 ) ) ( not ( = ?auto_820185 ?auto_820186 ) ) ( not ( = ?auto_820185 ?auto_820187 ) ) ( not ( = ?auto_820186 ?auto_820187 ) ) ( ON ?auto_820185 ?auto_820186 ) ( CLEAR ?auto_820183 ) ( ON ?auto_820184 ?auto_820185 ) ( CLEAR ?auto_820184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_820177 ?auto_820178 ?auto_820179 ?auto_820180 ?auto_820181 ?auto_820182 ?auto_820183 ?auto_820184 )
      ( MAKE-10PILE ?auto_820177 ?auto_820178 ?auto_820179 ?auto_820180 ?auto_820181 ?auto_820182 ?auto_820183 ?auto_820184 ?auto_820185 ?auto_820186 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_820219 - BLOCK
      ?auto_820220 - BLOCK
      ?auto_820221 - BLOCK
      ?auto_820222 - BLOCK
      ?auto_820223 - BLOCK
      ?auto_820224 - BLOCK
      ?auto_820225 - BLOCK
      ?auto_820226 - BLOCK
      ?auto_820227 - BLOCK
      ?auto_820228 - BLOCK
    )
    :vars
    (
      ?auto_820229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820228 ?auto_820229 ) ( ON-TABLE ?auto_820219 ) ( ON ?auto_820220 ?auto_820219 ) ( ON ?auto_820221 ?auto_820220 ) ( ON ?auto_820222 ?auto_820221 ) ( ON ?auto_820223 ?auto_820222 ) ( ON ?auto_820224 ?auto_820223 ) ( not ( = ?auto_820219 ?auto_820220 ) ) ( not ( = ?auto_820219 ?auto_820221 ) ) ( not ( = ?auto_820219 ?auto_820222 ) ) ( not ( = ?auto_820219 ?auto_820223 ) ) ( not ( = ?auto_820219 ?auto_820224 ) ) ( not ( = ?auto_820219 ?auto_820225 ) ) ( not ( = ?auto_820219 ?auto_820226 ) ) ( not ( = ?auto_820219 ?auto_820227 ) ) ( not ( = ?auto_820219 ?auto_820228 ) ) ( not ( = ?auto_820219 ?auto_820229 ) ) ( not ( = ?auto_820220 ?auto_820221 ) ) ( not ( = ?auto_820220 ?auto_820222 ) ) ( not ( = ?auto_820220 ?auto_820223 ) ) ( not ( = ?auto_820220 ?auto_820224 ) ) ( not ( = ?auto_820220 ?auto_820225 ) ) ( not ( = ?auto_820220 ?auto_820226 ) ) ( not ( = ?auto_820220 ?auto_820227 ) ) ( not ( = ?auto_820220 ?auto_820228 ) ) ( not ( = ?auto_820220 ?auto_820229 ) ) ( not ( = ?auto_820221 ?auto_820222 ) ) ( not ( = ?auto_820221 ?auto_820223 ) ) ( not ( = ?auto_820221 ?auto_820224 ) ) ( not ( = ?auto_820221 ?auto_820225 ) ) ( not ( = ?auto_820221 ?auto_820226 ) ) ( not ( = ?auto_820221 ?auto_820227 ) ) ( not ( = ?auto_820221 ?auto_820228 ) ) ( not ( = ?auto_820221 ?auto_820229 ) ) ( not ( = ?auto_820222 ?auto_820223 ) ) ( not ( = ?auto_820222 ?auto_820224 ) ) ( not ( = ?auto_820222 ?auto_820225 ) ) ( not ( = ?auto_820222 ?auto_820226 ) ) ( not ( = ?auto_820222 ?auto_820227 ) ) ( not ( = ?auto_820222 ?auto_820228 ) ) ( not ( = ?auto_820222 ?auto_820229 ) ) ( not ( = ?auto_820223 ?auto_820224 ) ) ( not ( = ?auto_820223 ?auto_820225 ) ) ( not ( = ?auto_820223 ?auto_820226 ) ) ( not ( = ?auto_820223 ?auto_820227 ) ) ( not ( = ?auto_820223 ?auto_820228 ) ) ( not ( = ?auto_820223 ?auto_820229 ) ) ( not ( = ?auto_820224 ?auto_820225 ) ) ( not ( = ?auto_820224 ?auto_820226 ) ) ( not ( = ?auto_820224 ?auto_820227 ) ) ( not ( = ?auto_820224 ?auto_820228 ) ) ( not ( = ?auto_820224 ?auto_820229 ) ) ( not ( = ?auto_820225 ?auto_820226 ) ) ( not ( = ?auto_820225 ?auto_820227 ) ) ( not ( = ?auto_820225 ?auto_820228 ) ) ( not ( = ?auto_820225 ?auto_820229 ) ) ( not ( = ?auto_820226 ?auto_820227 ) ) ( not ( = ?auto_820226 ?auto_820228 ) ) ( not ( = ?auto_820226 ?auto_820229 ) ) ( not ( = ?auto_820227 ?auto_820228 ) ) ( not ( = ?auto_820227 ?auto_820229 ) ) ( not ( = ?auto_820228 ?auto_820229 ) ) ( ON ?auto_820227 ?auto_820228 ) ( ON ?auto_820226 ?auto_820227 ) ( CLEAR ?auto_820224 ) ( ON ?auto_820225 ?auto_820226 ) ( CLEAR ?auto_820225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_820219 ?auto_820220 ?auto_820221 ?auto_820222 ?auto_820223 ?auto_820224 ?auto_820225 )
      ( MAKE-10PILE ?auto_820219 ?auto_820220 ?auto_820221 ?auto_820222 ?auto_820223 ?auto_820224 ?auto_820225 ?auto_820226 ?auto_820227 ?auto_820228 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_820261 - BLOCK
      ?auto_820262 - BLOCK
      ?auto_820263 - BLOCK
      ?auto_820264 - BLOCK
      ?auto_820265 - BLOCK
      ?auto_820266 - BLOCK
      ?auto_820267 - BLOCK
      ?auto_820268 - BLOCK
      ?auto_820269 - BLOCK
      ?auto_820270 - BLOCK
    )
    :vars
    (
      ?auto_820271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820270 ?auto_820271 ) ( ON-TABLE ?auto_820261 ) ( ON ?auto_820262 ?auto_820261 ) ( ON ?auto_820263 ?auto_820262 ) ( ON ?auto_820264 ?auto_820263 ) ( ON ?auto_820265 ?auto_820264 ) ( not ( = ?auto_820261 ?auto_820262 ) ) ( not ( = ?auto_820261 ?auto_820263 ) ) ( not ( = ?auto_820261 ?auto_820264 ) ) ( not ( = ?auto_820261 ?auto_820265 ) ) ( not ( = ?auto_820261 ?auto_820266 ) ) ( not ( = ?auto_820261 ?auto_820267 ) ) ( not ( = ?auto_820261 ?auto_820268 ) ) ( not ( = ?auto_820261 ?auto_820269 ) ) ( not ( = ?auto_820261 ?auto_820270 ) ) ( not ( = ?auto_820261 ?auto_820271 ) ) ( not ( = ?auto_820262 ?auto_820263 ) ) ( not ( = ?auto_820262 ?auto_820264 ) ) ( not ( = ?auto_820262 ?auto_820265 ) ) ( not ( = ?auto_820262 ?auto_820266 ) ) ( not ( = ?auto_820262 ?auto_820267 ) ) ( not ( = ?auto_820262 ?auto_820268 ) ) ( not ( = ?auto_820262 ?auto_820269 ) ) ( not ( = ?auto_820262 ?auto_820270 ) ) ( not ( = ?auto_820262 ?auto_820271 ) ) ( not ( = ?auto_820263 ?auto_820264 ) ) ( not ( = ?auto_820263 ?auto_820265 ) ) ( not ( = ?auto_820263 ?auto_820266 ) ) ( not ( = ?auto_820263 ?auto_820267 ) ) ( not ( = ?auto_820263 ?auto_820268 ) ) ( not ( = ?auto_820263 ?auto_820269 ) ) ( not ( = ?auto_820263 ?auto_820270 ) ) ( not ( = ?auto_820263 ?auto_820271 ) ) ( not ( = ?auto_820264 ?auto_820265 ) ) ( not ( = ?auto_820264 ?auto_820266 ) ) ( not ( = ?auto_820264 ?auto_820267 ) ) ( not ( = ?auto_820264 ?auto_820268 ) ) ( not ( = ?auto_820264 ?auto_820269 ) ) ( not ( = ?auto_820264 ?auto_820270 ) ) ( not ( = ?auto_820264 ?auto_820271 ) ) ( not ( = ?auto_820265 ?auto_820266 ) ) ( not ( = ?auto_820265 ?auto_820267 ) ) ( not ( = ?auto_820265 ?auto_820268 ) ) ( not ( = ?auto_820265 ?auto_820269 ) ) ( not ( = ?auto_820265 ?auto_820270 ) ) ( not ( = ?auto_820265 ?auto_820271 ) ) ( not ( = ?auto_820266 ?auto_820267 ) ) ( not ( = ?auto_820266 ?auto_820268 ) ) ( not ( = ?auto_820266 ?auto_820269 ) ) ( not ( = ?auto_820266 ?auto_820270 ) ) ( not ( = ?auto_820266 ?auto_820271 ) ) ( not ( = ?auto_820267 ?auto_820268 ) ) ( not ( = ?auto_820267 ?auto_820269 ) ) ( not ( = ?auto_820267 ?auto_820270 ) ) ( not ( = ?auto_820267 ?auto_820271 ) ) ( not ( = ?auto_820268 ?auto_820269 ) ) ( not ( = ?auto_820268 ?auto_820270 ) ) ( not ( = ?auto_820268 ?auto_820271 ) ) ( not ( = ?auto_820269 ?auto_820270 ) ) ( not ( = ?auto_820269 ?auto_820271 ) ) ( not ( = ?auto_820270 ?auto_820271 ) ) ( ON ?auto_820269 ?auto_820270 ) ( ON ?auto_820268 ?auto_820269 ) ( ON ?auto_820267 ?auto_820268 ) ( CLEAR ?auto_820265 ) ( ON ?auto_820266 ?auto_820267 ) ( CLEAR ?auto_820266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_820261 ?auto_820262 ?auto_820263 ?auto_820264 ?auto_820265 ?auto_820266 )
      ( MAKE-10PILE ?auto_820261 ?auto_820262 ?auto_820263 ?auto_820264 ?auto_820265 ?auto_820266 ?auto_820267 ?auto_820268 ?auto_820269 ?auto_820270 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_820303 - BLOCK
      ?auto_820304 - BLOCK
      ?auto_820305 - BLOCK
      ?auto_820306 - BLOCK
      ?auto_820307 - BLOCK
      ?auto_820308 - BLOCK
      ?auto_820309 - BLOCK
      ?auto_820310 - BLOCK
      ?auto_820311 - BLOCK
      ?auto_820312 - BLOCK
    )
    :vars
    (
      ?auto_820313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820312 ?auto_820313 ) ( ON-TABLE ?auto_820303 ) ( ON ?auto_820304 ?auto_820303 ) ( ON ?auto_820305 ?auto_820304 ) ( ON ?auto_820306 ?auto_820305 ) ( not ( = ?auto_820303 ?auto_820304 ) ) ( not ( = ?auto_820303 ?auto_820305 ) ) ( not ( = ?auto_820303 ?auto_820306 ) ) ( not ( = ?auto_820303 ?auto_820307 ) ) ( not ( = ?auto_820303 ?auto_820308 ) ) ( not ( = ?auto_820303 ?auto_820309 ) ) ( not ( = ?auto_820303 ?auto_820310 ) ) ( not ( = ?auto_820303 ?auto_820311 ) ) ( not ( = ?auto_820303 ?auto_820312 ) ) ( not ( = ?auto_820303 ?auto_820313 ) ) ( not ( = ?auto_820304 ?auto_820305 ) ) ( not ( = ?auto_820304 ?auto_820306 ) ) ( not ( = ?auto_820304 ?auto_820307 ) ) ( not ( = ?auto_820304 ?auto_820308 ) ) ( not ( = ?auto_820304 ?auto_820309 ) ) ( not ( = ?auto_820304 ?auto_820310 ) ) ( not ( = ?auto_820304 ?auto_820311 ) ) ( not ( = ?auto_820304 ?auto_820312 ) ) ( not ( = ?auto_820304 ?auto_820313 ) ) ( not ( = ?auto_820305 ?auto_820306 ) ) ( not ( = ?auto_820305 ?auto_820307 ) ) ( not ( = ?auto_820305 ?auto_820308 ) ) ( not ( = ?auto_820305 ?auto_820309 ) ) ( not ( = ?auto_820305 ?auto_820310 ) ) ( not ( = ?auto_820305 ?auto_820311 ) ) ( not ( = ?auto_820305 ?auto_820312 ) ) ( not ( = ?auto_820305 ?auto_820313 ) ) ( not ( = ?auto_820306 ?auto_820307 ) ) ( not ( = ?auto_820306 ?auto_820308 ) ) ( not ( = ?auto_820306 ?auto_820309 ) ) ( not ( = ?auto_820306 ?auto_820310 ) ) ( not ( = ?auto_820306 ?auto_820311 ) ) ( not ( = ?auto_820306 ?auto_820312 ) ) ( not ( = ?auto_820306 ?auto_820313 ) ) ( not ( = ?auto_820307 ?auto_820308 ) ) ( not ( = ?auto_820307 ?auto_820309 ) ) ( not ( = ?auto_820307 ?auto_820310 ) ) ( not ( = ?auto_820307 ?auto_820311 ) ) ( not ( = ?auto_820307 ?auto_820312 ) ) ( not ( = ?auto_820307 ?auto_820313 ) ) ( not ( = ?auto_820308 ?auto_820309 ) ) ( not ( = ?auto_820308 ?auto_820310 ) ) ( not ( = ?auto_820308 ?auto_820311 ) ) ( not ( = ?auto_820308 ?auto_820312 ) ) ( not ( = ?auto_820308 ?auto_820313 ) ) ( not ( = ?auto_820309 ?auto_820310 ) ) ( not ( = ?auto_820309 ?auto_820311 ) ) ( not ( = ?auto_820309 ?auto_820312 ) ) ( not ( = ?auto_820309 ?auto_820313 ) ) ( not ( = ?auto_820310 ?auto_820311 ) ) ( not ( = ?auto_820310 ?auto_820312 ) ) ( not ( = ?auto_820310 ?auto_820313 ) ) ( not ( = ?auto_820311 ?auto_820312 ) ) ( not ( = ?auto_820311 ?auto_820313 ) ) ( not ( = ?auto_820312 ?auto_820313 ) ) ( ON ?auto_820311 ?auto_820312 ) ( ON ?auto_820310 ?auto_820311 ) ( ON ?auto_820309 ?auto_820310 ) ( ON ?auto_820308 ?auto_820309 ) ( CLEAR ?auto_820306 ) ( ON ?auto_820307 ?auto_820308 ) ( CLEAR ?auto_820307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_820303 ?auto_820304 ?auto_820305 ?auto_820306 ?auto_820307 )
      ( MAKE-10PILE ?auto_820303 ?auto_820304 ?auto_820305 ?auto_820306 ?auto_820307 ?auto_820308 ?auto_820309 ?auto_820310 ?auto_820311 ?auto_820312 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_820345 - BLOCK
      ?auto_820346 - BLOCK
      ?auto_820347 - BLOCK
      ?auto_820348 - BLOCK
      ?auto_820349 - BLOCK
      ?auto_820350 - BLOCK
      ?auto_820351 - BLOCK
      ?auto_820352 - BLOCK
      ?auto_820353 - BLOCK
      ?auto_820354 - BLOCK
    )
    :vars
    (
      ?auto_820355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820354 ?auto_820355 ) ( ON-TABLE ?auto_820345 ) ( ON ?auto_820346 ?auto_820345 ) ( ON ?auto_820347 ?auto_820346 ) ( not ( = ?auto_820345 ?auto_820346 ) ) ( not ( = ?auto_820345 ?auto_820347 ) ) ( not ( = ?auto_820345 ?auto_820348 ) ) ( not ( = ?auto_820345 ?auto_820349 ) ) ( not ( = ?auto_820345 ?auto_820350 ) ) ( not ( = ?auto_820345 ?auto_820351 ) ) ( not ( = ?auto_820345 ?auto_820352 ) ) ( not ( = ?auto_820345 ?auto_820353 ) ) ( not ( = ?auto_820345 ?auto_820354 ) ) ( not ( = ?auto_820345 ?auto_820355 ) ) ( not ( = ?auto_820346 ?auto_820347 ) ) ( not ( = ?auto_820346 ?auto_820348 ) ) ( not ( = ?auto_820346 ?auto_820349 ) ) ( not ( = ?auto_820346 ?auto_820350 ) ) ( not ( = ?auto_820346 ?auto_820351 ) ) ( not ( = ?auto_820346 ?auto_820352 ) ) ( not ( = ?auto_820346 ?auto_820353 ) ) ( not ( = ?auto_820346 ?auto_820354 ) ) ( not ( = ?auto_820346 ?auto_820355 ) ) ( not ( = ?auto_820347 ?auto_820348 ) ) ( not ( = ?auto_820347 ?auto_820349 ) ) ( not ( = ?auto_820347 ?auto_820350 ) ) ( not ( = ?auto_820347 ?auto_820351 ) ) ( not ( = ?auto_820347 ?auto_820352 ) ) ( not ( = ?auto_820347 ?auto_820353 ) ) ( not ( = ?auto_820347 ?auto_820354 ) ) ( not ( = ?auto_820347 ?auto_820355 ) ) ( not ( = ?auto_820348 ?auto_820349 ) ) ( not ( = ?auto_820348 ?auto_820350 ) ) ( not ( = ?auto_820348 ?auto_820351 ) ) ( not ( = ?auto_820348 ?auto_820352 ) ) ( not ( = ?auto_820348 ?auto_820353 ) ) ( not ( = ?auto_820348 ?auto_820354 ) ) ( not ( = ?auto_820348 ?auto_820355 ) ) ( not ( = ?auto_820349 ?auto_820350 ) ) ( not ( = ?auto_820349 ?auto_820351 ) ) ( not ( = ?auto_820349 ?auto_820352 ) ) ( not ( = ?auto_820349 ?auto_820353 ) ) ( not ( = ?auto_820349 ?auto_820354 ) ) ( not ( = ?auto_820349 ?auto_820355 ) ) ( not ( = ?auto_820350 ?auto_820351 ) ) ( not ( = ?auto_820350 ?auto_820352 ) ) ( not ( = ?auto_820350 ?auto_820353 ) ) ( not ( = ?auto_820350 ?auto_820354 ) ) ( not ( = ?auto_820350 ?auto_820355 ) ) ( not ( = ?auto_820351 ?auto_820352 ) ) ( not ( = ?auto_820351 ?auto_820353 ) ) ( not ( = ?auto_820351 ?auto_820354 ) ) ( not ( = ?auto_820351 ?auto_820355 ) ) ( not ( = ?auto_820352 ?auto_820353 ) ) ( not ( = ?auto_820352 ?auto_820354 ) ) ( not ( = ?auto_820352 ?auto_820355 ) ) ( not ( = ?auto_820353 ?auto_820354 ) ) ( not ( = ?auto_820353 ?auto_820355 ) ) ( not ( = ?auto_820354 ?auto_820355 ) ) ( ON ?auto_820353 ?auto_820354 ) ( ON ?auto_820352 ?auto_820353 ) ( ON ?auto_820351 ?auto_820352 ) ( ON ?auto_820350 ?auto_820351 ) ( ON ?auto_820349 ?auto_820350 ) ( CLEAR ?auto_820347 ) ( ON ?auto_820348 ?auto_820349 ) ( CLEAR ?auto_820348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_820345 ?auto_820346 ?auto_820347 ?auto_820348 )
      ( MAKE-10PILE ?auto_820345 ?auto_820346 ?auto_820347 ?auto_820348 ?auto_820349 ?auto_820350 ?auto_820351 ?auto_820352 ?auto_820353 ?auto_820354 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_820387 - BLOCK
      ?auto_820388 - BLOCK
      ?auto_820389 - BLOCK
      ?auto_820390 - BLOCK
      ?auto_820391 - BLOCK
      ?auto_820392 - BLOCK
      ?auto_820393 - BLOCK
      ?auto_820394 - BLOCK
      ?auto_820395 - BLOCK
      ?auto_820396 - BLOCK
    )
    :vars
    (
      ?auto_820397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820396 ?auto_820397 ) ( ON-TABLE ?auto_820387 ) ( ON ?auto_820388 ?auto_820387 ) ( not ( = ?auto_820387 ?auto_820388 ) ) ( not ( = ?auto_820387 ?auto_820389 ) ) ( not ( = ?auto_820387 ?auto_820390 ) ) ( not ( = ?auto_820387 ?auto_820391 ) ) ( not ( = ?auto_820387 ?auto_820392 ) ) ( not ( = ?auto_820387 ?auto_820393 ) ) ( not ( = ?auto_820387 ?auto_820394 ) ) ( not ( = ?auto_820387 ?auto_820395 ) ) ( not ( = ?auto_820387 ?auto_820396 ) ) ( not ( = ?auto_820387 ?auto_820397 ) ) ( not ( = ?auto_820388 ?auto_820389 ) ) ( not ( = ?auto_820388 ?auto_820390 ) ) ( not ( = ?auto_820388 ?auto_820391 ) ) ( not ( = ?auto_820388 ?auto_820392 ) ) ( not ( = ?auto_820388 ?auto_820393 ) ) ( not ( = ?auto_820388 ?auto_820394 ) ) ( not ( = ?auto_820388 ?auto_820395 ) ) ( not ( = ?auto_820388 ?auto_820396 ) ) ( not ( = ?auto_820388 ?auto_820397 ) ) ( not ( = ?auto_820389 ?auto_820390 ) ) ( not ( = ?auto_820389 ?auto_820391 ) ) ( not ( = ?auto_820389 ?auto_820392 ) ) ( not ( = ?auto_820389 ?auto_820393 ) ) ( not ( = ?auto_820389 ?auto_820394 ) ) ( not ( = ?auto_820389 ?auto_820395 ) ) ( not ( = ?auto_820389 ?auto_820396 ) ) ( not ( = ?auto_820389 ?auto_820397 ) ) ( not ( = ?auto_820390 ?auto_820391 ) ) ( not ( = ?auto_820390 ?auto_820392 ) ) ( not ( = ?auto_820390 ?auto_820393 ) ) ( not ( = ?auto_820390 ?auto_820394 ) ) ( not ( = ?auto_820390 ?auto_820395 ) ) ( not ( = ?auto_820390 ?auto_820396 ) ) ( not ( = ?auto_820390 ?auto_820397 ) ) ( not ( = ?auto_820391 ?auto_820392 ) ) ( not ( = ?auto_820391 ?auto_820393 ) ) ( not ( = ?auto_820391 ?auto_820394 ) ) ( not ( = ?auto_820391 ?auto_820395 ) ) ( not ( = ?auto_820391 ?auto_820396 ) ) ( not ( = ?auto_820391 ?auto_820397 ) ) ( not ( = ?auto_820392 ?auto_820393 ) ) ( not ( = ?auto_820392 ?auto_820394 ) ) ( not ( = ?auto_820392 ?auto_820395 ) ) ( not ( = ?auto_820392 ?auto_820396 ) ) ( not ( = ?auto_820392 ?auto_820397 ) ) ( not ( = ?auto_820393 ?auto_820394 ) ) ( not ( = ?auto_820393 ?auto_820395 ) ) ( not ( = ?auto_820393 ?auto_820396 ) ) ( not ( = ?auto_820393 ?auto_820397 ) ) ( not ( = ?auto_820394 ?auto_820395 ) ) ( not ( = ?auto_820394 ?auto_820396 ) ) ( not ( = ?auto_820394 ?auto_820397 ) ) ( not ( = ?auto_820395 ?auto_820396 ) ) ( not ( = ?auto_820395 ?auto_820397 ) ) ( not ( = ?auto_820396 ?auto_820397 ) ) ( ON ?auto_820395 ?auto_820396 ) ( ON ?auto_820394 ?auto_820395 ) ( ON ?auto_820393 ?auto_820394 ) ( ON ?auto_820392 ?auto_820393 ) ( ON ?auto_820391 ?auto_820392 ) ( ON ?auto_820390 ?auto_820391 ) ( CLEAR ?auto_820388 ) ( ON ?auto_820389 ?auto_820390 ) ( CLEAR ?auto_820389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_820387 ?auto_820388 ?auto_820389 )
      ( MAKE-10PILE ?auto_820387 ?auto_820388 ?auto_820389 ?auto_820390 ?auto_820391 ?auto_820392 ?auto_820393 ?auto_820394 ?auto_820395 ?auto_820396 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_820429 - BLOCK
      ?auto_820430 - BLOCK
      ?auto_820431 - BLOCK
      ?auto_820432 - BLOCK
      ?auto_820433 - BLOCK
      ?auto_820434 - BLOCK
      ?auto_820435 - BLOCK
      ?auto_820436 - BLOCK
      ?auto_820437 - BLOCK
      ?auto_820438 - BLOCK
    )
    :vars
    (
      ?auto_820439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820438 ?auto_820439 ) ( ON-TABLE ?auto_820429 ) ( not ( = ?auto_820429 ?auto_820430 ) ) ( not ( = ?auto_820429 ?auto_820431 ) ) ( not ( = ?auto_820429 ?auto_820432 ) ) ( not ( = ?auto_820429 ?auto_820433 ) ) ( not ( = ?auto_820429 ?auto_820434 ) ) ( not ( = ?auto_820429 ?auto_820435 ) ) ( not ( = ?auto_820429 ?auto_820436 ) ) ( not ( = ?auto_820429 ?auto_820437 ) ) ( not ( = ?auto_820429 ?auto_820438 ) ) ( not ( = ?auto_820429 ?auto_820439 ) ) ( not ( = ?auto_820430 ?auto_820431 ) ) ( not ( = ?auto_820430 ?auto_820432 ) ) ( not ( = ?auto_820430 ?auto_820433 ) ) ( not ( = ?auto_820430 ?auto_820434 ) ) ( not ( = ?auto_820430 ?auto_820435 ) ) ( not ( = ?auto_820430 ?auto_820436 ) ) ( not ( = ?auto_820430 ?auto_820437 ) ) ( not ( = ?auto_820430 ?auto_820438 ) ) ( not ( = ?auto_820430 ?auto_820439 ) ) ( not ( = ?auto_820431 ?auto_820432 ) ) ( not ( = ?auto_820431 ?auto_820433 ) ) ( not ( = ?auto_820431 ?auto_820434 ) ) ( not ( = ?auto_820431 ?auto_820435 ) ) ( not ( = ?auto_820431 ?auto_820436 ) ) ( not ( = ?auto_820431 ?auto_820437 ) ) ( not ( = ?auto_820431 ?auto_820438 ) ) ( not ( = ?auto_820431 ?auto_820439 ) ) ( not ( = ?auto_820432 ?auto_820433 ) ) ( not ( = ?auto_820432 ?auto_820434 ) ) ( not ( = ?auto_820432 ?auto_820435 ) ) ( not ( = ?auto_820432 ?auto_820436 ) ) ( not ( = ?auto_820432 ?auto_820437 ) ) ( not ( = ?auto_820432 ?auto_820438 ) ) ( not ( = ?auto_820432 ?auto_820439 ) ) ( not ( = ?auto_820433 ?auto_820434 ) ) ( not ( = ?auto_820433 ?auto_820435 ) ) ( not ( = ?auto_820433 ?auto_820436 ) ) ( not ( = ?auto_820433 ?auto_820437 ) ) ( not ( = ?auto_820433 ?auto_820438 ) ) ( not ( = ?auto_820433 ?auto_820439 ) ) ( not ( = ?auto_820434 ?auto_820435 ) ) ( not ( = ?auto_820434 ?auto_820436 ) ) ( not ( = ?auto_820434 ?auto_820437 ) ) ( not ( = ?auto_820434 ?auto_820438 ) ) ( not ( = ?auto_820434 ?auto_820439 ) ) ( not ( = ?auto_820435 ?auto_820436 ) ) ( not ( = ?auto_820435 ?auto_820437 ) ) ( not ( = ?auto_820435 ?auto_820438 ) ) ( not ( = ?auto_820435 ?auto_820439 ) ) ( not ( = ?auto_820436 ?auto_820437 ) ) ( not ( = ?auto_820436 ?auto_820438 ) ) ( not ( = ?auto_820436 ?auto_820439 ) ) ( not ( = ?auto_820437 ?auto_820438 ) ) ( not ( = ?auto_820437 ?auto_820439 ) ) ( not ( = ?auto_820438 ?auto_820439 ) ) ( ON ?auto_820437 ?auto_820438 ) ( ON ?auto_820436 ?auto_820437 ) ( ON ?auto_820435 ?auto_820436 ) ( ON ?auto_820434 ?auto_820435 ) ( ON ?auto_820433 ?auto_820434 ) ( ON ?auto_820432 ?auto_820433 ) ( ON ?auto_820431 ?auto_820432 ) ( CLEAR ?auto_820429 ) ( ON ?auto_820430 ?auto_820431 ) ( CLEAR ?auto_820430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_820429 ?auto_820430 )
      ( MAKE-10PILE ?auto_820429 ?auto_820430 ?auto_820431 ?auto_820432 ?auto_820433 ?auto_820434 ?auto_820435 ?auto_820436 ?auto_820437 ?auto_820438 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_820471 - BLOCK
      ?auto_820472 - BLOCK
      ?auto_820473 - BLOCK
      ?auto_820474 - BLOCK
      ?auto_820475 - BLOCK
      ?auto_820476 - BLOCK
      ?auto_820477 - BLOCK
      ?auto_820478 - BLOCK
      ?auto_820479 - BLOCK
      ?auto_820480 - BLOCK
    )
    :vars
    (
      ?auto_820481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820480 ?auto_820481 ) ( not ( = ?auto_820471 ?auto_820472 ) ) ( not ( = ?auto_820471 ?auto_820473 ) ) ( not ( = ?auto_820471 ?auto_820474 ) ) ( not ( = ?auto_820471 ?auto_820475 ) ) ( not ( = ?auto_820471 ?auto_820476 ) ) ( not ( = ?auto_820471 ?auto_820477 ) ) ( not ( = ?auto_820471 ?auto_820478 ) ) ( not ( = ?auto_820471 ?auto_820479 ) ) ( not ( = ?auto_820471 ?auto_820480 ) ) ( not ( = ?auto_820471 ?auto_820481 ) ) ( not ( = ?auto_820472 ?auto_820473 ) ) ( not ( = ?auto_820472 ?auto_820474 ) ) ( not ( = ?auto_820472 ?auto_820475 ) ) ( not ( = ?auto_820472 ?auto_820476 ) ) ( not ( = ?auto_820472 ?auto_820477 ) ) ( not ( = ?auto_820472 ?auto_820478 ) ) ( not ( = ?auto_820472 ?auto_820479 ) ) ( not ( = ?auto_820472 ?auto_820480 ) ) ( not ( = ?auto_820472 ?auto_820481 ) ) ( not ( = ?auto_820473 ?auto_820474 ) ) ( not ( = ?auto_820473 ?auto_820475 ) ) ( not ( = ?auto_820473 ?auto_820476 ) ) ( not ( = ?auto_820473 ?auto_820477 ) ) ( not ( = ?auto_820473 ?auto_820478 ) ) ( not ( = ?auto_820473 ?auto_820479 ) ) ( not ( = ?auto_820473 ?auto_820480 ) ) ( not ( = ?auto_820473 ?auto_820481 ) ) ( not ( = ?auto_820474 ?auto_820475 ) ) ( not ( = ?auto_820474 ?auto_820476 ) ) ( not ( = ?auto_820474 ?auto_820477 ) ) ( not ( = ?auto_820474 ?auto_820478 ) ) ( not ( = ?auto_820474 ?auto_820479 ) ) ( not ( = ?auto_820474 ?auto_820480 ) ) ( not ( = ?auto_820474 ?auto_820481 ) ) ( not ( = ?auto_820475 ?auto_820476 ) ) ( not ( = ?auto_820475 ?auto_820477 ) ) ( not ( = ?auto_820475 ?auto_820478 ) ) ( not ( = ?auto_820475 ?auto_820479 ) ) ( not ( = ?auto_820475 ?auto_820480 ) ) ( not ( = ?auto_820475 ?auto_820481 ) ) ( not ( = ?auto_820476 ?auto_820477 ) ) ( not ( = ?auto_820476 ?auto_820478 ) ) ( not ( = ?auto_820476 ?auto_820479 ) ) ( not ( = ?auto_820476 ?auto_820480 ) ) ( not ( = ?auto_820476 ?auto_820481 ) ) ( not ( = ?auto_820477 ?auto_820478 ) ) ( not ( = ?auto_820477 ?auto_820479 ) ) ( not ( = ?auto_820477 ?auto_820480 ) ) ( not ( = ?auto_820477 ?auto_820481 ) ) ( not ( = ?auto_820478 ?auto_820479 ) ) ( not ( = ?auto_820478 ?auto_820480 ) ) ( not ( = ?auto_820478 ?auto_820481 ) ) ( not ( = ?auto_820479 ?auto_820480 ) ) ( not ( = ?auto_820479 ?auto_820481 ) ) ( not ( = ?auto_820480 ?auto_820481 ) ) ( ON ?auto_820479 ?auto_820480 ) ( ON ?auto_820478 ?auto_820479 ) ( ON ?auto_820477 ?auto_820478 ) ( ON ?auto_820476 ?auto_820477 ) ( ON ?auto_820475 ?auto_820476 ) ( ON ?auto_820474 ?auto_820475 ) ( ON ?auto_820473 ?auto_820474 ) ( ON ?auto_820472 ?auto_820473 ) ( ON ?auto_820471 ?auto_820472 ) ( CLEAR ?auto_820471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_820471 )
      ( MAKE-10PILE ?auto_820471 ?auto_820472 ?auto_820473 ?auto_820474 ?auto_820475 ?auto_820476 ?auto_820477 ?auto_820478 ?auto_820479 ?auto_820480 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_820514 - BLOCK
      ?auto_820515 - BLOCK
      ?auto_820516 - BLOCK
      ?auto_820517 - BLOCK
      ?auto_820518 - BLOCK
      ?auto_820519 - BLOCK
      ?auto_820520 - BLOCK
      ?auto_820521 - BLOCK
      ?auto_820522 - BLOCK
      ?auto_820523 - BLOCK
      ?auto_820524 - BLOCK
    )
    :vars
    (
      ?auto_820525 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_820523 ) ( ON ?auto_820524 ?auto_820525 ) ( CLEAR ?auto_820524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_820514 ) ( ON ?auto_820515 ?auto_820514 ) ( ON ?auto_820516 ?auto_820515 ) ( ON ?auto_820517 ?auto_820516 ) ( ON ?auto_820518 ?auto_820517 ) ( ON ?auto_820519 ?auto_820518 ) ( ON ?auto_820520 ?auto_820519 ) ( ON ?auto_820521 ?auto_820520 ) ( ON ?auto_820522 ?auto_820521 ) ( ON ?auto_820523 ?auto_820522 ) ( not ( = ?auto_820514 ?auto_820515 ) ) ( not ( = ?auto_820514 ?auto_820516 ) ) ( not ( = ?auto_820514 ?auto_820517 ) ) ( not ( = ?auto_820514 ?auto_820518 ) ) ( not ( = ?auto_820514 ?auto_820519 ) ) ( not ( = ?auto_820514 ?auto_820520 ) ) ( not ( = ?auto_820514 ?auto_820521 ) ) ( not ( = ?auto_820514 ?auto_820522 ) ) ( not ( = ?auto_820514 ?auto_820523 ) ) ( not ( = ?auto_820514 ?auto_820524 ) ) ( not ( = ?auto_820514 ?auto_820525 ) ) ( not ( = ?auto_820515 ?auto_820516 ) ) ( not ( = ?auto_820515 ?auto_820517 ) ) ( not ( = ?auto_820515 ?auto_820518 ) ) ( not ( = ?auto_820515 ?auto_820519 ) ) ( not ( = ?auto_820515 ?auto_820520 ) ) ( not ( = ?auto_820515 ?auto_820521 ) ) ( not ( = ?auto_820515 ?auto_820522 ) ) ( not ( = ?auto_820515 ?auto_820523 ) ) ( not ( = ?auto_820515 ?auto_820524 ) ) ( not ( = ?auto_820515 ?auto_820525 ) ) ( not ( = ?auto_820516 ?auto_820517 ) ) ( not ( = ?auto_820516 ?auto_820518 ) ) ( not ( = ?auto_820516 ?auto_820519 ) ) ( not ( = ?auto_820516 ?auto_820520 ) ) ( not ( = ?auto_820516 ?auto_820521 ) ) ( not ( = ?auto_820516 ?auto_820522 ) ) ( not ( = ?auto_820516 ?auto_820523 ) ) ( not ( = ?auto_820516 ?auto_820524 ) ) ( not ( = ?auto_820516 ?auto_820525 ) ) ( not ( = ?auto_820517 ?auto_820518 ) ) ( not ( = ?auto_820517 ?auto_820519 ) ) ( not ( = ?auto_820517 ?auto_820520 ) ) ( not ( = ?auto_820517 ?auto_820521 ) ) ( not ( = ?auto_820517 ?auto_820522 ) ) ( not ( = ?auto_820517 ?auto_820523 ) ) ( not ( = ?auto_820517 ?auto_820524 ) ) ( not ( = ?auto_820517 ?auto_820525 ) ) ( not ( = ?auto_820518 ?auto_820519 ) ) ( not ( = ?auto_820518 ?auto_820520 ) ) ( not ( = ?auto_820518 ?auto_820521 ) ) ( not ( = ?auto_820518 ?auto_820522 ) ) ( not ( = ?auto_820518 ?auto_820523 ) ) ( not ( = ?auto_820518 ?auto_820524 ) ) ( not ( = ?auto_820518 ?auto_820525 ) ) ( not ( = ?auto_820519 ?auto_820520 ) ) ( not ( = ?auto_820519 ?auto_820521 ) ) ( not ( = ?auto_820519 ?auto_820522 ) ) ( not ( = ?auto_820519 ?auto_820523 ) ) ( not ( = ?auto_820519 ?auto_820524 ) ) ( not ( = ?auto_820519 ?auto_820525 ) ) ( not ( = ?auto_820520 ?auto_820521 ) ) ( not ( = ?auto_820520 ?auto_820522 ) ) ( not ( = ?auto_820520 ?auto_820523 ) ) ( not ( = ?auto_820520 ?auto_820524 ) ) ( not ( = ?auto_820520 ?auto_820525 ) ) ( not ( = ?auto_820521 ?auto_820522 ) ) ( not ( = ?auto_820521 ?auto_820523 ) ) ( not ( = ?auto_820521 ?auto_820524 ) ) ( not ( = ?auto_820521 ?auto_820525 ) ) ( not ( = ?auto_820522 ?auto_820523 ) ) ( not ( = ?auto_820522 ?auto_820524 ) ) ( not ( = ?auto_820522 ?auto_820525 ) ) ( not ( = ?auto_820523 ?auto_820524 ) ) ( not ( = ?auto_820523 ?auto_820525 ) ) ( not ( = ?auto_820524 ?auto_820525 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_820524 ?auto_820525 )
      ( !STACK ?auto_820524 ?auto_820523 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_820560 - BLOCK
      ?auto_820561 - BLOCK
      ?auto_820562 - BLOCK
      ?auto_820563 - BLOCK
      ?auto_820564 - BLOCK
      ?auto_820565 - BLOCK
      ?auto_820566 - BLOCK
      ?auto_820567 - BLOCK
      ?auto_820568 - BLOCK
      ?auto_820569 - BLOCK
      ?auto_820570 - BLOCK
    )
    :vars
    (
      ?auto_820571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820570 ?auto_820571 ) ( ON-TABLE ?auto_820560 ) ( ON ?auto_820561 ?auto_820560 ) ( ON ?auto_820562 ?auto_820561 ) ( ON ?auto_820563 ?auto_820562 ) ( ON ?auto_820564 ?auto_820563 ) ( ON ?auto_820565 ?auto_820564 ) ( ON ?auto_820566 ?auto_820565 ) ( ON ?auto_820567 ?auto_820566 ) ( ON ?auto_820568 ?auto_820567 ) ( not ( = ?auto_820560 ?auto_820561 ) ) ( not ( = ?auto_820560 ?auto_820562 ) ) ( not ( = ?auto_820560 ?auto_820563 ) ) ( not ( = ?auto_820560 ?auto_820564 ) ) ( not ( = ?auto_820560 ?auto_820565 ) ) ( not ( = ?auto_820560 ?auto_820566 ) ) ( not ( = ?auto_820560 ?auto_820567 ) ) ( not ( = ?auto_820560 ?auto_820568 ) ) ( not ( = ?auto_820560 ?auto_820569 ) ) ( not ( = ?auto_820560 ?auto_820570 ) ) ( not ( = ?auto_820560 ?auto_820571 ) ) ( not ( = ?auto_820561 ?auto_820562 ) ) ( not ( = ?auto_820561 ?auto_820563 ) ) ( not ( = ?auto_820561 ?auto_820564 ) ) ( not ( = ?auto_820561 ?auto_820565 ) ) ( not ( = ?auto_820561 ?auto_820566 ) ) ( not ( = ?auto_820561 ?auto_820567 ) ) ( not ( = ?auto_820561 ?auto_820568 ) ) ( not ( = ?auto_820561 ?auto_820569 ) ) ( not ( = ?auto_820561 ?auto_820570 ) ) ( not ( = ?auto_820561 ?auto_820571 ) ) ( not ( = ?auto_820562 ?auto_820563 ) ) ( not ( = ?auto_820562 ?auto_820564 ) ) ( not ( = ?auto_820562 ?auto_820565 ) ) ( not ( = ?auto_820562 ?auto_820566 ) ) ( not ( = ?auto_820562 ?auto_820567 ) ) ( not ( = ?auto_820562 ?auto_820568 ) ) ( not ( = ?auto_820562 ?auto_820569 ) ) ( not ( = ?auto_820562 ?auto_820570 ) ) ( not ( = ?auto_820562 ?auto_820571 ) ) ( not ( = ?auto_820563 ?auto_820564 ) ) ( not ( = ?auto_820563 ?auto_820565 ) ) ( not ( = ?auto_820563 ?auto_820566 ) ) ( not ( = ?auto_820563 ?auto_820567 ) ) ( not ( = ?auto_820563 ?auto_820568 ) ) ( not ( = ?auto_820563 ?auto_820569 ) ) ( not ( = ?auto_820563 ?auto_820570 ) ) ( not ( = ?auto_820563 ?auto_820571 ) ) ( not ( = ?auto_820564 ?auto_820565 ) ) ( not ( = ?auto_820564 ?auto_820566 ) ) ( not ( = ?auto_820564 ?auto_820567 ) ) ( not ( = ?auto_820564 ?auto_820568 ) ) ( not ( = ?auto_820564 ?auto_820569 ) ) ( not ( = ?auto_820564 ?auto_820570 ) ) ( not ( = ?auto_820564 ?auto_820571 ) ) ( not ( = ?auto_820565 ?auto_820566 ) ) ( not ( = ?auto_820565 ?auto_820567 ) ) ( not ( = ?auto_820565 ?auto_820568 ) ) ( not ( = ?auto_820565 ?auto_820569 ) ) ( not ( = ?auto_820565 ?auto_820570 ) ) ( not ( = ?auto_820565 ?auto_820571 ) ) ( not ( = ?auto_820566 ?auto_820567 ) ) ( not ( = ?auto_820566 ?auto_820568 ) ) ( not ( = ?auto_820566 ?auto_820569 ) ) ( not ( = ?auto_820566 ?auto_820570 ) ) ( not ( = ?auto_820566 ?auto_820571 ) ) ( not ( = ?auto_820567 ?auto_820568 ) ) ( not ( = ?auto_820567 ?auto_820569 ) ) ( not ( = ?auto_820567 ?auto_820570 ) ) ( not ( = ?auto_820567 ?auto_820571 ) ) ( not ( = ?auto_820568 ?auto_820569 ) ) ( not ( = ?auto_820568 ?auto_820570 ) ) ( not ( = ?auto_820568 ?auto_820571 ) ) ( not ( = ?auto_820569 ?auto_820570 ) ) ( not ( = ?auto_820569 ?auto_820571 ) ) ( not ( = ?auto_820570 ?auto_820571 ) ) ( CLEAR ?auto_820568 ) ( ON ?auto_820569 ?auto_820570 ) ( CLEAR ?auto_820569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_820560 ?auto_820561 ?auto_820562 ?auto_820563 ?auto_820564 ?auto_820565 ?auto_820566 ?auto_820567 ?auto_820568 ?auto_820569 )
      ( MAKE-11PILE ?auto_820560 ?auto_820561 ?auto_820562 ?auto_820563 ?auto_820564 ?auto_820565 ?auto_820566 ?auto_820567 ?auto_820568 ?auto_820569 ?auto_820570 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_820606 - BLOCK
      ?auto_820607 - BLOCK
      ?auto_820608 - BLOCK
      ?auto_820609 - BLOCK
      ?auto_820610 - BLOCK
      ?auto_820611 - BLOCK
      ?auto_820612 - BLOCK
      ?auto_820613 - BLOCK
      ?auto_820614 - BLOCK
      ?auto_820615 - BLOCK
      ?auto_820616 - BLOCK
    )
    :vars
    (
      ?auto_820617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820616 ?auto_820617 ) ( ON-TABLE ?auto_820606 ) ( ON ?auto_820607 ?auto_820606 ) ( ON ?auto_820608 ?auto_820607 ) ( ON ?auto_820609 ?auto_820608 ) ( ON ?auto_820610 ?auto_820609 ) ( ON ?auto_820611 ?auto_820610 ) ( ON ?auto_820612 ?auto_820611 ) ( ON ?auto_820613 ?auto_820612 ) ( not ( = ?auto_820606 ?auto_820607 ) ) ( not ( = ?auto_820606 ?auto_820608 ) ) ( not ( = ?auto_820606 ?auto_820609 ) ) ( not ( = ?auto_820606 ?auto_820610 ) ) ( not ( = ?auto_820606 ?auto_820611 ) ) ( not ( = ?auto_820606 ?auto_820612 ) ) ( not ( = ?auto_820606 ?auto_820613 ) ) ( not ( = ?auto_820606 ?auto_820614 ) ) ( not ( = ?auto_820606 ?auto_820615 ) ) ( not ( = ?auto_820606 ?auto_820616 ) ) ( not ( = ?auto_820606 ?auto_820617 ) ) ( not ( = ?auto_820607 ?auto_820608 ) ) ( not ( = ?auto_820607 ?auto_820609 ) ) ( not ( = ?auto_820607 ?auto_820610 ) ) ( not ( = ?auto_820607 ?auto_820611 ) ) ( not ( = ?auto_820607 ?auto_820612 ) ) ( not ( = ?auto_820607 ?auto_820613 ) ) ( not ( = ?auto_820607 ?auto_820614 ) ) ( not ( = ?auto_820607 ?auto_820615 ) ) ( not ( = ?auto_820607 ?auto_820616 ) ) ( not ( = ?auto_820607 ?auto_820617 ) ) ( not ( = ?auto_820608 ?auto_820609 ) ) ( not ( = ?auto_820608 ?auto_820610 ) ) ( not ( = ?auto_820608 ?auto_820611 ) ) ( not ( = ?auto_820608 ?auto_820612 ) ) ( not ( = ?auto_820608 ?auto_820613 ) ) ( not ( = ?auto_820608 ?auto_820614 ) ) ( not ( = ?auto_820608 ?auto_820615 ) ) ( not ( = ?auto_820608 ?auto_820616 ) ) ( not ( = ?auto_820608 ?auto_820617 ) ) ( not ( = ?auto_820609 ?auto_820610 ) ) ( not ( = ?auto_820609 ?auto_820611 ) ) ( not ( = ?auto_820609 ?auto_820612 ) ) ( not ( = ?auto_820609 ?auto_820613 ) ) ( not ( = ?auto_820609 ?auto_820614 ) ) ( not ( = ?auto_820609 ?auto_820615 ) ) ( not ( = ?auto_820609 ?auto_820616 ) ) ( not ( = ?auto_820609 ?auto_820617 ) ) ( not ( = ?auto_820610 ?auto_820611 ) ) ( not ( = ?auto_820610 ?auto_820612 ) ) ( not ( = ?auto_820610 ?auto_820613 ) ) ( not ( = ?auto_820610 ?auto_820614 ) ) ( not ( = ?auto_820610 ?auto_820615 ) ) ( not ( = ?auto_820610 ?auto_820616 ) ) ( not ( = ?auto_820610 ?auto_820617 ) ) ( not ( = ?auto_820611 ?auto_820612 ) ) ( not ( = ?auto_820611 ?auto_820613 ) ) ( not ( = ?auto_820611 ?auto_820614 ) ) ( not ( = ?auto_820611 ?auto_820615 ) ) ( not ( = ?auto_820611 ?auto_820616 ) ) ( not ( = ?auto_820611 ?auto_820617 ) ) ( not ( = ?auto_820612 ?auto_820613 ) ) ( not ( = ?auto_820612 ?auto_820614 ) ) ( not ( = ?auto_820612 ?auto_820615 ) ) ( not ( = ?auto_820612 ?auto_820616 ) ) ( not ( = ?auto_820612 ?auto_820617 ) ) ( not ( = ?auto_820613 ?auto_820614 ) ) ( not ( = ?auto_820613 ?auto_820615 ) ) ( not ( = ?auto_820613 ?auto_820616 ) ) ( not ( = ?auto_820613 ?auto_820617 ) ) ( not ( = ?auto_820614 ?auto_820615 ) ) ( not ( = ?auto_820614 ?auto_820616 ) ) ( not ( = ?auto_820614 ?auto_820617 ) ) ( not ( = ?auto_820615 ?auto_820616 ) ) ( not ( = ?auto_820615 ?auto_820617 ) ) ( not ( = ?auto_820616 ?auto_820617 ) ) ( ON ?auto_820615 ?auto_820616 ) ( CLEAR ?auto_820613 ) ( ON ?auto_820614 ?auto_820615 ) ( CLEAR ?auto_820614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_820606 ?auto_820607 ?auto_820608 ?auto_820609 ?auto_820610 ?auto_820611 ?auto_820612 ?auto_820613 ?auto_820614 )
      ( MAKE-11PILE ?auto_820606 ?auto_820607 ?auto_820608 ?auto_820609 ?auto_820610 ?auto_820611 ?auto_820612 ?auto_820613 ?auto_820614 ?auto_820615 ?auto_820616 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_820652 - BLOCK
      ?auto_820653 - BLOCK
      ?auto_820654 - BLOCK
      ?auto_820655 - BLOCK
      ?auto_820656 - BLOCK
      ?auto_820657 - BLOCK
      ?auto_820658 - BLOCK
      ?auto_820659 - BLOCK
      ?auto_820660 - BLOCK
      ?auto_820661 - BLOCK
      ?auto_820662 - BLOCK
    )
    :vars
    (
      ?auto_820663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820662 ?auto_820663 ) ( ON-TABLE ?auto_820652 ) ( ON ?auto_820653 ?auto_820652 ) ( ON ?auto_820654 ?auto_820653 ) ( ON ?auto_820655 ?auto_820654 ) ( ON ?auto_820656 ?auto_820655 ) ( ON ?auto_820657 ?auto_820656 ) ( ON ?auto_820658 ?auto_820657 ) ( not ( = ?auto_820652 ?auto_820653 ) ) ( not ( = ?auto_820652 ?auto_820654 ) ) ( not ( = ?auto_820652 ?auto_820655 ) ) ( not ( = ?auto_820652 ?auto_820656 ) ) ( not ( = ?auto_820652 ?auto_820657 ) ) ( not ( = ?auto_820652 ?auto_820658 ) ) ( not ( = ?auto_820652 ?auto_820659 ) ) ( not ( = ?auto_820652 ?auto_820660 ) ) ( not ( = ?auto_820652 ?auto_820661 ) ) ( not ( = ?auto_820652 ?auto_820662 ) ) ( not ( = ?auto_820652 ?auto_820663 ) ) ( not ( = ?auto_820653 ?auto_820654 ) ) ( not ( = ?auto_820653 ?auto_820655 ) ) ( not ( = ?auto_820653 ?auto_820656 ) ) ( not ( = ?auto_820653 ?auto_820657 ) ) ( not ( = ?auto_820653 ?auto_820658 ) ) ( not ( = ?auto_820653 ?auto_820659 ) ) ( not ( = ?auto_820653 ?auto_820660 ) ) ( not ( = ?auto_820653 ?auto_820661 ) ) ( not ( = ?auto_820653 ?auto_820662 ) ) ( not ( = ?auto_820653 ?auto_820663 ) ) ( not ( = ?auto_820654 ?auto_820655 ) ) ( not ( = ?auto_820654 ?auto_820656 ) ) ( not ( = ?auto_820654 ?auto_820657 ) ) ( not ( = ?auto_820654 ?auto_820658 ) ) ( not ( = ?auto_820654 ?auto_820659 ) ) ( not ( = ?auto_820654 ?auto_820660 ) ) ( not ( = ?auto_820654 ?auto_820661 ) ) ( not ( = ?auto_820654 ?auto_820662 ) ) ( not ( = ?auto_820654 ?auto_820663 ) ) ( not ( = ?auto_820655 ?auto_820656 ) ) ( not ( = ?auto_820655 ?auto_820657 ) ) ( not ( = ?auto_820655 ?auto_820658 ) ) ( not ( = ?auto_820655 ?auto_820659 ) ) ( not ( = ?auto_820655 ?auto_820660 ) ) ( not ( = ?auto_820655 ?auto_820661 ) ) ( not ( = ?auto_820655 ?auto_820662 ) ) ( not ( = ?auto_820655 ?auto_820663 ) ) ( not ( = ?auto_820656 ?auto_820657 ) ) ( not ( = ?auto_820656 ?auto_820658 ) ) ( not ( = ?auto_820656 ?auto_820659 ) ) ( not ( = ?auto_820656 ?auto_820660 ) ) ( not ( = ?auto_820656 ?auto_820661 ) ) ( not ( = ?auto_820656 ?auto_820662 ) ) ( not ( = ?auto_820656 ?auto_820663 ) ) ( not ( = ?auto_820657 ?auto_820658 ) ) ( not ( = ?auto_820657 ?auto_820659 ) ) ( not ( = ?auto_820657 ?auto_820660 ) ) ( not ( = ?auto_820657 ?auto_820661 ) ) ( not ( = ?auto_820657 ?auto_820662 ) ) ( not ( = ?auto_820657 ?auto_820663 ) ) ( not ( = ?auto_820658 ?auto_820659 ) ) ( not ( = ?auto_820658 ?auto_820660 ) ) ( not ( = ?auto_820658 ?auto_820661 ) ) ( not ( = ?auto_820658 ?auto_820662 ) ) ( not ( = ?auto_820658 ?auto_820663 ) ) ( not ( = ?auto_820659 ?auto_820660 ) ) ( not ( = ?auto_820659 ?auto_820661 ) ) ( not ( = ?auto_820659 ?auto_820662 ) ) ( not ( = ?auto_820659 ?auto_820663 ) ) ( not ( = ?auto_820660 ?auto_820661 ) ) ( not ( = ?auto_820660 ?auto_820662 ) ) ( not ( = ?auto_820660 ?auto_820663 ) ) ( not ( = ?auto_820661 ?auto_820662 ) ) ( not ( = ?auto_820661 ?auto_820663 ) ) ( not ( = ?auto_820662 ?auto_820663 ) ) ( ON ?auto_820661 ?auto_820662 ) ( ON ?auto_820660 ?auto_820661 ) ( CLEAR ?auto_820658 ) ( ON ?auto_820659 ?auto_820660 ) ( CLEAR ?auto_820659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_820652 ?auto_820653 ?auto_820654 ?auto_820655 ?auto_820656 ?auto_820657 ?auto_820658 ?auto_820659 )
      ( MAKE-11PILE ?auto_820652 ?auto_820653 ?auto_820654 ?auto_820655 ?auto_820656 ?auto_820657 ?auto_820658 ?auto_820659 ?auto_820660 ?auto_820661 ?auto_820662 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_820698 - BLOCK
      ?auto_820699 - BLOCK
      ?auto_820700 - BLOCK
      ?auto_820701 - BLOCK
      ?auto_820702 - BLOCK
      ?auto_820703 - BLOCK
      ?auto_820704 - BLOCK
      ?auto_820705 - BLOCK
      ?auto_820706 - BLOCK
      ?auto_820707 - BLOCK
      ?auto_820708 - BLOCK
    )
    :vars
    (
      ?auto_820709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820708 ?auto_820709 ) ( ON-TABLE ?auto_820698 ) ( ON ?auto_820699 ?auto_820698 ) ( ON ?auto_820700 ?auto_820699 ) ( ON ?auto_820701 ?auto_820700 ) ( ON ?auto_820702 ?auto_820701 ) ( ON ?auto_820703 ?auto_820702 ) ( not ( = ?auto_820698 ?auto_820699 ) ) ( not ( = ?auto_820698 ?auto_820700 ) ) ( not ( = ?auto_820698 ?auto_820701 ) ) ( not ( = ?auto_820698 ?auto_820702 ) ) ( not ( = ?auto_820698 ?auto_820703 ) ) ( not ( = ?auto_820698 ?auto_820704 ) ) ( not ( = ?auto_820698 ?auto_820705 ) ) ( not ( = ?auto_820698 ?auto_820706 ) ) ( not ( = ?auto_820698 ?auto_820707 ) ) ( not ( = ?auto_820698 ?auto_820708 ) ) ( not ( = ?auto_820698 ?auto_820709 ) ) ( not ( = ?auto_820699 ?auto_820700 ) ) ( not ( = ?auto_820699 ?auto_820701 ) ) ( not ( = ?auto_820699 ?auto_820702 ) ) ( not ( = ?auto_820699 ?auto_820703 ) ) ( not ( = ?auto_820699 ?auto_820704 ) ) ( not ( = ?auto_820699 ?auto_820705 ) ) ( not ( = ?auto_820699 ?auto_820706 ) ) ( not ( = ?auto_820699 ?auto_820707 ) ) ( not ( = ?auto_820699 ?auto_820708 ) ) ( not ( = ?auto_820699 ?auto_820709 ) ) ( not ( = ?auto_820700 ?auto_820701 ) ) ( not ( = ?auto_820700 ?auto_820702 ) ) ( not ( = ?auto_820700 ?auto_820703 ) ) ( not ( = ?auto_820700 ?auto_820704 ) ) ( not ( = ?auto_820700 ?auto_820705 ) ) ( not ( = ?auto_820700 ?auto_820706 ) ) ( not ( = ?auto_820700 ?auto_820707 ) ) ( not ( = ?auto_820700 ?auto_820708 ) ) ( not ( = ?auto_820700 ?auto_820709 ) ) ( not ( = ?auto_820701 ?auto_820702 ) ) ( not ( = ?auto_820701 ?auto_820703 ) ) ( not ( = ?auto_820701 ?auto_820704 ) ) ( not ( = ?auto_820701 ?auto_820705 ) ) ( not ( = ?auto_820701 ?auto_820706 ) ) ( not ( = ?auto_820701 ?auto_820707 ) ) ( not ( = ?auto_820701 ?auto_820708 ) ) ( not ( = ?auto_820701 ?auto_820709 ) ) ( not ( = ?auto_820702 ?auto_820703 ) ) ( not ( = ?auto_820702 ?auto_820704 ) ) ( not ( = ?auto_820702 ?auto_820705 ) ) ( not ( = ?auto_820702 ?auto_820706 ) ) ( not ( = ?auto_820702 ?auto_820707 ) ) ( not ( = ?auto_820702 ?auto_820708 ) ) ( not ( = ?auto_820702 ?auto_820709 ) ) ( not ( = ?auto_820703 ?auto_820704 ) ) ( not ( = ?auto_820703 ?auto_820705 ) ) ( not ( = ?auto_820703 ?auto_820706 ) ) ( not ( = ?auto_820703 ?auto_820707 ) ) ( not ( = ?auto_820703 ?auto_820708 ) ) ( not ( = ?auto_820703 ?auto_820709 ) ) ( not ( = ?auto_820704 ?auto_820705 ) ) ( not ( = ?auto_820704 ?auto_820706 ) ) ( not ( = ?auto_820704 ?auto_820707 ) ) ( not ( = ?auto_820704 ?auto_820708 ) ) ( not ( = ?auto_820704 ?auto_820709 ) ) ( not ( = ?auto_820705 ?auto_820706 ) ) ( not ( = ?auto_820705 ?auto_820707 ) ) ( not ( = ?auto_820705 ?auto_820708 ) ) ( not ( = ?auto_820705 ?auto_820709 ) ) ( not ( = ?auto_820706 ?auto_820707 ) ) ( not ( = ?auto_820706 ?auto_820708 ) ) ( not ( = ?auto_820706 ?auto_820709 ) ) ( not ( = ?auto_820707 ?auto_820708 ) ) ( not ( = ?auto_820707 ?auto_820709 ) ) ( not ( = ?auto_820708 ?auto_820709 ) ) ( ON ?auto_820707 ?auto_820708 ) ( ON ?auto_820706 ?auto_820707 ) ( ON ?auto_820705 ?auto_820706 ) ( CLEAR ?auto_820703 ) ( ON ?auto_820704 ?auto_820705 ) ( CLEAR ?auto_820704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_820698 ?auto_820699 ?auto_820700 ?auto_820701 ?auto_820702 ?auto_820703 ?auto_820704 )
      ( MAKE-11PILE ?auto_820698 ?auto_820699 ?auto_820700 ?auto_820701 ?auto_820702 ?auto_820703 ?auto_820704 ?auto_820705 ?auto_820706 ?auto_820707 ?auto_820708 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_820744 - BLOCK
      ?auto_820745 - BLOCK
      ?auto_820746 - BLOCK
      ?auto_820747 - BLOCK
      ?auto_820748 - BLOCK
      ?auto_820749 - BLOCK
      ?auto_820750 - BLOCK
      ?auto_820751 - BLOCK
      ?auto_820752 - BLOCK
      ?auto_820753 - BLOCK
      ?auto_820754 - BLOCK
    )
    :vars
    (
      ?auto_820755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820754 ?auto_820755 ) ( ON-TABLE ?auto_820744 ) ( ON ?auto_820745 ?auto_820744 ) ( ON ?auto_820746 ?auto_820745 ) ( ON ?auto_820747 ?auto_820746 ) ( ON ?auto_820748 ?auto_820747 ) ( not ( = ?auto_820744 ?auto_820745 ) ) ( not ( = ?auto_820744 ?auto_820746 ) ) ( not ( = ?auto_820744 ?auto_820747 ) ) ( not ( = ?auto_820744 ?auto_820748 ) ) ( not ( = ?auto_820744 ?auto_820749 ) ) ( not ( = ?auto_820744 ?auto_820750 ) ) ( not ( = ?auto_820744 ?auto_820751 ) ) ( not ( = ?auto_820744 ?auto_820752 ) ) ( not ( = ?auto_820744 ?auto_820753 ) ) ( not ( = ?auto_820744 ?auto_820754 ) ) ( not ( = ?auto_820744 ?auto_820755 ) ) ( not ( = ?auto_820745 ?auto_820746 ) ) ( not ( = ?auto_820745 ?auto_820747 ) ) ( not ( = ?auto_820745 ?auto_820748 ) ) ( not ( = ?auto_820745 ?auto_820749 ) ) ( not ( = ?auto_820745 ?auto_820750 ) ) ( not ( = ?auto_820745 ?auto_820751 ) ) ( not ( = ?auto_820745 ?auto_820752 ) ) ( not ( = ?auto_820745 ?auto_820753 ) ) ( not ( = ?auto_820745 ?auto_820754 ) ) ( not ( = ?auto_820745 ?auto_820755 ) ) ( not ( = ?auto_820746 ?auto_820747 ) ) ( not ( = ?auto_820746 ?auto_820748 ) ) ( not ( = ?auto_820746 ?auto_820749 ) ) ( not ( = ?auto_820746 ?auto_820750 ) ) ( not ( = ?auto_820746 ?auto_820751 ) ) ( not ( = ?auto_820746 ?auto_820752 ) ) ( not ( = ?auto_820746 ?auto_820753 ) ) ( not ( = ?auto_820746 ?auto_820754 ) ) ( not ( = ?auto_820746 ?auto_820755 ) ) ( not ( = ?auto_820747 ?auto_820748 ) ) ( not ( = ?auto_820747 ?auto_820749 ) ) ( not ( = ?auto_820747 ?auto_820750 ) ) ( not ( = ?auto_820747 ?auto_820751 ) ) ( not ( = ?auto_820747 ?auto_820752 ) ) ( not ( = ?auto_820747 ?auto_820753 ) ) ( not ( = ?auto_820747 ?auto_820754 ) ) ( not ( = ?auto_820747 ?auto_820755 ) ) ( not ( = ?auto_820748 ?auto_820749 ) ) ( not ( = ?auto_820748 ?auto_820750 ) ) ( not ( = ?auto_820748 ?auto_820751 ) ) ( not ( = ?auto_820748 ?auto_820752 ) ) ( not ( = ?auto_820748 ?auto_820753 ) ) ( not ( = ?auto_820748 ?auto_820754 ) ) ( not ( = ?auto_820748 ?auto_820755 ) ) ( not ( = ?auto_820749 ?auto_820750 ) ) ( not ( = ?auto_820749 ?auto_820751 ) ) ( not ( = ?auto_820749 ?auto_820752 ) ) ( not ( = ?auto_820749 ?auto_820753 ) ) ( not ( = ?auto_820749 ?auto_820754 ) ) ( not ( = ?auto_820749 ?auto_820755 ) ) ( not ( = ?auto_820750 ?auto_820751 ) ) ( not ( = ?auto_820750 ?auto_820752 ) ) ( not ( = ?auto_820750 ?auto_820753 ) ) ( not ( = ?auto_820750 ?auto_820754 ) ) ( not ( = ?auto_820750 ?auto_820755 ) ) ( not ( = ?auto_820751 ?auto_820752 ) ) ( not ( = ?auto_820751 ?auto_820753 ) ) ( not ( = ?auto_820751 ?auto_820754 ) ) ( not ( = ?auto_820751 ?auto_820755 ) ) ( not ( = ?auto_820752 ?auto_820753 ) ) ( not ( = ?auto_820752 ?auto_820754 ) ) ( not ( = ?auto_820752 ?auto_820755 ) ) ( not ( = ?auto_820753 ?auto_820754 ) ) ( not ( = ?auto_820753 ?auto_820755 ) ) ( not ( = ?auto_820754 ?auto_820755 ) ) ( ON ?auto_820753 ?auto_820754 ) ( ON ?auto_820752 ?auto_820753 ) ( ON ?auto_820751 ?auto_820752 ) ( ON ?auto_820750 ?auto_820751 ) ( CLEAR ?auto_820748 ) ( ON ?auto_820749 ?auto_820750 ) ( CLEAR ?auto_820749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_820744 ?auto_820745 ?auto_820746 ?auto_820747 ?auto_820748 ?auto_820749 )
      ( MAKE-11PILE ?auto_820744 ?auto_820745 ?auto_820746 ?auto_820747 ?auto_820748 ?auto_820749 ?auto_820750 ?auto_820751 ?auto_820752 ?auto_820753 ?auto_820754 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_820790 - BLOCK
      ?auto_820791 - BLOCK
      ?auto_820792 - BLOCK
      ?auto_820793 - BLOCK
      ?auto_820794 - BLOCK
      ?auto_820795 - BLOCK
      ?auto_820796 - BLOCK
      ?auto_820797 - BLOCK
      ?auto_820798 - BLOCK
      ?auto_820799 - BLOCK
      ?auto_820800 - BLOCK
    )
    :vars
    (
      ?auto_820801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820800 ?auto_820801 ) ( ON-TABLE ?auto_820790 ) ( ON ?auto_820791 ?auto_820790 ) ( ON ?auto_820792 ?auto_820791 ) ( ON ?auto_820793 ?auto_820792 ) ( not ( = ?auto_820790 ?auto_820791 ) ) ( not ( = ?auto_820790 ?auto_820792 ) ) ( not ( = ?auto_820790 ?auto_820793 ) ) ( not ( = ?auto_820790 ?auto_820794 ) ) ( not ( = ?auto_820790 ?auto_820795 ) ) ( not ( = ?auto_820790 ?auto_820796 ) ) ( not ( = ?auto_820790 ?auto_820797 ) ) ( not ( = ?auto_820790 ?auto_820798 ) ) ( not ( = ?auto_820790 ?auto_820799 ) ) ( not ( = ?auto_820790 ?auto_820800 ) ) ( not ( = ?auto_820790 ?auto_820801 ) ) ( not ( = ?auto_820791 ?auto_820792 ) ) ( not ( = ?auto_820791 ?auto_820793 ) ) ( not ( = ?auto_820791 ?auto_820794 ) ) ( not ( = ?auto_820791 ?auto_820795 ) ) ( not ( = ?auto_820791 ?auto_820796 ) ) ( not ( = ?auto_820791 ?auto_820797 ) ) ( not ( = ?auto_820791 ?auto_820798 ) ) ( not ( = ?auto_820791 ?auto_820799 ) ) ( not ( = ?auto_820791 ?auto_820800 ) ) ( not ( = ?auto_820791 ?auto_820801 ) ) ( not ( = ?auto_820792 ?auto_820793 ) ) ( not ( = ?auto_820792 ?auto_820794 ) ) ( not ( = ?auto_820792 ?auto_820795 ) ) ( not ( = ?auto_820792 ?auto_820796 ) ) ( not ( = ?auto_820792 ?auto_820797 ) ) ( not ( = ?auto_820792 ?auto_820798 ) ) ( not ( = ?auto_820792 ?auto_820799 ) ) ( not ( = ?auto_820792 ?auto_820800 ) ) ( not ( = ?auto_820792 ?auto_820801 ) ) ( not ( = ?auto_820793 ?auto_820794 ) ) ( not ( = ?auto_820793 ?auto_820795 ) ) ( not ( = ?auto_820793 ?auto_820796 ) ) ( not ( = ?auto_820793 ?auto_820797 ) ) ( not ( = ?auto_820793 ?auto_820798 ) ) ( not ( = ?auto_820793 ?auto_820799 ) ) ( not ( = ?auto_820793 ?auto_820800 ) ) ( not ( = ?auto_820793 ?auto_820801 ) ) ( not ( = ?auto_820794 ?auto_820795 ) ) ( not ( = ?auto_820794 ?auto_820796 ) ) ( not ( = ?auto_820794 ?auto_820797 ) ) ( not ( = ?auto_820794 ?auto_820798 ) ) ( not ( = ?auto_820794 ?auto_820799 ) ) ( not ( = ?auto_820794 ?auto_820800 ) ) ( not ( = ?auto_820794 ?auto_820801 ) ) ( not ( = ?auto_820795 ?auto_820796 ) ) ( not ( = ?auto_820795 ?auto_820797 ) ) ( not ( = ?auto_820795 ?auto_820798 ) ) ( not ( = ?auto_820795 ?auto_820799 ) ) ( not ( = ?auto_820795 ?auto_820800 ) ) ( not ( = ?auto_820795 ?auto_820801 ) ) ( not ( = ?auto_820796 ?auto_820797 ) ) ( not ( = ?auto_820796 ?auto_820798 ) ) ( not ( = ?auto_820796 ?auto_820799 ) ) ( not ( = ?auto_820796 ?auto_820800 ) ) ( not ( = ?auto_820796 ?auto_820801 ) ) ( not ( = ?auto_820797 ?auto_820798 ) ) ( not ( = ?auto_820797 ?auto_820799 ) ) ( not ( = ?auto_820797 ?auto_820800 ) ) ( not ( = ?auto_820797 ?auto_820801 ) ) ( not ( = ?auto_820798 ?auto_820799 ) ) ( not ( = ?auto_820798 ?auto_820800 ) ) ( not ( = ?auto_820798 ?auto_820801 ) ) ( not ( = ?auto_820799 ?auto_820800 ) ) ( not ( = ?auto_820799 ?auto_820801 ) ) ( not ( = ?auto_820800 ?auto_820801 ) ) ( ON ?auto_820799 ?auto_820800 ) ( ON ?auto_820798 ?auto_820799 ) ( ON ?auto_820797 ?auto_820798 ) ( ON ?auto_820796 ?auto_820797 ) ( ON ?auto_820795 ?auto_820796 ) ( CLEAR ?auto_820793 ) ( ON ?auto_820794 ?auto_820795 ) ( CLEAR ?auto_820794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_820790 ?auto_820791 ?auto_820792 ?auto_820793 ?auto_820794 )
      ( MAKE-11PILE ?auto_820790 ?auto_820791 ?auto_820792 ?auto_820793 ?auto_820794 ?auto_820795 ?auto_820796 ?auto_820797 ?auto_820798 ?auto_820799 ?auto_820800 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_820836 - BLOCK
      ?auto_820837 - BLOCK
      ?auto_820838 - BLOCK
      ?auto_820839 - BLOCK
      ?auto_820840 - BLOCK
      ?auto_820841 - BLOCK
      ?auto_820842 - BLOCK
      ?auto_820843 - BLOCK
      ?auto_820844 - BLOCK
      ?auto_820845 - BLOCK
      ?auto_820846 - BLOCK
    )
    :vars
    (
      ?auto_820847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820846 ?auto_820847 ) ( ON-TABLE ?auto_820836 ) ( ON ?auto_820837 ?auto_820836 ) ( ON ?auto_820838 ?auto_820837 ) ( not ( = ?auto_820836 ?auto_820837 ) ) ( not ( = ?auto_820836 ?auto_820838 ) ) ( not ( = ?auto_820836 ?auto_820839 ) ) ( not ( = ?auto_820836 ?auto_820840 ) ) ( not ( = ?auto_820836 ?auto_820841 ) ) ( not ( = ?auto_820836 ?auto_820842 ) ) ( not ( = ?auto_820836 ?auto_820843 ) ) ( not ( = ?auto_820836 ?auto_820844 ) ) ( not ( = ?auto_820836 ?auto_820845 ) ) ( not ( = ?auto_820836 ?auto_820846 ) ) ( not ( = ?auto_820836 ?auto_820847 ) ) ( not ( = ?auto_820837 ?auto_820838 ) ) ( not ( = ?auto_820837 ?auto_820839 ) ) ( not ( = ?auto_820837 ?auto_820840 ) ) ( not ( = ?auto_820837 ?auto_820841 ) ) ( not ( = ?auto_820837 ?auto_820842 ) ) ( not ( = ?auto_820837 ?auto_820843 ) ) ( not ( = ?auto_820837 ?auto_820844 ) ) ( not ( = ?auto_820837 ?auto_820845 ) ) ( not ( = ?auto_820837 ?auto_820846 ) ) ( not ( = ?auto_820837 ?auto_820847 ) ) ( not ( = ?auto_820838 ?auto_820839 ) ) ( not ( = ?auto_820838 ?auto_820840 ) ) ( not ( = ?auto_820838 ?auto_820841 ) ) ( not ( = ?auto_820838 ?auto_820842 ) ) ( not ( = ?auto_820838 ?auto_820843 ) ) ( not ( = ?auto_820838 ?auto_820844 ) ) ( not ( = ?auto_820838 ?auto_820845 ) ) ( not ( = ?auto_820838 ?auto_820846 ) ) ( not ( = ?auto_820838 ?auto_820847 ) ) ( not ( = ?auto_820839 ?auto_820840 ) ) ( not ( = ?auto_820839 ?auto_820841 ) ) ( not ( = ?auto_820839 ?auto_820842 ) ) ( not ( = ?auto_820839 ?auto_820843 ) ) ( not ( = ?auto_820839 ?auto_820844 ) ) ( not ( = ?auto_820839 ?auto_820845 ) ) ( not ( = ?auto_820839 ?auto_820846 ) ) ( not ( = ?auto_820839 ?auto_820847 ) ) ( not ( = ?auto_820840 ?auto_820841 ) ) ( not ( = ?auto_820840 ?auto_820842 ) ) ( not ( = ?auto_820840 ?auto_820843 ) ) ( not ( = ?auto_820840 ?auto_820844 ) ) ( not ( = ?auto_820840 ?auto_820845 ) ) ( not ( = ?auto_820840 ?auto_820846 ) ) ( not ( = ?auto_820840 ?auto_820847 ) ) ( not ( = ?auto_820841 ?auto_820842 ) ) ( not ( = ?auto_820841 ?auto_820843 ) ) ( not ( = ?auto_820841 ?auto_820844 ) ) ( not ( = ?auto_820841 ?auto_820845 ) ) ( not ( = ?auto_820841 ?auto_820846 ) ) ( not ( = ?auto_820841 ?auto_820847 ) ) ( not ( = ?auto_820842 ?auto_820843 ) ) ( not ( = ?auto_820842 ?auto_820844 ) ) ( not ( = ?auto_820842 ?auto_820845 ) ) ( not ( = ?auto_820842 ?auto_820846 ) ) ( not ( = ?auto_820842 ?auto_820847 ) ) ( not ( = ?auto_820843 ?auto_820844 ) ) ( not ( = ?auto_820843 ?auto_820845 ) ) ( not ( = ?auto_820843 ?auto_820846 ) ) ( not ( = ?auto_820843 ?auto_820847 ) ) ( not ( = ?auto_820844 ?auto_820845 ) ) ( not ( = ?auto_820844 ?auto_820846 ) ) ( not ( = ?auto_820844 ?auto_820847 ) ) ( not ( = ?auto_820845 ?auto_820846 ) ) ( not ( = ?auto_820845 ?auto_820847 ) ) ( not ( = ?auto_820846 ?auto_820847 ) ) ( ON ?auto_820845 ?auto_820846 ) ( ON ?auto_820844 ?auto_820845 ) ( ON ?auto_820843 ?auto_820844 ) ( ON ?auto_820842 ?auto_820843 ) ( ON ?auto_820841 ?auto_820842 ) ( ON ?auto_820840 ?auto_820841 ) ( CLEAR ?auto_820838 ) ( ON ?auto_820839 ?auto_820840 ) ( CLEAR ?auto_820839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_820836 ?auto_820837 ?auto_820838 ?auto_820839 )
      ( MAKE-11PILE ?auto_820836 ?auto_820837 ?auto_820838 ?auto_820839 ?auto_820840 ?auto_820841 ?auto_820842 ?auto_820843 ?auto_820844 ?auto_820845 ?auto_820846 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_820882 - BLOCK
      ?auto_820883 - BLOCK
      ?auto_820884 - BLOCK
      ?auto_820885 - BLOCK
      ?auto_820886 - BLOCK
      ?auto_820887 - BLOCK
      ?auto_820888 - BLOCK
      ?auto_820889 - BLOCK
      ?auto_820890 - BLOCK
      ?auto_820891 - BLOCK
      ?auto_820892 - BLOCK
    )
    :vars
    (
      ?auto_820893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820892 ?auto_820893 ) ( ON-TABLE ?auto_820882 ) ( ON ?auto_820883 ?auto_820882 ) ( not ( = ?auto_820882 ?auto_820883 ) ) ( not ( = ?auto_820882 ?auto_820884 ) ) ( not ( = ?auto_820882 ?auto_820885 ) ) ( not ( = ?auto_820882 ?auto_820886 ) ) ( not ( = ?auto_820882 ?auto_820887 ) ) ( not ( = ?auto_820882 ?auto_820888 ) ) ( not ( = ?auto_820882 ?auto_820889 ) ) ( not ( = ?auto_820882 ?auto_820890 ) ) ( not ( = ?auto_820882 ?auto_820891 ) ) ( not ( = ?auto_820882 ?auto_820892 ) ) ( not ( = ?auto_820882 ?auto_820893 ) ) ( not ( = ?auto_820883 ?auto_820884 ) ) ( not ( = ?auto_820883 ?auto_820885 ) ) ( not ( = ?auto_820883 ?auto_820886 ) ) ( not ( = ?auto_820883 ?auto_820887 ) ) ( not ( = ?auto_820883 ?auto_820888 ) ) ( not ( = ?auto_820883 ?auto_820889 ) ) ( not ( = ?auto_820883 ?auto_820890 ) ) ( not ( = ?auto_820883 ?auto_820891 ) ) ( not ( = ?auto_820883 ?auto_820892 ) ) ( not ( = ?auto_820883 ?auto_820893 ) ) ( not ( = ?auto_820884 ?auto_820885 ) ) ( not ( = ?auto_820884 ?auto_820886 ) ) ( not ( = ?auto_820884 ?auto_820887 ) ) ( not ( = ?auto_820884 ?auto_820888 ) ) ( not ( = ?auto_820884 ?auto_820889 ) ) ( not ( = ?auto_820884 ?auto_820890 ) ) ( not ( = ?auto_820884 ?auto_820891 ) ) ( not ( = ?auto_820884 ?auto_820892 ) ) ( not ( = ?auto_820884 ?auto_820893 ) ) ( not ( = ?auto_820885 ?auto_820886 ) ) ( not ( = ?auto_820885 ?auto_820887 ) ) ( not ( = ?auto_820885 ?auto_820888 ) ) ( not ( = ?auto_820885 ?auto_820889 ) ) ( not ( = ?auto_820885 ?auto_820890 ) ) ( not ( = ?auto_820885 ?auto_820891 ) ) ( not ( = ?auto_820885 ?auto_820892 ) ) ( not ( = ?auto_820885 ?auto_820893 ) ) ( not ( = ?auto_820886 ?auto_820887 ) ) ( not ( = ?auto_820886 ?auto_820888 ) ) ( not ( = ?auto_820886 ?auto_820889 ) ) ( not ( = ?auto_820886 ?auto_820890 ) ) ( not ( = ?auto_820886 ?auto_820891 ) ) ( not ( = ?auto_820886 ?auto_820892 ) ) ( not ( = ?auto_820886 ?auto_820893 ) ) ( not ( = ?auto_820887 ?auto_820888 ) ) ( not ( = ?auto_820887 ?auto_820889 ) ) ( not ( = ?auto_820887 ?auto_820890 ) ) ( not ( = ?auto_820887 ?auto_820891 ) ) ( not ( = ?auto_820887 ?auto_820892 ) ) ( not ( = ?auto_820887 ?auto_820893 ) ) ( not ( = ?auto_820888 ?auto_820889 ) ) ( not ( = ?auto_820888 ?auto_820890 ) ) ( not ( = ?auto_820888 ?auto_820891 ) ) ( not ( = ?auto_820888 ?auto_820892 ) ) ( not ( = ?auto_820888 ?auto_820893 ) ) ( not ( = ?auto_820889 ?auto_820890 ) ) ( not ( = ?auto_820889 ?auto_820891 ) ) ( not ( = ?auto_820889 ?auto_820892 ) ) ( not ( = ?auto_820889 ?auto_820893 ) ) ( not ( = ?auto_820890 ?auto_820891 ) ) ( not ( = ?auto_820890 ?auto_820892 ) ) ( not ( = ?auto_820890 ?auto_820893 ) ) ( not ( = ?auto_820891 ?auto_820892 ) ) ( not ( = ?auto_820891 ?auto_820893 ) ) ( not ( = ?auto_820892 ?auto_820893 ) ) ( ON ?auto_820891 ?auto_820892 ) ( ON ?auto_820890 ?auto_820891 ) ( ON ?auto_820889 ?auto_820890 ) ( ON ?auto_820888 ?auto_820889 ) ( ON ?auto_820887 ?auto_820888 ) ( ON ?auto_820886 ?auto_820887 ) ( ON ?auto_820885 ?auto_820886 ) ( CLEAR ?auto_820883 ) ( ON ?auto_820884 ?auto_820885 ) ( CLEAR ?auto_820884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_820882 ?auto_820883 ?auto_820884 )
      ( MAKE-11PILE ?auto_820882 ?auto_820883 ?auto_820884 ?auto_820885 ?auto_820886 ?auto_820887 ?auto_820888 ?auto_820889 ?auto_820890 ?auto_820891 ?auto_820892 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_820928 - BLOCK
      ?auto_820929 - BLOCK
      ?auto_820930 - BLOCK
      ?auto_820931 - BLOCK
      ?auto_820932 - BLOCK
      ?auto_820933 - BLOCK
      ?auto_820934 - BLOCK
      ?auto_820935 - BLOCK
      ?auto_820936 - BLOCK
      ?auto_820937 - BLOCK
      ?auto_820938 - BLOCK
    )
    :vars
    (
      ?auto_820939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820938 ?auto_820939 ) ( ON-TABLE ?auto_820928 ) ( not ( = ?auto_820928 ?auto_820929 ) ) ( not ( = ?auto_820928 ?auto_820930 ) ) ( not ( = ?auto_820928 ?auto_820931 ) ) ( not ( = ?auto_820928 ?auto_820932 ) ) ( not ( = ?auto_820928 ?auto_820933 ) ) ( not ( = ?auto_820928 ?auto_820934 ) ) ( not ( = ?auto_820928 ?auto_820935 ) ) ( not ( = ?auto_820928 ?auto_820936 ) ) ( not ( = ?auto_820928 ?auto_820937 ) ) ( not ( = ?auto_820928 ?auto_820938 ) ) ( not ( = ?auto_820928 ?auto_820939 ) ) ( not ( = ?auto_820929 ?auto_820930 ) ) ( not ( = ?auto_820929 ?auto_820931 ) ) ( not ( = ?auto_820929 ?auto_820932 ) ) ( not ( = ?auto_820929 ?auto_820933 ) ) ( not ( = ?auto_820929 ?auto_820934 ) ) ( not ( = ?auto_820929 ?auto_820935 ) ) ( not ( = ?auto_820929 ?auto_820936 ) ) ( not ( = ?auto_820929 ?auto_820937 ) ) ( not ( = ?auto_820929 ?auto_820938 ) ) ( not ( = ?auto_820929 ?auto_820939 ) ) ( not ( = ?auto_820930 ?auto_820931 ) ) ( not ( = ?auto_820930 ?auto_820932 ) ) ( not ( = ?auto_820930 ?auto_820933 ) ) ( not ( = ?auto_820930 ?auto_820934 ) ) ( not ( = ?auto_820930 ?auto_820935 ) ) ( not ( = ?auto_820930 ?auto_820936 ) ) ( not ( = ?auto_820930 ?auto_820937 ) ) ( not ( = ?auto_820930 ?auto_820938 ) ) ( not ( = ?auto_820930 ?auto_820939 ) ) ( not ( = ?auto_820931 ?auto_820932 ) ) ( not ( = ?auto_820931 ?auto_820933 ) ) ( not ( = ?auto_820931 ?auto_820934 ) ) ( not ( = ?auto_820931 ?auto_820935 ) ) ( not ( = ?auto_820931 ?auto_820936 ) ) ( not ( = ?auto_820931 ?auto_820937 ) ) ( not ( = ?auto_820931 ?auto_820938 ) ) ( not ( = ?auto_820931 ?auto_820939 ) ) ( not ( = ?auto_820932 ?auto_820933 ) ) ( not ( = ?auto_820932 ?auto_820934 ) ) ( not ( = ?auto_820932 ?auto_820935 ) ) ( not ( = ?auto_820932 ?auto_820936 ) ) ( not ( = ?auto_820932 ?auto_820937 ) ) ( not ( = ?auto_820932 ?auto_820938 ) ) ( not ( = ?auto_820932 ?auto_820939 ) ) ( not ( = ?auto_820933 ?auto_820934 ) ) ( not ( = ?auto_820933 ?auto_820935 ) ) ( not ( = ?auto_820933 ?auto_820936 ) ) ( not ( = ?auto_820933 ?auto_820937 ) ) ( not ( = ?auto_820933 ?auto_820938 ) ) ( not ( = ?auto_820933 ?auto_820939 ) ) ( not ( = ?auto_820934 ?auto_820935 ) ) ( not ( = ?auto_820934 ?auto_820936 ) ) ( not ( = ?auto_820934 ?auto_820937 ) ) ( not ( = ?auto_820934 ?auto_820938 ) ) ( not ( = ?auto_820934 ?auto_820939 ) ) ( not ( = ?auto_820935 ?auto_820936 ) ) ( not ( = ?auto_820935 ?auto_820937 ) ) ( not ( = ?auto_820935 ?auto_820938 ) ) ( not ( = ?auto_820935 ?auto_820939 ) ) ( not ( = ?auto_820936 ?auto_820937 ) ) ( not ( = ?auto_820936 ?auto_820938 ) ) ( not ( = ?auto_820936 ?auto_820939 ) ) ( not ( = ?auto_820937 ?auto_820938 ) ) ( not ( = ?auto_820937 ?auto_820939 ) ) ( not ( = ?auto_820938 ?auto_820939 ) ) ( ON ?auto_820937 ?auto_820938 ) ( ON ?auto_820936 ?auto_820937 ) ( ON ?auto_820935 ?auto_820936 ) ( ON ?auto_820934 ?auto_820935 ) ( ON ?auto_820933 ?auto_820934 ) ( ON ?auto_820932 ?auto_820933 ) ( ON ?auto_820931 ?auto_820932 ) ( ON ?auto_820930 ?auto_820931 ) ( CLEAR ?auto_820928 ) ( ON ?auto_820929 ?auto_820930 ) ( CLEAR ?auto_820929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_820928 ?auto_820929 )
      ( MAKE-11PILE ?auto_820928 ?auto_820929 ?auto_820930 ?auto_820931 ?auto_820932 ?auto_820933 ?auto_820934 ?auto_820935 ?auto_820936 ?auto_820937 ?auto_820938 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_820974 - BLOCK
      ?auto_820975 - BLOCK
      ?auto_820976 - BLOCK
      ?auto_820977 - BLOCK
      ?auto_820978 - BLOCK
      ?auto_820979 - BLOCK
      ?auto_820980 - BLOCK
      ?auto_820981 - BLOCK
      ?auto_820982 - BLOCK
      ?auto_820983 - BLOCK
      ?auto_820984 - BLOCK
    )
    :vars
    (
      ?auto_820985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_820984 ?auto_820985 ) ( not ( = ?auto_820974 ?auto_820975 ) ) ( not ( = ?auto_820974 ?auto_820976 ) ) ( not ( = ?auto_820974 ?auto_820977 ) ) ( not ( = ?auto_820974 ?auto_820978 ) ) ( not ( = ?auto_820974 ?auto_820979 ) ) ( not ( = ?auto_820974 ?auto_820980 ) ) ( not ( = ?auto_820974 ?auto_820981 ) ) ( not ( = ?auto_820974 ?auto_820982 ) ) ( not ( = ?auto_820974 ?auto_820983 ) ) ( not ( = ?auto_820974 ?auto_820984 ) ) ( not ( = ?auto_820974 ?auto_820985 ) ) ( not ( = ?auto_820975 ?auto_820976 ) ) ( not ( = ?auto_820975 ?auto_820977 ) ) ( not ( = ?auto_820975 ?auto_820978 ) ) ( not ( = ?auto_820975 ?auto_820979 ) ) ( not ( = ?auto_820975 ?auto_820980 ) ) ( not ( = ?auto_820975 ?auto_820981 ) ) ( not ( = ?auto_820975 ?auto_820982 ) ) ( not ( = ?auto_820975 ?auto_820983 ) ) ( not ( = ?auto_820975 ?auto_820984 ) ) ( not ( = ?auto_820975 ?auto_820985 ) ) ( not ( = ?auto_820976 ?auto_820977 ) ) ( not ( = ?auto_820976 ?auto_820978 ) ) ( not ( = ?auto_820976 ?auto_820979 ) ) ( not ( = ?auto_820976 ?auto_820980 ) ) ( not ( = ?auto_820976 ?auto_820981 ) ) ( not ( = ?auto_820976 ?auto_820982 ) ) ( not ( = ?auto_820976 ?auto_820983 ) ) ( not ( = ?auto_820976 ?auto_820984 ) ) ( not ( = ?auto_820976 ?auto_820985 ) ) ( not ( = ?auto_820977 ?auto_820978 ) ) ( not ( = ?auto_820977 ?auto_820979 ) ) ( not ( = ?auto_820977 ?auto_820980 ) ) ( not ( = ?auto_820977 ?auto_820981 ) ) ( not ( = ?auto_820977 ?auto_820982 ) ) ( not ( = ?auto_820977 ?auto_820983 ) ) ( not ( = ?auto_820977 ?auto_820984 ) ) ( not ( = ?auto_820977 ?auto_820985 ) ) ( not ( = ?auto_820978 ?auto_820979 ) ) ( not ( = ?auto_820978 ?auto_820980 ) ) ( not ( = ?auto_820978 ?auto_820981 ) ) ( not ( = ?auto_820978 ?auto_820982 ) ) ( not ( = ?auto_820978 ?auto_820983 ) ) ( not ( = ?auto_820978 ?auto_820984 ) ) ( not ( = ?auto_820978 ?auto_820985 ) ) ( not ( = ?auto_820979 ?auto_820980 ) ) ( not ( = ?auto_820979 ?auto_820981 ) ) ( not ( = ?auto_820979 ?auto_820982 ) ) ( not ( = ?auto_820979 ?auto_820983 ) ) ( not ( = ?auto_820979 ?auto_820984 ) ) ( not ( = ?auto_820979 ?auto_820985 ) ) ( not ( = ?auto_820980 ?auto_820981 ) ) ( not ( = ?auto_820980 ?auto_820982 ) ) ( not ( = ?auto_820980 ?auto_820983 ) ) ( not ( = ?auto_820980 ?auto_820984 ) ) ( not ( = ?auto_820980 ?auto_820985 ) ) ( not ( = ?auto_820981 ?auto_820982 ) ) ( not ( = ?auto_820981 ?auto_820983 ) ) ( not ( = ?auto_820981 ?auto_820984 ) ) ( not ( = ?auto_820981 ?auto_820985 ) ) ( not ( = ?auto_820982 ?auto_820983 ) ) ( not ( = ?auto_820982 ?auto_820984 ) ) ( not ( = ?auto_820982 ?auto_820985 ) ) ( not ( = ?auto_820983 ?auto_820984 ) ) ( not ( = ?auto_820983 ?auto_820985 ) ) ( not ( = ?auto_820984 ?auto_820985 ) ) ( ON ?auto_820983 ?auto_820984 ) ( ON ?auto_820982 ?auto_820983 ) ( ON ?auto_820981 ?auto_820982 ) ( ON ?auto_820980 ?auto_820981 ) ( ON ?auto_820979 ?auto_820980 ) ( ON ?auto_820978 ?auto_820979 ) ( ON ?auto_820977 ?auto_820978 ) ( ON ?auto_820976 ?auto_820977 ) ( ON ?auto_820975 ?auto_820976 ) ( ON ?auto_820974 ?auto_820975 ) ( CLEAR ?auto_820974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_820974 )
      ( MAKE-11PILE ?auto_820974 ?auto_820975 ?auto_820976 ?auto_820977 ?auto_820978 ?auto_820979 ?auto_820980 ?auto_820981 ?auto_820982 ?auto_820983 ?auto_820984 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_821021 - BLOCK
      ?auto_821022 - BLOCK
      ?auto_821023 - BLOCK
      ?auto_821024 - BLOCK
      ?auto_821025 - BLOCK
      ?auto_821026 - BLOCK
      ?auto_821027 - BLOCK
      ?auto_821028 - BLOCK
      ?auto_821029 - BLOCK
      ?auto_821030 - BLOCK
      ?auto_821031 - BLOCK
      ?auto_821032 - BLOCK
    )
    :vars
    (
      ?auto_821033 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_821031 ) ( ON ?auto_821032 ?auto_821033 ) ( CLEAR ?auto_821032 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_821021 ) ( ON ?auto_821022 ?auto_821021 ) ( ON ?auto_821023 ?auto_821022 ) ( ON ?auto_821024 ?auto_821023 ) ( ON ?auto_821025 ?auto_821024 ) ( ON ?auto_821026 ?auto_821025 ) ( ON ?auto_821027 ?auto_821026 ) ( ON ?auto_821028 ?auto_821027 ) ( ON ?auto_821029 ?auto_821028 ) ( ON ?auto_821030 ?auto_821029 ) ( ON ?auto_821031 ?auto_821030 ) ( not ( = ?auto_821021 ?auto_821022 ) ) ( not ( = ?auto_821021 ?auto_821023 ) ) ( not ( = ?auto_821021 ?auto_821024 ) ) ( not ( = ?auto_821021 ?auto_821025 ) ) ( not ( = ?auto_821021 ?auto_821026 ) ) ( not ( = ?auto_821021 ?auto_821027 ) ) ( not ( = ?auto_821021 ?auto_821028 ) ) ( not ( = ?auto_821021 ?auto_821029 ) ) ( not ( = ?auto_821021 ?auto_821030 ) ) ( not ( = ?auto_821021 ?auto_821031 ) ) ( not ( = ?auto_821021 ?auto_821032 ) ) ( not ( = ?auto_821021 ?auto_821033 ) ) ( not ( = ?auto_821022 ?auto_821023 ) ) ( not ( = ?auto_821022 ?auto_821024 ) ) ( not ( = ?auto_821022 ?auto_821025 ) ) ( not ( = ?auto_821022 ?auto_821026 ) ) ( not ( = ?auto_821022 ?auto_821027 ) ) ( not ( = ?auto_821022 ?auto_821028 ) ) ( not ( = ?auto_821022 ?auto_821029 ) ) ( not ( = ?auto_821022 ?auto_821030 ) ) ( not ( = ?auto_821022 ?auto_821031 ) ) ( not ( = ?auto_821022 ?auto_821032 ) ) ( not ( = ?auto_821022 ?auto_821033 ) ) ( not ( = ?auto_821023 ?auto_821024 ) ) ( not ( = ?auto_821023 ?auto_821025 ) ) ( not ( = ?auto_821023 ?auto_821026 ) ) ( not ( = ?auto_821023 ?auto_821027 ) ) ( not ( = ?auto_821023 ?auto_821028 ) ) ( not ( = ?auto_821023 ?auto_821029 ) ) ( not ( = ?auto_821023 ?auto_821030 ) ) ( not ( = ?auto_821023 ?auto_821031 ) ) ( not ( = ?auto_821023 ?auto_821032 ) ) ( not ( = ?auto_821023 ?auto_821033 ) ) ( not ( = ?auto_821024 ?auto_821025 ) ) ( not ( = ?auto_821024 ?auto_821026 ) ) ( not ( = ?auto_821024 ?auto_821027 ) ) ( not ( = ?auto_821024 ?auto_821028 ) ) ( not ( = ?auto_821024 ?auto_821029 ) ) ( not ( = ?auto_821024 ?auto_821030 ) ) ( not ( = ?auto_821024 ?auto_821031 ) ) ( not ( = ?auto_821024 ?auto_821032 ) ) ( not ( = ?auto_821024 ?auto_821033 ) ) ( not ( = ?auto_821025 ?auto_821026 ) ) ( not ( = ?auto_821025 ?auto_821027 ) ) ( not ( = ?auto_821025 ?auto_821028 ) ) ( not ( = ?auto_821025 ?auto_821029 ) ) ( not ( = ?auto_821025 ?auto_821030 ) ) ( not ( = ?auto_821025 ?auto_821031 ) ) ( not ( = ?auto_821025 ?auto_821032 ) ) ( not ( = ?auto_821025 ?auto_821033 ) ) ( not ( = ?auto_821026 ?auto_821027 ) ) ( not ( = ?auto_821026 ?auto_821028 ) ) ( not ( = ?auto_821026 ?auto_821029 ) ) ( not ( = ?auto_821026 ?auto_821030 ) ) ( not ( = ?auto_821026 ?auto_821031 ) ) ( not ( = ?auto_821026 ?auto_821032 ) ) ( not ( = ?auto_821026 ?auto_821033 ) ) ( not ( = ?auto_821027 ?auto_821028 ) ) ( not ( = ?auto_821027 ?auto_821029 ) ) ( not ( = ?auto_821027 ?auto_821030 ) ) ( not ( = ?auto_821027 ?auto_821031 ) ) ( not ( = ?auto_821027 ?auto_821032 ) ) ( not ( = ?auto_821027 ?auto_821033 ) ) ( not ( = ?auto_821028 ?auto_821029 ) ) ( not ( = ?auto_821028 ?auto_821030 ) ) ( not ( = ?auto_821028 ?auto_821031 ) ) ( not ( = ?auto_821028 ?auto_821032 ) ) ( not ( = ?auto_821028 ?auto_821033 ) ) ( not ( = ?auto_821029 ?auto_821030 ) ) ( not ( = ?auto_821029 ?auto_821031 ) ) ( not ( = ?auto_821029 ?auto_821032 ) ) ( not ( = ?auto_821029 ?auto_821033 ) ) ( not ( = ?auto_821030 ?auto_821031 ) ) ( not ( = ?auto_821030 ?auto_821032 ) ) ( not ( = ?auto_821030 ?auto_821033 ) ) ( not ( = ?auto_821031 ?auto_821032 ) ) ( not ( = ?auto_821031 ?auto_821033 ) ) ( not ( = ?auto_821032 ?auto_821033 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_821032 ?auto_821033 )
      ( !STACK ?auto_821032 ?auto_821031 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_821071 - BLOCK
      ?auto_821072 - BLOCK
      ?auto_821073 - BLOCK
      ?auto_821074 - BLOCK
      ?auto_821075 - BLOCK
      ?auto_821076 - BLOCK
      ?auto_821077 - BLOCK
      ?auto_821078 - BLOCK
      ?auto_821079 - BLOCK
      ?auto_821080 - BLOCK
      ?auto_821081 - BLOCK
      ?auto_821082 - BLOCK
    )
    :vars
    (
      ?auto_821083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821082 ?auto_821083 ) ( ON-TABLE ?auto_821071 ) ( ON ?auto_821072 ?auto_821071 ) ( ON ?auto_821073 ?auto_821072 ) ( ON ?auto_821074 ?auto_821073 ) ( ON ?auto_821075 ?auto_821074 ) ( ON ?auto_821076 ?auto_821075 ) ( ON ?auto_821077 ?auto_821076 ) ( ON ?auto_821078 ?auto_821077 ) ( ON ?auto_821079 ?auto_821078 ) ( ON ?auto_821080 ?auto_821079 ) ( not ( = ?auto_821071 ?auto_821072 ) ) ( not ( = ?auto_821071 ?auto_821073 ) ) ( not ( = ?auto_821071 ?auto_821074 ) ) ( not ( = ?auto_821071 ?auto_821075 ) ) ( not ( = ?auto_821071 ?auto_821076 ) ) ( not ( = ?auto_821071 ?auto_821077 ) ) ( not ( = ?auto_821071 ?auto_821078 ) ) ( not ( = ?auto_821071 ?auto_821079 ) ) ( not ( = ?auto_821071 ?auto_821080 ) ) ( not ( = ?auto_821071 ?auto_821081 ) ) ( not ( = ?auto_821071 ?auto_821082 ) ) ( not ( = ?auto_821071 ?auto_821083 ) ) ( not ( = ?auto_821072 ?auto_821073 ) ) ( not ( = ?auto_821072 ?auto_821074 ) ) ( not ( = ?auto_821072 ?auto_821075 ) ) ( not ( = ?auto_821072 ?auto_821076 ) ) ( not ( = ?auto_821072 ?auto_821077 ) ) ( not ( = ?auto_821072 ?auto_821078 ) ) ( not ( = ?auto_821072 ?auto_821079 ) ) ( not ( = ?auto_821072 ?auto_821080 ) ) ( not ( = ?auto_821072 ?auto_821081 ) ) ( not ( = ?auto_821072 ?auto_821082 ) ) ( not ( = ?auto_821072 ?auto_821083 ) ) ( not ( = ?auto_821073 ?auto_821074 ) ) ( not ( = ?auto_821073 ?auto_821075 ) ) ( not ( = ?auto_821073 ?auto_821076 ) ) ( not ( = ?auto_821073 ?auto_821077 ) ) ( not ( = ?auto_821073 ?auto_821078 ) ) ( not ( = ?auto_821073 ?auto_821079 ) ) ( not ( = ?auto_821073 ?auto_821080 ) ) ( not ( = ?auto_821073 ?auto_821081 ) ) ( not ( = ?auto_821073 ?auto_821082 ) ) ( not ( = ?auto_821073 ?auto_821083 ) ) ( not ( = ?auto_821074 ?auto_821075 ) ) ( not ( = ?auto_821074 ?auto_821076 ) ) ( not ( = ?auto_821074 ?auto_821077 ) ) ( not ( = ?auto_821074 ?auto_821078 ) ) ( not ( = ?auto_821074 ?auto_821079 ) ) ( not ( = ?auto_821074 ?auto_821080 ) ) ( not ( = ?auto_821074 ?auto_821081 ) ) ( not ( = ?auto_821074 ?auto_821082 ) ) ( not ( = ?auto_821074 ?auto_821083 ) ) ( not ( = ?auto_821075 ?auto_821076 ) ) ( not ( = ?auto_821075 ?auto_821077 ) ) ( not ( = ?auto_821075 ?auto_821078 ) ) ( not ( = ?auto_821075 ?auto_821079 ) ) ( not ( = ?auto_821075 ?auto_821080 ) ) ( not ( = ?auto_821075 ?auto_821081 ) ) ( not ( = ?auto_821075 ?auto_821082 ) ) ( not ( = ?auto_821075 ?auto_821083 ) ) ( not ( = ?auto_821076 ?auto_821077 ) ) ( not ( = ?auto_821076 ?auto_821078 ) ) ( not ( = ?auto_821076 ?auto_821079 ) ) ( not ( = ?auto_821076 ?auto_821080 ) ) ( not ( = ?auto_821076 ?auto_821081 ) ) ( not ( = ?auto_821076 ?auto_821082 ) ) ( not ( = ?auto_821076 ?auto_821083 ) ) ( not ( = ?auto_821077 ?auto_821078 ) ) ( not ( = ?auto_821077 ?auto_821079 ) ) ( not ( = ?auto_821077 ?auto_821080 ) ) ( not ( = ?auto_821077 ?auto_821081 ) ) ( not ( = ?auto_821077 ?auto_821082 ) ) ( not ( = ?auto_821077 ?auto_821083 ) ) ( not ( = ?auto_821078 ?auto_821079 ) ) ( not ( = ?auto_821078 ?auto_821080 ) ) ( not ( = ?auto_821078 ?auto_821081 ) ) ( not ( = ?auto_821078 ?auto_821082 ) ) ( not ( = ?auto_821078 ?auto_821083 ) ) ( not ( = ?auto_821079 ?auto_821080 ) ) ( not ( = ?auto_821079 ?auto_821081 ) ) ( not ( = ?auto_821079 ?auto_821082 ) ) ( not ( = ?auto_821079 ?auto_821083 ) ) ( not ( = ?auto_821080 ?auto_821081 ) ) ( not ( = ?auto_821080 ?auto_821082 ) ) ( not ( = ?auto_821080 ?auto_821083 ) ) ( not ( = ?auto_821081 ?auto_821082 ) ) ( not ( = ?auto_821081 ?auto_821083 ) ) ( not ( = ?auto_821082 ?auto_821083 ) ) ( CLEAR ?auto_821080 ) ( ON ?auto_821081 ?auto_821082 ) ( CLEAR ?auto_821081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_821071 ?auto_821072 ?auto_821073 ?auto_821074 ?auto_821075 ?auto_821076 ?auto_821077 ?auto_821078 ?auto_821079 ?auto_821080 ?auto_821081 )
      ( MAKE-12PILE ?auto_821071 ?auto_821072 ?auto_821073 ?auto_821074 ?auto_821075 ?auto_821076 ?auto_821077 ?auto_821078 ?auto_821079 ?auto_821080 ?auto_821081 ?auto_821082 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_821121 - BLOCK
      ?auto_821122 - BLOCK
      ?auto_821123 - BLOCK
      ?auto_821124 - BLOCK
      ?auto_821125 - BLOCK
      ?auto_821126 - BLOCK
      ?auto_821127 - BLOCK
      ?auto_821128 - BLOCK
      ?auto_821129 - BLOCK
      ?auto_821130 - BLOCK
      ?auto_821131 - BLOCK
      ?auto_821132 - BLOCK
    )
    :vars
    (
      ?auto_821133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821132 ?auto_821133 ) ( ON-TABLE ?auto_821121 ) ( ON ?auto_821122 ?auto_821121 ) ( ON ?auto_821123 ?auto_821122 ) ( ON ?auto_821124 ?auto_821123 ) ( ON ?auto_821125 ?auto_821124 ) ( ON ?auto_821126 ?auto_821125 ) ( ON ?auto_821127 ?auto_821126 ) ( ON ?auto_821128 ?auto_821127 ) ( ON ?auto_821129 ?auto_821128 ) ( not ( = ?auto_821121 ?auto_821122 ) ) ( not ( = ?auto_821121 ?auto_821123 ) ) ( not ( = ?auto_821121 ?auto_821124 ) ) ( not ( = ?auto_821121 ?auto_821125 ) ) ( not ( = ?auto_821121 ?auto_821126 ) ) ( not ( = ?auto_821121 ?auto_821127 ) ) ( not ( = ?auto_821121 ?auto_821128 ) ) ( not ( = ?auto_821121 ?auto_821129 ) ) ( not ( = ?auto_821121 ?auto_821130 ) ) ( not ( = ?auto_821121 ?auto_821131 ) ) ( not ( = ?auto_821121 ?auto_821132 ) ) ( not ( = ?auto_821121 ?auto_821133 ) ) ( not ( = ?auto_821122 ?auto_821123 ) ) ( not ( = ?auto_821122 ?auto_821124 ) ) ( not ( = ?auto_821122 ?auto_821125 ) ) ( not ( = ?auto_821122 ?auto_821126 ) ) ( not ( = ?auto_821122 ?auto_821127 ) ) ( not ( = ?auto_821122 ?auto_821128 ) ) ( not ( = ?auto_821122 ?auto_821129 ) ) ( not ( = ?auto_821122 ?auto_821130 ) ) ( not ( = ?auto_821122 ?auto_821131 ) ) ( not ( = ?auto_821122 ?auto_821132 ) ) ( not ( = ?auto_821122 ?auto_821133 ) ) ( not ( = ?auto_821123 ?auto_821124 ) ) ( not ( = ?auto_821123 ?auto_821125 ) ) ( not ( = ?auto_821123 ?auto_821126 ) ) ( not ( = ?auto_821123 ?auto_821127 ) ) ( not ( = ?auto_821123 ?auto_821128 ) ) ( not ( = ?auto_821123 ?auto_821129 ) ) ( not ( = ?auto_821123 ?auto_821130 ) ) ( not ( = ?auto_821123 ?auto_821131 ) ) ( not ( = ?auto_821123 ?auto_821132 ) ) ( not ( = ?auto_821123 ?auto_821133 ) ) ( not ( = ?auto_821124 ?auto_821125 ) ) ( not ( = ?auto_821124 ?auto_821126 ) ) ( not ( = ?auto_821124 ?auto_821127 ) ) ( not ( = ?auto_821124 ?auto_821128 ) ) ( not ( = ?auto_821124 ?auto_821129 ) ) ( not ( = ?auto_821124 ?auto_821130 ) ) ( not ( = ?auto_821124 ?auto_821131 ) ) ( not ( = ?auto_821124 ?auto_821132 ) ) ( not ( = ?auto_821124 ?auto_821133 ) ) ( not ( = ?auto_821125 ?auto_821126 ) ) ( not ( = ?auto_821125 ?auto_821127 ) ) ( not ( = ?auto_821125 ?auto_821128 ) ) ( not ( = ?auto_821125 ?auto_821129 ) ) ( not ( = ?auto_821125 ?auto_821130 ) ) ( not ( = ?auto_821125 ?auto_821131 ) ) ( not ( = ?auto_821125 ?auto_821132 ) ) ( not ( = ?auto_821125 ?auto_821133 ) ) ( not ( = ?auto_821126 ?auto_821127 ) ) ( not ( = ?auto_821126 ?auto_821128 ) ) ( not ( = ?auto_821126 ?auto_821129 ) ) ( not ( = ?auto_821126 ?auto_821130 ) ) ( not ( = ?auto_821126 ?auto_821131 ) ) ( not ( = ?auto_821126 ?auto_821132 ) ) ( not ( = ?auto_821126 ?auto_821133 ) ) ( not ( = ?auto_821127 ?auto_821128 ) ) ( not ( = ?auto_821127 ?auto_821129 ) ) ( not ( = ?auto_821127 ?auto_821130 ) ) ( not ( = ?auto_821127 ?auto_821131 ) ) ( not ( = ?auto_821127 ?auto_821132 ) ) ( not ( = ?auto_821127 ?auto_821133 ) ) ( not ( = ?auto_821128 ?auto_821129 ) ) ( not ( = ?auto_821128 ?auto_821130 ) ) ( not ( = ?auto_821128 ?auto_821131 ) ) ( not ( = ?auto_821128 ?auto_821132 ) ) ( not ( = ?auto_821128 ?auto_821133 ) ) ( not ( = ?auto_821129 ?auto_821130 ) ) ( not ( = ?auto_821129 ?auto_821131 ) ) ( not ( = ?auto_821129 ?auto_821132 ) ) ( not ( = ?auto_821129 ?auto_821133 ) ) ( not ( = ?auto_821130 ?auto_821131 ) ) ( not ( = ?auto_821130 ?auto_821132 ) ) ( not ( = ?auto_821130 ?auto_821133 ) ) ( not ( = ?auto_821131 ?auto_821132 ) ) ( not ( = ?auto_821131 ?auto_821133 ) ) ( not ( = ?auto_821132 ?auto_821133 ) ) ( ON ?auto_821131 ?auto_821132 ) ( CLEAR ?auto_821129 ) ( ON ?auto_821130 ?auto_821131 ) ( CLEAR ?auto_821130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_821121 ?auto_821122 ?auto_821123 ?auto_821124 ?auto_821125 ?auto_821126 ?auto_821127 ?auto_821128 ?auto_821129 ?auto_821130 )
      ( MAKE-12PILE ?auto_821121 ?auto_821122 ?auto_821123 ?auto_821124 ?auto_821125 ?auto_821126 ?auto_821127 ?auto_821128 ?auto_821129 ?auto_821130 ?auto_821131 ?auto_821132 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_821171 - BLOCK
      ?auto_821172 - BLOCK
      ?auto_821173 - BLOCK
      ?auto_821174 - BLOCK
      ?auto_821175 - BLOCK
      ?auto_821176 - BLOCK
      ?auto_821177 - BLOCK
      ?auto_821178 - BLOCK
      ?auto_821179 - BLOCK
      ?auto_821180 - BLOCK
      ?auto_821181 - BLOCK
      ?auto_821182 - BLOCK
    )
    :vars
    (
      ?auto_821183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821182 ?auto_821183 ) ( ON-TABLE ?auto_821171 ) ( ON ?auto_821172 ?auto_821171 ) ( ON ?auto_821173 ?auto_821172 ) ( ON ?auto_821174 ?auto_821173 ) ( ON ?auto_821175 ?auto_821174 ) ( ON ?auto_821176 ?auto_821175 ) ( ON ?auto_821177 ?auto_821176 ) ( ON ?auto_821178 ?auto_821177 ) ( not ( = ?auto_821171 ?auto_821172 ) ) ( not ( = ?auto_821171 ?auto_821173 ) ) ( not ( = ?auto_821171 ?auto_821174 ) ) ( not ( = ?auto_821171 ?auto_821175 ) ) ( not ( = ?auto_821171 ?auto_821176 ) ) ( not ( = ?auto_821171 ?auto_821177 ) ) ( not ( = ?auto_821171 ?auto_821178 ) ) ( not ( = ?auto_821171 ?auto_821179 ) ) ( not ( = ?auto_821171 ?auto_821180 ) ) ( not ( = ?auto_821171 ?auto_821181 ) ) ( not ( = ?auto_821171 ?auto_821182 ) ) ( not ( = ?auto_821171 ?auto_821183 ) ) ( not ( = ?auto_821172 ?auto_821173 ) ) ( not ( = ?auto_821172 ?auto_821174 ) ) ( not ( = ?auto_821172 ?auto_821175 ) ) ( not ( = ?auto_821172 ?auto_821176 ) ) ( not ( = ?auto_821172 ?auto_821177 ) ) ( not ( = ?auto_821172 ?auto_821178 ) ) ( not ( = ?auto_821172 ?auto_821179 ) ) ( not ( = ?auto_821172 ?auto_821180 ) ) ( not ( = ?auto_821172 ?auto_821181 ) ) ( not ( = ?auto_821172 ?auto_821182 ) ) ( not ( = ?auto_821172 ?auto_821183 ) ) ( not ( = ?auto_821173 ?auto_821174 ) ) ( not ( = ?auto_821173 ?auto_821175 ) ) ( not ( = ?auto_821173 ?auto_821176 ) ) ( not ( = ?auto_821173 ?auto_821177 ) ) ( not ( = ?auto_821173 ?auto_821178 ) ) ( not ( = ?auto_821173 ?auto_821179 ) ) ( not ( = ?auto_821173 ?auto_821180 ) ) ( not ( = ?auto_821173 ?auto_821181 ) ) ( not ( = ?auto_821173 ?auto_821182 ) ) ( not ( = ?auto_821173 ?auto_821183 ) ) ( not ( = ?auto_821174 ?auto_821175 ) ) ( not ( = ?auto_821174 ?auto_821176 ) ) ( not ( = ?auto_821174 ?auto_821177 ) ) ( not ( = ?auto_821174 ?auto_821178 ) ) ( not ( = ?auto_821174 ?auto_821179 ) ) ( not ( = ?auto_821174 ?auto_821180 ) ) ( not ( = ?auto_821174 ?auto_821181 ) ) ( not ( = ?auto_821174 ?auto_821182 ) ) ( not ( = ?auto_821174 ?auto_821183 ) ) ( not ( = ?auto_821175 ?auto_821176 ) ) ( not ( = ?auto_821175 ?auto_821177 ) ) ( not ( = ?auto_821175 ?auto_821178 ) ) ( not ( = ?auto_821175 ?auto_821179 ) ) ( not ( = ?auto_821175 ?auto_821180 ) ) ( not ( = ?auto_821175 ?auto_821181 ) ) ( not ( = ?auto_821175 ?auto_821182 ) ) ( not ( = ?auto_821175 ?auto_821183 ) ) ( not ( = ?auto_821176 ?auto_821177 ) ) ( not ( = ?auto_821176 ?auto_821178 ) ) ( not ( = ?auto_821176 ?auto_821179 ) ) ( not ( = ?auto_821176 ?auto_821180 ) ) ( not ( = ?auto_821176 ?auto_821181 ) ) ( not ( = ?auto_821176 ?auto_821182 ) ) ( not ( = ?auto_821176 ?auto_821183 ) ) ( not ( = ?auto_821177 ?auto_821178 ) ) ( not ( = ?auto_821177 ?auto_821179 ) ) ( not ( = ?auto_821177 ?auto_821180 ) ) ( not ( = ?auto_821177 ?auto_821181 ) ) ( not ( = ?auto_821177 ?auto_821182 ) ) ( not ( = ?auto_821177 ?auto_821183 ) ) ( not ( = ?auto_821178 ?auto_821179 ) ) ( not ( = ?auto_821178 ?auto_821180 ) ) ( not ( = ?auto_821178 ?auto_821181 ) ) ( not ( = ?auto_821178 ?auto_821182 ) ) ( not ( = ?auto_821178 ?auto_821183 ) ) ( not ( = ?auto_821179 ?auto_821180 ) ) ( not ( = ?auto_821179 ?auto_821181 ) ) ( not ( = ?auto_821179 ?auto_821182 ) ) ( not ( = ?auto_821179 ?auto_821183 ) ) ( not ( = ?auto_821180 ?auto_821181 ) ) ( not ( = ?auto_821180 ?auto_821182 ) ) ( not ( = ?auto_821180 ?auto_821183 ) ) ( not ( = ?auto_821181 ?auto_821182 ) ) ( not ( = ?auto_821181 ?auto_821183 ) ) ( not ( = ?auto_821182 ?auto_821183 ) ) ( ON ?auto_821181 ?auto_821182 ) ( ON ?auto_821180 ?auto_821181 ) ( CLEAR ?auto_821178 ) ( ON ?auto_821179 ?auto_821180 ) ( CLEAR ?auto_821179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_821171 ?auto_821172 ?auto_821173 ?auto_821174 ?auto_821175 ?auto_821176 ?auto_821177 ?auto_821178 ?auto_821179 )
      ( MAKE-12PILE ?auto_821171 ?auto_821172 ?auto_821173 ?auto_821174 ?auto_821175 ?auto_821176 ?auto_821177 ?auto_821178 ?auto_821179 ?auto_821180 ?auto_821181 ?auto_821182 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_821221 - BLOCK
      ?auto_821222 - BLOCK
      ?auto_821223 - BLOCK
      ?auto_821224 - BLOCK
      ?auto_821225 - BLOCK
      ?auto_821226 - BLOCK
      ?auto_821227 - BLOCK
      ?auto_821228 - BLOCK
      ?auto_821229 - BLOCK
      ?auto_821230 - BLOCK
      ?auto_821231 - BLOCK
      ?auto_821232 - BLOCK
    )
    :vars
    (
      ?auto_821233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821232 ?auto_821233 ) ( ON-TABLE ?auto_821221 ) ( ON ?auto_821222 ?auto_821221 ) ( ON ?auto_821223 ?auto_821222 ) ( ON ?auto_821224 ?auto_821223 ) ( ON ?auto_821225 ?auto_821224 ) ( ON ?auto_821226 ?auto_821225 ) ( ON ?auto_821227 ?auto_821226 ) ( not ( = ?auto_821221 ?auto_821222 ) ) ( not ( = ?auto_821221 ?auto_821223 ) ) ( not ( = ?auto_821221 ?auto_821224 ) ) ( not ( = ?auto_821221 ?auto_821225 ) ) ( not ( = ?auto_821221 ?auto_821226 ) ) ( not ( = ?auto_821221 ?auto_821227 ) ) ( not ( = ?auto_821221 ?auto_821228 ) ) ( not ( = ?auto_821221 ?auto_821229 ) ) ( not ( = ?auto_821221 ?auto_821230 ) ) ( not ( = ?auto_821221 ?auto_821231 ) ) ( not ( = ?auto_821221 ?auto_821232 ) ) ( not ( = ?auto_821221 ?auto_821233 ) ) ( not ( = ?auto_821222 ?auto_821223 ) ) ( not ( = ?auto_821222 ?auto_821224 ) ) ( not ( = ?auto_821222 ?auto_821225 ) ) ( not ( = ?auto_821222 ?auto_821226 ) ) ( not ( = ?auto_821222 ?auto_821227 ) ) ( not ( = ?auto_821222 ?auto_821228 ) ) ( not ( = ?auto_821222 ?auto_821229 ) ) ( not ( = ?auto_821222 ?auto_821230 ) ) ( not ( = ?auto_821222 ?auto_821231 ) ) ( not ( = ?auto_821222 ?auto_821232 ) ) ( not ( = ?auto_821222 ?auto_821233 ) ) ( not ( = ?auto_821223 ?auto_821224 ) ) ( not ( = ?auto_821223 ?auto_821225 ) ) ( not ( = ?auto_821223 ?auto_821226 ) ) ( not ( = ?auto_821223 ?auto_821227 ) ) ( not ( = ?auto_821223 ?auto_821228 ) ) ( not ( = ?auto_821223 ?auto_821229 ) ) ( not ( = ?auto_821223 ?auto_821230 ) ) ( not ( = ?auto_821223 ?auto_821231 ) ) ( not ( = ?auto_821223 ?auto_821232 ) ) ( not ( = ?auto_821223 ?auto_821233 ) ) ( not ( = ?auto_821224 ?auto_821225 ) ) ( not ( = ?auto_821224 ?auto_821226 ) ) ( not ( = ?auto_821224 ?auto_821227 ) ) ( not ( = ?auto_821224 ?auto_821228 ) ) ( not ( = ?auto_821224 ?auto_821229 ) ) ( not ( = ?auto_821224 ?auto_821230 ) ) ( not ( = ?auto_821224 ?auto_821231 ) ) ( not ( = ?auto_821224 ?auto_821232 ) ) ( not ( = ?auto_821224 ?auto_821233 ) ) ( not ( = ?auto_821225 ?auto_821226 ) ) ( not ( = ?auto_821225 ?auto_821227 ) ) ( not ( = ?auto_821225 ?auto_821228 ) ) ( not ( = ?auto_821225 ?auto_821229 ) ) ( not ( = ?auto_821225 ?auto_821230 ) ) ( not ( = ?auto_821225 ?auto_821231 ) ) ( not ( = ?auto_821225 ?auto_821232 ) ) ( not ( = ?auto_821225 ?auto_821233 ) ) ( not ( = ?auto_821226 ?auto_821227 ) ) ( not ( = ?auto_821226 ?auto_821228 ) ) ( not ( = ?auto_821226 ?auto_821229 ) ) ( not ( = ?auto_821226 ?auto_821230 ) ) ( not ( = ?auto_821226 ?auto_821231 ) ) ( not ( = ?auto_821226 ?auto_821232 ) ) ( not ( = ?auto_821226 ?auto_821233 ) ) ( not ( = ?auto_821227 ?auto_821228 ) ) ( not ( = ?auto_821227 ?auto_821229 ) ) ( not ( = ?auto_821227 ?auto_821230 ) ) ( not ( = ?auto_821227 ?auto_821231 ) ) ( not ( = ?auto_821227 ?auto_821232 ) ) ( not ( = ?auto_821227 ?auto_821233 ) ) ( not ( = ?auto_821228 ?auto_821229 ) ) ( not ( = ?auto_821228 ?auto_821230 ) ) ( not ( = ?auto_821228 ?auto_821231 ) ) ( not ( = ?auto_821228 ?auto_821232 ) ) ( not ( = ?auto_821228 ?auto_821233 ) ) ( not ( = ?auto_821229 ?auto_821230 ) ) ( not ( = ?auto_821229 ?auto_821231 ) ) ( not ( = ?auto_821229 ?auto_821232 ) ) ( not ( = ?auto_821229 ?auto_821233 ) ) ( not ( = ?auto_821230 ?auto_821231 ) ) ( not ( = ?auto_821230 ?auto_821232 ) ) ( not ( = ?auto_821230 ?auto_821233 ) ) ( not ( = ?auto_821231 ?auto_821232 ) ) ( not ( = ?auto_821231 ?auto_821233 ) ) ( not ( = ?auto_821232 ?auto_821233 ) ) ( ON ?auto_821231 ?auto_821232 ) ( ON ?auto_821230 ?auto_821231 ) ( ON ?auto_821229 ?auto_821230 ) ( CLEAR ?auto_821227 ) ( ON ?auto_821228 ?auto_821229 ) ( CLEAR ?auto_821228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_821221 ?auto_821222 ?auto_821223 ?auto_821224 ?auto_821225 ?auto_821226 ?auto_821227 ?auto_821228 )
      ( MAKE-12PILE ?auto_821221 ?auto_821222 ?auto_821223 ?auto_821224 ?auto_821225 ?auto_821226 ?auto_821227 ?auto_821228 ?auto_821229 ?auto_821230 ?auto_821231 ?auto_821232 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_821271 - BLOCK
      ?auto_821272 - BLOCK
      ?auto_821273 - BLOCK
      ?auto_821274 - BLOCK
      ?auto_821275 - BLOCK
      ?auto_821276 - BLOCK
      ?auto_821277 - BLOCK
      ?auto_821278 - BLOCK
      ?auto_821279 - BLOCK
      ?auto_821280 - BLOCK
      ?auto_821281 - BLOCK
      ?auto_821282 - BLOCK
    )
    :vars
    (
      ?auto_821283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821282 ?auto_821283 ) ( ON-TABLE ?auto_821271 ) ( ON ?auto_821272 ?auto_821271 ) ( ON ?auto_821273 ?auto_821272 ) ( ON ?auto_821274 ?auto_821273 ) ( ON ?auto_821275 ?auto_821274 ) ( ON ?auto_821276 ?auto_821275 ) ( not ( = ?auto_821271 ?auto_821272 ) ) ( not ( = ?auto_821271 ?auto_821273 ) ) ( not ( = ?auto_821271 ?auto_821274 ) ) ( not ( = ?auto_821271 ?auto_821275 ) ) ( not ( = ?auto_821271 ?auto_821276 ) ) ( not ( = ?auto_821271 ?auto_821277 ) ) ( not ( = ?auto_821271 ?auto_821278 ) ) ( not ( = ?auto_821271 ?auto_821279 ) ) ( not ( = ?auto_821271 ?auto_821280 ) ) ( not ( = ?auto_821271 ?auto_821281 ) ) ( not ( = ?auto_821271 ?auto_821282 ) ) ( not ( = ?auto_821271 ?auto_821283 ) ) ( not ( = ?auto_821272 ?auto_821273 ) ) ( not ( = ?auto_821272 ?auto_821274 ) ) ( not ( = ?auto_821272 ?auto_821275 ) ) ( not ( = ?auto_821272 ?auto_821276 ) ) ( not ( = ?auto_821272 ?auto_821277 ) ) ( not ( = ?auto_821272 ?auto_821278 ) ) ( not ( = ?auto_821272 ?auto_821279 ) ) ( not ( = ?auto_821272 ?auto_821280 ) ) ( not ( = ?auto_821272 ?auto_821281 ) ) ( not ( = ?auto_821272 ?auto_821282 ) ) ( not ( = ?auto_821272 ?auto_821283 ) ) ( not ( = ?auto_821273 ?auto_821274 ) ) ( not ( = ?auto_821273 ?auto_821275 ) ) ( not ( = ?auto_821273 ?auto_821276 ) ) ( not ( = ?auto_821273 ?auto_821277 ) ) ( not ( = ?auto_821273 ?auto_821278 ) ) ( not ( = ?auto_821273 ?auto_821279 ) ) ( not ( = ?auto_821273 ?auto_821280 ) ) ( not ( = ?auto_821273 ?auto_821281 ) ) ( not ( = ?auto_821273 ?auto_821282 ) ) ( not ( = ?auto_821273 ?auto_821283 ) ) ( not ( = ?auto_821274 ?auto_821275 ) ) ( not ( = ?auto_821274 ?auto_821276 ) ) ( not ( = ?auto_821274 ?auto_821277 ) ) ( not ( = ?auto_821274 ?auto_821278 ) ) ( not ( = ?auto_821274 ?auto_821279 ) ) ( not ( = ?auto_821274 ?auto_821280 ) ) ( not ( = ?auto_821274 ?auto_821281 ) ) ( not ( = ?auto_821274 ?auto_821282 ) ) ( not ( = ?auto_821274 ?auto_821283 ) ) ( not ( = ?auto_821275 ?auto_821276 ) ) ( not ( = ?auto_821275 ?auto_821277 ) ) ( not ( = ?auto_821275 ?auto_821278 ) ) ( not ( = ?auto_821275 ?auto_821279 ) ) ( not ( = ?auto_821275 ?auto_821280 ) ) ( not ( = ?auto_821275 ?auto_821281 ) ) ( not ( = ?auto_821275 ?auto_821282 ) ) ( not ( = ?auto_821275 ?auto_821283 ) ) ( not ( = ?auto_821276 ?auto_821277 ) ) ( not ( = ?auto_821276 ?auto_821278 ) ) ( not ( = ?auto_821276 ?auto_821279 ) ) ( not ( = ?auto_821276 ?auto_821280 ) ) ( not ( = ?auto_821276 ?auto_821281 ) ) ( not ( = ?auto_821276 ?auto_821282 ) ) ( not ( = ?auto_821276 ?auto_821283 ) ) ( not ( = ?auto_821277 ?auto_821278 ) ) ( not ( = ?auto_821277 ?auto_821279 ) ) ( not ( = ?auto_821277 ?auto_821280 ) ) ( not ( = ?auto_821277 ?auto_821281 ) ) ( not ( = ?auto_821277 ?auto_821282 ) ) ( not ( = ?auto_821277 ?auto_821283 ) ) ( not ( = ?auto_821278 ?auto_821279 ) ) ( not ( = ?auto_821278 ?auto_821280 ) ) ( not ( = ?auto_821278 ?auto_821281 ) ) ( not ( = ?auto_821278 ?auto_821282 ) ) ( not ( = ?auto_821278 ?auto_821283 ) ) ( not ( = ?auto_821279 ?auto_821280 ) ) ( not ( = ?auto_821279 ?auto_821281 ) ) ( not ( = ?auto_821279 ?auto_821282 ) ) ( not ( = ?auto_821279 ?auto_821283 ) ) ( not ( = ?auto_821280 ?auto_821281 ) ) ( not ( = ?auto_821280 ?auto_821282 ) ) ( not ( = ?auto_821280 ?auto_821283 ) ) ( not ( = ?auto_821281 ?auto_821282 ) ) ( not ( = ?auto_821281 ?auto_821283 ) ) ( not ( = ?auto_821282 ?auto_821283 ) ) ( ON ?auto_821281 ?auto_821282 ) ( ON ?auto_821280 ?auto_821281 ) ( ON ?auto_821279 ?auto_821280 ) ( ON ?auto_821278 ?auto_821279 ) ( CLEAR ?auto_821276 ) ( ON ?auto_821277 ?auto_821278 ) ( CLEAR ?auto_821277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_821271 ?auto_821272 ?auto_821273 ?auto_821274 ?auto_821275 ?auto_821276 ?auto_821277 )
      ( MAKE-12PILE ?auto_821271 ?auto_821272 ?auto_821273 ?auto_821274 ?auto_821275 ?auto_821276 ?auto_821277 ?auto_821278 ?auto_821279 ?auto_821280 ?auto_821281 ?auto_821282 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_821321 - BLOCK
      ?auto_821322 - BLOCK
      ?auto_821323 - BLOCK
      ?auto_821324 - BLOCK
      ?auto_821325 - BLOCK
      ?auto_821326 - BLOCK
      ?auto_821327 - BLOCK
      ?auto_821328 - BLOCK
      ?auto_821329 - BLOCK
      ?auto_821330 - BLOCK
      ?auto_821331 - BLOCK
      ?auto_821332 - BLOCK
    )
    :vars
    (
      ?auto_821333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821332 ?auto_821333 ) ( ON-TABLE ?auto_821321 ) ( ON ?auto_821322 ?auto_821321 ) ( ON ?auto_821323 ?auto_821322 ) ( ON ?auto_821324 ?auto_821323 ) ( ON ?auto_821325 ?auto_821324 ) ( not ( = ?auto_821321 ?auto_821322 ) ) ( not ( = ?auto_821321 ?auto_821323 ) ) ( not ( = ?auto_821321 ?auto_821324 ) ) ( not ( = ?auto_821321 ?auto_821325 ) ) ( not ( = ?auto_821321 ?auto_821326 ) ) ( not ( = ?auto_821321 ?auto_821327 ) ) ( not ( = ?auto_821321 ?auto_821328 ) ) ( not ( = ?auto_821321 ?auto_821329 ) ) ( not ( = ?auto_821321 ?auto_821330 ) ) ( not ( = ?auto_821321 ?auto_821331 ) ) ( not ( = ?auto_821321 ?auto_821332 ) ) ( not ( = ?auto_821321 ?auto_821333 ) ) ( not ( = ?auto_821322 ?auto_821323 ) ) ( not ( = ?auto_821322 ?auto_821324 ) ) ( not ( = ?auto_821322 ?auto_821325 ) ) ( not ( = ?auto_821322 ?auto_821326 ) ) ( not ( = ?auto_821322 ?auto_821327 ) ) ( not ( = ?auto_821322 ?auto_821328 ) ) ( not ( = ?auto_821322 ?auto_821329 ) ) ( not ( = ?auto_821322 ?auto_821330 ) ) ( not ( = ?auto_821322 ?auto_821331 ) ) ( not ( = ?auto_821322 ?auto_821332 ) ) ( not ( = ?auto_821322 ?auto_821333 ) ) ( not ( = ?auto_821323 ?auto_821324 ) ) ( not ( = ?auto_821323 ?auto_821325 ) ) ( not ( = ?auto_821323 ?auto_821326 ) ) ( not ( = ?auto_821323 ?auto_821327 ) ) ( not ( = ?auto_821323 ?auto_821328 ) ) ( not ( = ?auto_821323 ?auto_821329 ) ) ( not ( = ?auto_821323 ?auto_821330 ) ) ( not ( = ?auto_821323 ?auto_821331 ) ) ( not ( = ?auto_821323 ?auto_821332 ) ) ( not ( = ?auto_821323 ?auto_821333 ) ) ( not ( = ?auto_821324 ?auto_821325 ) ) ( not ( = ?auto_821324 ?auto_821326 ) ) ( not ( = ?auto_821324 ?auto_821327 ) ) ( not ( = ?auto_821324 ?auto_821328 ) ) ( not ( = ?auto_821324 ?auto_821329 ) ) ( not ( = ?auto_821324 ?auto_821330 ) ) ( not ( = ?auto_821324 ?auto_821331 ) ) ( not ( = ?auto_821324 ?auto_821332 ) ) ( not ( = ?auto_821324 ?auto_821333 ) ) ( not ( = ?auto_821325 ?auto_821326 ) ) ( not ( = ?auto_821325 ?auto_821327 ) ) ( not ( = ?auto_821325 ?auto_821328 ) ) ( not ( = ?auto_821325 ?auto_821329 ) ) ( not ( = ?auto_821325 ?auto_821330 ) ) ( not ( = ?auto_821325 ?auto_821331 ) ) ( not ( = ?auto_821325 ?auto_821332 ) ) ( not ( = ?auto_821325 ?auto_821333 ) ) ( not ( = ?auto_821326 ?auto_821327 ) ) ( not ( = ?auto_821326 ?auto_821328 ) ) ( not ( = ?auto_821326 ?auto_821329 ) ) ( not ( = ?auto_821326 ?auto_821330 ) ) ( not ( = ?auto_821326 ?auto_821331 ) ) ( not ( = ?auto_821326 ?auto_821332 ) ) ( not ( = ?auto_821326 ?auto_821333 ) ) ( not ( = ?auto_821327 ?auto_821328 ) ) ( not ( = ?auto_821327 ?auto_821329 ) ) ( not ( = ?auto_821327 ?auto_821330 ) ) ( not ( = ?auto_821327 ?auto_821331 ) ) ( not ( = ?auto_821327 ?auto_821332 ) ) ( not ( = ?auto_821327 ?auto_821333 ) ) ( not ( = ?auto_821328 ?auto_821329 ) ) ( not ( = ?auto_821328 ?auto_821330 ) ) ( not ( = ?auto_821328 ?auto_821331 ) ) ( not ( = ?auto_821328 ?auto_821332 ) ) ( not ( = ?auto_821328 ?auto_821333 ) ) ( not ( = ?auto_821329 ?auto_821330 ) ) ( not ( = ?auto_821329 ?auto_821331 ) ) ( not ( = ?auto_821329 ?auto_821332 ) ) ( not ( = ?auto_821329 ?auto_821333 ) ) ( not ( = ?auto_821330 ?auto_821331 ) ) ( not ( = ?auto_821330 ?auto_821332 ) ) ( not ( = ?auto_821330 ?auto_821333 ) ) ( not ( = ?auto_821331 ?auto_821332 ) ) ( not ( = ?auto_821331 ?auto_821333 ) ) ( not ( = ?auto_821332 ?auto_821333 ) ) ( ON ?auto_821331 ?auto_821332 ) ( ON ?auto_821330 ?auto_821331 ) ( ON ?auto_821329 ?auto_821330 ) ( ON ?auto_821328 ?auto_821329 ) ( ON ?auto_821327 ?auto_821328 ) ( CLEAR ?auto_821325 ) ( ON ?auto_821326 ?auto_821327 ) ( CLEAR ?auto_821326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_821321 ?auto_821322 ?auto_821323 ?auto_821324 ?auto_821325 ?auto_821326 )
      ( MAKE-12PILE ?auto_821321 ?auto_821322 ?auto_821323 ?auto_821324 ?auto_821325 ?auto_821326 ?auto_821327 ?auto_821328 ?auto_821329 ?auto_821330 ?auto_821331 ?auto_821332 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_821371 - BLOCK
      ?auto_821372 - BLOCK
      ?auto_821373 - BLOCK
      ?auto_821374 - BLOCK
      ?auto_821375 - BLOCK
      ?auto_821376 - BLOCK
      ?auto_821377 - BLOCK
      ?auto_821378 - BLOCK
      ?auto_821379 - BLOCK
      ?auto_821380 - BLOCK
      ?auto_821381 - BLOCK
      ?auto_821382 - BLOCK
    )
    :vars
    (
      ?auto_821383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821382 ?auto_821383 ) ( ON-TABLE ?auto_821371 ) ( ON ?auto_821372 ?auto_821371 ) ( ON ?auto_821373 ?auto_821372 ) ( ON ?auto_821374 ?auto_821373 ) ( not ( = ?auto_821371 ?auto_821372 ) ) ( not ( = ?auto_821371 ?auto_821373 ) ) ( not ( = ?auto_821371 ?auto_821374 ) ) ( not ( = ?auto_821371 ?auto_821375 ) ) ( not ( = ?auto_821371 ?auto_821376 ) ) ( not ( = ?auto_821371 ?auto_821377 ) ) ( not ( = ?auto_821371 ?auto_821378 ) ) ( not ( = ?auto_821371 ?auto_821379 ) ) ( not ( = ?auto_821371 ?auto_821380 ) ) ( not ( = ?auto_821371 ?auto_821381 ) ) ( not ( = ?auto_821371 ?auto_821382 ) ) ( not ( = ?auto_821371 ?auto_821383 ) ) ( not ( = ?auto_821372 ?auto_821373 ) ) ( not ( = ?auto_821372 ?auto_821374 ) ) ( not ( = ?auto_821372 ?auto_821375 ) ) ( not ( = ?auto_821372 ?auto_821376 ) ) ( not ( = ?auto_821372 ?auto_821377 ) ) ( not ( = ?auto_821372 ?auto_821378 ) ) ( not ( = ?auto_821372 ?auto_821379 ) ) ( not ( = ?auto_821372 ?auto_821380 ) ) ( not ( = ?auto_821372 ?auto_821381 ) ) ( not ( = ?auto_821372 ?auto_821382 ) ) ( not ( = ?auto_821372 ?auto_821383 ) ) ( not ( = ?auto_821373 ?auto_821374 ) ) ( not ( = ?auto_821373 ?auto_821375 ) ) ( not ( = ?auto_821373 ?auto_821376 ) ) ( not ( = ?auto_821373 ?auto_821377 ) ) ( not ( = ?auto_821373 ?auto_821378 ) ) ( not ( = ?auto_821373 ?auto_821379 ) ) ( not ( = ?auto_821373 ?auto_821380 ) ) ( not ( = ?auto_821373 ?auto_821381 ) ) ( not ( = ?auto_821373 ?auto_821382 ) ) ( not ( = ?auto_821373 ?auto_821383 ) ) ( not ( = ?auto_821374 ?auto_821375 ) ) ( not ( = ?auto_821374 ?auto_821376 ) ) ( not ( = ?auto_821374 ?auto_821377 ) ) ( not ( = ?auto_821374 ?auto_821378 ) ) ( not ( = ?auto_821374 ?auto_821379 ) ) ( not ( = ?auto_821374 ?auto_821380 ) ) ( not ( = ?auto_821374 ?auto_821381 ) ) ( not ( = ?auto_821374 ?auto_821382 ) ) ( not ( = ?auto_821374 ?auto_821383 ) ) ( not ( = ?auto_821375 ?auto_821376 ) ) ( not ( = ?auto_821375 ?auto_821377 ) ) ( not ( = ?auto_821375 ?auto_821378 ) ) ( not ( = ?auto_821375 ?auto_821379 ) ) ( not ( = ?auto_821375 ?auto_821380 ) ) ( not ( = ?auto_821375 ?auto_821381 ) ) ( not ( = ?auto_821375 ?auto_821382 ) ) ( not ( = ?auto_821375 ?auto_821383 ) ) ( not ( = ?auto_821376 ?auto_821377 ) ) ( not ( = ?auto_821376 ?auto_821378 ) ) ( not ( = ?auto_821376 ?auto_821379 ) ) ( not ( = ?auto_821376 ?auto_821380 ) ) ( not ( = ?auto_821376 ?auto_821381 ) ) ( not ( = ?auto_821376 ?auto_821382 ) ) ( not ( = ?auto_821376 ?auto_821383 ) ) ( not ( = ?auto_821377 ?auto_821378 ) ) ( not ( = ?auto_821377 ?auto_821379 ) ) ( not ( = ?auto_821377 ?auto_821380 ) ) ( not ( = ?auto_821377 ?auto_821381 ) ) ( not ( = ?auto_821377 ?auto_821382 ) ) ( not ( = ?auto_821377 ?auto_821383 ) ) ( not ( = ?auto_821378 ?auto_821379 ) ) ( not ( = ?auto_821378 ?auto_821380 ) ) ( not ( = ?auto_821378 ?auto_821381 ) ) ( not ( = ?auto_821378 ?auto_821382 ) ) ( not ( = ?auto_821378 ?auto_821383 ) ) ( not ( = ?auto_821379 ?auto_821380 ) ) ( not ( = ?auto_821379 ?auto_821381 ) ) ( not ( = ?auto_821379 ?auto_821382 ) ) ( not ( = ?auto_821379 ?auto_821383 ) ) ( not ( = ?auto_821380 ?auto_821381 ) ) ( not ( = ?auto_821380 ?auto_821382 ) ) ( not ( = ?auto_821380 ?auto_821383 ) ) ( not ( = ?auto_821381 ?auto_821382 ) ) ( not ( = ?auto_821381 ?auto_821383 ) ) ( not ( = ?auto_821382 ?auto_821383 ) ) ( ON ?auto_821381 ?auto_821382 ) ( ON ?auto_821380 ?auto_821381 ) ( ON ?auto_821379 ?auto_821380 ) ( ON ?auto_821378 ?auto_821379 ) ( ON ?auto_821377 ?auto_821378 ) ( ON ?auto_821376 ?auto_821377 ) ( CLEAR ?auto_821374 ) ( ON ?auto_821375 ?auto_821376 ) ( CLEAR ?auto_821375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_821371 ?auto_821372 ?auto_821373 ?auto_821374 ?auto_821375 )
      ( MAKE-12PILE ?auto_821371 ?auto_821372 ?auto_821373 ?auto_821374 ?auto_821375 ?auto_821376 ?auto_821377 ?auto_821378 ?auto_821379 ?auto_821380 ?auto_821381 ?auto_821382 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_821421 - BLOCK
      ?auto_821422 - BLOCK
      ?auto_821423 - BLOCK
      ?auto_821424 - BLOCK
      ?auto_821425 - BLOCK
      ?auto_821426 - BLOCK
      ?auto_821427 - BLOCK
      ?auto_821428 - BLOCK
      ?auto_821429 - BLOCK
      ?auto_821430 - BLOCK
      ?auto_821431 - BLOCK
      ?auto_821432 - BLOCK
    )
    :vars
    (
      ?auto_821433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821432 ?auto_821433 ) ( ON-TABLE ?auto_821421 ) ( ON ?auto_821422 ?auto_821421 ) ( ON ?auto_821423 ?auto_821422 ) ( not ( = ?auto_821421 ?auto_821422 ) ) ( not ( = ?auto_821421 ?auto_821423 ) ) ( not ( = ?auto_821421 ?auto_821424 ) ) ( not ( = ?auto_821421 ?auto_821425 ) ) ( not ( = ?auto_821421 ?auto_821426 ) ) ( not ( = ?auto_821421 ?auto_821427 ) ) ( not ( = ?auto_821421 ?auto_821428 ) ) ( not ( = ?auto_821421 ?auto_821429 ) ) ( not ( = ?auto_821421 ?auto_821430 ) ) ( not ( = ?auto_821421 ?auto_821431 ) ) ( not ( = ?auto_821421 ?auto_821432 ) ) ( not ( = ?auto_821421 ?auto_821433 ) ) ( not ( = ?auto_821422 ?auto_821423 ) ) ( not ( = ?auto_821422 ?auto_821424 ) ) ( not ( = ?auto_821422 ?auto_821425 ) ) ( not ( = ?auto_821422 ?auto_821426 ) ) ( not ( = ?auto_821422 ?auto_821427 ) ) ( not ( = ?auto_821422 ?auto_821428 ) ) ( not ( = ?auto_821422 ?auto_821429 ) ) ( not ( = ?auto_821422 ?auto_821430 ) ) ( not ( = ?auto_821422 ?auto_821431 ) ) ( not ( = ?auto_821422 ?auto_821432 ) ) ( not ( = ?auto_821422 ?auto_821433 ) ) ( not ( = ?auto_821423 ?auto_821424 ) ) ( not ( = ?auto_821423 ?auto_821425 ) ) ( not ( = ?auto_821423 ?auto_821426 ) ) ( not ( = ?auto_821423 ?auto_821427 ) ) ( not ( = ?auto_821423 ?auto_821428 ) ) ( not ( = ?auto_821423 ?auto_821429 ) ) ( not ( = ?auto_821423 ?auto_821430 ) ) ( not ( = ?auto_821423 ?auto_821431 ) ) ( not ( = ?auto_821423 ?auto_821432 ) ) ( not ( = ?auto_821423 ?auto_821433 ) ) ( not ( = ?auto_821424 ?auto_821425 ) ) ( not ( = ?auto_821424 ?auto_821426 ) ) ( not ( = ?auto_821424 ?auto_821427 ) ) ( not ( = ?auto_821424 ?auto_821428 ) ) ( not ( = ?auto_821424 ?auto_821429 ) ) ( not ( = ?auto_821424 ?auto_821430 ) ) ( not ( = ?auto_821424 ?auto_821431 ) ) ( not ( = ?auto_821424 ?auto_821432 ) ) ( not ( = ?auto_821424 ?auto_821433 ) ) ( not ( = ?auto_821425 ?auto_821426 ) ) ( not ( = ?auto_821425 ?auto_821427 ) ) ( not ( = ?auto_821425 ?auto_821428 ) ) ( not ( = ?auto_821425 ?auto_821429 ) ) ( not ( = ?auto_821425 ?auto_821430 ) ) ( not ( = ?auto_821425 ?auto_821431 ) ) ( not ( = ?auto_821425 ?auto_821432 ) ) ( not ( = ?auto_821425 ?auto_821433 ) ) ( not ( = ?auto_821426 ?auto_821427 ) ) ( not ( = ?auto_821426 ?auto_821428 ) ) ( not ( = ?auto_821426 ?auto_821429 ) ) ( not ( = ?auto_821426 ?auto_821430 ) ) ( not ( = ?auto_821426 ?auto_821431 ) ) ( not ( = ?auto_821426 ?auto_821432 ) ) ( not ( = ?auto_821426 ?auto_821433 ) ) ( not ( = ?auto_821427 ?auto_821428 ) ) ( not ( = ?auto_821427 ?auto_821429 ) ) ( not ( = ?auto_821427 ?auto_821430 ) ) ( not ( = ?auto_821427 ?auto_821431 ) ) ( not ( = ?auto_821427 ?auto_821432 ) ) ( not ( = ?auto_821427 ?auto_821433 ) ) ( not ( = ?auto_821428 ?auto_821429 ) ) ( not ( = ?auto_821428 ?auto_821430 ) ) ( not ( = ?auto_821428 ?auto_821431 ) ) ( not ( = ?auto_821428 ?auto_821432 ) ) ( not ( = ?auto_821428 ?auto_821433 ) ) ( not ( = ?auto_821429 ?auto_821430 ) ) ( not ( = ?auto_821429 ?auto_821431 ) ) ( not ( = ?auto_821429 ?auto_821432 ) ) ( not ( = ?auto_821429 ?auto_821433 ) ) ( not ( = ?auto_821430 ?auto_821431 ) ) ( not ( = ?auto_821430 ?auto_821432 ) ) ( not ( = ?auto_821430 ?auto_821433 ) ) ( not ( = ?auto_821431 ?auto_821432 ) ) ( not ( = ?auto_821431 ?auto_821433 ) ) ( not ( = ?auto_821432 ?auto_821433 ) ) ( ON ?auto_821431 ?auto_821432 ) ( ON ?auto_821430 ?auto_821431 ) ( ON ?auto_821429 ?auto_821430 ) ( ON ?auto_821428 ?auto_821429 ) ( ON ?auto_821427 ?auto_821428 ) ( ON ?auto_821426 ?auto_821427 ) ( ON ?auto_821425 ?auto_821426 ) ( CLEAR ?auto_821423 ) ( ON ?auto_821424 ?auto_821425 ) ( CLEAR ?auto_821424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_821421 ?auto_821422 ?auto_821423 ?auto_821424 )
      ( MAKE-12PILE ?auto_821421 ?auto_821422 ?auto_821423 ?auto_821424 ?auto_821425 ?auto_821426 ?auto_821427 ?auto_821428 ?auto_821429 ?auto_821430 ?auto_821431 ?auto_821432 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_821471 - BLOCK
      ?auto_821472 - BLOCK
      ?auto_821473 - BLOCK
      ?auto_821474 - BLOCK
      ?auto_821475 - BLOCK
      ?auto_821476 - BLOCK
      ?auto_821477 - BLOCK
      ?auto_821478 - BLOCK
      ?auto_821479 - BLOCK
      ?auto_821480 - BLOCK
      ?auto_821481 - BLOCK
      ?auto_821482 - BLOCK
    )
    :vars
    (
      ?auto_821483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821482 ?auto_821483 ) ( ON-TABLE ?auto_821471 ) ( ON ?auto_821472 ?auto_821471 ) ( not ( = ?auto_821471 ?auto_821472 ) ) ( not ( = ?auto_821471 ?auto_821473 ) ) ( not ( = ?auto_821471 ?auto_821474 ) ) ( not ( = ?auto_821471 ?auto_821475 ) ) ( not ( = ?auto_821471 ?auto_821476 ) ) ( not ( = ?auto_821471 ?auto_821477 ) ) ( not ( = ?auto_821471 ?auto_821478 ) ) ( not ( = ?auto_821471 ?auto_821479 ) ) ( not ( = ?auto_821471 ?auto_821480 ) ) ( not ( = ?auto_821471 ?auto_821481 ) ) ( not ( = ?auto_821471 ?auto_821482 ) ) ( not ( = ?auto_821471 ?auto_821483 ) ) ( not ( = ?auto_821472 ?auto_821473 ) ) ( not ( = ?auto_821472 ?auto_821474 ) ) ( not ( = ?auto_821472 ?auto_821475 ) ) ( not ( = ?auto_821472 ?auto_821476 ) ) ( not ( = ?auto_821472 ?auto_821477 ) ) ( not ( = ?auto_821472 ?auto_821478 ) ) ( not ( = ?auto_821472 ?auto_821479 ) ) ( not ( = ?auto_821472 ?auto_821480 ) ) ( not ( = ?auto_821472 ?auto_821481 ) ) ( not ( = ?auto_821472 ?auto_821482 ) ) ( not ( = ?auto_821472 ?auto_821483 ) ) ( not ( = ?auto_821473 ?auto_821474 ) ) ( not ( = ?auto_821473 ?auto_821475 ) ) ( not ( = ?auto_821473 ?auto_821476 ) ) ( not ( = ?auto_821473 ?auto_821477 ) ) ( not ( = ?auto_821473 ?auto_821478 ) ) ( not ( = ?auto_821473 ?auto_821479 ) ) ( not ( = ?auto_821473 ?auto_821480 ) ) ( not ( = ?auto_821473 ?auto_821481 ) ) ( not ( = ?auto_821473 ?auto_821482 ) ) ( not ( = ?auto_821473 ?auto_821483 ) ) ( not ( = ?auto_821474 ?auto_821475 ) ) ( not ( = ?auto_821474 ?auto_821476 ) ) ( not ( = ?auto_821474 ?auto_821477 ) ) ( not ( = ?auto_821474 ?auto_821478 ) ) ( not ( = ?auto_821474 ?auto_821479 ) ) ( not ( = ?auto_821474 ?auto_821480 ) ) ( not ( = ?auto_821474 ?auto_821481 ) ) ( not ( = ?auto_821474 ?auto_821482 ) ) ( not ( = ?auto_821474 ?auto_821483 ) ) ( not ( = ?auto_821475 ?auto_821476 ) ) ( not ( = ?auto_821475 ?auto_821477 ) ) ( not ( = ?auto_821475 ?auto_821478 ) ) ( not ( = ?auto_821475 ?auto_821479 ) ) ( not ( = ?auto_821475 ?auto_821480 ) ) ( not ( = ?auto_821475 ?auto_821481 ) ) ( not ( = ?auto_821475 ?auto_821482 ) ) ( not ( = ?auto_821475 ?auto_821483 ) ) ( not ( = ?auto_821476 ?auto_821477 ) ) ( not ( = ?auto_821476 ?auto_821478 ) ) ( not ( = ?auto_821476 ?auto_821479 ) ) ( not ( = ?auto_821476 ?auto_821480 ) ) ( not ( = ?auto_821476 ?auto_821481 ) ) ( not ( = ?auto_821476 ?auto_821482 ) ) ( not ( = ?auto_821476 ?auto_821483 ) ) ( not ( = ?auto_821477 ?auto_821478 ) ) ( not ( = ?auto_821477 ?auto_821479 ) ) ( not ( = ?auto_821477 ?auto_821480 ) ) ( not ( = ?auto_821477 ?auto_821481 ) ) ( not ( = ?auto_821477 ?auto_821482 ) ) ( not ( = ?auto_821477 ?auto_821483 ) ) ( not ( = ?auto_821478 ?auto_821479 ) ) ( not ( = ?auto_821478 ?auto_821480 ) ) ( not ( = ?auto_821478 ?auto_821481 ) ) ( not ( = ?auto_821478 ?auto_821482 ) ) ( not ( = ?auto_821478 ?auto_821483 ) ) ( not ( = ?auto_821479 ?auto_821480 ) ) ( not ( = ?auto_821479 ?auto_821481 ) ) ( not ( = ?auto_821479 ?auto_821482 ) ) ( not ( = ?auto_821479 ?auto_821483 ) ) ( not ( = ?auto_821480 ?auto_821481 ) ) ( not ( = ?auto_821480 ?auto_821482 ) ) ( not ( = ?auto_821480 ?auto_821483 ) ) ( not ( = ?auto_821481 ?auto_821482 ) ) ( not ( = ?auto_821481 ?auto_821483 ) ) ( not ( = ?auto_821482 ?auto_821483 ) ) ( ON ?auto_821481 ?auto_821482 ) ( ON ?auto_821480 ?auto_821481 ) ( ON ?auto_821479 ?auto_821480 ) ( ON ?auto_821478 ?auto_821479 ) ( ON ?auto_821477 ?auto_821478 ) ( ON ?auto_821476 ?auto_821477 ) ( ON ?auto_821475 ?auto_821476 ) ( ON ?auto_821474 ?auto_821475 ) ( CLEAR ?auto_821472 ) ( ON ?auto_821473 ?auto_821474 ) ( CLEAR ?auto_821473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_821471 ?auto_821472 ?auto_821473 )
      ( MAKE-12PILE ?auto_821471 ?auto_821472 ?auto_821473 ?auto_821474 ?auto_821475 ?auto_821476 ?auto_821477 ?auto_821478 ?auto_821479 ?auto_821480 ?auto_821481 ?auto_821482 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_821521 - BLOCK
      ?auto_821522 - BLOCK
      ?auto_821523 - BLOCK
      ?auto_821524 - BLOCK
      ?auto_821525 - BLOCK
      ?auto_821526 - BLOCK
      ?auto_821527 - BLOCK
      ?auto_821528 - BLOCK
      ?auto_821529 - BLOCK
      ?auto_821530 - BLOCK
      ?auto_821531 - BLOCK
      ?auto_821532 - BLOCK
    )
    :vars
    (
      ?auto_821533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821532 ?auto_821533 ) ( ON-TABLE ?auto_821521 ) ( not ( = ?auto_821521 ?auto_821522 ) ) ( not ( = ?auto_821521 ?auto_821523 ) ) ( not ( = ?auto_821521 ?auto_821524 ) ) ( not ( = ?auto_821521 ?auto_821525 ) ) ( not ( = ?auto_821521 ?auto_821526 ) ) ( not ( = ?auto_821521 ?auto_821527 ) ) ( not ( = ?auto_821521 ?auto_821528 ) ) ( not ( = ?auto_821521 ?auto_821529 ) ) ( not ( = ?auto_821521 ?auto_821530 ) ) ( not ( = ?auto_821521 ?auto_821531 ) ) ( not ( = ?auto_821521 ?auto_821532 ) ) ( not ( = ?auto_821521 ?auto_821533 ) ) ( not ( = ?auto_821522 ?auto_821523 ) ) ( not ( = ?auto_821522 ?auto_821524 ) ) ( not ( = ?auto_821522 ?auto_821525 ) ) ( not ( = ?auto_821522 ?auto_821526 ) ) ( not ( = ?auto_821522 ?auto_821527 ) ) ( not ( = ?auto_821522 ?auto_821528 ) ) ( not ( = ?auto_821522 ?auto_821529 ) ) ( not ( = ?auto_821522 ?auto_821530 ) ) ( not ( = ?auto_821522 ?auto_821531 ) ) ( not ( = ?auto_821522 ?auto_821532 ) ) ( not ( = ?auto_821522 ?auto_821533 ) ) ( not ( = ?auto_821523 ?auto_821524 ) ) ( not ( = ?auto_821523 ?auto_821525 ) ) ( not ( = ?auto_821523 ?auto_821526 ) ) ( not ( = ?auto_821523 ?auto_821527 ) ) ( not ( = ?auto_821523 ?auto_821528 ) ) ( not ( = ?auto_821523 ?auto_821529 ) ) ( not ( = ?auto_821523 ?auto_821530 ) ) ( not ( = ?auto_821523 ?auto_821531 ) ) ( not ( = ?auto_821523 ?auto_821532 ) ) ( not ( = ?auto_821523 ?auto_821533 ) ) ( not ( = ?auto_821524 ?auto_821525 ) ) ( not ( = ?auto_821524 ?auto_821526 ) ) ( not ( = ?auto_821524 ?auto_821527 ) ) ( not ( = ?auto_821524 ?auto_821528 ) ) ( not ( = ?auto_821524 ?auto_821529 ) ) ( not ( = ?auto_821524 ?auto_821530 ) ) ( not ( = ?auto_821524 ?auto_821531 ) ) ( not ( = ?auto_821524 ?auto_821532 ) ) ( not ( = ?auto_821524 ?auto_821533 ) ) ( not ( = ?auto_821525 ?auto_821526 ) ) ( not ( = ?auto_821525 ?auto_821527 ) ) ( not ( = ?auto_821525 ?auto_821528 ) ) ( not ( = ?auto_821525 ?auto_821529 ) ) ( not ( = ?auto_821525 ?auto_821530 ) ) ( not ( = ?auto_821525 ?auto_821531 ) ) ( not ( = ?auto_821525 ?auto_821532 ) ) ( not ( = ?auto_821525 ?auto_821533 ) ) ( not ( = ?auto_821526 ?auto_821527 ) ) ( not ( = ?auto_821526 ?auto_821528 ) ) ( not ( = ?auto_821526 ?auto_821529 ) ) ( not ( = ?auto_821526 ?auto_821530 ) ) ( not ( = ?auto_821526 ?auto_821531 ) ) ( not ( = ?auto_821526 ?auto_821532 ) ) ( not ( = ?auto_821526 ?auto_821533 ) ) ( not ( = ?auto_821527 ?auto_821528 ) ) ( not ( = ?auto_821527 ?auto_821529 ) ) ( not ( = ?auto_821527 ?auto_821530 ) ) ( not ( = ?auto_821527 ?auto_821531 ) ) ( not ( = ?auto_821527 ?auto_821532 ) ) ( not ( = ?auto_821527 ?auto_821533 ) ) ( not ( = ?auto_821528 ?auto_821529 ) ) ( not ( = ?auto_821528 ?auto_821530 ) ) ( not ( = ?auto_821528 ?auto_821531 ) ) ( not ( = ?auto_821528 ?auto_821532 ) ) ( not ( = ?auto_821528 ?auto_821533 ) ) ( not ( = ?auto_821529 ?auto_821530 ) ) ( not ( = ?auto_821529 ?auto_821531 ) ) ( not ( = ?auto_821529 ?auto_821532 ) ) ( not ( = ?auto_821529 ?auto_821533 ) ) ( not ( = ?auto_821530 ?auto_821531 ) ) ( not ( = ?auto_821530 ?auto_821532 ) ) ( not ( = ?auto_821530 ?auto_821533 ) ) ( not ( = ?auto_821531 ?auto_821532 ) ) ( not ( = ?auto_821531 ?auto_821533 ) ) ( not ( = ?auto_821532 ?auto_821533 ) ) ( ON ?auto_821531 ?auto_821532 ) ( ON ?auto_821530 ?auto_821531 ) ( ON ?auto_821529 ?auto_821530 ) ( ON ?auto_821528 ?auto_821529 ) ( ON ?auto_821527 ?auto_821528 ) ( ON ?auto_821526 ?auto_821527 ) ( ON ?auto_821525 ?auto_821526 ) ( ON ?auto_821524 ?auto_821525 ) ( ON ?auto_821523 ?auto_821524 ) ( CLEAR ?auto_821521 ) ( ON ?auto_821522 ?auto_821523 ) ( CLEAR ?auto_821522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_821521 ?auto_821522 )
      ( MAKE-12PILE ?auto_821521 ?auto_821522 ?auto_821523 ?auto_821524 ?auto_821525 ?auto_821526 ?auto_821527 ?auto_821528 ?auto_821529 ?auto_821530 ?auto_821531 ?auto_821532 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_821571 - BLOCK
      ?auto_821572 - BLOCK
      ?auto_821573 - BLOCK
      ?auto_821574 - BLOCK
      ?auto_821575 - BLOCK
      ?auto_821576 - BLOCK
      ?auto_821577 - BLOCK
      ?auto_821578 - BLOCK
      ?auto_821579 - BLOCK
      ?auto_821580 - BLOCK
      ?auto_821581 - BLOCK
      ?auto_821582 - BLOCK
    )
    :vars
    (
      ?auto_821583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821582 ?auto_821583 ) ( not ( = ?auto_821571 ?auto_821572 ) ) ( not ( = ?auto_821571 ?auto_821573 ) ) ( not ( = ?auto_821571 ?auto_821574 ) ) ( not ( = ?auto_821571 ?auto_821575 ) ) ( not ( = ?auto_821571 ?auto_821576 ) ) ( not ( = ?auto_821571 ?auto_821577 ) ) ( not ( = ?auto_821571 ?auto_821578 ) ) ( not ( = ?auto_821571 ?auto_821579 ) ) ( not ( = ?auto_821571 ?auto_821580 ) ) ( not ( = ?auto_821571 ?auto_821581 ) ) ( not ( = ?auto_821571 ?auto_821582 ) ) ( not ( = ?auto_821571 ?auto_821583 ) ) ( not ( = ?auto_821572 ?auto_821573 ) ) ( not ( = ?auto_821572 ?auto_821574 ) ) ( not ( = ?auto_821572 ?auto_821575 ) ) ( not ( = ?auto_821572 ?auto_821576 ) ) ( not ( = ?auto_821572 ?auto_821577 ) ) ( not ( = ?auto_821572 ?auto_821578 ) ) ( not ( = ?auto_821572 ?auto_821579 ) ) ( not ( = ?auto_821572 ?auto_821580 ) ) ( not ( = ?auto_821572 ?auto_821581 ) ) ( not ( = ?auto_821572 ?auto_821582 ) ) ( not ( = ?auto_821572 ?auto_821583 ) ) ( not ( = ?auto_821573 ?auto_821574 ) ) ( not ( = ?auto_821573 ?auto_821575 ) ) ( not ( = ?auto_821573 ?auto_821576 ) ) ( not ( = ?auto_821573 ?auto_821577 ) ) ( not ( = ?auto_821573 ?auto_821578 ) ) ( not ( = ?auto_821573 ?auto_821579 ) ) ( not ( = ?auto_821573 ?auto_821580 ) ) ( not ( = ?auto_821573 ?auto_821581 ) ) ( not ( = ?auto_821573 ?auto_821582 ) ) ( not ( = ?auto_821573 ?auto_821583 ) ) ( not ( = ?auto_821574 ?auto_821575 ) ) ( not ( = ?auto_821574 ?auto_821576 ) ) ( not ( = ?auto_821574 ?auto_821577 ) ) ( not ( = ?auto_821574 ?auto_821578 ) ) ( not ( = ?auto_821574 ?auto_821579 ) ) ( not ( = ?auto_821574 ?auto_821580 ) ) ( not ( = ?auto_821574 ?auto_821581 ) ) ( not ( = ?auto_821574 ?auto_821582 ) ) ( not ( = ?auto_821574 ?auto_821583 ) ) ( not ( = ?auto_821575 ?auto_821576 ) ) ( not ( = ?auto_821575 ?auto_821577 ) ) ( not ( = ?auto_821575 ?auto_821578 ) ) ( not ( = ?auto_821575 ?auto_821579 ) ) ( not ( = ?auto_821575 ?auto_821580 ) ) ( not ( = ?auto_821575 ?auto_821581 ) ) ( not ( = ?auto_821575 ?auto_821582 ) ) ( not ( = ?auto_821575 ?auto_821583 ) ) ( not ( = ?auto_821576 ?auto_821577 ) ) ( not ( = ?auto_821576 ?auto_821578 ) ) ( not ( = ?auto_821576 ?auto_821579 ) ) ( not ( = ?auto_821576 ?auto_821580 ) ) ( not ( = ?auto_821576 ?auto_821581 ) ) ( not ( = ?auto_821576 ?auto_821582 ) ) ( not ( = ?auto_821576 ?auto_821583 ) ) ( not ( = ?auto_821577 ?auto_821578 ) ) ( not ( = ?auto_821577 ?auto_821579 ) ) ( not ( = ?auto_821577 ?auto_821580 ) ) ( not ( = ?auto_821577 ?auto_821581 ) ) ( not ( = ?auto_821577 ?auto_821582 ) ) ( not ( = ?auto_821577 ?auto_821583 ) ) ( not ( = ?auto_821578 ?auto_821579 ) ) ( not ( = ?auto_821578 ?auto_821580 ) ) ( not ( = ?auto_821578 ?auto_821581 ) ) ( not ( = ?auto_821578 ?auto_821582 ) ) ( not ( = ?auto_821578 ?auto_821583 ) ) ( not ( = ?auto_821579 ?auto_821580 ) ) ( not ( = ?auto_821579 ?auto_821581 ) ) ( not ( = ?auto_821579 ?auto_821582 ) ) ( not ( = ?auto_821579 ?auto_821583 ) ) ( not ( = ?auto_821580 ?auto_821581 ) ) ( not ( = ?auto_821580 ?auto_821582 ) ) ( not ( = ?auto_821580 ?auto_821583 ) ) ( not ( = ?auto_821581 ?auto_821582 ) ) ( not ( = ?auto_821581 ?auto_821583 ) ) ( not ( = ?auto_821582 ?auto_821583 ) ) ( ON ?auto_821581 ?auto_821582 ) ( ON ?auto_821580 ?auto_821581 ) ( ON ?auto_821579 ?auto_821580 ) ( ON ?auto_821578 ?auto_821579 ) ( ON ?auto_821577 ?auto_821578 ) ( ON ?auto_821576 ?auto_821577 ) ( ON ?auto_821575 ?auto_821576 ) ( ON ?auto_821574 ?auto_821575 ) ( ON ?auto_821573 ?auto_821574 ) ( ON ?auto_821572 ?auto_821573 ) ( ON ?auto_821571 ?auto_821572 ) ( CLEAR ?auto_821571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_821571 )
      ( MAKE-12PILE ?auto_821571 ?auto_821572 ?auto_821573 ?auto_821574 ?auto_821575 ?auto_821576 ?auto_821577 ?auto_821578 ?auto_821579 ?auto_821580 ?auto_821581 ?auto_821582 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_821622 - BLOCK
      ?auto_821623 - BLOCK
      ?auto_821624 - BLOCK
      ?auto_821625 - BLOCK
      ?auto_821626 - BLOCK
      ?auto_821627 - BLOCK
      ?auto_821628 - BLOCK
      ?auto_821629 - BLOCK
      ?auto_821630 - BLOCK
      ?auto_821631 - BLOCK
      ?auto_821632 - BLOCK
      ?auto_821633 - BLOCK
      ?auto_821634 - BLOCK
    )
    :vars
    (
      ?auto_821635 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_821633 ) ( ON ?auto_821634 ?auto_821635 ) ( CLEAR ?auto_821634 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_821622 ) ( ON ?auto_821623 ?auto_821622 ) ( ON ?auto_821624 ?auto_821623 ) ( ON ?auto_821625 ?auto_821624 ) ( ON ?auto_821626 ?auto_821625 ) ( ON ?auto_821627 ?auto_821626 ) ( ON ?auto_821628 ?auto_821627 ) ( ON ?auto_821629 ?auto_821628 ) ( ON ?auto_821630 ?auto_821629 ) ( ON ?auto_821631 ?auto_821630 ) ( ON ?auto_821632 ?auto_821631 ) ( ON ?auto_821633 ?auto_821632 ) ( not ( = ?auto_821622 ?auto_821623 ) ) ( not ( = ?auto_821622 ?auto_821624 ) ) ( not ( = ?auto_821622 ?auto_821625 ) ) ( not ( = ?auto_821622 ?auto_821626 ) ) ( not ( = ?auto_821622 ?auto_821627 ) ) ( not ( = ?auto_821622 ?auto_821628 ) ) ( not ( = ?auto_821622 ?auto_821629 ) ) ( not ( = ?auto_821622 ?auto_821630 ) ) ( not ( = ?auto_821622 ?auto_821631 ) ) ( not ( = ?auto_821622 ?auto_821632 ) ) ( not ( = ?auto_821622 ?auto_821633 ) ) ( not ( = ?auto_821622 ?auto_821634 ) ) ( not ( = ?auto_821622 ?auto_821635 ) ) ( not ( = ?auto_821623 ?auto_821624 ) ) ( not ( = ?auto_821623 ?auto_821625 ) ) ( not ( = ?auto_821623 ?auto_821626 ) ) ( not ( = ?auto_821623 ?auto_821627 ) ) ( not ( = ?auto_821623 ?auto_821628 ) ) ( not ( = ?auto_821623 ?auto_821629 ) ) ( not ( = ?auto_821623 ?auto_821630 ) ) ( not ( = ?auto_821623 ?auto_821631 ) ) ( not ( = ?auto_821623 ?auto_821632 ) ) ( not ( = ?auto_821623 ?auto_821633 ) ) ( not ( = ?auto_821623 ?auto_821634 ) ) ( not ( = ?auto_821623 ?auto_821635 ) ) ( not ( = ?auto_821624 ?auto_821625 ) ) ( not ( = ?auto_821624 ?auto_821626 ) ) ( not ( = ?auto_821624 ?auto_821627 ) ) ( not ( = ?auto_821624 ?auto_821628 ) ) ( not ( = ?auto_821624 ?auto_821629 ) ) ( not ( = ?auto_821624 ?auto_821630 ) ) ( not ( = ?auto_821624 ?auto_821631 ) ) ( not ( = ?auto_821624 ?auto_821632 ) ) ( not ( = ?auto_821624 ?auto_821633 ) ) ( not ( = ?auto_821624 ?auto_821634 ) ) ( not ( = ?auto_821624 ?auto_821635 ) ) ( not ( = ?auto_821625 ?auto_821626 ) ) ( not ( = ?auto_821625 ?auto_821627 ) ) ( not ( = ?auto_821625 ?auto_821628 ) ) ( not ( = ?auto_821625 ?auto_821629 ) ) ( not ( = ?auto_821625 ?auto_821630 ) ) ( not ( = ?auto_821625 ?auto_821631 ) ) ( not ( = ?auto_821625 ?auto_821632 ) ) ( not ( = ?auto_821625 ?auto_821633 ) ) ( not ( = ?auto_821625 ?auto_821634 ) ) ( not ( = ?auto_821625 ?auto_821635 ) ) ( not ( = ?auto_821626 ?auto_821627 ) ) ( not ( = ?auto_821626 ?auto_821628 ) ) ( not ( = ?auto_821626 ?auto_821629 ) ) ( not ( = ?auto_821626 ?auto_821630 ) ) ( not ( = ?auto_821626 ?auto_821631 ) ) ( not ( = ?auto_821626 ?auto_821632 ) ) ( not ( = ?auto_821626 ?auto_821633 ) ) ( not ( = ?auto_821626 ?auto_821634 ) ) ( not ( = ?auto_821626 ?auto_821635 ) ) ( not ( = ?auto_821627 ?auto_821628 ) ) ( not ( = ?auto_821627 ?auto_821629 ) ) ( not ( = ?auto_821627 ?auto_821630 ) ) ( not ( = ?auto_821627 ?auto_821631 ) ) ( not ( = ?auto_821627 ?auto_821632 ) ) ( not ( = ?auto_821627 ?auto_821633 ) ) ( not ( = ?auto_821627 ?auto_821634 ) ) ( not ( = ?auto_821627 ?auto_821635 ) ) ( not ( = ?auto_821628 ?auto_821629 ) ) ( not ( = ?auto_821628 ?auto_821630 ) ) ( not ( = ?auto_821628 ?auto_821631 ) ) ( not ( = ?auto_821628 ?auto_821632 ) ) ( not ( = ?auto_821628 ?auto_821633 ) ) ( not ( = ?auto_821628 ?auto_821634 ) ) ( not ( = ?auto_821628 ?auto_821635 ) ) ( not ( = ?auto_821629 ?auto_821630 ) ) ( not ( = ?auto_821629 ?auto_821631 ) ) ( not ( = ?auto_821629 ?auto_821632 ) ) ( not ( = ?auto_821629 ?auto_821633 ) ) ( not ( = ?auto_821629 ?auto_821634 ) ) ( not ( = ?auto_821629 ?auto_821635 ) ) ( not ( = ?auto_821630 ?auto_821631 ) ) ( not ( = ?auto_821630 ?auto_821632 ) ) ( not ( = ?auto_821630 ?auto_821633 ) ) ( not ( = ?auto_821630 ?auto_821634 ) ) ( not ( = ?auto_821630 ?auto_821635 ) ) ( not ( = ?auto_821631 ?auto_821632 ) ) ( not ( = ?auto_821631 ?auto_821633 ) ) ( not ( = ?auto_821631 ?auto_821634 ) ) ( not ( = ?auto_821631 ?auto_821635 ) ) ( not ( = ?auto_821632 ?auto_821633 ) ) ( not ( = ?auto_821632 ?auto_821634 ) ) ( not ( = ?auto_821632 ?auto_821635 ) ) ( not ( = ?auto_821633 ?auto_821634 ) ) ( not ( = ?auto_821633 ?auto_821635 ) ) ( not ( = ?auto_821634 ?auto_821635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_821634 ?auto_821635 )
      ( !STACK ?auto_821634 ?auto_821633 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_821676 - BLOCK
      ?auto_821677 - BLOCK
      ?auto_821678 - BLOCK
      ?auto_821679 - BLOCK
      ?auto_821680 - BLOCK
      ?auto_821681 - BLOCK
      ?auto_821682 - BLOCK
      ?auto_821683 - BLOCK
      ?auto_821684 - BLOCK
      ?auto_821685 - BLOCK
      ?auto_821686 - BLOCK
      ?auto_821687 - BLOCK
      ?auto_821688 - BLOCK
    )
    :vars
    (
      ?auto_821689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821688 ?auto_821689 ) ( ON-TABLE ?auto_821676 ) ( ON ?auto_821677 ?auto_821676 ) ( ON ?auto_821678 ?auto_821677 ) ( ON ?auto_821679 ?auto_821678 ) ( ON ?auto_821680 ?auto_821679 ) ( ON ?auto_821681 ?auto_821680 ) ( ON ?auto_821682 ?auto_821681 ) ( ON ?auto_821683 ?auto_821682 ) ( ON ?auto_821684 ?auto_821683 ) ( ON ?auto_821685 ?auto_821684 ) ( ON ?auto_821686 ?auto_821685 ) ( not ( = ?auto_821676 ?auto_821677 ) ) ( not ( = ?auto_821676 ?auto_821678 ) ) ( not ( = ?auto_821676 ?auto_821679 ) ) ( not ( = ?auto_821676 ?auto_821680 ) ) ( not ( = ?auto_821676 ?auto_821681 ) ) ( not ( = ?auto_821676 ?auto_821682 ) ) ( not ( = ?auto_821676 ?auto_821683 ) ) ( not ( = ?auto_821676 ?auto_821684 ) ) ( not ( = ?auto_821676 ?auto_821685 ) ) ( not ( = ?auto_821676 ?auto_821686 ) ) ( not ( = ?auto_821676 ?auto_821687 ) ) ( not ( = ?auto_821676 ?auto_821688 ) ) ( not ( = ?auto_821676 ?auto_821689 ) ) ( not ( = ?auto_821677 ?auto_821678 ) ) ( not ( = ?auto_821677 ?auto_821679 ) ) ( not ( = ?auto_821677 ?auto_821680 ) ) ( not ( = ?auto_821677 ?auto_821681 ) ) ( not ( = ?auto_821677 ?auto_821682 ) ) ( not ( = ?auto_821677 ?auto_821683 ) ) ( not ( = ?auto_821677 ?auto_821684 ) ) ( not ( = ?auto_821677 ?auto_821685 ) ) ( not ( = ?auto_821677 ?auto_821686 ) ) ( not ( = ?auto_821677 ?auto_821687 ) ) ( not ( = ?auto_821677 ?auto_821688 ) ) ( not ( = ?auto_821677 ?auto_821689 ) ) ( not ( = ?auto_821678 ?auto_821679 ) ) ( not ( = ?auto_821678 ?auto_821680 ) ) ( not ( = ?auto_821678 ?auto_821681 ) ) ( not ( = ?auto_821678 ?auto_821682 ) ) ( not ( = ?auto_821678 ?auto_821683 ) ) ( not ( = ?auto_821678 ?auto_821684 ) ) ( not ( = ?auto_821678 ?auto_821685 ) ) ( not ( = ?auto_821678 ?auto_821686 ) ) ( not ( = ?auto_821678 ?auto_821687 ) ) ( not ( = ?auto_821678 ?auto_821688 ) ) ( not ( = ?auto_821678 ?auto_821689 ) ) ( not ( = ?auto_821679 ?auto_821680 ) ) ( not ( = ?auto_821679 ?auto_821681 ) ) ( not ( = ?auto_821679 ?auto_821682 ) ) ( not ( = ?auto_821679 ?auto_821683 ) ) ( not ( = ?auto_821679 ?auto_821684 ) ) ( not ( = ?auto_821679 ?auto_821685 ) ) ( not ( = ?auto_821679 ?auto_821686 ) ) ( not ( = ?auto_821679 ?auto_821687 ) ) ( not ( = ?auto_821679 ?auto_821688 ) ) ( not ( = ?auto_821679 ?auto_821689 ) ) ( not ( = ?auto_821680 ?auto_821681 ) ) ( not ( = ?auto_821680 ?auto_821682 ) ) ( not ( = ?auto_821680 ?auto_821683 ) ) ( not ( = ?auto_821680 ?auto_821684 ) ) ( not ( = ?auto_821680 ?auto_821685 ) ) ( not ( = ?auto_821680 ?auto_821686 ) ) ( not ( = ?auto_821680 ?auto_821687 ) ) ( not ( = ?auto_821680 ?auto_821688 ) ) ( not ( = ?auto_821680 ?auto_821689 ) ) ( not ( = ?auto_821681 ?auto_821682 ) ) ( not ( = ?auto_821681 ?auto_821683 ) ) ( not ( = ?auto_821681 ?auto_821684 ) ) ( not ( = ?auto_821681 ?auto_821685 ) ) ( not ( = ?auto_821681 ?auto_821686 ) ) ( not ( = ?auto_821681 ?auto_821687 ) ) ( not ( = ?auto_821681 ?auto_821688 ) ) ( not ( = ?auto_821681 ?auto_821689 ) ) ( not ( = ?auto_821682 ?auto_821683 ) ) ( not ( = ?auto_821682 ?auto_821684 ) ) ( not ( = ?auto_821682 ?auto_821685 ) ) ( not ( = ?auto_821682 ?auto_821686 ) ) ( not ( = ?auto_821682 ?auto_821687 ) ) ( not ( = ?auto_821682 ?auto_821688 ) ) ( not ( = ?auto_821682 ?auto_821689 ) ) ( not ( = ?auto_821683 ?auto_821684 ) ) ( not ( = ?auto_821683 ?auto_821685 ) ) ( not ( = ?auto_821683 ?auto_821686 ) ) ( not ( = ?auto_821683 ?auto_821687 ) ) ( not ( = ?auto_821683 ?auto_821688 ) ) ( not ( = ?auto_821683 ?auto_821689 ) ) ( not ( = ?auto_821684 ?auto_821685 ) ) ( not ( = ?auto_821684 ?auto_821686 ) ) ( not ( = ?auto_821684 ?auto_821687 ) ) ( not ( = ?auto_821684 ?auto_821688 ) ) ( not ( = ?auto_821684 ?auto_821689 ) ) ( not ( = ?auto_821685 ?auto_821686 ) ) ( not ( = ?auto_821685 ?auto_821687 ) ) ( not ( = ?auto_821685 ?auto_821688 ) ) ( not ( = ?auto_821685 ?auto_821689 ) ) ( not ( = ?auto_821686 ?auto_821687 ) ) ( not ( = ?auto_821686 ?auto_821688 ) ) ( not ( = ?auto_821686 ?auto_821689 ) ) ( not ( = ?auto_821687 ?auto_821688 ) ) ( not ( = ?auto_821687 ?auto_821689 ) ) ( not ( = ?auto_821688 ?auto_821689 ) ) ( CLEAR ?auto_821686 ) ( ON ?auto_821687 ?auto_821688 ) ( CLEAR ?auto_821687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_821676 ?auto_821677 ?auto_821678 ?auto_821679 ?auto_821680 ?auto_821681 ?auto_821682 ?auto_821683 ?auto_821684 ?auto_821685 ?auto_821686 ?auto_821687 )
      ( MAKE-13PILE ?auto_821676 ?auto_821677 ?auto_821678 ?auto_821679 ?auto_821680 ?auto_821681 ?auto_821682 ?auto_821683 ?auto_821684 ?auto_821685 ?auto_821686 ?auto_821687 ?auto_821688 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_821730 - BLOCK
      ?auto_821731 - BLOCK
      ?auto_821732 - BLOCK
      ?auto_821733 - BLOCK
      ?auto_821734 - BLOCK
      ?auto_821735 - BLOCK
      ?auto_821736 - BLOCK
      ?auto_821737 - BLOCK
      ?auto_821738 - BLOCK
      ?auto_821739 - BLOCK
      ?auto_821740 - BLOCK
      ?auto_821741 - BLOCK
      ?auto_821742 - BLOCK
    )
    :vars
    (
      ?auto_821743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821742 ?auto_821743 ) ( ON-TABLE ?auto_821730 ) ( ON ?auto_821731 ?auto_821730 ) ( ON ?auto_821732 ?auto_821731 ) ( ON ?auto_821733 ?auto_821732 ) ( ON ?auto_821734 ?auto_821733 ) ( ON ?auto_821735 ?auto_821734 ) ( ON ?auto_821736 ?auto_821735 ) ( ON ?auto_821737 ?auto_821736 ) ( ON ?auto_821738 ?auto_821737 ) ( ON ?auto_821739 ?auto_821738 ) ( not ( = ?auto_821730 ?auto_821731 ) ) ( not ( = ?auto_821730 ?auto_821732 ) ) ( not ( = ?auto_821730 ?auto_821733 ) ) ( not ( = ?auto_821730 ?auto_821734 ) ) ( not ( = ?auto_821730 ?auto_821735 ) ) ( not ( = ?auto_821730 ?auto_821736 ) ) ( not ( = ?auto_821730 ?auto_821737 ) ) ( not ( = ?auto_821730 ?auto_821738 ) ) ( not ( = ?auto_821730 ?auto_821739 ) ) ( not ( = ?auto_821730 ?auto_821740 ) ) ( not ( = ?auto_821730 ?auto_821741 ) ) ( not ( = ?auto_821730 ?auto_821742 ) ) ( not ( = ?auto_821730 ?auto_821743 ) ) ( not ( = ?auto_821731 ?auto_821732 ) ) ( not ( = ?auto_821731 ?auto_821733 ) ) ( not ( = ?auto_821731 ?auto_821734 ) ) ( not ( = ?auto_821731 ?auto_821735 ) ) ( not ( = ?auto_821731 ?auto_821736 ) ) ( not ( = ?auto_821731 ?auto_821737 ) ) ( not ( = ?auto_821731 ?auto_821738 ) ) ( not ( = ?auto_821731 ?auto_821739 ) ) ( not ( = ?auto_821731 ?auto_821740 ) ) ( not ( = ?auto_821731 ?auto_821741 ) ) ( not ( = ?auto_821731 ?auto_821742 ) ) ( not ( = ?auto_821731 ?auto_821743 ) ) ( not ( = ?auto_821732 ?auto_821733 ) ) ( not ( = ?auto_821732 ?auto_821734 ) ) ( not ( = ?auto_821732 ?auto_821735 ) ) ( not ( = ?auto_821732 ?auto_821736 ) ) ( not ( = ?auto_821732 ?auto_821737 ) ) ( not ( = ?auto_821732 ?auto_821738 ) ) ( not ( = ?auto_821732 ?auto_821739 ) ) ( not ( = ?auto_821732 ?auto_821740 ) ) ( not ( = ?auto_821732 ?auto_821741 ) ) ( not ( = ?auto_821732 ?auto_821742 ) ) ( not ( = ?auto_821732 ?auto_821743 ) ) ( not ( = ?auto_821733 ?auto_821734 ) ) ( not ( = ?auto_821733 ?auto_821735 ) ) ( not ( = ?auto_821733 ?auto_821736 ) ) ( not ( = ?auto_821733 ?auto_821737 ) ) ( not ( = ?auto_821733 ?auto_821738 ) ) ( not ( = ?auto_821733 ?auto_821739 ) ) ( not ( = ?auto_821733 ?auto_821740 ) ) ( not ( = ?auto_821733 ?auto_821741 ) ) ( not ( = ?auto_821733 ?auto_821742 ) ) ( not ( = ?auto_821733 ?auto_821743 ) ) ( not ( = ?auto_821734 ?auto_821735 ) ) ( not ( = ?auto_821734 ?auto_821736 ) ) ( not ( = ?auto_821734 ?auto_821737 ) ) ( not ( = ?auto_821734 ?auto_821738 ) ) ( not ( = ?auto_821734 ?auto_821739 ) ) ( not ( = ?auto_821734 ?auto_821740 ) ) ( not ( = ?auto_821734 ?auto_821741 ) ) ( not ( = ?auto_821734 ?auto_821742 ) ) ( not ( = ?auto_821734 ?auto_821743 ) ) ( not ( = ?auto_821735 ?auto_821736 ) ) ( not ( = ?auto_821735 ?auto_821737 ) ) ( not ( = ?auto_821735 ?auto_821738 ) ) ( not ( = ?auto_821735 ?auto_821739 ) ) ( not ( = ?auto_821735 ?auto_821740 ) ) ( not ( = ?auto_821735 ?auto_821741 ) ) ( not ( = ?auto_821735 ?auto_821742 ) ) ( not ( = ?auto_821735 ?auto_821743 ) ) ( not ( = ?auto_821736 ?auto_821737 ) ) ( not ( = ?auto_821736 ?auto_821738 ) ) ( not ( = ?auto_821736 ?auto_821739 ) ) ( not ( = ?auto_821736 ?auto_821740 ) ) ( not ( = ?auto_821736 ?auto_821741 ) ) ( not ( = ?auto_821736 ?auto_821742 ) ) ( not ( = ?auto_821736 ?auto_821743 ) ) ( not ( = ?auto_821737 ?auto_821738 ) ) ( not ( = ?auto_821737 ?auto_821739 ) ) ( not ( = ?auto_821737 ?auto_821740 ) ) ( not ( = ?auto_821737 ?auto_821741 ) ) ( not ( = ?auto_821737 ?auto_821742 ) ) ( not ( = ?auto_821737 ?auto_821743 ) ) ( not ( = ?auto_821738 ?auto_821739 ) ) ( not ( = ?auto_821738 ?auto_821740 ) ) ( not ( = ?auto_821738 ?auto_821741 ) ) ( not ( = ?auto_821738 ?auto_821742 ) ) ( not ( = ?auto_821738 ?auto_821743 ) ) ( not ( = ?auto_821739 ?auto_821740 ) ) ( not ( = ?auto_821739 ?auto_821741 ) ) ( not ( = ?auto_821739 ?auto_821742 ) ) ( not ( = ?auto_821739 ?auto_821743 ) ) ( not ( = ?auto_821740 ?auto_821741 ) ) ( not ( = ?auto_821740 ?auto_821742 ) ) ( not ( = ?auto_821740 ?auto_821743 ) ) ( not ( = ?auto_821741 ?auto_821742 ) ) ( not ( = ?auto_821741 ?auto_821743 ) ) ( not ( = ?auto_821742 ?auto_821743 ) ) ( ON ?auto_821741 ?auto_821742 ) ( CLEAR ?auto_821739 ) ( ON ?auto_821740 ?auto_821741 ) ( CLEAR ?auto_821740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_821730 ?auto_821731 ?auto_821732 ?auto_821733 ?auto_821734 ?auto_821735 ?auto_821736 ?auto_821737 ?auto_821738 ?auto_821739 ?auto_821740 )
      ( MAKE-13PILE ?auto_821730 ?auto_821731 ?auto_821732 ?auto_821733 ?auto_821734 ?auto_821735 ?auto_821736 ?auto_821737 ?auto_821738 ?auto_821739 ?auto_821740 ?auto_821741 ?auto_821742 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_821784 - BLOCK
      ?auto_821785 - BLOCK
      ?auto_821786 - BLOCK
      ?auto_821787 - BLOCK
      ?auto_821788 - BLOCK
      ?auto_821789 - BLOCK
      ?auto_821790 - BLOCK
      ?auto_821791 - BLOCK
      ?auto_821792 - BLOCK
      ?auto_821793 - BLOCK
      ?auto_821794 - BLOCK
      ?auto_821795 - BLOCK
      ?auto_821796 - BLOCK
    )
    :vars
    (
      ?auto_821797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821796 ?auto_821797 ) ( ON-TABLE ?auto_821784 ) ( ON ?auto_821785 ?auto_821784 ) ( ON ?auto_821786 ?auto_821785 ) ( ON ?auto_821787 ?auto_821786 ) ( ON ?auto_821788 ?auto_821787 ) ( ON ?auto_821789 ?auto_821788 ) ( ON ?auto_821790 ?auto_821789 ) ( ON ?auto_821791 ?auto_821790 ) ( ON ?auto_821792 ?auto_821791 ) ( not ( = ?auto_821784 ?auto_821785 ) ) ( not ( = ?auto_821784 ?auto_821786 ) ) ( not ( = ?auto_821784 ?auto_821787 ) ) ( not ( = ?auto_821784 ?auto_821788 ) ) ( not ( = ?auto_821784 ?auto_821789 ) ) ( not ( = ?auto_821784 ?auto_821790 ) ) ( not ( = ?auto_821784 ?auto_821791 ) ) ( not ( = ?auto_821784 ?auto_821792 ) ) ( not ( = ?auto_821784 ?auto_821793 ) ) ( not ( = ?auto_821784 ?auto_821794 ) ) ( not ( = ?auto_821784 ?auto_821795 ) ) ( not ( = ?auto_821784 ?auto_821796 ) ) ( not ( = ?auto_821784 ?auto_821797 ) ) ( not ( = ?auto_821785 ?auto_821786 ) ) ( not ( = ?auto_821785 ?auto_821787 ) ) ( not ( = ?auto_821785 ?auto_821788 ) ) ( not ( = ?auto_821785 ?auto_821789 ) ) ( not ( = ?auto_821785 ?auto_821790 ) ) ( not ( = ?auto_821785 ?auto_821791 ) ) ( not ( = ?auto_821785 ?auto_821792 ) ) ( not ( = ?auto_821785 ?auto_821793 ) ) ( not ( = ?auto_821785 ?auto_821794 ) ) ( not ( = ?auto_821785 ?auto_821795 ) ) ( not ( = ?auto_821785 ?auto_821796 ) ) ( not ( = ?auto_821785 ?auto_821797 ) ) ( not ( = ?auto_821786 ?auto_821787 ) ) ( not ( = ?auto_821786 ?auto_821788 ) ) ( not ( = ?auto_821786 ?auto_821789 ) ) ( not ( = ?auto_821786 ?auto_821790 ) ) ( not ( = ?auto_821786 ?auto_821791 ) ) ( not ( = ?auto_821786 ?auto_821792 ) ) ( not ( = ?auto_821786 ?auto_821793 ) ) ( not ( = ?auto_821786 ?auto_821794 ) ) ( not ( = ?auto_821786 ?auto_821795 ) ) ( not ( = ?auto_821786 ?auto_821796 ) ) ( not ( = ?auto_821786 ?auto_821797 ) ) ( not ( = ?auto_821787 ?auto_821788 ) ) ( not ( = ?auto_821787 ?auto_821789 ) ) ( not ( = ?auto_821787 ?auto_821790 ) ) ( not ( = ?auto_821787 ?auto_821791 ) ) ( not ( = ?auto_821787 ?auto_821792 ) ) ( not ( = ?auto_821787 ?auto_821793 ) ) ( not ( = ?auto_821787 ?auto_821794 ) ) ( not ( = ?auto_821787 ?auto_821795 ) ) ( not ( = ?auto_821787 ?auto_821796 ) ) ( not ( = ?auto_821787 ?auto_821797 ) ) ( not ( = ?auto_821788 ?auto_821789 ) ) ( not ( = ?auto_821788 ?auto_821790 ) ) ( not ( = ?auto_821788 ?auto_821791 ) ) ( not ( = ?auto_821788 ?auto_821792 ) ) ( not ( = ?auto_821788 ?auto_821793 ) ) ( not ( = ?auto_821788 ?auto_821794 ) ) ( not ( = ?auto_821788 ?auto_821795 ) ) ( not ( = ?auto_821788 ?auto_821796 ) ) ( not ( = ?auto_821788 ?auto_821797 ) ) ( not ( = ?auto_821789 ?auto_821790 ) ) ( not ( = ?auto_821789 ?auto_821791 ) ) ( not ( = ?auto_821789 ?auto_821792 ) ) ( not ( = ?auto_821789 ?auto_821793 ) ) ( not ( = ?auto_821789 ?auto_821794 ) ) ( not ( = ?auto_821789 ?auto_821795 ) ) ( not ( = ?auto_821789 ?auto_821796 ) ) ( not ( = ?auto_821789 ?auto_821797 ) ) ( not ( = ?auto_821790 ?auto_821791 ) ) ( not ( = ?auto_821790 ?auto_821792 ) ) ( not ( = ?auto_821790 ?auto_821793 ) ) ( not ( = ?auto_821790 ?auto_821794 ) ) ( not ( = ?auto_821790 ?auto_821795 ) ) ( not ( = ?auto_821790 ?auto_821796 ) ) ( not ( = ?auto_821790 ?auto_821797 ) ) ( not ( = ?auto_821791 ?auto_821792 ) ) ( not ( = ?auto_821791 ?auto_821793 ) ) ( not ( = ?auto_821791 ?auto_821794 ) ) ( not ( = ?auto_821791 ?auto_821795 ) ) ( not ( = ?auto_821791 ?auto_821796 ) ) ( not ( = ?auto_821791 ?auto_821797 ) ) ( not ( = ?auto_821792 ?auto_821793 ) ) ( not ( = ?auto_821792 ?auto_821794 ) ) ( not ( = ?auto_821792 ?auto_821795 ) ) ( not ( = ?auto_821792 ?auto_821796 ) ) ( not ( = ?auto_821792 ?auto_821797 ) ) ( not ( = ?auto_821793 ?auto_821794 ) ) ( not ( = ?auto_821793 ?auto_821795 ) ) ( not ( = ?auto_821793 ?auto_821796 ) ) ( not ( = ?auto_821793 ?auto_821797 ) ) ( not ( = ?auto_821794 ?auto_821795 ) ) ( not ( = ?auto_821794 ?auto_821796 ) ) ( not ( = ?auto_821794 ?auto_821797 ) ) ( not ( = ?auto_821795 ?auto_821796 ) ) ( not ( = ?auto_821795 ?auto_821797 ) ) ( not ( = ?auto_821796 ?auto_821797 ) ) ( ON ?auto_821795 ?auto_821796 ) ( ON ?auto_821794 ?auto_821795 ) ( CLEAR ?auto_821792 ) ( ON ?auto_821793 ?auto_821794 ) ( CLEAR ?auto_821793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_821784 ?auto_821785 ?auto_821786 ?auto_821787 ?auto_821788 ?auto_821789 ?auto_821790 ?auto_821791 ?auto_821792 ?auto_821793 )
      ( MAKE-13PILE ?auto_821784 ?auto_821785 ?auto_821786 ?auto_821787 ?auto_821788 ?auto_821789 ?auto_821790 ?auto_821791 ?auto_821792 ?auto_821793 ?auto_821794 ?auto_821795 ?auto_821796 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_821838 - BLOCK
      ?auto_821839 - BLOCK
      ?auto_821840 - BLOCK
      ?auto_821841 - BLOCK
      ?auto_821842 - BLOCK
      ?auto_821843 - BLOCK
      ?auto_821844 - BLOCK
      ?auto_821845 - BLOCK
      ?auto_821846 - BLOCK
      ?auto_821847 - BLOCK
      ?auto_821848 - BLOCK
      ?auto_821849 - BLOCK
      ?auto_821850 - BLOCK
    )
    :vars
    (
      ?auto_821851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821850 ?auto_821851 ) ( ON-TABLE ?auto_821838 ) ( ON ?auto_821839 ?auto_821838 ) ( ON ?auto_821840 ?auto_821839 ) ( ON ?auto_821841 ?auto_821840 ) ( ON ?auto_821842 ?auto_821841 ) ( ON ?auto_821843 ?auto_821842 ) ( ON ?auto_821844 ?auto_821843 ) ( ON ?auto_821845 ?auto_821844 ) ( not ( = ?auto_821838 ?auto_821839 ) ) ( not ( = ?auto_821838 ?auto_821840 ) ) ( not ( = ?auto_821838 ?auto_821841 ) ) ( not ( = ?auto_821838 ?auto_821842 ) ) ( not ( = ?auto_821838 ?auto_821843 ) ) ( not ( = ?auto_821838 ?auto_821844 ) ) ( not ( = ?auto_821838 ?auto_821845 ) ) ( not ( = ?auto_821838 ?auto_821846 ) ) ( not ( = ?auto_821838 ?auto_821847 ) ) ( not ( = ?auto_821838 ?auto_821848 ) ) ( not ( = ?auto_821838 ?auto_821849 ) ) ( not ( = ?auto_821838 ?auto_821850 ) ) ( not ( = ?auto_821838 ?auto_821851 ) ) ( not ( = ?auto_821839 ?auto_821840 ) ) ( not ( = ?auto_821839 ?auto_821841 ) ) ( not ( = ?auto_821839 ?auto_821842 ) ) ( not ( = ?auto_821839 ?auto_821843 ) ) ( not ( = ?auto_821839 ?auto_821844 ) ) ( not ( = ?auto_821839 ?auto_821845 ) ) ( not ( = ?auto_821839 ?auto_821846 ) ) ( not ( = ?auto_821839 ?auto_821847 ) ) ( not ( = ?auto_821839 ?auto_821848 ) ) ( not ( = ?auto_821839 ?auto_821849 ) ) ( not ( = ?auto_821839 ?auto_821850 ) ) ( not ( = ?auto_821839 ?auto_821851 ) ) ( not ( = ?auto_821840 ?auto_821841 ) ) ( not ( = ?auto_821840 ?auto_821842 ) ) ( not ( = ?auto_821840 ?auto_821843 ) ) ( not ( = ?auto_821840 ?auto_821844 ) ) ( not ( = ?auto_821840 ?auto_821845 ) ) ( not ( = ?auto_821840 ?auto_821846 ) ) ( not ( = ?auto_821840 ?auto_821847 ) ) ( not ( = ?auto_821840 ?auto_821848 ) ) ( not ( = ?auto_821840 ?auto_821849 ) ) ( not ( = ?auto_821840 ?auto_821850 ) ) ( not ( = ?auto_821840 ?auto_821851 ) ) ( not ( = ?auto_821841 ?auto_821842 ) ) ( not ( = ?auto_821841 ?auto_821843 ) ) ( not ( = ?auto_821841 ?auto_821844 ) ) ( not ( = ?auto_821841 ?auto_821845 ) ) ( not ( = ?auto_821841 ?auto_821846 ) ) ( not ( = ?auto_821841 ?auto_821847 ) ) ( not ( = ?auto_821841 ?auto_821848 ) ) ( not ( = ?auto_821841 ?auto_821849 ) ) ( not ( = ?auto_821841 ?auto_821850 ) ) ( not ( = ?auto_821841 ?auto_821851 ) ) ( not ( = ?auto_821842 ?auto_821843 ) ) ( not ( = ?auto_821842 ?auto_821844 ) ) ( not ( = ?auto_821842 ?auto_821845 ) ) ( not ( = ?auto_821842 ?auto_821846 ) ) ( not ( = ?auto_821842 ?auto_821847 ) ) ( not ( = ?auto_821842 ?auto_821848 ) ) ( not ( = ?auto_821842 ?auto_821849 ) ) ( not ( = ?auto_821842 ?auto_821850 ) ) ( not ( = ?auto_821842 ?auto_821851 ) ) ( not ( = ?auto_821843 ?auto_821844 ) ) ( not ( = ?auto_821843 ?auto_821845 ) ) ( not ( = ?auto_821843 ?auto_821846 ) ) ( not ( = ?auto_821843 ?auto_821847 ) ) ( not ( = ?auto_821843 ?auto_821848 ) ) ( not ( = ?auto_821843 ?auto_821849 ) ) ( not ( = ?auto_821843 ?auto_821850 ) ) ( not ( = ?auto_821843 ?auto_821851 ) ) ( not ( = ?auto_821844 ?auto_821845 ) ) ( not ( = ?auto_821844 ?auto_821846 ) ) ( not ( = ?auto_821844 ?auto_821847 ) ) ( not ( = ?auto_821844 ?auto_821848 ) ) ( not ( = ?auto_821844 ?auto_821849 ) ) ( not ( = ?auto_821844 ?auto_821850 ) ) ( not ( = ?auto_821844 ?auto_821851 ) ) ( not ( = ?auto_821845 ?auto_821846 ) ) ( not ( = ?auto_821845 ?auto_821847 ) ) ( not ( = ?auto_821845 ?auto_821848 ) ) ( not ( = ?auto_821845 ?auto_821849 ) ) ( not ( = ?auto_821845 ?auto_821850 ) ) ( not ( = ?auto_821845 ?auto_821851 ) ) ( not ( = ?auto_821846 ?auto_821847 ) ) ( not ( = ?auto_821846 ?auto_821848 ) ) ( not ( = ?auto_821846 ?auto_821849 ) ) ( not ( = ?auto_821846 ?auto_821850 ) ) ( not ( = ?auto_821846 ?auto_821851 ) ) ( not ( = ?auto_821847 ?auto_821848 ) ) ( not ( = ?auto_821847 ?auto_821849 ) ) ( not ( = ?auto_821847 ?auto_821850 ) ) ( not ( = ?auto_821847 ?auto_821851 ) ) ( not ( = ?auto_821848 ?auto_821849 ) ) ( not ( = ?auto_821848 ?auto_821850 ) ) ( not ( = ?auto_821848 ?auto_821851 ) ) ( not ( = ?auto_821849 ?auto_821850 ) ) ( not ( = ?auto_821849 ?auto_821851 ) ) ( not ( = ?auto_821850 ?auto_821851 ) ) ( ON ?auto_821849 ?auto_821850 ) ( ON ?auto_821848 ?auto_821849 ) ( ON ?auto_821847 ?auto_821848 ) ( CLEAR ?auto_821845 ) ( ON ?auto_821846 ?auto_821847 ) ( CLEAR ?auto_821846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_821838 ?auto_821839 ?auto_821840 ?auto_821841 ?auto_821842 ?auto_821843 ?auto_821844 ?auto_821845 ?auto_821846 )
      ( MAKE-13PILE ?auto_821838 ?auto_821839 ?auto_821840 ?auto_821841 ?auto_821842 ?auto_821843 ?auto_821844 ?auto_821845 ?auto_821846 ?auto_821847 ?auto_821848 ?auto_821849 ?auto_821850 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_821892 - BLOCK
      ?auto_821893 - BLOCK
      ?auto_821894 - BLOCK
      ?auto_821895 - BLOCK
      ?auto_821896 - BLOCK
      ?auto_821897 - BLOCK
      ?auto_821898 - BLOCK
      ?auto_821899 - BLOCK
      ?auto_821900 - BLOCK
      ?auto_821901 - BLOCK
      ?auto_821902 - BLOCK
      ?auto_821903 - BLOCK
      ?auto_821904 - BLOCK
    )
    :vars
    (
      ?auto_821905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821904 ?auto_821905 ) ( ON-TABLE ?auto_821892 ) ( ON ?auto_821893 ?auto_821892 ) ( ON ?auto_821894 ?auto_821893 ) ( ON ?auto_821895 ?auto_821894 ) ( ON ?auto_821896 ?auto_821895 ) ( ON ?auto_821897 ?auto_821896 ) ( ON ?auto_821898 ?auto_821897 ) ( not ( = ?auto_821892 ?auto_821893 ) ) ( not ( = ?auto_821892 ?auto_821894 ) ) ( not ( = ?auto_821892 ?auto_821895 ) ) ( not ( = ?auto_821892 ?auto_821896 ) ) ( not ( = ?auto_821892 ?auto_821897 ) ) ( not ( = ?auto_821892 ?auto_821898 ) ) ( not ( = ?auto_821892 ?auto_821899 ) ) ( not ( = ?auto_821892 ?auto_821900 ) ) ( not ( = ?auto_821892 ?auto_821901 ) ) ( not ( = ?auto_821892 ?auto_821902 ) ) ( not ( = ?auto_821892 ?auto_821903 ) ) ( not ( = ?auto_821892 ?auto_821904 ) ) ( not ( = ?auto_821892 ?auto_821905 ) ) ( not ( = ?auto_821893 ?auto_821894 ) ) ( not ( = ?auto_821893 ?auto_821895 ) ) ( not ( = ?auto_821893 ?auto_821896 ) ) ( not ( = ?auto_821893 ?auto_821897 ) ) ( not ( = ?auto_821893 ?auto_821898 ) ) ( not ( = ?auto_821893 ?auto_821899 ) ) ( not ( = ?auto_821893 ?auto_821900 ) ) ( not ( = ?auto_821893 ?auto_821901 ) ) ( not ( = ?auto_821893 ?auto_821902 ) ) ( not ( = ?auto_821893 ?auto_821903 ) ) ( not ( = ?auto_821893 ?auto_821904 ) ) ( not ( = ?auto_821893 ?auto_821905 ) ) ( not ( = ?auto_821894 ?auto_821895 ) ) ( not ( = ?auto_821894 ?auto_821896 ) ) ( not ( = ?auto_821894 ?auto_821897 ) ) ( not ( = ?auto_821894 ?auto_821898 ) ) ( not ( = ?auto_821894 ?auto_821899 ) ) ( not ( = ?auto_821894 ?auto_821900 ) ) ( not ( = ?auto_821894 ?auto_821901 ) ) ( not ( = ?auto_821894 ?auto_821902 ) ) ( not ( = ?auto_821894 ?auto_821903 ) ) ( not ( = ?auto_821894 ?auto_821904 ) ) ( not ( = ?auto_821894 ?auto_821905 ) ) ( not ( = ?auto_821895 ?auto_821896 ) ) ( not ( = ?auto_821895 ?auto_821897 ) ) ( not ( = ?auto_821895 ?auto_821898 ) ) ( not ( = ?auto_821895 ?auto_821899 ) ) ( not ( = ?auto_821895 ?auto_821900 ) ) ( not ( = ?auto_821895 ?auto_821901 ) ) ( not ( = ?auto_821895 ?auto_821902 ) ) ( not ( = ?auto_821895 ?auto_821903 ) ) ( not ( = ?auto_821895 ?auto_821904 ) ) ( not ( = ?auto_821895 ?auto_821905 ) ) ( not ( = ?auto_821896 ?auto_821897 ) ) ( not ( = ?auto_821896 ?auto_821898 ) ) ( not ( = ?auto_821896 ?auto_821899 ) ) ( not ( = ?auto_821896 ?auto_821900 ) ) ( not ( = ?auto_821896 ?auto_821901 ) ) ( not ( = ?auto_821896 ?auto_821902 ) ) ( not ( = ?auto_821896 ?auto_821903 ) ) ( not ( = ?auto_821896 ?auto_821904 ) ) ( not ( = ?auto_821896 ?auto_821905 ) ) ( not ( = ?auto_821897 ?auto_821898 ) ) ( not ( = ?auto_821897 ?auto_821899 ) ) ( not ( = ?auto_821897 ?auto_821900 ) ) ( not ( = ?auto_821897 ?auto_821901 ) ) ( not ( = ?auto_821897 ?auto_821902 ) ) ( not ( = ?auto_821897 ?auto_821903 ) ) ( not ( = ?auto_821897 ?auto_821904 ) ) ( not ( = ?auto_821897 ?auto_821905 ) ) ( not ( = ?auto_821898 ?auto_821899 ) ) ( not ( = ?auto_821898 ?auto_821900 ) ) ( not ( = ?auto_821898 ?auto_821901 ) ) ( not ( = ?auto_821898 ?auto_821902 ) ) ( not ( = ?auto_821898 ?auto_821903 ) ) ( not ( = ?auto_821898 ?auto_821904 ) ) ( not ( = ?auto_821898 ?auto_821905 ) ) ( not ( = ?auto_821899 ?auto_821900 ) ) ( not ( = ?auto_821899 ?auto_821901 ) ) ( not ( = ?auto_821899 ?auto_821902 ) ) ( not ( = ?auto_821899 ?auto_821903 ) ) ( not ( = ?auto_821899 ?auto_821904 ) ) ( not ( = ?auto_821899 ?auto_821905 ) ) ( not ( = ?auto_821900 ?auto_821901 ) ) ( not ( = ?auto_821900 ?auto_821902 ) ) ( not ( = ?auto_821900 ?auto_821903 ) ) ( not ( = ?auto_821900 ?auto_821904 ) ) ( not ( = ?auto_821900 ?auto_821905 ) ) ( not ( = ?auto_821901 ?auto_821902 ) ) ( not ( = ?auto_821901 ?auto_821903 ) ) ( not ( = ?auto_821901 ?auto_821904 ) ) ( not ( = ?auto_821901 ?auto_821905 ) ) ( not ( = ?auto_821902 ?auto_821903 ) ) ( not ( = ?auto_821902 ?auto_821904 ) ) ( not ( = ?auto_821902 ?auto_821905 ) ) ( not ( = ?auto_821903 ?auto_821904 ) ) ( not ( = ?auto_821903 ?auto_821905 ) ) ( not ( = ?auto_821904 ?auto_821905 ) ) ( ON ?auto_821903 ?auto_821904 ) ( ON ?auto_821902 ?auto_821903 ) ( ON ?auto_821901 ?auto_821902 ) ( ON ?auto_821900 ?auto_821901 ) ( CLEAR ?auto_821898 ) ( ON ?auto_821899 ?auto_821900 ) ( CLEAR ?auto_821899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_821892 ?auto_821893 ?auto_821894 ?auto_821895 ?auto_821896 ?auto_821897 ?auto_821898 ?auto_821899 )
      ( MAKE-13PILE ?auto_821892 ?auto_821893 ?auto_821894 ?auto_821895 ?auto_821896 ?auto_821897 ?auto_821898 ?auto_821899 ?auto_821900 ?auto_821901 ?auto_821902 ?auto_821903 ?auto_821904 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_821946 - BLOCK
      ?auto_821947 - BLOCK
      ?auto_821948 - BLOCK
      ?auto_821949 - BLOCK
      ?auto_821950 - BLOCK
      ?auto_821951 - BLOCK
      ?auto_821952 - BLOCK
      ?auto_821953 - BLOCK
      ?auto_821954 - BLOCK
      ?auto_821955 - BLOCK
      ?auto_821956 - BLOCK
      ?auto_821957 - BLOCK
      ?auto_821958 - BLOCK
    )
    :vars
    (
      ?auto_821959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_821958 ?auto_821959 ) ( ON-TABLE ?auto_821946 ) ( ON ?auto_821947 ?auto_821946 ) ( ON ?auto_821948 ?auto_821947 ) ( ON ?auto_821949 ?auto_821948 ) ( ON ?auto_821950 ?auto_821949 ) ( ON ?auto_821951 ?auto_821950 ) ( not ( = ?auto_821946 ?auto_821947 ) ) ( not ( = ?auto_821946 ?auto_821948 ) ) ( not ( = ?auto_821946 ?auto_821949 ) ) ( not ( = ?auto_821946 ?auto_821950 ) ) ( not ( = ?auto_821946 ?auto_821951 ) ) ( not ( = ?auto_821946 ?auto_821952 ) ) ( not ( = ?auto_821946 ?auto_821953 ) ) ( not ( = ?auto_821946 ?auto_821954 ) ) ( not ( = ?auto_821946 ?auto_821955 ) ) ( not ( = ?auto_821946 ?auto_821956 ) ) ( not ( = ?auto_821946 ?auto_821957 ) ) ( not ( = ?auto_821946 ?auto_821958 ) ) ( not ( = ?auto_821946 ?auto_821959 ) ) ( not ( = ?auto_821947 ?auto_821948 ) ) ( not ( = ?auto_821947 ?auto_821949 ) ) ( not ( = ?auto_821947 ?auto_821950 ) ) ( not ( = ?auto_821947 ?auto_821951 ) ) ( not ( = ?auto_821947 ?auto_821952 ) ) ( not ( = ?auto_821947 ?auto_821953 ) ) ( not ( = ?auto_821947 ?auto_821954 ) ) ( not ( = ?auto_821947 ?auto_821955 ) ) ( not ( = ?auto_821947 ?auto_821956 ) ) ( not ( = ?auto_821947 ?auto_821957 ) ) ( not ( = ?auto_821947 ?auto_821958 ) ) ( not ( = ?auto_821947 ?auto_821959 ) ) ( not ( = ?auto_821948 ?auto_821949 ) ) ( not ( = ?auto_821948 ?auto_821950 ) ) ( not ( = ?auto_821948 ?auto_821951 ) ) ( not ( = ?auto_821948 ?auto_821952 ) ) ( not ( = ?auto_821948 ?auto_821953 ) ) ( not ( = ?auto_821948 ?auto_821954 ) ) ( not ( = ?auto_821948 ?auto_821955 ) ) ( not ( = ?auto_821948 ?auto_821956 ) ) ( not ( = ?auto_821948 ?auto_821957 ) ) ( not ( = ?auto_821948 ?auto_821958 ) ) ( not ( = ?auto_821948 ?auto_821959 ) ) ( not ( = ?auto_821949 ?auto_821950 ) ) ( not ( = ?auto_821949 ?auto_821951 ) ) ( not ( = ?auto_821949 ?auto_821952 ) ) ( not ( = ?auto_821949 ?auto_821953 ) ) ( not ( = ?auto_821949 ?auto_821954 ) ) ( not ( = ?auto_821949 ?auto_821955 ) ) ( not ( = ?auto_821949 ?auto_821956 ) ) ( not ( = ?auto_821949 ?auto_821957 ) ) ( not ( = ?auto_821949 ?auto_821958 ) ) ( not ( = ?auto_821949 ?auto_821959 ) ) ( not ( = ?auto_821950 ?auto_821951 ) ) ( not ( = ?auto_821950 ?auto_821952 ) ) ( not ( = ?auto_821950 ?auto_821953 ) ) ( not ( = ?auto_821950 ?auto_821954 ) ) ( not ( = ?auto_821950 ?auto_821955 ) ) ( not ( = ?auto_821950 ?auto_821956 ) ) ( not ( = ?auto_821950 ?auto_821957 ) ) ( not ( = ?auto_821950 ?auto_821958 ) ) ( not ( = ?auto_821950 ?auto_821959 ) ) ( not ( = ?auto_821951 ?auto_821952 ) ) ( not ( = ?auto_821951 ?auto_821953 ) ) ( not ( = ?auto_821951 ?auto_821954 ) ) ( not ( = ?auto_821951 ?auto_821955 ) ) ( not ( = ?auto_821951 ?auto_821956 ) ) ( not ( = ?auto_821951 ?auto_821957 ) ) ( not ( = ?auto_821951 ?auto_821958 ) ) ( not ( = ?auto_821951 ?auto_821959 ) ) ( not ( = ?auto_821952 ?auto_821953 ) ) ( not ( = ?auto_821952 ?auto_821954 ) ) ( not ( = ?auto_821952 ?auto_821955 ) ) ( not ( = ?auto_821952 ?auto_821956 ) ) ( not ( = ?auto_821952 ?auto_821957 ) ) ( not ( = ?auto_821952 ?auto_821958 ) ) ( not ( = ?auto_821952 ?auto_821959 ) ) ( not ( = ?auto_821953 ?auto_821954 ) ) ( not ( = ?auto_821953 ?auto_821955 ) ) ( not ( = ?auto_821953 ?auto_821956 ) ) ( not ( = ?auto_821953 ?auto_821957 ) ) ( not ( = ?auto_821953 ?auto_821958 ) ) ( not ( = ?auto_821953 ?auto_821959 ) ) ( not ( = ?auto_821954 ?auto_821955 ) ) ( not ( = ?auto_821954 ?auto_821956 ) ) ( not ( = ?auto_821954 ?auto_821957 ) ) ( not ( = ?auto_821954 ?auto_821958 ) ) ( not ( = ?auto_821954 ?auto_821959 ) ) ( not ( = ?auto_821955 ?auto_821956 ) ) ( not ( = ?auto_821955 ?auto_821957 ) ) ( not ( = ?auto_821955 ?auto_821958 ) ) ( not ( = ?auto_821955 ?auto_821959 ) ) ( not ( = ?auto_821956 ?auto_821957 ) ) ( not ( = ?auto_821956 ?auto_821958 ) ) ( not ( = ?auto_821956 ?auto_821959 ) ) ( not ( = ?auto_821957 ?auto_821958 ) ) ( not ( = ?auto_821957 ?auto_821959 ) ) ( not ( = ?auto_821958 ?auto_821959 ) ) ( ON ?auto_821957 ?auto_821958 ) ( ON ?auto_821956 ?auto_821957 ) ( ON ?auto_821955 ?auto_821956 ) ( ON ?auto_821954 ?auto_821955 ) ( ON ?auto_821953 ?auto_821954 ) ( CLEAR ?auto_821951 ) ( ON ?auto_821952 ?auto_821953 ) ( CLEAR ?auto_821952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_821946 ?auto_821947 ?auto_821948 ?auto_821949 ?auto_821950 ?auto_821951 ?auto_821952 )
      ( MAKE-13PILE ?auto_821946 ?auto_821947 ?auto_821948 ?auto_821949 ?auto_821950 ?auto_821951 ?auto_821952 ?auto_821953 ?auto_821954 ?auto_821955 ?auto_821956 ?auto_821957 ?auto_821958 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_822000 - BLOCK
      ?auto_822001 - BLOCK
      ?auto_822002 - BLOCK
      ?auto_822003 - BLOCK
      ?auto_822004 - BLOCK
      ?auto_822005 - BLOCK
      ?auto_822006 - BLOCK
      ?auto_822007 - BLOCK
      ?auto_822008 - BLOCK
      ?auto_822009 - BLOCK
      ?auto_822010 - BLOCK
      ?auto_822011 - BLOCK
      ?auto_822012 - BLOCK
    )
    :vars
    (
      ?auto_822013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822012 ?auto_822013 ) ( ON-TABLE ?auto_822000 ) ( ON ?auto_822001 ?auto_822000 ) ( ON ?auto_822002 ?auto_822001 ) ( ON ?auto_822003 ?auto_822002 ) ( ON ?auto_822004 ?auto_822003 ) ( not ( = ?auto_822000 ?auto_822001 ) ) ( not ( = ?auto_822000 ?auto_822002 ) ) ( not ( = ?auto_822000 ?auto_822003 ) ) ( not ( = ?auto_822000 ?auto_822004 ) ) ( not ( = ?auto_822000 ?auto_822005 ) ) ( not ( = ?auto_822000 ?auto_822006 ) ) ( not ( = ?auto_822000 ?auto_822007 ) ) ( not ( = ?auto_822000 ?auto_822008 ) ) ( not ( = ?auto_822000 ?auto_822009 ) ) ( not ( = ?auto_822000 ?auto_822010 ) ) ( not ( = ?auto_822000 ?auto_822011 ) ) ( not ( = ?auto_822000 ?auto_822012 ) ) ( not ( = ?auto_822000 ?auto_822013 ) ) ( not ( = ?auto_822001 ?auto_822002 ) ) ( not ( = ?auto_822001 ?auto_822003 ) ) ( not ( = ?auto_822001 ?auto_822004 ) ) ( not ( = ?auto_822001 ?auto_822005 ) ) ( not ( = ?auto_822001 ?auto_822006 ) ) ( not ( = ?auto_822001 ?auto_822007 ) ) ( not ( = ?auto_822001 ?auto_822008 ) ) ( not ( = ?auto_822001 ?auto_822009 ) ) ( not ( = ?auto_822001 ?auto_822010 ) ) ( not ( = ?auto_822001 ?auto_822011 ) ) ( not ( = ?auto_822001 ?auto_822012 ) ) ( not ( = ?auto_822001 ?auto_822013 ) ) ( not ( = ?auto_822002 ?auto_822003 ) ) ( not ( = ?auto_822002 ?auto_822004 ) ) ( not ( = ?auto_822002 ?auto_822005 ) ) ( not ( = ?auto_822002 ?auto_822006 ) ) ( not ( = ?auto_822002 ?auto_822007 ) ) ( not ( = ?auto_822002 ?auto_822008 ) ) ( not ( = ?auto_822002 ?auto_822009 ) ) ( not ( = ?auto_822002 ?auto_822010 ) ) ( not ( = ?auto_822002 ?auto_822011 ) ) ( not ( = ?auto_822002 ?auto_822012 ) ) ( not ( = ?auto_822002 ?auto_822013 ) ) ( not ( = ?auto_822003 ?auto_822004 ) ) ( not ( = ?auto_822003 ?auto_822005 ) ) ( not ( = ?auto_822003 ?auto_822006 ) ) ( not ( = ?auto_822003 ?auto_822007 ) ) ( not ( = ?auto_822003 ?auto_822008 ) ) ( not ( = ?auto_822003 ?auto_822009 ) ) ( not ( = ?auto_822003 ?auto_822010 ) ) ( not ( = ?auto_822003 ?auto_822011 ) ) ( not ( = ?auto_822003 ?auto_822012 ) ) ( not ( = ?auto_822003 ?auto_822013 ) ) ( not ( = ?auto_822004 ?auto_822005 ) ) ( not ( = ?auto_822004 ?auto_822006 ) ) ( not ( = ?auto_822004 ?auto_822007 ) ) ( not ( = ?auto_822004 ?auto_822008 ) ) ( not ( = ?auto_822004 ?auto_822009 ) ) ( not ( = ?auto_822004 ?auto_822010 ) ) ( not ( = ?auto_822004 ?auto_822011 ) ) ( not ( = ?auto_822004 ?auto_822012 ) ) ( not ( = ?auto_822004 ?auto_822013 ) ) ( not ( = ?auto_822005 ?auto_822006 ) ) ( not ( = ?auto_822005 ?auto_822007 ) ) ( not ( = ?auto_822005 ?auto_822008 ) ) ( not ( = ?auto_822005 ?auto_822009 ) ) ( not ( = ?auto_822005 ?auto_822010 ) ) ( not ( = ?auto_822005 ?auto_822011 ) ) ( not ( = ?auto_822005 ?auto_822012 ) ) ( not ( = ?auto_822005 ?auto_822013 ) ) ( not ( = ?auto_822006 ?auto_822007 ) ) ( not ( = ?auto_822006 ?auto_822008 ) ) ( not ( = ?auto_822006 ?auto_822009 ) ) ( not ( = ?auto_822006 ?auto_822010 ) ) ( not ( = ?auto_822006 ?auto_822011 ) ) ( not ( = ?auto_822006 ?auto_822012 ) ) ( not ( = ?auto_822006 ?auto_822013 ) ) ( not ( = ?auto_822007 ?auto_822008 ) ) ( not ( = ?auto_822007 ?auto_822009 ) ) ( not ( = ?auto_822007 ?auto_822010 ) ) ( not ( = ?auto_822007 ?auto_822011 ) ) ( not ( = ?auto_822007 ?auto_822012 ) ) ( not ( = ?auto_822007 ?auto_822013 ) ) ( not ( = ?auto_822008 ?auto_822009 ) ) ( not ( = ?auto_822008 ?auto_822010 ) ) ( not ( = ?auto_822008 ?auto_822011 ) ) ( not ( = ?auto_822008 ?auto_822012 ) ) ( not ( = ?auto_822008 ?auto_822013 ) ) ( not ( = ?auto_822009 ?auto_822010 ) ) ( not ( = ?auto_822009 ?auto_822011 ) ) ( not ( = ?auto_822009 ?auto_822012 ) ) ( not ( = ?auto_822009 ?auto_822013 ) ) ( not ( = ?auto_822010 ?auto_822011 ) ) ( not ( = ?auto_822010 ?auto_822012 ) ) ( not ( = ?auto_822010 ?auto_822013 ) ) ( not ( = ?auto_822011 ?auto_822012 ) ) ( not ( = ?auto_822011 ?auto_822013 ) ) ( not ( = ?auto_822012 ?auto_822013 ) ) ( ON ?auto_822011 ?auto_822012 ) ( ON ?auto_822010 ?auto_822011 ) ( ON ?auto_822009 ?auto_822010 ) ( ON ?auto_822008 ?auto_822009 ) ( ON ?auto_822007 ?auto_822008 ) ( ON ?auto_822006 ?auto_822007 ) ( CLEAR ?auto_822004 ) ( ON ?auto_822005 ?auto_822006 ) ( CLEAR ?auto_822005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_822000 ?auto_822001 ?auto_822002 ?auto_822003 ?auto_822004 ?auto_822005 )
      ( MAKE-13PILE ?auto_822000 ?auto_822001 ?auto_822002 ?auto_822003 ?auto_822004 ?auto_822005 ?auto_822006 ?auto_822007 ?auto_822008 ?auto_822009 ?auto_822010 ?auto_822011 ?auto_822012 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_822054 - BLOCK
      ?auto_822055 - BLOCK
      ?auto_822056 - BLOCK
      ?auto_822057 - BLOCK
      ?auto_822058 - BLOCK
      ?auto_822059 - BLOCK
      ?auto_822060 - BLOCK
      ?auto_822061 - BLOCK
      ?auto_822062 - BLOCK
      ?auto_822063 - BLOCK
      ?auto_822064 - BLOCK
      ?auto_822065 - BLOCK
      ?auto_822066 - BLOCK
    )
    :vars
    (
      ?auto_822067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822066 ?auto_822067 ) ( ON-TABLE ?auto_822054 ) ( ON ?auto_822055 ?auto_822054 ) ( ON ?auto_822056 ?auto_822055 ) ( ON ?auto_822057 ?auto_822056 ) ( not ( = ?auto_822054 ?auto_822055 ) ) ( not ( = ?auto_822054 ?auto_822056 ) ) ( not ( = ?auto_822054 ?auto_822057 ) ) ( not ( = ?auto_822054 ?auto_822058 ) ) ( not ( = ?auto_822054 ?auto_822059 ) ) ( not ( = ?auto_822054 ?auto_822060 ) ) ( not ( = ?auto_822054 ?auto_822061 ) ) ( not ( = ?auto_822054 ?auto_822062 ) ) ( not ( = ?auto_822054 ?auto_822063 ) ) ( not ( = ?auto_822054 ?auto_822064 ) ) ( not ( = ?auto_822054 ?auto_822065 ) ) ( not ( = ?auto_822054 ?auto_822066 ) ) ( not ( = ?auto_822054 ?auto_822067 ) ) ( not ( = ?auto_822055 ?auto_822056 ) ) ( not ( = ?auto_822055 ?auto_822057 ) ) ( not ( = ?auto_822055 ?auto_822058 ) ) ( not ( = ?auto_822055 ?auto_822059 ) ) ( not ( = ?auto_822055 ?auto_822060 ) ) ( not ( = ?auto_822055 ?auto_822061 ) ) ( not ( = ?auto_822055 ?auto_822062 ) ) ( not ( = ?auto_822055 ?auto_822063 ) ) ( not ( = ?auto_822055 ?auto_822064 ) ) ( not ( = ?auto_822055 ?auto_822065 ) ) ( not ( = ?auto_822055 ?auto_822066 ) ) ( not ( = ?auto_822055 ?auto_822067 ) ) ( not ( = ?auto_822056 ?auto_822057 ) ) ( not ( = ?auto_822056 ?auto_822058 ) ) ( not ( = ?auto_822056 ?auto_822059 ) ) ( not ( = ?auto_822056 ?auto_822060 ) ) ( not ( = ?auto_822056 ?auto_822061 ) ) ( not ( = ?auto_822056 ?auto_822062 ) ) ( not ( = ?auto_822056 ?auto_822063 ) ) ( not ( = ?auto_822056 ?auto_822064 ) ) ( not ( = ?auto_822056 ?auto_822065 ) ) ( not ( = ?auto_822056 ?auto_822066 ) ) ( not ( = ?auto_822056 ?auto_822067 ) ) ( not ( = ?auto_822057 ?auto_822058 ) ) ( not ( = ?auto_822057 ?auto_822059 ) ) ( not ( = ?auto_822057 ?auto_822060 ) ) ( not ( = ?auto_822057 ?auto_822061 ) ) ( not ( = ?auto_822057 ?auto_822062 ) ) ( not ( = ?auto_822057 ?auto_822063 ) ) ( not ( = ?auto_822057 ?auto_822064 ) ) ( not ( = ?auto_822057 ?auto_822065 ) ) ( not ( = ?auto_822057 ?auto_822066 ) ) ( not ( = ?auto_822057 ?auto_822067 ) ) ( not ( = ?auto_822058 ?auto_822059 ) ) ( not ( = ?auto_822058 ?auto_822060 ) ) ( not ( = ?auto_822058 ?auto_822061 ) ) ( not ( = ?auto_822058 ?auto_822062 ) ) ( not ( = ?auto_822058 ?auto_822063 ) ) ( not ( = ?auto_822058 ?auto_822064 ) ) ( not ( = ?auto_822058 ?auto_822065 ) ) ( not ( = ?auto_822058 ?auto_822066 ) ) ( not ( = ?auto_822058 ?auto_822067 ) ) ( not ( = ?auto_822059 ?auto_822060 ) ) ( not ( = ?auto_822059 ?auto_822061 ) ) ( not ( = ?auto_822059 ?auto_822062 ) ) ( not ( = ?auto_822059 ?auto_822063 ) ) ( not ( = ?auto_822059 ?auto_822064 ) ) ( not ( = ?auto_822059 ?auto_822065 ) ) ( not ( = ?auto_822059 ?auto_822066 ) ) ( not ( = ?auto_822059 ?auto_822067 ) ) ( not ( = ?auto_822060 ?auto_822061 ) ) ( not ( = ?auto_822060 ?auto_822062 ) ) ( not ( = ?auto_822060 ?auto_822063 ) ) ( not ( = ?auto_822060 ?auto_822064 ) ) ( not ( = ?auto_822060 ?auto_822065 ) ) ( not ( = ?auto_822060 ?auto_822066 ) ) ( not ( = ?auto_822060 ?auto_822067 ) ) ( not ( = ?auto_822061 ?auto_822062 ) ) ( not ( = ?auto_822061 ?auto_822063 ) ) ( not ( = ?auto_822061 ?auto_822064 ) ) ( not ( = ?auto_822061 ?auto_822065 ) ) ( not ( = ?auto_822061 ?auto_822066 ) ) ( not ( = ?auto_822061 ?auto_822067 ) ) ( not ( = ?auto_822062 ?auto_822063 ) ) ( not ( = ?auto_822062 ?auto_822064 ) ) ( not ( = ?auto_822062 ?auto_822065 ) ) ( not ( = ?auto_822062 ?auto_822066 ) ) ( not ( = ?auto_822062 ?auto_822067 ) ) ( not ( = ?auto_822063 ?auto_822064 ) ) ( not ( = ?auto_822063 ?auto_822065 ) ) ( not ( = ?auto_822063 ?auto_822066 ) ) ( not ( = ?auto_822063 ?auto_822067 ) ) ( not ( = ?auto_822064 ?auto_822065 ) ) ( not ( = ?auto_822064 ?auto_822066 ) ) ( not ( = ?auto_822064 ?auto_822067 ) ) ( not ( = ?auto_822065 ?auto_822066 ) ) ( not ( = ?auto_822065 ?auto_822067 ) ) ( not ( = ?auto_822066 ?auto_822067 ) ) ( ON ?auto_822065 ?auto_822066 ) ( ON ?auto_822064 ?auto_822065 ) ( ON ?auto_822063 ?auto_822064 ) ( ON ?auto_822062 ?auto_822063 ) ( ON ?auto_822061 ?auto_822062 ) ( ON ?auto_822060 ?auto_822061 ) ( ON ?auto_822059 ?auto_822060 ) ( CLEAR ?auto_822057 ) ( ON ?auto_822058 ?auto_822059 ) ( CLEAR ?auto_822058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_822054 ?auto_822055 ?auto_822056 ?auto_822057 ?auto_822058 )
      ( MAKE-13PILE ?auto_822054 ?auto_822055 ?auto_822056 ?auto_822057 ?auto_822058 ?auto_822059 ?auto_822060 ?auto_822061 ?auto_822062 ?auto_822063 ?auto_822064 ?auto_822065 ?auto_822066 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_822108 - BLOCK
      ?auto_822109 - BLOCK
      ?auto_822110 - BLOCK
      ?auto_822111 - BLOCK
      ?auto_822112 - BLOCK
      ?auto_822113 - BLOCK
      ?auto_822114 - BLOCK
      ?auto_822115 - BLOCK
      ?auto_822116 - BLOCK
      ?auto_822117 - BLOCK
      ?auto_822118 - BLOCK
      ?auto_822119 - BLOCK
      ?auto_822120 - BLOCK
    )
    :vars
    (
      ?auto_822121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822120 ?auto_822121 ) ( ON-TABLE ?auto_822108 ) ( ON ?auto_822109 ?auto_822108 ) ( ON ?auto_822110 ?auto_822109 ) ( not ( = ?auto_822108 ?auto_822109 ) ) ( not ( = ?auto_822108 ?auto_822110 ) ) ( not ( = ?auto_822108 ?auto_822111 ) ) ( not ( = ?auto_822108 ?auto_822112 ) ) ( not ( = ?auto_822108 ?auto_822113 ) ) ( not ( = ?auto_822108 ?auto_822114 ) ) ( not ( = ?auto_822108 ?auto_822115 ) ) ( not ( = ?auto_822108 ?auto_822116 ) ) ( not ( = ?auto_822108 ?auto_822117 ) ) ( not ( = ?auto_822108 ?auto_822118 ) ) ( not ( = ?auto_822108 ?auto_822119 ) ) ( not ( = ?auto_822108 ?auto_822120 ) ) ( not ( = ?auto_822108 ?auto_822121 ) ) ( not ( = ?auto_822109 ?auto_822110 ) ) ( not ( = ?auto_822109 ?auto_822111 ) ) ( not ( = ?auto_822109 ?auto_822112 ) ) ( not ( = ?auto_822109 ?auto_822113 ) ) ( not ( = ?auto_822109 ?auto_822114 ) ) ( not ( = ?auto_822109 ?auto_822115 ) ) ( not ( = ?auto_822109 ?auto_822116 ) ) ( not ( = ?auto_822109 ?auto_822117 ) ) ( not ( = ?auto_822109 ?auto_822118 ) ) ( not ( = ?auto_822109 ?auto_822119 ) ) ( not ( = ?auto_822109 ?auto_822120 ) ) ( not ( = ?auto_822109 ?auto_822121 ) ) ( not ( = ?auto_822110 ?auto_822111 ) ) ( not ( = ?auto_822110 ?auto_822112 ) ) ( not ( = ?auto_822110 ?auto_822113 ) ) ( not ( = ?auto_822110 ?auto_822114 ) ) ( not ( = ?auto_822110 ?auto_822115 ) ) ( not ( = ?auto_822110 ?auto_822116 ) ) ( not ( = ?auto_822110 ?auto_822117 ) ) ( not ( = ?auto_822110 ?auto_822118 ) ) ( not ( = ?auto_822110 ?auto_822119 ) ) ( not ( = ?auto_822110 ?auto_822120 ) ) ( not ( = ?auto_822110 ?auto_822121 ) ) ( not ( = ?auto_822111 ?auto_822112 ) ) ( not ( = ?auto_822111 ?auto_822113 ) ) ( not ( = ?auto_822111 ?auto_822114 ) ) ( not ( = ?auto_822111 ?auto_822115 ) ) ( not ( = ?auto_822111 ?auto_822116 ) ) ( not ( = ?auto_822111 ?auto_822117 ) ) ( not ( = ?auto_822111 ?auto_822118 ) ) ( not ( = ?auto_822111 ?auto_822119 ) ) ( not ( = ?auto_822111 ?auto_822120 ) ) ( not ( = ?auto_822111 ?auto_822121 ) ) ( not ( = ?auto_822112 ?auto_822113 ) ) ( not ( = ?auto_822112 ?auto_822114 ) ) ( not ( = ?auto_822112 ?auto_822115 ) ) ( not ( = ?auto_822112 ?auto_822116 ) ) ( not ( = ?auto_822112 ?auto_822117 ) ) ( not ( = ?auto_822112 ?auto_822118 ) ) ( not ( = ?auto_822112 ?auto_822119 ) ) ( not ( = ?auto_822112 ?auto_822120 ) ) ( not ( = ?auto_822112 ?auto_822121 ) ) ( not ( = ?auto_822113 ?auto_822114 ) ) ( not ( = ?auto_822113 ?auto_822115 ) ) ( not ( = ?auto_822113 ?auto_822116 ) ) ( not ( = ?auto_822113 ?auto_822117 ) ) ( not ( = ?auto_822113 ?auto_822118 ) ) ( not ( = ?auto_822113 ?auto_822119 ) ) ( not ( = ?auto_822113 ?auto_822120 ) ) ( not ( = ?auto_822113 ?auto_822121 ) ) ( not ( = ?auto_822114 ?auto_822115 ) ) ( not ( = ?auto_822114 ?auto_822116 ) ) ( not ( = ?auto_822114 ?auto_822117 ) ) ( not ( = ?auto_822114 ?auto_822118 ) ) ( not ( = ?auto_822114 ?auto_822119 ) ) ( not ( = ?auto_822114 ?auto_822120 ) ) ( not ( = ?auto_822114 ?auto_822121 ) ) ( not ( = ?auto_822115 ?auto_822116 ) ) ( not ( = ?auto_822115 ?auto_822117 ) ) ( not ( = ?auto_822115 ?auto_822118 ) ) ( not ( = ?auto_822115 ?auto_822119 ) ) ( not ( = ?auto_822115 ?auto_822120 ) ) ( not ( = ?auto_822115 ?auto_822121 ) ) ( not ( = ?auto_822116 ?auto_822117 ) ) ( not ( = ?auto_822116 ?auto_822118 ) ) ( not ( = ?auto_822116 ?auto_822119 ) ) ( not ( = ?auto_822116 ?auto_822120 ) ) ( not ( = ?auto_822116 ?auto_822121 ) ) ( not ( = ?auto_822117 ?auto_822118 ) ) ( not ( = ?auto_822117 ?auto_822119 ) ) ( not ( = ?auto_822117 ?auto_822120 ) ) ( not ( = ?auto_822117 ?auto_822121 ) ) ( not ( = ?auto_822118 ?auto_822119 ) ) ( not ( = ?auto_822118 ?auto_822120 ) ) ( not ( = ?auto_822118 ?auto_822121 ) ) ( not ( = ?auto_822119 ?auto_822120 ) ) ( not ( = ?auto_822119 ?auto_822121 ) ) ( not ( = ?auto_822120 ?auto_822121 ) ) ( ON ?auto_822119 ?auto_822120 ) ( ON ?auto_822118 ?auto_822119 ) ( ON ?auto_822117 ?auto_822118 ) ( ON ?auto_822116 ?auto_822117 ) ( ON ?auto_822115 ?auto_822116 ) ( ON ?auto_822114 ?auto_822115 ) ( ON ?auto_822113 ?auto_822114 ) ( ON ?auto_822112 ?auto_822113 ) ( CLEAR ?auto_822110 ) ( ON ?auto_822111 ?auto_822112 ) ( CLEAR ?auto_822111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_822108 ?auto_822109 ?auto_822110 ?auto_822111 )
      ( MAKE-13PILE ?auto_822108 ?auto_822109 ?auto_822110 ?auto_822111 ?auto_822112 ?auto_822113 ?auto_822114 ?auto_822115 ?auto_822116 ?auto_822117 ?auto_822118 ?auto_822119 ?auto_822120 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_822162 - BLOCK
      ?auto_822163 - BLOCK
      ?auto_822164 - BLOCK
      ?auto_822165 - BLOCK
      ?auto_822166 - BLOCK
      ?auto_822167 - BLOCK
      ?auto_822168 - BLOCK
      ?auto_822169 - BLOCK
      ?auto_822170 - BLOCK
      ?auto_822171 - BLOCK
      ?auto_822172 - BLOCK
      ?auto_822173 - BLOCK
      ?auto_822174 - BLOCK
    )
    :vars
    (
      ?auto_822175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822174 ?auto_822175 ) ( ON-TABLE ?auto_822162 ) ( ON ?auto_822163 ?auto_822162 ) ( not ( = ?auto_822162 ?auto_822163 ) ) ( not ( = ?auto_822162 ?auto_822164 ) ) ( not ( = ?auto_822162 ?auto_822165 ) ) ( not ( = ?auto_822162 ?auto_822166 ) ) ( not ( = ?auto_822162 ?auto_822167 ) ) ( not ( = ?auto_822162 ?auto_822168 ) ) ( not ( = ?auto_822162 ?auto_822169 ) ) ( not ( = ?auto_822162 ?auto_822170 ) ) ( not ( = ?auto_822162 ?auto_822171 ) ) ( not ( = ?auto_822162 ?auto_822172 ) ) ( not ( = ?auto_822162 ?auto_822173 ) ) ( not ( = ?auto_822162 ?auto_822174 ) ) ( not ( = ?auto_822162 ?auto_822175 ) ) ( not ( = ?auto_822163 ?auto_822164 ) ) ( not ( = ?auto_822163 ?auto_822165 ) ) ( not ( = ?auto_822163 ?auto_822166 ) ) ( not ( = ?auto_822163 ?auto_822167 ) ) ( not ( = ?auto_822163 ?auto_822168 ) ) ( not ( = ?auto_822163 ?auto_822169 ) ) ( not ( = ?auto_822163 ?auto_822170 ) ) ( not ( = ?auto_822163 ?auto_822171 ) ) ( not ( = ?auto_822163 ?auto_822172 ) ) ( not ( = ?auto_822163 ?auto_822173 ) ) ( not ( = ?auto_822163 ?auto_822174 ) ) ( not ( = ?auto_822163 ?auto_822175 ) ) ( not ( = ?auto_822164 ?auto_822165 ) ) ( not ( = ?auto_822164 ?auto_822166 ) ) ( not ( = ?auto_822164 ?auto_822167 ) ) ( not ( = ?auto_822164 ?auto_822168 ) ) ( not ( = ?auto_822164 ?auto_822169 ) ) ( not ( = ?auto_822164 ?auto_822170 ) ) ( not ( = ?auto_822164 ?auto_822171 ) ) ( not ( = ?auto_822164 ?auto_822172 ) ) ( not ( = ?auto_822164 ?auto_822173 ) ) ( not ( = ?auto_822164 ?auto_822174 ) ) ( not ( = ?auto_822164 ?auto_822175 ) ) ( not ( = ?auto_822165 ?auto_822166 ) ) ( not ( = ?auto_822165 ?auto_822167 ) ) ( not ( = ?auto_822165 ?auto_822168 ) ) ( not ( = ?auto_822165 ?auto_822169 ) ) ( not ( = ?auto_822165 ?auto_822170 ) ) ( not ( = ?auto_822165 ?auto_822171 ) ) ( not ( = ?auto_822165 ?auto_822172 ) ) ( not ( = ?auto_822165 ?auto_822173 ) ) ( not ( = ?auto_822165 ?auto_822174 ) ) ( not ( = ?auto_822165 ?auto_822175 ) ) ( not ( = ?auto_822166 ?auto_822167 ) ) ( not ( = ?auto_822166 ?auto_822168 ) ) ( not ( = ?auto_822166 ?auto_822169 ) ) ( not ( = ?auto_822166 ?auto_822170 ) ) ( not ( = ?auto_822166 ?auto_822171 ) ) ( not ( = ?auto_822166 ?auto_822172 ) ) ( not ( = ?auto_822166 ?auto_822173 ) ) ( not ( = ?auto_822166 ?auto_822174 ) ) ( not ( = ?auto_822166 ?auto_822175 ) ) ( not ( = ?auto_822167 ?auto_822168 ) ) ( not ( = ?auto_822167 ?auto_822169 ) ) ( not ( = ?auto_822167 ?auto_822170 ) ) ( not ( = ?auto_822167 ?auto_822171 ) ) ( not ( = ?auto_822167 ?auto_822172 ) ) ( not ( = ?auto_822167 ?auto_822173 ) ) ( not ( = ?auto_822167 ?auto_822174 ) ) ( not ( = ?auto_822167 ?auto_822175 ) ) ( not ( = ?auto_822168 ?auto_822169 ) ) ( not ( = ?auto_822168 ?auto_822170 ) ) ( not ( = ?auto_822168 ?auto_822171 ) ) ( not ( = ?auto_822168 ?auto_822172 ) ) ( not ( = ?auto_822168 ?auto_822173 ) ) ( not ( = ?auto_822168 ?auto_822174 ) ) ( not ( = ?auto_822168 ?auto_822175 ) ) ( not ( = ?auto_822169 ?auto_822170 ) ) ( not ( = ?auto_822169 ?auto_822171 ) ) ( not ( = ?auto_822169 ?auto_822172 ) ) ( not ( = ?auto_822169 ?auto_822173 ) ) ( not ( = ?auto_822169 ?auto_822174 ) ) ( not ( = ?auto_822169 ?auto_822175 ) ) ( not ( = ?auto_822170 ?auto_822171 ) ) ( not ( = ?auto_822170 ?auto_822172 ) ) ( not ( = ?auto_822170 ?auto_822173 ) ) ( not ( = ?auto_822170 ?auto_822174 ) ) ( not ( = ?auto_822170 ?auto_822175 ) ) ( not ( = ?auto_822171 ?auto_822172 ) ) ( not ( = ?auto_822171 ?auto_822173 ) ) ( not ( = ?auto_822171 ?auto_822174 ) ) ( not ( = ?auto_822171 ?auto_822175 ) ) ( not ( = ?auto_822172 ?auto_822173 ) ) ( not ( = ?auto_822172 ?auto_822174 ) ) ( not ( = ?auto_822172 ?auto_822175 ) ) ( not ( = ?auto_822173 ?auto_822174 ) ) ( not ( = ?auto_822173 ?auto_822175 ) ) ( not ( = ?auto_822174 ?auto_822175 ) ) ( ON ?auto_822173 ?auto_822174 ) ( ON ?auto_822172 ?auto_822173 ) ( ON ?auto_822171 ?auto_822172 ) ( ON ?auto_822170 ?auto_822171 ) ( ON ?auto_822169 ?auto_822170 ) ( ON ?auto_822168 ?auto_822169 ) ( ON ?auto_822167 ?auto_822168 ) ( ON ?auto_822166 ?auto_822167 ) ( ON ?auto_822165 ?auto_822166 ) ( CLEAR ?auto_822163 ) ( ON ?auto_822164 ?auto_822165 ) ( CLEAR ?auto_822164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_822162 ?auto_822163 ?auto_822164 )
      ( MAKE-13PILE ?auto_822162 ?auto_822163 ?auto_822164 ?auto_822165 ?auto_822166 ?auto_822167 ?auto_822168 ?auto_822169 ?auto_822170 ?auto_822171 ?auto_822172 ?auto_822173 ?auto_822174 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_822216 - BLOCK
      ?auto_822217 - BLOCK
      ?auto_822218 - BLOCK
      ?auto_822219 - BLOCK
      ?auto_822220 - BLOCK
      ?auto_822221 - BLOCK
      ?auto_822222 - BLOCK
      ?auto_822223 - BLOCK
      ?auto_822224 - BLOCK
      ?auto_822225 - BLOCK
      ?auto_822226 - BLOCK
      ?auto_822227 - BLOCK
      ?auto_822228 - BLOCK
    )
    :vars
    (
      ?auto_822229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822228 ?auto_822229 ) ( ON-TABLE ?auto_822216 ) ( not ( = ?auto_822216 ?auto_822217 ) ) ( not ( = ?auto_822216 ?auto_822218 ) ) ( not ( = ?auto_822216 ?auto_822219 ) ) ( not ( = ?auto_822216 ?auto_822220 ) ) ( not ( = ?auto_822216 ?auto_822221 ) ) ( not ( = ?auto_822216 ?auto_822222 ) ) ( not ( = ?auto_822216 ?auto_822223 ) ) ( not ( = ?auto_822216 ?auto_822224 ) ) ( not ( = ?auto_822216 ?auto_822225 ) ) ( not ( = ?auto_822216 ?auto_822226 ) ) ( not ( = ?auto_822216 ?auto_822227 ) ) ( not ( = ?auto_822216 ?auto_822228 ) ) ( not ( = ?auto_822216 ?auto_822229 ) ) ( not ( = ?auto_822217 ?auto_822218 ) ) ( not ( = ?auto_822217 ?auto_822219 ) ) ( not ( = ?auto_822217 ?auto_822220 ) ) ( not ( = ?auto_822217 ?auto_822221 ) ) ( not ( = ?auto_822217 ?auto_822222 ) ) ( not ( = ?auto_822217 ?auto_822223 ) ) ( not ( = ?auto_822217 ?auto_822224 ) ) ( not ( = ?auto_822217 ?auto_822225 ) ) ( not ( = ?auto_822217 ?auto_822226 ) ) ( not ( = ?auto_822217 ?auto_822227 ) ) ( not ( = ?auto_822217 ?auto_822228 ) ) ( not ( = ?auto_822217 ?auto_822229 ) ) ( not ( = ?auto_822218 ?auto_822219 ) ) ( not ( = ?auto_822218 ?auto_822220 ) ) ( not ( = ?auto_822218 ?auto_822221 ) ) ( not ( = ?auto_822218 ?auto_822222 ) ) ( not ( = ?auto_822218 ?auto_822223 ) ) ( not ( = ?auto_822218 ?auto_822224 ) ) ( not ( = ?auto_822218 ?auto_822225 ) ) ( not ( = ?auto_822218 ?auto_822226 ) ) ( not ( = ?auto_822218 ?auto_822227 ) ) ( not ( = ?auto_822218 ?auto_822228 ) ) ( not ( = ?auto_822218 ?auto_822229 ) ) ( not ( = ?auto_822219 ?auto_822220 ) ) ( not ( = ?auto_822219 ?auto_822221 ) ) ( not ( = ?auto_822219 ?auto_822222 ) ) ( not ( = ?auto_822219 ?auto_822223 ) ) ( not ( = ?auto_822219 ?auto_822224 ) ) ( not ( = ?auto_822219 ?auto_822225 ) ) ( not ( = ?auto_822219 ?auto_822226 ) ) ( not ( = ?auto_822219 ?auto_822227 ) ) ( not ( = ?auto_822219 ?auto_822228 ) ) ( not ( = ?auto_822219 ?auto_822229 ) ) ( not ( = ?auto_822220 ?auto_822221 ) ) ( not ( = ?auto_822220 ?auto_822222 ) ) ( not ( = ?auto_822220 ?auto_822223 ) ) ( not ( = ?auto_822220 ?auto_822224 ) ) ( not ( = ?auto_822220 ?auto_822225 ) ) ( not ( = ?auto_822220 ?auto_822226 ) ) ( not ( = ?auto_822220 ?auto_822227 ) ) ( not ( = ?auto_822220 ?auto_822228 ) ) ( not ( = ?auto_822220 ?auto_822229 ) ) ( not ( = ?auto_822221 ?auto_822222 ) ) ( not ( = ?auto_822221 ?auto_822223 ) ) ( not ( = ?auto_822221 ?auto_822224 ) ) ( not ( = ?auto_822221 ?auto_822225 ) ) ( not ( = ?auto_822221 ?auto_822226 ) ) ( not ( = ?auto_822221 ?auto_822227 ) ) ( not ( = ?auto_822221 ?auto_822228 ) ) ( not ( = ?auto_822221 ?auto_822229 ) ) ( not ( = ?auto_822222 ?auto_822223 ) ) ( not ( = ?auto_822222 ?auto_822224 ) ) ( not ( = ?auto_822222 ?auto_822225 ) ) ( not ( = ?auto_822222 ?auto_822226 ) ) ( not ( = ?auto_822222 ?auto_822227 ) ) ( not ( = ?auto_822222 ?auto_822228 ) ) ( not ( = ?auto_822222 ?auto_822229 ) ) ( not ( = ?auto_822223 ?auto_822224 ) ) ( not ( = ?auto_822223 ?auto_822225 ) ) ( not ( = ?auto_822223 ?auto_822226 ) ) ( not ( = ?auto_822223 ?auto_822227 ) ) ( not ( = ?auto_822223 ?auto_822228 ) ) ( not ( = ?auto_822223 ?auto_822229 ) ) ( not ( = ?auto_822224 ?auto_822225 ) ) ( not ( = ?auto_822224 ?auto_822226 ) ) ( not ( = ?auto_822224 ?auto_822227 ) ) ( not ( = ?auto_822224 ?auto_822228 ) ) ( not ( = ?auto_822224 ?auto_822229 ) ) ( not ( = ?auto_822225 ?auto_822226 ) ) ( not ( = ?auto_822225 ?auto_822227 ) ) ( not ( = ?auto_822225 ?auto_822228 ) ) ( not ( = ?auto_822225 ?auto_822229 ) ) ( not ( = ?auto_822226 ?auto_822227 ) ) ( not ( = ?auto_822226 ?auto_822228 ) ) ( not ( = ?auto_822226 ?auto_822229 ) ) ( not ( = ?auto_822227 ?auto_822228 ) ) ( not ( = ?auto_822227 ?auto_822229 ) ) ( not ( = ?auto_822228 ?auto_822229 ) ) ( ON ?auto_822227 ?auto_822228 ) ( ON ?auto_822226 ?auto_822227 ) ( ON ?auto_822225 ?auto_822226 ) ( ON ?auto_822224 ?auto_822225 ) ( ON ?auto_822223 ?auto_822224 ) ( ON ?auto_822222 ?auto_822223 ) ( ON ?auto_822221 ?auto_822222 ) ( ON ?auto_822220 ?auto_822221 ) ( ON ?auto_822219 ?auto_822220 ) ( ON ?auto_822218 ?auto_822219 ) ( CLEAR ?auto_822216 ) ( ON ?auto_822217 ?auto_822218 ) ( CLEAR ?auto_822217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_822216 ?auto_822217 )
      ( MAKE-13PILE ?auto_822216 ?auto_822217 ?auto_822218 ?auto_822219 ?auto_822220 ?auto_822221 ?auto_822222 ?auto_822223 ?auto_822224 ?auto_822225 ?auto_822226 ?auto_822227 ?auto_822228 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_822270 - BLOCK
      ?auto_822271 - BLOCK
      ?auto_822272 - BLOCK
      ?auto_822273 - BLOCK
      ?auto_822274 - BLOCK
      ?auto_822275 - BLOCK
      ?auto_822276 - BLOCK
      ?auto_822277 - BLOCK
      ?auto_822278 - BLOCK
      ?auto_822279 - BLOCK
      ?auto_822280 - BLOCK
      ?auto_822281 - BLOCK
      ?auto_822282 - BLOCK
    )
    :vars
    (
      ?auto_822283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822282 ?auto_822283 ) ( not ( = ?auto_822270 ?auto_822271 ) ) ( not ( = ?auto_822270 ?auto_822272 ) ) ( not ( = ?auto_822270 ?auto_822273 ) ) ( not ( = ?auto_822270 ?auto_822274 ) ) ( not ( = ?auto_822270 ?auto_822275 ) ) ( not ( = ?auto_822270 ?auto_822276 ) ) ( not ( = ?auto_822270 ?auto_822277 ) ) ( not ( = ?auto_822270 ?auto_822278 ) ) ( not ( = ?auto_822270 ?auto_822279 ) ) ( not ( = ?auto_822270 ?auto_822280 ) ) ( not ( = ?auto_822270 ?auto_822281 ) ) ( not ( = ?auto_822270 ?auto_822282 ) ) ( not ( = ?auto_822270 ?auto_822283 ) ) ( not ( = ?auto_822271 ?auto_822272 ) ) ( not ( = ?auto_822271 ?auto_822273 ) ) ( not ( = ?auto_822271 ?auto_822274 ) ) ( not ( = ?auto_822271 ?auto_822275 ) ) ( not ( = ?auto_822271 ?auto_822276 ) ) ( not ( = ?auto_822271 ?auto_822277 ) ) ( not ( = ?auto_822271 ?auto_822278 ) ) ( not ( = ?auto_822271 ?auto_822279 ) ) ( not ( = ?auto_822271 ?auto_822280 ) ) ( not ( = ?auto_822271 ?auto_822281 ) ) ( not ( = ?auto_822271 ?auto_822282 ) ) ( not ( = ?auto_822271 ?auto_822283 ) ) ( not ( = ?auto_822272 ?auto_822273 ) ) ( not ( = ?auto_822272 ?auto_822274 ) ) ( not ( = ?auto_822272 ?auto_822275 ) ) ( not ( = ?auto_822272 ?auto_822276 ) ) ( not ( = ?auto_822272 ?auto_822277 ) ) ( not ( = ?auto_822272 ?auto_822278 ) ) ( not ( = ?auto_822272 ?auto_822279 ) ) ( not ( = ?auto_822272 ?auto_822280 ) ) ( not ( = ?auto_822272 ?auto_822281 ) ) ( not ( = ?auto_822272 ?auto_822282 ) ) ( not ( = ?auto_822272 ?auto_822283 ) ) ( not ( = ?auto_822273 ?auto_822274 ) ) ( not ( = ?auto_822273 ?auto_822275 ) ) ( not ( = ?auto_822273 ?auto_822276 ) ) ( not ( = ?auto_822273 ?auto_822277 ) ) ( not ( = ?auto_822273 ?auto_822278 ) ) ( not ( = ?auto_822273 ?auto_822279 ) ) ( not ( = ?auto_822273 ?auto_822280 ) ) ( not ( = ?auto_822273 ?auto_822281 ) ) ( not ( = ?auto_822273 ?auto_822282 ) ) ( not ( = ?auto_822273 ?auto_822283 ) ) ( not ( = ?auto_822274 ?auto_822275 ) ) ( not ( = ?auto_822274 ?auto_822276 ) ) ( not ( = ?auto_822274 ?auto_822277 ) ) ( not ( = ?auto_822274 ?auto_822278 ) ) ( not ( = ?auto_822274 ?auto_822279 ) ) ( not ( = ?auto_822274 ?auto_822280 ) ) ( not ( = ?auto_822274 ?auto_822281 ) ) ( not ( = ?auto_822274 ?auto_822282 ) ) ( not ( = ?auto_822274 ?auto_822283 ) ) ( not ( = ?auto_822275 ?auto_822276 ) ) ( not ( = ?auto_822275 ?auto_822277 ) ) ( not ( = ?auto_822275 ?auto_822278 ) ) ( not ( = ?auto_822275 ?auto_822279 ) ) ( not ( = ?auto_822275 ?auto_822280 ) ) ( not ( = ?auto_822275 ?auto_822281 ) ) ( not ( = ?auto_822275 ?auto_822282 ) ) ( not ( = ?auto_822275 ?auto_822283 ) ) ( not ( = ?auto_822276 ?auto_822277 ) ) ( not ( = ?auto_822276 ?auto_822278 ) ) ( not ( = ?auto_822276 ?auto_822279 ) ) ( not ( = ?auto_822276 ?auto_822280 ) ) ( not ( = ?auto_822276 ?auto_822281 ) ) ( not ( = ?auto_822276 ?auto_822282 ) ) ( not ( = ?auto_822276 ?auto_822283 ) ) ( not ( = ?auto_822277 ?auto_822278 ) ) ( not ( = ?auto_822277 ?auto_822279 ) ) ( not ( = ?auto_822277 ?auto_822280 ) ) ( not ( = ?auto_822277 ?auto_822281 ) ) ( not ( = ?auto_822277 ?auto_822282 ) ) ( not ( = ?auto_822277 ?auto_822283 ) ) ( not ( = ?auto_822278 ?auto_822279 ) ) ( not ( = ?auto_822278 ?auto_822280 ) ) ( not ( = ?auto_822278 ?auto_822281 ) ) ( not ( = ?auto_822278 ?auto_822282 ) ) ( not ( = ?auto_822278 ?auto_822283 ) ) ( not ( = ?auto_822279 ?auto_822280 ) ) ( not ( = ?auto_822279 ?auto_822281 ) ) ( not ( = ?auto_822279 ?auto_822282 ) ) ( not ( = ?auto_822279 ?auto_822283 ) ) ( not ( = ?auto_822280 ?auto_822281 ) ) ( not ( = ?auto_822280 ?auto_822282 ) ) ( not ( = ?auto_822280 ?auto_822283 ) ) ( not ( = ?auto_822281 ?auto_822282 ) ) ( not ( = ?auto_822281 ?auto_822283 ) ) ( not ( = ?auto_822282 ?auto_822283 ) ) ( ON ?auto_822281 ?auto_822282 ) ( ON ?auto_822280 ?auto_822281 ) ( ON ?auto_822279 ?auto_822280 ) ( ON ?auto_822278 ?auto_822279 ) ( ON ?auto_822277 ?auto_822278 ) ( ON ?auto_822276 ?auto_822277 ) ( ON ?auto_822275 ?auto_822276 ) ( ON ?auto_822274 ?auto_822275 ) ( ON ?auto_822273 ?auto_822274 ) ( ON ?auto_822272 ?auto_822273 ) ( ON ?auto_822271 ?auto_822272 ) ( ON ?auto_822270 ?auto_822271 ) ( CLEAR ?auto_822270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_822270 )
      ( MAKE-13PILE ?auto_822270 ?auto_822271 ?auto_822272 ?auto_822273 ?auto_822274 ?auto_822275 ?auto_822276 ?auto_822277 ?auto_822278 ?auto_822279 ?auto_822280 ?auto_822281 ?auto_822282 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_822325 - BLOCK
      ?auto_822326 - BLOCK
      ?auto_822327 - BLOCK
      ?auto_822328 - BLOCK
      ?auto_822329 - BLOCK
      ?auto_822330 - BLOCK
      ?auto_822331 - BLOCK
      ?auto_822332 - BLOCK
      ?auto_822333 - BLOCK
      ?auto_822334 - BLOCK
      ?auto_822335 - BLOCK
      ?auto_822336 - BLOCK
      ?auto_822337 - BLOCK
      ?auto_822338 - BLOCK
    )
    :vars
    (
      ?auto_822339 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_822337 ) ( ON ?auto_822338 ?auto_822339 ) ( CLEAR ?auto_822338 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_822325 ) ( ON ?auto_822326 ?auto_822325 ) ( ON ?auto_822327 ?auto_822326 ) ( ON ?auto_822328 ?auto_822327 ) ( ON ?auto_822329 ?auto_822328 ) ( ON ?auto_822330 ?auto_822329 ) ( ON ?auto_822331 ?auto_822330 ) ( ON ?auto_822332 ?auto_822331 ) ( ON ?auto_822333 ?auto_822332 ) ( ON ?auto_822334 ?auto_822333 ) ( ON ?auto_822335 ?auto_822334 ) ( ON ?auto_822336 ?auto_822335 ) ( ON ?auto_822337 ?auto_822336 ) ( not ( = ?auto_822325 ?auto_822326 ) ) ( not ( = ?auto_822325 ?auto_822327 ) ) ( not ( = ?auto_822325 ?auto_822328 ) ) ( not ( = ?auto_822325 ?auto_822329 ) ) ( not ( = ?auto_822325 ?auto_822330 ) ) ( not ( = ?auto_822325 ?auto_822331 ) ) ( not ( = ?auto_822325 ?auto_822332 ) ) ( not ( = ?auto_822325 ?auto_822333 ) ) ( not ( = ?auto_822325 ?auto_822334 ) ) ( not ( = ?auto_822325 ?auto_822335 ) ) ( not ( = ?auto_822325 ?auto_822336 ) ) ( not ( = ?auto_822325 ?auto_822337 ) ) ( not ( = ?auto_822325 ?auto_822338 ) ) ( not ( = ?auto_822325 ?auto_822339 ) ) ( not ( = ?auto_822326 ?auto_822327 ) ) ( not ( = ?auto_822326 ?auto_822328 ) ) ( not ( = ?auto_822326 ?auto_822329 ) ) ( not ( = ?auto_822326 ?auto_822330 ) ) ( not ( = ?auto_822326 ?auto_822331 ) ) ( not ( = ?auto_822326 ?auto_822332 ) ) ( not ( = ?auto_822326 ?auto_822333 ) ) ( not ( = ?auto_822326 ?auto_822334 ) ) ( not ( = ?auto_822326 ?auto_822335 ) ) ( not ( = ?auto_822326 ?auto_822336 ) ) ( not ( = ?auto_822326 ?auto_822337 ) ) ( not ( = ?auto_822326 ?auto_822338 ) ) ( not ( = ?auto_822326 ?auto_822339 ) ) ( not ( = ?auto_822327 ?auto_822328 ) ) ( not ( = ?auto_822327 ?auto_822329 ) ) ( not ( = ?auto_822327 ?auto_822330 ) ) ( not ( = ?auto_822327 ?auto_822331 ) ) ( not ( = ?auto_822327 ?auto_822332 ) ) ( not ( = ?auto_822327 ?auto_822333 ) ) ( not ( = ?auto_822327 ?auto_822334 ) ) ( not ( = ?auto_822327 ?auto_822335 ) ) ( not ( = ?auto_822327 ?auto_822336 ) ) ( not ( = ?auto_822327 ?auto_822337 ) ) ( not ( = ?auto_822327 ?auto_822338 ) ) ( not ( = ?auto_822327 ?auto_822339 ) ) ( not ( = ?auto_822328 ?auto_822329 ) ) ( not ( = ?auto_822328 ?auto_822330 ) ) ( not ( = ?auto_822328 ?auto_822331 ) ) ( not ( = ?auto_822328 ?auto_822332 ) ) ( not ( = ?auto_822328 ?auto_822333 ) ) ( not ( = ?auto_822328 ?auto_822334 ) ) ( not ( = ?auto_822328 ?auto_822335 ) ) ( not ( = ?auto_822328 ?auto_822336 ) ) ( not ( = ?auto_822328 ?auto_822337 ) ) ( not ( = ?auto_822328 ?auto_822338 ) ) ( not ( = ?auto_822328 ?auto_822339 ) ) ( not ( = ?auto_822329 ?auto_822330 ) ) ( not ( = ?auto_822329 ?auto_822331 ) ) ( not ( = ?auto_822329 ?auto_822332 ) ) ( not ( = ?auto_822329 ?auto_822333 ) ) ( not ( = ?auto_822329 ?auto_822334 ) ) ( not ( = ?auto_822329 ?auto_822335 ) ) ( not ( = ?auto_822329 ?auto_822336 ) ) ( not ( = ?auto_822329 ?auto_822337 ) ) ( not ( = ?auto_822329 ?auto_822338 ) ) ( not ( = ?auto_822329 ?auto_822339 ) ) ( not ( = ?auto_822330 ?auto_822331 ) ) ( not ( = ?auto_822330 ?auto_822332 ) ) ( not ( = ?auto_822330 ?auto_822333 ) ) ( not ( = ?auto_822330 ?auto_822334 ) ) ( not ( = ?auto_822330 ?auto_822335 ) ) ( not ( = ?auto_822330 ?auto_822336 ) ) ( not ( = ?auto_822330 ?auto_822337 ) ) ( not ( = ?auto_822330 ?auto_822338 ) ) ( not ( = ?auto_822330 ?auto_822339 ) ) ( not ( = ?auto_822331 ?auto_822332 ) ) ( not ( = ?auto_822331 ?auto_822333 ) ) ( not ( = ?auto_822331 ?auto_822334 ) ) ( not ( = ?auto_822331 ?auto_822335 ) ) ( not ( = ?auto_822331 ?auto_822336 ) ) ( not ( = ?auto_822331 ?auto_822337 ) ) ( not ( = ?auto_822331 ?auto_822338 ) ) ( not ( = ?auto_822331 ?auto_822339 ) ) ( not ( = ?auto_822332 ?auto_822333 ) ) ( not ( = ?auto_822332 ?auto_822334 ) ) ( not ( = ?auto_822332 ?auto_822335 ) ) ( not ( = ?auto_822332 ?auto_822336 ) ) ( not ( = ?auto_822332 ?auto_822337 ) ) ( not ( = ?auto_822332 ?auto_822338 ) ) ( not ( = ?auto_822332 ?auto_822339 ) ) ( not ( = ?auto_822333 ?auto_822334 ) ) ( not ( = ?auto_822333 ?auto_822335 ) ) ( not ( = ?auto_822333 ?auto_822336 ) ) ( not ( = ?auto_822333 ?auto_822337 ) ) ( not ( = ?auto_822333 ?auto_822338 ) ) ( not ( = ?auto_822333 ?auto_822339 ) ) ( not ( = ?auto_822334 ?auto_822335 ) ) ( not ( = ?auto_822334 ?auto_822336 ) ) ( not ( = ?auto_822334 ?auto_822337 ) ) ( not ( = ?auto_822334 ?auto_822338 ) ) ( not ( = ?auto_822334 ?auto_822339 ) ) ( not ( = ?auto_822335 ?auto_822336 ) ) ( not ( = ?auto_822335 ?auto_822337 ) ) ( not ( = ?auto_822335 ?auto_822338 ) ) ( not ( = ?auto_822335 ?auto_822339 ) ) ( not ( = ?auto_822336 ?auto_822337 ) ) ( not ( = ?auto_822336 ?auto_822338 ) ) ( not ( = ?auto_822336 ?auto_822339 ) ) ( not ( = ?auto_822337 ?auto_822338 ) ) ( not ( = ?auto_822337 ?auto_822339 ) ) ( not ( = ?auto_822338 ?auto_822339 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_822338 ?auto_822339 )
      ( !STACK ?auto_822338 ?auto_822337 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_822383 - BLOCK
      ?auto_822384 - BLOCK
      ?auto_822385 - BLOCK
      ?auto_822386 - BLOCK
      ?auto_822387 - BLOCK
      ?auto_822388 - BLOCK
      ?auto_822389 - BLOCK
      ?auto_822390 - BLOCK
      ?auto_822391 - BLOCK
      ?auto_822392 - BLOCK
      ?auto_822393 - BLOCK
      ?auto_822394 - BLOCK
      ?auto_822395 - BLOCK
      ?auto_822396 - BLOCK
    )
    :vars
    (
      ?auto_822397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822396 ?auto_822397 ) ( ON-TABLE ?auto_822383 ) ( ON ?auto_822384 ?auto_822383 ) ( ON ?auto_822385 ?auto_822384 ) ( ON ?auto_822386 ?auto_822385 ) ( ON ?auto_822387 ?auto_822386 ) ( ON ?auto_822388 ?auto_822387 ) ( ON ?auto_822389 ?auto_822388 ) ( ON ?auto_822390 ?auto_822389 ) ( ON ?auto_822391 ?auto_822390 ) ( ON ?auto_822392 ?auto_822391 ) ( ON ?auto_822393 ?auto_822392 ) ( ON ?auto_822394 ?auto_822393 ) ( not ( = ?auto_822383 ?auto_822384 ) ) ( not ( = ?auto_822383 ?auto_822385 ) ) ( not ( = ?auto_822383 ?auto_822386 ) ) ( not ( = ?auto_822383 ?auto_822387 ) ) ( not ( = ?auto_822383 ?auto_822388 ) ) ( not ( = ?auto_822383 ?auto_822389 ) ) ( not ( = ?auto_822383 ?auto_822390 ) ) ( not ( = ?auto_822383 ?auto_822391 ) ) ( not ( = ?auto_822383 ?auto_822392 ) ) ( not ( = ?auto_822383 ?auto_822393 ) ) ( not ( = ?auto_822383 ?auto_822394 ) ) ( not ( = ?auto_822383 ?auto_822395 ) ) ( not ( = ?auto_822383 ?auto_822396 ) ) ( not ( = ?auto_822383 ?auto_822397 ) ) ( not ( = ?auto_822384 ?auto_822385 ) ) ( not ( = ?auto_822384 ?auto_822386 ) ) ( not ( = ?auto_822384 ?auto_822387 ) ) ( not ( = ?auto_822384 ?auto_822388 ) ) ( not ( = ?auto_822384 ?auto_822389 ) ) ( not ( = ?auto_822384 ?auto_822390 ) ) ( not ( = ?auto_822384 ?auto_822391 ) ) ( not ( = ?auto_822384 ?auto_822392 ) ) ( not ( = ?auto_822384 ?auto_822393 ) ) ( not ( = ?auto_822384 ?auto_822394 ) ) ( not ( = ?auto_822384 ?auto_822395 ) ) ( not ( = ?auto_822384 ?auto_822396 ) ) ( not ( = ?auto_822384 ?auto_822397 ) ) ( not ( = ?auto_822385 ?auto_822386 ) ) ( not ( = ?auto_822385 ?auto_822387 ) ) ( not ( = ?auto_822385 ?auto_822388 ) ) ( not ( = ?auto_822385 ?auto_822389 ) ) ( not ( = ?auto_822385 ?auto_822390 ) ) ( not ( = ?auto_822385 ?auto_822391 ) ) ( not ( = ?auto_822385 ?auto_822392 ) ) ( not ( = ?auto_822385 ?auto_822393 ) ) ( not ( = ?auto_822385 ?auto_822394 ) ) ( not ( = ?auto_822385 ?auto_822395 ) ) ( not ( = ?auto_822385 ?auto_822396 ) ) ( not ( = ?auto_822385 ?auto_822397 ) ) ( not ( = ?auto_822386 ?auto_822387 ) ) ( not ( = ?auto_822386 ?auto_822388 ) ) ( not ( = ?auto_822386 ?auto_822389 ) ) ( not ( = ?auto_822386 ?auto_822390 ) ) ( not ( = ?auto_822386 ?auto_822391 ) ) ( not ( = ?auto_822386 ?auto_822392 ) ) ( not ( = ?auto_822386 ?auto_822393 ) ) ( not ( = ?auto_822386 ?auto_822394 ) ) ( not ( = ?auto_822386 ?auto_822395 ) ) ( not ( = ?auto_822386 ?auto_822396 ) ) ( not ( = ?auto_822386 ?auto_822397 ) ) ( not ( = ?auto_822387 ?auto_822388 ) ) ( not ( = ?auto_822387 ?auto_822389 ) ) ( not ( = ?auto_822387 ?auto_822390 ) ) ( not ( = ?auto_822387 ?auto_822391 ) ) ( not ( = ?auto_822387 ?auto_822392 ) ) ( not ( = ?auto_822387 ?auto_822393 ) ) ( not ( = ?auto_822387 ?auto_822394 ) ) ( not ( = ?auto_822387 ?auto_822395 ) ) ( not ( = ?auto_822387 ?auto_822396 ) ) ( not ( = ?auto_822387 ?auto_822397 ) ) ( not ( = ?auto_822388 ?auto_822389 ) ) ( not ( = ?auto_822388 ?auto_822390 ) ) ( not ( = ?auto_822388 ?auto_822391 ) ) ( not ( = ?auto_822388 ?auto_822392 ) ) ( not ( = ?auto_822388 ?auto_822393 ) ) ( not ( = ?auto_822388 ?auto_822394 ) ) ( not ( = ?auto_822388 ?auto_822395 ) ) ( not ( = ?auto_822388 ?auto_822396 ) ) ( not ( = ?auto_822388 ?auto_822397 ) ) ( not ( = ?auto_822389 ?auto_822390 ) ) ( not ( = ?auto_822389 ?auto_822391 ) ) ( not ( = ?auto_822389 ?auto_822392 ) ) ( not ( = ?auto_822389 ?auto_822393 ) ) ( not ( = ?auto_822389 ?auto_822394 ) ) ( not ( = ?auto_822389 ?auto_822395 ) ) ( not ( = ?auto_822389 ?auto_822396 ) ) ( not ( = ?auto_822389 ?auto_822397 ) ) ( not ( = ?auto_822390 ?auto_822391 ) ) ( not ( = ?auto_822390 ?auto_822392 ) ) ( not ( = ?auto_822390 ?auto_822393 ) ) ( not ( = ?auto_822390 ?auto_822394 ) ) ( not ( = ?auto_822390 ?auto_822395 ) ) ( not ( = ?auto_822390 ?auto_822396 ) ) ( not ( = ?auto_822390 ?auto_822397 ) ) ( not ( = ?auto_822391 ?auto_822392 ) ) ( not ( = ?auto_822391 ?auto_822393 ) ) ( not ( = ?auto_822391 ?auto_822394 ) ) ( not ( = ?auto_822391 ?auto_822395 ) ) ( not ( = ?auto_822391 ?auto_822396 ) ) ( not ( = ?auto_822391 ?auto_822397 ) ) ( not ( = ?auto_822392 ?auto_822393 ) ) ( not ( = ?auto_822392 ?auto_822394 ) ) ( not ( = ?auto_822392 ?auto_822395 ) ) ( not ( = ?auto_822392 ?auto_822396 ) ) ( not ( = ?auto_822392 ?auto_822397 ) ) ( not ( = ?auto_822393 ?auto_822394 ) ) ( not ( = ?auto_822393 ?auto_822395 ) ) ( not ( = ?auto_822393 ?auto_822396 ) ) ( not ( = ?auto_822393 ?auto_822397 ) ) ( not ( = ?auto_822394 ?auto_822395 ) ) ( not ( = ?auto_822394 ?auto_822396 ) ) ( not ( = ?auto_822394 ?auto_822397 ) ) ( not ( = ?auto_822395 ?auto_822396 ) ) ( not ( = ?auto_822395 ?auto_822397 ) ) ( not ( = ?auto_822396 ?auto_822397 ) ) ( CLEAR ?auto_822394 ) ( ON ?auto_822395 ?auto_822396 ) ( CLEAR ?auto_822395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_822383 ?auto_822384 ?auto_822385 ?auto_822386 ?auto_822387 ?auto_822388 ?auto_822389 ?auto_822390 ?auto_822391 ?auto_822392 ?auto_822393 ?auto_822394 ?auto_822395 )
      ( MAKE-14PILE ?auto_822383 ?auto_822384 ?auto_822385 ?auto_822386 ?auto_822387 ?auto_822388 ?auto_822389 ?auto_822390 ?auto_822391 ?auto_822392 ?auto_822393 ?auto_822394 ?auto_822395 ?auto_822396 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_822441 - BLOCK
      ?auto_822442 - BLOCK
      ?auto_822443 - BLOCK
      ?auto_822444 - BLOCK
      ?auto_822445 - BLOCK
      ?auto_822446 - BLOCK
      ?auto_822447 - BLOCK
      ?auto_822448 - BLOCK
      ?auto_822449 - BLOCK
      ?auto_822450 - BLOCK
      ?auto_822451 - BLOCK
      ?auto_822452 - BLOCK
      ?auto_822453 - BLOCK
      ?auto_822454 - BLOCK
    )
    :vars
    (
      ?auto_822455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822454 ?auto_822455 ) ( ON-TABLE ?auto_822441 ) ( ON ?auto_822442 ?auto_822441 ) ( ON ?auto_822443 ?auto_822442 ) ( ON ?auto_822444 ?auto_822443 ) ( ON ?auto_822445 ?auto_822444 ) ( ON ?auto_822446 ?auto_822445 ) ( ON ?auto_822447 ?auto_822446 ) ( ON ?auto_822448 ?auto_822447 ) ( ON ?auto_822449 ?auto_822448 ) ( ON ?auto_822450 ?auto_822449 ) ( ON ?auto_822451 ?auto_822450 ) ( not ( = ?auto_822441 ?auto_822442 ) ) ( not ( = ?auto_822441 ?auto_822443 ) ) ( not ( = ?auto_822441 ?auto_822444 ) ) ( not ( = ?auto_822441 ?auto_822445 ) ) ( not ( = ?auto_822441 ?auto_822446 ) ) ( not ( = ?auto_822441 ?auto_822447 ) ) ( not ( = ?auto_822441 ?auto_822448 ) ) ( not ( = ?auto_822441 ?auto_822449 ) ) ( not ( = ?auto_822441 ?auto_822450 ) ) ( not ( = ?auto_822441 ?auto_822451 ) ) ( not ( = ?auto_822441 ?auto_822452 ) ) ( not ( = ?auto_822441 ?auto_822453 ) ) ( not ( = ?auto_822441 ?auto_822454 ) ) ( not ( = ?auto_822441 ?auto_822455 ) ) ( not ( = ?auto_822442 ?auto_822443 ) ) ( not ( = ?auto_822442 ?auto_822444 ) ) ( not ( = ?auto_822442 ?auto_822445 ) ) ( not ( = ?auto_822442 ?auto_822446 ) ) ( not ( = ?auto_822442 ?auto_822447 ) ) ( not ( = ?auto_822442 ?auto_822448 ) ) ( not ( = ?auto_822442 ?auto_822449 ) ) ( not ( = ?auto_822442 ?auto_822450 ) ) ( not ( = ?auto_822442 ?auto_822451 ) ) ( not ( = ?auto_822442 ?auto_822452 ) ) ( not ( = ?auto_822442 ?auto_822453 ) ) ( not ( = ?auto_822442 ?auto_822454 ) ) ( not ( = ?auto_822442 ?auto_822455 ) ) ( not ( = ?auto_822443 ?auto_822444 ) ) ( not ( = ?auto_822443 ?auto_822445 ) ) ( not ( = ?auto_822443 ?auto_822446 ) ) ( not ( = ?auto_822443 ?auto_822447 ) ) ( not ( = ?auto_822443 ?auto_822448 ) ) ( not ( = ?auto_822443 ?auto_822449 ) ) ( not ( = ?auto_822443 ?auto_822450 ) ) ( not ( = ?auto_822443 ?auto_822451 ) ) ( not ( = ?auto_822443 ?auto_822452 ) ) ( not ( = ?auto_822443 ?auto_822453 ) ) ( not ( = ?auto_822443 ?auto_822454 ) ) ( not ( = ?auto_822443 ?auto_822455 ) ) ( not ( = ?auto_822444 ?auto_822445 ) ) ( not ( = ?auto_822444 ?auto_822446 ) ) ( not ( = ?auto_822444 ?auto_822447 ) ) ( not ( = ?auto_822444 ?auto_822448 ) ) ( not ( = ?auto_822444 ?auto_822449 ) ) ( not ( = ?auto_822444 ?auto_822450 ) ) ( not ( = ?auto_822444 ?auto_822451 ) ) ( not ( = ?auto_822444 ?auto_822452 ) ) ( not ( = ?auto_822444 ?auto_822453 ) ) ( not ( = ?auto_822444 ?auto_822454 ) ) ( not ( = ?auto_822444 ?auto_822455 ) ) ( not ( = ?auto_822445 ?auto_822446 ) ) ( not ( = ?auto_822445 ?auto_822447 ) ) ( not ( = ?auto_822445 ?auto_822448 ) ) ( not ( = ?auto_822445 ?auto_822449 ) ) ( not ( = ?auto_822445 ?auto_822450 ) ) ( not ( = ?auto_822445 ?auto_822451 ) ) ( not ( = ?auto_822445 ?auto_822452 ) ) ( not ( = ?auto_822445 ?auto_822453 ) ) ( not ( = ?auto_822445 ?auto_822454 ) ) ( not ( = ?auto_822445 ?auto_822455 ) ) ( not ( = ?auto_822446 ?auto_822447 ) ) ( not ( = ?auto_822446 ?auto_822448 ) ) ( not ( = ?auto_822446 ?auto_822449 ) ) ( not ( = ?auto_822446 ?auto_822450 ) ) ( not ( = ?auto_822446 ?auto_822451 ) ) ( not ( = ?auto_822446 ?auto_822452 ) ) ( not ( = ?auto_822446 ?auto_822453 ) ) ( not ( = ?auto_822446 ?auto_822454 ) ) ( not ( = ?auto_822446 ?auto_822455 ) ) ( not ( = ?auto_822447 ?auto_822448 ) ) ( not ( = ?auto_822447 ?auto_822449 ) ) ( not ( = ?auto_822447 ?auto_822450 ) ) ( not ( = ?auto_822447 ?auto_822451 ) ) ( not ( = ?auto_822447 ?auto_822452 ) ) ( not ( = ?auto_822447 ?auto_822453 ) ) ( not ( = ?auto_822447 ?auto_822454 ) ) ( not ( = ?auto_822447 ?auto_822455 ) ) ( not ( = ?auto_822448 ?auto_822449 ) ) ( not ( = ?auto_822448 ?auto_822450 ) ) ( not ( = ?auto_822448 ?auto_822451 ) ) ( not ( = ?auto_822448 ?auto_822452 ) ) ( not ( = ?auto_822448 ?auto_822453 ) ) ( not ( = ?auto_822448 ?auto_822454 ) ) ( not ( = ?auto_822448 ?auto_822455 ) ) ( not ( = ?auto_822449 ?auto_822450 ) ) ( not ( = ?auto_822449 ?auto_822451 ) ) ( not ( = ?auto_822449 ?auto_822452 ) ) ( not ( = ?auto_822449 ?auto_822453 ) ) ( not ( = ?auto_822449 ?auto_822454 ) ) ( not ( = ?auto_822449 ?auto_822455 ) ) ( not ( = ?auto_822450 ?auto_822451 ) ) ( not ( = ?auto_822450 ?auto_822452 ) ) ( not ( = ?auto_822450 ?auto_822453 ) ) ( not ( = ?auto_822450 ?auto_822454 ) ) ( not ( = ?auto_822450 ?auto_822455 ) ) ( not ( = ?auto_822451 ?auto_822452 ) ) ( not ( = ?auto_822451 ?auto_822453 ) ) ( not ( = ?auto_822451 ?auto_822454 ) ) ( not ( = ?auto_822451 ?auto_822455 ) ) ( not ( = ?auto_822452 ?auto_822453 ) ) ( not ( = ?auto_822452 ?auto_822454 ) ) ( not ( = ?auto_822452 ?auto_822455 ) ) ( not ( = ?auto_822453 ?auto_822454 ) ) ( not ( = ?auto_822453 ?auto_822455 ) ) ( not ( = ?auto_822454 ?auto_822455 ) ) ( ON ?auto_822453 ?auto_822454 ) ( CLEAR ?auto_822451 ) ( ON ?auto_822452 ?auto_822453 ) ( CLEAR ?auto_822452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_822441 ?auto_822442 ?auto_822443 ?auto_822444 ?auto_822445 ?auto_822446 ?auto_822447 ?auto_822448 ?auto_822449 ?auto_822450 ?auto_822451 ?auto_822452 )
      ( MAKE-14PILE ?auto_822441 ?auto_822442 ?auto_822443 ?auto_822444 ?auto_822445 ?auto_822446 ?auto_822447 ?auto_822448 ?auto_822449 ?auto_822450 ?auto_822451 ?auto_822452 ?auto_822453 ?auto_822454 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_822499 - BLOCK
      ?auto_822500 - BLOCK
      ?auto_822501 - BLOCK
      ?auto_822502 - BLOCK
      ?auto_822503 - BLOCK
      ?auto_822504 - BLOCK
      ?auto_822505 - BLOCK
      ?auto_822506 - BLOCK
      ?auto_822507 - BLOCK
      ?auto_822508 - BLOCK
      ?auto_822509 - BLOCK
      ?auto_822510 - BLOCK
      ?auto_822511 - BLOCK
      ?auto_822512 - BLOCK
    )
    :vars
    (
      ?auto_822513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822512 ?auto_822513 ) ( ON-TABLE ?auto_822499 ) ( ON ?auto_822500 ?auto_822499 ) ( ON ?auto_822501 ?auto_822500 ) ( ON ?auto_822502 ?auto_822501 ) ( ON ?auto_822503 ?auto_822502 ) ( ON ?auto_822504 ?auto_822503 ) ( ON ?auto_822505 ?auto_822504 ) ( ON ?auto_822506 ?auto_822505 ) ( ON ?auto_822507 ?auto_822506 ) ( ON ?auto_822508 ?auto_822507 ) ( not ( = ?auto_822499 ?auto_822500 ) ) ( not ( = ?auto_822499 ?auto_822501 ) ) ( not ( = ?auto_822499 ?auto_822502 ) ) ( not ( = ?auto_822499 ?auto_822503 ) ) ( not ( = ?auto_822499 ?auto_822504 ) ) ( not ( = ?auto_822499 ?auto_822505 ) ) ( not ( = ?auto_822499 ?auto_822506 ) ) ( not ( = ?auto_822499 ?auto_822507 ) ) ( not ( = ?auto_822499 ?auto_822508 ) ) ( not ( = ?auto_822499 ?auto_822509 ) ) ( not ( = ?auto_822499 ?auto_822510 ) ) ( not ( = ?auto_822499 ?auto_822511 ) ) ( not ( = ?auto_822499 ?auto_822512 ) ) ( not ( = ?auto_822499 ?auto_822513 ) ) ( not ( = ?auto_822500 ?auto_822501 ) ) ( not ( = ?auto_822500 ?auto_822502 ) ) ( not ( = ?auto_822500 ?auto_822503 ) ) ( not ( = ?auto_822500 ?auto_822504 ) ) ( not ( = ?auto_822500 ?auto_822505 ) ) ( not ( = ?auto_822500 ?auto_822506 ) ) ( not ( = ?auto_822500 ?auto_822507 ) ) ( not ( = ?auto_822500 ?auto_822508 ) ) ( not ( = ?auto_822500 ?auto_822509 ) ) ( not ( = ?auto_822500 ?auto_822510 ) ) ( not ( = ?auto_822500 ?auto_822511 ) ) ( not ( = ?auto_822500 ?auto_822512 ) ) ( not ( = ?auto_822500 ?auto_822513 ) ) ( not ( = ?auto_822501 ?auto_822502 ) ) ( not ( = ?auto_822501 ?auto_822503 ) ) ( not ( = ?auto_822501 ?auto_822504 ) ) ( not ( = ?auto_822501 ?auto_822505 ) ) ( not ( = ?auto_822501 ?auto_822506 ) ) ( not ( = ?auto_822501 ?auto_822507 ) ) ( not ( = ?auto_822501 ?auto_822508 ) ) ( not ( = ?auto_822501 ?auto_822509 ) ) ( not ( = ?auto_822501 ?auto_822510 ) ) ( not ( = ?auto_822501 ?auto_822511 ) ) ( not ( = ?auto_822501 ?auto_822512 ) ) ( not ( = ?auto_822501 ?auto_822513 ) ) ( not ( = ?auto_822502 ?auto_822503 ) ) ( not ( = ?auto_822502 ?auto_822504 ) ) ( not ( = ?auto_822502 ?auto_822505 ) ) ( not ( = ?auto_822502 ?auto_822506 ) ) ( not ( = ?auto_822502 ?auto_822507 ) ) ( not ( = ?auto_822502 ?auto_822508 ) ) ( not ( = ?auto_822502 ?auto_822509 ) ) ( not ( = ?auto_822502 ?auto_822510 ) ) ( not ( = ?auto_822502 ?auto_822511 ) ) ( not ( = ?auto_822502 ?auto_822512 ) ) ( not ( = ?auto_822502 ?auto_822513 ) ) ( not ( = ?auto_822503 ?auto_822504 ) ) ( not ( = ?auto_822503 ?auto_822505 ) ) ( not ( = ?auto_822503 ?auto_822506 ) ) ( not ( = ?auto_822503 ?auto_822507 ) ) ( not ( = ?auto_822503 ?auto_822508 ) ) ( not ( = ?auto_822503 ?auto_822509 ) ) ( not ( = ?auto_822503 ?auto_822510 ) ) ( not ( = ?auto_822503 ?auto_822511 ) ) ( not ( = ?auto_822503 ?auto_822512 ) ) ( not ( = ?auto_822503 ?auto_822513 ) ) ( not ( = ?auto_822504 ?auto_822505 ) ) ( not ( = ?auto_822504 ?auto_822506 ) ) ( not ( = ?auto_822504 ?auto_822507 ) ) ( not ( = ?auto_822504 ?auto_822508 ) ) ( not ( = ?auto_822504 ?auto_822509 ) ) ( not ( = ?auto_822504 ?auto_822510 ) ) ( not ( = ?auto_822504 ?auto_822511 ) ) ( not ( = ?auto_822504 ?auto_822512 ) ) ( not ( = ?auto_822504 ?auto_822513 ) ) ( not ( = ?auto_822505 ?auto_822506 ) ) ( not ( = ?auto_822505 ?auto_822507 ) ) ( not ( = ?auto_822505 ?auto_822508 ) ) ( not ( = ?auto_822505 ?auto_822509 ) ) ( not ( = ?auto_822505 ?auto_822510 ) ) ( not ( = ?auto_822505 ?auto_822511 ) ) ( not ( = ?auto_822505 ?auto_822512 ) ) ( not ( = ?auto_822505 ?auto_822513 ) ) ( not ( = ?auto_822506 ?auto_822507 ) ) ( not ( = ?auto_822506 ?auto_822508 ) ) ( not ( = ?auto_822506 ?auto_822509 ) ) ( not ( = ?auto_822506 ?auto_822510 ) ) ( not ( = ?auto_822506 ?auto_822511 ) ) ( not ( = ?auto_822506 ?auto_822512 ) ) ( not ( = ?auto_822506 ?auto_822513 ) ) ( not ( = ?auto_822507 ?auto_822508 ) ) ( not ( = ?auto_822507 ?auto_822509 ) ) ( not ( = ?auto_822507 ?auto_822510 ) ) ( not ( = ?auto_822507 ?auto_822511 ) ) ( not ( = ?auto_822507 ?auto_822512 ) ) ( not ( = ?auto_822507 ?auto_822513 ) ) ( not ( = ?auto_822508 ?auto_822509 ) ) ( not ( = ?auto_822508 ?auto_822510 ) ) ( not ( = ?auto_822508 ?auto_822511 ) ) ( not ( = ?auto_822508 ?auto_822512 ) ) ( not ( = ?auto_822508 ?auto_822513 ) ) ( not ( = ?auto_822509 ?auto_822510 ) ) ( not ( = ?auto_822509 ?auto_822511 ) ) ( not ( = ?auto_822509 ?auto_822512 ) ) ( not ( = ?auto_822509 ?auto_822513 ) ) ( not ( = ?auto_822510 ?auto_822511 ) ) ( not ( = ?auto_822510 ?auto_822512 ) ) ( not ( = ?auto_822510 ?auto_822513 ) ) ( not ( = ?auto_822511 ?auto_822512 ) ) ( not ( = ?auto_822511 ?auto_822513 ) ) ( not ( = ?auto_822512 ?auto_822513 ) ) ( ON ?auto_822511 ?auto_822512 ) ( ON ?auto_822510 ?auto_822511 ) ( CLEAR ?auto_822508 ) ( ON ?auto_822509 ?auto_822510 ) ( CLEAR ?auto_822509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_822499 ?auto_822500 ?auto_822501 ?auto_822502 ?auto_822503 ?auto_822504 ?auto_822505 ?auto_822506 ?auto_822507 ?auto_822508 ?auto_822509 )
      ( MAKE-14PILE ?auto_822499 ?auto_822500 ?auto_822501 ?auto_822502 ?auto_822503 ?auto_822504 ?auto_822505 ?auto_822506 ?auto_822507 ?auto_822508 ?auto_822509 ?auto_822510 ?auto_822511 ?auto_822512 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_822557 - BLOCK
      ?auto_822558 - BLOCK
      ?auto_822559 - BLOCK
      ?auto_822560 - BLOCK
      ?auto_822561 - BLOCK
      ?auto_822562 - BLOCK
      ?auto_822563 - BLOCK
      ?auto_822564 - BLOCK
      ?auto_822565 - BLOCK
      ?auto_822566 - BLOCK
      ?auto_822567 - BLOCK
      ?auto_822568 - BLOCK
      ?auto_822569 - BLOCK
      ?auto_822570 - BLOCK
    )
    :vars
    (
      ?auto_822571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822570 ?auto_822571 ) ( ON-TABLE ?auto_822557 ) ( ON ?auto_822558 ?auto_822557 ) ( ON ?auto_822559 ?auto_822558 ) ( ON ?auto_822560 ?auto_822559 ) ( ON ?auto_822561 ?auto_822560 ) ( ON ?auto_822562 ?auto_822561 ) ( ON ?auto_822563 ?auto_822562 ) ( ON ?auto_822564 ?auto_822563 ) ( ON ?auto_822565 ?auto_822564 ) ( not ( = ?auto_822557 ?auto_822558 ) ) ( not ( = ?auto_822557 ?auto_822559 ) ) ( not ( = ?auto_822557 ?auto_822560 ) ) ( not ( = ?auto_822557 ?auto_822561 ) ) ( not ( = ?auto_822557 ?auto_822562 ) ) ( not ( = ?auto_822557 ?auto_822563 ) ) ( not ( = ?auto_822557 ?auto_822564 ) ) ( not ( = ?auto_822557 ?auto_822565 ) ) ( not ( = ?auto_822557 ?auto_822566 ) ) ( not ( = ?auto_822557 ?auto_822567 ) ) ( not ( = ?auto_822557 ?auto_822568 ) ) ( not ( = ?auto_822557 ?auto_822569 ) ) ( not ( = ?auto_822557 ?auto_822570 ) ) ( not ( = ?auto_822557 ?auto_822571 ) ) ( not ( = ?auto_822558 ?auto_822559 ) ) ( not ( = ?auto_822558 ?auto_822560 ) ) ( not ( = ?auto_822558 ?auto_822561 ) ) ( not ( = ?auto_822558 ?auto_822562 ) ) ( not ( = ?auto_822558 ?auto_822563 ) ) ( not ( = ?auto_822558 ?auto_822564 ) ) ( not ( = ?auto_822558 ?auto_822565 ) ) ( not ( = ?auto_822558 ?auto_822566 ) ) ( not ( = ?auto_822558 ?auto_822567 ) ) ( not ( = ?auto_822558 ?auto_822568 ) ) ( not ( = ?auto_822558 ?auto_822569 ) ) ( not ( = ?auto_822558 ?auto_822570 ) ) ( not ( = ?auto_822558 ?auto_822571 ) ) ( not ( = ?auto_822559 ?auto_822560 ) ) ( not ( = ?auto_822559 ?auto_822561 ) ) ( not ( = ?auto_822559 ?auto_822562 ) ) ( not ( = ?auto_822559 ?auto_822563 ) ) ( not ( = ?auto_822559 ?auto_822564 ) ) ( not ( = ?auto_822559 ?auto_822565 ) ) ( not ( = ?auto_822559 ?auto_822566 ) ) ( not ( = ?auto_822559 ?auto_822567 ) ) ( not ( = ?auto_822559 ?auto_822568 ) ) ( not ( = ?auto_822559 ?auto_822569 ) ) ( not ( = ?auto_822559 ?auto_822570 ) ) ( not ( = ?auto_822559 ?auto_822571 ) ) ( not ( = ?auto_822560 ?auto_822561 ) ) ( not ( = ?auto_822560 ?auto_822562 ) ) ( not ( = ?auto_822560 ?auto_822563 ) ) ( not ( = ?auto_822560 ?auto_822564 ) ) ( not ( = ?auto_822560 ?auto_822565 ) ) ( not ( = ?auto_822560 ?auto_822566 ) ) ( not ( = ?auto_822560 ?auto_822567 ) ) ( not ( = ?auto_822560 ?auto_822568 ) ) ( not ( = ?auto_822560 ?auto_822569 ) ) ( not ( = ?auto_822560 ?auto_822570 ) ) ( not ( = ?auto_822560 ?auto_822571 ) ) ( not ( = ?auto_822561 ?auto_822562 ) ) ( not ( = ?auto_822561 ?auto_822563 ) ) ( not ( = ?auto_822561 ?auto_822564 ) ) ( not ( = ?auto_822561 ?auto_822565 ) ) ( not ( = ?auto_822561 ?auto_822566 ) ) ( not ( = ?auto_822561 ?auto_822567 ) ) ( not ( = ?auto_822561 ?auto_822568 ) ) ( not ( = ?auto_822561 ?auto_822569 ) ) ( not ( = ?auto_822561 ?auto_822570 ) ) ( not ( = ?auto_822561 ?auto_822571 ) ) ( not ( = ?auto_822562 ?auto_822563 ) ) ( not ( = ?auto_822562 ?auto_822564 ) ) ( not ( = ?auto_822562 ?auto_822565 ) ) ( not ( = ?auto_822562 ?auto_822566 ) ) ( not ( = ?auto_822562 ?auto_822567 ) ) ( not ( = ?auto_822562 ?auto_822568 ) ) ( not ( = ?auto_822562 ?auto_822569 ) ) ( not ( = ?auto_822562 ?auto_822570 ) ) ( not ( = ?auto_822562 ?auto_822571 ) ) ( not ( = ?auto_822563 ?auto_822564 ) ) ( not ( = ?auto_822563 ?auto_822565 ) ) ( not ( = ?auto_822563 ?auto_822566 ) ) ( not ( = ?auto_822563 ?auto_822567 ) ) ( not ( = ?auto_822563 ?auto_822568 ) ) ( not ( = ?auto_822563 ?auto_822569 ) ) ( not ( = ?auto_822563 ?auto_822570 ) ) ( not ( = ?auto_822563 ?auto_822571 ) ) ( not ( = ?auto_822564 ?auto_822565 ) ) ( not ( = ?auto_822564 ?auto_822566 ) ) ( not ( = ?auto_822564 ?auto_822567 ) ) ( not ( = ?auto_822564 ?auto_822568 ) ) ( not ( = ?auto_822564 ?auto_822569 ) ) ( not ( = ?auto_822564 ?auto_822570 ) ) ( not ( = ?auto_822564 ?auto_822571 ) ) ( not ( = ?auto_822565 ?auto_822566 ) ) ( not ( = ?auto_822565 ?auto_822567 ) ) ( not ( = ?auto_822565 ?auto_822568 ) ) ( not ( = ?auto_822565 ?auto_822569 ) ) ( not ( = ?auto_822565 ?auto_822570 ) ) ( not ( = ?auto_822565 ?auto_822571 ) ) ( not ( = ?auto_822566 ?auto_822567 ) ) ( not ( = ?auto_822566 ?auto_822568 ) ) ( not ( = ?auto_822566 ?auto_822569 ) ) ( not ( = ?auto_822566 ?auto_822570 ) ) ( not ( = ?auto_822566 ?auto_822571 ) ) ( not ( = ?auto_822567 ?auto_822568 ) ) ( not ( = ?auto_822567 ?auto_822569 ) ) ( not ( = ?auto_822567 ?auto_822570 ) ) ( not ( = ?auto_822567 ?auto_822571 ) ) ( not ( = ?auto_822568 ?auto_822569 ) ) ( not ( = ?auto_822568 ?auto_822570 ) ) ( not ( = ?auto_822568 ?auto_822571 ) ) ( not ( = ?auto_822569 ?auto_822570 ) ) ( not ( = ?auto_822569 ?auto_822571 ) ) ( not ( = ?auto_822570 ?auto_822571 ) ) ( ON ?auto_822569 ?auto_822570 ) ( ON ?auto_822568 ?auto_822569 ) ( ON ?auto_822567 ?auto_822568 ) ( CLEAR ?auto_822565 ) ( ON ?auto_822566 ?auto_822567 ) ( CLEAR ?auto_822566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_822557 ?auto_822558 ?auto_822559 ?auto_822560 ?auto_822561 ?auto_822562 ?auto_822563 ?auto_822564 ?auto_822565 ?auto_822566 )
      ( MAKE-14PILE ?auto_822557 ?auto_822558 ?auto_822559 ?auto_822560 ?auto_822561 ?auto_822562 ?auto_822563 ?auto_822564 ?auto_822565 ?auto_822566 ?auto_822567 ?auto_822568 ?auto_822569 ?auto_822570 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_822615 - BLOCK
      ?auto_822616 - BLOCK
      ?auto_822617 - BLOCK
      ?auto_822618 - BLOCK
      ?auto_822619 - BLOCK
      ?auto_822620 - BLOCK
      ?auto_822621 - BLOCK
      ?auto_822622 - BLOCK
      ?auto_822623 - BLOCK
      ?auto_822624 - BLOCK
      ?auto_822625 - BLOCK
      ?auto_822626 - BLOCK
      ?auto_822627 - BLOCK
      ?auto_822628 - BLOCK
    )
    :vars
    (
      ?auto_822629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822628 ?auto_822629 ) ( ON-TABLE ?auto_822615 ) ( ON ?auto_822616 ?auto_822615 ) ( ON ?auto_822617 ?auto_822616 ) ( ON ?auto_822618 ?auto_822617 ) ( ON ?auto_822619 ?auto_822618 ) ( ON ?auto_822620 ?auto_822619 ) ( ON ?auto_822621 ?auto_822620 ) ( ON ?auto_822622 ?auto_822621 ) ( not ( = ?auto_822615 ?auto_822616 ) ) ( not ( = ?auto_822615 ?auto_822617 ) ) ( not ( = ?auto_822615 ?auto_822618 ) ) ( not ( = ?auto_822615 ?auto_822619 ) ) ( not ( = ?auto_822615 ?auto_822620 ) ) ( not ( = ?auto_822615 ?auto_822621 ) ) ( not ( = ?auto_822615 ?auto_822622 ) ) ( not ( = ?auto_822615 ?auto_822623 ) ) ( not ( = ?auto_822615 ?auto_822624 ) ) ( not ( = ?auto_822615 ?auto_822625 ) ) ( not ( = ?auto_822615 ?auto_822626 ) ) ( not ( = ?auto_822615 ?auto_822627 ) ) ( not ( = ?auto_822615 ?auto_822628 ) ) ( not ( = ?auto_822615 ?auto_822629 ) ) ( not ( = ?auto_822616 ?auto_822617 ) ) ( not ( = ?auto_822616 ?auto_822618 ) ) ( not ( = ?auto_822616 ?auto_822619 ) ) ( not ( = ?auto_822616 ?auto_822620 ) ) ( not ( = ?auto_822616 ?auto_822621 ) ) ( not ( = ?auto_822616 ?auto_822622 ) ) ( not ( = ?auto_822616 ?auto_822623 ) ) ( not ( = ?auto_822616 ?auto_822624 ) ) ( not ( = ?auto_822616 ?auto_822625 ) ) ( not ( = ?auto_822616 ?auto_822626 ) ) ( not ( = ?auto_822616 ?auto_822627 ) ) ( not ( = ?auto_822616 ?auto_822628 ) ) ( not ( = ?auto_822616 ?auto_822629 ) ) ( not ( = ?auto_822617 ?auto_822618 ) ) ( not ( = ?auto_822617 ?auto_822619 ) ) ( not ( = ?auto_822617 ?auto_822620 ) ) ( not ( = ?auto_822617 ?auto_822621 ) ) ( not ( = ?auto_822617 ?auto_822622 ) ) ( not ( = ?auto_822617 ?auto_822623 ) ) ( not ( = ?auto_822617 ?auto_822624 ) ) ( not ( = ?auto_822617 ?auto_822625 ) ) ( not ( = ?auto_822617 ?auto_822626 ) ) ( not ( = ?auto_822617 ?auto_822627 ) ) ( not ( = ?auto_822617 ?auto_822628 ) ) ( not ( = ?auto_822617 ?auto_822629 ) ) ( not ( = ?auto_822618 ?auto_822619 ) ) ( not ( = ?auto_822618 ?auto_822620 ) ) ( not ( = ?auto_822618 ?auto_822621 ) ) ( not ( = ?auto_822618 ?auto_822622 ) ) ( not ( = ?auto_822618 ?auto_822623 ) ) ( not ( = ?auto_822618 ?auto_822624 ) ) ( not ( = ?auto_822618 ?auto_822625 ) ) ( not ( = ?auto_822618 ?auto_822626 ) ) ( not ( = ?auto_822618 ?auto_822627 ) ) ( not ( = ?auto_822618 ?auto_822628 ) ) ( not ( = ?auto_822618 ?auto_822629 ) ) ( not ( = ?auto_822619 ?auto_822620 ) ) ( not ( = ?auto_822619 ?auto_822621 ) ) ( not ( = ?auto_822619 ?auto_822622 ) ) ( not ( = ?auto_822619 ?auto_822623 ) ) ( not ( = ?auto_822619 ?auto_822624 ) ) ( not ( = ?auto_822619 ?auto_822625 ) ) ( not ( = ?auto_822619 ?auto_822626 ) ) ( not ( = ?auto_822619 ?auto_822627 ) ) ( not ( = ?auto_822619 ?auto_822628 ) ) ( not ( = ?auto_822619 ?auto_822629 ) ) ( not ( = ?auto_822620 ?auto_822621 ) ) ( not ( = ?auto_822620 ?auto_822622 ) ) ( not ( = ?auto_822620 ?auto_822623 ) ) ( not ( = ?auto_822620 ?auto_822624 ) ) ( not ( = ?auto_822620 ?auto_822625 ) ) ( not ( = ?auto_822620 ?auto_822626 ) ) ( not ( = ?auto_822620 ?auto_822627 ) ) ( not ( = ?auto_822620 ?auto_822628 ) ) ( not ( = ?auto_822620 ?auto_822629 ) ) ( not ( = ?auto_822621 ?auto_822622 ) ) ( not ( = ?auto_822621 ?auto_822623 ) ) ( not ( = ?auto_822621 ?auto_822624 ) ) ( not ( = ?auto_822621 ?auto_822625 ) ) ( not ( = ?auto_822621 ?auto_822626 ) ) ( not ( = ?auto_822621 ?auto_822627 ) ) ( not ( = ?auto_822621 ?auto_822628 ) ) ( not ( = ?auto_822621 ?auto_822629 ) ) ( not ( = ?auto_822622 ?auto_822623 ) ) ( not ( = ?auto_822622 ?auto_822624 ) ) ( not ( = ?auto_822622 ?auto_822625 ) ) ( not ( = ?auto_822622 ?auto_822626 ) ) ( not ( = ?auto_822622 ?auto_822627 ) ) ( not ( = ?auto_822622 ?auto_822628 ) ) ( not ( = ?auto_822622 ?auto_822629 ) ) ( not ( = ?auto_822623 ?auto_822624 ) ) ( not ( = ?auto_822623 ?auto_822625 ) ) ( not ( = ?auto_822623 ?auto_822626 ) ) ( not ( = ?auto_822623 ?auto_822627 ) ) ( not ( = ?auto_822623 ?auto_822628 ) ) ( not ( = ?auto_822623 ?auto_822629 ) ) ( not ( = ?auto_822624 ?auto_822625 ) ) ( not ( = ?auto_822624 ?auto_822626 ) ) ( not ( = ?auto_822624 ?auto_822627 ) ) ( not ( = ?auto_822624 ?auto_822628 ) ) ( not ( = ?auto_822624 ?auto_822629 ) ) ( not ( = ?auto_822625 ?auto_822626 ) ) ( not ( = ?auto_822625 ?auto_822627 ) ) ( not ( = ?auto_822625 ?auto_822628 ) ) ( not ( = ?auto_822625 ?auto_822629 ) ) ( not ( = ?auto_822626 ?auto_822627 ) ) ( not ( = ?auto_822626 ?auto_822628 ) ) ( not ( = ?auto_822626 ?auto_822629 ) ) ( not ( = ?auto_822627 ?auto_822628 ) ) ( not ( = ?auto_822627 ?auto_822629 ) ) ( not ( = ?auto_822628 ?auto_822629 ) ) ( ON ?auto_822627 ?auto_822628 ) ( ON ?auto_822626 ?auto_822627 ) ( ON ?auto_822625 ?auto_822626 ) ( ON ?auto_822624 ?auto_822625 ) ( CLEAR ?auto_822622 ) ( ON ?auto_822623 ?auto_822624 ) ( CLEAR ?auto_822623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_822615 ?auto_822616 ?auto_822617 ?auto_822618 ?auto_822619 ?auto_822620 ?auto_822621 ?auto_822622 ?auto_822623 )
      ( MAKE-14PILE ?auto_822615 ?auto_822616 ?auto_822617 ?auto_822618 ?auto_822619 ?auto_822620 ?auto_822621 ?auto_822622 ?auto_822623 ?auto_822624 ?auto_822625 ?auto_822626 ?auto_822627 ?auto_822628 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_822673 - BLOCK
      ?auto_822674 - BLOCK
      ?auto_822675 - BLOCK
      ?auto_822676 - BLOCK
      ?auto_822677 - BLOCK
      ?auto_822678 - BLOCK
      ?auto_822679 - BLOCK
      ?auto_822680 - BLOCK
      ?auto_822681 - BLOCK
      ?auto_822682 - BLOCK
      ?auto_822683 - BLOCK
      ?auto_822684 - BLOCK
      ?auto_822685 - BLOCK
      ?auto_822686 - BLOCK
    )
    :vars
    (
      ?auto_822687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822686 ?auto_822687 ) ( ON-TABLE ?auto_822673 ) ( ON ?auto_822674 ?auto_822673 ) ( ON ?auto_822675 ?auto_822674 ) ( ON ?auto_822676 ?auto_822675 ) ( ON ?auto_822677 ?auto_822676 ) ( ON ?auto_822678 ?auto_822677 ) ( ON ?auto_822679 ?auto_822678 ) ( not ( = ?auto_822673 ?auto_822674 ) ) ( not ( = ?auto_822673 ?auto_822675 ) ) ( not ( = ?auto_822673 ?auto_822676 ) ) ( not ( = ?auto_822673 ?auto_822677 ) ) ( not ( = ?auto_822673 ?auto_822678 ) ) ( not ( = ?auto_822673 ?auto_822679 ) ) ( not ( = ?auto_822673 ?auto_822680 ) ) ( not ( = ?auto_822673 ?auto_822681 ) ) ( not ( = ?auto_822673 ?auto_822682 ) ) ( not ( = ?auto_822673 ?auto_822683 ) ) ( not ( = ?auto_822673 ?auto_822684 ) ) ( not ( = ?auto_822673 ?auto_822685 ) ) ( not ( = ?auto_822673 ?auto_822686 ) ) ( not ( = ?auto_822673 ?auto_822687 ) ) ( not ( = ?auto_822674 ?auto_822675 ) ) ( not ( = ?auto_822674 ?auto_822676 ) ) ( not ( = ?auto_822674 ?auto_822677 ) ) ( not ( = ?auto_822674 ?auto_822678 ) ) ( not ( = ?auto_822674 ?auto_822679 ) ) ( not ( = ?auto_822674 ?auto_822680 ) ) ( not ( = ?auto_822674 ?auto_822681 ) ) ( not ( = ?auto_822674 ?auto_822682 ) ) ( not ( = ?auto_822674 ?auto_822683 ) ) ( not ( = ?auto_822674 ?auto_822684 ) ) ( not ( = ?auto_822674 ?auto_822685 ) ) ( not ( = ?auto_822674 ?auto_822686 ) ) ( not ( = ?auto_822674 ?auto_822687 ) ) ( not ( = ?auto_822675 ?auto_822676 ) ) ( not ( = ?auto_822675 ?auto_822677 ) ) ( not ( = ?auto_822675 ?auto_822678 ) ) ( not ( = ?auto_822675 ?auto_822679 ) ) ( not ( = ?auto_822675 ?auto_822680 ) ) ( not ( = ?auto_822675 ?auto_822681 ) ) ( not ( = ?auto_822675 ?auto_822682 ) ) ( not ( = ?auto_822675 ?auto_822683 ) ) ( not ( = ?auto_822675 ?auto_822684 ) ) ( not ( = ?auto_822675 ?auto_822685 ) ) ( not ( = ?auto_822675 ?auto_822686 ) ) ( not ( = ?auto_822675 ?auto_822687 ) ) ( not ( = ?auto_822676 ?auto_822677 ) ) ( not ( = ?auto_822676 ?auto_822678 ) ) ( not ( = ?auto_822676 ?auto_822679 ) ) ( not ( = ?auto_822676 ?auto_822680 ) ) ( not ( = ?auto_822676 ?auto_822681 ) ) ( not ( = ?auto_822676 ?auto_822682 ) ) ( not ( = ?auto_822676 ?auto_822683 ) ) ( not ( = ?auto_822676 ?auto_822684 ) ) ( not ( = ?auto_822676 ?auto_822685 ) ) ( not ( = ?auto_822676 ?auto_822686 ) ) ( not ( = ?auto_822676 ?auto_822687 ) ) ( not ( = ?auto_822677 ?auto_822678 ) ) ( not ( = ?auto_822677 ?auto_822679 ) ) ( not ( = ?auto_822677 ?auto_822680 ) ) ( not ( = ?auto_822677 ?auto_822681 ) ) ( not ( = ?auto_822677 ?auto_822682 ) ) ( not ( = ?auto_822677 ?auto_822683 ) ) ( not ( = ?auto_822677 ?auto_822684 ) ) ( not ( = ?auto_822677 ?auto_822685 ) ) ( not ( = ?auto_822677 ?auto_822686 ) ) ( not ( = ?auto_822677 ?auto_822687 ) ) ( not ( = ?auto_822678 ?auto_822679 ) ) ( not ( = ?auto_822678 ?auto_822680 ) ) ( not ( = ?auto_822678 ?auto_822681 ) ) ( not ( = ?auto_822678 ?auto_822682 ) ) ( not ( = ?auto_822678 ?auto_822683 ) ) ( not ( = ?auto_822678 ?auto_822684 ) ) ( not ( = ?auto_822678 ?auto_822685 ) ) ( not ( = ?auto_822678 ?auto_822686 ) ) ( not ( = ?auto_822678 ?auto_822687 ) ) ( not ( = ?auto_822679 ?auto_822680 ) ) ( not ( = ?auto_822679 ?auto_822681 ) ) ( not ( = ?auto_822679 ?auto_822682 ) ) ( not ( = ?auto_822679 ?auto_822683 ) ) ( not ( = ?auto_822679 ?auto_822684 ) ) ( not ( = ?auto_822679 ?auto_822685 ) ) ( not ( = ?auto_822679 ?auto_822686 ) ) ( not ( = ?auto_822679 ?auto_822687 ) ) ( not ( = ?auto_822680 ?auto_822681 ) ) ( not ( = ?auto_822680 ?auto_822682 ) ) ( not ( = ?auto_822680 ?auto_822683 ) ) ( not ( = ?auto_822680 ?auto_822684 ) ) ( not ( = ?auto_822680 ?auto_822685 ) ) ( not ( = ?auto_822680 ?auto_822686 ) ) ( not ( = ?auto_822680 ?auto_822687 ) ) ( not ( = ?auto_822681 ?auto_822682 ) ) ( not ( = ?auto_822681 ?auto_822683 ) ) ( not ( = ?auto_822681 ?auto_822684 ) ) ( not ( = ?auto_822681 ?auto_822685 ) ) ( not ( = ?auto_822681 ?auto_822686 ) ) ( not ( = ?auto_822681 ?auto_822687 ) ) ( not ( = ?auto_822682 ?auto_822683 ) ) ( not ( = ?auto_822682 ?auto_822684 ) ) ( not ( = ?auto_822682 ?auto_822685 ) ) ( not ( = ?auto_822682 ?auto_822686 ) ) ( not ( = ?auto_822682 ?auto_822687 ) ) ( not ( = ?auto_822683 ?auto_822684 ) ) ( not ( = ?auto_822683 ?auto_822685 ) ) ( not ( = ?auto_822683 ?auto_822686 ) ) ( not ( = ?auto_822683 ?auto_822687 ) ) ( not ( = ?auto_822684 ?auto_822685 ) ) ( not ( = ?auto_822684 ?auto_822686 ) ) ( not ( = ?auto_822684 ?auto_822687 ) ) ( not ( = ?auto_822685 ?auto_822686 ) ) ( not ( = ?auto_822685 ?auto_822687 ) ) ( not ( = ?auto_822686 ?auto_822687 ) ) ( ON ?auto_822685 ?auto_822686 ) ( ON ?auto_822684 ?auto_822685 ) ( ON ?auto_822683 ?auto_822684 ) ( ON ?auto_822682 ?auto_822683 ) ( ON ?auto_822681 ?auto_822682 ) ( CLEAR ?auto_822679 ) ( ON ?auto_822680 ?auto_822681 ) ( CLEAR ?auto_822680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_822673 ?auto_822674 ?auto_822675 ?auto_822676 ?auto_822677 ?auto_822678 ?auto_822679 ?auto_822680 )
      ( MAKE-14PILE ?auto_822673 ?auto_822674 ?auto_822675 ?auto_822676 ?auto_822677 ?auto_822678 ?auto_822679 ?auto_822680 ?auto_822681 ?auto_822682 ?auto_822683 ?auto_822684 ?auto_822685 ?auto_822686 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_822731 - BLOCK
      ?auto_822732 - BLOCK
      ?auto_822733 - BLOCK
      ?auto_822734 - BLOCK
      ?auto_822735 - BLOCK
      ?auto_822736 - BLOCK
      ?auto_822737 - BLOCK
      ?auto_822738 - BLOCK
      ?auto_822739 - BLOCK
      ?auto_822740 - BLOCK
      ?auto_822741 - BLOCK
      ?auto_822742 - BLOCK
      ?auto_822743 - BLOCK
      ?auto_822744 - BLOCK
    )
    :vars
    (
      ?auto_822745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822744 ?auto_822745 ) ( ON-TABLE ?auto_822731 ) ( ON ?auto_822732 ?auto_822731 ) ( ON ?auto_822733 ?auto_822732 ) ( ON ?auto_822734 ?auto_822733 ) ( ON ?auto_822735 ?auto_822734 ) ( ON ?auto_822736 ?auto_822735 ) ( not ( = ?auto_822731 ?auto_822732 ) ) ( not ( = ?auto_822731 ?auto_822733 ) ) ( not ( = ?auto_822731 ?auto_822734 ) ) ( not ( = ?auto_822731 ?auto_822735 ) ) ( not ( = ?auto_822731 ?auto_822736 ) ) ( not ( = ?auto_822731 ?auto_822737 ) ) ( not ( = ?auto_822731 ?auto_822738 ) ) ( not ( = ?auto_822731 ?auto_822739 ) ) ( not ( = ?auto_822731 ?auto_822740 ) ) ( not ( = ?auto_822731 ?auto_822741 ) ) ( not ( = ?auto_822731 ?auto_822742 ) ) ( not ( = ?auto_822731 ?auto_822743 ) ) ( not ( = ?auto_822731 ?auto_822744 ) ) ( not ( = ?auto_822731 ?auto_822745 ) ) ( not ( = ?auto_822732 ?auto_822733 ) ) ( not ( = ?auto_822732 ?auto_822734 ) ) ( not ( = ?auto_822732 ?auto_822735 ) ) ( not ( = ?auto_822732 ?auto_822736 ) ) ( not ( = ?auto_822732 ?auto_822737 ) ) ( not ( = ?auto_822732 ?auto_822738 ) ) ( not ( = ?auto_822732 ?auto_822739 ) ) ( not ( = ?auto_822732 ?auto_822740 ) ) ( not ( = ?auto_822732 ?auto_822741 ) ) ( not ( = ?auto_822732 ?auto_822742 ) ) ( not ( = ?auto_822732 ?auto_822743 ) ) ( not ( = ?auto_822732 ?auto_822744 ) ) ( not ( = ?auto_822732 ?auto_822745 ) ) ( not ( = ?auto_822733 ?auto_822734 ) ) ( not ( = ?auto_822733 ?auto_822735 ) ) ( not ( = ?auto_822733 ?auto_822736 ) ) ( not ( = ?auto_822733 ?auto_822737 ) ) ( not ( = ?auto_822733 ?auto_822738 ) ) ( not ( = ?auto_822733 ?auto_822739 ) ) ( not ( = ?auto_822733 ?auto_822740 ) ) ( not ( = ?auto_822733 ?auto_822741 ) ) ( not ( = ?auto_822733 ?auto_822742 ) ) ( not ( = ?auto_822733 ?auto_822743 ) ) ( not ( = ?auto_822733 ?auto_822744 ) ) ( not ( = ?auto_822733 ?auto_822745 ) ) ( not ( = ?auto_822734 ?auto_822735 ) ) ( not ( = ?auto_822734 ?auto_822736 ) ) ( not ( = ?auto_822734 ?auto_822737 ) ) ( not ( = ?auto_822734 ?auto_822738 ) ) ( not ( = ?auto_822734 ?auto_822739 ) ) ( not ( = ?auto_822734 ?auto_822740 ) ) ( not ( = ?auto_822734 ?auto_822741 ) ) ( not ( = ?auto_822734 ?auto_822742 ) ) ( not ( = ?auto_822734 ?auto_822743 ) ) ( not ( = ?auto_822734 ?auto_822744 ) ) ( not ( = ?auto_822734 ?auto_822745 ) ) ( not ( = ?auto_822735 ?auto_822736 ) ) ( not ( = ?auto_822735 ?auto_822737 ) ) ( not ( = ?auto_822735 ?auto_822738 ) ) ( not ( = ?auto_822735 ?auto_822739 ) ) ( not ( = ?auto_822735 ?auto_822740 ) ) ( not ( = ?auto_822735 ?auto_822741 ) ) ( not ( = ?auto_822735 ?auto_822742 ) ) ( not ( = ?auto_822735 ?auto_822743 ) ) ( not ( = ?auto_822735 ?auto_822744 ) ) ( not ( = ?auto_822735 ?auto_822745 ) ) ( not ( = ?auto_822736 ?auto_822737 ) ) ( not ( = ?auto_822736 ?auto_822738 ) ) ( not ( = ?auto_822736 ?auto_822739 ) ) ( not ( = ?auto_822736 ?auto_822740 ) ) ( not ( = ?auto_822736 ?auto_822741 ) ) ( not ( = ?auto_822736 ?auto_822742 ) ) ( not ( = ?auto_822736 ?auto_822743 ) ) ( not ( = ?auto_822736 ?auto_822744 ) ) ( not ( = ?auto_822736 ?auto_822745 ) ) ( not ( = ?auto_822737 ?auto_822738 ) ) ( not ( = ?auto_822737 ?auto_822739 ) ) ( not ( = ?auto_822737 ?auto_822740 ) ) ( not ( = ?auto_822737 ?auto_822741 ) ) ( not ( = ?auto_822737 ?auto_822742 ) ) ( not ( = ?auto_822737 ?auto_822743 ) ) ( not ( = ?auto_822737 ?auto_822744 ) ) ( not ( = ?auto_822737 ?auto_822745 ) ) ( not ( = ?auto_822738 ?auto_822739 ) ) ( not ( = ?auto_822738 ?auto_822740 ) ) ( not ( = ?auto_822738 ?auto_822741 ) ) ( not ( = ?auto_822738 ?auto_822742 ) ) ( not ( = ?auto_822738 ?auto_822743 ) ) ( not ( = ?auto_822738 ?auto_822744 ) ) ( not ( = ?auto_822738 ?auto_822745 ) ) ( not ( = ?auto_822739 ?auto_822740 ) ) ( not ( = ?auto_822739 ?auto_822741 ) ) ( not ( = ?auto_822739 ?auto_822742 ) ) ( not ( = ?auto_822739 ?auto_822743 ) ) ( not ( = ?auto_822739 ?auto_822744 ) ) ( not ( = ?auto_822739 ?auto_822745 ) ) ( not ( = ?auto_822740 ?auto_822741 ) ) ( not ( = ?auto_822740 ?auto_822742 ) ) ( not ( = ?auto_822740 ?auto_822743 ) ) ( not ( = ?auto_822740 ?auto_822744 ) ) ( not ( = ?auto_822740 ?auto_822745 ) ) ( not ( = ?auto_822741 ?auto_822742 ) ) ( not ( = ?auto_822741 ?auto_822743 ) ) ( not ( = ?auto_822741 ?auto_822744 ) ) ( not ( = ?auto_822741 ?auto_822745 ) ) ( not ( = ?auto_822742 ?auto_822743 ) ) ( not ( = ?auto_822742 ?auto_822744 ) ) ( not ( = ?auto_822742 ?auto_822745 ) ) ( not ( = ?auto_822743 ?auto_822744 ) ) ( not ( = ?auto_822743 ?auto_822745 ) ) ( not ( = ?auto_822744 ?auto_822745 ) ) ( ON ?auto_822743 ?auto_822744 ) ( ON ?auto_822742 ?auto_822743 ) ( ON ?auto_822741 ?auto_822742 ) ( ON ?auto_822740 ?auto_822741 ) ( ON ?auto_822739 ?auto_822740 ) ( ON ?auto_822738 ?auto_822739 ) ( CLEAR ?auto_822736 ) ( ON ?auto_822737 ?auto_822738 ) ( CLEAR ?auto_822737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_822731 ?auto_822732 ?auto_822733 ?auto_822734 ?auto_822735 ?auto_822736 ?auto_822737 )
      ( MAKE-14PILE ?auto_822731 ?auto_822732 ?auto_822733 ?auto_822734 ?auto_822735 ?auto_822736 ?auto_822737 ?auto_822738 ?auto_822739 ?auto_822740 ?auto_822741 ?auto_822742 ?auto_822743 ?auto_822744 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_822789 - BLOCK
      ?auto_822790 - BLOCK
      ?auto_822791 - BLOCK
      ?auto_822792 - BLOCK
      ?auto_822793 - BLOCK
      ?auto_822794 - BLOCK
      ?auto_822795 - BLOCK
      ?auto_822796 - BLOCK
      ?auto_822797 - BLOCK
      ?auto_822798 - BLOCK
      ?auto_822799 - BLOCK
      ?auto_822800 - BLOCK
      ?auto_822801 - BLOCK
      ?auto_822802 - BLOCK
    )
    :vars
    (
      ?auto_822803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822802 ?auto_822803 ) ( ON-TABLE ?auto_822789 ) ( ON ?auto_822790 ?auto_822789 ) ( ON ?auto_822791 ?auto_822790 ) ( ON ?auto_822792 ?auto_822791 ) ( ON ?auto_822793 ?auto_822792 ) ( not ( = ?auto_822789 ?auto_822790 ) ) ( not ( = ?auto_822789 ?auto_822791 ) ) ( not ( = ?auto_822789 ?auto_822792 ) ) ( not ( = ?auto_822789 ?auto_822793 ) ) ( not ( = ?auto_822789 ?auto_822794 ) ) ( not ( = ?auto_822789 ?auto_822795 ) ) ( not ( = ?auto_822789 ?auto_822796 ) ) ( not ( = ?auto_822789 ?auto_822797 ) ) ( not ( = ?auto_822789 ?auto_822798 ) ) ( not ( = ?auto_822789 ?auto_822799 ) ) ( not ( = ?auto_822789 ?auto_822800 ) ) ( not ( = ?auto_822789 ?auto_822801 ) ) ( not ( = ?auto_822789 ?auto_822802 ) ) ( not ( = ?auto_822789 ?auto_822803 ) ) ( not ( = ?auto_822790 ?auto_822791 ) ) ( not ( = ?auto_822790 ?auto_822792 ) ) ( not ( = ?auto_822790 ?auto_822793 ) ) ( not ( = ?auto_822790 ?auto_822794 ) ) ( not ( = ?auto_822790 ?auto_822795 ) ) ( not ( = ?auto_822790 ?auto_822796 ) ) ( not ( = ?auto_822790 ?auto_822797 ) ) ( not ( = ?auto_822790 ?auto_822798 ) ) ( not ( = ?auto_822790 ?auto_822799 ) ) ( not ( = ?auto_822790 ?auto_822800 ) ) ( not ( = ?auto_822790 ?auto_822801 ) ) ( not ( = ?auto_822790 ?auto_822802 ) ) ( not ( = ?auto_822790 ?auto_822803 ) ) ( not ( = ?auto_822791 ?auto_822792 ) ) ( not ( = ?auto_822791 ?auto_822793 ) ) ( not ( = ?auto_822791 ?auto_822794 ) ) ( not ( = ?auto_822791 ?auto_822795 ) ) ( not ( = ?auto_822791 ?auto_822796 ) ) ( not ( = ?auto_822791 ?auto_822797 ) ) ( not ( = ?auto_822791 ?auto_822798 ) ) ( not ( = ?auto_822791 ?auto_822799 ) ) ( not ( = ?auto_822791 ?auto_822800 ) ) ( not ( = ?auto_822791 ?auto_822801 ) ) ( not ( = ?auto_822791 ?auto_822802 ) ) ( not ( = ?auto_822791 ?auto_822803 ) ) ( not ( = ?auto_822792 ?auto_822793 ) ) ( not ( = ?auto_822792 ?auto_822794 ) ) ( not ( = ?auto_822792 ?auto_822795 ) ) ( not ( = ?auto_822792 ?auto_822796 ) ) ( not ( = ?auto_822792 ?auto_822797 ) ) ( not ( = ?auto_822792 ?auto_822798 ) ) ( not ( = ?auto_822792 ?auto_822799 ) ) ( not ( = ?auto_822792 ?auto_822800 ) ) ( not ( = ?auto_822792 ?auto_822801 ) ) ( not ( = ?auto_822792 ?auto_822802 ) ) ( not ( = ?auto_822792 ?auto_822803 ) ) ( not ( = ?auto_822793 ?auto_822794 ) ) ( not ( = ?auto_822793 ?auto_822795 ) ) ( not ( = ?auto_822793 ?auto_822796 ) ) ( not ( = ?auto_822793 ?auto_822797 ) ) ( not ( = ?auto_822793 ?auto_822798 ) ) ( not ( = ?auto_822793 ?auto_822799 ) ) ( not ( = ?auto_822793 ?auto_822800 ) ) ( not ( = ?auto_822793 ?auto_822801 ) ) ( not ( = ?auto_822793 ?auto_822802 ) ) ( not ( = ?auto_822793 ?auto_822803 ) ) ( not ( = ?auto_822794 ?auto_822795 ) ) ( not ( = ?auto_822794 ?auto_822796 ) ) ( not ( = ?auto_822794 ?auto_822797 ) ) ( not ( = ?auto_822794 ?auto_822798 ) ) ( not ( = ?auto_822794 ?auto_822799 ) ) ( not ( = ?auto_822794 ?auto_822800 ) ) ( not ( = ?auto_822794 ?auto_822801 ) ) ( not ( = ?auto_822794 ?auto_822802 ) ) ( not ( = ?auto_822794 ?auto_822803 ) ) ( not ( = ?auto_822795 ?auto_822796 ) ) ( not ( = ?auto_822795 ?auto_822797 ) ) ( not ( = ?auto_822795 ?auto_822798 ) ) ( not ( = ?auto_822795 ?auto_822799 ) ) ( not ( = ?auto_822795 ?auto_822800 ) ) ( not ( = ?auto_822795 ?auto_822801 ) ) ( not ( = ?auto_822795 ?auto_822802 ) ) ( not ( = ?auto_822795 ?auto_822803 ) ) ( not ( = ?auto_822796 ?auto_822797 ) ) ( not ( = ?auto_822796 ?auto_822798 ) ) ( not ( = ?auto_822796 ?auto_822799 ) ) ( not ( = ?auto_822796 ?auto_822800 ) ) ( not ( = ?auto_822796 ?auto_822801 ) ) ( not ( = ?auto_822796 ?auto_822802 ) ) ( not ( = ?auto_822796 ?auto_822803 ) ) ( not ( = ?auto_822797 ?auto_822798 ) ) ( not ( = ?auto_822797 ?auto_822799 ) ) ( not ( = ?auto_822797 ?auto_822800 ) ) ( not ( = ?auto_822797 ?auto_822801 ) ) ( not ( = ?auto_822797 ?auto_822802 ) ) ( not ( = ?auto_822797 ?auto_822803 ) ) ( not ( = ?auto_822798 ?auto_822799 ) ) ( not ( = ?auto_822798 ?auto_822800 ) ) ( not ( = ?auto_822798 ?auto_822801 ) ) ( not ( = ?auto_822798 ?auto_822802 ) ) ( not ( = ?auto_822798 ?auto_822803 ) ) ( not ( = ?auto_822799 ?auto_822800 ) ) ( not ( = ?auto_822799 ?auto_822801 ) ) ( not ( = ?auto_822799 ?auto_822802 ) ) ( not ( = ?auto_822799 ?auto_822803 ) ) ( not ( = ?auto_822800 ?auto_822801 ) ) ( not ( = ?auto_822800 ?auto_822802 ) ) ( not ( = ?auto_822800 ?auto_822803 ) ) ( not ( = ?auto_822801 ?auto_822802 ) ) ( not ( = ?auto_822801 ?auto_822803 ) ) ( not ( = ?auto_822802 ?auto_822803 ) ) ( ON ?auto_822801 ?auto_822802 ) ( ON ?auto_822800 ?auto_822801 ) ( ON ?auto_822799 ?auto_822800 ) ( ON ?auto_822798 ?auto_822799 ) ( ON ?auto_822797 ?auto_822798 ) ( ON ?auto_822796 ?auto_822797 ) ( ON ?auto_822795 ?auto_822796 ) ( CLEAR ?auto_822793 ) ( ON ?auto_822794 ?auto_822795 ) ( CLEAR ?auto_822794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_822789 ?auto_822790 ?auto_822791 ?auto_822792 ?auto_822793 ?auto_822794 )
      ( MAKE-14PILE ?auto_822789 ?auto_822790 ?auto_822791 ?auto_822792 ?auto_822793 ?auto_822794 ?auto_822795 ?auto_822796 ?auto_822797 ?auto_822798 ?auto_822799 ?auto_822800 ?auto_822801 ?auto_822802 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_822847 - BLOCK
      ?auto_822848 - BLOCK
      ?auto_822849 - BLOCK
      ?auto_822850 - BLOCK
      ?auto_822851 - BLOCK
      ?auto_822852 - BLOCK
      ?auto_822853 - BLOCK
      ?auto_822854 - BLOCK
      ?auto_822855 - BLOCK
      ?auto_822856 - BLOCK
      ?auto_822857 - BLOCK
      ?auto_822858 - BLOCK
      ?auto_822859 - BLOCK
      ?auto_822860 - BLOCK
    )
    :vars
    (
      ?auto_822861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822860 ?auto_822861 ) ( ON-TABLE ?auto_822847 ) ( ON ?auto_822848 ?auto_822847 ) ( ON ?auto_822849 ?auto_822848 ) ( ON ?auto_822850 ?auto_822849 ) ( not ( = ?auto_822847 ?auto_822848 ) ) ( not ( = ?auto_822847 ?auto_822849 ) ) ( not ( = ?auto_822847 ?auto_822850 ) ) ( not ( = ?auto_822847 ?auto_822851 ) ) ( not ( = ?auto_822847 ?auto_822852 ) ) ( not ( = ?auto_822847 ?auto_822853 ) ) ( not ( = ?auto_822847 ?auto_822854 ) ) ( not ( = ?auto_822847 ?auto_822855 ) ) ( not ( = ?auto_822847 ?auto_822856 ) ) ( not ( = ?auto_822847 ?auto_822857 ) ) ( not ( = ?auto_822847 ?auto_822858 ) ) ( not ( = ?auto_822847 ?auto_822859 ) ) ( not ( = ?auto_822847 ?auto_822860 ) ) ( not ( = ?auto_822847 ?auto_822861 ) ) ( not ( = ?auto_822848 ?auto_822849 ) ) ( not ( = ?auto_822848 ?auto_822850 ) ) ( not ( = ?auto_822848 ?auto_822851 ) ) ( not ( = ?auto_822848 ?auto_822852 ) ) ( not ( = ?auto_822848 ?auto_822853 ) ) ( not ( = ?auto_822848 ?auto_822854 ) ) ( not ( = ?auto_822848 ?auto_822855 ) ) ( not ( = ?auto_822848 ?auto_822856 ) ) ( not ( = ?auto_822848 ?auto_822857 ) ) ( not ( = ?auto_822848 ?auto_822858 ) ) ( not ( = ?auto_822848 ?auto_822859 ) ) ( not ( = ?auto_822848 ?auto_822860 ) ) ( not ( = ?auto_822848 ?auto_822861 ) ) ( not ( = ?auto_822849 ?auto_822850 ) ) ( not ( = ?auto_822849 ?auto_822851 ) ) ( not ( = ?auto_822849 ?auto_822852 ) ) ( not ( = ?auto_822849 ?auto_822853 ) ) ( not ( = ?auto_822849 ?auto_822854 ) ) ( not ( = ?auto_822849 ?auto_822855 ) ) ( not ( = ?auto_822849 ?auto_822856 ) ) ( not ( = ?auto_822849 ?auto_822857 ) ) ( not ( = ?auto_822849 ?auto_822858 ) ) ( not ( = ?auto_822849 ?auto_822859 ) ) ( not ( = ?auto_822849 ?auto_822860 ) ) ( not ( = ?auto_822849 ?auto_822861 ) ) ( not ( = ?auto_822850 ?auto_822851 ) ) ( not ( = ?auto_822850 ?auto_822852 ) ) ( not ( = ?auto_822850 ?auto_822853 ) ) ( not ( = ?auto_822850 ?auto_822854 ) ) ( not ( = ?auto_822850 ?auto_822855 ) ) ( not ( = ?auto_822850 ?auto_822856 ) ) ( not ( = ?auto_822850 ?auto_822857 ) ) ( not ( = ?auto_822850 ?auto_822858 ) ) ( not ( = ?auto_822850 ?auto_822859 ) ) ( not ( = ?auto_822850 ?auto_822860 ) ) ( not ( = ?auto_822850 ?auto_822861 ) ) ( not ( = ?auto_822851 ?auto_822852 ) ) ( not ( = ?auto_822851 ?auto_822853 ) ) ( not ( = ?auto_822851 ?auto_822854 ) ) ( not ( = ?auto_822851 ?auto_822855 ) ) ( not ( = ?auto_822851 ?auto_822856 ) ) ( not ( = ?auto_822851 ?auto_822857 ) ) ( not ( = ?auto_822851 ?auto_822858 ) ) ( not ( = ?auto_822851 ?auto_822859 ) ) ( not ( = ?auto_822851 ?auto_822860 ) ) ( not ( = ?auto_822851 ?auto_822861 ) ) ( not ( = ?auto_822852 ?auto_822853 ) ) ( not ( = ?auto_822852 ?auto_822854 ) ) ( not ( = ?auto_822852 ?auto_822855 ) ) ( not ( = ?auto_822852 ?auto_822856 ) ) ( not ( = ?auto_822852 ?auto_822857 ) ) ( not ( = ?auto_822852 ?auto_822858 ) ) ( not ( = ?auto_822852 ?auto_822859 ) ) ( not ( = ?auto_822852 ?auto_822860 ) ) ( not ( = ?auto_822852 ?auto_822861 ) ) ( not ( = ?auto_822853 ?auto_822854 ) ) ( not ( = ?auto_822853 ?auto_822855 ) ) ( not ( = ?auto_822853 ?auto_822856 ) ) ( not ( = ?auto_822853 ?auto_822857 ) ) ( not ( = ?auto_822853 ?auto_822858 ) ) ( not ( = ?auto_822853 ?auto_822859 ) ) ( not ( = ?auto_822853 ?auto_822860 ) ) ( not ( = ?auto_822853 ?auto_822861 ) ) ( not ( = ?auto_822854 ?auto_822855 ) ) ( not ( = ?auto_822854 ?auto_822856 ) ) ( not ( = ?auto_822854 ?auto_822857 ) ) ( not ( = ?auto_822854 ?auto_822858 ) ) ( not ( = ?auto_822854 ?auto_822859 ) ) ( not ( = ?auto_822854 ?auto_822860 ) ) ( not ( = ?auto_822854 ?auto_822861 ) ) ( not ( = ?auto_822855 ?auto_822856 ) ) ( not ( = ?auto_822855 ?auto_822857 ) ) ( not ( = ?auto_822855 ?auto_822858 ) ) ( not ( = ?auto_822855 ?auto_822859 ) ) ( not ( = ?auto_822855 ?auto_822860 ) ) ( not ( = ?auto_822855 ?auto_822861 ) ) ( not ( = ?auto_822856 ?auto_822857 ) ) ( not ( = ?auto_822856 ?auto_822858 ) ) ( not ( = ?auto_822856 ?auto_822859 ) ) ( not ( = ?auto_822856 ?auto_822860 ) ) ( not ( = ?auto_822856 ?auto_822861 ) ) ( not ( = ?auto_822857 ?auto_822858 ) ) ( not ( = ?auto_822857 ?auto_822859 ) ) ( not ( = ?auto_822857 ?auto_822860 ) ) ( not ( = ?auto_822857 ?auto_822861 ) ) ( not ( = ?auto_822858 ?auto_822859 ) ) ( not ( = ?auto_822858 ?auto_822860 ) ) ( not ( = ?auto_822858 ?auto_822861 ) ) ( not ( = ?auto_822859 ?auto_822860 ) ) ( not ( = ?auto_822859 ?auto_822861 ) ) ( not ( = ?auto_822860 ?auto_822861 ) ) ( ON ?auto_822859 ?auto_822860 ) ( ON ?auto_822858 ?auto_822859 ) ( ON ?auto_822857 ?auto_822858 ) ( ON ?auto_822856 ?auto_822857 ) ( ON ?auto_822855 ?auto_822856 ) ( ON ?auto_822854 ?auto_822855 ) ( ON ?auto_822853 ?auto_822854 ) ( ON ?auto_822852 ?auto_822853 ) ( CLEAR ?auto_822850 ) ( ON ?auto_822851 ?auto_822852 ) ( CLEAR ?auto_822851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_822847 ?auto_822848 ?auto_822849 ?auto_822850 ?auto_822851 )
      ( MAKE-14PILE ?auto_822847 ?auto_822848 ?auto_822849 ?auto_822850 ?auto_822851 ?auto_822852 ?auto_822853 ?auto_822854 ?auto_822855 ?auto_822856 ?auto_822857 ?auto_822858 ?auto_822859 ?auto_822860 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_822905 - BLOCK
      ?auto_822906 - BLOCK
      ?auto_822907 - BLOCK
      ?auto_822908 - BLOCK
      ?auto_822909 - BLOCK
      ?auto_822910 - BLOCK
      ?auto_822911 - BLOCK
      ?auto_822912 - BLOCK
      ?auto_822913 - BLOCK
      ?auto_822914 - BLOCK
      ?auto_822915 - BLOCK
      ?auto_822916 - BLOCK
      ?auto_822917 - BLOCK
      ?auto_822918 - BLOCK
    )
    :vars
    (
      ?auto_822919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822918 ?auto_822919 ) ( ON-TABLE ?auto_822905 ) ( ON ?auto_822906 ?auto_822905 ) ( ON ?auto_822907 ?auto_822906 ) ( not ( = ?auto_822905 ?auto_822906 ) ) ( not ( = ?auto_822905 ?auto_822907 ) ) ( not ( = ?auto_822905 ?auto_822908 ) ) ( not ( = ?auto_822905 ?auto_822909 ) ) ( not ( = ?auto_822905 ?auto_822910 ) ) ( not ( = ?auto_822905 ?auto_822911 ) ) ( not ( = ?auto_822905 ?auto_822912 ) ) ( not ( = ?auto_822905 ?auto_822913 ) ) ( not ( = ?auto_822905 ?auto_822914 ) ) ( not ( = ?auto_822905 ?auto_822915 ) ) ( not ( = ?auto_822905 ?auto_822916 ) ) ( not ( = ?auto_822905 ?auto_822917 ) ) ( not ( = ?auto_822905 ?auto_822918 ) ) ( not ( = ?auto_822905 ?auto_822919 ) ) ( not ( = ?auto_822906 ?auto_822907 ) ) ( not ( = ?auto_822906 ?auto_822908 ) ) ( not ( = ?auto_822906 ?auto_822909 ) ) ( not ( = ?auto_822906 ?auto_822910 ) ) ( not ( = ?auto_822906 ?auto_822911 ) ) ( not ( = ?auto_822906 ?auto_822912 ) ) ( not ( = ?auto_822906 ?auto_822913 ) ) ( not ( = ?auto_822906 ?auto_822914 ) ) ( not ( = ?auto_822906 ?auto_822915 ) ) ( not ( = ?auto_822906 ?auto_822916 ) ) ( not ( = ?auto_822906 ?auto_822917 ) ) ( not ( = ?auto_822906 ?auto_822918 ) ) ( not ( = ?auto_822906 ?auto_822919 ) ) ( not ( = ?auto_822907 ?auto_822908 ) ) ( not ( = ?auto_822907 ?auto_822909 ) ) ( not ( = ?auto_822907 ?auto_822910 ) ) ( not ( = ?auto_822907 ?auto_822911 ) ) ( not ( = ?auto_822907 ?auto_822912 ) ) ( not ( = ?auto_822907 ?auto_822913 ) ) ( not ( = ?auto_822907 ?auto_822914 ) ) ( not ( = ?auto_822907 ?auto_822915 ) ) ( not ( = ?auto_822907 ?auto_822916 ) ) ( not ( = ?auto_822907 ?auto_822917 ) ) ( not ( = ?auto_822907 ?auto_822918 ) ) ( not ( = ?auto_822907 ?auto_822919 ) ) ( not ( = ?auto_822908 ?auto_822909 ) ) ( not ( = ?auto_822908 ?auto_822910 ) ) ( not ( = ?auto_822908 ?auto_822911 ) ) ( not ( = ?auto_822908 ?auto_822912 ) ) ( not ( = ?auto_822908 ?auto_822913 ) ) ( not ( = ?auto_822908 ?auto_822914 ) ) ( not ( = ?auto_822908 ?auto_822915 ) ) ( not ( = ?auto_822908 ?auto_822916 ) ) ( not ( = ?auto_822908 ?auto_822917 ) ) ( not ( = ?auto_822908 ?auto_822918 ) ) ( not ( = ?auto_822908 ?auto_822919 ) ) ( not ( = ?auto_822909 ?auto_822910 ) ) ( not ( = ?auto_822909 ?auto_822911 ) ) ( not ( = ?auto_822909 ?auto_822912 ) ) ( not ( = ?auto_822909 ?auto_822913 ) ) ( not ( = ?auto_822909 ?auto_822914 ) ) ( not ( = ?auto_822909 ?auto_822915 ) ) ( not ( = ?auto_822909 ?auto_822916 ) ) ( not ( = ?auto_822909 ?auto_822917 ) ) ( not ( = ?auto_822909 ?auto_822918 ) ) ( not ( = ?auto_822909 ?auto_822919 ) ) ( not ( = ?auto_822910 ?auto_822911 ) ) ( not ( = ?auto_822910 ?auto_822912 ) ) ( not ( = ?auto_822910 ?auto_822913 ) ) ( not ( = ?auto_822910 ?auto_822914 ) ) ( not ( = ?auto_822910 ?auto_822915 ) ) ( not ( = ?auto_822910 ?auto_822916 ) ) ( not ( = ?auto_822910 ?auto_822917 ) ) ( not ( = ?auto_822910 ?auto_822918 ) ) ( not ( = ?auto_822910 ?auto_822919 ) ) ( not ( = ?auto_822911 ?auto_822912 ) ) ( not ( = ?auto_822911 ?auto_822913 ) ) ( not ( = ?auto_822911 ?auto_822914 ) ) ( not ( = ?auto_822911 ?auto_822915 ) ) ( not ( = ?auto_822911 ?auto_822916 ) ) ( not ( = ?auto_822911 ?auto_822917 ) ) ( not ( = ?auto_822911 ?auto_822918 ) ) ( not ( = ?auto_822911 ?auto_822919 ) ) ( not ( = ?auto_822912 ?auto_822913 ) ) ( not ( = ?auto_822912 ?auto_822914 ) ) ( not ( = ?auto_822912 ?auto_822915 ) ) ( not ( = ?auto_822912 ?auto_822916 ) ) ( not ( = ?auto_822912 ?auto_822917 ) ) ( not ( = ?auto_822912 ?auto_822918 ) ) ( not ( = ?auto_822912 ?auto_822919 ) ) ( not ( = ?auto_822913 ?auto_822914 ) ) ( not ( = ?auto_822913 ?auto_822915 ) ) ( not ( = ?auto_822913 ?auto_822916 ) ) ( not ( = ?auto_822913 ?auto_822917 ) ) ( not ( = ?auto_822913 ?auto_822918 ) ) ( not ( = ?auto_822913 ?auto_822919 ) ) ( not ( = ?auto_822914 ?auto_822915 ) ) ( not ( = ?auto_822914 ?auto_822916 ) ) ( not ( = ?auto_822914 ?auto_822917 ) ) ( not ( = ?auto_822914 ?auto_822918 ) ) ( not ( = ?auto_822914 ?auto_822919 ) ) ( not ( = ?auto_822915 ?auto_822916 ) ) ( not ( = ?auto_822915 ?auto_822917 ) ) ( not ( = ?auto_822915 ?auto_822918 ) ) ( not ( = ?auto_822915 ?auto_822919 ) ) ( not ( = ?auto_822916 ?auto_822917 ) ) ( not ( = ?auto_822916 ?auto_822918 ) ) ( not ( = ?auto_822916 ?auto_822919 ) ) ( not ( = ?auto_822917 ?auto_822918 ) ) ( not ( = ?auto_822917 ?auto_822919 ) ) ( not ( = ?auto_822918 ?auto_822919 ) ) ( ON ?auto_822917 ?auto_822918 ) ( ON ?auto_822916 ?auto_822917 ) ( ON ?auto_822915 ?auto_822916 ) ( ON ?auto_822914 ?auto_822915 ) ( ON ?auto_822913 ?auto_822914 ) ( ON ?auto_822912 ?auto_822913 ) ( ON ?auto_822911 ?auto_822912 ) ( ON ?auto_822910 ?auto_822911 ) ( ON ?auto_822909 ?auto_822910 ) ( CLEAR ?auto_822907 ) ( ON ?auto_822908 ?auto_822909 ) ( CLEAR ?auto_822908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_822905 ?auto_822906 ?auto_822907 ?auto_822908 )
      ( MAKE-14PILE ?auto_822905 ?auto_822906 ?auto_822907 ?auto_822908 ?auto_822909 ?auto_822910 ?auto_822911 ?auto_822912 ?auto_822913 ?auto_822914 ?auto_822915 ?auto_822916 ?auto_822917 ?auto_822918 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_822963 - BLOCK
      ?auto_822964 - BLOCK
      ?auto_822965 - BLOCK
      ?auto_822966 - BLOCK
      ?auto_822967 - BLOCK
      ?auto_822968 - BLOCK
      ?auto_822969 - BLOCK
      ?auto_822970 - BLOCK
      ?auto_822971 - BLOCK
      ?auto_822972 - BLOCK
      ?auto_822973 - BLOCK
      ?auto_822974 - BLOCK
      ?auto_822975 - BLOCK
      ?auto_822976 - BLOCK
    )
    :vars
    (
      ?auto_822977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_822976 ?auto_822977 ) ( ON-TABLE ?auto_822963 ) ( ON ?auto_822964 ?auto_822963 ) ( not ( = ?auto_822963 ?auto_822964 ) ) ( not ( = ?auto_822963 ?auto_822965 ) ) ( not ( = ?auto_822963 ?auto_822966 ) ) ( not ( = ?auto_822963 ?auto_822967 ) ) ( not ( = ?auto_822963 ?auto_822968 ) ) ( not ( = ?auto_822963 ?auto_822969 ) ) ( not ( = ?auto_822963 ?auto_822970 ) ) ( not ( = ?auto_822963 ?auto_822971 ) ) ( not ( = ?auto_822963 ?auto_822972 ) ) ( not ( = ?auto_822963 ?auto_822973 ) ) ( not ( = ?auto_822963 ?auto_822974 ) ) ( not ( = ?auto_822963 ?auto_822975 ) ) ( not ( = ?auto_822963 ?auto_822976 ) ) ( not ( = ?auto_822963 ?auto_822977 ) ) ( not ( = ?auto_822964 ?auto_822965 ) ) ( not ( = ?auto_822964 ?auto_822966 ) ) ( not ( = ?auto_822964 ?auto_822967 ) ) ( not ( = ?auto_822964 ?auto_822968 ) ) ( not ( = ?auto_822964 ?auto_822969 ) ) ( not ( = ?auto_822964 ?auto_822970 ) ) ( not ( = ?auto_822964 ?auto_822971 ) ) ( not ( = ?auto_822964 ?auto_822972 ) ) ( not ( = ?auto_822964 ?auto_822973 ) ) ( not ( = ?auto_822964 ?auto_822974 ) ) ( not ( = ?auto_822964 ?auto_822975 ) ) ( not ( = ?auto_822964 ?auto_822976 ) ) ( not ( = ?auto_822964 ?auto_822977 ) ) ( not ( = ?auto_822965 ?auto_822966 ) ) ( not ( = ?auto_822965 ?auto_822967 ) ) ( not ( = ?auto_822965 ?auto_822968 ) ) ( not ( = ?auto_822965 ?auto_822969 ) ) ( not ( = ?auto_822965 ?auto_822970 ) ) ( not ( = ?auto_822965 ?auto_822971 ) ) ( not ( = ?auto_822965 ?auto_822972 ) ) ( not ( = ?auto_822965 ?auto_822973 ) ) ( not ( = ?auto_822965 ?auto_822974 ) ) ( not ( = ?auto_822965 ?auto_822975 ) ) ( not ( = ?auto_822965 ?auto_822976 ) ) ( not ( = ?auto_822965 ?auto_822977 ) ) ( not ( = ?auto_822966 ?auto_822967 ) ) ( not ( = ?auto_822966 ?auto_822968 ) ) ( not ( = ?auto_822966 ?auto_822969 ) ) ( not ( = ?auto_822966 ?auto_822970 ) ) ( not ( = ?auto_822966 ?auto_822971 ) ) ( not ( = ?auto_822966 ?auto_822972 ) ) ( not ( = ?auto_822966 ?auto_822973 ) ) ( not ( = ?auto_822966 ?auto_822974 ) ) ( not ( = ?auto_822966 ?auto_822975 ) ) ( not ( = ?auto_822966 ?auto_822976 ) ) ( not ( = ?auto_822966 ?auto_822977 ) ) ( not ( = ?auto_822967 ?auto_822968 ) ) ( not ( = ?auto_822967 ?auto_822969 ) ) ( not ( = ?auto_822967 ?auto_822970 ) ) ( not ( = ?auto_822967 ?auto_822971 ) ) ( not ( = ?auto_822967 ?auto_822972 ) ) ( not ( = ?auto_822967 ?auto_822973 ) ) ( not ( = ?auto_822967 ?auto_822974 ) ) ( not ( = ?auto_822967 ?auto_822975 ) ) ( not ( = ?auto_822967 ?auto_822976 ) ) ( not ( = ?auto_822967 ?auto_822977 ) ) ( not ( = ?auto_822968 ?auto_822969 ) ) ( not ( = ?auto_822968 ?auto_822970 ) ) ( not ( = ?auto_822968 ?auto_822971 ) ) ( not ( = ?auto_822968 ?auto_822972 ) ) ( not ( = ?auto_822968 ?auto_822973 ) ) ( not ( = ?auto_822968 ?auto_822974 ) ) ( not ( = ?auto_822968 ?auto_822975 ) ) ( not ( = ?auto_822968 ?auto_822976 ) ) ( not ( = ?auto_822968 ?auto_822977 ) ) ( not ( = ?auto_822969 ?auto_822970 ) ) ( not ( = ?auto_822969 ?auto_822971 ) ) ( not ( = ?auto_822969 ?auto_822972 ) ) ( not ( = ?auto_822969 ?auto_822973 ) ) ( not ( = ?auto_822969 ?auto_822974 ) ) ( not ( = ?auto_822969 ?auto_822975 ) ) ( not ( = ?auto_822969 ?auto_822976 ) ) ( not ( = ?auto_822969 ?auto_822977 ) ) ( not ( = ?auto_822970 ?auto_822971 ) ) ( not ( = ?auto_822970 ?auto_822972 ) ) ( not ( = ?auto_822970 ?auto_822973 ) ) ( not ( = ?auto_822970 ?auto_822974 ) ) ( not ( = ?auto_822970 ?auto_822975 ) ) ( not ( = ?auto_822970 ?auto_822976 ) ) ( not ( = ?auto_822970 ?auto_822977 ) ) ( not ( = ?auto_822971 ?auto_822972 ) ) ( not ( = ?auto_822971 ?auto_822973 ) ) ( not ( = ?auto_822971 ?auto_822974 ) ) ( not ( = ?auto_822971 ?auto_822975 ) ) ( not ( = ?auto_822971 ?auto_822976 ) ) ( not ( = ?auto_822971 ?auto_822977 ) ) ( not ( = ?auto_822972 ?auto_822973 ) ) ( not ( = ?auto_822972 ?auto_822974 ) ) ( not ( = ?auto_822972 ?auto_822975 ) ) ( not ( = ?auto_822972 ?auto_822976 ) ) ( not ( = ?auto_822972 ?auto_822977 ) ) ( not ( = ?auto_822973 ?auto_822974 ) ) ( not ( = ?auto_822973 ?auto_822975 ) ) ( not ( = ?auto_822973 ?auto_822976 ) ) ( not ( = ?auto_822973 ?auto_822977 ) ) ( not ( = ?auto_822974 ?auto_822975 ) ) ( not ( = ?auto_822974 ?auto_822976 ) ) ( not ( = ?auto_822974 ?auto_822977 ) ) ( not ( = ?auto_822975 ?auto_822976 ) ) ( not ( = ?auto_822975 ?auto_822977 ) ) ( not ( = ?auto_822976 ?auto_822977 ) ) ( ON ?auto_822975 ?auto_822976 ) ( ON ?auto_822974 ?auto_822975 ) ( ON ?auto_822973 ?auto_822974 ) ( ON ?auto_822972 ?auto_822973 ) ( ON ?auto_822971 ?auto_822972 ) ( ON ?auto_822970 ?auto_822971 ) ( ON ?auto_822969 ?auto_822970 ) ( ON ?auto_822968 ?auto_822969 ) ( ON ?auto_822967 ?auto_822968 ) ( ON ?auto_822966 ?auto_822967 ) ( CLEAR ?auto_822964 ) ( ON ?auto_822965 ?auto_822966 ) ( CLEAR ?auto_822965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_822963 ?auto_822964 ?auto_822965 )
      ( MAKE-14PILE ?auto_822963 ?auto_822964 ?auto_822965 ?auto_822966 ?auto_822967 ?auto_822968 ?auto_822969 ?auto_822970 ?auto_822971 ?auto_822972 ?auto_822973 ?auto_822974 ?auto_822975 ?auto_822976 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_823021 - BLOCK
      ?auto_823022 - BLOCK
      ?auto_823023 - BLOCK
      ?auto_823024 - BLOCK
      ?auto_823025 - BLOCK
      ?auto_823026 - BLOCK
      ?auto_823027 - BLOCK
      ?auto_823028 - BLOCK
      ?auto_823029 - BLOCK
      ?auto_823030 - BLOCK
      ?auto_823031 - BLOCK
      ?auto_823032 - BLOCK
      ?auto_823033 - BLOCK
      ?auto_823034 - BLOCK
    )
    :vars
    (
      ?auto_823035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823034 ?auto_823035 ) ( ON-TABLE ?auto_823021 ) ( not ( = ?auto_823021 ?auto_823022 ) ) ( not ( = ?auto_823021 ?auto_823023 ) ) ( not ( = ?auto_823021 ?auto_823024 ) ) ( not ( = ?auto_823021 ?auto_823025 ) ) ( not ( = ?auto_823021 ?auto_823026 ) ) ( not ( = ?auto_823021 ?auto_823027 ) ) ( not ( = ?auto_823021 ?auto_823028 ) ) ( not ( = ?auto_823021 ?auto_823029 ) ) ( not ( = ?auto_823021 ?auto_823030 ) ) ( not ( = ?auto_823021 ?auto_823031 ) ) ( not ( = ?auto_823021 ?auto_823032 ) ) ( not ( = ?auto_823021 ?auto_823033 ) ) ( not ( = ?auto_823021 ?auto_823034 ) ) ( not ( = ?auto_823021 ?auto_823035 ) ) ( not ( = ?auto_823022 ?auto_823023 ) ) ( not ( = ?auto_823022 ?auto_823024 ) ) ( not ( = ?auto_823022 ?auto_823025 ) ) ( not ( = ?auto_823022 ?auto_823026 ) ) ( not ( = ?auto_823022 ?auto_823027 ) ) ( not ( = ?auto_823022 ?auto_823028 ) ) ( not ( = ?auto_823022 ?auto_823029 ) ) ( not ( = ?auto_823022 ?auto_823030 ) ) ( not ( = ?auto_823022 ?auto_823031 ) ) ( not ( = ?auto_823022 ?auto_823032 ) ) ( not ( = ?auto_823022 ?auto_823033 ) ) ( not ( = ?auto_823022 ?auto_823034 ) ) ( not ( = ?auto_823022 ?auto_823035 ) ) ( not ( = ?auto_823023 ?auto_823024 ) ) ( not ( = ?auto_823023 ?auto_823025 ) ) ( not ( = ?auto_823023 ?auto_823026 ) ) ( not ( = ?auto_823023 ?auto_823027 ) ) ( not ( = ?auto_823023 ?auto_823028 ) ) ( not ( = ?auto_823023 ?auto_823029 ) ) ( not ( = ?auto_823023 ?auto_823030 ) ) ( not ( = ?auto_823023 ?auto_823031 ) ) ( not ( = ?auto_823023 ?auto_823032 ) ) ( not ( = ?auto_823023 ?auto_823033 ) ) ( not ( = ?auto_823023 ?auto_823034 ) ) ( not ( = ?auto_823023 ?auto_823035 ) ) ( not ( = ?auto_823024 ?auto_823025 ) ) ( not ( = ?auto_823024 ?auto_823026 ) ) ( not ( = ?auto_823024 ?auto_823027 ) ) ( not ( = ?auto_823024 ?auto_823028 ) ) ( not ( = ?auto_823024 ?auto_823029 ) ) ( not ( = ?auto_823024 ?auto_823030 ) ) ( not ( = ?auto_823024 ?auto_823031 ) ) ( not ( = ?auto_823024 ?auto_823032 ) ) ( not ( = ?auto_823024 ?auto_823033 ) ) ( not ( = ?auto_823024 ?auto_823034 ) ) ( not ( = ?auto_823024 ?auto_823035 ) ) ( not ( = ?auto_823025 ?auto_823026 ) ) ( not ( = ?auto_823025 ?auto_823027 ) ) ( not ( = ?auto_823025 ?auto_823028 ) ) ( not ( = ?auto_823025 ?auto_823029 ) ) ( not ( = ?auto_823025 ?auto_823030 ) ) ( not ( = ?auto_823025 ?auto_823031 ) ) ( not ( = ?auto_823025 ?auto_823032 ) ) ( not ( = ?auto_823025 ?auto_823033 ) ) ( not ( = ?auto_823025 ?auto_823034 ) ) ( not ( = ?auto_823025 ?auto_823035 ) ) ( not ( = ?auto_823026 ?auto_823027 ) ) ( not ( = ?auto_823026 ?auto_823028 ) ) ( not ( = ?auto_823026 ?auto_823029 ) ) ( not ( = ?auto_823026 ?auto_823030 ) ) ( not ( = ?auto_823026 ?auto_823031 ) ) ( not ( = ?auto_823026 ?auto_823032 ) ) ( not ( = ?auto_823026 ?auto_823033 ) ) ( not ( = ?auto_823026 ?auto_823034 ) ) ( not ( = ?auto_823026 ?auto_823035 ) ) ( not ( = ?auto_823027 ?auto_823028 ) ) ( not ( = ?auto_823027 ?auto_823029 ) ) ( not ( = ?auto_823027 ?auto_823030 ) ) ( not ( = ?auto_823027 ?auto_823031 ) ) ( not ( = ?auto_823027 ?auto_823032 ) ) ( not ( = ?auto_823027 ?auto_823033 ) ) ( not ( = ?auto_823027 ?auto_823034 ) ) ( not ( = ?auto_823027 ?auto_823035 ) ) ( not ( = ?auto_823028 ?auto_823029 ) ) ( not ( = ?auto_823028 ?auto_823030 ) ) ( not ( = ?auto_823028 ?auto_823031 ) ) ( not ( = ?auto_823028 ?auto_823032 ) ) ( not ( = ?auto_823028 ?auto_823033 ) ) ( not ( = ?auto_823028 ?auto_823034 ) ) ( not ( = ?auto_823028 ?auto_823035 ) ) ( not ( = ?auto_823029 ?auto_823030 ) ) ( not ( = ?auto_823029 ?auto_823031 ) ) ( not ( = ?auto_823029 ?auto_823032 ) ) ( not ( = ?auto_823029 ?auto_823033 ) ) ( not ( = ?auto_823029 ?auto_823034 ) ) ( not ( = ?auto_823029 ?auto_823035 ) ) ( not ( = ?auto_823030 ?auto_823031 ) ) ( not ( = ?auto_823030 ?auto_823032 ) ) ( not ( = ?auto_823030 ?auto_823033 ) ) ( not ( = ?auto_823030 ?auto_823034 ) ) ( not ( = ?auto_823030 ?auto_823035 ) ) ( not ( = ?auto_823031 ?auto_823032 ) ) ( not ( = ?auto_823031 ?auto_823033 ) ) ( not ( = ?auto_823031 ?auto_823034 ) ) ( not ( = ?auto_823031 ?auto_823035 ) ) ( not ( = ?auto_823032 ?auto_823033 ) ) ( not ( = ?auto_823032 ?auto_823034 ) ) ( not ( = ?auto_823032 ?auto_823035 ) ) ( not ( = ?auto_823033 ?auto_823034 ) ) ( not ( = ?auto_823033 ?auto_823035 ) ) ( not ( = ?auto_823034 ?auto_823035 ) ) ( ON ?auto_823033 ?auto_823034 ) ( ON ?auto_823032 ?auto_823033 ) ( ON ?auto_823031 ?auto_823032 ) ( ON ?auto_823030 ?auto_823031 ) ( ON ?auto_823029 ?auto_823030 ) ( ON ?auto_823028 ?auto_823029 ) ( ON ?auto_823027 ?auto_823028 ) ( ON ?auto_823026 ?auto_823027 ) ( ON ?auto_823025 ?auto_823026 ) ( ON ?auto_823024 ?auto_823025 ) ( ON ?auto_823023 ?auto_823024 ) ( CLEAR ?auto_823021 ) ( ON ?auto_823022 ?auto_823023 ) ( CLEAR ?auto_823022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_823021 ?auto_823022 )
      ( MAKE-14PILE ?auto_823021 ?auto_823022 ?auto_823023 ?auto_823024 ?auto_823025 ?auto_823026 ?auto_823027 ?auto_823028 ?auto_823029 ?auto_823030 ?auto_823031 ?auto_823032 ?auto_823033 ?auto_823034 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_823079 - BLOCK
      ?auto_823080 - BLOCK
      ?auto_823081 - BLOCK
      ?auto_823082 - BLOCK
      ?auto_823083 - BLOCK
      ?auto_823084 - BLOCK
      ?auto_823085 - BLOCK
      ?auto_823086 - BLOCK
      ?auto_823087 - BLOCK
      ?auto_823088 - BLOCK
      ?auto_823089 - BLOCK
      ?auto_823090 - BLOCK
      ?auto_823091 - BLOCK
      ?auto_823092 - BLOCK
    )
    :vars
    (
      ?auto_823093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823092 ?auto_823093 ) ( not ( = ?auto_823079 ?auto_823080 ) ) ( not ( = ?auto_823079 ?auto_823081 ) ) ( not ( = ?auto_823079 ?auto_823082 ) ) ( not ( = ?auto_823079 ?auto_823083 ) ) ( not ( = ?auto_823079 ?auto_823084 ) ) ( not ( = ?auto_823079 ?auto_823085 ) ) ( not ( = ?auto_823079 ?auto_823086 ) ) ( not ( = ?auto_823079 ?auto_823087 ) ) ( not ( = ?auto_823079 ?auto_823088 ) ) ( not ( = ?auto_823079 ?auto_823089 ) ) ( not ( = ?auto_823079 ?auto_823090 ) ) ( not ( = ?auto_823079 ?auto_823091 ) ) ( not ( = ?auto_823079 ?auto_823092 ) ) ( not ( = ?auto_823079 ?auto_823093 ) ) ( not ( = ?auto_823080 ?auto_823081 ) ) ( not ( = ?auto_823080 ?auto_823082 ) ) ( not ( = ?auto_823080 ?auto_823083 ) ) ( not ( = ?auto_823080 ?auto_823084 ) ) ( not ( = ?auto_823080 ?auto_823085 ) ) ( not ( = ?auto_823080 ?auto_823086 ) ) ( not ( = ?auto_823080 ?auto_823087 ) ) ( not ( = ?auto_823080 ?auto_823088 ) ) ( not ( = ?auto_823080 ?auto_823089 ) ) ( not ( = ?auto_823080 ?auto_823090 ) ) ( not ( = ?auto_823080 ?auto_823091 ) ) ( not ( = ?auto_823080 ?auto_823092 ) ) ( not ( = ?auto_823080 ?auto_823093 ) ) ( not ( = ?auto_823081 ?auto_823082 ) ) ( not ( = ?auto_823081 ?auto_823083 ) ) ( not ( = ?auto_823081 ?auto_823084 ) ) ( not ( = ?auto_823081 ?auto_823085 ) ) ( not ( = ?auto_823081 ?auto_823086 ) ) ( not ( = ?auto_823081 ?auto_823087 ) ) ( not ( = ?auto_823081 ?auto_823088 ) ) ( not ( = ?auto_823081 ?auto_823089 ) ) ( not ( = ?auto_823081 ?auto_823090 ) ) ( not ( = ?auto_823081 ?auto_823091 ) ) ( not ( = ?auto_823081 ?auto_823092 ) ) ( not ( = ?auto_823081 ?auto_823093 ) ) ( not ( = ?auto_823082 ?auto_823083 ) ) ( not ( = ?auto_823082 ?auto_823084 ) ) ( not ( = ?auto_823082 ?auto_823085 ) ) ( not ( = ?auto_823082 ?auto_823086 ) ) ( not ( = ?auto_823082 ?auto_823087 ) ) ( not ( = ?auto_823082 ?auto_823088 ) ) ( not ( = ?auto_823082 ?auto_823089 ) ) ( not ( = ?auto_823082 ?auto_823090 ) ) ( not ( = ?auto_823082 ?auto_823091 ) ) ( not ( = ?auto_823082 ?auto_823092 ) ) ( not ( = ?auto_823082 ?auto_823093 ) ) ( not ( = ?auto_823083 ?auto_823084 ) ) ( not ( = ?auto_823083 ?auto_823085 ) ) ( not ( = ?auto_823083 ?auto_823086 ) ) ( not ( = ?auto_823083 ?auto_823087 ) ) ( not ( = ?auto_823083 ?auto_823088 ) ) ( not ( = ?auto_823083 ?auto_823089 ) ) ( not ( = ?auto_823083 ?auto_823090 ) ) ( not ( = ?auto_823083 ?auto_823091 ) ) ( not ( = ?auto_823083 ?auto_823092 ) ) ( not ( = ?auto_823083 ?auto_823093 ) ) ( not ( = ?auto_823084 ?auto_823085 ) ) ( not ( = ?auto_823084 ?auto_823086 ) ) ( not ( = ?auto_823084 ?auto_823087 ) ) ( not ( = ?auto_823084 ?auto_823088 ) ) ( not ( = ?auto_823084 ?auto_823089 ) ) ( not ( = ?auto_823084 ?auto_823090 ) ) ( not ( = ?auto_823084 ?auto_823091 ) ) ( not ( = ?auto_823084 ?auto_823092 ) ) ( not ( = ?auto_823084 ?auto_823093 ) ) ( not ( = ?auto_823085 ?auto_823086 ) ) ( not ( = ?auto_823085 ?auto_823087 ) ) ( not ( = ?auto_823085 ?auto_823088 ) ) ( not ( = ?auto_823085 ?auto_823089 ) ) ( not ( = ?auto_823085 ?auto_823090 ) ) ( not ( = ?auto_823085 ?auto_823091 ) ) ( not ( = ?auto_823085 ?auto_823092 ) ) ( not ( = ?auto_823085 ?auto_823093 ) ) ( not ( = ?auto_823086 ?auto_823087 ) ) ( not ( = ?auto_823086 ?auto_823088 ) ) ( not ( = ?auto_823086 ?auto_823089 ) ) ( not ( = ?auto_823086 ?auto_823090 ) ) ( not ( = ?auto_823086 ?auto_823091 ) ) ( not ( = ?auto_823086 ?auto_823092 ) ) ( not ( = ?auto_823086 ?auto_823093 ) ) ( not ( = ?auto_823087 ?auto_823088 ) ) ( not ( = ?auto_823087 ?auto_823089 ) ) ( not ( = ?auto_823087 ?auto_823090 ) ) ( not ( = ?auto_823087 ?auto_823091 ) ) ( not ( = ?auto_823087 ?auto_823092 ) ) ( not ( = ?auto_823087 ?auto_823093 ) ) ( not ( = ?auto_823088 ?auto_823089 ) ) ( not ( = ?auto_823088 ?auto_823090 ) ) ( not ( = ?auto_823088 ?auto_823091 ) ) ( not ( = ?auto_823088 ?auto_823092 ) ) ( not ( = ?auto_823088 ?auto_823093 ) ) ( not ( = ?auto_823089 ?auto_823090 ) ) ( not ( = ?auto_823089 ?auto_823091 ) ) ( not ( = ?auto_823089 ?auto_823092 ) ) ( not ( = ?auto_823089 ?auto_823093 ) ) ( not ( = ?auto_823090 ?auto_823091 ) ) ( not ( = ?auto_823090 ?auto_823092 ) ) ( not ( = ?auto_823090 ?auto_823093 ) ) ( not ( = ?auto_823091 ?auto_823092 ) ) ( not ( = ?auto_823091 ?auto_823093 ) ) ( not ( = ?auto_823092 ?auto_823093 ) ) ( ON ?auto_823091 ?auto_823092 ) ( ON ?auto_823090 ?auto_823091 ) ( ON ?auto_823089 ?auto_823090 ) ( ON ?auto_823088 ?auto_823089 ) ( ON ?auto_823087 ?auto_823088 ) ( ON ?auto_823086 ?auto_823087 ) ( ON ?auto_823085 ?auto_823086 ) ( ON ?auto_823084 ?auto_823085 ) ( ON ?auto_823083 ?auto_823084 ) ( ON ?auto_823082 ?auto_823083 ) ( ON ?auto_823081 ?auto_823082 ) ( ON ?auto_823080 ?auto_823081 ) ( ON ?auto_823079 ?auto_823080 ) ( CLEAR ?auto_823079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_823079 )
      ( MAKE-14PILE ?auto_823079 ?auto_823080 ?auto_823081 ?auto_823082 ?auto_823083 ?auto_823084 ?auto_823085 ?auto_823086 ?auto_823087 ?auto_823088 ?auto_823089 ?auto_823090 ?auto_823091 ?auto_823092 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823138 - BLOCK
      ?auto_823139 - BLOCK
      ?auto_823140 - BLOCK
      ?auto_823141 - BLOCK
      ?auto_823142 - BLOCK
      ?auto_823143 - BLOCK
      ?auto_823144 - BLOCK
      ?auto_823145 - BLOCK
      ?auto_823146 - BLOCK
      ?auto_823147 - BLOCK
      ?auto_823148 - BLOCK
      ?auto_823149 - BLOCK
      ?auto_823150 - BLOCK
      ?auto_823151 - BLOCK
      ?auto_823152 - BLOCK
    )
    :vars
    (
      ?auto_823153 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_823151 ) ( ON ?auto_823152 ?auto_823153 ) ( CLEAR ?auto_823152 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_823138 ) ( ON ?auto_823139 ?auto_823138 ) ( ON ?auto_823140 ?auto_823139 ) ( ON ?auto_823141 ?auto_823140 ) ( ON ?auto_823142 ?auto_823141 ) ( ON ?auto_823143 ?auto_823142 ) ( ON ?auto_823144 ?auto_823143 ) ( ON ?auto_823145 ?auto_823144 ) ( ON ?auto_823146 ?auto_823145 ) ( ON ?auto_823147 ?auto_823146 ) ( ON ?auto_823148 ?auto_823147 ) ( ON ?auto_823149 ?auto_823148 ) ( ON ?auto_823150 ?auto_823149 ) ( ON ?auto_823151 ?auto_823150 ) ( not ( = ?auto_823138 ?auto_823139 ) ) ( not ( = ?auto_823138 ?auto_823140 ) ) ( not ( = ?auto_823138 ?auto_823141 ) ) ( not ( = ?auto_823138 ?auto_823142 ) ) ( not ( = ?auto_823138 ?auto_823143 ) ) ( not ( = ?auto_823138 ?auto_823144 ) ) ( not ( = ?auto_823138 ?auto_823145 ) ) ( not ( = ?auto_823138 ?auto_823146 ) ) ( not ( = ?auto_823138 ?auto_823147 ) ) ( not ( = ?auto_823138 ?auto_823148 ) ) ( not ( = ?auto_823138 ?auto_823149 ) ) ( not ( = ?auto_823138 ?auto_823150 ) ) ( not ( = ?auto_823138 ?auto_823151 ) ) ( not ( = ?auto_823138 ?auto_823152 ) ) ( not ( = ?auto_823138 ?auto_823153 ) ) ( not ( = ?auto_823139 ?auto_823140 ) ) ( not ( = ?auto_823139 ?auto_823141 ) ) ( not ( = ?auto_823139 ?auto_823142 ) ) ( not ( = ?auto_823139 ?auto_823143 ) ) ( not ( = ?auto_823139 ?auto_823144 ) ) ( not ( = ?auto_823139 ?auto_823145 ) ) ( not ( = ?auto_823139 ?auto_823146 ) ) ( not ( = ?auto_823139 ?auto_823147 ) ) ( not ( = ?auto_823139 ?auto_823148 ) ) ( not ( = ?auto_823139 ?auto_823149 ) ) ( not ( = ?auto_823139 ?auto_823150 ) ) ( not ( = ?auto_823139 ?auto_823151 ) ) ( not ( = ?auto_823139 ?auto_823152 ) ) ( not ( = ?auto_823139 ?auto_823153 ) ) ( not ( = ?auto_823140 ?auto_823141 ) ) ( not ( = ?auto_823140 ?auto_823142 ) ) ( not ( = ?auto_823140 ?auto_823143 ) ) ( not ( = ?auto_823140 ?auto_823144 ) ) ( not ( = ?auto_823140 ?auto_823145 ) ) ( not ( = ?auto_823140 ?auto_823146 ) ) ( not ( = ?auto_823140 ?auto_823147 ) ) ( not ( = ?auto_823140 ?auto_823148 ) ) ( not ( = ?auto_823140 ?auto_823149 ) ) ( not ( = ?auto_823140 ?auto_823150 ) ) ( not ( = ?auto_823140 ?auto_823151 ) ) ( not ( = ?auto_823140 ?auto_823152 ) ) ( not ( = ?auto_823140 ?auto_823153 ) ) ( not ( = ?auto_823141 ?auto_823142 ) ) ( not ( = ?auto_823141 ?auto_823143 ) ) ( not ( = ?auto_823141 ?auto_823144 ) ) ( not ( = ?auto_823141 ?auto_823145 ) ) ( not ( = ?auto_823141 ?auto_823146 ) ) ( not ( = ?auto_823141 ?auto_823147 ) ) ( not ( = ?auto_823141 ?auto_823148 ) ) ( not ( = ?auto_823141 ?auto_823149 ) ) ( not ( = ?auto_823141 ?auto_823150 ) ) ( not ( = ?auto_823141 ?auto_823151 ) ) ( not ( = ?auto_823141 ?auto_823152 ) ) ( not ( = ?auto_823141 ?auto_823153 ) ) ( not ( = ?auto_823142 ?auto_823143 ) ) ( not ( = ?auto_823142 ?auto_823144 ) ) ( not ( = ?auto_823142 ?auto_823145 ) ) ( not ( = ?auto_823142 ?auto_823146 ) ) ( not ( = ?auto_823142 ?auto_823147 ) ) ( not ( = ?auto_823142 ?auto_823148 ) ) ( not ( = ?auto_823142 ?auto_823149 ) ) ( not ( = ?auto_823142 ?auto_823150 ) ) ( not ( = ?auto_823142 ?auto_823151 ) ) ( not ( = ?auto_823142 ?auto_823152 ) ) ( not ( = ?auto_823142 ?auto_823153 ) ) ( not ( = ?auto_823143 ?auto_823144 ) ) ( not ( = ?auto_823143 ?auto_823145 ) ) ( not ( = ?auto_823143 ?auto_823146 ) ) ( not ( = ?auto_823143 ?auto_823147 ) ) ( not ( = ?auto_823143 ?auto_823148 ) ) ( not ( = ?auto_823143 ?auto_823149 ) ) ( not ( = ?auto_823143 ?auto_823150 ) ) ( not ( = ?auto_823143 ?auto_823151 ) ) ( not ( = ?auto_823143 ?auto_823152 ) ) ( not ( = ?auto_823143 ?auto_823153 ) ) ( not ( = ?auto_823144 ?auto_823145 ) ) ( not ( = ?auto_823144 ?auto_823146 ) ) ( not ( = ?auto_823144 ?auto_823147 ) ) ( not ( = ?auto_823144 ?auto_823148 ) ) ( not ( = ?auto_823144 ?auto_823149 ) ) ( not ( = ?auto_823144 ?auto_823150 ) ) ( not ( = ?auto_823144 ?auto_823151 ) ) ( not ( = ?auto_823144 ?auto_823152 ) ) ( not ( = ?auto_823144 ?auto_823153 ) ) ( not ( = ?auto_823145 ?auto_823146 ) ) ( not ( = ?auto_823145 ?auto_823147 ) ) ( not ( = ?auto_823145 ?auto_823148 ) ) ( not ( = ?auto_823145 ?auto_823149 ) ) ( not ( = ?auto_823145 ?auto_823150 ) ) ( not ( = ?auto_823145 ?auto_823151 ) ) ( not ( = ?auto_823145 ?auto_823152 ) ) ( not ( = ?auto_823145 ?auto_823153 ) ) ( not ( = ?auto_823146 ?auto_823147 ) ) ( not ( = ?auto_823146 ?auto_823148 ) ) ( not ( = ?auto_823146 ?auto_823149 ) ) ( not ( = ?auto_823146 ?auto_823150 ) ) ( not ( = ?auto_823146 ?auto_823151 ) ) ( not ( = ?auto_823146 ?auto_823152 ) ) ( not ( = ?auto_823146 ?auto_823153 ) ) ( not ( = ?auto_823147 ?auto_823148 ) ) ( not ( = ?auto_823147 ?auto_823149 ) ) ( not ( = ?auto_823147 ?auto_823150 ) ) ( not ( = ?auto_823147 ?auto_823151 ) ) ( not ( = ?auto_823147 ?auto_823152 ) ) ( not ( = ?auto_823147 ?auto_823153 ) ) ( not ( = ?auto_823148 ?auto_823149 ) ) ( not ( = ?auto_823148 ?auto_823150 ) ) ( not ( = ?auto_823148 ?auto_823151 ) ) ( not ( = ?auto_823148 ?auto_823152 ) ) ( not ( = ?auto_823148 ?auto_823153 ) ) ( not ( = ?auto_823149 ?auto_823150 ) ) ( not ( = ?auto_823149 ?auto_823151 ) ) ( not ( = ?auto_823149 ?auto_823152 ) ) ( not ( = ?auto_823149 ?auto_823153 ) ) ( not ( = ?auto_823150 ?auto_823151 ) ) ( not ( = ?auto_823150 ?auto_823152 ) ) ( not ( = ?auto_823150 ?auto_823153 ) ) ( not ( = ?auto_823151 ?auto_823152 ) ) ( not ( = ?auto_823151 ?auto_823153 ) ) ( not ( = ?auto_823152 ?auto_823153 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_823152 ?auto_823153 )
      ( !STACK ?auto_823152 ?auto_823151 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823200 - BLOCK
      ?auto_823201 - BLOCK
      ?auto_823202 - BLOCK
      ?auto_823203 - BLOCK
      ?auto_823204 - BLOCK
      ?auto_823205 - BLOCK
      ?auto_823206 - BLOCK
      ?auto_823207 - BLOCK
      ?auto_823208 - BLOCK
      ?auto_823209 - BLOCK
      ?auto_823210 - BLOCK
      ?auto_823211 - BLOCK
      ?auto_823212 - BLOCK
      ?auto_823213 - BLOCK
      ?auto_823214 - BLOCK
    )
    :vars
    (
      ?auto_823215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823214 ?auto_823215 ) ( ON-TABLE ?auto_823200 ) ( ON ?auto_823201 ?auto_823200 ) ( ON ?auto_823202 ?auto_823201 ) ( ON ?auto_823203 ?auto_823202 ) ( ON ?auto_823204 ?auto_823203 ) ( ON ?auto_823205 ?auto_823204 ) ( ON ?auto_823206 ?auto_823205 ) ( ON ?auto_823207 ?auto_823206 ) ( ON ?auto_823208 ?auto_823207 ) ( ON ?auto_823209 ?auto_823208 ) ( ON ?auto_823210 ?auto_823209 ) ( ON ?auto_823211 ?auto_823210 ) ( ON ?auto_823212 ?auto_823211 ) ( not ( = ?auto_823200 ?auto_823201 ) ) ( not ( = ?auto_823200 ?auto_823202 ) ) ( not ( = ?auto_823200 ?auto_823203 ) ) ( not ( = ?auto_823200 ?auto_823204 ) ) ( not ( = ?auto_823200 ?auto_823205 ) ) ( not ( = ?auto_823200 ?auto_823206 ) ) ( not ( = ?auto_823200 ?auto_823207 ) ) ( not ( = ?auto_823200 ?auto_823208 ) ) ( not ( = ?auto_823200 ?auto_823209 ) ) ( not ( = ?auto_823200 ?auto_823210 ) ) ( not ( = ?auto_823200 ?auto_823211 ) ) ( not ( = ?auto_823200 ?auto_823212 ) ) ( not ( = ?auto_823200 ?auto_823213 ) ) ( not ( = ?auto_823200 ?auto_823214 ) ) ( not ( = ?auto_823200 ?auto_823215 ) ) ( not ( = ?auto_823201 ?auto_823202 ) ) ( not ( = ?auto_823201 ?auto_823203 ) ) ( not ( = ?auto_823201 ?auto_823204 ) ) ( not ( = ?auto_823201 ?auto_823205 ) ) ( not ( = ?auto_823201 ?auto_823206 ) ) ( not ( = ?auto_823201 ?auto_823207 ) ) ( not ( = ?auto_823201 ?auto_823208 ) ) ( not ( = ?auto_823201 ?auto_823209 ) ) ( not ( = ?auto_823201 ?auto_823210 ) ) ( not ( = ?auto_823201 ?auto_823211 ) ) ( not ( = ?auto_823201 ?auto_823212 ) ) ( not ( = ?auto_823201 ?auto_823213 ) ) ( not ( = ?auto_823201 ?auto_823214 ) ) ( not ( = ?auto_823201 ?auto_823215 ) ) ( not ( = ?auto_823202 ?auto_823203 ) ) ( not ( = ?auto_823202 ?auto_823204 ) ) ( not ( = ?auto_823202 ?auto_823205 ) ) ( not ( = ?auto_823202 ?auto_823206 ) ) ( not ( = ?auto_823202 ?auto_823207 ) ) ( not ( = ?auto_823202 ?auto_823208 ) ) ( not ( = ?auto_823202 ?auto_823209 ) ) ( not ( = ?auto_823202 ?auto_823210 ) ) ( not ( = ?auto_823202 ?auto_823211 ) ) ( not ( = ?auto_823202 ?auto_823212 ) ) ( not ( = ?auto_823202 ?auto_823213 ) ) ( not ( = ?auto_823202 ?auto_823214 ) ) ( not ( = ?auto_823202 ?auto_823215 ) ) ( not ( = ?auto_823203 ?auto_823204 ) ) ( not ( = ?auto_823203 ?auto_823205 ) ) ( not ( = ?auto_823203 ?auto_823206 ) ) ( not ( = ?auto_823203 ?auto_823207 ) ) ( not ( = ?auto_823203 ?auto_823208 ) ) ( not ( = ?auto_823203 ?auto_823209 ) ) ( not ( = ?auto_823203 ?auto_823210 ) ) ( not ( = ?auto_823203 ?auto_823211 ) ) ( not ( = ?auto_823203 ?auto_823212 ) ) ( not ( = ?auto_823203 ?auto_823213 ) ) ( not ( = ?auto_823203 ?auto_823214 ) ) ( not ( = ?auto_823203 ?auto_823215 ) ) ( not ( = ?auto_823204 ?auto_823205 ) ) ( not ( = ?auto_823204 ?auto_823206 ) ) ( not ( = ?auto_823204 ?auto_823207 ) ) ( not ( = ?auto_823204 ?auto_823208 ) ) ( not ( = ?auto_823204 ?auto_823209 ) ) ( not ( = ?auto_823204 ?auto_823210 ) ) ( not ( = ?auto_823204 ?auto_823211 ) ) ( not ( = ?auto_823204 ?auto_823212 ) ) ( not ( = ?auto_823204 ?auto_823213 ) ) ( not ( = ?auto_823204 ?auto_823214 ) ) ( not ( = ?auto_823204 ?auto_823215 ) ) ( not ( = ?auto_823205 ?auto_823206 ) ) ( not ( = ?auto_823205 ?auto_823207 ) ) ( not ( = ?auto_823205 ?auto_823208 ) ) ( not ( = ?auto_823205 ?auto_823209 ) ) ( not ( = ?auto_823205 ?auto_823210 ) ) ( not ( = ?auto_823205 ?auto_823211 ) ) ( not ( = ?auto_823205 ?auto_823212 ) ) ( not ( = ?auto_823205 ?auto_823213 ) ) ( not ( = ?auto_823205 ?auto_823214 ) ) ( not ( = ?auto_823205 ?auto_823215 ) ) ( not ( = ?auto_823206 ?auto_823207 ) ) ( not ( = ?auto_823206 ?auto_823208 ) ) ( not ( = ?auto_823206 ?auto_823209 ) ) ( not ( = ?auto_823206 ?auto_823210 ) ) ( not ( = ?auto_823206 ?auto_823211 ) ) ( not ( = ?auto_823206 ?auto_823212 ) ) ( not ( = ?auto_823206 ?auto_823213 ) ) ( not ( = ?auto_823206 ?auto_823214 ) ) ( not ( = ?auto_823206 ?auto_823215 ) ) ( not ( = ?auto_823207 ?auto_823208 ) ) ( not ( = ?auto_823207 ?auto_823209 ) ) ( not ( = ?auto_823207 ?auto_823210 ) ) ( not ( = ?auto_823207 ?auto_823211 ) ) ( not ( = ?auto_823207 ?auto_823212 ) ) ( not ( = ?auto_823207 ?auto_823213 ) ) ( not ( = ?auto_823207 ?auto_823214 ) ) ( not ( = ?auto_823207 ?auto_823215 ) ) ( not ( = ?auto_823208 ?auto_823209 ) ) ( not ( = ?auto_823208 ?auto_823210 ) ) ( not ( = ?auto_823208 ?auto_823211 ) ) ( not ( = ?auto_823208 ?auto_823212 ) ) ( not ( = ?auto_823208 ?auto_823213 ) ) ( not ( = ?auto_823208 ?auto_823214 ) ) ( not ( = ?auto_823208 ?auto_823215 ) ) ( not ( = ?auto_823209 ?auto_823210 ) ) ( not ( = ?auto_823209 ?auto_823211 ) ) ( not ( = ?auto_823209 ?auto_823212 ) ) ( not ( = ?auto_823209 ?auto_823213 ) ) ( not ( = ?auto_823209 ?auto_823214 ) ) ( not ( = ?auto_823209 ?auto_823215 ) ) ( not ( = ?auto_823210 ?auto_823211 ) ) ( not ( = ?auto_823210 ?auto_823212 ) ) ( not ( = ?auto_823210 ?auto_823213 ) ) ( not ( = ?auto_823210 ?auto_823214 ) ) ( not ( = ?auto_823210 ?auto_823215 ) ) ( not ( = ?auto_823211 ?auto_823212 ) ) ( not ( = ?auto_823211 ?auto_823213 ) ) ( not ( = ?auto_823211 ?auto_823214 ) ) ( not ( = ?auto_823211 ?auto_823215 ) ) ( not ( = ?auto_823212 ?auto_823213 ) ) ( not ( = ?auto_823212 ?auto_823214 ) ) ( not ( = ?auto_823212 ?auto_823215 ) ) ( not ( = ?auto_823213 ?auto_823214 ) ) ( not ( = ?auto_823213 ?auto_823215 ) ) ( not ( = ?auto_823214 ?auto_823215 ) ) ( CLEAR ?auto_823212 ) ( ON ?auto_823213 ?auto_823214 ) ( CLEAR ?auto_823213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_823200 ?auto_823201 ?auto_823202 ?auto_823203 ?auto_823204 ?auto_823205 ?auto_823206 ?auto_823207 ?auto_823208 ?auto_823209 ?auto_823210 ?auto_823211 ?auto_823212 ?auto_823213 )
      ( MAKE-15PILE ?auto_823200 ?auto_823201 ?auto_823202 ?auto_823203 ?auto_823204 ?auto_823205 ?auto_823206 ?auto_823207 ?auto_823208 ?auto_823209 ?auto_823210 ?auto_823211 ?auto_823212 ?auto_823213 ?auto_823214 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823262 - BLOCK
      ?auto_823263 - BLOCK
      ?auto_823264 - BLOCK
      ?auto_823265 - BLOCK
      ?auto_823266 - BLOCK
      ?auto_823267 - BLOCK
      ?auto_823268 - BLOCK
      ?auto_823269 - BLOCK
      ?auto_823270 - BLOCK
      ?auto_823271 - BLOCK
      ?auto_823272 - BLOCK
      ?auto_823273 - BLOCK
      ?auto_823274 - BLOCK
      ?auto_823275 - BLOCK
      ?auto_823276 - BLOCK
    )
    :vars
    (
      ?auto_823277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823276 ?auto_823277 ) ( ON-TABLE ?auto_823262 ) ( ON ?auto_823263 ?auto_823262 ) ( ON ?auto_823264 ?auto_823263 ) ( ON ?auto_823265 ?auto_823264 ) ( ON ?auto_823266 ?auto_823265 ) ( ON ?auto_823267 ?auto_823266 ) ( ON ?auto_823268 ?auto_823267 ) ( ON ?auto_823269 ?auto_823268 ) ( ON ?auto_823270 ?auto_823269 ) ( ON ?auto_823271 ?auto_823270 ) ( ON ?auto_823272 ?auto_823271 ) ( ON ?auto_823273 ?auto_823272 ) ( not ( = ?auto_823262 ?auto_823263 ) ) ( not ( = ?auto_823262 ?auto_823264 ) ) ( not ( = ?auto_823262 ?auto_823265 ) ) ( not ( = ?auto_823262 ?auto_823266 ) ) ( not ( = ?auto_823262 ?auto_823267 ) ) ( not ( = ?auto_823262 ?auto_823268 ) ) ( not ( = ?auto_823262 ?auto_823269 ) ) ( not ( = ?auto_823262 ?auto_823270 ) ) ( not ( = ?auto_823262 ?auto_823271 ) ) ( not ( = ?auto_823262 ?auto_823272 ) ) ( not ( = ?auto_823262 ?auto_823273 ) ) ( not ( = ?auto_823262 ?auto_823274 ) ) ( not ( = ?auto_823262 ?auto_823275 ) ) ( not ( = ?auto_823262 ?auto_823276 ) ) ( not ( = ?auto_823262 ?auto_823277 ) ) ( not ( = ?auto_823263 ?auto_823264 ) ) ( not ( = ?auto_823263 ?auto_823265 ) ) ( not ( = ?auto_823263 ?auto_823266 ) ) ( not ( = ?auto_823263 ?auto_823267 ) ) ( not ( = ?auto_823263 ?auto_823268 ) ) ( not ( = ?auto_823263 ?auto_823269 ) ) ( not ( = ?auto_823263 ?auto_823270 ) ) ( not ( = ?auto_823263 ?auto_823271 ) ) ( not ( = ?auto_823263 ?auto_823272 ) ) ( not ( = ?auto_823263 ?auto_823273 ) ) ( not ( = ?auto_823263 ?auto_823274 ) ) ( not ( = ?auto_823263 ?auto_823275 ) ) ( not ( = ?auto_823263 ?auto_823276 ) ) ( not ( = ?auto_823263 ?auto_823277 ) ) ( not ( = ?auto_823264 ?auto_823265 ) ) ( not ( = ?auto_823264 ?auto_823266 ) ) ( not ( = ?auto_823264 ?auto_823267 ) ) ( not ( = ?auto_823264 ?auto_823268 ) ) ( not ( = ?auto_823264 ?auto_823269 ) ) ( not ( = ?auto_823264 ?auto_823270 ) ) ( not ( = ?auto_823264 ?auto_823271 ) ) ( not ( = ?auto_823264 ?auto_823272 ) ) ( not ( = ?auto_823264 ?auto_823273 ) ) ( not ( = ?auto_823264 ?auto_823274 ) ) ( not ( = ?auto_823264 ?auto_823275 ) ) ( not ( = ?auto_823264 ?auto_823276 ) ) ( not ( = ?auto_823264 ?auto_823277 ) ) ( not ( = ?auto_823265 ?auto_823266 ) ) ( not ( = ?auto_823265 ?auto_823267 ) ) ( not ( = ?auto_823265 ?auto_823268 ) ) ( not ( = ?auto_823265 ?auto_823269 ) ) ( not ( = ?auto_823265 ?auto_823270 ) ) ( not ( = ?auto_823265 ?auto_823271 ) ) ( not ( = ?auto_823265 ?auto_823272 ) ) ( not ( = ?auto_823265 ?auto_823273 ) ) ( not ( = ?auto_823265 ?auto_823274 ) ) ( not ( = ?auto_823265 ?auto_823275 ) ) ( not ( = ?auto_823265 ?auto_823276 ) ) ( not ( = ?auto_823265 ?auto_823277 ) ) ( not ( = ?auto_823266 ?auto_823267 ) ) ( not ( = ?auto_823266 ?auto_823268 ) ) ( not ( = ?auto_823266 ?auto_823269 ) ) ( not ( = ?auto_823266 ?auto_823270 ) ) ( not ( = ?auto_823266 ?auto_823271 ) ) ( not ( = ?auto_823266 ?auto_823272 ) ) ( not ( = ?auto_823266 ?auto_823273 ) ) ( not ( = ?auto_823266 ?auto_823274 ) ) ( not ( = ?auto_823266 ?auto_823275 ) ) ( not ( = ?auto_823266 ?auto_823276 ) ) ( not ( = ?auto_823266 ?auto_823277 ) ) ( not ( = ?auto_823267 ?auto_823268 ) ) ( not ( = ?auto_823267 ?auto_823269 ) ) ( not ( = ?auto_823267 ?auto_823270 ) ) ( not ( = ?auto_823267 ?auto_823271 ) ) ( not ( = ?auto_823267 ?auto_823272 ) ) ( not ( = ?auto_823267 ?auto_823273 ) ) ( not ( = ?auto_823267 ?auto_823274 ) ) ( not ( = ?auto_823267 ?auto_823275 ) ) ( not ( = ?auto_823267 ?auto_823276 ) ) ( not ( = ?auto_823267 ?auto_823277 ) ) ( not ( = ?auto_823268 ?auto_823269 ) ) ( not ( = ?auto_823268 ?auto_823270 ) ) ( not ( = ?auto_823268 ?auto_823271 ) ) ( not ( = ?auto_823268 ?auto_823272 ) ) ( not ( = ?auto_823268 ?auto_823273 ) ) ( not ( = ?auto_823268 ?auto_823274 ) ) ( not ( = ?auto_823268 ?auto_823275 ) ) ( not ( = ?auto_823268 ?auto_823276 ) ) ( not ( = ?auto_823268 ?auto_823277 ) ) ( not ( = ?auto_823269 ?auto_823270 ) ) ( not ( = ?auto_823269 ?auto_823271 ) ) ( not ( = ?auto_823269 ?auto_823272 ) ) ( not ( = ?auto_823269 ?auto_823273 ) ) ( not ( = ?auto_823269 ?auto_823274 ) ) ( not ( = ?auto_823269 ?auto_823275 ) ) ( not ( = ?auto_823269 ?auto_823276 ) ) ( not ( = ?auto_823269 ?auto_823277 ) ) ( not ( = ?auto_823270 ?auto_823271 ) ) ( not ( = ?auto_823270 ?auto_823272 ) ) ( not ( = ?auto_823270 ?auto_823273 ) ) ( not ( = ?auto_823270 ?auto_823274 ) ) ( not ( = ?auto_823270 ?auto_823275 ) ) ( not ( = ?auto_823270 ?auto_823276 ) ) ( not ( = ?auto_823270 ?auto_823277 ) ) ( not ( = ?auto_823271 ?auto_823272 ) ) ( not ( = ?auto_823271 ?auto_823273 ) ) ( not ( = ?auto_823271 ?auto_823274 ) ) ( not ( = ?auto_823271 ?auto_823275 ) ) ( not ( = ?auto_823271 ?auto_823276 ) ) ( not ( = ?auto_823271 ?auto_823277 ) ) ( not ( = ?auto_823272 ?auto_823273 ) ) ( not ( = ?auto_823272 ?auto_823274 ) ) ( not ( = ?auto_823272 ?auto_823275 ) ) ( not ( = ?auto_823272 ?auto_823276 ) ) ( not ( = ?auto_823272 ?auto_823277 ) ) ( not ( = ?auto_823273 ?auto_823274 ) ) ( not ( = ?auto_823273 ?auto_823275 ) ) ( not ( = ?auto_823273 ?auto_823276 ) ) ( not ( = ?auto_823273 ?auto_823277 ) ) ( not ( = ?auto_823274 ?auto_823275 ) ) ( not ( = ?auto_823274 ?auto_823276 ) ) ( not ( = ?auto_823274 ?auto_823277 ) ) ( not ( = ?auto_823275 ?auto_823276 ) ) ( not ( = ?auto_823275 ?auto_823277 ) ) ( not ( = ?auto_823276 ?auto_823277 ) ) ( ON ?auto_823275 ?auto_823276 ) ( CLEAR ?auto_823273 ) ( ON ?auto_823274 ?auto_823275 ) ( CLEAR ?auto_823274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_823262 ?auto_823263 ?auto_823264 ?auto_823265 ?auto_823266 ?auto_823267 ?auto_823268 ?auto_823269 ?auto_823270 ?auto_823271 ?auto_823272 ?auto_823273 ?auto_823274 )
      ( MAKE-15PILE ?auto_823262 ?auto_823263 ?auto_823264 ?auto_823265 ?auto_823266 ?auto_823267 ?auto_823268 ?auto_823269 ?auto_823270 ?auto_823271 ?auto_823272 ?auto_823273 ?auto_823274 ?auto_823275 ?auto_823276 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823324 - BLOCK
      ?auto_823325 - BLOCK
      ?auto_823326 - BLOCK
      ?auto_823327 - BLOCK
      ?auto_823328 - BLOCK
      ?auto_823329 - BLOCK
      ?auto_823330 - BLOCK
      ?auto_823331 - BLOCK
      ?auto_823332 - BLOCK
      ?auto_823333 - BLOCK
      ?auto_823334 - BLOCK
      ?auto_823335 - BLOCK
      ?auto_823336 - BLOCK
      ?auto_823337 - BLOCK
      ?auto_823338 - BLOCK
    )
    :vars
    (
      ?auto_823339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823338 ?auto_823339 ) ( ON-TABLE ?auto_823324 ) ( ON ?auto_823325 ?auto_823324 ) ( ON ?auto_823326 ?auto_823325 ) ( ON ?auto_823327 ?auto_823326 ) ( ON ?auto_823328 ?auto_823327 ) ( ON ?auto_823329 ?auto_823328 ) ( ON ?auto_823330 ?auto_823329 ) ( ON ?auto_823331 ?auto_823330 ) ( ON ?auto_823332 ?auto_823331 ) ( ON ?auto_823333 ?auto_823332 ) ( ON ?auto_823334 ?auto_823333 ) ( not ( = ?auto_823324 ?auto_823325 ) ) ( not ( = ?auto_823324 ?auto_823326 ) ) ( not ( = ?auto_823324 ?auto_823327 ) ) ( not ( = ?auto_823324 ?auto_823328 ) ) ( not ( = ?auto_823324 ?auto_823329 ) ) ( not ( = ?auto_823324 ?auto_823330 ) ) ( not ( = ?auto_823324 ?auto_823331 ) ) ( not ( = ?auto_823324 ?auto_823332 ) ) ( not ( = ?auto_823324 ?auto_823333 ) ) ( not ( = ?auto_823324 ?auto_823334 ) ) ( not ( = ?auto_823324 ?auto_823335 ) ) ( not ( = ?auto_823324 ?auto_823336 ) ) ( not ( = ?auto_823324 ?auto_823337 ) ) ( not ( = ?auto_823324 ?auto_823338 ) ) ( not ( = ?auto_823324 ?auto_823339 ) ) ( not ( = ?auto_823325 ?auto_823326 ) ) ( not ( = ?auto_823325 ?auto_823327 ) ) ( not ( = ?auto_823325 ?auto_823328 ) ) ( not ( = ?auto_823325 ?auto_823329 ) ) ( not ( = ?auto_823325 ?auto_823330 ) ) ( not ( = ?auto_823325 ?auto_823331 ) ) ( not ( = ?auto_823325 ?auto_823332 ) ) ( not ( = ?auto_823325 ?auto_823333 ) ) ( not ( = ?auto_823325 ?auto_823334 ) ) ( not ( = ?auto_823325 ?auto_823335 ) ) ( not ( = ?auto_823325 ?auto_823336 ) ) ( not ( = ?auto_823325 ?auto_823337 ) ) ( not ( = ?auto_823325 ?auto_823338 ) ) ( not ( = ?auto_823325 ?auto_823339 ) ) ( not ( = ?auto_823326 ?auto_823327 ) ) ( not ( = ?auto_823326 ?auto_823328 ) ) ( not ( = ?auto_823326 ?auto_823329 ) ) ( not ( = ?auto_823326 ?auto_823330 ) ) ( not ( = ?auto_823326 ?auto_823331 ) ) ( not ( = ?auto_823326 ?auto_823332 ) ) ( not ( = ?auto_823326 ?auto_823333 ) ) ( not ( = ?auto_823326 ?auto_823334 ) ) ( not ( = ?auto_823326 ?auto_823335 ) ) ( not ( = ?auto_823326 ?auto_823336 ) ) ( not ( = ?auto_823326 ?auto_823337 ) ) ( not ( = ?auto_823326 ?auto_823338 ) ) ( not ( = ?auto_823326 ?auto_823339 ) ) ( not ( = ?auto_823327 ?auto_823328 ) ) ( not ( = ?auto_823327 ?auto_823329 ) ) ( not ( = ?auto_823327 ?auto_823330 ) ) ( not ( = ?auto_823327 ?auto_823331 ) ) ( not ( = ?auto_823327 ?auto_823332 ) ) ( not ( = ?auto_823327 ?auto_823333 ) ) ( not ( = ?auto_823327 ?auto_823334 ) ) ( not ( = ?auto_823327 ?auto_823335 ) ) ( not ( = ?auto_823327 ?auto_823336 ) ) ( not ( = ?auto_823327 ?auto_823337 ) ) ( not ( = ?auto_823327 ?auto_823338 ) ) ( not ( = ?auto_823327 ?auto_823339 ) ) ( not ( = ?auto_823328 ?auto_823329 ) ) ( not ( = ?auto_823328 ?auto_823330 ) ) ( not ( = ?auto_823328 ?auto_823331 ) ) ( not ( = ?auto_823328 ?auto_823332 ) ) ( not ( = ?auto_823328 ?auto_823333 ) ) ( not ( = ?auto_823328 ?auto_823334 ) ) ( not ( = ?auto_823328 ?auto_823335 ) ) ( not ( = ?auto_823328 ?auto_823336 ) ) ( not ( = ?auto_823328 ?auto_823337 ) ) ( not ( = ?auto_823328 ?auto_823338 ) ) ( not ( = ?auto_823328 ?auto_823339 ) ) ( not ( = ?auto_823329 ?auto_823330 ) ) ( not ( = ?auto_823329 ?auto_823331 ) ) ( not ( = ?auto_823329 ?auto_823332 ) ) ( not ( = ?auto_823329 ?auto_823333 ) ) ( not ( = ?auto_823329 ?auto_823334 ) ) ( not ( = ?auto_823329 ?auto_823335 ) ) ( not ( = ?auto_823329 ?auto_823336 ) ) ( not ( = ?auto_823329 ?auto_823337 ) ) ( not ( = ?auto_823329 ?auto_823338 ) ) ( not ( = ?auto_823329 ?auto_823339 ) ) ( not ( = ?auto_823330 ?auto_823331 ) ) ( not ( = ?auto_823330 ?auto_823332 ) ) ( not ( = ?auto_823330 ?auto_823333 ) ) ( not ( = ?auto_823330 ?auto_823334 ) ) ( not ( = ?auto_823330 ?auto_823335 ) ) ( not ( = ?auto_823330 ?auto_823336 ) ) ( not ( = ?auto_823330 ?auto_823337 ) ) ( not ( = ?auto_823330 ?auto_823338 ) ) ( not ( = ?auto_823330 ?auto_823339 ) ) ( not ( = ?auto_823331 ?auto_823332 ) ) ( not ( = ?auto_823331 ?auto_823333 ) ) ( not ( = ?auto_823331 ?auto_823334 ) ) ( not ( = ?auto_823331 ?auto_823335 ) ) ( not ( = ?auto_823331 ?auto_823336 ) ) ( not ( = ?auto_823331 ?auto_823337 ) ) ( not ( = ?auto_823331 ?auto_823338 ) ) ( not ( = ?auto_823331 ?auto_823339 ) ) ( not ( = ?auto_823332 ?auto_823333 ) ) ( not ( = ?auto_823332 ?auto_823334 ) ) ( not ( = ?auto_823332 ?auto_823335 ) ) ( not ( = ?auto_823332 ?auto_823336 ) ) ( not ( = ?auto_823332 ?auto_823337 ) ) ( not ( = ?auto_823332 ?auto_823338 ) ) ( not ( = ?auto_823332 ?auto_823339 ) ) ( not ( = ?auto_823333 ?auto_823334 ) ) ( not ( = ?auto_823333 ?auto_823335 ) ) ( not ( = ?auto_823333 ?auto_823336 ) ) ( not ( = ?auto_823333 ?auto_823337 ) ) ( not ( = ?auto_823333 ?auto_823338 ) ) ( not ( = ?auto_823333 ?auto_823339 ) ) ( not ( = ?auto_823334 ?auto_823335 ) ) ( not ( = ?auto_823334 ?auto_823336 ) ) ( not ( = ?auto_823334 ?auto_823337 ) ) ( not ( = ?auto_823334 ?auto_823338 ) ) ( not ( = ?auto_823334 ?auto_823339 ) ) ( not ( = ?auto_823335 ?auto_823336 ) ) ( not ( = ?auto_823335 ?auto_823337 ) ) ( not ( = ?auto_823335 ?auto_823338 ) ) ( not ( = ?auto_823335 ?auto_823339 ) ) ( not ( = ?auto_823336 ?auto_823337 ) ) ( not ( = ?auto_823336 ?auto_823338 ) ) ( not ( = ?auto_823336 ?auto_823339 ) ) ( not ( = ?auto_823337 ?auto_823338 ) ) ( not ( = ?auto_823337 ?auto_823339 ) ) ( not ( = ?auto_823338 ?auto_823339 ) ) ( ON ?auto_823337 ?auto_823338 ) ( ON ?auto_823336 ?auto_823337 ) ( CLEAR ?auto_823334 ) ( ON ?auto_823335 ?auto_823336 ) ( CLEAR ?auto_823335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_823324 ?auto_823325 ?auto_823326 ?auto_823327 ?auto_823328 ?auto_823329 ?auto_823330 ?auto_823331 ?auto_823332 ?auto_823333 ?auto_823334 ?auto_823335 )
      ( MAKE-15PILE ?auto_823324 ?auto_823325 ?auto_823326 ?auto_823327 ?auto_823328 ?auto_823329 ?auto_823330 ?auto_823331 ?auto_823332 ?auto_823333 ?auto_823334 ?auto_823335 ?auto_823336 ?auto_823337 ?auto_823338 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823386 - BLOCK
      ?auto_823387 - BLOCK
      ?auto_823388 - BLOCK
      ?auto_823389 - BLOCK
      ?auto_823390 - BLOCK
      ?auto_823391 - BLOCK
      ?auto_823392 - BLOCK
      ?auto_823393 - BLOCK
      ?auto_823394 - BLOCK
      ?auto_823395 - BLOCK
      ?auto_823396 - BLOCK
      ?auto_823397 - BLOCK
      ?auto_823398 - BLOCK
      ?auto_823399 - BLOCK
      ?auto_823400 - BLOCK
    )
    :vars
    (
      ?auto_823401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823400 ?auto_823401 ) ( ON-TABLE ?auto_823386 ) ( ON ?auto_823387 ?auto_823386 ) ( ON ?auto_823388 ?auto_823387 ) ( ON ?auto_823389 ?auto_823388 ) ( ON ?auto_823390 ?auto_823389 ) ( ON ?auto_823391 ?auto_823390 ) ( ON ?auto_823392 ?auto_823391 ) ( ON ?auto_823393 ?auto_823392 ) ( ON ?auto_823394 ?auto_823393 ) ( ON ?auto_823395 ?auto_823394 ) ( not ( = ?auto_823386 ?auto_823387 ) ) ( not ( = ?auto_823386 ?auto_823388 ) ) ( not ( = ?auto_823386 ?auto_823389 ) ) ( not ( = ?auto_823386 ?auto_823390 ) ) ( not ( = ?auto_823386 ?auto_823391 ) ) ( not ( = ?auto_823386 ?auto_823392 ) ) ( not ( = ?auto_823386 ?auto_823393 ) ) ( not ( = ?auto_823386 ?auto_823394 ) ) ( not ( = ?auto_823386 ?auto_823395 ) ) ( not ( = ?auto_823386 ?auto_823396 ) ) ( not ( = ?auto_823386 ?auto_823397 ) ) ( not ( = ?auto_823386 ?auto_823398 ) ) ( not ( = ?auto_823386 ?auto_823399 ) ) ( not ( = ?auto_823386 ?auto_823400 ) ) ( not ( = ?auto_823386 ?auto_823401 ) ) ( not ( = ?auto_823387 ?auto_823388 ) ) ( not ( = ?auto_823387 ?auto_823389 ) ) ( not ( = ?auto_823387 ?auto_823390 ) ) ( not ( = ?auto_823387 ?auto_823391 ) ) ( not ( = ?auto_823387 ?auto_823392 ) ) ( not ( = ?auto_823387 ?auto_823393 ) ) ( not ( = ?auto_823387 ?auto_823394 ) ) ( not ( = ?auto_823387 ?auto_823395 ) ) ( not ( = ?auto_823387 ?auto_823396 ) ) ( not ( = ?auto_823387 ?auto_823397 ) ) ( not ( = ?auto_823387 ?auto_823398 ) ) ( not ( = ?auto_823387 ?auto_823399 ) ) ( not ( = ?auto_823387 ?auto_823400 ) ) ( not ( = ?auto_823387 ?auto_823401 ) ) ( not ( = ?auto_823388 ?auto_823389 ) ) ( not ( = ?auto_823388 ?auto_823390 ) ) ( not ( = ?auto_823388 ?auto_823391 ) ) ( not ( = ?auto_823388 ?auto_823392 ) ) ( not ( = ?auto_823388 ?auto_823393 ) ) ( not ( = ?auto_823388 ?auto_823394 ) ) ( not ( = ?auto_823388 ?auto_823395 ) ) ( not ( = ?auto_823388 ?auto_823396 ) ) ( not ( = ?auto_823388 ?auto_823397 ) ) ( not ( = ?auto_823388 ?auto_823398 ) ) ( not ( = ?auto_823388 ?auto_823399 ) ) ( not ( = ?auto_823388 ?auto_823400 ) ) ( not ( = ?auto_823388 ?auto_823401 ) ) ( not ( = ?auto_823389 ?auto_823390 ) ) ( not ( = ?auto_823389 ?auto_823391 ) ) ( not ( = ?auto_823389 ?auto_823392 ) ) ( not ( = ?auto_823389 ?auto_823393 ) ) ( not ( = ?auto_823389 ?auto_823394 ) ) ( not ( = ?auto_823389 ?auto_823395 ) ) ( not ( = ?auto_823389 ?auto_823396 ) ) ( not ( = ?auto_823389 ?auto_823397 ) ) ( not ( = ?auto_823389 ?auto_823398 ) ) ( not ( = ?auto_823389 ?auto_823399 ) ) ( not ( = ?auto_823389 ?auto_823400 ) ) ( not ( = ?auto_823389 ?auto_823401 ) ) ( not ( = ?auto_823390 ?auto_823391 ) ) ( not ( = ?auto_823390 ?auto_823392 ) ) ( not ( = ?auto_823390 ?auto_823393 ) ) ( not ( = ?auto_823390 ?auto_823394 ) ) ( not ( = ?auto_823390 ?auto_823395 ) ) ( not ( = ?auto_823390 ?auto_823396 ) ) ( not ( = ?auto_823390 ?auto_823397 ) ) ( not ( = ?auto_823390 ?auto_823398 ) ) ( not ( = ?auto_823390 ?auto_823399 ) ) ( not ( = ?auto_823390 ?auto_823400 ) ) ( not ( = ?auto_823390 ?auto_823401 ) ) ( not ( = ?auto_823391 ?auto_823392 ) ) ( not ( = ?auto_823391 ?auto_823393 ) ) ( not ( = ?auto_823391 ?auto_823394 ) ) ( not ( = ?auto_823391 ?auto_823395 ) ) ( not ( = ?auto_823391 ?auto_823396 ) ) ( not ( = ?auto_823391 ?auto_823397 ) ) ( not ( = ?auto_823391 ?auto_823398 ) ) ( not ( = ?auto_823391 ?auto_823399 ) ) ( not ( = ?auto_823391 ?auto_823400 ) ) ( not ( = ?auto_823391 ?auto_823401 ) ) ( not ( = ?auto_823392 ?auto_823393 ) ) ( not ( = ?auto_823392 ?auto_823394 ) ) ( not ( = ?auto_823392 ?auto_823395 ) ) ( not ( = ?auto_823392 ?auto_823396 ) ) ( not ( = ?auto_823392 ?auto_823397 ) ) ( not ( = ?auto_823392 ?auto_823398 ) ) ( not ( = ?auto_823392 ?auto_823399 ) ) ( not ( = ?auto_823392 ?auto_823400 ) ) ( not ( = ?auto_823392 ?auto_823401 ) ) ( not ( = ?auto_823393 ?auto_823394 ) ) ( not ( = ?auto_823393 ?auto_823395 ) ) ( not ( = ?auto_823393 ?auto_823396 ) ) ( not ( = ?auto_823393 ?auto_823397 ) ) ( not ( = ?auto_823393 ?auto_823398 ) ) ( not ( = ?auto_823393 ?auto_823399 ) ) ( not ( = ?auto_823393 ?auto_823400 ) ) ( not ( = ?auto_823393 ?auto_823401 ) ) ( not ( = ?auto_823394 ?auto_823395 ) ) ( not ( = ?auto_823394 ?auto_823396 ) ) ( not ( = ?auto_823394 ?auto_823397 ) ) ( not ( = ?auto_823394 ?auto_823398 ) ) ( not ( = ?auto_823394 ?auto_823399 ) ) ( not ( = ?auto_823394 ?auto_823400 ) ) ( not ( = ?auto_823394 ?auto_823401 ) ) ( not ( = ?auto_823395 ?auto_823396 ) ) ( not ( = ?auto_823395 ?auto_823397 ) ) ( not ( = ?auto_823395 ?auto_823398 ) ) ( not ( = ?auto_823395 ?auto_823399 ) ) ( not ( = ?auto_823395 ?auto_823400 ) ) ( not ( = ?auto_823395 ?auto_823401 ) ) ( not ( = ?auto_823396 ?auto_823397 ) ) ( not ( = ?auto_823396 ?auto_823398 ) ) ( not ( = ?auto_823396 ?auto_823399 ) ) ( not ( = ?auto_823396 ?auto_823400 ) ) ( not ( = ?auto_823396 ?auto_823401 ) ) ( not ( = ?auto_823397 ?auto_823398 ) ) ( not ( = ?auto_823397 ?auto_823399 ) ) ( not ( = ?auto_823397 ?auto_823400 ) ) ( not ( = ?auto_823397 ?auto_823401 ) ) ( not ( = ?auto_823398 ?auto_823399 ) ) ( not ( = ?auto_823398 ?auto_823400 ) ) ( not ( = ?auto_823398 ?auto_823401 ) ) ( not ( = ?auto_823399 ?auto_823400 ) ) ( not ( = ?auto_823399 ?auto_823401 ) ) ( not ( = ?auto_823400 ?auto_823401 ) ) ( ON ?auto_823399 ?auto_823400 ) ( ON ?auto_823398 ?auto_823399 ) ( ON ?auto_823397 ?auto_823398 ) ( CLEAR ?auto_823395 ) ( ON ?auto_823396 ?auto_823397 ) ( CLEAR ?auto_823396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_823386 ?auto_823387 ?auto_823388 ?auto_823389 ?auto_823390 ?auto_823391 ?auto_823392 ?auto_823393 ?auto_823394 ?auto_823395 ?auto_823396 )
      ( MAKE-15PILE ?auto_823386 ?auto_823387 ?auto_823388 ?auto_823389 ?auto_823390 ?auto_823391 ?auto_823392 ?auto_823393 ?auto_823394 ?auto_823395 ?auto_823396 ?auto_823397 ?auto_823398 ?auto_823399 ?auto_823400 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823448 - BLOCK
      ?auto_823449 - BLOCK
      ?auto_823450 - BLOCK
      ?auto_823451 - BLOCK
      ?auto_823452 - BLOCK
      ?auto_823453 - BLOCK
      ?auto_823454 - BLOCK
      ?auto_823455 - BLOCK
      ?auto_823456 - BLOCK
      ?auto_823457 - BLOCK
      ?auto_823458 - BLOCK
      ?auto_823459 - BLOCK
      ?auto_823460 - BLOCK
      ?auto_823461 - BLOCK
      ?auto_823462 - BLOCK
    )
    :vars
    (
      ?auto_823463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823462 ?auto_823463 ) ( ON-TABLE ?auto_823448 ) ( ON ?auto_823449 ?auto_823448 ) ( ON ?auto_823450 ?auto_823449 ) ( ON ?auto_823451 ?auto_823450 ) ( ON ?auto_823452 ?auto_823451 ) ( ON ?auto_823453 ?auto_823452 ) ( ON ?auto_823454 ?auto_823453 ) ( ON ?auto_823455 ?auto_823454 ) ( ON ?auto_823456 ?auto_823455 ) ( not ( = ?auto_823448 ?auto_823449 ) ) ( not ( = ?auto_823448 ?auto_823450 ) ) ( not ( = ?auto_823448 ?auto_823451 ) ) ( not ( = ?auto_823448 ?auto_823452 ) ) ( not ( = ?auto_823448 ?auto_823453 ) ) ( not ( = ?auto_823448 ?auto_823454 ) ) ( not ( = ?auto_823448 ?auto_823455 ) ) ( not ( = ?auto_823448 ?auto_823456 ) ) ( not ( = ?auto_823448 ?auto_823457 ) ) ( not ( = ?auto_823448 ?auto_823458 ) ) ( not ( = ?auto_823448 ?auto_823459 ) ) ( not ( = ?auto_823448 ?auto_823460 ) ) ( not ( = ?auto_823448 ?auto_823461 ) ) ( not ( = ?auto_823448 ?auto_823462 ) ) ( not ( = ?auto_823448 ?auto_823463 ) ) ( not ( = ?auto_823449 ?auto_823450 ) ) ( not ( = ?auto_823449 ?auto_823451 ) ) ( not ( = ?auto_823449 ?auto_823452 ) ) ( not ( = ?auto_823449 ?auto_823453 ) ) ( not ( = ?auto_823449 ?auto_823454 ) ) ( not ( = ?auto_823449 ?auto_823455 ) ) ( not ( = ?auto_823449 ?auto_823456 ) ) ( not ( = ?auto_823449 ?auto_823457 ) ) ( not ( = ?auto_823449 ?auto_823458 ) ) ( not ( = ?auto_823449 ?auto_823459 ) ) ( not ( = ?auto_823449 ?auto_823460 ) ) ( not ( = ?auto_823449 ?auto_823461 ) ) ( not ( = ?auto_823449 ?auto_823462 ) ) ( not ( = ?auto_823449 ?auto_823463 ) ) ( not ( = ?auto_823450 ?auto_823451 ) ) ( not ( = ?auto_823450 ?auto_823452 ) ) ( not ( = ?auto_823450 ?auto_823453 ) ) ( not ( = ?auto_823450 ?auto_823454 ) ) ( not ( = ?auto_823450 ?auto_823455 ) ) ( not ( = ?auto_823450 ?auto_823456 ) ) ( not ( = ?auto_823450 ?auto_823457 ) ) ( not ( = ?auto_823450 ?auto_823458 ) ) ( not ( = ?auto_823450 ?auto_823459 ) ) ( not ( = ?auto_823450 ?auto_823460 ) ) ( not ( = ?auto_823450 ?auto_823461 ) ) ( not ( = ?auto_823450 ?auto_823462 ) ) ( not ( = ?auto_823450 ?auto_823463 ) ) ( not ( = ?auto_823451 ?auto_823452 ) ) ( not ( = ?auto_823451 ?auto_823453 ) ) ( not ( = ?auto_823451 ?auto_823454 ) ) ( not ( = ?auto_823451 ?auto_823455 ) ) ( not ( = ?auto_823451 ?auto_823456 ) ) ( not ( = ?auto_823451 ?auto_823457 ) ) ( not ( = ?auto_823451 ?auto_823458 ) ) ( not ( = ?auto_823451 ?auto_823459 ) ) ( not ( = ?auto_823451 ?auto_823460 ) ) ( not ( = ?auto_823451 ?auto_823461 ) ) ( not ( = ?auto_823451 ?auto_823462 ) ) ( not ( = ?auto_823451 ?auto_823463 ) ) ( not ( = ?auto_823452 ?auto_823453 ) ) ( not ( = ?auto_823452 ?auto_823454 ) ) ( not ( = ?auto_823452 ?auto_823455 ) ) ( not ( = ?auto_823452 ?auto_823456 ) ) ( not ( = ?auto_823452 ?auto_823457 ) ) ( not ( = ?auto_823452 ?auto_823458 ) ) ( not ( = ?auto_823452 ?auto_823459 ) ) ( not ( = ?auto_823452 ?auto_823460 ) ) ( not ( = ?auto_823452 ?auto_823461 ) ) ( not ( = ?auto_823452 ?auto_823462 ) ) ( not ( = ?auto_823452 ?auto_823463 ) ) ( not ( = ?auto_823453 ?auto_823454 ) ) ( not ( = ?auto_823453 ?auto_823455 ) ) ( not ( = ?auto_823453 ?auto_823456 ) ) ( not ( = ?auto_823453 ?auto_823457 ) ) ( not ( = ?auto_823453 ?auto_823458 ) ) ( not ( = ?auto_823453 ?auto_823459 ) ) ( not ( = ?auto_823453 ?auto_823460 ) ) ( not ( = ?auto_823453 ?auto_823461 ) ) ( not ( = ?auto_823453 ?auto_823462 ) ) ( not ( = ?auto_823453 ?auto_823463 ) ) ( not ( = ?auto_823454 ?auto_823455 ) ) ( not ( = ?auto_823454 ?auto_823456 ) ) ( not ( = ?auto_823454 ?auto_823457 ) ) ( not ( = ?auto_823454 ?auto_823458 ) ) ( not ( = ?auto_823454 ?auto_823459 ) ) ( not ( = ?auto_823454 ?auto_823460 ) ) ( not ( = ?auto_823454 ?auto_823461 ) ) ( not ( = ?auto_823454 ?auto_823462 ) ) ( not ( = ?auto_823454 ?auto_823463 ) ) ( not ( = ?auto_823455 ?auto_823456 ) ) ( not ( = ?auto_823455 ?auto_823457 ) ) ( not ( = ?auto_823455 ?auto_823458 ) ) ( not ( = ?auto_823455 ?auto_823459 ) ) ( not ( = ?auto_823455 ?auto_823460 ) ) ( not ( = ?auto_823455 ?auto_823461 ) ) ( not ( = ?auto_823455 ?auto_823462 ) ) ( not ( = ?auto_823455 ?auto_823463 ) ) ( not ( = ?auto_823456 ?auto_823457 ) ) ( not ( = ?auto_823456 ?auto_823458 ) ) ( not ( = ?auto_823456 ?auto_823459 ) ) ( not ( = ?auto_823456 ?auto_823460 ) ) ( not ( = ?auto_823456 ?auto_823461 ) ) ( not ( = ?auto_823456 ?auto_823462 ) ) ( not ( = ?auto_823456 ?auto_823463 ) ) ( not ( = ?auto_823457 ?auto_823458 ) ) ( not ( = ?auto_823457 ?auto_823459 ) ) ( not ( = ?auto_823457 ?auto_823460 ) ) ( not ( = ?auto_823457 ?auto_823461 ) ) ( not ( = ?auto_823457 ?auto_823462 ) ) ( not ( = ?auto_823457 ?auto_823463 ) ) ( not ( = ?auto_823458 ?auto_823459 ) ) ( not ( = ?auto_823458 ?auto_823460 ) ) ( not ( = ?auto_823458 ?auto_823461 ) ) ( not ( = ?auto_823458 ?auto_823462 ) ) ( not ( = ?auto_823458 ?auto_823463 ) ) ( not ( = ?auto_823459 ?auto_823460 ) ) ( not ( = ?auto_823459 ?auto_823461 ) ) ( not ( = ?auto_823459 ?auto_823462 ) ) ( not ( = ?auto_823459 ?auto_823463 ) ) ( not ( = ?auto_823460 ?auto_823461 ) ) ( not ( = ?auto_823460 ?auto_823462 ) ) ( not ( = ?auto_823460 ?auto_823463 ) ) ( not ( = ?auto_823461 ?auto_823462 ) ) ( not ( = ?auto_823461 ?auto_823463 ) ) ( not ( = ?auto_823462 ?auto_823463 ) ) ( ON ?auto_823461 ?auto_823462 ) ( ON ?auto_823460 ?auto_823461 ) ( ON ?auto_823459 ?auto_823460 ) ( ON ?auto_823458 ?auto_823459 ) ( CLEAR ?auto_823456 ) ( ON ?auto_823457 ?auto_823458 ) ( CLEAR ?auto_823457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_823448 ?auto_823449 ?auto_823450 ?auto_823451 ?auto_823452 ?auto_823453 ?auto_823454 ?auto_823455 ?auto_823456 ?auto_823457 )
      ( MAKE-15PILE ?auto_823448 ?auto_823449 ?auto_823450 ?auto_823451 ?auto_823452 ?auto_823453 ?auto_823454 ?auto_823455 ?auto_823456 ?auto_823457 ?auto_823458 ?auto_823459 ?auto_823460 ?auto_823461 ?auto_823462 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823510 - BLOCK
      ?auto_823511 - BLOCK
      ?auto_823512 - BLOCK
      ?auto_823513 - BLOCK
      ?auto_823514 - BLOCK
      ?auto_823515 - BLOCK
      ?auto_823516 - BLOCK
      ?auto_823517 - BLOCK
      ?auto_823518 - BLOCK
      ?auto_823519 - BLOCK
      ?auto_823520 - BLOCK
      ?auto_823521 - BLOCK
      ?auto_823522 - BLOCK
      ?auto_823523 - BLOCK
      ?auto_823524 - BLOCK
    )
    :vars
    (
      ?auto_823525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823524 ?auto_823525 ) ( ON-TABLE ?auto_823510 ) ( ON ?auto_823511 ?auto_823510 ) ( ON ?auto_823512 ?auto_823511 ) ( ON ?auto_823513 ?auto_823512 ) ( ON ?auto_823514 ?auto_823513 ) ( ON ?auto_823515 ?auto_823514 ) ( ON ?auto_823516 ?auto_823515 ) ( ON ?auto_823517 ?auto_823516 ) ( not ( = ?auto_823510 ?auto_823511 ) ) ( not ( = ?auto_823510 ?auto_823512 ) ) ( not ( = ?auto_823510 ?auto_823513 ) ) ( not ( = ?auto_823510 ?auto_823514 ) ) ( not ( = ?auto_823510 ?auto_823515 ) ) ( not ( = ?auto_823510 ?auto_823516 ) ) ( not ( = ?auto_823510 ?auto_823517 ) ) ( not ( = ?auto_823510 ?auto_823518 ) ) ( not ( = ?auto_823510 ?auto_823519 ) ) ( not ( = ?auto_823510 ?auto_823520 ) ) ( not ( = ?auto_823510 ?auto_823521 ) ) ( not ( = ?auto_823510 ?auto_823522 ) ) ( not ( = ?auto_823510 ?auto_823523 ) ) ( not ( = ?auto_823510 ?auto_823524 ) ) ( not ( = ?auto_823510 ?auto_823525 ) ) ( not ( = ?auto_823511 ?auto_823512 ) ) ( not ( = ?auto_823511 ?auto_823513 ) ) ( not ( = ?auto_823511 ?auto_823514 ) ) ( not ( = ?auto_823511 ?auto_823515 ) ) ( not ( = ?auto_823511 ?auto_823516 ) ) ( not ( = ?auto_823511 ?auto_823517 ) ) ( not ( = ?auto_823511 ?auto_823518 ) ) ( not ( = ?auto_823511 ?auto_823519 ) ) ( not ( = ?auto_823511 ?auto_823520 ) ) ( not ( = ?auto_823511 ?auto_823521 ) ) ( not ( = ?auto_823511 ?auto_823522 ) ) ( not ( = ?auto_823511 ?auto_823523 ) ) ( not ( = ?auto_823511 ?auto_823524 ) ) ( not ( = ?auto_823511 ?auto_823525 ) ) ( not ( = ?auto_823512 ?auto_823513 ) ) ( not ( = ?auto_823512 ?auto_823514 ) ) ( not ( = ?auto_823512 ?auto_823515 ) ) ( not ( = ?auto_823512 ?auto_823516 ) ) ( not ( = ?auto_823512 ?auto_823517 ) ) ( not ( = ?auto_823512 ?auto_823518 ) ) ( not ( = ?auto_823512 ?auto_823519 ) ) ( not ( = ?auto_823512 ?auto_823520 ) ) ( not ( = ?auto_823512 ?auto_823521 ) ) ( not ( = ?auto_823512 ?auto_823522 ) ) ( not ( = ?auto_823512 ?auto_823523 ) ) ( not ( = ?auto_823512 ?auto_823524 ) ) ( not ( = ?auto_823512 ?auto_823525 ) ) ( not ( = ?auto_823513 ?auto_823514 ) ) ( not ( = ?auto_823513 ?auto_823515 ) ) ( not ( = ?auto_823513 ?auto_823516 ) ) ( not ( = ?auto_823513 ?auto_823517 ) ) ( not ( = ?auto_823513 ?auto_823518 ) ) ( not ( = ?auto_823513 ?auto_823519 ) ) ( not ( = ?auto_823513 ?auto_823520 ) ) ( not ( = ?auto_823513 ?auto_823521 ) ) ( not ( = ?auto_823513 ?auto_823522 ) ) ( not ( = ?auto_823513 ?auto_823523 ) ) ( not ( = ?auto_823513 ?auto_823524 ) ) ( not ( = ?auto_823513 ?auto_823525 ) ) ( not ( = ?auto_823514 ?auto_823515 ) ) ( not ( = ?auto_823514 ?auto_823516 ) ) ( not ( = ?auto_823514 ?auto_823517 ) ) ( not ( = ?auto_823514 ?auto_823518 ) ) ( not ( = ?auto_823514 ?auto_823519 ) ) ( not ( = ?auto_823514 ?auto_823520 ) ) ( not ( = ?auto_823514 ?auto_823521 ) ) ( not ( = ?auto_823514 ?auto_823522 ) ) ( not ( = ?auto_823514 ?auto_823523 ) ) ( not ( = ?auto_823514 ?auto_823524 ) ) ( not ( = ?auto_823514 ?auto_823525 ) ) ( not ( = ?auto_823515 ?auto_823516 ) ) ( not ( = ?auto_823515 ?auto_823517 ) ) ( not ( = ?auto_823515 ?auto_823518 ) ) ( not ( = ?auto_823515 ?auto_823519 ) ) ( not ( = ?auto_823515 ?auto_823520 ) ) ( not ( = ?auto_823515 ?auto_823521 ) ) ( not ( = ?auto_823515 ?auto_823522 ) ) ( not ( = ?auto_823515 ?auto_823523 ) ) ( not ( = ?auto_823515 ?auto_823524 ) ) ( not ( = ?auto_823515 ?auto_823525 ) ) ( not ( = ?auto_823516 ?auto_823517 ) ) ( not ( = ?auto_823516 ?auto_823518 ) ) ( not ( = ?auto_823516 ?auto_823519 ) ) ( not ( = ?auto_823516 ?auto_823520 ) ) ( not ( = ?auto_823516 ?auto_823521 ) ) ( not ( = ?auto_823516 ?auto_823522 ) ) ( not ( = ?auto_823516 ?auto_823523 ) ) ( not ( = ?auto_823516 ?auto_823524 ) ) ( not ( = ?auto_823516 ?auto_823525 ) ) ( not ( = ?auto_823517 ?auto_823518 ) ) ( not ( = ?auto_823517 ?auto_823519 ) ) ( not ( = ?auto_823517 ?auto_823520 ) ) ( not ( = ?auto_823517 ?auto_823521 ) ) ( not ( = ?auto_823517 ?auto_823522 ) ) ( not ( = ?auto_823517 ?auto_823523 ) ) ( not ( = ?auto_823517 ?auto_823524 ) ) ( not ( = ?auto_823517 ?auto_823525 ) ) ( not ( = ?auto_823518 ?auto_823519 ) ) ( not ( = ?auto_823518 ?auto_823520 ) ) ( not ( = ?auto_823518 ?auto_823521 ) ) ( not ( = ?auto_823518 ?auto_823522 ) ) ( not ( = ?auto_823518 ?auto_823523 ) ) ( not ( = ?auto_823518 ?auto_823524 ) ) ( not ( = ?auto_823518 ?auto_823525 ) ) ( not ( = ?auto_823519 ?auto_823520 ) ) ( not ( = ?auto_823519 ?auto_823521 ) ) ( not ( = ?auto_823519 ?auto_823522 ) ) ( not ( = ?auto_823519 ?auto_823523 ) ) ( not ( = ?auto_823519 ?auto_823524 ) ) ( not ( = ?auto_823519 ?auto_823525 ) ) ( not ( = ?auto_823520 ?auto_823521 ) ) ( not ( = ?auto_823520 ?auto_823522 ) ) ( not ( = ?auto_823520 ?auto_823523 ) ) ( not ( = ?auto_823520 ?auto_823524 ) ) ( not ( = ?auto_823520 ?auto_823525 ) ) ( not ( = ?auto_823521 ?auto_823522 ) ) ( not ( = ?auto_823521 ?auto_823523 ) ) ( not ( = ?auto_823521 ?auto_823524 ) ) ( not ( = ?auto_823521 ?auto_823525 ) ) ( not ( = ?auto_823522 ?auto_823523 ) ) ( not ( = ?auto_823522 ?auto_823524 ) ) ( not ( = ?auto_823522 ?auto_823525 ) ) ( not ( = ?auto_823523 ?auto_823524 ) ) ( not ( = ?auto_823523 ?auto_823525 ) ) ( not ( = ?auto_823524 ?auto_823525 ) ) ( ON ?auto_823523 ?auto_823524 ) ( ON ?auto_823522 ?auto_823523 ) ( ON ?auto_823521 ?auto_823522 ) ( ON ?auto_823520 ?auto_823521 ) ( ON ?auto_823519 ?auto_823520 ) ( CLEAR ?auto_823517 ) ( ON ?auto_823518 ?auto_823519 ) ( CLEAR ?auto_823518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_823510 ?auto_823511 ?auto_823512 ?auto_823513 ?auto_823514 ?auto_823515 ?auto_823516 ?auto_823517 ?auto_823518 )
      ( MAKE-15PILE ?auto_823510 ?auto_823511 ?auto_823512 ?auto_823513 ?auto_823514 ?auto_823515 ?auto_823516 ?auto_823517 ?auto_823518 ?auto_823519 ?auto_823520 ?auto_823521 ?auto_823522 ?auto_823523 ?auto_823524 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823572 - BLOCK
      ?auto_823573 - BLOCK
      ?auto_823574 - BLOCK
      ?auto_823575 - BLOCK
      ?auto_823576 - BLOCK
      ?auto_823577 - BLOCK
      ?auto_823578 - BLOCK
      ?auto_823579 - BLOCK
      ?auto_823580 - BLOCK
      ?auto_823581 - BLOCK
      ?auto_823582 - BLOCK
      ?auto_823583 - BLOCK
      ?auto_823584 - BLOCK
      ?auto_823585 - BLOCK
      ?auto_823586 - BLOCK
    )
    :vars
    (
      ?auto_823587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823586 ?auto_823587 ) ( ON-TABLE ?auto_823572 ) ( ON ?auto_823573 ?auto_823572 ) ( ON ?auto_823574 ?auto_823573 ) ( ON ?auto_823575 ?auto_823574 ) ( ON ?auto_823576 ?auto_823575 ) ( ON ?auto_823577 ?auto_823576 ) ( ON ?auto_823578 ?auto_823577 ) ( not ( = ?auto_823572 ?auto_823573 ) ) ( not ( = ?auto_823572 ?auto_823574 ) ) ( not ( = ?auto_823572 ?auto_823575 ) ) ( not ( = ?auto_823572 ?auto_823576 ) ) ( not ( = ?auto_823572 ?auto_823577 ) ) ( not ( = ?auto_823572 ?auto_823578 ) ) ( not ( = ?auto_823572 ?auto_823579 ) ) ( not ( = ?auto_823572 ?auto_823580 ) ) ( not ( = ?auto_823572 ?auto_823581 ) ) ( not ( = ?auto_823572 ?auto_823582 ) ) ( not ( = ?auto_823572 ?auto_823583 ) ) ( not ( = ?auto_823572 ?auto_823584 ) ) ( not ( = ?auto_823572 ?auto_823585 ) ) ( not ( = ?auto_823572 ?auto_823586 ) ) ( not ( = ?auto_823572 ?auto_823587 ) ) ( not ( = ?auto_823573 ?auto_823574 ) ) ( not ( = ?auto_823573 ?auto_823575 ) ) ( not ( = ?auto_823573 ?auto_823576 ) ) ( not ( = ?auto_823573 ?auto_823577 ) ) ( not ( = ?auto_823573 ?auto_823578 ) ) ( not ( = ?auto_823573 ?auto_823579 ) ) ( not ( = ?auto_823573 ?auto_823580 ) ) ( not ( = ?auto_823573 ?auto_823581 ) ) ( not ( = ?auto_823573 ?auto_823582 ) ) ( not ( = ?auto_823573 ?auto_823583 ) ) ( not ( = ?auto_823573 ?auto_823584 ) ) ( not ( = ?auto_823573 ?auto_823585 ) ) ( not ( = ?auto_823573 ?auto_823586 ) ) ( not ( = ?auto_823573 ?auto_823587 ) ) ( not ( = ?auto_823574 ?auto_823575 ) ) ( not ( = ?auto_823574 ?auto_823576 ) ) ( not ( = ?auto_823574 ?auto_823577 ) ) ( not ( = ?auto_823574 ?auto_823578 ) ) ( not ( = ?auto_823574 ?auto_823579 ) ) ( not ( = ?auto_823574 ?auto_823580 ) ) ( not ( = ?auto_823574 ?auto_823581 ) ) ( not ( = ?auto_823574 ?auto_823582 ) ) ( not ( = ?auto_823574 ?auto_823583 ) ) ( not ( = ?auto_823574 ?auto_823584 ) ) ( not ( = ?auto_823574 ?auto_823585 ) ) ( not ( = ?auto_823574 ?auto_823586 ) ) ( not ( = ?auto_823574 ?auto_823587 ) ) ( not ( = ?auto_823575 ?auto_823576 ) ) ( not ( = ?auto_823575 ?auto_823577 ) ) ( not ( = ?auto_823575 ?auto_823578 ) ) ( not ( = ?auto_823575 ?auto_823579 ) ) ( not ( = ?auto_823575 ?auto_823580 ) ) ( not ( = ?auto_823575 ?auto_823581 ) ) ( not ( = ?auto_823575 ?auto_823582 ) ) ( not ( = ?auto_823575 ?auto_823583 ) ) ( not ( = ?auto_823575 ?auto_823584 ) ) ( not ( = ?auto_823575 ?auto_823585 ) ) ( not ( = ?auto_823575 ?auto_823586 ) ) ( not ( = ?auto_823575 ?auto_823587 ) ) ( not ( = ?auto_823576 ?auto_823577 ) ) ( not ( = ?auto_823576 ?auto_823578 ) ) ( not ( = ?auto_823576 ?auto_823579 ) ) ( not ( = ?auto_823576 ?auto_823580 ) ) ( not ( = ?auto_823576 ?auto_823581 ) ) ( not ( = ?auto_823576 ?auto_823582 ) ) ( not ( = ?auto_823576 ?auto_823583 ) ) ( not ( = ?auto_823576 ?auto_823584 ) ) ( not ( = ?auto_823576 ?auto_823585 ) ) ( not ( = ?auto_823576 ?auto_823586 ) ) ( not ( = ?auto_823576 ?auto_823587 ) ) ( not ( = ?auto_823577 ?auto_823578 ) ) ( not ( = ?auto_823577 ?auto_823579 ) ) ( not ( = ?auto_823577 ?auto_823580 ) ) ( not ( = ?auto_823577 ?auto_823581 ) ) ( not ( = ?auto_823577 ?auto_823582 ) ) ( not ( = ?auto_823577 ?auto_823583 ) ) ( not ( = ?auto_823577 ?auto_823584 ) ) ( not ( = ?auto_823577 ?auto_823585 ) ) ( not ( = ?auto_823577 ?auto_823586 ) ) ( not ( = ?auto_823577 ?auto_823587 ) ) ( not ( = ?auto_823578 ?auto_823579 ) ) ( not ( = ?auto_823578 ?auto_823580 ) ) ( not ( = ?auto_823578 ?auto_823581 ) ) ( not ( = ?auto_823578 ?auto_823582 ) ) ( not ( = ?auto_823578 ?auto_823583 ) ) ( not ( = ?auto_823578 ?auto_823584 ) ) ( not ( = ?auto_823578 ?auto_823585 ) ) ( not ( = ?auto_823578 ?auto_823586 ) ) ( not ( = ?auto_823578 ?auto_823587 ) ) ( not ( = ?auto_823579 ?auto_823580 ) ) ( not ( = ?auto_823579 ?auto_823581 ) ) ( not ( = ?auto_823579 ?auto_823582 ) ) ( not ( = ?auto_823579 ?auto_823583 ) ) ( not ( = ?auto_823579 ?auto_823584 ) ) ( not ( = ?auto_823579 ?auto_823585 ) ) ( not ( = ?auto_823579 ?auto_823586 ) ) ( not ( = ?auto_823579 ?auto_823587 ) ) ( not ( = ?auto_823580 ?auto_823581 ) ) ( not ( = ?auto_823580 ?auto_823582 ) ) ( not ( = ?auto_823580 ?auto_823583 ) ) ( not ( = ?auto_823580 ?auto_823584 ) ) ( not ( = ?auto_823580 ?auto_823585 ) ) ( not ( = ?auto_823580 ?auto_823586 ) ) ( not ( = ?auto_823580 ?auto_823587 ) ) ( not ( = ?auto_823581 ?auto_823582 ) ) ( not ( = ?auto_823581 ?auto_823583 ) ) ( not ( = ?auto_823581 ?auto_823584 ) ) ( not ( = ?auto_823581 ?auto_823585 ) ) ( not ( = ?auto_823581 ?auto_823586 ) ) ( not ( = ?auto_823581 ?auto_823587 ) ) ( not ( = ?auto_823582 ?auto_823583 ) ) ( not ( = ?auto_823582 ?auto_823584 ) ) ( not ( = ?auto_823582 ?auto_823585 ) ) ( not ( = ?auto_823582 ?auto_823586 ) ) ( not ( = ?auto_823582 ?auto_823587 ) ) ( not ( = ?auto_823583 ?auto_823584 ) ) ( not ( = ?auto_823583 ?auto_823585 ) ) ( not ( = ?auto_823583 ?auto_823586 ) ) ( not ( = ?auto_823583 ?auto_823587 ) ) ( not ( = ?auto_823584 ?auto_823585 ) ) ( not ( = ?auto_823584 ?auto_823586 ) ) ( not ( = ?auto_823584 ?auto_823587 ) ) ( not ( = ?auto_823585 ?auto_823586 ) ) ( not ( = ?auto_823585 ?auto_823587 ) ) ( not ( = ?auto_823586 ?auto_823587 ) ) ( ON ?auto_823585 ?auto_823586 ) ( ON ?auto_823584 ?auto_823585 ) ( ON ?auto_823583 ?auto_823584 ) ( ON ?auto_823582 ?auto_823583 ) ( ON ?auto_823581 ?auto_823582 ) ( ON ?auto_823580 ?auto_823581 ) ( CLEAR ?auto_823578 ) ( ON ?auto_823579 ?auto_823580 ) ( CLEAR ?auto_823579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_823572 ?auto_823573 ?auto_823574 ?auto_823575 ?auto_823576 ?auto_823577 ?auto_823578 ?auto_823579 )
      ( MAKE-15PILE ?auto_823572 ?auto_823573 ?auto_823574 ?auto_823575 ?auto_823576 ?auto_823577 ?auto_823578 ?auto_823579 ?auto_823580 ?auto_823581 ?auto_823582 ?auto_823583 ?auto_823584 ?auto_823585 ?auto_823586 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823634 - BLOCK
      ?auto_823635 - BLOCK
      ?auto_823636 - BLOCK
      ?auto_823637 - BLOCK
      ?auto_823638 - BLOCK
      ?auto_823639 - BLOCK
      ?auto_823640 - BLOCK
      ?auto_823641 - BLOCK
      ?auto_823642 - BLOCK
      ?auto_823643 - BLOCK
      ?auto_823644 - BLOCK
      ?auto_823645 - BLOCK
      ?auto_823646 - BLOCK
      ?auto_823647 - BLOCK
      ?auto_823648 - BLOCK
    )
    :vars
    (
      ?auto_823649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823648 ?auto_823649 ) ( ON-TABLE ?auto_823634 ) ( ON ?auto_823635 ?auto_823634 ) ( ON ?auto_823636 ?auto_823635 ) ( ON ?auto_823637 ?auto_823636 ) ( ON ?auto_823638 ?auto_823637 ) ( ON ?auto_823639 ?auto_823638 ) ( not ( = ?auto_823634 ?auto_823635 ) ) ( not ( = ?auto_823634 ?auto_823636 ) ) ( not ( = ?auto_823634 ?auto_823637 ) ) ( not ( = ?auto_823634 ?auto_823638 ) ) ( not ( = ?auto_823634 ?auto_823639 ) ) ( not ( = ?auto_823634 ?auto_823640 ) ) ( not ( = ?auto_823634 ?auto_823641 ) ) ( not ( = ?auto_823634 ?auto_823642 ) ) ( not ( = ?auto_823634 ?auto_823643 ) ) ( not ( = ?auto_823634 ?auto_823644 ) ) ( not ( = ?auto_823634 ?auto_823645 ) ) ( not ( = ?auto_823634 ?auto_823646 ) ) ( not ( = ?auto_823634 ?auto_823647 ) ) ( not ( = ?auto_823634 ?auto_823648 ) ) ( not ( = ?auto_823634 ?auto_823649 ) ) ( not ( = ?auto_823635 ?auto_823636 ) ) ( not ( = ?auto_823635 ?auto_823637 ) ) ( not ( = ?auto_823635 ?auto_823638 ) ) ( not ( = ?auto_823635 ?auto_823639 ) ) ( not ( = ?auto_823635 ?auto_823640 ) ) ( not ( = ?auto_823635 ?auto_823641 ) ) ( not ( = ?auto_823635 ?auto_823642 ) ) ( not ( = ?auto_823635 ?auto_823643 ) ) ( not ( = ?auto_823635 ?auto_823644 ) ) ( not ( = ?auto_823635 ?auto_823645 ) ) ( not ( = ?auto_823635 ?auto_823646 ) ) ( not ( = ?auto_823635 ?auto_823647 ) ) ( not ( = ?auto_823635 ?auto_823648 ) ) ( not ( = ?auto_823635 ?auto_823649 ) ) ( not ( = ?auto_823636 ?auto_823637 ) ) ( not ( = ?auto_823636 ?auto_823638 ) ) ( not ( = ?auto_823636 ?auto_823639 ) ) ( not ( = ?auto_823636 ?auto_823640 ) ) ( not ( = ?auto_823636 ?auto_823641 ) ) ( not ( = ?auto_823636 ?auto_823642 ) ) ( not ( = ?auto_823636 ?auto_823643 ) ) ( not ( = ?auto_823636 ?auto_823644 ) ) ( not ( = ?auto_823636 ?auto_823645 ) ) ( not ( = ?auto_823636 ?auto_823646 ) ) ( not ( = ?auto_823636 ?auto_823647 ) ) ( not ( = ?auto_823636 ?auto_823648 ) ) ( not ( = ?auto_823636 ?auto_823649 ) ) ( not ( = ?auto_823637 ?auto_823638 ) ) ( not ( = ?auto_823637 ?auto_823639 ) ) ( not ( = ?auto_823637 ?auto_823640 ) ) ( not ( = ?auto_823637 ?auto_823641 ) ) ( not ( = ?auto_823637 ?auto_823642 ) ) ( not ( = ?auto_823637 ?auto_823643 ) ) ( not ( = ?auto_823637 ?auto_823644 ) ) ( not ( = ?auto_823637 ?auto_823645 ) ) ( not ( = ?auto_823637 ?auto_823646 ) ) ( not ( = ?auto_823637 ?auto_823647 ) ) ( not ( = ?auto_823637 ?auto_823648 ) ) ( not ( = ?auto_823637 ?auto_823649 ) ) ( not ( = ?auto_823638 ?auto_823639 ) ) ( not ( = ?auto_823638 ?auto_823640 ) ) ( not ( = ?auto_823638 ?auto_823641 ) ) ( not ( = ?auto_823638 ?auto_823642 ) ) ( not ( = ?auto_823638 ?auto_823643 ) ) ( not ( = ?auto_823638 ?auto_823644 ) ) ( not ( = ?auto_823638 ?auto_823645 ) ) ( not ( = ?auto_823638 ?auto_823646 ) ) ( not ( = ?auto_823638 ?auto_823647 ) ) ( not ( = ?auto_823638 ?auto_823648 ) ) ( not ( = ?auto_823638 ?auto_823649 ) ) ( not ( = ?auto_823639 ?auto_823640 ) ) ( not ( = ?auto_823639 ?auto_823641 ) ) ( not ( = ?auto_823639 ?auto_823642 ) ) ( not ( = ?auto_823639 ?auto_823643 ) ) ( not ( = ?auto_823639 ?auto_823644 ) ) ( not ( = ?auto_823639 ?auto_823645 ) ) ( not ( = ?auto_823639 ?auto_823646 ) ) ( not ( = ?auto_823639 ?auto_823647 ) ) ( not ( = ?auto_823639 ?auto_823648 ) ) ( not ( = ?auto_823639 ?auto_823649 ) ) ( not ( = ?auto_823640 ?auto_823641 ) ) ( not ( = ?auto_823640 ?auto_823642 ) ) ( not ( = ?auto_823640 ?auto_823643 ) ) ( not ( = ?auto_823640 ?auto_823644 ) ) ( not ( = ?auto_823640 ?auto_823645 ) ) ( not ( = ?auto_823640 ?auto_823646 ) ) ( not ( = ?auto_823640 ?auto_823647 ) ) ( not ( = ?auto_823640 ?auto_823648 ) ) ( not ( = ?auto_823640 ?auto_823649 ) ) ( not ( = ?auto_823641 ?auto_823642 ) ) ( not ( = ?auto_823641 ?auto_823643 ) ) ( not ( = ?auto_823641 ?auto_823644 ) ) ( not ( = ?auto_823641 ?auto_823645 ) ) ( not ( = ?auto_823641 ?auto_823646 ) ) ( not ( = ?auto_823641 ?auto_823647 ) ) ( not ( = ?auto_823641 ?auto_823648 ) ) ( not ( = ?auto_823641 ?auto_823649 ) ) ( not ( = ?auto_823642 ?auto_823643 ) ) ( not ( = ?auto_823642 ?auto_823644 ) ) ( not ( = ?auto_823642 ?auto_823645 ) ) ( not ( = ?auto_823642 ?auto_823646 ) ) ( not ( = ?auto_823642 ?auto_823647 ) ) ( not ( = ?auto_823642 ?auto_823648 ) ) ( not ( = ?auto_823642 ?auto_823649 ) ) ( not ( = ?auto_823643 ?auto_823644 ) ) ( not ( = ?auto_823643 ?auto_823645 ) ) ( not ( = ?auto_823643 ?auto_823646 ) ) ( not ( = ?auto_823643 ?auto_823647 ) ) ( not ( = ?auto_823643 ?auto_823648 ) ) ( not ( = ?auto_823643 ?auto_823649 ) ) ( not ( = ?auto_823644 ?auto_823645 ) ) ( not ( = ?auto_823644 ?auto_823646 ) ) ( not ( = ?auto_823644 ?auto_823647 ) ) ( not ( = ?auto_823644 ?auto_823648 ) ) ( not ( = ?auto_823644 ?auto_823649 ) ) ( not ( = ?auto_823645 ?auto_823646 ) ) ( not ( = ?auto_823645 ?auto_823647 ) ) ( not ( = ?auto_823645 ?auto_823648 ) ) ( not ( = ?auto_823645 ?auto_823649 ) ) ( not ( = ?auto_823646 ?auto_823647 ) ) ( not ( = ?auto_823646 ?auto_823648 ) ) ( not ( = ?auto_823646 ?auto_823649 ) ) ( not ( = ?auto_823647 ?auto_823648 ) ) ( not ( = ?auto_823647 ?auto_823649 ) ) ( not ( = ?auto_823648 ?auto_823649 ) ) ( ON ?auto_823647 ?auto_823648 ) ( ON ?auto_823646 ?auto_823647 ) ( ON ?auto_823645 ?auto_823646 ) ( ON ?auto_823644 ?auto_823645 ) ( ON ?auto_823643 ?auto_823644 ) ( ON ?auto_823642 ?auto_823643 ) ( ON ?auto_823641 ?auto_823642 ) ( CLEAR ?auto_823639 ) ( ON ?auto_823640 ?auto_823641 ) ( CLEAR ?auto_823640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_823634 ?auto_823635 ?auto_823636 ?auto_823637 ?auto_823638 ?auto_823639 ?auto_823640 )
      ( MAKE-15PILE ?auto_823634 ?auto_823635 ?auto_823636 ?auto_823637 ?auto_823638 ?auto_823639 ?auto_823640 ?auto_823641 ?auto_823642 ?auto_823643 ?auto_823644 ?auto_823645 ?auto_823646 ?auto_823647 ?auto_823648 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823696 - BLOCK
      ?auto_823697 - BLOCK
      ?auto_823698 - BLOCK
      ?auto_823699 - BLOCK
      ?auto_823700 - BLOCK
      ?auto_823701 - BLOCK
      ?auto_823702 - BLOCK
      ?auto_823703 - BLOCK
      ?auto_823704 - BLOCK
      ?auto_823705 - BLOCK
      ?auto_823706 - BLOCK
      ?auto_823707 - BLOCK
      ?auto_823708 - BLOCK
      ?auto_823709 - BLOCK
      ?auto_823710 - BLOCK
    )
    :vars
    (
      ?auto_823711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823710 ?auto_823711 ) ( ON-TABLE ?auto_823696 ) ( ON ?auto_823697 ?auto_823696 ) ( ON ?auto_823698 ?auto_823697 ) ( ON ?auto_823699 ?auto_823698 ) ( ON ?auto_823700 ?auto_823699 ) ( not ( = ?auto_823696 ?auto_823697 ) ) ( not ( = ?auto_823696 ?auto_823698 ) ) ( not ( = ?auto_823696 ?auto_823699 ) ) ( not ( = ?auto_823696 ?auto_823700 ) ) ( not ( = ?auto_823696 ?auto_823701 ) ) ( not ( = ?auto_823696 ?auto_823702 ) ) ( not ( = ?auto_823696 ?auto_823703 ) ) ( not ( = ?auto_823696 ?auto_823704 ) ) ( not ( = ?auto_823696 ?auto_823705 ) ) ( not ( = ?auto_823696 ?auto_823706 ) ) ( not ( = ?auto_823696 ?auto_823707 ) ) ( not ( = ?auto_823696 ?auto_823708 ) ) ( not ( = ?auto_823696 ?auto_823709 ) ) ( not ( = ?auto_823696 ?auto_823710 ) ) ( not ( = ?auto_823696 ?auto_823711 ) ) ( not ( = ?auto_823697 ?auto_823698 ) ) ( not ( = ?auto_823697 ?auto_823699 ) ) ( not ( = ?auto_823697 ?auto_823700 ) ) ( not ( = ?auto_823697 ?auto_823701 ) ) ( not ( = ?auto_823697 ?auto_823702 ) ) ( not ( = ?auto_823697 ?auto_823703 ) ) ( not ( = ?auto_823697 ?auto_823704 ) ) ( not ( = ?auto_823697 ?auto_823705 ) ) ( not ( = ?auto_823697 ?auto_823706 ) ) ( not ( = ?auto_823697 ?auto_823707 ) ) ( not ( = ?auto_823697 ?auto_823708 ) ) ( not ( = ?auto_823697 ?auto_823709 ) ) ( not ( = ?auto_823697 ?auto_823710 ) ) ( not ( = ?auto_823697 ?auto_823711 ) ) ( not ( = ?auto_823698 ?auto_823699 ) ) ( not ( = ?auto_823698 ?auto_823700 ) ) ( not ( = ?auto_823698 ?auto_823701 ) ) ( not ( = ?auto_823698 ?auto_823702 ) ) ( not ( = ?auto_823698 ?auto_823703 ) ) ( not ( = ?auto_823698 ?auto_823704 ) ) ( not ( = ?auto_823698 ?auto_823705 ) ) ( not ( = ?auto_823698 ?auto_823706 ) ) ( not ( = ?auto_823698 ?auto_823707 ) ) ( not ( = ?auto_823698 ?auto_823708 ) ) ( not ( = ?auto_823698 ?auto_823709 ) ) ( not ( = ?auto_823698 ?auto_823710 ) ) ( not ( = ?auto_823698 ?auto_823711 ) ) ( not ( = ?auto_823699 ?auto_823700 ) ) ( not ( = ?auto_823699 ?auto_823701 ) ) ( not ( = ?auto_823699 ?auto_823702 ) ) ( not ( = ?auto_823699 ?auto_823703 ) ) ( not ( = ?auto_823699 ?auto_823704 ) ) ( not ( = ?auto_823699 ?auto_823705 ) ) ( not ( = ?auto_823699 ?auto_823706 ) ) ( not ( = ?auto_823699 ?auto_823707 ) ) ( not ( = ?auto_823699 ?auto_823708 ) ) ( not ( = ?auto_823699 ?auto_823709 ) ) ( not ( = ?auto_823699 ?auto_823710 ) ) ( not ( = ?auto_823699 ?auto_823711 ) ) ( not ( = ?auto_823700 ?auto_823701 ) ) ( not ( = ?auto_823700 ?auto_823702 ) ) ( not ( = ?auto_823700 ?auto_823703 ) ) ( not ( = ?auto_823700 ?auto_823704 ) ) ( not ( = ?auto_823700 ?auto_823705 ) ) ( not ( = ?auto_823700 ?auto_823706 ) ) ( not ( = ?auto_823700 ?auto_823707 ) ) ( not ( = ?auto_823700 ?auto_823708 ) ) ( not ( = ?auto_823700 ?auto_823709 ) ) ( not ( = ?auto_823700 ?auto_823710 ) ) ( not ( = ?auto_823700 ?auto_823711 ) ) ( not ( = ?auto_823701 ?auto_823702 ) ) ( not ( = ?auto_823701 ?auto_823703 ) ) ( not ( = ?auto_823701 ?auto_823704 ) ) ( not ( = ?auto_823701 ?auto_823705 ) ) ( not ( = ?auto_823701 ?auto_823706 ) ) ( not ( = ?auto_823701 ?auto_823707 ) ) ( not ( = ?auto_823701 ?auto_823708 ) ) ( not ( = ?auto_823701 ?auto_823709 ) ) ( not ( = ?auto_823701 ?auto_823710 ) ) ( not ( = ?auto_823701 ?auto_823711 ) ) ( not ( = ?auto_823702 ?auto_823703 ) ) ( not ( = ?auto_823702 ?auto_823704 ) ) ( not ( = ?auto_823702 ?auto_823705 ) ) ( not ( = ?auto_823702 ?auto_823706 ) ) ( not ( = ?auto_823702 ?auto_823707 ) ) ( not ( = ?auto_823702 ?auto_823708 ) ) ( not ( = ?auto_823702 ?auto_823709 ) ) ( not ( = ?auto_823702 ?auto_823710 ) ) ( not ( = ?auto_823702 ?auto_823711 ) ) ( not ( = ?auto_823703 ?auto_823704 ) ) ( not ( = ?auto_823703 ?auto_823705 ) ) ( not ( = ?auto_823703 ?auto_823706 ) ) ( not ( = ?auto_823703 ?auto_823707 ) ) ( not ( = ?auto_823703 ?auto_823708 ) ) ( not ( = ?auto_823703 ?auto_823709 ) ) ( not ( = ?auto_823703 ?auto_823710 ) ) ( not ( = ?auto_823703 ?auto_823711 ) ) ( not ( = ?auto_823704 ?auto_823705 ) ) ( not ( = ?auto_823704 ?auto_823706 ) ) ( not ( = ?auto_823704 ?auto_823707 ) ) ( not ( = ?auto_823704 ?auto_823708 ) ) ( not ( = ?auto_823704 ?auto_823709 ) ) ( not ( = ?auto_823704 ?auto_823710 ) ) ( not ( = ?auto_823704 ?auto_823711 ) ) ( not ( = ?auto_823705 ?auto_823706 ) ) ( not ( = ?auto_823705 ?auto_823707 ) ) ( not ( = ?auto_823705 ?auto_823708 ) ) ( not ( = ?auto_823705 ?auto_823709 ) ) ( not ( = ?auto_823705 ?auto_823710 ) ) ( not ( = ?auto_823705 ?auto_823711 ) ) ( not ( = ?auto_823706 ?auto_823707 ) ) ( not ( = ?auto_823706 ?auto_823708 ) ) ( not ( = ?auto_823706 ?auto_823709 ) ) ( not ( = ?auto_823706 ?auto_823710 ) ) ( not ( = ?auto_823706 ?auto_823711 ) ) ( not ( = ?auto_823707 ?auto_823708 ) ) ( not ( = ?auto_823707 ?auto_823709 ) ) ( not ( = ?auto_823707 ?auto_823710 ) ) ( not ( = ?auto_823707 ?auto_823711 ) ) ( not ( = ?auto_823708 ?auto_823709 ) ) ( not ( = ?auto_823708 ?auto_823710 ) ) ( not ( = ?auto_823708 ?auto_823711 ) ) ( not ( = ?auto_823709 ?auto_823710 ) ) ( not ( = ?auto_823709 ?auto_823711 ) ) ( not ( = ?auto_823710 ?auto_823711 ) ) ( ON ?auto_823709 ?auto_823710 ) ( ON ?auto_823708 ?auto_823709 ) ( ON ?auto_823707 ?auto_823708 ) ( ON ?auto_823706 ?auto_823707 ) ( ON ?auto_823705 ?auto_823706 ) ( ON ?auto_823704 ?auto_823705 ) ( ON ?auto_823703 ?auto_823704 ) ( ON ?auto_823702 ?auto_823703 ) ( CLEAR ?auto_823700 ) ( ON ?auto_823701 ?auto_823702 ) ( CLEAR ?auto_823701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_823696 ?auto_823697 ?auto_823698 ?auto_823699 ?auto_823700 ?auto_823701 )
      ( MAKE-15PILE ?auto_823696 ?auto_823697 ?auto_823698 ?auto_823699 ?auto_823700 ?auto_823701 ?auto_823702 ?auto_823703 ?auto_823704 ?auto_823705 ?auto_823706 ?auto_823707 ?auto_823708 ?auto_823709 ?auto_823710 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823758 - BLOCK
      ?auto_823759 - BLOCK
      ?auto_823760 - BLOCK
      ?auto_823761 - BLOCK
      ?auto_823762 - BLOCK
      ?auto_823763 - BLOCK
      ?auto_823764 - BLOCK
      ?auto_823765 - BLOCK
      ?auto_823766 - BLOCK
      ?auto_823767 - BLOCK
      ?auto_823768 - BLOCK
      ?auto_823769 - BLOCK
      ?auto_823770 - BLOCK
      ?auto_823771 - BLOCK
      ?auto_823772 - BLOCK
    )
    :vars
    (
      ?auto_823773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823772 ?auto_823773 ) ( ON-TABLE ?auto_823758 ) ( ON ?auto_823759 ?auto_823758 ) ( ON ?auto_823760 ?auto_823759 ) ( ON ?auto_823761 ?auto_823760 ) ( not ( = ?auto_823758 ?auto_823759 ) ) ( not ( = ?auto_823758 ?auto_823760 ) ) ( not ( = ?auto_823758 ?auto_823761 ) ) ( not ( = ?auto_823758 ?auto_823762 ) ) ( not ( = ?auto_823758 ?auto_823763 ) ) ( not ( = ?auto_823758 ?auto_823764 ) ) ( not ( = ?auto_823758 ?auto_823765 ) ) ( not ( = ?auto_823758 ?auto_823766 ) ) ( not ( = ?auto_823758 ?auto_823767 ) ) ( not ( = ?auto_823758 ?auto_823768 ) ) ( not ( = ?auto_823758 ?auto_823769 ) ) ( not ( = ?auto_823758 ?auto_823770 ) ) ( not ( = ?auto_823758 ?auto_823771 ) ) ( not ( = ?auto_823758 ?auto_823772 ) ) ( not ( = ?auto_823758 ?auto_823773 ) ) ( not ( = ?auto_823759 ?auto_823760 ) ) ( not ( = ?auto_823759 ?auto_823761 ) ) ( not ( = ?auto_823759 ?auto_823762 ) ) ( not ( = ?auto_823759 ?auto_823763 ) ) ( not ( = ?auto_823759 ?auto_823764 ) ) ( not ( = ?auto_823759 ?auto_823765 ) ) ( not ( = ?auto_823759 ?auto_823766 ) ) ( not ( = ?auto_823759 ?auto_823767 ) ) ( not ( = ?auto_823759 ?auto_823768 ) ) ( not ( = ?auto_823759 ?auto_823769 ) ) ( not ( = ?auto_823759 ?auto_823770 ) ) ( not ( = ?auto_823759 ?auto_823771 ) ) ( not ( = ?auto_823759 ?auto_823772 ) ) ( not ( = ?auto_823759 ?auto_823773 ) ) ( not ( = ?auto_823760 ?auto_823761 ) ) ( not ( = ?auto_823760 ?auto_823762 ) ) ( not ( = ?auto_823760 ?auto_823763 ) ) ( not ( = ?auto_823760 ?auto_823764 ) ) ( not ( = ?auto_823760 ?auto_823765 ) ) ( not ( = ?auto_823760 ?auto_823766 ) ) ( not ( = ?auto_823760 ?auto_823767 ) ) ( not ( = ?auto_823760 ?auto_823768 ) ) ( not ( = ?auto_823760 ?auto_823769 ) ) ( not ( = ?auto_823760 ?auto_823770 ) ) ( not ( = ?auto_823760 ?auto_823771 ) ) ( not ( = ?auto_823760 ?auto_823772 ) ) ( not ( = ?auto_823760 ?auto_823773 ) ) ( not ( = ?auto_823761 ?auto_823762 ) ) ( not ( = ?auto_823761 ?auto_823763 ) ) ( not ( = ?auto_823761 ?auto_823764 ) ) ( not ( = ?auto_823761 ?auto_823765 ) ) ( not ( = ?auto_823761 ?auto_823766 ) ) ( not ( = ?auto_823761 ?auto_823767 ) ) ( not ( = ?auto_823761 ?auto_823768 ) ) ( not ( = ?auto_823761 ?auto_823769 ) ) ( not ( = ?auto_823761 ?auto_823770 ) ) ( not ( = ?auto_823761 ?auto_823771 ) ) ( not ( = ?auto_823761 ?auto_823772 ) ) ( not ( = ?auto_823761 ?auto_823773 ) ) ( not ( = ?auto_823762 ?auto_823763 ) ) ( not ( = ?auto_823762 ?auto_823764 ) ) ( not ( = ?auto_823762 ?auto_823765 ) ) ( not ( = ?auto_823762 ?auto_823766 ) ) ( not ( = ?auto_823762 ?auto_823767 ) ) ( not ( = ?auto_823762 ?auto_823768 ) ) ( not ( = ?auto_823762 ?auto_823769 ) ) ( not ( = ?auto_823762 ?auto_823770 ) ) ( not ( = ?auto_823762 ?auto_823771 ) ) ( not ( = ?auto_823762 ?auto_823772 ) ) ( not ( = ?auto_823762 ?auto_823773 ) ) ( not ( = ?auto_823763 ?auto_823764 ) ) ( not ( = ?auto_823763 ?auto_823765 ) ) ( not ( = ?auto_823763 ?auto_823766 ) ) ( not ( = ?auto_823763 ?auto_823767 ) ) ( not ( = ?auto_823763 ?auto_823768 ) ) ( not ( = ?auto_823763 ?auto_823769 ) ) ( not ( = ?auto_823763 ?auto_823770 ) ) ( not ( = ?auto_823763 ?auto_823771 ) ) ( not ( = ?auto_823763 ?auto_823772 ) ) ( not ( = ?auto_823763 ?auto_823773 ) ) ( not ( = ?auto_823764 ?auto_823765 ) ) ( not ( = ?auto_823764 ?auto_823766 ) ) ( not ( = ?auto_823764 ?auto_823767 ) ) ( not ( = ?auto_823764 ?auto_823768 ) ) ( not ( = ?auto_823764 ?auto_823769 ) ) ( not ( = ?auto_823764 ?auto_823770 ) ) ( not ( = ?auto_823764 ?auto_823771 ) ) ( not ( = ?auto_823764 ?auto_823772 ) ) ( not ( = ?auto_823764 ?auto_823773 ) ) ( not ( = ?auto_823765 ?auto_823766 ) ) ( not ( = ?auto_823765 ?auto_823767 ) ) ( not ( = ?auto_823765 ?auto_823768 ) ) ( not ( = ?auto_823765 ?auto_823769 ) ) ( not ( = ?auto_823765 ?auto_823770 ) ) ( not ( = ?auto_823765 ?auto_823771 ) ) ( not ( = ?auto_823765 ?auto_823772 ) ) ( not ( = ?auto_823765 ?auto_823773 ) ) ( not ( = ?auto_823766 ?auto_823767 ) ) ( not ( = ?auto_823766 ?auto_823768 ) ) ( not ( = ?auto_823766 ?auto_823769 ) ) ( not ( = ?auto_823766 ?auto_823770 ) ) ( not ( = ?auto_823766 ?auto_823771 ) ) ( not ( = ?auto_823766 ?auto_823772 ) ) ( not ( = ?auto_823766 ?auto_823773 ) ) ( not ( = ?auto_823767 ?auto_823768 ) ) ( not ( = ?auto_823767 ?auto_823769 ) ) ( not ( = ?auto_823767 ?auto_823770 ) ) ( not ( = ?auto_823767 ?auto_823771 ) ) ( not ( = ?auto_823767 ?auto_823772 ) ) ( not ( = ?auto_823767 ?auto_823773 ) ) ( not ( = ?auto_823768 ?auto_823769 ) ) ( not ( = ?auto_823768 ?auto_823770 ) ) ( not ( = ?auto_823768 ?auto_823771 ) ) ( not ( = ?auto_823768 ?auto_823772 ) ) ( not ( = ?auto_823768 ?auto_823773 ) ) ( not ( = ?auto_823769 ?auto_823770 ) ) ( not ( = ?auto_823769 ?auto_823771 ) ) ( not ( = ?auto_823769 ?auto_823772 ) ) ( not ( = ?auto_823769 ?auto_823773 ) ) ( not ( = ?auto_823770 ?auto_823771 ) ) ( not ( = ?auto_823770 ?auto_823772 ) ) ( not ( = ?auto_823770 ?auto_823773 ) ) ( not ( = ?auto_823771 ?auto_823772 ) ) ( not ( = ?auto_823771 ?auto_823773 ) ) ( not ( = ?auto_823772 ?auto_823773 ) ) ( ON ?auto_823771 ?auto_823772 ) ( ON ?auto_823770 ?auto_823771 ) ( ON ?auto_823769 ?auto_823770 ) ( ON ?auto_823768 ?auto_823769 ) ( ON ?auto_823767 ?auto_823768 ) ( ON ?auto_823766 ?auto_823767 ) ( ON ?auto_823765 ?auto_823766 ) ( ON ?auto_823764 ?auto_823765 ) ( ON ?auto_823763 ?auto_823764 ) ( CLEAR ?auto_823761 ) ( ON ?auto_823762 ?auto_823763 ) ( CLEAR ?auto_823762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_823758 ?auto_823759 ?auto_823760 ?auto_823761 ?auto_823762 )
      ( MAKE-15PILE ?auto_823758 ?auto_823759 ?auto_823760 ?auto_823761 ?auto_823762 ?auto_823763 ?auto_823764 ?auto_823765 ?auto_823766 ?auto_823767 ?auto_823768 ?auto_823769 ?auto_823770 ?auto_823771 ?auto_823772 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823820 - BLOCK
      ?auto_823821 - BLOCK
      ?auto_823822 - BLOCK
      ?auto_823823 - BLOCK
      ?auto_823824 - BLOCK
      ?auto_823825 - BLOCK
      ?auto_823826 - BLOCK
      ?auto_823827 - BLOCK
      ?auto_823828 - BLOCK
      ?auto_823829 - BLOCK
      ?auto_823830 - BLOCK
      ?auto_823831 - BLOCK
      ?auto_823832 - BLOCK
      ?auto_823833 - BLOCK
      ?auto_823834 - BLOCK
    )
    :vars
    (
      ?auto_823835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823834 ?auto_823835 ) ( ON-TABLE ?auto_823820 ) ( ON ?auto_823821 ?auto_823820 ) ( ON ?auto_823822 ?auto_823821 ) ( not ( = ?auto_823820 ?auto_823821 ) ) ( not ( = ?auto_823820 ?auto_823822 ) ) ( not ( = ?auto_823820 ?auto_823823 ) ) ( not ( = ?auto_823820 ?auto_823824 ) ) ( not ( = ?auto_823820 ?auto_823825 ) ) ( not ( = ?auto_823820 ?auto_823826 ) ) ( not ( = ?auto_823820 ?auto_823827 ) ) ( not ( = ?auto_823820 ?auto_823828 ) ) ( not ( = ?auto_823820 ?auto_823829 ) ) ( not ( = ?auto_823820 ?auto_823830 ) ) ( not ( = ?auto_823820 ?auto_823831 ) ) ( not ( = ?auto_823820 ?auto_823832 ) ) ( not ( = ?auto_823820 ?auto_823833 ) ) ( not ( = ?auto_823820 ?auto_823834 ) ) ( not ( = ?auto_823820 ?auto_823835 ) ) ( not ( = ?auto_823821 ?auto_823822 ) ) ( not ( = ?auto_823821 ?auto_823823 ) ) ( not ( = ?auto_823821 ?auto_823824 ) ) ( not ( = ?auto_823821 ?auto_823825 ) ) ( not ( = ?auto_823821 ?auto_823826 ) ) ( not ( = ?auto_823821 ?auto_823827 ) ) ( not ( = ?auto_823821 ?auto_823828 ) ) ( not ( = ?auto_823821 ?auto_823829 ) ) ( not ( = ?auto_823821 ?auto_823830 ) ) ( not ( = ?auto_823821 ?auto_823831 ) ) ( not ( = ?auto_823821 ?auto_823832 ) ) ( not ( = ?auto_823821 ?auto_823833 ) ) ( not ( = ?auto_823821 ?auto_823834 ) ) ( not ( = ?auto_823821 ?auto_823835 ) ) ( not ( = ?auto_823822 ?auto_823823 ) ) ( not ( = ?auto_823822 ?auto_823824 ) ) ( not ( = ?auto_823822 ?auto_823825 ) ) ( not ( = ?auto_823822 ?auto_823826 ) ) ( not ( = ?auto_823822 ?auto_823827 ) ) ( not ( = ?auto_823822 ?auto_823828 ) ) ( not ( = ?auto_823822 ?auto_823829 ) ) ( not ( = ?auto_823822 ?auto_823830 ) ) ( not ( = ?auto_823822 ?auto_823831 ) ) ( not ( = ?auto_823822 ?auto_823832 ) ) ( not ( = ?auto_823822 ?auto_823833 ) ) ( not ( = ?auto_823822 ?auto_823834 ) ) ( not ( = ?auto_823822 ?auto_823835 ) ) ( not ( = ?auto_823823 ?auto_823824 ) ) ( not ( = ?auto_823823 ?auto_823825 ) ) ( not ( = ?auto_823823 ?auto_823826 ) ) ( not ( = ?auto_823823 ?auto_823827 ) ) ( not ( = ?auto_823823 ?auto_823828 ) ) ( not ( = ?auto_823823 ?auto_823829 ) ) ( not ( = ?auto_823823 ?auto_823830 ) ) ( not ( = ?auto_823823 ?auto_823831 ) ) ( not ( = ?auto_823823 ?auto_823832 ) ) ( not ( = ?auto_823823 ?auto_823833 ) ) ( not ( = ?auto_823823 ?auto_823834 ) ) ( not ( = ?auto_823823 ?auto_823835 ) ) ( not ( = ?auto_823824 ?auto_823825 ) ) ( not ( = ?auto_823824 ?auto_823826 ) ) ( not ( = ?auto_823824 ?auto_823827 ) ) ( not ( = ?auto_823824 ?auto_823828 ) ) ( not ( = ?auto_823824 ?auto_823829 ) ) ( not ( = ?auto_823824 ?auto_823830 ) ) ( not ( = ?auto_823824 ?auto_823831 ) ) ( not ( = ?auto_823824 ?auto_823832 ) ) ( not ( = ?auto_823824 ?auto_823833 ) ) ( not ( = ?auto_823824 ?auto_823834 ) ) ( not ( = ?auto_823824 ?auto_823835 ) ) ( not ( = ?auto_823825 ?auto_823826 ) ) ( not ( = ?auto_823825 ?auto_823827 ) ) ( not ( = ?auto_823825 ?auto_823828 ) ) ( not ( = ?auto_823825 ?auto_823829 ) ) ( not ( = ?auto_823825 ?auto_823830 ) ) ( not ( = ?auto_823825 ?auto_823831 ) ) ( not ( = ?auto_823825 ?auto_823832 ) ) ( not ( = ?auto_823825 ?auto_823833 ) ) ( not ( = ?auto_823825 ?auto_823834 ) ) ( not ( = ?auto_823825 ?auto_823835 ) ) ( not ( = ?auto_823826 ?auto_823827 ) ) ( not ( = ?auto_823826 ?auto_823828 ) ) ( not ( = ?auto_823826 ?auto_823829 ) ) ( not ( = ?auto_823826 ?auto_823830 ) ) ( not ( = ?auto_823826 ?auto_823831 ) ) ( not ( = ?auto_823826 ?auto_823832 ) ) ( not ( = ?auto_823826 ?auto_823833 ) ) ( not ( = ?auto_823826 ?auto_823834 ) ) ( not ( = ?auto_823826 ?auto_823835 ) ) ( not ( = ?auto_823827 ?auto_823828 ) ) ( not ( = ?auto_823827 ?auto_823829 ) ) ( not ( = ?auto_823827 ?auto_823830 ) ) ( not ( = ?auto_823827 ?auto_823831 ) ) ( not ( = ?auto_823827 ?auto_823832 ) ) ( not ( = ?auto_823827 ?auto_823833 ) ) ( not ( = ?auto_823827 ?auto_823834 ) ) ( not ( = ?auto_823827 ?auto_823835 ) ) ( not ( = ?auto_823828 ?auto_823829 ) ) ( not ( = ?auto_823828 ?auto_823830 ) ) ( not ( = ?auto_823828 ?auto_823831 ) ) ( not ( = ?auto_823828 ?auto_823832 ) ) ( not ( = ?auto_823828 ?auto_823833 ) ) ( not ( = ?auto_823828 ?auto_823834 ) ) ( not ( = ?auto_823828 ?auto_823835 ) ) ( not ( = ?auto_823829 ?auto_823830 ) ) ( not ( = ?auto_823829 ?auto_823831 ) ) ( not ( = ?auto_823829 ?auto_823832 ) ) ( not ( = ?auto_823829 ?auto_823833 ) ) ( not ( = ?auto_823829 ?auto_823834 ) ) ( not ( = ?auto_823829 ?auto_823835 ) ) ( not ( = ?auto_823830 ?auto_823831 ) ) ( not ( = ?auto_823830 ?auto_823832 ) ) ( not ( = ?auto_823830 ?auto_823833 ) ) ( not ( = ?auto_823830 ?auto_823834 ) ) ( not ( = ?auto_823830 ?auto_823835 ) ) ( not ( = ?auto_823831 ?auto_823832 ) ) ( not ( = ?auto_823831 ?auto_823833 ) ) ( not ( = ?auto_823831 ?auto_823834 ) ) ( not ( = ?auto_823831 ?auto_823835 ) ) ( not ( = ?auto_823832 ?auto_823833 ) ) ( not ( = ?auto_823832 ?auto_823834 ) ) ( not ( = ?auto_823832 ?auto_823835 ) ) ( not ( = ?auto_823833 ?auto_823834 ) ) ( not ( = ?auto_823833 ?auto_823835 ) ) ( not ( = ?auto_823834 ?auto_823835 ) ) ( ON ?auto_823833 ?auto_823834 ) ( ON ?auto_823832 ?auto_823833 ) ( ON ?auto_823831 ?auto_823832 ) ( ON ?auto_823830 ?auto_823831 ) ( ON ?auto_823829 ?auto_823830 ) ( ON ?auto_823828 ?auto_823829 ) ( ON ?auto_823827 ?auto_823828 ) ( ON ?auto_823826 ?auto_823827 ) ( ON ?auto_823825 ?auto_823826 ) ( ON ?auto_823824 ?auto_823825 ) ( CLEAR ?auto_823822 ) ( ON ?auto_823823 ?auto_823824 ) ( CLEAR ?auto_823823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_823820 ?auto_823821 ?auto_823822 ?auto_823823 )
      ( MAKE-15PILE ?auto_823820 ?auto_823821 ?auto_823822 ?auto_823823 ?auto_823824 ?auto_823825 ?auto_823826 ?auto_823827 ?auto_823828 ?auto_823829 ?auto_823830 ?auto_823831 ?auto_823832 ?auto_823833 ?auto_823834 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823882 - BLOCK
      ?auto_823883 - BLOCK
      ?auto_823884 - BLOCK
      ?auto_823885 - BLOCK
      ?auto_823886 - BLOCK
      ?auto_823887 - BLOCK
      ?auto_823888 - BLOCK
      ?auto_823889 - BLOCK
      ?auto_823890 - BLOCK
      ?auto_823891 - BLOCK
      ?auto_823892 - BLOCK
      ?auto_823893 - BLOCK
      ?auto_823894 - BLOCK
      ?auto_823895 - BLOCK
      ?auto_823896 - BLOCK
    )
    :vars
    (
      ?auto_823897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823896 ?auto_823897 ) ( ON-TABLE ?auto_823882 ) ( ON ?auto_823883 ?auto_823882 ) ( not ( = ?auto_823882 ?auto_823883 ) ) ( not ( = ?auto_823882 ?auto_823884 ) ) ( not ( = ?auto_823882 ?auto_823885 ) ) ( not ( = ?auto_823882 ?auto_823886 ) ) ( not ( = ?auto_823882 ?auto_823887 ) ) ( not ( = ?auto_823882 ?auto_823888 ) ) ( not ( = ?auto_823882 ?auto_823889 ) ) ( not ( = ?auto_823882 ?auto_823890 ) ) ( not ( = ?auto_823882 ?auto_823891 ) ) ( not ( = ?auto_823882 ?auto_823892 ) ) ( not ( = ?auto_823882 ?auto_823893 ) ) ( not ( = ?auto_823882 ?auto_823894 ) ) ( not ( = ?auto_823882 ?auto_823895 ) ) ( not ( = ?auto_823882 ?auto_823896 ) ) ( not ( = ?auto_823882 ?auto_823897 ) ) ( not ( = ?auto_823883 ?auto_823884 ) ) ( not ( = ?auto_823883 ?auto_823885 ) ) ( not ( = ?auto_823883 ?auto_823886 ) ) ( not ( = ?auto_823883 ?auto_823887 ) ) ( not ( = ?auto_823883 ?auto_823888 ) ) ( not ( = ?auto_823883 ?auto_823889 ) ) ( not ( = ?auto_823883 ?auto_823890 ) ) ( not ( = ?auto_823883 ?auto_823891 ) ) ( not ( = ?auto_823883 ?auto_823892 ) ) ( not ( = ?auto_823883 ?auto_823893 ) ) ( not ( = ?auto_823883 ?auto_823894 ) ) ( not ( = ?auto_823883 ?auto_823895 ) ) ( not ( = ?auto_823883 ?auto_823896 ) ) ( not ( = ?auto_823883 ?auto_823897 ) ) ( not ( = ?auto_823884 ?auto_823885 ) ) ( not ( = ?auto_823884 ?auto_823886 ) ) ( not ( = ?auto_823884 ?auto_823887 ) ) ( not ( = ?auto_823884 ?auto_823888 ) ) ( not ( = ?auto_823884 ?auto_823889 ) ) ( not ( = ?auto_823884 ?auto_823890 ) ) ( not ( = ?auto_823884 ?auto_823891 ) ) ( not ( = ?auto_823884 ?auto_823892 ) ) ( not ( = ?auto_823884 ?auto_823893 ) ) ( not ( = ?auto_823884 ?auto_823894 ) ) ( not ( = ?auto_823884 ?auto_823895 ) ) ( not ( = ?auto_823884 ?auto_823896 ) ) ( not ( = ?auto_823884 ?auto_823897 ) ) ( not ( = ?auto_823885 ?auto_823886 ) ) ( not ( = ?auto_823885 ?auto_823887 ) ) ( not ( = ?auto_823885 ?auto_823888 ) ) ( not ( = ?auto_823885 ?auto_823889 ) ) ( not ( = ?auto_823885 ?auto_823890 ) ) ( not ( = ?auto_823885 ?auto_823891 ) ) ( not ( = ?auto_823885 ?auto_823892 ) ) ( not ( = ?auto_823885 ?auto_823893 ) ) ( not ( = ?auto_823885 ?auto_823894 ) ) ( not ( = ?auto_823885 ?auto_823895 ) ) ( not ( = ?auto_823885 ?auto_823896 ) ) ( not ( = ?auto_823885 ?auto_823897 ) ) ( not ( = ?auto_823886 ?auto_823887 ) ) ( not ( = ?auto_823886 ?auto_823888 ) ) ( not ( = ?auto_823886 ?auto_823889 ) ) ( not ( = ?auto_823886 ?auto_823890 ) ) ( not ( = ?auto_823886 ?auto_823891 ) ) ( not ( = ?auto_823886 ?auto_823892 ) ) ( not ( = ?auto_823886 ?auto_823893 ) ) ( not ( = ?auto_823886 ?auto_823894 ) ) ( not ( = ?auto_823886 ?auto_823895 ) ) ( not ( = ?auto_823886 ?auto_823896 ) ) ( not ( = ?auto_823886 ?auto_823897 ) ) ( not ( = ?auto_823887 ?auto_823888 ) ) ( not ( = ?auto_823887 ?auto_823889 ) ) ( not ( = ?auto_823887 ?auto_823890 ) ) ( not ( = ?auto_823887 ?auto_823891 ) ) ( not ( = ?auto_823887 ?auto_823892 ) ) ( not ( = ?auto_823887 ?auto_823893 ) ) ( not ( = ?auto_823887 ?auto_823894 ) ) ( not ( = ?auto_823887 ?auto_823895 ) ) ( not ( = ?auto_823887 ?auto_823896 ) ) ( not ( = ?auto_823887 ?auto_823897 ) ) ( not ( = ?auto_823888 ?auto_823889 ) ) ( not ( = ?auto_823888 ?auto_823890 ) ) ( not ( = ?auto_823888 ?auto_823891 ) ) ( not ( = ?auto_823888 ?auto_823892 ) ) ( not ( = ?auto_823888 ?auto_823893 ) ) ( not ( = ?auto_823888 ?auto_823894 ) ) ( not ( = ?auto_823888 ?auto_823895 ) ) ( not ( = ?auto_823888 ?auto_823896 ) ) ( not ( = ?auto_823888 ?auto_823897 ) ) ( not ( = ?auto_823889 ?auto_823890 ) ) ( not ( = ?auto_823889 ?auto_823891 ) ) ( not ( = ?auto_823889 ?auto_823892 ) ) ( not ( = ?auto_823889 ?auto_823893 ) ) ( not ( = ?auto_823889 ?auto_823894 ) ) ( not ( = ?auto_823889 ?auto_823895 ) ) ( not ( = ?auto_823889 ?auto_823896 ) ) ( not ( = ?auto_823889 ?auto_823897 ) ) ( not ( = ?auto_823890 ?auto_823891 ) ) ( not ( = ?auto_823890 ?auto_823892 ) ) ( not ( = ?auto_823890 ?auto_823893 ) ) ( not ( = ?auto_823890 ?auto_823894 ) ) ( not ( = ?auto_823890 ?auto_823895 ) ) ( not ( = ?auto_823890 ?auto_823896 ) ) ( not ( = ?auto_823890 ?auto_823897 ) ) ( not ( = ?auto_823891 ?auto_823892 ) ) ( not ( = ?auto_823891 ?auto_823893 ) ) ( not ( = ?auto_823891 ?auto_823894 ) ) ( not ( = ?auto_823891 ?auto_823895 ) ) ( not ( = ?auto_823891 ?auto_823896 ) ) ( not ( = ?auto_823891 ?auto_823897 ) ) ( not ( = ?auto_823892 ?auto_823893 ) ) ( not ( = ?auto_823892 ?auto_823894 ) ) ( not ( = ?auto_823892 ?auto_823895 ) ) ( not ( = ?auto_823892 ?auto_823896 ) ) ( not ( = ?auto_823892 ?auto_823897 ) ) ( not ( = ?auto_823893 ?auto_823894 ) ) ( not ( = ?auto_823893 ?auto_823895 ) ) ( not ( = ?auto_823893 ?auto_823896 ) ) ( not ( = ?auto_823893 ?auto_823897 ) ) ( not ( = ?auto_823894 ?auto_823895 ) ) ( not ( = ?auto_823894 ?auto_823896 ) ) ( not ( = ?auto_823894 ?auto_823897 ) ) ( not ( = ?auto_823895 ?auto_823896 ) ) ( not ( = ?auto_823895 ?auto_823897 ) ) ( not ( = ?auto_823896 ?auto_823897 ) ) ( ON ?auto_823895 ?auto_823896 ) ( ON ?auto_823894 ?auto_823895 ) ( ON ?auto_823893 ?auto_823894 ) ( ON ?auto_823892 ?auto_823893 ) ( ON ?auto_823891 ?auto_823892 ) ( ON ?auto_823890 ?auto_823891 ) ( ON ?auto_823889 ?auto_823890 ) ( ON ?auto_823888 ?auto_823889 ) ( ON ?auto_823887 ?auto_823888 ) ( ON ?auto_823886 ?auto_823887 ) ( ON ?auto_823885 ?auto_823886 ) ( CLEAR ?auto_823883 ) ( ON ?auto_823884 ?auto_823885 ) ( CLEAR ?auto_823884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_823882 ?auto_823883 ?auto_823884 )
      ( MAKE-15PILE ?auto_823882 ?auto_823883 ?auto_823884 ?auto_823885 ?auto_823886 ?auto_823887 ?auto_823888 ?auto_823889 ?auto_823890 ?auto_823891 ?auto_823892 ?auto_823893 ?auto_823894 ?auto_823895 ?auto_823896 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_823944 - BLOCK
      ?auto_823945 - BLOCK
      ?auto_823946 - BLOCK
      ?auto_823947 - BLOCK
      ?auto_823948 - BLOCK
      ?auto_823949 - BLOCK
      ?auto_823950 - BLOCK
      ?auto_823951 - BLOCK
      ?auto_823952 - BLOCK
      ?auto_823953 - BLOCK
      ?auto_823954 - BLOCK
      ?auto_823955 - BLOCK
      ?auto_823956 - BLOCK
      ?auto_823957 - BLOCK
      ?auto_823958 - BLOCK
    )
    :vars
    (
      ?auto_823959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_823958 ?auto_823959 ) ( ON-TABLE ?auto_823944 ) ( not ( = ?auto_823944 ?auto_823945 ) ) ( not ( = ?auto_823944 ?auto_823946 ) ) ( not ( = ?auto_823944 ?auto_823947 ) ) ( not ( = ?auto_823944 ?auto_823948 ) ) ( not ( = ?auto_823944 ?auto_823949 ) ) ( not ( = ?auto_823944 ?auto_823950 ) ) ( not ( = ?auto_823944 ?auto_823951 ) ) ( not ( = ?auto_823944 ?auto_823952 ) ) ( not ( = ?auto_823944 ?auto_823953 ) ) ( not ( = ?auto_823944 ?auto_823954 ) ) ( not ( = ?auto_823944 ?auto_823955 ) ) ( not ( = ?auto_823944 ?auto_823956 ) ) ( not ( = ?auto_823944 ?auto_823957 ) ) ( not ( = ?auto_823944 ?auto_823958 ) ) ( not ( = ?auto_823944 ?auto_823959 ) ) ( not ( = ?auto_823945 ?auto_823946 ) ) ( not ( = ?auto_823945 ?auto_823947 ) ) ( not ( = ?auto_823945 ?auto_823948 ) ) ( not ( = ?auto_823945 ?auto_823949 ) ) ( not ( = ?auto_823945 ?auto_823950 ) ) ( not ( = ?auto_823945 ?auto_823951 ) ) ( not ( = ?auto_823945 ?auto_823952 ) ) ( not ( = ?auto_823945 ?auto_823953 ) ) ( not ( = ?auto_823945 ?auto_823954 ) ) ( not ( = ?auto_823945 ?auto_823955 ) ) ( not ( = ?auto_823945 ?auto_823956 ) ) ( not ( = ?auto_823945 ?auto_823957 ) ) ( not ( = ?auto_823945 ?auto_823958 ) ) ( not ( = ?auto_823945 ?auto_823959 ) ) ( not ( = ?auto_823946 ?auto_823947 ) ) ( not ( = ?auto_823946 ?auto_823948 ) ) ( not ( = ?auto_823946 ?auto_823949 ) ) ( not ( = ?auto_823946 ?auto_823950 ) ) ( not ( = ?auto_823946 ?auto_823951 ) ) ( not ( = ?auto_823946 ?auto_823952 ) ) ( not ( = ?auto_823946 ?auto_823953 ) ) ( not ( = ?auto_823946 ?auto_823954 ) ) ( not ( = ?auto_823946 ?auto_823955 ) ) ( not ( = ?auto_823946 ?auto_823956 ) ) ( not ( = ?auto_823946 ?auto_823957 ) ) ( not ( = ?auto_823946 ?auto_823958 ) ) ( not ( = ?auto_823946 ?auto_823959 ) ) ( not ( = ?auto_823947 ?auto_823948 ) ) ( not ( = ?auto_823947 ?auto_823949 ) ) ( not ( = ?auto_823947 ?auto_823950 ) ) ( not ( = ?auto_823947 ?auto_823951 ) ) ( not ( = ?auto_823947 ?auto_823952 ) ) ( not ( = ?auto_823947 ?auto_823953 ) ) ( not ( = ?auto_823947 ?auto_823954 ) ) ( not ( = ?auto_823947 ?auto_823955 ) ) ( not ( = ?auto_823947 ?auto_823956 ) ) ( not ( = ?auto_823947 ?auto_823957 ) ) ( not ( = ?auto_823947 ?auto_823958 ) ) ( not ( = ?auto_823947 ?auto_823959 ) ) ( not ( = ?auto_823948 ?auto_823949 ) ) ( not ( = ?auto_823948 ?auto_823950 ) ) ( not ( = ?auto_823948 ?auto_823951 ) ) ( not ( = ?auto_823948 ?auto_823952 ) ) ( not ( = ?auto_823948 ?auto_823953 ) ) ( not ( = ?auto_823948 ?auto_823954 ) ) ( not ( = ?auto_823948 ?auto_823955 ) ) ( not ( = ?auto_823948 ?auto_823956 ) ) ( not ( = ?auto_823948 ?auto_823957 ) ) ( not ( = ?auto_823948 ?auto_823958 ) ) ( not ( = ?auto_823948 ?auto_823959 ) ) ( not ( = ?auto_823949 ?auto_823950 ) ) ( not ( = ?auto_823949 ?auto_823951 ) ) ( not ( = ?auto_823949 ?auto_823952 ) ) ( not ( = ?auto_823949 ?auto_823953 ) ) ( not ( = ?auto_823949 ?auto_823954 ) ) ( not ( = ?auto_823949 ?auto_823955 ) ) ( not ( = ?auto_823949 ?auto_823956 ) ) ( not ( = ?auto_823949 ?auto_823957 ) ) ( not ( = ?auto_823949 ?auto_823958 ) ) ( not ( = ?auto_823949 ?auto_823959 ) ) ( not ( = ?auto_823950 ?auto_823951 ) ) ( not ( = ?auto_823950 ?auto_823952 ) ) ( not ( = ?auto_823950 ?auto_823953 ) ) ( not ( = ?auto_823950 ?auto_823954 ) ) ( not ( = ?auto_823950 ?auto_823955 ) ) ( not ( = ?auto_823950 ?auto_823956 ) ) ( not ( = ?auto_823950 ?auto_823957 ) ) ( not ( = ?auto_823950 ?auto_823958 ) ) ( not ( = ?auto_823950 ?auto_823959 ) ) ( not ( = ?auto_823951 ?auto_823952 ) ) ( not ( = ?auto_823951 ?auto_823953 ) ) ( not ( = ?auto_823951 ?auto_823954 ) ) ( not ( = ?auto_823951 ?auto_823955 ) ) ( not ( = ?auto_823951 ?auto_823956 ) ) ( not ( = ?auto_823951 ?auto_823957 ) ) ( not ( = ?auto_823951 ?auto_823958 ) ) ( not ( = ?auto_823951 ?auto_823959 ) ) ( not ( = ?auto_823952 ?auto_823953 ) ) ( not ( = ?auto_823952 ?auto_823954 ) ) ( not ( = ?auto_823952 ?auto_823955 ) ) ( not ( = ?auto_823952 ?auto_823956 ) ) ( not ( = ?auto_823952 ?auto_823957 ) ) ( not ( = ?auto_823952 ?auto_823958 ) ) ( not ( = ?auto_823952 ?auto_823959 ) ) ( not ( = ?auto_823953 ?auto_823954 ) ) ( not ( = ?auto_823953 ?auto_823955 ) ) ( not ( = ?auto_823953 ?auto_823956 ) ) ( not ( = ?auto_823953 ?auto_823957 ) ) ( not ( = ?auto_823953 ?auto_823958 ) ) ( not ( = ?auto_823953 ?auto_823959 ) ) ( not ( = ?auto_823954 ?auto_823955 ) ) ( not ( = ?auto_823954 ?auto_823956 ) ) ( not ( = ?auto_823954 ?auto_823957 ) ) ( not ( = ?auto_823954 ?auto_823958 ) ) ( not ( = ?auto_823954 ?auto_823959 ) ) ( not ( = ?auto_823955 ?auto_823956 ) ) ( not ( = ?auto_823955 ?auto_823957 ) ) ( not ( = ?auto_823955 ?auto_823958 ) ) ( not ( = ?auto_823955 ?auto_823959 ) ) ( not ( = ?auto_823956 ?auto_823957 ) ) ( not ( = ?auto_823956 ?auto_823958 ) ) ( not ( = ?auto_823956 ?auto_823959 ) ) ( not ( = ?auto_823957 ?auto_823958 ) ) ( not ( = ?auto_823957 ?auto_823959 ) ) ( not ( = ?auto_823958 ?auto_823959 ) ) ( ON ?auto_823957 ?auto_823958 ) ( ON ?auto_823956 ?auto_823957 ) ( ON ?auto_823955 ?auto_823956 ) ( ON ?auto_823954 ?auto_823955 ) ( ON ?auto_823953 ?auto_823954 ) ( ON ?auto_823952 ?auto_823953 ) ( ON ?auto_823951 ?auto_823952 ) ( ON ?auto_823950 ?auto_823951 ) ( ON ?auto_823949 ?auto_823950 ) ( ON ?auto_823948 ?auto_823949 ) ( ON ?auto_823947 ?auto_823948 ) ( ON ?auto_823946 ?auto_823947 ) ( CLEAR ?auto_823944 ) ( ON ?auto_823945 ?auto_823946 ) ( CLEAR ?auto_823945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_823944 ?auto_823945 )
      ( MAKE-15PILE ?auto_823944 ?auto_823945 ?auto_823946 ?auto_823947 ?auto_823948 ?auto_823949 ?auto_823950 ?auto_823951 ?auto_823952 ?auto_823953 ?auto_823954 ?auto_823955 ?auto_823956 ?auto_823957 ?auto_823958 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_824006 - BLOCK
      ?auto_824007 - BLOCK
      ?auto_824008 - BLOCK
      ?auto_824009 - BLOCK
      ?auto_824010 - BLOCK
      ?auto_824011 - BLOCK
      ?auto_824012 - BLOCK
      ?auto_824013 - BLOCK
      ?auto_824014 - BLOCK
      ?auto_824015 - BLOCK
      ?auto_824016 - BLOCK
      ?auto_824017 - BLOCK
      ?auto_824018 - BLOCK
      ?auto_824019 - BLOCK
      ?auto_824020 - BLOCK
    )
    :vars
    (
      ?auto_824021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824020 ?auto_824021 ) ( not ( = ?auto_824006 ?auto_824007 ) ) ( not ( = ?auto_824006 ?auto_824008 ) ) ( not ( = ?auto_824006 ?auto_824009 ) ) ( not ( = ?auto_824006 ?auto_824010 ) ) ( not ( = ?auto_824006 ?auto_824011 ) ) ( not ( = ?auto_824006 ?auto_824012 ) ) ( not ( = ?auto_824006 ?auto_824013 ) ) ( not ( = ?auto_824006 ?auto_824014 ) ) ( not ( = ?auto_824006 ?auto_824015 ) ) ( not ( = ?auto_824006 ?auto_824016 ) ) ( not ( = ?auto_824006 ?auto_824017 ) ) ( not ( = ?auto_824006 ?auto_824018 ) ) ( not ( = ?auto_824006 ?auto_824019 ) ) ( not ( = ?auto_824006 ?auto_824020 ) ) ( not ( = ?auto_824006 ?auto_824021 ) ) ( not ( = ?auto_824007 ?auto_824008 ) ) ( not ( = ?auto_824007 ?auto_824009 ) ) ( not ( = ?auto_824007 ?auto_824010 ) ) ( not ( = ?auto_824007 ?auto_824011 ) ) ( not ( = ?auto_824007 ?auto_824012 ) ) ( not ( = ?auto_824007 ?auto_824013 ) ) ( not ( = ?auto_824007 ?auto_824014 ) ) ( not ( = ?auto_824007 ?auto_824015 ) ) ( not ( = ?auto_824007 ?auto_824016 ) ) ( not ( = ?auto_824007 ?auto_824017 ) ) ( not ( = ?auto_824007 ?auto_824018 ) ) ( not ( = ?auto_824007 ?auto_824019 ) ) ( not ( = ?auto_824007 ?auto_824020 ) ) ( not ( = ?auto_824007 ?auto_824021 ) ) ( not ( = ?auto_824008 ?auto_824009 ) ) ( not ( = ?auto_824008 ?auto_824010 ) ) ( not ( = ?auto_824008 ?auto_824011 ) ) ( not ( = ?auto_824008 ?auto_824012 ) ) ( not ( = ?auto_824008 ?auto_824013 ) ) ( not ( = ?auto_824008 ?auto_824014 ) ) ( not ( = ?auto_824008 ?auto_824015 ) ) ( not ( = ?auto_824008 ?auto_824016 ) ) ( not ( = ?auto_824008 ?auto_824017 ) ) ( not ( = ?auto_824008 ?auto_824018 ) ) ( not ( = ?auto_824008 ?auto_824019 ) ) ( not ( = ?auto_824008 ?auto_824020 ) ) ( not ( = ?auto_824008 ?auto_824021 ) ) ( not ( = ?auto_824009 ?auto_824010 ) ) ( not ( = ?auto_824009 ?auto_824011 ) ) ( not ( = ?auto_824009 ?auto_824012 ) ) ( not ( = ?auto_824009 ?auto_824013 ) ) ( not ( = ?auto_824009 ?auto_824014 ) ) ( not ( = ?auto_824009 ?auto_824015 ) ) ( not ( = ?auto_824009 ?auto_824016 ) ) ( not ( = ?auto_824009 ?auto_824017 ) ) ( not ( = ?auto_824009 ?auto_824018 ) ) ( not ( = ?auto_824009 ?auto_824019 ) ) ( not ( = ?auto_824009 ?auto_824020 ) ) ( not ( = ?auto_824009 ?auto_824021 ) ) ( not ( = ?auto_824010 ?auto_824011 ) ) ( not ( = ?auto_824010 ?auto_824012 ) ) ( not ( = ?auto_824010 ?auto_824013 ) ) ( not ( = ?auto_824010 ?auto_824014 ) ) ( not ( = ?auto_824010 ?auto_824015 ) ) ( not ( = ?auto_824010 ?auto_824016 ) ) ( not ( = ?auto_824010 ?auto_824017 ) ) ( not ( = ?auto_824010 ?auto_824018 ) ) ( not ( = ?auto_824010 ?auto_824019 ) ) ( not ( = ?auto_824010 ?auto_824020 ) ) ( not ( = ?auto_824010 ?auto_824021 ) ) ( not ( = ?auto_824011 ?auto_824012 ) ) ( not ( = ?auto_824011 ?auto_824013 ) ) ( not ( = ?auto_824011 ?auto_824014 ) ) ( not ( = ?auto_824011 ?auto_824015 ) ) ( not ( = ?auto_824011 ?auto_824016 ) ) ( not ( = ?auto_824011 ?auto_824017 ) ) ( not ( = ?auto_824011 ?auto_824018 ) ) ( not ( = ?auto_824011 ?auto_824019 ) ) ( not ( = ?auto_824011 ?auto_824020 ) ) ( not ( = ?auto_824011 ?auto_824021 ) ) ( not ( = ?auto_824012 ?auto_824013 ) ) ( not ( = ?auto_824012 ?auto_824014 ) ) ( not ( = ?auto_824012 ?auto_824015 ) ) ( not ( = ?auto_824012 ?auto_824016 ) ) ( not ( = ?auto_824012 ?auto_824017 ) ) ( not ( = ?auto_824012 ?auto_824018 ) ) ( not ( = ?auto_824012 ?auto_824019 ) ) ( not ( = ?auto_824012 ?auto_824020 ) ) ( not ( = ?auto_824012 ?auto_824021 ) ) ( not ( = ?auto_824013 ?auto_824014 ) ) ( not ( = ?auto_824013 ?auto_824015 ) ) ( not ( = ?auto_824013 ?auto_824016 ) ) ( not ( = ?auto_824013 ?auto_824017 ) ) ( not ( = ?auto_824013 ?auto_824018 ) ) ( not ( = ?auto_824013 ?auto_824019 ) ) ( not ( = ?auto_824013 ?auto_824020 ) ) ( not ( = ?auto_824013 ?auto_824021 ) ) ( not ( = ?auto_824014 ?auto_824015 ) ) ( not ( = ?auto_824014 ?auto_824016 ) ) ( not ( = ?auto_824014 ?auto_824017 ) ) ( not ( = ?auto_824014 ?auto_824018 ) ) ( not ( = ?auto_824014 ?auto_824019 ) ) ( not ( = ?auto_824014 ?auto_824020 ) ) ( not ( = ?auto_824014 ?auto_824021 ) ) ( not ( = ?auto_824015 ?auto_824016 ) ) ( not ( = ?auto_824015 ?auto_824017 ) ) ( not ( = ?auto_824015 ?auto_824018 ) ) ( not ( = ?auto_824015 ?auto_824019 ) ) ( not ( = ?auto_824015 ?auto_824020 ) ) ( not ( = ?auto_824015 ?auto_824021 ) ) ( not ( = ?auto_824016 ?auto_824017 ) ) ( not ( = ?auto_824016 ?auto_824018 ) ) ( not ( = ?auto_824016 ?auto_824019 ) ) ( not ( = ?auto_824016 ?auto_824020 ) ) ( not ( = ?auto_824016 ?auto_824021 ) ) ( not ( = ?auto_824017 ?auto_824018 ) ) ( not ( = ?auto_824017 ?auto_824019 ) ) ( not ( = ?auto_824017 ?auto_824020 ) ) ( not ( = ?auto_824017 ?auto_824021 ) ) ( not ( = ?auto_824018 ?auto_824019 ) ) ( not ( = ?auto_824018 ?auto_824020 ) ) ( not ( = ?auto_824018 ?auto_824021 ) ) ( not ( = ?auto_824019 ?auto_824020 ) ) ( not ( = ?auto_824019 ?auto_824021 ) ) ( not ( = ?auto_824020 ?auto_824021 ) ) ( ON ?auto_824019 ?auto_824020 ) ( ON ?auto_824018 ?auto_824019 ) ( ON ?auto_824017 ?auto_824018 ) ( ON ?auto_824016 ?auto_824017 ) ( ON ?auto_824015 ?auto_824016 ) ( ON ?auto_824014 ?auto_824015 ) ( ON ?auto_824013 ?auto_824014 ) ( ON ?auto_824012 ?auto_824013 ) ( ON ?auto_824011 ?auto_824012 ) ( ON ?auto_824010 ?auto_824011 ) ( ON ?auto_824009 ?auto_824010 ) ( ON ?auto_824008 ?auto_824009 ) ( ON ?auto_824007 ?auto_824008 ) ( ON ?auto_824006 ?auto_824007 ) ( CLEAR ?auto_824006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_824006 )
      ( MAKE-15PILE ?auto_824006 ?auto_824007 ?auto_824008 ?auto_824009 ?auto_824010 ?auto_824011 ?auto_824012 ?auto_824013 ?auto_824014 ?auto_824015 ?auto_824016 ?auto_824017 ?auto_824018 ?auto_824019 ?auto_824020 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824069 - BLOCK
      ?auto_824070 - BLOCK
      ?auto_824071 - BLOCK
      ?auto_824072 - BLOCK
      ?auto_824073 - BLOCK
      ?auto_824074 - BLOCK
      ?auto_824075 - BLOCK
      ?auto_824076 - BLOCK
      ?auto_824077 - BLOCK
      ?auto_824078 - BLOCK
      ?auto_824079 - BLOCK
      ?auto_824080 - BLOCK
      ?auto_824081 - BLOCK
      ?auto_824082 - BLOCK
      ?auto_824083 - BLOCK
      ?auto_824084 - BLOCK
    )
    :vars
    (
      ?auto_824085 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_824083 ) ( ON ?auto_824084 ?auto_824085 ) ( CLEAR ?auto_824084 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_824069 ) ( ON ?auto_824070 ?auto_824069 ) ( ON ?auto_824071 ?auto_824070 ) ( ON ?auto_824072 ?auto_824071 ) ( ON ?auto_824073 ?auto_824072 ) ( ON ?auto_824074 ?auto_824073 ) ( ON ?auto_824075 ?auto_824074 ) ( ON ?auto_824076 ?auto_824075 ) ( ON ?auto_824077 ?auto_824076 ) ( ON ?auto_824078 ?auto_824077 ) ( ON ?auto_824079 ?auto_824078 ) ( ON ?auto_824080 ?auto_824079 ) ( ON ?auto_824081 ?auto_824080 ) ( ON ?auto_824082 ?auto_824081 ) ( ON ?auto_824083 ?auto_824082 ) ( not ( = ?auto_824069 ?auto_824070 ) ) ( not ( = ?auto_824069 ?auto_824071 ) ) ( not ( = ?auto_824069 ?auto_824072 ) ) ( not ( = ?auto_824069 ?auto_824073 ) ) ( not ( = ?auto_824069 ?auto_824074 ) ) ( not ( = ?auto_824069 ?auto_824075 ) ) ( not ( = ?auto_824069 ?auto_824076 ) ) ( not ( = ?auto_824069 ?auto_824077 ) ) ( not ( = ?auto_824069 ?auto_824078 ) ) ( not ( = ?auto_824069 ?auto_824079 ) ) ( not ( = ?auto_824069 ?auto_824080 ) ) ( not ( = ?auto_824069 ?auto_824081 ) ) ( not ( = ?auto_824069 ?auto_824082 ) ) ( not ( = ?auto_824069 ?auto_824083 ) ) ( not ( = ?auto_824069 ?auto_824084 ) ) ( not ( = ?auto_824069 ?auto_824085 ) ) ( not ( = ?auto_824070 ?auto_824071 ) ) ( not ( = ?auto_824070 ?auto_824072 ) ) ( not ( = ?auto_824070 ?auto_824073 ) ) ( not ( = ?auto_824070 ?auto_824074 ) ) ( not ( = ?auto_824070 ?auto_824075 ) ) ( not ( = ?auto_824070 ?auto_824076 ) ) ( not ( = ?auto_824070 ?auto_824077 ) ) ( not ( = ?auto_824070 ?auto_824078 ) ) ( not ( = ?auto_824070 ?auto_824079 ) ) ( not ( = ?auto_824070 ?auto_824080 ) ) ( not ( = ?auto_824070 ?auto_824081 ) ) ( not ( = ?auto_824070 ?auto_824082 ) ) ( not ( = ?auto_824070 ?auto_824083 ) ) ( not ( = ?auto_824070 ?auto_824084 ) ) ( not ( = ?auto_824070 ?auto_824085 ) ) ( not ( = ?auto_824071 ?auto_824072 ) ) ( not ( = ?auto_824071 ?auto_824073 ) ) ( not ( = ?auto_824071 ?auto_824074 ) ) ( not ( = ?auto_824071 ?auto_824075 ) ) ( not ( = ?auto_824071 ?auto_824076 ) ) ( not ( = ?auto_824071 ?auto_824077 ) ) ( not ( = ?auto_824071 ?auto_824078 ) ) ( not ( = ?auto_824071 ?auto_824079 ) ) ( not ( = ?auto_824071 ?auto_824080 ) ) ( not ( = ?auto_824071 ?auto_824081 ) ) ( not ( = ?auto_824071 ?auto_824082 ) ) ( not ( = ?auto_824071 ?auto_824083 ) ) ( not ( = ?auto_824071 ?auto_824084 ) ) ( not ( = ?auto_824071 ?auto_824085 ) ) ( not ( = ?auto_824072 ?auto_824073 ) ) ( not ( = ?auto_824072 ?auto_824074 ) ) ( not ( = ?auto_824072 ?auto_824075 ) ) ( not ( = ?auto_824072 ?auto_824076 ) ) ( not ( = ?auto_824072 ?auto_824077 ) ) ( not ( = ?auto_824072 ?auto_824078 ) ) ( not ( = ?auto_824072 ?auto_824079 ) ) ( not ( = ?auto_824072 ?auto_824080 ) ) ( not ( = ?auto_824072 ?auto_824081 ) ) ( not ( = ?auto_824072 ?auto_824082 ) ) ( not ( = ?auto_824072 ?auto_824083 ) ) ( not ( = ?auto_824072 ?auto_824084 ) ) ( not ( = ?auto_824072 ?auto_824085 ) ) ( not ( = ?auto_824073 ?auto_824074 ) ) ( not ( = ?auto_824073 ?auto_824075 ) ) ( not ( = ?auto_824073 ?auto_824076 ) ) ( not ( = ?auto_824073 ?auto_824077 ) ) ( not ( = ?auto_824073 ?auto_824078 ) ) ( not ( = ?auto_824073 ?auto_824079 ) ) ( not ( = ?auto_824073 ?auto_824080 ) ) ( not ( = ?auto_824073 ?auto_824081 ) ) ( not ( = ?auto_824073 ?auto_824082 ) ) ( not ( = ?auto_824073 ?auto_824083 ) ) ( not ( = ?auto_824073 ?auto_824084 ) ) ( not ( = ?auto_824073 ?auto_824085 ) ) ( not ( = ?auto_824074 ?auto_824075 ) ) ( not ( = ?auto_824074 ?auto_824076 ) ) ( not ( = ?auto_824074 ?auto_824077 ) ) ( not ( = ?auto_824074 ?auto_824078 ) ) ( not ( = ?auto_824074 ?auto_824079 ) ) ( not ( = ?auto_824074 ?auto_824080 ) ) ( not ( = ?auto_824074 ?auto_824081 ) ) ( not ( = ?auto_824074 ?auto_824082 ) ) ( not ( = ?auto_824074 ?auto_824083 ) ) ( not ( = ?auto_824074 ?auto_824084 ) ) ( not ( = ?auto_824074 ?auto_824085 ) ) ( not ( = ?auto_824075 ?auto_824076 ) ) ( not ( = ?auto_824075 ?auto_824077 ) ) ( not ( = ?auto_824075 ?auto_824078 ) ) ( not ( = ?auto_824075 ?auto_824079 ) ) ( not ( = ?auto_824075 ?auto_824080 ) ) ( not ( = ?auto_824075 ?auto_824081 ) ) ( not ( = ?auto_824075 ?auto_824082 ) ) ( not ( = ?auto_824075 ?auto_824083 ) ) ( not ( = ?auto_824075 ?auto_824084 ) ) ( not ( = ?auto_824075 ?auto_824085 ) ) ( not ( = ?auto_824076 ?auto_824077 ) ) ( not ( = ?auto_824076 ?auto_824078 ) ) ( not ( = ?auto_824076 ?auto_824079 ) ) ( not ( = ?auto_824076 ?auto_824080 ) ) ( not ( = ?auto_824076 ?auto_824081 ) ) ( not ( = ?auto_824076 ?auto_824082 ) ) ( not ( = ?auto_824076 ?auto_824083 ) ) ( not ( = ?auto_824076 ?auto_824084 ) ) ( not ( = ?auto_824076 ?auto_824085 ) ) ( not ( = ?auto_824077 ?auto_824078 ) ) ( not ( = ?auto_824077 ?auto_824079 ) ) ( not ( = ?auto_824077 ?auto_824080 ) ) ( not ( = ?auto_824077 ?auto_824081 ) ) ( not ( = ?auto_824077 ?auto_824082 ) ) ( not ( = ?auto_824077 ?auto_824083 ) ) ( not ( = ?auto_824077 ?auto_824084 ) ) ( not ( = ?auto_824077 ?auto_824085 ) ) ( not ( = ?auto_824078 ?auto_824079 ) ) ( not ( = ?auto_824078 ?auto_824080 ) ) ( not ( = ?auto_824078 ?auto_824081 ) ) ( not ( = ?auto_824078 ?auto_824082 ) ) ( not ( = ?auto_824078 ?auto_824083 ) ) ( not ( = ?auto_824078 ?auto_824084 ) ) ( not ( = ?auto_824078 ?auto_824085 ) ) ( not ( = ?auto_824079 ?auto_824080 ) ) ( not ( = ?auto_824079 ?auto_824081 ) ) ( not ( = ?auto_824079 ?auto_824082 ) ) ( not ( = ?auto_824079 ?auto_824083 ) ) ( not ( = ?auto_824079 ?auto_824084 ) ) ( not ( = ?auto_824079 ?auto_824085 ) ) ( not ( = ?auto_824080 ?auto_824081 ) ) ( not ( = ?auto_824080 ?auto_824082 ) ) ( not ( = ?auto_824080 ?auto_824083 ) ) ( not ( = ?auto_824080 ?auto_824084 ) ) ( not ( = ?auto_824080 ?auto_824085 ) ) ( not ( = ?auto_824081 ?auto_824082 ) ) ( not ( = ?auto_824081 ?auto_824083 ) ) ( not ( = ?auto_824081 ?auto_824084 ) ) ( not ( = ?auto_824081 ?auto_824085 ) ) ( not ( = ?auto_824082 ?auto_824083 ) ) ( not ( = ?auto_824082 ?auto_824084 ) ) ( not ( = ?auto_824082 ?auto_824085 ) ) ( not ( = ?auto_824083 ?auto_824084 ) ) ( not ( = ?auto_824083 ?auto_824085 ) ) ( not ( = ?auto_824084 ?auto_824085 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_824084 ?auto_824085 )
      ( !STACK ?auto_824084 ?auto_824083 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824135 - BLOCK
      ?auto_824136 - BLOCK
      ?auto_824137 - BLOCK
      ?auto_824138 - BLOCK
      ?auto_824139 - BLOCK
      ?auto_824140 - BLOCK
      ?auto_824141 - BLOCK
      ?auto_824142 - BLOCK
      ?auto_824143 - BLOCK
      ?auto_824144 - BLOCK
      ?auto_824145 - BLOCK
      ?auto_824146 - BLOCK
      ?auto_824147 - BLOCK
      ?auto_824148 - BLOCK
      ?auto_824149 - BLOCK
      ?auto_824150 - BLOCK
    )
    :vars
    (
      ?auto_824151 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824150 ?auto_824151 ) ( ON-TABLE ?auto_824135 ) ( ON ?auto_824136 ?auto_824135 ) ( ON ?auto_824137 ?auto_824136 ) ( ON ?auto_824138 ?auto_824137 ) ( ON ?auto_824139 ?auto_824138 ) ( ON ?auto_824140 ?auto_824139 ) ( ON ?auto_824141 ?auto_824140 ) ( ON ?auto_824142 ?auto_824141 ) ( ON ?auto_824143 ?auto_824142 ) ( ON ?auto_824144 ?auto_824143 ) ( ON ?auto_824145 ?auto_824144 ) ( ON ?auto_824146 ?auto_824145 ) ( ON ?auto_824147 ?auto_824146 ) ( ON ?auto_824148 ?auto_824147 ) ( not ( = ?auto_824135 ?auto_824136 ) ) ( not ( = ?auto_824135 ?auto_824137 ) ) ( not ( = ?auto_824135 ?auto_824138 ) ) ( not ( = ?auto_824135 ?auto_824139 ) ) ( not ( = ?auto_824135 ?auto_824140 ) ) ( not ( = ?auto_824135 ?auto_824141 ) ) ( not ( = ?auto_824135 ?auto_824142 ) ) ( not ( = ?auto_824135 ?auto_824143 ) ) ( not ( = ?auto_824135 ?auto_824144 ) ) ( not ( = ?auto_824135 ?auto_824145 ) ) ( not ( = ?auto_824135 ?auto_824146 ) ) ( not ( = ?auto_824135 ?auto_824147 ) ) ( not ( = ?auto_824135 ?auto_824148 ) ) ( not ( = ?auto_824135 ?auto_824149 ) ) ( not ( = ?auto_824135 ?auto_824150 ) ) ( not ( = ?auto_824135 ?auto_824151 ) ) ( not ( = ?auto_824136 ?auto_824137 ) ) ( not ( = ?auto_824136 ?auto_824138 ) ) ( not ( = ?auto_824136 ?auto_824139 ) ) ( not ( = ?auto_824136 ?auto_824140 ) ) ( not ( = ?auto_824136 ?auto_824141 ) ) ( not ( = ?auto_824136 ?auto_824142 ) ) ( not ( = ?auto_824136 ?auto_824143 ) ) ( not ( = ?auto_824136 ?auto_824144 ) ) ( not ( = ?auto_824136 ?auto_824145 ) ) ( not ( = ?auto_824136 ?auto_824146 ) ) ( not ( = ?auto_824136 ?auto_824147 ) ) ( not ( = ?auto_824136 ?auto_824148 ) ) ( not ( = ?auto_824136 ?auto_824149 ) ) ( not ( = ?auto_824136 ?auto_824150 ) ) ( not ( = ?auto_824136 ?auto_824151 ) ) ( not ( = ?auto_824137 ?auto_824138 ) ) ( not ( = ?auto_824137 ?auto_824139 ) ) ( not ( = ?auto_824137 ?auto_824140 ) ) ( not ( = ?auto_824137 ?auto_824141 ) ) ( not ( = ?auto_824137 ?auto_824142 ) ) ( not ( = ?auto_824137 ?auto_824143 ) ) ( not ( = ?auto_824137 ?auto_824144 ) ) ( not ( = ?auto_824137 ?auto_824145 ) ) ( not ( = ?auto_824137 ?auto_824146 ) ) ( not ( = ?auto_824137 ?auto_824147 ) ) ( not ( = ?auto_824137 ?auto_824148 ) ) ( not ( = ?auto_824137 ?auto_824149 ) ) ( not ( = ?auto_824137 ?auto_824150 ) ) ( not ( = ?auto_824137 ?auto_824151 ) ) ( not ( = ?auto_824138 ?auto_824139 ) ) ( not ( = ?auto_824138 ?auto_824140 ) ) ( not ( = ?auto_824138 ?auto_824141 ) ) ( not ( = ?auto_824138 ?auto_824142 ) ) ( not ( = ?auto_824138 ?auto_824143 ) ) ( not ( = ?auto_824138 ?auto_824144 ) ) ( not ( = ?auto_824138 ?auto_824145 ) ) ( not ( = ?auto_824138 ?auto_824146 ) ) ( not ( = ?auto_824138 ?auto_824147 ) ) ( not ( = ?auto_824138 ?auto_824148 ) ) ( not ( = ?auto_824138 ?auto_824149 ) ) ( not ( = ?auto_824138 ?auto_824150 ) ) ( not ( = ?auto_824138 ?auto_824151 ) ) ( not ( = ?auto_824139 ?auto_824140 ) ) ( not ( = ?auto_824139 ?auto_824141 ) ) ( not ( = ?auto_824139 ?auto_824142 ) ) ( not ( = ?auto_824139 ?auto_824143 ) ) ( not ( = ?auto_824139 ?auto_824144 ) ) ( not ( = ?auto_824139 ?auto_824145 ) ) ( not ( = ?auto_824139 ?auto_824146 ) ) ( not ( = ?auto_824139 ?auto_824147 ) ) ( not ( = ?auto_824139 ?auto_824148 ) ) ( not ( = ?auto_824139 ?auto_824149 ) ) ( not ( = ?auto_824139 ?auto_824150 ) ) ( not ( = ?auto_824139 ?auto_824151 ) ) ( not ( = ?auto_824140 ?auto_824141 ) ) ( not ( = ?auto_824140 ?auto_824142 ) ) ( not ( = ?auto_824140 ?auto_824143 ) ) ( not ( = ?auto_824140 ?auto_824144 ) ) ( not ( = ?auto_824140 ?auto_824145 ) ) ( not ( = ?auto_824140 ?auto_824146 ) ) ( not ( = ?auto_824140 ?auto_824147 ) ) ( not ( = ?auto_824140 ?auto_824148 ) ) ( not ( = ?auto_824140 ?auto_824149 ) ) ( not ( = ?auto_824140 ?auto_824150 ) ) ( not ( = ?auto_824140 ?auto_824151 ) ) ( not ( = ?auto_824141 ?auto_824142 ) ) ( not ( = ?auto_824141 ?auto_824143 ) ) ( not ( = ?auto_824141 ?auto_824144 ) ) ( not ( = ?auto_824141 ?auto_824145 ) ) ( not ( = ?auto_824141 ?auto_824146 ) ) ( not ( = ?auto_824141 ?auto_824147 ) ) ( not ( = ?auto_824141 ?auto_824148 ) ) ( not ( = ?auto_824141 ?auto_824149 ) ) ( not ( = ?auto_824141 ?auto_824150 ) ) ( not ( = ?auto_824141 ?auto_824151 ) ) ( not ( = ?auto_824142 ?auto_824143 ) ) ( not ( = ?auto_824142 ?auto_824144 ) ) ( not ( = ?auto_824142 ?auto_824145 ) ) ( not ( = ?auto_824142 ?auto_824146 ) ) ( not ( = ?auto_824142 ?auto_824147 ) ) ( not ( = ?auto_824142 ?auto_824148 ) ) ( not ( = ?auto_824142 ?auto_824149 ) ) ( not ( = ?auto_824142 ?auto_824150 ) ) ( not ( = ?auto_824142 ?auto_824151 ) ) ( not ( = ?auto_824143 ?auto_824144 ) ) ( not ( = ?auto_824143 ?auto_824145 ) ) ( not ( = ?auto_824143 ?auto_824146 ) ) ( not ( = ?auto_824143 ?auto_824147 ) ) ( not ( = ?auto_824143 ?auto_824148 ) ) ( not ( = ?auto_824143 ?auto_824149 ) ) ( not ( = ?auto_824143 ?auto_824150 ) ) ( not ( = ?auto_824143 ?auto_824151 ) ) ( not ( = ?auto_824144 ?auto_824145 ) ) ( not ( = ?auto_824144 ?auto_824146 ) ) ( not ( = ?auto_824144 ?auto_824147 ) ) ( not ( = ?auto_824144 ?auto_824148 ) ) ( not ( = ?auto_824144 ?auto_824149 ) ) ( not ( = ?auto_824144 ?auto_824150 ) ) ( not ( = ?auto_824144 ?auto_824151 ) ) ( not ( = ?auto_824145 ?auto_824146 ) ) ( not ( = ?auto_824145 ?auto_824147 ) ) ( not ( = ?auto_824145 ?auto_824148 ) ) ( not ( = ?auto_824145 ?auto_824149 ) ) ( not ( = ?auto_824145 ?auto_824150 ) ) ( not ( = ?auto_824145 ?auto_824151 ) ) ( not ( = ?auto_824146 ?auto_824147 ) ) ( not ( = ?auto_824146 ?auto_824148 ) ) ( not ( = ?auto_824146 ?auto_824149 ) ) ( not ( = ?auto_824146 ?auto_824150 ) ) ( not ( = ?auto_824146 ?auto_824151 ) ) ( not ( = ?auto_824147 ?auto_824148 ) ) ( not ( = ?auto_824147 ?auto_824149 ) ) ( not ( = ?auto_824147 ?auto_824150 ) ) ( not ( = ?auto_824147 ?auto_824151 ) ) ( not ( = ?auto_824148 ?auto_824149 ) ) ( not ( = ?auto_824148 ?auto_824150 ) ) ( not ( = ?auto_824148 ?auto_824151 ) ) ( not ( = ?auto_824149 ?auto_824150 ) ) ( not ( = ?auto_824149 ?auto_824151 ) ) ( not ( = ?auto_824150 ?auto_824151 ) ) ( CLEAR ?auto_824148 ) ( ON ?auto_824149 ?auto_824150 ) ( CLEAR ?auto_824149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_824135 ?auto_824136 ?auto_824137 ?auto_824138 ?auto_824139 ?auto_824140 ?auto_824141 ?auto_824142 ?auto_824143 ?auto_824144 ?auto_824145 ?auto_824146 ?auto_824147 ?auto_824148 ?auto_824149 )
      ( MAKE-16PILE ?auto_824135 ?auto_824136 ?auto_824137 ?auto_824138 ?auto_824139 ?auto_824140 ?auto_824141 ?auto_824142 ?auto_824143 ?auto_824144 ?auto_824145 ?auto_824146 ?auto_824147 ?auto_824148 ?auto_824149 ?auto_824150 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824201 - BLOCK
      ?auto_824202 - BLOCK
      ?auto_824203 - BLOCK
      ?auto_824204 - BLOCK
      ?auto_824205 - BLOCK
      ?auto_824206 - BLOCK
      ?auto_824207 - BLOCK
      ?auto_824208 - BLOCK
      ?auto_824209 - BLOCK
      ?auto_824210 - BLOCK
      ?auto_824211 - BLOCK
      ?auto_824212 - BLOCK
      ?auto_824213 - BLOCK
      ?auto_824214 - BLOCK
      ?auto_824215 - BLOCK
      ?auto_824216 - BLOCK
    )
    :vars
    (
      ?auto_824217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824216 ?auto_824217 ) ( ON-TABLE ?auto_824201 ) ( ON ?auto_824202 ?auto_824201 ) ( ON ?auto_824203 ?auto_824202 ) ( ON ?auto_824204 ?auto_824203 ) ( ON ?auto_824205 ?auto_824204 ) ( ON ?auto_824206 ?auto_824205 ) ( ON ?auto_824207 ?auto_824206 ) ( ON ?auto_824208 ?auto_824207 ) ( ON ?auto_824209 ?auto_824208 ) ( ON ?auto_824210 ?auto_824209 ) ( ON ?auto_824211 ?auto_824210 ) ( ON ?auto_824212 ?auto_824211 ) ( ON ?auto_824213 ?auto_824212 ) ( not ( = ?auto_824201 ?auto_824202 ) ) ( not ( = ?auto_824201 ?auto_824203 ) ) ( not ( = ?auto_824201 ?auto_824204 ) ) ( not ( = ?auto_824201 ?auto_824205 ) ) ( not ( = ?auto_824201 ?auto_824206 ) ) ( not ( = ?auto_824201 ?auto_824207 ) ) ( not ( = ?auto_824201 ?auto_824208 ) ) ( not ( = ?auto_824201 ?auto_824209 ) ) ( not ( = ?auto_824201 ?auto_824210 ) ) ( not ( = ?auto_824201 ?auto_824211 ) ) ( not ( = ?auto_824201 ?auto_824212 ) ) ( not ( = ?auto_824201 ?auto_824213 ) ) ( not ( = ?auto_824201 ?auto_824214 ) ) ( not ( = ?auto_824201 ?auto_824215 ) ) ( not ( = ?auto_824201 ?auto_824216 ) ) ( not ( = ?auto_824201 ?auto_824217 ) ) ( not ( = ?auto_824202 ?auto_824203 ) ) ( not ( = ?auto_824202 ?auto_824204 ) ) ( not ( = ?auto_824202 ?auto_824205 ) ) ( not ( = ?auto_824202 ?auto_824206 ) ) ( not ( = ?auto_824202 ?auto_824207 ) ) ( not ( = ?auto_824202 ?auto_824208 ) ) ( not ( = ?auto_824202 ?auto_824209 ) ) ( not ( = ?auto_824202 ?auto_824210 ) ) ( not ( = ?auto_824202 ?auto_824211 ) ) ( not ( = ?auto_824202 ?auto_824212 ) ) ( not ( = ?auto_824202 ?auto_824213 ) ) ( not ( = ?auto_824202 ?auto_824214 ) ) ( not ( = ?auto_824202 ?auto_824215 ) ) ( not ( = ?auto_824202 ?auto_824216 ) ) ( not ( = ?auto_824202 ?auto_824217 ) ) ( not ( = ?auto_824203 ?auto_824204 ) ) ( not ( = ?auto_824203 ?auto_824205 ) ) ( not ( = ?auto_824203 ?auto_824206 ) ) ( not ( = ?auto_824203 ?auto_824207 ) ) ( not ( = ?auto_824203 ?auto_824208 ) ) ( not ( = ?auto_824203 ?auto_824209 ) ) ( not ( = ?auto_824203 ?auto_824210 ) ) ( not ( = ?auto_824203 ?auto_824211 ) ) ( not ( = ?auto_824203 ?auto_824212 ) ) ( not ( = ?auto_824203 ?auto_824213 ) ) ( not ( = ?auto_824203 ?auto_824214 ) ) ( not ( = ?auto_824203 ?auto_824215 ) ) ( not ( = ?auto_824203 ?auto_824216 ) ) ( not ( = ?auto_824203 ?auto_824217 ) ) ( not ( = ?auto_824204 ?auto_824205 ) ) ( not ( = ?auto_824204 ?auto_824206 ) ) ( not ( = ?auto_824204 ?auto_824207 ) ) ( not ( = ?auto_824204 ?auto_824208 ) ) ( not ( = ?auto_824204 ?auto_824209 ) ) ( not ( = ?auto_824204 ?auto_824210 ) ) ( not ( = ?auto_824204 ?auto_824211 ) ) ( not ( = ?auto_824204 ?auto_824212 ) ) ( not ( = ?auto_824204 ?auto_824213 ) ) ( not ( = ?auto_824204 ?auto_824214 ) ) ( not ( = ?auto_824204 ?auto_824215 ) ) ( not ( = ?auto_824204 ?auto_824216 ) ) ( not ( = ?auto_824204 ?auto_824217 ) ) ( not ( = ?auto_824205 ?auto_824206 ) ) ( not ( = ?auto_824205 ?auto_824207 ) ) ( not ( = ?auto_824205 ?auto_824208 ) ) ( not ( = ?auto_824205 ?auto_824209 ) ) ( not ( = ?auto_824205 ?auto_824210 ) ) ( not ( = ?auto_824205 ?auto_824211 ) ) ( not ( = ?auto_824205 ?auto_824212 ) ) ( not ( = ?auto_824205 ?auto_824213 ) ) ( not ( = ?auto_824205 ?auto_824214 ) ) ( not ( = ?auto_824205 ?auto_824215 ) ) ( not ( = ?auto_824205 ?auto_824216 ) ) ( not ( = ?auto_824205 ?auto_824217 ) ) ( not ( = ?auto_824206 ?auto_824207 ) ) ( not ( = ?auto_824206 ?auto_824208 ) ) ( not ( = ?auto_824206 ?auto_824209 ) ) ( not ( = ?auto_824206 ?auto_824210 ) ) ( not ( = ?auto_824206 ?auto_824211 ) ) ( not ( = ?auto_824206 ?auto_824212 ) ) ( not ( = ?auto_824206 ?auto_824213 ) ) ( not ( = ?auto_824206 ?auto_824214 ) ) ( not ( = ?auto_824206 ?auto_824215 ) ) ( not ( = ?auto_824206 ?auto_824216 ) ) ( not ( = ?auto_824206 ?auto_824217 ) ) ( not ( = ?auto_824207 ?auto_824208 ) ) ( not ( = ?auto_824207 ?auto_824209 ) ) ( not ( = ?auto_824207 ?auto_824210 ) ) ( not ( = ?auto_824207 ?auto_824211 ) ) ( not ( = ?auto_824207 ?auto_824212 ) ) ( not ( = ?auto_824207 ?auto_824213 ) ) ( not ( = ?auto_824207 ?auto_824214 ) ) ( not ( = ?auto_824207 ?auto_824215 ) ) ( not ( = ?auto_824207 ?auto_824216 ) ) ( not ( = ?auto_824207 ?auto_824217 ) ) ( not ( = ?auto_824208 ?auto_824209 ) ) ( not ( = ?auto_824208 ?auto_824210 ) ) ( not ( = ?auto_824208 ?auto_824211 ) ) ( not ( = ?auto_824208 ?auto_824212 ) ) ( not ( = ?auto_824208 ?auto_824213 ) ) ( not ( = ?auto_824208 ?auto_824214 ) ) ( not ( = ?auto_824208 ?auto_824215 ) ) ( not ( = ?auto_824208 ?auto_824216 ) ) ( not ( = ?auto_824208 ?auto_824217 ) ) ( not ( = ?auto_824209 ?auto_824210 ) ) ( not ( = ?auto_824209 ?auto_824211 ) ) ( not ( = ?auto_824209 ?auto_824212 ) ) ( not ( = ?auto_824209 ?auto_824213 ) ) ( not ( = ?auto_824209 ?auto_824214 ) ) ( not ( = ?auto_824209 ?auto_824215 ) ) ( not ( = ?auto_824209 ?auto_824216 ) ) ( not ( = ?auto_824209 ?auto_824217 ) ) ( not ( = ?auto_824210 ?auto_824211 ) ) ( not ( = ?auto_824210 ?auto_824212 ) ) ( not ( = ?auto_824210 ?auto_824213 ) ) ( not ( = ?auto_824210 ?auto_824214 ) ) ( not ( = ?auto_824210 ?auto_824215 ) ) ( not ( = ?auto_824210 ?auto_824216 ) ) ( not ( = ?auto_824210 ?auto_824217 ) ) ( not ( = ?auto_824211 ?auto_824212 ) ) ( not ( = ?auto_824211 ?auto_824213 ) ) ( not ( = ?auto_824211 ?auto_824214 ) ) ( not ( = ?auto_824211 ?auto_824215 ) ) ( not ( = ?auto_824211 ?auto_824216 ) ) ( not ( = ?auto_824211 ?auto_824217 ) ) ( not ( = ?auto_824212 ?auto_824213 ) ) ( not ( = ?auto_824212 ?auto_824214 ) ) ( not ( = ?auto_824212 ?auto_824215 ) ) ( not ( = ?auto_824212 ?auto_824216 ) ) ( not ( = ?auto_824212 ?auto_824217 ) ) ( not ( = ?auto_824213 ?auto_824214 ) ) ( not ( = ?auto_824213 ?auto_824215 ) ) ( not ( = ?auto_824213 ?auto_824216 ) ) ( not ( = ?auto_824213 ?auto_824217 ) ) ( not ( = ?auto_824214 ?auto_824215 ) ) ( not ( = ?auto_824214 ?auto_824216 ) ) ( not ( = ?auto_824214 ?auto_824217 ) ) ( not ( = ?auto_824215 ?auto_824216 ) ) ( not ( = ?auto_824215 ?auto_824217 ) ) ( not ( = ?auto_824216 ?auto_824217 ) ) ( ON ?auto_824215 ?auto_824216 ) ( CLEAR ?auto_824213 ) ( ON ?auto_824214 ?auto_824215 ) ( CLEAR ?auto_824214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_824201 ?auto_824202 ?auto_824203 ?auto_824204 ?auto_824205 ?auto_824206 ?auto_824207 ?auto_824208 ?auto_824209 ?auto_824210 ?auto_824211 ?auto_824212 ?auto_824213 ?auto_824214 )
      ( MAKE-16PILE ?auto_824201 ?auto_824202 ?auto_824203 ?auto_824204 ?auto_824205 ?auto_824206 ?auto_824207 ?auto_824208 ?auto_824209 ?auto_824210 ?auto_824211 ?auto_824212 ?auto_824213 ?auto_824214 ?auto_824215 ?auto_824216 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824267 - BLOCK
      ?auto_824268 - BLOCK
      ?auto_824269 - BLOCK
      ?auto_824270 - BLOCK
      ?auto_824271 - BLOCK
      ?auto_824272 - BLOCK
      ?auto_824273 - BLOCK
      ?auto_824274 - BLOCK
      ?auto_824275 - BLOCK
      ?auto_824276 - BLOCK
      ?auto_824277 - BLOCK
      ?auto_824278 - BLOCK
      ?auto_824279 - BLOCK
      ?auto_824280 - BLOCK
      ?auto_824281 - BLOCK
      ?auto_824282 - BLOCK
    )
    :vars
    (
      ?auto_824283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824282 ?auto_824283 ) ( ON-TABLE ?auto_824267 ) ( ON ?auto_824268 ?auto_824267 ) ( ON ?auto_824269 ?auto_824268 ) ( ON ?auto_824270 ?auto_824269 ) ( ON ?auto_824271 ?auto_824270 ) ( ON ?auto_824272 ?auto_824271 ) ( ON ?auto_824273 ?auto_824272 ) ( ON ?auto_824274 ?auto_824273 ) ( ON ?auto_824275 ?auto_824274 ) ( ON ?auto_824276 ?auto_824275 ) ( ON ?auto_824277 ?auto_824276 ) ( ON ?auto_824278 ?auto_824277 ) ( not ( = ?auto_824267 ?auto_824268 ) ) ( not ( = ?auto_824267 ?auto_824269 ) ) ( not ( = ?auto_824267 ?auto_824270 ) ) ( not ( = ?auto_824267 ?auto_824271 ) ) ( not ( = ?auto_824267 ?auto_824272 ) ) ( not ( = ?auto_824267 ?auto_824273 ) ) ( not ( = ?auto_824267 ?auto_824274 ) ) ( not ( = ?auto_824267 ?auto_824275 ) ) ( not ( = ?auto_824267 ?auto_824276 ) ) ( not ( = ?auto_824267 ?auto_824277 ) ) ( not ( = ?auto_824267 ?auto_824278 ) ) ( not ( = ?auto_824267 ?auto_824279 ) ) ( not ( = ?auto_824267 ?auto_824280 ) ) ( not ( = ?auto_824267 ?auto_824281 ) ) ( not ( = ?auto_824267 ?auto_824282 ) ) ( not ( = ?auto_824267 ?auto_824283 ) ) ( not ( = ?auto_824268 ?auto_824269 ) ) ( not ( = ?auto_824268 ?auto_824270 ) ) ( not ( = ?auto_824268 ?auto_824271 ) ) ( not ( = ?auto_824268 ?auto_824272 ) ) ( not ( = ?auto_824268 ?auto_824273 ) ) ( not ( = ?auto_824268 ?auto_824274 ) ) ( not ( = ?auto_824268 ?auto_824275 ) ) ( not ( = ?auto_824268 ?auto_824276 ) ) ( not ( = ?auto_824268 ?auto_824277 ) ) ( not ( = ?auto_824268 ?auto_824278 ) ) ( not ( = ?auto_824268 ?auto_824279 ) ) ( not ( = ?auto_824268 ?auto_824280 ) ) ( not ( = ?auto_824268 ?auto_824281 ) ) ( not ( = ?auto_824268 ?auto_824282 ) ) ( not ( = ?auto_824268 ?auto_824283 ) ) ( not ( = ?auto_824269 ?auto_824270 ) ) ( not ( = ?auto_824269 ?auto_824271 ) ) ( not ( = ?auto_824269 ?auto_824272 ) ) ( not ( = ?auto_824269 ?auto_824273 ) ) ( not ( = ?auto_824269 ?auto_824274 ) ) ( not ( = ?auto_824269 ?auto_824275 ) ) ( not ( = ?auto_824269 ?auto_824276 ) ) ( not ( = ?auto_824269 ?auto_824277 ) ) ( not ( = ?auto_824269 ?auto_824278 ) ) ( not ( = ?auto_824269 ?auto_824279 ) ) ( not ( = ?auto_824269 ?auto_824280 ) ) ( not ( = ?auto_824269 ?auto_824281 ) ) ( not ( = ?auto_824269 ?auto_824282 ) ) ( not ( = ?auto_824269 ?auto_824283 ) ) ( not ( = ?auto_824270 ?auto_824271 ) ) ( not ( = ?auto_824270 ?auto_824272 ) ) ( not ( = ?auto_824270 ?auto_824273 ) ) ( not ( = ?auto_824270 ?auto_824274 ) ) ( not ( = ?auto_824270 ?auto_824275 ) ) ( not ( = ?auto_824270 ?auto_824276 ) ) ( not ( = ?auto_824270 ?auto_824277 ) ) ( not ( = ?auto_824270 ?auto_824278 ) ) ( not ( = ?auto_824270 ?auto_824279 ) ) ( not ( = ?auto_824270 ?auto_824280 ) ) ( not ( = ?auto_824270 ?auto_824281 ) ) ( not ( = ?auto_824270 ?auto_824282 ) ) ( not ( = ?auto_824270 ?auto_824283 ) ) ( not ( = ?auto_824271 ?auto_824272 ) ) ( not ( = ?auto_824271 ?auto_824273 ) ) ( not ( = ?auto_824271 ?auto_824274 ) ) ( not ( = ?auto_824271 ?auto_824275 ) ) ( not ( = ?auto_824271 ?auto_824276 ) ) ( not ( = ?auto_824271 ?auto_824277 ) ) ( not ( = ?auto_824271 ?auto_824278 ) ) ( not ( = ?auto_824271 ?auto_824279 ) ) ( not ( = ?auto_824271 ?auto_824280 ) ) ( not ( = ?auto_824271 ?auto_824281 ) ) ( not ( = ?auto_824271 ?auto_824282 ) ) ( not ( = ?auto_824271 ?auto_824283 ) ) ( not ( = ?auto_824272 ?auto_824273 ) ) ( not ( = ?auto_824272 ?auto_824274 ) ) ( not ( = ?auto_824272 ?auto_824275 ) ) ( not ( = ?auto_824272 ?auto_824276 ) ) ( not ( = ?auto_824272 ?auto_824277 ) ) ( not ( = ?auto_824272 ?auto_824278 ) ) ( not ( = ?auto_824272 ?auto_824279 ) ) ( not ( = ?auto_824272 ?auto_824280 ) ) ( not ( = ?auto_824272 ?auto_824281 ) ) ( not ( = ?auto_824272 ?auto_824282 ) ) ( not ( = ?auto_824272 ?auto_824283 ) ) ( not ( = ?auto_824273 ?auto_824274 ) ) ( not ( = ?auto_824273 ?auto_824275 ) ) ( not ( = ?auto_824273 ?auto_824276 ) ) ( not ( = ?auto_824273 ?auto_824277 ) ) ( not ( = ?auto_824273 ?auto_824278 ) ) ( not ( = ?auto_824273 ?auto_824279 ) ) ( not ( = ?auto_824273 ?auto_824280 ) ) ( not ( = ?auto_824273 ?auto_824281 ) ) ( not ( = ?auto_824273 ?auto_824282 ) ) ( not ( = ?auto_824273 ?auto_824283 ) ) ( not ( = ?auto_824274 ?auto_824275 ) ) ( not ( = ?auto_824274 ?auto_824276 ) ) ( not ( = ?auto_824274 ?auto_824277 ) ) ( not ( = ?auto_824274 ?auto_824278 ) ) ( not ( = ?auto_824274 ?auto_824279 ) ) ( not ( = ?auto_824274 ?auto_824280 ) ) ( not ( = ?auto_824274 ?auto_824281 ) ) ( not ( = ?auto_824274 ?auto_824282 ) ) ( not ( = ?auto_824274 ?auto_824283 ) ) ( not ( = ?auto_824275 ?auto_824276 ) ) ( not ( = ?auto_824275 ?auto_824277 ) ) ( not ( = ?auto_824275 ?auto_824278 ) ) ( not ( = ?auto_824275 ?auto_824279 ) ) ( not ( = ?auto_824275 ?auto_824280 ) ) ( not ( = ?auto_824275 ?auto_824281 ) ) ( not ( = ?auto_824275 ?auto_824282 ) ) ( not ( = ?auto_824275 ?auto_824283 ) ) ( not ( = ?auto_824276 ?auto_824277 ) ) ( not ( = ?auto_824276 ?auto_824278 ) ) ( not ( = ?auto_824276 ?auto_824279 ) ) ( not ( = ?auto_824276 ?auto_824280 ) ) ( not ( = ?auto_824276 ?auto_824281 ) ) ( not ( = ?auto_824276 ?auto_824282 ) ) ( not ( = ?auto_824276 ?auto_824283 ) ) ( not ( = ?auto_824277 ?auto_824278 ) ) ( not ( = ?auto_824277 ?auto_824279 ) ) ( not ( = ?auto_824277 ?auto_824280 ) ) ( not ( = ?auto_824277 ?auto_824281 ) ) ( not ( = ?auto_824277 ?auto_824282 ) ) ( not ( = ?auto_824277 ?auto_824283 ) ) ( not ( = ?auto_824278 ?auto_824279 ) ) ( not ( = ?auto_824278 ?auto_824280 ) ) ( not ( = ?auto_824278 ?auto_824281 ) ) ( not ( = ?auto_824278 ?auto_824282 ) ) ( not ( = ?auto_824278 ?auto_824283 ) ) ( not ( = ?auto_824279 ?auto_824280 ) ) ( not ( = ?auto_824279 ?auto_824281 ) ) ( not ( = ?auto_824279 ?auto_824282 ) ) ( not ( = ?auto_824279 ?auto_824283 ) ) ( not ( = ?auto_824280 ?auto_824281 ) ) ( not ( = ?auto_824280 ?auto_824282 ) ) ( not ( = ?auto_824280 ?auto_824283 ) ) ( not ( = ?auto_824281 ?auto_824282 ) ) ( not ( = ?auto_824281 ?auto_824283 ) ) ( not ( = ?auto_824282 ?auto_824283 ) ) ( ON ?auto_824281 ?auto_824282 ) ( ON ?auto_824280 ?auto_824281 ) ( CLEAR ?auto_824278 ) ( ON ?auto_824279 ?auto_824280 ) ( CLEAR ?auto_824279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_824267 ?auto_824268 ?auto_824269 ?auto_824270 ?auto_824271 ?auto_824272 ?auto_824273 ?auto_824274 ?auto_824275 ?auto_824276 ?auto_824277 ?auto_824278 ?auto_824279 )
      ( MAKE-16PILE ?auto_824267 ?auto_824268 ?auto_824269 ?auto_824270 ?auto_824271 ?auto_824272 ?auto_824273 ?auto_824274 ?auto_824275 ?auto_824276 ?auto_824277 ?auto_824278 ?auto_824279 ?auto_824280 ?auto_824281 ?auto_824282 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824333 - BLOCK
      ?auto_824334 - BLOCK
      ?auto_824335 - BLOCK
      ?auto_824336 - BLOCK
      ?auto_824337 - BLOCK
      ?auto_824338 - BLOCK
      ?auto_824339 - BLOCK
      ?auto_824340 - BLOCK
      ?auto_824341 - BLOCK
      ?auto_824342 - BLOCK
      ?auto_824343 - BLOCK
      ?auto_824344 - BLOCK
      ?auto_824345 - BLOCK
      ?auto_824346 - BLOCK
      ?auto_824347 - BLOCK
      ?auto_824348 - BLOCK
    )
    :vars
    (
      ?auto_824349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824348 ?auto_824349 ) ( ON-TABLE ?auto_824333 ) ( ON ?auto_824334 ?auto_824333 ) ( ON ?auto_824335 ?auto_824334 ) ( ON ?auto_824336 ?auto_824335 ) ( ON ?auto_824337 ?auto_824336 ) ( ON ?auto_824338 ?auto_824337 ) ( ON ?auto_824339 ?auto_824338 ) ( ON ?auto_824340 ?auto_824339 ) ( ON ?auto_824341 ?auto_824340 ) ( ON ?auto_824342 ?auto_824341 ) ( ON ?auto_824343 ?auto_824342 ) ( not ( = ?auto_824333 ?auto_824334 ) ) ( not ( = ?auto_824333 ?auto_824335 ) ) ( not ( = ?auto_824333 ?auto_824336 ) ) ( not ( = ?auto_824333 ?auto_824337 ) ) ( not ( = ?auto_824333 ?auto_824338 ) ) ( not ( = ?auto_824333 ?auto_824339 ) ) ( not ( = ?auto_824333 ?auto_824340 ) ) ( not ( = ?auto_824333 ?auto_824341 ) ) ( not ( = ?auto_824333 ?auto_824342 ) ) ( not ( = ?auto_824333 ?auto_824343 ) ) ( not ( = ?auto_824333 ?auto_824344 ) ) ( not ( = ?auto_824333 ?auto_824345 ) ) ( not ( = ?auto_824333 ?auto_824346 ) ) ( not ( = ?auto_824333 ?auto_824347 ) ) ( not ( = ?auto_824333 ?auto_824348 ) ) ( not ( = ?auto_824333 ?auto_824349 ) ) ( not ( = ?auto_824334 ?auto_824335 ) ) ( not ( = ?auto_824334 ?auto_824336 ) ) ( not ( = ?auto_824334 ?auto_824337 ) ) ( not ( = ?auto_824334 ?auto_824338 ) ) ( not ( = ?auto_824334 ?auto_824339 ) ) ( not ( = ?auto_824334 ?auto_824340 ) ) ( not ( = ?auto_824334 ?auto_824341 ) ) ( not ( = ?auto_824334 ?auto_824342 ) ) ( not ( = ?auto_824334 ?auto_824343 ) ) ( not ( = ?auto_824334 ?auto_824344 ) ) ( not ( = ?auto_824334 ?auto_824345 ) ) ( not ( = ?auto_824334 ?auto_824346 ) ) ( not ( = ?auto_824334 ?auto_824347 ) ) ( not ( = ?auto_824334 ?auto_824348 ) ) ( not ( = ?auto_824334 ?auto_824349 ) ) ( not ( = ?auto_824335 ?auto_824336 ) ) ( not ( = ?auto_824335 ?auto_824337 ) ) ( not ( = ?auto_824335 ?auto_824338 ) ) ( not ( = ?auto_824335 ?auto_824339 ) ) ( not ( = ?auto_824335 ?auto_824340 ) ) ( not ( = ?auto_824335 ?auto_824341 ) ) ( not ( = ?auto_824335 ?auto_824342 ) ) ( not ( = ?auto_824335 ?auto_824343 ) ) ( not ( = ?auto_824335 ?auto_824344 ) ) ( not ( = ?auto_824335 ?auto_824345 ) ) ( not ( = ?auto_824335 ?auto_824346 ) ) ( not ( = ?auto_824335 ?auto_824347 ) ) ( not ( = ?auto_824335 ?auto_824348 ) ) ( not ( = ?auto_824335 ?auto_824349 ) ) ( not ( = ?auto_824336 ?auto_824337 ) ) ( not ( = ?auto_824336 ?auto_824338 ) ) ( not ( = ?auto_824336 ?auto_824339 ) ) ( not ( = ?auto_824336 ?auto_824340 ) ) ( not ( = ?auto_824336 ?auto_824341 ) ) ( not ( = ?auto_824336 ?auto_824342 ) ) ( not ( = ?auto_824336 ?auto_824343 ) ) ( not ( = ?auto_824336 ?auto_824344 ) ) ( not ( = ?auto_824336 ?auto_824345 ) ) ( not ( = ?auto_824336 ?auto_824346 ) ) ( not ( = ?auto_824336 ?auto_824347 ) ) ( not ( = ?auto_824336 ?auto_824348 ) ) ( not ( = ?auto_824336 ?auto_824349 ) ) ( not ( = ?auto_824337 ?auto_824338 ) ) ( not ( = ?auto_824337 ?auto_824339 ) ) ( not ( = ?auto_824337 ?auto_824340 ) ) ( not ( = ?auto_824337 ?auto_824341 ) ) ( not ( = ?auto_824337 ?auto_824342 ) ) ( not ( = ?auto_824337 ?auto_824343 ) ) ( not ( = ?auto_824337 ?auto_824344 ) ) ( not ( = ?auto_824337 ?auto_824345 ) ) ( not ( = ?auto_824337 ?auto_824346 ) ) ( not ( = ?auto_824337 ?auto_824347 ) ) ( not ( = ?auto_824337 ?auto_824348 ) ) ( not ( = ?auto_824337 ?auto_824349 ) ) ( not ( = ?auto_824338 ?auto_824339 ) ) ( not ( = ?auto_824338 ?auto_824340 ) ) ( not ( = ?auto_824338 ?auto_824341 ) ) ( not ( = ?auto_824338 ?auto_824342 ) ) ( not ( = ?auto_824338 ?auto_824343 ) ) ( not ( = ?auto_824338 ?auto_824344 ) ) ( not ( = ?auto_824338 ?auto_824345 ) ) ( not ( = ?auto_824338 ?auto_824346 ) ) ( not ( = ?auto_824338 ?auto_824347 ) ) ( not ( = ?auto_824338 ?auto_824348 ) ) ( not ( = ?auto_824338 ?auto_824349 ) ) ( not ( = ?auto_824339 ?auto_824340 ) ) ( not ( = ?auto_824339 ?auto_824341 ) ) ( not ( = ?auto_824339 ?auto_824342 ) ) ( not ( = ?auto_824339 ?auto_824343 ) ) ( not ( = ?auto_824339 ?auto_824344 ) ) ( not ( = ?auto_824339 ?auto_824345 ) ) ( not ( = ?auto_824339 ?auto_824346 ) ) ( not ( = ?auto_824339 ?auto_824347 ) ) ( not ( = ?auto_824339 ?auto_824348 ) ) ( not ( = ?auto_824339 ?auto_824349 ) ) ( not ( = ?auto_824340 ?auto_824341 ) ) ( not ( = ?auto_824340 ?auto_824342 ) ) ( not ( = ?auto_824340 ?auto_824343 ) ) ( not ( = ?auto_824340 ?auto_824344 ) ) ( not ( = ?auto_824340 ?auto_824345 ) ) ( not ( = ?auto_824340 ?auto_824346 ) ) ( not ( = ?auto_824340 ?auto_824347 ) ) ( not ( = ?auto_824340 ?auto_824348 ) ) ( not ( = ?auto_824340 ?auto_824349 ) ) ( not ( = ?auto_824341 ?auto_824342 ) ) ( not ( = ?auto_824341 ?auto_824343 ) ) ( not ( = ?auto_824341 ?auto_824344 ) ) ( not ( = ?auto_824341 ?auto_824345 ) ) ( not ( = ?auto_824341 ?auto_824346 ) ) ( not ( = ?auto_824341 ?auto_824347 ) ) ( not ( = ?auto_824341 ?auto_824348 ) ) ( not ( = ?auto_824341 ?auto_824349 ) ) ( not ( = ?auto_824342 ?auto_824343 ) ) ( not ( = ?auto_824342 ?auto_824344 ) ) ( not ( = ?auto_824342 ?auto_824345 ) ) ( not ( = ?auto_824342 ?auto_824346 ) ) ( not ( = ?auto_824342 ?auto_824347 ) ) ( not ( = ?auto_824342 ?auto_824348 ) ) ( not ( = ?auto_824342 ?auto_824349 ) ) ( not ( = ?auto_824343 ?auto_824344 ) ) ( not ( = ?auto_824343 ?auto_824345 ) ) ( not ( = ?auto_824343 ?auto_824346 ) ) ( not ( = ?auto_824343 ?auto_824347 ) ) ( not ( = ?auto_824343 ?auto_824348 ) ) ( not ( = ?auto_824343 ?auto_824349 ) ) ( not ( = ?auto_824344 ?auto_824345 ) ) ( not ( = ?auto_824344 ?auto_824346 ) ) ( not ( = ?auto_824344 ?auto_824347 ) ) ( not ( = ?auto_824344 ?auto_824348 ) ) ( not ( = ?auto_824344 ?auto_824349 ) ) ( not ( = ?auto_824345 ?auto_824346 ) ) ( not ( = ?auto_824345 ?auto_824347 ) ) ( not ( = ?auto_824345 ?auto_824348 ) ) ( not ( = ?auto_824345 ?auto_824349 ) ) ( not ( = ?auto_824346 ?auto_824347 ) ) ( not ( = ?auto_824346 ?auto_824348 ) ) ( not ( = ?auto_824346 ?auto_824349 ) ) ( not ( = ?auto_824347 ?auto_824348 ) ) ( not ( = ?auto_824347 ?auto_824349 ) ) ( not ( = ?auto_824348 ?auto_824349 ) ) ( ON ?auto_824347 ?auto_824348 ) ( ON ?auto_824346 ?auto_824347 ) ( ON ?auto_824345 ?auto_824346 ) ( CLEAR ?auto_824343 ) ( ON ?auto_824344 ?auto_824345 ) ( CLEAR ?auto_824344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_824333 ?auto_824334 ?auto_824335 ?auto_824336 ?auto_824337 ?auto_824338 ?auto_824339 ?auto_824340 ?auto_824341 ?auto_824342 ?auto_824343 ?auto_824344 )
      ( MAKE-16PILE ?auto_824333 ?auto_824334 ?auto_824335 ?auto_824336 ?auto_824337 ?auto_824338 ?auto_824339 ?auto_824340 ?auto_824341 ?auto_824342 ?auto_824343 ?auto_824344 ?auto_824345 ?auto_824346 ?auto_824347 ?auto_824348 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824399 - BLOCK
      ?auto_824400 - BLOCK
      ?auto_824401 - BLOCK
      ?auto_824402 - BLOCK
      ?auto_824403 - BLOCK
      ?auto_824404 - BLOCK
      ?auto_824405 - BLOCK
      ?auto_824406 - BLOCK
      ?auto_824407 - BLOCK
      ?auto_824408 - BLOCK
      ?auto_824409 - BLOCK
      ?auto_824410 - BLOCK
      ?auto_824411 - BLOCK
      ?auto_824412 - BLOCK
      ?auto_824413 - BLOCK
      ?auto_824414 - BLOCK
    )
    :vars
    (
      ?auto_824415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824414 ?auto_824415 ) ( ON-TABLE ?auto_824399 ) ( ON ?auto_824400 ?auto_824399 ) ( ON ?auto_824401 ?auto_824400 ) ( ON ?auto_824402 ?auto_824401 ) ( ON ?auto_824403 ?auto_824402 ) ( ON ?auto_824404 ?auto_824403 ) ( ON ?auto_824405 ?auto_824404 ) ( ON ?auto_824406 ?auto_824405 ) ( ON ?auto_824407 ?auto_824406 ) ( ON ?auto_824408 ?auto_824407 ) ( not ( = ?auto_824399 ?auto_824400 ) ) ( not ( = ?auto_824399 ?auto_824401 ) ) ( not ( = ?auto_824399 ?auto_824402 ) ) ( not ( = ?auto_824399 ?auto_824403 ) ) ( not ( = ?auto_824399 ?auto_824404 ) ) ( not ( = ?auto_824399 ?auto_824405 ) ) ( not ( = ?auto_824399 ?auto_824406 ) ) ( not ( = ?auto_824399 ?auto_824407 ) ) ( not ( = ?auto_824399 ?auto_824408 ) ) ( not ( = ?auto_824399 ?auto_824409 ) ) ( not ( = ?auto_824399 ?auto_824410 ) ) ( not ( = ?auto_824399 ?auto_824411 ) ) ( not ( = ?auto_824399 ?auto_824412 ) ) ( not ( = ?auto_824399 ?auto_824413 ) ) ( not ( = ?auto_824399 ?auto_824414 ) ) ( not ( = ?auto_824399 ?auto_824415 ) ) ( not ( = ?auto_824400 ?auto_824401 ) ) ( not ( = ?auto_824400 ?auto_824402 ) ) ( not ( = ?auto_824400 ?auto_824403 ) ) ( not ( = ?auto_824400 ?auto_824404 ) ) ( not ( = ?auto_824400 ?auto_824405 ) ) ( not ( = ?auto_824400 ?auto_824406 ) ) ( not ( = ?auto_824400 ?auto_824407 ) ) ( not ( = ?auto_824400 ?auto_824408 ) ) ( not ( = ?auto_824400 ?auto_824409 ) ) ( not ( = ?auto_824400 ?auto_824410 ) ) ( not ( = ?auto_824400 ?auto_824411 ) ) ( not ( = ?auto_824400 ?auto_824412 ) ) ( not ( = ?auto_824400 ?auto_824413 ) ) ( not ( = ?auto_824400 ?auto_824414 ) ) ( not ( = ?auto_824400 ?auto_824415 ) ) ( not ( = ?auto_824401 ?auto_824402 ) ) ( not ( = ?auto_824401 ?auto_824403 ) ) ( not ( = ?auto_824401 ?auto_824404 ) ) ( not ( = ?auto_824401 ?auto_824405 ) ) ( not ( = ?auto_824401 ?auto_824406 ) ) ( not ( = ?auto_824401 ?auto_824407 ) ) ( not ( = ?auto_824401 ?auto_824408 ) ) ( not ( = ?auto_824401 ?auto_824409 ) ) ( not ( = ?auto_824401 ?auto_824410 ) ) ( not ( = ?auto_824401 ?auto_824411 ) ) ( not ( = ?auto_824401 ?auto_824412 ) ) ( not ( = ?auto_824401 ?auto_824413 ) ) ( not ( = ?auto_824401 ?auto_824414 ) ) ( not ( = ?auto_824401 ?auto_824415 ) ) ( not ( = ?auto_824402 ?auto_824403 ) ) ( not ( = ?auto_824402 ?auto_824404 ) ) ( not ( = ?auto_824402 ?auto_824405 ) ) ( not ( = ?auto_824402 ?auto_824406 ) ) ( not ( = ?auto_824402 ?auto_824407 ) ) ( not ( = ?auto_824402 ?auto_824408 ) ) ( not ( = ?auto_824402 ?auto_824409 ) ) ( not ( = ?auto_824402 ?auto_824410 ) ) ( not ( = ?auto_824402 ?auto_824411 ) ) ( not ( = ?auto_824402 ?auto_824412 ) ) ( not ( = ?auto_824402 ?auto_824413 ) ) ( not ( = ?auto_824402 ?auto_824414 ) ) ( not ( = ?auto_824402 ?auto_824415 ) ) ( not ( = ?auto_824403 ?auto_824404 ) ) ( not ( = ?auto_824403 ?auto_824405 ) ) ( not ( = ?auto_824403 ?auto_824406 ) ) ( not ( = ?auto_824403 ?auto_824407 ) ) ( not ( = ?auto_824403 ?auto_824408 ) ) ( not ( = ?auto_824403 ?auto_824409 ) ) ( not ( = ?auto_824403 ?auto_824410 ) ) ( not ( = ?auto_824403 ?auto_824411 ) ) ( not ( = ?auto_824403 ?auto_824412 ) ) ( not ( = ?auto_824403 ?auto_824413 ) ) ( not ( = ?auto_824403 ?auto_824414 ) ) ( not ( = ?auto_824403 ?auto_824415 ) ) ( not ( = ?auto_824404 ?auto_824405 ) ) ( not ( = ?auto_824404 ?auto_824406 ) ) ( not ( = ?auto_824404 ?auto_824407 ) ) ( not ( = ?auto_824404 ?auto_824408 ) ) ( not ( = ?auto_824404 ?auto_824409 ) ) ( not ( = ?auto_824404 ?auto_824410 ) ) ( not ( = ?auto_824404 ?auto_824411 ) ) ( not ( = ?auto_824404 ?auto_824412 ) ) ( not ( = ?auto_824404 ?auto_824413 ) ) ( not ( = ?auto_824404 ?auto_824414 ) ) ( not ( = ?auto_824404 ?auto_824415 ) ) ( not ( = ?auto_824405 ?auto_824406 ) ) ( not ( = ?auto_824405 ?auto_824407 ) ) ( not ( = ?auto_824405 ?auto_824408 ) ) ( not ( = ?auto_824405 ?auto_824409 ) ) ( not ( = ?auto_824405 ?auto_824410 ) ) ( not ( = ?auto_824405 ?auto_824411 ) ) ( not ( = ?auto_824405 ?auto_824412 ) ) ( not ( = ?auto_824405 ?auto_824413 ) ) ( not ( = ?auto_824405 ?auto_824414 ) ) ( not ( = ?auto_824405 ?auto_824415 ) ) ( not ( = ?auto_824406 ?auto_824407 ) ) ( not ( = ?auto_824406 ?auto_824408 ) ) ( not ( = ?auto_824406 ?auto_824409 ) ) ( not ( = ?auto_824406 ?auto_824410 ) ) ( not ( = ?auto_824406 ?auto_824411 ) ) ( not ( = ?auto_824406 ?auto_824412 ) ) ( not ( = ?auto_824406 ?auto_824413 ) ) ( not ( = ?auto_824406 ?auto_824414 ) ) ( not ( = ?auto_824406 ?auto_824415 ) ) ( not ( = ?auto_824407 ?auto_824408 ) ) ( not ( = ?auto_824407 ?auto_824409 ) ) ( not ( = ?auto_824407 ?auto_824410 ) ) ( not ( = ?auto_824407 ?auto_824411 ) ) ( not ( = ?auto_824407 ?auto_824412 ) ) ( not ( = ?auto_824407 ?auto_824413 ) ) ( not ( = ?auto_824407 ?auto_824414 ) ) ( not ( = ?auto_824407 ?auto_824415 ) ) ( not ( = ?auto_824408 ?auto_824409 ) ) ( not ( = ?auto_824408 ?auto_824410 ) ) ( not ( = ?auto_824408 ?auto_824411 ) ) ( not ( = ?auto_824408 ?auto_824412 ) ) ( not ( = ?auto_824408 ?auto_824413 ) ) ( not ( = ?auto_824408 ?auto_824414 ) ) ( not ( = ?auto_824408 ?auto_824415 ) ) ( not ( = ?auto_824409 ?auto_824410 ) ) ( not ( = ?auto_824409 ?auto_824411 ) ) ( not ( = ?auto_824409 ?auto_824412 ) ) ( not ( = ?auto_824409 ?auto_824413 ) ) ( not ( = ?auto_824409 ?auto_824414 ) ) ( not ( = ?auto_824409 ?auto_824415 ) ) ( not ( = ?auto_824410 ?auto_824411 ) ) ( not ( = ?auto_824410 ?auto_824412 ) ) ( not ( = ?auto_824410 ?auto_824413 ) ) ( not ( = ?auto_824410 ?auto_824414 ) ) ( not ( = ?auto_824410 ?auto_824415 ) ) ( not ( = ?auto_824411 ?auto_824412 ) ) ( not ( = ?auto_824411 ?auto_824413 ) ) ( not ( = ?auto_824411 ?auto_824414 ) ) ( not ( = ?auto_824411 ?auto_824415 ) ) ( not ( = ?auto_824412 ?auto_824413 ) ) ( not ( = ?auto_824412 ?auto_824414 ) ) ( not ( = ?auto_824412 ?auto_824415 ) ) ( not ( = ?auto_824413 ?auto_824414 ) ) ( not ( = ?auto_824413 ?auto_824415 ) ) ( not ( = ?auto_824414 ?auto_824415 ) ) ( ON ?auto_824413 ?auto_824414 ) ( ON ?auto_824412 ?auto_824413 ) ( ON ?auto_824411 ?auto_824412 ) ( ON ?auto_824410 ?auto_824411 ) ( CLEAR ?auto_824408 ) ( ON ?auto_824409 ?auto_824410 ) ( CLEAR ?auto_824409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_824399 ?auto_824400 ?auto_824401 ?auto_824402 ?auto_824403 ?auto_824404 ?auto_824405 ?auto_824406 ?auto_824407 ?auto_824408 ?auto_824409 )
      ( MAKE-16PILE ?auto_824399 ?auto_824400 ?auto_824401 ?auto_824402 ?auto_824403 ?auto_824404 ?auto_824405 ?auto_824406 ?auto_824407 ?auto_824408 ?auto_824409 ?auto_824410 ?auto_824411 ?auto_824412 ?auto_824413 ?auto_824414 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824465 - BLOCK
      ?auto_824466 - BLOCK
      ?auto_824467 - BLOCK
      ?auto_824468 - BLOCK
      ?auto_824469 - BLOCK
      ?auto_824470 - BLOCK
      ?auto_824471 - BLOCK
      ?auto_824472 - BLOCK
      ?auto_824473 - BLOCK
      ?auto_824474 - BLOCK
      ?auto_824475 - BLOCK
      ?auto_824476 - BLOCK
      ?auto_824477 - BLOCK
      ?auto_824478 - BLOCK
      ?auto_824479 - BLOCK
      ?auto_824480 - BLOCK
    )
    :vars
    (
      ?auto_824481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824480 ?auto_824481 ) ( ON-TABLE ?auto_824465 ) ( ON ?auto_824466 ?auto_824465 ) ( ON ?auto_824467 ?auto_824466 ) ( ON ?auto_824468 ?auto_824467 ) ( ON ?auto_824469 ?auto_824468 ) ( ON ?auto_824470 ?auto_824469 ) ( ON ?auto_824471 ?auto_824470 ) ( ON ?auto_824472 ?auto_824471 ) ( ON ?auto_824473 ?auto_824472 ) ( not ( = ?auto_824465 ?auto_824466 ) ) ( not ( = ?auto_824465 ?auto_824467 ) ) ( not ( = ?auto_824465 ?auto_824468 ) ) ( not ( = ?auto_824465 ?auto_824469 ) ) ( not ( = ?auto_824465 ?auto_824470 ) ) ( not ( = ?auto_824465 ?auto_824471 ) ) ( not ( = ?auto_824465 ?auto_824472 ) ) ( not ( = ?auto_824465 ?auto_824473 ) ) ( not ( = ?auto_824465 ?auto_824474 ) ) ( not ( = ?auto_824465 ?auto_824475 ) ) ( not ( = ?auto_824465 ?auto_824476 ) ) ( not ( = ?auto_824465 ?auto_824477 ) ) ( not ( = ?auto_824465 ?auto_824478 ) ) ( not ( = ?auto_824465 ?auto_824479 ) ) ( not ( = ?auto_824465 ?auto_824480 ) ) ( not ( = ?auto_824465 ?auto_824481 ) ) ( not ( = ?auto_824466 ?auto_824467 ) ) ( not ( = ?auto_824466 ?auto_824468 ) ) ( not ( = ?auto_824466 ?auto_824469 ) ) ( not ( = ?auto_824466 ?auto_824470 ) ) ( not ( = ?auto_824466 ?auto_824471 ) ) ( not ( = ?auto_824466 ?auto_824472 ) ) ( not ( = ?auto_824466 ?auto_824473 ) ) ( not ( = ?auto_824466 ?auto_824474 ) ) ( not ( = ?auto_824466 ?auto_824475 ) ) ( not ( = ?auto_824466 ?auto_824476 ) ) ( not ( = ?auto_824466 ?auto_824477 ) ) ( not ( = ?auto_824466 ?auto_824478 ) ) ( not ( = ?auto_824466 ?auto_824479 ) ) ( not ( = ?auto_824466 ?auto_824480 ) ) ( not ( = ?auto_824466 ?auto_824481 ) ) ( not ( = ?auto_824467 ?auto_824468 ) ) ( not ( = ?auto_824467 ?auto_824469 ) ) ( not ( = ?auto_824467 ?auto_824470 ) ) ( not ( = ?auto_824467 ?auto_824471 ) ) ( not ( = ?auto_824467 ?auto_824472 ) ) ( not ( = ?auto_824467 ?auto_824473 ) ) ( not ( = ?auto_824467 ?auto_824474 ) ) ( not ( = ?auto_824467 ?auto_824475 ) ) ( not ( = ?auto_824467 ?auto_824476 ) ) ( not ( = ?auto_824467 ?auto_824477 ) ) ( not ( = ?auto_824467 ?auto_824478 ) ) ( not ( = ?auto_824467 ?auto_824479 ) ) ( not ( = ?auto_824467 ?auto_824480 ) ) ( not ( = ?auto_824467 ?auto_824481 ) ) ( not ( = ?auto_824468 ?auto_824469 ) ) ( not ( = ?auto_824468 ?auto_824470 ) ) ( not ( = ?auto_824468 ?auto_824471 ) ) ( not ( = ?auto_824468 ?auto_824472 ) ) ( not ( = ?auto_824468 ?auto_824473 ) ) ( not ( = ?auto_824468 ?auto_824474 ) ) ( not ( = ?auto_824468 ?auto_824475 ) ) ( not ( = ?auto_824468 ?auto_824476 ) ) ( not ( = ?auto_824468 ?auto_824477 ) ) ( not ( = ?auto_824468 ?auto_824478 ) ) ( not ( = ?auto_824468 ?auto_824479 ) ) ( not ( = ?auto_824468 ?auto_824480 ) ) ( not ( = ?auto_824468 ?auto_824481 ) ) ( not ( = ?auto_824469 ?auto_824470 ) ) ( not ( = ?auto_824469 ?auto_824471 ) ) ( not ( = ?auto_824469 ?auto_824472 ) ) ( not ( = ?auto_824469 ?auto_824473 ) ) ( not ( = ?auto_824469 ?auto_824474 ) ) ( not ( = ?auto_824469 ?auto_824475 ) ) ( not ( = ?auto_824469 ?auto_824476 ) ) ( not ( = ?auto_824469 ?auto_824477 ) ) ( not ( = ?auto_824469 ?auto_824478 ) ) ( not ( = ?auto_824469 ?auto_824479 ) ) ( not ( = ?auto_824469 ?auto_824480 ) ) ( not ( = ?auto_824469 ?auto_824481 ) ) ( not ( = ?auto_824470 ?auto_824471 ) ) ( not ( = ?auto_824470 ?auto_824472 ) ) ( not ( = ?auto_824470 ?auto_824473 ) ) ( not ( = ?auto_824470 ?auto_824474 ) ) ( not ( = ?auto_824470 ?auto_824475 ) ) ( not ( = ?auto_824470 ?auto_824476 ) ) ( not ( = ?auto_824470 ?auto_824477 ) ) ( not ( = ?auto_824470 ?auto_824478 ) ) ( not ( = ?auto_824470 ?auto_824479 ) ) ( not ( = ?auto_824470 ?auto_824480 ) ) ( not ( = ?auto_824470 ?auto_824481 ) ) ( not ( = ?auto_824471 ?auto_824472 ) ) ( not ( = ?auto_824471 ?auto_824473 ) ) ( not ( = ?auto_824471 ?auto_824474 ) ) ( not ( = ?auto_824471 ?auto_824475 ) ) ( not ( = ?auto_824471 ?auto_824476 ) ) ( not ( = ?auto_824471 ?auto_824477 ) ) ( not ( = ?auto_824471 ?auto_824478 ) ) ( not ( = ?auto_824471 ?auto_824479 ) ) ( not ( = ?auto_824471 ?auto_824480 ) ) ( not ( = ?auto_824471 ?auto_824481 ) ) ( not ( = ?auto_824472 ?auto_824473 ) ) ( not ( = ?auto_824472 ?auto_824474 ) ) ( not ( = ?auto_824472 ?auto_824475 ) ) ( not ( = ?auto_824472 ?auto_824476 ) ) ( not ( = ?auto_824472 ?auto_824477 ) ) ( not ( = ?auto_824472 ?auto_824478 ) ) ( not ( = ?auto_824472 ?auto_824479 ) ) ( not ( = ?auto_824472 ?auto_824480 ) ) ( not ( = ?auto_824472 ?auto_824481 ) ) ( not ( = ?auto_824473 ?auto_824474 ) ) ( not ( = ?auto_824473 ?auto_824475 ) ) ( not ( = ?auto_824473 ?auto_824476 ) ) ( not ( = ?auto_824473 ?auto_824477 ) ) ( not ( = ?auto_824473 ?auto_824478 ) ) ( not ( = ?auto_824473 ?auto_824479 ) ) ( not ( = ?auto_824473 ?auto_824480 ) ) ( not ( = ?auto_824473 ?auto_824481 ) ) ( not ( = ?auto_824474 ?auto_824475 ) ) ( not ( = ?auto_824474 ?auto_824476 ) ) ( not ( = ?auto_824474 ?auto_824477 ) ) ( not ( = ?auto_824474 ?auto_824478 ) ) ( not ( = ?auto_824474 ?auto_824479 ) ) ( not ( = ?auto_824474 ?auto_824480 ) ) ( not ( = ?auto_824474 ?auto_824481 ) ) ( not ( = ?auto_824475 ?auto_824476 ) ) ( not ( = ?auto_824475 ?auto_824477 ) ) ( not ( = ?auto_824475 ?auto_824478 ) ) ( not ( = ?auto_824475 ?auto_824479 ) ) ( not ( = ?auto_824475 ?auto_824480 ) ) ( not ( = ?auto_824475 ?auto_824481 ) ) ( not ( = ?auto_824476 ?auto_824477 ) ) ( not ( = ?auto_824476 ?auto_824478 ) ) ( not ( = ?auto_824476 ?auto_824479 ) ) ( not ( = ?auto_824476 ?auto_824480 ) ) ( not ( = ?auto_824476 ?auto_824481 ) ) ( not ( = ?auto_824477 ?auto_824478 ) ) ( not ( = ?auto_824477 ?auto_824479 ) ) ( not ( = ?auto_824477 ?auto_824480 ) ) ( not ( = ?auto_824477 ?auto_824481 ) ) ( not ( = ?auto_824478 ?auto_824479 ) ) ( not ( = ?auto_824478 ?auto_824480 ) ) ( not ( = ?auto_824478 ?auto_824481 ) ) ( not ( = ?auto_824479 ?auto_824480 ) ) ( not ( = ?auto_824479 ?auto_824481 ) ) ( not ( = ?auto_824480 ?auto_824481 ) ) ( ON ?auto_824479 ?auto_824480 ) ( ON ?auto_824478 ?auto_824479 ) ( ON ?auto_824477 ?auto_824478 ) ( ON ?auto_824476 ?auto_824477 ) ( ON ?auto_824475 ?auto_824476 ) ( CLEAR ?auto_824473 ) ( ON ?auto_824474 ?auto_824475 ) ( CLEAR ?auto_824474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_824465 ?auto_824466 ?auto_824467 ?auto_824468 ?auto_824469 ?auto_824470 ?auto_824471 ?auto_824472 ?auto_824473 ?auto_824474 )
      ( MAKE-16PILE ?auto_824465 ?auto_824466 ?auto_824467 ?auto_824468 ?auto_824469 ?auto_824470 ?auto_824471 ?auto_824472 ?auto_824473 ?auto_824474 ?auto_824475 ?auto_824476 ?auto_824477 ?auto_824478 ?auto_824479 ?auto_824480 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824531 - BLOCK
      ?auto_824532 - BLOCK
      ?auto_824533 - BLOCK
      ?auto_824534 - BLOCK
      ?auto_824535 - BLOCK
      ?auto_824536 - BLOCK
      ?auto_824537 - BLOCK
      ?auto_824538 - BLOCK
      ?auto_824539 - BLOCK
      ?auto_824540 - BLOCK
      ?auto_824541 - BLOCK
      ?auto_824542 - BLOCK
      ?auto_824543 - BLOCK
      ?auto_824544 - BLOCK
      ?auto_824545 - BLOCK
      ?auto_824546 - BLOCK
    )
    :vars
    (
      ?auto_824547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824546 ?auto_824547 ) ( ON-TABLE ?auto_824531 ) ( ON ?auto_824532 ?auto_824531 ) ( ON ?auto_824533 ?auto_824532 ) ( ON ?auto_824534 ?auto_824533 ) ( ON ?auto_824535 ?auto_824534 ) ( ON ?auto_824536 ?auto_824535 ) ( ON ?auto_824537 ?auto_824536 ) ( ON ?auto_824538 ?auto_824537 ) ( not ( = ?auto_824531 ?auto_824532 ) ) ( not ( = ?auto_824531 ?auto_824533 ) ) ( not ( = ?auto_824531 ?auto_824534 ) ) ( not ( = ?auto_824531 ?auto_824535 ) ) ( not ( = ?auto_824531 ?auto_824536 ) ) ( not ( = ?auto_824531 ?auto_824537 ) ) ( not ( = ?auto_824531 ?auto_824538 ) ) ( not ( = ?auto_824531 ?auto_824539 ) ) ( not ( = ?auto_824531 ?auto_824540 ) ) ( not ( = ?auto_824531 ?auto_824541 ) ) ( not ( = ?auto_824531 ?auto_824542 ) ) ( not ( = ?auto_824531 ?auto_824543 ) ) ( not ( = ?auto_824531 ?auto_824544 ) ) ( not ( = ?auto_824531 ?auto_824545 ) ) ( not ( = ?auto_824531 ?auto_824546 ) ) ( not ( = ?auto_824531 ?auto_824547 ) ) ( not ( = ?auto_824532 ?auto_824533 ) ) ( not ( = ?auto_824532 ?auto_824534 ) ) ( not ( = ?auto_824532 ?auto_824535 ) ) ( not ( = ?auto_824532 ?auto_824536 ) ) ( not ( = ?auto_824532 ?auto_824537 ) ) ( not ( = ?auto_824532 ?auto_824538 ) ) ( not ( = ?auto_824532 ?auto_824539 ) ) ( not ( = ?auto_824532 ?auto_824540 ) ) ( not ( = ?auto_824532 ?auto_824541 ) ) ( not ( = ?auto_824532 ?auto_824542 ) ) ( not ( = ?auto_824532 ?auto_824543 ) ) ( not ( = ?auto_824532 ?auto_824544 ) ) ( not ( = ?auto_824532 ?auto_824545 ) ) ( not ( = ?auto_824532 ?auto_824546 ) ) ( not ( = ?auto_824532 ?auto_824547 ) ) ( not ( = ?auto_824533 ?auto_824534 ) ) ( not ( = ?auto_824533 ?auto_824535 ) ) ( not ( = ?auto_824533 ?auto_824536 ) ) ( not ( = ?auto_824533 ?auto_824537 ) ) ( not ( = ?auto_824533 ?auto_824538 ) ) ( not ( = ?auto_824533 ?auto_824539 ) ) ( not ( = ?auto_824533 ?auto_824540 ) ) ( not ( = ?auto_824533 ?auto_824541 ) ) ( not ( = ?auto_824533 ?auto_824542 ) ) ( not ( = ?auto_824533 ?auto_824543 ) ) ( not ( = ?auto_824533 ?auto_824544 ) ) ( not ( = ?auto_824533 ?auto_824545 ) ) ( not ( = ?auto_824533 ?auto_824546 ) ) ( not ( = ?auto_824533 ?auto_824547 ) ) ( not ( = ?auto_824534 ?auto_824535 ) ) ( not ( = ?auto_824534 ?auto_824536 ) ) ( not ( = ?auto_824534 ?auto_824537 ) ) ( not ( = ?auto_824534 ?auto_824538 ) ) ( not ( = ?auto_824534 ?auto_824539 ) ) ( not ( = ?auto_824534 ?auto_824540 ) ) ( not ( = ?auto_824534 ?auto_824541 ) ) ( not ( = ?auto_824534 ?auto_824542 ) ) ( not ( = ?auto_824534 ?auto_824543 ) ) ( not ( = ?auto_824534 ?auto_824544 ) ) ( not ( = ?auto_824534 ?auto_824545 ) ) ( not ( = ?auto_824534 ?auto_824546 ) ) ( not ( = ?auto_824534 ?auto_824547 ) ) ( not ( = ?auto_824535 ?auto_824536 ) ) ( not ( = ?auto_824535 ?auto_824537 ) ) ( not ( = ?auto_824535 ?auto_824538 ) ) ( not ( = ?auto_824535 ?auto_824539 ) ) ( not ( = ?auto_824535 ?auto_824540 ) ) ( not ( = ?auto_824535 ?auto_824541 ) ) ( not ( = ?auto_824535 ?auto_824542 ) ) ( not ( = ?auto_824535 ?auto_824543 ) ) ( not ( = ?auto_824535 ?auto_824544 ) ) ( not ( = ?auto_824535 ?auto_824545 ) ) ( not ( = ?auto_824535 ?auto_824546 ) ) ( not ( = ?auto_824535 ?auto_824547 ) ) ( not ( = ?auto_824536 ?auto_824537 ) ) ( not ( = ?auto_824536 ?auto_824538 ) ) ( not ( = ?auto_824536 ?auto_824539 ) ) ( not ( = ?auto_824536 ?auto_824540 ) ) ( not ( = ?auto_824536 ?auto_824541 ) ) ( not ( = ?auto_824536 ?auto_824542 ) ) ( not ( = ?auto_824536 ?auto_824543 ) ) ( not ( = ?auto_824536 ?auto_824544 ) ) ( not ( = ?auto_824536 ?auto_824545 ) ) ( not ( = ?auto_824536 ?auto_824546 ) ) ( not ( = ?auto_824536 ?auto_824547 ) ) ( not ( = ?auto_824537 ?auto_824538 ) ) ( not ( = ?auto_824537 ?auto_824539 ) ) ( not ( = ?auto_824537 ?auto_824540 ) ) ( not ( = ?auto_824537 ?auto_824541 ) ) ( not ( = ?auto_824537 ?auto_824542 ) ) ( not ( = ?auto_824537 ?auto_824543 ) ) ( not ( = ?auto_824537 ?auto_824544 ) ) ( not ( = ?auto_824537 ?auto_824545 ) ) ( not ( = ?auto_824537 ?auto_824546 ) ) ( not ( = ?auto_824537 ?auto_824547 ) ) ( not ( = ?auto_824538 ?auto_824539 ) ) ( not ( = ?auto_824538 ?auto_824540 ) ) ( not ( = ?auto_824538 ?auto_824541 ) ) ( not ( = ?auto_824538 ?auto_824542 ) ) ( not ( = ?auto_824538 ?auto_824543 ) ) ( not ( = ?auto_824538 ?auto_824544 ) ) ( not ( = ?auto_824538 ?auto_824545 ) ) ( not ( = ?auto_824538 ?auto_824546 ) ) ( not ( = ?auto_824538 ?auto_824547 ) ) ( not ( = ?auto_824539 ?auto_824540 ) ) ( not ( = ?auto_824539 ?auto_824541 ) ) ( not ( = ?auto_824539 ?auto_824542 ) ) ( not ( = ?auto_824539 ?auto_824543 ) ) ( not ( = ?auto_824539 ?auto_824544 ) ) ( not ( = ?auto_824539 ?auto_824545 ) ) ( not ( = ?auto_824539 ?auto_824546 ) ) ( not ( = ?auto_824539 ?auto_824547 ) ) ( not ( = ?auto_824540 ?auto_824541 ) ) ( not ( = ?auto_824540 ?auto_824542 ) ) ( not ( = ?auto_824540 ?auto_824543 ) ) ( not ( = ?auto_824540 ?auto_824544 ) ) ( not ( = ?auto_824540 ?auto_824545 ) ) ( not ( = ?auto_824540 ?auto_824546 ) ) ( not ( = ?auto_824540 ?auto_824547 ) ) ( not ( = ?auto_824541 ?auto_824542 ) ) ( not ( = ?auto_824541 ?auto_824543 ) ) ( not ( = ?auto_824541 ?auto_824544 ) ) ( not ( = ?auto_824541 ?auto_824545 ) ) ( not ( = ?auto_824541 ?auto_824546 ) ) ( not ( = ?auto_824541 ?auto_824547 ) ) ( not ( = ?auto_824542 ?auto_824543 ) ) ( not ( = ?auto_824542 ?auto_824544 ) ) ( not ( = ?auto_824542 ?auto_824545 ) ) ( not ( = ?auto_824542 ?auto_824546 ) ) ( not ( = ?auto_824542 ?auto_824547 ) ) ( not ( = ?auto_824543 ?auto_824544 ) ) ( not ( = ?auto_824543 ?auto_824545 ) ) ( not ( = ?auto_824543 ?auto_824546 ) ) ( not ( = ?auto_824543 ?auto_824547 ) ) ( not ( = ?auto_824544 ?auto_824545 ) ) ( not ( = ?auto_824544 ?auto_824546 ) ) ( not ( = ?auto_824544 ?auto_824547 ) ) ( not ( = ?auto_824545 ?auto_824546 ) ) ( not ( = ?auto_824545 ?auto_824547 ) ) ( not ( = ?auto_824546 ?auto_824547 ) ) ( ON ?auto_824545 ?auto_824546 ) ( ON ?auto_824544 ?auto_824545 ) ( ON ?auto_824543 ?auto_824544 ) ( ON ?auto_824542 ?auto_824543 ) ( ON ?auto_824541 ?auto_824542 ) ( ON ?auto_824540 ?auto_824541 ) ( CLEAR ?auto_824538 ) ( ON ?auto_824539 ?auto_824540 ) ( CLEAR ?auto_824539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_824531 ?auto_824532 ?auto_824533 ?auto_824534 ?auto_824535 ?auto_824536 ?auto_824537 ?auto_824538 ?auto_824539 )
      ( MAKE-16PILE ?auto_824531 ?auto_824532 ?auto_824533 ?auto_824534 ?auto_824535 ?auto_824536 ?auto_824537 ?auto_824538 ?auto_824539 ?auto_824540 ?auto_824541 ?auto_824542 ?auto_824543 ?auto_824544 ?auto_824545 ?auto_824546 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824597 - BLOCK
      ?auto_824598 - BLOCK
      ?auto_824599 - BLOCK
      ?auto_824600 - BLOCK
      ?auto_824601 - BLOCK
      ?auto_824602 - BLOCK
      ?auto_824603 - BLOCK
      ?auto_824604 - BLOCK
      ?auto_824605 - BLOCK
      ?auto_824606 - BLOCK
      ?auto_824607 - BLOCK
      ?auto_824608 - BLOCK
      ?auto_824609 - BLOCK
      ?auto_824610 - BLOCK
      ?auto_824611 - BLOCK
      ?auto_824612 - BLOCK
    )
    :vars
    (
      ?auto_824613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824612 ?auto_824613 ) ( ON-TABLE ?auto_824597 ) ( ON ?auto_824598 ?auto_824597 ) ( ON ?auto_824599 ?auto_824598 ) ( ON ?auto_824600 ?auto_824599 ) ( ON ?auto_824601 ?auto_824600 ) ( ON ?auto_824602 ?auto_824601 ) ( ON ?auto_824603 ?auto_824602 ) ( not ( = ?auto_824597 ?auto_824598 ) ) ( not ( = ?auto_824597 ?auto_824599 ) ) ( not ( = ?auto_824597 ?auto_824600 ) ) ( not ( = ?auto_824597 ?auto_824601 ) ) ( not ( = ?auto_824597 ?auto_824602 ) ) ( not ( = ?auto_824597 ?auto_824603 ) ) ( not ( = ?auto_824597 ?auto_824604 ) ) ( not ( = ?auto_824597 ?auto_824605 ) ) ( not ( = ?auto_824597 ?auto_824606 ) ) ( not ( = ?auto_824597 ?auto_824607 ) ) ( not ( = ?auto_824597 ?auto_824608 ) ) ( not ( = ?auto_824597 ?auto_824609 ) ) ( not ( = ?auto_824597 ?auto_824610 ) ) ( not ( = ?auto_824597 ?auto_824611 ) ) ( not ( = ?auto_824597 ?auto_824612 ) ) ( not ( = ?auto_824597 ?auto_824613 ) ) ( not ( = ?auto_824598 ?auto_824599 ) ) ( not ( = ?auto_824598 ?auto_824600 ) ) ( not ( = ?auto_824598 ?auto_824601 ) ) ( not ( = ?auto_824598 ?auto_824602 ) ) ( not ( = ?auto_824598 ?auto_824603 ) ) ( not ( = ?auto_824598 ?auto_824604 ) ) ( not ( = ?auto_824598 ?auto_824605 ) ) ( not ( = ?auto_824598 ?auto_824606 ) ) ( not ( = ?auto_824598 ?auto_824607 ) ) ( not ( = ?auto_824598 ?auto_824608 ) ) ( not ( = ?auto_824598 ?auto_824609 ) ) ( not ( = ?auto_824598 ?auto_824610 ) ) ( not ( = ?auto_824598 ?auto_824611 ) ) ( not ( = ?auto_824598 ?auto_824612 ) ) ( not ( = ?auto_824598 ?auto_824613 ) ) ( not ( = ?auto_824599 ?auto_824600 ) ) ( not ( = ?auto_824599 ?auto_824601 ) ) ( not ( = ?auto_824599 ?auto_824602 ) ) ( not ( = ?auto_824599 ?auto_824603 ) ) ( not ( = ?auto_824599 ?auto_824604 ) ) ( not ( = ?auto_824599 ?auto_824605 ) ) ( not ( = ?auto_824599 ?auto_824606 ) ) ( not ( = ?auto_824599 ?auto_824607 ) ) ( not ( = ?auto_824599 ?auto_824608 ) ) ( not ( = ?auto_824599 ?auto_824609 ) ) ( not ( = ?auto_824599 ?auto_824610 ) ) ( not ( = ?auto_824599 ?auto_824611 ) ) ( not ( = ?auto_824599 ?auto_824612 ) ) ( not ( = ?auto_824599 ?auto_824613 ) ) ( not ( = ?auto_824600 ?auto_824601 ) ) ( not ( = ?auto_824600 ?auto_824602 ) ) ( not ( = ?auto_824600 ?auto_824603 ) ) ( not ( = ?auto_824600 ?auto_824604 ) ) ( not ( = ?auto_824600 ?auto_824605 ) ) ( not ( = ?auto_824600 ?auto_824606 ) ) ( not ( = ?auto_824600 ?auto_824607 ) ) ( not ( = ?auto_824600 ?auto_824608 ) ) ( not ( = ?auto_824600 ?auto_824609 ) ) ( not ( = ?auto_824600 ?auto_824610 ) ) ( not ( = ?auto_824600 ?auto_824611 ) ) ( not ( = ?auto_824600 ?auto_824612 ) ) ( not ( = ?auto_824600 ?auto_824613 ) ) ( not ( = ?auto_824601 ?auto_824602 ) ) ( not ( = ?auto_824601 ?auto_824603 ) ) ( not ( = ?auto_824601 ?auto_824604 ) ) ( not ( = ?auto_824601 ?auto_824605 ) ) ( not ( = ?auto_824601 ?auto_824606 ) ) ( not ( = ?auto_824601 ?auto_824607 ) ) ( not ( = ?auto_824601 ?auto_824608 ) ) ( not ( = ?auto_824601 ?auto_824609 ) ) ( not ( = ?auto_824601 ?auto_824610 ) ) ( not ( = ?auto_824601 ?auto_824611 ) ) ( not ( = ?auto_824601 ?auto_824612 ) ) ( not ( = ?auto_824601 ?auto_824613 ) ) ( not ( = ?auto_824602 ?auto_824603 ) ) ( not ( = ?auto_824602 ?auto_824604 ) ) ( not ( = ?auto_824602 ?auto_824605 ) ) ( not ( = ?auto_824602 ?auto_824606 ) ) ( not ( = ?auto_824602 ?auto_824607 ) ) ( not ( = ?auto_824602 ?auto_824608 ) ) ( not ( = ?auto_824602 ?auto_824609 ) ) ( not ( = ?auto_824602 ?auto_824610 ) ) ( not ( = ?auto_824602 ?auto_824611 ) ) ( not ( = ?auto_824602 ?auto_824612 ) ) ( not ( = ?auto_824602 ?auto_824613 ) ) ( not ( = ?auto_824603 ?auto_824604 ) ) ( not ( = ?auto_824603 ?auto_824605 ) ) ( not ( = ?auto_824603 ?auto_824606 ) ) ( not ( = ?auto_824603 ?auto_824607 ) ) ( not ( = ?auto_824603 ?auto_824608 ) ) ( not ( = ?auto_824603 ?auto_824609 ) ) ( not ( = ?auto_824603 ?auto_824610 ) ) ( not ( = ?auto_824603 ?auto_824611 ) ) ( not ( = ?auto_824603 ?auto_824612 ) ) ( not ( = ?auto_824603 ?auto_824613 ) ) ( not ( = ?auto_824604 ?auto_824605 ) ) ( not ( = ?auto_824604 ?auto_824606 ) ) ( not ( = ?auto_824604 ?auto_824607 ) ) ( not ( = ?auto_824604 ?auto_824608 ) ) ( not ( = ?auto_824604 ?auto_824609 ) ) ( not ( = ?auto_824604 ?auto_824610 ) ) ( not ( = ?auto_824604 ?auto_824611 ) ) ( not ( = ?auto_824604 ?auto_824612 ) ) ( not ( = ?auto_824604 ?auto_824613 ) ) ( not ( = ?auto_824605 ?auto_824606 ) ) ( not ( = ?auto_824605 ?auto_824607 ) ) ( not ( = ?auto_824605 ?auto_824608 ) ) ( not ( = ?auto_824605 ?auto_824609 ) ) ( not ( = ?auto_824605 ?auto_824610 ) ) ( not ( = ?auto_824605 ?auto_824611 ) ) ( not ( = ?auto_824605 ?auto_824612 ) ) ( not ( = ?auto_824605 ?auto_824613 ) ) ( not ( = ?auto_824606 ?auto_824607 ) ) ( not ( = ?auto_824606 ?auto_824608 ) ) ( not ( = ?auto_824606 ?auto_824609 ) ) ( not ( = ?auto_824606 ?auto_824610 ) ) ( not ( = ?auto_824606 ?auto_824611 ) ) ( not ( = ?auto_824606 ?auto_824612 ) ) ( not ( = ?auto_824606 ?auto_824613 ) ) ( not ( = ?auto_824607 ?auto_824608 ) ) ( not ( = ?auto_824607 ?auto_824609 ) ) ( not ( = ?auto_824607 ?auto_824610 ) ) ( not ( = ?auto_824607 ?auto_824611 ) ) ( not ( = ?auto_824607 ?auto_824612 ) ) ( not ( = ?auto_824607 ?auto_824613 ) ) ( not ( = ?auto_824608 ?auto_824609 ) ) ( not ( = ?auto_824608 ?auto_824610 ) ) ( not ( = ?auto_824608 ?auto_824611 ) ) ( not ( = ?auto_824608 ?auto_824612 ) ) ( not ( = ?auto_824608 ?auto_824613 ) ) ( not ( = ?auto_824609 ?auto_824610 ) ) ( not ( = ?auto_824609 ?auto_824611 ) ) ( not ( = ?auto_824609 ?auto_824612 ) ) ( not ( = ?auto_824609 ?auto_824613 ) ) ( not ( = ?auto_824610 ?auto_824611 ) ) ( not ( = ?auto_824610 ?auto_824612 ) ) ( not ( = ?auto_824610 ?auto_824613 ) ) ( not ( = ?auto_824611 ?auto_824612 ) ) ( not ( = ?auto_824611 ?auto_824613 ) ) ( not ( = ?auto_824612 ?auto_824613 ) ) ( ON ?auto_824611 ?auto_824612 ) ( ON ?auto_824610 ?auto_824611 ) ( ON ?auto_824609 ?auto_824610 ) ( ON ?auto_824608 ?auto_824609 ) ( ON ?auto_824607 ?auto_824608 ) ( ON ?auto_824606 ?auto_824607 ) ( ON ?auto_824605 ?auto_824606 ) ( CLEAR ?auto_824603 ) ( ON ?auto_824604 ?auto_824605 ) ( CLEAR ?auto_824604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_824597 ?auto_824598 ?auto_824599 ?auto_824600 ?auto_824601 ?auto_824602 ?auto_824603 ?auto_824604 )
      ( MAKE-16PILE ?auto_824597 ?auto_824598 ?auto_824599 ?auto_824600 ?auto_824601 ?auto_824602 ?auto_824603 ?auto_824604 ?auto_824605 ?auto_824606 ?auto_824607 ?auto_824608 ?auto_824609 ?auto_824610 ?auto_824611 ?auto_824612 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824663 - BLOCK
      ?auto_824664 - BLOCK
      ?auto_824665 - BLOCK
      ?auto_824666 - BLOCK
      ?auto_824667 - BLOCK
      ?auto_824668 - BLOCK
      ?auto_824669 - BLOCK
      ?auto_824670 - BLOCK
      ?auto_824671 - BLOCK
      ?auto_824672 - BLOCK
      ?auto_824673 - BLOCK
      ?auto_824674 - BLOCK
      ?auto_824675 - BLOCK
      ?auto_824676 - BLOCK
      ?auto_824677 - BLOCK
      ?auto_824678 - BLOCK
    )
    :vars
    (
      ?auto_824679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824678 ?auto_824679 ) ( ON-TABLE ?auto_824663 ) ( ON ?auto_824664 ?auto_824663 ) ( ON ?auto_824665 ?auto_824664 ) ( ON ?auto_824666 ?auto_824665 ) ( ON ?auto_824667 ?auto_824666 ) ( ON ?auto_824668 ?auto_824667 ) ( not ( = ?auto_824663 ?auto_824664 ) ) ( not ( = ?auto_824663 ?auto_824665 ) ) ( not ( = ?auto_824663 ?auto_824666 ) ) ( not ( = ?auto_824663 ?auto_824667 ) ) ( not ( = ?auto_824663 ?auto_824668 ) ) ( not ( = ?auto_824663 ?auto_824669 ) ) ( not ( = ?auto_824663 ?auto_824670 ) ) ( not ( = ?auto_824663 ?auto_824671 ) ) ( not ( = ?auto_824663 ?auto_824672 ) ) ( not ( = ?auto_824663 ?auto_824673 ) ) ( not ( = ?auto_824663 ?auto_824674 ) ) ( not ( = ?auto_824663 ?auto_824675 ) ) ( not ( = ?auto_824663 ?auto_824676 ) ) ( not ( = ?auto_824663 ?auto_824677 ) ) ( not ( = ?auto_824663 ?auto_824678 ) ) ( not ( = ?auto_824663 ?auto_824679 ) ) ( not ( = ?auto_824664 ?auto_824665 ) ) ( not ( = ?auto_824664 ?auto_824666 ) ) ( not ( = ?auto_824664 ?auto_824667 ) ) ( not ( = ?auto_824664 ?auto_824668 ) ) ( not ( = ?auto_824664 ?auto_824669 ) ) ( not ( = ?auto_824664 ?auto_824670 ) ) ( not ( = ?auto_824664 ?auto_824671 ) ) ( not ( = ?auto_824664 ?auto_824672 ) ) ( not ( = ?auto_824664 ?auto_824673 ) ) ( not ( = ?auto_824664 ?auto_824674 ) ) ( not ( = ?auto_824664 ?auto_824675 ) ) ( not ( = ?auto_824664 ?auto_824676 ) ) ( not ( = ?auto_824664 ?auto_824677 ) ) ( not ( = ?auto_824664 ?auto_824678 ) ) ( not ( = ?auto_824664 ?auto_824679 ) ) ( not ( = ?auto_824665 ?auto_824666 ) ) ( not ( = ?auto_824665 ?auto_824667 ) ) ( not ( = ?auto_824665 ?auto_824668 ) ) ( not ( = ?auto_824665 ?auto_824669 ) ) ( not ( = ?auto_824665 ?auto_824670 ) ) ( not ( = ?auto_824665 ?auto_824671 ) ) ( not ( = ?auto_824665 ?auto_824672 ) ) ( not ( = ?auto_824665 ?auto_824673 ) ) ( not ( = ?auto_824665 ?auto_824674 ) ) ( not ( = ?auto_824665 ?auto_824675 ) ) ( not ( = ?auto_824665 ?auto_824676 ) ) ( not ( = ?auto_824665 ?auto_824677 ) ) ( not ( = ?auto_824665 ?auto_824678 ) ) ( not ( = ?auto_824665 ?auto_824679 ) ) ( not ( = ?auto_824666 ?auto_824667 ) ) ( not ( = ?auto_824666 ?auto_824668 ) ) ( not ( = ?auto_824666 ?auto_824669 ) ) ( not ( = ?auto_824666 ?auto_824670 ) ) ( not ( = ?auto_824666 ?auto_824671 ) ) ( not ( = ?auto_824666 ?auto_824672 ) ) ( not ( = ?auto_824666 ?auto_824673 ) ) ( not ( = ?auto_824666 ?auto_824674 ) ) ( not ( = ?auto_824666 ?auto_824675 ) ) ( not ( = ?auto_824666 ?auto_824676 ) ) ( not ( = ?auto_824666 ?auto_824677 ) ) ( not ( = ?auto_824666 ?auto_824678 ) ) ( not ( = ?auto_824666 ?auto_824679 ) ) ( not ( = ?auto_824667 ?auto_824668 ) ) ( not ( = ?auto_824667 ?auto_824669 ) ) ( not ( = ?auto_824667 ?auto_824670 ) ) ( not ( = ?auto_824667 ?auto_824671 ) ) ( not ( = ?auto_824667 ?auto_824672 ) ) ( not ( = ?auto_824667 ?auto_824673 ) ) ( not ( = ?auto_824667 ?auto_824674 ) ) ( not ( = ?auto_824667 ?auto_824675 ) ) ( not ( = ?auto_824667 ?auto_824676 ) ) ( not ( = ?auto_824667 ?auto_824677 ) ) ( not ( = ?auto_824667 ?auto_824678 ) ) ( not ( = ?auto_824667 ?auto_824679 ) ) ( not ( = ?auto_824668 ?auto_824669 ) ) ( not ( = ?auto_824668 ?auto_824670 ) ) ( not ( = ?auto_824668 ?auto_824671 ) ) ( not ( = ?auto_824668 ?auto_824672 ) ) ( not ( = ?auto_824668 ?auto_824673 ) ) ( not ( = ?auto_824668 ?auto_824674 ) ) ( not ( = ?auto_824668 ?auto_824675 ) ) ( not ( = ?auto_824668 ?auto_824676 ) ) ( not ( = ?auto_824668 ?auto_824677 ) ) ( not ( = ?auto_824668 ?auto_824678 ) ) ( not ( = ?auto_824668 ?auto_824679 ) ) ( not ( = ?auto_824669 ?auto_824670 ) ) ( not ( = ?auto_824669 ?auto_824671 ) ) ( not ( = ?auto_824669 ?auto_824672 ) ) ( not ( = ?auto_824669 ?auto_824673 ) ) ( not ( = ?auto_824669 ?auto_824674 ) ) ( not ( = ?auto_824669 ?auto_824675 ) ) ( not ( = ?auto_824669 ?auto_824676 ) ) ( not ( = ?auto_824669 ?auto_824677 ) ) ( not ( = ?auto_824669 ?auto_824678 ) ) ( not ( = ?auto_824669 ?auto_824679 ) ) ( not ( = ?auto_824670 ?auto_824671 ) ) ( not ( = ?auto_824670 ?auto_824672 ) ) ( not ( = ?auto_824670 ?auto_824673 ) ) ( not ( = ?auto_824670 ?auto_824674 ) ) ( not ( = ?auto_824670 ?auto_824675 ) ) ( not ( = ?auto_824670 ?auto_824676 ) ) ( not ( = ?auto_824670 ?auto_824677 ) ) ( not ( = ?auto_824670 ?auto_824678 ) ) ( not ( = ?auto_824670 ?auto_824679 ) ) ( not ( = ?auto_824671 ?auto_824672 ) ) ( not ( = ?auto_824671 ?auto_824673 ) ) ( not ( = ?auto_824671 ?auto_824674 ) ) ( not ( = ?auto_824671 ?auto_824675 ) ) ( not ( = ?auto_824671 ?auto_824676 ) ) ( not ( = ?auto_824671 ?auto_824677 ) ) ( not ( = ?auto_824671 ?auto_824678 ) ) ( not ( = ?auto_824671 ?auto_824679 ) ) ( not ( = ?auto_824672 ?auto_824673 ) ) ( not ( = ?auto_824672 ?auto_824674 ) ) ( not ( = ?auto_824672 ?auto_824675 ) ) ( not ( = ?auto_824672 ?auto_824676 ) ) ( not ( = ?auto_824672 ?auto_824677 ) ) ( not ( = ?auto_824672 ?auto_824678 ) ) ( not ( = ?auto_824672 ?auto_824679 ) ) ( not ( = ?auto_824673 ?auto_824674 ) ) ( not ( = ?auto_824673 ?auto_824675 ) ) ( not ( = ?auto_824673 ?auto_824676 ) ) ( not ( = ?auto_824673 ?auto_824677 ) ) ( not ( = ?auto_824673 ?auto_824678 ) ) ( not ( = ?auto_824673 ?auto_824679 ) ) ( not ( = ?auto_824674 ?auto_824675 ) ) ( not ( = ?auto_824674 ?auto_824676 ) ) ( not ( = ?auto_824674 ?auto_824677 ) ) ( not ( = ?auto_824674 ?auto_824678 ) ) ( not ( = ?auto_824674 ?auto_824679 ) ) ( not ( = ?auto_824675 ?auto_824676 ) ) ( not ( = ?auto_824675 ?auto_824677 ) ) ( not ( = ?auto_824675 ?auto_824678 ) ) ( not ( = ?auto_824675 ?auto_824679 ) ) ( not ( = ?auto_824676 ?auto_824677 ) ) ( not ( = ?auto_824676 ?auto_824678 ) ) ( not ( = ?auto_824676 ?auto_824679 ) ) ( not ( = ?auto_824677 ?auto_824678 ) ) ( not ( = ?auto_824677 ?auto_824679 ) ) ( not ( = ?auto_824678 ?auto_824679 ) ) ( ON ?auto_824677 ?auto_824678 ) ( ON ?auto_824676 ?auto_824677 ) ( ON ?auto_824675 ?auto_824676 ) ( ON ?auto_824674 ?auto_824675 ) ( ON ?auto_824673 ?auto_824674 ) ( ON ?auto_824672 ?auto_824673 ) ( ON ?auto_824671 ?auto_824672 ) ( ON ?auto_824670 ?auto_824671 ) ( CLEAR ?auto_824668 ) ( ON ?auto_824669 ?auto_824670 ) ( CLEAR ?auto_824669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_824663 ?auto_824664 ?auto_824665 ?auto_824666 ?auto_824667 ?auto_824668 ?auto_824669 )
      ( MAKE-16PILE ?auto_824663 ?auto_824664 ?auto_824665 ?auto_824666 ?auto_824667 ?auto_824668 ?auto_824669 ?auto_824670 ?auto_824671 ?auto_824672 ?auto_824673 ?auto_824674 ?auto_824675 ?auto_824676 ?auto_824677 ?auto_824678 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824729 - BLOCK
      ?auto_824730 - BLOCK
      ?auto_824731 - BLOCK
      ?auto_824732 - BLOCK
      ?auto_824733 - BLOCK
      ?auto_824734 - BLOCK
      ?auto_824735 - BLOCK
      ?auto_824736 - BLOCK
      ?auto_824737 - BLOCK
      ?auto_824738 - BLOCK
      ?auto_824739 - BLOCK
      ?auto_824740 - BLOCK
      ?auto_824741 - BLOCK
      ?auto_824742 - BLOCK
      ?auto_824743 - BLOCK
      ?auto_824744 - BLOCK
    )
    :vars
    (
      ?auto_824745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824744 ?auto_824745 ) ( ON-TABLE ?auto_824729 ) ( ON ?auto_824730 ?auto_824729 ) ( ON ?auto_824731 ?auto_824730 ) ( ON ?auto_824732 ?auto_824731 ) ( ON ?auto_824733 ?auto_824732 ) ( not ( = ?auto_824729 ?auto_824730 ) ) ( not ( = ?auto_824729 ?auto_824731 ) ) ( not ( = ?auto_824729 ?auto_824732 ) ) ( not ( = ?auto_824729 ?auto_824733 ) ) ( not ( = ?auto_824729 ?auto_824734 ) ) ( not ( = ?auto_824729 ?auto_824735 ) ) ( not ( = ?auto_824729 ?auto_824736 ) ) ( not ( = ?auto_824729 ?auto_824737 ) ) ( not ( = ?auto_824729 ?auto_824738 ) ) ( not ( = ?auto_824729 ?auto_824739 ) ) ( not ( = ?auto_824729 ?auto_824740 ) ) ( not ( = ?auto_824729 ?auto_824741 ) ) ( not ( = ?auto_824729 ?auto_824742 ) ) ( not ( = ?auto_824729 ?auto_824743 ) ) ( not ( = ?auto_824729 ?auto_824744 ) ) ( not ( = ?auto_824729 ?auto_824745 ) ) ( not ( = ?auto_824730 ?auto_824731 ) ) ( not ( = ?auto_824730 ?auto_824732 ) ) ( not ( = ?auto_824730 ?auto_824733 ) ) ( not ( = ?auto_824730 ?auto_824734 ) ) ( not ( = ?auto_824730 ?auto_824735 ) ) ( not ( = ?auto_824730 ?auto_824736 ) ) ( not ( = ?auto_824730 ?auto_824737 ) ) ( not ( = ?auto_824730 ?auto_824738 ) ) ( not ( = ?auto_824730 ?auto_824739 ) ) ( not ( = ?auto_824730 ?auto_824740 ) ) ( not ( = ?auto_824730 ?auto_824741 ) ) ( not ( = ?auto_824730 ?auto_824742 ) ) ( not ( = ?auto_824730 ?auto_824743 ) ) ( not ( = ?auto_824730 ?auto_824744 ) ) ( not ( = ?auto_824730 ?auto_824745 ) ) ( not ( = ?auto_824731 ?auto_824732 ) ) ( not ( = ?auto_824731 ?auto_824733 ) ) ( not ( = ?auto_824731 ?auto_824734 ) ) ( not ( = ?auto_824731 ?auto_824735 ) ) ( not ( = ?auto_824731 ?auto_824736 ) ) ( not ( = ?auto_824731 ?auto_824737 ) ) ( not ( = ?auto_824731 ?auto_824738 ) ) ( not ( = ?auto_824731 ?auto_824739 ) ) ( not ( = ?auto_824731 ?auto_824740 ) ) ( not ( = ?auto_824731 ?auto_824741 ) ) ( not ( = ?auto_824731 ?auto_824742 ) ) ( not ( = ?auto_824731 ?auto_824743 ) ) ( not ( = ?auto_824731 ?auto_824744 ) ) ( not ( = ?auto_824731 ?auto_824745 ) ) ( not ( = ?auto_824732 ?auto_824733 ) ) ( not ( = ?auto_824732 ?auto_824734 ) ) ( not ( = ?auto_824732 ?auto_824735 ) ) ( not ( = ?auto_824732 ?auto_824736 ) ) ( not ( = ?auto_824732 ?auto_824737 ) ) ( not ( = ?auto_824732 ?auto_824738 ) ) ( not ( = ?auto_824732 ?auto_824739 ) ) ( not ( = ?auto_824732 ?auto_824740 ) ) ( not ( = ?auto_824732 ?auto_824741 ) ) ( not ( = ?auto_824732 ?auto_824742 ) ) ( not ( = ?auto_824732 ?auto_824743 ) ) ( not ( = ?auto_824732 ?auto_824744 ) ) ( not ( = ?auto_824732 ?auto_824745 ) ) ( not ( = ?auto_824733 ?auto_824734 ) ) ( not ( = ?auto_824733 ?auto_824735 ) ) ( not ( = ?auto_824733 ?auto_824736 ) ) ( not ( = ?auto_824733 ?auto_824737 ) ) ( not ( = ?auto_824733 ?auto_824738 ) ) ( not ( = ?auto_824733 ?auto_824739 ) ) ( not ( = ?auto_824733 ?auto_824740 ) ) ( not ( = ?auto_824733 ?auto_824741 ) ) ( not ( = ?auto_824733 ?auto_824742 ) ) ( not ( = ?auto_824733 ?auto_824743 ) ) ( not ( = ?auto_824733 ?auto_824744 ) ) ( not ( = ?auto_824733 ?auto_824745 ) ) ( not ( = ?auto_824734 ?auto_824735 ) ) ( not ( = ?auto_824734 ?auto_824736 ) ) ( not ( = ?auto_824734 ?auto_824737 ) ) ( not ( = ?auto_824734 ?auto_824738 ) ) ( not ( = ?auto_824734 ?auto_824739 ) ) ( not ( = ?auto_824734 ?auto_824740 ) ) ( not ( = ?auto_824734 ?auto_824741 ) ) ( not ( = ?auto_824734 ?auto_824742 ) ) ( not ( = ?auto_824734 ?auto_824743 ) ) ( not ( = ?auto_824734 ?auto_824744 ) ) ( not ( = ?auto_824734 ?auto_824745 ) ) ( not ( = ?auto_824735 ?auto_824736 ) ) ( not ( = ?auto_824735 ?auto_824737 ) ) ( not ( = ?auto_824735 ?auto_824738 ) ) ( not ( = ?auto_824735 ?auto_824739 ) ) ( not ( = ?auto_824735 ?auto_824740 ) ) ( not ( = ?auto_824735 ?auto_824741 ) ) ( not ( = ?auto_824735 ?auto_824742 ) ) ( not ( = ?auto_824735 ?auto_824743 ) ) ( not ( = ?auto_824735 ?auto_824744 ) ) ( not ( = ?auto_824735 ?auto_824745 ) ) ( not ( = ?auto_824736 ?auto_824737 ) ) ( not ( = ?auto_824736 ?auto_824738 ) ) ( not ( = ?auto_824736 ?auto_824739 ) ) ( not ( = ?auto_824736 ?auto_824740 ) ) ( not ( = ?auto_824736 ?auto_824741 ) ) ( not ( = ?auto_824736 ?auto_824742 ) ) ( not ( = ?auto_824736 ?auto_824743 ) ) ( not ( = ?auto_824736 ?auto_824744 ) ) ( not ( = ?auto_824736 ?auto_824745 ) ) ( not ( = ?auto_824737 ?auto_824738 ) ) ( not ( = ?auto_824737 ?auto_824739 ) ) ( not ( = ?auto_824737 ?auto_824740 ) ) ( not ( = ?auto_824737 ?auto_824741 ) ) ( not ( = ?auto_824737 ?auto_824742 ) ) ( not ( = ?auto_824737 ?auto_824743 ) ) ( not ( = ?auto_824737 ?auto_824744 ) ) ( not ( = ?auto_824737 ?auto_824745 ) ) ( not ( = ?auto_824738 ?auto_824739 ) ) ( not ( = ?auto_824738 ?auto_824740 ) ) ( not ( = ?auto_824738 ?auto_824741 ) ) ( not ( = ?auto_824738 ?auto_824742 ) ) ( not ( = ?auto_824738 ?auto_824743 ) ) ( not ( = ?auto_824738 ?auto_824744 ) ) ( not ( = ?auto_824738 ?auto_824745 ) ) ( not ( = ?auto_824739 ?auto_824740 ) ) ( not ( = ?auto_824739 ?auto_824741 ) ) ( not ( = ?auto_824739 ?auto_824742 ) ) ( not ( = ?auto_824739 ?auto_824743 ) ) ( not ( = ?auto_824739 ?auto_824744 ) ) ( not ( = ?auto_824739 ?auto_824745 ) ) ( not ( = ?auto_824740 ?auto_824741 ) ) ( not ( = ?auto_824740 ?auto_824742 ) ) ( not ( = ?auto_824740 ?auto_824743 ) ) ( not ( = ?auto_824740 ?auto_824744 ) ) ( not ( = ?auto_824740 ?auto_824745 ) ) ( not ( = ?auto_824741 ?auto_824742 ) ) ( not ( = ?auto_824741 ?auto_824743 ) ) ( not ( = ?auto_824741 ?auto_824744 ) ) ( not ( = ?auto_824741 ?auto_824745 ) ) ( not ( = ?auto_824742 ?auto_824743 ) ) ( not ( = ?auto_824742 ?auto_824744 ) ) ( not ( = ?auto_824742 ?auto_824745 ) ) ( not ( = ?auto_824743 ?auto_824744 ) ) ( not ( = ?auto_824743 ?auto_824745 ) ) ( not ( = ?auto_824744 ?auto_824745 ) ) ( ON ?auto_824743 ?auto_824744 ) ( ON ?auto_824742 ?auto_824743 ) ( ON ?auto_824741 ?auto_824742 ) ( ON ?auto_824740 ?auto_824741 ) ( ON ?auto_824739 ?auto_824740 ) ( ON ?auto_824738 ?auto_824739 ) ( ON ?auto_824737 ?auto_824738 ) ( ON ?auto_824736 ?auto_824737 ) ( ON ?auto_824735 ?auto_824736 ) ( CLEAR ?auto_824733 ) ( ON ?auto_824734 ?auto_824735 ) ( CLEAR ?auto_824734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_824729 ?auto_824730 ?auto_824731 ?auto_824732 ?auto_824733 ?auto_824734 )
      ( MAKE-16PILE ?auto_824729 ?auto_824730 ?auto_824731 ?auto_824732 ?auto_824733 ?auto_824734 ?auto_824735 ?auto_824736 ?auto_824737 ?auto_824738 ?auto_824739 ?auto_824740 ?auto_824741 ?auto_824742 ?auto_824743 ?auto_824744 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824795 - BLOCK
      ?auto_824796 - BLOCK
      ?auto_824797 - BLOCK
      ?auto_824798 - BLOCK
      ?auto_824799 - BLOCK
      ?auto_824800 - BLOCK
      ?auto_824801 - BLOCK
      ?auto_824802 - BLOCK
      ?auto_824803 - BLOCK
      ?auto_824804 - BLOCK
      ?auto_824805 - BLOCK
      ?auto_824806 - BLOCK
      ?auto_824807 - BLOCK
      ?auto_824808 - BLOCK
      ?auto_824809 - BLOCK
      ?auto_824810 - BLOCK
    )
    :vars
    (
      ?auto_824811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824810 ?auto_824811 ) ( ON-TABLE ?auto_824795 ) ( ON ?auto_824796 ?auto_824795 ) ( ON ?auto_824797 ?auto_824796 ) ( ON ?auto_824798 ?auto_824797 ) ( not ( = ?auto_824795 ?auto_824796 ) ) ( not ( = ?auto_824795 ?auto_824797 ) ) ( not ( = ?auto_824795 ?auto_824798 ) ) ( not ( = ?auto_824795 ?auto_824799 ) ) ( not ( = ?auto_824795 ?auto_824800 ) ) ( not ( = ?auto_824795 ?auto_824801 ) ) ( not ( = ?auto_824795 ?auto_824802 ) ) ( not ( = ?auto_824795 ?auto_824803 ) ) ( not ( = ?auto_824795 ?auto_824804 ) ) ( not ( = ?auto_824795 ?auto_824805 ) ) ( not ( = ?auto_824795 ?auto_824806 ) ) ( not ( = ?auto_824795 ?auto_824807 ) ) ( not ( = ?auto_824795 ?auto_824808 ) ) ( not ( = ?auto_824795 ?auto_824809 ) ) ( not ( = ?auto_824795 ?auto_824810 ) ) ( not ( = ?auto_824795 ?auto_824811 ) ) ( not ( = ?auto_824796 ?auto_824797 ) ) ( not ( = ?auto_824796 ?auto_824798 ) ) ( not ( = ?auto_824796 ?auto_824799 ) ) ( not ( = ?auto_824796 ?auto_824800 ) ) ( not ( = ?auto_824796 ?auto_824801 ) ) ( not ( = ?auto_824796 ?auto_824802 ) ) ( not ( = ?auto_824796 ?auto_824803 ) ) ( not ( = ?auto_824796 ?auto_824804 ) ) ( not ( = ?auto_824796 ?auto_824805 ) ) ( not ( = ?auto_824796 ?auto_824806 ) ) ( not ( = ?auto_824796 ?auto_824807 ) ) ( not ( = ?auto_824796 ?auto_824808 ) ) ( not ( = ?auto_824796 ?auto_824809 ) ) ( not ( = ?auto_824796 ?auto_824810 ) ) ( not ( = ?auto_824796 ?auto_824811 ) ) ( not ( = ?auto_824797 ?auto_824798 ) ) ( not ( = ?auto_824797 ?auto_824799 ) ) ( not ( = ?auto_824797 ?auto_824800 ) ) ( not ( = ?auto_824797 ?auto_824801 ) ) ( not ( = ?auto_824797 ?auto_824802 ) ) ( not ( = ?auto_824797 ?auto_824803 ) ) ( not ( = ?auto_824797 ?auto_824804 ) ) ( not ( = ?auto_824797 ?auto_824805 ) ) ( not ( = ?auto_824797 ?auto_824806 ) ) ( not ( = ?auto_824797 ?auto_824807 ) ) ( not ( = ?auto_824797 ?auto_824808 ) ) ( not ( = ?auto_824797 ?auto_824809 ) ) ( not ( = ?auto_824797 ?auto_824810 ) ) ( not ( = ?auto_824797 ?auto_824811 ) ) ( not ( = ?auto_824798 ?auto_824799 ) ) ( not ( = ?auto_824798 ?auto_824800 ) ) ( not ( = ?auto_824798 ?auto_824801 ) ) ( not ( = ?auto_824798 ?auto_824802 ) ) ( not ( = ?auto_824798 ?auto_824803 ) ) ( not ( = ?auto_824798 ?auto_824804 ) ) ( not ( = ?auto_824798 ?auto_824805 ) ) ( not ( = ?auto_824798 ?auto_824806 ) ) ( not ( = ?auto_824798 ?auto_824807 ) ) ( not ( = ?auto_824798 ?auto_824808 ) ) ( not ( = ?auto_824798 ?auto_824809 ) ) ( not ( = ?auto_824798 ?auto_824810 ) ) ( not ( = ?auto_824798 ?auto_824811 ) ) ( not ( = ?auto_824799 ?auto_824800 ) ) ( not ( = ?auto_824799 ?auto_824801 ) ) ( not ( = ?auto_824799 ?auto_824802 ) ) ( not ( = ?auto_824799 ?auto_824803 ) ) ( not ( = ?auto_824799 ?auto_824804 ) ) ( not ( = ?auto_824799 ?auto_824805 ) ) ( not ( = ?auto_824799 ?auto_824806 ) ) ( not ( = ?auto_824799 ?auto_824807 ) ) ( not ( = ?auto_824799 ?auto_824808 ) ) ( not ( = ?auto_824799 ?auto_824809 ) ) ( not ( = ?auto_824799 ?auto_824810 ) ) ( not ( = ?auto_824799 ?auto_824811 ) ) ( not ( = ?auto_824800 ?auto_824801 ) ) ( not ( = ?auto_824800 ?auto_824802 ) ) ( not ( = ?auto_824800 ?auto_824803 ) ) ( not ( = ?auto_824800 ?auto_824804 ) ) ( not ( = ?auto_824800 ?auto_824805 ) ) ( not ( = ?auto_824800 ?auto_824806 ) ) ( not ( = ?auto_824800 ?auto_824807 ) ) ( not ( = ?auto_824800 ?auto_824808 ) ) ( not ( = ?auto_824800 ?auto_824809 ) ) ( not ( = ?auto_824800 ?auto_824810 ) ) ( not ( = ?auto_824800 ?auto_824811 ) ) ( not ( = ?auto_824801 ?auto_824802 ) ) ( not ( = ?auto_824801 ?auto_824803 ) ) ( not ( = ?auto_824801 ?auto_824804 ) ) ( not ( = ?auto_824801 ?auto_824805 ) ) ( not ( = ?auto_824801 ?auto_824806 ) ) ( not ( = ?auto_824801 ?auto_824807 ) ) ( not ( = ?auto_824801 ?auto_824808 ) ) ( not ( = ?auto_824801 ?auto_824809 ) ) ( not ( = ?auto_824801 ?auto_824810 ) ) ( not ( = ?auto_824801 ?auto_824811 ) ) ( not ( = ?auto_824802 ?auto_824803 ) ) ( not ( = ?auto_824802 ?auto_824804 ) ) ( not ( = ?auto_824802 ?auto_824805 ) ) ( not ( = ?auto_824802 ?auto_824806 ) ) ( not ( = ?auto_824802 ?auto_824807 ) ) ( not ( = ?auto_824802 ?auto_824808 ) ) ( not ( = ?auto_824802 ?auto_824809 ) ) ( not ( = ?auto_824802 ?auto_824810 ) ) ( not ( = ?auto_824802 ?auto_824811 ) ) ( not ( = ?auto_824803 ?auto_824804 ) ) ( not ( = ?auto_824803 ?auto_824805 ) ) ( not ( = ?auto_824803 ?auto_824806 ) ) ( not ( = ?auto_824803 ?auto_824807 ) ) ( not ( = ?auto_824803 ?auto_824808 ) ) ( not ( = ?auto_824803 ?auto_824809 ) ) ( not ( = ?auto_824803 ?auto_824810 ) ) ( not ( = ?auto_824803 ?auto_824811 ) ) ( not ( = ?auto_824804 ?auto_824805 ) ) ( not ( = ?auto_824804 ?auto_824806 ) ) ( not ( = ?auto_824804 ?auto_824807 ) ) ( not ( = ?auto_824804 ?auto_824808 ) ) ( not ( = ?auto_824804 ?auto_824809 ) ) ( not ( = ?auto_824804 ?auto_824810 ) ) ( not ( = ?auto_824804 ?auto_824811 ) ) ( not ( = ?auto_824805 ?auto_824806 ) ) ( not ( = ?auto_824805 ?auto_824807 ) ) ( not ( = ?auto_824805 ?auto_824808 ) ) ( not ( = ?auto_824805 ?auto_824809 ) ) ( not ( = ?auto_824805 ?auto_824810 ) ) ( not ( = ?auto_824805 ?auto_824811 ) ) ( not ( = ?auto_824806 ?auto_824807 ) ) ( not ( = ?auto_824806 ?auto_824808 ) ) ( not ( = ?auto_824806 ?auto_824809 ) ) ( not ( = ?auto_824806 ?auto_824810 ) ) ( not ( = ?auto_824806 ?auto_824811 ) ) ( not ( = ?auto_824807 ?auto_824808 ) ) ( not ( = ?auto_824807 ?auto_824809 ) ) ( not ( = ?auto_824807 ?auto_824810 ) ) ( not ( = ?auto_824807 ?auto_824811 ) ) ( not ( = ?auto_824808 ?auto_824809 ) ) ( not ( = ?auto_824808 ?auto_824810 ) ) ( not ( = ?auto_824808 ?auto_824811 ) ) ( not ( = ?auto_824809 ?auto_824810 ) ) ( not ( = ?auto_824809 ?auto_824811 ) ) ( not ( = ?auto_824810 ?auto_824811 ) ) ( ON ?auto_824809 ?auto_824810 ) ( ON ?auto_824808 ?auto_824809 ) ( ON ?auto_824807 ?auto_824808 ) ( ON ?auto_824806 ?auto_824807 ) ( ON ?auto_824805 ?auto_824806 ) ( ON ?auto_824804 ?auto_824805 ) ( ON ?auto_824803 ?auto_824804 ) ( ON ?auto_824802 ?auto_824803 ) ( ON ?auto_824801 ?auto_824802 ) ( ON ?auto_824800 ?auto_824801 ) ( CLEAR ?auto_824798 ) ( ON ?auto_824799 ?auto_824800 ) ( CLEAR ?auto_824799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_824795 ?auto_824796 ?auto_824797 ?auto_824798 ?auto_824799 )
      ( MAKE-16PILE ?auto_824795 ?auto_824796 ?auto_824797 ?auto_824798 ?auto_824799 ?auto_824800 ?auto_824801 ?auto_824802 ?auto_824803 ?auto_824804 ?auto_824805 ?auto_824806 ?auto_824807 ?auto_824808 ?auto_824809 ?auto_824810 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824861 - BLOCK
      ?auto_824862 - BLOCK
      ?auto_824863 - BLOCK
      ?auto_824864 - BLOCK
      ?auto_824865 - BLOCK
      ?auto_824866 - BLOCK
      ?auto_824867 - BLOCK
      ?auto_824868 - BLOCK
      ?auto_824869 - BLOCK
      ?auto_824870 - BLOCK
      ?auto_824871 - BLOCK
      ?auto_824872 - BLOCK
      ?auto_824873 - BLOCK
      ?auto_824874 - BLOCK
      ?auto_824875 - BLOCK
      ?auto_824876 - BLOCK
    )
    :vars
    (
      ?auto_824877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824876 ?auto_824877 ) ( ON-TABLE ?auto_824861 ) ( ON ?auto_824862 ?auto_824861 ) ( ON ?auto_824863 ?auto_824862 ) ( not ( = ?auto_824861 ?auto_824862 ) ) ( not ( = ?auto_824861 ?auto_824863 ) ) ( not ( = ?auto_824861 ?auto_824864 ) ) ( not ( = ?auto_824861 ?auto_824865 ) ) ( not ( = ?auto_824861 ?auto_824866 ) ) ( not ( = ?auto_824861 ?auto_824867 ) ) ( not ( = ?auto_824861 ?auto_824868 ) ) ( not ( = ?auto_824861 ?auto_824869 ) ) ( not ( = ?auto_824861 ?auto_824870 ) ) ( not ( = ?auto_824861 ?auto_824871 ) ) ( not ( = ?auto_824861 ?auto_824872 ) ) ( not ( = ?auto_824861 ?auto_824873 ) ) ( not ( = ?auto_824861 ?auto_824874 ) ) ( not ( = ?auto_824861 ?auto_824875 ) ) ( not ( = ?auto_824861 ?auto_824876 ) ) ( not ( = ?auto_824861 ?auto_824877 ) ) ( not ( = ?auto_824862 ?auto_824863 ) ) ( not ( = ?auto_824862 ?auto_824864 ) ) ( not ( = ?auto_824862 ?auto_824865 ) ) ( not ( = ?auto_824862 ?auto_824866 ) ) ( not ( = ?auto_824862 ?auto_824867 ) ) ( not ( = ?auto_824862 ?auto_824868 ) ) ( not ( = ?auto_824862 ?auto_824869 ) ) ( not ( = ?auto_824862 ?auto_824870 ) ) ( not ( = ?auto_824862 ?auto_824871 ) ) ( not ( = ?auto_824862 ?auto_824872 ) ) ( not ( = ?auto_824862 ?auto_824873 ) ) ( not ( = ?auto_824862 ?auto_824874 ) ) ( not ( = ?auto_824862 ?auto_824875 ) ) ( not ( = ?auto_824862 ?auto_824876 ) ) ( not ( = ?auto_824862 ?auto_824877 ) ) ( not ( = ?auto_824863 ?auto_824864 ) ) ( not ( = ?auto_824863 ?auto_824865 ) ) ( not ( = ?auto_824863 ?auto_824866 ) ) ( not ( = ?auto_824863 ?auto_824867 ) ) ( not ( = ?auto_824863 ?auto_824868 ) ) ( not ( = ?auto_824863 ?auto_824869 ) ) ( not ( = ?auto_824863 ?auto_824870 ) ) ( not ( = ?auto_824863 ?auto_824871 ) ) ( not ( = ?auto_824863 ?auto_824872 ) ) ( not ( = ?auto_824863 ?auto_824873 ) ) ( not ( = ?auto_824863 ?auto_824874 ) ) ( not ( = ?auto_824863 ?auto_824875 ) ) ( not ( = ?auto_824863 ?auto_824876 ) ) ( not ( = ?auto_824863 ?auto_824877 ) ) ( not ( = ?auto_824864 ?auto_824865 ) ) ( not ( = ?auto_824864 ?auto_824866 ) ) ( not ( = ?auto_824864 ?auto_824867 ) ) ( not ( = ?auto_824864 ?auto_824868 ) ) ( not ( = ?auto_824864 ?auto_824869 ) ) ( not ( = ?auto_824864 ?auto_824870 ) ) ( not ( = ?auto_824864 ?auto_824871 ) ) ( not ( = ?auto_824864 ?auto_824872 ) ) ( not ( = ?auto_824864 ?auto_824873 ) ) ( not ( = ?auto_824864 ?auto_824874 ) ) ( not ( = ?auto_824864 ?auto_824875 ) ) ( not ( = ?auto_824864 ?auto_824876 ) ) ( not ( = ?auto_824864 ?auto_824877 ) ) ( not ( = ?auto_824865 ?auto_824866 ) ) ( not ( = ?auto_824865 ?auto_824867 ) ) ( not ( = ?auto_824865 ?auto_824868 ) ) ( not ( = ?auto_824865 ?auto_824869 ) ) ( not ( = ?auto_824865 ?auto_824870 ) ) ( not ( = ?auto_824865 ?auto_824871 ) ) ( not ( = ?auto_824865 ?auto_824872 ) ) ( not ( = ?auto_824865 ?auto_824873 ) ) ( not ( = ?auto_824865 ?auto_824874 ) ) ( not ( = ?auto_824865 ?auto_824875 ) ) ( not ( = ?auto_824865 ?auto_824876 ) ) ( not ( = ?auto_824865 ?auto_824877 ) ) ( not ( = ?auto_824866 ?auto_824867 ) ) ( not ( = ?auto_824866 ?auto_824868 ) ) ( not ( = ?auto_824866 ?auto_824869 ) ) ( not ( = ?auto_824866 ?auto_824870 ) ) ( not ( = ?auto_824866 ?auto_824871 ) ) ( not ( = ?auto_824866 ?auto_824872 ) ) ( not ( = ?auto_824866 ?auto_824873 ) ) ( not ( = ?auto_824866 ?auto_824874 ) ) ( not ( = ?auto_824866 ?auto_824875 ) ) ( not ( = ?auto_824866 ?auto_824876 ) ) ( not ( = ?auto_824866 ?auto_824877 ) ) ( not ( = ?auto_824867 ?auto_824868 ) ) ( not ( = ?auto_824867 ?auto_824869 ) ) ( not ( = ?auto_824867 ?auto_824870 ) ) ( not ( = ?auto_824867 ?auto_824871 ) ) ( not ( = ?auto_824867 ?auto_824872 ) ) ( not ( = ?auto_824867 ?auto_824873 ) ) ( not ( = ?auto_824867 ?auto_824874 ) ) ( not ( = ?auto_824867 ?auto_824875 ) ) ( not ( = ?auto_824867 ?auto_824876 ) ) ( not ( = ?auto_824867 ?auto_824877 ) ) ( not ( = ?auto_824868 ?auto_824869 ) ) ( not ( = ?auto_824868 ?auto_824870 ) ) ( not ( = ?auto_824868 ?auto_824871 ) ) ( not ( = ?auto_824868 ?auto_824872 ) ) ( not ( = ?auto_824868 ?auto_824873 ) ) ( not ( = ?auto_824868 ?auto_824874 ) ) ( not ( = ?auto_824868 ?auto_824875 ) ) ( not ( = ?auto_824868 ?auto_824876 ) ) ( not ( = ?auto_824868 ?auto_824877 ) ) ( not ( = ?auto_824869 ?auto_824870 ) ) ( not ( = ?auto_824869 ?auto_824871 ) ) ( not ( = ?auto_824869 ?auto_824872 ) ) ( not ( = ?auto_824869 ?auto_824873 ) ) ( not ( = ?auto_824869 ?auto_824874 ) ) ( not ( = ?auto_824869 ?auto_824875 ) ) ( not ( = ?auto_824869 ?auto_824876 ) ) ( not ( = ?auto_824869 ?auto_824877 ) ) ( not ( = ?auto_824870 ?auto_824871 ) ) ( not ( = ?auto_824870 ?auto_824872 ) ) ( not ( = ?auto_824870 ?auto_824873 ) ) ( not ( = ?auto_824870 ?auto_824874 ) ) ( not ( = ?auto_824870 ?auto_824875 ) ) ( not ( = ?auto_824870 ?auto_824876 ) ) ( not ( = ?auto_824870 ?auto_824877 ) ) ( not ( = ?auto_824871 ?auto_824872 ) ) ( not ( = ?auto_824871 ?auto_824873 ) ) ( not ( = ?auto_824871 ?auto_824874 ) ) ( not ( = ?auto_824871 ?auto_824875 ) ) ( not ( = ?auto_824871 ?auto_824876 ) ) ( not ( = ?auto_824871 ?auto_824877 ) ) ( not ( = ?auto_824872 ?auto_824873 ) ) ( not ( = ?auto_824872 ?auto_824874 ) ) ( not ( = ?auto_824872 ?auto_824875 ) ) ( not ( = ?auto_824872 ?auto_824876 ) ) ( not ( = ?auto_824872 ?auto_824877 ) ) ( not ( = ?auto_824873 ?auto_824874 ) ) ( not ( = ?auto_824873 ?auto_824875 ) ) ( not ( = ?auto_824873 ?auto_824876 ) ) ( not ( = ?auto_824873 ?auto_824877 ) ) ( not ( = ?auto_824874 ?auto_824875 ) ) ( not ( = ?auto_824874 ?auto_824876 ) ) ( not ( = ?auto_824874 ?auto_824877 ) ) ( not ( = ?auto_824875 ?auto_824876 ) ) ( not ( = ?auto_824875 ?auto_824877 ) ) ( not ( = ?auto_824876 ?auto_824877 ) ) ( ON ?auto_824875 ?auto_824876 ) ( ON ?auto_824874 ?auto_824875 ) ( ON ?auto_824873 ?auto_824874 ) ( ON ?auto_824872 ?auto_824873 ) ( ON ?auto_824871 ?auto_824872 ) ( ON ?auto_824870 ?auto_824871 ) ( ON ?auto_824869 ?auto_824870 ) ( ON ?auto_824868 ?auto_824869 ) ( ON ?auto_824867 ?auto_824868 ) ( ON ?auto_824866 ?auto_824867 ) ( ON ?auto_824865 ?auto_824866 ) ( CLEAR ?auto_824863 ) ( ON ?auto_824864 ?auto_824865 ) ( CLEAR ?auto_824864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_824861 ?auto_824862 ?auto_824863 ?auto_824864 )
      ( MAKE-16PILE ?auto_824861 ?auto_824862 ?auto_824863 ?auto_824864 ?auto_824865 ?auto_824866 ?auto_824867 ?auto_824868 ?auto_824869 ?auto_824870 ?auto_824871 ?auto_824872 ?auto_824873 ?auto_824874 ?auto_824875 ?auto_824876 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824927 - BLOCK
      ?auto_824928 - BLOCK
      ?auto_824929 - BLOCK
      ?auto_824930 - BLOCK
      ?auto_824931 - BLOCK
      ?auto_824932 - BLOCK
      ?auto_824933 - BLOCK
      ?auto_824934 - BLOCK
      ?auto_824935 - BLOCK
      ?auto_824936 - BLOCK
      ?auto_824937 - BLOCK
      ?auto_824938 - BLOCK
      ?auto_824939 - BLOCK
      ?auto_824940 - BLOCK
      ?auto_824941 - BLOCK
      ?auto_824942 - BLOCK
    )
    :vars
    (
      ?auto_824943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_824942 ?auto_824943 ) ( ON-TABLE ?auto_824927 ) ( ON ?auto_824928 ?auto_824927 ) ( not ( = ?auto_824927 ?auto_824928 ) ) ( not ( = ?auto_824927 ?auto_824929 ) ) ( not ( = ?auto_824927 ?auto_824930 ) ) ( not ( = ?auto_824927 ?auto_824931 ) ) ( not ( = ?auto_824927 ?auto_824932 ) ) ( not ( = ?auto_824927 ?auto_824933 ) ) ( not ( = ?auto_824927 ?auto_824934 ) ) ( not ( = ?auto_824927 ?auto_824935 ) ) ( not ( = ?auto_824927 ?auto_824936 ) ) ( not ( = ?auto_824927 ?auto_824937 ) ) ( not ( = ?auto_824927 ?auto_824938 ) ) ( not ( = ?auto_824927 ?auto_824939 ) ) ( not ( = ?auto_824927 ?auto_824940 ) ) ( not ( = ?auto_824927 ?auto_824941 ) ) ( not ( = ?auto_824927 ?auto_824942 ) ) ( not ( = ?auto_824927 ?auto_824943 ) ) ( not ( = ?auto_824928 ?auto_824929 ) ) ( not ( = ?auto_824928 ?auto_824930 ) ) ( not ( = ?auto_824928 ?auto_824931 ) ) ( not ( = ?auto_824928 ?auto_824932 ) ) ( not ( = ?auto_824928 ?auto_824933 ) ) ( not ( = ?auto_824928 ?auto_824934 ) ) ( not ( = ?auto_824928 ?auto_824935 ) ) ( not ( = ?auto_824928 ?auto_824936 ) ) ( not ( = ?auto_824928 ?auto_824937 ) ) ( not ( = ?auto_824928 ?auto_824938 ) ) ( not ( = ?auto_824928 ?auto_824939 ) ) ( not ( = ?auto_824928 ?auto_824940 ) ) ( not ( = ?auto_824928 ?auto_824941 ) ) ( not ( = ?auto_824928 ?auto_824942 ) ) ( not ( = ?auto_824928 ?auto_824943 ) ) ( not ( = ?auto_824929 ?auto_824930 ) ) ( not ( = ?auto_824929 ?auto_824931 ) ) ( not ( = ?auto_824929 ?auto_824932 ) ) ( not ( = ?auto_824929 ?auto_824933 ) ) ( not ( = ?auto_824929 ?auto_824934 ) ) ( not ( = ?auto_824929 ?auto_824935 ) ) ( not ( = ?auto_824929 ?auto_824936 ) ) ( not ( = ?auto_824929 ?auto_824937 ) ) ( not ( = ?auto_824929 ?auto_824938 ) ) ( not ( = ?auto_824929 ?auto_824939 ) ) ( not ( = ?auto_824929 ?auto_824940 ) ) ( not ( = ?auto_824929 ?auto_824941 ) ) ( not ( = ?auto_824929 ?auto_824942 ) ) ( not ( = ?auto_824929 ?auto_824943 ) ) ( not ( = ?auto_824930 ?auto_824931 ) ) ( not ( = ?auto_824930 ?auto_824932 ) ) ( not ( = ?auto_824930 ?auto_824933 ) ) ( not ( = ?auto_824930 ?auto_824934 ) ) ( not ( = ?auto_824930 ?auto_824935 ) ) ( not ( = ?auto_824930 ?auto_824936 ) ) ( not ( = ?auto_824930 ?auto_824937 ) ) ( not ( = ?auto_824930 ?auto_824938 ) ) ( not ( = ?auto_824930 ?auto_824939 ) ) ( not ( = ?auto_824930 ?auto_824940 ) ) ( not ( = ?auto_824930 ?auto_824941 ) ) ( not ( = ?auto_824930 ?auto_824942 ) ) ( not ( = ?auto_824930 ?auto_824943 ) ) ( not ( = ?auto_824931 ?auto_824932 ) ) ( not ( = ?auto_824931 ?auto_824933 ) ) ( not ( = ?auto_824931 ?auto_824934 ) ) ( not ( = ?auto_824931 ?auto_824935 ) ) ( not ( = ?auto_824931 ?auto_824936 ) ) ( not ( = ?auto_824931 ?auto_824937 ) ) ( not ( = ?auto_824931 ?auto_824938 ) ) ( not ( = ?auto_824931 ?auto_824939 ) ) ( not ( = ?auto_824931 ?auto_824940 ) ) ( not ( = ?auto_824931 ?auto_824941 ) ) ( not ( = ?auto_824931 ?auto_824942 ) ) ( not ( = ?auto_824931 ?auto_824943 ) ) ( not ( = ?auto_824932 ?auto_824933 ) ) ( not ( = ?auto_824932 ?auto_824934 ) ) ( not ( = ?auto_824932 ?auto_824935 ) ) ( not ( = ?auto_824932 ?auto_824936 ) ) ( not ( = ?auto_824932 ?auto_824937 ) ) ( not ( = ?auto_824932 ?auto_824938 ) ) ( not ( = ?auto_824932 ?auto_824939 ) ) ( not ( = ?auto_824932 ?auto_824940 ) ) ( not ( = ?auto_824932 ?auto_824941 ) ) ( not ( = ?auto_824932 ?auto_824942 ) ) ( not ( = ?auto_824932 ?auto_824943 ) ) ( not ( = ?auto_824933 ?auto_824934 ) ) ( not ( = ?auto_824933 ?auto_824935 ) ) ( not ( = ?auto_824933 ?auto_824936 ) ) ( not ( = ?auto_824933 ?auto_824937 ) ) ( not ( = ?auto_824933 ?auto_824938 ) ) ( not ( = ?auto_824933 ?auto_824939 ) ) ( not ( = ?auto_824933 ?auto_824940 ) ) ( not ( = ?auto_824933 ?auto_824941 ) ) ( not ( = ?auto_824933 ?auto_824942 ) ) ( not ( = ?auto_824933 ?auto_824943 ) ) ( not ( = ?auto_824934 ?auto_824935 ) ) ( not ( = ?auto_824934 ?auto_824936 ) ) ( not ( = ?auto_824934 ?auto_824937 ) ) ( not ( = ?auto_824934 ?auto_824938 ) ) ( not ( = ?auto_824934 ?auto_824939 ) ) ( not ( = ?auto_824934 ?auto_824940 ) ) ( not ( = ?auto_824934 ?auto_824941 ) ) ( not ( = ?auto_824934 ?auto_824942 ) ) ( not ( = ?auto_824934 ?auto_824943 ) ) ( not ( = ?auto_824935 ?auto_824936 ) ) ( not ( = ?auto_824935 ?auto_824937 ) ) ( not ( = ?auto_824935 ?auto_824938 ) ) ( not ( = ?auto_824935 ?auto_824939 ) ) ( not ( = ?auto_824935 ?auto_824940 ) ) ( not ( = ?auto_824935 ?auto_824941 ) ) ( not ( = ?auto_824935 ?auto_824942 ) ) ( not ( = ?auto_824935 ?auto_824943 ) ) ( not ( = ?auto_824936 ?auto_824937 ) ) ( not ( = ?auto_824936 ?auto_824938 ) ) ( not ( = ?auto_824936 ?auto_824939 ) ) ( not ( = ?auto_824936 ?auto_824940 ) ) ( not ( = ?auto_824936 ?auto_824941 ) ) ( not ( = ?auto_824936 ?auto_824942 ) ) ( not ( = ?auto_824936 ?auto_824943 ) ) ( not ( = ?auto_824937 ?auto_824938 ) ) ( not ( = ?auto_824937 ?auto_824939 ) ) ( not ( = ?auto_824937 ?auto_824940 ) ) ( not ( = ?auto_824937 ?auto_824941 ) ) ( not ( = ?auto_824937 ?auto_824942 ) ) ( not ( = ?auto_824937 ?auto_824943 ) ) ( not ( = ?auto_824938 ?auto_824939 ) ) ( not ( = ?auto_824938 ?auto_824940 ) ) ( not ( = ?auto_824938 ?auto_824941 ) ) ( not ( = ?auto_824938 ?auto_824942 ) ) ( not ( = ?auto_824938 ?auto_824943 ) ) ( not ( = ?auto_824939 ?auto_824940 ) ) ( not ( = ?auto_824939 ?auto_824941 ) ) ( not ( = ?auto_824939 ?auto_824942 ) ) ( not ( = ?auto_824939 ?auto_824943 ) ) ( not ( = ?auto_824940 ?auto_824941 ) ) ( not ( = ?auto_824940 ?auto_824942 ) ) ( not ( = ?auto_824940 ?auto_824943 ) ) ( not ( = ?auto_824941 ?auto_824942 ) ) ( not ( = ?auto_824941 ?auto_824943 ) ) ( not ( = ?auto_824942 ?auto_824943 ) ) ( ON ?auto_824941 ?auto_824942 ) ( ON ?auto_824940 ?auto_824941 ) ( ON ?auto_824939 ?auto_824940 ) ( ON ?auto_824938 ?auto_824939 ) ( ON ?auto_824937 ?auto_824938 ) ( ON ?auto_824936 ?auto_824937 ) ( ON ?auto_824935 ?auto_824936 ) ( ON ?auto_824934 ?auto_824935 ) ( ON ?auto_824933 ?auto_824934 ) ( ON ?auto_824932 ?auto_824933 ) ( ON ?auto_824931 ?auto_824932 ) ( ON ?auto_824930 ?auto_824931 ) ( CLEAR ?auto_824928 ) ( ON ?auto_824929 ?auto_824930 ) ( CLEAR ?auto_824929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_824927 ?auto_824928 ?auto_824929 )
      ( MAKE-16PILE ?auto_824927 ?auto_824928 ?auto_824929 ?auto_824930 ?auto_824931 ?auto_824932 ?auto_824933 ?auto_824934 ?auto_824935 ?auto_824936 ?auto_824937 ?auto_824938 ?auto_824939 ?auto_824940 ?auto_824941 ?auto_824942 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_824993 - BLOCK
      ?auto_824994 - BLOCK
      ?auto_824995 - BLOCK
      ?auto_824996 - BLOCK
      ?auto_824997 - BLOCK
      ?auto_824998 - BLOCK
      ?auto_824999 - BLOCK
      ?auto_825000 - BLOCK
      ?auto_825001 - BLOCK
      ?auto_825002 - BLOCK
      ?auto_825003 - BLOCK
      ?auto_825004 - BLOCK
      ?auto_825005 - BLOCK
      ?auto_825006 - BLOCK
      ?auto_825007 - BLOCK
      ?auto_825008 - BLOCK
    )
    :vars
    (
      ?auto_825009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825008 ?auto_825009 ) ( ON-TABLE ?auto_824993 ) ( not ( = ?auto_824993 ?auto_824994 ) ) ( not ( = ?auto_824993 ?auto_824995 ) ) ( not ( = ?auto_824993 ?auto_824996 ) ) ( not ( = ?auto_824993 ?auto_824997 ) ) ( not ( = ?auto_824993 ?auto_824998 ) ) ( not ( = ?auto_824993 ?auto_824999 ) ) ( not ( = ?auto_824993 ?auto_825000 ) ) ( not ( = ?auto_824993 ?auto_825001 ) ) ( not ( = ?auto_824993 ?auto_825002 ) ) ( not ( = ?auto_824993 ?auto_825003 ) ) ( not ( = ?auto_824993 ?auto_825004 ) ) ( not ( = ?auto_824993 ?auto_825005 ) ) ( not ( = ?auto_824993 ?auto_825006 ) ) ( not ( = ?auto_824993 ?auto_825007 ) ) ( not ( = ?auto_824993 ?auto_825008 ) ) ( not ( = ?auto_824993 ?auto_825009 ) ) ( not ( = ?auto_824994 ?auto_824995 ) ) ( not ( = ?auto_824994 ?auto_824996 ) ) ( not ( = ?auto_824994 ?auto_824997 ) ) ( not ( = ?auto_824994 ?auto_824998 ) ) ( not ( = ?auto_824994 ?auto_824999 ) ) ( not ( = ?auto_824994 ?auto_825000 ) ) ( not ( = ?auto_824994 ?auto_825001 ) ) ( not ( = ?auto_824994 ?auto_825002 ) ) ( not ( = ?auto_824994 ?auto_825003 ) ) ( not ( = ?auto_824994 ?auto_825004 ) ) ( not ( = ?auto_824994 ?auto_825005 ) ) ( not ( = ?auto_824994 ?auto_825006 ) ) ( not ( = ?auto_824994 ?auto_825007 ) ) ( not ( = ?auto_824994 ?auto_825008 ) ) ( not ( = ?auto_824994 ?auto_825009 ) ) ( not ( = ?auto_824995 ?auto_824996 ) ) ( not ( = ?auto_824995 ?auto_824997 ) ) ( not ( = ?auto_824995 ?auto_824998 ) ) ( not ( = ?auto_824995 ?auto_824999 ) ) ( not ( = ?auto_824995 ?auto_825000 ) ) ( not ( = ?auto_824995 ?auto_825001 ) ) ( not ( = ?auto_824995 ?auto_825002 ) ) ( not ( = ?auto_824995 ?auto_825003 ) ) ( not ( = ?auto_824995 ?auto_825004 ) ) ( not ( = ?auto_824995 ?auto_825005 ) ) ( not ( = ?auto_824995 ?auto_825006 ) ) ( not ( = ?auto_824995 ?auto_825007 ) ) ( not ( = ?auto_824995 ?auto_825008 ) ) ( not ( = ?auto_824995 ?auto_825009 ) ) ( not ( = ?auto_824996 ?auto_824997 ) ) ( not ( = ?auto_824996 ?auto_824998 ) ) ( not ( = ?auto_824996 ?auto_824999 ) ) ( not ( = ?auto_824996 ?auto_825000 ) ) ( not ( = ?auto_824996 ?auto_825001 ) ) ( not ( = ?auto_824996 ?auto_825002 ) ) ( not ( = ?auto_824996 ?auto_825003 ) ) ( not ( = ?auto_824996 ?auto_825004 ) ) ( not ( = ?auto_824996 ?auto_825005 ) ) ( not ( = ?auto_824996 ?auto_825006 ) ) ( not ( = ?auto_824996 ?auto_825007 ) ) ( not ( = ?auto_824996 ?auto_825008 ) ) ( not ( = ?auto_824996 ?auto_825009 ) ) ( not ( = ?auto_824997 ?auto_824998 ) ) ( not ( = ?auto_824997 ?auto_824999 ) ) ( not ( = ?auto_824997 ?auto_825000 ) ) ( not ( = ?auto_824997 ?auto_825001 ) ) ( not ( = ?auto_824997 ?auto_825002 ) ) ( not ( = ?auto_824997 ?auto_825003 ) ) ( not ( = ?auto_824997 ?auto_825004 ) ) ( not ( = ?auto_824997 ?auto_825005 ) ) ( not ( = ?auto_824997 ?auto_825006 ) ) ( not ( = ?auto_824997 ?auto_825007 ) ) ( not ( = ?auto_824997 ?auto_825008 ) ) ( not ( = ?auto_824997 ?auto_825009 ) ) ( not ( = ?auto_824998 ?auto_824999 ) ) ( not ( = ?auto_824998 ?auto_825000 ) ) ( not ( = ?auto_824998 ?auto_825001 ) ) ( not ( = ?auto_824998 ?auto_825002 ) ) ( not ( = ?auto_824998 ?auto_825003 ) ) ( not ( = ?auto_824998 ?auto_825004 ) ) ( not ( = ?auto_824998 ?auto_825005 ) ) ( not ( = ?auto_824998 ?auto_825006 ) ) ( not ( = ?auto_824998 ?auto_825007 ) ) ( not ( = ?auto_824998 ?auto_825008 ) ) ( not ( = ?auto_824998 ?auto_825009 ) ) ( not ( = ?auto_824999 ?auto_825000 ) ) ( not ( = ?auto_824999 ?auto_825001 ) ) ( not ( = ?auto_824999 ?auto_825002 ) ) ( not ( = ?auto_824999 ?auto_825003 ) ) ( not ( = ?auto_824999 ?auto_825004 ) ) ( not ( = ?auto_824999 ?auto_825005 ) ) ( not ( = ?auto_824999 ?auto_825006 ) ) ( not ( = ?auto_824999 ?auto_825007 ) ) ( not ( = ?auto_824999 ?auto_825008 ) ) ( not ( = ?auto_824999 ?auto_825009 ) ) ( not ( = ?auto_825000 ?auto_825001 ) ) ( not ( = ?auto_825000 ?auto_825002 ) ) ( not ( = ?auto_825000 ?auto_825003 ) ) ( not ( = ?auto_825000 ?auto_825004 ) ) ( not ( = ?auto_825000 ?auto_825005 ) ) ( not ( = ?auto_825000 ?auto_825006 ) ) ( not ( = ?auto_825000 ?auto_825007 ) ) ( not ( = ?auto_825000 ?auto_825008 ) ) ( not ( = ?auto_825000 ?auto_825009 ) ) ( not ( = ?auto_825001 ?auto_825002 ) ) ( not ( = ?auto_825001 ?auto_825003 ) ) ( not ( = ?auto_825001 ?auto_825004 ) ) ( not ( = ?auto_825001 ?auto_825005 ) ) ( not ( = ?auto_825001 ?auto_825006 ) ) ( not ( = ?auto_825001 ?auto_825007 ) ) ( not ( = ?auto_825001 ?auto_825008 ) ) ( not ( = ?auto_825001 ?auto_825009 ) ) ( not ( = ?auto_825002 ?auto_825003 ) ) ( not ( = ?auto_825002 ?auto_825004 ) ) ( not ( = ?auto_825002 ?auto_825005 ) ) ( not ( = ?auto_825002 ?auto_825006 ) ) ( not ( = ?auto_825002 ?auto_825007 ) ) ( not ( = ?auto_825002 ?auto_825008 ) ) ( not ( = ?auto_825002 ?auto_825009 ) ) ( not ( = ?auto_825003 ?auto_825004 ) ) ( not ( = ?auto_825003 ?auto_825005 ) ) ( not ( = ?auto_825003 ?auto_825006 ) ) ( not ( = ?auto_825003 ?auto_825007 ) ) ( not ( = ?auto_825003 ?auto_825008 ) ) ( not ( = ?auto_825003 ?auto_825009 ) ) ( not ( = ?auto_825004 ?auto_825005 ) ) ( not ( = ?auto_825004 ?auto_825006 ) ) ( not ( = ?auto_825004 ?auto_825007 ) ) ( not ( = ?auto_825004 ?auto_825008 ) ) ( not ( = ?auto_825004 ?auto_825009 ) ) ( not ( = ?auto_825005 ?auto_825006 ) ) ( not ( = ?auto_825005 ?auto_825007 ) ) ( not ( = ?auto_825005 ?auto_825008 ) ) ( not ( = ?auto_825005 ?auto_825009 ) ) ( not ( = ?auto_825006 ?auto_825007 ) ) ( not ( = ?auto_825006 ?auto_825008 ) ) ( not ( = ?auto_825006 ?auto_825009 ) ) ( not ( = ?auto_825007 ?auto_825008 ) ) ( not ( = ?auto_825007 ?auto_825009 ) ) ( not ( = ?auto_825008 ?auto_825009 ) ) ( ON ?auto_825007 ?auto_825008 ) ( ON ?auto_825006 ?auto_825007 ) ( ON ?auto_825005 ?auto_825006 ) ( ON ?auto_825004 ?auto_825005 ) ( ON ?auto_825003 ?auto_825004 ) ( ON ?auto_825002 ?auto_825003 ) ( ON ?auto_825001 ?auto_825002 ) ( ON ?auto_825000 ?auto_825001 ) ( ON ?auto_824999 ?auto_825000 ) ( ON ?auto_824998 ?auto_824999 ) ( ON ?auto_824997 ?auto_824998 ) ( ON ?auto_824996 ?auto_824997 ) ( ON ?auto_824995 ?auto_824996 ) ( CLEAR ?auto_824993 ) ( ON ?auto_824994 ?auto_824995 ) ( CLEAR ?auto_824994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_824993 ?auto_824994 )
      ( MAKE-16PILE ?auto_824993 ?auto_824994 ?auto_824995 ?auto_824996 ?auto_824997 ?auto_824998 ?auto_824999 ?auto_825000 ?auto_825001 ?auto_825002 ?auto_825003 ?auto_825004 ?auto_825005 ?auto_825006 ?auto_825007 ?auto_825008 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_825059 - BLOCK
      ?auto_825060 - BLOCK
      ?auto_825061 - BLOCK
      ?auto_825062 - BLOCK
      ?auto_825063 - BLOCK
      ?auto_825064 - BLOCK
      ?auto_825065 - BLOCK
      ?auto_825066 - BLOCK
      ?auto_825067 - BLOCK
      ?auto_825068 - BLOCK
      ?auto_825069 - BLOCK
      ?auto_825070 - BLOCK
      ?auto_825071 - BLOCK
      ?auto_825072 - BLOCK
      ?auto_825073 - BLOCK
      ?auto_825074 - BLOCK
    )
    :vars
    (
      ?auto_825075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825074 ?auto_825075 ) ( not ( = ?auto_825059 ?auto_825060 ) ) ( not ( = ?auto_825059 ?auto_825061 ) ) ( not ( = ?auto_825059 ?auto_825062 ) ) ( not ( = ?auto_825059 ?auto_825063 ) ) ( not ( = ?auto_825059 ?auto_825064 ) ) ( not ( = ?auto_825059 ?auto_825065 ) ) ( not ( = ?auto_825059 ?auto_825066 ) ) ( not ( = ?auto_825059 ?auto_825067 ) ) ( not ( = ?auto_825059 ?auto_825068 ) ) ( not ( = ?auto_825059 ?auto_825069 ) ) ( not ( = ?auto_825059 ?auto_825070 ) ) ( not ( = ?auto_825059 ?auto_825071 ) ) ( not ( = ?auto_825059 ?auto_825072 ) ) ( not ( = ?auto_825059 ?auto_825073 ) ) ( not ( = ?auto_825059 ?auto_825074 ) ) ( not ( = ?auto_825059 ?auto_825075 ) ) ( not ( = ?auto_825060 ?auto_825061 ) ) ( not ( = ?auto_825060 ?auto_825062 ) ) ( not ( = ?auto_825060 ?auto_825063 ) ) ( not ( = ?auto_825060 ?auto_825064 ) ) ( not ( = ?auto_825060 ?auto_825065 ) ) ( not ( = ?auto_825060 ?auto_825066 ) ) ( not ( = ?auto_825060 ?auto_825067 ) ) ( not ( = ?auto_825060 ?auto_825068 ) ) ( not ( = ?auto_825060 ?auto_825069 ) ) ( not ( = ?auto_825060 ?auto_825070 ) ) ( not ( = ?auto_825060 ?auto_825071 ) ) ( not ( = ?auto_825060 ?auto_825072 ) ) ( not ( = ?auto_825060 ?auto_825073 ) ) ( not ( = ?auto_825060 ?auto_825074 ) ) ( not ( = ?auto_825060 ?auto_825075 ) ) ( not ( = ?auto_825061 ?auto_825062 ) ) ( not ( = ?auto_825061 ?auto_825063 ) ) ( not ( = ?auto_825061 ?auto_825064 ) ) ( not ( = ?auto_825061 ?auto_825065 ) ) ( not ( = ?auto_825061 ?auto_825066 ) ) ( not ( = ?auto_825061 ?auto_825067 ) ) ( not ( = ?auto_825061 ?auto_825068 ) ) ( not ( = ?auto_825061 ?auto_825069 ) ) ( not ( = ?auto_825061 ?auto_825070 ) ) ( not ( = ?auto_825061 ?auto_825071 ) ) ( not ( = ?auto_825061 ?auto_825072 ) ) ( not ( = ?auto_825061 ?auto_825073 ) ) ( not ( = ?auto_825061 ?auto_825074 ) ) ( not ( = ?auto_825061 ?auto_825075 ) ) ( not ( = ?auto_825062 ?auto_825063 ) ) ( not ( = ?auto_825062 ?auto_825064 ) ) ( not ( = ?auto_825062 ?auto_825065 ) ) ( not ( = ?auto_825062 ?auto_825066 ) ) ( not ( = ?auto_825062 ?auto_825067 ) ) ( not ( = ?auto_825062 ?auto_825068 ) ) ( not ( = ?auto_825062 ?auto_825069 ) ) ( not ( = ?auto_825062 ?auto_825070 ) ) ( not ( = ?auto_825062 ?auto_825071 ) ) ( not ( = ?auto_825062 ?auto_825072 ) ) ( not ( = ?auto_825062 ?auto_825073 ) ) ( not ( = ?auto_825062 ?auto_825074 ) ) ( not ( = ?auto_825062 ?auto_825075 ) ) ( not ( = ?auto_825063 ?auto_825064 ) ) ( not ( = ?auto_825063 ?auto_825065 ) ) ( not ( = ?auto_825063 ?auto_825066 ) ) ( not ( = ?auto_825063 ?auto_825067 ) ) ( not ( = ?auto_825063 ?auto_825068 ) ) ( not ( = ?auto_825063 ?auto_825069 ) ) ( not ( = ?auto_825063 ?auto_825070 ) ) ( not ( = ?auto_825063 ?auto_825071 ) ) ( not ( = ?auto_825063 ?auto_825072 ) ) ( not ( = ?auto_825063 ?auto_825073 ) ) ( not ( = ?auto_825063 ?auto_825074 ) ) ( not ( = ?auto_825063 ?auto_825075 ) ) ( not ( = ?auto_825064 ?auto_825065 ) ) ( not ( = ?auto_825064 ?auto_825066 ) ) ( not ( = ?auto_825064 ?auto_825067 ) ) ( not ( = ?auto_825064 ?auto_825068 ) ) ( not ( = ?auto_825064 ?auto_825069 ) ) ( not ( = ?auto_825064 ?auto_825070 ) ) ( not ( = ?auto_825064 ?auto_825071 ) ) ( not ( = ?auto_825064 ?auto_825072 ) ) ( not ( = ?auto_825064 ?auto_825073 ) ) ( not ( = ?auto_825064 ?auto_825074 ) ) ( not ( = ?auto_825064 ?auto_825075 ) ) ( not ( = ?auto_825065 ?auto_825066 ) ) ( not ( = ?auto_825065 ?auto_825067 ) ) ( not ( = ?auto_825065 ?auto_825068 ) ) ( not ( = ?auto_825065 ?auto_825069 ) ) ( not ( = ?auto_825065 ?auto_825070 ) ) ( not ( = ?auto_825065 ?auto_825071 ) ) ( not ( = ?auto_825065 ?auto_825072 ) ) ( not ( = ?auto_825065 ?auto_825073 ) ) ( not ( = ?auto_825065 ?auto_825074 ) ) ( not ( = ?auto_825065 ?auto_825075 ) ) ( not ( = ?auto_825066 ?auto_825067 ) ) ( not ( = ?auto_825066 ?auto_825068 ) ) ( not ( = ?auto_825066 ?auto_825069 ) ) ( not ( = ?auto_825066 ?auto_825070 ) ) ( not ( = ?auto_825066 ?auto_825071 ) ) ( not ( = ?auto_825066 ?auto_825072 ) ) ( not ( = ?auto_825066 ?auto_825073 ) ) ( not ( = ?auto_825066 ?auto_825074 ) ) ( not ( = ?auto_825066 ?auto_825075 ) ) ( not ( = ?auto_825067 ?auto_825068 ) ) ( not ( = ?auto_825067 ?auto_825069 ) ) ( not ( = ?auto_825067 ?auto_825070 ) ) ( not ( = ?auto_825067 ?auto_825071 ) ) ( not ( = ?auto_825067 ?auto_825072 ) ) ( not ( = ?auto_825067 ?auto_825073 ) ) ( not ( = ?auto_825067 ?auto_825074 ) ) ( not ( = ?auto_825067 ?auto_825075 ) ) ( not ( = ?auto_825068 ?auto_825069 ) ) ( not ( = ?auto_825068 ?auto_825070 ) ) ( not ( = ?auto_825068 ?auto_825071 ) ) ( not ( = ?auto_825068 ?auto_825072 ) ) ( not ( = ?auto_825068 ?auto_825073 ) ) ( not ( = ?auto_825068 ?auto_825074 ) ) ( not ( = ?auto_825068 ?auto_825075 ) ) ( not ( = ?auto_825069 ?auto_825070 ) ) ( not ( = ?auto_825069 ?auto_825071 ) ) ( not ( = ?auto_825069 ?auto_825072 ) ) ( not ( = ?auto_825069 ?auto_825073 ) ) ( not ( = ?auto_825069 ?auto_825074 ) ) ( not ( = ?auto_825069 ?auto_825075 ) ) ( not ( = ?auto_825070 ?auto_825071 ) ) ( not ( = ?auto_825070 ?auto_825072 ) ) ( not ( = ?auto_825070 ?auto_825073 ) ) ( not ( = ?auto_825070 ?auto_825074 ) ) ( not ( = ?auto_825070 ?auto_825075 ) ) ( not ( = ?auto_825071 ?auto_825072 ) ) ( not ( = ?auto_825071 ?auto_825073 ) ) ( not ( = ?auto_825071 ?auto_825074 ) ) ( not ( = ?auto_825071 ?auto_825075 ) ) ( not ( = ?auto_825072 ?auto_825073 ) ) ( not ( = ?auto_825072 ?auto_825074 ) ) ( not ( = ?auto_825072 ?auto_825075 ) ) ( not ( = ?auto_825073 ?auto_825074 ) ) ( not ( = ?auto_825073 ?auto_825075 ) ) ( not ( = ?auto_825074 ?auto_825075 ) ) ( ON ?auto_825073 ?auto_825074 ) ( ON ?auto_825072 ?auto_825073 ) ( ON ?auto_825071 ?auto_825072 ) ( ON ?auto_825070 ?auto_825071 ) ( ON ?auto_825069 ?auto_825070 ) ( ON ?auto_825068 ?auto_825069 ) ( ON ?auto_825067 ?auto_825068 ) ( ON ?auto_825066 ?auto_825067 ) ( ON ?auto_825065 ?auto_825066 ) ( ON ?auto_825064 ?auto_825065 ) ( ON ?auto_825063 ?auto_825064 ) ( ON ?auto_825062 ?auto_825063 ) ( ON ?auto_825061 ?auto_825062 ) ( ON ?auto_825060 ?auto_825061 ) ( ON ?auto_825059 ?auto_825060 ) ( CLEAR ?auto_825059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_825059 )
      ( MAKE-16PILE ?auto_825059 ?auto_825060 ?auto_825061 ?auto_825062 ?auto_825063 ?auto_825064 ?auto_825065 ?auto_825066 ?auto_825067 ?auto_825068 ?auto_825069 ?auto_825070 ?auto_825071 ?auto_825072 ?auto_825073 ?auto_825074 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_825126 - BLOCK
      ?auto_825127 - BLOCK
      ?auto_825128 - BLOCK
      ?auto_825129 - BLOCK
      ?auto_825130 - BLOCK
      ?auto_825131 - BLOCK
      ?auto_825132 - BLOCK
      ?auto_825133 - BLOCK
      ?auto_825134 - BLOCK
      ?auto_825135 - BLOCK
      ?auto_825136 - BLOCK
      ?auto_825137 - BLOCK
      ?auto_825138 - BLOCK
      ?auto_825139 - BLOCK
      ?auto_825140 - BLOCK
      ?auto_825141 - BLOCK
      ?auto_825142 - BLOCK
    )
    :vars
    (
      ?auto_825143 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_825141 ) ( ON ?auto_825142 ?auto_825143 ) ( CLEAR ?auto_825142 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_825126 ) ( ON ?auto_825127 ?auto_825126 ) ( ON ?auto_825128 ?auto_825127 ) ( ON ?auto_825129 ?auto_825128 ) ( ON ?auto_825130 ?auto_825129 ) ( ON ?auto_825131 ?auto_825130 ) ( ON ?auto_825132 ?auto_825131 ) ( ON ?auto_825133 ?auto_825132 ) ( ON ?auto_825134 ?auto_825133 ) ( ON ?auto_825135 ?auto_825134 ) ( ON ?auto_825136 ?auto_825135 ) ( ON ?auto_825137 ?auto_825136 ) ( ON ?auto_825138 ?auto_825137 ) ( ON ?auto_825139 ?auto_825138 ) ( ON ?auto_825140 ?auto_825139 ) ( ON ?auto_825141 ?auto_825140 ) ( not ( = ?auto_825126 ?auto_825127 ) ) ( not ( = ?auto_825126 ?auto_825128 ) ) ( not ( = ?auto_825126 ?auto_825129 ) ) ( not ( = ?auto_825126 ?auto_825130 ) ) ( not ( = ?auto_825126 ?auto_825131 ) ) ( not ( = ?auto_825126 ?auto_825132 ) ) ( not ( = ?auto_825126 ?auto_825133 ) ) ( not ( = ?auto_825126 ?auto_825134 ) ) ( not ( = ?auto_825126 ?auto_825135 ) ) ( not ( = ?auto_825126 ?auto_825136 ) ) ( not ( = ?auto_825126 ?auto_825137 ) ) ( not ( = ?auto_825126 ?auto_825138 ) ) ( not ( = ?auto_825126 ?auto_825139 ) ) ( not ( = ?auto_825126 ?auto_825140 ) ) ( not ( = ?auto_825126 ?auto_825141 ) ) ( not ( = ?auto_825126 ?auto_825142 ) ) ( not ( = ?auto_825126 ?auto_825143 ) ) ( not ( = ?auto_825127 ?auto_825128 ) ) ( not ( = ?auto_825127 ?auto_825129 ) ) ( not ( = ?auto_825127 ?auto_825130 ) ) ( not ( = ?auto_825127 ?auto_825131 ) ) ( not ( = ?auto_825127 ?auto_825132 ) ) ( not ( = ?auto_825127 ?auto_825133 ) ) ( not ( = ?auto_825127 ?auto_825134 ) ) ( not ( = ?auto_825127 ?auto_825135 ) ) ( not ( = ?auto_825127 ?auto_825136 ) ) ( not ( = ?auto_825127 ?auto_825137 ) ) ( not ( = ?auto_825127 ?auto_825138 ) ) ( not ( = ?auto_825127 ?auto_825139 ) ) ( not ( = ?auto_825127 ?auto_825140 ) ) ( not ( = ?auto_825127 ?auto_825141 ) ) ( not ( = ?auto_825127 ?auto_825142 ) ) ( not ( = ?auto_825127 ?auto_825143 ) ) ( not ( = ?auto_825128 ?auto_825129 ) ) ( not ( = ?auto_825128 ?auto_825130 ) ) ( not ( = ?auto_825128 ?auto_825131 ) ) ( not ( = ?auto_825128 ?auto_825132 ) ) ( not ( = ?auto_825128 ?auto_825133 ) ) ( not ( = ?auto_825128 ?auto_825134 ) ) ( not ( = ?auto_825128 ?auto_825135 ) ) ( not ( = ?auto_825128 ?auto_825136 ) ) ( not ( = ?auto_825128 ?auto_825137 ) ) ( not ( = ?auto_825128 ?auto_825138 ) ) ( not ( = ?auto_825128 ?auto_825139 ) ) ( not ( = ?auto_825128 ?auto_825140 ) ) ( not ( = ?auto_825128 ?auto_825141 ) ) ( not ( = ?auto_825128 ?auto_825142 ) ) ( not ( = ?auto_825128 ?auto_825143 ) ) ( not ( = ?auto_825129 ?auto_825130 ) ) ( not ( = ?auto_825129 ?auto_825131 ) ) ( not ( = ?auto_825129 ?auto_825132 ) ) ( not ( = ?auto_825129 ?auto_825133 ) ) ( not ( = ?auto_825129 ?auto_825134 ) ) ( not ( = ?auto_825129 ?auto_825135 ) ) ( not ( = ?auto_825129 ?auto_825136 ) ) ( not ( = ?auto_825129 ?auto_825137 ) ) ( not ( = ?auto_825129 ?auto_825138 ) ) ( not ( = ?auto_825129 ?auto_825139 ) ) ( not ( = ?auto_825129 ?auto_825140 ) ) ( not ( = ?auto_825129 ?auto_825141 ) ) ( not ( = ?auto_825129 ?auto_825142 ) ) ( not ( = ?auto_825129 ?auto_825143 ) ) ( not ( = ?auto_825130 ?auto_825131 ) ) ( not ( = ?auto_825130 ?auto_825132 ) ) ( not ( = ?auto_825130 ?auto_825133 ) ) ( not ( = ?auto_825130 ?auto_825134 ) ) ( not ( = ?auto_825130 ?auto_825135 ) ) ( not ( = ?auto_825130 ?auto_825136 ) ) ( not ( = ?auto_825130 ?auto_825137 ) ) ( not ( = ?auto_825130 ?auto_825138 ) ) ( not ( = ?auto_825130 ?auto_825139 ) ) ( not ( = ?auto_825130 ?auto_825140 ) ) ( not ( = ?auto_825130 ?auto_825141 ) ) ( not ( = ?auto_825130 ?auto_825142 ) ) ( not ( = ?auto_825130 ?auto_825143 ) ) ( not ( = ?auto_825131 ?auto_825132 ) ) ( not ( = ?auto_825131 ?auto_825133 ) ) ( not ( = ?auto_825131 ?auto_825134 ) ) ( not ( = ?auto_825131 ?auto_825135 ) ) ( not ( = ?auto_825131 ?auto_825136 ) ) ( not ( = ?auto_825131 ?auto_825137 ) ) ( not ( = ?auto_825131 ?auto_825138 ) ) ( not ( = ?auto_825131 ?auto_825139 ) ) ( not ( = ?auto_825131 ?auto_825140 ) ) ( not ( = ?auto_825131 ?auto_825141 ) ) ( not ( = ?auto_825131 ?auto_825142 ) ) ( not ( = ?auto_825131 ?auto_825143 ) ) ( not ( = ?auto_825132 ?auto_825133 ) ) ( not ( = ?auto_825132 ?auto_825134 ) ) ( not ( = ?auto_825132 ?auto_825135 ) ) ( not ( = ?auto_825132 ?auto_825136 ) ) ( not ( = ?auto_825132 ?auto_825137 ) ) ( not ( = ?auto_825132 ?auto_825138 ) ) ( not ( = ?auto_825132 ?auto_825139 ) ) ( not ( = ?auto_825132 ?auto_825140 ) ) ( not ( = ?auto_825132 ?auto_825141 ) ) ( not ( = ?auto_825132 ?auto_825142 ) ) ( not ( = ?auto_825132 ?auto_825143 ) ) ( not ( = ?auto_825133 ?auto_825134 ) ) ( not ( = ?auto_825133 ?auto_825135 ) ) ( not ( = ?auto_825133 ?auto_825136 ) ) ( not ( = ?auto_825133 ?auto_825137 ) ) ( not ( = ?auto_825133 ?auto_825138 ) ) ( not ( = ?auto_825133 ?auto_825139 ) ) ( not ( = ?auto_825133 ?auto_825140 ) ) ( not ( = ?auto_825133 ?auto_825141 ) ) ( not ( = ?auto_825133 ?auto_825142 ) ) ( not ( = ?auto_825133 ?auto_825143 ) ) ( not ( = ?auto_825134 ?auto_825135 ) ) ( not ( = ?auto_825134 ?auto_825136 ) ) ( not ( = ?auto_825134 ?auto_825137 ) ) ( not ( = ?auto_825134 ?auto_825138 ) ) ( not ( = ?auto_825134 ?auto_825139 ) ) ( not ( = ?auto_825134 ?auto_825140 ) ) ( not ( = ?auto_825134 ?auto_825141 ) ) ( not ( = ?auto_825134 ?auto_825142 ) ) ( not ( = ?auto_825134 ?auto_825143 ) ) ( not ( = ?auto_825135 ?auto_825136 ) ) ( not ( = ?auto_825135 ?auto_825137 ) ) ( not ( = ?auto_825135 ?auto_825138 ) ) ( not ( = ?auto_825135 ?auto_825139 ) ) ( not ( = ?auto_825135 ?auto_825140 ) ) ( not ( = ?auto_825135 ?auto_825141 ) ) ( not ( = ?auto_825135 ?auto_825142 ) ) ( not ( = ?auto_825135 ?auto_825143 ) ) ( not ( = ?auto_825136 ?auto_825137 ) ) ( not ( = ?auto_825136 ?auto_825138 ) ) ( not ( = ?auto_825136 ?auto_825139 ) ) ( not ( = ?auto_825136 ?auto_825140 ) ) ( not ( = ?auto_825136 ?auto_825141 ) ) ( not ( = ?auto_825136 ?auto_825142 ) ) ( not ( = ?auto_825136 ?auto_825143 ) ) ( not ( = ?auto_825137 ?auto_825138 ) ) ( not ( = ?auto_825137 ?auto_825139 ) ) ( not ( = ?auto_825137 ?auto_825140 ) ) ( not ( = ?auto_825137 ?auto_825141 ) ) ( not ( = ?auto_825137 ?auto_825142 ) ) ( not ( = ?auto_825137 ?auto_825143 ) ) ( not ( = ?auto_825138 ?auto_825139 ) ) ( not ( = ?auto_825138 ?auto_825140 ) ) ( not ( = ?auto_825138 ?auto_825141 ) ) ( not ( = ?auto_825138 ?auto_825142 ) ) ( not ( = ?auto_825138 ?auto_825143 ) ) ( not ( = ?auto_825139 ?auto_825140 ) ) ( not ( = ?auto_825139 ?auto_825141 ) ) ( not ( = ?auto_825139 ?auto_825142 ) ) ( not ( = ?auto_825139 ?auto_825143 ) ) ( not ( = ?auto_825140 ?auto_825141 ) ) ( not ( = ?auto_825140 ?auto_825142 ) ) ( not ( = ?auto_825140 ?auto_825143 ) ) ( not ( = ?auto_825141 ?auto_825142 ) ) ( not ( = ?auto_825141 ?auto_825143 ) ) ( not ( = ?auto_825142 ?auto_825143 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_825142 ?auto_825143 )
      ( !STACK ?auto_825142 ?auto_825141 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_825196 - BLOCK
      ?auto_825197 - BLOCK
      ?auto_825198 - BLOCK
      ?auto_825199 - BLOCK
      ?auto_825200 - BLOCK
      ?auto_825201 - BLOCK
      ?auto_825202 - BLOCK
      ?auto_825203 - BLOCK
      ?auto_825204 - BLOCK
      ?auto_825205 - BLOCK
      ?auto_825206 - BLOCK
      ?auto_825207 - BLOCK
      ?auto_825208 - BLOCK
      ?auto_825209 - BLOCK
      ?auto_825210 - BLOCK
      ?auto_825211 - BLOCK
      ?auto_825212 - BLOCK
    )
    :vars
    (
      ?auto_825213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825212 ?auto_825213 ) ( ON-TABLE ?auto_825196 ) ( ON ?auto_825197 ?auto_825196 ) ( ON ?auto_825198 ?auto_825197 ) ( ON ?auto_825199 ?auto_825198 ) ( ON ?auto_825200 ?auto_825199 ) ( ON ?auto_825201 ?auto_825200 ) ( ON ?auto_825202 ?auto_825201 ) ( ON ?auto_825203 ?auto_825202 ) ( ON ?auto_825204 ?auto_825203 ) ( ON ?auto_825205 ?auto_825204 ) ( ON ?auto_825206 ?auto_825205 ) ( ON ?auto_825207 ?auto_825206 ) ( ON ?auto_825208 ?auto_825207 ) ( ON ?auto_825209 ?auto_825208 ) ( ON ?auto_825210 ?auto_825209 ) ( not ( = ?auto_825196 ?auto_825197 ) ) ( not ( = ?auto_825196 ?auto_825198 ) ) ( not ( = ?auto_825196 ?auto_825199 ) ) ( not ( = ?auto_825196 ?auto_825200 ) ) ( not ( = ?auto_825196 ?auto_825201 ) ) ( not ( = ?auto_825196 ?auto_825202 ) ) ( not ( = ?auto_825196 ?auto_825203 ) ) ( not ( = ?auto_825196 ?auto_825204 ) ) ( not ( = ?auto_825196 ?auto_825205 ) ) ( not ( = ?auto_825196 ?auto_825206 ) ) ( not ( = ?auto_825196 ?auto_825207 ) ) ( not ( = ?auto_825196 ?auto_825208 ) ) ( not ( = ?auto_825196 ?auto_825209 ) ) ( not ( = ?auto_825196 ?auto_825210 ) ) ( not ( = ?auto_825196 ?auto_825211 ) ) ( not ( = ?auto_825196 ?auto_825212 ) ) ( not ( = ?auto_825196 ?auto_825213 ) ) ( not ( = ?auto_825197 ?auto_825198 ) ) ( not ( = ?auto_825197 ?auto_825199 ) ) ( not ( = ?auto_825197 ?auto_825200 ) ) ( not ( = ?auto_825197 ?auto_825201 ) ) ( not ( = ?auto_825197 ?auto_825202 ) ) ( not ( = ?auto_825197 ?auto_825203 ) ) ( not ( = ?auto_825197 ?auto_825204 ) ) ( not ( = ?auto_825197 ?auto_825205 ) ) ( not ( = ?auto_825197 ?auto_825206 ) ) ( not ( = ?auto_825197 ?auto_825207 ) ) ( not ( = ?auto_825197 ?auto_825208 ) ) ( not ( = ?auto_825197 ?auto_825209 ) ) ( not ( = ?auto_825197 ?auto_825210 ) ) ( not ( = ?auto_825197 ?auto_825211 ) ) ( not ( = ?auto_825197 ?auto_825212 ) ) ( not ( = ?auto_825197 ?auto_825213 ) ) ( not ( = ?auto_825198 ?auto_825199 ) ) ( not ( = ?auto_825198 ?auto_825200 ) ) ( not ( = ?auto_825198 ?auto_825201 ) ) ( not ( = ?auto_825198 ?auto_825202 ) ) ( not ( = ?auto_825198 ?auto_825203 ) ) ( not ( = ?auto_825198 ?auto_825204 ) ) ( not ( = ?auto_825198 ?auto_825205 ) ) ( not ( = ?auto_825198 ?auto_825206 ) ) ( not ( = ?auto_825198 ?auto_825207 ) ) ( not ( = ?auto_825198 ?auto_825208 ) ) ( not ( = ?auto_825198 ?auto_825209 ) ) ( not ( = ?auto_825198 ?auto_825210 ) ) ( not ( = ?auto_825198 ?auto_825211 ) ) ( not ( = ?auto_825198 ?auto_825212 ) ) ( not ( = ?auto_825198 ?auto_825213 ) ) ( not ( = ?auto_825199 ?auto_825200 ) ) ( not ( = ?auto_825199 ?auto_825201 ) ) ( not ( = ?auto_825199 ?auto_825202 ) ) ( not ( = ?auto_825199 ?auto_825203 ) ) ( not ( = ?auto_825199 ?auto_825204 ) ) ( not ( = ?auto_825199 ?auto_825205 ) ) ( not ( = ?auto_825199 ?auto_825206 ) ) ( not ( = ?auto_825199 ?auto_825207 ) ) ( not ( = ?auto_825199 ?auto_825208 ) ) ( not ( = ?auto_825199 ?auto_825209 ) ) ( not ( = ?auto_825199 ?auto_825210 ) ) ( not ( = ?auto_825199 ?auto_825211 ) ) ( not ( = ?auto_825199 ?auto_825212 ) ) ( not ( = ?auto_825199 ?auto_825213 ) ) ( not ( = ?auto_825200 ?auto_825201 ) ) ( not ( = ?auto_825200 ?auto_825202 ) ) ( not ( = ?auto_825200 ?auto_825203 ) ) ( not ( = ?auto_825200 ?auto_825204 ) ) ( not ( = ?auto_825200 ?auto_825205 ) ) ( not ( = ?auto_825200 ?auto_825206 ) ) ( not ( = ?auto_825200 ?auto_825207 ) ) ( not ( = ?auto_825200 ?auto_825208 ) ) ( not ( = ?auto_825200 ?auto_825209 ) ) ( not ( = ?auto_825200 ?auto_825210 ) ) ( not ( = ?auto_825200 ?auto_825211 ) ) ( not ( = ?auto_825200 ?auto_825212 ) ) ( not ( = ?auto_825200 ?auto_825213 ) ) ( not ( = ?auto_825201 ?auto_825202 ) ) ( not ( = ?auto_825201 ?auto_825203 ) ) ( not ( = ?auto_825201 ?auto_825204 ) ) ( not ( = ?auto_825201 ?auto_825205 ) ) ( not ( = ?auto_825201 ?auto_825206 ) ) ( not ( = ?auto_825201 ?auto_825207 ) ) ( not ( = ?auto_825201 ?auto_825208 ) ) ( not ( = ?auto_825201 ?auto_825209 ) ) ( not ( = ?auto_825201 ?auto_825210 ) ) ( not ( = ?auto_825201 ?auto_825211 ) ) ( not ( = ?auto_825201 ?auto_825212 ) ) ( not ( = ?auto_825201 ?auto_825213 ) ) ( not ( = ?auto_825202 ?auto_825203 ) ) ( not ( = ?auto_825202 ?auto_825204 ) ) ( not ( = ?auto_825202 ?auto_825205 ) ) ( not ( = ?auto_825202 ?auto_825206 ) ) ( not ( = ?auto_825202 ?auto_825207 ) ) ( not ( = ?auto_825202 ?auto_825208 ) ) ( not ( = ?auto_825202 ?auto_825209 ) ) ( not ( = ?auto_825202 ?auto_825210 ) ) ( not ( = ?auto_825202 ?auto_825211 ) ) ( not ( = ?auto_825202 ?auto_825212 ) ) ( not ( = ?auto_825202 ?auto_825213 ) ) ( not ( = ?auto_825203 ?auto_825204 ) ) ( not ( = ?auto_825203 ?auto_825205 ) ) ( not ( = ?auto_825203 ?auto_825206 ) ) ( not ( = ?auto_825203 ?auto_825207 ) ) ( not ( = ?auto_825203 ?auto_825208 ) ) ( not ( = ?auto_825203 ?auto_825209 ) ) ( not ( = ?auto_825203 ?auto_825210 ) ) ( not ( = ?auto_825203 ?auto_825211 ) ) ( not ( = ?auto_825203 ?auto_825212 ) ) ( not ( = ?auto_825203 ?auto_825213 ) ) ( not ( = ?auto_825204 ?auto_825205 ) ) ( not ( = ?auto_825204 ?auto_825206 ) ) ( not ( = ?auto_825204 ?auto_825207 ) ) ( not ( = ?auto_825204 ?auto_825208 ) ) ( not ( = ?auto_825204 ?auto_825209 ) ) ( not ( = ?auto_825204 ?auto_825210 ) ) ( not ( = ?auto_825204 ?auto_825211 ) ) ( not ( = ?auto_825204 ?auto_825212 ) ) ( not ( = ?auto_825204 ?auto_825213 ) ) ( not ( = ?auto_825205 ?auto_825206 ) ) ( not ( = ?auto_825205 ?auto_825207 ) ) ( not ( = ?auto_825205 ?auto_825208 ) ) ( not ( = ?auto_825205 ?auto_825209 ) ) ( not ( = ?auto_825205 ?auto_825210 ) ) ( not ( = ?auto_825205 ?auto_825211 ) ) ( not ( = ?auto_825205 ?auto_825212 ) ) ( not ( = ?auto_825205 ?auto_825213 ) ) ( not ( = ?auto_825206 ?auto_825207 ) ) ( not ( = ?auto_825206 ?auto_825208 ) ) ( not ( = ?auto_825206 ?auto_825209 ) ) ( not ( = ?auto_825206 ?auto_825210 ) ) ( not ( = ?auto_825206 ?auto_825211 ) ) ( not ( = ?auto_825206 ?auto_825212 ) ) ( not ( = ?auto_825206 ?auto_825213 ) ) ( not ( = ?auto_825207 ?auto_825208 ) ) ( not ( = ?auto_825207 ?auto_825209 ) ) ( not ( = ?auto_825207 ?auto_825210 ) ) ( not ( = ?auto_825207 ?auto_825211 ) ) ( not ( = ?auto_825207 ?auto_825212 ) ) ( not ( = ?auto_825207 ?auto_825213 ) ) ( not ( = ?auto_825208 ?auto_825209 ) ) ( not ( = ?auto_825208 ?auto_825210 ) ) ( not ( = ?auto_825208 ?auto_825211 ) ) ( not ( = ?auto_825208 ?auto_825212 ) ) ( not ( = ?auto_825208 ?auto_825213 ) ) ( not ( = ?auto_825209 ?auto_825210 ) ) ( not ( = ?auto_825209 ?auto_825211 ) ) ( not ( = ?auto_825209 ?auto_825212 ) ) ( not ( = ?auto_825209 ?auto_825213 ) ) ( not ( = ?auto_825210 ?auto_825211 ) ) ( not ( = ?auto_825210 ?auto_825212 ) ) ( not ( = ?auto_825210 ?auto_825213 ) ) ( not ( = ?auto_825211 ?auto_825212 ) ) ( not ( = ?auto_825211 ?auto_825213 ) ) ( not ( = ?auto_825212 ?auto_825213 ) ) ( CLEAR ?auto_825210 ) ( ON ?auto_825211 ?auto_825212 ) ( CLEAR ?auto_825211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_825196 ?auto_825197 ?auto_825198 ?auto_825199 ?auto_825200 ?auto_825201 ?auto_825202 ?auto_825203 ?auto_825204 ?auto_825205 ?auto_825206 ?auto_825207 ?auto_825208 ?auto_825209 ?auto_825210 ?auto_825211 )
      ( MAKE-17PILE ?auto_825196 ?auto_825197 ?auto_825198 ?auto_825199 ?auto_825200 ?auto_825201 ?auto_825202 ?auto_825203 ?auto_825204 ?auto_825205 ?auto_825206 ?auto_825207 ?auto_825208 ?auto_825209 ?auto_825210 ?auto_825211 ?auto_825212 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_825266 - BLOCK
      ?auto_825267 - BLOCK
      ?auto_825268 - BLOCK
      ?auto_825269 - BLOCK
      ?auto_825270 - BLOCK
      ?auto_825271 - BLOCK
      ?auto_825272 - BLOCK
      ?auto_825273 - BLOCK
      ?auto_825274 - BLOCK
      ?auto_825275 - BLOCK
      ?auto_825276 - BLOCK
      ?auto_825277 - BLOCK
      ?auto_825278 - BLOCK
      ?auto_825279 - BLOCK
      ?auto_825280 - BLOCK
      ?auto_825281 - BLOCK
      ?auto_825282 - BLOCK
    )
    :vars
    (
      ?auto_825283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825282 ?auto_825283 ) ( ON-TABLE ?auto_825266 ) ( ON ?auto_825267 ?auto_825266 ) ( ON ?auto_825268 ?auto_825267 ) ( ON ?auto_825269 ?auto_825268 ) ( ON ?auto_825270 ?auto_825269 ) ( ON ?auto_825271 ?auto_825270 ) ( ON ?auto_825272 ?auto_825271 ) ( ON ?auto_825273 ?auto_825272 ) ( ON ?auto_825274 ?auto_825273 ) ( ON ?auto_825275 ?auto_825274 ) ( ON ?auto_825276 ?auto_825275 ) ( ON ?auto_825277 ?auto_825276 ) ( ON ?auto_825278 ?auto_825277 ) ( ON ?auto_825279 ?auto_825278 ) ( not ( = ?auto_825266 ?auto_825267 ) ) ( not ( = ?auto_825266 ?auto_825268 ) ) ( not ( = ?auto_825266 ?auto_825269 ) ) ( not ( = ?auto_825266 ?auto_825270 ) ) ( not ( = ?auto_825266 ?auto_825271 ) ) ( not ( = ?auto_825266 ?auto_825272 ) ) ( not ( = ?auto_825266 ?auto_825273 ) ) ( not ( = ?auto_825266 ?auto_825274 ) ) ( not ( = ?auto_825266 ?auto_825275 ) ) ( not ( = ?auto_825266 ?auto_825276 ) ) ( not ( = ?auto_825266 ?auto_825277 ) ) ( not ( = ?auto_825266 ?auto_825278 ) ) ( not ( = ?auto_825266 ?auto_825279 ) ) ( not ( = ?auto_825266 ?auto_825280 ) ) ( not ( = ?auto_825266 ?auto_825281 ) ) ( not ( = ?auto_825266 ?auto_825282 ) ) ( not ( = ?auto_825266 ?auto_825283 ) ) ( not ( = ?auto_825267 ?auto_825268 ) ) ( not ( = ?auto_825267 ?auto_825269 ) ) ( not ( = ?auto_825267 ?auto_825270 ) ) ( not ( = ?auto_825267 ?auto_825271 ) ) ( not ( = ?auto_825267 ?auto_825272 ) ) ( not ( = ?auto_825267 ?auto_825273 ) ) ( not ( = ?auto_825267 ?auto_825274 ) ) ( not ( = ?auto_825267 ?auto_825275 ) ) ( not ( = ?auto_825267 ?auto_825276 ) ) ( not ( = ?auto_825267 ?auto_825277 ) ) ( not ( = ?auto_825267 ?auto_825278 ) ) ( not ( = ?auto_825267 ?auto_825279 ) ) ( not ( = ?auto_825267 ?auto_825280 ) ) ( not ( = ?auto_825267 ?auto_825281 ) ) ( not ( = ?auto_825267 ?auto_825282 ) ) ( not ( = ?auto_825267 ?auto_825283 ) ) ( not ( = ?auto_825268 ?auto_825269 ) ) ( not ( = ?auto_825268 ?auto_825270 ) ) ( not ( = ?auto_825268 ?auto_825271 ) ) ( not ( = ?auto_825268 ?auto_825272 ) ) ( not ( = ?auto_825268 ?auto_825273 ) ) ( not ( = ?auto_825268 ?auto_825274 ) ) ( not ( = ?auto_825268 ?auto_825275 ) ) ( not ( = ?auto_825268 ?auto_825276 ) ) ( not ( = ?auto_825268 ?auto_825277 ) ) ( not ( = ?auto_825268 ?auto_825278 ) ) ( not ( = ?auto_825268 ?auto_825279 ) ) ( not ( = ?auto_825268 ?auto_825280 ) ) ( not ( = ?auto_825268 ?auto_825281 ) ) ( not ( = ?auto_825268 ?auto_825282 ) ) ( not ( = ?auto_825268 ?auto_825283 ) ) ( not ( = ?auto_825269 ?auto_825270 ) ) ( not ( = ?auto_825269 ?auto_825271 ) ) ( not ( = ?auto_825269 ?auto_825272 ) ) ( not ( = ?auto_825269 ?auto_825273 ) ) ( not ( = ?auto_825269 ?auto_825274 ) ) ( not ( = ?auto_825269 ?auto_825275 ) ) ( not ( = ?auto_825269 ?auto_825276 ) ) ( not ( = ?auto_825269 ?auto_825277 ) ) ( not ( = ?auto_825269 ?auto_825278 ) ) ( not ( = ?auto_825269 ?auto_825279 ) ) ( not ( = ?auto_825269 ?auto_825280 ) ) ( not ( = ?auto_825269 ?auto_825281 ) ) ( not ( = ?auto_825269 ?auto_825282 ) ) ( not ( = ?auto_825269 ?auto_825283 ) ) ( not ( = ?auto_825270 ?auto_825271 ) ) ( not ( = ?auto_825270 ?auto_825272 ) ) ( not ( = ?auto_825270 ?auto_825273 ) ) ( not ( = ?auto_825270 ?auto_825274 ) ) ( not ( = ?auto_825270 ?auto_825275 ) ) ( not ( = ?auto_825270 ?auto_825276 ) ) ( not ( = ?auto_825270 ?auto_825277 ) ) ( not ( = ?auto_825270 ?auto_825278 ) ) ( not ( = ?auto_825270 ?auto_825279 ) ) ( not ( = ?auto_825270 ?auto_825280 ) ) ( not ( = ?auto_825270 ?auto_825281 ) ) ( not ( = ?auto_825270 ?auto_825282 ) ) ( not ( = ?auto_825270 ?auto_825283 ) ) ( not ( = ?auto_825271 ?auto_825272 ) ) ( not ( = ?auto_825271 ?auto_825273 ) ) ( not ( = ?auto_825271 ?auto_825274 ) ) ( not ( = ?auto_825271 ?auto_825275 ) ) ( not ( = ?auto_825271 ?auto_825276 ) ) ( not ( = ?auto_825271 ?auto_825277 ) ) ( not ( = ?auto_825271 ?auto_825278 ) ) ( not ( = ?auto_825271 ?auto_825279 ) ) ( not ( = ?auto_825271 ?auto_825280 ) ) ( not ( = ?auto_825271 ?auto_825281 ) ) ( not ( = ?auto_825271 ?auto_825282 ) ) ( not ( = ?auto_825271 ?auto_825283 ) ) ( not ( = ?auto_825272 ?auto_825273 ) ) ( not ( = ?auto_825272 ?auto_825274 ) ) ( not ( = ?auto_825272 ?auto_825275 ) ) ( not ( = ?auto_825272 ?auto_825276 ) ) ( not ( = ?auto_825272 ?auto_825277 ) ) ( not ( = ?auto_825272 ?auto_825278 ) ) ( not ( = ?auto_825272 ?auto_825279 ) ) ( not ( = ?auto_825272 ?auto_825280 ) ) ( not ( = ?auto_825272 ?auto_825281 ) ) ( not ( = ?auto_825272 ?auto_825282 ) ) ( not ( = ?auto_825272 ?auto_825283 ) ) ( not ( = ?auto_825273 ?auto_825274 ) ) ( not ( = ?auto_825273 ?auto_825275 ) ) ( not ( = ?auto_825273 ?auto_825276 ) ) ( not ( = ?auto_825273 ?auto_825277 ) ) ( not ( = ?auto_825273 ?auto_825278 ) ) ( not ( = ?auto_825273 ?auto_825279 ) ) ( not ( = ?auto_825273 ?auto_825280 ) ) ( not ( = ?auto_825273 ?auto_825281 ) ) ( not ( = ?auto_825273 ?auto_825282 ) ) ( not ( = ?auto_825273 ?auto_825283 ) ) ( not ( = ?auto_825274 ?auto_825275 ) ) ( not ( = ?auto_825274 ?auto_825276 ) ) ( not ( = ?auto_825274 ?auto_825277 ) ) ( not ( = ?auto_825274 ?auto_825278 ) ) ( not ( = ?auto_825274 ?auto_825279 ) ) ( not ( = ?auto_825274 ?auto_825280 ) ) ( not ( = ?auto_825274 ?auto_825281 ) ) ( not ( = ?auto_825274 ?auto_825282 ) ) ( not ( = ?auto_825274 ?auto_825283 ) ) ( not ( = ?auto_825275 ?auto_825276 ) ) ( not ( = ?auto_825275 ?auto_825277 ) ) ( not ( = ?auto_825275 ?auto_825278 ) ) ( not ( = ?auto_825275 ?auto_825279 ) ) ( not ( = ?auto_825275 ?auto_825280 ) ) ( not ( = ?auto_825275 ?auto_825281 ) ) ( not ( = ?auto_825275 ?auto_825282 ) ) ( not ( = ?auto_825275 ?auto_825283 ) ) ( not ( = ?auto_825276 ?auto_825277 ) ) ( not ( = ?auto_825276 ?auto_825278 ) ) ( not ( = ?auto_825276 ?auto_825279 ) ) ( not ( = ?auto_825276 ?auto_825280 ) ) ( not ( = ?auto_825276 ?auto_825281 ) ) ( not ( = ?auto_825276 ?auto_825282 ) ) ( not ( = ?auto_825276 ?auto_825283 ) ) ( not ( = ?auto_825277 ?auto_825278 ) ) ( not ( = ?auto_825277 ?auto_825279 ) ) ( not ( = ?auto_825277 ?auto_825280 ) ) ( not ( = ?auto_825277 ?auto_825281 ) ) ( not ( = ?auto_825277 ?auto_825282 ) ) ( not ( = ?auto_825277 ?auto_825283 ) ) ( not ( = ?auto_825278 ?auto_825279 ) ) ( not ( = ?auto_825278 ?auto_825280 ) ) ( not ( = ?auto_825278 ?auto_825281 ) ) ( not ( = ?auto_825278 ?auto_825282 ) ) ( not ( = ?auto_825278 ?auto_825283 ) ) ( not ( = ?auto_825279 ?auto_825280 ) ) ( not ( = ?auto_825279 ?auto_825281 ) ) ( not ( = ?auto_825279 ?auto_825282 ) ) ( not ( = ?auto_825279 ?auto_825283 ) ) ( not ( = ?auto_825280 ?auto_825281 ) ) ( not ( = ?auto_825280 ?auto_825282 ) ) ( not ( = ?auto_825280 ?auto_825283 ) ) ( not ( = ?auto_825281 ?auto_825282 ) ) ( not ( = ?auto_825281 ?auto_825283 ) ) ( not ( = ?auto_825282 ?auto_825283 ) ) ( ON ?auto_825281 ?auto_825282 ) ( CLEAR ?auto_825279 ) ( ON ?auto_825280 ?auto_825281 ) ( CLEAR ?auto_825280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_825266 ?auto_825267 ?auto_825268 ?auto_825269 ?auto_825270 ?auto_825271 ?auto_825272 ?auto_825273 ?auto_825274 ?auto_825275 ?auto_825276 ?auto_825277 ?auto_825278 ?auto_825279 ?auto_825280 )
      ( MAKE-17PILE ?auto_825266 ?auto_825267 ?auto_825268 ?auto_825269 ?auto_825270 ?auto_825271 ?auto_825272 ?auto_825273 ?auto_825274 ?auto_825275 ?auto_825276 ?auto_825277 ?auto_825278 ?auto_825279 ?auto_825280 ?auto_825281 ?auto_825282 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_825336 - BLOCK
      ?auto_825337 - BLOCK
      ?auto_825338 - BLOCK
      ?auto_825339 - BLOCK
      ?auto_825340 - BLOCK
      ?auto_825341 - BLOCK
      ?auto_825342 - BLOCK
      ?auto_825343 - BLOCK
      ?auto_825344 - BLOCK
      ?auto_825345 - BLOCK
      ?auto_825346 - BLOCK
      ?auto_825347 - BLOCK
      ?auto_825348 - BLOCK
      ?auto_825349 - BLOCK
      ?auto_825350 - BLOCK
      ?auto_825351 - BLOCK
      ?auto_825352 - BLOCK
    )
    :vars
    (
      ?auto_825353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825352 ?auto_825353 ) ( ON-TABLE ?auto_825336 ) ( ON ?auto_825337 ?auto_825336 ) ( ON ?auto_825338 ?auto_825337 ) ( ON ?auto_825339 ?auto_825338 ) ( ON ?auto_825340 ?auto_825339 ) ( ON ?auto_825341 ?auto_825340 ) ( ON ?auto_825342 ?auto_825341 ) ( ON ?auto_825343 ?auto_825342 ) ( ON ?auto_825344 ?auto_825343 ) ( ON ?auto_825345 ?auto_825344 ) ( ON ?auto_825346 ?auto_825345 ) ( ON ?auto_825347 ?auto_825346 ) ( ON ?auto_825348 ?auto_825347 ) ( not ( = ?auto_825336 ?auto_825337 ) ) ( not ( = ?auto_825336 ?auto_825338 ) ) ( not ( = ?auto_825336 ?auto_825339 ) ) ( not ( = ?auto_825336 ?auto_825340 ) ) ( not ( = ?auto_825336 ?auto_825341 ) ) ( not ( = ?auto_825336 ?auto_825342 ) ) ( not ( = ?auto_825336 ?auto_825343 ) ) ( not ( = ?auto_825336 ?auto_825344 ) ) ( not ( = ?auto_825336 ?auto_825345 ) ) ( not ( = ?auto_825336 ?auto_825346 ) ) ( not ( = ?auto_825336 ?auto_825347 ) ) ( not ( = ?auto_825336 ?auto_825348 ) ) ( not ( = ?auto_825336 ?auto_825349 ) ) ( not ( = ?auto_825336 ?auto_825350 ) ) ( not ( = ?auto_825336 ?auto_825351 ) ) ( not ( = ?auto_825336 ?auto_825352 ) ) ( not ( = ?auto_825336 ?auto_825353 ) ) ( not ( = ?auto_825337 ?auto_825338 ) ) ( not ( = ?auto_825337 ?auto_825339 ) ) ( not ( = ?auto_825337 ?auto_825340 ) ) ( not ( = ?auto_825337 ?auto_825341 ) ) ( not ( = ?auto_825337 ?auto_825342 ) ) ( not ( = ?auto_825337 ?auto_825343 ) ) ( not ( = ?auto_825337 ?auto_825344 ) ) ( not ( = ?auto_825337 ?auto_825345 ) ) ( not ( = ?auto_825337 ?auto_825346 ) ) ( not ( = ?auto_825337 ?auto_825347 ) ) ( not ( = ?auto_825337 ?auto_825348 ) ) ( not ( = ?auto_825337 ?auto_825349 ) ) ( not ( = ?auto_825337 ?auto_825350 ) ) ( not ( = ?auto_825337 ?auto_825351 ) ) ( not ( = ?auto_825337 ?auto_825352 ) ) ( not ( = ?auto_825337 ?auto_825353 ) ) ( not ( = ?auto_825338 ?auto_825339 ) ) ( not ( = ?auto_825338 ?auto_825340 ) ) ( not ( = ?auto_825338 ?auto_825341 ) ) ( not ( = ?auto_825338 ?auto_825342 ) ) ( not ( = ?auto_825338 ?auto_825343 ) ) ( not ( = ?auto_825338 ?auto_825344 ) ) ( not ( = ?auto_825338 ?auto_825345 ) ) ( not ( = ?auto_825338 ?auto_825346 ) ) ( not ( = ?auto_825338 ?auto_825347 ) ) ( not ( = ?auto_825338 ?auto_825348 ) ) ( not ( = ?auto_825338 ?auto_825349 ) ) ( not ( = ?auto_825338 ?auto_825350 ) ) ( not ( = ?auto_825338 ?auto_825351 ) ) ( not ( = ?auto_825338 ?auto_825352 ) ) ( not ( = ?auto_825338 ?auto_825353 ) ) ( not ( = ?auto_825339 ?auto_825340 ) ) ( not ( = ?auto_825339 ?auto_825341 ) ) ( not ( = ?auto_825339 ?auto_825342 ) ) ( not ( = ?auto_825339 ?auto_825343 ) ) ( not ( = ?auto_825339 ?auto_825344 ) ) ( not ( = ?auto_825339 ?auto_825345 ) ) ( not ( = ?auto_825339 ?auto_825346 ) ) ( not ( = ?auto_825339 ?auto_825347 ) ) ( not ( = ?auto_825339 ?auto_825348 ) ) ( not ( = ?auto_825339 ?auto_825349 ) ) ( not ( = ?auto_825339 ?auto_825350 ) ) ( not ( = ?auto_825339 ?auto_825351 ) ) ( not ( = ?auto_825339 ?auto_825352 ) ) ( not ( = ?auto_825339 ?auto_825353 ) ) ( not ( = ?auto_825340 ?auto_825341 ) ) ( not ( = ?auto_825340 ?auto_825342 ) ) ( not ( = ?auto_825340 ?auto_825343 ) ) ( not ( = ?auto_825340 ?auto_825344 ) ) ( not ( = ?auto_825340 ?auto_825345 ) ) ( not ( = ?auto_825340 ?auto_825346 ) ) ( not ( = ?auto_825340 ?auto_825347 ) ) ( not ( = ?auto_825340 ?auto_825348 ) ) ( not ( = ?auto_825340 ?auto_825349 ) ) ( not ( = ?auto_825340 ?auto_825350 ) ) ( not ( = ?auto_825340 ?auto_825351 ) ) ( not ( = ?auto_825340 ?auto_825352 ) ) ( not ( = ?auto_825340 ?auto_825353 ) ) ( not ( = ?auto_825341 ?auto_825342 ) ) ( not ( = ?auto_825341 ?auto_825343 ) ) ( not ( = ?auto_825341 ?auto_825344 ) ) ( not ( = ?auto_825341 ?auto_825345 ) ) ( not ( = ?auto_825341 ?auto_825346 ) ) ( not ( = ?auto_825341 ?auto_825347 ) ) ( not ( = ?auto_825341 ?auto_825348 ) ) ( not ( = ?auto_825341 ?auto_825349 ) ) ( not ( = ?auto_825341 ?auto_825350 ) ) ( not ( = ?auto_825341 ?auto_825351 ) ) ( not ( = ?auto_825341 ?auto_825352 ) ) ( not ( = ?auto_825341 ?auto_825353 ) ) ( not ( = ?auto_825342 ?auto_825343 ) ) ( not ( = ?auto_825342 ?auto_825344 ) ) ( not ( = ?auto_825342 ?auto_825345 ) ) ( not ( = ?auto_825342 ?auto_825346 ) ) ( not ( = ?auto_825342 ?auto_825347 ) ) ( not ( = ?auto_825342 ?auto_825348 ) ) ( not ( = ?auto_825342 ?auto_825349 ) ) ( not ( = ?auto_825342 ?auto_825350 ) ) ( not ( = ?auto_825342 ?auto_825351 ) ) ( not ( = ?auto_825342 ?auto_825352 ) ) ( not ( = ?auto_825342 ?auto_825353 ) ) ( not ( = ?auto_825343 ?auto_825344 ) ) ( not ( = ?auto_825343 ?auto_825345 ) ) ( not ( = ?auto_825343 ?auto_825346 ) ) ( not ( = ?auto_825343 ?auto_825347 ) ) ( not ( = ?auto_825343 ?auto_825348 ) ) ( not ( = ?auto_825343 ?auto_825349 ) ) ( not ( = ?auto_825343 ?auto_825350 ) ) ( not ( = ?auto_825343 ?auto_825351 ) ) ( not ( = ?auto_825343 ?auto_825352 ) ) ( not ( = ?auto_825343 ?auto_825353 ) ) ( not ( = ?auto_825344 ?auto_825345 ) ) ( not ( = ?auto_825344 ?auto_825346 ) ) ( not ( = ?auto_825344 ?auto_825347 ) ) ( not ( = ?auto_825344 ?auto_825348 ) ) ( not ( = ?auto_825344 ?auto_825349 ) ) ( not ( = ?auto_825344 ?auto_825350 ) ) ( not ( = ?auto_825344 ?auto_825351 ) ) ( not ( = ?auto_825344 ?auto_825352 ) ) ( not ( = ?auto_825344 ?auto_825353 ) ) ( not ( = ?auto_825345 ?auto_825346 ) ) ( not ( = ?auto_825345 ?auto_825347 ) ) ( not ( = ?auto_825345 ?auto_825348 ) ) ( not ( = ?auto_825345 ?auto_825349 ) ) ( not ( = ?auto_825345 ?auto_825350 ) ) ( not ( = ?auto_825345 ?auto_825351 ) ) ( not ( = ?auto_825345 ?auto_825352 ) ) ( not ( = ?auto_825345 ?auto_825353 ) ) ( not ( = ?auto_825346 ?auto_825347 ) ) ( not ( = ?auto_825346 ?auto_825348 ) ) ( not ( = ?auto_825346 ?auto_825349 ) ) ( not ( = ?auto_825346 ?auto_825350 ) ) ( not ( = ?auto_825346 ?auto_825351 ) ) ( not ( = ?auto_825346 ?auto_825352 ) ) ( not ( = ?auto_825346 ?auto_825353 ) ) ( not ( = ?auto_825347 ?auto_825348 ) ) ( not ( = ?auto_825347 ?auto_825349 ) ) ( not ( = ?auto_825347 ?auto_825350 ) ) ( not ( = ?auto_825347 ?auto_825351 ) ) ( not ( = ?auto_825347 ?auto_825352 ) ) ( not ( = ?auto_825347 ?auto_825353 ) ) ( not ( = ?auto_825348 ?auto_825349 ) ) ( not ( = ?auto_825348 ?auto_825350 ) ) ( not ( = ?auto_825348 ?auto_825351 ) ) ( not ( = ?auto_825348 ?auto_825352 ) ) ( not ( = ?auto_825348 ?auto_825353 ) ) ( not ( = ?auto_825349 ?auto_825350 ) ) ( not ( = ?auto_825349 ?auto_825351 ) ) ( not ( = ?auto_825349 ?auto_825352 ) ) ( not ( = ?auto_825349 ?auto_825353 ) ) ( not ( = ?auto_825350 ?auto_825351 ) ) ( not ( = ?auto_825350 ?auto_825352 ) ) ( not ( = ?auto_825350 ?auto_825353 ) ) ( not ( = ?auto_825351 ?auto_825352 ) ) ( not ( = ?auto_825351 ?auto_825353 ) ) ( not ( = ?auto_825352 ?auto_825353 ) ) ( ON ?auto_825351 ?auto_825352 ) ( ON ?auto_825350 ?auto_825351 ) ( CLEAR ?auto_825348 ) ( ON ?auto_825349 ?auto_825350 ) ( CLEAR ?auto_825349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_825336 ?auto_825337 ?auto_825338 ?auto_825339 ?auto_825340 ?auto_825341 ?auto_825342 ?auto_825343 ?auto_825344 ?auto_825345 ?auto_825346 ?auto_825347 ?auto_825348 ?auto_825349 )
      ( MAKE-17PILE ?auto_825336 ?auto_825337 ?auto_825338 ?auto_825339 ?auto_825340 ?auto_825341 ?auto_825342 ?auto_825343 ?auto_825344 ?auto_825345 ?auto_825346 ?auto_825347 ?auto_825348 ?auto_825349 ?auto_825350 ?auto_825351 ?auto_825352 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_825406 - BLOCK
      ?auto_825407 - BLOCK
      ?auto_825408 - BLOCK
      ?auto_825409 - BLOCK
      ?auto_825410 - BLOCK
      ?auto_825411 - BLOCK
      ?auto_825412 - BLOCK
      ?auto_825413 - BLOCK
      ?auto_825414 - BLOCK
      ?auto_825415 - BLOCK
      ?auto_825416 - BLOCK
      ?auto_825417 - BLOCK
      ?auto_825418 - BLOCK
      ?auto_825419 - BLOCK
      ?auto_825420 - BLOCK
      ?auto_825421 - BLOCK
      ?auto_825422 - BLOCK
    )
    :vars
    (
      ?auto_825423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825422 ?auto_825423 ) ( ON-TABLE ?auto_825406 ) ( ON ?auto_825407 ?auto_825406 ) ( ON ?auto_825408 ?auto_825407 ) ( ON ?auto_825409 ?auto_825408 ) ( ON ?auto_825410 ?auto_825409 ) ( ON ?auto_825411 ?auto_825410 ) ( ON ?auto_825412 ?auto_825411 ) ( ON ?auto_825413 ?auto_825412 ) ( ON ?auto_825414 ?auto_825413 ) ( ON ?auto_825415 ?auto_825414 ) ( ON ?auto_825416 ?auto_825415 ) ( ON ?auto_825417 ?auto_825416 ) ( not ( = ?auto_825406 ?auto_825407 ) ) ( not ( = ?auto_825406 ?auto_825408 ) ) ( not ( = ?auto_825406 ?auto_825409 ) ) ( not ( = ?auto_825406 ?auto_825410 ) ) ( not ( = ?auto_825406 ?auto_825411 ) ) ( not ( = ?auto_825406 ?auto_825412 ) ) ( not ( = ?auto_825406 ?auto_825413 ) ) ( not ( = ?auto_825406 ?auto_825414 ) ) ( not ( = ?auto_825406 ?auto_825415 ) ) ( not ( = ?auto_825406 ?auto_825416 ) ) ( not ( = ?auto_825406 ?auto_825417 ) ) ( not ( = ?auto_825406 ?auto_825418 ) ) ( not ( = ?auto_825406 ?auto_825419 ) ) ( not ( = ?auto_825406 ?auto_825420 ) ) ( not ( = ?auto_825406 ?auto_825421 ) ) ( not ( = ?auto_825406 ?auto_825422 ) ) ( not ( = ?auto_825406 ?auto_825423 ) ) ( not ( = ?auto_825407 ?auto_825408 ) ) ( not ( = ?auto_825407 ?auto_825409 ) ) ( not ( = ?auto_825407 ?auto_825410 ) ) ( not ( = ?auto_825407 ?auto_825411 ) ) ( not ( = ?auto_825407 ?auto_825412 ) ) ( not ( = ?auto_825407 ?auto_825413 ) ) ( not ( = ?auto_825407 ?auto_825414 ) ) ( not ( = ?auto_825407 ?auto_825415 ) ) ( not ( = ?auto_825407 ?auto_825416 ) ) ( not ( = ?auto_825407 ?auto_825417 ) ) ( not ( = ?auto_825407 ?auto_825418 ) ) ( not ( = ?auto_825407 ?auto_825419 ) ) ( not ( = ?auto_825407 ?auto_825420 ) ) ( not ( = ?auto_825407 ?auto_825421 ) ) ( not ( = ?auto_825407 ?auto_825422 ) ) ( not ( = ?auto_825407 ?auto_825423 ) ) ( not ( = ?auto_825408 ?auto_825409 ) ) ( not ( = ?auto_825408 ?auto_825410 ) ) ( not ( = ?auto_825408 ?auto_825411 ) ) ( not ( = ?auto_825408 ?auto_825412 ) ) ( not ( = ?auto_825408 ?auto_825413 ) ) ( not ( = ?auto_825408 ?auto_825414 ) ) ( not ( = ?auto_825408 ?auto_825415 ) ) ( not ( = ?auto_825408 ?auto_825416 ) ) ( not ( = ?auto_825408 ?auto_825417 ) ) ( not ( = ?auto_825408 ?auto_825418 ) ) ( not ( = ?auto_825408 ?auto_825419 ) ) ( not ( = ?auto_825408 ?auto_825420 ) ) ( not ( = ?auto_825408 ?auto_825421 ) ) ( not ( = ?auto_825408 ?auto_825422 ) ) ( not ( = ?auto_825408 ?auto_825423 ) ) ( not ( = ?auto_825409 ?auto_825410 ) ) ( not ( = ?auto_825409 ?auto_825411 ) ) ( not ( = ?auto_825409 ?auto_825412 ) ) ( not ( = ?auto_825409 ?auto_825413 ) ) ( not ( = ?auto_825409 ?auto_825414 ) ) ( not ( = ?auto_825409 ?auto_825415 ) ) ( not ( = ?auto_825409 ?auto_825416 ) ) ( not ( = ?auto_825409 ?auto_825417 ) ) ( not ( = ?auto_825409 ?auto_825418 ) ) ( not ( = ?auto_825409 ?auto_825419 ) ) ( not ( = ?auto_825409 ?auto_825420 ) ) ( not ( = ?auto_825409 ?auto_825421 ) ) ( not ( = ?auto_825409 ?auto_825422 ) ) ( not ( = ?auto_825409 ?auto_825423 ) ) ( not ( = ?auto_825410 ?auto_825411 ) ) ( not ( = ?auto_825410 ?auto_825412 ) ) ( not ( = ?auto_825410 ?auto_825413 ) ) ( not ( = ?auto_825410 ?auto_825414 ) ) ( not ( = ?auto_825410 ?auto_825415 ) ) ( not ( = ?auto_825410 ?auto_825416 ) ) ( not ( = ?auto_825410 ?auto_825417 ) ) ( not ( = ?auto_825410 ?auto_825418 ) ) ( not ( = ?auto_825410 ?auto_825419 ) ) ( not ( = ?auto_825410 ?auto_825420 ) ) ( not ( = ?auto_825410 ?auto_825421 ) ) ( not ( = ?auto_825410 ?auto_825422 ) ) ( not ( = ?auto_825410 ?auto_825423 ) ) ( not ( = ?auto_825411 ?auto_825412 ) ) ( not ( = ?auto_825411 ?auto_825413 ) ) ( not ( = ?auto_825411 ?auto_825414 ) ) ( not ( = ?auto_825411 ?auto_825415 ) ) ( not ( = ?auto_825411 ?auto_825416 ) ) ( not ( = ?auto_825411 ?auto_825417 ) ) ( not ( = ?auto_825411 ?auto_825418 ) ) ( not ( = ?auto_825411 ?auto_825419 ) ) ( not ( = ?auto_825411 ?auto_825420 ) ) ( not ( = ?auto_825411 ?auto_825421 ) ) ( not ( = ?auto_825411 ?auto_825422 ) ) ( not ( = ?auto_825411 ?auto_825423 ) ) ( not ( = ?auto_825412 ?auto_825413 ) ) ( not ( = ?auto_825412 ?auto_825414 ) ) ( not ( = ?auto_825412 ?auto_825415 ) ) ( not ( = ?auto_825412 ?auto_825416 ) ) ( not ( = ?auto_825412 ?auto_825417 ) ) ( not ( = ?auto_825412 ?auto_825418 ) ) ( not ( = ?auto_825412 ?auto_825419 ) ) ( not ( = ?auto_825412 ?auto_825420 ) ) ( not ( = ?auto_825412 ?auto_825421 ) ) ( not ( = ?auto_825412 ?auto_825422 ) ) ( not ( = ?auto_825412 ?auto_825423 ) ) ( not ( = ?auto_825413 ?auto_825414 ) ) ( not ( = ?auto_825413 ?auto_825415 ) ) ( not ( = ?auto_825413 ?auto_825416 ) ) ( not ( = ?auto_825413 ?auto_825417 ) ) ( not ( = ?auto_825413 ?auto_825418 ) ) ( not ( = ?auto_825413 ?auto_825419 ) ) ( not ( = ?auto_825413 ?auto_825420 ) ) ( not ( = ?auto_825413 ?auto_825421 ) ) ( not ( = ?auto_825413 ?auto_825422 ) ) ( not ( = ?auto_825413 ?auto_825423 ) ) ( not ( = ?auto_825414 ?auto_825415 ) ) ( not ( = ?auto_825414 ?auto_825416 ) ) ( not ( = ?auto_825414 ?auto_825417 ) ) ( not ( = ?auto_825414 ?auto_825418 ) ) ( not ( = ?auto_825414 ?auto_825419 ) ) ( not ( = ?auto_825414 ?auto_825420 ) ) ( not ( = ?auto_825414 ?auto_825421 ) ) ( not ( = ?auto_825414 ?auto_825422 ) ) ( not ( = ?auto_825414 ?auto_825423 ) ) ( not ( = ?auto_825415 ?auto_825416 ) ) ( not ( = ?auto_825415 ?auto_825417 ) ) ( not ( = ?auto_825415 ?auto_825418 ) ) ( not ( = ?auto_825415 ?auto_825419 ) ) ( not ( = ?auto_825415 ?auto_825420 ) ) ( not ( = ?auto_825415 ?auto_825421 ) ) ( not ( = ?auto_825415 ?auto_825422 ) ) ( not ( = ?auto_825415 ?auto_825423 ) ) ( not ( = ?auto_825416 ?auto_825417 ) ) ( not ( = ?auto_825416 ?auto_825418 ) ) ( not ( = ?auto_825416 ?auto_825419 ) ) ( not ( = ?auto_825416 ?auto_825420 ) ) ( not ( = ?auto_825416 ?auto_825421 ) ) ( not ( = ?auto_825416 ?auto_825422 ) ) ( not ( = ?auto_825416 ?auto_825423 ) ) ( not ( = ?auto_825417 ?auto_825418 ) ) ( not ( = ?auto_825417 ?auto_825419 ) ) ( not ( = ?auto_825417 ?auto_825420 ) ) ( not ( = ?auto_825417 ?auto_825421 ) ) ( not ( = ?auto_825417 ?auto_825422 ) ) ( not ( = ?auto_825417 ?auto_825423 ) ) ( not ( = ?auto_825418 ?auto_825419 ) ) ( not ( = ?auto_825418 ?auto_825420 ) ) ( not ( = ?auto_825418 ?auto_825421 ) ) ( not ( = ?auto_825418 ?auto_825422 ) ) ( not ( = ?auto_825418 ?auto_825423 ) ) ( not ( = ?auto_825419 ?auto_825420 ) ) ( not ( = ?auto_825419 ?auto_825421 ) ) ( not ( = ?auto_825419 ?auto_825422 ) ) ( not ( = ?auto_825419 ?auto_825423 ) ) ( not ( = ?auto_825420 ?auto_825421 ) ) ( not ( = ?auto_825420 ?auto_825422 ) ) ( not ( = ?auto_825420 ?auto_825423 ) ) ( not ( = ?auto_825421 ?auto_825422 ) ) ( not ( = ?auto_825421 ?auto_825423 ) ) ( not ( = ?auto_825422 ?auto_825423 ) ) ( ON ?auto_825421 ?auto_825422 ) ( ON ?auto_825420 ?auto_825421 ) ( ON ?auto_825419 ?auto_825420 ) ( CLEAR ?auto_825417 ) ( ON ?auto_825418 ?auto_825419 ) ( CLEAR ?auto_825418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_825406 ?auto_825407 ?auto_825408 ?auto_825409 ?auto_825410 ?auto_825411 ?auto_825412 ?auto_825413 ?auto_825414 ?auto_825415 ?auto_825416 ?auto_825417 ?auto_825418 )
      ( MAKE-17PILE ?auto_825406 ?auto_825407 ?auto_825408 ?auto_825409 ?auto_825410 ?auto_825411 ?auto_825412 ?auto_825413 ?auto_825414 ?auto_825415 ?auto_825416 ?auto_825417 ?auto_825418 ?auto_825419 ?auto_825420 ?auto_825421 ?auto_825422 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_825476 - BLOCK
      ?auto_825477 - BLOCK
      ?auto_825478 - BLOCK
      ?auto_825479 - BLOCK
      ?auto_825480 - BLOCK
      ?auto_825481 - BLOCK
      ?auto_825482 - BLOCK
      ?auto_825483 - BLOCK
      ?auto_825484 - BLOCK
      ?auto_825485 - BLOCK
      ?auto_825486 - BLOCK
      ?auto_825487 - BLOCK
      ?auto_825488 - BLOCK
      ?auto_825489 - BLOCK
      ?auto_825490 - BLOCK
      ?auto_825491 - BLOCK
      ?auto_825492 - BLOCK
    )
    :vars
    (
      ?auto_825493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825492 ?auto_825493 ) ( ON-TABLE ?auto_825476 ) ( ON ?auto_825477 ?auto_825476 ) ( ON ?auto_825478 ?auto_825477 ) ( ON ?auto_825479 ?auto_825478 ) ( ON ?auto_825480 ?auto_825479 ) ( ON ?auto_825481 ?auto_825480 ) ( ON ?auto_825482 ?auto_825481 ) ( ON ?auto_825483 ?auto_825482 ) ( ON ?auto_825484 ?auto_825483 ) ( ON ?auto_825485 ?auto_825484 ) ( ON ?auto_825486 ?auto_825485 ) ( not ( = ?auto_825476 ?auto_825477 ) ) ( not ( = ?auto_825476 ?auto_825478 ) ) ( not ( = ?auto_825476 ?auto_825479 ) ) ( not ( = ?auto_825476 ?auto_825480 ) ) ( not ( = ?auto_825476 ?auto_825481 ) ) ( not ( = ?auto_825476 ?auto_825482 ) ) ( not ( = ?auto_825476 ?auto_825483 ) ) ( not ( = ?auto_825476 ?auto_825484 ) ) ( not ( = ?auto_825476 ?auto_825485 ) ) ( not ( = ?auto_825476 ?auto_825486 ) ) ( not ( = ?auto_825476 ?auto_825487 ) ) ( not ( = ?auto_825476 ?auto_825488 ) ) ( not ( = ?auto_825476 ?auto_825489 ) ) ( not ( = ?auto_825476 ?auto_825490 ) ) ( not ( = ?auto_825476 ?auto_825491 ) ) ( not ( = ?auto_825476 ?auto_825492 ) ) ( not ( = ?auto_825476 ?auto_825493 ) ) ( not ( = ?auto_825477 ?auto_825478 ) ) ( not ( = ?auto_825477 ?auto_825479 ) ) ( not ( = ?auto_825477 ?auto_825480 ) ) ( not ( = ?auto_825477 ?auto_825481 ) ) ( not ( = ?auto_825477 ?auto_825482 ) ) ( not ( = ?auto_825477 ?auto_825483 ) ) ( not ( = ?auto_825477 ?auto_825484 ) ) ( not ( = ?auto_825477 ?auto_825485 ) ) ( not ( = ?auto_825477 ?auto_825486 ) ) ( not ( = ?auto_825477 ?auto_825487 ) ) ( not ( = ?auto_825477 ?auto_825488 ) ) ( not ( = ?auto_825477 ?auto_825489 ) ) ( not ( = ?auto_825477 ?auto_825490 ) ) ( not ( = ?auto_825477 ?auto_825491 ) ) ( not ( = ?auto_825477 ?auto_825492 ) ) ( not ( = ?auto_825477 ?auto_825493 ) ) ( not ( = ?auto_825478 ?auto_825479 ) ) ( not ( = ?auto_825478 ?auto_825480 ) ) ( not ( = ?auto_825478 ?auto_825481 ) ) ( not ( = ?auto_825478 ?auto_825482 ) ) ( not ( = ?auto_825478 ?auto_825483 ) ) ( not ( = ?auto_825478 ?auto_825484 ) ) ( not ( = ?auto_825478 ?auto_825485 ) ) ( not ( = ?auto_825478 ?auto_825486 ) ) ( not ( = ?auto_825478 ?auto_825487 ) ) ( not ( = ?auto_825478 ?auto_825488 ) ) ( not ( = ?auto_825478 ?auto_825489 ) ) ( not ( = ?auto_825478 ?auto_825490 ) ) ( not ( = ?auto_825478 ?auto_825491 ) ) ( not ( = ?auto_825478 ?auto_825492 ) ) ( not ( = ?auto_825478 ?auto_825493 ) ) ( not ( = ?auto_825479 ?auto_825480 ) ) ( not ( = ?auto_825479 ?auto_825481 ) ) ( not ( = ?auto_825479 ?auto_825482 ) ) ( not ( = ?auto_825479 ?auto_825483 ) ) ( not ( = ?auto_825479 ?auto_825484 ) ) ( not ( = ?auto_825479 ?auto_825485 ) ) ( not ( = ?auto_825479 ?auto_825486 ) ) ( not ( = ?auto_825479 ?auto_825487 ) ) ( not ( = ?auto_825479 ?auto_825488 ) ) ( not ( = ?auto_825479 ?auto_825489 ) ) ( not ( = ?auto_825479 ?auto_825490 ) ) ( not ( = ?auto_825479 ?auto_825491 ) ) ( not ( = ?auto_825479 ?auto_825492 ) ) ( not ( = ?auto_825479 ?auto_825493 ) ) ( not ( = ?auto_825480 ?auto_825481 ) ) ( not ( = ?auto_825480 ?auto_825482 ) ) ( not ( = ?auto_825480 ?auto_825483 ) ) ( not ( = ?auto_825480 ?auto_825484 ) ) ( not ( = ?auto_825480 ?auto_825485 ) ) ( not ( = ?auto_825480 ?auto_825486 ) ) ( not ( = ?auto_825480 ?auto_825487 ) ) ( not ( = ?auto_825480 ?auto_825488 ) ) ( not ( = ?auto_825480 ?auto_825489 ) ) ( not ( = ?auto_825480 ?auto_825490 ) ) ( not ( = ?auto_825480 ?auto_825491 ) ) ( not ( = ?auto_825480 ?auto_825492 ) ) ( not ( = ?auto_825480 ?auto_825493 ) ) ( not ( = ?auto_825481 ?auto_825482 ) ) ( not ( = ?auto_825481 ?auto_825483 ) ) ( not ( = ?auto_825481 ?auto_825484 ) ) ( not ( = ?auto_825481 ?auto_825485 ) ) ( not ( = ?auto_825481 ?auto_825486 ) ) ( not ( = ?auto_825481 ?auto_825487 ) ) ( not ( = ?auto_825481 ?auto_825488 ) ) ( not ( = ?auto_825481 ?auto_825489 ) ) ( not ( = ?auto_825481 ?auto_825490 ) ) ( not ( = ?auto_825481 ?auto_825491 ) ) ( not ( = ?auto_825481 ?auto_825492 ) ) ( not ( = ?auto_825481 ?auto_825493 ) ) ( not ( = ?auto_825482 ?auto_825483 ) ) ( not ( = ?auto_825482 ?auto_825484 ) ) ( not ( = ?auto_825482 ?auto_825485 ) ) ( not ( = ?auto_825482 ?auto_825486 ) ) ( not ( = ?auto_825482 ?auto_825487 ) ) ( not ( = ?auto_825482 ?auto_825488 ) ) ( not ( = ?auto_825482 ?auto_825489 ) ) ( not ( = ?auto_825482 ?auto_825490 ) ) ( not ( = ?auto_825482 ?auto_825491 ) ) ( not ( = ?auto_825482 ?auto_825492 ) ) ( not ( = ?auto_825482 ?auto_825493 ) ) ( not ( = ?auto_825483 ?auto_825484 ) ) ( not ( = ?auto_825483 ?auto_825485 ) ) ( not ( = ?auto_825483 ?auto_825486 ) ) ( not ( = ?auto_825483 ?auto_825487 ) ) ( not ( = ?auto_825483 ?auto_825488 ) ) ( not ( = ?auto_825483 ?auto_825489 ) ) ( not ( = ?auto_825483 ?auto_825490 ) ) ( not ( = ?auto_825483 ?auto_825491 ) ) ( not ( = ?auto_825483 ?auto_825492 ) ) ( not ( = ?auto_825483 ?auto_825493 ) ) ( not ( = ?auto_825484 ?auto_825485 ) ) ( not ( = ?auto_825484 ?auto_825486 ) ) ( not ( = ?auto_825484 ?auto_825487 ) ) ( not ( = ?auto_825484 ?auto_825488 ) ) ( not ( = ?auto_825484 ?auto_825489 ) ) ( not ( = ?auto_825484 ?auto_825490 ) ) ( not ( = ?auto_825484 ?auto_825491 ) ) ( not ( = ?auto_825484 ?auto_825492 ) ) ( not ( = ?auto_825484 ?auto_825493 ) ) ( not ( = ?auto_825485 ?auto_825486 ) ) ( not ( = ?auto_825485 ?auto_825487 ) ) ( not ( = ?auto_825485 ?auto_825488 ) ) ( not ( = ?auto_825485 ?auto_825489 ) ) ( not ( = ?auto_825485 ?auto_825490 ) ) ( not ( = ?auto_825485 ?auto_825491 ) ) ( not ( = ?auto_825485 ?auto_825492 ) ) ( not ( = ?auto_825485 ?auto_825493 ) ) ( not ( = ?auto_825486 ?auto_825487 ) ) ( not ( = ?auto_825486 ?auto_825488 ) ) ( not ( = ?auto_825486 ?auto_825489 ) ) ( not ( = ?auto_825486 ?auto_825490 ) ) ( not ( = ?auto_825486 ?auto_825491 ) ) ( not ( = ?auto_825486 ?auto_825492 ) ) ( not ( = ?auto_825486 ?auto_825493 ) ) ( not ( = ?auto_825487 ?auto_825488 ) ) ( not ( = ?auto_825487 ?auto_825489 ) ) ( not ( = ?auto_825487 ?auto_825490 ) ) ( not ( = ?auto_825487 ?auto_825491 ) ) ( not ( = ?auto_825487 ?auto_825492 ) ) ( not ( = ?auto_825487 ?auto_825493 ) ) ( not ( = ?auto_825488 ?auto_825489 ) ) ( not ( = ?auto_825488 ?auto_825490 ) ) ( not ( = ?auto_825488 ?auto_825491 ) ) ( not ( = ?auto_825488 ?auto_825492 ) ) ( not ( = ?auto_825488 ?auto_825493 ) ) ( not ( = ?auto_825489 ?auto_825490 ) ) ( not ( = ?auto_825489 ?auto_825491 ) ) ( not ( = ?auto_825489 ?auto_825492 ) ) ( not ( = ?auto_825489 ?auto_825493 ) ) ( not ( = ?auto_825490 ?auto_825491 ) ) ( not ( = ?auto_825490 ?auto_825492 ) ) ( not ( = ?auto_825490 ?auto_825493 ) ) ( not ( = ?auto_825491 ?auto_825492 ) ) ( not ( = ?auto_825491 ?auto_825493 ) ) ( not ( = ?auto_825492 ?auto_825493 ) ) ( ON ?auto_825491 ?auto_825492 ) ( ON ?auto_825490 ?auto_825491 ) ( ON ?auto_825489 ?auto_825490 ) ( ON ?auto_825488 ?auto_825489 ) ( CLEAR ?auto_825486 ) ( ON ?auto_825487 ?auto_825488 ) ( CLEAR ?auto_825487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_825476 ?auto_825477 ?auto_825478 ?auto_825479 ?auto_825480 ?auto_825481 ?auto_825482 ?auto_825483 ?auto_825484 ?auto_825485 ?auto_825486 ?auto_825487 )
      ( MAKE-17PILE ?auto_825476 ?auto_825477 ?auto_825478 ?auto_825479 ?auto_825480 ?auto_825481 ?auto_825482 ?auto_825483 ?auto_825484 ?auto_825485 ?auto_825486 ?auto_825487 ?auto_825488 ?auto_825489 ?auto_825490 ?auto_825491 ?auto_825492 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_825546 - BLOCK
      ?auto_825547 - BLOCK
      ?auto_825548 - BLOCK
      ?auto_825549 - BLOCK
      ?auto_825550 - BLOCK
      ?auto_825551 - BLOCK
      ?auto_825552 - BLOCK
      ?auto_825553 - BLOCK
      ?auto_825554 - BLOCK
      ?auto_825555 - BLOCK
      ?auto_825556 - BLOCK
      ?auto_825557 - BLOCK
      ?auto_825558 - BLOCK
      ?auto_825559 - BLOCK
      ?auto_825560 - BLOCK
      ?auto_825561 - BLOCK
      ?auto_825562 - BLOCK
    )
    :vars
    (
      ?auto_825563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825562 ?auto_825563 ) ( ON-TABLE ?auto_825546 ) ( ON ?auto_825547 ?auto_825546 ) ( ON ?auto_825548 ?auto_825547 ) ( ON ?auto_825549 ?auto_825548 ) ( ON ?auto_825550 ?auto_825549 ) ( ON ?auto_825551 ?auto_825550 ) ( ON ?auto_825552 ?auto_825551 ) ( ON ?auto_825553 ?auto_825552 ) ( ON ?auto_825554 ?auto_825553 ) ( ON ?auto_825555 ?auto_825554 ) ( not ( = ?auto_825546 ?auto_825547 ) ) ( not ( = ?auto_825546 ?auto_825548 ) ) ( not ( = ?auto_825546 ?auto_825549 ) ) ( not ( = ?auto_825546 ?auto_825550 ) ) ( not ( = ?auto_825546 ?auto_825551 ) ) ( not ( = ?auto_825546 ?auto_825552 ) ) ( not ( = ?auto_825546 ?auto_825553 ) ) ( not ( = ?auto_825546 ?auto_825554 ) ) ( not ( = ?auto_825546 ?auto_825555 ) ) ( not ( = ?auto_825546 ?auto_825556 ) ) ( not ( = ?auto_825546 ?auto_825557 ) ) ( not ( = ?auto_825546 ?auto_825558 ) ) ( not ( = ?auto_825546 ?auto_825559 ) ) ( not ( = ?auto_825546 ?auto_825560 ) ) ( not ( = ?auto_825546 ?auto_825561 ) ) ( not ( = ?auto_825546 ?auto_825562 ) ) ( not ( = ?auto_825546 ?auto_825563 ) ) ( not ( = ?auto_825547 ?auto_825548 ) ) ( not ( = ?auto_825547 ?auto_825549 ) ) ( not ( = ?auto_825547 ?auto_825550 ) ) ( not ( = ?auto_825547 ?auto_825551 ) ) ( not ( = ?auto_825547 ?auto_825552 ) ) ( not ( = ?auto_825547 ?auto_825553 ) ) ( not ( = ?auto_825547 ?auto_825554 ) ) ( not ( = ?auto_825547 ?auto_825555 ) ) ( not ( = ?auto_825547 ?auto_825556 ) ) ( not ( = ?auto_825547 ?auto_825557 ) ) ( not ( = ?auto_825547 ?auto_825558 ) ) ( not ( = ?auto_825547 ?auto_825559 ) ) ( not ( = ?auto_825547 ?auto_825560 ) ) ( not ( = ?auto_825547 ?auto_825561 ) ) ( not ( = ?auto_825547 ?auto_825562 ) ) ( not ( = ?auto_825547 ?auto_825563 ) ) ( not ( = ?auto_825548 ?auto_825549 ) ) ( not ( = ?auto_825548 ?auto_825550 ) ) ( not ( = ?auto_825548 ?auto_825551 ) ) ( not ( = ?auto_825548 ?auto_825552 ) ) ( not ( = ?auto_825548 ?auto_825553 ) ) ( not ( = ?auto_825548 ?auto_825554 ) ) ( not ( = ?auto_825548 ?auto_825555 ) ) ( not ( = ?auto_825548 ?auto_825556 ) ) ( not ( = ?auto_825548 ?auto_825557 ) ) ( not ( = ?auto_825548 ?auto_825558 ) ) ( not ( = ?auto_825548 ?auto_825559 ) ) ( not ( = ?auto_825548 ?auto_825560 ) ) ( not ( = ?auto_825548 ?auto_825561 ) ) ( not ( = ?auto_825548 ?auto_825562 ) ) ( not ( = ?auto_825548 ?auto_825563 ) ) ( not ( = ?auto_825549 ?auto_825550 ) ) ( not ( = ?auto_825549 ?auto_825551 ) ) ( not ( = ?auto_825549 ?auto_825552 ) ) ( not ( = ?auto_825549 ?auto_825553 ) ) ( not ( = ?auto_825549 ?auto_825554 ) ) ( not ( = ?auto_825549 ?auto_825555 ) ) ( not ( = ?auto_825549 ?auto_825556 ) ) ( not ( = ?auto_825549 ?auto_825557 ) ) ( not ( = ?auto_825549 ?auto_825558 ) ) ( not ( = ?auto_825549 ?auto_825559 ) ) ( not ( = ?auto_825549 ?auto_825560 ) ) ( not ( = ?auto_825549 ?auto_825561 ) ) ( not ( = ?auto_825549 ?auto_825562 ) ) ( not ( = ?auto_825549 ?auto_825563 ) ) ( not ( = ?auto_825550 ?auto_825551 ) ) ( not ( = ?auto_825550 ?auto_825552 ) ) ( not ( = ?auto_825550 ?auto_825553 ) ) ( not ( = ?auto_825550 ?auto_825554 ) ) ( not ( = ?auto_825550 ?auto_825555 ) ) ( not ( = ?auto_825550 ?auto_825556 ) ) ( not ( = ?auto_825550 ?auto_825557 ) ) ( not ( = ?auto_825550 ?auto_825558 ) ) ( not ( = ?auto_825550 ?auto_825559 ) ) ( not ( = ?auto_825550 ?auto_825560 ) ) ( not ( = ?auto_825550 ?auto_825561 ) ) ( not ( = ?auto_825550 ?auto_825562 ) ) ( not ( = ?auto_825550 ?auto_825563 ) ) ( not ( = ?auto_825551 ?auto_825552 ) ) ( not ( = ?auto_825551 ?auto_825553 ) ) ( not ( = ?auto_825551 ?auto_825554 ) ) ( not ( = ?auto_825551 ?auto_825555 ) ) ( not ( = ?auto_825551 ?auto_825556 ) ) ( not ( = ?auto_825551 ?auto_825557 ) ) ( not ( = ?auto_825551 ?auto_825558 ) ) ( not ( = ?auto_825551 ?auto_825559 ) ) ( not ( = ?auto_825551 ?auto_825560 ) ) ( not ( = ?auto_825551 ?auto_825561 ) ) ( not ( = ?auto_825551 ?auto_825562 ) ) ( not ( = ?auto_825551 ?auto_825563 ) ) ( not ( = ?auto_825552 ?auto_825553 ) ) ( not ( = ?auto_825552 ?auto_825554 ) ) ( not ( = ?auto_825552 ?auto_825555 ) ) ( not ( = ?auto_825552 ?auto_825556 ) ) ( not ( = ?auto_825552 ?auto_825557 ) ) ( not ( = ?auto_825552 ?auto_825558 ) ) ( not ( = ?auto_825552 ?auto_825559 ) ) ( not ( = ?auto_825552 ?auto_825560 ) ) ( not ( = ?auto_825552 ?auto_825561 ) ) ( not ( = ?auto_825552 ?auto_825562 ) ) ( not ( = ?auto_825552 ?auto_825563 ) ) ( not ( = ?auto_825553 ?auto_825554 ) ) ( not ( = ?auto_825553 ?auto_825555 ) ) ( not ( = ?auto_825553 ?auto_825556 ) ) ( not ( = ?auto_825553 ?auto_825557 ) ) ( not ( = ?auto_825553 ?auto_825558 ) ) ( not ( = ?auto_825553 ?auto_825559 ) ) ( not ( = ?auto_825553 ?auto_825560 ) ) ( not ( = ?auto_825553 ?auto_825561 ) ) ( not ( = ?auto_825553 ?auto_825562 ) ) ( not ( = ?auto_825553 ?auto_825563 ) ) ( not ( = ?auto_825554 ?auto_825555 ) ) ( not ( = ?auto_825554 ?auto_825556 ) ) ( not ( = ?auto_825554 ?auto_825557 ) ) ( not ( = ?auto_825554 ?auto_825558 ) ) ( not ( = ?auto_825554 ?auto_825559 ) ) ( not ( = ?auto_825554 ?auto_825560 ) ) ( not ( = ?auto_825554 ?auto_825561 ) ) ( not ( = ?auto_825554 ?auto_825562 ) ) ( not ( = ?auto_825554 ?auto_825563 ) ) ( not ( = ?auto_825555 ?auto_825556 ) ) ( not ( = ?auto_825555 ?auto_825557 ) ) ( not ( = ?auto_825555 ?auto_825558 ) ) ( not ( = ?auto_825555 ?auto_825559 ) ) ( not ( = ?auto_825555 ?auto_825560 ) ) ( not ( = ?auto_825555 ?auto_825561 ) ) ( not ( = ?auto_825555 ?auto_825562 ) ) ( not ( = ?auto_825555 ?auto_825563 ) ) ( not ( = ?auto_825556 ?auto_825557 ) ) ( not ( = ?auto_825556 ?auto_825558 ) ) ( not ( = ?auto_825556 ?auto_825559 ) ) ( not ( = ?auto_825556 ?auto_825560 ) ) ( not ( = ?auto_825556 ?auto_825561 ) ) ( not ( = ?auto_825556 ?auto_825562 ) ) ( not ( = ?auto_825556 ?auto_825563 ) ) ( not ( = ?auto_825557 ?auto_825558 ) ) ( not ( = ?auto_825557 ?auto_825559 ) ) ( not ( = ?auto_825557 ?auto_825560 ) ) ( not ( = ?auto_825557 ?auto_825561 ) ) ( not ( = ?auto_825557 ?auto_825562 ) ) ( not ( = ?auto_825557 ?auto_825563 ) ) ( not ( = ?auto_825558 ?auto_825559 ) ) ( not ( = ?auto_825558 ?auto_825560 ) ) ( not ( = ?auto_825558 ?auto_825561 ) ) ( not ( = ?auto_825558 ?auto_825562 ) ) ( not ( = ?auto_825558 ?auto_825563 ) ) ( not ( = ?auto_825559 ?auto_825560 ) ) ( not ( = ?auto_825559 ?auto_825561 ) ) ( not ( = ?auto_825559 ?auto_825562 ) ) ( not ( = ?auto_825559 ?auto_825563 ) ) ( not ( = ?auto_825560 ?auto_825561 ) ) ( not ( = ?auto_825560 ?auto_825562 ) ) ( not ( = ?auto_825560 ?auto_825563 ) ) ( not ( = ?auto_825561 ?auto_825562 ) ) ( not ( = ?auto_825561 ?auto_825563 ) ) ( not ( = ?auto_825562 ?auto_825563 ) ) ( ON ?auto_825561 ?auto_825562 ) ( ON ?auto_825560 ?auto_825561 ) ( ON ?auto_825559 ?auto_825560 ) ( ON ?auto_825558 ?auto_825559 ) ( ON ?auto_825557 ?auto_825558 ) ( CLEAR ?auto_825555 ) ( ON ?auto_825556 ?auto_825557 ) ( CLEAR ?auto_825556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_825546 ?auto_825547 ?auto_825548 ?auto_825549 ?auto_825550 ?auto_825551 ?auto_825552 ?auto_825553 ?auto_825554 ?auto_825555 ?auto_825556 )
      ( MAKE-17PILE ?auto_825546 ?auto_825547 ?auto_825548 ?auto_825549 ?auto_825550 ?auto_825551 ?auto_825552 ?auto_825553 ?auto_825554 ?auto_825555 ?auto_825556 ?auto_825557 ?auto_825558 ?auto_825559 ?auto_825560 ?auto_825561 ?auto_825562 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_825616 - BLOCK
      ?auto_825617 - BLOCK
      ?auto_825618 - BLOCK
      ?auto_825619 - BLOCK
      ?auto_825620 - BLOCK
      ?auto_825621 - BLOCK
      ?auto_825622 - BLOCK
      ?auto_825623 - BLOCK
      ?auto_825624 - BLOCK
      ?auto_825625 - BLOCK
      ?auto_825626 - BLOCK
      ?auto_825627 - BLOCK
      ?auto_825628 - BLOCK
      ?auto_825629 - BLOCK
      ?auto_825630 - BLOCK
      ?auto_825631 - BLOCK
      ?auto_825632 - BLOCK
    )
    :vars
    (
      ?auto_825633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825632 ?auto_825633 ) ( ON-TABLE ?auto_825616 ) ( ON ?auto_825617 ?auto_825616 ) ( ON ?auto_825618 ?auto_825617 ) ( ON ?auto_825619 ?auto_825618 ) ( ON ?auto_825620 ?auto_825619 ) ( ON ?auto_825621 ?auto_825620 ) ( ON ?auto_825622 ?auto_825621 ) ( ON ?auto_825623 ?auto_825622 ) ( ON ?auto_825624 ?auto_825623 ) ( not ( = ?auto_825616 ?auto_825617 ) ) ( not ( = ?auto_825616 ?auto_825618 ) ) ( not ( = ?auto_825616 ?auto_825619 ) ) ( not ( = ?auto_825616 ?auto_825620 ) ) ( not ( = ?auto_825616 ?auto_825621 ) ) ( not ( = ?auto_825616 ?auto_825622 ) ) ( not ( = ?auto_825616 ?auto_825623 ) ) ( not ( = ?auto_825616 ?auto_825624 ) ) ( not ( = ?auto_825616 ?auto_825625 ) ) ( not ( = ?auto_825616 ?auto_825626 ) ) ( not ( = ?auto_825616 ?auto_825627 ) ) ( not ( = ?auto_825616 ?auto_825628 ) ) ( not ( = ?auto_825616 ?auto_825629 ) ) ( not ( = ?auto_825616 ?auto_825630 ) ) ( not ( = ?auto_825616 ?auto_825631 ) ) ( not ( = ?auto_825616 ?auto_825632 ) ) ( not ( = ?auto_825616 ?auto_825633 ) ) ( not ( = ?auto_825617 ?auto_825618 ) ) ( not ( = ?auto_825617 ?auto_825619 ) ) ( not ( = ?auto_825617 ?auto_825620 ) ) ( not ( = ?auto_825617 ?auto_825621 ) ) ( not ( = ?auto_825617 ?auto_825622 ) ) ( not ( = ?auto_825617 ?auto_825623 ) ) ( not ( = ?auto_825617 ?auto_825624 ) ) ( not ( = ?auto_825617 ?auto_825625 ) ) ( not ( = ?auto_825617 ?auto_825626 ) ) ( not ( = ?auto_825617 ?auto_825627 ) ) ( not ( = ?auto_825617 ?auto_825628 ) ) ( not ( = ?auto_825617 ?auto_825629 ) ) ( not ( = ?auto_825617 ?auto_825630 ) ) ( not ( = ?auto_825617 ?auto_825631 ) ) ( not ( = ?auto_825617 ?auto_825632 ) ) ( not ( = ?auto_825617 ?auto_825633 ) ) ( not ( = ?auto_825618 ?auto_825619 ) ) ( not ( = ?auto_825618 ?auto_825620 ) ) ( not ( = ?auto_825618 ?auto_825621 ) ) ( not ( = ?auto_825618 ?auto_825622 ) ) ( not ( = ?auto_825618 ?auto_825623 ) ) ( not ( = ?auto_825618 ?auto_825624 ) ) ( not ( = ?auto_825618 ?auto_825625 ) ) ( not ( = ?auto_825618 ?auto_825626 ) ) ( not ( = ?auto_825618 ?auto_825627 ) ) ( not ( = ?auto_825618 ?auto_825628 ) ) ( not ( = ?auto_825618 ?auto_825629 ) ) ( not ( = ?auto_825618 ?auto_825630 ) ) ( not ( = ?auto_825618 ?auto_825631 ) ) ( not ( = ?auto_825618 ?auto_825632 ) ) ( not ( = ?auto_825618 ?auto_825633 ) ) ( not ( = ?auto_825619 ?auto_825620 ) ) ( not ( = ?auto_825619 ?auto_825621 ) ) ( not ( = ?auto_825619 ?auto_825622 ) ) ( not ( = ?auto_825619 ?auto_825623 ) ) ( not ( = ?auto_825619 ?auto_825624 ) ) ( not ( = ?auto_825619 ?auto_825625 ) ) ( not ( = ?auto_825619 ?auto_825626 ) ) ( not ( = ?auto_825619 ?auto_825627 ) ) ( not ( = ?auto_825619 ?auto_825628 ) ) ( not ( = ?auto_825619 ?auto_825629 ) ) ( not ( = ?auto_825619 ?auto_825630 ) ) ( not ( = ?auto_825619 ?auto_825631 ) ) ( not ( = ?auto_825619 ?auto_825632 ) ) ( not ( = ?auto_825619 ?auto_825633 ) ) ( not ( = ?auto_825620 ?auto_825621 ) ) ( not ( = ?auto_825620 ?auto_825622 ) ) ( not ( = ?auto_825620 ?auto_825623 ) ) ( not ( = ?auto_825620 ?auto_825624 ) ) ( not ( = ?auto_825620 ?auto_825625 ) ) ( not ( = ?auto_825620 ?auto_825626 ) ) ( not ( = ?auto_825620 ?auto_825627 ) ) ( not ( = ?auto_825620 ?auto_825628 ) ) ( not ( = ?auto_825620 ?auto_825629 ) ) ( not ( = ?auto_825620 ?auto_825630 ) ) ( not ( = ?auto_825620 ?auto_825631 ) ) ( not ( = ?auto_825620 ?auto_825632 ) ) ( not ( = ?auto_825620 ?auto_825633 ) ) ( not ( = ?auto_825621 ?auto_825622 ) ) ( not ( = ?auto_825621 ?auto_825623 ) ) ( not ( = ?auto_825621 ?auto_825624 ) ) ( not ( = ?auto_825621 ?auto_825625 ) ) ( not ( = ?auto_825621 ?auto_825626 ) ) ( not ( = ?auto_825621 ?auto_825627 ) ) ( not ( = ?auto_825621 ?auto_825628 ) ) ( not ( = ?auto_825621 ?auto_825629 ) ) ( not ( = ?auto_825621 ?auto_825630 ) ) ( not ( = ?auto_825621 ?auto_825631 ) ) ( not ( = ?auto_825621 ?auto_825632 ) ) ( not ( = ?auto_825621 ?auto_825633 ) ) ( not ( = ?auto_825622 ?auto_825623 ) ) ( not ( = ?auto_825622 ?auto_825624 ) ) ( not ( = ?auto_825622 ?auto_825625 ) ) ( not ( = ?auto_825622 ?auto_825626 ) ) ( not ( = ?auto_825622 ?auto_825627 ) ) ( not ( = ?auto_825622 ?auto_825628 ) ) ( not ( = ?auto_825622 ?auto_825629 ) ) ( not ( = ?auto_825622 ?auto_825630 ) ) ( not ( = ?auto_825622 ?auto_825631 ) ) ( not ( = ?auto_825622 ?auto_825632 ) ) ( not ( = ?auto_825622 ?auto_825633 ) ) ( not ( = ?auto_825623 ?auto_825624 ) ) ( not ( = ?auto_825623 ?auto_825625 ) ) ( not ( = ?auto_825623 ?auto_825626 ) ) ( not ( = ?auto_825623 ?auto_825627 ) ) ( not ( = ?auto_825623 ?auto_825628 ) ) ( not ( = ?auto_825623 ?auto_825629 ) ) ( not ( = ?auto_825623 ?auto_825630 ) ) ( not ( = ?auto_825623 ?auto_825631 ) ) ( not ( = ?auto_825623 ?auto_825632 ) ) ( not ( = ?auto_825623 ?auto_825633 ) ) ( not ( = ?auto_825624 ?auto_825625 ) ) ( not ( = ?auto_825624 ?auto_825626 ) ) ( not ( = ?auto_825624 ?auto_825627 ) ) ( not ( = ?auto_825624 ?auto_825628 ) ) ( not ( = ?auto_825624 ?auto_825629 ) ) ( not ( = ?auto_825624 ?auto_825630 ) ) ( not ( = ?auto_825624 ?auto_825631 ) ) ( not ( = ?auto_825624 ?auto_825632 ) ) ( not ( = ?auto_825624 ?auto_825633 ) ) ( not ( = ?auto_825625 ?auto_825626 ) ) ( not ( = ?auto_825625 ?auto_825627 ) ) ( not ( = ?auto_825625 ?auto_825628 ) ) ( not ( = ?auto_825625 ?auto_825629 ) ) ( not ( = ?auto_825625 ?auto_825630 ) ) ( not ( = ?auto_825625 ?auto_825631 ) ) ( not ( = ?auto_825625 ?auto_825632 ) ) ( not ( = ?auto_825625 ?auto_825633 ) ) ( not ( = ?auto_825626 ?auto_825627 ) ) ( not ( = ?auto_825626 ?auto_825628 ) ) ( not ( = ?auto_825626 ?auto_825629 ) ) ( not ( = ?auto_825626 ?auto_825630 ) ) ( not ( = ?auto_825626 ?auto_825631 ) ) ( not ( = ?auto_825626 ?auto_825632 ) ) ( not ( = ?auto_825626 ?auto_825633 ) ) ( not ( = ?auto_825627 ?auto_825628 ) ) ( not ( = ?auto_825627 ?auto_825629 ) ) ( not ( = ?auto_825627 ?auto_825630 ) ) ( not ( = ?auto_825627 ?auto_825631 ) ) ( not ( = ?auto_825627 ?auto_825632 ) ) ( not ( = ?auto_825627 ?auto_825633 ) ) ( not ( = ?auto_825628 ?auto_825629 ) ) ( not ( = ?auto_825628 ?auto_825630 ) ) ( not ( = ?auto_825628 ?auto_825631 ) ) ( not ( = ?auto_825628 ?auto_825632 ) ) ( not ( = ?auto_825628 ?auto_825633 ) ) ( not ( = ?auto_825629 ?auto_825630 ) ) ( not ( = ?auto_825629 ?auto_825631 ) ) ( not ( = ?auto_825629 ?auto_825632 ) ) ( not ( = ?auto_825629 ?auto_825633 ) ) ( not ( = ?auto_825630 ?auto_825631 ) ) ( not ( = ?auto_825630 ?auto_825632 ) ) ( not ( = ?auto_825630 ?auto_825633 ) ) ( not ( = ?auto_825631 ?auto_825632 ) ) ( not ( = ?auto_825631 ?auto_825633 ) ) ( not ( = ?auto_825632 ?auto_825633 ) ) ( ON ?auto_825631 ?auto_825632 ) ( ON ?auto_825630 ?auto_825631 ) ( ON ?auto_825629 ?auto_825630 ) ( ON ?auto_825628 ?auto_825629 ) ( ON ?auto_825627 ?auto_825628 ) ( ON ?auto_825626 ?auto_825627 ) ( CLEAR ?auto_825624 ) ( ON ?auto_825625 ?auto_825626 ) ( CLEAR ?auto_825625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_825616 ?auto_825617 ?auto_825618 ?auto_825619 ?auto_825620 ?auto_825621 ?auto_825622 ?auto_825623 ?auto_825624 ?auto_825625 )
      ( MAKE-17PILE ?auto_825616 ?auto_825617 ?auto_825618 ?auto_825619 ?auto_825620 ?auto_825621 ?auto_825622 ?auto_825623 ?auto_825624 ?auto_825625 ?auto_825626 ?auto_825627 ?auto_825628 ?auto_825629 ?auto_825630 ?auto_825631 ?auto_825632 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_825686 - BLOCK
      ?auto_825687 - BLOCK
      ?auto_825688 - BLOCK
      ?auto_825689 - BLOCK
      ?auto_825690 - BLOCK
      ?auto_825691 - BLOCK
      ?auto_825692 - BLOCK
      ?auto_825693 - BLOCK
      ?auto_825694 - BLOCK
      ?auto_825695 - BLOCK
      ?auto_825696 - BLOCK
      ?auto_825697 - BLOCK
      ?auto_825698 - BLOCK
      ?auto_825699 - BLOCK
      ?auto_825700 - BLOCK
      ?auto_825701 - BLOCK
      ?auto_825702 - BLOCK
    )
    :vars
    (
      ?auto_825703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825702 ?auto_825703 ) ( ON-TABLE ?auto_825686 ) ( ON ?auto_825687 ?auto_825686 ) ( ON ?auto_825688 ?auto_825687 ) ( ON ?auto_825689 ?auto_825688 ) ( ON ?auto_825690 ?auto_825689 ) ( ON ?auto_825691 ?auto_825690 ) ( ON ?auto_825692 ?auto_825691 ) ( ON ?auto_825693 ?auto_825692 ) ( not ( = ?auto_825686 ?auto_825687 ) ) ( not ( = ?auto_825686 ?auto_825688 ) ) ( not ( = ?auto_825686 ?auto_825689 ) ) ( not ( = ?auto_825686 ?auto_825690 ) ) ( not ( = ?auto_825686 ?auto_825691 ) ) ( not ( = ?auto_825686 ?auto_825692 ) ) ( not ( = ?auto_825686 ?auto_825693 ) ) ( not ( = ?auto_825686 ?auto_825694 ) ) ( not ( = ?auto_825686 ?auto_825695 ) ) ( not ( = ?auto_825686 ?auto_825696 ) ) ( not ( = ?auto_825686 ?auto_825697 ) ) ( not ( = ?auto_825686 ?auto_825698 ) ) ( not ( = ?auto_825686 ?auto_825699 ) ) ( not ( = ?auto_825686 ?auto_825700 ) ) ( not ( = ?auto_825686 ?auto_825701 ) ) ( not ( = ?auto_825686 ?auto_825702 ) ) ( not ( = ?auto_825686 ?auto_825703 ) ) ( not ( = ?auto_825687 ?auto_825688 ) ) ( not ( = ?auto_825687 ?auto_825689 ) ) ( not ( = ?auto_825687 ?auto_825690 ) ) ( not ( = ?auto_825687 ?auto_825691 ) ) ( not ( = ?auto_825687 ?auto_825692 ) ) ( not ( = ?auto_825687 ?auto_825693 ) ) ( not ( = ?auto_825687 ?auto_825694 ) ) ( not ( = ?auto_825687 ?auto_825695 ) ) ( not ( = ?auto_825687 ?auto_825696 ) ) ( not ( = ?auto_825687 ?auto_825697 ) ) ( not ( = ?auto_825687 ?auto_825698 ) ) ( not ( = ?auto_825687 ?auto_825699 ) ) ( not ( = ?auto_825687 ?auto_825700 ) ) ( not ( = ?auto_825687 ?auto_825701 ) ) ( not ( = ?auto_825687 ?auto_825702 ) ) ( not ( = ?auto_825687 ?auto_825703 ) ) ( not ( = ?auto_825688 ?auto_825689 ) ) ( not ( = ?auto_825688 ?auto_825690 ) ) ( not ( = ?auto_825688 ?auto_825691 ) ) ( not ( = ?auto_825688 ?auto_825692 ) ) ( not ( = ?auto_825688 ?auto_825693 ) ) ( not ( = ?auto_825688 ?auto_825694 ) ) ( not ( = ?auto_825688 ?auto_825695 ) ) ( not ( = ?auto_825688 ?auto_825696 ) ) ( not ( = ?auto_825688 ?auto_825697 ) ) ( not ( = ?auto_825688 ?auto_825698 ) ) ( not ( = ?auto_825688 ?auto_825699 ) ) ( not ( = ?auto_825688 ?auto_825700 ) ) ( not ( = ?auto_825688 ?auto_825701 ) ) ( not ( = ?auto_825688 ?auto_825702 ) ) ( not ( = ?auto_825688 ?auto_825703 ) ) ( not ( = ?auto_825689 ?auto_825690 ) ) ( not ( = ?auto_825689 ?auto_825691 ) ) ( not ( = ?auto_825689 ?auto_825692 ) ) ( not ( = ?auto_825689 ?auto_825693 ) ) ( not ( = ?auto_825689 ?auto_825694 ) ) ( not ( = ?auto_825689 ?auto_825695 ) ) ( not ( = ?auto_825689 ?auto_825696 ) ) ( not ( = ?auto_825689 ?auto_825697 ) ) ( not ( = ?auto_825689 ?auto_825698 ) ) ( not ( = ?auto_825689 ?auto_825699 ) ) ( not ( = ?auto_825689 ?auto_825700 ) ) ( not ( = ?auto_825689 ?auto_825701 ) ) ( not ( = ?auto_825689 ?auto_825702 ) ) ( not ( = ?auto_825689 ?auto_825703 ) ) ( not ( = ?auto_825690 ?auto_825691 ) ) ( not ( = ?auto_825690 ?auto_825692 ) ) ( not ( = ?auto_825690 ?auto_825693 ) ) ( not ( = ?auto_825690 ?auto_825694 ) ) ( not ( = ?auto_825690 ?auto_825695 ) ) ( not ( = ?auto_825690 ?auto_825696 ) ) ( not ( = ?auto_825690 ?auto_825697 ) ) ( not ( = ?auto_825690 ?auto_825698 ) ) ( not ( = ?auto_825690 ?auto_825699 ) ) ( not ( = ?auto_825690 ?auto_825700 ) ) ( not ( = ?auto_825690 ?auto_825701 ) ) ( not ( = ?auto_825690 ?auto_825702 ) ) ( not ( = ?auto_825690 ?auto_825703 ) ) ( not ( = ?auto_825691 ?auto_825692 ) ) ( not ( = ?auto_825691 ?auto_825693 ) ) ( not ( = ?auto_825691 ?auto_825694 ) ) ( not ( = ?auto_825691 ?auto_825695 ) ) ( not ( = ?auto_825691 ?auto_825696 ) ) ( not ( = ?auto_825691 ?auto_825697 ) ) ( not ( = ?auto_825691 ?auto_825698 ) ) ( not ( = ?auto_825691 ?auto_825699 ) ) ( not ( = ?auto_825691 ?auto_825700 ) ) ( not ( = ?auto_825691 ?auto_825701 ) ) ( not ( = ?auto_825691 ?auto_825702 ) ) ( not ( = ?auto_825691 ?auto_825703 ) ) ( not ( = ?auto_825692 ?auto_825693 ) ) ( not ( = ?auto_825692 ?auto_825694 ) ) ( not ( = ?auto_825692 ?auto_825695 ) ) ( not ( = ?auto_825692 ?auto_825696 ) ) ( not ( = ?auto_825692 ?auto_825697 ) ) ( not ( = ?auto_825692 ?auto_825698 ) ) ( not ( = ?auto_825692 ?auto_825699 ) ) ( not ( = ?auto_825692 ?auto_825700 ) ) ( not ( = ?auto_825692 ?auto_825701 ) ) ( not ( = ?auto_825692 ?auto_825702 ) ) ( not ( = ?auto_825692 ?auto_825703 ) ) ( not ( = ?auto_825693 ?auto_825694 ) ) ( not ( = ?auto_825693 ?auto_825695 ) ) ( not ( = ?auto_825693 ?auto_825696 ) ) ( not ( = ?auto_825693 ?auto_825697 ) ) ( not ( = ?auto_825693 ?auto_825698 ) ) ( not ( = ?auto_825693 ?auto_825699 ) ) ( not ( = ?auto_825693 ?auto_825700 ) ) ( not ( = ?auto_825693 ?auto_825701 ) ) ( not ( = ?auto_825693 ?auto_825702 ) ) ( not ( = ?auto_825693 ?auto_825703 ) ) ( not ( = ?auto_825694 ?auto_825695 ) ) ( not ( = ?auto_825694 ?auto_825696 ) ) ( not ( = ?auto_825694 ?auto_825697 ) ) ( not ( = ?auto_825694 ?auto_825698 ) ) ( not ( = ?auto_825694 ?auto_825699 ) ) ( not ( = ?auto_825694 ?auto_825700 ) ) ( not ( = ?auto_825694 ?auto_825701 ) ) ( not ( = ?auto_825694 ?auto_825702 ) ) ( not ( = ?auto_825694 ?auto_825703 ) ) ( not ( = ?auto_825695 ?auto_825696 ) ) ( not ( = ?auto_825695 ?auto_825697 ) ) ( not ( = ?auto_825695 ?auto_825698 ) ) ( not ( = ?auto_825695 ?auto_825699 ) ) ( not ( = ?auto_825695 ?auto_825700 ) ) ( not ( = ?auto_825695 ?auto_825701 ) ) ( not ( = ?auto_825695 ?auto_825702 ) ) ( not ( = ?auto_825695 ?auto_825703 ) ) ( not ( = ?auto_825696 ?auto_825697 ) ) ( not ( = ?auto_825696 ?auto_825698 ) ) ( not ( = ?auto_825696 ?auto_825699 ) ) ( not ( = ?auto_825696 ?auto_825700 ) ) ( not ( = ?auto_825696 ?auto_825701 ) ) ( not ( = ?auto_825696 ?auto_825702 ) ) ( not ( = ?auto_825696 ?auto_825703 ) ) ( not ( = ?auto_825697 ?auto_825698 ) ) ( not ( = ?auto_825697 ?auto_825699 ) ) ( not ( = ?auto_825697 ?auto_825700 ) ) ( not ( = ?auto_825697 ?auto_825701 ) ) ( not ( = ?auto_825697 ?auto_825702 ) ) ( not ( = ?auto_825697 ?auto_825703 ) ) ( not ( = ?auto_825698 ?auto_825699 ) ) ( not ( = ?auto_825698 ?auto_825700 ) ) ( not ( = ?auto_825698 ?auto_825701 ) ) ( not ( = ?auto_825698 ?auto_825702 ) ) ( not ( = ?auto_825698 ?auto_825703 ) ) ( not ( = ?auto_825699 ?auto_825700 ) ) ( not ( = ?auto_825699 ?auto_825701 ) ) ( not ( = ?auto_825699 ?auto_825702 ) ) ( not ( = ?auto_825699 ?auto_825703 ) ) ( not ( = ?auto_825700 ?auto_825701 ) ) ( not ( = ?auto_825700 ?auto_825702 ) ) ( not ( = ?auto_825700 ?auto_825703 ) ) ( not ( = ?auto_825701 ?auto_825702 ) ) ( not ( = ?auto_825701 ?auto_825703 ) ) ( not ( = ?auto_825702 ?auto_825703 ) ) ( ON ?auto_825701 ?auto_825702 ) ( ON ?auto_825700 ?auto_825701 ) ( ON ?auto_825699 ?auto_825700 ) ( ON ?auto_825698 ?auto_825699 ) ( ON ?auto_825697 ?auto_825698 ) ( ON ?auto_825696 ?auto_825697 ) ( ON ?auto_825695 ?auto_825696 ) ( CLEAR ?auto_825693 ) ( ON ?auto_825694 ?auto_825695 ) ( CLEAR ?auto_825694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_825686 ?auto_825687 ?auto_825688 ?auto_825689 ?auto_825690 ?auto_825691 ?auto_825692 ?auto_825693 ?auto_825694 )
      ( MAKE-17PILE ?auto_825686 ?auto_825687 ?auto_825688 ?auto_825689 ?auto_825690 ?auto_825691 ?auto_825692 ?auto_825693 ?auto_825694 ?auto_825695 ?auto_825696 ?auto_825697 ?auto_825698 ?auto_825699 ?auto_825700 ?auto_825701 ?auto_825702 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_825756 - BLOCK
      ?auto_825757 - BLOCK
      ?auto_825758 - BLOCK
      ?auto_825759 - BLOCK
      ?auto_825760 - BLOCK
      ?auto_825761 - BLOCK
      ?auto_825762 - BLOCK
      ?auto_825763 - BLOCK
      ?auto_825764 - BLOCK
      ?auto_825765 - BLOCK
      ?auto_825766 - BLOCK
      ?auto_825767 - BLOCK
      ?auto_825768 - BLOCK
      ?auto_825769 - BLOCK
      ?auto_825770 - BLOCK
      ?auto_825771 - BLOCK
      ?auto_825772 - BLOCK
    )
    :vars
    (
      ?auto_825773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825772 ?auto_825773 ) ( ON-TABLE ?auto_825756 ) ( ON ?auto_825757 ?auto_825756 ) ( ON ?auto_825758 ?auto_825757 ) ( ON ?auto_825759 ?auto_825758 ) ( ON ?auto_825760 ?auto_825759 ) ( ON ?auto_825761 ?auto_825760 ) ( ON ?auto_825762 ?auto_825761 ) ( not ( = ?auto_825756 ?auto_825757 ) ) ( not ( = ?auto_825756 ?auto_825758 ) ) ( not ( = ?auto_825756 ?auto_825759 ) ) ( not ( = ?auto_825756 ?auto_825760 ) ) ( not ( = ?auto_825756 ?auto_825761 ) ) ( not ( = ?auto_825756 ?auto_825762 ) ) ( not ( = ?auto_825756 ?auto_825763 ) ) ( not ( = ?auto_825756 ?auto_825764 ) ) ( not ( = ?auto_825756 ?auto_825765 ) ) ( not ( = ?auto_825756 ?auto_825766 ) ) ( not ( = ?auto_825756 ?auto_825767 ) ) ( not ( = ?auto_825756 ?auto_825768 ) ) ( not ( = ?auto_825756 ?auto_825769 ) ) ( not ( = ?auto_825756 ?auto_825770 ) ) ( not ( = ?auto_825756 ?auto_825771 ) ) ( not ( = ?auto_825756 ?auto_825772 ) ) ( not ( = ?auto_825756 ?auto_825773 ) ) ( not ( = ?auto_825757 ?auto_825758 ) ) ( not ( = ?auto_825757 ?auto_825759 ) ) ( not ( = ?auto_825757 ?auto_825760 ) ) ( not ( = ?auto_825757 ?auto_825761 ) ) ( not ( = ?auto_825757 ?auto_825762 ) ) ( not ( = ?auto_825757 ?auto_825763 ) ) ( not ( = ?auto_825757 ?auto_825764 ) ) ( not ( = ?auto_825757 ?auto_825765 ) ) ( not ( = ?auto_825757 ?auto_825766 ) ) ( not ( = ?auto_825757 ?auto_825767 ) ) ( not ( = ?auto_825757 ?auto_825768 ) ) ( not ( = ?auto_825757 ?auto_825769 ) ) ( not ( = ?auto_825757 ?auto_825770 ) ) ( not ( = ?auto_825757 ?auto_825771 ) ) ( not ( = ?auto_825757 ?auto_825772 ) ) ( not ( = ?auto_825757 ?auto_825773 ) ) ( not ( = ?auto_825758 ?auto_825759 ) ) ( not ( = ?auto_825758 ?auto_825760 ) ) ( not ( = ?auto_825758 ?auto_825761 ) ) ( not ( = ?auto_825758 ?auto_825762 ) ) ( not ( = ?auto_825758 ?auto_825763 ) ) ( not ( = ?auto_825758 ?auto_825764 ) ) ( not ( = ?auto_825758 ?auto_825765 ) ) ( not ( = ?auto_825758 ?auto_825766 ) ) ( not ( = ?auto_825758 ?auto_825767 ) ) ( not ( = ?auto_825758 ?auto_825768 ) ) ( not ( = ?auto_825758 ?auto_825769 ) ) ( not ( = ?auto_825758 ?auto_825770 ) ) ( not ( = ?auto_825758 ?auto_825771 ) ) ( not ( = ?auto_825758 ?auto_825772 ) ) ( not ( = ?auto_825758 ?auto_825773 ) ) ( not ( = ?auto_825759 ?auto_825760 ) ) ( not ( = ?auto_825759 ?auto_825761 ) ) ( not ( = ?auto_825759 ?auto_825762 ) ) ( not ( = ?auto_825759 ?auto_825763 ) ) ( not ( = ?auto_825759 ?auto_825764 ) ) ( not ( = ?auto_825759 ?auto_825765 ) ) ( not ( = ?auto_825759 ?auto_825766 ) ) ( not ( = ?auto_825759 ?auto_825767 ) ) ( not ( = ?auto_825759 ?auto_825768 ) ) ( not ( = ?auto_825759 ?auto_825769 ) ) ( not ( = ?auto_825759 ?auto_825770 ) ) ( not ( = ?auto_825759 ?auto_825771 ) ) ( not ( = ?auto_825759 ?auto_825772 ) ) ( not ( = ?auto_825759 ?auto_825773 ) ) ( not ( = ?auto_825760 ?auto_825761 ) ) ( not ( = ?auto_825760 ?auto_825762 ) ) ( not ( = ?auto_825760 ?auto_825763 ) ) ( not ( = ?auto_825760 ?auto_825764 ) ) ( not ( = ?auto_825760 ?auto_825765 ) ) ( not ( = ?auto_825760 ?auto_825766 ) ) ( not ( = ?auto_825760 ?auto_825767 ) ) ( not ( = ?auto_825760 ?auto_825768 ) ) ( not ( = ?auto_825760 ?auto_825769 ) ) ( not ( = ?auto_825760 ?auto_825770 ) ) ( not ( = ?auto_825760 ?auto_825771 ) ) ( not ( = ?auto_825760 ?auto_825772 ) ) ( not ( = ?auto_825760 ?auto_825773 ) ) ( not ( = ?auto_825761 ?auto_825762 ) ) ( not ( = ?auto_825761 ?auto_825763 ) ) ( not ( = ?auto_825761 ?auto_825764 ) ) ( not ( = ?auto_825761 ?auto_825765 ) ) ( not ( = ?auto_825761 ?auto_825766 ) ) ( not ( = ?auto_825761 ?auto_825767 ) ) ( not ( = ?auto_825761 ?auto_825768 ) ) ( not ( = ?auto_825761 ?auto_825769 ) ) ( not ( = ?auto_825761 ?auto_825770 ) ) ( not ( = ?auto_825761 ?auto_825771 ) ) ( not ( = ?auto_825761 ?auto_825772 ) ) ( not ( = ?auto_825761 ?auto_825773 ) ) ( not ( = ?auto_825762 ?auto_825763 ) ) ( not ( = ?auto_825762 ?auto_825764 ) ) ( not ( = ?auto_825762 ?auto_825765 ) ) ( not ( = ?auto_825762 ?auto_825766 ) ) ( not ( = ?auto_825762 ?auto_825767 ) ) ( not ( = ?auto_825762 ?auto_825768 ) ) ( not ( = ?auto_825762 ?auto_825769 ) ) ( not ( = ?auto_825762 ?auto_825770 ) ) ( not ( = ?auto_825762 ?auto_825771 ) ) ( not ( = ?auto_825762 ?auto_825772 ) ) ( not ( = ?auto_825762 ?auto_825773 ) ) ( not ( = ?auto_825763 ?auto_825764 ) ) ( not ( = ?auto_825763 ?auto_825765 ) ) ( not ( = ?auto_825763 ?auto_825766 ) ) ( not ( = ?auto_825763 ?auto_825767 ) ) ( not ( = ?auto_825763 ?auto_825768 ) ) ( not ( = ?auto_825763 ?auto_825769 ) ) ( not ( = ?auto_825763 ?auto_825770 ) ) ( not ( = ?auto_825763 ?auto_825771 ) ) ( not ( = ?auto_825763 ?auto_825772 ) ) ( not ( = ?auto_825763 ?auto_825773 ) ) ( not ( = ?auto_825764 ?auto_825765 ) ) ( not ( = ?auto_825764 ?auto_825766 ) ) ( not ( = ?auto_825764 ?auto_825767 ) ) ( not ( = ?auto_825764 ?auto_825768 ) ) ( not ( = ?auto_825764 ?auto_825769 ) ) ( not ( = ?auto_825764 ?auto_825770 ) ) ( not ( = ?auto_825764 ?auto_825771 ) ) ( not ( = ?auto_825764 ?auto_825772 ) ) ( not ( = ?auto_825764 ?auto_825773 ) ) ( not ( = ?auto_825765 ?auto_825766 ) ) ( not ( = ?auto_825765 ?auto_825767 ) ) ( not ( = ?auto_825765 ?auto_825768 ) ) ( not ( = ?auto_825765 ?auto_825769 ) ) ( not ( = ?auto_825765 ?auto_825770 ) ) ( not ( = ?auto_825765 ?auto_825771 ) ) ( not ( = ?auto_825765 ?auto_825772 ) ) ( not ( = ?auto_825765 ?auto_825773 ) ) ( not ( = ?auto_825766 ?auto_825767 ) ) ( not ( = ?auto_825766 ?auto_825768 ) ) ( not ( = ?auto_825766 ?auto_825769 ) ) ( not ( = ?auto_825766 ?auto_825770 ) ) ( not ( = ?auto_825766 ?auto_825771 ) ) ( not ( = ?auto_825766 ?auto_825772 ) ) ( not ( = ?auto_825766 ?auto_825773 ) ) ( not ( = ?auto_825767 ?auto_825768 ) ) ( not ( = ?auto_825767 ?auto_825769 ) ) ( not ( = ?auto_825767 ?auto_825770 ) ) ( not ( = ?auto_825767 ?auto_825771 ) ) ( not ( = ?auto_825767 ?auto_825772 ) ) ( not ( = ?auto_825767 ?auto_825773 ) ) ( not ( = ?auto_825768 ?auto_825769 ) ) ( not ( = ?auto_825768 ?auto_825770 ) ) ( not ( = ?auto_825768 ?auto_825771 ) ) ( not ( = ?auto_825768 ?auto_825772 ) ) ( not ( = ?auto_825768 ?auto_825773 ) ) ( not ( = ?auto_825769 ?auto_825770 ) ) ( not ( = ?auto_825769 ?auto_825771 ) ) ( not ( = ?auto_825769 ?auto_825772 ) ) ( not ( = ?auto_825769 ?auto_825773 ) ) ( not ( = ?auto_825770 ?auto_825771 ) ) ( not ( = ?auto_825770 ?auto_825772 ) ) ( not ( = ?auto_825770 ?auto_825773 ) ) ( not ( = ?auto_825771 ?auto_825772 ) ) ( not ( = ?auto_825771 ?auto_825773 ) ) ( not ( = ?auto_825772 ?auto_825773 ) ) ( ON ?auto_825771 ?auto_825772 ) ( ON ?auto_825770 ?auto_825771 ) ( ON ?auto_825769 ?auto_825770 ) ( ON ?auto_825768 ?auto_825769 ) ( ON ?auto_825767 ?auto_825768 ) ( ON ?auto_825766 ?auto_825767 ) ( ON ?auto_825765 ?auto_825766 ) ( ON ?auto_825764 ?auto_825765 ) ( CLEAR ?auto_825762 ) ( ON ?auto_825763 ?auto_825764 ) ( CLEAR ?auto_825763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_825756 ?auto_825757 ?auto_825758 ?auto_825759 ?auto_825760 ?auto_825761 ?auto_825762 ?auto_825763 )
      ( MAKE-17PILE ?auto_825756 ?auto_825757 ?auto_825758 ?auto_825759 ?auto_825760 ?auto_825761 ?auto_825762 ?auto_825763 ?auto_825764 ?auto_825765 ?auto_825766 ?auto_825767 ?auto_825768 ?auto_825769 ?auto_825770 ?auto_825771 ?auto_825772 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_825826 - BLOCK
      ?auto_825827 - BLOCK
      ?auto_825828 - BLOCK
      ?auto_825829 - BLOCK
      ?auto_825830 - BLOCK
      ?auto_825831 - BLOCK
      ?auto_825832 - BLOCK
      ?auto_825833 - BLOCK
      ?auto_825834 - BLOCK
      ?auto_825835 - BLOCK
      ?auto_825836 - BLOCK
      ?auto_825837 - BLOCK
      ?auto_825838 - BLOCK
      ?auto_825839 - BLOCK
      ?auto_825840 - BLOCK
      ?auto_825841 - BLOCK
      ?auto_825842 - BLOCK
    )
    :vars
    (
      ?auto_825843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825842 ?auto_825843 ) ( ON-TABLE ?auto_825826 ) ( ON ?auto_825827 ?auto_825826 ) ( ON ?auto_825828 ?auto_825827 ) ( ON ?auto_825829 ?auto_825828 ) ( ON ?auto_825830 ?auto_825829 ) ( ON ?auto_825831 ?auto_825830 ) ( not ( = ?auto_825826 ?auto_825827 ) ) ( not ( = ?auto_825826 ?auto_825828 ) ) ( not ( = ?auto_825826 ?auto_825829 ) ) ( not ( = ?auto_825826 ?auto_825830 ) ) ( not ( = ?auto_825826 ?auto_825831 ) ) ( not ( = ?auto_825826 ?auto_825832 ) ) ( not ( = ?auto_825826 ?auto_825833 ) ) ( not ( = ?auto_825826 ?auto_825834 ) ) ( not ( = ?auto_825826 ?auto_825835 ) ) ( not ( = ?auto_825826 ?auto_825836 ) ) ( not ( = ?auto_825826 ?auto_825837 ) ) ( not ( = ?auto_825826 ?auto_825838 ) ) ( not ( = ?auto_825826 ?auto_825839 ) ) ( not ( = ?auto_825826 ?auto_825840 ) ) ( not ( = ?auto_825826 ?auto_825841 ) ) ( not ( = ?auto_825826 ?auto_825842 ) ) ( not ( = ?auto_825826 ?auto_825843 ) ) ( not ( = ?auto_825827 ?auto_825828 ) ) ( not ( = ?auto_825827 ?auto_825829 ) ) ( not ( = ?auto_825827 ?auto_825830 ) ) ( not ( = ?auto_825827 ?auto_825831 ) ) ( not ( = ?auto_825827 ?auto_825832 ) ) ( not ( = ?auto_825827 ?auto_825833 ) ) ( not ( = ?auto_825827 ?auto_825834 ) ) ( not ( = ?auto_825827 ?auto_825835 ) ) ( not ( = ?auto_825827 ?auto_825836 ) ) ( not ( = ?auto_825827 ?auto_825837 ) ) ( not ( = ?auto_825827 ?auto_825838 ) ) ( not ( = ?auto_825827 ?auto_825839 ) ) ( not ( = ?auto_825827 ?auto_825840 ) ) ( not ( = ?auto_825827 ?auto_825841 ) ) ( not ( = ?auto_825827 ?auto_825842 ) ) ( not ( = ?auto_825827 ?auto_825843 ) ) ( not ( = ?auto_825828 ?auto_825829 ) ) ( not ( = ?auto_825828 ?auto_825830 ) ) ( not ( = ?auto_825828 ?auto_825831 ) ) ( not ( = ?auto_825828 ?auto_825832 ) ) ( not ( = ?auto_825828 ?auto_825833 ) ) ( not ( = ?auto_825828 ?auto_825834 ) ) ( not ( = ?auto_825828 ?auto_825835 ) ) ( not ( = ?auto_825828 ?auto_825836 ) ) ( not ( = ?auto_825828 ?auto_825837 ) ) ( not ( = ?auto_825828 ?auto_825838 ) ) ( not ( = ?auto_825828 ?auto_825839 ) ) ( not ( = ?auto_825828 ?auto_825840 ) ) ( not ( = ?auto_825828 ?auto_825841 ) ) ( not ( = ?auto_825828 ?auto_825842 ) ) ( not ( = ?auto_825828 ?auto_825843 ) ) ( not ( = ?auto_825829 ?auto_825830 ) ) ( not ( = ?auto_825829 ?auto_825831 ) ) ( not ( = ?auto_825829 ?auto_825832 ) ) ( not ( = ?auto_825829 ?auto_825833 ) ) ( not ( = ?auto_825829 ?auto_825834 ) ) ( not ( = ?auto_825829 ?auto_825835 ) ) ( not ( = ?auto_825829 ?auto_825836 ) ) ( not ( = ?auto_825829 ?auto_825837 ) ) ( not ( = ?auto_825829 ?auto_825838 ) ) ( not ( = ?auto_825829 ?auto_825839 ) ) ( not ( = ?auto_825829 ?auto_825840 ) ) ( not ( = ?auto_825829 ?auto_825841 ) ) ( not ( = ?auto_825829 ?auto_825842 ) ) ( not ( = ?auto_825829 ?auto_825843 ) ) ( not ( = ?auto_825830 ?auto_825831 ) ) ( not ( = ?auto_825830 ?auto_825832 ) ) ( not ( = ?auto_825830 ?auto_825833 ) ) ( not ( = ?auto_825830 ?auto_825834 ) ) ( not ( = ?auto_825830 ?auto_825835 ) ) ( not ( = ?auto_825830 ?auto_825836 ) ) ( not ( = ?auto_825830 ?auto_825837 ) ) ( not ( = ?auto_825830 ?auto_825838 ) ) ( not ( = ?auto_825830 ?auto_825839 ) ) ( not ( = ?auto_825830 ?auto_825840 ) ) ( not ( = ?auto_825830 ?auto_825841 ) ) ( not ( = ?auto_825830 ?auto_825842 ) ) ( not ( = ?auto_825830 ?auto_825843 ) ) ( not ( = ?auto_825831 ?auto_825832 ) ) ( not ( = ?auto_825831 ?auto_825833 ) ) ( not ( = ?auto_825831 ?auto_825834 ) ) ( not ( = ?auto_825831 ?auto_825835 ) ) ( not ( = ?auto_825831 ?auto_825836 ) ) ( not ( = ?auto_825831 ?auto_825837 ) ) ( not ( = ?auto_825831 ?auto_825838 ) ) ( not ( = ?auto_825831 ?auto_825839 ) ) ( not ( = ?auto_825831 ?auto_825840 ) ) ( not ( = ?auto_825831 ?auto_825841 ) ) ( not ( = ?auto_825831 ?auto_825842 ) ) ( not ( = ?auto_825831 ?auto_825843 ) ) ( not ( = ?auto_825832 ?auto_825833 ) ) ( not ( = ?auto_825832 ?auto_825834 ) ) ( not ( = ?auto_825832 ?auto_825835 ) ) ( not ( = ?auto_825832 ?auto_825836 ) ) ( not ( = ?auto_825832 ?auto_825837 ) ) ( not ( = ?auto_825832 ?auto_825838 ) ) ( not ( = ?auto_825832 ?auto_825839 ) ) ( not ( = ?auto_825832 ?auto_825840 ) ) ( not ( = ?auto_825832 ?auto_825841 ) ) ( not ( = ?auto_825832 ?auto_825842 ) ) ( not ( = ?auto_825832 ?auto_825843 ) ) ( not ( = ?auto_825833 ?auto_825834 ) ) ( not ( = ?auto_825833 ?auto_825835 ) ) ( not ( = ?auto_825833 ?auto_825836 ) ) ( not ( = ?auto_825833 ?auto_825837 ) ) ( not ( = ?auto_825833 ?auto_825838 ) ) ( not ( = ?auto_825833 ?auto_825839 ) ) ( not ( = ?auto_825833 ?auto_825840 ) ) ( not ( = ?auto_825833 ?auto_825841 ) ) ( not ( = ?auto_825833 ?auto_825842 ) ) ( not ( = ?auto_825833 ?auto_825843 ) ) ( not ( = ?auto_825834 ?auto_825835 ) ) ( not ( = ?auto_825834 ?auto_825836 ) ) ( not ( = ?auto_825834 ?auto_825837 ) ) ( not ( = ?auto_825834 ?auto_825838 ) ) ( not ( = ?auto_825834 ?auto_825839 ) ) ( not ( = ?auto_825834 ?auto_825840 ) ) ( not ( = ?auto_825834 ?auto_825841 ) ) ( not ( = ?auto_825834 ?auto_825842 ) ) ( not ( = ?auto_825834 ?auto_825843 ) ) ( not ( = ?auto_825835 ?auto_825836 ) ) ( not ( = ?auto_825835 ?auto_825837 ) ) ( not ( = ?auto_825835 ?auto_825838 ) ) ( not ( = ?auto_825835 ?auto_825839 ) ) ( not ( = ?auto_825835 ?auto_825840 ) ) ( not ( = ?auto_825835 ?auto_825841 ) ) ( not ( = ?auto_825835 ?auto_825842 ) ) ( not ( = ?auto_825835 ?auto_825843 ) ) ( not ( = ?auto_825836 ?auto_825837 ) ) ( not ( = ?auto_825836 ?auto_825838 ) ) ( not ( = ?auto_825836 ?auto_825839 ) ) ( not ( = ?auto_825836 ?auto_825840 ) ) ( not ( = ?auto_825836 ?auto_825841 ) ) ( not ( = ?auto_825836 ?auto_825842 ) ) ( not ( = ?auto_825836 ?auto_825843 ) ) ( not ( = ?auto_825837 ?auto_825838 ) ) ( not ( = ?auto_825837 ?auto_825839 ) ) ( not ( = ?auto_825837 ?auto_825840 ) ) ( not ( = ?auto_825837 ?auto_825841 ) ) ( not ( = ?auto_825837 ?auto_825842 ) ) ( not ( = ?auto_825837 ?auto_825843 ) ) ( not ( = ?auto_825838 ?auto_825839 ) ) ( not ( = ?auto_825838 ?auto_825840 ) ) ( not ( = ?auto_825838 ?auto_825841 ) ) ( not ( = ?auto_825838 ?auto_825842 ) ) ( not ( = ?auto_825838 ?auto_825843 ) ) ( not ( = ?auto_825839 ?auto_825840 ) ) ( not ( = ?auto_825839 ?auto_825841 ) ) ( not ( = ?auto_825839 ?auto_825842 ) ) ( not ( = ?auto_825839 ?auto_825843 ) ) ( not ( = ?auto_825840 ?auto_825841 ) ) ( not ( = ?auto_825840 ?auto_825842 ) ) ( not ( = ?auto_825840 ?auto_825843 ) ) ( not ( = ?auto_825841 ?auto_825842 ) ) ( not ( = ?auto_825841 ?auto_825843 ) ) ( not ( = ?auto_825842 ?auto_825843 ) ) ( ON ?auto_825841 ?auto_825842 ) ( ON ?auto_825840 ?auto_825841 ) ( ON ?auto_825839 ?auto_825840 ) ( ON ?auto_825838 ?auto_825839 ) ( ON ?auto_825837 ?auto_825838 ) ( ON ?auto_825836 ?auto_825837 ) ( ON ?auto_825835 ?auto_825836 ) ( ON ?auto_825834 ?auto_825835 ) ( ON ?auto_825833 ?auto_825834 ) ( CLEAR ?auto_825831 ) ( ON ?auto_825832 ?auto_825833 ) ( CLEAR ?auto_825832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_825826 ?auto_825827 ?auto_825828 ?auto_825829 ?auto_825830 ?auto_825831 ?auto_825832 )
      ( MAKE-17PILE ?auto_825826 ?auto_825827 ?auto_825828 ?auto_825829 ?auto_825830 ?auto_825831 ?auto_825832 ?auto_825833 ?auto_825834 ?auto_825835 ?auto_825836 ?auto_825837 ?auto_825838 ?auto_825839 ?auto_825840 ?auto_825841 ?auto_825842 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_825896 - BLOCK
      ?auto_825897 - BLOCK
      ?auto_825898 - BLOCK
      ?auto_825899 - BLOCK
      ?auto_825900 - BLOCK
      ?auto_825901 - BLOCK
      ?auto_825902 - BLOCK
      ?auto_825903 - BLOCK
      ?auto_825904 - BLOCK
      ?auto_825905 - BLOCK
      ?auto_825906 - BLOCK
      ?auto_825907 - BLOCK
      ?auto_825908 - BLOCK
      ?auto_825909 - BLOCK
      ?auto_825910 - BLOCK
      ?auto_825911 - BLOCK
      ?auto_825912 - BLOCK
    )
    :vars
    (
      ?auto_825913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825912 ?auto_825913 ) ( ON-TABLE ?auto_825896 ) ( ON ?auto_825897 ?auto_825896 ) ( ON ?auto_825898 ?auto_825897 ) ( ON ?auto_825899 ?auto_825898 ) ( ON ?auto_825900 ?auto_825899 ) ( not ( = ?auto_825896 ?auto_825897 ) ) ( not ( = ?auto_825896 ?auto_825898 ) ) ( not ( = ?auto_825896 ?auto_825899 ) ) ( not ( = ?auto_825896 ?auto_825900 ) ) ( not ( = ?auto_825896 ?auto_825901 ) ) ( not ( = ?auto_825896 ?auto_825902 ) ) ( not ( = ?auto_825896 ?auto_825903 ) ) ( not ( = ?auto_825896 ?auto_825904 ) ) ( not ( = ?auto_825896 ?auto_825905 ) ) ( not ( = ?auto_825896 ?auto_825906 ) ) ( not ( = ?auto_825896 ?auto_825907 ) ) ( not ( = ?auto_825896 ?auto_825908 ) ) ( not ( = ?auto_825896 ?auto_825909 ) ) ( not ( = ?auto_825896 ?auto_825910 ) ) ( not ( = ?auto_825896 ?auto_825911 ) ) ( not ( = ?auto_825896 ?auto_825912 ) ) ( not ( = ?auto_825896 ?auto_825913 ) ) ( not ( = ?auto_825897 ?auto_825898 ) ) ( not ( = ?auto_825897 ?auto_825899 ) ) ( not ( = ?auto_825897 ?auto_825900 ) ) ( not ( = ?auto_825897 ?auto_825901 ) ) ( not ( = ?auto_825897 ?auto_825902 ) ) ( not ( = ?auto_825897 ?auto_825903 ) ) ( not ( = ?auto_825897 ?auto_825904 ) ) ( not ( = ?auto_825897 ?auto_825905 ) ) ( not ( = ?auto_825897 ?auto_825906 ) ) ( not ( = ?auto_825897 ?auto_825907 ) ) ( not ( = ?auto_825897 ?auto_825908 ) ) ( not ( = ?auto_825897 ?auto_825909 ) ) ( not ( = ?auto_825897 ?auto_825910 ) ) ( not ( = ?auto_825897 ?auto_825911 ) ) ( not ( = ?auto_825897 ?auto_825912 ) ) ( not ( = ?auto_825897 ?auto_825913 ) ) ( not ( = ?auto_825898 ?auto_825899 ) ) ( not ( = ?auto_825898 ?auto_825900 ) ) ( not ( = ?auto_825898 ?auto_825901 ) ) ( not ( = ?auto_825898 ?auto_825902 ) ) ( not ( = ?auto_825898 ?auto_825903 ) ) ( not ( = ?auto_825898 ?auto_825904 ) ) ( not ( = ?auto_825898 ?auto_825905 ) ) ( not ( = ?auto_825898 ?auto_825906 ) ) ( not ( = ?auto_825898 ?auto_825907 ) ) ( not ( = ?auto_825898 ?auto_825908 ) ) ( not ( = ?auto_825898 ?auto_825909 ) ) ( not ( = ?auto_825898 ?auto_825910 ) ) ( not ( = ?auto_825898 ?auto_825911 ) ) ( not ( = ?auto_825898 ?auto_825912 ) ) ( not ( = ?auto_825898 ?auto_825913 ) ) ( not ( = ?auto_825899 ?auto_825900 ) ) ( not ( = ?auto_825899 ?auto_825901 ) ) ( not ( = ?auto_825899 ?auto_825902 ) ) ( not ( = ?auto_825899 ?auto_825903 ) ) ( not ( = ?auto_825899 ?auto_825904 ) ) ( not ( = ?auto_825899 ?auto_825905 ) ) ( not ( = ?auto_825899 ?auto_825906 ) ) ( not ( = ?auto_825899 ?auto_825907 ) ) ( not ( = ?auto_825899 ?auto_825908 ) ) ( not ( = ?auto_825899 ?auto_825909 ) ) ( not ( = ?auto_825899 ?auto_825910 ) ) ( not ( = ?auto_825899 ?auto_825911 ) ) ( not ( = ?auto_825899 ?auto_825912 ) ) ( not ( = ?auto_825899 ?auto_825913 ) ) ( not ( = ?auto_825900 ?auto_825901 ) ) ( not ( = ?auto_825900 ?auto_825902 ) ) ( not ( = ?auto_825900 ?auto_825903 ) ) ( not ( = ?auto_825900 ?auto_825904 ) ) ( not ( = ?auto_825900 ?auto_825905 ) ) ( not ( = ?auto_825900 ?auto_825906 ) ) ( not ( = ?auto_825900 ?auto_825907 ) ) ( not ( = ?auto_825900 ?auto_825908 ) ) ( not ( = ?auto_825900 ?auto_825909 ) ) ( not ( = ?auto_825900 ?auto_825910 ) ) ( not ( = ?auto_825900 ?auto_825911 ) ) ( not ( = ?auto_825900 ?auto_825912 ) ) ( not ( = ?auto_825900 ?auto_825913 ) ) ( not ( = ?auto_825901 ?auto_825902 ) ) ( not ( = ?auto_825901 ?auto_825903 ) ) ( not ( = ?auto_825901 ?auto_825904 ) ) ( not ( = ?auto_825901 ?auto_825905 ) ) ( not ( = ?auto_825901 ?auto_825906 ) ) ( not ( = ?auto_825901 ?auto_825907 ) ) ( not ( = ?auto_825901 ?auto_825908 ) ) ( not ( = ?auto_825901 ?auto_825909 ) ) ( not ( = ?auto_825901 ?auto_825910 ) ) ( not ( = ?auto_825901 ?auto_825911 ) ) ( not ( = ?auto_825901 ?auto_825912 ) ) ( not ( = ?auto_825901 ?auto_825913 ) ) ( not ( = ?auto_825902 ?auto_825903 ) ) ( not ( = ?auto_825902 ?auto_825904 ) ) ( not ( = ?auto_825902 ?auto_825905 ) ) ( not ( = ?auto_825902 ?auto_825906 ) ) ( not ( = ?auto_825902 ?auto_825907 ) ) ( not ( = ?auto_825902 ?auto_825908 ) ) ( not ( = ?auto_825902 ?auto_825909 ) ) ( not ( = ?auto_825902 ?auto_825910 ) ) ( not ( = ?auto_825902 ?auto_825911 ) ) ( not ( = ?auto_825902 ?auto_825912 ) ) ( not ( = ?auto_825902 ?auto_825913 ) ) ( not ( = ?auto_825903 ?auto_825904 ) ) ( not ( = ?auto_825903 ?auto_825905 ) ) ( not ( = ?auto_825903 ?auto_825906 ) ) ( not ( = ?auto_825903 ?auto_825907 ) ) ( not ( = ?auto_825903 ?auto_825908 ) ) ( not ( = ?auto_825903 ?auto_825909 ) ) ( not ( = ?auto_825903 ?auto_825910 ) ) ( not ( = ?auto_825903 ?auto_825911 ) ) ( not ( = ?auto_825903 ?auto_825912 ) ) ( not ( = ?auto_825903 ?auto_825913 ) ) ( not ( = ?auto_825904 ?auto_825905 ) ) ( not ( = ?auto_825904 ?auto_825906 ) ) ( not ( = ?auto_825904 ?auto_825907 ) ) ( not ( = ?auto_825904 ?auto_825908 ) ) ( not ( = ?auto_825904 ?auto_825909 ) ) ( not ( = ?auto_825904 ?auto_825910 ) ) ( not ( = ?auto_825904 ?auto_825911 ) ) ( not ( = ?auto_825904 ?auto_825912 ) ) ( not ( = ?auto_825904 ?auto_825913 ) ) ( not ( = ?auto_825905 ?auto_825906 ) ) ( not ( = ?auto_825905 ?auto_825907 ) ) ( not ( = ?auto_825905 ?auto_825908 ) ) ( not ( = ?auto_825905 ?auto_825909 ) ) ( not ( = ?auto_825905 ?auto_825910 ) ) ( not ( = ?auto_825905 ?auto_825911 ) ) ( not ( = ?auto_825905 ?auto_825912 ) ) ( not ( = ?auto_825905 ?auto_825913 ) ) ( not ( = ?auto_825906 ?auto_825907 ) ) ( not ( = ?auto_825906 ?auto_825908 ) ) ( not ( = ?auto_825906 ?auto_825909 ) ) ( not ( = ?auto_825906 ?auto_825910 ) ) ( not ( = ?auto_825906 ?auto_825911 ) ) ( not ( = ?auto_825906 ?auto_825912 ) ) ( not ( = ?auto_825906 ?auto_825913 ) ) ( not ( = ?auto_825907 ?auto_825908 ) ) ( not ( = ?auto_825907 ?auto_825909 ) ) ( not ( = ?auto_825907 ?auto_825910 ) ) ( not ( = ?auto_825907 ?auto_825911 ) ) ( not ( = ?auto_825907 ?auto_825912 ) ) ( not ( = ?auto_825907 ?auto_825913 ) ) ( not ( = ?auto_825908 ?auto_825909 ) ) ( not ( = ?auto_825908 ?auto_825910 ) ) ( not ( = ?auto_825908 ?auto_825911 ) ) ( not ( = ?auto_825908 ?auto_825912 ) ) ( not ( = ?auto_825908 ?auto_825913 ) ) ( not ( = ?auto_825909 ?auto_825910 ) ) ( not ( = ?auto_825909 ?auto_825911 ) ) ( not ( = ?auto_825909 ?auto_825912 ) ) ( not ( = ?auto_825909 ?auto_825913 ) ) ( not ( = ?auto_825910 ?auto_825911 ) ) ( not ( = ?auto_825910 ?auto_825912 ) ) ( not ( = ?auto_825910 ?auto_825913 ) ) ( not ( = ?auto_825911 ?auto_825912 ) ) ( not ( = ?auto_825911 ?auto_825913 ) ) ( not ( = ?auto_825912 ?auto_825913 ) ) ( ON ?auto_825911 ?auto_825912 ) ( ON ?auto_825910 ?auto_825911 ) ( ON ?auto_825909 ?auto_825910 ) ( ON ?auto_825908 ?auto_825909 ) ( ON ?auto_825907 ?auto_825908 ) ( ON ?auto_825906 ?auto_825907 ) ( ON ?auto_825905 ?auto_825906 ) ( ON ?auto_825904 ?auto_825905 ) ( ON ?auto_825903 ?auto_825904 ) ( ON ?auto_825902 ?auto_825903 ) ( CLEAR ?auto_825900 ) ( ON ?auto_825901 ?auto_825902 ) ( CLEAR ?auto_825901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_825896 ?auto_825897 ?auto_825898 ?auto_825899 ?auto_825900 ?auto_825901 )
      ( MAKE-17PILE ?auto_825896 ?auto_825897 ?auto_825898 ?auto_825899 ?auto_825900 ?auto_825901 ?auto_825902 ?auto_825903 ?auto_825904 ?auto_825905 ?auto_825906 ?auto_825907 ?auto_825908 ?auto_825909 ?auto_825910 ?auto_825911 ?auto_825912 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_825966 - BLOCK
      ?auto_825967 - BLOCK
      ?auto_825968 - BLOCK
      ?auto_825969 - BLOCK
      ?auto_825970 - BLOCK
      ?auto_825971 - BLOCK
      ?auto_825972 - BLOCK
      ?auto_825973 - BLOCK
      ?auto_825974 - BLOCK
      ?auto_825975 - BLOCK
      ?auto_825976 - BLOCK
      ?auto_825977 - BLOCK
      ?auto_825978 - BLOCK
      ?auto_825979 - BLOCK
      ?auto_825980 - BLOCK
      ?auto_825981 - BLOCK
      ?auto_825982 - BLOCK
    )
    :vars
    (
      ?auto_825983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_825982 ?auto_825983 ) ( ON-TABLE ?auto_825966 ) ( ON ?auto_825967 ?auto_825966 ) ( ON ?auto_825968 ?auto_825967 ) ( ON ?auto_825969 ?auto_825968 ) ( not ( = ?auto_825966 ?auto_825967 ) ) ( not ( = ?auto_825966 ?auto_825968 ) ) ( not ( = ?auto_825966 ?auto_825969 ) ) ( not ( = ?auto_825966 ?auto_825970 ) ) ( not ( = ?auto_825966 ?auto_825971 ) ) ( not ( = ?auto_825966 ?auto_825972 ) ) ( not ( = ?auto_825966 ?auto_825973 ) ) ( not ( = ?auto_825966 ?auto_825974 ) ) ( not ( = ?auto_825966 ?auto_825975 ) ) ( not ( = ?auto_825966 ?auto_825976 ) ) ( not ( = ?auto_825966 ?auto_825977 ) ) ( not ( = ?auto_825966 ?auto_825978 ) ) ( not ( = ?auto_825966 ?auto_825979 ) ) ( not ( = ?auto_825966 ?auto_825980 ) ) ( not ( = ?auto_825966 ?auto_825981 ) ) ( not ( = ?auto_825966 ?auto_825982 ) ) ( not ( = ?auto_825966 ?auto_825983 ) ) ( not ( = ?auto_825967 ?auto_825968 ) ) ( not ( = ?auto_825967 ?auto_825969 ) ) ( not ( = ?auto_825967 ?auto_825970 ) ) ( not ( = ?auto_825967 ?auto_825971 ) ) ( not ( = ?auto_825967 ?auto_825972 ) ) ( not ( = ?auto_825967 ?auto_825973 ) ) ( not ( = ?auto_825967 ?auto_825974 ) ) ( not ( = ?auto_825967 ?auto_825975 ) ) ( not ( = ?auto_825967 ?auto_825976 ) ) ( not ( = ?auto_825967 ?auto_825977 ) ) ( not ( = ?auto_825967 ?auto_825978 ) ) ( not ( = ?auto_825967 ?auto_825979 ) ) ( not ( = ?auto_825967 ?auto_825980 ) ) ( not ( = ?auto_825967 ?auto_825981 ) ) ( not ( = ?auto_825967 ?auto_825982 ) ) ( not ( = ?auto_825967 ?auto_825983 ) ) ( not ( = ?auto_825968 ?auto_825969 ) ) ( not ( = ?auto_825968 ?auto_825970 ) ) ( not ( = ?auto_825968 ?auto_825971 ) ) ( not ( = ?auto_825968 ?auto_825972 ) ) ( not ( = ?auto_825968 ?auto_825973 ) ) ( not ( = ?auto_825968 ?auto_825974 ) ) ( not ( = ?auto_825968 ?auto_825975 ) ) ( not ( = ?auto_825968 ?auto_825976 ) ) ( not ( = ?auto_825968 ?auto_825977 ) ) ( not ( = ?auto_825968 ?auto_825978 ) ) ( not ( = ?auto_825968 ?auto_825979 ) ) ( not ( = ?auto_825968 ?auto_825980 ) ) ( not ( = ?auto_825968 ?auto_825981 ) ) ( not ( = ?auto_825968 ?auto_825982 ) ) ( not ( = ?auto_825968 ?auto_825983 ) ) ( not ( = ?auto_825969 ?auto_825970 ) ) ( not ( = ?auto_825969 ?auto_825971 ) ) ( not ( = ?auto_825969 ?auto_825972 ) ) ( not ( = ?auto_825969 ?auto_825973 ) ) ( not ( = ?auto_825969 ?auto_825974 ) ) ( not ( = ?auto_825969 ?auto_825975 ) ) ( not ( = ?auto_825969 ?auto_825976 ) ) ( not ( = ?auto_825969 ?auto_825977 ) ) ( not ( = ?auto_825969 ?auto_825978 ) ) ( not ( = ?auto_825969 ?auto_825979 ) ) ( not ( = ?auto_825969 ?auto_825980 ) ) ( not ( = ?auto_825969 ?auto_825981 ) ) ( not ( = ?auto_825969 ?auto_825982 ) ) ( not ( = ?auto_825969 ?auto_825983 ) ) ( not ( = ?auto_825970 ?auto_825971 ) ) ( not ( = ?auto_825970 ?auto_825972 ) ) ( not ( = ?auto_825970 ?auto_825973 ) ) ( not ( = ?auto_825970 ?auto_825974 ) ) ( not ( = ?auto_825970 ?auto_825975 ) ) ( not ( = ?auto_825970 ?auto_825976 ) ) ( not ( = ?auto_825970 ?auto_825977 ) ) ( not ( = ?auto_825970 ?auto_825978 ) ) ( not ( = ?auto_825970 ?auto_825979 ) ) ( not ( = ?auto_825970 ?auto_825980 ) ) ( not ( = ?auto_825970 ?auto_825981 ) ) ( not ( = ?auto_825970 ?auto_825982 ) ) ( not ( = ?auto_825970 ?auto_825983 ) ) ( not ( = ?auto_825971 ?auto_825972 ) ) ( not ( = ?auto_825971 ?auto_825973 ) ) ( not ( = ?auto_825971 ?auto_825974 ) ) ( not ( = ?auto_825971 ?auto_825975 ) ) ( not ( = ?auto_825971 ?auto_825976 ) ) ( not ( = ?auto_825971 ?auto_825977 ) ) ( not ( = ?auto_825971 ?auto_825978 ) ) ( not ( = ?auto_825971 ?auto_825979 ) ) ( not ( = ?auto_825971 ?auto_825980 ) ) ( not ( = ?auto_825971 ?auto_825981 ) ) ( not ( = ?auto_825971 ?auto_825982 ) ) ( not ( = ?auto_825971 ?auto_825983 ) ) ( not ( = ?auto_825972 ?auto_825973 ) ) ( not ( = ?auto_825972 ?auto_825974 ) ) ( not ( = ?auto_825972 ?auto_825975 ) ) ( not ( = ?auto_825972 ?auto_825976 ) ) ( not ( = ?auto_825972 ?auto_825977 ) ) ( not ( = ?auto_825972 ?auto_825978 ) ) ( not ( = ?auto_825972 ?auto_825979 ) ) ( not ( = ?auto_825972 ?auto_825980 ) ) ( not ( = ?auto_825972 ?auto_825981 ) ) ( not ( = ?auto_825972 ?auto_825982 ) ) ( not ( = ?auto_825972 ?auto_825983 ) ) ( not ( = ?auto_825973 ?auto_825974 ) ) ( not ( = ?auto_825973 ?auto_825975 ) ) ( not ( = ?auto_825973 ?auto_825976 ) ) ( not ( = ?auto_825973 ?auto_825977 ) ) ( not ( = ?auto_825973 ?auto_825978 ) ) ( not ( = ?auto_825973 ?auto_825979 ) ) ( not ( = ?auto_825973 ?auto_825980 ) ) ( not ( = ?auto_825973 ?auto_825981 ) ) ( not ( = ?auto_825973 ?auto_825982 ) ) ( not ( = ?auto_825973 ?auto_825983 ) ) ( not ( = ?auto_825974 ?auto_825975 ) ) ( not ( = ?auto_825974 ?auto_825976 ) ) ( not ( = ?auto_825974 ?auto_825977 ) ) ( not ( = ?auto_825974 ?auto_825978 ) ) ( not ( = ?auto_825974 ?auto_825979 ) ) ( not ( = ?auto_825974 ?auto_825980 ) ) ( not ( = ?auto_825974 ?auto_825981 ) ) ( not ( = ?auto_825974 ?auto_825982 ) ) ( not ( = ?auto_825974 ?auto_825983 ) ) ( not ( = ?auto_825975 ?auto_825976 ) ) ( not ( = ?auto_825975 ?auto_825977 ) ) ( not ( = ?auto_825975 ?auto_825978 ) ) ( not ( = ?auto_825975 ?auto_825979 ) ) ( not ( = ?auto_825975 ?auto_825980 ) ) ( not ( = ?auto_825975 ?auto_825981 ) ) ( not ( = ?auto_825975 ?auto_825982 ) ) ( not ( = ?auto_825975 ?auto_825983 ) ) ( not ( = ?auto_825976 ?auto_825977 ) ) ( not ( = ?auto_825976 ?auto_825978 ) ) ( not ( = ?auto_825976 ?auto_825979 ) ) ( not ( = ?auto_825976 ?auto_825980 ) ) ( not ( = ?auto_825976 ?auto_825981 ) ) ( not ( = ?auto_825976 ?auto_825982 ) ) ( not ( = ?auto_825976 ?auto_825983 ) ) ( not ( = ?auto_825977 ?auto_825978 ) ) ( not ( = ?auto_825977 ?auto_825979 ) ) ( not ( = ?auto_825977 ?auto_825980 ) ) ( not ( = ?auto_825977 ?auto_825981 ) ) ( not ( = ?auto_825977 ?auto_825982 ) ) ( not ( = ?auto_825977 ?auto_825983 ) ) ( not ( = ?auto_825978 ?auto_825979 ) ) ( not ( = ?auto_825978 ?auto_825980 ) ) ( not ( = ?auto_825978 ?auto_825981 ) ) ( not ( = ?auto_825978 ?auto_825982 ) ) ( not ( = ?auto_825978 ?auto_825983 ) ) ( not ( = ?auto_825979 ?auto_825980 ) ) ( not ( = ?auto_825979 ?auto_825981 ) ) ( not ( = ?auto_825979 ?auto_825982 ) ) ( not ( = ?auto_825979 ?auto_825983 ) ) ( not ( = ?auto_825980 ?auto_825981 ) ) ( not ( = ?auto_825980 ?auto_825982 ) ) ( not ( = ?auto_825980 ?auto_825983 ) ) ( not ( = ?auto_825981 ?auto_825982 ) ) ( not ( = ?auto_825981 ?auto_825983 ) ) ( not ( = ?auto_825982 ?auto_825983 ) ) ( ON ?auto_825981 ?auto_825982 ) ( ON ?auto_825980 ?auto_825981 ) ( ON ?auto_825979 ?auto_825980 ) ( ON ?auto_825978 ?auto_825979 ) ( ON ?auto_825977 ?auto_825978 ) ( ON ?auto_825976 ?auto_825977 ) ( ON ?auto_825975 ?auto_825976 ) ( ON ?auto_825974 ?auto_825975 ) ( ON ?auto_825973 ?auto_825974 ) ( ON ?auto_825972 ?auto_825973 ) ( ON ?auto_825971 ?auto_825972 ) ( CLEAR ?auto_825969 ) ( ON ?auto_825970 ?auto_825971 ) ( CLEAR ?auto_825970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_825966 ?auto_825967 ?auto_825968 ?auto_825969 ?auto_825970 )
      ( MAKE-17PILE ?auto_825966 ?auto_825967 ?auto_825968 ?auto_825969 ?auto_825970 ?auto_825971 ?auto_825972 ?auto_825973 ?auto_825974 ?auto_825975 ?auto_825976 ?auto_825977 ?auto_825978 ?auto_825979 ?auto_825980 ?auto_825981 ?auto_825982 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_826036 - BLOCK
      ?auto_826037 - BLOCK
      ?auto_826038 - BLOCK
      ?auto_826039 - BLOCK
      ?auto_826040 - BLOCK
      ?auto_826041 - BLOCK
      ?auto_826042 - BLOCK
      ?auto_826043 - BLOCK
      ?auto_826044 - BLOCK
      ?auto_826045 - BLOCK
      ?auto_826046 - BLOCK
      ?auto_826047 - BLOCK
      ?auto_826048 - BLOCK
      ?auto_826049 - BLOCK
      ?auto_826050 - BLOCK
      ?auto_826051 - BLOCK
      ?auto_826052 - BLOCK
    )
    :vars
    (
      ?auto_826053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826052 ?auto_826053 ) ( ON-TABLE ?auto_826036 ) ( ON ?auto_826037 ?auto_826036 ) ( ON ?auto_826038 ?auto_826037 ) ( not ( = ?auto_826036 ?auto_826037 ) ) ( not ( = ?auto_826036 ?auto_826038 ) ) ( not ( = ?auto_826036 ?auto_826039 ) ) ( not ( = ?auto_826036 ?auto_826040 ) ) ( not ( = ?auto_826036 ?auto_826041 ) ) ( not ( = ?auto_826036 ?auto_826042 ) ) ( not ( = ?auto_826036 ?auto_826043 ) ) ( not ( = ?auto_826036 ?auto_826044 ) ) ( not ( = ?auto_826036 ?auto_826045 ) ) ( not ( = ?auto_826036 ?auto_826046 ) ) ( not ( = ?auto_826036 ?auto_826047 ) ) ( not ( = ?auto_826036 ?auto_826048 ) ) ( not ( = ?auto_826036 ?auto_826049 ) ) ( not ( = ?auto_826036 ?auto_826050 ) ) ( not ( = ?auto_826036 ?auto_826051 ) ) ( not ( = ?auto_826036 ?auto_826052 ) ) ( not ( = ?auto_826036 ?auto_826053 ) ) ( not ( = ?auto_826037 ?auto_826038 ) ) ( not ( = ?auto_826037 ?auto_826039 ) ) ( not ( = ?auto_826037 ?auto_826040 ) ) ( not ( = ?auto_826037 ?auto_826041 ) ) ( not ( = ?auto_826037 ?auto_826042 ) ) ( not ( = ?auto_826037 ?auto_826043 ) ) ( not ( = ?auto_826037 ?auto_826044 ) ) ( not ( = ?auto_826037 ?auto_826045 ) ) ( not ( = ?auto_826037 ?auto_826046 ) ) ( not ( = ?auto_826037 ?auto_826047 ) ) ( not ( = ?auto_826037 ?auto_826048 ) ) ( not ( = ?auto_826037 ?auto_826049 ) ) ( not ( = ?auto_826037 ?auto_826050 ) ) ( not ( = ?auto_826037 ?auto_826051 ) ) ( not ( = ?auto_826037 ?auto_826052 ) ) ( not ( = ?auto_826037 ?auto_826053 ) ) ( not ( = ?auto_826038 ?auto_826039 ) ) ( not ( = ?auto_826038 ?auto_826040 ) ) ( not ( = ?auto_826038 ?auto_826041 ) ) ( not ( = ?auto_826038 ?auto_826042 ) ) ( not ( = ?auto_826038 ?auto_826043 ) ) ( not ( = ?auto_826038 ?auto_826044 ) ) ( not ( = ?auto_826038 ?auto_826045 ) ) ( not ( = ?auto_826038 ?auto_826046 ) ) ( not ( = ?auto_826038 ?auto_826047 ) ) ( not ( = ?auto_826038 ?auto_826048 ) ) ( not ( = ?auto_826038 ?auto_826049 ) ) ( not ( = ?auto_826038 ?auto_826050 ) ) ( not ( = ?auto_826038 ?auto_826051 ) ) ( not ( = ?auto_826038 ?auto_826052 ) ) ( not ( = ?auto_826038 ?auto_826053 ) ) ( not ( = ?auto_826039 ?auto_826040 ) ) ( not ( = ?auto_826039 ?auto_826041 ) ) ( not ( = ?auto_826039 ?auto_826042 ) ) ( not ( = ?auto_826039 ?auto_826043 ) ) ( not ( = ?auto_826039 ?auto_826044 ) ) ( not ( = ?auto_826039 ?auto_826045 ) ) ( not ( = ?auto_826039 ?auto_826046 ) ) ( not ( = ?auto_826039 ?auto_826047 ) ) ( not ( = ?auto_826039 ?auto_826048 ) ) ( not ( = ?auto_826039 ?auto_826049 ) ) ( not ( = ?auto_826039 ?auto_826050 ) ) ( not ( = ?auto_826039 ?auto_826051 ) ) ( not ( = ?auto_826039 ?auto_826052 ) ) ( not ( = ?auto_826039 ?auto_826053 ) ) ( not ( = ?auto_826040 ?auto_826041 ) ) ( not ( = ?auto_826040 ?auto_826042 ) ) ( not ( = ?auto_826040 ?auto_826043 ) ) ( not ( = ?auto_826040 ?auto_826044 ) ) ( not ( = ?auto_826040 ?auto_826045 ) ) ( not ( = ?auto_826040 ?auto_826046 ) ) ( not ( = ?auto_826040 ?auto_826047 ) ) ( not ( = ?auto_826040 ?auto_826048 ) ) ( not ( = ?auto_826040 ?auto_826049 ) ) ( not ( = ?auto_826040 ?auto_826050 ) ) ( not ( = ?auto_826040 ?auto_826051 ) ) ( not ( = ?auto_826040 ?auto_826052 ) ) ( not ( = ?auto_826040 ?auto_826053 ) ) ( not ( = ?auto_826041 ?auto_826042 ) ) ( not ( = ?auto_826041 ?auto_826043 ) ) ( not ( = ?auto_826041 ?auto_826044 ) ) ( not ( = ?auto_826041 ?auto_826045 ) ) ( not ( = ?auto_826041 ?auto_826046 ) ) ( not ( = ?auto_826041 ?auto_826047 ) ) ( not ( = ?auto_826041 ?auto_826048 ) ) ( not ( = ?auto_826041 ?auto_826049 ) ) ( not ( = ?auto_826041 ?auto_826050 ) ) ( not ( = ?auto_826041 ?auto_826051 ) ) ( not ( = ?auto_826041 ?auto_826052 ) ) ( not ( = ?auto_826041 ?auto_826053 ) ) ( not ( = ?auto_826042 ?auto_826043 ) ) ( not ( = ?auto_826042 ?auto_826044 ) ) ( not ( = ?auto_826042 ?auto_826045 ) ) ( not ( = ?auto_826042 ?auto_826046 ) ) ( not ( = ?auto_826042 ?auto_826047 ) ) ( not ( = ?auto_826042 ?auto_826048 ) ) ( not ( = ?auto_826042 ?auto_826049 ) ) ( not ( = ?auto_826042 ?auto_826050 ) ) ( not ( = ?auto_826042 ?auto_826051 ) ) ( not ( = ?auto_826042 ?auto_826052 ) ) ( not ( = ?auto_826042 ?auto_826053 ) ) ( not ( = ?auto_826043 ?auto_826044 ) ) ( not ( = ?auto_826043 ?auto_826045 ) ) ( not ( = ?auto_826043 ?auto_826046 ) ) ( not ( = ?auto_826043 ?auto_826047 ) ) ( not ( = ?auto_826043 ?auto_826048 ) ) ( not ( = ?auto_826043 ?auto_826049 ) ) ( not ( = ?auto_826043 ?auto_826050 ) ) ( not ( = ?auto_826043 ?auto_826051 ) ) ( not ( = ?auto_826043 ?auto_826052 ) ) ( not ( = ?auto_826043 ?auto_826053 ) ) ( not ( = ?auto_826044 ?auto_826045 ) ) ( not ( = ?auto_826044 ?auto_826046 ) ) ( not ( = ?auto_826044 ?auto_826047 ) ) ( not ( = ?auto_826044 ?auto_826048 ) ) ( not ( = ?auto_826044 ?auto_826049 ) ) ( not ( = ?auto_826044 ?auto_826050 ) ) ( not ( = ?auto_826044 ?auto_826051 ) ) ( not ( = ?auto_826044 ?auto_826052 ) ) ( not ( = ?auto_826044 ?auto_826053 ) ) ( not ( = ?auto_826045 ?auto_826046 ) ) ( not ( = ?auto_826045 ?auto_826047 ) ) ( not ( = ?auto_826045 ?auto_826048 ) ) ( not ( = ?auto_826045 ?auto_826049 ) ) ( not ( = ?auto_826045 ?auto_826050 ) ) ( not ( = ?auto_826045 ?auto_826051 ) ) ( not ( = ?auto_826045 ?auto_826052 ) ) ( not ( = ?auto_826045 ?auto_826053 ) ) ( not ( = ?auto_826046 ?auto_826047 ) ) ( not ( = ?auto_826046 ?auto_826048 ) ) ( not ( = ?auto_826046 ?auto_826049 ) ) ( not ( = ?auto_826046 ?auto_826050 ) ) ( not ( = ?auto_826046 ?auto_826051 ) ) ( not ( = ?auto_826046 ?auto_826052 ) ) ( not ( = ?auto_826046 ?auto_826053 ) ) ( not ( = ?auto_826047 ?auto_826048 ) ) ( not ( = ?auto_826047 ?auto_826049 ) ) ( not ( = ?auto_826047 ?auto_826050 ) ) ( not ( = ?auto_826047 ?auto_826051 ) ) ( not ( = ?auto_826047 ?auto_826052 ) ) ( not ( = ?auto_826047 ?auto_826053 ) ) ( not ( = ?auto_826048 ?auto_826049 ) ) ( not ( = ?auto_826048 ?auto_826050 ) ) ( not ( = ?auto_826048 ?auto_826051 ) ) ( not ( = ?auto_826048 ?auto_826052 ) ) ( not ( = ?auto_826048 ?auto_826053 ) ) ( not ( = ?auto_826049 ?auto_826050 ) ) ( not ( = ?auto_826049 ?auto_826051 ) ) ( not ( = ?auto_826049 ?auto_826052 ) ) ( not ( = ?auto_826049 ?auto_826053 ) ) ( not ( = ?auto_826050 ?auto_826051 ) ) ( not ( = ?auto_826050 ?auto_826052 ) ) ( not ( = ?auto_826050 ?auto_826053 ) ) ( not ( = ?auto_826051 ?auto_826052 ) ) ( not ( = ?auto_826051 ?auto_826053 ) ) ( not ( = ?auto_826052 ?auto_826053 ) ) ( ON ?auto_826051 ?auto_826052 ) ( ON ?auto_826050 ?auto_826051 ) ( ON ?auto_826049 ?auto_826050 ) ( ON ?auto_826048 ?auto_826049 ) ( ON ?auto_826047 ?auto_826048 ) ( ON ?auto_826046 ?auto_826047 ) ( ON ?auto_826045 ?auto_826046 ) ( ON ?auto_826044 ?auto_826045 ) ( ON ?auto_826043 ?auto_826044 ) ( ON ?auto_826042 ?auto_826043 ) ( ON ?auto_826041 ?auto_826042 ) ( ON ?auto_826040 ?auto_826041 ) ( CLEAR ?auto_826038 ) ( ON ?auto_826039 ?auto_826040 ) ( CLEAR ?auto_826039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_826036 ?auto_826037 ?auto_826038 ?auto_826039 )
      ( MAKE-17PILE ?auto_826036 ?auto_826037 ?auto_826038 ?auto_826039 ?auto_826040 ?auto_826041 ?auto_826042 ?auto_826043 ?auto_826044 ?auto_826045 ?auto_826046 ?auto_826047 ?auto_826048 ?auto_826049 ?auto_826050 ?auto_826051 ?auto_826052 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_826106 - BLOCK
      ?auto_826107 - BLOCK
      ?auto_826108 - BLOCK
      ?auto_826109 - BLOCK
      ?auto_826110 - BLOCK
      ?auto_826111 - BLOCK
      ?auto_826112 - BLOCK
      ?auto_826113 - BLOCK
      ?auto_826114 - BLOCK
      ?auto_826115 - BLOCK
      ?auto_826116 - BLOCK
      ?auto_826117 - BLOCK
      ?auto_826118 - BLOCK
      ?auto_826119 - BLOCK
      ?auto_826120 - BLOCK
      ?auto_826121 - BLOCK
      ?auto_826122 - BLOCK
    )
    :vars
    (
      ?auto_826123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826122 ?auto_826123 ) ( ON-TABLE ?auto_826106 ) ( ON ?auto_826107 ?auto_826106 ) ( not ( = ?auto_826106 ?auto_826107 ) ) ( not ( = ?auto_826106 ?auto_826108 ) ) ( not ( = ?auto_826106 ?auto_826109 ) ) ( not ( = ?auto_826106 ?auto_826110 ) ) ( not ( = ?auto_826106 ?auto_826111 ) ) ( not ( = ?auto_826106 ?auto_826112 ) ) ( not ( = ?auto_826106 ?auto_826113 ) ) ( not ( = ?auto_826106 ?auto_826114 ) ) ( not ( = ?auto_826106 ?auto_826115 ) ) ( not ( = ?auto_826106 ?auto_826116 ) ) ( not ( = ?auto_826106 ?auto_826117 ) ) ( not ( = ?auto_826106 ?auto_826118 ) ) ( not ( = ?auto_826106 ?auto_826119 ) ) ( not ( = ?auto_826106 ?auto_826120 ) ) ( not ( = ?auto_826106 ?auto_826121 ) ) ( not ( = ?auto_826106 ?auto_826122 ) ) ( not ( = ?auto_826106 ?auto_826123 ) ) ( not ( = ?auto_826107 ?auto_826108 ) ) ( not ( = ?auto_826107 ?auto_826109 ) ) ( not ( = ?auto_826107 ?auto_826110 ) ) ( not ( = ?auto_826107 ?auto_826111 ) ) ( not ( = ?auto_826107 ?auto_826112 ) ) ( not ( = ?auto_826107 ?auto_826113 ) ) ( not ( = ?auto_826107 ?auto_826114 ) ) ( not ( = ?auto_826107 ?auto_826115 ) ) ( not ( = ?auto_826107 ?auto_826116 ) ) ( not ( = ?auto_826107 ?auto_826117 ) ) ( not ( = ?auto_826107 ?auto_826118 ) ) ( not ( = ?auto_826107 ?auto_826119 ) ) ( not ( = ?auto_826107 ?auto_826120 ) ) ( not ( = ?auto_826107 ?auto_826121 ) ) ( not ( = ?auto_826107 ?auto_826122 ) ) ( not ( = ?auto_826107 ?auto_826123 ) ) ( not ( = ?auto_826108 ?auto_826109 ) ) ( not ( = ?auto_826108 ?auto_826110 ) ) ( not ( = ?auto_826108 ?auto_826111 ) ) ( not ( = ?auto_826108 ?auto_826112 ) ) ( not ( = ?auto_826108 ?auto_826113 ) ) ( not ( = ?auto_826108 ?auto_826114 ) ) ( not ( = ?auto_826108 ?auto_826115 ) ) ( not ( = ?auto_826108 ?auto_826116 ) ) ( not ( = ?auto_826108 ?auto_826117 ) ) ( not ( = ?auto_826108 ?auto_826118 ) ) ( not ( = ?auto_826108 ?auto_826119 ) ) ( not ( = ?auto_826108 ?auto_826120 ) ) ( not ( = ?auto_826108 ?auto_826121 ) ) ( not ( = ?auto_826108 ?auto_826122 ) ) ( not ( = ?auto_826108 ?auto_826123 ) ) ( not ( = ?auto_826109 ?auto_826110 ) ) ( not ( = ?auto_826109 ?auto_826111 ) ) ( not ( = ?auto_826109 ?auto_826112 ) ) ( not ( = ?auto_826109 ?auto_826113 ) ) ( not ( = ?auto_826109 ?auto_826114 ) ) ( not ( = ?auto_826109 ?auto_826115 ) ) ( not ( = ?auto_826109 ?auto_826116 ) ) ( not ( = ?auto_826109 ?auto_826117 ) ) ( not ( = ?auto_826109 ?auto_826118 ) ) ( not ( = ?auto_826109 ?auto_826119 ) ) ( not ( = ?auto_826109 ?auto_826120 ) ) ( not ( = ?auto_826109 ?auto_826121 ) ) ( not ( = ?auto_826109 ?auto_826122 ) ) ( not ( = ?auto_826109 ?auto_826123 ) ) ( not ( = ?auto_826110 ?auto_826111 ) ) ( not ( = ?auto_826110 ?auto_826112 ) ) ( not ( = ?auto_826110 ?auto_826113 ) ) ( not ( = ?auto_826110 ?auto_826114 ) ) ( not ( = ?auto_826110 ?auto_826115 ) ) ( not ( = ?auto_826110 ?auto_826116 ) ) ( not ( = ?auto_826110 ?auto_826117 ) ) ( not ( = ?auto_826110 ?auto_826118 ) ) ( not ( = ?auto_826110 ?auto_826119 ) ) ( not ( = ?auto_826110 ?auto_826120 ) ) ( not ( = ?auto_826110 ?auto_826121 ) ) ( not ( = ?auto_826110 ?auto_826122 ) ) ( not ( = ?auto_826110 ?auto_826123 ) ) ( not ( = ?auto_826111 ?auto_826112 ) ) ( not ( = ?auto_826111 ?auto_826113 ) ) ( not ( = ?auto_826111 ?auto_826114 ) ) ( not ( = ?auto_826111 ?auto_826115 ) ) ( not ( = ?auto_826111 ?auto_826116 ) ) ( not ( = ?auto_826111 ?auto_826117 ) ) ( not ( = ?auto_826111 ?auto_826118 ) ) ( not ( = ?auto_826111 ?auto_826119 ) ) ( not ( = ?auto_826111 ?auto_826120 ) ) ( not ( = ?auto_826111 ?auto_826121 ) ) ( not ( = ?auto_826111 ?auto_826122 ) ) ( not ( = ?auto_826111 ?auto_826123 ) ) ( not ( = ?auto_826112 ?auto_826113 ) ) ( not ( = ?auto_826112 ?auto_826114 ) ) ( not ( = ?auto_826112 ?auto_826115 ) ) ( not ( = ?auto_826112 ?auto_826116 ) ) ( not ( = ?auto_826112 ?auto_826117 ) ) ( not ( = ?auto_826112 ?auto_826118 ) ) ( not ( = ?auto_826112 ?auto_826119 ) ) ( not ( = ?auto_826112 ?auto_826120 ) ) ( not ( = ?auto_826112 ?auto_826121 ) ) ( not ( = ?auto_826112 ?auto_826122 ) ) ( not ( = ?auto_826112 ?auto_826123 ) ) ( not ( = ?auto_826113 ?auto_826114 ) ) ( not ( = ?auto_826113 ?auto_826115 ) ) ( not ( = ?auto_826113 ?auto_826116 ) ) ( not ( = ?auto_826113 ?auto_826117 ) ) ( not ( = ?auto_826113 ?auto_826118 ) ) ( not ( = ?auto_826113 ?auto_826119 ) ) ( not ( = ?auto_826113 ?auto_826120 ) ) ( not ( = ?auto_826113 ?auto_826121 ) ) ( not ( = ?auto_826113 ?auto_826122 ) ) ( not ( = ?auto_826113 ?auto_826123 ) ) ( not ( = ?auto_826114 ?auto_826115 ) ) ( not ( = ?auto_826114 ?auto_826116 ) ) ( not ( = ?auto_826114 ?auto_826117 ) ) ( not ( = ?auto_826114 ?auto_826118 ) ) ( not ( = ?auto_826114 ?auto_826119 ) ) ( not ( = ?auto_826114 ?auto_826120 ) ) ( not ( = ?auto_826114 ?auto_826121 ) ) ( not ( = ?auto_826114 ?auto_826122 ) ) ( not ( = ?auto_826114 ?auto_826123 ) ) ( not ( = ?auto_826115 ?auto_826116 ) ) ( not ( = ?auto_826115 ?auto_826117 ) ) ( not ( = ?auto_826115 ?auto_826118 ) ) ( not ( = ?auto_826115 ?auto_826119 ) ) ( not ( = ?auto_826115 ?auto_826120 ) ) ( not ( = ?auto_826115 ?auto_826121 ) ) ( not ( = ?auto_826115 ?auto_826122 ) ) ( not ( = ?auto_826115 ?auto_826123 ) ) ( not ( = ?auto_826116 ?auto_826117 ) ) ( not ( = ?auto_826116 ?auto_826118 ) ) ( not ( = ?auto_826116 ?auto_826119 ) ) ( not ( = ?auto_826116 ?auto_826120 ) ) ( not ( = ?auto_826116 ?auto_826121 ) ) ( not ( = ?auto_826116 ?auto_826122 ) ) ( not ( = ?auto_826116 ?auto_826123 ) ) ( not ( = ?auto_826117 ?auto_826118 ) ) ( not ( = ?auto_826117 ?auto_826119 ) ) ( not ( = ?auto_826117 ?auto_826120 ) ) ( not ( = ?auto_826117 ?auto_826121 ) ) ( not ( = ?auto_826117 ?auto_826122 ) ) ( not ( = ?auto_826117 ?auto_826123 ) ) ( not ( = ?auto_826118 ?auto_826119 ) ) ( not ( = ?auto_826118 ?auto_826120 ) ) ( not ( = ?auto_826118 ?auto_826121 ) ) ( not ( = ?auto_826118 ?auto_826122 ) ) ( not ( = ?auto_826118 ?auto_826123 ) ) ( not ( = ?auto_826119 ?auto_826120 ) ) ( not ( = ?auto_826119 ?auto_826121 ) ) ( not ( = ?auto_826119 ?auto_826122 ) ) ( not ( = ?auto_826119 ?auto_826123 ) ) ( not ( = ?auto_826120 ?auto_826121 ) ) ( not ( = ?auto_826120 ?auto_826122 ) ) ( not ( = ?auto_826120 ?auto_826123 ) ) ( not ( = ?auto_826121 ?auto_826122 ) ) ( not ( = ?auto_826121 ?auto_826123 ) ) ( not ( = ?auto_826122 ?auto_826123 ) ) ( ON ?auto_826121 ?auto_826122 ) ( ON ?auto_826120 ?auto_826121 ) ( ON ?auto_826119 ?auto_826120 ) ( ON ?auto_826118 ?auto_826119 ) ( ON ?auto_826117 ?auto_826118 ) ( ON ?auto_826116 ?auto_826117 ) ( ON ?auto_826115 ?auto_826116 ) ( ON ?auto_826114 ?auto_826115 ) ( ON ?auto_826113 ?auto_826114 ) ( ON ?auto_826112 ?auto_826113 ) ( ON ?auto_826111 ?auto_826112 ) ( ON ?auto_826110 ?auto_826111 ) ( ON ?auto_826109 ?auto_826110 ) ( CLEAR ?auto_826107 ) ( ON ?auto_826108 ?auto_826109 ) ( CLEAR ?auto_826108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_826106 ?auto_826107 ?auto_826108 )
      ( MAKE-17PILE ?auto_826106 ?auto_826107 ?auto_826108 ?auto_826109 ?auto_826110 ?auto_826111 ?auto_826112 ?auto_826113 ?auto_826114 ?auto_826115 ?auto_826116 ?auto_826117 ?auto_826118 ?auto_826119 ?auto_826120 ?auto_826121 ?auto_826122 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_826176 - BLOCK
      ?auto_826177 - BLOCK
      ?auto_826178 - BLOCK
      ?auto_826179 - BLOCK
      ?auto_826180 - BLOCK
      ?auto_826181 - BLOCK
      ?auto_826182 - BLOCK
      ?auto_826183 - BLOCK
      ?auto_826184 - BLOCK
      ?auto_826185 - BLOCK
      ?auto_826186 - BLOCK
      ?auto_826187 - BLOCK
      ?auto_826188 - BLOCK
      ?auto_826189 - BLOCK
      ?auto_826190 - BLOCK
      ?auto_826191 - BLOCK
      ?auto_826192 - BLOCK
    )
    :vars
    (
      ?auto_826193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826192 ?auto_826193 ) ( ON-TABLE ?auto_826176 ) ( not ( = ?auto_826176 ?auto_826177 ) ) ( not ( = ?auto_826176 ?auto_826178 ) ) ( not ( = ?auto_826176 ?auto_826179 ) ) ( not ( = ?auto_826176 ?auto_826180 ) ) ( not ( = ?auto_826176 ?auto_826181 ) ) ( not ( = ?auto_826176 ?auto_826182 ) ) ( not ( = ?auto_826176 ?auto_826183 ) ) ( not ( = ?auto_826176 ?auto_826184 ) ) ( not ( = ?auto_826176 ?auto_826185 ) ) ( not ( = ?auto_826176 ?auto_826186 ) ) ( not ( = ?auto_826176 ?auto_826187 ) ) ( not ( = ?auto_826176 ?auto_826188 ) ) ( not ( = ?auto_826176 ?auto_826189 ) ) ( not ( = ?auto_826176 ?auto_826190 ) ) ( not ( = ?auto_826176 ?auto_826191 ) ) ( not ( = ?auto_826176 ?auto_826192 ) ) ( not ( = ?auto_826176 ?auto_826193 ) ) ( not ( = ?auto_826177 ?auto_826178 ) ) ( not ( = ?auto_826177 ?auto_826179 ) ) ( not ( = ?auto_826177 ?auto_826180 ) ) ( not ( = ?auto_826177 ?auto_826181 ) ) ( not ( = ?auto_826177 ?auto_826182 ) ) ( not ( = ?auto_826177 ?auto_826183 ) ) ( not ( = ?auto_826177 ?auto_826184 ) ) ( not ( = ?auto_826177 ?auto_826185 ) ) ( not ( = ?auto_826177 ?auto_826186 ) ) ( not ( = ?auto_826177 ?auto_826187 ) ) ( not ( = ?auto_826177 ?auto_826188 ) ) ( not ( = ?auto_826177 ?auto_826189 ) ) ( not ( = ?auto_826177 ?auto_826190 ) ) ( not ( = ?auto_826177 ?auto_826191 ) ) ( not ( = ?auto_826177 ?auto_826192 ) ) ( not ( = ?auto_826177 ?auto_826193 ) ) ( not ( = ?auto_826178 ?auto_826179 ) ) ( not ( = ?auto_826178 ?auto_826180 ) ) ( not ( = ?auto_826178 ?auto_826181 ) ) ( not ( = ?auto_826178 ?auto_826182 ) ) ( not ( = ?auto_826178 ?auto_826183 ) ) ( not ( = ?auto_826178 ?auto_826184 ) ) ( not ( = ?auto_826178 ?auto_826185 ) ) ( not ( = ?auto_826178 ?auto_826186 ) ) ( not ( = ?auto_826178 ?auto_826187 ) ) ( not ( = ?auto_826178 ?auto_826188 ) ) ( not ( = ?auto_826178 ?auto_826189 ) ) ( not ( = ?auto_826178 ?auto_826190 ) ) ( not ( = ?auto_826178 ?auto_826191 ) ) ( not ( = ?auto_826178 ?auto_826192 ) ) ( not ( = ?auto_826178 ?auto_826193 ) ) ( not ( = ?auto_826179 ?auto_826180 ) ) ( not ( = ?auto_826179 ?auto_826181 ) ) ( not ( = ?auto_826179 ?auto_826182 ) ) ( not ( = ?auto_826179 ?auto_826183 ) ) ( not ( = ?auto_826179 ?auto_826184 ) ) ( not ( = ?auto_826179 ?auto_826185 ) ) ( not ( = ?auto_826179 ?auto_826186 ) ) ( not ( = ?auto_826179 ?auto_826187 ) ) ( not ( = ?auto_826179 ?auto_826188 ) ) ( not ( = ?auto_826179 ?auto_826189 ) ) ( not ( = ?auto_826179 ?auto_826190 ) ) ( not ( = ?auto_826179 ?auto_826191 ) ) ( not ( = ?auto_826179 ?auto_826192 ) ) ( not ( = ?auto_826179 ?auto_826193 ) ) ( not ( = ?auto_826180 ?auto_826181 ) ) ( not ( = ?auto_826180 ?auto_826182 ) ) ( not ( = ?auto_826180 ?auto_826183 ) ) ( not ( = ?auto_826180 ?auto_826184 ) ) ( not ( = ?auto_826180 ?auto_826185 ) ) ( not ( = ?auto_826180 ?auto_826186 ) ) ( not ( = ?auto_826180 ?auto_826187 ) ) ( not ( = ?auto_826180 ?auto_826188 ) ) ( not ( = ?auto_826180 ?auto_826189 ) ) ( not ( = ?auto_826180 ?auto_826190 ) ) ( not ( = ?auto_826180 ?auto_826191 ) ) ( not ( = ?auto_826180 ?auto_826192 ) ) ( not ( = ?auto_826180 ?auto_826193 ) ) ( not ( = ?auto_826181 ?auto_826182 ) ) ( not ( = ?auto_826181 ?auto_826183 ) ) ( not ( = ?auto_826181 ?auto_826184 ) ) ( not ( = ?auto_826181 ?auto_826185 ) ) ( not ( = ?auto_826181 ?auto_826186 ) ) ( not ( = ?auto_826181 ?auto_826187 ) ) ( not ( = ?auto_826181 ?auto_826188 ) ) ( not ( = ?auto_826181 ?auto_826189 ) ) ( not ( = ?auto_826181 ?auto_826190 ) ) ( not ( = ?auto_826181 ?auto_826191 ) ) ( not ( = ?auto_826181 ?auto_826192 ) ) ( not ( = ?auto_826181 ?auto_826193 ) ) ( not ( = ?auto_826182 ?auto_826183 ) ) ( not ( = ?auto_826182 ?auto_826184 ) ) ( not ( = ?auto_826182 ?auto_826185 ) ) ( not ( = ?auto_826182 ?auto_826186 ) ) ( not ( = ?auto_826182 ?auto_826187 ) ) ( not ( = ?auto_826182 ?auto_826188 ) ) ( not ( = ?auto_826182 ?auto_826189 ) ) ( not ( = ?auto_826182 ?auto_826190 ) ) ( not ( = ?auto_826182 ?auto_826191 ) ) ( not ( = ?auto_826182 ?auto_826192 ) ) ( not ( = ?auto_826182 ?auto_826193 ) ) ( not ( = ?auto_826183 ?auto_826184 ) ) ( not ( = ?auto_826183 ?auto_826185 ) ) ( not ( = ?auto_826183 ?auto_826186 ) ) ( not ( = ?auto_826183 ?auto_826187 ) ) ( not ( = ?auto_826183 ?auto_826188 ) ) ( not ( = ?auto_826183 ?auto_826189 ) ) ( not ( = ?auto_826183 ?auto_826190 ) ) ( not ( = ?auto_826183 ?auto_826191 ) ) ( not ( = ?auto_826183 ?auto_826192 ) ) ( not ( = ?auto_826183 ?auto_826193 ) ) ( not ( = ?auto_826184 ?auto_826185 ) ) ( not ( = ?auto_826184 ?auto_826186 ) ) ( not ( = ?auto_826184 ?auto_826187 ) ) ( not ( = ?auto_826184 ?auto_826188 ) ) ( not ( = ?auto_826184 ?auto_826189 ) ) ( not ( = ?auto_826184 ?auto_826190 ) ) ( not ( = ?auto_826184 ?auto_826191 ) ) ( not ( = ?auto_826184 ?auto_826192 ) ) ( not ( = ?auto_826184 ?auto_826193 ) ) ( not ( = ?auto_826185 ?auto_826186 ) ) ( not ( = ?auto_826185 ?auto_826187 ) ) ( not ( = ?auto_826185 ?auto_826188 ) ) ( not ( = ?auto_826185 ?auto_826189 ) ) ( not ( = ?auto_826185 ?auto_826190 ) ) ( not ( = ?auto_826185 ?auto_826191 ) ) ( not ( = ?auto_826185 ?auto_826192 ) ) ( not ( = ?auto_826185 ?auto_826193 ) ) ( not ( = ?auto_826186 ?auto_826187 ) ) ( not ( = ?auto_826186 ?auto_826188 ) ) ( not ( = ?auto_826186 ?auto_826189 ) ) ( not ( = ?auto_826186 ?auto_826190 ) ) ( not ( = ?auto_826186 ?auto_826191 ) ) ( not ( = ?auto_826186 ?auto_826192 ) ) ( not ( = ?auto_826186 ?auto_826193 ) ) ( not ( = ?auto_826187 ?auto_826188 ) ) ( not ( = ?auto_826187 ?auto_826189 ) ) ( not ( = ?auto_826187 ?auto_826190 ) ) ( not ( = ?auto_826187 ?auto_826191 ) ) ( not ( = ?auto_826187 ?auto_826192 ) ) ( not ( = ?auto_826187 ?auto_826193 ) ) ( not ( = ?auto_826188 ?auto_826189 ) ) ( not ( = ?auto_826188 ?auto_826190 ) ) ( not ( = ?auto_826188 ?auto_826191 ) ) ( not ( = ?auto_826188 ?auto_826192 ) ) ( not ( = ?auto_826188 ?auto_826193 ) ) ( not ( = ?auto_826189 ?auto_826190 ) ) ( not ( = ?auto_826189 ?auto_826191 ) ) ( not ( = ?auto_826189 ?auto_826192 ) ) ( not ( = ?auto_826189 ?auto_826193 ) ) ( not ( = ?auto_826190 ?auto_826191 ) ) ( not ( = ?auto_826190 ?auto_826192 ) ) ( not ( = ?auto_826190 ?auto_826193 ) ) ( not ( = ?auto_826191 ?auto_826192 ) ) ( not ( = ?auto_826191 ?auto_826193 ) ) ( not ( = ?auto_826192 ?auto_826193 ) ) ( ON ?auto_826191 ?auto_826192 ) ( ON ?auto_826190 ?auto_826191 ) ( ON ?auto_826189 ?auto_826190 ) ( ON ?auto_826188 ?auto_826189 ) ( ON ?auto_826187 ?auto_826188 ) ( ON ?auto_826186 ?auto_826187 ) ( ON ?auto_826185 ?auto_826186 ) ( ON ?auto_826184 ?auto_826185 ) ( ON ?auto_826183 ?auto_826184 ) ( ON ?auto_826182 ?auto_826183 ) ( ON ?auto_826181 ?auto_826182 ) ( ON ?auto_826180 ?auto_826181 ) ( ON ?auto_826179 ?auto_826180 ) ( ON ?auto_826178 ?auto_826179 ) ( CLEAR ?auto_826176 ) ( ON ?auto_826177 ?auto_826178 ) ( CLEAR ?auto_826177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_826176 ?auto_826177 )
      ( MAKE-17PILE ?auto_826176 ?auto_826177 ?auto_826178 ?auto_826179 ?auto_826180 ?auto_826181 ?auto_826182 ?auto_826183 ?auto_826184 ?auto_826185 ?auto_826186 ?auto_826187 ?auto_826188 ?auto_826189 ?auto_826190 ?auto_826191 ?auto_826192 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_826246 - BLOCK
      ?auto_826247 - BLOCK
      ?auto_826248 - BLOCK
      ?auto_826249 - BLOCK
      ?auto_826250 - BLOCK
      ?auto_826251 - BLOCK
      ?auto_826252 - BLOCK
      ?auto_826253 - BLOCK
      ?auto_826254 - BLOCK
      ?auto_826255 - BLOCK
      ?auto_826256 - BLOCK
      ?auto_826257 - BLOCK
      ?auto_826258 - BLOCK
      ?auto_826259 - BLOCK
      ?auto_826260 - BLOCK
      ?auto_826261 - BLOCK
      ?auto_826262 - BLOCK
    )
    :vars
    (
      ?auto_826263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826262 ?auto_826263 ) ( not ( = ?auto_826246 ?auto_826247 ) ) ( not ( = ?auto_826246 ?auto_826248 ) ) ( not ( = ?auto_826246 ?auto_826249 ) ) ( not ( = ?auto_826246 ?auto_826250 ) ) ( not ( = ?auto_826246 ?auto_826251 ) ) ( not ( = ?auto_826246 ?auto_826252 ) ) ( not ( = ?auto_826246 ?auto_826253 ) ) ( not ( = ?auto_826246 ?auto_826254 ) ) ( not ( = ?auto_826246 ?auto_826255 ) ) ( not ( = ?auto_826246 ?auto_826256 ) ) ( not ( = ?auto_826246 ?auto_826257 ) ) ( not ( = ?auto_826246 ?auto_826258 ) ) ( not ( = ?auto_826246 ?auto_826259 ) ) ( not ( = ?auto_826246 ?auto_826260 ) ) ( not ( = ?auto_826246 ?auto_826261 ) ) ( not ( = ?auto_826246 ?auto_826262 ) ) ( not ( = ?auto_826246 ?auto_826263 ) ) ( not ( = ?auto_826247 ?auto_826248 ) ) ( not ( = ?auto_826247 ?auto_826249 ) ) ( not ( = ?auto_826247 ?auto_826250 ) ) ( not ( = ?auto_826247 ?auto_826251 ) ) ( not ( = ?auto_826247 ?auto_826252 ) ) ( not ( = ?auto_826247 ?auto_826253 ) ) ( not ( = ?auto_826247 ?auto_826254 ) ) ( not ( = ?auto_826247 ?auto_826255 ) ) ( not ( = ?auto_826247 ?auto_826256 ) ) ( not ( = ?auto_826247 ?auto_826257 ) ) ( not ( = ?auto_826247 ?auto_826258 ) ) ( not ( = ?auto_826247 ?auto_826259 ) ) ( not ( = ?auto_826247 ?auto_826260 ) ) ( not ( = ?auto_826247 ?auto_826261 ) ) ( not ( = ?auto_826247 ?auto_826262 ) ) ( not ( = ?auto_826247 ?auto_826263 ) ) ( not ( = ?auto_826248 ?auto_826249 ) ) ( not ( = ?auto_826248 ?auto_826250 ) ) ( not ( = ?auto_826248 ?auto_826251 ) ) ( not ( = ?auto_826248 ?auto_826252 ) ) ( not ( = ?auto_826248 ?auto_826253 ) ) ( not ( = ?auto_826248 ?auto_826254 ) ) ( not ( = ?auto_826248 ?auto_826255 ) ) ( not ( = ?auto_826248 ?auto_826256 ) ) ( not ( = ?auto_826248 ?auto_826257 ) ) ( not ( = ?auto_826248 ?auto_826258 ) ) ( not ( = ?auto_826248 ?auto_826259 ) ) ( not ( = ?auto_826248 ?auto_826260 ) ) ( not ( = ?auto_826248 ?auto_826261 ) ) ( not ( = ?auto_826248 ?auto_826262 ) ) ( not ( = ?auto_826248 ?auto_826263 ) ) ( not ( = ?auto_826249 ?auto_826250 ) ) ( not ( = ?auto_826249 ?auto_826251 ) ) ( not ( = ?auto_826249 ?auto_826252 ) ) ( not ( = ?auto_826249 ?auto_826253 ) ) ( not ( = ?auto_826249 ?auto_826254 ) ) ( not ( = ?auto_826249 ?auto_826255 ) ) ( not ( = ?auto_826249 ?auto_826256 ) ) ( not ( = ?auto_826249 ?auto_826257 ) ) ( not ( = ?auto_826249 ?auto_826258 ) ) ( not ( = ?auto_826249 ?auto_826259 ) ) ( not ( = ?auto_826249 ?auto_826260 ) ) ( not ( = ?auto_826249 ?auto_826261 ) ) ( not ( = ?auto_826249 ?auto_826262 ) ) ( not ( = ?auto_826249 ?auto_826263 ) ) ( not ( = ?auto_826250 ?auto_826251 ) ) ( not ( = ?auto_826250 ?auto_826252 ) ) ( not ( = ?auto_826250 ?auto_826253 ) ) ( not ( = ?auto_826250 ?auto_826254 ) ) ( not ( = ?auto_826250 ?auto_826255 ) ) ( not ( = ?auto_826250 ?auto_826256 ) ) ( not ( = ?auto_826250 ?auto_826257 ) ) ( not ( = ?auto_826250 ?auto_826258 ) ) ( not ( = ?auto_826250 ?auto_826259 ) ) ( not ( = ?auto_826250 ?auto_826260 ) ) ( not ( = ?auto_826250 ?auto_826261 ) ) ( not ( = ?auto_826250 ?auto_826262 ) ) ( not ( = ?auto_826250 ?auto_826263 ) ) ( not ( = ?auto_826251 ?auto_826252 ) ) ( not ( = ?auto_826251 ?auto_826253 ) ) ( not ( = ?auto_826251 ?auto_826254 ) ) ( not ( = ?auto_826251 ?auto_826255 ) ) ( not ( = ?auto_826251 ?auto_826256 ) ) ( not ( = ?auto_826251 ?auto_826257 ) ) ( not ( = ?auto_826251 ?auto_826258 ) ) ( not ( = ?auto_826251 ?auto_826259 ) ) ( not ( = ?auto_826251 ?auto_826260 ) ) ( not ( = ?auto_826251 ?auto_826261 ) ) ( not ( = ?auto_826251 ?auto_826262 ) ) ( not ( = ?auto_826251 ?auto_826263 ) ) ( not ( = ?auto_826252 ?auto_826253 ) ) ( not ( = ?auto_826252 ?auto_826254 ) ) ( not ( = ?auto_826252 ?auto_826255 ) ) ( not ( = ?auto_826252 ?auto_826256 ) ) ( not ( = ?auto_826252 ?auto_826257 ) ) ( not ( = ?auto_826252 ?auto_826258 ) ) ( not ( = ?auto_826252 ?auto_826259 ) ) ( not ( = ?auto_826252 ?auto_826260 ) ) ( not ( = ?auto_826252 ?auto_826261 ) ) ( not ( = ?auto_826252 ?auto_826262 ) ) ( not ( = ?auto_826252 ?auto_826263 ) ) ( not ( = ?auto_826253 ?auto_826254 ) ) ( not ( = ?auto_826253 ?auto_826255 ) ) ( not ( = ?auto_826253 ?auto_826256 ) ) ( not ( = ?auto_826253 ?auto_826257 ) ) ( not ( = ?auto_826253 ?auto_826258 ) ) ( not ( = ?auto_826253 ?auto_826259 ) ) ( not ( = ?auto_826253 ?auto_826260 ) ) ( not ( = ?auto_826253 ?auto_826261 ) ) ( not ( = ?auto_826253 ?auto_826262 ) ) ( not ( = ?auto_826253 ?auto_826263 ) ) ( not ( = ?auto_826254 ?auto_826255 ) ) ( not ( = ?auto_826254 ?auto_826256 ) ) ( not ( = ?auto_826254 ?auto_826257 ) ) ( not ( = ?auto_826254 ?auto_826258 ) ) ( not ( = ?auto_826254 ?auto_826259 ) ) ( not ( = ?auto_826254 ?auto_826260 ) ) ( not ( = ?auto_826254 ?auto_826261 ) ) ( not ( = ?auto_826254 ?auto_826262 ) ) ( not ( = ?auto_826254 ?auto_826263 ) ) ( not ( = ?auto_826255 ?auto_826256 ) ) ( not ( = ?auto_826255 ?auto_826257 ) ) ( not ( = ?auto_826255 ?auto_826258 ) ) ( not ( = ?auto_826255 ?auto_826259 ) ) ( not ( = ?auto_826255 ?auto_826260 ) ) ( not ( = ?auto_826255 ?auto_826261 ) ) ( not ( = ?auto_826255 ?auto_826262 ) ) ( not ( = ?auto_826255 ?auto_826263 ) ) ( not ( = ?auto_826256 ?auto_826257 ) ) ( not ( = ?auto_826256 ?auto_826258 ) ) ( not ( = ?auto_826256 ?auto_826259 ) ) ( not ( = ?auto_826256 ?auto_826260 ) ) ( not ( = ?auto_826256 ?auto_826261 ) ) ( not ( = ?auto_826256 ?auto_826262 ) ) ( not ( = ?auto_826256 ?auto_826263 ) ) ( not ( = ?auto_826257 ?auto_826258 ) ) ( not ( = ?auto_826257 ?auto_826259 ) ) ( not ( = ?auto_826257 ?auto_826260 ) ) ( not ( = ?auto_826257 ?auto_826261 ) ) ( not ( = ?auto_826257 ?auto_826262 ) ) ( not ( = ?auto_826257 ?auto_826263 ) ) ( not ( = ?auto_826258 ?auto_826259 ) ) ( not ( = ?auto_826258 ?auto_826260 ) ) ( not ( = ?auto_826258 ?auto_826261 ) ) ( not ( = ?auto_826258 ?auto_826262 ) ) ( not ( = ?auto_826258 ?auto_826263 ) ) ( not ( = ?auto_826259 ?auto_826260 ) ) ( not ( = ?auto_826259 ?auto_826261 ) ) ( not ( = ?auto_826259 ?auto_826262 ) ) ( not ( = ?auto_826259 ?auto_826263 ) ) ( not ( = ?auto_826260 ?auto_826261 ) ) ( not ( = ?auto_826260 ?auto_826262 ) ) ( not ( = ?auto_826260 ?auto_826263 ) ) ( not ( = ?auto_826261 ?auto_826262 ) ) ( not ( = ?auto_826261 ?auto_826263 ) ) ( not ( = ?auto_826262 ?auto_826263 ) ) ( ON ?auto_826261 ?auto_826262 ) ( ON ?auto_826260 ?auto_826261 ) ( ON ?auto_826259 ?auto_826260 ) ( ON ?auto_826258 ?auto_826259 ) ( ON ?auto_826257 ?auto_826258 ) ( ON ?auto_826256 ?auto_826257 ) ( ON ?auto_826255 ?auto_826256 ) ( ON ?auto_826254 ?auto_826255 ) ( ON ?auto_826253 ?auto_826254 ) ( ON ?auto_826252 ?auto_826253 ) ( ON ?auto_826251 ?auto_826252 ) ( ON ?auto_826250 ?auto_826251 ) ( ON ?auto_826249 ?auto_826250 ) ( ON ?auto_826248 ?auto_826249 ) ( ON ?auto_826247 ?auto_826248 ) ( ON ?auto_826246 ?auto_826247 ) ( CLEAR ?auto_826246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_826246 )
      ( MAKE-17PILE ?auto_826246 ?auto_826247 ?auto_826248 ?auto_826249 ?auto_826250 ?auto_826251 ?auto_826252 ?auto_826253 ?auto_826254 ?auto_826255 ?auto_826256 ?auto_826257 ?auto_826258 ?auto_826259 ?auto_826260 ?auto_826261 ?auto_826262 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826317 - BLOCK
      ?auto_826318 - BLOCK
      ?auto_826319 - BLOCK
      ?auto_826320 - BLOCK
      ?auto_826321 - BLOCK
      ?auto_826322 - BLOCK
      ?auto_826323 - BLOCK
      ?auto_826324 - BLOCK
      ?auto_826325 - BLOCK
      ?auto_826326 - BLOCK
      ?auto_826327 - BLOCK
      ?auto_826328 - BLOCK
      ?auto_826329 - BLOCK
      ?auto_826330 - BLOCK
      ?auto_826331 - BLOCK
      ?auto_826332 - BLOCK
      ?auto_826333 - BLOCK
      ?auto_826334 - BLOCK
    )
    :vars
    (
      ?auto_826335 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_826333 ) ( ON ?auto_826334 ?auto_826335 ) ( CLEAR ?auto_826334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_826317 ) ( ON ?auto_826318 ?auto_826317 ) ( ON ?auto_826319 ?auto_826318 ) ( ON ?auto_826320 ?auto_826319 ) ( ON ?auto_826321 ?auto_826320 ) ( ON ?auto_826322 ?auto_826321 ) ( ON ?auto_826323 ?auto_826322 ) ( ON ?auto_826324 ?auto_826323 ) ( ON ?auto_826325 ?auto_826324 ) ( ON ?auto_826326 ?auto_826325 ) ( ON ?auto_826327 ?auto_826326 ) ( ON ?auto_826328 ?auto_826327 ) ( ON ?auto_826329 ?auto_826328 ) ( ON ?auto_826330 ?auto_826329 ) ( ON ?auto_826331 ?auto_826330 ) ( ON ?auto_826332 ?auto_826331 ) ( ON ?auto_826333 ?auto_826332 ) ( not ( = ?auto_826317 ?auto_826318 ) ) ( not ( = ?auto_826317 ?auto_826319 ) ) ( not ( = ?auto_826317 ?auto_826320 ) ) ( not ( = ?auto_826317 ?auto_826321 ) ) ( not ( = ?auto_826317 ?auto_826322 ) ) ( not ( = ?auto_826317 ?auto_826323 ) ) ( not ( = ?auto_826317 ?auto_826324 ) ) ( not ( = ?auto_826317 ?auto_826325 ) ) ( not ( = ?auto_826317 ?auto_826326 ) ) ( not ( = ?auto_826317 ?auto_826327 ) ) ( not ( = ?auto_826317 ?auto_826328 ) ) ( not ( = ?auto_826317 ?auto_826329 ) ) ( not ( = ?auto_826317 ?auto_826330 ) ) ( not ( = ?auto_826317 ?auto_826331 ) ) ( not ( = ?auto_826317 ?auto_826332 ) ) ( not ( = ?auto_826317 ?auto_826333 ) ) ( not ( = ?auto_826317 ?auto_826334 ) ) ( not ( = ?auto_826317 ?auto_826335 ) ) ( not ( = ?auto_826318 ?auto_826319 ) ) ( not ( = ?auto_826318 ?auto_826320 ) ) ( not ( = ?auto_826318 ?auto_826321 ) ) ( not ( = ?auto_826318 ?auto_826322 ) ) ( not ( = ?auto_826318 ?auto_826323 ) ) ( not ( = ?auto_826318 ?auto_826324 ) ) ( not ( = ?auto_826318 ?auto_826325 ) ) ( not ( = ?auto_826318 ?auto_826326 ) ) ( not ( = ?auto_826318 ?auto_826327 ) ) ( not ( = ?auto_826318 ?auto_826328 ) ) ( not ( = ?auto_826318 ?auto_826329 ) ) ( not ( = ?auto_826318 ?auto_826330 ) ) ( not ( = ?auto_826318 ?auto_826331 ) ) ( not ( = ?auto_826318 ?auto_826332 ) ) ( not ( = ?auto_826318 ?auto_826333 ) ) ( not ( = ?auto_826318 ?auto_826334 ) ) ( not ( = ?auto_826318 ?auto_826335 ) ) ( not ( = ?auto_826319 ?auto_826320 ) ) ( not ( = ?auto_826319 ?auto_826321 ) ) ( not ( = ?auto_826319 ?auto_826322 ) ) ( not ( = ?auto_826319 ?auto_826323 ) ) ( not ( = ?auto_826319 ?auto_826324 ) ) ( not ( = ?auto_826319 ?auto_826325 ) ) ( not ( = ?auto_826319 ?auto_826326 ) ) ( not ( = ?auto_826319 ?auto_826327 ) ) ( not ( = ?auto_826319 ?auto_826328 ) ) ( not ( = ?auto_826319 ?auto_826329 ) ) ( not ( = ?auto_826319 ?auto_826330 ) ) ( not ( = ?auto_826319 ?auto_826331 ) ) ( not ( = ?auto_826319 ?auto_826332 ) ) ( not ( = ?auto_826319 ?auto_826333 ) ) ( not ( = ?auto_826319 ?auto_826334 ) ) ( not ( = ?auto_826319 ?auto_826335 ) ) ( not ( = ?auto_826320 ?auto_826321 ) ) ( not ( = ?auto_826320 ?auto_826322 ) ) ( not ( = ?auto_826320 ?auto_826323 ) ) ( not ( = ?auto_826320 ?auto_826324 ) ) ( not ( = ?auto_826320 ?auto_826325 ) ) ( not ( = ?auto_826320 ?auto_826326 ) ) ( not ( = ?auto_826320 ?auto_826327 ) ) ( not ( = ?auto_826320 ?auto_826328 ) ) ( not ( = ?auto_826320 ?auto_826329 ) ) ( not ( = ?auto_826320 ?auto_826330 ) ) ( not ( = ?auto_826320 ?auto_826331 ) ) ( not ( = ?auto_826320 ?auto_826332 ) ) ( not ( = ?auto_826320 ?auto_826333 ) ) ( not ( = ?auto_826320 ?auto_826334 ) ) ( not ( = ?auto_826320 ?auto_826335 ) ) ( not ( = ?auto_826321 ?auto_826322 ) ) ( not ( = ?auto_826321 ?auto_826323 ) ) ( not ( = ?auto_826321 ?auto_826324 ) ) ( not ( = ?auto_826321 ?auto_826325 ) ) ( not ( = ?auto_826321 ?auto_826326 ) ) ( not ( = ?auto_826321 ?auto_826327 ) ) ( not ( = ?auto_826321 ?auto_826328 ) ) ( not ( = ?auto_826321 ?auto_826329 ) ) ( not ( = ?auto_826321 ?auto_826330 ) ) ( not ( = ?auto_826321 ?auto_826331 ) ) ( not ( = ?auto_826321 ?auto_826332 ) ) ( not ( = ?auto_826321 ?auto_826333 ) ) ( not ( = ?auto_826321 ?auto_826334 ) ) ( not ( = ?auto_826321 ?auto_826335 ) ) ( not ( = ?auto_826322 ?auto_826323 ) ) ( not ( = ?auto_826322 ?auto_826324 ) ) ( not ( = ?auto_826322 ?auto_826325 ) ) ( not ( = ?auto_826322 ?auto_826326 ) ) ( not ( = ?auto_826322 ?auto_826327 ) ) ( not ( = ?auto_826322 ?auto_826328 ) ) ( not ( = ?auto_826322 ?auto_826329 ) ) ( not ( = ?auto_826322 ?auto_826330 ) ) ( not ( = ?auto_826322 ?auto_826331 ) ) ( not ( = ?auto_826322 ?auto_826332 ) ) ( not ( = ?auto_826322 ?auto_826333 ) ) ( not ( = ?auto_826322 ?auto_826334 ) ) ( not ( = ?auto_826322 ?auto_826335 ) ) ( not ( = ?auto_826323 ?auto_826324 ) ) ( not ( = ?auto_826323 ?auto_826325 ) ) ( not ( = ?auto_826323 ?auto_826326 ) ) ( not ( = ?auto_826323 ?auto_826327 ) ) ( not ( = ?auto_826323 ?auto_826328 ) ) ( not ( = ?auto_826323 ?auto_826329 ) ) ( not ( = ?auto_826323 ?auto_826330 ) ) ( not ( = ?auto_826323 ?auto_826331 ) ) ( not ( = ?auto_826323 ?auto_826332 ) ) ( not ( = ?auto_826323 ?auto_826333 ) ) ( not ( = ?auto_826323 ?auto_826334 ) ) ( not ( = ?auto_826323 ?auto_826335 ) ) ( not ( = ?auto_826324 ?auto_826325 ) ) ( not ( = ?auto_826324 ?auto_826326 ) ) ( not ( = ?auto_826324 ?auto_826327 ) ) ( not ( = ?auto_826324 ?auto_826328 ) ) ( not ( = ?auto_826324 ?auto_826329 ) ) ( not ( = ?auto_826324 ?auto_826330 ) ) ( not ( = ?auto_826324 ?auto_826331 ) ) ( not ( = ?auto_826324 ?auto_826332 ) ) ( not ( = ?auto_826324 ?auto_826333 ) ) ( not ( = ?auto_826324 ?auto_826334 ) ) ( not ( = ?auto_826324 ?auto_826335 ) ) ( not ( = ?auto_826325 ?auto_826326 ) ) ( not ( = ?auto_826325 ?auto_826327 ) ) ( not ( = ?auto_826325 ?auto_826328 ) ) ( not ( = ?auto_826325 ?auto_826329 ) ) ( not ( = ?auto_826325 ?auto_826330 ) ) ( not ( = ?auto_826325 ?auto_826331 ) ) ( not ( = ?auto_826325 ?auto_826332 ) ) ( not ( = ?auto_826325 ?auto_826333 ) ) ( not ( = ?auto_826325 ?auto_826334 ) ) ( not ( = ?auto_826325 ?auto_826335 ) ) ( not ( = ?auto_826326 ?auto_826327 ) ) ( not ( = ?auto_826326 ?auto_826328 ) ) ( not ( = ?auto_826326 ?auto_826329 ) ) ( not ( = ?auto_826326 ?auto_826330 ) ) ( not ( = ?auto_826326 ?auto_826331 ) ) ( not ( = ?auto_826326 ?auto_826332 ) ) ( not ( = ?auto_826326 ?auto_826333 ) ) ( not ( = ?auto_826326 ?auto_826334 ) ) ( not ( = ?auto_826326 ?auto_826335 ) ) ( not ( = ?auto_826327 ?auto_826328 ) ) ( not ( = ?auto_826327 ?auto_826329 ) ) ( not ( = ?auto_826327 ?auto_826330 ) ) ( not ( = ?auto_826327 ?auto_826331 ) ) ( not ( = ?auto_826327 ?auto_826332 ) ) ( not ( = ?auto_826327 ?auto_826333 ) ) ( not ( = ?auto_826327 ?auto_826334 ) ) ( not ( = ?auto_826327 ?auto_826335 ) ) ( not ( = ?auto_826328 ?auto_826329 ) ) ( not ( = ?auto_826328 ?auto_826330 ) ) ( not ( = ?auto_826328 ?auto_826331 ) ) ( not ( = ?auto_826328 ?auto_826332 ) ) ( not ( = ?auto_826328 ?auto_826333 ) ) ( not ( = ?auto_826328 ?auto_826334 ) ) ( not ( = ?auto_826328 ?auto_826335 ) ) ( not ( = ?auto_826329 ?auto_826330 ) ) ( not ( = ?auto_826329 ?auto_826331 ) ) ( not ( = ?auto_826329 ?auto_826332 ) ) ( not ( = ?auto_826329 ?auto_826333 ) ) ( not ( = ?auto_826329 ?auto_826334 ) ) ( not ( = ?auto_826329 ?auto_826335 ) ) ( not ( = ?auto_826330 ?auto_826331 ) ) ( not ( = ?auto_826330 ?auto_826332 ) ) ( not ( = ?auto_826330 ?auto_826333 ) ) ( not ( = ?auto_826330 ?auto_826334 ) ) ( not ( = ?auto_826330 ?auto_826335 ) ) ( not ( = ?auto_826331 ?auto_826332 ) ) ( not ( = ?auto_826331 ?auto_826333 ) ) ( not ( = ?auto_826331 ?auto_826334 ) ) ( not ( = ?auto_826331 ?auto_826335 ) ) ( not ( = ?auto_826332 ?auto_826333 ) ) ( not ( = ?auto_826332 ?auto_826334 ) ) ( not ( = ?auto_826332 ?auto_826335 ) ) ( not ( = ?auto_826333 ?auto_826334 ) ) ( not ( = ?auto_826333 ?auto_826335 ) ) ( not ( = ?auto_826334 ?auto_826335 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_826334 ?auto_826335 )
      ( !STACK ?auto_826334 ?auto_826333 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826354 - BLOCK
      ?auto_826355 - BLOCK
      ?auto_826356 - BLOCK
      ?auto_826357 - BLOCK
      ?auto_826358 - BLOCK
      ?auto_826359 - BLOCK
      ?auto_826360 - BLOCK
      ?auto_826361 - BLOCK
      ?auto_826362 - BLOCK
      ?auto_826363 - BLOCK
      ?auto_826364 - BLOCK
      ?auto_826365 - BLOCK
      ?auto_826366 - BLOCK
      ?auto_826367 - BLOCK
      ?auto_826368 - BLOCK
      ?auto_826369 - BLOCK
      ?auto_826370 - BLOCK
      ?auto_826371 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_826370 ) ( ON-TABLE ?auto_826371 ) ( CLEAR ?auto_826371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_826354 ) ( ON ?auto_826355 ?auto_826354 ) ( ON ?auto_826356 ?auto_826355 ) ( ON ?auto_826357 ?auto_826356 ) ( ON ?auto_826358 ?auto_826357 ) ( ON ?auto_826359 ?auto_826358 ) ( ON ?auto_826360 ?auto_826359 ) ( ON ?auto_826361 ?auto_826360 ) ( ON ?auto_826362 ?auto_826361 ) ( ON ?auto_826363 ?auto_826362 ) ( ON ?auto_826364 ?auto_826363 ) ( ON ?auto_826365 ?auto_826364 ) ( ON ?auto_826366 ?auto_826365 ) ( ON ?auto_826367 ?auto_826366 ) ( ON ?auto_826368 ?auto_826367 ) ( ON ?auto_826369 ?auto_826368 ) ( ON ?auto_826370 ?auto_826369 ) ( not ( = ?auto_826354 ?auto_826355 ) ) ( not ( = ?auto_826354 ?auto_826356 ) ) ( not ( = ?auto_826354 ?auto_826357 ) ) ( not ( = ?auto_826354 ?auto_826358 ) ) ( not ( = ?auto_826354 ?auto_826359 ) ) ( not ( = ?auto_826354 ?auto_826360 ) ) ( not ( = ?auto_826354 ?auto_826361 ) ) ( not ( = ?auto_826354 ?auto_826362 ) ) ( not ( = ?auto_826354 ?auto_826363 ) ) ( not ( = ?auto_826354 ?auto_826364 ) ) ( not ( = ?auto_826354 ?auto_826365 ) ) ( not ( = ?auto_826354 ?auto_826366 ) ) ( not ( = ?auto_826354 ?auto_826367 ) ) ( not ( = ?auto_826354 ?auto_826368 ) ) ( not ( = ?auto_826354 ?auto_826369 ) ) ( not ( = ?auto_826354 ?auto_826370 ) ) ( not ( = ?auto_826354 ?auto_826371 ) ) ( not ( = ?auto_826355 ?auto_826356 ) ) ( not ( = ?auto_826355 ?auto_826357 ) ) ( not ( = ?auto_826355 ?auto_826358 ) ) ( not ( = ?auto_826355 ?auto_826359 ) ) ( not ( = ?auto_826355 ?auto_826360 ) ) ( not ( = ?auto_826355 ?auto_826361 ) ) ( not ( = ?auto_826355 ?auto_826362 ) ) ( not ( = ?auto_826355 ?auto_826363 ) ) ( not ( = ?auto_826355 ?auto_826364 ) ) ( not ( = ?auto_826355 ?auto_826365 ) ) ( not ( = ?auto_826355 ?auto_826366 ) ) ( not ( = ?auto_826355 ?auto_826367 ) ) ( not ( = ?auto_826355 ?auto_826368 ) ) ( not ( = ?auto_826355 ?auto_826369 ) ) ( not ( = ?auto_826355 ?auto_826370 ) ) ( not ( = ?auto_826355 ?auto_826371 ) ) ( not ( = ?auto_826356 ?auto_826357 ) ) ( not ( = ?auto_826356 ?auto_826358 ) ) ( not ( = ?auto_826356 ?auto_826359 ) ) ( not ( = ?auto_826356 ?auto_826360 ) ) ( not ( = ?auto_826356 ?auto_826361 ) ) ( not ( = ?auto_826356 ?auto_826362 ) ) ( not ( = ?auto_826356 ?auto_826363 ) ) ( not ( = ?auto_826356 ?auto_826364 ) ) ( not ( = ?auto_826356 ?auto_826365 ) ) ( not ( = ?auto_826356 ?auto_826366 ) ) ( not ( = ?auto_826356 ?auto_826367 ) ) ( not ( = ?auto_826356 ?auto_826368 ) ) ( not ( = ?auto_826356 ?auto_826369 ) ) ( not ( = ?auto_826356 ?auto_826370 ) ) ( not ( = ?auto_826356 ?auto_826371 ) ) ( not ( = ?auto_826357 ?auto_826358 ) ) ( not ( = ?auto_826357 ?auto_826359 ) ) ( not ( = ?auto_826357 ?auto_826360 ) ) ( not ( = ?auto_826357 ?auto_826361 ) ) ( not ( = ?auto_826357 ?auto_826362 ) ) ( not ( = ?auto_826357 ?auto_826363 ) ) ( not ( = ?auto_826357 ?auto_826364 ) ) ( not ( = ?auto_826357 ?auto_826365 ) ) ( not ( = ?auto_826357 ?auto_826366 ) ) ( not ( = ?auto_826357 ?auto_826367 ) ) ( not ( = ?auto_826357 ?auto_826368 ) ) ( not ( = ?auto_826357 ?auto_826369 ) ) ( not ( = ?auto_826357 ?auto_826370 ) ) ( not ( = ?auto_826357 ?auto_826371 ) ) ( not ( = ?auto_826358 ?auto_826359 ) ) ( not ( = ?auto_826358 ?auto_826360 ) ) ( not ( = ?auto_826358 ?auto_826361 ) ) ( not ( = ?auto_826358 ?auto_826362 ) ) ( not ( = ?auto_826358 ?auto_826363 ) ) ( not ( = ?auto_826358 ?auto_826364 ) ) ( not ( = ?auto_826358 ?auto_826365 ) ) ( not ( = ?auto_826358 ?auto_826366 ) ) ( not ( = ?auto_826358 ?auto_826367 ) ) ( not ( = ?auto_826358 ?auto_826368 ) ) ( not ( = ?auto_826358 ?auto_826369 ) ) ( not ( = ?auto_826358 ?auto_826370 ) ) ( not ( = ?auto_826358 ?auto_826371 ) ) ( not ( = ?auto_826359 ?auto_826360 ) ) ( not ( = ?auto_826359 ?auto_826361 ) ) ( not ( = ?auto_826359 ?auto_826362 ) ) ( not ( = ?auto_826359 ?auto_826363 ) ) ( not ( = ?auto_826359 ?auto_826364 ) ) ( not ( = ?auto_826359 ?auto_826365 ) ) ( not ( = ?auto_826359 ?auto_826366 ) ) ( not ( = ?auto_826359 ?auto_826367 ) ) ( not ( = ?auto_826359 ?auto_826368 ) ) ( not ( = ?auto_826359 ?auto_826369 ) ) ( not ( = ?auto_826359 ?auto_826370 ) ) ( not ( = ?auto_826359 ?auto_826371 ) ) ( not ( = ?auto_826360 ?auto_826361 ) ) ( not ( = ?auto_826360 ?auto_826362 ) ) ( not ( = ?auto_826360 ?auto_826363 ) ) ( not ( = ?auto_826360 ?auto_826364 ) ) ( not ( = ?auto_826360 ?auto_826365 ) ) ( not ( = ?auto_826360 ?auto_826366 ) ) ( not ( = ?auto_826360 ?auto_826367 ) ) ( not ( = ?auto_826360 ?auto_826368 ) ) ( not ( = ?auto_826360 ?auto_826369 ) ) ( not ( = ?auto_826360 ?auto_826370 ) ) ( not ( = ?auto_826360 ?auto_826371 ) ) ( not ( = ?auto_826361 ?auto_826362 ) ) ( not ( = ?auto_826361 ?auto_826363 ) ) ( not ( = ?auto_826361 ?auto_826364 ) ) ( not ( = ?auto_826361 ?auto_826365 ) ) ( not ( = ?auto_826361 ?auto_826366 ) ) ( not ( = ?auto_826361 ?auto_826367 ) ) ( not ( = ?auto_826361 ?auto_826368 ) ) ( not ( = ?auto_826361 ?auto_826369 ) ) ( not ( = ?auto_826361 ?auto_826370 ) ) ( not ( = ?auto_826361 ?auto_826371 ) ) ( not ( = ?auto_826362 ?auto_826363 ) ) ( not ( = ?auto_826362 ?auto_826364 ) ) ( not ( = ?auto_826362 ?auto_826365 ) ) ( not ( = ?auto_826362 ?auto_826366 ) ) ( not ( = ?auto_826362 ?auto_826367 ) ) ( not ( = ?auto_826362 ?auto_826368 ) ) ( not ( = ?auto_826362 ?auto_826369 ) ) ( not ( = ?auto_826362 ?auto_826370 ) ) ( not ( = ?auto_826362 ?auto_826371 ) ) ( not ( = ?auto_826363 ?auto_826364 ) ) ( not ( = ?auto_826363 ?auto_826365 ) ) ( not ( = ?auto_826363 ?auto_826366 ) ) ( not ( = ?auto_826363 ?auto_826367 ) ) ( not ( = ?auto_826363 ?auto_826368 ) ) ( not ( = ?auto_826363 ?auto_826369 ) ) ( not ( = ?auto_826363 ?auto_826370 ) ) ( not ( = ?auto_826363 ?auto_826371 ) ) ( not ( = ?auto_826364 ?auto_826365 ) ) ( not ( = ?auto_826364 ?auto_826366 ) ) ( not ( = ?auto_826364 ?auto_826367 ) ) ( not ( = ?auto_826364 ?auto_826368 ) ) ( not ( = ?auto_826364 ?auto_826369 ) ) ( not ( = ?auto_826364 ?auto_826370 ) ) ( not ( = ?auto_826364 ?auto_826371 ) ) ( not ( = ?auto_826365 ?auto_826366 ) ) ( not ( = ?auto_826365 ?auto_826367 ) ) ( not ( = ?auto_826365 ?auto_826368 ) ) ( not ( = ?auto_826365 ?auto_826369 ) ) ( not ( = ?auto_826365 ?auto_826370 ) ) ( not ( = ?auto_826365 ?auto_826371 ) ) ( not ( = ?auto_826366 ?auto_826367 ) ) ( not ( = ?auto_826366 ?auto_826368 ) ) ( not ( = ?auto_826366 ?auto_826369 ) ) ( not ( = ?auto_826366 ?auto_826370 ) ) ( not ( = ?auto_826366 ?auto_826371 ) ) ( not ( = ?auto_826367 ?auto_826368 ) ) ( not ( = ?auto_826367 ?auto_826369 ) ) ( not ( = ?auto_826367 ?auto_826370 ) ) ( not ( = ?auto_826367 ?auto_826371 ) ) ( not ( = ?auto_826368 ?auto_826369 ) ) ( not ( = ?auto_826368 ?auto_826370 ) ) ( not ( = ?auto_826368 ?auto_826371 ) ) ( not ( = ?auto_826369 ?auto_826370 ) ) ( not ( = ?auto_826369 ?auto_826371 ) ) ( not ( = ?auto_826370 ?auto_826371 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_826371 )
      ( !STACK ?auto_826371 ?auto_826370 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826390 - BLOCK
      ?auto_826391 - BLOCK
      ?auto_826392 - BLOCK
      ?auto_826393 - BLOCK
      ?auto_826394 - BLOCK
      ?auto_826395 - BLOCK
      ?auto_826396 - BLOCK
      ?auto_826397 - BLOCK
      ?auto_826398 - BLOCK
      ?auto_826399 - BLOCK
      ?auto_826400 - BLOCK
      ?auto_826401 - BLOCK
      ?auto_826402 - BLOCK
      ?auto_826403 - BLOCK
      ?auto_826404 - BLOCK
      ?auto_826405 - BLOCK
      ?auto_826406 - BLOCK
      ?auto_826407 - BLOCK
    )
    :vars
    (
      ?auto_826408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826407 ?auto_826408 ) ( ON-TABLE ?auto_826390 ) ( ON ?auto_826391 ?auto_826390 ) ( ON ?auto_826392 ?auto_826391 ) ( ON ?auto_826393 ?auto_826392 ) ( ON ?auto_826394 ?auto_826393 ) ( ON ?auto_826395 ?auto_826394 ) ( ON ?auto_826396 ?auto_826395 ) ( ON ?auto_826397 ?auto_826396 ) ( ON ?auto_826398 ?auto_826397 ) ( ON ?auto_826399 ?auto_826398 ) ( ON ?auto_826400 ?auto_826399 ) ( ON ?auto_826401 ?auto_826400 ) ( ON ?auto_826402 ?auto_826401 ) ( ON ?auto_826403 ?auto_826402 ) ( ON ?auto_826404 ?auto_826403 ) ( ON ?auto_826405 ?auto_826404 ) ( not ( = ?auto_826390 ?auto_826391 ) ) ( not ( = ?auto_826390 ?auto_826392 ) ) ( not ( = ?auto_826390 ?auto_826393 ) ) ( not ( = ?auto_826390 ?auto_826394 ) ) ( not ( = ?auto_826390 ?auto_826395 ) ) ( not ( = ?auto_826390 ?auto_826396 ) ) ( not ( = ?auto_826390 ?auto_826397 ) ) ( not ( = ?auto_826390 ?auto_826398 ) ) ( not ( = ?auto_826390 ?auto_826399 ) ) ( not ( = ?auto_826390 ?auto_826400 ) ) ( not ( = ?auto_826390 ?auto_826401 ) ) ( not ( = ?auto_826390 ?auto_826402 ) ) ( not ( = ?auto_826390 ?auto_826403 ) ) ( not ( = ?auto_826390 ?auto_826404 ) ) ( not ( = ?auto_826390 ?auto_826405 ) ) ( not ( = ?auto_826390 ?auto_826406 ) ) ( not ( = ?auto_826390 ?auto_826407 ) ) ( not ( = ?auto_826390 ?auto_826408 ) ) ( not ( = ?auto_826391 ?auto_826392 ) ) ( not ( = ?auto_826391 ?auto_826393 ) ) ( not ( = ?auto_826391 ?auto_826394 ) ) ( not ( = ?auto_826391 ?auto_826395 ) ) ( not ( = ?auto_826391 ?auto_826396 ) ) ( not ( = ?auto_826391 ?auto_826397 ) ) ( not ( = ?auto_826391 ?auto_826398 ) ) ( not ( = ?auto_826391 ?auto_826399 ) ) ( not ( = ?auto_826391 ?auto_826400 ) ) ( not ( = ?auto_826391 ?auto_826401 ) ) ( not ( = ?auto_826391 ?auto_826402 ) ) ( not ( = ?auto_826391 ?auto_826403 ) ) ( not ( = ?auto_826391 ?auto_826404 ) ) ( not ( = ?auto_826391 ?auto_826405 ) ) ( not ( = ?auto_826391 ?auto_826406 ) ) ( not ( = ?auto_826391 ?auto_826407 ) ) ( not ( = ?auto_826391 ?auto_826408 ) ) ( not ( = ?auto_826392 ?auto_826393 ) ) ( not ( = ?auto_826392 ?auto_826394 ) ) ( not ( = ?auto_826392 ?auto_826395 ) ) ( not ( = ?auto_826392 ?auto_826396 ) ) ( not ( = ?auto_826392 ?auto_826397 ) ) ( not ( = ?auto_826392 ?auto_826398 ) ) ( not ( = ?auto_826392 ?auto_826399 ) ) ( not ( = ?auto_826392 ?auto_826400 ) ) ( not ( = ?auto_826392 ?auto_826401 ) ) ( not ( = ?auto_826392 ?auto_826402 ) ) ( not ( = ?auto_826392 ?auto_826403 ) ) ( not ( = ?auto_826392 ?auto_826404 ) ) ( not ( = ?auto_826392 ?auto_826405 ) ) ( not ( = ?auto_826392 ?auto_826406 ) ) ( not ( = ?auto_826392 ?auto_826407 ) ) ( not ( = ?auto_826392 ?auto_826408 ) ) ( not ( = ?auto_826393 ?auto_826394 ) ) ( not ( = ?auto_826393 ?auto_826395 ) ) ( not ( = ?auto_826393 ?auto_826396 ) ) ( not ( = ?auto_826393 ?auto_826397 ) ) ( not ( = ?auto_826393 ?auto_826398 ) ) ( not ( = ?auto_826393 ?auto_826399 ) ) ( not ( = ?auto_826393 ?auto_826400 ) ) ( not ( = ?auto_826393 ?auto_826401 ) ) ( not ( = ?auto_826393 ?auto_826402 ) ) ( not ( = ?auto_826393 ?auto_826403 ) ) ( not ( = ?auto_826393 ?auto_826404 ) ) ( not ( = ?auto_826393 ?auto_826405 ) ) ( not ( = ?auto_826393 ?auto_826406 ) ) ( not ( = ?auto_826393 ?auto_826407 ) ) ( not ( = ?auto_826393 ?auto_826408 ) ) ( not ( = ?auto_826394 ?auto_826395 ) ) ( not ( = ?auto_826394 ?auto_826396 ) ) ( not ( = ?auto_826394 ?auto_826397 ) ) ( not ( = ?auto_826394 ?auto_826398 ) ) ( not ( = ?auto_826394 ?auto_826399 ) ) ( not ( = ?auto_826394 ?auto_826400 ) ) ( not ( = ?auto_826394 ?auto_826401 ) ) ( not ( = ?auto_826394 ?auto_826402 ) ) ( not ( = ?auto_826394 ?auto_826403 ) ) ( not ( = ?auto_826394 ?auto_826404 ) ) ( not ( = ?auto_826394 ?auto_826405 ) ) ( not ( = ?auto_826394 ?auto_826406 ) ) ( not ( = ?auto_826394 ?auto_826407 ) ) ( not ( = ?auto_826394 ?auto_826408 ) ) ( not ( = ?auto_826395 ?auto_826396 ) ) ( not ( = ?auto_826395 ?auto_826397 ) ) ( not ( = ?auto_826395 ?auto_826398 ) ) ( not ( = ?auto_826395 ?auto_826399 ) ) ( not ( = ?auto_826395 ?auto_826400 ) ) ( not ( = ?auto_826395 ?auto_826401 ) ) ( not ( = ?auto_826395 ?auto_826402 ) ) ( not ( = ?auto_826395 ?auto_826403 ) ) ( not ( = ?auto_826395 ?auto_826404 ) ) ( not ( = ?auto_826395 ?auto_826405 ) ) ( not ( = ?auto_826395 ?auto_826406 ) ) ( not ( = ?auto_826395 ?auto_826407 ) ) ( not ( = ?auto_826395 ?auto_826408 ) ) ( not ( = ?auto_826396 ?auto_826397 ) ) ( not ( = ?auto_826396 ?auto_826398 ) ) ( not ( = ?auto_826396 ?auto_826399 ) ) ( not ( = ?auto_826396 ?auto_826400 ) ) ( not ( = ?auto_826396 ?auto_826401 ) ) ( not ( = ?auto_826396 ?auto_826402 ) ) ( not ( = ?auto_826396 ?auto_826403 ) ) ( not ( = ?auto_826396 ?auto_826404 ) ) ( not ( = ?auto_826396 ?auto_826405 ) ) ( not ( = ?auto_826396 ?auto_826406 ) ) ( not ( = ?auto_826396 ?auto_826407 ) ) ( not ( = ?auto_826396 ?auto_826408 ) ) ( not ( = ?auto_826397 ?auto_826398 ) ) ( not ( = ?auto_826397 ?auto_826399 ) ) ( not ( = ?auto_826397 ?auto_826400 ) ) ( not ( = ?auto_826397 ?auto_826401 ) ) ( not ( = ?auto_826397 ?auto_826402 ) ) ( not ( = ?auto_826397 ?auto_826403 ) ) ( not ( = ?auto_826397 ?auto_826404 ) ) ( not ( = ?auto_826397 ?auto_826405 ) ) ( not ( = ?auto_826397 ?auto_826406 ) ) ( not ( = ?auto_826397 ?auto_826407 ) ) ( not ( = ?auto_826397 ?auto_826408 ) ) ( not ( = ?auto_826398 ?auto_826399 ) ) ( not ( = ?auto_826398 ?auto_826400 ) ) ( not ( = ?auto_826398 ?auto_826401 ) ) ( not ( = ?auto_826398 ?auto_826402 ) ) ( not ( = ?auto_826398 ?auto_826403 ) ) ( not ( = ?auto_826398 ?auto_826404 ) ) ( not ( = ?auto_826398 ?auto_826405 ) ) ( not ( = ?auto_826398 ?auto_826406 ) ) ( not ( = ?auto_826398 ?auto_826407 ) ) ( not ( = ?auto_826398 ?auto_826408 ) ) ( not ( = ?auto_826399 ?auto_826400 ) ) ( not ( = ?auto_826399 ?auto_826401 ) ) ( not ( = ?auto_826399 ?auto_826402 ) ) ( not ( = ?auto_826399 ?auto_826403 ) ) ( not ( = ?auto_826399 ?auto_826404 ) ) ( not ( = ?auto_826399 ?auto_826405 ) ) ( not ( = ?auto_826399 ?auto_826406 ) ) ( not ( = ?auto_826399 ?auto_826407 ) ) ( not ( = ?auto_826399 ?auto_826408 ) ) ( not ( = ?auto_826400 ?auto_826401 ) ) ( not ( = ?auto_826400 ?auto_826402 ) ) ( not ( = ?auto_826400 ?auto_826403 ) ) ( not ( = ?auto_826400 ?auto_826404 ) ) ( not ( = ?auto_826400 ?auto_826405 ) ) ( not ( = ?auto_826400 ?auto_826406 ) ) ( not ( = ?auto_826400 ?auto_826407 ) ) ( not ( = ?auto_826400 ?auto_826408 ) ) ( not ( = ?auto_826401 ?auto_826402 ) ) ( not ( = ?auto_826401 ?auto_826403 ) ) ( not ( = ?auto_826401 ?auto_826404 ) ) ( not ( = ?auto_826401 ?auto_826405 ) ) ( not ( = ?auto_826401 ?auto_826406 ) ) ( not ( = ?auto_826401 ?auto_826407 ) ) ( not ( = ?auto_826401 ?auto_826408 ) ) ( not ( = ?auto_826402 ?auto_826403 ) ) ( not ( = ?auto_826402 ?auto_826404 ) ) ( not ( = ?auto_826402 ?auto_826405 ) ) ( not ( = ?auto_826402 ?auto_826406 ) ) ( not ( = ?auto_826402 ?auto_826407 ) ) ( not ( = ?auto_826402 ?auto_826408 ) ) ( not ( = ?auto_826403 ?auto_826404 ) ) ( not ( = ?auto_826403 ?auto_826405 ) ) ( not ( = ?auto_826403 ?auto_826406 ) ) ( not ( = ?auto_826403 ?auto_826407 ) ) ( not ( = ?auto_826403 ?auto_826408 ) ) ( not ( = ?auto_826404 ?auto_826405 ) ) ( not ( = ?auto_826404 ?auto_826406 ) ) ( not ( = ?auto_826404 ?auto_826407 ) ) ( not ( = ?auto_826404 ?auto_826408 ) ) ( not ( = ?auto_826405 ?auto_826406 ) ) ( not ( = ?auto_826405 ?auto_826407 ) ) ( not ( = ?auto_826405 ?auto_826408 ) ) ( not ( = ?auto_826406 ?auto_826407 ) ) ( not ( = ?auto_826406 ?auto_826408 ) ) ( not ( = ?auto_826407 ?auto_826408 ) ) ( CLEAR ?auto_826405 ) ( ON ?auto_826406 ?auto_826407 ) ( CLEAR ?auto_826406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_826390 ?auto_826391 ?auto_826392 ?auto_826393 ?auto_826394 ?auto_826395 ?auto_826396 ?auto_826397 ?auto_826398 ?auto_826399 ?auto_826400 ?auto_826401 ?auto_826402 ?auto_826403 ?auto_826404 ?auto_826405 ?auto_826406 )
      ( MAKE-18PILE ?auto_826390 ?auto_826391 ?auto_826392 ?auto_826393 ?auto_826394 ?auto_826395 ?auto_826396 ?auto_826397 ?auto_826398 ?auto_826399 ?auto_826400 ?auto_826401 ?auto_826402 ?auto_826403 ?auto_826404 ?auto_826405 ?auto_826406 ?auto_826407 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826427 - BLOCK
      ?auto_826428 - BLOCK
      ?auto_826429 - BLOCK
      ?auto_826430 - BLOCK
      ?auto_826431 - BLOCK
      ?auto_826432 - BLOCK
      ?auto_826433 - BLOCK
      ?auto_826434 - BLOCK
      ?auto_826435 - BLOCK
      ?auto_826436 - BLOCK
      ?auto_826437 - BLOCK
      ?auto_826438 - BLOCK
      ?auto_826439 - BLOCK
      ?auto_826440 - BLOCK
      ?auto_826441 - BLOCK
      ?auto_826442 - BLOCK
      ?auto_826443 - BLOCK
      ?auto_826444 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_826444 ) ( ON-TABLE ?auto_826427 ) ( ON ?auto_826428 ?auto_826427 ) ( ON ?auto_826429 ?auto_826428 ) ( ON ?auto_826430 ?auto_826429 ) ( ON ?auto_826431 ?auto_826430 ) ( ON ?auto_826432 ?auto_826431 ) ( ON ?auto_826433 ?auto_826432 ) ( ON ?auto_826434 ?auto_826433 ) ( ON ?auto_826435 ?auto_826434 ) ( ON ?auto_826436 ?auto_826435 ) ( ON ?auto_826437 ?auto_826436 ) ( ON ?auto_826438 ?auto_826437 ) ( ON ?auto_826439 ?auto_826438 ) ( ON ?auto_826440 ?auto_826439 ) ( ON ?auto_826441 ?auto_826440 ) ( ON ?auto_826442 ?auto_826441 ) ( not ( = ?auto_826427 ?auto_826428 ) ) ( not ( = ?auto_826427 ?auto_826429 ) ) ( not ( = ?auto_826427 ?auto_826430 ) ) ( not ( = ?auto_826427 ?auto_826431 ) ) ( not ( = ?auto_826427 ?auto_826432 ) ) ( not ( = ?auto_826427 ?auto_826433 ) ) ( not ( = ?auto_826427 ?auto_826434 ) ) ( not ( = ?auto_826427 ?auto_826435 ) ) ( not ( = ?auto_826427 ?auto_826436 ) ) ( not ( = ?auto_826427 ?auto_826437 ) ) ( not ( = ?auto_826427 ?auto_826438 ) ) ( not ( = ?auto_826427 ?auto_826439 ) ) ( not ( = ?auto_826427 ?auto_826440 ) ) ( not ( = ?auto_826427 ?auto_826441 ) ) ( not ( = ?auto_826427 ?auto_826442 ) ) ( not ( = ?auto_826427 ?auto_826443 ) ) ( not ( = ?auto_826427 ?auto_826444 ) ) ( not ( = ?auto_826428 ?auto_826429 ) ) ( not ( = ?auto_826428 ?auto_826430 ) ) ( not ( = ?auto_826428 ?auto_826431 ) ) ( not ( = ?auto_826428 ?auto_826432 ) ) ( not ( = ?auto_826428 ?auto_826433 ) ) ( not ( = ?auto_826428 ?auto_826434 ) ) ( not ( = ?auto_826428 ?auto_826435 ) ) ( not ( = ?auto_826428 ?auto_826436 ) ) ( not ( = ?auto_826428 ?auto_826437 ) ) ( not ( = ?auto_826428 ?auto_826438 ) ) ( not ( = ?auto_826428 ?auto_826439 ) ) ( not ( = ?auto_826428 ?auto_826440 ) ) ( not ( = ?auto_826428 ?auto_826441 ) ) ( not ( = ?auto_826428 ?auto_826442 ) ) ( not ( = ?auto_826428 ?auto_826443 ) ) ( not ( = ?auto_826428 ?auto_826444 ) ) ( not ( = ?auto_826429 ?auto_826430 ) ) ( not ( = ?auto_826429 ?auto_826431 ) ) ( not ( = ?auto_826429 ?auto_826432 ) ) ( not ( = ?auto_826429 ?auto_826433 ) ) ( not ( = ?auto_826429 ?auto_826434 ) ) ( not ( = ?auto_826429 ?auto_826435 ) ) ( not ( = ?auto_826429 ?auto_826436 ) ) ( not ( = ?auto_826429 ?auto_826437 ) ) ( not ( = ?auto_826429 ?auto_826438 ) ) ( not ( = ?auto_826429 ?auto_826439 ) ) ( not ( = ?auto_826429 ?auto_826440 ) ) ( not ( = ?auto_826429 ?auto_826441 ) ) ( not ( = ?auto_826429 ?auto_826442 ) ) ( not ( = ?auto_826429 ?auto_826443 ) ) ( not ( = ?auto_826429 ?auto_826444 ) ) ( not ( = ?auto_826430 ?auto_826431 ) ) ( not ( = ?auto_826430 ?auto_826432 ) ) ( not ( = ?auto_826430 ?auto_826433 ) ) ( not ( = ?auto_826430 ?auto_826434 ) ) ( not ( = ?auto_826430 ?auto_826435 ) ) ( not ( = ?auto_826430 ?auto_826436 ) ) ( not ( = ?auto_826430 ?auto_826437 ) ) ( not ( = ?auto_826430 ?auto_826438 ) ) ( not ( = ?auto_826430 ?auto_826439 ) ) ( not ( = ?auto_826430 ?auto_826440 ) ) ( not ( = ?auto_826430 ?auto_826441 ) ) ( not ( = ?auto_826430 ?auto_826442 ) ) ( not ( = ?auto_826430 ?auto_826443 ) ) ( not ( = ?auto_826430 ?auto_826444 ) ) ( not ( = ?auto_826431 ?auto_826432 ) ) ( not ( = ?auto_826431 ?auto_826433 ) ) ( not ( = ?auto_826431 ?auto_826434 ) ) ( not ( = ?auto_826431 ?auto_826435 ) ) ( not ( = ?auto_826431 ?auto_826436 ) ) ( not ( = ?auto_826431 ?auto_826437 ) ) ( not ( = ?auto_826431 ?auto_826438 ) ) ( not ( = ?auto_826431 ?auto_826439 ) ) ( not ( = ?auto_826431 ?auto_826440 ) ) ( not ( = ?auto_826431 ?auto_826441 ) ) ( not ( = ?auto_826431 ?auto_826442 ) ) ( not ( = ?auto_826431 ?auto_826443 ) ) ( not ( = ?auto_826431 ?auto_826444 ) ) ( not ( = ?auto_826432 ?auto_826433 ) ) ( not ( = ?auto_826432 ?auto_826434 ) ) ( not ( = ?auto_826432 ?auto_826435 ) ) ( not ( = ?auto_826432 ?auto_826436 ) ) ( not ( = ?auto_826432 ?auto_826437 ) ) ( not ( = ?auto_826432 ?auto_826438 ) ) ( not ( = ?auto_826432 ?auto_826439 ) ) ( not ( = ?auto_826432 ?auto_826440 ) ) ( not ( = ?auto_826432 ?auto_826441 ) ) ( not ( = ?auto_826432 ?auto_826442 ) ) ( not ( = ?auto_826432 ?auto_826443 ) ) ( not ( = ?auto_826432 ?auto_826444 ) ) ( not ( = ?auto_826433 ?auto_826434 ) ) ( not ( = ?auto_826433 ?auto_826435 ) ) ( not ( = ?auto_826433 ?auto_826436 ) ) ( not ( = ?auto_826433 ?auto_826437 ) ) ( not ( = ?auto_826433 ?auto_826438 ) ) ( not ( = ?auto_826433 ?auto_826439 ) ) ( not ( = ?auto_826433 ?auto_826440 ) ) ( not ( = ?auto_826433 ?auto_826441 ) ) ( not ( = ?auto_826433 ?auto_826442 ) ) ( not ( = ?auto_826433 ?auto_826443 ) ) ( not ( = ?auto_826433 ?auto_826444 ) ) ( not ( = ?auto_826434 ?auto_826435 ) ) ( not ( = ?auto_826434 ?auto_826436 ) ) ( not ( = ?auto_826434 ?auto_826437 ) ) ( not ( = ?auto_826434 ?auto_826438 ) ) ( not ( = ?auto_826434 ?auto_826439 ) ) ( not ( = ?auto_826434 ?auto_826440 ) ) ( not ( = ?auto_826434 ?auto_826441 ) ) ( not ( = ?auto_826434 ?auto_826442 ) ) ( not ( = ?auto_826434 ?auto_826443 ) ) ( not ( = ?auto_826434 ?auto_826444 ) ) ( not ( = ?auto_826435 ?auto_826436 ) ) ( not ( = ?auto_826435 ?auto_826437 ) ) ( not ( = ?auto_826435 ?auto_826438 ) ) ( not ( = ?auto_826435 ?auto_826439 ) ) ( not ( = ?auto_826435 ?auto_826440 ) ) ( not ( = ?auto_826435 ?auto_826441 ) ) ( not ( = ?auto_826435 ?auto_826442 ) ) ( not ( = ?auto_826435 ?auto_826443 ) ) ( not ( = ?auto_826435 ?auto_826444 ) ) ( not ( = ?auto_826436 ?auto_826437 ) ) ( not ( = ?auto_826436 ?auto_826438 ) ) ( not ( = ?auto_826436 ?auto_826439 ) ) ( not ( = ?auto_826436 ?auto_826440 ) ) ( not ( = ?auto_826436 ?auto_826441 ) ) ( not ( = ?auto_826436 ?auto_826442 ) ) ( not ( = ?auto_826436 ?auto_826443 ) ) ( not ( = ?auto_826436 ?auto_826444 ) ) ( not ( = ?auto_826437 ?auto_826438 ) ) ( not ( = ?auto_826437 ?auto_826439 ) ) ( not ( = ?auto_826437 ?auto_826440 ) ) ( not ( = ?auto_826437 ?auto_826441 ) ) ( not ( = ?auto_826437 ?auto_826442 ) ) ( not ( = ?auto_826437 ?auto_826443 ) ) ( not ( = ?auto_826437 ?auto_826444 ) ) ( not ( = ?auto_826438 ?auto_826439 ) ) ( not ( = ?auto_826438 ?auto_826440 ) ) ( not ( = ?auto_826438 ?auto_826441 ) ) ( not ( = ?auto_826438 ?auto_826442 ) ) ( not ( = ?auto_826438 ?auto_826443 ) ) ( not ( = ?auto_826438 ?auto_826444 ) ) ( not ( = ?auto_826439 ?auto_826440 ) ) ( not ( = ?auto_826439 ?auto_826441 ) ) ( not ( = ?auto_826439 ?auto_826442 ) ) ( not ( = ?auto_826439 ?auto_826443 ) ) ( not ( = ?auto_826439 ?auto_826444 ) ) ( not ( = ?auto_826440 ?auto_826441 ) ) ( not ( = ?auto_826440 ?auto_826442 ) ) ( not ( = ?auto_826440 ?auto_826443 ) ) ( not ( = ?auto_826440 ?auto_826444 ) ) ( not ( = ?auto_826441 ?auto_826442 ) ) ( not ( = ?auto_826441 ?auto_826443 ) ) ( not ( = ?auto_826441 ?auto_826444 ) ) ( not ( = ?auto_826442 ?auto_826443 ) ) ( not ( = ?auto_826442 ?auto_826444 ) ) ( not ( = ?auto_826443 ?auto_826444 ) ) ( CLEAR ?auto_826442 ) ( ON ?auto_826443 ?auto_826444 ) ( CLEAR ?auto_826443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_826427 ?auto_826428 ?auto_826429 ?auto_826430 ?auto_826431 ?auto_826432 ?auto_826433 ?auto_826434 ?auto_826435 ?auto_826436 ?auto_826437 ?auto_826438 ?auto_826439 ?auto_826440 ?auto_826441 ?auto_826442 ?auto_826443 )
      ( MAKE-18PILE ?auto_826427 ?auto_826428 ?auto_826429 ?auto_826430 ?auto_826431 ?auto_826432 ?auto_826433 ?auto_826434 ?auto_826435 ?auto_826436 ?auto_826437 ?auto_826438 ?auto_826439 ?auto_826440 ?auto_826441 ?auto_826442 ?auto_826443 ?auto_826444 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826463 - BLOCK
      ?auto_826464 - BLOCK
      ?auto_826465 - BLOCK
      ?auto_826466 - BLOCK
      ?auto_826467 - BLOCK
      ?auto_826468 - BLOCK
      ?auto_826469 - BLOCK
      ?auto_826470 - BLOCK
      ?auto_826471 - BLOCK
      ?auto_826472 - BLOCK
      ?auto_826473 - BLOCK
      ?auto_826474 - BLOCK
      ?auto_826475 - BLOCK
      ?auto_826476 - BLOCK
      ?auto_826477 - BLOCK
      ?auto_826478 - BLOCK
      ?auto_826479 - BLOCK
      ?auto_826480 - BLOCK
    )
    :vars
    (
      ?auto_826481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826480 ?auto_826481 ) ( ON-TABLE ?auto_826463 ) ( ON ?auto_826464 ?auto_826463 ) ( ON ?auto_826465 ?auto_826464 ) ( ON ?auto_826466 ?auto_826465 ) ( ON ?auto_826467 ?auto_826466 ) ( ON ?auto_826468 ?auto_826467 ) ( ON ?auto_826469 ?auto_826468 ) ( ON ?auto_826470 ?auto_826469 ) ( ON ?auto_826471 ?auto_826470 ) ( ON ?auto_826472 ?auto_826471 ) ( ON ?auto_826473 ?auto_826472 ) ( ON ?auto_826474 ?auto_826473 ) ( ON ?auto_826475 ?auto_826474 ) ( ON ?auto_826476 ?auto_826475 ) ( ON ?auto_826477 ?auto_826476 ) ( not ( = ?auto_826463 ?auto_826464 ) ) ( not ( = ?auto_826463 ?auto_826465 ) ) ( not ( = ?auto_826463 ?auto_826466 ) ) ( not ( = ?auto_826463 ?auto_826467 ) ) ( not ( = ?auto_826463 ?auto_826468 ) ) ( not ( = ?auto_826463 ?auto_826469 ) ) ( not ( = ?auto_826463 ?auto_826470 ) ) ( not ( = ?auto_826463 ?auto_826471 ) ) ( not ( = ?auto_826463 ?auto_826472 ) ) ( not ( = ?auto_826463 ?auto_826473 ) ) ( not ( = ?auto_826463 ?auto_826474 ) ) ( not ( = ?auto_826463 ?auto_826475 ) ) ( not ( = ?auto_826463 ?auto_826476 ) ) ( not ( = ?auto_826463 ?auto_826477 ) ) ( not ( = ?auto_826463 ?auto_826478 ) ) ( not ( = ?auto_826463 ?auto_826479 ) ) ( not ( = ?auto_826463 ?auto_826480 ) ) ( not ( = ?auto_826463 ?auto_826481 ) ) ( not ( = ?auto_826464 ?auto_826465 ) ) ( not ( = ?auto_826464 ?auto_826466 ) ) ( not ( = ?auto_826464 ?auto_826467 ) ) ( not ( = ?auto_826464 ?auto_826468 ) ) ( not ( = ?auto_826464 ?auto_826469 ) ) ( not ( = ?auto_826464 ?auto_826470 ) ) ( not ( = ?auto_826464 ?auto_826471 ) ) ( not ( = ?auto_826464 ?auto_826472 ) ) ( not ( = ?auto_826464 ?auto_826473 ) ) ( not ( = ?auto_826464 ?auto_826474 ) ) ( not ( = ?auto_826464 ?auto_826475 ) ) ( not ( = ?auto_826464 ?auto_826476 ) ) ( not ( = ?auto_826464 ?auto_826477 ) ) ( not ( = ?auto_826464 ?auto_826478 ) ) ( not ( = ?auto_826464 ?auto_826479 ) ) ( not ( = ?auto_826464 ?auto_826480 ) ) ( not ( = ?auto_826464 ?auto_826481 ) ) ( not ( = ?auto_826465 ?auto_826466 ) ) ( not ( = ?auto_826465 ?auto_826467 ) ) ( not ( = ?auto_826465 ?auto_826468 ) ) ( not ( = ?auto_826465 ?auto_826469 ) ) ( not ( = ?auto_826465 ?auto_826470 ) ) ( not ( = ?auto_826465 ?auto_826471 ) ) ( not ( = ?auto_826465 ?auto_826472 ) ) ( not ( = ?auto_826465 ?auto_826473 ) ) ( not ( = ?auto_826465 ?auto_826474 ) ) ( not ( = ?auto_826465 ?auto_826475 ) ) ( not ( = ?auto_826465 ?auto_826476 ) ) ( not ( = ?auto_826465 ?auto_826477 ) ) ( not ( = ?auto_826465 ?auto_826478 ) ) ( not ( = ?auto_826465 ?auto_826479 ) ) ( not ( = ?auto_826465 ?auto_826480 ) ) ( not ( = ?auto_826465 ?auto_826481 ) ) ( not ( = ?auto_826466 ?auto_826467 ) ) ( not ( = ?auto_826466 ?auto_826468 ) ) ( not ( = ?auto_826466 ?auto_826469 ) ) ( not ( = ?auto_826466 ?auto_826470 ) ) ( not ( = ?auto_826466 ?auto_826471 ) ) ( not ( = ?auto_826466 ?auto_826472 ) ) ( not ( = ?auto_826466 ?auto_826473 ) ) ( not ( = ?auto_826466 ?auto_826474 ) ) ( not ( = ?auto_826466 ?auto_826475 ) ) ( not ( = ?auto_826466 ?auto_826476 ) ) ( not ( = ?auto_826466 ?auto_826477 ) ) ( not ( = ?auto_826466 ?auto_826478 ) ) ( not ( = ?auto_826466 ?auto_826479 ) ) ( not ( = ?auto_826466 ?auto_826480 ) ) ( not ( = ?auto_826466 ?auto_826481 ) ) ( not ( = ?auto_826467 ?auto_826468 ) ) ( not ( = ?auto_826467 ?auto_826469 ) ) ( not ( = ?auto_826467 ?auto_826470 ) ) ( not ( = ?auto_826467 ?auto_826471 ) ) ( not ( = ?auto_826467 ?auto_826472 ) ) ( not ( = ?auto_826467 ?auto_826473 ) ) ( not ( = ?auto_826467 ?auto_826474 ) ) ( not ( = ?auto_826467 ?auto_826475 ) ) ( not ( = ?auto_826467 ?auto_826476 ) ) ( not ( = ?auto_826467 ?auto_826477 ) ) ( not ( = ?auto_826467 ?auto_826478 ) ) ( not ( = ?auto_826467 ?auto_826479 ) ) ( not ( = ?auto_826467 ?auto_826480 ) ) ( not ( = ?auto_826467 ?auto_826481 ) ) ( not ( = ?auto_826468 ?auto_826469 ) ) ( not ( = ?auto_826468 ?auto_826470 ) ) ( not ( = ?auto_826468 ?auto_826471 ) ) ( not ( = ?auto_826468 ?auto_826472 ) ) ( not ( = ?auto_826468 ?auto_826473 ) ) ( not ( = ?auto_826468 ?auto_826474 ) ) ( not ( = ?auto_826468 ?auto_826475 ) ) ( not ( = ?auto_826468 ?auto_826476 ) ) ( not ( = ?auto_826468 ?auto_826477 ) ) ( not ( = ?auto_826468 ?auto_826478 ) ) ( not ( = ?auto_826468 ?auto_826479 ) ) ( not ( = ?auto_826468 ?auto_826480 ) ) ( not ( = ?auto_826468 ?auto_826481 ) ) ( not ( = ?auto_826469 ?auto_826470 ) ) ( not ( = ?auto_826469 ?auto_826471 ) ) ( not ( = ?auto_826469 ?auto_826472 ) ) ( not ( = ?auto_826469 ?auto_826473 ) ) ( not ( = ?auto_826469 ?auto_826474 ) ) ( not ( = ?auto_826469 ?auto_826475 ) ) ( not ( = ?auto_826469 ?auto_826476 ) ) ( not ( = ?auto_826469 ?auto_826477 ) ) ( not ( = ?auto_826469 ?auto_826478 ) ) ( not ( = ?auto_826469 ?auto_826479 ) ) ( not ( = ?auto_826469 ?auto_826480 ) ) ( not ( = ?auto_826469 ?auto_826481 ) ) ( not ( = ?auto_826470 ?auto_826471 ) ) ( not ( = ?auto_826470 ?auto_826472 ) ) ( not ( = ?auto_826470 ?auto_826473 ) ) ( not ( = ?auto_826470 ?auto_826474 ) ) ( not ( = ?auto_826470 ?auto_826475 ) ) ( not ( = ?auto_826470 ?auto_826476 ) ) ( not ( = ?auto_826470 ?auto_826477 ) ) ( not ( = ?auto_826470 ?auto_826478 ) ) ( not ( = ?auto_826470 ?auto_826479 ) ) ( not ( = ?auto_826470 ?auto_826480 ) ) ( not ( = ?auto_826470 ?auto_826481 ) ) ( not ( = ?auto_826471 ?auto_826472 ) ) ( not ( = ?auto_826471 ?auto_826473 ) ) ( not ( = ?auto_826471 ?auto_826474 ) ) ( not ( = ?auto_826471 ?auto_826475 ) ) ( not ( = ?auto_826471 ?auto_826476 ) ) ( not ( = ?auto_826471 ?auto_826477 ) ) ( not ( = ?auto_826471 ?auto_826478 ) ) ( not ( = ?auto_826471 ?auto_826479 ) ) ( not ( = ?auto_826471 ?auto_826480 ) ) ( not ( = ?auto_826471 ?auto_826481 ) ) ( not ( = ?auto_826472 ?auto_826473 ) ) ( not ( = ?auto_826472 ?auto_826474 ) ) ( not ( = ?auto_826472 ?auto_826475 ) ) ( not ( = ?auto_826472 ?auto_826476 ) ) ( not ( = ?auto_826472 ?auto_826477 ) ) ( not ( = ?auto_826472 ?auto_826478 ) ) ( not ( = ?auto_826472 ?auto_826479 ) ) ( not ( = ?auto_826472 ?auto_826480 ) ) ( not ( = ?auto_826472 ?auto_826481 ) ) ( not ( = ?auto_826473 ?auto_826474 ) ) ( not ( = ?auto_826473 ?auto_826475 ) ) ( not ( = ?auto_826473 ?auto_826476 ) ) ( not ( = ?auto_826473 ?auto_826477 ) ) ( not ( = ?auto_826473 ?auto_826478 ) ) ( not ( = ?auto_826473 ?auto_826479 ) ) ( not ( = ?auto_826473 ?auto_826480 ) ) ( not ( = ?auto_826473 ?auto_826481 ) ) ( not ( = ?auto_826474 ?auto_826475 ) ) ( not ( = ?auto_826474 ?auto_826476 ) ) ( not ( = ?auto_826474 ?auto_826477 ) ) ( not ( = ?auto_826474 ?auto_826478 ) ) ( not ( = ?auto_826474 ?auto_826479 ) ) ( not ( = ?auto_826474 ?auto_826480 ) ) ( not ( = ?auto_826474 ?auto_826481 ) ) ( not ( = ?auto_826475 ?auto_826476 ) ) ( not ( = ?auto_826475 ?auto_826477 ) ) ( not ( = ?auto_826475 ?auto_826478 ) ) ( not ( = ?auto_826475 ?auto_826479 ) ) ( not ( = ?auto_826475 ?auto_826480 ) ) ( not ( = ?auto_826475 ?auto_826481 ) ) ( not ( = ?auto_826476 ?auto_826477 ) ) ( not ( = ?auto_826476 ?auto_826478 ) ) ( not ( = ?auto_826476 ?auto_826479 ) ) ( not ( = ?auto_826476 ?auto_826480 ) ) ( not ( = ?auto_826476 ?auto_826481 ) ) ( not ( = ?auto_826477 ?auto_826478 ) ) ( not ( = ?auto_826477 ?auto_826479 ) ) ( not ( = ?auto_826477 ?auto_826480 ) ) ( not ( = ?auto_826477 ?auto_826481 ) ) ( not ( = ?auto_826478 ?auto_826479 ) ) ( not ( = ?auto_826478 ?auto_826480 ) ) ( not ( = ?auto_826478 ?auto_826481 ) ) ( not ( = ?auto_826479 ?auto_826480 ) ) ( not ( = ?auto_826479 ?auto_826481 ) ) ( not ( = ?auto_826480 ?auto_826481 ) ) ( ON ?auto_826479 ?auto_826480 ) ( CLEAR ?auto_826477 ) ( ON ?auto_826478 ?auto_826479 ) ( CLEAR ?auto_826478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_826463 ?auto_826464 ?auto_826465 ?auto_826466 ?auto_826467 ?auto_826468 ?auto_826469 ?auto_826470 ?auto_826471 ?auto_826472 ?auto_826473 ?auto_826474 ?auto_826475 ?auto_826476 ?auto_826477 ?auto_826478 )
      ( MAKE-18PILE ?auto_826463 ?auto_826464 ?auto_826465 ?auto_826466 ?auto_826467 ?auto_826468 ?auto_826469 ?auto_826470 ?auto_826471 ?auto_826472 ?auto_826473 ?auto_826474 ?auto_826475 ?auto_826476 ?auto_826477 ?auto_826478 ?auto_826479 ?auto_826480 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826500 - BLOCK
      ?auto_826501 - BLOCK
      ?auto_826502 - BLOCK
      ?auto_826503 - BLOCK
      ?auto_826504 - BLOCK
      ?auto_826505 - BLOCK
      ?auto_826506 - BLOCK
      ?auto_826507 - BLOCK
      ?auto_826508 - BLOCK
      ?auto_826509 - BLOCK
      ?auto_826510 - BLOCK
      ?auto_826511 - BLOCK
      ?auto_826512 - BLOCK
      ?auto_826513 - BLOCK
      ?auto_826514 - BLOCK
      ?auto_826515 - BLOCK
      ?auto_826516 - BLOCK
      ?auto_826517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_826517 ) ( ON-TABLE ?auto_826500 ) ( ON ?auto_826501 ?auto_826500 ) ( ON ?auto_826502 ?auto_826501 ) ( ON ?auto_826503 ?auto_826502 ) ( ON ?auto_826504 ?auto_826503 ) ( ON ?auto_826505 ?auto_826504 ) ( ON ?auto_826506 ?auto_826505 ) ( ON ?auto_826507 ?auto_826506 ) ( ON ?auto_826508 ?auto_826507 ) ( ON ?auto_826509 ?auto_826508 ) ( ON ?auto_826510 ?auto_826509 ) ( ON ?auto_826511 ?auto_826510 ) ( ON ?auto_826512 ?auto_826511 ) ( ON ?auto_826513 ?auto_826512 ) ( ON ?auto_826514 ?auto_826513 ) ( not ( = ?auto_826500 ?auto_826501 ) ) ( not ( = ?auto_826500 ?auto_826502 ) ) ( not ( = ?auto_826500 ?auto_826503 ) ) ( not ( = ?auto_826500 ?auto_826504 ) ) ( not ( = ?auto_826500 ?auto_826505 ) ) ( not ( = ?auto_826500 ?auto_826506 ) ) ( not ( = ?auto_826500 ?auto_826507 ) ) ( not ( = ?auto_826500 ?auto_826508 ) ) ( not ( = ?auto_826500 ?auto_826509 ) ) ( not ( = ?auto_826500 ?auto_826510 ) ) ( not ( = ?auto_826500 ?auto_826511 ) ) ( not ( = ?auto_826500 ?auto_826512 ) ) ( not ( = ?auto_826500 ?auto_826513 ) ) ( not ( = ?auto_826500 ?auto_826514 ) ) ( not ( = ?auto_826500 ?auto_826515 ) ) ( not ( = ?auto_826500 ?auto_826516 ) ) ( not ( = ?auto_826500 ?auto_826517 ) ) ( not ( = ?auto_826501 ?auto_826502 ) ) ( not ( = ?auto_826501 ?auto_826503 ) ) ( not ( = ?auto_826501 ?auto_826504 ) ) ( not ( = ?auto_826501 ?auto_826505 ) ) ( not ( = ?auto_826501 ?auto_826506 ) ) ( not ( = ?auto_826501 ?auto_826507 ) ) ( not ( = ?auto_826501 ?auto_826508 ) ) ( not ( = ?auto_826501 ?auto_826509 ) ) ( not ( = ?auto_826501 ?auto_826510 ) ) ( not ( = ?auto_826501 ?auto_826511 ) ) ( not ( = ?auto_826501 ?auto_826512 ) ) ( not ( = ?auto_826501 ?auto_826513 ) ) ( not ( = ?auto_826501 ?auto_826514 ) ) ( not ( = ?auto_826501 ?auto_826515 ) ) ( not ( = ?auto_826501 ?auto_826516 ) ) ( not ( = ?auto_826501 ?auto_826517 ) ) ( not ( = ?auto_826502 ?auto_826503 ) ) ( not ( = ?auto_826502 ?auto_826504 ) ) ( not ( = ?auto_826502 ?auto_826505 ) ) ( not ( = ?auto_826502 ?auto_826506 ) ) ( not ( = ?auto_826502 ?auto_826507 ) ) ( not ( = ?auto_826502 ?auto_826508 ) ) ( not ( = ?auto_826502 ?auto_826509 ) ) ( not ( = ?auto_826502 ?auto_826510 ) ) ( not ( = ?auto_826502 ?auto_826511 ) ) ( not ( = ?auto_826502 ?auto_826512 ) ) ( not ( = ?auto_826502 ?auto_826513 ) ) ( not ( = ?auto_826502 ?auto_826514 ) ) ( not ( = ?auto_826502 ?auto_826515 ) ) ( not ( = ?auto_826502 ?auto_826516 ) ) ( not ( = ?auto_826502 ?auto_826517 ) ) ( not ( = ?auto_826503 ?auto_826504 ) ) ( not ( = ?auto_826503 ?auto_826505 ) ) ( not ( = ?auto_826503 ?auto_826506 ) ) ( not ( = ?auto_826503 ?auto_826507 ) ) ( not ( = ?auto_826503 ?auto_826508 ) ) ( not ( = ?auto_826503 ?auto_826509 ) ) ( not ( = ?auto_826503 ?auto_826510 ) ) ( not ( = ?auto_826503 ?auto_826511 ) ) ( not ( = ?auto_826503 ?auto_826512 ) ) ( not ( = ?auto_826503 ?auto_826513 ) ) ( not ( = ?auto_826503 ?auto_826514 ) ) ( not ( = ?auto_826503 ?auto_826515 ) ) ( not ( = ?auto_826503 ?auto_826516 ) ) ( not ( = ?auto_826503 ?auto_826517 ) ) ( not ( = ?auto_826504 ?auto_826505 ) ) ( not ( = ?auto_826504 ?auto_826506 ) ) ( not ( = ?auto_826504 ?auto_826507 ) ) ( not ( = ?auto_826504 ?auto_826508 ) ) ( not ( = ?auto_826504 ?auto_826509 ) ) ( not ( = ?auto_826504 ?auto_826510 ) ) ( not ( = ?auto_826504 ?auto_826511 ) ) ( not ( = ?auto_826504 ?auto_826512 ) ) ( not ( = ?auto_826504 ?auto_826513 ) ) ( not ( = ?auto_826504 ?auto_826514 ) ) ( not ( = ?auto_826504 ?auto_826515 ) ) ( not ( = ?auto_826504 ?auto_826516 ) ) ( not ( = ?auto_826504 ?auto_826517 ) ) ( not ( = ?auto_826505 ?auto_826506 ) ) ( not ( = ?auto_826505 ?auto_826507 ) ) ( not ( = ?auto_826505 ?auto_826508 ) ) ( not ( = ?auto_826505 ?auto_826509 ) ) ( not ( = ?auto_826505 ?auto_826510 ) ) ( not ( = ?auto_826505 ?auto_826511 ) ) ( not ( = ?auto_826505 ?auto_826512 ) ) ( not ( = ?auto_826505 ?auto_826513 ) ) ( not ( = ?auto_826505 ?auto_826514 ) ) ( not ( = ?auto_826505 ?auto_826515 ) ) ( not ( = ?auto_826505 ?auto_826516 ) ) ( not ( = ?auto_826505 ?auto_826517 ) ) ( not ( = ?auto_826506 ?auto_826507 ) ) ( not ( = ?auto_826506 ?auto_826508 ) ) ( not ( = ?auto_826506 ?auto_826509 ) ) ( not ( = ?auto_826506 ?auto_826510 ) ) ( not ( = ?auto_826506 ?auto_826511 ) ) ( not ( = ?auto_826506 ?auto_826512 ) ) ( not ( = ?auto_826506 ?auto_826513 ) ) ( not ( = ?auto_826506 ?auto_826514 ) ) ( not ( = ?auto_826506 ?auto_826515 ) ) ( not ( = ?auto_826506 ?auto_826516 ) ) ( not ( = ?auto_826506 ?auto_826517 ) ) ( not ( = ?auto_826507 ?auto_826508 ) ) ( not ( = ?auto_826507 ?auto_826509 ) ) ( not ( = ?auto_826507 ?auto_826510 ) ) ( not ( = ?auto_826507 ?auto_826511 ) ) ( not ( = ?auto_826507 ?auto_826512 ) ) ( not ( = ?auto_826507 ?auto_826513 ) ) ( not ( = ?auto_826507 ?auto_826514 ) ) ( not ( = ?auto_826507 ?auto_826515 ) ) ( not ( = ?auto_826507 ?auto_826516 ) ) ( not ( = ?auto_826507 ?auto_826517 ) ) ( not ( = ?auto_826508 ?auto_826509 ) ) ( not ( = ?auto_826508 ?auto_826510 ) ) ( not ( = ?auto_826508 ?auto_826511 ) ) ( not ( = ?auto_826508 ?auto_826512 ) ) ( not ( = ?auto_826508 ?auto_826513 ) ) ( not ( = ?auto_826508 ?auto_826514 ) ) ( not ( = ?auto_826508 ?auto_826515 ) ) ( not ( = ?auto_826508 ?auto_826516 ) ) ( not ( = ?auto_826508 ?auto_826517 ) ) ( not ( = ?auto_826509 ?auto_826510 ) ) ( not ( = ?auto_826509 ?auto_826511 ) ) ( not ( = ?auto_826509 ?auto_826512 ) ) ( not ( = ?auto_826509 ?auto_826513 ) ) ( not ( = ?auto_826509 ?auto_826514 ) ) ( not ( = ?auto_826509 ?auto_826515 ) ) ( not ( = ?auto_826509 ?auto_826516 ) ) ( not ( = ?auto_826509 ?auto_826517 ) ) ( not ( = ?auto_826510 ?auto_826511 ) ) ( not ( = ?auto_826510 ?auto_826512 ) ) ( not ( = ?auto_826510 ?auto_826513 ) ) ( not ( = ?auto_826510 ?auto_826514 ) ) ( not ( = ?auto_826510 ?auto_826515 ) ) ( not ( = ?auto_826510 ?auto_826516 ) ) ( not ( = ?auto_826510 ?auto_826517 ) ) ( not ( = ?auto_826511 ?auto_826512 ) ) ( not ( = ?auto_826511 ?auto_826513 ) ) ( not ( = ?auto_826511 ?auto_826514 ) ) ( not ( = ?auto_826511 ?auto_826515 ) ) ( not ( = ?auto_826511 ?auto_826516 ) ) ( not ( = ?auto_826511 ?auto_826517 ) ) ( not ( = ?auto_826512 ?auto_826513 ) ) ( not ( = ?auto_826512 ?auto_826514 ) ) ( not ( = ?auto_826512 ?auto_826515 ) ) ( not ( = ?auto_826512 ?auto_826516 ) ) ( not ( = ?auto_826512 ?auto_826517 ) ) ( not ( = ?auto_826513 ?auto_826514 ) ) ( not ( = ?auto_826513 ?auto_826515 ) ) ( not ( = ?auto_826513 ?auto_826516 ) ) ( not ( = ?auto_826513 ?auto_826517 ) ) ( not ( = ?auto_826514 ?auto_826515 ) ) ( not ( = ?auto_826514 ?auto_826516 ) ) ( not ( = ?auto_826514 ?auto_826517 ) ) ( not ( = ?auto_826515 ?auto_826516 ) ) ( not ( = ?auto_826515 ?auto_826517 ) ) ( not ( = ?auto_826516 ?auto_826517 ) ) ( ON ?auto_826516 ?auto_826517 ) ( CLEAR ?auto_826514 ) ( ON ?auto_826515 ?auto_826516 ) ( CLEAR ?auto_826515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_826500 ?auto_826501 ?auto_826502 ?auto_826503 ?auto_826504 ?auto_826505 ?auto_826506 ?auto_826507 ?auto_826508 ?auto_826509 ?auto_826510 ?auto_826511 ?auto_826512 ?auto_826513 ?auto_826514 ?auto_826515 )
      ( MAKE-18PILE ?auto_826500 ?auto_826501 ?auto_826502 ?auto_826503 ?auto_826504 ?auto_826505 ?auto_826506 ?auto_826507 ?auto_826508 ?auto_826509 ?auto_826510 ?auto_826511 ?auto_826512 ?auto_826513 ?auto_826514 ?auto_826515 ?auto_826516 ?auto_826517 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826536 - BLOCK
      ?auto_826537 - BLOCK
      ?auto_826538 - BLOCK
      ?auto_826539 - BLOCK
      ?auto_826540 - BLOCK
      ?auto_826541 - BLOCK
      ?auto_826542 - BLOCK
      ?auto_826543 - BLOCK
      ?auto_826544 - BLOCK
      ?auto_826545 - BLOCK
      ?auto_826546 - BLOCK
      ?auto_826547 - BLOCK
      ?auto_826548 - BLOCK
      ?auto_826549 - BLOCK
      ?auto_826550 - BLOCK
      ?auto_826551 - BLOCK
      ?auto_826552 - BLOCK
      ?auto_826553 - BLOCK
    )
    :vars
    (
      ?auto_826554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826553 ?auto_826554 ) ( ON-TABLE ?auto_826536 ) ( ON ?auto_826537 ?auto_826536 ) ( ON ?auto_826538 ?auto_826537 ) ( ON ?auto_826539 ?auto_826538 ) ( ON ?auto_826540 ?auto_826539 ) ( ON ?auto_826541 ?auto_826540 ) ( ON ?auto_826542 ?auto_826541 ) ( ON ?auto_826543 ?auto_826542 ) ( ON ?auto_826544 ?auto_826543 ) ( ON ?auto_826545 ?auto_826544 ) ( ON ?auto_826546 ?auto_826545 ) ( ON ?auto_826547 ?auto_826546 ) ( ON ?auto_826548 ?auto_826547 ) ( ON ?auto_826549 ?auto_826548 ) ( not ( = ?auto_826536 ?auto_826537 ) ) ( not ( = ?auto_826536 ?auto_826538 ) ) ( not ( = ?auto_826536 ?auto_826539 ) ) ( not ( = ?auto_826536 ?auto_826540 ) ) ( not ( = ?auto_826536 ?auto_826541 ) ) ( not ( = ?auto_826536 ?auto_826542 ) ) ( not ( = ?auto_826536 ?auto_826543 ) ) ( not ( = ?auto_826536 ?auto_826544 ) ) ( not ( = ?auto_826536 ?auto_826545 ) ) ( not ( = ?auto_826536 ?auto_826546 ) ) ( not ( = ?auto_826536 ?auto_826547 ) ) ( not ( = ?auto_826536 ?auto_826548 ) ) ( not ( = ?auto_826536 ?auto_826549 ) ) ( not ( = ?auto_826536 ?auto_826550 ) ) ( not ( = ?auto_826536 ?auto_826551 ) ) ( not ( = ?auto_826536 ?auto_826552 ) ) ( not ( = ?auto_826536 ?auto_826553 ) ) ( not ( = ?auto_826536 ?auto_826554 ) ) ( not ( = ?auto_826537 ?auto_826538 ) ) ( not ( = ?auto_826537 ?auto_826539 ) ) ( not ( = ?auto_826537 ?auto_826540 ) ) ( not ( = ?auto_826537 ?auto_826541 ) ) ( not ( = ?auto_826537 ?auto_826542 ) ) ( not ( = ?auto_826537 ?auto_826543 ) ) ( not ( = ?auto_826537 ?auto_826544 ) ) ( not ( = ?auto_826537 ?auto_826545 ) ) ( not ( = ?auto_826537 ?auto_826546 ) ) ( not ( = ?auto_826537 ?auto_826547 ) ) ( not ( = ?auto_826537 ?auto_826548 ) ) ( not ( = ?auto_826537 ?auto_826549 ) ) ( not ( = ?auto_826537 ?auto_826550 ) ) ( not ( = ?auto_826537 ?auto_826551 ) ) ( not ( = ?auto_826537 ?auto_826552 ) ) ( not ( = ?auto_826537 ?auto_826553 ) ) ( not ( = ?auto_826537 ?auto_826554 ) ) ( not ( = ?auto_826538 ?auto_826539 ) ) ( not ( = ?auto_826538 ?auto_826540 ) ) ( not ( = ?auto_826538 ?auto_826541 ) ) ( not ( = ?auto_826538 ?auto_826542 ) ) ( not ( = ?auto_826538 ?auto_826543 ) ) ( not ( = ?auto_826538 ?auto_826544 ) ) ( not ( = ?auto_826538 ?auto_826545 ) ) ( not ( = ?auto_826538 ?auto_826546 ) ) ( not ( = ?auto_826538 ?auto_826547 ) ) ( not ( = ?auto_826538 ?auto_826548 ) ) ( not ( = ?auto_826538 ?auto_826549 ) ) ( not ( = ?auto_826538 ?auto_826550 ) ) ( not ( = ?auto_826538 ?auto_826551 ) ) ( not ( = ?auto_826538 ?auto_826552 ) ) ( not ( = ?auto_826538 ?auto_826553 ) ) ( not ( = ?auto_826538 ?auto_826554 ) ) ( not ( = ?auto_826539 ?auto_826540 ) ) ( not ( = ?auto_826539 ?auto_826541 ) ) ( not ( = ?auto_826539 ?auto_826542 ) ) ( not ( = ?auto_826539 ?auto_826543 ) ) ( not ( = ?auto_826539 ?auto_826544 ) ) ( not ( = ?auto_826539 ?auto_826545 ) ) ( not ( = ?auto_826539 ?auto_826546 ) ) ( not ( = ?auto_826539 ?auto_826547 ) ) ( not ( = ?auto_826539 ?auto_826548 ) ) ( not ( = ?auto_826539 ?auto_826549 ) ) ( not ( = ?auto_826539 ?auto_826550 ) ) ( not ( = ?auto_826539 ?auto_826551 ) ) ( not ( = ?auto_826539 ?auto_826552 ) ) ( not ( = ?auto_826539 ?auto_826553 ) ) ( not ( = ?auto_826539 ?auto_826554 ) ) ( not ( = ?auto_826540 ?auto_826541 ) ) ( not ( = ?auto_826540 ?auto_826542 ) ) ( not ( = ?auto_826540 ?auto_826543 ) ) ( not ( = ?auto_826540 ?auto_826544 ) ) ( not ( = ?auto_826540 ?auto_826545 ) ) ( not ( = ?auto_826540 ?auto_826546 ) ) ( not ( = ?auto_826540 ?auto_826547 ) ) ( not ( = ?auto_826540 ?auto_826548 ) ) ( not ( = ?auto_826540 ?auto_826549 ) ) ( not ( = ?auto_826540 ?auto_826550 ) ) ( not ( = ?auto_826540 ?auto_826551 ) ) ( not ( = ?auto_826540 ?auto_826552 ) ) ( not ( = ?auto_826540 ?auto_826553 ) ) ( not ( = ?auto_826540 ?auto_826554 ) ) ( not ( = ?auto_826541 ?auto_826542 ) ) ( not ( = ?auto_826541 ?auto_826543 ) ) ( not ( = ?auto_826541 ?auto_826544 ) ) ( not ( = ?auto_826541 ?auto_826545 ) ) ( not ( = ?auto_826541 ?auto_826546 ) ) ( not ( = ?auto_826541 ?auto_826547 ) ) ( not ( = ?auto_826541 ?auto_826548 ) ) ( not ( = ?auto_826541 ?auto_826549 ) ) ( not ( = ?auto_826541 ?auto_826550 ) ) ( not ( = ?auto_826541 ?auto_826551 ) ) ( not ( = ?auto_826541 ?auto_826552 ) ) ( not ( = ?auto_826541 ?auto_826553 ) ) ( not ( = ?auto_826541 ?auto_826554 ) ) ( not ( = ?auto_826542 ?auto_826543 ) ) ( not ( = ?auto_826542 ?auto_826544 ) ) ( not ( = ?auto_826542 ?auto_826545 ) ) ( not ( = ?auto_826542 ?auto_826546 ) ) ( not ( = ?auto_826542 ?auto_826547 ) ) ( not ( = ?auto_826542 ?auto_826548 ) ) ( not ( = ?auto_826542 ?auto_826549 ) ) ( not ( = ?auto_826542 ?auto_826550 ) ) ( not ( = ?auto_826542 ?auto_826551 ) ) ( not ( = ?auto_826542 ?auto_826552 ) ) ( not ( = ?auto_826542 ?auto_826553 ) ) ( not ( = ?auto_826542 ?auto_826554 ) ) ( not ( = ?auto_826543 ?auto_826544 ) ) ( not ( = ?auto_826543 ?auto_826545 ) ) ( not ( = ?auto_826543 ?auto_826546 ) ) ( not ( = ?auto_826543 ?auto_826547 ) ) ( not ( = ?auto_826543 ?auto_826548 ) ) ( not ( = ?auto_826543 ?auto_826549 ) ) ( not ( = ?auto_826543 ?auto_826550 ) ) ( not ( = ?auto_826543 ?auto_826551 ) ) ( not ( = ?auto_826543 ?auto_826552 ) ) ( not ( = ?auto_826543 ?auto_826553 ) ) ( not ( = ?auto_826543 ?auto_826554 ) ) ( not ( = ?auto_826544 ?auto_826545 ) ) ( not ( = ?auto_826544 ?auto_826546 ) ) ( not ( = ?auto_826544 ?auto_826547 ) ) ( not ( = ?auto_826544 ?auto_826548 ) ) ( not ( = ?auto_826544 ?auto_826549 ) ) ( not ( = ?auto_826544 ?auto_826550 ) ) ( not ( = ?auto_826544 ?auto_826551 ) ) ( not ( = ?auto_826544 ?auto_826552 ) ) ( not ( = ?auto_826544 ?auto_826553 ) ) ( not ( = ?auto_826544 ?auto_826554 ) ) ( not ( = ?auto_826545 ?auto_826546 ) ) ( not ( = ?auto_826545 ?auto_826547 ) ) ( not ( = ?auto_826545 ?auto_826548 ) ) ( not ( = ?auto_826545 ?auto_826549 ) ) ( not ( = ?auto_826545 ?auto_826550 ) ) ( not ( = ?auto_826545 ?auto_826551 ) ) ( not ( = ?auto_826545 ?auto_826552 ) ) ( not ( = ?auto_826545 ?auto_826553 ) ) ( not ( = ?auto_826545 ?auto_826554 ) ) ( not ( = ?auto_826546 ?auto_826547 ) ) ( not ( = ?auto_826546 ?auto_826548 ) ) ( not ( = ?auto_826546 ?auto_826549 ) ) ( not ( = ?auto_826546 ?auto_826550 ) ) ( not ( = ?auto_826546 ?auto_826551 ) ) ( not ( = ?auto_826546 ?auto_826552 ) ) ( not ( = ?auto_826546 ?auto_826553 ) ) ( not ( = ?auto_826546 ?auto_826554 ) ) ( not ( = ?auto_826547 ?auto_826548 ) ) ( not ( = ?auto_826547 ?auto_826549 ) ) ( not ( = ?auto_826547 ?auto_826550 ) ) ( not ( = ?auto_826547 ?auto_826551 ) ) ( not ( = ?auto_826547 ?auto_826552 ) ) ( not ( = ?auto_826547 ?auto_826553 ) ) ( not ( = ?auto_826547 ?auto_826554 ) ) ( not ( = ?auto_826548 ?auto_826549 ) ) ( not ( = ?auto_826548 ?auto_826550 ) ) ( not ( = ?auto_826548 ?auto_826551 ) ) ( not ( = ?auto_826548 ?auto_826552 ) ) ( not ( = ?auto_826548 ?auto_826553 ) ) ( not ( = ?auto_826548 ?auto_826554 ) ) ( not ( = ?auto_826549 ?auto_826550 ) ) ( not ( = ?auto_826549 ?auto_826551 ) ) ( not ( = ?auto_826549 ?auto_826552 ) ) ( not ( = ?auto_826549 ?auto_826553 ) ) ( not ( = ?auto_826549 ?auto_826554 ) ) ( not ( = ?auto_826550 ?auto_826551 ) ) ( not ( = ?auto_826550 ?auto_826552 ) ) ( not ( = ?auto_826550 ?auto_826553 ) ) ( not ( = ?auto_826550 ?auto_826554 ) ) ( not ( = ?auto_826551 ?auto_826552 ) ) ( not ( = ?auto_826551 ?auto_826553 ) ) ( not ( = ?auto_826551 ?auto_826554 ) ) ( not ( = ?auto_826552 ?auto_826553 ) ) ( not ( = ?auto_826552 ?auto_826554 ) ) ( not ( = ?auto_826553 ?auto_826554 ) ) ( ON ?auto_826552 ?auto_826553 ) ( ON ?auto_826551 ?auto_826552 ) ( CLEAR ?auto_826549 ) ( ON ?auto_826550 ?auto_826551 ) ( CLEAR ?auto_826550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_826536 ?auto_826537 ?auto_826538 ?auto_826539 ?auto_826540 ?auto_826541 ?auto_826542 ?auto_826543 ?auto_826544 ?auto_826545 ?auto_826546 ?auto_826547 ?auto_826548 ?auto_826549 ?auto_826550 )
      ( MAKE-18PILE ?auto_826536 ?auto_826537 ?auto_826538 ?auto_826539 ?auto_826540 ?auto_826541 ?auto_826542 ?auto_826543 ?auto_826544 ?auto_826545 ?auto_826546 ?auto_826547 ?auto_826548 ?auto_826549 ?auto_826550 ?auto_826551 ?auto_826552 ?auto_826553 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826573 - BLOCK
      ?auto_826574 - BLOCK
      ?auto_826575 - BLOCK
      ?auto_826576 - BLOCK
      ?auto_826577 - BLOCK
      ?auto_826578 - BLOCK
      ?auto_826579 - BLOCK
      ?auto_826580 - BLOCK
      ?auto_826581 - BLOCK
      ?auto_826582 - BLOCK
      ?auto_826583 - BLOCK
      ?auto_826584 - BLOCK
      ?auto_826585 - BLOCK
      ?auto_826586 - BLOCK
      ?auto_826587 - BLOCK
      ?auto_826588 - BLOCK
      ?auto_826589 - BLOCK
      ?auto_826590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_826590 ) ( ON-TABLE ?auto_826573 ) ( ON ?auto_826574 ?auto_826573 ) ( ON ?auto_826575 ?auto_826574 ) ( ON ?auto_826576 ?auto_826575 ) ( ON ?auto_826577 ?auto_826576 ) ( ON ?auto_826578 ?auto_826577 ) ( ON ?auto_826579 ?auto_826578 ) ( ON ?auto_826580 ?auto_826579 ) ( ON ?auto_826581 ?auto_826580 ) ( ON ?auto_826582 ?auto_826581 ) ( ON ?auto_826583 ?auto_826582 ) ( ON ?auto_826584 ?auto_826583 ) ( ON ?auto_826585 ?auto_826584 ) ( ON ?auto_826586 ?auto_826585 ) ( not ( = ?auto_826573 ?auto_826574 ) ) ( not ( = ?auto_826573 ?auto_826575 ) ) ( not ( = ?auto_826573 ?auto_826576 ) ) ( not ( = ?auto_826573 ?auto_826577 ) ) ( not ( = ?auto_826573 ?auto_826578 ) ) ( not ( = ?auto_826573 ?auto_826579 ) ) ( not ( = ?auto_826573 ?auto_826580 ) ) ( not ( = ?auto_826573 ?auto_826581 ) ) ( not ( = ?auto_826573 ?auto_826582 ) ) ( not ( = ?auto_826573 ?auto_826583 ) ) ( not ( = ?auto_826573 ?auto_826584 ) ) ( not ( = ?auto_826573 ?auto_826585 ) ) ( not ( = ?auto_826573 ?auto_826586 ) ) ( not ( = ?auto_826573 ?auto_826587 ) ) ( not ( = ?auto_826573 ?auto_826588 ) ) ( not ( = ?auto_826573 ?auto_826589 ) ) ( not ( = ?auto_826573 ?auto_826590 ) ) ( not ( = ?auto_826574 ?auto_826575 ) ) ( not ( = ?auto_826574 ?auto_826576 ) ) ( not ( = ?auto_826574 ?auto_826577 ) ) ( not ( = ?auto_826574 ?auto_826578 ) ) ( not ( = ?auto_826574 ?auto_826579 ) ) ( not ( = ?auto_826574 ?auto_826580 ) ) ( not ( = ?auto_826574 ?auto_826581 ) ) ( not ( = ?auto_826574 ?auto_826582 ) ) ( not ( = ?auto_826574 ?auto_826583 ) ) ( not ( = ?auto_826574 ?auto_826584 ) ) ( not ( = ?auto_826574 ?auto_826585 ) ) ( not ( = ?auto_826574 ?auto_826586 ) ) ( not ( = ?auto_826574 ?auto_826587 ) ) ( not ( = ?auto_826574 ?auto_826588 ) ) ( not ( = ?auto_826574 ?auto_826589 ) ) ( not ( = ?auto_826574 ?auto_826590 ) ) ( not ( = ?auto_826575 ?auto_826576 ) ) ( not ( = ?auto_826575 ?auto_826577 ) ) ( not ( = ?auto_826575 ?auto_826578 ) ) ( not ( = ?auto_826575 ?auto_826579 ) ) ( not ( = ?auto_826575 ?auto_826580 ) ) ( not ( = ?auto_826575 ?auto_826581 ) ) ( not ( = ?auto_826575 ?auto_826582 ) ) ( not ( = ?auto_826575 ?auto_826583 ) ) ( not ( = ?auto_826575 ?auto_826584 ) ) ( not ( = ?auto_826575 ?auto_826585 ) ) ( not ( = ?auto_826575 ?auto_826586 ) ) ( not ( = ?auto_826575 ?auto_826587 ) ) ( not ( = ?auto_826575 ?auto_826588 ) ) ( not ( = ?auto_826575 ?auto_826589 ) ) ( not ( = ?auto_826575 ?auto_826590 ) ) ( not ( = ?auto_826576 ?auto_826577 ) ) ( not ( = ?auto_826576 ?auto_826578 ) ) ( not ( = ?auto_826576 ?auto_826579 ) ) ( not ( = ?auto_826576 ?auto_826580 ) ) ( not ( = ?auto_826576 ?auto_826581 ) ) ( not ( = ?auto_826576 ?auto_826582 ) ) ( not ( = ?auto_826576 ?auto_826583 ) ) ( not ( = ?auto_826576 ?auto_826584 ) ) ( not ( = ?auto_826576 ?auto_826585 ) ) ( not ( = ?auto_826576 ?auto_826586 ) ) ( not ( = ?auto_826576 ?auto_826587 ) ) ( not ( = ?auto_826576 ?auto_826588 ) ) ( not ( = ?auto_826576 ?auto_826589 ) ) ( not ( = ?auto_826576 ?auto_826590 ) ) ( not ( = ?auto_826577 ?auto_826578 ) ) ( not ( = ?auto_826577 ?auto_826579 ) ) ( not ( = ?auto_826577 ?auto_826580 ) ) ( not ( = ?auto_826577 ?auto_826581 ) ) ( not ( = ?auto_826577 ?auto_826582 ) ) ( not ( = ?auto_826577 ?auto_826583 ) ) ( not ( = ?auto_826577 ?auto_826584 ) ) ( not ( = ?auto_826577 ?auto_826585 ) ) ( not ( = ?auto_826577 ?auto_826586 ) ) ( not ( = ?auto_826577 ?auto_826587 ) ) ( not ( = ?auto_826577 ?auto_826588 ) ) ( not ( = ?auto_826577 ?auto_826589 ) ) ( not ( = ?auto_826577 ?auto_826590 ) ) ( not ( = ?auto_826578 ?auto_826579 ) ) ( not ( = ?auto_826578 ?auto_826580 ) ) ( not ( = ?auto_826578 ?auto_826581 ) ) ( not ( = ?auto_826578 ?auto_826582 ) ) ( not ( = ?auto_826578 ?auto_826583 ) ) ( not ( = ?auto_826578 ?auto_826584 ) ) ( not ( = ?auto_826578 ?auto_826585 ) ) ( not ( = ?auto_826578 ?auto_826586 ) ) ( not ( = ?auto_826578 ?auto_826587 ) ) ( not ( = ?auto_826578 ?auto_826588 ) ) ( not ( = ?auto_826578 ?auto_826589 ) ) ( not ( = ?auto_826578 ?auto_826590 ) ) ( not ( = ?auto_826579 ?auto_826580 ) ) ( not ( = ?auto_826579 ?auto_826581 ) ) ( not ( = ?auto_826579 ?auto_826582 ) ) ( not ( = ?auto_826579 ?auto_826583 ) ) ( not ( = ?auto_826579 ?auto_826584 ) ) ( not ( = ?auto_826579 ?auto_826585 ) ) ( not ( = ?auto_826579 ?auto_826586 ) ) ( not ( = ?auto_826579 ?auto_826587 ) ) ( not ( = ?auto_826579 ?auto_826588 ) ) ( not ( = ?auto_826579 ?auto_826589 ) ) ( not ( = ?auto_826579 ?auto_826590 ) ) ( not ( = ?auto_826580 ?auto_826581 ) ) ( not ( = ?auto_826580 ?auto_826582 ) ) ( not ( = ?auto_826580 ?auto_826583 ) ) ( not ( = ?auto_826580 ?auto_826584 ) ) ( not ( = ?auto_826580 ?auto_826585 ) ) ( not ( = ?auto_826580 ?auto_826586 ) ) ( not ( = ?auto_826580 ?auto_826587 ) ) ( not ( = ?auto_826580 ?auto_826588 ) ) ( not ( = ?auto_826580 ?auto_826589 ) ) ( not ( = ?auto_826580 ?auto_826590 ) ) ( not ( = ?auto_826581 ?auto_826582 ) ) ( not ( = ?auto_826581 ?auto_826583 ) ) ( not ( = ?auto_826581 ?auto_826584 ) ) ( not ( = ?auto_826581 ?auto_826585 ) ) ( not ( = ?auto_826581 ?auto_826586 ) ) ( not ( = ?auto_826581 ?auto_826587 ) ) ( not ( = ?auto_826581 ?auto_826588 ) ) ( not ( = ?auto_826581 ?auto_826589 ) ) ( not ( = ?auto_826581 ?auto_826590 ) ) ( not ( = ?auto_826582 ?auto_826583 ) ) ( not ( = ?auto_826582 ?auto_826584 ) ) ( not ( = ?auto_826582 ?auto_826585 ) ) ( not ( = ?auto_826582 ?auto_826586 ) ) ( not ( = ?auto_826582 ?auto_826587 ) ) ( not ( = ?auto_826582 ?auto_826588 ) ) ( not ( = ?auto_826582 ?auto_826589 ) ) ( not ( = ?auto_826582 ?auto_826590 ) ) ( not ( = ?auto_826583 ?auto_826584 ) ) ( not ( = ?auto_826583 ?auto_826585 ) ) ( not ( = ?auto_826583 ?auto_826586 ) ) ( not ( = ?auto_826583 ?auto_826587 ) ) ( not ( = ?auto_826583 ?auto_826588 ) ) ( not ( = ?auto_826583 ?auto_826589 ) ) ( not ( = ?auto_826583 ?auto_826590 ) ) ( not ( = ?auto_826584 ?auto_826585 ) ) ( not ( = ?auto_826584 ?auto_826586 ) ) ( not ( = ?auto_826584 ?auto_826587 ) ) ( not ( = ?auto_826584 ?auto_826588 ) ) ( not ( = ?auto_826584 ?auto_826589 ) ) ( not ( = ?auto_826584 ?auto_826590 ) ) ( not ( = ?auto_826585 ?auto_826586 ) ) ( not ( = ?auto_826585 ?auto_826587 ) ) ( not ( = ?auto_826585 ?auto_826588 ) ) ( not ( = ?auto_826585 ?auto_826589 ) ) ( not ( = ?auto_826585 ?auto_826590 ) ) ( not ( = ?auto_826586 ?auto_826587 ) ) ( not ( = ?auto_826586 ?auto_826588 ) ) ( not ( = ?auto_826586 ?auto_826589 ) ) ( not ( = ?auto_826586 ?auto_826590 ) ) ( not ( = ?auto_826587 ?auto_826588 ) ) ( not ( = ?auto_826587 ?auto_826589 ) ) ( not ( = ?auto_826587 ?auto_826590 ) ) ( not ( = ?auto_826588 ?auto_826589 ) ) ( not ( = ?auto_826588 ?auto_826590 ) ) ( not ( = ?auto_826589 ?auto_826590 ) ) ( ON ?auto_826589 ?auto_826590 ) ( ON ?auto_826588 ?auto_826589 ) ( CLEAR ?auto_826586 ) ( ON ?auto_826587 ?auto_826588 ) ( CLEAR ?auto_826587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_826573 ?auto_826574 ?auto_826575 ?auto_826576 ?auto_826577 ?auto_826578 ?auto_826579 ?auto_826580 ?auto_826581 ?auto_826582 ?auto_826583 ?auto_826584 ?auto_826585 ?auto_826586 ?auto_826587 )
      ( MAKE-18PILE ?auto_826573 ?auto_826574 ?auto_826575 ?auto_826576 ?auto_826577 ?auto_826578 ?auto_826579 ?auto_826580 ?auto_826581 ?auto_826582 ?auto_826583 ?auto_826584 ?auto_826585 ?auto_826586 ?auto_826587 ?auto_826588 ?auto_826589 ?auto_826590 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826609 - BLOCK
      ?auto_826610 - BLOCK
      ?auto_826611 - BLOCK
      ?auto_826612 - BLOCK
      ?auto_826613 - BLOCK
      ?auto_826614 - BLOCK
      ?auto_826615 - BLOCK
      ?auto_826616 - BLOCK
      ?auto_826617 - BLOCK
      ?auto_826618 - BLOCK
      ?auto_826619 - BLOCK
      ?auto_826620 - BLOCK
      ?auto_826621 - BLOCK
      ?auto_826622 - BLOCK
      ?auto_826623 - BLOCK
      ?auto_826624 - BLOCK
      ?auto_826625 - BLOCK
      ?auto_826626 - BLOCK
    )
    :vars
    (
      ?auto_826627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826626 ?auto_826627 ) ( ON-TABLE ?auto_826609 ) ( ON ?auto_826610 ?auto_826609 ) ( ON ?auto_826611 ?auto_826610 ) ( ON ?auto_826612 ?auto_826611 ) ( ON ?auto_826613 ?auto_826612 ) ( ON ?auto_826614 ?auto_826613 ) ( ON ?auto_826615 ?auto_826614 ) ( ON ?auto_826616 ?auto_826615 ) ( ON ?auto_826617 ?auto_826616 ) ( ON ?auto_826618 ?auto_826617 ) ( ON ?auto_826619 ?auto_826618 ) ( ON ?auto_826620 ?auto_826619 ) ( ON ?auto_826621 ?auto_826620 ) ( not ( = ?auto_826609 ?auto_826610 ) ) ( not ( = ?auto_826609 ?auto_826611 ) ) ( not ( = ?auto_826609 ?auto_826612 ) ) ( not ( = ?auto_826609 ?auto_826613 ) ) ( not ( = ?auto_826609 ?auto_826614 ) ) ( not ( = ?auto_826609 ?auto_826615 ) ) ( not ( = ?auto_826609 ?auto_826616 ) ) ( not ( = ?auto_826609 ?auto_826617 ) ) ( not ( = ?auto_826609 ?auto_826618 ) ) ( not ( = ?auto_826609 ?auto_826619 ) ) ( not ( = ?auto_826609 ?auto_826620 ) ) ( not ( = ?auto_826609 ?auto_826621 ) ) ( not ( = ?auto_826609 ?auto_826622 ) ) ( not ( = ?auto_826609 ?auto_826623 ) ) ( not ( = ?auto_826609 ?auto_826624 ) ) ( not ( = ?auto_826609 ?auto_826625 ) ) ( not ( = ?auto_826609 ?auto_826626 ) ) ( not ( = ?auto_826609 ?auto_826627 ) ) ( not ( = ?auto_826610 ?auto_826611 ) ) ( not ( = ?auto_826610 ?auto_826612 ) ) ( not ( = ?auto_826610 ?auto_826613 ) ) ( not ( = ?auto_826610 ?auto_826614 ) ) ( not ( = ?auto_826610 ?auto_826615 ) ) ( not ( = ?auto_826610 ?auto_826616 ) ) ( not ( = ?auto_826610 ?auto_826617 ) ) ( not ( = ?auto_826610 ?auto_826618 ) ) ( not ( = ?auto_826610 ?auto_826619 ) ) ( not ( = ?auto_826610 ?auto_826620 ) ) ( not ( = ?auto_826610 ?auto_826621 ) ) ( not ( = ?auto_826610 ?auto_826622 ) ) ( not ( = ?auto_826610 ?auto_826623 ) ) ( not ( = ?auto_826610 ?auto_826624 ) ) ( not ( = ?auto_826610 ?auto_826625 ) ) ( not ( = ?auto_826610 ?auto_826626 ) ) ( not ( = ?auto_826610 ?auto_826627 ) ) ( not ( = ?auto_826611 ?auto_826612 ) ) ( not ( = ?auto_826611 ?auto_826613 ) ) ( not ( = ?auto_826611 ?auto_826614 ) ) ( not ( = ?auto_826611 ?auto_826615 ) ) ( not ( = ?auto_826611 ?auto_826616 ) ) ( not ( = ?auto_826611 ?auto_826617 ) ) ( not ( = ?auto_826611 ?auto_826618 ) ) ( not ( = ?auto_826611 ?auto_826619 ) ) ( not ( = ?auto_826611 ?auto_826620 ) ) ( not ( = ?auto_826611 ?auto_826621 ) ) ( not ( = ?auto_826611 ?auto_826622 ) ) ( not ( = ?auto_826611 ?auto_826623 ) ) ( not ( = ?auto_826611 ?auto_826624 ) ) ( not ( = ?auto_826611 ?auto_826625 ) ) ( not ( = ?auto_826611 ?auto_826626 ) ) ( not ( = ?auto_826611 ?auto_826627 ) ) ( not ( = ?auto_826612 ?auto_826613 ) ) ( not ( = ?auto_826612 ?auto_826614 ) ) ( not ( = ?auto_826612 ?auto_826615 ) ) ( not ( = ?auto_826612 ?auto_826616 ) ) ( not ( = ?auto_826612 ?auto_826617 ) ) ( not ( = ?auto_826612 ?auto_826618 ) ) ( not ( = ?auto_826612 ?auto_826619 ) ) ( not ( = ?auto_826612 ?auto_826620 ) ) ( not ( = ?auto_826612 ?auto_826621 ) ) ( not ( = ?auto_826612 ?auto_826622 ) ) ( not ( = ?auto_826612 ?auto_826623 ) ) ( not ( = ?auto_826612 ?auto_826624 ) ) ( not ( = ?auto_826612 ?auto_826625 ) ) ( not ( = ?auto_826612 ?auto_826626 ) ) ( not ( = ?auto_826612 ?auto_826627 ) ) ( not ( = ?auto_826613 ?auto_826614 ) ) ( not ( = ?auto_826613 ?auto_826615 ) ) ( not ( = ?auto_826613 ?auto_826616 ) ) ( not ( = ?auto_826613 ?auto_826617 ) ) ( not ( = ?auto_826613 ?auto_826618 ) ) ( not ( = ?auto_826613 ?auto_826619 ) ) ( not ( = ?auto_826613 ?auto_826620 ) ) ( not ( = ?auto_826613 ?auto_826621 ) ) ( not ( = ?auto_826613 ?auto_826622 ) ) ( not ( = ?auto_826613 ?auto_826623 ) ) ( not ( = ?auto_826613 ?auto_826624 ) ) ( not ( = ?auto_826613 ?auto_826625 ) ) ( not ( = ?auto_826613 ?auto_826626 ) ) ( not ( = ?auto_826613 ?auto_826627 ) ) ( not ( = ?auto_826614 ?auto_826615 ) ) ( not ( = ?auto_826614 ?auto_826616 ) ) ( not ( = ?auto_826614 ?auto_826617 ) ) ( not ( = ?auto_826614 ?auto_826618 ) ) ( not ( = ?auto_826614 ?auto_826619 ) ) ( not ( = ?auto_826614 ?auto_826620 ) ) ( not ( = ?auto_826614 ?auto_826621 ) ) ( not ( = ?auto_826614 ?auto_826622 ) ) ( not ( = ?auto_826614 ?auto_826623 ) ) ( not ( = ?auto_826614 ?auto_826624 ) ) ( not ( = ?auto_826614 ?auto_826625 ) ) ( not ( = ?auto_826614 ?auto_826626 ) ) ( not ( = ?auto_826614 ?auto_826627 ) ) ( not ( = ?auto_826615 ?auto_826616 ) ) ( not ( = ?auto_826615 ?auto_826617 ) ) ( not ( = ?auto_826615 ?auto_826618 ) ) ( not ( = ?auto_826615 ?auto_826619 ) ) ( not ( = ?auto_826615 ?auto_826620 ) ) ( not ( = ?auto_826615 ?auto_826621 ) ) ( not ( = ?auto_826615 ?auto_826622 ) ) ( not ( = ?auto_826615 ?auto_826623 ) ) ( not ( = ?auto_826615 ?auto_826624 ) ) ( not ( = ?auto_826615 ?auto_826625 ) ) ( not ( = ?auto_826615 ?auto_826626 ) ) ( not ( = ?auto_826615 ?auto_826627 ) ) ( not ( = ?auto_826616 ?auto_826617 ) ) ( not ( = ?auto_826616 ?auto_826618 ) ) ( not ( = ?auto_826616 ?auto_826619 ) ) ( not ( = ?auto_826616 ?auto_826620 ) ) ( not ( = ?auto_826616 ?auto_826621 ) ) ( not ( = ?auto_826616 ?auto_826622 ) ) ( not ( = ?auto_826616 ?auto_826623 ) ) ( not ( = ?auto_826616 ?auto_826624 ) ) ( not ( = ?auto_826616 ?auto_826625 ) ) ( not ( = ?auto_826616 ?auto_826626 ) ) ( not ( = ?auto_826616 ?auto_826627 ) ) ( not ( = ?auto_826617 ?auto_826618 ) ) ( not ( = ?auto_826617 ?auto_826619 ) ) ( not ( = ?auto_826617 ?auto_826620 ) ) ( not ( = ?auto_826617 ?auto_826621 ) ) ( not ( = ?auto_826617 ?auto_826622 ) ) ( not ( = ?auto_826617 ?auto_826623 ) ) ( not ( = ?auto_826617 ?auto_826624 ) ) ( not ( = ?auto_826617 ?auto_826625 ) ) ( not ( = ?auto_826617 ?auto_826626 ) ) ( not ( = ?auto_826617 ?auto_826627 ) ) ( not ( = ?auto_826618 ?auto_826619 ) ) ( not ( = ?auto_826618 ?auto_826620 ) ) ( not ( = ?auto_826618 ?auto_826621 ) ) ( not ( = ?auto_826618 ?auto_826622 ) ) ( not ( = ?auto_826618 ?auto_826623 ) ) ( not ( = ?auto_826618 ?auto_826624 ) ) ( not ( = ?auto_826618 ?auto_826625 ) ) ( not ( = ?auto_826618 ?auto_826626 ) ) ( not ( = ?auto_826618 ?auto_826627 ) ) ( not ( = ?auto_826619 ?auto_826620 ) ) ( not ( = ?auto_826619 ?auto_826621 ) ) ( not ( = ?auto_826619 ?auto_826622 ) ) ( not ( = ?auto_826619 ?auto_826623 ) ) ( not ( = ?auto_826619 ?auto_826624 ) ) ( not ( = ?auto_826619 ?auto_826625 ) ) ( not ( = ?auto_826619 ?auto_826626 ) ) ( not ( = ?auto_826619 ?auto_826627 ) ) ( not ( = ?auto_826620 ?auto_826621 ) ) ( not ( = ?auto_826620 ?auto_826622 ) ) ( not ( = ?auto_826620 ?auto_826623 ) ) ( not ( = ?auto_826620 ?auto_826624 ) ) ( not ( = ?auto_826620 ?auto_826625 ) ) ( not ( = ?auto_826620 ?auto_826626 ) ) ( not ( = ?auto_826620 ?auto_826627 ) ) ( not ( = ?auto_826621 ?auto_826622 ) ) ( not ( = ?auto_826621 ?auto_826623 ) ) ( not ( = ?auto_826621 ?auto_826624 ) ) ( not ( = ?auto_826621 ?auto_826625 ) ) ( not ( = ?auto_826621 ?auto_826626 ) ) ( not ( = ?auto_826621 ?auto_826627 ) ) ( not ( = ?auto_826622 ?auto_826623 ) ) ( not ( = ?auto_826622 ?auto_826624 ) ) ( not ( = ?auto_826622 ?auto_826625 ) ) ( not ( = ?auto_826622 ?auto_826626 ) ) ( not ( = ?auto_826622 ?auto_826627 ) ) ( not ( = ?auto_826623 ?auto_826624 ) ) ( not ( = ?auto_826623 ?auto_826625 ) ) ( not ( = ?auto_826623 ?auto_826626 ) ) ( not ( = ?auto_826623 ?auto_826627 ) ) ( not ( = ?auto_826624 ?auto_826625 ) ) ( not ( = ?auto_826624 ?auto_826626 ) ) ( not ( = ?auto_826624 ?auto_826627 ) ) ( not ( = ?auto_826625 ?auto_826626 ) ) ( not ( = ?auto_826625 ?auto_826627 ) ) ( not ( = ?auto_826626 ?auto_826627 ) ) ( ON ?auto_826625 ?auto_826626 ) ( ON ?auto_826624 ?auto_826625 ) ( ON ?auto_826623 ?auto_826624 ) ( CLEAR ?auto_826621 ) ( ON ?auto_826622 ?auto_826623 ) ( CLEAR ?auto_826622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_826609 ?auto_826610 ?auto_826611 ?auto_826612 ?auto_826613 ?auto_826614 ?auto_826615 ?auto_826616 ?auto_826617 ?auto_826618 ?auto_826619 ?auto_826620 ?auto_826621 ?auto_826622 )
      ( MAKE-18PILE ?auto_826609 ?auto_826610 ?auto_826611 ?auto_826612 ?auto_826613 ?auto_826614 ?auto_826615 ?auto_826616 ?auto_826617 ?auto_826618 ?auto_826619 ?auto_826620 ?auto_826621 ?auto_826622 ?auto_826623 ?auto_826624 ?auto_826625 ?auto_826626 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826646 - BLOCK
      ?auto_826647 - BLOCK
      ?auto_826648 - BLOCK
      ?auto_826649 - BLOCK
      ?auto_826650 - BLOCK
      ?auto_826651 - BLOCK
      ?auto_826652 - BLOCK
      ?auto_826653 - BLOCK
      ?auto_826654 - BLOCK
      ?auto_826655 - BLOCK
      ?auto_826656 - BLOCK
      ?auto_826657 - BLOCK
      ?auto_826658 - BLOCK
      ?auto_826659 - BLOCK
      ?auto_826660 - BLOCK
      ?auto_826661 - BLOCK
      ?auto_826662 - BLOCK
      ?auto_826663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_826663 ) ( ON-TABLE ?auto_826646 ) ( ON ?auto_826647 ?auto_826646 ) ( ON ?auto_826648 ?auto_826647 ) ( ON ?auto_826649 ?auto_826648 ) ( ON ?auto_826650 ?auto_826649 ) ( ON ?auto_826651 ?auto_826650 ) ( ON ?auto_826652 ?auto_826651 ) ( ON ?auto_826653 ?auto_826652 ) ( ON ?auto_826654 ?auto_826653 ) ( ON ?auto_826655 ?auto_826654 ) ( ON ?auto_826656 ?auto_826655 ) ( ON ?auto_826657 ?auto_826656 ) ( ON ?auto_826658 ?auto_826657 ) ( not ( = ?auto_826646 ?auto_826647 ) ) ( not ( = ?auto_826646 ?auto_826648 ) ) ( not ( = ?auto_826646 ?auto_826649 ) ) ( not ( = ?auto_826646 ?auto_826650 ) ) ( not ( = ?auto_826646 ?auto_826651 ) ) ( not ( = ?auto_826646 ?auto_826652 ) ) ( not ( = ?auto_826646 ?auto_826653 ) ) ( not ( = ?auto_826646 ?auto_826654 ) ) ( not ( = ?auto_826646 ?auto_826655 ) ) ( not ( = ?auto_826646 ?auto_826656 ) ) ( not ( = ?auto_826646 ?auto_826657 ) ) ( not ( = ?auto_826646 ?auto_826658 ) ) ( not ( = ?auto_826646 ?auto_826659 ) ) ( not ( = ?auto_826646 ?auto_826660 ) ) ( not ( = ?auto_826646 ?auto_826661 ) ) ( not ( = ?auto_826646 ?auto_826662 ) ) ( not ( = ?auto_826646 ?auto_826663 ) ) ( not ( = ?auto_826647 ?auto_826648 ) ) ( not ( = ?auto_826647 ?auto_826649 ) ) ( not ( = ?auto_826647 ?auto_826650 ) ) ( not ( = ?auto_826647 ?auto_826651 ) ) ( not ( = ?auto_826647 ?auto_826652 ) ) ( not ( = ?auto_826647 ?auto_826653 ) ) ( not ( = ?auto_826647 ?auto_826654 ) ) ( not ( = ?auto_826647 ?auto_826655 ) ) ( not ( = ?auto_826647 ?auto_826656 ) ) ( not ( = ?auto_826647 ?auto_826657 ) ) ( not ( = ?auto_826647 ?auto_826658 ) ) ( not ( = ?auto_826647 ?auto_826659 ) ) ( not ( = ?auto_826647 ?auto_826660 ) ) ( not ( = ?auto_826647 ?auto_826661 ) ) ( not ( = ?auto_826647 ?auto_826662 ) ) ( not ( = ?auto_826647 ?auto_826663 ) ) ( not ( = ?auto_826648 ?auto_826649 ) ) ( not ( = ?auto_826648 ?auto_826650 ) ) ( not ( = ?auto_826648 ?auto_826651 ) ) ( not ( = ?auto_826648 ?auto_826652 ) ) ( not ( = ?auto_826648 ?auto_826653 ) ) ( not ( = ?auto_826648 ?auto_826654 ) ) ( not ( = ?auto_826648 ?auto_826655 ) ) ( not ( = ?auto_826648 ?auto_826656 ) ) ( not ( = ?auto_826648 ?auto_826657 ) ) ( not ( = ?auto_826648 ?auto_826658 ) ) ( not ( = ?auto_826648 ?auto_826659 ) ) ( not ( = ?auto_826648 ?auto_826660 ) ) ( not ( = ?auto_826648 ?auto_826661 ) ) ( not ( = ?auto_826648 ?auto_826662 ) ) ( not ( = ?auto_826648 ?auto_826663 ) ) ( not ( = ?auto_826649 ?auto_826650 ) ) ( not ( = ?auto_826649 ?auto_826651 ) ) ( not ( = ?auto_826649 ?auto_826652 ) ) ( not ( = ?auto_826649 ?auto_826653 ) ) ( not ( = ?auto_826649 ?auto_826654 ) ) ( not ( = ?auto_826649 ?auto_826655 ) ) ( not ( = ?auto_826649 ?auto_826656 ) ) ( not ( = ?auto_826649 ?auto_826657 ) ) ( not ( = ?auto_826649 ?auto_826658 ) ) ( not ( = ?auto_826649 ?auto_826659 ) ) ( not ( = ?auto_826649 ?auto_826660 ) ) ( not ( = ?auto_826649 ?auto_826661 ) ) ( not ( = ?auto_826649 ?auto_826662 ) ) ( not ( = ?auto_826649 ?auto_826663 ) ) ( not ( = ?auto_826650 ?auto_826651 ) ) ( not ( = ?auto_826650 ?auto_826652 ) ) ( not ( = ?auto_826650 ?auto_826653 ) ) ( not ( = ?auto_826650 ?auto_826654 ) ) ( not ( = ?auto_826650 ?auto_826655 ) ) ( not ( = ?auto_826650 ?auto_826656 ) ) ( not ( = ?auto_826650 ?auto_826657 ) ) ( not ( = ?auto_826650 ?auto_826658 ) ) ( not ( = ?auto_826650 ?auto_826659 ) ) ( not ( = ?auto_826650 ?auto_826660 ) ) ( not ( = ?auto_826650 ?auto_826661 ) ) ( not ( = ?auto_826650 ?auto_826662 ) ) ( not ( = ?auto_826650 ?auto_826663 ) ) ( not ( = ?auto_826651 ?auto_826652 ) ) ( not ( = ?auto_826651 ?auto_826653 ) ) ( not ( = ?auto_826651 ?auto_826654 ) ) ( not ( = ?auto_826651 ?auto_826655 ) ) ( not ( = ?auto_826651 ?auto_826656 ) ) ( not ( = ?auto_826651 ?auto_826657 ) ) ( not ( = ?auto_826651 ?auto_826658 ) ) ( not ( = ?auto_826651 ?auto_826659 ) ) ( not ( = ?auto_826651 ?auto_826660 ) ) ( not ( = ?auto_826651 ?auto_826661 ) ) ( not ( = ?auto_826651 ?auto_826662 ) ) ( not ( = ?auto_826651 ?auto_826663 ) ) ( not ( = ?auto_826652 ?auto_826653 ) ) ( not ( = ?auto_826652 ?auto_826654 ) ) ( not ( = ?auto_826652 ?auto_826655 ) ) ( not ( = ?auto_826652 ?auto_826656 ) ) ( not ( = ?auto_826652 ?auto_826657 ) ) ( not ( = ?auto_826652 ?auto_826658 ) ) ( not ( = ?auto_826652 ?auto_826659 ) ) ( not ( = ?auto_826652 ?auto_826660 ) ) ( not ( = ?auto_826652 ?auto_826661 ) ) ( not ( = ?auto_826652 ?auto_826662 ) ) ( not ( = ?auto_826652 ?auto_826663 ) ) ( not ( = ?auto_826653 ?auto_826654 ) ) ( not ( = ?auto_826653 ?auto_826655 ) ) ( not ( = ?auto_826653 ?auto_826656 ) ) ( not ( = ?auto_826653 ?auto_826657 ) ) ( not ( = ?auto_826653 ?auto_826658 ) ) ( not ( = ?auto_826653 ?auto_826659 ) ) ( not ( = ?auto_826653 ?auto_826660 ) ) ( not ( = ?auto_826653 ?auto_826661 ) ) ( not ( = ?auto_826653 ?auto_826662 ) ) ( not ( = ?auto_826653 ?auto_826663 ) ) ( not ( = ?auto_826654 ?auto_826655 ) ) ( not ( = ?auto_826654 ?auto_826656 ) ) ( not ( = ?auto_826654 ?auto_826657 ) ) ( not ( = ?auto_826654 ?auto_826658 ) ) ( not ( = ?auto_826654 ?auto_826659 ) ) ( not ( = ?auto_826654 ?auto_826660 ) ) ( not ( = ?auto_826654 ?auto_826661 ) ) ( not ( = ?auto_826654 ?auto_826662 ) ) ( not ( = ?auto_826654 ?auto_826663 ) ) ( not ( = ?auto_826655 ?auto_826656 ) ) ( not ( = ?auto_826655 ?auto_826657 ) ) ( not ( = ?auto_826655 ?auto_826658 ) ) ( not ( = ?auto_826655 ?auto_826659 ) ) ( not ( = ?auto_826655 ?auto_826660 ) ) ( not ( = ?auto_826655 ?auto_826661 ) ) ( not ( = ?auto_826655 ?auto_826662 ) ) ( not ( = ?auto_826655 ?auto_826663 ) ) ( not ( = ?auto_826656 ?auto_826657 ) ) ( not ( = ?auto_826656 ?auto_826658 ) ) ( not ( = ?auto_826656 ?auto_826659 ) ) ( not ( = ?auto_826656 ?auto_826660 ) ) ( not ( = ?auto_826656 ?auto_826661 ) ) ( not ( = ?auto_826656 ?auto_826662 ) ) ( not ( = ?auto_826656 ?auto_826663 ) ) ( not ( = ?auto_826657 ?auto_826658 ) ) ( not ( = ?auto_826657 ?auto_826659 ) ) ( not ( = ?auto_826657 ?auto_826660 ) ) ( not ( = ?auto_826657 ?auto_826661 ) ) ( not ( = ?auto_826657 ?auto_826662 ) ) ( not ( = ?auto_826657 ?auto_826663 ) ) ( not ( = ?auto_826658 ?auto_826659 ) ) ( not ( = ?auto_826658 ?auto_826660 ) ) ( not ( = ?auto_826658 ?auto_826661 ) ) ( not ( = ?auto_826658 ?auto_826662 ) ) ( not ( = ?auto_826658 ?auto_826663 ) ) ( not ( = ?auto_826659 ?auto_826660 ) ) ( not ( = ?auto_826659 ?auto_826661 ) ) ( not ( = ?auto_826659 ?auto_826662 ) ) ( not ( = ?auto_826659 ?auto_826663 ) ) ( not ( = ?auto_826660 ?auto_826661 ) ) ( not ( = ?auto_826660 ?auto_826662 ) ) ( not ( = ?auto_826660 ?auto_826663 ) ) ( not ( = ?auto_826661 ?auto_826662 ) ) ( not ( = ?auto_826661 ?auto_826663 ) ) ( not ( = ?auto_826662 ?auto_826663 ) ) ( ON ?auto_826662 ?auto_826663 ) ( ON ?auto_826661 ?auto_826662 ) ( ON ?auto_826660 ?auto_826661 ) ( CLEAR ?auto_826658 ) ( ON ?auto_826659 ?auto_826660 ) ( CLEAR ?auto_826659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_826646 ?auto_826647 ?auto_826648 ?auto_826649 ?auto_826650 ?auto_826651 ?auto_826652 ?auto_826653 ?auto_826654 ?auto_826655 ?auto_826656 ?auto_826657 ?auto_826658 ?auto_826659 )
      ( MAKE-18PILE ?auto_826646 ?auto_826647 ?auto_826648 ?auto_826649 ?auto_826650 ?auto_826651 ?auto_826652 ?auto_826653 ?auto_826654 ?auto_826655 ?auto_826656 ?auto_826657 ?auto_826658 ?auto_826659 ?auto_826660 ?auto_826661 ?auto_826662 ?auto_826663 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826682 - BLOCK
      ?auto_826683 - BLOCK
      ?auto_826684 - BLOCK
      ?auto_826685 - BLOCK
      ?auto_826686 - BLOCK
      ?auto_826687 - BLOCK
      ?auto_826688 - BLOCK
      ?auto_826689 - BLOCK
      ?auto_826690 - BLOCK
      ?auto_826691 - BLOCK
      ?auto_826692 - BLOCK
      ?auto_826693 - BLOCK
      ?auto_826694 - BLOCK
      ?auto_826695 - BLOCK
      ?auto_826696 - BLOCK
      ?auto_826697 - BLOCK
      ?auto_826698 - BLOCK
      ?auto_826699 - BLOCK
    )
    :vars
    (
      ?auto_826700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826699 ?auto_826700 ) ( ON-TABLE ?auto_826682 ) ( ON ?auto_826683 ?auto_826682 ) ( ON ?auto_826684 ?auto_826683 ) ( ON ?auto_826685 ?auto_826684 ) ( ON ?auto_826686 ?auto_826685 ) ( ON ?auto_826687 ?auto_826686 ) ( ON ?auto_826688 ?auto_826687 ) ( ON ?auto_826689 ?auto_826688 ) ( ON ?auto_826690 ?auto_826689 ) ( ON ?auto_826691 ?auto_826690 ) ( ON ?auto_826692 ?auto_826691 ) ( ON ?auto_826693 ?auto_826692 ) ( not ( = ?auto_826682 ?auto_826683 ) ) ( not ( = ?auto_826682 ?auto_826684 ) ) ( not ( = ?auto_826682 ?auto_826685 ) ) ( not ( = ?auto_826682 ?auto_826686 ) ) ( not ( = ?auto_826682 ?auto_826687 ) ) ( not ( = ?auto_826682 ?auto_826688 ) ) ( not ( = ?auto_826682 ?auto_826689 ) ) ( not ( = ?auto_826682 ?auto_826690 ) ) ( not ( = ?auto_826682 ?auto_826691 ) ) ( not ( = ?auto_826682 ?auto_826692 ) ) ( not ( = ?auto_826682 ?auto_826693 ) ) ( not ( = ?auto_826682 ?auto_826694 ) ) ( not ( = ?auto_826682 ?auto_826695 ) ) ( not ( = ?auto_826682 ?auto_826696 ) ) ( not ( = ?auto_826682 ?auto_826697 ) ) ( not ( = ?auto_826682 ?auto_826698 ) ) ( not ( = ?auto_826682 ?auto_826699 ) ) ( not ( = ?auto_826682 ?auto_826700 ) ) ( not ( = ?auto_826683 ?auto_826684 ) ) ( not ( = ?auto_826683 ?auto_826685 ) ) ( not ( = ?auto_826683 ?auto_826686 ) ) ( not ( = ?auto_826683 ?auto_826687 ) ) ( not ( = ?auto_826683 ?auto_826688 ) ) ( not ( = ?auto_826683 ?auto_826689 ) ) ( not ( = ?auto_826683 ?auto_826690 ) ) ( not ( = ?auto_826683 ?auto_826691 ) ) ( not ( = ?auto_826683 ?auto_826692 ) ) ( not ( = ?auto_826683 ?auto_826693 ) ) ( not ( = ?auto_826683 ?auto_826694 ) ) ( not ( = ?auto_826683 ?auto_826695 ) ) ( not ( = ?auto_826683 ?auto_826696 ) ) ( not ( = ?auto_826683 ?auto_826697 ) ) ( not ( = ?auto_826683 ?auto_826698 ) ) ( not ( = ?auto_826683 ?auto_826699 ) ) ( not ( = ?auto_826683 ?auto_826700 ) ) ( not ( = ?auto_826684 ?auto_826685 ) ) ( not ( = ?auto_826684 ?auto_826686 ) ) ( not ( = ?auto_826684 ?auto_826687 ) ) ( not ( = ?auto_826684 ?auto_826688 ) ) ( not ( = ?auto_826684 ?auto_826689 ) ) ( not ( = ?auto_826684 ?auto_826690 ) ) ( not ( = ?auto_826684 ?auto_826691 ) ) ( not ( = ?auto_826684 ?auto_826692 ) ) ( not ( = ?auto_826684 ?auto_826693 ) ) ( not ( = ?auto_826684 ?auto_826694 ) ) ( not ( = ?auto_826684 ?auto_826695 ) ) ( not ( = ?auto_826684 ?auto_826696 ) ) ( not ( = ?auto_826684 ?auto_826697 ) ) ( not ( = ?auto_826684 ?auto_826698 ) ) ( not ( = ?auto_826684 ?auto_826699 ) ) ( not ( = ?auto_826684 ?auto_826700 ) ) ( not ( = ?auto_826685 ?auto_826686 ) ) ( not ( = ?auto_826685 ?auto_826687 ) ) ( not ( = ?auto_826685 ?auto_826688 ) ) ( not ( = ?auto_826685 ?auto_826689 ) ) ( not ( = ?auto_826685 ?auto_826690 ) ) ( not ( = ?auto_826685 ?auto_826691 ) ) ( not ( = ?auto_826685 ?auto_826692 ) ) ( not ( = ?auto_826685 ?auto_826693 ) ) ( not ( = ?auto_826685 ?auto_826694 ) ) ( not ( = ?auto_826685 ?auto_826695 ) ) ( not ( = ?auto_826685 ?auto_826696 ) ) ( not ( = ?auto_826685 ?auto_826697 ) ) ( not ( = ?auto_826685 ?auto_826698 ) ) ( not ( = ?auto_826685 ?auto_826699 ) ) ( not ( = ?auto_826685 ?auto_826700 ) ) ( not ( = ?auto_826686 ?auto_826687 ) ) ( not ( = ?auto_826686 ?auto_826688 ) ) ( not ( = ?auto_826686 ?auto_826689 ) ) ( not ( = ?auto_826686 ?auto_826690 ) ) ( not ( = ?auto_826686 ?auto_826691 ) ) ( not ( = ?auto_826686 ?auto_826692 ) ) ( not ( = ?auto_826686 ?auto_826693 ) ) ( not ( = ?auto_826686 ?auto_826694 ) ) ( not ( = ?auto_826686 ?auto_826695 ) ) ( not ( = ?auto_826686 ?auto_826696 ) ) ( not ( = ?auto_826686 ?auto_826697 ) ) ( not ( = ?auto_826686 ?auto_826698 ) ) ( not ( = ?auto_826686 ?auto_826699 ) ) ( not ( = ?auto_826686 ?auto_826700 ) ) ( not ( = ?auto_826687 ?auto_826688 ) ) ( not ( = ?auto_826687 ?auto_826689 ) ) ( not ( = ?auto_826687 ?auto_826690 ) ) ( not ( = ?auto_826687 ?auto_826691 ) ) ( not ( = ?auto_826687 ?auto_826692 ) ) ( not ( = ?auto_826687 ?auto_826693 ) ) ( not ( = ?auto_826687 ?auto_826694 ) ) ( not ( = ?auto_826687 ?auto_826695 ) ) ( not ( = ?auto_826687 ?auto_826696 ) ) ( not ( = ?auto_826687 ?auto_826697 ) ) ( not ( = ?auto_826687 ?auto_826698 ) ) ( not ( = ?auto_826687 ?auto_826699 ) ) ( not ( = ?auto_826687 ?auto_826700 ) ) ( not ( = ?auto_826688 ?auto_826689 ) ) ( not ( = ?auto_826688 ?auto_826690 ) ) ( not ( = ?auto_826688 ?auto_826691 ) ) ( not ( = ?auto_826688 ?auto_826692 ) ) ( not ( = ?auto_826688 ?auto_826693 ) ) ( not ( = ?auto_826688 ?auto_826694 ) ) ( not ( = ?auto_826688 ?auto_826695 ) ) ( not ( = ?auto_826688 ?auto_826696 ) ) ( not ( = ?auto_826688 ?auto_826697 ) ) ( not ( = ?auto_826688 ?auto_826698 ) ) ( not ( = ?auto_826688 ?auto_826699 ) ) ( not ( = ?auto_826688 ?auto_826700 ) ) ( not ( = ?auto_826689 ?auto_826690 ) ) ( not ( = ?auto_826689 ?auto_826691 ) ) ( not ( = ?auto_826689 ?auto_826692 ) ) ( not ( = ?auto_826689 ?auto_826693 ) ) ( not ( = ?auto_826689 ?auto_826694 ) ) ( not ( = ?auto_826689 ?auto_826695 ) ) ( not ( = ?auto_826689 ?auto_826696 ) ) ( not ( = ?auto_826689 ?auto_826697 ) ) ( not ( = ?auto_826689 ?auto_826698 ) ) ( not ( = ?auto_826689 ?auto_826699 ) ) ( not ( = ?auto_826689 ?auto_826700 ) ) ( not ( = ?auto_826690 ?auto_826691 ) ) ( not ( = ?auto_826690 ?auto_826692 ) ) ( not ( = ?auto_826690 ?auto_826693 ) ) ( not ( = ?auto_826690 ?auto_826694 ) ) ( not ( = ?auto_826690 ?auto_826695 ) ) ( not ( = ?auto_826690 ?auto_826696 ) ) ( not ( = ?auto_826690 ?auto_826697 ) ) ( not ( = ?auto_826690 ?auto_826698 ) ) ( not ( = ?auto_826690 ?auto_826699 ) ) ( not ( = ?auto_826690 ?auto_826700 ) ) ( not ( = ?auto_826691 ?auto_826692 ) ) ( not ( = ?auto_826691 ?auto_826693 ) ) ( not ( = ?auto_826691 ?auto_826694 ) ) ( not ( = ?auto_826691 ?auto_826695 ) ) ( not ( = ?auto_826691 ?auto_826696 ) ) ( not ( = ?auto_826691 ?auto_826697 ) ) ( not ( = ?auto_826691 ?auto_826698 ) ) ( not ( = ?auto_826691 ?auto_826699 ) ) ( not ( = ?auto_826691 ?auto_826700 ) ) ( not ( = ?auto_826692 ?auto_826693 ) ) ( not ( = ?auto_826692 ?auto_826694 ) ) ( not ( = ?auto_826692 ?auto_826695 ) ) ( not ( = ?auto_826692 ?auto_826696 ) ) ( not ( = ?auto_826692 ?auto_826697 ) ) ( not ( = ?auto_826692 ?auto_826698 ) ) ( not ( = ?auto_826692 ?auto_826699 ) ) ( not ( = ?auto_826692 ?auto_826700 ) ) ( not ( = ?auto_826693 ?auto_826694 ) ) ( not ( = ?auto_826693 ?auto_826695 ) ) ( not ( = ?auto_826693 ?auto_826696 ) ) ( not ( = ?auto_826693 ?auto_826697 ) ) ( not ( = ?auto_826693 ?auto_826698 ) ) ( not ( = ?auto_826693 ?auto_826699 ) ) ( not ( = ?auto_826693 ?auto_826700 ) ) ( not ( = ?auto_826694 ?auto_826695 ) ) ( not ( = ?auto_826694 ?auto_826696 ) ) ( not ( = ?auto_826694 ?auto_826697 ) ) ( not ( = ?auto_826694 ?auto_826698 ) ) ( not ( = ?auto_826694 ?auto_826699 ) ) ( not ( = ?auto_826694 ?auto_826700 ) ) ( not ( = ?auto_826695 ?auto_826696 ) ) ( not ( = ?auto_826695 ?auto_826697 ) ) ( not ( = ?auto_826695 ?auto_826698 ) ) ( not ( = ?auto_826695 ?auto_826699 ) ) ( not ( = ?auto_826695 ?auto_826700 ) ) ( not ( = ?auto_826696 ?auto_826697 ) ) ( not ( = ?auto_826696 ?auto_826698 ) ) ( not ( = ?auto_826696 ?auto_826699 ) ) ( not ( = ?auto_826696 ?auto_826700 ) ) ( not ( = ?auto_826697 ?auto_826698 ) ) ( not ( = ?auto_826697 ?auto_826699 ) ) ( not ( = ?auto_826697 ?auto_826700 ) ) ( not ( = ?auto_826698 ?auto_826699 ) ) ( not ( = ?auto_826698 ?auto_826700 ) ) ( not ( = ?auto_826699 ?auto_826700 ) ) ( ON ?auto_826698 ?auto_826699 ) ( ON ?auto_826697 ?auto_826698 ) ( ON ?auto_826696 ?auto_826697 ) ( ON ?auto_826695 ?auto_826696 ) ( CLEAR ?auto_826693 ) ( ON ?auto_826694 ?auto_826695 ) ( CLEAR ?auto_826694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_826682 ?auto_826683 ?auto_826684 ?auto_826685 ?auto_826686 ?auto_826687 ?auto_826688 ?auto_826689 ?auto_826690 ?auto_826691 ?auto_826692 ?auto_826693 ?auto_826694 )
      ( MAKE-18PILE ?auto_826682 ?auto_826683 ?auto_826684 ?auto_826685 ?auto_826686 ?auto_826687 ?auto_826688 ?auto_826689 ?auto_826690 ?auto_826691 ?auto_826692 ?auto_826693 ?auto_826694 ?auto_826695 ?auto_826696 ?auto_826697 ?auto_826698 ?auto_826699 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826719 - BLOCK
      ?auto_826720 - BLOCK
      ?auto_826721 - BLOCK
      ?auto_826722 - BLOCK
      ?auto_826723 - BLOCK
      ?auto_826724 - BLOCK
      ?auto_826725 - BLOCK
      ?auto_826726 - BLOCK
      ?auto_826727 - BLOCK
      ?auto_826728 - BLOCK
      ?auto_826729 - BLOCK
      ?auto_826730 - BLOCK
      ?auto_826731 - BLOCK
      ?auto_826732 - BLOCK
      ?auto_826733 - BLOCK
      ?auto_826734 - BLOCK
      ?auto_826735 - BLOCK
      ?auto_826736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_826736 ) ( ON-TABLE ?auto_826719 ) ( ON ?auto_826720 ?auto_826719 ) ( ON ?auto_826721 ?auto_826720 ) ( ON ?auto_826722 ?auto_826721 ) ( ON ?auto_826723 ?auto_826722 ) ( ON ?auto_826724 ?auto_826723 ) ( ON ?auto_826725 ?auto_826724 ) ( ON ?auto_826726 ?auto_826725 ) ( ON ?auto_826727 ?auto_826726 ) ( ON ?auto_826728 ?auto_826727 ) ( ON ?auto_826729 ?auto_826728 ) ( ON ?auto_826730 ?auto_826729 ) ( not ( = ?auto_826719 ?auto_826720 ) ) ( not ( = ?auto_826719 ?auto_826721 ) ) ( not ( = ?auto_826719 ?auto_826722 ) ) ( not ( = ?auto_826719 ?auto_826723 ) ) ( not ( = ?auto_826719 ?auto_826724 ) ) ( not ( = ?auto_826719 ?auto_826725 ) ) ( not ( = ?auto_826719 ?auto_826726 ) ) ( not ( = ?auto_826719 ?auto_826727 ) ) ( not ( = ?auto_826719 ?auto_826728 ) ) ( not ( = ?auto_826719 ?auto_826729 ) ) ( not ( = ?auto_826719 ?auto_826730 ) ) ( not ( = ?auto_826719 ?auto_826731 ) ) ( not ( = ?auto_826719 ?auto_826732 ) ) ( not ( = ?auto_826719 ?auto_826733 ) ) ( not ( = ?auto_826719 ?auto_826734 ) ) ( not ( = ?auto_826719 ?auto_826735 ) ) ( not ( = ?auto_826719 ?auto_826736 ) ) ( not ( = ?auto_826720 ?auto_826721 ) ) ( not ( = ?auto_826720 ?auto_826722 ) ) ( not ( = ?auto_826720 ?auto_826723 ) ) ( not ( = ?auto_826720 ?auto_826724 ) ) ( not ( = ?auto_826720 ?auto_826725 ) ) ( not ( = ?auto_826720 ?auto_826726 ) ) ( not ( = ?auto_826720 ?auto_826727 ) ) ( not ( = ?auto_826720 ?auto_826728 ) ) ( not ( = ?auto_826720 ?auto_826729 ) ) ( not ( = ?auto_826720 ?auto_826730 ) ) ( not ( = ?auto_826720 ?auto_826731 ) ) ( not ( = ?auto_826720 ?auto_826732 ) ) ( not ( = ?auto_826720 ?auto_826733 ) ) ( not ( = ?auto_826720 ?auto_826734 ) ) ( not ( = ?auto_826720 ?auto_826735 ) ) ( not ( = ?auto_826720 ?auto_826736 ) ) ( not ( = ?auto_826721 ?auto_826722 ) ) ( not ( = ?auto_826721 ?auto_826723 ) ) ( not ( = ?auto_826721 ?auto_826724 ) ) ( not ( = ?auto_826721 ?auto_826725 ) ) ( not ( = ?auto_826721 ?auto_826726 ) ) ( not ( = ?auto_826721 ?auto_826727 ) ) ( not ( = ?auto_826721 ?auto_826728 ) ) ( not ( = ?auto_826721 ?auto_826729 ) ) ( not ( = ?auto_826721 ?auto_826730 ) ) ( not ( = ?auto_826721 ?auto_826731 ) ) ( not ( = ?auto_826721 ?auto_826732 ) ) ( not ( = ?auto_826721 ?auto_826733 ) ) ( not ( = ?auto_826721 ?auto_826734 ) ) ( not ( = ?auto_826721 ?auto_826735 ) ) ( not ( = ?auto_826721 ?auto_826736 ) ) ( not ( = ?auto_826722 ?auto_826723 ) ) ( not ( = ?auto_826722 ?auto_826724 ) ) ( not ( = ?auto_826722 ?auto_826725 ) ) ( not ( = ?auto_826722 ?auto_826726 ) ) ( not ( = ?auto_826722 ?auto_826727 ) ) ( not ( = ?auto_826722 ?auto_826728 ) ) ( not ( = ?auto_826722 ?auto_826729 ) ) ( not ( = ?auto_826722 ?auto_826730 ) ) ( not ( = ?auto_826722 ?auto_826731 ) ) ( not ( = ?auto_826722 ?auto_826732 ) ) ( not ( = ?auto_826722 ?auto_826733 ) ) ( not ( = ?auto_826722 ?auto_826734 ) ) ( not ( = ?auto_826722 ?auto_826735 ) ) ( not ( = ?auto_826722 ?auto_826736 ) ) ( not ( = ?auto_826723 ?auto_826724 ) ) ( not ( = ?auto_826723 ?auto_826725 ) ) ( not ( = ?auto_826723 ?auto_826726 ) ) ( not ( = ?auto_826723 ?auto_826727 ) ) ( not ( = ?auto_826723 ?auto_826728 ) ) ( not ( = ?auto_826723 ?auto_826729 ) ) ( not ( = ?auto_826723 ?auto_826730 ) ) ( not ( = ?auto_826723 ?auto_826731 ) ) ( not ( = ?auto_826723 ?auto_826732 ) ) ( not ( = ?auto_826723 ?auto_826733 ) ) ( not ( = ?auto_826723 ?auto_826734 ) ) ( not ( = ?auto_826723 ?auto_826735 ) ) ( not ( = ?auto_826723 ?auto_826736 ) ) ( not ( = ?auto_826724 ?auto_826725 ) ) ( not ( = ?auto_826724 ?auto_826726 ) ) ( not ( = ?auto_826724 ?auto_826727 ) ) ( not ( = ?auto_826724 ?auto_826728 ) ) ( not ( = ?auto_826724 ?auto_826729 ) ) ( not ( = ?auto_826724 ?auto_826730 ) ) ( not ( = ?auto_826724 ?auto_826731 ) ) ( not ( = ?auto_826724 ?auto_826732 ) ) ( not ( = ?auto_826724 ?auto_826733 ) ) ( not ( = ?auto_826724 ?auto_826734 ) ) ( not ( = ?auto_826724 ?auto_826735 ) ) ( not ( = ?auto_826724 ?auto_826736 ) ) ( not ( = ?auto_826725 ?auto_826726 ) ) ( not ( = ?auto_826725 ?auto_826727 ) ) ( not ( = ?auto_826725 ?auto_826728 ) ) ( not ( = ?auto_826725 ?auto_826729 ) ) ( not ( = ?auto_826725 ?auto_826730 ) ) ( not ( = ?auto_826725 ?auto_826731 ) ) ( not ( = ?auto_826725 ?auto_826732 ) ) ( not ( = ?auto_826725 ?auto_826733 ) ) ( not ( = ?auto_826725 ?auto_826734 ) ) ( not ( = ?auto_826725 ?auto_826735 ) ) ( not ( = ?auto_826725 ?auto_826736 ) ) ( not ( = ?auto_826726 ?auto_826727 ) ) ( not ( = ?auto_826726 ?auto_826728 ) ) ( not ( = ?auto_826726 ?auto_826729 ) ) ( not ( = ?auto_826726 ?auto_826730 ) ) ( not ( = ?auto_826726 ?auto_826731 ) ) ( not ( = ?auto_826726 ?auto_826732 ) ) ( not ( = ?auto_826726 ?auto_826733 ) ) ( not ( = ?auto_826726 ?auto_826734 ) ) ( not ( = ?auto_826726 ?auto_826735 ) ) ( not ( = ?auto_826726 ?auto_826736 ) ) ( not ( = ?auto_826727 ?auto_826728 ) ) ( not ( = ?auto_826727 ?auto_826729 ) ) ( not ( = ?auto_826727 ?auto_826730 ) ) ( not ( = ?auto_826727 ?auto_826731 ) ) ( not ( = ?auto_826727 ?auto_826732 ) ) ( not ( = ?auto_826727 ?auto_826733 ) ) ( not ( = ?auto_826727 ?auto_826734 ) ) ( not ( = ?auto_826727 ?auto_826735 ) ) ( not ( = ?auto_826727 ?auto_826736 ) ) ( not ( = ?auto_826728 ?auto_826729 ) ) ( not ( = ?auto_826728 ?auto_826730 ) ) ( not ( = ?auto_826728 ?auto_826731 ) ) ( not ( = ?auto_826728 ?auto_826732 ) ) ( not ( = ?auto_826728 ?auto_826733 ) ) ( not ( = ?auto_826728 ?auto_826734 ) ) ( not ( = ?auto_826728 ?auto_826735 ) ) ( not ( = ?auto_826728 ?auto_826736 ) ) ( not ( = ?auto_826729 ?auto_826730 ) ) ( not ( = ?auto_826729 ?auto_826731 ) ) ( not ( = ?auto_826729 ?auto_826732 ) ) ( not ( = ?auto_826729 ?auto_826733 ) ) ( not ( = ?auto_826729 ?auto_826734 ) ) ( not ( = ?auto_826729 ?auto_826735 ) ) ( not ( = ?auto_826729 ?auto_826736 ) ) ( not ( = ?auto_826730 ?auto_826731 ) ) ( not ( = ?auto_826730 ?auto_826732 ) ) ( not ( = ?auto_826730 ?auto_826733 ) ) ( not ( = ?auto_826730 ?auto_826734 ) ) ( not ( = ?auto_826730 ?auto_826735 ) ) ( not ( = ?auto_826730 ?auto_826736 ) ) ( not ( = ?auto_826731 ?auto_826732 ) ) ( not ( = ?auto_826731 ?auto_826733 ) ) ( not ( = ?auto_826731 ?auto_826734 ) ) ( not ( = ?auto_826731 ?auto_826735 ) ) ( not ( = ?auto_826731 ?auto_826736 ) ) ( not ( = ?auto_826732 ?auto_826733 ) ) ( not ( = ?auto_826732 ?auto_826734 ) ) ( not ( = ?auto_826732 ?auto_826735 ) ) ( not ( = ?auto_826732 ?auto_826736 ) ) ( not ( = ?auto_826733 ?auto_826734 ) ) ( not ( = ?auto_826733 ?auto_826735 ) ) ( not ( = ?auto_826733 ?auto_826736 ) ) ( not ( = ?auto_826734 ?auto_826735 ) ) ( not ( = ?auto_826734 ?auto_826736 ) ) ( not ( = ?auto_826735 ?auto_826736 ) ) ( ON ?auto_826735 ?auto_826736 ) ( ON ?auto_826734 ?auto_826735 ) ( ON ?auto_826733 ?auto_826734 ) ( ON ?auto_826732 ?auto_826733 ) ( CLEAR ?auto_826730 ) ( ON ?auto_826731 ?auto_826732 ) ( CLEAR ?auto_826731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_826719 ?auto_826720 ?auto_826721 ?auto_826722 ?auto_826723 ?auto_826724 ?auto_826725 ?auto_826726 ?auto_826727 ?auto_826728 ?auto_826729 ?auto_826730 ?auto_826731 )
      ( MAKE-18PILE ?auto_826719 ?auto_826720 ?auto_826721 ?auto_826722 ?auto_826723 ?auto_826724 ?auto_826725 ?auto_826726 ?auto_826727 ?auto_826728 ?auto_826729 ?auto_826730 ?auto_826731 ?auto_826732 ?auto_826733 ?auto_826734 ?auto_826735 ?auto_826736 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826755 - BLOCK
      ?auto_826756 - BLOCK
      ?auto_826757 - BLOCK
      ?auto_826758 - BLOCK
      ?auto_826759 - BLOCK
      ?auto_826760 - BLOCK
      ?auto_826761 - BLOCK
      ?auto_826762 - BLOCK
      ?auto_826763 - BLOCK
      ?auto_826764 - BLOCK
      ?auto_826765 - BLOCK
      ?auto_826766 - BLOCK
      ?auto_826767 - BLOCK
      ?auto_826768 - BLOCK
      ?auto_826769 - BLOCK
      ?auto_826770 - BLOCK
      ?auto_826771 - BLOCK
      ?auto_826772 - BLOCK
    )
    :vars
    (
      ?auto_826773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826772 ?auto_826773 ) ( ON-TABLE ?auto_826755 ) ( ON ?auto_826756 ?auto_826755 ) ( ON ?auto_826757 ?auto_826756 ) ( ON ?auto_826758 ?auto_826757 ) ( ON ?auto_826759 ?auto_826758 ) ( ON ?auto_826760 ?auto_826759 ) ( ON ?auto_826761 ?auto_826760 ) ( ON ?auto_826762 ?auto_826761 ) ( ON ?auto_826763 ?auto_826762 ) ( ON ?auto_826764 ?auto_826763 ) ( ON ?auto_826765 ?auto_826764 ) ( not ( = ?auto_826755 ?auto_826756 ) ) ( not ( = ?auto_826755 ?auto_826757 ) ) ( not ( = ?auto_826755 ?auto_826758 ) ) ( not ( = ?auto_826755 ?auto_826759 ) ) ( not ( = ?auto_826755 ?auto_826760 ) ) ( not ( = ?auto_826755 ?auto_826761 ) ) ( not ( = ?auto_826755 ?auto_826762 ) ) ( not ( = ?auto_826755 ?auto_826763 ) ) ( not ( = ?auto_826755 ?auto_826764 ) ) ( not ( = ?auto_826755 ?auto_826765 ) ) ( not ( = ?auto_826755 ?auto_826766 ) ) ( not ( = ?auto_826755 ?auto_826767 ) ) ( not ( = ?auto_826755 ?auto_826768 ) ) ( not ( = ?auto_826755 ?auto_826769 ) ) ( not ( = ?auto_826755 ?auto_826770 ) ) ( not ( = ?auto_826755 ?auto_826771 ) ) ( not ( = ?auto_826755 ?auto_826772 ) ) ( not ( = ?auto_826755 ?auto_826773 ) ) ( not ( = ?auto_826756 ?auto_826757 ) ) ( not ( = ?auto_826756 ?auto_826758 ) ) ( not ( = ?auto_826756 ?auto_826759 ) ) ( not ( = ?auto_826756 ?auto_826760 ) ) ( not ( = ?auto_826756 ?auto_826761 ) ) ( not ( = ?auto_826756 ?auto_826762 ) ) ( not ( = ?auto_826756 ?auto_826763 ) ) ( not ( = ?auto_826756 ?auto_826764 ) ) ( not ( = ?auto_826756 ?auto_826765 ) ) ( not ( = ?auto_826756 ?auto_826766 ) ) ( not ( = ?auto_826756 ?auto_826767 ) ) ( not ( = ?auto_826756 ?auto_826768 ) ) ( not ( = ?auto_826756 ?auto_826769 ) ) ( not ( = ?auto_826756 ?auto_826770 ) ) ( not ( = ?auto_826756 ?auto_826771 ) ) ( not ( = ?auto_826756 ?auto_826772 ) ) ( not ( = ?auto_826756 ?auto_826773 ) ) ( not ( = ?auto_826757 ?auto_826758 ) ) ( not ( = ?auto_826757 ?auto_826759 ) ) ( not ( = ?auto_826757 ?auto_826760 ) ) ( not ( = ?auto_826757 ?auto_826761 ) ) ( not ( = ?auto_826757 ?auto_826762 ) ) ( not ( = ?auto_826757 ?auto_826763 ) ) ( not ( = ?auto_826757 ?auto_826764 ) ) ( not ( = ?auto_826757 ?auto_826765 ) ) ( not ( = ?auto_826757 ?auto_826766 ) ) ( not ( = ?auto_826757 ?auto_826767 ) ) ( not ( = ?auto_826757 ?auto_826768 ) ) ( not ( = ?auto_826757 ?auto_826769 ) ) ( not ( = ?auto_826757 ?auto_826770 ) ) ( not ( = ?auto_826757 ?auto_826771 ) ) ( not ( = ?auto_826757 ?auto_826772 ) ) ( not ( = ?auto_826757 ?auto_826773 ) ) ( not ( = ?auto_826758 ?auto_826759 ) ) ( not ( = ?auto_826758 ?auto_826760 ) ) ( not ( = ?auto_826758 ?auto_826761 ) ) ( not ( = ?auto_826758 ?auto_826762 ) ) ( not ( = ?auto_826758 ?auto_826763 ) ) ( not ( = ?auto_826758 ?auto_826764 ) ) ( not ( = ?auto_826758 ?auto_826765 ) ) ( not ( = ?auto_826758 ?auto_826766 ) ) ( not ( = ?auto_826758 ?auto_826767 ) ) ( not ( = ?auto_826758 ?auto_826768 ) ) ( not ( = ?auto_826758 ?auto_826769 ) ) ( not ( = ?auto_826758 ?auto_826770 ) ) ( not ( = ?auto_826758 ?auto_826771 ) ) ( not ( = ?auto_826758 ?auto_826772 ) ) ( not ( = ?auto_826758 ?auto_826773 ) ) ( not ( = ?auto_826759 ?auto_826760 ) ) ( not ( = ?auto_826759 ?auto_826761 ) ) ( not ( = ?auto_826759 ?auto_826762 ) ) ( not ( = ?auto_826759 ?auto_826763 ) ) ( not ( = ?auto_826759 ?auto_826764 ) ) ( not ( = ?auto_826759 ?auto_826765 ) ) ( not ( = ?auto_826759 ?auto_826766 ) ) ( not ( = ?auto_826759 ?auto_826767 ) ) ( not ( = ?auto_826759 ?auto_826768 ) ) ( not ( = ?auto_826759 ?auto_826769 ) ) ( not ( = ?auto_826759 ?auto_826770 ) ) ( not ( = ?auto_826759 ?auto_826771 ) ) ( not ( = ?auto_826759 ?auto_826772 ) ) ( not ( = ?auto_826759 ?auto_826773 ) ) ( not ( = ?auto_826760 ?auto_826761 ) ) ( not ( = ?auto_826760 ?auto_826762 ) ) ( not ( = ?auto_826760 ?auto_826763 ) ) ( not ( = ?auto_826760 ?auto_826764 ) ) ( not ( = ?auto_826760 ?auto_826765 ) ) ( not ( = ?auto_826760 ?auto_826766 ) ) ( not ( = ?auto_826760 ?auto_826767 ) ) ( not ( = ?auto_826760 ?auto_826768 ) ) ( not ( = ?auto_826760 ?auto_826769 ) ) ( not ( = ?auto_826760 ?auto_826770 ) ) ( not ( = ?auto_826760 ?auto_826771 ) ) ( not ( = ?auto_826760 ?auto_826772 ) ) ( not ( = ?auto_826760 ?auto_826773 ) ) ( not ( = ?auto_826761 ?auto_826762 ) ) ( not ( = ?auto_826761 ?auto_826763 ) ) ( not ( = ?auto_826761 ?auto_826764 ) ) ( not ( = ?auto_826761 ?auto_826765 ) ) ( not ( = ?auto_826761 ?auto_826766 ) ) ( not ( = ?auto_826761 ?auto_826767 ) ) ( not ( = ?auto_826761 ?auto_826768 ) ) ( not ( = ?auto_826761 ?auto_826769 ) ) ( not ( = ?auto_826761 ?auto_826770 ) ) ( not ( = ?auto_826761 ?auto_826771 ) ) ( not ( = ?auto_826761 ?auto_826772 ) ) ( not ( = ?auto_826761 ?auto_826773 ) ) ( not ( = ?auto_826762 ?auto_826763 ) ) ( not ( = ?auto_826762 ?auto_826764 ) ) ( not ( = ?auto_826762 ?auto_826765 ) ) ( not ( = ?auto_826762 ?auto_826766 ) ) ( not ( = ?auto_826762 ?auto_826767 ) ) ( not ( = ?auto_826762 ?auto_826768 ) ) ( not ( = ?auto_826762 ?auto_826769 ) ) ( not ( = ?auto_826762 ?auto_826770 ) ) ( not ( = ?auto_826762 ?auto_826771 ) ) ( not ( = ?auto_826762 ?auto_826772 ) ) ( not ( = ?auto_826762 ?auto_826773 ) ) ( not ( = ?auto_826763 ?auto_826764 ) ) ( not ( = ?auto_826763 ?auto_826765 ) ) ( not ( = ?auto_826763 ?auto_826766 ) ) ( not ( = ?auto_826763 ?auto_826767 ) ) ( not ( = ?auto_826763 ?auto_826768 ) ) ( not ( = ?auto_826763 ?auto_826769 ) ) ( not ( = ?auto_826763 ?auto_826770 ) ) ( not ( = ?auto_826763 ?auto_826771 ) ) ( not ( = ?auto_826763 ?auto_826772 ) ) ( not ( = ?auto_826763 ?auto_826773 ) ) ( not ( = ?auto_826764 ?auto_826765 ) ) ( not ( = ?auto_826764 ?auto_826766 ) ) ( not ( = ?auto_826764 ?auto_826767 ) ) ( not ( = ?auto_826764 ?auto_826768 ) ) ( not ( = ?auto_826764 ?auto_826769 ) ) ( not ( = ?auto_826764 ?auto_826770 ) ) ( not ( = ?auto_826764 ?auto_826771 ) ) ( not ( = ?auto_826764 ?auto_826772 ) ) ( not ( = ?auto_826764 ?auto_826773 ) ) ( not ( = ?auto_826765 ?auto_826766 ) ) ( not ( = ?auto_826765 ?auto_826767 ) ) ( not ( = ?auto_826765 ?auto_826768 ) ) ( not ( = ?auto_826765 ?auto_826769 ) ) ( not ( = ?auto_826765 ?auto_826770 ) ) ( not ( = ?auto_826765 ?auto_826771 ) ) ( not ( = ?auto_826765 ?auto_826772 ) ) ( not ( = ?auto_826765 ?auto_826773 ) ) ( not ( = ?auto_826766 ?auto_826767 ) ) ( not ( = ?auto_826766 ?auto_826768 ) ) ( not ( = ?auto_826766 ?auto_826769 ) ) ( not ( = ?auto_826766 ?auto_826770 ) ) ( not ( = ?auto_826766 ?auto_826771 ) ) ( not ( = ?auto_826766 ?auto_826772 ) ) ( not ( = ?auto_826766 ?auto_826773 ) ) ( not ( = ?auto_826767 ?auto_826768 ) ) ( not ( = ?auto_826767 ?auto_826769 ) ) ( not ( = ?auto_826767 ?auto_826770 ) ) ( not ( = ?auto_826767 ?auto_826771 ) ) ( not ( = ?auto_826767 ?auto_826772 ) ) ( not ( = ?auto_826767 ?auto_826773 ) ) ( not ( = ?auto_826768 ?auto_826769 ) ) ( not ( = ?auto_826768 ?auto_826770 ) ) ( not ( = ?auto_826768 ?auto_826771 ) ) ( not ( = ?auto_826768 ?auto_826772 ) ) ( not ( = ?auto_826768 ?auto_826773 ) ) ( not ( = ?auto_826769 ?auto_826770 ) ) ( not ( = ?auto_826769 ?auto_826771 ) ) ( not ( = ?auto_826769 ?auto_826772 ) ) ( not ( = ?auto_826769 ?auto_826773 ) ) ( not ( = ?auto_826770 ?auto_826771 ) ) ( not ( = ?auto_826770 ?auto_826772 ) ) ( not ( = ?auto_826770 ?auto_826773 ) ) ( not ( = ?auto_826771 ?auto_826772 ) ) ( not ( = ?auto_826771 ?auto_826773 ) ) ( not ( = ?auto_826772 ?auto_826773 ) ) ( ON ?auto_826771 ?auto_826772 ) ( ON ?auto_826770 ?auto_826771 ) ( ON ?auto_826769 ?auto_826770 ) ( ON ?auto_826768 ?auto_826769 ) ( ON ?auto_826767 ?auto_826768 ) ( CLEAR ?auto_826765 ) ( ON ?auto_826766 ?auto_826767 ) ( CLEAR ?auto_826766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_826755 ?auto_826756 ?auto_826757 ?auto_826758 ?auto_826759 ?auto_826760 ?auto_826761 ?auto_826762 ?auto_826763 ?auto_826764 ?auto_826765 ?auto_826766 )
      ( MAKE-18PILE ?auto_826755 ?auto_826756 ?auto_826757 ?auto_826758 ?auto_826759 ?auto_826760 ?auto_826761 ?auto_826762 ?auto_826763 ?auto_826764 ?auto_826765 ?auto_826766 ?auto_826767 ?auto_826768 ?auto_826769 ?auto_826770 ?auto_826771 ?auto_826772 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826792 - BLOCK
      ?auto_826793 - BLOCK
      ?auto_826794 - BLOCK
      ?auto_826795 - BLOCK
      ?auto_826796 - BLOCK
      ?auto_826797 - BLOCK
      ?auto_826798 - BLOCK
      ?auto_826799 - BLOCK
      ?auto_826800 - BLOCK
      ?auto_826801 - BLOCK
      ?auto_826802 - BLOCK
      ?auto_826803 - BLOCK
      ?auto_826804 - BLOCK
      ?auto_826805 - BLOCK
      ?auto_826806 - BLOCK
      ?auto_826807 - BLOCK
      ?auto_826808 - BLOCK
      ?auto_826809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_826809 ) ( ON-TABLE ?auto_826792 ) ( ON ?auto_826793 ?auto_826792 ) ( ON ?auto_826794 ?auto_826793 ) ( ON ?auto_826795 ?auto_826794 ) ( ON ?auto_826796 ?auto_826795 ) ( ON ?auto_826797 ?auto_826796 ) ( ON ?auto_826798 ?auto_826797 ) ( ON ?auto_826799 ?auto_826798 ) ( ON ?auto_826800 ?auto_826799 ) ( ON ?auto_826801 ?auto_826800 ) ( ON ?auto_826802 ?auto_826801 ) ( not ( = ?auto_826792 ?auto_826793 ) ) ( not ( = ?auto_826792 ?auto_826794 ) ) ( not ( = ?auto_826792 ?auto_826795 ) ) ( not ( = ?auto_826792 ?auto_826796 ) ) ( not ( = ?auto_826792 ?auto_826797 ) ) ( not ( = ?auto_826792 ?auto_826798 ) ) ( not ( = ?auto_826792 ?auto_826799 ) ) ( not ( = ?auto_826792 ?auto_826800 ) ) ( not ( = ?auto_826792 ?auto_826801 ) ) ( not ( = ?auto_826792 ?auto_826802 ) ) ( not ( = ?auto_826792 ?auto_826803 ) ) ( not ( = ?auto_826792 ?auto_826804 ) ) ( not ( = ?auto_826792 ?auto_826805 ) ) ( not ( = ?auto_826792 ?auto_826806 ) ) ( not ( = ?auto_826792 ?auto_826807 ) ) ( not ( = ?auto_826792 ?auto_826808 ) ) ( not ( = ?auto_826792 ?auto_826809 ) ) ( not ( = ?auto_826793 ?auto_826794 ) ) ( not ( = ?auto_826793 ?auto_826795 ) ) ( not ( = ?auto_826793 ?auto_826796 ) ) ( not ( = ?auto_826793 ?auto_826797 ) ) ( not ( = ?auto_826793 ?auto_826798 ) ) ( not ( = ?auto_826793 ?auto_826799 ) ) ( not ( = ?auto_826793 ?auto_826800 ) ) ( not ( = ?auto_826793 ?auto_826801 ) ) ( not ( = ?auto_826793 ?auto_826802 ) ) ( not ( = ?auto_826793 ?auto_826803 ) ) ( not ( = ?auto_826793 ?auto_826804 ) ) ( not ( = ?auto_826793 ?auto_826805 ) ) ( not ( = ?auto_826793 ?auto_826806 ) ) ( not ( = ?auto_826793 ?auto_826807 ) ) ( not ( = ?auto_826793 ?auto_826808 ) ) ( not ( = ?auto_826793 ?auto_826809 ) ) ( not ( = ?auto_826794 ?auto_826795 ) ) ( not ( = ?auto_826794 ?auto_826796 ) ) ( not ( = ?auto_826794 ?auto_826797 ) ) ( not ( = ?auto_826794 ?auto_826798 ) ) ( not ( = ?auto_826794 ?auto_826799 ) ) ( not ( = ?auto_826794 ?auto_826800 ) ) ( not ( = ?auto_826794 ?auto_826801 ) ) ( not ( = ?auto_826794 ?auto_826802 ) ) ( not ( = ?auto_826794 ?auto_826803 ) ) ( not ( = ?auto_826794 ?auto_826804 ) ) ( not ( = ?auto_826794 ?auto_826805 ) ) ( not ( = ?auto_826794 ?auto_826806 ) ) ( not ( = ?auto_826794 ?auto_826807 ) ) ( not ( = ?auto_826794 ?auto_826808 ) ) ( not ( = ?auto_826794 ?auto_826809 ) ) ( not ( = ?auto_826795 ?auto_826796 ) ) ( not ( = ?auto_826795 ?auto_826797 ) ) ( not ( = ?auto_826795 ?auto_826798 ) ) ( not ( = ?auto_826795 ?auto_826799 ) ) ( not ( = ?auto_826795 ?auto_826800 ) ) ( not ( = ?auto_826795 ?auto_826801 ) ) ( not ( = ?auto_826795 ?auto_826802 ) ) ( not ( = ?auto_826795 ?auto_826803 ) ) ( not ( = ?auto_826795 ?auto_826804 ) ) ( not ( = ?auto_826795 ?auto_826805 ) ) ( not ( = ?auto_826795 ?auto_826806 ) ) ( not ( = ?auto_826795 ?auto_826807 ) ) ( not ( = ?auto_826795 ?auto_826808 ) ) ( not ( = ?auto_826795 ?auto_826809 ) ) ( not ( = ?auto_826796 ?auto_826797 ) ) ( not ( = ?auto_826796 ?auto_826798 ) ) ( not ( = ?auto_826796 ?auto_826799 ) ) ( not ( = ?auto_826796 ?auto_826800 ) ) ( not ( = ?auto_826796 ?auto_826801 ) ) ( not ( = ?auto_826796 ?auto_826802 ) ) ( not ( = ?auto_826796 ?auto_826803 ) ) ( not ( = ?auto_826796 ?auto_826804 ) ) ( not ( = ?auto_826796 ?auto_826805 ) ) ( not ( = ?auto_826796 ?auto_826806 ) ) ( not ( = ?auto_826796 ?auto_826807 ) ) ( not ( = ?auto_826796 ?auto_826808 ) ) ( not ( = ?auto_826796 ?auto_826809 ) ) ( not ( = ?auto_826797 ?auto_826798 ) ) ( not ( = ?auto_826797 ?auto_826799 ) ) ( not ( = ?auto_826797 ?auto_826800 ) ) ( not ( = ?auto_826797 ?auto_826801 ) ) ( not ( = ?auto_826797 ?auto_826802 ) ) ( not ( = ?auto_826797 ?auto_826803 ) ) ( not ( = ?auto_826797 ?auto_826804 ) ) ( not ( = ?auto_826797 ?auto_826805 ) ) ( not ( = ?auto_826797 ?auto_826806 ) ) ( not ( = ?auto_826797 ?auto_826807 ) ) ( not ( = ?auto_826797 ?auto_826808 ) ) ( not ( = ?auto_826797 ?auto_826809 ) ) ( not ( = ?auto_826798 ?auto_826799 ) ) ( not ( = ?auto_826798 ?auto_826800 ) ) ( not ( = ?auto_826798 ?auto_826801 ) ) ( not ( = ?auto_826798 ?auto_826802 ) ) ( not ( = ?auto_826798 ?auto_826803 ) ) ( not ( = ?auto_826798 ?auto_826804 ) ) ( not ( = ?auto_826798 ?auto_826805 ) ) ( not ( = ?auto_826798 ?auto_826806 ) ) ( not ( = ?auto_826798 ?auto_826807 ) ) ( not ( = ?auto_826798 ?auto_826808 ) ) ( not ( = ?auto_826798 ?auto_826809 ) ) ( not ( = ?auto_826799 ?auto_826800 ) ) ( not ( = ?auto_826799 ?auto_826801 ) ) ( not ( = ?auto_826799 ?auto_826802 ) ) ( not ( = ?auto_826799 ?auto_826803 ) ) ( not ( = ?auto_826799 ?auto_826804 ) ) ( not ( = ?auto_826799 ?auto_826805 ) ) ( not ( = ?auto_826799 ?auto_826806 ) ) ( not ( = ?auto_826799 ?auto_826807 ) ) ( not ( = ?auto_826799 ?auto_826808 ) ) ( not ( = ?auto_826799 ?auto_826809 ) ) ( not ( = ?auto_826800 ?auto_826801 ) ) ( not ( = ?auto_826800 ?auto_826802 ) ) ( not ( = ?auto_826800 ?auto_826803 ) ) ( not ( = ?auto_826800 ?auto_826804 ) ) ( not ( = ?auto_826800 ?auto_826805 ) ) ( not ( = ?auto_826800 ?auto_826806 ) ) ( not ( = ?auto_826800 ?auto_826807 ) ) ( not ( = ?auto_826800 ?auto_826808 ) ) ( not ( = ?auto_826800 ?auto_826809 ) ) ( not ( = ?auto_826801 ?auto_826802 ) ) ( not ( = ?auto_826801 ?auto_826803 ) ) ( not ( = ?auto_826801 ?auto_826804 ) ) ( not ( = ?auto_826801 ?auto_826805 ) ) ( not ( = ?auto_826801 ?auto_826806 ) ) ( not ( = ?auto_826801 ?auto_826807 ) ) ( not ( = ?auto_826801 ?auto_826808 ) ) ( not ( = ?auto_826801 ?auto_826809 ) ) ( not ( = ?auto_826802 ?auto_826803 ) ) ( not ( = ?auto_826802 ?auto_826804 ) ) ( not ( = ?auto_826802 ?auto_826805 ) ) ( not ( = ?auto_826802 ?auto_826806 ) ) ( not ( = ?auto_826802 ?auto_826807 ) ) ( not ( = ?auto_826802 ?auto_826808 ) ) ( not ( = ?auto_826802 ?auto_826809 ) ) ( not ( = ?auto_826803 ?auto_826804 ) ) ( not ( = ?auto_826803 ?auto_826805 ) ) ( not ( = ?auto_826803 ?auto_826806 ) ) ( not ( = ?auto_826803 ?auto_826807 ) ) ( not ( = ?auto_826803 ?auto_826808 ) ) ( not ( = ?auto_826803 ?auto_826809 ) ) ( not ( = ?auto_826804 ?auto_826805 ) ) ( not ( = ?auto_826804 ?auto_826806 ) ) ( not ( = ?auto_826804 ?auto_826807 ) ) ( not ( = ?auto_826804 ?auto_826808 ) ) ( not ( = ?auto_826804 ?auto_826809 ) ) ( not ( = ?auto_826805 ?auto_826806 ) ) ( not ( = ?auto_826805 ?auto_826807 ) ) ( not ( = ?auto_826805 ?auto_826808 ) ) ( not ( = ?auto_826805 ?auto_826809 ) ) ( not ( = ?auto_826806 ?auto_826807 ) ) ( not ( = ?auto_826806 ?auto_826808 ) ) ( not ( = ?auto_826806 ?auto_826809 ) ) ( not ( = ?auto_826807 ?auto_826808 ) ) ( not ( = ?auto_826807 ?auto_826809 ) ) ( not ( = ?auto_826808 ?auto_826809 ) ) ( ON ?auto_826808 ?auto_826809 ) ( ON ?auto_826807 ?auto_826808 ) ( ON ?auto_826806 ?auto_826807 ) ( ON ?auto_826805 ?auto_826806 ) ( ON ?auto_826804 ?auto_826805 ) ( CLEAR ?auto_826802 ) ( ON ?auto_826803 ?auto_826804 ) ( CLEAR ?auto_826803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_826792 ?auto_826793 ?auto_826794 ?auto_826795 ?auto_826796 ?auto_826797 ?auto_826798 ?auto_826799 ?auto_826800 ?auto_826801 ?auto_826802 ?auto_826803 )
      ( MAKE-18PILE ?auto_826792 ?auto_826793 ?auto_826794 ?auto_826795 ?auto_826796 ?auto_826797 ?auto_826798 ?auto_826799 ?auto_826800 ?auto_826801 ?auto_826802 ?auto_826803 ?auto_826804 ?auto_826805 ?auto_826806 ?auto_826807 ?auto_826808 ?auto_826809 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826828 - BLOCK
      ?auto_826829 - BLOCK
      ?auto_826830 - BLOCK
      ?auto_826831 - BLOCK
      ?auto_826832 - BLOCK
      ?auto_826833 - BLOCK
      ?auto_826834 - BLOCK
      ?auto_826835 - BLOCK
      ?auto_826836 - BLOCK
      ?auto_826837 - BLOCK
      ?auto_826838 - BLOCK
      ?auto_826839 - BLOCK
      ?auto_826840 - BLOCK
      ?auto_826841 - BLOCK
      ?auto_826842 - BLOCK
      ?auto_826843 - BLOCK
      ?auto_826844 - BLOCK
      ?auto_826845 - BLOCK
    )
    :vars
    (
      ?auto_826846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826845 ?auto_826846 ) ( ON-TABLE ?auto_826828 ) ( ON ?auto_826829 ?auto_826828 ) ( ON ?auto_826830 ?auto_826829 ) ( ON ?auto_826831 ?auto_826830 ) ( ON ?auto_826832 ?auto_826831 ) ( ON ?auto_826833 ?auto_826832 ) ( ON ?auto_826834 ?auto_826833 ) ( ON ?auto_826835 ?auto_826834 ) ( ON ?auto_826836 ?auto_826835 ) ( ON ?auto_826837 ?auto_826836 ) ( not ( = ?auto_826828 ?auto_826829 ) ) ( not ( = ?auto_826828 ?auto_826830 ) ) ( not ( = ?auto_826828 ?auto_826831 ) ) ( not ( = ?auto_826828 ?auto_826832 ) ) ( not ( = ?auto_826828 ?auto_826833 ) ) ( not ( = ?auto_826828 ?auto_826834 ) ) ( not ( = ?auto_826828 ?auto_826835 ) ) ( not ( = ?auto_826828 ?auto_826836 ) ) ( not ( = ?auto_826828 ?auto_826837 ) ) ( not ( = ?auto_826828 ?auto_826838 ) ) ( not ( = ?auto_826828 ?auto_826839 ) ) ( not ( = ?auto_826828 ?auto_826840 ) ) ( not ( = ?auto_826828 ?auto_826841 ) ) ( not ( = ?auto_826828 ?auto_826842 ) ) ( not ( = ?auto_826828 ?auto_826843 ) ) ( not ( = ?auto_826828 ?auto_826844 ) ) ( not ( = ?auto_826828 ?auto_826845 ) ) ( not ( = ?auto_826828 ?auto_826846 ) ) ( not ( = ?auto_826829 ?auto_826830 ) ) ( not ( = ?auto_826829 ?auto_826831 ) ) ( not ( = ?auto_826829 ?auto_826832 ) ) ( not ( = ?auto_826829 ?auto_826833 ) ) ( not ( = ?auto_826829 ?auto_826834 ) ) ( not ( = ?auto_826829 ?auto_826835 ) ) ( not ( = ?auto_826829 ?auto_826836 ) ) ( not ( = ?auto_826829 ?auto_826837 ) ) ( not ( = ?auto_826829 ?auto_826838 ) ) ( not ( = ?auto_826829 ?auto_826839 ) ) ( not ( = ?auto_826829 ?auto_826840 ) ) ( not ( = ?auto_826829 ?auto_826841 ) ) ( not ( = ?auto_826829 ?auto_826842 ) ) ( not ( = ?auto_826829 ?auto_826843 ) ) ( not ( = ?auto_826829 ?auto_826844 ) ) ( not ( = ?auto_826829 ?auto_826845 ) ) ( not ( = ?auto_826829 ?auto_826846 ) ) ( not ( = ?auto_826830 ?auto_826831 ) ) ( not ( = ?auto_826830 ?auto_826832 ) ) ( not ( = ?auto_826830 ?auto_826833 ) ) ( not ( = ?auto_826830 ?auto_826834 ) ) ( not ( = ?auto_826830 ?auto_826835 ) ) ( not ( = ?auto_826830 ?auto_826836 ) ) ( not ( = ?auto_826830 ?auto_826837 ) ) ( not ( = ?auto_826830 ?auto_826838 ) ) ( not ( = ?auto_826830 ?auto_826839 ) ) ( not ( = ?auto_826830 ?auto_826840 ) ) ( not ( = ?auto_826830 ?auto_826841 ) ) ( not ( = ?auto_826830 ?auto_826842 ) ) ( not ( = ?auto_826830 ?auto_826843 ) ) ( not ( = ?auto_826830 ?auto_826844 ) ) ( not ( = ?auto_826830 ?auto_826845 ) ) ( not ( = ?auto_826830 ?auto_826846 ) ) ( not ( = ?auto_826831 ?auto_826832 ) ) ( not ( = ?auto_826831 ?auto_826833 ) ) ( not ( = ?auto_826831 ?auto_826834 ) ) ( not ( = ?auto_826831 ?auto_826835 ) ) ( not ( = ?auto_826831 ?auto_826836 ) ) ( not ( = ?auto_826831 ?auto_826837 ) ) ( not ( = ?auto_826831 ?auto_826838 ) ) ( not ( = ?auto_826831 ?auto_826839 ) ) ( not ( = ?auto_826831 ?auto_826840 ) ) ( not ( = ?auto_826831 ?auto_826841 ) ) ( not ( = ?auto_826831 ?auto_826842 ) ) ( not ( = ?auto_826831 ?auto_826843 ) ) ( not ( = ?auto_826831 ?auto_826844 ) ) ( not ( = ?auto_826831 ?auto_826845 ) ) ( not ( = ?auto_826831 ?auto_826846 ) ) ( not ( = ?auto_826832 ?auto_826833 ) ) ( not ( = ?auto_826832 ?auto_826834 ) ) ( not ( = ?auto_826832 ?auto_826835 ) ) ( not ( = ?auto_826832 ?auto_826836 ) ) ( not ( = ?auto_826832 ?auto_826837 ) ) ( not ( = ?auto_826832 ?auto_826838 ) ) ( not ( = ?auto_826832 ?auto_826839 ) ) ( not ( = ?auto_826832 ?auto_826840 ) ) ( not ( = ?auto_826832 ?auto_826841 ) ) ( not ( = ?auto_826832 ?auto_826842 ) ) ( not ( = ?auto_826832 ?auto_826843 ) ) ( not ( = ?auto_826832 ?auto_826844 ) ) ( not ( = ?auto_826832 ?auto_826845 ) ) ( not ( = ?auto_826832 ?auto_826846 ) ) ( not ( = ?auto_826833 ?auto_826834 ) ) ( not ( = ?auto_826833 ?auto_826835 ) ) ( not ( = ?auto_826833 ?auto_826836 ) ) ( not ( = ?auto_826833 ?auto_826837 ) ) ( not ( = ?auto_826833 ?auto_826838 ) ) ( not ( = ?auto_826833 ?auto_826839 ) ) ( not ( = ?auto_826833 ?auto_826840 ) ) ( not ( = ?auto_826833 ?auto_826841 ) ) ( not ( = ?auto_826833 ?auto_826842 ) ) ( not ( = ?auto_826833 ?auto_826843 ) ) ( not ( = ?auto_826833 ?auto_826844 ) ) ( not ( = ?auto_826833 ?auto_826845 ) ) ( not ( = ?auto_826833 ?auto_826846 ) ) ( not ( = ?auto_826834 ?auto_826835 ) ) ( not ( = ?auto_826834 ?auto_826836 ) ) ( not ( = ?auto_826834 ?auto_826837 ) ) ( not ( = ?auto_826834 ?auto_826838 ) ) ( not ( = ?auto_826834 ?auto_826839 ) ) ( not ( = ?auto_826834 ?auto_826840 ) ) ( not ( = ?auto_826834 ?auto_826841 ) ) ( not ( = ?auto_826834 ?auto_826842 ) ) ( not ( = ?auto_826834 ?auto_826843 ) ) ( not ( = ?auto_826834 ?auto_826844 ) ) ( not ( = ?auto_826834 ?auto_826845 ) ) ( not ( = ?auto_826834 ?auto_826846 ) ) ( not ( = ?auto_826835 ?auto_826836 ) ) ( not ( = ?auto_826835 ?auto_826837 ) ) ( not ( = ?auto_826835 ?auto_826838 ) ) ( not ( = ?auto_826835 ?auto_826839 ) ) ( not ( = ?auto_826835 ?auto_826840 ) ) ( not ( = ?auto_826835 ?auto_826841 ) ) ( not ( = ?auto_826835 ?auto_826842 ) ) ( not ( = ?auto_826835 ?auto_826843 ) ) ( not ( = ?auto_826835 ?auto_826844 ) ) ( not ( = ?auto_826835 ?auto_826845 ) ) ( not ( = ?auto_826835 ?auto_826846 ) ) ( not ( = ?auto_826836 ?auto_826837 ) ) ( not ( = ?auto_826836 ?auto_826838 ) ) ( not ( = ?auto_826836 ?auto_826839 ) ) ( not ( = ?auto_826836 ?auto_826840 ) ) ( not ( = ?auto_826836 ?auto_826841 ) ) ( not ( = ?auto_826836 ?auto_826842 ) ) ( not ( = ?auto_826836 ?auto_826843 ) ) ( not ( = ?auto_826836 ?auto_826844 ) ) ( not ( = ?auto_826836 ?auto_826845 ) ) ( not ( = ?auto_826836 ?auto_826846 ) ) ( not ( = ?auto_826837 ?auto_826838 ) ) ( not ( = ?auto_826837 ?auto_826839 ) ) ( not ( = ?auto_826837 ?auto_826840 ) ) ( not ( = ?auto_826837 ?auto_826841 ) ) ( not ( = ?auto_826837 ?auto_826842 ) ) ( not ( = ?auto_826837 ?auto_826843 ) ) ( not ( = ?auto_826837 ?auto_826844 ) ) ( not ( = ?auto_826837 ?auto_826845 ) ) ( not ( = ?auto_826837 ?auto_826846 ) ) ( not ( = ?auto_826838 ?auto_826839 ) ) ( not ( = ?auto_826838 ?auto_826840 ) ) ( not ( = ?auto_826838 ?auto_826841 ) ) ( not ( = ?auto_826838 ?auto_826842 ) ) ( not ( = ?auto_826838 ?auto_826843 ) ) ( not ( = ?auto_826838 ?auto_826844 ) ) ( not ( = ?auto_826838 ?auto_826845 ) ) ( not ( = ?auto_826838 ?auto_826846 ) ) ( not ( = ?auto_826839 ?auto_826840 ) ) ( not ( = ?auto_826839 ?auto_826841 ) ) ( not ( = ?auto_826839 ?auto_826842 ) ) ( not ( = ?auto_826839 ?auto_826843 ) ) ( not ( = ?auto_826839 ?auto_826844 ) ) ( not ( = ?auto_826839 ?auto_826845 ) ) ( not ( = ?auto_826839 ?auto_826846 ) ) ( not ( = ?auto_826840 ?auto_826841 ) ) ( not ( = ?auto_826840 ?auto_826842 ) ) ( not ( = ?auto_826840 ?auto_826843 ) ) ( not ( = ?auto_826840 ?auto_826844 ) ) ( not ( = ?auto_826840 ?auto_826845 ) ) ( not ( = ?auto_826840 ?auto_826846 ) ) ( not ( = ?auto_826841 ?auto_826842 ) ) ( not ( = ?auto_826841 ?auto_826843 ) ) ( not ( = ?auto_826841 ?auto_826844 ) ) ( not ( = ?auto_826841 ?auto_826845 ) ) ( not ( = ?auto_826841 ?auto_826846 ) ) ( not ( = ?auto_826842 ?auto_826843 ) ) ( not ( = ?auto_826842 ?auto_826844 ) ) ( not ( = ?auto_826842 ?auto_826845 ) ) ( not ( = ?auto_826842 ?auto_826846 ) ) ( not ( = ?auto_826843 ?auto_826844 ) ) ( not ( = ?auto_826843 ?auto_826845 ) ) ( not ( = ?auto_826843 ?auto_826846 ) ) ( not ( = ?auto_826844 ?auto_826845 ) ) ( not ( = ?auto_826844 ?auto_826846 ) ) ( not ( = ?auto_826845 ?auto_826846 ) ) ( ON ?auto_826844 ?auto_826845 ) ( ON ?auto_826843 ?auto_826844 ) ( ON ?auto_826842 ?auto_826843 ) ( ON ?auto_826841 ?auto_826842 ) ( ON ?auto_826840 ?auto_826841 ) ( ON ?auto_826839 ?auto_826840 ) ( CLEAR ?auto_826837 ) ( ON ?auto_826838 ?auto_826839 ) ( CLEAR ?auto_826838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_826828 ?auto_826829 ?auto_826830 ?auto_826831 ?auto_826832 ?auto_826833 ?auto_826834 ?auto_826835 ?auto_826836 ?auto_826837 ?auto_826838 )
      ( MAKE-18PILE ?auto_826828 ?auto_826829 ?auto_826830 ?auto_826831 ?auto_826832 ?auto_826833 ?auto_826834 ?auto_826835 ?auto_826836 ?auto_826837 ?auto_826838 ?auto_826839 ?auto_826840 ?auto_826841 ?auto_826842 ?auto_826843 ?auto_826844 ?auto_826845 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826865 - BLOCK
      ?auto_826866 - BLOCK
      ?auto_826867 - BLOCK
      ?auto_826868 - BLOCK
      ?auto_826869 - BLOCK
      ?auto_826870 - BLOCK
      ?auto_826871 - BLOCK
      ?auto_826872 - BLOCK
      ?auto_826873 - BLOCK
      ?auto_826874 - BLOCK
      ?auto_826875 - BLOCK
      ?auto_826876 - BLOCK
      ?auto_826877 - BLOCK
      ?auto_826878 - BLOCK
      ?auto_826879 - BLOCK
      ?auto_826880 - BLOCK
      ?auto_826881 - BLOCK
      ?auto_826882 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_826882 ) ( ON-TABLE ?auto_826865 ) ( ON ?auto_826866 ?auto_826865 ) ( ON ?auto_826867 ?auto_826866 ) ( ON ?auto_826868 ?auto_826867 ) ( ON ?auto_826869 ?auto_826868 ) ( ON ?auto_826870 ?auto_826869 ) ( ON ?auto_826871 ?auto_826870 ) ( ON ?auto_826872 ?auto_826871 ) ( ON ?auto_826873 ?auto_826872 ) ( ON ?auto_826874 ?auto_826873 ) ( not ( = ?auto_826865 ?auto_826866 ) ) ( not ( = ?auto_826865 ?auto_826867 ) ) ( not ( = ?auto_826865 ?auto_826868 ) ) ( not ( = ?auto_826865 ?auto_826869 ) ) ( not ( = ?auto_826865 ?auto_826870 ) ) ( not ( = ?auto_826865 ?auto_826871 ) ) ( not ( = ?auto_826865 ?auto_826872 ) ) ( not ( = ?auto_826865 ?auto_826873 ) ) ( not ( = ?auto_826865 ?auto_826874 ) ) ( not ( = ?auto_826865 ?auto_826875 ) ) ( not ( = ?auto_826865 ?auto_826876 ) ) ( not ( = ?auto_826865 ?auto_826877 ) ) ( not ( = ?auto_826865 ?auto_826878 ) ) ( not ( = ?auto_826865 ?auto_826879 ) ) ( not ( = ?auto_826865 ?auto_826880 ) ) ( not ( = ?auto_826865 ?auto_826881 ) ) ( not ( = ?auto_826865 ?auto_826882 ) ) ( not ( = ?auto_826866 ?auto_826867 ) ) ( not ( = ?auto_826866 ?auto_826868 ) ) ( not ( = ?auto_826866 ?auto_826869 ) ) ( not ( = ?auto_826866 ?auto_826870 ) ) ( not ( = ?auto_826866 ?auto_826871 ) ) ( not ( = ?auto_826866 ?auto_826872 ) ) ( not ( = ?auto_826866 ?auto_826873 ) ) ( not ( = ?auto_826866 ?auto_826874 ) ) ( not ( = ?auto_826866 ?auto_826875 ) ) ( not ( = ?auto_826866 ?auto_826876 ) ) ( not ( = ?auto_826866 ?auto_826877 ) ) ( not ( = ?auto_826866 ?auto_826878 ) ) ( not ( = ?auto_826866 ?auto_826879 ) ) ( not ( = ?auto_826866 ?auto_826880 ) ) ( not ( = ?auto_826866 ?auto_826881 ) ) ( not ( = ?auto_826866 ?auto_826882 ) ) ( not ( = ?auto_826867 ?auto_826868 ) ) ( not ( = ?auto_826867 ?auto_826869 ) ) ( not ( = ?auto_826867 ?auto_826870 ) ) ( not ( = ?auto_826867 ?auto_826871 ) ) ( not ( = ?auto_826867 ?auto_826872 ) ) ( not ( = ?auto_826867 ?auto_826873 ) ) ( not ( = ?auto_826867 ?auto_826874 ) ) ( not ( = ?auto_826867 ?auto_826875 ) ) ( not ( = ?auto_826867 ?auto_826876 ) ) ( not ( = ?auto_826867 ?auto_826877 ) ) ( not ( = ?auto_826867 ?auto_826878 ) ) ( not ( = ?auto_826867 ?auto_826879 ) ) ( not ( = ?auto_826867 ?auto_826880 ) ) ( not ( = ?auto_826867 ?auto_826881 ) ) ( not ( = ?auto_826867 ?auto_826882 ) ) ( not ( = ?auto_826868 ?auto_826869 ) ) ( not ( = ?auto_826868 ?auto_826870 ) ) ( not ( = ?auto_826868 ?auto_826871 ) ) ( not ( = ?auto_826868 ?auto_826872 ) ) ( not ( = ?auto_826868 ?auto_826873 ) ) ( not ( = ?auto_826868 ?auto_826874 ) ) ( not ( = ?auto_826868 ?auto_826875 ) ) ( not ( = ?auto_826868 ?auto_826876 ) ) ( not ( = ?auto_826868 ?auto_826877 ) ) ( not ( = ?auto_826868 ?auto_826878 ) ) ( not ( = ?auto_826868 ?auto_826879 ) ) ( not ( = ?auto_826868 ?auto_826880 ) ) ( not ( = ?auto_826868 ?auto_826881 ) ) ( not ( = ?auto_826868 ?auto_826882 ) ) ( not ( = ?auto_826869 ?auto_826870 ) ) ( not ( = ?auto_826869 ?auto_826871 ) ) ( not ( = ?auto_826869 ?auto_826872 ) ) ( not ( = ?auto_826869 ?auto_826873 ) ) ( not ( = ?auto_826869 ?auto_826874 ) ) ( not ( = ?auto_826869 ?auto_826875 ) ) ( not ( = ?auto_826869 ?auto_826876 ) ) ( not ( = ?auto_826869 ?auto_826877 ) ) ( not ( = ?auto_826869 ?auto_826878 ) ) ( not ( = ?auto_826869 ?auto_826879 ) ) ( not ( = ?auto_826869 ?auto_826880 ) ) ( not ( = ?auto_826869 ?auto_826881 ) ) ( not ( = ?auto_826869 ?auto_826882 ) ) ( not ( = ?auto_826870 ?auto_826871 ) ) ( not ( = ?auto_826870 ?auto_826872 ) ) ( not ( = ?auto_826870 ?auto_826873 ) ) ( not ( = ?auto_826870 ?auto_826874 ) ) ( not ( = ?auto_826870 ?auto_826875 ) ) ( not ( = ?auto_826870 ?auto_826876 ) ) ( not ( = ?auto_826870 ?auto_826877 ) ) ( not ( = ?auto_826870 ?auto_826878 ) ) ( not ( = ?auto_826870 ?auto_826879 ) ) ( not ( = ?auto_826870 ?auto_826880 ) ) ( not ( = ?auto_826870 ?auto_826881 ) ) ( not ( = ?auto_826870 ?auto_826882 ) ) ( not ( = ?auto_826871 ?auto_826872 ) ) ( not ( = ?auto_826871 ?auto_826873 ) ) ( not ( = ?auto_826871 ?auto_826874 ) ) ( not ( = ?auto_826871 ?auto_826875 ) ) ( not ( = ?auto_826871 ?auto_826876 ) ) ( not ( = ?auto_826871 ?auto_826877 ) ) ( not ( = ?auto_826871 ?auto_826878 ) ) ( not ( = ?auto_826871 ?auto_826879 ) ) ( not ( = ?auto_826871 ?auto_826880 ) ) ( not ( = ?auto_826871 ?auto_826881 ) ) ( not ( = ?auto_826871 ?auto_826882 ) ) ( not ( = ?auto_826872 ?auto_826873 ) ) ( not ( = ?auto_826872 ?auto_826874 ) ) ( not ( = ?auto_826872 ?auto_826875 ) ) ( not ( = ?auto_826872 ?auto_826876 ) ) ( not ( = ?auto_826872 ?auto_826877 ) ) ( not ( = ?auto_826872 ?auto_826878 ) ) ( not ( = ?auto_826872 ?auto_826879 ) ) ( not ( = ?auto_826872 ?auto_826880 ) ) ( not ( = ?auto_826872 ?auto_826881 ) ) ( not ( = ?auto_826872 ?auto_826882 ) ) ( not ( = ?auto_826873 ?auto_826874 ) ) ( not ( = ?auto_826873 ?auto_826875 ) ) ( not ( = ?auto_826873 ?auto_826876 ) ) ( not ( = ?auto_826873 ?auto_826877 ) ) ( not ( = ?auto_826873 ?auto_826878 ) ) ( not ( = ?auto_826873 ?auto_826879 ) ) ( not ( = ?auto_826873 ?auto_826880 ) ) ( not ( = ?auto_826873 ?auto_826881 ) ) ( not ( = ?auto_826873 ?auto_826882 ) ) ( not ( = ?auto_826874 ?auto_826875 ) ) ( not ( = ?auto_826874 ?auto_826876 ) ) ( not ( = ?auto_826874 ?auto_826877 ) ) ( not ( = ?auto_826874 ?auto_826878 ) ) ( not ( = ?auto_826874 ?auto_826879 ) ) ( not ( = ?auto_826874 ?auto_826880 ) ) ( not ( = ?auto_826874 ?auto_826881 ) ) ( not ( = ?auto_826874 ?auto_826882 ) ) ( not ( = ?auto_826875 ?auto_826876 ) ) ( not ( = ?auto_826875 ?auto_826877 ) ) ( not ( = ?auto_826875 ?auto_826878 ) ) ( not ( = ?auto_826875 ?auto_826879 ) ) ( not ( = ?auto_826875 ?auto_826880 ) ) ( not ( = ?auto_826875 ?auto_826881 ) ) ( not ( = ?auto_826875 ?auto_826882 ) ) ( not ( = ?auto_826876 ?auto_826877 ) ) ( not ( = ?auto_826876 ?auto_826878 ) ) ( not ( = ?auto_826876 ?auto_826879 ) ) ( not ( = ?auto_826876 ?auto_826880 ) ) ( not ( = ?auto_826876 ?auto_826881 ) ) ( not ( = ?auto_826876 ?auto_826882 ) ) ( not ( = ?auto_826877 ?auto_826878 ) ) ( not ( = ?auto_826877 ?auto_826879 ) ) ( not ( = ?auto_826877 ?auto_826880 ) ) ( not ( = ?auto_826877 ?auto_826881 ) ) ( not ( = ?auto_826877 ?auto_826882 ) ) ( not ( = ?auto_826878 ?auto_826879 ) ) ( not ( = ?auto_826878 ?auto_826880 ) ) ( not ( = ?auto_826878 ?auto_826881 ) ) ( not ( = ?auto_826878 ?auto_826882 ) ) ( not ( = ?auto_826879 ?auto_826880 ) ) ( not ( = ?auto_826879 ?auto_826881 ) ) ( not ( = ?auto_826879 ?auto_826882 ) ) ( not ( = ?auto_826880 ?auto_826881 ) ) ( not ( = ?auto_826880 ?auto_826882 ) ) ( not ( = ?auto_826881 ?auto_826882 ) ) ( ON ?auto_826881 ?auto_826882 ) ( ON ?auto_826880 ?auto_826881 ) ( ON ?auto_826879 ?auto_826880 ) ( ON ?auto_826878 ?auto_826879 ) ( ON ?auto_826877 ?auto_826878 ) ( ON ?auto_826876 ?auto_826877 ) ( CLEAR ?auto_826874 ) ( ON ?auto_826875 ?auto_826876 ) ( CLEAR ?auto_826875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_826865 ?auto_826866 ?auto_826867 ?auto_826868 ?auto_826869 ?auto_826870 ?auto_826871 ?auto_826872 ?auto_826873 ?auto_826874 ?auto_826875 )
      ( MAKE-18PILE ?auto_826865 ?auto_826866 ?auto_826867 ?auto_826868 ?auto_826869 ?auto_826870 ?auto_826871 ?auto_826872 ?auto_826873 ?auto_826874 ?auto_826875 ?auto_826876 ?auto_826877 ?auto_826878 ?auto_826879 ?auto_826880 ?auto_826881 ?auto_826882 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826901 - BLOCK
      ?auto_826902 - BLOCK
      ?auto_826903 - BLOCK
      ?auto_826904 - BLOCK
      ?auto_826905 - BLOCK
      ?auto_826906 - BLOCK
      ?auto_826907 - BLOCK
      ?auto_826908 - BLOCK
      ?auto_826909 - BLOCK
      ?auto_826910 - BLOCK
      ?auto_826911 - BLOCK
      ?auto_826912 - BLOCK
      ?auto_826913 - BLOCK
      ?auto_826914 - BLOCK
      ?auto_826915 - BLOCK
      ?auto_826916 - BLOCK
      ?auto_826917 - BLOCK
      ?auto_826918 - BLOCK
    )
    :vars
    (
      ?auto_826919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826918 ?auto_826919 ) ( ON-TABLE ?auto_826901 ) ( ON ?auto_826902 ?auto_826901 ) ( ON ?auto_826903 ?auto_826902 ) ( ON ?auto_826904 ?auto_826903 ) ( ON ?auto_826905 ?auto_826904 ) ( ON ?auto_826906 ?auto_826905 ) ( ON ?auto_826907 ?auto_826906 ) ( ON ?auto_826908 ?auto_826907 ) ( ON ?auto_826909 ?auto_826908 ) ( not ( = ?auto_826901 ?auto_826902 ) ) ( not ( = ?auto_826901 ?auto_826903 ) ) ( not ( = ?auto_826901 ?auto_826904 ) ) ( not ( = ?auto_826901 ?auto_826905 ) ) ( not ( = ?auto_826901 ?auto_826906 ) ) ( not ( = ?auto_826901 ?auto_826907 ) ) ( not ( = ?auto_826901 ?auto_826908 ) ) ( not ( = ?auto_826901 ?auto_826909 ) ) ( not ( = ?auto_826901 ?auto_826910 ) ) ( not ( = ?auto_826901 ?auto_826911 ) ) ( not ( = ?auto_826901 ?auto_826912 ) ) ( not ( = ?auto_826901 ?auto_826913 ) ) ( not ( = ?auto_826901 ?auto_826914 ) ) ( not ( = ?auto_826901 ?auto_826915 ) ) ( not ( = ?auto_826901 ?auto_826916 ) ) ( not ( = ?auto_826901 ?auto_826917 ) ) ( not ( = ?auto_826901 ?auto_826918 ) ) ( not ( = ?auto_826901 ?auto_826919 ) ) ( not ( = ?auto_826902 ?auto_826903 ) ) ( not ( = ?auto_826902 ?auto_826904 ) ) ( not ( = ?auto_826902 ?auto_826905 ) ) ( not ( = ?auto_826902 ?auto_826906 ) ) ( not ( = ?auto_826902 ?auto_826907 ) ) ( not ( = ?auto_826902 ?auto_826908 ) ) ( not ( = ?auto_826902 ?auto_826909 ) ) ( not ( = ?auto_826902 ?auto_826910 ) ) ( not ( = ?auto_826902 ?auto_826911 ) ) ( not ( = ?auto_826902 ?auto_826912 ) ) ( not ( = ?auto_826902 ?auto_826913 ) ) ( not ( = ?auto_826902 ?auto_826914 ) ) ( not ( = ?auto_826902 ?auto_826915 ) ) ( not ( = ?auto_826902 ?auto_826916 ) ) ( not ( = ?auto_826902 ?auto_826917 ) ) ( not ( = ?auto_826902 ?auto_826918 ) ) ( not ( = ?auto_826902 ?auto_826919 ) ) ( not ( = ?auto_826903 ?auto_826904 ) ) ( not ( = ?auto_826903 ?auto_826905 ) ) ( not ( = ?auto_826903 ?auto_826906 ) ) ( not ( = ?auto_826903 ?auto_826907 ) ) ( not ( = ?auto_826903 ?auto_826908 ) ) ( not ( = ?auto_826903 ?auto_826909 ) ) ( not ( = ?auto_826903 ?auto_826910 ) ) ( not ( = ?auto_826903 ?auto_826911 ) ) ( not ( = ?auto_826903 ?auto_826912 ) ) ( not ( = ?auto_826903 ?auto_826913 ) ) ( not ( = ?auto_826903 ?auto_826914 ) ) ( not ( = ?auto_826903 ?auto_826915 ) ) ( not ( = ?auto_826903 ?auto_826916 ) ) ( not ( = ?auto_826903 ?auto_826917 ) ) ( not ( = ?auto_826903 ?auto_826918 ) ) ( not ( = ?auto_826903 ?auto_826919 ) ) ( not ( = ?auto_826904 ?auto_826905 ) ) ( not ( = ?auto_826904 ?auto_826906 ) ) ( not ( = ?auto_826904 ?auto_826907 ) ) ( not ( = ?auto_826904 ?auto_826908 ) ) ( not ( = ?auto_826904 ?auto_826909 ) ) ( not ( = ?auto_826904 ?auto_826910 ) ) ( not ( = ?auto_826904 ?auto_826911 ) ) ( not ( = ?auto_826904 ?auto_826912 ) ) ( not ( = ?auto_826904 ?auto_826913 ) ) ( not ( = ?auto_826904 ?auto_826914 ) ) ( not ( = ?auto_826904 ?auto_826915 ) ) ( not ( = ?auto_826904 ?auto_826916 ) ) ( not ( = ?auto_826904 ?auto_826917 ) ) ( not ( = ?auto_826904 ?auto_826918 ) ) ( not ( = ?auto_826904 ?auto_826919 ) ) ( not ( = ?auto_826905 ?auto_826906 ) ) ( not ( = ?auto_826905 ?auto_826907 ) ) ( not ( = ?auto_826905 ?auto_826908 ) ) ( not ( = ?auto_826905 ?auto_826909 ) ) ( not ( = ?auto_826905 ?auto_826910 ) ) ( not ( = ?auto_826905 ?auto_826911 ) ) ( not ( = ?auto_826905 ?auto_826912 ) ) ( not ( = ?auto_826905 ?auto_826913 ) ) ( not ( = ?auto_826905 ?auto_826914 ) ) ( not ( = ?auto_826905 ?auto_826915 ) ) ( not ( = ?auto_826905 ?auto_826916 ) ) ( not ( = ?auto_826905 ?auto_826917 ) ) ( not ( = ?auto_826905 ?auto_826918 ) ) ( not ( = ?auto_826905 ?auto_826919 ) ) ( not ( = ?auto_826906 ?auto_826907 ) ) ( not ( = ?auto_826906 ?auto_826908 ) ) ( not ( = ?auto_826906 ?auto_826909 ) ) ( not ( = ?auto_826906 ?auto_826910 ) ) ( not ( = ?auto_826906 ?auto_826911 ) ) ( not ( = ?auto_826906 ?auto_826912 ) ) ( not ( = ?auto_826906 ?auto_826913 ) ) ( not ( = ?auto_826906 ?auto_826914 ) ) ( not ( = ?auto_826906 ?auto_826915 ) ) ( not ( = ?auto_826906 ?auto_826916 ) ) ( not ( = ?auto_826906 ?auto_826917 ) ) ( not ( = ?auto_826906 ?auto_826918 ) ) ( not ( = ?auto_826906 ?auto_826919 ) ) ( not ( = ?auto_826907 ?auto_826908 ) ) ( not ( = ?auto_826907 ?auto_826909 ) ) ( not ( = ?auto_826907 ?auto_826910 ) ) ( not ( = ?auto_826907 ?auto_826911 ) ) ( not ( = ?auto_826907 ?auto_826912 ) ) ( not ( = ?auto_826907 ?auto_826913 ) ) ( not ( = ?auto_826907 ?auto_826914 ) ) ( not ( = ?auto_826907 ?auto_826915 ) ) ( not ( = ?auto_826907 ?auto_826916 ) ) ( not ( = ?auto_826907 ?auto_826917 ) ) ( not ( = ?auto_826907 ?auto_826918 ) ) ( not ( = ?auto_826907 ?auto_826919 ) ) ( not ( = ?auto_826908 ?auto_826909 ) ) ( not ( = ?auto_826908 ?auto_826910 ) ) ( not ( = ?auto_826908 ?auto_826911 ) ) ( not ( = ?auto_826908 ?auto_826912 ) ) ( not ( = ?auto_826908 ?auto_826913 ) ) ( not ( = ?auto_826908 ?auto_826914 ) ) ( not ( = ?auto_826908 ?auto_826915 ) ) ( not ( = ?auto_826908 ?auto_826916 ) ) ( not ( = ?auto_826908 ?auto_826917 ) ) ( not ( = ?auto_826908 ?auto_826918 ) ) ( not ( = ?auto_826908 ?auto_826919 ) ) ( not ( = ?auto_826909 ?auto_826910 ) ) ( not ( = ?auto_826909 ?auto_826911 ) ) ( not ( = ?auto_826909 ?auto_826912 ) ) ( not ( = ?auto_826909 ?auto_826913 ) ) ( not ( = ?auto_826909 ?auto_826914 ) ) ( not ( = ?auto_826909 ?auto_826915 ) ) ( not ( = ?auto_826909 ?auto_826916 ) ) ( not ( = ?auto_826909 ?auto_826917 ) ) ( not ( = ?auto_826909 ?auto_826918 ) ) ( not ( = ?auto_826909 ?auto_826919 ) ) ( not ( = ?auto_826910 ?auto_826911 ) ) ( not ( = ?auto_826910 ?auto_826912 ) ) ( not ( = ?auto_826910 ?auto_826913 ) ) ( not ( = ?auto_826910 ?auto_826914 ) ) ( not ( = ?auto_826910 ?auto_826915 ) ) ( not ( = ?auto_826910 ?auto_826916 ) ) ( not ( = ?auto_826910 ?auto_826917 ) ) ( not ( = ?auto_826910 ?auto_826918 ) ) ( not ( = ?auto_826910 ?auto_826919 ) ) ( not ( = ?auto_826911 ?auto_826912 ) ) ( not ( = ?auto_826911 ?auto_826913 ) ) ( not ( = ?auto_826911 ?auto_826914 ) ) ( not ( = ?auto_826911 ?auto_826915 ) ) ( not ( = ?auto_826911 ?auto_826916 ) ) ( not ( = ?auto_826911 ?auto_826917 ) ) ( not ( = ?auto_826911 ?auto_826918 ) ) ( not ( = ?auto_826911 ?auto_826919 ) ) ( not ( = ?auto_826912 ?auto_826913 ) ) ( not ( = ?auto_826912 ?auto_826914 ) ) ( not ( = ?auto_826912 ?auto_826915 ) ) ( not ( = ?auto_826912 ?auto_826916 ) ) ( not ( = ?auto_826912 ?auto_826917 ) ) ( not ( = ?auto_826912 ?auto_826918 ) ) ( not ( = ?auto_826912 ?auto_826919 ) ) ( not ( = ?auto_826913 ?auto_826914 ) ) ( not ( = ?auto_826913 ?auto_826915 ) ) ( not ( = ?auto_826913 ?auto_826916 ) ) ( not ( = ?auto_826913 ?auto_826917 ) ) ( not ( = ?auto_826913 ?auto_826918 ) ) ( not ( = ?auto_826913 ?auto_826919 ) ) ( not ( = ?auto_826914 ?auto_826915 ) ) ( not ( = ?auto_826914 ?auto_826916 ) ) ( not ( = ?auto_826914 ?auto_826917 ) ) ( not ( = ?auto_826914 ?auto_826918 ) ) ( not ( = ?auto_826914 ?auto_826919 ) ) ( not ( = ?auto_826915 ?auto_826916 ) ) ( not ( = ?auto_826915 ?auto_826917 ) ) ( not ( = ?auto_826915 ?auto_826918 ) ) ( not ( = ?auto_826915 ?auto_826919 ) ) ( not ( = ?auto_826916 ?auto_826917 ) ) ( not ( = ?auto_826916 ?auto_826918 ) ) ( not ( = ?auto_826916 ?auto_826919 ) ) ( not ( = ?auto_826917 ?auto_826918 ) ) ( not ( = ?auto_826917 ?auto_826919 ) ) ( not ( = ?auto_826918 ?auto_826919 ) ) ( ON ?auto_826917 ?auto_826918 ) ( ON ?auto_826916 ?auto_826917 ) ( ON ?auto_826915 ?auto_826916 ) ( ON ?auto_826914 ?auto_826915 ) ( ON ?auto_826913 ?auto_826914 ) ( ON ?auto_826912 ?auto_826913 ) ( ON ?auto_826911 ?auto_826912 ) ( CLEAR ?auto_826909 ) ( ON ?auto_826910 ?auto_826911 ) ( CLEAR ?auto_826910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_826901 ?auto_826902 ?auto_826903 ?auto_826904 ?auto_826905 ?auto_826906 ?auto_826907 ?auto_826908 ?auto_826909 ?auto_826910 )
      ( MAKE-18PILE ?auto_826901 ?auto_826902 ?auto_826903 ?auto_826904 ?auto_826905 ?auto_826906 ?auto_826907 ?auto_826908 ?auto_826909 ?auto_826910 ?auto_826911 ?auto_826912 ?auto_826913 ?auto_826914 ?auto_826915 ?auto_826916 ?auto_826917 ?auto_826918 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826938 - BLOCK
      ?auto_826939 - BLOCK
      ?auto_826940 - BLOCK
      ?auto_826941 - BLOCK
      ?auto_826942 - BLOCK
      ?auto_826943 - BLOCK
      ?auto_826944 - BLOCK
      ?auto_826945 - BLOCK
      ?auto_826946 - BLOCK
      ?auto_826947 - BLOCK
      ?auto_826948 - BLOCK
      ?auto_826949 - BLOCK
      ?auto_826950 - BLOCK
      ?auto_826951 - BLOCK
      ?auto_826952 - BLOCK
      ?auto_826953 - BLOCK
      ?auto_826954 - BLOCK
      ?auto_826955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_826955 ) ( ON-TABLE ?auto_826938 ) ( ON ?auto_826939 ?auto_826938 ) ( ON ?auto_826940 ?auto_826939 ) ( ON ?auto_826941 ?auto_826940 ) ( ON ?auto_826942 ?auto_826941 ) ( ON ?auto_826943 ?auto_826942 ) ( ON ?auto_826944 ?auto_826943 ) ( ON ?auto_826945 ?auto_826944 ) ( ON ?auto_826946 ?auto_826945 ) ( not ( = ?auto_826938 ?auto_826939 ) ) ( not ( = ?auto_826938 ?auto_826940 ) ) ( not ( = ?auto_826938 ?auto_826941 ) ) ( not ( = ?auto_826938 ?auto_826942 ) ) ( not ( = ?auto_826938 ?auto_826943 ) ) ( not ( = ?auto_826938 ?auto_826944 ) ) ( not ( = ?auto_826938 ?auto_826945 ) ) ( not ( = ?auto_826938 ?auto_826946 ) ) ( not ( = ?auto_826938 ?auto_826947 ) ) ( not ( = ?auto_826938 ?auto_826948 ) ) ( not ( = ?auto_826938 ?auto_826949 ) ) ( not ( = ?auto_826938 ?auto_826950 ) ) ( not ( = ?auto_826938 ?auto_826951 ) ) ( not ( = ?auto_826938 ?auto_826952 ) ) ( not ( = ?auto_826938 ?auto_826953 ) ) ( not ( = ?auto_826938 ?auto_826954 ) ) ( not ( = ?auto_826938 ?auto_826955 ) ) ( not ( = ?auto_826939 ?auto_826940 ) ) ( not ( = ?auto_826939 ?auto_826941 ) ) ( not ( = ?auto_826939 ?auto_826942 ) ) ( not ( = ?auto_826939 ?auto_826943 ) ) ( not ( = ?auto_826939 ?auto_826944 ) ) ( not ( = ?auto_826939 ?auto_826945 ) ) ( not ( = ?auto_826939 ?auto_826946 ) ) ( not ( = ?auto_826939 ?auto_826947 ) ) ( not ( = ?auto_826939 ?auto_826948 ) ) ( not ( = ?auto_826939 ?auto_826949 ) ) ( not ( = ?auto_826939 ?auto_826950 ) ) ( not ( = ?auto_826939 ?auto_826951 ) ) ( not ( = ?auto_826939 ?auto_826952 ) ) ( not ( = ?auto_826939 ?auto_826953 ) ) ( not ( = ?auto_826939 ?auto_826954 ) ) ( not ( = ?auto_826939 ?auto_826955 ) ) ( not ( = ?auto_826940 ?auto_826941 ) ) ( not ( = ?auto_826940 ?auto_826942 ) ) ( not ( = ?auto_826940 ?auto_826943 ) ) ( not ( = ?auto_826940 ?auto_826944 ) ) ( not ( = ?auto_826940 ?auto_826945 ) ) ( not ( = ?auto_826940 ?auto_826946 ) ) ( not ( = ?auto_826940 ?auto_826947 ) ) ( not ( = ?auto_826940 ?auto_826948 ) ) ( not ( = ?auto_826940 ?auto_826949 ) ) ( not ( = ?auto_826940 ?auto_826950 ) ) ( not ( = ?auto_826940 ?auto_826951 ) ) ( not ( = ?auto_826940 ?auto_826952 ) ) ( not ( = ?auto_826940 ?auto_826953 ) ) ( not ( = ?auto_826940 ?auto_826954 ) ) ( not ( = ?auto_826940 ?auto_826955 ) ) ( not ( = ?auto_826941 ?auto_826942 ) ) ( not ( = ?auto_826941 ?auto_826943 ) ) ( not ( = ?auto_826941 ?auto_826944 ) ) ( not ( = ?auto_826941 ?auto_826945 ) ) ( not ( = ?auto_826941 ?auto_826946 ) ) ( not ( = ?auto_826941 ?auto_826947 ) ) ( not ( = ?auto_826941 ?auto_826948 ) ) ( not ( = ?auto_826941 ?auto_826949 ) ) ( not ( = ?auto_826941 ?auto_826950 ) ) ( not ( = ?auto_826941 ?auto_826951 ) ) ( not ( = ?auto_826941 ?auto_826952 ) ) ( not ( = ?auto_826941 ?auto_826953 ) ) ( not ( = ?auto_826941 ?auto_826954 ) ) ( not ( = ?auto_826941 ?auto_826955 ) ) ( not ( = ?auto_826942 ?auto_826943 ) ) ( not ( = ?auto_826942 ?auto_826944 ) ) ( not ( = ?auto_826942 ?auto_826945 ) ) ( not ( = ?auto_826942 ?auto_826946 ) ) ( not ( = ?auto_826942 ?auto_826947 ) ) ( not ( = ?auto_826942 ?auto_826948 ) ) ( not ( = ?auto_826942 ?auto_826949 ) ) ( not ( = ?auto_826942 ?auto_826950 ) ) ( not ( = ?auto_826942 ?auto_826951 ) ) ( not ( = ?auto_826942 ?auto_826952 ) ) ( not ( = ?auto_826942 ?auto_826953 ) ) ( not ( = ?auto_826942 ?auto_826954 ) ) ( not ( = ?auto_826942 ?auto_826955 ) ) ( not ( = ?auto_826943 ?auto_826944 ) ) ( not ( = ?auto_826943 ?auto_826945 ) ) ( not ( = ?auto_826943 ?auto_826946 ) ) ( not ( = ?auto_826943 ?auto_826947 ) ) ( not ( = ?auto_826943 ?auto_826948 ) ) ( not ( = ?auto_826943 ?auto_826949 ) ) ( not ( = ?auto_826943 ?auto_826950 ) ) ( not ( = ?auto_826943 ?auto_826951 ) ) ( not ( = ?auto_826943 ?auto_826952 ) ) ( not ( = ?auto_826943 ?auto_826953 ) ) ( not ( = ?auto_826943 ?auto_826954 ) ) ( not ( = ?auto_826943 ?auto_826955 ) ) ( not ( = ?auto_826944 ?auto_826945 ) ) ( not ( = ?auto_826944 ?auto_826946 ) ) ( not ( = ?auto_826944 ?auto_826947 ) ) ( not ( = ?auto_826944 ?auto_826948 ) ) ( not ( = ?auto_826944 ?auto_826949 ) ) ( not ( = ?auto_826944 ?auto_826950 ) ) ( not ( = ?auto_826944 ?auto_826951 ) ) ( not ( = ?auto_826944 ?auto_826952 ) ) ( not ( = ?auto_826944 ?auto_826953 ) ) ( not ( = ?auto_826944 ?auto_826954 ) ) ( not ( = ?auto_826944 ?auto_826955 ) ) ( not ( = ?auto_826945 ?auto_826946 ) ) ( not ( = ?auto_826945 ?auto_826947 ) ) ( not ( = ?auto_826945 ?auto_826948 ) ) ( not ( = ?auto_826945 ?auto_826949 ) ) ( not ( = ?auto_826945 ?auto_826950 ) ) ( not ( = ?auto_826945 ?auto_826951 ) ) ( not ( = ?auto_826945 ?auto_826952 ) ) ( not ( = ?auto_826945 ?auto_826953 ) ) ( not ( = ?auto_826945 ?auto_826954 ) ) ( not ( = ?auto_826945 ?auto_826955 ) ) ( not ( = ?auto_826946 ?auto_826947 ) ) ( not ( = ?auto_826946 ?auto_826948 ) ) ( not ( = ?auto_826946 ?auto_826949 ) ) ( not ( = ?auto_826946 ?auto_826950 ) ) ( not ( = ?auto_826946 ?auto_826951 ) ) ( not ( = ?auto_826946 ?auto_826952 ) ) ( not ( = ?auto_826946 ?auto_826953 ) ) ( not ( = ?auto_826946 ?auto_826954 ) ) ( not ( = ?auto_826946 ?auto_826955 ) ) ( not ( = ?auto_826947 ?auto_826948 ) ) ( not ( = ?auto_826947 ?auto_826949 ) ) ( not ( = ?auto_826947 ?auto_826950 ) ) ( not ( = ?auto_826947 ?auto_826951 ) ) ( not ( = ?auto_826947 ?auto_826952 ) ) ( not ( = ?auto_826947 ?auto_826953 ) ) ( not ( = ?auto_826947 ?auto_826954 ) ) ( not ( = ?auto_826947 ?auto_826955 ) ) ( not ( = ?auto_826948 ?auto_826949 ) ) ( not ( = ?auto_826948 ?auto_826950 ) ) ( not ( = ?auto_826948 ?auto_826951 ) ) ( not ( = ?auto_826948 ?auto_826952 ) ) ( not ( = ?auto_826948 ?auto_826953 ) ) ( not ( = ?auto_826948 ?auto_826954 ) ) ( not ( = ?auto_826948 ?auto_826955 ) ) ( not ( = ?auto_826949 ?auto_826950 ) ) ( not ( = ?auto_826949 ?auto_826951 ) ) ( not ( = ?auto_826949 ?auto_826952 ) ) ( not ( = ?auto_826949 ?auto_826953 ) ) ( not ( = ?auto_826949 ?auto_826954 ) ) ( not ( = ?auto_826949 ?auto_826955 ) ) ( not ( = ?auto_826950 ?auto_826951 ) ) ( not ( = ?auto_826950 ?auto_826952 ) ) ( not ( = ?auto_826950 ?auto_826953 ) ) ( not ( = ?auto_826950 ?auto_826954 ) ) ( not ( = ?auto_826950 ?auto_826955 ) ) ( not ( = ?auto_826951 ?auto_826952 ) ) ( not ( = ?auto_826951 ?auto_826953 ) ) ( not ( = ?auto_826951 ?auto_826954 ) ) ( not ( = ?auto_826951 ?auto_826955 ) ) ( not ( = ?auto_826952 ?auto_826953 ) ) ( not ( = ?auto_826952 ?auto_826954 ) ) ( not ( = ?auto_826952 ?auto_826955 ) ) ( not ( = ?auto_826953 ?auto_826954 ) ) ( not ( = ?auto_826953 ?auto_826955 ) ) ( not ( = ?auto_826954 ?auto_826955 ) ) ( ON ?auto_826954 ?auto_826955 ) ( ON ?auto_826953 ?auto_826954 ) ( ON ?auto_826952 ?auto_826953 ) ( ON ?auto_826951 ?auto_826952 ) ( ON ?auto_826950 ?auto_826951 ) ( ON ?auto_826949 ?auto_826950 ) ( ON ?auto_826948 ?auto_826949 ) ( CLEAR ?auto_826946 ) ( ON ?auto_826947 ?auto_826948 ) ( CLEAR ?auto_826947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_826938 ?auto_826939 ?auto_826940 ?auto_826941 ?auto_826942 ?auto_826943 ?auto_826944 ?auto_826945 ?auto_826946 ?auto_826947 )
      ( MAKE-18PILE ?auto_826938 ?auto_826939 ?auto_826940 ?auto_826941 ?auto_826942 ?auto_826943 ?auto_826944 ?auto_826945 ?auto_826946 ?auto_826947 ?auto_826948 ?auto_826949 ?auto_826950 ?auto_826951 ?auto_826952 ?auto_826953 ?auto_826954 ?auto_826955 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_826974 - BLOCK
      ?auto_826975 - BLOCK
      ?auto_826976 - BLOCK
      ?auto_826977 - BLOCK
      ?auto_826978 - BLOCK
      ?auto_826979 - BLOCK
      ?auto_826980 - BLOCK
      ?auto_826981 - BLOCK
      ?auto_826982 - BLOCK
      ?auto_826983 - BLOCK
      ?auto_826984 - BLOCK
      ?auto_826985 - BLOCK
      ?auto_826986 - BLOCK
      ?auto_826987 - BLOCK
      ?auto_826988 - BLOCK
      ?auto_826989 - BLOCK
      ?auto_826990 - BLOCK
      ?auto_826991 - BLOCK
    )
    :vars
    (
      ?auto_826992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_826991 ?auto_826992 ) ( ON-TABLE ?auto_826974 ) ( ON ?auto_826975 ?auto_826974 ) ( ON ?auto_826976 ?auto_826975 ) ( ON ?auto_826977 ?auto_826976 ) ( ON ?auto_826978 ?auto_826977 ) ( ON ?auto_826979 ?auto_826978 ) ( ON ?auto_826980 ?auto_826979 ) ( ON ?auto_826981 ?auto_826980 ) ( not ( = ?auto_826974 ?auto_826975 ) ) ( not ( = ?auto_826974 ?auto_826976 ) ) ( not ( = ?auto_826974 ?auto_826977 ) ) ( not ( = ?auto_826974 ?auto_826978 ) ) ( not ( = ?auto_826974 ?auto_826979 ) ) ( not ( = ?auto_826974 ?auto_826980 ) ) ( not ( = ?auto_826974 ?auto_826981 ) ) ( not ( = ?auto_826974 ?auto_826982 ) ) ( not ( = ?auto_826974 ?auto_826983 ) ) ( not ( = ?auto_826974 ?auto_826984 ) ) ( not ( = ?auto_826974 ?auto_826985 ) ) ( not ( = ?auto_826974 ?auto_826986 ) ) ( not ( = ?auto_826974 ?auto_826987 ) ) ( not ( = ?auto_826974 ?auto_826988 ) ) ( not ( = ?auto_826974 ?auto_826989 ) ) ( not ( = ?auto_826974 ?auto_826990 ) ) ( not ( = ?auto_826974 ?auto_826991 ) ) ( not ( = ?auto_826974 ?auto_826992 ) ) ( not ( = ?auto_826975 ?auto_826976 ) ) ( not ( = ?auto_826975 ?auto_826977 ) ) ( not ( = ?auto_826975 ?auto_826978 ) ) ( not ( = ?auto_826975 ?auto_826979 ) ) ( not ( = ?auto_826975 ?auto_826980 ) ) ( not ( = ?auto_826975 ?auto_826981 ) ) ( not ( = ?auto_826975 ?auto_826982 ) ) ( not ( = ?auto_826975 ?auto_826983 ) ) ( not ( = ?auto_826975 ?auto_826984 ) ) ( not ( = ?auto_826975 ?auto_826985 ) ) ( not ( = ?auto_826975 ?auto_826986 ) ) ( not ( = ?auto_826975 ?auto_826987 ) ) ( not ( = ?auto_826975 ?auto_826988 ) ) ( not ( = ?auto_826975 ?auto_826989 ) ) ( not ( = ?auto_826975 ?auto_826990 ) ) ( not ( = ?auto_826975 ?auto_826991 ) ) ( not ( = ?auto_826975 ?auto_826992 ) ) ( not ( = ?auto_826976 ?auto_826977 ) ) ( not ( = ?auto_826976 ?auto_826978 ) ) ( not ( = ?auto_826976 ?auto_826979 ) ) ( not ( = ?auto_826976 ?auto_826980 ) ) ( not ( = ?auto_826976 ?auto_826981 ) ) ( not ( = ?auto_826976 ?auto_826982 ) ) ( not ( = ?auto_826976 ?auto_826983 ) ) ( not ( = ?auto_826976 ?auto_826984 ) ) ( not ( = ?auto_826976 ?auto_826985 ) ) ( not ( = ?auto_826976 ?auto_826986 ) ) ( not ( = ?auto_826976 ?auto_826987 ) ) ( not ( = ?auto_826976 ?auto_826988 ) ) ( not ( = ?auto_826976 ?auto_826989 ) ) ( not ( = ?auto_826976 ?auto_826990 ) ) ( not ( = ?auto_826976 ?auto_826991 ) ) ( not ( = ?auto_826976 ?auto_826992 ) ) ( not ( = ?auto_826977 ?auto_826978 ) ) ( not ( = ?auto_826977 ?auto_826979 ) ) ( not ( = ?auto_826977 ?auto_826980 ) ) ( not ( = ?auto_826977 ?auto_826981 ) ) ( not ( = ?auto_826977 ?auto_826982 ) ) ( not ( = ?auto_826977 ?auto_826983 ) ) ( not ( = ?auto_826977 ?auto_826984 ) ) ( not ( = ?auto_826977 ?auto_826985 ) ) ( not ( = ?auto_826977 ?auto_826986 ) ) ( not ( = ?auto_826977 ?auto_826987 ) ) ( not ( = ?auto_826977 ?auto_826988 ) ) ( not ( = ?auto_826977 ?auto_826989 ) ) ( not ( = ?auto_826977 ?auto_826990 ) ) ( not ( = ?auto_826977 ?auto_826991 ) ) ( not ( = ?auto_826977 ?auto_826992 ) ) ( not ( = ?auto_826978 ?auto_826979 ) ) ( not ( = ?auto_826978 ?auto_826980 ) ) ( not ( = ?auto_826978 ?auto_826981 ) ) ( not ( = ?auto_826978 ?auto_826982 ) ) ( not ( = ?auto_826978 ?auto_826983 ) ) ( not ( = ?auto_826978 ?auto_826984 ) ) ( not ( = ?auto_826978 ?auto_826985 ) ) ( not ( = ?auto_826978 ?auto_826986 ) ) ( not ( = ?auto_826978 ?auto_826987 ) ) ( not ( = ?auto_826978 ?auto_826988 ) ) ( not ( = ?auto_826978 ?auto_826989 ) ) ( not ( = ?auto_826978 ?auto_826990 ) ) ( not ( = ?auto_826978 ?auto_826991 ) ) ( not ( = ?auto_826978 ?auto_826992 ) ) ( not ( = ?auto_826979 ?auto_826980 ) ) ( not ( = ?auto_826979 ?auto_826981 ) ) ( not ( = ?auto_826979 ?auto_826982 ) ) ( not ( = ?auto_826979 ?auto_826983 ) ) ( not ( = ?auto_826979 ?auto_826984 ) ) ( not ( = ?auto_826979 ?auto_826985 ) ) ( not ( = ?auto_826979 ?auto_826986 ) ) ( not ( = ?auto_826979 ?auto_826987 ) ) ( not ( = ?auto_826979 ?auto_826988 ) ) ( not ( = ?auto_826979 ?auto_826989 ) ) ( not ( = ?auto_826979 ?auto_826990 ) ) ( not ( = ?auto_826979 ?auto_826991 ) ) ( not ( = ?auto_826979 ?auto_826992 ) ) ( not ( = ?auto_826980 ?auto_826981 ) ) ( not ( = ?auto_826980 ?auto_826982 ) ) ( not ( = ?auto_826980 ?auto_826983 ) ) ( not ( = ?auto_826980 ?auto_826984 ) ) ( not ( = ?auto_826980 ?auto_826985 ) ) ( not ( = ?auto_826980 ?auto_826986 ) ) ( not ( = ?auto_826980 ?auto_826987 ) ) ( not ( = ?auto_826980 ?auto_826988 ) ) ( not ( = ?auto_826980 ?auto_826989 ) ) ( not ( = ?auto_826980 ?auto_826990 ) ) ( not ( = ?auto_826980 ?auto_826991 ) ) ( not ( = ?auto_826980 ?auto_826992 ) ) ( not ( = ?auto_826981 ?auto_826982 ) ) ( not ( = ?auto_826981 ?auto_826983 ) ) ( not ( = ?auto_826981 ?auto_826984 ) ) ( not ( = ?auto_826981 ?auto_826985 ) ) ( not ( = ?auto_826981 ?auto_826986 ) ) ( not ( = ?auto_826981 ?auto_826987 ) ) ( not ( = ?auto_826981 ?auto_826988 ) ) ( not ( = ?auto_826981 ?auto_826989 ) ) ( not ( = ?auto_826981 ?auto_826990 ) ) ( not ( = ?auto_826981 ?auto_826991 ) ) ( not ( = ?auto_826981 ?auto_826992 ) ) ( not ( = ?auto_826982 ?auto_826983 ) ) ( not ( = ?auto_826982 ?auto_826984 ) ) ( not ( = ?auto_826982 ?auto_826985 ) ) ( not ( = ?auto_826982 ?auto_826986 ) ) ( not ( = ?auto_826982 ?auto_826987 ) ) ( not ( = ?auto_826982 ?auto_826988 ) ) ( not ( = ?auto_826982 ?auto_826989 ) ) ( not ( = ?auto_826982 ?auto_826990 ) ) ( not ( = ?auto_826982 ?auto_826991 ) ) ( not ( = ?auto_826982 ?auto_826992 ) ) ( not ( = ?auto_826983 ?auto_826984 ) ) ( not ( = ?auto_826983 ?auto_826985 ) ) ( not ( = ?auto_826983 ?auto_826986 ) ) ( not ( = ?auto_826983 ?auto_826987 ) ) ( not ( = ?auto_826983 ?auto_826988 ) ) ( not ( = ?auto_826983 ?auto_826989 ) ) ( not ( = ?auto_826983 ?auto_826990 ) ) ( not ( = ?auto_826983 ?auto_826991 ) ) ( not ( = ?auto_826983 ?auto_826992 ) ) ( not ( = ?auto_826984 ?auto_826985 ) ) ( not ( = ?auto_826984 ?auto_826986 ) ) ( not ( = ?auto_826984 ?auto_826987 ) ) ( not ( = ?auto_826984 ?auto_826988 ) ) ( not ( = ?auto_826984 ?auto_826989 ) ) ( not ( = ?auto_826984 ?auto_826990 ) ) ( not ( = ?auto_826984 ?auto_826991 ) ) ( not ( = ?auto_826984 ?auto_826992 ) ) ( not ( = ?auto_826985 ?auto_826986 ) ) ( not ( = ?auto_826985 ?auto_826987 ) ) ( not ( = ?auto_826985 ?auto_826988 ) ) ( not ( = ?auto_826985 ?auto_826989 ) ) ( not ( = ?auto_826985 ?auto_826990 ) ) ( not ( = ?auto_826985 ?auto_826991 ) ) ( not ( = ?auto_826985 ?auto_826992 ) ) ( not ( = ?auto_826986 ?auto_826987 ) ) ( not ( = ?auto_826986 ?auto_826988 ) ) ( not ( = ?auto_826986 ?auto_826989 ) ) ( not ( = ?auto_826986 ?auto_826990 ) ) ( not ( = ?auto_826986 ?auto_826991 ) ) ( not ( = ?auto_826986 ?auto_826992 ) ) ( not ( = ?auto_826987 ?auto_826988 ) ) ( not ( = ?auto_826987 ?auto_826989 ) ) ( not ( = ?auto_826987 ?auto_826990 ) ) ( not ( = ?auto_826987 ?auto_826991 ) ) ( not ( = ?auto_826987 ?auto_826992 ) ) ( not ( = ?auto_826988 ?auto_826989 ) ) ( not ( = ?auto_826988 ?auto_826990 ) ) ( not ( = ?auto_826988 ?auto_826991 ) ) ( not ( = ?auto_826988 ?auto_826992 ) ) ( not ( = ?auto_826989 ?auto_826990 ) ) ( not ( = ?auto_826989 ?auto_826991 ) ) ( not ( = ?auto_826989 ?auto_826992 ) ) ( not ( = ?auto_826990 ?auto_826991 ) ) ( not ( = ?auto_826990 ?auto_826992 ) ) ( not ( = ?auto_826991 ?auto_826992 ) ) ( ON ?auto_826990 ?auto_826991 ) ( ON ?auto_826989 ?auto_826990 ) ( ON ?auto_826988 ?auto_826989 ) ( ON ?auto_826987 ?auto_826988 ) ( ON ?auto_826986 ?auto_826987 ) ( ON ?auto_826985 ?auto_826986 ) ( ON ?auto_826984 ?auto_826985 ) ( ON ?auto_826983 ?auto_826984 ) ( CLEAR ?auto_826981 ) ( ON ?auto_826982 ?auto_826983 ) ( CLEAR ?auto_826982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_826974 ?auto_826975 ?auto_826976 ?auto_826977 ?auto_826978 ?auto_826979 ?auto_826980 ?auto_826981 ?auto_826982 )
      ( MAKE-18PILE ?auto_826974 ?auto_826975 ?auto_826976 ?auto_826977 ?auto_826978 ?auto_826979 ?auto_826980 ?auto_826981 ?auto_826982 ?auto_826983 ?auto_826984 ?auto_826985 ?auto_826986 ?auto_826987 ?auto_826988 ?auto_826989 ?auto_826990 ?auto_826991 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827011 - BLOCK
      ?auto_827012 - BLOCK
      ?auto_827013 - BLOCK
      ?auto_827014 - BLOCK
      ?auto_827015 - BLOCK
      ?auto_827016 - BLOCK
      ?auto_827017 - BLOCK
      ?auto_827018 - BLOCK
      ?auto_827019 - BLOCK
      ?auto_827020 - BLOCK
      ?auto_827021 - BLOCK
      ?auto_827022 - BLOCK
      ?auto_827023 - BLOCK
      ?auto_827024 - BLOCK
      ?auto_827025 - BLOCK
      ?auto_827026 - BLOCK
      ?auto_827027 - BLOCK
      ?auto_827028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_827028 ) ( ON-TABLE ?auto_827011 ) ( ON ?auto_827012 ?auto_827011 ) ( ON ?auto_827013 ?auto_827012 ) ( ON ?auto_827014 ?auto_827013 ) ( ON ?auto_827015 ?auto_827014 ) ( ON ?auto_827016 ?auto_827015 ) ( ON ?auto_827017 ?auto_827016 ) ( ON ?auto_827018 ?auto_827017 ) ( not ( = ?auto_827011 ?auto_827012 ) ) ( not ( = ?auto_827011 ?auto_827013 ) ) ( not ( = ?auto_827011 ?auto_827014 ) ) ( not ( = ?auto_827011 ?auto_827015 ) ) ( not ( = ?auto_827011 ?auto_827016 ) ) ( not ( = ?auto_827011 ?auto_827017 ) ) ( not ( = ?auto_827011 ?auto_827018 ) ) ( not ( = ?auto_827011 ?auto_827019 ) ) ( not ( = ?auto_827011 ?auto_827020 ) ) ( not ( = ?auto_827011 ?auto_827021 ) ) ( not ( = ?auto_827011 ?auto_827022 ) ) ( not ( = ?auto_827011 ?auto_827023 ) ) ( not ( = ?auto_827011 ?auto_827024 ) ) ( not ( = ?auto_827011 ?auto_827025 ) ) ( not ( = ?auto_827011 ?auto_827026 ) ) ( not ( = ?auto_827011 ?auto_827027 ) ) ( not ( = ?auto_827011 ?auto_827028 ) ) ( not ( = ?auto_827012 ?auto_827013 ) ) ( not ( = ?auto_827012 ?auto_827014 ) ) ( not ( = ?auto_827012 ?auto_827015 ) ) ( not ( = ?auto_827012 ?auto_827016 ) ) ( not ( = ?auto_827012 ?auto_827017 ) ) ( not ( = ?auto_827012 ?auto_827018 ) ) ( not ( = ?auto_827012 ?auto_827019 ) ) ( not ( = ?auto_827012 ?auto_827020 ) ) ( not ( = ?auto_827012 ?auto_827021 ) ) ( not ( = ?auto_827012 ?auto_827022 ) ) ( not ( = ?auto_827012 ?auto_827023 ) ) ( not ( = ?auto_827012 ?auto_827024 ) ) ( not ( = ?auto_827012 ?auto_827025 ) ) ( not ( = ?auto_827012 ?auto_827026 ) ) ( not ( = ?auto_827012 ?auto_827027 ) ) ( not ( = ?auto_827012 ?auto_827028 ) ) ( not ( = ?auto_827013 ?auto_827014 ) ) ( not ( = ?auto_827013 ?auto_827015 ) ) ( not ( = ?auto_827013 ?auto_827016 ) ) ( not ( = ?auto_827013 ?auto_827017 ) ) ( not ( = ?auto_827013 ?auto_827018 ) ) ( not ( = ?auto_827013 ?auto_827019 ) ) ( not ( = ?auto_827013 ?auto_827020 ) ) ( not ( = ?auto_827013 ?auto_827021 ) ) ( not ( = ?auto_827013 ?auto_827022 ) ) ( not ( = ?auto_827013 ?auto_827023 ) ) ( not ( = ?auto_827013 ?auto_827024 ) ) ( not ( = ?auto_827013 ?auto_827025 ) ) ( not ( = ?auto_827013 ?auto_827026 ) ) ( not ( = ?auto_827013 ?auto_827027 ) ) ( not ( = ?auto_827013 ?auto_827028 ) ) ( not ( = ?auto_827014 ?auto_827015 ) ) ( not ( = ?auto_827014 ?auto_827016 ) ) ( not ( = ?auto_827014 ?auto_827017 ) ) ( not ( = ?auto_827014 ?auto_827018 ) ) ( not ( = ?auto_827014 ?auto_827019 ) ) ( not ( = ?auto_827014 ?auto_827020 ) ) ( not ( = ?auto_827014 ?auto_827021 ) ) ( not ( = ?auto_827014 ?auto_827022 ) ) ( not ( = ?auto_827014 ?auto_827023 ) ) ( not ( = ?auto_827014 ?auto_827024 ) ) ( not ( = ?auto_827014 ?auto_827025 ) ) ( not ( = ?auto_827014 ?auto_827026 ) ) ( not ( = ?auto_827014 ?auto_827027 ) ) ( not ( = ?auto_827014 ?auto_827028 ) ) ( not ( = ?auto_827015 ?auto_827016 ) ) ( not ( = ?auto_827015 ?auto_827017 ) ) ( not ( = ?auto_827015 ?auto_827018 ) ) ( not ( = ?auto_827015 ?auto_827019 ) ) ( not ( = ?auto_827015 ?auto_827020 ) ) ( not ( = ?auto_827015 ?auto_827021 ) ) ( not ( = ?auto_827015 ?auto_827022 ) ) ( not ( = ?auto_827015 ?auto_827023 ) ) ( not ( = ?auto_827015 ?auto_827024 ) ) ( not ( = ?auto_827015 ?auto_827025 ) ) ( not ( = ?auto_827015 ?auto_827026 ) ) ( not ( = ?auto_827015 ?auto_827027 ) ) ( not ( = ?auto_827015 ?auto_827028 ) ) ( not ( = ?auto_827016 ?auto_827017 ) ) ( not ( = ?auto_827016 ?auto_827018 ) ) ( not ( = ?auto_827016 ?auto_827019 ) ) ( not ( = ?auto_827016 ?auto_827020 ) ) ( not ( = ?auto_827016 ?auto_827021 ) ) ( not ( = ?auto_827016 ?auto_827022 ) ) ( not ( = ?auto_827016 ?auto_827023 ) ) ( not ( = ?auto_827016 ?auto_827024 ) ) ( not ( = ?auto_827016 ?auto_827025 ) ) ( not ( = ?auto_827016 ?auto_827026 ) ) ( not ( = ?auto_827016 ?auto_827027 ) ) ( not ( = ?auto_827016 ?auto_827028 ) ) ( not ( = ?auto_827017 ?auto_827018 ) ) ( not ( = ?auto_827017 ?auto_827019 ) ) ( not ( = ?auto_827017 ?auto_827020 ) ) ( not ( = ?auto_827017 ?auto_827021 ) ) ( not ( = ?auto_827017 ?auto_827022 ) ) ( not ( = ?auto_827017 ?auto_827023 ) ) ( not ( = ?auto_827017 ?auto_827024 ) ) ( not ( = ?auto_827017 ?auto_827025 ) ) ( not ( = ?auto_827017 ?auto_827026 ) ) ( not ( = ?auto_827017 ?auto_827027 ) ) ( not ( = ?auto_827017 ?auto_827028 ) ) ( not ( = ?auto_827018 ?auto_827019 ) ) ( not ( = ?auto_827018 ?auto_827020 ) ) ( not ( = ?auto_827018 ?auto_827021 ) ) ( not ( = ?auto_827018 ?auto_827022 ) ) ( not ( = ?auto_827018 ?auto_827023 ) ) ( not ( = ?auto_827018 ?auto_827024 ) ) ( not ( = ?auto_827018 ?auto_827025 ) ) ( not ( = ?auto_827018 ?auto_827026 ) ) ( not ( = ?auto_827018 ?auto_827027 ) ) ( not ( = ?auto_827018 ?auto_827028 ) ) ( not ( = ?auto_827019 ?auto_827020 ) ) ( not ( = ?auto_827019 ?auto_827021 ) ) ( not ( = ?auto_827019 ?auto_827022 ) ) ( not ( = ?auto_827019 ?auto_827023 ) ) ( not ( = ?auto_827019 ?auto_827024 ) ) ( not ( = ?auto_827019 ?auto_827025 ) ) ( not ( = ?auto_827019 ?auto_827026 ) ) ( not ( = ?auto_827019 ?auto_827027 ) ) ( not ( = ?auto_827019 ?auto_827028 ) ) ( not ( = ?auto_827020 ?auto_827021 ) ) ( not ( = ?auto_827020 ?auto_827022 ) ) ( not ( = ?auto_827020 ?auto_827023 ) ) ( not ( = ?auto_827020 ?auto_827024 ) ) ( not ( = ?auto_827020 ?auto_827025 ) ) ( not ( = ?auto_827020 ?auto_827026 ) ) ( not ( = ?auto_827020 ?auto_827027 ) ) ( not ( = ?auto_827020 ?auto_827028 ) ) ( not ( = ?auto_827021 ?auto_827022 ) ) ( not ( = ?auto_827021 ?auto_827023 ) ) ( not ( = ?auto_827021 ?auto_827024 ) ) ( not ( = ?auto_827021 ?auto_827025 ) ) ( not ( = ?auto_827021 ?auto_827026 ) ) ( not ( = ?auto_827021 ?auto_827027 ) ) ( not ( = ?auto_827021 ?auto_827028 ) ) ( not ( = ?auto_827022 ?auto_827023 ) ) ( not ( = ?auto_827022 ?auto_827024 ) ) ( not ( = ?auto_827022 ?auto_827025 ) ) ( not ( = ?auto_827022 ?auto_827026 ) ) ( not ( = ?auto_827022 ?auto_827027 ) ) ( not ( = ?auto_827022 ?auto_827028 ) ) ( not ( = ?auto_827023 ?auto_827024 ) ) ( not ( = ?auto_827023 ?auto_827025 ) ) ( not ( = ?auto_827023 ?auto_827026 ) ) ( not ( = ?auto_827023 ?auto_827027 ) ) ( not ( = ?auto_827023 ?auto_827028 ) ) ( not ( = ?auto_827024 ?auto_827025 ) ) ( not ( = ?auto_827024 ?auto_827026 ) ) ( not ( = ?auto_827024 ?auto_827027 ) ) ( not ( = ?auto_827024 ?auto_827028 ) ) ( not ( = ?auto_827025 ?auto_827026 ) ) ( not ( = ?auto_827025 ?auto_827027 ) ) ( not ( = ?auto_827025 ?auto_827028 ) ) ( not ( = ?auto_827026 ?auto_827027 ) ) ( not ( = ?auto_827026 ?auto_827028 ) ) ( not ( = ?auto_827027 ?auto_827028 ) ) ( ON ?auto_827027 ?auto_827028 ) ( ON ?auto_827026 ?auto_827027 ) ( ON ?auto_827025 ?auto_827026 ) ( ON ?auto_827024 ?auto_827025 ) ( ON ?auto_827023 ?auto_827024 ) ( ON ?auto_827022 ?auto_827023 ) ( ON ?auto_827021 ?auto_827022 ) ( ON ?auto_827020 ?auto_827021 ) ( CLEAR ?auto_827018 ) ( ON ?auto_827019 ?auto_827020 ) ( CLEAR ?auto_827019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_827011 ?auto_827012 ?auto_827013 ?auto_827014 ?auto_827015 ?auto_827016 ?auto_827017 ?auto_827018 ?auto_827019 )
      ( MAKE-18PILE ?auto_827011 ?auto_827012 ?auto_827013 ?auto_827014 ?auto_827015 ?auto_827016 ?auto_827017 ?auto_827018 ?auto_827019 ?auto_827020 ?auto_827021 ?auto_827022 ?auto_827023 ?auto_827024 ?auto_827025 ?auto_827026 ?auto_827027 ?auto_827028 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827047 - BLOCK
      ?auto_827048 - BLOCK
      ?auto_827049 - BLOCK
      ?auto_827050 - BLOCK
      ?auto_827051 - BLOCK
      ?auto_827052 - BLOCK
      ?auto_827053 - BLOCK
      ?auto_827054 - BLOCK
      ?auto_827055 - BLOCK
      ?auto_827056 - BLOCK
      ?auto_827057 - BLOCK
      ?auto_827058 - BLOCK
      ?auto_827059 - BLOCK
      ?auto_827060 - BLOCK
      ?auto_827061 - BLOCK
      ?auto_827062 - BLOCK
      ?auto_827063 - BLOCK
      ?auto_827064 - BLOCK
    )
    :vars
    (
      ?auto_827065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827064 ?auto_827065 ) ( ON-TABLE ?auto_827047 ) ( ON ?auto_827048 ?auto_827047 ) ( ON ?auto_827049 ?auto_827048 ) ( ON ?auto_827050 ?auto_827049 ) ( ON ?auto_827051 ?auto_827050 ) ( ON ?auto_827052 ?auto_827051 ) ( ON ?auto_827053 ?auto_827052 ) ( not ( = ?auto_827047 ?auto_827048 ) ) ( not ( = ?auto_827047 ?auto_827049 ) ) ( not ( = ?auto_827047 ?auto_827050 ) ) ( not ( = ?auto_827047 ?auto_827051 ) ) ( not ( = ?auto_827047 ?auto_827052 ) ) ( not ( = ?auto_827047 ?auto_827053 ) ) ( not ( = ?auto_827047 ?auto_827054 ) ) ( not ( = ?auto_827047 ?auto_827055 ) ) ( not ( = ?auto_827047 ?auto_827056 ) ) ( not ( = ?auto_827047 ?auto_827057 ) ) ( not ( = ?auto_827047 ?auto_827058 ) ) ( not ( = ?auto_827047 ?auto_827059 ) ) ( not ( = ?auto_827047 ?auto_827060 ) ) ( not ( = ?auto_827047 ?auto_827061 ) ) ( not ( = ?auto_827047 ?auto_827062 ) ) ( not ( = ?auto_827047 ?auto_827063 ) ) ( not ( = ?auto_827047 ?auto_827064 ) ) ( not ( = ?auto_827047 ?auto_827065 ) ) ( not ( = ?auto_827048 ?auto_827049 ) ) ( not ( = ?auto_827048 ?auto_827050 ) ) ( not ( = ?auto_827048 ?auto_827051 ) ) ( not ( = ?auto_827048 ?auto_827052 ) ) ( not ( = ?auto_827048 ?auto_827053 ) ) ( not ( = ?auto_827048 ?auto_827054 ) ) ( not ( = ?auto_827048 ?auto_827055 ) ) ( not ( = ?auto_827048 ?auto_827056 ) ) ( not ( = ?auto_827048 ?auto_827057 ) ) ( not ( = ?auto_827048 ?auto_827058 ) ) ( not ( = ?auto_827048 ?auto_827059 ) ) ( not ( = ?auto_827048 ?auto_827060 ) ) ( not ( = ?auto_827048 ?auto_827061 ) ) ( not ( = ?auto_827048 ?auto_827062 ) ) ( not ( = ?auto_827048 ?auto_827063 ) ) ( not ( = ?auto_827048 ?auto_827064 ) ) ( not ( = ?auto_827048 ?auto_827065 ) ) ( not ( = ?auto_827049 ?auto_827050 ) ) ( not ( = ?auto_827049 ?auto_827051 ) ) ( not ( = ?auto_827049 ?auto_827052 ) ) ( not ( = ?auto_827049 ?auto_827053 ) ) ( not ( = ?auto_827049 ?auto_827054 ) ) ( not ( = ?auto_827049 ?auto_827055 ) ) ( not ( = ?auto_827049 ?auto_827056 ) ) ( not ( = ?auto_827049 ?auto_827057 ) ) ( not ( = ?auto_827049 ?auto_827058 ) ) ( not ( = ?auto_827049 ?auto_827059 ) ) ( not ( = ?auto_827049 ?auto_827060 ) ) ( not ( = ?auto_827049 ?auto_827061 ) ) ( not ( = ?auto_827049 ?auto_827062 ) ) ( not ( = ?auto_827049 ?auto_827063 ) ) ( not ( = ?auto_827049 ?auto_827064 ) ) ( not ( = ?auto_827049 ?auto_827065 ) ) ( not ( = ?auto_827050 ?auto_827051 ) ) ( not ( = ?auto_827050 ?auto_827052 ) ) ( not ( = ?auto_827050 ?auto_827053 ) ) ( not ( = ?auto_827050 ?auto_827054 ) ) ( not ( = ?auto_827050 ?auto_827055 ) ) ( not ( = ?auto_827050 ?auto_827056 ) ) ( not ( = ?auto_827050 ?auto_827057 ) ) ( not ( = ?auto_827050 ?auto_827058 ) ) ( not ( = ?auto_827050 ?auto_827059 ) ) ( not ( = ?auto_827050 ?auto_827060 ) ) ( not ( = ?auto_827050 ?auto_827061 ) ) ( not ( = ?auto_827050 ?auto_827062 ) ) ( not ( = ?auto_827050 ?auto_827063 ) ) ( not ( = ?auto_827050 ?auto_827064 ) ) ( not ( = ?auto_827050 ?auto_827065 ) ) ( not ( = ?auto_827051 ?auto_827052 ) ) ( not ( = ?auto_827051 ?auto_827053 ) ) ( not ( = ?auto_827051 ?auto_827054 ) ) ( not ( = ?auto_827051 ?auto_827055 ) ) ( not ( = ?auto_827051 ?auto_827056 ) ) ( not ( = ?auto_827051 ?auto_827057 ) ) ( not ( = ?auto_827051 ?auto_827058 ) ) ( not ( = ?auto_827051 ?auto_827059 ) ) ( not ( = ?auto_827051 ?auto_827060 ) ) ( not ( = ?auto_827051 ?auto_827061 ) ) ( not ( = ?auto_827051 ?auto_827062 ) ) ( not ( = ?auto_827051 ?auto_827063 ) ) ( not ( = ?auto_827051 ?auto_827064 ) ) ( not ( = ?auto_827051 ?auto_827065 ) ) ( not ( = ?auto_827052 ?auto_827053 ) ) ( not ( = ?auto_827052 ?auto_827054 ) ) ( not ( = ?auto_827052 ?auto_827055 ) ) ( not ( = ?auto_827052 ?auto_827056 ) ) ( not ( = ?auto_827052 ?auto_827057 ) ) ( not ( = ?auto_827052 ?auto_827058 ) ) ( not ( = ?auto_827052 ?auto_827059 ) ) ( not ( = ?auto_827052 ?auto_827060 ) ) ( not ( = ?auto_827052 ?auto_827061 ) ) ( not ( = ?auto_827052 ?auto_827062 ) ) ( not ( = ?auto_827052 ?auto_827063 ) ) ( not ( = ?auto_827052 ?auto_827064 ) ) ( not ( = ?auto_827052 ?auto_827065 ) ) ( not ( = ?auto_827053 ?auto_827054 ) ) ( not ( = ?auto_827053 ?auto_827055 ) ) ( not ( = ?auto_827053 ?auto_827056 ) ) ( not ( = ?auto_827053 ?auto_827057 ) ) ( not ( = ?auto_827053 ?auto_827058 ) ) ( not ( = ?auto_827053 ?auto_827059 ) ) ( not ( = ?auto_827053 ?auto_827060 ) ) ( not ( = ?auto_827053 ?auto_827061 ) ) ( not ( = ?auto_827053 ?auto_827062 ) ) ( not ( = ?auto_827053 ?auto_827063 ) ) ( not ( = ?auto_827053 ?auto_827064 ) ) ( not ( = ?auto_827053 ?auto_827065 ) ) ( not ( = ?auto_827054 ?auto_827055 ) ) ( not ( = ?auto_827054 ?auto_827056 ) ) ( not ( = ?auto_827054 ?auto_827057 ) ) ( not ( = ?auto_827054 ?auto_827058 ) ) ( not ( = ?auto_827054 ?auto_827059 ) ) ( not ( = ?auto_827054 ?auto_827060 ) ) ( not ( = ?auto_827054 ?auto_827061 ) ) ( not ( = ?auto_827054 ?auto_827062 ) ) ( not ( = ?auto_827054 ?auto_827063 ) ) ( not ( = ?auto_827054 ?auto_827064 ) ) ( not ( = ?auto_827054 ?auto_827065 ) ) ( not ( = ?auto_827055 ?auto_827056 ) ) ( not ( = ?auto_827055 ?auto_827057 ) ) ( not ( = ?auto_827055 ?auto_827058 ) ) ( not ( = ?auto_827055 ?auto_827059 ) ) ( not ( = ?auto_827055 ?auto_827060 ) ) ( not ( = ?auto_827055 ?auto_827061 ) ) ( not ( = ?auto_827055 ?auto_827062 ) ) ( not ( = ?auto_827055 ?auto_827063 ) ) ( not ( = ?auto_827055 ?auto_827064 ) ) ( not ( = ?auto_827055 ?auto_827065 ) ) ( not ( = ?auto_827056 ?auto_827057 ) ) ( not ( = ?auto_827056 ?auto_827058 ) ) ( not ( = ?auto_827056 ?auto_827059 ) ) ( not ( = ?auto_827056 ?auto_827060 ) ) ( not ( = ?auto_827056 ?auto_827061 ) ) ( not ( = ?auto_827056 ?auto_827062 ) ) ( not ( = ?auto_827056 ?auto_827063 ) ) ( not ( = ?auto_827056 ?auto_827064 ) ) ( not ( = ?auto_827056 ?auto_827065 ) ) ( not ( = ?auto_827057 ?auto_827058 ) ) ( not ( = ?auto_827057 ?auto_827059 ) ) ( not ( = ?auto_827057 ?auto_827060 ) ) ( not ( = ?auto_827057 ?auto_827061 ) ) ( not ( = ?auto_827057 ?auto_827062 ) ) ( not ( = ?auto_827057 ?auto_827063 ) ) ( not ( = ?auto_827057 ?auto_827064 ) ) ( not ( = ?auto_827057 ?auto_827065 ) ) ( not ( = ?auto_827058 ?auto_827059 ) ) ( not ( = ?auto_827058 ?auto_827060 ) ) ( not ( = ?auto_827058 ?auto_827061 ) ) ( not ( = ?auto_827058 ?auto_827062 ) ) ( not ( = ?auto_827058 ?auto_827063 ) ) ( not ( = ?auto_827058 ?auto_827064 ) ) ( not ( = ?auto_827058 ?auto_827065 ) ) ( not ( = ?auto_827059 ?auto_827060 ) ) ( not ( = ?auto_827059 ?auto_827061 ) ) ( not ( = ?auto_827059 ?auto_827062 ) ) ( not ( = ?auto_827059 ?auto_827063 ) ) ( not ( = ?auto_827059 ?auto_827064 ) ) ( not ( = ?auto_827059 ?auto_827065 ) ) ( not ( = ?auto_827060 ?auto_827061 ) ) ( not ( = ?auto_827060 ?auto_827062 ) ) ( not ( = ?auto_827060 ?auto_827063 ) ) ( not ( = ?auto_827060 ?auto_827064 ) ) ( not ( = ?auto_827060 ?auto_827065 ) ) ( not ( = ?auto_827061 ?auto_827062 ) ) ( not ( = ?auto_827061 ?auto_827063 ) ) ( not ( = ?auto_827061 ?auto_827064 ) ) ( not ( = ?auto_827061 ?auto_827065 ) ) ( not ( = ?auto_827062 ?auto_827063 ) ) ( not ( = ?auto_827062 ?auto_827064 ) ) ( not ( = ?auto_827062 ?auto_827065 ) ) ( not ( = ?auto_827063 ?auto_827064 ) ) ( not ( = ?auto_827063 ?auto_827065 ) ) ( not ( = ?auto_827064 ?auto_827065 ) ) ( ON ?auto_827063 ?auto_827064 ) ( ON ?auto_827062 ?auto_827063 ) ( ON ?auto_827061 ?auto_827062 ) ( ON ?auto_827060 ?auto_827061 ) ( ON ?auto_827059 ?auto_827060 ) ( ON ?auto_827058 ?auto_827059 ) ( ON ?auto_827057 ?auto_827058 ) ( ON ?auto_827056 ?auto_827057 ) ( ON ?auto_827055 ?auto_827056 ) ( CLEAR ?auto_827053 ) ( ON ?auto_827054 ?auto_827055 ) ( CLEAR ?auto_827054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_827047 ?auto_827048 ?auto_827049 ?auto_827050 ?auto_827051 ?auto_827052 ?auto_827053 ?auto_827054 )
      ( MAKE-18PILE ?auto_827047 ?auto_827048 ?auto_827049 ?auto_827050 ?auto_827051 ?auto_827052 ?auto_827053 ?auto_827054 ?auto_827055 ?auto_827056 ?auto_827057 ?auto_827058 ?auto_827059 ?auto_827060 ?auto_827061 ?auto_827062 ?auto_827063 ?auto_827064 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827084 - BLOCK
      ?auto_827085 - BLOCK
      ?auto_827086 - BLOCK
      ?auto_827087 - BLOCK
      ?auto_827088 - BLOCK
      ?auto_827089 - BLOCK
      ?auto_827090 - BLOCK
      ?auto_827091 - BLOCK
      ?auto_827092 - BLOCK
      ?auto_827093 - BLOCK
      ?auto_827094 - BLOCK
      ?auto_827095 - BLOCK
      ?auto_827096 - BLOCK
      ?auto_827097 - BLOCK
      ?auto_827098 - BLOCK
      ?auto_827099 - BLOCK
      ?auto_827100 - BLOCK
      ?auto_827101 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_827101 ) ( ON-TABLE ?auto_827084 ) ( ON ?auto_827085 ?auto_827084 ) ( ON ?auto_827086 ?auto_827085 ) ( ON ?auto_827087 ?auto_827086 ) ( ON ?auto_827088 ?auto_827087 ) ( ON ?auto_827089 ?auto_827088 ) ( ON ?auto_827090 ?auto_827089 ) ( not ( = ?auto_827084 ?auto_827085 ) ) ( not ( = ?auto_827084 ?auto_827086 ) ) ( not ( = ?auto_827084 ?auto_827087 ) ) ( not ( = ?auto_827084 ?auto_827088 ) ) ( not ( = ?auto_827084 ?auto_827089 ) ) ( not ( = ?auto_827084 ?auto_827090 ) ) ( not ( = ?auto_827084 ?auto_827091 ) ) ( not ( = ?auto_827084 ?auto_827092 ) ) ( not ( = ?auto_827084 ?auto_827093 ) ) ( not ( = ?auto_827084 ?auto_827094 ) ) ( not ( = ?auto_827084 ?auto_827095 ) ) ( not ( = ?auto_827084 ?auto_827096 ) ) ( not ( = ?auto_827084 ?auto_827097 ) ) ( not ( = ?auto_827084 ?auto_827098 ) ) ( not ( = ?auto_827084 ?auto_827099 ) ) ( not ( = ?auto_827084 ?auto_827100 ) ) ( not ( = ?auto_827084 ?auto_827101 ) ) ( not ( = ?auto_827085 ?auto_827086 ) ) ( not ( = ?auto_827085 ?auto_827087 ) ) ( not ( = ?auto_827085 ?auto_827088 ) ) ( not ( = ?auto_827085 ?auto_827089 ) ) ( not ( = ?auto_827085 ?auto_827090 ) ) ( not ( = ?auto_827085 ?auto_827091 ) ) ( not ( = ?auto_827085 ?auto_827092 ) ) ( not ( = ?auto_827085 ?auto_827093 ) ) ( not ( = ?auto_827085 ?auto_827094 ) ) ( not ( = ?auto_827085 ?auto_827095 ) ) ( not ( = ?auto_827085 ?auto_827096 ) ) ( not ( = ?auto_827085 ?auto_827097 ) ) ( not ( = ?auto_827085 ?auto_827098 ) ) ( not ( = ?auto_827085 ?auto_827099 ) ) ( not ( = ?auto_827085 ?auto_827100 ) ) ( not ( = ?auto_827085 ?auto_827101 ) ) ( not ( = ?auto_827086 ?auto_827087 ) ) ( not ( = ?auto_827086 ?auto_827088 ) ) ( not ( = ?auto_827086 ?auto_827089 ) ) ( not ( = ?auto_827086 ?auto_827090 ) ) ( not ( = ?auto_827086 ?auto_827091 ) ) ( not ( = ?auto_827086 ?auto_827092 ) ) ( not ( = ?auto_827086 ?auto_827093 ) ) ( not ( = ?auto_827086 ?auto_827094 ) ) ( not ( = ?auto_827086 ?auto_827095 ) ) ( not ( = ?auto_827086 ?auto_827096 ) ) ( not ( = ?auto_827086 ?auto_827097 ) ) ( not ( = ?auto_827086 ?auto_827098 ) ) ( not ( = ?auto_827086 ?auto_827099 ) ) ( not ( = ?auto_827086 ?auto_827100 ) ) ( not ( = ?auto_827086 ?auto_827101 ) ) ( not ( = ?auto_827087 ?auto_827088 ) ) ( not ( = ?auto_827087 ?auto_827089 ) ) ( not ( = ?auto_827087 ?auto_827090 ) ) ( not ( = ?auto_827087 ?auto_827091 ) ) ( not ( = ?auto_827087 ?auto_827092 ) ) ( not ( = ?auto_827087 ?auto_827093 ) ) ( not ( = ?auto_827087 ?auto_827094 ) ) ( not ( = ?auto_827087 ?auto_827095 ) ) ( not ( = ?auto_827087 ?auto_827096 ) ) ( not ( = ?auto_827087 ?auto_827097 ) ) ( not ( = ?auto_827087 ?auto_827098 ) ) ( not ( = ?auto_827087 ?auto_827099 ) ) ( not ( = ?auto_827087 ?auto_827100 ) ) ( not ( = ?auto_827087 ?auto_827101 ) ) ( not ( = ?auto_827088 ?auto_827089 ) ) ( not ( = ?auto_827088 ?auto_827090 ) ) ( not ( = ?auto_827088 ?auto_827091 ) ) ( not ( = ?auto_827088 ?auto_827092 ) ) ( not ( = ?auto_827088 ?auto_827093 ) ) ( not ( = ?auto_827088 ?auto_827094 ) ) ( not ( = ?auto_827088 ?auto_827095 ) ) ( not ( = ?auto_827088 ?auto_827096 ) ) ( not ( = ?auto_827088 ?auto_827097 ) ) ( not ( = ?auto_827088 ?auto_827098 ) ) ( not ( = ?auto_827088 ?auto_827099 ) ) ( not ( = ?auto_827088 ?auto_827100 ) ) ( not ( = ?auto_827088 ?auto_827101 ) ) ( not ( = ?auto_827089 ?auto_827090 ) ) ( not ( = ?auto_827089 ?auto_827091 ) ) ( not ( = ?auto_827089 ?auto_827092 ) ) ( not ( = ?auto_827089 ?auto_827093 ) ) ( not ( = ?auto_827089 ?auto_827094 ) ) ( not ( = ?auto_827089 ?auto_827095 ) ) ( not ( = ?auto_827089 ?auto_827096 ) ) ( not ( = ?auto_827089 ?auto_827097 ) ) ( not ( = ?auto_827089 ?auto_827098 ) ) ( not ( = ?auto_827089 ?auto_827099 ) ) ( not ( = ?auto_827089 ?auto_827100 ) ) ( not ( = ?auto_827089 ?auto_827101 ) ) ( not ( = ?auto_827090 ?auto_827091 ) ) ( not ( = ?auto_827090 ?auto_827092 ) ) ( not ( = ?auto_827090 ?auto_827093 ) ) ( not ( = ?auto_827090 ?auto_827094 ) ) ( not ( = ?auto_827090 ?auto_827095 ) ) ( not ( = ?auto_827090 ?auto_827096 ) ) ( not ( = ?auto_827090 ?auto_827097 ) ) ( not ( = ?auto_827090 ?auto_827098 ) ) ( not ( = ?auto_827090 ?auto_827099 ) ) ( not ( = ?auto_827090 ?auto_827100 ) ) ( not ( = ?auto_827090 ?auto_827101 ) ) ( not ( = ?auto_827091 ?auto_827092 ) ) ( not ( = ?auto_827091 ?auto_827093 ) ) ( not ( = ?auto_827091 ?auto_827094 ) ) ( not ( = ?auto_827091 ?auto_827095 ) ) ( not ( = ?auto_827091 ?auto_827096 ) ) ( not ( = ?auto_827091 ?auto_827097 ) ) ( not ( = ?auto_827091 ?auto_827098 ) ) ( not ( = ?auto_827091 ?auto_827099 ) ) ( not ( = ?auto_827091 ?auto_827100 ) ) ( not ( = ?auto_827091 ?auto_827101 ) ) ( not ( = ?auto_827092 ?auto_827093 ) ) ( not ( = ?auto_827092 ?auto_827094 ) ) ( not ( = ?auto_827092 ?auto_827095 ) ) ( not ( = ?auto_827092 ?auto_827096 ) ) ( not ( = ?auto_827092 ?auto_827097 ) ) ( not ( = ?auto_827092 ?auto_827098 ) ) ( not ( = ?auto_827092 ?auto_827099 ) ) ( not ( = ?auto_827092 ?auto_827100 ) ) ( not ( = ?auto_827092 ?auto_827101 ) ) ( not ( = ?auto_827093 ?auto_827094 ) ) ( not ( = ?auto_827093 ?auto_827095 ) ) ( not ( = ?auto_827093 ?auto_827096 ) ) ( not ( = ?auto_827093 ?auto_827097 ) ) ( not ( = ?auto_827093 ?auto_827098 ) ) ( not ( = ?auto_827093 ?auto_827099 ) ) ( not ( = ?auto_827093 ?auto_827100 ) ) ( not ( = ?auto_827093 ?auto_827101 ) ) ( not ( = ?auto_827094 ?auto_827095 ) ) ( not ( = ?auto_827094 ?auto_827096 ) ) ( not ( = ?auto_827094 ?auto_827097 ) ) ( not ( = ?auto_827094 ?auto_827098 ) ) ( not ( = ?auto_827094 ?auto_827099 ) ) ( not ( = ?auto_827094 ?auto_827100 ) ) ( not ( = ?auto_827094 ?auto_827101 ) ) ( not ( = ?auto_827095 ?auto_827096 ) ) ( not ( = ?auto_827095 ?auto_827097 ) ) ( not ( = ?auto_827095 ?auto_827098 ) ) ( not ( = ?auto_827095 ?auto_827099 ) ) ( not ( = ?auto_827095 ?auto_827100 ) ) ( not ( = ?auto_827095 ?auto_827101 ) ) ( not ( = ?auto_827096 ?auto_827097 ) ) ( not ( = ?auto_827096 ?auto_827098 ) ) ( not ( = ?auto_827096 ?auto_827099 ) ) ( not ( = ?auto_827096 ?auto_827100 ) ) ( not ( = ?auto_827096 ?auto_827101 ) ) ( not ( = ?auto_827097 ?auto_827098 ) ) ( not ( = ?auto_827097 ?auto_827099 ) ) ( not ( = ?auto_827097 ?auto_827100 ) ) ( not ( = ?auto_827097 ?auto_827101 ) ) ( not ( = ?auto_827098 ?auto_827099 ) ) ( not ( = ?auto_827098 ?auto_827100 ) ) ( not ( = ?auto_827098 ?auto_827101 ) ) ( not ( = ?auto_827099 ?auto_827100 ) ) ( not ( = ?auto_827099 ?auto_827101 ) ) ( not ( = ?auto_827100 ?auto_827101 ) ) ( ON ?auto_827100 ?auto_827101 ) ( ON ?auto_827099 ?auto_827100 ) ( ON ?auto_827098 ?auto_827099 ) ( ON ?auto_827097 ?auto_827098 ) ( ON ?auto_827096 ?auto_827097 ) ( ON ?auto_827095 ?auto_827096 ) ( ON ?auto_827094 ?auto_827095 ) ( ON ?auto_827093 ?auto_827094 ) ( ON ?auto_827092 ?auto_827093 ) ( CLEAR ?auto_827090 ) ( ON ?auto_827091 ?auto_827092 ) ( CLEAR ?auto_827091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_827084 ?auto_827085 ?auto_827086 ?auto_827087 ?auto_827088 ?auto_827089 ?auto_827090 ?auto_827091 )
      ( MAKE-18PILE ?auto_827084 ?auto_827085 ?auto_827086 ?auto_827087 ?auto_827088 ?auto_827089 ?auto_827090 ?auto_827091 ?auto_827092 ?auto_827093 ?auto_827094 ?auto_827095 ?auto_827096 ?auto_827097 ?auto_827098 ?auto_827099 ?auto_827100 ?auto_827101 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827120 - BLOCK
      ?auto_827121 - BLOCK
      ?auto_827122 - BLOCK
      ?auto_827123 - BLOCK
      ?auto_827124 - BLOCK
      ?auto_827125 - BLOCK
      ?auto_827126 - BLOCK
      ?auto_827127 - BLOCK
      ?auto_827128 - BLOCK
      ?auto_827129 - BLOCK
      ?auto_827130 - BLOCK
      ?auto_827131 - BLOCK
      ?auto_827132 - BLOCK
      ?auto_827133 - BLOCK
      ?auto_827134 - BLOCK
      ?auto_827135 - BLOCK
      ?auto_827136 - BLOCK
      ?auto_827137 - BLOCK
    )
    :vars
    (
      ?auto_827138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827137 ?auto_827138 ) ( ON-TABLE ?auto_827120 ) ( ON ?auto_827121 ?auto_827120 ) ( ON ?auto_827122 ?auto_827121 ) ( ON ?auto_827123 ?auto_827122 ) ( ON ?auto_827124 ?auto_827123 ) ( ON ?auto_827125 ?auto_827124 ) ( not ( = ?auto_827120 ?auto_827121 ) ) ( not ( = ?auto_827120 ?auto_827122 ) ) ( not ( = ?auto_827120 ?auto_827123 ) ) ( not ( = ?auto_827120 ?auto_827124 ) ) ( not ( = ?auto_827120 ?auto_827125 ) ) ( not ( = ?auto_827120 ?auto_827126 ) ) ( not ( = ?auto_827120 ?auto_827127 ) ) ( not ( = ?auto_827120 ?auto_827128 ) ) ( not ( = ?auto_827120 ?auto_827129 ) ) ( not ( = ?auto_827120 ?auto_827130 ) ) ( not ( = ?auto_827120 ?auto_827131 ) ) ( not ( = ?auto_827120 ?auto_827132 ) ) ( not ( = ?auto_827120 ?auto_827133 ) ) ( not ( = ?auto_827120 ?auto_827134 ) ) ( not ( = ?auto_827120 ?auto_827135 ) ) ( not ( = ?auto_827120 ?auto_827136 ) ) ( not ( = ?auto_827120 ?auto_827137 ) ) ( not ( = ?auto_827120 ?auto_827138 ) ) ( not ( = ?auto_827121 ?auto_827122 ) ) ( not ( = ?auto_827121 ?auto_827123 ) ) ( not ( = ?auto_827121 ?auto_827124 ) ) ( not ( = ?auto_827121 ?auto_827125 ) ) ( not ( = ?auto_827121 ?auto_827126 ) ) ( not ( = ?auto_827121 ?auto_827127 ) ) ( not ( = ?auto_827121 ?auto_827128 ) ) ( not ( = ?auto_827121 ?auto_827129 ) ) ( not ( = ?auto_827121 ?auto_827130 ) ) ( not ( = ?auto_827121 ?auto_827131 ) ) ( not ( = ?auto_827121 ?auto_827132 ) ) ( not ( = ?auto_827121 ?auto_827133 ) ) ( not ( = ?auto_827121 ?auto_827134 ) ) ( not ( = ?auto_827121 ?auto_827135 ) ) ( not ( = ?auto_827121 ?auto_827136 ) ) ( not ( = ?auto_827121 ?auto_827137 ) ) ( not ( = ?auto_827121 ?auto_827138 ) ) ( not ( = ?auto_827122 ?auto_827123 ) ) ( not ( = ?auto_827122 ?auto_827124 ) ) ( not ( = ?auto_827122 ?auto_827125 ) ) ( not ( = ?auto_827122 ?auto_827126 ) ) ( not ( = ?auto_827122 ?auto_827127 ) ) ( not ( = ?auto_827122 ?auto_827128 ) ) ( not ( = ?auto_827122 ?auto_827129 ) ) ( not ( = ?auto_827122 ?auto_827130 ) ) ( not ( = ?auto_827122 ?auto_827131 ) ) ( not ( = ?auto_827122 ?auto_827132 ) ) ( not ( = ?auto_827122 ?auto_827133 ) ) ( not ( = ?auto_827122 ?auto_827134 ) ) ( not ( = ?auto_827122 ?auto_827135 ) ) ( not ( = ?auto_827122 ?auto_827136 ) ) ( not ( = ?auto_827122 ?auto_827137 ) ) ( not ( = ?auto_827122 ?auto_827138 ) ) ( not ( = ?auto_827123 ?auto_827124 ) ) ( not ( = ?auto_827123 ?auto_827125 ) ) ( not ( = ?auto_827123 ?auto_827126 ) ) ( not ( = ?auto_827123 ?auto_827127 ) ) ( not ( = ?auto_827123 ?auto_827128 ) ) ( not ( = ?auto_827123 ?auto_827129 ) ) ( not ( = ?auto_827123 ?auto_827130 ) ) ( not ( = ?auto_827123 ?auto_827131 ) ) ( not ( = ?auto_827123 ?auto_827132 ) ) ( not ( = ?auto_827123 ?auto_827133 ) ) ( not ( = ?auto_827123 ?auto_827134 ) ) ( not ( = ?auto_827123 ?auto_827135 ) ) ( not ( = ?auto_827123 ?auto_827136 ) ) ( not ( = ?auto_827123 ?auto_827137 ) ) ( not ( = ?auto_827123 ?auto_827138 ) ) ( not ( = ?auto_827124 ?auto_827125 ) ) ( not ( = ?auto_827124 ?auto_827126 ) ) ( not ( = ?auto_827124 ?auto_827127 ) ) ( not ( = ?auto_827124 ?auto_827128 ) ) ( not ( = ?auto_827124 ?auto_827129 ) ) ( not ( = ?auto_827124 ?auto_827130 ) ) ( not ( = ?auto_827124 ?auto_827131 ) ) ( not ( = ?auto_827124 ?auto_827132 ) ) ( not ( = ?auto_827124 ?auto_827133 ) ) ( not ( = ?auto_827124 ?auto_827134 ) ) ( not ( = ?auto_827124 ?auto_827135 ) ) ( not ( = ?auto_827124 ?auto_827136 ) ) ( not ( = ?auto_827124 ?auto_827137 ) ) ( not ( = ?auto_827124 ?auto_827138 ) ) ( not ( = ?auto_827125 ?auto_827126 ) ) ( not ( = ?auto_827125 ?auto_827127 ) ) ( not ( = ?auto_827125 ?auto_827128 ) ) ( not ( = ?auto_827125 ?auto_827129 ) ) ( not ( = ?auto_827125 ?auto_827130 ) ) ( not ( = ?auto_827125 ?auto_827131 ) ) ( not ( = ?auto_827125 ?auto_827132 ) ) ( not ( = ?auto_827125 ?auto_827133 ) ) ( not ( = ?auto_827125 ?auto_827134 ) ) ( not ( = ?auto_827125 ?auto_827135 ) ) ( not ( = ?auto_827125 ?auto_827136 ) ) ( not ( = ?auto_827125 ?auto_827137 ) ) ( not ( = ?auto_827125 ?auto_827138 ) ) ( not ( = ?auto_827126 ?auto_827127 ) ) ( not ( = ?auto_827126 ?auto_827128 ) ) ( not ( = ?auto_827126 ?auto_827129 ) ) ( not ( = ?auto_827126 ?auto_827130 ) ) ( not ( = ?auto_827126 ?auto_827131 ) ) ( not ( = ?auto_827126 ?auto_827132 ) ) ( not ( = ?auto_827126 ?auto_827133 ) ) ( not ( = ?auto_827126 ?auto_827134 ) ) ( not ( = ?auto_827126 ?auto_827135 ) ) ( not ( = ?auto_827126 ?auto_827136 ) ) ( not ( = ?auto_827126 ?auto_827137 ) ) ( not ( = ?auto_827126 ?auto_827138 ) ) ( not ( = ?auto_827127 ?auto_827128 ) ) ( not ( = ?auto_827127 ?auto_827129 ) ) ( not ( = ?auto_827127 ?auto_827130 ) ) ( not ( = ?auto_827127 ?auto_827131 ) ) ( not ( = ?auto_827127 ?auto_827132 ) ) ( not ( = ?auto_827127 ?auto_827133 ) ) ( not ( = ?auto_827127 ?auto_827134 ) ) ( not ( = ?auto_827127 ?auto_827135 ) ) ( not ( = ?auto_827127 ?auto_827136 ) ) ( not ( = ?auto_827127 ?auto_827137 ) ) ( not ( = ?auto_827127 ?auto_827138 ) ) ( not ( = ?auto_827128 ?auto_827129 ) ) ( not ( = ?auto_827128 ?auto_827130 ) ) ( not ( = ?auto_827128 ?auto_827131 ) ) ( not ( = ?auto_827128 ?auto_827132 ) ) ( not ( = ?auto_827128 ?auto_827133 ) ) ( not ( = ?auto_827128 ?auto_827134 ) ) ( not ( = ?auto_827128 ?auto_827135 ) ) ( not ( = ?auto_827128 ?auto_827136 ) ) ( not ( = ?auto_827128 ?auto_827137 ) ) ( not ( = ?auto_827128 ?auto_827138 ) ) ( not ( = ?auto_827129 ?auto_827130 ) ) ( not ( = ?auto_827129 ?auto_827131 ) ) ( not ( = ?auto_827129 ?auto_827132 ) ) ( not ( = ?auto_827129 ?auto_827133 ) ) ( not ( = ?auto_827129 ?auto_827134 ) ) ( not ( = ?auto_827129 ?auto_827135 ) ) ( not ( = ?auto_827129 ?auto_827136 ) ) ( not ( = ?auto_827129 ?auto_827137 ) ) ( not ( = ?auto_827129 ?auto_827138 ) ) ( not ( = ?auto_827130 ?auto_827131 ) ) ( not ( = ?auto_827130 ?auto_827132 ) ) ( not ( = ?auto_827130 ?auto_827133 ) ) ( not ( = ?auto_827130 ?auto_827134 ) ) ( not ( = ?auto_827130 ?auto_827135 ) ) ( not ( = ?auto_827130 ?auto_827136 ) ) ( not ( = ?auto_827130 ?auto_827137 ) ) ( not ( = ?auto_827130 ?auto_827138 ) ) ( not ( = ?auto_827131 ?auto_827132 ) ) ( not ( = ?auto_827131 ?auto_827133 ) ) ( not ( = ?auto_827131 ?auto_827134 ) ) ( not ( = ?auto_827131 ?auto_827135 ) ) ( not ( = ?auto_827131 ?auto_827136 ) ) ( not ( = ?auto_827131 ?auto_827137 ) ) ( not ( = ?auto_827131 ?auto_827138 ) ) ( not ( = ?auto_827132 ?auto_827133 ) ) ( not ( = ?auto_827132 ?auto_827134 ) ) ( not ( = ?auto_827132 ?auto_827135 ) ) ( not ( = ?auto_827132 ?auto_827136 ) ) ( not ( = ?auto_827132 ?auto_827137 ) ) ( not ( = ?auto_827132 ?auto_827138 ) ) ( not ( = ?auto_827133 ?auto_827134 ) ) ( not ( = ?auto_827133 ?auto_827135 ) ) ( not ( = ?auto_827133 ?auto_827136 ) ) ( not ( = ?auto_827133 ?auto_827137 ) ) ( not ( = ?auto_827133 ?auto_827138 ) ) ( not ( = ?auto_827134 ?auto_827135 ) ) ( not ( = ?auto_827134 ?auto_827136 ) ) ( not ( = ?auto_827134 ?auto_827137 ) ) ( not ( = ?auto_827134 ?auto_827138 ) ) ( not ( = ?auto_827135 ?auto_827136 ) ) ( not ( = ?auto_827135 ?auto_827137 ) ) ( not ( = ?auto_827135 ?auto_827138 ) ) ( not ( = ?auto_827136 ?auto_827137 ) ) ( not ( = ?auto_827136 ?auto_827138 ) ) ( not ( = ?auto_827137 ?auto_827138 ) ) ( ON ?auto_827136 ?auto_827137 ) ( ON ?auto_827135 ?auto_827136 ) ( ON ?auto_827134 ?auto_827135 ) ( ON ?auto_827133 ?auto_827134 ) ( ON ?auto_827132 ?auto_827133 ) ( ON ?auto_827131 ?auto_827132 ) ( ON ?auto_827130 ?auto_827131 ) ( ON ?auto_827129 ?auto_827130 ) ( ON ?auto_827128 ?auto_827129 ) ( ON ?auto_827127 ?auto_827128 ) ( CLEAR ?auto_827125 ) ( ON ?auto_827126 ?auto_827127 ) ( CLEAR ?auto_827126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_827120 ?auto_827121 ?auto_827122 ?auto_827123 ?auto_827124 ?auto_827125 ?auto_827126 )
      ( MAKE-18PILE ?auto_827120 ?auto_827121 ?auto_827122 ?auto_827123 ?auto_827124 ?auto_827125 ?auto_827126 ?auto_827127 ?auto_827128 ?auto_827129 ?auto_827130 ?auto_827131 ?auto_827132 ?auto_827133 ?auto_827134 ?auto_827135 ?auto_827136 ?auto_827137 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827157 - BLOCK
      ?auto_827158 - BLOCK
      ?auto_827159 - BLOCK
      ?auto_827160 - BLOCK
      ?auto_827161 - BLOCK
      ?auto_827162 - BLOCK
      ?auto_827163 - BLOCK
      ?auto_827164 - BLOCK
      ?auto_827165 - BLOCK
      ?auto_827166 - BLOCK
      ?auto_827167 - BLOCK
      ?auto_827168 - BLOCK
      ?auto_827169 - BLOCK
      ?auto_827170 - BLOCK
      ?auto_827171 - BLOCK
      ?auto_827172 - BLOCK
      ?auto_827173 - BLOCK
      ?auto_827174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_827174 ) ( ON-TABLE ?auto_827157 ) ( ON ?auto_827158 ?auto_827157 ) ( ON ?auto_827159 ?auto_827158 ) ( ON ?auto_827160 ?auto_827159 ) ( ON ?auto_827161 ?auto_827160 ) ( ON ?auto_827162 ?auto_827161 ) ( not ( = ?auto_827157 ?auto_827158 ) ) ( not ( = ?auto_827157 ?auto_827159 ) ) ( not ( = ?auto_827157 ?auto_827160 ) ) ( not ( = ?auto_827157 ?auto_827161 ) ) ( not ( = ?auto_827157 ?auto_827162 ) ) ( not ( = ?auto_827157 ?auto_827163 ) ) ( not ( = ?auto_827157 ?auto_827164 ) ) ( not ( = ?auto_827157 ?auto_827165 ) ) ( not ( = ?auto_827157 ?auto_827166 ) ) ( not ( = ?auto_827157 ?auto_827167 ) ) ( not ( = ?auto_827157 ?auto_827168 ) ) ( not ( = ?auto_827157 ?auto_827169 ) ) ( not ( = ?auto_827157 ?auto_827170 ) ) ( not ( = ?auto_827157 ?auto_827171 ) ) ( not ( = ?auto_827157 ?auto_827172 ) ) ( not ( = ?auto_827157 ?auto_827173 ) ) ( not ( = ?auto_827157 ?auto_827174 ) ) ( not ( = ?auto_827158 ?auto_827159 ) ) ( not ( = ?auto_827158 ?auto_827160 ) ) ( not ( = ?auto_827158 ?auto_827161 ) ) ( not ( = ?auto_827158 ?auto_827162 ) ) ( not ( = ?auto_827158 ?auto_827163 ) ) ( not ( = ?auto_827158 ?auto_827164 ) ) ( not ( = ?auto_827158 ?auto_827165 ) ) ( not ( = ?auto_827158 ?auto_827166 ) ) ( not ( = ?auto_827158 ?auto_827167 ) ) ( not ( = ?auto_827158 ?auto_827168 ) ) ( not ( = ?auto_827158 ?auto_827169 ) ) ( not ( = ?auto_827158 ?auto_827170 ) ) ( not ( = ?auto_827158 ?auto_827171 ) ) ( not ( = ?auto_827158 ?auto_827172 ) ) ( not ( = ?auto_827158 ?auto_827173 ) ) ( not ( = ?auto_827158 ?auto_827174 ) ) ( not ( = ?auto_827159 ?auto_827160 ) ) ( not ( = ?auto_827159 ?auto_827161 ) ) ( not ( = ?auto_827159 ?auto_827162 ) ) ( not ( = ?auto_827159 ?auto_827163 ) ) ( not ( = ?auto_827159 ?auto_827164 ) ) ( not ( = ?auto_827159 ?auto_827165 ) ) ( not ( = ?auto_827159 ?auto_827166 ) ) ( not ( = ?auto_827159 ?auto_827167 ) ) ( not ( = ?auto_827159 ?auto_827168 ) ) ( not ( = ?auto_827159 ?auto_827169 ) ) ( not ( = ?auto_827159 ?auto_827170 ) ) ( not ( = ?auto_827159 ?auto_827171 ) ) ( not ( = ?auto_827159 ?auto_827172 ) ) ( not ( = ?auto_827159 ?auto_827173 ) ) ( not ( = ?auto_827159 ?auto_827174 ) ) ( not ( = ?auto_827160 ?auto_827161 ) ) ( not ( = ?auto_827160 ?auto_827162 ) ) ( not ( = ?auto_827160 ?auto_827163 ) ) ( not ( = ?auto_827160 ?auto_827164 ) ) ( not ( = ?auto_827160 ?auto_827165 ) ) ( not ( = ?auto_827160 ?auto_827166 ) ) ( not ( = ?auto_827160 ?auto_827167 ) ) ( not ( = ?auto_827160 ?auto_827168 ) ) ( not ( = ?auto_827160 ?auto_827169 ) ) ( not ( = ?auto_827160 ?auto_827170 ) ) ( not ( = ?auto_827160 ?auto_827171 ) ) ( not ( = ?auto_827160 ?auto_827172 ) ) ( not ( = ?auto_827160 ?auto_827173 ) ) ( not ( = ?auto_827160 ?auto_827174 ) ) ( not ( = ?auto_827161 ?auto_827162 ) ) ( not ( = ?auto_827161 ?auto_827163 ) ) ( not ( = ?auto_827161 ?auto_827164 ) ) ( not ( = ?auto_827161 ?auto_827165 ) ) ( not ( = ?auto_827161 ?auto_827166 ) ) ( not ( = ?auto_827161 ?auto_827167 ) ) ( not ( = ?auto_827161 ?auto_827168 ) ) ( not ( = ?auto_827161 ?auto_827169 ) ) ( not ( = ?auto_827161 ?auto_827170 ) ) ( not ( = ?auto_827161 ?auto_827171 ) ) ( not ( = ?auto_827161 ?auto_827172 ) ) ( not ( = ?auto_827161 ?auto_827173 ) ) ( not ( = ?auto_827161 ?auto_827174 ) ) ( not ( = ?auto_827162 ?auto_827163 ) ) ( not ( = ?auto_827162 ?auto_827164 ) ) ( not ( = ?auto_827162 ?auto_827165 ) ) ( not ( = ?auto_827162 ?auto_827166 ) ) ( not ( = ?auto_827162 ?auto_827167 ) ) ( not ( = ?auto_827162 ?auto_827168 ) ) ( not ( = ?auto_827162 ?auto_827169 ) ) ( not ( = ?auto_827162 ?auto_827170 ) ) ( not ( = ?auto_827162 ?auto_827171 ) ) ( not ( = ?auto_827162 ?auto_827172 ) ) ( not ( = ?auto_827162 ?auto_827173 ) ) ( not ( = ?auto_827162 ?auto_827174 ) ) ( not ( = ?auto_827163 ?auto_827164 ) ) ( not ( = ?auto_827163 ?auto_827165 ) ) ( not ( = ?auto_827163 ?auto_827166 ) ) ( not ( = ?auto_827163 ?auto_827167 ) ) ( not ( = ?auto_827163 ?auto_827168 ) ) ( not ( = ?auto_827163 ?auto_827169 ) ) ( not ( = ?auto_827163 ?auto_827170 ) ) ( not ( = ?auto_827163 ?auto_827171 ) ) ( not ( = ?auto_827163 ?auto_827172 ) ) ( not ( = ?auto_827163 ?auto_827173 ) ) ( not ( = ?auto_827163 ?auto_827174 ) ) ( not ( = ?auto_827164 ?auto_827165 ) ) ( not ( = ?auto_827164 ?auto_827166 ) ) ( not ( = ?auto_827164 ?auto_827167 ) ) ( not ( = ?auto_827164 ?auto_827168 ) ) ( not ( = ?auto_827164 ?auto_827169 ) ) ( not ( = ?auto_827164 ?auto_827170 ) ) ( not ( = ?auto_827164 ?auto_827171 ) ) ( not ( = ?auto_827164 ?auto_827172 ) ) ( not ( = ?auto_827164 ?auto_827173 ) ) ( not ( = ?auto_827164 ?auto_827174 ) ) ( not ( = ?auto_827165 ?auto_827166 ) ) ( not ( = ?auto_827165 ?auto_827167 ) ) ( not ( = ?auto_827165 ?auto_827168 ) ) ( not ( = ?auto_827165 ?auto_827169 ) ) ( not ( = ?auto_827165 ?auto_827170 ) ) ( not ( = ?auto_827165 ?auto_827171 ) ) ( not ( = ?auto_827165 ?auto_827172 ) ) ( not ( = ?auto_827165 ?auto_827173 ) ) ( not ( = ?auto_827165 ?auto_827174 ) ) ( not ( = ?auto_827166 ?auto_827167 ) ) ( not ( = ?auto_827166 ?auto_827168 ) ) ( not ( = ?auto_827166 ?auto_827169 ) ) ( not ( = ?auto_827166 ?auto_827170 ) ) ( not ( = ?auto_827166 ?auto_827171 ) ) ( not ( = ?auto_827166 ?auto_827172 ) ) ( not ( = ?auto_827166 ?auto_827173 ) ) ( not ( = ?auto_827166 ?auto_827174 ) ) ( not ( = ?auto_827167 ?auto_827168 ) ) ( not ( = ?auto_827167 ?auto_827169 ) ) ( not ( = ?auto_827167 ?auto_827170 ) ) ( not ( = ?auto_827167 ?auto_827171 ) ) ( not ( = ?auto_827167 ?auto_827172 ) ) ( not ( = ?auto_827167 ?auto_827173 ) ) ( not ( = ?auto_827167 ?auto_827174 ) ) ( not ( = ?auto_827168 ?auto_827169 ) ) ( not ( = ?auto_827168 ?auto_827170 ) ) ( not ( = ?auto_827168 ?auto_827171 ) ) ( not ( = ?auto_827168 ?auto_827172 ) ) ( not ( = ?auto_827168 ?auto_827173 ) ) ( not ( = ?auto_827168 ?auto_827174 ) ) ( not ( = ?auto_827169 ?auto_827170 ) ) ( not ( = ?auto_827169 ?auto_827171 ) ) ( not ( = ?auto_827169 ?auto_827172 ) ) ( not ( = ?auto_827169 ?auto_827173 ) ) ( not ( = ?auto_827169 ?auto_827174 ) ) ( not ( = ?auto_827170 ?auto_827171 ) ) ( not ( = ?auto_827170 ?auto_827172 ) ) ( not ( = ?auto_827170 ?auto_827173 ) ) ( not ( = ?auto_827170 ?auto_827174 ) ) ( not ( = ?auto_827171 ?auto_827172 ) ) ( not ( = ?auto_827171 ?auto_827173 ) ) ( not ( = ?auto_827171 ?auto_827174 ) ) ( not ( = ?auto_827172 ?auto_827173 ) ) ( not ( = ?auto_827172 ?auto_827174 ) ) ( not ( = ?auto_827173 ?auto_827174 ) ) ( ON ?auto_827173 ?auto_827174 ) ( ON ?auto_827172 ?auto_827173 ) ( ON ?auto_827171 ?auto_827172 ) ( ON ?auto_827170 ?auto_827171 ) ( ON ?auto_827169 ?auto_827170 ) ( ON ?auto_827168 ?auto_827169 ) ( ON ?auto_827167 ?auto_827168 ) ( ON ?auto_827166 ?auto_827167 ) ( ON ?auto_827165 ?auto_827166 ) ( ON ?auto_827164 ?auto_827165 ) ( CLEAR ?auto_827162 ) ( ON ?auto_827163 ?auto_827164 ) ( CLEAR ?auto_827163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_827157 ?auto_827158 ?auto_827159 ?auto_827160 ?auto_827161 ?auto_827162 ?auto_827163 )
      ( MAKE-18PILE ?auto_827157 ?auto_827158 ?auto_827159 ?auto_827160 ?auto_827161 ?auto_827162 ?auto_827163 ?auto_827164 ?auto_827165 ?auto_827166 ?auto_827167 ?auto_827168 ?auto_827169 ?auto_827170 ?auto_827171 ?auto_827172 ?auto_827173 ?auto_827174 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827193 - BLOCK
      ?auto_827194 - BLOCK
      ?auto_827195 - BLOCK
      ?auto_827196 - BLOCK
      ?auto_827197 - BLOCK
      ?auto_827198 - BLOCK
      ?auto_827199 - BLOCK
      ?auto_827200 - BLOCK
      ?auto_827201 - BLOCK
      ?auto_827202 - BLOCK
      ?auto_827203 - BLOCK
      ?auto_827204 - BLOCK
      ?auto_827205 - BLOCK
      ?auto_827206 - BLOCK
      ?auto_827207 - BLOCK
      ?auto_827208 - BLOCK
      ?auto_827209 - BLOCK
      ?auto_827210 - BLOCK
    )
    :vars
    (
      ?auto_827211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827210 ?auto_827211 ) ( ON-TABLE ?auto_827193 ) ( ON ?auto_827194 ?auto_827193 ) ( ON ?auto_827195 ?auto_827194 ) ( ON ?auto_827196 ?auto_827195 ) ( ON ?auto_827197 ?auto_827196 ) ( not ( = ?auto_827193 ?auto_827194 ) ) ( not ( = ?auto_827193 ?auto_827195 ) ) ( not ( = ?auto_827193 ?auto_827196 ) ) ( not ( = ?auto_827193 ?auto_827197 ) ) ( not ( = ?auto_827193 ?auto_827198 ) ) ( not ( = ?auto_827193 ?auto_827199 ) ) ( not ( = ?auto_827193 ?auto_827200 ) ) ( not ( = ?auto_827193 ?auto_827201 ) ) ( not ( = ?auto_827193 ?auto_827202 ) ) ( not ( = ?auto_827193 ?auto_827203 ) ) ( not ( = ?auto_827193 ?auto_827204 ) ) ( not ( = ?auto_827193 ?auto_827205 ) ) ( not ( = ?auto_827193 ?auto_827206 ) ) ( not ( = ?auto_827193 ?auto_827207 ) ) ( not ( = ?auto_827193 ?auto_827208 ) ) ( not ( = ?auto_827193 ?auto_827209 ) ) ( not ( = ?auto_827193 ?auto_827210 ) ) ( not ( = ?auto_827193 ?auto_827211 ) ) ( not ( = ?auto_827194 ?auto_827195 ) ) ( not ( = ?auto_827194 ?auto_827196 ) ) ( not ( = ?auto_827194 ?auto_827197 ) ) ( not ( = ?auto_827194 ?auto_827198 ) ) ( not ( = ?auto_827194 ?auto_827199 ) ) ( not ( = ?auto_827194 ?auto_827200 ) ) ( not ( = ?auto_827194 ?auto_827201 ) ) ( not ( = ?auto_827194 ?auto_827202 ) ) ( not ( = ?auto_827194 ?auto_827203 ) ) ( not ( = ?auto_827194 ?auto_827204 ) ) ( not ( = ?auto_827194 ?auto_827205 ) ) ( not ( = ?auto_827194 ?auto_827206 ) ) ( not ( = ?auto_827194 ?auto_827207 ) ) ( not ( = ?auto_827194 ?auto_827208 ) ) ( not ( = ?auto_827194 ?auto_827209 ) ) ( not ( = ?auto_827194 ?auto_827210 ) ) ( not ( = ?auto_827194 ?auto_827211 ) ) ( not ( = ?auto_827195 ?auto_827196 ) ) ( not ( = ?auto_827195 ?auto_827197 ) ) ( not ( = ?auto_827195 ?auto_827198 ) ) ( not ( = ?auto_827195 ?auto_827199 ) ) ( not ( = ?auto_827195 ?auto_827200 ) ) ( not ( = ?auto_827195 ?auto_827201 ) ) ( not ( = ?auto_827195 ?auto_827202 ) ) ( not ( = ?auto_827195 ?auto_827203 ) ) ( not ( = ?auto_827195 ?auto_827204 ) ) ( not ( = ?auto_827195 ?auto_827205 ) ) ( not ( = ?auto_827195 ?auto_827206 ) ) ( not ( = ?auto_827195 ?auto_827207 ) ) ( not ( = ?auto_827195 ?auto_827208 ) ) ( not ( = ?auto_827195 ?auto_827209 ) ) ( not ( = ?auto_827195 ?auto_827210 ) ) ( not ( = ?auto_827195 ?auto_827211 ) ) ( not ( = ?auto_827196 ?auto_827197 ) ) ( not ( = ?auto_827196 ?auto_827198 ) ) ( not ( = ?auto_827196 ?auto_827199 ) ) ( not ( = ?auto_827196 ?auto_827200 ) ) ( not ( = ?auto_827196 ?auto_827201 ) ) ( not ( = ?auto_827196 ?auto_827202 ) ) ( not ( = ?auto_827196 ?auto_827203 ) ) ( not ( = ?auto_827196 ?auto_827204 ) ) ( not ( = ?auto_827196 ?auto_827205 ) ) ( not ( = ?auto_827196 ?auto_827206 ) ) ( not ( = ?auto_827196 ?auto_827207 ) ) ( not ( = ?auto_827196 ?auto_827208 ) ) ( not ( = ?auto_827196 ?auto_827209 ) ) ( not ( = ?auto_827196 ?auto_827210 ) ) ( not ( = ?auto_827196 ?auto_827211 ) ) ( not ( = ?auto_827197 ?auto_827198 ) ) ( not ( = ?auto_827197 ?auto_827199 ) ) ( not ( = ?auto_827197 ?auto_827200 ) ) ( not ( = ?auto_827197 ?auto_827201 ) ) ( not ( = ?auto_827197 ?auto_827202 ) ) ( not ( = ?auto_827197 ?auto_827203 ) ) ( not ( = ?auto_827197 ?auto_827204 ) ) ( not ( = ?auto_827197 ?auto_827205 ) ) ( not ( = ?auto_827197 ?auto_827206 ) ) ( not ( = ?auto_827197 ?auto_827207 ) ) ( not ( = ?auto_827197 ?auto_827208 ) ) ( not ( = ?auto_827197 ?auto_827209 ) ) ( not ( = ?auto_827197 ?auto_827210 ) ) ( not ( = ?auto_827197 ?auto_827211 ) ) ( not ( = ?auto_827198 ?auto_827199 ) ) ( not ( = ?auto_827198 ?auto_827200 ) ) ( not ( = ?auto_827198 ?auto_827201 ) ) ( not ( = ?auto_827198 ?auto_827202 ) ) ( not ( = ?auto_827198 ?auto_827203 ) ) ( not ( = ?auto_827198 ?auto_827204 ) ) ( not ( = ?auto_827198 ?auto_827205 ) ) ( not ( = ?auto_827198 ?auto_827206 ) ) ( not ( = ?auto_827198 ?auto_827207 ) ) ( not ( = ?auto_827198 ?auto_827208 ) ) ( not ( = ?auto_827198 ?auto_827209 ) ) ( not ( = ?auto_827198 ?auto_827210 ) ) ( not ( = ?auto_827198 ?auto_827211 ) ) ( not ( = ?auto_827199 ?auto_827200 ) ) ( not ( = ?auto_827199 ?auto_827201 ) ) ( not ( = ?auto_827199 ?auto_827202 ) ) ( not ( = ?auto_827199 ?auto_827203 ) ) ( not ( = ?auto_827199 ?auto_827204 ) ) ( not ( = ?auto_827199 ?auto_827205 ) ) ( not ( = ?auto_827199 ?auto_827206 ) ) ( not ( = ?auto_827199 ?auto_827207 ) ) ( not ( = ?auto_827199 ?auto_827208 ) ) ( not ( = ?auto_827199 ?auto_827209 ) ) ( not ( = ?auto_827199 ?auto_827210 ) ) ( not ( = ?auto_827199 ?auto_827211 ) ) ( not ( = ?auto_827200 ?auto_827201 ) ) ( not ( = ?auto_827200 ?auto_827202 ) ) ( not ( = ?auto_827200 ?auto_827203 ) ) ( not ( = ?auto_827200 ?auto_827204 ) ) ( not ( = ?auto_827200 ?auto_827205 ) ) ( not ( = ?auto_827200 ?auto_827206 ) ) ( not ( = ?auto_827200 ?auto_827207 ) ) ( not ( = ?auto_827200 ?auto_827208 ) ) ( not ( = ?auto_827200 ?auto_827209 ) ) ( not ( = ?auto_827200 ?auto_827210 ) ) ( not ( = ?auto_827200 ?auto_827211 ) ) ( not ( = ?auto_827201 ?auto_827202 ) ) ( not ( = ?auto_827201 ?auto_827203 ) ) ( not ( = ?auto_827201 ?auto_827204 ) ) ( not ( = ?auto_827201 ?auto_827205 ) ) ( not ( = ?auto_827201 ?auto_827206 ) ) ( not ( = ?auto_827201 ?auto_827207 ) ) ( not ( = ?auto_827201 ?auto_827208 ) ) ( not ( = ?auto_827201 ?auto_827209 ) ) ( not ( = ?auto_827201 ?auto_827210 ) ) ( not ( = ?auto_827201 ?auto_827211 ) ) ( not ( = ?auto_827202 ?auto_827203 ) ) ( not ( = ?auto_827202 ?auto_827204 ) ) ( not ( = ?auto_827202 ?auto_827205 ) ) ( not ( = ?auto_827202 ?auto_827206 ) ) ( not ( = ?auto_827202 ?auto_827207 ) ) ( not ( = ?auto_827202 ?auto_827208 ) ) ( not ( = ?auto_827202 ?auto_827209 ) ) ( not ( = ?auto_827202 ?auto_827210 ) ) ( not ( = ?auto_827202 ?auto_827211 ) ) ( not ( = ?auto_827203 ?auto_827204 ) ) ( not ( = ?auto_827203 ?auto_827205 ) ) ( not ( = ?auto_827203 ?auto_827206 ) ) ( not ( = ?auto_827203 ?auto_827207 ) ) ( not ( = ?auto_827203 ?auto_827208 ) ) ( not ( = ?auto_827203 ?auto_827209 ) ) ( not ( = ?auto_827203 ?auto_827210 ) ) ( not ( = ?auto_827203 ?auto_827211 ) ) ( not ( = ?auto_827204 ?auto_827205 ) ) ( not ( = ?auto_827204 ?auto_827206 ) ) ( not ( = ?auto_827204 ?auto_827207 ) ) ( not ( = ?auto_827204 ?auto_827208 ) ) ( not ( = ?auto_827204 ?auto_827209 ) ) ( not ( = ?auto_827204 ?auto_827210 ) ) ( not ( = ?auto_827204 ?auto_827211 ) ) ( not ( = ?auto_827205 ?auto_827206 ) ) ( not ( = ?auto_827205 ?auto_827207 ) ) ( not ( = ?auto_827205 ?auto_827208 ) ) ( not ( = ?auto_827205 ?auto_827209 ) ) ( not ( = ?auto_827205 ?auto_827210 ) ) ( not ( = ?auto_827205 ?auto_827211 ) ) ( not ( = ?auto_827206 ?auto_827207 ) ) ( not ( = ?auto_827206 ?auto_827208 ) ) ( not ( = ?auto_827206 ?auto_827209 ) ) ( not ( = ?auto_827206 ?auto_827210 ) ) ( not ( = ?auto_827206 ?auto_827211 ) ) ( not ( = ?auto_827207 ?auto_827208 ) ) ( not ( = ?auto_827207 ?auto_827209 ) ) ( not ( = ?auto_827207 ?auto_827210 ) ) ( not ( = ?auto_827207 ?auto_827211 ) ) ( not ( = ?auto_827208 ?auto_827209 ) ) ( not ( = ?auto_827208 ?auto_827210 ) ) ( not ( = ?auto_827208 ?auto_827211 ) ) ( not ( = ?auto_827209 ?auto_827210 ) ) ( not ( = ?auto_827209 ?auto_827211 ) ) ( not ( = ?auto_827210 ?auto_827211 ) ) ( ON ?auto_827209 ?auto_827210 ) ( ON ?auto_827208 ?auto_827209 ) ( ON ?auto_827207 ?auto_827208 ) ( ON ?auto_827206 ?auto_827207 ) ( ON ?auto_827205 ?auto_827206 ) ( ON ?auto_827204 ?auto_827205 ) ( ON ?auto_827203 ?auto_827204 ) ( ON ?auto_827202 ?auto_827203 ) ( ON ?auto_827201 ?auto_827202 ) ( ON ?auto_827200 ?auto_827201 ) ( ON ?auto_827199 ?auto_827200 ) ( CLEAR ?auto_827197 ) ( ON ?auto_827198 ?auto_827199 ) ( CLEAR ?auto_827198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_827193 ?auto_827194 ?auto_827195 ?auto_827196 ?auto_827197 ?auto_827198 )
      ( MAKE-18PILE ?auto_827193 ?auto_827194 ?auto_827195 ?auto_827196 ?auto_827197 ?auto_827198 ?auto_827199 ?auto_827200 ?auto_827201 ?auto_827202 ?auto_827203 ?auto_827204 ?auto_827205 ?auto_827206 ?auto_827207 ?auto_827208 ?auto_827209 ?auto_827210 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827230 - BLOCK
      ?auto_827231 - BLOCK
      ?auto_827232 - BLOCK
      ?auto_827233 - BLOCK
      ?auto_827234 - BLOCK
      ?auto_827235 - BLOCK
      ?auto_827236 - BLOCK
      ?auto_827237 - BLOCK
      ?auto_827238 - BLOCK
      ?auto_827239 - BLOCK
      ?auto_827240 - BLOCK
      ?auto_827241 - BLOCK
      ?auto_827242 - BLOCK
      ?auto_827243 - BLOCK
      ?auto_827244 - BLOCK
      ?auto_827245 - BLOCK
      ?auto_827246 - BLOCK
      ?auto_827247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_827247 ) ( ON-TABLE ?auto_827230 ) ( ON ?auto_827231 ?auto_827230 ) ( ON ?auto_827232 ?auto_827231 ) ( ON ?auto_827233 ?auto_827232 ) ( ON ?auto_827234 ?auto_827233 ) ( not ( = ?auto_827230 ?auto_827231 ) ) ( not ( = ?auto_827230 ?auto_827232 ) ) ( not ( = ?auto_827230 ?auto_827233 ) ) ( not ( = ?auto_827230 ?auto_827234 ) ) ( not ( = ?auto_827230 ?auto_827235 ) ) ( not ( = ?auto_827230 ?auto_827236 ) ) ( not ( = ?auto_827230 ?auto_827237 ) ) ( not ( = ?auto_827230 ?auto_827238 ) ) ( not ( = ?auto_827230 ?auto_827239 ) ) ( not ( = ?auto_827230 ?auto_827240 ) ) ( not ( = ?auto_827230 ?auto_827241 ) ) ( not ( = ?auto_827230 ?auto_827242 ) ) ( not ( = ?auto_827230 ?auto_827243 ) ) ( not ( = ?auto_827230 ?auto_827244 ) ) ( not ( = ?auto_827230 ?auto_827245 ) ) ( not ( = ?auto_827230 ?auto_827246 ) ) ( not ( = ?auto_827230 ?auto_827247 ) ) ( not ( = ?auto_827231 ?auto_827232 ) ) ( not ( = ?auto_827231 ?auto_827233 ) ) ( not ( = ?auto_827231 ?auto_827234 ) ) ( not ( = ?auto_827231 ?auto_827235 ) ) ( not ( = ?auto_827231 ?auto_827236 ) ) ( not ( = ?auto_827231 ?auto_827237 ) ) ( not ( = ?auto_827231 ?auto_827238 ) ) ( not ( = ?auto_827231 ?auto_827239 ) ) ( not ( = ?auto_827231 ?auto_827240 ) ) ( not ( = ?auto_827231 ?auto_827241 ) ) ( not ( = ?auto_827231 ?auto_827242 ) ) ( not ( = ?auto_827231 ?auto_827243 ) ) ( not ( = ?auto_827231 ?auto_827244 ) ) ( not ( = ?auto_827231 ?auto_827245 ) ) ( not ( = ?auto_827231 ?auto_827246 ) ) ( not ( = ?auto_827231 ?auto_827247 ) ) ( not ( = ?auto_827232 ?auto_827233 ) ) ( not ( = ?auto_827232 ?auto_827234 ) ) ( not ( = ?auto_827232 ?auto_827235 ) ) ( not ( = ?auto_827232 ?auto_827236 ) ) ( not ( = ?auto_827232 ?auto_827237 ) ) ( not ( = ?auto_827232 ?auto_827238 ) ) ( not ( = ?auto_827232 ?auto_827239 ) ) ( not ( = ?auto_827232 ?auto_827240 ) ) ( not ( = ?auto_827232 ?auto_827241 ) ) ( not ( = ?auto_827232 ?auto_827242 ) ) ( not ( = ?auto_827232 ?auto_827243 ) ) ( not ( = ?auto_827232 ?auto_827244 ) ) ( not ( = ?auto_827232 ?auto_827245 ) ) ( not ( = ?auto_827232 ?auto_827246 ) ) ( not ( = ?auto_827232 ?auto_827247 ) ) ( not ( = ?auto_827233 ?auto_827234 ) ) ( not ( = ?auto_827233 ?auto_827235 ) ) ( not ( = ?auto_827233 ?auto_827236 ) ) ( not ( = ?auto_827233 ?auto_827237 ) ) ( not ( = ?auto_827233 ?auto_827238 ) ) ( not ( = ?auto_827233 ?auto_827239 ) ) ( not ( = ?auto_827233 ?auto_827240 ) ) ( not ( = ?auto_827233 ?auto_827241 ) ) ( not ( = ?auto_827233 ?auto_827242 ) ) ( not ( = ?auto_827233 ?auto_827243 ) ) ( not ( = ?auto_827233 ?auto_827244 ) ) ( not ( = ?auto_827233 ?auto_827245 ) ) ( not ( = ?auto_827233 ?auto_827246 ) ) ( not ( = ?auto_827233 ?auto_827247 ) ) ( not ( = ?auto_827234 ?auto_827235 ) ) ( not ( = ?auto_827234 ?auto_827236 ) ) ( not ( = ?auto_827234 ?auto_827237 ) ) ( not ( = ?auto_827234 ?auto_827238 ) ) ( not ( = ?auto_827234 ?auto_827239 ) ) ( not ( = ?auto_827234 ?auto_827240 ) ) ( not ( = ?auto_827234 ?auto_827241 ) ) ( not ( = ?auto_827234 ?auto_827242 ) ) ( not ( = ?auto_827234 ?auto_827243 ) ) ( not ( = ?auto_827234 ?auto_827244 ) ) ( not ( = ?auto_827234 ?auto_827245 ) ) ( not ( = ?auto_827234 ?auto_827246 ) ) ( not ( = ?auto_827234 ?auto_827247 ) ) ( not ( = ?auto_827235 ?auto_827236 ) ) ( not ( = ?auto_827235 ?auto_827237 ) ) ( not ( = ?auto_827235 ?auto_827238 ) ) ( not ( = ?auto_827235 ?auto_827239 ) ) ( not ( = ?auto_827235 ?auto_827240 ) ) ( not ( = ?auto_827235 ?auto_827241 ) ) ( not ( = ?auto_827235 ?auto_827242 ) ) ( not ( = ?auto_827235 ?auto_827243 ) ) ( not ( = ?auto_827235 ?auto_827244 ) ) ( not ( = ?auto_827235 ?auto_827245 ) ) ( not ( = ?auto_827235 ?auto_827246 ) ) ( not ( = ?auto_827235 ?auto_827247 ) ) ( not ( = ?auto_827236 ?auto_827237 ) ) ( not ( = ?auto_827236 ?auto_827238 ) ) ( not ( = ?auto_827236 ?auto_827239 ) ) ( not ( = ?auto_827236 ?auto_827240 ) ) ( not ( = ?auto_827236 ?auto_827241 ) ) ( not ( = ?auto_827236 ?auto_827242 ) ) ( not ( = ?auto_827236 ?auto_827243 ) ) ( not ( = ?auto_827236 ?auto_827244 ) ) ( not ( = ?auto_827236 ?auto_827245 ) ) ( not ( = ?auto_827236 ?auto_827246 ) ) ( not ( = ?auto_827236 ?auto_827247 ) ) ( not ( = ?auto_827237 ?auto_827238 ) ) ( not ( = ?auto_827237 ?auto_827239 ) ) ( not ( = ?auto_827237 ?auto_827240 ) ) ( not ( = ?auto_827237 ?auto_827241 ) ) ( not ( = ?auto_827237 ?auto_827242 ) ) ( not ( = ?auto_827237 ?auto_827243 ) ) ( not ( = ?auto_827237 ?auto_827244 ) ) ( not ( = ?auto_827237 ?auto_827245 ) ) ( not ( = ?auto_827237 ?auto_827246 ) ) ( not ( = ?auto_827237 ?auto_827247 ) ) ( not ( = ?auto_827238 ?auto_827239 ) ) ( not ( = ?auto_827238 ?auto_827240 ) ) ( not ( = ?auto_827238 ?auto_827241 ) ) ( not ( = ?auto_827238 ?auto_827242 ) ) ( not ( = ?auto_827238 ?auto_827243 ) ) ( not ( = ?auto_827238 ?auto_827244 ) ) ( not ( = ?auto_827238 ?auto_827245 ) ) ( not ( = ?auto_827238 ?auto_827246 ) ) ( not ( = ?auto_827238 ?auto_827247 ) ) ( not ( = ?auto_827239 ?auto_827240 ) ) ( not ( = ?auto_827239 ?auto_827241 ) ) ( not ( = ?auto_827239 ?auto_827242 ) ) ( not ( = ?auto_827239 ?auto_827243 ) ) ( not ( = ?auto_827239 ?auto_827244 ) ) ( not ( = ?auto_827239 ?auto_827245 ) ) ( not ( = ?auto_827239 ?auto_827246 ) ) ( not ( = ?auto_827239 ?auto_827247 ) ) ( not ( = ?auto_827240 ?auto_827241 ) ) ( not ( = ?auto_827240 ?auto_827242 ) ) ( not ( = ?auto_827240 ?auto_827243 ) ) ( not ( = ?auto_827240 ?auto_827244 ) ) ( not ( = ?auto_827240 ?auto_827245 ) ) ( not ( = ?auto_827240 ?auto_827246 ) ) ( not ( = ?auto_827240 ?auto_827247 ) ) ( not ( = ?auto_827241 ?auto_827242 ) ) ( not ( = ?auto_827241 ?auto_827243 ) ) ( not ( = ?auto_827241 ?auto_827244 ) ) ( not ( = ?auto_827241 ?auto_827245 ) ) ( not ( = ?auto_827241 ?auto_827246 ) ) ( not ( = ?auto_827241 ?auto_827247 ) ) ( not ( = ?auto_827242 ?auto_827243 ) ) ( not ( = ?auto_827242 ?auto_827244 ) ) ( not ( = ?auto_827242 ?auto_827245 ) ) ( not ( = ?auto_827242 ?auto_827246 ) ) ( not ( = ?auto_827242 ?auto_827247 ) ) ( not ( = ?auto_827243 ?auto_827244 ) ) ( not ( = ?auto_827243 ?auto_827245 ) ) ( not ( = ?auto_827243 ?auto_827246 ) ) ( not ( = ?auto_827243 ?auto_827247 ) ) ( not ( = ?auto_827244 ?auto_827245 ) ) ( not ( = ?auto_827244 ?auto_827246 ) ) ( not ( = ?auto_827244 ?auto_827247 ) ) ( not ( = ?auto_827245 ?auto_827246 ) ) ( not ( = ?auto_827245 ?auto_827247 ) ) ( not ( = ?auto_827246 ?auto_827247 ) ) ( ON ?auto_827246 ?auto_827247 ) ( ON ?auto_827245 ?auto_827246 ) ( ON ?auto_827244 ?auto_827245 ) ( ON ?auto_827243 ?auto_827244 ) ( ON ?auto_827242 ?auto_827243 ) ( ON ?auto_827241 ?auto_827242 ) ( ON ?auto_827240 ?auto_827241 ) ( ON ?auto_827239 ?auto_827240 ) ( ON ?auto_827238 ?auto_827239 ) ( ON ?auto_827237 ?auto_827238 ) ( ON ?auto_827236 ?auto_827237 ) ( CLEAR ?auto_827234 ) ( ON ?auto_827235 ?auto_827236 ) ( CLEAR ?auto_827235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_827230 ?auto_827231 ?auto_827232 ?auto_827233 ?auto_827234 ?auto_827235 )
      ( MAKE-18PILE ?auto_827230 ?auto_827231 ?auto_827232 ?auto_827233 ?auto_827234 ?auto_827235 ?auto_827236 ?auto_827237 ?auto_827238 ?auto_827239 ?auto_827240 ?auto_827241 ?auto_827242 ?auto_827243 ?auto_827244 ?auto_827245 ?auto_827246 ?auto_827247 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827266 - BLOCK
      ?auto_827267 - BLOCK
      ?auto_827268 - BLOCK
      ?auto_827269 - BLOCK
      ?auto_827270 - BLOCK
      ?auto_827271 - BLOCK
      ?auto_827272 - BLOCK
      ?auto_827273 - BLOCK
      ?auto_827274 - BLOCK
      ?auto_827275 - BLOCK
      ?auto_827276 - BLOCK
      ?auto_827277 - BLOCK
      ?auto_827278 - BLOCK
      ?auto_827279 - BLOCK
      ?auto_827280 - BLOCK
      ?auto_827281 - BLOCK
      ?auto_827282 - BLOCK
      ?auto_827283 - BLOCK
    )
    :vars
    (
      ?auto_827284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827283 ?auto_827284 ) ( ON-TABLE ?auto_827266 ) ( ON ?auto_827267 ?auto_827266 ) ( ON ?auto_827268 ?auto_827267 ) ( ON ?auto_827269 ?auto_827268 ) ( not ( = ?auto_827266 ?auto_827267 ) ) ( not ( = ?auto_827266 ?auto_827268 ) ) ( not ( = ?auto_827266 ?auto_827269 ) ) ( not ( = ?auto_827266 ?auto_827270 ) ) ( not ( = ?auto_827266 ?auto_827271 ) ) ( not ( = ?auto_827266 ?auto_827272 ) ) ( not ( = ?auto_827266 ?auto_827273 ) ) ( not ( = ?auto_827266 ?auto_827274 ) ) ( not ( = ?auto_827266 ?auto_827275 ) ) ( not ( = ?auto_827266 ?auto_827276 ) ) ( not ( = ?auto_827266 ?auto_827277 ) ) ( not ( = ?auto_827266 ?auto_827278 ) ) ( not ( = ?auto_827266 ?auto_827279 ) ) ( not ( = ?auto_827266 ?auto_827280 ) ) ( not ( = ?auto_827266 ?auto_827281 ) ) ( not ( = ?auto_827266 ?auto_827282 ) ) ( not ( = ?auto_827266 ?auto_827283 ) ) ( not ( = ?auto_827266 ?auto_827284 ) ) ( not ( = ?auto_827267 ?auto_827268 ) ) ( not ( = ?auto_827267 ?auto_827269 ) ) ( not ( = ?auto_827267 ?auto_827270 ) ) ( not ( = ?auto_827267 ?auto_827271 ) ) ( not ( = ?auto_827267 ?auto_827272 ) ) ( not ( = ?auto_827267 ?auto_827273 ) ) ( not ( = ?auto_827267 ?auto_827274 ) ) ( not ( = ?auto_827267 ?auto_827275 ) ) ( not ( = ?auto_827267 ?auto_827276 ) ) ( not ( = ?auto_827267 ?auto_827277 ) ) ( not ( = ?auto_827267 ?auto_827278 ) ) ( not ( = ?auto_827267 ?auto_827279 ) ) ( not ( = ?auto_827267 ?auto_827280 ) ) ( not ( = ?auto_827267 ?auto_827281 ) ) ( not ( = ?auto_827267 ?auto_827282 ) ) ( not ( = ?auto_827267 ?auto_827283 ) ) ( not ( = ?auto_827267 ?auto_827284 ) ) ( not ( = ?auto_827268 ?auto_827269 ) ) ( not ( = ?auto_827268 ?auto_827270 ) ) ( not ( = ?auto_827268 ?auto_827271 ) ) ( not ( = ?auto_827268 ?auto_827272 ) ) ( not ( = ?auto_827268 ?auto_827273 ) ) ( not ( = ?auto_827268 ?auto_827274 ) ) ( not ( = ?auto_827268 ?auto_827275 ) ) ( not ( = ?auto_827268 ?auto_827276 ) ) ( not ( = ?auto_827268 ?auto_827277 ) ) ( not ( = ?auto_827268 ?auto_827278 ) ) ( not ( = ?auto_827268 ?auto_827279 ) ) ( not ( = ?auto_827268 ?auto_827280 ) ) ( not ( = ?auto_827268 ?auto_827281 ) ) ( not ( = ?auto_827268 ?auto_827282 ) ) ( not ( = ?auto_827268 ?auto_827283 ) ) ( not ( = ?auto_827268 ?auto_827284 ) ) ( not ( = ?auto_827269 ?auto_827270 ) ) ( not ( = ?auto_827269 ?auto_827271 ) ) ( not ( = ?auto_827269 ?auto_827272 ) ) ( not ( = ?auto_827269 ?auto_827273 ) ) ( not ( = ?auto_827269 ?auto_827274 ) ) ( not ( = ?auto_827269 ?auto_827275 ) ) ( not ( = ?auto_827269 ?auto_827276 ) ) ( not ( = ?auto_827269 ?auto_827277 ) ) ( not ( = ?auto_827269 ?auto_827278 ) ) ( not ( = ?auto_827269 ?auto_827279 ) ) ( not ( = ?auto_827269 ?auto_827280 ) ) ( not ( = ?auto_827269 ?auto_827281 ) ) ( not ( = ?auto_827269 ?auto_827282 ) ) ( not ( = ?auto_827269 ?auto_827283 ) ) ( not ( = ?auto_827269 ?auto_827284 ) ) ( not ( = ?auto_827270 ?auto_827271 ) ) ( not ( = ?auto_827270 ?auto_827272 ) ) ( not ( = ?auto_827270 ?auto_827273 ) ) ( not ( = ?auto_827270 ?auto_827274 ) ) ( not ( = ?auto_827270 ?auto_827275 ) ) ( not ( = ?auto_827270 ?auto_827276 ) ) ( not ( = ?auto_827270 ?auto_827277 ) ) ( not ( = ?auto_827270 ?auto_827278 ) ) ( not ( = ?auto_827270 ?auto_827279 ) ) ( not ( = ?auto_827270 ?auto_827280 ) ) ( not ( = ?auto_827270 ?auto_827281 ) ) ( not ( = ?auto_827270 ?auto_827282 ) ) ( not ( = ?auto_827270 ?auto_827283 ) ) ( not ( = ?auto_827270 ?auto_827284 ) ) ( not ( = ?auto_827271 ?auto_827272 ) ) ( not ( = ?auto_827271 ?auto_827273 ) ) ( not ( = ?auto_827271 ?auto_827274 ) ) ( not ( = ?auto_827271 ?auto_827275 ) ) ( not ( = ?auto_827271 ?auto_827276 ) ) ( not ( = ?auto_827271 ?auto_827277 ) ) ( not ( = ?auto_827271 ?auto_827278 ) ) ( not ( = ?auto_827271 ?auto_827279 ) ) ( not ( = ?auto_827271 ?auto_827280 ) ) ( not ( = ?auto_827271 ?auto_827281 ) ) ( not ( = ?auto_827271 ?auto_827282 ) ) ( not ( = ?auto_827271 ?auto_827283 ) ) ( not ( = ?auto_827271 ?auto_827284 ) ) ( not ( = ?auto_827272 ?auto_827273 ) ) ( not ( = ?auto_827272 ?auto_827274 ) ) ( not ( = ?auto_827272 ?auto_827275 ) ) ( not ( = ?auto_827272 ?auto_827276 ) ) ( not ( = ?auto_827272 ?auto_827277 ) ) ( not ( = ?auto_827272 ?auto_827278 ) ) ( not ( = ?auto_827272 ?auto_827279 ) ) ( not ( = ?auto_827272 ?auto_827280 ) ) ( not ( = ?auto_827272 ?auto_827281 ) ) ( not ( = ?auto_827272 ?auto_827282 ) ) ( not ( = ?auto_827272 ?auto_827283 ) ) ( not ( = ?auto_827272 ?auto_827284 ) ) ( not ( = ?auto_827273 ?auto_827274 ) ) ( not ( = ?auto_827273 ?auto_827275 ) ) ( not ( = ?auto_827273 ?auto_827276 ) ) ( not ( = ?auto_827273 ?auto_827277 ) ) ( not ( = ?auto_827273 ?auto_827278 ) ) ( not ( = ?auto_827273 ?auto_827279 ) ) ( not ( = ?auto_827273 ?auto_827280 ) ) ( not ( = ?auto_827273 ?auto_827281 ) ) ( not ( = ?auto_827273 ?auto_827282 ) ) ( not ( = ?auto_827273 ?auto_827283 ) ) ( not ( = ?auto_827273 ?auto_827284 ) ) ( not ( = ?auto_827274 ?auto_827275 ) ) ( not ( = ?auto_827274 ?auto_827276 ) ) ( not ( = ?auto_827274 ?auto_827277 ) ) ( not ( = ?auto_827274 ?auto_827278 ) ) ( not ( = ?auto_827274 ?auto_827279 ) ) ( not ( = ?auto_827274 ?auto_827280 ) ) ( not ( = ?auto_827274 ?auto_827281 ) ) ( not ( = ?auto_827274 ?auto_827282 ) ) ( not ( = ?auto_827274 ?auto_827283 ) ) ( not ( = ?auto_827274 ?auto_827284 ) ) ( not ( = ?auto_827275 ?auto_827276 ) ) ( not ( = ?auto_827275 ?auto_827277 ) ) ( not ( = ?auto_827275 ?auto_827278 ) ) ( not ( = ?auto_827275 ?auto_827279 ) ) ( not ( = ?auto_827275 ?auto_827280 ) ) ( not ( = ?auto_827275 ?auto_827281 ) ) ( not ( = ?auto_827275 ?auto_827282 ) ) ( not ( = ?auto_827275 ?auto_827283 ) ) ( not ( = ?auto_827275 ?auto_827284 ) ) ( not ( = ?auto_827276 ?auto_827277 ) ) ( not ( = ?auto_827276 ?auto_827278 ) ) ( not ( = ?auto_827276 ?auto_827279 ) ) ( not ( = ?auto_827276 ?auto_827280 ) ) ( not ( = ?auto_827276 ?auto_827281 ) ) ( not ( = ?auto_827276 ?auto_827282 ) ) ( not ( = ?auto_827276 ?auto_827283 ) ) ( not ( = ?auto_827276 ?auto_827284 ) ) ( not ( = ?auto_827277 ?auto_827278 ) ) ( not ( = ?auto_827277 ?auto_827279 ) ) ( not ( = ?auto_827277 ?auto_827280 ) ) ( not ( = ?auto_827277 ?auto_827281 ) ) ( not ( = ?auto_827277 ?auto_827282 ) ) ( not ( = ?auto_827277 ?auto_827283 ) ) ( not ( = ?auto_827277 ?auto_827284 ) ) ( not ( = ?auto_827278 ?auto_827279 ) ) ( not ( = ?auto_827278 ?auto_827280 ) ) ( not ( = ?auto_827278 ?auto_827281 ) ) ( not ( = ?auto_827278 ?auto_827282 ) ) ( not ( = ?auto_827278 ?auto_827283 ) ) ( not ( = ?auto_827278 ?auto_827284 ) ) ( not ( = ?auto_827279 ?auto_827280 ) ) ( not ( = ?auto_827279 ?auto_827281 ) ) ( not ( = ?auto_827279 ?auto_827282 ) ) ( not ( = ?auto_827279 ?auto_827283 ) ) ( not ( = ?auto_827279 ?auto_827284 ) ) ( not ( = ?auto_827280 ?auto_827281 ) ) ( not ( = ?auto_827280 ?auto_827282 ) ) ( not ( = ?auto_827280 ?auto_827283 ) ) ( not ( = ?auto_827280 ?auto_827284 ) ) ( not ( = ?auto_827281 ?auto_827282 ) ) ( not ( = ?auto_827281 ?auto_827283 ) ) ( not ( = ?auto_827281 ?auto_827284 ) ) ( not ( = ?auto_827282 ?auto_827283 ) ) ( not ( = ?auto_827282 ?auto_827284 ) ) ( not ( = ?auto_827283 ?auto_827284 ) ) ( ON ?auto_827282 ?auto_827283 ) ( ON ?auto_827281 ?auto_827282 ) ( ON ?auto_827280 ?auto_827281 ) ( ON ?auto_827279 ?auto_827280 ) ( ON ?auto_827278 ?auto_827279 ) ( ON ?auto_827277 ?auto_827278 ) ( ON ?auto_827276 ?auto_827277 ) ( ON ?auto_827275 ?auto_827276 ) ( ON ?auto_827274 ?auto_827275 ) ( ON ?auto_827273 ?auto_827274 ) ( ON ?auto_827272 ?auto_827273 ) ( ON ?auto_827271 ?auto_827272 ) ( CLEAR ?auto_827269 ) ( ON ?auto_827270 ?auto_827271 ) ( CLEAR ?auto_827270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_827266 ?auto_827267 ?auto_827268 ?auto_827269 ?auto_827270 )
      ( MAKE-18PILE ?auto_827266 ?auto_827267 ?auto_827268 ?auto_827269 ?auto_827270 ?auto_827271 ?auto_827272 ?auto_827273 ?auto_827274 ?auto_827275 ?auto_827276 ?auto_827277 ?auto_827278 ?auto_827279 ?auto_827280 ?auto_827281 ?auto_827282 ?auto_827283 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827303 - BLOCK
      ?auto_827304 - BLOCK
      ?auto_827305 - BLOCK
      ?auto_827306 - BLOCK
      ?auto_827307 - BLOCK
      ?auto_827308 - BLOCK
      ?auto_827309 - BLOCK
      ?auto_827310 - BLOCK
      ?auto_827311 - BLOCK
      ?auto_827312 - BLOCK
      ?auto_827313 - BLOCK
      ?auto_827314 - BLOCK
      ?auto_827315 - BLOCK
      ?auto_827316 - BLOCK
      ?auto_827317 - BLOCK
      ?auto_827318 - BLOCK
      ?auto_827319 - BLOCK
      ?auto_827320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_827320 ) ( ON-TABLE ?auto_827303 ) ( ON ?auto_827304 ?auto_827303 ) ( ON ?auto_827305 ?auto_827304 ) ( ON ?auto_827306 ?auto_827305 ) ( not ( = ?auto_827303 ?auto_827304 ) ) ( not ( = ?auto_827303 ?auto_827305 ) ) ( not ( = ?auto_827303 ?auto_827306 ) ) ( not ( = ?auto_827303 ?auto_827307 ) ) ( not ( = ?auto_827303 ?auto_827308 ) ) ( not ( = ?auto_827303 ?auto_827309 ) ) ( not ( = ?auto_827303 ?auto_827310 ) ) ( not ( = ?auto_827303 ?auto_827311 ) ) ( not ( = ?auto_827303 ?auto_827312 ) ) ( not ( = ?auto_827303 ?auto_827313 ) ) ( not ( = ?auto_827303 ?auto_827314 ) ) ( not ( = ?auto_827303 ?auto_827315 ) ) ( not ( = ?auto_827303 ?auto_827316 ) ) ( not ( = ?auto_827303 ?auto_827317 ) ) ( not ( = ?auto_827303 ?auto_827318 ) ) ( not ( = ?auto_827303 ?auto_827319 ) ) ( not ( = ?auto_827303 ?auto_827320 ) ) ( not ( = ?auto_827304 ?auto_827305 ) ) ( not ( = ?auto_827304 ?auto_827306 ) ) ( not ( = ?auto_827304 ?auto_827307 ) ) ( not ( = ?auto_827304 ?auto_827308 ) ) ( not ( = ?auto_827304 ?auto_827309 ) ) ( not ( = ?auto_827304 ?auto_827310 ) ) ( not ( = ?auto_827304 ?auto_827311 ) ) ( not ( = ?auto_827304 ?auto_827312 ) ) ( not ( = ?auto_827304 ?auto_827313 ) ) ( not ( = ?auto_827304 ?auto_827314 ) ) ( not ( = ?auto_827304 ?auto_827315 ) ) ( not ( = ?auto_827304 ?auto_827316 ) ) ( not ( = ?auto_827304 ?auto_827317 ) ) ( not ( = ?auto_827304 ?auto_827318 ) ) ( not ( = ?auto_827304 ?auto_827319 ) ) ( not ( = ?auto_827304 ?auto_827320 ) ) ( not ( = ?auto_827305 ?auto_827306 ) ) ( not ( = ?auto_827305 ?auto_827307 ) ) ( not ( = ?auto_827305 ?auto_827308 ) ) ( not ( = ?auto_827305 ?auto_827309 ) ) ( not ( = ?auto_827305 ?auto_827310 ) ) ( not ( = ?auto_827305 ?auto_827311 ) ) ( not ( = ?auto_827305 ?auto_827312 ) ) ( not ( = ?auto_827305 ?auto_827313 ) ) ( not ( = ?auto_827305 ?auto_827314 ) ) ( not ( = ?auto_827305 ?auto_827315 ) ) ( not ( = ?auto_827305 ?auto_827316 ) ) ( not ( = ?auto_827305 ?auto_827317 ) ) ( not ( = ?auto_827305 ?auto_827318 ) ) ( not ( = ?auto_827305 ?auto_827319 ) ) ( not ( = ?auto_827305 ?auto_827320 ) ) ( not ( = ?auto_827306 ?auto_827307 ) ) ( not ( = ?auto_827306 ?auto_827308 ) ) ( not ( = ?auto_827306 ?auto_827309 ) ) ( not ( = ?auto_827306 ?auto_827310 ) ) ( not ( = ?auto_827306 ?auto_827311 ) ) ( not ( = ?auto_827306 ?auto_827312 ) ) ( not ( = ?auto_827306 ?auto_827313 ) ) ( not ( = ?auto_827306 ?auto_827314 ) ) ( not ( = ?auto_827306 ?auto_827315 ) ) ( not ( = ?auto_827306 ?auto_827316 ) ) ( not ( = ?auto_827306 ?auto_827317 ) ) ( not ( = ?auto_827306 ?auto_827318 ) ) ( not ( = ?auto_827306 ?auto_827319 ) ) ( not ( = ?auto_827306 ?auto_827320 ) ) ( not ( = ?auto_827307 ?auto_827308 ) ) ( not ( = ?auto_827307 ?auto_827309 ) ) ( not ( = ?auto_827307 ?auto_827310 ) ) ( not ( = ?auto_827307 ?auto_827311 ) ) ( not ( = ?auto_827307 ?auto_827312 ) ) ( not ( = ?auto_827307 ?auto_827313 ) ) ( not ( = ?auto_827307 ?auto_827314 ) ) ( not ( = ?auto_827307 ?auto_827315 ) ) ( not ( = ?auto_827307 ?auto_827316 ) ) ( not ( = ?auto_827307 ?auto_827317 ) ) ( not ( = ?auto_827307 ?auto_827318 ) ) ( not ( = ?auto_827307 ?auto_827319 ) ) ( not ( = ?auto_827307 ?auto_827320 ) ) ( not ( = ?auto_827308 ?auto_827309 ) ) ( not ( = ?auto_827308 ?auto_827310 ) ) ( not ( = ?auto_827308 ?auto_827311 ) ) ( not ( = ?auto_827308 ?auto_827312 ) ) ( not ( = ?auto_827308 ?auto_827313 ) ) ( not ( = ?auto_827308 ?auto_827314 ) ) ( not ( = ?auto_827308 ?auto_827315 ) ) ( not ( = ?auto_827308 ?auto_827316 ) ) ( not ( = ?auto_827308 ?auto_827317 ) ) ( not ( = ?auto_827308 ?auto_827318 ) ) ( not ( = ?auto_827308 ?auto_827319 ) ) ( not ( = ?auto_827308 ?auto_827320 ) ) ( not ( = ?auto_827309 ?auto_827310 ) ) ( not ( = ?auto_827309 ?auto_827311 ) ) ( not ( = ?auto_827309 ?auto_827312 ) ) ( not ( = ?auto_827309 ?auto_827313 ) ) ( not ( = ?auto_827309 ?auto_827314 ) ) ( not ( = ?auto_827309 ?auto_827315 ) ) ( not ( = ?auto_827309 ?auto_827316 ) ) ( not ( = ?auto_827309 ?auto_827317 ) ) ( not ( = ?auto_827309 ?auto_827318 ) ) ( not ( = ?auto_827309 ?auto_827319 ) ) ( not ( = ?auto_827309 ?auto_827320 ) ) ( not ( = ?auto_827310 ?auto_827311 ) ) ( not ( = ?auto_827310 ?auto_827312 ) ) ( not ( = ?auto_827310 ?auto_827313 ) ) ( not ( = ?auto_827310 ?auto_827314 ) ) ( not ( = ?auto_827310 ?auto_827315 ) ) ( not ( = ?auto_827310 ?auto_827316 ) ) ( not ( = ?auto_827310 ?auto_827317 ) ) ( not ( = ?auto_827310 ?auto_827318 ) ) ( not ( = ?auto_827310 ?auto_827319 ) ) ( not ( = ?auto_827310 ?auto_827320 ) ) ( not ( = ?auto_827311 ?auto_827312 ) ) ( not ( = ?auto_827311 ?auto_827313 ) ) ( not ( = ?auto_827311 ?auto_827314 ) ) ( not ( = ?auto_827311 ?auto_827315 ) ) ( not ( = ?auto_827311 ?auto_827316 ) ) ( not ( = ?auto_827311 ?auto_827317 ) ) ( not ( = ?auto_827311 ?auto_827318 ) ) ( not ( = ?auto_827311 ?auto_827319 ) ) ( not ( = ?auto_827311 ?auto_827320 ) ) ( not ( = ?auto_827312 ?auto_827313 ) ) ( not ( = ?auto_827312 ?auto_827314 ) ) ( not ( = ?auto_827312 ?auto_827315 ) ) ( not ( = ?auto_827312 ?auto_827316 ) ) ( not ( = ?auto_827312 ?auto_827317 ) ) ( not ( = ?auto_827312 ?auto_827318 ) ) ( not ( = ?auto_827312 ?auto_827319 ) ) ( not ( = ?auto_827312 ?auto_827320 ) ) ( not ( = ?auto_827313 ?auto_827314 ) ) ( not ( = ?auto_827313 ?auto_827315 ) ) ( not ( = ?auto_827313 ?auto_827316 ) ) ( not ( = ?auto_827313 ?auto_827317 ) ) ( not ( = ?auto_827313 ?auto_827318 ) ) ( not ( = ?auto_827313 ?auto_827319 ) ) ( not ( = ?auto_827313 ?auto_827320 ) ) ( not ( = ?auto_827314 ?auto_827315 ) ) ( not ( = ?auto_827314 ?auto_827316 ) ) ( not ( = ?auto_827314 ?auto_827317 ) ) ( not ( = ?auto_827314 ?auto_827318 ) ) ( not ( = ?auto_827314 ?auto_827319 ) ) ( not ( = ?auto_827314 ?auto_827320 ) ) ( not ( = ?auto_827315 ?auto_827316 ) ) ( not ( = ?auto_827315 ?auto_827317 ) ) ( not ( = ?auto_827315 ?auto_827318 ) ) ( not ( = ?auto_827315 ?auto_827319 ) ) ( not ( = ?auto_827315 ?auto_827320 ) ) ( not ( = ?auto_827316 ?auto_827317 ) ) ( not ( = ?auto_827316 ?auto_827318 ) ) ( not ( = ?auto_827316 ?auto_827319 ) ) ( not ( = ?auto_827316 ?auto_827320 ) ) ( not ( = ?auto_827317 ?auto_827318 ) ) ( not ( = ?auto_827317 ?auto_827319 ) ) ( not ( = ?auto_827317 ?auto_827320 ) ) ( not ( = ?auto_827318 ?auto_827319 ) ) ( not ( = ?auto_827318 ?auto_827320 ) ) ( not ( = ?auto_827319 ?auto_827320 ) ) ( ON ?auto_827319 ?auto_827320 ) ( ON ?auto_827318 ?auto_827319 ) ( ON ?auto_827317 ?auto_827318 ) ( ON ?auto_827316 ?auto_827317 ) ( ON ?auto_827315 ?auto_827316 ) ( ON ?auto_827314 ?auto_827315 ) ( ON ?auto_827313 ?auto_827314 ) ( ON ?auto_827312 ?auto_827313 ) ( ON ?auto_827311 ?auto_827312 ) ( ON ?auto_827310 ?auto_827311 ) ( ON ?auto_827309 ?auto_827310 ) ( ON ?auto_827308 ?auto_827309 ) ( CLEAR ?auto_827306 ) ( ON ?auto_827307 ?auto_827308 ) ( CLEAR ?auto_827307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_827303 ?auto_827304 ?auto_827305 ?auto_827306 ?auto_827307 )
      ( MAKE-18PILE ?auto_827303 ?auto_827304 ?auto_827305 ?auto_827306 ?auto_827307 ?auto_827308 ?auto_827309 ?auto_827310 ?auto_827311 ?auto_827312 ?auto_827313 ?auto_827314 ?auto_827315 ?auto_827316 ?auto_827317 ?auto_827318 ?auto_827319 ?auto_827320 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827339 - BLOCK
      ?auto_827340 - BLOCK
      ?auto_827341 - BLOCK
      ?auto_827342 - BLOCK
      ?auto_827343 - BLOCK
      ?auto_827344 - BLOCK
      ?auto_827345 - BLOCK
      ?auto_827346 - BLOCK
      ?auto_827347 - BLOCK
      ?auto_827348 - BLOCK
      ?auto_827349 - BLOCK
      ?auto_827350 - BLOCK
      ?auto_827351 - BLOCK
      ?auto_827352 - BLOCK
      ?auto_827353 - BLOCK
      ?auto_827354 - BLOCK
      ?auto_827355 - BLOCK
      ?auto_827356 - BLOCK
    )
    :vars
    (
      ?auto_827357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827356 ?auto_827357 ) ( ON-TABLE ?auto_827339 ) ( ON ?auto_827340 ?auto_827339 ) ( ON ?auto_827341 ?auto_827340 ) ( not ( = ?auto_827339 ?auto_827340 ) ) ( not ( = ?auto_827339 ?auto_827341 ) ) ( not ( = ?auto_827339 ?auto_827342 ) ) ( not ( = ?auto_827339 ?auto_827343 ) ) ( not ( = ?auto_827339 ?auto_827344 ) ) ( not ( = ?auto_827339 ?auto_827345 ) ) ( not ( = ?auto_827339 ?auto_827346 ) ) ( not ( = ?auto_827339 ?auto_827347 ) ) ( not ( = ?auto_827339 ?auto_827348 ) ) ( not ( = ?auto_827339 ?auto_827349 ) ) ( not ( = ?auto_827339 ?auto_827350 ) ) ( not ( = ?auto_827339 ?auto_827351 ) ) ( not ( = ?auto_827339 ?auto_827352 ) ) ( not ( = ?auto_827339 ?auto_827353 ) ) ( not ( = ?auto_827339 ?auto_827354 ) ) ( not ( = ?auto_827339 ?auto_827355 ) ) ( not ( = ?auto_827339 ?auto_827356 ) ) ( not ( = ?auto_827339 ?auto_827357 ) ) ( not ( = ?auto_827340 ?auto_827341 ) ) ( not ( = ?auto_827340 ?auto_827342 ) ) ( not ( = ?auto_827340 ?auto_827343 ) ) ( not ( = ?auto_827340 ?auto_827344 ) ) ( not ( = ?auto_827340 ?auto_827345 ) ) ( not ( = ?auto_827340 ?auto_827346 ) ) ( not ( = ?auto_827340 ?auto_827347 ) ) ( not ( = ?auto_827340 ?auto_827348 ) ) ( not ( = ?auto_827340 ?auto_827349 ) ) ( not ( = ?auto_827340 ?auto_827350 ) ) ( not ( = ?auto_827340 ?auto_827351 ) ) ( not ( = ?auto_827340 ?auto_827352 ) ) ( not ( = ?auto_827340 ?auto_827353 ) ) ( not ( = ?auto_827340 ?auto_827354 ) ) ( not ( = ?auto_827340 ?auto_827355 ) ) ( not ( = ?auto_827340 ?auto_827356 ) ) ( not ( = ?auto_827340 ?auto_827357 ) ) ( not ( = ?auto_827341 ?auto_827342 ) ) ( not ( = ?auto_827341 ?auto_827343 ) ) ( not ( = ?auto_827341 ?auto_827344 ) ) ( not ( = ?auto_827341 ?auto_827345 ) ) ( not ( = ?auto_827341 ?auto_827346 ) ) ( not ( = ?auto_827341 ?auto_827347 ) ) ( not ( = ?auto_827341 ?auto_827348 ) ) ( not ( = ?auto_827341 ?auto_827349 ) ) ( not ( = ?auto_827341 ?auto_827350 ) ) ( not ( = ?auto_827341 ?auto_827351 ) ) ( not ( = ?auto_827341 ?auto_827352 ) ) ( not ( = ?auto_827341 ?auto_827353 ) ) ( not ( = ?auto_827341 ?auto_827354 ) ) ( not ( = ?auto_827341 ?auto_827355 ) ) ( not ( = ?auto_827341 ?auto_827356 ) ) ( not ( = ?auto_827341 ?auto_827357 ) ) ( not ( = ?auto_827342 ?auto_827343 ) ) ( not ( = ?auto_827342 ?auto_827344 ) ) ( not ( = ?auto_827342 ?auto_827345 ) ) ( not ( = ?auto_827342 ?auto_827346 ) ) ( not ( = ?auto_827342 ?auto_827347 ) ) ( not ( = ?auto_827342 ?auto_827348 ) ) ( not ( = ?auto_827342 ?auto_827349 ) ) ( not ( = ?auto_827342 ?auto_827350 ) ) ( not ( = ?auto_827342 ?auto_827351 ) ) ( not ( = ?auto_827342 ?auto_827352 ) ) ( not ( = ?auto_827342 ?auto_827353 ) ) ( not ( = ?auto_827342 ?auto_827354 ) ) ( not ( = ?auto_827342 ?auto_827355 ) ) ( not ( = ?auto_827342 ?auto_827356 ) ) ( not ( = ?auto_827342 ?auto_827357 ) ) ( not ( = ?auto_827343 ?auto_827344 ) ) ( not ( = ?auto_827343 ?auto_827345 ) ) ( not ( = ?auto_827343 ?auto_827346 ) ) ( not ( = ?auto_827343 ?auto_827347 ) ) ( not ( = ?auto_827343 ?auto_827348 ) ) ( not ( = ?auto_827343 ?auto_827349 ) ) ( not ( = ?auto_827343 ?auto_827350 ) ) ( not ( = ?auto_827343 ?auto_827351 ) ) ( not ( = ?auto_827343 ?auto_827352 ) ) ( not ( = ?auto_827343 ?auto_827353 ) ) ( not ( = ?auto_827343 ?auto_827354 ) ) ( not ( = ?auto_827343 ?auto_827355 ) ) ( not ( = ?auto_827343 ?auto_827356 ) ) ( not ( = ?auto_827343 ?auto_827357 ) ) ( not ( = ?auto_827344 ?auto_827345 ) ) ( not ( = ?auto_827344 ?auto_827346 ) ) ( not ( = ?auto_827344 ?auto_827347 ) ) ( not ( = ?auto_827344 ?auto_827348 ) ) ( not ( = ?auto_827344 ?auto_827349 ) ) ( not ( = ?auto_827344 ?auto_827350 ) ) ( not ( = ?auto_827344 ?auto_827351 ) ) ( not ( = ?auto_827344 ?auto_827352 ) ) ( not ( = ?auto_827344 ?auto_827353 ) ) ( not ( = ?auto_827344 ?auto_827354 ) ) ( not ( = ?auto_827344 ?auto_827355 ) ) ( not ( = ?auto_827344 ?auto_827356 ) ) ( not ( = ?auto_827344 ?auto_827357 ) ) ( not ( = ?auto_827345 ?auto_827346 ) ) ( not ( = ?auto_827345 ?auto_827347 ) ) ( not ( = ?auto_827345 ?auto_827348 ) ) ( not ( = ?auto_827345 ?auto_827349 ) ) ( not ( = ?auto_827345 ?auto_827350 ) ) ( not ( = ?auto_827345 ?auto_827351 ) ) ( not ( = ?auto_827345 ?auto_827352 ) ) ( not ( = ?auto_827345 ?auto_827353 ) ) ( not ( = ?auto_827345 ?auto_827354 ) ) ( not ( = ?auto_827345 ?auto_827355 ) ) ( not ( = ?auto_827345 ?auto_827356 ) ) ( not ( = ?auto_827345 ?auto_827357 ) ) ( not ( = ?auto_827346 ?auto_827347 ) ) ( not ( = ?auto_827346 ?auto_827348 ) ) ( not ( = ?auto_827346 ?auto_827349 ) ) ( not ( = ?auto_827346 ?auto_827350 ) ) ( not ( = ?auto_827346 ?auto_827351 ) ) ( not ( = ?auto_827346 ?auto_827352 ) ) ( not ( = ?auto_827346 ?auto_827353 ) ) ( not ( = ?auto_827346 ?auto_827354 ) ) ( not ( = ?auto_827346 ?auto_827355 ) ) ( not ( = ?auto_827346 ?auto_827356 ) ) ( not ( = ?auto_827346 ?auto_827357 ) ) ( not ( = ?auto_827347 ?auto_827348 ) ) ( not ( = ?auto_827347 ?auto_827349 ) ) ( not ( = ?auto_827347 ?auto_827350 ) ) ( not ( = ?auto_827347 ?auto_827351 ) ) ( not ( = ?auto_827347 ?auto_827352 ) ) ( not ( = ?auto_827347 ?auto_827353 ) ) ( not ( = ?auto_827347 ?auto_827354 ) ) ( not ( = ?auto_827347 ?auto_827355 ) ) ( not ( = ?auto_827347 ?auto_827356 ) ) ( not ( = ?auto_827347 ?auto_827357 ) ) ( not ( = ?auto_827348 ?auto_827349 ) ) ( not ( = ?auto_827348 ?auto_827350 ) ) ( not ( = ?auto_827348 ?auto_827351 ) ) ( not ( = ?auto_827348 ?auto_827352 ) ) ( not ( = ?auto_827348 ?auto_827353 ) ) ( not ( = ?auto_827348 ?auto_827354 ) ) ( not ( = ?auto_827348 ?auto_827355 ) ) ( not ( = ?auto_827348 ?auto_827356 ) ) ( not ( = ?auto_827348 ?auto_827357 ) ) ( not ( = ?auto_827349 ?auto_827350 ) ) ( not ( = ?auto_827349 ?auto_827351 ) ) ( not ( = ?auto_827349 ?auto_827352 ) ) ( not ( = ?auto_827349 ?auto_827353 ) ) ( not ( = ?auto_827349 ?auto_827354 ) ) ( not ( = ?auto_827349 ?auto_827355 ) ) ( not ( = ?auto_827349 ?auto_827356 ) ) ( not ( = ?auto_827349 ?auto_827357 ) ) ( not ( = ?auto_827350 ?auto_827351 ) ) ( not ( = ?auto_827350 ?auto_827352 ) ) ( not ( = ?auto_827350 ?auto_827353 ) ) ( not ( = ?auto_827350 ?auto_827354 ) ) ( not ( = ?auto_827350 ?auto_827355 ) ) ( not ( = ?auto_827350 ?auto_827356 ) ) ( not ( = ?auto_827350 ?auto_827357 ) ) ( not ( = ?auto_827351 ?auto_827352 ) ) ( not ( = ?auto_827351 ?auto_827353 ) ) ( not ( = ?auto_827351 ?auto_827354 ) ) ( not ( = ?auto_827351 ?auto_827355 ) ) ( not ( = ?auto_827351 ?auto_827356 ) ) ( not ( = ?auto_827351 ?auto_827357 ) ) ( not ( = ?auto_827352 ?auto_827353 ) ) ( not ( = ?auto_827352 ?auto_827354 ) ) ( not ( = ?auto_827352 ?auto_827355 ) ) ( not ( = ?auto_827352 ?auto_827356 ) ) ( not ( = ?auto_827352 ?auto_827357 ) ) ( not ( = ?auto_827353 ?auto_827354 ) ) ( not ( = ?auto_827353 ?auto_827355 ) ) ( not ( = ?auto_827353 ?auto_827356 ) ) ( not ( = ?auto_827353 ?auto_827357 ) ) ( not ( = ?auto_827354 ?auto_827355 ) ) ( not ( = ?auto_827354 ?auto_827356 ) ) ( not ( = ?auto_827354 ?auto_827357 ) ) ( not ( = ?auto_827355 ?auto_827356 ) ) ( not ( = ?auto_827355 ?auto_827357 ) ) ( not ( = ?auto_827356 ?auto_827357 ) ) ( ON ?auto_827355 ?auto_827356 ) ( ON ?auto_827354 ?auto_827355 ) ( ON ?auto_827353 ?auto_827354 ) ( ON ?auto_827352 ?auto_827353 ) ( ON ?auto_827351 ?auto_827352 ) ( ON ?auto_827350 ?auto_827351 ) ( ON ?auto_827349 ?auto_827350 ) ( ON ?auto_827348 ?auto_827349 ) ( ON ?auto_827347 ?auto_827348 ) ( ON ?auto_827346 ?auto_827347 ) ( ON ?auto_827345 ?auto_827346 ) ( ON ?auto_827344 ?auto_827345 ) ( ON ?auto_827343 ?auto_827344 ) ( CLEAR ?auto_827341 ) ( ON ?auto_827342 ?auto_827343 ) ( CLEAR ?auto_827342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_827339 ?auto_827340 ?auto_827341 ?auto_827342 )
      ( MAKE-18PILE ?auto_827339 ?auto_827340 ?auto_827341 ?auto_827342 ?auto_827343 ?auto_827344 ?auto_827345 ?auto_827346 ?auto_827347 ?auto_827348 ?auto_827349 ?auto_827350 ?auto_827351 ?auto_827352 ?auto_827353 ?auto_827354 ?auto_827355 ?auto_827356 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827376 - BLOCK
      ?auto_827377 - BLOCK
      ?auto_827378 - BLOCK
      ?auto_827379 - BLOCK
      ?auto_827380 - BLOCK
      ?auto_827381 - BLOCK
      ?auto_827382 - BLOCK
      ?auto_827383 - BLOCK
      ?auto_827384 - BLOCK
      ?auto_827385 - BLOCK
      ?auto_827386 - BLOCK
      ?auto_827387 - BLOCK
      ?auto_827388 - BLOCK
      ?auto_827389 - BLOCK
      ?auto_827390 - BLOCK
      ?auto_827391 - BLOCK
      ?auto_827392 - BLOCK
      ?auto_827393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_827393 ) ( ON-TABLE ?auto_827376 ) ( ON ?auto_827377 ?auto_827376 ) ( ON ?auto_827378 ?auto_827377 ) ( not ( = ?auto_827376 ?auto_827377 ) ) ( not ( = ?auto_827376 ?auto_827378 ) ) ( not ( = ?auto_827376 ?auto_827379 ) ) ( not ( = ?auto_827376 ?auto_827380 ) ) ( not ( = ?auto_827376 ?auto_827381 ) ) ( not ( = ?auto_827376 ?auto_827382 ) ) ( not ( = ?auto_827376 ?auto_827383 ) ) ( not ( = ?auto_827376 ?auto_827384 ) ) ( not ( = ?auto_827376 ?auto_827385 ) ) ( not ( = ?auto_827376 ?auto_827386 ) ) ( not ( = ?auto_827376 ?auto_827387 ) ) ( not ( = ?auto_827376 ?auto_827388 ) ) ( not ( = ?auto_827376 ?auto_827389 ) ) ( not ( = ?auto_827376 ?auto_827390 ) ) ( not ( = ?auto_827376 ?auto_827391 ) ) ( not ( = ?auto_827376 ?auto_827392 ) ) ( not ( = ?auto_827376 ?auto_827393 ) ) ( not ( = ?auto_827377 ?auto_827378 ) ) ( not ( = ?auto_827377 ?auto_827379 ) ) ( not ( = ?auto_827377 ?auto_827380 ) ) ( not ( = ?auto_827377 ?auto_827381 ) ) ( not ( = ?auto_827377 ?auto_827382 ) ) ( not ( = ?auto_827377 ?auto_827383 ) ) ( not ( = ?auto_827377 ?auto_827384 ) ) ( not ( = ?auto_827377 ?auto_827385 ) ) ( not ( = ?auto_827377 ?auto_827386 ) ) ( not ( = ?auto_827377 ?auto_827387 ) ) ( not ( = ?auto_827377 ?auto_827388 ) ) ( not ( = ?auto_827377 ?auto_827389 ) ) ( not ( = ?auto_827377 ?auto_827390 ) ) ( not ( = ?auto_827377 ?auto_827391 ) ) ( not ( = ?auto_827377 ?auto_827392 ) ) ( not ( = ?auto_827377 ?auto_827393 ) ) ( not ( = ?auto_827378 ?auto_827379 ) ) ( not ( = ?auto_827378 ?auto_827380 ) ) ( not ( = ?auto_827378 ?auto_827381 ) ) ( not ( = ?auto_827378 ?auto_827382 ) ) ( not ( = ?auto_827378 ?auto_827383 ) ) ( not ( = ?auto_827378 ?auto_827384 ) ) ( not ( = ?auto_827378 ?auto_827385 ) ) ( not ( = ?auto_827378 ?auto_827386 ) ) ( not ( = ?auto_827378 ?auto_827387 ) ) ( not ( = ?auto_827378 ?auto_827388 ) ) ( not ( = ?auto_827378 ?auto_827389 ) ) ( not ( = ?auto_827378 ?auto_827390 ) ) ( not ( = ?auto_827378 ?auto_827391 ) ) ( not ( = ?auto_827378 ?auto_827392 ) ) ( not ( = ?auto_827378 ?auto_827393 ) ) ( not ( = ?auto_827379 ?auto_827380 ) ) ( not ( = ?auto_827379 ?auto_827381 ) ) ( not ( = ?auto_827379 ?auto_827382 ) ) ( not ( = ?auto_827379 ?auto_827383 ) ) ( not ( = ?auto_827379 ?auto_827384 ) ) ( not ( = ?auto_827379 ?auto_827385 ) ) ( not ( = ?auto_827379 ?auto_827386 ) ) ( not ( = ?auto_827379 ?auto_827387 ) ) ( not ( = ?auto_827379 ?auto_827388 ) ) ( not ( = ?auto_827379 ?auto_827389 ) ) ( not ( = ?auto_827379 ?auto_827390 ) ) ( not ( = ?auto_827379 ?auto_827391 ) ) ( not ( = ?auto_827379 ?auto_827392 ) ) ( not ( = ?auto_827379 ?auto_827393 ) ) ( not ( = ?auto_827380 ?auto_827381 ) ) ( not ( = ?auto_827380 ?auto_827382 ) ) ( not ( = ?auto_827380 ?auto_827383 ) ) ( not ( = ?auto_827380 ?auto_827384 ) ) ( not ( = ?auto_827380 ?auto_827385 ) ) ( not ( = ?auto_827380 ?auto_827386 ) ) ( not ( = ?auto_827380 ?auto_827387 ) ) ( not ( = ?auto_827380 ?auto_827388 ) ) ( not ( = ?auto_827380 ?auto_827389 ) ) ( not ( = ?auto_827380 ?auto_827390 ) ) ( not ( = ?auto_827380 ?auto_827391 ) ) ( not ( = ?auto_827380 ?auto_827392 ) ) ( not ( = ?auto_827380 ?auto_827393 ) ) ( not ( = ?auto_827381 ?auto_827382 ) ) ( not ( = ?auto_827381 ?auto_827383 ) ) ( not ( = ?auto_827381 ?auto_827384 ) ) ( not ( = ?auto_827381 ?auto_827385 ) ) ( not ( = ?auto_827381 ?auto_827386 ) ) ( not ( = ?auto_827381 ?auto_827387 ) ) ( not ( = ?auto_827381 ?auto_827388 ) ) ( not ( = ?auto_827381 ?auto_827389 ) ) ( not ( = ?auto_827381 ?auto_827390 ) ) ( not ( = ?auto_827381 ?auto_827391 ) ) ( not ( = ?auto_827381 ?auto_827392 ) ) ( not ( = ?auto_827381 ?auto_827393 ) ) ( not ( = ?auto_827382 ?auto_827383 ) ) ( not ( = ?auto_827382 ?auto_827384 ) ) ( not ( = ?auto_827382 ?auto_827385 ) ) ( not ( = ?auto_827382 ?auto_827386 ) ) ( not ( = ?auto_827382 ?auto_827387 ) ) ( not ( = ?auto_827382 ?auto_827388 ) ) ( not ( = ?auto_827382 ?auto_827389 ) ) ( not ( = ?auto_827382 ?auto_827390 ) ) ( not ( = ?auto_827382 ?auto_827391 ) ) ( not ( = ?auto_827382 ?auto_827392 ) ) ( not ( = ?auto_827382 ?auto_827393 ) ) ( not ( = ?auto_827383 ?auto_827384 ) ) ( not ( = ?auto_827383 ?auto_827385 ) ) ( not ( = ?auto_827383 ?auto_827386 ) ) ( not ( = ?auto_827383 ?auto_827387 ) ) ( not ( = ?auto_827383 ?auto_827388 ) ) ( not ( = ?auto_827383 ?auto_827389 ) ) ( not ( = ?auto_827383 ?auto_827390 ) ) ( not ( = ?auto_827383 ?auto_827391 ) ) ( not ( = ?auto_827383 ?auto_827392 ) ) ( not ( = ?auto_827383 ?auto_827393 ) ) ( not ( = ?auto_827384 ?auto_827385 ) ) ( not ( = ?auto_827384 ?auto_827386 ) ) ( not ( = ?auto_827384 ?auto_827387 ) ) ( not ( = ?auto_827384 ?auto_827388 ) ) ( not ( = ?auto_827384 ?auto_827389 ) ) ( not ( = ?auto_827384 ?auto_827390 ) ) ( not ( = ?auto_827384 ?auto_827391 ) ) ( not ( = ?auto_827384 ?auto_827392 ) ) ( not ( = ?auto_827384 ?auto_827393 ) ) ( not ( = ?auto_827385 ?auto_827386 ) ) ( not ( = ?auto_827385 ?auto_827387 ) ) ( not ( = ?auto_827385 ?auto_827388 ) ) ( not ( = ?auto_827385 ?auto_827389 ) ) ( not ( = ?auto_827385 ?auto_827390 ) ) ( not ( = ?auto_827385 ?auto_827391 ) ) ( not ( = ?auto_827385 ?auto_827392 ) ) ( not ( = ?auto_827385 ?auto_827393 ) ) ( not ( = ?auto_827386 ?auto_827387 ) ) ( not ( = ?auto_827386 ?auto_827388 ) ) ( not ( = ?auto_827386 ?auto_827389 ) ) ( not ( = ?auto_827386 ?auto_827390 ) ) ( not ( = ?auto_827386 ?auto_827391 ) ) ( not ( = ?auto_827386 ?auto_827392 ) ) ( not ( = ?auto_827386 ?auto_827393 ) ) ( not ( = ?auto_827387 ?auto_827388 ) ) ( not ( = ?auto_827387 ?auto_827389 ) ) ( not ( = ?auto_827387 ?auto_827390 ) ) ( not ( = ?auto_827387 ?auto_827391 ) ) ( not ( = ?auto_827387 ?auto_827392 ) ) ( not ( = ?auto_827387 ?auto_827393 ) ) ( not ( = ?auto_827388 ?auto_827389 ) ) ( not ( = ?auto_827388 ?auto_827390 ) ) ( not ( = ?auto_827388 ?auto_827391 ) ) ( not ( = ?auto_827388 ?auto_827392 ) ) ( not ( = ?auto_827388 ?auto_827393 ) ) ( not ( = ?auto_827389 ?auto_827390 ) ) ( not ( = ?auto_827389 ?auto_827391 ) ) ( not ( = ?auto_827389 ?auto_827392 ) ) ( not ( = ?auto_827389 ?auto_827393 ) ) ( not ( = ?auto_827390 ?auto_827391 ) ) ( not ( = ?auto_827390 ?auto_827392 ) ) ( not ( = ?auto_827390 ?auto_827393 ) ) ( not ( = ?auto_827391 ?auto_827392 ) ) ( not ( = ?auto_827391 ?auto_827393 ) ) ( not ( = ?auto_827392 ?auto_827393 ) ) ( ON ?auto_827392 ?auto_827393 ) ( ON ?auto_827391 ?auto_827392 ) ( ON ?auto_827390 ?auto_827391 ) ( ON ?auto_827389 ?auto_827390 ) ( ON ?auto_827388 ?auto_827389 ) ( ON ?auto_827387 ?auto_827388 ) ( ON ?auto_827386 ?auto_827387 ) ( ON ?auto_827385 ?auto_827386 ) ( ON ?auto_827384 ?auto_827385 ) ( ON ?auto_827383 ?auto_827384 ) ( ON ?auto_827382 ?auto_827383 ) ( ON ?auto_827381 ?auto_827382 ) ( ON ?auto_827380 ?auto_827381 ) ( CLEAR ?auto_827378 ) ( ON ?auto_827379 ?auto_827380 ) ( CLEAR ?auto_827379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_827376 ?auto_827377 ?auto_827378 ?auto_827379 )
      ( MAKE-18PILE ?auto_827376 ?auto_827377 ?auto_827378 ?auto_827379 ?auto_827380 ?auto_827381 ?auto_827382 ?auto_827383 ?auto_827384 ?auto_827385 ?auto_827386 ?auto_827387 ?auto_827388 ?auto_827389 ?auto_827390 ?auto_827391 ?auto_827392 ?auto_827393 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827412 - BLOCK
      ?auto_827413 - BLOCK
      ?auto_827414 - BLOCK
      ?auto_827415 - BLOCK
      ?auto_827416 - BLOCK
      ?auto_827417 - BLOCK
      ?auto_827418 - BLOCK
      ?auto_827419 - BLOCK
      ?auto_827420 - BLOCK
      ?auto_827421 - BLOCK
      ?auto_827422 - BLOCK
      ?auto_827423 - BLOCK
      ?auto_827424 - BLOCK
      ?auto_827425 - BLOCK
      ?auto_827426 - BLOCK
      ?auto_827427 - BLOCK
      ?auto_827428 - BLOCK
      ?auto_827429 - BLOCK
    )
    :vars
    (
      ?auto_827430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827429 ?auto_827430 ) ( ON-TABLE ?auto_827412 ) ( ON ?auto_827413 ?auto_827412 ) ( not ( = ?auto_827412 ?auto_827413 ) ) ( not ( = ?auto_827412 ?auto_827414 ) ) ( not ( = ?auto_827412 ?auto_827415 ) ) ( not ( = ?auto_827412 ?auto_827416 ) ) ( not ( = ?auto_827412 ?auto_827417 ) ) ( not ( = ?auto_827412 ?auto_827418 ) ) ( not ( = ?auto_827412 ?auto_827419 ) ) ( not ( = ?auto_827412 ?auto_827420 ) ) ( not ( = ?auto_827412 ?auto_827421 ) ) ( not ( = ?auto_827412 ?auto_827422 ) ) ( not ( = ?auto_827412 ?auto_827423 ) ) ( not ( = ?auto_827412 ?auto_827424 ) ) ( not ( = ?auto_827412 ?auto_827425 ) ) ( not ( = ?auto_827412 ?auto_827426 ) ) ( not ( = ?auto_827412 ?auto_827427 ) ) ( not ( = ?auto_827412 ?auto_827428 ) ) ( not ( = ?auto_827412 ?auto_827429 ) ) ( not ( = ?auto_827412 ?auto_827430 ) ) ( not ( = ?auto_827413 ?auto_827414 ) ) ( not ( = ?auto_827413 ?auto_827415 ) ) ( not ( = ?auto_827413 ?auto_827416 ) ) ( not ( = ?auto_827413 ?auto_827417 ) ) ( not ( = ?auto_827413 ?auto_827418 ) ) ( not ( = ?auto_827413 ?auto_827419 ) ) ( not ( = ?auto_827413 ?auto_827420 ) ) ( not ( = ?auto_827413 ?auto_827421 ) ) ( not ( = ?auto_827413 ?auto_827422 ) ) ( not ( = ?auto_827413 ?auto_827423 ) ) ( not ( = ?auto_827413 ?auto_827424 ) ) ( not ( = ?auto_827413 ?auto_827425 ) ) ( not ( = ?auto_827413 ?auto_827426 ) ) ( not ( = ?auto_827413 ?auto_827427 ) ) ( not ( = ?auto_827413 ?auto_827428 ) ) ( not ( = ?auto_827413 ?auto_827429 ) ) ( not ( = ?auto_827413 ?auto_827430 ) ) ( not ( = ?auto_827414 ?auto_827415 ) ) ( not ( = ?auto_827414 ?auto_827416 ) ) ( not ( = ?auto_827414 ?auto_827417 ) ) ( not ( = ?auto_827414 ?auto_827418 ) ) ( not ( = ?auto_827414 ?auto_827419 ) ) ( not ( = ?auto_827414 ?auto_827420 ) ) ( not ( = ?auto_827414 ?auto_827421 ) ) ( not ( = ?auto_827414 ?auto_827422 ) ) ( not ( = ?auto_827414 ?auto_827423 ) ) ( not ( = ?auto_827414 ?auto_827424 ) ) ( not ( = ?auto_827414 ?auto_827425 ) ) ( not ( = ?auto_827414 ?auto_827426 ) ) ( not ( = ?auto_827414 ?auto_827427 ) ) ( not ( = ?auto_827414 ?auto_827428 ) ) ( not ( = ?auto_827414 ?auto_827429 ) ) ( not ( = ?auto_827414 ?auto_827430 ) ) ( not ( = ?auto_827415 ?auto_827416 ) ) ( not ( = ?auto_827415 ?auto_827417 ) ) ( not ( = ?auto_827415 ?auto_827418 ) ) ( not ( = ?auto_827415 ?auto_827419 ) ) ( not ( = ?auto_827415 ?auto_827420 ) ) ( not ( = ?auto_827415 ?auto_827421 ) ) ( not ( = ?auto_827415 ?auto_827422 ) ) ( not ( = ?auto_827415 ?auto_827423 ) ) ( not ( = ?auto_827415 ?auto_827424 ) ) ( not ( = ?auto_827415 ?auto_827425 ) ) ( not ( = ?auto_827415 ?auto_827426 ) ) ( not ( = ?auto_827415 ?auto_827427 ) ) ( not ( = ?auto_827415 ?auto_827428 ) ) ( not ( = ?auto_827415 ?auto_827429 ) ) ( not ( = ?auto_827415 ?auto_827430 ) ) ( not ( = ?auto_827416 ?auto_827417 ) ) ( not ( = ?auto_827416 ?auto_827418 ) ) ( not ( = ?auto_827416 ?auto_827419 ) ) ( not ( = ?auto_827416 ?auto_827420 ) ) ( not ( = ?auto_827416 ?auto_827421 ) ) ( not ( = ?auto_827416 ?auto_827422 ) ) ( not ( = ?auto_827416 ?auto_827423 ) ) ( not ( = ?auto_827416 ?auto_827424 ) ) ( not ( = ?auto_827416 ?auto_827425 ) ) ( not ( = ?auto_827416 ?auto_827426 ) ) ( not ( = ?auto_827416 ?auto_827427 ) ) ( not ( = ?auto_827416 ?auto_827428 ) ) ( not ( = ?auto_827416 ?auto_827429 ) ) ( not ( = ?auto_827416 ?auto_827430 ) ) ( not ( = ?auto_827417 ?auto_827418 ) ) ( not ( = ?auto_827417 ?auto_827419 ) ) ( not ( = ?auto_827417 ?auto_827420 ) ) ( not ( = ?auto_827417 ?auto_827421 ) ) ( not ( = ?auto_827417 ?auto_827422 ) ) ( not ( = ?auto_827417 ?auto_827423 ) ) ( not ( = ?auto_827417 ?auto_827424 ) ) ( not ( = ?auto_827417 ?auto_827425 ) ) ( not ( = ?auto_827417 ?auto_827426 ) ) ( not ( = ?auto_827417 ?auto_827427 ) ) ( not ( = ?auto_827417 ?auto_827428 ) ) ( not ( = ?auto_827417 ?auto_827429 ) ) ( not ( = ?auto_827417 ?auto_827430 ) ) ( not ( = ?auto_827418 ?auto_827419 ) ) ( not ( = ?auto_827418 ?auto_827420 ) ) ( not ( = ?auto_827418 ?auto_827421 ) ) ( not ( = ?auto_827418 ?auto_827422 ) ) ( not ( = ?auto_827418 ?auto_827423 ) ) ( not ( = ?auto_827418 ?auto_827424 ) ) ( not ( = ?auto_827418 ?auto_827425 ) ) ( not ( = ?auto_827418 ?auto_827426 ) ) ( not ( = ?auto_827418 ?auto_827427 ) ) ( not ( = ?auto_827418 ?auto_827428 ) ) ( not ( = ?auto_827418 ?auto_827429 ) ) ( not ( = ?auto_827418 ?auto_827430 ) ) ( not ( = ?auto_827419 ?auto_827420 ) ) ( not ( = ?auto_827419 ?auto_827421 ) ) ( not ( = ?auto_827419 ?auto_827422 ) ) ( not ( = ?auto_827419 ?auto_827423 ) ) ( not ( = ?auto_827419 ?auto_827424 ) ) ( not ( = ?auto_827419 ?auto_827425 ) ) ( not ( = ?auto_827419 ?auto_827426 ) ) ( not ( = ?auto_827419 ?auto_827427 ) ) ( not ( = ?auto_827419 ?auto_827428 ) ) ( not ( = ?auto_827419 ?auto_827429 ) ) ( not ( = ?auto_827419 ?auto_827430 ) ) ( not ( = ?auto_827420 ?auto_827421 ) ) ( not ( = ?auto_827420 ?auto_827422 ) ) ( not ( = ?auto_827420 ?auto_827423 ) ) ( not ( = ?auto_827420 ?auto_827424 ) ) ( not ( = ?auto_827420 ?auto_827425 ) ) ( not ( = ?auto_827420 ?auto_827426 ) ) ( not ( = ?auto_827420 ?auto_827427 ) ) ( not ( = ?auto_827420 ?auto_827428 ) ) ( not ( = ?auto_827420 ?auto_827429 ) ) ( not ( = ?auto_827420 ?auto_827430 ) ) ( not ( = ?auto_827421 ?auto_827422 ) ) ( not ( = ?auto_827421 ?auto_827423 ) ) ( not ( = ?auto_827421 ?auto_827424 ) ) ( not ( = ?auto_827421 ?auto_827425 ) ) ( not ( = ?auto_827421 ?auto_827426 ) ) ( not ( = ?auto_827421 ?auto_827427 ) ) ( not ( = ?auto_827421 ?auto_827428 ) ) ( not ( = ?auto_827421 ?auto_827429 ) ) ( not ( = ?auto_827421 ?auto_827430 ) ) ( not ( = ?auto_827422 ?auto_827423 ) ) ( not ( = ?auto_827422 ?auto_827424 ) ) ( not ( = ?auto_827422 ?auto_827425 ) ) ( not ( = ?auto_827422 ?auto_827426 ) ) ( not ( = ?auto_827422 ?auto_827427 ) ) ( not ( = ?auto_827422 ?auto_827428 ) ) ( not ( = ?auto_827422 ?auto_827429 ) ) ( not ( = ?auto_827422 ?auto_827430 ) ) ( not ( = ?auto_827423 ?auto_827424 ) ) ( not ( = ?auto_827423 ?auto_827425 ) ) ( not ( = ?auto_827423 ?auto_827426 ) ) ( not ( = ?auto_827423 ?auto_827427 ) ) ( not ( = ?auto_827423 ?auto_827428 ) ) ( not ( = ?auto_827423 ?auto_827429 ) ) ( not ( = ?auto_827423 ?auto_827430 ) ) ( not ( = ?auto_827424 ?auto_827425 ) ) ( not ( = ?auto_827424 ?auto_827426 ) ) ( not ( = ?auto_827424 ?auto_827427 ) ) ( not ( = ?auto_827424 ?auto_827428 ) ) ( not ( = ?auto_827424 ?auto_827429 ) ) ( not ( = ?auto_827424 ?auto_827430 ) ) ( not ( = ?auto_827425 ?auto_827426 ) ) ( not ( = ?auto_827425 ?auto_827427 ) ) ( not ( = ?auto_827425 ?auto_827428 ) ) ( not ( = ?auto_827425 ?auto_827429 ) ) ( not ( = ?auto_827425 ?auto_827430 ) ) ( not ( = ?auto_827426 ?auto_827427 ) ) ( not ( = ?auto_827426 ?auto_827428 ) ) ( not ( = ?auto_827426 ?auto_827429 ) ) ( not ( = ?auto_827426 ?auto_827430 ) ) ( not ( = ?auto_827427 ?auto_827428 ) ) ( not ( = ?auto_827427 ?auto_827429 ) ) ( not ( = ?auto_827427 ?auto_827430 ) ) ( not ( = ?auto_827428 ?auto_827429 ) ) ( not ( = ?auto_827428 ?auto_827430 ) ) ( not ( = ?auto_827429 ?auto_827430 ) ) ( ON ?auto_827428 ?auto_827429 ) ( ON ?auto_827427 ?auto_827428 ) ( ON ?auto_827426 ?auto_827427 ) ( ON ?auto_827425 ?auto_827426 ) ( ON ?auto_827424 ?auto_827425 ) ( ON ?auto_827423 ?auto_827424 ) ( ON ?auto_827422 ?auto_827423 ) ( ON ?auto_827421 ?auto_827422 ) ( ON ?auto_827420 ?auto_827421 ) ( ON ?auto_827419 ?auto_827420 ) ( ON ?auto_827418 ?auto_827419 ) ( ON ?auto_827417 ?auto_827418 ) ( ON ?auto_827416 ?auto_827417 ) ( ON ?auto_827415 ?auto_827416 ) ( CLEAR ?auto_827413 ) ( ON ?auto_827414 ?auto_827415 ) ( CLEAR ?auto_827414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_827412 ?auto_827413 ?auto_827414 )
      ( MAKE-18PILE ?auto_827412 ?auto_827413 ?auto_827414 ?auto_827415 ?auto_827416 ?auto_827417 ?auto_827418 ?auto_827419 ?auto_827420 ?auto_827421 ?auto_827422 ?auto_827423 ?auto_827424 ?auto_827425 ?auto_827426 ?auto_827427 ?auto_827428 ?auto_827429 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827449 - BLOCK
      ?auto_827450 - BLOCK
      ?auto_827451 - BLOCK
      ?auto_827452 - BLOCK
      ?auto_827453 - BLOCK
      ?auto_827454 - BLOCK
      ?auto_827455 - BLOCK
      ?auto_827456 - BLOCK
      ?auto_827457 - BLOCK
      ?auto_827458 - BLOCK
      ?auto_827459 - BLOCK
      ?auto_827460 - BLOCK
      ?auto_827461 - BLOCK
      ?auto_827462 - BLOCK
      ?auto_827463 - BLOCK
      ?auto_827464 - BLOCK
      ?auto_827465 - BLOCK
      ?auto_827466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_827466 ) ( ON-TABLE ?auto_827449 ) ( ON ?auto_827450 ?auto_827449 ) ( not ( = ?auto_827449 ?auto_827450 ) ) ( not ( = ?auto_827449 ?auto_827451 ) ) ( not ( = ?auto_827449 ?auto_827452 ) ) ( not ( = ?auto_827449 ?auto_827453 ) ) ( not ( = ?auto_827449 ?auto_827454 ) ) ( not ( = ?auto_827449 ?auto_827455 ) ) ( not ( = ?auto_827449 ?auto_827456 ) ) ( not ( = ?auto_827449 ?auto_827457 ) ) ( not ( = ?auto_827449 ?auto_827458 ) ) ( not ( = ?auto_827449 ?auto_827459 ) ) ( not ( = ?auto_827449 ?auto_827460 ) ) ( not ( = ?auto_827449 ?auto_827461 ) ) ( not ( = ?auto_827449 ?auto_827462 ) ) ( not ( = ?auto_827449 ?auto_827463 ) ) ( not ( = ?auto_827449 ?auto_827464 ) ) ( not ( = ?auto_827449 ?auto_827465 ) ) ( not ( = ?auto_827449 ?auto_827466 ) ) ( not ( = ?auto_827450 ?auto_827451 ) ) ( not ( = ?auto_827450 ?auto_827452 ) ) ( not ( = ?auto_827450 ?auto_827453 ) ) ( not ( = ?auto_827450 ?auto_827454 ) ) ( not ( = ?auto_827450 ?auto_827455 ) ) ( not ( = ?auto_827450 ?auto_827456 ) ) ( not ( = ?auto_827450 ?auto_827457 ) ) ( not ( = ?auto_827450 ?auto_827458 ) ) ( not ( = ?auto_827450 ?auto_827459 ) ) ( not ( = ?auto_827450 ?auto_827460 ) ) ( not ( = ?auto_827450 ?auto_827461 ) ) ( not ( = ?auto_827450 ?auto_827462 ) ) ( not ( = ?auto_827450 ?auto_827463 ) ) ( not ( = ?auto_827450 ?auto_827464 ) ) ( not ( = ?auto_827450 ?auto_827465 ) ) ( not ( = ?auto_827450 ?auto_827466 ) ) ( not ( = ?auto_827451 ?auto_827452 ) ) ( not ( = ?auto_827451 ?auto_827453 ) ) ( not ( = ?auto_827451 ?auto_827454 ) ) ( not ( = ?auto_827451 ?auto_827455 ) ) ( not ( = ?auto_827451 ?auto_827456 ) ) ( not ( = ?auto_827451 ?auto_827457 ) ) ( not ( = ?auto_827451 ?auto_827458 ) ) ( not ( = ?auto_827451 ?auto_827459 ) ) ( not ( = ?auto_827451 ?auto_827460 ) ) ( not ( = ?auto_827451 ?auto_827461 ) ) ( not ( = ?auto_827451 ?auto_827462 ) ) ( not ( = ?auto_827451 ?auto_827463 ) ) ( not ( = ?auto_827451 ?auto_827464 ) ) ( not ( = ?auto_827451 ?auto_827465 ) ) ( not ( = ?auto_827451 ?auto_827466 ) ) ( not ( = ?auto_827452 ?auto_827453 ) ) ( not ( = ?auto_827452 ?auto_827454 ) ) ( not ( = ?auto_827452 ?auto_827455 ) ) ( not ( = ?auto_827452 ?auto_827456 ) ) ( not ( = ?auto_827452 ?auto_827457 ) ) ( not ( = ?auto_827452 ?auto_827458 ) ) ( not ( = ?auto_827452 ?auto_827459 ) ) ( not ( = ?auto_827452 ?auto_827460 ) ) ( not ( = ?auto_827452 ?auto_827461 ) ) ( not ( = ?auto_827452 ?auto_827462 ) ) ( not ( = ?auto_827452 ?auto_827463 ) ) ( not ( = ?auto_827452 ?auto_827464 ) ) ( not ( = ?auto_827452 ?auto_827465 ) ) ( not ( = ?auto_827452 ?auto_827466 ) ) ( not ( = ?auto_827453 ?auto_827454 ) ) ( not ( = ?auto_827453 ?auto_827455 ) ) ( not ( = ?auto_827453 ?auto_827456 ) ) ( not ( = ?auto_827453 ?auto_827457 ) ) ( not ( = ?auto_827453 ?auto_827458 ) ) ( not ( = ?auto_827453 ?auto_827459 ) ) ( not ( = ?auto_827453 ?auto_827460 ) ) ( not ( = ?auto_827453 ?auto_827461 ) ) ( not ( = ?auto_827453 ?auto_827462 ) ) ( not ( = ?auto_827453 ?auto_827463 ) ) ( not ( = ?auto_827453 ?auto_827464 ) ) ( not ( = ?auto_827453 ?auto_827465 ) ) ( not ( = ?auto_827453 ?auto_827466 ) ) ( not ( = ?auto_827454 ?auto_827455 ) ) ( not ( = ?auto_827454 ?auto_827456 ) ) ( not ( = ?auto_827454 ?auto_827457 ) ) ( not ( = ?auto_827454 ?auto_827458 ) ) ( not ( = ?auto_827454 ?auto_827459 ) ) ( not ( = ?auto_827454 ?auto_827460 ) ) ( not ( = ?auto_827454 ?auto_827461 ) ) ( not ( = ?auto_827454 ?auto_827462 ) ) ( not ( = ?auto_827454 ?auto_827463 ) ) ( not ( = ?auto_827454 ?auto_827464 ) ) ( not ( = ?auto_827454 ?auto_827465 ) ) ( not ( = ?auto_827454 ?auto_827466 ) ) ( not ( = ?auto_827455 ?auto_827456 ) ) ( not ( = ?auto_827455 ?auto_827457 ) ) ( not ( = ?auto_827455 ?auto_827458 ) ) ( not ( = ?auto_827455 ?auto_827459 ) ) ( not ( = ?auto_827455 ?auto_827460 ) ) ( not ( = ?auto_827455 ?auto_827461 ) ) ( not ( = ?auto_827455 ?auto_827462 ) ) ( not ( = ?auto_827455 ?auto_827463 ) ) ( not ( = ?auto_827455 ?auto_827464 ) ) ( not ( = ?auto_827455 ?auto_827465 ) ) ( not ( = ?auto_827455 ?auto_827466 ) ) ( not ( = ?auto_827456 ?auto_827457 ) ) ( not ( = ?auto_827456 ?auto_827458 ) ) ( not ( = ?auto_827456 ?auto_827459 ) ) ( not ( = ?auto_827456 ?auto_827460 ) ) ( not ( = ?auto_827456 ?auto_827461 ) ) ( not ( = ?auto_827456 ?auto_827462 ) ) ( not ( = ?auto_827456 ?auto_827463 ) ) ( not ( = ?auto_827456 ?auto_827464 ) ) ( not ( = ?auto_827456 ?auto_827465 ) ) ( not ( = ?auto_827456 ?auto_827466 ) ) ( not ( = ?auto_827457 ?auto_827458 ) ) ( not ( = ?auto_827457 ?auto_827459 ) ) ( not ( = ?auto_827457 ?auto_827460 ) ) ( not ( = ?auto_827457 ?auto_827461 ) ) ( not ( = ?auto_827457 ?auto_827462 ) ) ( not ( = ?auto_827457 ?auto_827463 ) ) ( not ( = ?auto_827457 ?auto_827464 ) ) ( not ( = ?auto_827457 ?auto_827465 ) ) ( not ( = ?auto_827457 ?auto_827466 ) ) ( not ( = ?auto_827458 ?auto_827459 ) ) ( not ( = ?auto_827458 ?auto_827460 ) ) ( not ( = ?auto_827458 ?auto_827461 ) ) ( not ( = ?auto_827458 ?auto_827462 ) ) ( not ( = ?auto_827458 ?auto_827463 ) ) ( not ( = ?auto_827458 ?auto_827464 ) ) ( not ( = ?auto_827458 ?auto_827465 ) ) ( not ( = ?auto_827458 ?auto_827466 ) ) ( not ( = ?auto_827459 ?auto_827460 ) ) ( not ( = ?auto_827459 ?auto_827461 ) ) ( not ( = ?auto_827459 ?auto_827462 ) ) ( not ( = ?auto_827459 ?auto_827463 ) ) ( not ( = ?auto_827459 ?auto_827464 ) ) ( not ( = ?auto_827459 ?auto_827465 ) ) ( not ( = ?auto_827459 ?auto_827466 ) ) ( not ( = ?auto_827460 ?auto_827461 ) ) ( not ( = ?auto_827460 ?auto_827462 ) ) ( not ( = ?auto_827460 ?auto_827463 ) ) ( not ( = ?auto_827460 ?auto_827464 ) ) ( not ( = ?auto_827460 ?auto_827465 ) ) ( not ( = ?auto_827460 ?auto_827466 ) ) ( not ( = ?auto_827461 ?auto_827462 ) ) ( not ( = ?auto_827461 ?auto_827463 ) ) ( not ( = ?auto_827461 ?auto_827464 ) ) ( not ( = ?auto_827461 ?auto_827465 ) ) ( not ( = ?auto_827461 ?auto_827466 ) ) ( not ( = ?auto_827462 ?auto_827463 ) ) ( not ( = ?auto_827462 ?auto_827464 ) ) ( not ( = ?auto_827462 ?auto_827465 ) ) ( not ( = ?auto_827462 ?auto_827466 ) ) ( not ( = ?auto_827463 ?auto_827464 ) ) ( not ( = ?auto_827463 ?auto_827465 ) ) ( not ( = ?auto_827463 ?auto_827466 ) ) ( not ( = ?auto_827464 ?auto_827465 ) ) ( not ( = ?auto_827464 ?auto_827466 ) ) ( not ( = ?auto_827465 ?auto_827466 ) ) ( ON ?auto_827465 ?auto_827466 ) ( ON ?auto_827464 ?auto_827465 ) ( ON ?auto_827463 ?auto_827464 ) ( ON ?auto_827462 ?auto_827463 ) ( ON ?auto_827461 ?auto_827462 ) ( ON ?auto_827460 ?auto_827461 ) ( ON ?auto_827459 ?auto_827460 ) ( ON ?auto_827458 ?auto_827459 ) ( ON ?auto_827457 ?auto_827458 ) ( ON ?auto_827456 ?auto_827457 ) ( ON ?auto_827455 ?auto_827456 ) ( ON ?auto_827454 ?auto_827455 ) ( ON ?auto_827453 ?auto_827454 ) ( ON ?auto_827452 ?auto_827453 ) ( CLEAR ?auto_827450 ) ( ON ?auto_827451 ?auto_827452 ) ( CLEAR ?auto_827451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_827449 ?auto_827450 ?auto_827451 )
      ( MAKE-18PILE ?auto_827449 ?auto_827450 ?auto_827451 ?auto_827452 ?auto_827453 ?auto_827454 ?auto_827455 ?auto_827456 ?auto_827457 ?auto_827458 ?auto_827459 ?auto_827460 ?auto_827461 ?auto_827462 ?auto_827463 ?auto_827464 ?auto_827465 ?auto_827466 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827485 - BLOCK
      ?auto_827486 - BLOCK
      ?auto_827487 - BLOCK
      ?auto_827488 - BLOCK
      ?auto_827489 - BLOCK
      ?auto_827490 - BLOCK
      ?auto_827491 - BLOCK
      ?auto_827492 - BLOCK
      ?auto_827493 - BLOCK
      ?auto_827494 - BLOCK
      ?auto_827495 - BLOCK
      ?auto_827496 - BLOCK
      ?auto_827497 - BLOCK
      ?auto_827498 - BLOCK
      ?auto_827499 - BLOCK
      ?auto_827500 - BLOCK
      ?auto_827501 - BLOCK
      ?auto_827502 - BLOCK
    )
    :vars
    (
      ?auto_827503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827502 ?auto_827503 ) ( ON-TABLE ?auto_827485 ) ( not ( = ?auto_827485 ?auto_827486 ) ) ( not ( = ?auto_827485 ?auto_827487 ) ) ( not ( = ?auto_827485 ?auto_827488 ) ) ( not ( = ?auto_827485 ?auto_827489 ) ) ( not ( = ?auto_827485 ?auto_827490 ) ) ( not ( = ?auto_827485 ?auto_827491 ) ) ( not ( = ?auto_827485 ?auto_827492 ) ) ( not ( = ?auto_827485 ?auto_827493 ) ) ( not ( = ?auto_827485 ?auto_827494 ) ) ( not ( = ?auto_827485 ?auto_827495 ) ) ( not ( = ?auto_827485 ?auto_827496 ) ) ( not ( = ?auto_827485 ?auto_827497 ) ) ( not ( = ?auto_827485 ?auto_827498 ) ) ( not ( = ?auto_827485 ?auto_827499 ) ) ( not ( = ?auto_827485 ?auto_827500 ) ) ( not ( = ?auto_827485 ?auto_827501 ) ) ( not ( = ?auto_827485 ?auto_827502 ) ) ( not ( = ?auto_827485 ?auto_827503 ) ) ( not ( = ?auto_827486 ?auto_827487 ) ) ( not ( = ?auto_827486 ?auto_827488 ) ) ( not ( = ?auto_827486 ?auto_827489 ) ) ( not ( = ?auto_827486 ?auto_827490 ) ) ( not ( = ?auto_827486 ?auto_827491 ) ) ( not ( = ?auto_827486 ?auto_827492 ) ) ( not ( = ?auto_827486 ?auto_827493 ) ) ( not ( = ?auto_827486 ?auto_827494 ) ) ( not ( = ?auto_827486 ?auto_827495 ) ) ( not ( = ?auto_827486 ?auto_827496 ) ) ( not ( = ?auto_827486 ?auto_827497 ) ) ( not ( = ?auto_827486 ?auto_827498 ) ) ( not ( = ?auto_827486 ?auto_827499 ) ) ( not ( = ?auto_827486 ?auto_827500 ) ) ( not ( = ?auto_827486 ?auto_827501 ) ) ( not ( = ?auto_827486 ?auto_827502 ) ) ( not ( = ?auto_827486 ?auto_827503 ) ) ( not ( = ?auto_827487 ?auto_827488 ) ) ( not ( = ?auto_827487 ?auto_827489 ) ) ( not ( = ?auto_827487 ?auto_827490 ) ) ( not ( = ?auto_827487 ?auto_827491 ) ) ( not ( = ?auto_827487 ?auto_827492 ) ) ( not ( = ?auto_827487 ?auto_827493 ) ) ( not ( = ?auto_827487 ?auto_827494 ) ) ( not ( = ?auto_827487 ?auto_827495 ) ) ( not ( = ?auto_827487 ?auto_827496 ) ) ( not ( = ?auto_827487 ?auto_827497 ) ) ( not ( = ?auto_827487 ?auto_827498 ) ) ( not ( = ?auto_827487 ?auto_827499 ) ) ( not ( = ?auto_827487 ?auto_827500 ) ) ( not ( = ?auto_827487 ?auto_827501 ) ) ( not ( = ?auto_827487 ?auto_827502 ) ) ( not ( = ?auto_827487 ?auto_827503 ) ) ( not ( = ?auto_827488 ?auto_827489 ) ) ( not ( = ?auto_827488 ?auto_827490 ) ) ( not ( = ?auto_827488 ?auto_827491 ) ) ( not ( = ?auto_827488 ?auto_827492 ) ) ( not ( = ?auto_827488 ?auto_827493 ) ) ( not ( = ?auto_827488 ?auto_827494 ) ) ( not ( = ?auto_827488 ?auto_827495 ) ) ( not ( = ?auto_827488 ?auto_827496 ) ) ( not ( = ?auto_827488 ?auto_827497 ) ) ( not ( = ?auto_827488 ?auto_827498 ) ) ( not ( = ?auto_827488 ?auto_827499 ) ) ( not ( = ?auto_827488 ?auto_827500 ) ) ( not ( = ?auto_827488 ?auto_827501 ) ) ( not ( = ?auto_827488 ?auto_827502 ) ) ( not ( = ?auto_827488 ?auto_827503 ) ) ( not ( = ?auto_827489 ?auto_827490 ) ) ( not ( = ?auto_827489 ?auto_827491 ) ) ( not ( = ?auto_827489 ?auto_827492 ) ) ( not ( = ?auto_827489 ?auto_827493 ) ) ( not ( = ?auto_827489 ?auto_827494 ) ) ( not ( = ?auto_827489 ?auto_827495 ) ) ( not ( = ?auto_827489 ?auto_827496 ) ) ( not ( = ?auto_827489 ?auto_827497 ) ) ( not ( = ?auto_827489 ?auto_827498 ) ) ( not ( = ?auto_827489 ?auto_827499 ) ) ( not ( = ?auto_827489 ?auto_827500 ) ) ( not ( = ?auto_827489 ?auto_827501 ) ) ( not ( = ?auto_827489 ?auto_827502 ) ) ( not ( = ?auto_827489 ?auto_827503 ) ) ( not ( = ?auto_827490 ?auto_827491 ) ) ( not ( = ?auto_827490 ?auto_827492 ) ) ( not ( = ?auto_827490 ?auto_827493 ) ) ( not ( = ?auto_827490 ?auto_827494 ) ) ( not ( = ?auto_827490 ?auto_827495 ) ) ( not ( = ?auto_827490 ?auto_827496 ) ) ( not ( = ?auto_827490 ?auto_827497 ) ) ( not ( = ?auto_827490 ?auto_827498 ) ) ( not ( = ?auto_827490 ?auto_827499 ) ) ( not ( = ?auto_827490 ?auto_827500 ) ) ( not ( = ?auto_827490 ?auto_827501 ) ) ( not ( = ?auto_827490 ?auto_827502 ) ) ( not ( = ?auto_827490 ?auto_827503 ) ) ( not ( = ?auto_827491 ?auto_827492 ) ) ( not ( = ?auto_827491 ?auto_827493 ) ) ( not ( = ?auto_827491 ?auto_827494 ) ) ( not ( = ?auto_827491 ?auto_827495 ) ) ( not ( = ?auto_827491 ?auto_827496 ) ) ( not ( = ?auto_827491 ?auto_827497 ) ) ( not ( = ?auto_827491 ?auto_827498 ) ) ( not ( = ?auto_827491 ?auto_827499 ) ) ( not ( = ?auto_827491 ?auto_827500 ) ) ( not ( = ?auto_827491 ?auto_827501 ) ) ( not ( = ?auto_827491 ?auto_827502 ) ) ( not ( = ?auto_827491 ?auto_827503 ) ) ( not ( = ?auto_827492 ?auto_827493 ) ) ( not ( = ?auto_827492 ?auto_827494 ) ) ( not ( = ?auto_827492 ?auto_827495 ) ) ( not ( = ?auto_827492 ?auto_827496 ) ) ( not ( = ?auto_827492 ?auto_827497 ) ) ( not ( = ?auto_827492 ?auto_827498 ) ) ( not ( = ?auto_827492 ?auto_827499 ) ) ( not ( = ?auto_827492 ?auto_827500 ) ) ( not ( = ?auto_827492 ?auto_827501 ) ) ( not ( = ?auto_827492 ?auto_827502 ) ) ( not ( = ?auto_827492 ?auto_827503 ) ) ( not ( = ?auto_827493 ?auto_827494 ) ) ( not ( = ?auto_827493 ?auto_827495 ) ) ( not ( = ?auto_827493 ?auto_827496 ) ) ( not ( = ?auto_827493 ?auto_827497 ) ) ( not ( = ?auto_827493 ?auto_827498 ) ) ( not ( = ?auto_827493 ?auto_827499 ) ) ( not ( = ?auto_827493 ?auto_827500 ) ) ( not ( = ?auto_827493 ?auto_827501 ) ) ( not ( = ?auto_827493 ?auto_827502 ) ) ( not ( = ?auto_827493 ?auto_827503 ) ) ( not ( = ?auto_827494 ?auto_827495 ) ) ( not ( = ?auto_827494 ?auto_827496 ) ) ( not ( = ?auto_827494 ?auto_827497 ) ) ( not ( = ?auto_827494 ?auto_827498 ) ) ( not ( = ?auto_827494 ?auto_827499 ) ) ( not ( = ?auto_827494 ?auto_827500 ) ) ( not ( = ?auto_827494 ?auto_827501 ) ) ( not ( = ?auto_827494 ?auto_827502 ) ) ( not ( = ?auto_827494 ?auto_827503 ) ) ( not ( = ?auto_827495 ?auto_827496 ) ) ( not ( = ?auto_827495 ?auto_827497 ) ) ( not ( = ?auto_827495 ?auto_827498 ) ) ( not ( = ?auto_827495 ?auto_827499 ) ) ( not ( = ?auto_827495 ?auto_827500 ) ) ( not ( = ?auto_827495 ?auto_827501 ) ) ( not ( = ?auto_827495 ?auto_827502 ) ) ( not ( = ?auto_827495 ?auto_827503 ) ) ( not ( = ?auto_827496 ?auto_827497 ) ) ( not ( = ?auto_827496 ?auto_827498 ) ) ( not ( = ?auto_827496 ?auto_827499 ) ) ( not ( = ?auto_827496 ?auto_827500 ) ) ( not ( = ?auto_827496 ?auto_827501 ) ) ( not ( = ?auto_827496 ?auto_827502 ) ) ( not ( = ?auto_827496 ?auto_827503 ) ) ( not ( = ?auto_827497 ?auto_827498 ) ) ( not ( = ?auto_827497 ?auto_827499 ) ) ( not ( = ?auto_827497 ?auto_827500 ) ) ( not ( = ?auto_827497 ?auto_827501 ) ) ( not ( = ?auto_827497 ?auto_827502 ) ) ( not ( = ?auto_827497 ?auto_827503 ) ) ( not ( = ?auto_827498 ?auto_827499 ) ) ( not ( = ?auto_827498 ?auto_827500 ) ) ( not ( = ?auto_827498 ?auto_827501 ) ) ( not ( = ?auto_827498 ?auto_827502 ) ) ( not ( = ?auto_827498 ?auto_827503 ) ) ( not ( = ?auto_827499 ?auto_827500 ) ) ( not ( = ?auto_827499 ?auto_827501 ) ) ( not ( = ?auto_827499 ?auto_827502 ) ) ( not ( = ?auto_827499 ?auto_827503 ) ) ( not ( = ?auto_827500 ?auto_827501 ) ) ( not ( = ?auto_827500 ?auto_827502 ) ) ( not ( = ?auto_827500 ?auto_827503 ) ) ( not ( = ?auto_827501 ?auto_827502 ) ) ( not ( = ?auto_827501 ?auto_827503 ) ) ( not ( = ?auto_827502 ?auto_827503 ) ) ( ON ?auto_827501 ?auto_827502 ) ( ON ?auto_827500 ?auto_827501 ) ( ON ?auto_827499 ?auto_827500 ) ( ON ?auto_827498 ?auto_827499 ) ( ON ?auto_827497 ?auto_827498 ) ( ON ?auto_827496 ?auto_827497 ) ( ON ?auto_827495 ?auto_827496 ) ( ON ?auto_827494 ?auto_827495 ) ( ON ?auto_827493 ?auto_827494 ) ( ON ?auto_827492 ?auto_827493 ) ( ON ?auto_827491 ?auto_827492 ) ( ON ?auto_827490 ?auto_827491 ) ( ON ?auto_827489 ?auto_827490 ) ( ON ?auto_827488 ?auto_827489 ) ( ON ?auto_827487 ?auto_827488 ) ( CLEAR ?auto_827485 ) ( ON ?auto_827486 ?auto_827487 ) ( CLEAR ?auto_827486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_827485 ?auto_827486 )
      ( MAKE-18PILE ?auto_827485 ?auto_827486 ?auto_827487 ?auto_827488 ?auto_827489 ?auto_827490 ?auto_827491 ?auto_827492 ?auto_827493 ?auto_827494 ?auto_827495 ?auto_827496 ?auto_827497 ?auto_827498 ?auto_827499 ?auto_827500 ?auto_827501 ?auto_827502 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827522 - BLOCK
      ?auto_827523 - BLOCK
      ?auto_827524 - BLOCK
      ?auto_827525 - BLOCK
      ?auto_827526 - BLOCK
      ?auto_827527 - BLOCK
      ?auto_827528 - BLOCK
      ?auto_827529 - BLOCK
      ?auto_827530 - BLOCK
      ?auto_827531 - BLOCK
      ?auto_827532 - BLOCK
      ?auto_827533 - BLOCK
      ?auto_827534 - BLOCK
      ?auto_827535 - BLOCK
      ?auto_827536 - BLOCK
      ?auto_827537 - BLOCK
      ?auto_827538 - BLOCK
      ?auto_827539 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_827539 ) ( ON-TABLE ?auto_827522 ) ( not ( = ?auto_827522 ?auto_827523 ) ) ( not ( = ?auto_827522 ?auto_827524 ) ) ( not ( = ?auto_827522 ?auto_827525 ) ) ( not ( = ?auto_827522 ?auto_827526 ) ) ( not ( = ?auto_827522 ?auto_827527 ) ) ( not ( = ?auto_827522 ?auto_827528 ) ) ( not ( = ?auto_827522 ?auto_827529 ) ) ( not ( = ?auto_827522 ?auto_827530 ) ) ( not ( = ?auto_827522 ?auto_827531 ) ) ( not ( = ?auto_827522 ?auto_827532 ) ) ( not ( = ?auto_827522 ?auto_827533 ) ) ( not ( = ?auto_827522 ?auto_827534 ) ) ( not ( = ?auto_827522 ?auto_827535 ) ) ( not ( = ?auto_827522 ?auto_827536 ) ) ( not ( = ?auto_827522 ?auto_827537 ) ) ( not ( = ?auto_827522 ?auto_827538 ) ) ( not ( = ?auto_827522 ?auto_827539 ) ) ( not ( = ?auto_827523 ?auto_827524 ) ) ( not ( = ?auto_827523 ?auto_827525 ) ) ( not ( = ?auto_827523 ?auto_827526 ) ) ( not ( = ?auto_827523 ?auto_827527 ) ) ( not ( = ?auto_827523 ?auto_827528 ) ) ( not ( = ?auto_827523 ?auto_827529 ) ) ( not ( = ?auto_827523 ?auto_827530 ) ) ( not ( = ?auto_827523 ?auto_827531 ) ) ( not ( = ?auto_827523 ?auto_827532 ) ) ( not ( = ?auto_827523 ?auto_827533 ) ) ( not ( = ?auto_827523 ?auto_827534 ) ) ( not ( = ?auto_827523 ?auto_827535 ) ) ( not ( = ?auto_827523 ?auto_827536 ) ) ( not ( = ?auto_827523 ?auto_827537 ) ) ( not ( = ?auto_827523 ?auto_827538 ) ) ( not ( = ?auto_827523 ?auto_827539 ) ) ( not ( = ?auto_827524 ?auto_827525 ) ) ( not ( = ?auto_827524 ?auto_827526 ) ) ( not ( = ?auto_827524 ?auto_827527 ) ) ( not ( = ?auto_827524 ?auto_827528 ) ) ( not ( = ?auto_827524 ?auto_827529 ) ) ( not ( = ?auto_827524 ?auto_827530 ) ) ( not ( = ?auto_827524 ?auto_827531 ) ) ( not ( = ?auto_827524 ?auto_827532 ) ) ( not ( = ?auto_827524 ?auto_827533 ) ) ( not ( = ?auto_827524 ?auto_827534 ) ) ( not ( = ?auto_827524 ?auto_827535 ) ) ( not ( = ?auto_827524 ?auto_827536 ) ) ( not ( = ?auto_827524 ?auto_827537 ) ) ( not ( = ?auto_827524 ?auto_827538 ) ) ( not ( = ?auto_827524 ?auto_827539 ) ) ( not ( = ?auto_827525 ?auto_827526 ) ) ( not ( = ?auto_827525 ?auto_827527 ) ) ( not ( = ?auto_827525 ?auto_827528 ) ) ( not ( = ?auto_827525 ?auto_827529 ) ) ( not ( = ?auto_827525 ?auto_827530 ) ) ( not ( = ?auto_827525 ?auto_827531 ) ) ( not ( = ?auto_827525 ?auto_827532 ) ) ( not ( = ?auto_827525 ?auto_827533 ) ) ( not ( = ?auto_827525 ?auto_827534 ) ) ( not ( = ?auto_827525 ?auto_827535 ) ) ( not ( = ?auto_827525 ?auto_827536 ) ) ( not ( = ?auto_827525 ?auto_827537 ) ) ( not ( = ?auto_827525 ?auto_827538 ) ) ( not ( = ?auto_827525 ?auto_827539 ) ) ( not ( = ?auto_827526 ?auto_827527 ) ) ( not ( = ?auto_827526 ?auto_827528 ) ) ( not ( = ?auto_827526 ?auto_827529 ) ) ( not ( = ?auto_827526 ?auto_827530 ) ) ( not ( = ?auto_827526 ?auto_827531 ) ) ( not ( = ?auto_827526 ?auto_827532 ) ) ( not ( = ?auto_827526 ?auto_827533 ) ) ( not ( = ?auto_827526 ?auto_827534 ) ) ( not ( = ?auto_827526 ?auto_827535 ) ) ( not ( = ?auto_827526 ?auto_827536 ) ) ( not ( = ?auto_827526 ?auto_827537 ) ) ( not ( = ?auto_827526 ?auto_827538 ) ) ( not ( = ?auto_827526 ?auto_827539 ) ) ( not ( = ?auto_827527 ?auto_827528 ) ) ( not ( = ?auto_827527 ?auto_827529 ) ) ( not ( = ?auto_827527 ?auto_827530 ) ) ( not ( = ?auto_827527 ?auto_827531 ) ) ( not ( = ?auto_827527 ?auto_827532 ) ) ( not ( = ?auto_827527 ?auto_827533 ) ) ( not ( = ?auto_827527 ?auto_827534 ) ) ( not ( = ?auto_827527 ?auto_827535 ) ) ( not ( = ?auto_827527 ?auto_827536 ) ) ( not ( = ?auto_827527 ?auto_827537 ) ) ( not ( = ?auto_827527 ?auto_827538 ) ) ( not ( = ?auto_827527 ?auto_827539 ) ) ( not ( = ?auto_827528 ?auto_827529 ) ) ( not ( = ?auto_827528 ?auto_827530 ) ) ( not ( = ?auto_827528 ?auto_827531 ) ) ( not ( = ?auto_827528 ?auto_827532 ) ) ( not ( = ?auto_827528 ?auto_827533 ) ) ( not ( = ?auto_827528 ?auto_827534 ) ) ( not ( = ?auto_827528 ?auto_827535 ) ) ( not ( = ?auto_827528 ?auto_827536 ) ) ( not ( = ?auto_827528 ?auto_827537 ) ) ( not ( = ?auto_827528 ?auto_827538 ) ) ( not ( = ?auto_827528 ?auto_827539 ) ) ( not ( = ?auto_827529 ?auto_827530 ) ) ( not ( = ?auto_827529 ?auto_827531 ) ) ( not ( = ?auto_827529 ?auto_827532 ) ) ( not ( = ?auto_827529 ?auto_827533 ) ) ( not ( = ?auto_827529 ?auto_827534 ) ) ( not ( = ?auto_827529 ?auto_827535 ) ) ( not ( = ?auto_827529 ?auto_827536 ) ) ( not ( = ?auto_827529 ?auto_827537 ) ) ( not ( = ?auto_827529 ?auto_827538 ) ) ( not ( = ?auto_827529 ?auto_827539 ) ) ( not ( = ?auto_827530 ?auto_827531 ) ) ( not ( = ?auto_827530 ?auto_827532 ) ) ( not ( = ?auto_827530 ?auto_827533 ) ) ( not ( = ?auto_827530 ?auto_827534 ) ) ( not ( = ?auto_827530 ?auto_827535 ) ) ( not ( = ?auto_827530 ?auto_827536 ) ) ( not ( = ?auto_827530 ?auto_827537 ) ) ( not ( = ?auto_827530 ?auto_827538 ) ) ( not ( = ?auto_827530 ?auto_827539 ) ) ( not ( = ?auto_827531 ?auto_827532 ) ) ( not ( = ?auto_827531 ?auto_827533 ) ) ( not ( = ?auto_827531 ?auto_827534 ) ) ( not ( = ?auto_827531 ?auto_827535 ) ) ( not ( = ?auto_827531 ?auto_827536 ) ) ( not ( = ?auto_827531 ?auto_827537 ) ) ( not ( = ?auto_827531 ?auto_827538 ) ) ( not ( = ?auto_827531 ?auto_827539 ) ) ( not ( = ?auto_827532 ?auto_827533 ) ) ( not ( = ?auto_827532 ?auto_827534 ) ) ( not ( = ?auto_827532 ?auto_827535 ) ) ( not ( = ?auto_827532 ?auto_827536 ) ) ( not ( = ?auto_827532 ?auto_827537 ) ) ( not ( = ?auto_827532 ?auto_827538 ) ) ( not ( = ?auto_827532 ?auto_827539 ) ) ( not ( = ?auto_827533 ?auto_827534 ) ) ( not ( = ?auto_827533 ?auto_827535 ) ) ( not ( = ?auto_827533 ?auto_827536 ) ) ( not ( = ?auto_827533 ?auto_827537 ) ) ( not ( = ?auto_827533 ?auto_827538 ) ) ( not ( = ?auto_827533 ?auto_827539 ) ) ( not ( = ?auto_827534 ?auto_827535 ) ) ( not ( = ?auto_827534 ?auto_827536 ) ) ( not ( = ?auto_827534 ?auto_827537 ) ) ( not ( = ?auto_827534 ?auto_827538 ) ) ( not ( = ?auto_827534 ?auto_827539 ) ) ( not ( = ?auto_827535 ?auto_827536 ) ) ( not ( = ?auto_827535 ?auto_827537 ) ) ( not ( = ?auto_827535 ?auto_827538 ) ) ( not ( = ?auto_827535 ?auto_827539 ) ) ( not ( = ?auto_827536 ?auto_827537 ) ) ( not ( = ?auto_827536 ?auto_827538 ) ) ( not ( = ?auto_827536 ?auto_827539 ) ) ( not ( = ?auto_827537 ?auto_827538 ) ) ( not ( = ?auto_827537 ?auto_827539 ) ) ( not ( = ?auto_827538 ?auto_827539 ) ) ( ON ?auto_827538 ?auto_827539 ) ( ON ?auto_827537 ?auto_827538 ) ( ON ?auto_827536 ?auto_827537 ) ( ON ?auto_827535 ?auto_827536 ) ( ON ?auto_827534 ?auto_827535 ) ( ON ?auto_827533 ?auto_827534 ) ( ON ?auto_827532 ?auto_827533 ) ( ON ?auto_827531 ?auto_827532 ) ( ON ?auto_827530 ?auto_827531 ) ( ON ?auto_827529 ?auto_827530 ) ( ON ?auto_827528 ?auto_827529 ) ( ON ?auto_827527 ?auto_827528 ) ( ON ?auto_827526 ?auto_827527 ) ( ON ?auto_827525 ?auto_827526 ) ( ON ?auto_827524 ?auto_827525 ) ( CLEAR ?auto_827522 ) ( ON ?auto_827523 ?auto_827524 ) ( CLEAR ?auto_827523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_827522 ?auto_827523 )
      ( MAKE-18PILE ?auto_827522 ?auto_827523 ?auto_827524 ?auto_827525 ?auto_827526 ?auto_827527 ?auto_827528 ?auto_827529 ?auto_827530 ?auto_827531 ?auto_827532 ?auto_827533 ?auto_827534 ?auto_827535 ?auto_827536 ?auto_827537 ?auto_827538 ?auto_827539 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827558 - BLOCK
      ?auto_827559 - BLOCK
      ?auto_827560 - BLOCK
      ?auto_827561 - BLOCK
      ?auto_827562 - BLOCK
      ?auto_827563 - BLOCK
      ?auto_827564 - BLOCK
      ?auto_827565 - BLOCK
      ?auto_827566 - BLOCK
      ?auto_827567 - BLOCK
      ?auto_827568 - BLOCK
      ?auto_827569 - BLOCK
      ?auto_827570 - BLOCK
      ?auto_827571 - BLOCK
      ?auto_827572 - BLOCK
      ?auto_827573 - BLOCK
      ?auto_827574 - BLOCK
      ?auto_827575 - BLOCK
    )
    :vars
    (
      ?auto_827576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_827575 ?auto_827576 ) ( not ( = ?auto_827558 ?auto_827559 ) ) ( not ( = ?auto_827558 ?auto_827560 ) ) ( not ( = ?auto_827558 ?auto_827561 ) ) ( not ( = ?auto_827558 ?auto_827562 ) ) ( not ( = ?auto_827558 ?auto_827563 ) ) ( not ( = ?auto_827558 ?auto_827564 ) ) ( not ( = ?auto_827558 ?auto_827565 ) ) ( not ( = ?auto_827558 ?auto_827566 ) ) ( not ( = ?auto_827558 ?auto_827567 ) ) ( not ( = ?auto_827558 ?auto_827568 ) ) ( not ( = ?auto_827558 ?auto_827569 ) ) ( not ( = ?auto_827558 ?auto_827570 ) ) ( not ( = ?auto_827558 ?auto_827571 ) ) ( not ( = ?auto_827558 ?auto_827572 ) ) ( not ( = ?auto_827558 ?auto_827573 ) ) ( not ( = ?auto_827558 ?auto_827574 ) ) ( not ( = ?auto_827558 ?auto_827575 ) ) ( not ( = ?auto_827558 ?auto_827576 ) ) ( not ( = ?auto_827559 ?auto_827560 ) ) ( not ( = ?auto_827559 ?auto_827561 ) ) ( not ( = ?auto_827559 ?auto_827562 ) ) ( not ( = ?auto_827559 ?auto_827563 ) ) ( not ( = ?auto_827559 ?auto_827564 ) ) ( not ( = ?auto_827559 ?auto_827565 ) ) ( not ( = ?auto_827559 ?auto_827566 ) ) ( not ( = ?auto_827559 ?auto_827567 ) ) ( not ( = ?auto_827559 ?auto_827568 ) ) ( not ( = ?auto_827559 ?auto_827569 ) ) ( not ( = ?auto_827559 ?auto_827570 ) ) ( not ( = ?auto_827559 ?auto_827571 ) ) ( not ( = ?auto_827559 ?auto_827572 ) ) ( not ( = ?auto_827559 ?auto_827573 ) ) ( not ( = ?auto_827559 ?auto_827574 ) ) ( not ( = ?auto_827559 ?auto_827575 ) ) ( not ( = ?auto_827559 ?auto_827576 ) ) ( not ( = ?auto_827560 ?auto_827561 ) ) ( not ( = ?auto_827560 ?auto_827562 ) ) ( not ( = ?auto_827560 ?auto_827563 ) ) ( not ( = ?auto_827560 ?auto_827564 ) ) ( not ( = ?auto_827560 ?auto_827565 ) ) ( not ( = ?auto_827560 ?auto_827566 ) ) ( not ( = ?auto_827560 ?auto_827567 ) ) ( not ( = ?auto_827560 ?auto_827568 ) ) ( not ( = ?auto_827560 ?auto_827569 ) ) ( not ( = ?auto_827560 ?auto_827570 ) ) ( not ( = ?auto_827560 ?auto_827571 ) ) ( not ( = ?auto_827560 ?auto_827572 ) ) ( not ( = ?auto_827560 ?auto_827573 ) ) ( not ( = ?auto_827560 ?auto_827574 ) ) ( not ( = ?auto_827560 ?auto_827575 ) ) ( not ( = ?auto_827560 ?auto_827576 ) ) ( not ( = ?auto_827561 ?auto_827562 ) ) ( not ( = ?auto_827561 ?auto_827563 ) ) ( not ( = ?auto_827561 ?auto_827564 ) ) ( not ( = ?auto_827561 ?auto_827565 ) ) ( not ( = ?auto_827561 ?auto_827566 ) ) ( not ( = ?auto_827561 ?auto_827567 ) ) ( not ( = ?auto_827561 ?auto_827568 ) ) ( not ( = ?auto_827561 ?auto_827569 ) ) ( not ( = ?auto_827561 ?auto_827570 ) ) ( not ( = ?auto_827561 ?auto_827571 ) ) ( not ( = ?auto_827561 ?auto_827572 ) ) ( not ( = ?auto_827561 ?auto_827573 ) ) ( not ( = ?auto_827561 ?auto_827574 ) ) ( not ( = ?auto_827561 ?auto_827575 ) ) ( not ( = ?auto_827561 ?auto_827576 ) ) ( not ( = ?auto_827562 ?auto_827563 ) ) ( not ( = ?auto_827562 ?auto_827564 ) ) ( not ( = ?auto_827562 ?auto_827565 ) ) ( not ( = ?auto_827562 ?auto_827566 ) ) ( not ( = ?auto_827562 ?auto_827567 ) ) ( not ( = ?auto_827562 ?auto_827568 ) ) ( not ( = ?auto_827562 ?auto_827569 ) ) ( not ( = ?auto_827562 ?auto_827570 ) ) ( not ( = ?auto_827562 ?auto_827571 ) ) ( not ( = ?auto_827562 ?auto_827572 ) ) ( not ( = ?auto_827562 ?auto_827573 ) ) ( not ( = ?auto_827562 ?auto_827574 ) ) ( not ( = ?auto_827562 ?auto_827575 ) ) ( not ( = ?auto_827562 ?auto_827576 ) ) ( not ( = ?auto_827563 ?auto_827564 ) ) ( not ( = ?auto_827563 ?auto_827565 ) ) ( not ( = ?auto_827563 ?auto_827566 ) ) ( not ( = ?auto_827563 ?auto_827567 ) ) ( not ( = ?auto_827563 ?auto_827568 ) ) ( not ( = ?auto_827563 ?auto_827569 ) ) ( not ( = ?auto_827563 ?auto_827570 ) ) ( not ( = ?auto_827563 ?auto_827571 ) ) ( not ( = ?auto_827563 ?auto_827572 ) ) ( not ( = ?auto_827563 ?auto_827573 ) ) ( not ( = ?auto_827563 ?auto_827574 ) ) ( not ( = ?auto_827563 ?auto_827575 ) ) ( not ( = ?auto_827563 ?auto_827576 ) ) ( not ( = ?auto_827564 ?auto_827565 ) ) ( not ( = ?auto_827564 ?auto_827566 ) ) ( not ( = ?auto_827564 ?auto_827567 ) ) ( not ( = ?auto_827564 ?auto_827568 ) ) ( not ( = ?auto_827564 ?auto_827569 ) ) ( not ( = ?auto_827564 ?auto_827570 ) ) ( not ( = ?auto_827564 ?auto_827571 ) ) ( not ( = ?auto_827564 ?auto_827572 ) ) ( not ( = ?auto_827564 ?auto_827573 ) ) ( not ( = ?auto_827564 ?auto_827574 ) ) ( not ( = ?auto_827564 ?auto_827575 ) ) ( not ( = ?auto_827564 ?auto_827576 ) ) ( not ( = ?auto_827565 ?auto_827566 ) ) ( not ( = ?auto_827565 ?auto_827567 ) ) ( not ( = ?auto_827565 ?auto_827568 ) ) ( not ( = ?auto_827565 ?auto_827569 ) ) ( not ( = ?auto_827565 ?auto_827570 ) ) ( not ( = ?auto_827565 ?auto_827571 ) ) ( not ( = ?auto_827565 ?auto_827572 ) ) ( not ( = ?auto_827565 ?auto_827573 ) ) ( not ( = ?auto_827565 ?auto_827574 ) ) ( not ( = ?auto_827565 ?auto_827575 ) ) ( not ( = ?auto_827565 ?auto_827576 ) ) ( not ( = ?auto_827566 ?auto_827567 ) ) ( not ( = ?auto_827566 ?auto_827568 ) ) ( not ( = ?auto_827566 ?auto_827569 ) ) ( not ( = ?auto_827566 ?auto_827570 ) ) ( not ( = ?auto_827566 ?auto_827571 ) ) ( not ( = ?auto_827566 ?auto_827572 ) ) ( not ( = ?auto_827566 ?auto_827573 ) ) ( not ( = ?auto_827566 ?auto_827574 ) ) ( not ( = ?auto_827566 ?auto_827575 ) ) ( not ( = ?auto_827566 ?auto_827576 ) ) ( not ( = ?auto_827567 ?auto_827568 ) ) ( not ( = ?auto_827567 ?auto_827569 ) ) ( not ( = ?auto_827567 ?auto_827570 ) ) ( not ( = ?auto_827567 ?auto_827571 ) ) ( not ( = ?auto_827567 ?auto_827572 ) ) ( not ( = ?auto_827567 ?auto_827573 ) ) ( not ( = ?auto_827567 ?auto_827574 ) ) ( not ( = ?auto_827567 ?auto_827575 ) ) ( not ( = ?auto_827567 ?auto_827576 ) ) ( not ( = ?auto_827568 ?auto_827569 ) ) ( not ( = ?auto_827568 ?auto_827570 ) ) ( not ( = ?auto_827568 ?auto_827571 ) ) ( not ( = ?auto_827568 ?auto_827572 ) ) ( not ( = ?auto_827568 ?auto_827573 ) ) ( not ( = ?auto_827568 ?auto_827574 ) ) ( not ( = ?auto_827568 ?auto_827575 ) ) ( not ( = ?auto_827568 ?auto_827576 ) ) ( not ( = ?auto_827569 ?auto_827570 ) ) ( not ( = ?auto_827569 ?auto_827571 ) ) ( not ( = ?auto_827569 ?auto_827572 ) ) ( not ( = ?auto_827569 ?auto_827573 ) ) ( not ( = ?auto_827569 ?auto_827574 ) ) ( not ( = ?auto_827569 ?auto_827575 ) ) ( not ( = ?auto_827569 ?auto_827576 ) ) ( not ( = ?auto_827570 ?auto_827571 ) ) ( not ( = ?auto_827570 ?auto_827572 ) ) ( not ( = ?auto_827570 ?auto_827573 ) ) ( not ( = ?auto_827570 ?auto_827574 ) ) ( not ( = ?auto_827570 ?auto_827575 ) ) ( not ( = ?auto_827570 ?auto_827576 ) ) ( not ( = ?auto_827571 ?auto_827572 ) ) ( not ( = ?auto_827571 ?auto_827573 ) ) ( not ( = ?auto_827571 ?auto_827574 ) ) ( not ( = ?auto_827571 ?auto_827575 ) ) ( not ( = ?auto_827571 ?auto_827576 ) ) ( not ( = ?auto_827572 ?auto_827573 ) ) ( not ( = ?auto_827572 ?auto_827574 ) ) ( not ( = ?auto_827572 ?auto_827575 ) ) ( not ( = ?auto_827572 ?auto_827576 ) ) ( not ( = ?auto_827573 ?auto_827574 ) ) ( not ( = ?auto_827573 ?auto_827575 ) ) ( not ( = ?auto_827573 ?auto_827576 ) ) ( not ( = ?auto_827574 ?auto_827575 ) ) ( not ( = ?auto_827574 ?auto_827576 ) ) ( not ( = ?auto_827575 ?auto_827576 ) ) ( ON ?auto_827574 ?auto_827575 ) ( ON ?auto_827573 ?auto_827574 ) ( ON ?auto_827572 ?auto_827573 ) ( ON ?auto_827571 ?auto_827572 ) ( ON ?auto_827570 ?auto_827571 ) ( ON ?auto_827569 ?auto_827570 ) ( ON ?auto_827568 ?auto_827569 ) ( ON ?auto_827567 ?auto_827568 ) ( ON ?auto_827566 ?auto_827567 ) ( ON ?auto_827565 ?auto_827566 ) ( ON ?auto_827564 ?auto_827565 ) ( ON ?auto_827563 ?auto_827564 ) ( ON ?auto_827562 ?auto_827563 ) ( ON ?auto_827561 ?auto_827562 ) ( ON ?auto_827560 ?auto_827561 ) ( ON ?auto_827559 ?auto_827560 ) ( ON ?auto_827558 ?auto_827559 ) ( CLEAR ?auto_827558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_827558 )
      ( MAKE-18PILE ?auto_827558 ?auto_827559 ?auto_827560 ?auto_827561 ?auto_827562 ?auto_827563 ?auto_827564 ?auto_827565 ?auto_827566 ?auto_827567 ?auto_827568 ?auto_827569 ?auto_827570 ?auto_827571 ?auto_827572 ?auto_827573 ?auto_827574 ?auto_827575 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827595 - BLOCK
      ?auto_827596 - BLOCK
      ?auto_827597 - BLOCK
      ?auto_827598 - BLOCK
      ?auto_827599 - BLOCK
      ?auto_827600 - BLOCK
      ?auto_827601 - BLOCK
      ?auto_827602 - BLOCK
      ?auto_827603 - BLOCK
      ?auto_827604 - BLOCK
      ?auto_827605 - BLOCK
      ?auto_827606 - BLOCK
      ?auto_827607 - BLOCK
      ?auto_827608 - BLOCK
      ?auto_827609 - BLOCK
      ?auto_827610 - BLOCK
      ?auto_827611 - BLOCK
      ?auto_827612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_827612 ) ( not ( = ?auto_827595 ?auto_827596 ) ) ( not ( = ?auto_827595 ?auto_827597 ) ) ( not ( = ?auto_827595 ?auto_827598 ) ) ( not ( = ?auto_827595 ?auto_827599 ) ) ( not ( = ?auto_827595 ?auto_827600 ) ) ( not ( = ?auto_827595 ?auto_827601 ) ) ( not ( = ?auto_827595 ?auto_827602 ) ) ( not ( = ?auto_827595 ?auto_827603 ) ) ( not ( = ?auto_827595 ?auto_827604 ) ) ( not ( = ?auto_827595 ?auto_827605 ) ) ( not ( = ?auto_827595 ?auto_827606 ) ) ( not ( = ?auto_827595 ?auto_827607 ) ) ( not ( = ?auto_827595 ?auto_827608 ) ) ( not ( = ?auto_827595 ?auto_827609 ) ) ( not ( = ?auto_827595 ?auto_827610 ) ) ( not ( = ?auto_827595 ?auto_827611 ) ) ( not ( = ?auto_827595 ?auto_827612 ) ) ( not ( = ?auto_827596 ?auto_827597 ) ) ( not ( = ?auto_827596 ?auto_827598 ) ) ( not ( = ?auto_827596 ?auto_827599 ) ) ( not ( = ?auto_827596 ?auto_827600 ) ) ( not ( = ?auto_827596 ?auto_827601 ) ) ( not ( = ?auto_827596 ?auto_827602 ) ) ( not ( = ?auto_827596 ?auto_827603 ) ) ( not ( = ?auto_827596 ?auto_827604 ) ) ( not ( = ?auto_827596 ?auto_827605 ) ) ( not ( = ?auto_827596 ?auto_827606 ) ) ( not ( = ?auto_827596 ?auto_827607 ) ) ( not ( = ?auto_827596 ?auto_827608 ) ) ( not ( = ?auto_827596 ?auto_827609 ) ) ( not ( = ?auto_827596 ?auto_827610 ) ) ( not ( = ?auto_827596 ?auto_827611 ) ) ( not ( = ?auto_827596 ?auto_827612 ) ) ( not ( = ?auto_827597 ?auto_827598 ) ) ( not ( = ?auto_827597 ?auto_827599 ) ) ( not ( = ?auto_827597 ?auto_827600 ) ) ( not ( = ?auto_827597 ?auto_827601 ) ) ( not ( = ?auto_827597 ?auto_827602 ) ) ( not ( = ?auto_827597 ?auto_827603 ) ) ( not ( = ?auto_827597 ?auto_827604 ) ) ( not ( = ?auto_827597 ?auto_827605 ) ) ( not ( = ?auto_827597 ?auto_827606 ) ) ( not ( = ?auto_827597 ?auto_827607 ) ) ( not ( = ?auto_827597 ?auto_827608 ) ) ( not ( = ?auto_827597 ?auto_827609 ) ) ( not ( = ?auto_827597 ?auto_827610 ) ) ( not ( = ?auto_827597 ?auto_827611 ) ) ( not ( = ?auto_827597 ?auto_827612 ) ) ( not ( = ?auto_827598 ?auto_827599 ) ) ( not ( = ?auto_827598 ?auto_827600 ) ) ( not ( = ?auto_827598 ?auto_827601 ) ) ( not ( = ?auto_827598 ?auto_827602 ) ) ( not ( = ?auto_827598 ?auto_827603 ) ) ( not ( = ?auto_827598 ?auto_827604 ) ) ( not ( = ?auto_827598 ?auto_827605 ) ) ( not ( = ?auto_827598 ?auto_827606 ) ) ( not ( = ?auto_827598 ?auto_827607 ) ) ( not ( = ?auto_827598 ?auto_827608 ) ) ( not ( = ?auto_827598 ?auto_827609 ) ) ( not ( = ?auto_827598 ?auto_827610 ) ) ( not ( = ?auto_827598 ?auto_827611 ) ) ( not ( = ?auto_827598 ?auto_827612 ) ) ( not ( = ?auto_827599 ?auto_827600 ) ) ( not ( = ?auto_827599 ?auto_827601 ) ) ( not ( = ?auto_827599 ?auto_827602 ) ) ( not ( = ?auto_827599 ?auto_827603 ) ) ( not ( = ?auto_827599 ?auto_827604 ) ) ( not ( = ?auto_827599 ?auto_827605 ) ) ( not ( = ?auto_827599 ?auto_827606 ) ) ( not ( = ?auto_827599 ?auto_827607 ) ) ( not ( = ?auto_827599 ?auto_827608 ) ) ( not ( = ?auto_827599 ?auto_827609 ) ) ( not ( = ?auto_827599 ?auto_827610 ) ) ( not ( = ?auto_827599 ?auto_827611 ) ) ( not ( = ?auto_827599 ?auto_827612 ) ) ( not ( = ?auto_827600 ?auto_827601 ) ) ( not ( = ?auto_827600 ?auto_827602 ) ) ( not ( = ?auto_827600 ?auto_827603 ) ) ( not ( = ?auto_827600 ?auto_827604 ) ) ( not ( = ?auto_827600 ?auto_827605 ) ) ( not ( = ?auto_827600 ?auto_827606 ) ) ( not ( = ?auto_827600 ?auto_827607 ) ) ( not ( = ?auto_827600 ?auto_827608 ) ) ( not ( = ?auto_827600 ?auto_827609 ) ) ( not ( = ?auto_827600 ?auto_827610 ) ) ( not ( = ?auto_827600 ?auto_827611 ) ) ( not ( = ?auto_827600 ?auto_827612 ) ) ( not ( = ?auto_827601 ?auto_827602 ) ) ( not ( = ?auto_827601 ?auto_827603 ) ) ( not ( = ?auto_827601 ?auto_827604 ) ) ( not ( = ?auto_827601 ?auto_827605 ) ) ( not ( = ?auto_827601 ?auto_827606 ) ) ( not ( = ?auto_827601 ?auto_827607 ) ) ( not ( = ?auto_827601 ?auto_827608 ) ) ( not ( = ?auto_827601 ?auto_827609 ) ) ( not ( = ?auto_827601 ?auto_827610 ) ) ( not ( = ?auto_827601 ?auto_827611 ) ) ( not ( = ?auto_827601 ?auto_827612 ) ) ( not ( = ?auto_827602 ?auto_827603 ) ) ( not ( = ?auto_827602 ?auto_827604 ) ) ( not ( = ?auto_827602 ?auto_827605 ) ) ( not ( = ?auto_827602 ?auto_827606 ) ) ( not ( = ?auto_827602 ?auto_827607 ) ) ( not ( = ?auto_827602 ?auto_827608 ) ) ( not ( = ?auto_827602 ?auto_827609 ) ) ( not ( = ?auto_827602 ?auto_827610 ) ) ( not ( = ?auto_827602 ?auto_827611 ) ) ( not ( = ?auto_827602 ?auto_827612 ) ) ( not ( = ?auto_827603 ?auto_827604 ) ) ( not ( = ?auto_827603 ?auto_827605 ) ) ( not ( = ?auto_827603 ?auto_827606 ) ) ( not ( = ?auto_827603 ?auto_827607 ) ) ( not ( = ?auto_827603 ?auto_827608 ) ) ( not ( = ?auto_827603 ?auto_827609 ) ) ( not ( = ?auto_827603 ?auto_827610 ) ) ( not ( = ?auto_827603 ?auto_827611 ) ) ( not ( = ?auto_827603 ?auto_827612 ) ) ( not ( = ?auto_827604 ?auto_827605 ) ) ( not ( = ?auto_827604 ?auto_827606 ) ) ( not ( = ?auto_827604 ?auto_827607 ) ) ( not ( = ?auto_827604 ?auto_827608 ) ) ( not ( = ?auto_827604 ?auto_827609 ) ) ( not ( = ?auto_827604 ?auto_827610 ) ) ( not ( = ?auto_827604 ?auto_827611 ) ) ( not ( = ?auto_827604 ?auto_827612 ) ) ( not ( = ?auto_827605 ?auto_827606 ) ) ( not ( = ?auto_827605 ?auto_827607 ) ) ( not ( = ?auto_827605 ?auto_827608 ) ) ( not ( = ?auto_827605 ?auto_827609 ) ) ( not ( = ?auto_827605 ?auto_827610 ) ) ( not ( = ?auto_827605 ?auto_827611 ) ) ( not ( = ?auto_827605 ?auto_827612 ) ) ( not ( = ?auto_827606 ?auto_827607 ) ) ( not ( = ?auto_827606 ?auto_827608 ) ) ( not ( = ?auto_827606 ?auto_827609 ) ) ( not ( = ?auto_827606 ?auto_827610 ) ) ( not ( = ?auto_827606 ?auto_827611 ) ) ( not ( = ?auto_827606 ?auto_827612 ) ) ( not ( = ?auto_827607 ?auto_827608 ) ) ( not ( = ?auto_827607 ?auto_827609 ) ) ( not ( = ?auto_827607 ?auto_827610 ) ) ( not ( = ?auto_827607 ?auto_827611 ) ) ( not ( = ?auto_827607 ?auto_827612 ) ) ( not ( = ?auto_827608 ?auto_827609 ) ) ( not ( = ?auto_827608 ?auto_827610 ) ) ( not ( = ?auto_827608 ?auto_827611 ) ) ( not ( = ?auto_827608 ?auto_827612 ) ) ( not ( = ?auto_827609 ?auto_827610 ) ) ( not ( = ?auto_827609 ?auto_827611 ) ) ( not ( = ?auto_827609 ?auto_827612 ) ) ( not ( = ?auto_827610 ?auto_827611 ) ) ( not ( = ?auto_827610 ?auto_827612 ) ) ( not ( = ?auto_827611 ?auto_827612 ) ) ( ON ?auto_827611 ?auto_827612 ) ( ON ?auto_827610 ?auto_827611 ) ( ON ?auto_827609 ?auto_827610 ) ( ON ?auto_827608 ?auto_827609 ) ( ON ?auto_827607 ?auto_827608 ) ( ON ?auto_827606 ?auto_827607 ) ( ON ?auto_827605 ?auto_827606 ) ( ON ?auto_827604 ?auto_827605 ) ( ON ?auto_827603 ?auto_827604 ) ( ON ?auto_827602 ?auto_827603 ) ( ON ?auto_827601 ?auto_827602 ) ( ON ?auto_827600 ?auto_827601 ) ( ON ?auto_827599 ?auto_827600 ) ( ON ?auto_827598 ?auto_827599 ) ( ON ?auto_827597 ?auto_827598 ) ( ON ?auto_827596 ?auto_827597 ) ( ON ?auto_827595 ?auto_827596 ) ( CLEAR ?auto_827595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_827595 )
      ( MAKE-18PILE ?auto_827595 ?auto_827596 ?auto_827597 ?auto_827598 ?auto_827599 ?auto_827600 ?auto_827601 ?auto_827602 ?auto_827603 ?auto_827604 ?auto_827605 ?auto_827606 ?auto_827607 ?auto_827608 ?auto_827609 ?auto_827610 ?auto_827611 ?auto_827612 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_827631 - BLOCK
      ?auto_827632 - BLOCK
      ?auto_827633 - BLOCK
      ?auto_827634 - BLOCK
      ?auto_827635 - BLOCK
      ?auto_827636 - BLOCK
      ?auto_827637 - BLOCK
      ?auto_827638 - BLOCK
      ?auto_827639 - BLOCK
      ?auto_827640 - BLOCK
      ?auto_827641 - BLOCK
      ?auto_827642 - BLOCK
      ?auto_827643 - BLOCK
      ?auto_827644 - BLOCK
      ?auto_827645 - BLOCK
      ?auto_827646 - BLOCK
      ?auto_827647 - BLOCK
      ?auto_827648 - BLOCK
    )
    :vars
    (
      ?auto_827649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_827631 ?auto_827632 ) ) ( not ( = ?auto_827631 ?auto_827633 ) ) ( not ( = ?auto_827631 ?auto_827634 ) ) ( not ( = ?auto_827631 ?auto_827635 ) ) ( not ( = ?auto_827631 ?auto_827636 ) ) ( not ( = ?auto_827631 ?auto_827637 ) ) ( not ( = ?auto_827631 ?auto_827638 ) ) ( not ( = ?auto_827631 ?auto_827639 ) ) ( not ( = ?auto_827631 ?auto_827640 ) ) ( not ( = ?auto_827631 ?auto_827641 ) ) ( not ( = ?auto_827631 ?auto_827642 ) ) ( not ( = ?auto_827631 ?auto_827643 ) ) ( not ( = ?auto_827631 ?auto_827644 ) ) ( not ( = ?auto_827631 ?auto_827645 ) ) ( not ( = ?auto_827631 ?auto_827646 ) ) ( not ( = ?auto_827631 ?auto_827647 ) ) ( not ( = ?auto_827631 ?auto_827648 ) ) ( not ( = ?auto_827632 ?auto_827633 ) ) ( not ( = ?auto_827632 ?auto_827634 ) ) ( not ( = ?auto_827632 ?auto_827635 ) ) ( not ( = ?auto_827632 ?auto_827636 ) ) ( not ( = ?auto_827632 ?auto_827637 ) ) ( not ( = ?auto_827632 ?auto_827638 ) ) ( not ( = ?auto_827632 ?auto_827639 ) ) ( not ( = ?auto_827632 ?auto_827640 ) ) ( not ( = ?auto_827632 ?auto_827641 ) ) ( not ( = ?auto_827632 ?auto_827642 ) ) ( not ( = ?auto_827632 ?auto_827643 ) ) ( not ( = ?auto_827632 ?auto_827644 ) ) ( not ( = ?auto_827632 ?auto_827645 ) ) ( not ( = ?auto_827632 ?auto_827646 ) ) ( not ( = ?auto_827632 ?auto_827647 ) ) ( not ( = ?auto_827632 ?auto_827648 ) ) ( not ( = ?auto_827633 ?auto_827634 ) ) ( not ( = ?auto_827633 ?auto_827635 ) ) ( not ( = ?auto_827633 ?auto_827636 ) ) ( not ( = ?auto_827633 ?auto_827637 ) ) ( not ( = ?auto_827633 ?auto_827638 ) ) ( not ( = ?auto_827633 ?auto_827639 ) ) ( not ( = ?auto_827633 ?auto_827640 ) ) ( not ( = ?auto_827633 ?auto_827641 ) ) ( not ( = ?auto_827633 ?auto_827642 ) ) ( not ( = ?auto_827633 ?auto_827643 ) ) ( not ( = ?auto_827633 ?auto_827644 ) ) ( not ( = ?auto_827633 ?auto_827645 ) ) ( not ( = ?auto_827633 ?auto_827646 ) ) ( not ( = ?auto_827633 ?auto_827647 ) ) ( not ( = ?auto_827633 ?auto_827648 ) ) ( not ( = ?auto_827634 ?auto_827635 ) ) ( not ( = ?auto_827634 ?auto_827636 ) ) ( not ( = ?auto_827634 ?auto_827637 ) ) ( not ( = ?auto_827634 ?auto_827638 ) ) ( not ( = ?auto_827634 ?auto_827639 ) ) ( not ( = ?auto_827634 ?auto_827640 ) ) ( not ( = ?auto_827634 ?auto_827641 ) ) ( not ( = ?auto_827634 ?auto_827642 ) ) ( not ( = ?auto_827634 ?auto_827643 ) ) ( not ( = ?auto_827634 ?auto_827644 ) ) ( not ( = ?auto_827634 ?auto_827645 ) ) ( not ( = ?auto_827634 ?auto_827646 ) ) ( not ( = ?auto_827634 ?auto_827647 ) ) ( not ( = ?auto_827634 ?auto_827648 ) ) ( not ( = ?auto_827635 ?auto_827636 ) ) ( not ( = ?auto_827635 ?auto_827637 ) ) ( not ( = ?auto_827635 ?auto_827638 ) ) ( not ( = ?auto_827635 ?auto_827639 ) ) ( not ( = ?auto_827635 ?auto_827640 ) ) ( not ( = ?auto_827635 ?auto_827641 ) ) ( not ( = ?auto_827635 ?auto_827642 ) ) ( not ( = ?auto_827635 ?auto_827643 ) ) ( not ( = ?auto_827635 ?auto_827644 ) ) ( not ( = ?auto_827635 ?auto_827645 ) ) ( not ( = ?auto_827635 ?auto_827646 ) ) ( not ( = ?auto_827635 ?auto_827647 ) ) ( not ( = ?auto_827635 ?auto_827648 ) ) ( not ( = ?auto_827636 ?auto_827637 ) ) ( not ( = ?auto_827636 ?auto_827638 ) ) ( not ( = ?auto_827636 ?auto_827639 ) ) ( not ( = ?auto_827636 ?auto_827640 ) ) ( not ( = ?auto_827636 ?auto_827641 ) ) ( not ( = ?auto_827636 ?auto_827642 ) ) ( not ( = ?auto_827636 ?auto_827643 ) ) ( not ( = ?auto_827636 ?auto_827644 ) ) ( not ( = ?auto_827636 ?auto_827645 ) ) ( not ( = ?auto_827636 ?auto_827646 ) ) ( not ( = ?auto_827636 ?auto_827647 ) ) ( not ( = ?auto_827636 ?auto_827648 ) ) ( not ( = ?auto_827637 ?auto_827638 ) ) ( not ( = ?auto_827637 ?auto_827639 ) ) ( not ( = ?auto_827637 ?auto_827640 ) ) ( not ( = ?auto_827637 ?auto_827641 ) ) ( not ( = ?auto_827637 ?auto_827642 ) ) ( not ( = ?auto_827637 ?auto_827643 ) ) ( not ( = ?auto_827637 ?auto_827644 ) ) ( not ( = ?auto_827637 ?auto_827645 ) ) ( not ( = ?auto_827637 ?auto_827646 ) ) ( not ( = ?auto_827637 ?auto_827647 ) ) ( not ( = ?auto_827637 ?auto_827648 ) ) ( not ( = ?auto_827638 ?auto_827639 ) ) ( not ( = ?auto_827638 ?auto_827640 ) ) ( not ( = ?auto_827638 ?auto_827641 ) ) ( not ( = ?auto_827638 ?auto_827642 ) ) ( not ( = ?auto_827638 ?auto_827643 ) ) ( not ( = ?auto_827638 ?auto_827644 ) ) ( not ( = ?auto_827638 ?auto_827645 ) ) ( not ( = ?auto_827638 ?auto_827646 ) ) ( not ( = ?auto_827638 ?auto_827647 ) ) ( not ( = ?auto_827638 ?auto_827648 ) ) ( not ( = ?auto_827639 ?auto_827640 ) ) ( not ( = ?auto_827639 ?auto_827641 ) ) ( not ( = ?auto_827639 ?auto_827642 ) ) ( not ( = ?auto_827639 ?auto_827643 ) ) ( not ( = ?auto_827639 ?auto_827644 ) ) ( not ( = ?auto_827639 ?auto_827645 ) ) ( not ( = ?auto_827639 ?auto_827646 ) ) ( not ( = ?auto_827639 ?auto_827647 ) ) ( not ( = ?auto_827639 ?auto_827648 ) ) ( not ( = ?auto_827640 ?auto_827641 ) ) ( not ( = ?auto_827640 ?auto_827642 ) ) ( not ( = ?auto_827640 ?auto_827643 ) ) ( not ( = ?auto_827640 ?auto_827644 ) ) ( not ( = ?auto_827640 ?auto_827645 ) ) ( not ( = ?auto_827640 ?auto_827646 ) ) ( not ( = ?auto_827640 ?auto_827647 ) ) ( not ( = ?auto_827640 ?auto_827648 ) ) ( not ( = ?auto_827641 ?auto_827642 ) ) ( not ( = ?auto_827641 ?auto_827643 ) ) ( not ( = ?auto_827641 ?auto_827644 ) ) ( not ( = ?auto_827641 ?auto_827645 ) ) ( not ( = ?auto_827641 ?auto_827646 ) ) ( not ( = ?auto_827641 ?auto_827647 ) ) ( not ( = ?auto_827641 ?auto_827648 ) ) ( not ( = ?auto_827642 ?auto_827643 ) ) ( not ( = ?auto_827642 ?auto_827644 ) ) ( not ( = ?auto_827642 ?auto_827645 ) ) ( not ( = ?auto_827642 ?auto_827646 ) ) ( not ( = ?auto_827642 ?auto_827647 ) ) ( not ( = ?auto_827642 ?auto_827648 ) ) ( not ( = ?auto_827643 ?auto_827644 ) ) ( not ( = ?auto_827643 ?auto_827645 ) ) ( not ( = ?auto_827643 ?auto_827646 ) ) ( not ( = ?auto_827643 ?auto_827647 ) ) ( not ( = ?auto_827643 ?auto_827648 ) ) ( not ( = ?auto_827644 ?auto_827645 ) ) ( not ( = ?auto_827644 ?auto_827646 ) ) ( not ( = ?auto_827644 ?auto_827647 ) ) ( not ( = ?auto_827644 ?auto_827648 ) ) ( not ( = ?auto_827645 ?auto_827646 ) ) ( not ( = ?auto_827645 ?auto_827647 ) ) ( not ( = ?auto_827645 ?auto_827648 ) ) ( not ( = ?auto_827646 ?auto_827647 ) ) ( not ( = ?auto_827646 ?auto_827648 ) ) ( not ( = ?auto_827647 ?auto_827648 ) ) ( ON ?auto_827631 ?auto_827649 ) ( not ( = ?auto_827648 ?auto_827649 ) ) ( not ( = ?auto_827647 ?auto_827649 ) ) ( not ( = ?auto_827646 ?auto_827649 ) ) ( not ( = ?auto_827645 ?auto_827649 ) ) ( not ( = ?auto_827644 ?auto_827649 ) ) ( not ( = ?auto_827643 ?auto_827649 ) ) ( not ( = ?auto_827642 ?auto_827649 ) ) ( not ( = ?auto_827641 ?auto_827649 ) ) ( not ( = ?auto_827640 ?auto_827649 ) ) ( not ( = ?auto_827639 ?auto_827649 ) ) ( not ( = ?auto_827638 ?auto_827649 ) ) ( not ( = ?auto_827637 ?auto_827649 ) ) ( not ( = ?auto_827636 ?auto_827649 ) ) ( not ( = ?auto_827635 ?auto_827649 ) ) ( not ( = ?auto_827634 ?auto_827649 ) ) ( not ( = ?auto_827633 ?auto_827649 ) ) ( not ( = ?auto_827632 ?auto_827649 ) ) ( not ( = ?auto_827631 ?auto_827649 ) ) ( ON ?auto_827632 ?auto_827631 ) ( ON ?auto_827633 ?auto_827632 ) ( ON ?auto_827634 ?auto_827633 ) ( ON ?auto_827635 ?auto_827634 ) ( ON ?auto_827636 ?auto_827635 ) ( ON ?auto_827637 ?auto_827636 ) ( ON ?auto_827638 ?auto_827637 ) ( ON ?auto_827639 ?auto_827638 ) ( ON ?auto_827640 ?auto_827639 ) ( ON ?auto_827641 ?auto_827640 ) ( ON ?auto_827642 ?auto_827641 ) ( ON ?auto_827643 ?auto_827642 ) ( ON ?auto_827644 ?auto_827643 ) ( ON ?auto_827645 ?auto_827644 ) ( ON ?auto_827646 ?auto_827645 ) ( ON ?auto_827647 ?auto_827646 ) ( ON ?auto_827648 ?auto_827647 ) ( CLEAR ?auto_827648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_827648 ?auto_827647 ?auto_827646 ?auto_827645 ?auto_827644 ?auto_827643 ?auto_827642 ?auto_827641 ?auto_827640 ?auto_827639 ?auto_827638 ?auto_827637 ?auto_827636 ?auto_827635 ?auto_827634 ?auto_827633 ?auto_827632 ?auto_827631 )
      ( MAKE-18PILE ?auto_827631 ?auto_827632 ?auto_827633 ?auto_827634 ?auto_827635 ?auto_827636 ?auto_827637 ?auto_827638 ?auto_827639 ?auto_827640 ?auto_827641 ?auto_827642 ?auto_827643 ?auto_827644 ?auto_827645 ?auto_827646 ?auto_827647 ?auto_827648 ) )
  )

)

