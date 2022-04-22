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
      ?auto_17888 - BLOCK
    )
    :vars
    (
      ?auto_17889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17888 ?auto_17889 ) ( CLEAR ?auto_17888 ) ( HAND-EMPTY ) ( not ( = ?auto_17888 ?auto_17889 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17888 ?auto_17889 )
      ( !PUTDOWN ?auto_17888 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17895 - BLOCK
      ?auto_17896 - BLOCK
    )
    :vars
    (
      ?auto_17897 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17895 ) ( ON ?auto_17896 ?auto_17897 ) ( CLEAR ?auto_17896 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17895 ) ( not ( = ?auto_17895 ?auto_17896 ) ) ( not ( = ?auto_17895 ?auto_17897 ) ) ( not ( = ?auto_17896 ?auto_17897 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17896 ?auto_17897 )
      ( !STACK ?auto_17896 ?auto_17895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17905 - BLOCK
      ?auto_17906 - BLOCK
    )
    :vars
    (
      ?auto_17907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17906 ?auto_17907 ) ( not ( = ?auto_17905 ?auto_17906 ) ) ( not ( = ?auto_17905 ?auto_17907 ) ) ( not ( = ?auto_17906 ?auto_17907 ) ) ( ON ?auto_17905 ?auto_17906 ) ( CLEAR ?auto_17905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17905 )
      ( MAKE-2PILE ?auto_17905 ?auto_17906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17916 - BLOCK
      ?auto_17917 - BLOCK
      ?auto_17918 - BLOCK
    )
    :vars
    (
      ?auto_17919 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17917 ) ( ON ?auto_17918 ?auto_17919 ) ( CLEAR ?auto_17918 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17916 ) ( ON ?auto_17917 ?auto_17916 ) ( not ( = ?auto_17916 ?auto_17917 ) ) ( not ( = ?auto_17916 ?auto_17918 ) ) ( not ( = ?auto_17916 ?auto_17919 ) ) ( not ( = ?auto_17917 ?auto_17918 ) ) ( not ( = ?auto_17917 ?auto_17919 ) ) ( not ( = ?auto_17918 ?auto_17919 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17918 ?auto_17919 )
      ( !STACK ?auto_17918 ?auto_17917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17930 - BLOCK
      ?auto_17931 - BLOCK
      ?auto_17932 - BLOCK
    )
    :vars
    (
      ?auto_17933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17932 ?auto_17933 ) ( ON-TABLE ?auto_17930 ) ( not ( = ?auto_17930 ?auto_17931 ) ) ( not ( = ?auto_17930 ?auto_17932 ) ) ( not ( = ?auto_17930 ?auto_17933 ) ) ( not ( = ?auto_17931 ?auto_17932 ) ) ( not ( = ?auto_17931 ?auto_17933 ) ) ( not ( = ?auto_17932 ?auto_17933 ) ) ( CLEAR ?auto_17930 ) ( ON ?auto_17931 ?auto_17932 ) ( CLEAR ?auto_17931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17930 ?auto_17931 )
      ( MAKE-3PILE ?auto_17930 ?auto_17931 ?auto_17932 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_17944 - BLOCK
      ?auto_17945 - BLOCK
      ?auto_17946 - BLOCK
    )
    :vars
    (
      ?auto_17947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17946 ?auto_17947 ) ( not ( = ?auto_17944 ?auto_17945 ) ) ( not ( = ?auto_17944 ?auto_17946 ) ) ( not ( = ?auto_17944 ?auto_17947 ) ) ( not ( = ?auto_17945 ?auto_17946 ) ) ( not ( = ?auto_17945 ?auto_17947 ) ) ( not ( = ?auto_17946 ?auto_17947 ) ) ( ON ?auto_17945 ?auto_17946 ) ( ON ?auto_17944 ?auto_17945 ) ( CLEAR ?auto_17944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17944 )
      ( MAKE-3PILE ?auto_17944 ?auto_17945 ?auto_17946 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17959 - BLOCK
      ?auto_17960 - BLOCK
      ?auto_17961 - BLOCK
      ?auto_17962 - BLOCK
    )
    :vars
    (
      ?auto_17963 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_17961 ) ( ON ?auto_17962 ?auto_17963 ) ( CLEAR ?auto_17962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_17959 ) ( ON ?auto_17960 ?auto_17959 ) ( ON ?auto_17961 ?auto_17960 ) ( not ( = ?auto_17959 ?auto_17960 ) ) ( not ( = ?auto_17959 ?auto_17961 ) ) ( not ( = ?auto_17959 ?auto_17962 ) ) ( not ( = ?auto_17959 ?auto_17963 ) ) ( not ( = ?auto_17960 ?auto_17961 ) ) ( not ( = ?auto_17960 ?auto_17962 ) ) ( not ( = ?auto_17960 ?auto_17963 ) ) ( not ( = ?auto_17961 ?auto_17962 ) ) ( not ( = ?auto_17961 ?auto_17963 ) ) ( not ( = ?auto_17962 ?auto_17963 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_17962 ?auto_17963 )
      ( !STACK ?auto_17962 ?auto_17961 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17977 - BLOCK
      ?auto_17978 - BLOCK
      ?auto_17979 - BLOCK
      ?auto_17980 - BLOCK
    )
    :vars
    (
      ?auto_17981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17980 ?auto_17981 ) ( ON-TABLE ?auto_17977 ) ( ON ?auto_17978 ?auto_17977 ) ( not ( = ?auto_17977 ?auto_17978 ) ) ( not ( = ?auto_17977 ?auto_17979 ) ) ( not ( = ?auto_17977 ?auto_17980 ) ) ( not ( = ?auto_17977 ?auto_17981 ) ) ( not ( = ?auto_17978 ?auto_17979 ) ) ( not ( = ?auto_17978 ?auto_17980 ) ) ( not ( = ?auto_17978 ?auto_17981 ) ) ( not ( = ?auto_17979 ?auto_17980 ) ) ( not ( = ?auto_17979 ?auto_17981 ) ) ( not ( = ?auto_17980 ?auto_17981 ) ) ( CLEAR ?auto_17978 ) ( ON ?auto_17979 ?auto_17980 ) ( CLEAR ?auto_17979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_17977 ?auto_17978 ?auto_17979 )
      ( MAKE-4PILE ?auto_17977 ?auto_17978 ?auto_17979 ?auto_17980 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_17995 - BLOCK
      ?auto_17996 - BLOCK
      ?auto_17997 - BLOCK
      ?auto_17998 - BLOCK
    )
    :vars
    (
      ?auto_17999 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17998 ?auto_17999 ) ( ON-TABLE ?auto_17995 ) ( not ( = ?auto_17995 ?auto_17996 ) ) ( not ( = ?auto_17995 ?auto_17997 ) ) ( not ( = ?auto_17995 ?auto_17998 ) ) ( not ( = ?auto_17995 ?auto_17999 ) ) ( not ( = ?auto_17996 ?auto_17997 ) ) ( not ( = ?auto_17996 ?auto_17998 ) ) ( not ( = ?auto_17996 ?auto_17999 ) ) ( not ( = ?auto_17997 ?auto_17998 ) ) ( not ( = ?auto_17997 ?auto_17999 ) ) ( not ( = ?auto_17998 ?auto_17999 ) ) ( ON ?auto_17997 ?auto_17998 ) ( CLEAR ?auto_17995 ) ( ON ?auto_17996 ?auto_17997 ) ( CLEAR ?auto_17996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17995 ?auto_17996 )
      ( MAKE-4PILE ?auto_17995 ?auto_17996 ?auto_17997 ?auto_17998 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_18013 - BLOCK
      ?auto_18014 - BLOCK
      ?auto_18015 - BLOCK
      ?auto_18016 - BLOCK
    )
    :vars
    (
      ?auto_18017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18016 ?auto_18017 ) ( not ( = ?auto_18013 ?auto_18014 ) ) ( not ( = ?auto_18013 ?auto_18015 ) ) ( not ( = ?auto_18013 ?auto_18016 ) ) ( not ( = ?auto_18013 ?auto_18017 ) ) ( not ( = ?auto_18014 ?auto_18015 ) ) ( not ( = ?auto_18014 ?auto_18016 ) ) ( not ( = ?auto_18014 ?auto_18017 ) ) ( not ( = ?auto_18015 ?auto_18016 ) ) ( not ( = ?auto_18015 ?auto_18017 ) ) ( not ( = ?auto_18016 ?auto_18017 ) ) ( ON ?auto_18015 ?auto_18016 ) ( ON ?auto_18014 ?auto_18015 ) ( ON ?auto_18013 ?auto_18014 ) ( CLEAR ?auto_18013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18013 )
      ( MAKE-4PILE ?auto_18013 ?auto_18014 ?auto_18015 ?auto_18016 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18032 - BLOCK
      ?auto_18033 - BLOCK
      ?auto_18034 - BLOCK
      ?auto_18035 - BLOCK
      ?auto_18036 - BLOCK
    )
    :vars
    (
      ?auto_18037 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18035 ) ( ON ?auto_18036 ?auto_18037 ) ( CLEAR ?auto_18036 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18032 ) ( ON ?auto_18033 ?auto_18032 ) ( ON ?auto_18034 ?auto_18033 ) ( ON ?auto_18035 ?auto_18034 ) ( not ( = ?auto_18032 ?auto_18033 ) ) ( not ( = ?auto_18032 ?auto_18034 ) ) ( not ( = ?auto_18032 ?auto_18035 ) ) ( not ( = ?auto_18032 ?auto_18036 ) ) ( not ( = ?auto_18032 ?auto_18037 ) ) ( not ( = ?auto_18033 ?auto_18034 ) ) ( not ( = ?auto_18033 ?auto_18035 ) ) ( not ( = ?auto_18033 ?auto_18036 ) ) ( not ( = ?auto_18033 ?auto_18037 ) ) ( not ( = ?auto_18034 ?auto_18035 ) ) ( not ( = ?auto_18034 ?auto_18036 ) ) ( not ( = ?auto_18034 ?auto_18037 ) ) ( not ( = ?auto_18035 ?auto_18036 ) ) ( not ( = ?auto_18035 ?auto_18037 ) ) ( not ( = ?auto_18036 ?auto_18037 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18036 ?auto_18037 )
      ( !STACK ?auto_18036 ?auto_18035 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18054 - BLOCK
      ?auto_18055 - BLOCK
      ?auto_18056 - BLOCK
      ?auto_18057 - BLOCK
      ?auto_18058 - BLOCK
    )
    :vars
    (
      ?auto_18059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18058 ?auto_18059 ) ( ON-TABLE ?auto_18054 ) ( ON ?auto_18055 ?auto_18054 ) ( ON ?auto_18056 ?auto_18055 ) ( not ( = ?auto_18054 ?auto_18055 ) ) ( not ( = ?auto_18054 ?auto_18056 ) ) ( not ( = ?auto_18054 ?auto_18057 ) ) ( not ( = ?auto_18054 ?auto_18058 ) ) ( not ( = ?auto_18054 ?auto_18059 ) ) ( not ( = ?auto_18055 ?auto_18056 ) ) ( not ( = ?auto_18055 ?auto_18057 ) ) ( not ( = ?auto_18055 ?auto_18058 ) ) ( not ( = ?auto_18055 ?auto_18059 ) ) ( not ( = ?auto_18056 ?auto_18057 ) ) ( not ( = ?auto_18056 ?auto_18058 ) ) ( not ( = ?auto_18056 ?auto_18059 ) ) ( not ( = ?auto_18057 ?auto_18058 ) ) ( not ( = ?auto_18057 ?auto_18059 ) ) ( not ( = ?auto_18058 ?auto_18059 ) ) ( CLEAR ?auto_18056 ) ( ON ?auto_18057 ?auto_18058 ) ( CLEAR ?auto_18057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18054 ?auto_18055 ?auto_18056 ?auto_18057 )
      ( MAKE-5PILE ?auto_18054 ?auto_18055 ?auto_18056 ?auto_18057 ?auto_18058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18076 - BLOCK
      ?auto_18077 - BLOCK
      ?auto_18078 - BLOCK
      ?auto_18079 - BLOCK
      ?auto_18080 - BLOCK
    )
    :vars
    (
      ?auto_18081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18080 ?auto_18081 ) ( ON-TABLE ?auto_18076 ) ( ON ?auto_18077 ?auto_18076 ) ( not ( = ?auto_18076 ?auto_18077 ) ) ( not ( = ?auto_18076 ?auto_18078 ) ) ( not ( = ?auto_18076 ?auto_18079 ) ) ( not ( = ?auto_18076 ?auto_18080 ) ) ( not ( = ?auto_18076 ?auto_18081 ) ) ( not ( = ?auto_18077 ?auto_18078 ) ) ( not ( = ?auto_18077 ?auto_18079 ) ) ( not ( = ?auto_18077 ?auto_18080 ) ) ( not ( = ?auto_18077 ?auto_18081 ) ) ( not ( = ?auto_18078 ?auto_18079 ) ) ( not ( = ?auto_18078 ?auto_18080 ) ) ( not ( = ?auto_18078 ?auto_18081 ) ) ( not ( = ?auto_18079 ?auto_18080 ) ) ( not ( = ?auto_18079 ?auto_18081 ) ) ( not ( = ?auto_18080 ?auto_18081 ) ) ( ON ?auto_18079 ?auto_18080 ) ( CLEAR ?auto_18077 ) ( ON ?auto_18078 ?auto_18079 ) ( CLEAR ?auto_18078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18076 ?auto_18077 ?auto_18078 )
      ( MAKE-5PILE ?auto_18076 ?auto_18077 ?auto_18078 ?auto_18079 ?auto_18080 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18098 - BLOCK
      ?auto_18099 - BLOCK
      ?auto_18100 - BLOCK
      ?auto_18101 - BLOCK
      ?auto_18102 - BLOCK
    )
    :vars
    (
      ?auto_18103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18102 ?auto_18103 ) ( ON-TABLE ?auto_18098 ) ( not ( = ?auto_18098 ?auto_18099 ) ) ( not ( = ?auto_18098 ?auto_18100 ) ) ( not ( = ?auto_18098 ?auto_18101 ) ) ( not ( = ?auto_18098 ?auto_18102 ) ) ( not ( = ?auto_18098 ?auto_18103 ) ) ( not ( = ?auto_18099 ?auto_18100 ) ) ( not ( = ?auto_18099 ?auto_18101 ) ) ( not ( = ?auto_18099 ?auto_18102 ) ) ( not ( = ?auto_18099 ?auto_18103 ) ) ( not ( = ?auto_18100 ?auto_18101 ) ) ( not ( = ?auto_18100 ?auto_18102 ) ) ( not ( = ?auto_18100 ?auto_18103 ) ) ( not ( = ?auto_18101 ?auto_18102 ) ) ( not ( = ?auto_18101 ?auto_18103 ) ) ( not ( = ?auto_18102 ?auto_18103 ) ) ( ON ?auto_18101 ?auto_18102 ) ( ON ?auto_18100 ?auto_18101 ) ( CLEAR ?auto_18098 ) ( ON ?auto_18099 ?auto_18100 ) ( CLEAR ?auto_18099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18098 ?auto_18099 )
      ( MAKE-5PILE ?auto_18098 ?auto_18099 ?auto_18100 ?auto_18101 ?auto_18102 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_18120 - BLOCK
      ?auto_18121 - BLOCK
      ?auto_18122 - BLOCK
      ?auto_18123 - BLOCK
      ?auto_18124 - BLOCK
    )
    :vars
    (
      ?auto_18125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18124 ?auto_18125 ) ( not ( = ?auto_18120 ?auto_18121 ) ) ( not ( = ?auto_18120 ?auto_18122 ) ) ( not ( = ?auto_18120 ?auto_18123 ) ) ( not ( = ?auto_18120 ?auto_18124 ) ) ( not ( = ?auto_18120 ?auto_18125 ) ) ( not ( = ?auto_18121 ?auto_18122 ) ) ( not ( = ?auto_18121 ?auto_18123 ) ) ( not ( = ?auto_18121 ?auto_18124 ) ) ( not ( = ?auto_18121 ?auto_18125 ) ) ( not ( = ?auto_18122 ?auto_18123 ) ) ( not ( = ?auto_18122 ?auto_18124 ) ) ( not ( = ?auto_18122 ?auto_18125 ) ) ( not ( = ?auto_18123 ?auto_18124 ) ) ( not ( = ?auto_18123 ?auto_18125 ) ) ( not ( = ?auto_18124 ?auto_18125 ) ) ( ON ?auto_18123 ?auto_18124 ) ( ON ?auto_18122 ?auto_18123 ) ( ON ?auto_18121 ?auto_18122 ) ( ON ?auto_18120 ?auto_18121 ) ( CLEAR ?auto_18120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18120 )
      ( MAKE-5PILE ?auto_18120 ?auto_18121 ?auto_18122 ?auto_18123 ?auto_18124 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18143 - BLOCK
      ?auto_18144 - BLOCK
      ?auto_18145 - BLOCK
      ?auto_18146 - BLOCK
      ?auto_18147 - BLOCK
      ?auto_18148 - BLOCK
    )
    :vars
    (
      ?auto_18149 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18147 ) ( ON ?auto_18148 ?auto_18149 ) ( CLEAR ?auto_18148 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18143 ) ( ON ?auto_18144 ?auto_18143 ) ( ON ?auto_18145 ?auto_18144 ) ( ON ?auto_18146 ?auto_18145 ) ( ON ?auto_18147 ?auto_18146 ) ( not ( = ?auto_18143 ?auto_18144 ) ) ( not ( = ?auto_18143 ?auto_18145 ) ) ( not ( = ?auto_18143 ?auto_18146 ) ) ( not ( = ?auto_18143 ?auto_18147 ) ) ( not ( = ?auto_18143 ?auto_18148 ) ) ( not ( = ?auto_18143 ?auto_18149 ) ) ( not ( = ?auto_18144 ?auto_18145 ) ) ( not ( = ?auto_18144 ?auto_18146 ) ) ( not ( = ?auto_18144 ?auto_18147 ) ) ( not ( = ?auto_18144 ?auto_18148 ) ) ( not ( = ?auto_18144 ?auto_18149 ) ) ( not ( = ?auto_18145 ?auto_18146 ) ) ( not ( = ?auto_18145 ?auto_18147 ) ) ( not ( = ?auto_18145 ?auto_18148 ) ) ( not ( = ?auto_18145 ?auto_18149 ) ) ( not ( = ?auto_18146 ?auto_18147 ) ) ( not ( = ?auto_18146 ?auto_18148 ) ) ( not ( = ?auto_18146 ?auto_18149 ) ) ( not ( = ?auto_18147 ?auto_18148 ) ) ( not ( = ?auto_18147 ?auto_18149 ) ) ( not ( = ?auto_18148 ?auto_18149 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_18148 ?auto_18149 )
      ( !STACK ?auto_18148 ?auto_18147 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18156 - BLOCK
      ?auto_18157 - BLOCK
      ?auto_18158 - BLOCK
      ?auto_18159 - BLOCK
      ?auto_18160 - BLOCK
      ?auto_18161 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_18160 ) ( ON-TABLE ?auto_18161 ) ( CLEAR ?auto_18161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_18156 ) ( ON ?auto_18157 ?auto_18156 ) ( ON ?auto_18158 ?auto_18157 ) ( ON ?auto_18159 ?auto_18158 ) ( ON ?auto_18160 ?auto_18159 ) ( not ( = ?auto_18156 ?auto_18157 ) ) ( not ( = ?auto_18156 ?auto_18158 ) ) ( not ( = ?auto_18156 ?auto_18159 ) ) ( not ( = ?auto_18156 ?auto_18160 ) ) ( not ( = ?auto_18156 ?auto_18161 ) ) ( not ( = ?auto_18157 ?auto_18158 ) ) ( not ( = ?auto_18157 ?auto_18159 ) ) ( not ( = ?auto_18157 ?auto_18160 ) ) ( not ( = ?auto_18157 ?auto_18161 ) ) ( not ( = ?auto_18158 ?auto_18159 ) ) ( not ( = ?auto_18158 ?auto_18160 ) ) ( not ( = ?auto_18158 ?auto_18161 ) ) ( not ( = ?auto_18159 ?auto_18160 ) ) ( not ( = ?auto_18159 ?auto_18161 ) ) ( not ( = ?auto_18160 ?auto_18161 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_18161 )
      ( !STACK ?auto_18161 ?auto_18160 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18168 - BLOCK
      ?auto_18169 - BLOCK
      ?auto_18170 - BLOCK
      ?auto_18171 - BLOCK
      ?auto_18172 - BLOCK
      ?auto_18173 - BLOCK
    )
    :vars
    (
      ?auto_18174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18173 ?auto_18174 ) ( ON-TABLE ?auto_18168 ) ( ON ?auto_18169 ?auto_18168 ) ( ON ?auto_18170 ?auto_18169 ) ( ON ?auto_18171 ?auto_18170 ) ( not ( = ?auto_18168 ?auto_18169 ) ) ( not ( = ?auto_18168 ?auto_18170 ) ) ( not ( = ?auto_18168 ?auto_18171 ) ) ( not ( = ?auto_18168 ?auto_18172 ) ) ( not ( = ?auto_18168 ?auto_18173 ) ) ( not ( = ?auto_18168 ?auto_18174 ) ) ( not ( = ?auto_18169 ?auto_18170 ) ) ( not ( = ?auto_18169 ?auto_18171 ) ) ( not ( = ?auto_18169 ?auto_18172 ) ) ( not ( = ?auto_18169 ?auto_18173 ) ) ( not ( = ?auto_18169 ?auto_18174 ) ) ( not ( = ?auto_18170 ?auto_18171 ) ) ( not ( = ?auto_18170 ?auto_18172 ) ) ( not ( = ?auto_18170 ?auto_18173 ) ) ( not ( = ?auto_18170 ?auto_18174 ) ) ( not ( = ?auto_18171 ?auto_18172 ) ) ( not ( = ?auto_18171 ?auto_18173 ) ) ( not ( = ?auto_18171 ?auto_18174 ) ) ( not ( = ?auto_18172 ?auto_18173 ) ) ( not ( = ?auto_18172 ?auto_18174 ) ) ( not ( = ?auto_18173 ?auto_18174 ) ) ( CLEAR ?auto_18171 ) ( ON ?auto_18172 ?auto_18173 ) ( CLEAR ?auto_18172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18168 ?auto_18169 ?auto_18170 ?auto_18171 ?auto_18172 )
      ( MAKE-6PILE ?auto_18168 ?auto_18169 ?auto_18170 ?auto_18171 ?auto_18172 ?auto_18173 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18181 - BLOCK
      ?auto_18182 - BLOCK
      ?auto_18183 - BLOCK
      ?auto_18184 - BLOCK
      ?auto_18185 - BLOCK
      ?auto_18186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18186 ) ( ON-TABLE ?auto_18181 ) ( ON ?auto_18182 ?auto_18181 ) ( ON ?auto_18183 ?auto_18182 ) ( ON ?auto_18184 ?auto_18183 ) ( not ( = ?auto_18181 ?auto_18182 ) ) ( not ( = ?auto_18181 ?auto_18183 ) ) ( not ( = ?auto_18181 ?auto_18184 ) ) ( not ( = ?auto_18181 ?auto_18185 ) ) ( not ( = ?auto_18181 ?auto_18186 ) ) ( not ( = ?auto_18182 ?auto_18183 ) ) ( not ( = ?auto_18182 ?auto_18184 ) ) ( not ( = ?auto_18182 ?auto_18185 ) ) ( not ( = ?auto_18182 ?auto_18186 ) ) ( not ( = ?auto_18183 ?auto_18184 ) ) ( not ( = ?auto_18183 ?auto_18185 ) ) ( not ( = ?auto_18183 ?auto_18186 ) ) ( not ( = ?auto_18184 ?auto_18185 ) ) ( not ( = ?auto_18184 ?auto_18186 ) ) ( not ( = ?auto_18185 ?auto_18186 ) ) ( CLEAR ?auto_18184 ) ( ON ?auto_18185 ?auto_18186 ) ( CLEAR ?auto_18185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_18181 ?auto_18182 ?auto_18183 ?auto_18184 ?auto_18185 )
      ( MAKE-6PILE ?auto_18181 ?auto_18182 ?auto_18183 ?auto_18184 ?auto_18185 ?auto_18186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18193 - BLOCK
      ?auto_18194 - BLOCK
      ?auto_18195 - BLOCK
      ?auto_18196 - BLOCK
      ?auto_18197 - BLOCK
      ?auto_18198 - BLOCK
    )
    :vars
    (
      ?auto_18199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18198 ?auto_18199 ) ( ON-TABLE ?auto_18193 ) ( ON ?auto_18194 ?auto_18193 ) ( ON ?auto_18195 ?auto_18194 ) ( not ( = ?auto_18193 ?auto_18194 ) ) ( not ( = ?auto_18193 ?auto_18195 ) ) ( not ( = ?auto_18193 ?auto_18196 ) ) ( not ( = ?auto_18193 ?auto_18197 ) ) ( not ( = ?auto_18193 ?auto_18198 ) ) ( not ( = ?auto_18193 ?auto_18199 ) ) ( not ( = ?auto_18194 ?auto_18195 ) ) ( not ( = ?auto_18194 ?auto_18196 ) ) ( not ( = ?auto_18194 ?auto_18197 ) ) ( not ( = ?auto_18194 ?auto_18198 ) ) ( not ( = ?auto_18194 ?auto_18199 ) ) ( not ( = ?auto_18195 ?auto_18196 ) ) ( not ( = ?auto_18195 ?auto_18197 ) ) ( not ( = ?auto_18195 ?auto_18198 ) ) ( not ( = ?auto_18195 ?auto_18199 ) ) ( not ( = ?auto_18196 ?auto_18197 ) ) ( not ( = ?auto_18196 ?auto_18198 ) ) ( not ( = ?auto_18196 ?auto_18199 ) ) ( not ( = ?auto_18197 ?auto_18198 ) ) ( not ( = ?auto_18197 ?auto_18199 ) ) ( not ( = ?auto_18198 ?auto_18199 ) ) ( ON ?auto_18197 ?auto_18198 ) ( CLEAR ?auto_18195 ) ( ON ?auto_18196 ?auto_18197 ) ( CLEAR ?auto_18196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18193 ?auto_18194 ?auto_18195 ?auto_18196 )
      ( MAKE-6PILE ?auto_18193 ?auto_18194 ?auto_18195 ?auto_18196 ?auto_18197 ?auto_18198 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18206 - BLOCK
      ?auto_18207 - BLOCK
      ?auto_18208 - BLOCK
      ?auto_18209 - BLOCK
      ?auto_18210 - BLOCK
      ?auto_18211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18211 ) ( ON-TABLE ?auto_18206 ) ( ON ?auto_18207 ?auto_18206 ) ( ON ?auto_18208 ?auto_18207 ) ( not ( = ?auto_18206 ?auto_18207 ) ) ( not ( = ?auto_18206 ?auto_18208 ) ) ( not ( = ?auto_18206 ?auto_18209 ) ) ( not ( = ?auto_18206 ?auto_18210 ) ) ( not ( = ?auto_18206 ?auto_18211 ) ) ( not ( = ?auto_18207 ?auto_18208 ) ) ( not ( = ?auto_18207 ?auto_18209 ) ) ( not ( = ?auto_18207 ?auto_18210 ) ) ( not ( = ?auto_18207 ?auto_18211 ) ) ( not ( = ?auto_18208 ?auto_18209 ) ) ( not ( = ?auto_18208 ?auto_18210 ) ) ( not ( = ?auto_18208 ?auto_18211 ) ) ( not ( = ?auto_18209 ?auto_18210 ) ) ( not ( = ?auto_18209 ?auto_18211 ) ) ( not ( = ?auto_18210 ?auto_18211 ) ) ( ON ?auto_18210 ?auto_18211 ) ( CLEAR ?auto_18208 ) ( ON ?auto_18209 ?auto_18210 ) ( CLEAR ?auto_18209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_18206 ?auto_18207 ?auto_18208 ?auto_18209 )
      ( MAKE-6PILE ?auto_18206 ?auto_18207 ?auto_18208 ?auto_18209 ?auto_18210 ?auto_18211 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18218 - BLOCK
      ?auto_18219 - BLOCK
      ?auto_18220 - BLOCK
      ?auto_18221 - BLOCK
      ?auto_18222 - BLOCK
      ?auto_18223 - BLOCK
    )
    :vars
    (
      ?auto_18224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18223 ?auto_18224 ) ( ON-TABLE ?auto_18218 ) ( ON ?auto_18219 ?auto_18218 ) ( not ( = ?auto_18218 ?auto_18219 ) ) ( not ( = ?auto_18218 ?auto_18220 ) ) ( not ( = ?auto_18218 ?auto_18221 ) ) ( not ( = ?auto_18218 ?auto_18222 ) ) ( not ( = ?auto_18218 ?auto_18223 ) ) ( not ( = ?auto_18218 ?auto_18224 ) ) ( not ( = ?auto_18219 ?auto_18220 ) ) ( not ( = ?auto_18219 ?auto_18221 ) ) ( not ( = ?auto_18219 ?auto_18222 ) ) ( not ( = ?auto_18219 ?auto_18223 ) ) ( not ( = ?auto_18219 ?auto_18224 ) ) ( not ( = ?auto_18220 ?auto_18221 ) ) ( not ( = ?auto_18220 ?auto_18222 ) ) ( not ( = ?auto_18220 ?auto_18223 ) ) ( not ( = ?auto_18220 ?auto_18224 ) ) ( not ( = ?auto_18221 ?auto_18222 ) ) ( not ( = ?auto_18221 ?auto_18223 ) ) ( not ( = ?auto_18221 ?auto_18224 ) ) ( not ( = ?auto_18222 ?auto_18223 ) ) ( not ( = ?auto_18222 ?auto_18224 ) ) ( not ( = ?auto_18223 ?auto_18224 ) ) ( ON ?auto_18222 ?auto_18223 ) ( ON ?auto_18221 ?auto_18222 ) ( CLEAR ?auto_18219 ) ( ON ?auto_18220 ?auto_18221 ) ( CLEAR ?auto_18220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18218 ?auto_18219 ?auto_18220 )
      ( MAKE-6PILE ?auto_18218 ?auto_18219 ?auto_18220 ?auto_18221 ?auto_18222 ?auto_18223 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18231 - BLOCK
      ?auto_18232 - BLOCK
      ?auto_18233 - BLOCK
      ?auto_18234 - BLOCK
      ?auto_18235 - BLOCK
      ?auto_18236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18236 ) ( ON-TABLE ?auto_18231 ) ( ON ?auto_18232 ?auto_18231 ) ( not ( = ?auto_18231 ?auto_18232 ) ) ( not ( = ?auto_18231 ?auto_18233 ) ) ( not ( = ?auto_18231 ?auto_18234 ) ) ( not ( = ?auto_18231 ?auto_18235 ) ) ( not ( = ?auto_18231 ?auto_18236 ) ) ( not ( = ?auto_18232 ?auto_18233 ) ) ( not ( = ?auto_18232 ?auto_18234 ) ) ( not ( = ?auto_18232 ?auto_18235 ) ) ( not ( = ?auto_18232 ?auto_18236 ) ) ( not ( = ?auto_18233 ?auto_18234 ) ) ( not ( = ?auto_18233 ?auto_18235 ) ) ( not ( = ?auto_18233 ?auto_18236 ) ) ( not ( = ?auto_18234 ?auto_18235 ) ) ( not ( = ?auto_18234 ?auto_18236 ) ) ( not ( = ?auto_18235 ?auto_18236 ) ) ( ON ?auto_18235 ?auto_18236 ) ( ON ?auto_18234 ?auto_18235 ) ( CLEAR ?auto_18232 ) ( ON ?auto_18233 ?auto_18234 ) ( CLEAR ?auto_18233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_18231 ?auto_18232 ?auto_18233 )
      ( MAKE-6PILE ?auto_18231 ?auto_18232 ?auto_18233 ?auto_18234 ?auto_18235 ?auto_18236 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18243 - BLOCK
      ?auto_18244 - BLOCK
      ?auto_18245 - BLOCK
      ?auto_18246 - BLOCK
      ?auto_18247 - BLOCK
      ?auto_18248 - BLOCK
    )
    :vars
    (
      ?auto_18249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18248 ?auto_18249 ) ( ON-TABLE ?auto_18243 ) ( not ( = ?auto_18243 ?auto_18244 ) ) ( not ( = ?auto_18243 ?auto_18245 ) ) ( not ( = ?auto_18243 ?auto_18246 ) ) ( not ( = ?auto_18243 ?auto_18247 ) ) ( not ( = ?auto_18243 ?auto_18248 ) ) ( not ( = ?auto_18243 ?auto_18249 ) ) ( not ( = ?auto_18244 ?auto_18245 ) ) ( not ( = ?auto_18244 ?auto_18246 ) ) ( not ( = ?auto_18244 ?auto_18247 ) ) ( not ( = ?auto_18244 ?auto_18248 ) ) ( not ( = ?auto_18244 ?auto_18249 ) ) ( not ( = ?auto_18245 ?auto_18246 ) ) ( not ( = ?auto_18245 ?auto_18247 ) ) ( not ( = ?auto_18245 ?auto_18248 ) ) ( not ( = ?auto_18245 ?auto_18249 ) ) ( not ( = ?auto_18246 ?auto_18247 ) ) ( not ( = ?auto_18246 ?auto_18248 ) ) ( not ( = ?auto_18246 ?auto_18249 ) ) ( not ( = ?auto_18247 ?auto_18248 ) ) ( not ( = ?auto_18247 ?auto_18249 ) ) ( not ( = ?auto_18248 ?auto_18249 ) ) ( ON ?auto_18247 ?auto_18248 ) ( ON ?auto_18246 ?auto_18247 ) ( ON ?auto_18245 ?auto_18246 ) ( CLEAR ?auto_18243 ) ( ON ?auto_18244 ?auto_18245 ) ( CLEAR ?auto_18244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18243 ?auto_18244 )
      ( MAKE-6PILE ?auto_18243 ?auto_18244 ?auto_18245 ?auto_18246 ?auto_18247 ?auto_18248 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18256 - BLOCK
      ?auto_18257 - BLOCK
      ?auto_18258 - BLOCK
      ?auto_18259 - BLOCK
      ?auto_18260 - BLOCK
      ?auto_18261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18261 ) ( ON-TABLE ?auto_18256 ) ( not ( = ?auto_18256 ?auto_18257 ) ) ( not ( = ?auto_18256 ?auto_18258 ) ) ( not ( = ?auto_18256 ?auto_18259 ) ) ( not ( = ?auto_18256 ?auto_18260 ) ) ( not ( = ?auto_18256 ?auto_18261 ) ) ( not ( = ?auto_18257 ?auto_18258 ) ) ( not ( = ?auto_18257 ?auto_18259 ) ) ( not ( = ?auto_18257 ?auto_18260 ) ) ( not ( = ?auto_18257 ?auto_18261 ) ) ( not ( = ?auto_18258 ?auto_18259 ) ) ( not ( = ?auto_18258 ?auto_18260 ) ) ( not ( = ?auto_18258 ?auto_18261 ) ) ( not ( = ?auto_18259 ?auto_18260 ) ) ( not ( = ?auto_18259 ?auto_18261 ) ) ( not ( = ?auto_18260 ?auto_18261 ) ) ( ON ?auto_18260 ?auto_18261 ) ( ON ?auto_18259 ?auto_18260 ) ( ON ?auto_18258 ?auto_18259 ) ( CLEAR ?auto_18256 ) ( ON ?auto_18257 ?auto_18258 ) ( CLEAR ?auto_18257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_18256 ?auto_18257 )
      ( MAKE-6PILE ?auto_18256 ?auto_18257 ?auto_18258 ?auto_18259 ?auto_18260 ?auto_18261 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18268 - BLOCK
      ?auto_18269 - BLOCK
      ?auto_18270 - BLOCK
      ?auto_18271 - BLOCK
      ?auto_18272 - BLOCK
      ?auto_18273 - BLOCK
    )
    :vars
    (
      ?auto_18274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18273 ?auto_18274 ) ( not ( = ?auto_18268 ?auto_18269 ) ) ( not ( = ?auto_18268 ?auto_18270 ) ) ( not ( = ?auto_18268 ?auto_18271 ) ) ( not ( = ?auto_18268 ?auto_18272 ) ) ( not ( = ?auto_18268 ?auto_18273 ) ) ( not ( = ?auto_18268 ?auto_18274 ) ) ( not ( = ?auto_18269 ?auto_18270 ) ) ( not ( = ?auto_18269 ?auto_18271 ) ) ( not ( = ?auto_18269 ?auto_18272 ) ) ( not ( = ?auto_18269 ?auto_18273 ) ) ( not ( = ?auto_18269 ?auto_18274 ) ) ( not ( = ?auto_18270 ?auto_18271 ) ) ( not ( = ?auto_18270 ?auto_18272 ) ) ( not ( = ?auto_18270 ?auto_18273 ) ) ( not ( = ?auto_18270 ?auto_18274 ) ) ( not ( = ?auto_18271 ?auto_18272 ) ) ( not ( = ?auto_18271 ?auto_18273 ) ) ( not ( = ?auto_18271 ?auto_18274 ) ) ( not ( = ?auto_18272 ?auto_18273 ) ) ( not ( = ?auto_18272 ?auto_18274 ) ) ( not ( = ?auto_18273 ?auto_18274 ) ) ( ON ?auto_18272 ?auto_18273 ) ( ON ?auto_18271 ?auto_18272 ) ( ON ?auto_18270 ?auto_18271 ) ( ON ?auto_18269 ?auto_18270 ) ( ON ?auto_18268 ?auto_18269 ) ( CLEAR ?auto_18268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18268 )
      ( MAKE-6PILE ?auto_18268 ?auto_18269 ?auto_18270 ?auto_18271 ?auto_18272 ?auto_18273 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18281 - BLOCK
      ?auto_18282 - BLOCK
      ?auto_18283 - BLOCK
      ?auto_18284 - BLOCK
      ?auto_18285 - BLOCK
      ?auto_18286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_18286 ) ( not ( = ?auto_18281 ?auto_18282 ) ) ( not ( = ?auto_18281 ?auto_18283 ) ) ( not ( = ?auto_18281 ?auto_18284 ) ) ( not ( = ?auto_18281 ?auto_18285 ) ) ( not ( = ?auto_18281 ?auto_18286 ) ) ( not ( = ?auto_18282 ?auto_18283 ) ) ( not ( = ?auto_18282 ?auto_18284 ) ) ( not ( = ?auto_18282 ?auto_18285 ) ) ( not ( = ?auto_18282 ?auto_18286 ) ) ( not ( = ?auto_18283 ?auto_18284 ) ) ( not ( = ?auto_18283 ?auto_18285 ) ) ( not ( = ?auto_18283 ?auto_18286 ) ) ( not ( = ?auto_18284 ?auto_18285 ) ) ( not ( = ?auto_18284 ?auto_18286 ) ) ( not ( = ?auto_18285 ?auto_18286 ) ) ( ON ?auto_18285 ?auto_18286 ) ( ON ?auto_18284 ?auto_18285 ) ( ON ?auto_18283 ?auto_18284 ) ( ON ?auto_18282 ?auto_18283 ) ( ON ?auto_18281 ?auto_18282 ) ( CLEAR ?auto_18281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_18281 )
      ( MAKE-6PILE ?auto_18281 ?auto_18282 ?auto_18283 ?auto_18284 ?auto_18285 ?auto_18286 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_18293 - BLOCK
      ?auto_18294 - BLOCK
      ?auto_18295 - BLOCK
      ?auto_18296 - BLOCK
      ?auto_18297 - BLOCK
      ?auto_18298 - BLOCK
    )
    :vars
    (
      ?auto_18299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_18293 ?auto_18294 ) ) ( not ( = ?auto_18293 ?auto_18295 ) ) ( not ( = ?auto_18293 ?auto_18296 ) ) ( not ( = ?auto_18293 ?auto_18297 ) ) ( not ( = ?auto_18293 ?auto_18298 ) ) ( not ( = ?auto_18294 ?auto_18295 ) ) ( not ( = ?auto_18294 ?auto_18296 ) ) ( not ( = ?auto_18294 ?auto_18297 ) ) ( not ( = ?auto_18294 ?auto_18298 ) ) ( not ( = ?auto_18295 ?auto_18296 ) ) ( not ( = ?auto_18295 ?auto_18297 ) ) ( not ( = ?auto_18295 ?auto_18298 ) ) ( not ( = ?auto_18296 ?auto_18297 ) ) ( not ( = ?auto_18296 ?auto_18298 ) ) ( not ( = ?auto_18297 ?auto_18298 ) ) ( ON ?auto_18293 ?auto_18299 ) ( not ( = ?auto_18298 ?auto_18299 ) ) ( not ( = ?auto_18297 ?auto_18299 ) ) ( not ( = ?auto_18296 ?auto_18299 ) ) ( not ( = ?auto_18295 ?auto_18299 ) ) ( not ( = ?auto_18294 ?auto_18299 ) ) ( not ( = ?auto_18293 ?auto_18299 ) ) ( ON ?auto_18294 ?auto_18293 ) ( ON ?auto_18295 ?auto_18294 ) ( ON ?auto_18296 ?auto_18295 ) ( ON ?auto_18297 ?auto_18296 ) ( ON ?auto_18298 ?auto_18297 ) ( CLEAR ?auto_18298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_18298 ?auto_18297 ?auto_18296 ?auto_18295 ?auto_18294 ?auto_18293 )
      ( MAKE-6PILE ?auto_18293 ?auto_18294 ?auto_18295 ?auto_18296 ?auto_18297 ?auto_18298 ) )
  )

)

