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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79057 - BLOCK
      ?auto_79058 - BLOCK
      ?auto_79059 - BLOCK
      ?auto_79060 - BLOCK
      ?auto_79061 - BLOCK
      ?auto_79062 - BLOCK
      ?auto_79063 - BLOCK
    )
    :vars
    (
      ?auto_79064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79064 ?auto_79063 ) ( CLEAR ?auto_79064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79057 ) ( ON ?auto_79058 ?auto_79057 ) ( ON ?auto_79059 ?auto_79058 ) ( ON ?auto_79060 ?auto_79059 ) ( ON ?auto_79061 ?auto_79060 ) ( ON ?auto_79062 ?auto_79061 ) ( ON ?auto_79063 ?auto_79062 ) ( not ( = ?auto_79057 ?auto_79058 ) ) ( not ( = ?auto_79057 ?auto_79059 ) ) ( not ( = ?auto_79057 ?auto_79060 ) ) ( not ( = ?auto_79057 ?auto_79061 ) ) ( not ( = ?auto_79057 ?auto_79062 ) ) ( not ( = ?auto_79057 ?auto_79063 ) ) ( not ( = ?auto_79057 ?auto_79064 ) ) ( not ( = ?auto_79058 ?auto_79059 ) ) ( not ( = ?auto_79058 ?auto_79060 ) ) ( not ( = ?auto_79058 ?auto_79061 ) ) ( not ( = ?auto_79058 ?auto_79062 ) ) ( not ( = ?auto_79058 ?auto_79063 ) ) ( not ( = ?auto_79058 ?auto_79064 ) ) ( not ( = ?auto_79059 ?auto_79060 ) ) ( not ( = ?auto_79059 ?auto_79061 ) ) ( not ( = ?auto_79059 ?auto_79062 ) ) ( not ( = ?auto_79059 ?auto_79063 ) ) ( not ( = ?auto_79059 ?auto_79064 ) ) ( not ( = ?auto_79060 ?auto_79061 ) ) ( not ( = ?auto_79060 ?auto_79062 ) ) ( not ( = ?auto_79060 ?auto_79063 ) ) ( not ( = ?auto_79060 ?auto_79064 ) ) ( not ( = ?auto_79061 ?auto_79062 ) ) ( not ( = ?auto_79061 ?auto_79063 ) ) ( not ( = ?auto_79061 ?auto_79064 ) ) ( not ( = ?auto_79062 ?auto_79063 ) ) ( not ( = ?auto_79062 ?auto_79064 ) ) ( not ( = ?auto_79063 ?auto_79064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79064 ?auto_79063 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79066 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_79066 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_79066 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79067 - BLOCK
    )
    :vars
    (
      ?auto_79068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79067 ?auto_79068 ) ( CLEAR ?auto_79067 ) ( HAND-EMPTY ) ( not ( = ?auto_79067 ?auto_79068 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79067 ?auto_79068 )
      ( MAKE-1PILE ?auto_79067 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79075 - BLOCK
      ?auto_79076 - BLOCK
      ?auto_79077 - BLOCK
      ?auto_79078 - BLOCK
      ?auto_79079 - BLOCK
      ?auto_79080 - BLOCK
    )
    :vars
    (
      ?auto_79081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79081 ?auto_79080 ) ( CLEAR ?auto_79081 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79075 ) ( ON ?auto_79076 ?auto_79075 ) ( ON ?auto_79077 ?auto_79076 ) ( ON ?auto_79078 ?auto_79077 ) ( ON ?auto_79079 ?auto_79078 ) ( ON ?auto_79080 ?auto_79079 ) ( not ( = ?auto_79075 ?auto_79076 ) ) ( not ( = ?auto_79075 ?auto_79077 ) ) ( not ( = ?auto_79075 ?auto_79078 ) ) ( not ( = ?auto_79075 ?auto_79079 ) ) ( not ( = ?auto_79075 ?auto_79080 ) ) ( not ( = ?auto_79075 ?auto_79081 ) ) ( not ( = ?auto_79076 ?auto_79077 ) ) ( not ( = ?auto_79076 ?auto_79078 ) ) ( not ( = ?auto_79076 ?auto_79079 ) ) ( not ( = ?auto_79076 ?auto_79080 ) ) ( not ( = ?auto_79076 ?auto_79081 ) ) ( not ( = ?auto_79077 ?auto_79078 ) ) ( not ( = ?auto_79077 ?auto_79079 ) ) ( not ( = ?auto_79077 ?auto_79080 ) ) ( not ( = ?auto_79077 ?auto_79081 ) ) ( not ( = ?auto_79078 ?auto_79079 ) ) ( not ( = ?auto_79078 ?auto_79080 ) ) ( not ( = ?auto_79078 ?auto_79081 ) ) ( not ( = ?auto_79079 ?auto_79080 ) ) ( not ( = ?auto_79079 ?auto_79081 ) ) ( not ( = ?auto_79080 ?auto_79081 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79081 ?auto_79080 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79082 - BLOCK
      ?auto_79083 - BLOCK
      ?auto_79084 - BLOCK
      ?auto_79085 - BLOCK
      ?auto_79086 - BLOCK
      ?auto_79087 - BLOCK
    )
    :vars
    (
      ?auto_79088 - BLOCK
      ?auto_79089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79088 ?auto_79087 ) ( CLEAR ?auto_79088 ) ( ON-TABLE ?auto_79082 ) ( ON ?auto_79083 ?auto_79082 ) ( ON ?auto_79084 ?auto_79083 ) ( ON ?auto_79085 ?auto_79084 ) ( ON ?auto_79086 ?auto_79085 ) ( ON ?auto_79087 ?auto_79086 ) ( not ( = ?auto_79082 ?auto_79083 ) ) ( not ( = ?auto_79082 ?auto_79084 ) ) ( not ( = ?auto_79082 ?auto_79085 ) ) ( not ( = ?auto_79082 ?auto_79086 ) ) ( not ( = ?auto_79082 ?auto_79087 ) ) ( not ( = ?auto_79082 ?auto_79088 ) ) ( not ( = ?auto_79083 ?auto_79084 ) ) ( not ( = ?auto_79083 ?auto_79085 ) ) ( not ( = ?auto_79083 ?auto_79086 ) ) ( not ( = ?auto_79083 ?auto_79087 ) ) ( not ( = ?auto_79083 ?auto_79088 ) ) ( not ( = ?auto_79084 ?auto_79085 ) ) ( not ( = ?auto_79084 ?auto_79086 ) ) ( not ( = ?auto_79084 ?auto_79087 ) ) ( not ( = ?auto_79084 ?auto_79088 ) ) ( not ( = ?auto_79085 ?auto_79086 ) ) ( not ( = ?auto_79085 ?auto_79087 ) ) ( not ( = ?auto_79085 ?auto_79088 ) ) ( not ( = ?auto_79086 ?auto_79087 ) ) ( not ( = ?auto_79086 ?auto_79088 ) ) ( not ( = ?auto_79087 ?auto_79088 ) ) ( HOLDING ?auto_79089 ) ( not ( = ?auto_79082 ?auto_79089 ) ) ( not ( = ?auto_79083 ?auto_79089 ) ) ( not ( = ?auto_79084 ?auto_79089 ) ) ( not ( = ?auto_79085 ?auto_79089 ) ) ( not ( = ?auto_79086 ?auto_79089 ) ) ( not ( = ?auto_79087 ?auto_79089 ) ) ( not ( = ?auto_79088 ?auto_79089 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_79089 )
      ( MAKE-6PILE ?auto_79082 ?auto_79083 ?auto_79084 ?auto_79085 ?auto_79086 ?auto_79087 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79090 - BLOCK
      ?auto_79091 - BLOCK
      ?auto_79092 - BLOCK
      ?auto_79093 - BLOCK
      ?auto_79094 - BLOCK
      ?auto_79095 - BLOCK
    )
    :vars
    (
      ?auto_79096 - BLOCK
      ?auto_79097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79096 ?auto_79095 ) ( ON-TABLE ?auto_79090 ) ( ON ?auto_79091 ?auto_79090 ) ( ON ?auto_79092 ?auto_79091 ) ( ON ?auto_79093 ?auto_79092 ) ( ON ?auto_79094 ?auto_79093 ) ( ON ?auto_79095 ?auto_79094 ) ( not ( = ?auto_79090 ?auto_79091 ) ) ( not ( = ?auto_79090 ?auto_79092 ) ) ( not ( = ?auto_79090 ?auto_79093 ) ) ( not ( = ?auto_79090 ?auto_79094 ) ) ( not ( = ?auto_79090 ?auto_79095 ) ) ( not ( = ?auto_79090 ?auto_79096 ) ) ( not ( = ?auto_79091 ?auto_79092 ) ) ( not ( = ?auto_79091 ?auto_79093 ) ) ( not ( = ?auto_79091 ?auto_79094 ) ) ( not ( = ?auto_79091 ?auto_79095 ) ) ( not ( = ?auto_79091 ?auto_79096 ) ) ( not ( = ?auto_79092 ?auto_79093 ) ) ( not ( = ?auto_79092 ?auto_79094 ) ) ( not ( = ?auto_79092 ?auto_79095 ) ) ( not ( = ?auto_79092 ?auto_79096 ) ) ( not ( = ?auto_79093 ?auto_79094 ) ) ( not ( = ?auto_79093 ?auto_79095 ) ) ( not ( = ?auto_79093 ?auto_79096 ) ) ( not ( = ?auto_79094 ?auto_79095 ) ) ( not ( = ?auto_79094 ?auto_79096 ) ) ( not ( = ?auto_79095 ?auto_79096 ) ) ( not ( = ?auto_79090 ?auto_79097 ) ) ( not ( = ?auto_79091 ?auto_79097 ) ) ( not ( = ?auto_79092 ?auto_79097 ) ) ( not ( = ?auto_79093 ?auto_79097 ) ) ( not ( = ?auto_79094 ?auto_79097 ) ) ( not ( = ?auto_79095 ?auto_79097 ) ) ( not ( = ?auto_79096 ?auto_79097 ) ) ( ON ?auto_79097 ?auto_79096 ) ( CLEAR ?auto_79097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79090 ?auto_79091 ?auto_79092 ?auto_79093 ?auto_79094 ?auto_79095 ?auto_79096 )
      ( MAKE-6PILE ?auto_79090 ?auto_79091 ?auto_79092 ?auto_79093 ?auto_79094 ?auto_79095 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79100 - BLOCK
      ?auto_79101 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_79101 ) ( CLEAR ?auto_79100 ) ( ON-TABLE ?auto_79100 ) ( not ( = ?auto_79100 ?auto_79101 ) ) )
    :subtasks
    ( ( !STACK ?auto_79101 ?auto_79100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79102 - BLOCK
      ?auto_79103 - BLOCK
    )
    :vars
    (
      ?auto_79104 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_79102 ) ( ON-TABLE ?auto_79102 ) ( not ( = ?auto_79102 ?auto_79103 ) ) ( ON ?auto_79103 ?auto_79104 ) ( CLEAR ?auto_79103 ) ( HAND-EMPTY ) ( not ( = ?auto_79102 ?auto_79104 ) ) ( not ( = ?auto_79103 ?auto_79104 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79103 ?auto_79104 )
      ( MAKE-2PILE ?auto_79102 ?auto_79103 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79105 - BLOCK
      ?auto_79106 - BLOCK
    )
    :vars
    (
      ?auto_79107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79105 ?auto_79106 ) ) ( ON ?auto_79106 ?auto_79107 ) ( CLEAR ?auto_79106 ) ( not ( = ?auto_79105 ?auto_79107 ) ) ( not ( = ?auto_79106 ?auto_79107 ) ) ( HOLDING ?auto_79105 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79105 )
      ( MAKE-2PILE ?auto_79105 ?auto_79106 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79108 - BLOCK
      ?auto_79109 - BLOCK
    )
    :vars
    (
      ?auto_79110 - BLOCK
      ?auto_79111 - BLOCK
      ?auto_79112 - BLOCK
      ?auto_79113 - BLOCK
      ?auto_79114 - BLOCK
      ?auto_79115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79108 ?auto_79109 ) ) ( ON ?auto_79109 ?auto_79110 ) ( not ( = ?auto_79108 ?auto_79110 ) ) ( not ( = ?auto_79109 ?auto_79110 ) ) ( ON ?auto_79108 ?auto_79109 ) ( CLEAR ?auto_79108 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79111 ) ( ON ?auto_79112 ?auto_79111 ) ( ON ?auto_79113 ?auto_79112 ) ( ON ?auto_79114 ?auto_79113 ) ( ON ?auto_79115 ?auto_79114 ) ( ON ?auto_79110 ?auto_79115 ) ( not ( = ?auto_79111 ?auto_79112 ) ) ( not ( = ?auto_79111 ?auto_79113 ) ) ( not ( = ?auto_79111 ?auto_79114 ) ) ( not ( = ?auto_79111 ?auto_79115 ) ) ( not ( = ?auto_79111 ?auto_79110 ) ) ( not ( = ?auto_79111 ?auto_79109 ) ) ( not ( = ?auto_79111 ?auto_79108 ) ) ( not ( = ?auto_79112 ?auto_79113 ) ) ( not ( = ?auto_79112 ?auto_79114 ) ) ( not ( = ?auto_79112 ?auto_79115 ) ) ( not ( = ?auto_79112 ?auto_79110 ) ) ( not ( = ?auto_79112 ?auto_79109 ) ) ( not ( = ?auto_79112 ?auto_79108 ) ) ( not ( = ?auto_79113 ?auto_79114 ) ) ( not ( = ?auto_79113 ?auto_79115 ) ) ( not ( = ?auto_79113 ?auto_79110 ) ) ( not ( = ?auto_79113 ?auto_79109 ) ) ( not ( = ?auto_79113 ?auto_79108 ) ) ( not ( = ?auto_79114 ?auto_79115 ) ) ( not ( = ?auto_79114 ?auto_79110 ) ) ( not ( = ?auto_79114 ?auto_79109 ) ) ( not ( = ?auto_79114 ?auto_79108 ) ) ( not ( = ?auto_79115 ?auto_79110 ) ) ( not ( = ?auto_79115 ?auto_79109 ) ) ( not ( = ?auto_79115 ?auto_79108 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79111 ?auto_79112 ?auto_79113 ?auto_79114 ?auto_79115 ?auto_79110 ?auto_79109 )
      ( MAKE-2PILE ?auto_79108 ?auto_79109 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79121 - BLOCK
      ?auto_79122 - BLOCK
      ?auto_79123 - BLOCK
      ?auto_79124 - BLOCK
      ?auto_79125 - BLOCK
    )
    :vars
    (
      ?auto_79126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79126 ?auto_79125 ) ( CLEAR ?auto_79126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79121 ) ( ON ?auto_79122 ?auto_79121 ) ( ON ?auto_79123 ?auto_79122 ) ( ON ?auto_79124 ?auto_79123 ) ( ON ?auto_79125 ?auto_79124 ) ( not ( = ?auto_79121 ?auto_79122 ) ) ( not ( = ?auto_79121 ?auto_79123 ) ) ( not ( = ?auto_79121 ?auto_79124 ) ) ( not ( = ?auto_79121 ?auto_79125 ) ) ( not ( = ?auto_79121 ?auto_79126 ) ) ( not ( = ?auto_79122 ?auto_79123 ) ) ( not ( = ?auto_79122 ?auto_79124 ) ) ( not ( = ?auto_79122 ?auto_79125 ) ) ( not ( = ?auto_79122 ?auto_79126 ) ) ( not ( = ?auto_79123 ?auto_79124 ) ) ( not ( = ?auto_79123 ?auto_79125 ) ) ( not ( = ?auto_79123 ?auto_79126 ) ) ( not ( = ?auto_79124 ?auto_79125 ) ) ( not ( = ?auto_79124 ?auto_79126 ) ) ( not ( = ?auto_79125 ?auto_79126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79126 ?auto_79125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79127 - BLOCK
      ?auto_79128 - BLOCK
      ?auto_79129 - BLOCK
      ?auto_79130 - BLOCK
      ?auto_79131 - BLOCK
    )
    :vars
    (
      ?auto_79132 - BLOCK
      ?auto_79133 - BLOCK
      ?auto_79134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79132 ?auto_79131 ) ( CLEAR ?auto_79132 ) ( ON-TABLE ?auto_79127 ) ( ON ?auto_79128 ?auto_79127 ) ( ON ?auto_79129 ?auto_79128 ) ( ON ?auto_79130 ?auto_79129 ) ( ON ?auto_79131 ?auto_79130 ) ( not ( = ?auto_79127 ?auto_79128 ) ) ( not ( = ?auto_79127 ?auto_79129 ) ) ( not ( = ?auto_79127 ?auto_79130 ) ) ( not ( = ?auto_79127 ?auto_79131 ) ) ( not ( = ?auto_79127 ?auto_79132 ) ) ( not ( = ?auto_79128 ?auto_79129 ) ) ( not ( = ?auto_79128 ?auto_79130 ) ) ( not ( = ?auto_79128 ?auto_79131 ) ) ( not ( = ?auto_79128 ?auto_79132 ) ) ( not ( = ?auto_79129 ?auto_79130 ) ) ( not ( = ?auto_79129 ?auto_79131 ) ) ( not ( = ?auto_79129 ?auto_79132 ) ) ( not ( = ?auto_79130 ?auto_79131 ) ) ( not ( = ?auto_79130 ?auto_79132 ) ) ( not ( = ?auto_79131 ?auto_79132 ) ) ( HOLDING ?auto_79133 ) ( CLEAR ?auto_79134 ) ( not ( = ?auto_79127 ?auto_79133 ) ) ( not ( = ?auto_79127 ?auto_79134 ) ) ( not ( = ?auto_79128 ?auto_79133 ) ) ( not ( = ?auto_79128 ?auto_79134 ) ) ( not ( = ?auto_79129 ?auto_79133 ) ) ( not ( = ?auto_79129 ?auto_79134 ) ) ( not ( = ?auto_79130 ?auto_79133 ) ) ( not ( = ?auto_79130 ?auto_79134 ) ) ( not ( = ?auto_79131 ?auto_79133 ) ) ( not ( = ?auto_79131 ?auto_79134 ) ) ( not ( = ?auto_79132 ?auto_79133 ) ) ( not ( = ?auto_79132 ?auto_79134 ) ) ( not ( = ?auto_79133 ?auto_79134 ) ) )
    :subtasks
    ( ( !STACK ?auto_79133 ?auto_79134 )
      ( MAKE-5PILE ?auto_79127 ?auto_79128 ?auto_79129 ?auto_79130 ?auto_79131 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80053 - BLOCK
      ?auto_80054 - BLOCK
      ?auto_80055 - BLOCK
      ?auto_80056 - BLOCK
      ?auto_80057 - BLOCK
    )
    :vars
    (
      ?auto_80058 - BLOCK
      ?auto_80059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80058 ?auto_80057 ) ( ON-TABLE ?auto_80053 ) ( ON ?auto_80054 ?auto_80053 ) ( ON ?auto_80055 ?auto_80054 ) ( ON ?auto_80056 ?auto_80055 ) ( ON ?auto_80057 ?auto_80056 ) ( not ( = ?auto_80053 ?auto_80054 ) ) ( not ( = ?auto_80053 ?auto_80055 ) ) ( not ( = ?auto_80053 ?auto_80056 ) ) ( not ( = ?auto_80053 ?auto_80057 ) ) ( not ( = ?auto_80053 ?auto_80058 ) ) ( not ( = ?auto_80054 ?auto_80055 ) ) ( not ( = ?auto_80054 ?auto_80056 ) ) ( not ( = ?auto_80054 ?auto_80057 ) ) ( not ( = ?auto_80054 ?auto_80058 ) ) ( not ( = ?auto_80055 ?auto_80056 ) ) ( not ( = ?auto_80055 ?auto_80057 ) ) ( not ( = ?auto_80055 ?auto_80058 ) ) ( not ( = ?auto_80056 ?auto_80057 ) ) ( not ( = ?auto_80056 ?auto_80058 ) ) ( not ( = ?auto_80057 ?auto_80058 ) ) ( not ( = ?auto_80053 ?auto_80059 ) ) ( not ( = ?auto_80054 ?auto_80059 ) ) ( not ( = ?auto_80055 ?auto_80059 ) ) ( not ( = ?auto_80056 ?auto_80059 ) ) ( not ( = ?auto_80057 ?auto_80059 ) ) ( not ( = ?auto_80058 ?auto_80059 ) ) ( ON ?auto_80059 ?auto_80058 ) ( CLEAR ?auto_80059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80053 ?auto_80054 ?auto_80055 ?auto_80056 ?auto_80057 ?auto_80058 )
      ( MAKE-5PILE ?auto_80053 ?auto_80054 ?auto_80055 ?auto_80056 ?auto_80057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79143 - BLOCK
      ?auto_79144 - BLOCK
      ?auto_79145 - BLOCK
      ?auto_79146 - BLOCK
      ?auto_79147 - BLOCK
    )
    :vars
    (
      ?auto_79148 - BLOCK
      ?auto_79150 - BLOCK
      ?auto_79149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79148 ?auto_79147 ) ( ON-TABLE ?auto_79143 ) ( ON ?auto_79144 ?auto_79143 ) ( ON ?auto_79145 ?auto_79144 ) ( ON ?auto_79146 ?auto_79145 ) ( ON ?auto_79147 ?auto_79146 ) ( not ( = ?auto_79143 ?auto_79144 ) ) ( not ( = ?auto_79143 ?auto_79145 ) ) ( not ( = ?auto_79143 ?auto_79146 ) ) ( not ( = ?auto_79143 ?auto_79147 ) ) ( not ( = ?auto_79143 ?auto_79148 ) ) ( not ( = ?auto_79144 ?auto_79145 ) ) ( not ( = ?auto_79144 ?auto_79146 ) ) ( not ( = ?auto_79144 ?auto_79147 ) ) ( not ( = ?auto_79144 ?auto_79148 ) ) ( not ( = ?auto_79145 ?auto_79146 ) ) ( not ( = ?auto_79145 ?auto_79147 ) ) ( not ( = ?auto_79145 ?auto_79148 ) ) ( not ( = ?auto_79146 ?auto_79147 ) ) ( not ( = ?auto_79146 ?auto_79148 ) ) ( not ( = ?auto_79147 ?auto_79148 ) ) ( not ( = ?auto_79143 ?auto_79150 ) ) ( not ( = ?auto_79143 ?auto_79149 ) ) ( not ( = ?auto_79144 ?auto_79150 ) ) ( not ( = ?auto_79144 ?auto_79149 ) ) ( not ( = ?auto_79145 ?auto_79150 ) ) ( not ( = ?auto_79145 ?auto_79149 ) ) ( not ( = ?auto_79146 ?auto_79150 ) ) ( not ( = ?auto_79146 ?auto_79149 ) ) ( not ( = ?auto_79147 ?auto_79150 ) ) ( not ( = ?auto_79147 ?auto_79149 ) ) ( not ( = ?auto_79148 ?auto_79150 ) ) ( not ( = ?auto_79148 ?auto_79149 ) ) ( not ( = ?auto_79150 ?auto_79149 ) ) ( ON ?auto_79150 ?auto_79148 ) ( CLEAR ?auto_79150 ) ( HOLDING ?auto_79149 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79149 )
      ( MAKE-5PILE ?auto_79143 ?auto_79144 ?auto_79145 ?auto_79146 ?auto_79147 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79151 - BLOCK
      ?auto_79152 - BLOCK
      ?auto_79153 - BLOCK
      ?auto_79154 - BLOCK
      ?auto_79155 - BLOCK
    )
    :vars
    (
      ?auto_79156 - BLOCK
      ?auto_79157 - BLOCK
      ?auto_79158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79156 ?auto_79155 ) ( ON-TABLE ?auto_79151 ) ( ON ?auto_79152 ?auto_79151 ) ( ON ?auto_79153 ?auto_79152 ) ( ON ?auto_79154 ?auto_79153 ) ( ON ?auto_79155 ?auto_79154 ) ( not ( = ?auto_79151 ?auto_79152 ) ) ( not ( = ?auto_79151 ?auto_79153 ) ) ( not ( = ?auto_79151 ?auto_79154 ) ) ( not ( = ?auto_79151 ?auto_79155 ) ) ( not ( = ?auto_79151 ?auto_79156 ) ) ( not ( = ?auto_79152 ?auto_79153 ) ) ( not ( = ?auto_79152 ?auto_79154 ) ) ( not ( = ?auto_79152 ?auto_79155 ) ) ( not ( = ?auto_79152 ?auto_79156 ) ) ( not ( = ?auto_79153 ?auto_79154 ) ) ( not ( = ?auto_79153 ?auto_79155 ) ) ( not ( = ?auto_79153 ?auto_79156 ) ) ( not ( = ?auto_79154 ?auto_79155 ) ) ( not ( = ?auto_79154 ?auto_79156 ) ) ( not ( = ?auto_79155 ?auto_79156 ) ) ( not ( = ?auto_79151 ?auto_79157 ) ) ( not ( = ?auto_79151 ?auto_79158 ) ) ( not ( = ?auto_79152 ?auto_79157 ) ) ( not ( = ?auto_79152 ?auto_79158 ) ) ( not ( = ?auto_79153 ?auto_79157 ) ) ( not ( = ?auto_79153 ?auto_79158 ) ) ( not ( = ?auto_79154 ?auto_79157 ) ) ( not ( = ?auto_79154 ?auto_79158 ) ) ( not ( = ?auto_79155 ?auto_79157 ) ) ( not ( = ?auto_79155 ?auto_79158 ) ) ( not ( = ?auto_79156 ?auto_79157 ) ) ( not ( = ?auto_79156 ?auto_79158 ) ) ( not ( = ?auto_79157 ?auto_79158 ) ) ( ON ?auto_79157 ?auto_79156 ) ( ON ?auto_79158 ?auto_79157 ) ( CLEAR ?auto_79158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79151 ?auto_79152 ?auto_79153 ?auto_79154 ?auto_79155 ?auto_79156 ?auto_79157 )
      ( MAKE-5PILE ?auto_79151 ?auto_79152 ?auto_79153 ?auto_79154 ?auto_79155 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79162 - BLOCK
      ?auto_79163 - BLOCK
      ?auto_79164 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_79164 ) ( CLEAR ?auto_79163 ) ( ON-TABLE ?auto_79162 ) ( ON ?auto_79163 ?auto_79162 ) ( not ( = ?auto_79162 ?auto_79163 ) ) ( not ( = ?auto_79162 ?auto_79164 ) ) ( not ( = ?auto_79163 ?auto_79164 ) ) )
    :subtasks
    ( ( !STACK ?auto_79164 ?auto_79163 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79165 - BLOCK
      ?auto_79166 - BLOCK
      ?auto_79167 - BLOCK
    )
    :vars
    (
      ?auto_79168 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_79166 ) ( ON-TABLE ?auto_79165 ) ( ON ?auto_79166 ?auto_79165 ) ( not ( = ?auto_79165 ?auto_79166 ) ) ( not ( = ?auto_79165 ?auto_79167 ) ) ( not ( = ?auto_79166 ?auto_79167 ) ) ( ON ?auto_79167 ?auto_79168 ) ( CLEAR ?auto_79167 ) ( HAND-EMPTY ) ( not ( = ?auto_79165 ?auto_79168 ) ) ( not ( = ?auto_79166 ?auto_79168 ) ) ( not ( = ?auto_79167 ?auto_79168 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79167 ?auto_79168 )
      ( MAKE-3PILE ?auto_79165 ?auto_79166 ?auto_79167 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79169 - BLOCK
      ?auto_79170 - BLOCK
      ?auto_79171 - BLOCK
    )
    :vars
    (
      ?auto_79172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79169 ) ( not ( = ?auto_79169 ?auto_79170 ) ) ( not ( = ?auto_79169 ?auto_79171 ) ) ( not ( = ?auto_79170 ?auto_79171 ) ) ( ON ?auto_79171 ?auto_79172 ) ( CLEAR ?auto_79171 ) ( not ( = ?auto_79169 ?auto_79172 ) ) ( not ( = ?auto_79170 ?auto_79172 ) ) ( not ( = ?auto_79171 ?auto_79172 ) ) ( HOLDING ?auto_79170 ) ( CLEAR ?auto_79169 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79169 ?auto_79170 )
      ( MAKE-3PILE ?auto_79169 ?auto_79170 ?auto_79171 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79173 - BLOCK
      ?auto_79174 - BLOCK
      ?auto_79175 - BLOCK
    )
    :vars
    (
      ?auto_79176 - BLOCK
      ?auto_79177 - BLOCK
      ?auto_79180 - BLOCK
      ?auto_79179 - BLOCK
      ?auto_79178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79173 ) ( not ( = ?auto_79173 ?auto_79174 ) ) ( not ( = ?auto_79173 ?auto_79175 ) ) ( not ( = ?auto_79174 ?auto_79175 ) ) ( ON ?auto_79175 ?auto_79176 ) ( not ( = ?auto_79173 ?auto_79176 ) ) ( not ( = ?auto_79174 ?auto_79176 ) ) ( not ( = ?auto_79175 ?auto_79176 ) ) ( CLEAR ?auto_79173 ) ( ON ?auto_79174 ?auto_79175 ) ( CLEAR ?auto_79174 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79177 ) ( ON ?auto_79180 ?auto_79177 ) ( ON ?auto_79179 ?auto_79180 ) ( ON ?auto_79178 ?auto_79179 ) ( ON ?auto_79176 ?auto_79178 ) ( not ( = ?auto_79177 ?auto_79180 ) ) ( not ( = ?auto_79177 ?auto_79179 ) ) ( not ( = ?auto_79177 ?auto_79178 ) ) ( not ( = ?auto_79177 ?auto_79176 ) ) ( not ( = ?auto_79177 ?auto_79175 ) ) ( not ( = ?auto_79177 ?auto_79174 ) ) ( not ( = ?auto_79180 ?auto_79179 ) ) ( not ( = ?auto_79180 ?auto_79178 ) ) ( not ( = ?auto_79180 ?auto_79176 ) ) ( not ( = ?auto_79180 ?auto_79175 ) ) ( not ( = ?auto_79180 ?auto_79174 ) ) ( not ( = ?auto_79179 ?auto_79178 ) ) ( not ( = ?auto_79179 ?auto_79176 ) ) ( not ( = ?auto_79179 ?auto_79175 ) ) ( not ( = ?auto_79179 ?auto_79174 ) ) ( not ( = ?auto_79178 ?auto_79176 ) ) ( not ( = ?auto_79178 ?auto_79175 ) ) ( not ( = ?auto_79178 ?auto_79174 ) ) ( not ( = ?auto_79173 ?auto_79177 ) ) ( not ( = ?auto_79173 ?auto_79180 ) ) ( not ( = ?auto_79173 ?auto_79179 ) ) ( not ( = ?auto_79173 ?auto_79178 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79177 ?auto_79180 ?auto_79179 ?auto_79178 ?auto_79176 ?auto_79175 )
      ( MAKE-3PILE ?auto_79173 ?auto_79174 ?auto_79175 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79181 - BLOCK
      ?auto_79182 - BLOCK
      ?auto_79183 - BLOCK
    )
    :vars
    (
      ?auto_79184 - BLOCK
      ?auto_79186 - BLOCK
      ?auto_79187 - BLOCK
      ?auto_79188 - BLOCK
      ?auto_79185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79181 ?auto_79182 ) ) ( not ( = ?auto_79181 ?auto_79183 ) ) ( not ( = ?auto_79182 ?auto_79183 ) ) ( ON ?auto_79183 ?auto_79184 ) ( not ( = ?auto_79181 ?auto_79184 ) ) ( not ( = ?auto_79182 ?auto_79184 ) ) ( not ( = ?auto_79183 ?auto_79184 ) ) ( ON ?auto_79182 ?auto_79183 ) ( CLEAR ?auto_79182 ) ( ON-TABLE ?auto_79186 ) ( ON ?auto_79187 ?auto_79186 ) ( ON ?auto_79188 ?auto_79187 ) ( ON ?auto_79185 ?auto_79188 ) ( ON ?auto_79184 ?auto_79185 ) ( not ( = ?auto_79186 ?auto_79187 ) ) ( not ( = ?auto_79186 ?auto_79188 ) ) ( not ( = ?auto_79186 ?auto_79185 ) ) ( not ( = ?auto_79186 ?auto_79184 ) ) ( not ( = ?auto_79186 ?auto_79183 ) ) ( not ( = ?auto_79186 ?auto_79182 ) ) ( not ( = ?auto_79187 ?auto_79188 ) ) ( not ( = ?auto_79187 ?auto_79185 ) ) ( not ( = ?auto_79187 ?auto_79184 ) ) ( not ( = ?auto_79187 ?auto_79183 ) ) ( not ( = ?auto_79187 ?auto_79182 ) ) ( not ( = ?auto_79188 ?auto_79185 ) ) ( not ( = ?auto_79188 ?auto_79184 ) ) ( not ( = ?auto_79188 ?auto_79183 ) ) ( not ( = ?auto_79188 ?auto_79182 ) ) ( not ( = ?auto_79185 ?auto_79184 ) ) ( not ( = ?auto_79185 ?auto_79183 ) ) ( not ( = ?auto_79185 ?auto_79182 ) ) ( not ( = ?auto_79181 ?auto_79186 ) ) ( not ( = ?auto_79181 ?auto_79187 ) ) ( not ( = ?auto_79181 ?auto_79188 ) ) ( not ( = ?auto_79181 ?auto_79185 ) ) ( HOLDING ?auto_79181 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79181 )
      ( MAKE-3PILE ?auto_79181 ?auto_79182 ?auto_79183 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79189 - BLOCK
      ?auto_79190 - BLOCK
      ?auto_79191 - BLOCK
    )
    :vars
    (
      ?auto_79193 - BLOCK
      ?auto_79195 - BLOCK
      ?auto_79196 - BLOCK
      ?auto_79194 - BLOCK
      ?auto_79192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79189 ?auto_79190 ) ) ( not ( = ?auto_79189 ?auto_79191 ) ) ( not ( = ?auto_79190 ?auto_79191 ) ) ( ON ?auto_79191 ?auto_79193 ) ( not ( = ?auto_79189 ?auto_79193 ) ) ( not ( = ?auto_79190 ?auto_79193 ) ) ( not ( = ?auto_79191 ?auto_79193 ) ) ( ON ?auto_79190 ?auto_79191 ) ( ON-TABLE ?auto_79195 ) ( ON ?auto_79196 ?auto_79195 ) ( ON ?auto_79194 ?auto_79196 ) ( ON ?auto_79192 ?auto_79194 ) ( ON ?auto_79193 ?auto_79192 ) ( not ( = ?auto_79195 ?auto_79196 ) ) ( not ( = ?auto_79195 ?auto_79194 ) ) ( not ( = ?auto_79195 ?auto_79192 ) ) ( not ( = ?auto_79195 ?auto_79193 ) ) ( not ( = ?auto_79195 ?auto_79191 ) ) ( not ( = ?auto_79195 ?auto_79190 ) ) ( not ( = ?auto_79196 ?auto_79194 ) ) ( not ( = ?auto_79196 ?auto_79192 ) ) ( not ( = ?auto_79196 ?auto_79193 ) ) ( not ( = ?auto_79196 ?auto_79191 ) ) ( not ( = ?auto_79196 ?auto_79190 ) ) ( not ( = ?auto_79194 ?auto_79192 ) ) ( not ( = ?auto_79194 ?auto_79193 ) ) ( not ( = ?auto_79194 ?auto_79191 ) ) ( not ( = ?auto_79194 ?auto_79190 ) ) ( not ( = ?auto_79192 ?auto_79193 ) ) ( not ( = ?auto_79192 ?auto_79191 ) ) ( not ( = ?auto_79192 ?auto_79190 ) ) ( not ( = ?auto_79189 ?auto_79195 ) ) ( not ( = ?auto_79189 ?auto_79196 ) ) ( not ( = ?auto_79189 ?auto_79194 ) ) ( not ( = ?auto_79189 ?auto_79192 ) ) ( ON ?auto_79189 ?auto_79190 ) ( CLEAR ?auto_79189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79195 ?auto_79196 ?auto_79194 ?auto_79192 ?auto_79193 ?auto_79191 ?auto_79190 )
      ( MAKE-3PILE ?auto_79189 ?auto_79190 ?auto_79191 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79201 - BLOCK
      ?auto_79202 - BLOCK
      ?auto_79203 - BLOCK
      ?auto_79204 - BLOCK
    )
    :vars
    (
      ?auto_79205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79205 ?auto_79204 ) ( CLEAR ?auto_79205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79201 ) ( ON ?auto_79202 ?auto_79201 ) ( ON ?auto_79203 ?auto_79202 ) ( ON ?auto_79204 ?auto_79203 ) ( not ( = ?auto_79201 ?auto_79202 ) ) ( not ( = ?auto_79201 ?auto_79203 ) ) ( not ( = ?auto_79201 ?auto_79204 ) ) ( not ( = ?auto_79201 ?auto_79205 ) ) ( not ( = ?auto_79202 ?auto_79203 ) ) ( not ( = ?auto_79202 ?auto_79204 ) ) ( not ( = ?auto_79202 ?auto_79205 ) ) ( not ( = ?auto_79203 ?auto_79204 ) ) ( not ( = ?auto_79203 ?auto_79205 ) ) ( not ( = ?auto_79204 ?auto_79205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79205 ?auto_79204 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79206 - BLOCK
      ?auto_79207 - BLOCK
      ?auto_79208 - BLOCK
      ?auto_79209 - BLOCK
    )
    :vars
    (
      ?auto_79210 - BLOCK
      ?auto_79211 - BLOCK
      ?auto_79212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79210 ?auto_79209 ) ( CLEAR ?auto_79210 ) ( ON-TABLE ?auto_79206 ) ( ON ?auto_79207 ?auto_79206 ) ( ON ?auto_79208 ?auto_79207 ) ( ON ?auto_79209 ?auto_79208 ) ( not ( = ?auto_79206 ?auto_79207 ) ) ( not ( = ?auto_79206 ?auto_79208 ) ) ( not ( = ?auto_79206 ?auto_79209 ) ) ( not ( = ?auto_79206 ?auto_79210 ) ) ( not ( = ?auto_79207 ?auto_79208 ) ) ( not ( = ?auto_79207 ?auto_79209 ) ) ( not ( = ?auto_79207 ?auto_79210 ) ) ( not ( = ?auto_79208 ?auto_79209 ) ) ( not ( = ?auto_79208 ?auto_79210 ) ) ( not ( = ?auto_79209 ?auto_79210 ) ) ( HOLDING ?auto_79211 ) ( CLEAR ?auto_79212 ) ( not ( = ?auto_79206 ?auto_79211 ) ) ( not ( = ?auto_79206 ?auto_79212 ) ) ( not ( = ?auto_79207 ?auto_79211 ) ) ( not ( = ?auto_79207 ?auto_79212 ) ) ( not ( = ?auto_79208 ?auto_79211 ) ) ( not ( = ?auto_79208 ?auto_79212 ) ) ( not ( = ?auto_79209 ?auto_79211 ) ) ( not ( = ?auto_79209 ?auto_79212 ) ) ( not ( = ?auto_79210 ?auto_79211 ) ) ( not ( = ?auto_79210 ?auto_79212 ) ) ( not ( = ?auto_79211 ?auto_79212 ) ) )
    :subtasks
    ( ( !STACK ?auto_79211 ?auto_79212 )
      ( MAKE-4PILE ?auto_79206 ?auto_79207 ?auto_79208 ?auto_79209 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79213 - BLOCK
      ?auto_79214 - BLOCK
      ?auto_79215 - BLOCK
      ?auto_79216 - BLOCK
    )
    :vars
    (
      ?auto_79219 - BLOCK
      ?auto_79218 - BLOCK
      ?auto_79217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79219 ?auto_79216 ) ( ON-TABLE ?auto_79213 ) ( ON ?auto_79214 ?auto_79213 ) ( ON ?auto_79215 ?auto_79214 ) ( ON ?auto_79216 ?auto_79215 ) ( not ( = ?auto_79213 ?auto_79214 ) ) ( not ( = ?auto_79213 ?auto_79215 ) ) ( not ( = ?auto_79213 ?auto_79216 ) ) ( not ( = ?auto_79213 ?auto_79219 ) ) ( not ( = ?auto_79214 ?auto_79215 ) ) ( not ( = ?auto_79214 ?auto_79216 ) ) ( not ( = ?auto_79214 ?auto_79219 ) ) ( not ( = ?auto_79215 ?auto_79216 ) ) ( not ( = ?auto_79215 ?auto_79219 ) ) ( not ( = ?auto_79216 ?auto_79219 ) ) ( CLEAR ?auto_79218 ) ( not ( = ?auto_79213 ?auto_79217 ) ) ( not ( = ?auto_79213 ?auto_79218 ) ) ( not ( = ?auto_79214 ?auto_79217 ) ) ( not ( = ?auto_79214 ?auto_79218 ) ) ( not ( = ?auto_79215 ?auto_79217 ) ) ( not ( = ?auto_79215 ?auto_79218 ) ) ( not ( = ?auto_79216 ?auto_79217 ) ) ( not ( = ?auto_79216 ?auto_79218 ) ) ( not ( = ?auto_79219 ?auto_79217 ) ) ( not ( = ?auto_79219 ?auto_79218 ) ) ( not ( = ?auto_79217 ?auto_79218 ) ) ( ON ?auto_79217 ?auto_79219 ) ( CLEAR ?auto_79217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79213 ?auto_79214 ?auto_79215 ?auto_79216 ?auto_79219 )
      ( MAKE-4PILE ?auto_79213 ?auto_79214 ?auto_79215 ?auto_79216 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79220 - BLOCK
      ?auto_79221 - BLOCK
      ?auto_79222 - BLOCK
      ?auto_79223 - BLOCK
    )
    :vars
    (
      ?auto_79225 - BLOCK
      ?auto_79226 - BLOCK
      ?auto_79224 - BLOCK
      ?auto_79227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79225 ?auto_79223 ) ( ON-TABLE ?auto_79220 ) ( ON ?auto_79221 ?auto_79220 ) ( ON ?auto_79222 ?auto_79221 ) ( ON ?auto_79223 ?auto_79222 ) ( not ( = ?auto_79220 ?auto_79221 ) ) ( not ( = ?auto_79220 ?auto_79222 ) ) ( not ( = ?auto_79220 ?auto_79223 ) ) ( not ( = ?auto_79220 ?auto_79225 ) ) ( not ( = ?auto_79221 ?auto_79222 ) ) ( not ( = ?auto_79221 ?auto_79223 ) ) ( not ( = ?auto_79221 ?auto_79225 ) ) ( not ( = ?auto_79222 ?auto_79223 ) ) ( not ( = ?auto_79222 ?auto_79225 ) ) ( not ( = ?auto_79223 ?auto_79225 ) ) ( not ( = ?auto_79220 ?auto_79226 ) ) ( not ( = ?auto_79220 ?auto_79224 ) ) ( not ( = ?auto_79221 ?auto_79226 ) ) ( not ( = ?auto_79221 ?auto_79224 ) ) ( not ( = ?auto_79222 ?auto_79226 ) ) ( not ( = ?auto_79222 ?auto_79224 ) ) ( not ( = ?auto_79223 ?auto_79226 ) ) ( not ( = ?auto_79223 ?auto_79224 ) ) ( not ( = ?auto_79225 ?auto_79226 ) ) ( not ( = ?auto_79225 ?auto_79224 ) ) ( not ( = ?auto_79226 ?auto_79224 ) ) ( ON ?auto_79226 ?auto_79225 ) ( CLEAR ?auto_79226 ) ( HOLDING ?auto_79224 ) ( CLEAR ?auto_79227 ) ( ON-TABLE ?auto_79227 ) ( not ( = ?auto_79227 ?auto_79224 ) ) ( not ( = ?auto_79220 ?auto_79227 ) ) ( not ( = ?auto_79221 ?auto_79227 ) ) ( not ( = ?auto_79222 ?auto_79227 ) ) ( not ( = ?auto_79223 ?auto_79227 ) ) ( not ( = ?auto_79225 ?auto_79227 ) ) ( not ( = ?auto_79226 ?auto_79227 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79227 ?auto_79224 )
      ( MAKE-4PILE ?auto_79220 ?auto_79221 ?auto_79222 ?auto_79223 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80282 - BLOCK
      ?auto_80283 - BLOCK
      ?auto_80284 - BLOCK
      ?auto_80285 - BLOCK
    )
    :vars
    (
      ?auto_80288 - BLOCK
      ?auto_80287 - BLOCK
      ?auto_80286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80288 ?auto_80285 ) ( ON-TABLE ?auto_80282 ) ( ON ?auto_80283 ?auto_80282 ) ( ON ?auto_80284 ?auto_80283 ) ( ON ?auto_80285 ?auto_80284 ) ( not ( = ?auto_80282 ?auto_80283 ) ) ( not ( = ?auto_80282 ?auto_80284 ) ) ( not ( = ?auto_80282 ?auto_80285 ) ) ( not ( = ?auto_80282 ?auto_80288 ) ) ( not ( = ?auto_80283 ?auto_80284 ) ) ( not ( = ?auto_80283 ?auto_80285 ) ) ( not ( = ?auto_80283 ?auto_80288 ) ) ( not ( = ?auto_80284 ?auto_80285 ) ) ( not ( = ?auto_80284 ?auto_80288 ) ) ( not ( = ?auto_80285 ?auto_80288 ) ) ( not ( = ?auto_80282 ?auto_80287 ) ) ( not ( = ?auto_80282 ?auto_80286 ) ) ( not ( = ?auto_80283 ?auto_80287 ) ) ( not ( = ?auto_80283 ?auto_80286 ) ) ( not ( = ?auto_80284 ?auto_80287 ) ) ( not ( = ?auto_80284 ?auto_80286 ) ) ( not ( = ?auto_80285 ?auto_80287 ) ) ( not ( = ?auto_80285 ?auto_80286 ) ) ( not ( = ?auto_80288 ?auto_80287 ) ) ( not ( = ?auto_80288 ?auto_80286 ) ) ( not ( = ?auto_80287 ?auto_80286 ) ) ( ON ?auto_80287 ?auto_80288 ) ( ON ?auto_80286 ?auto_80287 ) ( CLEAR ?auto_80286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80282 ?auto_80283 ?auto_80284 ?auto_80285 ?auto_80288 ?auto_80287 )
      ( MAKE-4PILE ?auto_80282 ?auto_80283 ?auto_80284 ?auto_80285 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79236 - BLOCK
      ?auto_79237 - BLOCK
      ?auto_79238 - BLOCK
      ?auto_79239 - BLOCK
    )
    :vars
    (
      ?auto_79240 - BLOCK
      ?auto_79242 - BLOCK
      ?auto_79241 - BLOCK
      ?auto_79243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79240 ?auto_79239 ) ( ON-TABLE ?auto_79236 ) ( ON ?auto_79237 ?auto_79236 ) ( ON ?auto_79238 ?auto_79237 ) ( ON ?auto_79239 ?auto_79238 ) ( not ( = ?auto_79236 ?auto_79237 ) ) ( not ( = ?auto_79236 ?auto_79238 ) ) ( not ( = ?auto_79236 ?auto_79239 ) ) ( not ( = ?auto_79236 ?auto_79240 ) ) ( not ( = ?auto_79237 ?auto_79238 ) ) ( not ( = ?auto_79237 ?auto_79239 ) ) ( not ( = ?auto_79237 ?auto_79240 ) ) ( not ( = ?auto_79238 ?auto_79239 ) ) ( not ( = ?auto_79238 ?auto_79240 ) ) ( not ( = ?auto_79239 ?auto_79240 ) ) ( not ( = ?auto_79236 ?auto_79242 ) ) ( not ( = ?auto_79236 ?auto_79241 ) ) ( not ( = ?auto_79237 ?auto_79242 ) ) ( not ( = ?auto_79237 ?auto_79241 ) ) ( not ( = ?auto_79238 ?auto_79242 ) ) ( not ( = ?auto_79238 ?auto_79241 ) ) ( not ( = ?auto_79239 ?auto_79242 ) ) ( not ( = ?auto_79239 ?auto_79241 ) ) ( not ( = ?auto_79240 ?auto_79242 ) ) ( not ( = ?auto_79240 ?auto_79241 ) ) ( not ( = ?auto_79242 ?auto_79241 ) ) ( ON ?auto_79242 ?auto_79240 ) ( not ( = ?auto_79243 ?auto_79241 ) ) ( not ( = ?auto_79236 ?auto_79243 ) ) ( not ( = ?auto_79237 ?auto_79243 ) ) ( not ( = ?auto_79238 ?auto_79243 ) ) ( not ( = ?auto_79239 ?auto_79243 ) ) ( not ( = ?auto_79240 ?auto_79243 ) ) ( not ( = ?auto_79242 ?auto_79243 ) ) ( ON ?auto_79241 ?auto_79242 ) ( CLEAR ?auto_79241 ) ( HOLDING ?auto_79243 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79243 )
      ( MAKE-4PILE ?auto_79236 ?auto_79237 ?auto_79238 ?auto_79239 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79244 - BLOCK
      ?auto_79245 - BLOCK
      ?auto_79246 - BLOCK
      ?auto_79247 - BLOCK
    )
    :vars
    (
      ?auto_79251 - BLOCK
      ?auto_79248 - BLOCK
      ?auto_79249 - BLOCK
      ?auto_79250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79251 ?auto_79247 ) ( ON-TABLE ?auto_79244 ) ( ON ?auto_79245 ?auto_79244 ) ( ON ?auto_79246 ?auto_79245 ) ( ON ?auto_79247 ?auto_79246 ) ( not ( = ?auto_79244 ?auto_79245 ) ) ( not ( = ?auto_79244 ?auto_79246 ) ) ( not ( = ?auto_79244 ?auto_79247 ) ) ( not ( = ?auto_79244 ?auto_79251 ) ) ( not ( = ?auto_79245 ?auto_79246 ) ) ( not ( = ?auto_79245 ?auto_79247 ) ) ( not ( = ?auto_79245 ?auto_79251 ) ) ( not ( = ?auto_79246 ?auto_79247 ) ) ( not ( = ?auto_79246 ?auto_79251 ) ) ( not ( = ?auto_79247 ?auto_79251 ) ) ( not ( = ?auto_79244 ?auto_79248 ) ) ( not ( = ?auto_79244 ?auto_79249 ) ) ( not ( = ?auto_79245 ?auto_79248 ) ) ( not ( = ?auto_79245 ?auto_79249 ) ) ( not ( = ?auto_79246 ?auto_79248 ) ) ( not ( = ?auto_79246 ?auto_79249 ) ) ( not ( = ?auto_79247 ?auto_79248 ) ) ( not ( = ?auto_79247 ?auto_79249 ) ) ( not ( = ?auto_79251 ?auto_79248 ) ) ( not ( = ?auto_79251 ?auto_79249 ) ) ( not ( = ?auto_79248 ?auto_79249 ) ) ( ON ?auto_79248 ?auto_79251 ) ( not ( = ?auto_79250 ?auto_79249 ) ) ( not ( = ?auto_79244 ?auto_79250 ) ) ( not ( = ?auto_79245 ?auto_79250 ) ) ( not ( = ?auto_79246 ?auto_79250 ) ) ( not ( = ?auto_79247 ?auto_79250 ) ) ( not ( = ?auto_79251 ?auto_79250 ) ) ( not ( = ?auto_79248 ?auto_79250 ) ) ( ON ?auto_79249 ?auto_79248 ) ( ON ?auto_79250 ?auto_79249 ) ( CLEAR ?auto_79250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79244 ?auto_79245 ?auto_79246 ?auto_79247 ?auto_79251 ?auto_79248 ?auto_79249 )
      ( MAKE-4PILE ?auto_79244 ?auto_79245 ?auto_79246 ?auto_79247 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79256 - BLOCK
      ?auto_79257 - BLOCK
      ?auto_79258 - BLOCK
      ?auto_79259 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_79259 ) ( CLEAR ?auto_79258 ) ( ON-TABLE ?auto_79256 ) ( ON ?auto_79257 ?auto_79256 ) ( ON ?auto_79258 ?auto_79257 ) ( not ( = ?auto_79256 ?auto_79257 ) ) ( not ( = ?auto_79256 ?auto_79258 ) ) ( not ( = ?auto_79256 ?auto_79259 ) ) ( not ( = ?auto_79257 ?auto_79258 ) ) ( not ( = ?auto_79257 ?auto_79259 ) ) ( not ( = ?auto_79258 ?auto_79259 ) ) )
    :subtasks
    ( ( !STACK ?auto_79259 ?auto_79258 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79260 - BLOCK
      ?auto_79261 - BLOCK
      ?auto_79262 - BLOCK
      ?auto_79263 - BLOCK
    )
    :vars
    (
      ?auto_79264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_79262 ) ( ON-TABLE ?auto_79260 ) ( ON ?auto_79261 ?auto_79260 ) ( ON ?auto_79262 ?auto_79261 ) ( not ( = ?auto_79260 ?auto_79261 ) ) ( not ( = ?auto_79260 ?auto_79262 ) ) ( not ( = ?auto_79260 ?auto_79263 ) ) ( not ( = ?auto_79261 ?auto_79262 ) ) ( not ( = ?auto_79261 ?auto_79263 ) ) ( not ( = ?auto_79262 ?auto_79263 ) ) ( ON ?auto_79263 ?auto_79264 ) ( CLEAR ?auto_79263 ) ( HAND-EMPTY ) ( not ( = ?auto_79260 ?auto_79264 ) ) ( not ( = ?auto_79261 ?auto_79264 ) ) ( not ( = ?auto_79262 ?auto_79264 ) ) ( not ( = ?auto_79263 ?auto_79264 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79263 ?auto_79264 )
      ( MAKE-4PILE ?auto_79260 ?auto_79261 ?auto_79262 ?auto_79263 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79265 - BLOCK
      ?auto_79266 - BLOCK
      ?auto_79267 - BLOCK
      ?auto_79268 - BLOCK
    )
    :vars
    (
      ?auto_79269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79265 ) ( ON ?auto_79266 ?auto_79265 ) ( not ( = ?auto_79265 ?auto_79266 ) ) ( not ( = ?auto_79265 ?auto_79267 ) ) ( not ( = ?auto_79265 ?auto_79268 ) ) ( not ( = ?auto_79266 ?auto_79267 ) ) ( not ( = ?auto_79266 ?auto_79268 ) ) ( not ( = ?auto_79267 ?auto_79268 ) ) ( ON ?auto_79268 ?auto_79269 ) ( CLEAR ?auto_79268 ) ( not ( = ?auto_79265 ?auto_79269 ) ) ( not ( = ?auto_79266 ?auto_79269 ) ) ( not ( = ?auto_79267 ?auto_79269 ) ) ( not ( = ?auto_79268 ?auto_79269 ) ) ( HOLDING ?auto_79267 ) ( CLEAR ?auto_79266 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79265 ?auto_79266 ?auto_79267 )
      ( MAKE-4PILE ?auto_79265 ?auto_79266 ?auto_79267 ?auto_79268 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79270 - BLOCK
      ?auto_79271 - BLOCK
      ?auto_79272 - BLOCK
      ?auto_79273 - BLOCK
    )
    :vars
    (
      ?auto_79274 - BLOCK
      ?auto_79277 - BLOCK
      ?auto_79276 - BLOCK
      ?auto_79275 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79270 ) ( ON ?auto_79271 ?auto_79270 ) ( not ( = ?auto_79270 ?auto_79271 ) ) ( not ( = ?auto_79270 ?auto_79272 ) ) ( not ( = ?auto_79270 ?auto_79273 ) ) ( not ( = ?auto_79271 ?auto_79272 ) ) ( not ( = ?auto_79271 ?auto_79273 ) ) ( not ( = ?auto_79272 ?auto_79273 ) ) ( ON ?auto_79273 ?auto_79274 ) ( not ( = ?auto_79270 ?auto_79274 ) ) ( not ( = ?auto_79271 ?auto_79274 ) ) ( not ( = ?auto_79272 ?auto_79274 ) ) ( not ( = ?auto_79273 ?auto_79274 ) ) ( CLEAR ?auto_79271 ) ( ON ?auto_79272 ?auto_79273 ) ( CLEAR ?auto_79272 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79277 ) ( ON ?auto_79276 ?auto_79277 ) ( ON ?auto_79275 ?auto_79276 ) ( ON ?auto_79274 ?auto_79275 ) ( not ( = ?auto_79277 ?auto_79276 ) ) ( not ( = ?auto_79277 ?auto_79275 ) ) ( not ( = ?auto_79277 ?auto_79274 ) ) ( not ( = ?auto_79277 ?auto_79273 ) ) ( not ( = ?auto_79277 ?auto_79272 ) ) ( not ( = ?auto_79276 ?auto_79275 ) ) ( not ( = ?auto_79276 ?auto_79274 ) ) ( not ( = ?auto_79276 ?auto_79273 ) ) ( not ( = ?auto_79276 ?auto_79272 ) ) ( not ( = ?auto_79275 ?auto_79274 ) ) ( not ( = ?auto_79275 ?auto_79273 ) ) ( not ( = ?auto_79275 ?auto_79272 ) ) ( not ( = ?auto_79270 ?auto_79277 ) ) ( not ( = ?auto_79270 ?auto_79276 ) ) ( not ( = ?auto_79270 ?auto_79275 ) ) ( not ( = ?auto_79271 ?auto_79277 ) ) ( not ( = ?auto_79271 ?auto_79276 ) ) ( not ( = ?auto_79271 ?auto_79275 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79277 ?auto_79276 ?auto_79275 ?auto_79274 ?auto_79273 )
      ( MAKE-4PILE ?auto_79270 ?auto_79271 ?auto_79272 ?auto_79273 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79278 - BLOCK
      ?auto_79279 - BLOCK
      ?auto_79280 - BLOCK
      ?auto_79281 - BLOCK
    )
    :vars
    (
      ?auto_79284 - BLOCK
      ?auto_79282 - BLOCK
      ?auto_79285 - BLOCK
      ?auto_79283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79278 ) ( not ( = ?auto_79278 ?auto_79279 ) ) ( not ( = ?auto_79278 ?auto_79280 ) ) ( not ( = ?auto_79278 ?auto_79281 ) ) ( not ( = ?auto_79279 ?auto_79280 ) ) ( not ( = ?auto_79279 ?auto_79281 ) ) ( not ( = ?auto_79280 ?auto_79281 ) ) ( ON ?auto_79281 ?auto_79284 ) ( not ( = ?auto_79278 ?auto_79284 ) ) ( not ( = ?auto_79279 ?auto_79284 ) ) ( not ( = ?auto_79280 ?auto_79284 ) ) ( not ( = ?auto_79281 ?auto_79284 ) ) ( ON ?auto_79280 ?auto_79281 ) ( CLEAR ?auto_79280 ) ( ON-TABLE ?auto_79282 ) ( ON ?auto_79285 ?auto_79282 ) ( ON ?auto_79283 ?auto_79285 ) ( ON ?auto_79284 ?auto_79283 ) ( not ( = ?auto_79282 ?auto_79285 ) ) ( not ( = ?auto_79282 ?auto_79283 ) ) ( not ( = ?auto_79282 ?auto_79284 ) ) ( not ( = ?auto_79282 ?auto_79281 ) ) ( not ( = ?auto_79282 ?auto_79280 ) ) ( not ( = ?auto_79285 ?auto_79283 ) ) ( not ( = ?auto_79285 ?auto_79284 ) ) ( not ( = ?auto_79285 ?auto_79281 ) ) ( not ( = ?auto_79285 ?auto_79280 ) ) ( not ( = ?auto_79283 ?auto_79284 ) ) ( not ( = ?auto_79283 ?auto_79281 ) ) ( not ( = ?auto_79283 ?auto_79280 ) ) ( not ( = ?auto_79278 ?auto_79282 ) ) ( not ( = ?auto_79278 ?auto_79285 ) ) ( not ( = ?auto_79278 ?auto_79283 ) ) ( not ( = ?auto_79279 ?auto_79282 ) ) ( not ( = ?auto_79279 ?auto_79285 ) ) ( not ( = ?auto_79279 ?auto_79283 ) ) ( HOLDING ?auto_79279 ) ( CLEAR ?auto_79278 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79278 ?auto_79279 )
      ( MAKE-4PILE ?auto_79278 ?auto_79279 ?auto_79280 ?auto_79281 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79286 - BLOCK
      ?auto_79287 - BLOCK
      ?auto_79288 - BLOCK
      ?auto_79289 - BLOCK
    )
    :vars
    (
      ?auto_79293 - BLOCK
      ?auto_79292 - BLOCK
      ?auto_79290 - BLOCK
      ?auto_79291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79286 ) ( not ( = ?auto_79286 ?auto_79287 ) ) ( not ( = ?auto_79286 ?auto_79288 ) ) ( not ( = ?auto_79286 ?auto_79289 ) ) ( not ( = ?auto_79287 ?auto_79288 ) ) ( not ( = ?auto_79287 ?auto_79289 ) ) ( not ( = ?auto_79288 ?auto_79289 ) ) ( ON ?auto_79289 ?auto_79293 ) ( not ( = ?auto_79286 ?auto_79293 ) ) ( not ( = ?auto_79287 ?auto_79293 ) ) ( not ( = ?auto_79288 ?auto_79293 ) ) ( not ( = ?auto_79289 ?auto_79293 ) ) ( ON ?auto_79288 ?auto_79289 ) ( ON-TABLE ?auto_79292 ) ( ON ?auto_79290 ?auto_79292 ) ( ON ?auto_79291 ?auto_79290 ) ( ON ?auto_79293 ?auto_79291 ) ( not ( = ?auto_79292 ?auto_79290 ) ) ( not ( = ?auto_79292 ?auto_79291 ) ) ( not ( = ?auto_79292 ?auto_79293 ) ) ( not ( = ?auto_79292 ?auto_79289 ) ) ( not ( = ?auto_79292 ?auto_79288 ) ) ( not ( = ?auto_79290 ?auto_79291 ) ) ( not ( = ?auto_79290 ?auto_79293 ) ) ( not ( = ?auto_79290 ?auto_79289 ) ) ( not ( = ?auto_79290 ?auto_79288 ) ) ( not ( = ?auto_79291 ?auto_79293 ) ) ( not ( = ?auto_79291 ?auto_79289 ) ) ( not ( = ?auto_79291 ?auto_79288 ) ) ( not ( = ?auto_79286 ?auto_79292 ) ) ( not ( = ?auto_79286 ?auto_79290 ) ) ( not ( = ?auto_79286 ?auto_79291 ) ) ( not ( = ?auto_79287 ?auto_79292 ) ) ( not ( = ?auto_79287 ?auto_79290 ) ) ( not ( = ?auto_79287 ?auto_79291 ) ) ( CLEAR ?auto_79286 ) ( ON ?auto_79287 ?auto_79288 ) ( CLEAR ?auto_79287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79292 ?auto_79290 ?auto_79291 ?auto_79293 ?auto_79289 ?auto_79288 )
      ( MAKE-4PILE ?auto_79286 ?auto_79287 ?auto_79288 ?auto_79289 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79294 - BLOCK
      ?auto_79295 - BLOCK
      ?auto_79296 - BLOCK
      ?auto_79297 - BLOCK
    )
    :vars
    (
      ?auto_79299 - BLOCK
      ?auto_79301 - BLOCK
      ?auto_79298 - BLOCK
      ?auto_79300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79294 ?auto_79295 ) ) ( not ( = ?auto_79294 ?auto_79296 ) ) ( not ( = ?auto_79294 ?auto_79297 ) ) ( not ( = ?auto_79295 ?auto_79296 ) ) ( not ( = ?auto_79295 ?auto_79297 ) ) ( not ( = ?auto_79296 ?auto_79297 ) ) ( ON ?auto_79297 ?auto_79299 ) ( not ( = ?auto_79294 ?auto_79299 ) ) ( not ( = ?auto_79295 ?auto_79299 ) ) ( not ( = ?auto_79296 ?auto_79299 ) ) ( not ( = ?auto_79297 ?auto_79299 ) ) ( ON ?auto_79296 ?auto_79297 ) ( ON-TABLE ?auto_79301 ) ( ON ?auto_79298 ?auto_79301 ) ( ON ?auto_79300 ?auto_79298 ) ( ON ?auto_79299 ?auto_79300 ) ( not ( = ?auto_79301 ?auto_79298 ) ) ( not ( = ?auto_79301 ?auto_79300 ) ) ( not ( = ?auto_79301 ?auto_79299 ) ) ( not ( = ?auto_79301 ?auto_79297 ) ) ( not ( = ?auto_79301 ?auto_79296 ) ) ( not ( = ?auto_79298 ?auto_79300 ) ) ( not ( = ?auto_79298 ?auto_79299 ) ) ( not ( = ?auto_79298 ?auto_79297 ) ) ( not ( = ?auto_79298 ?auto_79296 ) ) ( not ( = ?auto_79300 ?auto_79299 ) ) ( not ( = ?auto_79300 ?auto_79297 ) ) ( not ( = ?auto_79300 ?auto_79296 ) ) ( not ( = ?auto_79294 ?auto_79301 ) ) ( not ( = ?auto_79294 ?auto_79298 ) ) ( not ( = ?auto_79294 ?auto_79300 ) ) ( not ( = ?auto_79295 ?auto_79301 ) ) ( not ( = ?auto_79295 ?auto_79298 ) ) ( not ( = ?auto_79295 ?auto_79300 ) ) ( ON ?auto_79295 ?auto_79296 ) ( CLEAR ?auto_79295 ) ( HOLDING ?auto_79294 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79294 )
      ( MAKE-4PILE ?auto_79294 ?auto_79295 ?auto_79296 ?auto_79297 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_79302 - BLOCK
      ?auto_79303 - BLOCK
      ?auto_79304 - BLOCK
      ?auto_79305 - BLOCK
    )
    :vars
    (
      ?auto_79309 - BLOCK
      ?auto_79307 - BLOCK
      ?auto_79308 - BLOCK
      ?auto_79306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79302 ?auto_79303 ) ) ( not ( = ?auto_79302 ?auto_79304 ) ) ( not ( = ?auto_79302 ?auto_79305 ) ) ( not ( = ?auto_79303 ?auto_79304 ) ) ( not ( = ?auto_79303 ?auto_79305 ) ) ( not ( = ?auto_79304 ?auto_79305 ) ) ( ON ?auto_79305 ?auto_79309 ) ( not ( = ?auto_79302 ?auto_79309 ) ) ( not ( = ?auto_79303 ?auto_79309 ) ) ( not ( = ?auto_79304 ?auto_79309 ) ) ( not ( = ?auto_79305 ?auto_79309 ) ) ( ON ?auto_79304 ?auto_79305 ) ( ON-TABLE ?auto_79307 ) ( ON ?auto_79308 ?auto_79307 ) ( ON ?auto_79306 ?auto_79308 ) ( ON ?auto_79309 ?auto_79306 ) ( not ( = ?auto_79307 ?auto_79308 ) ) ( not ( = ?auto_79307 ?auto_79306 ) ) ( not ( = ?auto_79307 ?auto_79309 ) ) ( not ( = ?auto_79307 ?auto_79305 ) ) ( not ( = ?auto_79307 ?auto_79304 ) ) ( not ( = ?auto_79308 ?auto_79306 ) ) ( not ( = ?auto_79308 ?auto_79309 ) ) ( not ( = ?auto_79308 ?auto_79305 ) ) ( not ( = ?auto_79308 ?auto_79304 ) ) ( not ( = ?auto_79306 ?auto_79309 ) ) ( not ( = ?auto_79306 ?auto_79305 ) ) ( not ( = ?auto_79306 ?auto_79304 ) ) ( not ( = ?auto_79302 ?auto_79307 ) ) ( not ( = ?auto_79302 ?auto_79308 ) ) ( not ( = ?auto_79302 ?auto_79306 ) ) ( not ( = ?auto_79303 ?auto_79307 ) ) ( not ( = ?auto_79303 ?auto_79308 ) ) ( not ( = ?auto_79303 ?auto_79306 ) ) ( ON ?auto_79303 ?auto_79304 ) ( ON ?auto_79302 ?auto_79303 ) ( CLEAR ?auto_79302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79307 ?auto_79308 ?auto_79306 ?auto_79309 ?auto_79305 ?auto_79304 ?auto_79303 )
      ( MAKE-4PILE ?auto_79302 ?auto_79303 ?auto_79304 ?auto_79305 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79313 - BLOCK
      ?auto_79314 - BLOCK
      ?auto_79315 - BLOCK
    )
    :vars
    (
      ?auto_79316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79316 ?auto_79315 ) ( CLEAR ?auto_79316 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79313 ) ( ON ?auto_79314 ?auto_79313 ) ( ON ?auto_79315 ?auto_79314 ) ( not ( = ?auto_79313 ?auto_79314 ) ) ( not ( = ?auto_79313 ?auto_79315 ) ) ( not ( = ?auto_79313 ?auto_79316 ) ) ( not ( = ?auto_79314 ?auto_79315 ) ) ( not ( = ?auto_79314 ?auto_79316 ) ) ( not ( = ?auto_79315 ?auto_79316 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79316 ?auto_79315 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79317 - BLOCK
      ?auto_79318 - BLOCK
      ?auto_79319 - BLOCK
    )
    :vars
    (
      ?auto_79320 - BLOCK
      ?auto_79321 - BLOCK
      ?auto_79322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79320 ?auto_79319 ) ( CLEAR ?auto_79320 ) ( ON-TABLE ?auto_79317 ) ( ON ?auto_79318 ?auto_79317 ) ( ON ?auto_79319 ?auto_79318 ) ( not ( = ?auto_79317 ?auto_79318 ) ) ( not ( = ?auto_79317 ?auto_79319 ) ) ( not ( = ?auto_79317 ?auto_79320 ) ) ( not ( = ?auto_79318 ?auto_79319 ) ) ( not ( = ?auto_79318 ?auto_79320 ) ) ( not ( = ?auto_79319 ?auto_79320 ) ) ( HOLDING ?auto_79321 ) ( CLEAR ?auto_79322 ) ( not ( = ?auto_79317 ?auto_79321 ) ) ( not ( = ?auto_79317 ?auto_79322 ) ) ( not ( = ?auto_79318 ?auto_79321 ) ) ( not ( = ?auto_79318 ?auto_79322 ) ) ( not ( = ?auto_79319 ?auto_79321 ) ) ( not ( = ?auto_79319 ?auto_79322 ) ) ( not ( = ?auto_79320 ?auto_79321 ) ) ( not ( = ?auto_79320 ?auto_79322 ) ) ( not ( = ?auto_79321 ?auto_79322 ) ) )
    :subtasks
    ( ( !STACK ?auto_79321 ?auto_79322 )
      ( MAKE-3PILE ?auto_79317 ?auto_79318 ?auto_79319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79323 - BLOCK
      ?auto_79324 - BLOCK
      ?auto_79325 - BLOCK
    )
    :vars
    (
      ?auto_79326 - BLOCK
      ?auto_79327 - BLOCK
      ?auto_79328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79326 ?auto_79325 ) ( ON-TABLE ?auto_79323 ) ( ON ?auto_79324 ?auto_79323 ) ( ON ?auto_79325 ?auto_79324 ) ( not ( = ?auto_79323 ?auto_79324 ) ) ( not ( = ?auto_79323 ?auto_79325 ) ) ( not ( = ?auto_79323 ?auto_79326 ) ) ( not ( = ?auto_79324 ?auto_79325 ) ) ( not ( = ?auto_79324 ?auto_79326 ) ) ( not ( = ?auto_79325 ?auto_79326 ) ) ( CLEAR ?auto_79327 ) ( not ( = ?auto_79323 ?auto_79328 ) ) ( not ( = ?auto_79323 ?auto_79327 ) ) ( not ( = ?auto_79324 ?auto_79328 ) ) ( not ( = ?auto_79324 ?auto_79327 ) ) ( not ( = ?auto_79325 ?auto_79328 ) ) ( not ( = ?auto_79325 ?auto_79327 ) ) ( not ( = ?auto_79326 ?auto_79328 ) ) ( not ( = ?auto_79326 ?auto_79327 ) ) ( not ( = ?auto_79328 ?auto_79327 ) ) ( ON ?auto_79328 ?auto_79326 ) ( CLEAR ?auto_79328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79323 ?auto_79324 ?auto_79325 ?auto_79326 )
      ( MAKE-3PILE ?auto_79323 ?auto_79324 ?auto_79325 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79329 - BLOCK
      ?auto_79330 - BLOCK
      ?auto_79331 - BLOCK
    )
    :vars
    (
      ?auto_79333 - BLOCK
      ?auto_79332 - BLOCK
      ?auto_79334 - BLOCK
      ?auto_79335 - BLOCK
      ?auto_79336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79333 ?auto_79331 ) ( ON-TABLE ?auto_79329 ) ( ON ?auto_79330 ?auto_79329 ) ( ON ?auto_79331 ?auto_79330 ) ( not ( = ?auto_79329 ?auto_79330 ) ) ( not ( = ?auto_79329 ?auto_79331 ) ) ( not ( = ?auto_79329 ?auto_79333 ) ) ( not ( = ?auto_79330 ?auto_79331 ) ) ( not ( = ?auto_79330 ?auto_79333 ) ) ( not ( = ?auto_79331 ?auto_79333 ) ) ( not ( = ?auto_79329 ?auto_79332 ) ) ( not ( = ?auto_79329 ?auto_79334 ) ) ( not ( = ?auto_79330 ?auto_79332 ) ) ( not ( = ?auto_79330 ?auto_79334 ) ) ( not ( = ?auto_79331 ?auto_79332 ) ) ( not ( = ?auto_79331 ?auto_79334 ) ) ( not ( = ?auto_79333 ?auto_79332 ) ) ( not ( = ?auto_79333 ?auto_79334 ) ) ( not ( = ?auto_79332 ?auto_79334 ) ) ( ON ?auto_79332 ?auto_79333 ) ( CLEAR ?auto_79332 ) ( HOLDING ?auto_79334 ) ( CLEAR ?auto_79335 ) ( ON-TABLE ?auto_79336 ) ( ON ?auto_79335 ?auto_79336 ) ( not ( = ?auto_79336 ?auto_79335 ) ) ( not ( = ?auto_79336 ?auto_79334 ) ) ( not ( = ?auto_79335 ?auto_79334 ) ) ( not ( = ?auto_79329 ?auto_79335 ) ) ( not ( = ?auto_79329 ?auto_79336 ) ) ( not ( = ?auto_79330 ?auto_79335 ) ) ( not ( = ?auto_79330 ?auto_79336 ) ) ( not ( = ?auto_79331 ?auto_79335 ) ) ( not ( = ?auto_79331 ?auto_79336 ) ) ( not ( = ?auto_79333 ?auto_79335 ) ) ( not ( = ?auto_79333 ?auto_79336 ) ) ( not ( = ?auto_79332 ?auto_79335 ) ) ( not ( = ?auto_79332 ?auto_79336 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79336 ?auto_79335 ?auto_79334 )
      ( MAKE-3PILE ?auto_79329 ?auto_79330 ?auto_79331 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79337 - BLOCK
      ?auto_79338 - BLOCK
      ?auto_79339 - BLOCK
    )
    :vars
    (
      ?auto_79341 - BLOCK
      ?auto_79344 - BLOCK
      ?auto_79342 - BLOCK
      ?auto_79343 - BLOCK
      ?auto_79340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79341 ?auto_79339 ) ( ON-TABLE ?auto_79337 ) ( ON ?auto_79338 ?auto_79337 ) ( ON ?auto_79339 ?auto_79338 ) ( not ( = ?auto_79337 ?auto_79338 ) ) ( not ( = ?auto_79337 ?auto_79339 ) ) ( not ( = ?auto_79337 ?auto_79341 ) ) ( not ( = ?auto_79338 ?auto_79339 ) ) ( not ( = ?auto_79338 ?auto_79341 ) ) ( not ( = ?auto_79339 ?auto_79341 ) ) ( not ( = ?auto_79337 ?auto_79344 ) ) ( not ( = ?auto_79337 ?auto_79342 ) ) ( not ( = ?auto_79338 ?auto_79344 ) ) ( not ( = ?auto_79338 ?auto_79342 ) ) ( not ( = ?auto_79339 ?auto_79344 ) ) ( not ( = ?auto_79339 ?auto_79342 ) ) ( not ( = ?auto_79341 ?auto_79344 ) ) ( not ( = ?auto_79341 ?auto_79342 ) ) ( not ( = ?auto_79344 ?auto_79342 ) ) ( ON ?auto_79344 ?auto_79341 ) ( CLEAR ?auto_79343 ) ( ON-TABLE ?auto_79340 ) ( ON ?auto_79343 ?auto_79340 ) ( not ( = ?auto_79340 ?auto_79343 ) ) ( not ( = ?auto_79340 ?auto_79342 ) ) ( not ( = ?auto_79343 ?auto_79342 ) ) ( not ( = ?auto_79337 ?auto_79343 ) ) ( not ( = ?auto_79337 ?auto_79340 ) ) ( not ( = ?auto_79338 ?auto_79343 ) ) ( not ( = ?auto_79338 ?auto_79340 ) ) ( not ( = ?auto_79339 ?auto_79343 ) ) ( not ( = ?auto_79339 ?auto_79340 ) ) ( not ( = ?auto_79341 ?auto_79343 ) ) ( not ( = ?auto_79341 ?auto_79340 ) ) ( not ( = ?auto_79344 ?auto_79343 ) ) ( not ( = ?auto_79344 ?auto_79340 ) ) ( ON ?auto_79342 ?auto_79344 ) ( CLEAR ?auto_79342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79337 ?auto_79338 ?auto_79339 ?auto_79341 ?auto_79344 )
      ( MAKE-3PILE ?auto_79337 ?auto_79338 ?auto_79339 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79345 - BLOCK
      ?auto_79346 - BLOCK
      ?auto_79347 - BLOCK
    )
    :vars
    (
      ?auto_79352 - BLOCK
      ?auto_79348 - BLOCK
      ?auto_79351 - BLOCK
      ?auto_79350 - BLOCK
      ?auto_79349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79352 ?auto_79347 ) ( ON-TABLE ?auto_79345 ) ( ON ?auto_79346 ?auto_79345 ) ( ON ?auto_79347 ?auto_79346 ) ( not ( = ?auto_79345 ?auto_79346 ) ) ( not ( = ?auto_79345 ?auto_79347 ) ) ( not ( = ?auto_79345 ?auto_79352 ) ) ( not ( = ?auto_79346 ?auto_79347 ) ) ( not ( = ?auto_79346 ?auto_79352 ) ) ( not ( = ?auto_79347 ?auto_79352 ) ) ( not ( = ?auto_79345 ?auto_79348 ) ) ( not ( = ?auto_79345 ?auto_79351 ) ) ( not ( = ?auto_79346 ?auto_79348 ) ) ( not ( = ?auto_79346 ?auto_79351 ) ) ( not ( = ?auto_79347 ?auto_79348 ) ) ( not ( = ?auto_79347 ?auto_79351 ) ) ( not ( = ?auto_79352 ?auto_79348 ) ) ( not ( = ?auto_79352 ?auto_79351 ) ) ( not ( = ?auto_79348 ?auto_79351 ) ) ( ON ?auto_79348 ?auto_79352 ) ( ON-TABLE ?auto_79350 ) ( not ( = ?auto_79350 ?auto_79349 ) ) ( not ( = ?auto_79350 ?auto_79351 ) ) ( not ( = ?auto_79349 ?auto_79351 ) ) ( not ( = ?auto_79345 ?auto_79349 ) ) ( not ( = ?auto_79345 ?auto_79350 ) ) ( not ( = ?auto_79346 ?auto_79349 ) ) ( not ( = ?auto_79346 ?auto_79350 ) ) ( not ( = ?auto_79347 ?auto_79349 ) ) ( not ( = ?auto_79347 ?auto_79350 ) ) ( not ( = ?auto_79352 ?auto_79349 ) ) ( not ( = ?auto_79352 ?auto_79350 ) ) ( not ( = ?auto_79348 ?auto_79349 ) ) ( not ( = ?auto_79348 ?auto_79350 ) ) ( ON ?auto_79351 ?auto_79348 ) ( CLEAR ?auto_79351 ) ( HOLDING ?auto_79349 ) ( CLEAR ?auto_79350 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79350 ?auto_79349 )
      ( MAKE-3PILE ?auto_79345 ?auto_79346 ?auto_79347 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80530 - BLOCK
      ?auto_80531 - BLOCK
      ?auto_80532 - BLOCK
    )
    :vars
    (
      ?auto_80535 - BLOCK
      ?auto_80533 - BLOCK
      ?auto_80536 - BLOCK
      ?auto_80534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80535 ?auto_80532 ) ( ON-TABLE ?auto_80530 ) ( ON ?auto_80531 ?auto_80530 ) ( ON ?auto_80532 ?auto_80531 ) ( not ( = ?auto_80530 ?auto_80531 ) ) ( not ( = ?auto_80530 ?auto_80532 ) ) ( not ( = ?auto_80530 ?auto_80535 ) ) ( not ( = ?auto_80531 ?auto_80532 ) ) ( not ( = ?auto_80531 ?auto_80535 ) ) ( not ( = ?auto_80532 ?auto_80535 ) ) ( not ( = ?auto_80530 ?auto_80533 ) ) ( not ( = ?auto_80530 ?auto_80536 ) ) ( not ( = ?auto_80531 ?auto_80533 ) ) ( not ( = ?auto_80531 ?auto_80536 ) ) ( not ( = ?auto_80532 ?auto_80533 ) ) ( not ( = ?auto_80532 ?auto_80536 ) ) ( not ( = ?auto_80535 ?auto_80533 ) ) ( not ( = ?auto_80535 ?auto_80536 ) ) ( not ( = ?auto_80533 ?auto_80536 ) ) ( ON ?auto_80533 ?auto_80535 ) ( not ( = ?auto_80534 ?auto_80536 ) ) ( not ( = ?auto_80530 ?auto_80534 ) ) ( not ( = ?auto_80531 ?auto_80534 ) ) ( not ( = ?auto_80532 ?auto_80534 ) ) ( not ( = ?auto_80535 ?auto_80534 ) ) ( not ( = ?auto_80533 ?auto_80534 ) ) ( ON ?auto_80536 ?auto_80533 ) ( ON ?auto_80534 ?auto_80536 ) ( CLEAR ?auto_80534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80530 ?auto_80531 ?auto_80532 ?auto_80535 ?auto_80533 ?auto_80536 )
      ( MAKE-3PILE ?auto_80530 ?auto_80531 ?auto_80532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79361 - BLOCK
      ?auto_79362 - BLOCK
      ?auto_79363 - BLOCK
    )
    :vars
    (
      ?auto_79367 - BLOCK
      ?auto_79366 - BLOCK
      ?auto_79364 - BLOCK
      ?auto_79368 - BLOCK
      ?auto_79365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79367 ?auto_79363 ) ( ON-TABLE ?auto_79361 ) ( ON ?auto_79362 ?auto_79361 ) ( ON ?auto_79363 ?auto_79362 ) ( not ( = ?auto_79361 ?auto_79362 ) ) ( not ( = ?auto_79361 ?auto_79363 ) ) ( not ( = ?auto_79361 ?auto_79367 ) ) ( not ( = ?auto_79362 ?auto_79363 ) ) ( not ( = ?auto_79362 ?auto_79367 ) ) ( not ( = ?auto_79363 ?auto_79367 ) ) ( not ( = ?auto_79361 ?auto_79366 ) ) ( not ( = ?auto_79361 ?auto_79364 ) ) ( not ( = ?auto_79362 ?auto_79366 ) ) ( not ( = ?auto_79362 ?auto_79364 ) ) ( not ( = ?auto_79363 ?auto_79366 ) ) ( not ( = ?auto_79363 ?auto_79364 ) ) ( not ( = ?auto_79367 ?auto_79366 ) ) ( not ( = ?auto_79367 ?auto_79364 ) ) ( not ( = ?auto_79366 ?auto_79364 ) ) ( ON ?auto_79366 ?auto_79367 ) ( not ( = ?auto_79368 ?auto_79365 ) ) ( not ( = ?auto_79368 ?auto_79364 ) ) ( not ( = ?auto_79365 ?auto_79364 ) ) ( not ( = ?auto_79361 ?auto_79365 ) ) ( not ( = ?auto_79361 ?auto_79368 ) ) ( not ( = ?auto_79362 ?auto_79365 ) ) ( not ( = ?auto_79362 ?auto_79368 ) ) ( not ( = ?auto_79363 ?auto_79365 ) ) ( not ( = ?auto_79363 ?auto_79368 ) ) ( not ( = ?auto_79367 ?auto_79365 ) ) ( not ( = ?auto_79367 ?auto_79368 ) ) ( not ( = ?auto_79366 ?auto_79365 ) ) ( not ( = ?auto_79366 ?auto_79368 ) ) ( ON ?auto_79364 ?auto_79366 ) ( ON ?auto_79365 ?auto_79364 ) ( CLEAR ?auto_79365 ) ( HOLDING ?auto_79368 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79368 )
      ( MAKE-3PILE ?auto_79361 ?auto_79362 ?auto_79363 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_79369 - BLOCK
      ?auto_79370 - BLOCK
      ?auto_79371 - BLOCK
    )
    :vars
    (
      ?auto_79375 - BLOCK
      ?auto_79373 - BLOCK
      ?auto_79372 - BLOCK
      ?auto_79374 - BLOCK
      ?auto_79376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79375 ?auto_79371 ) ( ON-TABLE ?auto_79369 ) ( ON ?auto_79370 ?auto_79369 ) ( ON ?auto_79371 ?auto_79370 ) ( not ( = ?auto_79369 ?auto_79370 ) ) ( not ( = ?auto_79369 ?auto_79371 ) ) ( not ( = ?auto_79369 ?auto_79375 ) ) ( not ( = ?auto_79370 ?auto_79371 ) ) ( not ( = ?auto_79370 ?auto_79375 ) ) ( not ( = ?auto_79371 ?auto_79375 ) ) ( not ( = ?auto_79369 ?auto_79373 ) ) ( not ( = ?auto_79369 ?auto_79372 ) ) ( not ( = ?auto_79370 ?auto_79373 ) ) ( not ( = ?auto_79370 ?auto_79372 ) ) ( not ( = ?auto_79371 ?auto_79373 ) ) ( not ( = ?auto_79371 ?auto_79372 ) ) ( not ( = ?auto_79375 ?auto_79373 ) ) ( not ( = ?auto_79375 ?auto_79372 ) ) ( not ( = ?auto_79373 ?auto_79372 ) ) ( ON ?auto_79373 ?auto_79375 ) ( not ( = ?auto_79374 ?auto_79376 ) ) ( not ( = ?auto_79374 ?auto_79372 ) ) ( not ( = ?auto_79376 ?auto_79372 ) ) ( not ( = ?auto_79369 ?auto_79376 ) ) ( not ( = ?auto_79369 ?auto_79374 ) ) ( not ( = ?auto_79370 ?auto_79376 ) ) ( not ( = ?auto_79370 ?auto_79374 ) ) ( not ( = ?auto_79371 ?auto_79376 ) ) ( not ( = ?auto_79371 ?auto_79374 ) ) ( not ( = ?auto_79375 ?auto_79376 ) ) ( not ( = ?auto_79375 ?auto_79374 ) ) ( not ( = ?auto_79373 ?auto_79376 ) ) ( not ( = ?auto_79373 ?auto_79374 ) ) ( ON ?auto_79372 ?auto_79373 ) ( ON ?auto_79376 ?auto_79372 ) ( ON ?auto_79374 ?auto_79376 ) ( CLEAR ?auto_79374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79369 ?auto_79370 ?auto_79371 ?auto_79375 ?auto_79373 ?auto_79372 ?auto_79376 )
      ( MAKE-3PILE ?auto_79369 ?auto_79370 ?auto_79371 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79382 - BLOCK
      ?auto_79383 - BLOCK
      ?auto_79384 - BLOCK
      ?auto_79385 - BLOCK
      ?auto_79386 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_79386 ) ( CLEAR ?auto_79385 ) ( ON-TABLE ?auto_79382 ) ( ON ?auto_79383 ?auto_79382 ) ( ON ?auto_79384 ?auto_79383 ) ( ON ?auto_79385 ?auto_79384 ) ( not ( = ?auto_79382 ?auto_79383 ) ) ( not ( = ?auto_79382 ?auto_79384 ) ) ( not ( = ?auto_79382 ?auto_79385 ) ) ( not ( = ?auto_79382 ?auto_79386 ) ) ( not ( = ?auto_79383 ?auto_79384 ) ) ( not ( = ?auto_79383 ?auto_79385 ) ) ( not ( = ?auto_79383 ?auto_79386 ) ) ( not ( = ?auto_79384 ?auto_79385 ) ) ( not ( = ?auto_79384 ?auto_79386 ) ) ( not ( = ?auto_79385 ?auto_79386 ) ) )
    :subtasks
    ( ( !STACK ?auto_79386 ?auto_79385 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79387 - BLOCK
      ?auto_79388 - BLOCK
      ?auto_79389 - BLOCK
      ?auto_79390 - BLOCK
      ?auto_79391 - BLOCK
    )
    :vars
    (
      ?auto_79392 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_79390 ) ( ON-TABLE ?auto_79387 ) ( ON ?auto_79388 ?auto_79387 ) ( ON ?auto_79389 ?auto_79388 ) ( ON ?auto_79390 ?auto_79389 ) ( not ( = ?auto_79387 ?auto_79388 ) ) ( not ( = ?auto_79387 ?auto_79389 ) ) ( not ( = ?auto_79387 ?auto_79390 ) ) ( not ( = ?auto_79387 ?auto_79391 ) ) ( not ( = ?auto_79388 ?auto_79389 ) ) ( not ( = ?auto_79388 ?auto_79390 ) ) ( not ( = ?auto_79388 ?auto_79391 ) ) ( not ( = ?auto_79389 ?auto_79390 ) ) ( not ( = ?auto_79389 ?auto_79391 ) ) ( not ( = ?auto_79390 ?auto_79391 ) ) ( ON ?auto_79391 ?auto_79392 ) ( CLEAR ?auto_79391 ) ( HAND-EMPTY ) ( not ( = ?auto_79387 ?auto_79392 ) ) ( not ( = ?auto_79388 ?auto_79392 ) ) ( not ( = ?auto_79389 ?auto_79392 ) ) ( not ( = ?auto_79390 ?auto_79392 ) ) ( not ( = ?auto_79391 ?auto_79392 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79391 ?auto_79392 )
      ( MAKE-5PILE ?auto_79387 ?auto_79388 ?auto_79389 ?auto_79390 ?auto_79391 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79393 - BLOCK
      ?auto_79394 - BLOCK
      ?auto_79395 - BLOCK
      ?auto_79396 - BLOCK
      ?auto_79397 - BLOCK
    )
    :vars
    (
      ?auto_79398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79393 ) ( ON ?auto_79394 ?auto_79393 ) ( ON ?auto_79395 ?auto_79394 ) ( not ( = ?auto_79393 ?auto_79394 ) ) ( not ( = ?auto_79393 ?auto_79395 ) ) ( not ( = ?auto_79393 ?auto_79396 ) ) ( not ( = ?auto_79393 ?auto_79397 ) ) ( not ( = ?auto_79394 ?auto_79395 ) ) ( not ( = ?auto_79394 ?auto_79396 ) ) ( not ( = ?auto_79394 ?auto_79397 ) ) ( not ( = ?auto_79395 ?auto_79396 ) ) ( not ( = ?auto_79395 ?auto_79397 ) ) ( not ( = ?auto_79396 ?auto_79397 ) ) ( ON ?auto_79397 ?auto_79398 ) ( CLEAR ?auto_79397 ) ( not ( = ?auto_79393 ?auto_79398 ) ) ( not ( = ?auto_79394 ?auto_79398 ) ) ( not ( = ?auto_79395 ?auto_79398 ) ) ( not ( = ?auto_79396 ?auto_79398 ) ) ( not ( = ?auto_79397 ?auto_79398 ) ) ( HOLDING ?auto_79396 ) ( CLEAR ?auto_79395 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79393 ?auto_79394 ?auto_79395 ?auto_79396 )
      ( MAKE-5PILE ?auto_79393 ?auto_79394 ?auto_79395 ?auto_79396 ?auto_79397 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79399 - BLOCK
      ?auto_79400 - BLOCK
      ?auto_79401 - BLOCK
      ?auto_79402 - BLOCK
      ?auto_79403 - BLOCK
    )
    :vars
    (
      ?auto_79404 - BLOCK
      ?auto_79406 - BLOCK
      ?auto_79405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79399 ) ( ON ?auto_79400 ?auto_79399 ) ( ON ?auto_79401 ?auto_79400 ) ( not ( = ?auto_79399 ?auto_79400 ) ) ( not ( = ?auto_79399 ?auto_79401 ) ) ( not ( = ?auto_79399 ?auto_79402 ) ) ( not ( = ?auto_79399 ?auto_79403 ) ) ( not ( = ?auto_79400 ?auto_79401 ) ) ( not ( = ?auto_79400 ?auto_79402 ) ) ( not ( = ?auto_79400 ?auto_79403 ) ) ( not ( = ?auto_79401 ?auto_79402 ) ) ( not ( = ?auto_79401 ?auto_79403 ) ) ( not ( = ?auto_79402 ?auto_79403 ) ) ( ON ?auto_79403 ?auto_79404 ) ( not ( = ?auto_79399 ?auto_79404 ) ) ( not ( = ?auto_79400 ?auto_79404 ) ) ( not ( = ?auto_79401 ?auto_79404 ) ) ( not ( = ?auto_79402 ?auto_79404 ) ) ( not ( = ?auto_79403 ?auto_79404 ) ) ( CLEAR ?auto_79401 ) ( ON ?auto_79402 ?auto_79403 ) ( CLEAR ?auto_79402 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79406 ) ( ON ?auto_79405 ?auto_79406 ) ( ON ?auto_79404 ?auto_79405 ) ( not ( = ?auto_79406 ?auto_79405 ) ) ( not ( = ?auto_79406 ?auto_79404 ) ) ( not ( = ?auto_79406 ?auto_79403 ) ) ( not ( = ?auto_79406 ?auto_79402 ) ) ( not ( = ?auto_79405 ?auto_79404 ) ) ( not ( = ?auto_79405 ?auto_79403 ) ) ( not ( = ?auto_79405 ?auto_79402 ) ) ( not ( = ?auto_79399 ?auto_79406 ) ) ( not ( = ?auto_79399 ?auto_79405 ) ) ( not ( = ?auto_79400 ?auto_79406 ) ) ( not ( = ?auto_79400 ?auto_79405 ) ) ( not ( = ?auto_79401 ?auto_79406 ) ) ( not ( = ?auto_79401 ?auto_79405 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79406 ?auto_79405 ?auto_79404 ?auto_79403 )
      ( MAKE-5PILE ?auto_79399 ?auto_79400 ?auto_79401 ?auto_79402 ?auto_79403 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79407 - BLOCK
      ?auto_79408 - BLOCK
      ?auto_79409 - BLOCK
      ?auto_79410 - BLOCK
      ?auto_79411 - BLOCK
    )
    :vars
    (
      ?auto_79413 - BLOCK
      ?auto_79414 - BLOCK
      ?auto_79412 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79407 ) ( ON ?auto_79408 ?auto_79407 ) ( not ( = ?auto_79407 ?auto_79408 ) ) ( not ( = ?auto_79407 ?auto_79409 ) ) ( not ( = ?auto_79407 ?auto_79410 ) ) ( not ( = ?auto_79407 ?auto_79411 ) ) ( not ( = ?auto_79408 ?auto_79409 ) ) ( not ( = ?auto_79408 ?auto_79410 ) ) ( not ( = ?auto_79408 ?auto_79411 ) ) ( not ( = ?auto_79409 ?auto_79410 ) ) ( not ( = ?auto_79409 ?auto_79411 ) ) ( not ( = ?auto_79410 ?auto_79411 ) ) ( ON ?auto_79411 ?auto_79413 ) ( not ( = ?auto_79407 ?auto_79413 ) ) ( not ( = ?auto_79408 ?auto_79413 ) ) ( not ( = ?auto_79409 ?auto_79413 ) ) ( not ( = ?auto_79410 ?auto_79413 ) ) ( not ( = ?auto_79411 ?auto_79413 ) ) ( ON ?auto_79410 ?auto_79411 ) ( CLEAR ?auto_79410 ) ( ON-TABLE ?auto_79414 ) ( ON ?auto_79412 ?auto_79414 ) ( ON ?auto_79413 ?auto_79412 ) ( not ( = ?auto_79414 ?auto_79412 ) ) ( not ( = ?auto_79414 ?auto_79413 ) ) ( not ( = ?auto_79414 ?auto_79411 ) ) ( not ( = ?auto_79414 ?auto_79410 ) ) ( not ( = ?auto_79412 ?auto_79413 ) ) ( not ( = ?auto_79412 ?auto_79411 ) ) ( not ( = ?auto_79412 ?auto_79410 ) ) ( not ( = ?auto_79407 ?auto_79414 ) ) ( not ( = ?auto_79407 ?auto_79412 ) ) ( not ( = ?auto_79408 ?auto_79414 ) ) ( not ( = ?auto_79408 ?auto_79412 ) ) ( not ( = ?auto_79409 ?auto_79414 ) ) ( not ( = ?auto_79409 ?auto_79412 ) ) ( HOLDING ?auto_79409 ) ( CLEAR ?auto_79408 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79407 ?auto_79408 ?auto_79409 )
      ( MAKE-5PILE ?auto_79407 ?auto_79408 ?auto_79409 ?auto_79410 ?auto_79411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79415 - BLOCK
      ?auto_79416 - BLOCK
      ?auto_79417 - BLOCK
      ?auto_79418 - BLOCK
      ?auto_79419 - BLOCK
    )
    :vars
    (
      ?auto_79420 - BLOCK
      ?auto_79421 - BLOCK
      ?auto_79422 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79415 ) ( ON ?auto_79416 ?auto_79415 ) ( not ( = ?auto_79415 ?auto_79416 ) ) ( not ( = ?auto_79415 ?auto_79417 ) ) ( not ( = ?auto_79415 ?auto_79418 ) ) ( not ( = ?auto_79415 ?auto_79419 ) ) ( not ( = ?auto_79416 ?auto_79417 ) ) ( not ( = ?auto_79416 ?auto_79418 ) ) ( not ( = ?auto_79416 ?auto_79419 ) ) ( not ( = ?auto_79417 ?auto_79418 ) ) ( not ( = ?auto_79417 ?auto_79419 ) ) ( not ( = ?auto_79418 ?auto_79419 ) ) ( ON ?auto_79419 ?auto_79420 ) ( not ( = ?auto_79415 ?auto_79420 ) ) ( not ( = ?auto_79416 ?auto_79420 ) ) ( not ( = ?auto_79417 ?auto_79420 ) ) ( not ( = ?auto_79418 ?auto_79420 ) ) ( not ( = ?auto_79419 ?auto_79420 ) ) ( ON ?auto_79418 ?auto_79419 ) ( ON-TABLE ?auto_79421 ) ( ON ?auto_79422 ?auto_79421 ) ( ON ?auto_79420 ?auto_79422 ) ( not ( = ?auto_79421 ?auto_79422 ) ) ( not ( = ?auto_79421 ?auto_79420 ) ) ( not ( = ?auto_79421 ?auto_79419 ) ) ( not ( = ?auto_79421 ?auto_79418 ) ) ( not ( = ?auto_79422 ?auto_79420 ) ) ( not ( = ?auto_79422 ?auto_79419 ) ) ( not ( = ?auto_79422 ?auto_79418 ) ) ( not ( = ?auto_79415 ?auto_79421 ) ) ( not ( = ?auto_79415 ?auto_79422 ) ) ( not ( = ?auto_79416 ?auto_79421 ) ) ( not ( = ?auto_79416 ?auto_79422 ) ) ( not ( = ?auto_79417 ?auto_79421 ) ) ( not ( = ?auto_79417 ?auto_79422 ) ) ( CLEAR ?auto_79416 ) ( ON ?auto_79417 ?auto_79418 ) ( CLEAR ?auto_79417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79421 ?auto_79422 ?auto_79420 ?auto_79419 ?auto_79418 )
      ( MAKE-5PILE ?auto_79415 ?auto_79416 ?auto_79417 ?auto_79418 ?auto_79419 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79423 - BLOCK
      ?auto_79424 - BLOCK
      ?auto_79425 - BLOCK
      ?auto_79426 - BLOCK
      ?auto_79427 - BLOCK
    )
    :vars
    (
      ?auto_79429 - BLOCK
      ?auto_79430 - BLOCK
      ?auto_79428 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79423 ) ( not ( = ?auto_79423 ?auto_79424 ) ) ( not ( = ?auto_79423 ?auto_79425 ) ) ( not ( = ?auto_79423 ?auto_79426 ) ) ( not ( = ?auto_79423 ?auto_79427 ) ) ( not ( = ?auto_79424 ?auto_79425 ) ) ( not ( = ?auto_79424 ?auto_79426 ) ) ( not ( = ?auto_79424 ?auto_79427 ) ) ( not ( = ?auto_79425 ?auto_79426 ) ) ( not ( = ?auto_79425 ?auto_79427 ) ) ( not ( = ?auto_79426 ?auto_79427 ) ) ( ON ?auto_79427 ?auto_79429 ) ( not ( = ?auto_79423 ?auto_79429 ) ) ( not ( = ?auto_79424 ?auto_79429 ) ) ( not ( = ?auto_79425 ?auto_79429 ) ) ( not ( = ?auto_79426 ?auto_79429 ) ) ( not ( = ?auto_79427 ?auto_79429 ) ) ( ON ?auto_79426 ?auto_79427 ) ( ON-TABLE ?auto_79430 ) ( ON ?auto_79428 ?auto_79430 ) ( ON ?auto_79429 ?auto_79428 ) ( not ( = ?auto_79430 ?auto_79428 ) ) ( not ( = ?auto_79430 ?auto_79429 ) ) ( not ( = ?auto_79430 ?auto_79427 ) ) ( not ( = ?auto_79430 ?auto_79426 ) ) ( not ( = ?auto_79428 ?auto_79429 ) ) ( not ( = ?auto_79428 ?auto_79427 ) ) ( not ( = ?auto_79428 ?auto_79426 ) ) ( not ( = ?auto_79423 ?auto_79430 ) ) ( not ( = ?auto_79423 ?auto_79428 ) ) ( not ( = ?auto_79424 ?auto_79430 ) ) ( not ( = ?auto_79424 ?auto_79428 ) ) ( not ( = ?auto_79425 ?auto_79430 ) ) ( not ( = ?auto_79425 ?auto_79428 ) ) ( ON ?auto_79425 ?auto_79426 ) ( CLEAR ?auto_79425 ) ( HOLDING ?auto_79424 ) ( CLEAR ?auto_79423 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79423 ?auto_79424 )
      ( MAKE-5PILE ?auto_79423 ?auto_79424 ?auto_79425 ?auto_79426 ?auto_79427 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79431 - BLOCK
      ?auto_79432 - BLOCK
      ?auto_79433 - BLOCK
      ?auto_79434 - BLOCK
      ?auto_79435 - BLOCK
    )
    :vars
    (
      ?auto_79436 - BLOCK
      ?auto_79438 - BLOCK
      ?auto_79437 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79431 ) ( not ( = ?auto_79431 ?auto_79432 ) ) ( not ( = ?auto_79431 ?auto_79433 ) ) ( not ( = ?auto_79431 ?auto_79434 ) ) ( not ( = ?auto_79431 ?auto_79435 ) ) ( not ( = ?auto_79432 ?auto_79433 ) ) ( not ( = ?auto_79432 ?auto_79434 ) ) ( not ( = ?auto_79432 ?auto_79435 ) ) ( not ( = ?auto_79433 ?auto_79434 ) ) ( not ( = ?auto_79433 ?auto_79435 ) ) ( not ( = ?auto_79434 ?auto_79435 ) ) ( ON ?auto_79435 ?auto_79436 ) ( not ( = ?auto_79431 ?auto_79436 ) ) ( not ( = ?auto_79432 ?auto_79436 ) ) ( not ( = ?auto_79433 ?auto_79436 ) ) ( not ( = ?auto_79434 ?auto_79436 ) ) ( not ( = ?auto_79435 ?auto_79436 ) ) ( ON ?auto_79434 ?auto_79435 ) ( ON-TABLE ?auto_79438 ) ( ON ?auto_79437 ?auto_79438 ) ( ON ?auto_79436 ?auto_79437 ) ( not ( = ?auto_79438 ?auto_79437 ) ) ( not ( = ?auto_79438 ?auto_79436 ) ) ( not ( = ?auto_79438 ?auto_79435 ) ) ( not ( = ?auto_79438 ?auto_79434 ) ) ( not ( = ?auto_79437 ?auto_79436 ) ) ( not ( = ?auto_79437 ?auto_79435 ) ) ( not ( = ?auto_79437 ?auto_79434 ) ) ( not ( = ?auto_79431 ?auto_79438 ) ) ( not ( = ?auto_79431 ?auto_79437 ) ) ( not ( = ?auto_79432 ?auto_79438 ) ) ( not ( = ?auto_79432 ?auto_79437 ) ) ( not ( = ?auto_79433 ?auto_79438 ) ) ( not ( = ?auto_79433 ?auto_79437 ) ) ( ON ?auto_79433 ?auto_79434 ) ( CLEAR ?auto_79431 ) ( ON ?auto_79432 ?auto_79433 ) ( CLEAR ?auto_79432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79438 ?auto_79437 ?auto_79436 ?auto_79435 ?auto_79434 ?auto_79433 )
      ( MAKE-5PILE ?auto_79431 ?auto_79432 ?auto_79433 ?auto_79434 ?auto_79435 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79439 - BLOCK
      ?auto_79440 - BLOCK
      ?auto_79441 - BLOCK
      ?auto_79442 - BLOCK
      ?auto_79443 - BLOCK
    )
    :vars
    (
      ?auto_79446 - BLOCK
      ?auto_79444 - BLOCK
      ?auto_79445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79439 ?auto_79440 ) ) ( not ( = ?auto_79439 ?auto_79441 ) ) ( not ( = ?auto_79439 ?auto_79442 ) ) ( not ( = ?auto_79439 ?auto_79443 ) ) ( not ( = ?auto_79440 ?auto_79441 ) ) ( not ( = ?auto_79440 ?auto_79442 ) ) ( not ( = ?auto_79440 ?auto_79443 ) ) ( not ( = ?auto_79441 ?auto_79442 ) ) ( not ( = ?auto_79441 ?auto_79443 ) ) ( not ( = ?auto_79442 ?auto_79443 ) ) ( ON ?auto_79443 ?auto_79446 ) ( not ( = ?auto_79439 ?auto_79446 ) ) ( not ( = ?auto_79440 ?auto_79446 ) ) ( not ( = ?auto_79441 ?auto_79446 ) ) ( not ( = ?auto_79442 ?auto_79446 ) ) ( not ( = ?auto_79443 ?auto_79446 ) ) ( ON ?auto_79442 ?auto_79443 ) ( ON-TABLE ?auto_79444 ) ( ON ?auto_79445 ?auto_79444 ) ( ON ?auto_79446 ?auto_79445 ) ( not ( = ?auto_79444 ?auto_79445 ) ) ( not ( = ?auto_79444 ?auto_79446 ) ) ( not ( = ?auto_79444 ?auto_79443 ) ) ( not ( = ?auto_79444 ?auto_79442 ) ) ( not ( = ?auto_79445 ?auto_79446 ) ) ( not ( = ?auto_79445 ?auto_79443 ) ) ( not ( = ?auto_79445 ?auto_79442 ) ) ( not ( = ?auto_79439 ?auto_79444 ) ) ( not ( = ?auto_79439 ?auto_79445 ) ) ( not ( = ?auto_79440 ?auto_79444 ) ) ( not ( = ?auto_79440 ?auto_79445 ) ) ( not ( = ?auto_79441 ?auto_79444 ) ) ( not ( = ?auto_79441 ?auto_79445 ) ) ( ON ?auto_79441 ?auto_79442 ) ( ON ?auto_79440 ?auto_79441 ) ( CLEAR ?auto_79440 ) ( HOLDING ?auto_79439 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79439 )
      ( MAKE-5PILE ?auto_79439 ?auto_79440 ?auto_79441 ?auto_79442 ?auto_79443 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_79447 - BLOCK
      ?auto_79448 - BLOCK
      ?auto_79449 - BLOCK
      ?auto_79450 - BLOCK
      ?auto_79451 - BLOCK
    )
    :vars
    (
      ?auto_79453 - BLOCK
      ?auto_79452 - BLOCK
      ?auto_79454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79447 ?auto_79448 ) ) ( not ( = ?auto_79447 ?auto_79449 ) ) ( not ( = ?auto_79447 ?auto_79450 ) ) ( not ( = ?auto_79447 ?auto_79451 ) ) ( not ( = ?auto_79448 ?auto_79449 ) ) ( not ( = ?auto_79448 ?auto_79450 ) ) ( not ( = ?auto_79448 ?auto_79451 ) ) ( not ( = ?auto_79449 ?auto_79450 ) ) ( not ( = ?auto_79449 ?auto_79451 ) ) ( not ( = ?auto_79450 ?auto_79451 ) ) ( ON ?auto_79451 ?auto_79453 ) ( not ( = ?auto_79447 ?auto_79453 ) ) ( not ( = ?auto_79448 ?auto_79453 ) ) ( not ( = ?auto_79449 ?auto_79453 ) ) ( not ( = ?auto_79450 ?auto_79453 ) ) ( not ( = ?auto_79451 ?auto_79453 ) ) ( ON ?auto_79450 ?auto_79451 ) ( ON-TABLE ?auto_79452 ) ( ON ?auto_79454 ?auto_79452 ) ( ON ?auto_79453 ?auto_79454 ) ( not ( = ?auto_79452 ?auto_79454 ) ) ( not ( = ?auto_79452 ?auto_79453 ) ) ( not ( = ?auto_79452 ?auto_79451 ) ) ( not ( = ?auto_79452 ?auto_79450 ) ) ( not ( = ?auto_79454 ?auto_79453 ) ) ( not ( = ?auto_79454 ?auto_79451 ) ) ( not ( = ?auto_79454 ?auto_79450 ) ) ( not ( = ?auto_79447 ?auto_79452 ) ) ( not ( = ?auto_79447 ?auto_79454 ) ) ( not ( = ?auto_79448 ?auto_79452 ) ) ( not ( = ?auto_79448 ?auto_79454 ) ) ( not ( = ?auto_79449 ?auto_79452 ) ) ( not ( = ?auto_79449 ?auto_79454 ) ) ( ON ?auto_79449 ?auto_79450 ) ( ON ?auto_79448 ?auto_79449 ) ( ON ?auto_79447 ?auto_79448 ) ( CLEAR ?auto_79447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79452 ?auto_79454 ?auto_79453 ?auto_79451 ?auto_79450 ?auto_79449 ?auto_79448 )
      ( MAKE-5PILE ?auto_79447 ?auto_79448 ?auto_79449 ?auto_79450 ?auto_79451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79457 - BLOCK
      ?auto_79458 - BLOCK
    )
    :vars
    (
      ?auto_79459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79459 ?auto_79458 ) ( CLEAR ?auto_79459 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79457 ) ( ON ?auto_79458 ?auto_79457 ) ( not ( = ?auto_79457 ?auto_79458 ) ) ( not ( = ?auto_79457 ?auto_79459 ) ) ( not ( = ?auto_79458 ?auto_79459 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79459 ?auto_79458 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79460 - BLOCK
      ?auto_79461 - BLOCK
    )
    :vars
    (
      ?auto_79462 - BLOCK
      ?auto_79463 - BLOCK
      ?auto_79464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79462 ?auto_79461 ) ( CLEAR ?auto_79462 ) ( ON-TABLE ?auto_79460 ) ( ON ?auto_79461 ?auto_79460 ) ( not ( = ?auto_79460 ?auto_79461 ) ) ( not ( = ?auto_79460 ?auto_79462 ) ) ( not ( = ?auto_79461 ?auto_79462 ) ) ( HOLDING ?auto_79463 ) ( CLEAR ?auto_79464 ) ( not ( = ?auto_79460 ?auto_79463 ) ) ( not ( = ?auto_79460 ?auto_79464 ) ) ( not ( = ?auto_79461 ?auto_79463 ) ) ( not ( = ?auto_79461 ?auto_79464 ) ) ( not ( = ?auto_79462 ?auto_79463 ) ) ( not ( = ?auto_79462 ?auto_79464 ) ) ( not ( = ?auto_79463 ?auto_79464 ) ) )
    :subtasks
    ( ( !STACK ?auto_79463 ?auto_79464 )
      ( MAKE-2PILE ?auto_79460 ?auto_79461 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79465 - BLOCK
      ?auto_79466 - BLOCK
    )
    :vars
    (
      ?auto_79468 - BLOCK
      ?auto_79469 - BLOCK
      ?auto_79467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79468 ?auto_79466 ) ( ON-TABLE ?auto_79465 ) ( ON ?auto_79466 ?auto_79465 ) ( not ( = ?auto_79465 ?auto_79466 ) ) ( not ( = ?auto_79465 ?auto_79468 ) ) ( not ( = ?auto_79466 ?auto_79468 ) ) ( CLEAR ?auto_79469 ) ( not ( = ?auto_79465 ?auto_79467 ) ) ( not ( = ?auto_79465 ?auto_79469 ) ) ( not ( = ?auto_79466 ?auto_79467 ) ) ( not ( = ?auto_79466 ?auto_79469 ) ) ( not ( = ?auto_79468 ?auto_79467 ) ) ( not ( = ?auto_79468 ?auto_79469 ) ) ( not ( = ?auto_79467 ?auto_79469 ) ) ( ON ?auto_79467 ?auto_79468 ) ( CLEAR ?auto_79467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79465 ?auto_79466 ?auto_79468 )
      ( MAKE-2PILE ?auto_79465 ?auto_79466 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79470 - BLOCK
      ?auto_79471 - BLOCK
    )
    :vars
    (
      ?auto_79474 - BLOCK
      ?auto_79473 - BLOCK
      ?auto_79472 - BLOCK
      ?auto_79476 - BLOCK
      ?auto_79475 - BLOCK
      ?auto_79477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79474 ?auto_79471 ) ( ON-TABLE ?auto_79470 ) ( ON ?auto_79471 ?auto_79470 ) ( not ( = ?auto_79470 ?auto_79471 ) ) ( not ( = ?auto_79470 ?auto_79474 ) ) ( not ( = ?auto_79471 ?auto_79474 ) ) ( not ( = ?auto_79470 ?auto_79473 ) ) ( not ( = ?auto_79470 ?auto_79472 ) ) ( not ( = ?auto_79471 ?auto_79473 ) ) ( not ( = ?auto_79471 ?auto_79472 ) ) ( not ( = ?auto_79474 ?auto_79473 ) ) ( not ( = ?auto_79474 ?auto_79472 ) ) ( not ( = ?auto_79473 ?auto_79472 ) ) ( ON ?auto_79473 ?auto_79474 ) ( CLEAR ?auto_79473 ) ( HOLDING ?auto_79472 ) ( CLEAR ?auto_79476 ) ( ON-TABLE ?auto_79475 ) ( ON ?auto_79477 ?auto_79475 ) ( ON ?auto_79476 ?auto_79477 ) ( not ( = ?auto_79475 ?auto_79477 ) ) ( not ( = ?auto_79475 ?auto_79476 ) ) ( not ( = ?auto_79475 ?auto_79472 ) ) ( not ( = ?auto_79477 ?auto_79476 ) ) ( not ( = ?auto_79477 ?auto_79472 ) ) ( not ( = ?auto_79476 ?auto_79472 ) ) ( not ( = ?auto_79470 ?auto_79476 ) ) ( not ( = ?auto_79470 ?auto_79475 ) ) ( not ( = ?auto_79470 ?auto_79477 ) ) ( not ( = ?auto_79471 ?auto_79476 ) ) ( not ( = ?auto_79471 ?auto_79475 ) ) ( not ( = ?auto_79471 ?auto_79477 ) ) ( not ( = ?auto_79474 ?auto_79476 ) ) ( not ( = ?auto_79474 ?auto_79475 ) ) ( not ( = ?auto_79474 ?auto_79477 ) ) ( not ( = ?auto_79473 ?auto_79476 ) ) ( not ( = ?auto_79473 ?auto_79475 ) ) ( not ( = ?auto_79473 ?auto_79477 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79475 ?auto_79477 ?auto_79476 ?auto_79472 )
      ( MAKE-2PILE ?auto_79470 ?auto_79471 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79478 - BLOCK
      ?auto_79479 - BLOCK
    )
    :vars
    (
      ?auto_79480 - BLOCK
      ?auto_79483 - BLOCK
      ?auto_79482 - BLOCK
      ?auto_79485 - BLOCK
      ?auto_79481 - BLOCK
      ?auto_79484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79480 ?auto_79479 ) ( ON-TABLE ?auto_79478 ) ( ON ?auto_79479 ?auto_79478 ) ( not ( = ?auto_79478 ?auto_79479 ) ) ( not ( = ?auto_79478 ?auto_79480 ) ) ( not ( = ?auto_79479 ?auto_79480 ) ) ( not ( = ?auto_79478 ?auto_79483 ) ) ( not ( = ?auto_79478 ?auto_79482 ) ) ( not ( = ?auto_79479 ?auto_79483 ) ) ( not ( = ?auto_79479 ?auto_79482 ) ) ( not ( = ?auto_79480 ?auto_79483 ) ) ( not ( = ?auto_79480 ?auto_79482 ) ) ( not ( = ?auto_79483 ?auto_79482 ) ) ( ON ?auto_79483 ?auto_79480 ) ( CLEAR ?auto_79485 ) ( ON-TABLE ?auto_79481 ) ( ON ?auto_79484 ?auto_79481 ) ( ON ?auto_79485 ?auto_79484 ) ( not ( = ?auto_79481 ?auto_79484 ) ) ( not ( = ?auto_79481 ?auto_79485 ) ) ( not ( = ?auto_79481 ?auto_79482 ) ) ( not ( = ?auto_79484 ?auto_79485 ) ) ( not ( = ?auto_79484 ?auto_79482 ) ) ( not ( = ?auto_79485 ?auto_79482 ) ) ( not ( = ?auto_79478 ?auto_79485 ) ) ( not ( = ?auto_79478 ?auto_79481 ) ) ( not ( = ?auto_79478 ?auto_79484 ) ) ( not ( = ?auto_79479 ?auto_79485 ) ) ( not ( = ?auto_79479 ?auto_79481 ) ) ( not ( = ?auto_79479 ?auto_79484 ) ) ( not ( = ?auto_79480 ?auto_79485 ) ) ( not ( = ?auto_79480 ?auto_79481 ) ) ( not ( = ?auto_79480 ?auto_79484 ) ) ( not ( = ?auto_79483 ?auto_79485 ) ) ( not ( = ?auto_79483 ?auto_79481 ) ) ( not ( = ?auto_79483 ?auto_79484 ) ) ( ON ?auto_79482 ?auto_79483 ) ( CLEAR ?auto_79482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79478 ?auto_79479 ?auto_79480 ?auto_79483 )
      ( MAKE-2PILE ?auto_79478 ?auto_79479 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79486 - BLOCK
      ?auto_79487 - BLOCK
    )
    :vars
    (
      ?auto_79493 - BLOCK
      ?auto_79491 - BLOCK
      ?auto_79488 - BLOCK
      ?auto_79492 - BLOCK
      ?auto_79489 - BLOCK
      ?auto_79490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79493 ?auto_79487 ) ( ON-TABLE ?auto_79486 ) ( ON ?auto_79487 ?auto_79486 ) ( not ( = ?auto_79486 ?auto_79487 ) ) ( not ( = ?auto_79486 ?auto_79493 ) ) ( not ( = ?auto_79487 ?auto_79493 ) ) ( not ( = ?auto_79486 ?auto_79491 ) ) ( not ( = ?auto_79486 ?auto_79488 ) ) ( not ( = ?auto_79487 ?auto_79491 ) ) ( not ( = ?auto_79487 ?auto_79488 ) ) ( not ( = ?auto_79493 ?auto_79491 ) ) ( not ( = ?auto_79493 ?auto_79488 ) ) ( not ( = ?auto_79491 ?auto_79488 ) ) ( ON ?auto_79491 ?auto_79493 ) ( ON-TABLE ?auto_79492 ) ( ON ?auto_79489 ?auto_79492 ) ( not ( = ?auto_79492 ?auto_79489 ) ) ( not ( = ?auto_79492 ?auto_79490 ) ) ( not ( = ?auto_79492 ?auto_79488 ) ) ( not ( = ?auto_79489 ?auto_79490 ) ) ( not ( = ?auto_79489 ?auto_79488 ) ) ( not ( = ?auto_79490 ?auto_79488 ) ) ( not ( = ?auto_79486 ?auto_79490 ) ) ( not ( = ?auto_79486 ?auto_79492 ) ) ( not ( = ?auto_79486 ?auto_79489 ) ) ( not ( = ?auto_79487 ?auto_79490 ) ) ( not ( = ?auto_79487 ?auto_79492 ) ) ( not ( = ?auto_79487 ?auto_79489 ) ) ( not ( = ?auto_79493 ?auto_79490 ) ) ( not ( = ?auto_79493 ?auto_79492 ) ) ( not ( = ?auto_79493 ?auto_79489 ) ) ( not ( = ?auto_79491 ?auto_79490 ) ) ( not ( = ?auto_79491 ?auto_79492 ) ) ( not ( = ?auto_79491 ?auto_79489 ) ) ( ON ?auto_79488 ?auto_79491 ) ( CLEAR ?auto_79488 ) ( HOLDING ?auto_79490 ) ( CLEAR ?auto_79489 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79492 ?auto_79489 ?auto_79490 )
      ( MAKE-2PILE ?auto_79486 ?auto_79487 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79494 - BLOCK
      ?auto_79495 - BLOCK
    )
    :vars
    (
      ?auto_79498 - BLOCK
      ?auto_79496 - BLOCK
      ?auto_79499 - BLOCK
      ?auto_79497 - BLOCK
      ?auto_79501 - BLOCK
      ?auto_79500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79498 ?auto_79495 ) ( ON-TABLE ?auto_79494 ) ( ON ?auto_79495 ?auto_79494 ) ( not ( = ?auto_79494 ?auto_79495 ) ) ( not ( = ?auto_79494 ?auto_79498 ) ) ( not ( = ?auto_79495 ?auto_79498 ) ) ( not ( = ?auto_79494 ?auto_79496 ) ) ( not ( = ?auto_79494 ?auto_79499 ) ) ( not ( = ?auto_79495 ?auto_79496 ) ) ( not ( = ?auto_79495 ?auto_79499 ) ) ( not ( = ?auto_79498 ?auto_79496 ) ) ( not ( = ?auto_79498 ?auto_79499 ) ) ( not ( = ?auto_79496 ?auto_79499 ) ) ( ON ?auto_79496 ?auto_79498 ) ( ON-TABLE ?auto_79497 ) ( ON ?auto_79501 ?auto_79497 ) ( not ( = ?auto_79497 ?auto_79501 ) ) ( not ( = ?auto_79497 ?auto_79500 ) ) ( not ( = ?auto_79497 ?auto_79499 ) ) ( not ( = ?auto_79501 ?auto_79500 ) ) ( not ( = ?auto_79501 ?auto_79499 ) ) ( not ( = ?auto_79500 ?auto_79499 ) ) ( not ( = ?auto_79494 ?auto_79500 ) ) ( not ( = ?auto_79494 ?auto_79497 ) ) ( not ( = ?auto_79494 ?auto_79501 ) ) ( not ( = ?auto_79495 ?auto_79500 ) ) ( not ( = ?auto_79495 ?auto_79497 ) ) ( not ( = ?auto_79495 ?auto_79501 ) ) ( not ( = ?auto_79498 ?auto_79500 ) ) ( not ( = ?auto_79498 ?auto_79497 ) ) ( not ( = ?auto_79498 ?auto_79501 ) ) ( not ( = ?auto_79496 ?auto_79500 ) ) ( not ( = ?auto_79496 ?auto_79497 ) ) ( not ( = ?auto_79496 ?auto_79501 ) ) ( ON ?auto_79499 ?auto_79496 ) ( CLEAR ?auto_79501 ) ( ON ?auto_79500 ?auto_79499 ) ( CLEAR ?auto_79500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79494 ?auto_79495 ?auto_79498 ?auto_79496 ?auto_79499 )
      ( MAKE-2PILE ?auto_79494 ?auto_79495 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79502 - BLOCK
      ?auto_79503 - BLOCK
    )
    :vars
    (
      ?auto_79509 - BLOCK
      ?auto_79504 - BLOCK
      ?auto_79506 - BLOCK
      ?auto_79507 - BLOCK
      ?auto_79505 - BLOCK
      ?auto_79508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79509 ?auto_79503 ) ( ON-TABLE ?auto_79502 ) ( ON ?auto_79503 ?auto_79502 ) ( not ( = ?auto_79502 ?auto_79503 ) ) ( not ( = ?auto_79502 ?auto_79509 ) ) ( not ( = ?auto_79503 ?auto_79509 ) ) ( not ( = ?auto_79502 ?auto_79504 ) ) ( not ( = ?auto_79502 ?auto_79506 ) ) ( not ( = ?auto_79503 ?auto_79504 ) ) ( not ( = ?auto_79503 ?auto_79506 ) ) ( not ( = ?auto_79509 ?auto_79504 ) ) ( not ( = ?auto_79509 ?auto_79506 ) ) ( not ( = ?auto_79504 ?auto_79506 ) ) ( ON ?auto_79504 ?auto_79509 ) ( ON-TABLE ?auto_79507 ) ( not ( = ?auto_79507 ?auto_79505 ) ) ( not ( = ?auto_79507 ?auto_79508 ) ) ( not ( = ?auto_79507 ?auto_79506 ) ) ( not ( = ?auto_79505 ?auto_79508 ) ) ( not ( = ?auto_79505 ?auto_79506 ) ) ( not ( = ?auto_79508 ?auto_79506 ) ) ( not ( = ?auto_79502 ?auto_79508 ) ) ( not ( = ?auto_79502 ?auto_79507 ) ) ( not ( = ?auto_79502 ?auto_79505 ) ) ( not ( = ?auto_79503 ?auto_79508 ) ) ( not ( = ?auto_79503 ?auto_79507 ) ) ( not ( = ?auto_79503 ?auto_79505 ) ) ( not ( = ?auto_79509 ?auto_79508 ) ) ( not ( = ?auto_79509 ?auto_79507 ) ) ( not ( = ?auto_79509 ?auto_79505 ) ) ( not ( = ?auto_79504 ?auto_79508 ) ) ( not ( = ?auto_79504 ?auto_79507 ) ) ( not ( = ?auto_79504 ?auto_79505 ) ) ( ON ?auto_79506 ?auto_79504 ) ( ON ?auto_79508 ?auto_79506 ) ( CLEAR ?auto_79508 ) ( HOLDING ?auto_79505 ) ( CLEAR ?auto_79507 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79507 ?auto_79505 )
      ( MAKE-2PILE ?auto_79502 ?auto_79503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80803 - BLOCK
      ?auto_80804 - BLOCK
    )
    :vars
    (
      ?auto_80809 - BLOCK
      ?auto_80808 - BLOCK
      ?auto_80805 - BLOCK
      ?auto_80806 - BLOCK
      ?auto_80807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80809 ?auto_80804 ) ( ON-TABLE ?auto_80803 ) ( ON ?auto_80804 ?auto_80803 ) ( not ( = ?auto_80803 ?auto_80804 ) ) ( not ( = ?auto_80803 ?auto_80809 ) ) ( not ( = ?auto_80804 ?auto_80809 ) ) ( not ( = ?auto_80803 ?auto_80808 ) ) ( not ( = ?auto_80803 ?auto_80805 ) ) ( not ( = ?auto_80804 ?auto_80808 ) ) ( not ( = ?auto_80804 ?auto_80805 ) ) ( not ( = ?auto_80809 ?auto_80808 ) ) ( not ( = ?auto_80809 ?auto_80805 ) ) ( not ( = ?auto_80808 ?auto_80805 ) ) ( ON ?auto_80808 ?auto_80809 ) ( not ( = ?auto_80806 ?auto_80807 ) ) ( not ( = ?auto_80806 ?auto_80805 ) ) ( not ( = ?auto_80807 ?auto_80805 ) ) ( not ( = ?auto_80803 ?auto_80807 ) ) ( not ( = ?auto_80803 ?auto_80806 ) ) ( not ( = ?auto_80804 ?auto_80807 ) ) ( not ( = ?auto_80804 ?auto_80806 ) ) ( not ( = ?auto_80809 ?auto_80807 ) ) ( not ( = ?auto_80809 ?auto_80806 ) ) ( not ( = ?auto_80808 ?auto_80807 ) ) ( not ( = ?auto_80808 ?auto_80806 ) ) ( ON ?auto_80805 ?auto_80808 ) ( ON ?auto_80807 ?auto_80805 ) ( ON ?auto_80806 ?auto_80807 ) ( CLEAR ?auto_80806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80803 ?auto_80804 ?auto_80809 ?auto_80808 ?auto_80805 ?auto_80807 )
      ( MAKE-2PILE ?auto_80803 ?auto_80804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79518 - BLOCK
      ?auto_79519 - BLOCK
    )
    :vars
    (
      ?auto_79523 - BLOCK
      ?auto_79521 - BLOCK
      ?auto_79520 - BLOCK
      ?auto_79522 - BLOCK
      ?auto_79524 - BLOCK
      ?auto_79525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79523 ?auto_79519 ) ( ON-TABLE ?auto_79518 ) ( ON ?auto_79519 ?auto_79518 ) ( not ( = ?auto_79518 ?auto_79519 ) ) ( not ( = ?auto_79518 ?auto_79523 ) ) ( not ( = ?auto_79519 ?auto_79523 ) ) ( not ( = ?auto_79518 ?auto_79521 ) ) ( not ( = ?auto_79518 ?auto_79520 ) ) ( not ( = ?auto_79519 ?auto_79521 ) ) ( not ( = ?auto_79519 ?auto_79520 ) ) ( not ( = ?auto_79523 ?auto_79521 ) ) ( not ( = ?auto_79523 ?auto_79520 ) ) ( not ( = ?auto_79521 ?auto_79520 ) ) ( ON ?auto_79521 ?auto_79523 ) ( not ( = ?auto_79522 ?auto_79524 ) ) ( not ( = ?auto_79522 ?auto_79525 ) ) ( not ( = ?auto_79522 ?auto_79520 ) ) ( not ( = ?auto_79524 ?auto_79525 ) ) ( not ( = ?auto_79524 ?auto_79520 ) ) ( not ( = ?auto_79525 ?auto_79520 ) ) ( not ( = ?auto_79518 ?auto_79525 ) ) ( not ( = ?auto_79518 ?auto_79522 ) ) ( not ( = ?auto_79518 ?auto_79524 ) ) ( not ( = ?auto_79519 ?auto_79525 ) ) ( not ( = ?auto_79519 ?auto_79522 ) ) ( not ( = ?auto_79519 ?auto_79524 ) ) ( not ( = ?auto_79523 ?auto_79525 ) ) ( not ( = ?auto_79523 ?auto_79522 ) ) ( not ( = ?auto_79523 ?auto_79524 ) ) ( not ( = ?auto_79521 ?auto_79525 ) ) ( not ( = ?auto_79521 ?auto_79522 ) ) ( not ( = ?auto_79521 ?auto_79524 ) ) ( ON ?auto_79520 ?auto_79521 ) ( ON ?auto_79525 ?auto_79520 ) ( ON ?auto_79524 ?auto_79525 ) ( CLEAR ?auto_79524 ) ( HOLDING ?auto_79522 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79522 )
      ( MAKE-2PILE ?auto_79518 ?auto_79519 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_79526 - BLOCK
      ?auto_79527 - BLOCK
    )
    :vars
    (
      ?auto_79530 - BLOCK
      ?auto_79529 - BLOCK
      ?auto_79533 - BLOCK
      ?auto_79528 - BLOCK
      ?auto_79531 - BLOCK
      ?auto_79532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79530 ?auto_79527 ) ( ON-TABLE ?auto_79526 ) ( ON ?auto_79527 ?auto_79526 ) ( not ( = ?auto_79526 ?auto_79527 ) ) ( not ( = ?auto_79526 ?auto_79530 ) ) ( not ( = ?auto_79527 ?auto_79530 ) ) ( not ( = ?auto_79526 ?auto_79529 ) ) ( not ( = ?auto_79526 ?auto_79533 ) ) ( not ( = ?auto_79527 ?auto_79529 ) ) ( not ( = ?auto_79527 ?auto_79533 ) ) ( not ( = ?auto_79530 ?auto_79529 ) ) ( not ( = ?auto_79530 ?auto_79533 ) ) ( not ( = ?auto_79529 ?auto_79533 ) ) ( ON ?auto_79529 ?auto_79530 ) ( not ( = ?auto_79528 ?auto_79531 ) ) ( not ( = ?auto_79528 ?auto_79532 ) ) ( not ( = ?auto_79528 ?auto_79533 ) ) ( not ( = ?auto_79531 ?auto_79532 ) ) ( not ( = ?auto_79531 ?auto_79533 ) ) ( not ( = ?auto_79532 ?auto_79533 ) ) ( not ( = ?auto_79526 ?auto_79532 ) ) ( not ( = ?auto_79526 ?auto_79528 ) ) ( not ( = ?auto_79526 ?auto_79531 ) ) ( not ( = ?auto_79527 ?auto_79532 ) ) ( not ( = ?auto_79527 ?auto_79528 ) ) ( not ( = ?auto_79527 ?auto_79531 ) ) ( not ( = ?auto_79530 ?auto_79532 ) ) ( not ( = ?auto_79530 ?auto_79528 ) ) ( not ( = ?auto_79530 ?auto_79531 ) ) ( not ( = ?auto_79529 ?auto_79532 ) ) ( not ( = ?auto_79529 ?auto_79528 ) ) ( not ( = ?auto_79529 ?auto_79531 ) ) ( ON ?auto_79533 ?auto_79529 ) ( ON ?auto_79532 ?auto_79533 ) ( ON ?auto_79531 ?auto_79532 ) ( ON ?auto_79528 ?auto_79531 ) ( CLEAR ?auto_79528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79526 ?auto_79527 ?auto_79530 ?auto_79529 ?auto_79533 ?auto_79532 ?auto_79531 )
      ( MAKE-2PILE ?auto_79526 ?auto_79527 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79540 - BLOCK
      ?auto_79541 - BLOCK
      ?auto_79542 - BLOCK
      ?auto_79543 - BLOCK
      ?auto_79544 - BLOCK
      ?auto_79545 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_79545 ) ( CLEAR ?auto_79544 ) ( ON-TABLE ?auto_79540 ) ( ON ?auto_79541 ?auto_79540 ) ( ON ?auto_79542 ?auto_79541 ) ( ON ?auto_79543 ?auto_79542 ) ( ON ?auto_79544 ?auto_79543 ) ( not ( = ?auto_79540 ?auto_79541 ) ) ( not ( = ?auto_79540 ?auto_79542 ) ) ( not ( = ?auto_79540 ?auto_79543 ) ) ( not ( = ?auto_79540 ?auto_79544 ) ) ( not ( = ?auto_79540 ?auto_79545 ) ) ( not ( = ?auto_79541 ?auto_79542 ) ) ( not ( = ?auto_79541 ?auto_79543 ) ) ( not ( = ?auto_79541 ?auto_79544 ) ) ( not ( = ?auto_79541 ?auto_79545 ) ) ( not ( = ?auto_79542 ?auto_79543 ) ) ( not ( = ?auto_79542 ?auto_79544 ) ) ( not ( = ?auto_79542 ?auto_79545 ) ) ( not ( = ?auto_79543 ?auto_79544 ) ) ( not ( = ?auto_79543 ?auto_79545 ) ) ( not ( = ?auto_79544 ?auto_79545 ) ) )
    :subtasks
    ( ( !STACK ?auto_79545 ?auto_79544 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79546 - BLOCK
      ?auto_79547 - BLOCK
      ?auto_79548 - BLOCK
      ?auto_79549 - BLOCK
      ?auto_79550 - BLOCK
      ?auto_79551 - BLOCK
    )
    :vars
    (
      ?auto_79552 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_79550 ) ( ON-TABLE ?auto_79546 ) ( ON ?auto_79547 ?auto_79546 ) ( ON ?auto_79548 ?auto_79547 ) ( ON ?auto_79549 ?auto_79548 ) ( ON ?auto_79550 ?auto_79549 ) ( not ( = ?auto_79546 ?auto_79547 ) ) ( not ( = ?auto_79546 ?auto_79548 ) ) ( not ( = ?auto_79546 ?auto_79549 ) ) ( not ( = ?auto_79546 ?auto_79550 ) ) ( not ( = ?auto_79546 ?auto_79551 ) ) ( not ( = ?auto_79547 ?auto_79548 ) ) ( not ( = ?auto_79547 ?auto_79549 ) ) ( not ( = ?auto_79547 ?auto_79550 ) ) ( not ( = ?auto_79547 ?auto_79551 ) ) ( not ( = ?auto_79548 ?auto_79549 ) ) ( not ( = ?auto_79548 ?auto_79550 ) ) ( not ( = ?auto_79548 ?auto_79551 ) ) ( not ( = ?auto_79549 ?auto_79550 ) ) ( not ( = ?auto_79549 ?auto_79551 ) ) ( not ( = ?auto_79550 ?auto_79551 ) ) ( ON ?auto_79551 ?auto_79552 ) ( CLEAR ?auto_79551 ) ( HAND-EMPTY ) ( not ( = ?auto_79546 ?auto_79552 ) ) ( not ( = ?auto_79547 ?auto_79552 ) ) ( not ( = ?auto_79548 ?auto_79552 ) ) ( not ( = ?auto_79549 ?auto_79552 ) ) ( not ( = ?auto_79550 ?auto_79552 ) ) ( not ( = ?auto_79551 ?auto_79552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79551 ?auto_79552 )
      ( MAKE-6PILE ?auto_79546 ?auto_79547 ?auto_79548 ?auto_79549 ?auto_79550 ?auto_79551 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79553 - BLOCK
      ?auto_79554 - BLOCK
      ?auto_79555 - BLOCK
      ?auto_79556 - BLOCK
      ?auto_79557 - BLOCK
      ?auto_79558 - BLOCK
    )
    :vars
    (
      ?auto_79559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79553 ) ( ON ?auto_79554 ?auto_79553 ) ( ON ?auto_79555 ?auto_79554 ) ( ON ?auto_79556 ?auto_79555 ) ( not ( = ?auto_79553 ?auto_79554 ) ) ( not ( = ?auto_79553 ?auto_79555 ) ) ( not ( = ?auto_79553 ?auto_79556 ) ) ( not ( = ?auto_79553 ?auto_79557 ) ) ( not ( = ?auto_79553 ?auto_79558 ) ) ( not ( = ?auto_79554 ?auto_79555 ) ) ( not ( = ?auto_79554 ?auto_79556 ) ) ( not ( = ?auto_79554 ?auto_79557 ) ) ( not ( = ?auto_79554 ?auto_79558 ) ) ( not ( = ?auto_79555 ?auto_79556 ) ) ( not ( = ?auto_79555 ?auto_79557 ) ) ( not ( = ?auto_79555 ?auto_79558 ) ) ( not ( = ?auto_79556 ?auto_79557 ) ) ( not ( = ?auto_79556 ?auto_79558 ) ) ( not ( = ?auto_79557 ?auto_79558 ) ) ( ON ?auto_79558 ?auto_79559 ) ( CLEAR ?auto_79558 ) ( not ( = ?auto_79553 ?auto_79559 ) ) ( not ( = ?auto_79554 ?auto_79559 ) ) ( not ( = ?auto_79555 ?auto_79559 ) ) ( not ( = ?auto_79556 ?auto_79559 ) ) ( not ( = ?auto_79557 ?auto_79559 ) ) ( not ( = ?auto_79558 ?auto_79559 ) ) ( HOLDING ?auto_79557 ) ( CLEAR ?auto_79556 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79553 ?auto_79554 ?auto_79555 ?auto_79556 ?auto_79557 )
      ( MAKE-6PILE ?auto_79553 ?auto_79554 ?auto_79555 ?auto_79556 ?auto_79557 ?auto_79558 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79560 - BLOCK
      ?auto_79561 - BLOCK
      ?auto_79562 - BLOCK
      ?auto_79563 - BLOCK
      ?auto_79564 - BLOCK
      ?auto_79565 - BLOCK
    )
    :vars
    (
      ?auto_79566 - BLOCK
      ?auto_79567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79560 ) ( ON ?auto_79561 ?auto_79560 ) ( ON ?auto_79562 ?auto_79561 ) ( ON ?auto_79563 ?auto_79562 ) ( not ( = ?auto_79560 ?auto_79561 ) ) ( not ( = ?auto_79560 ?auto_79562 ) ) ( not ( = ?auto_79560 ?auto_79563 ) ) ( not ( = ?auto_79560 ?auto_79564 ) ) ( not ( = ?auto_79560 ?auto_79565 ) ) ( not ( = ?auto_79561 ?auto_79562 ) ) ( not ( = ?auto_79561 ?auto_79563 ) ) ( not ( = ?auto_79561 ?auto_79564 ) ) ( not ( = ?auto_79561 ?auto_79565 ) ) ( not ( = ?auto_79562 ?auto_79563 ) ) ( not ( = ?auto_79562 ?auto_79564 ) ) ( not ( = ?auto_79562 ?auto_79565 ) ) ( not ( = ?auto_79563 ?auto_79564 ) ) ( not ( = ?auto_79563 ?auto_79565 ) ) ( not ( = ?auto_79564 ?auto_79565 ) ) ( ON ?auto_79565 ?auto_79566 ) ( not ( = ?auto_79560 ?auto_79566 ) ) ( not ( = ?auto_79561 ?auto_79566 ) ) ( not ( = ?auto_79562 ?auto_79566 ) ) ( not ( = ?auto_79563 ?auto_79566 ) ) ( not ( = ?auto_79564 ?auto_79566 ) ) ( not ( = ?auto_79565 ?auto_79566 ) ) ( CLEAR ?auto_79563 ) ( ON ?auto_79564 ?auto_79565 ) ( CLEAR ?auto_79564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79567 ) ( ON ?auto_79566 ?auto_79567 ) ( not ( = ?auto_79567 ?auto_79566 ) ) ( not ( = ?auto_79567 ?auto_79565 ) ) ( not ( = ?auto_79567 ?auto_79564 ) ) ( not ( = ?auto_79560 ?auto_79567 ) ) ( not ( = ?auto_79561 ?auto_79567 ) ) ( not ( = ?auto_79562 ?auto_79567 ) ) ( not ( = ?auto_79563 ?auto_79567 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79567 ?auto_79566 ?auto_79565 )
      ( MAKE-6PILE ?auto_79560 ?auto_79561 ?auto_79562 ?auto_79563 ?auto_79564 ?auto_79565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79568 - BLOCK
      ?auto_79569 - BLOCK
      ?auto_79570 - BLOCK
      ?auto_79571 - BLOCK
      ?auto_79572 - BLOCK
      ?auto_79573 - BLOCK
    )
    :vars
    (
      ?auto_79574 - BLOCK
      ?auto_79575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79568 ) ( ON ?auto_79569 ?auto_79568 ) ( ON ?auto_79570 ?auto_79569 ) ( not ( = ?auto_79568 ?auto_79569 ) ) ( not ( = ?auto_79568 ?auto_79570 ) ) ( not ( = ?auto_79568 ?auto_79571 ) ) ( not ( = ?auto_79568 ?auto_79572 ) ) ( not ( = ?auto_79568 ?auto_79573 ) ) ( not ( = ?auto_79569 ?auto_79570 ) ) ( not ( = ?auto_79569 ?auto_79571 ) ) ( not ( = ?auto_79569 ?auto_79572 ) ) ( not ( = ?auto_79569 ?auto_79573 ) ) ( not ( = ?auto_79570 ?auto_79571 ) ) ( not ( = ?auto_79570 ?auto_79572 ) ) ( not ( = ?auto_79570 ?auto_79573 ) ) ( not ( = ?auto_79571 ?auto_79572 ) ) ( not ( = ?auto_79571 ?auto_79573 ) ) ( not ( = ?auto_79572 ?auto_79573 ) ) ( ON ?auto_79573 ?auto_79574 ) ( not ( = ?auto_79568 ?auto_79574 ) ) ( not ( = ?auto_79569 ?auto_79574 ) ) ( not ( = ?auto_79570 ?auto_79574 ) ) ( not ( = ?auto_79571 ?auto_79574 ) ) ( not ( = ?auto_79572 ?auto_79574 ) ) ( not ( = ?auto_79573 ?auto_79574 ) ) ( ON ?auto_79572 ?auto_79573 ) ( CLEAR ?auto_79572 ) ( ON-TABLE ?auto_79575 ) ( ON ?auto_79574 ?auto_79575 ) ( not ( = ?auto_79575 ?auto_79574 ) ) ( not ( = ?auto_79575 ?auto_79573 ) ) ( not ( = ?auto_79575 ?auto_79572 ) ) ( not ( = ?auto_79568 ?auto_79575 ) ) ( not ( = ?auto_79569 ?auto_79575 ) ) ( not ( = ?auto_79570 ?auto_79575 ) ) ( not ( = ?auto_79571 ?auto_79575 ) ) ( HOLDING ?auto_79571 ) ( CLEAR ?auto_79570 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79568 ?auto_79569 ?auto_79570 ?auto_79571 )
      ( MAKE-6PILE ?auto_79568 ?auto_79569 ?auto_79570 ?auto_79571 ?auto_79572 ?auto_79573 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79576 - BLOCK
      ?auto_79577 - BLOCK
      ?auto_79578 - BLOCK
      ?auto_79579 - BLOCK
      ?auto_79580 - BLOCK
      ?auto_79581 - BLOCK
    )
    :vars
    (
      ?auto_79582 - BLOCK
      ?auto_79583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79576 ) ( ON ?auto_79577 ?auto_79576 ) ( ON ?auto_79578 ?auto_79577 ) ( not ( = ?auto_79576 ?auto_79577 ) ) ( not ( = ?auto_79576 ?auto_79578 ) ) ( not ( = ?auto_79576 ?auto_79579 ) ) ( not ( = ?auto_79576 ?auto_79580 ) ) ( not ( = ?auto_79576 ?auto_79581 ) ) ( not ( = ?auto_79577 ?auto_79578 ) ) ( not ( = ?auto_79577 ?auto_79579 ) ) ( not ( = ?auto_79577 ?auto_79580 ) ) ( not ( = ?auto_79577 ?auto_79581 ) ) ( not ( = ?auto_79578 ?auto_79579 ) ) ( not ( = ?auto_79578 ?auto_79580 ) ) ( not ( = ?auto_79578 ?auto_79581 ) ) ( not ( = ?auto_79579 ?auto_79580 ) ) ( not ( = ?auto_79579 ?auto_79581 ) ) ( not ( = ?auto_79580 ?auto_79581 ) ) ( ON ?auto_79581 ?auto_79582 ) ( not ( = ?auto_79576 ?auto_79582 ) ) ( not ( = ?auto_79577 ?auto_79582 ) ) ( not ( = ?auto_79578 ?auto_79582 ) ) ( not ( = ?auto_79579 ?auto_79582 ) ) ( not ( = ?auto_79580 ?auto_79582 ) ) ( not ( = ?auto_79581 ?auto_79582 ) ) ( ON ?auto_79580 ?auto_79581 ) ( ON-TABLE ?auto_79583 ) ( ON ?auto_79582 ?auto_79583 ) ( not ( = ?auto_79583 ?auto_79582 ) ) ( not ( = ?auto_79583 ?auto_79581 ) ) ( not ( = ?auto_79583 ?auto_79580 ) ) ( not ( = ?auto_79576 ?auto_79583 ) ) ( not ( = ?auto_79577 ?auto_79583 ) ) ( not ( = ?auto_79578 ?auto_79583 ) ) ( not ( = ?auto_79579 ?auto_79583 ) ) ( CLEAR ?auto_79578 ) ( ON ?auto_79579 ?auto_79580 ) ( CLEAR ?auto_79579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79583 ?auto_79582 ?auto_79581 ?auto_79580 )
      ( MAKE-6PILE ?auto_79576 ?auto_79577 ?auto_79578 ?auto_79579 ?auto_79580 ?auto_79581 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79584 - BLOCK
      ?auto_79585 - BLOCK
      ?auto_79586 - BLOCK
      ?auto_79587 - BLOCK
      ?auto_79588 - BLOCK
      ?auto_79589 - BLOCK
    )
    :vars
    (
      ?auto_79590 - BLOCK
      ?auto_79591 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79584 ) ( ON ?auto_79585 ?auto_79584 ) ( not ( = ?auto_79584 ?auto_79585 ) ) ( not ( = ?auto_79584 ?auto_79586 ) ) ( not ( = ?auto_79584 ?auto_79587 ) ) ( not ( = ?auto_79584 ?auto_79588 ) ) ( not ( = ?auto_79584 ?auto_79589 ) ) ( not ( = ?auto_79585 ?auto_79586 ) ) ( not ( = ?auto_79585 ?auto_79587 ) ) ( not ( = ?auto_79585 ?auto_79588 ) ) ( not ( = ?auto_79585 ?auto_79589 ) ) ( not ( = ?auto_79586 ?auto_79587 ) ) ( not ( = ?auto_79586 ?auto_79588 ) ) ( not ( = ?auto_79586 ?auto_79589 ) ) ( not ( = ?auto_79587 ?auto_79588 ) ) ( not ( = ?auto_79587 ?auto_79589 ) ) ( not ( = ?auto_79588 ?auto_79589 ) ) ( ON ?auto_79589 ?auto_79590 ) ( not ( = ?auto_79584 ?auto_79590 ) ) ( not ( = ?auto_79585 ?auto_79590 ) ) ( not ( = ?auto_79586 ?auto_79590 ) ) ( not ( = ?auto_79587 ?auto_79590 ) ) ( not ( = ?auto_79588 ?auto_79590 ) ) ( not ( = ?auto_79589 ?auto_79590 ) ) ( ON ?auto_79588 ?auto_79589 ) ( ON-TABLE ?auto_79591 ) ( ON ?auto_79590 ?auto_79591 ) ( not ( = ?auto_79591 ?auto_79590 ) ) ( not ( = ?auto_79591 ?auto_79589 ) ) ( not ( = ?auto_79591 ?auto_79588 ) ) ( not ( = ?auto_79584 ?auto_79591 ) ) ( not ( = ?auto_79585 ?auto_79591 ) ) ( not ( = ?auto_79586 ?auto_79591 ) ) ( not ( = ?auto_79587 ?auto_79591 ) ) ( ON ?auto_79587 ?auto_79588 ) ( CLEAR ?auto_79587 ) ( HOLDING ?auto_79586 ) ( CLEAR ?auto_79585 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79584 ?auto_79585 ?auto_79586 )
      ( MAKE-6PILE ?auto_79584 ?auto_79585 ?auto_79586 ?auto_79587 ?auto_79588 ?auto_79589 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79592 - BLOCK
      ?auto_79593 - BLOCK
      ?auto_79594 - BLOCK
      ?auto_79595 - BLOCK
      ?auto_79596 - BLOCK
      ?auto_79597 - BLOCK
    )
    :vars
    (
      ?auto_79599 - BLOCK
      ?auto_79598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79592 ) ( ON ?auto_79593 ?auto_79592 ) ( not ( = ?auto_79592 ?auto_79593 ) ) ( not ( = ?auto_79592 ?auto_79594 ) ) ( not ( = ?auto_79592 ?auto_79595 ) ) ( not ( = ?auto_79592 ?auto_79596 ) ) ( not ( = ?auto_79592 ?auto_79597 ) ) ( not ( = ?auto_79593 ?auto_79594 ) ) ( not ( = ?auto_79593 ?auto_79595 ) ) ( not ( = ?auto_79593 ?auto_79596 ) ) ( not ( = ?auto_79593 ?auto_79597 ) ) ( not ( = ?auto_79594 ?auto_79595 ) ) ( not ( = ?auto_79594 ?auto_79596 ) ) ( not ( = ?auto_79594 ?auto_79597 ) ) ( not ( = ?auto_79595 ?auto_79596 ) ) ( not ( = ?auto_79595 ?auto_79597 ) ) ( not ( = ?auto_79596 ?auto_79597 ) ) ( ON ?auto_79597 ?auto_79599 ) ( not ( = ?auto_79592 ?auto_79599 ) ) ( not ( = ?auto_79593 ?auto_79599 ) ) ( not ( = ?auto_79594 ?auto_79599 ) ) ( not ( = ?auto_79595 ?auto_79599 ) ) ( not ( = ?auto_79596 ?auto_79599 ) ) ( not ( = ?auto_79597 ?auto_79599 ) ) ( ON ?auto_79596 ?auto_79597 ) ( ON-TABLE ?auto_79598 ) ( ON ?auto_79599 ?auto_79598 ) ( not ( = ?auto_79598 ?auto_79599 ) ) ( not ( = ?auto_79598 ?auto_79597 ) ) ( not ( = ?auto_79598 ?auto_79596 ) ) ( not ( = ?auto_79592 ?auto_79598 ) ) ( not ( = ?auto_79593 ?auto_79598 ) ) ( not ( = ?auto_79594 ?auto_79598 ) ) ( not ( = ?auto_79595 ?auto_79598 ) ) ( ON ?auto_79595 ?auto_79596 ) ( CLEAR ?auto_79593 ) ( ON ?auto_79594 ?auto_79595 ) ( CLEAR ?auto_79594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79598 ?auto_79599 ?auto_79597 ?auto_79596 ?auto_79595 )
      ( MAKE-6PILE ?auto_79592 ?auto_79593 ?auto_79594 ?auto_79595 ?auto_79596 ?auto_79597 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79600 - BLOCK
      ?auto_79601 - BLOCK
      ?auto_79602 - BLOCK
      ?auto_79603 - BLOCK
      ?auto_79604 - BLOCK
      ?auto_79605 - BLOCK
    )
    :vars
    (
      ?auto_79606 - BLOCK
      ?auto_79607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79600 ) ( not ( = ?auto_79600 ?auto_79601 ) ) ( not ( = ?auto_79600 ?auto_79602 ) ) ( not ( = ?auto_79600 ?auto_79603 ) ) ( not ( = ?auto_79600 ?auto_79604 ) ) ( not ( = ?auto_79600 ?auto_79605 ) ) ( not ( = ?auto_79601 ?auto_79602 ) ) ( not ( = ?auto_79601 ?auto_79603 ) ) ( not ( = ?auto_79601 ?auto_79604 ) ) ( not ( = ?auto_79601 ?auto_79605 ) ) ( not ( = ?auto_79602 ?auto_79603 ) ) ( not ( = ?auto_79602 ?auto_79604 ) ) ( not ( = ?auto_79602 ?auto_79605 ) ) ( not ( = ?auto_79603 ?auto_79604 ) ) ( not ( = ?auto_79603 ?auto_79605 ) ) ( not ( = ?auto_79604 ?auto_79605 ) ) ( ON ?auto_79605 ?auto_79606 ) ( not ( = ?auto_79600 ?auto_79606 ) ) ( not ( = ?auto_79601 ?auto_79606 ) ) ( not ( = ?auto_79602 ?auto_79606 ) ) ( not ( = ?auto_79603 ?auto_79606 ) ) ( not ( = ?auto_79604 ?auto_79606 ) ) ( not ( = ?auto_79605 ?auto_79606 ) ) ( ON ?auto_79604 ?auto_79605 ) ( ON-TABLE ?auto_79607 ) ( ON ?auto_79606 ?auto_79607 ) ( not ( = ?auto_79607 ?auto_79606 ) ) ( not ( = ?auto_79607 ?auto_79605 ) ) ( not ( = ?auto_79607 ?auto_79604 ) ) ( not ( = ?auto_79600 ?auto_79607 ) ) ( not ( = ?auto_79601 ?auto_79607 ) ) ( not ( = ?auto_79602 ?auto_79607 ) ) ( not ( = ?auto_79603 ?auto_79607 ) ) ( ON ?auto_79603 ?auto_79604 ) ( ON ?auto_79602 ?auto_79603 ) ( CLEAR ?auto_79602 ) ( HOLDING ?auto_79601 ) ( CLEAR ?auto_79600 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79600 ?auto_79601 )
      ( MAKE-6PILE ?auto_79600 ?auto_79601 ?auto_79602 ?auto_79603 ?auto_79604 ?auto_79605 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79608 - BLOCK
      ?auto_79609 - BLOCK
      ?auto_79610 - BLOCK
      ?auto_79611 - BLOCK
      ?auto_79612 - BLOCK
      ?auto_79613 - BLOCK
    )
    :vars
    (
      ?auto_79615 - BLOCK
      ?auto_79614 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79608 ) ( not ( = ?auto_79608 ?auto_79609 ) ) ( not ( = ?auto_79608 ?auto_79610 ) ) ( not ( = ?auto_79608 ?auto_79611 ) ) ( not ( = ?auto_79608 ?auto_79612 ) ) ( not ( = ?auto_79608 ?auto_79613 ) ) ( not ( = ?auto_79609 ?auto_79610 ) ) ( not ( = ?auto_79609 ?auto_79611 ) ) ( not ( = ?auto_79609 ?auto_79612 ) ) ( not ( = ?auto_79609 ?auto_79613 ) ) ( not ( = ?auto_79610 ?auto_79611 ) ) ( not ( = ?auto_79610 ?auto_79612 ) ) ( not ( = ?auto_79610 ?auto_79613 ) ) ( not ( = ?auto_79611 ?auto_79612 ) ) ( not ( = ?auto_79611 ?auto_79613 ) ) ( not ( = ?auto_79612 ?auto_79613 ) ) ( ON ?auto_79613 ?auto_79615 ) ( not ( = ?auto_79608 ?auto_79615 ) ) ( not ( = ?auto_79609 ?auto_79615 ) ) ( not ( = ?auto_79610 ?auto_79615 ) ) ( not ( = ?auto_79611 ?auto_79615 ) ) ( not ( = ?auto_79612 ?auto_79615 ) ) ( not ( = ?auto_79613 ?auto_79615 ) ) ( ON ?auto_79612 ?auto_79613 ) ( ON-TABLE ?auto_79614 ) ( ON ?auto_79615 ?auto_79614 ) ( not ( = ?auto_79614 ?auto_79615 ) ) ( not ( = ?auto_79614 ?auto_79613 ) ) ( not ( = ?auto_79614 ?auto_79612 ) ) ( not ( = ?auto_79608 ?auto_79614 ) ) ( not ( = ?auto_79609 ?auto_79614 ) ) ( not ( = ?auto_79610 ?auto_79614 ) ) ( not ( = ?auto_79611 ?auto_79614 ) ) ( ON ?auto_79611 ?auto_79612 ) ( ON ?auto_79610 ?auto_79611 ) ( CLEAR ?auto_79608 ) ( ON ?auto_79609 ?auto_79610 ) ( CLEAR ?auto_79609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79614 ?auto_79615 ?auto_79613 ?auto_79612 ?auto_79611 ?auto_79610 )
      ( MAKE-6PILE ?auto_79608 ?auto_79609 ?auto_79610 ?auto_79611 ?auto_79612 ?auto_79613 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79616 - BLOCK
      ?auto_79617 - BLOCK
      ?auto_79618 - BLOCK
      ?auto_79619 - BLOCK
      ?auto_79620 - BLOCK
      ?auto_79621 - BLOCK
    )
    :vars
    (
      ?auto_79622 - BLOCK
      ?auto_79623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79616 ?auto_79617 ) ) ( not ( = ?auto_79616 ?auto_79618 ) ) ( not ( = ?auto_79616 ?auto_79619 ) ) ( not ( = ?auto_79616 ?auto_79620 ) ) ( not ( = ?auto_79616 ?auto_79621 ) ) ( not ( = ?auto_79617 ?auto_79618 ) ) ( not ( = ?auto_79617 ?auto_79619 ) ) ( not ( = ?auto_79617 ?auto_79620 ) ) ( not ( = ?auto_79617 ?auto_79621 ) ) ( not ( = ?auto_79618 ?auto_79619 ) ) ( not ( = ?auto_79618 ?auto_79620 ) ) ( not ( = ?auto_79618 ?auto_79621 ) ) ( not ( = ?auto_79619 ?auto_79620 ) ) ( not ( = ?auto_79619 ?auto_79621 ) ) ( not ( = ?auto_79620 ?auto_79621 ) ) ( ON ?auto_79621 ?auto_79622 ) ( not ( = ?auto_79616 ?auto_79622 ) ) ( not ( = ?auto_79617 ?auto_79622 ) ) ( not ( = ?auto_79618 ?auto_79622 ) ) ( not ( = ?auto_79619 ?auto_79622 ) ) ( not ( = ?auto_79620 ?auto_79622 ) ) ( not ( = ?auto_79621 ?auto_79622 ) ) ( ON ?auto_79620 ?auto_79621 ) ( ON-TABLE ?auto_79623 ) ( ON ?auto_79622 ?auto_79623 ) ( not ( = ?auto_79623 ?auto_79622 ) ) ( not ( = ?auto_79623 ?auto_79621 ) ) ( not ( = ?auto_79623 ?auto_79620 ) ) ( not ( = ?auto_79616 ?auto_79623 ) ) ( not ( = ?auto_79617 ?auto_79623 ) ) ( not ( = ?auto_79618 ?auto_79623 ) ) ( not ( = ?auto_79619 ?auto_79623 ) ) ( ON ?auto_79619 ?auto_79620 ) ( ON ?auto_79618 ?auto_79619 ) ( ON ?auto_79617 ?auto_79618 ) ( CLEAR ?auto_79617 ) ( HOLDING ?auto_79616 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79616 )
      ( MAKE-6PILE ?auto_79616 ?auto_79617 ?auto_79618 ?auto_79619 ?auto_79620 ?auto_79621 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_79624 - BLOCK
      ?auto_79625 - BLOCK
      ?auto_79626 - BLOCK
      ?auto_79627 - BLOCK
      ?auto_79628 - BLOCK
      ?auto_79629 - BLOCK
    )
    :vars
    (
      ?auto_79630 - BLOCK
      ?auto_79631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79624 ?auto_79625 ) ) ( not ( = ?auto_79624 ?auto_79626 ) ) ( not ( = ?auto_79624 ?auto_79627 ) ) ( not ( = ?auto_79624 ?auto_79628 ) ) ( not ( = ?auto_79624 ?auto_79629 ) ) ( not ( = ?auto_79625 ?auto_79626 ) ) ( not ( = ?auto_79625 ?auto_79627 ) ) ( not ( = ?auto_79625 ?auto_79628 ) ) ( not ( = ?auto_79625 ?auto_79629 ) ) ( not ( = ?auto_79626 ?auto_79627 ) ) ( not ( = ?auto_79626 ?auto_79628 ) ) ( not ( = ?auto_79626 ?auto_79629 ) ) ( not ( = ?auto_79627 ?auto_79628 ) ) ( not ( = ?auto_79627 ?auto_79629 ) ) ( not ( = ?auto_79628 ?auto_79629 ) ) ( ON ?auto_79629 ?auto_79630 ) ( not ( = ?auto_79624 ?auto_79630 ) ) ( not ( = ?auto_79625 ?auto_79630 ) ) ( not ( = ?auto_79626 ?auto_79630 ) ) ( not ( = ?auto_79627 ?auto_79630 ) ) ( not ( = ?auto_79628 ?auto_79630 ) ) ( not ( = ?auto_79629 ?auto_79630 ) ) ( ON ?auto_79628 ?auto_79629 ) ( ON-TABLE ?auto_79631 ) ( ON ?auto_79630 ?auto_79631 ) ( not ( = ?auto_79631 ?auto_79630 ) ) ( not ( = ?auto_79631 ?auto_79629 ) ) ( not ( = ?auto_79631 ?auto_79628 ) ) ( not ( = ?auto_79624 ?auto_79631 ) ) ( not ( = ?auto_79625 ?auto_79631 ) ) ( not ( = ?auto_79626 ?auto_79631 ) ) ( not ( = ?auto_79627 ?auto_79631 ) ) ( ON ?auto_79627 ?auto_79628 ) ( ON ?auto_79626 ?auto_79627 ) ( ON ?auto_79625 ?auto_79626 ) ( ON ?auto_79624 ?auto_79625 ) ( CLEAR ?auto_79624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79631 ?auto_79630 ?auto_79629 ?auto_79628 ?auto_79627 ?auto_79626 ?auto_79625 )
      ( MAKE-6PILE ?auto_79624 ?auto_79625 ?auto_79626 ?auto_79627 ?auto_79628 ?auto_79629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79633 - BLOCK
    )
    :vars
    (
      ?auto_79634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79634 ?auto_79633 ) ( CLEAR ?auto_79634 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79633 ) ( not ( = ?auto_79633 ?auto_79634 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79634 ?auto_79633 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79635 - BLOCK
    )
    :vars
    (
      ?auto_79636 - BLOCK
      ?auto_79637 - BLOCK
      ?auto_79638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79636 ?auto_79635 ) ( CLEAR ?auto_79636 ) ( ON-TABLE ?auto_79635 ) ( not ( = ?auto_79635 ?auto_79636 ) ) ( HOLDING ?auto_79637 ) ( CLEAR ?auto_79638 ) ( not ( = ?auto_79635 ?auto_79637 ) ) ( not ( = ?auto_79635 ?auto_79638 ) ) ( not ( = ?auto_79636 ?auto_79637 ) ) ( not ( = ?auto_79636 ?auto_79638 ) ) ( not ( = ?auto_79637 ?auto_79638 ) ) )
    :subtasks
    ( ( !STACK ?auto_79637 ?auto_79638 )
      ( MAKE-1PILE ?auto_79635 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79639 - BLOCK
    )
    :vars
    (
      ?auto_79641 - BLOCK
      ?auto_79640 - BLOCK
      ?auto_79642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79641 ?auto_79639 ) ( ON-TABLE ?auto_79639 ) ( not ( = ?auto_79639 ?auto_79641 ) ) ( CLEAR ?auto_79640 ) ( not ( = ?auto_79639 ?auto_79642 ) ) ( not ( = ?auto_79639 ?auto_79640 ) ) ( not ( = ?auto_79641 ?auto_79642 ) ) ( not ( = ?auto_79641 ?auto_79640 ) ) ( not ( = ?auto_79642 ?auto_79640 ) ) ( ON ?auto_79642 ?auto_79641 ) ( CLEAR ?auto_79642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79639 ?auto_79641 )
      ( MAKE-1PILE ?auto_79639 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79643 - BLOCK
    )
    :vars
    (
      ?auto_79644 - BLOCK
      ?auto_79646 - BLOCK
      ?auto_79645 - BLOCK
      ?auto_79648 - BLOCK
      ?auto_79650 - BLOCK
      ?auto_79649 - BLOCK
      ?auto_79647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79644 ?auto_79643 ) ( ON-TABLE ?auto_79643 ) ( not ( = ?auto_79643 ?auto_79644 ) ) ( not ( = ?auto_79643 ?auto_79646 ) ) ( not ( = ?auto_79643 ?auto_79645 ) ) ( not ( = ?auto_79644 ?auto_79646 ) ) ( not ( = ?auto_79644 ?auto_79645 ) ) ( not ( = ?auto_79646 ?auto_79645 ) ) ( ON ?auto_79646 ?auto_79644 ) ( CLEAR ?auto_79646 ) ( HOLDING ?auto_79645 ) ( CLEAR ?auto_79648 ) ( ON-TABLE ?auto_79650 ) ( ON ?auto_79649 ?auto_79650 ) ( ON ?auto_79647 ?auto_79649 ) ( ON ?auto_79648 ?auto_79647 ) ( not ( = ?auto_79650 ?auto_79649 ) ) ( not ( = ?auto_79650 ?auto_79647 ) ) ( not ( = ?auto_79650 ?auto_79648 ) ) ( not ( = ?auto_79650 ?auto_79645 ) ) ( not ( = ?auto_79649 ?auto_79647 ) ) ( not ( = ?auto_79649 ?auto_79648 ) ) ( not ( = ?auto_79649 ?auto_79645 ) ) ( not ( = ?auto_79647 ?auto_79648 ) ) ( not ( = ?auto_79647 ?auto_79645 ) ) ( not ( = ?auto_79648 ?auto_79645 ) ) ( not ( = ?auto_79643 ?auto_79648 ) ) ( not ( = ?auto_79643 ?auto_79650 ) ) ( not ( = ?auto_79643 ?auto_79649 ) ) ( not ( = ?auto_79643 ?auto_79647 ) ) ( not ( = ?auto_79644 ?auto_79648 ) ) ( not ( = ?auto_79644 ?auto_79650 ) ) ( not ( = ?auto_79644 ?auto_79649 ) ) ( not ( = ?auto_79644 ?auto_79647 ) ) ( not ( = ?auto_79646 ?auto_79648 ) ) ( not ( = ?auto_79646 ?auto_79650 ) ) ( not ( = ?auto_79646 ?auto_79649 ) ) ( not ( = ?auto_79646 ?auto_79647 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79650 ?auto_79649 ?auto_79647 ?auto_79648 ?auto_79645 )
      ( MAKE-1PILE ?auto_79643 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79651 - BLOCK
    )
    :vars
    (
      ?auto_79656 - BLOCK
      ?auto_79654 - BLOCK
      ?auto_79657 - BLOCK
      ?auto_79655 - BLOCK
      ?auto_79653 - BLOCK
      ?auto_79652 - BLOCK
      ?auto_79658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79656 ?auto_79651 ) ( ON-TABLE ?auto_79651 ) ( not ( = ?auto_79651 ?auto_79656 ) ) ( not ( = ?auto_79651 ?auto_79654 ) ) ( not ( = ?auto_79651 ?auto_79657 ) ) ( not ( = ?auto_79656 ?auto_79654 ) ) ( not ( = ?auto_79656 ?auto_79657 ) ) ( not ( = ?auto_79654 ?auto_79657 ) ) ( ON ?auto_79654 ?auto_79656 ) ( CLEAR ?auto_79655 ) ( ON-TABLE ?auto_79653 ) ( ON ?auto_79652 ?auto_79653 ) ( ON ?auto_79658 ?auto_79652 ) ( ON ?auto_79655 ?auto_79658 ) ( not ( = ?auto_79653 ?auto_79652 ) ) ( not ( = ?auto_79653 ?auto_79658 ) ) ( not ( = ?auto_79653 ?auto_79655 ) ) ( not ( = ?auto_79653 ?auto_79657 ) ) ( not ( = ?auto_79652 ?auto_79658 ) ) ( not ( = ?auto_79652 ?auto_79655 ) ) ( not ( = ?auto_79652 ?auto_79657 ) ) ( not ( = ?auto_79658 ?auto_79655 ) ) ( not ( = ?auto_79658 ?auto_79657 ) ) ( not ( = ?auto_79655 ?auto_79657 ) ) ( not ( = ?auto_79651 ?auto_79655 ) ) ( not ( = ?auto_79651 ?auto_79653 ) ) ( not ( = ?auto_79651 ?auto_79652 ) ) ( not ( = ?auto_79651 ?auto_79658 ) ) ( not ( = ?auto_79656 ?auto_79655 ) ) ( not ( = ?auto_79656 ?auto_79653 ) ) ( not ( = ?auto_79656 ?auto_79652 ) ) ( not ( = ?auto_79656 ?auto_79658 ) ) ( not ( = ?auto_79654 ?auto_79655 ) ) ( not ( = ?auto_79654 ?auto_79653 ) ) ( not ( = ?auto_79654 ?auto_79652 ) ) ( not ( = ?auto_79654 ?auto_79658 ) ) ( ON ?auto_79657 ?auto_79654 ) ( CLEAR ?auto_79657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79651 ?auto_79656 ?auto_79654 )
      ( MAKE-1PILE ?auto_79651 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79659 - BLOCK
    )
    :vars
    (
      ?auto_79663 - BLOCK
      ?auto_79664 - BLOCK
      ?auto_79660 - BLOCK
      ?auto_79661 - BLOCK
      ?auto_79666 - BLOCK
      ?auto_79662 - BLOCK
      ?auto_79665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79663 ?auto_79659 ) ( ON-TABLE ?auto_79659 ) ( not ( = ?auto_79659 ?auto_79663 ) ) ( not ( = ?auto_79659 ?auto_79664 ) ) ( not ( = ?auto_79659 ?auto_79660 ) ) ( not ( = ?auto_79663 ?auto_79664 ) ) ( not ( = ?auto_79663 ?auto_79660 ) ) ( not ( = ?auto_79664 ?auto_79660 ) ) ( ON ?auto_79664 ?auto_79663 ) ( ON-TABLE ?auto_79661 ) ( ON ?auto_79666 ?auto_79661 ) ( ON ?auto_79662 ?auto_79666 ) ( not ( = ?auto_79661 ?auto_79666 ) ) ( not ( = ?auto_79661 ?auto_79662 ) ) ( not ( = ?auto_79661 ?auto_79665 ) ) ( not ( = ?auto_79661 ?auto_79660 ) ) ( not ( = ?auto_79666 ?auto_79662 ) ) ( not ( = ?auto_79666 ?auto_79665 ) ) ( not ( = ?auto_79666 ?auto_79660 ) ) ( not ( = ?auto_79662 ?auto_79665 ) ) ( not ( = ?auto_79662 ?auto_79660 ) ) ( not ( = ?auto_79665 ?auto_79660 ) ) ( not ( = ?auto_79659 ?auto_79665 ) ) ( not ( = ?auto_79659 ?auto_79661 ) ) ( not ( = ?auto_79659 ?auto_79666 ) ) ( not ( = ?auto_79659 ?auto_79662 ) ) ( not ( = ?auto_79663 ?auto_79665 ) ) ( not ( = ?auto_79663 ?auto_79661 ) ) ( not ( = ?auto_79663 ?auto_79666 ) ) ( not ( = ?auto_79663 ?auto_79662 ) ) ( not ( = ?auto_79664 ?auto_79665 ) ) ( not ( = ?auto_79664 ?auto_79661 ) ) ( not ( = ?auto_79664 ?auto_79666 ) ) ( not ( = ?auto_79664 ?auto_79662 ) ) ( ON ?auto_79660 ?auto_79664 ) ( CLEAR ?auto_79660 ) ( HOLDING ?auto_79665 ) ( CLEAR ?auto_79662 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79661 ?auto_79666 ?auto_79662 ?auto_79665 )
      ( MAKE-1PILE ?auto_79659 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79667 - BLOCK
    )
    :vars
    (
      ?auto_79668 - BLOCK
      ?auto_79674 - BLOCK
      ?auto_79670 - BLOCK
      ?auto_79669 - BLOCK
      ?auto_79672 - BLOCK
      ?auto_79671 - BLOCK
      ?auto_79673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79668 ?auto_79667 ) ( ON-TABLE ?auto_79667 ) ( not ( = ?auto_79667 ?auto_79668 ) ) ( not ( = ?auto_79667 ?auto_79674 ) ) ( not ( = ?auto_79667 ?auto_79670 ) ) ( not ( = ?auto_79668 ?auto_79674 ) ) ( not ( = ?auto_79668 ?auto_79670 ) ) ( not ( = ?auto_79674 ?auto_79670 ) ) ( ON ?auto_79674 ?auto_79668 ) ( ON-TABLE ?auto_79669 ) ( ON ?auto_79672 ?auto_79669 ) ( ON ?auto_79671 ?auto_79672 ) ( not ( = ?auto_79669 ?auto_79672 ) ) ( not ( = ?auto_79669 ?auto_79671 ) ) ( not ( = ?auto_79669 ?auto_79673 ) ) ( not ( = ?auto_79669 ?auto_79670 ) ) ( not ( = ?auto_79672 ?auto_79671 ) ) ( not ( = ?auto_79672 ?auto_79673 ) ) ( not ( = ?auto_79672 ?auto_79670 ) ) ( not ( = ?auto_79671 ?auto_79673 ) ) ( not ( = ?auto_79671 ?auto_79670 ) ) ( not ( = ?auto_79673 ?auto_79670 ) ) ( not ( = ?auto_79667 ?auto_79673 ) ) ( not ( = ?auto_79667 ?auto_79669 ) ) ( not ( = ?auto_79667 ?auto_79672 ) ) ( not ( = ?auto_79667 ?auto_79671 ) ) ( not ( = ?auto_79668 ?auto_79673 ) ) ( not ( = ?auto_79668 ?auto_79669 ) ) ( not ( = ?auto_79668 ?auto_79672 ) ) ( not ( = ?auto_79668 ?auto_79671 ) ) ( not ( = ?auto_79674 ?auto_79673 ) ) ( not ( = ?auto_79674 ?auto_79669 ) ) ( not ( = ?auto_79674 ?auto_79672 ) ) ( not ( = ?auto_79674 ?auto_79671 ) ) ( ON ?auto_79670 ?auto_79674 ) ( CLEAR ?auto_79671 ) ( ON ?auto_79673 ?auto_79670 ) ( CLEAR ?auto_79673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79667 ?auto_79668 ?auto_79674 ?auto_79670 )
      ( MAKE-1PILE ?auto_79667 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79675 - BLOCK
    )
    :vars
    (
      ?auto_79677 - BLOCK
      ?auto_79679 - BLOCK
      ?auto_79682 - BLOCK
      ?auto_79676 - BLOCK
      ?auto_79680 - BLOCK
      ?auto_79678 - BLOCK
      ?auto_79681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79677 ?auto_79675 ) ( ON-TABLE ?auto_79675 ) ( not ( = ?auto_79675 ?auto_79677 ) ) ( not ( = ?auto_79675 ?auto_79679 ) ) ( not ( = ?auto_79675 ?auto_79682 ) ) ( not ( = ?auto_79677 ?auto_79679 ) ) ( not ( = ?auto_79677 ?auto_79682 ) ) ( not ( = ?auto_79679 ?auto_79682 ) ) ( ON ?auto_79679 ?auto_79677 ) ( ON-TABLE ?auto_79676 ) ( ON ?auto_79680 ?auto_79676 ) ( not ( = ?auto_79676 ?auto_79680 ) ) ( not ( = ?auto_79676 ?auto_79678 ) ) ( not ( = ?auto_79676 ?auto_79681 ) ) ( not ( = ?auto_79676 ?auto_79682 ) ) ( not ( = ?auto_79680 ?auto_79678 ) ) ( not ( = ?auto_79680 ?auto_79681 ) ) ( not ( = ?auto_79680 ?auto_79682 ) ) ( not ( = ?auto_79678 ?auto_79681 ) ) ( not ( = ?auto_79678 ?auto_79682 ) ) ( not ( = ?auto_79681 ?auto_79682 ) ) ( not ( = ?auto_79675 ?auto_79681 ) ) ( not ( = ?auto_79675 ?auto_79676 ) ) ( not ( = ?auto_79675 ?auto_79680 ) ) ( not ( = ?auto_79675 ?auto_79678 ) ) ( not ( = ?auto_79677 ?auto_79681 ) ) ( not ( = ?auto_79677 ?auto_79676 ) ) ( not ( = ?auto_79677 ?auto_79680 ) ) ( not ( = ?auto_79677 ?auto_79678 ) ) ( not ( = ?auto_79679 ?auto_79681 ) ) ( not ( = ?auto_79679 ?auto_79676 ) ) ( not ( = ?auto_79679 ?auto_79680 ) ) ( not ( = ?auto_79679 ?auto_79678 ) ) ( ON ?auto_79682 ?auto_79679 ) ( ON ?auto_79681 ?auto_79682 ) ( CLEAR ?auto_79681 ) ( HOLDING ?auto_79678 ) ( CLEAR ?auto_79680 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79676 ?auto_79680 ?auto_79678 )
      ( MAKE-1PILE ?auto_79675 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79683 - BLOCK
    )
    :vars
    (
      ?auto_79687 - BLOCK
      ?auto_79686 - BLOCK
      ?auto_79689 - BLOCK
      ?auto_79684 - BLOCK
      ?auto_79688 - BLOCK
      ?auto_79690 - BLOCK
      ?auto_79685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79687 ?auto_79683 ) ( ON-TABLE ?auto_79683 ) ( not ( = ?auto_79683 ?auto_79687 ) ) ( not ( = ?auto_79683 ?auto_79686 ) ) ( not ( = ?auto_79683 ?auto_79689 ) ) ( not ( = ?auto_79687 ?auto_79686 ) ) ( not ( = ?auto_79687 ?auto_79689 ) ) ( not ( = ?auto_79686 ?auto_79689 ) ) ( ON ?auto_79686 ?auto_79687 ) ( ON-TABLE ?auto_79684 ) ( ON ?auto_79688 ?auto_79684 ) ( not ( = ?auto_79684 ?auto_79688 ) ) ( not ( = ?auto_79684 ?auto_79690 ) ) ( not ( = ?auto_79684 ?auto_79685 ) ) ( not ( = ?auto_79684 ?auto_79689 ) ) ( not ( = ?auto_79688 ?auto_79690 ) ) ( not ( = ?auto_79688 ?auto_79685 ) ) ( not ( = ?auto_79688 ?auto_79689 ) ) ( not ( = ?auto_79690 ?auto_79685 ) ) ( not ( = ?auto_79690 ?auto_79689 ) ) ( not ( = ?auto_79685 ?auto_79689 ) ) ( not ( = ?auto_79683 ?auto_79685 ) ) ( not ( = ?auto_79683 ?auto_79684 ) ) ( not ( = ?auto_79683 ?auto_79688 ) ) ( not ( = ?auto_79683 ?auto_79690 ) ) ( not ( = ?auto_79687 ?auto_79685 ) ) ( not ( = ?auto_79687 ?auto_79684 ) ) ( not ( = ?auto_79687 ?auto_79688 ) ) ( not ( = ?auto_79687 ?auto_79690 ) ) ( not ( = ?auto_79686 ?auto_79685 ) ) ( not ( = ?auto_79686 ?auto_79684 ) ) ( not ( = ?auto_79686 ?auto_79688 ) ) ( not ( = ?auto_79686 ?auto_79690 ) ) ( ON ?auto_79689 ?auto_79686 ) ( ON ?auto_79685 ?auto_79689 ) ( CLEAR ?auto_79688 ) ( ON ?auto_79690 ?auto_79685 ) ( CLEAR ?auto_79690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79683 ?auto_79687 ?auto_79686 ?auto_79689 ?auto_79685 )
      ( MAKE-1PILE ?auto_79683 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79691 - BLOCK
    )
    :vars
    (
      ?auto_79692 - BLOCK
      ?auto_79696 - BLOCK
      ?auto_79697 - BLOCK
      ?auto_79698 - BLOCK
      ?auto_79693 - BLOCK
      ?auto_79695 - BLOCK
      ?auto_79694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79692 ?auto_79691 ) ( ON-TABLE ?auto_79691 ) ( not ( = ?auto_79691 ?auto_79692 ) ) ( not ( = ?auto_79691 ?auto_79696 ) ) ( not ( = ?auto_79691 ?auto_79697 ) ) ( not ( = ?auto_79692 ?auto_79696 ) ) ( not ( = ?auto_79692 ?auto_79697 ) ) ( not ( = ?auto_79696 ?auto_79697 ) ) ( ON ?auto_79696 ?auto_79692 ) ( ON-TABLE ?auto_79698 ) ( not ( = ?auto_79698 ?auto_79693 ) ) ( not ( = ?auto_79698 ?auto_79695 ) ) ( not ( = ?auto_79698 ?auto_79694 ) ) ( not ( = ?auto_79698 ?auto_79697 ) ) ( not ( = ?auto_79693 ?auto_79695 ) ) ( not ( = ?auto_79693 ?auto_79694 ) ) ( not ( = ?auto_79693 ?auto_79697 ) ) ( not ( = ?auto_79695 ?auto_79694 ) ) ( not ( = ?auto_79695 ?auto_79697 ) ) ( not ( = ?auto_79694 ?auto_79697 ) ) ( not ( = ?auto_79691 ?auto_79694 ) ) ( not ( = ?auto_79691 ?auto_79698 ) ) ( not ( = ?auto_79691 ?auto_79693 ) ) ( not ( = ?auto_79691 ?auto_79695 ) ) ( not ( = ?auto_79692 ?auto_79694 ) ) ( not ( = ?auto_79692 ?auto_79698 ) ) ( not ( = ?auto_79692 ?auto_79693 ) ) ( not ( = ?auto_79692 ?auto_79695 ) ) ( not ( = ?auto_79696 ?auto_79694 ) ) ( not ( = ?auto_79696 ?auto_79698 ) ) ( not ( = ?auto_79696 ?auto_79693 ) ) ( not ( = ?auto_79696 ?auto_79695 ) ) ( ON ?auto_79697 ?auto_79696 ) ( ON ?auto_79694 ?auto_79697 ) ( ON ?auto_79695 ?auto_79694 ) ( CLEAR ?auto_79695 ) ( HOLDING ?auto_79693 ) ( CLEAR ?auto_79698 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79698 ?auto_79693 )
      ( MAKE-1PILE ?auto_79691 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81105 - BLOCK
    )
    :vars
    (
      ?auto_81111 - BLOCK
      ?auto_81110 - BLOCK
      ?auto_81109 - BLOCK
      ?auto_81106 - BLOCK
      ?auto_81108 - BLOCK
      ?auto_81107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81111 ?auto_81105 ) ( ON-TABLE ?auto_81105 ) ( not ( = ?auto_81105 ?auto_81111 ) ) ( not ( = ?auto_81105 ?auto_81110 ) ) ( not ( = ?auto_81105 ?auto_81109 ) ) ( not ( = ?auto_81111 ?auto_81110 ) ) ( not ( = ?auto_81111 ?auto_81109 ) ) ( not ( = ?auto_81110 ?auto_81109 ) ) ( ON ?auto_81110 ?auto_81111 ) ( not ( = ?auto_81106 ?auto_81108 ) ) ( not ( = ?auto_81106 ?auto_81107 ) ) ( not ( = ?auto_81106 ?auto_81109 ) ) ( not ( = ?auto_81108 ?auto_81107 ) ) ( not ( = ?auto_81108 ?auto_81109 ) ) ( not ( = ?auto_81107 ?auto_81109 ) ) ( not ( = ?auto_81105 ?auto_81107 ) ) ( not ( = ?auto_81105 ?auto_81106 ) ) ( not ( = ?auto_81105 ?auto_81108 ) ) ( not ( = ?auto_81111 ?auto_81107 ) ) ( not ( = ?auto_81111 ?auto_81106 ) ) ( not ( = ?auto_81111 ?auto_81108 ) ) ( not ( = ?auto_81110 ?auto_81107 ) ) ( not ( = ?auto_81110 ?auto_81106 ) ) ( not ( = ?auto_81110 ?auto_81108 ) ) ( ON ?auto_81109 ?auto_81110 ) ( ON ?auto_81107 ?auto_81109 ) ( ON ?auto_81108 ?auto_81107 ) ( ON ?auto_81106 ?auto_81108 ) ( CLEAR ?auto_81106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81105 ?auto_81111 ?auto_81110 ?auto_81109 ?auto_81107 ?auto_81108 )
      ( MAKE-1PILE ?auto_81105 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79707 - BLOCK
    )
    :vars
    (
      ?auto_79713 - BLOCK
      ?auto_79712 - BLOCK
      ?auto_79714 - BLOCK
      ?auto_79710 - BLOCK
      ?auto_79711 - BLOCK
      ?auto_79709 - BLOCK
      ?auto_79708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79713 ?auto_79707 ) ( ON-TABLE ?auto_79707 ) ( not ( = ?auto_79707 ?auto_79713 ) ) ( not ( = ?auto_79707 ?auto_79712 ) ) ( not ( = ?auto_79707 ?auto_79714 ) ) ( not ( = ?auto_79713 ?auto_79712 ) ) ( not ( = ?auto_79713 ?auto_79714 ) ) ( not ( = ?auto_79712 ?auto_79714 ) ) ( ON ?auto_79712 ?auto_79713 ) ( not ( = ?auto_79710 ?auto_79711 ) ) ( not ( = ?auto_79710 ?auto_79709 ) ) ( not ( = ?auto_79710 ?auto_79708 ) ) ( not ( = ?auto_79710 ?auto_79714 ) ) ( not ( = ?auto_79711 ?auto_79709 ) ) ( not ( = ?auto_79711 ?auto_79708 ) ) ( not ( = ?auto_79711 ?auto_79714 ) ) ( not ( = ?auto_79709 ?auto_79708 ) ) ( not ( = ?auto_79709 ?auto_79714 ) ) ( not ( = ?auto_79708 ?auto_79714 ) ) ( not ( = ?auto_79707 ?auto_79708 ) ) ( not ( = ?auto_79707 ?auto_79710 ) ) ( not ( = ?auto_79707 ?auto_79711 ) ) ( not ( = ?auto_79707 ?auto_79709 ) ) ( not ( = ?auto_79713 ?auto_79708 ) ) ( not ( = ?auto_79713 ?auto_79710 ) ) ( not ( = ?auto_79713 ?auto_79711 ) ) ( not ( = ?auto_79713 ?auto_79709 ) ) ( not ( = ?auto_79712 ?auto_79708 ) ) ( not ( = ?auto_79712 ?auto_79710 ) ) ( not ( = ?auto_79712 ?auto_79711 ) ) ( not ( = ?auto_79712 ?auto_79709 ) ) ( ON ?auto_79714 ?auto_79712 ) ( ON ?auto_79708 ?auto_79714 ) ( ON ?auto_79709 ?auto_79708 ) ( ON ?auto_79711 ?auto_79709 ) ( CLEAR ?auto_79711 ) ( HOLDING ?auto_79710 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79710 )
      ( MAKE-1PILE ?auto_79707 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79715 - BLOCK
    )
    :vars
    (
      ?auto_79721 - BLOCK
      ?auto_79717 - BLOCK
      ?auto_79718 - BLOCK
      ?auto_79716 - BLOCK
      ?auto_79720 - BLOCK
      ?auto_79722 - BLOCK
      ?auto_79719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79721 ?auto_79715 ) ( ON-TABLE ?auto_79715 ) ( not ( = ?auto_79715 ?auto_79721 ) ) ( not ( = ?auto_79715 ?auto_79717 ) ) ( not ( = ?auto_79715 ?auto_79718 ) ) ( not ( = ?auto_79721 ?auto_79717 ) ) ( not ( = ?auto_79721 ?auto_79718 ) ) ( not ( = ?auto_79717 ?auto_79718 ) ) ( ON ?auto_79717 ?auto_79721 ) ( not ( = ?auto_79716 ?auto_79720 ) ) ( not ( = ?auto_79716 ?auto_79722 ) ) ( not ( = ?auto_79716 ?auto_79719 ) ) ( not ( = ?auto_79716 ?auto_79718 ) ) ( not ( = ?auto_79720 ?auto_79722 ) ) ( not ( = ?auto_79720 ?auto_79719 ) ) ( not ( = ?auto_79720 ?auto_79718 ) ) ( not ( = ?auto_79722 ?auto_79719 ) ) ( not ( = ?auto_79722 ?auto_79718 ) ) ( not ( = ?auto_79719 ?auto_79718 ) ) ( not ( = ?auto_79715 ?auto_79719 ) ) ( not ( = ?auto_79715 ?auto_79716 ) ) ( not ( = ?auto_79715 ?auto_79720 ) ) ( not ( = ?auto_79715 ?auto_79722 ) ) ( not ( = ?auto_79721 ?auto_79719 ) ) ( not ( = ?auto_79721 ?auto_79716 ) ) ( not ( = ?auto_79721 ?auto_79720 ) ) ( not ( = ?auto_79721 ?auto_79722 ) ) ( not ( = ?auto_79717 ?auto_79719 ) ) ( not ( = ?auto_79717 ?auto_79716 ) ) ( not ( = ?auto_79717 ?auto_79720 ) ) ( not ( = ?auto_79717 ?auto_79722 ) ) ( ON ?auto_79718 ?auto_79717 ) ( ON ?auto_79719 ?auto_79718 ) ( ON ?auto_79722 ?auto_79719 ) ( ON ?auto_79720 ?auto_79722 ) ( ON ?auto_79716 ?auto_79720 ) ( CLEAR ?auto_79716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79715 ?auto_79721 ?auto_79717 ?auto_79718 ?auto_79719 ?auto_79722 ?auto_79720 )
      ( MAKE-1PILE ?auto_79715 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79730 - BLOCK
      ?auto_79731 - BLOCK
      ?auto_79732 - BLOCK
      ?auto_79733 - BLOCK
      ?auto_79734 - BLOCK
      ?auto_79735 - BLOCK
      ?auto_79736 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_79736 ) ( CLEAR ?auto_79735 ) ( ON-TABLE ?auto_79730 ) ( ON ?auto_79731 ?auto_79730 ) ( ON ?auto_79732 ?auto_79731 ) ( ON ?auto_79733 ?auto_79732 ) ( ON ?auto_79734 ?auto_79733 ) ( ON ?auto_79735 ?auto_79734 ) ( not ( = ?auto_79730 ?auto_79731 ) ) ( not ( = ?auto_79730 ?auto_79732 ) ) ( not ( = ?auto_79730 ?auto_79733 ) ) ( not ( = ?auto_79730 ?auto_79734 ) ) ( not ( = ?auto_79730 ?auto_79735 ) ) ( not ( = ?auto_79730 ?auto_79736 ) ) ( not ( = ?auto_79731 ?auto_79732 ) ) ( not ( = ?auto_79731 ?auto_79733 ) ) ( not ( = ?auto_79731 ?auto_79734 ) ) ( not ( = ?auto_79731 ?auto_79735 ) ) ( not ( = ?auto_79731 ?auto_79736 ) ) ( not ( = ?auto_79732 ?auto_79733 ) ) ( not ( = ?auto_79732 ?auto_79734 ) ) ( not ( = ?auto_79732 ?auto_79735 ) ) ( not ( = ?auto_79732 ?auto_79736 ) ) ( not ( = ?auto_79733 ?auto_79734 ) ) ( not ( = ?auto_79733 ?auto_79735 ) ) ( not ( = ?auto_79733 ?auto_79736 ) ) ( not ( = ?auto_79734 ?auto_79735 ) ) ( not ( = ?auto_79734 ?auto_79736 ) ) ( not ( = ?auto_79735 ?auto_79736 ) ) )
    :subtasks
    ( ( !STACK ?auto_79736 ?auto_79735 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79737 - BLOCK
      ?auto_79738 - BLOCK
      ?auto_79739 - BLOCK
      ?auto_79740 - BLOCK
      ?auto_79741 - BLOCK
      ?auto_79742 - BLOCK
      ?auto_79743 - BLOCK
    )
    :vars
    (
      ?auto_79744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_79742 ) ( ON-TABLE ?auto_79737 ) ( ON ?auto_79738 ?auto_79737 ) ( ON ?auto_79739 ?auto_79738 ) ( ON ?auto_79740 ?auto_79739 ) ( ON ?auto_79741 ?auto_79740 ) ( ON ?auto_79742 ?auto_79741 ) ( not ( = ?auto_79737 ?auto_79738 ) ) ( not ( = ?auto_79737 ?auto_79739 ) ) ( not ( = ?auto_79737 ?auto_79740 ) ) ( not ( = ?auto_79737 ?auto_79741 ) ) ( not ( = ?auto_79737 ?auto_79742 ) ) ( not ( = ?auto_79737 ?auto_79743 ) ) ( not ( = ?auto_79738 ?auto_79739 ) ) ( not ( = ?auto_79738 ?auto_79740 ) ) ( not ( = ?auto_79738 ?auto_79741 ) ) ( not ( = ?auto_79738 ?auto_79742 ) ) ( not ( = ?auto_79738 ?auto_79743 ) ) ( not ( = ?auto_79739 ?auto_79740 ) ) ( not ( = ?auto_79739 ?auto_79741 ) ) ( not ( = ?auto_79739 ?auto_79742 ) ) ( not ( = ?auto_79739 ?auto_79743 ) ) ( not ( = ?auto_79740 ?auto_79741 ) ) ( not ( = ?auto_79740 ?auto_79742 ) ) ( not ( = ?auto_79740 ?auto_79743 ) ) ( not ( = ?auto_79741 ?auto_79742 ) ) ( not ( = ?auto_79741 ?auto_79743 ) ) ( not ( = ?auto_79742 ?auto_79743 ) ) ( ON ?auto_79743 ?auto_79744 ) ( CLEAR ?auto_79743 ) ( HAND-EMPTY ) ( not ( = ?auto_79737 ?auto_79744 ) ) ( not ( = ?auto_79738 ?auto_79744 ) ) ( not ( = ?auto_79739 ?auto_79744 ) ) ( not ( = ?auto_79740 ?auto_79744 ) ) ( not ( = ?auto_79741 ?auto_79744 ) ) ( not ( = ?auto_79742 ?auto_79744 ) ) ( not ( = ?auto_79743 ?auto_79744 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_79743 ?auto_79744 )
      ( MAKE-7PILE ?auto_79737 ?auto_79738 ?auto_79739 ?auto_79740 ?auto_79741 ?auto_79742 ?auto_79743 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79745 - BLOCK
      ?auto_79746 - BLOCK
      ?auto_79747 - BLOCK
      ?auto_79748 - BLOCK
      ?auto_79749 - BLOCK
      ?auto_79750 - BLOCK
      ?auto_79751 - BLOCK
    )
    :vars
    (
      ?auto_79752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79745 ) ( ON ?auto_79746 ?auto_79745 ) ( ON ?auto_79747 ?auto_79746 ) ( ON ?auto_79748 ?auto_79747 ) ( ON ?auto_79749 ?auto_79748 ) ( not ( = ?auto_79745 ?auto_79746 ) ) ( not ( = ?auto_79745 ?auto_79747 ) ) ( not ( = ?auto_79745 ?auto_79748 ) ) ( not ( = ?auto_79745 ?auto_79749 ) ) ( not ( = ?auto_79745 ?auto_79750 ) ) ( not ( = ?auto_79745 ?auto_79751 ) ) ( not ( = ?auto_79746 ?auto_79747 ) ) ( not ( = ?auto_79746 ?auto_79748 ) ) ( not ( = ?auto_79746 ?auto_79749 ) ) ( not ( = ?auto_79746 ?auto_79750 ) ) ( not ( = ?auto_79746 ?auto_79751 ) ) ( not ( = ?auto_79747 ?auto_79748 ) ) ( not ( = ?auto_79747 ?auto_79749 ) ) ( not ( = ?auto_79747 ?auto_79750 ) ) ( not ( = ?auto_79747 ?auto_79751 ) ) ( not ( = ?auto_79748 ?auto_79749 ) ) ( not ( = ?auto_79748 ?auto_79750 ) ) ( not ( = ?auto_79748 ?auto_79751 ) ) ( not ( = ?auto_79749 ?auto_79750 ) ) ( not ( = ?auto_79749 ?auto_79751 ) ) ( not ( = ?auto_79750 ?auto_79751 ) ) ( ON ?auto_79751 ?auto_79752 ) ( CLEAR ?auto_79751 ) ( not ( = ?auto_79745 ?auto_79752 ) ) ( not ( = ?auto_79746 ?auto_79752 ) ) ( not ( = ?auto_79747 ?auto_79752 ) ) ( not ( = ?auto_79748 ?auto_79752 ) ) ( not ( = ?auto_79749 ?auto_79752 ) ) ( not ( = ?auto_79750 ?auto_79752 ) ) ( not ( = ?auto_79751 ?auto_79752 ) ) ( HOLDING ?auto_79750 ) ( CLEAR ?auto_79749 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79745 ?auto_79746 ?auto_79747 ?auto_79748 ?auto_79749 ?auto_79750 )
      ( MAKE-7PILE ?auto_79745 ?auto_79746 ?auto_79747 ?auto_79748 ?auto_79749 ?auto_79750 ?auto_79751 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79753 - BLOCK
      ?auto_79754 - BLOCK
      ?auto_79755 - BLOCK
      ?auto_79756 - BLOCK
      ?auto_79757 - BLOCK
      ?auto_79758 - BLOCK
      ?auto_79759 - BLOCK
    )
    :vars
    (
      ?auto_79760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79753 ) ( ON ?auto_79754 ?auto_79753 ) ( ON ?auto_79755 ?auto_79754 ) ( ON ?auto_79756 ?auto_79755 ) ( ON ?auto_79757 ?auto_79756 ) ( not ( = ?auto_79753 ?auto_79754 ) ) ( not ( = ?auto_79753 ?auto_79755 ) ) ( not ( = ?auto_79753 ?auto_79756 ) ) ( not ( = ?auto_79753 ?auto_79757 ) ) ( not ( = ?auto_79753 ?auto_79758 ) ) ( not ( = ?auto_79753 ?auto_79759 ) ) ( not ( = ?auto_79754 ?auto_79755 ) ) ( not ( = ?auto_79754 ?auto_79756 ) ) ( not ( = ?auto_79754 ?auto_79757 ) ) ( not ( = ?auto_79754 ?auto_79758 ) ) ( not ( = ?auto_79754 ?auto_79759 ) ) ( not ( = ?auto_79755 ?auto_79756 ) ) ( not ( = ?auto_79755 ?auto_79757 ) ) ( not ( = ?auto_79755 ?auto_79758 ) ) ( not ( = ?auto_79755 ?auto_79759 ) ) ( not ( = ?auto_79756 ?auto_79757 ) ) ( not ( = ?auto_79756 ?auto_79758 ) ) ( not ( = ?auto_79756 ?auto_79759 ) ) ( not ( = ?auto_79757 ?auto_79758 ) ) ( not ( = ?auto_79757 ?auto_79759 ) ) ( not ( = ?auto_79758 ?auto_79759 ) ) ( ON ?auto_79759 ?auto_79760 ) ( not ( = ?auto_79753 ?auto_79760 ) ) ( not ( = ?auto_79754 ?auto_79760 ) ) ( not ( = ?auto_79755 ?auto_79760 ) ) ( not ( = ?auto_79756 ?auto_79760 ) ) ( not ( = ?auto_79757 ?auto_79760 ) ) ( not ( = ?auto_79758 ?auto_79760 ) ) ( not ( = ?auto_79759 ?auto_79760 ) ) ( CLEAR ?auto_79757 ) ( ON ?auto_79758 ?auto_79759 ) ( CLEAR ?auto_79758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79760 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79760 ?auto_79759 )
      ( MAKE-7PILE ?auto_79753 ?auto_79754 ?auto_79755 ?auto_79756 ?auto_79757 ?auto_79758 ?auto_79759 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79761 - BLOCK
      ?auto_79762 - BLOCK
      ?auto_79763 - BLOCK
      ?auto_79764 - BLOCK
      ?auto_79765 - BLOCK
      ?auto_79766 - BLOCK
      ?auto_79767 - BLOCK
    )
    :vars
    (
      ?auto_79768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79761 ) ( ON ?auto_79762 ?auto_79761 ) ( ON ?auto_79763 ?auto_79762 ) ( ON ?auto_79764 ?auto_79763 ) ( not ( = ?auto_79761 ?auto_79762 ) ) ( not ( = ?auto_79761 ?auto_79763 ) ) ( not ( = ?auto_79761 ?auto_79764 ) ) ( not ( = ?auto_79761 ?auto_79765 ) ) ( not ( = ?auto_79761 ?auto_79766 ) ) ( not ( = ?auto_79761 ?auto_79767 ) ) ( not ( = ?auto_79762 ?auto_79763 ) ) ( not ( = ?auto_79762 ?auto_79764 ) ) ( not ( = ?auto_79762 ?auto_79765 ) ) ( not ( = ?auto_79762 ?auto_79766 ) ) ( not ( = ?auto_79762 ?auto_79767 ) ) ( not ( = ?auto_79763 ?auto_79764 ) ) ( not ( = ?auto_79763 ?auto_79765 ) ) ( not ( = ?auto_79763 ?auto_79766 ) ) ( not ( = ?auto_79763 ?auto_79767 ) ) ( not ( = ?auto_79764 ?auto_79765 ) ) ( not ( = ?auto_79764 ?auto_79766 ) ) ( not ( = ?auto_79764 ?auto_79767 ) ) ( not ( = ?auto_79765 ?auto_79766 ) ) ( not ( = ?auto_79765 ?auto_79767 ) ) ( not ( = ?auto_79766 ?auto_79767 ) ) ( ON ?auto_79767 ?auto_79768 ) ( not ( = ?auto_79761 ?auto_79768 ) ) ( not ( = ?auto_79762 ?auto_79768 ) ) ( not ( = ?auto_79763 ?auto_79768 ) ) ( not ( = ?auto_79764 ?auto_79768 ) ) ( not ( = ?auto_79765 ?auto_79768 ) ) ( not ( = ?auto_79766 ?auto_79768 ) ) ( not ( = ?auto_79767 ?auto_79768 ) ) ( ON ?auto_79766 ?auto_79767 ) ( CLEAR ?auto_79766 ) ( ON-TABLE ?auto_79768 ) ( HOLDING ?auto_79765 ) ( CLEAR ?auto_79764 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79761 ?auto_79762 ?auto_79763 ?auto_79764 ?auto_79765 )
      ( MAKE-7PILE ?auto_79761 ?auto_79762 ?auto_79763 ?auto_79764 ?auto_79765 ?auto_79766 ?auto_79767 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79769 - BLOCK
      ?auto_79770 - BLOCK
      ?auto_79771 - BLOCK
      ?auto_79772 - BLOCK
      ?auto_79773 - BLOCK
      ?auto_79774 - BLOCK
      ?auto_79775 - BLOCK
    )
    :vars
    (
      ?auto_79776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79769 ) ( ON ?auto_79770 ?auto_79769 ) ( ON ?auto_79771 ?auto_79770 ) ( ON ?auto_79772 ?auto_79771 ) ( not ( = ?auto_79769 ?auto_79770 ) ) ( not ( = ?auto_79769 ?auto_79771 ) ) ( not ( = ?auto_79769 ?auto_79772 ) ) ( not ( = ?auto_79769 ?auto_79773 ) ) ( not ( = ?auto_79769 ?auto_79774 ) ) ( not ( = ?auto_79769 ?auto_79775 ) ) ( not ( = ?auto_79770 ?auto_79771 ) ) ( not ( = ?auto_79770 ?auto_79772 ) ) ( not ( = ?auto_79770 ?auto_79773 ) ) ( not ( = ?auto_79770 ?auto_79774 ) ) ( not ( = ?auto_79770 ?auto_79775 ) ) ( not ( = ?auto_79771 ?auto_79772 ) ) ( not ( = ?auto_79771 ?auto_79773 ) ) ( not ( = ?auto_79771 ?auto_79774 ) ) ( not ( = ?auto_79771 ?auto_79775 ) ) ( not ( = ?auto_79772 ?auto_79773 ) ) ( not ( = ?auto_79772 ?auto_79774 ) ) ( not ( = ?auto_79772 ?auto_79775 ) ) ( not ( = ?auto_79773 ?auto_79774 ) ) ( not ( = ?auto_79773 ?auto_79775 ) ) ( not ( = ?auto_79774 ?auto_79775 ) ) ( ON ?auto_79775 ?auto_79776 ) ( not ( = ?auto_79769 ?auto_79776 ) ) ( not ( = ?auto_79770 ?auto_79776 ) ) ( not ( = ?auto_79771 ?auto_79776 ) ) ( not ( = ?auto_79772 ?auto_79776 ) ) ( not ( = ?auto_79773 ?auto_79776 ) ) ( not ( = ?auto_79774 ?auto_79776 ) ) ( not ( = ?auto_79775 ?auto_79776 ) ) ( ON ?auto_79774 ?auto_79775 ) ( ON-TABLE ?auto_79776 ) ( CLEAR ?auto_79772 ) ( ON ?auto_79773 ?auto_79774 ) ( CLEAR ?auto_79773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79776 ?auto_79775 ?auto_79774 )
      ( MAKE-7PILE ?auto_79769 ?auto_79770 ?auto_79771 ?auto_79772 ?auto_79773 ?auto_79774 ?auto_79775 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79777 - BLOCK
      ?auto_79778 - BLOCK
      ?auto_79779 - BLOCK
      ?auto_79780 - BLOCK
      ?auto_79781 - BLOCK
      ?auto_79782 - BLOCK
      ?auto_79783 - BLOCK
    )
    :vars
    (
      ?auto_79784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79777 ) ( ON ?auto_79778 ?auto_79777 ) ( ON ?auto_79779 ?auto_79778 ) ( not ( = ?auto_79777 ?auto_79778 ) ) ( not ( = ?auto_79777 ?auto_79779 ) ) ( not ( = ?auto_79777 ?auto_79780 ) ) ( not ( = ?auto_79777 ?auto_79781 ) ) ( not ( = ?auto_79777 ?auto_79782 ) ) ( not ( = ?auto_79777 ?auto_79783 ) ) ( not ( = ?auto_79778 ?auto_79779 ) ) ( not ( = ?auto_79778 ?auto_79780 ) ) ( not ( = ?auto_79778 ?auto_79781 ) ) ( not ( = ?auto_79778 ?auto_79782 ) ) ( not ( = ?auto_79778 ?auto_79783 ) ) ( not ( = ?auto_79779 ?auto_79780 ) ) ( not ( = ?auto_79779 ?auto_79781 ) ) ( not ( = ?auto_79779 ?auto_79782 ) ) ( not ( = ?auto_79779 ?auto_79783 ) ) ( not ( = ?auto_79780 ?auto_79781 ) ) ( not ( = ?auto_79780 ?auto_79782 ) ) ( not ( = ?auto_79780 ?auto_79783 ) ) ( not ( = ?auto_79781 ?auto_79782 ) ) ( not ( = ?auto_79781 ?auto_79783 ) ) ( not ( = ?auto_79782 ?auto_79783 ) ) ( ON ?auto_79783 ?auto_79784 ) ( not ( = ?auto_79777 ?auto_79784 ) ) ( not ( = ?auto_79778 ?auto_79784 ) ) ( not ( = ?auto_79779 ?auto_79784 ) ) ( not ( = ?auto_79780 ?auto_79784 ) ) ( not ( = ?auto_79781 ?auto_79784 ) ) ( not ( = ?auto_79782 ?auto_79784 ) ) ( not ( = ?auto_79783 ?auto_79784 ) ) ( ON ?auto_79782 ?auto_79783 ) ( ON-TABLE ?auto_79784 ) ( ON ?auto_79781 ?auto_79782 ) ( CLEAR ?auto_79781 ) ( HOLDING ?auto_79780 ) ( CLEAR ?auto_79779 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79777 ?auto_79778 ?auto_79779 ?auto_79780 )
      ( MAKE-7PILE ?auto_79777 ?auto_79778 ?auto_79779 ?auto_79780 ?auto_79781 ?auto_79782 ?auto_79783 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79785 - BLOCK
      ?auto_79786 - BLOCK
      ?auto_79787 - BLOCK
      ?auto_79788 - BLOCK
      ?auto_79789 - BLOCK
      ?auto_79790 - BLOCK
      ?auto_79791 - BLOCK
    )
    :vars
    (
      ?auto_79792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79785 ) ( ON ?auto_79786 ?auto_79785 ) ( ON ?auto_79787 ?auto_79786 ) ( not ( = ?auto_79785 ?auto_79786 ) ) ( not ( = ?auto_79785 ?auto_79787 ) ) ( not ( = ?auto_79785 ?auto_79788 ) ) ( not ( = ?auto_79785 ?auto_79789 ) ) ( not ( = ?auto_79785 ?auto_79790 ) ) ( not ( = ?auto_79785 ?auto_79791 ) ) ( not ( = ?auto_79786 ?auto_79787 ) ) ( not ( = ?auto_79786 ?auto_79788 ) ) ( not ( = ?auto_79786 ?auto_79789 ) ) ( not ( = ?auto_79786 ?auto_79790 ) ) ( not ( = ?auto_79786 ?auto_79791 ) ) ( not ( = ?auto_79787 ?auto_79788 ) ) ( not ( = ?auto_79787 ?auto_79789 ) ) ( not ( = ?auto_79787 ?auto_79790 ) ) ( not ( = ?auto_79787 ?auto_79791 ) ) ( not ( = ?auto_79788 ?auto_79789 ) ) ( not ( = ?auto_79788 ?auto_79790 ) ) ( not ( = ?auto_79788 ?auto_79791 ) ) ( not ( = ?auto_79789 ?auto_79790 ) ) ( not ( = ?auto_79789 ?auto_79791 ) ) ( not ( = ?auto_79790 ?auto_79791 ) ) ( ON ?auto_79791 ?auto_79792 ) ( not ( = ?auto_79785 ?auto_79792 ) ) ( not ( = ?auto_79786 ?auto_79792 ) ) ( not ( = ?auto_79787 ?auto_79792 ) ) ( not ( = ?auto_79788 ?auto_79792 ) ) ( not ( = ?auto_79789 ?auto_79792 ) ) ( not ( = ?auto_79790 ?auto_79792 ) ) ( not ( = ?auto_79791 ?auto_79792 ) ) ( ON ?auto_79790 ?auto_79791 ) ( ON-TABLE ?auto_79792 ) ( ON ?auto_79789 ?auto_79790 ) ( CLEAR ?auto_79787 ) ( ON ?auto_79788 ?auto_79789 ) ( CLEAR ?auto_79788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79792 ?auto_79791 ?auto_79790 ?auto_79789 )
      ( MAKE-7PILE ?auto_79785 ?auto_79786 ?auto_79787 ?auto_79788 ?auto_79789 ?auto_79790 ?auto_79791 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79793 - BLOCK
      ?auto_79794 - BLOCK
      ?auto_79795 - BLOCK
      ?auto_79796 - BLOCK
      ?auto_79797 - BLOCK
      ?auto_79798 - BLOCK
      ?auto_79799 - BLOCK
    )
    :vars
    (
      ?auto_79800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79793 ) ( ON ?auto_79794 ?auto_79793 ) ( not ( = ?auto_79793 ?auto_79794 ) ) ( not ( = ?auto_79793 ?auto_79795 ) ) ( not ( = ?auto_79793 ?auto_79796 ) ) ( not ( = ?auto_79793 ?auto_79797 ) ) ( not ( = ?auto_79793 ?auto_79798 ) ) ( not ( = ?auto_79793 ?auto_79799 ) ) ( not ( = ?auto_79794 ?auto_79795 ) ) ( not ( = ?auto_79794 ?auto_79796 ) ) ( not ( = ?auto_79794 ?auto_79797 ) ) ( not ( = ?auto_79794 ?auto_79798 ) ) ( not ( = ?auto_79794 ?auto_79799 ) ) ( not ( = ?auto_79795 ?auto_79796 ) ) ( not ( = ?auto_79795 ?auto_79797 ) ) ( not ( = ?auto_79795 ?auto_79798 ) ) ( not ( = ?auto_79795 ?auto_79799 ) ) ( not ( = ?auto_79796 ?auto_79797 ) ) ( not ( = ?auto_79796 ?auto_79798 ) ) ( not ( = ?auto_79796 ?auto_79799 ) ) ( not ( = ?auto_79797 ?auto_79798 ) ) ( not ( = ?auto_79797 ?auto_79799 ) ) ( not ( = ?auto_79798 ?auto_79799 ) ) ( ON ?auto_79799 ?auto_79800 ) ( not ( = ?auto_79793 ?auto_79800 ) ) ( not ( = ?auto_79794 ?auto_79800 ) ) ( not ( = ?auto_79795 ?auto_79800 ) ) ( not ( = ?auto_79796 ?auto_79800 ) ) ( not ( = ?auto_79797 ?auto_79800 ) ) ( not ( = ?auto_79798 ?auto_79800 ) ) ( not ( = ?auto_79799 ?auto_79800 ) ) ( ON ?auto_79798 ?auto_79799 ) ( ON-TABLE ?auto_79800 ) ( ON ?auto_79797 ?auto_79798 ) ( ON ?auto_79796 ?auto_79797 ) ( CLEAR ?auto_79796 ) ( HOLDING ?auto_79795 ) ( CLEAR ?auto_79794 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79793 ?auto_79794 ?auto_79795 )
      ( MAKE-7PILE ?auto_79793 ?auto_79794 ?auto_79795 ?auto_79796 ?auto_79797 ?auto_79798 ?auto_79799 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79801 - BLOCK
      ?auto_79802 - BLOCK
      ?auto_79803 - BLOCK
      ?auto_79804 - BLOCK
      ?auto_79805 - BLOCK
      ?auto_79806 - BLOCK
      ?auto_79807 - BLOCK
    )
    :vars
    (
      ?auto_79808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79801 ) ( ON ?auto_79802 ?auto_79801 ) ( not ( = ?auto_79801 ?auto_79802 ) ) ( not ( = ?auto_79801 ?auto_79803 ) ) ( not ( = ?auto_79801 ?auto_79804 ) ) ( not ( = ?auto_79801 ?auto_79805 ) ) ( not ( = ?auto_79801 ?auto_79806 ) ) ( not ( = ?auto_79801 ?auto_79807 ) ) ( not ( = ?auto_79802 ?auto_79803 ) ) ( not ( = ?auto_79802 ?auto_79804 ) ) ( not ( = ?auto_79802 ?auto_79805 ) ) ( not ( = ?auto_79802 ?auto_79806 ) ) ( not ( = ?auto_79802 ?auto_79807 ) ) ( not ( = ?auto_79803 ?auto_79804 ) ) ( not ( = ?auto_79803 ?auto_79805 ) ) ( not ( = ?auto_79803 ?auto_79806 ) ) ( not ( = ?auto_79803 ?auto_79807 ) ) ( not ( = ?auto_79804 ?auto_79805 ) ) ( not ( = ?auto_79804 ?auto_79806 ) ) ( not ( = ?auto_79804 ?auto_79807 ) ) ( not ( = ?auto_79805 ?auto_79806 ) ) ( not ( = ?auto_79805 ?auto_79807 ) ) ( not ( = ?auto_79806 ?auto_79807 ) ) ( ON ?auto_79807 ?auto_79808 ) ( not ( = ?auto_79801 ?auto_79808 ) ) ( not ( = ?auto_79802 ?auto_79808 ) ) ( not ( = ?auto_79803 ?auto_79808 ) ) ( not ( = ?auto_79804 ?auto_79808 ) ) ( not ( = ?auto_79805 ?auto_79808 ) ) ( not ( = ?auto_79806 ?auto_79808 ) ) ( not ( = ?auto_79807 ?auto_79808 ) ) ( ON ?auto_79806 ?auto_79807 ) ( ON-TABLE ?auto_79808 ) ( ON ?auto_79805 ?auto_79806 ) ( ON ?auto_79804 ?auto_79805 ) ( CLEAR ?auto_79802 ) ( ON ?auto_79803 ?auto_79804 ) ( CLEAR ?auto_79803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79808 ?auto_79807 ?auto_79806 ?auto_79805 ?auto_79804 )
      ( MAKE-7PILE ?auto_79801 ?auto_79802 ?auto_79803 ?auto_79804 ?auto_79805 ?auto_79806 ?auto_79807 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79809 - BLOCK
      ?auto_79810 - BLOCK
      ?auto_79811 - BLOCK
      ?auto_79812 - BLOCK
      ?auto_79813 - BLOCK
      ?auto_79814 - BLOCK
      ?auto_79815 - BLOCK
    )
    :vars
    (
      ?auto_79816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79809 ) ( not ( = ?auto_79809 ?auto_79810 ) ) ( not ( = ?auto_79809 ?auto_79811 ) ) ( not ( = ?auto_79809 ?auto_79812 ) ) ( not ( = ?auto_79809 ?auto_79813 ) ) ( not ( = ?auto_79809 ?auto_79814 ) ) ( not ( = ?auto_79809 ?auto_79815 ) ) ( not ( = ?auto_79810 ?auto_79811 ) ) ( not ( = ?auto_79810 ?auto_79812 ) ) ( not ( = ?auto_79810 ?auto_79813 ) ) ( not ( = ?auto_79810 ?auto_79814 ) ) ( not ( = ?auto_79810 ?auto_79815 ) ) ( not ( = ?auto_79811 ?auto_79812 ) ) ( not ( = ?auto_79811 ?auto_79813 ) ) ( not ( = ?auto_79811 ?auto_79814 ) ) ( not ( = ?auto_79811 ?auto_79815 ) ) ( not ( = ?auto_79812 ?auto_79813 ) ) ( not ( = ?auto_79812 ?auto_79814 ) ) ( not ( = ?auto_79812 ?auto_79815 ) ) ( not ( = ?auto_79813 ?auto_79814 ) ) ( not ( = ?auto_79813 ?auto_79815 ) ) ( not ( = ?auto_79814 ?auto_79815 ) ) ( ON ?auto_79815 ?auto_79816 ) ( not ( = ?auto_79809 ?auto_79816 ) ) ( not ( = ?auto_79810 ?auto_79816 ) ) ( not ( = ?auto_79811 ?auto_79816 ) ) ( not ( = ?auto_79812 ?auto_79816 ) ) ( not ( = ?auto_79813 ?auto_79816 ) ) ( not ( = ?auto_79814 ?auto_79816 ) ) ( not ( = ?auto_79815 ?auto_79816 ) ) ( ON ?auto_79814 ?auto_79815 ) ( ON-TABLE ?auto_79816 ) ( ON ?auto_79813 ?auto_79814 ) ( ON ?auto_79812 ?auto_79813 ) ( ON ?auto_79811 ?auto_79812 ) ( CLEAR ?auto_79811 ) ( HOLDING ?auto_79810 ) ( CLEAR ?auto_79809 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79809 ?auto_79810 )
      ( MAKE-7PILE ?auto_79809 ?auto_79810 ?auto_79811 ?auto_79812 ?auto_79813 ?auto_79814 ?auto_79815 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79817 - BLOCK
      ?auto_79818 - BLOCK
      ?auto_79819 - BLOCK
      ?auto_79820 - BLOCK
      ?auto_79821 - BLOCK
      ?auto_79822 - BLOCK
      ?auto_79823 - BLOCK
    )
    :vars
    (
      ?auto_79824 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_79817 ) ( not ( = ?auto_79817 ?auto_79818 ) ) ( not ( = ?auto_79817 ?auto_79819 ) ) ( not ( = ?auto_79817 ?auto_79820 ) ) ( not ( = ?auto_79817 ?auto_79821 ) ) ( not ( = ?auto_79817 ?auto_79822 ) ) ( not ( = ?auto_79817 ?auto_79823 ) ) ( not ( = ?auto_79818 ?auto_79819 ) ) ( not ( = ?auto_79818 ?auto_79820 ) ) ( not ( = ?auto_79818 ?auto_79821 ) ) ( not ( = ?auto_79818 ?auto_79822 ) ) ( not ( = ?auto_79818 ?auto_79823 ) ) ( not ( = ?auto_79819 ?auto_79820 ) ) ( not ( = ?auto_79819 ?auto_79821 ) ) ( not ( = ?auto_79819 ?auto_79822 ) ) ( not ( = ?auto_79819 ?auto_79823 ) ) ( not ( = ?auto_79820 ?auto_79821 ) ) ( not ( = ?auto_79820 ?auto_79822 ) ) ( not ( = ?auto_79820 ?auto_79823 ) ) ( not ( = ?auto_79821 ?auto_79822 ) ) ( not ( = ?auto_79821 ?auto_79823 ) ) ( not ( = ?auto_79822 ?auto_79823 ) ) ( ON ?auto_79823 ?auto_79824 ) ( not ( = ?auto_79817 ?auto_79824 ) ) ( not ( = ?auto_79818 ?auto_79824 ) ) ( not ( = ?auto_79819 ?auto_79824 ) ) ( not ( = ?auto_79820 ?auto_79824 ) ) ( not ( = ?auto_79821 ?auto_79824 ) ) ( not ( = ?auto_79822 ?auto_79824 ) ) ( not ( = ?auto_79823 ?auto_79824 ) ) ( ON ?auto_79822 ?auto_79823 ) ( ON-TABLE ?auto_79824 ) ( ON ?auto_79821 ?auto_79822 ) ( ON ?auto_79820 ?auto_79821 ) ( ON ?auto_79819 ?auto_79820 ) ( CLEAR ?auto_79817 ) ( ON ?auto_79818 ?auto_79819 ) ( CLEAR ?auto_79818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_79824 ?auto_79823 ?auto_79822 ?auto_79821 ?auto_79820 ?auto_79819 )
      ( MAKE-7PILE ?auto_79817 ?auto_79818 ?auto_79819 ?auto_79820 ?auto_79821 ?auto_79822 ?auto_79823 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79825 - BLOCK
      ?auto_79826 - BLOCK
      ?auto_79827 - BLOCK
      ?auto_79828 - BLOCK
      ?auto_79829 - BLOCK
      ?auto_79830 - BLOCK
      ?auto_79831 - BLOCK
    )
    :vars
    (
      ?auto_79832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79825 ?auto_79826 ) ) ( not ( = ?auto_79825 ?auto_79827 ) ) ( not ( = ?auto_79825 ?auto_79828 ) ) ( not ( = ?auto_79825 ?auto_79829 ) ) ( not ( = ?auto_79825 ?auto_79830 ) ) ( not ( = ?auto_79825 ?auto_79831 ) ) ( not ( = ?auto_79826 ?auto_79827 ) ) ( not ( = ?auto_79826 ?auto_79828 ) ) ( not ( = ?auto_79826 ?auto_79829 ) ) ( not ( = ?auto_79826 ?auto_79830 ) ) ( not ( = ?auto_79826 ?auto_79831 ) ) ( not ( = ?auto_79827 ?auto_79828 ) ) ( not ( = ?auto_79827 ?auto_79829 ) ) ( not ( = ?auto_79827 ?auto_79830 ) ) ( not ( = ?auto_79827 ?auto_79831 ) ) ( not ( = ?auto_79828 ?auto_79829 ) ) ( not ( = ?auto_79828 ?auto_79830 ) ) ( not ( = ?auto_79828 ?auto_79831 ) ) ( not ( = ?auto_79829 ?auto_79830 ) ) ( not ( = ?auto_79829 ?auto_79831 ) ) ( not ( = ?auto_79830 ?auto_79831 ) ) ( ON ?auto_79831 ?auto_79832 ) ( not ( = ?auto_79825 ?auto_79832 ) ) ( not ( = ?auto_79826 ?auto_79832 ) ) ( not ( = ?auto_79827 ?auto_79832 ) ) ( not ( = ?auto_79828 ?auto_79832 ) ) ( not ( = ?auto_79829 ?auto_79832 ) ) ( not ( = ?auto_79830 ?auto_79832 ) ) ( not ( = ?auto_79831 ?auto_79832 ) ) ( ON ?auto_79830 ?auto_79831 ) ( ON-TABLE ?auto_79832 ) ( ON ?auto_79829 ?auto_79830 ) ( ON ?auto_79828 ?auto_79829 ) ( ON ?auto_79827 ?auto_79828 ) ( ON ?auto_79826 ?auto_79827 ) ( CLEAR ?auto_79826 ) ( HOLDING ?auto_79825 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_79825 )
      ( MAKE-7PILE ?auto_79825 ?auto_79826 ?auto_79827 ?auto_79828 ?auto_79829 ?auto_79830 ?auto_79831 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_79833 - BLOCK
      ?auto_79834 - BLOCK
      ?auto_79835 - BLOCK
      ?auto_79836 - BLOCK
      ?auto_79837 - BLOCK
      ?auto_79838 - BLOCK
      ?auto_79839 - BLOCK
    )
    :vars
    (
      ?auto_79840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_79833 ?auto_79834 ) ) ( not ( = ?auto_79833 ?auto_79835 ) ) ( not ( = ?auto_79833 ?auto_79836 ) ) ( not ( = ?auto_79833 ?auto_79837 ) ) ( not ( = ?auto_79833 ?auto_79838 ) ) ( not ( = ?auto_79833 ?auto_79839 ) ) ( not ( = ?auto_79834 ?auto_79835 ) ) ( not ( = ?auto_79834 ?auto_79836 ) ) ( not ( = ?auto_79834 ?auto_79837 ) ) ( not ( = ?auto_79834 ?auto_79838 ) ) ( not ( = ?auto_79834 ?auto_79839 ) ) ( not ( = ?auto_79835 ?auto_79836 ) ) ( not ( = ?auto_79835 ?auto_79837 ) ) ( not ( = ?auto_79835 ?auto_79838 ) ) ( not ( = ?auto_79835 ?auto_79839 ) ) ( not ( = ?auto_79836 ?auto_79837 ) ) ( not ( = ?auto_79836 ?auto_79838 ) ) ( not ( = ?auto_79836 ?auto_79839 ) ) ( not ( = ?auto_79837 ?auto_79838 ) ) ( not ( = ?auto_79837 ?auto_79839 ) ) ( not ( = ?auto_79838 ?auto_79839 ) ) ( ON ?auto_79839 ?auto_79840 ) ( not ( = ?auto_79833 ?auto_79840 ) ) ( not ( = ?auto_79834 ?auto_79840 ) ) ( not ( = ?auto_79835 ?auto_79840 ) ) ( not ( = ?auto_79836 ?auto_79840 ) ) ( not ( = ?auto_79837 ?auto_79840 ) ) ( not ( = ?auto_79838 ?auto_79840 ) ) ( not ( = ?auto_79839 ?auto_79840 ) ) ( ON ?auto_79838 ?auto_79839 ) ( ON-TABLE ?auto_79840 ) ( ON ?auto_79837 ?auto_79838 ) ( ON ?auto_79836 ?auto_79837 ) ( ON ?auto_79835 ?auto_79836 ) ( ON ?auto_79834 ?auto_79835 ) ( ON ?auto_79833 ?auto_79834 ) ( CLEAR ?auto_79833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_79840 ?auto_79839 ?auto_79838 ?auto_79837 ?auto_79836 ?auto_79835 ?auto_79834 )
      ( MAKE-7PILE ?auto_79833 ?auto_79834 ?auto_79835 ?auto_79836 ?auto_79837 ?auto_79838 ?auto_79839 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79947 - BLOCK
    )
    :vars
    (
      ?auto_79948 - BLOCK
      ?auto_79949 - BLOCK
      ?auto_79950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79947 ?auto_79948 ) ( CLEAR ?auto_79947 ) ( not ( = ?auto_79947 ?auto_79948 ) ) ( HOLDING ?auto_79949 ) ( CLEAR ?auto_79950 ) ( not ( = ?auto_79947 ?auto_79949 ) ) ( not ( = ?auto_79947 ?auto_79950 ) ) ( not ( = ?auto_79948 ?auto_79949 ) ) ( not ( = ?auto_79948 ?auto_79950 ) ) ( not ( = ?auto_79949 ?auto_79950 ) ) )
    :subtasks
    ( ( !STACK ?auto_79949 ?auto_79950 )
      ( MAKE-1PILE ?auto_79947 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79951 - BLOCK
    )
    :vars
    (
      ?auto_79953 - BLOCK
      ?auto_79954 - BLOCK
      ?auto_79952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79951 ?auto_79953 ) ( not ( = ?auto_79951 ?auto_79953 ) ) ( CLEAR ?auto_79954 ) ( not ( = ?auto_79951 ?auto_79952 ) ) ( not ( = ?auto_79951 ?auto_79954 ) ) ( not ( = ?auto_79953 ?auto_79952 ) ) ( not ( = ?auto_79953 ?auto_79954 ) ) ( not ( = ?auto_79952 ?auto_79954 ) ) ( ON ?auto_79952 ?auto_79951 ) ( CLEAR ?auto_79952 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_79953 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_79953 ?auto_79951 )
      ( MAKE-1PILE ?auto_79951 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79955 - BLOCK
    )
    :vars
    (
      ?auto_79956 - BLOCK
      ?auto_79957 - BLOCK
      ?auto_79958 - BLOCK
      ?auto_79960 - BLOCK
      ?auto_79962 - BLOCK
      ?auto_79961 - BLOCK
      ?auto_79959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79955 ?auto_79956 ) ( not ( = ?auto_79955 ?auto_79956 ) ) ( not ( = ?auto_79955 ?auto_79957 ) ) ( not ( = ?auto_79955 ?auto_79958 ) ) ( not ( = ?auto_79956 ?auto_79957 ) ) ( not ( = ?auto_79956 ?auto_79958 ) ) ( not ( = ?auto_79957 ?auto_79958 ) ) ( ON ?auto_79957 ?auto_79955 ) ( CLEAR ?auto_79957 ) ( ON-TABLE ?auto_79956 ) ( HOLDING ?auto_79958 ) ( CLEAR ?auto_79960 ) ( ON-TABLE ?auto_79962 ) ( ON ?auto_79961 ?auto_79962 ) ( ON ?auto_79959 ?auto_79961 ) ( ON ?auto_79960 ?auto_79959 ) ( not ( = ?auto_79962 ?auto_79961 ) ) ( not ( = ?auto_79962 ?auto_79959 ) ) ( not ( = ?auto_79962 ?auto_79960 ) ) ( not ( = ?auto_79962 ?auto_79958 ) ) ( not ( = ?auto_79961 ?auto_79959 ) ) ( not ( = ?auto_79961 ?auto_79960 ) ) ( not ( = ?auto_79961 ?auto_79958 ) ) ( not ( = ?auto_79959 ?auto_79960 ) ) ( not ( = ?auto_79959 ?auto_79958 ) ) ( not ( = ?auto_79960 ?auto_79958 ) ) ( not ( = ?auto_79955 ?auto_79960 ) ) ( not ( = ?auto_79955 ?auto_79962 ) ) ( not ( = ?auto_79955 ?auto_79961 ) ) ( not ( = ?auto_79955 ?auto_79959 ) ) ( not ( = ?auto_79956 ?auto_79960 ) ) ( not ( = ?auto_79956 ?auto_79962 ) ) ( not ( = ?auto_79956 ?auto_79961 ) ) ( not ( = ?auto_79956 ?auto_79959 ) ) ( not ( = ?auto_79957 ?auto_79960 ) ) ( not ( = ?auto_79957 ?auto_79962 ) ) ( not ( = ?auto_79957 ?auto_79961 ) ) ( not ( = ?auto_79957 ?auto_79959 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_79962 ?auto_79961 ?auto_79959 ?auto_79960 ?auto_79958 )
      ( MAKE-1PILE ?auto_79955 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79963 - BLOCK
    )
    :vars
    (
      ?auto_79966 - BLOCK
      ?auto_79969 - BLOCK
      ?auto_79964 - BLOCK
      ?auto_79968 - BLOCK
      ?auto_79970 - BLOCK
      ?auto_79965 - BLOCK
      ?auto_79967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79963 ?auto_79966 ) ( not ( = ?auto_79963 ?auto_79966 ) ) ( not ( = ?auto_79963 ?auto_79969 ) ) ( not ( = ?auto_79963 ?auto_79964 ) ) ( not ( = ?auto_79966 ?auto_79969 ) ) ( not ( = ?auto_79966 ?auto_79964 ) ) ( not ( = ?auto_79969 ?auto_79964 ) ) ( ON ?auto_79969 ?auto_79963 ) ( ON-TABLE ?auto_79966 ) ( CLEAR ?auto_79968 ) ( ON-TABLE ?auto_79970 ) ( ON ?auto_79965 ?auto_79970 ) ( ON ?auto_79967 ?auto_79965 ) ( ON ?auto_79968 ?auto_79967 ) ( not ( = ?auto_79970 ?auto_79965 ) ) ( not ( = ?auto_79970 ?auto_79967 ) ) ( not ( = ?auto_79970 ?auto_79968 ) ) ( not ( = ?auto_79970 ?auto_79964 ) ) ( not ( = ?auto_79965 ?auto_79967 ) ) ( not ( = ?auto_79965 ?auto_79968 ) ) ( not ( = ?auto_79965 ?auto_79964 ) ) ( not ( = ?auto_79967 ?auto_79968 ) ) ( not ( = ?auto_79967 ?auto_79964 ) ) ( not ( = ?auto_79968 ?auto_79964 ) ) ( not ( = ?auto_79963 ?auto_79968 ) ) ( not ( = ?auto_79963 ?auto_79970 ) ) ( not ( = ?auto_79963 ?auto_79965 ) ) ( not ( = ?auto_79963 ?auto_79967 ) ) ( not ( = ?auto_79966 ?auto_79968 ) ) ( not ( = ?auto_79966 ?auto_79970 ) ) ( not ( = ?auto_79966 ?auto_79965 ) ) ( not ( = ?auto_79966 ?auto_79967 ) ) ( not ( = ?auto_79969 ?auto_79968 ) ) ( not ( = ?auto_79969 ?auto_79970 ) ) ( not ( = ?auto_79969 ?auto_79965 ) ) ( not ( = ?auto_79969 ?auto_79967 ) ) ( ON ?auto_79964 ?auto_79969 ) ( CLEAR ?auto_79964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79966 ?auto_79963 ?auto_79969 )
      ( MAKE-1PILE ?auto_79963 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79971 - BLOCK
    )
    :vars
    (
      ?auto_79974 - BLOCK
      ?auto_79972 - BLOCK
      ?auto_79978 - BLOCK
      ?auto_79976 - BLOCK
      ?auto_79977 - BLOCK
      ?auto_79973 - BLOCK
      ?auto_79975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79971 ?auto_79974 ) ( not ( = ?auto_79971 ?auto_79974 ) ) ( not ( = ?auto_79971 ?auto_79972 ) ) ( not ( = ?auto_79971 ?auto_79978 ) ) ( not ( = ?auto_79974 ?auto_79972 ) ) ( not ( = ?auto_79974 ?auto_79978 ) ) ( not ( = ?auto_79972 ?auto_79978 ) ) ( ON ?auto_79972 ?auto_79971 ) ( ON-TABLE ?auto_79974 ) ( ON-TABLE ?auto_79976 ) ( ON ?auto_79977 ?auto_79976 ) ( ON ?auto_79973 ?auto_79977 ) ( not ( = ?auto_79976 ?auto_79977 ) ) ( not ( = ?auto_79976 ?auto_79973 ) ) ( not ( = ?auto_79976 ?auto_79975 ) ) ( not ( = ?auto_79976 ?auto_79978 ) ) ( not ( = ?auto_79977 ?auto_79973 ) ) ( not ( = ?auto_79977 ?auto_79975 ) ) ( not ( = ?auto_79977 ?auto_79978 ) ) ( not ( = ?auto_79973 ?auto_79975 ) ) ( not ( = ?auto_79973 ?auto_79978 ) ) ( not ( = ?auto_79975 ?auto_79978 ) ) ( not ( = ?auto_79971 ?auto_79975 ) ) ( not ( = ?auto_79971 ?auto_79976 ) ) ( not ( = ?auto_79971 ?auto_79977 ) ) ( not ( = ?auto_79971 ?auto_79973 ) ) ( not ( = ?auto_79974 ?auto_79975 ) ) ( not ( = ?auto_79974 ?auto_79976 ) ) ( not ( = ?auto_79974 ?auto_79977 ) ) ( not ( = ?auto_79974 ?auto_79973 ) ) ( not ( = ?auto_79972 ?auto_79975 ) ) ( not ( = ?auto_79972 ?auto_79976 ) ) ( not ( = ?auto_79972 ?auto_79977 ) ) ( not ( = ?auto_79972 ?auto_79973 ) ) ( ON ?auto_79978 ?auto_79972 ) ( CLEAR ?auto_79978 ) ( HOLDING ?auto_79975 ) ( CLEAR ?auto_79973 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79976 ?auto_79977 ?auto_79973 ?auto_79975 )
      ( MAKE-1PILE ?auto_79971 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79979 - BLOCK
    )
    :vars
    (
      ?auto_79981 - BLOCK
      ?auto_79983 - BLOCK
      ?auto_79980 - BLOCK
      ?auto_79982 - BLOCK
      ?auto_79984 - BLOCK
      ?auto_79985 - BLOCK
      ?auto_79986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79979 ?auto_79981 ) ( not ( = ?auto_79979 ?auto_79981 ) ) ( not ( = ?auto_79979 ?auto_79983 ) ) ( not ( = ?auto_79979 ?auto_79980 ) ) ( not ( = ?auto_79981 ?auto_79983 ) ) ( not ( = ?auto_79981 ?auto_79980 ) ) ( not ( = ?auto_79983 ?auto_79980 ) ) ( ON ?auto_79983 ?auto_79979 ) ( ON-TABLE ?auto_79981 ) ( ON-TABLE ?auto_79982 ) ( ON ?auto_79984 ?auto_79982 ) ( ON ?auto_79985 ?auto_79984 ) ( not ( = ?auto_79982 ?auto_79984 ) ) ( not ( = ?auto_79982 ?auto_79985 ) ) ( not ( = ?auto_79982 ?auto_79986 ) ) ( not ( = ?auto_79982 ?auto_79980 ) ) ( not ( = ?auto_79984 ?auto_79985 ) ) ( not ( = ?auto_79984 ?auto_79986 ) ) ( not ( = ?auto_79984 ?auto_79980 ) ) ( not ( = ?auto_79985 ?auto_79986 ) ) ( not ( = ?auto_79985 ?auto_79980 ) ) ( not ( = ?auto_79986 ?auto_79980 ) ) ( not ( = ?auto_79979 ?auto_79986 ) ) ( not ( = ?auto_79979 ?auto_79982 ) ) ( not ( = ?auto_79979 ?auto_79984 ) ) ( not ( = ?auto_79979 ?auto_79985 ) ) ( not ( = ?auto_79981 ?auto_79986 ) ) ( not ( = ?auto_79981 ?auto_79982 ) ) ( not ( = ?auto_79981 ?auto_79984 ) ) ( not ( = ?auto_79981 ?auto_79985 ) ) ( not ( = ?auto_79983 ?auto_79986 ) ) ( not ( = ?auto_79983 ?auto_79982 ) ) ( not ( = ?auto_79983 ?auto_79984 ) ) ( not ( = ?auto_79983 ?auto_79985 ) ) ( ON ?auto_79980 ?auto_79983 ) ( CLEAR ?auto_79985 ) ( ON ?auto_79986 ?auto_79980 ) ( CLEAR ?auto_79986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_79981 ?auto_79979 ?auto_79983 ?auto_79980 )
      ( MAKE-1PILE ?auto_79979 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79987 - BLOCK
    )
    :vars
    (
      ?auto_79991 - BLOCK
      ?auto_79990 - BLOCK
      ?auto_79993 - BLOCK
      ?auto_79992 - BLOCK
      ?auto_79988 - BLOCK
      ?auto_79989 - BLOCK
      ?auto_79994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79987 ?auto_79991 ) ( not ( = ?auto_79987 ?auto_79991 ) ) ( not ( = ?auto_79987 ?auto_79990 ) ) ( not ( = ?auto_79987 ?auto_79993 ) ) ( not ( = ?auto_79991 ?auto_79990 ) ) ( not ( = ?auto_79991 ?auto_79993 ) ) ( not ( = ?auto_79990 ?auto_79993 ) ) ( ON ?auto_79990 ?auto_79987 ) ( ON-TABLE ?auto_79991 ) ( ON-TABLE ?auto_79992 ) ( ON ?auto_79988 ?auto_79992 ) ( not ( = ?auto_79992 ?auto_79988 ) ) ( not ( = ?auto_79992 ?auto_79989 ) ) ( not ( = ?auto_79992 ?auto_79994 ) ) ( not ( = ?auto_79992 ?auto_79993 ) ) ( not ( = ?auto_79988 ?auto_79989 ) ) ( not ( = ?auto_79988 ?auto_79994 ) ) ( not ( = ?auto_79988 ?auto_79993 ) ) ( not ( = ?auto_79989 ?auto_79994 ) ) ( not ( = ?auto_79989 ?auto_79993 ) ) ( not ( = ?auto_79994 ?auto_79993 ) ) ( not ( = ?auto_79987 ?auto_79994 ) ) ( not ( = ?auto_79987 ?auto_79992 ) ) ( not ( = ?auto_79987 ?auto_79988 ) ) ( not ( = ?auto_79987 ?auto_79989 ) ) ( not ( = ?auto_79991 ?auto_79994 ) ) ( not ( = ?auto_79991 ?auto_79992 ) ) ( not ( = ?auto_79991 ?auto_79988 ) ) ( not ( = ?auto_79991 ?auto_79989 ) ) ( not ( = ?auto_79990 ?auto_79994 ) ) ( not ( = ?auto_79990 ?auto_79992 ) ) ( not ( = ?auto_79990 ?auto_79988 ) ) ( not ( = ?auto_79990 ?auto_79989 ) ) ( ON ?auto_79993 ?auto_79990 ) ( ON ?auto_79994 ?auto_79993 ) ( CLEAR ?auto_79994 ) ( HOLDING ?auto_79989 ) ( CLEAR ?auto_79988 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_79992 ?auto_79988 ?auto_79989 )
      ( MAKE-1PILE ?auto_79987 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_79995 - BLOCK
    )
    :vars
    (
      ?auto_80001 - BLOCK
      ?auto_80000 - BLOCK
      ?auto_79998 - BLOCK
      ?auto_79997 - BLOCK
      ?auto_79996 - BLOCK
      ?auto_79999 - BLOCK
      ?auto_80002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_79995 ?auto_80001 ) ( not ( = ?auto_79995 ?auto_80001 ) ) ( not ( = ?auto_79995 ?auto_80000 ) ) ( not ( = ?auto_79995 ?auto_79998 ) ) ( not ( = ?auto_80001 ?auto_80000 ) ) ( not ( = ?auto_80001 ?auto_79998 ) ) ( not ( = ?auto_80000 ?auto_79998 ) ) ( ON ?auto_80000 ?auto_79995 ) ( ON-TABLE ?auto_80001 ) ( ON-TABLE ?auto_79997 ) ( ON ?auto_79996 ?auto_79997 ) ( not ( = ?auto_79997 ?auto_79996 ) ) ( not ( = ?auto_79997 ?auto_79999 ) ) ( not ( = ?auto_79997 ?auto_80002 ) ) ( not ( = ?auto_79997 ?auto_79998 ) ) ( not ( = ?auto_79996 ?auto_79999 ) ) ( not ( = ?auto_79996 ?auto_80002 ) ) ( not ( = ?auto_79996 ?auto_79998 ) ) ( not ( = ?auto_79999 ?auto_80002 ) ) ( not ( = ?auto_79999 ?auto_79998 ) ) ( not ( = ?auto_80002 ?auto_79998 ) ) ( not ( = ?auto_79995 ?auto_80002 ) ) ( not ( = ?auto_79995 ?auto_79997 ) ) ( not ( = ?auto_79995 ?auto_79996 ) ) ( not ( = ?auto_79995 ?auto_79999 ) ) ( not ( = ?auto_80001 ?auto_80002 ) ) ( not ( = ?auto_80001 ?auto_79997 ) ) ( not ( = ?auto_80001 ?auto_79996 ) ) ( not ( = ?auto_80001 ?auto_79999 ) ) ( not ( = ?auto_80000 ?auto_80002 ) ) ( not ( = ?auto_80000 ?auto_79997 ) ) ( not ( = ?auto_80000 ?auto_79996 ) ) ( not ( = ?auto_80000 ?auto_79999 ) ) ( ON ?auto_79998 ?auto_80000 ) ( ON ?auto_80002 ?auto_79998 ) ( CLEAR ?auto_79996 ) ( ON ?auto_79999 ?auto_80002 ) ( CLEAR ?auto_79999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80001 ?auto_79995 ?auto_80000 ?auto_79998 ?auto_80002 )
      ( MAKE-1PILE ?auto_79995 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80003 - BLOCK
    )
    :vars
    (
      ?auto_80010 - BLOCK
      ?auto_80008 - BLOCK
      ?auto_80005 - BLOCK
      ?auto_80007 - BLOCK
      ?auto_80006 - BLOCK
      ?auto_80009 - BLOCK
      ?auto_80004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80003 ?auto_80010 ) ( not ( = ?auto_80003 ?auto_80010 ) ) ( not ( = ?auto_80003 ?auto_80008 ) ) ( not ( = ?auto_80003 ?auto_80005 ) ) ( not ( = ?auto_80010 ?auto_80008 ) ) ( not ( = ?auto_80010 ?auto_80005 ) ) ( not ( = ?auto_80008 ?auto_80005 ) ) ( ON ?auto_80008 ?auto_80003 ) ( ON-TABLE ?auto_80010 ) ( ON-TABLE ?auto_80007 ) ( not ( = ?auto_80007 ?auto_80006 ) ) ( not ( = ?auto_80007 ?auto_80009 ) ) ( not ( = ?auto_80007 ?auto_80004 ) ) ( not ( = ?auto_80007 ?auto_80005 ) ) ( not ( = ?auto_80006 ?auto_80009 ) ) ( not ( = ?auto_80006 ?auto_80004 ) ) ( not ( = ?auto_80006 ?auto_80005 ) ) ( not ( = ?auto_80009 ?auto_80004 ) ) ( not ( = ?auto_80009 ?auto_80005 ) ) ( not ( = ?auto_80004 ?auto_80005 ) ) ( not ( = ?auto_80003 ?auto_80004 ) ) ( not ( = ?auto_80003 ?auto_80007 ) ) ( not ( = ?auto_80003 ?auto_80006 ) ) ( not ( = ?auto_80003 ?auto_80009 ) ) ( not ( = ?auto_80010 ?auto_80004 ) ) ( not ( = ?auto_80010 ?auto_80007 ) ) ( not ( = ?auto_80010 ?auto_80006 ) ) ( not ( = ?auto_80010 ?auto_80009 ) ) ( not ( = ?auto_80008 ?auto_80004 ) ) ( not ( = ?auto_80008 ?auto_80007 ) ) ( not ( = ?auto_80008 ?auto_80006 ) ) ( not ( = ?auto_80008 ?auto_80009 ) ) ( ON ?auto_80005 ?auto_80008 ) ( ON ?auto_80004 ?auto_80005 ) ( ON ?auto_80009 ?auto_80004 ) ( CLEAR ?auto_80009 ) ( HOLDING ?auto_80006 ) ( CLEAR ?auto_80007 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80007 ?auto_80006 )
      ( MAKE-1PILE ?auto_80003 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80011 - BLOCK
    )
    :vars
    (
      ?auto_80016 - BLOCK
      ?auto_80017 - BLOCK
      ?auto_80013 - BLOCK
      ?auto_80014 - BLOCK
      ?auto_80012 - BLOCK
      ?auto_80015 - BLOCK
      ?auto_80018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80011 ?auto_80016 ) ( not ( = ?auto_80011 ?auto_80016 ) ) ( not ( = ?auto_80011 ?auto_80017 ) ) ( not ( = ?auto_80011 ?auto_80013 ) ) ( not ( = ?auto_80016 ?auto_80017 ) ) ( not ( = ?auto_80016 ?auto_80013 ) ) ( not ( = ?auto_80017 ?auto_80013 ) ) ( ON ?auto_80017 ?auto_80011 ) ( ON-TABLE ?auto_80016 ) ( ON-TABLE ?auto_80014 ) ( not ( = ?auto_80014 ?auto_80012 ) ) ( not ( = ?auto_80014 ?auto_80015 ) ) ( not ( = ?auto_80014 ?auto_80018 ) ) ( not ( = ?auto_80014 ?auto_80013 ) ) ( not ( = ?auto_80012 ?auto_80015 ) ) ( not ( = ?auto_80012 ?auto_80018 ) ) ( not ( = ?auto_80012 ?auto_80013 ) ) ( not ( = ?auto_80015 ?auto_80018 ) ) ( not ( = ?auto_80015 ?auto_80013 ) ) ( not ( = ?auto_80018 ?auto_80013 ) ) ( not ( = ?auto_80011 ?auto_80018 ) ) ( not ( = ?auto_80011 ?auto_80014 ) ) ( not ( = ?auto_80011 ?auto_80012 ) ) ( not ( = ?auto_80011 ?auto_80015 ) ) ( not ( = ?auto_80016 ?auto_80018 ) ) ( not ( = ?auto_80016 ?auto_80014 ) ) ( not ( = ?auto_80016 ?auto_80012 ) ) ( not ( = ?auto_80016 ?auto_80015 ) ) ( not ( = ?auto_80017 ?auto_80018 ) ) ( not ( = ?auto_80017 ?auto_80014 ) ) ( not ( = ?auto_80017 ?auto_80012 ) ) ( not ( = ?auto_80017 ?auto_80015 ) ) ( ON ?auto_80013 ?auto_80017 ) ( ON ?auto_80018 ?auto_80013 ) ( ON ?auto_80015 ?auto_80018 ) ( CLEAR ?auto_80014 ) ( ON ?auto_80012 ?auto_80015 ) ( CLEAR ?auto_80012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80016 ?auto_80011 ?auto_80017 ?auto_80013 ?auto_80018 ?auto_80015 )
      ( MAKE-1PILE ?auto_80011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80019 - BLOCK
    )
    :vars
    (
      ?auto_80026 - BLOCK
      ?auto_80022 - BLOCK
      ?auto_80021 - BLOCK
      ?auto_80023 - BLOCK
      ?auto_80024 - BLOCK
      ?auto_80020 - BLOCK
      ?auto_80025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80019 ?auto_80026 ) ( not ( = ?auto_80019 ?auto_80026 ) ) ( not ( = ?auto_80019 ?auto_80022 ) ) ( not ( = ?auto_80019 ?auto_80021 ) ) ( not ( = ?auto_80026 ?auto_80022 ) ) ( not ( = ?auto_80026 ?auto_80021 ) ) ( not ( = ?auto_80022 ?auto_80021 ) ) ( ON ?auto_80022 ?auto_80019 ) ( ON-TABLE ?auto_80026 ) ( not ( = ?auto_80023 ?auto_80024 ) ) ( not ( = ?auto_80023 ?auto_80020 ) ) ( not ( = ?auto_80023 ?auto_80025 ) ) ( not ( = ?auto_80023 ?auto_80021 ) ) ( not ( = ?auto_80024 ?auto_80020 ) ) ( not ( = ?auto_80024 ?auto_80025 ) ) ( not ( = ?auto_80024 ?auto_80021 ) ) ( not ( = ?auto_80020 ?auto_80025 ) ) ( not ( = ?auto_80020 ?auto_80021 ) ) ( not ( = ?auto_80025 ?auto_80021 ) ) ( not ( = ?auto_80019 ?auto_80025 ) ) ( not ( = ?auto_80019 ?auto_80023 ) ) ( not ( = ?auto_80019 ?auto_80024 ) ) ( not ( = ?auto_80019 ?auto_80020 ) ) ( not ( = ?auto_80026 ?auto_80025 ) ) ( not ( = ?auto_80026 ?auto_80023 ) ) ( not ( = ?auto_80026 ?auto_80024 ) ) ( not ( = ?auto_80026 ?auto_80020 ) ) ( not ( = ?auto_80022 ?auto_80025 ) ) ( not ( = ?auto_80022 ?auto_80023 ) ) ( not ( = ?auto_80022 ?auto_80024 ) ) ( not ( = ?auto_80022 ?auto_80020 ) ) ( ON ?auto_80021 ?auto_80022 ) ( ON ?auto_80025 ?auto_80021 ) ( ON ?auto_80020 ?auto_80025 ) ( ON ?auto_80024 ?auto_80020 ) ( CLEAR ?auto_80024 ) ( HOLDING ?auto_80023 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80023 )
      ( MAKE-1PILE ?auto_80019 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_80027 - BLOCK
    )
    :vars
    (
      ?auto_80028 - BLOCK
      ?auto_80034 - BLOCK
      ?auto_80033 - BLOCK
      ?auto_80029 - BLOCK
      ?auto_80032 - BLOCK
      ?auto_80031 - BLOCK
      ?auto_80030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80027 ?auto_80028 ) ( not ( = ?auto_80027 ?auto_80028 ) ) ( not ( = ?auto_80027 ?auto_80034 ) ) ( not ( = ?auto_80027 ?auto_80033 ) ) ( not ( = ?auto_80028 ?auto_80034 ) ) ( not ( = ?auto_80028 ?auto_80033 ) ) ( not ( = ?auto_80034 ?auto_80033 ) ) ( ON ?auto_80034 ?auto_80027 ) ( ON-TABLE ?auto_80028 ) ( not ( = ?auto_80029 ?auto_80032 ) ) ( not ( = ?auto_80029 ?auto_80031 ) ) ( not ( = ?auto_80029 ?auto_80030 ) ) ( not ( = ?auto_80029 ?auto_80033 ) ) ( not ( = ?auto_80032 ?auto_80031 ) ) ( not ( = ?auto_80032 ?auto_80030 ) ) ( not ( = ?auto_80032 ?auto_80033 ) ) ( not ( = ?auto_80031 ?auto_80030 ) ) ( not ( = ?auto_80031 ?auto_80033 ) ) ( not ( = ?auto_80030 ?auto_80033 ) ) ( not ( = ?auto_80027 ?auto_80030 ) ) ( not ( = ?auto_80027 ?auto_80029 ) ) ( not ( = ?auto_80027 ?auto_80032 ) ) ( not ( = ?auto_80027 ?auto_80031 ) ) ( not ( = ?auto_80028 ?auto_80030 ) ) ( not ( = ?auto_80028 ?auto_80029 ) ) ( not ( = ?auto_80028 ?auto_80032 ) ) ( not ( = ?auto_80028 ?auto_80031 ) ) ( not ( = ?auto_80034 ?auto_80030 ) ) ( not ( = ?auto_80034 ?auto_80029 ) ) ( not ( = ?auto_80034 ?auto_80032 ) ) ( not ( = ?auto_80034 ?auto_80031 ) ) ( ON ?auto_80033 ?auto_80034 ) ( ON ?auto_80030 ?auto_80033 ) ( ON ?auto_80031 ?auto_80030 ) ( ON ?auto_80032 ?auto_80031 ) ( ON ?auto_80029 ?auto_80032 ) ( CLEAR ?auto_80029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80028 ?auto_80027 ?auto_80034 ?auto_80033 ?auto_80030 ?auto_80031 ?auto_80032 )
      ( MAKE-1PILE ?auto_80027 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80046 - BLOCK
      ?auto_80047 - BLOCK
      ?auto_80048 - BLOCK
      ?auto_80049 - BLOCK
      ?auto_80050 - BLOCK
    )
    :vars
    (
      ?auto_80051 - BLOCK
      ?auto_80052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80051 ?auto_80050 ) ( CLEAR ?auto_80051 ) ( ON-TABLE ?auto_80046 ) ( ON ?auto_80047 ?auto_80046 ) ( ON ?auto_80048 ?auto_80047 ) ( ON ?auto_80049 ?auto_80048 ) ( ON ?auto_80050 ?auto_80049 ) ( not ( = ?auto_80046 ?auto_80047 ) ) ( not ( = ?auto_80046 ?auto_80048 ) ) ( not ( = ?auto_80046 ?auto_80049 ) ) ( not ( = ?auto_80046 ?auto_80050 ) ) ( not ( = ?auto_80046 ?auto_80051 ) ) ( not ( = ?auto_80047 ?auto_80048 ) ) ( not ( = ?auto_80047 ?auto_80049 ) ) ( not ( = ?auto_80047 ?auto_80050 ) ) ( not ( = ?auto_80047 ?auto_80051 ) ) ( not ( = ?auto_80048 ?auto_80049 ) ) ( not ( = ?auto_80048 ?auto_80050 ) ) ( not ( = ?auto_80048 ?auto_80051 ) ) ( not ( = ?auto_80049 ?auto_80050 ) ) ( not ( = ?auto_80049 ?auto_80051 ) ) ( not ( = ?auto_80050 ?auto_80051 ) ) ( HOLDING ?auto_80052 ) ( not ( = ?auto_80046 ?auto_80052 ) ) ( not ( = ?auto_80047 ?auto_80052 ) ) ( not ( = ?auto_80048 ?auto_80052 ) ) ( not ( = ?auto_80049 ?auto_80052 ) ) ( not ( = ?auto_80050 ?auto_80052 ) ) ( not ( = ?auto_80051 ?auto_80052 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_80052 )
      ( MAKE-5PILE ?auto_80046 ?auto_80047 ?auto_80048 ?auto_80049 ?auto_80050 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80143 - BLOCK
      ?auto_80144 - BLOCK
    )
    :vars
    (
      ?auto_80145 - BLOCK
      ?auto_80146 - BLOCK
      ?auto_80149 - BLOCK
      ?auto_80147 - BLOCK
      ?auto_80148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80143 ?auto_80144 ) ) ( ON ?auto_80144 ?auto_80145 ) ( not ( = ?auto_80143 ?auto_80145 ) ) ( not ( = ?auto_80144 ?auto_80145 ) ) ( ON ?auto_80143 ?auto_80144 ) ( CLEAR ?auto_80143 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80146 ) ( ON ?auto_80149 ?auto_80146 ) ( ON ?auto_80147 ?auto_80149 ) ( ON ?auto_80148 ?auto_80147 ) ( ON ?auto_80145 ?auto_80148 ) ( not ( = ?auto_80146 ?auto_80149 ) ) ( not ( = ?auto_80146 ?auto_80147 ) ) ( not ( = ?auto_80146 ?auto_80148 ) ) ( not ( = ?auto_80146 ?auto_80145 ) ) ( not ( = ?auto_80146 ?auto_80144 ) ) ( not ( = ?auto_80146 ?auto_80143 ) ) ( not ( = ?auto_80149 ?auto_80147 ) ) ( not ( = ?auto_80149 ?auto_80148 ) ) ( not ( = ?auto_80149 ?auto_80145 ) ) ( not ( = ?auto_80149 ?auto_80144 ) ) ( not ( = ?auto_80149 ?auto_80143 ) ) ( not ( = ?auto_80147 ?auto_80148 ) ) ( not ( = ?auto_80147 ?auto_80145 ) ) ( not ( = ?auto_80147 ?auto_80144 ) ) ( not ( = ?auto_80147 ?auto_80143 ) ) ( not ( = ?auto_80148 ?auto_80145 ) ) ( not ( = ?auto_80148 ?auto_80144 ) ) ( not ( = ?auto_80148 ?auto_80143 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80146 ?auto_80149 ?auto_80147 ?auto_80148 ?auto_80145 ?auto_80144 )
      ( MAKE-2PILE ?auto_80143 ?auto_80144 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80152 - BLOCK
      ?auto_80153 - BLOCK
    )
    :vars
    (
      ?auto_80154 - BLOCK
      ?auto_80155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80152 ?auto_80153 ) ) ( ON ?auto_80153 ?auto_80154 ) ( CLEAR ?auto_80153 ) ( not ( = ?auto_80152 ?auto_80154 ) ) ( not ( = ?auto_80153 ?auto_80154 ) ) ( ON ?auto_80152 ?auto_80155 ) ( CLEAR ?auto_80152 ) ( HAND-EMPTY ) ( not ( = ?auto_80152 ?auto_80155 ) ) ( not ( = ?auto_80153 ?auto_80155 ) ) ( not ( = ?auto_80154 ?auto_80155 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80152 ?auto_80155 )
      ( MAKE-2PILE ?auto_80152 ?auto_80153 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80156 - BLOCK
      ?auto_80157 - BLOCK
    )
    :vars
    (
      ?auto_80158 - BLOCK
      ?auto_80159 - BLOCK
      ?auto_80163 - BLOCK
      ?auto_80160 - BLOCK
      ?auto_80162 - BLOCK
      ?auto_80161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80156 ?auto_80157 ) ) ( not ( = ?auto_80156 ?auto_80158 ) ) ( not ( = ?auto_80157 ?auto_80158 ) ) ( ON ?auto_80156 ?auto_80159 ) ( CLEAR ?auto_80156 ) ( not ( = ?auto_80156 ?auto_80159 ) ) ( not ( = ?auto_80157 ?auto_80159 ) ) ( not ( = ?auto_80158 ?auto_80159 ) ) ( HOLDING ?auto_80157 ) ( CLEAR ?auto_80158 ) ( ON-TABLE ?auto_80163 ) ( ON ?auto_80160 ?auto_80163 ) ( ON ?auto_80162 ?auto_80160 ) ( ON ?auto_80161 ?auto_80162 ) ( ON ?auto_80158 ?auto_80161 ) ( not ( = ?auto_80163 ?auto_80160 ) ) ( not ( = ?auto_80163 ?auto_80162 ) ) ( not ( = ?auto_80163 ?auto_80161 ) ) ( not ( = ?auto_80163 ?auto_80158 ) ) ( not ( = ?auto_80163 ?auto_80157 ) ) ( not ( = ?auto_80160 ?auto_80162 ) ) ( not ( = ?auto_80160 ?auto_80161 ) ) ( not ( = ?auto_80160 ?auto_80158 ) ) ( not ( = ?auto_80160 ?auto_80157 ) ) ( not ( = ?auto_80162 ?auto_80161 ) ) ( not ( = ?auto_80162 ?auto_80158 ) ) ( not ( = ?auto_80162 ?auto_80157 ) ) ( not ( = ?auto_80161 ?auto_80158 ) ) ( not ( = ?auto_80161 ?auto_80157 ) ) ( not ( = ?auto_80156 ?auto_80163 ) ) ( not ( = ?auto_80156 ?auto_80160 ) ) ( not ( = ?auto_80156 ?auto_80162 ) ) ( not ( = ?auto_80156 ?auto_80161 ) ) ( not ( = ?auto_80159 ?auto_80163 ) ) ( not ( = ?auto_80159 ?auto_80160 ) ) ( not ( = ?auto_80159 ?auto_80162 ) ) ( not ( = ?auto_80159 ?auto_80161 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80163 ?auto_80160 ?auto_80162 ?auto_80161 ?auto_80158 ?auto_80157 )
      ( MAKE-2PILE ?auto_80156 ?auto_80157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80164 - BLOCK
      ?auto_80165 - BLOCK
    )
    :vars
    (
      ?auto_80169 - BLOCK
      ?auto_80170 - BLOCK
      ?auto_80168 - BLOCK
      ?auto_80166 - BLOCK
      ?auto_80167 - BLOCK
      ?auto_80171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80164 ?auto_80165 ) ) ( not ( = ?auto_80164 ?auto_80169 ) ) ( not ( = ?auto_80165 ?auto_80169 ) ) ( ON ?auto_80164 ?auto_80170 ) ( not ( = ?auto_80164 ?auto_80170 ) ) ( not ( = ?auto_80165 ?auto_80170 ) ) ( not ( = ?auto_80169 ?auto_80170 ) ) ( CLEAR ?auto_80169 ) ( ON-TABLE ?auto_80168 ) ( ON ?auto_80166 ?auto_80168 ) ( ON ?auto_80167 ?auto_80166 ) ( ON ?auto_80171 ?auto_80167 ) ( ON ?auto_80169 ?auto_80171 ) ( not ( = ?auto_80168 ?auto_80166 ) ) ( not ( = ?auto_80168 ?auto_80167 ) ) ( not ( = ?auto_80168 ?auto_80171 ) ) ( not ( = ?auto_80168 ?auto_80169 ) ) ( not ( = ?auto_80168 ?auto_80165 ) ) ( not ( = ?auto_80166 ?auto_80167 ) ) ( not ( = ?auto_80166 ?auto_80171 ) ) ( not ( = ?auto_80166 ?auto_80169 ) ) ( not ( = ?auto_80166 ?auto_80165 ) ) ( not ( = ?auto_80167 ?auto_80171 ) ) ( not ( = ?auto_80167 ?auto_80169 ) ) ( not ( = ?auto_80167 ?auto_80165 ) ) ( not ( = ?auto_80171 ?auto_80169 ) ) ( not ( = ?auto_80171 ?auto_80165 ) ) ( not ( = ?auto_80164 ?auto_80168 ) ) ( not ( = ?auto_80164 ?auto_80166 ) ) ( not ( = ?auto_80164 ?auto_80167 ) ) ( not ( = ?auto_80164 ?auto_80171 ) ) ( not ( = ?auto_80170 ?auto_80168 ) ) ( not ( = ?auto_80170 ?auto_80166 ) ) ( not ( = ?auto_80170 ?auto_80167 ) ) ( not ( = ?auto_80170 ?auto_80171 ) ) ( ON ?auto_80165 ?auto_80164 ) ( CLEAR ?auto_80165 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80170 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80170 ?auto_80164 )
      ( MAKE-2PILE ?auto_80164 ?auto_80165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80172 - BLOCK
      ?auto_80173 - BLOCK
    )
    :vars
    (
      ?auto_80177 - BLOCK
      ?auto_80174 - BLOCK
      ?auto_80175 - BLOCK
      ?auto_80179 - BLOCK
      ?auto_80178 - BLOCK
      ?auto_80176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80172 ?auto_80173 ) ) ( not ( = ?auto_80172 ?auto_80177 ) ) ( not ( = ?auto_80173 ?auto_80177 ) ) ( ON ?auto_80172 ?auto_80174 ) ( not ( = ?auto_80172 ?auto_80174 ) ) ( not ( = ?auto_80173 ?auto_80174 ) ) ( not ( = ?auto_80177 ?auto_80174 ) ) ( ON-TABLE ?auto_80175 ) ( ON ?auto_80179 ?auto_80175 ) ( ON ?auto_80178 ?auto_80179 ) ( ON ?auto_80176 ?auto_80178 ) ( not ( = ?auto_80175 ?auto_80179 ) ) ( not ( = ?auto_80175 ?auto_80178 ) ) ( not ( = ?auto_80175 ?auto_80176 ) ) ( not ( = ?auto_80175 ?auto_80177 ) ) ( not ( = ?auto_80175 ?auto_80173 ) ) ( not ( = ?auto_80179 ?auto_80178 ) ) ( not ( = ?auto_80179 ?auto_80176 ) ) ( not ( = ?auto_80179 ?auto_80177 ) ) ( not ( = ?auto_80179 ?auto_80173 ) ) ( not ( = ?auto_80178 ?auto_80176 ) ) ( not ( = ?auto_80178 ?auto_80177 ) ) ( not ( = ?auto_80178 ?auto_80173 ) ) ( not ( = ?auto_80176 ?auto_80177 ) ) ( not ( = ?auto_80176 ?auto_80173 ) ) ( not ( = ?auto_80172 ?auto_80175 ) ) ( not ( = ?auto_80172 ?auto_80179 ) ) ( not ( = ?auto_80172 ?auto_80178 ) ) ( not ( = ?auto_80172 ?auto_80176 ) ) ( not ( = ?auto_80174 ?auto_80175 ) ) ( not ( = ?auto_80174 ?auto_80179 ) ) ( not ( = ?auto_80174 ?auto_80178 ) ) ( not ( = ?auto_80174 ?auto_80176 ) ) ( ON ?auto_80173 ?auto_80172 ) ( CLEAR ?auto_80173 ) ( ON-TABLE ?auto_80174 ) ( HOLDING ?auto_80177 ) ( CLEAR ?auto_80176 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80175 ?auto_80179 ?auto_80178 ?auto_80176 ?auto_80177 )
      ( MAKE-2PILE ?auto_80172 ?auto_80173 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80180 - BLOCK
      ?auto_80181 - BLOCK
    )
    :vars
    (
      ?auto_80184 - BLOCK
      ?auto_80182 - BLOCK
      ?auto_80185 - BLOCK
      ?auto_80187 - BLOCK
      ?auto_80186 - BLOCK
      ?auto_80183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80180 ?auto_80181 ) ) ( not ( = ?auto_80180 ?auto_80184 ) ) ( not ( = ?auto_80181 ?auto_80184 ) ) ( ON ?auto_80180 ?auto_80182 ) ( not ( = ?auto_80180 ?auto_80182 ) ) ( not ( = ?auto_80181 ?auto_80182 ) ) ( not ( = ?auto_80184 ?auto_80182 ) ) ( ON-TABLE ?auto_80185 ) ( ON ?auto_80187 ?auto_80185 ) ( ON ?auto_80186 ?auto_80187 ) ( ON ?auto_80183 ?auto_80186 ) ( not ( = ?auto_80185 ?auto_80187 ) ) ( not ( = ?auto_80185 ?auto_80186 ) ) ( not ( = ?auto_80185 ?auto_80183 ) ) ( not ( = ?auto_80185 ?auto_80184 ) ) ( not ( = ?auto_80185 ?auto_80181 ) ) ( not ( = ?auto_80187 ?auto_80186 ) ) ( not ( = ?auto_80187 ?auto_80183 ) ) ( not ( = ?auto_80187 ?auto_80184 ) ) ( not ( = ?auto_80187 ?auto_80181 ) ) ( not ( = ?auto_80186 ?auto_80183 ) ) ( not ( = ?auto_80186 ?auto_80184 ) ) ( not ( = ?auto_80186 ?auto_80181 ) ) ( not ( = ?auto_80183 ?auto_80184 ) ) ( not ( = ?auto_80183 ?auto_80181 ) ) ( not ( = ?auto_80180 ?auto_80185 ) ) ( not ( = ?auto_80180 ?auto_80187 ) ) ( not ( = ?auto_80180 ?auto_80186 ) ) ( not ( = ?auto_80180 ?auto_80183 ) ) ( not ( = ?auto_80182 ?auto_80185 ) ) ( not ( = ?auto_80182 ?auto_80187 ) ) ( not ( = ?auto_80182 ?auto_80186 ) ) ( not ( = ?auto_80182 ?auto_80183 ) ) ( ON ?auto_80181 ?auto_80180 ) ( ON-TABLE ?auto_80182 ) ( CLEAR ?auto_80183 ) ( ON ?auto_80184 ?auto_80181 ) ( CLEAR ?auto_80184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80182 ?auto_80180 ?auto_80181 )
      ( MAKE-2PILE ?auto_80180 ?auto_80181 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80188 - BLOCK
      ?auto_80189 - BLOCK
    )
    :vars
    (
      ?auto_80191 - BLOCK
      ?auto_80195 - BLOCK
      ?auto_80193 - BLOCK
      ?auto_80194 - BLOCK
      ?auto_80192 - BLOCK
      ?auto_80190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80188 ?auto_80189 ) ) ( not ( = ?auto_80188 ?auto_80191 ) ) ( not ( = ?auto_80189 ?auto_80191 ) ) ( ON ?auto_80188 ?auto_80195 ) ( not ( = ?auto_80188 ?auto_80195 ) ) ( not ( = ?auto_80189 ?auto_80195 ) ) ( not ( = ?auto_80191 ?auto_80195 ) ) ( ON-TABLE ?auto_80193 ) ( ON ?auto_80194 ?auto_80193 ) ( ON ?auto_80192 ?auto_80194 ) ( not ( = ?auto_80193 ?auto_80194 ) ) ( not ( = ?auto_80193 ?auto_80192 ) ) ( not ( = ?auto_80193 ?auto_80190 ) ) ( not ( = ?auto_80193 ?auto_80191 ) ) ( not ( = ?auto_80193 ?auto_80189 ) ) ( not ( = ?auto_80194 ?auto_80192 ) ) ( not ( = ?auto_80194 ?auto_80190 ) ) ( not ( = ?auto_80194 ?auto_80191 ) ) ( not ( = ?auto_80194 ?auto_80189 ) ) ( not ( = ?auto_80192 ?auto_80190 ) ) ( not ( = ?auto_80192 ?auto_80191 ) ) ( not ( = ?auto_80192 ?auto_80189 ) ) ( not ( = ?auto_80190 ?auto_80191 ) ) ( not ( = ?auto_80190 ?auto_80189 ) ) ( not ( = ?auto_80188 ?auto_80193 ) ) ( not ( = ?auto_80188 ?auto_80194 ) ) ( not ( = ?auto_80188 ?auto_80192 ) ) ( not ( = ?auto_80188 ?auto_80190 ) ) ( not ( = ?auto_80195 ?auto_80193 ) ) ( not ( = ?auto_80195 ?auto_80194 ) ) ( not ( = ?auto_80195 ?auto_80192 ) ) ( not ( = ?auto_80195 ?auto_80190 ) ) ( ON ?auto_80189 ?auto_80188 ) ( ON-TABLE ?auto_80195 ) ( ON ?auto_80191 ?auto_80189 ) ( CLEAR ?auto_80191 ) ( HOLDING ?auto_80190 ) ( CLEAR ?auto_80192 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80193 ?auto_80194 ?auto_80192 ?auto_80190 )
      ( MAKE-2PILE ?auto_80188 ?auto_80189 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80196 - BLOCK
      ?auto_80197 - BLOCK
    )
    :vars
    (
      ?auto_80198 - BLOCK
      ?auto_80200 - BLOCK
      ?auto_80202 - BLOCK
      ?auto_80201 - BLOCK
      ?auto_80199 - BLOCK
      ?auto_80203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80196 ?auto_80197 ) ) ( not ( = ?auto_80196 ?auto_80198 ) ) ( not ( = ?auto_80197 ?auto_80198 ) ) ( ON ?auto_80196 ?auto_80200 ) ( not ( = ?auto_80196 ?auto_80200 ) ) ( not ( = ?auto_80197 ?auto_80200 ) ) ( not ( = ?auto_80198 ?auto_80200 ) ) ( ON-TABLE ?auto_80202 ) ( ON ?auto_80201 ?auto_80202 ) ( ON ?auto_80199 ?auto_80201 ) ( not ( = ?auto_80202 ?auto_80201 ) ) ( not ( = ?auto_80202 ?auto_80199 ) ) ( not ( = ?auto_80202 ?auto_80203 ) ) ( not ( = ?auto_80202 ?auto_80198 ) ) ( not ( = ?auto_80202 ?auto_80197 ) ) ( not ( = ?auto_80201 ?auto_80199 ) ) ( not ( = ?auto_80201 ?auto_80203 ) ) ( not ( = ?auto_80201 ?auto_80198 ) ) ( not ( = ?auto_80201 ?auto_80197 ) ) ( not ( = ?auto_80199 ?auto_80203 ) ) ( not ( = ?auto_80199 ?auto_80198 ) ) ( not ( = ?auto_80199 ?auto_80197 ) ) ( not ( = ?auto_80203 ?auto_80198 ) ) ( not ( = ?auto_80203 ?auto_80197 ) ) ( not ( = ?auto_80196 ?auto_80202 ) ) ( not ( = ?auto_80196 ?auto_80201 ) ) ( not ( = ?auto_80196 ?auto_80199 ) ) ( not ( = ?auto_80196 ?auto_80203 ) ) ( not ( = ?auto_80200 ?auto_80202 ) ) ( not ( = ?auto_80200 ?auto_80201 ) ) ( not ( = ?auto_80200 ?auto_80199 ) ) ( not ( = ?auto_80200 ?auto_80203 ) ) ( ON ?auto_80197 ?auto_80196 ) ( ON-TABLE ?auto_80200 ) ( ON ?auto_80198 ?auto_80197 ) ( CLEAR ?auto_80199 ) ( ON ?auto_80203 ?auto_80198 ) ( CLEAR ?auto_80203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80200 ?auto_80196 ?auto_80197 ?auto_80198 )
      ( MAKE-2PILE ?auto_80196 ?auto_80197 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80204 - BLOCK
      ?auto_80205 - BLOCK
    )
    :vars
    (
      ?auto_80211 - BLOCK
      ?auto_80207 - BLOCK
      ?auto_80210 - BLOCK
      ?auto_80206 - BLOCK
      ?auto_80208 - BLOCK
      ?auto_80209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80204 ?auto_80205 ) ) ( not ( = ?auto_80204 ?auto_80211 ) ) ( not ( = ?auto_80205 ?auto_80211 ) ) ( ON ?auto_80204 ?auto_80207 ) ( not ( = ?auto_80204 ?auto_80207 ) ) ( not ( = ?auto_80205 ?auto_80207 ) ) ( not ( = ?auto_80211 ?auto_80207 ) ) ( ON-TABLE ?auto_80210 ) ( ON ?auto_80206 ?auto_80210 ) ( not ( = ?auto_80210 ?auto_80206 ) ) ( not ( = ?auto_80210 ?auto_80208 ) ) ( not ( = ?auto_80210 ?auto_80209 ) ) ( not ( = ?auto_80210 ?auto_80211 ) ) ( not ( = ?auto_80210 ?auto_80205 ) ) ( not ( = ?auto_80206 ?auto_80208 ) ) ( not ( = ?auto_80206 ?auto_80209 ) ) ( not ( = ?auto_80206 ?auto_80211 ) ) ( not ( = ?auto_80206 ?auto_80205 ) ) ( not ( = ?auto_80208 ?auto_80209 ) ) ( not ( = ?auto_80208 ?auto_80211 ) ) ( not ( = ?auto_80208 ?auto_80205 ) ) ( not ( = ?auto_80209 ?auto_80211 ) ) ( not ( = ?auto_80209 ?auto_80205 ) ) ( not ( = ?auto_80204 ?auto_80210 ) ) ( not ( = ?auto_80204 ?auto_80206 ) ) ( not ( = ?auto_80204 ?auto_80208 ) ) ( not ( = ?auto_80204 ?auto_80209 ) ) ( not ( = ?auto_80207 ?auto_80210 ) ) ( not ( = ?auto_80207 ?auto_80206 ) ) ( not ( = ?auto_80207 ?auto_80208 ) ) ( not ( = ?auto_80207 ?auto_80209 ) ) ( ON ?auto_80205 ?auto_80204 ) ( ON-TABLE ?auto_80207 ) ( ON ?auto_80211 ?auto_80205 ) ( ON ?auto_80209 ?auto_80211 ) ( CLEAR ?auto_80209 ) ( HOLDING ?auto_80208 ) ( CLEAR ?auto_80206 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80210 ?auto_80206 ?auto_80208 )
      ( MAKE-2PILE ?auto_80204 ?auto_80205 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80212 - BLOCK
      ?auto_80213 - BLOCK
    )
    :vars
    (
      ?auto_80216 - BLOCK
      ?auto_80215 - BLOCK
      ?auto_80217 - BLOCK
      ?auto_80219 - BLOCK
      ?auto_80214 - BLOCK
      ?auto_80218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80212 ?auto_80213 ) ) ( not ( = ?auto_80212 ?auto_80216 ) ) ( not ( = ?auto_80213 ?auto_80216 ) ) ( ON ?auto_80212 ?auto_80215 ) ( not ( = ?auto_80212 ?auto_80215 ) ) ( not ( = ?auto_80213 ?auto_80215 ) ) ( not ( = ?auto_80216 ?auto_80215 ) ) ( ON-TABLE ?auto_80217 ) ( ON ?auto_80219 ?auto_80217 ) ( not ( = ?auto_80217 ?auto_80219 ) ) ( not ( = ?auto_80217 ?auto_80214 ) ) ( not ( = ?auto_80217 ?auto_80218 ) ) ( not ( = ?auto_80217 ?auto_80216 ) ) ( not ( = ?auto_80217 ?auto_80213 ) ) ( not ( = ?auto_80219 ?auto_80214 ) ) ( not ( = ?auto_80219 ?auto_80218 ) ) ( not ( = ?auto_80219 ?auto_80216 ) ) ( not ( = ?auto_80219 ?auto_80213 ) ) ( not ( = ?auto_80214 ?auto_80218 ) ) ( not ( = ?auto_80214 ?auto_80216 ) ) ( not ( = ?auto_80214 ?auto_80213 ) ) ( not ( = ?auto_80218 ?auto_80216 ) ) ( not ( = ?auto_80218 ?auto_80213 ) ) ( not ( = ?auto_80212 ?auto_80217 ) ) ( not ( = ?auto_80212 ?auto_80219 ) ) ( not ( = ?auto_80212 ?auto_80214 ) ) ( not ( = ?auto_80212 ?auto_80218 ) ) ( not ( = ?auto_80215 ?auto_80217 ) ) ( not ( = ?auto_80215 ?auto_80219 ) ) ( not ( = ?auto_80215 ?auto_80214 ) ) ( not ( = ?auto_80215 ?auto_80218 ) ) ( ON ?auto_80213 ?auto_80212 ) ( ON-TABLE ?auto_80215 ) ( ON ?auto_80216 ?auto_80213 ) ( ON ?auto_80218 ?auto_80216 ) ( CLEAR ?auto_80219 ) ( ON ?auto_80214 ?auto_80218 ) ( CLEAR ?auto_80214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80215 ?auto_80212 ?auto_80213 ?auto_80216 ?auto_80218 )
      ( MAKE-2PILE ?auto_80212 ?auto_80213 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80220 - BLOCK
      ?auto_80221 - BLOCK
    )
    :vars
    (
      ?auto_80223 - BLOCK
      ?auto_80226 - BLOCK
      ?auto_80227 - BLOCK
      ?auto_80224 - BLOCK
      ?auto_80222 - BLOCK
      ?auto_80225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80220 ?auto_80221 ) ) ( not ( = ?auto_80220 ?auto_80223 ) ) ( not ( = ?auto_80221 ?auto_80223 ) ) ( ON ?auto_80220 ?auto_80226 ) ( not ( = ?auto_80220 ?auto_80226 ) ) ( not ( = ?auto_80221 ?auto_80226 ) ) ( not ( = ?auto_80223 ?auto_80226 ) ) ( ON-TABLE ?auto_80227 ) ( not ( = ?auto_80227 ?auto_80224 ) ) ( not ( = ?auto_80227 ?auto_80222 ) ) ( not ( = ?auto_80227 ?auto_80225 ) ) ( not ( = ?auto_80227 ?auto_80223 ) ) ( not ( = ?auto_80227 ?auto_80221 ) ) ( not ( = ?auto_80224 ?auto_80222 ) ) ( not ( = ?auto_80224 ?auto_80225 ) ) ( not ( = ?auto_80224 ?auto_80223 ) ) ( not ( = ?auto_80224 ?auto_80221 ) ) ( not ( = ?auto_80222 ?auto_80225 ) ) ( not ( = ?auto_80222 ?auto_80223 ) ) ( not ( = ?auto_80222 ?auto_80221 ) ) ( not ( = ?auto_80225 ?auto_80223 ) ) ( not ( = ?auto_80225 ?auto_80221 ) ) ( not ( = ?auto_80220 ?auto_80227 ) ) ( not ( = ?auto_80220 ?auto_80224 ) ) ( not ( = ?auto_80220 ?auto_80222 ) ) ( not ( = ?auto_80220 ?auto_80225 ) ) ( not ( = ?auto_80226 ?auto_80227 ) ) ( not ( = ?auto_80226 ?auto_80224 ) ) ( not ( = ?auto_80226 ?auto_80222 ) ) ( not ( = ?auto_80226 ?auto_80225 ) ) ( ON ?auto_80221 ?auto_80220 ) ( ON-TABLE ?auto_80226 ) ( ON ?auto_80223 ?auto_80221 ) ( ON ?auto_80225 ?auto_80223 ) ( ON ?auto_80222 ?auto_80225 ) ( CLEAR ?auto_80222 ) ( HOLDING ?auto_80224 ) ( CLEAR ?auto_80227 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80227 ?auto_80224 )
      ( MAKE-2PILE ?auto_80220 ?auto_80221 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80228 - BLOCK
      ?auto_80229 - BLOCK
    )
    :vars
    (
      ?auto_80235 - BLOCK
      ?auto_80234 - BLOCK
      ?auto_80230 - BLOCK
      ?auto_80233 - BLOCK
      ?auto_80231 - BLOCK
      ?auto_80232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80228 ?auto_80229 ) ) ( not ( = ?auto_80228 ?auto_80235 ) ) ( not ( = ?auto_80229 ?auto_80235 ) ) ( ON ?auto_80228 ?auto_80234 ) ( not ( = ?auto_80228 ?auto_80234 ) ) ( not ( = ?auto_80229 ?auto_80234 ) ) ( not ( = ?auto_80235 ?auto_80234 ) ) ( ON-TABLE ?auto_80230 ) ( not ( = ?auto_80230 ?auto_80233 ) ) ( not ( = ?auto_80230 ?auto_80231 ) ) ( not ( = ?auto_80230 ?auto_80232 ) ) ( not ( = ?auto_80230 ?auto_80235 ) ) ( not ( = ?auto_80230 ?auto_80229 ) ) ( not ( = ?auto_80233 ?auto_80231 ) ) ( not ( = ?auto_80233 ?auto_80232 ) ) ( not ( = ?auto_80233 ?auto_80235 ) ) ( not ( = ?auto_80233 ?auto_80229 ) ) ( not ( = ?auto_80231 ?auto_80232 ) ) ( not ( = ?auto_80231 ?auto_80235 ) ) ( not ( = ?auto_80231 ?auto_80229 ) ) ( not ( = ?auto_80232 ?auto_80235 ) ) ( not ( = ?auto_80232 ?auto_80229 ) ) ( not ( = ?auto_80228 ?auto_80230 ) ) ( not ( = ?auto_80228 ?auto_80233 ) ) ( not ( = ?auto_80228 ?auto_80231 ) ) ( not ( = ?auto_80228 ?auto_80232 ) ) ( not ( = ?auto_80234 ?auto_80230 ) ) ( not ( = ?auto_80234 ?auto_80233 ) ) ( not ( = ?auto_80234 ?auto_80231 ) ) ( not ( = ?auto_80234 ?auto_80232 ) ) ( ON ?auto_80229 ?auto_80228 ) ( ON-TABLE ?auto_80234 ) ( ON ?auto_80235 ?auto_80229 ) ( ON ?auto_80232 ?auto_80235 ) ( ON ?auto_80231 ?auto_80232 ) ( CLEAR ?auto_80230 ) ( ON ?auto_80233 ?auto_80231 ) ( CLEAR ?auto_80233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80234 ?auto_80228 ?auto_80229 ?auto_80235 ?auto_80232 ?auto_80231 )
      ( MAKE-2PILE ?auto_80228 ?auto_80229 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80236 - BLOCK
      ?auto_80237 - BLOCK
    )
    :vars
    (
      ?auto_80239 - BLOCK
      ?auto_80241 - BLOCK
      ?auto_80242 - BLOCK
      ?auto_80243 - BLOCK
      ?auto_80238 - BLOCK
      ?auto_80240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80236 ?auto_80237 ) ) ( not ( = ?auto_80236 ?auto_80239 ) ) ( not ( = ?auto_80237 ?auto_80239 ) ) ( ON ?auto_80236 ?auto_80241 ) ( not ( = ?auto_80236 ?auto_80241 ) ) ( not ( = ?auto_80237 ?auto_80241 ) ) ( not ( = ?auto_80239 ?auto_80241 ) ) ( not ( = ?auto_80242 ?auto_80243 ) ) ( not ( = ?auto_80242 ?auto_80238 ) ) ( not ( = ?auto_80242 ?auto_80240 ) ) ( not ( = ?auto_80242 ?auto_80239 ) ) ( not ( = ?auto_80242 ?auto_80237 ) ) ( not ( = ?auto_80243 ?auto_80238 ) ) ( not ( = ?auto_80243 ?auto_80240 ) ) ( not ( = ?auto_80243 ?auto_80239 ) ) ( not ( = ?auto_80243 ?auto_80237 ) ) ( not ( = ?auto_80238 ?auto_80240 ) ) ( not ( = ?auto_80238 ?auto_80239 ) ) ( not ( = ?auto_80238 ?auto_80237 ) ) ( not ( = ?auto_80240 ?auto_80239 ) ) ( not ( = ?auto_80240 ?auto_80237 ) ) ( not ( = ?auto_80236 ?auto_80242 ) ) ( not ( = ?auto_80236 ?auto_80243 ) ) ( not ( = ?auto_80236 ?auto_80238 ) ) ( not ( = ?auto_80236 ?auto_80240 ) ) ( not ( = ?auto_80241 ?auto_80242 ) ) ( not ( = ?auto_80241 ?auto_80243 ) ) ( not ( = ?auto_80241 ?auto_80238 ) ) ( not ( = ?auto_80241 ?auto_80240 ) ) ( ON ?auto_80237 ?auto_80236 ) ( ON-TABLE ?auto_80241 ) ( ON ?auto_80239 ?auto_80237 ) ( ON ?auto_80240 ?auto_80239 ) ( ON ?auto_80238 ?auto_80240 ) ( ON ?auto_80243 ?auto_80238 ) ( CLEAR ?auto_80243 ) ( HOLDING ?auto_80242 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80242 )
      ( MAKE-2PILE ?auto_80236 ?auto_80237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80244 - BLOCK
      ?auto_80245 - BLOCK
    )
    :vars
    (
      ?auto_80247 - BLOCK
      ?auto_80250 - BLOCK
      ?auto_80251 - BLOCK
      ?auto_80246 - BLOCK
      ?auto_80248 - BLOCK
      ?auto_80249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80244 ?auto_80245 ) ) ( not ( = ?auto_80244 ?auto_80247 ) ) ( not ( = ?auto_80245 ?auto_80247 ) ) ( ON ?auto_80244 ?auto_80250 ) ( not ( = ?auto_80244 ?auto_80250 ) ) ( not ( = ?auto_80245 ?auto_80250 ) ) ( not ( = ?auto_80247 ?auto_80250 ) ) ( not ( = ?auto_80251 ?auto_80246 ) ) ( not ( = ?auto_80251 ?auto_80248 ) ) ( not ( = ?auto_80251 ?auto_80249 ) ) ( not ( = ?auto_80251 ?auto_80247 ) ) ( not ( = ?auto_80251 ?auto_80245 ) ) ( not ( = ?auto_80246 ?auto_80248 ) ) ( not ( = ?auto_80246 ?auto_80249 ) ) ( not ( = ?auto_80246 ?auto_80247 ) ) ( not ( = ?auto_80246 ?auto_80245 ) ) ( not ( = ?auto_80248 ?auto_80249 ) ) ( not ( = ?auto_80248 ?auto_80247 ) ) ( not ( = ?auto_80248 ?auto_80245 ) ) ( not ( = ?auto_80249 ?auto_80247 ) ) ( not ( = ?auto_80249 ?auto_80245 ) ) ( not ( = ?auto_80244 ?auto_80251 ) ) ( not ( = ?auto_80244 ?auto_80246 ) ) ( not ( = ?auto_80244 ?auto_80248 ) ) ( not ( = ?auto_80244 ?auto_80249 ) ) ( not ( = ?auto_80250 ?auto_80251 ) ) ( not ( = ?auto_80250 ?auto_80246 ) ) ( not ( = ?auto_80250 ?auto_80248 ) ) ( not ( = ?auto_80250 ?auto_80249 ) ) ( ON ?auto_80245 ?auto_80244 ) ( ON-TABLE ?auto_80250 ) ( ON ?auto_80247 ?auto_80245 ) ( ON ?auto_80249 ?auto_80247 ) ( ON ?auto_80248 ?auto_80249 ) ( ON ?auto_80246 ?auto_80248 ) ( ON ?auto_80251 ?auto_80246 ) ( CLEAR ?auto_80251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80250 ?auto_80244 ?auto_80245 ?auto_80247 ?auto_80249 ?auto_80248 ?auto_80246 )
      ( MAKE-2PILE ?auto_80244 ?auto_80245 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80275 - BLOCK
      ?auto_80276 - BLOCK
      ?auto_80277 - BLOCK
      ?auto_80278 - BLOCK
    )
    :vars
    (
      ?auto_80281 - BLOCK
      ?auto_80279 - BLOCK
      ?auto_80280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80281 ?auto_80278 ) ( ON-TABLE ?auto_80275 ) ( ON ?auto_80276 ?auto_80275 ) ( ON ?auto_80277 ?auto_80276 ) ( ON ?auto_80278 ?auto_80277 ) ( not ( = ?auto_80275 ?auto_80276 ) ) ( not ( = ?auto_80275 ?auto_80277 ) ) ( not ( = ?auto_80275 ?auto_80278 ) ) ( not ( = ?auto_80275 ?auto_80281 ) ) ( not ( = ?auto_80276 ?auto_80277 ) ) ( not ( = ?auto_80276 ?auto_80278 ) ) ( not ( = ?auto_80276 ?auto_80281 ) ) ( not ( = ?auto_80277 ?auto_80278 ) ) ( not ( = ?auto_80277 ?auto_80281 ) ) ( not ( = ?auto_80278 ?auto_80281 ) ) ( not ( = ?auto_80275 ?auto_80279 ) ) ( not ( = ?auto_80275 ?auto_80280 ) ) ( not ( = ?auto_80276 ?auto_80279 ) ) ( not ( = ?auto_80276 ?auto_80280 ) ) ( not ( = ?auto_80277 ?auto_80279 ) ) ( not ( = ?auto_80277 ?auto_80280 ) ) ( not ( = ?auto_80278 ?auto_80279 ) ) ( not ( = ?auto_80278 ?auto_80280 ) ) ( not ( = ?auto_80281 ?auto_80279 ) ) ( not ( = ?auto_80281 ?auto_80280 ) ) ( not ( = ?auto_80279 ?auto_80280 ) ) ( ON ?auto_80279 ?auto_80281 ) ( CLEAR ?auto_80279 ) ( HOLDING ?auto_80280 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80280 )
      ( MAKE-4PILE ?auto_80275 ?auto_80276 ?auto_80277 ?auto_80278 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80362 - BLOCK
      ?auto_80363 - BLOCK
      ?auto_80364 - BLOCK
    )
    :vars
    (
      ?auto_80365 - BLOCK
      ?auto_80366 - BLOCK
      ?auto_80368 - BLOCK
      ?auto_80367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80362 ) ( not ( = ?auto_80362 ?auto_80363 ) ) ( not ( = ?auto_80362 ?auto_80364 ) ) ( not ( = ?auto_80363 ?auto_80364 ) ) ( ON ?auto_80364 ?auto_80365 ) ( not ( = ?auto_80362 ?auto_80365 ) ) ( not ( = ?auto_80363 ?auto_80365 ) ) ( not ( = ?auto_80364 ?auto_80365 ) ) ( CLEAR ?auto_80362 ) ( ON ?auto_80363 ?auto_80364 ) ( CLEAR ?auto_80363 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80366 ) ( ON ?auto_80368 ?auto_80366 ) ( ON ?auto_80367 ?auto_80368 ) ( ON ?auto_80365 ?auto_80367 ) ( not ( = ?auto_80366 ?auto_80368 ) ) ( not ( = ?auto_80366 ?auto_80367 ) ) ( not ( = ?auto_80366 ?auto_80365 ) ) ( not ( = ?auto_80366 ?auto_80364 ) ) ( not ( = ?auto_80366 ?auto_80363 ) ) ( not ( = ?auto_80368 ?auto_80367 ) ) ( not ( = ?auto_80368 ?auto_80365 ) ) ( not ( = ?auto_80368 ?auto_80364 ) ) ( not ( = ?auto_80368 ?auto_80363 ) ) ( not ( = ?auto_80367 ?auto_80365 ) ) ( not ( = ?auto_80367 ?auto_80364 ) ) ( not ( = ?auto_80367 ?auto_80363 ) ) ( not ( = ?auto_80362 ?auto_80366 ) ) ( not ( = ?auto_80362 ?auto_80368 ) ) ( not ( = ?auto_80362 ?auto_80367 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80366 ?auto_80368 ?auto_80367 ?auto_80365 ?auto_80364 )
      ( MAKE-3PILE ?auto_80362 ?auto_80363 ?auto_80364 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80369 - BLOCK
      ?auto_80370 - BLOCK
      ?auto_80371 - BLOCK
    )
    :vars
    (
      ?auto_80372 - BLOCK
      ?auto_80373 - BLOCK
      ?auto_80375 - BLOCK
      ?auto_80374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80369 ?auto_80370 ) ) ( not ( = ?auto_80369 ?auto_80371 ) ) ( not ( = ?auto_80370 ?auto_80371 ) ) ( ON ?auto_80371 ?auto_80372 ) ( not ( = ?auto_80369 ?auto_80372 ) ) ( not ( = ?auto_80370 ?auto_80372 ) ) ( not ( = ?auto_80371 ?auto_80372 ) ) ( ON ?auto_80370 ?auto_80371 ) ( CLEAR ?auto_80370 ) ( ON-TABLE ?auto_80373 ) ( ON ?auto_80375 ?auto_80373 ) ( ON ?auto_80374 ?auto_80375 ) ( ON ?auto_80372 ?auto_80374 ) ( not ( = ?auto_80373 ?auto_80375 ) ) ( not ( = ?auto_80373 ?auto_80374 ) ) ( not ( = ?auto_80373 ?auto_80372 ) ) ( not ( = ?auto_80373 ?auto_80371 ) ) ( not ( = ?auto_80373 ?auto_80370 ) ) ( not ( = ?auto_80375 ?auto_80374 ) ) ( not ( = ?auto_80375 ?auto_80372 ) ) ( not ( = ?auto_80375 ?auto_80371 ) ) ( not ( = ?auto_80375 ?auto_80370 ) ) ( not ( = ?auto_80374 ?auto_80372 ) ) ( not ( = ?auto_80374 ?auto_80371 ) ) ( not ( = ?auto_80374 ?auto_80370 ) ) ( not ( = ?auto_80369 ?auto_80373 ) ) ( not ( = ?auto_80369 ?auto_80375 ) ) ( not ( = ?auto_80369 ?auto_80374 ) ) ( HOLDING ?auto_80369 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80369 )
      ( MAKE-3PILE ?auto_80369 ?auto_80370 ?auto_80371 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80376 - BLOCK
      ?auto_80377 - BLOCK
      ?auto_80378 - BLOCK
    )
    :vars
    (
      ?auto_80380 - BLOCK
      ?auto_80382 - BLOCK
      ?auto_80381 - BLOCK
      ?auto_80379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80376 ?auto_80377 ) ) ( not ( = ?auto_80376 ?auto_80378 ) ) ( not ( = ?auto_80377 ?auto_80378 ) ) ( ON ?auto_80378 ?auto_80380 ) ( not ( = ?auto_80376 ?auto_80380 ) ) ( not ( = ?auto_80377 ?auto_80380 ) ) ( not ( = ?auto_80378 ?auto_80380 ) ) ( ON ?auto_80377 ?auto_80378 ) ( ON-TABLE ?auto_80382 ) ( ON ?auto_80381 ?auto_80382 ) ( ON ?auto_80379 ?auto_80381 ) ( ON ?auto_80380 ?auto_80379 ) ( not ( = ?auto_80382 ?auto_80381 ) ) ( not ( = ?auto_80382 ?auto_80379 ) ) ( not ( = ?auto_80382 ?auto_80380 ) ) ( not ( = ?auto_80382 ?auto_80378 ) ) ( not ( = ?auto_80382 ?auto_80377 ) ) ( not ( = ?auto_80381 ?auto_80379 ) ) ( not ( = ?auto_80381 ?auto_80380 ) ) ( not ( = ?auto_80381 ?auto_80378 ) ) ( not ( = ?auto_80381 ?auto_80377 ) ) ( not ( = ?auto_80379 ?auto_80380 ) ) ( not ( = ?auto_80379 ?auto_80378 ) ) ( not ( = ?auto_80379 ?auto_80377 ) ) ( not ( = ?auto_80376 ?auto_80382 ) ) ( not ( = ?auto_80376 ?auto_80381 ) ) ( not ( = ?auto_80376 ?auto_80379 ) ) ( ON ?auto_80376 ?auto_80377 ) ( CLEAR ?auto_80376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80382 ?auto_80381 ?auto_80379 ?auto_80380 ?auto_80378 ?auto_80377 )
      ( MAKE-3PILE ?auto_80376 ?auto_80377 ?auto_80378 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80386 - BLOCK
      ?auto_80387 - BLOCK
      ?auto_80388 - BLOCK
    )
    :vars
    (
      ?auto_80390 - BLOCK
      ?auto_80392 - BLOCK
      ?auto_80391 - BLOCK
      ?auto_80389 - BLOCK
      ?auto_80393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80386 ?auto_80387 ) ) ( not ( = ?auto_80386 ?auto_80388 ) ) ( not ( = ?auto_80387 ?auto_80388 ) ) ( ON ?auto_80388 ?auto_80390 ) ( not ( = ?auto_80386 ?auto_80390 ) ) ( not ( = ?auto_80387 ?auto_80390 ) ) ( not ( = ?auto_80388 ?auto_80390 ) ) ( ON ?auto_80387 ?auto_80388 ) ( CLEAR ?auto_80387 ) ( ON-TABLE ?auto_80392 ) ( ON ?auto_80391 ?auto_80392 ) ( ON ?auto_80389 ?auto_80391 ) ( ON ?auto_80390 ?auto_80389 ) ( not ( = ?auto_80392 ?auto_80391 ) ) ( not ( = ?auto_80392 ?auto_80389 ) ) ( not ( = ?auto_80392 ?auto_80390 ) ) ( not ( = ?auto_80392 ?auto_80388 ) ) ( not ( = ?auto_80392 ?auto_80387 ) ) ( not ( = ?auto_80391 ?auto_80389 ) ) ( not ( = ?auto_80391 ?auto_80390 ) ) ( not ( = ?auto_80391 ?auto_80388 ) ) ( not ( = ?auto_80391 ?auto_80387 ) ) ( not ( = ?auto_80389 ?auto_80390 ) ) ( not ( = ?auto_80389 ?auto_80388 ) ) ( not ( = ?auto_80389 ?auto_80387 ) ) ( not ( = ?auto_80386 ?auto_80392 ) ) ( not ( = ?auto_80386 ?auto_80391 ) ) ( not ( = ?auto_80386 ?auto_80389 ) ) ( ON ?auto_80386 ?auto_80393 ) ( CLEAR ?auto_80386 ) ( HAND-EMPTY ) ( not ( = ?auto_80386 ?auto_80393 ) ) ( not ( = ?auto_80387 ?auto_80393 ) ) ( not ( = ?auto_80388 ?auto_80393 ) ) ( not ( = ?auto_80390 ?auto_80393 ) ) ( not ( = ?auto_80392 ?auto_80393 ) ) ( not ( = ?auto_80391 ?auto_80393 ) ) ( not ( = ?auto_80389 ?auto_80393 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80386 ?auto_80393 )
      ( MAKE-3PILE ?auto_80386 ?auto_80387 ?auto_80388 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80394 - BLOCK
      ?auto_80395 - BLOCK
      ?auto_80396 - BLOCK
    )
    :vars
    (
      ?auto_80401 - BLOCK
      ?auto_80400 - BLOCK
      ?auto_80397 - BLOCK
      ?auto_80399 - BLOCK
      ?auto_80398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80394 ?auto_80395 ) ) ( not ( = ?auto_80394 ?auto_80396 ) ) ( not ( = ?auto_80395 ?auto_80396 ) ) ( ON ?auto_80396 ?auto_80401 ) ( not ( = ?auto_80394 ?auto_80401 ) ) ( not ( = ?auto_80395 ?auto_80401 ) ) ( not ( = ?auto_80396 ?auto_80401 ) ) ( ON-TABLE ?auto_80400 ) ( ON ?auto_80397 ?auto_80400 ) ( ON ?auto_80399 ?auto_80397 ) ( ON ?auto_80401 ?auto_80399 ) ( not ( = ?auto_80400 ?auto_80397 ) ) ( not ( = ?auto_80400 ?auto_80399 ) ) ( not ( = ?auto_80400 ?auto_80401 ) ) ( not ( = ?auto_80400 ?auto_80396 ) ) ( not ( = ?auto_80400 ?auto_80395 ) ) ( not ( = ?auto_80397 ?auto_80399 ) ) ( not ( = ?auto_80397 ?auto_80401 ) ) ( not ( = ?auto_80397 ?auto_80396 ) ) ( not ( = ?auto_80397 ?auto_80395 ) ) ( not ( = ?auto_80399 ?auto_80401 ) ) ( not ( = ?auto_80399 ?auto_80396 ) ) ( not ( = ?auto_80399 ?auto_80395 ) ) ( not ( = ?auto_80394 ?auto_80400 ) ) ( not ( = ?auto_80394 ?auto_80397 ) ) ( not ( = ?auto_80394 ?auto_80399 ) ) ( ON ?auto_80394 ?auto_80398 ) ( CLEAR ?auto_80394 ) ( not ( = ?auto_80394 ?auto_80398 ) ) ( not ( = ?auto_80395 ?auto_80398 ) ) ( not ( = ?auto_80396 ?auto_80398 ) ) ( not ( = ?auto_80401 ?auto_80398 ) ) ( not ( = ?auto_80400 ?auto_80398 ) ) ( not ( = ?auto_80397 ?auto_80398 ) ) ( not ( = ?auto_80399 ?auto_80398 ) ) ( HOLDING ?auto_80395 ) ( CLEAR ?auto_80396 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80400 ?auto_80397 ?auto_80399 ?auto_80401 ?auto_80396 ?auto_80395 )
      ( MAKE-3PILE ?auto_80394 ?auto_80395 ?auto_80396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80402 - BLOCK
      ?auto_80403 - BLOCK
      ?auto_80404 - BLOCK
    )
    :vars
    (
      ?auto_80409 - BLOCK
      ?auto_80405 - BLOCK
      ?auto_80407 - BLOCK
      ?auto_80406 - BLOCK
      ?auto_80408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80402 ?auto_80403 ) ) ( not ( = ?auto_80402 ?auto_80404 ) ) ( not ( = ?auto_80403 ?auto_80404 ) ) ( ON ?auto_80404 ?auto_80409 ) ( not ( = ?auto_80402 ?auto_80409 ) ) ( not ( = ?auto_80403 ?auto_80409 ) ) ( not ( = ?auto_80404 ?auto_80409 ) ) ( ON-TABLE ?auto_80405 ) ( ON ?auto_80407 ?auto_80405 ) ( ON ?auto_80406 ?auto_80407 ) ( ON ?auto_80409 ?auto_80406 ) ( not ( = ?auto_80405 ?auto_80407 ) ) ( not ( = ?auto_80405 ?auto_80406 ) ) ( not ( = ?auto_80405 ?auto_80409 ) ) ( not ( = ?auto_80405 ?auto_80404 ) ) ( not ( = ?auto_80405 ?auto_80403 ) ) ( not ( = ?auto_80407 ?auto_80406 ) ) ( not ( = ?auto_80407 ?auto_80409 ) ) ( not ( = ?auto_80407 ?auto_80404 ) ) ( not ( = ?auto_80407 ?auto_80403 ) ) ( not ( = ?auto_80406 ?auto_80409 ) ) ( not ( = ?auto_80406 ?auto_80404 ) ) ( not ( = ?auto_80406 ?auto_80403 ) ) ( not ( = ?auto_80402 ?auto_80405 ) ) ( not ( = ?auto_80402 ?auto_80407 ) ) ( not ( = ?auto_80402 ?auto_80406 ) ) ( ON ?auto_80402 ?auto_80408 ) ( not ( = ?auto_80402 ?auto_80408 ) ) ( not ( = ?auto_80403 ?auto_80408 ) ) ( not ( = ?auto_80404 ?auto_80408 ) ) ( not ( = ?auto_80409 ?auto_80408 ) ) ( not ( = ?auto_80405 ?auto_80408 ) ) ( not ( = ?auto_80407 ?auto_80408 ) ) ( not ( = ?auto_80406 ?auto_80408 ) ) ( CLEAR ?auto_80404 ) ( ON ?auto_80403 ?auto_80402 ) ( CLEAR ?auto_80403 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80408 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80408 ?auto_80402 )
      ( MAKE-3PILE ?auto_80402 ?auto_80403 ?auto_80404 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80410 - BLOCK
      ?auto_80411 - BLOCK
      ?auto_80412 - BLOCK
    )
    :vars
    (
      ?auto_80414 - BLOCK
      ?auto_80417 - BLOCK
      ?auto_80413 - BLOCK
      ?auto_80415 - BLOCK
      ?auto_80416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80410 ?auto_80411 ) ) ( not ( = ?auto_80410 ?auto_80412 ) ) ( not ( = ?auto_80411 ?auto_80412 ) ) ( not ( = ?auto_80410 ?auto_80414 ) ) ( not ( = ?auto_80411 ?auto_80414 ) ) ( not ( = ?auto_80412 ?auto_80414 ) ) ( ON-TABLE ?auto_80417 ) ( ON ?auto_80413 ?auto_80417 ) ( ON ?auto_80415 ?auto_80413 ) ( ON ?auto_80414 ?auto_80415 ) ( not ( = ?auto_80417 ?auto_80413 ) ) ( not ( = ?auto_80417 ?auto_80415 ) ) ( not ( = ?auto_80417 ?auto_80414 ) ) ( not ( = ?auto_80417 ?auto_80412 ) ) ( not ( = ?auto_80417 ?auto_80411 ) ) ( not ( = ?auto_80413 ?auto_80415 ) ) ( not ( = ?auto_80413 ?auto_80414 ) ) ( not ( = ?auto_80413 ?auto_80412 ) ) ( not ( = ?auto_80413 ?auto_80411 ) ) ( not ( = ?auto_80415 ?auto_80414 ) ) ( not ( = ?auto_80415 ?auto_80412 ) ) ( not ( = ?auto_80415 ?auto_80411 ) ) ( not ( = ?auto_80410 ?auto_80417 ) ) ( not ( = ?auto_80410 ?auto_80413 ) ) ( not ( = ?auto_80410 ?auto_80415 ) ) ( ON ?auto_80410 ?auto_80416 ) ( not ( = ?auto_80410 ?auto_80416 ) ) ( not ( = ?auto_80411 ?auto_80416 ) ) ( not ( = ?auto_80412 ?auto_80416 ) ) ( not ( = ?auto_80414 ?auto_80416 ) ) ( not ( = ?auto_80417 ?auto_80416 ) ) ( not ( = ?auto_80413 ?auto_80416 ) ) ( not ( = ?auto_80415 ?auto_80416 ) ) ( ON ?auto_80411 ?auto_80410 ) ( CLEAR ?auto_80411 ) ( ON-TABLE ?auto_80416 ) ( HOLDING ?auto_80412 ) ( CLEAR ?auto_80414 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80417 ?auto_80413 ?auto_80415 ?auto_80414 ?auto_80412 )
      ( MAKE-3PILE ?auto_80410 ?auto_80411 ?auto_80412 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80418 - BLOCK
      ?auto_80419 - BLOCK
      ?auto_80420 - BLOCK
    )
    :vars
    (
      ?auto_80421 - BLOCK
      ?auto_80425 - BLOCK
      ?auto_80423 - BLOCK
      ?auto_80424 - BLOCK
      ?auto_80422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80418 ?auto_80419 ) ) ( not ( = ?auto_80418 ?auto_80420 ) ) ( not ( = ?auto_80419 ?auto_80420 ) ) ( not ( = ?auto_80418 ?auto_80421 ) ) ( not ( = ?auto_80419 ?auto_80421 ) ) ( not ( = ?auto_80420 ?auto_80421 ) ) ( ON-TABLE ?auto_80425 ) ( ON ?auto_80423 ?auto_80425 ) ( ON ?auto_80424 ?auto_80423 ) ( ON ?auto_80421 ?auto_80424 ) ( not ( = ?auto_80425 ?auto_80423 ) ) ( not ( = ?auto_80425 ?auto_80424 ) ) ( not ( = ?auto_80425 ?auto_80421 ) ) ( not ( = ?auto_80425 ?auto_80420 ) ) ( not ( = ?auto_80425 ?auto_80419 ) ) ( not ( = ?auto_80423 ?auto_80424 ) ) ( not ( = ?auto_80423 ?auto_80421 ) ) ( not ( = ?auto_80423 ?auto_80420 ) ) ( not ( = ?auto_80423 ?auto_80419 ) ) ( not ( = ?auto_80424 ?auto_80421 ) ) ( not ( = ?auto_80424 ?auto_80420 ) ) ( not ( = ?auto_80424 ?auto_80419 ) ) ( not ( = ?auto_80418 ?auto_80425 ) ) ( not ( = ?auto_80418 ?auto_80423 ) ) ( not ( = ?auto_80418 ?auto_80424 ) ) ( ON ?auto_80418 ?auto_80422 ) ( not ( = ?auto_80418 ?auto_80422 ) ) ( not ( = ?auto_80419 ?auto_80422 ) ) ( not ( = ?auto_80420 ?auto_80422 ) ) ( not ( = ?auto_80421 ?auto_80422 ) ) ( not ( = ?auto_80425 ?auto_80422 ) ) ( not ( = ?auto_80423 ?auto_80422 ) ) ( not ( = ?auto_80424 ?auto_80422 ) ) ( ON ?auto_80419 ?auto_80418 ) ( ON-TABLE ?auto_80422 ) ( CLEAR ?auto_80421 ) ( ON ?auto_80420 ?auto_80419 ) ( CLEAR ?auto_80420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80422 ?auto_80418 ?auto_80419 )
      ( MAKE-3PILE ?auto_80418 ?auto_80419 ?auto_80420 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80426 - BLOCK
      ?auto_80427 - BLOCK
      ?auto_80428 - BLOCK
    )
    :vars
    (
      ?auto_80429 - BLOCK
      ?auto_80433 - BLOCK
      ?auto_80432 - BLOCK
      ?auto_80430 - BLOCK
      ?auto_80431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80426 ?auto_80427 ) ) ( not ( = ?auto_80426 ?auto_80428 ) ) ( not ( = ?auto_80427 ?auto_80428 ) ) ( not ( = ?auto_80426 ?auto_80429 ) ) ( not ( = ?auto_80427 ?auto_80429 ) ) ( not ( = ?auto_80428 ?auto_80429 ) ) ( ON-TABLE ?auto_80433 ) ( ON ?auto_80432 ?auto_80433 ) ( ON ?auto_80430 ?auto_80432 ) ( not ( = ?auto_80433 ?auto_80432 ) ) ( not ( = ?auto_80433 ?auto_80430 ) ) ( not ( = ?auto_80433 ?auto_80429 ) ) ( not ( = ?auto_80433 ?auto_80428 ) ) ( not ( = ?auto_80433 ?auto_80427 ) ) ( not ( = ?auto_80432 ?auto_80430 ) ) ( not ( = ?auto_80432 ?auto_80429 ) ) ( not ( = ?auto_80432 ?auto_80428 ) ) ( not ( = ?auto_80432 ?auto_80427 ) ) ( not ( = ?auto_80430 ?auto_80429 ) ) ( not ( = ?auto_80430 ?auto_80428 ) ) ( not ( = ?auto_80430 ?auto_80427 ) ) ( not ( = ?auto_80426 ?auto_80433 ) ) ( not ( = ?auto_80426 ?auto_80432 ) ) ( not ( = ?auto_80426 ?auto_80430 ) ) ( ON ?auto_80426 ?auto_80431 ) ( not ( = ?auto_80426 ?auto_80431 ) ) ( not ( = ?auto_80427 ?auto_80431 ) ) ( not ( = ?auto_80428 ?auto_80431 ) ) ( not ( = ?auto_80429 ?auto_80431 ) ) ( not ( = ?auto_80433 ?auto_80431 ) ) ( not ( = ?auto_80432 ?auto_80431 ) ) ( not ( = ?auto_80430 ?auto_80431 ) ) ( ON ?auto_80427 ?auto_80426 ) ( ON-TABLE ?auto_80431 ) ( ON ?auto_80428 ?auto_80427 ) ( CLEAR ?auto_80428 ) ( HOLDING ?auto_80429 ) ( CLEAR ?auto_80430 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80433 ?auto_80432 ?auto_80430 ?auto_80429 )
      ( MAKE-3PILE ?auto_80426 ?auto_80427 ?auto_80428 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80434 - BLOCK
      ?auto_80435 - BLOCK
      ?auto_80436 - BLOCK
    )
    :vars
    (
      ?auto_80437 - BLOCK
      ?auto_80439 - BLOCK
      ?auto_80438 - BLOCK
      ?auto_80440 - BLOCK
      ?auto_80441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80434 ?auto_80435 ) ) ( not ( = ?auto_80434 ?auto_80436 ) ) ( not ( = ?auto_80435 ?auto_80436 ) ) ( not ( = ?auto_80434 ?auto_80437 ) ) ( not ( = ?auto_80435 ?auto_80437 ) ) ( not ( = ?auto_80436 ?auto_80437 ) ) ( ON-TABLE ?auto_80439 ) ( ON ?auto_80438 ?auto_80439 ) ( ON ?auto_80440 ?auto_80438 ) ( not ( = ?auto_80439 ?auto_80438 ) ) ( not ( = ?auto_80439 ?auto_80440 ) ) ( not ( = ?auto_80439 ?auto_80437 ) ) ( not ( = ?auto_80439 ?auto_80436 ) ) ( not ( = ?auto_80439 ?auto_80435 ) ) ( not ( = ?auto_80438 ?auto_80440 ) ) ( not ( = ?auto_80438 ?auto_80437 ) ) ( not ( = ?auto_80438 ?auto_80436 ) ) ( not ( = ?auto_80438 ?auto_80435 ) ) ( not ( = ?auto_80440 ?auto_80437 ) ) ( not ( = ?auto_80440 ?auto_80436 ) ) ( not ( = ?auto_80440 ?auto_80435 ) ) ( not ( = ?auto_80434 ?auto_80439 ) ) ( not ( = ?auto_80434 ?auto_80438 ) ) ( not ( = ?auto_80434 ?auto_80440 ) ) ( ON ?auto_80434 ?auto_80441 ) ( not ( = ?auto_80434 ?auto_80441 ) ) ( not ( = ?auto_80435 ?auto_80441 ) ) ( not ( = ?auto_80436 ?auto_80441 ) ) ( not ( = ?auto_80437 ?auto_80441 ) ) ( not ( = ?auto_80439 ?auto_80441 ) ) ( not ( = ?auto_80438 ?auto_80441 ) ) ( not ( = ?auto_80440 ?auto_80441 ) ) ( ON ?auto_80435 ?auto_80434 ) ( ON-TABLE ?auto_80441 ) ( ON ?auto_80436 ?auto_80435 ) ( CLEAR ?auto_80440 ) ( ON ?auto_80437 ?auto_80436 ) ( CLEAR ?auto_80437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80441 ?auto_80434 ?auto_80435 ?auto_80436 )
      ( MAKE-3PILE ?auto_80434 ?auto_80435 ?auto_80436 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80442 - BLOCK
      ?auto_80443 - BLOCK
      ?auto_80444 - BLOCK
    )
    :vars
    (
      ?auto_80449 - BLOCK
      ?auto_80447 - BLOCK
      ?auto_80446 - BLOCK
      ?auto_80448 - BLOCK
      ?auto_80445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80442 ?auto_80443 ) ) ( not ( = ?auto_80442 ?auto_80444 ) ) ( not ( = ?auto_80443 ?auto_80444 ) ) ( not ( = ?auto_80442 ?auto_80449 ) ) ( not ( = ?auto_80443 ?auto_80449 ) ) ( not ( = ?auto_80444 ?auto_80449 ) ) ( ON-TABLE ?auto_80447 ) ( ON ?auto_80446 ?auto_80447 ) ( not ( = ?auto_80447 ?auto_80446 ) ) ( not ( = ?auto_80447 ?auto_80448 ) ) ( not ( = ?auto_80447 ?auto_80449 ) ) ( not ( = ?auto_80447 ?auto_80444 ) ) ( not ( = ?auto_80447 ?auto_80443 ) ) ( not ( = ?auto_80446 ?auto_80448 ) ) ( not ( = ?auto_80446 ?auto_80449 ) ) ( not ( = ?auto_80446 ?auto_80444 ) ) ( not ( = ?auto_80446 ?auto_80443 ) ) ( not ( = ?auto_80448 ?auto_80449 ) ) ( not ( = ?auto_80448 ?auto_80444 ) ) ( not ( = ?auto_80448 ?auto_80443 ) ) ( not ( = ?auto_80442 ?auto_80447 ) ) ( not ( = ?auto_80442 ?auto_80446 ) ) ( not ( = ?auto_80442 ?auto_80448 ) ) ( ON ?auto_80442 ?auto_80445 ) ( not ( = ?auto_80442 ?auto_80445 ) ) ( not ( = ?auto_80443 ?auto_80445 ) ) ( not ( = ?auto_80444 ?auto_80445 ) ) ( not ( = ?auto_80449 ?auto_80445 ) ) ( not ( = ?auto_80447 ?auto_80445 ) ) ( not ( = ?auto_80446 ?auto_80445 ) ) ( not ( = ?auto_80448 ?auto_80445 ) ) ( ON ?auto_80443 ?auto_80442 ) ( ON-TABLE ?auto_80445 ) ( ON ?auto_80444 ?auto_80443 ) ( ON ?auto_80449 ?auto_80444 ) ( CLEAR ?auto_80449 ) ( HOLDING ?auto_80448 ) ( CLEAR ?auto_80446 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80447 ?auto_80446 ?auto_80448 )
      ( MAKE-3PILE ?auto_80442 ?auto_80443 ?auto_80444 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80450 - BLOCK
      ?auto_80451 - BLOCK
      ?auto_80452 - BLOCK
    )
    :vars
    (
      ?auto_80454 - BLOCK
      ?auto_80457 - BLOCK
      ?auto_80455 - BLOCK
      ?auto_80453 - BLOCK
      ?auto_80456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80450 ?auto_80451 ) ) ( not ( = ?auto_80450 ?auto_80452 ) ) ( not ( = ?auto_80451 ?auto_80452 ) ) ( not ( = ?auto_80450 ?auto_80454 ) ) ( not ( = ?auto_80451 ?auto_80454 ) ) ( not ( = ?auto_80452 ?auto_80454 ) ) ( ON-TABLE ?auto_80457 ) ( ON ?auto_80455 ?auto_80457 ) ( not ( = ?auto_80457 ?auto_80455 ) ) ( not ( = ?auto_80457 ?auto_80453 ) ) ( not ( = ?auto_80457 ?auto_80454 ) ) ( not ( = ?auto_80457 ?auto_80452 ) ) ( not ( = ?auto_80457 ?auto_80451 ) ) ( not ( = ?auto_80455 ?auto_80453 ) ) ( not ( = ?auto_80455 ?auto_80454 ) ) ( not ( = ?auto_80455 ?auto_80452 ) ) ( not ( = ?auto_80455 ?auto_80451 ) ) ( not ( = ?auto_80453 ?auto_80454 ) ) ( not ( = ?auto_80453 ?auto_80452 ) ) ( not ( = ?auto_80453 ?auto_80451 ) ) ( not ( = ?auto_80450 ?auto_80457 ) ) ( not ( = ?auto_80450 ?auto_80455 ) ) ( not ( = ?auto_80450 ?auto_80453 ) ) ( ON ?auto_80450 ?auto_80456 ) ( not ( = ?auto_80450 ?auto_80456 ) ) ( not ( = ?auto_80451 ?auto_80456 ) ) ( not ( = ?auto_80452 ?auto_80456 ) ) ( not ( = ?auto_80454 ?auto_80456 ) ) ( not ( = ?auto_80457 ?auto_80456 ) ) ( not ( = ?auto_80455 ?auto_80456 ) ) ( not ( = ?auto_80453 ?auto_80456 ) ) ( ON ?auto_80451 ?auto_80450 ) ( ON-TABLE ?auto_80456 ) ( ON ?auto_80452 ?auto_80451 ) ( ON ?auto_80454 ?auto_80452 ) ( CLEAR ?auto_80455 ) ( ON ?auto_80453 ?auto_80454 ) ( CLEAR ?auto_80453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80456 ?auto_80450 ?auto_80451 ?auto_80452 ?auto_80454 )
      ( MAKE-3PILE ?auto_80450 ?auto_80451 ?auto_80452 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80458 - BLOCK
      ?auto_80459 - BLOCK
      ?auto_80460 - BLOCK
    )
    :vars
    (
      ?auto_80461 - BLOCK
      ?auto_80464 - BLOCK
      ?auto_80465 - BLOCK
      ?auto_80463 - BLOCK
      ?auto_80462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80458 ?auto_80459 ) ) ( not ( = ?auto_80458 ?auto_80460 ) ) ( not ( = ?auto_80459 ?auto_80460 ) ) ( not ( = ?auto_80458 ?auto_80461 ) ) ( not ( = ?auto_80459 ?auto_80461 ) ) ( not ( = ?auto_80460 ?auto_80461 ) ) ( ON-TABLE ?auto_80464 ) ( not ( = ?auto_80464 ?auto_80465 ) ) ( not ( = ?auto_80464 ?auto_80463 ) ) ( not ( = ?auto_80464 ?auto_80461 ) ) ( not ( = ?auto_80464 ?auto_80460 ) ) ( not ( = ?auto_80464 ?auto_80459 ) ) ( not ( = ?auto_80465 ?auto_80463 ) ) ( not ( = ?auto_80465 ?auto_80461 ) ) ( not ( = ?auto_80465 ?auto_80460 ) ) ( not ( = ?auto_80465 ?auto_80459 ) ) ( not ( = ?auto_80463 ?auto_80461 ) ) ( not ( = ?auto_80463 ?auto_80460 ) ) ( not ( = ?auto_80463 ?auto_80459 ) ) ( not ( = ?auto_80458 ?auto_80464 ) ) ( not ( = ?auto_80458 ?auto_80465 ) ) ( not ( = ?auto_80458 ?auto_80463 ) ) ( ON ?auto_80458 ?auto_80462 ) ( not ( = ?auto_80458 ?auto_80462 ) ) ( not ( = ?auto_80459 ?auto_80462 ) ) ( not ( = ?auto_80460 ?auto_80462 ) ) ( not ( = ?auto_80461 ?auto_80462 ) ) ( not ( = ?auto_80464 ?auto_80462 ) ) ( not ( = ?auto_80465 ?auto_80462 ) ) ( not ( = ?auto_80463 ?auto_80462 ) ) ( ON ?auto_80459 ?auto_80458 ) ( ON-TABLE ?auto_80462 ) ( ON ?auto_80460 ?auto_80459 ) ( ON ?auto_80461 ?auto_80460 ) ( ON ?auto_80463 ?auto_80461 ) ( CLEAR ?auto_80463 ) ( HOLDING ?auto_80465 ) ( CLEAR ?auto_80464 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80464 ?auto_80465 )
      ( MAKE-3PILE ?auto_80458 ?auto_80459 ?auto_80460 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80466 - BLOCK
      ?auto_80467 - BLOCK
      ?auto_80468 - BLOCK
    )
    :vars
    (
      ?auto_80473 - BLOCK
      ?auto_80469 - BLOCK
      ?auto_80472 - BLOCK
      ?auto_80470 - BLOCK
      ?auto_80471 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80466 ?auto_80467 ) ) ( not ( = ?auto_80466 ?auto_80468 ) ) ( not ( = ?auto_80467 ?auto_80468 ) ) ( not ( = ?auto_80466 ?auto_80473 ) ) ( not ( = ?auto_80467 ?auto_80473 ) ) ( not ( = ?auto_80468 ?auto_80473 ) ) ( ON-TABLE ?auto_80469 ) ( not ( = ?auto_80469 ?auto_80472 ) ) ( not ( = ?auto_80469 ?auto_80470 ) ) ( not ( = ?auto_80469 ?auto_80473 ) ) ( not ( = ?auto_80469 ?auto_80468 ) ) ( not ( = ?auto_80469 ?auto_80467 ) ) ( not ( = ?auto_80472 ?auto_80470 ) ) ( not ( = ?auto_80472 ?auto_80473 ) ) ( not ( = ?auto_80472 ?auto_80468 ) ) ( not ( = ?auto_80472 ?auto_80467 ) ) ( not ( = ?auto_80470 ?auto_80473 ) ) ( not ( = ?auto_80470 ?auto_80468 ) ) ( not ( = ?auto_80470 ?auto_80467 ) ) ( not ( = ?auto_80466 ?auto_80469 ) ) ( not ( = ?auto_80466 ?auto_80472 ) ) ( not ( = ?auto_80466 ?auto_80470 ) ) ( ON ?auto_80466 ?auto_80471 ) ( not ( = ?auto_80466 ?auto_80471 ) ) ( not ( = ?auto_80467 ?auto_80471 ) ) ( not ( = ?auto_80468 ?auto_80471 ) ) ( not ( = ?auto_80473 ?auto_80471 ) ) ( not ( = ?auto_80469 ?auto_80471 ) ) ( not ( = ?auto_80472 ?auto_80471 ) ) ( not ( = ?auto_80470 ?auto_80471 ) ) ( ON ?auto_80467 ?auto_80466 ) ( ON-TABLE ?auto_80471 ) ( ON ?auto_80468 ?auto_80467 ) ( ON ?auto_80473 ?auto_80468 ) ( ON ?auto_80470 ?auto_80473 ) ( CLEAR ?auto_80469 ) ( ON ?auto_80472 ?auto_80470 ) ( CLEAR ?auto_80472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80471 ?auto_80466 ?auto_80467 ?auto_80468 ?auto_80473 ?auto_80470 )
      ( MAKE-3PILE ?auto_80466 ?auto_80467 ?auto_80468 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80474 - BLOCK
      ?auto_80475 - BLOCK
      ?auto_80476 - BLOCK
    )
    :vars
    (
      ?auto_80479 - BLOCK
      ?auto_80481 - BLOCK
      ?auto_80478 - BLOCK
      ?auto_80480 - BLOCK
      ?auto_80477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80474 ?auto_80475 ) ) ( not ( = ?auto_80474 ?auto_80476 ) ) ( not ( = ?auto_80475 ?auto_80476 ) ) ( not ( = ?auto_80474 ?auto_80479 ) ) ( not ( = ?auto_80475 ?auto_80479 ) ) ( not ( = ?auto_80476 ?auto_80479 ) ) ( not ( = ?auto_80481 ?auto_80478 ) ) ( not ( = ?auto_80481 ?auto_80480 ) ) ( not ( = ?auto_80481 ?auto_80479 ) ) ( not ( = ?auto_80481 ?auto_80476 ) ) ( not ( = ?auto_80481 ?auto_80475 ) ) ( not ( = ?auto_80478 ?auto_80480 ) ) ( not ( = ?auto_80478 ?auto_80479 ) ) ( not ( = ?auto_80478 ?auto_80476 ) ) ( not ( = ?auto_80478 ?auto_80475 ) ) ( not ( = ?auto_80480 ?auto_80479 ) ) ( not ( = ?auto_80480 ?auto_80476 ) ) ( not ( = ?auto_80480 ?auto_80475 ) ) ( not ( = ?auto_80474 ?auto_80481 ) ) ( not ( = ?auto_80474 ?auto_80478 ) ) ( not ( = ?auto_80474 ?auto_80480 ) ) ( ON ?auto_80474 ?auto_80477 ) ( not ( = ?auto_80474 ?auto_80477 ) ) ( not ( = ?auto_80475 ?auto_80477 ) ) ( not ( = ?auto_80476 ?auto_80477 ) ) ( not ( = ?auto_80479 ?auto_80477 ) ) ( not ( = ?auto_80481 ?auto_80477 ) ) ( not ( = ?auto_80478 ?auto_80477 ) ) ( not ( = ?auto_80480 ?auto_80477 ) ) ( ON ?auto_80475 ?auto_80474 ) ( ON-TABLE ?auto_80477 ) ( ON ?auto_80476 ?auto_80475 ) ( ON ?auto_80479 ?auto_80476 ) ( ON ?auto_80480 ?auto_80479 ) ( ON ?auto_80478 ?auto_80480 ) ( CLEAR ?auto_80478 ) ( HOLDING ?auto_80481 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80481 )
      ( MAKE-3PILE ?auto_80474 ?auto_80475 ?auto_80476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80482 - BLOCK
      ?auto_80483 - BLOCK
      ?auto_80484 - BLOCK
    )
    :vars
    (
      ?auto_80486 - BLOCK
      ?auto_80485 - BLOCK
      ?auto_80487 - BLOCK
      ?auto_80489 - BLOCK
      ?auto_80488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80482 ?auto_80483 ) ) ( not ( = ?auto_80482 ?auto_80484 ) ) ( not ( = ?auto_80483 ?auto_80484 ) ) ( not ( = ?auto_80482 ?auto_80486 ) ) ( not ( = ?auto_80483 ?auto_80486 ) ) ( not ( = ?auto_80484 ?auto_80486 ) ) ( not ( = ?auto_80485 ?auto_80487 ) ) ( not ( = ?auto_80485 ?auto_80489 ) ) ( not ( = ?auto_80485 ?auto_80486 ) ) ( not ( = ?auto_80485 ?auto_80484 ) ) ( not ( = ?auto_80485 ?auto_80483 ) ) ( not ( = ?auto_80487 ?auto_80489 ) ) ( not ( = ?auto_80487 ?auto_80486 ) ) ( not ( = ?auto_80487 ?auto_80484 ) ) ( not ( = ?auto_80487 ?auto_80483 ) ) ( not ( = ?auto_80489 ?auto_80486 ) ) ( not ( = ?auto_80489 ?auto_80484 ) ) ( not ( = ?auto_80489 ?auto_80483 ) ) ( not ( = ?auto_80482 ?auto_80485 ) ) ( not ( = ?auto_80482 ?auto_80487 ) ) ( not ( = ?auto_80482 ?auto_80489 ) ) ( ON ?auto_80482 ?auto_80488 ) ( not ( = ?auto_80482 ?auto_80488 ) ) ( not ( = ?auto_80483 ?auto_80488 ) ) ( not ( = ?auto_80484 ?auto_80488 ) ) ( not ( = ?auto_80486 ?auto_80488 ) ) ( not ( = ?auto_80485 ?auto_80488 ) ) ( not ( = ?auto_80487 ?auto_80488 ) ) ( not ( = ?auto_80489 ?auto_80488 ) ) ( ON ?auto_80483 ?auto_80482 ) ( ON-TABLE ?auto_80488 ) ( ON ?auto_80484 ?auto_80483 ) ( ON ?auto_80486 ?auto_80484 ) ( ON ?auto_80489 ?auto_80486 ) ( ON ?auto_80487 ?auto_80489 ) ( ON ?auto_80485 ?auto_80487 ) ( CLEAR ?auto_80485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80488 ?auto_80482 ?auto_80483 ?auto_80484 ?auto_80486 ?auto_80489 ?auto_80487 )
      ( MAKE-3PILE ?auto_80482 ?auto_80483 ?auto_80484 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80509 - BLOCK
      ?auto_80510 - BLOCK
      ?auto_80511 - BLOCK
    )
    :vars
    (
      ?auto_80514 - BLOCK
      ?auto_80513 - BLOCK
      ?auto_80512 - BLOCK
      ?auto_80515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80514 ?auto_80511 ) ( ON-TABLE ?auto_80509 ) ( ON ?auto_80510 ?auto_80509 ) ( ON ?auto_80511 ?auto_80510 ) ( not ( = ?auto_80509 ?auto_80510 ) ) ( not ( = ?auto_80509 ?auto_80511 ) ) ( not ( = ?auto_80509 ?auto_80514 ) ) ( not ( = ?auto_80510 ?auto_80511 ) ) ( not ( = ?auto_80510 ?auto_80514 ) ) ( not ( = ?auto_80511 ?auto_80514 ) ) ( not ( = ?auto_80509 ?auto_80513 ) ) ( not ( = ?auto_80509 ?auto_80512 ) ) ( not ( = ?auto_80510 ?auto_80513 ) ) ( not ( = ?auto_80510 ?auto_80512 ) ) ( not ( = ?auto_80511 ?auto_80513 ) ) ( not ( = ?auto_80511 ?auto_80512 ) ) ( not ( = ?auto_80514 ?auto_80513 ) ) ( not ( = ?auto_80514 ?auto_80512 ) ) ( not ( = ?auto_80513 ?auto_80512 ) ) ( ON ?auto_80513 ?auto_80514 ) ( CLEAR ?auto_80513 ) ( HOLDING ?auto_80512 ) ( CLEAR ?auto_80515 ) ( ON-TABLE ?auto_80515 ) ( not ( = ?auto_80515 ?auto_80512 ) ) ( not ( = ?auto_80509 ?auto_80515 ) ) ( not ( = ?auto_80510 ?auto_80515 ) ) ( not ( = ?auto_80511 ?auto_80515 ) ) ( not ( = ?auto_80514 ?auto_80515 ) ) ( not ( = ?auto_80513 ?auto_80515 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80515 ?auto_80512 )
      ( MAKE-3PILE ?auto_80509 ?auto_80510 ?auto_80511 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80516 - BLOCK
      ?auto_80517 - BLOCK
      ?auto_80518 - BLOCK
    )
    :vars
    (
      ?auto_80520 - BLOCK
      ?auto_80519 - BLOCK
      ?auto_80521 - BLOCK
      ?auto_80522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80520 ?auto_80518 ) ( ON-TABLE ?auto_80516 ) ( ON ?auto_80517 ?auto_80516 ) ( ON ?auto_80518 ?auto_80517 ) ( not ( = ?auto_80516 ?auto_80517 ) ) ( not ( = ?auto_80516 ?auto_80518 ) ) ( not ( = ?auto_80516 ?auto_80520 ) ) ( not ( = ?auto_80517 ?auto_80518 ) ) ( not ( = ?auto_80517 ?auto_80520 ) ) ( not ( = ?auto_80518 ?auto_80520 ) ) ( not ( = ?auto_80516 ?auto_80519 ) ) ( not ( = ?auto_80516 ?auto_80521 ) ) ( not ( = ?auto_80517 ?auto_80519 ) ) ( not ( = ?auto_80517 ?auto_80521 ) ) ( not ( = ?auto_80518 ?auto_80519 ) ) ( not ( = ?auto_80518 ?auto_80521 ) ) ( not ( = ?auto_80520 ?auto_80519 ) ) ( not ( = ?auto_80520 ?auto_80521 ) ) ( not ( = ?auto_80519 ?auto_80521 ) ) ( ON ?auto_80519 ?auto_80520 ) ( CLEAR ?auto_80522 ) ( ON-TABLE ?auto_80522 ) ( not ( = ?auto_80522 ?auto_80521 ) ) ( not ( = ?auto_80516 ?auto_80522 ) ) ( not ( = ?auto_80517 ?auto_80522 ) ) ( not ( = ?auto_80518 ?auto_80522 ) ) ( not ( = ?auto_80520 ?auto_80522 ) ) ( not ( = ?auto_80519 ?auto_80522 ) ) ( ON ?auto_80521 ?auto_80519 ) ( CLEAR ?auto_80521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80516 ?auto_80517 ?auto_80518 ?auto_80520 ?auto_80519 )
      ( MAKE-3PILE ?auto_80516 ?auto_80517 ?auto_80518 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80523 - BLOCK
      ?auto_80524 - BLOCK
      ?auto_80525 - BLOCK
    )
    :vars
    (
      ?auto_80529 - BLOCK
      ?auto_80527 - BLOCK
      ?auto_80528 - BLOCK
      ?auto_80526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80529 ?auto_80525 ) ( ON-TABLE ?auto_80523 ) ( ON ?auto_80524 ?auto_80523 ) ( ON ?auto_80525 ?auto_80524 ) ( not ( = ?auto_80523 ?auto_80524 ) ) ( not ( = ?auto_80523 ?auto_80525 ) ) ( not ( = ?auto_80523 ?auto_80529 ) ) ( not ( = ?auto_80524 ?auto_80525 ) ) ( not ( = ?auto_80524 ?auto_80529 ) ) ( not ( = ?auto_80525 ?auto_80529 ) ) ( not ( = ?auto_80523 ?auto_80527 ) ) ( not ( = ?auto_80523 ?auto_80528 ) ) ( not ( = ?auto_80524 ?auto_80527 ) ) ( not ( = ?auto_80524 ?auto_80528 ) ) ( not ( = ?auto_80525 ?auto_80527 ) ) ( not ( = ?auto_80525 ?auto_80528 ) ) ( not ( = ?auto_80529 ?auto_80527 ) ) ( not ( = ?auto_80529 ?auto_80528 ) ) ( not ( = ?auto_80527 ?auto_80528 ) ) ( ON ?auto_80527 ?auto_80529 ) ( not ( = ?auto_80526 ?auto_80528 ) ) ( not ( = ?auto_80523 ?auto_80526 ) ) ( not ( = ?auto_80524 ?auto_80526 ) ) ( not ( = ?auto_80525 ?auto_80526 ) ) ( not ( = ?auto_80529 ?auto_80526 ) ) ( not ( = ?auto_80527 ?auto_80526 ) ) ( ON ?auto_80528 ?auto_80527 ) ( CLEAR ?auto_80528 ) ( HOLDING ?auto_80526 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80526 )
      ( MAKE-3PILE ?auto_80523 ?auto_80524 ?auto_80525 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80540 - BLOCK
      ?auto_80541 - BLOCK
      ?auto_80542 - BLOCK
    )
    :vars
    (
      ?auto_80544 - BLOCK
      ?auto_80543 - BLOCK
      ?auto_80545 - BLOCK
      ?auto_80546 - BLOCK
      ?auto_80547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80544 ?auto_80542 ) ( ON-TABLE ?auto_80540 ) ( ON ?auto_80541 ?auto_80540 ) ( ON ?auto_80542 ?auto_80541 ) ( not ( = ?auto_80540 ?auto_80541 ) ) ( not ( = ?auto_80540 ?auto_80542 ) ) ( not ( = ?auto_80540 ?auto_80544 ) ) ( not ( = ?auto_80541 ?auto_80542 ) ) ( not ( = ?auto_80541 ?auto_80544 ) ) ( not ( = ?auto_80542 ?auto_80544 ) ) ( not ( = ?auto_80540 ?auto_80543 ) ) ( not ( = ?auto_80540 ?auto_80545 ) ) ( not ( = ?auto_80541 ?auto_80543 ) ) ( not ( = ?auto_80541 ?auto_80545 ) ) ( not ( = ?auto_80542 ?auto_80543 ) ) ( not ( = ?auto_80542 ?auto_80545 ) ) ( not ( = ?auto_80544 ?auto_80543 ) ) ( not ( = ?auto_80544 ?auto_80545 ) ) ( not ( = ?auto_80543 ?auto_80545 ) ) ( ON ?auto_80543 ?auto_80544 ) ( not ( = ?auto_80546 ?auto_80545 ) ) ( not ( = ?auto_80540 ?auto_80546 ) ) ( not ( = ?auto_80541 ?auto_80546 ) ) ( not ( = ?auto_80542 ?auto_80546 ) ) ( not ( = ?auto_80544 ?auto_80546 ) ) ( not ( = ?auto_80543 ?auto_80546 ) ) ( ON ?auto_80545 ?auto_80543 ) ( CLEAR ?auto_80545 ) ( ON ?auto_80546 ?auto_80547 ) ( CLEAR ?auto_80546 ) ( HAND-EMPTY ) ( not ( = ?auto_80540 ?auto_80547 ) ) ( not ( = ?auto_80541 ?auto_80547 ) ) ( not ( = ?auto_80542 ?auto_80547 ) ) ( not ( = ?auto_80544 ?auto_80547 ) ) ( not ( = ?auto_80543 ?auto_80547 ) ) ( not ( = ?auto_80545 ?auto_80547 ) ) ( not ( = ?auto_80546 ?auto_80547 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80546 ?auto_80547 )
      ( MAKE-3PILE ?auto_80540 ?auto_80541 ?auto_80542 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_80548 - BLOCK
      ?auto_80549 - BLOCK
      ?auto_80550 - BLOCK
    )
    :vars
    (
      ?auto_80553 - BLOCK
      ?auto_80552 - BLOCK
      ?auto_80554 - BLOCK
      ?auto_80551 - BLOCK
      ?auto_80555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80553 ?auto_80550 ) ( ON-TABLE ?auto_80548 ) ( ON ?auto_80549 ?auto_80548 ) ( ON ?auto_80550 ?auto_80549 ) ( not ( = ?auto_80548 ?auto_80549 ) ) ( not ( = ?auto_80548 ?auto_80550 ) ) ( not ( = ?auto_80548 ?auto_80553 ) ) ( not ( = ?auto_80549 ?auto_80550 ) ) ( not ( = ?auto_80549 ?auto_80553 ) ) ( not ( = ?auto_80550 ?auto_80553 ) ) ( not ( = ?auto_80548 ?auto_80552 ) ) ( not ( = ?auto_80548 ?auto_80554 ) ) ( not ( = ?auto_80549 ?auto_80552 ) ) ( not ( = ?auto_80549 ?auto_80554 ) ) ( not ( = ?auto_80550 ?auto_80552 ) ) ( not ( = ?auto_80550 ?auto_80554 ) ) ( not ( = ?auto_80553 ?auto_80552 ) ) ( not ( = ?auto_80553 ?auto_80554 ) ) ( not ( = ?auto_80552 ?auto_80554 ) ) ( ON ?auto_80552 ?auto_80553 ) ( not ( = ?auto_80551 ?auto_80554 ) ) ( not ( = ?auto_80548 ?auto_80551 ) ) ( not ( = ?auto_80549 ?auto_80551 ) ) ( not ( = ?auto_80550 ?auto_80551 ) ) ( not ( = ?auto_80553 ?auto_80551 ) ) ( not ( = ?auto_80552 ?auto_80551 ) ) ( ON ?auto_80551 ?auto_80555 ) ( CLEAR ?auto_80551 ) ( not ( = ?auto_80548 ?auto_80555 ) ) ( not ( = ?auto_80549 ?auto_80555 ) ) ( not ( = ?auto_80550 ?auto_80555 ) ) ( not ( = ?auto_80553 ?auto_80555 ) ) ( not ( = ?auto_80552 ?auto_80555 ) ) ( not ( = ?auto_80554 ?auto_80555 ) ) ( not ( = ?auto_80551 ?auto_80555 ) ) ( HOLDING ?auto_80554 ) ( CLEAR ?auto_80552 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80548 ?auto_80549 ?auto_80550 ?auto_80553 ?auto_80552 ?auto_80554 )
      ( MAKE-3PILE ?auto_80548 ?auto_80549 ?auto_80550 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80610 - BLOCK
      ?auto_80611 - BLOCK
      ?auto_80612 - BLOCK
      ?auto_80613 - BLOCK
    )
    :vars
    (
      ?auto_80614 - BLOCK
      ?auto_80615 - BLOCK
      ?auto_80616 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80610 ) ( ON ?auto_80611 ?auto_80610 ) ( not ( = ?auto_80610 ?auto_80611 ) ) ( not ( = ?auto_80610 ?auto_80612 ) ) ( not ( = ?auto_80610 ?auto_80613 ) ) ( not ( = ?auto_80611 ?auto_80612 ) ) ( not ( = ?auto_80611 ?auto_80613 ) ) ( not ( = ?auto_80612 ?auto_80613 ) ) ( ON ?auto_80613 ?auto_80614 ) ( not ( = ?auto_80610 ?auto_80614 ) ) ( not ( = ?auto_80611 ?auto_80614 ) ) ( not ( = ?auto_80612 ?auto_80614 ) ) ( not ( = ?auto_80613 ?auto_80614 ) ) ( CLEAR ?auto_80611 ) ( ON ?auto_80612 ?auto_80613 ) ( CLEAR ?auto_80612 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80615 ) ( ON ?auto_80616 ?auto_80615 ) ( ON ?auto_80614 ?auto_80616 ) ( not ( = ?auto_80615 ?auto_80616 ) ) ( not ( = ?auto_80615 ?auto_80614 ) ) ( not ( = ?auto_80615 ?auto_80613 ) ) ( not ( = ?auto_80615 ?auto_80612 ) ) ( not ( = ?auto_80616 ?auto_80614 ) ) ( not ( = ?auto_80616 ?auto_80613 ) ) ( not ( = ?auto_80616 ?auto_80612 ) ) ( not ( = ?auto_80610 ?auto_80615 ) ) ( not ( = ?auto_80610 ?auto_80616 ) ) ( not ( = ?auto_80611 ?auto_80615 ) ) ( not ( = ?auto_80611 ?auto_80616 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80615 ?auto_80616 ?auto_80614 ?auto_80613 )
      ( MAKE-4PILE ?auto_80610 ?auto_80611 ?auto_80612 ?auto_80613 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80617 - BLOCK
      ?auto_80618 - BLOCK
      ?auto_80619 - BLOCK
      ?auto_80620 - BLOCK
    )
    :vars
    (
      ?auto_80621 - BLOCK
      ?auto_80622 - BLOCK
      ?auto_80623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80617 ) ( not ( = ?auto_80617 ?auto_80618 ) ) ( not ( = ?auto_80617 ?auto_80619 ) ) ( not ( = ?auto_80617 ?auto_80620 ) ) ( not ( = ?auto_80618 ?auto_80619 ) ) ( not ( = ?auto_80618 ?auto_80620 ) ) ( not ( = ?auto_80619 ?auto_80620 ) ) ( ON ?auto_80620 ?auto_80621 ) ( not ( = ?auto_80617 ?auto_80621 ) ) ( not ( = ?auto_80618 ?auto_80621 ) ) ( not ( = ?auto_80619 ?auto_80621 ) ) ( not ( = ?auto_80620 ?auto_80621 ) ) ( ON ?auto_80619 ?auto_80620 ) ( CLEAR ?auto_80619 ) ( ON-TABLE ?auto_80622 ) ( ON ?auto_80623 ?auto_80622 ) ( ON ?auto_80621 ?auto_80623 ) ( not ( = ?auto_80622 ?auto_80623 ) ) ( not ( = ?auto_80622 ?auto_80621 ) ) ( not ( = ?auto_80622 ?auto_80620 ) ) ( not ( = ?auto_80622 ?auto_80619 ) ) ( not ( = ?auto_80623 ?auto_80621 ) ) ( not ( = ?auto_80623 ?auto_80620 ) ) ( not ( = ?auto_80623 ?auto_80619 ) ) ( not ( = ?auto_80617 ?auto_80622 ) ) ( not ( = ?auto_80617 ?auto_80623 ) ) ( not ( = ?auto_80618 ?auto_80622 ) ) ( not ( = ?auto_80618 ?auto_80623 ) ) ( HOLDING ?auto_80618 ) ( CLEAR ?auto_80617 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80617 ?auto_80618 )
      ( MAKE-4PILE ?auto_80617 ?auto_80618 ?auto_80619 ?auto_80620 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80624 - BLOCK
      ?auto_80625 - BLOCK
      ?auto_80626 - BLOCK
      ?auto_80627 - BLOCK
    )
    :vars
    (
      ?auto_80630 - BLOCK
      ?auto_80629 - BLOCK
      ?auto_80628 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80624 ) ( not ( = ?auto_80624 ?auto_80625 ) ) ( not ( = ?auto_80624 ?auto_80626 ) ) ( not ( = ?auto_80624 ?auto_80627 ) ) ( not ( = ?auto_80625 ?auto_80626 ) ) ( not ( = ?auto_80625 ?auto_80627 ) ) ( not ( = ?auto_80626 ?auto_80627 ) ) ( ON ?auto_80627 ?auto_80630 ) ( not ( = ?auto_80624 ?auto_80630 ) ) ( not ( = ?auto_80625 ?auto_80630 ) ) ( not ( = ?auto_80626 ?auto_80630 ) ) ( not ( = ?auto_80627 ?auto_80630 ) ) ( ON ?auto_80626 ?auto_80627 ) ( ON-TABLE ?auto_80629 ) ( ON ?auto_80628 ?auto_80629 ) ( ON ?auto_80630 ?auto_80628 ) ( not ( = ?auto_80629 ?auto_80628 ) ) ( not ( = ?auto_80629 ?auto_80630 ) ) ( not ( = ?auto_80629 ?auto_80627 ) ) ( not ( = ?auto_80629 ?auto_80626 ) ) ( not ( = ?auto_80628 ?auto_80630 ) ) ( not ( = ?auto_80628 ?auto_80627 ) ) ( not ( = ?auto_80628 ?auto_80626 ) ) ( not ( = ?auto_80624 ?auto_80629 ) ) ( not ( = ?auto_80624 ?auto_80628 ) ) ( not ( = ?auto_80625 ?auto_80629 ) ) ( not ( = ?auto_80625 ?auto_80628 ) ) ( CLEAR ?auto_80624 ) ( ON ?auto_80625 ?auto_80626 ) ( CLEAR ?auto_80625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80629 ?auto_80628 ?auto_80630 ?auto_80627 ?auto_80626 )
      ( MAKE-4PILE ?auto_80624 ?auto_80625 ?auto_80626 ?auto_80627 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80631 - BLOCK
      ?auto_80632 - BLOCK
      ?auto_80633 - BLOCK
      ?auto_80634 - BLOCK
    )
    :vars
    (
      ?auto_80635 - BLOCK
      ?auto_80637 - BLOCK
      ?auto_80636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80631 ?auto_80632 ) ) ( not ( = ?auto_80631 ?auto_80633 ) ) ( not ( = ?auto_80631 ?auto_80634 ) ) ( not ( = ?auto_80632 ?auto_80633 ) ) ( not ( = ?auto_80632 ?auto_80634 ) ) ( not ( = ?auto_80633 ?auto_80634 ) ) ( ON ?auto_80634 ?auto_80635 ) ( not ( = ?auto_80631 ?auto_80635 ) ) ( not ( = ?auto_80632 ?auto_80635 ) ) ( not ( = ?auto_80633 ?auto_80635 ) ) ( not ( = ?auto_80634 ?auto_80635 ) ) ( ON ?auto_80633 ?auto_80634 ) ( ON-TABLE ?auto_80637 ) ( ON ?auto_80636 ?auto_80637 ) ( ON ?auto_80635 ?auto_80636 ) ( not ( = ?auto_80637 ?auto_80636 ) ) ( not ( = ?auto_80637 ?auto_80635 ) ) ( not ( = ?auto_80637 ?auto_80634 ) ) ( not ( = ?auto_80637 ?auto_80633 ) ) ( not ( = ?auto_80636 ?auto_80635 ) ) ( not ( = ?auto_80636 ?auto_80634 ) ) ( not ( = ?auto_80636 ?auto_80633 ) ) ( not ( = ?auto_80631 ?auto_80637 ) ) ( not ( = ?auto_80631 ?auto_80636 ) ) ( not ( = ?auto_80632 ?auto_80637 ) ) ( not ( = ?auto_80632 ?auto_80636 ) ) ( ON ?auto_80632 ?auto_80633 ) ( CLEAR ?auto_80632 ) ( HOLDING ?auto_80631 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80631 )
      ( MAKE-4PILE ?auto_80631 ?auto_80632 ?auto_80633 ?auto_80634 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80638 - BLOCK
      ?auto_80639 - BLOCK
      ?auto_80640 - BLOCK
      ?auto_80641 - BLOCK
    )
    :vars
    (
      ?auto_80643 - BLOCK
      ?auto_80644 - BLOCK
      ?auto_80642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80638 ?auto_80639 ) ) ( not ( = ?auto_80638 ?auto_80640 ) ) ( not ( = ?auto_80638 ?auto_80641 ) ) ( not ( = ?auto_80639 ?auto_80640 ) ) ( not ( = ?auto_80639 ?auto_80641 ) ) ( not ( = ?auto_80640 ?auto_80641 ) ) ( ON ?auto_80641 ?auto_80643 ) ( not ( = ?auto_80638 ?auto_80643 ) ) ( not ( = ?auto_80639 ?auto_80643 ) ) ( not ( = ?auto_80640 ?auto_80643 ) ) ( not ( = ?auto_80641 ?auto_80643 ) ) ( ON ?auto_80640 ?auto_80641 ) ( ON-TABLE ?auto_80644 ) ( ON ?auto_80642 ?auto_80644 ) ( ON ?auto_80643 ?auto_80642 ) ( not ( = ?auto_80644 ?auto_80642 ) ) ( not ( = ?auto_80644 ?auto_80643 ) ) ( not ( = ?auto_80644 ?auto_80641 ) ) ( not ( = ?auto_80644 ?auto_80640 ) ) ( not ( = ?auto_80642 ?auto_80643 ) ) ( not ( = ?auto_80642 ?auto_80641 ) ) ( not ( = ?auto_80642 ?auto_80640 ) ) ( not ( = ?auto_80638 ?auto_80644 ) ) ( not ( = ?auto_80638 ?auto_80642 ) ) ( not ( = ?auto_80639 ?auto_80644 ) ) ( not ( = ?auto_80639 ?auto_80642 ) ) ( ON ?auto_80639 ?auto_80640 ) ( ON ?auto_80638 ?auto_80639 ) ( CLEAR ?auto_80638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80644 ?auto_80642 ?auto_80643 ?auto_80641 ?auto_80640 ?auto_80639 )
      ( MAKE-4PILE ?auto_80638 ?auto_80639 ?auto_80640 ?auto_80641 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80649 - BLOCK
      ?auto_80650 - BLOCK
      ?auto_80651 - BLOCK
      ?auto_80652 - BLOCK
    )
    :vars
    (
      ?auto_80654 - BLOCK
      ?auto_80655 - BLOCK
      ?auto_80653 - BLOCK
      ?auto_80656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80649 ?auto_80650 ) ) ( not ( = ?auto_80649 ?auto_80651 ) ) ( not ( = ?auto_80649 ?auto_80652 ) ) ( not ( = ?auto_80650 ?auto_80651 ) ) ( not ( = ?auto_80650 ?auto_80652 ) ) ( not ( = ?auto_80651 ?auto_80652 ) ) ( ON ?auto_80652 ?auto_80654 ) ( not ( = ?auto_80649 ?auto_80654 ) ) ( not ( = ?auto_80650 ?auto_80654 ) ) ( not ( = ?auto_80651 ?auto_80654 ) ) ( not ( = ?auto_80652 ?auto_80654 ) ) ( ON ?auto_80651 ?auto_80652 ) ( ON-TABLE ?auto_80655 ) ( ON ?auto_80653 ?auto_80655 ) ( ON ?auto_80654 ?auto_80653 ) ( not ( = ?auto_80655 ?auto_80653 ) ) ( not ( = ?auto_80655 ?auto_80654 ) ) ( not ( = ?auto_80655 ?auto_80652 ) ) ( not ( = ?auto_80655 ?auto_80651 ) ) ( not ( = ?auto_80653 ?auto_80654 ) ) ( not ( = ?auto_80653 ?auto_80652 ) ) ( not ( = ?auto_80653 ?auto_80651 ) ) ( not ( = ?auto_80649 ?auto_80655 ) ) ( not ( = ?auto_80649 ?auto_80653 ) ) ( not ( = ?auto_80650 ?auto_80655 ) ) ( not ( = ?auto_80650 ?auto_80653 ) ) ( ON ?auto_80650 ?auto_80651 ) ( CLEAR ?auto_80650 ) ( ON ?auto_80649 ?auto_80656 ) ( CLEAR ?auto_80649 ) ( HAND-EMPTY ) ( not ( = ?auto_80649 ?auto_80656 ) ) ( not ( = ?auto_80650 ?auto_80656 ) ) ( not ( = ?auto_80651 ?auto_80656 ) ) ( not ( = ?auto_80652 ?auto_80656 ) ) ( not ( = ?auto_80654 ?auto_80656 ) ) ( not ( = ?auto_80655 ?auto_80656 ) ) ( not ( = ?auto_80653 ?auto_80656 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80649 ?auto_80656 )
      ( MAKE-4PILE ?auto_80649 ?auto_80650 ?auto_80651 ?auto_80652 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80657 - BLOCK
      ?auto_80658 - BLOCK
      ?auto_80659 - BLOCK
      ?auto_80660 - BLOCK
    )
    :vars
    (
      ?auto_80663 - BLOCK
      ?auto_80662 - BLOCK
      ?auto_80664 - BLOCK
      ?auto_80661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80657 ?auto_80658 ) ) ( not ( = ?auto_80657 ?auto_80659 ) ) ( not ( = ?auto_80657 ?auto_80660 ) ) ( not ( = ?auto_80658 ?auto_80659 ) ) ( not ( = ?auto_80658 ?auto_80660 ) ) ( not ( = ?auto_80659 ?auto_80660 ) ) ( ON ?auto_80660 ?auto_80663 ) ( not ( = ?auto_80657 ?auto_80663 ) ) ( not ( = ?auto_80658 ?auto_80663 ) ) ( not ( = ?auto_80659 ?auto_80663 ) ) ( not ( = ?auto_80660 ?auto_80663 ) ) ( ON ?auto_80659 ?auto_80660 ) ( ON-TABLE ?auto_80662 ) ( ON ?auto_80664 ?auto_80662 ) ( ON ?auto_80663 ?auto_80664 ) ( not ( = ?auto_80662 ?auto_80664 ) ) ( not ( = ?auto_80662 ?auto_80663 ) ) ( not ( = ?auto_80662 ?auto_80660 ) ) ( not ( = ?auto_80662 ?auto_80659 ) ) ( not ( = ?auto_80664 ?auto_80663 ) ) ( not ( = ?auto_80664 ?auto_80660 ) ) ( not ( = ?auto_80664 ?auto_80659 ) ) ( not ( = ?auto_80657 ?auto_80662 ) ) ( not ( = ?auto_80657 ?auto_80664 ) ) ( not ( = ?auto_80658 ?auto_80662 ) ) ( not ( = ?auto_80658 ?auto_80664 ) ) ( ON ?auto_80657 ?auto_80661 ) ( CLEAR ?auto_80657 ) ( not ( = ?auto_80657 ?auto_80661 ) ) ( not ( = ?auto_80658 ?auto_80661 ) ) ( not ( = ?auto_80659 ?auto_80661 ) ) ( not ( = ?auto_80660 ?auto_80661 ) ) ( not ( = ?auto_80663 ?auto_80661 ) ) ( not ( = ?auto_80662 ?auto_80661 ) ) ( not ( = ?auto_80664 ?auto_80661 ) ) ( HOLDING ?auto_80658 ) ( CLEAR ?auto_80659 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80662 ?auto_80664 ?auto_80663 ?auto_80660 ?auto_80659 ?auto_80658 )
      ( MAKE-4PILE ?auto_80657 ?auto_80658 ?auto_80659 ?auto_80660 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80665 - BLOCK
      ?auto_80666 - BLOCK
      ?auto_80667 - BLOCK
      ?auto_80668 - BLOCK
    )
    :vars
    (
      ?auto_80671 - BLOCK
      ?auto_80670 - BLOCK
      ?auto_80672 - BLOCK
      ?auto_80669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80665 ?auto_80666 ) ) ( not ( = ?auto_80665 ?auto_80667 ) ) ( not ( = ?auto_80665 ?auto_80668 ) ) ( not ( = ?auto_80666 ?auto_80667 ) ) ( not ( = ?auto_80666 ?auto_80668 ) ) ( not ( = ?auto_80667 ?auto_80668 ) ) ( ON ?auto_80668 ?auto_80671 ) ( not ( = ?auto_80665 ?auto_80671 ) ) ( not ( = ?auto_80666 ?auto_80671 ) ) ( not ( = ?auto_80667 ?auto_80671 ) ) ( not ( = ?auto_80668 ?auto_80671 ) ) ( ON ?auto_80667 ?auto_80668 ) ( ON-TABLE ?auto_80670 ) ( ON ?auto_80672 ?auto_80670 ) ( ON ?auto_80671 ?auto_80672 ) ( not ( = ?auto_80670 ?auto_80672 ) ) ( not ( = ?auto_80670 ?auto_80671 ) ) ( not ( = ?auto_80670 ?auto_80668 ) ) ( not ( = ?auto_80670 ?auto_80667 ) ) ( not ( = ?auto_80672 ?auto_80671 ) ) ( not ( = ?auto_80672 ?auto_80668 ) ) ( not ( = ?auto_80672 ?auto_80667 ) ) ( not ( = ?auto_80665 ?auto_80670 ) ) ( not ( = ?auto_80665 ?auto_80672 ) ) ( not ( = ?auto_80666 ?auto_80670 ) ) ( not ( = ?auto_80666 ?auto_80672 ) ) ( ON ?auto_80665 ?auto_80669 ) ( not ( = ?auto_80665 ?auto_80669 ) ) ( not ( = ?auto_80666 ?auto_80669 ) ) ( not ( = ?auto_80667 ?auto_80669 ) ) ( not ( = ?auto_80668 ?auto_80669 ) ) ( not ( = ?auto_80671 ?auto_80669 ) ) ( not ( = ?auto_80670 ?auto_80669 ) ) ( not ( = ?auto_80672 ?auto_80669 ) ) ( CLEAR ?auto_80667 ) ( ON ?auto_80666 ?auto_80665 ) ( CLEAR ?auto_80666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80669 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80669 ?auto_80665 )
      ( MAKE-4PILE ?auto_80665 ?auto_80666 ?auto_80667 ?auto_80668 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80673 - BLOCK
      ?auto_80674 - BLOCK
      ?auto_80675 - BLOCK
      ?auto_80676 - BLOCK
    )
    :vars
    (
      ?auto_80678 - BLOCK
      ?auto_80680 - BLOCK
      ?auto_80679 - BLOCK
      ?auto_80677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80673 ?auto_80674 ) ) ( not ( = ?auto_80673 ?auto_80675 ) ) ( not ( = ?auto_80673 ?auto_80676 ) ) ( not ( = ?auto_80674 ?auto_80675 ) ) ( not ( = ?auto_80674 ?auto_80676 ) ) ( not ( = ?auto_80675 ?auto_80676 ) ) ( ON ?auto_80676 ?auto_80678 ) ( not ( = ?auto_80673 ?auto_80678 ) ) ( not ( = ?auto_80674 ?auto_80678 ) ) ( not ( = ?auto_80675 ?auto_80678 ) ) ( not ( = ?auto_80676 ?auto_80678 ) ) ( ON-TABLE ?auto_80680 ) ( ON ?auto_80679 ?auto_80680 ) ( ON ?auto_80678 ?auto_80679 ) ( not ( = ?auto_80680 ?auto_80679 ) ) ( not ( = ?auto_80680 ?auto_80678 ) ) ( not ( = ?auto_80680 ?auto_80676 ) ) ( not ( = ?auto_80680 ?auto_80675 ) ) ( not ( = ?auto_80679 ?auto_80678 ) ) ( not ( = ?auto_80679 ?auto_80676 ) ) ( not ( = ?auto_80679 ?auto_80675 ) ) ( not ( = ?auto_80673 ?auto_80680 ) ) ( not ( = ?auto_80673 ?auto_80679 ) ) ( not ( = ?auto_80674 ?auto_80680 ) ) ( not ( = ?auto_80674 ?auto_80679 ) ) ( ON ?auto_80673 ?auto_80677 ) ( not ( = ?auto_80673 ?auto_80677 ) ) ( not ( = ?auto_80674 ?auto_80677 ) ) ( not ( = ?auto_80675 ?auto_80677 ) ) ( not ( = ?auto_80676 ?auto_80677 ) ) ( not ( = ?auto_80678 ?auto_80677 ) ) ( not ( = ?auto_80680 ?auto_80677 ) ) ( not ( = ?auto_80679 ?auto_80677 ) ) ( ON ?auto_80674 ?auto_80673 ) ( CLEAR ?auto_80674 ) ( ON-TABLE ?auto_80677 ) ( HOLDING ?auto_80675 ) ( CLEAR ?auto_80676 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80680 ?auto_80679 ?auto_80678 ?auto_80676 ?auto_80675 )
      ( MAKE-4PILE ?auto_80673 ?auto_80674 ?auto_80675 ?auto_80676 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80681 - BLOCK
      ?auto_80682 - BLOCK
      ?auto_80683 - BLOCK
      ?auto_80684 - BLOCK
    )
    :vars
    (
      ?auto_80685 - BLOCK
      ?auto_80687 - BLOCK
      ?auto_80686 - BLOCK
      ?auto_80688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80681 ?auto_80682 ) ) ( not ( = ?auto_80681 ?auto_80683 ) ) ( not ( = ?auto_80681 ?auto_80684 ) ) ( not ( = ?auto_80682 ?auto_80683 ) ) ( not ( = ?auto_80682 ?auto_80684 ) ) ( not ( = ?auto_80683 ?auto_80684 ) ) ( ON ?auto_80684 ?auto_80685 ) ( not ( = ?auto_80681 ?auto_80685 ) ) ( not ( = ?auto_80682 ?auto_80685 ) ) ( not ( = ?auto_80683 ?auto_80685 ) ) ( not ( = ?auto_80684 ?auto_80685 ) ) ( ON-TABLE ?auto_80687 ) ( ON ?auto_80686 ?auto_80687 ) ( ON ?auto_80685 ?auto_80686 ) ( not ( = ?auto_80687 ?auto_80686 ) ) ( not ( = ?auto_80687 ?auto_80685 ) ) ( not ( = ?auto_80687 ?auto_80684 ) ) ( not ( = ?auto_80687 ?auto_80683 ) ) ( not ( = ?auto_80686 ?auto_80685 ) ) ( not ( = ?auto_80686 ?auto_80684 ) ) ( not ( = ?auto_80686 ?auto_80683 ) ) ( not ( = ?auto_80681 ?auto_80687 ) ) ( not ( = ?auto_80681 ?auto_80686 ) ) ( not ( = ?auto_80682 ?auto_80687 ) ) ( not ( = ?auto_80682 ?auto_80686 ) ) ( ON ?auto_80681 ?auto_80688 ) ( not ( = ?auto_80681 ?auto_80688 ) ) ( not ( = ?auto_80682 ?auto_80688 ) ) ( not ( = ?auto_80683 ?auto_80688 ) ) ( not ( = ?auto_80684 ?auto_80688 ) ) ( not ( = ?auto_80685 ?auto_80688 ) ) ( not ( = ?auto_80687 ?auto_80688 ) ) ( not ( = ?auto_80686 ?auto_80688 ) ) ( ON ?auto_80682 ?auto_80681 ) ( ON-TABLE ?auto_80688 ) ( CLEAR ?auto_80684 ) ( ON ?auto_80683 ?auto_80682 ) ( CLEAR ?auto_80683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80688 ?auto_80681 ?auto_80682 )
      ( MAKE-4PILE ?auto_80681 ?auto_80682 ?auto_80683 ?auto_80684 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80689 - BLOCK
      ?auto_80690 - BLOCK
      ?auto_80691 - BLOCK
      ?auto_80692 - BLOCK
    )
    :vars
    (
      ?auto_80695 - BLOCK
      ?auto_80694 - BLOCK
      ?auto_80696 - BLOCK
      ?auto_80693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80689 ?auto_80690 ) ) ( not ( = ?auto_80689 ?auto_80691 ) ) ( not ( = ?auto_80689 ?auto_80692 ) ) ( not ( = ?auto_80690 ?auto_80691 ) ) ( not ( = ?auto_80690 ?auto_80692 ) ) ( not ( = ?auto_80691 ?auto_80692 ) ) ( not ( = ?auto_80689 ?auto_80695 ) ) ( not ( = ?auto_80690 ?auto_80695 ) ) ( not ( = ?auto_80691 ?auto_80695 ) ) ( not ( = ?auto_80692 ?auto_80695 ) ) ( ON-TABLE ?auto_80694 ) ( ON ?auto_80696 ?auto_80694 ) ( ON ?auto_80695 ?auto_80696 ) ( not ( = ?auto_80694 ?auto_80696 ) ) ( not ( = ?auto_80694 ?auto_80695 ) ) ( not ( = ?auto_80694 ?auto_80692 ) ) ( not ( = ?auto_80694 ?auto_80691 ) ) ( not ( = ?auto_80696 ?auto_80695 ) ) ( not ( = ?auto_80696 ?auto_80692 ) ) ( not ( = ?auto_80696 ?auto_80691 ) ) ( not ( = ?auto_80689 ?auto_80694 ) ) ( not ( = ?auto_80689 ?auto_80696 ) ) ( not ( = ?auto_80690 ?auto_80694 ) ) ( not ( = ?auto_80690 ?auto_80696 ) ) ( ON ?auto_80689 ?auto_80693 ) ( not ( = ?auto_80689 ?auto_80693 ) ) ( not ( = ?auto_80690 ?auto_80693 ) ) ( not ( = ?auto_80691 ?auto_80693 ) ) ( not ( = ?auto_80692 ?auto_80693 ) ) ( not ( = ?auto_80695 ?auto_80693 ) ) ( not ( = ?auto_80694 ?auto_80693 ) ) ( not ( = ?auto_80696 ?auto_80693 ) ) ( ON ?auto_80690 ?auto_80689 ) ( ON-TABLE ?auto_80693 ) ( ON ?auto_80691 ?auto_80690 ) ( CLEAR ?auto_80691 ) ( HOLDING ?auto_80692 ) ( CLEAR ?auto_80695 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80694 ?auto_80696 ?auto_80695 ?auto_80692 )
      ( MAKE-4PILE ?auto_80689 ?auto_80690 ?auto_80691 ?auto_80692 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80697 - BLOCK
      ?auto_80698 - BLOCK
      ?auto_80699 - BLOCK
      ?auto_80700 - BLOCK
    )
    :vars
    (
      ?auto_80702 - BLOCK
      ?auto_80703 - BLOCK
      ?auto_80704 - BLOCK
      ?auto_80701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80697 ?auto_80698 ) ) ( not ( = ?auto_80697 ?auto_80699 ) ) ( not ( = ?auto_80697 ?auto_80700 ) ) ( not ( = ?auto_80698 ?auto_80699 ) ) ( not ( = ?auto_80698 ?auto_80700 ) ) ( not ( = ?auto_80699 ?auto_80700 ) ) ( not ( = ?auto_80697 ?auto_80702 ) ) ( not ( = ?auto_80698 ?auto_80702 ) ) ( not ( = ?auto_80699 ?auto_80702 ) ) ( not ( = ?auto_80700 ?auto_80702 ) ) ( ON-TABLE ?auto_80703 ) ( ON ?auto_80704 ?auto_80703 ) ( ON ?auto_80702 ?auto_80704 ) ( not ( = ?auto_80703 ?auto_80704 ) ) ( not ( = ?auto_80703 ?auto_80702 ) ) ( not ( = ?auto_80703 ?auto_80700 ) ) ( not ( = ?auto_80703 ?auto_80699 ) ) ( not ( = ?auto_80704 ?auto_80702 ) ) ( not ( = ?auto_80704 ?auto_80700 ) ) ( not ( = ?auto_80704 ?auto_80699 ) ) ( not ( = ?auto_80697 ?auto_80703 ) ) ( not ( = ?auto_80697 ?auto_80704 ) ) ( not ( = ?auto_80698 ?auto_80703 ) ) ( not ( = ?auto_80698 ?auto_80704 ) ) ( ON ?auto_80697 ?auto_80701 ) ( not ( = ?auto_80697 ?auto_80701 ) ) ( not ( = ?auto_80698 ?auto_80701 ) ) ( not ( = ?auto_80699 ?auto_80701 ) ) ( not ( = ?auto_80700 ?auto_80701 ) ) ( not ( = ?auto_80702 ?auto_80701 ) ) ( not ( = ?auto_80703 ?auto_80701 ) ) ( not ( = ?auto_80704 ?auto_80701 ) ) ( ON ?auto_80698 ?auto_80697 ) ( ON-TABLE ?auto_80701 ) ( ON ?auto_80699 ?auto_80698 ) ( CLEAR ?auto_80702 ) ( ON ?auto_80700 ?auto_80699 ) ( CLEAR ?auto_80700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80701 ?auto_80697 ?auto_80698 ?auto_80699 )
      ( MAKE-4PILE ?auto_80697 ?auto_80698 ?auto_80699 ?auto_80700 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80705 - BLOCK
      ?auto_80706 - BLOCK
      ?auto_80707 - BLOCK
      ?auto_80708 - BLOCK
    )
    :vars
    (
      ?auto_80712 - BLOCK
      ?auto_80710 - BLOCK
      ?auto_80709 - BLOCK
      ?auto_80711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80705 ?auto_80706 ) ) ( not ( = ?auto_80705 ?auto_80707 ) ) ( not ( = ?auto_80705 ?auto_80708 ) ) ( not ( = ?auto_80706 ?auto_80707 ) ) ( not ( = ?auto_80706 ?auto_80708 ) ) ( not ( = ?auto_80707 ?auto_80708 ) ) ( not ( = ?auto_80705 ?auto_80712 ) ) ( not ( = ?auto_80706 ?auto_80712 ) ) ( not ( = ?auto_80707 ?auto_80712 ) ) ( not ( = ?auto_80708 ?auto_80712 ) ) ( ON-TABLE ?auto_80710 ) ( ON ?auto_80709 ?auto_80710 ) ( not ( = ?auto_80710 ?auto_80709 ) ) ( not ( = ?auto_80710 ?auto_80712 ) ) ( not ( = ?auto_80710 ?auto_80708 ) ) ( not ( = ?auto_80710 ?auto_80707 ) ) ( not ( = ?auto_80709 ?auto_80712 ) ) ( not ( = ?auto_80709 ?auto_80708 ) ) ( not ( = ?auto_80709 ?auto_80707 ) ) ( not ( = ?auto_80705 ?auto_80710 ) ) ( not ( = ?auto_80705 ?auto_80709 ) ) ( not ( = ?auto_80706 ?auto_80710 ) ) ( not ( = ?auto_80706 ?auto_80709 ) ) ( ON ?auto_80705 ?auto_80711 ) ( not ( = ?auto_80705 ?auto_80711 ) ) ( not ( = ?auto_80706 ?auto_80711 ) ) ( not ( = ?auto_80707 ?auto_80711 ) ) ( not ( = ?auto_80708 ?auto_80711 ) ) ( not ( = ?auto_80712 ?auto_80711 ) ) ( not ( = ?auto_80710 ?auto_80711 ) ) ( not ( = ?auto_80709 ?auto_80711 ) ) ( ON ?auto_80706 ?auto_80705 ) ( ON-TABLE ?auto_80711 ) ( ON ?auto_80707 ?auto_80706 ) ( ON ?auto_80708 ?auto_80707 ) ( CLEAR ?auto_80708 ) ( HOLDING ?auto_80712 ) ( CLEAR ?auto_80709 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80710 ?auto_80709 ?auto_80712 )
      ( MAKE-4PILE ?auto_80705 ?auto_80706 ?auto_80707 ?auto_80708 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80713 - BLOCK
      ?auto_80714 - BLOCK
      ?auto_80715 - BLOCK
      ?auto_80716 - BLOCK
    )
    :vars
    (
      ?auto_80718 - BLOCK
      ?auto_80720 - BLOCK
      ?auto_80717 - BLOCK
      ?auto_80719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80713 ?auto_80714 ) ) ( not ( = ?auto_80713 ?auto_80715 ) ) ( not ( = ?auto_80713 ?auto_80716 ) ) ( not ( = ?auto_80714 ?auto_80715 ) ) ( not ( = ?auto_80714 ?auto_80716 ) ) ( not ( = ?auto_80715 ?auto_80716 ) ) ( not ( = ?auto_80713 ?auto_80718 ) ) ( not ( = ?auto_80714 ?auto_80718 ) ) ( not ( = ?auto_80715 ?auto_80718 ) ) ( not ( = ?auto_80716 ?auto_80718 ) ) ( ON-TABLE ?auto_80720 ) ( ON ?auto_80717 ?auto_80720 ) ( not ( = ?auto_80720 ?auto_80717 ) ) ( not ( = ?auto_80720 ?auto_80718 ) ) ( not ( = ?auto_80720 ?auto_80716 ) ) ( not ( = ?auto_80720 ?auto_80715 ) ) ( not ( = ?auto_80717 ?auto_80718 ) ) ( not ( = ?auto_80717 ?auto_80716 ) ) ( not ( = ?auto_80717 ?auto_80715 ) ) ( not ( = ?auto_80713 ?auto_80720 ) ) ( not ( = ?auto_80713 ?auto_80717 ) ) ( not ( = ?auto_80714 ?auto_80720 ) ) ( not ( = ?auto_80714 ?auto_80717 ) ) ( ON ?auto_80713 ?auto_80719 ) ( not ( = ?auto_80713 ?auto_80719 ) ) ( not ( = ?auto_80714 ?auto_80719 ) ) ( not ( = ?auto_80715 ?auto_80719 ) ) ( not ( = ?auto_80716 ?auto_80719 ) ) ( not ( = ?auto_80718 ?auto_80719 ) ) ( not ( = ?auto_80720 ?auto_80719 ) ) ( not ( = ?auto_80717 ?auto_80719 ) ) ( ON ?auto_80714 ?auto_80713 ) ( ON-TABLE ?auto_80719 ) ( ON ?auto_80715 ?auto_80714 ) ( ON ?auto_80716 ?auto_80715 ) ( CLEAR ?auto_80717 ) ( ON ?auto_80718 ?auto_80716 ) ( CLEAR ?auto_80718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80719 ?auto_80713 ?auto_80714 ?auto_80715 ?auto_80716 )
      ( MAKE-4PILE ?auto_80713 ?auto_80714 ?auto_80715 ?auto_80716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80721 - BLOCK
      ?auto_80722 - BLOCK
      ?auto_80723 - BLOCK
      ?auto_80724 - BLOCK
    )
    :vars
    (
      ?auto_80727 - BLOCK
      ?auto_80726 - BLOCK
      ?auto_80725 - BLOCK
      ?auto_80728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80721 ?auto_80722 ) ) ( not ( = ?auto_80721 ?auto_80723 ) ) ( not ( = ?auto_80721 ?auto_80724 ) ) ( not ( = ?auto_80722 ?auto_80723 ) ) ( not ( = ?auto_80722 ?auto_80724 ) ) ( not ( = ?auto_80723 ?auto_80724 ) ) ( not ( = ?auto_80721 ?auto_80727 ) ) ( not ( = ?auto_80722 ?auto_80727 ) ) ( not ( = ?auto_80723 ?auto_80727 ) ) ( not ( = ?auto_80724 ?auto_80727 ) ) ( ON-TABLE ?auto_80726 ) ( not ( = ?auto_80726 ?auto_80725 ) ) ( not ( = ?auto_80726 ?auto_80727 ) ) ( not ( = ?auto_80726 ?auto_80724 ) ) ( not ( = ?auto_80726 ?auto_80723 ) ) ( not ( = ?auto_80725 ?auto_80727 ) ) ( not ( = ?auto_80725 ?auto_80724 ) ) ( not ( = ?auto_80725 ?auto_80723 ) ) ( not ( = ?auto_80721 ?auto_80726 ) ) ( not ( = ?auto_80721 ?auto_80725 ) ) ( not ( = ?auto_80722 ?auto_80726 ) ) ( not ( = ?auto_80722 ?auto_80725 ) ) ( ON ?auto_80721 ?auto_80728 ) ( not ( = ?auto_80721 ?auto_80728 ) ) ( not ( = ?auto_80722 ?auto_80728 ) ) ( not ( = ?auto_80723 ?auto_80728 ) ) ( not ( = ?auto_80724 ?auto_80728 ) ) ( not ( = ?auto_80727 ?auto_80728 ) ) ( not ( = ?auto_80726 ?auto_80728 ) ) ( not ( = ?auto_80725 ?auto_80728 ) ) ( ON ?auto_80722 ?auto_80721 ) ( ON-TABLE ?auto_80728 ) ( ON ?auto_80723 ?auto_80722 ) ( ON ?auto_80724 ?auto_80723 ) ( ON ?auto_80727 ?auto_80724 ) ( CLEAR ?auto_80727 ) ( HOLDING ?auto_80725 ) ( CLEAR ?auto_80726 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80726 ?auto_80725 )
      ( MAKE-4PILE ?auto_80721 ?auto_80722 ?auto_80723 ?auto_80724 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80729 - BLOCK
      ?auto_80730 - BLOCK
      ?auto_80731 - BLOCK
      ?auto_80732 - BLOCK
    )
    :vars
    (
      ?auto_80736 - BLOCK
      ?auto_80733 - BLOCK
      ?auto_80735 - BLOCK
      ?auto_80734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80729 ?auto_80730 ) ) ( not ( = ?auto_80729 ?auto_80731 ) ) ( not ( = ?auto_80729 ?auto_80732 ) ) ( not ( = ?auto_80730 ?auto_80731 ) ) ( not ( = ?auto_80730 ?auto_80732 ) ) ( not ( = ?auto_80731 ?auto_80732 ) ) ( not ( = ?auto_80729 ?auto_80736 ) ) ( not ( = ?auto_80730 ?auto_80736 ) ) ( not ( = ?auto_80731 ?auto_80736 ) ) ( not ( = ?auto_80732 ?auto_80736 ) ) ( ON-TABLE ?auto_80733 ) ( not ( = ?auto_80733 ?auto_80735 ) ) ( not ( = ?auto_80733 ?auto_80736 ) ) ( not ( = ?auto_80733 ?auto_80732 ) ) ( not ( = ?auto_80733 ?auto_80731 ) ) ( not ( = ?auto_80735 ?auto_80736 ) ) ( not ( = ?auto_80735 ?auto_80732 ) ) ( not ( = ?auto_80735 ?auto_80731 ) ) ( not ( = ?auto_80729 ?auto_80733 ) ) ( not ( = ?auto_80729 ?auto_80735 ) ) ( not ( = ?auto_80730 ?auto_80733 ) ) ( not ( = ?auto_80730 ?auto_80735 ) ) ( ON ?auto_80729 ?auto_80734 ) ( not ( = ?auto_80729 ?auto_80734 ) ) ( not ( = ?auto_80730 ?auto_80734 ) ) ( not ( = ?auto_80731 ?auto_80734 ) ) ( not ( = ?auto_80732 ?auto_80734 ) ) ( not ( = ?auto_80736 ?auto_80734 ) ) ( not ( = ?auto_80733 ?auto_80734 ) ) ( not ( = ?auto_80735 ?auto_80734 ) ) ( ON ?auto_80730 ?auto_80729 ) ( ON-TABLE ?auto_80734 ) ( ON ?auto_80731 ?auto_80730 ) ( ON ?auto_80732 ?auto_80731 ) ( ON ?auto_80736 ?auto_80732 ) ( CLEAR ?auto_80733 ) ( ON ?auto_80735 ?auto_80736 ) ( CLEAR ?auto_80735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80734 ?auto_80729 ?auto_80730 ?auto_80731 ?auto_80732 ?auto_80736 )
      ( MAKE-4PILE ?auto_80729 ?auto_80730 ?auto_80731 ?auto_80732 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80737 - BLOCK
      ?auto_80738 - BLOCK
      ?auto_80739 - BLOCK
      ?auto_80740 - BLOCK
    )
    :vars
    (
      ?auto_80744 - BLOCK
      ?auto_80743 - BLOCK
      ?auto_80742 - BLOCK
      ?auto_80741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80737 ?auto_80738 ) ) ( not ( = ?auto_80737 ?auto_80739 ) ) ( not ( = ?auto_80737 ?auto_80740 ) ) ( not ( = ?auto_80738 ?auto_80739 ) ) ( not ( = ?auto_80738 ?auto_80740 ) ) ( not ( = ?auto_80739 ?auto_80740 ) ) ( not ( = ?auto_80737 ?auto_80744 ) ) ( not ( = ?auto_80738 ?auto_80744 ) ) ( not ( = ?auto_80739 ?auto_80744 ) ) ( not ( = ?auto_80740 ?auto_80744 ) ) ( not ( = ?auto_80743 ?auto_80742 ) ) ( not ( = ?auto_80743 ?auto_80744 ) ) ( not ( = ?auto_80743 ?auto_80740 ) ) ( not ( = ?auto_80743 ?auto_80739 ) ) ( not ( = ?auto_80742 ?auto_80744 ) ) ( not ( = ?auto_80742 ?auto_80740 ) ) ( not ( = ?auto_80742 ?auto_80739 ) ) ( not ( = ?auto_80737 ?auto_80743 ) ) ( not ( = ?auto_80737 ?auto_80742 ) ) ( not ( = ?auto_80738 ?auto_80743 ) ) ( not ( = ?auto_80738 ?auto_80742 ) ) ( ON ?auto_80737 ?auto_80741 ) ( not ( = ?auto_80737 ?auto_80741 ) ) ( not ( = ?auto_80738 ?auto_80741 ) ) ( not ( = ?auto_80739 ?auto_80741 ) ) ( not ( = ?auto_80740 ?auto_80741 ) ) ( not ( = ?auto_80744 ?auto_80741 ) ) ( not ( = ?auto_80743 ?auto_80741 ) ) ( not ( = ?auto_80742 ?auto_80741 ) ) ( ON ?auto_80738 ?auto_80737 ) ( ON-TABLE ?auto_80741 ) ( ON ?auto_80739 ?auto_80738 ) ( ON ?auto_80740 ?auto_80739 ) ( ON ?auto_80744 ?auto_80740 ) ( ON ?auto_80742 ?auto_80744 ) ( CLEAR ?auto_80742 ) ( HOLDING ?auto_80743 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80743 )
      ( MAKE-4PILE ?auto_80737 ?auto_80738 ?auto_80739 ?auto_80740 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_80745 - BLOCK
      ?auto_80746 - BLOCK
      ?auto_80747 - BLOCK
      ?auto_80748 - BLOCK
    )
    :vars
    (
      ?auto_80752 - BLOCK
      ?auto_80749 - BLOCK
      ?auto_80751 - BLOCK
      ?auto_80750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80745 ?auto_80746 ) ) ( not ( = ?auto_80745 ?auto_80747 ) ) ( not ( = ?auto_80745 ?auto_80748 ) ) ( not ( = ?auto_80746 ?auto_80747 ) ) ( not ( = ?auto_80746 ?auto_80748 ) ) ( not ( = ?auto_80747 ?auto_80748 ) ) ( not ( = ?auto_80745 ?auto_80752 ) ) ( not ( = ?auto_80746 ?auto_80752 ) ) ( not ( = ?auto_80747 ?auto_80752 ) ) ( not ( = ?auto_80748 ?auto_80752 ) ) ( not ( = ?auto_80749 ?auto_80751 ) ) ( not ( = ?auto_80749 ?auto_80752 ) ) ( not ( = ?auto_80749 ?auto_80748 ) ) ( not ( = ?auto_80749 ?auto_80747 ) ) ( not ( = ?auto_80751 ?auto_80752 ) ) ( not ( = ?auto_80751 ?auto_80748 ) ) ( not ( = ?auto_80751 ?auto_80747 ) ) ( not ( = ?auto_80745 ?auto_80749 ) ) ( not ( = ?auto_80745 ?auto_80751 ) ) ( not ( = ?auto_80746 ?auto_80749 ) ) ( not ( = ?auto_80746 ?auto_80751 ) ) ( ON ?auto_80745 ?auto_80750 ) ( not ( = ?auto_80745 ?auto_80750 ) ) ( not ( = ?auto_80746 ?auto_80750 ) ) ( not ( = ?auto_80747 ?auto_80750 ) ) ( not ( = ?auto_80748 ?auto_80750 ) ) ( not ( = ?auto_80752 ?auto_80750 ) ) ( not ( = ?auto_80749 ?auto_80750 ) ) ( not ( = ?auto_80751 ?auto_80750 ) ) ( ON ?auto_80746 ?auto_80745 ) ( ON-TABLE ?auto_80750 ) ( ON ?auto_80747 ?auto_80746 ) ( ON ?auto_80748 ?auto_80747 ) ( ON ?auto_80752 ?auto_80748 ) ( ON ?auto_80751 ?auto_80752 ) ( ON ?auto_80749 ?auto_80751 ) ( CLEAR ?auto_80749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_80750 ?auto_80745 ?auto_80746 ?auto_80747 ?auto_80748 ?auto_80752 ?auto_80751 )
      ( MAKE-4PILE ?auto_80745 ?auto_80746 ?auto_80747 ?auto_80748 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80768 - BLOCK
      ?auto_80769 - BLOCK
    )
    :vars
    (
      ?auto_80772 - BLOCK
      ?auto_80771 - BLOCK
      ?auto_80770 - BLOCK
      ?auto_80773 - BLOCK
      ?auto_80774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80772 ?auto_80769 ) ( ON-TABLE ?auto_80768 ) ( ON ?auto_80769 ?auto_80768 ) ( not ( = ?auto_80768 ?auto_80769 ) ) ( not ( = ?auto_80768 ?auto_80772 ) ) ( not ( = ?auto_80769 ?auto_80772 ) ) ( not ( = ?auto_80768 ?auto_80771 ) ) ( not ( = ?auto_80768 ?auto_80770 ) ) ( not ( = ?auto_80769 ?auto_80771 ) ) ( not ( = ?auto_80769 ?auto_80770 ) ) ( not ( = ?auto_80772 ?auto_80771 ) ) ( not ( = ?auto_80772 ?auto_80770 ) ) ( not ( = ?auto_80771 ?auto_80770 ) ) ( ON ?auto_80771 ?auto_80772 ) ( CLEAR ?auto_80771 ) ( HOLDING ?auto_80770 ) ( CLEAR ?auto_80773 ) ( ON-TABLE ?auto_80774 ) ( ON ?auto_80773 ?auto_80774 ) ( not ( = ?auto_80774 ?auto_80773 ) ) ( not ( = ?auto_80774 ?auto_80770 ) ) ( not ( = ?auto_80773 ?auto_80770 ) ) ( not ( = ?auto_80768 ?auto_80773 ) ) ( not ( = ?auto_80768 ?auto_80774 ) ) ( not ( = ?auto_80769 ?auto_80773 ) ) ( not ( = ?auto_80769 ?auto_80774 ) ) ( not ( = ?auto_80772 ?auto_80773 ) ) ( not ( = ?auto_80772 ?auto_80774 ) ) ( not ( = ?auto_80771 ?auto_80773 ) ) ( not ( = ?auto_80771 ?auto_80774 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80774 ?auto_80773 ?auto_80770 )
      ( MAKE-2PILE ?auto_80768 ?auto_80769 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80775 - BLOCK
      ?auto_80776 - BLOCK
    )
    :vars
    (
      ?auto_80781 - BLOCK
      ?auto_80777 - BLOCK
      ?auto_80779 - BLOCK
      ?auto_80778 - BLOCK
      ?auto_80780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80781 ?auto_80776 ) ( ON-TABLE ?auto_80775 ) ( ON ?auto_80776 ?auto_80775 ) ( not ( = ?auto_80775 ?auto_80776 ) ) ( not ( = ?auto_80775 ?auto_80781 ) ) ( not ( = ?auto_80776 ?auto_80781 ) ) ( not ( = ?auto_80775 ?auto_80777 ) ) ( not ( = ?auto_80775 ?auto_80779 ) ) ( not ( = ?auto_80776 ?auto_80777 ) ) ( not ( = ?auto_80776 ?auto_80779 ) ) ( not ( = ?auto_80781 ?auto_80777 ) ) ( not ( = ?auto_80781 ?auto_80779 ) ) ( not ( = ?auto_80777 ?auto_80779 ) ) ( ON ?auto_80777 ?auto_80781 ) ( CLEAR ?auto_80778 ) ( ON-TABLE ?auto_80780 ) ( ON ?auto_80778 ?auto_80780 ) ( not ( = ?auto_80780 ?auto_80778 ) ) ( not ( = ?auto_80780 ?auto_80779 ) ) ( not ( = ?auto_80778 ?auto_80779 ) ) ( not ( = ?auto_80775 ?auto_80778 ) ) ( not ( = ?auto_80775 ?auto_80780 ) ) ( not ( = ?auto_80776 ?auto_80778 ) ) ( not ( = ?auto_80776 ?auto_80780 ) ) ( not ( = ?auto_80781 ?auto_80778 ) ) ( not ( = ?auto_80781 ?auto_80780 ) ) ( not ( = ?auto_80777 ?auto_80778 ) ) ( not ( = ?auto_80777 ?auto_80780 ) ) ( ON ?auto_80779 ?auto_80777 ) ( CLEAR ?auto_80779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80775 ?auto_80776 ?auto_80781 ?auto_80777 )
      ( MAKE-2PILE ?auto_80775 ?auto_80776 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80782 - BLOCK
      ?auto_80783 - BLOCK
    )
    :vars
    (
      ?auto_80784 - BLOCK
      ?auto_80785 - BLOCK
      ?auto_80788 - BLOCK
      ?auto_80787 - BLOCK
      ?auto_80786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80784 ?auto_80783 ) ( ON-TABLE ?auto_80782 ) ( ON ?auto_80783 ?auto_80782 ) ( not ( = ?auto_80782 ?auto_80783 ) ) ( not ( = ?auto_80782 ?auto_80784 ) ) ( not ( = ?auto_80783 ?auto_80784 ) ) ( not ( = ?auto_80782 ?auto_80785 ) ) ( not ( = ?auto_80782 ?auto_80788 ) ) ( not ( = ?auto_80783 ?auto_80785 ) ) ( not ( = ?auto_80783 ?auto_80788 ) ) ( not ( = ?auto_80784 ?auto_80785 ) ) ( not ( = ?auto_80784 ?auto_80788 ) ) ( not ( = ?auto_80785 ?auto_80788 ) ) ( ON ?auto_80785 ?auto_80784 ) ( ON-TABLE ?auto_80787 ) ( not ( = ?auto_80787 ?auto_80786 ) ) ( not ( = ?auto_80787 ?auto_80788 ) ) ( not ( = ?auto_80786 ?auto_80788 ) ) ( not ( = ?auto_80782 ?auto_80786 ) ) ( not ( = ?auto_80782 ?auto_80787 ) ) ( not ( = ?auto_80783 ?auto_80786 ) ) ( not ( = ?auto_80783 ?auto_80787 ) ) ( not ( = ?auto_80784 ?auto_80786 ) ) ( not ( = ?auto_80784 ?auto_80787 ) ) ( not ( = ?auto_80785 ?auto_80786 ) ) ( not ( = ?auto_80785 ?auto_80787 ) ) ( ON ?auto_80788 ?auto_80785 ) ( CLEAR ?auto_80788 ) ( HOLDING ?auto_80786 ) ( CLEAR ?auto_80787 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80787 ?auto_80786 )
      ( MAKE-2PILE ?auto_80782 ?auto_80783 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80789 - BLOCK
      ?auto_80790 - BLOCK
    )
    :vars
    (
      ?auto_80791 - BLOCK
      ?auto_80794 - BLOCK
      ?auto_80795 - BLOCK
      ?auto_80792 - BLOCK
      ?auto_80793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80791 ?auto_80790 ) ( ON-TABLE ?auto_80789 ) ( ON ?auto_80790 ?auto_80789 ) ( not ( = ?auto_80789 ?auto_80790 ) ) ( not ( = ?auto_80789 ?auto_80791 ) ) ( not ( = ?auto_80790 ?auto_80791 ) ) ( not ( = ?auto_80789 ?auto_80794 ) ) ( not ( = ?auto_80789 ?auto_80795 ) ) ( not ( = ?auto_80790 ?auto_80794 ) ) ( not ( = ?auto_80790 ?auto_80795 ) ) ( not ( = ?auto_80791 ?auto_80794 ) ) ( not ( = ?auto_80791 ?auto_80795 ) ) ( not ( = ?auto_80794 ?auto_80795 ) ) ( ON ?auto_80794 ?auto_80791 ) ( ON-TABLE ?auto_80792 ) ( not ( = ?auto_80792 ?auto_80793 ) ) ( not ( = ?auto_80792 ?auto_80795 ) ) ( not ( = ?auto_80793 ?auto_80795 ) ) ( not ( = ?auto_80789 ?auto_80793 ) ) ( not ( = ?auto_80789 ?auto_80792 ) ) ( not ( = ?auto_80790 ?auto_80793 ) ) ( not ( = ?auto_80790 ?auto_80792 ) ) ( not ( = ?auto_80791 ?auto_80793 ) ) ( not ( = ?auto_80791 ?auto_80792 ) ) ( not ( = ?auto_80794 ?auto_80793 ) ) ( not ( = ?auto_80794 ?auto_80792 ) ) ( ON ?auto_80795 ?auto_80794 ) ( CLEAR ?auto_80792 ) ( ON ?auto_80793 ?auto_80795 ) ( CLEAR ?auto_80793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80789 ?auto_80790 ?auto_80791 ?auto_80794 ?auto_80795 )
      ( MAKE-2PILE ?auto_80789 ?auto_80790 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80796 - BLOCK
      ?auto_80797 - BLOCK
    )
    :vars
    (
      ?auto_80799 - BLOCK
      ?auto_80802 - BLOCK
      ?auto_80798 - BLOCK
      ?auto_80800 - BLOCK
      ?auto_80801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80799 ?auto_80797 ) ( ON-TABLE ?auto_80796 ) ( ON ?auto_80797 ?auto_80796 ) ( not ( = ?auto_80796 ?auto_80797 ) ) ( not ( = ?auto_80796 ?auto_80799 ) ) ( not ( = ?auto_80797 ?auto_80799 ) ) ( not ( = ?auto_80796 ?auto_80802 ) ) ( not ( = ?auto_80796 ?auto_80798 ) ) ( not ( = ?auto_80797 ?auto_80802 ) ) ( not ( = ?auto_80797 ?auto_80798 ) ) ( not ( = ?auto_80799 ?auto_80802 ) ) ( not ( = ?auto_80799 ?auto_80798 ) ) ( not ( = ?auto_80802 ?auto_80798 ) ) ( ON ?auto_80802 ?auto_80799 ) ( not ( = ?auto_80800 ?auto_80801 ) ) ( not ( = ?auto_80800 ?auto_80798 ) ) ( not ( = ?auto_80801 ?auto_80798 ) ) ( not ( = ?auto_80796 ?auto_80801 ) ) ( not ( = ?auto_80796 ?auto_80800 ) ) ( not ( = ?auto_80797 ?auto_80801 ) ) ( not ( = ?auto_80797 ?auto_80800 ) ) ( not ( = ?auto_80799 ?auto_80801 ) ) ( not ( = ?auto_80799 ?auto_80800 ) ) ( not ( = ?auto_80802 ?auto_80801 ) ) ( not ( = ?auto_80802 ?auto_80800 ) ) ( ON ?auto_80798 ?auto_80802 ) ( ON ?auto_80801 ?auto_80798 ) ( CLEAR ?auto_80801 ) ( HOLDING ?auto_80800 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80800 )
      ( MAKE-2PILE ?auto_80796 ?auto_80797 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80812 - BLOCK
      ?auto_80813 - BLOCK
    )
    :vars
    (
      ?auto_80814 - BLOCK
      ?auto_80815 - BLOCK
      ?auto_80816 - BLOCK
      ?auto_80817 - BLOCK
      ?auto_80818 - BLOCK
      ?auto_80819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80814 ?auto_80813 ) ( ON-TABLE ?auto_80812 ) ( ON ?auto_80813 ?auto_80812 ) ( not ( = ?auto_80812 ?auto_80813 ) ) ( not ( = ?auto_80812 ?auto_80814 ) ) ( not ( = ?auto_80813 ?auto_80814 ) ) ( not ( = ?auto_80812 ?auto_80815 ) ) ( not ( = ?auto_80812 ?auto_80816 ) ) ( not ( = ?auto_80813 ?auto_80815 ) ) ( not ( = ?auto_80813 ?auto_80816 ) ) ( not ( = ?auto_80814 ?auto_80815 ) ) ( not ( = ?auto_80814 ?auto_80816 ) ) ( not ( = ?auto_80815 ?auto_80816 ) ) ( ON ?auto_80815 ?auto_80814 ) ( not ( = ?auto_80817 ?auto_80818 ) ) ( not ( = ?auto_80817 ?auto_80816 ) ) ( not ( = ?auto_80818 ?auto_80816 ) ) ( not ( = ?auto_80812 ?auto_80818 ) ) ( not ( = ?auto_80812 ?auto_80817 ) ) ( not ( = ?auto_80813 ?auto_80818 ) ) ( not ( = ?auto_80813 ?auto_80817 ) ) ( not ( = ?auto_80814 ?auto_80818 ) ) ( not ( = ?auto_80814 ?auto_80817 ) ) ( not ( = ?auto_80815 ?auto_80818 ) ) ( not ( = ?auto_80815 ?auto_80817 ) ) ( ON ?auto_80816 ?auto_80815 ) ( ON ?auto_80818 ?auto_80816 ) ( CLEAR ?auto_80818 ) ( ON ?auto_80817 ?auto_80819 ) ( CLEAR ?auto_80817 ) ( HAND-EMPTY ) ( not ( = ?auto_80812 ?auto_80819 ) ) ( not ( = ?auto_80813 ?auto_80819 ) ) ( not ( = ?auto_80814 ?auto_80819 ) ) ( not ( = ?auto_80815 ?auto_80819 ) ) ( not ( = ?auto_80816 ?auto_80819 ) ) ( not ( = ?auto_80817 ?auto_80819 ) ) ( not ( = ?auto_80818 ?auto_80819 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80817 ?auto_80819 )
      ( MAKE-2PILE ?auto_80812 ?auto_80813 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80820 - BLOCK
      ?auto_80821 - BLOCK
    )
    :vars
    (
      ?auto_80825 - BLOCK
      ?auto_80826 - BLOCK
      ?auto_80824 - BLOCK
      ?auto_80823 - BLOCK
      ?auto_80822 - BLOCK
      ?auto_80827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80825 ?auto_80821 ) ( ON-TABLE ?auto_80820 ) ( ON ?auto_80821 ?auto_80820 ) ( not ( = ?auto_80820 ?auto_80821 ) ) ( not ( = ?auto_80820 ?auto_80825 ) ) ( not ( = ?auto_80821 ?auto_80825 ) ) ( not ( = ?auto_80820 ?auto_80826 ) ) ( not ( = ?auto_80820 ?auto_80824 ) ) ( not ( = ?auto_80821 ?auto_80826 ) ) ( not ( = ?auto_80821 ?auto_80824 ) ) ( not ( = ?auto_80825 ?auto_80826 ) ) ( not ( = ?auto_80825 ?auto_80824 ) ) ( not ( = ?auto_80826 ?auto_80824 ) ) ( ON ?auto_80826 ?auto_80825 ) ( not ( = ?auto_80823 ?auto_80822 ) ) ( not ( = ?auto_80823 ?auto_80824 ) ) ( not ( = ?auto_80822 ?auto_80824 ) ) ( not ( = ?auto_80820 ?auto_80822 ) ) ( not ( = ?auto_80820 ?auto_80823 ) ) ( not ( = ?auto_80821 ?auto_80822 ) ) ( not ( = ?auto_80821 ?auto_80823 ) ) ( not ( = ?auto_80825 ?auto_80822 ) ) ( not ( = ?auto_80825 ?auto_80823 ) ) ( not ( = ?auto_80826 ?auto_80822 ) ) ( not ( = ?auto_80826 ?auto_80823 ) ) ( ON ?auto_80824 ?auto_80826 ) ( ON ?auto_80823 ?auto_80827 ) ( CLEAR ?auto_80823 ) ( not ( = ?auto_80820 ?auto_80827 ) ) ( not ( = ?auto_80821 ?auto_80827 ) ) ( not ( = ?auto_80825 ?auto_80827 ) ) ( not ( = ?auto_80826 ?auto_80827 ) ) ( not ( = ?auto_80824 ?auto_80827 ) ) ( not ( = ?auto_80823 ?auto_80827 ) ) ( not ( = ?auto_80822 ?auto_80827 ) ) ( HOLDING ?auto_80822 ) ( CLEAR ?auto_80824 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80820 ?auto_80821 ?auto_80825 ?auto_80826 ?auto_80824 ?auto_80822 )
      ( MAKE-2PILE ?auto_80820 ?auto_80821 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80828 - BLOCK
      ?auto_80829 - BLOCK
    )
    :vars
    (
      ?auto_80835 - BLOCK
      ?auto_80831 - BLOCK
      ?auto_80830 - BLOCK
      ?auto_80834 - BLOCK
      ?auto_80833 - BLOCK
      ?auto_80832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80835 ?auto_80829 ) ( ON-TABLE ?auto_80828 ) ( ON ?auto_80829 ?auto_80828 ) ( not ( = ?auto_80828 ?auto_80829 ) ) ( not ( = ?auto_80828 ?auto_80835 ) ) ( not ( = ?auto_80829 ?auto_80835 ) ) ( not ( = ?auto_80828 ?auto_80831 ) ) ( not ( = ?auto_80828 ?auto_80830 ) ) ( not ( = ?auto_80829 ?auto_80831 ) ) ( not ( = ?auto_80829 ?auto_80830 ) ) ( not ( = ?auto_80835 ?auto_80831 ) ) ( not ( = ?auto_80835 ?auto_80830 ) ) ( not ( = ?auto_80831 ?auto_80830 ) ) ( ON ?auto_80831 ?auto_80835 ) ( not ( = ?auto_80834 ?auto_80833 ) ) ( not ( = ?auto_80834 ?auto_80830 ) ) ( not ( = ?auto_80833 ?auto_80830 ) ) ( not ( = ?auto_80828 ?auto_80833 ) ) ( not ( = ?auto_80828 ?auto_80834 ) ) ( not ( = ?auto_80829 ?auto_80833 ) ) ( not ( = ?auto_80829 ?auto_80834 ) ) ( not ( = ?auto_80835 ?auto_80833 ) ) ( not ( = ?auto_80835 ?auto_80834 ) ) ( not ( = ?auto_80831 ?auto_80833 ) ) ( not ( = ?auto_80831 ?auto_80834 ) ) ( ON ?auto_80830 ?auto_80831 ) ( ON ?auto_80834 ?auto_80832 ) ( not ( = ?auto_80828 ?auto_80832 ) ) ( not ( = ?auto_80829 ?auto_80832 ) ) ( not ( = ?auto_80835 ?auto_80832 ) ) ( not ( = ?auto_80831 ?auto_80832 ) ) ( not ( = ?auto_80830 ?auto_80832 ) ) ( not ( = ?auto_80834 ?auto_80832 ) ) ( not ( = ?auto_80833 ?auto_80832 ) ) ( CLEAR ?auto_80830 ) ( ON ?auto_80833 ?auto_80834 ) ( CLEAR ?auto_80833 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80832 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80832 ?auto_80834 )
      ( MAKE-2PILE ?auto_80828 ?auto_80829 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80836 - BLOCK
      ?auto_80837 - BLOCK
    )
    :vars
    (
      ?auto_80843 - BLOCK
      ?auto_80842 - BLOCK
      ?auto_80838 - BLOCK
      ?auto_80839 - BLOCK
      ?auto_80840 - BLOCK
      ?auto_80841 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_80843 ?auto_80837 ) ( ON-TABLE ?auto_80836 ) ( ON ?auto_80837 ?auto_80836 ) ( not ( = ?auto_80836 ?auto_80837 ) ) ( not ( = ?auto_80836 ?auto_80843 ) ) ( not ( = ?auto_80837 ?auto_80843 ) ) ( not ( = ?auto_80836 ?auto_80842 ) ) ( not ( = ?auto_80836 ?auto_80838 ) ) ( not ( = ?auto_80837 ?auto_80842 ) ) ( not ( = ?auto_80837 ?auto_80838 ) ) ( not ( = ?auto_80843 ?auto_80842 ) ) ( not ( = ?auto_80843 ?auto_80838 ) ) ( not ( = ?auto_80842 ?auto_80838 ) ) ( ON ?auto_80842 ?auto_80843 ) ( not ( = ?auto_80839 ?auto_80840 ) ) ( not ( = ?auto_80839 ?auto_80838 ) ) ( not ( = ?auto_80840 ?auto_80838 ) ) ( not ( = ?auto_80836 ?auto_80840 ) ) ( not ( = ?auto_80836 ?auto_80839 ) ) ( not ( = ?auto_80837 ?auto_80840 ) ) ( not ( = ?auto_80837 ?auto_80839 ) ) ( not ( = ?auto_80843 ?auto_80840 ) ) ( not ( = ?auto_80843 ?auto_80839 ) ) ( not ( = ?auto_80842 ?auto_80840 ) ) ( not ( = ?auto_80842 ?auto_80839 ) ) ( ON ?auto_80839 ?auto_80841 ) ( not ( = ?auto_80836 ?auto_80841 ) ) ( not ( = ?auto_80837 ?auto_80841 ) ) ( not ( = ?auto_80843 ?auto_80841 ) ) ( not ( = ?auto_80842 ?auto_80841 ) ) ( not ( = ?auto_80838 ?auto_80841 ) ) ( not ( = ?auto_80839 ?auto_80841 ) ) ( not ( = ?auto_80840 ?auto_80841 ) ) ( ON ?auto_80840 ?auto_80839 ) ( CLEAR ?auto_80840 ) ( ON-TABLE ?auto_80841 ) ( HOLDING ?auto_80838 ) ( CLEAR ?auto_80842 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80836 ?auto_80837 ?auto_80843 ?auto_80842 ?auto_80838 )
      ( MAKE-2PILE ?auto_80836 ?auto_80837 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80887 - BLOCK
      ?auto_80888 - BLOCK
      ?auto_80889 - BLOCK
      ?auto_80890 - BLOCK
      ?auto_80891 - BLOCK
    )
    :vars
    (
      ?auto_80892 - BLOCK
      ?auto_80893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80887 ) ( ON ?auto_80888 ?auto_80887 ) ( ON ?auto_80889 ?auto_80888 ) ( not ( = ?auto_80887 ?auto_80888 ) ) ( not ( = ?auto_80887 ?auto_80889 ) ) ( not ( = ?auto_80887 ?auto_80890 ) ) ( not ( = ?auto_80887 ?auto_80891 ) ) ( not ( = ?auto_80888 ?auto_80889 ) ) ( not ( = ?auto_80888 ?auto_80890 ) ) ( not ( = ?auto_80888 ?auto_80891 ) ) ( not ( = ?auto_80889 ?auto_80890 ) ) ( not ( = ?auto_80889 ?auto_80891 ) ) ( not ( = ?auto_80890 ?auto_80891 ) ) ( ON ?auto_80891 ?auto_80892 ) ( not ( = ?auto_80887 ?auto_80892 ) ) ( not ( = ?auto_80888 ?auto_80892 ) ) ( not ( = ?auto_80889 ?auto_80892 ) ) ( not ( = ?auto_80890 ?auto_80892 ) ) ( not ( = ?auto_80891 ?auto_80892 ) ) ( CLEAR ?auto_80889 ) ( ON ?auto_80890 ?auto_80891 ) ( CLEAR ?auto_80890 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80893 ) ( ON ?auto_80892 ?auto_80893 ) ( not ( = ?auto_80893 ?auto_80892 ) ) ( not ( = ?auto_80893 ?auto_80891 ) ) ( not ( = ?auto_80893 ?auto_80890 ) ) ( not ( = ?auto_80887 ?auto_80893 ) ) ( not ( = ?auto_80888 ?auto_80893 ) ) ( not ( = ?auto_80889 ?auto_80893 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80893 ?auto_80892 ?auto_80891 )
      ( MAKE-5PILE ?auto_80887 ?auto_80888 ?auto_80889 ?auto_80890 ?auto_80891 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80894 - BLOCK
      ?auto_80895 - BLOCK
      ?auto_80896 - BLOCK
      ?auto_80897 - BLOCK
      ?auto_80898 - BLOCK
    )
    :vars
    (
      ?auto_80900 - BLOCK
      ?auto_80899 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80894 ) ( ON ?auto_80895 ?auto_80894 ) ( not ( = ?auto_80894 ?auto_80895 ) ) ( not ( = ?auto_80894 ?auto_80896 ) ) ( not ( = ?auto_80894 ?auto_80897 ) ) ( not ( = ?auto_80894 ?auto_80898 ) ) ( not ( = ?auto_80895 ?auto_80896 ) ) ( not ( = ?auto_80895 ?auto_80897 ) ) ( not ( = ?auto_80895 ?auto_80898 ) ) ( not ( = ?auto_80896 ?auto_80897 ) ) ( not ( = ?auto_80896 ?auto_80898 ) ) ( not ( = ?auto_80897 ?auto_80898 ) ) ( ON ?auto_80898 ?auto_80900 ) ( not ( = ?auto_80894 ?auto_80900 ) ) ( not ( = ?auto_80895 ?auto_80900 ) ) ( not ( = ?auto_80896 ?auto_80900 ) ) ( not ( = ?auto_80897 ?auto_80900 ) ) ( not ( = ?auto_80898 ?auto_80900 ) ) ( ON ?auto_80897 ?auto_80898 ) ( CLEAR ?auto_80897 ) ( ON-TABLE ?auto_80899 ) ( ON ?auto_80900 ?auto_80899 ) ( not ( = ?auto_80899 ?auto_80900 ) ) ( not ( = ?auto_80899 ?auto_80898 ) ) ( not ( = ?auto_80899 ?auto_80897 ) ) ( not ( = ?auto_80894 ?auto_80899 ) ) ( not ( = ?auto_80895 ?auto_80899 ) ) ( not ( = ?auto_80896 ?auto_80899 ) ) ( HOLDING ?auto_80896 ) ( CLEAR ?auto_80895 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80894 ?auto_80895 ?auto_80896 )
      ( MAKE-5PILE ?auto_80894 ?auto_80895 ?auto_80896 ?auto_80897 ?auto_80898 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80901 - BLOCK
      ?auto_80902 - BLOCK
      ?auto_80903 - BLOCK
      ?auto_80904 - BLOCK
      ?auto_80905 - BLOCK
    )
    :vars
    (
      ?auto_80906 - BLOCK
      ?auto_80907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80901 ) ( ON ?auto_80902 ?auto_80901 ) ( not ( = ?auto_80901 ?auto_80902 ) ) ( not ( = ?auto_80901 ?auto_80903 ) ) ( not ( = ?auto_80901 ?auto_80904 ) ) ( not ( = ?auto_80901 ?auto_80905 ) ) ( not ( = ?auto_80902 ?auto_80903 ) ) ( not ( = ?auto_80902 ?auto_80904 ) ) ( not ( = ?auto_80902 ?auto_80905 ) ) ( not ( = ?auto_80903 ?auto_80904 ) ) ( not ( = ?auto_80903 ?auto_80905 ) ) ( not ( = ?auto_80904 ?auto_80905 ) ) ( ON ?auto_80905 ?auto_80906 ) ( not ( = ?auto_80901 ?auto_80906 ) ) ( not ( = ?auto_80902 ?auto_80906 ) ) ( not ( = ?auto_80903 ?auto_80906 ) ) ( not ( = ?auto_80904 ?auto_80906 ) ) ( not ( = ?auto_80905 ?auto_80906 ) ) ( ON ?auto_80904 ?auto_80905 ) ( ON-TABLE ?auto_80907 ) ( ON ?auto_80906 ?auto_80907 ) ( not ( = ?auto_80907 ?auto_80906 ) ) ( not ( = ?auto_80907 ?auto_80905 ) ) ( not ( = ?auto_80907 ?auto_80904 ) ) ( not ( = ?auto_80901 ?auto_80907 ) ) ( not ( = ?auto_80902 ?auto_80907 ) ) ( not ( = ?auto_80903 ?auto_80907 ) ) ( CLEAR ?auto_80902 ) ( ON ?auto_80903 ?auto_80904 ) ( CLEAR ?auto_80903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80907 ?auto_80906 ?auto_80905 ?auto_80904 )
      ( MAKE-5PILE ?auto_80901 ?auto_80902 ?auto_80903 ?auto_80904 ?auto_80905 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80908 - BLOCK
      ?auto_80909 - BLOCK
      ?auto_80910 - BLOCK
      ?auto_80911 - BLOCK
      ?auto_80912 - BLOCK
    )
    :vars
    (
      ?auto_80913 - BLOCK
      ?auto_80914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80908 ) ( not ( = ?auto_80908 ?auto_80909 ) ) ( not ( = ?auto_80908 ?auto_80910 ) ) ( not ( = ?auto_80908 ?auto_80911 ) ) ( not ( = ?auto_80908 ?auto_80912 ) ) ( not ( = ?auto_80909 ?auto_80910 ) ) ( not ( = ?auto_80909 ?auto_80911 ) ) ( not ( = ?auto_80909 ?auto_80912 ) ) ( not ( = ?auto_80910 ?auto_80911 ) ) ( not ( = ?auto_80910 ?auto_80912 ) ) ( not ( = ?auto_80911 ?auto_80912 ) ) ( ON ?auto_80912 ?auto_80913 ) ( not ( = ?auto_80908 ?auto_80913 ) ) ( not ( = ?auto_80909 ?auto_80913 ) ) ( not ( = ?auto_80910 ?auto_80913 ) ) ( not ( = ?auto_80911 ?auto_80913 ) ) ( not ( = ?auto_80912 ?auto_80913 ) ) ( ON ?auto_80911 ?auto_80912 ) ( ON-TABLE ?auto_80914 ) ( ON ?auto_80913 ?auto_80914 ) ( not ( = ?auto_80914 ?auto_80913 ) ) ( not ( = ?auto_80914 ?auto_80912 ) ) ( not ( = ?auto_80914 ?auto_80911 ) ) ( not ( = ?auto_80908 ?auto_80914 ) ) ( not ( = ?auto_80909 ?auto_80914 ) ) ( not ( = ?auto_80910 ?auto_80914 ) ) ( ON ?auto_80910 ?auto_80911 ) ( CLEAR ?auto_80910 ) ( HOLDING ?auto_80909 ) ( CLEAR ?auto_80908 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80908 ?auto_80909 )
      ( MAKE-5PILE ?auto_80908 ?auto_80909 ?auto_80910 ?auto_80911 ?auto_80912 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80915 - BLOCK
      ?auto_80916 - BLOCK
      ?auto_80917 - BLOCK
      ?auto_80918 - BLOCK
      ?auto_80919 - BLOCK
    )
    :vars
    (
      ?auto_80921 - BLOCK
      ?auto_80920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_80915 ) ( not ( = ?auto_80915 ?auto_80916 ) ) ( not ( = ?auto_80915 ?auto_80917 ) ) ( not ( = ?auto_80915 ?auto_80918 ) ) ( not ( = ?auto_80915 ?auto_80919 ) ) ( not ( = ?auto_80916 ?auto_80917 ) ) ( not ( = ?auto_80916 ?auto_80918 ) ) ( not ( = ?auto_80916 ?auto_80919 ) ) ( not ( = ?auto_80917 ?auto_80918 ) ) ( not ( = ?auto_80917 ?auto_80919 ) ) ( not ( = ?auto_80918 ?auto_80919 ) ) ( ON ?auto_80919 ?auto_80921 ) ( not ( = ?auto_80915 ?auto_80921 ) ) ( not ( = ?auto_80916 ?auto_80921 ) ) ( not ( = ?auto_80917 ?auto_80921 ) ) ( not ( = ?auto_80918 ?auto_80921 ) ) ( not ( = ?auto_80919 ?auto_80921 ) ) ( ON ?auto_80918 ?auto_80919 ) ( ON-TABLE ?auto_80920 ) ( ON ?auto_80921 ?auto_80920 ) ( not ( = ?auto_80920 ?auto_80921 ) ) ( not ( = ?auto_80920 ?auto_80919 ) ) ( not ( = ?auto_80920 ?auto_80918 ) ) ( not ( = ?auto_80915 ?auto_80920 ) ) ( not ( = ?auto_80916 ?auto_80920 ) ) ( not ( = ?auto_80917 ?auto_80920 ) ) ( ON ?auto_80917 ?auto_80918 ) ( CLEAR ?auto_80915 ) ( ON ?auto_80916 ?auto_80917 ) ( CLEAR ?auto_80916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80920 ?auto_80921 ?auto_80919 ?auto_80918 ?auto_80917 )
      ( MAKE-5PILE ?auto_80915 ?auto_80916 ?auto_80917 ?auto_80918 ?auto_80919 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80922 - BLOCK
      ?auto_80923 - BLOCK
      ?auto_80924 - BLOCK
      ?auto_80925 - BLOCK
      ?auto_80926 - BLOCK
    )
    :vars
    (
      ?auto_80927 - BLOCK
      ?auto_80928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80922 ?auto_80923 ) ) ( not ( = ?auto_80922 ?auto_80924 ) ) ( not ( = ?auto_80922 ?auto_80925 ) ) ( not ( = ?auto_80922 ?auto_80926 ) ) ( not ( = ?auto_80923 ?auto_80924 ) ) ( not ( = ?auto_80923 ?auto_80925 ) ) ( not ( = ?auto_80923 ?auto_80926 ) ) ( not ( = ?auto_80924 ?auto_80925 ) ) ( not ( = ?auto_80924 ?auto_80926 ) ) ( not ( = ?auto_80925 ?auto_80926 ) ) ( ON ?auto_80926 ?auto_80927 ) ( not ( = ?auto_80922 ?auto_80927 ) ) ( not ( = ?auto_80923 ?auto_80927 ) ) ( not ( = ?auto_80924 ?auto_80927 ) ) ( not ( = ?auto_80925 ?auto_80927 ) ) ( not ( = ?auto_80926 ?auto_80927 ) ) ( ON ?auto_80925 ?auto_80926 ) ( ON-TABLE ?auto_80928 ) ( ON ?auto_80927 ?auto_80928 ) ( not ( = ?auto_80928 ?auto_80927 ) ) ( not ( = ?auto_80928 ?auto_80926 ) ) ( not ( = ?auto_80928 ?auto_80925 ) ) ( not ( = ?auto_80922 ?auto_80928 ) ) ( not ( = ?auto_80923 ?auto_80928 ) ) ( not ( = ?auto_80924 ?auto_80928 ) ) ( ON ?auto_80924 ?auto_80925 ) ( ON ?auto_80923 ?auto_80924 ) ( CLEAR ?auto_80923 ) ( HOLDING ?auto_80922 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80922 )
      ( MAKE-5PILE ?auto_80922 ?auto_80923 ?auto_80924 ?auto_80925 ?auto_80926 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80929 - BLOCK
      ?auto_80930 - BLOCK
      ?auto_80931 - BLOCK
      ?auto_80932 - BLOCK
      ?auto_80933 - BLOCK
    )
    :vars
    (
      ?auto_80935 - BLOCK
      ?auto_80934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80929 ?auto_80930 ) ) ( not ( = ?auto_80929 ?auto_80931 ) ) ( not ( = ?auto_80929 ?auto_80932 ) ) ( not ( = ?auto_80929 ?auto_80933 ) ) ( not ( = ?auto_80930 ?auto_80931 ) ) ( not ( = ?auto_80930 ?auto_80932 ) ) ( not ( = ?auto_80930 ?auto_80933 ) ) ( not ( = ?auto_80931 ?auto_80932 ) ) ( not ( = ?auto_80931 ?auto_80933 ) ) ( not ( = ?auto_80932 ?auto_80933 ) ) ( ON ?auto_80933 ?auto_80935 ) ( not ( = ?auto_80929 ?auto_80935 ) ) ( not ( = ?auto_80930 ?auto_80935 ) ) ( not ( = ?auto_80931 ?auto_80935 ) ) ( not ( = ?auto_80932 ?auto_80935 ) ) ( not ( = ?auto_80933 ?auto_80935 ) ) ( ON ?auto_80932 ?auto_80933 ) ( ON-TABLE ?auto_80934 ) ( ON ?auto_80935 ?auto_80934 ) ( not ( = ?auto_80934 ?auto_80935 ) ) ( not ( = ?auto_80934 ?auto_80933 ) ) ( not ( = ?auto_80934 ?auto_80932 ) ) ( not ( = ?auto_80929 ?auto_80934 ) ) ( not ( = ?auto_80930 ?auto_80934 ) ) ( not ( = ?auto_80931 ?auto_80934 ) ) ( ON ?auto_80931 ?auto_80932 ) ( ON ?auto_80930 ?auto_80931 ) ( ON ?auto_80929 ?auto_80930 ) ( CLEAR ?auto_80929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80934 ?auto_80935 ?auto_80933 ?auto_80932 ?auto_80931 ?auto_80930 )
      ( MAKE-5PILE ?auto_80929 ?auto_80930 ?auto_80931 ?auto_80932 ?auto_80933 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80941 - BLOCK
      ?auto_80942 - BLOCK
      ?auto_80943 - BLOCK
      ?auto_80944 - BLOCK
      ?auto_80945 - BLOCK
    )
    :vars
    (
      ?auto_80947 - BLOCK
      ?auto_80946 - BLOCK
      ?auto_80948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80941 ?auto_80942 ) ) ( not ( = ?auto_80941 ?auto_80943 ) ) ( not ( = ?auto_80941 ?auto_80944 ) ) ( not ( = ?auto_80941 ?auto_80945 ) ) ( not ( = ?auto_80942 ?auto_80943 ) ) ( not ( = ?auto_80942 ?auto_80944 ) ) ( not ( = ?auto_80942 ?auto_80945 ) ) ( not ( = ?auto_80943 ?auto_80944 ) ) ( not ( = ?auto_80943 ?auto_80945 ) ) ( not ( = ?auto_80944 ?auto_80945 ) ) ( ON ?auto_80945 ?auto_80947 ) ( not ( = ?auto_80941 ?auto_80947 ) ) ( not ( = ?auto_80942 ?auto_80947 ) ) ( not ( = ?auto_80943 ?auto_80947 ) ) ( not ( = ?auto_80944 ?auto_80947 ) ) ( not ( = ?auto_80945 ?auto_80947 ) ) ( ON ?auto_80944 ?auto_80945 ) ( ON-TABLE ?auto_80946 ) ( ON ?auto_80947 ?auto_80946 ) ( not ( = ?auto_80946 ?auto_80947 ) ) ( not ( = ?auto_80946 ?auto_80945 ) ) ( not ( = ?auto_80946 ?auto_80944 ) ) ( not ( = ?auto_80941 ?auto_80946 ) ) ( not ( = ?auto_80942 ?auto_80946 ) ) ( not ( = ?auto_80943 ?auto_80946 ) ) ( ON ?auto_80943 ?auto_80944 ) ( ON ?auto_80942 ?auto_80943 ) ( CLEAR ?auto_80942 ) ( ON ?auto_80941 ?auto_80948 ) ( CLEAR ?auto_80941 ) ( HAND-EMPTY ) ( not ( = ?auto_80941 ?auto_80948 ) ) ( not ( = ?auto_80942 ?auto_80948 ) ) ( not ( = ?auto_80943 ?auto_80948 ) ) ( not ( = ?auto_80944 ?auto_80948 ) ) ( not ( = ?auto_80945 ?auto_80948 ) ) ( not ( = ?auto_80947 ?auto_80948 ) ) ( not ( = ?auto_80946 ?auto_80948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_80941 ?auto_80948 )
      ( MAKE-5PILE ?auto_80941 ?auto_80942 ?auto_80943 ?auto_80944 ?auto_80945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80949 - BLOCK
      ?auto_80950 - BLOCK
      ?auto_80951 - BLOCK
      ?auto_80952 - BLOCK
      ?auto_80953 - BLOCK
    )
    :vars
    (
      ?auto_80955 - BLOCK
      ?auto_80956 - BLOCK
      ?auto_80954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80949 ?auto_80950 ) ) ( not ( = ?auto_80949 ?auto_80951 ) ) ( not ( = ?auto_80949 ?auto_80952 ) ) ( not ( = ?auto_80949 ?auto_80953 ) ) ( not ( = ?auto_80950 ?auto_80951 ) ) ( not ( = ?auto_80950 ?auto_80952 ) ) ( not ( = ?auto_80950 ?auto_80953 ) ) ( not ( = ?auto_80951 ?auto_80952 ) ) ( not ( = ?auto_80951 ?auto_80953 ) ) ( not ( = ?auto_80952 ?auto_80953 ) ) ( ON ?auto_80953 ?auto_80955 ) ( not ( = ?auto_80949 ?auto_80955 ) ) ( not ( = ?auto_80950 ?auto_80955 ) ) ( not ( = ?auto_80951 ?auto_80955 ) ) ( not ( = ?auto_80952 ?auto_80955 ) ) ( not ( = ?auto_80953 ?auto_80955 ) ) ( ON ?auto_80952 ?auto_80953 ) ( ON-TABLE ?auto_80956 ) ( ON ?auto_80955 ?auto_80956 ) ( not ( = ?auto_80956 ?auto_80955 ) ) ( not ( = ?auto_80956 ?auto_80953 ) ) ( not ( = ?auto_80956 ?auto_80952 ) ) ( not ( = ?auto_80949 ?auto_80956 ) ) ( not ( = ?auto_80950 ?auto_80956 ) ) ( not ( = ?auto_80951 ?auto_80956 ) ) ( ON ?auto_80951 ?auto_80952 ) ( ON ?auto_80949 ?auto_80954 ) ( CLEAR ?auto_80949 ) ( not ( = ?auto_80949 ?auto_80954 ) ) ( not ( = ?auto_80950 ?auto_80954 ) ) ( not ( = ?auto_80951 ?auto_80954 ) ) ( not ( = ?auto_80952 ?auto_80954 ) ) ( not ( = ?auto_80953 ?auto_80954 ) ) ( not ( = ?auto_80955 ?auto_80954 ) ) ( not ( = ?auto_80956 ?auto_80954 ) ) ( HOLDING ?auto_80950 ) ( CLEAR ?auto_80951 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_80956 ?auto_80955 ?auto_80953 ?auto_80952 ?auto_80951 ?auto_80950 )
      ( MAKE-5PILE ?auto_80949 ?auto_80950 ?auto_80951 ?auto_80952 ?auto_80953 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80957 - BLOCK
      ?auto_80958 - BLOCK
      ?auto_80959 - BLOCK
      ?auto_80960 - BLOCK
      ?auto_80961 - BLOCK
    )
    :vars
    (
      ?auto_80962 - BLOCK
      ?auto_80964 - BLOCK
      ?auto_80963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80957 ?auto_80958 ) ) ( not ( = ?auto_80957 ?auto_80959 ) ) ( not ( = ?auto_80957 ?auto_80960 ) ) ( not ( = ?auto_80957 ?auto_80961 ) ) ( not ( = ?auto_80958 ?auto_80959 ) ) ( not ( = ?auto_80958 ?auto_80960 ) ) ( not ( = ?auto_80958 ?auto_80961 ) ) ( not ( = ?auto_80959 ?auto_80960 ) ) ( not ( = ?auto_80959 ?auto_80961 ) ) ( not ( = ?auto_80960 ?auto_80961 ) ) ( ON ?auto_80961 ?auto_80962 ) ( not ( = ?auto_80957 ?auto_80962 ) ) ( not ( = ?auto_80958 ?auto_80962 ) ) ( not ( = ?auto_80959 ?auto_80962 ) ) ( not ( = ?auto_80960 ?auto_80962 ) ) ( not ( = ?auto_80961 ?auto_80962 ) ) ( ON ?auto_80960 ?auto_80961 ) ( ON-TABLE ?auto_80964 ) ( ON ?auto_80962 ?auto_80964 ) ( not ( = ?auto_80964 ?auto_80962 ) ) ( not ( = ?auto_80964 ?auto_80961 ) ) ( not ( = ?auto_80964 ?auto_80960 ) ) ( not ( = ?auto_80957 ?auto_80964 ) ) ( not ( = ?auto_80958 ?auto_80964 ) ) ( not ( = ?auto_80959 ?auto_80964 ) ) ( ON ?auto_80959 ?auto_80960 ) ( ON ?auto_80957 ?auto_80963 ) ( not ( = ?auto_80957 ?auto_80963 ) ) ( not ( = ?auto_80958 ?auto_80963 ) ) ( not ( = ?auto_80959 ?auto_80963 ) ) ( not ( = ?auto_80960 ?auto_80963 ) ) ( not ( = ?auto_80961 ?auto_80963 ) ) ( not ( = ?auto_80962 ?auto_80963 ) ) ( not ( = ?auto_80964 ?auto_80963 ) ) ( CLEAR ?auto_80959 ) ( ON ?auto_80958 ?auto_80957 ) ( CLEAR ?auto_80958 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80963 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80963 ?auto_80957 )
      ( MAKE-5PILE ?auto_80957 ?auto_80958 ?auto_80959 ?auto_80960 ?auto_80961 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80965 - BLOCK
      ?auto_80966 - BLOCK
      ?auto_80967 - BLOCK
      ?auto_80968 - BLOCK
      ?auto_80969 - BLOCK
    )
    :vars
    (
      ?auto_80971 - BLOCK
      ?auto_80970 - BLOCK
      ?auto_80972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80965 ?auto_80966 ) ) ( not ( = ?auto_80965 ?auto_80967 ) ) ( not ( = ?auto_80965 ?auto_80968 ) ) ( not ( = ?auto_80965 ?auto_80969 ) ) ( not ( = ?auto_80966 ?auto_80967 ) ) ( not ( = ?auto_80966 ?auto_80968 ) ) ( not ( = ?auto_80966 ?auto_80969 ) ) ( not ( = ?auto_80967 ?auto_80968 ) ) ( not ( = ?auto_80967 ?auto_80969 ) ) ( not ( = ?auto_80968 ?auto_80969 ) ) ( ON ?auto_80969 ?auto_80971 ) ( not ( = ?auto_80965 ?auto_80971 ) ) ( not ( = ?auto_80966 ?auto_80971 ) ) ( not ( = ?auto_80967 ?auto_80971 ) ) ( not ( = ?auto_80968 ?auto_80971 ) ) ( not ( = ?auto_80969 ?auto_80971 ) ) ( ON ?auto_80968 ?auto_80969 ) ( ON-TABLE ?auto_80970 ) ( ON ?auto_80971 ?auto_80970 ) ( not ( = ?auto_80970 ?auto_80971 ) ) ( not ( = ?auto_80970 ?auto_80969 ) ) ( not ( = ?auto_80970 ?auto_80968 ) ) ( not ( = ?auto_80965 ?auto_80970 ) ) ( not ( = ?auto_80966 ?auto_80970 ) ) ( not ( = ?auto_80967 ?auto_80970 ) ) ( ON ?auto_80965 ?auto_80972 ) ( not ( = ?auto_80965 ?auto_80972 ) ) ( not ( = ?auto_80966 ?auto_80972 ) ) ( not ( = ?auto_80967 ?auto_80972 ) ) ( not ( = ?auto_80968 ?auto_80972 ) ) ( not ( = ?auto_80969 ?auto_80972 ) ) ( not ( = ?auto_80971 ?auto_80972 ) ) ( not ( = ?auto_80970 ?auto_80972 ) ) ( ON ?auto_80966 ?auto_80965 ) ( CLEAR ?auto_80966 ) ( ON-TABLE ?auto_80972 ) ( HOLDING ?auto_80967 ) ( CLEAR ?auto_80968 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_80970 ?auto_80971 ?auto_80969 ?auto_80968 ?auto_80967 )
      ( MAKE-5PILE ?auto_80965 ?auto_80966 ?auto_80967 ?auto_80968 ?auto_80969 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80973 - BLOCK
      ?auto_80974 - BLOCK
      ?auto_80975 - BLOCK
      ?auto_80976 - BLOCK
      ?auto_80977 - BLOCK
    )
    :vars
    (
      ?auto_80980 - BLOCK
      ?auto_80978 - BLOCK
      ?auto_80979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80973 ?auto_80974 ) ) ( not ( = ?auto_80973 ?auto_80975 ) ) ( not ( = ?auto_80973 ?auto_80976 ) ) ( not ( = ?auto_80973 ?auto_80977 ) ) ( not ( = ?auto_80974 ?auto_80975 ) ) ( not ( = ?auto_80974 ?auto_80976 ) ) ( not ( = ?auto_80974 ?auto_80977 ) ) ( not ( = ?auto_80975 ?auto_80976 ) ) ( not ( = ?auto_80975 ?auto_80977 ) ) ( not ( = ?auto_80976 ?auto_80977 ) ) ( ON ?auto_80977 ?auto_80980 ) ( not ( = ?auto_80973 ?auto_80980 ) ) ( not ( = ?auto_80974 ?auto_80980 ) ) ( not ( = ?auto_80975 ?auto_80980 ) ) ( not ( = ?auto_80976 ?auto_80980 ) ) ( not ( = ?auto_80977 ?auto_80980 ) ) ( ON ?auto_80976 ?auto_80977 ) ( ON-TABLE ?auto_80978 ) ( ON ?auto_80980 ?auto_80978 ) ( not ( = ?auto_80978 ?auto_80980 ) ) ( not ( = ?auto_80978 ?auto_80977 ) ) ( not ( = ?auto_80978 ?auto_80976 ) ) ( not ( = ?auto_80973 ?auto_80978 ) ) ( not ( = ?auto_80974 ?auto_80978 ) ) ( not ( = ?auto_80975 ?auto_80978 ) ) ( ON ?auto_80973 ?auto_80979 ) ( not ( = ?auto_80973 ?auto_80979 ) ) ( not ( = ?auto_80974 ?auto_80979 ) ) ( not ( = ?auto_80975 ?auto_80979 ) ) ( not ( = ?auto_80976 ?auto_80979 ) ) ( not ( = ?auto_80977 ?auto_80979 ) ) ( not ( = ?auto_80980 ?auto_80979 ) ) ( not ( = ?auto_80978 ?auto_80979 ) ) ( ON ?auto_80974 ?auto_80973 ) ( ON-TABLE ?auto_80979 ) ( CLEAR ?auto_80976 ) ( ON ?auto_80975 ?auto_80974 ) ( CLEAR ?auto_80975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_80979 ?auto_80973 ?auto_80974 )
      ( MAKE-5PILE ?auto_80973 ?auto_80974 ?auto_80975 ?auto_80976 ?auto_80977 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80981 - BLOCK
      ?auto_80982 - BLOCK
      ?auto_80983 - BLOCK
      ?auto_80984 - BLOCK
      ?auto_80985 - BLOCK
    )
    :vars
    (
      ?auto_80986 - BLOCK
      ?auto_80987 - BLOCK
      ?auto_80988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80981 ?auto_80982 ) ) ( not ( = ?auto_80981 ?auto_80983 ) ) ( not ( = ?auto_80981 ?auto_80984 ) ) ( not ( = ?auto_80981 ?auto_80985 ) ) ( not ( = ?auto_80982 ?auto_80983 ) ) ( not ( = ?auto_80982 ?auto_80984 ) ) ( not ( = ?auto_80982 ?auto_80985 ) ) ( not ( = ?auto_80983 ?auto_80984 ) ) ( not ( = ?auto_80983 ?auto_80985 ) ) ( not ( = ?auto_80984 ?auto_80985 ) ) ( ON ?auto_80985 ?auto_80986 ) ( not ( = ?auto_80981 ?auto_80986 ) ) ( not ( = ?auto_80982 ?auto_80986 ) ) ( not ( = ?auto_80983 ?auto_80986 ) ) ( not ( = ?auto_80984 ?auto_80986 ) ) ( not ( = ?auto_80985 ?auto_80986 ) ) ( ON-TABLE ?auto_80987 ) ( ON ?auto_80986 ?auto_80987 ) ( not ( = ?auto_80987 ?auto_80986 ) ) ( not ( = ?auto_80987 ?auto_80985 ) ) ( not ( = ?auto_80987 ?auto_80984 ) ) ( not ( = ?auto_80981 ?auto_80987 ) ) ( not ( = ?auto_80982 ?auto_80987 ) ) ( not ( = ?auto_80983 ?auto_80987 ) ) ( ON ?auto_80981 ?auto_80988 ) ( not ( = ?auto_80981 ?auto_80988 ) ) ( not ( = ?auto_80982 ?auto_80988 ) ) ( not ( = ?auto_80983 ?auto_80988 ) ) ( not ( = ?auto_80984 ?auto_80988 ) ) ( not ( = ?auto_80985 ?auto_80988 ) ) ( not ( = ?auto_80986 ?auto_80988 ) ) ( not ( = ?auto_80987 ?auto_80988 ) ) ( ON ?auto_80982 ?auto_80981 ) ( ON-TABLE ?auto_80988 ) ( ON ?auto_80983 ?auto_80982 ) ( CLEAR ?auto_80983 ) ( HOLDING ?auto_80984 ) ( CLEAR ?auto_80985 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80987 ?auto_80986 ?auto_80985 ?auto_80984 )
      ( MAKE-5PILE ?auto_80981 ?auto_80982 ?auto_80983 ?auto_80984 ?auto_80985 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80989 - BLOCK
      ?auto_80990 - BLOCK
      ?auto_80991 - BLOCK
      ?auto_80992 - BLOCK
      ?auto_80993 - BLOCK
    )
    :vars
    (
      ?auto_80995 - BLOCK
      ?auto_80996 - BLOCK
      ?auto_80994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80989 ?auto_80990 ) ) ( not ( = ?auto_80989 ?auto_80991 ) ) ( not ( = ?auto_80989 ?auto_80992 ) ) ( not ( = ?auto_80989 ?auto_80993 ) ) ( not ( = ?auto_80990 ?auto_80991 ) ) ( not ( = ?auto_80990 ?auto_80992 ) ) ( not ( = ?auto_80990 ?auto_80993 ) ) ( not ( = ?auto_80991 ?auto_80992 ) ) ( not ( = ?auto_80991 ?auto_80993 ) ) ( not ( = ?auto_80992 ?auto_80993 ) ) ( ON ?auto_80993 ?auto_80995 ) ( not ( = ?auto_80989 ?auto_80995 ) ) ( not ( = ?auto_80990 ?auto_80995 ) ) ( not ( = ?auto_80991 ?auto_80995 ) ) ( not ( = ?auto_80992 ?auto_80995 ) ) ( not ( = ?auto_80993 ?auto_80995 ) ) ( ON-TABLE ?auto_80996 ) ( ON ?auto_80995 ?auto_80996 ) ( not ( = ?auto_80996 ?auto_80995 ) ) ( not ( = ?auto_80996 ?auto_80993 ) ) ( not ( = ?auto_80996 ?auto_80992 ) ) ( not ( = ?auto_80989 ?auto_80996 ) ) ( not ( = ?auto_80990 ?auto_80996 ) ) ( not ( = ?auto_80991 ?auto_80996 ) ) ( ON ?auto_80989 ?auto_80994 ) ( not ( = ?auto_80989 ?auto_80994 ) ) ( not ( = ?auto_80990 ?auto_80994 ) ) ( not ( = ?auto_80991 ?auto_80994 ) ) ( not ( = ?auto_80992 ?auto_80994 ) ) ( not ( = ?auto_80993 ?auto_80994 ) ) ( not ( = ?auto_80995 ?auto_80994 ) ) ( not ( = ?auto_80996 ?auto_80994 ) ) ( ON ?auto_80990 ?auto_80989 ) ( ON-TABLE ?auto_80994 ) ( ON ?auto_80991 ?auto_80990 ) ( CLEAR ?auto_80993 ) ( ON ?auto_80992 ?auto_80991 ) ( CLEAR ?auto_80992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_80994 ?auto_80989 ?auto_80990 ?auto_80991 )
      ( MAKE-5PILE ?auto_80989 ?auto_80990 ?auto_80991 ?auto_80992 ?auto_80993 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_80997 - BLOCK
      ?auto_80998 - BLOCK
      ?auto_80999 - BLOCK
      ?auto_81000 - BLOCK
      ?auto_81001 - BLOCK
    )
    :vars
    (
      ?auto_81003 - BLOCK
      ?auto_81004 - BLOCK
      ?auto_81002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_80997 ?auto_80998 ) ) ( not ( = ?auto_80997 ?auto_80999 ) ) ( not ( = ?auto_80997 ?auto_81000 ) ) ( not ( = ?auto_80997 ?auto_81001 ) ) ( not ( = ?auto_80998 ?auto_80999 ) ) ( not ( = ?auto_80998 ?auto_81000 ) ) ( not ( = ?auto_80998 ?auto_81001 ) ) ( not ( = ?auto_80999 ?auto_81000 ) ) ( not ( = ?auto_80999 ?auto_81001 ) ) ( not ( = ?auto_81000 ?auto_81001 ) ) ( not ( = ?auto_80997 ?auto_81003 ) ) ( not ( = ?auto_80998 ?auto_81003 ) ) ( not ( = ?auto_80999 ?auto_81003 ) ) ( not ( = ?auto_81000 ?auto_81003 ) ) ( not ( = ?auto_81001 ?auto_81003 ) ) ( ON-TABLE ?auto_81004 ) ( ON ?auto_81003 ?auto_81004 ) ( not ( = ?auto_81004 ?auto_81003 ) ) ( not ( = ?auto_81004 ?auto_81001 ) ) ( not ( = ?auto_81004 ?auto_81000 ) ) ( not ( = ?auto_80997 ?auto_81004 ) ) ( not ( = ?auto_80998 ?auto_81004 ) ) ( not ( = ?auto_80999 ?auto_81004 ) ) ( ON ?auto_80997 ?auto_81002 ) ( not ( = ?auto_80997 ?auto_81002 ) ) ( not ( = ?auto_80998 ?auto_81002 ) ) ( not ( = ?auto_80999 ?auto_81002 ) ) ( not ( = ?auto_81000 ?auto_81002 ) ) ( not ( = ?auto_81001 ?auto_81002 ) ) ( not ( = ?auto_81003 ?auto_81002 ) ) ( not ( = ?auto_81004 ?auto_81002 ) ) ( ON ?auto_80998 ?auto_80997 ) ( ON-TABLE ?auto_81002 ) ( ON ?auto_80999 ?auto_80998 ) ( ON ?auto_81000 ?auto_80999 ) ( CLEAR ?auto_81000 ) ( HOLDING ?auto_81001 ) ( CLEAR ?auto_81003 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81004 ?auto_81003 ?auto_81001 )
      ( MAKE-5PILE ?auto_80997 ?auto_80998 ?auto_80999 ?auto_81000 ?auto_81001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81005 - BLOCK
      ?auto_81006 - BLOCK
      ?auto_81007 - BLOCK
      ?auto_81008 - BLOCK
      ?auto_81009 - BLOCK
    )
    :vars
    (
      ?auto_81010 - BLOCK
      ?auto_81012 - BLOCK
      ?auto_81011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81005 ?auto_81006 ) ) ( not ( = ?auto_81005 ?auto_81007 ) ) ( not ( = ?auto_81005 ?auto_81008 ) ) ( not ( = ?auto_81005 ?auto_81009 ) ) ( not ( = ?auto_81006 ?auto_81007 ) ) ( not ( = ?auto_81006 ?auto_81008 ) ) ( not ( = ?auto_81006 ?auto_81009 ) ) ( not ( = ?auto_81007 ?auto_81008 ) ) ( not ( = ?auto_81007 ?auto_81009 ) ) ( not ( = ?auto_81008 ?auto_81009 ) ) ( not ( = ?auto_81005 ?auto_81010 ) ) ( not ( = ?auto_81006 ?auto_81010 ) ) ( not ( = ?auto_81007 ?auto_81010 ) ) ( not ( = ?auto_81008 ?auto_81010 ) ) ( not ( = ?auto_81009 ?auto_81010 ) ) ( ON-TABLE ?auto_81012 ) ( ON ?auto_81010 ?auto_81012 ) ( not ( = ?auto_81012 ?auto_81010 ) ) ( not ( = ?auto_81012 ?auto_81009 ) ) ( not ( = ?auto_81012 ?auto_81008 ) ) ( not ( = ?auto_81005 ?auto_81012 ) ) ( not ( = ?auto_81006 ?auto_81012 ) ) ( not ( = ?auto_81007 ?auto_81012 ) ) ( ON ?auto_81005 ?auto_81011 ) ( not ( = ?auto_81005 ?auto_81011 ) ) ( not ( = ?auto_81006 ?auto_81011 ) ) ( not ( = ?auto_81007 ?auto_81011 ) ) ( not ( = ?auto_81008 ?auto_81011 ) ) ( not ( = ?auto_81009 ?auto_81011 ) ) ( not ( = ?auto_81010 ?auto_81011 ) ) ( not ( = ?auto_81012 ?auto_81011 ) ) ( ON ?auto_81006 ?auto_81005 ) ( ON-TABLE ?auto_81011 ) ( ON ?auto_81007 ?auto_81006 ) ( ON ?auto_81008 ?auto_81007 ) ( CLEAR ?auto_81010 ) ( ON ?auto_81009 ?auto_81008 ) ( CLEAR ?auto_81009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81011 ?auto_81005 ?auto_81006 ?auto_81007 ?auto_81008 )
      ( MAKE-5PILE ?auto_81005 ?auto_81006 ?auto_81007 ?auto_81008 ?auto_81009 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81013 - BLOCK
      ?auto_81014 - BLOCK
      ?auto_81015 - BLOCK
      ?auto_81016 - BLOCK
      ?auto_81017 - BLOCK
    )
    :vars
    (
      ?auto_81018 - BLOCK
      ?auto_81019 - BLOCK
      ?auto_81020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81013 ?auto_81014 ) ) ( not ( = ?auto_81013 ?auto_81015 ) ) ( not ( = ?auto_81013 ?auto_81016 ) ) ( not ( = ?auto_81013 ?auto_81017 ) ) ( not ( = ?auto_81014 ?auto_81015 ) ) ( not ( = ?auto_81014 ?auto_81016 ) ) ( not ( = ?auto_81014 ?auto_81017 ) ) ( not ( = ?auto_81015 ?auto_81016 ) ) ( not ( = ?auto_81015 ?auto_81017 ) ) ( not ( = ?auto_81016 ?auto_81017 ) ) ( not ( = ?auto_81013 ?auto_81018 ) ) ( not ( = ?auto_81014 ?auto_81018 ) ) ( not ( = ?auto_81015 ?auto_81018 ) ) ( not ( = ?auto_81016 ?auto_81018 ) ) ( not ( = ?auto_81017 ?auto_81018 ) ) ( ON-TABLE ?auto_81019 ) ( not ( = ?auto_81019 ?auto_81018 ) ) ( not ( = ?auto_81019 ?auto_81017 ) ) ( not ( = ?auto_81019 ?auto_81016 ) ) ( not ( = ?auto_81013 ?auto_81019 ) ) ( not ( = ?auto_81014 ?auto_81019 ) ) ( not ( = ?auto_81015 ?auto_81019 ) ) ( ON ?auto_81013 ?auto_81020 ) ( not ( = ?auto_81013 ?auto_81020 ) ) ( not ( = ?auto_81014 ?auto_81020 ) ) ( not ( = ?auto_81015 ?auto_81020 ) ) ( not ( = ?auto_81016 ?auto_81020 ) ) ( not ( = ?auto_81017 ?auto_81020 ) ) ( not ( = ?auto_81018 ?auto_81020 ) ) ( not ( = ?auto_81019 ?auto_81020 ) ) ( ON ?auto_81014 ?auto_81013 ) ( ON-TABLE ?auto_81020 ) ( ON ?auto_81015 ?auto_81014 ) ( ON ?auto_81016 ?auto_81015 ) ( ON ?auto_81017 ?auto_81016 ) ( CLEAR ?auto_81017 ) ( HOLDING ?auto_81018 ) ( CLEAR ?auto_81019 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81019 ?auto_81018 )
      ( MAKE-5PILE ?auto_81013 ?auto_81014 ?auto_81015 ?auto_81016 ?auto_81017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81021 - BLOCK
      ?auto_81022 - BLOCK
      ?auto_81023 - BLOCK
      ?auto_81024 - BLOCK
      ?auto_81025 - BLOCK
    )
    :vars
    (
      ?auto_81026 - BLOCK
      ?auto_81028 - BLOCK
      ?auto_81027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81021 ?auto_81022 ) ) ( not ( = ?auto_81021 ?auto_81023 ) ) ( not ( = ?auto_81021 ?auto_81024 ) ) ( not ( = ?auto_81021 ?auto_81025 ) ) ( not ( = ?auto_81022 ?auto_81023 ) ) ( not ( = ?auto_81022 ?auto_81024 ) ) ( not ( = ?auto_81022 ?auto_81025 ) ) ( not ( = ?auto_81023 ?auto_81024 ) ) ( not ( = ?auto_81023 ?auto_81025 ) ) ( not ( = ?auto_81024 ?auto_81025 ) ) ( not ( = ?auto_81021 ?auto_81026 ) ) ( not ( = ?auto_81022 ?auto_81026 ) ) ( not ( = ?auto_81023 ?auto_81026 ) ) ( not ( = ?auto_81024 ?auto_81026 ) ) ( not ( = ?auto_81025 ?auto_81026 ) ) ( ON-TABLE ?auto_81028 ) ( not ( = ?auto_81028 ?auto_81026 ) ) ( not ( = ?auto_81028 ?auto_81025 ) ) ( not ( = ?auto_81028 ?auto_81024 ) ) ( not ( = ?auto_81021 ?auto_81028 ) ) ( not ( = ?auto_81022 ?auto_81028 ) ) ( not ( = ?auto_81023 ?auto_81028 ) ) ( ON ?auto_81021 ?auto_81027 ) ( not ( = ?auto_81021 ?auto_81027 ) ) ( not ( = ?auto_81022 ?auto_81027 ) ) ( not ( = ?auto_81023 ?auto_81027 ) ) ( not ( = ?auto_81024 ?auto_81027 ) ) ( not ( = ?auto_81025 ?auto_81027 ) ) ( not ( = ?auto_81026 ?auto_81027 ) ) ( not ( = ?auto_81028 ?auto_81027 ) ) ( ON ?auto_81022 ?auto_81021 ) ( ON-TABLE ?auto_81027 ) ( ON ?auto_81023 ?auto_81022 ) ( ON ?auto_81024 ?auto_81023 ) ( ON ?auto_81025 ?auto_81024 ) ( CLEAR ?auto_81028 ) ( ON ?auto_81026 ?auto_81025 ) ( CLEAR ?auto_81026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81027 ?auto_81021 ?auto_81022 ?auto_81023 ?auto_81024 ?auto_81025 )
      ( MAKE-5PILE ?auto_81021 ?auto_81022 ?auto_81023 ?auto_81024 ?auto_81025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81029 - BLOCK
      ?auto_81030 - BLOCK
      ?auto_81031 - BLOCK
      ?auto_81032 - BLOCK
      ?auto_81033 - BLOCK
    )
    :vars
    (
      ?auto_81036 - BLOCK
      ?auto_81035 - BLOCK
      ?auto_81034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81029 ?auto_81030 ) ) ( not ( = ?auto_81029 ?auto_81031 ) ) ( not ( = ?auto_81029 ?auto_81032 ) ) ( not ( = ?auto_81029 ?auto_81033 ) ) ( not ( = ?auto_81030 ?auto_81031 ) ) ( not ( = ?auto_81030 ?auto_81032 ) ) ( not ( = ?auto_81030 ?auto_81033 ) ) ( not ( = ?auto_81031 ?auto_81032 ) ) ( not ( = ?auto_81031 ?auto_81033 ) ) ( not ( = ?auto_81032 ?auto_81033 ) ) ( not ( = ?auto_81029 ?auto_81036 ) ) ( not ( = ?auto_81030 ?auto_81036 ) ) ( not ( = ?auto_81031 ?auto_81036 ) ) ( not ( = ?auto_81032 ?auto_81036 ) ) ( not ( = ?auto_81033 ?auto_81036 ) ) ( not ( = ?auto_81035 ?auto_81036 ) ) ( not ( = ?auto_81035 ?auto_81033 ) ) ( not ( = ?auto_81035 ?auto_81032 ) ) ( not ( = ?auto_81029 ?auto_81035 ) ) ( not ( = ?auto_81030 ?auto_81035 ) ) ( not ( = ?auto_81031 ?auto_81035 ) ) ( ON ?auto_81029 ?auto_81034 ) ( not ( = ?auto_81029 ?auto_81034 ) ) ( not ( = ?auto_81030 ?auto_81034 ) ) ( not ( = ?auto_81031 ?auto_81034 ) ) ( not ( = ?auto_81032 ?auto_81034 ) ) ( not ( = ?auto_81033 ?auto_81034 ) ) ( not ( = ?auto_81036 ?auto_81034 ) ) ( not ( = ?auto_81035 ?auto_81034 ) ) ( ON ?auto_81030 ?auto_81029 ) ( ON-TABLE ?auto_81034 ) ( ON ?auto_81031 ?auto_81030 ) ( ON ?auto_81032 ?auto_81031 ) ( ON ?auto_81033 ?auto_81032 ) ( ON ?auto_81036 ?auto_81033 ) ( CLEAR ?auto_81036 ) ( HOLDING ?auto_81035 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81035 )
      ( MAKE-5PILE ?auto_81029 ?auto_81030 ?auto_81031 ?auto_81032 ?auto_81033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81037 - BLOCK
      ?auto_81038 - BLOCK
      ?auto_81039 - BLOCK
      ?auto_81040 - BLOCK
      ?auto_81041 - BLOCK
    )
    :vars
    (
      ?auto_81044 - BLOCK
      ?auto_81043 - BLOCK
      ?auto_81042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81037 ?auto_81038 ) ) ( not ( = ?auto_81037 ?auto_81039 ) ) ( not ( = ?auto_81037 ?auto_81040 ) ) ( not ( = ?auto_81037 ?auto_81041 ) ) ( not ( = ?auto_81038 ?auto_81039 ) ) ( not ( = ?auto_81038 ?auto_81040 ) ) ( not ( = ?auto_81038 ?auto_81041 ) ) ( not ( = ?auto_81039 ?auto_81040 ) ) ( not ( = ?auto_81039 ?auto_81041 ) ) ( not ( = ?auto_81040 ?auto_81041 ) ) ( not ( = ?auto_81037 ?auto_81044 ) ) ( not ( = ?auto_81038 ?auto_81044 ) ) ( not ( = ?auto_81039 ?auto_81044 ) ) ( not ( = ?auto_81040 ?auto_81044 ) ) ( not ( = ?auto_81041 ?auto_81044 ) ) ( not ( = ?auto_81043 ?auto_81044 ) ) ( not ( = ?auto_81043 ?auto_81041 ) ) ( not ( = ?auto_81043 ?auto_81040 ) ) ( not ( = ?auto_81037 ?auto_81043 ) ) ( not ( = ?auto_81038 ?auto_81043 ) ) ( not ( = ?auto_81039 ?auto_81043 ) ) ( ON ?auto_81037 ?auto_81042 ) ( not ( = ?auto_81037 ?auto_81042 ) ) ( not ( = ?auto_81038 ?auto_81042 ) ) ( not ( = ?auto_81039 ?auto_81042 ) ) ( not ( = ?auto_81040 ?auto_81042 ) ) ( not ( = ?auto_81041 ?auto_81042 ) ) ( not ( = ?auto_81044 ?auto_81042 ) ) ( not ( = ?auto_81043 ?auto_81042 ) ) ( ON ?auto_81038 ?auto_81037 ) ( ON-TABLE ?auto_81042 ) ( ON ?auto_81039 ?auto_81038 ) ( ON ?auto_81040 ?auto_81039 ) ( ON ?auto_81041 ?auto_81040 ) ( ON ?auto_81044 ?auto_81041 ) ( ON ?auto_81043 ?auto_81044 ) ( CLEAR ?auto_81043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81042 ?auto_81037 ?auto_81038 ?auto_81039 ?auto_81040 ?auto_81041 ?auto_81044 )
      ( MAKE-5PILE ?auto_81037 ?auto_81038 ?auto_81039 ?auto_81040 ?auto_81041 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81056 - BLOCK
    )
    :vars
    (
      ?auto_81058 - BLOCK
      ?auto_81059 - BLOCK
      ?auto_81057 - BLOCK
      ?auto_81060 - BLOCK
      ?auto_81062 - BLOCK
      ?auto_81061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81058 ?auto_81056 ) ( ON-TABLE ?auto_81056 ) ( not ( = ?auto_81056 ?auto_81058 ) ) ( not ( = ?auto_81056 ?auto_81059 ) ) ( not ( = ?auto_81056 ?auto_81057 ) ) ( not ( = ?auto_81058 ?auto_81059 ) ) ( not ( = ?auto_81058 ?auto_81057 ) ) ( not ( = ?auto_81059 ?auto_81057 ) ) ( ON ?auto_81059 ?auto_81058 ) ( CLEAR ?auto_81059 ) ( HOLDING ?auto_81057 ) ( CLEAR ?auto_81060 ) ( ON-TABLE ?auto_81062 ) ( ON ?auto_81061 ?auto_81062 ) ( ON ?auto_81060 ?auto_81061 ) ( not ( = ?auto_81062 ?auto_81061 ) ) ( not ( = ?auto_81062 ?auto_81060 ) ) ( not ( = ?auto_81062 ?auto_81057 ) ) ( not ( = ?auto_81061 ?auto_81060 ) ) ( not ( = ?auto_81061 ?auto_81057 ) ) ( not ( = ?auto_81060 ?auto_81057 ) ) ( not ( = ?auto_81056 ?auto_81060 ) ) ( not ( = ?auto_81056 ?auto_81062 ) ) ( not ( = ?auto_81056 ?auto_81061 ) ) ( not ( = ?auto_81058 ?auto_81060 ) ) ( not ( = ?auto_81058 ?auto_81062 ) ) ( not ( = ?auto_81058 ?auto_81061 ) ) ( not ( = ?auto_81059 ?auto_81060 ) ) ( not ( = ?auto_81059 ?auto_81062 ) ) ( not ( = ?auto_81059 ?auto_81061 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81062 ?auto_81061 ?auto_81060 ?auto_81057 )
      ( MAKE-1PILE ?auto_81056 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81063 - BLOCK
    )
    :vars
    (
      ?auto_81068 - BLOCK
      ?auto_81069 - BLOCK
      ?auto_81067 - BLOCK
      ?auto_81066 - BLOCK
      ?auto_81064 - BLOCK
      ?auto_81065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81068 ?auto_81063 ) ( ON-TABLE ?auto_81063 ) ( not ( = ?auto_81063 ?auto_81068 ) ) ( not ( = ?auto_81063 ?auto_81069 ) ) ( not ( = ?auto_81063 ?auto_81067 ) ) ( not ( = ?auto_81068 ?auto_81069 ) ) ( not ( = ?auto_81068 ?auto_81067 ) ) ( not ( = ?auto_81069 ?auto_81067 ) ) ( ON ?auto_81069 ?auto_81068 ) ( CLEAR ?auto_81066 ) ( ON-TABLE ?auto_81064 ) ( ON ?auto_81065 ?auto_81064 ) ( ON ?auto_81066 ?auto_81065 ) ( not ( = ?auto_81064 ?auto_81065 ) ) ( not ( = ?auto_81064 ?auto_81066 ) ) ( not ( = ?auto_81064 ?auto_81067 ) ) ( not ( = ?auto_81065 ?auto_81066 ) ) ( not ( = ?auto_81065 ?auto_81067 ) ) ( not ( = ?auto_81066 ?auto_81067 ) ) ( not ( = ?auto_81063 ?auto_81066 ) ) ( not ( = ?auto_81063 ?auto_81064 ) ) ( not ( = ?auto_81063 ?auto_81065 ) ) ( not ( = ?auto_81068 ?auto_81066 ) ) ( not ( = ?auto_81068 ?auto_81064 ) ) ( not ( = ?auto_81068 ?auto_81065 ) ) ( not ( = ?auto_81069 ?auto_81066 ) ) ( not ( = ?auto_81069 ?auto_81064 ) ) ( not ( = ?auto_81069 ?auto_81065 ) ) ( ON ?auto_81067 ?auto_81069 ) ( CLEAR ?auto_81067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81063 ?auto_81068 ?auto_81069 )
      ( MAKE-1PILE ?auto_81063 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81070 - BLOCK
    )
    :vars
    (
      ?auto_81074 - BLOCK
      ?auto_81076 - BLOCK
      ?auto_81071 - BLOCK
      ?auto_81075 - BLOCK
      ?auto_81072 - BLOCK
      ?auto_81073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81074 ?auto_81070 ) ( ON-TABLE ?auto_81070 ) ( not ( = ?auto_81070 ?auto_81074 ) ) ( not ( = ?auto_81070 ?auto_81076 ) ) ( not ( = ?auto_81070 ?auto_81071 ) ) ( not ( = ?auto_81074 ?auto_81076 ) ) ( not ( = ?auto_81074 ?auto_81071 ) ) ( not ( = ?auto_81076 ?auto_81071 ) ) ( ON ?auto_81076 ?auto_81074 ) ( ON-TABLE ?auto_81075 ) ( ON ?auto_81072 ?auto_81075 ) ( not ( = ?auto_81075 ?auto_81072 ) ) ( not ( = ?auto_81075 ?auto_81073 ) ) ( not ( = ?auto_81075 ?auto_81071 ) ) ( not ( = ?auto_81072 ?auto_81073 ) ) ( not ( = ?auto_81072 ?auto_81071 ) ) ( not ( = ?auto_81073 ?auto_81071 ) ) ( not ( = ?auto_81070 ?auto_81073 ) ) ( not ( = ?auto_81070 ?auto_81075 ) ) ( not ( = ?auto_81070 ?auto_81072 ) ) ( not ( = ?auto_81074 ?auto_81073 ) ) ( not ( = ?auto_81074 ?auto_81075 ) ) ( not ( = ?auto_81074 ?auto_81072 ) ) ( not ( = ?auto_81076 ?auto_81073 ) ) ( not ( = ?auto_81076 ?auto_81075 ) ) ( not ( = ?auto_81076 ?auto_81072 ) ) ( ON ?auto_81071 ?auto_81076 ) ( CLEAR ?auto_81071 ) ( HOLDING ?auto_81073 ) ( CLEAR ?auto_81072 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81075 ?auto_81072 ?auto_81073 )
      ( MAKE-1PILE ?auto_81070 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81077 - BLOCK
    )
    :vars
    (
      ?auto_81082 - BLOCK
      ?auto_81081 - BLOCK
      ?auto_81079 - BLOCK
      ?auto_81080 - BLOCK
      ?auto_81083 - BLOCK
      ?auto_81078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81082 ?auto_81077 ) ( ON-TABLE ?auto_81077 ) ( not ( = ?auto_81077 ?auto_81082 ) ) ( not ( = ?auto_81077 ?auto_81081 ) ) ( not ( = ?auto_81077 ?auto_81079 ) ) ( not ( = ?auto_81082 ?auto_81081 ) ) ( not ( = ?auto_81082 ?auto_81079 ) ) ( not ( = ?auto_81081 ?auto_81079 ) ) ( ON ?auto_81081 ?auto_81082 ) ( ON-TABLE ?auto_81080 ) ( ON ?auto_81083 ?auto_81080 ) ( not ( = ?auto_81080 ?auto_81083 ) ) ( not ( = ?auto_81080 ?auto_81078 ) ) ( not ( = ?auto_81080 ?auto_81079 ) ) ( not ( = ?auto_81083 ?auto_81078 ) ) ( not ( = ?auto_81083 ?auto_81079 ) ) ( not ( = ?auto_81078 ?auto_81079 ) ) ( not ( = ?auto_81077 ?auto_81078 ) ) ( not ( = ?auto_81077 ?auto_81080 ) ) ( not ( = ?auto_81077 ?auto_81083 ) ) ( not ( = ?auto_81082 ?auto_81078 ) ) ( not ( = ?auto_81082 ?auto_81080 ) ) ( not ( = ?auto_81082 ?auto_81083 ) ) ( not ( = ?auto_81081 ?auto_81078 ) ) ( not ( = ?auto_81081 ?auto_81080 ) ) ( not ( = ?auto_81081 ?auto_81083 ) ) ( ON ?auto_81079 ?auto_81081 ) ( CLEAR ?auto_81083 ) ( ON ?auto_81078 ?auto_81079 ) ( CLEAR ?auto_81078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81077 ?auto_81082 ?auto_81081 ?auto_81079 )
      ( MAKE-1PILE ?auto_81077 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81084 - BLOCK
    )
    :vars
    (
      ?auto_81087 - BLOCK
      ?auto_81089 - BLOCK
      ?auto_81088 - BLOCK
      ?auto_81086 - BLOCK
      ?auto_81085 - BLOCK
      ?auto_81090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81087 ?auto_81084 ) ( ON-TABLE ?auto_81084 ) ( not ( = ?auto_81084 ?auto_81087 ) ) ( not ( = ?auto_81084 ?auto_81089 ) ) ( not ( = ?auto_81084 ?auto_81088 ) ) ( not ( = ?auto_81087 ?auto_81089 ) ) ( not ( = ?auto_81087 ?auto_81088 ) ) ( not ( = ?auto_81089 ?auto_81088 ) ) ( ON ?auto_81089 ?auto_81087 ) ( ON-TABLE ?auto_81086 ) ( not ( = ?auto_81086 ?auto_81085 ) ) ( not ( = ?auto_81086 ?auto_81090 ) ) ( not ( = ?auto_81086 ?auto_81088 ) ) ( not ( = ?auto_81085 ?auto_81090 ) ) ( not ( = ?auto_81085 ?auto_81088 ) ) ( not ( = ?auto_81090 ?auto_81088 ) ) ( not ( = ?auto_81084 ?auto_81090 ) ) ( not ( = ?auto_81084 ?auto_81086 ) ) ( not ( = ?auto_81084 ?auto_81085 ) ) ( not ( = ?auto_81087 ?auto_81090 ) ) ( not ( = ?auto_81087 ?auto_81086 ) ) ( not ( = ?auto_81087 ?auto_81085 ) ) ( not ( = ?auto_81089 ?auto_81090 ) ) ( not ( = ?auto_81089 ?auto_81086 ) ) ( not ( = ?auto_81089 ?auto_81085 ) ) ( ON ?auto_81088 ?auto_81089 ) ( ON ?auto_81090 ?auto_81088 ) ( CLEAR ?auto_81090 ) ( HOLDING ?auto_81085 ) ( CLEAR ?auto_81086 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81086 ?auto_81085 )
      ( MAKE-1PILE ?auto_81084 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81091 - BLOCK
    )
    :vars
    (
      ?auto_81096 - BLOCK
      ?auto_81092 - BLOCK
      ?auto_81095 - BLOCK
      ?auto_81097 - BLOCK
      ?auto_81093 - BLOCK
      ?auto_81094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81096 ?auto_81091 ) ( ON-TABLE ?auto_81091 ) ( not ( = ?auto_81091 ?auto_81096 ) ) ( not ( = ?auto_81091 ?auto_81092 ) ) ( not ( = ?auto_81091 ?auto_81095 ) ) ( not ( = ?auto_81096 ?auto_81092 ) ) ( not ( = ?auto_81096 ?auto_81095 ) ) ( not ( = ?auto_81092 ?auto_81095 ) ) ( ON ?auto_81092 ?auto_81096 ) ( ON-TABLE ?auto_81097 ) ( not ( = ?auto_81097 ?auto_81093 ) ) ( not ( = ?auto_81097 ?auto_81094 ) ) ( not ( = ?auto_81097 ?auto_81095 ) ) ( not ( = ?auto_81093 ?auto_81094 ) ) ( not ( = ?auto_81093 ?auto_81095 ) ) ( not ( = ?auto_81094 ?auto_81095 ) ) ( not ( = ?auto_81091 ?auto_81094 ) ) ( not ( = ?auto_81091 ?auto_81097 ) ) ( not ( = ?auto_81091 ?auto_81093 ) ) ( not ( = ?auto_81096 ?auto_81094 ) ) ( not ( = ?auto_81096 ?auto_81097 ) ) ( not ( = ?auto_81096 ?auto_81093 ) ) ( not ( = ?auto_81092 ?auto_81094 ) ) ( not ( = ?auto_81092 ?auto_81097 ) ) ( not ( = ?auto_81092 ?auto_81093 ) ) ( ON ?auto_81095 ?auto_81092 ) ( ON ?auto_81094 ?auto_81095 ) ( CLEAR ?auto_81097 ) ( ON ?auto_81093 ?auto_81094 ) ( CLEAR ?auto_81093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81091 ?auto_81096 ?auto_81092 ?auto_81095 ?auto_81094 )
      ( MAKE-1PILE ?auto_81091 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81098 - BLOCK
    )
    :vars
    (
      ?auto_81102 - BLOCK
      ?auto_81103 - BLOCK
      ?auto_81104 - BLOCK
      ?auto_81101 - BLOCK
      ?auto_81100 - BLOCK
      ?auto_81099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81102 ?auto_81098 ) ( ON-TABLE ?auto_81098 ) ( not ( = ?auto_81098 ?auto_81102 ) ) ( not ( = ?auto_81098 ?auto_81103 ) ) ( not ( = ?auto_81098 ?auto_81104 ) ) ( not ( = ?auto_81102 ?auto_81103 ) ) ( not ( = ?auto_81102 ?auto_81104 ) ) ( not ( = ?auto_81103 ?auto_81104 ) ) ( ON ?auto_81103 ?auto_81102 ) ( not ( = ?auto_81101 ?auto_81100 ) ) ( not ( = ?auto_81101 ?auto_81099 ) ) ( not ( = ?auto_81101 ?auto_81104 ) ) ( not ( = ?auto_81100 ?auto_81099 ) ) ( not ( = ?auto_81100 ?auto_81104 ) ) ( not ( = ?auto_81099 ?auto_81104 ) ) ( not ( = ?auto_81098 ?auto_81099 ) ) ( not ( = ?auto_81098 ?auto_81101 ) ) ( not ( = ?auto_81098 ?auto_81100 ) ) ( not ( = ?auto_81102 ?auto_81099 ) ) ( not ( = ?auto_81102 ?auto_81101 ) ) ( not ( = ?auto_81102 ?auto_81100 ) ) ( not ( = ?auto_81103 ?auto_81099 ) ) ( not ( = ?auto_81103 ?auto_81101 ) ) ( not ( = ?auto_81103 ?auto_81100 ) ) ( ON ?auto_81104 ?auto_81103 ) ( ON ?auto_81099 ?auto_81104 ) ( ON ?auto_81100 ?auto_81099 ) ( CLEAR ?auto_81100 ) ( HOLDING ?auto_81101 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81101 )
      ( MAKE-1PILE ?auto_81098 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81113 - BLOCK
    )
    :vars
    (
      ?auto_81119 - BLOCK
      ?auto_81117 - BLOCK
      ?auto_81118 - BLOCK
      ?auto_81114 - BLOCK
      ?auto_81115 - BLOCK
      ?auto_81116 - BLOCK
      ?auto_81120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81119 ?auto_81113 ) ( ON-TABLE ?auto_81113 ) ( not ( = ?auto_81113 ?auto_81119 ) ) ( not ( = ?auto_81113 ?auto_81117 ) ) ( not ( = ?auto_81113 ?auto_81118 ) ) ( not ( = ?auto_81119 ?auto_81117 ) ) ( not ( = ?auto_81119 ?auto_81118 ) ) ( not ( = ?auto_81117 ?auto_81118 ) ) ( ON ?auto_81117 ?auto_81119 ) ( not ( = ?auto_81114 ?auto_81115 ) ) ( not ( = ?auto_81114 ?auto_81116 ) ) ( not ( = ?auto_81114 ?auto_81118 ) ) ( not ( = ?auto_81115 ?auto_81116 ) ) ( not ( = ?auto_81115 ?auto_81118 ) ) ( not ( = ?auto_81116 ?auto_81118 ) ) ( not ( = ?auto_81113 ?auto_81116 ) ) ( not ( = ?auto_81113 ?auto_81114 ) ) ( not ( = ?auto_81113 ?auto_81115 ) ) ( not ( = ?auto_81119 ?auto_81116 ) ) ( not ( = ?auto_81119 ?auto_81114 ) ) ( not ( = ?auto_81119 ?auto_81115 ) ) ( not ( = ?auto_81117 ?auto_81116 ) ) ( not ( = ?auto_81117 ?auto_81114 ) ) ( not ( = ?auto_81117 ?auto_81115 ) ) ( ON ?auto_81118 ?auto_81117 ) ( ON ?auto_81116 ?auto_81118 ) ( ON ?auto_81115 ?auto_81116 ) ( CLEAR ?auto_81115 ) ( ON ?auto_81114 ?auto_81120 ) ( CLEAR ?auto_81114 ) ( HAND-EMPTY ) ( not ( = ?auto_81113 ?auto_81120 ) ) ( not ( = ?auto_81119 ?auto_81120 ) ) ( not ( = ?auto_81117 ?auto_81120 ) ) ( not ( = ?auto_81118 ?auto_81120 ) ) ( not ( = ?auto_81114 ?auto_81120 ) ) ( not ( = ?auto_81115 ?auto_81120 ) ) ( not ( = ?auto_81116 ?auto_81120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81114 ?auto_81120 )
      ( MAKE-1PILE ?auto_81113 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81121 - BLOCK
    )
    :vars
    (
      ?auto_81124 - BLOCK
      ?auto_81125 - BLOCK
      ?auto_81128 - BLOCK
      ?auto_81123 - BLOCK
      ?auto_81122 - BLOCK
      ?auto_81127 - BLOCK
      ?auto_81126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81124 ?auto_81121 ) ( ON-TABLE ?auto_81121 ) ( not ( = ?auto_81121 ?auto_81124 ) ) ( not ( = ?auto_81121 ?auto_81125 ) ) ( not ( = ?auto_81121 ?auto_81128 ) ) ( not ( = ?auto_81124 ?auto_81125 ) ) ( not ( = ?auto_81124 ?auto_81128 ) ) ( not ( = ?auto_81125 ?auto_81128 ) ) ( ON ?auto_81125 ?auto_81124 ) ( not ( = ?auto_81123 ?auto_81122 ) ) ( not ( = ?auto_81123 ?auto_81127 ) ) ( not ( = ?auto_81123 ?auto_81128 ) ) ( not ( = ?auto_81122 ?auto_81127 ) ) ( not ( = ?auto_81122 ?auto_81128 ) ) ( not ( = ?auto_81127 ?auto_81128 ) ) ( not ( = ?auto_81121 ?auto_81127 ) ) ( not ( = ?auto_81121 ?auto_81123 ) ) ( not ( = ?auto_81121 ?auto_81122 ) ) ( not ( = ?auto_81124 ?auto_81127 ) ) ( not ( = ?auto_81124 ?auto_81123 ) ) ( not ( = ?auto_81124 ?auto_81122 ) ) ( not ( = ?auto_81125 ?auto_81127 ) ) ( not ( = ?auto_81125 ?auto_81123 ) ) ( not ( = ?auto_81125 ?auto_81122 ) ) ( ON ?auto_81128 ?auto_81125 ) ( ON ?auto_81127 ?auto_81128 ) ( ON ?auto_81123 ?auto_81126 ) ( CLEAR ?auto_81123 ) ( not ( = ?auto_81121 ?auto_81126 ) ) ( not ( = ?auto_81124 ?auto_81126 ) ) ( not ( = ?auto_81125 ?auto_81126 ) ) ( not ( = ?auto_81128 ?auto_81126 ) ) ( not ( = ?auto_81123 ?auto_81126 ) ) ( not ( = ?auto_81122 ?auto_81126 ) ) ( not ( = ?auto_81127 ?auto_81126 ) ) ( HOLDING ?auto_81122 ) ( CLEAR ?auto_81127 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81121 ?auto_81124 ?auto_81125 ?auto_81128 ?auto_81127 ?auto_81122 )
      ( MAKE-1PILE ?auto_81121 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81129 - BLOCK
    )
    :vars
    (
      ?auto_81134 - BLOCK
      ?auto_81130 - BLOCK
      ?auto_81136 - BLOCK
      ?auto_81133 - BLOCK
      ?auto_81132 - BLOCK
      ?auto_81131 - BLOCK
      ?auto_81135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81134 ?auto_81129 ) ( ON-TABLE ?auto_81129 ) ( not ( = ?auto_81129 ?auto_81134 ) ) ( not ( = ?auto_81129 ?auto_81130 ) ) ( not ( = ?auto_81129 ?auto_81136 ) ) ( not ( = ?auto_81134 ?auto_81130 ) ) ( not ( = ?auto_81134 ?auto_81136 ) ) ( not ( = ?auto_81130 ?auto_81136 ) ) ( ON ?auto_81130 ?auto_81134 ) ( not ( = ?auto_81133 ?auto_81132 ) ) ( not ( = ?auto_81133 ?auto_81131 ) ) ( not ( = ?auto_81133 ?auto_81136 ) ) ( not ( = ?auto_81132 ?auto_81131 ) ) ( not ( = ?auto_81132 ?auto_81136 ) ) ( not ( = ?auto_81131 ?auto_81136 ) ) ( not ( = ?auto_81129 ?auto_81131 ) ) ( not ( = ?auto_81129 ?auto_81133 ) ) ( not ( = ?auto_81129 ?auto_81132 ) ) ( not ( = ?auto_81134 ?auto_81131 ) ) ( not ( = ?auto_81134 ?auto_81133 ) ) ( not ( = ?auto_81134 ?auto_81132 ) ) ( not ( = ?auto_81130 ?auto_81131 ) ) ( not ( = ?auto_81130 ?auto_81133 ) ) ( not ( = ?auto_81130 ?auto_81132 ) ) ( ON ?auto_81136 ?auto_81130 ) ( ON ?auto_81131 ?auto_81136 ) ( ON ?auto_81133 ?auto_81135 ) ( not ( = ?auto_81129 ?auto_81135 ) ) ( not ( = ?auto_81134 ?auto_81135 ) ) ( not ( = ?auto_81130 ?auto_81135 ) ) ( not ( = ?auto_81136 ?auto_81135 ) ) ( not ( = ?auto_81133 ?auto_81135 ) ) ( not ( = ?auto_81132 ?auto_81135 ) ) ( not ( = ?auto_81131 ?auto_81135 ) ) ( CLEAR ?auto_81131 ) ( ON ?auto_81132 ?auto_81133 ) ( CLEAR ?auto_81132 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81135 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81135 ?auto_81133 )
      ( MAKE-1PILE ?auto_81129 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81137 - BLOCK
    )
    :vars
    (
      ?auto_81143 - BLOCK
      ?auto_81142 - BLOCK
      ?auto_81141 - BLOCK
      ?auto_81140 - BLOCK
      ?auto_81139 - BLOCK
      ?auto_81138 - BLOCK
      ?auto_81144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81143 ?auto_81137 ) ( ON-TABLE ?auto_81137 ) ( not ( = ?auto_81137 ?auto_81143 ) ) ( not ( = ?auto_81137 ?auto_81142 ) ) ( not ( = ?auto_81137 ?auto_81141 ) ) ( not ( = ?auto_81143 ?auto_81142 ) ) ( not ( = ?auto_81143 ?auto_81141 ) ) ( not ( = ?auto_81142 ?auto_81141 ) ) ( ON ?auto_81142 ?auto_81143 ) ( not ( = ?auto_81140 ?auto_81139 ) ) ( not ( = ?auto_81140 ?auto_81138 ) ) ( not ( = ?auto_81140 ?auto_81141 ) ) ( not ( = ?auto_81139 ?auto_81138 ) ) ( not ( = ?auto_81139 ?auto_81141 ) ) ( not ( = ?auto_81138 ?auto_81141 ) ) ( not ( = ?auto_81137 ?auto_81138 ) ) ( not ( = ?auto_81137 ?auto_81140 ) ) ( not ( = ?auto_81137 ?auto_81139 ) ) ( not ( = ?auto_81143 ?auto_81138 ) ) ( not ( = ?auto_81143 ?auto_81140 ) ) ( not ( = ?auto_81143 ?auto_81139 ) ) ( not ( = ?auto_81142 ?auto_81138 ) ) ( not ( = ?auto_81142 ?auto_81140 ) ) ( not ( = ?auto_81142 ?auto_81139 ) ) ( ON ?auto_81141 ?auto_81142 ) ( ON ?auto_81140 ?auto_81144 ) ( not ( = ?auto_81137 ?auto_81144 ) ) ( not ( = ?auto_81143 ?auto_81144 ) ) ( not ( = ?auto_81142 ?auto_81144 ) ) ( not ( = ?auto_81141 ?auto_81144 ) ) ( not ( = ?auto_81140 ?auto_81144 ) ) ( not ( = ?auto_81139 ?auto_81144 ) ) ( not ( = ?auto_81138 ?auto_81144 ) ) ( ON ?auto_81139 ?auto_81140 ) ( CLEAR ?auto_81139 ) ( ON-TABLE ?auto_81144 ) ( HOLDING ?auto_81138 ) ( CLEAR ?auto_81141 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81137 ?auto_81143 ?auto_81142 ?auto_81141 ?auto_81138 )
      ( MAKE-1PILE ?auto_81137 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81183 - BLOCK
      ?auto_81184 - BLOCK
      ?auto_81185 - BLOCK
      ?auto_81186 - BLOCK
      ?auto_81187 - BLOCK
      ?auto_81188 - BLOCK
    )
    :vars
    (
      ?auto_81189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81183 ) ( ON ?auto_81184 ?auto_81183 ) ( ON ?auto_81185 ?auto_81184 ) ( ON ?auto_81186 ?auto_81185 ) ( not ( = ?auto_81183 ?auto_81184 ) ) ( not ( = ?auto_81183 ?auto_81185 ) ) ( not ( = ?auto_81183 ?auto_81186 ) ) ( not ( = ?auto_81183 ?auto_81187 ) ) ( not ( = ?auto_81183 ?auto_81188 ) ) ( not ( = ?auto_81184 ?auto_81185 ) ) ( not ( = ?auto_81184 ?auto_81186 ) ) ( not ( = ?auto_81184 ?auto_81187 ) ) ( not ( = ?auto_81184 ?auto_81188 ) ) ( not ( = ?auto_81185 ?auto_81186 ) ) ( not ( = ?auto_81185 ?auto_81187 ) ) ( not ( = ?auto_81185 ?auto_81188 ) ) ( not ( = ?auto_81186 ?auto_81187 ) ) ( not ( = ?auto_81186 ?auto_81188 ) ) ( not ( = ?auto_81187 ?auto_81188 ) ) ( ON ?auto_81188 ?auto_81189 ) ( not ( = ?auto_81183 ?auto_81189 ) ) ( not ( = ?auto_81184 ?auto_81189 ) ) ( not ( = ?auto_81185 ?auto_81189 ) ) ( not ( = ?auto_81186 ?auto_81189 ) ) ( not ( = ?auto_81187 ?auto_81189 ) ) ( not ( = ?auto_81188 ?auto_81189 ) ) ( CLEAR ?auto_81186 ) ( ON ?auto_81187 ?auto_81188 ) ( CLEAR ?auto_81187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81189 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81189 ?auto_81188 )
      ( MAKE-6PILE ?auto_81183 ?auto_81184 ?auto_81185 ?auto_81186 ?auto_81187 ?auto_81188 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81190 - BLOCK
      ?auto_81191 - BLOCK
      ?auto_81192 - BLOCK
      ?auto_81193 - BLOCK
      ?auto_81194 - BLOCK
      ?auto_81195 - BLOCK
    )
    :vars
    (
      ?auto_81196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81190 ) ( ON ?auto_81191 ?auto_81190 ) ( ON ?auto_81192 ?auto_81191 ) ( not ( = ?auto_81190 ?auto_81191 ) ) ( not ( = ?auto_81190 ?auto_81192 ) ) ( not ( = ?auto_81190 ?auto_81193 ) ) ( not ( = ?auto_81190 ?auto_81194 ) ) ( not ( = ?auto_81190 ?auto_81195 ) ) ( not ( = ?auto_81191 ?auto_81192 ) ) ( not ( = ?auto_81191 ?auto_81193 ) ) ( not ( = ?auto_81191 ?auto_81194 ) ) ( not ( = ?auto_81191 ?auto_81195 ) ) ( not ( = ?auto_81192 ?auto_81193 ) ) ( not ( = ?auto_81192 ?auto_81194 ) ) ( not ( = ?auto_81192 ?auto_81195 ) ) ( not ( = ?auto_81193 ?auto_81194 ) ) ( not ( = ?auto_81193 ?auto_81195 ) ) ( not ( = ?auto_81194 ?auto_81195 ) ) ( ON ?auto_81195 ?auto_81196 ) ( not ( = ?auto_81190 ?auto_81196 ) ) ( not ( = ?auto_81191 ?auto_81196 ) ) ( not ( = ?auto_81192 ?auto_81196 ) ) ( not ( = ?auto_81193 ?auto_81196 ) ) ( not ( = ?auto_81194 ?auto_81196 ) ) ( not ( = ?auto_81195 ?auto_81196 ) ) ( ON ?auto_81194 ?auto_81195 ) ( CLEAR ?auto_81194 ) ( ON-TABLE ?auto_81196 ) ( HOLDING ?auto_81193 ) ( CLEAR ?auto_81192 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81190 ?auto_81191 ?auto_81192 ?auto_81193 )
      ( MAKE-6PILE ?auto_81190 ?auto_81191 ?auto_81192 ?auto_81193 ?auto_81194 ?auto_81195 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81197 - BLOCK
      ?auto_81198 - BLOCK
      ?auto_81199 - BLOCK
      ?auto_81200 - BLOCK
      ?auto_81201 - BLOCK
      ?auto_81202 - BLOCK
    )
    :vars
    (
      ?auto_81203 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81197 ) ( ON ?auto_81198 ?auto_81197 ) ( ON ?auto_81199 ?auto_81198 ) ( not ( = ?auto_81197 ?auto_81198 ) ) ( not ( = ?auto_81197 ?auto_81199 ) ) ( not ( = ?auto_81197 ?auto_81200 ) ) ( not ( = ?auto_81197 ?auto_81201 ) ) ( not ( = ?auto_81197 ?auto_81202 ) ) ( not ( = ?auto_81198 ?auto_81199 ) ) ( not ( = ?auto_81198 ?auto_81200 ) ) ( not ( = ?auto_81198 ?auto_81201 ) ) ( not ( = ?auto_81198 ?auto_81202 ) ) ( not ( = ?auto_81199 ?auto_81200 ) ) ( not ( = ?auto_81199 ?auto_81201 ) ) ( not ( = ?auto_81199 ?auto_81202 ) ) ( not ( = ?auto_81200 ?auto_81201 ) ) ( not ( = ?auto_81200 ?auto_81202 ) ) ( not ( = ?auto_81201 ?auto_81202 ) ) ( ON ?auto_81202 ?auto_81203 ) ( not ( = ?auto_81197 ?auto_81203 ) ) ( not ( = ?auto_81198 ?auto_81203 ) ) ( not ( = ?auto_81199 ?auto_81203 ) ) ( not ( = ?auto_81200 ?auto_81203 ) ) ( not ( = ?auto_81201 ?auto_81203 ) ) ( not ( = ?auto_81202 ?auto_81203 ) ) ( ON ?auto_81201 ?auto_81202 ) ( ON-TABLE ?auto_81203 ) ( CLEAR ?auto_81199 ) ( ON ?auto_81200 ?auto_81201 ) ( CLEAR ?auto_81200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81203 ?auto_81202 ?auto_81201 )
      ( MAKE-6PILE ?auto_81197 ?auto_81198 ?auto_81199 ?auto_81200 ?auto_81201 ?auto_81202 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81204 - BLOCK
      ?auto_81205 - BLOCK
      ?auto_81206 - BLOCK
      ?auto_81207 - BLOCK
      ?auto_81208 - BLOCK
      ?auto_81209 - BLOCK
    )
    :vars
    (
      ?auto_81210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81204 ) ( ON ?auto_81205 ?auto_81204 ) ( not ( = ?auto_81204 ?auto_81205 ) ) ( not ( = ?auto_81204 ?auto_81206 ) ) ( not ( = ?auto_81204 ?auto_81207 ) ) ( not ( = ?auto_81204 ?auto_81208 ) ) ( not ( = ?auto_81204 ?auto_81209 ) ) ( not ( = ?auto_81205 ?auto_81206 ) ) ( not ( = ?auto_81205 ?auto_81207 ) ) ( not ( = ?auto_81205 ?auto_81208 ) ) ( not ( = ?auto_81205 ?auto_81209 ) ) ( not ( = ?auto_81206 ?auto_81207 ) ) ( not ( = ?auto_81206 ?auto_81208 ) ) ( not ( = ?auto_81206 ?auto_81209 ) ) ( not ( = ?auto_81207 ?auto_81208 ) ) ( not ( = ?auto_81207 ?auto_81209 ) ) ( not ( = ?auto_81208 ?auto_81209 ) ) ( ON ?auto_81209 ?auto_81210 ) ( not ( = ?auto_81204 ?auto_81210 ) ) ( not ( = ?auto_81205 ?auto_81210 ) ) ( not ( = ?auto_81206 ?auto_81210 ) ) ( not ( = ?auto_81207 ?auto_81210 ) ) ( not ( = ?auto_81208 ?auto_81210 ) ) ( not ( = ?auto_81209 ?auto_81210 ) ) ( ON ?auto_81208 ?auto_81209 ) ( ON-TABLE ?auto_81210 ) ( ON ?auto_81207 ?auto_81208 ) ( CLEAR ?auto_81207 ) ( HOLDING ?auto_81206 ) ( CLEAR ?auto_81205 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81204 ?auto_81205 ?auto_81206 )
      ( MAKE-6PILE ?auto_81204 ?auto_81205 ?auto_81206 ?auto_81207 ?auto_81208 ?auto_81209 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81211 - BLOCK
      ?auto_81212 - BLOCK
      ?auto_81213 - BLOCK
      ?auto_81214 - BLOCK
      ?auto_81215 - BLOCK
      ?auto_81216 - BLOCK
    )
    :vars
    (
      ?auto_81217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81211 ) ( ON ?auto_81212 ?auto_81211 ) ( not ( = ?auto_81211 ?auto_81212 ) ) ( not ( = ?auto_81211 ?auto_81213 ) ) ( not ( = ?auto_81211 ?auto_81214 ) ) ( not ( = ?auto_81211 ?auto_81215 ) ) ( not ( = ?auto_81211 ?auto_81216 ) ) ( not ( = ?auto_81212 ?auto_81213 ) ) ( not ( = ?auto_81212 ?auto_81214 ) ) ( not ( = ?auto_81212 ?auto_81215 ) ) ( not ( = ?auto_81212 ?auto_81216 ) ) ( not ( = ?auto_81213 ?auto_81214 ) ) ( not ( = ?auto_81213 ?auto_81215 ) ) ( not ( = ?auto_81213 ?auto_81216 ) ) ( not ( = ?auto_81214 ?auto_81215 ) ) ( not ( = ?auto_81214 ?auto_81216 ) ) ( not ( = ?auto_81215 ?auto_81216 ) ) ( ON ?auto_81216 ?auto_81217 ) ( not ( = ?auto_81211 ?auto_81217 ) ) ( not ( = ?auto_81212 ?auto_81217 ) ) ( not ( = ?auto_81213 ?auto_81217 ) ) ( not ( = ?auto_81214 ?auto_81217 ) ) ( not ( = ?auto_81215 ?auto_81217 ) ) ( not ( = ?auto_81216 ?auto_81217 ) ) ( ON ?auto_81215 ?auto_81216 ) ( ON-TABLE ?auto_81217 ) ( ON ?auto_81214 ?auto_81215 ) ( CLEAR ?auto_81212 ) ( ON ?auto_81213 ?auto_81214 ) ( CLEAR ?auto_81213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81217 ?auto_81216 ?auto_81215 ?auto_81214 )
      ( MAKE-6PILE ?auto_81211 ?auto_81212 ?auto_81213 ?auto_81214 ?auto_81215 ?auto_81216 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81218 - BLOCK
      ?auto_81219 - BLOCK
      ?auto_81220 - BLOCK
      ?auto_81221 - BLOCK
      ?auto_81222 - BLOCK
      ?auto_81223 - BLOCK
    )
    :vars
    (
      ?auto_81224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81218 ) ( not ( = ?auto_81218 ?auto_81219 ) ) ( not ( = ?auto_81218 ?auto_81220 ) ) ( not ( = ?auto_81218 ?auto_81221 ) ) ( not ( = ?auto_81218 ?auto_81222 ) ) ( not ( = ?auto_81218 ?auto_81223 ) ) ( not ( = ?auto_81219 ?auto_81220 ) ) ( not ( = ?auto_81219 ?auto_81221 ) ) ( not ( = ?auto_81219 ?auto_81222 ) ) ( not ( = ?auto_81219 ?auto_81223 ) ) ( not ( = ?auto_81220 ?auto_81221 ) ) ( not ( = ?auto_81220 ?auto_81222 ) ) ( not ( = ?auto_81220 ?auto_81223 ) ) ( not ( = ?auto_81221 ?auto_81222 ) ) ( not ( = ?auto_81221 ?auto_81223 ) ) ( not ( = ?auto_81222 ?auto_81223 ) ) ( ON ?auto_81223 ?auto_81224 ) ( not ( = ?auto_81218 ?auto_81224 ) ) ( not ( = ?auto_81219 ?auto_81224 ) ) ( not ( = ?auto_81220 ?auto_81224 ) ) ( not ( = ?auto_81221 ?auto_81224 ) ) ( not ( = ?auto_81222 ?auto_81224 ) ) ( not ( = ?auto_81223 ?auto_81224 ) ) ( ON ?auto_81222 ?auto_81223 ) ( ON-TABLE ?auto_81224 ) ( ON ?auto_81221 ?auto_81222 ) ( ON ?auto_81220 ?auto_81221 ) ( CLEAR ?auto_81220 ) ( HOLDING ?auto_81219 ) ( CLEAR ?auto_81218 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81218 ?auto_81219 )
      ( MAKE-6PILE ?auto_81218 ?auto_81219 ?auto_81220 ?auto_81221 ?auto_81222 ?auto_81223 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81225 - BLOCK
      ?auto_81226 - BLOCK
      ?auto_81227 - BLOCK
      ?auto_81228 - BLOCK
      ?auto_81229 - BLOCK
      ?auto_81230 - BLOCK
    )
    :vars
    (
      ?auto_81231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81225 ) ( not ( = ?auto_81225 ?auto_81226 ) ) ( not ( = ?auto_81225 ?auto_81227 ) ) ( not ( = ?auto_81225 ?auto_81228 ) ) ( not ( = ?auto_81225 ?auto_81229 ) ) ( not ( = ?auto_81225 ?auto_81230 ) ) ( not ( = ?auto_81226 ?auto_81227 ) ) ( not ( = ?auto_81226 ?auto_81228 ) ) ( not ( = ?auto_81226 ?auto_81229 ) ) ( not ( = ?auto_81226 ?auto_81230 ) ) ( not ( = ?auto_81227 ?auto_81228 ) ) ( not ( = ?auto_81227 ?auto_81229 ) ) ( not ( = ?auto_81227 ?auto_81230 ) ) ( not ( = ?auto_81228 ?auto_81229 ) ) ( not ( = ?auto_81228 ?auto_81230 ) ) ( not ( = ?auto_81229 ?auto_81230 ) ) ( ON ?auto_81230 ?auto_81231 ) ( not ( = ?auto_81225 ?auto_81231 ) ) ( not ( = ?auto_81226 ?auto_81231 ) ) ( not ( = ?auto_81227 ?auto_81231 ) ) ( not ( = ?auto_81228 ?auto_81231 ) ) ( not ( = ?auto_81229 ?auto_81231 ) ) ( not ( = ?auto_81230 ?auto_81231 ) ) ( ON ?auto_81229 ?auto_81230 ) ( ON-TABLE ?auto_81231 ) ( ON ?auto_81228 ?auto_81229 ) ( ON ?auto_81227 ?auto_81228 ) ( CLEAR ?auto_81225 ) ( ON ?auto_81226 ?auto_81227 ) ( CLEAR ?auto_81226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81231 ?auto_81230 ?auto_81229 ?auto_81228 ?auto_81227 )
      ( MAKE-6PILE ?auto_81225 ?auto_81226 ?auto_81227 ?auto_81228 ?auto_81229 ?auto_81230 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81232 - BLOCK
      ?auto_81233 - BLOCK
      ?auto_81234 - BLOCK
      ?auto_81235 - BLOCK
      ?auto_81236 - BLOCK
      ?auto_81237 - BLOCK
    )
    :vars
    (
      ?auto_81238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81232 ?auto_81233 ) ) ( not ( = ?auto_81232 ?auto_81234 ) ) ( not ( = ?auto_81232 ?auto_81235 ) ) ( not ( = ?auto_81232 ?auto_81236 ) ) ( not ( = ?auto_81232 ?auto_81237 ) ) ( not ( = ?auto_81233 ?auto_81234 ) ) ( not ( = ?auto_81233 ?auto_81235 ) ) ( not ( = ?auto_81233 ?auto_81236 ) ) ( not ( = ?auto_81233 ?auto_81237 ) ) ( not ( = ?auto_81234 ?auto_81235 ) ) ( not ( = ?auto_81234 ?auto_81236 ) ) ( not ( = ?auto_81234 ?auto_81237 ) ) ( not ( = ?auto_81235 ?auto_81236 ) ) ( not ( = ?auto_81235 ?auto_81237 ) ) ( not ( = ?auto_81236 ?auto_81237 ) ) ( ON ?auto_81237 ?auto_81238 ) ( not ( = ?auto_81232 ?auto_81238 ) ) ( not ( = ?auto_81233 ?auto_81238 ) ) ( not ( = ?auto_81234 ?auto_81238 ) ) ( not ( = ?auto_81235 ?auto_81238 ) ) ( not ( = ?auto_81236 ?auto_81238 ) ) ( not ( = ?auto_81237 ?auto_81238 ) ) ( ON ?auto_81236 ?auto_81237 ) ( ON-TABLE ?auto_81238 ) ( ON ?auto_81235 ?auto_81236 ) ( ON ?auto_81234 ?auto_81235 ) ( ON ?auto_81233 ?auto_81234 ) ( CLEAR ?auto_81233 ) ( HOLDING ?auto_81232 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81232 )
      ( MAKE-6PILE ?auto_81232 ?auto_81233 ?auto_81234 ?auto_81235 ?auto_81236 ?auto_81237 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81239 - BLOCK
      ?auto_81240 - BLOCK
      ?auto_81241 - BLOCK
      ?auto_81242 - BLOCK
      ?auto_81243 - BLOCK
      ?auto_81244 - BLOCK
    )
    :vars
    (
      ?auto_81245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81239 ?auto_81240 ) ) ( not ( = ?auto_81239 ?auto_81241 ) ) ( not ( = ?auto_81239 ?auto_81242 ) ) ( not ( = ?auto_81239 ?auto_81243 ) ) ( not ( = ?auto_81239 ?auto_81244 ) ) ( not ( = ?auto_81240 ?auto_81241 ) ) ( not ( = ?auto_81240 ?auto_81242 ) ) ( not ( = ?auto_81240 ?auto_81243 ) ) ( not ( = ?auto_81240 ?auto_81244 ) ) ( not ( = ?auto_81241 ?auto_81242 ) ) ( not ( = ?auto_81241 ?auto_81243 ) ) ( not ( = ?auto_81241 ?auto_81244 ) ) ( not ( = ?auto_81242 ?auto_81243 ) ) ( not ( = ?auto_81242 ?auto_81244 ) ) ( not ( = ?auto_81243 ?auto_81244 ) ) ( ON ?auto_81244 ?auto_81245 ) ( not ( = ?auto_81239 ?auto_81245 ) ) ( not ( = ?auto_81240 ?auto_81245 ) ) ( not ( = ?auto_81241 ?auto_81245 ) ) ( not ( = ?auto_81242 ?auto_81245 ) ) ( not ( = ?auto_81243 ?auto_81245 ) ) ( not ( = ?auto_81244 ?auto_81245 ) ) ( ON ?auto_81243 ?auto_81244 ) ( ON-TABLE ?auto_81245 ) ( ON ?auto_81242 ?auto_81243 ) ( ON ?auto_81241 ?auto_81242 ) ( ON ?auto_81240 ?auto_81241 ) ( ON ?auto_81239 ?auto_81240 ) ( CLEAR ?auto_81239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81245 ?auto_81244 ?auto_81243 ?auto_81242 ?auto_81241 ?auto_81240 )
      ( MAKE-6PILE ?auto_81239 ?auto_81240 ?auto_81241 ?auto_81242 ?auto_81243 ?auto_81244 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81252 - BLOCK
      ?auto_81253 - BLOCK
      ?auto_81254 - BLOCK
      ?auto_81255 - BLOCK
      ?auto_81256 - BLOCK
      ?auto_81257 - BLOCK
    )
    :vars
    (
      ?auto_81258 - BLOCK
      ?auto_81259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81252 ?auto_81253 ) ) ( not ( = ?auto_81252 ?auto_81254 ) ) ( not ( = ?auto_81252 ?auto_81255 ) ) ( not ( = ?auto_81252 ?auto_81256 ) ) ( not ( = ?auto_81252 ?auto_81257 ) ) ( not ( = ?auto_81253 ?auto_81254 ) ) ( not ( = ?auto_81253 ?auto_81255 ) ) ( not ( = ?auto_81253 ?auto_81256 ) ) ( not ( = ?auto_81253 ?auto_81257 ) ) ( not ( = ?auto_81254 ?auto_81255 ) ) ( not ( = ?auto_81254 ?auto_81256 ) ) ( not ( = ?auto_81254 ?auto_81257 ) ) ( not ( = ?auto_81255 ?auto_81256 ) ) ( not ( = ?auto_81255 ?auto_81257 ) ) ( not ( = ?auto_81256 ?auto_81257 ) ) ( ON ?auto_81257 ?auto_81258 ) ( not ( = ?auto_81252 ?auto_81258 ) ) ( not ( = ?auto_81253 ?auto_81258 ) ) ( not ( = ?auto_81254 ?auto_81258 ) ) ( not ( = ?auto_81255 ?auto_81258 ) ) ( not ( = ?auto_81256 ?auto_81258 ) ) ( not ( = ?auto_81257 ?auto_81258 ) ) ( ON ?auto_81256 ?auto_81257 ) ( ON-TABLE ?auto_81258 ) ( ON ?auto_81255 ?auto_81256 ) ( ON ?auto_81254 ?auto_81255 ) ( ON ?auto_81253 ?auto_81254 ) ( CLEAR ?auto_81253 ) ( ON ?auto_81252 ?auto_81259 ) ( CLEAR ?auto_81252 ) ( HAND-EMPTY ) ( not ( = ?auto_81252 ?auto_81259 ) ) ( not ( = ?auto_81253 ?auto_81259 ) ) ( not ( = ?auto_81254 ?auto_81259 ) ) ( not ( = ?auto_81255 ?auto_81259 ) ) ( not ( = ?auto_81256 ?auto_81259 ) ) ( not ( = ?auto_81257 ?auto_81259 ) ) ( not ( = ?auto_81258 ?auto_81259 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81252 ?auto_81259 )
      ( MAKE-6PILE ?auto_81252 ?auto_81253 ?auto_81254 ?auto_81255 ?auto_81256 ?auto_81257 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81260 - BLOCK
      ?auto_81261 - BLOCK
      ?auto_81262 - BLOCK
      ?auto_81263 - BLOCK
      ?auto_81264 - BLOCK
      ?auto_81265 - BLOCK
    )
    :vars
    (
      ?auto_81267 - BLOCK
      ?auto_81266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81260 ?auto_81261 ) ) ( not ( = ?auto_81260 ?auto_81262 ) ) ( not ( = ?auto_81260 ?auto_81263 ) ) ( not ( = ?auto_81260 ?auto_81264 ) ) ( not ( = ?auto_81260 ?auto_81265 ) ) ( not ( = ?auto_81261 ?auto_81262 ) ) ( not ( = ?auto_81261 ?auto_81263 ) ) ( not ( = ?auto_81261 ?auto_81264 ) ) ( not ( = ?auto_81261 ?auto_81265 ) ) ( not ( = ?auto_81262 ?auto_81263 ) ) ( not ( = ?auto_81262 ?auto_81264 ) ) ( not ( = ?auto_81262 ?auto_81265 ) ) ( not ( = ?auto_81263 ?auto_81264 ) ) ( not ( = ?auto_81263 ?auto_81265 ) ) ( not ( = ?auto_81264 ?auto_81265 ) ) ( ON ?auto_81265 ?auto_81267 ) ( not ( = ?auto_81260 ?auto_81267 ) ) ( not ( = ?auto_81261 ?auto_81267 ) ) ( not ( = ?auto_81262 ?auto_81267 ) ) ( not ( = ?auto_81263 ?auto_81267 ) ) ( not ( = ?auto_81264 ?auto_81267 ) ) ( not ( = ?auto_81265 ?auto_81267 ) ) ( ON ?auto_81264 ?auto_81265 ) ( ON-TABLE ?auto_81267 ) ( ON ?auto_81263 ?auto_81264 ) ( ON ?auto_81262 ?auto_81263 ) ( ON ?auto_81260 ?auto_81266 ) ( CLEAR ?auto_81260 ) ( not ( = ?auto_81260 ?auto_81266 ) ) ( not ( = ?auto_81261 ?auto_81266 ) ) ( not ( = ?auto_81262 ?auto_81266 ) ) ( not ( = ?auto_81263 ?auto_81266 ) ) ( not ( = ?auto_81264 ?auto_81266 ) ) ( not ( = ?auto_81265 ?auto_81266 ) ) ( not ( = ?auto_81267 ?auto_81266 ) ) ( HOLDING ?auto_81261 ) ( CLEAR ?auto_81262 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81267 ?auto_81265 ?auto_81264 ?auto_81263 ?auto_81262 ?auto_81261 )
      ( MAKE-6PILE ?auto_81260 ?auto_81261 ?auto_81262 ?auto_81263 ?auto_81264 ?auto_81265 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81268 - BLOCK
      ?auto_81269 - BLOCK
      ?auto_81270 - BLOCK
      ?auto_81271 - BLOCK
      ?auto_81272 - BLOCK
      ?auto_81273 - BLOCK
    )
    :vars
    (
      ?auto_81275 - BLOCK
      ?auto_81274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81268 ?auto_81269 ) ) ( not ( = ?auto_81268 ?auto_81270 ) ) ( not ( = ?auto_81268 ?auto_81271 ) ) ( not ( = ?auto_81268 ?auto_81272 ) ) ( not ( = ?auto_81268 ?auto_81273 ) ) ( not ( = ?auto_81269 ?auto_81270 ) ) ( not ( = ?auto_81269 ?auto_81271 ) ) ( not ( = ?auto_81269 ?auto_81272 ) ) ( not ( = ?auto_81269 ?auto_81273 ) ) ( not ( = ?auto_81270 ?auto_81271 ) ) ( not ( = ?auto_81270 ?auto_81272 ) ) ( not ( = ?auto_81270 ?auto_81273 ) ) ( not ( = ?auto_81271 ?auto_81272 ) ) ( not ( = ?auto_81271 ?auto_81273 ) ) ( not ( = ?auto_81272 ?auto_81273 ) ) ( ON ?auto_81273 ?auto_81275 ) ( not ( = ?auto_81268 ?auto_81275 ) ) ( not ( = ?auto_81269 ?auto_81275 ) ) ( not ( = ?auto_81270 ?auto_81275 ) ) ( not ( = ?auto_81271 ?auto_81275 ) ) ( not ( = ?auto_81272 ?auto_81275 ) ) ( not ( = ?auto_81273 ?auto_81275 ) ) ( ON ?auto_81272 ?auto_81273 ) ( ON-TABLE ?auto_81275 ) ( ON ?auto_81271 ?auto_81272 ) ( ON ?auto_81270 ?auto_81271 ) ( ON ?auto_81268 ?auto_81274 ) ( not ( = ?auto_81268 ?auto_81274 ) ) ( not ( = ?auto_81269 ?auto_81274 ) ) ( not ( = ?auto_81270 ?auto_81274 ) ) ( not ( = ?auto_81271 ?auto_81274 ) ) ( not ( = ?auto_81272 ?auto_81274 ) ) ( not ( = ?auto_81273 ?auto_81274 ) ) ( not ( = ?auto_81275 ?auto_81274 ) ) ( CLEAR ?auto_81270 ) ( ON ?auto_81269 ?auto_81268 ) ( CLEAR ?auto_81269 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81274 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81274 ?auto_81268 )
      ( MAKE-6PILE ?auto_81268 ?auto_81269 ?auto_81270 ?auto_81271 ?auto_81272 ?auto_81273 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81276 - BLOCK
      ?auto_81277 - BLOCK
      ?auto_81278 - BLOCK
      ?auto_81279 - BLOCK
      ?auto_81280 - BLOCK
      ?auto_81281 - BLOCK
    )
    :vars
    (
      ?auto_81282 - BLOCK
      ?auto_81283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81276 ?auto_81277 ) ) ( not ( = ?auto_81276 ?auto_81278 ) ) ( not ( = ?auto_81276 ?auto_81279 ) ) ( not ( = ?auto_81276 ?auto_81280 ) ) ( not ( = ?auto_81276 ?auto_81281 ) ) ( not ( = ?auto_81277 ?auto_81278 ) ) ( not ( = ?auto_81277 ?auto_81279 ) ) ( not ( = ?auto_81277 ?auto_81280 ) ) ( not ( = ?auto_81277 ?auto_81281 ) ) ( not ( = ?auto_81278 ?auto_81279 ) ) ( not ( = ?auto_81278 ?auto_81280 ) ) ( not ( = ?auto_81278 ?auto_81281 ) ) ( not ( = ?auto_81279 ?auto_81280 ) ) ( not ( = ?auto_81279 ?auto_81281 ) ) ( not ( = ?auto_81280 ?auto_81281 ) ) ( ON ?auto_81281 ?auto_81282 ) ( not ( = ?auto_81276 ?auto_81282 ) ) ( not ( = ?auto_81277 ?auto_81282 ) ) ( not ( = ?auto_81278 ?auto_81282 ) ) ( not ( = ?auto_81279 ?auto_81282 ) ) ( not ( = ?auto_81280 ?auto_81282 ) ) ( not ( = ?auto_81281 ?auto_81282 ) ) ( ON ?auto_81280 ?auto_81281 ) ( ON-TABLE ?auto_81282 ) ( ON ?auto_81279 ?auto_81280 ) ( ON ?auto_81276 ?auto_81283 ) ( not ( = ?auto_81276 ?auto_81283 ) ) ( not ( = ?auto_81277 ?auto_81283 ) ) ( not ( = ?auto_81278 ?auto_81283 ) ) ( not ( = ?auto_81279 ?auto_81283 ) ) ( not ( = ?auto_81280 ?auto_81283 ) ) ( not ( = ?auto_81281 ?auto_81283 ) ) ( not ( = ?auto_81282 ?auto_81283 ) ) ( ON ?auto_81277 ?auto_81276 ) ( CLEAR ?auto_81277 ) ( ON-TABLE ?auto_81283 ) ( HOLDING ?auto_81278 ) ( CLEAR ?auto_81279 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81282 ?auto_81281 ?auto_81280 ?auto_81279 ?auto_81278 )
      ( MAKE-6PILE ?auto_81276 ?auto_81277 ?auto_81278 ?auto_81279 ?auto_81280 ?auto_81281 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81284 - BLOCK
      ?auto_81285 - BLOCK
      ?auto_81286 - BLOCK
      ?auto_81287 - BLOCK
      ?auto_81288 - BLOCK
      ?auto_81289 - BLOCK
    )
    :vars
    (
      ?auto_81291 - BLOCK
      ?auto_81290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81284 ?auto_81285 ) ) ( not ( = ?auto_81284 ?auto_81286 ) ) ( not ( = ?auto_81284 ?auto_81287 ) ) ( not ( = ?auto_81284 ?auto_81288 ) ) ( not ( = ?auto_81284 ?auto_81289 ) ) ( not ( = ?auto_81285 ?auto_81286 ) ) ( not ( = ?auto_81285 ?auto_81287 ) ) ( not ( = ?auto_81285 ?auto_81288 ) ) ( not ( = ?auto_81285 ?auto_81289 ) ) ( not ( = ?auto_81286 ?auto_81287 ) ) ( not ( = ?auto_81286 ?auto_81288 ) ) ( not ( = ?auto_81286 ?auto_81289 ) ) ( not ( = ?auto_81287 ?auto_81288 ) ) ( not ( = ?auto_81287 ?auto_81289 ) ) ( not ( = ?auto_81288 ?auto_81289 ) ) ( ON ?auto_81289 ?auto_81291 ) ( not ( = ?auto_81284 ?auto_81291 ) ) ( not ( = ?auto_81285 ?auto_81291 ) ) ( not ( = ?auto_81286 ?auto_81291 ) ) ( not ( = ?auto_81287 ?auto_81291 ) ) ( not ( = ?auto_81288 ?auto_81291 ) ) ( not ( = ?auto_81289 ?auto_81291 ) ) ( ON ?auto_81288 ?auto_81289 ) ( ON-TABLE ?auto_81291 ) ( ON ?auto_81287 ?auto_81288 ) ( ON ?auto_81284 ?auto_81290 ) ( not ( = ?auto_81284 ?auto_81290 ) ) ( not ( = ?auto_81285 ?auto_81290 ) ) ( not ( = ?auto_81286 ?auto_81290 ) ) ( not ( = ?auto_81287 ?auto_81290 ) ) ( not ( = ?auto_81288 ?auto_81290 ) ) ( not ( = ?auto_81289 ?auto_81290 ) ) ( not ( = ?auto_81291 ?auto_81290 ) ) ( ON ?auto_81285 ?auto_81284 ) ( ON-TABLE ?auto_81290 ) ( CLEAR ?auto_81287 ) ( ON ?auto_81286 ?auto_81285 ) ( CLEAR ?auto_81286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81290 ?auto_81284 ?auto_81285 )
      ( MAKE-6PILE ?auto_81284 ?auto_81285 ?auto_81286 ?auto_81287 ?auto_81288 ?auto_81289 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81292 - BLOCK
      ?auto_81293 - BLOCK
      ?auto_81294 - BLOCK
      ?auto_81295 - BLOCK
      ?auto_81296 - BLOCK
      ?auto_81297 - BLOCK
    )
    :vars
    (
      ?auto_81299 - BLOCK
      ?auto_81298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81292 ?auto_81293 ) ) ( not ( = ?auto_81292 ?auto_81294 ) ) ( not ( = ?auto_81292 ?auto_81295 ) ) ( not ( = ?auto_81292 ?auto_81296 ) ) ( not ( = ?auto_81292 ?auto_81297 ) ) ( not ( = ?auto_81293 ?auto_81294 ) ) ( not ( = ?auto_81293 ?auto_81295 ) ) ( not ( = ?auto_81293 ?auto_81296 ) ) ( not ( = ?auto_81293 ?auto_81297 ) ) ( not ( = ?auto_81294 ?auto_81295 ) ) ( not ( = ?auto_81294 ?auto_81296 ) ) ( not ( = ?auto_81294 ?auto_81297 ) ) ( not ( = ?auto_81295 ?auto_81296 ) ) ( not ( = ?auto_81295 ?auto_81297 ) ) ( not ( = ?auto_81296 ?auto_81297 ) ) ( ON ?auto_81297 ?auto_81299 ) ( not ( = ?auto_81292 ?auto_81299 ) ) ( not ( = ?auto_81293 ?auto_81299 ) ) ( not ( = ?auto_81294 ?auto_81299 ) ) ( not ( = ?auto_81295 ?auto_81299 ) ) ( not ( = ?auto_81296 ?auto_81299 ) ) ( not ( = ?auto_81297 ?auto_81299 ) ) ( ON ?auto_81296 ?auto_81297 ) ( ON-TABLE ?auto_81299 ) ( ON ?auto_81292 ?auto_81298 ) ( not ( = ?auto_81292 ?auto_81298 ) ) ( not ( = ?auto_81293 ?auto_81298 ) ) ( not ( = ?auto_81294 ?auto_81298 ) ) ( not ( = ?auto_81295 ?auto_81298 ) ) ( not ( = ?auto_81296 ?auto_81298 ) ) ( not ( = ?auto_81297 ?auto_81298 ) ) ( not ( = ?auto_81299 ?auto_81298 ) ) ( ON ?auto_81293 ?auto_81292 ) ( ON-TABLE ?auto_81298 ) ( ON ?auto_81294 ?auto_81293 ) ( CLEAR ?auto_81294 ) ( HOLDING ?auto_81295 ) ( CLEAR ?auto_81296 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81299 ?auto_81297 ?auto_81296 ?auto_81295 )
      ( MAKE-6PILE ?auto_81292 ?auto_81293 ?auto_81294 ?auto_81295 ?auto_81296 ?auto_81297 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81300 - BLOCK
      ?auto_81301 - BLOCK
      ?auto_81302 - BLOCK
      ?auto_81303 - BLOCK
      ?auto_81304 - BLOCK
      ?auto_81305 - BLOCK
    )
    :vars
    (
      ?auto_81307 - BLOCK
      ?auto_81306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81300 ?auto_81301 ) ) ( not ( = ?auto_81300 ?auto_81302 ) ) ( not ( = ?auto_81300 ?auto_81303 ) ) ( not ( = ?auto_81300 ?auto_81304 ) ) ( not ( = ?auto_81300 ?auto_81305 ) ) ( not ( = ?auto_81301 ?auto_81302 ) ) ( not ( = ?auto_81301 ?auto_81303 ) ) ( not ( = ?auto_81301 ?auto_81304 ) ) ( not ( = ?auto_81301 ?auto_81305 ) ) ( not ( = ?auto_81302 ?auto_81303 ) ) ( not ( = ?auto_81302 ?auto_81304 ) ) ( not ( = ?auto_81302 ?auto_81305 ) ) ( not ( = ?auto_81303 ?auto_81304 ) ) ( not ( = ?auto_81303 ?auto_81305 ) ) ( not ( = ?auto_81304 ?auto_81305 ) ) ( ON ?auto_81305 ?auto_81307 ) ( not ( = ?auto_81300 ?auto_81307 ) ) ( not ( = ?auto_81301 ?auto_81307 ) ) ( not ( = ?auto_81302 ?auto_81307 ) ) ( not ( = ?auto_81303 ?auto_81307 ) ) ( not ( = ?auto_81304 ?auto_81307 ) ) ( not ( = ?auto_81305 ?auto_81307 ) ) ( ON ?auto_81304 ?auto_81305 ) ( ON-TABLE ?auto_81307 ) ( ON ?auto_81300 ?auto_81306 ) ( not ( = ?auto_81300 ?auto_81306 ) ) ( not ( = ?auto_81301 ?auto_81306 ) ) ( not ( = ?auto_81302 ?auto_81306 ) ) ( not ( = ?auto_81303 ?auto_81306 ) ) ( not ( = ?auto_81304 ?auto_81306 ) ) ( not ( = ?auto_81305 ?auto_81306 ) ) ( not ( = ?auto_81307 ?auto_81306 ) ) ( ON ?auto_81301 ?auto_81300 ) ( ON-TABLE ?auto_81306 ) ( ON ?auto_81302 ?auto_81301 ) ( CLEAR ?auto_81304 ) ( ON ?auto_81303 ?auto_81302 ) ( CLEAR ?auto_81303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81306 ?auto_81300 ?auto_81301 ?auto_81302 )
      ( MAKE-6PILE ?auto_81300 ?auto_81301 ?auto_81302 ?auto_81303 ?auto_81304 ?auto_81305 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81308 - BLOCK
      ?auto_81309 - BLOCK
      ?auto_81310 - BLOCK
      ?auto_81311 - BLOCK
      ?auto_81312 - BLOCK
      ?auto_81313 - BLOCK
    )
    :vars
    (
      ?auto_81315 - BLOCK
      ?auto_81314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81308 ?auto_81309 ) ) ( not ( = ?auto_81308 ?auto_81310 ) ) ( not ( = ?auto_81308 ?auto_81311 ) ) ( not ( = ?auto_81308 ?auto_81312 ) ) ( not ( = ?auto_81308 ?auto_81313 ) ) ( not ( = ?auto_81309 ?auto_81310 ) ) ( not ( = ?auto_81309 ?auto_81311 ) ) ( not ( = ?auto_81309 ?auto_81312 ) ) ( not ( = ?auto_81309 ?auto_81313 ) ) ( not ( = ?auto_81310 ?auto_81311 ) ) ( not ( = ?auto_81310 ?auto_81312 ) ) ( not ( = ?auto_81310 ?auto_81313 ) ) ( not ( = ?auto_81311 ?auto_81312 ) ) ( not ( = ?auto_81311 ?auto_81313 ) ) ( not ( = ?auto_81312 ?auto_81313 ) ) ( ON ?auto_81313 ?auto_81315 ) ( not ( = ?auto_81308 ?auto_81315 ) ) ( not ( = ?auto_81309 ?auto_81315 ) ) ( not ( = ?auto_81310 ?auto_81315 ) ) ( not ( = ?auto_81311 ?auto_81315 ) ) ( not ( = ?auto_81312 ?auto_81315 ) ) ( not ( = ?auto_81313 ?auto_81315 ) ) ( ON-TABLE ?auto_81315 ) ( ON ?auto_81308 ?auto_81314 ) ( not ( = ?auto_81308 ?auto_81314 ) ) ( not ( = ?auto_81309 ?auto_81314 ) ) ( not ( = ?auto_81310 ?auto_81314 ) ) ( not ( = ?auto_81311 ?auto_81314 ) ) ( not ( = ?auto_81312 ?auto_81314 ) ) ( not ( = ?auto_81313 ?auto_81314 ) ) ( not ( = ?auto_81315 ?auto_81314 ) ) ( ON ?auto_81309 ?auto_81308 ) ( ON-TABLE ?auto_81314 ) ( ON ?auto_81310 ?auto_81309 ) ( ON ?auto_81311 ?auto_81310 ) ( CLEAR ?auto_81311 ) ( HOLDING ?auto_81312 ) ( CLEAR ?auto_81313 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81315 ?auto_81313 ?auto_81312 )
      ( MAKE-6PILE ?auto_81308 ?auto_81309 ?auto_81310 ?auto_81311 ?auto_81312 ?auto_81313 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81316 - BLOCK
      ?auto_81317 - BLOCK
      ?auto_81318 - BLOCK
      ?auto_81319 - BLOCK
      ?auto_81320 - BLOCK
      ?auto_81321 - BLOCK
    )
    :vars
    (
      ?auto_81322 - BLOCK
      ?auto_81323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81316 ?auto_81317 ) ) ( not ( = ?auto_81316 ?auto_81318 ) ) ( not ( = ?auto_81316 ?auto_81319 ) ) ( not ( = ?auto_81316 ?auto_81320 ) ) ( not ( = ?auto_81316 ?auto_81321 ) ) ( not ( = ?auto_81317 ?auto_81318 ) ) ( not ( = ?auto_81317 ?auto_81319 ) ) ( not ( = ?auto_81317 ?auto_81320 ) ) ( not ( = ?auto_81317 ?auto_81321 ) ) ( not ( = ?auto_81318 ?auto_81319 ) ) ( not ( = ?auto_81318 ?auto_81320 ) ) ( not ( = ?auto_81318 ?auto_81321 ) ) ( not ( = ?auto_81319 ?auto_81320 ) ) ( not ( = ?auto_81319 ?auto_81321 ) ) ( not ( = ?auto_81320 ?auto_81321 ) ) ( ON ?auto_81321 ?auto_81322 ) ( not ( = ?auto_81316 ?auto_81322 ) ) ( not ( = ?auto_81317 ?auto_81322 ) ) ( not ( = ?auto_81318 ?auto_81322 ) ) ( not ( = ?auto_81319 ?auto_81322 ) ) ( not ( = ?auto_81320 ?auto_81322 ) ) ( not ( = ?auto_81321 ?auto_81322 ) ) ( ON-TABLE ?auto_81322 ) ( ON ?auto_81316 ?auto_81323 ) ( not ( = ?auto_81316 ?auto_81323 ) ) ( not ( = ?auto_81317 ?auto_81323 ) ) ( not ( = ?auto_81318 ?auto_81323 ) ) ( not ( = ?auto_81319 ?auto_81323 ) ) ( not ( = ?auto_81320 ?auto_81323 ) ) ( not ( = ?auto_81321 ?auto_81323 ) ) ( not ( = ?auto_81322 ?auto_81323 ) ) ( ON ?auto_81317 ?auto_81316 ) ( ON-TABLE ?auto_81323 ) ( ON ?auto_81318 ?auto_81317 ) ( ON ?auto_81319 ?auto_81318 ) ( CLEAR ?auto_81321 ) ( ON ?auto_81320 ?auto_81319 ) ( CLEAR ?auto_81320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81323 ?auto_81316 ?auto_81317 ?auto_81318 ?auto_81319 )
      ( MAKE-6PILE ?auto_81316 ?auto_81317 ?auto_81318 ?auto_81319 ?auto_81320 ?auto_81321 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81324 - BLOCK
      ?auto_81325 - BLOCK
      ?auto_81326 - BLOCK
      ?auto_81327 - BLOCK
      ?auto_81328 - BLOCK
      ?auto_81329 - BLOCK
    )
    :vars
    (
      ?auto_81330 - BLOCK
      ?auto_81331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81324 ?auto_81325 ) ) ( not ( = ?auto_81324 ?auto_81326 ) ) ( not ( = ?auto_81324 ?auto_81327 ) ) ( not ( = ?auto_81324 ?auto_81328 ) ) ( not ( = ?auto_81324 ?auto_81329 ) ) ( not ( = ?auto_81325 ?auto_81326 ) ) ( not ( = ?auto_81325 ?auto_81327 ) ) ( not ( = ?auto_81325 ?auto_81328 ) ) ( not ( = ?auto_81325 ?auto_81329 ) ) ( not ( = ?auto_81326 ?auto_81327 ) ) ( not ( = ?auto_81326 ?auto_81328 ) ) ( not ( = ?auto_81326 ?auto_81329 ) ) ( not ( = ?auto_81327 ?auto_81328 ) ) ( not ( = ?auto_81327 ?auto_81329 ) ) ( not ( = ?auto_81328 ?auto_81329 ) ) ( not ( = ?auto_81324 ?auto_81330 ) ) ( not ( = ?auto_81325 ?auto_81330 ) ) ( not ( = ?auto_81326 ?auto_81330 ) ) ( not ( = ?auto_81327 ?auto_81330 ) ) ( not ( = ?auto_81328 ?auto_81330 ) ) ( not ( = ?auto_81329 ?auto_81330 ) ) ( ON-TABLE ?auto_81330 ) ( ON ?auto_81324 ?auto_81331 ) ( not ( = ?auto_81324 ?auto_81331 ) ) ( not ( = ?auto_81325 ?auto_81331 ) ) ( not ( = ?auto_81326 ?auto_81331 ) ) ( not ( = ?auto_81327 ?auto_81331 ) ) ( not ( = ?auto_81328 ?auto_81331 ) ) ( not ( = ?auto_81329 ?auto_81331 ) ) ( not ( = ?auto_81330 ?auto_81331 ) ) ( ON ?auto_81325 ?auto_81324 ) ( ON-TABLE ?auto_81331 ) ( ON ?auto_81326 ?auto_81325 ) ( ON ?auto_81327 ?auto_81326 ) ( ON ?auto_81328 ?auto_81327 ) ( CLEAR ?auto_81328 ) ( HOLDING ?auto_81329 ) ( CLEAR ?auto_81330 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81330 ?auto_81329 )
      ( MAKE-6PILE ?auto_81324 ?auto_81325 ?auto_81326 ?auto_81327 ?auto_81328 ?auto_81329 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81332 - BLOCK
      ?auto_81333 - BLOCK
      ?auto_81334 - BLOCK
      ?auto_81335 - BLOCK
      ?auto_81336 - BLOCK
      ?auto_81337 - BLOCK
    )
    :vars
    (
      ?auto_81339 - BLOCK
      ?auto_81338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81332 ?auto_81333 ) ) ( not ( = ?auto_81332 ?auto_81334 ) ) ( not ( = ?auto_81332 ?auto_81335 ) ) ( not ( = ?auto_81332 ?auto_81336 ) ) ( not ( = ?auto_81332 ?auto_81337 ) ) ( not ( = ?auto_81333 ?auto_81334 ) ) ( not ( = ?auto_81333 ?auto_81335 ) ) ( not ( = ?auto_81333 ?auto_81336 ) ) ( not ( = ?auto_81333 ?auto_81337 ) ) ( not ( = ?auto_81334 ?auto_81335 ) ) ( not ( = ?auto_81334 ?auto_81336 ) ) ( not ( = ?auto_81334 ?auto_81337 ) ) ( not ( = ?auto_81335 ?auto_81336 ) ) ( not ( = ?auto_81335 ?auto_81337 ) ) ( not ( = ?auto_81336 ?auto_81337 ) ) ( not ( = ?auto_81332 ?auto_81339 ) ) ( not ( = ?auto_81333 ?auto_81339 ) ) ( not ( = ?auto_81334 ?auto_81339 ) ) ( not ( = ?auto_81335 ?auto_81339 ) ) ( not ( = ?auto_81336 ?auto_81339 ) ) ( not ( = ?auto_81337 ?auto_81339 ) ) ( ON-TABLE ?auto_81339 ) ( ON ?auto_81332 ?auto_81338 ) ( not ( = ?auto_81332 ?auto_81338 ) ) ( not ( = ?auto_81333 ?auto_81338 ) ) ( not ( = ?auto_81334 ?auto_81338 ) ) ( not ( = ?auto_81335 ?auto_81338 ) ) ( not ( = ?auto_81336 ?auto_81338 ) ) ( not ( = ?auto_81337 ?auto_81338 ) ) ( not ( = ?auto_81339 ?auto_81338 ) ) ( ON ?auto_81333 ?auto_81332 ) ( ON-TABLE ?auto_81338 ) ( ON ?auto_81334 ?auto_81333 ) ( ON ?auto_81335 ?auto_81334 ) ( ON ?auto_81336 ?auto_81335 ) ( CLEAR ?auto_81339 ) ( ON ?auto_81337 ?auto_81336 ) ( CLEAR ?auto_81337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81338 ?auto_81332 ?auto_81333 ?auto_81334 ?auto_81335 ?auto_81336 )
      ( MAKE-6PILE ?auto_81332 ?auto_81333 ?auto_81334 ?auto_81335 ?auto_81336 ?auto_81337 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81340 - BLOCK
      ?auto_81341 - BLOCK
      ?auto_81342 - BLOCK
      ?auto_81343 - BLOCK
      ?auto_81344 - BLOCK
      ?auto_81345 - BLOCK
    )
    :vars
    (
      ?auto_81346 - BLOCK
      ?auto_81347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81340 ?auto_81341 ) ) ( not ( = ?auto_81340 ?auto_81342 ) ) ( not ( = ?auto_81340 ?auto_81343 ) ) ( not ( = ?auto_81340 ?auto_81344 ) ) ( not ( = ?auto_81340 ?auto_81345 ) ) ( not ( = ?auto_81341 ?auto_81342 ) ) ( not ( = ?auto_81341 ?auto_81343 ) ) ( not ( = ?auto_81341 ?auto_81344 ) ) ( not ( = ?auto_81341 ?auto_81345 ) ) ( not ( = ?auto_81342 ?auto_81343 ) ) ( not ( = ?auto_81342 ?auto_81344 ) ) ( not ( = ?auto_81342 ?auto_81345 ) ) ( not ( = ?auto_81343 ?auto_81344 ) ) ( not ( = ?auto_81343 ?auto_81345 ) ) ( not ( = ?auto_81344 ?auto_81345 ) ) ( not ( = ?auto_81340 ?auto_81346 ) ) ( not ( = ?auto_81341 ?auto_81346 ) ) ( not ( = ?auto_81342 ?auto_81346 ) ) ( not ( = ?auto_81343 ?auto_81346 ) ) ( not ( = ?auto_81344 ?auto_81346 ) ) ( not ( = ?auto_81345 ?auto_81346 ) ) ( ON ?auto_81340 ?auto_81347 ) ( not ( = ?auto_81340 ?auto_81347 ) ) ( not ( = ?auto_81341 ?auto_81347 ) ) ( not ( = ?auto_81342 ?auto_81347 ) ) ( not ( = ?auto_81343 ?auto_81347 ) ) ( not ( = ?auto_81344 ?auto_81347 ) ) ( not ( = ?auto_81345 ?auto_81347 ) ) ( not ( = ?auto_81346 ?auto_81347 ) ) ( ON ?auto_81341 ?auto_81340 ) ( ON-TABLE ?auto_81347 ) ( ON ?auto_81342 ?auto_81341 ) ( ON ?auto_81343 ?auto_81342 ) ( ON ?auto_81344 ?auto_81343 ) ( ON ?auto_81345 ?auto_81344 ) ( CLEAR ?auto_81345 ) ( HOLDING ?auto_81346 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81346 )
      ( MAKE-6PILE ?auto_81340 ?auto_81341 ?auto_81342 ?auto_81343 ?auto_81344 ?auto_81345 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81348 - BLOCK
      ?auto_81349 - BLOCK
      ?auto_81350 - BLOCK
      ?auto_81351 - BLOCK
      ?auto_81352 - BLOCK
      ?auto_81353 - BLOCK
    )
    :vars
    (
      ?auto_81355 - BLOCK
      ?auto_81354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81348 ?auto_81349 ) ) ( not ( = ?auto_81348 ?auto_81350 ) ) ( not ( = ?auto_81348 ?auto_81351 ) ) ( not ( = ?auto_81348 ?auto_81352 ) ) ( not ( = ?auto_81348 ?auto_81353 ) ) ( not ( = ?auto_81349 ?auto_81350 ) ) ( not ( = ?auto_81349 ?auto_81351 ) ) ( not ( = ?auto_81349 ?auto_81352 ) ) ( not ( = ?auto_81349 ?auto_81353 ) ) ( not ( = ?auto_81350 ?auto_81351 ) ) ( not ( = ?auto_81350 ?auto_81352 ) ) ( not ( = ?auto_81350 ?auto_81353 ) ) ( not ( = ?auto_81351 ?auto_81352 ) ) ( not ( = ?auto_81351 ?auto_81353 ) ) ( not ( = ?auto_81352 ?auto_81353 ) ) ( not ( = ?auto_81348 ?auto_81355 ) ) ( not ( = ?auto_81349 ?auto_81355 ) ) ( not ( = ?auto_81350 ?auto_81355 ) ) ( not ( = ?auto_81351 ?auto_81355 ) ) ( not ( = ?auto_81352 ?auto_81355 ) ) ( not ( = ?auto_81353 ?auto_81355 ) ) ( ON ?auto_81348 ?auto_81354 ) ( not ( = ?auto_81348 ?auto_81354 ) ) ( not ( = ?auto_81349 ?auto_81354 ) ) ( not ( = ?auto_81350 ?auto_81354 ) ) ( not ( = ?auto_81351 ?auto_81354 ) ) ( not ( = ?auto_81352 ?auto_81354 ) ) ( not ( = ?auto_81353 ?auto_81354 ) ) ( not ( = ?auto_81355 ?auto_81354 ) ) ( ON ?auto_81349 ?auto_81348 ) ( ON-TABLE ?auto_81354 ) ( ON ?auto_81350 ?auto_81349 ) ( ON ?auto_81351 ?auto_81350 ) ( ON ?auto_81352 ?auto_81351 ) ( ON ?auto_81353 ?auto_81352 ) ( ON ?auto_81355 ?auto_81353 ) ( CLEAR ?auto_81355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81354 ?auto_81348 ?auto_81349 ?auto_81350 ?auto_81351 ?auto_81352 ?auto_81353 )
      ( MAKE-6PILE ?auto_81348 ?auto_81349 ?auto_81350 ?auto_81351 ?auto_81352 ?auto_81353 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81370 - BLOCK
      ?auto_81371 - BLOCK
      ?auto_81372 - BLOCK
      ?auto_81373 - BLOCK
      ?auto_81374 - BLOCK
      ?auto_81375 - BLOCK
      ?auto_81376 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81375 ) ( ON-TABLE ?auto_81370 ) ( ON ?auto_81371 ?auto_81370 ) ( ON ?auto_81372 ?auto_81371 ) ( ON ?auto_81373 ?auto_81372 ) ( ON ?auto_81374 ?auto_81373 ) ( ON ?auto_81375 ?auto_81374 ) ( not ( = ?auto_81370 ?auto_81371 ) ) ( not ( = ?auto_81370 ?auto_81372 ) ) ( not ( = ?auto_81370 ?auto_81373 ) ) ( not ( = ?auto_81370 ?auto_81374 ) ) ( not ( = ?auto_81370 ?auto_81375 ) ) ( not ( = ?auto_81370 ?auto_81376 ) ) ( not ( = ?auto_81371 ?auto_81372 ) ) ( not ( = ?auto_81371 ?auto_81373 ) ) ( not ( = ?auto_81371 ?auto_81374 ) ) ( not ( = ?auto_81371 ?auto_81375 ) ) ( not ( = ?auto_81371 ?auto_81376 ) ) ( not ( = ?auto_81372 ?auto_81373 ) ) ( not ( = ?auto_81372 ?auto_81374 ) ) ( not ( = ?auto_81372 ?auto_81375 ) ) ( not ( = ?auto_81372 ?auto_81376 ) ) ( not ( = ?auto_81373 ?auto_81374 ) ) ( not ( = ?auto_81373 ?auto_81375 ) ) ( not ( = ?auto_81373 ?auto_81376 ) ) ( not ( = ?auto_81374 ?auto_81375 ) ) ( not ( = ?auto_81374 ?auto_81376 ) ) ( not ( = ?auto_81375 ?auto_81376 ) ) ( ON-TABLE ?auto_81376 ) ( CLEAR ?auto_81376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_81376 )
      ( MAKE-7PILE ?auto_81370 ?auto_81371 ?auto_81372 ?auto_81373 ?auto_81374 ?auto_81375 ?auto_81376 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81377 - BLOCK
      ?auto_81378 - BLOCK
      ?auto_81379 - BLOCK
      ?auto_81380 - BLOCK
      ?auto_81381 - BLOCK
      ?auto_81382 - BLOCK
      ?auto_81383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81377 ) ( ON ?auto_81378 ?auto_81377 ) ( ON ?auto_81379 ?auto_81378 ) ( ON ?auto_81380 ?auto_81379 ) ( ON ?auto_81381 ?auto_81380 ) ( not ( = ?auto_81377 ?auto_81378 ) ) ( not ( = ?auto_81377 ?auto_81379 ) ) ( not ( = ?auto_81377 ?auto_81380 ) ) ( not ( = ?auto_81377 ?auto_81381 ) ) ( not ( = ?auto_81377 ?auto_81382 ) ) ( not ( = ?auto_81377 ?auto_81383 ) ) ( not ( = ?auto_81378 ?auto_81379 ) ) ( not ( = ?auto_81378 ?auto_81380 ) ) ( not ( = ?auto_81378 ?auto_81381 ) ) ( not ( = ?auto_81378 ?auto_81382 ) ) ( not ( = ?auto_81378 ?auto_81383 ) ) ( not ( = ?auto_81379 ?auto_81380 ) ) ( not ( = ?auto_81379 ?auto_81381 ) ) ( not ( = ?auto_81379 ?auto_81382 ) ) ( not ( = ?auto_81379 ?auto_81383 ) ) ( not ( = ?auto_81380 ?auto_81381 ) ) ( not ( = ?auto_81380 ?auto_81382 ) ) ( not ( = ?auto_81380 ?auto_81383 ) ) ( not ( = ?auto_81381 ?auto_81382 ) ) ( not ( = ?auto_81381 ?auto_81383 ) ) ( not ( = ?auto_81382 ?auto_81383 ) ) ( ON-TABLE ?auto_81383 ) ( CLEAR ?auto_81383 ) ( HOLDING ?auto_81382 ) ( CLEAR ?auto_81381 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81377 ?auto_81378 ?auto_81379 ?auto_81380 ?auto_81381 ?auto_81382 )
      ( MAKE-7PILE ?auto_81377 ?auto_81378 ?auto_81379 ?auto_81380 ?auto_81381 ?auto_81382 ?auto_81383 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81384 - BLOCK
      ?auto_81385 - BLOCK
      ?auto_81386 - BLOCK
      ?auto_81387 - BLOCK
      ?auto_81388 - BLOCK
      ?auto_81389 - BLOCK
      ?auto_81390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81384 ) ( ON ?auto_81385 ?auto_81384 ) ( ON ?auto_81386 ?auto_81385 ) ( ON ?auto_81387 ?auto_81386 ) ( ON ?auto_81388 ?auto_81387 ) ( not ( = ?auto_81384 ?auto_81385 ) ) ( not ( = ?auto_81384 ?auto_81386 ) ) ( not ( = ?auto_81384 ?auto_81387 ) ) ( not ( = ?auto_81384 ?auto_81388 ) ) ( not ( = ?auto_81384 ?auto_81389 ) ) ( not ( = ?auto_81384 ?auto_81390 ) ) ( not ( = ?auto_81385 ?auto_81386 ) ) ( not ( = ?auto_81385 ?auto_81387 ) ) ( not ( = ?auto_81385 ?auto_81388 ) ) ( not ( = ?auto_81385 ?auto_81389 ) ) ( not ( = ?auto_81385 ?auto_81390 ) ) ( not ( = ?auto_81386 ?auto_81387 ) ) ( not ( = ?auto_81386 ?auto_81388 ) ) ( not ( = ?auto_81386 ?auto_81389 ) ) ( not ( = ?auto_81386 ?auto_81390 ) ) ( not ( = ?auto_81387 ?auto_81388 ) ) ( not ( = ?auto_81387 ?auto_81389 ) ) ( not ( = ?auto_81387 ?auto_81390 ) ) ( not ( = ?auto_81388 ?auto_81389 ) ) ( not ( = ?auto_81388 ?auto_81390 ) ) ( not ( = ?auto_81389 ?auto_81390 ) ) ( ON-TABLE ?auto_81390 ) ( CLEAR ?auto_81388 ) ( ON ?auto_81389 ?auto_81390 ) ( CLEAR ?auto_81389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81390 )
      ( MAKE-7PILE ?auto_81384 ?auto_81385 ?auto_81386 ?auto_81387 ?auto_81388 ?auto_81389 ?auto_81390 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81391 - BLOCK
      ?auto_81392 - BLOCK
      ?auto_81393 - BLOCK
      ?auto_81394 - BLOCK
      ?auto_81395 - BLOCK
      ?auto_81396 - BLOCK
      ?auto_81397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81391 ) ( ON ?auto_81392 ?auto_81391 ) ( ON ?auto_81393 ?auto_81392 ) ( ON ?auto_81394 ?auto_81393 ) ( not ( = ?auto_81391 ?auto_81392 ) ) ( not ( = ?auto_81391 ?auto_81393 ) ) ( not ( = ?auto_81391 ?auto_81394 ) ) ( not ( = ?auto_81391 ?auto_81395 ) ) ( not ( = ?auto_81391 ?auto_81396 ) ) ( not ( = ?auto_81391 ?auto_81397 ) ) ( not ( = ?auto_81392 ?auto_81393 ) ) ( not ( = ?auto_81392 ?auto_81394 ) ) ( not ( = ?auto_81392 ?auto_81395 ) ) ( not ( = ?auto_81392 ?auto_81396 ) ) ( not ( = ?auto_81392 ?auto_81397 ) ) ( not ( = ?auto_81393 ?auto_81394 ) ) ( not ( = ?auto_81393 ?auto_81395 ) ) ( not ( = ?auto_81393 ?auto_81396 ) ) ( not ( = ?auto_81393 ?auto_81397 ) ) ( not ( = ?auto_81394 ?auto_81395 ) ) ( not ( = ?auto_81394 ?auto_81396 ) ) ( not ( = ?auto_81394 ?auto_81397 ) ) ( not ( = ?auto_81395 ?auto_81396 ) ) ( not ( = ?auto_81395 ?auto_81397 ) ) ( not ( = ?auto_81396 ?auto_81397 ) ) ( ON-TABLE ?auto_81397 ) ( ON ?auto_81396 ?auto_81397 ) ( CLEAR ?auto_81396 ) ( HOLDING ?auto_81395 ) ( CLEAR ?auto_81394 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81391 ?auto_81392 ?auto_81393 ?auto_81394 ?auto_81395 )
      ( MAKE-7PILE ?auto_81391 ?auto_81392 ?auto_81393 ?auto_81394 ?auto_81395 ?auto_81396 ?auto_81397 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81398 - BLOCK
      ?auto_81399 - BLOCK
      ?auto_81400 - BLOCK
      ?auto_81401 - BLOCK
      ?auto_81402 - BLOCK
      ?auto_81403 - BLOCK
      ?auto_81404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81398 ) ( ON ?auto_81399 ?auto_81398 ) ( ON ?auto_81400 ?auto_81399 ) ( ON ?auto_81401 ?auto_81400 ) ( not ( = ?auto_81398 ?auto_81399 ) ) ( not ( = ?auto_81398 ?auto_81400 ) ) ( not ( = ?auto_81398 ?auto_81401 ) ) ( not ( = ?auto_81398 ?auto_81402 ) ) ( not ( = ?auto_81398 ?auto_81403 ) ) ( not ( = ?auto_81398 ?auto_81404 ) ) ( not ( = ?auto_81399 ?auto_81400 ) ) ( not ( = ?auto_81399 ?auto_81401 ) ) ( not ( = ?auto_81399 ?auto_81402 ) ) ( not ( = ?auto_81399 ?auto_81403 ) ) ( not ( = ?auto_81399 ?auto_81404 ) ) ( not ( = ?auto_81400 ?auto_81401 ) ) ( not ( = ?auto_81400 ?auto_81402 ) ) ( not ( = ?auto_81400 ?auto_81403 ) ) ( not ( = ?auto_81400 ?auto_81404 ) ) ( not ( = ?auto_81401 ?auto_81402 ) ) ( not ( = ?auto_81401 ?auto_81403 ) ) ( not ( = ?auto_81401 ?auto_81404 ) ) ( not ( = ?auto_81402 ?auto_81403 ) ) ( not ( = ?auto_81402 ?auto_81404 ) ) ( not ( = ?auto_81403 ?auto_81404 ) ) ( ON-TABLE ?auto_81404 ) ( ON ?auto_81403 ?auto_81404 ) ( CLEAR ?auto_81401 ) ( ON ?auto_81402 ?auto_81403 ) ( CLEAR ?auto_81402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81404 ?auto_81403 )
      ( MAKE-7PILE ?auto_81398 ?auto_81399 ?auto_81400 ?auto_81401 ?auto_81402 ?auto_81403 ?auto_81404 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81405 - BLOCK
      ?auto_81406 - BLOCK
      ?auto_81407 - BLOCK
      ?auto_81408 - BLOCK
      ?auto_81409 - BLOCK
      ?auto_81410 - BLOCK
      ?auto_81411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81405 ) ( ON ?auto_81406 ?auto_81405 ) ( ON ?auto_81407 ?auto_81406 ) ( not ( = ?auto_81405 ?auto_81406 ) ) ( not ( = ?auto_81405 ?auto_81407 ) ) ( not ( = ?auto_81405 ?auto_81408 ) ) ( not ( = ?auto_81405 ?auto_81409 ) ) ( not ( = ?auto_81405 ?auto_81410 ) ) ( not ( = ?auto_81405 ?auto_81411 ) ) ( not ( = ?auto_81406 ?auto_81407 ) ) ( not ( = ?auto_81406 ?auto_81408 ) ) ( not ( = ?auto_81406 ?auto_81409 ) ) ( not ( = ?auto_81406 ?auto_81410 ) ) ( not ( = ?auto_81406 ?auto_81411 ) ) ( not ( = ?auto_81407 ?auto_81408 ) ) ( not ( = ?auto_81407 ?auto_81409 ) ) ( not ( = ?auto_81407 ?auto_81410 ) ) ( not ( = ?auto_81407 ?auto_81411 ) ) ( not ( = ?auto_81408 ?auto_81409 ) ) ( not ( = ?auto_81408 ?auto_81410 ) ) ( not ( = ?auto_81408 ?auto_81411 ) ) ( not ( = ?auto_81409 ?auto_81410 ) ) ( not ( = ?auto_81409 ?auto_81411 ) ) ( not ( = ?auto_81410 ?auto_81411 ) ) ( ON-TABLE ?auto_81411 ) ( ON ?auto_81410 ?auto_81411 ) ( ON ?auto_81409 ?auto_81410 ) ( CLEAR ?auto_81409 ) ( HOLDING ?auto_81408 ) ( CLEAR ?auto_81407 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81405 ?auto_81406 ?auto_81407 ?auto_81408 )
      ( MAKE-7PILE ?auto_81405 ?auto_81406 ?auto_81407 ?auto_81408 ?auto_81409 ?auto_81410 ?auto_81411 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81412 - BLOCK
      ?auto_81413 - BLOCK
      ?auto_81414 - BLOCK
      ?auto_81415 - BLOCK
      ?auto_81416 - BLOCK
      ?auto_81417 - BLOCK
      ?auto_81418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81412 ) ( ON ?auto_81413 ?auto_81412 ) ( ON ?auto_81414 ?auto_81413 ) ( not ( = ?auto_81412 ?auto_81413 ) ) ( not ( = ?auto_81412 ?auto_81414 ) ) ( not ( = ?auto_81412 ?auto_81415 ) ) ( not ( = ?auto_81412 ?auto_81416 ) ) ( not ( = ?auto_81412 ?auto_81417 ) ) ( not ( = ?auto_81412 ?auto_81418 ) ) ( not ( = ?auto_81413 ?auto_81414 ) ) ( not ( = ?auto_81413 ?auto_81415 ) ) ( not ( = ?auto_81413 ?auto_81416 ) ) ( not ( = ?auto_81413 ?auto_81417 ) ) ( not ( = ?auto_81413 ?auto_81418 ) ) ( not ( = ?auto_81414 ?auto_81415 ) ) ( not ( = ?auto_81414 ?auto_81416 ) ) ( not ( = ?auto_81414 ?auto_81417 ) ) ( not ( = ?auto_81414 ?auto_81418 ) ) ( not ( = ?auto_81415 ?auto_81416 ) ) ( not ( = ?auto_81415 ?auto_81417 ) ) ( not ( = ?auto_81415 ?auto_81418 ) ) ( not ( = ?auto_81416 ?auto_81417 ) ) ( not ( = ?auto_81416 ?auto_81418 ) ) ( not ( = ?auto_81417 ?auto_81418 ) ) ( ON-TABLE ?auto_81418 ) ( ON ?auto_81417 ?auto_81418 ) ( ON ?auto_81416 ?auto_81417 ) ( CLEAR ?auto_81414 ) ( ON ?auto_81415 ?auto_81416 ) ( CLEAR ?auto_81415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81418 ?auto_81417 ?auto_81416 )
      ( MAKE-7PILE ?auto_81412 ?auto_81413 ?auto_81414 ?auto_81415 ?auto_81416 ?auto_81417 ?auto_81418 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81419 - BLOCK
      ?auto_81420 - BLOCK
      ?auto_81421 - BLOCK
      ?auto_81422 - BLOCK
      ?auto_81423 - BLOCK
      ?auto_81424 - BLOCK
      ?auto_81425 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81419 ) ( ON ?auto_81420 ?auto_81419 ) ( not ( = ?auto_81419 ?auto_81420 ) ) ( not ( = ?auto_81419 ?auto_81421 ) ) ( not ( = ?auto_81419 ?auto_81422 ) ) ( not ( = ?auto_81419 ?auto_81423 ) ) ( not ( = ?auto_81419 ?auto_81424 ) ) ( not ( = ?auto_81419 ?auto_81425 ) ) ( not ( = ?auto_81420 ?auto_81421 ) ) ( not ( = ?auto_81420 ?auto_81422 ) ) ( not ( = ?auto_81420 ?auto_81423 ) ) ( not ( = ?auto_81420 ?auto_81424 ) ) ( not ( = ?auto_81420 ?auto_81425 ) ) ( not ( = ?auto_81421 ?auto_81422 ) ) ( not ( = ?auto_81421 ?auto_81423 ) ) ( not ( = ?auto_81421 ?auto_81424 ) ) ( not ( = ?auto_81421 ?auto_81425 ) ) ( not ( = ?auto_81422 ?auto_81423 ) ) ( not ( = ?auto_81422 ?auto_81424 ) ) ( not ( = ?auto_81422 ?auto_81425 ) ) ( not ( = ?auto_81423 ?auto_81424 ) ) ( not ( = ?auto_81423 ?auto_81425 ) ) ( not ( = ?auto_81424 ?auto_81425 ) ) ( ON-TABLE ?auto_81425 ) ( ON ?auto_81424 ?auto_81425 ) ( ON ?auto_81423 ?auto_81424 ) ( ON ?auto_81422 ?auto_81423 ) ( CLEAR ?auto_81422 ) ( HOLDING ?auto_81421 ) ( CLEAR ?auto_81420 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81419 ?auto_81420 ?auto_81421 )
      ( MAKE-7PILE ?auto_81419 ?auto_81420 ?auto_81421 ?auto_81422 ?auto_81423 ?auto_81424 ?auto_81425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81426 - BLOCK
      ?auto_81427 - BLOCK
      ?auto_81428 - BLOCK
      ?auto_81429 - BLOCK
      ?auto_81430 - BLOCK
      ?auto_81431 - BLOCK
      ?auto_81432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81426 ) ( ON ?auto_81427 ?auto_81426 ) ( not ( = ?auto_81426 ?auto_81427 ) ) ( not ( = ?auto_81426 ?auto_81428 ) ) ( not ( = ?auto_81426 ?auto_81429 ) ) ( not ( = ?auto_81426 ?auto_81430 ) ) ( not ( = ?auto_81426 ?auto_81431 ) ) ( not ( = ?auto_81426 ?auto_81432 ) ) ( not ( = ?auto_81427 ?auto_81428 ) ) ( not ( = ?auto_81427 ?auto_81429 ) ) ( not ( = ?auto_81427 ?auto_81430 ) ) ( not ( = ?auto_81427 ?auto_81431 ) ) ( not ( = ?auto_81427 ?auto_81432 ) ) ( not ( = ?auto_81428 ?auto_81429 ) ) ( not ( = ?auto_81428 ?auto_81430 ) ) ( not ( = ?auto_81428 ?auto_81431 ) ) ( not ( = ?auto_81428 ?auto_81432 ) ) ( not ( = ?auto_81429 ?auto_81430 ) ) ( not ( = ?auto_81429 ?auto_81431 ) ) ( not ( = ?auto_81429 ?auto_81432 ) ) ( not ( = ?auto_81430 ?auto_81431 ) ) ( not ( = ?auto_81430 ?auto_81432 ) ) ( not ( = ?auto_81431 ?auto_81432 ) ) ( ON-TABLE ?auto_81432 ) ( ON ?auto_81431 ?auto_81432 ) ( ON ?auto_81430 ?auto_81431 ) ( ON ?auto_81429 ?auto_81430 ) ( CLEAR ?auto_81427 ) ( ON ?auto_81428 ?auto_81429 ) ( CLEAR ?auto_81428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81432 ?auto_81431 ?auto_81430 ?auto_81429 )
      ( MAKE-7PILE ?auto_81426 ?auto_81427 ?auto_81428 ?auto_81429 ?auto_81430 ?auto_81431 ?auto_81432 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81433 - BLOCK
      ?auto_81434 - BLOCK
      ?auto_81435 - BLOCK
      ?auto_81436 - BLOCK
      ?auto_81437 - BLOCK
      ?auto_81438 - BLOCK
      ?auto_81439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81433 ) ( not ( = ?auto_81433 ?auto_81434 ) ) ( not ( = ?auto_81433 ?auto_81435 ) ) ( not ( = ?auto_81433 ?auto_81436 ) ) ( not ( = ?auto_81433 ?auto_81437 ) ) ( not ( = ?auto_81433 ?auto_81438 ) ) ( not ( = ?auto_81433 ?auto_81439 ) ) ( not ( = ?auto_81434 ?auto_81435 ) ) ( not ( = ?auto_81434 ?auto_81436 ) ) ( not ( = ?auto_81434 ?auto_81437 ) ) ( not ( = ?auto_81434 ?auto_81438 ) ) ( not ( = ?auto_81434 ?auto_81439 ) ) ( not ( = ?auto_81435 ?auto_81436 ) ) ( not ( = ?auto_81435 ?auto_81437 ) ) ( not ( = ?auto_81435 ?auto_81438 ) ) ( not ( = ?auto_81435 ?auto_81439 ) ) ( not ( = ?auto_81436 ?auto_81437 ) ) ( not ( = ?auto_81436 ?auto_81438 ) ) ( not ( = ?auto_81436 ?auto_81439 ) ) ( not ( = ?auto_81437 ?auto_81438 ) ) ( not ( = ?auto_81437 ?auto_81439 ) ) ( not ( = ?auto_81438 ?auto_81439 ) ) ( ON-TABLE ?auto_81439 ) ( ON ?auto_81438 ?auto_81439 ) ( ON ?auto_81437 ?auto_81438 ) ( ON ?auto_81436 ?auto_81437 ) ( ON ?auto_81435 ?auto_81436 ) ( CLEAR ?auto_81435 ) ( HOLDING ?auto_81434 ) ( CLEAR ?auto_81433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81433 ?auto_81434 )
      ( MAKE-7PILE ?auto_81433 ?auto_81434 ?auto_81435 ?auto_81436 ?auto_81437 ?auto_81438 ?auto_81439 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81440 - BLOCK
      ?auto_81441 - BLOCK
      ?auto_81442 - BLOCK
      ?auto_81443 - BLOCK
      ?auto_81444 - BLOCK
      ?auto_81445 - BLOCK
      ?auto_81446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81440 ) ( not ( = ?auto_81440 ?auto_81441 ) ) ( not ( = ?auto_81440 ?auto_81442 ) ) ( not ( = ?auto_81440 ?auto_81443 ) ) ( not ( = ?auto_81440 ?auto_81444 ) ) ( not ( = ?auto_81440 ?auto_81445 ) ) ( not ( = ?auto_81440 ?auto_81446 ) ) ( not ( = ?auto_81441 ?auto_81442 ) ) ( not ( = ?auto_81441 ?auto_81443 ) ) ( not ( = ?auto_81441 ?auto_81444 ) ) ( not ( = ?auto_81441 ?auto_81445 ) ) ( not ( = ?auto_81441 ?auto_81446 ) ) ( not ( = ?auto_81442 ?auto_81443 ) ) ( not ( = ?auto_81442 ?auto_81444 ) ) ( not ( = ?auto_81442 ?auto_81445 ) ) ( not ( = ?auto_81442 ?auto_81446 ) ) ( not ( = ?auto_81443 ?auto_81444 ) ) ( not ( = ?auto_81443 ?auto_81445 ) ) ( not ( = ?auto_81443 ?auto_81446 ) ) ( not ( = ?auto_81444 ?auto_81445 ) ) ( not ( = ?auto_81444 ?auto_81446 ) ) ( not ( = ?auto_81445 ?auto_81446 ) ) ( ON-TABLE ?auto_81446 ) ( ON ?auto_81445 ?auto_81446 ) ( ON ?auto_81444 ?auto_81445 ) ( ON ?auto_81443 ?auto_81444 ) ( ON ?auto_81442 ?auto_81443 ) ( CLEAR ?auto_81440 ) ( ON ?auto_81441 ?auto_81442 ) ( CLEAR ?auto_81441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81446 ?auto_81445 ?auto_81444 ?auto_81443 ?auto_81442 )
      ( MAKE-7PILE ?auto_81440 ?auto_81441 ?auto_81442 ?auto_81443 ?auto_81444 ?auto_81445 ?auto_81446 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81447 - BLOCK
      ?auto_81448 - BLOCK
      ?auto_81449 - BLOCK
      ?auto_81450 - BLOCK
      ?auto_81451 - BLOCK
      ?auto_81452 - BLOCK
      ?auto_81453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81447 ?auto_81448 ) ) ( not ( = ?auto_81447 ?auto_81449 ) ) ( not ( = ?auto_81447 ?auto_81450 ) ) ( not ( = ?auto_81447 ?auto_81451 ) ) ( not ( = ?auto_81447 ?auto_81452 ) ) ( not ( = ?auto_81447 ?auto_81453 ) ) ( not ( = ?auto_81448 ?auto_81449 ) ) ( not ( = ?auto_81448 ?auto_81450 ) ) ( not ( = ?auto_81448 ?auto_81451 ) ) ( not ( = ?auto_81448 ?auto_81452 ) ) ( not ( = ?auto_81448 ?auto_81453 ) ) ( not ( = ?auto_81449 ?auto_81450 ) ) ( not ( = ?auto_81449 ?auto_81451 ) ) ( not ( = ?auto_81449 ?auto_81452 ) ) ( not ( = ?auto_81449 ?auto_81453 ) ) ( not ( = ?auto_81450 ?auto_81451 ) ) ( not ( = ?auto_81450 ?auto_81452 ) ) ( not ( = ?auto_81450 ?auto_81453 ) ) ( not ( = ?auto_81451 ?auto_81452 ) ) ( not ( = ?auto_81451 ?auto_81453 ) ) ( not ( = ?auto_81452 ?auto_81453 ) ) ( ON-TABLE ?auto_81453 ) ( ON ?auto_81452 ?auto_81453 ) ( ON ?auto_81451 ?auto_81452 ) ( ON ?auto_81450 ?auto_81451 ) ( ON ?auto_81449 ?auto_81450 ) ( ON ?auto_81448 ?auto_81449 ) ( CLEAR ?auto_81448 ) ( HOLDING ?auto_81447 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81447 )
      ( MAKE-7PILE ?auto_81447 ?auto_81448 ?auto_81449 ?auto_81450 ?auto_81451 ?auto_81452 ?auto_81453 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81454 - BLOCK
      ?auto_81455 - BLOCK
      ?auto_81456 - BLOCK
      ?auto_81457 - BLOCK
      ?auto_81458 - BLOCK
      ?auto_81459 - BLOCK
      ?auto_81460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81454 ?auto_81455 ) ) ( not ( = ?auto_81454 ?auto_81456 ) ) ( not ( = ?auto_81454 ?auto_81457 ) ) ( not ( = ?auto_81454 ?auto_81458 ) ) ( not ( = ?auto_81454 ?auto_81459 ) ) ( not ( = ?auto_81454 ?auto_81460 ) ) ( not ( = ?auto_81455 ?auto_81456 ) ) ( not ( = ?auto_81455 ?auto_81457 ) ) ( not ( = ?auto_81455 ?auto_81458 ) ) ( not ( = ?auto_81455 ?auto_81459 ) ) ( not ( = ?auto_81455 ?auto_81460 ) ) ( not ( = ?auto_81456 ?auto_81457 ) ) ( not ( = ?auto_81456 ?auto_81458 ) ) ( not ( = ?auto_81456 ?auto_81459 ) ) ( not ( = ?auto_81456 ?auto_81460 ) ) ( not ( = ?auto_81457 ?auto_81458 ) ) ( not ( = ?auto_81457 ?auto_81459 ) ) ( not ( = ?auto_81457 ?auto_81460 ) ) ( not ( = ?auto_81458 ?auto_81459 ) ) ( not ( = ?auto_81458 ?auto_81460 ) ) ( not ( = ?auto_81459 ?auto_81460 ) ) ( ON-TABLE ?auto_81460 ) ( ON ?auto_81459 ?auto_81460 ) ( ON ?auto_81458 ?auto_81459 ) ( ON ?auto_81457 ?auto_81458 ) ( ON ?auto_81456 ?auto_81457 ) ( ON ?auto_81455 ?auto_81456 ) ( ON ?auto_81454 ?auto_81455 ) ( CLEAR ?auto_81454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81460 ?auto_81459 ?auto_81458 ?auto_81457 ?auto_81456 ?auto_81455 )
      ( MAKE-7PILE ?auto_81454 ?auto_81455 ?auto_81456 ?auto_81457 ?auto_81458 ?auto_81459 ?auto_81460 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81468 - BLOCK
      ?auto_81469 - BLOCK
      ?auto_81470 - BLOCK
      ?auto_81471 - BLOCK
      ?auto_81472 - BLOCK
      ?auto_81473 - BLOCK
      ?auto_81474 - BLOCK
    )
    :vars
    (
      ?auto_81475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81468 ?auto_81469 ) ) ( not ( = ?auto_81468 ?auto_81470 ) ) ( not ( = ?auto_81468 ?auto_81471 ) ) ( not ( = ?auto_81468 ?auto_81472 ) ) ( not ( = ?auto_81468 ?auto_81473 ) ) ( not ( = ?auto_81468 ?auto_81474 ) ) ( not ( = ?auto_81469 ?auto_81470 ) ) ( not ( = ?auto_81469 ?auto_81471 ) ) ( not ( = ?auto_81469 ?auto_81472 ) ) ( not ( = ?auto_81469 ?auto_81473 ) ) ( not ( = ?auto_81469 ?auto_81474 ) ) ( not ( = ?auto_81470 ?auto_81471 ) ) ( not ( = ?auto_81470 ?auto_81472 ) ) ( not ( = ?auto_81470 ?auto_81473 ) ) ( not ( = ?auto_81470 ?auto_81474 ) ) ( not ( = ?auto_81471 ?auto_81472 ) ) ( not ( = ?auto_81471 ?auto_81473 ) ) ( not ( = ?auto_81471 ?auto_81474 ) ) ( not ( = ?auto_81472 ?auto_81473 ) ) ( not ( = ?auto_81472 ?auto_81474 ) ) ( not ( = ?auto_81473 ?auto_81474 ) ) ( ON-TABLE ?auto_81474 ) ( ON ?auto_81473 ?auto_81474 ) ( ON ?auto_81472 ?auto_81473 ) ( ON ?auto_81471 ?auto_81472 ) ( ON ?auto_81470 ?auto_81471 ) ( ON ?auto_81469 ?auto_81470 ) ( CLEAR ?auto_81469 ) ( ON ?auto_81468 ?auto_81475 ) ( CLEAR ?auto_81468 ) ( HAND-EMPTY ) ( not ( = ?auto_81468 ?auto_81475 ) ) ( not ( = ?auto_81469 ?auto_81475 ) ) ( not ( = ?auto_81470 ?auto_81475 ) ) ( not ( = ?auto_81471 ?auto_81475 ) ) ( not ( = ?auto_81472 ?auto_81475 ) ) ( not ( = ?auto_81473 ?auto_81475 ) ) ( not ( = ?auto_81474 ?auto_81475 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81468 ?auto_81475 )
      ( MAKE-7PILE ?auto_81468 ?auto_81469 ?auto_81470 ?auto_81471 ?auto_81472 ?auto_81473 ?auto_81474 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81476 - BLOCK
      ?auto_81477 - BLOCK
      ?auto_81478 - BLOCK
      ?auto_81479 - BLOCK
      ?auto_81480 - BLOCK
      ?auto_81481 - BLOCK
      ?auto_81482 - BLOCK
    )
    :vars
    (
      ?auto_81483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81476 ?auto_81477 ) ) ( not ( = ?auto_81476 ?auto_81478 ) ) ( not ( = ?auto_81476 ?auto_81479 ) ) ( not ( = ?auto_81476 ?auto_81480 ) ) ( not ( = ?auto_81476 ?auto_81481 ) ) ( not ( = ?auto_81476 ?auto_81482 ) ) ( not ( = ?auto_81477 ?auto_81478 ) ) ( not ( = ?auto_81477 ?auto_81479 ) ) ( not ( = ?auto_81477 ?auto_81480 ) ) ( not ( = ?auto_81477 ?auto_81481 ) ) ( not ( = ?auto_81477 ?auto_81482 ) ) ( not ( = ?auto_81478 ?auto_81479 ) ) ( not ( = ?auto_81478 ?auto_81480 ) ) ( not ( = ?auto_81478 ?auto_81481 ) ) ( not ( = ?auto_81478 ?auto_81482 ) ) ( not ( = ?auto_81479 ?auto_81480 ) ) ( not ( = ?auto_81479 ?auto_81481 ) ) ( not ( = ?auto_81479 ?auto_81482 ) ) ( not ( = ?auto_81480 ?auto_81481 ) ) ( not ( = ?auto_81480 ?auto_81482 ) ) ( not ( = ?auto_81481 ?auto_81482 ) ) ( ON-TABLE ?auto_81482 ) ( ON ?auto_81481 ?auto_81482 ) ( ON ?auto_81480 ?auto_81481 ) ( ON ?auto_81479 ?auto_81480 ) ( ON ?auto_81478 ?auto_81479 ) ( ON ?auto_81476 ?auto_81483 ) ( CLEAR ?auto_81476 ) ( not ( = ?auto_81476 ?auto_81483 ) ) ( not ( = ?auto_81477 ?auto_81483 ) ) ( not ( = ?auto_81478 ?auto_81483 ) ) ( not ( = ?auto_81479 ?auto_81483 ) ) ( not ( = ?auto_81480 ?auto_81483 ) ) ( not ( = ?auto_81481 ?auto_81483 ) ) ( not ( = ?auto_81482 ?auto_81483 ) ) ( HOLDING ?auto_81477 ) ( CLEAR ?auto_81478 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81482 ?auto_81481 ?auto_81480 ?auto_81479 ?auto_81478 ?auto_81477 )
      ( MAKE-7PILE ?auto_81476 ?auto_81477 ?auto_81478 ?auto_81479 ?auto_81480 ?auto_81481 ?auto_81482 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81484 - BLOCK
      ?auto_81485 - BLOCK
      ?auto_81486 - BLOCK
      ?auto_81487 - BLOCK
      ?auto_81488 - BLOCK
      ?auto_81489 - BLOCK
      ?auto_81490 - BLOCK
    )
    :vars
    (
      ?auto_81491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81484 ?auto_81485 ) ) ( not ( = ?auto_81484 ?auto_81486 ) ) ( not ( = ?auto_81484 ?auto_81487 ) ) ( not ( = ?auto_81484 ?auto_81488 ) ) ( not ( = ?auto_81484 ?auto_81489 ) ) ( not ( = ?auto_81484 ?auto_81490 ) ) ( not ( = ?auto_81485 ?auto_81486 ) ) ( not ( = ?auto_81485 ?auto_81487 ) ) ( not ( = ?auto_81485 ?auto_81488 ) ) ( not ( = ?auto_81485 ?auto_81489 ) ) ( not ( = ?auto_81485 ?auto_81490 ) ) ( not ( = ?auto_81486 ?auto_81487 ) ) ( not ( = ?auto_81486 ?auto_81488 ) ) ( not ( = ?auto_81486 ?auto_81489 ) ) ( not ( = ?auto_81486 ?auto_81490 ) ) ( not ( = ?auto_81487 ?auto_81488 ) ) ( not ( = ?auto_81487 ?auto_81489 ) ) ( not ( = ?auto_81487 ?auto_81490 ) ) ( not ( = ?auto_81488 ?auto_81489 ) ) ( not ( = ?auto_81488 ?auto_81490 ) ) ( not ( = ?auto_81489 ?auto_81490 ) ) ( ON-TABLE ?auto_81490 ) ( ON ?auto_81489 ?auto_81490 ) ( ON ?auto_81488 ?auto_81489 ) ( ON ?auto_81487 ?auto_81488 ) ( ON ?auto_81486 ?auto_81487 ) ( ON ?auto_81484 ?auto_81491 ) ( not ( = ?auto_81484 ?auto_81491 ) ) ( not ( = ?auto_81485 ?auto_81491 ) ) ( not ( = ?auto_81486 ?auto_81491 ) ) ( not ( = ?auto_81487 ?auto_81491 ) ) ( not ( = ?auto_81488 ?auto_81491 ) ) ( not ( = ?auto_81489 ?auto_81491 ) ) ( not ( = ?auto_81490 ?auto_81491 ) ) ( CLEAR ?auto_81486 ) ( ON ?auto_81485 ?auto_81484 ) ( CLEAR ?auto_81485 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81491 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81491 ?auto_81484 )
      ( MAKE-7PILE ?auto_81484 ?auto_81485 ?auto_81486 ?auto_81487 ?auto_81488 ?auto_81489 ?auto_81490 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81492 - BLOCK
      ?auto_81493 - BLOCK
      ?auto_81494 - BLOCK
      ?auto_81495 - BLOCK
      ?auto_81496 - BLOCK
      ?auto_81497 - BLOCK
      ?auto_81498 - BLOCK
    )
    :vars
    (
      ?auto_81499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81492 ?auto_81493 ) ) ( not ( = ?auto_81492 ?auto_81494 ) ) ( not ( = ?auto_81492 ?auto_81495 ) ) ( not ( = ?auto_81492 ?auto_81496 ) ) ( not ( = ?auto_81492 ?auto_81497 ) ) ( not ( = ?auto_81492 ?auto_81498 ) ) ( not ( = ?auto_81493 ?auto_81494 ) ) ( not ( = ?auto_81493 ?auto_81495 ) ) ( not ( = ?auto_81493 ?auto_81496 ) ) ( not ( = ?auto_81493 ?auto_81497 ) ) ( not ( = ?auto_81493 ?auto_81498 ) ) ( not ( = ?auto_81494 ?auto_81495 ) ) ( not ( = ?auto_81494 ?auto_81496 ) ) ( not ( = ?auto_81494 ?auto_81497 ) ) ( not ( = ?auto_81494 ?auto_81498 ) ) ( not ( = ?auto_81495 ?auto_81496 ) ) ( not ( = ?auto_81495 ?auto_81497 ) ) ( not ( = ?auto_81495 ?auto_81498 ) ) ( not ( = ?auto_81496 ?auto_81497 ) ) ( not ( = ?auto_81496 ?auto_81498 ) ) ( not ( = ?auto_81497 ?auto_81498 ) ) ( ON-TABLE ?auto_81498 ) ( ON ?auto_81497 ?auto_81498 ) ( ON ?auto_81496 ?auto_81497 ) ( ON ?auto_81495 ?auto_81496 ) ( ON ?auto_81492 ?auto_81499 ) ( not ( = ?auto_81492 ?auto_81499 ) ) ( not ( = ?auto_81493 ?auto_81499 ) ) ( not ( = ?auto_81494 ?auto_81499 ) ) ( not ( = ?auto_81495 ?auto_81499 ) ) ( not ( = ?auto_81496 ?auto_81499 ) ) ( not ( = ?auto_81497 ?auto_81499 ) ) ( not ( = ?auto_81498 ?auto_81499 ) ) ( ON ?auto_81493 ?auto_81492 ) ( CLEAR ?auto_81493 ) ( ON-TABLE ?auto_81499 ) ( HOLDING ?auto_81494 ) ( CLEAR ?auto_81495 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81498 ?auto_81497 ?auto_81496 ?auto_81495 ?auto_81494 )
      ( MAKE-7PILE ?auto_81492 ?auto_81493 ?auto_81494 ?auto_81495 ?auto_81496 ?auto_81497 ?auto_81498 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81500 - BLOCK
      ?auto_81501 - BLOCK
      ?auto_81502 - BLOCK
      ?auto_81503 - BLOCK
      ?auto_81504 - BLOCK
      ?auto_81505 - BLOCK
      ?auto_81506 - BLOCK
    )
    :vars
    (
      ?auto_81507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81500 ?auto_81501 ) ) ( not ( = ?auto_81500 ?auto_81502 ) ) ( not ( = ?auto_81500 ?auto_81503 ) ) ( not ( = ?auto_81500 ?auto_81504 ) ) ( not ( = ?auto_81500 ?auto_81505 ) ) ( not ( = ?auto_81500 ?auto_81506 ) ) ( not ( = ?auto_81501 ?auto_81502 ) ) ( not ( = ?auto_81501 ?auto_81503 ) ) ( not ( = ?auto_81501 ?auto_81504 ) ) ( not ( = ?auto_81501 ?auto_81505 ) ) ( not ( = ?auto_81501 ?auto_81506 ) ) ( not ( = ?auto_81502 ?auto_81503 ) ) ( not ( = ?auto_81502 ?auto_81504 ) ) ( not ( = ?auto_81502 ?auto_81505 ) ) ( not ( = ?auto_81502 ?auto_81506 ) ) ( not ( = ?auto_81503 ?auto_81504 ) ) ( not ( = ?auto_81503 ?auto_81505 ) ) ( not ( = ?auto_81503 ?auto_81506 ) ) ( not ( = ?auto_81504 ?auto_81505 ) ) ( not ( = ?auto_81504 ?auto_81506 ) ) ( not ( = ?auto_81505 ?auto_81506 ) ) ( ON-TABLE ?auto_81506 ) ( ON ?auto_81505 ?auto_81506 ) ( ON ?auto_81504 ?auto_81505 ) ( ON ?auto_81503 ?auto_81504 ) ( ON ?auto_81500 ?auto_81507 ) ( not ( = ?auto_81500 ?auto_81507 ) ) ( not ( = ?auto_81501 ?auto_81507 ) ) ( not ( = ?auto_81502 ?auto_81507 ) ) ( not ( = ?auto_81503 ?auto_81507 ) ) ( not ( = ?auto_81504 ?auto_81507 ) ) ( not ( = ?auto_81505 ?auto_81507 ) ) ( not ( = ?auto_81506 ?auto_81507 ) ) ( ON ?auto_81501 ?auto_81500 ) ( ON-TABLE ?auto_81507 ) ( CLEAR ?auto_81503 ) ( ON ?auto_81502 ?auto_81501 ) ( CLEAR ?auto_81502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81507 ?auto_81500 ?auto_81501 )
      ( MAKE-7PILE ?auto_81500 ?auto_81501 ?auto_81502 ?auto_81503 ?auto_81504 ?auto_81505 ?auto_81506 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81508 - BLOCK
      ?auto_81509 - BLOCK
      ?auto_81510 - BLOCK
      ?auto_81511 - BLOCK
      ?auto_81512 - BLOCK
      ?auto_81513 - BLOCK
      ?auto_81514 - BLOCK
    )
    :vars
    (
      ?auto_81515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81508 ?auto_81509 ) ) ( not ( = ?auto_81508 ?auto_81510 ) ) ( not ( = ?auto_81508 ?auto_81511 ) ) ( not ( = ?auto_81508 ?auto_81512 ) ) ( not ( = ?auto_81508 ?auto_81513 ) ) ( not ( = ?auto_81508 ?auto_81514 ) ) ( not ( = ?auto_81509 ?auto_81510 ) ) ( not ( = ?auto_81509 ?auto_81511 ) ) ( not ( = ?auto_81509 ?auto_81512 ) ) ( not ( = ?auto_81509 ?auto_81513 ) ) ( not ( = ?auto_81509 ?auto_81514 ) ) ( not ( = ?auto_81510 ?auto_81511 ) ) ( not ( = ?auto_81510 ?auto_81512 ) ) ( not ( = ?auto_81510 ?auto_81513 ) ) ( not ( = ?auto_81510 ?auto_81514 ) ) ( not ( = ?auto_81511 ?auto_81512 ) ) ( not ( = ?auto_81511 ?auto_81513 ) ) ( not ( = ?auto_81511 ?auto_81514 ) ) ( not ( = ?auto_81512 ?auto_81513 ) ) ( not ( = ?auto_81512 ?auto_81514 ) ) ( not ( = ?auto_81513 ?auto_81514 ) ) ( ON-TABLE ?auto_81514 ) ( ON ?auto_81513 ?auto_81514 ) ( ON ?auto_81512 ?auto_81513 ) ( ON ?auto_81508 ?auto_81515 ) ( not ( = ?auto_81508 ?auto_81515 ) ) ( not ( = ?auto_81509 ?auto_81515 ) ) ( not ( = ?auto_81510 ?auto_81515 ) ) ( not ( = ?auto_81511 ?auto_81515 ) ) ( not ( = ?auto_81512 ?auto_81515 ) ) ( not ( = ?auto_81513 ?auto_81515 ) ) ( not ( = ?auto_81514 ?auto_81515 ) ) ( ON ?auto_81509 ?auto_81508 ) ( ON-TABLE ?auto_81515 ) ( ON ?auto_81510 ?auto_81509 ) ( CLEAR ?auto_81510 ) ( HOLDING ?auto_81511 ) ( CLEAR ?auto_81512 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81514 ?auto_81513 ?auto_81512 ?auto_81511 )
      ( MAKE-7PILE ?auto_81508 ?auto_81509 ?auto_81510 ?auto_81511 ?auto_81512 ?auto_81513 ?auto_81514 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81516 - BLOCK
      ?auto_81517 - BLOCK
      ?auto_81518 - BLOCK
      ?auto_81519 - BLOCK
      ?auto_81520 - BLOCK
      ?auto_81521 - BLOCK
      ?auto_81522 - BLOCK
    )
    :vars
    (
      ?auto_81523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81516 ?auto_81517 ) ) ( not ( = ?auto_81516 ?auto_81518 ) ) ( not ( = ?auto_81516 ?auto_81519 ) ) ( not ( = ?auto_81516 ?auto_81520 ) ) ( not ( = ?auto_81516 ?auto_81521 ) ) ( not ( = ?auto_81516 ?auto_81522 ) ) ( not ( = ?auto_81517 ?auto_81518 ) ) ( not ( = ?auto_81517 ?auto_81519 ) ) ( not ( = ?auto_81517 ?auto_81520 ) ) ( not ( = ?auto_81517 ?auto_81521 ) ) ( not ( = ?auto_81517 ?auto_81522 ) ) ( not ( = ?auto_81518 ?auto_81519 ) ) ( not ( = ?auto_81518 ?auto_81520 ) ) ( not ( = ?auto_81518 ?auto_81521 ) ) ( not ( = ?auto_81518 ?auto_81522 ) ) ( not ( = ?auto_81519 ?auto_81520 ) ) ( not ( = ?auto_81519 ?auto_81521 ) ) ( not ( = ?auto_81519 ?auto_81522 ) ) ( not ( = ?auto_81520 ?auto_81521 ) ) ( not ( = ?auto_81520 ?auto_81522 ) ) ( not ( = ?auto_81521 ?auto_81522 ) ) ( ON-TABLE ?auto_81522 ) ( ON ?auto_81521 ?auto_81522 ) ( ON ?auto_81520 ?auto_81521 ) ( ON ?auto_81516 ?auto_81523 ) ( not ( = ?auto_81516 ?auto_81523 ) ) ( not ( = ?auto_81517 ?auto_81523 ) ) ( not ( = ?auto_81518 ?auto_81523 ) ) ( not ( = ?auto_81519 ?auto_81523 ) ) ( not ( = ?auto_81520 ?auto_81523 ) ) ( not ( = ?auto_81521 ?auto_81523 ) ) ( not ( = ?auto_81522 ?auto_81523 ) ) ( ON ?auto_81517 ?auto_81516 ) ( ON-TABLE ?auto_81523 ) ( ON ?auto_81518 ?auto_81517 ) ( CLEAR ?auto_81520 ) ( ON ?auto_81519 ?auto_81518 ) ( CLEAR ?auto_81519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81523 ?auto_81516 ?auto_81517 ?auto_81518 )
      ( MAKE-7PILE ?auto_81516 ?auto_81517 ?auto_81518 ?auto_81519 ?auto_81520 ?auto_81521 ?auto_81522 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81524 - BLOCK
      ?auto_81525 - BLOCK
      ?auto_81526 - BLOCK
      ?auto_81527 - BLOCK
      ?auto_81528 - BLOCK
      ?auto_81529 - BLOCK
      ?auto_81530 - BLOCK
    )
    :vars
    (
      ?auto_81531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81524 ?auto_81525 ) ) ( not ( = ?auto_81524 ?auto_81526 ) ) ( not ( = ?auto_81524 ?auto_81527 ) ) ( not ( = ?auto_81524 ?auto_81528 ) ) ( not ( = ?auto_81524 ?auto_81529 ) ) ( not ( = ?auto_81524 ?auto_81530 ) ) ( not ( = ?auto_81525 ?auto_81526 ) ) ( not ( = ?auto_81525 ?auto_81527 ) ) ( not ( = ?auto_81525 ?auto_81528 ) ) ( not ( = ?auto_81525 ?auto_81529 ) ) ( not ( = ?auto_81525 ?auto_81530 ) ) ( not ( = ?auto_81526 ?auto_81527 ) ) ( not ( = ?auto_81526 ?auto_81528 ) ) ( not ( = ?auto_81526 ?auto_81529 ) ) ( not ( = ?auto_81526 ?auto_81530 ) ) ( not ( = ?auto_81527 ?auto_81528 ) ) ( not ( = ?auto_81527 ?auto_81529 ) ) ( not ( = ?auto_81527 ?auto_81530 ) ) ( not ( = ?auto_81528 ?auto_81529 ) ) ( not ( = ?auto_81528 ?auto_81530 ) ) ( not ( = ?auto_81529 ?auto_81530 ) ) ( ON-TABLE ?auto_81530 ) ( ON ?auto_81529 ?auto_81530 ) ( ON ?auto_81524 ?auto_81531 ) ( not ( = ?auto_81524 ?auto_81531 ) ) ( not ( = ?auto_81525 ?auto_81531 ) ) ( not ( = ?auto_81526 ?auto_81531 ) ) ( not ( = ?auto_81527 ?auto_81531 ) ) ( not ( = ?auto_81528 ?auto_81531 ) ) ( not ( = ?auto_81529 ?auto_81531 ) ) ( not ( = ?auto_81530 ?auto_81531 ) ) ( ON ?auto_81525 ?auto_81524 ) ( ON-TABLE ?auto_81531 ) ( ON ?auto_81526 ?auto_81525 ) ( ON ?auto_81527 ?auto_81526 ) ( CLEAR ?auto_81527 ) ( HOLDING ?auto_81528 ) ( CLEAR ?auto_81529 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81530 ?auto_81529 ?auto_81528 )
      ( MAKE-7PILE ?auto_81524 ?auto_81525 ?auto_81526 ?auto_81527 ?auto_81528 ?auto_81529 ?auto_81530 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81532 - BLOCK
      ?auto_81533 - BLOCK
      ?auto_81534 - BLOCK
      ?auto_81535 - BLOCK
      ?auto_81536 - BLOCK
      ?auto_81537 - BLOCK
      ?auto_81538 - BLOCK
    )
    :vars
    (
      ?auto_81539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81532 ?auto_81533 ) ) ( not ( = ?auto_81532 ?auto_81534 ) ) ( not ( = ?auto_81532 ?auto_81535 ) ) ( not ( = ?auto_81532 ?auto_81536 ) ) ( not ( = ?auto_81532 ?auto_81537 ) ) ( not ( = ?auto_81532 ?auto_81538 ) ) ( not ( = ?auto_81533 ?auto_81534 ) ) ( not ( = ?auto_81533 ?auto_81535 ) ) ( not ( = ?auto_81533 ?auto_81536 ) ) ( not ( = ?auto_81533 ?auto_81537 ) ) ( not ( = ?auto_81533 ?auto_81538 ) ) ( not ( = ?auto_81534 ?auto_81535 ) ) ( not ( = ?auto_81534 ?auto_81536 ) ) ( not ( = ?auto_81534 ?auto_81537 ) ) ( not ( = ?auto_81534 ?auto_81538 ) ) ( not ( = ?auto_81535 ?auto_81536 ) ) ( not ( = ?auto_81535 ?auto_81537 ) ) ( not ( = ?auto_81535 ?auto_81538 ) ) ( not ( = ?auto_81536 ?auto_81537 ) ) ( not ( = ?auto_81536 ?auto_81538 ) ) ( not ( = ?auto_81537 ?auto_81538 ) ) ( ON-TABLE ?auto_81538 ) ( ON ?auto_81537 ?auto_81538 ) ( ON ?auto_81532 ?auto_81539 ) ( not ( = ?auto_81532 ?auto_81539 ) ) ( not ( = ?auto_81533 ?auto_81539 ) ) ( not ( = ?auto_81534 ?auto_81539 ) ) ( not ( = ?auto_81535 ?auto_81539 ) ) ( not ( = ?auto_81536 ?auto_81539 ) ) ( not ( = ?auto_81537 ?auto_81539 ) ) ( not ( = ?auto_81538 ?auto_81539 ) ) ( ON ?auto_81533 ?auto_81532 ) ( ON-TABLE ?auto_81539 ) ( ON ?auto_81534 ?auto_81533 ) ( ON ?auto_81535 ?auto_81534 ) ( CLEAR ?auto_81537 ) ( ON ?auto_81536 ?auto_81535 ) ( CLEAR ?auto_81536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81539 ?auto_81532 ?auto_81533 ?auto_81534 ?auto_81535 )
      ( MAKE-7PILE ?auto_81532 ?auto_81533 ?auto_81534 ?auto_81535 ?auto_81536 ?auto_81537 ?auto_81538 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81540 - BLOCK
      ?auto_81541 - BLOCK
      ?auto_81542 - BLOCK
      ?auto_81543 - BLOCK
      ?auto_81544 - BLOCK
      ?auto_81545 - BLOCK
      ?auto_81546 - BLOCK
    )
    :vars
    (
      ?auto_81547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81540 ?auto_81541 ) ) ( not ( = ?auto_81540 ?auto_81542 ) ) ( not ( = ?auto_81540 ?auto_81543 ) ) ( not ( = ?auto_81540 ?auto_81544 ) ) ( not ( = ?auto_81540 ?auto_81545 ) ) ( not ( = ?auto_81540 ?auto_81546 ) ) ( not ( = ?auto_81541 ?auto_81542 ) ) ( not ( = ?auto_81541 ?auto_81543 ) ) ( not ( = ?auto_81541 ?auto_81544 ) ) ( not ( = ?auto_81541 ?auto_81545 ) ) ( not ( = ?auto_81541 ?auto_81546 ) ) ( not ( = ?auto_81542 ?auto_81543 ) ) ( not ( = ?auto_81542 ?auto_81544 ) ) ( not ( = ?auto_81542 ?auto_81545 ) ) ( not ( = ?auto_81542 ?auto_81546 ) ) ( not ( = ?auto_81543 ?auto_81544 ) ) ( not ( = ?auto_81543 ?auto_81545 ) ) ( not ( = ?auto_81543 ?auto_81546 ) ) ( not ( = ?auto_81544 ?auto_81545 ) ) ( not ( = ?auto_81544 ?auto_81546 ) ) ( not ( = ?auto_81545 ?auto_81546 ) ) ( ON-TABLE ?auto_81546 ) ( ON ?auto_81540 ?auto_81547 ) ( not ( = ?auto_81540 ?auto_81547 ) ) ( not ( = ?auto_81541 ?auto_81547 ) ) ( not ( = ?auto_81542 ?auto_81547 ) ) ( not ( = ?auto_81543 ?auto_81547 ) ) ( not ( = ?auto_81544 ?auto_81547 ) ) ( not ( = ?auto_81545 ?auto_81547 ) ) ( not ( = ?auto_81546 ?auto_81547 ) ) ( ON ?auto_81541 ?auto_81540 ) ( ON-TABLE ?auto_81547 ) ( ON ?auto_81542 ?auto_81541 ) ( ON ?auto_81543 ?auto_81542 ) ( ON ?auto_81544 ?auto_81543 ) ( CLEAR ?auto_81544 ) ( HOLDING ?auto_81545 ) ( CLEAR ?auto_81546 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81546 ?auto_81545 )
      ( MAKE-7PILE ?auto_81540 ?auto_81541 ?auto_81542 ?auto_81543 ?auto_81544 ?auto_81545 ?auto_81546 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81548 - BLOCK
      ?auto_81549 - BLOCK
      ?auto_81550 - BLOCK
      ?auto_81551 - BLOCK
      ?auto_81552 - BLOCK
      ?auto_81553 - BLOCK
      ?auto_81554 - BLOCK
    )
    :vars
    (
      ?auto_81555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81548 ?auto_81549 ) ) ( not ( = ?auto_81548 ?auto_81550 ) ) ( not ( = ?auto_81548 ?auto_81551 ) ) ( not ( = ?auto_81548 ?auto_81552 ) ) ( not ( = ?auto_81548 ?auto_81553 ) ) ( not ( = ?auto_81548 ?auto_81554 ) ) ( not ( = ?auto_81549 ?auto_81550 ) ) ( not ( = ?auto_81549 ?auto_81551 ) ) ( not ( = ?auto_81549 ?auto_81552 ) ) ( not ( = ?auto_81549 ?auto_81553 ) ) ( not ( = ?auto_81549 ?auto_81554 ) ) ( not ( = ?auto_81550 ?auto_81551 ) ) ( not ( = ?auto_81550 ?auto_81552 ) ) ( not ( = ?auto_81550 ?auto_81553 ) ) ( not ( = ?auto_81550 ?auto_81554 ) ) ( not ( = ?auto_81551 ?auto_81552 ) ) ( not ( = ?auto_81551 ?auto_81553 ) ) ( not ( = ?auto_81551 ?auto_81554 ) ) ( not ( = ?auto_81552 ?auto_81553 ) ) ( not ( = ?auto_81552 ?auto_81554 ) ) ( not ( = ?auto_81553 ?auto_81554 ) ) ( ON-TABLE ?auto_81554 ) ( ON ?auto_81548 ?auto_81555 ) ( not ( = ?auto_81548 ?auto_81555 ) ) ( not ( = ?auto_81549 ?auto_81555 ) ) ( not ( = ?auto_81550 ?auto_81555 ) ) ( not ( = ?auto_81551 ?auto_81555 ) ) ( not ( = ?auto_81552 ?auto_81555 ) ) ( not ( = ?auto_81553 ?auto_81555 ) ) ( not ( = ?auto_81554 ?auto_81555 ) ) ( ON ?auto_81549 ?auto_81548 ) ( ON-TABLE ?auto_81555 ) ( ON ?auto_81550 ?auto_81549 ) ( ON ?auto_81551 ?auto_81550 ) ( ON ?auto_81552 ?auto_81551 ) ( CLEAR ?auto_81554 ) ( ON ?auto_81553 ?auto_81552 ) ( CLEAR ?auto_81553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81555 ?auto_81548 ?auto_81549 ?auto_81550 ?auto_81551 ?auto_81552 )
      ( MAKE-7PILE ?auto_81548 ?auto_81549 ?auto_81550 ?auto_81551 ?auto_81552 ?auto_81553 ?auto_81554 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81556 - BLOCK
      ?auto_81557 - BLOCK
      ?auto_81558 - BLOCK
      ?auto_81559 - BLOCK
      ?auto_81560 - BLOCK
      ?auto_81561 - BLOCK
      ?auto_81562 - BLOCK
    )
    :vars
    (
      ?auto_81563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81556 ?auto_81557 ) ) ( not ( = ?auto_81556 ?auto_81558 ) ) ( not ( = ?auto_81556 ?auto_81559 ) ) ( not ( = ?auto_81556 ?auto_81560 ) ) ( not ( = ?auto_81556 ?auto_81561 ) ) ( not ( = ?auto_81556 ?auto_81562 ) ) ( not ( = ?auto_81557 ?auto_81558 ) ) ( not ( = ?auto_81557 ?auto_81559 ) ) ( not ( = ?auto_81557 ?auto_81560 ) ) ( not ( = ?auto_81557 ?auto_81561 ) ) ( not ( = ?auto_81557 ?auto_81562 ) ) ( not ( = ?auto_81558 ?auto_81559 ) ) ( not ( = ?auto_81558 ?auto_81560 ) ) ( not ( = ?auto_81558 ?auto_81561 ) ) ( not ( = ?auto_81558 ?auto_81562 ) ) ( not ( = ?auto_81559 ?auto_81560 ) ) ( not ( = ?auto_81559 ?auto_81561 ) ) ( not ( = ?auto_81559 ?auto_81562 ) ) ( not ( = ?auto_81560 ?auto_81561 ) ) ( not ( = ?auto_81560 ?auto_81562 ) ) ( not ( = ?auto_81561 ?auto_81562 ) ) ( ON ?auto_81556 ?auto_81563 ) ( not ( = ?auto_81556 ?auto_81563 ) ) ( not ( = ?auto_81557 ?auto_81563 ) ) ( not ( = ?auto_81558 ?auto_81563 ) ) ( not ( = ?auto_81559 ?auto_81563 ) ) ( not ( = ?auto_81560 ?auto_81563 ) ) ( not ( = ?auto_81561 ?auto_81563 ) ) ( not ( = ?auto_81562 ?auto_81563 ) ) ( ON ?auto_81557 ?auto_81556 ) ( ON-TABLE ?auto_81563 ) ( ON ?auto_81558 ?auto_81557 ) ( ON ?auto_81559 ?auto_81558 ) ( ON ?auto_81560 ?auto_81559 ) ( ON ?auto_81561 ?auto_81560 ) ( CLEAR ?auto_81561 ) ( HOLDING ?auto_81562 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81562 )
      ( MAKE-7PILE ?auto_81556 ?auto_81557 ?auto_81558 ?auto_81559 ?auto_81560 ?auto_81561 ?auto_81562 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_81564 - BLOCK
      ?auto_81565 - BLOCK
      ?auto_81566 - BLOCK
      ?auto_81567 - BLOCK
      ?auto_81568 - BLOCK
      ?auto_81569 - BLOCK
      ?auto_81570 - BLOCK
    )
    :vars
    (
      ?auto_81571 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81564 ?auto_81565 ) ) ( not ( = ?auto_81564 ?auto_81566 ) ) ( not ( = ?auto_81564 ?auto_81567 ) ) ( not ( = ?auto_81564 ?auto_81568 ) ) ( not ( = ?auto_81564 ?auto_81569 ) ) ( not ( = ?auto_81564 ?auto_81570 ) ) ( not ( = ?auto_81565 ?auto_81566 ) ) ( not ( = ?auto_81565 ?auto_81567 ) ) ( not ( = ?auto_81565 ?auto_81568 ) ) ( not ( = ?auto_81565 ?auto_81569 ) ) ( not ( = ?auto_81565 ?auto_81570 ) ) ( not ( = ?auto_81566 ?auto_81567 ) ) ( not ( = ?auto_81566 ?auto_81568 ) ) ( not ( = ?auto_81566 ?auto_81569 ) ) ( not ( = ?auto_81566 ?auto_81570 ) ) ( not ( = ?auto_81567 ?auto_81568 ) ) ( not ( = ?auto_81567 ?auto_81569 ) ) ( not ( = ?auto_81567 ?auto_81570 ) ) ( not ( = ?auto_81568 ?auto_81569 ) ) ( not ( = ?auto_81568 ?auto_81570 ) ) ( not ( = ?auto_81569 ?auto_81570 ) ) ( ON ?auto_81564 ?auto_81571 ) ( not ( = ?auto_81564 ?auto_81571 ) ) ( not ( = ?auto_81565 ?auto_81571 ) ) ( not ( = ?auto_81566 ?auto_81571 ) ) ( not ( = ?auto_81567 ?auto_81571 ) ) ( not ( = ?auto_81568 ?auto_81571 ) ) ( not ( = ?auto_81569 ?auto_81571 ) ) ( not ( = ?auto_81570 ?auto_81571 ) ) ( ON ?auto_81565 ?auto_81564 ) ( ON-TABLE ?auto_81571 ) ( ON ?auto_81566 ?auto_81565 ) ( ON ?auto_81567 ?auto_81566 ) ( ON ?auto_81568 ?auto_81567 ) ( ON ?auto_81569 ?auto_81568 ) ( ON ?auto_81570 ?auto_81569 ) ( CLEAR ?auto_81570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81571 ?auto_81564 ?auto_81565 ?auto_81566 ?auto_81567 ?auto_81568 ?auto_81569 )
      ( MAKE-7PILE ?auto_81564 ?auto_81565 ?auto_81566 ?auto_81567 ?auto_81568 ?auto_81569 ?auto_81570 ) )
  )

)

