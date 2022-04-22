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
      ?auto_137053 - BLOCK
      ?auto_137054 - BLOCK
      ?auto_137055 - BLOCK
      ?auto_137056 - BLOCK
      ?auto_137057 - BLOCK
      ?auto_137058 - BLOCK
      ?auto_137059 - BLOCK
      ?auto_137060 - BLOCK
    )
    :vars
    (
      ?auto_137061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137061 ?auto_137060 ) ( CLEAR ?auto_137061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137053 ) ( ON ?auto_137054 ?auto_137053 ) ( ON ?auto_137055 ?auto_137054 ) ( ON ?auto_137056 ?auto_137055 ) ( ON ?auto_137057 ?auto_137056 ) ( ON ?auto_137058 ?auto_137057 ) ( ON ?auto_137059 ?auto_137058 ) ( ON ?auto_137060 ?auto_137059 ) ( not ( = ?auto_137053 ?auto_137054 ) ) ( not ( = ?auto_137053 ?auto_137055 ) ) ( not ( = ?auto_137053 ?auto_137056 ) ) ( not ( = ?auto_137053 ?auto_137057 ) ) ( not ( = ?auto_137053 ?auto_137058 ) ) ( not ( = ?auto_137053 ?auto_137059 ) ) ( not ( = ?auto_137053 ?auto_137060 ) ) ( not ( = ?auto_137053 ?auto_137061 ) ) ( not ( = ?auto_137054 ?auto_137055 ) ) ( not ( = ?auto_137054 ?auto_137056 ) ) ( not ( = ?auto_137054 ?auto_137057 ) ) ( not ( = ?auto_137054 ?auto_137058 ) ) ( not ( = ?auto_137054 ?auto_137059 ) ) ( not ( = ?auto_137054 ?auto_137060 ) ) ( not ( = ?auto_137054 ?auto_137061 ) ) ( not ( = ?auto_137055 ?auto_137056 ) ) ( not ( = ?auto_137055 ?auto_137057 ) ) ( not ( = ?auto_137055 ?auto_137058 ) ) ( not ( = ?auto_137055 ?auto_137059 ) ) ( not ( = ?auto_137055 ?auto_137060 ) ) ( not ( = ?auto_137055 ?auto_137061 ) ) ( not ( = ?auto_137056 ?auto_137057 ) ) ( not ( = ?auto_137056 ?auto_137058 ) ) ( not ( = ?auto_137056 ?auto_137059 ) ) ( not ( = ?auto_137056 ?auto_137060 ) ) ( not ( = ?auto_137056 ?auto_137061 ) ) ( not ( = ?auto_137057 ?auto_137058 ) ) ( not ( = ?auto_137057 ?auto_137059 ) ) ( not ( = ?auto_137057 ?auto_137060 ) ) ( not ( = ?auto_137057 ?auto_137061 ) ) ( not ( = ?auto_137058 ?auto_137059 ) ) ( not ( = ?auto_137058 ?auto_137060 ) ) ( not ( = ?auto_137058 ?auto_137061 ) ) ( not ( = ?auto_137059 ?auto_137060 ) ) ( not ( = ?auto_137059 ?auto_137061 ) ) ( not ( = ?auto_137060 ?auto_137061 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137061 ?auto_137060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137063 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_137063 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_137063 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137064 - BLOCK
    )
    :vars
    (
      ?auto_137065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137064 ?auto_137065 ) ( CLEAR ?auto_137064 ) ( HAND-EMPTY ) ( not ( = ?auto_137064 ?auto_137065 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137064 ?auto_137065 )
      ( MAKE-1PILE ?auto_137064 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137073 - BLOCK
      ?auto_137074 - BLOCK
      ?auto_137075 - BLOCK
      ?auto_137076 - BLOCK
      ?auto_137077 - BLOCK
      ?auto_137078 - BLOCK
      ?auto_137079 - BLOCK
    )
    :vars
    (
      ?auto_137080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137080 ?auto_137079 ) ( CLEAR ?auto_137080 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137073 ) ( ON ?auto_137074 ?auto_137073 ) ( ON ?auto_137075 ?auto_137074 ) ( ON ?auto_137076 ?auto_137075 ) ( ON ?auto_137077 ?auto_137076 ) ( ON ?auto_137078 ?auto_137077 ) ( ON ?auto_137079 ?auto_137078 ) ( not ( = ?auto_137073 ?auto_137074 ) ) ( not ( = ?auto_137073 ?auto_137075 ) ) ( not ( = ?auto_137073 ?auto_137076 ) ) ( not ( = ?auto_137073 ?auto_137077 ) ) ( not ( = ?auto_137073 ?auto_137078 ) ) ( not ( = ?auto_137073 ?auto_137079 ) ) ( not ( = ?auto_137073 ?auto_137080 ) ) ( not ( = ?auto_137074 ?auto_137075 ) ) ( not ( = ?auto_137074 ?auto_137076 ) ) ( not ( = ?auto_137074 ?auto_137077 ) ) ( not ( = ?auto_137074 ?auto_137078 ) ) ( not ( = ?auto_137074 ?auto_137079 ) ) ( not ( = ?auto_137074 ?auto_137080 ) ) ( not ( = ?auto_137075 ?auto_137076 ) ) ( not ( = ?auto_137075 ?auto_137077 ) ) ( not ( = ?auto_137075 ?auto_137078 ) ) ( not ( = ?auto_137075 ?auto_137079 ) ) ( not ( = ?auto_137075 ?auto_137080 ) ) ( not ( = ?auto_137076 ?auto_137077 ) ) ( not ( = ?auto_137076 ?auto_137078 ) ) ( not ( = ?auto_137076 ?auto_137079 ) ) ( not ( = ?auto_137076 ?auto_137080 ) ) ( not ( = ?auto_137077 ?auto_137078 ) ) ( not ( = ?auto_137077 ?auto_137079 ) ) ( not ( = ?auto_137077 ?auto_137080 ) ) ( not ( = ?auto_137078 ?auto_137079 ) ) ( not ( = ?auto_137078 ?auto_137080 ) ) ( not ( = ?auto_137079 ?auto_137080 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137080 ?auto_137079 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137081 - BLOCK
      ?auto_137082 - BLOCK
      ?auto_137083 - BLOCK
      ?auto_137084 - BLOCK
      ?auto_137085 - BLOCK
      ?auto_137086 - BLOCK
      ?auto_137087 - BLOCK
    )
    :vars
    (
      ?auto_137088 - BLOCK
      ?auto_137089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137088 ?auto_137087 ) ( CLEAR ?auto_137088 ) ( ON-TABLE ?auto_137081 ) ( ON ?auto_137082 ?auto_137081 ) ( ON ?auto_137083 ?auto_137082 ) ( ON ?auto_137084 ?auto_137083 ) ( ON ?auto_137085 ?auto_137084 ) ( ON ?auto_137086 ?auto_137085 ) ( ON ?auto_137087 ?auto_137086 ) ( not ( = ?auto_137081 ?auto_137082 ) ) ( not ( = ?auto_137081 ?auto_137083 ) ) ( not ( = ?auto_137081 ?auto_137084 ) ) ( not ( = ?auto_137081 ?auto_137085 ) ) ( not ( = ?auto_137081 ?auto_137086 ) ) ( not ( = ?auto_137081 ?auto_137087 ) ) ( not ( = ?auto_137081 ?auto_137088 ) ) ( not ( = ?auto_137082 ?auto_137083 ) ) ( not ( = ?auto_137082 ?auto_137084 ) ) ( not ( = ?auto_137082 ?auto_137085 ) ) ( not ( = ?auto_137082 ?auto_137086 ) ) ( not ( = ?auto_137082 ?auto_137087 ) ) ( not ( = ?auto_137082 ?auto_137088 ) ) ( not ( = ?auto_137083 ?auto_137084 ) ) ( not ( = ?auto_137083 ?auto_137085 ) ) ( not ( = ?auto_137083 ?auto_137086 ) ) ( not ( = ?auto_137083 ?auto_137087 ) ) ( not ( = ?auto_137083 ?auto_137088 ) ) ( not ( = ?auto_137084 ?auto_137085 ) ) ( not ( = ?auto_137084 ?auto_137086 ) ) ( not ( = ?auto_137084 ?auto_137087 ) ) ( not ( = ?auto_137084 ?auto_137088 ) ) ( not ( = ?auto_137085 ?auto_137086 ) ) ( not ( = ?auto_137085 ?auto_137087 ) ) ( not ( = ?auto_137085 ?auto_137088 ) ) ( not ( = ?auto_137086 ?auto_137087 ) ) ( not ( = ?auto_137086 ?auto_137088 ) ) ( not ( = ?auto_137087 ?auto_137088 ) ) ( HOLDING ?auto_137089 ) ( not ( = ?auto_137081 ?auto_137089 ) ) ( not ( = ?auto_137082 ?auto_137089 ) ) ( not ( = ?auto_137083 ?auto_137089 ) ) ( not ( = ?auto_137084 ?auto_137089 ) ) ( not ( = ?auto_137085 ?auto_137089 ) ) ( not ( = ?auto_137086 ?auto_137089 ) ) ( not ( = ?auto_137087 ?auto_137089 ) ) ( not ( = ?auto_137088 ?auto_137089 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_137089 )
      ( MAKE-7PILE ?auto_137081 ?auto_137082 ?auto_137083 ?auto_137084 ?auto_137085 ?auto_137086 ?auto_137087 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137090 - BLOCK
      ?auto_137091 - BLOCK
      ?auto_137092 - BLOCK
      ?auto_137093 - BLOCK
      ?auto_137094 - BLOCK
      ?auto_137095 - BLOCK
      ?auto_137096 - BLOCK
    )
    :vars
    (
      ?auto_137098 - BLOCK
      ?auto_137097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137098 ?auto_137096 ) ( ON-TABLE ?auto_137090 ) ( ON ?auto_137091 ?auto_137090 ) ( ON ?auto_137092 ?auto_137091 ) ( ON ?auto_137093 ?auto_137092 ) ( ON ?auto_137094 ?auto_137093 ) ( ON ?auto_137095 ?auto_137094 ) ( ON ?auto_137096 ?auto_137095 ) ( not ( = ?auto_137090 ?auto_137091 ) ) ( not ( = ?auto_137090 ?auto_137092 ) ) ( not ( = ?auto_137090 ?auto_137093 ) ) ( not ( = ?auto_137090 ?auto_137094 ) ) ( not ( = ?auto_137090 ?auto_137095 ) ) ( not ( = ?auto_137090 ?auto_137096 ) ) ( not ( = ?auto_137090 ?auto_137098 ) ) ( not ( = ?auto_137091 ?auto_137092 ) ) ( not ( = ?auto_137091 ?auto_137093 ) ) ( not ( = ?auto_137091 ?auto_137094 ) ) ( not ( = ?auto_137091 ?auto_137095 ) ) ( not ( = ?auto_137091 ?auto_137096 ) ) ( not ( = ?auto_137091 ?auto_137098 ) ) ( not ( = ?auto_137092 ?auto_137093 ) ) ( not ( = ?auto_137092 ?auto_137094 ) ) ( not ( = ?auto_137092 ?auto_137095 ) ) ( not ( = ?auto_137092 ?auto_137096 ) ) ( not ( = ?auto_137092 ?auto_137098 ) ) ( not ( = ?auto_137093 ?auto_137094 ) ) ( not ( = ?auto_137093 ?auto_137095 ) ) ( not ( = ?auto_137093 ?auto_137096 ) ) ( not ( = ?auto_137093 ?auto_137098 ) ) ( not ( = ?auto_137094 ?auto_137095 ) ) ( not ( = ?auto_137094 ?auto_137096 ) ) ( not ( = ?auto_137094 ?auto_137098 ) ) ( not ( = ?auto_137095 ?auto_137096 ) ) ( not ( = ?auto_137095 ?auto_137098 ) ) ( not ( = ?auto_137096 ?auto_137098 ) ) ( not ( = ?auto_137090 ?auto_137097 ) ) ( not ( = ?auto_137091 ?auto_137097 ) ) ( not ( = ?auto_137092 ?auto_137097 ) ) ( not ( = ?auto_137093 ?auto_137097 ) ) ( not ( = ?auto_137094 ?auto_137097 ) ) ( not ( = ?auto_137095 ?auto_137097 ) ) ( not ( = ?auto_137096 ?auto_137097 ) ) ( not ( = ?auto_137098 ?auto_137097 ) ) ( ON ?auto_137097 ?auto_137098 ) ( CLEAR ?auto_137097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137090 ?auto_137091 ?auto_137092 ?auto_137093 ?auto_137094 ?auto_137095 ?auto_137096 ?auto_137098 )
      ( MAKE-7PILE ?auto_137090 ?auto_137091 ?auto_137092 ?auto_137093 ?auto_137094 ?auto_137095 ?auto_137096 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137101 - BLOCK
      ?auto_137102 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_137102 ) ( CLEAR ?auto_137101 ) ( ON-TABLE ?auto_137101 ) ( not ( = ?auto_137101 ?auto_137102 ) ) )
    :subtasks
    ( ( !STACK ?auto_137102 ?auto_137101 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137103 - BLOCK
      ?auto_137104 - BLOCK
    )
    :vars
    (
      ?auto_137105 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137103 ) ( ON-TABLE ?auto_137103 ) ( not ( = ?auto_137103 ?auto_137104 ) ) ( ON ?auto_137104 ?auto_137105 ) ( CLEAR ?auto_137104 ) ( HAND-EMPTY ) ( not ( = ?auto_137103 ?auto_137105 ) ) ( not ( = ?auto_137104 ?auto_137105 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137104 ?auto_137105 )
      ( MAKE-2PILE ?auto_137103 ?auto_137104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137106 - BLOCK
      ?auto_137107 - BLOCK
    )
    :vars
    (
      ?auto_137108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137106 ?auto_137107 ) ) ( ON ?auto_137107 ?auto_137108 ) ( CLEAR ?auto_137107 ) ( not ( = ?auto_137106 ?auto_137108 ) ) ( not ( = ?auto_137107 ?auto_137108 ) ) ( HOLDING ?auto_137106 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137106 )
      ( MAKE-2PILE ?auto_137106 ?auto_137107 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137109 - BLOCK
      ?auto_137110 - BLOCK
    )
    :vars
    (
      ?auto_137111 - BLOCK
      ?auto_137112 - BLOCK
      ?auto_137114 - BLOCK
      ?auto_137113 - BLOCK
      ?auto_137117 - BLOCK
      ?auto_137116 - BLOCK
      ?auto_137115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137109 ?auto_137110 ) ) ( ON ?auto_137110 ?auto_137111 ) ( not ( = ?auto_137109 ?auto_137111 ) ) ( not ( = ?auto_137110 ?auto_137111 ) ) ( ON ?auto_137109 ?auto_137110 ) ( CLEAR ?auto_137109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137112 ) ( ON ?auto_137114 ?auto_137112 ) ( ON ?auto_137113 ?auto_137114 ) ( ON ?auto_137117 ?auto_137113 ) ( ON ?auto_137116 ?auto_137117 ) ( ON ?auto_137115 ?auto_137116 ) ( ON ?auto_137111 ?auto_137115 ) ( not ( = ?auto_137112 ?auto_137114 ) ) ( not ( = ?auto_137112 ?auto_137113 ) ) ( not ( = ?auto_137112 ?auto_137117 ) ) ( not ( = ?auto_137112 ?auto_137116 ) ) ( not ( = ?auto_137112 ?auto_137115 ) ) ( not ( = ?auto_137112 ?auto_137111 ) ) ( not ( = ?auto_137112 ?auto_137110 ) ) ( not ( = ?auto_137112 ?auto_137109 ) ) ( not ( = ?auto_137114 ?auto_137113 ) ) ( not ( = ?auto_137114 ?auto_137117 ) ) ( not ( = ?auto_137114 ?auto_137116 ) ) ( not ( = ?auto_137114 ?auto_137115 ) ) ( not ( = ?auto_137114 ?auto_137111 ) ) ( not ( = ?auto_137114 ?auto_137110 ) ) ( not ( = ?auto_137114 ?auto_137109 ) ) ( not ( = ?auto_137113 ?auto_137117 ) ) ( not ( = ?auto_137113 ?auto_137116 ) ) ( not ( = ?auto_137113 ?auto_137115 ) ) ( not ( = ?auto_137113 ?auto_137111 ) ) ( not ( = ?auto_137113 ?auto_137110 ) ) ( not ( = ?auto_137113 ?auto_137109 ) ) ( not ( = ?auto_137117 ?auto_137116 ) ) ( not ( = ?auto_137117 ?auto_137115 ) ) ( not ( = ?auto_137117 ?auto_137111 ) ) ( not ( = ?auto_137117 ?auto_137110 ) ) ( not ( = ?auto_137117 ?auto_137109 ) ) ( not ( = ?auto_137116 ?auto_137115 ) ) ( not ( = ?auto_137116 ?auto_137111 ) ) ( not ( = ?auto_137116 ?auto_137110 ) ) ( not ( = ?auto_137116 ?auto_137109 ) ) ( not ( = ?auto_137115 ?auto_137111 ) ) ( not ( = ?auto_137115 ?auto_137110 ) ) ( not ( = ?auto_137115 ?auto_137109 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137112 ?auto_137114 ?auto_137113 ?auto_137117 ?auto_137116 ?auto_137115 ?auto_137111 ?auto_137110 )
      ( MAKE-2PILE ?auto_137109 ?auto_137110 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137124 - BLOCK
      ?auto_137125 - BLOCK
      ?auto_137126 - BLOCK
      ?auto_137127 - BLOCK
      ?auto_137128 - BLOCK
      ?auto_137129 - BLOCK
    )
    :vars
    (
      ?auto_137130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137130 ?auto_137129 ) ( CLEAR ?auto_137130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137124 ) ( ON ?auto_137125 ?auto_137124 ) ( ON ?auto_137126 ?auto_137125 ) ( ON ?auto_137127 ?auto_137126 ) ( ON ?auto_137128 ?auto_137127 ) ( ON ?auto_137129 ?auto_137128 ) ( not ( = ?auto_137124 ?auto_137125 ) ) ( not ( = ?auto_137124 ?auto_137126 ) ) ( not ( = ?auto_137124 ?auto_137127 ) ) ( not ( = ?auto_137124 ?auto_137128 ) ) ( not ( = ?auto_137124 ?auto_137129 ) ) ( not ( = ?auto_137124 ?auto_137130 ) ) ( not ( = ?auto_137125 ?auto_137126 ) ) ( not ( = ?auto_137125 ?auto_137127 ) ) ( not ( = ?auto_137125 ?auto_137128 ) ) ( not ( = ?auto_137125 ?auto_137129 ) ) ( not ( = ?auto_137125 ?auto_137130 ) ) ( not ( = ?auto_137126 ?auto_137127 ) ) ( not ( = ?auto_137126 ?auto_137128 ) ) ( not ( = ?auto_137126 ?auto_137129 ) ) ( not ( = ?auto_137126 ?auto_137130 ) ) ( not ( = ?auto_137127 ?auto_137128 ) ) ( not ( = ?auto_137127 ?auto_137129 ) ) ( not ( = ?auto_137127 ?auto_137130 ) ) ( not ( = ?auto_137128 ?auto_137129 ) ) ( not ( = ?auto_137128 ?auto_137130 ) ) ( not ( = ?auto_137129 ?auto_137130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137130 ?auto_137129 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137131 - BLOCK
      ?auto_137132 - BLOCK
      ?auto_137133 - BLOCK
      ?auto_137134 - BLOCK
      ?auto_137135 - BLOCK
      ?auto_137136 - BLOCK
    )
    :vars
    (
      ?auto_137137 - BLOCK
      ?auto_137138 - BLOCK
      ?auto_137139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137137 ?auto_137136 ) ( CLEAR ?auto_137137 ) ( ON-TABLE ?auto_137131 ) ( ON ?auto_137132 ?auto_137131 ) ( ON ?auto_137133 ?auto_137132 ) ( ON ?auto_137134 ?auto_137133 ) ( ON ?auto_137135 ?auto_137134 ) ( ON ?auto_137136 ?auto_137135 ) ( not ( = ?auto_137131 ?auto_137132 ) ) ( not ( = ?auto_137131 ?auto_137133 ) ) ( not ( = ?auto_137131 ?auto_137134 ) ) ( not ( = ?auto_137131 ?auto_137135 ) ) ( not ( = ?auto_137131 ?auto_137136 ) ) ( not ( = ?auto_137131 ?auto_137137 ) ) ( not ( = ?auto_137132 ?auto_137133 ) ) ( not ( = ?auto_137132 ?auto_137134 ) ) ( not ( = ?auto_137132 ?auto_137135 ) ) ( not ( = ?auto_137132 ?auto_137136 ) ) ( not ( = ?auto_137132 ?auto_137137 ) ) ( not ( = ?auto_137133 ?auto_137134 ) ) ( not ( = ?auto_137133 ?auto_137135 ) ) ( not ( = ?auto_137133 ?auto_137136 ) ) ( not ( = ?auto_137133 ?auto_137137 ) ) ( not ( = ?auto_137134 ?auto_137135 ) ) ( not ( = ?auto_137134 ?auto_137136 ) ) ( not ( = ?auto_137134 ?auto_137137 ) ) ( not ( = ?auto_137135 ?auto_137136 ) ) ( not ( = ?auto_137135 ?auto_137137 ) ) ( not ( = ?auto_137136 ?auto_137137 ) ) ( HOLDING ?auto_137138 ) ( CLEAR ?auto_137139 ) ( not ( = ?auto_137131 ?auto_137138 ) ) ( not ( = ?auto_137131 ?auto_137139 ) ) ( not ( = ?auto_137132 ?auto_137138 ) ) ( not ( = ?auto_137132 ?auto_137139 ) ) ( not ( = ?auto_137133 ?auto_137138 ) ) ( not ( = ?auto_137133 ?auto_137139 ) ) ( not ( = ?auto_137134 ?auto_137138 ) ) ( not ( = ?auto_137134 ?auto_137139 ) ) ( not ( = ?auto_137135 ?auto_137138 ) ) ( not ( = ?auto_137135 ?auto_137139 ) ) ( not ( = ?auto_137136 ?auto_137138 ) ) ( not ( = ?auto_137136 ?auto_137139 ) ) ( not ( = ?auto_137137 ?auto_137138 ) ) ( not ( = ?auto_137137 ?auto_137139 ) ) ( not ( = ?auto_137138 ?auto_137139 ) ) )
    :subtasks
    ( ( !STACK ?auto_137138 ?auto_137139 )
      ( MAKE-6PILE ?auto_137131 ?auto_137132 ?auto_137133 ?auto_137134 ?auto_137135 ?auto_137136 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137140 - BLOCK
      ?auto_137141 - BLOCK
      ?auto_137142 - BLOCK
      ?auto_137143 - BLOCK
      ?auto_137144 - BLOCK
      ?auto_137145 - BLOCK
    )
    :vars
    (
      ?auto_137146 - BLOCK
      ?auto_137148 - BLOCK
      ?auto_137147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137146 ?auto_137145 ) ( ON-TABLE ?auto_137140 ) ( ON ?auto_137141 ?auto_137140 ) ( ON ?auto_137142 ?auto_137141 ) ( ON ?auto_137143 ?auto_137142 ) ( ON ?auto_137144 ?auto_137143 ) ( ON ?auto_137145 ?auto_137144 ) ( not ( = ?auto_137140 ?auto_137141 ) ) ( not ( = ?auto_137140 ?auto_137142 ) ) ( not ( = ?auto_137140 ?auto_137143 ) ) ( not ( = ?auto_137140 ?auto_137144 ) ) ( not ( = ?auto_137140 ?auto_137145 ) ) ( not ( = ?auto_137140 ?auto_137146 ) ) ( not ( = ?auto_137141 ?auto_137142 ) ) ( not ( = ?auto_137141 ?auto_137143 ) ) ( not ( = ?auto_137141 ?auto_137144 ) ) ( not ( = ?auto_137141 ?auto_137145 ) ) ( not ( = ?auto_137141 ?auto_137146 ) ) ( not ( = ?auto_137142 ?auto_137143 ) ) ( not ( = ?auto_137142 ?auto_137144 ) ) ( not ( = ?auto_137142 ?auto_137145 ) ) ( not ( = ?auto_137142 ?auto_137146 ) ) ( not ( = ?auto_137143 ?auto_137144 ) ) ( not ( = ?auto_137143 ?auto_137145 ) ) ( not ( = ?auto_137143 ?auto_137146 ) ) ( not ( = ?auto_137144 ?auto_137145 ) ) ( not ( = ?auto_137144 ?auto_137146 ) ) ( not ( = ?auto_137145 ?auto_137146 ) ) ( CLEAR ?auto_137148 ) ( not ( = ?auto_137140 ?auto_137147 ) ) ( not ( = ?auto_137140 ?auto_137148 ) ) ( not ( = ?auto_137141 ?auto_137147 ) ) ( not ( = ?auto_137141 ?auto_137148 ) ) ( not ( = ?auto_137142 ?auto_137147 ) ) ( not ( = ?auto_137142 ?auto_137148 ) ) ( not ( = ?auto_137143 ?auto_137147 ) ) ( not ( = ?auto_137143 ?auto_137148 ) ) ( not ( = ?auto_137144 ?auto_137147 ) ) ( not ( = ?auto_137144 ?auto_137148 ) ) ( not ( = ?auto_137145 ?auto_137147 ) ) ( not ( = ?auto_137145 ?auto_137148 ) ) ( not ( = ?auto_137146 ?auto_137147 ) ) ( not ( = ?auto_137146 ?auto_137148 ) ) ( not ( = ?auto_137147 ?auto_137148 ) ) ( ON ?auto_137147 ?auto_137146 ) ( CLEAR ?auto_137147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137140 ?auto_137141 ?auto_137142 ?auto_137143 ?auto_137144 ?auto_137145 ?auto_137146 )
      ( MAKE-6PILE ?auto_137140 ?auto_137141 ?auto_137142 ?auto_137143 ?auto_137144 ?auto_137145 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137149 - BLOCK
      ?auto_137150 - BLOCK
      ?auto_137151 - BLOCK
      ?auto_137152 - BLOCK
      ?auto_137153 - BLOCK
      ?auto_137154 - BLOCK
    )
    :vars
    (
      ?auto_137155 - BLOCK
      ?auto_137157 - BLOCK
      ?auto_137156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137155 ?auto_137154 ) ( ON-TABLE ?auto_137149 ) ( ON ?auto_137150 ?auto_137149 ) ( ON ?auto_137151 ?auto_137150 ) ( ON ?auto_137152 ?auto_137151 ) ( ON ?auto_137153 ?auto_137152 ) ( ON ?auto_137154 ?auto_137153 ) ( not ( = ?auto_137149 ?auto_137150 ) ) ( not ( = ?auto_137149 ?auto_137151 ) ) ( not ( = ?auto_137149 ?auto_137152 ) ) ( not ( = ?auto_137149 ?auto_137153 ) ) ( not ( = ?auto_137149 ?auto_137154 ) ) ( not ( = ?auto_137149 ?auto_137155 ) ) ( not ( = ?auto_137150 ?auto_137151 ) ) ( not ( = ?auto_137150 ?auto_137152 ) ) ( not ( = ?auto_137150 ?auto_137153 ) ) ( not ( = ?auto_137150 ?auto_137154 ) ) ( not ( = ?auto_137150 ?auto_137155 ) ) ( not ( = ?auto_137151 ?auto_137152 ) ) ( not ( = ?auto_137151 ?auto_137153 ) ) ( not ( = ?auto_137151 ?auto_137154 ) ) ( not ( = ?auto_137151 ?auto_137155 ) ) ( not ( = ?auto_137152 ?auto_137153 ) ) ( not ( = ?auto_137152 ?auto_137154 ) ) ( not ( = ?auto_137152 ?auto_137155 ) ) ( not ( = ?auto_137153 ?auto_137154 ) ) ( not ( = ?auto_137153 ?auto_137155 ) ) ( not ( = ?auto_137154 ?auto_137155 ) ) ( not ( = ?auto_137149 ?auto_137157 ) ) ( not ( = ?auto_137149 ?auto_137156 ) ) ( not ( = ?auto_137150 ?auto_137157 ) ) ( not ( = ?auto_137150 ?auto_137156 ) ) ( not ( = ?auto_137151 ?auto_137157 ) ) ( not ( = ?auto_137151 ?auto_137156 ) ) ( not ( = ?auto_137152 ?auto_137157 ) ) ( not ( = ?auto_137152 ?auto_137156 ) ) ( not ( = ?auto_137153 ?auto_137157 ) ) ( not ( = ?auto_137153 ?auto_137156 ) ) ( not ( = ?auto_137154 ?auto_137157 ) ) ( not ( = ?auto_137154 ?auto_137156 ) ) ( not ( = ?auto_137155 ?auto_137157 ) ) ( not ( = ?auto_137155 ?auto_137156 ) ) ( not ( = ?auto_137157 ?auto_137156 ) ) ( ON ?auto_137157 ?auto_137155 ) ( CLEAR ?auto_137157 ) ( HOLDING ?auto_137156 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137156 )
      ( MAKE-6PILE ?auto_137149 ?auto_137150 ?auto_137151 ?auto_137152 ?auto_137153 ?auto_137154 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137158 - BLOCK
      ?auto_137159 - BLOCK
      ?auto_137160 - BLOCK
      ?auto_137161 - BLOCK
      ?auto_137162 - BLOCK
      ?auto_137163 - BLOCK
    )
    :vars
    (
      ?auto_137166 - BLOCK
      ?auto_137165 - BLOCK
      ?auto_137164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137166 ?auto_137163 ) ( ON-TABLE ?auto_137158 ) ( ON ?auto_137159 ?auto_137158 ) ( ON ?auto_137160 ?auto_137159 ) ( ON ?auto_137161 ?auto_137160 ) ( ON ?auto_137162 ?auto_137161 ) ( ON ?auto_137163 ?auto_137162 ) ( not ( = ?auto_137158 ?auto_137159 ) ) ( not ( = ?auto_137158 ?auto_137160 ) ) ( not ( = ?auto_137158 ?auto_137161 ) ) ( not ( = ?auto_137158 ?auto_137162 ) ) ( not ( = ?auto_137158 ?auto_137163 ) ) ( not ( = ?auto_137158 ?auto_137166 ) ) ( not ( = ?auto_137159 ?auto_137160 ) ) ( not ( = ?auto_137159 ?auto_137161 ) ) ( not ( = ?auto_137159 ?auto_137162 ) ) ( not ( = ?auto_137159 ?auto_137163 ) ) ( not ( = ?auto_137159 ?auto_137166 ) ) ( not ( = ?auto_137160 ?auto_137161 ) ) ( not ( = ?auto_137160 ?auto_137162 ) ) ( not ( = ?auto_137160 ?auto_137163 ) ) ( not ( = ?auto_137160 ?auto_137166 ) ) ( not ( = ?auto_137161 ?auto_137162 ) ) ( not ( = ?auto_137161 ?auto_137163 ) ) ( not ( = ?auto_137161 ?auto_137166 ) ) ( not ( = ?auto_137162 ?auto_137163 ) ) ( not ( = ?auto_137162 ?auto_137166 ) ) ( not ( = ?auto_137163 ?auto_137166 ) ) ( not ( = ?auto_137158 ?auto_137165 ) ) ( not ( = ?auto_137158 ?auto_137164 ) ) ( not ( = ?auto_137159 ?auto_137165 ) ) ( not ( = ?auto_137159 ?auto_137164 ) ) ( not ( = ?auto_137160 ?auto_137165 ) ) ( not ( = ?auto_137160 ?auto_137164 ) ) ( not ( = ?auto_137161 ?auto_137165 ) ) ( not ( = ?auto_137161 ?auto_137164 ) ) ( not ( = ?auto_137162 ?auto_137165 ) ) ( not ( = ?auto_137162 ?auto_137164 ) ) ( not ( = ?auto_137163 ?auto_137165 ) ) ( not ( = ?auto_137163 ?auto_137164 ) ) ( not ( = ?auto_137166 ?auto_137165 ) ) ( not ( = ?auto_137166 ?auto_137164 ) ) ( not ( = ?auto_137165 ?auto_137164 ) ) ( ON ?auto_137165 ?auto_137166 ) ( ON ?auto_137164 ?auto_137165 ) ( CLEAR ?auto_137164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137158 ?auto_137159 ?auto_137160 ?auto_137161 ?auto_137162 ?auto_137163 ?auto_137166 ?auto_137165 )
      ( MAKE-6PILE ?auto_137158 ?auto_137159 ?auto_137160 ?auto_137161 ?auto_137162 ?auto_137163 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137170 - BLOCK
      ?auto_137171 - BLOCK
      ?auto_137172 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_137172 ) ( CLEAR ?auto_137171 ) ( ON-TABLE ?auto_137170 ) ( ON ?auto_137171 ?auto_137170 ) ( not ( = ?auto_137170 ?auto_137171 ) ) ( not ( = ?auto_137170 ?auto_137172 ) ) ( not ( = ?auto_137171 ?auto_137172 ) ) )
    :subtasks
    ( ( !STACK ?auto_137172 ?auto_137171 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137173 - BLOCK
      ?auto_137174 - BLOCK
      ?auto_137175 - BLOCK
    )
    :vars
    (
      ?auto_137176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137174 ) ( ON-TABLE ?auto_137173 ) ( ON ?auto_137174 ?auto_137173 ) ( not ( = ?auto_137173 ?auto_137174 ) ) ( not ( = ?auto_137173 ?auto_137175 ) ) ( not ( = ?auto_137174 ?auto_137175 ) ) ( ON ?auto_137175 ?auto_137176 ) ( CLEAR ?auto_137175 ) ( HAND-EMPTY ) ( not ( = ?auto_137173 ?auto_137176 ) ) ( not ( = ?auto_137174 ?auto_137176 ) ) ( not ( = ?auto_137175 ?auto_137176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137175 ?auto_137176 )
      ( MAKE-3PILE ?auto_137173 ?auto_137174 ?auto_137175 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137177 - BLOCK
      ?auto_137178 - BLOCK
      ?auto_137179 - BLOCK
    )
    :vars
    (
      ?auto_137180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137177 ) ( not ( = ?auto_137177 ?auto_137178 ) ) ( not ( = ?auto_137177 ?auto_137179 ) ) ( not ( = ?auto_137178 ?auto_137179 ) ) ( ON ?auto_137179 ?auto_137180 ) ( CLEAR ?auto_137179 ) ( not ( = ?auto_137177 ?auto_137180 ) ) ( not ( = ?auto_137178 ?auto_137180 ) ) ( not ( = ?auto_137179 ?auto_137180 ) ) ( HOLDING ?auto_137178 ) ( CLEAR ?auto_137177 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137177 ?auto_137178 )
      ( MAKE-3PILE ?auto_137177 ?auto_137178 ?auto_137179 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137181 - BLOCK
      ?auto_137182 - BLOCK
      ?auto_137183 - BLOCK
    )
    :vars
    (
      ?auto_137184 - BLOCK
      ?auto_137187 - BLOCK
      ?auto_137185 - BLOCK
      ?auto_137188 - BLOCK
      ?auto_137186 - BLOCK
      ?auto_137189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137181 ) ( not ( = ?auto_137181 ?auto_137182 ) ) ( not ( = ?auto_137181 ?auto_137183 ) ) ( not ( = ?auto_137182 ?auto_137183 ) ) ( ON ?auto_137183 ?auto_137184 ) ( not ( = ?auto_137181 ?auto_137184 ) ) ( not ( = ?auto_137182 ?auto_137184 ) ) ( not ( = ?auto_137183 ?auto_137184 ) ) ( CLEAR ?auto_137181 ) ( ON ?auto_137182 ?auto_137183 ) ( CLEAR ?auto_137182 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137187 ) ( ON ?auto_137185 ?auto_137187 ) ( ON ?auto_137188 ?auto_137185 ) ( ON ?auto_137186 ?auto_137188 ) ( ON ?auto_137189 ?auto_137186 ) ( ON ?auto_137184 ?auto_137189 ) ( not ( = ?auto_137187 ?auto_137185 ) ) ( not ( = ?auto_137187 ?auto_137188 ) ) ( not ( = ?auto_137187 ?auto_137186 ) ) ( not ( = ?auto_137187 ?auto_137189 ) ) ( not ( = ?auto_137187 ?auto_137184 ) ) ( not ( = ?auto_137187 ?auto_137183 ) ) ( not ( = ?auto_137187 ?auto_137182 ) ) ( not ( = ?auto_137185 ?auto_137188 ) ) ( not ( = ?auto_137185 ?auto_137186 ) ) ( not ( = ?auto_137185 ?auto_137189 ) ) ( not ( = ?auto_137185 ?auto_137184 ) ) ( not ( = ?auto_137185 ?auto_137183 ) ) ( not ( = ?auto_137185 ?auto_137182 ) ) ( not ( = ?auto_137188 ?auto_137186 ) ) ( not ( = ?auto_137188 ?auto_137189 ) ) ( not ( = ?auto_137188 ?auto_137184 ) ) ( not ( = ?auto_137188 ?auto_137183 ) ) ( not ( = ?auto_137188 ?auto_137182 ) ) ( not ( = ?auto_137186 ?auto_137189 ) ) ( not ( = ?auto_137186 ?auto_137184 ) ) ( not ( = ?auto_137186 ?auto_137183 ) ) ( not ( = ?auto_137186 ?auto_137182 ) ) ( not ( = ?auto_137189 ?auto_137184 ) ) ( not ( = ?auto_137189 ?auto_137183 ) ) ( not ( = ?auto_137189 ?auto_137182 ) ) ( not ( = ?auto_137181 ?auto_137187 ) ) ( not ( = ?auto_137181 ?auto_137185 ) ) ( not ( = ?auto_137181 ?auto_137188 ) ) ( not ( = ?auto_137181 ?auto_137186 ) ) ( not ( = ?auto_137181 ?auto_137189 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137187 ?auto_137185 ?auto_137188 ?auto_137186 ?auto_137189 ?auto_137184 ?auto_137183 )
      ( MAKE-3PILE ?auto_137181 ?auto_137182 ?auto_137183 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137190 - BLOCK
      ?auto_137191 - BLOCK
      ?auto_137192 - BLOCK
    )
    :vars
    (
      ?auto_137196 - BLOCK
      ?auto_137197 - BLOCK
      ?auto_137194 - BLOCK
      ?auto_137193 - BLOCK
      ?auto_137195 - BLOCK
      ?auto_137198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137190 ?auto_137191 ) ) ( not ( = ?auto_137190 ?auto_137192 ) ) ( not ( = ?auto_137191 ?auto_137192 ) ) ( ON ?auto_137192 ?auto_137196 ) ( not ( = ?auto_137190 ?auto_137196 ) ) ( not ( = ?auto_137191 ?auto_137196 ) ) ( not ( = ?auto_137192 ?auto_137196 ) ) ( ON ?auto_137191 ?auto_137192 ) ( CLEAR ?auto_137191 ) ( ON-TABLE ?auto_137197 ) ( ON ?auto_137194 ?auto_137197 ) ( ON ?auto_137193 ?auto_137194 ) ( ON ?auto_137195 ?auto_137193 ) ( ON ?auto_137198 ?auto_137195 ) ( ON ?auto_137196 ?auto_137198 ) ( not ( = ?auto_137197 ?auto_137194 ) ) ( not ( = ?auto_137197 ?auto_137193 ) ) ( not ( = ?auto_137197 ?auto_137195 ) ) ( not ( = ?auto_137197 ?auto_137198 ) ) ( not ( = ?auto_137197 ?auto_137196 ) ) ( not ( = ?auto_137197 ?auto_137192 ) ) ( not ( = ?auto_137197 ?auto_137191 ) ) ( not ( = ?auto_137194 ?auto_137193 ) ) ( not ( = ?auto_137194 ?auto_137195 ) ) ( not ( = ?auto_137194 ?auto_137198 ) ) ( not ( = ?auto_137194 ?auto_137196 ) ) ( not ( = ?auto_137194 ?auto_137192 ) ) ( not ( = ?auto_137194 ?auto_137191 ) ) ( not ( = ?auto_137193 ?auto_137195 ) ) ( not ( = ?auto_137193 ?auto_137198 ) ) ( not ( = ?auto_137193 ?auto_137196 ) ) ( not ( = ?auto_137193 ?auto_137192 ) ) ( not ( = ?auto_137193 ?auto_137191 ) ) ( not ( = ?auto_137195 ?auto_137198 ) ) ( not ( = ?auto_137195 ?auto_137196 ) ) ( not ( = ?auto_137195 ?auto_137192 ) ) ( not ( = ?auto_137195 ?auto_137191 ) ) ( not ( = ?auto_137198 ?auto_137196 ) ) ( not ( = ?auto_137198 ?auto_137192 ) ) ( not ( = ?auto_137198 ?auto_137191 ) ) ( not ( = ?auto_137190 ?auto_137197 ) ) ( not ( = ?auto_137190 ?auto_137194 ) ) ( not ( = ?auto_137190 ?auto_137193 ) ) ( not ( = ?auto_137190 ?auto_137195 ) ) ( not ( = ?auto_137190 ?auto_137198 ) ) ( HOLDING ?auto_137190 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137190 )
      ( MAKE-3PILE ?auto_137190 ?auto_137191 ?auto_137192 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137199 - BLOCK
      ?auto_137200 - BLOCK
      ?auto_137201 - BLOCK
    )
    :vars
    (
      ?auto_137206 - BLOCK
      ?auto_137204 - BLOCK
      ?auto_137203 - BLOCK
      ?auto_137202 - BLOCK
      ?auto_137205 - BLOCK
      ?auto_137207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137199 ?auto_137200 ) ) ( not ( = ?auto_137199 ?auto_137201 ) ) ( not ( = ?auto_137200 ?auto_137201 ) ) ( ON ?auto_137201 ?auto_137206 ) ( not ( = ?auto_137199 ?auto_137206 ) ) ( not ( = ?auto_137200 ?auto_137206 ) ) ( not ( = ?auto_137201 ?auto_137206 ) ) ( ON ?auto_137200 ?auto_137201 ) ( ON-TABLE ?auto_137204 ) ( ON ?auto_137203 ?auto_137204 ) ( ON ?auto_137202 ?auto_137203 ) ( ON ?auto_137205 ?auto_137202 ) ( ON ?auto_137207 ?auto_137205 ) ( ON ?auto_137206 ?auto_137207 ) ( not ( = ?auto_137204 ?auto_137203 ) ) ( not ( = ?auto_137204 ?auto_137202 ) ) ( not ( = ?auto_137204 ?auto_137205 ) ) ( not ( = ?auto_137204 ?auto_137207 ) ) ( not ( = ?auto_137204 ?auto_137206 ) ) ( not ( = ?auto_137204 ?auto_137201 ) ) ( not ( = ?auto_137204 ?auto_137200 ) ) ( not ( = ?auto_137203 ?auto_137202 ) ) ( not ( = ?auto_137203 ?auto_137205 ) ) ( not ( = ?auto_137203 ?auto_137207 ) ) ( not ( = ?auto_137203 ?auto_137206 ) ) ( not ( = ?auto_137203 ?auto_137201 ) ) ( not ( = ?auto_137203 ?auto_137200 ) ) ( not ( = ?auto_137202 ?auto_137205 ) ) ( not ( = ?auto_137202 ?auto_137207 ) ) ( not ( = ?auto_137202 ?auto_137206 ) ) ( not ( = ?auto_137202 ?auto_137201 ) ) ( not ( = ?auto_137202 ?auto_137200 ) ) ( not ( = ?auto_137205 ?auto_137207 ) ) ( not ( = ?auto_137205 ?auto_137206 ) ) ( not ( = ?auto_137205 ?auto_137201 ) ) ( not ( = ?auto_137205 ?auto_137200 ) ) ( not ( = ?auto_137207 ?auto_137206 ) ) ( not ( = ?auto_137207 ?auto_137201 ) ) ( not ( = ?auto_137207 ?auto_137200 ) ) ( not ( = ?auto_137199 ?auto_137204 ) ) ( not ( = ?auto_137199 ?auto_137203 ) ) ( not ( = ?auto_137199 ?auto_137202 ) ) ( not ( = ?auto_137199 ?auto_137205 ) ) ( not ( = ?auto_137199 ?auto_137207 ) ) ( ON ?auto_137199 ?auto_137200 ) ( CLEAR ?auto_137199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137204 ?auto_137203 ?auto_137202 ?auto_137205 ?auto_137207 ?auto_137206 ?auto_137201 ?auto_137200 )
      ( MAKE-3PILE ?auto_137199 ?auto_137200 ?auto_137201 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137213 - BLOCK
      ?auto_137214 - BLOCK
      ?auto_137215 - BLOCK
      ?auto_137216 - BLOCK
      ?auto_137217 - BLOCK
    )
    :vars
    (
      ?auto_137218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137218 ?auto_137217 ) ( CLEAR ?auto_137218 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137213 ) ( ON ?auto_137214 ?auto_137213 ) ( ON ?auto_137215 ?auto_137214 ) ( ON ?auto_137216 ?auto_137215 ) ( ON ?auto_137217 ?auto_137216 ) ( not ( = ?auto_137213 ?auto_137214 ) ) ( not ( = ?auto_137213 ?auto_137215 ) ) ( not ( = ?auto_137213 ?auto_137216 ) ) ( not ( = ?auto_137213 ?auto_137217 ) ) ( not ( = ?auto_137213 ?auto_137218 ) ) ( not ( = ?auto_137214 ?auto_137215 ) ) ( not ( = ?auto_137214 ?auto_137216 ) ) ( not ( = ?auto_137214 ?auto_137217 ) ) ( not ( = ?auto_137214 ?auto_137218 ) ) ( not ( = ?auto_137215 ?auto_137216 ) ) ( not ( = ?auto_137215 ?auto_137217 ) ) ( not ( = ?auto_137215 ?auto_137218 ) ) ( not ( = ?auto_137216 ?auto_137217 ) ) ( not ( = ?auto_137216 ?auto_137218 ) ) ( not ( = ?auto_137217 ?auto_137218 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137218 ?auto_137217 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137219 - BLOCK
      ?auto_137220 - BLOCK
      ?auto_137221 - BLOCK
      ?auto_137222 - BLOCK
      ?auto_137223 - BLOCK
    )
    :vars
    (
      ?auto_137224 - BLOCK
      ?auto_137225 - BLOCK
      ?auto_137226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137224 ?auto_137223 ) ( CLEAR ?auto_137224 ) ( ON-TABLE ?auto_137219 ) ( ON ?auto_137220 ?auto_137219 ) ( ON ?auto_137221 ?auto_137220 ) ( ON ?auto_137222 ?auto_137221 ) ( ON ?auto_137223 ?auto_137222 ) ( not ( = ?auto_137219 ?auto_137220 ) ) ( not ( = ?auto_137219 ?auto_137221 ) ) ( not ( = ?auto_137219 ?auto_137222 ) ) ( not ( = ?auto_137219 ?auto_137223 ) ) ( not ( = ?auto_137219 ?auto_137224 ) ) ( not ( = ?auto_137220 ?auto_137221 ) ) ( not ( = ?auto_137220 ?auto_137222 ) ) ( not ( = ?auto_137220 ?auto_137223 ) ) ( not ( = ?auto_137220 ?auto_137224 ) ) ( not ( = ?auto_137221 ?auto_137222 ) ) ( not ( = ?auto_137221 ?auto_137223 ) ) ( not ( = ?auto_137221 ?auto_137224 ) ) ( not ( = ?auto_137222 ?auto_137223 ) ) ( not ( = ?auto_137222 ?auto_137224 ) ) ( not ( = ?auto_137223 ?auto_137224 ) ) ( HOLDING ?auto_137225 ) ( CLEAR ?auto_137226 ) ( not ( = ?auto_137219 ?auto_137225 ) ) ( not ( = ?auto_137219 ?auto_137226 ) ) ( not ( = ?auto_137220 ?auto_137225 ) ) ( not ( = ?auto_137220 ?auto_137226 ) ) ( not ( = ?auto_137221 ?auto_137225 ) ) ( not ( = ?auto_137221 ?auto_137226 ) ) ( not ( = ?auto_137222 ?auto_137225 ) ) ( not ( = ?auto_137222 ?auto_137226 ) ) ( not ( = ?auto_137223 ?auto_137225 ) ) ( not ( = ?auto_137223 ?auto_137226 ) ) ( not ( = ?auto_137224 ?auto_137225 ) ) ( not ( = ?auto_137224 ?auto_137226 ) ) ( not ( = ?auto_137225 ?auto_137226 ) ) )
    :subtasks
    ( ( !STACK ?auto_137225 ?auto_137226 )
      ( MAKE-5PILE ?auto_137219 ?auto_137220 ?auto_137221 ?auto_137222 ?auto_137223 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137227 - BLOCK
      ?auto_137228 - BLOCK
      ?auto_137229 - BLOCK
      ?auto_137230 - BLOCK
      ?auto_137231 - BLOCK
    )
    :vars
    (
      ?auto_137232 - BLOCK
      ?auto_137234 - BLOCK
      ?auto_137233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137232 ?auto_137231 ) ( ON-TABLE ?auto_137227 ) ( ON ?auto_137228 ?auto_137227 ) ( ON ?auto_137229 ?auto_137228 ) ( ON ?auto_137230 ?auto_137229 ) ( ON ?auto_137231 ?auto_137230 ) ( not ( = ?auto_137227 ?auto_137228 ) ) ( not ( = ?auto_137227 ?auto_137229 ) ) ( not ( = ?auto_137227 ?auto_137230 ) ) ( not ( = ?auto_137227 ?auto_137231 ) ) ( not ( = ?auto_137227 ?auto_137232 ) ) ( not ( = ?auto_137228 ?auto_137229 ) ) ( not ( = ?auto_137228 ?auto_137230 ) ) ( not ( = ?auto_137228 ?auto_137231 ) ) ( not ( = ?auto_137228 ?auto_137232 ) ) ( not ( = ?auto_137229 ?auto_137230 ) ) ( not ( = ?auto_137229 ?auto_137231 ) ) ( not ( = ?auto_137229 ?auto_137232 ) ) ( not ( = ?auto_137230 ?auto_137231 ) ) ( not ( = ?auto_137230 ?auto_137232 ) ) ( not ( = ?auto_137231 ?auto_137232 ) ) ( CLEAR ?auto_137234 ) ( not ( = ?auto_137227 ?auto_137233 ) ) ( not ( = ?auto_137227 ?auto_137234 ) ) ( not ( = ?auto_137228 ?auto_137233 ) ) ( not ( = ?auto_137228 ?auto_137234 ) ) ( not ( = ?auto_137229 ?auto_137233 ) ) ( not ( = ?auto_137229 ?auto_137234 ) ) ( not ( = ?auto_137230 ?auto_137233 ) ) ( not ( = ?auto_137230 ?auto_137234 ) ) ( not ( = ?auto_137231 ?auto_137233 ) ) ( not ( = ?auto_137231 ?auto_137234 ) ) ( not ( = ?auto_137232 ?auto_137233 ) ) ( not ( = ?auto_137232 ?auto_137234 ) ) ( not ( = ?auto_137233 ?auto_137234 ) ) ( ON ?auto_137233 ?auto_137232 ) ( CLEAR ?auto_137233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137227 ?auto_137228 ?auto_137229 ?auto_137230 ?auto_137231 ?auto_137232 )
      ( MAKE-5PILE ?auto_137227 ?auto_137228 ?auto_137229 ?auto_137230 ?auto_137231 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137235 - BLOCK
      ?auto_137236 - BLOCK
      ?auto_137237 - BLOCK
      ?auto_137238 - BLOCK
      ?auto_137239 - BLOCK
    )
    :vars
    (
      ?auto_137241 - BLOCK
      ?auto_137240 - BLOCK
      ?auto_137242 - BLOCK
      ?auto_137243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137241 ?auto_137239 ) ( ON-TABLE ?auto_137235 ) ( ON ?auto_137236 ?auto_137235 ) ( ON ?auto_137237 ?auto_137236 ) ( ON ?auto_137238 ?auto_137237 ) ( ON ?auto_137239 ?auto_137238 ) ( not ( = ?auto_137235 ?auto_137236 ) ) ( not ( = ?auto_137235 ?auto_137237 ) ) ( not ( = ?auto_137235 ?auto_137238 ) ) ( not ( = ?auto_137235 ?auto_137239 ) ) ( not ( = ?auto_137235 ?auto_137241 ) ) ( not ( = ?auto_137236 ?auto_137237 ) ) ( not ( = ?auto_137236 ?auto_137238 ) ) ( not ( = ?auto_137236 ?auto_137239 ) ) ( not ( = ?auto_137236 ?auto_137241 ) ) ( not ( = ?auto_137237 ?auto_137238 ) ) ( not ( = ?auto_137237 ?auto_137239 ) ) ( not ( = ?auto_137237 ?auto_137241 ) ) ( not ( = ?auto_137238 ?auto_137239 ) ) ( not ( = ?auto_137238 ?auto_137241 ) ) ( not ( = ?auto_137239 ?auto_137241 ) ) ( not ( = ?auto_137235 ?auto_137240 ) ) ( not ( = ?auto_137235 ?auto_137242 ) ) ( not ( = ?auto_137236 ?auto_137240 ) ) ( not ( = ?auto_137236 ?auto_137242 ) ) ( not ( = ?auto_137237 ?auto_137240 ) ) ( not ( = ?auto_137237 ?auto_137242 ) ) ( not ( = ?auto_137238 ?auto_137240 ) ) ( not ( = ?auto_137238 ?auto_137242 ) ) ( not ( = ?auto_137239 ?auto_137240 ) ) ( not ( = ?auto_137239 ?auto_137242 ) ) ( not ( = ?auto_137241 ?auto_137240 ) ) ( not ( = ?auto_137241 ?auto_137242 ) ) ( not ( = ?auto_137240 ?auto_137242 ) ) ( ON ?auto_137240 ?auto_137241 ) ( CLEAR ?auto_137240 ) ( HOLDING ?auto_137242 ) ( CLEAR ?auto_137243 ) ( ON-TABLE ?auto_137243 ) ( not ( = ?auto_137243 ?auto_137242 ) ) ( not ( = ?auto_137235 ?auto_137243 ) ) ( not ( = ?auto_137236 ?auto_137243 ) ) ( not ( = ?auto_137237 ?auto_137243 ) ) ( not ( = ?auto_137238 ?auto_137243 ) ) ( not ( = ?auto_137239 ?auto_137243 ) ) ( not ( = ?auto_137241 ?auto_137243 ) ) ( not ( = ?auto_137240 ?auto_137243 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137243 ?auto_137242 )
      ( MAKE-5PILE ?auto_137235 ?auto_137236 ?auto_137237 ?auto_137238 ?auto_137239 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137244 - BLOCK
      ?auto_137245 - BLOCK
      ?auto_137246 - BLOCK
      ?auto_137247 - BLOCK
      ?auto_137248 - BLOCK
    )
    :vars
    (
      ?auto_137249 - BLOCK
      ?auto_137252 - BLOCK
      ?auto_137251 - BLOCK
      ?auto_137250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137249 ?auto_137248 ) ( ON-TABLE ?auto_137244 ) ( ON ?auto_137245 ?auto_137244 ) ( ON ?auto_137246 ?auto_137245 ) ( ON ?auto_137247 ?auto_137246 ) ( ON ?auto_137248 ?auto_137247 ) ( not ( = ?auto_137244 ?auto_137245 ) ) ( not ( = ?auto_137244 ?auto_137246 ) ) ( not ( = ?auto_137244 ?auto_137247 ) ) ( not ( = ?auto_137244 ?auto_137248 ) ) ( not ( = ?auto_137244 ?auto_137249 ) ) ( not ( = ?auto_137245 ?auto_137246 ) ) ( not ( = ?auto_137245 ?auto_137247 ) ) ( not ( = ?auto_137245 ?auto_137248 ) ) ( not ( = ?auto_137245 ?auto_137249 ) ) ( not ( = ?auto_137246 ?auto_137247 ) ) ( not ( = ?auto_137246 ?auto_137248 ) ) ( not ( = ?auto_137246 ?auto_137249 ) ) ( not ( = ?auto_137247 ?auto_137248 ) ) ( not ( = ?auto_137247 ?auto_137249 ) ) ( not ( = ?auto_137248 ?auto_137249 ) ) ( not ( = ?auto_137244 ?auto_137252 ) ) ( not ( = ?auto_137244 ?auto_137251 ) ) ( not ( = ?auto_137245 ?auto_137252 ) ) ( not ( = ?auto_137245 ?auto_137251 ) ) ( not ( = ?auto_137246 ?auto_137252 ) ) ( not ( = ?auto_137246 ?auto_137251 ) ) ( not ( = ?auto_137247 ?auto_137252 ) ) ( not ( = ?auto_137247 ?auto_137251 ) ) ( not ( = ?auto_137248 ?auto_137252 ) ) ( not ( = ?auto_137248 ?auto_137251 ) ) ( not ( = ?auto_137249 ?auto_137252 ) ) ( not ( = ?auto_137249 ?auto_137251 ) ) ( not ( = ?auto_137252 ?auto_137251 ) ) ( ON ?auto_137252 ?auto_137249 ) ( CLEAR ?auto_137250 ) ( ON-TABLE ?auto_137250 ) ( not ( = ?auto_137250 ?auto_137251 ) ) ( not ( = ?auto_137244 ?auto_137250 ) ) ( not ( = ?auto_137245 ?auto_137250 ) ) ( not ( = ?auto_137246 ?auto_137250 ) ) ( not ( = ?auto_137247 ?auto_137250 ) ) ( not ( = ?auto_137248 ?auto_137250 ) ) ( not ( = ?auto_137249 ?auto_137250 ) ) ( not ( = ?auto_137252 ?auto_137250 ) ) ( ON ?auto_137251 ?auto_137252 ) ( CLEAR ?auto_137251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137244 ?auto_137245 ?auto_137246 ?auto_137247 ?auto_137248 ?auto_137249 ?auto_137252 )
      ( MAKE-5PILE ?auto_137244 ?auto_137245 ?auto_137246 ?auto_137247 ?auto_137248 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137253 - BLOCK
      ?auto_137254 - BLOCK
      ?auto_137255 - BLOCK
      ?auto_137256 - BLOCK
      ?auto_137257 - BLOCK
    )
    :vars
    (
      ?auto_137260 - BLOCK
      ?auto_137261 - BLOCK
      ?auto_137259 - BLOCK
      ?auto_137258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137260 ?auto_137257 ) ( ON-TABLE ?auto_137253 ) ( ON ?auto_137254 ?auto_137253 ) ( ON ?auto_137255 ?auto_137254 ) ( ON ?auto_137256 ?auto_137255 ) ( ON ?auto_137257 ?auto_137256 ) ( not ( = ?auto_137253 ?auto_137254 ) ) ( not ( = ?auto_137253 ?auto_137255 ) ) ( not ( = ?auto_137253 ?auto_137256 ) ) ( not ( = ?auto_137253 ?auto_137257 ) ) ( not ( = ?auto_137253 ?auto_137260 ) ) ( not ( = ?auto_137254 ?auto_137255 ) ) ( not ( = ?auto_137254 ?auto_137256 ) ) ( not ( = ?auto_137254 ?auto_137257 ) ) ( not ( = ?auto_137254 ?auto_137260 ) ) ( not ( = ?auto_137255 ?auto_137256 ) ) ( not ( = ?auto_137255 ?auto_137257 ) ) ( not ( = ?auto_137255 ?auto_137260 ) ) ( not ( = ?auto_137256 ?auto_137257 ) ) ( not ( = ?auto_137256 ?auto_137260 ) ) ( not ( = ?auto_137257 ?auto_137260 ) ) ( not ( = ?auto_137253 ?auto_137261 ) ) ( not ( = ?auto_137253 ?auto_137259 ) ) ( not ( = ?auto_137254 ?auto_137261 ) ) ( not ( = ?auto_137254 ?auto_137259 ) ) ( not ( = ?auto_137255 ?auto_137261 ) ) ( not ( = ?auto_137255 ?auto_137259 ) ) ( not ( = ?auto_137256 ?auto_137261 ) ) ( not ( = ?auto_137256 ?auto_137259 ) ) ( not ( = ?auto_137257 ?auto_137261 ) ) ( not ( = ?auto_137257 ?auto_137259 ) ) ( not ( = ?auto_137260 ?auto_137261 ) ) ( not ( = ?auto_137260 ?auto_137259 ) ) ( not ( = ?auto_137261 ?auto_137259 ) ) ( ON ?auto_137261 ?auto_137260 ) ( not ( = ?auto_137258 ?auto_137259 ) ) ( not ( = ?auto_137253 ?auto_137258 ) ) ( not ( = ?auto_137254 ?auto_137258 ) ) ( not ( = ?auto_137255 ?auto_137258 ) ) ( not ( = ?auto_137256 ?auto_137258 ) ) ( not ( = ?auto_137257 ?auto_137258 ) ) ( not ( = ?auto_137260 ?auto_137258 ) ) ( not ( = ?auto_137261 ?auto_137258 ) ) ( ON ?auto_137259 ?auto_137261 ) ( CLEAR ?auto_137259 ) ( HOLDING ?auto_137258 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137258 )
      ( MAKE-5PILE ?auto_137253 ?auto_137254 ?auto_137255 ?auto_137256 ?auto_137257 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137262 - BLOCK
      ?auto_137263 - BLOCK
      ?auto_137264 - BLOCK
      ?auto_137265 - BLOCK
      ?auto_137266 - BLOCK
    )
    :vars
    (
      ?auto_137268 - BLOCK
      ?auto_137267 - BLOCK
      ?auto_137269 - BLOCK
      ?auto_137270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137268 ?auto_137266 ) ( ON-TABLE ?auto_137262 ) ( ON ?auto_137263 ?auto_137262 ) ( ON ?auto_137264 ?auto_137263 ) ( ON ?auto_137265 ?auto_137264 ) ( ON ?auto_137266 ?auto_137265 ) ( not ( = ?auto_137262 ?auto_137263 ) ) ( not ( = ?auto_137262 ?auto_137264 ) ) ( not ( = ?auto_137262 ?auto_137265 ) ) ( not ( = ?auto_137262 ?auto_137266 ) ) ( not ( = ?auto_137262 ?auto_137268 ) ) ( not ( = ?auto_137263 ?auto_137264 ) ) ( not ( = ?auto_137263 ?auto_137265 ) ) ( not ( = ?auto_137263 ?auto_137266 ) ) ( not ( = ?auto_137263 ?auto_137268 ) ) ( not ( = ?auto_137264 ?auto_137265 ) ) ( not ( = ?auto_137264 ?auto_137266 ) ) ( not ( = ?auto_137264 ?auto_137268 ) ) ( not ( = ?auto_137265 ?auto_137266 ) ) ( not ( = ?auto_137265 ?auto_137268 ) ) ( not ( = ?auto_137266 ?auto_137268 ) ) ( not ( = ?auto_137262 ?auto_137267 ) ) ( not ( = ?auto_137262 ?auto_137269 ) ) ( not ( = ?auto_137263 ?auto_137267 ) ) ( not ( = ?auto_137263 ?auto_137269 ) ) ( not ( = ?auto_137264 ?auto_137267 ) ) ( not ( = ?auto_137264 ?auto_137269 ) ) ( not ( = ?auto_137265 ?auto_137267 ) ) ( not ( = ?auto_137265 ?auto_137269 ) ) ( not ( = ?auto_137266 ?auto_137267 ) ) ( not ( = ?auto_137266 ?auto_137269 ) ) ( not ( = ?auto_137268 ?auto_137267 ) ) ( not ( = ?auto_137268 ?auto_137269 ) ) ( not ( = ?auto_137267 ?auto_137269 ) ) ( ON ?auto_137267 ?auto_137268 ) ( not ( = ?auto_137270 ?auto_137269 ) ) ( not ( = ?auto_137262 ?auto_137270 ) ) ( not ( = ?auto_137263 ?auto_137270 ) ) ( not ( = ?auto_137264 ?auto_137270 ) ) ( not ( = ?auto_137265 ?auto_137270 ) ) ( not ( = ?auto_137266 ?auto_137270 ) ) ( not ( = ?auto_137268 ?auto_137270 ) ) ( not ( = ?auto_137267 ?auto_137270 ) ) ( ON ?auto_137269 ?auto_137267 ) ( ON ?auto_137270 ?auto_137269 ) ( CLEAR ?auto_137270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137262 ?auto_137263 ?auto_137264 ?auto_137265 ?auto_137266 ?auto_137268 ?auto_137267 ?auto_137269 )
      ( MAKE-5PILE ?auto_137262 ?auto_137263 ?auto_137264 ?auto_137265 ?auto_137266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137275 - BLOCK
      ?auto_137276 - BLOCK
      ?auto_137277 - BLOCK
      ?auto_137278 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_137278 ) ( CLEAR ?auto_137277 ) ( ON-TABLE ?auto_137275 ) ( ON ?auto_137276 ?auto_137275 ) ( ON ?auto_137277 ?auto_137276 ) ( not ( = ?auto_137275 ?auto_137276 ) ) ( not ( = ?auto_137275 ?auto_137277 ) ) ( not ( = ?auto_137275 ?auto_137278 ) ) ( not ( = ?auto_137276 ?auto_137277 ) ) ( not ( = ?auto_137276 ?auto_137278 ) ) ( not ( = ?auto_137277 ?auto_137278 ) ) )
    :subtasks
    ( ( !STACK ?auto_137278 ?auto_137277 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137279 - BLOCK
      ?auto_137280 - BLOCK
      ?auto_137281 - BLOCK
      ?auto_137282 - BLOCK
    )
    :vars
    (
      ?auto_137283 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137281 ) ( ON-TABLE ?auto_137279 ) ( ON ?auto_137280 ?auto_137279 ) ( ON ?auto_137281 ?auto_137280 ) ( not ( = ?auto_137279 ?auto_137280 ) ) ( not ( = ?auto_137279 ?auto_137281 ) ) ( not ( = ?auto_137279 ?auto_137282 ) ) ( not ( = ?auto_137280 ?auto_137281 ) ) ( not ( = ?auto_137280 ?auto_137282 ) ) ( not ( = ?auto_137281 ?auto_137282 ) ) ( ON ?auto_137282 ?auto_137283 ) ( CLEAR ?auto_137282 ) ( HAND-EMPTY ) ( not ( = ?auto_137279 ?auto_137283 ) ) ( not ( = ?auto_137280 ?auto_137283 ) ) ( not ( = ?auto_137281 ?auto_137283 ) ) ( not ( = ?auto_137282 ?auto_137283 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137282 ?auto_137283 )
      ( MAKE-4PILE ?auto_137279 ?auto_137280 ?auto_137281 ?auto_137282 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137284 - BLOCK
      ?auto_137285 - BLOCK
      ?auto_137286 - BLOCK
      ?auto_137287 - BLOCK
    )
    :vars
    (
      ?auto_137288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137284 ) ( ON ?auto_137285 ?auto_137284 ) ( not ( = ?auto_137284 ?auto_137285 ) ) ( not ( = ?auto_137284 ?auto_137286 ) ) ( not ( = ?auto_137284 ?auto_137287 ) ) ( not ( = ?auto_137285 ?auto_137286 ) ) ( not ( = ?auto_137285 ?auto_137287 ) ) ( not ( = ?auto_137286 ?auto_137287 ) ) ( ON ?auto_137287 ?auto_137288 ) ( CLEAR ?auto_137287 ) ( not ( = ?auto_137284 ?auto_137288 ) ) ( not ( = ?auto_137285 ?auto_137288 ) ) ( not ( = ?auto_137286 ?auto_137288 ) ) ( not ( = ?auto_137287 ?auto_137288 ) ) ( HOLDING ?auto_137286 ) ( CLEAR ?auto_137285 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137284 ?auto_137285 ?auto_137286 )
      ( MAKE-4PILE ?auto_137284 ?auto_137285 ?auto_137286 ?auto_137287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137289 - BLOCK
      ?auto_137290 - BLOCK
      ?auto_137291 - BLOCK
      ?auto_137292 - BLOCK
    )
    :vars
    (
      ?auto_137293 - BLOCK
      ?auto_137294 - BLOCK
      ?auto_137295 - BLOCK
      ?auto_137297 - BLOCK
      ?auto_137296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137289 ) ( ON ?auto_137290 ?auto_137289 ) ( not ( = ?auto_137289 ?auto_137290 ) ) ( not ( = ?auto_137289 ?auto_137291 ) ) ( not ( = ?auto_137289 ?auto_137292 ) ) ( not ( = ?auto_137290 ?auto_137291 ) ) ( not ( = ?auto_137290 ?auto_137292 ) ) ( not ( = ?auto_137291 ?auto_137292 ) ) ( ON ?auto_137292 ?auto_137293 ) ( not ( = ?auto_137289 ?auto_137293 ) ) ( not ( = ?auto_137290 ?auto_137293 ) ) ( not ( = ?auto_137291 ?auto_137293 ) ) ( not ( = ?auto_137292 ?auto_137293 ) ) ( CLEAR ?auto_137290 ) ( ON ?auto_137291 ?auto_137292 ) ( CLEAR ?auto_137291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137294 ) ( ON ?auto_137295 ?auto_137294 ) ( ON ?auto_137297 ?auto_137295 ) ( ON ?auto_137296 ?auto_137297 ) ( ON ?auto_137293 ?auto_137296 ) ( not ( = ?auto_137294 ?auto_137295 ) ) ( not ( = ?auto_137294 ?auto_137297 ) ) ( not ( = ?auto_137294 ?auto_137296 ) ) ( not ( = ?auto_137294 ?auto_137293 ) ) ( not ( = ?auto_137294 ?auto_137292 ) ) ( not ( = ?auto_137294 ?auto_137291 ) ) ( not ( = ?auto_137295 ?auto_137297 ) ) ( not ( = ?auto_137295 ?auto_137296 ) ) ( not ( = ?auto_137295 ?auto_137293 ) ) ( not ( = ?auto_137295 ?auto_137292 ) ) ( not ( = ?auto_137295 ?auto_137291 ) ) ( not ( = ?auto_137297 ?auto_137296 ) ) ( not ( = ?auto_137297 ?auto_137293 ) ) ( not ( = ?auto_137297 ?auto_137292 ) ) ( not ( = ?auto_137297 ?auto_137291 ) ) ( not ( = ?auto_137296 ?auto_137293 ) ) ( not ( = ?auto_137296 ?auto_137292 ) ) ( not ( = ?auto_137296 ?auto_137291 ) ) ( not ( = ?auto_137289 ?auto_137294 ) ) ( not ( = ?auto_137289 ?auto_137295 ) ) ( not ( = ?auto_137289 ?auto_137297 ) ) ( not ( = ?auto_137289 ?auto_137296 ) ) ( not ( = ?auto_137290 ?auto_137294 ) ) ( not ( = ?auto_137290 ?auto_137295 ) ) ( not ( = ?auto_137290 ?auto_137297 ) ) ( not ( = ?auto_137290 ?auto_137296 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137294 ?auto_137295 ?auto_137297 ?auto_137296 ?auto_137293 ?auto_137292 )
      ( MAKE-4PILE ?auto_137289 ?auto_137290 ?auto_137291 ?auto_137292 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137298 - BLOCK
      ?auto_137299 - BLOCK
      ?auto_137300 - BLOCK
      ?auto_137301 - BLOCK
    )
    :vars
    (
      ?auto_137305 - BLOCK
      ?auto_137304 - BLOCK
      ?auto_137306 - BLOCK
      ?auto_137303 - BLOCK
      ?auto_137302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137298 ) ( not ( = ?auto_137298 ?auto_137299 ) ) ( not ( = ?auto_137298 ?auto_137300 ) ) ( not ( = ?auto_137298 ?auto_137301 ) ) ( not ( = ?auto_137299 ?auto_137300 ) ) ( not ( = ?auto_137299 ?auto_137301 ) ) ( not ( = ?auto_137300 ?auto_137301 ) ) ( ON ?auto_137301 ?auto_137305 ) ( not ( = ?auto_137298 ?auto_137305 ) ) ( not ( = ?auto_137299 ?auto_137305 ) ) ( not ( = ?auto_137300 ?auto_137305 ) ) ( not ( = ?auto_137301 ?auto_137305 ) ) ( ON ?auto_137300 ?auto_137301 ) ( CLEAR ?auto_137300 ) ( ON-TABLE ?auto_137304 ) ( ON ?auto_137306 ?auto_137304 ) ( ON ?auto_137303 ?auto_137306 ) ( ON ?auto_137302 ?auto_137303 ) ( ON ?auto_137305 ?auto_137302 ) ( not ( = ?auto_137304 ?auto_137306 ) ) ( not ( = ?auto_137304 ?auto_137303 ) ) ( not ( = ?auto_137304 ?auto_137302 ) ) ( not ( = ?auto_137304 ?auto_137305 ) ) ( not ( = ?auto_137304 ?auto_137301 ) ) ( not ( = ?auto_137304 ?auto_137300 ) ) ( not ( = ?auto_137306 ?auto_137303 ) ) ( not ( = ?auto_137306 ?auto_137302 ) ) ( not ( = ?auto_137306 ?auto_137305 ) ) ( not ( = ?auto_137306 ?auto_137301 ) ) ( not ( = ?auto_137306 ?auto_137300 ) ) ( not ( = ?auto_137303 ?auto_137302 ) ) ( not ( = ?auto_137303 ?auto_137305 ) ) ( not ( = ?auto_137303 ?auto_137301 ) ) ( not ( = ?auto_137303 ?auto_137300 ) ) ( not ( = ?auto_137302 ?auto_137305 ) ) ( not ( = ?auto_137302 ?auto_137301 ) ) ( not ( = ?auto_137302 ?auto_137300 ) ) ( not ( = ?auto_137298 ?auto_137304 ) ) ( not ( = ?auto_137298 ?auto_137306 ) ) ( not ( = ?auto_137298 ?auto_137303 ) ) ( not ( = ?auto_137298 ?auto_137302 ) ) ( not ( = ?auto_137299 ?auto_137304 ) ) ( not ( = ?auto_137299 ?auto_137306 ) ) ( not ( = ?auto_137299 ?auto_137303 ) ) ( not ( = ?auto_137299 ?auto_137302 ) ) ( HOLDING ?auto_137299 ) ( CLEAR ?auto_137298 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137298 ?auto_137299 )
      ( MAKE-4PILE ?auto_137298 ?auto_137299 ?auto_137300 ?auto_137301 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137307 - BLOCK
      ?auto_137308 - BLOCK
      ?auto_137309 - BLOCK
      ?auto_137310 - BLOCK
    )
    :vars
    (
      ?auto_137315 - BLOCK
      ?auto_137314 - BLOCK
      ?auto_137312 - BLOCK
      ?auto_137311 - BLOCK
      ?auto_137313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137307 ) ( not ( = ?auto_137307 ?auto_137308 ) ) ( not ( = ?auto_137307 ?auto_137309 ) ) ( not ( = ?auto_137307 ?auto_137310 ) ) ( not ( = ?auto_137308 ?auto_137309 ) ) ( not ( = ?auto_137308 ?auto_137310 ) ) ( not ( = ?auto_137309 ?auto_137310 ) ) ( ON ?auto_137310 ?auto_137315 ) ( not ( = ?auto_137307 ?auto_137315 ) ) ( not ( = ?auto_137308 ?auto_137315 ) ) ( not ( = ?auto_137309 ?auto_137315 ) ) ( not ( = ?auto_137310 ?auto_137315 ) ) ( ON ?auto_137309 ?auto_137310 ) ( ON-TABLE ?auto_137314 ) ( ON ?auto_137312 ?auto_137314 ) ( ON ?auto_137311 ?auto_137312 ) ( ON ?auto_137313 ?auto_137311 ) ( ON ?auto_137315 ?auto_137313 ) ( not ( = ?auto_137314 ?auto_137312 ) ) ( not ( = ?auto_137314 ?auto_137311 ) ) ( not ( = ?auto_137314 ?auto_137313 ) ) ( not ( = ?auto_137314 ?auto_137315 ) ) ( not ( = ?auto_137314 ?auto_137310 ) ) ( not ( = ?auto_137314 ?auto_137309 ) ) ( not ( = ?auto_137312 ?auto_137311 ) ) ( not ( = ?auto_137312 ?auto_137313 ) ) ( not ( = ?auto_137312 ?auto_137315 ) ) ( not ( = ?auto_137312 ?auto_137310 ) ) ( not ( = ?auto_137312 ?auto_137309 ) ) ( not ( = ?auto_137311 ?auto_137313 ) ) ( not ( = ?auto_137311 ?auto_137315 ) ) ( not ( = ?auto_137311 ?auto_137310 ) ) ( not ( = ?auto_137311 ?auto_137309 ) ) ( not ( = ?auto_137313 ?auto_137315 ) ) ( not ( = ?auto_137313 ?auto_137310 ) ) ( not ( = ?auto_137313 ?auto_137309 ) ) ( not ( = ?auto_137307 ?auto_137314 ) ) ( not ( = ?auto_137307 ?auto_137312 ) ) ( not ( = ?auto_137307 ?auto_137311 ) ) ( not ( = ?auto_137307 ?auto_137313 ) ) ( not ( = ?auto_137308 ?auto_137314 ) ) ( not ( = ?auto_137308 ?auto_137312 ) ) ( not ( = ?auto_137308 ?auto_137311 ) ) ( not ( = ?auto_137308 ?auto_137313 ) ) ( CLEAR ?auto_137307 ) ( ON ?auto_137308 ?auto_137309 ) ( CLEAR ?auto_137308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137314 ?auto_137312 ?auto_137311 ?auto_137313 ?auto_137315 ?auto_137310 ?auto_137309 )
      ( MAKE-4PILE ?auto_137307 ?auto_137308 ?auto_137309 ?auto_137310 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137316 - BLOCK
      ?auto_137317 - BLOCK
      ?auto_137318 - BLOCK
      ?auto_137319 - BLOCK
    )
    :vars
    (
      ?auto_137324 - BLOCK
      ?auto_137321 - BLOCK
      ?auto_137320 - BLOCK
      ?auto_137323 - BLOCK
      ?auto_137322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137316 ?auto_137317 ) ) ( not ( = ?auto_137316 ?auto_137318 ) ) ( not ( = ?auto_137316 ?auto_137319 ) ) ( not ( = ?auto_137317 ?auto_137318 ) ) ( not ( = ?auto_137317 ?auto_137319 ) ) ( not ( = ?auto_137318 ?auto_137319 ) ) ( ON ?auto_137319 ?auto_137324 ) ( not ( = ?auto_137316 ?auto_137324 ) ) ( not ( = ?auto_137317 ?auto_137324 ) ) ( not ( = ?auto_137318 ?auto_137324 ) ) ( not ( = ?auto_137319 ?auto_137324 ) ) ( ON ?auto_137318 ?auto_137319 ) ( ON-TABLE ?auto_137321 ) ( ON ?auto_137320 ?auto_137321 ) ( ON ?auto_137323 ?auto_137320 ) ( ON ?auto_137322 ?auto_137323 ) ( ON ?auto_137324 ?auto_137322 ) ( not ( = ?auto_137321 ?auto_137320 ) ) ( not ( = ?auto_137321 ?auto_137323 ) ) ( not ( = ?auto_137321 ?auto_137322 ) ) ( not ( = ?auto_137321 ?auto_137324 ) ) ( not ( = ?auto_137321 ?auto_137319 ) ) ( not ( = ?auto_137321 ?auto_137318 ) ) ( not ( = ?auto_137320 ?auto_137323 ) ) ( not ( = ?auto_137320 ?auto_137322 ) ) ( not ( = ?auto_137320 ?auto_137324 ) ) ( not ( = ?auto_137320 ?auto_137319 ) ) ( not ( = ?auto_137320 ?auto_137318 ) ) ( not ( = ?auto_137323 ?auto_137322 ) ) ( not ( = ?auto_137323 ?auto_137324 ) ) ( not ( = ?auto_137323 ?auto_137319 ) ) ( not ( = ?auto_137323 ?auto_137318 ) ) ( not ( = ?auto_137322 ?auto_137324 ) ) ( not ( = ?auto_137322 ?auto_137319 ) ) ( not ( = ?auto_137322 ?auto_137318 ) ) ( not ( = ?auto_137316 ?auto_137321 ) ) ( not ( = ?auto_137316 ?auto_137320 ) ) ( not ( = ?auto_137316 ?auto_137323 ) ) ( not ( = ?auto_137316 ?auto_137322 ) ) ( not ( = ?auto_137317 ?auto_137321 ) ) ( not ( = ?auto_137317 ?auto_137320 ) ) ( not ( = ?auto_137317 ?auto_137323 ) ) ( not ( = ?auto_137317 ?auto_137322 ) ) ( ON ?auto_137317 ?auto_137318 ) ( CLEAR ?auto_137317 ) ( HOLDING ?auto_137316 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137316 )
      ( MAKE-4PILE ?auto_137316 ?auto_137317 ?auto_137318 ?auto_137319 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137325 - BLOCK
      ?auto_137326 - BLOCK
      ?auto_137327 - BLOCK
      ?auto_137328 - BLOCK
    )
    :vars
    (
      ?auto_137332 - BLOCK
      ?auto_137333 - BLOCK
      ?auto_137331 - BLOCK
      ?auto_137329 - BLOCK
      ?auto_137330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137325 ?auto_137326 ) ) ( not ( = ?auto_137325 ?auto_137327 ) ) ( not ( = ?auto_137325 ?auto_137328 ) ) ( not ( = ?auto_137326 ?auto_137327 ) ) ( not ( = ?auto_137326 ?auto_137328 ) ) ( not ( = ?auto_137327 ?auto_137328 ) ) ( ON ?auto_137328 ?auto_137332 ) ( not ( = ?auto_137325 ?auto_137332 ) ) ( not ( = ?auto_137326 ?auto_137332 ) ) ( not ( = ?auto_137327 ?auto_137332 ) ) ( not ( = ?auto_137328 ?auto_137332 ) ) ( ON ?auto_137327 ?auto_137328 ) ( ON-TABLE ?auto_137333 ) ( ON ?auto_137331 ?auto_137333 ) ( ON ?auto_137329 ?auto_137331 ) ( ON ?auto_137330 ?auto_137329 ) ( ON ?auto_137332 ?auto_137330 ) ( not ( = ?auto_137333 ?auto_137331 ) ) ( not ( = ?auto_137333 ?auto_137329 ) ) ( not ( = ?auto_137333 ?auto_137330 ) ) ( not ( = ?auto_137333 ?auto_137332 ) ) ( not ( = ?auto_137333 ?auto_137328 ) ) ( not ( = ?auto_137333 ?auto_137327 ) ) ( not ( = ?auto_137331 ?auto_137329 ) ) ( not ( = ?auto_137331 ?auto_137330 ) ) ( not ( = ?auto_137331 ?auto_137332 ) ) ( not ( = ?auto_137331 ?auto_137328 ) ) ( not ( = ?auto_137331 ?auto_137327 ) ) ( not ( = ?auto_137329 ?auto_137330 ) ) ( not ( = ?auto_137329 ?auto_137332 ) ) ( not ( = ?auto_137329 ?auto_137328 ) ) ( not ( = ?auto_137329 ?auto_137327 ) ) ( not ( = ?auto_137330 ?auto_137332 ) ) ( not ( = ?auto_137330 ?auto_137328 ) ) ( not ( = ?auto_137330 ?auto_137327 ) ) ( not ( = ?auto_137325 ?auto_137333 ) ) ( not ( = ?auto_137325 ?auto_137331 ) ) ( not ( = ?auto_137325 ?auto_137329 ) ) ( not ( = ?auto_137325 ?auto_137330 ) ) ( not ( = ?auto_137326 ?auto_137333 ) ) ( not ( = ?auto_137326 ?auto_137331 ) ) ( not ( = ?auto_137326 ?auto_137329 ) ) ( not ( = ?auto_137326 ?auto_137330 ) ) ( ON ?auto_137326 ?auto_137327 ) ( ON ?auto_137325 ?auto_137326 ) ( CLEAR ?auto_137325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137333 ?auto_137331 ?auto_137329 ?auto_137330 ?auto_137332 ?auto_137328 ?auto_137327 ?auto_137326 )
      ( MAKE-4PILE ?auto_137325 ?auto_137326 ?auto_137327 ?auto_137328 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137338 - BLOCK
      ?auto_137339 - BLOCK
      ?auto_137340 - BLOCK
      ?auto_137341 - BLOCK
    )
    :vars
    (
      ?auto_137342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137342 ?auto_137341 ) ( CLEAR ?auto_137342 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137338 ) ( ON ?auto_137339 ?auto_137338 ) ( ON ?auto_137340 ?auto_137339 ) ( ON ?auto_137341 ?auto_137340 ) ( not ( = ?auto_137338 ?auto_137339 ) ) ( not ( = ?auto_137338 ?auto_137340 ) ) ( not ( = ?auto_137338 ?auto_137341 ) ) ( not ( = ?auto_137338 ?auto_137342 ) ) ( not ( = ?auto_137339 ?auto_137340 ) ) ( not ( = ?auto_137339 ?auto_137341 ) ) ( not ( = ?auto_137339 ?auto_137342 ) ) ( not ( = ?auto_137340 ?auto_137341 ) ) ( not ( = ?auto_137340 ?auto_137342 ) ) ( not ( = ?auto_137341 ?auto_137342 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137342 ?auto_137341 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137343 - BLOCK
      ?auto_137344 - BLOCK
      ?auto_137345 - BLOCK
      ?auto_137346 - BLOCK
    )
    :vars
    (
      ?auto_137347 - BLOCK
      ?auto_137348 - BLOCK
      ?auto_137349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137347 ?auto_137346 ) ( CLEAR ?auto_137347 ) ( ON-TABLE ?auto_137343 ) ( ON ?auto_137344 ?auto_137343 ) ( ON ?auto_137345 ?auto_137344 ) ( ON ?auto_137346 ?auto_137345 ) ( not ( = ?auto_137343 ?auto_137344 ) ) ( not ( = ?auto_137343 ?auto_137345 ) ) ( not ( = ?auto_137343 ?auto_137346 ) ) ( not ( = ?auto_137343 ?auto_137347 ) ) ( not ( = ?auto_137344 ?auto_137345 ) ) ( not ( = ?auto_137344 ?auto_137346 ) ) ( not ( = ?auto_137344 ?auto_137347 ) ) ( not ( = ?auto_137345 ?auto_137346 ) ) ( not ( = ?auto_137345 ?auto_137347 ) ) ( not ( = ?auto_137346 ?auto_137347 ) ) ( HOLDING ?auto_137348 ) ( CLEAR ?auto_137349 ) ( not ( = ?auto_137343 ?auto_137348 ) ) ( not ( = ?auto_137343 ?auto_137349 ) ) ( not ( = ?auto_137344 ?auto_137348 ) ) ( not ( = ?auto_137344 ?auto_137349 ) ) ( not ( = ?auto_137345 ?auto_137348 ) ) ( not ( = ?auto_137345 ?auto_137349 ) ) ( not ( = ?auto_137346 ?auto_137348 ) ) ( not ( = ?auto_137346 ?auto_137349 ) ) ( not ( = ?auto_137347 ?auto_137348 ) ) ( not ( = ?auto_137347 ?auto_137349 ) ) ( not ( = ?auto_137348 ?auto_137349 ) ) )
    :subtasks
    ( ( !STACK ?auto_137348 ?auto_137349 )
      ( MAKE-4PILE ?auto_137343 ?auto_137344 ?auto_137345 ?auto_137346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137350 - BLOCK
      ?auto_137351 - BLOCK
      ?auto_137352 - BLOCK
      ?auto_137353 - BLOCK
    )
    :vars
    (
      ?auto_137355 - BLOCK
      ?auto_137356 - BLOCK
      ?auto_137354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137355 ?auto_137353 ) ( ON-TABLE ?auto_137350 ) ( ON ?auto_137351 ?auto_137350 ) ( ON ?auto_137352 ?auto_137351 ) ( ON ?auto_137353 ?auto_137352 ) ( not ( = ?auto_137350 ?auto_137351 ) ) ( not ( = ?auto_137350 ?auto_137352 ) ) ( not ( = ?auto_137350 ?auto_137353 ) ) ( not ( = ?auto_137350 ?auto_137355 ) ) ( not ( = ?auto_137351 ?auto_137352 ) ) ( not ( = ?auto_137351 ?auto_137353 ) ) ( not ( = ?auto_137351 ?auto_137355 ) ) ( not ( = ?auto_137352 ?auto_137353 ) ) ( not ( = ?auto_137352 ?auto_137355 ) ) ( not ( = ?auto_137353 ?auto_137355 ) ) ( CLEAR ?auto_137356 ) ( not ( = ?auto_137350 ?auto_137354 ) ) ( not ( = ?auto_137350 ?auto_137356 ) ) ( not ( = ?auto_137351 ?auto_137354 ) ) ( not ( = ?auto_137351 ?auto_137356 ) ) ( not ( = ?auto_137352 ?auto_137354 ) ) ( not ( = ?auto_137352 ?auto_137356 ) ) ( not ( = ?auto_137353 ?auto_137354 ) ) ( not ( = ?auto_137353 ?auto_137356 ) ) ( not ( = ?auto_137355 ?auto_137354 ) ) ( not ( = ?auto_137355 ?auto_137356 ) ) ( not ( = ?auto_137354 ?auto_137356 ) ) ( ON ?auto_137354 ?auto_137355 ) ( CLEAR ?auto_137354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137350 ?auto_137351 ?auto_137352 ?auto_137353 ?auto_137355 )
      ( MAKE-4PILE ?auto_137350 ?auto_137351 ?auto_137352 ?auto_137353 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137357 - BLOCK
      ?auto_137358 - BLOCK
      ?auto_137359 - BLOCK
      ?auto_137360 - BLOCK
    )
    :vars
    (
      ?auto_137363 - BLOCK
      ?auto_137362 - BLOCK
      ?auto_137361 - BLOCK
      ?auto_137364 - BLOCK
      ?auto_137365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137363 ?auto_137360 ) ( ON-TABLE ?auto_137357 ) ( ON ?auto_137358 ?auto_137357 ) ( ON ?auto_137359 ?auto_137358 ) ( ON ?auto_137360 ?auto_137359 ) ( not ( = ?auto_137357 ?auto_137358 ) ) ( not ( = ?auto_137357 ?auto_137359 ) ) ( not ( = ?auto_137357 ?auto_137360 ) ) ( not ( = ?auto_137357 ?auto_137363 ) ) ( not ( = ?auto_137358 ?auto_137359 ) ) ( not ( = ?auto_137358 ?auto_137360 ) ) ( not ( = ?auto_137358 ?auto_137363 ) ) ( not ( = ?auto_137359 ?auto_137360 ) ) ( not ( = ?auto_137359 ?auto_137363 ) ) ( not ( = ?auto_137360 ?auto_137363 ) ) ( not ( = ?auto_137357 ?auto_137362 ) ) ( not ( = ?auto_137357 ?auto_137361 ) ) ( not ( = ?auto_137358 ?auto_137362 ) ) ( not ( = ?auto_137358 ?auto_137361 ) ) ( not ( = ?auto_137359 ?auto_137362 ) ) ( not ( = ?auto_137359 ?auto_137361 ) ) ( not ( = ?auto_137360 ?auto_137362 ) ) ( not ( = ?auto_137360 ?auto_137361 ) ) ( not ( = ?auto_137363 ?auto_137362 ) ) ( not ( = ?auto_137363 ?auto_137361 ) ) ( not ( = ?auto_137362 ?auto_137361 ) ) ( ON ?auto_137362 ?auto_137363 ) ( CLEAR ?auto_137362 ) ( HOLDING ?auto_137361 ) ( CLEAR ?auto_137364 ) ( ON-TABLE ?auto_137365 ) ( ON ?auto_137364 ?auto_137365 ) ( not ( = ?auto_137365 ?auto_137364 ) ) ( not ( = ?auto_137365 ?auto_137361 ) ) ( not ( = ?auto_137364 ?auto_137361 ) ) ( not ( = ?auto_137357 ?auto_137364 ) ) ( not ( = ?auto_137357 ?auto_137365 ) ) ( not ( = ?auto_137358 ?auto_137364 ) ) ( not ( = ?auto_137358 ?auto_137365 ) ) ( not ( = ?auto_137359 ?auto_137364 ) ) ( not ( = ?auto_137359 ?auto_137365 ) ) ( not ( = ?auto_137360 ?auto_137364 ) ) ( not ( = ?auto_137360 ?auto_137365 ) ) ( not ( = ?auto_137363 ?auto_137364 ) ) ( not ( = ?auto_137363 ?auto_137365 ) ) ( not ( = ?auto_137362 ?auto_137364 ) ) ( not ( = ?auto_137362 ?auto_137365 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137365 ?auto_137364 ?auto_137361 )
      ( MAKE-4PILE ?auto_137357 ?auto_137358 ?auto_137359 ?auto_137360 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137366 - BLOCK
      ?auto_137367 - BLOCK
      ?auto_137368 - BLOCK
      ?auto_137369 - BLOCK
    )
    :vars
    (
      ?auto_137370 - BLOCK
      ?auto_137372 - BLOCK
      ?auto_137373 - BLOCK
      ?auto_137374 - BLOCK
      ?auto_137371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137370 ?auto_137369 ) ( ON-TABLE ?auto_137366 ) ( ON ?auto_137367 ?auto_137366 ) ( ON ?auto_137368 ?auto_137367 ) ( ON ?auto_137369 ?auto_137368 ) ( not ( = ?auto_137366 ?auto_137367 ) ) ( not ( = ?auto_137366 ?auto_137368 ) ) ( not ( = ?auto_137366 ?auto_137369 ) ) ( not ( = ?auto_137366 ?auto_137370 ) ) ( not ( = ?auto_137367 ?auto_137368 ) ) ( not ( = ?auto_137367 ?auto_137369 ) ) ( not ( = ?auto_137367 ?auto_137370 ) ) ( not ( = ?auto_137368 ?auto_137369 ) ) ( not ( = ?auto_137368 ?auto_137370 ) ) ( not ( = ?auto_137369 ?auto_137370 ) ) ( not ( = ?auto_137366 ?auto_137372 ) ) ( not ( = ?auto_137366 ?auto_137373 ) ) ( not ( = ?auto_137367 ?auto_137372 ) ) ( not ( = ?auto_137367 ?auto_137373 ) ) ( not ( = ?auto_137368 ?auto_137372 ) ) ( not ( = ?auto_137368 ?auto_137373 ) ) ( not ( = ?auto_137369 ?auto_137372 ) ) ( not ( = ?auto_137369 ?auto_137373 ) ) ( not ( = ?auto_137370 ?auto_137372 ) ) ( not ( = ?auto_137370 ?auto_137373 ) ) ( not ( = ?auto_137372 ?auto_137373 ) ) ( ON ?auto_137372 ?auto_137370 ) ( CLEAR ?auto_137374 ) ( ON-TABLE ?auto_137371 ) ( ON ?auto_137374 ?auto_137371 ) ( not ( = ?auto_137371 ?auto_137374 ) ) ( not ( = ?auto_137371 ?auto_137373 ) ) ( not ( = ?auto_137374 ?auto_137373 ) ) ( not ( = ?auto_137366 ?auto_137374 ) ) ( not ( = ?auto_137366 ?auto_137371 ) ) ( not ( = ?auto_137367 ?auto_137374 ) ) ( not ( = ?auto_137367 ?auto_137371 ) ) ( not ( = ?auto_137368 ?auto_137374 ) ) ( not ( = ?auto_137368 ?auto_137371 ) ) ( not ( = ?auto_137369 ?auto_137374 ) ) ( not ( = ?auto_137369 ?auto_137371 ) ) ( not ( = ?auto_137370 ?auto_137374 ) ) ( not ( = ?auto_137370 ?auto_137371 ) ) ( not ( = ?auto_137372 ?auto_137374 ) ) ( not ( = ?auto_137372 ?auto_137371 ) ) ( ON ?auto_137373 ?auto_137372 ) ( CLEAR ?auto_137373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137366 ?auto_137367 ?auto_137368 ?auto_137369 ?auto_137370 ?auto_137372 )
      ( MAKE-4PILE ?auto_137366 ?auto_137367 ?auto_137368 ?auto_137369 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137375 - BLOCK
      ?auto_137376 - BLOCK
      ?auto_137377 - BLOCK
      ?auto_137378 - BLOCK
    )
    :vars
    (
      ?auto_137379 - BLOCK
      ?auto_137383 - BLOCK
      ?auto_137382 - BLOCK
      ?auto_137380 - BLOCK
      ?auto_137381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137379 ?auto_137378 ) ( ON-TABLE ?auto_137375 ) ( ON ?auto_137376 ?auto_137375 ) ( ON ?auto_137377 ?auto_137376 ) ( ON ?auto_137378 ?auto_137377 ) ( not ( = ?auto_137375 ?auto_137376 ) ) ( not ( = ?auto_137375 ?auto_137377 ) ) ( not ( = ?auto_137375 ?auto_137378 ) ) ( not ( = ?auto_137375 ?auto_137379 ) ) ( not ( = ?auto_137376 ?auto_137377 ) ) ( not ( = ?auto_137376 ?auto_137378 ) ) ( not ( = ?auto_137376 ?auto_137379 ) ) ( not ( = ?auto_137377 ?auto_137378 ) ) ( not ( = ?auto_137377 ?auto_137379 ) ) ( not ( = ?auto_137378 ?auto_137379 ) ) ( not ( = ?auto_137375 ?auto_137383 ) ) ( not ( = ?auto_137375 ?auto_137382 ) ) ( not ( = ?auto_137376 ?auto_137383 ) ) ( not ( = ?auto_137376 ?auto_137382 ) ) ( not ( = ?auto_137377 ?auto_137383 ) ) ( not ( = ?auto_137377 ?auto_137382 ) ) ( not ( = ?auto_137378 ?auto_137383 ) ) ( not ( = ?auto_137378 ?auto_137382 ) ) ( not ( = ?auto_137379 ?auto_137383 ) ) ( not ( = ?auto_137379 ?auto_137382 ) ) ( not ( = ?auto_137383 ?auto_137382 ) ) ( ON ?auto_137383 ?auto_137379 ) ( ON-TABLE ?auto_137380 ) ( not ( = ?auto_137380 ?auto_137381 ) ) ( not ( = ?auto_137380 ?auto_137382 ) ) ( not ( = ?auto_137381 ?auto_137382 ) ) ( not ( = ?auto_137375 ?auto_137381 ) ) ( not ( = ?auto_137375 ?auto_137380 ) ) ( not ( = ?auto_137376 ?auto_137381 ) ) ( not ( = ?auto_137376 ?auto_137380 ) ) ( not ( = ?auto_137377 ?auto_137381 ) ) ( not ( = ?auto_137377 ?auto_137380 ) ) ( not ( = ?auto_137378 ?auto_137381 ) ) ( not ( = ?auto_137378 ?auto_137380 ) ) ( not ( = ?auto_137379 ?auto_137381 ) ) ( not ( = ?auto_137379 ?auto_137380 ) ) ( not ( = ?auto_137383 ?auto_137381 ) ) ( not ( = ?auto_137383 ?auto_137380 ) ) ( ON ?auto_137382 ?auto_137383 ) ( CLEAR ?auto_137382 ) ( HOLDING ?auto_137381 ) ( CLEAR ?auto_137380 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137380 ?auto_137381 )
      ( MAKE-4PILE ?auto_137375 ?auto_137376 ?auto_137377 ?auto_137378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137384 - BLOCK
      ?auto_137385 - BLOCK
      ?auto_137386 - BLOCK
      ?auto_137387 - BLOCK
    )
    :vars
    (
      ?auto_137388 - BLOCK
      ?auto_137390 - BLOCK
      ?auto_137389 - BLOCK
      ?auto_137391 - BLOCK
      ?auto_137392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137388 ?auto_137387 ) ( ON-TABLE ?auto_137384 ) ( ON ?auto_137385 ?auto_137384 ) ( ON ?auto_137386 ?auto_137385 ) ( ON ?auto_137387 ?auto_137386 ) ( not ( = ?auto_137384 ?auto_137385 ) ) ( not ( = ?auto_137384 ?auto_137386 ) ) ( not ( = ?auto_137384 ?auto_137387 ) ) ( not ( = ?auto_137384 ?auto_137388 ) ) ( not ( = ?auto_137385 ?auto_137386 ) ) ( not ( = ?auto_137385 ?auto_137387 ) ) ( not ( = ?auto_137385 ?auto_137388 ) ) ( not ( = ?auto_137386 ?auto_137387 ) ) ( not ( = ?auto_137386 ?auto_137388 ) ) ( not ( = ?auto_137387 ?auto_137388 ) ) ( not ( = ?auto_137384 ?auto_137390 ) ) ( not ( = ?auto_137384 ?auto_137389 ) ) ( not ( = ?auto_137385 ?auto_137390 ) ) ( not ( = ?auto_137385 ?auto_137389 ) ) ( not ( = ?auto_137386 ?auto_137390 ) ) ( not ( = ?auto_137386 ?auto_137389 ) ) ( not ( = ?auto_137387 ?auto_137390 ) ) ( not ( = ?auto_137387 ?auto_137389 ) ) ( not ( = ?auto_137388 ?auto_137390 ) ) ( not ( = ?auto_137388 ?auto_137389 ) ) ( not ( = ?auto_137390 ?auto_137389 ) ) ( ON ?auto_137390 ?auto_137388 ) ( ON-TABLE ?auto_137391 ) ( not ( = ?auto_137391 ?auto_137392 ) ) ( not ( = ?auto_137391 ?auto_137389 ) ) ( not ( = ?auto_137392 ?auto_137389 ) ) ( not ( = ?auto_137384 ?auto_137392 ) ) ( not ( = ?auto_137384 ?auto_137391 ) ) ( not ( = ?auto_137385 ?auto_137392 ) ) ( not ( = ?auto_137385 ?auto_137391 ) ) ( not ( = ?auto_137386 ?auto_137392 ) ) ( not ( = ?auto_137386 ?auto_137391 ) ) ( not ( = ?auto_137387 ?auto_137392 ) ) ( not ( = ?auto_137387 ?auto_137391 ) ) ( not ( = ?auto_137388 ?auto_137392 ) ) ( not ( = ?auto_137388 ?auto_137391 ) ) ( not ( = ?auto_137390 ?auto_137392 ) ) ( not ( = ?auto_137390 ?auto_137391 ) ) ( ON ?auto_137389 ?auto_137390 ) ( CLEAR ?auto_137391 ) ( ON ?auto_137392 ?auto_137389 ) ( CLEAR ?auto_137392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137384 ?auto_137385 ?auto_137386 ?auto_137387 ?auto_137388 ?auto_137390 ?auto_137389 )
      ( MAKE-4PILE ?auto_137384 ?auto_137385 ?auto_137386 ?auto_137387 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137393 - BLOCK
      ?auto_137394 - BLOCK
      ?auto_137395 - BLOCK
      ?auto_137396 - BLOCK
    )
    :vars
    (
      ?auto_137398 - BLOCK
      ?auto_137399 - BLOCK
      ?auto_137397 - BLOCK
      ?auto_137400 - BLOCK
      ?auto_137401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137398 ?auto_137396 ) ( ON-TABLE ?auto_137393 ) ( ON ?auto_137394 ?auto_137393 ) ( ON ?auto_137395 ?auto_137394 ) ( ON ?auto_137396 ?auto_137395 ) ( not ( = ?auto_137393 ?auto_137394 ) ) ( not ( = ?auto_137393 ?auto_137395 ) ) ( not ( = ?auto_137393 ?auto_137396 ) ) ( not ( = ?auto_137393 ?auto_137398 ) ) ( not ( = ?auto_137394 ?auto_137395 ) ) ( not ( = ?auto_137394 ?auto_137396 ) ) ( not ( = ?auto_137394 ?auto_137398 ) ) ( not ( = ?auto_137395 ?auto_137396 ) ) ( not ( = ?auto_137395 ?auto_137398 ) ) ( not ( = ?auto_137396 ?auto_137398 ) ) ( not ( = ?auto_137393 ?auto_137399 ) ) ( not ( = ?auto_137393 ?auto_137397 ) ) ( not ( = ?auto_137394 ?auto_137399 ) ) ( not ( = ?auto_137394 ?auto_137397 ) ) ( not ( = ?auto_137395 ?auto_137399 ) ) ( not ( = ?auto_137395 ?auto_137397 ) ) ( not ( = ?auto_137396 ?auto_137399 ) ) ( not ( = ?auto_137396 ?auto_137397 ) ) ( not ( = ?auto_137398 ?auto_137399 ) ) ( not ( = ?auto_137398 ?auto_137397 ) ) ( not ( = ?auto_137399 ?auto_137397 ) ) ( ON ?auto_137399 ?auto_137398 ) ( not ( = ?auto_137400 ?auto_137401 ) ) ( not ( = ?auto_137400 ?auto_137397 ) ) ( not ( = ?auto_137401 ?auto_137397 ) ) ( not ( = ?auto_137393 ?auto_137401 ) ) ( not ( = ?auto_137393 ?auto_137400 ) ) ( not ( = ?auto_137394 ?auto_137401 ) ) ( not ( = ?auto_137394 ?auto_137400 ) ) ( not ( = ?auto_137395 ?auto_137401 ) ) ( not ( = ?auto_137395 ?auto_137400 ) ) ( not ( = ?auto_137396 ?auto_137401 ) ) ( not ( = ?auto_137396 ?auto_137400 ) ) ( not ( = ?auto_137398 ?auto_137401 ) ) ( not ( = ?auto_137398 ?auto_137400 ) ) ( not ( = ?auto_137399 ?auto_137401 ) ) ( not ( = ?auto_137399 ?auto_137400 ) ) ( ON ?auto_137397 ?auto_137399 ) ( ON ?auto_137401 ?auto_137397 ) ( CLEAR ?auto_137401 ) ( HOLDING ?auto_137400 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137400 )
      ( MAKE-4PILE ?auto_137393 ?auto_137394 ?auto_137395 ?auto_137396 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_137402 - BLOCK
      ?auto_137403 - BLOCK
      ?auto_137404 - BLOCK
      ?auto_137405 - BLOCK
    )
    :vars
    (
      ?auto_137408 - BLOCK
      ?auto_137409 - BLOCK
      ?auto_137410 - BLOCK
      ?auto_137406 - BLOCK
      ?auto_137407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137408 ?auto_137405 ) ( ON-TABLE ?auto_137402 ) ( ON ?auto_137403 ?auto_137402 ) ( ON ?auto_137404 ?auto_137403 ) ( ON ?auto_137405 ?auto_137404 ) ( not ( = ?auto_137402 ?auto_137403 ) ) ( not ( = ?auto_137402 ?auto_137404 ) ) ( not ( = ?auto_137402 ?auto_137405 ) ) ( not ( = ?auto_137402 ?auto_137408 ) ) ( not ( = ?auto_137403 ?auto_137404 ) ) ( not ( = ?auto_137403 ?auto_137405 ) ) ( not ( = ?auto_137403 ?auto_137408 ) ) ( not ( = ?auto_137404 ?auto_137405 ) ) ( not ( = ?auto_137404 ?auto_137408 ) ) ( not ( = ?auto_137405 ?auto_137408 ) ) ( not ( = ?auto_137402 ?auto_137409 ) ) ( not ( = ?auto_137402 ?auto_137410 ) ) ( not ( = ?auto_137403 ?auto_137409 ) ) ( not ( = ?auto_137403 ?auto_137410 ) ) ( not ( = ?auto_137404 ?auto_137409 ) ) ( not ( = ?auto_137404 ?auto_137410 ) ) ( not ( = ?auto_137405 ?auto_137409 ) ) ( not ( = ?auto_137405 ?auto_137410 ) ) ( not ( = ?auto_137408 ?auto_137409 ) ) ( not ( = ?auto_137408 ?auto_137410 ) ) ( not ( = ?auto_137409 ?auto_137410 ) ) ( ON ?auto_137409 ?auto_137408 ) ( not ( = ?auto_137406 ?auto_137407 ) ) ( not ( = ?auto_137406 ?auto_137410 ) ) ( not ( = ?auto_137407 ?auto_137410 ) ) ( not ( = ?auto_137402 ?auto_137407 ) ) ( not ( = ?auto_137402 ?auto_137406 ) ) ( not ( = ?auto_137403 ?auto_137407 ) ) ( not ( = ?auto_137403 ?auto_137406 ) ) ( not ( = ?auto_137404 ?auto_137407 ) ) ( not ( = ?auto_137404 ?auto_137406 ) ) ( not ( = ?auto_137405 ?auto_137407 ) ) ( not ( = ?auto_137405 ?auto_137406 ) ) ( not ( = ?auto_137408 ?auto_137407 ) ) ( not ( = ?auto_137408 ?auto_137406 ) ) ( not ( = ?auto_137409 ?auto_137407 ) ) ( not ( = ?auto_137409 ?auto_137406 ) ) ( ON ?auto_137410 ?auto_137409 ) ( ON ?auto_137407 ?auto_137410 ) ( ON ?auto_137406 ?auto_137407 ) ( CLEAR ?auto_137406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137402 ?auto_137403 ?auto_137404 ?auto_137405 ?auto_137408 ?auto_137409 ?auto_137410 ?auto_137407 )
      ( MAKE-4PILE ?auto_137402 ?auto_137403 ?auto_137404 ?auto_137405 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137416 - BLOCK
      ?auto_137417 - BLOCK
      ?auto_137418 - BLOCK
      ?auto_137419 - BLOCK
      ?auto_137420 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_137420 ) ( CLEAR ?auto_137419 ) ( ON-TABLE ?auto_137416 ) ( ON ?auto_137417 ?auto_137416 ) ( ON ?auto_137418 ?auto_137417 ) ( ON ?auto_137419 ?auto_137418 ) ( not ( = ?auto_137416 ?auto_137417 ) ) ( not ( = ?auto_137416 ?auto_137418 ) ) ( not ( = ?auto_137416 ?auto_137419 ) ) ( not ( = ?auto_137416 ?auto_137420 ) ) ( not ( = ?auto_137417 ?auto_137418 ) ) ( not ( = ?auto_137417 ?auto_137419 ) ) ( not ( = ?auto_137417 ?auto_137420 ) ) ( not ( = ?auto_137418 ?auto_137419 ) ) ( not ( = ?auto_137418 ?auto_137420 ) ) ( not ( = ?auto_137419 ?auto_137420 ) ) )
    :subtasks
    ( ( !STACK ?auto_137420 ?auto_137419 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137421 - BLOCK
      ?auto_137422 - BLOCK
      ?auto_137423 - BLOCK
      ?auto_137424 - BLOCK
      ?auto_137425 - BLOCK
    )
    :vars
    (
      ?auto_137426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137424 ) ( ON-TABLE ?auto_137421 ) ( ON ?auto_137422 ?auto_137421 ) ( ON ?auto_137423 ?auto_137422 ) ( ON ?auto_137424 ?auto_137423 ) ( not ( = ?auto_137421 ?auto_137422 ) ) ( not ( = ?auto_137421 ?auto_137423 ) ) ( not ( = ?auto_137421 ?auto_137424 ) ) ( not ( = ?auto_137421 ?auto_137425 ) ) ( not ( = ?auto_137422 ?auto_137423 ) ) ( not ( = ?auto_137422 ?auto_137424 ) ) ( not ( = ?auto_137422 ?auto_137425 ) ) ( not ( = ?auto_137423 ?auto_137424 ) ) ( not ( = ?auto_137423 ?auto_137425 ) ) ( not ( = ?auto_137424 ?auto_137425 ) ) ( ON ?auto_137425 ?auto_137426 ) ( CLEAR ?auto_137425 ) ( HAND-EMPTY ) ( not ( = ?auto_137421 ?auto_137426 ) ) ( not ( = ?auto_137422 ?auto_137426 ) ) ( not ( = ?auto_137423 ?auto_137426 ) ) ( not ( = ?auto_137424 ?auto_137426 ) ) ( not ( = ?auto_137425 ?auto_137426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137425 ?auto_137426 )
      ( MAKE-5PILE ?auto_137421 ?auto_137422 ?auto_137423 ?auto_137424 ?auto_137425 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137427 - BLOCK
      ?auto_137428 - BLOCK
      ?auto_137429 - BLOCK
      ?auto_137430 - BLOCK
      ?auto_137431 - BLOCK
    )
    :vars
    (
      ?auto_137432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137427 ) ( ON ?auto_137428 ?auto_137427 ) ( ON ?auto_137429 ?auto_137428 ) ( not ( = ?auto_137427 ?auto_137428 ) ) ( not ( = ?auto_137427 ?auto_137429 ) ) ( not ( = ?auto_137427 ?auto_137430 ) ) ( not ( = ?auto_137427 ?auto_137431 ) ) ( not ( = ?auto_137428 ?auto_137429 ) ) ( not ( = ?auto_137428 ?auto_137430 ) ) ( not ( = ?auto_137428 ?auto_137431 ) ) ( not ( = ?auto_137429 ?auto_137430 ) ) ( not ( = ?auto_137429 ?auto_137431 ) ) ( not ( = ?auto_137430 ?auto_137431 ) ) ( ON ?auto_137431 ?auto_137432 ) ( CLEAR ?auto_137431 ) ( not ( = ?auto_137427 ?auto_137432 ) ) ( not ( = ?auto_137428 ?auto_137432 ) ) ( not ( = ?auto_137429 ?auto_137432 ) ) ( not ( = ?auto_137430 ?auto_137432 ) ) ( not ( = ?auto_137431 ?auto_137432 ) ) ( HOLDING ?auto_137430 ) ( CLEAR ?auto_137429 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137427 ?auto_137428 ?auto_137429 ?auto_137430 )
      ( MAKE-5PILE ?auto_137427 ?auto_137428 ?auto_137429 ?auto_137430 ?auto_137431 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137433 - BLOCK
      ?auto_137434 - BLOCK
      ?auto_137435 - BLOCK
      ?auto_137436 - BLOCK
      ?auto_137437 - BLOCK
    )
    :vars
    (
      ?auto_137438 - BLOCK
      ?auto_137441 - BLOCK
      ?auto_137440 - BLOCK
      ?auto_137439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137433 ) ( ON ?auto_137434 ?auto_137433 ) ( ON ?auto_137435 ?auto_137434 ) ( not ( = ?auto_137433 ?auto_137434 ) ) ( not ( = ?auto_137433 ?auto_137435 ) ) ( not ( = ?auto_137433 ?auto_137436 ) ) ( not ( = ?auto_137433 ?auto_137437 ) ) ( not ( = ?auto_137434 ?auto_137435 ) ) ( not ( = ?auto_137434 ?auto_137436 ) ) ( not ( = ?auto_137434 ?auto_137437 ) ) ( not ( = ?auto_137435 ?auto_137436 ) ) ( not ( = ?auto_137435 ?auto_137437 ) ) ( not ( = ?auto_137436 ?auto_137437 ) ) ( ON ?auto_137437 ?auto_137438 ) ( not ( = ?auto_137433 ?auto_137438 ) ) ( not ( = ?auto_137434 ?auto_137438 ) ) ( not ( = ?auto_137435 ?auto_137438 ) ) ( not ( = ?auto_137436 ?auto_137438 ) ) ( not ( = ?auto_137437 ?auto_137438 ) ) ( CLEAR ?auto_137435 ) ( ON ?auto_137436 ?auto_137437 ) ( CLEAR ?auto_137436 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137441 ) ( ON ?auto_137440 ?auto_137441 ) ( ON ?auto_137439 ?auto_137440 ) ( ON ?auto_137438 ?auto_137439 ) ( not ( = ?auto_137441 ?auto_137440 ) ) ( not ( = ?auto_137441 ?auto_137439 ) ) ( not ( = ?auto_137441 ?auto_137438 ) ) ( not ( = ?auto_137441 ?auto_137437 ) ) ( not ( = ?auto_137441 ?auto_137436 ) ) ( not ( = ?auto_137440 ?auto_137439 ) ) ( not ( = ?auto_137440 ?auto_137438 ) ) ( not ( = ?auto_137440 ?auto_137437 ) ) ( not ( = ?auto_137440 ?auto_137436 ) ) ( not ( = ?auto_137439 ?auto_137438 ) ) ( not ( = ?auto_137439 ?auto_137437 ) ) ( not ( = ?auto_137439 ?auto_137436 ) ) ( not ( = ?auto_137433 ?auto_137441 ) ) ( not ( = ?auto_137433 ?auto_137440 ) ) ( not ( = ?auto_137433 ?auto_137439 ) ) ( not ( = ?auto_137434 ?auto_137441 ) ) ( not ( = ?auto_137434 ?auto_137440 ) ) ( not ( = ?auto_137434 ?auto_137439 ) ) ( not ( = ?auto_137435 ?auto_137441 ) ) ( not ( = ?auto_137435 ?auto_137440 ) ) ( not ( = ?auto_137435 ?auto_137439 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137441 ?auto_137440 ?auto_137439 ?auto_137438 ?auto_137437 )
      ( MAKE-5PILE ?auto_137433 ?auto_137434 ?auto_137435 ?auto_137436 ?auto_137437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137442 - BLOCK
      ?auto_137443 - BLOCK
      ?auto_137444 - BLOCK
      ?auto_137445 - BLOCK
      ?auto_137446 - BLOCK
    )
    :vars
    (
      ?auto_137447 - BLOCK
      ?auto_137450 - BLOCK
      ?auto_137449 - BLOCK
      ?auto_137448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137442 ) ( ON ?auto_137443 ?auto_137442 ) ( not ( = ?auto_137442 ?auto_137443 ) ) ( not ( = ?auto_137442 ?auto_137444 ) ) ( not ( = ?auto_137442 ?auto_137445 ) ) ( not ( = ?auto_137442 ?auto_137446 ) ) ( not ( = ?auto_137443 ?auto_137444 ) ) ( not ( = ?auto_137443 ?auto_137445 ) ) ( not ( = ?auto_137443 ?auto_137446 ) ) ( not ( = ?auto_137444 ?auto_137445 ) ) ( not ( = ?auto_137444 ?auto_137446 ) ) ( not ( = ?auto_137445 ?auto_137446 ) ) ( ON ?auto_137446 ?auto_137447 ) ( not ( = ?auto_137442 ?auto_137447 ) ) ( not ( = ?auto_137443 ?auto_137447 ) ) ( not ( = ?auto_137444 ?auto_137447 ) ) ( not ( = ?auto_137445 ?auto_137447 ) ) ( not ( = ?auto_137446 ?auto_137447 ) ) ( ON ?auto_137445 ?auto_137446 ) ( CLEAR ?auto_137445 ) ( ON-TABLE ?auto_137450 ) ( ON ?auto_137449 ?auto_137450 ) ( ON ?auto_137448 ?auto_137449 ) ( ON ?auto_137447 ?auto_137448 ) ( not ( = ?auto_137450 ?auto_137449 ) ) ( not ( = ?auto_137450 ?auto_137448 ) ) ( not ( = ?auto_137450 ?auto_137447 ) ) ( not ( = ?auto_137450 ?auto_137446 ) ) ( not ( = ?auto_137450 ?auto_137445 ) ) ( not ( = ?auto_137449 ?auto_137448 ) ) ( not ( = ?auto_137449 ?auto_137447 ) ) ( not ( = ?auto_137449 ?auto_137446 ) ) ( not ( = ?auto_137449 ?auto_137445 ) ) ( not ( = ?auto_137448 ?auto_137447 ) ) ( not ( = ?auto_137448 ?auto_137446 ) ) ( not ( = ?auto_137448 ?auto_137445 ) ) ( not ( = ?auto_137442 ?auto_137450 ) ) ( not ( = ?auto_137442 ?auto_137449 ) ) ( not ( = ?auto_137442 ?auto_137448 ) ) ( not ( = ?auto_137443 ?auto_137450 ) ) ( not ( = ?auto_137443 ?auto_137449 ) ) ( not ( = ?auto_137443 ?auto_137448 ) ) ( not ( = ?auto_137444 ?auto_137450 ) ) ( not ( = ?auto_137444 ?auto_137449 ) ) ( not ( = ?auto_137444 ?auto_137448 ) ) ( HOLDING ?auto_137444 ) ( CLEAR ?auto_137443 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137442 ?auto_137443 ?auto_137444 )
      ( MAKE-5PILE ?auto_137442 ?auto_137443 ?auto_137444 ?auto_137445 ?auto_137446 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137451 - BLOCK
      ?auto_137452 - BLOCK
      ?auto_137453 - BLOCK
      ?auto_137454 - BLOCK
      ?auto_137455 - BLOCK
    )
    :vars
    (
      ?auto_137458 - BLOCK
      ?auto_137457 - BLOCK
      ?auto_137456 - BLOCK
      ?auto_137459 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137451 ) ( ON ?auto_137452 ?auto_137451 ) ( not ( = ?auto_137451 ?auto_137452 ) ) ( not ( = ?auto_137451 ?auto_137453 ) ) ( not ( = ?auto_137451 ?auto_137454 ) ) ( not ( = ?auto_137451 ?auto_137455 ) ) ( not ( = ?auto_137452 ?auto_137453 ) ) ( not ( = ?auto_137452 ?auto_137454 ) ) ( not ( = ?auto_137452 ?auto_137455 ) ) ( not ( = ?auto_137453 ?auto_137454 ) ) ( not ( = ?auto_137453 ?auto_137455 ) ) ( not ( = ?auto_137454 ?auto_137455 ) ) ( ON ?auto_137455 ?auto_137458 ) ( not ( = ?auto_137451 ?auto_137458 ) ) ( not ( = ?auto_137452 ?auto_137458 ) ) ( not ( = ?auto_137453 ?auto_137458 ) ) ( not ( = ?auto_137454 ?auto_137458 ) ) ( not ( = ?auto_137455 ?auto_137458 ) ) ( ON ?auto_137454 ?auto_137455 ) ( ON-TABLE ?auto_137457 ) ( ON ?auto_137456 ?auto_137457 ) ( ON ?auto_137459 ?auto_137456 ) ( ON ?auto_137458 ?auto_137459 ) ( not ( = ?auto_137457 ?auto_137456 ) ) ( not ( = ?auto_137457 ?auto_137459 ) ) ( not ( = ?auto_137457 ?auto_137458 ) ) ( not ( = ?auto_137457 ?auto_137455 ) ) ( not ( = ?auto_137457 ?auto_137454 ) ) ( not ( = ?auto_137456 ?auto_137459 ) ) ( not ( = ?auto_137456 ?auto_137458 ) ) ( not ( = ?auto_137456 ?auto_137455 ) ) ( not ( = ?auto_137456 ?auto_137454 ) ) ( not ( = ?auto_137459 ?auto_137458 ) ) ( not ( = ?auto_137459 ?auto_137455 ) ) ( not ( = ?auto_137459 ?auto_137454 ) ) ( not ( = ?auto_137451 ?auto_137457 ) ) ( not ( = ?auto_137451 ?auto_137456 ) ) ( not ( = ?auto_137451 ?auto_137459 ) ) ( not ( = ?auto_137452 ?auto_137457 ) ) ( not ( = ?auto_137452 ?auto_137456 ) ) ( not ( = ?auto_137452 ?auto_137459 ) ) ( not ( = ?auto_137453 ?auto_137457 ) ) ( not ( = ?auto_137453 ?auto_137456 ) ) ( not ( = ?auto_137453 ?auto_137459 ) ) ( CLEAR ?auto_137452 ) ( ON ?auto_137453 ?auto_137454 ) ( CLEAR ?auto_137453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137457 ?auto_137456 ?auto_137459 ?auto_137458 ?auto_137455 ?auto_137454 )
      ( MAKE-5PILE ?auto_137451 ?auto_137452 ?auto_137453 ?auto_137454 ?auto_137455 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137460 - BLOCK
      ?auto_137461 - BLOCK
      ?auto_137462 - BLOCK
      ?auto_137463 - BLOCK
      ?auto_137464 - BLOCK
    )
    :vars
    (
      ?auto_137465 - BLOCK
      ?auto_137466 - BLOCK
      ?auto_137468 - BLOCK
      ?auto_137467 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137460 ) ( not ( = ?auto_137460 ?auto_137461 ) ) ( not ( = ?auto_137460 ?auto_137462 ) ) ( not ( = ?auto_137460 ?auto_137463 ) ) ( not ( = ?auto_137460 ?auto_137464 ) ) ( not ( = ?auto_137461 ?auto_137462 ) ) ( not ( = ?auto_137461 ?auto_137463 ) ) ( not ( = ?auto_137461 ?auto_137464 ) ) ( not ( = ?auto_137462 ?auto_137463 ) ) ( not ( = ?auto_137462 ?auto_137464 ) ) ( not ( = ?auto_137463 ?auto_137464 ) ) ( ON ?auto_137464 ?auto_137465 ) ( not ( = ?auto_137460 ?auto_137465 ) ) ( not ( = ?auto_137461 ?auto_137465 ) ) ( not ( = ?auto_137462 ?auto_137465 ) ) ( not ( = ?auto_137463 ?auto_137465 ) ) ( not ( = ?auto_137464 ?auto_137465 ) ) ( ON ?auto_137463 ?auto_137464 ) ( ON-TABLE ?auto_137466 ) ( ON ?auto_137468 ?auto_137466 ) ( ON ?auto_137467 ?auto_137468 ) ( ON ?auto_137465 ?auto_137467 ) ( not ( = ?auto_137466 ?auto_137468 ) ) ( not ( = ?auto_137466 ?auto_137467 ) ) ( not ( = ?auto_137466 ?auto_137465 ) ) ( not ( = ?auto_137466 ?auto_137464 ) ) ( not ( = ?auto_137466 ?auto_137463 ) ) ( not ( = ?auto_137468 ?auto_137467 ) ) ( not ( = ?auto_137468 ?auto_137465 ) ) ( not ( = ?auto_137468 ?auto_137464 ) ) ( not ( = ?auto_137468 ?auto_137463 ) ) ( not ( = ?auto_137467 ?auto_137465 ) ) ( not ( = ?auto_137467 ?auto_137464 ) ) ( not ( = ?auto_137467 ?auto_137463 ) ) ( not ( = ?auto_137460 ?auto_137466 ) ) ( not ( = ?auto_137460 ?auto_137468 ) ) ( not ( = ?auto_137460 ?auto_137467 ) ) ( not ( = ?auto_137461 ?auto_137466 ) ) ( not ( = ?auto_137461 ?auto_137468 ) ) ( not ( = ?auto_137461 ?auto_137467 ) ) ( not ( = ?auto_137462 ?auto_137466 ) ) ( not ( = ?auto_137462 ?auto_137468 ) ) ( not ( = ?auto_137462 ?auto_137467 ) ) ( ON ?auto_137462 ?auto_137463 ) ( CLEAR ?auto_137462 ) ( HOLDING ?auto_137461 ) ( CLEAR ?auto_137460 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137460 ?auto_137461 )
      ( MAKE-5PILE ?auto_137460 ?auto_137461 ?auto_137462 ?auto_137463 ?auto_137464 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137469 - BLOCK
      ?auto_137470 - BLOCK
      ?auto_137471 - BLOCK
      ?auto_137472 - BLOCK
      ?auto_137473 - BLOCK
    )
    :vars
    (
      ?auto_137475 - BLOCK
      ?auto_137476 - BLOCK
      ?auto_137477 - BLOCK
      ?auto_137474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137469 ) ( not ( = ?auto_137469 ?auto_137470 ) ) ( not ( = ?auto_137469 ?auto_137471 ) ) ( not ( = ?auto_137469 ?auto_137472 ) ) ( not ( = ?auto_137469 ?auto_137473 ) ) ( not ( = ?auto_137470 ?auto_137471 ) ) ( not ( = ?auto_137470 ?auto_137472 ) ) ( not ( = ?auto_137470 ?auto_137473 ) ) ( not ( = ?auto_137471 ?auto_137472 ) ) ( not ( = ?auto_137471 ?auto_137473 ) ) ( not ( = ?auto_137472 ?auto_137473 ) ) ( ON ?auto_137473 ?auto_137475 ) ( not ( = ?auto_137469 ?auto_137475 ) ) ( not ( = ?auto_137470 ?auto_137475 ) ) ( not ( = ?auto_137471 ?auto_137475 ) ) ( not ( = ?auto_137472 ?auto_137475 ) ) ( not ( = ?auto_137473 ?auto_137475 ) ) ( ON ?auto_137472 ?auto_137473 ) ( ON-TABLE ?auto_137476 ) ( ON ?auto_137477 ?auto_137476 ) ( ON ?auto_137474 ?auto_137477 ) ( ON ?auto_137475 ?auto_137474 ) ( not ( = ?auto_137476 ?auto_137477 ) ) ( not ( = ?auto_137476 ?auto_137474 ) ) ( not ( = ?auto_137476 ?auto_137475 ) ) ( not ( = ?auto_137476 ?auto_137473 ) ) ( not ( = ?auto_137476 ?auto_137472 ) ) ( not ( = ?auto_137477 ?auto_137474 ) ) ( not ( = ?auto_137477 ?auto_137475 ) ) ( not ( = ?auto_137477 ?auto_137473 ) ) ( not ( = ?auto_137477 ?auto_137472 ) ) ( not ( = ?auto_137474 ?auto_137475 ) ) ( not ( = ?auto_137474 ?auto_137473 ) ) ( not ( = ?auto_137474 ?auto_137472 ) ) ( not ( = ?auto_137469 ?auto_137476 ) ) ( not ( = ?auto_137469 ?auto_137477 ) ) ( not ( = ?auto_137469 ?auto_137474 ) ) ( not ( = ?auto_137470 ?auto_137476 ) ) ( not ( = ?auto_137470 ?auto_137477 ) ) ( not ( = ?auto_137470 ?auto_137474 ) ) ( not ( = ?auto_137471 ?auto_137476 ) ) ( not ( = ?auto_137471 ?auto_137477 ) ) ( not ( = ?auto_137471 ?auto_137474 ) ) ( ON ?auto_137471 ?auto_137472 ) ( CLEAR ?auto_137469 ) ( ON ?auto_137470 ?auto_137471 ) ( CLEAR ?auto_137470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137476 ?auto_137477 ?auto_137474 ?auto_137475 ?auto_137473 ?auto_137472 ?auto_137471 )
      ( MAKE-5PILE ?auto_137469 ?auto_137470 ?auto_137471 ?auto_137472 ?auto_137473 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137478 - BLOCK
      ?auto_137479 - BLOCK
      ?auto_137480 - BLOCK
      ?auto_137481 - BLOCK
      ?auto_137482 - BLOCK
    )
    :vars
    (
      ?auto_137483 - BLOCK
      ?auto_137485 - BLOCK
      ?auto_137486 - BLOCK
      ?auto_137484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137478 ?auto_137479 ) ) ( not ( = ?auto_137478 ?auto_137480 ) ) ( not ( = ?auto_137478 ?auto_137481 ) ) ( not ( = ?auto_137478 ?auto_137482 ) ) ( not ( = ?auto_137479 ?auto_137480 ) ) ( not ( = ?auto_137479 ?auto_137481 ) ) ( not ( = ?auto_137479 ?auto_137482 ) ) ( not ( = ?auto_137480 ?auto_137481 ) ) ( not ( = ?auto_137480 ?auto_137482 ) ) ( not ( = ?auto_137481 ?auto_137482 ) ) ( ON ?auto_137482 ?auto_137483 ) ( not ( = ?auto_137478 ?auto_137483 ) ) ( not ( = ?auto_137479 ?auto_137483 ) ) ( not ( = ?auto_137480 ?auto_137483 ) ) ( not ( = ?auto_137481 ?auto_137483 ) ) ( not ( = ?auto_137482 ?auto_137483 ) ) ( ON ?auto_137481 ?auto_137482 ) ( ON-TABLE ?auto_137485 ) ( ON ?auto_137486 ?auto_137485 ) ( ON ?auto_137484 ?auto_137486 ) ( ON ?auto_137483 ?auto_137484 ) ( not ( = ?auto_137485 ?auto_137486 ) ) ( not ( = ?auto_137485 ?auto_137484 ) ) ( not ( = ?auto_137485 ?auto_137483 ) ) ( not ( = ?auto_137485 ?auto_137482 ) ) ( not ( = ?auto_137485 ?auto_137481 ) ) ( not ( = ?auto_137486 ?auto_137484 ) ) ( not ( = ?auto_137486 ?auto_137483 ) ) ( not ( = ?auto_137486 ?auto_137482 ) ) ( not ( = ?auto_137486 ?auto_137481 ) ) ( not ( = ?auto_137484 ?auto_137483 ) ) ( not ( = ?auto_137484 ?auto_137482 ) ) ( not ( = ?auto_137484 ?auto_137481 ) ) ( not ( = ?auto_137478 ?auto_137485 ) ) ( not ( = ?auto_137478 ?auto_137486 ) ) ( not ( = ?auto_137478 ?auto_137484 ) ) ( not ( = ?auto_137479 ?auto_137485 ) ) ( not ( = ?auto_137479 ?auto_137486 ) ) ( not ( = ?auto_137479 ?auto_137484 ) ) ( not ( = ?auto_137480 ?auto_137485 ) ) ( not ( = ?auto_137480 ?auto_137486 ) ) ( not ( = ?auto_137480 ?auto_137484 ) ) ( ON ?auto_137480 ?auto_137481 ) ( ON ?auto_137479 ?auto_137480 ) ( CLEAR ?auto_137479 ) ( HOLDING ?auto_137478 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137478 )
      ( MAKE-5PILE ?auto_137478 ?auto_137479 ?auto_137480 ?auto_137481 ?auto_137482 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_137487 - BLOCK
      ?auto_137488 - BLOCK
      ?auto_137489 - BLOCK
      ?auto_137490 - BLOCK
      ?auto_137491 - BLOCK
    )
    :vars
    (
      ?auto_137493 - BLOCK
      ?auto_137494 - BLOCK
      ?auto_137492 - BLOCK
      ?auto_137495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137487 ?auto_137488 ) ) ( not ( = ?auto_137487 ?auto_137489 ) ) ( not ( = ?auto_137487 ?auto_137490 ) ) ( not ( = ?auto_137487 ?auto_137491 ) ) ( not ( = ?auto_137488 ?auto_137489 ) ) ( not ( = ?auto_137488 ?auto_137490 ) ) ( not ( = ?auto_137488 ?auto_137491 ) ) ( not ( = ?auto_137489 ?auto_137490 ) ) ( not ( = ?auto_137489 ?auto_137491 ) ) ( not ( = ?auto_137490 ?auto_137491 ) ) ( ON ?auto_137491 ?auto_137493 ) ( not ( = ?auto_137487 ?auto_137493 ) ) ( not ( = ?auto_137488 ?auto_137493 ) ) ( not ( = ?auto_137489 ?auto_137493 ) ) ( not ( = ?auto_137490 ?auto_137493 ) ) ( not ( = ?auto_137491 ?auto_137493 ) ) ( ON ?auto_137490 ?auto_137491 ) ( ON-TABLE ?auto_137494 ) ( ON ?auto_137492 ?auto_137494 ) ( ON ?auto_137495 ?auto_137492 ) ( ON ?auto_137493 ?auto_137495 ) ( not ( = ?auto_137494 ?auto_137492 ) ) ( not ( = ?auto_137494 ?auto_137495 ) ) ( not ( = ?auto_137494 ?auto_137493 ) ) ( not ( = ?auto_137494 ?auto_137491 ) ) ( not ( = ?auto_137494 ?auto_137490 ) ) ( not ( = ?auto_137492 ?auto_137495 ) ) ( not ( = ?auto_137492 ?auto_137493 ) ) ( not ( = ?auto_137492 ?auto_137491 ) ) ( not ( = ?auto_137492 ?auto_137490 ) ) ( not ( = ?auto_137495 ?auto_137493 ) ) ( not ( = ?auto_137495 ?auto_137491 ) ) ( not ( = ?auto_137495 ?auto_137490 ) ) ( not ( = ?auto_137487 ?auto_137494 ) ) ( not ( = ?auto_137487 ?auto_137492 ) ) ( not ( = ?auto_137487 ?auto_137495 ) ) ( not ( = ?auto_137488 ?auto_137494 ) ) ( not ( = ?auto_137488 ?auto_137492 ) ) ( not ( = ?auto_137488 ?auto_137495 ) ) ( not ( = ?auto_137489 ?auto_137494 ) ) ( not ( = ?auto_137489 ?auto_137492 ) ) ( not ( = ?auto_137489 ?auto_137495 ) ) ( ON ?auto_137489 ?auto_137490 ) ( ON ?auto_137488 ?auto_137489 ) ( ON ?auto_137487 ?auto_137488 ) ( CLEAR ?auto_137487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137494 ?auto_137492 ?auto_137495 ?auto_137493 ?auto_137491 ?auto_137490 ?auto_137489 ?auto_137488 )
      ( MAKE-5PILE ?auto_137487 ?auto_137488 ?auto_137489 ?auto_137490 ?auto_137491 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137499 - BLOCK
      ?auto_137500 - BLOCK
      ?auto_137501 - BLOCK
    )
    :vars
    (
      ?auto_137502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137502 ?auto_137501 ) ( CLEAR ?auto_137502 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137499 ) ( ON ?auto_137500 ?auto_137499 ) ( ON ?auto_137501 ?auto_137500 ) ( not ( = ?auto_137499 ?auto_137500 ) ) ( not ( = ?auto_137499 ?auto_137501 ) ) ( not ( = ?auto_137499 ?auto_137502 ) ) ( not ( = ?auto_137500 ?auto_137501 ) ) ( not ( = ?auto_137500 ?auto_137502 ) ) ( not ( = ?auto_137501 ?auto_137502 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137502 ?auto_137501 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137503 - BLOCK
      ?auto_137504 - BLOCK
      ?auto_137505 - BLOCK
    )
    :vars
    (
      ?auto_137506 - BLOCK
      ?auto_137507 - BLOCK
      ?auto_137508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137506 ?auto_137505 ) ( CLEAR ?auto_137506 ) ( ON-TABLE ?auto_137503 ) ( ON ?auto_137504 ?auto_137503 ) ( ON ?auto_137505 ?auto_137504 ) ( not ( = ?auto_137503 ?auto_137504 ) ) ( not ( = ?auto_137503 ?auto_137505 ) ) ( not ( = ?auto_137503 ?auto_137506 ) ) ( not ( = ?auto_137504 ?auto_137505 ) ) ( not ( = ?auto_137504 ?auto_137506 ) ) ( not ( = ?auto_137505 ?auto_137506 ) ) ( HOLDING ?auto_137507 ) ( CLEAR ?auto_137508 ) ( not ( = ?auto_137503 ?auto_137507 ) ) ( not ( = ?auto_137503 ?auto_137508 ) ) ( not ( = ?auto_137504 ?auto_137507 ) ) ( not ( = ?auto_137504 ?auto_137508 ) ) ( not ( = ?auto_137505 ?auto_137507 ) ) ( not ( = ?auto_137505 ?auto_137508 ) ) ( not ( = ?auto_137506 ?auto_137507 ) ) ( not ( = ?auto_137506 ?auto_137508 ) ) ( not ( = ?auto_137507 ?auto_137508 ) ) )
    :subtasks
    ( ( !STACK ?auto_137507 ?auto_137508 )
      ( MAKE-3PILE ?auto_137503 ?auto_137504 ?auto_137505 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137509 - BLOCK
      ?auto_137510 - BLOCK
      ?auto_137511 - BLOCK
    )
    :vars
    (
      ?auto_137514 - BLOCK
      ?auto_137512 - BLOCK
      ?auto_137513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137514 ?auto_137511 ) ( ON-TABLE ?auto_137509 ) ( ON ?auto_137510 ?auto_137509 ) ( ON ?auto_137511 ?auto_137510 ) ( not ( = ?auto_137509 ?auto_137510 ) ) ( not ( = ?auto_137509 ?auto_137511 ) ) ( not ( = ?auto_137509 ?auto_137514 ) ) ( not ( = ?auto_137510 ?auto_137511 ) ) ( not ( = ?auto_137510 ?auto_137514 ) ) ( not ( = ?auto_137511 ?auto_137514 ) ) ( CLEAR ?auto_137512 ) ( not ( = ?auto_137509 ?auto_137513 ) ) ( not ( = ?auto_137509 ?auto_137512 ) ) ( not ( = ?auto_137510 ?auto_137513 ) ) ( not ( = ?auto_137510 ?auto_137512 ) ) ( not ( = ?auto_137511 ?auto_137513 ) ) ( not ( = ?auto_137511 ?auto_137512 ) ) ( not ( = ?auto_137514 ?auto_137513 ) ) ( not ( = ?auto_137514 ?auto_137512 ) ) ( not ( = ?auto_137513 ?auto_137512 ) ) ( ON ?auto_137513 ?auto_137514 ) ( CLEAR ?auto_137513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137509 ?auto_137510 ?auto_137511 ?auto_137514 )
      ( MAKE-3PILE ?auto_137509 ?auto_137510 ?auto_137511 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137515 - BLOCK
      ?auto_137516 - BLOCK
      ?auto_137517 - BLOCK
    )
    :vars
    (
      ?auto_137520 - BLOCK
      ?auto_137519 - BLOCK
      ?auto_137518 - BLOCK
      ?auto_137521 - BLOCK
      ?auto_137522 - BLOCK
      ?auto_137523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137520 ?auto_137517 ) ( ON-TABLE ?auto_137515 ) ( ON ?auto_137516 ?auto_137515 ) ( ON ?auto_137517 ?auto_137516 ) ( not ( = ?auto_137515 ?auto_137516 ) ) ( not ( = ?auto_137515 ?auto_137517 ) ) ( not ( = ?auto_137515 ?auto_137520 ) ) ( not ( = ?auto_137516 ?auto_137517 ) ) ( not ( = ?auto_137516 ?auto_137520 ) ) ( not ( = ?auto_137517 ?auto_137520 ) ) ( not ( = ?auto_137515 ?auto_137519 ) ) ( not ( = ?auto_137515 ?auto_137518 ) ) ( not ( = ?auto_137516 ?auto_137519 ) ) ( not ( = ?auto_137516 ?auto_137518 ) ) ( not ( = ?auto_137517 ?auto_137519 ) ) ( not ( = ?auto_137517 ?auto_137518 ) ) ( not ( = ?auto_137520 ?auto_137519 ) ) ( not ( = ?auto_137520 ?auto_137518 ) ) ( not ( = ?auto_137519 ?auto_137518 ) ) ( ON ?auto_137519 ?auto_137520 ) ( CLEAR ?auto_137519 ) ( HOLDING ?auto_137518 ) ( CLEAR ?auto_137521 ) ( ON-TABLE ?auto_137522 ) ( ON ?auto_137523 ?auto_137522 ) ( ON ?auto_137521 ?auto_137523 ) ( not ( = ?auto_137522 ?auto_137523 ) ) ( not ( = ?auto_137522 ?auto_137521 ) ) ( not ( = ?auto_137522 ?auto_137518 ) ) ( not ( = ?auto_137523 ?auto_137521 ) ) ( not ( = ?auto_137523 ?auto_137518 ) ) ( not ( = ?auto_137521 ?auto_137518 ) ) ( not ( = ?auto_137515 ?auto_137521 ) ) ( not ( = ?auto_137515 ?auto_137522 ) ) ( not ( = ?auto_137515 ?auto_137523 ) ) ( not ( = ?auto_137516 ?auto_137521 ) ) ( not ( = ?auto_137516 ?auto_137522 ) ) ( not ( = ?auto_137516 ?auto_137523 ) ) ( not ( = ?auto_137517 ?auto_137521 ) ) ( not ( = ?auto_137517 ?auto_137522 ) ) ( not ( = ?auto_137517 ?auto_137523 ) ) ( not ( = ?auto_137520 ?auto_137521 ) ) ( not ( = ?auto_137520 ?auto_137522 ) ) ( not ( = ?auto_137520 ?auto_137523 ) ) ( not ( = ?auto_137519 ?auto_137521 ) ) ( not ( = ?auto_137519 ?auto_137522 ) ) ( not ( = ?auto_137519 ?auto_137523 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137522 ?auto_137523 ?auto_137521 ?auto_137518 )
      ( MAKE-3PILE ?auto_137515 ?auto_137516 ?auto_137517 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137524 - BLOCK
      ?auto_137525 - BLOCK
      ?auto_137526 - BLOCK
    )
    :vars
    (
      ?auto_137531 - BLOCK
      ?auto_137527 - BLOCK
      ?auto_137529 - BLOCK
      ?auto_137530 - BLOCK
      ?auto_137528 - BLOCK
      ?auto_137532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137531 ?auto_137526 ) ( ON-TABLE ?auto_137524 ) ( ON ?auto_137525 ?auto_137524 ) ( ON ?auto_137526 ?auto_137525 ) ( not ( = ?auto_137524 ?auto_137525 ) ) ( not ( = ?auto_137524 ?auto_137526 ) ) ( not ( = ?auto_137524 ?auto_137531 ) ) ( not ( = ?auto_137525 ?auto_137526 ) ) ( not ( = ?auto_137525 ?auto_137531 ) ) ( not ( = ?auto_137526 ?auto_137531 ) ) ( not ( = ?auto_137524 ?auto_137527 ) ) ( not ( = ?auto_137524 ?auto_137529 ) ) ( not ( = ?auto_137525 ?auto_137527 ) ) ( not ( = ?auto_137525 ?auto_137529 ) ) ( not ( = ?auto_137526 ?auto_137527 ) ) ( not ( = ?auto_137526 ?auto_137529 ) ) ( not ( = ?auto_137531 ?auto_137527 ) ) ( not ( = ?auto_137531 ?auto_137529 ) ) ( not ( = ?auto_137527 ?auto_137529 ) ) ( ON ?auto_137527 ?auto_137531 ) ( CLEAR ?auto_137530 ) ( ON-TABLE ?auto_137528 ) ( ON ?auto_137532 ?auto_137528 ) ( ON ?auto_137530 ?auto_137532 ) ( not ( = ?auto_137528 ?auto_137532 ) ) ( not ( = ?auto_137528 ?auto_137530 ) ) ( not ( = ?auto_137528 ?auto_137529 ) ) ( not ( = ?auto_137532 ?auto_137530 ) ) ( not ( = ?auto_137532 ?auto_137529 ) ) ( not ( = ?auto_137530 ?auto_137529 ) ) ( not ( = ?auto_137524 ?auto_137530 ) ) ( not ( = ?auto_137524 ?auto_137528 ) ) ( not ( = ?auto_137524 ?auto_137532 ) ) ( not ( = ?auto_137525 ?auto_137530 ) ) ( not ( = ?auto_137525 ?auto_137528 ) ) ( not ( = ?auto_137525 ?auto_137532 ) ) ( not ( = ?auto_137526 ?auto_137530 ) ) ( not ( = ?auto_137526 ?auto_137528 ) ) ( not ( = ?auto_137526 ?auto_137532 ) ) ( not ( = ?auto_137531 ?auto_137530 ) ) ( not ( = ?auto_137531 ?auto_137528 ) ) ( not ( = ?auto_137531 ?auto_137532 ) ) ( not ( = ?auto_137527 ?auto_137530 ) ) ( not ( = ?auto_137527 ?auto_137528 ) ) ( not ( = ?auto_137527 ?auto_137532 ) ) ( ON ?auto_137529 ?auto_137527 ) ( CLEAR ?auto_137529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137524 ?auto_137525 ?auto_137526 ?auto_137531 ?auto_137527 )
      ( MAKE-3PILE ?auto_137524 ?auto_137525 ?auto_137526 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137533 - BLOCK
      ?auto_137534 - BLOCK
      ?auto_137535 - BLOCK
    )
    :vars
    (
      ?auto_137539 - BLOCK
      ?auto_137541 - BLOCK
      ?auto_137538 - BLOCK
      ?auto_137536 - BLOCK
      ?auto_137537 - BLOCK
      ?auto_137540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137539 ?auto_137535 ) ( ON-TABLE ?auto_137533 ) ( ON ?auto_137534 ?auto_137533 ) ( ON ?auto_137535 ?auto_137534 ) ( not ( = ?auto_137533 ?auto_137534 ) ) ( not ( = ?auto_137533 ?auto_137535 ) ) ( not ( = ?auto_137533 ?auto_137539 ) ) ( not ( = ?auto_137534 ?auto_137535 ) ) ( not ( = ?auto_137534 ?auto_137539 ) ) ( not ( = ?auto_137535 ?auto_137539 ) ) ( not ( = ?auto_137533 ?auto_137541 ) ) ( not ( = ?auto_137533 ?auto_137538 ) ) ( not ( = ?auto_137534 ?auto_137541 ) ) ( not ( = ?auto_137534 ?auto_137538 ) ) ( not ( = ?auto_137535 ?auto_137541 ) ) ( not ( = ?auto_137535 ?auto_137538 ) ) ( not ( = ?auto_137539 ?auto_137541 ) ) ( not ( = ?auto_137539 ?auto_137538 ) ) ( not ( = ?auto_137541 ?auto_137538 ) ) ( ON ?auto_137541 ?auto_137539 ) ( ON-TABLE ?auto_137536 ) ( ON ?auto_137537 ?auto_137536 ) ( not ( = ?auto_137536 ?auto_137537 ) ) ( not ( = ?auto_137536 ?auto_137540 ) ) ( not ( = ?auto_137536 ?auto_137538 ) ) ( not ( = ?auto_137537 ?auto_137540 ) ) ( not ( = ?auto_137537 ?auto_137538 ) ) ( not ( = ?auto_137540 ?auto_137538 ) ) ( not ( = ?auto_137533 ?auto_137540 ) ) ( not ( = ?auto_137533 ?auto_137536 ) ) ( not ( = ?auto_137533 ?auto_137537 ) ) ( not ( = ?auto_137534 ?auto_137540 ) ) ( not ( = ?auto_137534 ?auto_137536 ) ) ( not ( = ?auto_137534 ?auto_137537 ) ) ( not ( = ?auto_137535 ?auto_137540 ) ) ( not ( = ?auto_137535 ?auto_137536 ) ) ( not ( = ?auto_137535 ?auto_137537 ) ) ( not ( = ?auto_137539 ?auto_137540 ) ) ( not ( = ?auto_137539 ?auto_137536 ) ) ( not ( = ?auto_137539 ?auto_137537 ) ) ( not ( = ?auto_137541 ?auto_137540 ) ) ( not ( = ?auto_137541 ?auto_137536 ) ) ( not ( = ?auto_137541 ?auto_137537 ) ) ( ON ?auto_137538 ?auto_137541 ) ( CLEAR ?auto_137538 ) ( HOLDING ?auto_137540 ) ( CLEAR ?auto_137537 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137536 ?auto_137537 ?auto_137540 )
      ( MAKE-3PILE ?auto_137533 ?auto_137534 ?auto_137535 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137542 - BLOCK
      ?auto_137543 - BLOCK
      ?auto_137544 - BLOCK
    )
    :vars
    (
      ?auto_137549 - BLOCK
      ?auto_137546 - BLOCK
      ?auto_137547 - BLOCK
      ?auto_137550 - BLOCK
      ?auto_137545 - BLOCK
      ?auto_137548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137549 ?auto_137544 ) ( ON-TABLE ?auto_137542 ) ( ON ?auto_137543 ?auto_137542 ) ( ON ?auto_137544 ?auto_137543 ) ( not ( = ?auto_137542 ?auto_137543 ) ) ( not ( = ?auto_137542 ?auto_137544 ) ) ( not ( = ?auto_137542 ?auto_137549 ) ) ( not ( = ?auto_137543 ?auto_137544 ) ) ( not ( = ?auto_137543 ?auto_137549 ) ) ( not ( = ?auto_137544 ?auto_137549 ) ) ( not ( = ?auto_137542 ?auto_137546 ) ) ( not ( = ?auto_137542 ?auto_137547 ) ) ( not ( = ?auto_137543 ?auto_137546 ) ) ( not ( = ?auto_137543 ?auto_137547 ) ) ( not ( = ?auto_137544 ?auto_137546 ) ) ( not ( = ?auto_137544 ?auto_137547 ) ) ( not ( = ?auto_137549 ?auto_137546 ) ) ( not ( = ?auto_137549 ?auto_137547 ) ) ( not ( = ?auto_137546 ?auto_137547 ) ) ( ON ?auto_137546 ?auto_137549 ) ( ON-TABLE ?auto_137550 ) ( ON ?auto_137545 ?auto_137550 ) ( not ( = ?auto_137550 ?auto_137545 ) ) ( not ( = ?auto_137550 ?auto_137548 ) ) ( not ( = ?auto_137550 ?auto_137547 ) ) ( not ( = ?auto_137545 ?auto_137548 ) ) ( not ( = ?auto_137545 ?auto_137547 ) ) ( not ( = ?auto_137548 ?auto_137547 ) ) ( not ( = ?auto_137542 ?auto_137548 ) ) ( not ( = ?auto_137542 ?auto_137550 ) ) ( not ( = ?auto_137542 ?auto_137545 ) ) ( not ( = ?auto_137543 ?auto_137548 ) ) ( not ( = ?auto_137543 ?auto_137550 ) ) ( not ( = ?auto_137543 ?auto_137545 ) ) ( not ( = ?auto_137544 ?auto_137548 ) ) ( not ( = ?auto_137544 ?auto_137550 ) ) ( not ( = ?auto_137544 ?auto_137545 ) ) ( not ( = ?auto_137549 ?auto_137548 ) ) ( not ( = ?auto_137549 ?auto_137550 ) ) ( not ( = ?auto_137549 ?auto_137545 ) ) ( not ( = ?auto_137546 ?auto_137548 ) ) ( not ( = ?auto_137546 ?auto_137550 ) ) ( not ( = ?auto_137546 ?auto_137545 ) ) ( ON ?auto_137547 ?auto_137546 ) ( CLEAR ?auto_137545 ) ( ON ?auto_137548 ?auto_137547 ) ( CLEAR ?auto_137548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137542 ?auto_137543 ?auto_137544 ?auto_137549 ?auto_137546 ?auto_137547 )
      ( MAKE-3PILE ?auto_137542 ?auto_137543 ?auto_137544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137551 - BLOCK
      ?auto_137552 - BLOCK
      ?auto_137553 - BLOCK
    )
    :vars
    (
      ?auto_137554 - BLOCK
      ?auto_137557 - BLOCK
      ?auto_137555 - BLOCK
      ?auto_137559 - BLOCK
      ?auto_137556 - BLOCK
      ?auto_137558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137554 ?auto_137553 ) ( ON-TABLE ?auto_137551 ) ( ON ?auto_137552 ?auto_137551 ) ( ON ?auto_137553 ?auto_137552 ) ( not ( = ?auto_137551 ?auto_137552 ) ) ( not ( = ?auto_137551 ?auto_137553 ) ) ( not ( = ?auto_137551 ?auto_137554 ) ) ( not ( = ?auto_137552 ?auto_137553 ) ) ( not ( = ?auto_137552 ?auto_137554 ) ) ( not ( = ?auto_137553 ?auto_137554 ) ) ( not ( = ?auto_137551 ?auto_137557 ) ) ( not ( = ?auto_137551 ?auto_137555 ) ) ( not ( = ?auto_137552 ?auto_137557 ) ) ( not ( = ?auto_137552 ?auto_137555 ) ) ( not ( = ?auto_137553 ?auto_137557 ) ) ( not ( = ?auto_137553 ?auto_137555 ) ) ( not ( = ?auto_137554 ?auto_137557 ) ) ( not ( = ?auto_137554 ?auto_137555 ) ) ( not ( = ?auto_137557 ?auto_137555 ) ) ( ON ?auto_137557 ?auto_137554 ) ( ON-TABLE ?auto_137559 ) ( not ( = ?auto_137559 ?auto_137556 ) ) ( not ( = ?auto_137559 ?auto_137558 ) ) ( not ( = ?auto_137559 ?auto_137555 ) ) ( not ( = ?auto_137556 ?auto_137558 ) ) ( not ( = ?auto_137556 ?auto_137555 ) ) ( not ( = ?auto_137558 ?auto_137555 ) ) ( not ( = ?auto_137551 ?auto_137558 ) ) ( not ( = ?auto_137551 ?auto_137559 ) ) ( not ( = ?auto_137551 ?auto_137556 ) ) ( not ( = ?auto_137552 ?auto_137558 ) ) ( not ( = ?auto_137552 ?auto_137559 ) ) ( not ( = ?auto_137552 ?auto_137556 ) ) ( not ( = ?auto_137553 ?auto_137558 ) ) ( not ( = ?auto_137553 ?auto_137559 ) ) ( not ( = ?auto_137553 ?auto_137556 ) ) ( not ( = ?auto_137554 ?auto_137558 ) ) ( not ( = ?auto_137554 ?auto_137559 ) ) ( not ( = ?auto_137554 ?auto_137556 ) ) ( not ( = ?auto_137557 ?auto_137558 ) ) ( not ( = ?auto_137557 ?auto_137559 ) ) ( not ( = ?auto_137557 ?auto_137556 ) ) ( ON ?auto_137555 ?auto_137557 ) ( ON ?auto_137558 ?auto_137555 ) ( CLEAR ?auto_137558 ) ( HOLDING ?auto_137556 ) ( CLEAR ?auto_137559 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137559 ?auto_137556 )
      ( MAKE-3PILE ?auto_137551 ?auto_137552 ?auto_137553 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137560 - BLOCK
      ?auto_137561 - BLOCK
      ?auto_137562 - BLOCK
    )
    :vars
    (
      ?auto_137563 - BLOCK
      ?auto_137568 - BLOCK
      ?auto_137566 - BLOCK
      ?auto_137564 - BLOCK
      ?auto_137567 - BLOCK
      ?auto_137565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137563 ?auto_137562 ) ( ON-TABLE ?auto_137560 ) ( ON ?auto_137561 ?auto_137560 ) ( ON ?auto_137562 ?auto_137561 ) ( not ( = ?auto_137560 ?auto_137561 ) ) ( not ( = ?auto_137560 ?auto_137562 ) ) ( not ( = ?auto_137560 ?auto_137563 ) ) ( not ( = ?auto_137561 ?auto_137562 ) ) ( not ( = ?auto_137561 ?auto_137563 ) ) ( not ( = ?auto_137562 ?auto_137563 ) ) ( not ( = ?auto_137560 ?auto_137568 ) ) ( not ( = ?auto_137560 ?auto_137566 ) ) ( not ( = ?auto_137561 ?auto_137568 ) ) ( not ( = ?auto_137561 ?auto_137566 ) ) ( not ( = ?auto_137562 ?auto_137568 ) ) ( not ( = ?auto_137562 ?auto_137566 ) ) ( not ( = ?auto_137563 ?auto_137568 ) ) ( not ( = ?auto_137563 ?auto_137566 ) ) ( not ( = ?auto_137568 ?auto_137566 ) ) ( ON ?auto_137568 ?auto_137563 ) ( ON-TABLE ?auto_137564 ) ( not ( = ?auto_137564 ?auto_137567 ) ) ( not ( = ?auto_137564 ?auto_137565 ) ) ( not ( = ?auto_137564 ?auto_137566 ) ) ( not ( = ?auto_137567 ?auto_137565 ) ) ( not ( = ?auto_137567 ?auto_137566 ) ) ( not ( = ?auto_137565 ?auto_137566 ) ) ( not ( = ?auto_137560 ?auto_137565 ) ) ( not ( = ?auto_137560 ?auto_137564 ) ) ( not ( = ?auto_137560 ?auto_137567 ) ) ( not ( = ?auto_137561 ?auto_137565 ) ) ( not ( = ?auto_137561 ?auto_137564 ) ) ( not ( = ?auto_137561 ?auto_137567 ) ) ( not ( = ?auto_137562 ?auto_137565 ) ) ( not ( = ?auto_137562 ?auto_137564 ) ) ( not ( = ?auto_137562 ?auto_137567 ) ) ( not ( = ?auto_137563 ?auto_137565 ) ) ( not ( = ?auto_137563 ?auto_137564 ) ) ( not ( = ?auto_137563 ?auto_137567 ) ) ( not ( = ?auto_137568 ?auto_137565 ) ) ( not ( = ?auto_137568 ?auto_137564 ) ) ( not ( = ?auto_137568 ?auto_137567 ) ) ( ON ?auto_137566 ?auto_137568 ) ( ON ?auto_137565 ?auto_137566 ) ( CLEAR ?auto_137564 ) ( ON ?auto_137567 ?auto_137565 ) ( CLEAR ?auto_137567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137560 ?auto_137561 ?auto_137562 ?auto_137563 ?auto_137568 ?auto_137566 ?auto_137565 )
      ( MAKE-3PILE ?auto_137560 ?auto_137561 ?auto_137562 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137569 - BLOCK
      ?auto_137570 - BLOCK
      ?auto_137571 - BLOCK
    )
    :vars
    (
      ?auto_137577 - BLOCK
      ?auto_137573 - BLOCK
      ?auto_137574 - BLOCK
      ?auto_137575 - BLOCK
      ?auto_137576 - BLOCK
      ?auto_137572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137577 ?auto_137571 ) ( ON-TABLE ?auto_137569 ) ( ON ?auto_137570 ?auto_137569 ) ( ON ?auto_137571 ?auto_137570 ) ( not ( = ?auto_137569 ?auto_137570 ) ) ( not ( = ?auto_137569 ?auto_137571 ) ) ( not ( = ?auto_137569 ?auto_137577 ) ) ( not ( = ?auto_137570 ?auto_137571 ) ) ( not ( = ?auto_137570 ?auto_137577 ) ) ( not ( = ?auto_137571 ?auto_137577 ) ) ( not ( = ?auto_137569 ?auto_137573 ) ) ( not ( = ?auto_137569 ?auto_137574 ) ) ( not ( = ?auto_137570 ?auto_137573 ) ) ( not ( = ?auto_137570 ?auto_137574 ) ) ( not ( = ?auto_137571 ?auto_137573 ) ) ( not ( = ?auto_137571 ?auto_137574 ) ) ( not ( = ?auto_137577 ?auto_137573 ) ) ( not ( = ?auto_137577 ?auto_137574 ) ) ( not ( = ?auto_137573 ?auto_137574 ) ) ( ON ?auto_137573 ?auto_137577 ) ( not ( = ?auto_137575 ?auto_137576 ) ) ( not ( = ?auto_137575 ?auto_137572 ) ) ( not ( = ?auto_137575 ?auto_137574 ) ) ( not ( = ?auto_137576 ?auto_137572 ) ) ( not ( = ?auto_137576 ?auto_137574 ) ) ( not ( = ?auto_137572 ?auto_137574 ) ) ( not ( = ?auto_137569 ?auto_137572 ) ) ( not ( = ?auto_137569 ?auto_137575 ) ) ( not ( = ?auto_137569 ?auto_137576 ) ) ( not ( = ?auto_137570 ?auto_137572 ) ) ( not ( = ?auto_137570 ?auto_137575 ) ) ( not ( = ?auto_137570 ?auto_137576 ) ) ( not ( = ?auto_137571 ?auto_137572 ) ) ( not ( = ?auto_137571 ?auto_137575 ) ) ( not ( = ?auto_137571 ?auto_137576 ) ) ( not ( = ?auto_137577 ?auto_137572 ) ) ( not ( = ?auto_137577 ?auto_137575 ) ) ( not ( = ?auto_137577 ?auto_137576 ) ) ( not ( = ?auto_137573 ?auto_137572 ) ) ( not ( = ?auto_137573 ?auto_137575 ) ) ( not ( = ?auto_137573 ?auto_137576 ) ) ( ON ?auto_137574 ?auto_137573 ) ( ON ?auto_137572 ?auto_137574 ) ( ON ?auto_137576 ?auto_137572 ) ( CLEAR ?auto_137576 ) ( HOLDING ?auto_137575 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137575 )
      ( MAKE-3PILE ?auto_137569 ?auto_137570 ?auto_137571 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_137578 - BLOCK
      ?auto_137579 - BLOCK
      ?auto_137580 - BLOCK
    )
    :vars
    (
      ?auto_137584 - BLOCK
      ?auto_137582 - BLOCK
      ?auto_137581 - BLOCK
      ?auto_137585 - BLOCK
      ?auto_137583 - BLOCK
      ?auto_137586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137584 ?auto_137580 ) ( ON-TABLE ?auto_137578 ) ( ON ?auto_137579 ?auto_137578 ) ( ON ?auto_137580 ?auto_137579 ) ( not ( = ?auto_137578 ?auto_137579 ) ) ( not ( = ?auto_137578 ?auto_137580 ) ) ( not ( = ?auto_137578 ?auto_137584 ) ) ( not ( = ?auto_137579 ?auto_137580 ) ) ( not ( = ?auto_137579 ?auto_137584 ) ) ( not ( = ?auto_137580 ?auto_137584 ) ) ( not ( = ?auto_137578 ?auto_137582 ) ) ( not ( = ?auto_137578 ?auto_137581 ) ) ( not ( = ?auto_137579 ?auto_137582 ) ) ( not ( = ?auto_137579 ?auto_137581 ) ) ( not ( = ?auto_137580 ?auto_137582 ) ) ( not ( = ?auto_137580 ?auto_137581 ) ) ( not ( = ?auto_137584 ?auto_137582 ) ) ( not ( = ?auto_137584 ?auto_137581 ) ) ( not ( = ?auto_137582 ?auto_137581 ) ) ( ON ?auto_137582 ?auto_137584 ) ( not ( = ?auto_137585 ?auto_137583 ) ) ( not ( = ?auto_137585 ?auto_137586 ) ) ( not ( = ?auto_137585 ?auto_137581 ) ) ( not ( = ?auto_137583 ?auto_137586 ) ) ( not ( = ?auto_137583 ?auto_137581 ) ) ( not ( = ?auto_137586 ?auto_137581 ) ) ( not ( = ?auto_137578 ?auto_137586 ) ) ( not ( = ?auto_137578 ?auto_137585 ) ) ( not ( = ?auto_137578 ?auto_137583 ) ) ( not ( = ?auto_137579 ?auto_137586 ) ) ( not ( = ?auto_137579 ?auto_137585 ) ) ( not ( = ?auto_137579 ?auto_137583 ) ) ( not ( = ?auto_137580 ?auto_137586 ) ) ( not ( = ?auto_137580 ?auto_137585 ) ) ( not ( = ?auto_137580 ?auto_137583 ) ) ( not ( = ?auto_137584 ?auto_137586 ) ) ( not ( = ?auto_137584 ?auto_137585 ) ) ( not ( = ?auto_137584 ?auto_137583 ) ) ( not ( = ?auto_137582 ?auto_137586 ) ) ( not ( = ?auto_137582 ?auto_137585 ) ) ( not ( = ?auto_137582 ?auto_137583 ) ) ( ON ?auto_137581 ?auto_137582 ) ( ON ?auto_137586 ?auto_137581 ) ( ON ?auto_137583 ?auto_137586 ) ( ON ?auto_137585 ?auto_137583 ) ( CLEAR ?auto_137585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137578 ?auto_137579 ?auto_137580 ?auto_137584 ?auto_137582 ?auto_137581 ?auto_137586 ?auto_137583 )
      ( MAKE-3PILE ?auto_137578 ?auto_137579 ?auto_137580 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137593 - BLOCK
      ?auto_137594 - BLOCK
      ?auto_137595 - BLOCK
      ?auto_137596 - BLOCK
      ?auto_137597 - BLOCK
      ?auto_137598 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_137598 ) ( CLEAR ?auto_137597 ) ( ON-TABLE ?auto_137593 ) ( ON ?auto_137594 ?auto_137593 ) ( ON ?auto_137595 ?auto_137594 ) ( ON ?auto_137596 ?auto_137595 ) ( ON ?auto_137597 ?auto_137596 ) ( not ( = ?auto_137593 ?auto_137594 ) ) ( not ( = ?auto_137593 ?auto_137595 ) ) ( not ( = ?auto_137593 ?auto_137596 ) ) ( not ( = ?auto_137593 ?auto_137597 ) ) ( not ( = ?auto_137593 ?auto_137598 ) ) ( not ( = ?auto_137594 ?auto_137595 ) ) ( not ( = ?auto_137594 ?auto_137596 ) ) ( not ( = ?auto_137594 ?auto_137597 ) ) ( not ( = ?auto_137594 ?auto_137598 ) ) ( not ( = ?auto_137595 ?auto_137596 ) ) ( not ( = ?auto_137595 ?auto_137597 ) ) ( not ( = ?auto_137595 ?auto_137598 ) ) ( not ( = ?auto_137596 ?auto_137597 ) ) ( not ( = ?auto_137596 ?auto_137598 ) ) ( not ( = ?auto_137597 ?auto_137598 ) ) )
    :subtasks
    ( ( !STACK ?auto_137598 ?auto_137597 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137599 - BLOCK
      ?auto_137600 - BLOCK
      ?auto_137601 - BLOCK
      ?auto_137602 - BLOCK
      ?auto_137603 - BLOCK
      ?auto_137604 - BLOCK
    )
    :vars
    (
      ?auto_137605 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137603 ) ( ON-TABLE ?auto_137599 ) ( ON ?auto_137600 ?auto_137599 ) ( ON ?auto_137601 ?auto_137600 ) ( ON ?auto_137602 ?auto_137601 ) ( ON ?auto_137603 ?auto_137602 ) ( not ( = ?auto_137599 ?auto_137600 ) ) ( not ( = ?auto_137599 ?auto_137601 ) ) ( not ( = ?auto_137599 ?auto_137602 ) ) ( not ( = ?auto_137599 ?auto_137603 ) ) ( not ( = ?auto_137599 ?auto_137604 ) ) ( not ( = ?auto_137600 ?auto_137601 ) ) ( not ( = ?auto_137600 ?auto_137602 ) ) ( not ( = ?auto_137600 ?auto_137603 ) ) ( not ( = ?auto_137600 ?auto_137604 ) ) ( not ( = ?auto_137601 ?auto_137602 ) ) ( not ( = ?auto_137601 ?auto_137603 ) ) ( not ( = ?auto_137601 ?auto_137604 ) ) ( not ( = ?auto_137602 ?auto_137603 ) ) ( not ( = ?auto_137602 ?auto_137604 ) ) ( not ( = ?auto_137603 ?auto_137604 ) ) ( ON ?auto_137604 ?auto_137605 ) ( CLEAR ?auto_137604 ) ( HAND-EMPTY ) ( not ( = ?auto_137599 ?auto_137605 ) ) ( not ( = ?auto_137600 ?auto_137605 ) ) ( not ( = ?auto_137601 ?auto_137605 ) ) ( not ( = ?auto_137602 ?auto_137605 ) ) ( not ( = ?auto_137603 ?auto_137605 ) ) ( not ( = ?auto_137604 ?auto_137605 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137604 ?auto_137605 )
      ( MAKE-6PILE ?auto_137599 ?auto_137600 ?auto_137601 ?auto_137602 ?auto_137603 ?auto_137604 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137606 - BLOCK
      ?auto_137607 - BLOCK
      ?auto_137608 - BLOCK
      ?auto_137609 - BLOCK
      ?auto_137610 - BLOCK
      ?auto_137611 - BLOCK
    )
    :vars
    (
      ?auto_137612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137606 ) ( ON ?auto_137607 ?auto_137606 ) ( ON ?auto_137608 ?auto_137607 ) ( ON ?auto_137609 ?auto_137608 ) ( not ( = ?auto_137606 ?auto_137607 ) ) ( not ( = ?auto_137606 ?auto_137608 ) ) ( not ( = ?auto_137606 ?auto_137609 ) ) ( not ( = ?auto_137606 ?auto_137610 ) ) ( not ( = ?auto_137606 ?auto_137611 ) ) ( not ( = ?auto_137607 ?auto_137608 ) ) ( not ( = ?auto_137607 ?auto_137609 ) ) ( not ( = ?auto_137607 ?auto_137610 ) ) ( not ( = ?auto_137607 ?auto_137611 ) ) ( not ( = ?auto_137608 ?auto_137609 ) ) ( not ( = ?auto_137608 ?auto_137610 ) ) ( not ( = ?auto_137608 ?auto_137611 ) ) ( not ( = ?auto_137609 ?auto_137610 ) ) ( not ( = ?auto_137609 ?auto_137611 ) ) ( not ( = ?auto_137610 ?auto_137611 ) ) ( ON ?auto_137611 ?auto_137612 ) ( CLEAR ?auto_137611 ) ( not ( = ?auto_137606 ?auto_137612 ) ) ( not ( = ?auto_137607 ?auto_137612 ) ) ( not ( = ?auto_137608 ?auto_137612 ) ) ( not ( = ?auto_137609 ?auto_137612 ) ) ( not ( = ?auto_137610 ?auto_137612 ) ) ( not ( = ?auto_137611 ?auto_137612 ) ) ( HOLDING ?auto_137610 ) ( CLEAR ?auto_137609 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137606 ?auto_137607 ?auto_137608 ?auto_137609 ?auto_137610 )
      ( MAKE-6PILE ?auto_137606 ?auto_137607 ?auto_137608 ?auto_137609 ?auto_137610 ?auto_137611 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137613 - BLOCK
      ?auto_137614 - BLOCK
      ?auto_137615 - BLOCK
      ?auto_137616 - BLOCK
      ?auto_137617 - BLOCK
      ?auto_137618 - BLOCK
    )
    :vars
    (
      ?auto_137619 - BLOCK
      ?auto_137620 - BLOCK
      ?auto_137621 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137613 ) ( ON ?auto_137614 ?auto_137613 ) ( ON ?auto_137615 ?auto_137614 ) ( ON ?auto_137616 ?auto_137615 ) ( not ( = ?auto_137613 ?auto_137614 ) ) ( not ( = ?auto_137613 ?auto_137615 ) ) ( not ( = ?auto_137613 ?auto_137616 ) ) ( not ( = ?auto_137613 ?auto_137617 ) ) ( not ( = ?auto_137613 ?auto_137618 ) ) ( not ( = ?auto_137614 ?auto_137615 ) ) ( not ( = ?auto_137614 ?auto_137616 ) ) ( not ( = ?auto_137614 ?auto_137617 ) ) ( not ( = ?auto_137614 ?auto_137618 ) ) ( not ( = ?auto_137615 ?auto_137616 ) ) ( not ( = ?auto_137615 ?auto_137617 ) ) ( not ( = ?auto_137615 ?auto_137618 ) ) ( not ( = ?auto_137616 ?auto_137617 ) ) ( not ( = ?auto_137616 ?auto_137618 ) ) ( not ( = ?auto_137617 ?auto_137618 ) ) ( ON ?auto_137618 ?auto_137619 ) ( not ( = ?auto_137613 ?auto_137619 ) ) ( not ( = ?auto_137614 ?auto_137619 ) ) ( not ( = ?auto_137615 ?auto_137619 ) ) ( not ( = ?auto_137616 ?auto_137619 ) ) ( not ( = ?auto_137617 ?auto_137619 ) ) ( not ( = ?auto_137618 ?auto_137619 ) ) ( CLEAR ?auto_137616 ) ( ON ?auto_137617 ?auto_137618 ) ( CLEAR ?auto_137617 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137620 ) ( ON ?auto_137621 ?auto_137620 ) ( ON ?auto_137619 ?auto_137621 ) ( not ( = ?auto_137620 ?auto_137621 ) ) ( not ( = ?auto_137620 ?auto_137619 ) ) ( not ( = ?auto_137620 ?auto_137618 ) ) ( not ( = ?auto_137620 ?auto_137617 ) ) ( not ( = ?auto_137621 ?auto_137619 ) ) ( not ( = ?auto_137621 ?auto_137618 ) ) ( not ( = ?auto_137621 ?auto_137617 ) ) ( not ( = ?auto_137613 ?auto_137620 ) ) ( not ( = ?auto_137613 ?auto_137621 ) ) ( not ( = ?auto_137614 ?auto_137620 ) ) ( not ( = ?auto_137614 ?auto_137621 ) ) ( not ( = ?auto_137615 ?auto_137620 ) ) ( not ( = ?auto_137615 ?auto_137621 ) ) ( not ( = ?auto_137616 ?auto_137620 ) ) ( not ( = ?auto_137616 ?auto_137621 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137620 ?auto_137621 ?auto_137619 ?auto_137618 )
      ( MAKE-6PILE ?auto_137613 ?auto_137614 ?auto_137615 ?auto_137616 ?auto_137617 ?auto_137618 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137622 - BLOCK
      ?auto_137623 - BLOCK
      ?auto_137624 - BLOCK
      ?auto_137625 - BLOCK
      ?auto_137626 - BLOCK
      ?auto_137627 - BLOCK
    )
    :vars
    (
      ?auto_137629 - BLOCK
      ?auto_137630 - BLOCK
      ?auto_137628 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137622 ) ( ON ?auto_137623 ?auto_137622 ) ( ON ?auto_137624 ?auto_137623 ) ( not ( = ?auto_137622 ?auto_137623 ) ) ( not ( = ?auto_137622 ?auto_137624 ) ) ( not ( = ?auto_137622 ?auto_137625 ) ) ( not ( = ?auto_137622 ?auto_137626 ) ) ( not ( = ?auto_137622 ?auto_137627 ) ) ( not ( = ?auto_137623 ?auto_137624 ) ) ( not ( = ?auto_137623 ?auto_137625 ) ) ( not ( = ?auto_137623 ?auto_137626 ) ) ( not ( = ?auto_137623 ?auto_137627 ) ) ( not ( = ?auto_137624 ?auto_137625 ) ) ( not ( = ?auto_137624 ?auto_137626 ) ) ( not ( = ?auto_137624 ?auto_137627 ) ) ( not ( = ?auto_137625 ?auto_137626 ) ) ( not ( = ?auto_137625 ?auto_137627 ) ) ( not ( = ?auto_137626 ?auto_137627 ) ) ( ON ?auto_137627 ?auto_137629 ) ( not ( = ?auto_137622 ?auto_137629 ) ) ( not ( = ?auto_137623 ?auto_137629 ) ) ( not ( = ?auto_137624 ?auto_137629 ) ) ( not ( = ?auto_137625 ?auto_137629 ) ) ( not ( = ?auto_137626 ?auto_137629 ) ) ( not ( = ?auto_137627 ?auto_137629 ) ) ( ON ?auto_137626 ?auto_137627 ) ( CLEAR ?auto_137626 ) ( ON-TABLE ?auto_137630 ) ( ON ?auto_137628 ?auto_137630 ) ( ON ?auto_137629 ?auto_137628 ) ( not ( = ?auto_137630 ?auto_137628 ) ) ( not ( = ?auto_137630 ?auto_137629 ) ) ( not ( = ?auto_137630 ?auto_137627 ) ) ( not ( = ?auto_137630 ?auto_137626 ) ) ( not ( = ?auto_137628 ?auto_137629 ) ) ( not ( = ?auto_137628 ?auto_137627 ) ) ( not ( = ?auto_137628 ?auto_137626 ) ) ( not ( = ?auto_137622 ?auto_137630 ) ) ( not ( = ?auto_137622 ?auto_137628 ) ) ( not ( = ?auto_137623 ?auto_137630 ) ) ( not ( = ?auto_137623 ?auto_137628 ) ) ( not ( = ?auto_137624 ?auto_137630 ) ) ( not ( = ?auto_137624 ?auto_137628 ) ) ( not ( = ?auto_137625 ?auto_137630 ) ) ( not ( = ?auto_137625 ?auto_137628 ) ) ( HOLDING ?auto_137625 ) ( CLEAR ?auto_137624 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137622 ?auto_137623 ?auto_137624 ?auto_137625 )
      ( MAKE-6PILE ?auto_137622 ?auto_137623 ?auto_137624 ?auto_137625 ?auto_137626 ?auto_137627 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137631 - BLOCK
      ?auto_137632 - BLOCK
      ?auto_137633 - BLOCK
      ?auto_137634 - BLOCK
      ?auto_137635 - BLOCK
      ?auto_137636 - BLOCK
    )
    :vars
    (
      ?auto_137637 - BLOCK
      ?auto_137639 - BLOCK
      ?auto_137638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137631 ) ( ON ?auto_137632 ?auto_137631 ) ( ON ?auto_137633 ?auto_137632 ) ( not ( = ?auto_137631 ?auto_137632 ) ) ( not ( = ?auto_137631 ?auto_137633 ) ) ( not ( = ?auto_137631 ?auto_137634 ) ) ( not ( = ?auto_137631 ?auto_137635 ) ) ( not ( = ?auto_137631 ?auto_137636 ) ) ( not ( = ?auto_137632 ?auto_137633 ) ) ( not ( = ?auto_137632 ?auto_137634 ) ) ( not ( = ?auto_137632 ?auto_137635 ) ) ( not ( = ?auto_137632 ?auto_137636 ) ) ( not ( = ?auto_137633 ?auto_137634 ) ) ( not ( = ?auto_137633 ?auto_137635 ) ) ( not ( = ?auto_137633 ?auto_137636 ) ) ( not ( = ?auto_137634 ?auto_137635 ) ) ( not ( = ?auto_137634 ?auto_137636 ) ) ( not ( = ?auto_137635 ?auto_137636 ) ) ( ON ?auto_137636 ?auto_137637 ) ( not ( = ?auto_137631 ?auto_137637 ) ) ( not ( = ?auto_137632 ?auto_137637 ) ) ( not ( = ?auto_137633 ?auto_137637 ) ) ( not ( = ?auto_137634 ?auto_137637 ) ) ( not ( = ?auto_137635 ?auto_137637 ) ) ( not ( = ?auto_137636 ?auto_137637 ) ) ( ON ?auto_137635 ?auto_137636 ) ( ON-TABLE ?auto_137639 ) ( ON ?auto_137638 ?auto_137639 ) ( ON ?auto_137637 ?auto_137638 ) ( not ( = ?auto_137639 ?auto_137638 ) ) ( not ( = ?auto_137639 ?auto_137637 ) ) ( not ( = ?auto_137639 ?auto_137636 ) ) ( not ( = ?auto_137639 ?auto_137635 ) ) ( not ( = ?auto_137638 ?auto_137637 ) ) ( not ( = ?auto_137638 ?auto_137636 ) ) ( not ( = ?auto_137638 ?auto_137635 ) ) ( not ( = ?auto_137631 ?auto_137639 ) ) ( not ( = ?auto_137631 ?auto_137638 ) ) ( not ( = ?auto_137632 ?auto_137639 ) ) ( not ( = ?auto_137632 ?auto_137638 ) ) ( not ( = ?auto_137633 ?auto_137639 ) ) ( not ( = ?auto_137633 ?auto_137638 ) ) ( not ( = ?auto_137634 ?auto_137639 ) ) ( not ( = ?auto_137634 ?auto_137638 ) ) ( CLEAR ?auto_137633 ) ( ON ?auto_137634 ?auto_137635 ) ( CLEAR ?auto_137634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137639 ?auto_137638 ?auto_137637 ?auto_137636 ?auto_137635 )
      ( MAKE-6PILE ?auto_137631 ?auto_137632 ?auto_137633 ?auto_137634 ?auto_137635 ?auto_137636 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137640 - BLOCK
      ?auto_137641 - BLOCK
      ?auto_137642 - BLOCK
      ?auto_137643 - BLOCK
      ?auto_137644 - BLOCK
      ?auto_137645 - BLOCK
    )
    :vars
    (
      ?auto_137646 - BLOCK
      ?auto_137648 - BLOCK
      ?auto_137647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137640 ) ( ON ?auto_137641 ?auto_137640 ) ( not ( = ?auto_137640 ?auto_137641 ) ) ( not ( = ?auto_137640 ?auto_137642 ) ) ( not ( = ?auto_137640 ?auto_137643 ) ) ( not ( = ?auto_137640 ?auto_137644 ) ) ( not ( = ?auto_137640 ?auto_137645 ) ) ( not ( = ?auto_137641 ?auto_137642 ) ) ( not ( = ?auto_137641 ?auto_137643 ) ) ( not ( = ?auto_137641 ?auto_137644 ) ) ( not ( = ?auto_137641 ?auto_137645 ) ) ( not ( = ?auto_137642 ?auto_137643 ) ) ( not ( = ?auto_137642 ?auto_137644 ) ) ( not ( = ?auto_137642 ?auto_137645 ) ) ( not ( = ?auto_137643 ?auto_137644 ) ) ( not ( = ?auto_137643 ?auto_137645 ) ) ( not ( = ?auto_137644 ?auto_137645 ) ) ( ON ?auto_137645 ?auto_137646 ) ( not ( = ?auto_137640 ?auto_137646 ) ) ( not ( = ?auto_137641 ?auto_137646 ) ) ( not ( = ?auto_137642 ?auto_137646 ) ) ( not ( = ?auto_137643 ?auto_137646 ) ) ( not ( = ?auto_137644 ?auto_137646 ) ) ( not ( = ?auto_137645 ?auto_137646 ) ) ( ON ?auto_137644 ?auto_137645 ) ( ON-TABLE ?auto_137648 ) ( ON ?auto_137647 ?auto_137648 ) ( ON ?auto_137646 ?auto_137647 ) ( not ( = ?auto_137648 ?auto_137647 ) ) ( not ( = ?auto_137648 ?auto_137646 ) ) ( not ( = ?auto_137648 ?auto_137645 ) ) ( not ( = ?auto_137648 ?auto_137644 ) ) ( not ( = ?auto_137647 ?auto_137646 ) ) ( not ( = ?auto_137647 ?auto_137645 ) ) ( not ( = ?auto_137647 ?auto_137644 ) ) ( not ( = ?auto_137640 ?auto_137648 ) ) ( not ( = ?auto_137640 ?auto_137647 ) ) ( not ( = ?auto_137641 ?auto_137648 ) ) ( not ( = ?auto_137641 ?auto_137647 ) ) ( not ( = ?auto_137642 ?auto_137648 ) ) ( not ( = ?auto_137642 ?auto_137647 ) ) ( not ( = ?auto_137643 ?auto_137648 ) ) ( not ( = ?auto_137643 ?auto_137647 ) ) ( ON ?auto_137643 ?auto_137644 ) ( CLEAR ?auto_137643 ) ( HOLDING ?auto_137642 ) ( CLEAR ?auto_137641 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137640 ?auto_137641 ?auto_137642 )
      ( MAKE-6PILE ?auto_137640 ?auto_137641 ?auto_137642 ?auto_137643 ?auto_137644 ?auto_137645 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137649 - BLOCK
      ?auto_137650 - BLOCK
      ?auto_137651 - BLOCK
      ?auto_137652 - BLOCK
      ?auto_137653 - BLOCK
      ?auto_137654 - BLOCK
    )
    :vars
    (
      ?auto_137656 - BLOCK
      ?auto_137655 - BLOCK
      ?auto_137657 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137649 ) ( ON ?auto_137650 ?auto_137649 ) ( not ( = ?auto_137649 ?auto_137650 ) ) ( not ( = ?auto_137649 ?auto_137651 ) ) ( not ( = ?auto_137649 ?auto_137652 ) ) ( not ( = ?auto_137649 ?auto_137653 ) ) ( not ( = ?auto_137649 ?auto_137654 ) ) ( not ( = ?auto_137650 ?auto_137651 ) ) ( not ( = ?auto_137650 ?auto_137652 ) ) ( not ( = ?auto_137650 ?auto_137653 ) ) ( not ( = ?auto_137650 ?auto_137654 ) ) ( not ( = ?auto_137651 ?auto_137652 ) ) ( not ( = ?auto_137651 ?auto_137653 ) ) ( not ( = ?auto_137651 ?auto_137654 ) ) ( not ( = ?auto_137652 ?auto_137653 ) ) ( not ( = ?auto_137652 ?auto_137654 ) ) ( not ( = ?auto_137653 ?auto_137654 ) ) ( ON ?auto_137654 ?auto_137656 ) ( not ( = ?auto_137649 ?auto_137656 ) ) ( not ( = ?auto_137650 ?auto_137656 ) ) ( not ( = ?auto_137651 ?auto_137656 ) ) ( not ( = ?auto_137652 ?auto_137656 ) ) ( not ( = ?auto_137653 ?auto_137656 ) ) ( not ( = ?auto_137654 ?auto_137656 ) ) ( ON ?auto_137653 ?auto_137654 ) ( ON-TABLE ?auto_137655 ) ( ON ?auto_137657 ?auto_137655 ) ( ON ?auto_137656 ?auto_137657 ) ( not ( = ?auto_137655 ?auto_137657 ) ) ( not ( = ?auto_137655 ?auto_137656 ) ) ( not ( = ?auto_137655 ?auto_137654 ) ) ( not ( = ?auto_137655 ?auto_137653 ) ) ( not ( = ?auto_137657 ?auto_137656 ) ) ( not ( = ?auto_137657 ?auto_137654 ) ) ( not ( = ?auto_137657 ?auto_137653 ) ) ( not ( = ?auto_137649 ?auto_137655 ) ) ( not ( = ?auto_137649 ?auto_137657 ) ) ( not ( = ?auto_137650 ?auto_137655 ) ) ( not ( = ?auto_137650 ?auto_137657 ) ) ( not ( = ?auto_137651 ?auto_137655 ) ) ( not ( = ?auto_137651 ?auto_137657 ) ) ( not ( = ?auto_137652 ?auto_137655 ) ) ( not ( = ?auto_137652 ?auto_137657 ) ) ( ON ?auto_137652 ?auto_137653 ) ( CLEAR ?auto_137650 ) ( ON ?auto_137651 ?auto_137652 ) ( CLEAR ?auto_137651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137655 ?auto_137657 ?auto_137656 ?auto_137654 ?auto_137653 ?auto_137652 )
      ( MAKE-6PILE ?auto_137649 ?auto_137650 ?auto_137651 ?auto_137652 ?auto_137653 ?auto_137654 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137658 - BLOCK
      ?auto_137659 - BLOCK
      ?auto_137660 - BLOCK
      ?auto_137661 - BLOCK
      ?auto_137662 - BLOCK
      ?auto_137663 - BLOCK
    )
    :vars
    (
      ?auto_137665 - BLOCK
      ?auto_137664 - BLOCK
      ?auto_137666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137658 ) ( not ( = ?auto_137658 ?auto_137659 ) ) ( not ( = ?auto_137658 ?auto_137660 ) ) ( not ( = ?auto_137658 ?auto_137661 ) ) ( not ( = ?auto_137658 ?auto_137662 ) ) ( not ( = ?auto_137658 ?auto_137663 ) ) ( not ( = ?auto_137659 ?auto_137660 ) ) ( not ( = ?auto_137659 ?auto_137661 ) ) ( not ( = ?auto_137659 ?auto_137662 ) ) ( not ( = ?auto_137659 ?auto_137663 ) ) ( not ( = ?auto_137660 ?auto_137661 ) ) ( not ( = ?auto_137660 ?auto_137662 ) ) ( not ( = ?auto_137660 ?auto_137663 ) ) ( not ( = ?auto_137661 ?auto_137662 ) ) ( not ( = ?auto_137661 ?auto_137663 ) ) ( not ( = ?auto_137662 ?auto_137663 ) ) ( ON ?auto_137663 ?auto_137665 ) ( not ( = ?auto_137658 ?auto_137665 ) ) ( not ( = ?auto_137659 ?auto_137665 ) ) ( not ( = ?auto_137660 ?auto_137665 ) ) ( not ( = ?auto_137661 ?auto_137665 ) ) ( not ( = ?auto_137662 ?auto_137665 ) ) ( not ( = ?auto_137663 ?auto_137665 ) ) ( ON ?auto_137662 ?auto_137663 ) ( ON-TABLE ?auto_137664 ) ( ON ?auto_137666 ?auto_137664 ) ( ON ?auto_137665 ?auto_137666 ) ( not ( = ?auto_137664 ?auto_137666 ) ) ( not ( = ?auto_137664 ?auto_137665 ) ) ( not ( = ?auto_137664 ?auto_137663 ) ) ( not ( = ?auto_137664 ?auto_137662 ) ) ( not ( = ?auto_137666 ?auto_137665 ) ) ( not ( = ?auto_137666 ?auto_137663 ) ) ( not ( = ?auto_137666 ?auto_137662 ) ) ( not ( = ?auto_137658 ?auto_137664 ) ) ( not ( = ?auto_137658 ?auto_137666 ) ) ( not ( = ?auto_137659 ?auto_137664 ) ) ( not ( = ?auto_137659 ?auto_137666 ) ) ( not ( = ?auto_137660 ?auto_137664 ) ) ( not ( = ?auto_137660 ?auto_137666 ) ) ( not ( = ?auto_137661 ?auto_137664 ) ) ( not ( = ?auto_137661 ?auto_137666 ) ) ( ON ?auto_137661 ?auto_137662 ) ( ON ?auto_137660 ?auto_137661 ) ( CLEAR ?auto_137660 ) ( HOLDING ?auto_137659 ) ( CLEAR ?auto_137658 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137658 ?auto_137659 )
      ( MAKE-6PILE ?auto_137658 ?auto_137659 ?auto_137660 ?auto_137661 ?auto_137662 ?auto_137663 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137667 - BLOCK
      ?auto_137668 - BLOCK
      ?auto_137669 - BLOCK
      ?auto_137670 - BLOCK
      ?auto_137671 - BLOCK
      ?auto_137672 - BLOCK
    )
    :vars
    (
      ?auto_137675 - BLOCK
      ?auto_137673 - BLOCK
      ?auto_137674 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137667 ) ( not ( = ?auto_137667 ?auto_137668 ) ) ( not ( = ?auto_137667 ?auto_137669 ) ) ( not ( = ?auto_137667 ?auto_137670 ) ) ( not ( = ?auto_137667 ?auto_137671 ) ) ( not ( = ?auto_137667 ?auto_137672 ) ) ( not ( = ?auto_137668 ?auto_137669 ) ) ( not ( = ?auto_137668 ?auto_137670 ) ) ( not ( = ?auto_137668 ?auto_137671 ) ) ( not ( = ?auto_137668 ?auto_137672 ) ) ( not ( = ?auto_137669 ?auto_137670 ) ) ( not ( = ?auto_137669 ?auto_137671 ) ) ( not ( = ?auto_137669 ?auto_137672 ) ) ( not ( = ?auto_137670 ?auto_137671 ) ) ( not ( = ?auto_137670 ?auto_137672 ) ) ( not ( = ?auto_137671 ?auto_137672 ) ) ( ON ?auto_137672 ?auto_137675 ) ( not ( = ?auto_137667 ?auto_137675 ) ) ( not ( = ?auto_137668 ?auto_137675 ) ) ( not ( = ?auto_137669 ?auto_137675 ) ) ( not ( = ?auto_137670 ?auto_137675 ) ) ( not ( = ?auto_137671 ?auto_137675 ) ) ( not ( = ?auto_137672 ?auto_137675 ) ) ( ON ?auto_137671 ?auto_137672 ) ( ON-TABLE ?auto_137673 ) ( ON ?auto_137674 ?auto_137673 ) ( ON ?auto_137675 ?auto_137674 ) ( not ( = ?auto_137673 ?auto_137674 ) ) ( not ( = ?auto_137673 ?auto_137675 ) ) ( not ( = ?auto_137673 ?auto_137672 ) ) ( not ( = ?auto_137673 ?auto_137671 ) ) ( not ( = ?auto_137674 ?auto_137675 ) ) ( not ( = ?auto_137674 ?auto_137672 ) ) ( not ( = ?auto_137674 ?auto_137671 ) ) ( not ( = ?auto_137667 ?auto_137673 ) ) ( not ( = ?auto_137667 ?auto_137674 ) ) ( not ( = ?auto_137668 ?auto_137673 ) ) ( not ( = ?auto_137668 ?auto_137674 ) ) ( not ( = ?auto_137669 ?auto_137673 ) ) ( not ( = ?auto_137669 ?auto_137674 ) ) ( not ( = ?auto_137670 ?auto_137673 ) ) ( not ( = ?auto_137670 ?auto_137674 ) ) ( ON ?auto_137670 ?auto_137671 ) ( ON ?auto_137669 ?auto_137670 ) ( CLEAR ?auto_137667 ) ( ON ?auto_137668 ?auto_137669 ) ( CLEAR ?auto_137668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137673 ?auto_137674 ?auto_137675 ?auto_137672 ?auto_137671 ?auto_137670 ?auto_137669 )
      ( MAKE-6PILE ?auto_137667 ?auto_137668 ?auto_137669 ?auto_137670 ?auto_137671 ?auto_137672 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137676 - BLOCK
      ?auto_137677 - BLOCK
      ?auto_137678 - BLOCK
      ?auto_137679 - BLOCK
      ?auto_137680 - BLOCK
      ?auto_137681 - BLOCK
    )
    :vars
    (
      ?auto_137684 - BLOCK
      ?auto_137683 - BLOCK
      ?auto_137682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137676 ?auto_137677 ) ) ( not ( = ?auto_137676 ?auto_137678 ) ) ( not ( = ?auto_137676 ?auto_137679 ) ) ( not ( = ?auto_137676 ?auto_137680 ) ) ( not ( = ?auto_137676 ?auto_137681 ) ) ( not ( = ?auto_137677 ?auto_137678 ) ) ( not ( = ?auto_137677 ?auto_137679 ) ) ( not ( = ?auto_137677 ?auto_137680 ) ) ( not ( = ?auto_137677 ?auto_137681 ) ) ( not ( = ?auto_137678 ?auto_137679 ) ) ( not ( = ?auto_137678 ?auto_137680 ) ) ( not ( = ?auto_137678 ?auto_137681 ) ) ( not ( = ?auto_137679 ?auto_137680 ) ) ( not ( = ?auto_137679 ?auto_137681 ) ) ( not ( = ?auto_137680 ?auto_137681 ) ) ( ON ?auto_137681 ?auto_137684 ) ( not ( = ?auto_137676 ?auto_137684 ) ) ( not ( = ?auto_137677 ?auto_137684 ) ) ( not ( = ?auto_137678 ?auto_137684 ) ) ( not ( = ?auto_137679 ?auto_137684 ) ) ( not ( = ?auto_137680 ?auto_137684 ) ) ( not ( = ?auto_137681 ?auto_137684 ) ) ( ON ?auto_137680 ?auto_137681 ) ( ON-TABLE ?auto_137683 ) ( ON ?auto_137682 ?auto_137683 ) ( ON ?auto_137684 ?auto_137682 ) ( not ( = ?auto_137683 ?auto_137682 ) ) ( not ( = ?auto_137683 ?auto_137684 ) ) ( not ( = ?auto_137683 ?auto_137681 ) ) ( not ( = ?auto_137683 ?auto_137680 ) ) ( not ( = ?auto_137682 ?auto_137684 ) ) ( not ( = ?auto_137682 ?auto_137681 ) ) ( not ( = ?auto_137682 ?auto_137680 ) ) ( not ( = ?auto_137676 ?auto_137683 ) ) ( not ( = ?auto_137676 ?auto_137682 ) ) ( not ( = ?auto_137677 ?auto_137683 ) ) ( not ( = ?auto_137677 ?auto_137682 ) ) ( not ( = ?auto_137678 ?auto_137683 ) ) ( not ( = ?auto_137678 ?auto_137682 ) ) ( not ( = ?auto_137679 ?auto_137683 ) ) ( not ( = ?auto_137679 ?auto_137682 ) ) ( ON ?auto_137679 ?auto_137680 ) ( ON ?auto_137678 ?auto_137679 ) ( ON ?auto_137677 ?auto_137678 ) ( CLEAR ?auto_137677 ) ( HOLDING ?auto_137676 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137676 )
      ( MAKE-6PILE ?auto_137676 ?auto_137677 ?auto_137678 ?auto_137679 ?auto_137680 ?auto_137681 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_137685 - BLOCK
      ?auto_137686 - BLOCK
      ?auto_137687 - BLOCK
      ?auto_137688 - BLOCK
      ?auto_137689 - BLOCK
      ?auto_137690 - BLOCK
    )
    :vars
    (
      ?auto_137691 - BLOCK
      ?auto_137693 - BLOCK
      ?auto_137692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137685 ?auto_137686 ) ) ( not ( = ?auto_137685 ?auto_137687 ) ) ( not ( = ?auto_137685 ?auto_137688 ) ) ( not ( = ?auto_137685 ?auto_137689 ) ) ( not ( = ?auto_137685 ?auto_137690 ) ) ( not ( = ?auto_137686 ?auto_137687 ) ) ( not ( = ?auto_137686 ?auto_137688 ) ) ( not ( = ?auto_137686 ?auto_137689 ) ) ( not ( = ?auto_137686 ?auto_137690 ) ) ( not ( = ?auto_137687 ?auto_137688 ) ) ( not ( = ?auto_137687 ?auto_137689 ) ) ( not ( = ?auto_137687 ?auto_137690 ) ) ( not ( = ?auto_137688 ?auto_137689 ) ) ( not ( = ?auto_137688 ?auto_137690 ) ) ( not ( = ?auto_137689 ?auto_137690 ) ) ( ON ?auto_137690 ?auto_137691 ) ( not ( = ?auto_137685 ?auto_137691 ) ) ( not ( = ?auto_137686 ?auto_137691 ) ) ( not ( = ?auto_137687 ?auto_137691 ) ) ( not ( = ?auto_137688 ?auto_137691 ) ) ( not ( = ?auto_137689 ?auto_137691 ) ) ( not ( = ?auto_137690 ?auto_137691 ) ) ( ON ?auto_137689 ?auto_137690 ) ( ON-TABLE ?auto_137693 ) ( ON ?auto_137692 ?auto_137693 ) ( ON ?auto_137691 ?auto_137692 ) ( not ( = ?auto_137693 ?auto_137692 ) ) ( not ( = ?auto_137693 ?auto_137691 ) ) ( not ( = ?auto_137693 ?auto_137690 ) ) ( not ( = ?auto_137693 ?auto_137689 ) ) ( not ( = ?auto_137692 ?auto_137691 ) ) ( not ( = ?auto_137692 ?auto_137690 ) ) ( not ( = ?auto_137692 ?auto_137689 ) ) ( not ( = ?auto_137685 ?auto_137693 ) ) ( not ( = ?auto_137685 ?auto_137692 ) ) ( not ( = ?auto_137686 ?auto_137693 ) ) ( not ( = ?auto_137686 ?auto_137692 ) ) ( not ( = ?auto_137687 ?auto_137693 ) ) ( not ( = ?auto_137687 ?auto_137692 ) ) ( not ( = ?auto_137688 ?auto_137693 ) ) ( not ( = ?auto_137688 ?auto_137692 ) ) ( ON ?auto_137688 ?auto_137689 ) ( ON ?auto_137687 ?auto_137688 ) ( ON ?auto_137686 ?auto_137687 ) ( ON ?auto_137685 ?auto_137686 ) ( CLEAR ?auto_137685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137693 ?auto_137692 ?auto_137691 ?auto_137690 ?auto_137689 ?auto_137688 ?auto_137687 ?auto_137686 )
      ( MAKE-6PILE ?auto_137685 ?auto_137686 ?auto_137687 ?auto_137688 ?auto_137689 ?auto_137690 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137696 - BLOCK
      ?auto_137697 - BLOCK
    )
    :vars
    (
      ?auto_137698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137698 ?auto_137697 ) ( CLEAR ?auto_137698 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137696 ) ( ON ?auto_137697 ?auto_137696 ) ( not ( = ?auto_137696 ?auto_137697 ) ) ( not ( = ?auto_137696 ?auto_137698 ) ) ( not ( = ?auto_137697 ?auto_137698 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137698 ?auto_137697 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137699 - BLOCK
      ?auto_137700 - BLOCK
    )
    :vars
    (
      ?auto_137701 - BLOCK
      ?auto_137702 - BLOCK
      ?auto_137703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137701 ?auto_137700 ) ( CLEAR ?auto_137701 ) ( ON-TABLE ?auto_137699 ) ( ON ?auto_137700 ?auto_137699 ) ( not ( = ?auto_137699 ?auto_137700 ) ) ( not ( = ?auto_137699 ?auto_137701 ) ) ( not ( = ?auto_137700 ?auto_137701 ) ) ( HOLDING ?auto_137702 ) ( CLEAR ?auto_137703 ) ( not ( = ?auto_137699 ?auto_137702 ) ) ( not ( = ?auto_137699 ?auto_137703 ) ) ( not ( = ?auto_137700 ?auto_137702 ) ) ( not ( = ?auto_137700 ?auto_137703 ) ) ( not ( = ?auto_137701 ?auto_137702 ) ) ( not ( = ?auto_137701 ?auto_137703 ) ) ( not ( = ?auto_137702 ?auto_137703 ) ) )
    :subtasks
    ( ( !STACK ?auto_137702 ?auto_137703 )
      ( MAKE-2PILE ?auto_137699 ?auto_137700 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137704 - BLOCK
      ?auto_137705 - BLOCK
    )
    :vars
    (
      ?auto_137707 - BLOCK
      ?auto_137706 - BLOCK
      ?auto_137708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137707 ?auto_137705 ) ( ON-TABLE ?auto_137704 ) ( ON ?auto_137705 ?auto_137704 ) ( not ( = ?auto_137704 ?auto_137705 ) ) ( not ( = ?auto_137704 ?auto_137707 ) ) ( not ( = ?auto_137705 ?auto_137707 ) ) ( CLEAR ?auto_137706 ) ( not ( = ?auto_137704 ?auto_137708 ) ) ( not ( = ?auto_137704 ?auto_137706 ) ) ( not ( = ?auto_137705 ?auto_137708 ) ) ( not ( = ?auto_137705 ?auto_137706 ) ) ( not ( = ?auto_137707 ?auto_137708 ) ) ( not ( = ?auto_137707 ?auto_137706 ) ) ( not ( = ?auto_137708 ?auto_137706 ) ) ( ON ?auto_137708 ?auto_137707 ) ( CLEAR ?auto_137708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137704 ?auto_137705 ?auto_137707 )
      ( MAKE-2PILE ?auto_137704 ?auto_137705 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137709 - BLOCK
      ?auto_137710 - BLOCK
    )
    :vars
    (
      ?auto_137712 - BLOCK
      ?auto_137711 - BLOCK
      ?auto_137713 - BLOCK
      ?auto_137714 - BLOCK
      ?auto_137716 - BLOCK
      ?auto_137715 - BLOCK
      ?auto_137717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137712 ?auto_137710 ) ( ON-TABLE ?auto_137709 ) ( ON ?auto_137710 ?auto_137709 ) ( not ( = ?auto_137709 ?auto_137710 ) ) ( not ( = ?auto_137709 ?auto_137712 ) ) ( not ( = ?auto_137710 ?auto_137712 ) ) ( not ( = ?auto_137709 ?auto_137711 ) ) ( not ( = ?auto_137709 ?auto_137713 ) ) ( not ( = ?auto_137710 ?auto_137711 ) ) ( not ( = ?auto_137710 ?auto_137713 ) ) ( not ( = ?auto_137712 ?auto_137711 ) ) ( not ( = ?auto_137712 ?auto_137713 ) ) ( not ( = ?auto_137711 ?auto_137713 ) ) ( ON ?auto_137711 ?auto_137712 ) ( CLEAR ?auto_137711 ) ( HOLDING ?auto_137713 ) ( CLEAR ?auto_137714 ) ( ON-TABLE ?auto_137716 ) ( ON ?auto_137715 ?auto_137716 ) ( ON ?auto_137717 ?auto_137715 ) ( ON ?auto_137714 ?auto_137717 ) ( not ( = ?auto_137716 ?auto_137715 ) ) ( not ( = ?auto_137716 ?auto_137717 ) ) ( not ( = ?auto_137716 ?auto_137714 ) ) ( not ( = ?auto_137716 ?auto_137713 ) ) ( not ( = ?auto_137715 ?auto_137717 ) ) ( not ( = ?auto_137715 ?auto_137714 ) ) ( not ( = ?auto_137715 ?auto_137713 ) ) ( not ( = ?auto_137717 ?auto_137714 ) ) ( not ( = ?auto_137717 ?auto_137713 ) ) ( not ( = ?auto_137714 ?auto_137713 ) ) ( not ( = ?auto_137709 ?auto_137714 ) ) ( not ( = ?auto_137709 ?auto_137716 ) ) ( not ( = ?auto_137709 ?auto_137715 ) ) ( not ( = ?auto_137709 ?auto_137717 ) ) ( not ( = ?auto_137710 ?auto_137714 ) ) ( not ( = ?auto_137710 ?auto_137716 ) ) ( not ( = ?auto_137710 ?auto_137715 ) ) ( not ( = ?auto_137710 ?auto_137717 ) ) ( not ( = ?auto_137712 ?auto_137714 ) ) ( not ( = ?auto_137712 ?auto_137716 ) ) ( not ( = ?auto_137712 ?auto_137715 ) ) ( not ( = ?auto_137712 ?auto_137717 ) ) ( not ( = ?auto_137711 ?auto_137714 ) ) ( not ( = ?auto_137711 ?auto_137716 ) ) ( not ( = ?auto_137711 ?auto_137715 ) ) ( not ( = ?auto_137711 ?auto_137717 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137716 ?auto_137715 ?auto_137717 ?auto_137714 ?auto_137713 )
      ( MAKE-2PILE ?auto_137709 ?auto_137710 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137718 - BLOCK
      ?auto_137719 - BLOCK
    )
    :vars
    (
      ?auto_137722 - BLOCK
      ?auto_137723 - BLOCK
      ?auto_137725 - BLOCK
      ?auto_137720 - BLOCK
      ?auto_137724 - BLOCK
      ?auto_137721 - BLOCK
      ?auto_137726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137722 ?auto_137719 ) ( ON-TABLE ?auto_137718 ) ( ON ?auto_137719 ?auto_137718 ) ( not ( = ?auto_137718 ?auto_137719 ) ) ( not ( = ?auto_137718 ?auto_137722 ) ) ( not ( = ?auto_137719 ?auto_137722 ) ) ( not ( = ?auto_137718 ?auto_137723 ) ) ( not ( = ?auto_137718 ?auto_137725 ) ) ( not ( = ?auto_137719 ?auto_137723 ) ) ( not ( = ?auto_137719 ?auto_137725 ) ) ( not ( = ?auto_137722 ?auto_137723 ) ) ( not ( = ?auto_137722 ?auto_137725 ) ) ( not ( = ?auto_137723 ?auto_137725 ) ) ( ON ?auto_137723 ?auto_137722 ) ( CLEAR ?auto_137720 ) ( ON-TABLE ?auto_137724 ) ( ON ?auto_137721 ?auto_137724 ) ( ON ?auto_137726 ?auto_137721 ) ( ON ?auto_137720 ?auto_137726 ) ( not ( = ?auto_137724 ?auto_137721 ) ) ( not ( = ?auto_137724 ?auto_137726 ) ) ( not ( = ?auto_137724 ?auto_137720 ) ) ( not ( = ?auto_137724 ?auto_137725 ) ) ( not ( = ?auto_137721 ?auto_137726 ) ) ( not ( = ?auto_137721 ?auto_137720 ) ) ( not ( = ?auto_137721 ?auto_137725 ) ) ( not ( = ?auto_137726 ?auto_137720 ) ) ( not ( = ?auto_137726 ?auto_137725 ) ) ( not ( = ?auto_137720 ?auto_137725 ) ) ( not ( = ?auto_137718 ?auto_137720 ) ) ( not ( = ?auto_137718 ?auto_137724 ) ) ( not ( = ?auto_137718 ?auto_137721 ) ) ( not ( = ?auto_137718 ?auto_137726 ) ) ( not ( = ?auto_137719 ?auto_137720 ) ) ( not ( = ?auto_137719 ?auto_137724 ) ) ( not ( = ?auto_137719 ?auto_137721 ) ) ( not ( = ?auto_137719 ?auto_137726 ) ) ( not ( = ?auto_137722 ?auto_137720 ) ) ( not ( = ?auto_137722 ?auto_137724 ) ) ( not ( = ?auto_137722 ?auto_137721 ) ) ( not ( = ?auto_137722 ?auto_137726 ) ) ( not ( = ?auto_137723 ?auto_137720 ) ) ( not ( = ?auto_137723 ?auto_137724 ) ) ( not ( = ?auto_137723 ?auto_137721 ) ) ( not ( = ?auto_137723 ?auto_137726 ) ) ( ON ?auto_137725 ?auto_137723 ) ( CLEAR ?auto_137725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137718 ?auto_137719 ?auto_137722 ?auto_137723 )
      ( MAKE-2PILE ?auto_137718 ?auto_137719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137727 - BLOCK
      ?auto_137728 - BLOCK
    )
    :vars
    (
      ?auto_137730 - BLOCK
      ?auto_137732 - BLOCK
      ?auto_137733 - BLOCK
      ?auto_137731 - BLOCK
      ?auto_137735 - BLOCK
      ?auto_137734 - BLOCK
      ?auto_137729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137730 ?auto_137728 ) ( ON-TABLE ?auto_137727 ) ( ON ?auto_137728 ?auto_137727 ) ( not ( = ?auto_137727 ?auto_137728 ) ) ( not ( = ?auto_137727 ?auto_137730 ) ) ( not ( = ?auto_137728 ?auto_137730 ) ) ( not ( = ?auto_137727 ?auto_137732 ) ) ( not ( = ?auto_137727 ?auto_137733 ) ) ( not ( = ?auto_137728 ?auto_137732 ) ) ( not ( = ?auto_137728 ?auto_137733 ) ) ( not ( = ?auto_137730 ?auto_137732 ) ) ( not ( = ?auto_137730 ?auto_137733 ) ) ( not ( = ?auto_137732 ?auto_137733 ) ) ( ON ?auto_137732 ?auto_137730 ) ( ON-TABLE ?auto_137731 ) ( ON ?auto_137735 ?auto_137731 ) ( ON ?auto_137734 ?auto_137735 ) ( not ( = ?auto_137731 ?auto_137735 ) ) ( not ( = ?auto_137731 ?auto_137734 ) ) ( not ( = ?auto_137731 ?auto_137729 ) ) ( not ( = ?auto_137731 ?auto_137733 ) ) ( not ( = ?auto_137735 ?auto_137734 ) ) ( not ( = ?auto_137735 ?auto_137729 ) ) ( not ( = ?auto_137735 ?auto_137733 ) ) ( not ( = ?auto_137734 ?auto_137729 ) ) ( not ( = ?auto_137734 ?auto_137733 ) ) ( not ( = ?auto_137729 ?auto_137733 ) ) ( not ( = ?auto_137727 ?auto_137729 ) ) ( not ( = ?auto_137727 ?auto_137731 ) ) ( not ( = ?auto_137727 ?auto_137735 ) ) ( not ( = ?auto_137727 ?auto_137734 ) ) ( not ( = ?auto_137728 ?auto_137729 ) ) ( not ( = ?auto_137728 ?auto_137731 ) ) ( not ( = ?auto_137728 ?auto_137735 ) ) ( not ( = ?auto_137728 ?auto_137734 ) ) ( not ( = ?auto_137730 ?auto_137729 ) ) ( not ( = ?auto_137730 ?auto_137731 ) ) ( not ( = ?auto_137730 ?auto_137735 ) ) ( not ( = ?auto_137730 ?auto_137734 ) ) ( not ( = ?auto_137732 ?auto_137729 ) ) ( not ( = ?auto_137732 ?auto_137731 ) ) ( not ( = ?auto_137732 ?auto_137735 ) ) ( not ( = ?auto_137732 ?auto_137734 ) ) ( ON ?auto_137733 ?auto_137732 ) ( CLEAR ?auto_137733 ) ( HOLDING ?auto_137729 ) ( CLEAR ?auto_137734 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137731 ?auto_137735 ?auto_137734 ?auto_137729 )
      ( MAKE-2PILE ?auto_137727 ?auto_137728 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137736 - BLOCK
      ?auto_137737 - BLOCK
    )
    :vars
    (
      ?auto_137742 - BLOCK
      ?auto_137741 - BLOCK
      ?auto_137738 - BLOCK
      ?auto_137739 - BLOCK
      ?auto_137744 - BLOCK
      ?auto_137743 - BLOCK
      ?auto_137740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137742 ?auto_137737 ) ( ON-TABLE ?auto_137736 ) ( ON ?auto_137737 ?auto_137736 ) ( not ( = ?auto_137736 ?auto_137737 ) ) ( not ( = ?auto_137736 ?auto_137742 ) ) ( not ( = ?auto_137737 ?auto_137742 ) ) ( not ( = ?auto_137736 ?auto_137741 ) ) ( not ( = ?auto_137736 ?auto_137738 ) ) ( not ( = ?auto_137737 ?auto_137741 ) ) ( not ( = ?auto_137737 ?auto_137738 ) ) ( not ( = ?auto_137742 ?auto_137741 ) ) ( not ( = ?auto_137742 ?auto_137738 ) ) ( not ( = ?auto_137741 ?auto_137738 ) ) ( ON ?auto_137741 ?auto_137742 ) ( ON-TABLE ?auto_137739 ) ( ON ?auto_137744 ?auto_137739 ) ( ON ?auto_137743 ?auto_137744 ) ( not ( = ?auto_137739 ?auto_137744 ) ) ( not ( = ?auto_137739 ?auto_137743 ) ) ( not ( = ?auto_137739 ?auto_137740 ) ) ( not ( = ?auto_137739 ?auto_137738 ) ) ( not ( = ?auto_137744 ?auto_137743 ) ) ( not ( = ?auto_137744 ?auto_137740 ) ) ( not ( = ?auto_137744 ?auto_137738 ) ) ( not ( = ?auto_137743 ?auto_137740 ) ) ( not ( = ?auto_137743 ?auto_137738 ) ) ( not ( = ?auto_137740 ?auto_137738 ) ) ( not ( = ?auto_137736 ?auto_137740 ) ) ( not ( = ?auto_137736 ?auto_137739 ) ) ( not ( = ?auto_137736 ?auto_137744 ) ) ( not ( = ?auto_137736 ?auto_137743 ) ) ( not ( = ?auto_137737 ?auto_137740 ) ) ( not ( = ?auto_137737 ?auto_137739 ) ) ( not ( = ?auto_137737 ?auto_137744 ) ) ( not ( = ?auto_137737 ?auto_137743 ) ) ( not ( = ?auto_137742 ?auto_137740 ) ) ( not ( = ?auto_137742 ?auto_137739 ) ) ( not ( = ?auto_137742 ?auto_137744 ) ) ( not ( = ?auto_137742 ?auto_137743 ) ) ( not ( = ?auto_137741 ?auto_137740 ) ) ( not ( = ?auto_137741 ?auto_137739 ) ) ( not ( = ?auto_137741 ?auto_137744 ) ) ( not ( = ?auto_137741 ?auto_137743 ) ) ( ON ?auto_137738 ?auto_137741 ) ( CLEAR ?auto_137743 ) ( ON ?auto_137740 ?auto_137738 ) ( CLEAR ?auto_137740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137736 ?auto_137737 ?auto_137742 ?auto_137741 ?auto_137738 )
      ( MAKE-2PILE ?auto_137736 ?auto_137737 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137745 - BLOCK
      ?auto_137746 - BLOCK
    )
    :vars
    (
      ?auto_137749 - BLOCK
      ?auto_137750 - BLOCK
      ?auto_137747 - BLOCK
      ?auto_137751 - BLOCK
      ?auto_137753 - BLOCK
      ?auto_137748 - BLOCK
      ?auto_137752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137749 ?auto_137746 ) ( ON-TABLE ?auto_137745 ) ( ON ?auto_137746 ?auto_137745 ) ( not ( = ?auto_137745 ?auto_137746 ) ) ( not ( = ?auto_137745 ?auto_137749 ) ) ( not ( = ?auto_137746 ?auto_137749 ) ) ( not ( = ?auto_137745 ?auto_137750 ) ) ( not ( = ?auto_137745 ?auto_137747 ) ) ( not ( = ?auto_137746 ?auto_137750 ) ) ( not ( = ?auto_137746 ?auto_137747 ) ) ( not ( = ?auto_137749 ?auto_137750 ) ) ( not ( = ?auto_137749 ?auto_137747 ) ) ( not ( = ?auto_137750 ?auto_137747 ) ) ( ON ?auto_137750 ?auto_137749 ) ( ON-TABLE ?auto_137751 ) ( ON ?auto_137753 ?auto_137751 ) ( not ( = ?auto_137751 ?auto_137753 ) ) ( not ( = ?auto_137751 ?auto_137748 ) ) ( not ( = ?auto_137751 ?auto_137752 ) ) ( not ( = ?auto_137751 ?auto_137747 ) ) ( not ( = ?auto_137753 ?auto_137748 ) ) ( not ( = ?auto_137753 ?auto_137752 ) ) ( not ( = ?auto_137753 ?auto_137747 ) ) ( not ( = ?auto_137748 ?auto_137752 ) ) ( not ( = ?auto_137748 ?auto_137747 ) ) ( not ( = ?auto_137752 ?auto_137747 ) ) ( not ( = ?auto_137745 ?auto_137752 ) ) ( not ( = ?auto_137745 ?auto_137751 ) ) ( not ( = ?auto_137745 ?auto_137753 ) ) ( not ( = ?auto_137745 ?auto_137748 ) ) ( not ( = ?auto_137746 ?auto_137752 ) ) ( not ( = ?auto_137746 ?auto_137751 ) ) ( not ( = ?auto_137746 ?auto_137753 ) ) ( not ( = ?auto_137746 ?auto_137748 ) ) ( not ( = ?auto_137749 ?auto_137752 ) ) ( not ( = ?auto_137749 ?auto_137751 ) ) ( not ( = ?auto_137749 ?auto_137753 ) ) ( not ( = ?auto_137749 ?auto_137748 ) ) ( not ( = ?auto_137750 ?auto_137752 ) ) ( not ( = ?auto_137750 ?auto_137751 ) ) ( not ( = ?auto_137750 ?auto_137753 ) ) ( not ( = ?auto_137750 ?auto_137748 ) ) ( ON ?auto_137747 ?auto_137750 ) ( ON ?auto_137752 ?auto_137747 ) ( CLEAR ?auto_137752 ) ( HOLDING ?auto_137748 ) ( CLEAR ?auto_137753 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137751 ?auto_137753 ?auto_137748 )
      ( MAKE-2PILE ?auto_137745 ?auto_137746 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137754 - BLOCK
      ?auto_137755 - BLOCK
    )
    :vars
    (
      ?auto_137756 - BLOCK
      ?auto_137760 - BLOCK
      ?auto_137761 - BLOCK
      ?auto_137757 - BLOCK
      ?auto_137759 - BLOCK
      ?auto_137758 - BLOCK
      ?auto_137762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137756 ?auto_137755 ) ( ON-TABLE ?auto_137754 ) ( ON ?auto_137755 ?auto_137754 ) ( not ( = ?auto_137754 ?auto_137755 ) ) ( not ( = ?auto_137754 ?auto_137756 ) ) ( not ( = ?auto_137755 ?auto_137756 ) ) ( not ( = ?auto_137754 ?auto_137760 ) ) ( not ( = ?auto_137754 ?auto_137761 ) ) ( not ( = ?auto_137755 ?auto_137760 ) ) ( not ( = ?auto_137755 ?auto_137761 ) ) ( not ( = ?auto_137756 ?auto_137760 ) ) ( not ( = ?auto_137756 ?auto_137761 ) ) ( not ( = ?auto_137760 ?auto_137761 ) ) ( ON ?auto_137760 ?auto_137756 ) ( ON-TABLE ?auto_137757 ) ( ON ?auto_137759 ?auto_137757 ) ( not ( = ?auto_137757 ?auto_137759 ) ) ( not ( = ?auto_137757 ?auto_137758 ) ) ( not ( = ?auto_137757 ?auto_137762 ) ) ( not ( = ?auto_137757 ?auto_137761 ) ) ( not ( = ?auto_137759 ?auto_137758 ) ) ( not ( = ?auto_137759 ?auto_137762 ) ) ( not ( = ?auto_137759 ?auto_137761 ) ) ( not ( = ?auto_137758 ?auto_137762 ) ) ( not ( = ?auto_137758 ?auto_137761 ) ) ( not ( = ?auto_137762 ?auto_137761 ) ) ( not ( = ?auto_137754 ?auto_137762 ) ) ( not ( = ?auto_137754 ?auto_137757 ) ) ( not ( = ?auto_137754 ?auto_137759 ) ) ( not ( = ?auto_137754 ?auto_137758 ) ) ( not ( = ?auto_137755 ?auto_137762 ) ) ( not ( = ?auto_137755 ?auto_137757 ) ) ( not ( = ?auto_137755 ?auto_137759 ) ) ( not ( = ?auto_137755 ?auto_137758 ) ) ( not ( = ?auto_137756 ?auto_137762 ) ) ( not ( = ?auto_137756 ?auto_137757 ) ) ( not ( = ?auto_137756 ?auto_137759 ) ) ( not ( = ?auto_137756 ?auto_137758 ) ) ( not ( = ?auto_137760 ?auto_137762 ) ) ( not ( = ?auto_137760 ?auto_137757 ) ) ( not ( = ?auto_137760 ?auto_137759 ) ) ( not ( = ?auto_137760 ?auto_137758 ) ) ( ON ?auto_137761 ?auto_137760 ) ( ON ?auto_137762 ?auto_137761 ) ( CLEAR ?auto_137759 ) ( ON ?auto_137758 ?auto_137762 ) ( CLEAR ?auto_137758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137754 ?auto_137755 ?auto_137756 ?auto_137760 ?auto_137761 ?auto_137762 )
      ( MAKE-2PILE ?auto_137754 ?auto_137755 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137763 - BLOCK
      ?auto_137764 - BLOCK
    )
    :vars
    (
      ?auto_137768 - BLOCK
      ?auto_137766 - BLOCK
      ?auto_137769 - BLOCK
      ?auto_137771 - BLOCK
      ?auto_137770 - BLOCK
      ?auto_137767 - BLOCK
      ?auto_137765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137768 ?auto_137764 ) ( ON-TABLE ?auto_137763 ) ( ON ?auto_137764 ?auto_137763 ) ( not ( = ?auto_137763 ?auto_137764 ) ) ( not ( = ?auto_137763 ?auto_137768 ) ) ( not ( = ?auto_137764 ?auto_137768 ) ) ( not ( = ?auto_137763 ?auto_137766 ) ) ( not ( = ?auto_137763 ?auto_137769 ) ) ( not ( = ?auto_137764 ?auto_137766 ) ) ( not ( = ?auto_137764 ?auto_137769 ) ) ( not ( = ?auto_137768 ?auto_137766 ) ) ( not ( = ?auto_137768 ?auto_137769 ) ) ( not ( = ?auto_137766 ?auto_137769 ) ) ( ON ?auto_137766 ?auto_137768 ) ( ON-TABLE ?auto_137771 ) ( not ( = ?auto_137771 ?auto_137770 ) ) ( not ( = ?auto_137771 ?auto_137767 ) ) ( not ( = ?auto_137771 ?auto_137765 ) ) ( not ( = ?auto_137771 ?auto_137769 ) ) ( not ( = ?auto_137770 ?auto_137767 ) ) ( not ( = ?auto_137770 ?auto_137765 ) ) ( not ( = ?auto_137770 ?auto_137769 ) ) ( not ( = ?auto_137767 ?auto_137765 ) ) ( not ( = ?auto_137767 ?auto_137769 ) ) ( not ( = ?auto_137765 ?auto_137769 ) ) ( not ( = ?auto_137763 ?auto_137765 ) ) ( not ( = ?auto_137763 ?auto_137771 ) ) ( not ( = ?auto_137763 ?auto_137770 ) ) ( not ( = ?auto_137763 ?auto_137767 ) ) ( not ( = ?auto_137764 ?auto_137765 ) ) ( not ( = ?auto_137764 ?auto_137771 ) ) ( not ( = ?auto_137764 ?auto_137770 ) ) ( not ( = ?auto_137764 ?auto_137767 ) ) ( not ( = ?auto_137768 ?auto_137765 ) ) ( not ( = ?auto_137768 ?auto_137771 ) ) ( not ( = ?auto_137768 ?auto_137770 ) ) ( not ( = ?auto_137768 ?auto_137767 ) ) ( not ( = ?auto_137766 ?auto_137765 ) ) ( not ( = ?auto_137766 ?auto_137771 ) ) ( not ( = ?auto_137766 ?auto_137770 ) ) ( not ( = ?auto_137766 ?auto_137767 ) ) ( ON ?auto_137769 ?auto_137766 ) ( ON ?auto_137765 ?auto_137769 ) ( ON ?auto_137767 ?auto_137765 ) ( CLEAR ?auto_137767 ) ( HOLDING ?auto_137770 ) ( CLEAR ?auto_137771 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137771 ?auto_137770 )
      ( MAKE-2PILE ?auto_137763 ?auto_137764 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137772 - BLOCK
      ?auto_137773 - BLOCK
    )
    :vars
    (
      ?auto_137779 - BLOCK
      ?auto_137775 - BLOCK
      ?auto_137780 - BLOCK
      ?auto_137777 - BLOCK
      ?auto_137774 - BLOCK
      ?auto_137778 - BLOCK
      ?auto_137776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137779 ?auto_137773 ) ( ON-TABLE ?auto_137772 ) ( ON ?auto_137773 ?auto_137772 ) ( not ( = ?auto_137772 ?auto_137773 ) ) ( not ( = ?auto_137772 ?auto_137779 ) ) ( not ( = ?auto_137773 ?auto_137779 ) ) ( not ( = ?auto_137772 ?auto_137775 ) ) ( not ( = ?auto_137772 ?auto_137780 ) ) ( not ( = ?auto_137773 ?auto_137775 ) ) ( not ( = ?auto_137773 ?auto_137780 ) ) ( not ( = ?auto_137779 ?auto_137775 ) ) ( not ( = ?auto_137779 ?auto_137780 ) ) ( not ( = ?auto_137775 ?auto_137780 ) ) ( ON ?auto_137775 ?auto_137779 ) ( ON-TABLE ?auto_137777 ) ( not ( = ?auto_137777 ?auto_137774 ) ) ( not ( = ?auto_137777 ?auto_137778 ) ) ( not ( = ?auto_137777 ?auto_137776 ) ) ( not ( = ?auto_137777 ?auto_137780 ) ) ( not ( = ?auto_137774 ?auto_137778 ) ) ( not ( = ?auto_137774 ?auto_137776 ) ) ( not ( = ?auto_137774 ?auto_137780 ) ) ( not ( = ?auto_137778 ?auto_137776 ) ) ( not ( = ?auto_137778 ?auto_137780 ) ) ( not ( = ?auto_137776 ?auto_137780 ) ) ( not ( = ?auto_137772 ?auto_137776 ) ) ( not ( = ?auto_137772 ?auto_137777 ) ) ( not ( = ?auto_137772 ?auto_137774 ) ) ( not ( = ?auto_137772 ?auto_137778 ) ) ( not ( = ?auto_137773 ?auto_137776 ) ) ( not ( = ?auto_137773 ?auto_137777 ) ) ( not ( = ?auto_137773 ?auto_137774 ) ) ( not ( = ?auto_137773 ?auto_137778 ) ) ( not ( = ?auto_137779 ?auto_137776 ) ) ( not ( = ?auto_137779 ?auto_137777 ) ) ( not ( = ?auto_137779 ?auto_137774 ) ) ( not ( = ?auto_137779 ?auto_137778 ) ) ( not ( = ?auto_137775 ?auto_137776 ) ) ( not ( = ?auto_137775 ?auto_137777 ) ) ( not ( = ?auto_137775 ?auto_137774 ) ) ( not ( = ?auto_137775 ?auto_137778 ) ) ( ON ?auto_137780 ?auto_137775 ) ( ON ?auto_137776 ?auto_137780 ) ( ON ?auto_137778 ?auto_137776 ) ( CLEAR ?auto_137777 ) ( ON ?auto_137774 ?auto_137778 ) ( CLEAR ?auto_137774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137772 ?auto_137773 ?auto_137779 ?auto_137775 ?auto_137780 ?auto_137776 ?auto_137778 )
      ( MAKE-2PILE ?auto_137772 ?auto_137773 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137781 - BLOCK
      ?auto_137782 - BLOCK
    )
    :vars
    (
      ?auto_137784 - BLOCK
      ?auto_137785 - BLOCK
      ?auto_137783 - BLOCK
      ?auto_137789 - BLOCK
      ?auto_137786 - BLOCK
      ?auto_137788 - BLOCK
      ?auto_137787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137784 ?auto_137782 ) ( ON-TABLE ?auto_137781 ) ( ON ?auto_137782 ?auto_137781 ) ( not ( = ?auto_137781 ?auto_137782 ) ) ( not ( = ?auto_137781 ?auto_137784 ) ) ( not ( = ?auto_137782 ?auto_137784 ) ) ( not ( = ?auto_137781 ?auto_137785 ) ) ( not ( = ?auto_137781 ?auto_137783 ) ) ( not ( = ?auto_137782 ?auto_137785 ) ) ( not ( = ?auto_137782 ?auto_137783 ) ) ( not ( = ?auto_137784 ?auto_137785 ) ) ( not ( = ?auto_137784 ?auto_137783 ) ) ( not ( = ?auto_137785 ?auto_137783 ) ) ( ON ?auto_137785 ?auto_137784 ) ( not ( = ?auto_137789 ?auto_137786 ) ) ( not ( = ?auto_137789 ?auto_137788 ) ) ( not ( = ?auto_137789 ?auto_137787 ) ) ( not ( = ?auto_137789 ?auto_137783 ) ) ( not ( = ?auto_137786 ?auto_137788 ) ) ( not ( = ?auto_137786 ?auto_137787 ) ) ( not ( = ?auto_137786 ?auto_137783 ) ) ( not ( = ?auto_137788 ?auto_137787 ) ) ( not ( = ?auto_137788 ?auto_137783 ) ) ( not ( = ?auto_137787 ?auto_137783 ) ) ( not ( = ?auto_137781 ?auto_137787 ) ) ( not ( = ?auto_137781 ?auto_137789 ) ) ( not ( = ?auto_137781 ?auto_137786 ) ) ( not ( = ?auto_137781 ?auto_137788 ) ) ( not ( = ?auto_137782 ?auto_137787 ) ) ( not ( = ?auto_137782 ?auto_137789 ) ) ( not ( = ?auto_137782 ?auto_137786 ) ) ( not ( = ?auto_137782 ?auto_137788 ) ) ( not ( = ?auto_137784 ?auto_137787 ) ) ( not ( = ?auto_137784 ?auto_137789 ) ) ( not ( = ?auto_137784 ?auto_137786 ) ) ( not ( = ?auto_137784 ?auto_137788 ) ) ( not ( = ?auto_137785 ?auto_137787 ) ) ( not ( = ?auto_137785 ?auto_137789 ) ) ( not ( = ?auto_137785 ?auto_137786 ) ) ( not ( = ?auto_137785 ?auto_137788 ) ) ( ON ?auto_137783 ?auto_137785 ) ( ON ?auto_137787 ?auto_137783 ) ( ON ?auto_137788 ?auto_137787 ) ( ON ?auto_137786 ?auto_137788 ) ( CLEAR ?auto_137786 ) ( HOLDING ?auto_137789 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137789 )
      ( MAKE-2PILE ?auto_137781 ?auto_137782 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_137790 - BLOCK
      ?auto_137791 - BLOCK
    )
    :vars
    (
      ?auto_137798 - BLOCK
      ?auto_137797 - BLOCK
      ?auto_137796 - BLOCK
      ?auto_137794 - BLOCK
      ?auto_137792 - BLOCK
      ?auto_137793 - BLOCK
      ?auto_137795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137798 ?auto_137791 ) ( ON-TABLE ?auto_137790 ) ( ON ?auto_137791 ?auto_137790 ) ( not ( = ?auto_137790 ?auto_137791 ) ) ( not ( = ?auto_137790 ?auto_137798 ) ) ( not ( = ?auto_137791 ?auto_137798 ) ) ( not ( = ?auto_137790 ?auto_137797 ) ) ( not ( = ?auto_137790 ?auto_137796 ) ) ( not ( = ?auto_137791 ?auto_137797 ) ) ( not ( = ?auto_137791 ?auto_137796 ) ) ( not ( = ?auto_137798 ?auto_137797 ) ) ( not ( = ?auto_137798 ?auto_137796 ) ) ( not ( = ?auto_137797 ?auto_137796 ) ) ( ON ?auto_137797 ?auto_137798 ) ( not ( = ?auto_137794 ?auto_137792 ) ) ( not ( = ?auto_137794 ?auto_137793 ) ) ( not ( = ?auto_137794 ?auto_137795 ) ) ( not ( = ?auto_137794 ?auto_137796 ) ) ( not ( = ?auto_137792 ?auto_137793 ) ) ( not ( = ?auto_137792 ?auto_137795 ) ) ( not ( = ?auto_137792 ?auto_137796 ) ) ( not ( = ?auto_137793 ?auto_137795 ) ) ( not ( = ?auto_137793 ?auto_137796 ) ) ( not ( = ?auto_137795 ?auto_137796 ) ) ( not ( = ?auto_137790 ?auto_137795 ) ) ( not ( = ?auto_137790 ?auto_137794 ) ) ( not ( = ?auto_137790 ?auto_137792 ) ) ( not ( = ?auto_137790 ?auto_137793 ) ) ( not ( = ?auto_137791 ?auto_137795 ) ) ( not ( = ?auto_137791 ?auto_137794 ) ) ( not ( = ?auto_137791 ?auto_137792 ) ) ( not ( = ?auto_137791 ?auto_137793 ) ) ( not ( = ?auto_137798 ?auto_137795 ) ) ( not ( = ?auto_137798 ?auto_137794 ) ) ( not ( = ?auto_137798 ?auto_137792 ) ) ( not ( = ?auto_137798 ?auto_137793 ) ) ( not ( = ?auto_137797 ?auto_137795 ) ) ( not ( = ?auto_137797 ?auto_137794 ) ) ( not ( = ?auto_137797 ?auto_137792 ) ) ( not ( = ?auto_137797 ?auto_137793 ) ) ( ON ?auto_137796 ?auto_137797 ) ( ON ?auto_137795 ?auto_137796 ) ( ON ?auto_137793 ?auto_137795 ) ( ON ?auto_137792 ?auto_137793 ) ( ON ?auto_137794 ?auto_137792 ) ( CLEAR ?auto_137794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137790 ?auto_137791 ?auto_137798 ?auto_137797 ?auto_137796 ?auto_137795 ?auto_137793 ?auto_137792 )
      ( MAKE-2PILE ?auto_137790 ?auto_137791 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137806 - BLOCK
      ?auto_137807 - BLOCK
      ?auto_137808 - BLOCK
      ?auto_137809 - BLOCK
      ?auto_137810 - BLOCK
      ?auto_137811 - BLOCK
      ?auto_137812 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_137812 ) ( CLEAR ?auto_137811 ) ( ON-TABLE ?auto_137806 ) ( ON ?auto_137807 ?auto_137806 ) ( ON ?auto_137808 ?auto_137807 ) ( ON ?auto_137809 ?auto_137808 ) ( ON ?auto_137810 ?auto_137809 ) ( ON ?auto_137811 ?auto_137810 ) ( not ( = ?auto_137806 ?auto_137807 ) ) ( not ( = ?auto_137806 ?auto_137808 ) ) ( not ( = ?auto_137806 ?auto_137809 ) ) ( not ( = ?auto_137806 ?auto_137810 ) ) ( not ( = ?auto_137806 ?auto_137811 ) ) ( not ( = ?auto_137806 ?auto_137812 ) ) ( not ( = ?auto_137807 ?auto_137808 ) ) ( not ( = ?auto_137807 ?auto_137809 ) ) ( not ( = ?auto_137807 ?auto_137810 ) ) ( not ( = ?auto_137807 ?auto_137811 ) ) ( not ( = ?auto_137807 ?auto_137812 ) ) ( not ( = ?auto_137808 ?auto_137809 ) ) ( not ( = ?auto_137808 ?auto_137810 ) ) ( not ( = ?auto_137808 ?auto_137811 ) ) ( not ( = ?auto_137808 ?auto_137812 ) ) ( not ( = ?auto_137809 ?auto_137810 ) ) ( not ( = ?auto_137809 ?auto_137811 ) ) ( not ( = ?auto_137809 ?auto_137812 ) ) ( not ( = ?auto_137810 ?auto_137811 ) ) ( not ( = ?auto_137810 ?auto_137812 ) ) ( not ( = ?auto_137811 ?auto_137812 ) ) )
    :subtasks
    ( ( !STACK ?auto_137812 ?auto_137811 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137813 - BLOCK
      ?auto_137814 - BLOCK
      ?auto_137815 - BLOCK
      ?auto_137816 - BLOCK
      ?auto_137817 - BLOCK
      ?auto_137818 - BLOCK
      ?auto_137819 - BLOCK
    )
    :vars
    (
      ?auto_137820 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_137818 ) ( ON-TABLE ?auto_137813 ) ( ON ?auto_137814 ?auto_137813 ) ( ON ?auto_137815 ?auto_137814 ) ( ON ?auto_137816 ?auto_137815 ) ( ON ?auto_137817 ?auto_137816 ) ( ON ?auto_137818 ?auto_137817 ) ( not ( = ?auto_137813 ?auto_137814 ) ) ( not ( = ?auto_137813 ?auto_137815 ) ) ( not ( = ?auto_137813 ?auto_137816 ) ) ( not ( = ?auto_137813 ?auto_137817 ) ) ( not ( = ?auto_137813 ?auto_137818 ) ) ( not ( = ?auto_137813 ?auto_137819 ) ) ( not ( = ?auto_137814 ?auto_137815 ) ) ( not ( = ?auto_137814 ?auto_137816 ) ) ( not ( = ?auto_137814 ?auto_137817 ) ) ( not ( = ?auto_137814 ?auto_137818 ) ) ( not ( = ?auto_137814 ?auto_137819 ) ) ( not ( = ?auto_137815 ?auto_137816 ) ) ( not ( = ?auto_137815 ?auto_137817 ) ) ( not ( = ?auto_137815 ?auto_137818 ) ) ( not ( = ?auto_137815 ?auto_137819 ) ) ( not ( = ?auto_137816 ?auto_137817 ) ) ( not ( = ?auto_137816 ?auto_137818 ) ) ( not ( = ?auto_137816 ?auto_137819 ) ) ( not ( = ?auto_137817 ?auto_137818 ) ) ( not ( = ?auto_137817 ?auto_137819 ) ) ( not ( = ?auto_137818 ?auto_137819 ) ) ( ON ?auto_137819 ?auto_137820 ) ( CLEAR ?auto_137819 ) ( HAND-EMPTY ) ( not ( = ?auto_137813 ?auto_137820 ) ) ( not ( = ?auto_137814 ?auto_137820 ) ) ( not ( = ?auto_137815 ?auto_137820 ) ) ( not ( = ?auto_137816 ?auto_137820 ) ) ( not ( = ?auto_137817 ?auto_137820 ) ) ( not ( = ?auto_137818 ?auto_137820 ) ) ( not ( = ?auto_137819 ?auto_137820 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137819 ?auto_137820 )
      ( MAKE-7PILE ?auto_137813 ?auto_137814 ?auto_137815 ?auto_137816 ?auto_137817 ?auto_137818 ?auto_137819 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137821 - BLOCK
      ?auto_137822 - BLOCK
      ?auto_137823 - BLOCK
      ?auto_137824 - BLOCK
      ?auto_137825 - BLOCK
      ?auto_137826 - BLOCK
      ?auto_137827 - BLOCK
    )
    :vars
    (
      ?auto_137828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137821 ) ( ON ?auto_137822 ?auto_137821 ) ( ON ?auto_137823 ?auto_137822 ) ( ON ?auto_137824 ?auto_137823 ) ( ON ?auto_137825 ?auto_137824 ) ( not ( = ?auto_137821 ?auto_137822 ) ) ( not ( = ?auto_137821 ?auto_137823 ) ) ( not ( = ?auto_137821 ?auto_137824 ) ) ( not ( = ?auto_137821 ?auto_137825 ) ) ( not ( = ?auto_137821 ?auto_137826 ) ) ( not ( = ?auto_137821 ?auto_137827 ) ) ( not ( = ?auto_137822 ?auto_137823 ) ) ( not ( = ?auto_137822 ?auto_137824 ) ) ( not ( = ?auto_137822 ?auto_137825 ) ) ( not ( = ?auto_137822 ?auto_137826 ) ) ( not ( = ?auto_137822 ?auto_137827 ) ) ( not ( = ?auto_137823 ?auto_137824 ) ) ( not ( = ?auto_137823 ?auto_137825 ) ) ( not ( = ?auto_137823 ?auto_137826 ) ) ( not ( = ?auto_137823 ?auto_137827 ) ) ( not ( = ?auto_137824 ?auto_137825 ) ) ( not ( = ?auto_137824 ?auto_137826 ) ) ( not ( = ?auto_137824 ?auto_137827 ) ) ( not ( = ?auto_137825 ?auto_137826 ) ) ( not ( = ?auto_137825 ?auto_137827 ) ) ( not ( = ?auto_137826 ?auto_137827 ) ) ( ON ?auto_137827 ?auto_137828 ) ( CLEAR ?auto_137827 ) ( not ( = ?auto_137821 ?auto_137828 ) ) ( not ( = ?auto_137822 ?auto_137828 ) ) ( not ( = ?auto_137823 ?auto_137828 ) ) ( not ( = ?auto_137824 ?auto_137828 ) ) ( not ( = ?auto_137825 ?auto_137828 ) ) ( not ( = ?auto_137826 ?auto_137828 ) ) ( not ( = ?auto_137827 ?auto_137828 ) ) ( HOLDING ?auto_137826 ) ( CLEAR ?auto_137825 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137821 ?auto_137822 ?auto_137823 ?auto_137824 ?auto_137825 ?auto_137826 )
      ( MAKE-7PILE ?auto_137821 ?auto_137822 ?auto_137823 ?auto_137824 ?auto_137825 ?auto_137826 ?auto_137827 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137829 - BLOCK
      ?auto_137830 - BLOCK
      ?auto_137831 - BLOCK
      ?auto_137832 - BLOCK
      ?auto_137833 - BLOCK
      ?auto_137834 - BLOCK
      ?auto_137835 - BLOCK
    )
    :vars
    (
      ?auto_137836 - BLOCK
      ?auto_137837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137829 ) ( ON ?auto_137830 ?auto_137829 ) ( ON ?auto_137831 ?auto_137830 ) ( ON ?auto_137832 ?auto_137831 ) ( ON ?auto_137833 ?auto_137832 ) ( not ( = ?auto_137829 ?auto_137830 ) ) ( not ( = ?auto_137829 ?auto_137831 ) ) ( not ( = ?auto_137829 ?auto_137832 ) ) ( not ( = ?auto_137829 ?auto_137833 ) ) ( not ( = ?auto_137829 ?auto_137834 ) ) ( not ( = ?auto_137829 ?auto_137835 ) ) ( not ( = ?auto_137830 ?auto_137831 ) ) ( not ( = ?auto_137830 ?auto_137832 ) ) ( not ( = ?auto_137830 ?auto_137833 ) ) ( not ( = ?auto_137830 ?auto_137834 ) ) ( not ( = ?auto_137830 ?auto_137835 ) ) ( not ( = ?auto_137831 ?auto_137832 ) ) ( not ( = ?auto_137831 ?auto_137833 ) ) ( not ( = ?auto_137831 ?auto_137834 ) ) ( not ( = ?auto_137831 ?auto_137835 ) ) ( not ( = ?auto_137832 ?auto_137833 ) ) ( not ( = ?auto_137832 ?auto_137834 ) ) ( not ( = ?auto_137832 ?auto_137835 ) ) ( not ( = ?auto_137833 ?auto_137834 ) ) ( not ( = ?auto_137833 ?auto_137835 ) ) ( not ( = ?auto_137834 ?auto_137835 ) ) ( ON ?auto_137835 ?auto_137836 ) ( not ( = ?auto_137829 ?auto_137836 ) ) ( not ( = ?auto_137830 ?auto_137836 ) ) ( not ( = ?auto_137831 ?auto_137836 ) ) ( not ( = ?auto_137832 ?auto_137836 ) ) ( not ( = ?auto_137833 ?auto_137836 ) ) ( not ( = ?auto_137834 ?auto_137836 ) ) ( not ( = ?auto_137835 ?auto_137836 ) ) ( CLEAR ?auto_137833 ) ( ON ?auto_137834 ?auto_137835 ) ( CLEAR ?auto_137834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137837 ) ( ON ?auto_137836 ?auto_137837 ) ( not ( = ?auto_137837 ?auto_137836 ) ) ( not ( = ?auto_137837 ?auto_137835 ) ) ( not ( = ?auto_137837 ?auto_137834 ) ) ( not ( = ?auto_137829 ?auto_137837 ) ) ( not ( = ?auto_137830 ?auto_137837 ) ) ( not ( = ?auto_137831 ?auto_137837 ) ) ( not ( = ?auto_137832 ?auto_137837 ) ) ( not ( = ?auto_137833 ?auto_137837 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137837 ?auto_137836 ?auto_137835 )
      ( MAKE-7PILE ?auto_137829 ?auto_137830 ?auto_137831 ?auto_137832 ?auto_137833 ?auto_137834 ?auto_137835 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137838 - BLOCK
      ?auto_137839 - BLOCK
      ?auto_137840 - BLOCK
      ?auto_137841 - BLOCK
      ?auto_137842 - BLOCK
      ?auto_137843 - BLOCK
      ?auto_137844 - BLOCK
    )
    :vars
    (
      ?auto_137846 - BLOCK
      ?auto_137845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137838 ) ( ON ?auto_137839 ?auto_137838 ) ( ON ?auto_137840 ?auto_137839 ) ( ON ?auto_137841 ?auto_137840 ) ( not ( = ?auto_137838 ?auto_137839 ) ) ( not ( = ?auto_137838 ?auto_137840 ) ) ( not ( = ?auto_137838 ?auto_137841 ) ) ( not ( = ?auto_137838 ?auto_137842 ) ) ( not ( = ?auto_137838 ?auto_137843 ) ) ( not ( = ?auto_137838 ?auto_137844 ) ) ( not ( = ?auto_137839 ?auto_137840 ) ) ( not ( = ?auto_137839 ?auto_137841 ) ) ( not ( = ?auto_137839 ?auto_137842 ) ) ( not ( = ?auto_137839 ?auto_137843 ) ) ( not ( = ?auto_137839 ?auto_137844 ) ) ( not ( = ?auto_137840 ?auto_137841 ) ) ( not ( = ?auto_137840 ?auto_137842 ) ) ( not ( = ?auto_137840 ?auto_137843 ) ) ( not ( = ?auto_137840 ?auto_137844 ) ) ( not ( = ?auto_137841 ?auto_137842 ) ) ( not ( = ?auto_137841 ?auto_137843 ) ) ( not ( = ?auto_137841 ?auto_137844 ) ) ( not ( = ?auto_137842 ?auto_137843 ) ) ( not ( = ?auto_137842 ?auto_137844 ) ) ( not ( = ?auto_137843 ?auto_137844 ) ) ( ON ?auto_137844 ?auto_137846 ) ( not ( = ?auto_137838 ?auto_137846 ) ) ( not ( = ?auto_137839 ?auto_137846 ) ) ( not ( = ?auto_137840 ?auto_137846 ) ) ( not ( = ?auto_137841 ?auto_137846 ) ) ( not ( = ?auto_137842 ?auto_137846 ) ) ( not ( = ?auto_137843 ?auto_137846 ) ) ( not ( = ?auto_137844 ?auto_137846 ) ) ( ON ?auto_137843 ?auto_137844 ) ( CLEAR ?auto_137843 ) ( ON-TABLE ?auto_137845 ) ( ON ?auto_137846 ?auto_137845 ) ( not ( = ?auto_137845 ?auto_137846 ) ) ( not ( = ?auto_137845 ?auto_137844 ) ) ( not ( = ?auto_137845 ?auto_137843 ) ) ( not ( = ?auto_137838 ?auto_137845 ) ) ( not ( = ?auto_137839 ?auto_137845 ) ) ( not ( = ?auto_137840 ?auto_137845 ) ) ( not ( = ?auto_137841 ?auto_137845 ) ) ( not ( = ?auto_137842 ?auto_137845 ) ) ( HOLDING ?auto_137842 ) ( CLEAR ?auto_137841 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137838 ?auto_137839 ?auto_137840 ?auto_137841 ?auto_137842 )
      ( MAKE-7PILE ?auto_137838 ?auto_137839 ?auto_137840 ?auto_137841 ?auto_137842 ?auto_137843 ?auto_137844 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137847 - BLOCK
      ?auto_137848 - BLOCK
      ?auto_137849 - BLOCK
      ?auto_137850 - BLOCK
      ?auto_137851 - BLOCK
      ?auto_137852 - BLOCK
      ?auto_137853 - BLOCK
    )
    :vars
    (
      ?auto_137855 - BLOCK
      ?auto_137854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137847 ) ( ON ?auto_137848 ?auto_137847 ) ( ON ?auto_137849 ?auto_137848 ) ( ON ?auto_137850 ?auto_137849 ) ( not ( = ?auto_137847 ?auto_137848 ) ) ( not ( = ?auto_137847 ?auto_137849 ) ) ( not ( = ?auto_137847 ?auto_137850 ) ) ( not ( = ?auto_137847 ?auto_137851 ) ) ( not ( = ?auto_137847 ?auto_137852 ) ) ( not ( = ?auto_137847 ?auto_137853 ) ) ( not ( = ?auto_137848 ?auto_137849 ) ) ( not ( = ?auto_137848 ?auto_137850 ) ) ( not ( = ?auto_137848 ?auto_137851 ) ) ( not ( = ?auto_137848 ?auto_137852 ) ) ( not ( = ?auto_137848 ?auto_137853 ) ) ( not ( = ?auto_137849 ?auto_137850 ) ) ( not ( = ?auto_137849 ?auto_137851 ) ) ( not ( = ?auto_137849 ?auto_137852 ) ) ( not ( = ?auto_137849 ?auto_137853 ) ) ( not ( = ?auto_137850 ?auto_137851 ) ) ( not ( = ?auto_137850 ?auto_137852 ) ) ( not ( = ?auto_137850 ?auto_137853 ) ) ( not ( = ?auto_137851 ?auto_137852 ) ) ( not ( = ?auto_137851 ?auto_137853 ) ) ( not ( = ?auto_137852 ?auto_137853 ) ) ( ON ?auto_137853 ?auto_137855 ) ( not ( = ?auto_137847 ?auto_137855 ) ) ( not ( = ?auto_137848 ?auto_137855 ) ) ( not ( = ?auto_137849 ?auto_137855 ) ) ( not ( = ?auto_137850 ?auto_137855 ) ) ( not ( = ?auto_137851 ?auto_137855 ) ) ( not ( = ?auto_137852 ?auto_137855 ) ) ( not ( = ?auto_137853 ?auto_137855 ) ) ( ON ?auto_137852 ?auto_137853 ) ( ON-TABLE ?auto_137854 ) ( ON ?auto_137855 ?auto_137854 ) ( not ( = ?auto_137854 ?auto_137855 ) ) ( not ( = ?auto_137854 ?auto_137853 ) ) ( not ( = ?auto_137854 ?auto_137852 ) ) ( not ( = ?auto_137847 ?auto_137854 ) ) ( not ( = ?auto_137848 ?auto_137854 ) ) ( not ( = ?auto_137849 ?auto_137854 ) ) ( not ( = ?auto_137850 ?auto_137854 ) ) ( not ( = ?auto_137851 ?auto_137854 ) ) ( CLEAR ?auto_137850 ) ( ON ?auto_137851 ?auto_137852 ) ( CLEAR ?auto_137851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137854 ?auto_137855 ?auto_137853 ?auto_137852 )
      ( MAKE-7PILE ?auto_137847 ?auto_137848 ?auto_137849 ?auto_137850 ?auto_137851 ?auto_137852 ?auto_137853 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137856 - BLOCK
      ?auto_137857 - BLOCK
      ?auto_137858 - BLOCK
      ?auto_137859 - BLOCK
      ?auto_137860 - BLOCK
      ?auto_137861 - BLOCK
      ?auto_137862 - BLOCK
    )
    :vars
    (
      ?auto_137864 - BLOCK
      ?auto_137863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137856 ) ( ON ?auto_137857 ?auto_137856 ) ( ON ?auto_137858 ?auto_137857 ) ( not ( = ?auto_137856 ?auto_137857 ) ) ( not ( = ?auto_137856 ?auto_137858 ) ) ( not ( = ?auto_137856 ?auto_137859 ) ) ( not ( = ?auto_137856 ?auto_137860 ) ) ( not ( = ?auto_137856 ?auto_137861 ) ) ( not ( = ?auto_137856 ?auto_137862 ) ) ( not ( = ?auto_137857 ?auto_137858 ) ) ( not ( = ?auto_137857 ?auto_137859 ) ) ( not ( = ?auto_137857 ?auto_137860 ) ) ( not ( = ?auto_137857 ?auto_137861 ) ) ( not ( = ?auto_137857 ?auto_137862 ) ) ( not ( = ?auto_137858 ?auto_137859 ) ) ( not ( = ?auto_137858 ?auto_137860 ) ) ( not ( = ?auto_137858 ?auto_137861 ) ) ( not ( = ?auto_137858 ?auto_137862 ) ) ( not ( = ?auto_137859 ?auto_137860 ) ) ( not ( = ?auto_137859 ?auto_137861 ) ) ( not ( = ?auto_137859 ?auto_137862 ) ) ( not ( = ?auto_137860 ?auto_137861 ) ) ( not ( = ?auto_137860 ?auto_137862 ) ) ( not ( = ?auto_137861 ?auto_137862 ) ) ( ON ?auto_137862 ?auto_137864 ) ( not ( = ?auto_137856 ?auto_137864 ) ) ( not ( = ?auto_137857 ?auto_137864 ) ) ( not ( = ?auto_137858 ?auto_137864 ) ) ( not ( = ?auto_137859 ?auto_137864 ) ) ( not ( = ?auto_137860 ?auto_137864 ) ) ( not ( = ?auto_137861 ?auto_137864 ) ) ( not ( = ?auto_137862 ?auto_137864 ) ) ( ON ?auto_137861 ?auto_137862 ) ( ON-TABLE ?auto_137863 ) ( ON ?auto_137864 ?auto_137863 ) ( not ( = ?auto_137863 ?auto_137864 ) ) ( not ( = ?auto_137863 ?auto_137862 ) ) ( not ( = ?auto_137863 ?auto_137861 ) ) ( not ( = ?auto_137856 ?auto_137863 ) ) ( not ( = ?auto_137857 ?auto_137863 ) ) ( not ( = ?auto_137858 ?auto_137863 ) ) ( not ( = ?auto_137859 ?auto_137863 ) ) ( not ( = ?auto_137860 ?auto_137863 ) ) ( ON ?auto_137860 ?auto_137861 ) ( CLEAR ?auto_137860 ) ( HOLDING ?auto_137859 ) ( CLEAR ?auto_137858 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137856 ?auto_137857 ?auto_137858 ?auto_137859 )
      ( MAKE-7PILE ?auto_137856 ?auto_137857 ?auto_137858 ?auto_137859 ?auto_137860 ?auto_137861 ?auto_137862 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137865 - BLOCK
      ?auto_137866 - BLOCK
      ?auto_137867 - BLOCK
      ?auto_137868 - BLOCK
      ?auto_137869 - BLOCK
      ?auto_137870 - BLOCK
      ?auto_137871 - BLOCK
    )
    :vars
    (
      ?auto_137873 - BLOCK
      ?auto_137872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137865 ) ( ON ?auto_137866 ?auto_137865 ) ( ON ?auto_137867 ?auto_137866 ) ( not ( = ?auto_137865 ?auto_137866 ) ) ( not ( = ?auto_137865 ?auto_137867 ) ) ( not ( = ?auto_137865 ?auto_137868 ) ) ( not ( = ?auto_137865 ?auto_137869 ) ) ( not ( = ?auto_137865 ?auto_137870 ) ) ( not ( = ?auto_137865 ?auto_137871 ) ) ( not ( = ?auto_137866 ?auto_137867 ) ) ( not ( = ?auto_137866 ?auto_137868 ) ) ( not ( = ?auto_137866 ?auto_137869 ) ) ( not ( = ?auto_137866 ?auto_137870 ) ) ( not ( = ?auto_137866 ?auto_137871 ) ) ( not ( = ?auto_137867 ?auto_137868 ) ) ( not ( = ?auto_137867 ?auto_137869 ) ) ( not ( = ?auto_137867 ?auto_137870 ) ) ( not ( = ?auto_137867 ?auto_137871 ) ) ( not ( = ?auto_137868 ?auto_137869 ) ) ( not ( = ?auto_137868 ?auto_137870 ) ) ( not ( = ?auto_137868 ?auto_137871 ) ) ( not ( = ?auto_137869 ?auto_137870 ) ) ( not ( = ?auto_137869 ?auto_137871 ) ) ( not ( = ?auto_137870 ?auto_137871 ) ) ( ON ?auto_137871 ?auto_137873 ) ( not ( = ?auto_137865 ?auto_137873 ) ) ( not ( = ?auto_137866 ?auto_137873 ) ) ( not ( = ?auto_137867 ?auto_137873 ) ) ( not ( = ?auto_137868 ?auto_137873 ) ) ( not ( = ?auto_137869 ?auto_137873 ) ) ( not ( = ?auto_137870 ?auto_137873 ) ) ( not ( = ?auto_137871 ?auto_137873 ) ) ( ON ?auto_137870 ?auto_137871 ) ( ON-TABLE ?auto_137872 ) ( ON ?auto_137873 ?auto_137872 ) ( not ( = ?auto_137872 ?auto_137873 ) ) ( not ( = ?auto_137872 ?auto_137871 ) ) ( not ( = ?auto_137872 ?auto_137870 ) ) ( not ( = ?auto_137865 ?auto_137872 ) ) ( not ( = ?auto_137866 ?auto_137872 ) ) ( not ( = ?auto_137867 ?auto_137872 ) ) ( not ( = ?auto_137868 ?auto_137872 ) ) ( not ( = ?auto_137869 ?auto_137872 ) ) ( ON ?auto_137869 ?auto_137870 ) ( CLEAR ?auto_137867 ) ( ON ?auto_137868 ?auto_137869 ) ( CLEAR ?auto_137868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137872 ?auto_137873 ?auto_137871 ?auto_137870 ?auto_137869 )
      ( MAKE-7PILE ?auto_137865 ?auto_137866 ?auto_137867 ?auto_137868 ?auto_137869 ?auto_137870 ?auto_137871 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137874 - BLOCK
      ?auto_137875 - BLOCK
      ?auto_137876 - BLOCK
      ?auto_137877 - BLOCK
      ?auto_137878 - BLOCK
      ?auto_137879 - BLOCK
      ?auto_137880 - BLOCK
    )
    :vars
    (
      ?auto_137881 - BLOCK
      ?auto_137882 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137874 ) ( ON ?auto_137875 ?auto_137874 ) ( not ( = ?auto_137874 ?auto_137875 ) ) ( not ( = ?auto_137874 ?auto_137876 ) ) ( not ( = ?auto_137874 ?auto_137877 ) ) ( not ( = ?auto_137874 ?auto_137878 ) ) ( not ( = ?auto_137874 ?auto_137879 ) ) ( not ( = ?auto_137874 ?auto_137880 ) ) ( not ( = ?auto_137875 ?auto_137876 ) ) ( not ( = ?auto_137875 ?auto_137877 ) ) ( not ( = ?auto_137875 ?auto_137878 ) ) ( not ( = ?auto_137875 ?auto_137879 ) ) ( not ( = ?auto_137875 ?auto_137880 ) ) ( not ( = ?auto_137876 ?auto_137877 ) ) ( not ( = ?auto_137876 ?auto_137878 ) ) ( not ( = ?auto_137876 ?auto_137879 ) ) ( not ( = ?auto_137876 ?auto_137880 ) ) ( not ( = ?auto_137877 ?auto_137878 ) ) ( not ( = ?auto_137877 ?auto_137879 ) ) ( not ( = ?auto_137877 ?auto_137880 ) ) ( not ( = ?auto_137878 ?auto_137879 ) ) ( not ( = ?auto_137878 ?auto_137880 ) ) ( not ( = ?auto_137879 ?auto_137880 ) ) ( ON ?auto_137880 ?auto_137881 ) ( not ( = ?auto_137874 ?auto_137881 ) ) ( not ( = ?auto_137875 ?auto_137881 ) ) ( not ( = ?auto_137876 ?auto_137881 ) ) ( not ( = ?auto_137877 ?auto_137881 ) ) ( not ( = ?auto_137878 ?auto_137881 ) ) ( not ( = ?auto_137879 ?auto_137881 ) ) ( not ( = ?auto_137880 ?auto_137881 ) ) ( ON ?auto_137879 ?auto_137880 ) ( ON-TABLE ?auto_137882 ) ( ON ?auto_137881 ?auto_137882 ) ( not ( = ?auto_137882 ?auto_137881 ) ) ( not ( = ?auto_137882 ?auto_137880 ) ) ( not ( = ?auto_137882 ?auto_137879 ) ) ( not ( = ?auto_137874 ?auto_137882 ) ) ( not ( = ?auto_137875 ?auto_137882 ) ) ( not ( = ?auto_137876 ?auto_137882 ) ) ( not ( = ?auto_137877 ?auto_137882 ) ) ( not ( = ?auto_137878 ?auto_137882 ) ) ( ON ?auto_137878 ?auto_137879 ) ( ON ?auto_137877 ?auto_137878 ) ( CLEAR ?auto_137877 ) ( HOLDING ?auto_137876 ) ( CLEAR ?auto_137875 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137874 ?auto_137875 ?auto_137876 )
      ( MAKE-7PILE ?auto_137874 ?auto_137875 ?auto_137876 ?auto_137877 ?auto_137878 ?auto_137879 ?auto_137880 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137883 - BLOCK
      ?auto_137884 - BLOCK
      ?auto_137885 - BLOCK
      ?auto_137886 - BLOCK
      ?auto_137887 - BLOCK
      ?auto_137888 - BLOCK
      ?auto_137889 - BLOCK
    )
    :vars
    (
      ?auto_137891 - BLOCK
      ?auto_137890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137883 ) ( ON ?auto_137884 ?auto_137883 ) ( not ( = ?auto_137883 ?auto_137884 ) ) ( not ( = ?auto_137883 ?auto_137885 ) ) ( not ( = ?auto_137883 ?auto_137886 ) ) ( not ( = ?auto_137883 ?auto_137887 ) ) ( not ( = ?auto_137883 ?auto_137888 ) ) ( not ( = ?auto_137883 ?auto_137889 ) ) ( not ( = ?auto_137884 ?auto_137885 ) ) ( not ( = ?auto_137884 ?auto_137886 ) ) ( not ( = ?auto_137884 ?auto_137887 ) ) ( not ( = ?auto_137884 ?auto_137888 ) ) ( not ( = ?auto_137884 ?auto_137889 ) ) ( not ( = ?auto_137885 ?auto_137886 ) ) ( not ( = ?auto_137885 ?auto_137887 ) ) ( not ( = ?auto_137885 ?auto_137888 ) ) ( not ( = ?auto_137885 ?auto_137889 ) ) ( not ( = ?auto_137886 ?auto_137887 ) ) ( not ( = ?auto_137886 ?auto_137888 ) ) ( not ( = ?auto_137886 ?auto_137889 ) ) ( not ( = ?auto_137887 ?auto_137888 ) ) ( not ( = ?auto_137887 ?auto_137889 ) ) ( not ( = ?auto_137888 ?auto_137889 ) ) ( ON ?auto_137889 ?auto_137891 ) ( not ( = ?auto_137883 ?auto_137891 ) ) ( not ( = ?auto_137884 ?auto_137891 ) ) ( not ( = ?auto_137885 ?auto_137891 ) ) ( not ( = ?auto_137886 ?auto_137891 ) ) ( not ( = ?auto_137887 ?auto_137891 ) ) ( not ( = ?auto_137888 ?auto_137891 ) ) ( not ( = ?auto_137889 ?auto_137891 ) ) ( ON ?auto_137888 ?auto_137889 ) ( ON-TABLE ?auto_137890 ) ( ON ?auto_137891 ?auto_137890 ) ( not ( = ?auto_137890 ?auto_137891 ) ) ( not ( = ?auto_137890 ?auto_137889 ) ) ( not ( = ?auto_137890 ?auto_137888 ) ) ( not ( = ?auto_137883 ?auto_137890 ) ) ( not ( = ?auto_137884 ?auto_137890 ) ) ( not ( = ?auto_137885 ?auto_137890 ) ) ( not ( = ?auto_137886 ?auto_137890 ) ) ( not ( = ?auto_137887 ?auto_137890 ) ) ( ON ?auto_137887 ?auto_137888 ) ( ON ?auto_137886 ?auto_137887 ) ( CLEAR ?auto_137884 ) ( ON ?auto_137885 ?auto_137886 ) ( CLEAR ?auto_137885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137890 ?auto_137891 ?auto_137889 ?auto_137888 ?auto_137887 ?auto_137886 )
      ( MAKE-7PILE ?auto_137883 ?auto_137884 ?auto_137885 ?auto_137886 ?auto_137887 ?auto_137888 ?auto_137889 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137892 - BLOCK
      ?auto_137893 - BLOCK
      ?auto_137894 - BLOCK
      ?auto_137895 - BLOCK
      ?auto_137896 - BLOCK
      ?auto_137897 - BLOCK
      ?auto_137898 - BLOCK
    )
    :vars
    (
      ?auto_137900 - BLOCK
      ?auto_137899 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137892 ) ( not ( = ?auto_137892 ?auto_137893 ) ) ( not ( = ?auto_137892 ?auto_137894 ) ) ( not ( = ?auto_137892 ?auto_137895 ) ) ( not ( = ?auto_137892 ?auto_137896 ) ) ( not ( = ?auto_137892 ?auto_137897 ) ) ( not ( = ?auto_137892 ?auto_137898 ) ) ( not ( = ?auto_137893 ?auto_137894 ) ) ( not ( = ?auto_137893 ?auto_137895 ) ) ( not ( = ?auto_137893 ?auto_137896 ) ) ( not ( = ?auto_137893 ?auto_137897 ) ) ( not ( = ?auto_137893 ?auto_137898 ) ) ( not ( = ?auto_137894 ?auto_137895 ) ) ( not ( = ?auto_137894 ?auto_137896 ) ) ( not ( = ?auto_137894 ?auto_137897 ) ) ( not ( = ?auto_137894 ?auto_137898 ) ) ( not ( = ?auto_137895 ?auto_137896 ) ) ( not ( = ?auto_137895 ?auto_137897 ) ) ( not ( = ?auto_137895 ?auto_137898 ) ) ( not ( = ?auto_137896 ?auto_137897 ) ) ( not ( = ?auto_137896 ?auto_137898 ) ) ( not ( = ?auto_137897 ?auto_137898 ) ) ( ON ?auto_137898 ?auto_137900 ) ( not ( = ?auto_137892 ?auto_137900 ) ) ( not ( = ?auto_137893 ?auto_137900 ) ) ( not ( = ?auto_137894 ?auto_137900 ) ) ( not ( = ?auto_137895 ?auto_137900 ) ) ( not ( = ?auto_137896 ?auto_137900 ) ) ( not ( = ?auto_137897 ?auto_137900 ) ) ( not ( = ?auto_137898 ?auto_137900 ) ) ( ON ?auto_137897 ?auto_137898 ) ( ON-TABLE ?auto_137899 ) ( ON ?auto_137900 ?auto_137899 ) ( not ( = ?auto_137899 ?auto_137900 ) ) ( not ( = ?auto_137899 ?auto_137898 ) ) ( not ( = ?auto_137899 ?auto_137897 ) ) ( not ( = ?auto_137892 ?auto_137899 ) ) ( not ( = ?auto_137893 ?auto_137899 ) ) ( not ( = ?auto_137894 ?auto_137899 ) ) ( not ( = ?auto_137895 ?auto_137899 ) ) ( not ( = ?auto_137896 ?auto_137899 ) ) ( ON ?auto_137896 ?auto_137897 ) ( ON ?auto_137895 ?auto_137896 ) ( ON ?auto_137894 ?auto_137895 ) ( CLEAR ?auto_137894 ) ( HOLDING ?auto_137893 ) ( CLEAR ?auto_137892 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137892 ?auto_137893 )
      ( MAKE-7PILE ?auto_137892 ?auto_137893 ?auto_137894 ?auto_137895 ?auto_137896 ?auto_137897 ?auto_137898 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137901 - BLOCK
      ?auto_137902 - BLOCK
      ?auto_137903 - BLOCK
      ?auto_137904 - BLOCK
      ?auto_137905 - BLOCK
      ?auto_137906 - BLOCK
      ?auto_137907 - BLOCK
    )
    :vars
    (
      ?auto_137909 - BLOCK
      ?auto_137908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137901 ) ( not ( = ?auto_137901 ?auto_137902 ) ) ( not ( = ?auto_137901 ?auto_137903 ) ) ( not ( = ?auto_137901 ?auto_137904 ) ) ( not ( = ?auto_137901 ?auto_137905 ) ) ( not ( = ?auto_137901 ?auto_137906 ) ) ( not ( = ?auto_137901 ?auto_137907 ) ) ( not ( = ?auto_137902 ?auto_137903 ) ) ( not ( = ?auto_137902 ?auto_137904 ) ) ( not ( = ?auto_137902 ?auto_137905 ) ) ( not ( = ?auto_137902 ?auto_137906 ) ) ( not ( = ?auto_137902 ?auto_137907 ) ) ( not ( = ?auto_137903 ?auto_137904 ) ) ( not ( = ?auto_137903 ?auto_137905 ) ) ( not ( = ?auto_137903 ?auto_137906 ) ) ( not ( = ?auto_137903 ?auto_137907 ) ) ( not ( = ?auto_137904 ?auto_137905 ) ) ( not ( = ?auto_137904 ?auto_137906 ) ) ( not ( = ?auto_137904 ?auto_137907 ) ) ( not ( = ?auto_137905 ?auto_137906 ) ) ( not ( = ?auto_137905 ?auto_137907 ) ) ( not ( = ?auto_137906 ?auto_137907 ) ) ( ON ?auto_137907 ?auto_137909 ) ( not ( = ?auto_137901 ?auto_137909 ) ) ( not ( = ?auto_137902 ?auto_137909 ) ) ( not ( = ?auto_137903 ?auto_137909 ) ) ( not ( = ?auto_137904 ?auto_137909 ) ) ( not ( = ?auto_137905 ?auto_137909 ) ) ( not ( = ?auto_137906 ?auto_137909 ) ) ( not ( = ?auto_137907 ?auto_137909 ) ) ( ON ?auto_137906 ?auto_137907 ) ( ON-TABLE ?auto_137908 ) ( ON ?auto_137909 ?auto_137908 ) ( not ( = ?auto_137908 ?auto_137909 ) ) ( not ( = ?auto_137908 ?auto_137907 ) ) ( not ( = ?auto_137908 ?auto_137906 ) ) ( not ( = ?auto_137901 ?auto_137908 ) ) ( not ( = ?auto_137902 ?auto_137908 ) ) ( not ( = ?auto_137903 ?auto_137908 ) ) ( not ( = ?auto_137904 ?auto_137908 ) ) ( not ( = ?auto_137905 ?auto_137908 ) ) ( ON ?auto_137905 ?auto_137906 ) ( ON ?auto_137904 ?auto_137905 ) ( ON ?auto_137903 ?auto_137904 ) ( CLEAR ?auto_137901 ) ( ON ?auto_137902 ?auto_137903 ) ( CLEAR ?auto_137902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137908 ?auto_137909 ?auto_137907 ?auto_137906 ?auto_137905 ?auto_137904 ?auto_137903 )
      ( MAKE-7PILE ?auto_137901 ?auto_137902 ?auto_137903 ?auto_137904 ?auto_137905 ?auto_137906 ?auto_137907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137910 - BLOCK
      ?auto_137911 - BLOCK
      ?auto_137912 - BLOCK
      ?auto_137913 - BLOCK
      ?auto_137914 - BLOCK
      ?auto_137915 - BLOCK
      ?auto_137916 - BLOCK
    )
    :vars
    (
      ?auto_137918 - BLOCK
      ?auto_137917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137910 ?auto_137911 ) ) ( not ( = ?auto_137910 ?auto_137912 ) ) ( not ( = ?auto_137910 ?auto_137913 ) ) ( not ( = ?auto_137910 ?auto_137914 ) ) ( not ( = ?auto_137910 ?auto_137915 ) ) ( not ( = ?auto_137910 ?auto_137916 ) ) ( not ( = ?auto_137911 ?auto_137912 ) ) ( not ( = ?auto_137911 ?auto_137913 ) ) ( not ( = ?auto_137911 ?auto_137914 ) ) ( not ( = ?auto_137911 ?auto_137915 ) ) ( not ( = ?auto_137911 ?auto_137916 ) ) ( not ( = ?auto_137912 ?auto_137913 ) ) ( not ( = ?auto_137912 ?auto_137914 ) ) ( not ( = ?auto_137912 ?auto_137915 ) ) ( not ( = ?auto_137912 ?auto_137916 ) ) ( not ( = ?auto_137913 ?auto_137914 ) ) ( not ( = ?auto_137913 ?auto_137915 ) ) ( not ( = ?auto_137913 ?auto_137916 ) ) ( not ( = ?auto_137914 ?auto_137915 ) ) ( not ( = ?auto_137914 ?auto_137916 ) ) ( not ( = ?auto_137915 ?auto_137916 ) ) ( ON ?auto_137916 ?auto_137918 ) ( not ( = ?auto_137910 ?auto_137918 ) ) ( not ( = ?auto_137911 ?auto_137918 ) ) ( not ( = ?auto_137912 ?auto_137918 ) ) ( not ( = ?auto_137913 ?auto_137918 ) ) ( not ( = ?auto_137914 ?auto_137918 ) ) ( not ( = ?auto_137915 ?auto_137918 ) ) ( not ( = ?auto_137916 ?auto_137918 ) ) ( ON ?auto_137915 ?auto_137916 ) ( ON-TABLE ?auto_137917 ) ( ON ?auto_137918 ?auto_137917 ) ( not ( = ?auto_137917 ?auto_137918 ) ) ( not ( = ?auto_137917 ?auto_137916 ) ) ( not ( = ?auto_137917 ?auto_137915 ) ) ( not ( = ?auto_137910 ?auto_137917 ) ) ( not ( = ?auto_137911 ?auto_137917 ) ) ( not ( = ?auto_137912 ?auto_137917 ) ) ( not ( = ?auto_137913 ?auto_137917 ) ) ( not ( = ?auto_137914 ?auto_137917 ) ) ( ON ?auto_137914 ?auto_137915 ) ( ON ?auto_137913 ?auto_137914 ) ( ON ?auto_137912 ?auto_137913 ) ( ON ?auto_137911 ?auto_137912 ) ( CLEAR ?auto_137911 ) ( HOLDING ?auto_137910 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137910 )
      ( MAKE-7PILE ?auto_137910 ?auto_137911 ?auto_137912 ?auto_137913 ?auto_137914 ?auto_137915 ?auto_137916 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_137919 - BLOCK
      ?auto_137920 - BLOCK
      ?auto_137921 - BLOCK
      ?auto_137922 - BLOCK
      ?auto_137923 - BLOCK
      ?auto_137924 - BLOCK
      ?auto_137925 - BLOCK
    )
    :vars
    (
      ?auto_137927 - BLOCK
      ?auto_137926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137919 ?auto_137920 ) ) ( not ( = ?auto_137919 ?auto_137921 ) ) ( not ( = ?auto_137919 ?auto_137922 ) ) ( not ( = ?auto_137919 ?auto_137923 ) ) ( not ( = ?auto_137919 ?auto_137924 ) ) ( not ( = ?auto_137919 ?auto_137925 ) ) ( not ( = ?auto_137920 ?auto_137921 ) ) ( not ( = ?auto_137920 ?auto_137922 ) ) ( not ( = ?auto_137920 ?auto_137923 ) ) ( not ( = ?auto_137920 ?auto_137924 ) ) ( not ( = ?auto_137920 ?auto_137925 ) ) ( not ( = ?auto_137921 ?auto_137922 ) ) ( not ( = ?auto_137921 ?auto_137923 ) ) ( not ( = ?auto_137921 ?auto_137924 ) ) ( not ( = ?auto_137921 ?auto_137925 ) ) ( not ( = ?auto_137922 ?auto_137923 ) ) ( not ( = ?auto_137922 ?auto_137924 ) ) ( not ( = ?auto_137922 ?auto_137925 ) ) ( not ( = ?auto_137923 ?auto_137924 ) ) ( not ( = ?auto_137923 ?auto_137925 ) ) ( not ( = ?auto_137924 ?auto_137925 ) ) ( ON ?auto_137925 ?auto_137927 ) ( not ( = ?auto_137919 ?auto_137927 ) ) ( not ( = ?auto_137920 ?auto_137927 ) ) ( not ( = ?auto_137921 ?auto_137927 ) ) ( not ( = ?auto_137922 ?auto_137927 ) ) ( not ( = ?auto_137923 ?auto_137927 ) ) ( not ( = ?auto_137924 ?auto_137927 ) ) ( not ( = ?auto_137925 ?auto_137927 ) ) ( ON ?auto_137924 ?auto_137925 ) ( ON-TABLE ?auto_137926 ) ( ON ?auto_137927 ?auto_137926 ) ( not ( = ?auto_137926 ?auto_137927 ) ) ( not ( = ?auto_137926 ?auto_137925 ) ) ( not ( = ?auto_137926 ?auto_137924 ) ) ( not ( = ?auto_137919 ?auto_137926 ) ) ( not ( = ?auto_137920 ?auto_137926 ) ) ( not ( = ?auto_137921 ?auto_137926 ) ) ( not ( = ?auto_137922 ?auto_137926 ) ) ( not ( = ?auto_137923 ?auto_137926 ) ) ( ON ?auto_137923 ?auto_137924 ) ( ON ?auto_137922 ?auto_137923 ) ( ON ?auto_137921 ?auto_137922 ) ( ON ?auto_137920 ?auto_137921 ) ( ON ?auto_137919 ?auto_137920 ) ( CLEAR ?auto_137919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137926 ?auto_137927 ?auto_137925 ?auto_137924 ?auto_137923 ?auto_137922 ?auto_137921 ?auto_137920 )
      ( MAKE-7PILE ?auto_137919 ?auto_137920 ?auto_137921 ?auto_137922 ?auto_137923 ?auto_137924 ?auto_137925 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137929 - BLOCK
    )
    :vars
    (
      ?auto_137930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137930 ?auto_137929 ) ( CLEAR ?auto_137930 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_137929 ) ( not ( = ?auto_137929 ?auto_137930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_137930 ?auto_137929 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137931 - BLOCK
    )
    :vars
    (
      ?auto_137932 - BLOCK
      ?auto_137933 - BLOCK
      ?auto_137934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137932 ?auto_137931 ) ( CLEAR ?auto_137932 ) ( ON-TABLE ?auto_137931 ) ( not ( = ?auto_137931 ?auto_137932 ) ) ( HOLDING ?auto_137933 ) ( CLEAR ?auto_137934 ) ( not ( = ?auto_137931 ?auto_137933 ) ) ( not ( = ?auto_137931 ?auto_137934 ) ) ( not ( = ?auto_137932 ?auto_137933 ) ) ( not ( = ?auto_137932 ?auto_137934 ) ) ( not ( = ?auto_137933 ?auto_137934 ) ) )
    :subtasks
    ( ( !STACK ?auto_137933 ?auto_137934 )
      ( MAKE-1PILE ?auto_137931 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137935 - BLOCK
    )
    :vars
    (
      ?auto_137936 - BLOCK
      ?auto_137937 - BLOCK
      ?auto_137938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137936 ?auto_137935 ) ( ON-TABLE ?auto_137935 ) ( not ( = ?auto_137935 ?auto_137936 ) ) ( CLEAR ?auto_137937 ) ( not ( = ?auto_137935 ?auto_137938 ) ) ( not ( = ?auto_137935 ?auto_137937 ) ) ( not ( = ?auto_137936 ?auto_137938 ) ) ( not ( = ?auto_137936 ?auto_137937 ) ) ( not ( = ?auto_137938 ?auto_137937 ) ) ( ON ?auto_137938 ?auto_137936 ) ( CLEAR ?auto_137938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137935 ?auto_137936 )
      ( MAKE-1PILE ?auto_137935 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137939 - BLOCK
    )
    :vars
    (
      ?auto_137941 - BLOCK
      ?auto_137942 - BLOCK
      ?auto_137940 - BLOCK
      ?auto_137945 - BLOCK
      ?auto_137944 - BLOCK
      ?auto_137947 - BLOCK
      ?auto_137943 - BLOCK
      ?auto_137946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137941 ?auto_137939 ) ( ON-TABLE ?auto_137939 ) ( not ( = ?auto_137939 ?auto_137941 ) ) ( not ( = ?auto_137939 ?auto_137942 ) ) ( not ( = ?auto_137939 ?auto_137940 ) ) ( not ( = ?auto_137941 ?auto_137942 ) ) ( not ( = ?auto_137941 ?auto_137940 ) ) ( not ( = ?auto_137942 ?auto_137940 ) ) ( ON ?auto_137942 ?auto_137941 ) ( CLEAR ?auto_137942 ) ( HOLDING ?auto_137940 ) ( CLEAR ?auto_137945 ) ( ON-TABLE ?auto_137944 ) ( ON ?auto_137947 ?auto_137944 ) ( ON ?auto_137943 ?auto_137947 ) ( ON ?auto_137946 ?auto_137943 ) ( ON ?auto_137945 ?auto_137946 ) ( not ( = ?auto_137944 ?auto_137947 ) ) ( not ( = ?auto_137944 ?auto_137943 ) ) ( not ( = ?auto_137944 ?auto_137946 ) ) ( not ( = ?auto_137944 ?auto_137945 ) ) ( not ( = ?auto_137944 ?auto_137940 ) ) ( not ( = ?auto_137947 ?auto_137943 ) ) ( not ( = ?auto_137947 ?auto_137946 ) ) ( not ( = ?auto_137947 ?auto_137945 ) ) ( not ( = ?auto_137947 ?auto_137940 ) ) ( not ( = ?auto_137943 ?auto_137946 ) ) ( not ( = ?auto_137943 ?auto_137945 ) ) ( not ( = ?auto_137943 ?auto_137940 ) ) ( not ( = ?auto_137946 ?auto_137945 ) ) ( not ( = ?auto_137946 ?auto_137940 ) ) ( not ( = ?auto_137945 ?auto_137940 ) ) ( not ( = ?auto_137939 ?auto_137945 ) ) ( not ( = ?auto_137939 ?auto_137944 ) ) ( not ( = ?auto_137939 ?auto_137947 ) ) ( not ( = ?auto_137939 ?auto_137943 ) ) ( not ( = ?auto_137939 ?auto_137946 ) ) ( not ( = ?auto_137941 ?auto_137945 ) ) ( not ( = ?auto_137941 ?auto_137944 ) ) ( not ( = ?auto_137941 ?auto_137947 ) ) ( not ( = ?auto_137941 ?auto_137943 ) ) ( not ( = ?auto_137941 ?auto_137946 ) ) ( not ( = ?auto_137942 ?auto_137945 ) ) ( not ( = ?auto_137942 ?auto_137944 ) ) ( not ( = ?auto_137942 ?auto_137947 ) ) ( not ( = ?auto_137942 ?auto_137943 ) ) ( not ( = ?auto_137942 ?auto_137946 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137944 ?auto_137947 ?auto_137943 ?auto_137946 ?auto_137945 ?auto_137940 )
      ( MAKE-1PILE ?auto_137939 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137948 - BLOCK
    )
    :vars
    (
      ?auto_137950 - BLOCK
      ?auto_137949 - BLOCK
      ?auto_137955 - BLOCK
      ?auto_137954 - BLOCK
      ?auto_137951 - BLOCK
      ?auto_137953 - BLOCK
      ?auto_137956 - BLOCK
      ?auto_137952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137950 ?auto_137948 ) ( ON-TABLE ?auto_137948 ) ( not ( = ?auto_137948 ?auto_137950 ) ) ( not ( = ?auto_137948 ?auto_137949 ) ) ( not ( = ?auto_137948 ?auto_137955 ) ) ( not ( = ?auto_137950 ?auto_137949 ) ) ( not ( = ?auto_137950 ?auto_137955 ) ) ( not ( = ?auto_137949 ?auto_137955 ) ) ( ON ?auto_137949 ?auto_137950 ) ( CLEAR ?auto_137954 ) ( ON-TABLE ?auto_137951 ) ( ON ?auto_137953 ?auto_137951 ) ( ON ?auto_137956 ?auto_137953 ) ( ON ?auto_137952 ?auto_137956 ) ( ON ?auto_137954 ?auto_137952 ) ( not ( = ?auto_137951 ?auto_137953 ) ) ( not ( = ?auto_137951 ?auto_137956 ) ) ( not ( = ?auto_137951 ?auto_137952 ) ) ( not ( = ?auto_137951 ?auto_137954 ) ) ( not ( = ?auto_137951 ?auto_137955 ) ) ( not ( = ?auto_137953 ?auto_137956 ) ) ( not ( = ?auto_137953 ?auto_137952 ) ) ( not ( = ?auto_137953 ?auto_137954 ) ) ( not ( = ?auto_137953 ?auto_137955 ) ) ( not ( = ?auto_137956 ?auto_137952 ) ) ( not ( = ?auto_137956 ?auto_137954 ) ) ( not ( = ?auto_137956 ?auto_137955 ) ) ( not ( = ?auto_137952 ?auto_137954 ) ) ( not ( = ?auto_137952 ?auto_137955 ) ) ( not ( = ?auto_137954 ?auto_137955 ) ) ( not ( = ?auto_137948 ?auto_137954 ) ) ( not ( = ?auto_137948 ?auto_137951 ) ) ( not ( = ?auto_137948 ?auto_137953 ) ) ( not ( = ?auto_137948 ?auto_137956 ) ) ( not ( = ?auto_137948 ?auto_137952 ) ) ( not ( = ?auto_137950 ?auto_137954 ) ) ( not ( = ?auto_137950 ?auto_137951 ) ) ( not ( = ?auto_137950 ?auto_137953 ) ) ( not ( = ?auto_137950 ?auto_137956 ) ) ( not ( = ?auto_137950 ?auto_137952 ) ) ( not ( = ?auto_137949 ?auto_137954 ) ) ( not ( = ?auto_137949 ?auto_137951 ) ) ( not ( = ?auto_137949 ?auto_137953 ) ) ( not ( = ?auto_137949 ?auto_137956 ) ) ( not ( = ?auto_137949 ?auto_137952 ) ) ( ON ?auto_137955 ?auto_137949 ) ( CLEAR ?auto_137955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137948 ?auto_137950 ?auto_137949 )
      ( MAKE-1PILE ?auto_137948 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137957 - BLOCK
    )
    :vars
    (
      ?auto_137961 - BLOCK
      ?auto_137964 - BLOCK
      ?auto_137965 - BLOCK
      ?auto_137960 - BLOCK
      ?auto_137962 - BLOCK
      ?auto_137958 - BLOCK
      ?auto_137959 - BLOCK
      ?auto_137963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137961 ?auto_137957 ) ( ON-TABLE ?auto_137957 ) ( not ( = ?auto_137957 ?auto_137961 ) ) ( not ( = ?auto_137957 ?auto_137964 ) ) ( not ( = ?auto_137957 ?auto_137965 ) ) ( not ( = ?auto_137961 ?auto_137964 ) ) ( not ( = ?auto_137961 ?auto_137965 ) ) ( not ( = ?auto_137964 ?auto_137965 ) ) ( ON ?auto_137964 ?auto_137961 ) ( ON-TABLE ?auto_137960 ) ( ON ?auto_137962 ?auto_137960 ) ( ON ?auto_137958 ?auto_137962 ) ( ON ?auto_137959 ?auto_137958 ) ( not ( = ?auto_137960 ?auto_137962 ) ) ( not ( = ?auto_137960 ?auto_137958 ) ) ( not ( = ?auto_137960 ?auto_137959 ) ) ( not ( = ?auto_137960 ?auto_137963 ) ) ( not ( = ?auto_137960 ?auto_137965 ) ) ( not ( = ?auto_137962 ?auto_137958 ) ) ( not ( = ?auto_137962 ?auto_137959 ) ) ( not ( = ?auto_137962 ?auto_137963 ) ) ( not ( = ?auto_137962 ?auto_137965 ) ) ( not ( = ?auto_137958 ?auto_137959 ) ) ( not ( = ?auto_137958 ?auto_137963 ) ) ( not ( = ?auto_137958 ?auto_137965 ) ) ( not ( = ?auto_137959 ?auto_137963 ) ) ( not ( = ?auto_137959 ?auto_137965 ) ) ( not ( = ?auto_137963 ?auto_137965 ) ) ( not ( = ?auto_137957 ?auto_137963 ) ) ( not ( = ?auto_137957 ?auto_137960 ) ) ( not ( = ?auto_137957 ?auto_137962 ) ) ( not ( = ?auto_137957 ?auto_137958 ) ) ( not ( = ?auto_137957 ?auto_137959 ) ) ( not ( = ?auto_137961 ?auto_137963 ) ) ( not ( = ?auto_137961 ?auto_137960 ) ) ( not ( = ?auto_137961 ?auto_137962 ) ) ( not ( = ?auto_137961 ?auto_137958 ) ) ( not ( = ?auto_137961 ?auto_137959 ) ) ( not ( = ?auto_137964 ?auto_137963 ) ) ( not ( = ?auto_137964 ?auto_137960 ) ) ( not ( = ?auto_137964 ?auto_137962 ) ) ( not ( = ?auto_137964 ?auto_137958 ) ) ( not ( = ?auto_137964 ?auto_137959 ) ) ( ON ?auto_137965 ?auto_137964 ) ( CLEAR ?auto_137965 ) ( HOLDING ?auto_137963 ) ( CLEAR ?auto_137959 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137960 ?auto_137962 ?auto_137958 ?auto_137959 ?auto_137963 )
      ( MAKE-1PILE ?auto_137957 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137966 - BLOCK
    )
    :vars
    (
      ?auto_137973 - BLOCK
      ?auto_137968 - BLOCK
      ?auto_137971 - BLOCK
      ?auto_137967 - BLOCK
      ?auto_137974 - BLOCK
      ?auto_137970 - BLOCK
      ?auto_137972 - BLOCK
      ?auto_137969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137973 ?auto_137966 ) ( ON-TABLE ?auto_137966 ) ( not ( = ?auto_137966 ?auto_137973 ) ) ( not ( = ?auto_137966 ?auto_137968 ) ) ( not ( = ?auto_137966 ?auto_137971 ) ) ( not ( = ?auto_137973 ?auto_137968 ) ) ( not ( = ?auto_137973 ?auto_137971 ) ) ( not ( = ?auto_137968 ?auto_137971 ) ) ( ON ?auto_137968 ?auto_137973 ) ( ON-TABLE ?auto_137967 ) ( ON ?auto_137974 ?auto_137967 ) ( ON ?auto_137970 ?auto_137974 ) ( ON ?auto_137972 ?auto_137970 ) ( not ( = ?auto_137967 ?auto_137974 ) ) ( not ( = ?auto_137967 ?auto_137970 ) ) ( not ( = ?auto_137967 ?auto_137972 ) ) ( not ( = ?auto_137967 ?auto_137969 ) ) ( not ( = ?auto_137967 ?auto_137971 ) ) ( not ( = ?auto_137974 ?auto_137970 ) ) ( not ( = ?auto_137974 ?auto_137972 ) ) ( not ( = ?auto_137974 ?auto_137969 ) ) ( not ( = ?auto_137974 ?auto_137971 ) ) ( not ( = ?auto_137970 ?auto_137972 ) ) ( not ( = ?auto_137970 ?auto_137969 ) ) ( not ( = ?auto_137970 ?auto_137971 ) ) ( not ( = ?auto_137972 ?auto_137969 ) ) ( not ( = ?auto_137972 ?auto_137971 ) ) ( not ( = ?auto_137969 ?auto_137971 ) ) ( not ( = ?auto_137966 ?auto_137969 ) ) ( not ( = ?auto_137966 ?auto_137967 ) ) ( not ( = ?auto_137966 ?auto_137974 ) ) ( not ( = ?auto_137966 ?auto_137970 ) ) ( not ( = ?auto_137966 ?auto_137972 ) ) ( not ( = ?auto_137973 ?auto_137969 ) ) ( not ( = ?auto_137973 ?auto_137967 ) ) ( not ( = ?auto_137973 ?auto_137974 ) ) ( not ( = ?auto_137973 ?auto_137970 ) ) ( not ( = ?auto_137973 ?auto_137972 ) ) ( not ( = ?auto_137968 ?auto_137969 ) ) ( not ( = ?auto_137968 ?auto_137967 ) ) ( not ( = ?auto_137968 ?auto_137974 ) ) ( not ( = ?auto_137968 ?auto_137970 ) ) ( not ( = ?auto_137968 ?auto_137972 ) ) ( ON ?auto_137971 ?auto_137968 ) ( CLEAR ?auto_137972 ) ( ON ?auto_137969 ?auto_137971 ) ( CLEAR ?auto_137969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137966 ?auto_137973 ?auto_137968 ?auto_137971 )
      ( MAKE-1PILE ?auto_137966 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137975 - BLOCK
    )
    :vars
    (
      ?auto_137983 - BLOCK
      ?auto_137976 - BLOCK
      ?auto_137980 - BLOCK
      ?auto_137982 - BLOCK
      ?auto_137977 - BLOCK
      ?auto_137981 - BLOCK
      ?auto_137979 - BLOCK
      ?auto_137978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137983 ?auto_137975 ) ( ON-TABLE ?auto_137975 ) ( not ( = ?auto_137975 ?auto_137983 ) ) ( not ( = ?auto_137975 ?auto_137976 ) ) ( not ( = ?auto_137975 ?auto_137980 ) ) ( not ( = ?auto_137983 ?auto_137976 ) ) ( not ( = ?auto_137983 ?auto_137980 ) ) ( not ( = ?auto_137976 ?auto_137980 ) ) ( ON ?auto_137976 ?auto_137983 ) ( ON-TABLE ?auto_137982 ) ( ON ?auto_137977 ?auto_137982 ) ( ON ?auto_137981 ?auto_137977 ) ( not ( = ?auto_137982 ?auto_137977 ) ) ( not ( = ?auto_137982 ?auto_137981 ) ) ( not ( = ?auto_137982 ?auto_137979 ) ) ( not ( = ?auto_137982 ?auto_137978 ) ) ( not ( = ?auto_137982 ?auto_137980 ) ) ( not ( = ?auto_137977 ?auto_137981 ) ) ( not ( = ?auto_137977 ?auto_137979 ) ) ( not ( = ?auto_137977 ?auto_137978 ) ) ( not ( = ?auto_137977 ?auto_137980 ) ) ( not ( = ?auto_137981 ?auto_137979 ) ) ( not ( = ?auto_137981 ?auto_137978 ) ) ( not ( = ?auto_137981 ?auto_137980 ) ) ( not ( = ?auto_137979 ?auto_137978 ) ) ( not ( = ?auto_137979 ?auto_137980 ) ) ( not ( = ?auto_137978 ?auto_137980 ) ) ( not ( = ?auto_137975 ?auto_137978 ) ) ( not ( = ?auto_137975 ?auto_137982 ) ) ( not ( = ?auto_137975 ?auto_137977 ) ) ( not ( = ?auto_137975 ?auto_137981 ) ) ( not ( = ?auto_137975 ?auto_137979 ) ) ( not ( = ?auto_137983 ?auto_137978 ) ) ( not ( = ?auto_137983 ?auto_137982 ) ) ( not ( = ?auto_137983 ?auto_137977 ) ) ( not ( = ?auto_137983 ?auto_137981 ) ) ( not ( = ?auto_137983 ?auto_137979 ) ) ( not ( = ?auto_137976 ?auto_137978 ) ) ( not ( = ?auto_137976 ?auto_137982 ) ) ( not ( = ?auto_137976 ?auto_137977 ) ) ( not ( = ?auto_137976 ?auto_137981 ) ) ( not ( = ?auto_137976 ?auto_137979 ) ) ( ON ?auto_137980 ?auto_137976 ) ( ON ?auto_137978 ?auto_137980 ) ( CLEAR ?auto_137978 ) ( HOLDING ?auto_137979 ) ( CLEAR ?auto_137981 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_137982 ?auto_137977 ?auto_137981 ?auto_137979 )
      ( MAKE-1PILE ?auto_137975 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137984 - BLOCK
    )
    :vars
    (
      ?auto_137985 - BLOCK
      ?auto_137987 - BLOCK
      ?auto_137992 - BLOCK
      ?auto_137991 - BLOCK
      ?auto_137989 - BLOCK
      ?auto_137986 - BLOCK
      ?auto_137990 - BLOCK
      ?auto_137988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137985 ?auto_137984 ) ( ON-TABLE ?auto_137984 ) ( not ( = ?auto_137984 ?auto_137985 ) ) ( not ( = ?auto_137984 ?auto_137987 ) ) ( not ( = ?auto_137984 ?auto_137992 ) ) ( not ( = ?auto_137985 ?auto_137987 ) ) ( not ( = ?auto_137985 ?auto_137992 ) ) ( not ( = ?auto_137987 ?auto_137992 ) ) ( ON ?auto_137987 ?auto_137985 ) ( ON-TABLE ?auto_137991 ) ( ON ?auto_137989 ?auto_137991 ) ( ON ?auto_137986 ?auto_137989 ) ( not ( = ?auto_137991 ?auto_137989 ) ) ( not ( = ?auto_137991 ?auto_137986 ) ) ( not ( = ?auto_137991 ?auto_137990 ) ) ( not ( = ?auto_137991 ?auto_137988 ) ) ( not ( = ?auto_137991 ?auto_137992 ) ) ( not ( = ?auto_137989 ?auto_137986 ) ) ( not ( = ?auto_137989 ?auto_137990 ) ) ( not ( = ?auto_137989 ?auto_137988 ) ) ( not ( = ?auto_137989 ?auto_137992 ) ) ( not ( = ?auto_137986 ?auto_137990 ) ) ( not ( = ?auto_137986 ?auto_137988 ) ) ( not ( = ?auto_137986 ?auto_137992 ) ) ( not ( = ?auto_137990 ?auto_137988 ) ) ( not ( = ?auto_137990 ?auto_137992 ) ) ( not ( = ?auto_137988 ?auto_137992 ) ) ( not ( = ?auto_137984 ?auto_137988 ) ) ( not ( = ?auto_137984 ?auto_137991 ) ) ( not ( = ?auto_137984 ?auto_137989 ) ) ( not ( = ?auto_137984 ?auto_137986 ) ) ( not ( = ?auto_137984 ?auto_137990 ) ) ( not ( = ?auto_137985 ?auto_137988 ) ) ( not ( = ?auto_137985 ?auto_137991 ) ) ( not ( = ?auto_137985 ?auto_137989 ) ) ( not ( = ?auto_137985 ?auto_137986 ) ) ( not ( = ?auto_137985 ?auto_137990 ) ) ( not ( = ?auto_137987 ?auto_137988 ) ) ( not ( = ?auto_137987 ?auto_137991 ) ) ( not ( = ?auto_137987 ?auto_137989 ) ) ( not ( = ?auto_137987 ?auto_137986 ) ) ( not ( = ?auto_137987 ?auto_137990 ) ) ( ON ?auto_137992 ?auto_137987 ) ( ON ?auto_137988 ?auto_137992 ) ( CLEAR ?auto_137986 ) ( ON ?auto_137990 ?auto_137988 ) ( CLEAR ?auto_137990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_137984 ?auto_137985 ?auto_137987 ?auto_137992 ?auto_137988 )
      ( MAKE-1PILE ?auto_137984 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_137993 - BLOCK
    )
    :vars
    (
      ?auto_137995 - BLOCK
      ?auto_137994 - BLOCK
      ?auto_137999 - BLOCK
      ?auto_137997 - BLOCK
      ?auto_137996 - BLOCK
      ?auto_137998 - BLOCK
      ?auto_138001 - BLOCK
      ?auto_138000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137995 ?auto_137993 ) ( ON-TABLE ?auto_137993 ) ( not ( = ?auto_137993 ?auto_137995 ) ) ( not ( = ?auto_137993 ?auto_137994 ) ) ( not ( = ?auto_137993 ?auto_137999 ) ) ( not ( = ?auto_137995 ?auto_137994 ) ) ( not ( = ?auto_137995 ?auto_137999 ) ) ( not ( = ?auto_137994 ?auto_137999 ) ) ( ON ?auto_137994 ?auto_137995 ) ( ON-TABLE ?auto_137997 ) ( ON ?auto_137996 ?auto_137997 ) ( not ( = ?auto_137997 ?auto_137996 ) ) ( not ( = ?auto_137997 ?auto_137998 ) ) ( not ( = ?auto_137997 ?auto_138001 ) ) ( not ( = ?auto_137997 ?auto_138000 ) ) ( not ( = ?auto_137997 ?auto_137999 ) ) ( not ( = ?auto_137996 ?auto_137998 ) ) ( not ( = ?auto_137996 ?auto_138001 ) ) ( not ( = ?auto_137996 ?auto_138000 ) ) ( not ( = ?auto_137996 ?auto_137999 ) ) ( not ( = ?auto_137998 ?auto_138001 ) ) ( not ( = ?auto_137998 ?auto_138000 ) ) ( not ( = ?auto_137998 ?auto_137999 ) ) ( not ( = ?auto_138001 ?auto_138000 ) ) ( not ( = ?auto_138001 ?auto_137999 ) ) ( not ( = ?auto_138000 ?auto_137999 ) ) ( not ( = ?auto_137993 ?auto_138000 ) ) ( not ( = ?auto_137993 ?auto_137997 ) ) ( not ( = ?auto_137993 ?auto_137996 ) ) ( not ( = ?auto_137993 ?auto_137998 ) ) ( not ( = ?auto_137993 ?auto_138001 ) ) ( not ( = ?auto_137995 ?auto_138000 ) ) ( not ( = ?auto_137995 ?auto_137997 ) ) ( not ( = ?auto_137995 ?auto_137996 ) ) ( not ( = ?auto_137995 ?auto_137998 ) ) ( not ( = ?auto_137995 ?auto_138001 ) ) ( not ( = ?auto_137994 ?auto_138000 ) ) ( not ( = ?auto_137994 ?auto_137997 ) ) ( not ( = ?auto_137994 ?auto_137996 ) ) ( not ( = ?auto_137994 ?auto_137998 ) ) ( not ( = ?auto_137994 ?auto_138001 ) ) ( ON ?auto_137999 ?auto_137994 ) ( ON ?auto_138000 ?auto_137999 ) ( ON ?auto_138001 ?auto_138000 ) ( CLEAR ?auto_138001 ) ( HOLDING ?auto_137998 ) ( CLEAR ?auto_137996 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_137997 ?auto_137996 ?auto_137998 )
      ( MAKE-1PILE ?auto_137993 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138002 - BLOCK
    )
    :vars
    (
      ?auto_138008 - BLOCK
      ?auto_138003 - BLOCK
      ?auto_138005 - BLOCK
      ?auto_138010 - BLOCK
      ?auto_138007 - BLOCK
      ?auto_138006 - BLOCK
      ?auto_138009 - BLOCK
      ?auto_138004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138008 ?auto_138002 ) ( ON-TABLE ?auto_138002 ) ( not ( = ?auto_138002 ?auto_138008 ) ) ( not ( = ?auto_138002 ?auto_138003 ) ) ( not ( = ?auto_138002 ?auto_138005 ) ) ( not ( = ?auto_138008 ?auto_138003 ) ) ( not ( = ?auto_138008 ?auto_138005 ) ) ( not ( = ?auto_138003 ?auto_138005 ) ) ( ON ?auto_138003 ?auto_138008 ) ( ON-TABLE ?auto_138010 ) ( ON ?auto_138007 ?auto_138010 ) ( not ( = ?auto_138010 ?auto_138007 ) ) ( not ( = ?auto_138010 ?auto_138006 ) ) ( not ( = ?auto_138010 ?auto_138009 ) ) ( not ( = ?auto_138010 ?auto_138004 ) ) ( not ( = ?auto_138010 ?auto_138005 ) ) ( not ( = ?auto_138007 ?auto_138006 ) ) ( not ( = ?auto_138007 ?auto_138009 ) ) ( not ( = ?auto_138007 ?auto_138004 ) ) ( not ( = ?auto_138007 ?auto_138005 ) ) ( not ( = ?auto_138006 ?auto_138009 ) ) ( not ( = ?auto_138006 ?auto_138004 ) ) ( not ( = ?auto_138006 ?auto_138005 ) ) ( not ( = ?auto_138009 ?auto_138004 ) ) ( not ( = ?auto_138009 ?auto_138005 ) ) ( not ( = ?auto_138004 ?auto_138005 ) ) ( not ( = ?auto_138002 ?auto_138004 ) ) ( not ( = ?auto_138002 ?auto_138010 ) ) ( not ( = ?auto_138002 ?auto_138007 ) ) ( not ( = ?auto_138002 ?auto_138006 ) ) ( not ( = ?auto_138002 ?auto_138009 ) ) ( not ( = ?auto_138008 ?auto_138004 ) ) ( not ( = ?auto_138008 ?auto_138010 ) ) ( not ( = ?auto_138008 ?auto_138007 ) ) ( not ( = ?auto_138008 ?auto_138006 ) ) ( not ( = ?auto_138008 ?auto_138009 ) ) ( not ( = ?auto_138003 ?auto_138004 ) ) ( not ( = ?auto_138003 ?auto_138010 ) ) ( not ( = ?auto_138003 ?auto_138007 ) ) ( not ( = ?auto_138003 ?auto_138006 ) ) ( not ( = ?auto_138003 ?auto_138009 ) ) ( ON ?auto_138005 ?auto_138003 ) ( ON ?auto_138004 ?auto_138005 ) ( ON ?auto_138009 ?auto_138004 ) ( CLEAR ?auto_138007 ) ( ON ?auto_138006 ?auto_138009 ) ( CLEAR ?auto_138006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138002 ?auto_138008 ?auto_138003 ?auto_138005 ?auto_138004 ?auto_138009 )
      ( MAKE-1PILE ?auto_138002 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138011 - BLOCK
    )
    :vars
    (
      ?auto_138015 - BLOCK
      ?auto_138016 - BLOCK
      ?auto_138013 - BLOCK
      ?auto_138019 - BLOCK
      ?auto_138014 - BLOCK
      ?auto_138012 - BLOCK
      ?auto_138018 - BLOCK
      ?auto_138017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138015 ?auto_138011 ) ( ON-TABLE ?auto_138011 ) ( not ( = ?auto_138011 ?auto_138015 ) ) ( not ( = ?auto_138011 ?auto_138016 ) ) ( not ( = ?auto_138011 ?auto_138013 ) ) ( not ( = ?auto_138015 ?auto_138016 ) ) ( not ( = ?auto_138015 ?auto_138013 ) ) ( not ( = ?auto_138016 ?auto_138013 ) ) ( ON ?auto_138016 ?auto_138015 ) ( ON-TABLE ?auto_138019 ) ( not ( = ?auto_138019 ?auto_138014 ) ) ( not ( = ?auto_138019 ?auto_138012 ) ) ( not ( = ?auto_138019 ?auto_138018 ) ) ( not ( = ?auto_138019 ?auto_138017 ) ) ( not ( = ?auto_138019 ?auto_138013 ) ) ( not ( = ?auto_138014 ?auto_138012 ) ) ( not ( = ?auto_138014 ?auto_138018 ) ) ( not ( = ?auto_138014 ?auto_138017 ) ) ( not ( = ?auto_138014 ?auto_138013 ) ) ( not ( = ?auto_138012 ?auto_138018 ) ) ( not ( = ?auto_138012 ?auto_138017 ) ) ( not ( = ?auto_138012 ?auto_138013 ) ) ( not ( = ?auto_138018 ?auto_138017 ) ) ( not ( = ?auto_138018 ?auto_138013 ) ) ( not ( = ?auto_138017 ?auto_138013 ) ) ( not ( = ?auto_138011 ?auto_138017 ) ) ( not ( = ?auto_138011 ?auto_138019 ) ) ( not ( = ?auto_138011 ?auto_138014 ) ) ( not ( = ?auto_138011 ?auto_138012 ) ) ( not ( = ?auto_138011 ?auto_138018 ) ) ( not ( = ?auto_138015 ?auto_138017 ) ) ( not ( = ?auto_138015 ?auto_138019 ) ) ( not ( = ?auto_138015 ?auto_138014 ) ) ( not ( = ?auto_138015 ?auto_138012 ) ) ( not ( = ?auto_138015 ?auto_138018 ) ) ( not ( = ?auto_138016 ?auto_138017 ) ) ( not ( = ?auto_138016 ?auto_138019 ) ) ( not ( = ?auto_138016 ?auto_138014 ) ) ( not ( = ?auto_138016 ?auto_138012 ) ) ( not ( = ?auto_138016 ?auto_138018 ) ) ( ON ?auto_138013 ?auto_138016 ) ( ON ?auto_138017 ?auto_138013 ) ( ON ?auto_138018 ?auto_138017 ) ( ON ?auto_138012 ?auto_138018 ) ( CLEAR ?auto_138012 ) ( HOLDING ?auto_138014 ) ( CLEAR ?auto_138019 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138019 ?auto_138014 )
      ( MAKE-1PILE ?auto_138011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138020 - BLOCK
    )
    :vars
    (
      ?auto_138028 - BLOCK
      ?auto_138021 - BLOCK
      ?auto_138022 - BLOCK
      ?auto_138026 - BLOCK
      ?auto_138027 - BLOCK
      ?auto_138023 - BLOCK
      ?auto_138024 - BLOCK
      ?auto_138025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138028 ?auto_138020 ) ( ON-TABLE ?auto_138020 ) ( not ( = ?auto_138020 ?auto_138028 ) ) ( not ( = ?auto_138020 ?auto_138021 ) ) ( not ( = ?auto_138020 ?auto_138022 ) ) ( not ( = ?auto_138028 ?auto_138021 ) ) ( not ( = ?auto_138028 ?auto_138022 ) ) ( not ( = ?auto_138021 ?auto_138022 ) ) ( ON ?auto_138021 ?auto_138028 ) ( ON-TABLE ?auto_138026 ) ( not ( = ?auto_138026 ?auto_138027 ) ) ( not ( = ?auto_138026 ?auto_138023 ) ) ( not ( = ?auto_138026 ?auto_138024 ) ) ( not ( = ?auto_138026 ?auto_138025 ) ) ( not ( = ?auto_138026 ?auto_138022 ) ) ( not ( = ?auto_138027 ?auto_138023 ) ) ( not ( = ?auto_138027 ?auto_138024 ) ) ( not ( = ?auto_138027 ?auto_138025 ) ) ( not ( = ?auto_138027 ?auto_138022 ) ) ( not ( = ?auto_138023 ?auto_138024 ) ) ( not ( = ?auto_138023 ?auto_138025 ) ) ( not ( = ?auto_138023 ?auto_138022 ) ) ( not ( = ?auto_138024 ?auto_138025 ) ) ( not ( = ?auto_138024 ?auto_138022 ) ) ( not ( = ?auto_138025 ?auto_138022 ) ) ( not ( = ?auto_138020 ?auto_138025 ) ) ( not ( = ?auto_138020 ?auto_138026 ) ) ( not ( = ?auto_138020 ?auto_138027 ) ) ( not ( = ?auto_138020 ?auto_138023 ) ) ( not ( = ?auto_138020 ?auto_138024 ) ) ( not ( = ?auto_138028 ?auto_138025 ) ) ( not ( = ?auto_138028 ?auto_138026 ) ) ( not ( = ?auto_138028 ?auto_138027 ) ) ( not ( = ?auto_138028 ?auto_138023 ) ) ( not ( = ?auto_138028 ?auto_138024 ) ) ( not ( = ?auto_138021 ?auto_138025 ) ) ( not ( = ?auto_138021 ?auto_138026 ) ) ( not ( = ?auto_138021 ?auto_138027 ) ) ( not ( = ?auto_138021 ?auto_138023 ) ) ( not ( = ?auto_138021 ?auto_138024 ) ) ( ON ?auto_138022 ?auto_138021 ) ( ON ?auto_138025 ?auto_138022 ) ( ON ?auto_138024 ?auto_138025 ) ( ON ?auto_138023 ?auto_138024 ) ( CLEAR ?auto_138026 ) ( ON ?auto_138027 ?auto_138023 ) ( CLEAR ?auto_138027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138020 ?auto_138028 ?auto_138021 ?auto_138022 ?auto_138025 ?auto_138024 ?auto_138023 )
      ( MAKE-1PILE ?auto_138020 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138029 - BLOCK
    )
    :vars
    (
      ?auto_138036 - BLOCK
      ?auto_138031 - BLOCK
      ?auto_138033 - BLOCK
      ?auto_138037 - BLOCK
      ?auto_138032 - BLOCK
      ?auto_138035 - BLOCK
      ?auto_138034 - BLOCK
      ?auto_138030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138036 ?auto_138029 ) ( ON-TABLE ?auto_138029 ) ( not ( = ?auto_138029 ?auto_138036 ) ) ( not ( = ?auto_138029 ?auto_138031 ) ) ( not ( = ?auto_138029 ?auto_138033 ) ) ( not ( = ?auto_138036 ?auto_138031 ) ) ( not ( = ?auto_138036 ?auto_138033 ) ) ( not ( = ?auto_138031 ?auto_138033 ) ) ( ON ?auto_138031 ?auto_138036 ) ( not ( = ?auto_138037 ?auto_138032 ) ) ( not ( = ?auto_138037 ?auto_138035 ) ) ( not ( = ?auto_138037 ?auto_138034 ) ) ( not ( = ?auto_138037 ?auto_138030 ) ) ( not ( = ?auto_138037 ?auto_138033 ) ) ( not ( = ?auto_138032 ?auto_138035 ) ) ( not ( = ?auto_138032 ?auto_138034 ) ) ( not ( = ?auto_138032 ?auto_138030 ) ) ( not ( = ?auto_138032 ?auto_138033 ) ) ( not ( = ?auto_138035 ?auto_138034 ) ) ( not ( = ?auto_138035 ?auto_138030 ) ) ( not ( = ?auto_138035 ?auto_138033 ) ) ( not ( = ?auto_138034 ?auto_138030 ) ) ( not ( = ?auto_138034 ?auto_138033 ) ) ( not ( = ?auto_138030 ?auto_138033 ) ) ( not ( = ?auto_138029 ?auto_138030 ) ) ( not ( = ?auto_138029 ?auto_138037 ) ) ( not ( = ?auto_138029 ?auto_138032 ) ) ( not ( = ?auto_138029 ?auto_138035 ) ) ( not ( = ?auto_138029 ?auto_138034 ) ) ( not ( = ?auto_138036 ?auto_138030 ) ) ( not ( = ?auto_138036 ?auto_138037 ) ) ( not ( = ?auto_138036 ?auto_138032 ) ) ( not ( = ?auto_138036 ?auto_138035 ) ) ( not ( = ?auto_138036 ?auto_138034 ) ) ( not ( = ?auto_138031 ?auto_138030 ) ) ( not ( = ?auto_138031 ?auto_138037 ) ) ( not ( = ?auto_138031 ?auto_138032 ) ) ( not ( = ?auto_138031 ?auto_138035 ) ) ( not ( = ?auto_138031 ?auto_138034 ) ) ( ON ?auto_138033 ?auto_138031 ) ( ON ?auto_138030 ?auto_138033 ) ( ON ?auto_138034 ?auto_138030 ) ( ON ?auto_138035 ?auto_138034 ) ( ON ?auto_138032 ?auto_138035 ) ( CLEAR ?auto_138032 ) ( HOLDING ?auto_138037 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138037 )
      ( MAKE-1PILE ?auto_138029 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138038 - BLOCK
    )
    :vars
    (
      ?auto_138043 - BLOCK
      ?auto_138042 - BLOCK
      ?auto_138041 - BLOCK
      ?auto_138039 - BLOCK
      ?auto_138046 - BLOCK
      ?auto_138044 - BLOCK
      ?auto_138045 - BLOCK
      ?auto_138040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138043 ?auto_138038 ) ( ON-TABLE ?auto_138038 ) ( not ( = ?auto_138038 ?auto_138043 ) ) ( not ( = ?auto_138038 ?auto_138042 ) ) ( not ( = ?auto_138038 ?auto_138041 ) ) ( not ( = ?auto_138043 ?auto_138042 ) ) ( not ( = ?auto_138043 ?auto_138041 ) ) ( not ( = ?auto_138042 ?auto_138041 ) ) ( ON ?auto_138042 ?auto_138043 ) ( not ( = ?auto_138039 ?auto_138046 ) ) ( not ( = ?auto_138039 ?auto_138044 ) ) ( not ( = ?auto_138039 ?auto_138045 ) ) ( not ( = ?auto_138039 ?auto_138040 ) ) ( not ( = ?auto_138039 ?auto_138041 ) ) ( not ( = ?auto_138046 ?auto_138044 ) ) ( not ( = ?auto_138046 ?auto_138045 ) ) ( not ( = ?auto_138046 ?auto_138040 ) ) ( not ( = ?auto_138046 ?auto_138041 ) ) ( not ( = ?auto_138044 ?auto_138045 ) ) ( not ( = ?auto_138044 ?auto_138040 ) ) ( not ( = ?auto_138044 ?auto_138041 ) ) ( not ( = ?auto_138045 ?auto_138040 ) ) ( not ( = ?auto_138045 ?auto_138041 ) ) ( not ( = ?auto_138040 ?auto_138041 ) ) ( not ( = ?auto_138038 ?auto_138040 ) ) ( not ( = ?auto_138038 ?auto_138039 ) ) ( not ( = ?auto_138038 ?auto_138046 ) ) ( not ( = ?auto_138038 ?auto_138044 ) ) ( not ( = ?auto_138038 ?auto_138045 ) ) ( not ( = ?auto_138043 ?auto_138040 ) ) ( not ( = ?auto_138043 ?auto_138039 ) ) ( not ( = ?auto_138043 ?auto_138046 ) ) ( not ( = ?auto_138043 ?auto_138044 ) ) ( not ( = ?auto_138043 ?auto_138045 ) ) ( not ( = ?auto_138042 ?auto_138040 ) ) ( not ( = ?auto_138042 ?auto_138039 ) ) ( not ( = ?auto_138042 ?auto_138046 ) ) ( not ( = ?auto_138042 ?auto_138044 ) ) ( not ( = ?auto_138042 ?auto_138045 ) ) ( ON ?auto_138041 ?auto_138042 ) ( ON ?auto_138040 ?auto_138041 ) ( ON ?auto_138045 ?auto_138040 ) ( ON ?auto_138044 ?auto_138045 ) ( ON ?auto_138046 ?auto_138044 ) ( ON ?auto_138039 ?auto_138046 ) ( CLEAR ?auto_138039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138038 ?auto_138043 ?auto_138042 ?auto_138041 ?auto_138040 ?auto_138045 ?auto_138044 ?auto_138046 )
      ( MAKE-1PILE ?auto_138038 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138055 - BLOCK
      ?auto_138056 - BLOCK
      ?auto_138057 - BLOCK
      ?auto_138058 - BLOCK
      ?auto_138059 - BLOCK
      ?auto_138060 - BLOCK
      ?auto_138061 - BLOCK
      ?auto_138062 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_138062 ) ( CLEAR ?auto_138061 ) ( ON-TABLE ?auto_138055 ) ( ON ?auto_138056 ?auto_138055 ) ( ON ?auto_138057 ?auto_138056 ) ( ON ?auto_138058 ?auto_138057 ) ( ON ?auto_138059 ?auto_138058 ) ( ON ?auto_138060 ?auto_138059 ) ( ON ?auto_138061 ?auto_138060 ) ( not ( = ?auto_138055 ?auto_138056 ) ) ( not ( = ?auto_138055 ?auto_138057 ) ) ( not ( = ?auto_138055 ?auto_138058 ) ) ( not ( = ?auto_138055 ?auto_138059 ) ) ( not ( = ?auto_138055 ?auto_138060 ) ) ( not ( = ?auto_138055 ?auto_138061 ) ) ( not ( = ?auto_138055 ?auto_138062 ) ) ( not ( = ?auto_138056 ?auto_138057 ) ) ( not ( = ?auto_138056 ?auto_138058 ) ) ( not ( = ?auto_138056 ?auto_138059 ) ) ( not ( = ?auto_138056 ?auto_138060 ) ) ( not ( = ?auto_138056 ?auto_138061 ) ) ( not ( = ?auto_138056 ?auto_138062 ) ) ( not ( = ?auto_138057 ?auto_138058 ) ) ( not ( = ?auto_138057 ?auto_138059 ) ) ( not ( = ?auto_138057 ?auto_138060 ) ) ( not ( = ?auto_138057 ?auto_138061 ) ) ( not ( = ?auto_138057 ?auto_138062 ) ) ( not ( = ?auto_138058 ?auto_138059 ) ) ( not ( = ?auto_138058 ?auto_138060 ) ) ( not ( = ?auto_138058 ?auto_138061 ) ) ( not ( = ?auto_138058 ?auto_138062 ) ) ( not ( = ?auto_138059 ?auto_138060 ) ) ( not ( = ?auto_138059 ?auto_138061 ) ) ( not ( = ?auto_138059 ?auto_138062 ) ) ( not ( = ?auto_138060 ?auto_138061 ) ) ( not ( = ?auto_138060 ?auto_138062 ) ) ( not ( = ?auto_138061 ?auto_138062 ) ) )
    :subtasks
    ( ( !STACK ?auto_138062 ?auto_138061 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138063 - BLOCK
      ?auto_138064 - BLOCK
      ?auto_138065 - BLOCK
      ?auto_138066 - BLOCK
      ?auto_138067 - BLOCK
      ?auto_138068 - BLOCK
      ?auto_138069 - BLOCK
      ?auto_138070 - BLOCK
    )
    :vars
    (
      ?auto_138071 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_138069 ) ( ON-TABLE ?auto_138063 ) ( ON ?auto_138064 ?auto_138063 ) ( ON ?auto_138065 ?auto_138064 ) ( ON ?auto_138066 ?auto_138065 ) ( ON ?auto_138067 ?auto_138066 ) ( ON ?auto_138068 ?auto_138067 ) ( ON ?auto_138069 ?auto_138068 ) ( not ( = ?auto_138063 ?auto_138064 ) ) ( not ( = ?auto_138063 ?auto_138065 ) ) ( not ( = ?auto_138063 ?auto_138066 ) ) ( not ( = ?auto_138063 ?auto_138067 ) ) ( not ( = ?auto_138063 ?auto_138068 ) ) ( not ( = ?auto_138063 ?auto_138069 ) ) ( not ( = ?auto_138063 ?auto_138070 ) ) ( not ( = ?auto_138064 ?auto_138065 ) ) ( not ( = ?auto_138064 ?auto_138066 ) ) ( not ( = ?auto_138064 ?auto_138067 ) ) ( not ( = ?auto_138064 ?auto_138068 ) ) ( not ( = ?auto_138064 ?auto_138069 ) ) ( not ( = ?auto_138064 ?auto_138070 ) ) ( not ( = ?auto_138065 ?auto_138066 ) ) ( not ( = ?auto_138065 ?auto_138067 ) ) ( not ( = ?auto_138065 ?auto_138068 ) ) ( not ( = ?auto_138065 ?auto_138069 ) ) ( not ( = ?auto_138065 ?auto_138070 ) ) ( not ( = ?auto_138066 ?auto_138067 ) ) ( not ( = ?auto_138066 ?auto_138068 ) ) ( not ( = ?auto_138066 ?auto_138069 ) ) ( not ( = ?auto_138066 ?auto_138070 ) ) ( not ( = ?auto_138067 ?auto_138068 ) ) ( not ( = ?auto_138067 ?auto_138069 ) ) ( not ( = ?auto_138067 ?auto_138070 ) ) ( not ( = ?auto_138068 ?auto_138069 ) ) ( not ( = ?auto_138068 ?auto_138070 ) ) ( not ( = ?auto_138069 ?auto_138070 ) ) ( ON ?auto_138070 ?auto_138071 ) ( CLEAR ?auto_138070 ) ( HAND-EMPTY ) ( not ( = ?auto_138063 ?auto_138071 ) ) ( not ( = ?auto_138064 ?auto_138071 ) ) ( not ( = ?auto_138065 ?auto_138071 ) ) ( not ( = ?auto_138066 ?auto_138071 ) ) ( not ( = ?auto_138067 ?auto_138071 ) ) ( not ( = ?auto_138068 ?auto_138071 ) ) ( not ( = ?auto_138069 ?auto_138071 ) ) ( not ( = ?auto_138070 ?auto_138071 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138070 ?auto_138071 )
      ( MAKE-8PILE ?auto_138063 ?auto_138064 ?auto_138065 ?auto_138066 ?auto_138067 ?auto_138068 ?auto_138069 ?auto_138070 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138072 - BLOCK
      ?auto_138073 - BLOCK
      ?auto_138074 - BLOCK
      ?auto_138075 - BLOCK
      ?auto_138076 - BLOCK
      ?auto_138077 - BLOCK
      ?auto_138078 - BLOCK
      ?auto_138079 - BLOCK
    )
    :vars
    (
      ?auto_138080 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138072 ) ( ON ?auto_138073 ?auto_138072 ) ( ON ?auto_138074 ?auto_138073 ) ( ON ?auto_138075 ?auto_138074 ) ( ON ?auto_138076 ?auto_138075 ) ( ON ?auto_138077 ?auto_138076 ) ( not ( = ?auto_138072 ?auto_138073 ) ) ( not ( = ?auto_138072 ?auto_138074 ) ) ( not ( = ?auto_138072 ?auto_138075 ) ) ( not ( = ?auto_138072 ?auto_138076 ) ) ( not ( = ?auto_138072 ?auto_138077 ) ) ( not ( = ?auto_138072 ?auto_138078 ) ) ( not ( = ?auto_138072 ?auto_138079 ) ) ( not ( = ?auto_138073 ?auto_138074 ) ) ( not ( = ?auto_138073 ?auto_138075 ) ) ( not ( = ?auto_138073 ?auto_138076 ) ) ( not ( = ?auto_138073 ?auto_138077 ) ) ( not ( = ?auto_138073 ?auto_138078 ) ) ( not ( = ?auto_138073 ?auto_138079 ) ) ( not ( = ?auto_138074 ?auto_138075 ) ) ( not ( = ?auto_138074 ?auto_138076 ) ) ( not ( = ?auto_138074 ?auto_138077 ) ) ( not ( = ?auto_138074 ?auto_138078 ) ) ( not ( = ?auto_138074 ?auto_138079 ) ) ( not ( = ?auto_138075 ?auto_138076 ) ) ( not ( = ?auto_138075 ?auto_138077 ) ) ( not ( = ?auto_138075 ?auto_138078 ) ) ( not ( = ?auto_138075 ?auto_138079 ) ) ( not ( = ?auto_138076 ?auto_138077 ) ) ( not ( = ?auto_138076 ?auto_138078 ) ) ( not ( = ?auto_138076 ?auto_138079 ) ) ( not ( = ?auto_138077 ?auto_138078 ) ) ( not ( = ?auto_138077 ?auto_138079 ) ) ( not ( = ?auto_138078 ?auto_138079 ) ) ( ON ?auto_138079 ?auto_138080 ) ( CLEAR ?auto_138079 ) ( not ( = ?auto_138072 ?auto_138080 ) ) ( not ( = ?auto_138073 ?auto_138080 ) ) ( not ( = ?auto_138074 ?auto_138080 ) ) ( not ( = ?auto_138075 ?auto_138080 ) ) ( not ( = ?auto_138076 ?auto_138080 ) ) ( not ( = ?auto_138077 ?auto_138080 ) ) ( not ( = ?auto_138078 ?auto_138080 ) ) ( not ( = ?auto_138079 ?auto_138080 ) ) ( HOLDING ?auto_138078 ) ( CLEAR ?auto_138077 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138072 ?auto_138073 ?auto_138074 ?auto_138075 ?auto_138076 ?auto_138077 ?auto_138078 )
      ( MAKE-8PILE ?auto_138072 ?auto_138073 ?auto_138074 ?auto_138075 ?auto_138076 ?auto_138077 ?auto_138078 ?auto_138079 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138081 - BLOCK
      ?auto_138082 - BLOCK
      ?auto_138083 - BLOCK
      ?auto_138084 - BLOCK
      ?auto_138085 - BLOCK
      ?auto_138086 - BLOCK
      ?auto_138087 - BLOCK
      ?auto_138088 - BLOCK
    )
    :vars
    (
      ?auto_138089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138081 ) ( ON ?auto_138082 ?auto_138081 ) ( ON ?auto_138083 ?auto_138082 ) ( ON ?auto_138084 ?auto_138083 ) ( ON ?auto_138085 ?auto_138084 ) ( ON ?auto_138086 ?auto_138085 ) ( not ( = ?auto_138081 ?auto_138082 ) ) ( not ( = ?auto_138081 ?auto_138083 ) ) ( not ( = ?auto_138081 ?auto_138084 ) ) ( not ( = ?auto_138081 ?auto_138085 ) ) ( not ( = ?auto_138081 ?auto_138086 ) ) ( not ( = ?auto_138081 ?auto_138087 ) ) ( not ( = ?auto_138081 ?auto_138088 ) ) ( not ( = ?auto_138082 ?auto_138083 ) ) ( not ( = ?auto_138082 ?auto_138084 ) ) ( not ( = ?auto_138082 ?auto_138085 ) ) ( not ( = ?auto_138082 ?auto_138086 ) ) ( not ( = ?auto_138082 ?auto_138087 ) ) ( not ( = ?auto_138082 ?auto_138088 ) ) ( not ( = ?auto_138083 ?auto_138084 ) ) ( not ( = ?auto_138083 ?auto_138085 ) ) ( not ( = ?auto_138083 ?auto_138086 ) ) ( not ( = ?auto_138083 ?auto_138087 ) ) ( not ( = ?auto_138083 ?auto_138088 ) ) ( not ( = ?auto_138084 ?auto_138085 ) ) ( not ( = ?auto_138084 ?auto_138086 ) ) ( not ( = ?auto_138084 ?auto_138087 ) ) ( not ( = ?auto_138084 ?auto_138088 ) ) ( not ( = ?auto_138085 ?auto_138086 ) ) ( not ( = ?auto_138085 ?auto_138087 ) ) ( not ( = ?auto_138085 ?auto_138088 ) ) ( not ( = ?auto_138086 ?auto_138087 ) ) ( not ( = ?auto_138086 ?auto_138088 ) ) ( not ( = ?auto_138087 ?auto_138088 ) ) ( ON ?auto_138088 ?auto_138089 ) ( not ( = ?auto_138081 ?auto_138089 ) ) ( not ( = ?auto_138082 ?auto_138089 ) ) ( not ( = ?auto_138083 ?auto_138089 ) ) ( not ( = ?auto_138084 ?auto_138089 ) ) ( not ( = ?auto_138085 ?auto_138089 ) ) ( not ( = ?auto_138086 ?auto_138089 ) ) ( not ( = ?auto_138087 ?auto_138089 ) ) ( not ( = ?auto_138088 ?auto_138089 ) ) ( CLEAR ?auto_138086 ) ( ON ?auto_138087 ?auto_138088 ) ( CLEAR ?auto_138087 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138089 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138089 ?auto_138088 )
      ( MAKE-8PILE ?auto_138081 ?auto_138082 ?auto_138083 ?auto_138084 ?auto_138085 ?auto_138086 ?auto_138087 ?auto_138088 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138090 - BLOCK
      ?auto_138091 - BLOCK
      ?auto_138092 - BLOCK
      ?auto_138093 - BLOCK
      ?auto_138094 - BLOCK
      ?auto_138095 - BLOCK
      ?auto_138096 - BLOCK
      ?auto_138097 - BLOCK
    )
    :vars
    (
      ?auto_138098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138090 ) ( ON ?auto_138091 ?auto_138090 ) ( ON ?auto_138092 ?auto_138091 ) ( ON ?auto_138093 ?auto_138092 ) ( ON ?auto_138094 ?auto_138093 ) ( not ( = ?auto_138090 ?auto_138091 ) ) ( not ( = ?auto_138090 ?auto_138092 ) ) ( not ( = ?auto_138090 ?auto_138093 ) ) ( not ( = ?auto_138090 ?auto_138094 ) ) ( not ( = ?auto_138090 ?auto_138095 ) ) ( not ( = ?auto_138090 ?auto_138096 ) ) ( not ( = ?auto_138090 ?auto_138097 ) ) ( not ( = ?auto_138091 ?auto_138092 ) ) ( not ( = ?auto_138091 ?auto_138093 ) ) ( not ( = ?auto_138091 ?auto_138094 ) ) ( not ( = ?auto_138091 ?auto_138095 ) ) ( not ( = ?auto_138091 ?auto_138096 ) ) ( not ( = ?auto_138091 ?auto_138097 ) ) ( not ( = ?auto_138092 ?auto_138093 ) ) ( not ( = ?auto_138092 ?auto_138094 ) ) ( not ( = ?auto_138092 ?auto_138095 ) ) ( not ( = ?auto_138092 ?auto_138096 ) ) ( not ( = ?auto_138092 ?auto_138097 ) ) ( not ( = ?auto_138093 ?auto_138094 ) ) ( not ( = ?auto_138093 ?auto_138095 ) ) ( not ( = ?auto_138093 ?auto_138096 ) ) ( not ( = ?auto_138093 ?auto_138097 ) ) ( not ( = ?auto_138094 ?auto_138095 ) ) ( not ( = ?auto_138094 ?auto_138096 ) ) ( not ( = ?auto_138094 ?auto_138097 ) ) ( not ( = ?auto_138095 ?auto_138096 ) ) ( not ( = ?auto_138095 ?auto_138097 ) ) ( not ( = ?auto_138096 ?auto_138097 ) ) ( ON ?auto_138097 ?auto_138098 ) ( not ( = ?auto_138090 ?auto_138098 ) ) ( not ( = ?auto_138091 ?auto_138098 ) ) ( not ( = ?auto_138092 ?auto_138098 ) ) ( not ( = ?auto_138093 ?auto_138098 ) ) ( not ( = ?auto_138094 ?auto_138098 ) ) ( not ( = ?auto_138095 ?auto_138098 ) ) ( not ( = ?auto_138096 ?auto_138098 ) ) ( not ( = ?auto_138097 ?auto_138098 ) ) ( ON ?auto_138096 ?auto_138097 ) ( CLEAR ?auto_138096 ) ( ON-TABLE ?auto_138098 ) ( HOLDING ?auto_138095 ) ( CLEAR ?auto_138094 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138090 ?auto_138091 ?auto_138092 ?auto_138093 ?auto_138094 ?auto_138095 )
      ( MAKE-8PILE ?auto_138090 ?auto_138091 ?auto_138092 ?auto_138093 ?auto_138094 ?auto_138095 ?auto_138096 ?auto_138097 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138099 - BLOCK
      ?auto_138100 - BLOCK
      ?auto_138101 - BLOCK
      ?auto_138102 - BLOCK
      ?auto_138103 - BLOCK
      ?auto_138104 - BLOCK
      ?auto_138105 - BLOCK
      ?auto_138106 - BLOCK
    )
    :vars
    (
      ?auto_138107 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138099 ) ( ON ?auto_138100 ?auto_138099 ) ( ON ?auto_138101 ?auto_138100 ) ( ON ?auto_138102 ?auto_138101 ) ( ON ?auto_138103 ?auto_138102 ) ( not ( = ?auto_138099 ?auto_138100 ) ) ( not ( = ?auto_138099 ?auto_138101 ) ) ( not ( = ?auto_138099 ?auto_138102 ) ) ( not ( = ?auto_138099 ?auto_138103 ) ) ( not ( = ?auto_138099 ?auto_138104 ) ) ( not ( = ?auto_138099 ?auto_138105 ) ) ( not ( = ?auto_138099 ?auto_138106 ) ) ( not ( = ?auto_138100 ?auto_138101 ) ) ( not ( = ?auto_138100 ?auto_138102 ) ) ( not ( = ?auto_138100 ?auto_138103 ) ) ( not ( = ?auto_138100 ?auto_138104 ) ) ( not ( = ?auto_138100 ?auto_138105 ) ) ( not ( = ?auto_138100 ?auto_138106 ) ) ( not ( = ?auto_138101 ?auto_138102 ) ) ( not ( = ?auto_138101 ?auto_138103 ) ) ( not ( = ?auto_138101 ?auto_138104 ) ) ( not ( = ?auto_138101 ?auto_138105 ) ) ( not ( = ?auto_138101 ?auto_138106 ) ) ( not ( = ?auto_138102 ?auto_138103 ) ) ( not ( = ?auto_138102 ?auto_138104 ) ) ( not ( = ?auto_138102 ?auto_138105 ) ) ( not ( = ?auto_138102 ?auto_138106 ) ) ( not ( = ?auto_138103 ?auto_138104 ) ) ( not ( = ?auto_138103 ?auto_138105 ) ) ( not ( = ?auto_138103 ?auto_138106 ) ) ( not ( = ?auto_138104 ?auto_138105 ) ) ( not ( = ?auto_138104 ?auto_138106 ) ) ( not ( = ?auto_138105 ?auto_138106 ) ) ( ON ?auto_138106 ?auto_138107 ) ( not ( = ?auto_138099 ?auto_138107 ) ) ( not ( = ?auto_138100 ?auto_138107 ) ) ( not ( = ?auto_138101 ?auto_138107 ) ) ( not ( = ?auto_138102 ?auto_138107 ) ) ( not ( = ?auto_138103 ?auto_138107 ) ) ( not ( = ?auto_138104 ?auto_138107 ) ) ( not ( = ?auto_138105 ?auto_138107 ) ) ( not ( = ?auto_138106 ?auto_138107 ) ) ( ON ?auto_138105 ?auto_138106 ) ( ON-TABLE ?auto_138107 ) ( CLEAR ?auto_138103 ) ( ON ?auto_138104 ?auto_138105 ) ( CLEAR ?auto_138104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138107 ?auto_138106 ?auto_138105 )
      ( MAKE-8PILE ?auto_138099 ?auto_138100 ?auto_138101 ?auto_138102 ?auto_138103 ?auto_138104 ?auto_138105 ?auto_138106 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138108 - BLOCK
      ?auto_138109 - BLOCK
      ?auto_138110 - BLOCK
      ?auto_138111 - BLOCK
      ?auto_138112 - BLOCK
      ?auto_138113 - BLOCK
      ?auto_138114 - BLOCK
      ?auto_138115 - BLOCK
    )
    :vars
    (
      ?auto_138116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138108 ) ( ON ?auto_138109 ?auto_138108 ) ( ON ?auto_138110 ?auto_138109 ) ( ON ?auto_138111 ?auto_138110 ) ( not ( = ?auto_138108 ?auto_138109 ) ) ( not ( = ?auto_138108 ?auto_138110 ) ) ( not ( = ?auto_138108 ?auto_138111 ) ) ( not ( = ?auto_138108 ?auto_138112 ) ) ( not ( = ?auto_138108 ?auto_138113 ) ) ( not ( = ?auto_138108 ?auto_138114 ) ) ( not ( = ?auto_138108 ?auto_138115 ) ) ( not ( = ?auto_138109 ?auto_138110 ) ) ( not ( = ?auto_138109 ?auto_138111 ) ) ( not ( = ?auto_138109 ?auto_138112 ) ) ( not ( = ?auto_138109 ?auto_138113 ) ) ( not ( = ?auto_138109 ?auto_138114 ) ) ( not ( = ?auto_138109 ?auto_138115 ) ) ( not ( = ?auto_138110 ?auto_138111 ) ) ( not ( = ?auto_138110 ?auto_138112 ) ) ( not ( = ?auto_138110 ?auto_138113 ) ) ( not ( = ?auto_138110 ?auto_138114 ) ) ( not ( = ?auto_138110 ?auto_138115 ) ) ( not ( = ?auto_138111 ?auto_138112 ) ) ( not ( = ?auto_138111 ?auto_138113 ) ) ( not ( = ?auto_138111 ?auto_138114 ) ) ( not ( = ?auto_138111 ?auto_138115 ) ) ( not ( = ?auto_138112 ?auto_138113 ) ) ( not ( = ?auto_138112 ?auto_138114 ) ) ( not ( = ?auto_138112 ?auto_138115 ) ) ( not ( = ?auto_138113 ?auto_138114 ) ) ( not ( = ?auto_138113 ?auto_138115 ) ) ( not ( = ?auto_138114 ?auto_138115 ) ) ( ON ?auto_138115 ?auto_138116 ) ( not ( = ?auto_138108 ?auto_138116 ) ) ( not ( = ?auto_138109 ?auto_138116 ) ) ( not ( = ?auto_138110 ?auto_138116 ) ) ( not ( = ?auto_138111 ?auto_138116 ) ) ( not ( = ?auto_138112 ?auto_138116 ) ) ( not ( = ?auto_138113 ?auto_138116 ) ) ( not ( = ?auto_138114 ?auto_138116 ) ) ( not ( = ?auto_138115 ?auto_138116 ) ) ( ON ?auto_138114 ?auto_138115 ) ( ON-TABLE ?auto_138116 ) ( ON ?auto_138113 ?auto_138114 ) ( CLEAR ?auto_138113 ) ( HOLDING ?auto_138112 ) ( CLEAR ?auto_138111 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138108 ?auto_138109 ?auto_138110 ?auto_138111 ?auto_138112 )
      ( MAKE-8PILE ?auto_138108 ?auto_138109 ?auto_138110 ?auto_138111 ?auto_138112 ?auto_138113 ?auto_138114 ?auto_138115 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138117 - BLOCK
      ?auto_138118 - BLOCK
      ?auto_138119 - BLOCK
      ?auto_138120 - BLOCK
      ?auto_138121 - BLOCK
      ?auto_138122 - BLOCK
      ?auto_138123 - BLOCK
      ?auto_138124 - BLOCK
    )
    :vars
    (
      ?auto_138125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138117 ) ( ON ?auto_138118 ?auto_138117 ) ( ON ?auto_138119 ?auto_138118 ) ( ON ?auto_138120 ?auto_138119 ) ( not ( = ?auto_138117 ?auto_138118 ) ) ( not ( = ?auto_138117 ?auto_138119 ) ) ( not ( = ?auto_138117 ?auto_138120 ) ) ( not ( = ?auto_138117 ?auto_138121 ) ) ( not ( = ?auto_138117 ?auto_138122 ) ) ( not ( = ?auto_138117 ?auto_138123 ) ) ( not ( = ?auto_138117 ?auto_138124 ) ) ( not ( = ?auto_138118 ?auto_138119 ) ) ( not ( = ?auto_138118 ?auto_138120 ) ) ( not ( = ?auto_138118 ?auto_138121 ) ) ( not ( = ?auto_138118 ?auto_138122 ) ) ( not ( = ?auto_138118 ?auto_138123 ) ) ( not ( = ?auto_138118 ?auto_138124 ) ) ( not ( = ?auto_138119 ?auto_138120 ) ) ( not ( = ?auto_138119 ?auto_138121 ) ) ( not ( = ?auto_138119 ?auto_138122 ) ) ( not ( = ?auto_138119 ?auto_138123 ) ) ( not ( = ?auto_138119 ?auto_138124 ) ) ( not ( = ?auto_138120 ?auto_138121 ) ) ( not ( = ?auto_138120 ?auto_138122 ) ) ( not ( = ?auto_138120 ?auto_138123 ) ) ( not ( = ?auto_138120 ?auto_138124 ) ) ( not ( = ?auto_138121 ?auto_138122 ) ) ( not ( = ?auto_138121 ?auto_138123 ) ) ( not ( = ?auto_138121 ?auto_138124 ) ) ( not ( = ?auto_138122 ?auto_138123 ) ) ( not ( = ?auto_138122 ?auto_138124 ) ) ( not ( = ?auto_138123 ?auto_138124 ) ) ( ON ?auto_138124 ?auto_138125 ) ( not ( = ?auto_138117 ?auto_138125 ) ) ( not ( = ?auto_138118 ?auto_138125 ) ) ( not ( = ?auto_138119 ?auto_138125 ) ) ( not ( = ?auto_138120 ?auto_138125 ) ) ( not ( = ?auto_138121 ?auto_138125 ) ) ( not ( = ?auto_138122 ?auto_138125 ) ) ( not ( = ?auto_138123 ?auto_138125 ) ) ( not ( = ?auto_138124 ?auto_138125 ) ) ( ON ?auto_138123 ?auto_138124 ) ( ON-TABLE ?auto_138125 ) ( ON ?auto_138122 ?auto_138123 ) ( CLEAR ?auto_138120 ) ( ON ?auto_138121 ?auto_138122 ) ( CLEAR ?auto_138121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138125 ?auto_138124 ?auto_138123 ?auto_138122 )
      ( MAKE-8PILE ?auto_138117 ?auto_138118 ?auto_138119 ?auto_138120 ?auto_138121 ?auto_138122 ?auto_138123 ?auto_138124 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138126 - BLOCK
      ?auto_138127 - BLOCK
      ?auto_138128 - BLOCK
      ?auto_138129 - BLOCK
      ?auto_138130 - BLOCK
      ?auto_138131 - BLOCK
      ?auto_138132 - BLOCK
      ?auto_138133 - BLOCK
    )
    :vars
    (
      ?auto_138134 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138126 ) ( ON ?auto_138127 ?auto_138126 ) ( ON ?auto_138128 ?auto_138127 ) ( not ( = ?auto_138126 ?auto_138127 ) ) ( not ( = ?auto_138126 ?auto_138128 ) ) ( not ( = ?auto_138126 ?auto_138129 ) ) ( not ( = ?auto_138126 ?auto_138130 ) ) ( not ( = ?auto_138126 ?auto_138131 ) ) ( not ( = ?auto_138126 ?auto_138132 ) ) ( not ( = ?auto_138126 ?auto_138133 ) ) ( not ( = ?auto_138127 ?auto_138128 ) ) ( not ( = ?auto_138127 ?auto_138129 ) ) ( not ( = ?auto_138127 ?auto_138130 ) ) ( not ( = ?auto_138127 ?auto_138131 ) ) ( not ( = ?auto_138127 ?auto_138132 ) ) ( not ( = ?auto_138127 ?auto_138133 ) ) ( not ( = ?auto_138128 ?auto_138129 ) ) ( not ( = ?auto_138128 ?auto_138130 ) ) ( not ( = ?auto_138128 ?auto_138131 ) ) ( not ( = ?auto_138128 ?auto_138132 ) ) ( not ( = ?auto_138128 ?auto_138133 ) ) ( not ( = ?auto_138129 ?auto_138130 ) ) ( not ( = ?auto_138129 ?auto_138131 ) ) ( not ( = ?auto_138129 ?auto_138132 ) ) ( not ( = ?auto_138129 ?auto_138133 ) ) ( not ( = ?auto_138130 ?auto_138131 ) ) ( not ( = ?auto_138130 ?auto_138132 ) ) ( not ( = ?auto_138130 ?auto_138133 ) ) ( not ( = ?auto_138131 ?auto_138132 ) ) ( not ( = ?auto_138131 ?auto_138133 ) ) ( not ( = ?auto_138132 ?auto_138133 ) ) ( ON ?auto_138133 ?auto_138134 ) ( not ( = ?auto_138126 ?auto_138134 ) ) ( not ( = ?auto_138127 ?auto_138134 ) ) ( not ( = ?auto_138128 ?auto_138134 ) ) ( not ( = ?auto_138129 ?auto_138134 ) ) ( not ( = ?auto_138130 ?auto_138134 ) ) ( not ( = ?auto_138131 ?auto_138134 ) ) ( not ( = ?auto_138132 ?auto_138134 ) ) ( not ( = ?auto_138133 ?auto_138134 ) ) ( ON ?auto_138132 ?auto_138133 ) ( ON-TABLE ?auto_138134 ) ( ON ?auto_138131 ?auto_138132 ) ( ON ?auto_138130 ?auto_138131 ) ( CLEAR ?auto_138130 ) ( HOLDING ?auto_138129 ) ( CLEAR ?auto_138128 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138126 ?auto_138127 ?auto_138128 ?auto_138129 )
      ( MAKE-8PILE ?auto_138126 ?auto_138127 ?auto_138128 ?auto_138129 ?auto_138130 ?auto_138131 ?auto_138132 ?auto_138133 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138135 - BLOCK
      ?auto_138136 - BLOCK
      ?auto_138137 - BLOCK
      ?auto_138138 - BLOCK
      ?auto_138139 - BLOCK
      ?auto_138140 - BLOCK
      ?auto_138141 - BLOCK
      ?auto_138142 - BLOCK
    )
    :vars
    (
      ?auto_138143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138135 ) ( ON ?auto_138136 ?auto_138135 ) ( ON ?auto_138137 ?auto_138136 ) ( not ( = ?auto_138135 ?auto_138136 ) ) ( not ( = ?auto_138135 ?auto_138137 ) ) ( not ( = ?auto_138135 ?auto_138138 ) ) ( not ( = ?auto_138135 ?auto_138139 ) ) ( not ( = ?auto_138135 ?auto_138140 ) ) ( not ( = ?auto_138135 ?auto_138141 ) ) ( not ( = ?auto_138135 ?auto_138142 ) ) ( not ( = ?auto_138136 ?auto_138137 ) ) ( not ( = ?auto_138136 ?auto_138138 ) ) ( not ( = ?auto_138136 ?auto_138139 ) ) ( not ( = ?auto_138136 ?auto_138140 ) ) ( not ( = ?auto_138136 ?auto_138141 ) ) ( not ( = ?auto_138136 ?auto_138142 ) ) ( not ( = ?auto_138137 ?auto_138138 ) ) ( not ( = ?auto_138137 ?auto_138139 ) ) ( not ( = ?auto_138137 ?auto_138140 ) ) ( not ( = ?auto_138137 ?auto_138141 ) ) ( not ( = ?auto_138137 ?auto_138142 ) ) ( not ( = ?auto_138138 ?auto_138139 ) ) ( not ( = ?auto_138138 ?auto_138140 ) ) ( not ( = ?auto_138138 ?auto_138141 ) ) ( not ( = ?auto_138138 ?auto_138142 ) ) ( not ( = ?auto_138139 ?auto_138140 ) ) ( not ( = ?auto_138139 ?auto_138141 ) ) ( not ( = ?auto_138139 ?auto_138142 ) ) ( not ( = ?auto_138140 ?auto_138141 ) ) ( not ( = ?auto_138140 ?auto_138142 ) ) ( not ( = ?auto_138141 ?auto_138142 ) ) ( ON ?auto_138142 ?auto_138143 ) ( not ( = ?auto_138135 ?auto_138143 ) ) ( not ( = ?auto_138136 ?auto_138143 ) ) ( not ( = ?auto_138137 ?auto_138143 ) ) ( not ( = ?auto_138138 ?auto_138143 ) ) ( not ( = ?auto_138139 ?auto_138143 ) ) ( not ( = ?auto_138140 ?auto_138143 ) ) ( not ( = ?auto_138141 ?auto_138143 ) ) ( not ( = ?auto_138142 ?auto_138143 ) ) ( ON ?auto_138141 ?auto_138142 ) ( ON-TABLE ?auto_138143 ) ( ON ?auto_138140 ?auto_138141 ) ( ON ?auto_138139 ?auto_138140 ) ( CLEAR ?auto_138137 ) ( ON ?auto_138138 ?auto_138139 ) ( CLEAR ?auto_138138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138143 ?auto_138142 ?auto_138141 ?auto_138140 ?auto_138139 )
      ( MAKE-8PILE ?auto_138135 ?auto_138136 ?auto_138137 ?auto_138138 ?auto_138139 ?auto_138140 ?auto_138141 ?auto_138142 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138144 - BLOCK
      ?auto_138145 - BLOCK
      ?auto_138146 - BLOCK
      ?auto_138147 - BLOCK
      ?auto_138148 - BLOCK
      ?auto_138149 - BLOCK
      ?auto_138150 - BLOCK
      ?auto_138151 - BLOCK
    )
    :vars
    (
      ?auto_138152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138144 ) ( ON ?auto_138145 ?auto_138144 ) ( not ( = ?auto_138144 ?auto_138145 ) ) ( not ( = ?auto_138144 ?auto_138146 ) ) ( not ( = ?auto_138144 ?auto_138147 ) ) ( not ( = ?auto_138144 ?auto_138148 ) ) ( not ( = ?auto_138144 ?auto_138149 ) ) ( not ( = ?auto_138144 ?auto_138150 ) ) ( not ( = ?auto_138144 ?auto_138151 ) ) ( not ( = ?auto_138145 ?auto_138146 ) ) ( not ( = ?auto_138145 ?auto_138147 ) ) ( not ( = ?auto_138145 ?auto_138148 ) ) ( not ( = ?auto_138145 ?auto_138149 ) ) ( not ( = ?auto_138145 ?auto_138150 ) ) ( not ( = ?auto_138145 ?auto_138151 ) ) ( not ( = ?auto_138146 ?auto_138147 ) ) ( not ( = ?auto_138146 ?auto_138148 ) ) ( not ( = ?auto_138146 ?auto_138149 ) ) ( not ( = ?auto_138146 ?auto_138150 ) ) ( not ( = ?auto_138146 ?auto_138151 ) ) ( not ( = ?auto_138147 ?auto_138148 ) ) ( not ( = ?auto_138147 ?auto_138149 ) ) ( not ( = ?auto_138147 ?auto_138150 ) ) ( not ( = ?auto_138147 ?auto_138151 ) ) ( not ( = ?auto_138148 ?auto_138149 ) ) ( not ( = ?auto_138148 ?auto_138150 ) ) ( not ( = ?auto_138148 ?auto_138151 ) ) ( not ( = ?auto_138149 ?auto_138150 ) ) ( not ( = ?auto_138149 ?auto_138151 ) ) ( not ( = ?auto_138150 ?auto_138151 ) ) ( ON ?auto_138151 ?auto_138152 ) ( not ( = ?auto_138144 ?auto_138152 ) ) ( not ( = ?auto_138145 ?auto_138152 ) ) ( not ( = ?auto_138146 ?auto_138152 ) ) ( not ( = ?auto_138147 ?auto_138152 ) ) ( not ( = ?auto_138148 ?auto_138152 ) ) ( not ( = ?auto_138149 ?auto_138152 ) ) ( not ( = ?auto_138150 ?auto_138152 ) ) ( not ( = ?auto_138151 ?auto_138152 ) ) ( ON ?auto_138150 ?auto_138151 ) ( ON-TABLE ?auto_138152 ) ( ON ?auto_138149 ?auto_138150 ) ( ON ?auto_138148 ?auto_138149 ) ( ON ?auto_138147 ?auto_138148 ) ( CLEAR ?auto_138147 ) ( HOLDING ?auto_138146 ) ( CLEAR ?auto_138145 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138144 ?auto_138145 ?auto_138146 )
      ( MAKE-8PILE ?auto_138144 ?auto_138145 ?auto_138146 ?auto_138147 ?auto_138148 ?auto_138149 ?auto_138150 ?auto_138151 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138153 - BLOCK
      ?auto_138154 - BLOCK
      ?auto_138155 - BLOCK
      ?auto_138156 - BLOCK
      ?auto_138157 - BLOCK
      ?auto_138158 - BLOCK
      ?auto_138159 - BLOCK
      ?auto_138160 - BLOCK
    )
    :vars
    (
      ?auto_138161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138153 ) ( ON ?auto_138154 ?auto_138153 ) ( not ( = ?auto_138153 ?auto_138154 ) ) ( not ( = ?auto_138153 ?auto_138155 ) ) ( not ( = ?auto_138153 ?auto_138156 ) ) ( not ( = ?auto_138153 ?auto_138157 ) ) ( not ( = ?auto_138153 ?auto_138158 ) ) ( not ( = ?auto_138153 ?auto_138159 ) ) ( not ( = ?auto_138153 ?auto_138160 ) ) ( not ( = ?auto_138154 ?auto_138155 ) ) ( not ( = ?auto_138154 ?auto_138156 ) ) ( not ( = ?auto_138154 ?auto_138157 ) ) ( not ( = ?auto_138154 ?auto_138158 ) ) ( not ( = ?auto_138154 ?auto_138159 ) ) ( not ( = ?auto_138154 ?auto_138160 ) ) ( not ( = ?auto_138155 ?auto_138156 ) ) ( not ( = ?auto_138155 ?auto_138157 ) ) ( not ( = ?auto_138155 ?auto_138158 ) ) ( not ( = ?auto_138155 ?auto_138159 ) ) ( not ( = ?auto_138155 ?auto_138160 ) ) ( not ( = ?auto_138156 ?auto_138157 ) ) ( not ( = ?auto_138156 ?auto_138158 ) ) ( not ( = ?auto_138156 ?auto_138159 ) ) ( not ( = ?auto_138156 ?auto_138160 ) ) ( not ( = ?auto_138157 ?auto_138158 ) ) ( not ( = ?auto_138157 ?auto_138159 ) ) ( not ( = ?auto_138157 ?auto_138160 ) ) ( not ( = ?auto_138158 ?auto_138159 ) ) ( not ( = ?auto_138158 ?auto_138160 ) ) ( not ( = ?auto_138159 ?auto_138160 ) ) ( ON ?auto_138160 ?auto_138161 ) ( not ( = ?auto_138153 ?auto_138161 ) ) ( not ( = ?auto_138154 ?auto_138161 ) ) ( not ( = ?auto_138155 ?auto_138161 ) ) ( not ( = ?auto_138156 ?auto_138161 ) ) ( not ( = ?auto_138157 ?auto_138161 ) ) ( not ( = ?auto_138158 ?auto_138161 ) ) ( not ( = ?auto_138159 ?auto_138161 ) ) ( not ( = ?auto_138160 ?auto_138161 ) ) ( ON ?auto_138159 ?auto_138160 ) ( ON-TABLE ?auto_138161 ) ( ON ?auto_138158 ?auto_138159 ) ( ON ?auto_138157 ?auto_138158 ) ( ON ?auto_138156 ?auto_138157 ) ( CLEAR ?auto_138154 ) ( ON ?auto_138155 ?auto_138156 ) ( CLEAR ?auto_138155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138161 ?auto_138160 ?auto_138159 ?auto_138158 ?auto_138157 ?auto_138156 )
      ( MAKE-8PILE ?auto_138153 ?auto_138154 ?auto_138155 ?auto_138156 ?auto_138157 ?auto_138158 ?auto_138159 ?auto_138160 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138162 - BLOCK
      ?auto_138163 - BLOCK
      ?auto_138164 - BLOCK
      ?auto_138165 - BLOCK
      ?auto_138166 - BLOCK
      ?auto_138167 - BLOCK
      ?auto_138168 - BLOCK
      ?auto_138169 - BLOCK
    )
    :vars
    (
      ?auto_138170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138162 ) ( not ( = ?auto_138162 ?auto_138163 ) ) ( not ( = ?auto_138162 ?auto_138164 ) ) ( not ( = ?auto_138162 ?auto_138165 ) ) ( not ( = ?auto_138162 ?auto_138166 ) ) ( not ( = ?auto_138162 ?auto_138167 ) ) ( not ( = ?auto_138162 ?auto_138168 ) ) ( not ( = ?auto_138162 ?auto_138169 ) ) ( not ( = ?auto_138163 ?auto_138164 ) ) ( not ( = ?auto_138163 ?auto_138165 ) ) ( not ( = ?auto_138163 ?auto_138166 ) ) ( not ( = ?auto_138163 ?auto_138167 ) ) ( not ( = ?auto_138163 ?auto_138168 ) ) ( not ( = ?auto_138163 ?auto_138169 ) ) ( not ( = ?auto_138164 ?auto_138165 ) ) ( not ( = ?auto_138164 ?auto_138166 ) ) ( not ( = ?auto_138164 ?auto_138167 ) ) ( not ( = ?auto_138164 ?auto_138168 ) ) ( not ( = ?auto_138164 ?auto_138169 ) ) ( not ( = ?auto_138165 ?auto_138166 ) ) ( not ( = ?auto_138165 ?auto_138167 ) ) ( not ( = ?auto_138165 ?auto_138168 ) ) ( not ( = ?auto_138165 ?auto_138169 ) ) ( not ( = ?auto_138166 ?auto_138167 ) ) ( not ( = ?auto_138166 ?auto_138168 ) ) ( not ( = ?auto_138166 ?auto_138169 ) ) ( not ( = ?auto_138167 ?auto_138168 ) ) ( not ( = ?auto_138167 ?auto_138169 ) ) ( not ( = ?auto_138168 ?auto_138169 ) ) ( ON ?auto_138169 ?auto_138170 ) ( not ( = ?auto_138162 ?auto_138170 ) ) ( not ( = ?auto_138163 ?auto_138170 ) ) ( not ( = ?auto_138164 ?auto_138170 ) ) ( not ( = ?auto_138165 ?auto_138170 ) ) ( not ( = ?auto_138166 ?auto_138170 ) ) ( not ( = ?auto_138167 ?auto_138170 ) ) ( not ( = ?auto_138168 ?auto_138170 ) ) ( not ( = ?auto_138169 ?auto_138170 ) ) ( ON ?auto_138168 ?auto_138169 ) ( ON-TABLE ?auto_138170 ) ( ON ?auto_138167 ?auto_138168 ) ( ON ?auto_138166 ?auto_138167 ) ( ON ?auto_138165 ?auto_138166 ) ( ON ?auto_138164 ?auto_138165 ) ( CLEAR ?auto_138164 ) ( HOLDING ?auto_138163 ) ( CLEAR ?auto_138162 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138162 ?auto_138163 )
      ( MAKE-8PILE ?auto_138162 ?auto_138163 ?auto_138164 ?auto_138165 ?auto_138166 ?auto_138167 ?auto_138168 ?auto_138169 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138171 - BLOCK
      ?auto_138172 - BLOCK
      ?auto_138173 - BLOCK
      ?auto_138174 - BLOCK
      ?auto_138175 - BLOCK
      ?auto_138176 - BLOCK
      ?auto_138177 - BLOCK
      ?auto_138178 - BLOCK
    )
    :vars
    (
      ?auto_138179 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138171 ) ( not ( = ?auto_138171 ?auto_138172 ) ) ( not ( = ?auto_138171 ?auto_138173 ) ) ( not ( = ?auto_138171 ?auto_138174 ) ) ( not ( = ?auto_138171 ?auto_138175 ) ) ( not ( = ?auto_138171 ?auto_138176 ) ) ( not ( = ?auto_138171 ?auto_138177 ) ) ( not ( = ?auto_138171 ?auto_138178 ) ) ( not ( = ?auto_138172 ?auto_138173 ) ) ( not ( = ?auto_138172 ?auto_138174 ) ) ( not ( = ?auto_138172 ?auto_138175 ) ) ( not ( = ?auto_138172 ?auto_138176 ) ) ( not ( = ?auto_138172 ?auto_138177 ) ) ( not ( = ?auto_138172 ?auto_138178 ) ) ( not ( = ?auto_138173 ?auto_138174 ) ) ( not ( = ?auto_138173 ?auto_138175 ) ) ( not ( = ?auto_138173 ?auto_138176 ) ) ( not ( = ?auto_138173 ?auto_138177 ) ) ( not ( = ?auto_138173 ?auto_138178 ) ) ( not ( = ?auto_138174 ?auto_138175 ) ) ( not ( = ?auto_138174 ?auto_138176 ) ) ( not ( = ?auto_138174 ?auto_138177 ) ) ( not ( = ?auto_138174 ?auto_138178 ) ) ( not ( = ?auto_138175 ?auto_138176 ) ) ( not ( = ?auto_138175 ?auto_138177 ) ) ( not ( = ?auto_138175 ?auto_138178 ) ) ( not ( = ?auto_138176 ?auto_138177 ) ) ( not ( = ?auto_138176 ?auto_138178 ) ) ( not ( = ?auto_138177 ?auto_138178 ) ) ( ON ?auto_138178 ?auto_138179 ) ( not ( = ?auto_138171 ?auto_138179 ) ) ( not ( = ?auto_138172 ?auto_138179 ) ) ( not ( = ?auto_138173 ?auto_138179 ) ) ( not ( = ?auto_138174 ?auto_138179 ) ) ( not ( = ?auto_138175 ?auto_138179 ) ) ( not ( = ?auto_138176 ?auto_138179 ) ) ( not ( = ?auto_138177 ?auto_138179 ) ) ( not ( = ?auto_138178 ?auto_138179 ) ) ( ON ?auto_138177 ?auto_138178 ) ( ON-TABLE ?auto_138179 ) ( ON ?auto_138176 ?auto_138177 ) ( ON ?auto_138175 ?auto_138176 ) ( ON ?auto_138174 ?auto_138175 ) ( ON ?auto_138173 ?auto_138174 ) ( CLEAR ?auto_138171 ) ( ON ?auto_138172 ?auto_138173 ) ( CLEAR ?auto_138172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138179 ?auto_138178 ?auto_138177 ?auto_138176 ?auto_138175 ?auto_138174 ?auto_138173 )
      ( MAKE-8PILE ?auto_138171 ?auto_138172 ?auto_138173 ?auto_138174 ?auto_138175 ?auto_138176 ?auto_138177 ?auto_138178 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138180 - BLOCK
      ?auto_138181 - BLOCK
      ?auto_138182 - BLOCK
      ?auto_138183 - BLOCK
      ?auto_138184 - BLOCK
      ?auto_138185 - BLOCK
      ?auto_138186 - BLOCK
      ?auto_138187 - BLOCK
    )
    :vars
    (
      ?auto_138188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138180 ?auto_138181 ) ) ( not ( = ?auto_138180 ?auto_138182 ) ) ( not ( = ?auto_138180 ?auto_138183 ) ) ( not ( = ?auto_138180 ?auto_138184 ) ) ( not ( = ?auto_138180 ?auto_138185 ) ) ( not ( = ?auto_138180 ?auto_138186 ) ) ( not ( = ?auto_138180 ?auto_138187 ) ) ( not ( = ?auto_138181 ?auto_138182 ) ) ( not ( = ?auto_138181 ?auto_138183 ) ) ( not ( = ?auto_138181 ?auto_138184 ) ) ( not ( = ?auto_138181 ?auto_138185 ) ) ( not ( = ?auto_138181 ?auto_138186 ) ) ( not ( = ?auto_138181 ?auto_138187 ) ) ( not ( = ?auto_138182 ?auto_138183 ) ) ( not ( = ?auto_138182 ?auto_138184 ) ) ( not ( = ?auto_138182 ?auto_138185 ) ) ( not ( = ?auto_138182 ?auto_138186 ) ) ( not ( = ?auto_138182 ?auto_138187 ) ) ( not ( = ?auto_138183 ?auto_138184 ) ) ( not ( = ?auto_138183 ?auto_138185 ) ) ( not ( = ?auto_138183 ?auto_138186 ) ) ( not ( = ?auto_138183 ?auto_138187 ) ) ( not ( = ?auto_138184 ?auto_138185 ) ) ( not ( = ?auto_138184 ?auto_138186 ) ) ( not ( = ?auto_138184 ?auto_138187 ) ) ( not ( = ?auto_138185 ?auto_138186 ) ) ( not ( = ?auto_138185 ?auto_138187 ) ) ( not ( = ?auto_138186 ?auto_138187 ) ) ( ON ?auto_138187 ?auto_138188 ) ( not ( = ?auto_138180 ?auto_138188 ) ) ( not ( = ?auto_138181 ?auto_138188 ) ) ( not ( = ?auto_138182 ?auto_138188 ) ) ( not ( = ?auto_138183 ?auto_138188 ) ) ( not ( = ?auto_138184 ?auto_138188 ) ) ( not ( = ?auto_138185 ?auto_138188 ) ) ( not ( = ?auto_138186 ?auto_138188 ) ) ( not ( = ?auto_138187 ?auto_138188 ) ) ( ON ?auto_138186 ?auto_138187 ) ( ON-TABLE ?auto_138188 ) ( ON ?auto_138185 ?auto_138186 ) ( ON ?auto_138184 ?auto_138185 ) ( ON ?auto_138183 ?auto_138184 ) ( ON ?auto_138182 ?auto_138183 ) ( ON ?auto_138181 ?auto_138182 ) ( CLEAR ?auto_138181 ) ( HOLDING ?auto_138180 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138180 )
      ( MAKE-8PILE ?auto_138180 ?auto_138181 ?auto_138182 ?auto_138183 ?auto_138184 ?auto_138185 ?auto_138186 ?auto_138187 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_138189 - BLOCK
      ?auto_138190 - BLOCK
      ?auto_138191 - BLOCK
      ?auto_138192 - BLOCK
      ?auto_138193 - BLOCK
      ?auto_138194 - BLOCK
      ?auto_138195 - BLOCK
      ?auto_138196 - BLOCK
    )
    :vars
    (
      ?auto_138197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138189 ?auto_138190 ) ) ( not ( = ?auto_138189 ?auto_138191 ) ) ( not ( = ?auto_138189 ?auto_138192 ) ) ( not ( = ?auto_138189 ?auto_138193 ) ) ( not ( = ?auto_138189 ?auto_138194 ) ) ( not ( = ?auto_138189 ?auto_138195 ) ) ( not ( = ?auto_138189 ?auto_138196 ) ) ( not ( = ?auto_138190 ?auto_138191 ) ) ( not ( = ?auto_138190 ?auto_138192 ) ) ( not ( = ?auto_138190 ?auto_138193 ) ) ( not ( = ?auto_138190 ?auto_138194 ) ) ( not ( = ?auto_138190 ?auto_138195 ) ) ( not ( = ?auto_138190 ?auto_138196 ) ) ( not ( = ?auto_138191 ?auto_138192 ) ) ( not ( = ?auto_138191 ?auto_138193 ) ) ( not ( = ?auto_138191 ?auto_138194 ) ) ( not ( = ?auto_138191 ?auto_138195 ) ) ( not ( = ?auto_138191 ?auto_138196 ) ) ( not ( = ?auto_138192 ?auto_138193 ) ) ( not ( = ?auto_138192 ?auto_138194 ) ) ( not ( = ?auto_138192 ?auto_138195 ) ) ( not ( = ?auto_138192 ?auto_138196 ) ) ( not ( = ?auto_138193 ?auto_138194 ) ) ( not ( = ?auto_138193 ?auto_138195 ) ) ( not ( = ?auto_138193 ?auto_138196 ) ) ( not ( = ?auto_138194 ?auto_138195 ) ) ( not ( = ?auto_138194 ?auto_138196 ) ) ( not ( = ?auto_138195 ?auto_138196 ) ) ( ON ?auto_138196 ?auto_138197 ) ( not ( = ?auto_138189 ?auto_138197 ) ) ( not ( = ?auto_138190 ?auto_138197 ) ) ( not ( = ?auto_138191 ?auto_138197 ) ) ( not ( = ?auto_138192 ?auto_138197 ) ) ( not ( = ?auto_138193 ?auto_138197 ) ) ( not ( = ?auto_138194 ?auto_138197 ) ) ( not ( = ?auto_138195 ?auto_138197 ) ) ( not ( = ?auto_138196 ?auto_138197 ) ) ( ON ?auto_138195 ?auto_138196 ) ( ON-TABLE ?auto_138197 ) ( ON ?auto_138194 ?auto_138195 ) ( ON ?auto_138193 ?auto_138194 ) ( ON ?auto_138192 ?auto_138193 ) ( ON ?auto_138191 ?auto_138192 ) ( ON ?auto_138190 ?auto_138191 ) ( ON ?auto_138189 ?auto_138190 ) ( CLEAR ?auto_138189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138197 ?auto_138196 ?auto_138195 ?auto_138194 ?auto_138193 ?auto_138192 ?auto_138191 ?auto_138190 )
      ( MAKE-8PILE ?auto_138189 ?auto_138190 ?auto_138191 ?auto_138192 ?auto_138193 ?auto_138194 ?auto_138195 ?auto_138196 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138205 - BLOCK
      ?auto_138206 - BLOCK
      ?auto_138207 - BLOCK
      ?auto_138208 - BLOCK
      ?auto_138209 - BLOCK
      ?auto_138210 - BLOCK
      ?auto_138211 - BLOCK
    )
    :vars
    (
      ?auto_138212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138212 ?auto_138211 ) ( CLEAR ?auto_138212 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138205 ) ( ON ?auto_138206 ?auto_138205 ) ( ON ?auto_138207 ?auto_138206 ) ( ON ?auto_138208 ?auto_138207 ) ( ON ?auto_138209 ?auto_138208 ) ( ON ?auto_138210 ?auto_138209 ) ( ON ?auto_138211 ?auto_138210 ) ( not ( = ?auto_138205 ?auto_138206 ) ) ( not ( = ?auto_138205 ?auto_138207 ) ) ( not ( = ?auto_138205 ?auto_138208 ) ) ( not ( = ?auto_138205 ?auto_138209 ) ) ( not ( = ?auto_138205 ?auto_138210 ) ) ( not ( = ?auto_138205 ?auto_138211 ) ) ( not ( = ?auto_138205 ?auto_138212 ) ) ( not ( = ?auto_138206 ?auto_138207 ) ) ( not ( = ?auto_138206 ?auto_138208 ) ) ( not ( = ?auto_138206 ?auto_138209 ) ) ( not ( = ?auto_138206 ?auto_138210 ) ) ( not ( = ?auto_138206 ?auto_138211 ) ) ( not ( = ?auto_138206 ?auto_138212 ) ) ( not ( = ?auto_138207 ?auto_138208 ) ) ( not ( = ?auto_138207 ?auto_138209 ) ) ( not ( = ?auto_138207 ?auto_138210 ) ) ( not ( = ?auto_138207 ?auto_138211 ) ) ( not ( = ?auto_138207 ?auto_138212 ) ) ( not ( = ?auto_138208 ?auto_138209 ) ) ( not ( = ?auto_138208 ?auto_138210 ) ) ( not ( = ?auto_138208 ?auto_138211 ) ) ( not ( = ?auto_138208 ?auto_138212 ) ) ( not ( = ?auto_138209 ?auto_138210 ) ) ( not ( = ?auto_138209 ?auto_138211 ) ) ( not ( = ?auto_138209 ?auto_138212 ) ) ( not ( = ?auto_138210 ?auto_138211 ) ) ( not ( = ?auto_138210 ?auto_138212 ) ) ( not ( = ?auto_138211 ?auto_138212 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138212 ?auto_138211 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138230 - BLOCK
      ?auto_138231 - BLOCK
      ?auto_138232 - BLOCK
      ?auto_138233 - BLOCK
      ?auto_138234 - BLOCK
      ?auto_138235 - BLOCK
      ?auto_138236 - BLOCK
    )
    :vars
    (
      ?auto_138237 - BLOCK
      ?auto_138238 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138230 ) ( ON ?auto_138231 ?auto_138230 ) ( ON ?auto_138232 ?auto_138231 ) ( ON ?auto_138233 ?auto_138232 ) ( ON ?auto_138234 ?auto_138233 ) ( ON ?auto_138235 ?auto_138234 ) ( not ( = ?auto_138230 ?auto_138231 ) ) ( not ( = ?auto_138230 ?auto_138232 ) ) ( not ( = ?auto_138230 ?auto_138233 ) ) ( not ( = ?auto_138230 ?auto_138234 ) ) ( not ( = ?auto_138230 ?auto_138235 ) ) ( not ( = ?auto_138230 ?auto_138236 ) ) ( not ( = ?auto_138230 ?auto_138237 ) ) ( not ( = ?auto_138231 ?auto_138232 ) ) ( not ( = ?auto_138231 ?auto_138233 ) ) ( not ( = ?auto_138231 ?auto_138234 ) ) ( not ( = ?auto_138231 ?auto_138235 ) ) ( not ( = ?auto_138231 ?auto_138236 ) ) ( not ( = ?auto_138231 ?auto_138237 ) ) ( not ( = ?auto_138232 ?auto_138233 ) ) ( not ( = ?auto_138232 ?auto_138234 ) ) ( not ( = ?auto_138232 ?auto_138235 ) ) ( not ( = ?auto_138232 ?auto_138236 ) ) ( not ( = ?auto_138232 ?auto_138237 ) ) ( not ( = ?auto_138233 ?auto_138234 ) ) ( not ( = ?auto_138233 ?auto_138235 ) ) ( not ( = ?auto_138233 ?auto_138236 ) ) ( not ( = ?auto_138233 ?auto_138237 ) ) ( not ( = ?auto_138234 ?auto_138235 ) ) ( not ( = ?auto_138234 ?auto_138236 ) ) ( not ( = ?auto_138234 ?auto_138237 ) ) ( not ( = ?auto_138235 ?auto_138236 ) ) ( not ( = ?auto_138235 ?auto_138237 ) ) ( not ( = ?auto_138236 ?auto_138237 ) ) ( ON ?auto_138237 ?auto_138238 ) ( CLEAR ?auto_138237 ) ( not ( = ?auto_138230 ?auto_138238 ) ) ( not ( = ?auto_138231 ?auto_138238 ) ) ( not ( = ?auto_138232 ?auto_138238 ) ) ( not ( = ?auto_138233 ?auto_138238 ) ) ( not ( = ?auto_138234 ?auto_138238 ) ) ( not ( = ?auto_138235 ?auto_138238 ) ) ( not ( = ?auto_138236 ?auto_138238 ) ) ( not ( = ?auto_138237 ?auto_138238 ) ) ( HOLDING ?auto_138236 ) ( CLEAR ?auto_138235 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138230 ?auto_138231 ?auto_138232 ?auto_138233 ?auto_138234 ?auto_138235 ?auto_138236 ?auto_138237 )
      ( MAKE-7PILE ?auto_138230 ?auto_138231 ?auto_138232 ?auto_138233 ?auto_138234 ?auto_138235 ?auto_138236 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138239 - BLOCK
      ?auto_138240 - BLOCK
      ?auto_138241 - BLOCK
      ?auto_138242 - BLOCK
      ?auto_138243 - BLOCK
      ?auto_138244 - BLOCK
      ?auto_138245 - BLOCK
    )
    :vars
    (
      ?auto_138246 - BLOCK
      ?auto_138247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138239 ) ( ON ?auto_138240 ?auto_138239 ) ( ON ?auto_138241 ?auto_138240 ) ( ON ?auto_138242 ?auto_138241 ) ( ON ?auto_138243 ?auto_138242 ) ( ON ?auto_138244 ?auto_138243 ) ( not ( = ?auto_138239 ?auto_138240 ) ) ( not ( = ?auto_138239 ?auto_138241 ) ) ( not ( = ?auto_138239 ?auto_138242 ) ) ( not ( = ?auto_138239 ?auto_138243 ) ) ( not ( = ?auto_138239 ?auto_138244 ) ) ( not ( = ?auto_138239 ?auto_138245 ) ) ( not ( = ?auto_138239 ?auto_138246 ) ) ( not ( = ?auto_138240 ?auto_138241 ) ) ( not ( = ?auto_138240 ?auto_138242 ) ) ( not ( = ?auto_138240 ?auto_138243 ) ) ( not ( = ?auto_138240 ?auto_138244 ) ) ( not ( = ?auto_138240 ?auto_138245 ) ) ( not ( = ?auto_138240 ?auto_138246 ) ) ( not ( = ?auto_138241 ?auto_138242 ) ) ( not ( = ?auto_138241 ?auto_138243 ) ) ( not ( = ?auto_138241 ?auto_138244 ) ) ( not ( = ?auto_138241 ?auto_138245 ) ) ( not ( = ?auto_138241 ?auto_138246 ) ) ( not ( = ?auto_138242 ?auto_138243 ) ) ( not ( = ?auto_138242 ?auto_138244 ) ) ( not ( = ?auto_138242 ?auto_138245 ) ) ( not ( = ?auto_138242 ?auto_138246 ) ) ( not ( = ?auto_138243 ?auto_138244 ) ) ( not ( = ?auto_138243 ?auto_138245 ) ) ( not ( = ?auto_138243 ?auto_138246 ) ) ( not ( = ?auto_138244 ?auto_138245 ) ) ( not ( = ?auto_138244 ?auto_138246 ) ) ( not ( = ?auto_138245 ?auto_138246 ) ) ( ON ?auto_138246 ?auto_138247 ) ( not ( = ?auto_138239 ?auto_138247 ) ) ( not ( = ?auto_138240 ?auto_138247 ) ) ( not ( = ?auto_138241 ?auto_138247 ) ) ( not ( = ?auto_138242 ?auto_138247 ) ) ( not ( = ?auto_138243 ?auto_138247 ) ) ( not ( = ?auto_138244 ?auto_138247 ) ) ( not ( = ?auto_138245 ?auto_138247 ) ) ( not ( = ?auto_138246 ?auto_138247 ) ) ( CLEAR ?auto_138244 ) ( ON ?auto_138245 ?auto_138246 ) ( CLEAR ?auto_138245 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138247 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138247 ?auto_138246 )
      ( MAKE-7PILE ?auto_138239 ?auto_138240 ?auto_138241 ?auto_138242 ?auto_138243 ?auto_138244 ?auto_138245 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138248 - BLOCK
      ?auto_138249 - BLOCK
      ?auto_138250 - BLOCK
      ?auto_138251 - BLOCK
      ?auto_138252 - BLOCK
      ?auto_138253 - BLOCK
      ?auto_138254 - BLOCK
    )
    :vars
    (
      ?auto_138255 - BLOCK
      ?auto_138256 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138248 ) ( ON ?auto_138249 ?auto_138248 ) ( ON ?auto_138250 ?auto_138249 ) ( ON ?auto_138251 ?auto_138250 ) ( ON ?auto_138252 ?auto_138251 ) ( not ( = ?auto_138248 ?auto_138249 ) ) ( not ( = ?auto_138248 ?auto_138250 ) ) ( not ( = ?auto_138248 ?auto_138251 ) ) ( not ( = ?auto_138248 ?auto_138252 ) ) ( not ( = ?auto_138248 ?auto_138253 ) ) ( not ( = ?auto_138248 ?auto_138254 ) ) ( not ( = ?auto_138248 ?auto_138255 ) ) ( not ( = ?auto_138249 ?auto_138250 ) ) ( not ( = ?auto_138249 ?auto_138251 ) ) ( not ( = ?auto_138249 ?auto_138252 ) ) ( not ( = ?auto_138249 ?auto_138253 ) ) ( not ( = ?auto_138249 ?auto_138254 ) ) ( not ( = ?auto_138249 ?auto_138255 ) ) ( not ( = ?auto_138250 ?auto_138251 ) ) ( not ( = ?auto_138250 ?auto_138252 ) ) ( not ( = ?auto_138250 ?auto_138253 ) ) ( not ( = ?auto_138250 ?auto_138254 ) ) ( not ( = ?auto_138250 ?auto_138255 ) ) ( not ( = ?auto_138251 ?auto_138252 ) ) ( not ( = ?auto_138251 ?auto_138253 ) ) ( not ( = ?auto_138251 ?auto_138254 ) ) ( not ( = ?auto_138251 ?auto_138255 ) ) ( not ( = ?auto_138252 ?auto_138253 ) ) ( not ( = ?auto_138252 ?auto_138254 ) ) ( not ( = ?auto_138252 ?auto_138255 ) ) ( not ( = ?auto_138253 ?auto_138254 ) ) ( not ( = ?auto_138253 ?auto_138255 ) ) ( not ( = ?auto_138254 ?auto_138255 ) ) ( ON ?auto_138255 ?auto_138256 ) ( not ( = ?auto_138248 ?auto_138256 ) ) ( not ( = ?auto_138249 ?auto_138256 ) ) ( not ( = ?auto_138250 ?auto_138256 ) ) ( not ( = ?auto_138251 ?auto_138256 ) ) ( not ( = ?auto_138252 ?auto_138256 ) ) ( not ( = ?auto_138253 ?auto_138256 ) ) ( not ( = ?auto_138254 ?auto_138256 ) ) ( not ( = ?auto_138255 ?auto_138256 ) ) ( ON ?auto_138254 ?auto_138255 ) ( CLEAR ?auto_138254 ) ( ON-TABLE ?auto_138256 ) ( HOLDING ?auto_138253 ) ( CLEAR ?auto_138252 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138248 ?auto_138249 ?auto_138250 ?auto_138251 ?auto_138252 ?auto_138253 )
      ( MAKE-7PILE ?auto_138248 ?auto_138249 ?auto_138250 ?auto_138251 ?auto_138252 ?auto_138253 ?auto_138254 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138257 - BLOCK
      ?auto_138258 - BLOCK
      ?auto_138259 - BLOCK
      ?auto_138260 - BLOCK
      ?auto_138261 - BLOCK
      ?auto_138262 - BLOCK
      ?auto_138263 - BLOCK
    )
    :vars
    (
      ?auto_138265 - BLOCK
      ?auto_138264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138257 ) ( ON ?auto_138258 ?auto_138257 ) ( ON ?auto_138259 ?auto_138258 ) ( ON ?auto_138260 ?auto_138259 ) ( ON ?auto_138261 ?auto_138260 ) ( not ( = ?auto_138257 ?auto_138258 ) ) ( not ( = ?auto_138257 ?auto_138259 ) ) ( not ( = ?auto_138257 ?auto_138260 ) ) ( not ( = ?auto_138257 ?auto_138261 ) ) ( not ( = ?auto_138257 ?auto_138262 ) ) ( not ( = ?auto_138257 ?auto_138263 ) ) ( not ( = ?auto_138257 ?auto_138265 ) ) ( not ( = ?auto_138258 ?auto_138259 ) ) ( not ( = ?auto_138258 ?auto_138260 ) ) ( not ( = ?auto_138258 ?auto_138261 ) ) ( not ( = ?auto_138258 ?auto_138262 ) ) ( not ( = ?auto_138258 ?auto_138263 ) ) ( not ( = ?auto_138258 ?auto_138265 ) ) ( not ( = ?auto_138259 ?auto_138260 ) ) ( not ( = ?auto_138259 ?auto_138261 ) ) ( not ( = ?auto_138259 ?auto_138262 ) ) ( not ( = ?auto_138259 ?auto_138263 ) ) ( not ( = ?auto_138259 ?auto_138265 ) ) ( not ( = ?auto_138260 ?auto_138261 ) ) ( not ( = ?auto_138260 ?auto_138262 ) ) ( not ( = ?auto_138260 ?auto_138263 ) ) ( not ( = ?auto_138260 ?auto_138265 ) ) ( not ( = ?auto_138261 ?auto_138262 ) ) ( not ( = ?auto_138261 ?auto_138263 ) ) ( not ( = ?auto_138261 ?auto_138265 ) ) ( not ( = ?auto_138262 ?auto_138263 ) ) ( not ( = ?auto_138262 ?auto_138265 ) ) ( not ( = ?auto_138263 ?auto_138265 ) ) ( ON ?auto_138265 ?auto_138264 ) ( not ( = ?auto_138257 ?auto_138264 ) ) ( not ( = ?auto_138258 ?auto_138264 ) ) ( not ( = ?auto_138259 ?auto_138264 ) ) ( not ( = ?auto_138260 ?auto_138264 ) ) ( not ( = ?auto_138261 ?auto_138264 ) ) ( not ( = ?auto_138262 ?auto_138264 ) ) ( not ( = ?auto_138263 ?auto_138264 ) ) ( not ( = ?auto_138265 ?auto_138264 ) ) ( ON ?auto_138263 ?auto_138265 ) ( ON-TABLE ?auto_138264 ) ( CLEAR ?auto_138261 ) ( ON ?auto_138262 ?auto_138263 ) ( CLEAR ?auto_138262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138264 ?auto_138265 ?auto_138263 )
      ( MAKE-7PILE ?auto_138257 ?auto_138258 ?auto_138259 ?auto_138260 ?auto_138261 ?auto_138262 ?auto_138263 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138266 - BLOCK
      ?auto_138267 - BLOCK
      ?auto_138268 - BLOCK
      ?auto_138269 - BLOCK
      ?auto_138270 - BLOCK
      ?auto_138271 - BLOCK
      ?auto_138272 - BLOCK
    )
    :vars
    (
      ?auto_138273 - BLOCK
      ?auto_138274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138266 ) ( ON ?auto_138267 ?auto_138266 ) ( ON ?auto_138268 ?auto_138267 ) ( ON ?auto_138269 ?auto_138268 ) ( not ( = ?auto_138266 ?auto_138267 ) ) ( not ( = ?auto_138266 ?auto_138268 ) ) ( not ( = ?auto_138266 ?auto_138269 ) ) ( not ( = ?auto_138266 ?auto_138270 ) ) ( not ( = ?auto_138266 ?auto_138271 ) ) ( not ( = ?auto_138266 ?auto_138272 ) ) ( not ( = ?auto_138266 ?auto_138273 ) ) ( not ( = ?auto_138267 ?auto_138268 ) ) ( not ( = ?auto_138267 ?auto_138269 ) ) ( not ( = ?auto_138267 ?auto_138270 ) ) ( not ( = ?auto_138267 ?auto_138271 ) ) ( not ( = ?auto_138267 ?auto_138272 ) ) ( not ( = ?auto_138267 ?auto_138273 ) ) ( not ( = ?auto_138268 ?auto_138269 ) ) ( not ( = ?auto_138268 ?auto_138270 ) ) ( not ( = ?auto_138268 ?auto_138271 ) ) ( not ( = ?auto_138268 ?auto_138272 ) ) ( not ( = ?auto_138268 ?auto_138273 ) ) ( not ( = ?auto_138269 ?auto_138270 ) ) ( not ( = ?auto_138269 ?auto_138271 ) ) ( not ( = ?auto_138269 ?auto_138272 ) ) ( not ( = ?auto_138269 ?auto_138273 ) ) ( not ( = ?auto_138270 ?auto_138271 ) ) ( not ( = ?auto_138270 ?auto_138272 ) ) ( not ( = ?auto_138270 ?auto_138273 ) ) ( not ( = ?auto_138271 ?auto_138272 ) ) ( not ( = ?auto_138271 ?auto_138273 ) ) ( not ( = ?auto_138272 ?auto_138273 ) ) ( ON ?auto_138273 ?auto_138274 ) ( not ( = ?auto_138266 ?auto_138274 ) ) ( not ( = ?auto_138267 ?auto_138274 ) ) ( not ( = ?auto_138268 ?auto_138274 ) ) ( not ( = ?auto_138269 ?auto_138274 ) ) ( not ( = ?auto_138270 ?auto_138274 ) ) ( not ( = ?auto_138271 ?auto_138274 ) ) ( not ( = ?auto_138272 ?auto_138274 ) ) ( not ( = ?auto_138273 ?auto_138274 ) ) ( ON ?auto_138272 ?auto_138273 ) ( ON-TABLE ?auto_138274 ) ( ON ?auto_138271 ?auto_138272 ) ( CLEAR ?auto_138271 ) ( HOLDING ?auto_138270 ) ( CLEAR ?auto_138269 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138266 ?auto_138267 ?auto_138268 ?auto_138269 ?auto_138270 )
      ( MAKE-7PILE ?auto_138266 ?auto_138267 ?auto_138268 ?auto_138269 ?auto_138270 ?auto_138271 ?auto_138272 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138275 - BLOCK
      ?auto_138276 - BLOCK
      ?auto_138277 - BLOCK
      ?auto_138278 - BLOCK
      ?auto_138279 - BLOCK
      ?auto_138280 - BLOCK
      ?auto_138281 - BLOCK
    )
    :vars
    (
      ?auto_138282 - BLOCK
      ?auto_138283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138275 ) ( ON ?auto_138276 ?auto_138275 ) ( ON ?auto_138277 ?auto_138276 ) ( ON ?auto_138278 ?auto_138277 ) ( not ( = ?auto_138275 ?auto_138276 ) ) ( not ( = ?auto_138275 ?auto_138277 ) ) ( not ( = ?auto_138275 ?auto_138278 ) ) ( not ( = ?auto_138275 ?auto_138279 ) ) ( not ( = ?auto_138275 ?auto_138280 ) ) ( not ( = ?auto_138275 ?auto_138281 ) ) ( not ( = ?auto_138275 ?auto_138282 ) ) ( not ( = ?auto_138276 ?auto_138277 ) ) ( not ( = ?auto_138276 ?auto_138278 ) ) ( not ( = ?auto_138276 ?auto_138279 ) ) ( not ( = ?auto_138276 ?auto_138280 ) ) ( not ( = ?auto_138276 ?auto_138281 ) ) ( not ( = ?auto_138276 ?auto_138282 ) ) ( not ( = ?auto_138277 ?auto_138278 ) ) ( not ( = ?auto_138277 ?auto_138279 ) ) ( not ( = ?auto_138277 ?auto_138280 ) ) ( not ( = ?auto_138277 ?auto_138281 ) ) ( not ( = ?auto_138277 ?auto_138282 ) ) ( not ( = ?auto_138278 ?auto_138279 ) ) ( not ( = ?auto_138278 ?auto_138280 ) ) ( not ( = ?auto_138278 ?auto_138281 ) ) ( not ( = ?auto_138278 ?auto_138282 ) ) ( not ( = ?auto_138279 ?auto_138280 ) ) ( not ( = ?auto_138279 ?auto_138281 ) ) ( not ( = ?auto_138279 ?auto_138282 ) ) ( not ( = ?auto_138280 ?auto_138281 ) ) ( not ( = ?auto_138280 ?auto_138282 ) ) ( not ( = ?auto_138281 ?auto_138282 ) ) ( ON ?auto_138282 ?auto_138283 ) ( not ( = ?auto_138275 ?auto_138283 ) ) ( not ( = ?auto_138276 ?auto_138283 ) ) ( not ( = ?auto_138277 ?auto_138283 ) ) ( not ( = ?auto_138278 ?auto_138283 ) ) ( not ( = ?auto_138279 ?auto_138283 ) ) ( not ( = ?auto_138280 ?auto_138283 ) ) ( not ( = ?auto_138281 ?auto_138283 ) ) ( not ( = ?auto_138282 ?auto_138283 ) ) ( ON ?auto_138281 ?auto_138282 ) ( ON-TABLE ?auto_138283 ) ( ON ?auto_138280 ?auto_138281 ) ( CLEAR ?auto_138278 ) ( ON ?auto_138279 ?auto_138280 ) ( CLEAR ?auto_138279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138283 ?auto_138282 ?auto_138281 ?auto_138280 )
      ( MAKE-7PILE ?auto_138275 ?auto_138276 ?auto_138277 ?auto_138278 ?auto_138279 ?auto_138280 ?auto_138281 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138284 - BLOCK
      ?auto_138285 - BLOCK
      ?auto_138286 - BLOCK
      ?auto_138287 - BLOCK
      ?auto_138288 - BLOCK
      ?auto_138289 - BLOCK
      ?auto_138290 - BLOCK
    )
    :vars
    (
      ?auto_138291 - BLOCK
      ?auto_138292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138284 ) ( ON ?auto_138285 ?auto_138284 ) ( ON ?auto_138286 ?auto_138285 ) ( not ( = ?auto_138284 ?auto_138285 ) ) ( not ( = ?auto_138284 ?auto_138286 ) ) ( not ( = ?auto_138284 ?auto_138287 ) ) ( not ( = ?auto_138284 ?auto_138288 ) ) ( not ( = ?auto_138284 ?auto_138289 ) ) ( not ( = ?auto_138284 ?auto_138290 ) ) ( not ( = ?auto_138284 ?auto_138291 ) ) ( not ( = ?auto_138285 ?auto_138286 ) ) ( not ( = ?auto_138285 ?auto_138287 ) ) ( not ( = ?auto_138285 ?auto_138288 ) ) ( not ( = ?auto_138285 ?auto_138289 ) ) ( not ( = ?auto_138285 ?auto_138290 ) ) ( not ( = ?auto_138285 ?auto_138291 ) ) ( not ( = ?auto_138286 ?auto_138287 ) ) ( not ( = ?auto_138286 ?auto_138288 ) ) ( not ( = ?auto_138286 ?auto_138289 ) ) ( not ( = ?auto_138286 ?auto_138290 ) ) ( not ( = ?auto_138286 ?auto_138291 ) ) ( not ( = ?auto_138287 ?auto_138288 ) ) ( not ( = ?auto_138287 ?auto_138289 ) ) ( not ( = ?auto_138287 ?auto_138290 ) ) ( not ( = ?auto_138287 ?auto_138291 ) ) ( not ( = ?auto_138288 ?auto_138289 ) ) ( not ( = ?auto_138288 ?auto_138290 ) ) ( not ( = ?auto_138288 ?auto_138291 ) ) ( not ( = ?auto_138289 ?auto_138290 ) ) ( not ( = ?auto_138289 ?auto_138291 ) ) ( not ( = ?auto_138290 ?auto_138291 ) ) ( ON ?auto_138291 ?auto_138292 ) ( not ( = ?auto_138284 ?auto_138292 ) ) ( not ( = ?auto_138285 ?auto_138292 ) ) ( not ( = ?auto_138286 ?auto_138292 ) ) ( not ( = ?auto_138287 ?auto_138292 ) ) ( not ( = ?auto_138288 ?auto_138292 ) ) ( not ( = ?auto_138289 ?auto_138292 ) ) ( not ( = ?auto_138290 ?auto_138292 ) ) ( not ( = ?auto_138291 ?auto_138292 ) ) ( ON ?auto_138290 ?auto_138291 ) ( ON-TABLE ?auto_138292 ) ( ON ?auto_138289 ?auto_138290 ) ( ON ?auto_138288 ?auto_138289 ) ( CLEAR ?auto_138288 ) ( HOLDING ?auto_138287 ) ( CLEAR ?auto_138286 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138284 ?auto_138285 ?auto_138286 ?auto_138287 )
      ( MAKE-7PILE ?auto_138284 ?auto_138285 ?auto_138286 ?auto_138287 ?auto_138288 ?auto_138289 ?auto_138290 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138293 - BLOCK
      ?auto_138294 - BLOCK
      ?auto_138295 - BLOCK
      ?auto_138296 - BLOCK
      ?auto_138297 - BLOCK
      ?auto_138298 - BLOCK
      ?auto_138299 - BLOCK
    )
    :vars
    (
      ?auto_138300 - BLOCK
      ?auto_138301 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138293 ) ( ON ?auto_138294 ?auto_138293 ) ( ON ?auto_138295 ?auto_138294 ) ( not ( = ?auto_138293 ?auto_138294 ) ) ( not ( = ?auto_138293 ?auto_138295 ) ) ( not ( = ?auto_138293 ?auto_138296 ) ) ( not ( = ?auto_138293 ?auto_138297 ) ) ( not ( = ?auto_138293 ?auto_138298 ) ) ( not ( = ?auto_138293 ?auto_138299 ) ) ( not ( = ?auto_138293 ?auto_138300 ) ) ( not ( = ?auto_138294 ?auto_138295 ) ) ( not ( = ?auto_138294 ?auto_138296 ) ) ( not ( = ?auto_138294 ?auto_138297 ) ) ( not ( = ?auto_138294 ?auto_138298 ) ) ( not ( = ?auto_138294 ?auto_138299 ) ) ( not ( = ?auto_138294 ?auto_138300 ) ) ( not ( = ?auto_138295 ?auto_138296 ) ) ( not ( = ?auto_138295 ?auto_138297 ) ) ( not ( = ?auto_138295 ?auto_138298 ) ) ( not ( = ?auto_138295 ?auto_138299 ) ) ( not ( = ?auto_138295 ?auto_138300 ) ) ( not ( = ?auto_138296 ?auto_138297 ) ) ( not ( = ?auto_138296 ?auto_138298 ) ) ( not ( = ?auto_138296 ?auto_138299 ) ) ( not ( = ?auto_138296 ?auto_138300 ) ) ( not ( = ?auto_138297 ?auto_138298 ) ) ( not ( = ?auto_138297 ?auto_138299 ) ) ( not ( = ?auto_138297 ?auto_138300 ) ) ( not ( = ?auto_138298 ?auto_138299 ) ) ( not ( = ?auto_138298 ?auto_138300 ) ) ( not ( = ?auto_138299 ?auto_138300 ) ) ( ON ?auto_138300 ?auto_138301 ) ( not ( = ?auto_138293 ?auto_138301 ) ) ( not ( = ?auto_138294 ?auto_138301 ) ) ( not ( = ?auto_138295 ?auto_138301 ) ) ( not ( = ?auto_138296 ?auto_138301 ) ) ( not ( = ?auto_138297 ?auto_138301 ) ) ( not ( = ?auto_138298 ?auto_138301 ) ) ( not ( = ?auto_138299 ?auto_138301 ) ) ( not ( = ?auto_138300 ?auto_138301 ) ) ( ON ?auto_138299 ?auto_138300 ) ( ON-TABLE ?auto_138301 ) ( ON ?auto_138298 ?auto_138299 ) ( ON ?auto_138297 ?auto_138298 ) ( CLEAR ?auto_138295 ) ( ON ?auto_138296 ?auto_138297 ) ( CLEAR ?auto_138296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138301 ?auto_138300 ?auto_138299 ?auto_138298 ?auto_138297 )
      ( MAKE-7PILE ?auto_138293 ?auto_138294 ?auto_138295 ?auto_138296 ?auto_138297 ?auto_138298 ?auto_138299 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138302 - BLOCK
      ?auto_138303 - BLOCK
      ?auto_138304 - BLOCK
      ?auto_138305 - BLOCK
      ?auto_138306 - BLOCK
      ?auto_138307 - BLOCK
      ?auto_138308 - BLOCK
    )
    :vars
    (
      ?auto_138309 - BLOCK
      ?auto_138310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138302 ) ( ON ?auto_138303 ?auto_138302 ) ( not ( = ?auto_138302 ?auto_138303 ) ) ( not ( = ?auto_138302 ?auto_138304 ) ) ( not ( = ?auto_138302 ?auto_138305 ) ) ( not ( = ?auto_138302 ?auto_138306 ) ) ( not ( = ?auto_138302 ?auto_138307 ) ) ( not ( = ?auto_138302 ?auto_138308 ) ) ( not ( = ?auto_138302 ?auto_138309 ) ) ( not ( = ?auto_138303 ?auto_138304 ) ) ( not ( = ?auto_138303 ?auto_138305 ) ) ( not ( = ?auto_138303 ?auto_138306 ) ) ( not ( = ?auto_138303 ?auto_138307 ) ) ( not ( = ?auto_138303 ?auto_138308 ) ) ( not ( = ?auto_138303 ?auto_138309 ) ) ( not ( = ?auto_138304 ?auto_138305 ) ) ( not ( = ?auto_138304 ?auto_138306 ) ) ( not ( = ?auto_138304 ?auto_138307 ) ) ( not ( = ?auto_138304 ?auto_138308 ) ) ( not ( = ?auto_138304 ?auto_138309 ) ) ( not ( = ?auto_138305 ?auto_138306 ) ) ( not ( = ?auto_138305 ?auto_138307 ) ) ( not ( = ?auto_138305 ?auto_138308 ) ) ( not ( = ?auto_138305 ?auto_138309 ) ) ( not ( = ?auto_138306 ?auto_138307 ) ) ( not ( = ?auto_138306 ?auto_138308 ) ) ( not ( = ?auto_138306 ?auto_138309 ) ) ( not ( = ?auto_138307 ?auto_138308 ) ) ( not ( = ?auto_138307 ?auto_138309 ) ) ( not ( = ?auto_138308 ?auto_138309 ) ) ( ON ?auto_138309 ?auto_138310 ) ( not ( = ?auto_138302 ?auto_138310 ) ) ( not ( = ?auto_138303 ?auto_138310 ) ) ( not ( = ?auto_138304 ?auto_138310 ) ) ( not ( = ?auto_138305 ?auto_138310 ) ) ( not ( = ?auto_138306 ?auto_138310 ) ) ( not ( = ?auto_138307 ?auto_138310 ) ) ( not ( = ?auto_138308 ?auto_138310 ) ) ( not ( = ?auto_138309 ?auto_138310 ) ) ( ON ?auto_138308 ?auto_138309 ) ( ON-TABLE ?auto_138310 ) ( ON ?auto_138307 ?auto_138308 ) ( ON ?auto_138306 ?auto_138307 ) ( ON ?auto_138305 ?auto_138306 ) ( CLEAR ?auto_138305 ) ( HOLDING ?auto_138304 ) ( CLEAR ?auto_138303 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138302 ?auto_138303 ?auto_138304 )
      ( MAKE-7PILE ?auto_138302 ?auto_138303 ?auto_138304 ?auto_138305 ?auto_138306 ?auto_138307 ?auto_138308 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138311 - BLOCK
      ?auto_138312 - BLOCK
      ?auto_138313 - BLOCK
      ?auto_138314 - BLOCK
      ?auto_138315 - BLOCK
      ?auto_138316 - BLOCK
      ?auto_138317 - BLOCK
    )
    :vars
    (
      ?auto_138318 - BLOCK
      ?auto_138319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138311 ) ( ON ?auto_138312 ?auto_138311 ) ( not ( = ?auto_138311 ?auto_138312 ) ) ( not ( = ?auto_138311 ?auto_138313 ) ) ( not ( = ?auto_138311 ?auto_138314 ) ) ( not ( = ?auto_138311 ?auto_138315 ) ) ( not ( = ?auto_138311 ?auto_138316 ) ) ( not ( = ?auto_138311 ?auto_138317 ) ) ( not ( = ?auto_138311 ?auto_138318 ) ) ( not ( = ?auto_138312 ?auto_138313 ) ) ( not ( = ?auto_138312 ?auto_138314 ) ) ( not ( = ?auto_138312 ?auto_138315 ) ) ( not ( = ?auto_138312 ?auto_138316 ) ) ( not ( = ?auto_138312 ?auto_138317 ) ) ( not ( = ?auto_138312 ?auto_138318 ) ) ( not ( = ?auto_138313 ?auto_138314 ) ) ( not ( = ?auto_138313 ?auto_138315 ) ) ( not ( = ?auto_138313 ?auto_138316 ) ) ( not ( = ?auto_138313 ?auto_138317 ) ) ( not ( = ?auto_138313 ?auto_138318 ) ) ( not ( = ?auto_138314 ?auto_138315 ) ) ( not ( = ?auto_138314 ?auto_138316 ) ) ( not ( = ?auto_138314 ?auto_138317 ) ) ( not ( = ?auto_138314 ?auto_138318 ) ) ( not ( = ?auto_138315 ?auto_138316 ) ) ( not ( = ?auto_138315 ?auto_138317 ) ) ( not ( = ?auto_138315 ?auto_138318 ) ) ( not ( = ?auto_138316 ?auto_138317 ) ) ( not ( = ?auto_138316 ?auto_138318 ) ) ( not ( = ?auto_138317 ?auto_138318 ) ) ( ON ?auto_138318 ?auto_138319 ) ( not ( = ?auto_138311 ?auto_138319 ) ) ( not ( = ?auto_138312 ?auto_138319 ) ) ( not ( = ?auto_138313 ?auto_138319 ) ) ( not ( = ?auto_138314 ?auto_138319 ) ) ( not ( = ?auto_138315 ?auto_138319 ) ) ( not ( = ?auto_138316 ?auto_138319 ) ) ( not ( = ?auto_138317 ?auto_138319 ) ) ( not ( = ?auto_138318 ?auto_138319 ) ) ( ON ?auto_138317 ?auto_138318 ) ( ON-TABLE ?auto_138319 ) ( ON ?auto_138316 ?auto_138317 ) ( ON ?auto_138315 ?auto_138316 ) ( ON ?auto_138314 ?auto_138315 ) ( CLEAR ?auto_138312 ) ( ON ?auto_138313 ?auto_138314 ) ( CLEAR ?auto_138313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138319 ?auto_138318 ?auto_138317 ?auto_138316 ?auto_138315 ?auto_138314 )
      ( MAKE-7PILE ?auto_138311 ?auto_138312 ?auto_138313 ?auto_138314 ?auto_138315 ?auto_138316 ?auto_138317 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138320 - BLOCK
      ?auto_138321 - BLOCK
      ?auto_138322 - BLOCK
      ?auto_138323 - BLOCK
      ?auto_138324 - BLOCK
      ?auto_138325 - BLOCK
      ?auto_138326 - BLOCK
    )
    :vars
    (
      ?auto_138328 - BLOCK
      ?auto_138327 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138320 ) ( not ( = ?auto_138320 ?auto_138321 ) ) ( not ( = ?auto_138320 ?auto_138322 ) ) ( not ( = ?auto_138320 ?auto_138323 ) ) ( not ( = ?auto_138320 ?auto_138324 ) ) ( not ( = ?auto_138320 ?auto_138325 ) ) ( not ( = ?auto_138320 ?auto_138326 ) ) ( not ( = ?auto_138320 ?auto_138328 ) ) ( not ( = ?auto_138321 ?auto_138322 ) ) ( not ( = ?auto_138321 ?auto_138323 ) ) ( not ( = ?auto_138321 ?auto_138324 ) ) ( not ( = ?auto_138321 ?auto_138325 ) ) ( not ( = ?auto_138321 ?auto_138326 ) ) ( not ( = ?auto_138321 ?auto_138328 ) ) ( not ( = ?auto_138322 ?auto_138323 ) ) ( not ( = ?auto_138322 ?auto_138324 ) ) ( not ( = ?auto_138322 ?auto_138325 ) ) ( not ( = ?auto_138322 ?auto_138326 ) ) ( not ( = ?auto_138322 ?auto_138328 ) ) ( not ( = ?auto_138323 ?auto_138324 ) ) ( not ( = ?auto_138323 ?auto_138325 ) ) ( not ( = ?auto_138323 ?auto_138326 ) ) ( not ( = ?auto_138323 ?auto_138328 ) ) ( not ( = ?auto_138324 ?auto_138325 ) ) ( not ( = ?auto_138324 ?auto_138326 ) ) ( not ( = ?auto_138324 ?auto_138328 ) ) ( not ( = ?auto_138325 ?auto_138326 ) ) ( not ( = ?auto_138325 ?auto_138328 ) ) ( not ( = ?auto_138326 ?auto_138328 ) ) ( ON ?auto_138328 ?auto_138327 ) ( not ( = ?auto_138320 ?auto_138327 ) ) ( not ( = ?auto_138321 ?auto_138327 ) ) ( not ( = ?auto_138322 ?auto_138327 ) ) ( not ( = ?auto_138323 ?auto_138327 ) ) ( not ( = ?auto_138324 ?auto_138327 ) ) ( not ( = ?auto_138325 ?auto_138327 ) ) ( not ( = ?auto_138326 ?auto_138327 ) ) ( not ( = ?auto_138328 ?auto_138327 ) ) ( ON ?auto_138326 ?auto_138328 ) ( ON-TABLE ?auto_138327 ) ( ON ?auto_138325 ?auto_138326 ) ( ON ?auto_138324 ?auto_138325 ) ( ON ?auto_138323 ?auto_138324 ) ( ON ?auto_138322 ?auto_138323 ) ( CLEAR ?auto_138322 ) ( HOLDING ?auto_138321 ) ( CLEAR ?auto_138320 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138320 ?auto_138321 )
      ( MAKE-7PILE ?auto_138320 ?auto_138321 ?auto_138322 ?auto_138323 ?auto_138324 ?auto_138325 ?auto_138326 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138329 - BLOCK
      ?auto_138330 - BLOCK
      ?auto_138331 - BLOCK
      ?auto_138332 - BLOCK
      ?auto_138333 - BLOCK
      ?auto_138334 - BLOCK
      ?auto_138335 - BLOCK
    )
    :vars
    (
      ?auto_138337 - BLOCK
      ?auto_138336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138329 ) ( not ( = ?auto_138329 ?auto_138330 ) ) ( not ( = ?auto_138329 ?auto_138331 ) ) ( not ( = ?auto_138329 ?auto_138332 ) ) ( not ( = ?auto_138329 ?auto_138333 ) ) ( not ( = ?auto_138329 ?auto_138334 ) ) ( not ( = ?auto_138329 ?auto_138335 ) ) ( not ( = ?auto_138329 ?auto_138337 ) ) ( not ( = ?auto_138330 ?auto_138331 ) ) ( not ( = ?auto_138330 ?auto_138332 ) ) ( not ( = ?auto_138330 ?auto_138333 ) ) ( not ( = ?auto_138330 ?auto_138334 ) ) ( not ( = ?auto_138330 ?auto_138335 ) ) ( not ( = ?auto_138330 ?auto_138337 ) ) ( not ( = ?auto_138331 ?auto_138332 ) ) ( not ( = ?auto_138331 ?auto_138333 ) ) ( not ( = ?auto_138331 ?auto_138334 ) ) ( not ( = ?auto_138331 ?auto_138335 ) ) ( not ( = ?auto_138331 ?auto_138337 ) ) ( not ( = ?auto_138332 ?auto_138333 ) ) ( not ( = ?auto_138332 ?auto_138334 ) ) ( not ( = ?auto_138332 ?auto_138335 ) ) ( not ( = ?auto_138332 ?auto_138337 ) ) ( not ( = ?auto_138333 ?auto_138334 ) ) ( not ( = ?auto_138333 ?auto_138335 ) ) ( not ( = ?auto_138333 ?auto_138337 ) ) ( not ( = ?auto_138334 ?auto_138335 ) ) ( not ( = ?auto_138334 ?auto_138337 ) ) ( not ( = ?auto_138335 ?auto_138337 ) ) ( ON ?auto_138337 ?auto_138336 ) ( not ( = ?auto_138329 ?auto_138336 ) ) ( not ( = ?auto_138330 ?auto_138336 ) ) ( not ( = ?auto_138331 ?auto_138336 ) ) ( not ( = ?auto_138332 ?auto_138336 ) ) ( not ( = ?auto_138333 ?auto_138336 ) ) ( not ( = ?auto_138334 ?auto_138336 ) ) ( not ( = ?auto_138335 ?auto_138336 ) ) ( not ( = ?auto_138337 ?auto_138336 ) ) ( ON ?auto_138335 ?auto_138337 ) ( ON-TABLE ?auto_138336 ) ( ON ?auto_138334 ?auto_138335 ) ( ON ?auto_138333 ?auto_138334 ) ( ON ?auto_138332 ?auto_138333 ) ( ON ?auto_138331 ?auto_138332 ) ( CLEAR ?auto_138329 ) ( ON ?auto_138330 ?auto_138331 ) ( CLEAR ?auto_138330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138336 ?auto_138337 ?auto_138335 ?auto_138334 ?auto_138333 ?auto_138332 ?auto_138331 )
      ( MAKE-7PILE ?auto_138329 ?auto_138330 ?auto_138331 ?auto_138332 ?auto_138333 ?auto_138334 ?auto_138335 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138338 - BLOCK
      ?auto_138339 - BLOCK
      ?auto_138340 - BLOCK
      ?auto_138341 - BLOCK
      ?auto_138342 - BLOCK
      ?auto_138343 - BLOCK
      ?auto_138344 - BLOCK
    )
    :vars
    (
      ?auto_138345 - BLOCK
      ?auto_138346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138338 ?auto_138339 ) ) ( not ( = ?auto_138338 ?auto_138340 ) ) ( not ( = ?auto_138338 ?auto_138341 ) ) ( not ( = ?auto_138338 ?auto_138342 ) ) ( not ( = ?auto_138338 ?auto_138343 ) ) ( not ( = ?auto_138338 ?auto_138344 ) ) ( not ( = ?auto_138338 ?auto_138345 ) ) ( not ( = ?auto_138339 ?auto_138340 ) ) ( not ( = ?auto_138339 ?auto_138341 ) ) ( not ( = ?auto_138339 ?auto_138342 ) ) ( not ( = ?auto_138339 ?auto_138343 ) ) ( not ( = ?auto_138339 ?auto_138344 ) ) ( not ( = ?auto_138339 ?auto_138345 ) ) ( not ( = ?auto_138340 ?auto_138341 ) ) ( not ( = ?auto_138340 ?auto_138342 ) ) ( not ( = ?auto_138340 ?auto_138343 ) ) ( not ( = ?auto_138340 ?auto_138344 ) ) ( not ( = ?auto_138340 ?auto_138345 ) ) ( not ( = ?auto_138341 ?auto_138342 ) ) ( not ( = ?auto_138341 ?auto_138343 ) ) ( not ( = ?auto_138341 ?auto_138344 ) ) ( not ( = ?auto_138341 ?auto_138345 ) ) ( not ( = ?auto_138342 ?auto_138343 ) ) ( not ( = ?auto_138342 ?auto_138344 ) ) ( not ( = ?auto_138342 ?auto_138345 ) ) ( not ( = ?auto_138343 ?auto_138344 ) ) ( not ( = ?auto_138343 ?auto_138345 ) ) ( not ( = ?auto_138344 ?auto_138345 ) ) ( ON ?auto_138345 ?auto_138346 ) ( not ( = ?auto_138338 ?auto_138346 ) ) ( not ( = ?auto_138339 ?auto_138346 ) ) ( not ( = ?auto_138340 ?auto_138346 ) ) ( not ( = ?auto_138341 ?auto_138346 ) ) ( not ( = ?auto_138342 ?auto_138346 ) ) ( not ( = ?auto_138343 ?auto_138346 ) ) ( not ( = ?auto_138344 ?auto_138346 ) ) ( not ( = ?auto_138345 ?auto_138346 ) ) ( ON ?auto_138344 ?auto_138345 ) ( ON-TABLE ?auto_138346 ) ( ON ?auto_138343 ?auto_138344 ) ( ON ?auto_138342 ?auto_138343 ) ( ON ?auto_138341 ?auto_138342 ) ( ON ?auto_138340 ?auto_138341 ) ( ON ?auto_138339 ?auto_138340 ) ( CLEAR ?auto_138339 ) ( HOLDING ?auto_138338 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138338 )
      ( MAKE-7PILE ?auto_138338 ?auto_138339 ?auto_138340 ?auto_138341 ?auto_138342 ?auto_138343 ?auto_138344 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_138347 - BLOCK
      ?auto_138348 - BLOCK
      ?auto_138349 - BLOCK
      ?auto_138350 - BLOCK
      ?auto_138351 - BLOCK
      ?auto_138352 - BLOCK
      ?auto_138353 - BLOCK
    )
    :vars
    (
      ?auto_138355 - BLOCK
      ?auto_138354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138347 ?auto_138348 ) ) ( not ( = ?auto_138347 ?auto_138349 ) ) ( not ( = ?auto_138347 ?auto_138350 ) ) ( not ( = ?auto_138347 ?auto_138351 ) ) ( not ( = ?auto_138347 ?auto_138352 ) ) ( not ( = ?auto_138347 ?auto_138353 ) ) ( not ( = ?auto_138347 ?auto_138355 ) ) ( not ( = ?auto_138348 ?auto_138349 ) ) ( not ( = ?auto_138348 ?auto_138350 ) ) ( not ( = ?auto_138348 ?auto_138351 ) ) ( not ( = ?auto_138348 ?auto_138352 ) ) ( not ( = ?auto_138348 ?auto_138353 ) ) ( not ( = ?auto_138348 ?auto_138355 ) ) ( not ( = ?auto_138349 ?auto_138350 ) ) ( not ( = ?auto_138349 ?auto_138351 ) ) ( not ( = ?auto_138349 ?auto_138352 ) ) ( not ( = ?auto_138349 ?auto_138353 ) ) ( not ( = ?auto_138349 ?auto_138355 ) ) ( not ( = ?auto_138350 ?auto_138351 ) ) ( not ( = ?auto_138350 ?auto_138352 ) ) ( not ( = ?auto_138350 ?auto_138353 ) ) ( not ( = ?auto_138350 ?auto_138355 ) ) ( not ( = ?auto_138351 ?auto_138352 ) ) ( not ( = ?auto_138351 ?auto_138353 ) ) ( not ( = ?auto_138351 ?auto_138355 ) ) ( not ( = ?auto_138352 ?auto_138353 ) ) ( not ( = ?auto_138352 ?auto_138355 ) ) ( not ( = ?auto_138353 ?auto_138355 ) ) ( ON ?auto_138355 ?auto_138354 ) ( not ( = ?auto_138347 ?auto_138354 ) ) ( not ( = ?auto_138348 ?auto_138354 ) ) ( not ( = ?auto_138349 ?auto_138354 ) ) ( not ( = ?auto_138350 ?auto_138354 ) ) ( not ( = ?auto_138351 ?auto_138354 ) ) ( not ( = ?auto_138352 ?auto_138354 ) ) ( not ( = ?auto_138353 ?auto_138354 ) ) ( not ( = ?auto_138355 ?auto_138354 ) ) ( ON ?auto_138353 ?auto_138355 ) ( ON-TABLE ?auto_138354 ) ( ON ?auto_138352 ?auto_138353 ) ( ON ?auto_138351 ?auto_138352 ) ( ON ?auto_138350 ?auto_138351 ) ( ON ?auto_138349 ?auto_138350 ) ( ON ?auto_138348 ?auto_138349 ) ( ON ?auto_138347 ?auto_138348 ) ( CLEAR ?auto_138347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138354 ?auto_138355 ?auto_138353 ?auto_138352 ?auto_138351 ?auto_138350 ?auto_138349 ?auto_138348 )
      ( MAKE-7PILE ?auto_138347 ?auto_138348 ?auto_138349 ?auto_138350 ?auto_138351 ?auto_138352 ?auto_138353 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138357 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_138357 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_138357 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138358 - BLOCK
    )
    :vars
    (
      ?auto_138359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138358 ?auto_138359 ) ( CLEAR ?auto_138358 ) ( HAND-EMPTY ) ( not ( = ?auto_138358 ?auto_138359 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138358 ?auto_138359 )
      ( MAKE-1PILE ?auto_138358 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138360 - BLOCK
    )
    :vars
    (
      ?auto_138361 - BLOCK
      ?auto_138365 - BLOCK
      ?auto_138367 - BLOCK
      ?auto_138364 - BLOCK
      ?auto_138366 - BLOCK
      ?auto_138363 - BLOCK
      ?auto_138362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138360 ?auto_138361 ) ) ( HOLDING ?auto_138360 ) ( CLEAR ?auto_138361 ) ( ON-TABLE ?auto_138365 ) ( ON ?auto_138367 ?auto_138365 ) ( ON ?auto_138364 ?auto_138367 ) ( ON ?auto_138366 ?auto_138364 ) ( ON ?auto_138363 ?auto_138366 ) ( ON ?auto_138362 ?auto_138363 ) ( ON ?auto_138361 ?auto_138362 ) ( not ( = ?auto_138365 ?auto_138367 ) ) ( not ( = ?auto_138365 ?auto_138364 ) ) ( not ( = ?auto_138365 ?auto_138366 ) ) ( not ( = ?auto_138365 ?auto_138363 ) ) ( not ( = ?auto_138365 ?auto_138362 ) ) ( not ( = ?auto_138365 ?auto_138361 ) ) ( not ( = ?auto_138365 ?auto_138360 ) ) ( not ( = ?auto_138367 ?auto_138364 ) ) ( not ( = ?auto_138367 ?auto_138366 ) ) ( not ( = ?auto_138367 ?auto_138363 ) ) ( not ( = ?auto_138367 ?auto_138362 ) ) ( not ( = ?auto_138367 ?auto_138361 ) ) ( not ( = ?auto_138367 ?auto_138360 ) ) ( not ( = ?auto_138364 ?auto_138366 ) ) ( not ( = ?auto_138364 ?auto_138363 ) ) ( not ( = ?auto_138364 ?auto_138362 ) ) ( not ( = ?auto_138364 ?auto_138361 ) ) ( not ( = ?auto_138364 ?auto_138360 ) ) ( not ( = ?auto_138366 ?auto_138363 ) ) ( not ( = ?auto_138366 ?auto_138362 ) ) ( not ( = ?auto_138366 ?auto_138361 ) ) ( not ( = ?auto_138366 ?auto_138360 ) ) ( not ( = ?auto_138363 ?auto_138362 ) ) ( not ( = ?auto_138363 ?auto_138361 ) ) ( not ( = ?auto_138363 ?auto_138360 ) ) ( not ( = ?auto_138362 ?auto_138361 ) ) ( not ( = ?auto_138362 ?auto_138360 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138365 ?auto_138367 ?auto_138364 ?auto_138366 ?auto_138363 ?auto_138362 ?auto_138361 ?auto_138360 )
      ( MAKE-1PILE ?auto_138360 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138368 - BLOCK
    )
    :vars
    (
      ?auto_138371 - BLOCK
      ?auto_138369 - BLOCK
      ?auto_138373 - BLOCK
      ?auto_138374 - BLOCK
      ?auto_138372 - BLOCK
      ?auto_138370 - BLOCK
      ?auto_138375 - BLOCK
      ?auto_138376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138368 ?auto_138371 ) ) ( CLEAR ?auto_138371 ) ( ON-TABLE ?auto_138369 ) ( ON ?auto_138373 ?auto_138369 ) ( ON ?auto_138374 ?auto_138373 ) ( ON ?auto_138372 ?auto_138374 ) ( ON ?auto_138370 ?auto_138372 ) ( ON ?auto_138375 ?auto_138370 ) ( ON ?auto_138371 ?auto_138375 ) ( not ( = ?auto_138369 ?auto_138373 ) ) ( not ( = ?auto_138369 ?auto_138374 ) ) ( not ( = ?auto_138369 ?auto_138372 ) ) ( not ( = ?auto_138369 ?auto_138370 ) ) ( not ( = ?auto_138369 ?auto_138375 ) ) ( not ( = ?auto_138369 ?auto_138371 ) ) ( not ( = ?auto_138369 ?auto_138368 ) ) ( not ( = ?auto_138373 ?auto_138374 ) ) ( not ( = ?auto_138373 ?auto_138372 ) ) ( not ( = ?auto_138373 ?auto_138370 ) ) ( not ( = ?auto_138373 ?auto_138375 ) ) ( not ( = ?auto_138373 ?auto_138371 ) ) ( not ( = ?auto_138373 ?auto_138368 ) ) ( not ( = ?auto_138374 ?auto_138372 ) ) ( not ( = ?auto_138374 ?auto_138370 ) ) ( not ( = ?auto_138374 ?auto_138375 ) ) ( not ( = ?auto_138374 ?auto_138371 ) ) ( not ( = ?auto_138374 ?auto_138368 ) ) ( not ( = ?auto_138372 ?auto_138370 ) ) ( not ( = ?auto_138372 ?auto_138375 ) ) ( not ( = ?auto_138372 ?auto_138371 ) ) ( not ( = ?auto_138372 ?auto_138368 ) ) ( not ( = ?auto_138370 ?auto_138375 ) ) ( not ( = ?auto_138370 ?auto_138371 ) ) ( not ( = ?auto_138370 ?auto_138368 ) ) ( not ( = ?auto_138375 ?auto_138371 ) ) ( not ( = ?auto_138375 ?auto_138368 ) ) ( ON ?auto_138368 ?auto_138376 ) ( CLEAR ?auto_138368 ) ( HAND-EMPTY ) ( not ( = ?auto_138368 ?auto_138376 ) ) ( not ( = ?auto_138371 ?auto_138376 ) ) ( not ( = ?auto_138369 ?auto_138376 ) ) ( not ( = ?auto_138373 ?auto_138376 ) ) ( not ( = ?auto_138374 ?auto_138376 ) ) ( not ( = ?auto_138372 ?auto_138376 ) ) ( not ( = ?auto_138370 ?auto_138376 ) ) ( not ( = ?auto_138375 ?auto_138376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138368 ?auto_138376 )
      ( MAKE-1PILE ?auto_138368 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138377 - BLOCK
    )
    :vars
    (
      ?auto_138380 - BLOCK
      ?auto_138381 - BLOCK
      ?auto_138384 - BLOCK
      ?auto_138385 - BLOCK
      ?auto_138382 - BLOCK
      ?auto_138378 - BLOCK
      ?auto_138379 - BLOCK
      ?auto_138383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138377 ?auto_138380 ) ) ( ON-TABLE ?auto_138381 ) ( ON ?auto_138384 ?auto_138381 ) ( ON ?auto_138385 ?auto_138384 ) ( ON ?auto_138382 ?auto_138385 ) ( ON ?auto_138378 ?auto_138382 ) ( ON ?auto_138379 ?auto_138378 ) ( not ( = ?auto_138381 ?auto_138384 ) ) ( not ( = ?auto_138381 ?auto_138385 ) ) ( not ( = ?auto_138381 ?auto_138382 ) ) ( not ( = ?auto_138381 ?auto_138378 ) ) ( not ( = ?auto_138381 ?auto_138379 ) ) ( not ( = ?auto_138381 ?auto_138380 ) ) ( not ( = ?auto_138381 ?auto_138377 ) ) ( not ( = ?auto_138384 ?auto_138385 ) ) ( not ( = ?auto_138384 ?auto_138382 ) ) ( not ( = ?auto_138384 ?auto_138378 ) ) ( not ( = ?auto_138384 ?auto_138379 ) ) ( not ( = ?auto_138384 ?auto_138380 ) ) ( not ( = ?auto_138384 ?auto_138377 ) ) ( not ( = ?auto_138385 ?auto_138382 ) ) ( not ( = ?auto_138385 ?auto_138378 ) ) ( not ( = ?auto_138385 ?auto_138379 ) ) ( not ( = ?auto_138385 ?auto_138380 ) ) ( not ( = ?auto_138385 ?auto_138377 ) ) ( not ( = ?auto_138382 ?auto_138378 ) ) ( not ( = ?auto_138382 ?auto_138379 ) ) ( not ( = ?auto_138382 ?auto_138380 ) ) ( not ( = ?auto_138382 ?auto_138377 ) ) ( not ( = ?auto_138378 ?auto_138379 ) ) ( not ( = ?auto_138378 ?auto_138380 ) ) ( not ( = ?auto_138378 ?auto_138377 ) ) ( not ( = ?auto_138379 ?auto_138380 ) ) ( not ( = ?auto_138379 ?auto_138377 ) ) ( ON ?auto_138377 ?auto_138383 ) ( CLEAR ?auto_138377 ) ( not ( = ?auto_138377 ?auto_138383 ) ) ( not ( = ?auto_138380 ?auto_138383 ) ) ( not ( = ?auto_138381 ?auto_138383 ) ) ( not ( = ?auto_138384 ?auto_138383 ) ) ( not ( = ?auto_138385 ?auto_138383 ) ) ( not ( = ?auto_138382 ?auto_138383 ) ) ( not ( = ?auto_138378 ?auto_138383 ) ) ( not ( = ?auto_138379 ?auto_138383 ) ) ( HOLDING ?auto_138380 ) ( CLEAR ?auto_138379 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138381 ?auto_138384 ?auto_138385 ?auto_138382 ?auto_138378 ?auto_138379 ?auto_138380 )
      ( MAKE-1PILE ?auto_138377 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138386 - BLOCK
    )
    :vars
    (
      ?auto_138390 - BLOCK
      ?auto_138392 - BLOCK
      ?auto_138388 - BLOCK
      ?auto_138387 - BLOCK
      ?auto_138394 - BLOCK
      ?auto_138391 - BLOCK
      ?auto_138393 - BLOCK
      ?auto_138389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138386 ?auto_138390 ) ) ( ON-TABLE ?auto_138392 ) ( ON ?auto_138388 ?auto_138392 ) ( ON ?auto_138387 ?auto_138388 ) ( ON ?auto_138394 ?auto_138387 ) ( ON ?auto_138391 ?auto_138394 ) ( ON ?auto_138393 ?auto_138391 ) ( not ( = ?auto_138392 ?auto_138388 ) ) ( not ( = ?auto_138392 ?auto_138387 ) ) ( not ( = ?auto_138392 ?auto_138394 ) ) ( not ( = ?auto_138392 ?auto_138391 ) ) ( not ( = ?auto_138392 ?auto_138393 ) ) ( not ( = ?auto_138392 ?auto_138390 ) ) ( not ( = ?auto_138392 ?auto_138386 ) ) ( not ( = ?auto_138388 ?auto_138387 ) ) ( not ( = ?auto_138388 ?auto_138394 ) ) ( not ( = ?auto_138388 ?auto_138391 ) ) ( not ( = ?auto_138388 ?auto_138393 ) ) ( not ( = ?auto_138388 ?auto_138390 ) ) ( not ( = ?auto_138388 ?auto_138386 ) ) ( not ( = ?auto_138387 ?auto_138394 ) ) ( not ( = ?auto_138387 ?auto_138391 ) ) ( not ( = ?auto_138387 ?auto_138393 ) ) ( not ( = ?auto_138387 ?auto_138390 ) ) ( not ( = ?auto_138387 ?auto_138386 ) ) ( not ( = ?auto_138394 ?auto_138391 ) ) ( not ( = ?auto_138394 ?auto_138393 ) ) ( not ( = ?auto_138394 ?auto_138390 ) ) ( not ( = ?auto_138394 ?auto_138386 ) ) ( not ( = ?auto_138391 ?auto_138393 ) ) ( not ( = ?auto_138391 ?auto_138390 ) ) ( not ( = ?auto_138391 ?auto_138386 ) ) ( not ( = ?auto_138393 ?auto_138390 ) ) ( not ( = ?auto_138393 ?auto_138386 ) ) ( ON ?auto_138386 ?auto_138389 ) ( not ( = ?auto_138386 ?auto_138389 ) ) ( not ( = ?auto_138390 ?auto_138389 ) ) ( not ( = ?auto_138392 ?auto_138389 ) ) ( not ( = ?auto_138388 ?auto_138389 ) ) ( not ( = ?auto_138387 ?auto_138389 ) ) ( not ( = ?auto_138394 ?auto_138389 ) ) ( not ( = ?auto_138391 ?auto_138389 ) ) ( not ( = ?auto_138393 ?auto_138389 ) ) ( CLEAR ?auto_138393 ) ( ON ?auto_138390 ?auto_138386 ) ( CLEAR ?auto_138390 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138389 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138389 ?auto_138386 )
      ( MAKE-1PILE ?auto_138386 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138395 - BLOCK
    )
    :vars
    (
      ?auto_138400 - BLOCK
      ?auto_138399 - BLOCK
      ?auto_138396 - BLOCK
      ?auto_138398 - BLOCK
      ?auto_138403 - BLOCK
      ?auto_138401 - BLOCK
      ?auto_138402 - BLOCK
      ?auto_138397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138395 ?auto_138400 ) ) ( ON-TABLE ?auto_138399 ) ( ON ?auto_138396 ?auto_138399 ) ( ON ?auto_138398 ?auto_138396 ) ( ON ?auto_138403 ?auto_138398 ) ( ON ?auto_138401 ?auto_138403 ) ( not ( = ?auto_138399 ?auto_138396 ) ) ( not ( = ?auto_138399 ?auto_138398 ) ) ( not ( = ?auto_138399 ?auto_138403 ) ) ( not ( = ?auto_138399 ?auto_138401 ) ) ( not ( = ?auto_138399 ?auto_138402 ) ) ( not ( = ?auto_138399 ?auto_138400 ) ) ( not ( = ?auto_138399 ?auto_138395 ) ) ( not ( = ?auto_138396 ?auto_138398 ) ) ( not ( = ?auto_138396 ?auto_138403 ) ) ( not ( = ?auto_138396 ?auto_138401 ) ) ( not ( = ?auto_138396 ?auto_138402 ) ) ( not ( = ?auto_138396 ?auto_138400 ) ) ( not ( = ?auto_138396 ?auto_138395 ) ) ( not ( = ?auto_138398 ?auto_138403 ) ) ( not ( = ?auto_138398 ?auto_138401 ) ) ( not ( = ?auto_138398 ?auto_138402 ) ) ( not ( = ?auto_138398 ?auto_138400 ) ) ( not ( = ?auto_138398 ?auto_138395 ) ) ( not ( = ?auto_138403 ?auto_138401 ) ) ( not ( = ?auto_138403 ?auto_138402 ) ) ( not ( = ?auto_138403 ?auto_138400 ) ) ( not ( = ?auto_138403 ?auto_138395 ) ) ( not ( = ?auto_138401 ?auto_138402 ) ) ( not ( = ?auto_138401 ?auto_138400 ) ) ( not ( = ?auto_138401 ?auto_138395 ) ) ( not ( = ?auto_138402 ?auto_138400 ) ) ( not ( = ?auto_138402 ?auto_138395 ) ) ( ON ?auto_138395 ?auto_138397 ) ( not ( = ?auto_138395 ?auto_138397 ) ) ( not ( = ?auto_138400 ?auto_138397 ) ) ( not ( = ?auto_138399 ?auto_138397 ) ) ( not ( = ?auto_138396 ?auto_138397 ) ) ( not ( = ?auto_138398 ?auto_138397 ) ) ( not ( = ?auto_138403 ?auto_138397 ) ) ( not ( = ?auto_138401 ?auto_138397 ) ) ( not ( = ?auto_138402 ?auto_138397 ) ) ( ON ?auto_138400 ?auto_138395 ) ( CLEAR ?auto_138400 ) ( ON-TABLE ?auto_138397 ) ( HOLDING ?auto_138402 ) ( CLEAR ?auto_138401 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138399 ?auto_138396 ?auto_138398 ?auto_138403 ?auto_138401 ?auto_138402 )
      ( MAKE-1PILE ?auto_138395 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138404 - BLOCK
    )
    :vars
    (
      ?auto_138412 - BLOCK
      ?auto_138405 - BLOCK
      ?auto_138409 - BLOCK
      ?auto_138410 - BLOCK
      ?auto_138411 - BLOCK
      ?auto_138407 - BLOCK
      ?auto_138408 - BLOCK
      ?auto_138406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138404 ?auto_138412 ) ) ( ON-TABLE ?auto_138405 ) ( ON ?auto_138409 ?auto_138405 ) ( ON ?auto_138410 ?auto_138409 ) ( ON ?auto_138411 ?auto_138410 ) ( ON ?auto_138407 ?auto_138411 ) ( not ( = ?auto_138405 ?auto_138409 ) ) ( not ( = ?auto_138405 ?auto_138410 ) ) ( not ( = ?auto_138405 ?auto_138411 ) ) ( not ( = ?auto_138405 ?auto_138407 ) ) ( not ( = ?auto_138405 ?auto_138408 ) ) ( not ( = ?auto_138405 ?auto_138412 ) ) ( not ( = ?auto_138405 ?auto_138404 ) ) ( not ( = ?auto_138409 ?auto_138410 ) ) ( not ( = ?auto_138409 ?auto_138411 ) ) ( not ( = ?auto_138409 ?auto_138407 ) ) ( not ( = ?auto_138409 ?auto_138408 ) ) ( not ( = ?auto_138409 ?auto_138412 ) ) ( not ( = ?auto_138409 ?auto_138404 ) ) ( not ( = ?auto_138410 ?auto_138411 ) ) ( not ( = ?auto_138410 ?auto_138407 ) ) ( not ( = ?auto_138410 ?auto_138408 ) ) ( not ( = ?auto_138410 ?auto_138412 ) ) ( not ( = ?auto_138410 ?auto_138404 ) ) ( not ( = ?auto_138411 ?auto_138407 ) ) ( not ( = ?auto_138411 ?auto_138408 ) ) ( not ( = ?auto_138411 ?auto_138412 ) ) ( not ( = ?auto_138411 ?auto_138404 ) ) ( not ( = ?auto_138407 ?auto_138408 ) ) ( not ( = ?auto_138407 ?auto_138412 ) ) ( not ( = ?auto_138407 ?auto_138404 ) ) ( not ( = ?auto_138408 ?auto_138412 ) ) ( not ( = ?auto_138408 ?auto_138404 ) ) ( ON ?auto_138404 ?auto_138406 ) ( not ( = ?auto_138404 ?auto_138406 ) ) ( not ( = ?auto_138412 ?auto_138406 ) ) ( not ( = ?auto_138405 ?auto_138406 ) ) ( not ( = ?auto_138409 ?auto_138406 ) ) ( not ( = ?auto_138410 ?auto_138406 ) ) ( not ( = ?auto_138411 ?auto_138406 ) ) ( not ( = ?auto_138407 ?auto_138406 ) ) ( not ( = ?auto_138408 ?auto_138406 ) ) ( ON ?auto_138412 ?auto_138404 ) ( ON-TABLE ?auto_138406 ) ( CLEAR ?auto_138407 ) ( ON ?auto_138408 ?auto_138412 ) ( CLEAR ?auto_138408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138406 ?auto_138404 ?auto_138412 )
      ( MAKE-1PILE ?auto_138404 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138413 - BLOCK
    )
    :vars
    (
      ?auto_138418 - BLOCK
      ?auto_138414 - BLOCK
      ?auto_138419 - BLOCK
      ?auto_138421 - BLOCK
      ?auto_138417 - BLOCK
      ?auto_138415 - BLOCK
      ?auto_138416 - BLOCK
      ?auto_138420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138413 ?auto_138418 ) ) ( ON-TABLE ?auto_138414 ) ( ON ?auto_138419 ?auto_138414 ) ( ON ?auto_138421 ?auto_138419 ) ( ON ?auto_138417 ?auto_138421 ) ( not ( = ?auto_138414 ?auto_138419 ) ) ( not ( = ?auto_138414 ?auto_138421 ) ) ( not ( = ?auto_138414 ?auto_138417 ) ) ( not ( = ?auto_138414 ?auto_138415 ) ) ( not ( = ?auto_138414 ?auto_138416 ) ) ( not ( = ?auto_138414 ?auto_138418 ) ) ( not ( = ?auto_138414 ?auto_138413 ) ) ( not ( = ?auto_138419 ?auto_138421 ) ) ( not ( = ?auto_138419 ?auto_138417 ) ) ( not ( = ?auto_138419 ?auto_138415 ) ) ( not ( = ?auto_138419 ?auto_138416 ) ) ( not ( = ?auto_138419 ?auto_138418 ) ) ( not ( = ?auto_138419 ?auto_138413 ) ) ( not ( = ?auto_138421 ?auto_138417 ) ) ( not ( = ?auto_138421 ?auto_138415 ) ) ( not ( = ?auto_138421 ?auto_138416 ) ) ( not ( = ?auto_138421 ?auto_138418 ) ) ( not ( = ?auto_138421 ?auto_138413 ) ) ( not ( = ?auto_138417 ?auto_138415 ) ) ( not ( = ?auto_138417 ?auto_138416 ) ) ( not ( = ?auto_138417 ?auto_138418 ) ) ( not ( = ?auto_138417 ?auto_138413 ) ) ( not ( = ?auto_138415 ?auto_138416 ) ) ( not ( = ?auto_138415 ?auto_138418 ) ) ( not ( = ?auto_138415 ?auto_138413 ) ) ( not ( = ?auto_138416 ?auto_138418 ) ) ( not ( = ?auto_138416 ?auto_138413 ) ) ( ON ?auto_138413 ?auto_138420 ) ( not ( = ?auto_138413 ?auto_138420 ) ) ( not ( = ?auto_138418 ?auto_138420 ) ) ( not ( = ?auto_138414 ?auto_138420 ) ) ( not ( = ?auto_138419 ?auto_138420 ) ) ( not ( = ?auto_138421 ?auto_138420 ) ) ( not ( = ?auto_138417 ?auto_138420 ) ) ( not ( = ?auto_138415 ?auto_138420 ) ) ( not ( = ?auto_138416 ?auto_138420 ) ) ( ON ?auto_138418 ?auto_138413 ) ( ON-TABLE ?auto_138420 ) ( ON ?auto_138416 ?auto_138418 ) ( CLEAR ?auto_138416 ) ( HOLDING ?auto_138415 ) ( CLEAR ?auto_138417 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138414 ?auto_138419 ?auto_138421 ?auto_138417 ?auto_138415 )
      ( MAKE-1PILE ?auto_138413 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138422 - BLOCK
    )
    :vars
    (
      ?auto_138423 - BLOCK
      ?auto_138430 - BLOCK
      ?auto_138425 - BLOCK
      ?auto_138428 - BLOCK
      ?auto_138427 - BLOCK
      ?auto_138426 - BLOCK
      ?auto_138424 - BLOCK
      ?auto_138429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138422 ?auto_138423 ) ) ( ON-TABLE ?auto_138430 ) ( ON ?auto_138425 ?auto_138430 ) ( ON ?auto_138428 ?auto_138425 ) ( ON ?auto_138427 ?auto_138428 ) ( not ( = ?auto_138430 ?auto_138425 ) ) ( not ( = ?auto_138430 ?auto_138428 ) ) ( not ( = ?auto_138430 ?auto_138427 ) ) ( not ( = ?auto_138430 ?auto_138426 ) ) ( not ( = ?auto_138430 ?auto_138424 ) ) ( not ( = ?auto_138430 ?auto_138423 ) ) ( not ( = ?auto_138430 ?auto_138422 ) ) ( not ( = ?auto_138425 ?auto_138428 ) ) ( not ( = ?auto_138425 ?auto_138427 ) ) ( not ( = ?auto_138425 ?auto_138426 ) ) ( not ( = ?auto_138425 ?auto_138424 ) ) ( not ( = ?auto_138425 ?auto_138423 ) ) ( not ( = ?auto_138425 ?auto_138422 ) ) ( not ( = ?auto_138428 ?auto_138427 ) ) ( not ( = ?auto_138428 ?auto_138426 ) ) ( not ( = ?auto_138428 ?auto_138424 ) ) ( not ( = ?auto_138428 ?auto_138423 ) ) ( not ( = ?auto_138428 ?auto_138422 ) ) ( not ( = ?auto_138427 ?auto_138426 ) ) ( not ( = ?auto_138427 ?auto_138424 ) ) ( not ( = ?auto_138427 ?auto_138423 ) ) ( not ( = ?auto_138427 ?auto_138422 ) ) ( not ( = ?auto_138426 ?auto_138424 ) ) ( not ( = ?auto_138426 ?auto_138423 ) ) ( not ( = ?auto_138426 ?auto_138422 ) ) ( not ( = ?auto_138424 ?auto_138423 ) ) ( not ( = ?auto_138424 ?auto_138422 ) ) ( ON ?auto_138422 ?auto_138429 ) ( not ( = ?auto_138422 ?auto_138429 ) ) ( not ( = ?auto_138423 ?auto_138429 ) ) ( not ( = ?auto_138430 ?auto_138429 ) ) ( not ( = ?auto_138425 ?auto_138429 ) ) ( not ( = ?auto_138428 ?auto_138429 ) ) ( not ( = ?auto_138427 ?auto_138429 ) ) ( not ( = ?auto_138426 ?auto_138429 ) ) ( not ( = ?auto_138424 ?auto_138429 ) ) ( ON ?auto_138423 ?auto_138422 ) ( ON-TABLE ?auto_138429 ) ( ON ?auto_138424 ?auto_138423 ) ( CLEAR ?auto_138427 ) ( ON ?auto_138426 ?auto_138424 ) ( CLEAR ?auto_138426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138429 ?auto_138422 ?auto_138423 ?auto_138424 )
      ( MAKE-1PILE ?auto_138422 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138431 - BLOCK
    )
    :vars
    (
      ?auto_138432 - BLOCK
      ?auto_138439 - BLOCK
      ?auto_138436 - BLOCK
      ?auto_138438 - BLOCK
      ?auto_138435 - BLOCK
      ?auto_138433 - BLOCK
      ?auto_138437 - BLOCK
      ?auto_138434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138431 ?auto_138432 ) ) ( ON-TABLE ?auto_138439 ) ( ON ?auto_138436 ?auto_138439 ) ( ON ?auto_138438 ?auto_138436 ) ( not ( = ?auto_138439 ?auto_138436 ) ) ( not ( = ?auto_138439 ?auto_138438 ) ) ( not ( = ?auto_138439 ?auto_138435 ) ) ( not ( = ?auto_138439 ?auto_138433 ) ) ( not ( = ?auto_138439 ?auto_138437 ) ) ( not ( = ?auto_138439 ?auto_138432 ) ) ( not ( = ?auto_138439 ?auto_138431 ) ) ( not ( = ?auto_138436 ?auto_138438 ) ) ( not ( = ?auto_138436 ?auto_138435 ) ) ( not ( = ?auto_138436 ?auto_138433 ) ) ( not ( = ?auto_138436 ?auto_138437 ) ) ( not ( = ?auto_138436 ?auto_138432 ) ) ( not ( = ?auto_138436 ?auto_138431 ) ) ( not ( = ?auto_138438 ?auto_138435 ) ) ( not ( = ?auto_138438 ?auto_138433 ) ) ( not ( = ?auto_138438 ?auto_138437 ) ) ( not ( = ?auto_138438 ?auto_138432 ) ) ( not ( = ?auto_138438 ?auto_138431 ) ) ( not ( = ?auto_138435 ?auto_138433 ) ) ( not ( = ?auto_138435 ?auto_138437 ) ) ( not ( = ?auto_138435 ?auto_138432 ) ) ( not ( = ?auto_138435 ?auto_138431 ) ) ( not ( = ?auto_138433 ?auto_138437 ) ) ( not ( = ?auto_138433 ?auto_138432 ) ) ( not ( = ?auto_138433 ?auto_138431 ) ) ( not ( = ?auto_138437 ?auto_138432 ) ) ( not ( = ?auto_138437 ?auto_138431 ) ) ( ON ?auto_138431 ?auto_138434 ) ( not ( = ?auto_138431 ?auto_138434 ) ) ( not ( = ?auto_138432 ?auto_138434 ) ) ( not ( = ?auto_138439 ?auto_138434 ) ) ( not ( = ?auto_138436 ?auto_138434 ) ) ( not ( = ?auto_138438 ?auto_138434 ) ) ( not ( = ?auto_138435 ?auto_138434 ) ) ( not ( = ?auto_138433 ?auto_138434 ) ) ( not ( = ?auto_138437 ?auto_138434 ) ) ( ON ?auto_138432 ?auto_138431 ) ( ON-TABLE ?auto_138434 ) ( ON ?auto_138437 ?auto_138432 ) ( ON ?auto_138433 ?auto_138437 ) ( CLEAR ?auto_138433 ) ( HOLDING ?auto_138435 ) ( CLEAR ?auto_138438 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138439 ?auto_138436 ?auto_138438 ?auto_138435 )
      ( MAKE-1PILE ?auto_138431 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138440 - BLOCK
    )
    :vars
    (
      ?auto_138447 - BLOCK
      ?auto_138444 - BLOCK
      ?auto_138448 - BLOCK
      ?auto_138443 - BLOCK
      ?auto_138446 - BLOCK
      ?auto_138445 - BLOCK
      ?auto_138441 - BLOCK
      ?auto_138442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138440 ?auto_138447 ) ) ( ON-TABLE ?auto_138444 ) ( ON ?auto_138448 ?auto_138444 ) ( ON ?auto_138443 ?auto_138448 ) ( not ( = ?auto_138444 ?auto_138448 ) ) ( not ( = ?auto_138444 ?auto_138443 ) ) ( not ( = ?auto_138444 ?auto_138446 ) ) ( not ( = ?auto_138444 ?auto_138445 ) ) ( not ( = ?auto_138444 ?auto_138441 ) ) ( not ( = ?auto_138444 ?auto_138447 ) ) ( not ( = ?auto_138444 ?auto_138440 ) ) ( not ( = ?auto_138448 ?auto_138443 ) ) ( not ( = ?auto_138448 ?auto_138446 ) ) ( not ( = ?auto_138448 ?auto_138445 ) ) ( not ( = ?auto_138448 ?auto_138441 ) ) ( not ( = ?auto_138448 ?auto_138447 ) ) ( not ( = ?auto_138448 ?auto_138440 ) ) ( not ( = ?auto_138443 ?auto_138446 ) ) ( not ( = ?auto_138443 ?auto_138445 ) ) ( not ( = ?auto_138443 ?auto_138441 ) ) ( not ( = ?auto_138443 ?auto_138447 ) ) ( not ( = ?auto_138443 ?auto_138440 ) ) ( not ( = ?auto_138446 ?auto_138445 ) ) ( not ( = ?auto_138446 ?auto_138441 ) ) ( not ( = ?auto_138446 ?auto_138447 ) ) ( not ( = ?auto_138446 ?auto_138440 ) ) ( not ( = ?auto_138445 ?auto_138441 ) ) ( not ( = ?auto_138445 ?auto_138447 ) ) ( not ( = ?auto_138445 ?auto_138440 ) ) ( not ( = ?auto_138441 ?auto_138447 ) ) ( not ( = ?auto_138441 ?auto_138440 ) ) ( ON ?auto_138440 ?auto_138442 ) ( not ( = ?auto_138440 ?auto_138442 ) ) ( not ( = ?auto_138447 ?auto_138442 ) ) ( not ( = ?auto_138444 ?auto_138442 ) ) ( not ( = ?auto_138448 ?auto_138442 ) ) ( not ( = ?auto_138443 ?auto_138442 ) ) ( not ( = ?auto_138446 ?auto_138442 ) ) ( not ( = ?auto_138445 ?auto_138442 ) ) ( not ( = ?auto_138441 ?auto_138442 ) ) ( ON ?auto_138447 ?auto_138440 ) ( ON-TABLE ?auto_138442 ) ( ON ?auto_138441 ?auto_138447 ) ( ON ?auto_138445 ?auto_138441 ) ( CLEAR ?auto_138443 ) ( ON ?auto_138446 ?auto_138445 ) ( CLEAR ?auto_138446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138442 ?auto_138440 ?auto_138447 ?auto_138441 ?auto_138445 )
      ( MAKE-1PILE ?auto_138440 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138449 - BLOCK
    )
    :vars
    (
      ?auto_138454 - BLOCK
      ?auto_138453 - BLOCK
      ?auto_138452 - BLOCK
      ?auto_138455 - BLOCK
      ?auto_138456 - BLOCK
      ?auto_138451 - BLOCK
      ?auto_138457 - BLOCK
      ?auto_138450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138449 ?auto_138454 ) ) ( ON-TABLE ?auto_138453 ) ( ON ?auto_138452 ?auto_138453 ) ( not ( = ?auto_138453 ?auto_138452 ) ) ( not ( = ?auto_138453 ?auto_138455 ) ) ( not ( = ?auto_138453 ?auto_138456 ) ) ( not ( = ?auto_138453 ?auto_138451 ) ) ( not ( = ?auto_138453 ?auto_138457 ) ) ( not ( = ?auto_138453 ?auto_138454 ) ) ( not ( = ?auto_138453 ?auto_138449 ) ) ( not ( = ?auto_138452 ?auto_138455 ) ) ( not ( = ?auto_138452 ?auto_138456 ) ) ( not ( = ?auto_138452 ?auto_138451 ) ) ( not ( = ?auto_138452 ?auto_138457 ) ) ( not ( = ?auto_138452 ?auto_138454 ) ) ( not ( = ?auto_138452 ?auto_138449 ) ) ( not ( = ?auto_138455 ?auto_138456 ) ) ( not ( = ?auto_138455 ?auto_138451 ) ) ( not ( = ?auto_138455 ?auto_138457 ) ) ( not ( = ?auto_138455 ?auto_138454 ) ) ( not ( = ?auto_138455 ?auto_138449 ) ) ( not ( = ?auto_138456 ?auto_138451 ) ) ( not ( = ?auto_138456 ?auto_138457 ) ) ( not ( = ?auto_138456 ?auto_138454 ) ) ( not ( = ?auto_138456 ?auto_138449 ) ) ( not ( = ?auto_138451 ?auto_138457 ) ) ( not ( = ?auto_138451 ?auto_138454 ) ) ( not ( = ?auto_138451 ?auto_138449 ) ) ( not ( = ?auto_138457 ?auto_138454 ) ) ( not ( = ?auto_138457 ?auto_138449 ) ) ( ON ?auto_138449 ?auto_138450 ) ( not ( = ?auto_138449 ?auto_138450 ) ) ( not ( = ?auto_138454 ?auto_138450 ) ) ( not ( = ?auto_138453 ?auto_138450 ) ) ( not ( = ?auto_138452 ?auto_138450 ) ) ( not ( = ?auto_138455 ?auto_138450 ) ) ( not ( = ?auto_138456 ?auto_138450 ) ) ( not ( = ?auto_138451 ?auto_138450 ) ) ( not ( = ?auto_138457 ?auto_138450 ) ) ( ON ?auto_138454 ?auto_138449 ) ( ON-TABLE ?auto_138450 ) ( ON ?auto_138457 ?auto_138454 ) ( ON ?auto_138451 ?auto_138457 ) ( ON ?auto_138456 ?auto_138451 ) ( CLEAR ?auto_138456 ) ( HOLDING ?auto_138455 ) ( CLEAR ?auto_138452 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138453 ?auto_138452 ?auto_138455 )
      ( MAKE-1PILE ?auto_138449 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138458 - BLOCK
    )
    :vars
    (
      ?auto_138463 - BLOCK
      ?auto_138459 - BLOCK
      ?auto_138465 - BLOCK
      ?auto_138466 - BLOCK
      ?auto_138462 - BLOCK
      ?auto_138464 - BLOCK
      ?auto_138461 - BLOCK
      ?auto_138460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138458 ?auto_138463 ) ) ( ON-TABLE ?auto_138459 ) ( ON ?auto_138465 ?auto_138459 ) ( not ( = ?auto_138459 ?auto_138465 ) ) ( not ( = ?auto_138459 ?auto_138466 ) ) ( not ( = ?auto_138459 ?auto_138462 ) ) ( not ( = ?auto_138459 ?auto_138464 ) ) ( not ( = ?auto_138459 ?auto_138461 ) ) ( not ( = ?auto_138459 ?auto_138463 ) ) ( not ( = ?auto_138459 ?auto_138458 ) ) ( not ( = ?auto_138465 ?auto_138466 ) ) ( not ( = ?auto_138465 ?auto_138462 ) ) ( not ( = ?auto_138465 ?auto_138464 ) ) ( not ( = ?auto_138465 ?auto_138461 ) ) ( not ( = ?auto_138465 ?auto_138463 ) ) ( not ( = ?auto_138465 ?auto_138458 ) ) ( not ( = ?auto_138466 ?auto_138462 ) ) ( not ( = ?auto_138466 ?auto_138464 ) ) ( not ( = ?auto_138466 ?auto_138461 ) ) ( not ( = ?auto_138466 ?auto_138463 ) ) ( not ( = ?auto_138466 ?auto_138458 ) ) ( not ( = ?auto_138462 ?auto_138464 ) ) ( not ( = ?auto_138462 ?auto_138461 ) ) ( not ( = ?auto_138462 ?auto_138463 ) ) ( not ( = ?auto_138462 ?auto_138458 ) ) ( not ( = ?auto_138464 ?auto_138461 ) ) ( not ( = ?auto_138464 ?auto_138463 ) ) ( not ( = ?auto_138464 ?auto_138458 ) ) ( not ( = ?auto_138461 ?auto_138463 ) ) ( not ( = ?auto_138461 ?auto_138458 ) ) ( ON ?auto_138458 ?auto_138460 ) ( not ( = ?auto_138458 ?auto_138460 ) ) ( not ( = ?auto_138463 ?auto_138460 ) ) ( not ( = ?auto_138459 ?auto_138460 ) ) ( not ( = ?auto_138465 ?auto_138460 ) ) ( not ( = ?auto_138466 ?auto_138460 ) ) ( not ( = ?auto_138462 ?auto_138460 ) ) ( not ( = ?auto_138464 ?auto_138460 ) ) ( not ( = ?auto_138461 ?auto_138460 ) ) ( ON ?auto_138463 ?auto_138458 ) ( ON-TABLE ?auto_138460 ) ( ON ?auto_138461 ?auto_138463 ) ( ON ?auto_138464 ?auto_138461 ) ( ON ?auto_138462 ?auto_138464 ) ( CLEAR ?auto_138465 ) ( ON ?auto_138466 ?auto_138462 ) ( CLEAR ?auto_138466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138460 ?auto_138458 ?auto_138463 ?auto_138461 ?auto_138464 ?auto_138462 )
      ( MAKE-1PILE ?auto_138458 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138467 - BLOCK
    )
    :vars
    (
      ?auto_138469 - BLOCK
      ?auto_138470 - BLOCK
      ?auto_138468 - BLOCK
      ?auto_138474 - BLOCK
      ?auto_138473 - BLOCK
      ?auto_138472 - BLOCK
      ?auto_138471 - BLOCK
      ?auto_138475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138467 ?auto_138469 ) ) ( ON-TABLE ?auto_138470 ) ( not ( = ?auto_138470 ?auto_138468 ) ) ( not ( = ?auto_138470 ?auto_138474 ) ) ( not ( = ?auto_138470 ?auto_138473 ) ) ( not ( = ?auto_138470 ?auto_138472 ) ) ( not ( = ?auto_138470 ?auto_138471 ) ) ( not ( = ?auto_138470 ?auto_138469 ) ) ( not ( = ?auto_138470 ?auto_138467 ) ) ( not ( = ?auto_138468 ?auto_138474 ) ) ( not ( = ?auto_138468 ?auto_138473 ) ) ( not ( = ?auto_138468 ?auto_138472 ) ) ( not ( = ?auto_138468 ?auto_138471 ) ) ( not ( = ?auto_138468 ?auto_138469 ) ) ( not ( = ?auto_138468 ?auto_138467 ) ) ( not ( = ?auto_138474 ?auto_138473 ) ) ( not ( = ?auto_138474 ?auto_138472 ) ) ( not ( = ?auto_138474 ?auto_138471 ) ) ( not ( = ?auto_138474 ?auto_138469 ) ) ( not ( = ?auto_138474 ?auto_138467 ) ) ( not ( = ?auto_138473 ?auto_138472 ) ) ( not ( = ?auto_138473 ?auto_138471 ) ) ( not ( = ?auto_138473 ?auto_138469 ) ) ( not ( = ?auto_138473 ?auto_138467 ) ) ( not ( = ?auto_138472 ?auto_138471 ) ) ( not ( = ?auto_138472 ?auto_138469 ) ) ( not ( = ?auto_138472 ?auto_138467 ) ) ( not ( = ?auto_138471 ?auto_138469 ) ) ( not ( = ?auto_138471 ?auto_138467 ) ) ( ON ?auto_138467 ?auto_138475 ) ( not ( = ?auto_138467 ?auto_138475 ) ) ( not ( = ?auto_138469 ?auto_138475 ) ) ( not ( = ?auto_138470 ?auto_138475 ) ) ( not ( = ?auto_138468 ?auto_138475 ) ) ( not ( = ?auto_138474 ?auto_138475 ) ) ( not ( = ?auto_138473 ?auto_138475 ) ) ( not ( = ?auto_138472 ?auto_138475 ) ) ( not ( = ?auto_138471 ?auto_138475 ) ) ( ON ?auto_138469 ?auto_138467 ) ( ON-TABLE ?auto_138475 ) ( ON ?auto_138471 ?auto_138469 ) ( ON ?auto_138472 ?auto_138471 ) ( ON ?auto_138473 ?auto_138472 ) ( ON ?auto_138474 ?auto_138473 ) ( CLEAR ?auto_138474 ) ( HOLDING ?auto_138468 ) ( CLEAR ?auto_138470 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138470 ?auto_138468 )
      ( MAKE-1PILE ?auto_138467 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138476 - BLOCK
    )
    :vars
    (
      ?auto_138479 - BLOCK
      ?auto_138484 - BLOCK
      ?auto_138481 - BLOCK
      ?auto_138477 - BLOCK
      ?auto_138483 - BLOCK
      ?auto_138480 - BLOCK
      ?auto_138478 - BLOCK
      ?auto_138482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138476 ?auto_138479 ) ) ( ON-TABLE ?auto_138484 ) ( not ( = ?auto_138484 ?auto_138481 ) ) ( not ( = ?auto_138484 ?auto_138477 ) ) ( not ( = ?auto_138484 ?auto_138483 ) ) ( not ( = ?auto_138484 ?auto_138480 ) ) ( not ( = ?auto_138484 ?auto_138478 ) ) ( not ( = ?auto_138484 ?auto_138479 ) ) ( not ( = ?auto_138484 ?auto_138476 ) ) ( not ( = ?auto_138481 ?auto_138477 ) ) ( not ( = ?auto_138481 ?auto_138483 ) ) ( not ( = ?auto_138481 ?auto_138480 ) ) ( not ( = ?auto_138481 ?auto_138478 ) ) ( not ( = ?auto_138481 ?auto_138479 ) ) ( not ( = ?auto_138481 ?auto_138476 ) ) ( not ( = ?auto_138477 ?auto_138483 ) ) ( not ( = ?auto_138477 ?auto_138480 ) ) ( not ( = ?auto_138477 ?auto_138478 ) ) ( not ( = ?auto_138477 ?auto_138479 ) ) ( not ( = ?auto_138477 ?auto_138476 ) ) ( not ( = ?auto_138483 ?auto_138480 ) ) ( not ( = ?auto_138483 ?auto_138478 ) ) ( not ( = ?auto_138483 ?auto_138479 ) ) ( not ( = ?auto_138483 ?auto_138476 ) ) ( not ( = ?auto_138480 ?auto_138478 ) ) ( not ( = ?auto_138480 ?auto_138479 ) ) ( not ( = ?auto_138480 ?auto_138476 ) ) ( not ( = ?auto_138478 ?auto_138479 ) ) ( not ( = ?auto_138478 ?auto_138476 ) ) ( ON ?auto_138476 ?auto_138482 ) ( not ( = ?auto_138476 ?auto_138482 ) ) ( not ( = ?auto_138479 ?auto_138482 ) ) ( not ( = ?auto_138484 ?auto_138482 ) ) ( not ( = ?auto_138481 ?auto_138482 ) ) ( not ( = ?auto_138477 ?auto_138482 ) ) ( not ( = ?auto_138483 ?auto_138482 ) ) ( not ( = ?auto_138480 ?auto_138482 ) ) ( not ( = ?auto_138478 ?auto_138482 ) ) ( ON ?auto_138479 ?auto_138476 ) ( ON-TABLE ?auto_138482 ) ( ON ?auto_138478 ?auto_138479 ) ( ON ?auto_138480 ?auto_138478 ) ( ON ?auto_138483 ?auto_138480 ) ( ON ?auto_138477 ?auto_138483 ) ( CLEAR ?auto_138484 ) ( ON ?auto_138481 ?auto_138477 ) ( CLEAR ?auto_138481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138482 ?auto_138476 ?auto_138479 ?auto_138478 ?auto_138480 ?auto_138483 ?auto_138477 )
      ( MAKE-1PILE ?auto_138476 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138485 - BLOCK
    )
    :vars
    (
      ?auto_138490 - BLOCK
      ?auto_138492 - BLOCK
      ?auto_138488 - BLOCK
      ?auto_138486 - BLOCK
      ?auto_138489 - BLOCK
      ?auto_138493 - BLOCK
      ?auto_138491 - BLOCK
      ?auto_138487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138485 ?auto_138490 ) ) ( not ( = ?auto_138492 ?auto_138488 ) ) ( not ( = ?auto_138492 ?auto_138486 ) ) ( not ( = ?auto_138492 ?auto_138489 ) ) ( not ( = ?auto_138492 ?auto_138493 ) ) ( not ( = ?auto_138492 ?auto_138491 ) ) ( not ( = ?auto_138492 ?auto_138490 ) ) ( not ( = ?auto_138492 ?auto_138485 ) ) ( not ( = ?auto_138488 ?auto_138486 ) ) ( not ( = ?auto_138488 ?auto_138489 ) ) ( not ( = ?auto_138488 ?auto_138493 ) ) ( not ( = ?auto_138488 ?auto_138491 ) ) ( not ( = ?auto_138488 ?auto_138490 ) ) ( not ( = ?auto_138488 ?auto_138485 ) ) ( not ( = ?auto_138486 ?auto_138489 ) ) ( not ( = ?auto_138486 ?auto_138493 ) ) ( not ( = ?auto_138486 ?auto_138491 ) ) ( not ( = ?auto_138486 ?auto_138490 ) ) ( not ( = ?auto_138486 ?auto_138485 ) ) ( not ( = ?auto_138489 ?auto_138493 ) ) ( not ( = ?auto_138489 ?auto_138491 ) ) ( not ( = ?auto_138489 ?auto_138490 ) ) ( not ( = ?auto_138489 ?auto_138485 ) ) ( not ( = ?auto_138493 ?auto_138491 ) ) ( not ( = ?auto_138493 ?auto_138490 ) ) ( not ( = ?auto_138493 ?auto_138485 ) ) ( not ( = ?auto_138491 ?auto_138490 ) ) ( not ( = ?auto_138491 ?auto_138485 ) ) ( ON ?auto_138485 ?auto_138487 ) ( not ( = ?auto_138485 ?auto_138487 ) ) ( not ( = ?auto_138490 ?auto_138487 ) ) ( not ( = ?auto_138492 ?auto_138487 ) ) ( not ( = ?auto_138488 ?auto_138487 ) ) ( not ( = ?auto_138486 ?auto_138487 ) ) ( not ( = ?auto_138489 ?auto_138487 ) ) ( not ( = ?auto_138493 ?auto_138487 ) ) ( not ( = ?auto_138491 ?auto_138487 ) ) ( ON ?auto_138490 ?auto_138485 ) ( ON-TABLE ?auto_138487 ) ( ON ?auto_138491 ?auto_138490 ) ( ON ?auto_138493 ?auto_138491 ) ( ON ?auto_138489 ?auto_138493 ) ( ON ?auto_138486 ?auto_138489 ) ( ON ?auto_138488 ?auto_138486 ) ( CLEAR ?auto_138488 ) ( HOLDING ?auto_138492 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138492 )
      ( MAKE-1PILE ?auto_138485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_138494 - BLOCK
    )
    :vars
    (
      ?auto_138501 - BLOCK
      ?auto_138500 - BLOCK
      ?auto_138495 - BLOCK
      ?auto_138502 - BLOCK
      ?auto_138496 - BLOCK
      ?auto_138498 - BLOCK
      ?auto_138499 - BLOCK
      ?auto_138497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138494 ?auto_138501 ) ) ( not ( = ?auto_138500 ?auto_138495 ) ) ( not ( = ?auto_138500 ?auto_138502 ) ) ( not ( = ?auto_138500 ?auto_138496 ) ) ( not ( = ?auto_138500 ?auto_138498 ) ) ( not ( = ?auto_138500 ?auto_138499 ) ) ( not ( = ?auto_138500 ?auto_138501 ) ) ( not ( = ?auto_138500 ?auto_138494 ) ) ( not ( = ?auto_138495 ?auto_138502 ) ) ( not ( = ?auto_138495 ?auto_138496 ) ) ( not ( = ?auto_138495 ?auto_138498 ) ) ( not ( = ?auto_138495 ?auto_138499 ) ) ( not ( = ?auto_138495 ?auto_138501 ) ) ( not ( = ?auto_138495 ?auto_138494 ) ) ( not ( = ?auto_138502 ?auto_138496 ) ) ( not ( = ?auto_138502 ?auto_138498 ) ) ( not ( = ?auto_138502 ?auto_138499 ) ) ( not ( = ?auto_138502 ?auto_138501 ) ) ( not ( = ?auto_138502 ?auto_138494 ) ) ( not ( = ?auto_138496 ?auto_138498 ) ) ( not ( = ?auto_138496 ?auto_138499 ) ) ( not ( = ?auto_138496 ?auto_138501 ) ) ( not ( = ?auto_138496 ?auto_138494 ) ) ( not ( = ?auto_138498 ?auto_138499 ) ) ( not ( = ?auto_138498 ?auto_138501 ) ) ( not ( = ?auto_138498 ?auto_138494 ) ) ( not ( = ?auto_138499 ?auto_138501 ) ) ( not ( = ?auto_138499 ?auto_138494 ) ) ( ON ?auto_138494 ?auto_138497 ) ( not ( = ?auto_138494 ?auto_138497 ) ) ( not ( = ?auto_138501 ?auto_138497 ) ) ( not ( = ?auto_138500 ?auto_138497 ) ) ( not ( = ?auto_138495 ?auto_138497 ) ) ( not ( = ?auto_138502 ?auto_138497 ) ) ( not ( = ?auto_138496 ?auto_138497 ) ) ( not ( = ?auto_138498 ?auto_138497 ) ) ( not ( = ?auto_138499 ?auto_138497 ) ) ( ON ?auto_138501 ?auto_138494 ) ( ON-TABLE ?auto_138497 ) ( ON ?auto_138499 ?auto_138501 ) ( ON ?auto_138498 ?auto_138499 ) ( ON ?auto_138496 ?auto_138498 ) ( ON ?auto_138502 ?auto_138496 ) ( ON ?auto_138495 ?auto_138502 ) ( ON ?auto_138500 ?auto_138495 ) ( CLEAR ?auto_138500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138497 ?auto_138494 ?auto_138501 ?auto_138499 ?auto_138498 ?auto_138496 ?auto_138502 ?auto_138495 )
      ( MAKE-1PILE ?auto_138494 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138509 - BLOCK
      ?auto_138510 - BLOCK
      ?auto_138511 - BLOCK
      ?auto_138512 - BLOCK
      ?auto_138513 - BLOCK
      ?auto_138514 - BLOCK
    )
    :vars
    (
      ?auto_138515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138515 ?auto_138514 ) ( CLEAR ?auto_138515 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138509 ) ( ON ?auto_138510 ?auto_138509 ) ( ON ?auto_138511 ?auto_138510 ) ( ON ?auto_138512 ?auto_138511 ) ( ON ?auto_138513 ?auto_138512 ) ( ON ?auto_138514 ?auto_138513 ) ( not ( = ?auto_138509 ?auto_138510 ) ) ( not ( = ?auto_138509 ?auto_138511 ) ) ( not ( = ?auto_138509 ?auto_138512 ) ) ( not ( = ?auto_138509 ?auto_138513 ) ) ( not ( = ?auto_138509 ?auto_138514 ) ) ( not ( = ?auto_138509 ?auto_138515 ) ) ( not ( = ?auto_138510 ?auto_138511 ) ) ( not ( = ?auto_138510 ?auto_138512 ) ) ( not ( = ?auto_138510 ?auto_138513 ) ) ( not ( = ?auto_138510 ?auto_138514 ) ) ( not ( = ?auto_138510 ?auto_138515 ) ) ( not ( = ?auto_138511 ?auto_138512 ) ) ( not ( = ?auto_138511 ?auto_138513 ) ) ( not ( = ?auto_138511 ?auto_138514 ) ) ( not ( = ?auto_138511 ?auto_138515 ) ) ( not ( = ?auto_138512 ?auto_138513 ) ) ( not ( = ?auto_138512 ?auto_138514 ) ) ( not ( = ?auto_138512 ?auto_138515 ) ) ( not ( = ?auto_138513 ?auto_138514 ) ) ( not ( = ?auto_138513 ?auto_138515 ) ) ( not ( = ?auto_138514 ?auto_138515 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138515 ?auto_138514 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138516 - BLOCK
      ?auto_138517 - BLOCK
      ?auto_138518 - BLOCK
      ?auto_138519 - BLOCK
      ?auto_138520 - BLOCK
      ?auto_138521 - BLOCK
    )
    :vars
    (
      ?auto_138522 - BLOCK
      ?auto_138523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138522 ?auto_138521 ) ( CLEAR ?auto_138522 ) ( ON-TABLE ?auto_138516 ) ( ON ?auto_138517 ?auto_138516 ) ( ON ?auto_138518 ?auto_138517 ) ( ON ?auto_138519 ?auto_138518 ) ( ON ?auto_138520 ?auto_138519 ) ( ON ?auto_138521 ?auto_138520 ) ( not ( = ?auto_138516 ?auto_138517 ) ) ( not ( = ?auto_138516 ?auto_138518 ) ) ( not ( = ?auto_138516 ?auto_138519 ) ) ( not ( = ?auto_138516 ?auto_138520 ) ) ( not ( = ?auto_138516 ?auto_138521 ) ) ( not ( = ?auto_138516 ?auto_138522 ) ) ( not ( = ?auto_138517 ?auto_138518 ) ) ( not ( = ?auto_138517 ?auto_138519 ) ) ( not ( = ?auto_138517 ?auto_138520 ) ) ( not ( = ?auto_138517 ?auto_138521 ) ) ( not ( = ?auto_138517 ?auto_138522 ) ) ( not ( = ?auto_138518 ?auto_138519 ) ) ( not ( = ?auto_138518 ?auto_138520 ) ) ( not ( = ?auto_138518 ?auto_138521 ) ) ( not ( = ?auto_138518 ?auto_138522 ) ) ( not ( = ?auto_138519 ?auto_138520 ) ) ( not ( = ?auto_138519 ?auto_138521 ) ) ( not ( = ?auto_138519 ?auto_138522 ) ) ( not ( = ?auto_138520 ?auto_138521 ) ) ( not ( = ?auto_138520 ?auto_138522 ) ) ( not ( = ?auto_138521 ?auto_138522 ) ) ( HOLDING ?auto_138523 ) ( not ( = ?auto_138516 ?auto_138523 ) ) ( not ( = ?auto_138517 ?auto_138523 ) ) ( not ( = ?auto_138518 ?auto_138523 ) ) ( not ( = ?auto_138519 ?auto_138523 ) ) ( not ( = ?auto_138520 ?auto_138523 ) ) ( not ( = ?auto_138521 ?auto_138523 ) ) ( not ( = ?auto_138522 ?auto_138523 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_138523 )
      ( MAKE-6PILE ?auto_138516 ?auto_138517 ?auto_138518 ?auto_138519 ?auto_138520 ?auto_138521 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138524 - BLOCK
      ?auto_138525 - BLOCK
      ?auto_138526 - BLOCK
      ?auto_138527 - BLOCK
      ?auto_138528 - BLOCK
      ?auto_138529 - BLOCK
    )
    :vars
    (
      ?auto_138531 - BLOCK
      ?auto_138530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138531 ?auto_138529 ) ( ON-TABLE ?auto_138524 ) ( ON ?auto_138525 ?auto_138524 ) ( ON ?auto_138526 ?auto_138525 ) ( ON ?auto_138527 ?auto_138526 ) ( ON ?auto_138528 ?auto_138527 ) ( ON ?auto_138529 ?auto_138528 ) ( not ( = ?auto_138524 ?auto_138525 ) ) ( not ( = ?auto_138524 ?auto_138526 ) ) ( not ( = ?auto_138524 ?auto_138527 ) ) ( not ( = ?auto_138524 ?auto_138528 ) ) ( not ( = ?auto_138524 ?auto_138529 ) ) ( not ( = ?auto_138524 ?auto_138531 ) ) ( not ( = ?auto_138525 ?auto_138526 ) ) ( not ( = ?auto_138525 ?auto_138527 ) ) ( not ( = ?auto_138525 ?auto_138528 ) ) ( not ( = ?auto_138525 ?auto_138529 ) ) ( not ( = ?auto_138525 ?auto_138531 ) ) ( not ( = ?auto_138526 ?auto_138527 ) ) ( not ( = ?auto_138526 ?auto_138528 ) ) ( not ( = ?auto_138526 ?auto_138529 ) ) ( not ( = ?auto_138526 ?auto_138531 ) ) ( not ( = ?auto_138527 ?auto_138528 ) ) ( not ( = ?auto_138527 ?auto_138529 ) ) ( not ( = ?auto_138527 ?auto_138531 ) ) ( not ( = ?auto_138528 ?auto_138529 ) ) ( not ( = ?auto_138528 ?auto_138531 ) ) ( not ( = ?auto_138529 ?auto_138531 ) ) ( not ( = ?auto_138524 ?auto_138530 ) ) ( not ( = ?auto_138525 ?auto_138530 ) ) ( not ( = ?auto_138526 ?auto_138530 ) ) ( not ( = ?auto_138527 ?auto_138530 ) ) ( not ( = ?auto_138528 ?auto_138530 ) ) ( not ( = ?auto_138529 ?auto_138530 ) ) ( not ( = ?auto_138531 ?auto_138530 ) ) ( ON ?auto_138530 ?auto_138531 ) ( CLEAR ?auto_138530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138524 ?auto_138525 ?auto_138526 ?auto_138527 ?auto_138528 ?auto_138529 ?auto_138531 )
      ( MAKE-6PILE ?auto_138524 ?auto_138525 ?auto_138526 ?auto_138527 ?auto_138528 ?auto_138529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138532 - BLOCK
      ?auto_138533 - BLOCK
      ?auto_138534 - BLOCK
      ?auto_138535 - BLOCK
      ?auto_138536 - BLOCK
      ?auto_138537 - BLOCK
    )
    :vars
    (
      ?auto_138538 - BLOCK
      ?auto_138539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138538 ?auto_138537 ) ( ON-TABLE ?auto_138532 ) ( ON ?auto_138533 ?auto_138532 ) ( ON ?auto_138534 ?auto_138533 ) ( ON ?auto_138535 ?auto_138534 ) ( ON ?auto_138536 ?auto_138535 ) ( ON ?auto_138537 ?auto_138536 ) ( not ( = ?auto_138532 ?auto_138533 ) ) ( not ( = ?auto_138532 ?auto_138534 ) ) ( not ( = ?auto_138532 ?auto_138535 ) ) ( not ( = ?auto_138532 ?auto_138536 ) ) ( not ( = ?auto_138532 ?auto_138537 ) ) ( not ( = ?auto_138532 ?auto_138538 ) ) ( not ( = ?auto_138533 ?auto_138534 ) ) ( not ( = ?auto_138533 ?auto_138535 ) ) ( not ( = ?auto_138533 ?auto_138536 ) ) ( not ( = ?auto_138533 ?auto_138537 ) ) ( not ( = ?auto_138533 ?auto_138538 ) ) ( not ( = ?auto_138534 ?auto_138535 ) ) ( not ( = ?auto_138534 ?auto_138536 ) ) ( not ( = ?auto_138534 ?auto_138537 ) ) ( not ( = ?auto_138534 ?auto_138538 ) ) ( not ( = ?auto_138535 ?auto_138536 ) ) ( not ( = ?auto_138535 ?auto_138537 ) ) ( not ( = ?auto_138535 ?auto_138538 ) ) ( not ( = ?auto_138536 ?auto_138537 ) ) ( not ( = ?auto_138536 ?auto_138538 ) ) ( not ( = ?auto_138537 ?auto_138538 ) ) ( not ( = ?auto_138532 ?auto_138539 ) ) ( not ( = ?auto_138533 ?auto_138539 ) ) ( not ( = ?auto_138534 ?auto_138539 ) ) ( not ( = ?auto_138535 ?auto_138539 ) ) ( not ( = ?auto_138536 ?auto_138539 ) ) ( not ( = ?auto_138537 ?auto_138539 ) ) ( not ( = ?auto_138538 ?auto_138539 ) ) ( HOLDING ?auto_138539 ) ( CLEAR ?auto_138538 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138532 ?auto_138533 ?auto_138534 ?auto_138535 ?auto_138536 ?auto_138537 ?auto_138538 ?auto_138539 )
      ( MAKE-6PILE ?auto_138532 ?auto_138533 ?auto_138534 ?auto_138535 ?auto_138536 ?auto_138537 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138540 - BLOCK
      ?auto_138541 - BLOCK
      ?auto_138542 - BLOCK
      ?auto_138543 - BLOCK
      ?auto_138544 - BLOCK
      ?auto_138545 - BLOCK
    )
    :vars
    (
      ?auto_138546 - BLOCK
      ?auto_138547 - BLOCK
      ?auto_138548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138546 ?auto_138545 ) ( ON-TABLE ?auto_138540 ) ( ON ?auto_138541 ?auto_138540 ) ( ON ?auto_138542 ?auto_138541 ) ( ON ?auto_138543 ?auto_138542 ) ( ON ?auto_138544 ?auto_138543 ) ( ON ?auto_138545 ?auto_138544 ) ( not ( = ?auto_138540 ?auto_138541 ) ) ( not ( = ?auto_138540 ?auto_138542 ) ) ( not ( = ?auto_138540 ?auto_138543 ) ) ( not ( = ?auto_138540 ?auto_138544 ) ) ( not ( = ?auto_138540 ?auto_138545 ) ) ( not ( = ?auto_138540 ?auto_138546 ) ) ( not ( = ?auto_138541 ?auto_138542 ) ) ( not ( = ?auto_138541 ?auto_138543 ) ) ( not ( = ?auto_138541 ?auto_138544 ) ) ( not ( = ?auto_138541 ?auto_138545 ) ) ( not ( = ?auto_138541 ?auto_138546 ) ) ( not ( = ?auto_138542 ?auto_138543 ) ) ( not ( = ?auto_138542 ?auto_138544 ) ) ( not ( = ?auto_138542 ?auto_138545 ) ) ( not ( = ?auto_138542 ?auto_138546 ) ) ( not ( = ?auto_138543 ?auto_138544 ) ) ( not ( = ?auto_138543 ?auto_138545 ) ) ( not ( = ?auto_138543 ?auto_138546 ) ) ( not ( = ?auto_138544 ?auto_138545 ) ) ( not ( = ?auto_138544 ?auto_138546 ) ) ( not ( = ?auto_138545 ?auto_138546 ) ) ( not ( = ?auto_138540 ?auto_138547 ) ) ( not ( = ?auto_138541 ?auto_138547 ) ) ( not ( = ?auto_138542 ?auto_138547 ) ) ( not ( = ?auto_138543 ?auto_138547 ) ) ( not ( = ?auto_138544 ?auto_138547 ) ) ( not ( = ?auto_138545 ?auto_138547 ) ) ( not ( = ?auto_138546 ?auto_138547 ) ) ( CLEAR ?auto_138546 ) ( ON ?auto_138547 ?auto_138548 ) ( CLEAR ?auto_138547 ) ( HAND-EMPTY ) ( not ( = ?auto_138540 ?auto_138548 ) ) ( not ( = ?auto_138541 ?auto_138548 ) ) ( not ( = ?auto_138542 ?auto_138548 ) ) ( not ( = ?auto_138543 ?auto_138548 ) ) ( not ( = ?auto_138544 ?auto_138548 ) ) ( not ( = ?auto_138545 ?auto_138548 ) ) ( not ( = ?auto_138546 ?auto_138548 ) ) ( not ( = ?auto_138547 ?auto_138548 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138547 ?auto_138548 )
      ( MAKE-6PILE ?auto_138540 ?auto_138541 ?auto_138542 ?auto_138543 ?auto_138544 ?auto_138545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138567 - BLOCK
      ?auto_138568 - BLOCK
      ?auto_138569 - BLOCK
      ?auto_138570 - BLOCK
      ?auto_138571 - BLOCK
      ?auto_138572 - BLOCK
    )
    :vars
    (
      ?auto_138573 - BLOCK
      ?auto_138575 - BLOCK
      ?auto_138574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138567 ) ( ON ?auto_138568 ?auto_138567 ) ( ON ?auto_138569 ?auto_138568 ) ( ON ?auto_138570 ?auto_138569 ) ( ON ?auto_138571 ?auto_138570 ) ( not ( = ?auto_138567 ?auto_138568 ) ) ( not ( = ?auto_138567 ?auto_138569 ) ) ( not ( = ?auto_138567 ?auto_138570 ) ) ( not ( = ?auto_138567 ?auto_138571 ) ) ( not ( = ?auto_138567 ?auto_138572 ) ) ( not ( = ?auto_138567 ?auto_138573 ) ) ( not ( = ?auto_138568 ?auto_138569 ) ) ( not ( = ?auto_138568 ?auto_138570 ) ) ( not ( = ?auto_138568 ?auto_138571 ) ) ( not ( = ?auto_138568 ?auto_138572 ) ) ( not ( = ?auto_138568 ?auto_138573 ) ) ( not ( = ?auto_138569 ?auto_138570 ) ) ( not ( = ?auto_138569 ?auto_138571 ) ) ( not ( = ?auto_138569 ?auto_138572 ) ) ( not ( = ?auto_138569 ?auto_138573 ) ) ( not ( = ?auto_138570 ?auto_138571 ) ) ( not ( = ?auto_138570 ?auto_138572 ) ) ( not ( = ?auto_138570 ?auto_138573 ) ) ( not ( = ?auto_138571 ?auto_138572 ) ) ( not ( = ?auto_138571 ?auto_138573 ) ) ( not ( = ?auto_138572 ?auto_138573 ) ) ( not ( = ?auto_138567 ?auto_138575 ) ) ( not ( = ?auto_138568 ?auto_138575 ) ) ( not ( = ?auto_138569 ?auto_138575 ) ) ( not ( = ?auto_138570 ?auto_138575 ) ) ( not ( = ?auto_138571 ?auto_138575 ) ) ( not ( = ?auto_138572 ?auto_138575 ) ) ( not ( = ?auto_138573 ?auto_138575 ) ) ( ON ?auto_138575 ?auto_138574 ) ( not ( = ?auto_138567 ?auto_138574 ) ) ( not ( = ?auto_138568 ?auto_138574 ) ) ( not ( = ?auto_138569 ?auto_138574 ) ) ( not ( = ?auto_138570 ?auto_138574 ) ) ( not ( = ?auto_138571 ?auto_138574 ) ) ( not ( = ?auto_138572 ?auto_138574 ) ) ( not ( = ?auto_138573 ?auto_138574 ) ) ( not ( = ?auto_138575 ?auto_138574 ) ) ( ON ?auto_138573 ?auto_138575 ) ( CLEAR ?auto_138573 ) ( HOLDING ?auto_138572 ) ( CLEAR ?auto_138571 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138567 ?auto_138568 ?auto_138569 ?auto_138570 ?auto_138571 ?auto_138572 ?auto_138573 )
      ( MAKE-6PILE ?auto_138567 ?auto_138568 ?auto_138569 ?auto_138570 ?auto_138571 ?auto_138572 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138576 - BLOCK
      ?auto_138577 - BLOCK
      ?auto_138578 - BLOCK
      ?auto_138579 - BLOCK
      ?auto_138580 - BLOCK
      ?auto_138581 - BLOCK
    )
    :vars
    (
      ?auto_138582 - BLOCK
      ?auto_138584 - BLOCK
      ?auto_138583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138576 ) ( ON ?auto_138577 ?auto_138576 ) ( ON ?auto_138578 ?auto_138577 ) ( ON ?auto_138579 ?auto_138578 ) ( ON ?auto_138580 ?auto_138579 ) ( not ( = ?auto_138576 ?auto_138577 ) ) ( not ( = ?auto_138576 ?auto_138578 ) ) ( not ( = ?auto_138576 ?auto_138579 ) ) ( not ( = ?auto_138576 ?auto_138580 ) ) ( not ( = ?auto_138576 ?auto_138581 ) ) ( not ( = ?auto_138576 ?auto_138582 ) ) ( not ( = ?auto_138577 ?auto_138578 ) ) ( not ( = ?auto_138577 ?auto_138579 ) ) ( not ( = ?auto_138577 ?auto_138580 ) ) ( not ( = ?auto_138577 ?auto_138581 ) ) ( not ( = ?auto_138577 ?auto_138582 ) ) ( not ( = ?auto_138578 ?auto_138579 ) ) ( not ( = ?auto_138578 ?auto_138580 ) ) ( not ( = ?auto_138578 ?auto_138581 ) ) ( not ( = ?auto_138578 ?auto_138582 ) ) ( not ( = ?auto_138579 ?auto_138580 ) ) ( not ( = ?auto_138579 ?auto_138581 ) ) ( not ( = ?auto_138579 ?auto_138582 ) ) ( not ( = ?auto_138580 ?auto_138581 ) ) ( not ( = ?auto_138580 ?auto_138582 ) ) ( not ( = ?auto_138581 ?auto_138582 ) ) ( not ( = ?auto_138576 ?auto_138584 ) ) ( not ( = ?auto_138577 ?auto_138584 ) ) ( not ( = ?auto_138578 ?auto_138584 ) ) ( not ( = ?auto_138579 ?auto_138584 ) ) ( not ( = ?auto_138580 ?auto_138584 ) ) ( not ( = ?auto_138581 ?auto_138584 ) ) ( not ( = ?auto_138582 ?auto_138584 ) ) ( ON ?auto_138584 ?auto_138583 ) ( not ( = ?auto_138576 ?auto_138583 ) ) ( not ( = ?auto_138577 ?auto_138583 ) ) ( not ( = ?auto_138578 ?auto_138583 ) ) ( not ( = ?auto_138579 ?auto_138583 ) ) ( not ( = ?auto_138580 ?auto_138583 ) ) ( not ( = ?auto_138581 ?auto_138583 ) ) ( not ( = ?auto_138582 ?auto_138583 ) ) ( not ( = ?auto_138584 ?auto_138583 ) ) ( ON ?auto_138582 ?auto_138584 ) ( CLEAR ?auto_138580 ) ( ON ?auto_138581 ?auto_138582 ) ( CLEAR ?auto_138581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138583 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138583 ?auto_138584 ?auto_138582 )
      ( MAKE-6PILE ?auto_138576 ?auto_138577 ?auto_138578 ?auto_138579 ?auto_138580 ?auto_138581 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138585 - BLOCK
      ?auto_138586 - BLOCK
      ?auto_138587 - BLOCK
      ?auto_138588 - BLOCK
      ?auto_138589 - BLOCK
      ?auto_138590 - BLOCK
    )
    :vars
    (
      ?auto_138592 - BLOCK
      ?auto_138591 - BLOCK
      ?auto_138593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138585 ) ( ON ?auto_138586 ?auto_138585 ) ( ON ?auto_138587 ?auto_138586 ) ( ON ?auto_138588 ?auto_138587 ) ( not ( = ?auto_138585 ?auto_138586 ) ) ( not ( = ?auto_138585 ?auto_138587 ) ) ( not ( = ?auto_138585 ?auto_138588 ) ) ( not ( = ?auto_138585 ?auto_138589 ) ) ( not ( = ?auto_138585 ?auto_138590 ) ) ( not ( = ?auto_138585 ?auto_138592 ) ) ( not ( = ?auto_138586 ?auto_138587 ) ) ( not ( = ?auto_138586 ?auto_138588 ) ) ( not ( = ?auto_138586 ?auto_138589 ) ) ( not ( = ?auto_138586 ?auto_138590 ) ) ( not ( = ?auto_138586 ?auto_138592 ) ) ( not ( = ?auto_138587 ?auto_138588 ) ) ( not ( = ?auto_138587 ?auto_138589 ) ) ( not ( = ?auto_138587 ?auto_138590 ) ) ( not ( = ?auto_138587 ?auto_138592 ) ) ( not ( = ?auto_138588 ?auto_138589 ) ) ( not ( = ?auto_138588 ?auto_138590 ) ) ( not ( = ?auto_138588 ?auto_138592 ) ) ( not ( = ?auto_138589 ?auto_138590 ) ) ( not ( = ?auto_138589 ?auto_138592 ) ) ( not ( = ?auto_138590 ?auto_138592 ) ) ( not ( = ?auto_138585 ?auto_138591 ) ) ( not ( = ?auto_138586 ?auto_138591 ) ) ( not ( = ?auto_138587 ?auto_138591 ) ) ( not ( = ?auto_138588 ?auto_138591 ) ) ( not ( = ?auto_138589 ?auto_138591 ) ) ( not ( = ?auto_138590 ?auto_138591 ) ) ( not ( = ?auto_138592 ?auto_138591 ) ) ( ON ?auto_138591 ?auto_138593 ) ( not ( = ?auto_138585 ?auto_138593 ) ) ( not ( = ?auto_138586 ?auto_138593 ) ) ( not ( = ?auto_138587 ?auto_138593 ) ) ( not ( = ?auto_138588 ?auto_138593 ) ) ( not ( = ?auto_138589 ?auto_138593 ) ) ( not ( = ?auto_138590 ?auto_138593 ) ) ( not ( = ?auto_138592 ?auto_138593 ) ) ( not ( = ?auto_138591 ?auto_138593 ) ) ( ON ?auto_138592 ?auto_138591 ) ( ON ?auto_138590 ?auto_138592 ) ( CLEAR ?auto_138590 ) ( ON-TABLE ?auto_138593 ) ( HOLDING ?auto_138589 ) ( CLEAR ?auto_138588 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138585 ?auto_138586 ?auto_138587 ?auto_138588 ?auto_138589 )
      ( MAKE-6PILE ?auto_138585 ?auto_138586 ?auto_138587 ?auto_138588 ?auto_138589 ?auto_138590 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138594 - BLOCK
      ?auto_138595 - BLOCK
      ?auto_138596 - BLOCK
      ?auto_138597 - BLOCK
      ?auto_138598 - BLOCK
      ?auto_138599 - BLOCK
    )
    :vars
    (
      ?auto_138600 - BLOCK
      ?auto_138601 - BLOCK
      ?auto_138602 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138594 ) ( ON ?auto_138595 ?auto_138594 ) ( ON ?auto_138596 ?auto_138595 ) ( ON ?auto_138597 ?auto_138596 ) ( not ( = ?auto_138594 ?auto_138595 ) ) ( not ( = ?auto_138594 ?auto_138596 ) ) ( not ( = ?auto_138594 ?auto_138597 ) ) ( not ( = ?auto_138594 ?auto_138598 ) ) ( not ( = ?auto_138594 ?auto_138599 ) ) ( not ( = ?auto_138594 ?auto_138600 ) ) ( not ( = ?auto_138595 ?auto_138596 ) ) ( not ( = ?auto_138595 ?auto_138597 ) ) ( not ( = ?auto_138595 ?auto_138598 ) ) ( not ( = ?auto_138595 ?auto_138599 ) ) ( not ( = ?auto_138595 ?auto_138600 ) ) ( not ( = ?auto_138596 ?auto_138597 ) ) ( not ( = ?auto_138596 ?auto_138598 ) ) ( not ( = ?auto_138596 ?auto_138599 ) ) ( not ( = ?auto_138596 ?auto_138600 ) ) ( not ( = ?auto_138597 ?auto_138598 ) ) ( not ( = ?auto_138597 ?auto_138599 ) ) ( not ( = ?auto_138597 ?auto_138600 ) ) ( not ( = ?auto_138598 ?auto_138599 ) ) ( not ( = ?auto_138598 ?auto_138600 ) ) ( not ( = ?auto_138599 ?auto_138600 ) ) ( not ( = ?auto_138594 ?auto_138601 ) ) ( not ( = ?auto_138595 ?auto_138601 ) ) ( not ( = ?auto_138596 ?auto_138601 ) ) ( not ( = ?auto_138597 ?auto_138601 ) ) ( not ( = ?auto_138598 ?auto_138601 ) ) ( not ( = ?auto_138599 ?auto_138601 ) ) ( not ( = ?auto_138600 ?auto_138601 ) ) ( ON ?auto_138601 ?auto_138602 ) ( not ( = ?auto_138594 ?auto_138602 ) ) ( not ( = ?auto_138595 ?auto_138602 ) ) ( not ( = ?auto_138596 ?auto_138602 ) ) ( not ( = ?auto_138597 ?auto_138602 ) ) ( not ( = ?auto_138598 ?auto_138602 ) ) ( not ( = ?auto_138599 ?auto_138602 ) ) ( not ( = ?auto_138600 ?auto_138602 ) ) ( not ( = ?auto_138601 ?auto_138602 ) ) ( ON ?auto_138600 ?auto_138601 ) ( ON ?auto_138599 ?auto_138600 ) ( ON-TABLE ?auto_138602 ) ( CLEAR ?auto_138597 ) ( ON ?auto_138598 ?auto_138599 ) ( CLEAR ?auto_138598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138602 ?auto_138601 ?auto_138600 ?auto_138599 )
      ( MAKE-6PILE ?auto_138594 ?auto_138595 ?auto_138596 ?auto_138597 ?auto_138598 ?auto_138599 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138603 - BLOCK
      ?auto_138604 - BLOCK
      ?auto_138605 - BLOCK
      ?auto_138606 - BLOCK
      ?auto_138607 - BLOCK
      ?auto_138608 - BLOCK
    )
    :vars
    (
      ?auto_138610 - BLOCK
      ?auto_138609 - BLOCK
      ?auto_138611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138603 ) ( ON ?auto_138604 ?auto_138603 ) ( ON ?auto_138605 ?auto_138604 ) ( not ( = ?auto_138603 ?auto_138604 ) ) ( not ( = ?auto_138603 ?auto_138605 ) ) ( not ( = ?auto_138603 ?auto_138606 ) ) ( not ( = ?auto_138603 ?auto_138607 ) ) ( not ( = ?auto_138603 ?auto_138608 ) ) ( not ( = ?auto_138603 ?auto_138610 ) ) ( not ( = ?auto_138604 ?auto_138605 ) ) ( not ( = ?auto_138604 ?auto_138606 ) ) ( not ( = ?auto_138604 ?auto_138607 ) ) ( not ( = ?auto_138604 ?auto_138608 ) ) ( not ( = ?auto_138604 ?auto_138610 ) ) ( not ( = ?auto_138605 ?auto_138606 ) ) ( not ( = ?auto_138605 ?auto_138607 ) ) ( not ( = ?auto_138605 ?auto_138608 ) ) ( not ( = ?auto_138605 ?auto_138610 ) ) ( not ( = ?auto_138606 ?auto_138607 ) ) ( not ( = ?auto_138606 ?auto_138608 ) ) ( not ( = ?auto_138606 ?auto_138610 ) ) ( not ( = ?auto_138607 ?auto_138608 ) ) ( not ( = ?auto_138607 ?auto_138610 ) ) ( not ( = ?auto_138608 ?auto_138610 ) ) ( not ( = ?auto_138603 ?auto_138609 ) ) ( not ( = ?auto_138604 ?auto_138609 ) ) ( not ( = ?auto_138605 ?auto_138609 ) ) ( not ( = ?auto_138606 ?auto_138609 ) ) ( not ( = ?auto_138607 ?auto_138609 ) ) ( not ( = ?auto_138608 ?auto_138609 ) ) ( not ( = ?auto_138610 ?auto_138609 ) ) ( ON ?auto_138609 ?auto_138611 ) ( not ( = ?auto_138603 ?auto_138611 ) ) ( not ( = ?auto_138604 ?auto_138611 ) ) ( not ( = ?auto_138605 ?auto_138611 ) ) ( not ( = ?auto_138606 ?auto_138611 ) ) ( not ( = ?auto_138607 ?auto_138611 ) ) ( not ( = ?auto_138608 ?auto_138611 ) ) ( not ( = ?auto_138610 ?auto_138611 ) ) ( not ( = ?auto_138609 ?auto_138611 ) ) ( ON ?auto_138610 ?auto_138609 ) ( ON ?auto_138608 ?auto_138610 ) ( ON-TABLE ?auto_138611 ) ( ON ?auto_138607 ?auto_138608 ) ( CLEAR ?auto_138607 ) ( HOLDING ?auto_138606 ) ( CLEAR ?auto_138605 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138603 ?auto_138604 ?auto_138605 ?auto_138606 )
      ( MAKE-6PILE ?auto_138603 ?auto_138604 ?auto_138605 ?auto_138606 ?auto_138607 ?auto_138608 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138612 - BLOCK
      ?auto_138613 - BLOCK
      ?auto_138614 - BLOCK
      ?auto_138615 - BLOCK
      ?auto_138616 - BLOCK
      ?auto_138617 - BLOCK
    )
    :vars
    (
      ?auto_138618 - BLOCK
      ?auto_138620 - BLOCK
      ?auto_138619 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138612 ) ( ON ?auto_138613 ?auto_138612 ) ( ON ?auto_138614 ?auto_138613 ) ( not ( = ?auto_138612 ?auto_138613 ) ) ( not ( = ?auto_138612 ?auto_138614 ) ) ( not ( = ?auto_138612 ?auto_138615 ) ) ( not ( = ?auto_138612 ?auto_138616 ) ) ( not ( = ?auto_138612 ?auto_138617 ) ) ( not ( = ?auto_138612 ?auto_138618 ) ) ( not ( = ?auto_138613 ?auto_138614 ) ) ( not ( = ?auto_138613 ?auto_138615 ) ) ( not ( = ?auto_138613 ?auto_138616 ) ) ( not ( = ?auto_138613 ?auto_138617 ) ) ( not ( = ?auto_138613 ?auto_138618 ) ) ( not ( = ?auto_138614 ?auto_138615 ) ) ( not ( = ?auto_138614 ?auto_138616 ) ) ( not ( = ?auto_138614 ?auto_138617 ) ) ( not ( = ?auto_138614 ?auto_138618 ) ) ( not ( = ?auto_138615 ?auto_138616 ) ) ( not ( = ?auto_138615 ?auto_138617 ) ) ( not ( = ?auto_138615 ?auto_138618 ) ) ( not ( = ?auto_138616 ?auto_138617 ) ) ( not ( = ?auto_138616 ?auto_138618 ) ) ( not ( = ?auto_138617 ?auto_138618 ) ) ( not ( = ?auto_138612 ?auto_138620 ) ) ( not ( = ?auto_138613 ?auto_138620 ) ) ( not ( = ?auto_138614 ?auto_138620 ) ) ( not ( = ?auto_138615 ?auto_138620 ) ) ( not ( = ?auto_138616 ?auto_138620 ) ) ( not ( = ?auto_138617 ?auto_138620 ) ) ( not ( = ?auto_138618 ?auto_138620 ) ) ( ON ?auto_138620 ?auto_138619 ) ( not ( = ?auto_138612 ?auto_138619 ) ) ( not ( = ?auto_138613 ?auto_138619 ) ) ( not ( = ?auto_138614 ?auto_138619 ) ) ( not ( = ?auto_138615 ?auto_138619 ) ) ( not ( = ?auto_138616 ?auto_138619 ) ) ( not ( = ?auto_138617 ?auto_138619 ) ) ( not ( = ?auto_138618 ?auto_138619 ) ) ( not ( = ?auto_138620 ?auto_138619 ) ) ( ON ?auto_138618 ?auto_138620 ) ( ON ?auto_138617 ?auto_138618 ) ( ON-TABLE ?auto_138619 ) ( ON ?auto_138616 ?auto_138617 ) ( CLEAR ?auto_138614 ) ( ON ?auto_138615 ?auto_138616 ) ( CLEAR ?auto_138615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138619 ?auto_138620 ?auto_138618 ?auto_138617 ?auto_138616 )
      ( MAKE-6PILE ?auto_138612 ?auto_138613 ?auto_138614 ?auto_138615 ?auto_138616 ?auto_138617 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138621 - BLOCK
      ?auto_138622 - BLOCK
      ?auto_138623 - BLOCK
      ?auto_138624 - BLOCK
      ?auto_138625 - BLOCK
      ?auto_138626 - BLOCK
    )
    :vars
    (
      ?auto_138627 - BLOCK
      ?auto_138629 - BLOCK
      ?auto_138628 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138621 ) ( ON ?auto_138622 ?auto_138621 ) ( not ( = ?auto_138621 ?auto_138622 ) ) ( not ( = ?auto_138621 ?auto_138623 ) ) ( not ( = ?auto_138621 ?auto_138624 ) ) ( not ( = ?auto_138621 ?auto_138625 ) ) ( not ( = ?auto_138621 ?auto_138626 ) ) ( not ( = ?auto_138621 ?auto_138627 ) ) ( not ( = ?auto_138622 ?auto_138623 ) ) ( not ( = ?auto_138622 ?auto_138624 ) ) ( not ( = ?auto_138622 ?auto_138625 ) ) ( not ( = ?auto_138622 ?auto_138626 ) ) ( not ( = ?auto_138622 ?auto_138627 ) ) ( not ( = ?auto_138623 ?auto_138624 ) ) ( not ( = ?auto_138623 ?auto_138625 ) ) ( not ( = ?auto_138623 ?auto_138626 ) ) ( not ( = ?auto_138623 ?auto_138627 ) ) ( not ( = ?auto_138624 ?auto_138625 ) ) ( not ( = ?auto_138624 ?auto_138626 ) ) ( not ( = ?auto_138624 ?auto_138627 ) ) ( not ( = ?auto_138625 ?auto_138626 ) ) ( not ( = ?auto_138625 ?auto_138627 ) ) ( not ( = ?auto_138626 ?auto_138627 ) ) ( not ( = ?auto_138621 ?auto_138629 ) ) ( not ( = ?auto_138622 ?auto_138629 ) ) ( not ( = ?auto_138623 ?auto_138629 ) ) ( not ( = ?auto_138624 ?auto_138629 ) ) ( not ( = ?auto_138625 ?auto_138629 ) ) ( not ( = ?auto_138626 ?auto_138629 ) ) ( not ( = ?auto_138627 ?auto_138629 ) ) ( ON ?auto_138629 ?auto_138628 ) ( not ( = ?auto_138621 ?auto_138628 ) ) ( not ( = ?auto_138622 ?auto_138628 ) ) ( not ( = ?auto_138623 ?auto_138628 ) ) ( not ( = ?auto_138624 ?auto_138628 ) ) ( not ( = ?auto_138625 ?auto_138628 ) ) ( not ( = ?auto_138626 ?auto_138628 ) ) ( not ( = ?auto_138627 ?auto_138628 ) ) ( not ( = ?auto_138629 ?auto_138628 ) ) ( ON ?auto_138627 ?auto_138629 ) ( ON ?auto_138626 ?auto_138627 ) ( ON-TABLE ?auto_138628 ) ( ON ?auto_138625 ?auto_138626 ) ( ON ?auto_138624 ?auto_138625 ) ( CLEAR ?auto_138624 ) ( HOLDING ?auto_138623 ) ( CLEAR ?auto_138622 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138621 ?auto_138622 ?auto_138623 )
      ( MAKE-6PILE ?auto_138621 ?auto_138622 ?auto_138623 ?auto_138624 ?auto_138625 ?auto_138626 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138630 - BLOCK
      ?auto_138631 - BLOCK
      ?auto_138632 - BLOCK
      ?auto_138633 - BLOCK
      ?auto_138634 - BLOCK
      ?auto_138635 - BLOCK
    )
    :vars
    (
      ?auto_138636 - BLOCK
      ?auto_138637 - BLOCK
      ?auto_138638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138630 ) ( ON ?auto_138631 ?auto_138630 ) ( not ( = ?auto_138630 ?auto_138631 ) ) ( not ( = ?auto_138630 ?auto_138632 ) ) ( not ( = ?auto_138630 ?auto_138633 ) ) ( not ( = ?auto_138630 ?auto_138634 ) ) ( not ( = ?auto_138630 ?auto_138635 ) ) ( not ( = ?auto_138630 ?auto_138636 ) ) ( not ( = ?auto_138631 ?auto_138632 ) ) ( not ( = ?auto_138631 ?auto_138633 ) ) ( not ( = ?auto_138631 ?auto_138634 ) ) ( not ( = ?auto_138631 ?auto_138635 ) ) ( not ( = ?auto_138631 ?auto_138636 ) ) ( not ( = ?auto_138632 ?auto_138633 ) ) ( not ( = ?auto_138632 ?auto_138634 ) ) ( not ( = ?auto_138632 ?auto_138635 ) ) ( not ( = ?auto_138632 ?auto_138636 ) ) ( not ( = ?auto_138633 ?auto_138634 ) ) ( not ( = ?auto_138633 ?auto_138635 ) ) ( not ( = ?auto_138633 ?auto_138636 ) ) ( not ( = ?auto_138634 ?auto_138635 ) ) ( not ( = ?auto_138634 ?auto_138636 ) ) ( not ( = ?auto_138635 ?auto_138636 ) ) ( not ( = ?auto_138630 ?auto_138637 ) ) ( not ( = ?auto_138631 ?auto_138637 ) ) ( not ( = ?auto_138632 ?auto_138637 ) ) ( not ( = ?auto_138633 ?auto_138637 ) ) ( not ( = ?auto_138634 ?auto_138637 ) ) ( not ( = ?auto_138635 ?auto_138637 ) ) ( not ( = ?auto_138636 ?auto_138637 ) ) ( ON ?auto_138637 ?auto_138638 ) ( not ( = ?auto_138630 ?auto_138638 ) ) ( not ( = ?auto_138631 ?auto_138638 ) ) ( not ( = ?auto_138632 ?auto_138638 ) ) ( not ( = ?auto_138633 ?auto_138638 ) ) ( not ( = ?auto_138634 ?auto_138638 ) ) ( not ( = ?auto_138635 ?auto_138638 ) ) ( not ( = ?auto_138636 ?auto_138638 ) ) ( not ( = ?auto_138637 ?auto_138638 ) ) ( ON ?auto_138636 ?auto_138637 ) ( ON ?auto_138635 ?auto_138636 ) ( ON-TABLE ?auto_138638 ) ( ON ?auto_138634 ?auto_138635 ) ( ON ?auto_138633 ?auto_138634 ) ( CLEAR ?auto_138631 ) ( ON ?auto_138632 ?auto_138633 ) ( CLEAR ?auto_138632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138638 ?auto_138637 ?auto_138636 ?auto_138635 ?auto_138634 ?auto_138633 )
      ( MAKE-6PILE ?auto_138630 ?auto_138631 ?auto_138632 ?auto_138633 ?auto_138634 ?auto_138635 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138639 - BLOCK
      ?auto_138640 - BLOCK
      ?auto_138641 - BLOCK
      ?auto_138642 - BLOCK
      ?auto_138643 - BLOCK
      ?auto_138644 - BLOCK
    )
    :vars
    (
      ?auto_138645 - BLOCK
      ?auto_138646 - BLOCK
      ?auto_138647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138639 ) ( not ( = ?auto_138639 ?auto_138640 ) ) ( not ( = ?auto_138639 ?auto_138641 ) ) ( not ( = ?auto_138639 ?auto_138642 ) ) ( not ( = ?auto_138639 ?auto_138643 ) ) ( not ( = ?auto_138639 ?auto_138644 ) ) ( not ( = ?auto_138639 ?auto_138645 ) ) ( not ( = ?auto_138640 ?auto_138641 ) ) ( not ( = ?auto_138640 ?auto_138642 ) ) ( not ( = ?auto_138640 ?auto_138643 ) ) ( not ( = ?auto_138640 ?auto_138644 ) ) ( not ( = ?auto_138640 ?auto_138645 ) ) ( not ( = ?auto_138641 ?auto_138642 ) ) ( not ( = ?auto_138641 ?auto_138643 ) ) ( not ( = ?auto_138641 ?auto_138644 ) ) ( not ( = ?auto_138641 ?auto_138645 ) ) ( not ( = ?auto_138642 ?auto_138643 ) ) ( not ( = ?auto_138642 ?auto_138644 ) ) ( not ( = ?auto_138642 ?auto_138645 ) ) ( not ( = ?auto_138643 ?auto_138644 ) ) ( not ( = ?auto_138643 ?auto_138645 ) ) ( not ( = ?auto_138644 ?auto_138645 ) ) ( not ( = ?auto_138639 ?auto_138646 ) ) ( not ( = ?auto_138640 ?auto_138646 ) ) ( not ( = ?auto_138641 ?auto_138646 ) ) ( not ( = ?auto_138642 ?auto_138646 ) ) ( not ( = ?auto_138643 ?auto_138646 ) ) ( not ( = ?auto_138644 ?auto_138646 ) ) ( not ( = ?auto_138645 ?auto_138646 ) ) ( ON ?auto_138646 ?auto_138647 ) ( not ( = ?auto_138639 ?auto_138647 ) ) ( not ( = ?auto_138640 ?auto_138647 ) ) ( not ( = ?auto_138641 ?auto_138647 ) ) ( not ( = ?auto_138642 ?auto_138647 ) ) ( not ( = ?auto_138643 ?auto_138647 ) ) ( not ( = ?auto_138644 ?auto_138647 ) ) ( not ( = ?auto_138645 ?auto_138647 ) ) ( not ( = ?auto_138646 ?auto_138647 ) ) ( ON ?auto_138645 ?auto_138646 ) ( ON ?auto_138644 ?auto_138645 ) ( ON-TABLE ?auto_138647 ) ( ON ?auto_138643 ?auto_138644 ) ( ON ?auto_138642 ?auto_138643 ) ( ON ?auto_138641 ?auto_138642 ) ( CLEAR ?auto_138641 ) ( HOLDING ?auto_138640 ) ( CLEAR ?auto_138639 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138639 ?auto_138640 )
      ( MAKE-6PILE ?auto_138639 ?auto_138640 ?auto_138641 ?auto_138642 ?auto_138643 ?auto_138644 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138648 - BLOCK
      ?auto_138649 - BLOCK
      ?auto_138650 - BLOCK
      ?auto_138651 - BLOCK
      ?auto_138652 - BLOCK
      ?auto_138653 - BLOCK
    )
    :vars
    (
      ?auto_138654 - BLOCK
      ?auto_138656 - BLOCK
      ?auto_138655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138648 ) ( not ( = ?auto_138648 ?auto_138649 ) ) ( not ( = ?auto_138648 ?auto_138650 ) ) ( not ( = ?auto_138648 ?auto_138651 ) ) ( not ( = ?auto_138648 ?auto_138652 ) ) ( not ( = ?auto_138648 ?auto_138653 ) ) ( not ( = ?auto_138648 ?auto_138654 ) ) ( not ( = ?auto_138649 ?auto_138650 ) ) ( not ( = ?auto_138649 ?auto_138651 ) ) ( not ( = ?auto_138649 ?auto_138652 ) ) ( not ( = ?auto_138649 ?auto_138653 ) ) ( not ( = ?auto_138649 ?auto_138654 ) ) ( not ( = ?auto_138650 ?auto_138651 ) ) ( not ( = ?auto_138650 ?auto_138652 ) ) ( not ( = ?auto_138650 ?auto_138653 ) ) ( not ( = ?auto_138650 ?auto_138654 ) ) ( not ( = ?auto_138651 ?auto_138652 ) ) ( not ( = ?auto_138651 ?auto_138653 ) ) ( not ( = ?auto_138651 ?auto_138654 ) ) ( not ( = ?auto_138652 ?auto_138653 ) ) ( not ( = ?auto_138652 ?auto_138654 ) ) ( not ( = ?auto_138653 ?auto_138654 ) ) ( not ( = ?auto_138648 ?auto_138656 ) ) ( not ( = ?auto_138649 ?auto_138656 ) ) ( not ( = ?auto_138650 ?auto_138656 ) ) ( not ( = ?auto_138651 ?auto_138656 ) ) ( not ( = ?auto_138652 ?auto_138656 ) ) ( not ( = ?auto_138653 ?auto_138656 ) ) ( not ( = ?auto_138654 ?auto_138656 ) ) ( ON ?auto_138656 ?auto_138655 ) ( not ( = ?auto_138648 ?auto_138655 ) ) ( not ( = ?auto_138649 ?auto_138655 ) ) ( not ( = ?auto_138650 ?auto_138655 ) ) ( not ( = ?auto_138651 ?auto_138655 ) ) ( not ( = ?auto_138652 ?auto_138655 ) ) ( not ( = ?auto_138653 ?auto_138655 ) ) ( not ( = ?auto_138654 ?auto_138655 ) ) ( not ( = ?auto_138656 ?auto_138655 ) ) ( ON ?auto_138654 ?auto_138656 ) ( ON ?auto_138653 ?auto_138654 ) ( ON-TABLE ?auto_138655 ) ( ON ?auto_138652 ?auto_138653 ) ( ON ?auto_138651 ?auto_138652 ) ( ON ?auto_138650 ?auto_138651 ) ( CLEAR ?auto_138648 ) ( ON ?auto_138649 ?auto_138650 ) ( CLEAR ?auto_138649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138655 ?auto_138656 ?auto_138654 ?auto_138653 ?auto_138652 ?auto_138651 ?auto_138650 )
      ( MAKE-6PILE ?auto_138648 ?auto_138649 ?auto_138650 ?auto_138651 ?auto_138652 ?auto_138653 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138657 - BLOCK
      ?auto_138658 - BLOCK
      ?auto_138659 - BLOCK
      ?auto_138660 - BLOCK
      ?auto_138661 - BLOCK
      ?auto_138662 - BLOCK
    )
    :vars
    (
      ?auto_138663 - BLOCK
      ?auto_138664 - BLOCK
      ?auto_138665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138657 ?auto_138658 ) ) ( not ( = ?auto_138657 ?auto_138659 ) ) ( not ( = ?auto_138657 ?auto_138660 ) ) ( not ( = ?auto_138657 ?auto_138661 ) ) ( not ( = ?auto_138657 ?auto_138662 ) ) ( not ( = ?auto_138657 ?auto_138663 ) ) ( not ( = ?auto_138658 ?auto_138659 ) ) ( not ( = ?auto_138658 ?auto_138660 ) ) ( not ( = ?auto_138658 ?auto_138661 ) ) ( not ( = ?auto_138658 ?auto_138662 ) ) ( not ( = ?auto_138658 ?auto_138663 ) ) ( not ( = ?auto_138659 ?auto_138660 ) ) ( not ( = ?auto_138659 ?auto_138661 ) ) ( not ( = ?auto_138659 ?auto_138662 ) ) ( not ( = ?auto_138659 ?auto_138663 ) ) ( not ( = ?auto_138660 ?auto_138661 ) ) ( not ( = ?auto_138660 ?auto_138662 ) ) ( not ( = ?auto_138660 ?auto_138663 ) ) ( not ( = ?auto_138661 ?auto_138662 ) ) ( not ( = ?auto_138661 ?auto_138663 ) ) ( not ( = ?auto_138662 ?auto_138663 ) ) ( not ( = ?auto_138657 ?auto_138664 ) ) ( not ( = ?auto_138658 ?auto_138664 ) ) ( not ( = ?auto_138659 ?auto_138664 ) ) ( not ( = ?auto_138660 ?auto_138664 ) ) ( not ( = ?auto_138661 ?auto_138664 ) ) ( not ( = ?auto_138662 ?auto_138664 ) ) ( not ( = ?auto_138663 ?auto_138664 ) ) ( ON ?auto_138664 ?auto_138665 ) ( not ( = ?auto_138657 ?auto_138665 ) ) ( not ( = ?auto_138658 ?auto_138665 ) ) ( not ( = ?auto_138659 ?auto_138665 ) ) ( not ( = ?auto_138660 ?auto_138665 ) ) ( not ( = ?auto_138661 ?auto_138665 ) ) ( not ( = ?auto_138662 ?auto_138665 ) ) ( not ( = ?auto_138663 ?auto_138665 ) ) ( not ( = ?auto_138664 ?auto_138665 ) ) ( ON ?auto_138663 ?auto_138664 ) ( ON ?auto_138662 ?auto_138663 ) ( ON-TABLE ?auto_138665 ) ( ON ?auto_138661 ?auto_138662 ) ( ON ?auto_138660 ?auto_138661 ) ( ON ?auto_138659 ?auto_138660 ) ( ON ?auto_138658 ?auto_138659 ) ( CLEAR ?auto_138658 ) ( HOLDING ?auto_138657 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138657 )
      ( MAKE-6PILE ?auto_138657 ?auto_138658 ?auto_138659 ?auto_138660 ?auto_138661 ?auto_138662 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_138666 - BLOCK
      ?auto_138667 - BLOCK
      ?auto_138668 - BLOCK
      ?auto_138669 - BLOCK
      ?auto_138670 - BLOCK
      ?auto_138671 - BLOCK
    )
    :vars
    (
      ?auto_138672 - BLOCK
      ?auto_138674 - BLOCK
      ?auto_138673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138666 ?auto_138667 ) ) ( not ( = ?auto_138666 ?auto_138668 ) ) ( not ( = ?auto_138666 ?auto_138669 ) ) ( not ( = ?auto_138666 ?auto_138670 ) ) ( not ( = ?auto_138666 ?auto_138671 ) ) ( not ( = ?auto_138666 ?auto_138672 ) ) ( not ( = ?auto_138667 ?auto_138668 ) ) ( not ( = ?auto_138667 ?auto_138669 ) ) ( not ( = ?auto_138667 ?auto_138670 ) ) ( not ( = ?auto_138667 ?auto_138671 ) ) ( not ( = ?auto_138667 ?auto_138672 ) ) ( not ( = ?auto_138668 ?auto_138669 ) ) ( not ( = ?auto_138668 ?auto_138670 ) ) ( not ( = ?auto_138668 ?auto_138671 ) ) ( not ( = ?auto_138668 ?auto_138672 ) ) ( not ( = ?auto_138669 ?auto_138670 ) ) ( not ( = ?auto_138669 ?auto_138671 ) ) ( not ( = ?auto_138669 ?auto_138672 ) ) ( not ( = ?auto_138670 ?auto_138671 ) ) ( not ( = ?auto_138670 ?auto_138672 ) ) ( not ( = ?auto_138671 ?auto_138672 ) ) ( not ( = ?auto_138666 ?auto_138674 ) ) ( not ( = ?auto_138667 ?auto_138674 ) ) ( not ( = ?auto_138668 ?auto_138674 ) ) ( not ( = ?auto_138669 ?auto_138674 ) ) ( not ( = ?auto_138670 ?auto_138674 ) ) ( not ( = ?auto_138671 ?auto_138674 ) ) ( not ( = ?auto_138672 ?auto_138674 ) ) ( ON ?auto_138674 ?auto_138673 ) ( not ( = ?auto_138666 ?auto_138673 ) ) ( not ( = ?auto_138667 ?auto_138673 ) ) ( not ( = ?auto_138668 ?auto_138673 ) ) ( not ( = ?auto_138669 ?auto_138673 ) ) ( not ( = ?auto_138670 ?auto_138673 ) ) ( not ( = ?auto_138671 ?auto_138673 ) ) ( not ( = ?auto_138672 ?auto_138673 ) ) ( not ( = ?auto_138674 ?auto_138673 ) ) ( ON ?auto_138672 ?auto_138674 ) ( ON ?auto_138671 ?auto_138672 ) ( ON-TABLE ?auto_138673 ) ( ON ?auto_138670 ?auto_138671 ) ( ON ?auto_138669 ?auto_138670 ) ( ON ?auto_138668 ?auto_138669 ) ( ON ?auto_138667 ?auto_138668 ) ( ON ?auto_138666 ?auto_138667 ) ( CLEAR ?auto_138666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138673 ?auto_138674 ?auto_138672 ?auto_138671 ?auto_138670 ?auto_138669 ?auto_138668 ?auto_138667 )
      ( MAKE-6PILE ?auto_138666 ?auto_138667 ?auto_138668 ?auto_138669 ?auto_138670 ?auto_138671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138677 - BLOCK
      ?auto_138678 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_138678 ) ( CLEAR ?auto_138677 ) ( ON-TABLE ?auto_138677 ) ( not ( = ?auto_138677 ?auto_138678 ) ) )
    :subtasks
    ( ( !STACK ?auto_138678 ?auto_138677 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138679 - BLOCK
      ?auto_138680 - BLOCK
    )
    :vars
    (
      ?auto_138681 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_138679 ) ( ON-TABLE ?auto_138679 ) ( not ( = ?auto_138679 ?auto_138680 ) ) ( ON ?auto_138680 ?auto_138681 ) ( CLEAR ?auto_138680 ) ( HAND-EMPTY ) ( not ( = ?auto_138679 ?auto_138681 ) ) ( not ( = ?auto_138680 ?auto_138681 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138680 ?auto_138681 )
      ( MAKE-2PILE ?auto_138679 ?auto_138680 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138682 - BLOCK
      ?auto_138683 - BLOCK
    )
    :vars
    (
      ?auto_138684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138682 ?auto_138683 ) ) ( ON ?auto_138683 ?auto_138684 ) ( CLEAR ?auto_138683 ) ( not ( = ?auto_138682 ?auto_138684 ) ) ( not ( = ?auto_138683 ?auto_138684 ) ) ( HOLDING ?auto_138682 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138682 )
      ( MAKE-2PILE ?auto_138682 ?auto_138683 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138685 - BLOCK
      ?auto_138686 - BLOCK
    )
    :vars
    (
      ?auto_138687 - BLOCK
      ?auto_138690 - BLOCK
      ?auto_138688 - BLOCK
      ?auto_138692 - BLOCK
      ?auto_138691 - BLOCK
      ?auto_138689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138685 ?auto_138686 ) ) ( ON ?auto_138686 ?auto_138687 ) ( not ( = ?auto_138685 ?auto_138687 ) ) ( not ( = ?auto_138686 ?auto_138687 ) ) ( ON ?auto_138685 ?auto_138686 ) ( CLEAR ?auto_138685 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138690 ) ( ON ?auto_138688 ?auto_138690 ) ( ON ?auto_138692 ?auto_138688 ) ( ON ?auto_138691 ?auto_138692 ) ( ON ?auto_138689 ?auto_138691 ) ( ON ?auto_138687 ?auto_138689 ) ( not ( = ?auto_138690 ?auto_138688 ) ) ( not ( = ?auto_138690 ?auto_138692 ) ) ( not ( = ?auto_138690 ?auto_138691 ) ) ( not ( = ?auto_138690 ?auto_138689 ) ) ( not ( = ?auto_138690 ?auto_138687 ) ) ( not ( = ?auto_138690 ?auto_138686 ) ) ( not ( = ?auto_138690 ?auto_138685 ) ) ( not ( = ?auto_138688 ?auto_138692 ) ) ( not ( = ?auto_138688 ?auto_138691 ) ) ( not ( = ?auto_138688 ?auto_138689 ) ) ( not ( = ?auto_138688 ?auto_138687 ) ) ( not ( = ?auto_138688 ?auto_138686 ) ) ( not ( = ?auto_138688 ?auto_138685 ) ) ( not ( = ?auto_138692 ?auto_138691 ) ) ( not ( = ?auto_138692 ?auto_138689 ) ) ( not ( = ?auto_138692 ?auto_138687 ) ) ( not ( = ?auto_138692 ?auto_138686 ) ) ( not ( = ?auto_138692 ?auto_138685 ) ) ( not ( = ?auto_138691 ?auto_138689 ) ) ( not ( = ?auto_138691 ?auto_138687 ) ) ( not ( = ?auto_138691 ?auto_138686 ) ) ( not ( = ?auto_138691 ?auto_138685 ) ) ( not ( = ?auto_138689 ?auto_138687 ) ) ( not ( = ?auto_138689 ?auto_138686 ) ) ( not ( = ?auto_138689 ?auto_138685 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138690 ?auto_138688 ?auto_138692 ?auto_138691 ?auto_138689 ?auto_138687 ?auto_138686 )
      ( MAKE-2PILE ?auto_138685 ?auto_138686 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138693 - BLOCK
      ?auto_138694 - BLOCK
    )
    :vars
    (
      ?auto_138696 - BLOCK
      ?auto_138697 - BLOCK
      ?auto_138695 - BLOCK
      ?auto_138698 - BLOCK
      ?auto_138699 - BLOCK
      ?auto_138700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138693 ?auto_138694 ) ) ( ON ?auto_138694 ?auto_138696 ) ( not ( = ?auto_138693 ?auto_138696 ) ) ( not ( = ?auto_138694 ?auto_138696 ) ) ( ON-TABLE ?auto_138697 ) ( ON ?auto_138695 ?auto_138697 ) ( ON ?auto_138698 ?auto_138695 ) ( ON ?auto_138699 ?auto_138698 ) ( ON ?auto_138700 ?auto_138699 ) ( ON ?auto_138696 ?auto_138700 ) ( not ( = ?auto_138697 ?auto_138695 ) ) ( not ( = ?auto_138697 ?auto_138698 ) ) ( not ( = ?auto_138697 ?auto_138699 ) ) ( not ( = ?auto_138697 ?auto_138700 ) ) ( not ( = ?auto_138697 ?auto_138696 ) ) ( not ( = ?auto_138697 ?auto_138694 ) ) ( not ( = ?auto_138697 ?auto_138693 ) ) ( not ( = ?auto_138695 ?auto_138698 ) ) ( not ( = ?auto_138695 ?auto_138699 ) ) ( not ( = ?auto_138695 ?auto_138700 ) ) ( not ( = ?auto_138695 ?auto_138696 ) ) ( not ( = ?auto_138695 ?auto_138694 ) ) ( not ( = ?auto_138695 ?auto_138693 ) ) ( not ( = ?auto_138698 ?auto_138699 ) ) ( not ( = ?auto_138698 ?auto_138700 ) ) ( not ( = ?auto_138698 ?auto_138696 ) ) ( not ( = ?auto_138698 ?auto_138694 ) ) ( not ( = ?auto_138698 ?auto_138693 ) ) ( not ( = ?auto_138699 ?auto_138700 ) ) ( not ( = ?auto_138699 ?auto_138696 ) ) ( not ( = ?auto_138699 ?auto_138694 ) ) ( not ( = ?auto_138699 ?auto_138693 ) ) ( not ( = ?auto_138700 ?auto_138696 ) ) ( not ( = ?auto_138700 ?auto_138694 ) ) ( not ( = ?auto_138700 ?auto_138693 ) ) ( HOLDING ?auto_138693 ) ( CLEAR ?auto_138694 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138697 ?auto_138695 ?auto_138698 ?auto_138699 ?auto_138700 ?auto_138696 ?auto_138694 ?auto_138693 )
      ( MAKE-2PILE ?auto_138693 ?auto_138694 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138701 - BLOCK
      ?auto_138702 - BLOCK
    )
    :vars
    (
      ?auto_138704 - BLOCK
      ?auto_138705 - BLOCK
      ?auto_138707 - BLOCK
      ?auto_138703 - BLOCK
      ?auto_138706 - BLOCK
      ?auto_138708 - BLOCK
      ?auto_138709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138701 ?auto_138702 ) ) ( ON ?auto_138702 ?auto_138704 ) ( not ( = ?auto_138701 ?auto_138704 ) ) ( not ( = ?auto_138702 ?auto_138704 ) ) ( ON-TABLE ?auto_138705 ) ( ON ?auto_138707 ?auto_138705 ) ( ON ?auto_138703 ?auto_138707 ) ( ON ?auto_138706 ?auto_138703 ) ( ON ?auto_138708 ?auto_138706 ) ( ON ?auto_138704 ?auto_138708 ) ( not ( = ?auto_138705 ?auto_138707 ) ) ( not ( = ?auto_138705 ?auto_138703 ) ) ( not ( = ?auto_138705 ?auto_138706 ) ) ( not ( = ?auto_138705 ?auto_138708 ) ) ( not ( = ?auto_138705 ?auto_138704 ) ) ( not ( = ?auto_138705 ?auto_138702 ) ) ( not ( = ?auto_138705 ?auto_138701 ) ) ( not ( = ?auto_138707 ?auto_138703 ) ) ( not ( = ?auto_138707 ?auto_138706 ) ) ( not ( = ?auto_138707 ?auto_138708 ) ) ( not ( = ?auto_138707 ?auto_138704 ) ) ( not ( = ?auto_138707 ?auto_138702 ) ) ( not ( = ?auto_138707 ?auto_138701 ) ) ( not ( = ?auto_138703 ?auto_138706 ) ) ( not ( = ?auto_138703 ?auto_138708 ) ) ( not ( = ?auto_138703 ?auto_138704 ) ) ( not ( = ?auto_138703 ?auto_138702 ) ) ( not ( = ?auto_138703 ?auto_138701 ) ) ( not ( = ?auto_138706 ?auto_138708 ) ) ( not ( = ?auto_138706 ?auto_138704 ) ) ( not ( = ?auto_138706 ?auto_138702 ) ) ( not ( = ?auto_138706 ?auto_138701 ) ) ( not ( = ?auto_138708 ?auto_138704 ) ) ( not ( = ?auto_138708 ?auto_138702 ) ) ( not ( = ?auto_138708 ?auto_138701 ) ) ( CLEAR ?auto_138702 ) ( ON ?auto_138701 ?auto_138709 ) ( CLEAR ?auto_138701 ) ( HAND-EMPTY ) ( not ( = ?auto_138701 ?auto_138709 ) ) ( not ( = ?auto_138702 ?auto_138709 ) ) ( not ( = ?auto_138704 ?auto_138709 ) ) ( not ( = ?auto_138705 ?auto_138709 ) ) ( not ( = ?auto_138707 ?auto_138709 ) ) ( not ( = ?auto_138703 ?auto_138709 ) ) ( not ( = ?auto_138706 ?auto_138709 ) ) ( not ( = ?auto_138708 ?auto_138709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138701 ?auto_138709 )
      ( MAKE-2PILE ?auto_138701 ?auto_138702 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138710 - BLOCK
      ?auto_138711 - BLOCK
    )
    :vars
    (
      ?auto_138713 - BLOCK
      ?auto_138715 - BLOCK
      ?auto_138717 - BLOCK
      ?auto_138718 - BLOCK
      ?auto_138716 - BLOCK
      ?auto_138714 - BLOCK
      ?auto_138712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138710 ?auto_138711 ) ) ( not ( = ?auto_138710 ?auto_138713 ) ) ( not ( = ?auto_138711 ?auto_138713 ) ) ( ON-TABLE ?auto_138715 ) ( ON ?auto_138717 ?auto_138715 ) ( ON ?auto_138718 ?auto_138717 ) ( ON ?auto_138716 ?auto_138718 ) ( ON ?auto_138714 ?auto_138716 ) ( ON ?auto_138713 ?auto_138714 ) ( not ( = ?auto_138715 ?auto_138717 ) ) ( not ( = ?auto_138715 ?auto_138718 ) ) ( not ( = ?auto_138715 ?auto_138716 ) ) ( not ( = ?auto_138715 ?auto_138714 ) ) ( not ( = ?auto_138715 ?auto_138713 ) ) ( not ( = ?auto_138715 ?auto_138711 ) ) ( not ( = ?auto_138715 ?auto_138710 ) ) ( not ( = ?auto_138717 ?auto_138718 ) ) ( not ( = ?auto_138717 ?auto_138716 ) ) ( not ( = ?auto_138717 ?auto_138714 ) ) ( not ( = ?auto_138717 ?auto_138713 ) ) ( not ( = ?auto_138717 ?auto_138711 ) ) ( not ( = ?auto_138717 ?auto_138710 ) ) ( not ( = ?auto_138718 ?auto_138716 ) ) ( not ( = ?auto_138718 ?auto_138714 ) ) ( not ( = ?auto_138718 ?auto_138713 ) ) ( not ( = ?auto_138718 ?auto_138711 ) ) ( not ( = ?auto_138718 ?auto_138710 ) ) ( not ( = ?auto_138716 ?auto_138714 ) ) ( not ( = ?auto_138716 ?auto_138713 ) ) ( not ( = ?auto_138716 ?auto_138711 ) ) ( not ( = ?auto_138716 ?auto_138710 ) ) ( not ( = ?auto_138714 ?auto_138713 ) ) ( not ( = ?auto_138714 ?auto_138711 ) ) ( not ( = ?auto_138714 ?auto_138710 ) ) ( ON ?auto_138710 ?auto_138712 ) ( CLEAR ?auto_138710 ) ( not ( = ?auto_138710 ?auto_138712 ) ) ( not ( = ?auto_138711 ?auto_138712 ) ) ( not ( = ?auto_138713 ?auto_138712 ) ) ( not ( = ?auto_138715 ?auto_138712 ) ) ( not ( = ?auto_138717 ?auto_138712 ) ) ( not ( = ?auto_138718 ?auto_138712 ) ) ( not ( = ?auto_138716 ?auto_138712 ) ) ( not ( = ?auto_138714 ?auto_138712 ) ) ( HOLDING ?auto_138711 ) ( CLEAR ?auto_138713 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138715 ?auto_138717 ?auto_138718 ?auto_138716 ?auto_138714 ?auto_138713 ?auto_138711 )
      ( MAKE-2PILE ?auto_138710 ?auto_138711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138719 - BLOCK
      ?auto_138720 - BLOCK
    )
    :vars
    (
      ?auto_138721 - BLOCK
      ?auto_138723 - BLOCK
      ?auto_138726 - BLOCK
      ?auto_138727 - BLOCK
      ?auto_138724 - BLOCK
      ?auto_138725 - BLOCK
      ?auto_138722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138719 ?auto_138720 ) ) ( not ( = ?auto_138719 ?auto_138721 ) ) ( not ( = ?auto_138720 ?auto_138721 ) ) ( ON-TABLE ?auto_138723 ) ( ON ?auto_138726 ?auto_138723 ) ( ON ?auto_138727 ?auto_138726 ) ( ON ?auto_138724 ?auto_138727 ) ( ON ?auto_138725 ?auto_138724 ) ( ON ?auto_138721 ?auto_138725 ) ( not ( = ?auto_138723 ?auto_138726 ) ) ( not ( = ?auto_138723 ?auto_138727 ) ) ( not ( = ?auto_138723 ?auto_138724 ) ) ( not ( = ?auto_138723 ?auto_138725 ) ) ( not ( = ?auto_138723 ?auto_138721 ) ) ( not ( = ?auto_138723 ?auto_138720 ) ) ( not ( = ?auto_138723 ?auto_138719 ) ) ( not ( = ?auto_138726 ?auto_138727 ) ) ( not ( = ?auto_138726 ?auto_138724 ) ) ( not ( = ?auto_138726 ?auto_138725 ) ) ( not ( = ?auto_138726 ?auto_138721 ) ) ( not ( = ?auto_138726 ?auto_138720 ) ) ( not ( = ?auto_138726 ?auto_138719 ) ) ( not ( = ?auto_138727 ?auto_138724 ) ) ( not ( = ?auto_138727 ?auto_138725 ) ) ( not ( = ?auto_138727 ?auto_138721 ) ) ( not ( = ?auto_138727 ?auto_138720 ) ) ( not ( = ?auto_138727 ?auto_138719 ) ) ( not ( = ?auto_138724 ?auto_138725 ) ) ( not ( = ?auto_138724 ?auto_138721 ) ) ( not ( = ?auto_138724 ?auto_138720 ) ) ( not ( = ?auto_138724 ?auto_138719 ) ) ( not ( = ?auto_138725 ?auto_138721 ) ) ( not ( = ?auto_138725 ?auto_138720 ) ) ( not ( = ?auto_138725 ?auto_138719 ) ) ( ON ?auto_138719 ?auto_138722 ) ( not ( = ?auto_138719 ?auto_138722 ) ) ( not ( = ?auto_138720 ?auto_138722 ) ) ( not ( = ?auto_138721 ?auto_138722 ) ) ( not ( = ?auto_138723 ?auto_138722 ) ) ( not ( = ?auto_138726 ?auto_138722 ) ) ( not ( = ?auto_138727 ?auto_138722 ) ) ( not ( = ?auto_138724 ?auto_138722 ) ) ( not ( = ?auto_138725 ?auto_138722 ) ) ( CLEAR ?auto_138721 ) ( ON ?auto_138720 ?auto_138719 ) ( CLEAR ?auto_138720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138722 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138722 ?auto_138719 )
      ( MAKE-2PILE ?auto_138719 ?auto_138720 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138728 - BLOCK
      ?auto_138729 - BLOCK
    )
    :vars
    (
      ?auto_138734 - BLOCK
      ?auto_138736 - BLOCK
      ?auto_138733 - BLOCK
      ?auto_138731 - BLOCK
      ?auto_138730 - BLOCK
      ?auto_138735 - BLOCK
      ?auto_138732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138728 ?auto_138729 ) ) ( not ( = ?auto_138728 ?auto_138734 ) ) ( not ( = ?auto_138729 ?auto_138734 ) ) ( ON-TABLE ?auto_138736 ) ( ON ?auto_138733 ?auto_138736 ) ( ON ?auto_138731 ?auto_138733 ) ( ON ?auto_138730 ?auto_138731 ) ( ON ?auto_138735 ?auto_138730 ) ( not ( = ?auto_138736 ?auto_138733 ) ) ( not ( = ?auto_138736 ?auto_138731 ) ) ( not ( = ?auto_138736 ?auto_138730 ) ) ( not ( = ?auto_138736 ?auto_138735 ) ) ( not ( = ?auto_138736 ?auto_138734 ) ) ( not ( = ?auto_138736 ?auto_138729 ) ) ( not ( = ?auto_138736 ?auto_138728 ) ) ( not ( = ?auto_138733 ?auto_138731 ) ) ( not ( = ?auto_138733 ?auto_138730 ) ) ( not ( = ?auto_138733 ?auto_138735 ) ) ( not ( = ?auto_138733 ?auto_138734 ) ) ( not ( = ?auto_138733 ?auto_138729 ) ) ( not ( = ?auto_138733 ?auto_138728 ) ) ( not ( = ?auto_138731 ?auto_138730 ) ) ( not ( = ?auto_138731 ?auto_138735 ) ) ( not ( = ?auto_138731 ?auto_138734 ) ) ( not ( = ?auto_138731 ?auto_138729 ) ) ( not ( = ?auto_138731 ?auto_138728 ) ) ( not ( = ?auto_138730 ?auto_138735 ) ) ( not ( = ?auto_138730 ?auto_138734 ) ) ( not ( = ?auto_138730 ?auto_138729 ) ) ( not ( = ?auto_138730 ?auto_138728 ) ) ( not ( = ?auto_138735 ?auto_138734 ) ) ( not ( = ?auto_138735 ?auto_138729 ) ) ( not ( = ?auto_138735 ?auto_138728 ) ) ( ON ?auto_138728 ?auto_138732 ) ( not ( = ?auto_138728 ?auto_138732 ) ) ( not ( = ?auto_138729 ?auto_138732 ) ) ( not ( = ?auto_138734 ?auto_138732 ) ) ( not ( = ?auto_138736 ?auto_138732 ) ) ( not ( = ?auto_138733 ?auto_138732 ) ) ( not ( = ?auto_138731 ?auto_138732 ) ) ( not ( = ?auto_138730 ?auto_138732 ) ) ( not ( = ?auto_138735 ?auto_138732 ) ) ( ON ?auto_138729 ?auto_138728 ) ( CLEAR ?auto_138729 ) ( ON-TABLE ?auto_138732 ) ( HOLDING ?auto_138734 ) ( CLEAR ?auto_138735 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138736 ?auto_138733 ?auto_138731 ?auto_138730 ?auto_138735 ?auto_138734 )
      ( MAKE-2PILE ?auto_138728 ?auto_138729 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138737 - BLOCK
      ?auto_138738 - BLOCK
    )
    :vars
    (
      ?auto_138743 - BLOCK
      ?auto_138741 - BLOCK
      ?auto_138744 - BLOCK
      ?auto_138739 - BLOCK
      ?auto_138740 - BLOCK
      ?auto_138742 - BLOCK
      ?auto_138745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138737 ?auto_138738 ) ) ( not ( = ?auto_138737 ?auto_138743 ) ) ( not ( = ?auto_138738 ?auto_138743 ) ) ( ON-TABLE ?auto_138741 ) ( ON ?auto_138744 ?auto_138741 ) ( ON ?auto_138739 ?auto_138744 ) ( ON ?auto_138740 ?auto_138739 ) ( ON ?auto_138742 ?auto_138740 ) ( not ( = ?auto_138741 ?auto_138744 ) ) ( not ( = ?auto_138741 ?auto_138739 ) ) ( not ( = ?auto_138741 ?auto_138740 ) ) ( not ( = ?auto_138741 ?auto_138742 ) ) ( not ( = ?auto_138741 ?auto_138743 ) ) ( not ( = ?auto_138741 ?auto_138738 ) ) ( not ( = ?auto_138741 ?auto_138737 ) ) ( not ( = ?auto_138744 ?auto_138739 ) ) ( not ( = ?auto_138744 ?auto_138740 ) ) ( not ( = ?auto_138744 ?auto_138742 ) ) ( not ( = ?auto_138744 ?auto_138743 ) ) ( not ( = ?auto_138744 ?auto_138738 ) ) ( not ( = ?auto_138744 ?auto_138737 ) ) ( not ( = ?auto_138739 ?auto_138740 ) ) ( not ( = ?auto_138739 ?auto_138742 ) ) ( not ( = ?auto_138739 ?auto_138743 ) ) ( not ( = ?auto_138739 ?auto_138738 ) ) ( not ( = ?auto_138739 ?auto_138737 ) ) ( not ( = ?auto_138740 ?auto_138742 ) ) ( not ( = ?auto_138740 ?auto_138743 ) ) ( not ( = ?auto_138740 ?auto_138738 ) ) ( not ( = ?auto_138740 ?auto_138737 ) ) ( not ( = ?auto_138742 ?auto_138743 ) ) ( not ( = ?auto_138742 ?auto_138738 ) ) ( not ( = ?auto_138742 ?auto_138737 ) ) ( ON ?auto_138737 ?auto_138745 ) ( not ( = ?auto_138737 ?auto_138745 ) ) ( not ( = ?auto_138738 ?auto_138745 ) ) ( not ( = ?auto_138743 ?auto_138745 ) ) ( not ( = ?auto_138741 ?auto_138745 ) ) ( not ( = ?auto_138744 ?auto_138745 ) ) ( not ( = ?auto_138739 ?auto_138745 ) ) ( not ( = ?auto_138740 ?auto_138745 ) ) ( not ( = ?auto_138742 ?auto_138745 ) ) ( ON ?auto_138738 ?auto_138737 ) ( ON-TABLE ?auto_138745 ) ( CLEAR ?auto_138742 ) ( ON ?auto_138743 ?auto_138738 ) ( CLEAR ?auto_138743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138745 ?auto_138737 ?auto_138738 )
      ( MAKE-2PILE ?auto_138737 ?auto_138738 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138746 - BLOCK
      ?auto_138747 - BLOCK
    )
    :vars
    (
      ?auto_138753 - BLOCK
      ?auto_138748 - BLOCK
      ?auto_138751 - BLOCK
      ?auto_138752 - BLOCK
      ?auto_138750 - BLOCK
      ?auto_138749 - BLOCK
      ?auto_138754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138746 ?auto_138747 ) ) ( not ( = ?auto_138746 ?auto_138753 ) ) ( not ( = ?auto_138747 ?auto_138753 ) ) ( ON-TABLE ?auto_138748 ) ( ON ?auto_138751 ?auto_138748 ) ( ON ?auto_138752 ?auto_138751 ) ( ON ?auto_138750 ?auto_138752 ) ( not ( = ?auto_138748 ?auto_138751 ) ) ( not ( = ?auto_138748 ?auto_138752 ) ) ( not ( = ?auto_138748 ?auto_138750 ) ) ( not ( = ?auto_138748 ?auto_138749 ) ) ( not ( = ?auto_138748 ?auto_138753 ) ) ( not ( = ?auto_138748 ?auto_138747 ) ) ( not ( = ?auto_138748 ?auto_138746 ) ) ( not ( = ?auto_138751 ?auto_138752 ) ) ( not ( = ?auto_138751 ?auto_138750 ) ) ( not ( = ?auto_138751 ?auto_138749 ) ) ( not ( = ?auto_138751 ?auto_138753 ) ) ( not ( = ?auto_138751 ?auto_138747 ) ) ( not ( = ?auto_138751 ?auto_138746 ) ) ( not ( = ?auto_138752 ?auto_138750 ) ) ( not ( = ?auto_138752 ?auto_138749 ) ) ( not ( = ?auto_138752 ?auto_138753 ) ) ( not ( = ?auto_138752 ?auto_138747 ) ) ( not ( = ?auto_138752 ?auto_138746 ) ) ( not ( = ?auto_138750 ?auto_138749 ) ) ( not ( = ?auto_138750 ?auto_138753 ) ) ( not ( = ?auto_138750 ?auto_138747 ) ) ( not ( = ?auto_138750 ?auto_138746 ) ) ( not ( = ?auto_138749 ?auto_138753 ) ) ( not ( = ?auto_138749 ?auto_138747 ) ) ( not ( = ?auto_138749 ?auto_138746 ) ) ( ON ?auto_138746 ?auto_138754 ) ( not ( = ?auto_138746 ?auto_138754 ) ) ( not ( = ?auto_138747 ?auto_138754 ) ) ( not ( = ?auto_138753 ?auto_138754 ) ) ( not ( = ?auto_138748 ?auto_138754 ) ) ( not ( = ?auto_138751 ?auto_138754 ) ) ( not ( = ?auto_138752 ?auto_138754 ) ) ( not ( = ?auto_138750 ?auto_138754 ) ) ( not ( = ?auto_138749 ?auto_138754 ) ) ( ON ?auto_138747 ?auto_138746 ) ( ON-TABLE ?auto_138754 ) ( ON ?auto_138753 ?auto_138747 ) ( CLEAR ?auto_138753 ) ( HOLDING ?auto_138749 ) ( CLEAR ?auto_138750 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138748 ?auto_138751 ?auto_138752 ?auto_138750 ?auto_138749 )
      ( MAKE-2PILE ?auto_138746 ?auto_138747 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138755 - BLOCK
      ?auto_138756 - BLOCK
    )
    :vars
    (
      ?auto_138760 - BLOCK
      ?auto_138763 - BLOCK
      ?auto_138762 - BLOCK
      ?auto_138757 - BLOCK
      ?auto_138758 - BLOCK
      ?auto_138761 - BLOCK
      ?auto_138759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138755 ?auto_138756 ) ) ( not ( = ?auto_138755 ?auto_138760 ) ) ( not ( = ?auto_138756 ?auto_138760 ) ) ( ON-TABLE ?auto_138763 ) ( ON ?auto_138762 ?auto_138763 ) ( ON ?auto_138757 ?auto_138762 ) ( ON ?auto_138758 ?auto_138757 ) ( not ( = ?auto_138763 ?auto_138762 ) ) ( not ( = ?auto_138763 ?auto_138757 ) ) ( not ( = ?auto_138763 ?auto_138758 ) ) ( not ( = ?auto_138763 ?auto_138761 ) ) ( not ( = ?auto_138763 ?auto_138760 ) ) ( not ( = ?auto_138763 ?auto_138756 ) ) ( not ( = ?auto_138763 ?auto_138755 ) ) ( not ( = ?auto_138762 ?auto_138757 ) ) ( not ( = ?auto_138762 ?auto_138758 ) ) ( not ( = ?auto_138762 ?auto_138761 ) ) ( not ( = ?auto_138762 ?auto_138760 ) ) ( not ( = ?auto_138762 ?auto_138756 ) ) ( not ( = ?auto_138762 ?auto_138755 ) ) ( not ( = ?auto_138757 ?auto_138758 ) ) ( not ( = ?auto_138757 ?auto_138761 ) ) ( not ( = ?auto_138757 ?auto_138760 ) ) ( not ( = ?auto_138757 ?auto_138756 ) ) ( not ( = ?auto_138757 ?auto_138755 ) ) ( not ( = ?auto_138758 ?auto_138761 ) ) ( not ( = ?auto_138758 ?auto_138760 ) ) ( not ( = ?auto_138758 ?auto_138756 ) ) ( not ( = ?auto_138758 ?auto_138755 ) ) ( not ( = ?auto_138761 ?auto_138760 ) ) ( not ( = ?auto_138761 ?auto_138756 ) ) ( not ( = ?auto_138761 ?auto_138755 ) ) ( ON ?auto_138755 ?auto_138759 ) ( not ( = ?auto_138755 ?auto_138759 ) ) ( not ( = ?auto_138756 ?auto_138759 ) ) ( not ( = ?auto_138760 ?auto_138759 ) ) ( not ( = ?auto_138763 ?auto_138759 ) ) ( not ( = ?auto_138762 ?auto_138759 ) ) ( not ( = ?auto_138757 ?auto_138759 ) ) ( not ( = ?auto_138758 ?auto_138759 ) ) ( not ( = ?auto_138761 ?auto_138759 ) ) ( ON ?auto_138756 ?auto_138755 ) ( ON-TABLE ?auto_138759 ) ( ON ?auto_138760 ?auto_138756 ) ( CLEAR ?auto_138758 ) ( ON ?auto_138761 ?auto_138760 ) ( CLEAR ?auto_138761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138759 ?auto_138755 ?auto_138756 ?auto_138760 )
      ( MAKE-2PILE ?auto_138755 ?auto_138756 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138764 - BLOCK
      ?auto_138765 - BLOCK
    )
    :vars
    (
      ?auto_138772 - BLOCK
      ?auto_138771 - BLOCK
      ?auto_138770 - BLOCK
      ?auto_138769 - BLOCK
      ?auto_138768 - BLOCK
      ?auto_138767 - BLOCK
      ?auto_138766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138764 ?auto_138765 ) ) ( not ( = ?auto_138764 ?auto_138772 ) ) ( not ( = ?auto_138765 ?auto_138772 ) ) ( ON-TABLE ?auto_138771 ) ( ON ?auto_138770 ?auto_138771 ) ( ON ?auto_138769 ?auto_138770 ) ( not ( = ?auto_138771 ?auto_138770 ) ) ( not ( = ?auto_138771 ?auto_138769 ) ) ( not ( = ?auto_138771 ?auto_138768 ) ) ( not ( = ?auto_138771 ?auto_138767 ) ) ( not ( = ?auto_138771 ?auto_138772 ) ) ( not ( = ?auto_138771 ?auto_138765 ) ) ( not ( = ?auto_138771 ?auto_138764 ) ) ( not ( = ?auto_138770 ?auto_138769 ) ) ( not ( = ?auto_138770 ?auto_138768 ) ) ( not ( = ?auto_138770 ?auto_138767 ) ) ( not ( = ?auto_138770 ?auto_138772 ) ) ( not ( = ?auto_138770 ?auto_138765 ) ) ( not ( = ?auto_138770 ?auto_138764 ) ) ( not ( = ?auto_138769 ?auto_138768 ) ) ( not ( = ?auto_138769 ?auto_138767 ) ) ( not ( = ?auto_138769 ?auto_138772 ) ) ( not ( = ?auto_138769 ?auto_138765 ) ) ( not ( = ?auto_138769 ?auto_138764 ) ) ( not ( = ?auto_138768 ?auto_138767 ) ) ( not ( = ?auto_138768 ?auto_138772 ) ) ( not ( = ?auto_138768 ?auto_138765 ) ) ( not ( = ?auto_138768 ?auto_138764 ) ) ( not ( = ?auto_138767 ?auto_138772 ) ) ( not ( = ?auto_138767 ?auto_138765 ) ) ( not ( = ?auto_138767 ?auto_138764 ) ) ( ON ?auto_138764 ?auto_138766 ) ( not ( = ?auto_138764 ?auto_138766 ) ) ( not ( = ?auto_138765 ?auto_138766 ) ) ( not ( = ?auto_138772 ?auto_138766 ) ) ( not ( = ?auto_138771 ?auto_138766 ) ) ( not ( = ?auto_138770 ?auto_138766 ) ) ( not ( = ?auto_138769 ?auto_138766 ) ) ( not ( = ?auto_138768 ?auto_138766 ) ) ( not ( = ?auto_138767 ?auto_138766 ) ) ( ON ?auto_138765 ?auto_138764 ) ( ON-TABLE ?auto_138766 ) ( ON ?auto_138772 ?auto_138765 ) ( ON ?auto_138767 ?auto_138772 ) ( CLEAR ?auto_138767 ) ( HOLDING ?auto_138768 ) ( CLEAR ?auto_138769 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138771 ?auto_138770 ?auto_138769 ?auto_138768 )
      ( MAKE-2PILE ?auto_138764 ?auto_138765 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138773 - BLOCK
      ?auto_138774 - BLOCK
    )
    :vars
    (
      ?auto_138776 - BLOCK
      ?auto_138781 - BLOCK
      ?auto_138779 - BLOCK
      ?auto_138778 - BLOCK
      ?auto_138777 - BLOCK
      ?auto_138780 - BLOCK
      ?auto_138775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138773 ?auto_138774 ) ) ( not ( = ?auto_138773 ?auto_138776 ) ) ( not ( = ?auto_138774 ?auto_138776 ) ) ( ON-TABLE ?auto_138781 ) ( ON ?auto_138779 ?auto_138781 ) ( ON ?auto_138778 ?auto_138779 ) ( not ( = ?auto_138781 ?auto_138779 ) ) ( not ( = ?auto_138781 ?auto_138778 ) ) ( not ( = ?auto_138781 ?auto_138777 ) ) ( not ( = ?auto_138781 ?auto_138780 ) ) ( not ( = ?auto_138781 ?auto_138776 ) ) ( not ( = ?auto_138781 ?auto_138774 ) ) ( not ( = ?auto_138781 ?auto_138773 ) ) ( not ( = ?auto_138779 ?auto_138778 ) ) ( not ( = ?auto_138779 ?auto_138777 ) ) ( not ( = ?auto_138779 ?auto_138780 ) ) ( not ( = ?auto_138779 ?auto_138776 ) ) ( not ( = ?auto_138779 ?auto_138774 ) ) ( not ( = ?auto_138779 ?auto_138773 ) ) ( not ( = ?auto_138778 ?auto_138777 ) ) ( not ( = ?auto_138778 ?auto_138780 ) ) ( not ( = ?auto_138778 ?auto_138776 ) ) ( not ( = ?auto_138778 ?auto_138774 ) ) ( not ( = ?auto_138778 ?auto_138773 ) ) ( not ( = ?auto_138777 ?auto_138780 ) ) ( not ( = ?auto_138777 ?auto_138776 ) ) ( not ( = ?auto_138777 ?auto_138774 ) ) ( not ( = ?auto_138777 ?auto_138773 ) ) ( not ( = ?auto_138780 ?auto_138776 ) ) ( not ( = ?auto_138780 ?auto_138774 ) ) ( not ( = ?auto_138780 ?auto_138773 ) ) ( ON ?auto_138773 ?auto_138775 ) ( not ( = ?auto_138773 ?auto_138775 ) ) ( not ( = ?auto_138774 ?auto_138775 ) ) ( not ( = ?auto_138776 ?auto_138775 ) ) ( not ( = ?auto_138781 ?auto_138775 ) ) ( not ( = ?auto_138779 ?auto_138775 ) ) ( not ( = ?auto_138778 ?auto_138775 ) ) ( not ( = ?auto_138777 ?auto_138775 ) ) ( not ( = ?auto_138780 ?auto_138775 ) ) ( ON ?auto_138774 ?auto_138773 ) ( ON-TABLE ?auto_138775 ) ( ON ?auto_138776 ?auto_138774 ) ( ON ?auto_138780 ?auto_138776 ) ( CLEAR ?auto_138778 ) ( ON ?auto_138777 ?auto_138780 ) ( CLEAR ?auto_138777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138775 ?auto_138773 ?auto_138774 ?auto_138776 ?auto_138780 )
      ( MAKE-2PILE ?auto_138773 ?auto_138774 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138782 - BLOCK
      ?auto_138783 - BLOCK
    )
    :vars
    (
      ?auto_138787 - BLOCK
      ?auto_138788 - BLOCK
      ?auto_138789 - BLOCK
      ?auto_138784 - BLOCK
      ?auto_138790 - BLOCK
      ?auto_138785 - BLOCK
      ?auto_138786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138782 ?auto_138783 ) ) ( not ( = ?auto_138782 ?auto_138787 ) ) ( not ( = ?auto_138783 ?auto_138787 ) ) ( ON-TABLE ?auto_138788 ) ( ON ?auto_138789 ?auto_138788 ) ( not ( = ?auto_138788 ?auto_138789 ) ) ( not ( = ?auto_138788 ?auto_138784 ) ) ( not ( = ?auto_138788 ?auto_138790 ) ) ( not ( = ?auto_138788 ?auto_138785 ) ) ( not ( = ?auto_138788 ?auto_138787 ) ) ( not ( = ?auto_138788 ?auto_138783 ) ) ( not ( = ?auto_138788 ?auto_138782 ) ) ( not ( = ?auto_138789 ?auto_138784 ) ) ( not ( = ?auto_138789 ?auto_138790 ) ) ( not ( = ?auto_138789 ?auto_138785 ) ) ( not ( = ?auto_138789 ?auto_138787 ) ) ( not ( = ?auto_138789 ?auto_138783 ) ) ( not ( = ?auto_138789 ?auto_138782 ) ) ( not ( = ?auto_138784 ?auto_138790 ) ) ( not ( = ?auto_138784 ?auto_138785 ) ) ( not ( = ?auto_138784 ?auto_138787 ) ) ( not ( = ?auto_138784 ?auto_138783 ) ) ( not ( = ?auto_138784 ?auto_138782 ) ) ( not ( = ?auto_138790 ?auto_138785 ) ) ( not ( = ?auto_138790 ?auto_138787 ) ) ( not ( = ?auto_138790 ?auto_138783 ) ) ( not ( = ?auto_138790 ?auto_138782 ) ) ( not ( = ?auto_138785 ?auto_138787 ) ) ( not ( = ?auto_138785 ?auto_138783 ) ) ( not ( = ?auto_138785 ?auto_138782 ) ) ( ON ?auto_138782 ?auto_138786 ) ( not ( = ?auto_138782 ?auto_138786 ) ) ( not ( = ?auto_138783 ?auto_138786 ) ) ( not ( = ?auto_138787 ?auto_138786 ) ) ( not ( = ?auto_138788 ?auto_138786 ) ) ( not ( = ?auto_138789 ?auto_138786 ) ) ( not ( = ?auto_138784 ?auto_138786 ) ) ( not ( = ?auto_138790 ?auto_138786 ) ) ( not ( = ?auto_138785 ?auto_138786 ) ) ( ON ?auto_138783 ?auto_138782 ) ( ON-TABLE ?auto_138786 ) ( ON ?auto_138787 ?auto_138783 ) ( ON ?auto_138785 ?auto_138787 ) ( ON ?auto_138790 ?auto_138785 ) ( CLEAR ?auto_138790 ) ( HOLDING ?auto_138784 ) ( CLEAR ?auto_138789 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138788 ?auto_138789 ?auto_138784 )
      ( MAKE-2PILE ?auto_138782 ?auto_138783 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138791 - BLOCK
      ?auto_138792 - BLOCK
    )
    :vars
    (
      ?auto_138795 - BLOCK
      ?auto_138798 - BLOCK
      ?auto_138793 - BLOCK
      ?auto_138796 - BLOCK
      ?auto_138794 - BLOCK
      ?auto_138797 - BLOCK
      ?auto_138799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138791 ?auto_138792 ) ) ( not ( = ?auto_138791 ?auto_138795 ) ) ( not ( = ?auto_138792 ?auto_138795 ) ) ( ON-TABLE ?auto_138798 ) ( ON ?auto_138793 ?auto_138798 ) ( not ( = ?auto_138798 ?auto_138793 ) ) ( not ( = ?auto_138798 ?auto_138796 ) ) ( not ( = ?auto_138798 ?auto_138794 ) ) ( not ( = ?auto_138798 ?auto_138797 ) ) ( not ( = ?auto_138798 ?auto_138795 ) ) ( not ( = ?auto_138798 ?auto_138792 ) ) ( not ( = ?auto_138798 ?auto_138791 ) ) ( not ( = ?auto_138793 ?auto_138796 ) ) ( not ( = ?auto_138793 ?auto_138794 ) ) ( not ( = ?auto_138793 ?auto_138797 ) ) ( not ( = ?auto_138793 ?auto_138795 ) ) ( not ( = ?auto_138793 ?auto_138792 ) ) ( not ( = ?auto_138793 ?auto_138791 ) ) ( not ( = ?auto_138796 ?auto_138794 ) ) ( not ( = ?auto_138796 ?auto_138797 ) ) ( not ( = ?auto_138796 ?auto_138795 ) ) ( not ( = ?auto_138796 ?auto_138792 ) ) ( not ( = ?auto_138796 ?auto_138791 ) ) ( not ( = ?auto_138794 ?auto_138797 ) ) ( not ( = ?auto_138794 ?auto_138795 ) ) ( not ( = ?auto_138794 ?auto_138792 ) ) ( not ( = ?auto_138794 ?auto_138791 ) ) ( not ( = ?auto_138797 ?auto_138795 ) ) ( not ( = ?auto_138797 ?auto_138792 ) ) ( not ( = ?auto_138797 ?auto_138791 ) ) ( ON ?auto_138791 ?auto_138799 ) ( not ( = ?auto_138791 ?auto_138799 ) ) ( not ( = ?auto_138792 ?auto_138799 ) ) ( not ( = ?auto_138795 ?auto_138799 ) ) ( not ( = ?auto_138798 ?auto_138799 ) ) ( not ( = ?auto_138793 ?auto_138799 ) ) ( not ( = ?auto_138796 ?auto_138799 ) ) ( not ( = ?auto_138794 ?auto_138799 ) ) ( not ( = ?auto_138797 ?auto_138799 ) ) ( ON ?auto_138792 ?auto_138791 ) ( ON-TABLE ?auto_138799 ) ( ON ?auto_138795 ?auto_138792 ) ( ON ?auto_138797 ?auto_138795 ) ( ON ?auto_138794 ?auto_138797 ) ( CLEAR ?auto_138793 ) ( ON ?auto_138796 ?auto_138794 ) ( CLEAR ?auto_138796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138799 ?auto_138791 ?auto_138792 ?auto_138795 ?auto_138797 ?auto_138794 )
      ( MAKE-2PILE ?auto_138791 ?auto_138792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138800 - BLOCK
      ?auto_138801 - BLOCK
    )
    :vars
    (
      ?auto_138805 - BLOCK
      ?auto_138804 - BLOCK
      ?auto_138807 - BLOCK
      ?auto_138803 - BLOCK
      ?auto_138808 - BLOCK
      ?auto_138802 - BLOCK
      ?auto_138806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138800 ?auto_138801 ) ) ( not ( = ?auto_138800 ?auto_138805 ) ) ( not ( = ?auto_138801 ?auto_138805 ) ) ( ON-TABLE ?auto_138804 ) ( not ( = ?auto_138804 ?auto_138807 ) ) ( not ( = ?auto_138804 ?auto_138803 ) ) ( not ( = ?auto_138804 ?auto_138808 ) ) ( not ( = ?auto_138804 ?auto_138802 ) ) ( not ( = ?auto_138804 ?auto_138805 ) ) ( not ( = ?auto_138804 ?auto_138801 ) ) ( not ( = ?auto_138804 ?auto_138800 ) ) ( not ( = ?auto_138807 ?auto_138803 ) ) ( not ( = ?auto_138807 ?auto_138808 ) ) ( not ( = ?auto_138807 ?auto_138802 ) ) ( not ( = ?auto_138807 ?auto_138805 ) ) ( not ( = ?auto_138807 ?auto_138801 ) ) ( not ( = ?auto_138807 ?auto_138800 ) ) ( not ( = ?auto_138803 ?auto_138808 ) ) ( not ( = ?auto_138803 ?auto_138802 ) ) ( not ( = ?auto_138803 ?auto_138805 ) ) ( not ( = ?auto_138803 ?auto_138801 ) ) ( not ( = ?auto_138803 ?auto_138800 ) ) ( not ( = ?auto_138808 ?auto_138802 ) ) ( not ( = ?auto_138808 ?auto_138805 ) ) ( not ( = ?auto_138808 ?auto_138801 ) ) ( not ( = ?auto_138808 ?auto_138800 ) ) ( not ( = ?auto_138802 ?auto_138805 ) ) ( not ( = ?auto_138802 ?auto_138801 ) ) ( not ( = ?auto_138802 ?auto_138800 ) ) ( ON ?auto_138800 ?auto_138806 ) ( not ( = ?auto_138800 ?auto_138806 ) ) ( not ( = ?auto_138801 ?auto_138806 ) ) ( not ( = ?auto_138805 ?auto_138806 ) ) ( not ( = ?auto_138804 ?auto_138806 ) ) ( not ( = ?auto_138807 ?auto_138806 ) ) ( not ( = ?auto_138803 ?auto_138806 ) ) ( not ( = ?auto_138808 ?auto_138806 ) ) ( not ( = ?auto_138802 ?auto_138806 ) ) ( ON ?auto_138801 ?auto_138800 ) ( ON-TABLE ?auto_138806 ) ( ON ?auto_138805 ?auto_138801 ) ( ON ?auto_138802 ?auto_138805 ) ( ON ?auto_138808 ?auto_138802 ) ( ON ?auto_138803 ?auto_138808 ) ( CLEAR ?auto_138803 ) ( HOLDING ?auto_138807 ) ( CLEAR ?auto_138804 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138804 ?auto_138807 )
      ( MAKE-2PILE ?auto_138800 ?auto_138801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138809 - BLOCK
      ?auto_138810 - BLOCK
    )
    :vars
    (
      ?auto_138811 - BLOCK
      ?auto_138813 - BLOCK
      ?auto_138815 - BLOCK
      ?auto_138812 - BLOCK
      ?auto_138817 - BLOCK
      ?auto_138814 - BLOCK
      ?auto_138816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138809 ?auto_138810 ) ) ( not ( = ?auto_138809 ?auto_138811 ) ) ( not ( = ?auto_138810 ?auto_138811 ) ) ( ON-TABLE ?auto_138813 ) ( not ( = ?auto_138813 ?auto_138815 ) ) ( not ( = ?auto_138813 ?auto_138812 ) ) ( not ( = ?auto_138813 ?auto_138817 ) ) ( not ( = ?auto_138813 ?auto_138814 ) ) ( not ( = ?auto_138813 ?auto_138811 ) ) ( not ( = ?auto_138813 ?auto_138810 ) ) ( not ( = ?auto_138813 ?auto_138809 ) ) ( not ( = ?auto_138815 ?auto_138812 ) ) ( not ( = ?auto_138815 ?auto_138817 ) ) ( not ( = ?auto_138815 ?auto_138814 ) ) ( not ( = ?auto_138815 ?auto_138811 ) ) ( not ( = ?auto_138815 ?auto_138810 ) ) ( not ( = ?auto_138815 ?auto_138809 ) ) ( not ( = ?auto_138812 ?auto_138817 ) ) ( not ( = ?auto_138812 ?auto_138814 ) ) ( not ( = ?auto_138812 ?auto_138811 ) ) ( not ( = ?auto_138812 ?auto_138810 ) ) ( not ( = ?auto_138812 ?auto_138809 ) ) ( not ( = ?auto_138817 ?auto_138814 ) ) ( not ( = ?auto_138817 ?auto_138811 ) ) ( not ( = ?auto_138817 ?auto_138810 ) ) ( not ( = ?auto_138817 ?auto_138809 ) ) ( not ( = ?auto_138814 ?auto_138811 ) ) ( not ( = ?auto_138814 ?auto_138810 ) ) ( not ( = ?auto_138814 ?auto_138809 ) ) ( ON ?auto_138809 ?auto_138816 ) ( not ( = ?auto_138809 ?auto_138816 ) ) ( not ( = ?auto_138810 ?auto_138816 ) ) ( not ( = ?auto_138811 ?auto_138816 ) ) ( not ( = ?auto_138813 ?auto_138816 ) ) ( not ( = ?auto_138815 ?auto_138816 ) ) ( not ( = ?auto_138812 ?auto_138816 ) ) ( not ( = ?auto_138817 ?auto_138816 ) ) ( not ( = ?auto_138814 ?auto_138816 ) ) ( ON ?auto_138810 ?auto_138809 ) ( ON-TABLE ?auto_138816 ) ( ON ?auto_138811 ?auto_138810 ) ( ON ?auto_138814 ?auto_138811 ) ( ON ?auto_138817 ?auto_138814 ) ( ON ?auto_138812 ?auto_138817 ) ( CLEAR ?auto_138813 ) ( ON ?auto_138815 ?auto_138812 ) ( CLEAR ?auto_138815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138816 ?auto_138809 ?auto_138810 ?auto_138811 ?auto_138814 ?auto_138817 ?auto_138812 )
      ( MAKE-2PILE ?auto_138809 ?auto_138810 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138818 - BLOCK
      ?auto_138819 - BLOCK
    )
    :vars
    (
      ?auto_138824 - BLOCK
      ?auto_138822 - BLOCK
      ?auto_138825 - BLOCK
      ?auto_138823 - BLOCK
      ?auto_138826 - BLOCK
      ?auto_138821 - BLOCK
      ?auto_138820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138818 ?auto_138819 ) ) ( not ( = ?auto_138818 ?auto_138824 ) ) ( not ( = ?auto_138819 ?auto_138824 ) ) ( not ( = ?auto_138822 ?auto_138825 ) ) ( not ( = ?auto_138822 ?auto_138823 ) ) ( not ( = ?auto_138822 ?auto_138826 ) ) ( not ( = ?auto_138822 ?auto_138821 ) ) ( not ( = ?auto_138822 ?auto_138824 ) ) ( not ( = ?auto_138822 ?auto_138819 ) ) ( not ( = ?auto_138822 ?auto_138818 ) ) ( not ( = ?auto_138825 ?auto_138823 ) ) ( not ( = ?auto_138825 ?auto_138826 ) ) ( not ( = ?auto_138825 ?auto_138821 ) ) ( not ( = ?auto_138825 ?auto_138824 ) ) ( not ( = ?auto_138825 ?auto_138819 ) ) ( not ( = ?auto_138825 ?auto_138818 ) ) ( not ( = ?auto_138823 ?auto_138826 ) ) ( not ( = ?auto_138823 ?auto_138821 ) ) ( not ( = ?auto_138823 ?auto_138824 ) ) ( not ( = ?auto_138823 ?auto_138819 ) ) ( not ( = ?auto_138823 ?auto_138818 ) ) ( not ( = ?auto_138826 ?auto_138821 ) ) ( not ( = ?auto_138826 ?auto_138824 ) ) ( not ( = ?auto_138826 ?auto_138819 ) ) ( not ( = ?auto_138826 ?auto_138818 ) ) ( not ( = ?auto_138821 ?auto_138824 ) ) ( not ( = ?auto_138821 ?auto_138819 ) ) ( not ( = ?auto_138821 ?auto_138818 ) ) ( ON ?auto_138818 ?auto_138820 ) ( not ( = ?auto_138818 ?auto_138820 ) ) ( not ( = ?auto_138819 ?auto_138820 ) ) ( not ( = ?auto_138824 ?auto_138820 ) ) ( not ( = ?auto_138822 ?auto_138820 ) ) ( not ( = ?auto_138825 ?auto_138820 ) ) ( not ( = ?auto_138823 ?auto_138820 ) ) ( not ( = ?auto_138826 ?auto_138820 ) ) ( not ( = ?auto_138821 ?auto_138820 ) ) ( ON ?auto_138819 ?auto_138818 ) ( ON-TABLE ?auto_138820 ) ( ON ?auto_138824 ?auto_138819 ) ( ON ?auto_138821 ?auto_138824 ) ( ON ?auto_138826 ?auto_138821 ) ( ON ?auto_138823 ?auto_138826 ) ( ON ?auto_138825 ?auto_138823 ) ( CLEAR ?auto_138825 ) ( HOLDING ?auto_138822 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138822 )
      ( MAKE-2PILE ?auto_138818 ?auto_138819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_138827 - BLOCK
      ?auto_138828 - BLOCK
    )
    :vars
    (
      ?auto_138831 - BLOCK
      ?auto_138833 - BLOCK
      ?auto_138834 - BLOCK
      ?auto_138835 - BLOCK
      ?auto_138830 - BLOCK
      ?auto_138832 - BLOCK
      ?auto_138829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_138827 ?auto_138828 ) ) ( not ( = ?auto_138827 ?auto_138831 ) ) ( not ( = ?auto_138828 ?auto_138831 ) ) ( not ( = ?auto_138833 ?auto_138834 ) ) ( not ( = ?auto_138833 ?auto_138835 ) ) ( not ( = ?auto_138833 ?auto_138830 ) ) ( not ( = ?auto_138833 ?auto_138832 ) ) ( not ( = ?auto_138833 ?auto_138831 ) ) ( not ( = ?auto_138833 ?auto_138828 ) ) ( not ( = ?auto_138833 ?auto_138827 ) ) ( not ( = ?auto_138834 ?auto_138835 ) ) ( not ( = ?auto_138834 ?auto_138830 ) ) ( not ( = ?auto_138834 ?auto_138832 ) ) ( not ( = ?auto_138834 ?auto_138831 ) ) ( not ( = ?auto_138834 ?auto_138828 ) ) ( not ( = ?auto_138834 ?auto_138827 ) ) ( not ( = ?auto_138835 ?auto_138830 ) ) ( not ( = ?auto_138835 ?auto_138832 ) ) ( not ( = ?auto_138835 ?auto_138831 ) ) ( not ( = ?auto_138835 ?auto_138828 ) ) ( not ( = ?auto_138835 ?auto_138827 ) ) ( not ( = ?auto_138830 ?auto_138832 ) ) ( not ( = ?auto_138830 ?auto_138831 ) ) ( not ( = ?auto_138830 ?auto_138828 ) ) ( not ( = ?auto_138830 ?auto_138827 ) ) ( not ( = ?auto_138832 ?auto_138831 ) ) ( not ( = ?auto_138832 ?auto_138828 ) ) ( not ( = ?auto_138832 ?auto_138827 ) ) ( ON ?auto_138827 ?auto_138829 ) ( not ( = ?auto_138827 ?auto_138829 ) ) ( not ( = ?auto_138828 ?auto_138829 ) ) ( not ( = ?auto_138831 ?auto_138829 ) ) ( not ( = ?auto_138833 ?auto_138829 ) ) ( not ( = ?auto_138834 ?auto_138829 ) ) ( not ( = ?auto_138835 ?auto_138829 ) ) ( not ( = ?auto_138830 ?auto_138829 ) ) ( not ( = ?auto_138832 ?auto_138829 ) ) ( ON ?auto_138828 ?auto_138827 ) ( ON-TABLE ?auto_138829 ) ( ON ?auto_138831 ?auto_138828 ) ( ON ?auto_138832 ?auto_138831 ) ( ON ?auto_138830 ?auto_138832 ) ( ON ?auto_138835 ?auto_138830 ) ( ON ?auto_138834 ?auto_138835 ) ( ON ?auto_138833 ?auto_138834 ) ( CLEAR ?auto_138833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138829 ?auto_138827 ?auto_138828 ?auto_138831 ?auto_138832 ?auto_138830 ?auto_138835 ?auto_138834 )
      ( MAKE-2PILE ?auto_138827 ?auto_138828 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138841 - BLOCK
      ?auto_138842 - BLOCK
      ?auto_138843 - BLOCK
      ?auto_138844 - BLOCK
      ?auto_138845 - BLOCK
    )
    :vars
    (
      ?auto_138846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138846 ?auto_138845 ) ( CLEAR ?auto_138846 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138841 ) ( ON ?auto_138842 ?auto_138841 ) ( ON ?auto_138843 ?auto_138842 ) ( ON ?auto_138844 ?auto_138843 ) ( ON ?auto_138845 ?auto_138844 ) ( not ( = ?auto_138841 ?auto_138842 ) ) ( not ( = ?auto_138841 ?auto_138843 ) ) ( not ( = ?auto_138841 ?auto_138844 ) ) ( not ( = ?auto_138841 ?auto_138845 ) ) ( not ( = ?auto_138841 ?auto_138846 ) ) ( not ( = ?auto_138842 ?auto_138843 ) ) ( not ( = ?auto_138842 ?auto_138844 ) ) ( not ( = ?auto_138842 ?auto_138845 ) ) ( not ( = ?auto_138842 ?auto_138846 ) ) ( not ( = ?auto_138843 ?auto_138844 ) ) ( not ( = ?auto_138843 ?auto_138845 ) ) ( not ( = ?auto_138843 ?auto_138846 ) ) ( not ( = ?auto_138844 ?auto_138845 ) ) ( not ( = ?auto_138844 ?auto_138846 ) ) ( not ( = ?auto_138845 ?auto_138846 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138846 ?auto_138845 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138847 - BLOCK
      ?auto_138848 - BLOCK
      ?auto_138849 - BLOCK
      ?auto_138850 - BLOCK
      ?auto_138851 - BLOCK
    )
    :vars
    (
      ?auto_138852 - BLOCK
      ?auto_138853 - BLOCK
      ?auto_138854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138852 ?auto_138851 ) ( CLEAR ?auto_138852 ) ( ON-TABLE ?auto_138847 ) ( ON ?auto_138848 ?auto_138847 ) ( ON ?auto_138849 ?auto_138848 ) ( ON ?auto_138850 ?auto_138849 ) ( ON ?auto_138851 ?auto_138850 ) ( not ( = ?auto_138847 ?auto_138848 ) ) ( not ( = ?auto_138847 ?auto_138849 ) ) ( not ( = ?auto_138847 ?auto_138850 ) ) ( not ( = ?auto_138847 ?auto_138851 ) ) ( not ( = ?auto_138847 ?auto_138852 ) ) ( not ( = ?auto_138848 ?auto_138849 ) ) ( not ( = ?auto_138848 ?auto_138850 ) ) ( not ( = ?auto_138848 ?auto_138851 ) ) ( not ( = ?auto_138848 ?auto_138852 ) ) ( not ( = ?auto_138849 ?auto_138850 ) ) ( not ( = ?auto_138849 ?auto_138851 ) ) ( not ( = ?auto_138849 ?auto_138852 ) ) ( not ( = ?auto_138850 ?auto_138851 ) ) ( not ( = ?auto_138850 ?auto_138852 ) ) ( not ( = ?auto_138851 ?auto_138852 ) ) ( HOLDING ?auto_138853 ) ( CLEAR ?auto_138854 ) ( not ( = ?auto_138847 ?auto_138853 ) ) ( not ( = ?auto_138847 ?auto_138854 ) ) ( not ( = ?auto_138848 ?auto_138853 ) ) ( not ( = ?auto_138848 ?auto_138854 ) ) ( not ( = ?auto_138849 ?auto_138853 ) ) ( not ( = ?auto_138849 ?auto_138854 ) ) ( not ( = ?auto_138850 ?auto_138853 ) ) ( not ( = ?auto_138850 ?auto_138854 ) ) ( not ( = ?auto_138851 ?auto_138853 ) ) ( not ( = ?auto_138851 ?auto_138854 ) ) ( not ( = ?auto_138852 ?auto_138853 ) ) ( not ( = ?auto_138852 ?auto_138854 ) ) ( not ( = ?auto_138853 ?auto_138854 ) ) )
    :subtasks
    ( ( !STACK ?auto_138853 ?auto_138854 )
      ( MAKE-5PILE ?auto_138847 ?auto_138848 ?auto_138849 ?auto_138850 ?auto_138851 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138855 - BLOCK
      ?auto_138856 - BLOCK
      ?auto_138857 - BLOCK
      ?auto_138858 - BLOCK
      ?auto_138859 - BLOCK
    )
    :vars
    (
      ?auto_138862 - BLOCK
      ?auto_138861 - BLOCK
      ?auto_138860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138862 ?auto_138859 ) ( ON-TABLE ?auto_138855 ) ( ON ?auto_138856 ?auto_138855 ) ( ON ?auto_138857 ?auto_138856 ) ( ON ?auto_138858 ?auto_138857 ) ( ON ?auto_138859 ?auto_138858 ) ( not ( = ?auto_138855 ?auto_138856 ) ) ( not ( = ?auto_138855 ?auto_138857 ) ) ( not ( = ?auto_138855 ?auto_138858 ) ) ( not ( = ?auto_138855 ?auto_138859 ) ) ( not ( = ?auto_138855 ?auto_138862 ) ) ( not ( = ?auto_138856 ?auto_138857 ) ) ( not ( = ?auto_138856 ?auto_138858 ) ) ( not ( = ?auto_138856 ?auto_138859 ) ) ( not ( = ?auto_138856 ?auto_138862 ) ) ( not ( = ?auto_138857 ?auto_138858 ) ) ( not ( = ?auto_138857 ?auto_138859 ) ) ( not ( = ?auto_138857 ?auto_138862 ) ) ( not ( = ?auto_138858 ?auto_138859 ) ) ( not ( = ?auto_138858 ?auto_138862 ) ) ( not ( = ?auto_138859 ?auto_138862 ) ) ( CLEAR ?auto_138861 ) ( not ( = ?auto_138855 ?auto_138860 ) ) ( not ( = ?auto_138855 ?auto_138861 ) ) ( not ( = ?auto_138856 ?auto_138860 ) ) ( not ( = ?auto_138856 ?auto_138861 ) ) ( not ( = ?auto_138857 ?auto_138860 ) ) ( not ( = ?auto_138857 ?auto_138861 ) ) ( not ( = ?auto_138858 ?auto_138860 ) ) ( not ( = ?auto_138858 ?auto_138861 ) ) ( not ( = ?auto_138859 ?auto_138860 ) ) ( not ( = ?auto_138859 ?auto_138861 ) ) ( not ( = ?auto_138862 ?auto_138860 ) ) ( not ( = ?auto_138862 ?auto_138861 ) ) ( not ( = ?auto_138860 ?auto_138861 ) ) ( ON ?auto_138860 ?auto_138862 ) ( CLEAR ?auto_138860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138855 ?auto_138856 ?auto_138857 ?auto_138858 ?auto_138859 ?auto_138862 )
      ( MAKE-5PILE ?auto_138855 ?auto_138856 ?auto_138857 ?auto_138858 ?auto_138859 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138863 - BLOCK
      ?auto_138864 - BLOCK
      ?auto_138865 - BLOCK
      ?auto_138866 - BLOCK
      ?auto_138867 - BLOCK
    )
    :vars
    (
      ?auto_138868 - BLOCK
      ?auto_138869 - BLOCK
      ?auto_138870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138868 ?auto_138867 ) ( ON-TABLE ?auto_138863 ) ( ON ?auto_138864 ?auto_138863 ) ( ON ?auto_138865 ?auto_138864 ) ( ON ?auto_138866 ?auto_138865 ) ( ON ?auto_138867 ?auto_138866 ) ( not ( = ?auto_138863 ?auto_138864 ) ) ( not ( = ?auto_138863 ?auto_138865 ) ) ( not ( = ?auto_138863 ?auto_138866 ) ) ( not ( = ?auto_138863 ?auto_138867 ) ) ( not ( = ?auto_138863 ?auto_138868 ) ) ( not ( = ?auto_138864 ?auto_138865 ) ) ( not ( = ?auto_138864 ?auto_138866 ) ) ( not ( = ?auto_138864 ?auto_138867 ) ) ( not ( = ?auto_138864 ?auto_138868 ) ) ( not ( = ?auto_138865 ?auto_138866 ) ) ( not ( = ?auto_138865 ?auto_138867 ) ) ( not ( = ?auto_138865 ?auto_138868 ) ) ( not ( = ?auto_138866 ?auto_138867 ) ) ( not ( = ?auto_138866 ?auto_138868 ) ) ( not ( = ?auto_138867 ?auto_138868 ) ) ( not ( = ?auto_138863 ?auto_138869 ) ) ( not ( = ?auto_138863 ?auto_138870 ) ) ( not ( = ?auto_138864 ?auto_138869 ) ) ( not ( = ?auto_138864 ?auto_138870 ) ) ( not ( = ?auto_138865 ?auto_138869 ) ) ( not ( = ?auto_138865 ?auto_138870 ) ) ( not ( = ?auto_138866 ?auto_138869 ) ) ( not ( = ?auto_138866 ?auto_138870 ) ) ( not ( = ?auto_138867 ?auto_138869 ) ) ( not ( = ?auto_138867 ?auto_138870 ) ) ( not ( = ?auto_138868 ?auto_138869 ) ) ( not ( = ?auto_138868 ?auto_138870 ) ) ( not ( = ?auto_138869 ?auto_138870 ) ) ( ON ?auto_138869 ?auto_138868 ) ( CLEAR ?auto_138869 ) ( HOLDING ?auto_138870 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_138870 )
      ( MAKE-5PILE ?auto_138863 ?auto_138864 ?auto_138865 ?auto_138866 ?auto_138867 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138871 - BLOCK
      ?auto_138872 - BLOCK
      ?auto_138873 - BLOCK
      ?auto_138874 - BLOCK
      ?auto_138875 - BLOCK
    )
    :vars
    (
      ?auto_138876 - BLOCK
      ?auto_138878 - BLOCK
      ?auto_138877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138876 ?auto_138875 ) ( ON-TABLE ?auto_138871 ) ( ON ?auto_138872 ?auto_138871 ) ( ON ?auto_138873 ?auto_138872 ) ( ON ?auto_138874 ?auto_138873 ) ( ON ?auto_138875 ?auto_138874 ) ( not ( = ?auto_138871 ?auto_138872 ) ) ( not ( = ?auto_138871 ?auto_138873 ) ) ( not ( = ?auto_138871 ?auto_138874 ) ) ( not ( = ?auto_138871 ?auto_138875 ) ) ( not ( = ?auto_138871 ?auto_138876 ) ) ( not ( = ?auto_138872 ?auto_138873 ) ) ( not ( = ?auto_138872 ?auto_138874 ) ) ( not ( = ?auto_138872 ?auto_138875 ) ) ( not ( = ?auto_138872 ?auto_138876 ) ) ( not ( = ?auto_138873 ?auto_138874 ) ) ( not ( = ?auto_138873 ?auto_138875 ) ) ( not ( = ?auto_138873 ?auto_138876 ) ) ( not ( = ?auto_138874 ?auto_138875 ) ) ( not ( = ?auto_138874 ?auto_138876 ) ) ( not ( = ?auto_138875 ?auto_138876 ) ) ( not ( = ?auto_138871 ?auto_138878 ) ) ( not ( = ?auto_138871 ?auto_138877 ) ) ( not ( = ?auto_138872 ?auto_138878 ) ) ( not ( = ?auto_138872 ?auto_138877 ) ) ( not ( = ?auto_138873 ?auto_138878 ) ) ( not ( = ?auto_138873 ?auto_138877 ) ) ( not ( = ?auto_138874 ?auto_138878 ) ) ( not ( = ?auto_138874 ?auto_138877 ) ) ( not ( = ?auto_138875 ?auto_138878 ) ) ( not ( = ?auto_138875 ?auto_138877 ) ) ( not ( = ?auto_138876 ?auto_138878 ) ) ( not ( = ?auto_138876 ?auto_138877 ) ) ( not ( = ?auto_138878 ?auto_138877 ) ) ( ON ?auto_138878 ?auto_138876 ) ( ON ?auto_138877 ?auto_138878 ) ( CLEAR ?auto_138877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138871 ?auto_138872 ?auto_138873 ?auto_138874 ?auto_138875 ?auto_138876 ?auto_138878 )
      ( MAKE-5PILE ?auto_138871 ?auto_138872 ?auto_138873 ?auto_138874 ?auto_138875 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138879 - BLOCK
      ?auto_138880 - BLOCK
      ?auto_138881 - BLOCK
      ?auto_138882 - BLOCK
      ?auto_138883 - BLOCK
    )
    :vars
    (
      ?auto_138884 - BLOCK
      ?auto_138886 - BLOCK
      ?auto_138885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138884 ?auto_138883 ) ( ON-TABLE ?auto_138879 ) ( ON ?auto_138880 ?auto_138879 ) ( ON ?auto_138881 ?auto_138880 ) ( ON ?auto_138882 ?auto_138881 ) ( ON ?auto_138883 ?auto_138882 ) ( not ( = ?auto_138879 ?auto_138880 ) ) ( not ( = ?auto_138879 ?auto_138881 ) ) ( not ( = ?auto_138879 ?auto_138882 ) ) ( not ( = ?auto_138879 ?auto_138883 ) ) ( not ( = ?auto_138879 ?auto_138884 ) ) ( not ( = ?auto_138880 ?auto_138881 ) ) ( not ( = ?auto_138880 ?auto_138882 ) ) ( not ( = ?auto_138880 ?auto_138883 ) ) ( not ( = ?auto_138880 ?auto_138884 ) ) ( not ( = ?auto_138881 ?auto_138882 ) ) ( not ( = ?auto_138881 ?auto_138883 ) ) ( not ( = ?auto_138881 ?auto_138884 ) ) ( not ( = ?auto_138882 ?auto_138883 ) ) ( not ( = ?auto_138882 ?auto_138884 ) ) ( not ( = ?auto_138883 ?auto_138884 ) ) ( not ( = ?auto_138879 ?auto_138886 ) ) ( not ( = ?auto_138879 ?auto_138885 ) ) ( not ( = ?auto_138880 ?auto_138886 ) ) ( not ( = ?auto_138880 ?auto_138885 ) ) ( not ( = ?auto_138881 ?auto_138886 ) ) ( not ( = ?auto_138881 ?auto_138885 ) ) ( not ( = ?auto_138882 ?auto_138886 ) ) ( not ( = ?auto_138882 ?auto_138885 ) ) ( not ( = ?auto_138883 ?auto_138886 ) ) ( not ( = ?auto_138883 ?auto_138885 ) ) ( not ( = ?auto_138884 ?auto_138886 ) ) ( not ( = ?auto_138884 ?auto_138885 ) ) ( not ( = ?auto_138886 ?auto_138885 ) ) ( ON ?auto_138886 ?auto_138884 ) ( HOLDING ?auto_138885 ) ( CLEAR ?auto_138886 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_138879 ?auto_138880 ?auto_138881 ?auto_138882 ?auto_138883 ?auto_138884 ?auto_138886 ?auto_138885 )
      ( MAKE-5PILE ?auto_138879 ?auto_138880 ?auto_138881 ?auto_138882 ?auto_138883 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138887 - BLOCK
      ?auto_138888 - BLOCK
      ?auto_138889 - BLOCK
      ?auto_138890 - BLOCK
      ?auto_138891 - BLOCK
    )
    :vars
    (
      ?auto_138892 - BLOCK
      ?auto_138894 - BLOCK
      ?auto_138893 - BLOCK
      ?auto_138895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138892 ?auto_138891 ) ( ON-TABLE ?auto_138887 ) ( ON ?auto_138888 ?auto_138887 ) ( ON ?auto_138889 ?auto_138888 ) ( ON ?auto_138890 ?auto_138889 ) ( ON ?auto_138891 ?auto_138890 ) ( not ( = ?auto_138887 ?auto_138888 ) ) ( not ( = ?auto_138887 ?auto_138889 ) ) ( not ( = ?auto_138887 ?auto_138890 ) ) ( not ( = ?auto_138887 ?auto_138891 ) ) ( not ( = ?auto_138887 ?auto_138892 ) ) ( not ( = ?auto_138888 ?auto_138889 ) ) ( not ( = ?auto_138888 ?auto_138890 ) ) ( not ( = ?auto_138888 ?auto_138891 ) ) ( not ( = ?auto_138888 ?auto_138892 ) ) ( not ( = ?auto_138889 ?auto_138890 ) ) ( not ( = ?auto_138889 ?auto_138891 ) ) ( not ( = ?auto_138889 ?auto_138892 ) ) ( not ( = ?auto_138890 ?auto_138891 ) ) ( not ( = ?auto_138890 ?auto_138892 ) ) ( not ( = ?auto_138891 ?auto_138892 ) ) ( not ( = ?auto_138887 ?auto_138894 ) ) ( not ( = ?auto_138887 ?auto_138893 ) ) ( not ( = ?auto_138888 ?auto_138894 ) ) ( not ( = ?auto_138888 ?auto_138893 ) ) ( not ( = ?auto_138889 ?auto_138894 ) ) ( not ( = ?auto_138889 ?auto_138893 ) ) ( not ( = ?auto_138890 ?auto_138894 ) ) ( not ( = ?auto_138890 ?auto_138893 ) ) ( not ( = ?auto_138891 ?auto_138894 ) ) ( not ( = ?auto_138891 ?auto_138893 ) ) ( not ( = ?auto_138892 ?auto_138894 ) ) ( not ( = ?auto_138892 ?auto_138893 ) ) ( not ( = ?auto_138894 ?auto_138893 ) ) ( ON ?auto_138894 ?auto_138892 ) ( CLEAR ?auto_138894 ) ( ON ?auto_138893 ?auto_138895 ) ( CLEAR ?auto_138893 ) ( HAND-EMPTY ) ( not ( = ?auto_138887 ?auto_138895 ) ) ( not ( = ?auto_138888 ?auto_138895 ) ) ( not ( = ?auto_138889 ?auto_138895 ) ) ( not ( = ?auto_138890 ?auto_138895 ) ) ( not ( = ?auto_138891 ?auto_138895 ) ) ( not ( = ?auto_138892 ?auto_138895 ) ) ( not ( = ?auto_138894 ?auto_138895 ) ) ( not ( = ?auto_138893 ?auto_138895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_138893 ?auto_138895 )
      ( MAKE-5PILE ?auto_138887 ?auto_138888 ?auto_138889 ?auto_138890 ?auto_138891 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138896 - BLOCK
      ?auto_138897 - BLOCK
      ?auto_138898 - BLOCK
      ?auto_138899 - BLOCK
      ?auto_138900 - BLOCK
    )
    :vars
    (
      ?auto_138904 - BLOCK
      ?auto_138902 - BLOCK
      ?auto_138903 - BLOCK
      ?auto_138901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138904 ?auto_138900 ) ( ON-TABLE ?auto_138896 ) ( ON ?auto_138897 ?auto_138896 ) ( ON ?auto_138898 ?auto_138897 ) ( ON ?auto_138899 ?auto_138898 ) ( ON ?auto_138900 ?auto_138899 ) ( not ( = ?auto_138896 ?auto_138897 ) ) ( not ( = ?auto_138896 ?auto_138898 ) ) ( not ( = ?auto_138896 ?auto_138899 ) ) ( not ( = ?auto_138896 ?auto_138900 ) ) ( not ( = ?auto_138896 ?auto_138904 ) ) ( not ( = ?auto_138897 ?auto_138898 ) ) ( not ( = ?auto_138897 ?auto_138899 ) ) ( not ( = ?auto_138897 ?auto_138900 ) ) ( not ( = ?auto_138897 ?auto_138904 ) ) ( not ( = ?auto_138898 ?auto_138899 ) ) ( not ( = ?auto_138898 ?auto_138900 ) ) ( not ( = ?auto_138898 ?auto_138904 ) ) ( not ( = ?auto_138899 ?auto_138900 ) ) ( not ( = ?auto_138899 ?auto_138904 ) ) ( not ( = ?auto_138900 ?auto_138904 ) ) ( not ( = ?auto_138896 ?auto_138902 ) ) ( not ( = ?auto_138896 ?auto_138903 ) ) ( not ( = ?auto_138897 ?auto_138902 ) ) ( not ( = ?auto_138897 ?auto_138903 ) ) ( not ( = ?auto_138898 ?auto_138902 ) ) ( not ( = ?auto_138898 ?auto_138903 ) ) ( not ( = ?auto_138899 ?auto_138902 ) ) ( not ( = ?auto_138899 ?auto_138903 ) ) ( not ( = ?auto_138900 ?auto_138902 ) ) ( not ( = ?auto_138900 ?auto_138903 ) ) ( not ( = ?auto_138904 ?auto_138902 ) ) ( not ( = ?auto_138904 ?auto_138903 ) ) ( not ( = ?auto_138902 ?auto_138903 ) ) ( ON ?auto_138903 ?auto_138901 ) ( CLEAR ?auto_138903 ) ( not ( = ?auto_138896 ?auto_138901 ) ) ( not ( = ?auto_138897 ?auto_138901 ) ) ( not ( = ?auto_138898 ?auto_138901 ) ) ( not ( = ?auto_138899 ?auto_138901 ) ) ( not ( = ?auto_138900 ?auto_138901 ) ) ( not ( = ?auto_138904 ?auto_138901 ) ) ( not ( = ?auto_138902 ?auto_138901 ) ) ( not ( = ?auto_138903 ?auto_138901 ) ) ( HOLDING ?auto_138902 ) ( CLEAR ?auto_138904 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_138896 ?auto_138897 ?auto_138898 ?auto_138899 ?auto_138900 ?auto_138904 ?auto_138902 )
      ( MAKE-5PILE ?auto_138896 ?auto_138897 ?auto_138898 ?auto_138899 ?auto_138900 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138905 - BLOCK
      ?auto_138906 - BLOCK
      ?auto_138907 - BLOCK
      ?auto_138908 - BLOCK
      ?auto_138909 - BLOCK
    )
    :vars
    (
      ?auto_138910 - BLOCK
      ?auto_138912 - BLOCK
      ?auto_138911 - BLOCK
      ?auto_138913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_138910 ?auto_138909 ) ( ON-TABLE ?auto_138905 ) ( ON ?auto_138906 ?auto_138905 ) ( ON ?auto_138907 ?auto_138906 ) ( ON ?auto_138908 ?auto_138907 ) ( ON ?auto_138909 ?auto_138908 ) ( not ( = ?auto_138905 ?auto_138906 ) ) ( not ( = ?auto_138905 ?auto_138907 ) ) ( not ( = ?auto_138905 ?auto_138908 ) ) ( not ( = ?auto_138905 ?auto_138909 ) ) ( not ( = ?auto_138905 ?auto_138910 ) ) ( not ( = ?auto_138906 ?auto_138907 ) ) ( not ( = ?auto_138906 ?auto_138908 ) ) ( not ( = ?auto_138906 ?auto_138909 ) ) ( not ( = ?auto_138906 ?auto_138910 ) ) ( not ( = ?auto_138907 ?auto_138908 ) ) ( not ( = ?auto_138907 ?auto_138909 ) ) ( not ( = ?auto_138907 ?auto_138910 ) ) ( not ( = ?auto_138908 ?auto_138909 ) ) ( not ( = ?auto_138908 ?auto_138910 ) ) ( not ( = ?auto_138909 ?auto_138910 ) ) ( not ( = ?auto_138905 ?auto_138912 ) ) ( not ( = ?auto_138905 ?auto_138911 ) ) ( not ( = ?auto_138906 ?auto_138912 ) ) ( not ( = ?auto_138906 ?auto_138911 ) ) ( not ( = ?auto_138907 ?auto_138912 ) ) ( not ( = ?auto_138907 ?auto_138911 ) ) ( not ( = ?auto_138908 ?auto_138912 ) ) ( not ( = ?auto_138908 ?auto_138911 ) ) ( not ( = ?auto_138909 ?auto_138912 ) ) ( not ( = ?auto_138909 ?auto_138911 ) ) ( not ( = ?auto_138910 ?auto_138912 ) ) ( not ( = ?auto_138910 ?auto_138911 ) ) ( not ( = ?auto_138912 ?auto_138911 ) ) ( ON ?auto_138911 ?auto_138913 ) ( not ( = ?auto_138905 ?auto_138913 ) ) ( not ( = ?auto_138906 ?auto_138913 ) ) ( not ( = ?auto_138907 ?auto_138913 ) ) ( not ( = ?auto_138908 ?auto_138913 ) ) ( not ( = ?auto_138909 ?auto_138913 ) ) ( not ( = ?auto_138910 ?auto_138913 ) ) ( not ( = ?auto_138912 ?auto_138913 ) ) ( not ( = ?auto_138911 ?auto_138913 ) ) ( CLEAR ?auto_138910 ) ( ON ?auto_138912 ?auto_138911 ) ( CLEAR ?auto_138912 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_138913 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138913 ?auto_138911 )
      ( MAKE-5PILE ?auto_138905 ?auto_138906 ?auto_138907 ?auto_138908 ?auto_138909 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138932 - BLOCK
      ?auto_138933 - BLOCK
      ?auto_138934 - BLOCK
      ?auto_138935 - BLOCK
      ?auto_138936 - BLOCK
    )
    :vars
    (
      ?auto_138938 - BLOCK
      ?auto_138940 - BLOCK
      ?auto_138937 - BLOCK
      ?auto_138939 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138932 ) ( ON ?auto_138933 ?auto_138932 ) ( ON ?auto_138934 ?auto_138933 ) ( ON ?auto_138935 ?auto_138934 ) ( not ( = ?auto_138932 ?auto_138933 ) ) ( not ( = ?auto_138932 ?auto_138934 ) ) ( not ( = ?auto_138932 ?auto_138935 ) ) ( not ( = ?auto_138932 ?auto_138936 ) ) ( not ( = ?auto_138932 ?auto_138938 ) ) ( not ( = ?auto_138933 ?auto_138934 ) ) ( not ( = ?auto_138933 ?auto_138935 ) ) ( not ( = ?auto_138933 ?auto_138936 ) ) ( not ( = ?auto_138933 ?auto_138938 ) ) ( not ( = ?auto_138934 ?auto_138935 ) ) ( not ( = ?auto_138934 ?auto_138936 ) ) ( not ( = ?auto_138934 ?auto_138938 ) ) ( not ( = ?auto_138935 ?auto_138936 ) ) ( not ( = ?auto_138935 ?auto_138938 ) ) ( not ( = ?auto_138936 ?auto_138938 ) ) ( not ( = ?auto_138932 ?auto_138940 ) ) ( not ( = ?auto_138932 ?auto_138937 ) ) ( not ( = ?auto_138933 ?auto_138940 ) ) ( not ( = ?auto_138933 ?auto_138937 ) ) ( not ( = ?auto_138934 ?auto_138940 ) ) ( not ( = ?auto_138934 ?auto_138937 ) ) ( not ( = ?auto_138935 ?auto_138940 ) ) ( not ( = ?auto_138935 ?auto_138937 ) ) ( not ( = ?auto_138936 ?auto_138940 ) ) ( not ( = ?auto_138936 ?auto_138937 ) ) ( not ( = ?auto_138938 ?auto_138940 ) ) ( not ( = ?auto_138938 ?auto_138937 ) ) ( not ( = ?auto_138940 ?auto_138937 ) ) ( ON ?auto_138937 ?auto_138939 ) ( not ( = ?auto_138932 ?auto_138939 ) ) ( not ( = ?auto_138933 ?auto_138939 ) ) ( not ( = ?auto_138934 ?auto_138939 ) ) ( not ( = ?auto_138935 ?auto_138939 ) ) ( not ( = ?auto_138936 ?auto_138939 ) ) ( not ( = ?auto_138938 ?auto_138939 ) ) ( not ( = ?auto_138940 ?auto_138939 ) ) ( not ( = ?auto_138937 ?auto_138939 ) ) ( ON ?auto_138940 ?auto_138937 ) ( ON-TABLE ?auto_138939 ) ( ON ?auto_138938 ?auto_138940 ) ( CLEAR ?auto_138938 ) ( HOLDING ?auto_138936 ) ( CLEAR ?auto_138935 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138932 ?auto_138933 ?auto_138934 ?auto_138935 ?auto_138936 ?auto_138938 )
      ( MAKE-5PILE ?auto_138932 ?auto_138933 ?auto_138934 ?auto_138935 ?auto_138936 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138941 - BLOCK
      ?auto_138942 - BLOCK
      ?auto_138943 - BLOCK
      ?auto_138944 - BLOCK
      ?auto_138945 - BLOCK
    )
    :vars
    (
      ?auto_138949 - BLOCK
      ?auto_138948 - BLOCK
      ?auto_138946 - BLOCK
      ?auto_138947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138941 ) ( ON ?auto_138942 ?auto_138941 ) ( ON ?auto_138943 ?auto_138942 ) ( ON ?auto_138944 ?auto_138943 ) ( not ( = ?auto_138941 ?auto_138942 ) ) ( not ( = ?auto_138941 ?auto_138943 ) ) ( not ( = ?auto_138941 ?auto_138944 ) ) ( not ( = ?auto_138941 ?auto_138945 ) ) ( not ( = ?auto_138941 ?auto_138949 ) ) ( not ( = ?auto_138942 ?auto_138943 ) ) ( not ( = ?auto_138942 ?auto_138944 ) ) ( not ( = ?auto_138942 ?auto_138945 ) ) ( not ( = ?auto_138942 ?auto_138949 ) ) ( not ( = ?auto_138943 ?auto_138944 ) ) ( not ( = ?auto_138943 ?auto_138945 ) ) ( not ( = ?auto_138943 ?auto_138949 ) ) ( not ( = ?auto_138944 ?auto_138945 ) ) ( not ( = ?auto_138944 ?auto_138949 ) ) ( not ( = ?auto_138945 ?auto_138949 ) ) ( not ( = ?auto_138941 ?auto_138948 ) ) ( not ( = ?auto_138941 ?auto_138946 ) ) ( not ( = ?auto_138942 ?auto_138948 ) ) ( not ( = ?auto_138942 ?auto_138946 ) ) ( not ( = ?auto_138943 ?auto_138948 ) ) ( not ( = ?auto_138943 ?auto_138946 ) ) ( not ( = ?auto_138944 ?auto_138948 ) ) ( not ( = ?auto_138944 ?auto_138946 ) ) ( not ( = ?auto_138945 ?auto_138948 ) ) ( not ( = ?auto_138945 ?auto_138946 ) ) ( not ( = ?auto_138949 ?auto_138948 ) ) ( not ( = ?auto_138949 ?auto_138946 ) ) ( not ( = ?auto_138948 ?auto_138946 ) ) ( ON ?auto_138946 ?auto_138947 ) ( not ( = ?auto_138941 ?auto_138947 ) ) ( not ( = ?auto_138942 ?auto_138947 ) ) ( not ( = ?auto_138943 ?auto_138947 ) ) ( not ( = ?auto_138944 ?auto_138947 ) ) ( not ( = ?auto_138945 ?auto_138947 ) ) ( not ( = ?auto_138949 ?auto_138947 ) ) ( not ( = ?auto_138948 ?auto_138947 ) ) ( not ( = ?auto_138946 ?auto_138947 ) ) ( ON ?auto_138948 ?auto_138946 ) ( ON-TABLE ?auto_138947 ) ( ON ?auto_138949 ?auto_138948 ) ( CLEAR ?auto_138944 ) ( ON ?auto_138945 ?auto_138949 ) ( CLEAR ?auto_138945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138947 ?auto_138946 ?auto_138948 ?auto_138949 )
      ( MAKE-5PILE ?auto_138941 ?auto_138942 ?auto_138943 ?auto_138944 ?auto_138945 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138950 - BLOCK
      ?auto_138951 - BLOCK
      ?auto_138952 - BLOCK
      ?auto_138953 - BLOCK
      ?auto_138954 - BLOCK
    )
    :vars
    (
      ?auto_138958 - BLOCK
      ?auto_138957 - BLOCK
      ?auto_138955 - BLOCK
      ?auto_138956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138950 ) ( ON ?auto_138951 ?auto_138950 ) ( ON ?auto_138952 ?auto_138951 ) ( not ( = ?auto_138950 ?auto_138951 ) ) ( not ( = ?auto_138950 ?auto_138952 ) ) ( not ( = ?auto_138950 ?auto_138953 ) ) ( not ( = ?auto_138950 ?auto_138954 ) ) ( not ( = ?auto_138950 ?auto_138958 ) ) ( not ( = ?auto_138951 ?auto_138952 ) ) ( not ( = ?auto_138951 ?auto_138953 ) ) ( not ( = ?auto_138951 ?auto_138954 ) ) ( not ( = ?auto_138951 ?auto_138958 ) ) ( not ( = ?auto_138952 ?auto_138953 ) ) ( not ( = ?auto_138952 ?auto_138954 ) ) ( not ( = ?auto_138952 ?auto_138958 ) ) ( not ( = ?auto_138953 ?auto_138954 ) ) ( not ( = ?auto_138953 ?auto_138958 ) ) ( not ( = ?auto_138954 ?auto_138958 ) ) ( not ( = ?auto_138950 ?auto_138957 ) ) ( not ( = ?auto_138950 ?auto_138955 ) ) ( not ( = ?auto_138951 ?auto_138957 ) ) ( not ( = ?auto_138951 ?auto_138955 ) ) ( not ( = ?auto_138952 ?auto_138957 ) ) ( not ( = ?auto_138952 ?auto_138955 ) ) ( not ( = ?auto_138953 ?auto_138957 ) ) ( not ( = ?auto_138953 ?auto_138955 ) ) ( not ( = ?auto_138954 ?auto_138957 ) ) ( not ( = ?auto_138954 ?auto_138955 ) ) ( not ( = ?auto_138958 ?auto_138957 ) ) ( not ( = ?auto_138958 ?auto_138955 ) ) ( not ( = ?auto_138957 ?auto_138955 ) ) ( ON ?auto_138955 ?auto_138956 ) ( not ( = ?auto_138950 ?auto_138956 ) ) ( not ( = ?auto_138951 ?auto_138956 ) ) ( not ( = ?auto_138952 ?auto_138956 ) ) ( not ( = ?auto_138953 ?auto_138956 ) ) ( not ( = ?auto_138954 ?auto_138956 ) ) ( not ( = ?auto_138958 ?auto_138956 ) ) ( not ( = ?auto_138957 ?auto_138956 ) ) ( not ( = ?auto_138955 ?auto_138956 ) ) ( ON ?auto_138957 ?auto_138955 ) ( ON-TABLE ?auto_138956 ) ( ON ?auto_138958 ?auto_138957 ) ( ON ?auto_138954 ?auto_138958 ) ( CLEAR ?auto_138954 ) ( HOLDING ?auto_138953 ) ( CLEAR ?auto_138952 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_138950 ?auto_138951 ?auto_138952 ?auto_138953 )
      ( MAKE-5PILE ?auto_138950 ?auto_138951 ?auto_138952 ?auto_138953 ?auto_138954 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138959 - BLOCK
      ?auto_138960 - BLOCK
      ?auto_138961 - BLOCK
      ?auto_138962 - BLOCK
      ?auto_138963 - BLOCK
    )
    :vars
    (
      ?auto_138964 - BLOCK
      ?auto_138967 - BLOCK
      ?auto_138966 - BLOCK
      ?auto_138965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138959 ) ( ON ?auto_138960 ?auto_138959 ) ( ON ?auto_138961 ?auto_138960 ) ( not ( = ?auto_138959 ?auto_138960 ) ) ( not ( = ?auto_138959 ?auto_138961 ) ) ( not ( = ?auto_138959 ?auto_138962 ) ) ( not ( = ?auto_138959 ?auto_138963 ) ) ( not ( = ?auto_138959 ?auto_138964 ) ) ( not ( = ?auto_138960 ?auto_138961 ) ) ( not ( = ?auto_138960 ?auto_138962 ) ) ( not ( = ?auto_138960 ?auto_138963 ) ) ( not ( = ?auto_138960 ?auto_138964 ) ) ( not ( = ?auto_138961 ?auto_138962 ) ) ( not ( = ?auto_138961 ?auto_138963 ) ) ( not ( = ?auto_138961 ?auto_138964 ) ) ( not ( = ?auto_138962 ?auto_138963 ) ) ( not ( = ?auto_138962 ?auto_138964 ) ) ( not ( = ?auto_138963 ?auto_138964 ) ) ( not ( = ?auto_138959 ?auto_138967 ) ) ( not ( = ?auto_138959 ?auto_138966 ) ) ( not ( = ?auto_138960 ?auto_138967 ) ) ( not ( = ?auto_138960 ?auto_138966 ) ) ( not ( = ?auto_138961 ?auto_138967 ) ) ( not ( = ?auto_138961 ?auto_138966 ) ) ( not ( = ?auto_138962 ?auto_138967 ) ) ( not ( = ?auto_138962 ?auto_138966 ) ) ( not ( = ?auto_138963 ?auto_138967 ) ) ( not ( = ?auto_138963 ?auto_138966 ) ) ( not ( = ?auto_138964 ?auto_138967 ) ) ( not ( = ?auto_138964 ?auto_138966 ) ) ( not ( = ?auto_138967 ?auto_138966 ) ) ( ON ?auto_138966 ?auto_138965 ) ( not ( = ?auto_138959 ?auto_138965 ) ) ( not ( = ?auto_138960 ?auto_138965 ) ) ( not ( = ?auto_138961 ?auto_138965 ) ) ( not ( = ?auto_138962 ?auto_138965 ) ) ( not ( = ?auto_138963 ?auto_138965 ) ) ( not ( = ?auto_138964 ?auto_138965 ) ) ( not ( = ?auto_138967 ?auto_138965 ) ) ( not ( = ?auto_138966 ?auto_138965 ) ) ( ON ?auto_138967 ?auto_138966 ) ( ON-TABLE ?auto_138965 ) ( ON ?auto_138964 ?auto_138967 ) ( ON ?auto_138963 ?auto_138964 ) ( CLEAR ?auto_138961 ) ( ON ?auto_138962 ?auto_138963 ) ( CLEAR ?auto_138962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_138965 ?auto_138966 ?auto_138967 ?auto_138964 ?auto_138963 )
      ( MAKE-5PILE ?auto_138959 ?auto_138960 ?auto_138961 ?auto_138962 ?auto_138963 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138968 - BLOCK
      ?auto_138969 - BLOCK
      ?auto_138970 - BLOCK
      ?auto_138971 - BLOCK
      ?auto_138972 - BLOCK
    )
    :vars
    (
      ?auto_138976 - BLOCK
      ?auto_138974 - BLOCK
      ?auto_138975 - BLOCK
      ?auto_138973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138968 ) ( ON ?auto_138969 ?auto_138968 ) ( not ( = ?auto_138968 ?auto_138969 ) ) ( not ( = ?auto_138968 ?auto_138970 ) ) ( not ( = ?auto_138968 ?auto_138971 ) ) ( not ( = ?auto_138968 ?auto_138972 ) ) ( not ( = ?auto_138968 ?auto_138976 ) ) ( not ( = ?auto_138969 ?auto_138970 ) ) ( not ( = ?auto_138969 ?auto_138971 ) ) ( not ( = ?auto_138969 ?auto_138972 ) ) ( not ( = ?auto_138969 ?auto_138976 ) ) ( not ( = ?auto_138970 ?auto_138971 ) ) ( not ( = ?auto_138970 ?auto_138972 ) ) ( not ( = ?auto_138970 ?auto_138976 ) ) ( not ( = ?auto_138971 ?auto_138972 ) ) ( not ( = ?auto_138971 ?auto_138976 ) ) ( not ( = ?auto_138972 ?auto_138976 ) ) ( not ( = ?auto_138968 ?auto_138974 ) ) ( not ( = ?auto_138968 ?auto_138975 ) ) ( not ( = ?auto_138969 ?auto_138974 ) ) ( not ( = ?auto_138969 ?auto_138975 ) ) ( not ( = ?auto_138970 ?auto_138974 ) ) ( not ( = ?auto_138970 ?auto_138975 ) ) ( not ( = ?auto_138971 ?auto_138974 ) ) ( not ( = ?auto_138971 ?auto_138975 ) ) ( not ( = ?auto_138972 ?auto_138974 ) ) ( not ( = ?auto_138972 ?auto_138975 ) ) ( not ( = ?auto_138976 ?auto_138974 ) ) ( not ( = ?auto_138976 ?auto_138975 ) ) ( not ( = ?auto_138974 ?auto_138975 ) ) ( ON ?auto_138975 ?auto_138973 ) ( not ( = ?auto_138968 ?auto_138973 ) ) ( not ( = ?auto_138969 ?auto_138973 ) ) ( not ( = ?auto_138970 ?auto_138973 ) ) ( not ( = ?auto_138971 ?auto_138973 ) ) ( not ( = ?auto_138972 ?auto_138973 ) ) ( not ( = ?auto_138976 ?auto_138973 ) ) ( not ( = ?auto_138974 ?auto_138973 ) ) ( not ( = ?auto_138975 ?auto_138973 ) ) ( ON ?auto_138974 ?auto_138975 ) ( ON-TABLE ?auto_138973 ) ( ON ?auto_138976 ?auto_138974 ) ( ON ?auto_138972 ?auto_138976 ) ( ON ?auto_138971 ?auto_138972 ) ( CLEAR ?auto_138971 ) ( HOLDING ?auto_138970 ) ( CLEAR ?auto_138969 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_138968 ?auto_138969 ?auto_138970 )
      ( MAKE-5PILE ?auto_138968 ?auto_138969 ?auto_138970 ?auto_138971 ?auto_138972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138977 - BLOCK
      ?auto_138978 - BLOCK
      ?auto_138979 - BLOCK
      ?auto_138980 - BLOCK
      ?auto_138981 - BLOCK
    )
    :vars
    (
      ?auto_138982 - BLOCK
      ?auto_138983 - BLOCK
      ?auto_138984 - BLOCK
      ?auto_138985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138977 ) ( ON ?auto_138978 ?auto_138977 ) ( not ( = ?auto_138977 ?auto_138978 ) ) ( not ( = ?auto_138977 ?auto_138979 ) ) ( not ( = ?auto_138977 ?auto_138980 ) ) ( not ( = ?auto_138977 ?auto_138981 ) ) ( not ( = ?auto_138977 ?auto_138982 ) ) ( not ( = ?auto_138978 ?auto_138979 ) ) ( not ( = ?auto_138978 ?auto_138980 ) ) ( not ( = ?auto_138978 ?auto_138981 ) ) ( not ( = ?auto_138978 ?auto_138982 ) ) ( not ( = ?auto_138979 ?auto_138980 ) ) ( not ( = ?auto_138979 ?auto_138981 ) ) ( not ( = ?auto_138979 ?auto_138982 ) ) ( not ( = ?auto_138980 ?auto_138981 ) ) ( not ( = ?auto_138980 ?auto_138982 ) ) ( not ( = ?auto_138981 ?auto_138982 ) ) ( not ( = ?auto_138977 ?auto_138983 ) ) ( not ( = ?auto_138977 ?auto_138984 ) ) ( not ( = ?auto_138978 ?auto_138983 ) ) ( not ( = ?auto_138978 ?auto_138984 ) ) ( not ( = ?auto_138979 ?auto_138983 ) ) ( not ( = ?auto_138979 ?auto_138984 ) ) ( not ( = ?auto_138980 ?auto_138983 ) ) ( not ( = ?auto_138980 ?auto_138984 ) ) ( not ( = ?auto_138981 ?auto_138983 ) ) ( not ( = ?auto_138981 ?auto_138984 ) ) ( not ( = ?auto_138982 ?auto_138983 ) ) ( not ( = ?auto_138982 ?auto_138984 ) ) ( not ( = ?auto_138983 ?auto_138984 ) ) ( ON ?auto_138984 ?auto_138985 ) ( not ( = ?auto_138977 ?auto_138985 ) ) ( not ( = ?auto_138978 ?auto_138985 ) ) ( not ( = ?auto_138979 ?auto_138985 ) ) ( not ( = ?auto_138980 ?auto_138985 ) ) ( not ( = ?auto_138981 ?auto_138985 ) ) ( not ( = ?auto_138982 ?auto_138985 ) ) ( not ( = ?auto_138983 ?auto_138985 ) ) ( not ( = ?auto_138984 ?auto_138985 ) ) ( ON ?auto_138983 ?auto_138984 ) ( ON-TABLE ?auto_138985 ) ( ON ?auto_138982 ?auto_138983 ) ( ON ?auto_138981 ?auto_138982 ) ( ON ?auto_138980 ?auto_138981 ) ( CLEAR ?auto_138978 ) ( ON ?auto_138979 ?auto_138980 ) ( CLEAR ?auto_138979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_138985 ?auto_138984 ?auto_138983 ?auto_138982 ?auto_138981 ?auto_138980 )
      ( MAKE-5PILE ?auto_138977 ?auto_138978 ?auto_138979 ?auto_138980 ?auto_138981 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138986 - BLOCK
      ?auto_138987 - BLOCK
      ?auto_138988 - BLOCK
      ?auto_138989 - BLOCK
      ?auto_138990 - BLOCK
    )
    :vars
    (
      ?auto_138992 - BLOCK
      ?auto_138993 - BLOCK
      ?auto_138991 - BLOCK
      ?auto_138994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138986 ) ( not ( = ?auto_138986 ?auto_138987 ) ) ( not ( = ?auto_138986 ?auto_138988 ) ) ( not ( = ?auto_138986 ?auto_138989 ) ) ( not ( = ?auto_138986 ?auto_138990 ) ) ( not ( = ?auto_138986 ?auto_138992 ) ) ( not ( = ?auto_138987 ?auto_138988 ) ) ( not ( = ?auto_138987 ?auto_138989 ) ) ( not ( = ?auto_138987 ?auto_138990 ) ) ( not ( = ?auto_138987 ?auto_138992 ) ) ( not ( = ?auto_138988 ?auto_138989 ) ) ( not ( = ?auto_138988 ?auto_138990 ) ) ( not ( = ?auto_138988 ?auto_138992 ) ) ( not ( = ?auto_138989 ?auto_138990 ) ) ( not ( = ?auto_138989 ?auto_138992 ) ) ( not ( = ?auto_138990 ?auto_138992 ) ) ( not ( = ?auto_138986 ?auto_138993 ) ) ( not ( = ?auto_138986 ?auto_138991 ) ) ( not ( = ?auto_138987 ?auto_138993 ) ) ( not ( = ?auto_138987 ?auto_138991 ) ) ( not ( = ?auto_138988 ?auto_138993 ) ) ( not ( = ?auto_138988 ?auto_138991 ) ) ( not ( = ?auto_138989 ?auto_138993 ) ) ( not ( = ?auto_138989 ?auto_138991 ) ) ( not ( = ?auto_138990 ?auto_138993 ) ) ( not ( = ?auto_138990 ?auto_138991 ) ) ( not ( = ?auto_138992 ?auto_138993 ) ) ( not ( = ?auto_138992 ?auto_138991 ) ) ( not ( = ?auto_138993 ?auto_138991 ) ) ( ON ?auto_138991 ?auto_138994 ) ( not ( = ?auto_138986 ?auto_138994 ) ) ( not ( = ?auto_138987 ?auto_138994 ) ) ( not ( = ?auto_138988 ?auto_138994 ) ) ( not ( = ?auto_138989 ?auto_138994 ) ) ( not ( = ?auto_138990 ?auto_138994 ) ) ( not ( = ?auto_138992 ?auto_138994 ) ) ( not ( = ?auto_138993 ?auto_138994 ) ) ( not ( = ?auto_138991 ?auto_138994 ) ) ( ON ?auto_138993 ?auto_138991 ) ( ON-TABLE ?auto_138994 ) ( ON ?auto_138992 ?auto_138993 ) ( ON ?auto_138990 ?auto_138992 ) ( ON ?auto_138989 ?auto_138990 ) ( ON ?auto_138988 ?auto_138989 ) ( CLEAR ?auto_138988 ) ( HOLDING ?auto_138987 ) ( CLEAR ?auto_138986 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_138986 ?auto_138987 )
      ( MAKE-5PILE ?auto_138986 ?auto_138987 ?auto_138988 ?auto_138989 ?auto_138990 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_138995 - BLOCK
      ?auto_138996 - BLOCK
      ?auto_138997 - BLOCK
      ?auto_138998 - BLOCK
      ?auto_138999 - BLOCK
    )
    :vars
    (
      ?auto_139001 - BLOCK
      ?auto_139000 - BLOCK
      ?auto_139002 - BLOCK
      ?auto_139003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_138995 ) ( not ( = ?auto_138995 ?auto_138996 ) ) ( not ( = ?auto_138995 ?auto_138997 ) ) ( not ( = ?auto_138995 ?auto_138998 ) ) ( not ( = ?auto_138995 ?auto_138999 ) ) ( not ( = ?auto_138995 ?auto_139001 ) ) ( not ( = ?auto_138996 ?auto_138997 ) ) ( not ( = ?auto_138996 ?auto_138998 ) ) ( not ( = ?auto_138996 ?auto_138999 ) ) ( not ( = ?auto_138996 ?auto_139001 ) ) ( not ( = ?auto_138997 ?auto_138998 ) ) ( not ( = ?auto_138997 ?auto_138999 ) ) ( not ( = ?auto_138997 ?auto_139001 ) ) ( not ( = ?auto_138998 ?auto_138999 ) ) ( not ( = ?auto_138998 ?auto_139001 ) ) ( not ( = ?auto_138999 ?auto_139001 ) ) ( not ( = ?auto_138995 ?auto_139000 ) ) ( not ( = ?auto_138995 ?auto_139002 ) ) ( not ( = ?auto_138996 ?auto_139000 ) ) ( not ( = ?auto_138996 ?auto_139002 ) ) ( not ( = ?auto_138997 ?auto_139000 ) ) ( not ( = ?auto_138997 ?auto_139002 ) ) ( not ( = ?auto_138998 ?auto_139000 ) ) ( not ( = ?auto_138998 ?auto_139002 ) ) ( not ( = ?auto_138999 ?auto_139000 ) ) ( not ( = ?auto_138999 ?auto_139002 ) ) ( not ( = ?auto_139001 ?auto_139000 ) ) ( not ( = ?auto_139001 ?auto_139002 ) ) ( not ( = ?auto_139000 ?auto_139002 ) ) ( ON ?auto_139002 ?auto_139003 ) ( not ( = ?auto_138995 ?auto_139003 ) ) ( not ( = ?auto_138996 ?auto_139003 ) ) ( not ( = ?auto_138997 ?auto_139003 ) ) ( not ( = ?auto_138998 ?auto_139003 ) ) ( not ( = ?auto_138999 ?auto_139003 ) ) ( not ( = ?auto_139001 ?auto_139003 ) ) ( not ( = ?auto_139000 ?auto_139003 ) ) ( not ( = ?auto_139002 ?auto_139003 ) ) ( ON ?auto_139000 ?auto_139002 ) ( ON-TABLE ?auto_139003 ) ( ON ?auto_139001 ?auto_139000 ) ( ON ?auto_138999 ?auto_139001 ) ( ON ?auto_138998 ?auto_138999 ) ( ON ?auto_138997 ?auto_138998 ) ( CLEAR ?auto_138995 ) ( ON ?auto_138996 ?auto_138997 ) ( CLEAR ?auto_138996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139003 ?auto_139002 ?auto_139000 ?auto_139001 ?auto_138999 ?auto_138998 ?auto_138997 )
      ( MAKE-5PILE ?auto_138995 ?auto_138996 ?auto_138997 ?auto_138998 ?auto_138999 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139004 - BLOCK
      ?auto_139005 - BLOCK
      ?auto_139006 - BLOCK
      ?auto_139007 - BLOCK
      ?auto_139008 - BLOCK
    )
    :vars
    (
      ?auto_139012 - BLOCK
      ?auto_139009 - BLOCK
      ?auto_139010 - BLOCK
      ?auto_139011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139004 ?auto_139005 ) ) ( not ( = ?auto_139004 ?auto_139006 ) ) ( not ( = ?auto_139004 ?auto_139007 ) ) ( not ( = ?auto_139004 ?auto_139008 ) ) ( not ( = ?auto_139004 ?auto_139012 ) ) ( not ( = ?auto_139005 ?auto_139006 ) ) ( not ( = ?auto_139005 ?auto_139007 ) ) ( not ( = ?auto_139005 ?auto_139008 ) ) ( not ( = ?auto_139005 ?auto_139012 ) ) ( not ( = ?auto_139006 ?auto_139007 ) ) ( not ( = ?auto_139006 ?auto_139008 ) ) ( not ( = ?auto_139006 ?auto_139012 ) ) ( not ( = ?auto_139007 ?auto_139008 ) ) ( not ( = ?auto_139007 ?auto_139012 ) ) ( not ( = ?auto_139008 ?auto_139012 ) ) ( not ( = ?auto_139004 ?auto_139009 ) ) ( not ( = ?auto_139004 ?auto_139010 ) ) ( not ( = ?auto_139005 ?auto_139009 ) ) ( not ( = ?auto_139005 ?auto_139010 ) ) ( not ( = ?auto_139006 ?auto_139009 ) ) ( not ( = ?auto_139006 ?auto_139010 ) ) ( not ( = ?auto_139007 ?auto_139009 ) ) ( not ( = ?auto_139007 ?auto_139010 ) ) ( not ( = ?auto_139008 ?auto_139009 ) ) ( not ( = ?auto_139008 ?auto_139010 ) ) ( not ( = ?auto_139012 ?auto_139009 ) ) ( not ( = ?auto_139012 ?auto_139010 ) ) ( not ( = ?auto_139009 ?auto_139010 ) ) ( ON ?auto_139010 ?auto_139011 ) ( not ( = ?auto_139004 ?auto_139011 ) ) ( not ( = ?auto_139005 ?auto_139011 ) ) ( not ( = ?auto_139006 ?auto_139011 ) ) ( not ( = ?auto_139007 ?auto_139011 ) ) ( not ( = ?auto_139008 ?auto_139011 ) ) ( not ( = ?auto_139012 ?auto_139011 ) ) ( not ( = ?auto_139009 ?auto_139011 ) ) ( not ( = ?auto_139010 ?auto_139011 ) ) ( ON ?auto_139009 ?auto_139010 ) ( ON-TABLE ?auto_139011 ) ( ON ?auto_139012 ?auto_139009 ) ( ON ?auto_139008 ?auto_139012 ) ( ON ?auto_139007 ?auto_139008 ) ( ON ?auto_139006 ?auto_139007 ) ( ON ?auto_139005 ?auto_139006 ) ( CLEAR ?auto_139005 ) ( HOLDING ?auto_139004 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139004 )
      ( MAKE-5PILE ?auto_139004 ?auto_139005 ?auto_139006 ?auto_139007 ?auto_139008 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139013 - BLOCK
      ?auto_139014 - BLOCK
      ?auto_139015 - BLOCK
      ?auto_139016 - BLOCK
      ?auto_139017 - BLOCK
    )
    :vars
    (
      ?auto_139018 - BLOCK
      ?auto_139020 - BLOCK
      ?auto_139021 - BLOCK
      ?auto_139019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139013 ?auto_139014 ) ) ( not ( = ?auto_139013 ?auto_139015 ) ) ( not ( = ?auto_139013 ?auto_139016 ) ) ( not ( = ?auto_139013 ?auto_139017 ) ) ( not ( = ?auto_139013 ?auto_139018 ) ) ( not ( = ?auto_139014 ?auto_139015 ) ) ( not ( = ?auto_139014 ?auto_139016 ) ) ( not ( = ?auto_139014 ?auto_139017 ) ) ( not ( = ?auto_139014 ?auto_139018 ) ) ( not ( = ?auto_139015 ?auto_139016 ) ) ( not ( = ?auto_139015 ?auto_139017 ) ) ( not ( = ?auto_139015 ?auto_139018 ) ) ( not ( = ?auto_139016 ?auto_139017 ) ) ( not ( = ?auto_139016 ?auto_139018 ) ) ( not ( = ?auto_139017 ?auto_139018 ) ) ( not ( = ?auto_139013 ?auto_139020 ) ) ( not ( = ?auto_139013 ?auto_139021 ) ) ( not ( = ?auto_139014 ?auto_139020 ) ) ( not ( = ?auto_139014 ?auto_139021 ) ) ( not ( = ?auto_139015 ?auto_139020 ) ) ( not ( = ?auto_139015 ?auto_139021 ) ) ( not ( = ?auto_139016 ?auto_139020 ) ) ( not ( = ?auto_139016 ?auto_139021 ) ) ( not ( = ?auto_139017 ?auto_139020 ) ) ( not ( = ?auto_139017 ?auto_139021 ) ) ( not ( = ?auto_139018 ?auto_139020 ) ) ( not ( = ?auto_139018 ?auto_139021 ) ) ( not ( = ?auto_139020 ?auto_139021 ) ) ( ON ?auto_139021 ?auto_139019 ) ( not ( = ?auto_139013 ?auto_139019 ) ) ( not ( = ?auto_139014 ?auto_139019 ) ) ( not ( = ?auto_139015 ?auto_139019 ) ) ( not ( = ?auto_139016 ?auto_139019 ) ) ( not ( = ?auto_139017 ?auto_139019 ) ) ( not ( = ?auto_139018 ?auto_139019 ) ) ( not ( = ?auto_139020 ?auto_139019 ) ) ( not ( = ?auto_139021 ?auto_139019 ) ) ( ON ?auto_139020 ?auto_139021 ) ( ON-TABLE ?auto_139019 ) ( ON ?auto_139018 ?auto_139020 ) ( ON ?auto_139017 ?auto_139018 ) ( ON ?auto_139016 ?auto_139017 ) ( ON ?auto_139015 ?auto_139016 ) ( ON ?auto_139014 ?auto_139015 ) ( ON ?auto_139013 ?auto_139014 ) ( CLEAR ?auto_139013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139019 ?auto_139021 ?auto_139020 ?auto_139018 ?auto_139017 ?auto_139016 ?auto_139015 ?auto_139014 )
      ( MAKE-5PILE ?auto_139013 ?auto_139014 ?auto_139015 ?auto_139016 ?auto_139017 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139025 - BLOCK
      ?auto_139026 - BLOCK
      ?auto_139027 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_139027 ) ( CLEAR ?auto_139026 ) ( ON-TABLE ?auto_139025 ) ( ON ?auto_139026 ?auto_139025 ) ( not ( = ?auto_139025 ?auto_139026 ) ) ( not ( = ?auto_139025 ?auto_139027 ) ) ( not ( = ?auto_139026 ?auto_139027 ) ) )
    :subtasks
    ( ( !STACK ?auto_139027 ?auto_139026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139028 - BLOCK
      ?auto_139029 - BLOCK
      ?auto_139030 - BLOCK
    )
    :vars
    (
      ?auto_139031 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139029 ) ( ON-TABLE ?auto_139028 ) ( ON ?auto_139029 ?auto_139028 ) ( not ( = ?auto_139028 ?auto_139029 ) ) ( not ( = ?auto_139028 ?auto_139030 ) ) ( not ( = ?auto_139029 ?auto_139030 ) ) ( ON ?auto_139030 ?auto_139031 ) ( CLEAR ?auto_139030 ) ( HAND-EMPTY ) ( not ( = ?auto_139028 ?auto_139031 ) ) ( not ( = ?auto_139029 ?auto_139031 ) ) ( not ( = ?auto_139030 ?auto_139031 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139030 ?auto_139031 )
      ( MAKE-3PILE ?auto_139028 ?auto_139029 ?auto_139030 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139032 - BLOCK
      ?auto_139033 - BLOCK
      ?auto_139034 - BLOCK
    )
    :vars
    (
      ?auto_139035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139032 ) ( not ( = ?auto_139032 ?auto_139033 ) ) ( not ( = ?auto_139032 ?auto_139034 ) ) ( not ( = ?auto_139033 ?auto_139034 ) ) ( ON ?auto_139034 ?auto_139035 ) ( CLEAR ?auto_139034 ) ( not ( = ?auto_139032 ?auto_139035 ) ) ( not ( = ?auto_139033 ?auto_139035 ) ) ( not ( = ?auto_139034 ?auto_139035 ) ) ( HOLDING ?auto_139033 ) ( CLEAR ?auto_139032 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139032 ?auto_139033 )
      ( MAKE-3PILE ?auto_139032 ?auto_139033 ?auto_139034 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139036 - BLOCK
      ?auto_139037 - BLOCK
      ?auto_139038 - BLOCK
    )
    :vars
    (
      ?auto_139039 - BLOCK
      ?auto_139042 - BLOCK
      ?auto_139040 - BLOCK
      ?auto_139041 - BLOCK
      ?auto_139043 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139036 ) ( not ( = ?auto_139036 ?auto_139037 ) ) ( not ( = ?auto_139036 ?auto_139038 ) ) ( not ( = ?auto_139037 ?auto_139038 ) ) ( ON ?auto_139038 ?auto_139039 ) ( not ( = ?auto_139036 ?auto_139039 ) ) ( not ( = ?auto_139037 ?auto_139039 ) ) ( not ( = ?auto_139038 ?auto_139039 ) ) ( CLEAR ?auto_139036 ) ( ON ?auto_139037 ?auto_139038 ) ( CLEAR ?auto_139037 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139042 ) ( ON ?auto_139040 ?auto_139042 ) ( ON ?auto_139041 ?auto_139040 ) ( ON ?auto_139043 ?auto_139041 ) ( ON ?auto_139039 ?auto_139043 ) ( not ( = ?auto_139042 ?auto_139040 ) ) ( not ( = ?auto_139042 ?auto_139041 ) ) ( not ( = ?auto_139042 ?auto_139043 ) ) ( not ( = ?auto_139042 ?auto_139039 ) ) ( not ( = ?auto_139042 ?auto_139038 ) ) ( not ( = ?auto_139042 ?auto_139037 ) ) ( not ( = ?auto_139040 ?auto_139041 ) ) ( not ( = ?auto_139040 ?auto_139043 ) ) ( not ( = ?auto_139040 ?auto_139039 ) ) ( not ( = ?auto_139040 ?auto_139038 ) ) ( not ( = ?auto_139040 ?auto_139037 ) ) ( not ( = ?auto_139041 ?auto_139043 ) ) ( not ( = ?auto_139041 ?auto_139039 ) ) ( not ( = ?auto_139041 ?auto_139038 ) ) ( not ( = ?auto_139041 ?auto_139037 ) ) ( not ( = ?auto_139043 ?auto_139039 ) ) ( not ( = ?auto_139043 ?auto_139038 ) ) ( not ( = ?auto_139043 ?auto_139037 ) ) ( not ( = ?auto_139036 ?auto_139042 ) ) ( not ( = ?auto_139036 ?auto_139040 ) ) ( not ( = ?auto_139036 ?auto_139041 ) ) ( not ( = ?auto_139036 ?auto_139043 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139042 ?auto_139040 ?auto_139041 ?auto_139043 ?auto_139039 ?auto_139038 )
      ( MAKE-3PILE ?auto_139036 ?auto_139037 ?auto_139038 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139044 - BLOCK
      ?auto_139045 - BLOCK
      ?auto_139046 - BLOCK
    )
    :vars
    (
      ?auto_139049 - BLOCK
      ?auto_139048 - BLOCK
      ?auto_139051 - BLOCK
      ?auto_139047 - BLOCK
      ?auto_139050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139044 ?auto_139045 ) ) ( not ( = ?auto_139044 ?auto_139046 ) ) ( not ( = ?auto_139045 ?auto_139046 ) ) ( ON ?auto_139046 ?auto_139049 ) ( not ( = ?auto_139044 ?auto_139049 ) ) ( not ( = ?auto_139045 ?auto_139049 ) ) ( not ( = ?auto_139046 ?auto_139049 ) ) ( ON ?auto_139045 ?auto_139046 ) ( CLEAR ?auto_139045 ) ( ON-TABLE ?auto_139048 ) ( ON ?auto_139051 ?auto_139048 ) ( ON ?auto_139047 ?auto_139051 ) ( ON ?auto_139050 ?auto_139047 ) ( ON ?auto_139049 ?auto_139050 ) ( not ( = ?auto_139048 ?auto_139051 ) ) ( not ( = ?auto_139048 ?auto_139047 ) ) ( not ( = ?auto_139048 ?auto_139050 ) ) ( not ( = ?auto_139048 ?auto_139049 ) ) ( not ( = ?auto_139048 ?auto_139046 ) ) ( not ( = ?auto_139048 ?auto_139045 ) ) ( not ( = ?auto_139051 ?auto_139047 ) ) ( not ( = ?auto_139051 ?auto_139050 ) ) ( not ( = ?auto_139051 ?auto_139049 ) ) ( not ( = ?auto_139051 ?auto_139046 ) ) ( not ( = ?auto_139051 ?auto_139045 ) ) ( not ( = ?auto_139047 ?auto_139050 ) ) ( not ( = ?auto_139047 ?auto_139049 ) ) ( not ( = ?auto_139047 ?auto_139046 ) ) ( not ( = ?auto_139047 ?auto_139045 ) ) ( not ( = ?auto_139050 ?auto_139049 ) ) ( not ( = ?auto_139050 ?auto_139046 ) ) ( not ( = ?auto_139050 ?auto_139045 ) ) ( not ( = ?auto_139044 ?auto_139048 ) ) ( not ( = ?auto_139044 ?auto_139051 ) ) ( not ( = ?auto_139044 ?auto_139047 ) ) ( not ( = ?auto_139044 ?auto_139050 ) ) ( HOLDING ?auto_139044 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139044 )
      ( MAKE-3PILE ?auto_139044 ?auto_139045 ?auto_139046 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139052 - BLOCK
      ?auto_139053 - BLOCK
      ?auto_139054 - BLOCK
    )
    :vars
    (
      ?auto_139057 - BLOCK
      ?auto_139055 - BLOCK
      ?auto_139056 - BLOCK
      ?auto_139058 - BLOCK
      ?auto_139059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139052 ?auto_139053 ) ) ( not ( = ?auto_139052 ?auto_139054 ) ) ( not ( = ?auto_139053 ?auto_139054 ) ) ( ON ?auto_139054 ?auto_139057 ) ( not ( = ?auto_139052 ?auto_139057 ) ) ( not ( = ?auto_139053 ?auto_139057 ) ) ( not ( = ?auto_139054 ?auto_139057 ) ) ( ON ?auto_139053 ?auto_139054 ) ( ON-TABLE ?auto_139055 ) ( ON ?auto_139056 ?auto_139055 ) ( ON ?auto_139058 ?auto_139056 ) ( ON ?auto_139059 ?auto_139058 ) ( ON ?auto_139057 ?auto_139059 ) ( not ( = ?auto_139055 ?auto_139056 ) ) ( not ( = ?auto_139055 ?auto_139058 ) ) ( not ( = ?auto_139055 ?auto_139059 ) ) ( not ( = ?auto_139055 ?auto_139057 ) ) ( not ( = ?auto_139055 ?auto_139054 ) ) ( not ( = ?auto_139055 ?auto_139053 ) ) ( not ( = ?auto_139056 ?auto_139058 ) ) ( not ( = ?auto_139056 ?auto_139059 ) ) ( not ( = ?auto_139056 ?auto_139057 ) ) ( not ( = ?auto_139056 ?auto_139054 ) ) ( not ( = ?auto_139056 ?auto_139053 ) ) ( not ( = ?auto_139058 ?auto_139059 ) ) ( not ( = ?auto_139058 ?auto_139057 ) ) ( not ( = ?auto_139058 ?auto_139054 ) ) ( not ( = ?auto_139058 ?auto_139053 ) ) ( not ( = ?auto_139059 ?auto_139057 ) ) ( not ( = ?auto_139059 ?auto_139054 ) ) ( not ( = ?auto_139059 ?auto_139053 ) ) ( not ( = ?auto_139052 ?auto_139055 ) ) ( not ( = ?auto_139052 ?auto_139056 ) ) ( not ( = ?auto_139052 ?auto_139058 ) ) ( not ( = ?auto_139052 ?auto_139059 ) ) ( ON ?auto_139052 ?auto_139053 ) ( CLEAR ?auto_139052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139055 ?auto_139056 ?auto_139058 ?auto_139059 ?auto_139057 ?auto_139054 ?auto_139053 )
      ( MAKE-3PILE ?auto_139052 ?auto_139053 ?auto_139054 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139060 - BLOCK
      ?auto_139061 - BLOCK
      ?auto_139062 - BLOCK
    )
    :vars
    (
      ?auto_139066 - BLOCK
      ?auto_139067 - BLOCK
      ?auto_139063 - BLOCK
      ?auto_139065 - BLOCK
      ?auto_139064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139060 ?auto_139061 ) ) ( not ( = ?auto_139060 ?auto_139062 ) ) ( not ( = ?auto_139061 ?auto_139062 ) ) ( ON ?auto_139062 ?auto_139066 ) ( not ( = ?auto_139060 ?auto_139066 ) ) ( not ( = ?auto_139061 ?auto_139066 ) ) ( not ( = ?auto_139062 ?auto_139066 ) ) ( ON ?auto_139061 ?auto_139062 ) ( ON-TABLE ?auto_139067 ) ( ON ?auto_139063 ?auto_139067 ) ( ON ?auto_139065 ?auto_139063 ) ( ON ?auto_139064 ?auto_139065 ) ( ON ?auto_139066 ?auto_139064 ) ( not ( = ?auto_139067 ?auto_139063 ) ) ( not ( = ?auto_139067 ?auto_139065 ) ) ( not ( = ?auto_139067 ?auto_139064 ) ) ( not ( = ?auto_139067 ?auto_139066 ) ) ( not ( = ?auto_139067 ?auto_139062 ) ) ( not ( = ?auto_139067 ?auto_139061 ) ) ( not ( = ?auto_139063 ?auto_139065 ) ) ( not ( = ?auto_139063 ?auto_139064 ) ) ( not ( = ?auto_139063 ?auto_139066 ) ) ( not ( = ?auto_139063 ?auto_139062 ) ) ( not ( = ?auto_139063 ?auto_139061 ) ) ( not ( = ?auto_139065 ?auto_139064 ) ) ( not ( = ?auto_139065 ?auto_139066 ) ) ( not ( = ?auto_139065 ?auto_139062 ) ) ( not ( = ?auto_139065 ?auto_139061 ) ) ( not ( = ?auto_139064 ?auto_139066 ) ) ( not ( = ?auto_139064 ?auto_139062 ) ) ( not ( = ?auto_139064 ?auto_139061 ) ) ( not ( = ?auto_139060 ?auto_139067 ) ) ( not ( = ?auto_139060 ?auto_139063 ) ) ( not ( = ?auto_139060 ?auto_139065 ) ) ( not ( = ?auto_139060 ?auto_139064 ) ) ( HOLDING ?auto_139060 ) ( CLEAR ?auto_139061 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139067 ?auto_139063 ?auto_139065 ?auto_139064 ?auto_139066 ?auto_139062 ?auto_139061 ?auto_139060 )
      ( MAKE-3PILE ?auto_139060 ?auto_139061 ?auto_139062 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139068 - BLOCK
      ?auto_139069 - BLOCK
      ?auto_139070 - BLOCK
    )
    :vars
    (
      ?auto_139072 - BLOCK
      ?auto_139073 - BLOCK
      ?auto_139071 - BLOCK
      ?auto_139074 - BLOCK
      ?auto_139075 - BLOCK
      ?auto_139076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139068 ?auto_139069 ) ) ( not ( = ?auto_139068 ?auto_139070 ) ) ( not ( = ?auto_139069 ?auto_139070 ) ) ( ON ?auto_139070 ?auto_139072 ) ( not ( = ?auto_139068 ?auto_139072 ) ) ( not ( = ?auto_139069 ?auto_139072 ) ) ( not ( = ?auto_139070 ?auto_139072 ) ) ( ON ?auto_139069 ?auto_139070 ) ( ON-TABLE ?auto_139073 ) ( ON ?auto_139071 ?auto_139073 ) ( ON ?auto_139074 ?auto_139071 ) ( ON ?auto_139075 ?auto_139074 ) ( ON ?auto_139072 ?auto_139075 ) ( not ( = ?auto_139073 ?auto_139071 ) ) ( not ( = ?auto_139073 ?auto_139074 ) ) ( not ( = ?auto_139073 ?auto_139075 ) ) ( not ( = ?auto_139073 ?auto_139072 ) ) ( not ( = ?auto_139073 ?auto_139070 ) ) ( not ( = ?auto_139073 ?auto_139069 ) ) ( not ( = ?auto_139071 ?auto_139074 ) ) ( not ( = ?auto_139071 ?auto_139075 ) ) ( not ( = ?auto_139071 ?auto_139072 ) ) ( not ( = ?auto_139071 ?auto_139070 ) ) ( not ( = ?auto_139071 ?auto_139069 ) ) ( not ( = ?auto_139074 ?auto_139075 ) ) ( not ( = ?auto_139074 ?auto_139072 ) ) ( not ( = ?auto_139074 ?auto_139070 ) ) ( not ( = ?auto_139074 ?auto_139069 ) ) ( not ( = ?auto_139075 ?auto_139072 ) ) ( not ( = ?auto_139075 ?auto_139070 ) ) ( not ( = ?auto_139075 ?auto_139069 ) ) ( not ( = ?auto_139068 ?auto_139073 ) ) ( not ( = ?auto_139068 ?auto_139071 ) ) ( not ( = ?auto_139068 ?auto_139074 ) ) ( not ( = ?auto_139068 ?auto_139075 ) ) ( CLEAR ?auto_139069 ) ( ON ?auto_139068 ?auto_139076 ) ( CLEAR ?auto_139068 ) ( HAND-EMPTY ) ( not ( = ?auto_139068 ?auto_139076 ) ) ( not ( = ?auto_139069 ?auto_139076 ) ) ( not ( = ?auto_139070 ?auto_139076 ) ) ( not ( = ?auto_139072 ?auto_139076 ) ) ( not ( = ?auto_139073 ?auto_139076 ) ) ( not ( = ?auto_139071 ?auto_139076 ) ) ( not ( = ?auto_139074 ?auto_139076 ) ) ( not ( = ?auto_139075 ?auto_139076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139068 ?auto_139076 )
      ( MAKE-3PILE ?auto_139068 ?auto_139069 ?auto_139070 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139077 - BLOCK
      ?auto_139078 - BLOCK
      ?auto_139079 - BLOCK
    )
    :vars
    (
      ?auto_139082 - BLOCK
      ?auto_139084 - BLOCK
      ?auto_139085 - BLOCK
      ?auto_139081 - BLOCK
      ?auto_139080 - BLOCK
      ?auto_139083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139077 ?auto_139078 ) ) ( not ( = ?auto_139077 ?auto_139079 ) ) ( not ( = ?auto_139078 ?auto_139079 ) ) ( ON ?auto_139079 ?auto_139082 ) ( not ( = ?auto_139077 ?auto_139082 ) ) ( not ( = ?auto_139078 ?auto_139082 ) ) ( not ( = ?auto_139079 ?auto_139082 ) ) ( ON-TABLE ?auto_139084 ) ( ON ?auto_139085 ?auto_139084 ) ( ON ?auto_139081 ?auto_139085 ) ( ON ?auto_139080 ?auto_139081 ) ( ON ?auto_139082 ?auto_139080 ) ( not ( = ?auto_139084 ?auto_139085 ) ) ( not ( = ?auto_139084 ?auto_139081 ) ) ( not ( = ?auto_139084 ?auto_139080 ) ) ( not ( = ?auto_139084 ?auto_139082 ) ) ( not ( = ?auto_139084 ?auto_139079 ) ) ( not ( = ?auto_139084 ?auto_139078 ) ) ( not ( = ?auto_139085 ?auto_139081 ) ) ( not ( = ?auto_139085 ?auto_139080 ) ) ( not ( = ?auto_139085 ?auto_139082 ) ) ( not ( = ?auto_139085 ?auto_139079 ) ) ( not ( = ?auto_139085 ?auto_139078 ) ) ( not ( = ?auto_139081 ?auto_139080 ) ) ( not ( = ?auto_139081 ?auto_139082 ) ) ( not ( = ?auto_139081 ?auto_139079 ) ) ( not ( = ?auto_139081 ?auto_139078 ) ) ( not ( = ?auto_139080 ?auto_139082 ) ) ( not ( = ?auto_139080 ?auto_139079 ) ) ( not ( = ?auto_139080 ?auto_139078 ) ) ( not ( = ?auto_139077 ?auto_139084 ) ) ( not ( = ?auto_139077 ?auto_139085 ) ) ( not ( = ?auto_139077 ?auto_139081 ) ) ( not ( = ?auto_139077 ?auto_139080 ) ) ( ON ?auto_139077 ?auto_139083 ) ( CLEAR ?auto_139077 ) ( not ( = ?auto_139077 ?auto_139083 ) ) ( not ( = ?auto_139078 ?auto_139083 ) ) ( not ( = ?auto_139079 ?auto_139083 ) ) ( not ( = ?auto_139082 ?auto_139083 ) ) ( not ( = ?auto_139084 ?auto_139083 ) ) ( not ( = ?auto_139085 ?auto_139083 ) ) ( not ( = ?auto_139081 ?auto_139083 ) ) ( not ( = ?auto_139080 ?auto_139083 ) ) ( HOLDING ?auto_139078 ) ( CLEAR ?auto_139079 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139084 ?auto_139085 ?auto_139081 ?auto_139080 ?auto_139082 ?auto_139079 ?auto_139078 )
      ( MAKE-3PILE ?auto_139077 ?auto_139078 ?auto_139079 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139086 - BLOCK
      ?auto_139087 - BLOCK
      ?auto_139088 - BLOCK
    )
    :vars
    (
      ?auto_139094 - BLOCK
      ?auto_139090 - BLOCK
      ?auto_139091 - BLOCK
      ?auto_139092 - BLOCK
      ?auto_139089 - BLOCK
      ?auto_139093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139086 ?auto_139087 ) ) ( not ( = ?auto_139086 ?auto_139088 ) ) ( not ( = ?auto_139087 ?auto_139088 ) ) ( ON ?auto_139088 ?auto_139094 ) ( not ( = ?auto_139086 ?auto_139094 ) ) ( not ( = ?auto_139087 ?auto_139094 ) ) ( not ( = ?auto_139088 ?auto_139094 ) ) ( ON-TABLE ?auto_139090 ) ( ON ?auto_139091 ?auto_139090 ) ( ON ?auto_139092 ?auto_139091 ) ( ON ?auto_139089 ?auto_139092 ) ( ON ?auto_139094 ?auto_139089 ) ( not ( = ?auto_139090 ?auto_139091 ) ) ( not ( = ?auto_139090 ?auto_139092 ) ) ( not ( = ?auto_139090 ?auto_139089 ) ) ( not ( = ?auto_139090 ?auto_139094 ) ) ( not ( = ?auto_139090 ?auto_139088 ) ) ( not ( = ?auto_139090 ?auto_139087 ) ) ( not ( = ?auto_139091 ?auto_139092 ) ) ( not ( = ?auto_139091 ?auto_139089 ) ) ( not ( = ?auto_139091 ?auto_139094 ) ) ( not ( = ?auto_139091 ?auto_139088 ) ) ( not ( = ?auto_139091 ?auto_139087 ) ) ( not ( = ?auto_139092 ?auto_139089 ) ) ( not ( = ?auto_139092 ?auto_139094 ) ) ( not ( = ?auto_139092 ?auto_139088 ) ) ( not ( = ?auto_139092 ?auto_139087 ) ) ( not ( = ?auto_139089 ?auto_139094 ) ) ( not ( = ?auto_139089 ?auto_139088 ) ) ( not ( = ?auto_139089 ?auto_139087 ) ) ( not ( = ?auto_139086 ?auto_139090 ) ) ( not ( = ?auto_139086 ?auto_139091 ) ) ( not ( = ?auto_139086 ?auto_139092 ) ) ( not ( = ?auto_139086 ?auto_139089 ) ) ( ON ?auto_139086 ?auto_139093 ) ( not ( = ?auto_139086 ?auto_139093 ) ) ( not ( = ?auto_139087 ?auto_139093 ) ) ( not ( = ?auto_139088 ?auto_139093 ) ) ( not ( = ?auto_139094 ?auto_139093 ) ) ( not ( = ?auto_139090 ?auto_139093 ) ) ( not ( = ?auto_139091 ?auto_139093 ) ) ( not ( = ?auto_139092 ?auto_139093 ) ) ( not ( = ?auto_139089 ?auto_139093 ) ) ( CLEAR ?auto_139088 ) ( ON ?auto_139087 ?auto_139086 ) ( CLEAR ?auto_139087 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139093 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139093 ?auto_139086 )
      ( MAKE-3PILE ?auto_139086 ?auto_139087 ?auto_139088 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139095 - BLOCK
      ?auto_139096 - BLOCK
      ?auto_139097 - BLOCK
    )
    :vars
    (
      ?auto_139103 - BLOCK
      ?auto_139098 - BLOCK
      ?auto_139099 - BLOCK
      ?auto_139100 - BLOCK
      ?auto_139102 - BLOCK
      ?auto_139101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139095 ?auto_139096 ) ) ( not ( = ?auto_139095 ?auto_139097 ) ) ( not ( = ?auto_139096 ?auto_139097 ) ) ( not ( = ?auto_139095 ?auto_139103 ) ) ( not ( = ?auto_139096 ?auto_139103 ) ) ( not ( = ?auto_139097 ?auto_139103 ) ) ( ON-TABLE ?auto_139098 ) ( ON ?auto_139099 ?auto_139098 ) ( ON ?auto_139100 ?auto_139099 ) ( ON ?auto_139102 ?auto_139100 ) ( ON ?auto_139103 ?auto_139102 ) ( not ( = ?auto_139098 ?auto_139099 ) ) ( not ( = ?auto_139098 ?auto_139100 ) ) ( not ( = ?auto_139098 ?auto_139102 ) ) ( not ( = ?auto_139098 ?auto_139103 ) ) ( not ( = ?auto_139098 ?auto_139097 ) ) ( not ( = ?auto_139098 ?auto_139096 ) ) ( not ( = ?auto_139099 ?auto_139100 ) ) ( not ( = ?auto_139099 ?auto_139102 ) ) ( not ( = ?auto_139099 ?auto_139103 ) ) ( not ( = ?auto_139099 ?auto_139097 ) ) ( not ( = ?auto_139099 ?auto_139096 ) ) ( not ( = ?auto_139100 ?auto_139102 ) ) ( not ( = ?auto_139100 ?auto_139103 ) ) ( not ( = ?auto_139100 ?auto_139097 ) ) ( not ( = ?auto_139100 ?auto_139096 ) ) ( not ( = ?auto_139102 ?auto_139103 ) ) ( not ( = ?auto_139102 ?auto_139097 ) ) ( not ( = ?auto_139102 ?auto_139096 ) ) ( not ( = ?auto_139095 ?auto_139098 ) ) ( not ( = ?auto_139095 ?auto_139099 ) ) ( not ( = ?auto_139095 ?auto_139100 ) ) ( not ( = ?auto_139095 ?auto_139102 ) ) ( ON ?auto_139095 ?auto_139101 ) ( not ( = ?auto_139095 ?auto_139101 ) ) ( not ( = ?auto_139096 ?auto_139101 ) ) ( not ( = ?auto_139097 ?auto_139101 ) ) ( not ( = ?auto_139103 ?auto_139101 ) ) ( not ( = ?auto_139098 ?auto_139101 ) ) ( not ( = ?auto_139099 ?auto_139101 ) ) ( not ( = ?auto_139100 ?auto_139101 ) ) ( not ( = ?auto_139102 ?auto_139101 ) ) ( ON ?auto_139096 ?auto_139095 ) ( CLEAR ?auto_139096 ) ( ON-TABLE ?auto_139101 ) ( HOLDING ?auto_139097 ) ( CLEAR ?auto_139103 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139098 ?auto_139099 ?auto_139100 ?auto_139102 ?auto_139103 ?auto_139097 )
      ( MAKE-3PILE ?auto_139095 ?auto_139096 ?auto_139097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139104 - BLOCK
      ?auto_139105 - BLOCK
      ?auto_139106 - BLOCK
    )
    :vars
    (
      ?auto_139111 - BLOCK
      ?auto_139109 - BLOCK
      ?auto_139112 - BLOCK
      ?auto_139110 - BLOCK
      ?auto_139108 - BLOCK
      ?auto_139107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139104 ?auto_139105 ) ) ( not ( = ?auto_139104 ?auto_139106 ) ) ( not ( = ?auto_139105 ?auto_139106 ) ) ( not ( = ?auto_139104 ?auto_139111 ) ) ( not ( = ?auto_139105 ?auto_139111 ) ) ( not ( = ?auto_139106 ?auto_139111 ) ) ( ON-TABLE ?auto_139109 ) ( ON ?auto_139112 ?auto_139109 ) ( ON ?auto_139110 ?auto_139112 ) ( ON ?auto_139108 ?auto_139110 ) ( ON ?auto_139111 ?auto_139108 ) ( not ( = ?auto_139109 ?auto_139112 ) ) ( not ( = ?auto_139109 ?auto_139110 ) ) ( not ( = ?auto_139109 ?auto_139108 ) ) ( not ( = ?auto_139109 ?auto_139111 ) ) ( not ( = ?auto_139109 ?auto_139106 ) ) ( not ( = ?auto_139109 ?auto_139105 ) ) ( not ( = ?auto_139112 ?auto_139110 ) ) ( not ( = ?auto_139112 ?auto_139108 ) ) ( not ( = ?auto_139112 ?auto_139111 ) ) ( not ( = ?auto_139112 ?auto_139106 ) ) ( not ( = ?auto_139112 ?auto_139105 ) ) ( not ( = ?auto_139110 ?auto_139108 ) ) ( not ( = ?auto_139110 ?auto_139111 ) ) ( not ( = ?auto_139110 ?auto_139106 ) ) ( not ( = ?auto_139110 ?auto_139105 ) ) ( not ( = ?auto_139108 ?auto_139111 ) ) ( not ( = ?auto_139108 ?auto_139106 ) ) ( not ( = ?auto_139108 ?auto_139105 ) ) ( not ( = ?auto_139104 ?auto_139109 ) ) ( not ( = ?auto_139104 ?auto_139112 ) ) ( not ( = ?auto_139104 ?auto_139110 ) ) ( not ( = ?auto_139104 ?auto_139108 ) ) ( ON ?auto_139104 ?auto_139107 ) ( not ( = ?auto_139104 ?auto_139107 ) ) ( not ( = ?auto_139105 ?auto_139107 ) ) ( not ( = ?auto_139106 ?auto_139107 ) ) ( not ( = ?auto_139111 ?auto_139107 ) ) ( not ( = ?auto_139109 ?auto_139107 ) ) ( not ( = ?auto_139112 ?auto_139107 ) ) ( not ( = ?auto_139110 ?auto_139107 ) ) ( not ( = ?auto_139108 ?auto_139107 ) ) ( ON ?auto_139105 ?auto_139104 ) ( ON-TABLE ?auto_139107 ) ( CLEAR ?auto_139111 ) ( ON ?auto_139106 ?auto_139105 ) ( CLEAR ?auto_139106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139107 ?auto_139104 ?auto_139105 )
      ( MAKE-3PILE ?auto_139104 ?auto_139105 ?auto_139106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139113 - BLOCK
      ?auto_139114 - BLOCK
      ?auto_139115 - BLOCK
    )
    :vars
    (
      ?auto_139119 - BLOCK
      ?auto_139116 - BLOCK
      ?auto_139117 - BLOCK
      ?auto_139120 - BLOCK
      ?auto_139118 - BLOCK
      ?auto_139121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139113 ?auto_139114 ) ) ( not ( = ?auto_139113 ?auto_139115 ) ) ( not ( = ?auto_139114 ?auto_139115 ) ) ( not ( = ?auto_139113 ?auto_139119 ) ) ( not ( = ?auto_139114 ?auto_139119 ) ) ( not ( = ?auto_139115 ?auto_139119 ) ) ( ON-TABLE ?auto_139116 ) ( ON ?auto_139117 ?auto_139116 ) ( ON ?auto_139120 ?auto_139117 ) ( ON ?auto_139118 ?auto_139120 ) ( not ( = ?auto_139116 ?auto_139117 ) ) ( not ( = ?auto_139116 ?auto_139120 ) ) ( not ( = ?auto_139116 ?auto_139118 ) ) ( not ( = ?auto_139116 ?auto_139119 ) ) ( not ( = ?auto_139116 ?auto_139115 ) ) ( not ( = ?auto_139116 ?auto_139114 ) ) ( not ( = ?auto_139117 ?auto_139120 ) ) ( not ( = ?auto_139117 ?auto_139118 ) ) ( not ( = ?auto_139117 ?auto_139119 ) ) ( not ( = ?auto_139117 ?auto_139115 ) ) ( not ( = ?auto_139117 ?auto_139114 ) ) ( not ( = ?auto_139120 ?auto_139118 ) ) ( not ( = ?auto_139120 ?auto_139119 ) ) ( not ( = ?auto_139120 ?auto_139115 ) ) ( not ( = ?auto_139120 ?auto_139114 ) ) ( not ( = ?auto_139118 ?auto_139119 ) ) ( not ( = ?auto_139118 ?auto_139115 ) ) ( not ( = ?auto_139118 ?auto_139114 ) ) ( not ( = ?auto_139113 ?auto_139116 ) ) ( not ( = ?auto_139113 ?auto_139117 ) ) ( not ( = ?auto_139113 ?auto_139120 ) ) ( not ( = ?auto_139113 ?auto_139118 ) ) ( ON ?auto_139113 ?auto_139121 ) ( not ( = ?auto_139113 ?auto_139121 ) ) ( not ( = ?auto_139114 ?auto_139121 ) ) ( not ( = ?auto_139115 ?auto_139121 ) ) ( not ( = ?auto_139119 ?auto_139121 ) ) ( not ( = ?auto_139116 ?auto_139121 ) ) ( not ( = ?auto_139117 ?auto_139121 ) ) ( not ( = ?auto_139120 ?auto_139121 ) ) ( not ( = ?auto_139118 ?auto_139121 ) ) ( ON ?auto_139114 ?auto_139113 ) ( ON-TABLE ?auto_139121 ) ( ON ?auto_139115 ?auto_139114 ) ( CLEAR ?auto_139115 ) ( HOLDING ?auto_139119 ) ( CLEAR ?auto_139118 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139116 ?auto_139117 ?auto_139120 ?auto_139118 ?auto_139119 )
      ( MAKE-3PILE ?auto_139113 ?auto_139114 ?auto_139115 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139122 - BLOCK
      ?auto_139123 - BLOCK
      ?auto_139124 - BLOCK
    )
    :vars
    (
      ?auto_139129 - BLOCK
      ?auto_139128 - BLOCK
      ?auto_139125 - BLOCK
      ?auto_139127 - BLOCK
      ?auto_139126 - BLOCK
      ?auto_139130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139122 ?auto_139123 ) ) ( not ( = ?auto_139122 ?auto_139124 ) ) ( not ( = ?auto_139123 ?auto_139124 ) ) ( not ( = ?auto_139122 ?auto_139129 ) ) ( not ( = ?auto_139123 ?auto_139129 ) ) ( not ( = ?auto_139124 ?auto_139129 ) ) ( ON-TABLE ?auto_139128 ) ( ON ?auto_139125 ?auto_139128 ) ( ON ?auto_139127 ?auto_139125 ) ( ON ?auto_139126 ?auto_139127 ) ( not ( = ?auto_139128 ?auto_139125 ) ) ( not ( = ?auto_139128 ?auto_139127 ) ) ( not ( = ?auto_139128 ?auto_139126 ) ) ( not ( = ?auto_139128 ?auto_139129 ) ) ( not ( = ?auto_139128 ?auto_139124 ) ) ( not ( = ?auto_139128 ?auto_139123 ) ) ( not ( = ?auto_139125 ?auto_139127 ) ) ( not ( = ?auto_139125 ?auto_139126 ) ) ( not ( = ?auto_139125 ?auto_139129 ) ) ( not ( = ?auto_139125 ?auto_139124 ) ) ( not ( = ?auto_139125 ?auto_139123 ) ) ( not ( = ?auto_139127 ?auto_139126 ) ) ( not ( = ?auto_139127 ?auto_139129 ) ) ( not ( = ?auto_139127 ?auto_139124 ) ) ( not ( = ?auto_139127 ?auto_139123 ) ) ( not ( = ?auto_139126 ?auto_139129 ) ) ( not ( = ?auto_139126 ?auto_139124 ) ) ( not ( = ?auto_139126 ?auto_139123 ) ) ( not ( = ?auto_139122 ?auto_139128 ) ) ( not ( = ?auto_139122 ?auto_139125 ) ) ( not ( = ?auto_139122 ?auto_139127 ) ) ( not ( = ?auto_139122 ?auto_139126 ) ) ( ON ?auto_139122 ?auto_139130 ) ( not ( = ?auto_139122 ?auto_139130 ) ) ( not ( = ?auto_139123 ?auto_139130 ) ) ( not ( = ?auto_139124 ?auto_139130 ) ) ( not ( = ?auto_139129 ?auto_139130 ) ) ( not ( = ?auto_139128 ?auto_139130 ) ) ( not ( = ?auto_139125 ?auto_139130 ) ) ( not ( = ?auto_139127 ?auto_139130 ) ) ( not ( = ?auto_139126 ?auto_139130 ) ) ( ON ?auto_139123 ?auto_139122 ) ( ON-TABLE ?auto_139130 ) ( ON ?auto_139124 ?auto_139123 ) ( CLEAR ?auto_139126 ) ( ON ?auto_139129 ?auto_139124 ) ( CLEAR ?auto_139129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139130 ?auto_139122 ?auto_139123 ?auto_139124 )
      ( MAKE-3PILE ?auto_139122 ?auto_139123 ?auto_139124 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139131 - BLOCK
      ?auto_139132 - BLOCK
      ?auto_139133 - BLOCK
    )
    :vars
    (
      ?auto_139138 - BLOCK
      ?auto_139137 - BLOCK
      ?auto_139136 - BLOCK
      ?auto_139139 - BLOCK
      ?auto_139134 - BLOCK
      ?auto_139135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139131 ?auto_139132 ) ) ( not ( = ?auto_139131 ?auto_139133 ) ) ( not ( = ?auto_139132 ?auto_139133 ) ) ( not ( = ?auto_139131 ?auto_139138 ) ) ( not ( = ?auto_139132 ?auto_139138 ) ) ( not ( = ?auto_139133 ?auto_139138 ) ) ( ON-TABLE ?auto_139137 ) ( ON ?auto_139136 ?auto_139137 ) ( ON ?auto_139139 ?auto_139136 ) ( not ( = ?auto_139137 ?auto_139136 ) ) ( not ( = ?auto_139137 ?auto_139139 ) ) ( not ( = ?auto_139137 ?auto_139134 ) ) ( not ( = ?auto_139137 ?auto_139138 ) ) ( not ( = ?auto_139137 ?auto_139133 ) ) ( not ( = ?auto_139137 ?auto_139132 ) ) ( not ( = ?auto_139136 ?auto_139139 ) ) ( not ( = ?auto_139136 ?auto_139134 ) ) ( not ( = ?auto_139136 ?auto_139138 ) ) ( not ( = ?auto_139136 ?auto_139133 ) ) ( not ( = ?auto_139136 ?auto_139132 ) ) ( not ( = ?auto_139139 ?auto_139134 ) ) ( not ( = ?auto_139139 ?auto_139138 ) ) ( not ( = ?auto_139139 ?auto_139133 ) ) ( not ( = ?auto_139139 ?auto_139132 ) ) ( not ( = ?auto_139134 ?auto_139138 ) ) ( not ( = ?auto_139134 ?auto_139133 ) ) ( not ( = ?auto_139134 ?auto_139132 ) ) ( not ( = ?auto_139131 ?auto_139137 ) ) ( not ( = ?auto_139131 ?auto_139136 ) ) ( not ( = ?auto_139131 ?auto_139139 ) ) ( not ( = ?auto_139131 ?auto_139134 ) ) ( ON ?auto_139131 ?auto_139135 ) ( not ( = ?auto_139131 ?auto_139135 ) ) ( not ( = ?auto_139132 ?auto_139135 ) ) ( not ( = ?auto_139133 ?auto_139135 ) ) ( not ( = ?auto_139138 ?auto_139135 ) ) ( not ( = ?auto_139137 ?auto_139135 ) ) ( not ( = ?auto_139136 ?auto_139135 ) ) ( not ( = ?auto_139139 ?auto_139135 ) ) ( not ( = ?auto_139134 ?auto_139135 ) ) ( ON ?auto_139132 ?auto_139131 ) ( ON-TABLE ?auto_139135 ) ( ON ?auto_139133 ?auto_139132 ) ( ON ?auto_139138 ?auto_139133 ) ( CLEAR ?auto_139138 ) ( HOLDING ?auto_139134 ) ( CLEAR ?auto_139139 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139137 ?auto_139136 ?auto_139139 ?auto_139134 )
      ( MAKE-3PILE ?auto_139131 ?auto_139132 ?auto_139133 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139140 - BLOCK
      ?auto_139141 - BLOCK
      ?auto_139142 - BLOCK
    )
    :vars
    (
      ?auto_139143 - BLOCK
      ?auto_139145 - BLOCK
      ?auto_139147 - BLOCK
      ?auto_139144 - BLOCK
      ?auto_139148 - BLOCK
      ?auto_139146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139140 ?auto_139141 ) ) ( not ( = ?auto_139140 ?auto_139142 ) ) ( not ( = ?auto_139141 ?auto_139142 ) ) ( not ( = ?auto_139140 ?auto_139143 ) ) ( not ( = ?auto_139141 ?auto_139143 ) ) ( not ( = ?auto_139142 ?auto_139143 ) ) ( ON-TABLE ?auto_139145 ) ( ON ?auto_139147 ?auto_139145 ) ( ON ?auto_139144 ?auto_139147 ) ( not ( = ?auto_139145 ?auto_139147 ) ) ( not ( = ?auto_139145 ?auto_139144 ) ) ( not ( = ?auto_139145 ?auto_139148 ) ) ( not ( = ?auto_139145 ?auto_139143 ) ) ( not ( = ?auto_139145 ?auto_139142 ) ) ( not ( = ?auto_139145 ?auto_139141 ) ) ( not ( = ?auto_139147 ?auto_139144 ) ) ( not ( = ?auto_139147 ?auto_139148 ) ) ( not ( = ?auto_139147 ?auto_139143 ) ) ( not ( = ?auto_139147 ?auto_139142 ) ) ( not ( = ?auto_139147 ?auto_139141 ) ) ( not ( = ?auto_139144 ?auto_139148 ) ) ( not ( = ?auto_139144 ?auto_139143 ) ) ( not ( = ?auto_139144 ?auto_139142 ) ) ( not ( = ?auto_139144 ?auto_139141 ) ) ( not ( = ?auto_139148 ?auto_139143 ) ) ( not ( = ?auto_139148 ?auto_139142 ) ) ( not ( = ?auto_139148 ?auto_139141 ) ) ( not ( = ?auto_139140 ?auto_139145 ) ) ( not ( = ?auto_139140 ?auto_139147 ) ) ( not ( = ?auto_139140 ?auto_139144 ) ) ( not ( = ?auto_139140 ?auto_139148 ) ) ( ON ?auto_139140 ?auto_139146 ) ( not ( = ?auto_139140 ?auto_139146 ) ) ( not ( = ?auto_139141 ?auto_139146 ) ) ( not ( = ?auto_139142 ?auto_139146 ) ) ( not ( = ?auto_139143 ?auto_139146 ) ) ( not ( = ?auto_139145 ?auto_139146 ) ) ( not ( = ?auto_139147 ?auto_139146 ) ) ( not ( = ?auto_139144 ?auto_139146 ) ) ( not ( = ?auto_139148 ?auto_139146 ) ) ( ON ?auto_139141 ?auto_139140 ) ( ON-TABLE ?auto_139146 ) ( ON ?auto_139142 ?auto_139141 ) ( ON ?auto_139143 ?auto_139142 ) ( CLEAR ?auto_139144 ) ( ON ?auto_139148 ?auto_139143 ) ( CLEAR ?auto_139148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139146 ?auto_139140 ?auto_139141 ?auto_139142 ?auto_139143 )
      ( MAKE-3PILE ?auto_139140 ?auto_139141 ?auto_139142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139149 - BLOCK
      ?auto_139150 - BLOCK
      ?auto_139151 - BLOCK
    )
    :vars
    (
      ?auto_139154 - BLOCK
      ?auto_139157 - BLOCK
      ?auto_139156 - BLOCK
      ?auto_139152 - BLOCK
      ?auto_139153 - BLOCK
      ?auto_139155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139149 ?auto_139150 ) ) ( not ( = ?auto_139149 ?auto_139151 ) ) ( not ( = ?auto_139150 ?auto_139151 ) ) ( not ( = ?auto_139149 ?auto_139154 ) ) ( not ( = ?auto_139150 ?auto_139154 ) ) ( not ( = ?auto_139151 ?auto_139154 ) ) ( ON-TABLE ?auto_139157 ) ( ON ?auto_139156 ?auto_139157 ) ( not ( = ?auto_139157 ?auto_139156 ) ) ( not ( = ?auto_139157 ?auto_139152 ) ) ( not ( = ?auto_139157 ?auto_139153 ) ) ( not ( = ?auto_139157 ?auto_139154 ) ) ( not ( = ?auto_139157 ?auto_139151 ) ) ( not ( = ?auto_139157 ?auto_139150 ) ) ( not ( = ?auto_139156 ?auto_139152 ) ) ( not ( = ?auto_139156 ?auto_139153 ) ) ( not ( = ?auto_139156 ?auto_139154 ) ) ( not ( = ?auto_139156 ?auto_139151 ) ) ( not ( = ?auto_139156 ?auto_139150 ) ) ( not ( = ?auto_139152 ?auto_139153 ) ) ( not ( = ?auto_139152 ?auto_139154 ) ) ( not ( = ?auto_139152 ?auto_139151 ) ) ( not ( = ?auto_139152 ?auto_139150 ) ) ( not ( = ?auto_139153 ?auto_139154 ) ) ( not ( = ?auto_139153 ?auto_139151 ) ) ( not ( = ?auto_139153 ?auto_139150 ) ) ( not ( = ?auto_139149 ?auto_139157 ) ) ( not ( = ?auto_139149 ?auto_139156 ) ) ( not ( = ?auto_139149 ?auto_139152 ) ) ( not ( = ?auto_139149 ?auto_139153 ) ) ( ON ?auto_139149 ?auto_139155 ) ( not ( = ?auto_139149 ?auto_139155 ) ) ( not ( = ?auto_139150 ?auto_139155 ) ) ( not ( = ?auto_139151 ?auto_139155 ) ) ( not ( = ?auto_139154 ?auto_139155 ) ) ( not ( = ?auto_139157 ?auto_139155 ) ) ( not ( = ?auto_139156 ?auto_139155 ) ) ( not ( = ?auto_139152 ?auto_139155 ) ) ( not ( = ?auto_139153 ?auto_139155 ) ) ( ON ?auto_139150 ?auto_139149 ) ( ON-TABLE ?auto_139155 ) ( ON ?auto_139151 ?auto_139150 ) ( ON ?auto_139154 ?auto_139151 ) ( ON ?auto_139153 ?auto_139154 ) ( CLEAR ?auto_139153 ) ( HOLDING ?auto_139152 ) ( CLEAR ?auto_139156 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139157 ?auto_139156 ?auto_139152 )
      ( MAKE-3PILE ?auto_139149 ?auto_139150 ?auto_139151 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139158 - BLOCK
      ?auto_139159 - BLOCK
      ?auto_139160 - BLOCK
    )
    :vars
    (
      ?auto_139161 - BLOCK
      ?auto_139163 - BLOCK
      ?auto_139164 - BLOCK
      ?auto_139165 - BLOCK
      ?auto_139162 - BLOCK
      ?auto_139166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139158 ?auto_139159 ) ) ( not ( = ?auto_139158 ?auto_139160 ) ) ( not ( = ?auto_139159 ?auto_139160 ) ) ( not ( = ?auto_139158 ?auto_139161 ) ) ( not ( = ?auto_139159 ?auto_139161 ) ) ( not ( = ?auto_139160 ?auto_139161 ) ) ( ON-TABLE ?auto_139163 ) ( ON ?auto_139164 ?auto_139163 ) ( not ( = ?auto_139163 ?auto_139164 ) ) ( not ( = ?auto_139163 ?auto_139165 ) ) ( not ( = ?auto_139163 ?auto_139162 ) ) ( not ( = ?auto_139163 ?auto_139161 ) ) ( not ( = ?auto_139163 ?auto_139160 ) ) ( not ( = ?auto_139163 ?auto_139159 ) ) ( not ( = ?auto_139164 ?auto_139165 ) ) ( not ( = ?auto_139164 ?auto_139162 ) ) ( not ( = ?auto_139164 ?auto_139161 ) ) ( not ( = ?auto_139164 ?auto_139160 ) ) ( not ( = ?auto_139164 ?auto_139159 ) ) ( not ( = ?auto_139165 ?auto_139162 ) ) ( not ( = ?auto_139165 ?auto_139161 ) ) ( not ( = ?auto_139165 ?auto_139160 ) ) ( not ( = ?auto_139165 ?auto_139159 ) ) ( not ( = ?auto_139162 ?auto_139161 ) ) ( not ( = ?auto_139162 ?auto_139160 ) ) ( not ( = ?auto_139162 ?auto_139159 ) ) ( not ( = ?auto_139158 ?auto_139163 ) ) ( not ( = ?auto_139158 ?auto_139164 ) ) ( not ( = ?auto_139158 ?auto_139165 ) ) ( not ( = ?auto_139158 ?auto_139162 ) ) ( ON ?auto_139158 ?auto_139166 ) ( not ( = ?auto_139158 ?auto_139166 ) ) ( not ( = ?auto_139159 ?auto_139166 ) ) ( not ( = ?auto_139160 ?auto_139166 ) ) ( not ( = ?auto_139161 ?auto_139166 ) ) ( not ( = ?auto_139163 ?auto_139166 ) ) ( not ( = ?auto_139164 ?auto_139166 ) ) ( not ( = ?auto_139165 ?auto_139166 ) ) ( not ( = ?auto_139162 ?auto_139166 ) ) ( ON ?auto_139159 ?auto_139158 ) ( ON-TABLE ?auto_139166 ) ( ON ?auto_139160 ?auto_139159 ) ( ON ?auto_139161 ?auto_139160 ) ( ON ?auto_139162 ?auto_139161 ) ( CLEAR ?auto_139164 ) ( ON ?auto_139165 ?auto_139162 ) ( CLEAR ?auto_139165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139166 ?auto_139158 ?auto_139159 ?auto_139160 ?auto_139161 ?auto_139162 )
      ( MAKE-3PILE ?auto_139158 ?auto_139159 ?auto_139160 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139167 - BLOCK
      ?auto_139168 - BLOCK
      ?auto_139169 - BLOCK
    )
    :vars
    (
      ?auto_139172 - BLOCK
      ?auto_139175 - BLOCK
      ?auto_139170 - BLOCK
      ?auto_139174 - BLOCK
      ?auto_139171 - BLOCK
      ?auto_139173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139167 ?auto_139168 ) ) ( not ( = ?auto_139167 ?auto_139169 ) ) ( not ( = ?auto_139168 ?auto_139169 ) ) ( not ( = ?auto_139167 ?auto_139172 ) ) ( not ( = ?auto_139168 ?auto_139172 ) ) ( not ( = ?auto_139169 ?auto_139172 ) ) ( ON-TABLE ?auto_139175 ) ( not ( = ?auto_139175 ?auto_139170 ) ) ( not ( = ?auto_139175 ?auto_139174 ) ) ( not ( = ?auto_139175 ?auto_139171 ) ) ( not ( = ?auto_139175 ?auto_139172 ) ) ( not ( = ?auto_139175 ?auto_139169 ) ) ( not ( = ?auto_139175 ?auto_139168 ) ) ( not ( = ?auto_139170 ?auto_139174 ) ) ( not ( = ?auto_139170 ?auto_139171 ) ) ( not ( = ?auto_139170 ?auto_139172 ) ) ( not ( = ?auto_139170 ?auto_139169 ) ) ( not ( = ?auto_139170 ?auto_139168 ) ) ( not ( = ?auto_139174 ?auto_139171 ) ) ( not ( = ?auto_139174 ?auto_139172 ) ) ( not ( = ?auto_139174 ?auto_139169 ) ) ( not ( = ?auto_139174 ?auto_139168 ) ) ( not ( = ?auto_139171 ?auto_139172 ) ) ( not ( = ?auto_139171 ?auto_139169 ) ) ( not ( = ?auto_139171 ?auto_139168 ) ) ( not ( = ?auto_139167 ?auto_139175 ) ) ( not ( = ?auto_139167 ?auto_139170 ) ) ( not ( = ?auto_139167 ?auto_139174 ) ) ( not ( = ?auto_139167 ?auto_139171 ) ) ( ON ?auto_139167 ?auto_139173 ) ( not ( = ?auto_139167 ?auto_139173 ) ) ( not ( = ?auto_139168 ?auto_139173 ) ) ( not ( = ?auto_139169 ?auto_139173 ) ) ( not ( = ?auto_139172 ?auto_139173 ) ) ( not ( = ?auto_139175 ?auto_139173 ) ) ( not ( = ?auto_139170 ?auto_139173 ) ) ( not ( = ?auto_139174 ?auto_139173 ) ) ( not ( = ?auto_139171 ?auto_139173 ) ) ( ON ?auto_139168 ?auto_139167 ) ( ON-TABLE ?auto_139173 ) ( ON ?auto_139169 ?auto_139168 ) ( ON ?auto_139172 ?auto_139169 ) ( ON ?auto_139171 ?auto_139172 ) ( ON ?auto_139174 ?auto_139171 ) ( CLEAR ?auto_139174 ) ( HOLDING ?auto_139170 ) ( CLEAR ?auto_139175 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139175 ?auto_139170 )
      ( MAKE-3PILE ?auto_139167 ?auto_139168 ?auto_139169 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139176 - BLOCK
      ?auto_139177 - BLOCK
      ?auto_139178 - BLOCK
    )
    :vars
    (
      ?auto_139180 - BLOCK
      ?auto_139179 - BLOCK
      ?auto_139183 - BLOCK
      ?auto_139184 - BLOCK
      ?auto_139181 - BLOCK
      ?auto_139182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139176 ?auto_139177 ) ) ( not ( = ?auto_139176 ?auto_139178 ) ) ( not ( = ?auto_139177 ?auto_139178 ) ) ( not ( = ?auto_139176 ?auto_139180 ) ) ( not ( = ?auto_139177 ?auto_139180 ) ) ( not ( = ?auto_139178 ?auto_139180 ) ) ( ON-TABLE ?auto_139179 ) ( not ( = ?auto_139179 ?auto_139183 ) ) ( not ( = ?auto_139179 ?auto_139184 ) ) ( not ( = ?auto_139179 ?auto_139181 ) ) ( not ( = ?auto_139179 ?auto_139180 ) ) ( not ( = ?auto_139179 ?auto_139178 ) ) ( not ( = ?auto_139179 ?auto_139177 ) ) ( not ( = ?auto_139183 ?auto_139184 ) ) ( not ( = ?auto_139183 ?auto_139181 ) ) ( not ( = ?auto_139183 ?auto_139180 ) ) ( not ( = ?auto_139183 ?auto_139178 ) ) ( not ( = ?auto_139183 ?auto_139177 ) ) ( not ( = ?auto_139184 ?auto_139181 ) ) ( not ( = ?auto_139184 ?auto_139180 ) ) ( not ( = ?auto_139184 ?auto_139178 ) ) ( not ( = ?auto_139184 ?auto_139177 ) ) ( not ( = ?auto_139181 ?auto_139180 ) ) ( not ( = ?auto_139181 ?auto_139178 ) ) ( not ( = ?auto_139181 ?auto_139177 ) ) ( not ( = ?auto_139176 ?auto_139179 ) ) ( not ( = ?auto_139176 ?auto_139183 ) ) ( not ( = ?auto_139176 ?auto_139184 ) ) ( not ( = ?auto_139176 ?auto_139181 ) ) ( ON ?auto_139176 ?auto_139182 ) ( not ( = ?auto_139176 ?auto_139182 ) ) ( not ( = ?auto_139177 ?auto_139182 ) ) ( not ( = ?auto_139178 ?auto_139182 ) ) ( not ( = ?auto_139180 ?auto_139182 ) ) ( not ( = ?auto_139179 ?auto_139182 ) ) ( not ( = ?auto_139183 ?auto_139182 ) ) ( not ( = ?auto_139184 ?auto_139182 ) ) ( not ( = ?auto_139181 ?auto_139182 ) ) ( ON ?auto_139177 ?auto_139176 ) ( ON-TABLE ?auto_139182 ) ( ON ?auto_139178 ?auto_139177 ) ( ON ?auto_139180 ?auto_139178 ) ( ON ?auto_139181 ?auto_139180 ) ( ON ?auto_139184 ?auto_139181 ) ( CLEAR ?auto_139179 ) ( ON ?auto_139183 ?auto_139184 ) ( CLEAR ?auto_139183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139182 ?auto_139176 ?auto_139177 ?auto_139178 ?auto_139180 ?auto_139181 ?auto_139184 )
      ( MAKE-3PILE ?auto_139176 ?auto_139177 ?auto_139178 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139185 - BLOCK
      ?auto_139186 - BLOCK
      ?auto_139187 - BLOCK
    )
    :vars
    (
      ?auto_139191 - BLOCK
      ?auto_139188 - BLOCK
      ?auto_139189 - BLOCK
      ?auto_139193 - BLOCK
      ?auto_139192 - BLOCK
      ?auto_139190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139185 ?auto_139186 ) ) ( not ( = ?auto_139185 ?auto_139187 ) ) ( not ( = ?auto_139186 ?auto_139187 ) ) ( not ( = ?auto_139185 ?auto_139191 ) ) ( not ( = ?auto_139186 ?auto_139191 ) ) ( not ( = ?auto_139187 ?auto_139191 ) ) ( not ( = ?auto_139188 ?auto_139189 ) ) ( not ( = ?auto_139188 ?auto_139193 ) ) ( not ( = ?auto_139188 ?auto_139192 ) ) ( not ( = ?auto_139188 ?auto_139191 ) ) ( not ( = ?auto_139188 ?auto_139187 ) ) ( not ( = ?auto_139188 ?auto_139186 ) ) ( not ( = ?auto_139189 ?auto_139193 ) ) ( not ( = ?auto_139189 ?auto_139192 ) ) ( not ( = ?auto_139189 ?auto_139191 ) ) ( not ( = ?auto_139189 ?auto_139187 ) ) ( not ( = ?auto_139189 ?auto_139186 ) ) ( not ( = ?auto_139193 ?auto_139192 ) ) ( not ( = ?auto_139193 ?auto_139191 ) ) ( not ( = ?auto_139193 ?auto_139187 ) ) ( not ( = ?auto_139193 ?auto_139186 ) ) ( not ( = ?auto_139192 ?auto_139191 ) ) ( not ( = ?auto_139192 ?auto_139187 ) ) ( not ( = ?auto_139192 ?auto_139186 ) ) ( not ( = ?auto_139185 ?auto_139188 ) ) ( not ( = ?auto_139185 ?auto_139189 ) ) ( not ( = ?auto_139185 ?auto_139193 ) ) ( not ( = ?auto_139185 ?auto_139192 ) ) ( ON ?auto_139185 ?auto_139190 ) ( not ( = ?auto_139185 ?auto_139190 ) ) ( not ( = ?auto_139186 ?auto_139190 ) ) ( not ( = ?auto_139187 ?auto_139190 ) ) ( not ( = ?auto_139191 ?auto_139190 ) ) ( not ( = ?auto_139188 ?auto_139190 ) ) ( not ( = ?auto_139189 ?auto_139190 ) ) ( not ( = ?auto_139193 ?auto_139190 ) ) ( not ( = ?auto_139192 ?auto_139190 ) ) ( ON ?auto_139186 ?auto_139185 ) ( ON-TABLE ?auto_139190 ) ( ON ?auto_139187 ?auto_139186 ) ( ON ?auto_139191 ?auto_139187 ) ( ON ?auto_139192 ?auto_139191 ) ( ON ?auto_139193 ?auto_139192 ) ( ON ?auto_139189 ?auto_139193 ) ( CLEAR ?auto_139189 ) ( HOLDING ?auto_139188 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139188 )
      ( MAKE-3PILE ?auto_139185 ?auto_139186 ?auto_139187 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139194 - BLOCK
      ?auto_139195 - BLOCK
      ?auto_139196 - BLOCK
    )
    :vars
    (
      ?auto_139202 - BLOCK
      ?auto_139199 - BLOCK
      ?auto_139197 - BLOCK
      ?auto_139201 - BLOCK
      ?auto_139198 - BLOCK
      ?auto_139200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139194 ?auto_139195 ) ) ( not ( = ?auto_139194 ?auto_139196 ) ) ( not ( = ?auto_139195 ?auto_139196 ) ) ( not ( = ?auto_139194 ?auto_139202 ) ) ( not ( = ?auto_139195 ?auto_139202 ) ) ( not ( = ?auto_139196 ?auto_139202 ) ) ( not ( = ?auto_139199 ?auto_139197 ) ) ( not ( = ?auto_139199 ?auto_139201 ) ) ( not ( = ?auto_139199 ?auto_139198 ) ) ( not ( = ?auto_139199 ?auto_139202 ) ) ( not ( = ?auto_139199 ?auto_139196 ) ) ( not ( = ?auto_139199 ?auto_139195 ) ) ( not ( = ?auto_139197 ?auto_139201 ) ) ( not ( = ?auto_139197 ?auto_139198 ) ) ( not ( = ?auto_139197 ?auto_139202 ) ) ( not ( = ?auto_139197 ?auto_139196 ) ) ( not ( = ?auto_139197 ?auto_139195 ) ) ( not ( = ?auto_139201 ?auto_139198 ) ) ( not ( = ?auto_139201 ?auto_139202 ) ) ( not ( = ?auto_139201 ?auto_139196 ) ) ( not ( = ?auto_139201 ?auto_139195 ) ) ( not ( = ?auto_139198 ?auto_139202 ) ) ( not ( = ?auto_139198 ?auto_139196 ) ) ( not ( = ?auto_139198 ?auto_139195 ) ) ( not ( = ?auto_139194 ?auto_139199 ) ) ( not ( = ?auto_139194 ?auto_139197 ) ) ( not ( = ?auto_139194 ?auto_139201 ) ) ( not ( = ?auto_139194 ?auto_139198 ) ) ( ON ?auto_139194 ?auto_139200 ) ( not ( = ?auto_139194 ?auto_139200 ) ) ( not ( = ?auto_139195 ?auto_139200 ) ) ( not ( = ?auto_139196 ?auto_139200 ) ) ( not ( = ?auto_139202 ?auto_139200 ) ) ( not ( = ?auto_139199 ?auto_139200 ) ) ( not ( = ?auto_139197 ?auto_139200 ) ) ( not ( = ?auto_139201 ?auto_139200 ) ) ( not ( = ?auto_139198 ?auto_139200 ) ) ( ON ?auto_139195 ?auto_139194 ) ( ON-TABLE ?auto_139200 ) ( ON ?auto_139196 ?auto_139195 ) ( ON ?auto_139202 ?auto_139196 ) ( ON ?auto_139198 ?auto_139202 ) ( ON ?auto_139201 ?auto_139198 ) ( ON ?auto_139197 ?auto_139201 ) ( ON ?auto_139199 ?auto_139197 ) ( CLEAR ?auto_139199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139200 ?auto_139194 ?auto_139195 ?auto_139196 ?auto_139202 ?auto_139198 ?auto_139201 ?auto_139197 )
      ( MAKE-3PILE ?auto_139194 ?auto_139195 ?auto_139196 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139207 - BLOCK
      ?auto_139208 - BLOCK
      ?auto_139209 - BLOCK
      ?auto_139210 - BLOCK
    )
    :vars
    (
      ?auto_139211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139211 ?auto_139210 ) ( CLEAR ?auto_139211 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139207 ) ( ON ?auto_139208 ?auto_139207 ) ( ON ?auto_139209 ?auto_139208 ) ( ON ?auto_139210 ?auto_139209 ) ( not ( = ?auto_139207 ?auto_139208 ) ) ( not ( = ?auto_139207 ?auto_139209 ) ) ( not ( = ?auto_139207 ?auto_139210 ) ) ( not ( = ?auto_139207 ?auto_139211 ) ) ( not ( = ?auto_139208 ?auto_139209 ) ) ( not ( = ?auto_139208 ?auto_139210 ) ) ( not ( = ?auto_139208 ?auto_139211 ) ) ( not ( = ?auto_139209 ?auto_139210 ) ) ( not ( = ?auto_139209 ?auto_139211 ) ) ( not ( = ?auto_139210 ?auto_139211 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139211 ?auto_139210 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139212 - BLOCK
      ?auto_139213 - BLOCK
      ?auto_139214 - BLOCK
      ?auto_139215 - BLOCK
    )
    :vars
    (
      ?auto_139216 - BLOCK
      ?auto_139217 - BLOCK
      ?auto_139218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139216 ?auto_139215 ) ( CLEAR ?auto_139216 ) ( ON-TABLE ?auto_139212 ) ( ON ?auto_139213 ?auto_139212 ) ( ON ?auto_139214 ?auto_139213 ) ( ON ?auto_139215 ?auto_139214 ) ( not ( = ?auto_139212 ?auto_139213 ) ) ( not ( = ?auto_139212 ?auto_139214 ) ) ( not ( = ?auto_139212 ?auto_139215 ) ) ( not ( = ?auto_139212 ?auto_139216 ) ) ( not ( = ?auto_139213 ?auto_139214 ) ) ( not ( = ?auto_139213 ?auto_139215 ) ) ( not ( = ?auto_139213 ?auto_139216 ) ) ( not ( = ?auto_139214 ?auto_139215 ) ) ( not ( = ?auto_139214 ?auto_139216 ) ) ( not ( = ?auto_139215 ?auto_139216 ) ) ( HOLDING ?auto_139217 ) ( CLEAR ?auto_139218 ) ( not ( = ?auto_139212 ?auto_139217 ) ) ( not ( = ?auto_139212 ?auto_139218 ) ) ( not ( = ?auto_139213 ?auto_139217 ) ) ( not ( = ?auto_139213 ?auto_139218 ) ) ( not ( = ?auto_139214 ?auto_139217 ) ) ( not ( = ?auto_139214 ?auto_139218 ) ) ( not ( = ?auto_139215 ?auto_139217 ) ) ( not ( = ?auto_139215 ?auto_139218 ) ) ( not ( = ?auto_139216 ?auto_139217 ) ) ( not ( = ?auto_139216 ?auto_139218 ) ) ( not ( = ?auto_139217 ?auto_139218 ) ) )
    :subtasks
    ( ( !STACK ?auto_139217 ?auto_139218 )
      ( MAKE-4PILE ?auto_139212 ?auto_139213 ?auto_139214 ?auto_139215 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139219 - BLOCK
      ?auto_139220 - BLOCK
      ?auto_139221 - BLOCK
      ?auto_139222 - BLOCK
    )
    :vars
    (
      ?auto_139225 - BLOCK
      ?auto_139224 - BLOCK
      ?auto_139223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139225 ?auto_139222 ) ( ON-TABLE ?auto_139219 ) ( ON ?auto_139220 ?auto_139219 ) ( ON ?auto_139221 ?auto_139220 ) ( ON ?auto_139222 ?auto_139221 ) ( not ( = ?auto_139219 ?auto_139220 ) ) ( not ( = ?auto_139219 ?auto_139221 ) ) ( not ( = ?auto_139219 ?auto_139222 ) ) ( not ( = ?auto_139219 ?auto_139225 ) ) ( not ( = ?auto_139220 ?auto_139221 ) ) ( not ( = ?auto_139220 ?auto_139222 ) ) ( not ( = ?auto_139220 ?auto_139225 ) ) ( not ( = ?auto_139221 ?auto_139222 ) ) ( not ( = ?auto_139221 ?auto_139225 ) ) ( not ( = ?auto_139222 ?auto_139225 ) ) ( CLEAR ?auto_139224 ) ( not ( = ?auto_139219 ?auto_139223 ) ) ( not ( = ?auto_139219 ?auto_139224 ) ) ( not ( = ?auto_139220 ?auto_139223 ) ) ( not ( = ?auto_139220 ?auto_139224 ) ) ( not ( = ?auto_139221 ?auto_139223 ) ) ( not ( = ?auto_139221 ?auto_139224 ) ) ( not ( = ?auto_139222 ?auto_139223 ) ) ( not ( = ?auto_139222 ?auto_139224 ) ) ( not ( = ?auto_139225 ?auto_139223 ) ) ( not ( = ?auto_139225 ?auto_139224 ) ) ( not ( = ?auto_139223 ?auto_139224 ) ) ( ON ?auto_139223 ?auto_139225 ) ( CLEAR ?auto_139223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139219 ?auto_139220 ?auto_139221 ?auto_139222 ?auto_139225 )
      ( MAKE-4PILE ?auto_139219 ?auto_139220 ?auto_139221 ?auto_139222 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139226 - BLOCK
      ?auto_139227 - BLOCK
      ?auto_139228 - BLOCK
      ?auto_139229 - BLOCK
    )
    :vars
    (
      ?auto_139230 - BLOCK
      ?auto_139231 - BLOCK
      ?auto_139232 - BLOCK
      ?auto_139233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139230 ?auto_139229 ) ( ON-TABLE ?auto_139226 ) ( ON ?auto_139227 ?auto_139226 ) ( ON ?auto_139228 ?auto_139227 ) ( ON ?auto_139229 ?auto_139228 ) ( not ( = ?auto_139226 ?auto_139227 ) ) ( not ( = ?auto_139226 ?auto_139228 ) ) ( not ( = ?auto_139226 ?auto_139229 ) ) ( not ( = ?auto_139226 ?auto_139230 ) ) ( not ( = ?auto_139227 ?auto_139228 ) ) ( not ( = ?auto_139227 ?auto_139229 ) ) ( not ( = ?auto_139227 ?auto_139230 ) ) ( not ( = ?auto_139228 ?auto_139229 ) ) ( not ( = ?auto_139228 ?auto_139230 ) ) ( not ( = ?auto_139229 ?auto_139230 ) ) ( not ( = ?auto_139226 ?auto_139231 ) ) ( not ( = ?auto_139226 ?auto_139232 ) ) ( not ( = ?auto_139227 ?auto_139231 ) ) ( not ( = ?auto_139227 ?auto_139232 ) ) ( not ( = ?auto_139228 ?auto_139231 ) ) ( not ( = ?auto_139228 ?auto_139232 ) ) ( not ( = ?auto_139229 ?auto_139231 ) ) ( not ( = ?auto_139229 ?auto_139232 ) ) ( not ( = ?auto_139230 ?auto_139231 ) ) ( not ( = ?auto_139230 ?auto_139232 ) ) ( not ( = ?auto_139231 ?auto_139232 ) ) ( ON ?auto_139231 ?auto_139230 ) ( CLEAR ?auto_139231 ) ( HOLDING ?auto_139232 ) ( CLEAR ?auto_139233 ) ( ON-TABLE ?auto_139233 ) ( not ( = ?auto_139233 ?auto_139232 ) ) ( not ( = ?auto_139226 ?auto_139233 ) ) ( not ( = ?auto_139227 ?auto_139233 ) ) ( not ( = ?auto_139228 ?auto_139233 ) ) ( not ( = ?auto_139229 ?auto_139233 ) ) ( not ( = ?auto_139230 ?auto_139233 ) ) ( not ( = ?auto_139231 ?auto_139233 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139233 ?auto_139232 )
      ( MAKE-4PILE ?auto_139226 ?auto_139227 ?auto_139228 ?auto_139229 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139234 - BLOCK
      ?auto_139235 - BLOCK
      ?auto_139236 - BLOCK
      ?auto_139237 - BLOCK
    )
    :vars
    (
      ?auto_139238 - BLOCK
      ?auto_139240 - BLOCK
      ?auto_139241 - BLOCK
      ?auto_139239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139238 ?auto_139237 ) ( ON-TABLE ?auto_139234 ) ( ON ?auto_139235 ?auto_139234 ) ( ON ?auto_139236 ?auto_139235 ) ( ON ?auto_139237 ?auto_139236 ) ( not ( = ?auto_139234 ?auto_139235 ) ) ( not ( = ?auto_139234 ?auto_139236 ) ) ( not ( = ?auto_139234 ?auto_139237 ) ) ( not ( = ?auto_139234 ?auto_139238 ) ) ( not ( = ?auto_139235 ?auto_139236 ) ) ( not ( = ?auto_139235 ?auto_139237 ) ) ( not ( = ?auto_139235 ?auto_139238 ) ) ( not ( = ?auto_139236 ?auto_139237 ) ) ( not ( = ?auto_139236 ?auto_139238 ) ) ( not ( = ?auto_139237 ?auto_139238 ) ) ( not ( = ?auto_139234 ?auto_139240 ) ) ( not ( = ?auto_139234 ?auto_139241 ) ) ( not ( = ?auto_139235 ?auto_139240 ) ) ( not ( = ?auto_139235 ?auto_139241 ) ) ( not ( = ?auto_139236 ?auto_139240 ) ) ( not ( = ?auto_139236 ?auto_139241 ) ) ( not ( = ?auto_139237 ?auto_139240 ) ) ( not ( = ?auto_139237 ?auto_139241 ) ) ( not ( = ?auto_139238 ?auto_139240 ) ) ( not ( = ?auto_139238 ?auto_139241 ) ) ( not ( = ?auto_139240 ?auto_139241 ) ) ( ON ?auto_139240 ?auto_139238 ) ( CLEAR ?auto_139239 ) ( ON-TABLE ?auto_139239 ) ( not ( = ?auto_139239 ?auto_139241 ) ) ( not ( = ?auto_139234 ?auto_139239 ) ) ( not ( = ?auto_139235 ?auto_139239 ) ) ( not ( = ?auto_139236 ?auto_139239 ) ) ( not ( = ?auto_139237 ?auto_139239 ) ) ( not ( = ?auto_139238 ?auto_139239 ) ) ( not ( = ?auto_139240 ?auto_139239 ) ) ( ON ?auto_139241 ?auto_139240 ) ( CLEAR ?auto_139241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139234 ?auto_139235 ?auto_139236 ?auto_139237 ?auto_139238 ?auto_139240 )
      ( MAKE-4PILE ?auto_139234 ?auto_139235 ?auto_139236 ?auto_139237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139242 - BLOCK
      ?auto_139243 - BLOCK
      ?auto_139244 - BLOCK
      ?auto_139245 - BLOCK
    )
    :vars
    (
      ?auto_139247 - BLOCK
      ?auto_139248 - BLOCK
      ?auto_139246 - BLOCK
      ?auto_139249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139247 ?auto_139245 ) ( ON-TABLE ?auto_139242 ) ( ON ?auto_139243 ?auto_139242 ) ( ON ?auto_139244 ?auto_139243 ) ( ON ?auto_139245 ?auto_139244 ) ( not ( = ?auto_139242 ?auto_139243 ) ) ( not ( = ?auto_139242 ?auto_139244 ) ) ( not ( = ?auto_139242 ?auto_139245 ) ) ( not ( = ?auto_139242 ?auto_139247 ) ) ( not ( = ?auto_139243 ?auto_139244 ) ) ( not ( = ?auto_139243 ?auto_139245 ) ) ( not ( = ?auto_139243 ?auto_139247 ) ) ( not ( = ?auto_139244 ?auto_139245 ) ) ( not ( = ?auto_139244 ?auto_139247 ) ) ( not ( = ?auto_139245 ?auto_139247 ) ) ( not ( = ?auto_139242 ?auto_139248 ) ) ( not ( = ?auto_139242 ?auto_139246 ) ) ( not ( = ?auto_139243 ?auto_139248 ) ) ( not ( = ?auto_139243 ?auto_139246 ) ) ( not ( = ?auto_139244 ?auto_139248 ) ) ( not ( = ?auto_139244 ?auto_139246 ) ) ( not ( = ?auto_139245 ?auto_139248 ) ) ( not ( = ?auto_139245 ?auto_139246 ) ) ( not ( = ?auto_139247 ?auto_139248 ) ) ( not ( = ?auto_139247 ?auto_139246 ) ) ( not ( = ?auto_139248 ?auto_139246 ) ) ( ON ?auto_139248 ?auto_139247 ) ( not ( = ?auto_139249 ?auto_139246 ) ) ( not ( = ?auto_139242 ?auto_139249 ) ) ( not ( = ?auto_139243 ?auto_139249 ) ) ( not ( = ?auto_139244 ?auto_139249 ) ) ( not ( = ?auto_139245 ?auto_139249 ) ) ( not ( = ?auto_139247 ?auto_139249 ) ) ( not ( = ?auto_139248 ?auto_139249 ) ) ( ON ?auto_139246 ?auto_139248 ) ( CLEAR ?auto_139246 ) ( HOLDING ?auto_139249 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139249 )
      ( MAKE-4PILE ?auto_139242 ?auto_139243 ?auto_139244 ?auto_139245 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139250 - BLOCK
      ?auto_139251 - BLOCK
      ?auto_139252 - BLOCK
      ?auto_139253 - BLOCK
    )
    :vars
    (
      ?auto_139254 - BLOCK
      ?auto_139256 - BLOCK
      ?auto_139255 - BLOCK
      ?auto_139257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139254 ?auto_139253 ) ( ON-TABLE ?auto_139250 ) ( ON ?auto_139251 ?auto_139250 ) ( ON ?auto_139252 ?auto_139251 ) ( ON ?auto_139253 ?auto_139252 ) ( not ( = ?auto_139250 ?auto_139251 ) ) ( not ( = ?auto_139250 ?auto_139252 ) ) ( not ( = ?auto_139250 ?auto_139253 ) ) ( not ( = ?auto_139250 ?auto_139254 ) ) ( not ( = ?auto_139251 ?auto_139252 ) ) ( not ( = ?auto_139251 ?auto_139253 ) ) ( not ( = ?auto_139251 ?auto_139254 ) ) ( not ( = ?auto_139252 ?auto_139253 ) ) ( not ( = ?auto_139252 ?auto_139254 ) ) ( not ( = ?auto_139253 ?auto_139254 ) ) ( not ( = ?auto_139250 ?auto_139256 ) ) ( not ( = ?auto_139250 ?auto_139255 ) ) ( not ( = ?auto_139251 ?auto_139256 ) ) ( not ( = ?auto_139251 ?auto_139255 ) ) ( not ( = ?auto_139252 ?auto_139256 ) ) ( not ( = ?auto_139252 ?auto_139255 ) ) ( not ( = ?auto_139253 ?auto_139256 ) ) ( not ( = ?auto_139253 ?auto_139255 ) ) ( not ( = ?auto_139254 ?auto_139256 ) ) ( not ( = ?auto_139254 ?auto_139255 ) ) ( not ( = ?auto_139256 ?auto_139255 ) ) ( ON ?auto_139256 ?auto_139254 ) ( not ( = ?auto_139257 ?auto_139255 ) ) ( not ( = ?auto_139250 ?auto_139257 ) ) ( not ( = ?auto_139251 ?auto_139257 ) ) ( not ( = ?auto_139252 ?auto_139257 ) ) ( not ( = ?auto_139253 ?auto_139257 ) ) ( not ( = ?auto_139254 ?auto_139257 ) ) ( not ( = ?auto_139256 ?auto_139257 ) ) ( ON ?auto_139255 ?auto_139256 ) ( ON ?auto_139257 ?auto_139255 ) ( CLEAR ?auto_139257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139250 ?auto_139251 ?auto_139252 ?auto_139253 ?auto_139254 ?auto_139256 ?auto_139255 )
      ( MAKE-4PILE ?auto_139250 ?auto_139251 ?auto_139252 ?auto_139253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139258 - BLOCK
      ?auto_139259 - BLOCK
      ?auto_139260 - BLOCK
      ?auto_139261 - BLOCK
    )
    :vars
    (
      ?auto_139262 - BLOCK
      ?auto_139263 - BLOCK
      ?auto_139265 - BLOCK
      ?auto_139264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139262 ?auto_139261 ) ( ON-TABLE ?auto_139258 ) ( ON ?auto_139259 ?auto_139258 ) ( ON ?auto_139260 ?auto_139259 ) ( ON ?auto_139261 ?auto_139260 ) ( not ( = ?auto_139258 ?auto_139259 ) ) ( not ( = ?auto_139258 ?auto_139260 ) ) ( not ( = ?auto_139258 ?auto_139261 ) ) ( not ( = ?auto_139258 ?auto_139262 ) ) ( not ( = ?auto_139259 ?auto_139260 ) ) ( not ( = ?auto_139259 ?auto_139261 ) ) ( not ( = ?auto_139259 ?auto_139262 ) ) ( not ( = ?auto_139260 ?auto_139261 ) ) ( not ( = ?auto_139260 ?auto_139262 ) ) ( not ( = ?auto_139261 ?auto_139262 ) ) ( not ( = ?auto_139258 ?auto_139263 ) ) ( not ( = ?auto_139258 ?auto_139265 ) ) ( not ( = ?auto_139259 ?auto_139263 ) ) ( not ( = ?auto_139259 ?auto_139265 ) ) ( not ( = ?auto_139260 ?auto_139263 ) ) ( not ( = ?auto_139260 ?auto_139265 ) ) ( not ( = ?auto_139261 ?auto_139263 ) ) ( not ( = ?auto_139261 ?auto_139265 ) ) ( not ( = ?auto_139262 ?auto_139263 ) ) ( not ( = ?auto_139262 ?auto_139265 ) ) ( not ( = ?auto_139263 ?auto_139265 ) ) ( ON ?auto_139263 ?auto_139262 ) ( not ( = ?auto_139264 ?auto_139265 ) ) ( not ( = ?auto_139258 ?auto_139264 ) ) ( not ( = ?auto_139259 ?auto_139264 ) ) ( not ( = ?auto_139260 ?auto_139264 ) ) ( not ( = ?auto_139261 ?auto_139264 ) ) ( not ( = ?auto_139262 ?auto_139264 ) ) ( not ( = ?auto_139263 ?auto_139264 ) ) ( ON ?auto_139265 ?auto_139263 ) ( HOLDING ?auto_139264 ) ( CLEAR ?auto_139265 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139258 ?auto_139259 ?auto_139260 ?auto_139261 ?auto_139262 ?auto_139263 ?auto_139265 ?auto_139264 )
      ( MAKE-4PILE ?auto_139258 ?auto_139259 ?auto_139260 ?auto_139261 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139266 - BLOCK
      ?auto_139267 - BLOCK
      ?auto_139268 - BLOCK
      ?auto_139269 - BLOCK
    )
    :vars
    (
      ?auto_139272 - BLOCK
      ?auto_139271 - BLOCK
      ?auto_139273 - BLOCK
      ?auto_139270 - BLOCK
      ?auto_139274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139272 ?auto_139269 ) ( ON-TABLE ?auto_139266 ) ( ON ?auto_139267 ?auto_139266 ) ( ON ?auto_139268 ?auto_139267 ) ( ON ?auto_139269 ?auto_139268 ) ( not ( = ?auto_139266 ?auto_139267 ) ) ( not ( = ?auto_139266 ?auto_139268 ) ) ( not ( = ?auto_139266 ?auto_139269 ) ) ( not ( = ?auto_139266 ?auto_139272 ) ) ( not ( = ?auto_139267 ?auto_139268 ) ) ( not ( = ?auto_139267 ?auto_139269 ) ) ( not ( = ?auto_139267 ?auto_139272 ) ) ( not ( = ?auto_139268 ?auto_139269 ) ) ( not ( = ?auto_139268 ?auto_139272 ) ) ( not ( = ?auto_139269 ?auto_139272 ) ) ( not ( = ?auto_139266 ?auto_139271 ) ) ( not ( = ?auto_139266 ?auto_139273 ) ) ( not ( = ?auto_139267 ?auto_139271 ) ) ( not ( = ?auto_139267 ?auto_139273 ) ) ( not ( = ?auto_139268 ?auto_139271 ) ) ( not ( = ?auto_139268 ?auto_139273 ) ) ( not ( = ?auto_139269 ?auto_139271 ) ) ( not ( = ?auto_139269 ?auto_139273 ) ) ( not ( = ?auto_139272 ?auto_139271 ) ) ( not ( = ?auto_139272 ?auto_139273 ) ) ( not ( = ?auto_139271 ?auto_139273 ) ) ( ON ?auto_139271 ?auto_139272 ) ( not ( = ?auto_139270 ?auto_139273 ) ) ( not ( = ?auto_139266 ?auto_139270 ) ) ( not ( = ?auto_139267 ?auto_139270 ) ) ( not ( = ?auto_139268 ?auto_139270 ) ) ( not ( = ?auto_139269 ?auto_139270 ) ) ( not ( = ?auto_139272 ?auto_139270 ) ) ( not ( = ?auto_139271 ?auto_139270 ) ) ( ON ?auto_139273 ?auto_139271 ) ( CLEAR ?auto_139273 ) ( ON ?auto_139270 ?auto_139274 ) ( CLEAR ?auto_139270 ) ( HAND-EMPTY ) ( not ( = ?auto_139266 ?auto_139274 ) ) ( not ( = ?auto_139267 ?auto_139274 ) ) ( not ( = ?auto_139268 ?auto_139274 ) ) ( not ( = ?auto_139269 ?auto_139274 ) ) ( not ( = ?auto_139272 ?auto_139274 ) ) ( not ( = ?auto_139271 ?auto_139274 ) ) ( not ( = ?auto_139273 ?auto_139274 ) ) ( not ( = ?auto_139270 ?auto_139274 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139270 ?auto_139274 )
      ( MAKE-4PILE ?auto_139266 ?auto_139267 ?auto_139268 ?auto_139269 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139275 - BLOCK
      ?auto_139276 - BLOCK
      ?auto_139277 - BLOCK
      ?auto_139278 - BLOCK
    )
    :vars
    (
      ?auto_139280 - BLOCK
      ?auto_139279 - BLOCK
      ?auto_139283 - BLOCK
      ?auto_139282 - BLOCK
      ?auto_139281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139280 ?auto_139278 ) ( ON-TABLE ?auto_139275 ) ( ON ?auto_139276 ?auto_139275 ) ( ON ?auto_139277 ?auto_139276 ) ( ON ?auto_139278 ?auto_139277 ) ( not ( = ?auto_139275 ?auto_139276 ) ) ( not ( = ?auto_139275 ?auto_139277 ) ) ( not ( = ?auto_139275 ?auto_139278 ) ) ( not ( = ?auto_139275 ?auto_139280 ) ) ( not ( = ?auto_139276 ?auto_139277 ) ) ( not ( = ?auto_139276 ?auto_139278 ) ) ( not ( = ?auto_139276 ?auto_139280 ) ) ( not ( = ?auto_139277 ?auto_139278 ) ) ( not ( = ?auto_139277 ?auto_139280 ) ) ( not ( = ?auto_139278 ?auto_139280 ) ) ( not ( = ?auto_139275 ?auto_139279 ) ) ( not ( = ?auto_139275 ?auto_139283 ) ) ( not ( = ?auto_139276 ?auto_139279 ) ) ( not ( = ?auto_139276 ?auto_139283 ) ) ( not ( = ?auto_139277 ?auto_139279 ) ) ( not ( = ?auto_139277 ?auto_139283 ) ) ( not ( = ?auto_139278 ?auto_139279 ) ) ( not ( = ?auto_139278 ?auto_139283 ) ) ( not ( = ?auto_139280 ?auto_139279 ) ) ( not ( = ?auto_139280 ?auto_139283 ) ) ( not ( = ?auto_139279 ?auto_139283 ) ) ( ON ?auto_139279 ?auto_139280 ) ( not ( = ?auto_139282 ?auto_139283 ) ) ( not ( = ?auto_139275 ?auto_139282 ) ) ( not ( = ?auto_139276 ?auto_139282 ) ) ( not ( = ?auto_139277 ?auto_139282 ) ) ( not ( = ?auto_139278 ?auto_139282 ) ) ( not ( = ?auto_139280 ?auto_139282 ) ) ( not ( = ?auto_139279 ?auto_139282 ) ) ( ON ?auto_139282 ?auto_139281 ) ( CLEAR ?auto_139282 ) ( not ( = ?auto_139275 ?auto_139281 ) ) ( not ( = ?auto_139276 ?auto_139281 ) ) ( not ( = ?auto_139277 ?auto_139281 ) ) ( not ( = ?auto_139278 ?auto_139281 ) ) ( not ( = ?auto_139280 ?auto_139281 ) ) ( not ( = ?auto_139279 ?auto_139281 ) ) ( not ( = ?auto_139283 ?auto_139281 ) ) ( not ( = ?auto_139282 ?auto_139281 ) ) ( HOLDING ?auto_139283 ) ( CLEAR ?auto_139279 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139275 ?auto_139276 ?auto_139277 ?auto_139278 ?auto_139280 ?auto_139279 ?auto_139283 )
      ( MAKE-4PILE ?auto_139275 ?auto_139276 ?auto_139277 ?auto_139278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139284 - BLOCK
      ?auto_139285 - BLOCK
      ?auto_139286 - BLOCK
      ?auto_139287 - BLOCK
    )
    :vars
    (
      ?auto_139288 - BLOCK
      ?auto_139292 - BLOCK
      ?auto_139291 - BLOCK
      ?auto_139290 - BLOCK
      ?auto_139289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139288 ?auto_139287 ) ( ON-TABLE ?auto_139284 ) ( ON ?auto_139285 ?auto_139284 ) ( ON ?auto_139286 ?auto_139285 ) ( ON ?auto_139287 ?auto_139286 ) ( not ( = ?auto_139284 ?auto_139285 ) ) ( not ( = ?auto_139284 ?auto_139286 ) ) ( not ( = ?auto_139284 ?auto_139287 ) ) ( not ( = ?auto_139284 ?auto_139288 ) ) ( not ( = ?auto_139285 ?auto_139286 ) ) ( not ( = ?auto_139285 ?auto_139287 ) ) ( not ( = ?auto_139285 ?auto_139288 ) ) ( not ( = ?auto_139286 ?auto_139287 ) ) ( not ( = ?auto_139286 ?auto_139288 ) ) ( not ( = ?auto_139287 ?auto_139288 ) ) ( not ( = ?auto_139284 ?auto_139292 ) ) ( not ( = ?auto_139284 ?auto_139291 ) ) ( not ( = ?auto_139285 ?auto_139292 ) ) ( not ( = ?auto_139285 ?auto_139291 ) ) ( not ( = ?auto_139286 ?auto_139292 ) ) ( not ( = ?auto_139286 ?auto_139291 ) ) ( not ( = ?auto_139287 ?auto_139292 ) ) ( not ( = ?auto_139287 ?auto_139291 ) ) ( not ( = ?auto_139288 ?auto_139292 ) ) ( not ( = ?auto_139288 ?auto_139291 ) ) ( not ( = ?auto_139292 ?auto_139291 ) ) ( ON ?auto_139292 ?auto_139288 ) ( not ( = ?auto_139290 ?auto_139291 ) ) ( not ( = ?auto_139284 ?auto_139290 ) ) ( not ( = ?auto_139285 ?auto_139290 ) ) ( not ( = ?auto_139286 ?auto_139290 ) ) ( not ( = ?auto_139287 ?auto_139290 ) ) ( not ( = ?auto_139288 ?auto_139290 ) ) ( not ( = ?auto_139292 ?auto_139290 ) ) ( ON ?auto_139290 ?auto_139289 ) ( not ( = ?auto_139284 ?auto_139289 ) ) ( not ( = ?auto_139285 ?auto_139289 ) ) ( not ( = ?auto_139286 ?auto_139289 ) ) ( not ( = ?auto_139287 ?auto_139289 ) ) ( not ( = ?auto_139288 ?auto_139289 ) ) ( not ( = ?auto_139292 ?auto_139289 ) ) ( not ( = ?auto_139291 ?auto_139289 ) ) ( not ( = ?auto_139290 ?auto_139289 ) ) ( CLEAR ?auto_139292 ) ( ON ?auto_139291 ?auto_139290 ) ( CLEAR ?auto_139291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139289 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139289 ?auto_139290 )
      ( MAKE-4PILE ?auto_139284 ?auto_139285 ?auto_139286 ?auto_139287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139293 - BLOCK
      ?auto_139294 - BLOCK
      ?auto_139295 - BLOCK
      ?auto_139296 - BLOCK
    )
    :vars
    (
      ?auto_139301 - BLOCK
      ?auto_139298 - BLOCK
      ?auto_139300 - BLOCK
      ?auto_139299 - BLOCK
      ?auto_139297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139301 ?auto_139296 ) ( ON-TABLE ?auto_139293 ) ( ON ?auto_139294 ?auto_139293 ) ( ON ?auto_139295 ?auto_139294 ) ( ON ?auto_139296 ?auto_139295 ) ( not ( = ?auto_139293 ?auto_139294 ) ) ( not ( = ?auto_139293 ?auto_139295 ) ) ( not ( = ?auto_139293 ?auto_139296 ) ) ( not ( = ?auto_139293 ?auto_139301 ) ) ( not ( = ?auto_139294 ?auto_139295 ) ) ( not ( = ?auto_139294 ?auto_139296 ) ) ( not ( = ?auto_139294 ?auto_139301 ) ) ( not ( = ?auto_139295 ?auto_139296 ) ) ( not ( = ?auto_139295 ?auto_139301 ) ) ( not ( = ?auto_139296 ?auto_139301 ) ) ( not ( = ?auto_139293 ?auto_139298 ) ) ( not ( = ?auto_139293 ?auto_139300 ) ) ( not ( = ?auto_139294 ?auto_139298 ) ) ( not ( = ?auto_139294 ?auto_139300 ) ) ( not ( = ?auto_139295 ?auto_139298 ) ) ( not ( = ?auto_139295 ?auto_139300 ) ) ( not ( = ?auto_139296 ?auto_139298 ) ) ( not ( = ?auto_139296 ?auto_139300 ) ) ( not ( = ?auto_139301 ?auto_139298 ) ) ( not ( = ?auto_139301 ?auto_139300 ) ) ( not ( = ?auto_139298 ?auto_139300 ) ) ( not ( = ?auto_139299 ?auto_139300 ) ) ( not ( = ?auto_139293 ?auto_139299 ) ) ( not ( = ?auto_139294 ?auto_139299 ) ) ( not ( = ?auto_139295 ?auto_139299 ) ) ( not ( = ?auto_139296 ?auto_139299 ) ) ( not ( = ?auto_139301 ?auto_139299 ) ) ( not ( = ?auto_139298 ?auto_139299 ) ) ( ON ?auto_139299 ?auto_139297 ) ( not ( = ?auto_139293 ?auto_139297 ) ) ( not ( = ?auto_139294 ?auto_139297 ) ) ( not ( = ?auto_139295 ?auto_139297 ) ) ( not ( = ?auto_139296 ?auto_139297 ) ) ( not ( = ?auto_139301 ?auto_139297 ) ) ( not ( = ?auto_139298 ?auto_139297 ) ) ( not ( = ?auto_139300 ?auto_139297 ) ) ( not ( = ?auto_139299 ?auto_139297 ) ) ( ON ?auto_139300 ?auto_139299 ) ( CLEAR ?auto_139300 ) ( ON-TABLE ?auto_139297 ) ( HOLDING ?auto_139298 ) ( CLEAR ?auto_139301 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139293 ?auto_139294 ?auto_139295 ?auto_139296 ?auto_139301 ?auto_139298 )
      ( MAKE-4PILE ?auto_139293 ?auto_139294 ?auto_139295 ?auto_139296 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139302 - BLOCK
      ?auto_139303 - BLOCK
      ?auto_139304 - BLOCK
      ?auto_139305 - BLOCK
    )
    :vars
    (
      ?auto_139306 - BLOCK
      ?auto_139310 - BLOCK
      ?auto_139308 - BLOCK
      ?auto_139309 - BLOCK
      ?auto_139307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139306 ?auto_139305 ) ( ON-TABLE ?auto_139302 ) ( ON ?auto_139303 ?auto_139302 ) ( ON ?auto_139304 ?auto_139303 ) ( ON ?auto_139305 ?auto_139304 ) ( not ( = ?auto_139302 ?auto_139303 ) ) ( not ( = ?auto_139302 ?auto_139304 ) ) ( not ( = ?auto_139302 ?auto_139305 ) ) ( not ( = ?auto_139302 ?auto_139306 ) ) ( not ( = ?auto_139303 ?auto_139304 ) ) ( not ( = ?auto_139303 ?auto_139305 ) ) ( not ( = ?auto_139303 ?auto_139306 ) ) ( not ( = ?auto_139304 ?auto_139305 ) ) ( not ( = ?auto_139304 ?auto_139306 ) ) ( not ( = ?auto_139305 ?auto_139306 ) ) ( not ( = ?auto_139302 ?auto_139310 ) ) ( not ( = ?auto_139302 ?auto_139308 ) ) ( not ( = ?auto_139303 ?auto_139310 ) ) ( not ( = ?auto_139303 ?auto_139308 ) ) ( not ( = ?auto_139304 ?auto_139310 ) ) ( not ( = ?auto_139304 ?auto_139308 ) ) ( not ( = ?auto_139305 ?auto_139310 ) ) ( not ( = ?auto_139305 ?auto_139308 ) ) ( not ( = ?auto_139306 ?auto_139310 ) ) ( not ( = ?auto_139306 ?auto_139308 ) ) ( not ( = ?auto_139310 ?auto_139308 ) ) ( not ( = ?auto_139309 ?auto_139308 ) ) ( not ( = ?auto_139302 ?auto_139309 ) ) ( not ( = ?auto_139303 ?auto_139309 ) ) ( not ( = ?auto_139304 ?auto_139309 ) ) ( not ( = ?auto_139305 ?auto_139309 ) ) ( not ( = ?auto_139306 ?auto_139309 ) ) ( not ( = ?auto_139310 ?auto_139309 ) ) ( ON ?auto_139309 ?auto_139307 ) ( not ( = ?auto_139302 ?auto_139307 ) ) ( not ( = ?auto_139303 ?auto_139307 ) ) ( not ( = ?auto_139304 ?auto_139307 ) ) ( not ( = ?auto_139305 ?auto_139307 ) ) ( not ( = ?auto_139306 ?auto_139307 ) ) ( not ( = ?auto_139310 ?auto_139307 ) ) ( not ( = ?auto_139308 ?auto_139307 ) ) ( not ( = ?auto_139309 ?auto_139307 ) ) ( ON ?auto_139308 ?auto_139309 ) ( ON-TABLE ?auto_139307 ) ( CLEAR ?auto_139306 ) ( ON ?auto_139310 ?auto_139308 ) ( CLEAR ?auto_139310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139307 ?auto_139309 ?auto_139308 )
      ( MAKE-4PILE ?auto_139302 ?auto_139303 ?auto_139304 ?auto_139305 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139329 - BLOCK
      ?auto_139330 - BLOCK
      ?auto_139331 - BLOCK
      ?auto_139332 - BLOCK
    )
    :vars
    (
      ?auto_139333 - BLOCK
      ?auto_139335 - BLOCK
      ?auto_139337 - BLOCK
      ?auto_139336 - BLOCK
      ?auto_139334 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139329 ) ( ON ?auto_139330 ?auto_139329 ) ( ON ?auto_139331 ?auto_139330 ) ( not ( = ?auto_139329 ?auto_139330 ) ) ( not ( = ?auto_139329 ?auto_139331 ) ) ( not ( = ?auto_139329 ?auto_139332 ) ) ( not ( = ?auto_139329 ?auto_139333 ) ) ( not ( = ?auto_139330 ?auto_139331 ) ) ( not ( = ?auto_139330 ?auto_139332 ) ) ( not ( = ?auto_139330 ?auto_139333 ) ) ( not ( = ?auto_139331 ?auto_139332 ) ) ( not ( = ?auto_139331 ?auto_139333 ) ) ( not ( = ?auto_139332 ?auto_139333 ) ) ( not ( = ?auto_139329 ?auto_139335 ) ) ( not ( = ?auto_139329 ?auto_139337 ) ) ( not ( = ?auto_139330 ?auto_139335 ) ) ( not ( = ?auto_139330 ?auto_139337 ) ) ( not ( = ?auto_139331 ?auto_139335 ) ) ( not ( = ?auto_139331 ?auto_139337 ) ) ( not ( = ?auto_139332 ?auto_139335 ) ) ( not ( = ?auto_139332 ?auto_139337 ) ) ( not ( = ?auto_139333 ?auto_139335 ) ) ( not ( = ?auto_139333 ?auto_139337 ) ) ( not ( = ?auto_139335 ?auto_139337 ) ) ( not ( = ?auto_139336 ?auto_139337 ) ) ( not ( = ?auto_139329 ?auto_139336 ) ) ( not ( = ?auto_139330 ?auto_139336 ) ) ( not ( = ?auto_139331 ?auto_139336 ) ) ( not ( = ?auto_139332 ?auto_139336 ) ) ( not ( = ?auto_139333 ?auto_139336 ) ) ( not ( = ?auto_139335 ?auto_139336 ) ) ( ON ?auto_139336 ?auto_139334 ) ( not ( = ?auto_139329 ?auto_139334 ) ) ( not ( = ?auto_139330 ?auto_139334 ) ) ( not ( = ?auto_139331 ?auto_139334 ) ) ( not ( = ?auto_139332 ?auto_139334 ) ) ( not ( = ?auto_139333 ?auto_139334 ) ) ( not ( = ?auto_139335 ?auto_139334 ) ) ( not ( = ?auto_139337 ?auto_139334 ) ) ( not ( = ?auto_139336 ?auto_139334 ) ) ( ON ?auto_139337 ?auto_139336 ) ( ON-TABLE ?auto_139334 ) ( ON ?auto_139335 ?auto_139337 ) ( ON ?auto_139333 ?auto_139335 ) ( CLEAR ?auto_139333 ) ( HOLDING ?auto_139332 ) ( CLEAR ?auto_139331 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139329 ?auto_139330 ?auto_139331 ?auto_139332 ?auto_139333 )
      ( MAKE-4PILE ?auto_139329 ?auto_139330 ?auto_139331 ?auto_139332 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139338 - BLOCK
      ?auto_139339 - BLOCK
      ?auto_139340 - BLOCK
      ?auto_139341 - BLOCK
    )
    :vars
    (
      ?auto_139344 - BLOCK
      ?auto_139346 - BLOCK
      ?auto_139345 - BLOCK
      ?auto_139342 - BLOCK
      ?auto_139343 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139338 ) ( ON ?auto_139339 ?auto_139338 ) ( ON ?auto_139340 ?auto_139339 ) ( not ( = ?auto_139338 ?auto_139339 ) ) ( not ( = ?auto_139338 ?auto_139340 ) ) ( not ( = ?auto_139338 ?auto_139341 ) ) ( not ( = ?auto_139338 ?auto_139344 ) ) ( not ( = ?auto_139339 ?auto_139340 ) ) ( not ( = ?auto_139339 ?auto_139341 ) ) ( not ( = ?auto_139339 ?auto_139344 ) ) ( not ( = ?auto_139340 ?auto_139341 ) ) ( not ( = ?auto_139340 ?auto_139344 ) ) ( not ( = ?auto_139341 ?auto_139344 ) ) ( not ( = ?auto_139338 ?auto_139346 ) ) ( not ( = ?auto_139338 ?auto_139345 ) ) ( not ( = ?auto_139339 ?auto_139346 ) ) ( not ( = ?auto_139339 ?auto_139345 ) ) ( not ( = ?auto_139340 ?auto_139346 ) ) ( not ( = ?auto_139340 ?auto_139345 ) ) ( not ( = ?auto_139341 ?auto_139346 ) ) ( not ( = ?auto_139341 ?auto_139345 ) ) ( not ( = ?auto_139344 ?auto_139346 ) ) ( not ( = ?auto_139344 ?auto_139345 ) ) ( not ( = ?auto_139346 ?auto_139345 ) ) ( not ( = ?auto_139342 ?auto_139345 ) ) ( not ( = ?auto_139338 ?auto_139342 ) ) ( not ( = ?auto_139339 ?auto_139342 ) ) ( not ( = ?auto_139340 ?auto_139342 ) ) ( not ( = ?auto_139341 ?auto_139342 ) ) ( not ( = ?auto_139344 ?auto_139342 ) ) ( not ( = ?auto_139346 ?auto_139342 ) ) ( ON ?auto_139342 ?auto_139343 ) ( not ( = ?auto_139338 ?auto_139343 ) ) ( not ( = ?auto_139339 ?auto_139343 ) ) ( not ( = ?auto_139340 ?auto_139343 ) ) ( not ( = ?auto_139341 ?auto_139343 ) ) ( not ( = ?auto_139344 ?auto_139343 ) ) ( not ( = ?auto_139346 ?auto_139343 ) ) ( not ( = ?auto_139345 ?auto_139343 ) ) ( not ( = ?auto_139342 ?auto_139343 ) ) ( ON ?auto_139345 ?auto_139342 ) ( ON-TABLE ?auto_139343 ) ( ON ?auto_139346 ?auto_139345 ) ( ON ?auto_139344 ?auto_139346 ) ( CLEAR ?auto_139340 ) ( ON ?auto_139341 ?auto_139344 ) ( CLEAR ?auto_139341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139343 ?auto_139342 ?auto_139345 ?auto_139346 ?auto_139344 )
      ( MAKE-4PILE ?auto_139338 ?auto_139339 ?auto_139340 ?auto_139341 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139347 - BLOCK
      ?auto_139348 - BLOCK
      ?auto_139349 - BLOCK
      ?auto_139350 - BLOCK
    )
    :vars
    (
      ?auto_139351 - BLOCK
      ?auto_139353 - BLOCK
      ?auto_139354 - BLOCK
      ?auto_139352 - BLOCK
      ?auto_139355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139347 ) ( ON ?auto_139348 ?auto_139347 ) ( not ( = ?auto_139347 ?auto_139348 ) ) ( not ( = ?auto_139347 ?auto_139349 ) ) ( not ( = ?auto_139347 ?auto_139350 ) ) ( not ( = ?auto_139347 ?auto_139351 ) ) ( not ( = ?auto_139348 ?auto_139349 ) ) ( not ( = ?auto_139348 ?auto_139350 ) ) ( not ( = ?auto_139348 ?auto_139351 ) ) ( not ( = ?auto_139349 ?auto_139350 ) ) ( not ( = ?auto_139349 ?auto_139351 ) ) ( not ( = ?auto_139350 ?auto_139351 ) ) ( not ( = ?auto_139347 ?auto_139353 ) ) ( not ( = ?auto_139347 ?auto_139354 ) ) ( not ( = ?auto_139348 ?auto_139353 ) ) ( not ( = ?auto_139348 ?auto_139354 ) ) ( not ( = ?auto_139349 ?auto_139353 ) ) ( not ( = ?auto_139349 ?auto_139354 ) ) ( not ( = ?auto_139350 ?auto_139353 ) ) ( not ( = ?auto_139350 ?auto_139354 ) ) ( not ( = ?auto_139351 ?auto_139353 ) ) ( not ( = ?auto_139351 ?auto_139354 ) ) ( not ( = ?auto_139353 ?auto_139354 ) ) ( not ( = ?auto_139352 ?auto_139354 ) ) ( not ( = ?auto_139347 ?auto_139352 ) ) ( not ( = ?auto_139348 ?auto_139352 ) ) ( not ( = ?auto_139349 ?auto_139352 ) ) ( not ( = ?auto_139350 ?auto_139352 ) ) ( not ( = ?auto_139351 ?auto_139352 ) ) ( not ( = ?auto_139353 ?auto_139352 ) ) ( ON ?auto_139352 ?auto_139355 ) ( not ( = ?auto_139347 ?auto_139355 ) ) ( not ( = ?auto_139348 ?auto_139355 ) ) ( not ( = ?auto_139349 ?auto_139355 ) ) ( not ( = ?auto_139350 ?auto_139355 ) ) ( not ( = ?auto_139351 ?auto_139355 ) ) ( not ( = ?auto_139353 ?auto_139355 ) ) ( not ( = ?auto_139354 ?auto_139355 ) ) ( not ( = ?auto_139352 ?auto_139355 ) ) ( ON ?auto_139354 ?auto_139352 ) ( ON-TABLE ?auto_139355 ) ( ON ?auto_139353 ?auto_139354 ) ( ON ?auto_139351 ?auto_139353 ) ( ON ?auto_139350 ?auto_139351 ) ( CLEAR ?auto_139350 ) ( HOLDING ?auto_139349 ) ( CLEAR ?auto_139348 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139347 ?auto_139348 ?auto_139349 )
      ( MAKE-4PILE ?auto_139347 ?auto_139348 ?auto_139349 ?auto_139350 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139356 - BLOCK
      ?auto_139357 - BLOCK
      ?auto_139358 - BLOCK
      ?auto_139359 - BLOCK
    )
    :vars
    (
      ?auto_139361 - BLOCK
      ?auto_139360 - BLOCK
      ?auto_139362 - BLOCK
      ?auto_139364 - BLOCK
      ?auto_139363 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139356 ) ( ON ?auto_139357 ?auto_139356 ) ( not ( = ?auto_139356 ?auto_139357 ) ) ( not ( = ?auto_139356 ?auto_139358 ) ) ( not ( = ?auto_139356 ?auto_139359 ) ) ( not ( = ?auto_139356 ?auto_139361 ) ) ( not ( = ?auto_139357 ?auto_139358 ) ) ( not ( = ?auto_139357 ?auto_139359 ) ) ( not ( = ?auto_139357 ?auto_139361 ) ) ( not ( = ?auto_139358 ?auto_139359 ) ) ( not ( = ?auto_139358 ?auto_139361 ) ) ( not ( = ?auto_139359 ?auto_139361 ) ) ( not ( = ?auto_139356 ?auto_139360 ) ) ( not ( = ?auto_139356 ?auto_139362 ) ) ( not ( = ?auto_139357 ?auto_139360 ) ) ( not ( = ?auto_139357 ?auto_139362 ) ) ( not ( = ?auto_139358 ?auto_139360 ) ) ( not ( = ?auto_139358 ?auto_139362 ) ) ( not ( = ?auto_139359 ?auto_139360 ) ) ( not ( = ?auto_139359 ?auto_139362 ) ) ( not ( = ?auto_139361 ?auto_139360 ) ) ( not ( = ?auto_139361 ?auto_139362 ) ) ( not ( = ?auto_139360 ?auto_139362 ) ) ( not ( = ?auto_139364 ?auto_139362 ) ) ( not ( = ?auto_139356 ?auto_139364 ) ) ( not ( = ?auto_139357 ?auto_139364 ) ) ( not ( = ?auto_139358 ?auto_139364 ) ) ( not ( = ?auto_139359 ?auto_139364 ) ) ( not ( = ?auto_139361 ?auto_139364 ) ) ( not ( = ?auto_139360 ?auto_139364 ) ) ( ON ?auto_139364 ?auto_139363 ) ( not ( = ?auto_139356 ?auto_139363 ) ) ( not ( = ?auto_139357 ?auto_139363 ) ) ( not ( = ?auto_139358 ?auto_139363 ) ) ( not ( = ?auto_139359 ?auto_139363 ) ) ( not ( = ?auto_139361 ?auto_139363 ) ) ( not ( = ?auto_139360 ?auto_139363 ) ) ( not ( = ?auto_139362 ?auto_139363 ) ) ( not ( = ?auto_139364 ?auto_139363 ) ) ( ON ?auto_139362 ?auto_139364 ) ( ON-TABLE ?auto_139363 ) ( ON ?auto_139360 ?auto_139362 ) ( ON ?auto_139361 ?auto_139360 ) ( ON ?auto_139359 ?auto_139361 ) ( CLEAR ?auto_139357 ) ( ON ?auto_139358 ?auto_139359 ) ( CLEAR ?auto_139358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139363 ?auto_139364 ?auto_139362 ?auto_139360 ?auto_139361 ?auto_139359 )
      ( MAKE-4PILE ?auto_139356 ?auto_139357 ?auto_139358 ?auto_139359 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139365 - BLOCK
      ?auto_139366 - BLOCK
      ?auto_139367 - BLOCK
      ?auto_139368 - BLOCK
    )
    :vars
    (
      ?auto_139371 - BLOCK
      ?auto_139373 - BLOCK
      ?auto_139372 - BLOCK
      ?auto_139370 - BLOCK
      ?auto_139369 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139365 ) ( not ( = ?auto_139365 ?auto_139366 ) ) ( not ( = ?auto_139365 ?auto_139367 ) ) ( not ( = ?auto_139365 ?auto_139368 ) ) ( not ( = ?auto_139365 ?auto_139371 ) ) ( not ( = ?auto_139366 ?auto_139367 ) ) ( not ( = ?auto_139366 ?auto_139368 ) ) ( not ( = ?auto_139366 ?auto_139371 ) ) ( not ( = ?auto_139367 ?auto_139368 ) ) ( not ( = ?auto_139367 ?auto_139371 ) ) ( not ( = ?auto_139368 ?auto_139371 ) ) ( not ( = ?auto_139365 ?auto_139373 ) ) ( not ( = ?auto_139365 ?auto_139372 ) ) ( not ( = ?auto_139366 ?auto_139373 ) ) ( not ( = ?auto_139366 ?auto_139372 ) ) ( not ( = ?auto_139367 ?auto_139373 ) ) ( not ( = ?auto_139367 ?auto_139372 ) ) ( not ( = ?auto_139368 ?auto_139373 ) ) ( not ( = ?auto_139368 ?auto_139372 ) ) ( not ( = ?auto_139371 ?auto_139373 ) ) ( not ( = ?auto_139371 ?auto_139372 ) ) ( not ( = ?auto_139373 ?auto_139372 ) ) ( not ( = ?auto_139370 ?auto_139372 ) ) ( not ( = ?auto_139365 ?auto_139370 ) ) ( not ( = ?auto_139366 ?auto_139370 ) ) ( not ( = ?auto_139367 ?auto_139370 ) ) ( not ( = ?auto_139368 ?auto_139370 ) ) ( not ( = ?auto_139371 ?auto_139370 ) ) ( not ( = ?auto_139373 ?auto_139370 ) ) ( ON ?auto_139370 ?auto_139369 ) ( not ( = ?auto_139365 ?auto_139369 ) ) ( not ( = ?auto_139366 ?auto_139369 ) ) ( not ( = ?auto_139367 ?auto_139369 ) ) ( not ( = ?auto_139368 ?auto_139369 ) ) ( not ( = ?auto_139371 ?auto_139369 ) ) ( not ( = ?auto_139373 ?auto_139369 ) ) ( not ( = ?auto_139372 ?auto_139369 ) ) ( not ( = ?auto_139370 ?auto_139369 ) ) ( ON ?auto_139372 ?auto_139370 ) ( ON-TABLE ?auto_139369 ) ( ON ?auto_139373 ?auto_139372 ) ( ON ?auto_139371 ?auto_139373 ) ( ON ?auto_139368 ?auto_139371 ) ( ON ?auto_139367 ?auto_139368 ) ( CLEAR ?auto_139367 ) ( HOLDING ?auto_139366 ) ( CLEAR ?auto_139365 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139365 ?auto_139366 )
      ( MAKE-4PILE ?auto_139365 ?auto_139366 ?auto_139367 ?auto_139368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139374 - BLOCK
      ?auto_139375 - BLOCK
      ?auto_139376 - BLOCK
      ?auto_139377 - BLOCK
    )
    :vars
    (
      ?auto_139379 - BLOCK
      ?auto_139382 - BLOCK
      ?auto_139378 - BLOCK
      ?auto_139380 - BLOCK
      ?auto_139381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139374 ) ( not ( = ?auto_139374 ?auto_139375 ) ) ( not ( = ?auto_139374 ?auto_139376 ) ) ( not ( = ?auto_139374 ?auto_139377 ) ) ( not ( = ?auto_139374 ?auto_139379 ) ) ( not ( = ?auto_139375 ?auto_139376 ) ) ( not ( = ?auto_139375 ?auto_139377 ) ) ( not ( = ?auto_139375 ?auto_139379 ) ) ( not ( = ?auto_139376 ?auto_139377 ) ) ( not ( = ?auto_139376 ?auto_139379 ) ) ( not ( = ?auto_139377 ?auto_139379 ) ) ( not ( = ?auto_139374 ?auto_139382 ) ) ( not ( = ?auto_139374 ?auto_139378 ) ) ( not ( = ?auto_139375 ?auto_139382 ) ) ( not ( = ?auto_139375 ?auto_139378 ) ) ( not ( = ?auto_139376 ?auto_139382 ) ) ( not ( = ?auto_139376 ?auto_139378 ) ) ( not ( = ?auto_139377 ?auto_139382 ) ) ( not ( = ?auto_139377 ?auto_139378 ) ) ( not ( = ?auto_139379 ?auto_139382 ) ) ( not ( = ?auto_139379 ?auto_139378 ) ) ( not ( = ?auto_139382 ?auto_139378 ) ) ( not ( = ?auto_139380 ?auto_139378 ) ) ( not ( = ?auto_139374 ?auto_139380 ) ) ( not ( = ?auto_139375 ?auto_139380 ) ) ( not ( = ?auto_139376 ?auto_139380 ) ) ( not ( = ?auto_139377 ?auto_139380 ) ) ( not ( = ?auto_139379 ?auto_139380 ) ) ( not ( = ?auto_139382 ?auto_139380 ) ) ( ON ?auto_139380 ?auto_139381 ) ( not ( = ?auto_139374 ?auto_139381 ) ) ( not ( = ?auto_139375 ?auto_139381 ) ) ( not ( = ?auto_139376 ?auto_139381 ) ) ( not ( = ?auto_139377 ?auto_139381 ) ) ( not ( = ?auto_139379 ?auto_139381 ) ) ( not ( = ?auto_139382 ?auto_139381 ) ) ( not ( = ?auto_139378 ?auto_139381 ) ) ( not ( = ?auto_139380 ?auto_139381 ) ) ( ON ?auto_139378 ?auto_139380 ) ( ON-TABLE ?auto_139381 ) ( ON ?auto_139382 ?auto_139378 ) ( ON ?auto_139379 ?auto_139382 ) ( ON ?auto_139377 ?auto_139379 ) ( ON ?auto_139376 ?auto_139377 ) ( CLEAR ?auto_139374 ) ( ON ?auto_139375 ?auto_139376 ) ( CLEAR ?auto_139375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139381 ?auto_139380 ?auto_139378 ?auto_139382 ?auto_139379 ?auto_139377 ?auto_139376 )
      ( MAKE-4PILE ?auto_139374 ?auto_139375 ?auto_139376 ?auto_139377 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139383 - BLOCK
      ?auto_139384 - BLOCK
      ?auto_139385 - BLOCK
      ?auto_139386 - BLOCK
    )
    :vars
    (
      ?auto_139389 - BLOCK
      ?auto_139387 - BLOCK
      ?auto_139391 - BLOCK
      ?auto_139388 - BLOCK
      ?auto_139390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139383 ?auto_139384 ) ) ( not ( = ?auto_139383 ?auto_139385 ) ) ( not ( = ?auto_139383 ?auto_139386 ) ) ( not ( = ?auto_139383 ?auto_139389 ) ) ( not ( = ?auto_139384 ?auto_139385 ) ) ( not ( = ?auto_139384 ?auto_139386 ) ) ( not ( = ?auto_139384 ?auto_139389 ) ) ( not ( = ?auto_139385 ?auto_139386 ) ) ( not ( = ?auto_139385 ?auto_139389 ) ) ( not ( = ?auto_139386 ?auto_139389 ) ) ( not ( = ?auto_139383 ?auto_139387 ) ) ( not ( = ?auto_139383 ?auto_139391 ) ) ( not ( = ?auto_139384 ?auto_139387 ) ) ( not ( = ?auto_139384 ?auto_139391 ) ) ( not ( = ?auto_139385 ?auto_139387 ) ) ( not ( = ?auto_139385 ?auto_139391 ) ) ( not ( = ?auto_139386 ?auto_139387 ) ) ( not ( = ?auto_139386 ?auto_139391 ) ) ( not ( = ?auto_139389 ?auto_139387 ) ) ( not ( = ?auto_139389 ?auto_139391 ) ) ( not ( = ?auto_139387 ?auto_139391 ) ) ( not ( = ?auto_139388 ?auto_139391 ) ) ( not ( = ?auto_139383 ?auto_139388 ) ) ( not ( = ?auto_139384 ?auto_139388 ) ) ( not ( = ?auto_139385 ?auto_139388 ) ) ( not ( = ?auto_139386 ?auto_139388 ) ) ( not ( = ?auto_139389 ?auto_139388 ) ) ( not ( = ?auto_139387 ?auto_139388 ) ) ( ON ?auto_139388 ?auto_139390 ) ( not ( = ?auto_139383 ?auto_139390 ) ) ( not ( = ?auto_139384 ?auto_139390 ) ) ( not ( = ?auto_139385 ?auto_139390 ) ) ( not ( = ?auto_139386 ?auto_139390 ) ) ( not ( = ?auto_139389 ?auto_139390 ) ) ( not ( = ?auto_139387 ?auto_139390 ) ) ( not ( = ?auto_139391 ?auto_139390 ) ) ( not ( = ?auto_139388 ?auto_139390 ) ) ( ON ?auto_139391 ?auto_139388 ) ( ON-TABLE ?auto_139390 ) ( ON ?auto_139387 ?auto_139391 ) ( ON ?auto_139389 ?auto_139387 ) ( ON ?auto_139386 ?auto_139389 ) ( ON ?auto_139385 ?auto_139386 ) ( ON ?auto_139384 ?auto_139385 ) ( CLEAR ?auto_139384 ) ( HOLDING ?auto_139383 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139383 )
      ( MAKE-4PILE ?auto_139383 ?auto_139384 ?auto_139385 ?auto_139386 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139392 - BLOCK
      ?auto_139393 - BLOCK
      ?auto_139394 - BLOCK
      ?auto_139395 - BLOCK
    )
    :vars
    (
      ?auto_139397 - BLOCK
      ?auto_139399 - BLOCK
      ?auto_139396 - BLOCK
      ?auto_139398 - BLOCK
      ?auto_139400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139392 ?auto_139393 ) ) ( not ( = ?auto_139392 ?auto_139394 ) ) ( not ( = ?auto_139392 ?auto_139395 ) ) ( not ( = ?auto_139392 ?auto_139397 ) ) ( not ( = ?auto_139393 ?auto_139394 ) ) ( not ( = ?auto_139393 ?auto_139395 ) ) ( not ( = ?auto_139393 ?auto_139397 ) ) ( not ( = ?auto_139394 ?auto_139395 ) ) ( not ( = ?auto_139394 ?auto_139397 ) ) ( not ( = ?auto_139395 ?auto_139397 ) ) ( not ( = ?auto_139392 ?auto_139399 ) ) ( not ( = ?auto_139392 ?auto_139396 ) ) ( not ( = ?auto_139393 ?auto_139399 ) ) ( not ( = ?auto_139393 ?auto_139396 ) ) ( not ( = ?auto_139394 ?auto_139399 ) ) ( not ( = ?auto_139394 ?auto_139396 ) ) ( not ( = ?auto_139395 ?auto_139399 ) ) ( not ( = ?auto_139395 ?auto_139396 ) ) ( not ( = ?auto_139397 ?auto_139399 ) ) ( not ( = ?auto_139397 ?auto_139396 ) ) ( not ( = ?auto_139399 ?auto_139396 ) ) ( not ( = ?auto_139398 ?auto_139396 ) ) ( not ( = ?auto_139392 ?auto_139398 ) ) ( not ( = ?auto_139393 ?auto_139398 ) ) ( not ( = ?auto_139394 ?auto_139398 ) ) ( not ( = ?auto_139395 ?auto_139398 ) ) ( not ( = ?auto_139397 ?auto_139398 ) ) ( not ( = ?auto_139399 ?auto_139398 ) ) ( ON ?auto_139398 ?auto_139400 ) ( not ( = ?auto_139392 ?auto_139400 ) ) ( not ( = ?auto_139393 ?auto_139400 ) ) ( not ( = ?auto_139394 ?auto_139400 ) ) ( not ( = ?auto_139395 ?auto_139400 ) ) ( not ( = ?auto_139397 ?auto_139400 ) ) ( not ( = ?auto_139399 ?auto_139400 ) ) ( not ( = ?auto_139396 ?auto_139400 ) ) ( not ( = ?auto_139398 ?auto_139400 ) ) ( ON ?auto_139396 ?auto_139398 ) ( ON-TABLE ?auto_139400 ) ( ON ?auto_139399 ?auto_139396 ) ( ON ?auto_139397 ?auto_139399 ) ( ON ?auto_139395 ?auto_139397 ) ( ON ?auto_139394 ?auto_139395 ) ( ON ?auto_139393 ?auto_139394 ) ( ON ?auto_139392 ?auto_139393 ) ( CLEAR ?auto_139392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139400 ?auto_139398 ?auto_139396 ?auto_139399 ?auto_139397 ?auto_139395 ?auto_139394 ?auto_139393 )
      ( MAKE-4PILE ?auto_139392 ?auto_139393 ?auto_139394 ?auto_139395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139405 - BLOCK
      ?auto_139406 - BLOCK
      ?auto_139407 - BLOCK
      ?auto_139408 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_139408 ) ( CLEAR ?auto_139407 ) ( ON-TABLE ?auto_139405 ) ( ON ?auto_139406 ?auto_139405 ) ( ON ?auto_139407 ?auto_139406 ) ( not ( = ?auto_139405 ?auto_139406 ) ) ( not ( = ?auto_139405 ?auto_139407 ) ) ( not ( = ?auto_139405 ?auto_139408 ) ) ( not ( = ?auto_139406 ?auto_139407 ) ) ( not ( = ?auto_139406 ?auto_139408 ) ) ( not ( = ?auto_139407 ?auto_139408 ) ) )
    :subtasks
    ( ( !STACK ?auto_139408 ?auto_139407 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139409 - BLOCK
      ?auto_139410 - BLOCK
      ?auto_139411 - BLOCK
      ?auto_139412 - BLOCK
    )
    :vars
    (
      ?auto_139413 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139411 ) ( ON-TABLE ?auto_139409 ) ( ON ?auto_139410 ?auto_139409 ) ( ON ?auto_139411 ?auto_139410 ) ( not ( = ?auto_139409 ?auto_139410 ) ) ( not ( = ?auto_139409 ?auto_139411 ) ) ( not ( = ?auto_139409 ?auto_139412 ) ) ( not ( = ?auto_139410 ?auto_139411 ) ) ( not ( = ?auto_139410 ?auto_139412 ) ) ( not ( = ?auto_139411 ?auto_139412 ) ) ( ON ?auto_139412 ?auto_139413 ) ( CLEAR ?auto_139412 ) ( HAND-EMPTY ) ( not ( = ?auto_139409 ?auto_139413 ) ) ( not ( = ?auto_139410 ?auto_139413 ) ) ( not ( = ?auto_139411 ?auto_139413 ) ) ( not ( = ?auto_139412 ?auto_139413 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139412 ?auto_139413 )
      ( MAKE-4PILE ?auto_139409 ?auto_139410 ?auto_139411 ?auto_139412 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139414 - BLOCK
      ?auto_139415 - BLOCK
      ?auto_139416 - BLOCK
      ?auto_139417 - BLOCK
    )
    :vars
    (
      ?auto_139418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139414 ) ( ON ?auto_139415 ?auto_139414 ) ( not ( = ?auto_139414 ?auto_139415 ) ) ( not ( = ?auto_139414 ?auto_139416 ) ) ( not ( = ?auto_139414 ?auto_139417 ) ) ( not ( = ?auto_139415 ?auto_139416 ) ) ( not ( = ?auto_139415 ?auto_139417 ) ) ( not ( = ?auto_139416 ?auto_139417 ) ) ( ON ?auto_139417 ?auto_139418 ) ( CLEAR ?auto_139417 ) ( not ( = ?auto_139414 ?auto_139418 ) ) ( not ( = ?auto_139415 ?auto_139418 ) ) ( not ( = ?auto_139416 ?auto_139418 ) ) ( not ( = ?auto_139417 ?auto_139418 ) ) ( HOLDING ?auto_139416 ) ( CLEAR ?auto_139415 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139414 ?auto_139415 ?auto_139416 )
      ( MAKE-4PILE ?auto_139414 ?auto_139415 ?auto_139416 ?auto_139417 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139419 - BLOCK
      ?auto_139420 - BLOCK
      ?auto_139421 - BLOCK
      ?auto_139422 - BLOCK
    )
    :vars
    (
      ?auto_139423 - BLOCK
      ?auto_139424 - BLOCK
      ?auto_139426 - BLOCK
      ?auto_139425 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139419 ) ( ON ?auto_139420 ?auto_139419 ) ( not ( = ?auto_139419 ?auto_139420 ) ) ( not ( = ?auto_139419 ?auto_139421 ) ) ( not ( = ?auto_139419 ?auto_139422 ) ) ( not ( = ?auto_139420 ?auto_139421 ) ) ( not ( = ?auto_139420 ?auto_139422 ) ) ( not ( = ?auto_139421 ?auto_139422 ) ) ( ON ?auto_139422 ?auto_139423 ) ( not ( = ?auto_139419 ?auto_139423 ) ) ( not ( = ?auto_139420 ?auto_139423 ) ) ( not ( = ?auto_139421 ?auto_139423 ) ) ( not ( = ?auto_139422 ?auto_139423 ) ) ( CLEAR ?auto_139420 ) ( ON ?auto_139421 ?auto_139422 ) ( CLEAR ?auto_139421 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139424 ) ( ON ?auto_139426 ?auto_139424 ) ( ON ?auto_139425 ?auto_139426 ) ( ON ?auto_139423 ?auto_139425 ) ( not ( = ?auto_139424 ?auto_139426 ) ) ( not ( = ?auto_139424 ?auto_139425 ) ) ( not ( = ?auto_139424 ?auto_139423 ) ) ( not ( = ?auto_139424 ?auto_139422 ) ) ( not ( = ?auto_139424 ?auto_139421 ) ) ( not ( = ?auto_139426 ?auto_139425 ) ) ( not ( = ?auto_139426 ?auto_139423 ) ) ( not ( = ?auto_139426 ?auto_139422 ) ) ( not ( = ?auto_139426 ?auto_139421 ) ) ( not ( = ?auto_139425 ?auto_139423 ) ) ( not ( = ?auto_139425 ?auto_139422 ) ) ( not ( = ?auto_139425 ?auto_139421 ) ) ( not ( = ?auto_139419 ?auto_139424 ) ) ( not ( = ?auto_139419 ?auto_139426 ) ) ( not ( = ?auto_139419 ?auto_139425 ) ) ( not ( = ?auto_139420 ?auto_139424 ) ) ( not ( = ?auto_139420 ?auto_139426 ) ) ( not ( = ?auto_139420 ?auto_139425 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139424 ?auto_139426 ?auto_139425 ?auto_139423 ?auto_139422 )
      ( MAKE-4PILE ?auto_139419 ?auto_139420 ?auto_139421 ?auto_139422 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139427 - BLOCK
      ?auto_139428 - BLOCK
      ?auto_139429 - BLOCK
      ?auto_139430 - BLOCK
    )
    :vars
    (
      ?auto_139434 - BLOCK
      ?auto_139431 - BLOCK
      ?auto_139433 - BLOCK
      ?auto_139432 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139427 ) ( not ( = ?auto_139427 ?auto_139428 ) ) ( not ( = ?auto_139427 ?auto_139429 ) ) ( not ( = ?auto_139427 ?auto_139430 ) ) ( not ( = ?auto_139428 ?auto_139429 ) ) ( not ( = ?auto_139428 ?auto_139430 ) ) ( not ( = ?auto_139429 ?auto_139430 ) ) ( ON ?auto_139430 ?auto_139434 ) ( not ( = ?auto_139427 ?auto_139434 ) ) ( not ( = ?auto_139428 ?auto_139434 ) ) ( not ( = ?auto_139429 ?auto_139434 ) ) ( not ( = ?auto_139430 ?auto_139434 ) ) ( ON ?auto_139429 ?auto_139430 ) ( CLEAR ?auto_139429 ) ( ON-TABLE ?auto_139431 ) ( ON ?auto_139433 ?auto_139431 ) ( ON ?auto_139432 ?auto_139433 ) ( ON ?auto_139434 ?auto_139432 ) ( not ( = ?auto_139431 ?auto_139433 ) ) ( not ( = ?auto_139431 ?auto_139432 ) ) ( not ( = ?auto_139431 ?auto_139434 ) ) ( not ( = ?auto_139431 ?auto_139430 ) ) ( not ( = ?auto_139431 ?auto_139429 ) ) ( not ( = ?auto_139433 ?auto_139432 ) ) ( not ( = ?auto_139433 ?auto_139434 ) ) ( not ( = ?auto_139433 ?auto_139430 ) ) ( not ( = ?auto_139433 ?auto_139429 ) ) ( not ( = ?auto_139432 ?auto_139434 ) ) ( not ( = ?auto_139432 ?auto_139430 ) ) ( not ( = ?auto_139432 ?auto_139429 ) ) ( not ( = ?auto_139427 ?auto_139431 ) ) ( not ( = ?auto_139427 ?auto_139433 ) ) ( not ( = ?auto_139427 ?auto_139432 ) ) ( not ( = ?auto_139428 ?auto_139431 ) ) ( not ( = ?auto_139428 ?auto_139433 ) ) ( not ( = ?auto_139428 ?auto_139432 ) ) ( HOLDING ?auto_139428 ) ( CLEAR ?auto_139427 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139427 ?auto_139428 )
      ( MAKE-4PILE ?auto_139427 ?auto_139428 ?auto_139429 ?auto_139430 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139435 - BLOCK
      ?auto_139436 - BLOCK
      ?auto_139437 - BLOCK
      ?auto_139438 - BLOCK
    )
    :vars
    (
      ?auto_139440 - BLOCK
      ?auto_139441 - BLOCK
      ?auto_139442 - BLOCK
      ?auto_139439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139435 ) ( not ( = ?auto_139435 ?auto_139436 ) ) ( not ( = ?auto_139435 ?auto_139437 ) ) ( not ( = ?auto_139435 ?auto_139438 ) ) ( not ( = ?auto_139436 ?auto_139437 ) ) ( not ( = ?auto_139436 ?auto_139438 ) ) ( not ( = ?auto_139437 ?auto_139438 ) ) ( ON ?auto_139438 ?auto_139440 ) ( not ( = ?auto_139435 ?auto_139440 ) ) ( not ( = ?auto_139436 ?auto_139440 ) ) ( not ( = ?auto_139437 ?auto_139440 ) ) ( not ( = ?auto_139438 ?auto_139440 ) ) ( ON ?auto_139437 ?auto_139438 ) ( ON-TABLE ?auto_139441 ) ( ON ?auto_139442 ?auto_139441 ) ( ON ?auto_139439 ?auto_139442 ) ( ON ?auto_139440 ?auto_139439 ) ( not ( = ?auto_139441 ?auto_139442 ) ) ( not ( = ?auto_139441 ?auto_139439 ) ) ( not ( = ?auto_139441 ?auto_139440 ) ) ( not ( = ?auto_139441 ?auto_139438 ) ) ( not ( = ?auto_139441 ?auto_139437 ) ) ( not ( = ?auto_139442 ?auto_139439 ) ) ( not ( = ?auto_139442 ?auto_139440 ) ) ( not ( = ?auto_139442 ?auto_139438 ) ) ( not ( = ?auto_139442 ?auto_139437 ) ) ( not ( = ?auto_139439 ?auto_139440 ) ) ( not ( = ?auto_139439 ?auto_139438 ) ) ( not ( = ?auto_139439 ?auto_139437 ) ) ( not ( = ?auto_139435 ?auto_139441 ) ) ( not ( = ?auto_139435 ?auto_139442 ) ) ( not ( = ?auto_139435 ?auto_139439 ) ) ( not ( = ?auto_139436 ?auto_139441 ) ) ( not ( = ?auto_139436 ?auto_139442 ) ) ( not ( = ?auto_139436 ?auto_139439 ) ) ( CLEAR ?auto_139435 ) ( ON ?auto_139436 ?auto_139437 ) ( CLEAR ?auto_139436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139441 ?auto_139442 ?auto_139439 ?auto_139440 ?auto_139438 ?auto_139437 )
      ( MAKE-4PILE ?auto_139435 ?auto_139436 ?auto_139437 ?auto_139438 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139443 - BLOCK
      ?auto_139444 - BLOCK
      ?auto_139445 - BLOCK
      ?auto_139446 - BLOCK
    )
    :vars
    (
      ?auto_139450 - BLOCK
      ?auto_139447 - BLOCK
      ?auto_139449 - BLOCK
      ?auto_139448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139443 ?auto_139444 ) ) ( not ( = ?auto_139443 ?auto_139445 ) ) ( not ( = ?auto_139443 ?auto_139446 ) ) ( not ( = ?auto_139444 ?auto_139445 ) ) ( not ( = ?auto_139444 ?auto_139446 ) ) ( not ( = ?auto_139445 ?auto_139446 ) ) ( ON ?auto_139446 ?auto_139450 ) ( not ( = ?auto_139443 ?auto_139450 ) ) ( not ( = ?auto_139444 ?auto_139450 ) ) ( not ( = ?auto_139445 ?auto_139450 ) ) ( not ( = ?auto_139446 ?auto_139450 ) ) ( ON ?auto_139445 ?auto_139446 ) ( ON-TABLE ?auto_139447 ) ( ON ?auto_139449 ?auto_139447 ) ( ON ?auto_139448 ?auto_139449 ) ( ON ?auto_139450 ?auto_139448 ) ( not ( = ?auto_139447 ?auto_139449 ) ) ( not ( = ?auto_139447 ?auto_139448 ) ) ( not ( = ?auto_139447 ?auto_139450 ) ) ( not ( = ?auto_139447 ?auto_139446 ) ) ( not ( = ?auto_139447 ?auto_139445 ) ) ( not ( = ?auto_139449 ?auto_139448 ) ) ( not ( = ?auto_139449 ?auto_139450 ) ) ( not ( = ?auto_139449 ?auto_139446 ) ) ( not ( = ?auto_139449 ?auto_139445 ) ) ( not ( = ?auto_139448 ?auto_139450 ) ) ( not ( = ?auto_139448 ?auto_139446 ) ) ( not ( = ?auto_139448 ?auto_139445 ) ) ( not ( = ?auto_139443 ?auto_139447 ) ) ( not ( = ?auto_139443 ?auto_139449 ) ) ( not ( = ?auto_139443 ?auto_139448 ) ) ( not ( = ?auto_139444 ?auto_139447 ) ) ( not ( = ?auto_139444 ?auto_139449 ) ) ( not ( = ?auto_139444 ?auto_139448 ) ) ( ON ?auto_139444 ?auto_139445 ) ( CLEAR ?auto_139444 ) ( HOLDING ?auto_139443 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139443 )
      ( MAKE-4PILE ?auto_139443 ?auto_139444 ?auto_139445 ?auto_139446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139451 - BLOCK
      ?auto_139452 - BLOCK
      ?auto_139453 - BLOCK
      ?auto_139454 - BLOCK
    )
    :vars
    (
      ?auto_139458 - BLOCK
      ?auto_139457 - BLOCK
      ?auto_139455 - BLOCK
      ?auto_139456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139451 ?auto_139452 ) ) ( not ( = ?auto_139451 ?auto_139453 ) ) ( not ( = ?auto_139451 ?auto_139454 ) ) ( not ( = ?auto_139452 ?auto_139453 ) ) ( not ( = ?auto_139452 ?auto_139454 ) ) ( not ( = ?auto_139453 ?auto_139454 ) ) ( ON ?auto_139454 ?auto_139458 ) ( not ( = ?auto_139451 ?auto_139458 ) ) ( not ( = ?auto_139452 ?auto_139458 ) ) ( not ( = ?auto_139453 ?auto_139458 ) ) ( not ( = ?auto_139454 ?auto_139458 ) ) ( ON ?auto_139453 ?auto_139454 ) ( ON-TABLE ?auto_139457 ) ( ON ?auto_139455 ?auto_139457 ) ( ON ?auto_139456 ?auto_139455 ) ( ON ?auto_139458 ?auto_139456 ) ( not ( = ?auto_139457 ?auto_139455 ) ) ( not ( = ?auto_139457 ?auto_139456 ) ) ( not ( = ?auto_139457 ?auto_139458 ) ) ( not ( = ?auto_139457 ?auto_139454 ) ) ( not ( = ?auto_139457 ?auto_139453 ) ) ( not ( = ?auto_139455 ?auto_139456 ) ) ( not ( = ?auto_139455 ?auto_139458 ) ) ( not ( = ?auto_139455 ?auto_139454 ) ) ( not ( = ?auto_139455 ?auto_139453 ) ) ( not ( = ?auto_139456 ?auto_139458 ) ) ( not ( = ?auto_139456 ?auto_139454 ) ) ( not ( = ?auto_139456 ?auto_139453 ) ) ( not ( = ?auto_139451 ?auto_139457 ) ) ( not ( = ?auto_139451 ?auto_139455 ) ) ( not ( = ?auto_139451 ?auto_139456 ) ) ( not ( = ?auto_139452 ?auto_139457 ) ) ( not ( = ?auto_139452 ?auto_139455 ) ) ( not ( = ?auto_139452 ?auto_139456 ) ) ( ON ?auto_139452 ?auto_139453 ) ( ON ?auto_139451 ?auto_139452 ) ( CLEAR ?auto_139451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139457 ?auto_139455 ?auto_139456 ?auto_139458 ?auto_139454 ?auto_139453 ?auto_139452 )
      ( MAKE-4PILE ?auto_139451 ?auto_139452 ?auto_139453 ?auto_139454 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139459 - BLOCK
      ?auto_139460 - BLOCK
      ?auto_139461 - BLOCK
      ?auto_139462 - BLOCK
    )
    :vars
    (
      ?auto_139466 - BLOCK
      ?auto_139463 - BLOCK
      ?auto_139464 - BLOCK
      ?auto_139465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139459 ?auto_139460 ) ) ( not ( = ?auto_139459 ?auto_139461 ) ) ( not ( = ?auto_139459 ?auto_139462 ) ) ( not ( = ?auto_139460 ?auto_139461 ) ) ( not ( = ?auto_139460 ?auto_139462 ) ) ( not ( = ?auto_139461 ?auto_139462 ) ) ( ON ?auto_139462 ?auto_139466 ) ( not ( = ?auto_139459 ?auto_139466 ) ) ( not ( = ?auto_139460 ?auto_139466 ) ) ( not ( = ?auto_139461 ?auto_139466 ) ) ( not ( = ?auto_139462 ?auto_139466 ) ) ( ON ?auto_139461 ?auto_139462 ) ( ON-TABLE ?auto_139463 ) ( ON ?auto_139464 ?auto_139463 ) ( ON ?auto_139465 ?auto_139464 ) ( ON ?auto_139466 ?auto_139465 ) ( not ( = ?auto_139463 ?auto_139464 ) ) ( not ( = ?auto_139463 ?auto_139465 ) ) ( not ( = ?auto_139463 ?auto_139466 ) ) ( not ( = ?auto_139463 ?auto_139462 ) ) ( not ( = ?auto_139463 ?auto_139461 ) ) ( not ( = ?auto_139464 ?auto_139465 ) ) ( not ( = ?auto_139464 ?auto_139466 ) ) ( not ( = ?auto_139464 ?auto_139462 ) ) ( not ( = ?auto_139464 ?auto_139461 ) ) ( not ( = ?auto_139465 ?auto_139466 ) ) ( not ( = ?auto_139465 ?auto_139462 ) ) ( not ( = ?auto_139465 ?auto_139461 ) ) ( not ( = ?auto_139459 ?auto_139463 ) ) ( not ( = ?auto_139459 ?auto_139464 ) ) ( not ( = ?auto_139459 ?auto_139465 ) ) ( not ( = ?auto_139460 ?auto_139463 ) ) ( not ( = ?auto_139460 ?auto_139464 ) ) ( not ( = ?auto_139460 ?auto_139465 ) ) ( ON ?auto_139460 ?auto_139461 ) ( HOLDING ?auto_139459 ) ( CLEAR ?auto_139460 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139463 ?auto_139464 ?auto_139465 ?auto_139466 ?auto_139462 ?auto_139461 ?auto_139460 ?auto_139459 )
      ( MAKE-4PILE ?auto_139459 ?auto_139460 ?auto_139461 ?auto_139462 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139467 - BLOCK
      ?auto_139468 - BLOCK
      ?auto_139469 - BLOCK
      ?auto_139470 - BLOCK
    )
    :vars
    (
      ?auto_139472 - BLOCK
      ?auto_139474 - BLOCK
      ?auto_139473 - BLOCK
      ?auto_139471 - BLOCK
      ?auto_139475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139467 ?auto_139468 ) ) ( not ( = ?auto_139467 ?auto_139469 ) ) ( not ( = ?auto_139467 ?auto_139470 ) ) ( not ( = ?auto_139468 ?auto_139469 ) ) ( not ( = ?auto_139468 ?auto_139470 ) ) ( not ( = ?auto_139469 ?auto_139470 ) ) ( ON ?auto_139470 ?auto_139472 ) ( not ( = ?auto_139467 ?auto_139472 ) ) ( not ( = ?auto_139468 ?auto_139472 ) ) ( not ( = ?auto_139469 ?auto_139472 ) ) ( not ( = ?auto_139470 ?auto_139472 ) ) ( ON ?auto_139469 ?auto_139470 ) ( ON-TABLE ?auto_139474 ) ( ON ?auto_139473 ?auto_139474 ) ( ON ?auto_139471 ?auto_139473 ) ( ON ?auto_139472 ?auto_139471 ) ( not ( = ?auto_139474 ?auto_139473 ) ) ( not ( = ?auto_139474 ?auto_139471 ) ) ( not ( = ?auto_139474 ?auto_139472 ) ) ( not ( = ?auto_139474 ?auto_139470 ) ) ( not ( = ?auto_139474 ?auto_139469 ) ) ( not ( = ?auto_139473 ?auto_139471 ) ) ( not ( = ?auto_139473 ?auto_139472 ) ) ( not ( = ?auto_139473 ?auto_139470 ) ) ( not ( = ?auto_139473 ?auto_139469 ) ) ( not ( = ?auto_139471 ?auto_139472 ) ) ( not ( = ?auto_139471 ?auto_139470 ) ) ( not ( = ?auto_139471 ?auto_139469 ) ) ( not ( = ?auto_139467 ?auto_139474 ) ) ( not ( = ?auto_139467 ?auto_139473 ) ) ( not ( = ?auto_139467 ?auto_139471 ) ) ( not ( = ?auto_139468 ?auto_139474 ) ) ( not ( = ?auto_139468 ?auto_139473 ) ) ( not ( = ?auto_139468 ?auto_139471 ) ) ( ON ?auto_139468 ?auto_139469 ) ( CLEAR ?auto_139468 ) ( ON ?auto_139467 ?auto_139475 ) ( CLEAR ?auto_139467 ) ( HAND-EMPTY ) ( not ( = ?auto_139467 ?auto_139475 ) ) ( not ( = ?auto_139468 ?auto_139475 ) ) ( not ( = ?auto_139469 ?auto_139475 ) ) ( not ( = ?auto_139470 ?auto_139475 ) ) ( not ( = ?auto_139472 ?auto_139475 ) ) ( not ( = ?auto_139474 ?auto_139475 ) ) ( not ( = ?auto_139473 ?auto_139475 ) ) ( not ( = ?auto_139471 ?auto_139475 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139467 ?auto_139475 )
      ( MAKE-4PILE ?auto_139467 ?auto_139468 ?auto_139469 ?auto_139470 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139476 - BLOCK
      ?auto_139477 - BLOCK
      ?auto_139478 - BLOCK
      ?auto_139479 - BLOCK
    )
    :vars
    (
      ?auto_139484 - BLOCK
      ?auto_139481 - BLOCK
      ?auto_139483 - BLOCK
      ?auto_139480 - BLOCK
      ?auto_139482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139476 ?auto_139477 ) ) ( not ( = ?auto_139476 ?auto_139478 ) ) ( not ( = ?auto_139476 ?auto_139479 ) ) ( not ( = ?auto_139477 ?auto_139478 ) ) ( not ( = ?auto_139477 ?auto_139479 ) ) ( not ( = ?auto_139478 ?auto_139479 ) ) ( ON ?auto_139479 ?auto_139484 ) ( not ( = ?auto_139476 ?auto_139484 ) ) ( not ( = ?auto_139477 ?auto_139484 ) ) ( not ( = ?auto_139478 ?auto_139484 ) ) ( not ( = ?auto_139479 ?auto_139484 ) ) ( ON ?auto_139478 ?auto_139479 ) ( ON-TABLE ?auto_139481 ) ( ON ?auto_139483 ?auto_139481 ) ( ON ?auto_139480 ?auto_139483 ) ( ON ?auto_139484 ?auto_139480 ) ( not ( = ?auto_139481 ?auto_139483 ) ) ( not ( = ?auto_139481 ?auto_139480 ) ) ( not ( = ?auto_139481 ?auto_139484 ) ) ( not ( = ?auto_139481 ?auto_139479 ) ) ( not ( = ?auto_139481 ?auto_139478 ) ) ( not ( = ?auto_139483 ?auto_139480 ) ) ( not ( = ?auto_139483 ?auto_139484 ) ) ( not ( = ?auto_139483 ?auto_139479 ) ) ( not ( = ?auto_139483 ?auto_139478 ) ) ( not ( = ?auto_139480 ?auto_139484 ) ) ( not ( = ?auto_139480 ?auto_139479 ) ) ( not ( = ?auto_139480 ?auto_139478 ) ) ( not ( = ?auto_139476 ?auto_139481 ) ) ( not ( = ?auto_139476 ?auto_139483 ) ) ( not ( = ?auto_139476 ?auto_139480 ) ) ( not ( = ?auto_139477 ?auto_139481 ) ) ( not ( = ?auto_139477 ?auto_139483 ) ) ( not ( = ?auto_139477 ?auto_139480 ) ) ( ON ?auto_139476 ?auto_139482 ) ( CLEAR ?auto_139476 ) ( not ( = ?auto_139476 ?auto_139482 ) ) ( not ( = ?auto_139477 ?auto_139482 ) ) ( not ( = ?auto_139478 ?auto_139482 ) ) ( not ( = ?auto_139479 ?auto_139482 ) ) ( not ( = ?auto_139484 ?auto_139482 ) ) ( not ( = ?auto_139481 ?auto_139482 ) ) ( not ( = ?auto_139483 ?auto_139482 ) ) ( not ( = ?auto_139480 ?auto_139482 ) ) ( HOLDING ?auto_139477 ) ( CLEAR ?auto_139478 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139481 ?auto_139483 ?auto_139480 ?auto_139484 ?auto_139479 ?auto_139478 ?auto_139477 )
      ( MAKE-4PILE ?auto_139476 ?auto_139477 ?auto_139478 ?auto_139479 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139485 - BLOCK
      ?auto_139486 - BLOCK
      ?auto_139487 - BLOCK
      ?auto_139488 - BLOCK
    )
    :vars
    (
      ?auto_139489 - BLOCK
      ?auto_139493 - BLOCK
      ?auto_139491 - BLOCK
      ?auto_139490 - BLOCK
      ?auto_139492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139485 ?auto_139486 ) ) ( not ( = ?auto_139485 ?auto_139487 ) ) ( not ( = ?auto_139485 ?auto_139488 ) ) ( not ( = ?auto_139486 ?auto_139487 ) ) ( not ( = ?auto_139486 ?auto_139488 ) ) ( not ( = ?auto_139487 ?auto_139488 ) ) ( ON ?auto_139488 ?auto_139489 ) ( not ( = ?auto_139485 ?auto_139489 ) ) ( not ( = ?auto_139486 ?auto_139489 ) ) ( not ( = ?auto_139487 ?auto_139489 ) ) ( not ( = ?auto_139488 ?auto_139489 ) ) ( ON ?auto_139487 ?auto_139488 ) ( ON-TABLE ?auto_139493 ) ( ON ?auto_139491 ?auto_139493 ) ( ON ?auto_139490 ?auto_139491 ) ( ON ?auto_139489 ?auto_139490 ) ( not ( = ?auto_139493 ?auto_139491 ) ) ( not ( = ?auto_139493 ?auto_139490 ) ) ( not ( = ?auto_139493 ?auto_139489 ) ) ( not ( = ?auto_139493 ?auto_139488 ) ) ( not ( = ?auto_139493 ?auto_139487 ) ) ( not ( = ?auto_139491 ?auto_139490 ) ) ( not ( = ?auto_139491 ?auto_139489 ) ) ( not ( = ?auto_139491 ?auto_139488 ) ) ( not ( = ?auto_139491 ?auto_139487 ) ) ( not ( = ?auto_139490 ?auto_139489 ) ) ( not ( = ?auto_139490 ?auto_139488 ) ) ( not ( = ?auto_139490 ?auto_139487 ) ) ( not ( = ?auto_139485 ?auto_139493 ) ) ( not ( = ?auto_139485 ?auto_139491 ) ) ( not ( = ?auto_139485 ?auto_139490 ) ) ( not ( = ?auto_139486 ?auto_139493 ) ) ( not ( = ?auto_139486 ?auto_139491 ) ) ( not ( = ?auto_139486 ?auto_139490 ) ) ( ON ?auto_139485 ?auto_139492 ) ( not ( = ?auto_139485 ?auto_139492 ) ) ( not ( = ?auto_139486 ?auto_139492 ) ) ( not ( = ?auto_139487 ?auto_139492 ) ) ( not ( = ?auto_139488 ?auto_139492 ) ) ( not ( = ?auto_139489 ?auto_139492 ) ) ( not ( = ?auto_139493 ?auto_139492 ) ) ( not ( = ?auto_139491 ?auto_139492 ) ) ( not ( = ?auto_139490 ?auto_139492 ) ) ( CLEAR ?auto_139487 ) ( ON ?auto_139486 ?auto_139485 ) ( CLEAR ?auto_139486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139492 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139492 ?auto_139485 )
      ( MAKE-4PILE ?auto_139485 ?auto_139486 ?auto_139487 ?auto_139488 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139494 - BLOCK
      ?auto_139495 - BLOCK
      ?auto_139496 - BLOCK
      ?auto_139497 - BLOCK
    )
    :vars
    (
      ?auto_139501 - BLOCK
      ?auto_139502 - BLOCK
      ?auto_139498 - BLOCK
      ?auto_139499 - BLOCK
      ?auto_139500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139494 ?auto_139495 ) ) ( not ( = ?auto_139494 ?auto_139496 ) ) ( not ( = ?auto_139494 ?auto_139497 ) ) ( not ( = ?auto_139495 ?auto_139496 ) ) ( not ( = ?auto_139495 ?auto_139497 ) ) ( not ( = ?auto_139496 ?auto_139497 ) ) ( ON ?auto_139497 ?auto_139501 ) ( not ( = ?auto_139494 ?auto_139501 ) ) ( not ( = ?auto_139495 ?auto_139501 ) ) ( not ( = ?auto_139496 ?auto_139501 ) ) ( not ( = ?auto_139497 ?auto_139501 ) ) ( ON-TABLE ?auto_139502 ) ( ON ?auto_139498 ?auto_139502 ) ( ON ?auto_139499 ?auto_139498 ) ( ON ?auto_139501 ?auto_139499 ) ( not ( = ?auto_139502 ?auto_139498 ) ) ( not ( = ?auto_139502 ?auto_139499 ) ) ( not ( = ?auto_139502 ?auto_139501 ) ) ( not ( = ?auto_139502 ?auto_139497 ) ) ( not ( = ?auto_139502 ?auto_139496 ) ) ( not ( = ?auto_139498 ?auto_139499 ) ) ( not ( = ?auto_139498 ?auto_139501 ) ) ( not ( = ?auto_139498 ?auto_139497 ) ) ( not ( = ?auto_139498 ?auto_139496 ) ) ( not ( = ?auto_139499 ?auto_139501 ) ) ( not ( = ?auto_139499 ?auto_139497 ) ) ( not ( = ?auto_139499 ?auto_139496 ) ) ( not ( = ?auto_139494 ?auto_139502 ) ) ( not ( = ?auto_139494 ?auto_139498 ) ) ( not ( = ?auto_139494 ?auto_139499 ) ) ( not ( = ?auto_139495 ?auto_139502 ) ) ( not ( = ?auto_139495 ?auto_139498 ) ) ( not ( = ?auto_139495 ?auto_139499 ) ) ( ON ?auto_139494 ?auto_139500 ) ( not ( = ?auto_139494 ?auto_139500 ) ) ( not ( = ?auto_139495 ?auto_139500 ) ) ( not ( = ?auto_139496 ?auto_139500 ) ) ( not ( = ?auto_139497 ?auto_139500 ) ) ( not ( = ?auto_139501 ?auto_139500 ) ) ( not ( = ?auto_139502 ?auto_139500 ) ) ( not ( = ?auto_139498 ?auto_139500 ) ) ( not ( = ?auto_139499 ?auto_139500 ) ) ( ON ?auto_139495 ?auto_139494 ) ( CLEAR ?auto_139495 ) ( ON-TABLE ?auto_139500 ) ( HOLDING ?auto_139496 ) ( CLEAR ?auto_139497 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139502 ?auto_139498 ?auto_139499 ?auto_139501 ?auto_139497 ?auto_139496 )
      ( MAKE-4PILE ?auto_139494 ?auto_139495 ?auto_139496 ?auto_139497 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139503 - BLOCK
      ?auto_139504 - BLOCK
      ?auto_139505 - BLOCK
      ?auto_139506 - BLOCK
    )
    :vars
    (
      ?auto_139509 - BLOCK
      ?auto_139510 - BLOCK
      ?auto_139507 - BLOCK
      ?auto_139511 - BLOCK
      ?auto_139508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139503 ?auto_139504 ) ) ( not ( = ?auto_139503 ?auto_139505 ) ) ( not ( = ?auto_139503 ?auto_139506 ) ) ( not ( = ?auto_139504 ?auto_139505 ) ) ( not ( = ?auto_139504 ?auto_139506 ) ) ( not ( = ?auto_139505 ?auto_139506 ) ) ( ON ?auto_139506 ?auto_139509 ) ( not ( = ?auto_139503 ?auto_139509 ) ) ( not ( = ?auto_139504 ?auto_139509 ) ) ( not ( = ?auto_139505 ?auto_139509 ) ) ( not ( = ?auto_139506 ?auto_139509 ) ) ( ON-TABLE ?auto_139510 ) ( ON ?auto_139507 ?auto_139510 ) ( ON ?auto_139511 ?auto_139507 ) ( ON ?auto_139509 ?auto_139511 ) ( not ( = ?auto_139510 ?auto_139507 ) ) ( not ( = ?auto_139510 ?auto_139511 ) ) ( not ( = ?auto_139510 ?auto_139509 ) ) ( not ( = ?auto_139510 ?auto_139506 ) ) ( not ( = ?auto_139510 ?auto_139505 ) ) ( not ( = ?auto_139507 ?auto_139511 ) ) ( not ( = ?auto_139507 ?auto_139509 ) ) ( not ( = ?auto_139507 ?auto_139506 ) ) ( not ( = ?auto_139507 ?auto_139505 ) ) ( not ( = ?auto_139511 ?auto_139509 ) ) ( not ( = ?auto_139511 ?auto_139506 ) ) ( not ( = ?auto_139511 ?auto_139505 ) ) ( not ( = ?auto_139503 ?auto_139510 ) ) ( not ( = ?auto_139503 ?auto_139507 ) ) ( not ( = ?auto_139503 ?auto_139511 ) ) ( not ( = ?auto_139504 ?auto_139510 ) ) ( not ( = ?auto_139504 ?auto_139507 ) ) ( not ( = ?auto_139504 ?auto_139511 ) ) ( ON ?auto_139503 ?auto_139508 ) ( not ( = ?auto_139503 ?auto_139508 ) ) ( not ( = ?auto_139504 ?auto_139508 ) ) ( not ( = ?auto_139505 ?auto_139508 ) ) ( not ( = ?auto_139506 ?auto_139508 ) ) ( not ( = ?auto_139509 ?auto_139508 ) ) ( not ( = ?auto_139510 ?auto_139508 ) ) ( not ( = ?auto_139507 ?auto_139508 ) ) ( not ( = ?auto_139511 ?auto_139508 ) ) ( ON ?auto_139504 ?auto_139503 ) ( ON-TABLE ?auto_139508 ) ( CLEAR ?auto_139506 ) ( ON ?auto_139505 ?auto_139504 ) ( CLEAR ?auto_139505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139508 ?auto_139503 ?auto_139504 )
      ( MAKE-4PILE ?auto_139503 ?auto_139504 ?auto_139505 ?auto_139506 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139512 - BLOCK
      ?auto_139513 - BLOCK
      ?auto_139514 - BLOCK
      ?auto_139515 - BLOCK
    )
    :vars
    (
      ?auto_139518 - BLOCK
      ?auto_139516 - BLOCK
      ?auto_139517 - BLOCK
      ?auto_139519 - BLOCK
      ?auto_139520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139512 ?auto_139513 ) ) ( not ( = ?auto_139512 ?auto_139514 ) ) ( not ( = ?auto_139512 ?auto_139515 ) ) ( not ( = ?auto_139513 ?auto_139514 ) ) ( not ( = ?auto_139513 ?auto_139515 ) ) ( not ( = ?auto_139514 ?auto_139515 ) ) ( not ( = ?auto_139512 ?auto_139518 ) ) ( not ( = ?auto_139513 ?auto_139518 ) ) ( not ( = ?auto_139514 ?auto_139518 ) ) ( not ( = ?auto_139515 ?auto_139518 ) ) ( ON-TABLE ?auto_139516 ) ( ON ?auto_139517 ?auto_139516 ) ( ON ?auto_139519 ?auto_139517 ) ( ON ?auto_139518 ?auto_139519 ) ( not ( = ?auto_139516 ?auto_139517 ) ) ( not ( = ?auto_139516 ?auto_139519 ) ) ( not ( = ?auto_139516 ?auto_139518 ) ) ( not ( = ?auto_139516 ?auto_139515 ) ) ( not ( = ?auto_139516 ?auto_139514 ) ) ( not ( = ?auto_139517 ?auto_139519 ) ) ( not ( = ?auto_139517 ?auto_139518 ) ) ( not ( = ?auto_139517 ?auto_139515 ) ) ( not ( = ?auto_139517 ?auto_139514 ) ) ( not ( = ?auto_139519 ?auto_139518 ) ) ( not ( = ?auto_139519 ?auto_139515 ) ) ( not ( = ?auto_139519 ?auto_139514 ) ) ( not ( = ?auto_139512 ?auto_139516 ) ) ( not ( = ?auto_139512 ?auto_139517 ) ) ( not ( = ?auto_139512 ?auto_139519 ) ) ( not ( = ?auto_139513 ?auto_139516 ) ) ( not ( = ?auto_139513 ?auto_139517 ) ) ( not ( = ?auto_139513 ?auto_139519 ) ) ( ON ?auto_139512 ?auto_139520 ) ( not ( = ?auto_139512 ?auto_139520 ) ) ( not ( = ?auto_139513 ?auto_139520 ) ) ( not ( = ?auto_139514 ?auto_139520 ) ) ( not ( = ?auto_139515 ?auto_139520 ) ) ( not ( = ?auto_139518 ?auto_139520 ) ) ( not ( = ?auto_139516 ?auto_139520 ) ) ( not ( = ?auto_139517 ?auto_139520 ) ) ( not ( = ?auto_139519 ?auto_139520 ) ) ( ON ?auto_139513 ?auto_139512 ) ( ON-TABLE ?auto_139520 ) ( ON ?auto_139514 ?auto_139513 ) ( CLEAR ?auto_139514 ) ( HOLDING ?auto_139515 ) ( CLEAR ?auto_139518 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139516 ?auto_139517 ?auto_139519 ?auto_139518 ?auto_139515 )
      ( MAKE-4PILE ?auto_139512 ?auto_139513 ?auto_139514 ?auto_139515 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139521 - BLOCK
      ?auto_139522 - BLOCK
      ?auto_139523 - BLOCK
      ?auto_139524 - BLOCK
    )
    :vars
    (
      ?auto_139525 - BLOCK
      ?auto_139529 - BLOCK
      ?auto_139526 - BLOCK
      ?auto_139528 - BLOCK
      ?auto_139527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139521 ?auto_139522 ) ) ( not ( = ?auto_139521 ?auto_139523 ) ) ( not ( = ?auto_139521 ?auto_139524 ) ) ( not ( = ?auto_139522 ?auto_139523 ) ) ( not ( = ?auto_139522 ?auto_139524 ) ) ( not ( = ?auto_139523 ?auto_139524 ) ) ( not ( = ?auto_139521 ?auto_139525 ) ) ( not ( = ?auto_139522 ?auto_139525 ) ) ( not ( = ?auto_139523 ?auto_139525 ) ) ( not ( = ?auto_139524 ?auto_139525 ) ) ( ON-TABLE ?auto_139529 ) ( ON ?auto_139526 ?auto_139529 ) ( ON ?auto_139528 ?auto_139526 ) ( ON ?auto_139525 ?auto_139528 ) ( not ( = ?auto_139529 ?auto_139526 ) ) ( not ( = ?auto_139529 ?auto_139528 ) ) ( not ( = ?auto_139529 ?auto_139525 ) ) ( not ( = ?auto_139529 ?auto_139524 ) ) ( not ( = ?auto_139529 ?auto_139523 ) ) ( not ( = ?auto_139526 ?auto_139528 ) ) ( not ( = ?auto_139526 ?auto_139525 ) ) ( not ( = ?auto_139526 ?auto_139524 ) ) ( not ( = ?auto_139526 ?auto_139523 ) ) ( not ( = ?auto_139528 ?auto_139525 ) ) ( not ( = ?auto_139528 ?auto_139524 ) ) ( not ( = ?auto_139528 ?auto_139523 ) ) ( not ( = ?auto_139521 ?auto_139529 ) ) ( not ( = ?auto_139521 ?auto_139526 ) ) ( not ( = ?auto_139521 ?auto_139528 ) ) ( not ( = ?auto_139522 ?auto_139529 ) ) ( not ( = ?auto_139522 ?auto_139526 ) ) ( not ( = ?auto_139522 ?auto_139528 ) ) ( ON ?auto_139521 ?auto_139527 ) ( not ( = ?auto_139521 ?auto_139527 ) ) ( not ( = ?auto_139522 ?auto_139527 ) ) ( not ( = ?auto_139523 ?auto_139527 ) ) ( not ( = ?auto_139524 ?auto_139527 ) ) ( not ( = ?auto_139525 ?auto_139527 ) ) ( not ( = ?auto_139529 ?auto_139527 ) ) ( not ( = ?auto_139526 ?auto_139527 ) ) ( not ( = ?auto_139528 ?auto_139527 ) ) ( ON ?auto_139522 ?auto_139521 ) ( ON-TABLE ?auto_139527 ) ( ON ?auto_139523 ?auto_139522 ) ( CLEAR ?auto_139525 ) ( ON ?auto_139524 ?auto_139523 ) ( CLEAR ?auto_139524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139527 ?auto_139521 ?auto_139522 ?auto_139523 )
      ( MAKE-4PILE ?auto_139521 ?auto_139522 ?auto_139523 ?auto_139524 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139530 - BLOCK
      ?auto_139531 - BLOCK
      ?auto_139532 - BLOCK
      ?auto_139533 - BLOCK
    )
    :vars
    (
      ?auto_139535 - BLOCK
      ?auto_139537 - BLOCK
      ?auto_139538 - BLOCK
      ?auto_139534 - BLOCK
      ?auto_139536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139530 ?auto_139531 ) ) ( not ( = ?auto_139530 ?auto_139532 ) ) ( not ( = ?auto_139530 ?auto_139533 ) ) ( not ( = ?auto_139531 ?auto_139532 ) ) ( not ( = ?auto_139531 ?auto_139533 ) ) ( not ( = ?auto_139532 ?auto_139533 ) ) ( not ( = ?auto_139530 ?auto_139535 ) ) ( not ( = ?auto_139531 ?auto_139535 ) ) ( not ( = ?auto_139532 ?auto_139535 ) ) ( not ( = ?auto_139533 ?auto_139535 ) ) ( ON-TABLE ?auto_139537 ) ( ON ?auto_139538 ?auto_139537 ) ( ON ?auto_139534 ?auto_139538 ) ( not ( = ?auto_139537 ?auto_139538 ) ) ( not ( = ?auto_139537 ?auto_139534 ) ) ( not ( = ?auto_139537 ?auto_139535 ) ) ( not ( = ?auto_139537 ?auto_139533 ) ) ( not ( = ?auto_139537 ?auto_139532 ) ) ( not ( = ?auto_139538 ?auto_139534 ) ) ( not ( = ?auto_139538 ?auto_139535 ) ) ( not ( = ?auto_139538 ?auto_139533 ) ) ( not ( = ?auto_139538 ?auto_139532 ) ) ( not ( = ?auto_139534 ?auto_139535 ) ) ( not ( = ?auto_139534 ?auto_139533 ) ) ( not ( = ?auto_139534 ?auto_139532 ) ) ( not ( = ?auto_139530 ?auto_139537 ) ) ( not ( = ?auto_139530 ?auto_139538 ) ) ( not ( = ?auto_139530 ?auto_139534 ) ) ( not ( = ?auto_139531 ?auto_139537 ) ) ( not ( = ?auto_139531 ?auto_139538 ) ) ( not ( = ?auto_139531 ?auto_139534 ) ) ( ON ?auto_139530 ?auto_139536 ) ( not ( = ?auto_139530 ?auto_139536 ) ) ( not ( = ?auto_139531 ?auto_139536 ) ) ( not ( = ?auto_139532 ?auto_139536 ) ) ( not ( = ?auto_139533 ?auto_139536 ) ) ( not ( = ?auto_139535 ?auto_139536 ) ) ( not ( = ?auto_139537 ?auto_139536 ) ) ( not ( = ?auto_139538 ?auto_139536 ) ) ( not ( = ?auto_139534 ?auto_139536 ) ) ( ON ?auto_139531 ?auto_139530 ) ( ON-TABLE ?auto_139536 ) ( ON ?auto_139532 ?auto_139531 ) ( ON ?auto_139533 ?auto_139532 ) ( CLEAR ?auto_139533 ) ( HOLDING ?auto_139535 ) ( CLEAR ?auto_139534 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139537 ?auto_139538 ?auto_139534 ?auto_139535 )
      ( MAKE-4PILE ?auto_139530 ?auto_139531 ?auto_139532 ?auto_139533 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139539 - BLOCK
      ?auto_139540 - BLOCK
      ?auto_139541 - BLOCK
      ?auto_139542 - BLOCK
    )
    :vars
    (
      ?auto_139547 - BLOCK
      ?auto_139544 - BLOCK
      ?auto_139545 - BLOCK
      ?auto_139546 - BLOCK
      ?auto_139543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139539 ?auto_139540 ) ) ( not ( = ?auto_139539 ?auto_139541 ) ) ( not ( = ?auto_139539 ?auto_139542 ) ) ( not ( = ?auto_139540 ?auto_139541 ) ) ( not ( = ?auto_139540 ?auto_139542 ) ) ( not ( = ?auto_139541 ?auto_139542 ) ) ( not ( = ?auto_139539 ?auto_139547 ) ) ( not ( = ?auto_139540 ?auto_139547 ) ) ( not ( = ?auto_139541 ?auto_139547 ) ) ( not ( = ?auto_139542 ?auto_139547 ) ) ( ON-TABLE ?auto_139544 ) ( ON ?auto_139545 ?auto_139544 ) ( ON ?auto_139546 ?auto_139545 ) ( not ( = ?auto_139544 ?auto_139545 ) ) ( not ( = ?auto_139544 ?auto_139546 ) ) ( not ( = ?auto_139544 ?auto_139547 ) ) ( not ( = ?auto_139544 ?auto_139542 ) ) ( not ( = ?auto_139544 ?auto_139541 ) ) ( not ( = ?auto_139545 ?auto_139546 ) ) ( not ( = ?auto_139545 ?auto_139547 ) ) ( not ( = ?auto_139545 ?auto_139542 ) ) ( not ( = ?auto_139545 ?auto_139541 ) ) ( not ( = ?auto_139546 ?auto_139547 ) ) ( not ( = ?auto_139546 ?auto_139542 ) ) ( not ( = ?auto_139546 ?auto_139541 ) ) ( not ( = ?auto_139539 ?auto_139544 ) ) ( not ( = ?auto_139539 ?auto_139545 ) ) ( not ( = ?auto_139539 ?auto_139546 ) ) ( not ( = ?auto_139540 ?auto_139544 ) ) ( not ( = ?auto_139540 ?auto_139545 ) ) ( not ( = ?auto_139540 ?auto_139546 ) ) ( ON ?auto_139539 ?auto_139543 ) ( not ( = ?auto_139539 ?auto_139543 ) ) ( not ( = ?auto_139540 ?auto_139543 ) ) ( not ( = ?auto_139541 ?auto_139543 ) ) ( not ( = ?auto_139542 ?auto_139543 ) ) ( not ( = ?auto_139547 ?auto_139543 ) ) ( not ( = ?auto_139544 ?auto_139543 ) ) ( not ( = ?auto_139545 ?auto_139543 ) ) ( not ( = ?auto_139546 ?auto_139543 ) ) ( ON ?auto_139540 ?auto_139539 ) ( ON-TABLE ?auto_139543 ) ( ON ?auto_139541 ?auto_139540 ) ( ON ?auto_139542 ?auto_139541 ) ( CLEAR ?auto_139546 ) ( ON ?auto_139547 ?auto_139542 ) ( CLEAR ?auto_139547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139543 ?auto_139539 ?auto_139540 ?auto_139541 ?auto_139542 )
      ( MAKE-4PILE ?auto_139539 ?auto_139540 ?auto_139541 ?auto_139542 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139548 - BLOCK
      ?auto_139549 - BLOCK
      ?auto_139550 - BLOCK
      ?auto_139551 - BLOCK
    )
    :vars
    (
      ?auto_139555 - BLOCK
      ?auto_139554 - BLOCK
      ?auto_139552 - BLOCK
      ?auto_139553 - BLOCK
      ?auto_139556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139548 ?auto_139549 ) ) ( not ( = ?auto_139548 ?auto_139550 ) ) ( not ( = ?auto_139548 ?auto_139551 ) ) ( not ( = ?auto_139549 ?auto_139550 ) ) ( not ( = ?auto_139549 ?auto_139551 ) ) ( not ( = ?auto_139550 ?auto_139551 ) ) ( not ( = ?auto_139548 ?auto_139555 ) ) ( not ( = ?auto_139549 ?auto_139555 ) ) ( not ( = ?auto_139550 ?auto_139555 ) ) ( not ( = ?auto_139551 ?auto_139555 ) ) ( ON-TABLE ?auto_139554 ) ( ON ?auto_139552 ?auto_139554 ) ( not ( = ?auto_139554 ?auto_139552 ) ) ( not ( = ?auto_139554 ?auto_139553 ) ) ( not ( = ?auto_139554 ?auto_139555 ) ) ( not ( = ?auto_139554 ?auto_139551 ) ) ( not ( = ?auto_139554 ?auto_139550 ) ) ( not ( = ?auto_139552 ?auto_139553 ) ) ( not ( = ?auto_139552 ?auto_139555 ) ) ( not ( = ?auto_139552 ?auto_139551 ) ) ( not ( = ?auto_139552 ?auto_139550 ) ) ( not ( = ?auto_139553 ?auto_139555 ) ) ( not ( = ?auto_139553 ?auto_139551 ) ) ( not ( = ?auto_139553 ?auto_139550 ) ) ( not ( = ?auto_139548 ?auto_139554 ) ) ( not ( = ?auto_139548 ?auto_139552 ) ) ( not ( = ?auto_139548 ?auto_139553 ) ) ( not ( = ?auto_139549 ?auto_139554 ) ) ( not ( = ?auto_139549 ?auto_139552 ) ) ( not ( = ?auto_139549 ?auto_139553 ) ) ( ON ?auto_139548 ?auto_139556 ) ( not ( = ?auto_139548 ?auto_139556 ) ) ( not ( = ?auto_139549 ?auto_139556 ) ) ( not ( = ?auto_139550 ?auto_139556 ) ) ( not ( = ?auto_139551 ?auto_139556 ) ) ( not ( = ?auto_139555 ?auto_139556 ) ) ( not ( = ?auto_139554 ?auto_139556 ) ) ( not ( = ?auto_139552 ?auto_139556 ) ) ( not ( = ?auto_139553 ?auto_139556 ) ) ( ON ?auto_139549 ?auto_139548 ) ( ON-TABLE ?auto_139556 ) ( ON ?auto_139550 ?auto_139549 ) ( ON ?auto_139551 ?auto_139550 ) ( ON ?auto_139555 ?auto_139551 ) ( CLEAR ?auto_139555 ) ( HOLDING ?auto_139553 ) ( CLEAR ?auto_139552 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139554 ?auto_139552 ?auto_139553 )
      ( MAKE-4PILE ?auto_139548 ?auto_139549 ?auto_139550 ?auto_139551 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139557 - BLOCK
      ?auto_139558 - BLOCK
      ?auto_139559 - BLOCK
      ?auto_139560 - BLOCK
    )
    :vars
    (
      ?auto_139564 - BLOCK
      ?auto_139561 - BLOCK
      ?auto_139562 - BLOCK
      ?auto_139565 - BLOCK
      ?auto_139563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139557 ?auto_139558 ) ) ( not ( = ?auto_139557 ?auto_139559 ) ) ( not ( = ?auto_139557 ?auto_139560 ) ) ( not ( = ?auto_139558 ?auto_139559 ) ) ( not ( = ?auto_139558 ?auto_139560 ) ) ( not ( = ?auto_139559 ?auto_139560 ) ) ( not ( = ?auto_139557 ?auto_139564 ) ) ( not ( = ?auto_139558 ?auto_139564 ) ) ( not ( = ?auto_139559 ?auto_139564 ) ) ( not ( = ?auto_139560 ?auto_139564 ) ) ( ON-TABLE ?auto_139561 ) ( ON ?auto_139562 ?auto_139561 ) ( not ( = ?auto_139561 ?auto_139562 ) ) ( not ( = ?auto_139561 ?auto_139565 ) ) ( not ( = ?auto_139561 ?auto_139564 ) ) ( not ( = ?auto_139561 ?auto_139560 ) ) ( not ( = ?auto_139561 ?auto_139559 ) ) ( not ( = ?auto_139562 ?auto_139565 ) ) ( not ( = ?auto_139562 ?auto_139564 ) ) ( not ( = ?auto_139562 ?auto_139560 ) ) ( not ( = ?auto_139562 ?auto_139559 ) ) ( not ( = ?auto_139565 ?auto_139564 ) ) ( not ( = ?auto_139565 ?auto_139560 ) ) ( not ( = ?auto_139565 ?auto_139559 ) ) ( not ( = ?auto_139557 ?auto_139561 ) ) ( not ( = ?auto_139557 ?auto_139562 ) ) ( not ( = ?auto_139557 ?auto_139565 ) ) ( not ( = ?auto_139558 ?auto_139561 ) ) ( not ( = ?auto_139558 ?auto_139562 ) ) ( not ( = ?auto_139558 ?auto_139565 ) ) ( ON ?auto_139557 ?auto_139563 ) ( not ( = ?auto_139557 ?auto_139563 ) ) ( not ( = ?auto_139558 ?auto_139563 ) ) ( not ( = ?auto_139559 ?auto_139563 ) ) ( not ( = ?auto_139560 ?auto_139563 ) ) ( not ( = ?auto_139564 ?auto_139563 ) ) ( not ( = ?auto_139561 ?auto_139563 ) ) ( not ( = ?auto_139562 ?auto_139563 ) ) ( not ( = ?auto_139565 ?auto_139563 ) ) ( ON ?auto_139558 ?auto_139557 ) ( ON-TABLE ?auto_139563 ) ( ON ?auto_139559 ?auto_139558 ) ( ON ?auto_139560 ?auto_139559 ) ( ON ?auto_139564 ?auto_139560 ) ( CLEAR ?auto_139562 ) ( ON ?auto_139565 ?auto_139564 ) ( CLEAR ?auto_139565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139563 ?auto_139557 ?auto_139558 ?auto_139559 ?auto_139560 ?auto_139564 )
      ( MAKE-4PILE ?auto_139557 ?auto_139558 ?auto_139559 ?auto_139560 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139566 - BLOCK
      ?auto_139567 - BLOCK
      ?auto_139568 - BLOCK
      ?auto_139569 - BLOCK
    )
    :vars
    (
      ?auto_139570 - BLOCK
      ?auto_139571 - BLOCK
      ?auto_139573 - BLOCK
      ?auto_139574 - BLOCK
      ?auto_139572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139566 ?auto_139567 ) ) ( not ( = ?auto_139566 ?auto_139568 ) ) ( not ( = ?auto_139566 ?auto_139569 ) ) ( not ( = ?auto_139567 ?auto_139568 ) ) ( not ( = ?auto_139567 ?auto_139569 ) ) ( not ( = ?auto_139568 ?auto_139569 ) ) ( not ( = ?auto_139566 ?auto_139570 ) ) ( not ( = ?auto_139567 ?auto_139570 ) ) ( not ( = ?auto_139568 ?auto_139570 ) ) ( not ( = ?auto_139569 ?auto_139570 ) ) ( ON-TABLE ?auto_139571 ) ( not ( = ?auto_139571 ?auto_139573 ) ) ( not ( = ?auto_139571 ?auto_139574 ) ) ( not ( = ?auto_139571 ?auto_139570 ) ) ( not ( = ?auto_139571 ?auto_139569 ) ) ( not ( = ?auto_139571 ?auto_139568 ) ) ( not ( = ?auto_139573 ?auto_139574 ) ) ( not ( = ?auto_139573 ?auto_139570 ) ) ( not ( = ?auto_139573 ?auto_139569 ) ) ( not ( = ?auto_139573 ?auto_139568 ) ) ( not ( = ?auto_139574 ?auto_139570 ) ) ( not ( = ?auto_139574 ?auto_139569 ) ) ( not ( = ?auto_139574 ?auto_139568 ) ) ( not ( = ?auto_139566 ?auto_139571 ) ) ( not ( = ?auto_139566 ?auto_139573 ) ) ( not ( = ?auto_139566 ?auto_139574 ) ) ( not ( = ?auto_139567 ?auto_139571 ) ) ( not ( = ?auto_139567 ?auto_139573 ) ) ( not ( = ?auto_139567 ?auto_139574 ) ) ( ON ?auto_139566 ?auto_139572 ) ( not ( = ?auto_139566 ?auto_139572 ) ) ( not ( = ?auto_139567 ?auto_139572 ) ) ( not ( = ?auto_139568 ?auto_139572 ) ) ( not ( = ?auto_139569 ?auto_139572 ) ) ( not ( = ?auto_139570 ?auto_139572 ) ) ( not ( = ?auto_139571 ?auto_139572 ) ) ( not ( = ?auto_139573 ?auto_139572 ) ) ( not ( = ?auto_139574 ?auto_139572 ) ) ( ON ?auto_139567 ?auto_139566 ) ( ON-TABLE ?auto_139572 ) ( ON ?auto_139568 ?auto_139567 ) ( ON ?auto_139569 ?auto_139568 ) ( ON ?auto_139570 ?auto_139569 ) ( ON ?auto_139574 ?auto_139570 ) ( CLEAR ?auto_139574 ) ( HOLDING ?auto_139573 ) ( CLEAR ?auto_139571 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139571 ?auto_139573 )
      ( MAKE-4PILE ?auto_139566 ?auto_139567 ?auto_139568 ?auto_139569 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139575 - BLOCK
      ?auto_139576 - BLOCK
      ?auto_139577 - BLOCK
      ?auto_139578 - BLOCK
    )
    :vars
    (
      ?auto_139582 - BLOCK
      ?auto_139583 - BLOCK
      ?auto_139579 - BLOCK
      ?auto_139580 - BLOCK
      ?auto_139581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139575 ?auto_139576 ) ) ( not ( = ?auto_139575 ?auto_139577 ) ) ( not ( = ?auto_139575 ?auto_139578 ) ) ( not ( = ?auto_139576 ?auto_139577 ) ) ( not ( = ?auto_139576 ?auto_139578 ) ) ( not ( = ?auto_139577 ?auto_139578 ) ) ( not ( = ?auto_139575 ?auto_139582 ) ) ( not ( = ?auto_139576 ?auto_139582 ) ) ( not ( = ?auto_139577 ?auto_139582 ) ) ( not ( = ?auto_139578 ?auto_139582 ) ) ( ON-TABLE ?auto_139583 ) ( not ( = ?auto_139583 ?auto_139579 ) ) ( not ( = ?auto_139583 ?auto_139580 ) ) ( not ( = ?auto_139583 ?auto_139582 ) ) ( not ( = ?auto_139583 ?auto_139578 ) ) ( not ( = ?auto_139583 ?auto_139577 ) ) ( not ( = ?auto_139579 ?auto_139580 ) ) ( not ( = ?auto_139579 ?auto_139582 ) ) ( not ( = ?auto_139579 ?auto_139578 ) ) ( not ( = ?auto_139579 ?auto_139577 ) ) ( not ( = ?auto_139580 ?auto_139582 ) ) ( not ( = ?auto_139580 ?auto_139578 ) ) ( not ( = ?auto_139580 ?auto_139577 ) ) ( not ( = ?auto_139575 ?auto_139583 ) ) ( not ( = ?auto_139575 ?auto_139579 ) ) ( not ( = ?auto_139575 ?auto_139580 ) ) ( not ( = ?auto_139576 ?auto_139583 ) ) ( not ( = ?auto_139576 ?auto_139579 ) ) ( not ( = ?auto_139576 ?auto_139580 ) ) ( ON ?auto_139575 ?auto_139581 ) ( not ( = ?auto_139575 ?auto_139581 ) ) ( not ( = ?auto_139576 ?auto_139581 ) ) ( not ( = ?auto_139577 ?auto_139581 ) ) ( not ( = ?auto_139578 ?auto_139581 ) ) ( not ( = ?auto_139582 ?auto_139581 ) ) ( not ( = ?auto_139583 ?auto_139581 ) ) ( not ( = ?auto_139579 ?auto_139581 ) ) ( not ( = ?auto_139580 ?auto_139581 ) ) ( ON ?auto_139576 ?auto_139575 ) ( ON-TABLE ?auto_139581 ) ( ON ?auto_139577 ?auto_139576 ) ( ON ?auto_139578 ?auto_139577 ) ( ON ?auto_139582 ?auto_139578 ) ( ON ?auto_139580 ?auto_139582 ) ( CLEAR ?auto_139583 ) ( ON ?auto_139579 ?auto_139580 ) ( CLEAR ?auto_139579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139581 ?auto_139575 ?auto_139576 ?auto_139577 ?auto_139578 ?auto_139582 ?auto_139580 )
      ( MAKE-4PILE ?auto_139575 ?auto_139576 ?auto_139577 ?auto_139578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139584 - BLOCK
      ?auto_139585 - BLOCK
      ?auto_139586 - BLOCK
      ?auto_139587 - BLOCK
    )
    :vars
    (
      ?auto_139592 - BLOCK
      ?auto_139589 - BLOCK
      ?auto_139590 - BLOCK
      ?auto_139588 - BLOCK
      ?auto_139591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139584 ?auto_139585 ) ) ( not ( = ?auto_139584 ?auto_139586 ) ) ( not ( = ?auto_139584 ?auto_139587 ) ) ( not ( = ?auto_139585 ?auto_139586 ) ) ( not ( = ?auto_139585 ?auto_139587 ) ) ( not ( = ?auto_139586 ?auto_139587 ) ) ( not ( = ?auto_139584 ?auto_139592 ) ) ( not ( = ?auto_139585 ?auto_139592 ) ) ( not ( = ?auto_139586 ?auto_139592 ) ) ( not ( = ?auto_139587 ?auto_139592 ) ) ( not ( = ?auto_139589 ?auto_139590 ) ) ( not ( = ?auto_139589 ?auto_139588 ) ) ( not ( = ?auto_139589 ?auto_139592 ) ) ( not ( = ?auto_139589 ?auto_139587 ) ) ( not ( = ?auto_139589 ?auto_139586 ) ) ( not ( = ?auto_139590 ?auto_139588 ) ) ( not ( = ?auto_139590 ?auto_139592 ) ) ( not ( = ?auto_139590 ?auto_139587 ) ) ( not ( = ?auto_139590 ?auto_139586 ) ) ( not ( = ?auto_139588 ?auto_139592 ) ) ( not ( = ?auto_139588 ?auto_139587 ) ) ( not ( = ?auto_139588 ?auto_139586 ) ) ( not ( = ?auto_139584 ?auto_139589 ) ) ( not ( = ?auto_139584 ?auto_139590 ) ) ( not ( = ?auto_139584 ?auto_139588 ) ) ( not ( = ?auto_139585 ?auto_139589 ) ) ( not ( = ?auto_139585 ?auto_139590 ) ) ( not ( = ?auto_139585 ?auto_139588 ) ) ( ON ?auto_139584 ?auto_139591 ) ( not ( = ?auto_139584 ?auto_139591 ) ) ( not ( = ?auto_139585 ?auto_139591 ) ) ( not ( = ?auto_139586 ?auto_139591 ) ) ( not ( = ?auto_139587 ?auto_139591 ) ) ( not ( = ?auto_139592 ?auto_139591 ) ) ( not ( = ?auto_139589 ?auto_139591 ) ) ( not ( = ?auto_139590 ?auto_139591 ) ) ( not ( = ?auto_139588 ?auto_139591 ) ) ( ON ?auto_139585 ?auto_139584 ) ( ON-TABLE ?auto_139591 ) ( ON ?auto_139586 ?auto_139585 ) ( ON ?auto_139587 ?auto_139586 ) ( ON ?auto_139592 ?auto_139587 ) ( ON ?auto_139588 ?auto_139592 ) ( ON ?auto_139590 ?auto_139588 ) ( CLEAR ?auto_139590 ) ( HOLDING ?auto_139589 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139589 )
      ( MAKE-4PILE ?auto_139584 ?auto_139585 ?auto_139586 ?auto_139587 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_139593 - BLOCK
      ?auto_139594 - BLOCK
      ?auto_139595 - BLOCK
      ?auto_139596 - BLOCK
    )
    :vars
    (
      ?auto_139598 - BLOCK
      ?auto_139600 - BLOCK
      ?auto_139599 - BLOCK
      ?auto_139601 - BLOCK
      ?auto_139597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139593 ?auto_139594 ) ) ( not ( = ?auto_139593 ?auto_139595 ) ) ( not ( = ?auto_139593 ?auto_139596 ) ) ( not ( = ?auto_139594 ?auto_139595 ) ) ( not ( = ?auto_139594 ?auto_139596 ) ) ( not ( = ?auto_139595 ?auto_139596 ) ) ( not ( = ?auto_139593 ?auto_139598 ) ) ( not ( = ?auto_139594 ?auto_139598 ) ) ( not ( = ?auto_139595 ?auto_139598 ) ) ( not ( = ?auto_139596 ?auto_139598 ) ) ( not ( = ?auto_139600 ?auto_139599 ) ) ( not ( = ?auto_139600 ?auto_139601 ) ) ( not ( = ?auto_139600 ?auto_139598 ) ) ( not ( = ?auto_139600 ?auto_139596 ) ) ( not ( = ?auto_139600 ?auto_139595 ) ) ( not ( = ?auto_139599 ?auto_139601 ) ) ( not ( = ?auto_139599 ?auto_139598 ) ) ( not ( = ?auto_139599 ?auto_139596 ) ) ( not ( = ?auto_139599 ?auto_139595 ) ) ( not ( = ?auto_139601 ?auto_139598 ) ) ( not ( = ?auto_139601 ?auto_139596 ) ) ( not ( = ?auto_139601 ?auto_139595 ) ) ( not ( = ?auto_139593 ?auto_139600 ) ) ( not ( = ?auto_139593 ?auto_139599 ) ) ( not ( = ?auto_139593 ?auto_139601 ) ) ( not ( = ?auto_139594 ?auto_139600 ) ) ( not ( = ?auto_139594 ?auto_139599 ) ) ( not ( = ?auto_139594 ?auto_139601 ) ) ( ON ?auto_139593 ?auto_139597 ) ( not ( = ?auto_139593 ?auto_139597 ) ) ( not ( = ?auto_139594 ?auto_139597 ) ) ( not ( = ?auto_139595 ?auto_139597 ) ) ( not ( = ?auto_139596 ?auto_139597 ) ) ( not ( = ?auto_139598 ?auto_139597 ) ) ( not ( = ?auto_139600 ?auto_139597 ) ) ( not ( = ?auto_139599 ?auto_139597 ) ) ( not ( = ?auto_139601 ?auto_139597 ) ) ( ON ?auto_139594 ?auto_139593 ) ( ON-TABLE ?auto_139597 ) ( ON ?auto_139595 ?auto_139594 ) ( ON ?auto_139596 ?auto_139595 ) ( ON ?auto_139598 ?auto_139596 ) ( ON ?auto_139601 ?auto_139598 ) ( ON ?auto_139599 ?auto_139601 ) ( ON ?auto_139600 ?auto_139599 ) ( CLEAR ?auto_139600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139597 ?auto_139593 ?auto_139594 ?auto_139595 ?auto_139596 ?auto_139598 ?auto_139601 ?auto_139599 )
      ( MAKE-4PILE ?auto_139593 ?auto_139594 ?auto_139595 ?auto_139596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139605 - BLOCK
      ?auto_139606 - BLOCK
      ?auto_139607 - BLOCK
    )
    :vars
    (
      ?auto_139608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139608 ?auto_139607 ) ( CLEAR ?auto_139608 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139605 ) ( ON ?auto_139606 ?auto_139605 ) ( ON ?auto_139607 ?auto_139606 ) ( not ( = ?auto_139605 ?auto_139606 ) ) ( not ( = ?auto_139605 ?auto_139607 ) ) ( not ( = ?auto_139605 ?auto_139608 ) ) ( not ( = ?auto_139606 ?auto_139607 ) ) ( not ( = ?auto_139606 ?auto_139608 ) ) ( not ( = ?auto_139607 ?auto_139608 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139608 ?auto_139607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139609 - BLOCK
      ?auto_139610 - BLOCK
      ?auto_139611 - BLOCK
    )
    :vars
    (
      ?auto_139612 - BLOCK
      ?auto_139613 - BLOCK
      ?auto_139614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139612 ?auto_139611 ) ( CLEAR ?auto_139612 ) ( ON-TABLE ?auto_139609 ) ( ON ?auto_139610 ?auto_139609 ) ( ON ?auto_139611 ?auto_139610 ) ( not ( = ?auto_139609 ?auto_139610 ) ) ( not ( = ?auto_139609 ?auto_139611 ) ) ( not ( = ?auto_139609 ?auto_139612 ) ) ( not ( = ?auto_139610 ?auto_139611 ) ) ( not ( = ?auto_139610 ?auto_139612 ) ) ( not ( = ?auto_139611 ?auto_139612 ) ) ( HOLDING ?auto_139613 ) ( CLEAR ?auto_139614 ) ( not ( = ?auto_139609 ?auto_139613 ) ) ( not ( = ?auto_139609 ?auto_139614 ) ) ( not ( = ?auto_139610 ?auto_139613 ) ) ( not ( = ?auto_139610 ?auto_139614 ) ) ( not ( = ?auto_139611 ?auto_139613 ) ) ( not ( = ?auto_139611 ?auto_139614 ) ) ( not ( = ?auto_139612 ?auto_139613 ) ) ( not ( = ?auto_139612 ?auto_139614 ) ) ( not ( = ?auto_139613 ?auto_139614 ) ) )
    :subtasks
    ( ( !STACK ?auto_139613 ?auto_139614 )
      ( MAKE-3PILE ?auto_139609 ?auto_139610 ?auto_139611 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139615 - BLOCK
      ?auto_139616 - BLOCK
      ?auto_139617 - BLOCK
    )
    :vars
    (
      ?auto_139620 - BLOCK
      ?auto_139618 - BLOCK
      ?auto_139619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139620 ?auto_139617 ) ( ON-TABLE ?auto_139615 ) ( ON ?auto_139616 ?auto_139615 ) ( ON ?auto_139617 ?auto_139616 ) ( not ( = ?auto_139615 ?auto_139616 ) ) ( not ( = ?auto_139615 ?auto_139617 ) ) ( not ( = ?auto_139615 ?auto_139620 ) ) ( not ( = ?auto_139616 ?auto_139617 ) ) ( not ( = ?auto_139616 ?auto_139620 ) ) ( not ( = ?auto_139617 ?auto_139620 ) ) ( CLEAR ?auto_139618 ) ( not ( = ?auto_139615 ?auto_139619 ) ) ( not ( = ?auto_139615 ?auto_139618 ) ) ( not ( = ?auto_139616 ?auto_139619 ) ) ( not ( = ?auto_139616 ?auto_139618 ) ) ( not ( = ?auto_139617 ?auto_139619 ) ) ( not ( = ?auto_139617 ?auto_139618 ) ) ( not ( = ?auto_139620 ?auto_139619 ) ) ( not ( = ?auto_139620 ?auto_139618 ) ) ( not ( = ?auto_139619 ?auto_139618 ) ) ( ON ?auto_139619 ?auto_139620 ) ( CLEAR ?auto_139619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139615 ?auto_139616 ?auto_139617 ?auto_139620 )
      ( MAKE-3PILE ?auto_139615 ?auto_139616 ?auto_139617 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139621 - BLOCK
      ?auto_139622 - BLOCK
      ?auto_139623 - BLOCK
    )
    :vars
    (
      ?auto_139625 - BLOCK
      ?auto_139624 - BLOCK
      ?auto_139626 - BLOCK
      ?auto_139628 - BLOCK
      ?auto_139627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139625 ?auto_139623 ) ( ON-TABLE ?auto_139621 ) ( ON ?auto_139622 ?auto_139621 ) ( ON ?auto_139623 ?auto_139622 ) ( not ( = ?auto_139621 ?auto_139622 ) ) ( not ( = ?auto_139621 ?auto_139623 ) ) ( not ( = ?auto_139621 ?auto_139625 ) ) ( not ( = ?auto_139622 ?auto_139623 ) ) ( not ( = ?auto_139622 ?auto_139625 ) ) ( not ( = ?auto_139623 ?auto_139625 ) ) ( not ( = ?auto_139621 ?auto_139624 ) ) ( not ( = ?auto_139621 ?auto_139626 ) ) ( not ( = ?auto_139622 ?auto_139624 ) ) ( not ( = ?auto_139622 ?auto_139626 ) ) ( not ( = ?auto_139623 ?auto_139624 ) ) ( not ( = ?auto_139623 ?auto_139626 ) ) ( not ( = ?auto_139625 ?auto_139624 ) ) ( not ( = ?auto_139625 ?auto_139626 ) ) ( not ( = ?auto_139624 ?auto_139626 ) ) ( ON ?auto_139624 ?auto_139625 ) ( CLEAR ?auto_139624 ) ( HOLDING ?auto_139626 ) ( CLEAR ?auto_139628 ) ( ON-TABLE ?auto_139627 ) ( ON ?auto_139628 ?auto_139627 ) ( not ( = ?auto_139627 ?auto_139628 ) ) ( not ( = ?auto_139627 ?auto_139626 ) ) ( not ( = ?auto_139628 ?auto_139626 ) ) ( not ( = ?auto_139621 ?auto_139628 ) ) ( not ( = ?auto_139621 ?auto_139627 ) ) ( not ( = ?auto_139622 ?auto_139628 ) ) ( not ( = ?auto_139622 ?auto_139627 ) ) ( not ( = ?auto_139623 ?auto_139628 ) ) ( not ( = ?auto_139623 ?auto_139627 ) ) ( not ( = ?auto_139625 ?auto_139628 ) ) ( not ( = ?auto_139625 ?auto_139627 ) ) ( not ( = ?auto_139624 ?auto_139628 ) ) ( not ( = ?auto_139624 ?auto_139627 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139627 ?auto_139628 ?auto_139626 )
      ( MAKE-3PILE ?auto_139621 ?auto_139622 ?auto_139623 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139629 - BLOCK
      ?auto_139630 - BLOCK
      ?auto_139631 - BLOCK
    )
    :vars
    (
      ?auto_139633 - BLOCK
      ?auto_139634 - BLOCK
      ?auto_139632 - BLOCK
      ?auto_139636 - BLOCK
      ?auto_139635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139633 ?auto_139631 ) ( ON-TABLE ?auto_139629 ) ( ON ?auto_139630 ?auto_139629 ) ( ON ?auto_139631 ?auto_139630 ) ( not ( = ?auto_139629 ?auto_139630 ) ) ( not ( = ?auto_139629 ?auto_139631 ) ) ( not ( = ?auto_139629 ?auto_139633 ) ) ( not ( = ?auto_139630 ?auto_139631 ) ) ( not ( = ?auto_139630 ?auto_139633 ) ) ( not ( = ?auto_139631 ?auto_139633 ) ) ( not ( = ?auto_139629 ?auto_139634 ) ) ( not ( = ?auto_139629 ?auto_139632 ) ) ( not ( = ?auto_139630 ?auto_139634 ) ) ( not ( = ?auto_139630 ?auto_139632 ) ) ( not ( = ?auto_139631 ?auto_139634 ) ) ( not ( = ?auto_139631 ?auto_139632 ) ) ( not ( = ?auto_139633 ?auto_139634 ) ) ( not ( = ?auto_139633 ?auto_139632 ) ) ( not ( = ?auto_139634 ?auto_139632 ) ) ( ON ?auto_139634 ?auto_139633 ) ( CLEAR ?auto_139636 ) ( ON-TABLE ?auto_139635 ) ( ON ?auto_139636 ?auto_139635 ) ( not ( = ?auto_139635 ?auto_139636 ) ) ( not ( = ?auto_139635 ?auto_139632 ) ) ( not ( = ?auto_139636 ?auto_139632 ) ) ( not ( = ?auto_139629 ?auto_139636 ) ) ( not ( = ?auto_139629 ?auto_139635 ) ) ( not ( = ?auto_139630 ?auto_139636 ) ) ( not ( = ?auto_139630 ?auto_139635 ) ) ( not ( = ?auto_139631 ?auto_139636 ) ) ( not ( = ?auto_139631 ?auto_139635 ) ) ( not ( = ?auto_139633 ?auto_139636 ) ) ( not ( = ?auto_139633 ?auto_139635 ) ) ( not ( = ?auto_139634 ?auto_139636 ) ) ( not ( = ?auto_139634 ?auto_139635 ) ) ( ON ?auto_139632 ?auto_139634 ) ( CLEAR ?auto_139632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139629 ?auto_139630 ?auto_139631 ?auto_139633 ?auto_139634 )
      ( MAKE-3PILE ?auto_139629 ?auto_139630 ?auto_139631 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139637 - BLOCK
      ?auto_139638 - BLOCK
      ?auto_139639 - BLOCK
    )
    :vars
    (
      ?auto_139642 - BLOCK
      ?auto_139641 - BLOCK
      ?auto_139643 - BLOCK
      ?auto_139640 - BLOCK
      ?auto_139644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139642 ?auto_139639 ) ( ON-TABLE ?auto_139637 ) ( ON ?auto_139638 ?auto_139637 ) ( ON ?auto_139639 ?auto_139638 ) ( not ( = ?auto_139637 ?auto_139638 ) ) ( not ( = ?auto_139637 ?auto_139639 ) ) ( not ( = ?auto_139637 ?auto_139642 ) ) ( not ( = ?auto_139638 ?auto_139639 ) ) ( not ( = ?auto_139638 ?auto_139642 ) ) ( not ( = ?auto_139639 ?auto_139642 ) ) ( not ( = ?auto_139637 ?auto_139641 ) ) ( not ( = ?auto_139637 ?auto_139643 ) ) ( not ( = ?auto_139638 ?auto_139641 ) ) ( not ( = ?auto_139638 ?auto_139643 ) ) ( not ( = ?auto_139639 ?auto_139641 ) ) ( not ( = ?auto_139639 ?auto_139643 ) ) ( not ( = ?auto_139642 ?auto_139641 ) ) ( not ( = ?auto_139642 ?auto_139643 ) ) ( not ( = ?auto_139641 ?auto_139643 ) ) ( ON ?auto_139641 ?auto_139642 ) ( ON-TABLE ?auto_139640 ) ( not ( = ?auto_139640 ?auto_139644 ) ) ( not ( = ?auto_139640 ?auto_139643 ) ) ( not ( = ?auto_139644 ?auto_139643 ) ) ( not ( = ?auto_139637 ?auto_139644 ) ) ( not ( = ?auto_139637 ?auto_139640 ) ) ( not ( = ?auto_139638 ?auto_139644 ) ) ( not ( = ?auto_139638 ?auto_139640 ) ) ( not ( = ?auto_139639 ?auto_139644 ) ) ( not ( = ?auto_139639 ?auto_139640 ) ) ( not ( = ?auto_139642 ?auto_139644 ) ) ( not ( = ?auto_139642 ?auto_139640 ) ) ( not ( = ?auto_139641 ?auto_139644 ) ) ( not ( = ?auto_139641 ?auto_139640 ) ) ( ON ?auto_139643 ?auto_139641 ) ( CLEAR ?auto_139643 ) ( HOLDING ?auto_139644 ) ( CLEAR ?auto_139640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139640 ?auto_139644 )
      ( MAKE-3PILE ?auto_139637 ?auto_139638 ?auto_139639 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139645 - BLOCK
      ?auto_139646 - BLOCK
      ?auto_139647 - BLOCK
    )
    :vars
    (
      ?auto_139650 - BLOCK
      ?auto_139649 - BLOCK
      ?auto_139652 - BLOCK
      ?auto_139648 - BLOCK
      ?auto_139651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139650 ?auto_139647 ) ( ON-TABLE ?auto_139645 ) ( ON ?auto_139646 ?auto_139645 ) ( ON ?auto_139647 ?auto_139646 ) ( not ( = ?auto_139645 ?auto_139646 ) ) ( not ( = ?auto_139645 ?auto_139647 ) ) ( not ( = ?auto_139645 ?auto_139650 ) ) ( not ( = ?auto_139646 ?auto_139647 ) ) ( not ( = ?auto_139646 ?auto_139650 ) ) ( not ( = ?auto_139647 ?auto_139650 ) ) ( not ( = ?auto_139645 ?auto_139649 ) ) ( not ( = ?auto_139645 ?auto_139652 ) ) ( not ( = ?auto_139646 ?auto_139649 ) ) ( not ( = ?auto_139646 ?auto_139652 ) ) ( not ( = ?auto_139647 ?auto_139649 ) ) ( not ( = ?auto_139647 ?auto_139652 ) ) ( not ( = ?auto_139650 ?auto_139649 ) ) ( not ( = ?auto_139650 ?auto_139652 ) ) ( not ( = ?auto_139649 ?auto_139652 ) ) ( ON ?auto_139649 ?auto_139650 ) ( ON-TABLE ?auto_139648 ) ( not ( = ?auto_139648 ?auto_139651 ) ) ( not ( = ?auto_139648 ?auto_139652 ) ) ( not ( = ?auto_139651 ?auto_139652 ) ) ( not ( = ?auto_139645 ?auto_139651 ) ) ( not ( = ?auto_139645 ?auto_139648 ) ) ( not ( = ?auto_139646 ?auto_139651 ) ) ( not ( = ?auto_139646 ?auto_139648 ) ) ( not ( = ?auto_139647 ?auto_139651 ) ) ( not ( = ?auto_139647 ?auto_139648 ) ) ( not ( = ?auto_139650 ?auto_139651 ) ) ( not ( = ?auto_139650 ?auto_139648 ) ) ( not ( = ?auto_139649 ?auto_139651 ) ) ( not ( = ?auto_139649 ?auto_139648 ) ) ( ON ?auto_139652 ?auto_139649 ) ( CLEAR ?auto_139648 ) ( ON ?auto_139651 ?auto_139652 ) ( CLEAR ?auto_139651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139645 ?auto_139646 ?auto_139647 ?auto_139650 ?auto_139649 ?auto_139652 )
      ( MAKE-3PILE ?auto_139645 ?auto_139646 ?auto_139647 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139653 - BLOCK
      ?auto_139654 - BLOCK
      ?auto_139655 - BLOCK
    )
    :vars
    (
      ?auto_139660 - BLOCK
      ?auto_139659 - BLOCK
      ?auto_139656 - BLOCK
      ?auto_139657 - BLOCK
      ?auto_139658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139660 ?auto_139655 ) ( ON-TABLE ?auto_139653 ) ( ON ?auto_139654 ?auto_139653 ) ( ON ?auto_139655 ?auto_139654 ) ( not ( = ?auto_139653 ?auto_139654 ) ) ( not ( = ?auto_139653 ?auto_139655 ) ) ( not ( = ?auto_139653 ?auto_139660 ) ) ( not ( = ?auto_139654 ?auto_139655 ) ) ( not ( = ?auto_139654 ?auto_139660 ) ) ( not ( = ?auto_139655 ?auto_139660 ) ) ( not ( = ?auto_139653 ?auto_139659 ) ) ( not ( = ?auto_139653 ?auto_139656 ) ) ( not ( = ?auto_139654 ?auto_139659 ) ) ( not ( = ?auto_139654 ?auto_139656 ) ) ( not ( = ?auto_139655 ?auto_139659 ) ) ( not ( = ?auto_139655 ?auto_139656 ) ) ( not ( = ?auto_139660 ?auto_139659 ) ) ( not ( = ?auto_139660 ?auto_139656 ) ) ( not ( = ?auto_139659 ?auto_139656 ) ) ( ON ?auto_139659 ?auto_139660 ) ( not ( = ?auto_139657 ?auto_139658 ) ) ( not ( = ?auto_139657 ?auto_139656 ) ) ( not ( = ?auto_139658 ?auto_139656 ) ) ( not ( = ?auto_139653 ?auto_139658 ) ) ( not ( = ?auto_139653 ?auto_139657 ) ) ( not ( = ?auto_139654 ?auto_139658 ) ) ( not ( = ?auto_139654 ?auto_139657 ) ) ( not ( = ?auto_139655 ?auto_139658 ) ) ( not ( = ?auto_139655 ?auto_139657 ) ) ( not ( = ?auto_139660 ?auto_139658 ) ) ( not ( = ?auto_139660 ?auto_139657 ) ) ( not ( = ?auto_139659 ?auto_139658 ) ) ( not ( = ?auto_139659 ?auto_139657 ) ) ( ON ?auto_139656 ?auto_139659 ) ( ON ?auto_139658 ?auto_139656 ) ( CLEAR ?auto_139658 ) ( HOLDING ?auto_139657 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139657 )
      ( MAKE-3PILE ?auto_139653 ?auto_139654 ?auto_139655 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139661 - BLOCK
      ?auto_139662 - BLOCK
      ?auto_139663 - BLOCK
    )
    :vars
    (
      ?auto_139666 - BLOCK
      ?auto_139664 - BLOCK
      ?auto_139668 - BLOCK
      ?auto_139665 - BLOCK
      ?auto_139667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139666 ?auto_139663 ) ( ON-TABLE ?auto_139661 ) ( ON ?auto_139662 ?auto_139661 ) ( ON ?auto_139663 ?auto_139662 ) ( not ( = ?auto_139661 ?auto_139662 ) ) ( not ( = ?auto_139661 ?auto_139663 ) ) ( not ( = ?auto_139661 ?auto_139666 ) ) ( not ( = ?auto_139662 ?auto_139663 ) ) ( not ( = ?auto_139662 ?auto_139666 ) ) ( not ( = ?auto_139663 ?auto_139666 ) ) ( not ( = ?auto_139661 ?auto_139664 ) ) ( not ( = ?auto_139661 ?auto_139668 ) ) ( not ( = ?auto_139662 ?auto_139664 ) ) ( not ( = ?auto_139662 ?auto_139668 ) ) ( not ( = ?auto_139663 ?auto_139664 ) ) ( not ( = ?auto_139663 ?auto_139668 ) ) ( not ( = ?auto_139666 ?auto_139664 ) ) ( not ( = ?auto_139666 ?auto_139668 ) ) ( not ( = ?auto_139664 ?auto_139668 ) ) ( ON ?auto_139664 ?auto_139666 ) ( not ( = ?auto_139665 ?auto_139667 ) ) ( not ( = ?auto_139665 ?auto_139668 ) ) ( not ( = ?auto_139667 ?auto_139668 ) ) ( not ( = ?auto_139661 ?auto_139667 ) ) ( not ( = ?auto_139661 ?auto_139665 ) ) ( not ( = ?auto_139662 ?auto_139667 ) ) ( not ( = ?auto_139662 ?auto_139665 ) ) ( not ( = ?auto_139663 ?auto_139667 ) ) ( not ( = ?auto_139663 ?auto_139665 ) ) ( not ( = ?auto_139666 ?auto_139667 ) ) ( not ( = ?auto_139666 ?auto_139665 ) ) ( not ( = ?auto_139664 ?auto_139667 ) ) ( not ( = ?auto_139664 ?auto_139665 ) ) ( ON ?auto_139668 ?auto_139664 ) ( ON ?auto_139667 ?auto_139668 ) ( ON ?auto_139665 ?auto_139667 ) ( CLEAR ?auto_139665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139661 ?auto_139662 ?auto_139663 ?auto_139666 ?auto_139664 ?auto_139668 ?auto_139667 )
      ( MAKE-3PILE ?auto_139661 ?auto_139662 ?auto_139663 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139669 - BLOCK
      ?auto_139670 - BLOCK
      ?auto_139671 - BLOCK
    )
    :vars
    (
      ?auto_139674 - BLOCK
      ?auto_139673 - BLOCK
      ?auto_139672 - BLOCK
      ?auto_139675 - BLOCK
      ?auto_139676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139674 ?auto_139671 ) ( ON-TABLE ?auto_139669 ) ( ON ?auto_139670 ?auto_139669 ) ( ON ?auto_139671 ?auto_139670 ) ( not ( = ?auto_139669 ?auto_139670 ) ) ( not ( = ?auto_139669 ?auto_139671 ) ) ( not ( = ?auto_139669 ?auto_139674 ) ) ( not ( = ?auto_139670 ?auto_139671 ) ) ( not ( = ?auto_139670 ?auto_139674 ) ) ( not ( = ?auto_139671 ?auto_139674 ) ) ( not ( = ?auto_139669 ?auto_139673 ) ) ( not ( = ?auto_139669 ?auto_139672 ) ) ( not ( = ?auto_139670 ?auto_139673 ) ) ( not ( = ?auto_139670 ?auto_139672 ) ) ( not ( = ?auto_139671 ?auto_139673 ) ) ( not ( = ?auto_139671 ?auto_139672 ) ) ( not ( = ?auto_139674 ?auto_139673 ) ) ( not ( = ?auto_139674 ?auto_139672 ) ) ( not ( = ?auto_139673 ?auto_139672 ) ) ( ON ?auto_139673 ?auto_139674 ) ( not ( = ?auto_139675 ?auto_139676 ) ) ( not ( = ?auto_139675 ?auto_139672 ) ) ( not ( = ?auto_139676 ?auto_139672 ) ) ( not ( = ?auto_139669 ?auto_139676 ) ) ( not ( = ?auto_139669 ?auto_139675 ) ) ( not ( = ?auto_139670 ?auto_139676 ) ) ( not ( = ?auto_139670 ?auto_139675 ) ) ( not ( = ?auto_139671 ?auto_139676 ) ) ( not ( = ?auto_139671 ?auto_139675 ) ) ( not ( = ?auto_139674 ?auto_139676 ) ) ( not ( = ?auto_139674 ?auto_139675 ) ) ( not ( = ?auto_139673 ?auto_139676 ) ) ( not ( = ?auto_139673 ?auto_139675 ) ) ( ON ?auto_139672 ?auto_139673 ) ( ON ?auto_139676 ?auto_139672 ) ( HOLDING ?auto_139675 ) ( CLEAR ?auto_139676 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139669 ?auto_139670 ?auto_139671 ?auto_139674 ?auto_139673 ?auto_139672 ?auto_139676 ?auto_139675 )
      ( MAKE-3PILE ?auto_139669 ?auto_139670 ?auto_139671 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139677 - BLOCK
      ?auto_139678 - BLOCK
      ?auto_139679 - BLOCK
    )
    :vars
    (
      ?auto_139682 - BLOCK
      ?auto_139684 - BLOCK
      ?auto_139683 - BLOCK
      ?auto_139681 - BLOCK
      ?auto_139680 - BLOCK
      ?auto_139685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139682 ?auto_139679 ) ( ON-TABLE ?auto_139677 ) ( ON ?auto_139678 ?auto_139677 ) ( ON ?auto_139679 ?auto_139678 ) ( not ( = ?auto_139677 ?auto_139678 ) ) ( not ( = ?auto_139677 ?auto_139679 ) ) ( not ( = ?auto_139677 ?auto_139682 ) ) ( not ( = ?auto_139678 ?auto_139679 ) ) ( not ( = ?auto_139678 ?auto_139682 ) ) ( not ( = ?auto_139679 ?auto_139682 ) ) ( not ( = ?auto_139677 ?auto_139684 ) ) ( not ( = ?auto_139677 ?auto_139683 ) ) ( not ( = ?auto_139678 ?auto_139684 ) ) ( not ( = ?auto_139678 ?auto_139683 ) ) ( not ( = ?auto_139679 ?auto_139684 ) ) ( not ( = ?auto_139679 ?auto_139683 ) ) ( not ( = ?auto_139682 ?auto_139684 ) ) ( not ( = ?auto_139682 ?auto_139683 ) ) ( not ( = ?auto_139684 ?auto_139683 ) ) ( ON ?auto_139684 ?auto_139682 ) ( not ( = ?auto_139681 ?auto_139680 ) ) ( not ( = ?auto_139681 ?auto_139683 ) ) ( not ( = ?auto_139680 ?auto_139683 ) ) ( not ( = ?auto_139677 ?auto_139680 ) ) ( not ( = ?auto_139677 ?auto_139681 ) ) ( not ( = ?auto_139678 ?auto_139680 ) ) ( not ( = ?auto_139678 ?auto_139681 ) ) ( not ( = ?auto_139679 ?auto_139680 ) ) ( not ( = ?auto_139679 ?auto_139681 ) ) ( not ( = ?auto_139682 ?auto_139680 ) ) ( not ( = ?auto_139682 ?auto_139681 ) ) ( not ( = ?auto_139684 ?auto_139680 ) ) ( not ( = ?auto_139684 ?auto_139681 ) ) ( ON ?auto_139683 ?auto_139684 ) ( ON ?auto_139680 ?auto_139683 ) ( CLEAR ?auto_139680 ) ( ON ?auto_139681 ?auto_139685 ) ( CLEAR ?auto_139681 ) ( HAND-EMPTY ) ( not ( = ?auto_139677 ?auto_139685 ) ) ( not ( = ?auto_139678 ?auto_139685 ) ) ( not ( = ?auto_139679 ?auto_139685 ) ) ( not ( = ?auto_139682 ?auto_139685 ) ) ( not ( = ?auto_139684 ?auto_139685 ) ) ( not ( = ?auto_139683 ?auto_139685 ) ) ( not ( = ?auto_139681 ?auto_139685 ) ) ( not ( = ?auto_139680 ?auto_139685 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139681 ?auto_139685 )
      ( MAKE-3PILE ?auto_139677 ?auto_139678 ?auto_139679 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139686 - BLOCK
      ?auto_139687 - BLOCK
      ?auto_139688 - BLOCK
    )
    :vars
    (
      ?auto_139692 - BLOCK
      ?auto_139689 - BLOCK
      ?auto_139693 - BLOCK
      ?auto_139690 - BLOCK
      ?auto_139694 - BLOCK
      ?auto_139691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139692 ?auto_139688 ) ( ON-TABLE ?auto_139686 ) ( ON ?auto_139687 ?auto_139686 ) ( ON ?auto_139688 ?auto_139687 ) ( not ( = ?auto_139686 ?auto_139687 ) ) ( not ( = ?auto_139686 ?auto_139688 ) ) ( not ( = ?auto_139686 ?auto_139692 ) ) ( not ( = ?auto_139687 ?auto_139688 ) ) ( not ( = ?auto_139687 ?auto_139692 ) ) ( not ( = ?auto_139688 ?auto_139692 ) ) ( not ( = ?auto_139686 ?auto_139689 ) ) ( not ( = ?auto_139686 ?auto_139693 ) ) ( not ( = ?auto_139687 ?auto_139689 ) ) ( not ( = ?auto_139687 ?auto_139693 ) ) ( not ( = ?auto_139688 ?auto_139689 ) ) ( not ( = ?auto_139688 ?auto_139693 ) ) ( not ( = ?auto_139692 ?auto_139689 ) ) ( not ( = ?auto_139692 ?auto_139693 ) ) ( not ( = ?auto_139689 ?auto_139693 ) ) ( ON ?auto_139689 ?auto_139692 ) ( not ( = ?auto_139690 ?auto_139694 ) ) ( not ( = ?auto_139690 ?auto_139693 ) ) ( not ( = ?auto_139694 ?auto_139693 ) ) ( not ( = ?auto_139686 ?auto_139694 ) ) ( not ( = ?auto_139686 ?auto_139690 ) ) ( not ( = ?auto_139687 ?auto_139694 ) ) ( not ( = ?auto_139687 ?auto_139690 ) ) ( not ( = ?auto_139688 ?auto_139694 ) ) ( not ( = ?auto_139688 ?auto_139690 ) ) ( not ( = ?auto_139692 ?auto_139694 ) ) ( not ( = ?auto_139692 ?auto_139690 ) ) ( not ( = ?auto_139689 ?auto_139694 ) ) ( not ( = ?auto_139689 ?auto_139690 ) ) ( ON ?auto_139693 ?auto_139689 ) ( ON ?auto_139690 ?auto_139691 ) ( CLEAR ?auto_139690 ) ( not ( = ?auto_139686 ?auto_139691 ) ) ( not ( = ?auto_139687 ?auto_139691 ) ) ( not ( = ?auto_139688 ?auto_139691 ) ) ( not ( = ?auto_139692 ?auto_139691 ) ) ( not ( = ?auto_139689 ?auto_139691 ) ) ( not ( = ?auto_139693 ?auto_139691 ) ) ( not ( = ?auto_139690 ?auto_139691 ) ) ( not ( = ?auto_139694 ?auto_139691 ) ) ( HOLDING ?auto_139694 ) ( CLEAR ?auto_139693 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139686 ?auto_139687 ?auto_139688 ?auto_139692 ?auto_139689 ?auto_139693 ?auto_139694 )
      ( MAKE-3PILE ?auto_139686 ?auto_139687 ?auto_139688 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139695 - BLOCK
      ?auto_139696 - BLOCK
      ?auto_139697 - BLOCK
    )
    :vars
    (
      ?auto_139702 - BLOCK
      ?auto_139701 - BLOCK
      ?auto_139699 - BLOCK
      ?auto_139698 - BLOCK
      ?auto_139703 - BLOCK
      ?auto_139700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139702 ?auto_139697 ) ( ON-TABLE ?auto_139695 ) ( ON ?auto_139696 ?auto_139695 ) ( ON ?auto_139697 ?auto_139696 ) ( not ( = ?auto_139695 ?auto_139696 ) ) ( not ( = ?auto_139695 ?auto_139697 ) ) ( not ( = ?auto_139695 ?auto_139702 ) ) ( not ( = ?auto_139696 ?auto_139697 ) ) ( not ( = ?auto_139696 ?auto_139702 ) ) ( not ( = ?auto_139697 ?auto_139702 ) ) ( not ( = ?auto_139695 ?auto_139701 ) ) ( not ( = ?auto_139695 ?auto_139699 ) ) ( not ( = ?auto_139696 ?auto_139701 ) ) ( not ( = ?auto_139696 ?auto_139699 ) ) ( not ( = ?auto_139697 ?auto_139701 ) ) ( not ( = ?auto_139697 ?auto_139699 ) ) ( not ( = ?auto_139702 ?auto_139701 ) ) ( not ( = ?auto_139702 ?auto_139699 ) ) ( not ( = ?auto_139701 ?auto_139699 ) ) ( ON ?auto_139701 ?auto_139702 ) ( not ( = ?auto_139698 ?auto_139703 ) ) ( not ( = ?auto_139698 ?auto_139699 ) ) ( not ( = ?auto_139703 ?auto_139699 ) ) ( not ( = ?auto_139695 ?auto_139703 ) ) ( not ( = ?auto_139695 ?auto_139698 ) ) ( not ( = ?auto_139696 ?auto_139703 ) ) ( not ( = ?auto_139696 ?auto_139698 ) ) ( not ( = ?auto_139697 ?auto_139703 ) ) ( not ( = ?auto_139697 ?auto_139698 ) ) ( not ( = ?auto_139702 ?auto_139703 ) ) ( not ( = ?auto_139702 ?auto_139698 ) ) ( not ( = ?auto_139701 ?auto_139703 ) ) ( not ( = ?auto_139701 ?auto_139698 ) ) ( ON ?auto_139699 ?auto_139701 ) ( ON ?auto_139698 ?auto_139700 ) ( not ( = ?auto_139695 ?auto_139700 ) ) ( not ( = ?auto_139696 ?auto_139700 ) ) ( not ( = ?auto_139697 ?auto_139700 ) ) ( not ( = ?auto_139702 ?auto_139700 ) ) ( not ( = ?auto_139701 ?auto_139700 ) ) ( not ( = ?auto_139699 ?auto_139700 ) ) ( not ( = ?auto_139698 ?auto_139700 ) ) ( not ( = ?auto_139703 ?auto_139700 ) ) ( CLEAR ?auto_139699 ) ( ON ?auto_139703 ?auto_139698 ) ( CLEAR ?auto_139703 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139700 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139700 ?auto_139698 )
      ( MAKE-3PILE ?auto_139695 ?auto_139696 ?auto_139697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139704 - BLOCK
      ?auto_139705 - BLOCK
      ?auto_139706 - BLOCK
    )
    :vars
    (
      ?auto_139709 - BLOCK
      ?auto_139710 - BLOCK
      ?auto_139711 - BLOCK
      ?auto_139707 - BLOCK
      ?auto_139712 - BLOCK
      ?auto_139708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139709 ?auto_139706 ) ( ON-TABLE ?auto_139704 ) ( ON ?auto_139705 ?auto_139704 ) ( ON ?auto_139706 ?auto_139705 ) ( not ( = ?auto_139704 ?auto_139705 ) ) ( not ( = ?auto_139704 ?auto_139706 ) ) ( not ( = ?auto_139704 ?auto_139709 ) ) ( not ( = ?auto_139705 ?auto_139706 ) ) ( not ( = ?auto_139705 ?auto_139709 ) ) ( not ( = ?auto_139706 ?auto_139709 ) ) ( not ( = ?auto_139704 ?auto_139710 ) ) ( not ( = ?auto_139704 ?auto_139711 ) ) ( not ( = ?auto_139705 ?auto_139710 ) ) ( not ( = ?auto_139705 ?auto_139711 ) ) ( not ( = ?auto_139706 ?auto_139710 ) ) ( not ( = ?auto_139706 ?auto_139711 ) ) ( not ( = ?auto_139709 ?auto_139710 ) ) ( not ( = ?auto_139709 ?auto_139711 ) ) ( not ( = ?auto_139710 ?auto_139711 ) ) ( ON ?auto_139710 ?auto_139709 ) ( not ( = ?auto_139707 ?auto_139712 ) ) ( not ( = ?auto_139707 ?auto_139711 ) ) ( not ( = ?auto_139712 ?auto_139711 ) ) ( not ( = ?auto_139704 ?auto_139712 ) ) ( not ( = ?auto_139704 ?auto_139707 ) ) ( not ( = ?auto_139705 ?auto_139712 ) ) ( not ( = ?auto_139705 ?auto_139707 ) ) ( not ( = ?auto_139706 ?auto_139712 ) ) ( not ( = ?auto_139706 ?auto_139707 ) ) ( not ( = ?auto_139709 ?auto_139712 ) ) ( not ( = ?auto_139709 ?auto_139707 ) ) ( not ( = ?auto_139710 ?auto_139712 ) ) ( not ( = ?auto_139710 ?auto_139707 ) ) ( ON ?auto_139707 ?auto_139708 ) ( not ( = ?auto_139704 ?auto_139708 ) ) ( not ( = ?auto_139705 ?auto_139708 ) ) ( not ( = ?auto_139706 ?auto_139708 ) ) ( not ( = ?auto_139709 ?auto_139708 ) ) ( not ( = ?auto_139710 ?auto_139708 ) ) ( not ( = ?auto_139711 ?auto_139708 ) ) ( not ( = ?auto_139707 ?auto_139708 ) ) ( not ( = ?auto_139712 ?auto_139708 ) ) ( ON ?auto_139712 ?auto_139707 ) ( CLEAR ?auto_139712 ) ( ON-TABLE ?auto_139708 ) ( HOLDING ?auto_139711 ) ( CLEAR ?auto_139710 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139704 ?auto_139705 ?auto_139706 ?auto_139709 ?auto_139710 ?auto_139711 )
      ( MAKE-3PILE ?auto_139704 ?auto_139705 ?auto_139706 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139713 - BLOCK
      ?auto_139714 - BLOCK
      ?auto_139715 - BLOCK
    )
    :vars
    (
      ?auto_139716 - BLOCK
      ?auto_139719 - BLOCK
      ?auto_139720 - BLOCK
      ?auto_139718 - BLOCK
      ?auto_139721 - BLOCK
      ?auto_139717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139716 ?auto_139715 ) ( ON-TABLE ?auto_139713 ) ( ON ?auto_139714 ?auto_139713 ) ( ON ?auto_139715 ?auto_139714 ) ( not ( = ?auto_139713 ?auto_139714 ) ) ( not ( = ?auto_139713 ?auto_139715 ) ) ( not ( = ?auto_139713 ?auto_139716 ) ) ( not ( = ?auto_139714 ?auto_139715 ) ) ( not ( = ?auto_139714 ?auto_139716 ) ) ( not ( = ?auto_139715 ?auto_139716 ) ) ( not ( = ?auto_139713 ?auto_139719 ) ) ( not ( = ?auto_139713 ?auto_139720 ) ) ( not ( = ?auto_139714 ?auto_139719 ) ) ( not ( = ?auto_139714 ?auto_139720 ) ) ( not ( = ?auto_139715 ?auto_139719 ) ) ( not ( = ?auto_139715 ?auto_139720 ) ) ( not ( = ?auto_139716 ?auto_139719 ) ) ( not ( = ?auto_139716 ?auto_139720 ) ) ( not ( = ?auto_139719 ?auto_139720 ) ) ( ON ?auto_139719 ?auto_139716 ) ( not ( = ?auto_139718 ?auto_139721 ) ) ( not ( = ?auto_139718 ?auto_139720 ) ) ( not ( = ?auto_139721 ?auto_139720 ) ) ( not ( = ?auto_139713 ?auto_139721 ) ) ( not ( = ?auto_139713 ?auto_139718 ) ) ( not ( = ?auto_139714 ?auto_139721 ) ) ( not ( = ?auto_139714 ?auto_139718 ) ) ( not ( = ?auto_139715 ?auto_139721 ) ) ( not ( = ?auto_139715 ?auto_139718 ) ) ( not ( = ?auto_139716 ?auto_139721 ) ) ( not ( = ?auto_139716 ?auto_139718 ) ) ( not ( = ?auto_139719 ?auto_139721 ) ) ( not ( = ?auto_139719 ?auto_139718 ) ) ( ON ?auto_139718 ?auto_139717 ) ( not ( = ?auto_139713 ?auto_139717 ) ) ( not ( = ?auto_139714 ?auto_139717 ) ) ( not ( = ?auto_139715 ?auto_139717 ) ) ( not ( = ?auto_139716 ?auto_139717 ) ) ( not ( = ?auto_139719 ?auto_139717 ) ) ( not ( = ?auto_139720 ?auto_139717 ) ) ( not ( = ?auto_139718 ?auto_139717 ) ) ( not ( = ?auto_139721 ?auto_139717 ) ) ( ON ?auto_139721 ?auto_139718 ) ( ON-TABLE ?auto_139717 ) ( CLEAR ?auto_139719 ) ( ON ?auto_139720 ?auto_139721 ) ( CLEAR ?auto_139720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139717 ?auto_139718 ?auto_139721 )
      ( MAKE-3PILE ?auto_139713 ?auto_139714 ?auto_139715 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139722 - BLOCK
      ?auto_139723 - BLOCK
      ?auto_139724 - BLOCK
    )
    :vars
    (
      ?auto_139727 - BLOCK
      ?auto_139728 - BLOCK
      ?auto_139725 - BLOCK
      ?auto_139729 - BLOCK
      ?auto_139726 - BLOCK
      ?auto_139730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139727 ?auto_139724 ) ( ON-TABLE ?auto_139722 ) ( ON ?auto_139723 ?auto_139722 ) ( ON ?auto_139724 ?auto_139723 ) ( not ( = ?auto_139722 ?auto_139723 ) ) ( not ( = ?auto_139722 ?auto_139724 ) ) ( not ( = ?auto_139722 ?auto_139727 ) ) ( not ( = ?auto_139723 ?auto_139724 ) ) ( not ( = ?auto_139723 ?auto_139727 ) ) ( not ( = ?auto_139724 ?auto_139727 ) ) ( not ( = ?auto_139722 ?auto_139728 ) ) ( not ( = ?auto_139722 ?auto_139725 ) ) ( not ( = ?auto_139723 ?auto_139728 ) ) ( not ( = ?auto_139723 ?auto_139725 ) ) ( not ( = ?auto_139724 ?auto_139728 ) ) ( not ( = ?auto_139724 ?auto_139725 ) ) ( not ( = ?auto_139727 ?auto_139728 ) ) ( not ( = ?auto_139727 ?auto_139725 ) ) ( not ( = ?auto_139728 ?auto_139725 ) ) ( not ( = ?auto_139729 ?auto_139726 ) ) ( not ( = ?auto_139729 ?auto_139725 ) ) ( not ( = ?auto_139726 ?auto_139725 ) ) ( not ( = ?auto_139722 ?auto_139726 ) ) ( not ( = ?auto_139722 ?auto_139729 ) ) ( not ( = ?auto_139723 ?auto_139726 ) ) ( not ( = ?auto_139723 ?auto_139729 ) ) ( not ( = ?auto_139724 ?auto_139726 ) ) ( not ( = ?auto_139724 ?auto_139729 ) ) ( not ( = ?auto_139727 ?auto_139726 ) ) ( not ( = ?auto_139727 ?auto_139729 ) ) ( not ( = ?auto_139728 ?auto_139726 ) ) ( not ( = ?auto_139728 ?auto_139729 ) ) ( ON ?auto_139729 ?auto_139730 ) ( not ( = ?auto_139722 ?auto_139730 ) ) ( not ( = ?auto_139723 ?auto_139730 ) ) ( not ( = ?auto_139724 ?auto_139730 ) ) ( not ( = ?auto_139727 ?auto_139730 ) ) ( not ( = ?auto_139728 ?auto_139730 ) ) ( not ( = ?auto_139725 ?auto_139730 ) ) ( not ( = ?auto_139729 ?auto_139730 ) ) ( not ( = ?auto_139726 ?auto_139730 ) ) ( ON ?auto_139726 ?auto_139729 ) ( ON-TABLE ?auto_139730 ) ( ON ?auto_139725 ?auto_139726 ) ( CLEAR ?auto_139725 ) ( HOLDING ?auto_139728 ) ( CLEAR ?auto_139727 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139722 ?auto_139723 ?auto_139724 ?auto_139727 ?auto_139728 )
      ( MAKE-3PILE ?auto_139722 ?auto_139723 ?auto_139724 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139731 - BLOCK
      ?auto_139732 - BLOCK
      ?auto_139733 - BLOCK
    )
    :vars
    (
      ?auto_139736 - BLOCK
      ?auto_139739 - BLOCK
      ?auto_139737 - BLOCK
      ?auto_139738 - BLOCK
      ?auto_139734 - BLOCK
      ?auto_139735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_139736 ?auto_139733 ) ( ON-TABLE ?auto_139731 ) ( ON ?auto_139732 ?auto_139731 ) ( ON ?auto_139733 ?auto_139732 ) ( not ( = ?auto_139731 ?auto_139732 ) ) ( not ( = ?auto_139731 ?auto_139733 ) ) ( not ( = ?auto_139731 ?auto_139736 ) ) ( not ( = ?auto_139732 ?auto_139733 ) ) ( not ( = ?auto_139732 ?auto_139736 ) ) ( not ( = ?auto_139733 ?auto_139736 ) ) ( not ( = ?auto_139731 ?auto_139739 ) ) ( not ( = ?auto_139731 ?auto_139737 ) ) ( not ( = ?auto_139732 ?auto_139739 ) ) ( not ( = ?auto_139732 ?auto_139737 ) ) ( not ( = ?auto_139733 ?auto_139739 ) ) ( not ( = ?auto_139733 ?auto_139737 ) ) ( not ( = ?auto_139736 ?auto_139739 ) ) ( not ( = ?auto_139736 ?auto_139737 ) ) ( not ( = ?auto_139739 ?auto_139737 ) ) ( not ( = ?auto_139738 ?auto_139734 ) ) ( not ( = ?auto_139738 ?auto_139737 ) ) ( not ( = ?auto_139734 ?auto_139737 ) ) ( not ( = ?auto_139731 ?auto_139734 ) ) ( not ( = ?auto_139731 ?auto_139738 ) ) ( not ( = ?auto_139732 ?auto_139734 ) ) ( not ( = ?auto_139732 ?auto_139738 ) ) ( not ( = ?auto_139733 ?auto_139734 ) ) ( not ( = ?auto_139733 ?auto_139738 ) ) ( not ( = ?auto_139736 ?auto_139734 ) ) ( not ( = ?auto_139736 ?auto_139738 ) ) ( not ( = ?auto_139739 ?auto_139734 ) ) ( not ( = ?auto_139739 ?auto_139738 ) ) ( ON ?auto_139738 ?auto_139735 ) ( not ( = ?auto_139731 ?auto_139735 ) ) ( not ( = ?auto_139732 ?auto_139735 ) ) ( not ( = ?auto_139733 ?auto_139735 ) ) ( not ( = ?auto_139736 ?auto_139735 ) ) ( not ( = ?auto_139739 ?auto_139735 ) ) ( not ( = ?auto_139737 ?auto_139735 ) ) ( not ( = ?auto_139738 ?auto_139735 ) ) ( not ( = ?auto_139734 ?auto_139735 ) ) ( ON ?auto_139734 ?auto_139738 ) ( ON-TABLE ?auto_139735 ) ( ON ?auto_139737 ?auto_139734 ) ( CLEAR ?auto_139736 ) ( ON ?auto_139739 ?auto_139737 ) ( CLEAR ?auto_139739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139735 ?auto_139738 ?auto_139734 ?auto_139737 )
      ( MAKE-3PILE ?auto_139731 ?auto_139732 ?auto_139733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139758 - BLOCK
      ?auto_139759 - BLOCK
      ?auto_139760 - BLOCK
    )
    :vars
    (
      ?auto_139765 - BLOCK
      ?auto_139763 - BLOCK
      ?auto_139762 - BLOCK
      ?auto_139764 - BLOCK
      ?auto_139766 - BLOCK
      ?auto_139761 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139758 ) ( ON ?auto_139759 ?auto_139758 ) ( not ( = ?auto_139758 ?auto_139759 ) ) ( not ( = ?auto_139758 ?auto_139760 ) ) ( not ( = ?auto_139758 ?auto_139765 ) ) ( not ( = ?auto_139759 ?auto_139760 ) ) ( not ( = ?auto_139759 ?auto_139765 ) ) ( not ( = ?auto_139760 ?auto_139765 ) ) ( not ( = ?auto_139758 ?auto_139763 ) ) ( not ( = ?auto_139758 ?auto_139762 ) ) ( not ( = ?auto_139759 ?auto_139763 ) ) ( not ( = ?auto_139759 ?auto_139762 ) ) ( not ( = ?auto_139760 ?auto_139763 ) ) ( not ( = ?auto_139760 ?auto_139762 ) ) ( not ( = ?auto_139765 ?auto_139763 ) ) ( not ( = ?auto_139765 ?auto_139762 ) ) ( not ( = ?auto_139763 ?auto_139762 ) ) ( not ( = ?auto_139764 ?auto_139766 ) ) ( not ( = ?auto_139764 ?auto_139762 ) ) ( not ( = ?auto_139766 ?auto_139762 ) ) ( not ( = ?auto_139758 ?auto_139766 ) ) ( not ( = ?auto_139758 ?auto_139764 ) ) ( not ( = ?auto_139759 ?auto_139766 ) ) ( not ( = ?auto_139759 ?auto_139764 ) ) ( not ( = ?auto_139760 ?auto_139766 ) ) ( not ( = ?auto_139760 ?auto_139764 ) ) ( not ( = ?auto_139765 ?auto_139766 ) ) ( not ( = ?auto_139765 ?auto_139764 ) ) ( not ( = ?auto_139763 ?auto_139766 ) ) ( not ( = ?auto_139763 ?auto_139764 ) ) ( ON ?auto_139764 ?auto_139761 ) ( not ( = ?auto_139758 ?auto_139761 ) ) ( not ( = ?auto_139759 ?auto_139761 ) ) ( not ( = ?auto_139760 ?auto_139761 ) ) ( not ( = ?auto_139765 ?auto_139761 ) ) ( not ( = ?auto_139763 ?auto_139761 ) ) ( not ( = ?auto_139762 ?auto_139761 ) ) ( not ( = ?auto_139764 ?auto_139761 ) ) ( not ( = ?auto_139766 ?auto_139761 ) ) ( ON ?auto_139766 ?auto_139764 ) ( ON-TABLE ?auto_139761 ) ( ON ?auto_139762 ?auto_139766 ) ( ON ?auto_139763 ?auto_139762 ) ( ON ?auto_139765 ?auto_139763 ) ( CLEAR ?auto_139765 ) ( HOLDING ?auto_139760 ) ( CLEAR ?auto_139759 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139758 ?auto_139759 ?auto_139760 ?auto_139765 )
      ( MAKE-3PILE ?auto_139758 ?auto_139759 ?auto_139760 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139767 - BLOCK
      ?auto_139768 - BLOCK
      ?auto_139769 - BLOCK
    )
    :vars
    (
      ?auto_139771 - BLOCK
      ?auto_139772 - BLOCK
      ?auto_139770 - BLOCK
      ?auto_139775 - BLOCK
      ?auto_139773 - BLOCK
      ?auto_139774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139767 ) ( ON ?auto_139768 ?auto_139767 ) ( not ( = ?auto_139767 ?auto_139768 ) ) ( not ( = ?auto_139767 ?auto_139769 ) ) ( not ( = ?auto_139767 ?auto_139771 ) ) ( not ( = ?auto_139768 ?auto_139769 ) ) ( not ( = ?auto_139768 ?auto_139771 ) ) ( not ( = ?auto_139769 ?auto_139771 ) ) ( not ( = ?auto_139767 ?auto_139772 ) ) ( not ( = ?auto_139767 ?auto_139770 ) ) ( not ( = ?auto_139768 ?auto_139772 ) ) ( not ( = ?auto_139768 ?auto_139770 ) ) ( not ( = ?auto_139769 ?auto_139772 ) ) ( not ( = ?auto_139769 ?auto_139770 ) ) ( not ( = ?auto_139771 ?auto_139772 ) ) ( not ( = ?auto_139771 ?auto_139770 ) ) ( not ( = ?auto_139772 ?auto_139770 ) ) ( not ( = ?auto_139775 ?auto_139773 ) ) ( not ( = ?auto_139775 ?auto_139770 ) ) ( not ( = ?auto_139773 ?auto_139770 ) ) ( not ( = ?auto_139767 ?auto_139773 ) ) ( not ( = ?auto_139767 ?auto_139775 ) ) ( not ( = ?auto_139768 ?auto_139773 ) ) ( not ( = ?auto_139768 ?auto_139775 ) ) ( not ( = ?auto_139769 ?auto_139773 ) ) ( not ( = ?auto_139769 ?auto_139775 ) ) ( not ( = ?auto_139771 ?auto_139773 ) ) ( not ( = ?auto_139771 ?auto_139775 ) ) ( not ( = ?auto_139772 ?auto_139773 ) ) ( not ( = ?auto_139772 ?auto_139775 ) ) ( ON ?auto_139775 ?auto_139774 ) ( not ( = ?auto_139767 ?auto_139774 ) ) ( not ( = ?auto_139768 ?auto_139774 ) ) ( not ( = ?auto_139769 ?auto_139774 ) ) ( not ( = ?auto_139771 ?auto_139774 ) ) ( not ( = ?auto_139772 ?auto_139774 ) ) ( not ( = ?auto_139770 ?auto_139774 ) ) ( not ( = ?auto_139775 ?auto_139774 ) ) ( not ( = ?auto_139773 ?auto_139774 ) ) ( ON ?auto_139773 ?auto_139775 ) ( ON-TABLE ?auto_139774 ) ( ON ?auto_139770 ?auto_139773 ) ( ON ?auto_139772 ?auto_139770 ) ( ON ?auto_139771 ?auto_139772 ) ( CLEAR ?auto_139768 ) ( ON ?auto_139769 ?auto_139771 ) ( CLEAR ?auto_139769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139774 ?auto_139775 ?auto_139773 ?auto_139770 ?auto_139772 ?auto_139771 )
      ( MAKE-3PILE ?auto_139767 ?auto_139768 ?auto_139769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139776 - BLOCK
      ?auto_139777 - BLOCK
      ?auto_139778 - BLOCK
    )
    :vars
    (
      ?auto_139779 - BLOCK
      ?auto_139781 - BLOCK
      ?auto_139782 - BLOCK
      ?auto_139780 - BLOCK
      ?auto_139783 - BLOCK
      ?auto_139784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139776 ) ( not ( = ?auto_139776 ?auto_139777 ) ) ( not ( = ?auto_139776 ?auto_139778 ) ) ( not ( = ?auto_139776 ?auto_139779 ) ) ( not ( = ?auto_139777 ?auto_139778 ) ) ( not ( = ?auto_139777 ?auto_139779 ) ) ( not ( = ?auto_139778 ?auto_139779 ) ) ( not ( = ?auto_139776 ?auto_139781 ) ) ( not ( = ?auto_139776 ?auto_139782 ) ) ( not ( = ?auto_139777 ?auto_139781 ) ) ( not ( = ?auto_139777 ?auto_139782 ) ) ( not ( = ?auto_139778 ?auto_139781 ) ) ( not ( = ?auto_139778 ?auto_139782 ) ) ( not ( = ?auto_139779 ?auto_139781 ) ) ( not ( = ?auto_139779 ?auto_139782 ) ) ( not ( = ?auto_139781 ?auto_139782 ) ) ( not ( = ?auto_139780 ?auto_139783 ) ) ( not ( = ?auto_139780 ?auto_139782 ) ) ( not ( = ?auto_139783 ?auto_139782 ) ) ( not ( = ?auto_139776 ?auto_139783 ) ) ( not ( = ?auto_139776 ?auto_139780 ) ) ( not ( = ?auto_139777 ?auto_139783 ) ) ( not ( = ?auto_139777 ?auto_139780 ) ) ( not ( = ?auto_139778 ?auto_139783 ) ) ( not ( = ?auto_139778 ?auto_139780 ) ) ( not ( = ?auto_139779 ?auto_139783 ) ) ( not ( = ?auto_139779 ?auto_139780 ) ) ( not ( = ?auto_139781 ?auto_139783 ) ) ( not ( = ?auto_139781 ?auto_139780 ) ) ( ON ?auto_139780 ?auto_139784 ) ( not ( = ?auto_139776 ?auto_139784 ) ) ( not ( = ?auto_139777 ?auto_139784 ) ) ( not ( = ?auto_139778 ?auto_139784 ) ) ( not ( = ?auto_139779 ?auto_139784 ) ) ( not ( = ?auto_139781 ?auto_139784 ) ) ( not ( = ?auto_139782 ?auto_139784 ) ) ( not ( = ?auto_139780 ?auto_139784 ) ) ( not ( = ?auto_139783 ?auto_139784 ) ) ( ON ?auto_139783 ?auto_139780 ) ( ON-TABLE ?auto_139784 ) ( ON ?auto_139782 ?auto_139783 ) ( ON ?auto_139781 ?auto_139782 ) ( ON ?auto_139779 ?auto_139781 ) ( ON ?auto_139778 ?auto_139779 ) ( CLEAR ?auto_139778 ) ( HOLDING ?auto_139777 ) ( CLEAR ?auto_139776 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139776 ?auto_139777 )
      ( MAKE-3PILE ?auto_139776 ?auto_139777 ?auto_139778 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139785 - BLOCK
      ?auto_139786 - BLOCK
      ?auto_139787 - BLOCK
    )
    :vars
    (
      ?auto_139792 - BLOCK
      ?auto_139789 - BLOCK
      ?auto_139790 - BLOCK
      ?auto_139791 - BLOCK
      ?auto_139793 - BLOCK
      ?auto_139788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139785 ) ( not ( = ?auto_139785 ?auto_139786 ) ) ( not ( = ?auto_139785 ?auto_139787 ) ) ( not ( = ?auto_139785 ?auto_139792 ) ) ( not ( = ?auto_139786 ?auto_139787 ) ) ( not ( = ?auto_139786 ?auto_139792 ) ) ( not ( = ?auto_139787 ?auto_139792 ) ) ( not ( = ?auto_139785 ?auto_139789 ) ) ( not ( = ?auto_139785 ?auto_139790 ) ) ( not ( = ?auto_139786 ?auto_139789 ) ) ( not ( = ?auto_139786 ?auto_139790 ) ) ( not ( = ?auto_139787 ?auto_139789 ) ) ( not ( = ?auto_139787 ?auto_139790 ) ) ( not ( = ?auto_139792 ?auto_139789 ) ) ( not ( = ?auto_139792 ?auto_139790 ) ) ( not ( = ?auto_139789 ?auto_139790 ) ) ( not ( = ?auto_139791 ?auto_139793 ) ) ( not ( = ?auto_139791 ?auto_139790 ) ) ( not ( = ?auto_139793 ?auto_139790 ) ) ( not ( = ?auto_139785 ?auto_139793 ) ) ( not ( = ?auto_139785 ?auto_139791 ) ) ( not ( = ?auto_139786 ?auto_139793 ) ) ( not ( = ?auto_139786 ?auto_139791 ) ) ( not ( = ?auto_139787 ?auto_139793 ) ) ( not ( = ?auto_139787 ?auto_139791 ) ) ( not ( = ?auto_139792 ?auto_139793 ) ) ( not ( = ?auto_139792 ?auto_139791 ) ) ( not ( = ?auto_139789 ?auto_139793 ) ) ( not ( = ?auto_139789 ?auto_139791 ) ) ( ON ?auto_139791 ?auto_139788 ) ( not ( = ?auto_139785 ?auto_139788 ) ) ( not ( = ?auto_139786 ?auto_139788 ) ) ( not ( = ?auto_139787 ?auto_139788 ) ) ( not ( = ?auto_139792 ?auto_139788 ) ) ( not ( = ?auto_139789 ?auto_139788 ) ) ( not ( = ?auto_139790 ?auto_139788 ) ) ( not ( = ?auto_139791 ?auto_139788 ) ) ( not ( = ?auto_139793 ?auto_139788 ) ) ( ON ?auto_139793 ?auto_139791 ) ( ON-TABLE ?auto_139788 ) ( ON ?auto_139790 ?auto_139793 ) ( ON ?auto_139789 ?auto_139790 ) ( ON ?auto_139792 ?auto_139789 ) ( ON ?auto_139787 ?auto_139792 ) ( CLEAR ?auto_139785 ) ( ON ?auto_139786 ?auto_139787 ) ( CLEAR ?auto_139786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139788 ?auto_139791 ?auto_139793 ?auto_139790 ?auto_139789 ?auto_139792 ?auto_139787 )
      ( MAKE-3PILE ?auto_139785 ?auto_139786 ?auto_139787 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139794 - BLOCK
      ?auto_139795 - BLOCK
      ?auto_139796 - BLOCK
    )
    :vars
    (
      ?auto_139801 - BLOCK
      ?auto_139800 - BLOCK
      ?auto_139802 - BLOCK
      ?auto_139799 - BLOCK
      ?auto_139797 - BLOCK
      ?auto_139798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139794 ?auto_139795 ) ) ( not ( = ?auto_139794 ?auto_139796 ) ) ( not ( = ?auto_139794 ?auto_139801 ) ) ( not ( = ?auto_139795 ?auto_139796 ) ) ( not ( = ?auto_139795 ?auto_139801 ) ) ( not ( = ?auto_139796 ?auto_139801 ) ) ( not ( = ?auto_139794 ?auto_139800 ) ) ( not ( = ?auto_139794 ?auto_139802 ) ) ( not ( = ?auto_139795 ?auto_139800 ) ) ( not ( = ?auto_139795 ?auto_139802 ) ) ( not ( = ?auto_139796 ?auto_139800 ) ) ( not ( = ?auto_139796 ?auto_139802 ) ) ( not ( = ?auto_139801 ?auto_139800 ) ) ( not ( = ?auto_139801 ?auto_139802 ) ) ( not ( = ?auto_139800 ?auto_139802 ) ) ( not ( = ?auto_139799 ?auto_139797 ) ) ( not ( = ?auto_139799 ?auto_139802 ) ) ( not ( = ?auto_139797 ?auto_139802 ) ) ( not ( = ?auto_139794 ?auto_139797 ) ) ( not ( = ?auto_139794 ?auto_139799 ) ) ( not ( = ?auto_139795 ?auto_139797 ) ) ( not ( = ?auto_139795 ?auto_139799 ) ) ( not ( = ?auto_139796 ?auto_139797 ) ) ( not ( = ?auto_139796 ?auto_139799 ) ) ( not ( = ?auto_139801 ?auto_139797 ) ) ( not ( = ?auto_139801 ?auto_139799 ) ) ( not ( = ?auto_139800 ?auto_139797 ) ) ( not ( = ?auto_139800 ?auto_139799 ) ) ( ON ?auto_139799 ?auto_139798 ) ( not ( = ?auto_139794 ?auto_139798 ) ) ( not ( = ?auto_139795 ?auto_139798 ) ) ( not ( = ?auto_139796 ?auto_139798 ) ) ( not ( = ?auto_139801 ?auto_139798 ) ) ( not ( = ?auto_139800 ?auto_139798 ) ) ( not ( = ?auto_139802 ?auto_139798 ) ) ( not ( = ?auto_139799 ?auto_139798 ) ) ( not ( = ?auto_139797 ?auto_139798 ) ) ( ON ?auto_139797 ?auto_139799 ) ( ON-TABLE ?auto_139798 ) ( ON ?auto_139802 ?auto_139797 ) ( ON ?auto_139800 ?auto_139802 ) ( ON ?auto_139801 ?auto_139800 ) ( ON ?auto_139796 ?auto_139801 ) ( ON ?auto_139795 ?auto_139796 ) ( CLEAR ?auto_139795 ) ( HOLDING ?auto_139794 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139794 )
      ( MAKE-3PILE ?auto_139794 ?auto_139795 ?auto_139796 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_139803 - BLOCK
      ?auto_139804 - BLOCK
      ?auto_139805 - BLOCK
    )
    :vars
    (
      ?auto_139808 - BLOCK
      ?auto_139810 - BLOCK
      ?auto_139811 - BLOCK
      ?auto_139806 - BLOCK
      ?auto_139809 - BLOCK
      ?auto_139807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139803 ?auto_139804 ) ) ( not ( = ?auto_139803 ?auto_139805 ) ) ( not ( = ?auto_139803 ?auto_139808 ) ) ( not ( = ?auto_139804 ?auto_139805 ) ) ( not ( = ?auto_139804 ?auto_139808 ) ) ( not ( = ?auto_139805 ?auto_139808 ) ) ( not ( = ?auto_139803 ?auto_139810 ) ) ( not ( = ?auto_139803 ?auto_139811 ) ) ( not ( = ?auto_139804 ?auto_139810 ) ) ( not ( = ?auto_139804 ?auto_139811 ) ) ( not ( = ?auto_139805 ?auto_139810 ) ) ( not ( = ?auto_139805 ?auto_139811 ) ) ( not ( = ?auto_139808 ?auto_139810 ) ) ( not ( = ?auto_139808 ?auto_139811 ) ) ( not ( = ?auto_139810 ?auto_139811 ) ) ( not ( = ?auto_139806 ?auto_139809 ) ) ( not ( = ?auto_139806 ?auto_139811 ) ) ( not ( = ?auto_139809 ?auto_139811 ) ) ( not ( = ?auto_139803 ?auto_139809 ) ) ( not ( = ?auto_139803 ?auto_139806 ) ) ( not ( = ?auto_139804 ?auto_139809 ) ) ( not ( = ?auto_139804 ?auto_139806 ) ) ( not ( = ?auto_139805 ?auto_139809 ) ) ( not ( = ?auto_139805 ?auto_139806 ) ) ( not ( = ?auto_139808 ?auto_139809 ) ) ( not ( = ?auto_139808 ?auto_139806 ) ) ( not ( = ?auto_139810 ?auto_139809 ) ) ( not ( = ?auto_139810 ?auto_139806 ) ) ( ON ?auto_139806 ?auto_139807 ) ( not ( = ?auto_139803 ?auto_139807 ) ) ( not ( = ?auto_139804 ?auto_139807 ) ) ( not ( = ?auto_139805 ?auto_139807 ) ) ( not ( = ?auto_139808 ?auto_139807 ) ) ( not ( = ?auto_139810 ?auto_139807 ) ) ( not ( = ?auto_139811 ?auto_139807 ) ) ( not ( = ?auto_139806 ?auto_139807 ) ) ( not ( = ?auto_139809 ?auto_139807 ) ) ( ON ?auto_139809 ?auto_139806 ) ( ON-TABLE ?auto_139807 ) ( ON ?auto_139811 ?auto_139809 ) ( ON ?auto_139810 ?auto_139811 ) ( ON ?auto_139808 ?auto_139810 ) ( ON ?auto_139805 ?auto_139808 ) ( ON ?auto_139804 ?auto_139805 ) ( ON ?auto_139803 ?auto_139804 ) ( CLEAR ?auto_139803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139807 ?auto_139806 ?auto_139809 ?auto_139811 ?auto_139810 ?auto_139808 ?auto_139805 ?auto_139804 )
      ( MAKE-3PILE ?auto_139803 ?auto_139804 ?auto_139805 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139817 - BLOCK
      ?auto_139818 - BLOCK
      ?auto_139819 - BLOCK
      ?auto_139820 - BLOCK
      ?auto_139821 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_139821 ) ( CLEAR ?auto_139820 ) ( ON-TABLE ?auto_139817 ) ( ON ?auto_139818 ?auto_139817 ) ( ON ?auto_139819 ?auto_139818 ) ( ON ?auto_139820 ?auto_139819 ) ( not ( = ?auto_139817 ?auto_139818 ) ) ( not ( = ?auto_139817 ?auto_139819 ) ) ( not ( = ?auto_139817 ?auto_139820 ) ) ( not ( = ?auto_139817 ?auto_139821 ) ) ( not ( = ?auto_139818 ?auto_139819 ) ) ( not ( = ?auto_139818 ?auto_139820 ) ) ( not ( = ?auto_139818 ?auto_139821 ) ) ( not ( = ?auto_139819 ?auto_139820 ) ) ( not ( = ?auto_139819 ?auto_139821 ) ) ( not ( = ?auto_139820 ?auto_139821 ) ) )
    :subtasks
    ( ( !STACK ?auto_139821 ?auto_139820 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139822 - BLOCK
      ?auto_139823 - BLOCK
      ?auto_139824 - BLOCK
      ?auto_139825 - BLOCK
      ?auto_139826 - BLOCK
    )
    :vars
    (
      ?auto_139827 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_139825 ) ( ON-TABLE ?auto_139822 ) ( ON ?auto_139823 ?auto_139822 ) ( ON ?auto_139824 ?auto_139823 ) ( ON ?auto_139825 ?auto_139824 ) ( not ( = ?auto_139822 ?auto_139823 ) ) ( not ( = ?auto_139822 ?auto_139824 ) ) ( not ( = ?auto_139822 ?auto_139825 ) ) ( not ( = ?auto_139822 ?auto_139826 ) ) ( not ( = ?auto_139823 ?auto_139824 ) ) ( not ( = ?auto_139823 ?auto_139825 ) ) ( not ( = ?auto_139823 ?auto_139826 ) ) ( not ( = ?auto_139824 ?auto_139825 ) ) ( not ( = ?auto_139824 ?auto_139826 ) ) ( not ( = ?auto_139825 ?auto_139826 ) ) ( ON ?auto_139826 ?auto_139827 ) ( CLEAR ?auto_139826 ) ( HAND-EMPTY ) ( not ( = ?auto_139822 ?auto_139827 ) ) ( not ( = ?auto_139823 ?auto_139827 ) ) ( not ( = ?auto_139824 ?auto_139827 ) ) ( not ( = ?auto_139825 ?auto_139827 ) ) ( not ( = ?auto_139826 ?auto_139827 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139826 ?auto_139827 )
      ( MAKE-5PILE ?auto_139822 ?auto_139823 ?auto_139824 ?auto_139825 ?auto_139826 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139828 - BLOCK
      ?auto_139829 - BLOCK
      ?auto_139830 - BLOCK
      ?auto_139831 - BLOCK
      ?auto_139832 - BLOCK
    )
    :vars
    (
      ?auto_139833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139828 ) ( ON ?auto_139829 ?auto_139828 ) ( ON ?auto_139830 ?auto_139829 ) ( not ( = ?auto_139828 ?auto_139829 ) ) ( not ( = ?auto_139828 ?auto_139830 ) ) ( not ( = ?auto_139828 ?auto_139831 ) ) ( not ( = ?auto_139828 ?auto_139832 ) ) ( not ( = ?auto_139829 ?auto_139830 ) ) ( not ( = ?auto_139829 ?auto_139831 ) ) ( not ( = ?auto_139829 ?auto_139832 ) ) ( not ( = ?auto_139830 ?auto_139831 ) ) ( not ( = ?auto_139830 ?auto_139832 ) ) ( not ( = ?auto_139831 ?auto_139832 ) ) ( ON ?auto_139832 ?auto_139833 ) ( CLEAR ?auto_139832 ) ( not ( = ?auto_139828 ?auto_139833 ) ) ( not ( = ?auto_139829 ?auto_139833 ) ) ( not ( = ?auto_139830 ?auto_139833 ) ) ( not ( = ?auto_139831 ?auto_139833 ) ) ( not ( = ?auto_139832 ?auto_139833 ) ) ( HOLDING ?auto_139831 ) ( CLEAR ?auto_139830 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139828 ?auto_139829 ?auto_139830 ?auto_139831 )
      ( MAKE-5PILE ?auto_139828 ?auto_139829 ?auto_139830 ?auto_139831 ?auto_139832 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139834 - BLOCK
      ?auto_139835 - BLOCK
      ?auto_139836 - BLOCK
      ?auto_139837 - BLOCK
      ?auto_139838 - BLOCK
    )
    :vars
    (
      ?auto_139839 - BLOCK
      ?auto_139841 - BLOCK
      ?auto_139840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139834 ) ( ON ?auto_139835 ?auto_139834 ) ( ON ?auto_139836 ?auto_139835 ) ( not ( = ?auto_139834 ?auto_139835 ) ) ( not ( = ?auto_139834 ?auto_139836 ) ) ( not ( = ?auto_139834 ?auto_139837 ) ) ( not ( = ?auto_139834 ?auto_139838 ) ) ( not ( = ?auto_139835 ?auto_139836 ) ) ( not ( = ?auto_139835 ?auto_139837 ) ) ( not ( = ?auto_139835 ?auto_139838 ) ) ( not ( = ?auto_139836 ?auto_139837 ) ) ( not ( = ?auto_139836 ?auto_139838 ) ) ( not ( = ?auto_139837 ?auto_139838 ) ) ( ON ?auto_139838 ?auto_139839 ) ( not ( = ?auto_139834 ?auto_139839 ) ) ( not ( = ?auto_139835 ?auto_139839 ) ) ( not ( = ?auto_139836 ?auto_139839 ) ) ( not ( = ?auto_139837 ?auto_139839 ) ) ( not ( = ?auto_139838 ?auto_139839 ) ) ( CLEAR ?auto_139836 ) ( ON ?auto_139837 ?auto_139838 ) ( CLEAR ?auto_139837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139841 ) ( ON ?auto_139840 ?auto_139841 ) ( ON ?auto_139839 ?auto_139840 ) ( not ( = ?auto_139841 ?auto_139840 ) ) ( not ( = ?auto_139841 ?auto_139839 ) ) ( not ( = ?auto_139841 ?auto_139838 ) ) ( not ( = ?auto_139841 ?auto_139837 ) ) ( not ( = ?auto_139840 ?auto_139839 ) ) ( not ( = ?auto_139840 ?auto_139838 ) ) ( not ( = ?auto_139840 ?auto_139837 ) ) ( not ( = ?auto_139834 ?auto_139841 ) ) ( not ( = ?auto_139834 ?auto_139840 ) ) ( not ( = ?auto_139835 ?auto_139841 ) ) ( not ( = ?auto_139835 ?auto_139840 ) ) ( not ( = ?auto_139836 ?auto_139841 ) ) ( not ( = ?auto_139836 ?auto_139840 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139841 ?auto_139840 ?auto_139839 ?auto_139838 )
      ( MAKE-5PILE ?auto_139834 ?auto_139835 ?auto_139836 ?auto_139837 ?auto_139838 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139842 - BLOCK
      ?auto_139843 - BLOCK
      ?auto_139844 - BLOCK
      ?auto_139845 - BLOCK
      ?auto_139846 - BLOCK
    )
    :vars
    (
      ?auto_139849 - BLOCK
      ?auto_139847 - BLOCK
      ?auto_139848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139842 ) ( ON ?auto_139843 ?auto_139842 ) ( not ( = ?auto_139842 ?auto_139843 ) ) ( not ( = ?auto_139842 ?auto_139844 ) ) ( not ( = ?auto_139842 ?auto_139845 ) ) ( not ( = ?auto_139842 ?auto_139846 ) ) ( not ( = ?auto_139843 ?auto_139844 ) ) ( not ( = ?auto_139843 ?auto_139845 ) ) ( not ( = ?auto_139843 ?auto_139846 ) ) ( not ( = ?auto_139844 ?auto_139845 ) ) ( not ( = ?auto_139844 ?auto_139846 ) ) ( not ( = ?auto_139845 ?auto_139846 ) ) ( ON ?auto_139846 ?auto_139849 ) ( not ( = ?auto_139842 ?auto_139849 ) ) ( not ( = ?auto_139843 ?auto_139849 ) ) ( not ( = ?auto_139844 ?auto_139849 ) ) ( not ( = ?auto_139845 ?auto_139849 ) ) ( not ( = ?auto_139846 ?auto_139849 ) ) ( ON ?auto_139845 ?auto_139846 ) ( CLEAR ?auto_139845 ) ( ON-TABLE ?auto_139847 ) ( ON ?auto_139848 ?auto_139847 ) ( ON ?auto_139849 ?auto_139848 ) ( not ( = ?auto_139847 ?auto_139848 ) ) ( not ( = ?auto_139847 ?auto_139849 ) ) ( not ( = ?auto_139847 ?auto_139846 ) ) ( not ( = ?auto_139847 ?auto_139845 ) ) ( not ( = ?auto_139848 ?auto_139849 ) ) ( not ( = ?auto_139848 ?auto_139846 ) ) ( not ( = ?auto_139848 ?auto_139845 ) ) ( not ( = ?auto_139842 ?auto_139847 ) ) ( not ( = ?auto_139842 ?auto_139848 ) ) ( not ( = ?auto_139843 ?auto_139847 ) ) ( not ( = ?auto_139843 ?auto_139848 ) ) ( not ( = ?auto_139844 ?auto_139847 ) ) ( not ( = ?auto_139844 ?auto_139848 ) ) ( HOLDING ?auto_139844 ) ( CLEAR ?auto_139843 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139842 ?auto_139843 ?auto_139844 )
      ( MAKE-5PILE ?auto_139842 ?auto_139843 ?auto_139844 ?auto_139845 ?auto_139846 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139850 - BLOCK
      ?auto_139851 - BLOCK
      ?auto_139852 - BLOCK
      ?auto_139853 - BLOCK
      ?auto_139854 - BLOCK
    )
    :vars
    (
      ?auto_139856 - BLOCK
      ?auto_139855 - BLOCK
      ?auto_139857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139850 ) ( ON ?auto_139851 ?auto_139850 ) ( not ( = ?auto_139850 ?auto_139851 ) ) ( not ( = ?auto_139850 ?auto_139852 ) ) ( not ( = ?auto_139850 ?auto_139853 ) ) ( not ( = ?auto_139850 ?auto_139854 ) ) ( not ( = ?auto_139851 ?auto_139852 ) ) ( not ( = ?auto_139851 ?auto_139853 ) ) ( not ( = ?auto_139851 ?auto_139854 ) ) ( not ( = ?auto_139852 ?auto_139853 ) ) ( not ( = ?auto_139852 ?auto_139854 ) ) ( not ( = ?auto_139853 ?auto_139854 ) ) ( ON ?auto_139854 ?auto_139856 ) ( not ( = ?auto_139850 ?auto_139856 ) ) ( not ( = ?auto_139851 ?auto_139856 ) ) ( not ( = ?auto_139852 ?auto_139856 ) ) ( not ( = ?auto_139853 ?auto_139856 ) ) ( not ( = ?auto_139854 ?auto_139856 ) ) ( ON ?auto_139853 ?auto_139854 ) ( ON-TABLE ?auto_139855 ) ( ON ?auto_139857 ?auto_139855 ) ( ON ?auto_139856 ?auto_139857 ) ( not ( = ?auto_139855 ?auto_139857 ) ) ( not ( = ?auto_139855 ?auto_139856 ) ) ( not ( = ?auto_139855 ?auto_139854 ) ) ( not ( = ?auto_139855 ?auto_139853 ) ) ( not ( = ?auto_139857 ?auto_139856 ) ) ( not ( = ?auto_139857 ?auto_139854 ) ) ( not ( = ?auto_139857 ?auto_139853 ) ) ( not ( = ?auto_139850 ?auto_139855 ) ) ( not ( = ?auto_139850 ?auto_139857 ) ) ( not ( = ?auto_139851 ?auto_139855 ) ) ( not ( = ?auto_139851 ?auto_139857 ) ) ( not ( = ?auto_139852 ?auto_139855 ) ) ( not ( = ?auto_139852 ?auto_139857 ) ) ( CLEAR ?auto_139851 ) ( ON ?auto_139852 ?auto_139853 ) ( CLEAR ?auto_139852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139855 ?auto_139857 ?auto_139856 ?auto_139854 ?auto_139853 )
      ( MAKE-5PILE ?auto_139850 ?auto_139851 ?auto_139852 ?auto_139853 ?auto_139854 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139858 - BLOCK
      ?auto_139859 - BLOCK
      ?auto_139860 - BLOCK
      ?auto_139861 - BLOCK
      ?auto_139862 - BLOCK
    )
    :vars
    (
      ?auto_139863 - BLOCK
      ?auto_139864 - BLOCK
      ?auto_139865 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139858 ) ( not ( = ?auto_139858 ?auto_139859 ) ) ( not ( = ?auto_139858 ?auto_139860 ) ) ( not ( = ?auto_139858 ?auto_139861 ) ) ( not ( = ?auto_139858 ?auto_139862 ) ) ( not ( = ?auto_139859 ?auto_139860 ) ) ( not ( = ?auto_139859 ?auto_139861 ) ) ( not ( = ?auto_139859 ?auto_139862 ) ) ( not ( = ?auto_139860 ?auto_139861 ) ) ( not ( = ?auto_139860 ?auto_139862 ) ) ( not ( = ?auto_139861 ?auto_139862 ) ) ( ON ?auto_139862 ?auto_139863 ) ( not ( = ?auto_139858 ?auto_139863 ) ) ( not ( = ?auto_139859 ?auto_139863 ) ) ( not ( = ?auto_139860 ?auto_139863 ) ) ( not ( = ?auto_139861 ?auto_139863 ) ) ( not ( = ?auto_139862 ?auto_139863 ) ) ( ON ?auto_139861 ?auto_139862 ) ( ON-TABLE ?auto_139864 ) ( ON ?auto_139865 ?auto_139864 ) ( ON ?auto_139863 ?auto_139865 ) ( not ( = ?auto_139864 ?auto_139865 ) ) ( not ( = ?auto_139864 ?auto_139863 ) ) ( not ( = ?auto_139864 ?auto_139862 ) ) ( not ( = ?auto_139864 ?auto_139861 ) ) ( not ( = ?auto_139865 ?auto_139863 ) ) ( not ( = ?auto_139865 ?auto_139862 ) ) ( not ( = ?auto_139865 ?auto_139861 ) ) ( not ( = ?auto_139858 ?auto_139864 ) ) ( not ( = ?auto_139858 ?auto_139865 ) ) ( not ( = ?auto_139859 ?auto_139864 ) ) ( not ( = ?auto_139859 ?auto_139865 ) ) ( not ( = ?auto_139860 ?auto_139864 ) ) ( not ( = ?auto_139860 ?auto_139865 ) ) ( ON ?auto_139860 ?auto_139861 ) ( CLEAR ?auto_139860 ) ( HOLDING ?auto_139859 ) ( CLEAR ?auto_139858 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139858 ?auto_139859 )
      ( MAKE-5PILE ?auto_139858 ?auto_139859 ?auto_139860 ?auto_139861 ?auto_139862 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139866 - BLOCK
      ?auto_139867 - BLOCK
      ?auto_139868 - BLOCK
      ?auto_139869 - BLOCK
      ?auto_139870 - BLOCK
    )
    :vars
    (
      ?auto_139873 - BLOCK
      ?auto_139872 - BLOCK
      ?auto_139871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_139866 ) ( not ( = ?auto_139866 ?auto_139867 ) ) ( not ( = ?auto_139866 ?auto_139868 ) ) ( not ( = ?auto_139866 ?auto_139869 ) ) ( not ( = ?auto_139866 ?auto_139870 ) ) ( not ( = ?auto_139867 ?auto_139868 ) ) ( not ( = ?auto_139867 ?auto_139869 ) ) ( not ( = ?auto_139867 ?auto_139870 ) ) ( not ( = ?auto_139868 ?auto_139869 ) ) ( not ( = ?auto_139868 ?auto_139870 ) ) ( not ( = ?auto_139869 ?auto_139870 ) ) ( ON ?auto_139870 ?auto_139873 ) ( not ( = ?auto_139866 ?auto_139873 ) ) ( not ( = ?auto_139867 ?auto_139873 ) ) ( not ( = ?auto_139868 ?auto_139873 ) ) ( not ( = ?auto_139869 ?auto_139873 ) ) ( not ( = ?auto_139870 ?auto_139873 ) ) ( ON ?auto_139869 ?auto_139870 ) ( ON-TABLE ?auto_139872 ) ( ON ?auto_139871 ?auto_139872 ) ( ON ?auto_139873 ?auto_139871 ) ( not ( = ?auto_139872 ?auto_139871 ) ) ( not ( = ?auto_139872 ?auto_139873 ) ) ( not ( = ?auto_139872 ?auto_139870 ) ) ( not ( = ?auto_139872 ?auto_139869 ) ) ( not ( = ?auto_139871 ?auto_139873 ) ) ( not ( = ?auto_139871 ?auto_139870 ) ) ( not ( = ?auto_139871 ?auto_139869 ) ) ( not ( = ?auto_139866 ?auto_139872 ) ) ( not ( = ?auto_139866 ?auto_139871 ) ) ( not ( = ?auto_139867 ?auto_139872 ) ) ( not ( = ?auto_139867 ?auto_139871 ) ) ( not ( = ?auto_139868 ?auto_139872 ) ) ( not ( = ?auto_139868 ?auto_139871 ) ) ( ON ?auto_139868 ?auto_139869 ) ( CLEAR ?auto_139866 ) ( ON ?auto_139867 ?auto_139868 ) ( CLEAR ?auto_139867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139872 ?auto_139871 ?auto_139873 ?auto_139870 ?auto_139869 ?auto_139868 )
      ( MAKE-5PILE ?auto_139866 ?auto_139867 ?auto_139868 ?auto_139869 ?auto_139870 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139874 - BLOCK
      ?auto_139875 - BLOCK
      ?auto_139876 - BLOCK
      ?auto_139877 - BLOCK
      ?auto_139878 - BLOCK
    )
    :vars
    (
      ?auto_139881 - BLOCK
      ?auto_139880 - BLOCK
      ?auto_139879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139874 ?auto_139875 ) ) ( not ( = ?auto_139874 ?auto_139876 ) ) ( not ( = ?auto_139874 ?auto_139877 ) ) ( not ( = ?auto_139874 ?auto_139878 ) ) ( not ( = ?auto_139875 ?auto_139876 ) ) ( not ( = ?auto_139875 ?auto_139877 ) ) ( not ( = ?auto_139875 ?auto_139878 ) ) ( not ( = ?auto_139876 ?auto_139877 ) ) ( not ( = ?auto_139876 ?auto_139878 ) ) ( not ( = ?auto_139877 ?auto_139878 ) ) ( ON ?auto_139878 ?auto_139881 ) ( not ( = ?auto_139874 ?auto_139881 ) ) ( not ( = ?auto_139875 ?auto_139881 ) ) ( not ( = ?auto_139876 ?auto_139881 ) ) ( not ( = ?auto_139877 ?auto_139881 ) ) ( not ( = ?auto_139878 ?auto_139881 ) ) ( ON ?auto_139877 ?auto_139878 ) ( ON-TABLE ?auto_139880 ) ( ON ?auto_139879 ?auto_139880 ) ( ON ?auto_139881 ?auto_139879 ) ( not ( = ?auto_139880 ?auto_139879 ) ) ( not ( = ?auto_139880 ?auto_139881 ) ) ( not ( = ?auto_139880 ?auto_139878 ) ) ( not ( = ?auto_139880 ?auto_139877 ) ) ( not ( = ?auto_139879 ?auto_139881 ) ) ( not ( = ?auto_139879 ?auto_139878 ) ) ( not ( = ?auto_139879 ?auto_139877 ) ) ( not ( = ?auto_139874 ?auto_139880 ) ) ( not ( = ?auto_139874 ?auto_139879 ) ) ( not ( = ?auto_139875 ?auto_139880 ) ) ( not ( = ?auto_139875 ?auto_139879 ) ) ( not ( = ?auto_139876 ?auto_139880 ) ) ( not ( = ?auto_139876 ?auto_139879 ) ) ( ON ?auto_139876 ?auto_139877 ) ( ON ?auto_139875 ?auto_139876 ) ( CLEAR ?auto_139875 ) ( HOLDING ?auto_139874 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_139874 )
      ( MAKE-5PILE ?auto_139874 ?auto_139875 ?auto_139876 ?auto_139877 ?auto_139878 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139882 - BLOCK
      ?auto_139883 - BLOCK
      ?auto_139884 - BLOCK
      ?auto_139885 - BLOCK
      ?auto_139886 - BLOCK
    )
    :vars
    (
      ?auto_139887 - BLOCK
      ?auto_139888 - BLOCK
      ?auto_139889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139882 ?auto_139883 ) ) ( not ( = ?auto_139882 ?auto_139884 ) ) ( not ( = ?auto_139882 ?auto_139885 ) ) ( not ( = ?auto_139882 ?auto_139886 ) ) ( not ( = ?auto_139883 ?auto_139884 ) ) ( not ( = ?auto_139883 ?auto_139885 ) ) ( not ( = ?auto_139883 ?auto_139886 ) ) ( not ( = ?auto_139884 ?auto_139885 ) ) ( not ( = ?auto_139884 ?auto_139886 ) ) ( not ( = ?auto_139885 ?auto_139886 ) ) ( ON ?auto_139886 ?auto_139887 ) ( not ( = ?auto_139882 ?auto_139887 ) ) ( not ( = ?auto_139883 ?auto_139887 ) ) ( not ( = ?auto_139884 ?auto_139887 ) ) ( not ( = ?auto_139885 ?auto_139887 ) ) ( not ( = ?auto_139886 ?auto_139887 ) ) ( ON ?auto_139885 ?auto_139886 ) ( ON-TABLE ?auto_139888 ) ( ON ?auto_139889 ?auto_139888 ) ( ON ?auto_139887 ?auto_139889 ) ( not ( = ?auto_139888 ?auto_139889 ) ) ( not ( = ?auto_139888 ?auto_139887 ) ) ( not ( = ?auto_139888 ?auto_139886 ) ) ( not ( = ?auto_139888 ?auto_139885 ) ) ( not ( = ?auto_139889 ?auto_139887 ) ) ( not ( = ?auto_139889 ?auto_139886 ) ) ( not ( = ?auto_139889 ?auto_139885 ) ) ( not ( = ?auto_139882 ?auto_139888 ) ) ( not ( = ?auto_139882 ?auto_139889 ) ) ( not ( = ?auto_139883 ?auto_139888 ) ) ( not ( = ?auto_139883 ?auto_139889 ) ) ( not ( = ?auto_139884 ?auto_139888 ) ) ( not ( = ?auto_139884 ?auto_139889 ) ) ( ON ?auto_139884 ?auto_139885 ) ( ON ?auto_139883 ?auto_139884 ) ( ON ?auto_139882 ?auto_139883 ) ( CLEAR ?auto_139882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139888 ?auto_139889 ?auto_139887 ?auto_139886 ?auto_139885 ?auto_139884 ?auto_139883 )
      ( MAKE-5PILE ?auto_139882 ?auto_139883 ?auto_139884 ?auto_139885 ?auto_139886 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139890 - BLOCK
      ?auto_139891 - BLOCK
      ?auto_139892 - BLOCK
      ?auto_139893 - BLOCK
      ?auto_139894 - BLOCK
    )
    :vars
    (
      ?auto_139897 - BLOCK
      ?auto_139896 - BLOCK
      ?auto_139895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139890 ?auto_139891 ) ) ( not ( = ?auto_139890 ?auto_139892 ) ) ( not ( = ?auto_139890 ?auto_139893 ) ) ( not ( = ?auto_139890 ?auto_139894 ) ) ( not ( = ?auto_139891 ?auto_139892 ) ) ( not ( = ?auto_139891 ?auto_139893 ) ) ( not ( = ?auto_139891 ?auto_139894 ) ) ( not ( = ?auto_139892 ?auto_139893 ) ) ( not ( = ?auto_139892 ?auto_139894 ) ) ( not ( = ?auto_139893 ?auto_139894 ) ) ( ON ?auto_139894 ?auto_139897 ) ( not ( = ?auto_139890 ?auto_139897 ) ) ( not ( = ?auto_139891 ?auto_139897 ) ) ( not ( = ?auto_139892 ?auto_139897 ) ) ( not ( = ?auto_139893 ?auto_139897 ) ) ( not ( = ?auto_139894 ?auto_139897 ) ) ( ON ?auto_139893 ?auto_139894 ) ( ON-TABLE ?auto_139896 ) ( ON ?auto_139895 ?auto_139896 ) ( ON ?auto_139897 ?auto_139895 ) ( not ( = ?auto_139896 ?auto_139895 ) ) ( not ( = ?auto_139896 ?auto_139897 ) ) ( not ( = ?auto_139896 ?auto_139894 ) ) ( not ( = ?auto_139896 ?auto_139893 ) ) ( not ( = ?auto_139895 ?auto_139897 ) ) ( not ( = ?auto_139895 ?auto_139894 ) ) ( not ( = ?auto_139895 ?auto_139893 ) ) ( not ( = ?auto_139890 ?auto_139896 ) ) ( not ( = ?auto_139890 ?auto_139895 ) ) ( not ( = ?auto_139891 ?auto_139896 ) ) ( not ( = ?auto_139891 ?auto_139895 ) ) ( not ( = ?auto_139892 ?auto_139896 ) ) ( not ( = ?auto_139892 ?auto_139895 ) ) ( ON ?auto_139892 ?auto_139893 ) ( ON ?auto_139891 ?auto_139892 ) ( HOLDING ?auto_139890 ) ( CLEAR ?auto_139891 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_139896 ?auto_139895 ?auto_139897 ?auto_139894 ?auto_139893 ?auto_139892 ?auto_139891 ?auto_139890 )
      ( MAKE-5PILE ?auto_139890 ?auto_139891 ?auto_139892 ?auto_139893 ?auto_139894 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139898 - BLOCK
      ?auto_139899 - BLOCK
      ?auto_139900 - BLOCK
      ?auto_139901 - BLOCK
      ?auto_139902 - BLOCK
    )
    :vars
    (
      ?auto_139905 - BLOCK
      ?auto_139904 - BLOCK
      ?auto_139903 - BLOCK
      ?auto_139906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139898 ?auto_139899 ) ) ( not ( = ?auto_139898 ?auto_139900 ) ) ( not ( = ?auto_139898 ?auto_139901 ) ) ( not ( = ?auto_139898 ?auto_139902 ) ) ( not ( = ?auto_139899 ?auto_139900 ) ) ( not ( = ?auto_139899 ?auto_139901 ) ) ( not ( = ?auto_139899 ?auto_139902 ) ) ( not ( = ?auto_139900 ?auto_139901 ) ) ( not ( = ?auto_139900 ?auto_139902 ) ) ( not ( = ?auto_139901 ?auto_139902 ) ) ( ON ?auto_139902 ?auto_139905 ) ( not ( = ?auto_139898 ?auto_139905 ) ) ( not ( = ?auto_139899 ?auto_139905 ) ) ( not ( = ?auto_139900 ?auto_139905 ) ) ( not ( = ?auto_139901 ?auto_139905 ) ) ( not ( = ?auto_139902 ?auto_139905 ) ) ( ON ?auto_139901 ?auto_139902 ) ( ON-TABLE ?auto_139904 ) ( ON ?auto_139903 ?auto_139904 ) ( ON ?auto_139905 ?auto_139903 ) ( not ( = ?auto_139904 ?auto_139903 ) ) ( not ( = ?auto_139904 ?auto_139905 ) ) ( not ( = ?auto_139904 ?auto_139902 ) ) ( not ( = ?auto_139904 ?auto_139901 ) ) ( not ( = ?auto_139903 ?auto_139905 ) ) ( not ( = ?auto_139903 ?auto_139902 ) ) ( not ( = ?auto_139903 ?auto_139901 ) ) ( not ( = ?auto_139898 ?auto_139904 ) ) ( not ( = ?auto_139898 ?auto_139903 ) ) ( not ( = ?auto_139899 ?auto_139904 ) ) ( not ( = ?auto_139899 ?auto_139903 ) ) ( not ( = ?auto_139900 ?auto_139904 ) ) ( not ( = ?auto_139900 ?auto_139903 ) ) ( ON ?auto_139900 ?auto_139901 ) ( ON ?auto_139899 ?auto_139900 ) ( CLEAR ?auto_139899 ) ( ON ?auto_139898 ?auto_139906 ) ( CLEAR ?auto_139898 ) ( HAND-EMPTY ) ( not ( = ?auto_139898 ?auto_139906 ) ) ( not ( = ?auto_139899 ?auto_139906 ) ) ( not ( = ?auto_139900 ?auto_139906 ) ) ( not ( = ?auto_139901 ?auto_139906 ) ) ( not ( = ?auto_139902 ?auto_139906 ) ) ( not ( = ?auto_139905 ?auto_139906 ) ) ( not ( = ?auto_139904 ?auto_139906 ) ) ( not ( = ?auto_139903 ?auto_139906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_139898 ?auto_139906 )
      ( MAKE-5PILE ?auto_139898 ?auto_139899 ?auto_139900 ?auto_139901 ?auto_139902 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139907 - BLOCK
      ?auto_139908 - BLOCK
      ?auto_139909 - BLOCK
      ?auto_139910 - BLOCK
      ?auto_139911 - BLOCK
    )
    :vars
    (
      ?auto_139915 - BLOCK
      ?auto_139914 - BLOCK
      ?auto_139913 - BLOCK
      ?auto_139912 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139907 ?auto_139908 ) ) ( not ( = ?auto_139907 ?auto_139909 ) ) ( not ( = ?auto_139907 ?auto_139910 ) ) ( not ( = ?auto_139907 ?auto_139911 ) ) ( not ( = ?auto_139908 ?auto_139909 ) ) ( not ( = ?auto_139908 ?auto_139910 ) ) ( not ( = ?auto_139908 ?auto_139911 ) ) ( not ( = ?auto_139909 ?auto_139910 ) ) ( not ( = ?auto_139909 ?auto_139911 ) ) ( not ( = ?auto_139910 ?auto_139911 ) ) ( ON ?auto_139911 ?auto_139915 ) ( not ( = ?auto_139907 ?auto_139915 ) ) ( not ( = ?auto_139908 ?auto_139915 ) ) ( not ( = ?auto_139909 ?auto_139915 ) ) ( not ( = ?auto_139910 ?auto_139915 ) ) ( not ( = ?auto_139911 ?auto_139915 ) ) ( ON ?auto_139910 ?auto_139911 ) ( ON-TABLE ?auto_139914 ) ( ON ?auto_139913 ?auto_139914 ) ( ON ?auto_139915 ?auto_139913 ) ( not ( = ?auto_139914 ?auto_139913 ) ) ( not ( = ?auto_139914 ?auto_139915 ) ) ( not ( = ?auto_139914 ?auto_139911 ) ) ( not ( = ?auto_139914 ?auto_139910 ) ) ( not ( = ?auto_139913 ?auto_139915 ) ) ( not ( = ?auto_139913 ?auto_139911 ) ) ( not ( = ?auto_139913 ?auto_139910 ) ) ( not ( = ?auto_139907 ?auto_139914 ) ) ( not ( = ?auto_139907 ?auto_139913 ) ) ( not ( = ?auto_139908 ?auto_139914 ) ) ( not ( = ?auto_139908 ?auto_139913 ) ) ( not ( = ?auto_139909 ?auto_139914 ) ) ( not ( = ?auto_139909 ?auto_139913 ) ) ( ON ?auto_139909 ?auto_139910 ) ( ON ?auto_139907 ?auto_139912 ) ( CLEAR ?auto_139907 ) ( not ( = ?auto_139907 ?auto_139912 ) ) ( not ( = ?auto_139908 ?auto_139912 ) ) ( not ( = ?auto_139909 ?auto_139912 ) ) ( not ( = ?auto_139910 ?auto_139912 ) ) ( not ( = ?auto_139911 ?auto_139912 ) ) ( not ( = ?auto_139915 ?auto_139912 ) ) ( not ( = ?auto_139914 ?auto_139912 ) ) ( not ( = ?auto_139913 ?auto_139912 ) ) ( HOLDING ?auto_139908 ) ( CLEAR ?auto_139909 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_139914 ?auto_139913 ?auto_139915 ?auto_139911 ?auto_139910 ?auto_139909 ?auto_139908 )
      ( MAKE-5PILE ?auto_139907 ?auto_139908 ?auto_139909 ?auto_139910 ?auto_139911 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139916 - BLOCK
      ?auto_139917 - BLOCK
      ?auto_139918 - BLOCK
      ?auto_139919 - BLOCK
      ?auto_139920 - BLOCK
    )
    :vars
    (
      ?auto_139921 - BLOCK
      ?auto_139922 - BLOCK
      ?auto_139923 - BLOCK
      ?auto_139924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139916 ?auto_139917 ) ) ( not ( = ?auto_139916 ?auto_139918 ) ) ( not ( = ?auto_139916 ?auto_139919 ) ) ( not ( = ?auto_139916 ?auto_139920 ) ) ( not ( = ?auto_139917 ?auto_139918 ) ) ( not ( = ?auto_139917 ?auto_139919 ) ) ( not ( = ?auto_139917 ?auto_139920 ) ) ( not ( = ?auto_139918 ?auto_139919 ) ) ( not ( = ?auto_139918 ?auto_139920 ) ) ( not ( = ?auto_139919 ?auto_139920 ) ) ( ON ?auto_139920 ?auto_139921 ) ( not ( = ?auto_139916 ?auto_139921 ) ) ( not ( = ?auto_139917 ?auto_139921 ) ) ( not ( = ?auto_139918 ?auto_139921 ) ) ( not ( = ?auto_139919 ?auto_139921 ) ) ( not ( = ?auto_139920 ?auto_139921 ) ) ( ON ?auto_139919 ?auto_139920 ) ( ON-TABLE ?auto_139922 ) ( ON ?auto_139923 ?auto_139922 ) ( ON ?auto_139921 ?auto_139923 ) ( not ( = ?auto_139922 ?auto_139923 ) ) ( not ( = ?auto_139922 ?auto_139921 ) ) ( not ( = ?auto_139922 ?auto_139920 ) ) ( not ( = ?auto_139922 ?auto_139919 ) ) ( not ( = ?auto_139923 ?auto_139921 ) ) ( not ( = ?auto_139923 ?auto_139920 ) ) ( not ( = ?auto_139923 ?auto_139919 ) ) ( not ( = ?auto_139916 ?auto_139922 ) ) ( not ( = ?auto_139916 ?auto_139923 ) ) ( not ( = ?auto_139917 ?auto_139922 ) ) ( not ( = ?auto_139917 ?auto_139923 ) ) ( not ( = ?auto_139918 ?auto_139922 ) ) ( not ( = ?auto_139918 ?auto_139923 ) ) ( ON ?auto_139918 ?auto_139919 ) ( ON ?auto_139916 ?auto_139924 ) ( not ( = ?auto_139916 ?auto_139924 ) ) ( not ( = ?auto_139917 ?auto_139924 ) ) ( not ( = ?auto_139918 ?auto_139924 ) ) ( not ( = ?auto_139919 ?auto_139924 ) ) ( not ( = ?auto_139920 ?auto_139924 ) ) ( not ( = ?auto_139921 ?auto_139924 ) ) ( not ( = ?auto_139922 ?auto_139924 ) ) ( not ( = ?auto_139923 ?auto_139924 ) ) ( CLEAR ?auto_139918 ) ( ON ?auto_139917 ?auto_139916 ) ( CLEAR ?auto_139917 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_139924 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_139924 ?auto_139916 )
      ( MAKE-5PILE ?auto_139916 ?auto_139917 ?auto_139918 ?auto_139919 ?auto_139920 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139925 - BLOCK
      ?auto_139926 - BLOCK
      ?auto_139927 - BLOCK
      ?auto_139928 - BLOCK
      ?auto_139929 - BLOCK
    )
    :vars
    (
      ?auto_139932 - BLOCK
      ?auto_139933 - BLOCK
      ?auto_139931 - BLOCK
      ?auto_139930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139925 ?auto_139926 ) ) ( not ( = ?auto_139925 ?auto_139927 ) ) ( not ( = ?auto_139925 ?auto_139928 ) ) ( not ( = ?auto_139925 ?auto_139929 ) ) ( not ( = ?auto_139926 ?auto_139927 ) ) ( not ( = ?auto_139926 ?auto_139928 ) ) ( not ( = ?auto_139926 ?auto_139929 ) ) ( not ( = ?auto_139927 ?auto_139928 ) ) ( not ( = ?auto_139927 ?auto_139929 ) ) ( not ( = ?auto_139928 ?auto_139929 ) ) ( ON ?auto_139929 ?auto_139932 ) ( not ( = ?auto_139925 ?auto_139932 ) ) ( not ( = ?auto_139926 ?auto_139932 ) ) ( not ( = ?auto_139927 ?auto_139932 ) ) ( not ( = ?auto_139928 ?auto_139932 ) ) ( not ( = ?auto_139929 ?auto_139932 ) ) ( ON ?auto_139928 ?auto_139929 ) ( ON-TABLE ?auto_139933 ) ( ON ?auto_139931 ?auto_139933 ) ( ON ?auto_139932 ?auto_139931 ) ( not ( = ?auto_139933 ?auto_139931 ) ) ( not ( = ?auto_139933 ?auto_139932 ) ) ( not ( = ?auto_139933 ?auto_139929 ) ) ( not ( = ?auto_139933 ?auto_139928 ) ) ( not ( = ?auto_139931 ?auto_139932 ) ) ( not ( = ?auto_139931 ?auto_139929 ) ) ( not ( = ?auto_139931 ?auto_139928 ) ) ( not ( = ?auto_139925 ?auto_139933 ) ) ( not ( = ?auto_139925 ?auto_139931 ) ) ( not ( = ?auto_139926 ?auto_139933 ) ) ( not ( = ?auto_139926 ?auto_139931 ) ) ( not ( = ?auto_139927 ?auto_139933 ) ) ( not ( = ?auto_139927 ?auto_139931 ) ) ( ON ?auto_139925 ?auto_139930 ) ( not ( = ?auto_139925 ?auto_139930 ) ) ( not ( = ?auto_139926 ?auto_139930 ) ) ( not ( = ?auto_139927 ?auto_139930 ) ) ( not ( = ?auto_139928 ?auto_139930 ) ) ( not ( = ?auto_139929 ?auto_139930 ) ) ( not ( = ?auto_139932 ?auto_139930 ) ) ( not ( = ?auto_139933 ?auto_139930 ) ) ( not ( = ?auto_139931 ?auto_139930 ) ) ( ON ?auto_139926 ?auto_139925 ) ( CLEAR ?auto_139926 ) ( ON-TABLE ?auto_139930 ) ( HOLDING ?auto_139927 ) ( CLEAR ?auto_139928 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139933 ?auto_139931 ?auto_139932 ?auto_139929 ?auto_139928 ?auto_139927 )
      ( MAKE-5PILE ?auto_139925 ?auto_139926 ?auto_139927 ?auto_139928 ?auto_139929 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139934 - BLOCK
      ?auto_139935 - BLOCK
      ?auto_139936 - BLOCK
      ?auto_139937 - BLOCK
      ?auto_139938 - BLOCK
    )
    :vars
    (
      ?auto_139940 - BLOCK
      ?auto_139941 - BLOCK
      ?auto_139939 - BLOCK
      ?auto_139942 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139934 ?auto_139935 ) ) ( not ( = ?auto_139934 ?auto_139936 ) ) ( not ( = ?auto_139934 ?auto_139937 ) ) ( not ( = ?auto_139934 ?auto_139938 ) ) ( not ( = ?auto_139935 ?auto_139936 ) ) ( not ( = ?auto_139935 ?auto_139937 ) ) ( not ( = ?auto_139935 ?auto_139938 ) ) ( not ( = ?auto_139936 ?auto_139937 ) ) ( not ( = ?auto_139936 ?auto_139938 ) ) ( not ( = ?auto_139937 ?auto_139938 ) ) ( ON ?auto_139938 ?auto_139940 ) ( not ( = ?auto_139934 ?auto_139940 ) ) ( not ( = ?auto_139935 ?auto_139940 ) ) ( not ( = ?auto_139936 ?auto_139940 ) ) ( not ( = ?auto_139937 ?auto_139940 ) ) ( not ( = ?auto_139938 ?auto_139940 ) ) ( ON ?auto_139937 ?auto_139938 ) ( ON-TABLE ?auto_139941 ) ( ON ?auto_139939 ?auto_139941 ) ( ON ?auto_139940 ?auto_139939 ) ( not ( = ?auto_139941 ?auto_139939 ) ) ( not ( = ?auto_139941 ?auto_139940 ) ) ( not ( = ?auto_139941 ?auto_139938 ) ) ( not ( = ?auto_139941 ?auto_139937 ) ) ( not ( = ?auto_139939 ?auto_139940 ) ) ( not ( = ?auto_139939 ?auto_139938 ) ) ( not ( = ?auto_139939 ?auto_139937 ) ) ( not ( = ?auto_139934 ?auto_139941 ) ) ( not ( = ?auto_139934 ?auto_139939 ) ) ( not ( = ?auto_139935 ?auto_139941 ) ) ( not ( = ?auto_139935 ?auto_139939 ) ) ( not ( = ?auto_139936 ?auto_139941 ) ) ( not ( = ?auto_139936 ?auto_139939 ) ) ( ON ?auto_139934 ?auto_139942 ) ( not ( = ?auto_139934 ?auto_139942 ) ) ( not ( = ?auto_139935 ?auto_139942 ) ) ( not ( = ?auto_139936 ?auto_139942 ) ) ( not ( = ?auto_139937 ?auto_139942 ) ) ( not ( = ?auto_139938 ?auto_139942 ) ) ( not ( = ?auto_139940 ?auto_139942 ) ) ( not ( = ?auto_139941 ?auto_139942 ) ) ( not ( = ?auto_139939 ?auto_139942 ) ) ( ON ?auto_139935 ?auto_139934 ) ( ON-TABLE ?auto_139942 ) ( CLEAR ?auto_139937 ) ( ON ?auto_139936 ?auto_139935 ) ( CLEAR ?auto_139936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139942 ?auto_139934 ?auto_139935 )
      ( MAKE-5PILE ?auto_139934 ?auto_139935 ?auto_139936 ?auto_139937 ?auto_139938 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139943 - BLOCK
      ?auto_139944 - BLOCK
      ?auto_139945 - BLOCK
      ?auto_139946 - BLOCK
      ?auto_139947 - BLOCK
    )
    :vars
    (
      ?auto_139948 - BLOCK
      ?auto_139950 - BLOCK
      ?auto_139949 - BLOCK
      ?auto_139951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139943 ?auto_139944 ) ) ( not ( = ?auto_139943 ?auto_139945 ) ) ( not ( = ?auto_139943 ?auto_139946 ) ) ( not ( = ?auto_139943 ?auto_139947 ) ) ( not ( = ?auto_139944 ?auto_139945 ) ) ( not ( = ?auto_139944 ?auto_139946 ) ) ( not ( = ?auto_139944 ?auto_139947 ) ) ( not ( = ?auto_139945 ?auto_139946 ) ) ( not ( = ?auto_139945 ?auto_139947 ) ) ( not ( = ?auto_139946 ?auto_139947 ) ) ( ON ?auto_139947 ?auto_139948 ) ( not ( = ?auto_139943 ?auto_139948 ) ) ( not ( = ?auto_139944 ?auto_139948 ) ) ( not ( = ?auto_139945 ?auto_139948 ) ) ( not ( = ?auto_139946 ?auto_139948 ) ) ( not ( = ?auto_139947 ?auto_139948 ) ) ( ON-TABLE ?auto_139950 ) ( ON ?auto_139949 ?auto_139950 ) ( ON ?auto_139948 ?auto_139949 ) ( not ( = ?auto_139950 ?auto_139949 ) ) ( not ( = ?auto_139950 ?auto_139948 ) ) ( not ( = ?auto_139950 ?auto_139947 ) ) ( not ( = ?auto_139950 ?auto_139946 ) ) ( not ( = ?auto_139949 ?auto_139948 ) ) ( not ( = ?auto_139949 ?auto_139947 ) ) ( not ( = ?auto_139949 ?auto_139946 ) ) ( not ( = ?auto_139943 ?auto_139950 ) ) ( not ( = ?auto_139943 ?auto_139949 ) ) ( not ( = ?auto_139944 ?auto_139950 ) ) ( not ( = ?auto_139944 ?auto_139949 ) ) ( not ( = ?auto_139945 ?auto_139950 ) ) ( not ( = ?auto_139945 ?auto_139949 ) ) ( ON ?auto_139943 ?auto_139951 ) ( not ( = ?auto_139943 ?auto_139951 ) ) ( not ( = ?auto_139944 ?auto_139951 ) ) ( not ( = ?auto_139945 ?auto_139951 ) ) ( not ( = ?auto_139946 ?auto_139951 ) ) ( not ( = ?auto_139947 ?auto_139951 ) ) ( not ( = ?auto_139948 ?auto_139951 ) ) ( not ( = ?auto_139950 ?auto_139951 ) ) ( not ( = ?auto_139949 ?auto_139951 ) ) ( ON ?auto_139944 ?auto_139943 ) ( ON-TABLE ?auto_139951 ) ( ON ?auto_139945 ?auto_139944 ) ( CLEAR ?auto_139945 ) ( HOLDING ?auto_139946 ) ( CLEAR ?auto_139947 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139950 ?auto_139949 ?auto_139948 ?auto_139947 ?auto_139946 )
      ( MAKE-5PILE ?auto_139943 ?auto_139944 ?auto_139945 ?auto_139946 ?auto_139947 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139952 - BLOCK
      ?auto_139953 - BLOCK
      ?auto_139954 - BLOCK
      ?auto_139955 - BLOCK
      ?auto_139956 - BLOCK
    )
    :vars
    (
      ?auto_139957 - BLOCK
      ?auto_139960 - BLOCK
      ?auto_139958 - BLOCK
      ?auto_139959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139952 ?auto_139953 ) ) ( not ( = ?auto_139952 ?auto_139954 ) ) ( not ( = ?auto_139952 ?auto_139955 ) ) ( not ( = ?auto_139952 ?auto_139956 ) ) ( not ( = ?auto_139953 ?auto_139954 ) ) ( not ( = ?auto_139953 ?auto_139955 ) ) ( not ( = ?auto_139953 ?auto_139956 ) ) ( not ( = ?auto_139954 ?auto_139955 ) ) ( not ( = ?auto_139954 ?auto_139956 ) ) ( not ( = ?auto_139955 ?auto_139956 ) ) ( ON ?auto_139956 ?auto_139957 ) ( not ( = ?auto_139952 ?auto_139957 ) ) ( not ( = ?auto_139953 ?auto_139957 ) ) ( not ( = ?auto_139954 ?auto_139957 ) ) ( not ( = ?auto_139955 ?auto_139957 ) ) ( not ( = ?auto_139956 ?auto_139957 ) ) ( ON-TABLE ?auto_139960 ) ( ON ?auto_139958 ?auto_139960 ) ( ON ?auto_139957 ?auto_139958 ) ( not ( = ?auto_139960 ?auto_139958 ) ) ( not ( = ?auto_139960 ?auto_139957 ) ) ( not ( = ?auto_139960 ?auto_139956 ) ) ( not ( = ?auto_139960 ?auto_139955 ) ) ( not ( = ?auto_139958 ?auto_139957 ) ) ( not ( = ?auto_139958 ?auto_139956 ) ) ( not ( = ?auto_139958 ?auto_139955 ) ) ( not ( = ?auto_139952 ?auto_139960 ) ) ( not ( = ?auto_139952 ?auto_139958 ) ) ( not ( = ?auto_139953 ?auto_139960 ) ) ( not ( = ?auto_139953 ?auto_139958 ) ) ( not ( = ?auto_139954 ?auto_139960 ) ) ( not ( = ?auto_139954 ?auto_139958 ) ) ( ON ?auto_139952 ?auto_139959 ) ( not ( = ?auto_139952 ?auto_139959 ) ) ( not ( = ?auto_139953 ?auto_139959 ) ) ( not ( = ?auto_139954 ?auto_139959 ) ) ( not ( = ?auto_139955 ?auto_139959 ) ) ( not ( = ?auto_139956 ?auto_139959 ) ) ( not ( = ?auto_139957 ?auto_139959 ) ) ( not ( = ?auto_139960 ?auto_139959 ) ) ( not ( = ?auto_139958 ?auto_139959 ) ) ( ON ?auto_139953 ?auto_139952 ) ( ON-TABLE ?auto_139959 ) ( ON ?auto_139954 ?auto_139953 ) ( CLEAR ?auto_139956 ) ( ON ?auto_139955 ?auto_139954 ) ( CLEAR ?auto_139955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139959 ?auto_139952 ?auto_139953 ?auto_139954 )
      ( MAKE-5PILE ?auto_139952 ?auto_139953 ?auto_139954 ?auto_139955 ?auto_139956 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139961 - BLOCK
      ?auto_139962 - BLOCK
      ?auto_139963 - BLOCK
      ?auto_139964 - BLOCK
      ?auto_139965 - BLOCK
    )
    :vars
    (
      ?auto_139968 - BLOCK
      ?auto_139967 - BLOCK
      ?auto_139969 - BLOCK
      ?auto_139966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139961 ?auto_139962 ) ) ( not ( = ?auto_139961 ?auto_139963 ) ) ( not ( = ?auto_139961 ?auto_139964 ) ) ( not ( = ?auto_139961 ?auto_139965 ) ) ( not ( = ?auto_139962 ?auto_139963 ) ) ( not ( = ?auto_139962 ?auto_139964 ) ) ( not ( = ?auto_139962 ?auto_139965 ) ) ( not ( = ?auto_139963 ?auto_139964 ) ) ( not ( = ?auto_139963 ?auto_139965 ) ) ( not ( = ?auto_139964 ?auto_139965 ) ) ( not ( = ?auto_139961 ?auto_139968 ) ) ( not ( = ?auto_139962 ?auto_139968 ) ) ( not ( = ?auto_139963 ?auto_139968 ) ) ( not ( = ?auto_139964 ?auto_139968 ) ) ( not ( = ?auto_139965 ?auto_139968 ) ) ( ON-TABLE ?auto_139967 ) ( ON ?auto_139969 ?auto_139967 ) ( ON ?auto_139968 ?auto_139969 ) ( not ( = ?auto_139967 ?auto_139969 ) ) ( not ( = ?auto_139967 ?auto_139968 ) ) ( not ( = ?auto_139967 ?auto_139965 ) ) ( not ( = ?auto_139967 ?auto_139964 ) ) ( not ( = ?auto_139969 ?auto_139968 ) ) ( not ( = ?auto_139969 ?auto_139965 ) ) ( not ( = ?auto_139969 ?auto_139964 ) ) ( not ( = ?auto_139961 ?auto_139967 ) ) ( not ( = ?auto_139961 ?auto_139969 ) ) ( not ( = ?auto_139962 ?auto_139967 ) ) ( not ( = ?auto_139962 ?auto_139969 ) ) ( not ( = ?auto_139963 ?auto_139967 ) ) ( not ( = ?auto_139963 ?auto_139969 ) ) ( ON ?auto_139961 ?auto_139966 ) ( not ( = ?auto_139961 ?auto_139966 ) ) ( not ( = ?auto_139962 ?auto_139966 ) ) ( not ( = ?auto_139963 ?auto_139966 ) ) ( not ( = ?auto_139964 ?auto_139966 ) ) ( not ( = ?auto_139965 ?auto_139966 ) ) ( not ( = ?auto_139968 ?auto_139966 ) ) ( not ( = ?auto_139967 ?auto_139966 ) ) ( not ( = ?auto_139969 ?auto_139966 ) ) ( ON ?auto_139962 ?auto_139961 ) ( ON-TABLE ?auto_139966 ) ( ON ?auto_139963 ?auto_139962 ) ( ON ?auto_139964 ?auto_139963 ) ( CLEAR ?auto_139964 ) ( HOLDING ?auto_139965 ) ( CLEAR ?auto_139968 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_139967 ?auto_139969 ?auto_139968 ?auto_139965 )
      ( MAKE-5PILE ?auto_139961 ?auto_139962 ?auto_139963 ?auto_139964 ?auto_139965 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139970 - BLOCK
      ?auto_139971 - BLOCK
      ?auto_139972 - BLOCK
      ?auto_139973 - BLOCK
      ?auto_139974 - BLOCK
    )
    :vars
    (
      ?auto_139978 - BLOCK
      ?auto_139977 - BLOCK
      ?auto_139975 - BLOCK
      ?auto_139976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139970 ?auto_139971 ) ) ( not ( = ?auto_139970 ?auto_139972 ) ) ( not ( = ?auto_139970 ?auto_139973 ) ) ( not ( = ?auto_139970 ?auto_139974 ) ) ( not ( = ?auto_139971 ?auto_139972 ) ) ( not ( = ?auto_139971 ?auto_139973 ) ) ( not ( = ?auto_139971 ?auto_139974 ) ) ( not ( = ?auto_139972 ?auto_139973 ) ) ( not ( = ?auto_139972 ?auto_139974 ) ) ( not ( = ?auto_139973 ?auto_139974 ) ) ( not ( = ?auto_139970 ?auto_139978 ) ) ( not ( = ?auto_139971 ?auto_139978 ) ) ( not ( = ?auto_139972 ?auto_139978 ) ) ( not ( = ?auto_139973 ?auto_139978 ) ) ( not ( = ?auto_139974 ?auto_139978 ) ) ( ON-TABLE ?auto_139977 ) ( ON ?auto_139975 ?auto_139977 ) ( ON ?auto_139978 ?auto_139975 ) ( not ( = ?auto_139977 ?auto_139975 ) ) ( not ( = ?auto_139977 ?auto_139978 ) ) ( not ( = ?auto_139977 ?auto_139974 ) ) ( not ( = ?auto_139977 ?auto_139973 ) ) ( not ( = ?auto_139975 ?auto_139978 ) ) ( not ( = ?auto_139975 ?auto_139974 ) ) ( not ( = ?auto_139975 ?auto_139973 ) ) ( not ( = ?auto_139970 ?auto_139977 ) ) ( not ( = ?auto_139970 ?auto_139975 ) ) ( not ( = ?auto_139971 ?auto_139977 ) ) ( not ( = ?auto_139971 ?auto_139975 ) ) ( not ( = ?auto_139972 ?auto_139977 ) ) ( not ( = ?auto_139972 ?auto_139975 ) ) ( ON ?auto_139970 ?auto_139976 ) ( not ( = ?auto_139970 ?auto_139976 ) ) ( not ( = ?auto_139971 ?auto_139976 ) ) ( not ( = ?auto_139972 ?auto_139976 ) ) ( not ( = ?auto_139973 ?auto_139976 ) ) ( not ( = ?auto_139974 ?auto_139976 ) ) ( not ( = ?auto_139978 ?auto_139976 ) ) ( not ( = ?auto_139977 ?auto_139976 ) ) ( not ( = ?auto_139975 ?auto_139976 ) ) ( ON ?auto_139971 ?auto_139970 ) ( ON-TABLE ?auto_139976 ) ( ON ?auto_139972 ?auto_139971 ) ( ON ?auto_139973 ?auto_139972 ) ( CLEAR ?auto_139978 ) ( ON ?auto_139974 ?auto_139973 ) ( CLEAR ?auto_139974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_139976 ?auto_139970 ?auto_139971 ?auto_139972 ?auto_139973 )
      ( MAKE-5PILE ?auto_139970 ?auto_139971 ?auto_139972 ?auto_139973 ?auto_139974 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139979 - BLOCK
      ?auto_139980 - BLOCK
      ?auto_139981 - BLOCK
      ?auto_139982 - BLOCK
      ?auto_139983 - BLOCK
    )
    :vars
    (
      ?auto_139985 - BLOCK
      ?auto_139984 - BLOCK
      ?auto_139987 - BLOCK
      ?auto_139986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139979 ?auto_139980 ) ) ( not ( = ?auto_139979 ?auto_139981 ) ) ( not ( = ?auto_139979 ?auto_139982 ) ) ( not ( = ?auto_139979 ?auto_139983 ) ) ( not ( = ?auto_139980 ?auto_139981 ) ) ( not ( = ?auto_139980 ?auto_139982 ) ) ( not ( = ?auto_139980 ?auto_139983 ) ) ( not ( = ?auto_139981 ?auto_139982 ) ) ( not ( = ?auto_139981 ?auto_139983 ) ) ( not ( = ?auto_139982 ?auto_139983 ) ) ( not ( = ?auto_139979 ?auto_139985 ) ) ( not ( = ?auto_139980 ?auto_139985 ) ) ( not ( = ?auto_139981 ?auto_139985 ) ) ( not ( = ?auto_139982 ?auto_139985 ) ) ( not ( = ?auto_139983 ?auto_139985 ) ) ( ON-TABLE ?auto_139984 ) ( ON ?auto_139987 ?auto_139984 ) ( not ( = ?auto_139984 ?auto_139987 ) ) ( not ( = ?auto_139984 ?auto_139985 ) ) ( not ( = ?auto_139984 ?auto_139983 ) ) ( not ( = ?auto_139984 ?auto_139982 ) ) ( not ( = ?auto_139987 ?auto_139985 ) ) ( not ( = ?auto_139987 ?auto_139983 ) ) ( not ( = ?auto_139987 ?auto_139982 ) ) ( not ( = ?auto_139979 ?auto_139984 ) ) ( not ( = ?auto_139979 ?auto_139987 ) ) ( not ( = ?auto_139980 ?auto_139984 ) ) ( not ( = ?auto_139980 ?auto_139987 ) ) ( not ( = ?auto_139981 ?auto_139984 ) ) ( not ( = ?auto_139981 ?auto_139987 ) ) ( ON ?auto_139979 ?auto_139986 ) ( not ( = ?auto_139979 ?auto_139986 ) ) ( not ( = ?auto_139980 ?auto_139986 ) ) ( not ( = ?auto_139981 ?auto_139986 ) ) ( not ( = ?auto_139982 ?auto_139986 ) ) ( not ( = ?auto_139983 ?auto_139986 ) ) ( not ( = ?auto_139985 ?auto_139986 ) ) ( not ( = ?auto_139984 ?auto_139986 ) ) ( not ( = ?auto_139987 ?auto_139986 ) ) ( ON ?auto_139980 ?auto_139979 ) ( ON-TABLE ?auto_139986 ) ( ON ?auto_139981 ?auto_139980 ) ( ON ?auto_139982 ?auto_139981 ) ( ON ?auto_139983 ?auto_139982 ) ( CLEAR ?auto_139983 ) ( HOLDING ?auto_139985 ) ( CLEAR ?auto_139987 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_139984 ?auto_139987 ?auto_139985 )
      ( MAKE-5PILE ?auto_139979 ?auto_139980 ?auto_139981 ?auto_139982 ?auto_139983 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139988 - BLOCK
      ?auto_139989 - BLOCK
      ?auto_139990 - BLOCK
      ?auto_139991 - BLOCK
      ?auto_139992 - BLOCK
    )
    :vars
    (
      ?auto_139995 - BLOCK
      ?auto_139994 - BLOCK
      ?auto_139996 - BLOCK
      ?auto_139993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139988 ?auto_139989 ) ) ( not ( = ?auto_139988 ?auto_139990 ) ) ( not ( = ?auto_139988 ?auto_139991 ) ) ( not ( = ?auto_139988 ?auto_139992 ) ) ( not ( = ?auto_139989 ?auto_139990 ) ) ( not ( = ?auto_139989 ?auto_139991 ) ) ( not ( = ?auto_139989 ?auto_139992 ) ) ( not ( = ?auto_139990 ?auto_139991 ) ) ( not ( = ?auto_139990 ?auto_139992 ) ) ( not ( = ?auto_139991 ?auto_139992 ) ) ( not ( = ?auto_139988 ?auto_139995 ) ) ( not ( = ?auto_139989 ?auto_139995 ) ) ( not ( = ?auto_139990 ?auto_139995 ) ) ( not ( = ?auto_139991 ?auto_139995 ) ) ( not ( = ?auto_139992 ?auto_139995 ) ) ( ON-TABLE ?auto_139994 ) ( ON ?auto_139996 ?auto_139994 ) ( not ( = ?auto_139994 ?auto_139996 ) ) ( not ( = ?auto_139994 ?auto_139995 ) ) ( not ( = ?auto_139994 ?auto_139992 ) ) ( not ( = ?auto_139994 ?auto_139991 ) ) ( not ( = ?auto_139996 ?auto_139995 ) ) ( not ( = ?auto_139996 ?auto_139992 ) ) ( not ( = ?auto_139996 ?auto_139991 ) ) ( not ( = ?auto_139988 ?auto_139994 ) ) ( not ( = ?auto_139988 ?auto_139996 ) ) ( not ( = ?auto_139989 ?auto_139994 ) ) ( not ( = ?auto_139989 ?auto_139996 ) ) ( not ( = ?auto_139990 ?auto_139994 ) ) ( not ( = ?auto_139990 ?auto_139996 ) ) ( ON ?auto_139988 ?auto_139993 ) ( not ( = ?auto_139988 ?auto_139993 ) ) ( not ( = ?auto_139989 ?auto_139993 ) ) ( not ( = ?auto_139990 ?auto_139993 ) ) ( not ( = ?auto_139991 ?auto_139993 ) ) ( not ( = ?auto_139992 ?auto_139993 ) ) ( not ( = ?auto_139995 ?auto_139993 ) ) ( not ( = ?auto_139994 ?auto_139993 ) ) ( not ( = ?auto_139996 ?auto_139993 ) ) ( ON ?auto_139989 ?auto_139988 ) ( ON-TABLE ?auto_139993 ) ( ON ?auto_139990 ?auto_139989 ) ( ON ?auto_139991 ?auto_139990 ) ( ON ?auto_139992 ?auto_139991 ) ( CLEAR ?auto_139996 ) ( ON ?auto_139995 ?auto_139992 ) ( CLEAR ?auto_139995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_139993 ?auto_139988 ?auto_139989 ?auto_139990 ?auto_139991 ?auto_139992 )
      ( MAKE-5PILE ?auto_139988 ?auto_139989 ?auto_139990 ?auto_139991 ?auto_139992 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_139997 - BLOCK
      ?auto_139998 - BLOCK
      ?auto_139999 - BLOCK
      ?auto_140000 - BLOCK
      ?auto_140001 - BLOCK
    )
    :vars
    (
      ?auto_140003 - BLOCK
      ?auto_140002 - BLOCK
      ?auto_140005 - BLOCK
      ?auto_140004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_139997 ?auto_139998 ) ) ( not ( = ?auto_139997 ?auto_139999 ) ) ( not ( = ?auto_139997 ?auto_140000 ) ) ( not ( = ?auto_139997 ?auto_140001 ) ) ( not ( = ?auto_139998 ?auto_139999 ) ) ( not ( = ?auto_139998 ?auto_140000 ) ) ( not ( = ?auto_139998 ?auto_140001 ) ) ( not ( = ?auto_139999 ?auto_140000 ) ) ( not ( = ?auto_139999 ?auto_140001 ) ) ( not ( = ?auto_140000 ?auto_140001 ) ) ( not ( = ?auto_139997 ?auto_140003 ) ) ( not ( = ?auto_139998 ?auto_140003 ) ) ( not ( = ?auto_139999 ?auto_140003 ) ) ( not ( = ?auto_140000 ?auto_140003 ) ) ( not ( = ?auto_140001 ?auto_140003 ) ) ( ON-TABLE ?auto_140002 ) ( not ( = ?auto_140002 ?auto_140005 ) ) ( not ( = ?auto_140002 ?auto_140003 ) ) ( not ( = ?auto_140002 ?auto_140001 ) ) ( not ( = ?auto_140002 ?auto_140000 ) ) ( not ( = ?auto_140005 ?auto_140003 ) ) ( not ( = ?auto_140005 ?auto_140001 ) ) ( not ( = ?auto_140005 ?auto_140000 ) ) ( not ( = ?auto_139997 ?auto_140002 ) ) ( not ( = ?auto_139997 ?auto_140005 ) ) ( not ( = ?auto_139998 ?auto_140002 ) ) ( not ( = ?auto_139998 ?auto_140005 ) ) ( not ( = ?auto_139999 ?auto_140002 ) ) ( not ( = ?auto_139999 ?auto_140005 ) ) ( ON ?auto_139997 ?auto_140004 ) ( not ( = ?auto_139997 ?auto_140004 ) ) ( not ( = ?auto_139998 ?auto_140004 ) ) ( not ( = ?auto_139999 ?auto_140004 ) ) ( not ( = ?auto_140000 ?auto_140004 ) ) ( not ( = ?auto_140001 ?auto_140004 ) ) ( not ( = ?auto_140003 ?auto_140004 ) ) ( not ( = ?auto_140002 ?auto_140004 ) ) ( not ( = ?auto_140005 ?auto_140004 ) ) ( ON ?auto_139998 ?auto_139997 ) ( ON-TABLE ?auto_140004 ) ( ON ?auto_139999 ?auto_139998 ) ( ON ?auto_140000 ?auto_139999 ) ( ON ?auto_140001 ?auto_140000 ) ( ON ?auto_140003 ?auto_140001 ) ( CLEAR ?auto_140003 ) ( HOLDING ?auto_140005 ) ( CLEAR ?auto_140002 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140002 ?auto_140005 )
      ( MAKE-5PILE ?auto_139997 ?auto_139998 ?auto_139999 ?auto_140000 ?auto_140001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_140006 - BLOCK
      ?auto_140007 - BLOCK
      ?auto_140008 - BLOCK
      ?auto_140009 - BLOCK
      ?auto_140010 - BLOCK
    )
    :vars
    (
      ?auto_140012 - BLOCK
      ?auto_140014 - BLOCK
      ?auto_140011 - BLOCK
      ?auto_140013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140006 ?auto_140007 ) ) ( not ( = ?auto_140006 ?auto_140008 ) ) ( not ( = ?auto_140006 ?auto_140009 ) ) ( not ( = ?auto_140006 ?auto_140010 ) ) ( not ( = ?auto_140007 ?auto_140008 ) ) ( not ( = ?auto_140007 ?auto_140009 ) ) ( not ( = ?auto_140007 ?auto_140010 ) ) ( not ( = ?auto_140008 ?auto_140009 ) ) ( not ( = ?auto_140008 ?auto_140010 ) ) ( not ( = ?auto_140009 ?auto_140010 ) ) ( not ( = ?auto_140006 ?auto_140012 ) ) ( not ( = ?auto_140007 ?auto_140012 ) ) ( not ( = ?auto_140008 ?auto_140012 ) ) ( not ( = ?auto_140009 ?auto_140012 ) ) ( not ( = ?auto_140010 ?auto_140012 ) ) ( ON-TABLE ?auto_140014 ) ( not ( = ?auto_140014 ?auto_140011 ) ) ( not ( = ?auto_140014 ?auto_140012 ) ) ( not ( = ?auto_140014 ?auto_140010 ) ) ( not ( = ?auto_140014 ?auto_140009 ) ) ( not ( = ?auto_140011 ?auto_140012 ) ) ( not ( = ?auto_140011 ?auto_140010 ) ) ( not ( = ?auto_140011 ?auto_140009 ) ) ( not ( = ?auto_140006 ?auto_140014 ) ) ( not ( = ?auto_140006 ?auto_140011 ) ) ( not ( = ?auto_140007 ?auto_140014 ) ) ( not ( = ?auto_140007 ?auto_140011 ) ) ( not ( = ?auto_140008 ?auto_140014 ) ) ( not ( = ?auto_140008 ?auto_140011 ) ) ( ON ?auto_140006 ?auto_140013 ) ( not ( = ?auto_140006 ?auto_140013 ) ) ( not ( = ?auto_140007 ?auto_140013 ) ) ( not ( = ?auto_140008 ?auto_140013 ) ) ( not ( = ?auto_140009 ?auto_140013 ) ) ( not ( = ?auto_140010 ?auto_140013 ) ) ( not ( = ?auto_140012 ?auto_140013 ) ) ( not ( = ?auto_140014 ?auto_140013 ) ) ( not ( = ?auto_140011 ?auto_140013 ) ) ( ON ?auto_140007 ?auto_140006 ) ( ON-TABLE ?auto_140013 ) ( ON ?auto_140008 ?auto_140007 ) ( ON ?auto_140009 ?auto_140008 ) ( ON ?auto_140010 ?auto_140009 ) ( ON ?auto_140012 ?auto_140010 ) ( CLEAR ?auto_140014 ) ( ON ?auto_140011 ?auto_140012 ) ( CLEAR ?auto_140011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140013 ?auto_140006 ?auto_140007 ?auto_140008 ?auto_140009 ?auto_140010 ?auto_140012 )
      ( MAKE-5PILE ?auto_140006 ?auto_140007 ?auto_140008 ?auto_140009 ?auto_140010 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_140015 - BLOCK
      ?auto_140016 - BLOCK
      ?auto_140017 - BLOCK
      ?auto_140018 - BLOCK
      ?auto_140019 - BLOCK
    )
    :vars
    (
      ?auto_140023 - BLOCK
      ?auto_140021 - BLOCK
      ?auto_140022 - BLOCK
      ?auto_140020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140015 ?auto_140016 ) ) ( not ( = ?auto_140015 ?auto_140017 ) ) ( not ( = ?auto_140015 ?auto_140018 ) ) ( not ( = ?auto_140015 ?auto_140019 ) ) ( not ( = ?auto_140016 ?auto_140017 ) ) ( not ( = ?auto_140016 ?auto_140018 ) ) ( not ( = ?auto_140016 ?auto_140019 ) ) ( not ( = ?auto_140017 ?auto_140018 ) ) ( not ( = ?auto_140017 ?auto_140019 ) ) ( not ( = ?auto_140018 ?auto_140019 ) ) ( not ( = ?auto_140015 ?auto_140023 ) ) ( not ( = ?auto_140016 ?auto_140023 ) ) ( not ( = ?auto_140017 ?auto_140023 ) ) ( not ( = ?auto_140018 ?auto_140023 ) ) ( not ( = ?auto_140019 ?auto_140023 ) ) ( not ( = ?auto_140021 ?auto_140022 ) ) ( not ( = ?auto_140021 ?auto_140023 ) ) ( not ( = ?auto_140021 ?auto_140019 ) ) ( not ( = ?auto_140021 ?auto_140018 ) ) ( not ( = ?auto_140022 ?auto_140023 ) ) ( not ( = ?auto_140022 ?auto_140019 ) ) ( not ( = ?auto_140022 ?auto_140018 ) ) ( not ( = ?auto_140015 ?auto_140021 ) ) ( not ( = ?auto_140015 ?auto_140022 ) ) ( not ( = ?auto_140016 ?auto_140021 ) ) ( not ( = ?auto_140016 ?auto_140022 ) ) ( not ( = ?auto_140017 ?auto_140021 ) ) ( not ( = ?auto_140017 ?auto_140022 ) ) ( ON ?auto_140015 ?auto_140020 ) ( not ( = ?auto_140015 ?auto_140020 ) ) ( not ( = ?auto_140016 ?auto_140020 ) ) ( not ( = ?auto_140017 ?auto_140020 ) ) ( not ( = ?auto_140018 ?auto_140020 ) ) ( not ( = ?auto_140019 ?auto_140020 ) ) ( not ( = ?auto_140023 ?auto_140020 ) ) ( not ( = ?auto_140021 ?auto_140020 ) ) ( not ( = ?auto_140022 ?auto_140020 ) ) ( ON ?auto_140016 ?auto_140015 ) ( ON-TABLE ?auto_140020 ) ( ON ?auto_140017 ?auto_140016 ) ( ON ?auto_140018 ?auto_140017 ) ( ON ?auto_140019 ?auto_140018 ) ( ON ?auto_140023 ?auto_140019 ) ( ON ?auto_140022 ?auto_140023 ) ( CLEAR ?auto_140022 ) ( HOLDING ?auto_140021 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140021 )
      ( MAKE-5PILE ?auto_140015 ?auto_140016 ?auto_140017 ?auto_140018 ?auto_140019 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_140024 - BLOCK
      ?auto_140025 - BLOCK
      ?auto_140026 - BLOCK
      ?auto_140027 - BLOCK
      ?auto_140028 - BLOCK
    )
    :vars
    (
      ?auto_140032 - BLOCK
      ?auto_140030 - BLOCK
      ?auto_140029 - BLOCK
      ?auto_140031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140024 ?auto_140025 ) ) ( not ( = ?auto_140024 ?auto_140026 ) ) ( not ( = ?auto_140024 ?auto_140027 ) ) ( not ( = ?auto_140024 ?auto_140028 ) ) ( not ( = ?auto_140025 ?auto_140026 ) ) ( not ( = ?auto_140025 ?auto_140027 ) ) ( not ( = ?auto_140025 ?auto_140028 ) ) ( not ( = ?auto_140026 ?auto_140027 ) ) ( not ( = ?auto_140026 ?auto_140028 ) ) ( not ( = ?auto_140027 ?auto_140028 ) ) ( not ( = ?auto_140024 ?auto_140032 ) ) ( not ( = ?auto_140025 ?auto_140032 ) ) ( not ( = ?auto_140026 ?auto_140032 ) ) ( not ( = ?auto_140027 ?auto_140032 ) ) ( not ( = ?auto_140028 ?auto_140032 ) ) ( not ( = ?auto_140030 ?auto_140029 ) ) ( not ( = ?auto_140030 ?auto_140032 ) ) ( not ( = ?auto_140030 ?auto_140028 ) ) ( not ( = ?auto_140030 ?auto_140027 ) ) ( not ( = ?auto_140029 ?auto_140032 ) ) ( not ( = ?auto_140029 ?auto_140028 ) ) ( not ( = ?auto_140029 ?auto_140027 ) ) ( not ( = ?auto_140024 ?auto_140030 ) ) ( not ( = ?auto_140024 ?auto_140029 ) ) ( not ( = ?auto_140025 ?auto_140030 ) ) ( not ( = ?auto_140025 ?auto_140029 ) ) ( not ( = ?auto_140026 ?auto_140030 ) ) ( not ( = ?auto_140026 ?auto_140029 ) ) ( ON ?auto_140024 ?auto_140031 ) ( not ( = ?auto_140024 ?auto_140031 ) ) ( not ( = ?auto_140025 ?auto_140031 ) ) ( not ( = ?auto_140026 ?auto_140031 ) ) ( not ( = ?auto_140027 ?auto_140031 ) ) ( not ( = ?auto_140028 ?auto_140031 ) ) ( not ( = ?auto_140032 ?auto_140031 ) ) ( not ( = ?auto_140030 ?auto_140031 ) ) ( not ( = ?auto_140029 ?auto_140031 ) ) ( ON ?auto_140025 ?auto_140024 ) ( ON-TABLE ?auto_140031 ) ( ON ?auto_140026 ?auto_140025 ) ( ON ?auto_140027 ?auto_140026 ) ( ON ?auto_140028 ?auto_140027 ) ( ON ?auto_140032 ?auto_140028 ) ( ON ?auto_140029 ?auto_140032 ) ( ON ?auto_140030 ?auto_140029 ) ( CLEAR ?auto_140030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140031 ?auto_140024 ?auto_140025 ?auto_140026 ?auto_140027 ?auto_140028 ?auto_140032 ?auto_140029 )
      ( MAKE-5PILE ?auto_140024 ?auto_140025 ?auto_140026 ?auto_140027 ?auto_140028 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140035 - BLOCK
      ?auto_140036 - BLOCK
    )
    :vars
    (
      ?auto_140037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140037 ?auto_140036 ) ( CLEAR ?auto_140037 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140035 ) ( ON ?auto_140036 ?auto_140035 ) ( not ( = ?auto_140035 ?auto_140036 ) ) ( not ( = ?auto_140035 ?auto_140037 ) ) ( not ( = ?auto_140036 ?auto_140037 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140037 ?auto_140036 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140038 - BLOCK
      ?auto_140039 - BLOCK
    )
    :vars
    (
      ?auto_140040 - BLOCK
      ?auto_140041 - BLOCK
      ?auto_140042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140040 ?auto_140039 ) ( CLEAR ?auto_140040 ) ( ON-TABLE ?auto_140038 ) ( ON ?auto_140039 ?auto_140038 ) ( not ( = ?auto_140038 ?auto_140039 ) ) ( not ( = ?auto_140038 ?auto_140040 ) ) ( not ( = ?auto_140039 ?auto_140040 ) ) ( HOLDING ?auto_140041 ) ( CLEAR ?auto_140042 ) ( not ( = ?auto_140038 ?auto_140041 ) ) ( not ( = ?auto_140038 ?auto_140042 ) ) ( not ( = ?auto_140039 ?auto_140041 ) ) ( not ( = ?auto_140039 ?auto_140042 ) ) ( not ( = ?auto_140040 ?auto_140041 ) ) ( not ( = ?auto_140040 ?auto_140042 ) ) ( not ( = ?auto_140041 ?auto_140042 ) ) )
    :subtasks
    ( ( !STACK ?auto_140041 ?auto_140042 )
      ( MAKE-2PILE ?auto_140038 ?auto_140039 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140043 - BLOCK
      ?auto_140044 - BLOCK
    )
    :vars
    (
      ?auto_140047 - BLOCK
      ?auto_140045 - BLOCK
      ?auto_140046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140047 ?auto_140044 ) ( ON-TABLE ?auto_140043 ) ( ON ?auto_140044 ?auto_140043 ) ( not ( = ?auto_140043 ?auto_140044 ) ) ( not ( = ?auto_140043 ?auto_140047 ) ) ( not ( = ?auto_140044 ?auto_140047 ) ) ( CLEAR ?auto_140045 ) ( not ( = ?auto_140043 ?auto_140046 ) ) ( not ( = ?auto_140043 ?auto_140045 ) ) ( not ( = ?auto_140044 ?auto_140046 ) ) ( not ( = ?auto_140044 ?auto_140045 ) ) ( not ( = ?auto_140047 ?auto_140046 ) ) ( not ( = ?auto_140047 ?auto_140045 ) ) ( not ( = ?auto_140046 ?auto_140045 ) ) ( ON ?auto_140046 ?auto_140047 ) ( CLEAR ?auto_140046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140043 ?auto_140044 ?auto_140047 )
      ( MAKE-2PILE ?auto_140043 ?auto_140044 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140048 - BLOCK
      ?auto_140049 - BLOCK
    )
    :vars
    (
      ?auto_140051 - BLOCK
      ?auto_140052 - BLOCK
      ?auto_140050 - BLOCK
      ?auto_140055 - BLOCK
      ?auto_140053 - BLOCK
      ?auto_140054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140051 ?auto_140049 ) ( ON-TABLE ?auto_140048 ) ( ON ?auto_140049 ?auto_140048 ) ( not ( = ?auto_140048 ?auto_140049 ) ) ( not ( = ?auto_140048 ?auto_140051 ) ) ( not ( = ?auto_140049 ?auto_140051 ) ) ( not ( = ?auto_140048 ?auto_140052 ) ) ( not ( = ?auto_140048 ?auto_140050 ) ) ( not ( = ?auto_140049 ?auto_140052 ) ) ( not ( = ?auto_140049 ?auto_140050 ) ) ( not ( = ?auto_140051 ?auto_140052 ) ) ( not ( = ?auto_140051 ?auto_140050 ) ) ( not ( = ?auto_140052 ?auto_140050 ) ) ( ON ?auto_140052 ?auto_140051 ) ( CLEAR ?auto_140052 ) ( HOLDING ?auto_140050 ) ( CLEAR ?auto_140055 ) ( ON-TABLE ?auto_140053 ) ( ON ?auto_140054 ?auto_140053 ) ( ON ?auto_140055 ?auto_140054 ) ( not ( = ?auto_140053 ?auto_140054 ) ) ( not ( = ?auto_140053 ?auto_140055 ) ) ( not ( = ?auto_140053 ?auto_140050 ) ) ( not ( = ?auto_140054 ?auto_140055 ) ) ( not ( = ?auto_140054 ?auto_140050 ) ) ( not ( = ?auto_140055 ?auto_140050 ) ) ( not ( = ?auto_140048 ?auto_140055 ) ) ( not ( = ?auto_140048 ?auto_140053 ) ) ( not ( = ?auto_140048 ?auto_140054 ) ) ( not ( = ?auto_140049 ?auto_140055 ) ) ( not ( = ?auto_140049 ?auto_140053 ) ) ( not ( = ?auto_140049 ?auto_140054 ) ) ( not ( = ?auto_140051 ?auto_140055 ) ) ( not ( = ?auto_140051 ?auto_140053 ) ) ( not ( = ?auto_140051 ?auto_140054 ) ) ( not ( = ?auto_140052 ?auto_140055 ) ) ( not ( = ?auto_140052 ?auto_140053 ) ) ( not ( = ?auto_140052 ?auto_140054 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140053 ?auto_140054 ?auto_140055 ?auto_140050 )
      ( MAKE-2PILE ?auto_140048 ?auto_140049 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140056 - BLOCK
      ?auto_140057 - BLOCK
    )
    :vars
    (
      ?auto_140060 - BLOCK
      ?auto_140058 - BLOCK
      ?auto_140059 - BLOCK
      ?auto_140062 - BLOCK
      ?auto_140063 - BLOCK
      ?auto_140061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140060 ?auto_140057 ) ( ON-TABLE ?auto_140056 ) ( ON ?auto_140057 ?auto_140056 ) ( not ( = ?auto_140056 ?auto_140057 ) ) ( not ( = ?auto_140056 ?auto_140060 ) ) ( not ( = ?auto_140057 ?auto_140060 ) ) ( not ( = ?auto_140056 ?auto_140058 ) ) ( not ( = ?auto_140056 ?auto_140059 ) ) ( not ( = ?auto_140057 ?auto_140058 ) ) ( not ( = ?auto_140057 ?auto_140059 ) ) ( not ( = ?auto_140060 ?auto_140058 ) ) ( not ( = ?auto_140060 ?auto_140059 ) ) ( not ( = ?auto_140058 ?auto_140059 ) ) ( ON ?auto_140058 ?auto_140060 ) ( CLEAR ?auto_140062 ) ( ON-TABLE ?auto_140063 ) ( ON ?auto_140061 ?auto_140063 ) ( ON ?auto_140062 ?auto_140061 ) ( not ( = ?auto_140063 ?auto_140061 ) ) ( not ( = ?auto_140063 ?auto_140062 ) ) ( not ( = ?auto_140063 ?auto_140059 ) ) ( not ( = ?auto_140061 ?auto_140062 ) ) ( not ( = ?auto_140061 ?auto_140059 ) ) ( not ( = ?auto_140062 ?auto_140059 ) ) ( not ( = ?auto_140056 ?auto_140062 ) ) ( not ( = ?auto_140056 ?auto_140063 ) ) ( not ( = ?auto_140056 ?auto_140061 ) ) ( not ( = ?auto_140057 ?auto_140062 ) ) ( not ( = ?auto_140057 ?auto_140063 ) ) ( not ( = ?auto_140057 ?auto_140061 ) ) ( not ( = ?auto_140060 ?auto_140062 ) ) ( not ( = ?auto_140060 ?auto_140063 ) ) ( not ( = ?auto_140060 ?auto_140061 ) ) ( not ( = ?auto_140058 ?auto_140062 ) ) ( not ( = ?auto_140058 ?auto_140063 ) ) ( not ( = ?auto_140058 ?auto_140061 ) ) ( ON ?auto_140059 ?auto_140058 ) ( CLEAR ?auto_140059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140056 ?auto_140057 ?auto_140060 ?auto_140058 )
      ( MAKE-2PILE ?auto_140056 ?auto_140057 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140064 - BLOCK
      ?auto_140065 - BLOCK
    )
    :vars
    (
      ?auto_140068 - BLOCK
      ?auto_140066 - BLOCK
      ?auto_140071 - BLOCK
      ?auto_140067 - BLOCK
      ?auto_140069 - BLOCK
      ?auto_140070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140068 ?auto_140065 ) ( ON-TABLE ?auto_140064 ) ( ON ?auto_140065 ?auto_140064 ) ( not ( = ?auto_140064 ?auto_140065 ) ) ( not ( = ?auto_140064 ?auto_140068 ) ) ( not ( = ?auto_140065 ?auto_140068 ) ) ( not ( = ?auto_140064 ?auto_140066 ) ) ( not ( = ?auto_140064 ?auto_140071 ) ) ( not ( = ?auto_140065 ?auto_140066 ) ) ( not ( = ?auto_140065 ?auto_140071 ) ) ( not ( = ?auto_140068 ?auto_140066 ) ) ( not ( = ?auto_140068 ?auto_140071 ) ) ( not ( = ?auto_140066 ?auto_140071 ) ) ( ON ?auto_140066 ?auto_140068 ) ( ON-TABLE ?auto_140067 ) ( ON ?auto_140069 ?auto_140067 ) ( not ( = ?auto_140067 ?auto_140069 ) ) ( not ( = ?auto_140067 ?auto_140070 ) ) ( not ( = ?auto_140067 ?auto_140071 ) ) ( not ( = ?auto_140069 ?auto_140070 ) ) ( not ( = ?auto_140069 ?auto_140071 ) ) ( not ( = ?auto_140070 ?auto_140071 ) ) ( not ( = ?auto_140064 ?auto_140070 ) ) ( not ( = ?auto_140064 ?auto_140067 ) ) ( not ( = ?auto_140064 ?auto_140069 ) ) ( not ( = ?auto_140065 ?auto_140070 ) ) ( not ( = ?auto_140065 ?auto_140067 ) ) ( not ( = ?auto_140065 ?auto_140069 ) ) ( not ( = ?auto_140068 ?auto_140070 ) ) ( not ( = ?auto_140068 ?auto_140067 ) ) ( not ( = ?auto_140068 ?auto_140069 ) ) ( not ( = ?auto_140066 ?auto_140070 ) ) ( not ( = ?auto_140066 ?auto_140067 ) ) ( not ( = ?auto_140066 ?auto_140069 ) ) ( ON ?auto_140071 ?auto_140066 ) ( CLEAR ?auto_140071 ) ( HOLDING ?auto_140070 ) ( CLEAR ?auto_140069 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140067 ?auto_140069 ?auto_140070 )
      ( MAKE-2PILE ?auto_140064 ?auto_140065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140072 - BLOCK
      ?auto_140073 - BLOCK
    )
    :vars
    (
      ?auto_140077 - BLOCK
      ?auto_140079 - BLOCK
      ?auto_140078 - BLOCK
      ?auto_140074 - BLOCK
      ?auto_140076 - BLOCK
      ?auto_140075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140077 ?auto_140073 ) ( ON-TABLE ?auto_140072 ) ( ON ?auto_140073 ?auto_140072 ) ( not ( = ?auto_140072 ?auto_140073 ) ) ( not ( = ?auto_140072 ?auto_140077 ) ) ( not ( = ?auto_140073 ?auto_140077 ) ) ( not ( = ?auto_140072 ?auto_140079 ) ) ( not ( = ?auto_140072 ?auto_140078 ) ) ( not ( = ?auto_140073 ?auto_140079 ) ) ( not ( = ?auto_140073 ?auto_140078 ) ) ( not ( = ?auto_140077 ?auto_140079 ) ) ( not ( = ?auto_140077 ?auto_140078 ) ) ( not ( = ?auto_140079 ?auto_140078 ) ) ( ON ?auto_140079 ?auto_140077 ) ( ON-TABLE ?auto_140074 ) ( ON ?auto_140076 ?auto_140074 ) ( not ( = ?auto_140074 ?auto_140076 ) ) ( not ( = ?auto_140074 ?auto_140075 ) ) ( not ( = ?auto_140074 ?auto_140078 ) ) ( not ( = ?auto_140076 ?auto_140075 ) ) ( not ( = ?auto_140076 ?auto_140078 ) ) ( not ( = ?auto_140075 ?auto_140078 ) ) ( not ( = ?auto_140072 ?auto_140075 ) ) ( not ( = ?auto_140072 ?auto_140074 ) ) ( not ( = ?auto_140072 ?auto_140076 ) ) ( not ( = ?auto_140073 ?auto_140075 ) ) ( not ( = ?auto_140073 ?auto_140074 ) ) ( not ( = ?auto_140073 ?auto_140076 ) ) ( not ( = ?auto_140077 ?auto_140075 ) ) ( not ( = ?auto_140077 ?auto_140074 ) ) ( not ( = ?auto_140077 ?auto_140076 ) ) ( not ( = ?auto_140079 ?auto_140075 ) ) ( not ( = ?auto_140079 ?auto_140074 ) ) ( not ( = ?auto_140079 ?auto_140076 ) ) ( ON ?auto_140078 ?auto_140079 ) ( CLEAR ?auto_140076 ) ( ON ?auto_140075 ?auto_140078 ) ( CLEAR ?auto_140075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140072 ?auto_140073 ?auto_140077 ?auto_140079 ?auto_140078 )
      ( MAKE-2PILE ?auto_140072 ?auto_140073 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140080 - BLOCK
      ?auto_140081 - BLOCK
    )
    :vars
    (
      ?auto_140085 - BLOCK
      ?auto_140083 - BLOCK
      ?auto_140084 - BLOCK
      ?auto_140082 - BLOCK
      ?auto_140086 - BLOCK
      ?auto_140087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140085 ?auto_140081 ) ( ON-TABLE ?auto_140080 ) ( ON ?auto_140081 ?auto_140080 ) ( not ( = ?auto_140080 ?auto_140081 ) ) ( not ( = ?auto_140080 ?auto_140085 ) ) ( not ( = ?auto_140081 ?auto_140085 ) ) ( not ( = ?auto_140080 ?auto_140083 ) ) ( not ( = ?auto_140080 ?auto_140084 ) ) ( not ( = ?auto_140081 ?auto_140083 ) ) ( not ( = ?auto_140081 ?auto_140084 ) ) ( not ( = ?auto_140085 ?auto_140083 ) ) ( not ( = ?auto_140085 ?auto_140084 ) ) ( not ( = ?auto_140083 ?auto_140084 ) ) ( ON ?auto_140083 ?auto_140085 ) ( ON-TABLE ?auto_140082 ) ( not ( = ?auto_140082 ?auto_140086 ) ) ( not ( = ?auto_140082 ?auto_140087 ) ) ( not ( = ?auto_140082 ?auto_140084 ) ) ( not ( = ?auto_140086 ?auto_140087 ) ) ( not ( = ?auto_140086 ?auto_140084 ) ) ( not ( = ?auto_140087 ?auto_140084 ) ) ( not ( = ?auto_140080 ?auto_140087 ) ) ( not ( = ?auto_140080 ?auto_140082 ) ) ( not ( = ?auto_140080 ?auto_140086 ) ) ( not ( = ?auto_140081 ?auto_140087 ) ) ( not ( = ?auto_140081 ?auto_140082 ) ) ( not ( = ?auto_140081 ?auto_140086 ) ) ( not ( = ?auto_140085 ?auto_140087 ) ) ( not ( = ?auto_140085 ?auto_140082 ) ) ( not ( = ?auto_140085 ?auto_140086 ) ) ( not ( = ?auto_140083 ?auto_140087 ) ) ( not ( = ?auto_140083 ?auto_140082 ) ) ( not ( = ?auto_140083 ?auto_140086 ) ) ( ON ?auto_140084 ?auto_140083 ) ( ON ?auto_140087 ?auto_140084 ) ( CLEAR ?auto_140087 ) ( HOLDING ?auto_140086 ) ( CLEAR ?auto_140082 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140082 ?auto_140086 )
      ( MAKE-2PILE ?auto_140080 ?auto_140081 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140088 - BLOCK
      ?auto_140089 - BLOCK
    )
    :vars
    (
      ?auto_140092 - BLOCK
      ?auto_140090 - BLOCK
      ?auto_140094 - BLOCK
      ?auto_140095 - BLOCK
      ?auto_140093 - BLOCK
      ?auto_140091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140092 ?auto_140089 ) ( ON-TABLE ?auto_140088 ) ( ON ?auto_140089 ?auto_140088 ) ( not ( = ?auto_140088 ?auto_140089 ) ) ( not ( = ?auto_140088 ?auto_140092 ) ) ( not ( = ?auto_140089 ?auto_140092 ) ) ( not ( = ?auto_140088 ?auto_140090 ) ) ( not ( = ?auto_140088 ?auto_140094 ) ) ( not ( = ?auto_140089 ?auto_140090 ) ) ( not ( = ?auto_140089 ?auto_140094 ) ) ( not ( = ?auto_140092 ?auto_140090 ) ) ( not ( = ?auto_140092 ?auto_140094 ) ) ( not ( = ?auto_140090 ?auto_140094 ) ) ( ON ?auto_140090 ?auto_140092 ) ( ON-TABLE ?auto_140095 ) ( not ( = ?auto_140095 ?auto_140093 ) ) ( not ( = ?auto_140095 ?auto_140091 ) ) ( not ( = ?auto_140095 ?auto_140094 ) ) ( not ( = ?auto_140093 ?auto_140091 ) ) ( not ( = ?auto_140093 ?auto_140094 ) ) ( not ( = ?auto_140091 ?auto_140094 ) ) ( not ( = ?auto_140088 ?auto_140091 ) ) ( not ( = ?auto_140088 ?auto_140095 ) ) ( not ( = ?auto_140088 ?auto_140093 ) ) ( not ( = ?auto_140089 ?auto_140091 ) ) ( not ( = ?auto_140089 ?auto_140095 ) ) ( not ( = ?auto_140089 ?auto_140093 ) ) ( not ( = ?auto_140092 ?auto_140091 ) ) ( not ( = ?auto_140092 ?auto_140095 ) ) ( not ( = ?auto_140092 ?auto_140093 ) ) ( not ( = ?auto_140090 ?auto_140091 ) ) ( not ( = ?auto_140090 ?auto_140095 ) ) ( not ( = ?auto_140090 ?auto_140093 ) ) ( ON ?auto_140094 ?auto_140090 ) ( ON ?auto_140091 ?auto_140094 ) ( CLEAR ?auto_140095 ) ( ON ?auto_140093 ?auto_140091 ) ( CLEAR ?auto_140093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140088 ?auto_140089 ?auto_140092 ?auto_140090 ?auto_140094 ?auto_140091 )
      ( MAKE-2PILE ?auto_140088 ?auto_140089 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140096 - BLOCK
      ?auto_140097 - BLOCK
    )
    :vars
    (
      ?auto_140103 - BLOCK
      ?auto_140100 - BLOCK
      ?auto_140098 - BLOCK
      ?auto_140099 - BLOCK
      ?auto_140101 - BLOCK
      ?auto_140102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140103 ?auto_140097 ) ( ON-TABLE ?auto_140096 ) ( ON ?auto_140097 ?auto_140096 ) ( not ( = ?auto_140096 ?auto_140097 ) ) ( not ( = ?auto_140096 ?auto_140103 ) ) ( not ( = ?auto_140097 ?auto_140103 ) ) ( not ( = ?auto_140096 ?auto_140100 ) ) ( not ( = ?auto_140096 ?auto_140098 ) ) ( not ( = ?auto_140097 ?auto_140100 ) ) ( not ( = ?auto_140097 ?auto_140098 ) ) ( not ( = ?auto_140103 ?auto_140100 ) ) ( not ( = ?auto_140103 ?auto_140098 ) ) ( not ( = ?auto_140100 ?auto_140098 ) ) ( ON ?auto_140100 ?auto_140103 ) ( not ( = ?auto_140099 ?auto_140101 ) ) ( not ( = ?auto_140099 ?auto_140102 ) ) ( not ( = ?auto_140099 ?auto_140098 ) ) ( not ( = ?auto_140101 ?auto_140102 ) ) ( not ( = ?auto_140101 ?auto_140098 ) ) ( not ( = ?auto_140102 ?auto_140098 ) ) ( not ( = ?auto_140096 ?auto_140102 ) ) ( not ( = ?auto_140096 ?auto_140099 ) ) ( not ( = ?auto_140096 ?auto_140101 ) ) ( not ( = ?auto_140097 ?auto_140102 ) ) ( not ( = ?auto_140097 ?auto_140099 ) ) ( not ( = ?auto_140097 ?auto_140101 ) ) ( not ( = ?auto_140103 ?auto_140102 ) ) ( not ( = ?auto_140103 ?auto_140099 ) ) ( not ( = ?auto_140103 ?auto_140101 ) ) ( not ( = ?auto_140100 ?auto_140102 ) ) ( not ( = ?auto_140100 ?auto_140099 ) ) ( not ( = ?auto_140100 ?auto_140101 ) ) ( ON ?auto_140098 ?auto_140100 ) ( ON ?auto_140102 ?auto_140098 ) ( ON ?auto_140101 ?auto_140102 ) ( CLEAR ?auto_140101 ) ( HOLDING ?auto_140099 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140099 )
      ( MAKE-2PILE ?auto_140096 ?auto_140097 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140104 - BLOCK
      ?auto_140105 - BLOCK
    )
    :vars
    (
      ?auto_140109 - BLOCK
      ?auto_140110 - BLOCK
      ?auto_140107 - BLOCK
      ?auto_140111 - BLOCK
      ?auto_140106 - BLOCK
      ?auto_140108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140109 ?auto_140105 ) ( ON-TABLE ?auto_140104 ) ( ON ?auto_140105 ?auto_140104 ) ( not ( = ?auto_140104 ?auto_140105 ) ) ( not ( = ?auto_140104 ?auto_140109 ) ) ( not ( = ?auto_140105 ?auto_140109 ) ) ( not ( = ?auto_140104 ?auto_140110 ) ) ( not ( = ?auto_140104 ?auto_140107 ) ) ( not ( = ?auto_140105 ?auto_140110 ) ) ( not ( = ?auto_140105 ?auto_140107 ) ) ( not ( = ?auto_140109 ?auto_140110 ) ) ( not ( = ?auto_140109 ?auto_140107 ) ) ( not ( = ?auto_140110 ?auto_140107 ) ) ( ON ?auto_140110 ?auto_140109 ) ( not ( = ?auto_140111 ?auto_140106 ) ) ( not ( = ?auto_140111 ?auto_140108 ) ) ( not ( = ?auto_140111 ?auto_140107 ) ) ( not ( = ?auto_140106 ?auto_140108 ) ) ( not ( = ?auto_140106 ?auto_140107 ) ) ( not ( = ?auto_140108 ?auto_140107 ) ) ( not ( = ?auto_140104 ?auto_140108 ) ) ( not ( = ?auto_140104 ?auto_140111 ) ) ( not ( = ?auto_140104 ?auto_140106 ) ) ( not ( = ?auto_140105 ?auto_140108 ) ) ( not ( = ?auto_140105 ?auto_140111 ) ) ( not ( = ?auto_140105 ?auto_140106 ) ) ( not ( = ?auto_140109 ?auto_140108 ) ) ( not ( = ?auto_140109 ?auto_140111 ) ) ( not ( = ?auto_140109 ?auto_140106 ) ) ( not ( = ?auto_140110 ?auto_140108 ) ) ( not ( = ?auto_140110 ?auto_140111 ) ) ( not ( = ?auto_140110 ?auto_140106 ) ) ( ON ?auto_140107 ?auto_140110 ) ( ON ?auto_140108 ?auto_140107 ) ( ON ?auto_140106 ?auto_140108 ) ( ON ?auto_140111 ?auto_140106 ) ( CLEAR ?auto_140111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140104 ?auto_140105 ?auto_140109 ?auto_140110 ?auto_140107 ?auto_140108 ?auto_140106 )
      ( MAKE-2PILE ?auto_140104 ?auto_140105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140112 - BLOCK
      ?auto_140113 - BLOCK
    )
    :vars
    (
      ?auto_140115 - BLOCK
      ?auto_140118 - BLOCK
      ?auto_140117 - BLOCK
      ?auto_140114 - BLOCK
      ?auto_140119 - BLOCK
      ?auto_140116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140115 ?auto_140113 ) ( ON-TABLE ?auto_140112 ) ( ON ?auto_140113 ?auto_140112 ) ( not ( = ?auto_140112 ?auto_140113 ) ) ( not ( = ?auto_140112 ?auto_140115 ) ) ( not ( = ?auto_140113 ?auto_140115 ) ) ( not ( = ?auto_140112 ?auto_140118 ) ) ( not ( = ?auto_140112 ?auto_140117 ) ) ( not ( = ?auto_140113 ?auto_140118 ) ) ( not ( = ?auto_140113 ?auto_140117 ) ) ( not ( = ?auto_140115 ?auto_140118 ) ) ( not ( = ?auto_140115 ?auto_140117 ) ) ( not ( = ?auto_140118 ?auto_140117 ) ) ( ON ?auto_140118 ?auto_140115 ) ( not ( = ?auto_140114 ?auto_140119 ) ) ( not ( = ?auto_140114 ?auto_140116 ) ) ( not ( = ?auto_140114 ?auto_140117 ) ) ( not ( = ?auto_140119 ?auto_140116 ) ) ( not ( = ?auto_140119 ?auto_140117 ) ) ( not ( = ?auto_140116 ?auto_140117 ) ) ( not ( = ?auto_140112 ?auto_140116 ) ) ( not ( = ?auto_140112 ?auto_140114 ) ) ( not ( = ?auto_140112 ?auto_140119 ) ) ( not ( = ?auto_140113 ?auto_140116 ) ) ( not ( = ?auto_140113 ?auto_140114 ) ) ( not ( = ?auto_140113 ?auto_140119 ) ) ( not ( = ?auto_140115 ?auto_140116 ) ) ( not ( = ?auto_140115 ?auto_140114 ) ) ( not ( = ?auto_140115 ?auto_140119 ) ) ( not ( = ?auto_140118 ?auto_140116 ) ) ( not ( = ?auto_140118 ?auto_140114 ) ) ( not ( = ?auto_140118 ?auto_140119 ) ) ( ON ?auto_140117 ?auto_140118 ) ( ON ?auto_140116 ?auto_140117 ) ( ON ?auto_140119 ?auto_140116 ) ( HOLDING ?auto_140114 ) ( CLEAR ?auto_140119 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140112 ?auto_140113 ?auto_140115 ?auto_140118 ?auto_140117 ?auto_140116 ?auto_140119 ?auto_140114 )
      ( MAKE-2PILE ?auto_140112 ?auto_140113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140120 - BLOCK
      ?auto_140121 - BLOCK
    )
    :vars
    (
      ?auto_140126 - BLOCK
      ?auto_140125 - BLOCK
      ?auto_140123 - BLOCK
      ?auto_140127 - BLOCK
      ?auto_140122 - BLOCK
      ?auto_140124 - BLOCK
      ?auto_140128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140126 ?auto_140121 ) ( ON-TABLE ?auto_140120 ) ( ON ?auto_140121 ?auto_140120 ) ( not ( = ?auto_140120 ?auto_140121 ) ) ( not ( = ?auto_140120 ?auto_140126 ) ) ( not ( = ?auto_140121 ?auto_140126 ) ) ( not ( = ?auto_140120 ?auto_140125 ) ) ( not ( = ?auto_140120 ?auto_140123 ) ) ( not ( = ?auto_140121 ?auto_140125 ) ) ( not ( = ?auto_140121 ?auto_140123 ) ) ( not ( = ?auto_140126 ?auto_140125 ) ) ( not ( = ?auto_140126 ?auto_140123 ) ) ( not ( = ?auto_140125 ?auto_140123 ) ) ( ON ?auto_140125 ?auto_140126 ) ( not ( = ?auto_140127 ?auto_140122 ) ) ( not ( = ?auto_140127 ?auto_140124 ) ) ( not ( = ?auto_140127 ?auto_140123 ) ) ( not ( = ?auto_140122 ?auto_140124 ) ) ( not ( = ?auto_140122 ?auto_140123 ) ) ( not ( = ?auto_140124 ?auto_140123 ) ) ( not ( = ?auto_140120 ?auto_140124 ) ) ( not ( = ?auto_140120 ?auto_140127 ) ) ( not ( = ?auto_140120 ?auto_140122 ) ) ( not ( = ?auto_140121 ?auto_140124 ) ) ( not ( = ?auto_140121 ?auto_140127 ) ) ( not ( = ?auto_140121 ?auto_140122 ) ) ( not ( = ?auto_140126 ?auto_140124 ) ) ( not ( = ?auto_140126 ?auto_140127 ) ) ( not ( = ?auto_140126 ?auto_140122 ) ) ( not ( = ?auto_140125 ?auto_140124 ) ) ( not ( = ?auto_140125 ?auto_140127 ) ) ( not ( = ?auto_140125 ?auto_140122 ) ) ( ON ?auto_140123 ?auto_140125 ) ( ON ?auto_140124 ?auto_140123 ) ( ON ?auto_140122 ?auto_140124 ) ( CLEAR ?auto_140122 ) ( ON ?auto_140127 ?auto_140128 ) ( CLEAR ?auto_140127 ) ( HAND-EMPTY ) ( not ( = ?auto_140120 ?auto_140128 ) ) ( not ( = ?auto_140121 ?auto_140128 ) ) ( not ( = ?auto_140126 ?auto_140128 ) ) ( not ( = ?auto_140125 ?auto_140128 ) ) ( not ( = ?auto_140123 ?auto_140128 ) ) ( not ( = ?auto_140127 ?auto_140128 ) ) ( not ( = ?auto_140122 ?auto_140128 ) ) ( not ( = ?auto_140124 ?auto_140128 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140127 ?auto_140128 )
      ( MAKE-2PILE ?auto_140120 ?auto_140121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140129 - BLOCK
      ?auto_140130 - BLOCK
    )
    :vars
    (
      ?auto_140135 - BLOCK
      ?auto_140137 - BLOCK
      ?auto_140134 - BLOCK
      ?auto_140133 - BLOCK
      ?auto_140131 - BLOCK
      ?auto_140132 - BLOCK
      ?auto_140136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140135 ?auto_140130 ) ( ON-TABLE ?auto_140129 ) ( ON ?auto_140130 ?auto_140129 ) ( not ( = ?auto_140129 ?auto_140130 ) ) ( not ( = ?auto_140129 ?auto_140135 ) ) ( not ( = ?auto_140130 ?auto_140135 ) ) ( not ( = ?auto_140129 ?auto_140137 ) ) ( not ( = ?auto_140129 ?auto_140134 ) ) ( not ( = ?auto_140130 ?auto_140137 ) ) ( not ( = ?auto_140130 ?auto_140134 ) ) ( not ( = ?auto_140135 ?auto_140137 ) ) ( not ( = ?auto_140135 ?auto_140134 ) ) ( not ( = ?auto_140137 ?auto_140134 ) ) ( ON ?auto_140137 ?auto_140135 ) ( not ( = ?auto_140133 ?auto_140131 ) ) ( not ( = ?auto_140133 ?auto_140132 ) ) ( not ( = ?auto_140133 ?auto_140134 ) ) ( not ( = ?auto_140131 ?auto_140132 ) ) ( not ( = ?auto_140131 ?auto_140134 ) ) ( not ( = ?auto_140132 ?auto_140134 ) ) ( not ( = ?auto_140129 ?auto_140132 ) ) ( not ( = ?auto_140129 ?auto_140133 ) ) ( not ( = ?auto_140129 ?auto_140131 ) ) ( not ( = ?auto_140130 ?auto_140132 ) ) ( not ( = ?auto_140130 ?auto_140133 ) ) ( not ( = ?auto_140130 ?auto_140131 ) ) ( not ( = ?auto_140135 ?auto_140132 ) ) ( not ( = ?auto_140135 ?auto_140133 ) ) ( not ( = ?auto_140135 ?auto_140131 ) ) ( not ( = ?auto_140137 ?auto_140132 ) ) ( not ( = ?auto_140137 ?auto_140133 ) ) ( not ( = ?auto_140137 ?auto_140131 ) ) ( ON ?auto_140134 ?auto_140137 ) ( ON ?auto_140132 ?auto_140134 ) ( ON ?auto_140133 ?auto_140136 ) ( CLEAR ?auto_140133 ) ( not ( = ?auto_140129 ?auto_140136 ) ) ( not ( = ?auto_140130 ?auto_140136 ) ) ( not ( = ?auto_140135 ?auto_140136 ) ) ( not ( = ?auto_140137 ?auto_140136 ) ) ( not ( = ?auto_140134 ?auto_140136 ) ) ( not ( = ?auto_140133 ?auto_140136 ) ) ( not ( = ?auto_140131 ?auto_140136 ) ) ( not ( = ?auto_140132 ?auto_140136 ) ) ( HOLDING ?auto_140131 ) ( CLEAR ?auto_140132 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140129 ?auto_140130 ?auto_140135 ?auto_140137 ?auto_140134 ?auto_140132 ?auto_140131 )
      ( MAKE-2PILE ?auto_140129 ?auto_140130 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140138 - BLOCK
      ?auto_140139 - BLOCK
    )
    :vars
    (
      ?auto_140142 - BLOCK
      ?auto_140140 - BLOCK
      ?auto_140145 - BLOCK
      ?auto_140146 - BLOCK
      ?auto_140143 - BLOCK
      ?auto_140141 - BLOCK
      ?auto_140144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140142 ?auto_140139 ) ( ON-TABLE ?auto_140138 ) ( ON ?auto_140139 ?auto_140138 ) ( not ( = ?auto_140138 ?auto_140139 ) ) ( not ( = ?auto_140138 ?auto_140142 ) ) ( not ( = ?auto_140139 ?auto_140142 ) ) ( not ( = ?auto_140138 ?auto_140140 ) ) ( not ( = ?auto_140138 ?auto_140145 ) ) ( not ( = ?auto_140139 ?auto_140140 ) ) ( not ( = ?auto_140139 ?auto_140145 ) ) ( not ( = ?auto_140142 ?auto_140140 ) ) ( not ( = ?auto_140142 ?auto_140145 ) ) ( not ( = ?auto_140140 ?auto_140145 ) ) ( ON ?auto_140140 ?auto_140142 ) ( not ( = ?auto_140146 ?auto_140143 ) ) ( not ( = ?auto_140146 ?auto_140141 ) ) ( not ( = ?auto_140146 ?auto_140145 ) ) ( not ( = ?auto_140143 ?auto_140141 ) ) ( not ( = ?auto_140143 ?auto_140145 ) ) ( not ( = ?auto_140141 ?auto_140145 ) ) ( not ( = ?auto_140138 ?auto_140141 ) ) ( not ( = ?auto_140138 ?auto_140146 ) ) ( not ( = ?auto_140138 ?auto_140143 ) ) ( not ( = ?auto_140139 ?auto_140141 ) ) ( not ( = ?auto_140139 ?auto_140146 ) ) ( not ( = ?auto_140139 ?auto_140143 ) ) ( not ( = ?auto_140142 ?auto_140141 ) ) ( not ( = ?auto_140142 ?auto_140146 ) ) ( not ( = ?auto_140142 ?auto_140143 ) ) ( not ( = ?auto_140140 ?auto_140141 ) ) ( not ( = ?auto_140140 ?auto_140146 ) ) ( not ( = ?auto_140140 ?auto_140143 ) ) ( ON ?auto_140145 ?auto_140140 ) ( ON ?auto_140141 ?auto_140145 ) ( ON ?auto_140146 ?auto_140144 ) ( not ( = ?auto_140138 ?auto_140144 ) ) ( not ( = ?auto_140139 ?auto_140144 ) ) ( not ( = ?auto_140142 ?auto_140144 ) ) ( not ( = ?auto_140140 ?auto_140144 ) ) ( not ( = ?auto_140145 ?auto_140144 ) ) ( not ( = ?auto_140146 ?auto_140144 ) ) ( not ( = ?auto_140143 ?auto_140144 ) ) ( not ( = ?auto_140141 ?auto_140144 ) ) ( CLEAR ?auto_140141 ) ( ON ?auto_140143 ?auto_140146 ) ( CLEAR ?auto_140143 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140144 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140144 ?auto_140146 )
      ( MAKE-2PILE ?auto_140138 ?auto_140139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140147 - BLOCK
      ?auto_140148 - BLOCK
    )
    :vars
    (
      ?auto_140150 - BLOCK
      ?auto_140149 - BLOCK
      ?auto_140153 - BLOCK
      ?auto_140151 - BLOCK
      ?auto_140155 - BLOCK
      ?auto_140154 - BLOCK
      ?auto_140152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140150 ?auto_140148 ) ( ON-TABLE ?auto_140147 ) ( ON ?auto_140148 ?auto_140147 ) ( not ( = ?auto_140147 ?auto_140148 ) ) ( not ( = ?auto_140147 ?auto_140150 ) ) ( not ( = ?auto_140148 ?auto_140150 ) ) ( not ( = ?auto_140147 ?auto_140149 ) ) ( not ( = ?auto_140147 ?auto_140153 ) ) ( not ( = ?auto_140148 ?auto_140149 ) ) ( not ( = ?auto_140148 ?auto_140153 ) ) ( not ( = ?auto_140150 ?auto_140149 ) ) ( not ( = ?auto_140150 ?auto_140153 ) ) ( not ( = ?auto_140149 ?auto_140153 ) ) ( ON ?auto_140149 ?auto_140150 ) ( not ( = ?auto_140151 ?auto_140155 ) ) ( not ( = ?auto_140151 ?auto_140154 ) ) ( not ( = ?auto_140151 ?auto_140153 ) ) ( not ( = ?auto_140155 ?auto_140154 ) ) ( not ( = ?auto_140155 ?auto_140153 ) ) ( not ( = ?auto_140154 ?auto_140153 ) ) ( not ( = ?auto_140147 ?auto_140154 ) ) ( not ( = ?auto_140147 ?auto_140151 ) ) ( not ( = ?auto_140147 ?auto_140155 ) ) ( not ( = ?auto_140148 ?auto_140154 ) ) ( not ( = ?auto_140148 ?auto_140151 ) ) ( not ( = ?auto_140148 ?auto_140155 ) ) ( not ( = ?auto_140150 ?auto_140154 ) ) ( not ( = ?auto_140150 ?auto_140151 ) ) ( not ( = ?auto_140150 ?auto_140155 ) ) ( not ( = ?auto_140149 ?auto_140154 ) ) ( not ( = ?auto_140149 ?auto_140151 ) ) ( not ( = ?auto_140149 ?auto_140155 ) ) ( ON ?auto_140153 ?auto_140149 ) ( ON ?auto_140151 ?auto_140152 ) ( not ( = ?auto_140147 ?auto_140152 ) ) ( not ( = ?auto_140148 ?auto_140152 ) ) ( not ( = ?auto_140150 ?auto_140152 ) ) ( not ( = ?auto_140149 ?auto_140152 ) ) ( not ( = ?auto_140153 ?auto_140152 ) ) ( not ( = ?auto_140151 ?auto_140152 ) ) ( not ( = ?auto_140155 ?auto_140152 ) ) ( not ( = ?auto_140154 ?auto_140152 ) ) ( ON ?auto_140155 ?auto_140151 ) ( CLEAR ?auto_140155 ) ( ON-TABLE ?auto_140152 ) ( HOLDING ?auto_140154 ) ( CLEAR ?auto_140153 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140147 ?auto_140148 ?auto_140150 ?auto_140149 ?auto_140153 ?auto_140154 )
      ( MAKE-2PILE ?auto_140147 ?auto_140148 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140156 - BLOCK
      ?auto_140157 - BLOCK
    )
    :vars
    (
      ?auto_140164 - BLOCK
      ?auto_140163 - BLOCK
      ?auto_140161 - BLOCK
      ?auto_140162 - BLOCK
      ?auto_140160 - BLOCK
      ?auto_140159 - BLOCK
      ?auto_140158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140164 ?auto_140157 ) ( ON-TABLE ?auto_140156 ) ( ON ?auto_140157 ?auto_140156 ) ( not ( = ?auto_140156 ?auto_140157 ) ) ( not ( = ?auto_140156 ?auto_140164 ) ) ( not ( = ?auto_140157 ?auto_140164 ) ) ( not ( = ?auto_140156 ?auto_140163 ) ) ( not ( = ?auto_140156 ?auto_140161 ) ) ( not ( = ?auto_140157 ?auto_140163 ) ) ( not ( = ?auto_140157 ?auto_140161 ) ) ( not ( = ?auto_140164 ?auto_140163 ) ) ( not ( = ?auto_140164 ?auto_140161 ) ) ( not ( = ?auto_140163 ?auto_140161 ) ) ( ON ?auto_140163 ?auto_140164 ) ( not ( = ?auto_140162 ?auto_140160 ) ) ( not ( = ?auto_140162 ?auto_140159 ) ) ( not ( = ?auto_140162 ?auto_140161 ) ) ( not ( = ?auto_140160 ?auto_140159 ) ) ( not ( = ?auto_140160 ?auto_140161 ) ) ( not ( = ?auto_140159 ?auto_140161 ) ) ( not ( = ?auto_140156 ?auto_140159 ) ) ( not ( = ?auto_140156 ?auto_140162 ) ) ( not ( = ?auto_140156 ?auto_140160 ) ) ( not ( = ?auto_140157 ?auto_140159 ) ) ( not ( = ?auto_140157 ?auto_140162 ) ) ( not ( = ?auto_140157 ?auto_140160 ) ) ( not ( = ?auto_140164 ?auto_140159 ) ) ( not ( = ?auto_140164 ?auto_140162 ) ) ( not ( = ?auto_140164 ?auto_140160 ) ) ( not ( = ?auto_140163 ?auto_140159 ) ) ( not ( = ?auto_140163 ?auto_140162 ) ) ( not ( = ?auto_140163 ?auto_140160 ) ) ( ON ?auto_140161 ?auto_140163 ) ( ON ?auto_140162 ?auto_140158 ) ( not ( = ?auto_140156 ?auto_140158 ) ) ( not ( = ?auto_140157 ?auto_140158 ) ) ( not ( = ?auto_140164 ?auto_140158 ) ) ( not ( = ?auto_140163 ?auto_140158 ) ) ( not ( = ?auto_140161 ?auto_140158 ) ) ( not ( = ?auto_140162 ?auto_140158 ) ) ( not ( = ?auto_140160 ?auto_140158 ) ) ( not ( = ?auto_140159 ?auto_140158 ) ) ( ON ?auto_140160 ?auto_140162 ) ( ON-TABLE ?auto_140158 ) ( CLEAR ?auto_140161 ) ( ON ?auto_140159 ?auto_140160 ) ( CLEAR ?auto_140159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140158 ?auto_140162 ?auto_140160 )
      ( MAKE-2PILE ?auto_140156 ?auto_140157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140165 - BLOCK
      ?auto_140166 - BLOCK
    )
    :vars
    (
      ?auto_140167 - BLOCK
      ?auto_140172 - BLOCK
      ?auto_140170 - BLOCK
      ?auto_140168 - BLOCK
      ?auto_140171 - BLOCK
      ?auto_140173 - BLOCK
      ?auto_140169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140167 ?auto_140166 ) ( ON-TABLE ?auto_140165 ) ( ON ?auto_140166 ?auto_140165 ) ( not ( = ?auto_140165 ?auto_140166 ) ) ( not ( = ?auto_140165 ?auto_140167 ) ) ( not ( = ?auto_140166 ?auto_140167 ) ) ( not ( = ?auto_140165 ?auto_140172 ) ) ( not ( = ?auto_140165 ?auto_140170 ) ) ( not ( = ?auto_140166 ?auto_140172 ) ) ( not ( = ?auto_140166 ?auto_140170 ) ) ( not ( = ?auto_140167 ?auto_140172 ) ) ( not ( = ?auto_140167 ?auto_140170 ) ) ( not ( = ?auto_140172 ?auto_140170 ) ) ( ON ?auto_140172 ?auto_140167 ) ( not ( = ?auto_140168 ?auto_140171 ) ) ( not ( = ?auto_140168 ?auto_140173 ) ) ( not ( = ?auto_140168 ?auto_140170 ) ) ( not ( = ?auto_140171 ?auto_140173 ) ) ( not ( = ?auto_140171 ?auto_140170 ) ) ( not ( = ?auto_140173 ?auto_140170 ) ) ( not ( = ?auto_140165 ?auto_140173 ) ) ( not ( = ?auto_140165 ?auto_140168 ) ) ( not ( = ?auto_140165 ?auto_140171 ) ) ( not ( = ?auto_140166 ?auto_140173 ) ) ( not ( = ?auto_140166 ?auto_140168 ) ) ( not ( = ?auto_140166 ?auto_140171 ) ) ( not ( = ?auto_140167 ?auto_140173 ) ) ( not ( = ?auto_140167 ?auto_140168 ) ) ( not ( = ?auto_140167 ?auto_140171 ) ) ( not ( = ?auto_140172 ?auto_140173 ) ) ( not ( = ?auto_140172 ?auto_140168 ) ) ( not ( = ?auto_140172 ?auto_140171 ) ) ( ON ?auto_140168 ?auto_140169 ) ( not ( = ?auto_140165 ?auto_140169 ) ) ( not ( = ?auto_140166 ?auto_140169 ) ) ( not ( = ?auto_140167 ?auto_140169 ) ) ( not ( = ?auto_140172 ?auto_140169 ) ) ( not ( = ?auto_140170 ?auto_140169 ) ) ( not ( = ?auto_140168 ?auto_140169 ) ) ( not ( = ?auto_140171 ?auto_140169 ) ) ( not ( = ?auto_140173 ?auto_140169 ) ) ( ON ?auto_140171 ?auto_140168 ) ( ON-TABLE ?auto_140169 ) ( ON ?auto_140173 ?auto_140171 ) ( CLEAR ?auto_140173 ) ( HOLDING ?auto_140170 ) ( CLEAR ?auto_140172 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140165 ?auto_140166 ?auto_140167 ?auto_140172 ?auto_140170 )
      ( MAKE-2PILE ?auto_140165 ?auto_140166 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140174 - BLOCK
      ?auto_140175 - BLOCK
    )
    :vars
    (
      ?auto_140179 - BLOCK
      ?auto_140178 - BLOCK
      ?auto_140176 - BLOCK
      ?auto_140182 - BLOCK
      ?auto_140180 - BLOCK
      ?auto_140181 - BLOCK
      ?auto_140177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140179 ?auto_140175 ) ( ON-TABLE ?auto_140174 ) ( ON ?auto_140175 ?auto_140174 ) ( not ( = ?auto_140174 ?auto_140175 ) ) ( not ( = ?auto_140174 ?auto_140179 ) ) ( not ( = ?auto_140175 ?auto_140179 ) ) ( not ( = ?auto_140174 ?auto_140178 ) ) ( not ( = ?auto_140174 ?auto_140176 ) ) ( not ( = ?auto_140175 ?auto_140178 ) ) ( not ( = ?auto_140175 ?auto_140176 ) ) ( not ( = ?auto_140179 ?auto_140178 ) ) ( not ( = ?auto_140179 ?auto_140176 ) ) ( not ( = ?auto_140178 ?auto_140176 ) ) ( ON ?auto_140178 ?auto_140179 ) ( not ( = ?auto_140182 ?auto_140180 ) ) ( not ( = ?auto_140182 ?auto_140181 ) ) ( not ( = ?auto_140182 ?auto_140176 ) ) ( not ( = ?auto_140180 ?auto_140181 ) ) ( not ( = ?auto_140180 ?auto_140176 ) ) ( not ( = ?auto_140181 ?auto_140176 ) ) ( not ( = ?auto_140174 ?auto_140181 ) ) ( not ( = ?auto_140174 ?auto_140182 ) ) ( not ( = ?auto_140174 ?auto_140180 ) ) ( not ( = ?auto_140175 ?auto_140181 ) ) ( not ( = ?auto_140175 ?auto_140182 ) ) ( not ( = ?auto_140175 ?auto_140180 ) ) ( not ( = ?auto_140179 ?auto_140181 ) ) ( not ( = ?auto_140179 ?auto_140182 ) ) ( not ( = ?auto_140179 ?auto_140180 ) ) ( not ( = ?auto_140178 ?auto_140181 ) ) ( not ( = ?auto_140178 ?auto_140182 ) ) ( not ( = ?auto_140178 ?auto_140180 ) ) ( ON ?auto_140182 ?auto_140177 ) ( not ( = ?auto_140174 ?auto_140177 ) ) ( not ( = ?auto_140175 ?auto_140177 ) ) ( not ( = ?auto_140179 ?auto_140177 ) ) ( not ( = ?auto_140178 ?auto_140177 ) ) ( not ( = ?auto_140176 ?auto_140177 ) ) ( not ( = ?auto_140182 ?auto_140177 ) ) ( not ( = ?auto_140180 ?auto_140177 ) ) ( not ( = ?auto_140181 ?auto_140177 ) ) ( ON ?auto_140180 ?auto_140182 ) ( ON-TABLE ?auto_140177 ) ( ON ?auto_140181 ?auto_140180 ) ( CLEAR ?auto_140178 ) ( ON ?auto_140176 ?auto_140181 ) ( CLEAR ?auto_140176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140177 ?auto_140182 ?auto_140180 ?auto_140181 )
      ( MAKE-2PILE ?auto_140174 ?auto_140175 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140183 - BLOCK
      ?auto_140184 - BLOCK
    )
    :vars
    (
      ?auto_140191 - BLOCK
      ?auto_140187 - BLOCK
      ?auto_140186 - BLOCK
      ?auto_140185 - BLOCK
      ?auto_140190 - BLOCK
      ?auto_140189 - BLOCK
      ?auto_140188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140191 ?auto_140184 ) ( ON-TABLE ?auto_140183 ) ( ON ?auto_140184 ?auto_140183 ) ( not ( = ?auto_140183 ?auto_140184 ) ) ( not ( = ?auto_140183 ?auto_140191 ) ) ( not ( = ?auto_140184 ?auto_140191 ) ) ( not ( = ?auto_140183 ?auto_140187 ) ) ( not ( = ?auto_140183 ?auto_140186 ) ) ( not ( = ?auto_140184 ?auto_140187 ) ) ( not ( = ?auto_140184 ?auto_140186 ) ) ( not ( = ?auto_140191 ?auto_140187 ) ) ( not ( = ?auto_140191 ?auto_140186 ) ) ( not ( = ?auto_140187 ?auto_140186 ) ) ( not ( = ?auto_140185 ?auto_140190 ) ) ( not ( = ?auto_140185 ?auto_140189 ) ) ( not ( = ?auto_140185 ?auto_140186 ) ) ( not ( = ?auto_140190 ?auto_140189 ) ) ( not ( = ?auto_140190 ?auto_140186 ) ) ( not ( = ?auto_140189 ?auto_140186 ) ) ( not ( = ?auto_140183 ?auto_140189 ) ) ( not ( = ?auto_140183 ?auto_140185 ) ) ( not ( = ?auto_140183 ?auto_140190 ) ) ( not ( = ?auto_140184 ?auto_140189 ) ) ( not ( = ?auto_140184 ?auto_140185 ) ) ( not ( = ?auto_140184 ?auto_140190 ) ) ( not ( = ?auto_140191 ?auto_140189 ) ) ( not ( = ?auto_140191 ?auto_140185 ) ) ( not ( = ?auto_140191 ?auto_140190 ) ) ( not ( = ?auto_140187 ?auto_140189 ) ) ( not ( = ?auto_140187 ?auto_140185 ) ) ( not ( = ?auto_140187 ?auto_140190 ) ) ( ON ?auto_140185 ?auto_140188 ) ( not ( = ?auto_140183 ?auto_140188 ) ) ( not ( = ?auto_140184 ?auto_140188 ) ) ( not ( = ?auto_140191 ?auto_140188 ) ) ( not ( = ?auto_140187 ?auto_140188 ) ) ( not ( = ?auto_140186 ?auto_140188 ) ) ( not ( = ?auto_140185 ?auto_140188 ) ) ( not ( = ?auto_140190 ?auto_140188 ) ) ( not ( = ?auto_140189 ?auto_140188 ) ) ( ON ?auto_140190 ?auto_140185 ) ( ON-TABLE ?auto_140188 ) ( ON ?auto_140189 ?auto_140190 ) ( ON ?auto_140186 ?auto_140189 ) ( CLEAR ?auto_140186 ) ( HOLDING ?auto_140187 ) ( CLEAR ?auto_140191 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140183 ?auto_140184 ?auto_140191 ?auto_140187 )
      ( MAKE-2PILE ?auto_140183 ?auto_140184 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140192 - BLOCK
      ?auto_140193 - BLOCK
    )
    :vars
    (
      ?auto_140195 - BLOCK
      ?auto_140197 - BLOCK
      ?auto_140199 - BLOCK
      ?auto_140194 - BLOCK
      ?auto_140200 - BLOCK
      ?auto_140196 - BLOCK
      ?auto_140198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140195 ?auto_140193 ) ( ON-TABLE ?auto_140192 ) ( ON ?auto_140193 ?auto_140192 ) ( not ( = ?auto_140192 ?auto_140193 ) ) ( not ( = ?auto_140192 ?auto_140195 ) ) ( not ( = ?auto_140193 ?auto_140195 ) ) ( not ( = ?auto_140192 ?auto_140197 ) ) ( not ( = ?auto_140192 ?auto_140199 ) ) ( not ( = ?auto_140193 ?auto_140197 ) ) ( not ( = ?auto_140193 ?auto_140199 ) ) ( not ( = ?auto_140195 ?auto_140197 ) ) ( not ( = ?auto_140195 ?auto_140199 ) ) ( not ( = ?auto_140197 ?auto_140199 ) ) ( not ( = ?auto_140194 ?auto_140200 ) ) ( not ( = ?auto_140194 ?auto_140196 ) ) ( not ( = ?auto_140194 ?auto_140199 ) ) ( not ( = ?auto_140200 ?auto_140196 ) ) ( not ( = ?auto_140200 ?auto_140199 ) ) ( not ( = ?auto_140196 ?auto_140199 ) ) ( not ( = ?auto_140192 ?auto_140196 ) ) ( not ( = ?auto_140192 ?auto_140194 ) ) ( not ( = ?auto_140192 ?auto_140200 ) ) ( not ( = ?auto_140193 ?auto_140196 ) ) ( not ( = ?auto_140193 ?auto_140194 ) ) ( not ( = ?auto_140193 ?auto_140200 ) ) ( not ( = ?auto_140195 ?auto_140196 ) ) ( not ( = ?auto_140195 ?auto_140194 ) ) ( not ( = ?auto_140195 ?auto_140200 ) ) ( not ( = ?auto_140197 ?auto_140196 ) ) ( not ( = ?auto_140197 ?auto_140194 ) ) ( not ( = ?auto_140197 ?auto_140200 ) ) ( ON ?auto_140194 ?auto_140198 ) ( not ( = ?auto_140192 ?auto_140198 ) ) ( not ( = ?auto_140193 ?auto_140198 ) ) ( not ( = ?auto_140195 ?auto_140198 ) ) ( not ( = ?auto_140197 ?auto_140198 ) ) ( not ( = ?auto_140199 ?auto_140198 ) ) ( not ( = ?auto_140194 ?auto_140198 ) ) ( not ( = ?auto_140200 ?auto_140198 ) ) ( not ( = ?auto_140196 ?auto_140198 ) ) ( ON ?auto_140200 ?auto_140194 ) ( ON-TABLE ?auto_140198 ) ( ON ?auto_140196 ?auto_140200 ) ( ON ?auto_140199 ?auto_140196 ) ( CLEAR ?auto_140195 ) ( ON ?auto_140197 ?auto_140199 ) ( CLEAR ?auto_140197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140198 ?auto_140194 ?auto_140200 ?auto_140196 ?auto_140199 )
      ( MAKE-2PILE ?auto_140192 ?auto_140193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140219 - BLOCK
      ?auto_140220 - BLOCK
    )
    :vars
    (
      ?auto_140224 - BLOCK
      ?auto_140225 - BLOCK
      ?auto_140222 - BLOCK
      ?auto_140221 - BLOCK
      ?auto_140227 - BLOCK
      ?auto_140223 - BLOCK
      ?auto_140226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140219 ) ( not ( = ?auto_140219 ?auto_140220 ) ) ( not ( = ?auto_140219 ?auto_140224 ) ) ( not ( = ?auto_140220 ?auto_140224 ) ) ( not ( = ?auto_140219 ?auto_140225 ) ) ( not ( = ?auto_140219 ?auto_140222 ) ) ( not ( = ?auto_140220 ?auto_140225 ) ) ( not ( = ?auto_140220 ?auto_140222 ) ) ( not ( = ?auto_140224 ?auto_140225 ) ) ( not ( = ?auto_140224 ?auto_140222 ) ) ( not ( = ?auto_140225 ?auto_140222 ) ) ( not ( = ?auto_140221 ?auto_140227 ) ) ( not ( = ?auto_140221 ?auto_140223 ) ) ( not ( = ?auto_140221 ?auto_140222 ) ) ( not ( = ?auto_140227 ?auto_140223 ) ) ( not ( = ?auto_140227 ?auto_140222 ) ) ( not ( = ?auto_140223 ?auto_140222 ) ) ( not ( = ?auto_140219 ?auto_140223 ) ) ( not ( = ?auto_140219 ?auto_140221 ) ) ( not ( = ?auto_140219 ?auto_140227 ) ) ( not ( = ?auto_140220 ?auto_140223 ) ) ( not ( = ?auto_140220 ?auto_140221 ) ) ( not ( = ?auto_140220 ?auto_140227 ) ) ( not ( = ?auto_140224 ?auto_140223 ) ) ( not ( = ?auto_140224 ?auto_140221 ) ) ( not ( = ?auto_140224 ?auto_140227 ) ) ( not ( = ?auto_140225 ?auto_140223 ) ) ( not ( = ?auto_140225 ?auto_140221 ) ) ( not ( = ?auto_140225 ?auto_140227 ) ) ( ON ?auto_140221 ?auto_140226 ) ( not ( = ?auto_140219 ?auto_140226 ) ) ( not ( = ?auto_140220 ?auto_140226 ) ) ( not ( = ?auto_140224 ?auto_140226 ) ) ( not ( = ?auto_140225 ?auto_140226 ) ) ( not ( = ?auto_140222 ?auto_140226 ) ) ( not ( = ?auto_140221 ?auto_140226 ) ) ( not ( = ?auto_140227 ?auto_140226 ) ) ( not ( = ?auto_140223 ?auto_140226 ) ) ( ON ?auto_140227 ?auto_140221 ) ( ON-TABLE ?auto_140226 ) ( ON ?auto_140223 ?auto_140227 ) ( ON ?auto_140222 ?auto_140223 ) ( ON ?auto_140225 ?auto_140222 ) ( ON ?auto_140224 ?auto_140225 ) ( CLEAR ?auto_140224 ) ( HOLDING ?auto_140220 ) ( CLEAR ?auto_140219 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140219 ?auto_140220 ?auto_140224 )
      ( MAKE-2PILE ?auto_140219 ?auto_140220 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140228 - BLOCK
      ?auto_140229 - BLOCK
    )
    :vars
    (
      ?auto_140236 - BLOCK
      ?auto_140235 - BLOCK
      ?auto_140230 - BLOCK
      ?auto_140231 - BLOCK
      ?auto_140234 - BLOCK
      ?auto_140232 - BLOCK
      ?auto_140233 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140228 ) ( not ( = ?auto_140228 ?auto_140229 ) ) ( not ( = ?auto_140228 ?auto_140236 ) ) ( not ( = ?auto_140229 ?auto_140236 ) ) ( not ( = ?auto_140228 ?auto_140235 ) ) ( not ( = ?auto_140228 ?auto_140230 ) ) ( not ( = ?auto_140229 ?auto_140235 ) ) ( not ( = ?auto_140229 ?auto_140230 ) ) ( not ( = ?auto_140236 ?auto_140235 ) ) ( not ( = ?auto_140236 ?auto_140230 ) ) ( not ( = ?auto_140235 ?auto_140230 ) ) ( not ( = ?auto_140231 ?auto_140234 ) ) ( not ( = ?auto_140231 ?auto_140232 ) ) ( not ( = ?auto_140231 ?auto_140230 ) ) ( not ( = ?auto_140234 ?auto_140232 ) ) ( not ( = ?auto_140234 ?auto_140230 ) ) ( not ( = ?auto_140232 ?auto_140230 ) ) ( not ( = ?auto_140228 ?auto_140232 ) ) ( not ( = ?auto_140228 ?auto_140231 ) ) ( not ( = ?auto_140228 ?auto_140234 ) ) ( not ( = ?auto_140229 ?auto_140232 ) ) ( not ( = ?auto_140229 ?auto_140231 ) ) ( not ( = ?auto_140229 ?auto_140234 ) ) ( not ( = ?auto_140236 ?auto_140232 ) ) ( not ( = ?auto_140236 ?auto_140231 ) ) ( not ( = ?auto_140236 ?auto_140234 ) ) ( not ( = ?auto_140235 ?auto_140232 ) ) ( not ( = ?auto_140235 ?auto_140231 ) ) ( not ( = ?auto_140235 ?auto_140234 ) ) ( ON ?auto_140231 ?auto_140233 ) ( not ( = ?auto_140228 ?auto_140233 ) ) ( not ( = ?auto_140229 ?auto_140233 ) ) ( not ( = ?auto_140236 ?auto_140233 ) ) ( not ( = ?auto_140235 ?auto_140233 ) ) ( not ( = ?auto_140230 ?auto_140233 ) ) ( not ( = ?auto_140231 ?auto_140233 ) ) ( not ( = ?auto_140234 ?auto_140233 ) ) ( not ( = ?auto_140232 ?auto_140233 ) ) ( ON ?auto_140234 ?auto_140231 ) ( ON-TABLE ?auto_140233 ) ( ON ?auto_140232 ?auto_140234 ) ( ON ?auto_140230 ?auto_140232 ) ( ON ?auto_140235 ?auto_140230 ) ( ON ?auto_140236 ?auto_140235 ) ( CLEAR ?auto_140228 ) ( ON ?auto_140229 ?auto_140236 ) ( CLEAR ?auto_140229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140233 ?auto_140231 ?auto_140234 ?auto_140232 ?auto_140230 ?auto_140235 ?auto_140236 )
      ( MAKE-2PILE ?auto_140228 ?auto_140229 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140237 - BLOCK
      ?auto_140238 - BLOCK
    )
    :vars
    (
      ?auto_140244 - BLOCK
      ?auto_140239 - BLOCK
      ?auto_140245 - BLOCK
      ?auto_140242 - BLOCK
      ?auto_140241 - BLOCK
      ?auto_140240 - BLOCK
      ?auto_140243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140237 ?auto_140238 ) ) ( not ( = ?auto_140237 ?auto_140244 ) ) ( not ( = ?auto_140238 ?auto_140244 ) ) ( not ( = ?auto_140237 ?auto_140239 ) ) ( not ( = ?auto_140237 ?auto_140245 ) ) ( not ( = ?auto_140238 ?auto_140239 ) ) ( not ( = ?auto_140238 ?auto_140245 ) ) ( not ( = ?auto_140244 ?auto_140239 ) ) ( not ( = ?auto_140244 ?auto_140245 ) ) ( not ( = ?auto_140239 ?auto_140245 ) ) ( not ( = ?auto_140242 ?auto_140241 ) ) ( not ( = ?auto_140242 ?auto_140240 ) ) ( not ( = ?auto_140242 ?auto_140245 ) ) ( not ( = ?auto_140241 ?auto_140240 ) ) ( not ( = ?auto_140241 ?auto_140245 ) ) ( not ( = ?auto_140240 ?auto_140245 ) ) ( not ( = ?auto_140237 ?auto_140240 ) ) ( not ( = ?auto_140237 ?auto_140242 ) ) ( not ( = ?auto_140237 ?auto_140241 ) ) ( not ( = ?auto_140238 ?auto_140240 ) ) ( not ( = ?auto_140238 ?auto_140242 ) ) ( not ( = ?auto_140238 ?auto_140241 ) ) ( not ( = ?auto_140244 ?auto_140240 ) ) ( not ( = ?auto_140244 ?auto_140242 ) ) ( not ( = ?auto_140244 ?auto_140241 ) ) ( not ( = ?auto_140239 ?auto_140240 ) ) ( not ( = ?auto_140239 ?auto_140242 ) ) ( not ( = ?auto_140239 ?auto_140241 ) ) ( ON ?auto_140242 ?auto_140243 ) ( not ( = ?auto_140237 ?auto_140243 ) ) ( not ( = ?auto_140238 ?auto_140243 ) ) ( not ( = ?auto_140244 ?auto_140243 ) ) ( not ( = ?auto_140239 ?auto_140243 ) ) ( not ( = ?auto_140245 ?auto_140243 ) ) ( not ( = ?auto_140242 ?auto_140243 ) ) ( not ( = ?auto_140241 ?auto_140243 ) ) ( not ( = ?auto_140240 ?auto_140243 ) ) ( ON ?auto_140241 ?auto_140242 ) ( ON-TABLE ?auto_140243 ) ( ON ?auto_140240 ?auto_140241 ) ( ON ?auto_140245 ?auto_140240 ) ( ON ?auto_140239 ?auto_140245 ) ( ON ?auto_140244 ?auto_140239 ) ( ON ?auto_140238 ?auto_140244 ) ( CLEAR ?auto_140238 ) ( HOLDING ?auto_140237 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140237 )
      ( MAKE-2PILE ?auto_140237 ?auto_140238 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_140246 - BLOCK
      ?auto_140247 - BLOCK
    )
    :vars
    (
      ?auto_140248 - BLOCK
      ?auto_140249 - BLOCK
      ?auto_140254 - BLOCK
      ?auto_140252 - BLOCK
      ?auto_140253 - BLOCK
      ?auto_140251 - BLOCK
      ?auto_140250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140246 ?auto_140247 ) ) ( not ( = ?auto_140246 ?auto_140248 ) ) ( not ( = ?auto_140247 ?auto_140248 ) ) ( not ( = ?auto_140246 ?auto_140249 ) ) ( not ( = ?auto_140246 ?auto_140254 ) ) ( not ( = ?auto_140247 ?auto_140249 ) ) ( not ( = ?auto_140247 ?auto_140254 ) ) ( not ( = ?auto_140248 ?auto_140249 ) ) ( not ( = ?auto_140248 ?auto_140254 ) ) ( not ( = ?auto_140249 ?auto_140254 ) ) ( not ( = ?auto_140252 ?auto_140253 ) ) ( not ( = ?auto_140252 ?auto_140251 ) ) ( not ( = ?auto_140252 ?auto_140254 ) ) ( not ( = ?auto_140253 ?auto_140251 ) ) ( not ( = ?auto_140253 ?auto_140254 ) ) ( not ( = ?auto_140251 ?auto_140254 ) ) ( not ( = ?auto_140246 ?auto_140251 ) ) ( not ( = ?auto_140246 ?auto_140252 ) ) ( not ( = ?auto_140246 ?auto_140253 ) ) ( not ( = ?auto_140247 ?auto_140251 ) ) ( not ( = ?auto_140247 ?auto_140252 ) ) ( not ( = ?auto_140247 ?auto_140253 ) ) ( not ( = ?auto_140248 ?auto_140251 ) ) ( not ( = ?auto_140248 ?auto_140252 ) ) ( not ( = ?auto_140248 ?auto_140253 ) ) ( not ( = ?auto_140249 ?auto_140251 ) ) ( not ( = ?auto_140249 ?auto_140252 ) ) ( not ( = ?auto_140249 ?auto_140253 ) ) ( ON ?auto_140252 ?auto_140250 ) ( not ( = ?auto_140246 ?auto_140250 ) ) ( not ( = ?auto_140247 ?auto_140250 ) ) ( not ( = ?auto_140248 ?auto_140250 ) ) ( not ( = ?auto_140249 ?auto_140250 ) ) ( not ( = ?auto_140254 ?auto_140250 ) ) ( not ( = ?auto_140252 ?auto_140250 ) ) ( not ( = ?auto_140253 ?auto_140250 ) ) ( not ( = ?auto_140251 ?auto_140250 ) ) ( ON ?auto_140253 ?auto_140252 ) ( ON-TABLE ?auto_140250 ) ( ON ?auto_140251 ?auto_140253 ) ( ON ?auto_140254 ?auto_140251 ) ( ON ?auto_140249 ?auto_140254 ) ( ON ?auto_140248 ?auto_140249 ) ( ON ?auto_140247 ?auto_140248 ) ( ON ?auto_140246 ?auto_140247 ) ( CLEAR ?auto_140246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140250 ?auto_140252 ?auto_140253 ?auto_140251 ?auto_140254 ?auto_140249 ?auto_140248 ?auto_140247 )
      ( MAKE-2PILE ?auto_140246 ?auto_140247 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140261 - BLOCK
      ?auto_140262 - BLOCK
      ?auto_140263 - BLOCK
      ?auto_140264 - BLOCK
      ?auto_140265 - BLOCK
      ?auto_140266 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_140266 ) ( CLEAR ?auto_140265 ) ( ON-TABLE ?auto_140261 ) ( ON ?auto_140262 ?auto_140261 ) ( ON ?auto_140263 ?auto_140262 ) ( ON ?auto_140264 ?auto_140263 ) ( ON ?auto_140265 ?auto_140264 ) ( not ( = ?auto_140261 ?auto_140262 ) ) ( not ( = ?auto_140261 ?auto_140263 ) ) ( not ( = ?auto_140261 ?auto_140264 ) ) ( not ( = ?auto_140261 ?auto_140265 ) ) ( not ( = ?auto_140261 ?auto_140266 ) ) ( not ( = ?auto_140262 ?auto_140263 ) ) ( not ( = ?auto_140262 ?auto_140264 ) ) ( not ( = ?auto_140262 ?auto_140265 ) ) ( not ( = ?auto_140262 ?auto_140266 ) ) ( not ( = ?auto_140263 ?auto_140264 ) ) ( not ( = ?auto_140263 ?auto_140265 ) ) ( not ( = ?auto_140263 ?auto_140266 ) ) ( not ( = ?auto_140264 ?auto_140265 ) ) ( not ( = ?auto_140264 ?auto_140266 ) ) ( not ( = ?auto_140265 ?auto_140266 ) ) )
    :subtasks
    ( ( !STACK ?auto_140266 ?auto_140265 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140267 - BLOCK
      ?auto_140268 - BLOCK
      ?auto_140269 - BLOCK
      ?auto_140270 - BLOCK
      ?auto_140271 - BLOCK
      ?auto_140272 - BLOCK
    )
    :vars
    (
      ?auto_140273 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_140271 ) ( ON-TABLE ?auto_140267 ) ( ON ?auto_140268 ?auto_140267 ) ( ON ?auto_140269 ?auto_140268 ) ( ON ?auto_140270 ?auto_140269 ) ( ON ?auto_140271 ?auto_140270 ) ( not ( = ?auto_140267 ?auto_140268 ) ) ( not ( = ?auto_140267 ?auto_140269 ) ) ( not ( = ?auto_140267 ?auto_140270 ) ) ( not ( = ?auto_140267 ?auto_140271 ) ) ( not ( = ?auto_140267 ?auto_140272 ) ) ( not ( = ?auto_140268 ?auto_140269 ) ) ( not ( = ?auto_140268 ?auto_140270 ) ) ( not ( = ?auto_140268 ?auto_140271 ) ) ( not ( = ?auto_140268 ?auto_140272 ) ) ( not ( = ?auto_140269 ?auto_140270 ) ) ( not ( = ?auto_140269 ?auto_140271 ) ) ( not ( = ?auto_140269 ?auto_140272 ) ) ( not ( = ?auto_140270 ?auto_140271 ) ) ( not ( = ?auto_140270 ?auto_140272 ) ) ( not ( = ?auto_140271 ?auto_140272 ) ) ( ON ?auto_140272 ?auto_140273 ) ( CLEAR ?auto_140272 ) ( HAND-EMPTY ) ( not ( = ?auto_140267 ?auto_140273 ) ) ( not ( = ?auto_140268 ?auto_140273 ) ) ( not ( = ?auto_140269 ?auto_140273 ) ) ( not ( = ?auto_140270 ?auto_140273 ) ) ( not ( = ?auto_140271 ?auto_140273 ) ) ( not ( = ?auto_140272 ?auto_140273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140272 ?auto_140273 )
      ( MAKE-6PILE ?auto_140267 ?auto_140268 ?auto_140269 ?auto_140270 ?auto_140271 ?auto_140272 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140274 - BLOCK
      ?auto_140275 - BLOCK
      ?auto_140276 - BLOCK
      ?auto_140277 - BLOCK
      ?auto_140278 - BLOCK
      ?auto_140279 - BLOCK
    )
    :vars
    (
      ?auto_140280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140274 ) ( ON ?auto_140275 ?auto_140274 ) ( ON ?auto_140276 ?auto_140275 ) ( ON ?auto_140277 ?auto_140276 ) ( not ( = ?auto_140274 ?auto_140275 ) ) ( not ( = ?auto_140274 ?auto_140276 ) ) ( not ( = ?auto_140274 ?auto_140277 ) ) ( not ( = ?auto_140274 ?auto_140278 ) ) ( not ( = ?auto_140274 ?auto_140279 ) ) ( not ( = ?auto_140275 ?auto_140276 ) ) ( not ( = ?auto_140275 ?auto_140277 ) ) ( not ( = ?auto_140275 ?auto_140278 ) ) ( not ( = ?auto_140275 ?auto_140279 ) ) ( not ( = ?auto_140276 ?auto_140277 ) ) ( not ( = ?auto_140276 ?auto_140278 ) ) ( not ( = ?auto_140276 ?auto_140279 ) ) ( not ( = ?auto_140277 ?auto_140278 ) ) ( not ( = ?auto_140277 ?auto_140279 ) ) ( not ( = ?auto_140278 ?auto_140279 ) ) ( ON ?auto_140279 ?auto_140280 ) ( CLEAR ?auto_140279 ) ( not ( = ?auto_140274 ?auto_140280 ) ) ( not ( = ?auto_140275 ?auto_140280 ) ) ( not ( = ?auto_140276 ?auto_140280 ) ) ( not ( = ?auto_140277 ?auto_140280 ) ) ( not ( = ?auto_140278 ?auto_140280 ) ) ( not ( = ?auto_140279 ?auto_140280 ) ) ( HOLDING ?auto_140278 ) ( CLEAR ?auto_140277 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140274 ?auto_140275 ?auto_140276 ?auto_140277 ?auto_140278 )
      ( MAKE-6PILE ?auto_140274 ?auto_140275 ?auto_140276 ?auto_140277 ?auto_140278 ?auto_140279 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140281 - BLOCK
      ?auto_140282 - BLOCK
      ?auto_140283 - BLOCK
      ?auto_140284 - BLOCK
      ?auto_140285 - BLOCK
      ?auto_140286 - BLOCK
    )
    :vars
    (
      ?auto_140287 - BLOCK
      ?auto_140288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140281 ) ( ON ?auto_140282 ?auto_140281 ) ( ON ?auto_140283 ?auto_140282 ) ( ON ?auto_140284 ?auto_140283 ) ( not ( = ?auto_140281 ?auto_140282 ) ) ( not ( = ?auto_140281 ?auto_140283 ) ) ( not ( = ?auto_140281 ?auto_140284 ) ) ( not ( = ?auto_140281 ?auto_140285 ) ) ( not ( = ?auto_140281 ?auto_140286 ) ) ( not ( = ?auto_140282 ?auto_140283 ) ) ( not ( = ?auto_140282 ?auto_140284 ) ) ( not ( = ?auto_140282 ?auto_140285 ) ) ( not ( = ?auto_140282 ?auto_140286 ) ) ( not ( = ?auto_140283 ?auto_140284 ) ) ( not ( = ?auto_140283 ?auto_140285 ) ) ( not ( = ?auto_140283 ?auto_140286 ) ) ( not ( = ?auto_140284 ?auto_140285 ) ) ( not ( = ?auto_140284 ?auto_140286 ) ) ( not ( = ?auto_140285 ?auto_140286 ) ) ( ON ?auto_140286 ?auto_140287 ) ( not ( = ?auto_140281 ?auto_140287 ) ) ( not ( = ?auto_140282 ?auto_140287 ) ) ( not ( = ?auto_140283 ?auto_140287 ) ) ( not ( = ?auto_140284 ?auto_140287 ) ) ( not ( = ?auto_140285 ?auto_140287 ) ) ( not ( = ?auto_140286 ?auto_140287 ) ) ( CLEAR ?auto_140284 ) ( ON ?auto_140285 ?auto_140286 ) ( CLEAR ?auto_140285 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140288 ) ( ON ?auto_140287 ?auto_140288 ) ( not ( = ?auto_140288 ?auto_140287 ) ) ( not ( = ?auto_140288 ?auto_140286 ) ) ( not ( = ?auto_140288 ?auto_140285 ) ) ( not ( = ?auto_140281 ?auto_140288 ) ) ( not ( = ?auto_140282 ?auto_140288 ) ) ( not ( = ?auto_140283 ?auto_140288 ) ) ( not ( = ?auto_140284 ?auto_140288 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140288 ?auto_140287 ?auto_140286 )
      ( MAKE-6PILE ?auto_140281 ?auto_140282 ?auto_140283 ?auto_140284 ?auto_140285 ?auto_140286 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140289 - BLOCK
      ?auto_140290 - BLOCK
      ?auto_140291 - BLOCK
      ?auto_140292 - BLOCK
      ?auto_140293 - BLOCK
      ?auto_140294 - BLOCK
    )
    :vars
    (
      ?auto_140295 - BLOCK
      ?auto_140296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140289 ) ( ON ?auto_140290 ?auto_140289 ) ( ON ?auto_140291 ?auto_140290 ) ( not ( = ?auto_140289 ?auto_140290 ) ) ( not ( = ?auto_140289 ?auto_140291 ) ) ( not ( = ?auto_140289 ?auto_140292 ) ) ( not ( = ?auto_140289 ?auto_140293 ) ) ( not ( = ?auto_140289 ?auto_140294 ) ) ( not ( = ?auto_140290 ?auto_140291 ) ) ( not ( = ?auto_140290 ?auto_140292 ) ) ( not ( = ?auto_140290 ?auto_140293 ) ) ( not ( = ?auto_140290 ?auto_140294 ) ) ( not ( = ?auto_140291 ?auto_140292 ) ) ( not ( = ?auto_140291 ?auto_140293 ) ) ( not ( = ?auto_140291 ?auto_140294 ) ) ( not ( = ?auto_140292 ?auto_140293 ) ) ( not ( = ?auto_140292 ?auto_140294 ) ) ( not ( = ?auto_140293 ?auto_140294 ) ) ( ON ?auto_140294 ?auto_140295 ) ( not ( = ?auto_140289 ?auto_140295 ) ) ( not ( = ?auto_140290 ?auto_140295 ) ) ( not ( = ?auto_140291 ?auto_140295 ) ) ( not ( = ?auto_140292 ?auto_140295 ) ) ( not ( = ?auto_140293 ?auto_140295 ) ) ( not ( = ?auto_140294 ?auto_140295 ) ) ( ON ?auto_140293 ?auto_140294 ) ( CLEAR ?auto_140293 ) ( ON-TABLE ?auto_140296 ) ( ON ?auto_140295 ?auto_140296 ) ( not ( = ?auto_140296 ?auto_140295 ) ) ( not ( = ?auto_140296 ?auto_140294 ) ) ( not ( = ?auto_140296 ?auto_140293 ) ) ( not ( = ?auto_140289 ?auto_140296 ) ) ( not ( = ?auto_140290 ?auto_140296 ) ) ( not ( = ?auto_140291 ?auto_140296 ) ) ( not ( = ?auto_140292 ?auto_140296 ) ) ( HOLDING ?auto_140292 ) ( CLEAR ?auto_140291 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140289 ?auto_140290 ?auto_140291 ?auto_140292 )
      ( MAKE-6PILE ?auto_140289 ?auto_140290 ?auto_140291 ?auto_140292 ?auto_140293 ?auto_140294 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140297 - BLOCK
      ?auto_140298 - BLOCK
      ?auto_140299 - BLOCK
      ?auto_140300 - BLOCK
      ?auto_140301 - BLOCK
      ?auto_140302 - BLOCK
    )
    :vars
    (
      ?auto_140304 - BLOCK
      ?auto_140303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140297 ) ( ON ?auto_140298 ?auto_140297 ) ( ON ?auto_140299 ?auto_140298 ) ( not ( = ?auto_140297 ?auto_140298 ) ) ( not ( = ?auto_140297 ?auto_140299 ) ) ( not ( = ?auto_140297 ?auto_140300 ) ) ( not ( = ?auto_140297 ?auto_140301 ) ) ( not ( = ?auto_140297 ?auto_140302 ) ) ( not ( = ?auto_140298 ?auto_140299 ) ) ( not ( = ?auto_140298 ?auto_140300 ) ) ( not ( = ?auto_140298 ?auto_140301 ) ) ( not ( = ?auto_140298 ?auto_140302 ) ) ( not ( = ?auto_140299 ?auto_140300 ) ) ( not ( = ?auto_140299 ?auto_140301 ) ) ( not ( = ?auto_140299 ?auto_140302 ) ) ( not ( = ?auto_140300 ?auto_140301 ) ) ( not ( = ?auto_140300 ?auto_140302 ) ) ( not ( = ?auto_140301 ?auto_140302 ) ) ( ON ?auto_140302 ?auto_140304 ) ( not ( = ?auto_140297 ?auto_140304 ) ) ( not ( = ?auto_140298 ?auto_140304 ) ) ( not ( = ?auto_140299 ?auto_140304 ) ) ( not ( = ?auto_140300 ?auto_140304 ) ) ( not ( = ?auto_140301 ?auto_140304 ) ) ( not ( = ?auto_140302 ?auto_140304 ) ) ( ON ?auto_140301 ?auto_140302 ) ( ON-TABLE ?auto_140303 ) ( ON ?auto_140304 ?auto_140303 ) ( not ( = ?auto_140303 ?auto_140304 ) ) ( not ( = ?auto_140303 ?auto_140302 ) ) ( not ( = ?auto_140303 ?auto_140301 ) ) ( not ( = ?auto_140297 ?auto_140303 ) ) ( not ( = ?auto_140298 ?auto_140303 ) ) ( not ( = ?auto_140299 ?auto_140303 ) ) ( not ( = ?auto_140300 ?auto_140303 ) ) ( CLEAR ?auto_140299 ) ( ON ?auto_140300 ?auto_140301 ) ( CLEAR ?auto_140300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140303 ?auto_140304 ?auto_140302 ?auto_140301 )
      ( MAKE-6PILE ?auto_140297 ?auto_140298 ?auto_140299 ?auto_140300 ?auto_140301 ?auto_140302 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140305 - BLOCK
      ?auto_140306 - BLOCK
      ?auto_140307 - BLOCK
      ?auto_140308 - BLOCK
      ?auto_140309 - BLOCK
      ?auto_140310 - BLOCK
    )
    :vars
    (
      ?auto_140311 - BLOCK
      ?auto_140312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140305 ) ( ON ?auto_140306 ?auto_140305 ) ( not ( = ?auto_140305 ?auto_140306 ) ) ( not ( = ?auto_140305 ?auto_140307 ) ) ( not ( = ?auto_140305 ?auto_140308 ) ) ( not ( = ?auto_140305 ?auto_140309 ) ) ( not ( = ?auto_140305 ?auto_140310 ) ) ( not ( = ?auto_140306 ?auto_140307 ) ) ( not ( = ?auto_140306 ?auto_140308 ) ) ( not ( = ?auto_140306 ?auto_140309 ) ) ( not ( = ?auto_140306 ?auto_140310 ) ) ( not ( = ?auto_140307 ?auto_140308 ) ) ( not ( = ?auto_140307 ?auto_140309 ) ) ( not ( = ?auto_140307 ?auto_140310 ) ) ( not ( = ?auto_140308 ?auto_140309 ) ) ( not ( = ?auto_140308 ?auto_140310 ) ) ( not ( = ?auto_140309 ?auto_140310 ) ) ( ON ?auto_140310 ?auto_140311 ) ( not ( = ?auto_140305 ?auto_140311 ) ) ( not ( = ?auto_140306 ?auto_140311 ) ) ( not ( = ?auto_140307 ?auto_140311 ) ) ( not ( = ?auto_140308 ?auto_140311 ) ) ( not ( = ?auto_140309 ?auto_140311 ) ) ( not ( = ?auto_140310 ?auto_140311 ) ) ( ON ?auto_140309 ?auto_140310 ) ( ON-TABLE ?auto_140312 ) ( ON ?auto_140311 ?auto_140312 ) ( not ( = ?auto_140312 ?auto_140311 ) ) ( not ( = ?auto_140312 ?auto_140310 ) ) ( not ( = ?auto_140312 ?auto_140309 ) ) ( not ( = ?auto_140305 ?auto_140312 ) ) ( not ( = ?auto_140306 ?auto_140312 ) ) ( not ( = ?auto_140307 ?auto_140312 ) ) ( not ( = ?auto_140308 ?auto_140312 ) ) ( ON ?auto_140308 ?auto_140309 ) ( CLEAR ?auto_140308 ) ( HOLDING ?auto_140307 ) ( CLEAR ?auto_140306 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140305 ?auto_140306 ?auto_140307 )
      ( MAKE-6PILE ?auto_140305 ?auto_140306 ?auto_140307 ?auto_140308 ?auto_140309 ?auto_140310 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140313 - BLOCK
      ?auto_140314 - BLOCK
      ?auto_140315 - BLOCK
      ?auto_140316 - BLOCK
      ?auto_140317 - BLOCK
      ?auto_140318 - BLOCK
    )
    :vars
    (
      ?auto_140319 - BLOCK
      ?auto_140320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140313 ) ( ON ?auto_140314 ?auto_140313 ) ( not ( = ?auto_140313 ?auto_140314 ) ) ( not ( = ?auto_140313 ?auto_140315 ) ) ( not ( = ?auto_140313 ?auto_140316 ) ) ( not ( = ?auto_140313 ?auto_140317 ) ) ( not ( = ?auto_140313 ?auto_140318 ) ) ( not ( = ?auto_140314 ?auto_140315 ) ) ( not ( = ?auto_140314 ?auto_140316 ) ) ( not ( = ?auto_140314 ?auto_140317 ) ) ( not ( = ?auto_140314 ?auto_140318 ) ) ( not ( = ?auto_140315 ?auto_140316 ) ) ( not ( = ?auto_140315 ?auto_140317 ) ) ( not ( = ?auto_140315 ?auto_140318 ) ) ( not ( = ?auto_140316 ?auto_140317 ) ) ( not ( = ?auto_140316 ?auto_140318 ) ) ( not ( = ?auto_140317 ?auto_140318 ) ) ( ON ?auto_140318 ?auto_140319 ) ( not ( = ?auto_140313 ?auto_140319 ) ) ( not ( = ?auto_140314 ?auto_140319 ) ) ( not ( = ?auto_140315 ?auto_140319 ) ) ( not ( = ?auto_140316 ?auto_140319 ) ) ( not ( = ?auto_140317 ?auto_140319 ) ) ( not ( = ?auto_140318 ?auto_140319 ) ) ( ON ?auto_140317 ?auto_140318 ) ( ON-TABLE ?auto_140320 ) ( ON ?auto_140319 ?auto_140320 ) ( not ( = ?auto_140320 ?auto_140319 ) ) ( not ( = ?auto_140320 ?auto_140318 ) ) ( not ( = ?auto_140320 ?auto_140317 ) ) ( not ( = ?auto_140313 ?auto_140320 ) ) ( not ( = ?auto_140314 ?auto_140320 ) ) ( not ( = ?auto_140315 ?auto_140320 ) ) ( not ( = ?auto_140316 ?auto_140320 ) ) ( ON ?auto_140316 ?auto_140317 ) ( CLEAR ?auto_140314 ) ( ON ?auto_140315 ?auto_140316 ) ( CLEAR ?auto_140315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140320 ?auto_140319 ?auto_140318 ?auto_140317 ?auto_140316 )
      ( MAKE-6PILE ?auto_140313 ?auto_140314 ?auto_140315 ?auto_140316 ?auto_140317 ?auto_140318 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140321 - BLOCK
      ?auto_140322 - BLOCK
      ?auto_140323 - BLOCK
      ?auto_140324 - BLOCK
      ?auto_140325 - BLOCK
      ?auto_140326 - BLOCK
    )
    :vars
    (
      ?auto_140327 - BLOCK
      ?auto_140328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140321 ) ( not ( = ?auto_140321 ?auto_140322 ) ) ( not ( = ?auto_140321 ?auto_140323 ) ) ( not ( = ?auto_140321 ?auto_140324 ) ) ( not ( = ?auto_140321 ?auto_140325 ) ) ( not ( = ?auto_140321 ?auto_140326 ) ) ( not ( = ?auto_140322 ?auto_140323 ) ) ( not ( = ?auto_140322 ?auto_140324 ) ) ( not ( = ?auto_140322 ?auto_140325 ) ) ( not ( = ?auto_140322 ?auto_140326 ) ) ( not ( = ?auto_140323 ?auto_140324 ) ) ( not ( = ?auto_140323 ?auto_140325 ) ) ( not ( = ?auto_140323 ?auto_140326 ) ) ( not ( = ?auto_140324 ?auto_140325 ) ) ( not ( = ?auto_140324 ?auto_140326 ) ) ( not ( = ?auto_140325 ?auto_140326 ) ) ( ON ?auto_140326 ?auto_140327 ) ( not ( = ?auto_140321 ?auto_140327 ) ) ( not ( = ?auto_140322 ?auto_140327 ) ) ( not ( = ?auto_140323 ?auto_140327 ) ) ( not ( = ?auto_140324 ?auto_140327 ) ) ( not ( = ?auto_140325 ?auto_140327 ) ) ( not ( = ?auto_140326 ?auto_140327 ) ) ( ON ?auto_140325 ?auto_140326 ) ( ON-TABLE ?auto_140328 ) ( ON ?auto_140327 ?auto_140328 ) ( not ( = ?auto_140328 ?auto_140327 ) ) ( not ( = ?auto_140328 ?auto_140326 ) ) ( not ( = ?auto_140328 ?auto_140325 ) ) ( not ( = ?auto_140321 ?auto_140328 ) ) ( not ( = ?auto_140322 ?auto_140328 ) ) ( not ( = ?auto_140323 ?auto_140328 ) ) ( not ( = ?auto_140324 ?auto_140328 ) ) ( ON ?auto_140324 ?auto_140325 ) ( ON ?auto_140323 ?auto_140324 ) ( CLEAR ?auto_140323 ) ( HOLDING ?auto_140322 ) ( CLEAR ?auto_140321 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140321 ?auto_140322 )
      ( MAKE-6PILE ?auto_140321 ?auto_140322 ?auto_140323 ?auto_140324 ?auto_140325 ?auto_140326 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140329 - BLOCK
      ?auto_140330 - BLOCK
      ?auto_140331 - BLOCK
      ?auto_140332 - BLOCK
      ?auto_140333 - BLOCK
      ?auto_140334 - BLOCK
    )
    :vars
    (
      ?auto_140335 - BLOCK
      ?auto_140336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140329 ) ( not ( = ?auto_140329 ?auto_140330 ) ) ( not ( = ?auto_140329 ?auto_140331 ) ) ( not ( = ?auto_140329 ?auto_140332 ) ) ( not ( = ?auto_140329 ?auto_140333 ) ) ( not ( = ?auto_140329 ?auto_140334 ) ) ( not ( = ?auto_140330 ?auto_140331 ) ) ( not ( = ?auto_140330 ?auto_140332 ) ) ( not ( = ?auto_140330 ?auto_140333 ) ) ( not ( = ?auto_140330 ?auto_140334 ) ) ( not ( = ?auto_140331 ?auto_140332 ) ) ( not ( = ?auto_140331 ?auto_140333 ) ) ( not ( = ?auto_140331 ?auto_140334 ) ) ( not ( = ?auto_140332 ?auto_140333 ) ) ( not ( = ?auto_140332 ?auto_140334 ) ) ( not ( = ?auto_140333 ?auto_140334 ) ) ( ON ?auto_140334 ?auto_140335 ) ( not ( = ?auto_140329 ?auto_140335 ) ) ( not ( = ?auto_140330 ?auto_140335 ) ) ( not ( = ?auto_140331 ?auto_140335 ) ) ( not ( = ?auto_140332 ?auto_140335 ) ) ( not ( = ?auto_140333 ?auto_140335 ) ) ( not ( = ?auto_140334 ?auto_140335 ) ) ( ON ?auto_140333 ?auto_140334 ) ( ON-TABLE ?auto_140336 ) ( ON ?auto_140335 ?auto_140336 ) ( not ( = ?auto_140336 ?auto_140335 ) ) ( not ( = ?auto_140336 ?auto_140334 ) ) ( not ( = ?auto_140336 ?auto_140333 ) ) ( not ( = ?auto_140329 ?auto_140336 ) ) ( not ( = ?auto_140330 ?auto_140336 ) ) ( not ( = ?auto_140331 ?auto_140336 ) ) ( not ( = ?auto_140332 ?auto_140336 ) ) ( ON ?auto_140332 ?auto_140333 ) ( ON ?auto_140331 ?auto_140332 ) ( CLEAR ?auto_140329 ) ( ON ?auto_140330 ?auto_140331 ) ( CLEAR ?auto_140330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140336 ?auto_140335 ?auto_140334 ?auto_140333 ?auto_140332 ?auto_140331 )
      ( MAKE-6PILE ?auto_140329 ?auto_140330 ?auto_140331 ?auto_140332 ?auto_140333 ?auto_140334 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140337 - BLOCK
      ?auto_140338 - BLOCK
      ?auto_140339 - BLOCK
      ?auto_140340 - BLOCK
      ?auto_140341 - BLOCK
      ?auto_140342 - BLOCK
    )
    :vars
    (
      ?auto_140344 - BLOCK
      ?auto_140343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140337 ?auto_140338 ) ) ( not ( = ?auto_140337 ?auto_140339 ) ) ( not ( = ?auto_140337 ?auto_140340 ) ) ( not ( = ?auto_140337 ?auto_140341 ) ) ( not ( = ?auto_140337 ?auto_140342 ) ) ( not ( = ?auto_140338 ?auto_140339 ) ) ( not ( = ?auto_140338 ?auto_140340 ) ) ( not ( = ?auto_140338 ?auto_140341 ) ) ( not ( = ?auto_140338 ?auto_140342 ) ) ( not ( = ?auto_140339 ?auto_140340 ) ) ( not ( = ?auto_140339 ?auto_140341 ) ) ( not ( = ?auto_140339 ?auto_140342 ) ) ( not ( = ?auto_140340 ?auto_140341 ) ) ( not ( = ?auto_140340 ?auto_140342 ) ) ( not ( = ?auto_140341 ?auto_140342 ) ) ( ON ?auto_140342 ?auto_140344 ) ( not ( = ?auto_140337 ?auto_140344 ) ) ( not ( = ?auto_140338 ?auto_140344 ) ) ( not ( = ?auto_140339 ?auto_140344 ) ) ( not ( = ?auto_140340 ?auto_140344 ) ) ( not ( = ?auto_140341 ?auto_140344 ) ) ( not ( = ?auto_140342 ?auto_140344 ) ) ( ON ?auto_140341 ?auto_140342 ) ( ON-TABLE ?auto_140343 ) ( ON ?auto_140344 ?auto_140343 ) ( not ( = ?auto_140343 ?auto_140344 ) ) ( not ( = ?auto_140343 ?auto_140342 ) ) ( not ( = ?auto_140343 ?auto_140341 ) ) ( not ( = ?auto_140337 ?auto_140343 ) ) ( not ( = ?auto_140338 ?auto_140343 ) ) ( not ( = ?auto_140339 ?auto_140343 ) ) ( not ( = ?auto_140340 ?auto_140343 ) ) ( ON ?auto_140340 ?auto_140341 ) ( ON ?auto_140339 ?auto_140340 ) ( ON ?auto_140338 ?auto_140339 ) ( CLEAR ?auto_140338 ) ( HOLDING ?auto_140337 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140337 )
      ( MAKE-6PILE ?auto_140337 ?auto_140338 ?auto_140339 ?auto_140340 ?auto_140341 ?auto_140342 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140345 - BLOCK
      ?auto_140346 - BLOCK
      ?auto_140347 - BLOCK
      ?auto_140348 - BLOCK
      ?auto_140349 - BLOCK
      ?auto_140350 - BLOCK
    )
    :vars
    (
      ?auto_140352 - BLOCK
      ?auto_140351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140345 ?auto_140346 ) ) ( not ( = ?auto_140345 ?auto_140347 ) ) ( not ( = ?auto_140345 ?auto_140348 ) ) ( not ( = ?auto_140345 ?auto_140349 ) ) ( not ( = ?auto_140345 ?auto_140350 ) ) ( not ( = ?auto_140346 ?auto_140347 ) ) ( not ( = ?auto_140346 ?auto_140348 ) ) ( not ( = ?auto_140346 ?auto_140349 ) ) ( not ( = ?auto_140346 ?auto_140350 ) ) ( not ( = ?auto_140347 ?auto_140348 ) ) ( not ( = ?auto_140347 ?auto_140349 ) ) ( not ( = ?auto_140347 ?auto_140350 ) ) ( not ( = ?auto_140348 ?auto_140349 ) ) ( not ( = ?auto_140348 ?auto_140350 ) ) ( not ( = ?auto_140349 ?auto_140350 ) ) ( ON ?auto_140350 ?auto_140352 ) ( not ( = ?auto_140345 ?auto_140352 ) ) ( not ( = ?auto_140346 ?auto_140352 ) ) ( not ( = ?auto_140347 ?auto_140352 ) ) ( not ( = ?auto_140348 ?auto_140352 ) ) ( not ( = ?auto_140349 ?auto_140352 ) ) ( not ( = ?auto_140350 ?auto_140352 ) ) ( ON ?auto_140349 ?auto_140350 ) ( ON-TABLE ?auto_140351 ) ( ON ?auto_140352 ?auto_140351 ) ( not ( = ?auto_140351 ?auto_140352 ) ) ( not ( = ?auto_140351 ?auto_140350 ) ) ( not ( = ?auto_140351 ?auto_140349 ) ) ( not ( = ?auto_140345 ?auto_140351 ) ) ( not ( = ?auto_140346 ?auto_140351 ) ) ( not ( = ?auto_140347 ?auto_140351 ) ) ( not ( = ?auto_140348 ?auto_140351 ) ) ( ON ?auto_140348 ?auto_140349 ) ( ON ?auto_140347 ?auto_140348 ) ( ON ?auto_140346 ?auto_140347 ) ( ON ?auto_140345 ?auto_140346 ) ( CLEAR ?auto_140345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140351 ?auto_140352 ?auto_140350 ?auto_140349 ?auto_140348 ?auto_140347 ?auto_140346 )
      ( MAKE-6PILE ?auto_140345 ?auto_140346 ?auto_140347 ?auto_140348 ?auto_140349 ?auto_140350 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140353 - BLOCK
      ?auto_140354 - BLOCK
      ?auto_140355 - BLOCK
      ?auto_140356 - BLOCK
      ?auto_140357 - BLOCK
      ?auto_140358 - BLOCK
    )
    :vars
    (
      ?auto_140360 - BLOCK
      ?auto_140359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140353 ?auto_140354 ) ) ( not ( = ?auto_140353 ?auto_140355 ) ) ( not ( = ?auto_140353 ?auto_140356 ) ) ( not ( = ?auto_140353 ?auto_140357 ) ) ( not ( = ?auto_140353 ?auto_140358 ) ) ( not ( = ?auto_140354 ?auto_140355 ) ) ( not ( = ?auto_140354 ?auto_140356 ) ) ( not ( = ?auto_140354 ?auto_140357 ) ) ( not ( = ?auto_140354 ?auto_140358 ) ) ( not ( = ?auto_140355 ?auto_140356 ) ) ( not ( = ?auto_140355 ?auto_140357 ) ) ( not ( = ?auto_140355 ?auto_140358 ) ) ( not ( = ?auto_140356 ?auto_140357 ) ) ( not ( = ?auto_140356 ?auto_140358 ) ) ( not ( = ?auto_140357 ?auto_140358 ) ) ( ON ?auto_140358 ?auto_140360 ) ( not ( = ?auto_140353 ?auto_140360 ) ) ( not ( = ?auto_140354 ?auto_140360 ) ) ( not ( = ?auto_140355 ?auto_140360 ) ) ( not ( = ?auto_140356 ?auto_140360 ) ) ( not ( = ?auto_140357 ?auto_140360 ) ) ( not ( = ?auto_140358 ?auto_140360 ) ) ( ON ?auto_140357 ?auto_140358 ) ( ON-TABLE ?auto_140359 ) ( ON ?auto_140360 ?auto_140359 ) ( not ( = ?auto_140359 ?auto_140360 ) ) ( not ( = ?auto_140359 ?auto_140358 ) ) ( not ( = ?auto_140359 ?auto_140357 ) ) ( not ( = ?auto_140353 ?auto_140359 ) ) ( not ( = ?auto_140354 ?auto_140359 ) ) ( not ( = ?auto_140355 ?auto_140359 ) ) ( not ( = ?auto_140356 ?auto_140359 ) ) ( ON ?auto_140356 ?auto_140357 ) ( ON ?auto_140355 ?auto_140356 ) ( ON ?auto_140354 ?auto_140355 ) ( HOLDING ?auto_140353 ) ( CLEAR ?auto_140354 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140359 ?auto_140360 ?auto_140358 ?auto_140357 ?auto_140356 ?auto_140355 ?auto_140354 ?auto_140353 )
      ( MAKE-6PILE ?auto_140353 ?auto_140354 ?auto_140355 ?auto_140356 ?auto_140357 ?auto_140358 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140361 - BLOCK
      ?auto_140362 - BLOCK
      ?auto_140363 - BLOCK
      ?auto_140364 - BLOCK
      ?auto_140365 - BLOCK
      ?auto_140366 - BLOCK
    )
    :vars
    (
      ?auto_140368 - BLOCK
      ?auto_140367 - BLOCK
      ?auto_140369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140361 ?auto_140362 ) ) ( not ( = ?auto_140361 ?auto_140363 ) ) ( not ( = ?auto_140361 ?auto_140364 ) ) ( not ( = ?auto_140361 ?auto_140365 ) ) ( not ( = ?auto_140361 ?auto_140366 ) ) ( not ( = ?auto_140362 ?auto_140363 ) ) ( not ( = ?auto_140362 ?auto_140364 ) ) ( not ( = ?auto_140362 ?auto_140365 ) ) ( not ( = ?auto_140362 ?auto_140366 ) ) ( not ( = ?auto_140363 ?auto_140364 ) ) ( not ( = ?auto_140363 ?auto_140365 ) ) ( not ( = ?auto_140363 ?auto_140366 ) ) ( not ( = ?auto_140364 ?auto_140365 ) ) ( not ( = ?auto_140364 ?auto_140366 ) ) ( not ( = ?auto_140365 ?auto_140366 ) ) ( ON ?auto_140366 ?auto_140368 ) ( not ( = ?auto_140361 ?auto_140368 ) ) ( not ( = ?auto_140362 ?auto_140368 ) ) ( not ( = ?auto_140363 ?auto_140368 ) ) ( not ( = ?auto_140364 ?auto_140368 ) ) ( not ( = ?auto_140365 ?auto_140368 ) ) ( not ( = ?auto_140366 ?auto_140368 ) ) ( ON ?auto_140365 ?auto_140366 ) ( ON-TABLE ?auto_140367 ) ( ON ?auto_140368 ?auto_140367 ) ( not ( = ?auto_140367 ?auto_140368 ) ) ( not ( = ?auto_140367 ?auto_140366 ) ) ( not ( = ?auto_140367 ?auto_140365 ) ) ( not ( = ?auto_140361 ?auto_140367 ) ) ( not ( = ?auto_140362 ?auto_140367 ) ) ( not ( = ?auto_140363 ?auto_140367 ) ) ( not ( = ?auto_140364 ?auto_140367 ) ) ( ON ?auto_140364 ?auto_140365 ) ( ON ?auto_140363 ?auto_140364 ) ( ON ?auto_140362 ?auto_140363 ) ( CLEAR ?auto_140362 ) ( ON ?auto_140361 ?auto_140369 ) ( CLEAR ?auto_140361 ) ( HAND-EMPTY ) ( not ( = ?auto_140361 ?auto_140369 ) ) ( not ( = ?auto_140362 ?auto_140369 ) ) ( not ( = ?auto_140363 ?auto_140369 ) ) ( not ( = ?auto_140364 ?auto_140369 ) ) ( not ( = ?auto_140365 ?auto_140369 ) ) ( not ( = ?auto_140366 ?auto_140369 ) ) ( not ( = ?auto_140368 ?auto_140369 ) ) ( not ( = ?auto_140367 ?auto_140369 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140361 ?auto_140369 )
      ( MAKE-6PILE ?auto_140361 ?auto_140362 ?auto_140363 ?auto_140364 ?auto_140365 ?auto_140366 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140370 - BLOCK
      ?auto_140371 - BLOCK
      ?auto_140372 - BLOCK
      ?auto_140373 - BLOCK
      ?auto_140374 - BLOCK
      ?auto_140375 - BLOCK
    )
    :vars
    (
      ?auto_140378 - BLOCK
      ?auto_140376 - BLOCK
      ?auto_140377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140370 ?auto_140371 ) ) ( not ( = ?auto_140370 ?auto_140372 ) ) ( not ( = ?auto_140370 ?auto_140373 ) ) ( not ( = ?auto_140370 ?auto_140374 ) ) ( not ( = ?auto_140370 ?auto_140375 ) ) ( not ( = ?auto_140371 ?auto_140372 ) ) ( not ( = ?auto_140371 ?auto_140373 ) ) ( not ( = ?auto_140371 ?auto_140374 ) ) ( not ( = ?auto_140371 ?auto_140375 ) ) ( not ( = ?auto_140372 ?auto_140373 ) ) ( not ( = ?auto_140372 ?auto_140374 ) ) ( not ( = ?auto_140372 ?auto_140375 ) ) ( not ( = ?auto_140373 ?auto_140374 ) ) ( not ( = ?auto_140373 ?auto_140375 ) ) ( not ( = ?auto_140374 ?auto_140375 ) ) ( ON ?auto_140375 ?auto_140378 ) ( not ( = ?auto_140370 ?auto_140378 ) ) ( not ( = ?auto_140371 ?auto_140378 ) ) ( not ( = ?auto_140372 ?auto_140378 ) ) ( not ( = ?auto_140373 ?auto_140378 ) ) ( not ( = ?auto_140374 ?auto_140378 ) ) ( not ( = ?auto_140375 ?auto_140378 ) ) ( ON ?auto_140374 ?auto_140375 ) ( ON-TABLE ?auto_140376 ) ( ON ?auto_140378 ?auto_140376 ) ( not ( = ?auto_140376 ?auto_140378 ) ) ( not ( = ?auto_140376 ?auto_140375 ) ) ( not ( = ?auto_140376 ?auto_140374 ) ) ( not ( = ?auto_140370 ?auto_140376 ) ) ( not ( = ?auto_140371 ?auto_140376 ) ) ( not ( = ?auto_140372 ?auto_140376 ) ) ( not ( = ?auto_140373 ?auto_140376 ) ) ( ON ?auto_140373 ?auto_140374 ) ( ON ?auto_140372 ?auto_140373 ) ( ON ?auto_140370 ?auto_140377 ) ( CLEAR ?auto_140370 ) ( not ( = ?auto_140370 ?auto_140377 ) ) ( not ( = ?auto_140371 ?auto_140377 ) ) ( not ( = ?auto_140372 ?auto_140377 ) ) ( not ( = ?auto_140373 ?auto_140377 ) ) ( not ( = ?auto_140374 ?auto_140377 ) ) ( not ( = ?auto_140375 ?auto_140377 ) ) ( not ( = ?auto_140378 ?auto_140377 ) ) ( not ( = ?auto_140376 ?auto_140377 ) ) ( HOLDING ?auto_140371 ) ( CLEAR ?auto_140372 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140376 ?auto_140378 ?auto_140375 ?auto_140374 ?auto_140373 ?auto_140372 ?auto_140371 )
      ( MAKE-6PILE ?auto_140370 ?auto_140371 ?auto_140372 ?auto_140373 ?auto_140374 ?auto_140375 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140379 - BLOCK
      ?auto_140380 - BLOCK
      ?auto_140381 - BLOCK
      ?auto_140382 - BLOCK
      ?auto_140383 - BLOCK
      ?auto_140384 - BLOCK
    )
    :vars
    (
      ?auto_140387 - BLOCK
      ?auto_140385 - BLOCK
      ?auto_140386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140379 ?auto_140380 ) ) ( not ( = ?auto_140379 ?auto_140381 ) ) ( not ( = ?auto_140379 ?auto_140382 ) ) ( not ( = ?auto_140379 ?auto_140383 ) ) ( not ( = ?auto_140379 ?auto_140384 ) ) ( not ( = ?auto_140380 ?auto_140381 ) ) ( not ( = ?auto_140380 ?auto_140382 ) ) ( not ( = ?auto_140380 ?auto_140383 ) ) ( not ( = ?auto_140380 ?auto_140384 ) ) ( not ( = ?auto_140381 ?auto_140382 ) ) ( not ( = ?auto_140381 ?auto_140383 ) ) ( not ( = ?auto_140381 ?auto_140384 ) ) ( not ( = ?auto_140382 ?auto_140383 ) ) ( not ( = ?auto_140382 ?auto_140384 ) ) ( not ( = ?auto_140383 ?auto_140384 ) ) ( ON ?auto_140384 ?auto_140387 ) ( not ( = ?auto_140379 ?auto_140387 ) ) ( not ( = ?auto_140380 ?auto_140387 ) ) ( not ( = ?auto_140381 ?auto_140387 ) ) ( not ( = ?auto_140382 ?auto_140387 ) ) ( not ( = ?auto_140383 ?auto_140387 ) ) ( not ( = ?auto_140384 ?auto_140387 ) ) ( ON ?auto_140383 ?auto_140384 ) ( ON-TABLE ?auto_140385 ) ( ON ?auto_140387 ?auto_140385 ) ( not ( = ?auto_140385 ?auto_140387 ) ) ( not ( = ?auto_140385 ?auto_140384 ) ) ( not ( = ?auto_140385 ?auto_140383 ) ) ( not ( = ?auto_140379 ?auto_140385 ) ) ( not ( = ?auto_140380 ?auto_140385 ) ) ( not ( = ?auto_140381 ?auto_140385 ) ) ( not ( = ?auto_140382 ?auto_140385 ) ) ( ON ?auto_140382 ?auto_140383 ) ( ON ?auto_140381 ?auto_140382 ) ( ON ?auto_140379 ?auto_140386 ) ( not ( = ?auto_140379 ?auto_140386 ) ) ( not ( = ?auto_140380 ?auto_140386 ) ) ( not ( = ?auto_140381 ?auto_140386 ) ) ( not ( = ?auto_140382 ?auto_140386 ) ) ( not ( = ?auto_140383 ?auto_140386 ) ) ( not ( = ?auto_140384 ?auto_140386 ) ) ( not ( = ?auto_140387 ?auto_140386 ) ) ( not ( = ?auto_140385 ?auto_140386 ) ) ( CLEAR ?auto_140381 ) ( ON ?auto_140380 ?auto_140379 ) ( CLEAR ?auto_140380 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140386 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140386 ?auto_140379 )
      ( MAKE-6PILE ?auto_140379 ?auto_140380 ?auto_140381 ?auto_140382 ?auto_140383 ?auto_140384 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140388 - BLOCK
      ?auto_140389 - BLOCK
      ?auto_140390 - BLOCK
      ?auto_140391 - BLOCK
      ?auto_140392 - BLOCK
      ?auto_140393 - BLOCK
    )
    :vars
    (
      ?auto_140396 - BLOCK
      ?auto_140394 - BLOCK
      ?auto_140395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140388 ?auto_140389 ) ) ( not ( = ?auto_140388 ?auto_140390 ) ) ( not ( = ?auto_140388 ?auto_140391 ) ) ( not ( = ?auto_140388 ?auto_140392 ) ) ( not ( = ?auto_140388 ?auto_140393 ) ) ( not ( = ?auto_140389 ?auto_140390 ) ) ( not ( = ?auto_140389 ?auto_140391 ) ) ( not ( = ?auto_140389 ?auto_140392 ) ) ( not ( = ?auto_140389 ?auto_140393 ) ) ( not ( = ?auto_140390 ?auto_140391 ) ) ( not ( = ?auto_140390 ?auto_140392 ) ) ( not ( = ?auto_140390 ?auto_140393 ) ) ( not ( = ?auto_140391 ?auto_140392 ) ) ( not ( = ?auto_140391 ?auto_140393 ) ) ( not ( = ?auto_140392 ?auto_140393 ) ) ( ON ?auto_140393 ?auto_140396 ) ( not ( = ?auto_140388 ?auto_140396 ) ) ( not ( = ?auto_140389 ?auto_140396 ) ) ( not ( = ?auto_140390 ?auto_140396 ) ) ( not ( = ?auto_140391 ?auto_140396 ) ) ( not ( = ?auto_140392 ?auto_140396 ) ) ( not ( = ?auto_140393 ?auto_140396 ) ) ( ON ?auto_140392 ?auto_140393 ) ( ON-TABLE ?auto_140394 ) ( ON ?auto_140396 ?auto_140394 ) ( not ( = ?auto_140394 ?auto_140396 ) ) ( not ( = ?auto_140394 ?auto_140393 ) ) ( not ( = ?auto_140394 ?auto_140392 ) ) ( not ( = ?auto_140388 ?auto_140394 ) ) ( not ( = ?auto_140389 ?auto_140394 ) ) ( not ( = ?auto_140390 ?auto_140394 ) ) ( not ( = ?auto_140391 ?auto_140394 ) ) ( ON ?auto_140391 ?auto_140392 ) ( ON ?auto_140388 ?auto_140395 ) ( not ( = ?auto_140388 ?auto_140395 ) ) ( not ( = ?auto_140389 ?auto_140395 ) ) ( not ( = ?auto_140390 ?auto_140395 ) ) ( not ( = ?auto_140391 ?auto_140395 ) ) ( not ( = ?auto_140392 ?auto_140395 ) ) ( not ( = ?auto_140393 ?auto_140395 ) ) ( not ( = ?auto_140396 ?auto_140395 ) ) ( not ( = ?auto_140394 ?auto_140395 ) ) ( ON ?auto_140389 ?auto_140388 ) ( CLEAR ?auto_140389 ) ( ON-TABLE ?auto_140395 ) ( HOLDING ?auto_140390 ) ( CLEAR ?auto_140391 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140394 ?auto_140396 ?auto_140393 ?auto_140392 ?auto_140391 ?auto_140390 )
      ( MAKE-6PILE ?auto_140388 ?auto_140389 ?auto_140390 ?auto_140391 ?auto_140392 ?auto_140393 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140397 - BLOCK
      ?auto_140398 - BLOCK
      ?auto_140399 - BLOCK
      ?auto_140400 - BLOCK
      ?auto_140401 - BLOCK
      ?auto_140402 - BLOCK
    )
    :vars
    (
      ?auto_140405 - BLOCK
      ?auto_140404 - BLOCK
      ?auto_140403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140397 ?auto_140398 ) ) ( not ( = ?auto_140397 ?auto_140399 ) ) ( not ( = ?auto_140397 ?auto_140400 ) ) ( not ( = ?auto_140397 ?auto_140401 ) ) ( not ( = ?auto_140397 ?auto_140402 ) ) ( not ( = ?auto_140398 ?auto_140399 ) ) ( not ( = ?auto_140398 ?auto_140400 ) ) ( not ( = ?auto_140398 ?auto_140401 ) ) ( not ( = ?auto_140398 ?auto_140402 ) ) ( not ( = ?auto_140399 ?auto_140400 ) ) ( not ( = ?auto_140399 ?auto_140401 ) ) ( not ( = ?auto_140399 ?auto_140402 ) ) ( not ( = ?auto_140400 ?auto_140401 ) ) ( not ( = ?auto_140400 ?auto_140402 ) ) ( not ( = ?auto_140401 ?auto_140402 ) ) ( ON ?auto_140402 ?auto_140405 ) ( not ( = ?auto_140397 ?auto_140405 ) ) ( not ( = ?auto_140398 ?auto_140405 ) ) ( not ( = ?auto_140399 ?auto_140405 ) ) ( not ( = ?auto_140400 ?auto_140405 ) ) ( not ( = ?auto_140401 ?auto_140405 ) ) ( not ( = ?auto_140402 ?auto_140405 ) ) ( ON ?auto_140401 ?auto_140402 ) ( ON-TABLE ?auto_140404 ) ( ON ?auto_140405 ?auto_140404 ) ( not ( = ?auto_140404 ?auto_140405 ) ) ( not ( = ?auto_140404 ?auto_140402 ) ) ( not ( = ?auto_140404 ?auto_140401 ) ) ( not ( = ?auto_140397 ?auto_140404 ) ) ( not ( = ?auto_140398 ?auto_140404 ) ) ( not ( = ?auto_140399 ?auto_140404 ) ) ( not ( = ?auto_140400 ?auto_140404 ) ) ( ON ?auto_140400 ?auto_140401 ) ( ON ?auto_140397 ?auto_140403 ) ( not ( = ?auto_140397 ?auto_140403 ) ) ( not ( = ?auto_140398 ?auto_140403 ) ) ( not ( = ?auto_140399 ?auto_140403 ) ) ( not ( = ?auto_140400 ?auto_140403 ) ) ( not ( = ?auto_140401 ?auto_140403 ) ) ( not ( = ?auto_140402 ?auto_140403 ) ) ( not ( = ?auto_140405 ?auto_140403 ) ) ( not ( = ?auto_140404 ?auto_140403 ) ) ( ON ?auto_140398 ?auto_140397 ) ( ON-TABLE ?auto_140403 ) ( CLEAR ?auto_140400 ) ( ON ?auto_140399 ?auto_140398 ) ( CLEAR ?auto_140399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140403 ?auto_140397 ?auto_140398 )
      ( MAKE-6PILE ?auto_140397 ?auto_140398 ?auto_140399 ?auto_140400 ?auto_140401 ?auto_140402 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140406 - BLOCK
      ?auto_140407 - BLOCK
      ?auto_140408 - BLOCK
      ?auto_140409 - BLOCK
      ?auto_140410 - BLOCK
      ?auto_140411 - BLOCK
    )
    :vars
    (
      ?auto_140414 - BLOCK
      ?auto_140413 - BLOCK
      ?auto_140412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140406 ?auto_140407 ) ) ( not ( = ?auto_140406 ?auto_140408 ) ) ( not ( = ?auto_140406 ?auto_140409 ) ) ( not ( = ?auto_140406 ?auto_140410 ) ) ( not ( = ?auto_140406 ?auto_140411 ) ) ( not ( = ?auto_140407 ?auto_140408 ) ) ( not ( = ?auto_140407 ?auto_140409 ) ) ( not ( = ?auto_140407 ?auto_140410 ) ) ( not ( = ?auto_140407 ?auto_140411 ) ) ( not ( = ?auto_140408 ?auto_140409 ) ) ( not ( = ?auto_140408 ?auto_140410 ) ) ( not ( = ?auto_140408 ?auto_140411 ) ) ( not ( = ?auto_140409 ?auto_140410 ) ) ( not ( = ?auto_140409 ?auto_140411 ) ) ( not ( = ?auto_140410 ?auto_140411 ) ) ( ON ?auto_140411 ?auto_140414 ) ( not ( = ?auto_140406 ?auto_140414 ) ) ( not ( = ?auto_140407 ?auto_140414 ) ) ( not ( = ?auto_140408 ?auto_140414 ) ) ( not ( = ?auto_140409 ?auto_140414 ) ) ( not ( = ?auto_140410 ?auto_140414 ) ) ( not ( = ?auto_140411 ?auto_140414 ) ) ( ON ?auto_140410 ?auto_140411 ) ( ON-TABLE ?auto_140413 ) ( ON ?auto_140414 ?auto_140413 ) ( not ( = ?auto_140413 ?auto_140414 ) ) ( not ( = ?auto_140413 ?auto_140411 ) ) ( not ( = ?auto_140413 ?auto_140410 ) ) ( not ( = ?auto_140406 ?auto_140413 ) ) ( not ( = ?auto_140407 ?auto_140413 ) ) ( not ( = ?auto_140408 ?auto_140413 ) ) ( not ( = ?auto_140409 ?auto_140413 ) ) ( ON ?auto_140406 ?auto_140412 ) ( not ( = ?auto_140406 ?auto_140412 ) ) ( not ( = ?auto_140407 ?auto_140412 ) ) ( not ( = ?auto_140408 ?auto_140412 ) ) ( not ( = ?auto_140409 ?auto_140412 ) ) ( not ( = ?auto_140410 ?auto_140412 ) ) ( not ( = ?auto_140411 ?auto_140412 ) ) ( not ( = ?auto_140414 ?auto_140412 ) ) ( not ( = ?auto_140413 ?auto_140412 ) ) ( ON ?auto_140407 ?auto_140406 ) ( ON-TABLE ?auto_140412 ) ( ON ?auto_140408 ?auto_140407 ) ( CLEAR ?auto_140408 ) ( HOLDING ?auto_140409 ) ( CLEAR ?auto_140410 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140413 ?auto_140414 ?auto_140411 ?auto_140410 ?auto_140409 )
      ( MAKE-6PILE ?auto_140406 ?auto_140407 ?auto_140408 ?auto_140409 ?auto_140410 ?auto_140411 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140415 - BLOCK
      ?auto_140416 - BLOCK
      ?auto_140417 - BLOCK
      ?auto_140418 - BLOCK
      ?auto_140419 - BLOCK
      ?auto_140420 - BLOCK
    )
    :vars
    (
      ?auto_140421 - BLOCK
      ?auto_140422 - BLOCK
      ?auto_140423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140415 ?auto_140416 ) ) ( not ( = ?auto_140415 ?auto_140417 ) ) ( not ( = ?auto_140415 ?auto_140418 ) ) ( not ( = ?auto_140415 ?auto_140419 ) ) ( not ( = ?auto_140415 ?auto_140420 ) ) ( not ( = ?auto_140416 ?auto_140417 ) ) ( not ( = ?auto_140416 ?auto_140418 ) ) ( not ( = ?auto_140416 ?auto_140419 ) ) ( not ( = ?auto_140416 ?auto_140420 ) ) ( not ( = ?auto_140417 ?auto_140418 ) ) ( not ( = ?auto_140417 ?auto_140419 ) ) ( not ( = ?auto_140417 ?auto_140420 ) ) ( not ( = ?auto_140418 ?auto_140419 ) ) ( not ( = ?auto_140418 ?auto_140420 ) ) ( not ( = ?auto_140419 ?auto_140420 ) ) ( ON ?auto_140420 ?auto_140421 ) ( not ( = ?auto_140415 ?auto_140421 ) ) ( not ( = ?auto_140416 ?auto_140421 ) ) ( not ( = ?auto_140417 ?auto_140421 ) ) ( not ( = ?auto_140418 ?auto_140421 ) ) ( not ( = ?auto_140419 ?auto_140421 ) ) ( not ( = ?auto_140420 ?auto_140421 ) ) ( ON ?auto_140419 ?auto_140420 ) ( ON-TABLE ?auto_140422 ) ( ON ?auto_140421 ?auto_140422 ) ( not ( = ?auto_140422 ?auto_140421 ) ) ( not ( = ?auto_140422 ?auto_140420 ) ) ( not ( = ?auto_140422 ?auto_140419 ) ) ( not ( = ?auto_140415 ?auto_140422 ) ) ( not ( = ?auto_140416 ?auto_140422 ) ) ( not ( = ?auto_140417 ?auto_140422 ) ) ( not ( = ?auto_140418 ?auto_140422 ) ) ( ON ?auto_140415 ?auto_140423 ) ( not ( = ?auto_140415 ?auto_140423 ) ) ( not ( = ?auto_140416 ?auto_140423 ) ) ( not ( = ?auto_140417 ?auto_140423 ) ) ( not ( = ?auto_140418 ?auto_140423 ) ) ( not ( = ?auto_140419 ?auto_140423 ) ) ( not ( = ?auto_140420 ?auto_140423 ) ) ( not ( = ?auto_140421 ?auto_140423 ) ) ( not ( = ?auto_140422 ?auto_140423 ) ) ( ON ?auto_140416 ?auto_140415 ) ( ON-TABLE ?auto_140423 ) ( ON ?auto_140417 ?auto_140416 ) ( CLEAR ?auto_140419 ) ( ON ?auto_140418 ?auto_140417 ) ( CLEAR ?auto_140418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140423 ?auto_140415 ?auto_140416 ?auto_140417 )
      ( MAKE-6PILE ?auto_140415 ?auto_140416 ?auto_140417 ?auto_140418 ?auto_140419 ?auto_140420 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140424 - BLOCK
      ?auto_140425 - BLOCK
      ?auto_140426 - BLOCK
      ?auto_140427 - BLOCK
      ?auto_140428 - BLOCK
      ?auto_140429 - BLOCK
    )
    :vars
    (
      ?auto_140432 - BLOCK
      ?auto_140431 - BLOCK
      ?auto_140430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140424 ?auto_140425 ) ) ( not ( = ?auto_140424 ?auto_140426 ) ) ( not ( = ?auto_140424 ?auto_140427 ) ) ( not ( = ?auto_140424 ?auto_140428 ) ) ( not ( = ?auto_140424 ?auto_140429 ) ) ( not ( = ?auto_140425 ?auto_140426 ) ) ( not ( = ?auto_140425 ?auto_140427 ) ) ( not ( = ?auto_140425 ?auto_140428 ) ) ( not ( = ?auto_140425 ?auto_140429 ) ) ( not ( = ?auto_140426 ?auto_140427 ) ) ( not ( = ?auto_140426 ?auto_140428 ) ) ( not ( = ?auto_140426 ?auto_140429 ) ) ( not ( = ?auto_140427 ?auto_140428 ) ) ( not ( = ?auto_140427 ?auto_140429 ) ) ( not ( = ?auto_140428 ?auto_140429 ) ) ( ON ?auto_140429 ?auto_140432 ) ( not ( = ?auto_140424 ?auto_140432 ) ) ( not ( = ?auto_140425 ?auto_140432 ) ) ( not ( = ?auto_140426 ?auto_140432 ) ) ( not ( = ?auto_140427 ?auto_140432 ) ) ( not ( = ?auto_140428 ?auto_140432 ) ) ( not ( = ?auto_140429 ?auto_140432 ) ) ( ON-TABLE ?auto_140431 ) ( ON ?auto_140432 ?auto_140431 ) ( not ( = ?auto_140431 ?auto_140432 ) ) ( not ( = ?auto_140431 ?auto_140429 ) ) ( not ( = ?auto_140431 ?auto_140428 ) ) ( not ( = ?auto_140424 ?auto_140431 ) ) ( not ( = ?auto_140425 ?auto_140431 ) ) ( not ( = ?auto_140426 ?auto_140431 ) ) ( not ( = ?auto_140427 ?auto_140431 ) ) ( ON ?auto_140424 ?auto_140430 ) ( not ( = ?auto_140424 ?auto_140430 ) ) ( not ( = ?auto_140425 ?auto_140430 ) ) ( not ( = ?auto_140426 ?auto_140430 ) ) ( not ( = ?auto_140427 ?auto_140430 ) ) ( not ( = ?auto_140428 ?auto_140430 ) ) ( not ( = ?auto_140429 ?auto_140430 ) ) ( not ( = ?auto_140432 ?auto_140430 ) ) ( not ( = ?auto_140431 ?auto_140430 ) ) ( ON ?auto_140425 ?auto_140424 ) ( ON-TABLE ?auto_140430 ) ( ON ?auto_140426 ?auto_140425 ) ( ON ?auto_140427 ?auto_140426 ) ( CLEAR ?auto_140427 ) ( HOLDING ?auto_140428 ) ( CLEAR ?auto_140429 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140431 ?auto_140432 ?auto_140429 ?auto_140428 )
      ( MAKE-6PILE ?auto_140424 ?auto_140425 ?auto_140426 ?auto_140427 ?auto_140428 ?auto_140429 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140433 - BLOCK
      ?auto_140434 - BLOCK
      ?auto_140435 - BLOCK
      ?auto_140436 - BLOCK
      ?auto_140437 - BLOCK
      ?auto_140438 - BLOCK
    )
    :vars
    (
      ?auto_140440 - BLOCK
      ?auto_140439 - BLOCK
      ?auto_140441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140433 ?auto_140434 ) ) ( not ( = ?auto_140433 ?auto_140435 ) ) ( not ( = ?auto_140433 ?auto_140436 ) ) ( not ( = ?auto_140433 ?auto_140437 ) ) ( not ( = ?auto_140433 ?auto_140438 ) ) ( not ( = ?auto_140434 ?auto_140435 ) ) ( not ( = ?auto_140434 ?auto_140436 ) ) ( not ( = ?auto_140434 ?auto_140437 ) ) ( not ( = ?auto_140434 ?auto_140438 ) ) ( not ( = ?auto_140435 ?auto_140436 ) ) ( not ( = ?auto_140435 ?auto_140437 ) ) ( not ( = ?auto_140435 ?auto_140438 ) ) ( not ( = ?auto_140436 ?auto_140437 ) ) ( not ( = ?auto_140436 ?auto_140438 ) ) ( not ( = ?auto_140437 ?auto_140438 ) ) ( ON ?auto_140438 ?auto_140440 ) ( not ( = ?auto_140433 ?auto_140440 ) ) ( not ( = ?auto_140434 ?auto_140440 ) ) ( not ( = ?auto_140435 ?auto_140440 ) ) ( not ( = ?auto_140436 ?auto_140440 ) ) ( not ( = ?auto_140437 ?auto_140440 ) ) ( not ( = ?auto_140438 ?auto_140440 ) ) ( ON-TABLE ?auto_140439 ) ( ON ?auto_140440 ?auto_140439 ) ( not ( = ?auto_140439 ?auto_140440 ) ) ( not ( = ?auto_140439 ?auto_140438 ) ) ( not ( = ?auto_140439 ?auto_140437 ) ) ( not ( = ?auto_140433 ?auto_140439 ) ) ( not ( = ?auto_140434 ?auto_140439 ) ) ( not ( = ?auto_140435 ?auto_140439 ) ) ( not ( = ?auto_140436 ?auto_140439 ) ) ( ON ?auto_140433 ?auto_140441 ) ( not ( = ?auto_140433 ?auto_140441 ) ) ( not ( = ?auto_140434 ?auto_140441 ) ) ( not ( = ?auto_140435 ?auto_140441 ) ) ( not ( = ?auto_140436 ?auto_140441 ) ) ( not ( = ?auto_140437 ?auto_140441 ) ) ( not ( = ?auto_140438 ?auto_140441 ) ) ( not ( = ?auto_140440 ?auto_140441 ) ) ( not ( = ?auto_140439 ?auto_140441 ) ) ( ON ?auto_140434 ?auto_140433 ) ( ON-TABLE ?auto_140441 ) ( ON ?auto_140435 ?auto_140434 ) ( ON ?auto_140436 ?auto_140435 ) ( CLEAR ?auto_140438 ) ( ON ?auto_140437 ?auto_140436 ) ( CLEAR ?auto_140437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140441 ?auto_140433 ?auto_140434 ?auto_140435 ?auto_140436 )
      ( MAKE-6PILE ?auto_140433 ?auto_140434 ?auto_140435 ?auto_140436 ?auto_140437 ?auto_140438 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140442 - BLOCK
      ?auto_140443 - BLOCK
      ?auto_140444 - BLOCK
      ?auto_140445 - BLOCK
      ?auto_140446 - BLOCK
      ?auto_140447 - BLOCK
    )
    :vars
    (
      ?auto_140449 - BLOCK
      ?auto_140448 - BLOCK
      ?auto_140450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140442 ?auto_140443 ) ) ( not ( = ?auto_140442 ?auto_140444 ) ) ( not ( = ?auto_140442 ?auto_140445 ) ) ( not ( = ?auto_140442 ?auto_140446 ) ) ( not ( = ?auto_140442 ?auto_140447 ) ) ( not ( = ?auto_140443 ?auto_140444 ) ) ( not ( = ?auto_140443 ?auto_140445 ) ) ( not ( = ?auto_140443 ?auto_140446 ) ) ( not ( = ?auto_140443 ?auto_140447 ) ) ( not ( = ?auto_140444 ?auto_140445 ) ) ( not ( = ?auto_140444 ?auto_140446 ) ) ( not ( = ?auto_140444 ?auto_140447 ) ) ( not ( = ?auto_140445 ?auto_140446 ) ) ( not ( = ?auto_140445 ?auto_140447 ) ) ( not ( = ?auto_140446 ?auto_140447 ) ) ( not ( = ?auto_140442 ?auto_140449 ) ) ( not ( = ?auto_140443 ?auto_140449 ) ) ( not ( = ?auto_140444 ?auto_140449 ) ) ( not ( = ?auto_140445 ?auto_140449 ) ) ( not ( = ?auto_140446 ?auto_140449 ) ) ( not ( = ?auto_140447 ?auto_140449 ) ) ( ON-TABLE ?auto_140448 ) ( ON ?auto_140449 ?auto_140448 ) ( not ( = ?auto_140448 ?auto_140449 ) ) ( not ( = ?auto_140448 ?auto_140447 ) ) ( not ( = ?auto_140448 ?auto_140446 ) ) ( not ( = ?auto_140442 ?auto_140448 ) ) ( not ( = ?auto_140443 ?auto_140448 ) ) ( not ( = ?auto_140444 ?auto_140448 ) ) ( not ( = ?auto_140445 ?auto_140448 ) ) ( ON ?auto_140442 ?auto_140450 ) ( not ( = ?auto_140442 ?auto_140450 ) ) ( not ( = ?auto_140443 ?auto_140450 ) ) ( not ( = ?auto_140444 ?auto_140450 ) ) ( not ( = ?auto_140445 ?auto_140450 ) ) ( not ( = ?auto_140446 ?auto_140450 ) ) ( not ( = ?auto_140447 ?auto_140450 ) ) ( not ( = ?auto_140449 ?auto_140450 ) ) ( not ( = ?auto_140448 ?auto_140450 ) ) ( ON ?auto_140443 ?auto_140442 ) ( ON-TABLE ?auto_140450 ) ( ON ?auto_140444 ?auto_140443 ) ( ON ?auto_140445 ?auto_140444 ) ( ON ?auto_140446 ?auto_140445 ) ( CLEAR ?auto_140446 ) ( HOLDING ?auto_140447 ) ( CLEAR ?auto_140449 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140448 ?auto_140449 ?auto_140447 )
      ( MAKE-6PILE ?auto_140442 ?auto_140443 ?auto_140444 ?auto_140445 ?auto_140446 ?auto_140447 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140451 - BLOCK
      ?auto_140452 - BLOCK
      ?auto_140453 - BLOCK
      ?auto_140454 - BLOCK
      ?auto_140455 - BLOCK
      ?auto_140456 - BLOCK
    )
    :vars
    (
      ?auto_140457 - BLOCK
      ?auto_140459 - BLOCK
      ?auto_140458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140451 ?auto_140452 ) ) ( not ( = ?auto_140451 ?auto_140453 ) ) ( not ( = ?auto_140451 ?auto_140454 ) ) ( not ( = ?auto_140451 ?auto_140455 ) ) ( not ( = ?auto_140451 ?auto_140456 ) ) ( not ( = ?auto_140452 ?auto_140453 ) ) ( not ( = ?auto_140452 ?auto_140454 ) ) ( not ( = ?auto_140452 ?auto_140455 ) ) ( not ( = ?auto_140452 ?auto_140456 ) ) ( not ( = ?auto_140453 ?auto_140454 ) ) ( not ( = ?auto_140453 ?auto_140455 ) ) ( not ( = ?auto_140453 ?auto_140456 ) ) ( not ( = ?auto_140454 ?auto_140455 ) ) ( not ( = ?auto_140454 ?auto_140456 ) ) ( not ( = ?auto_140455 ?auto_140456 ) ) ( not ( = ?auto_140451 ?auto_140457 ) ) ( not ( = ?auto_140452 ?auto_140457 ) ) ( not ( = ?auto_140453 ?auto_140457 ) ) ( not ( = ?auto_140454 ?auto_140457 ) ) ( not ( = ?auto_140455 ?auto_140457 ) ) ( not ( = ?auto_140456 ?auto_140457 ) ) ( ON-TABLE ?auto_140459 ) ( ON ?auto_140457 ?auto_140459 ) ( not ( = ?auto_140459 ?auto_140457 ) ) ( not ( = ?auto_140459 ?auto_140456 ) ) ( not ( = ?auto_140459 ?auto_140455 ) ) ( not ( = ?auto_140451 ?auto_140459 ) ) ( not ( = ?auto_140452 ?auto_140459 ) ) ( not ( = ?auto_140453 ?auto_140459 ) ) ( not ( = ?auto_140454 ?auto_140459 ) ) ( ON ?auto_140451 ?auto_140458 ) ( not ( = ?auto_140451 ?auto_140458 ) ) ( not ( = ?auto_140452 ?auto_140458 ) ) ( not ( = ?auto_140453 ?auto_140458 ) ) ( not ( = ?auto_140454 ?auto_140458 ) ) ( not ( = ?auto_140455 ?auto_140458 ) ) ( not ( = ?auto_140456 ?auto_140458 ) ) ( not ( = ?auto_140457 ?auto_140458 ) ) ( not ( = ?auto_140459 ?auto_140458 ) ) ( ON ?auto_140452 ?auto_140451 ) ( ON-TABLE ?auto_140458 ) ( ON ?auto_140453 ?auto_140452 ) ( ON ?auto_140454 ?auto_140453 ) ( ON ?auto_140455 ?auto_140454 ) ( CLEAR ?auto_140457 ) ( ON ?auto_140456 ?auto_140455 ) ( CLEAR ?auto_140456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140458 ?auto_140451 ?auto_140452 ?auto_140453 ?auto_140454 ?auto_140455 )
      ( MAKE-6PILE ?auto_140451 ?auto_140452 ?auto_140453 ?auto_140454 ?auto_140455 ?auto_140456 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140460 - BLOCK
      ?auto_140461 - BLOCK
      ?auto_140462 - BLOCK
      ?auto_140463 - BLOCK
      ?auto_140464 - BLOCK
      ?auto_140465 - BLOCK
    )
    :vars
    (
      ?auto_140467 - BLOCK
      ?auto_140466 - BLOCK
      ?auto_140468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140460 ?auto_140461 ) ) ( not ( = ?auto_140460 ?auto_140462 ) ) ( not ( = ?auto_140460 ?auto_140463 ) ) ( not ( = ?auto_140460 ?auto_140464 ) ) ( not ( = ?auto_140460 ?auto_140465 ) ) ( not ( = ?auto_140461 ?auto_140462 ) ) ( not ( = ?auto_140461 ?auto_140463 ) ) ( not ( = ?auto_140461 ?auto_140464 ) ) ( not ( = ?auto_140461 ?auto_140465 ) ) ( not ( = ?auto_140462 ?auto_140463 ) ) ( not ( = ?auto_140462 ?auto_140464 ) ) ( not ( = ?auto_140462 ?auto_140465 ) ) ( not ( = ?auto_140463 ?auto_140464 ) ) ( not ( = ?auto_140463 ?auto_140465 ) ) ( not ( = ?auto_140464 ?auto_140465 ) ) ( not ( = ?auto_140460 ?auto_140467 ) ) ( not ( = ?auto_140461 ?auto_140467 ) ) ( not ( = ?auto_140462 ?auto_140467 ) ) ( not ( = ?auto_140463 ?auto_140467 ) ) ( not ( = ?auto_140464 ?auto_140467 ) ) ( not ( = ?auto_140465 ?auto_140467 ) ) ( ON-TABLE ?auto_140466 ) ( not ( = ?auto_140466 ?auto_140467 ) ) ( not ( = ?auto_140466 ?auto_140465 ) ) ( not ( = ?auto_140466 ?auto_140464 ) ) ( not ( = ?auto_140460 ?auto_140466 ) ) ( not ( = ?auto_140461 ?auto_140466 ) ) ( not ( = ?auto_140462 ?auto_140466 ) ) ( not ( = ?auto_140463 ?auto_140466 ) ) ( ON ?auto_140460 ?auto_140468 ) ( not ( = ?auto_140460 ?auto_140468 ) ) ( not ( = ?auto_140461 ?auto_140468 ) ) ( not ( = ?auto_140462 ?auto_140468 ) ) ( not ( = ?auto_140463 ?auto_140468 ) ) ( not ( = ?auto_140464 ?auto_140468 ) ) ( not ( = ?auto_140465 ?auto_140468 ) ) ( not ( = ?auto_140467 ?auto_140468 ) ) ( not ( = ?auto_140466 ?auto_140468 ) ) ( ON ?auto_140461 ?auto_140460 ) ( ON-TABLE ?auto_140468 ) ( ON ?auto_140462 ?auto_140461 ) ( ON ?auto_140463 ?auto_140462 ) ( ON ?auto_140464 ?auto_140463 ) ( ON ?auto_140465 ?auto_140464 ) ( CLEAR ?auto_140465 ) ( HOLDING ?auto_140467 ) ( CLEAR ?auto_140466 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140466 ?auto_140467 )
      ( MAKE-6PILE ?auto_140460 ?auto_140461 ?auto_140462 ?auto_140463 ?auto_140464 ?auto_140465 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140469 - BLOCK
      ?auto_140470 - BLOCK
      ?auto_140471 - BLOCK
      ?auto_140472 - BLOCK
      ?auto_140473 - BLOCK
      ?auto_140474 - BLOCK
    )
    :vars
    (
      ?auto_140475 - BLOCK
      ?auto_140477 - BLOCK
      ?auto_140476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140469 ?auto_140470 ) ) ( not ( = ?auto_140469 ?auto_140471 ) ) ( not ( = ?auto_140469 ?auto_140472 ) ) ( not ( = ?auto_140469 ?auto_140473 ) ) ( not ( = ?auto_140469 ?auto_140474 ) ) ( not ( = ?auto_140470 ?auto_140471 ) ) ( not ( = ?auto_140470 ?auto_140472 ) ) ( not ( = ?auto_140470 ?auto_140473 ) ) ( not ( = ?auto_140470 ?auto_140474 ) ) ( not ( = ?auto_140471 ?auto_140472 ) ) ( not ( = ?auto_140471 ?auto_140473 ) ) ( not ( = ?auto_140471 ?auto_140474 ) ) ( not ( = ?auto_140472 ?auto_140473 ) ) ( not ( = ?auto_140472 ?auto_140474 ) ) ( not ( = ?auto_140473 ?auto_140474 ) ) ( not ( = ?auto_140469 ?auto_140475 ) ) ( not ( = ?auto_140470 ?auto_140475 ) ) ( not ( = ?auto_140471 ?auto_140475 ) ) ( not ( = ?auto_140472 ?auto_140475 ) ) ( not ( = ?auto_140473 ?auto_140475 ) ) ( not ( = ?auto_140474 ?auto_140475 ) ) ( ON-TABLE ?auto_140477 ) ( not ( = ?auto_140477 ?auto_140475 ) ) ( not ( = ?auto_140477 ?auto_140474 ) ) ( not ( = ?auto_140477 ?auto_140473 ) ) ( not ( = ?auto_140469 ?auto_140477 ) ) ( not ( = ?auto_140470 ?auto_140477 ) ) ( not ( = ?auto_140471 ?auto_140477 ) ) ( not ( = ?auto_140472 ?auto_140477 ) ) ( ON ?auto_140469 ?auto_140476 ) ( not ( = ?auto_140469 ?auto_140476 ) ) ( not ( = ?auto_140470 ?auto_140476 ) ) ( not ( = ?auto_140471 ?auto_140476 ) ) ( not ( = ?auto_140472 ?auto_140476 ) ) ( not ( = ?auto_140473 ?auto_140476 ) ) ( not ( = ?auto_140474 ?auto_140476 ) ) ( not ( = ?auto_140475 ?auto_140476 ) ) ( not ( = ?auto_140477 ?auto_140476 ) ) ( ON ?auto_140470 ?auto_140469 ) ( ON-TABLE ?auto_140476 ) ( ON ?auto_140471 ?auto_140470 ) ( ON ?auto_140472 ?auto_140471 ) ( ON ?auto_140473 ?auto_140472 ) ( ON ?auto_140474 ?auto_140473 ) ( CLEAR ?auto_140477 ) ( ON ?auto_140475 ?auto_140474 ) ( CLEAR ?auto_140475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140476 ?auto_140469 ?auto_140470 ?auto_140471 ?auto_140472 ?auto_140473 ?auto_140474 )
      ( MAKE-6PILE ?auto_140469 ?auto_140470 ?auto_140471 ?auto_140472 ?auto_140473 ?auto_140474 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140478 - BLOCK
      ?auto_140479 - BLOCK
      ?auto_140480 - BLOCK
      ?auto_140481 - BLOCK
      ?auto_140482 - BLOCK
      ?auto_140483 - BLOCK
    )
    :vars
    (
      ?auto_140484 - BLOCK
      ?auto_140486 - BLOCK
      ?auto_140485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140478 ?auto_140479 ) ) ( not ( = ?auto_140478 ?auto_140480 ) ) ( not ( = ?auto_140478 ?auto_140481 ) ) ( not ( = ?auto_140478 ?auto_140482 ) ) ( not ( = ?auto_140478 ?auto_140483 ) ) ( not ( = ?auto_140479 ?auto_140480 ) ) ( not ( = ?auto_140479 ?auto_140481 ) ) ( not ( = ?auto_140479 ?auto_140482 ) ) ( not ( = ?auto_140479 ?auto_140483 ) ) ( not ( = ?auto_140480 ?auto_140481 ) ) ( not ( = ?auto_140480 ?auto_140482 ) ) ( not ( = ?auto_140480 ?auto_140483 ) ) ( not ( = ?auto_140481 ?auto_140482 ) ) ( not ( = ?auto_140481 ?auto_140483 ) ) ( not ( = ?auto_140482 ?auto_140483 ) ) ( not ( = ?auto_140478 ?auto_140484 ) ) ( not ( = ?auto_140479 ?auto_140484 ) ) ( not ( = ?auto_140480 ?auto_140484 ) ) ( not ( = ?auto_140481 ?auto_140484 ) ) ( not ( = ?auto_140482 ?auto_140484 ) ) ( not ( = ?auto_140483 ?auto_140484 ) ) ( not ( = ?auto_140486 ?auto_140484 ) ) ( not ( = ?auto_140486 ?auto_140483 ) ) ( not ( = ?auto_140486 ?auto_140482 ) ) ( not ( = ?auto_140478 ?auto_140486 ) ) ( not ( = ?auto_140479 ?auto_140486 ) ) ( not ( = ?auto_140480 ?auto_140486 ) ) ( not ( = ?auto_140481 ?auto_140486 ) ) ( ON ?auto_140478 ?auto_140485 ) ( not ( = ?auto_140478 ?auto_140485 ) ) ( not ( = ?auto_140479 ?auto_140485 ) ) ( not ( = ?auto_140480 ?auto_140485 ) ) ( not ( = ?auto_140481 ?auto_140485 ) ) ( not ( = ?auto_140482 ?auto_140485 ) ) ( not ( = ?auto_140483 ?auto_140485 ) ) ( not ( = ?auto_140484 ?auto_140485 ) ) ( not ( = ?auto_140486 ?auto_140485 ) ) ( ON ?auto_140479 ?auto_140478 ) ( ON-TABLE ?auto_140485 ) ( ON ?auto_140480 ?auto_140479 ) ( ON ?auto_140481 ?auto_140480 ) ( ON ?auto_140482 ?auto_140481 ) ( ON ?auto_140483 ?auto_140482 ) ( ON ?auto_140484 ?auto_140483 ) ( CLEAR ?auto_140484 ) ( HOLDING ?auto_140486 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140486 )
      ( MAKE-6PILE ?auto_140478 ?auto_140479 ?auto_140480 ?auto_140481 ?auto_140482 ?auto_140483 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_140487 - BLOCK
      ?auto_140488 - BLOCK
      ?auto_140489 - BLOCK
      ?auto_140490 - BLOCK
      ?auto_140491 - BLOCK
      ?auto_140492 - BLOCK
    )
    :vars
    (
      ?auto_140493 - BLOCK
      ?auto_140495 - BLOCK
      ?auto_140494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140487 ?auto_140488 ) ) ( not ( = ?auto_140487 ?auto_140489 ) ) ( not ( = ?auto_140487 ?auto_140490 ) ) ( not ( = ?auto_140487 ?auto_140491 ) ) ( not ( = ?auto_140487 ?auto_140492 ) ) ( not ( = ?auto_140488 ?auto_140489 ) ) ( not ( = ?auto_140488 ?auto_140490 ) ) ( not ( = ?auto_140488 ?auto_140491 ) ) ( not ( = ?auto_140488 ?auto_140492 ) ) ( not ( = ?auto_140489 ?auto_140490 ) ) ( not ( = ?auto_140489 ?auto_140491 ) ) ( not ( = ?auto_140489 ?auto_140492 ) ) ( not ( = ?auto_140490 ?auto_140491 ) ) ( not ( = ?auto_140490 ?auto_140492 ) ) ( not ( = ?auto_140491 ?auto_140492 ) ) ( not ( = ?auto_140487 ?auto_140493 ) ) ( not ( = ?auto_140488 ?auto_140493 ) ) ( not ( = ?auto_140489 ?auto_140493 ) ) ( not ( = ?auto_140490 ?auto_140493 ) ) ( not ( = ?auto_140491 ?auto_140493 ) ) ( not ( = ?auto_140492 ?auto_140493 ) ) ( not ( = ?auto_140495 ?auto_140493 ) ) ( not ( = ?auto_140495 ?auto_140492 ) ) ( not ( = ?auto_140495 ?auto_140491 ) ) ( not ( = ?auto_140487 ?auto_140495 ) ) ( not ( = ?auto_140488 ?auto_140495 ) ) ( not ( = ?auto_140489 ?auto_140495 ) ) ( not ( = ?auto_140490 ?auto_140495 ) ) ( ON ?auto_140487 ?auto_140494 ) ( not ( = ?auto_140487 ?auto_140494 ) ) ( not ( = ?auto_140488 ?auto_140494 ) ) ( not ( = ?auto_140489 ?auto_140494 ) ) ( not ( = ?auto_140490 ?auto_140494 ) ) ( not ( = ?auto_140491 ?auto_140494 ) ) ( not ( = ?auto_140492 ?auto_140494 ) ) ( not ( = ?auto_140493 ?auto_140494 ) ) ( not ( = ?auto_140495 ?auto_140494 ) ) ( ON ?auto_140488 ?auto_140487 ) ( ON-TABLE ?auto_140494 ) ( ON ?auto_140489 ?auto_140488 ) ( ON ?auto_140490 ?auto_140489 ) ( ON ?auto_140491 ?auto_140490 ) ( ON ?auto_140492 ?auto_140491 ) ( ON ?auto_140493 ?auto_140492 ) ( ON ?auto_140495 ?auto_140493 ) ( CLEAR ?auto_140495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140494 ?auto_140487 ?auto_140488 ?auto_140489 ?auto_140490 ?auto_140491 ?auto_140492 ?auto_140493 )
      ( MAKE-6PILE ?auto_140487 ?auto_140488 ?auto_140489 ?auto_140490 ?auto_140491 ?auto_140492 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140497 - BLOCK
    )
    :vars
    (
      ?auto_140498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140498 ?auto_140497 ) ( CLEAR ?auto_140498 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140497 ) ( not ( = ?auto_140497 ?auto_140498 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140498 ?auto_140497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140499 - BLOCK
    )
    :vars
    (
      ?auto_140500 - BLOCK
      ?auto_140501 - BLOCK
      ?auto_140502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140500 ?auto_140499 ) ( CLEAR ?auto_140500 ) ( ON-TABLE ?auto_140499 ) ( not ( = ?auto_140499 ?auto_140500 ) ) ( HOLDING ?auto_140501 ) ( CLEAR ?auto_140502 ) ( not ( = ?auto_140499 ?auto_140501 ) ) ( not ( = ?auto_140499 ?auto_140502 ) ) ( not ( = ?auto_140500 ?auto_140501 ) ) ( not ( = ?auto_140500 ?auto_140502 ) ) ( not ( = ?auto_140501 ?auto_140502 ) ) )
    :subtasks
    ( ( !STACK ?auto_140501 ?auto_140502 )
      ( MAKE-1PILE ?auto_140499 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140503 - BLOCK
    )
    :vars
    (
      ?auto_140504 - BLOCK
      ?auto_140505 - BLOCK
      ?auto_140506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140504 ?auto_140503 ) ( ON-TABLE ?auto_140503 ) ( not ( = ?auto_140503 ?auto_140504 ) ) ( CLEAR ?auto_140505 ) ( not ( = ?auto_140503 ?auto_140506 ) ) ( not ( = ?auto_140503 ?auto_140505 ) ) ( not ( = ?auto_140504 ?auto_140506 ) ) ( not ( = ?auto_140504 ?auto_140505 ) ) ( not ( = ?auto_140506 ?auto_140505 ) ) ( ON ?auto_140506 ?auto_140504 ) ( CLEAR ?auto_140506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140503 ?auto_140504 )
      ( MAKE-1PILE ?auto_140503 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140507 - BLOCK
    )
    :vars
    (
      ?auto_140508 - BLOCK
      ?auto_140509 - BLOCK
      ?auto_140510 - BLOCK
      ?auto_140512 - BLOCK
      ?auto_140513 - BLOCK
      ?auto_140514 - BLOCK
      ?auto_140511 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140508 ?auto_140507 ) ( ON-TABLE ?auto_140507 ) ( not ( = ?auto_140507 ?auto_140508 ) ) ( not ( = ?auto_140507 ?auto_140509 ) ) ( not ( = ?auto_140507 ?auto_140510 ) ) ( not ( = ?auto_140508 ?auto_140509 ) ) ( not ( = ?auto_140508 ?auto_140510 ) ) ( not ( = ?auto_140509 ?auto_140510 ) ) ( ON ?auto_140509 ?auto_140508 ) ( CLEAR ?auto_140509 ) ( HOLDING ?auto_140510 ) ( CLEAR ?auto_140512 ) ( ON-TABLE ?auto_140513 ) ( ON ?auto_140514 ?auto_140513 ) ( ON ?auto_140511 ?auto_140514 ) ( ON ?auto_140512 ?auto_140511 ) ( not ( = ?auto_140513 ?auto_140514 ) ) ( not ( = ?auto_140513 ?auto_140511 ) ) ( not ( = ?auto_140513 ?auto_140512 ) ) ( not ( = ?auto_140513 ?auto_140510 ) ) ( not ( = ?auto_140514 ?auto_140511 ) ) ( not ( = ?auto_140514 ?auto_140512 ) ) ( not ( = ?auto_140514 ?auto_140510 ) ) ( not ( = ?auto_140511 ?auto_140512 ) ) ( not ( = ?auto_140511 ?auto_140510 ) ) ( not ( = ?auto_140512 ?auto_140510 ) ) ( not ( = ?auto_140507 ?auto_140512 ) ) ( not ( = ?auto_140507 ?auto_140513 ) ) ( not ( = ?auto_140507 ?auto_140514 ) ) ( not ( = ?auto_140507 ?auto_140511 ) ) ( not ( = ?auto_140508 ?auto_140512 ) ) ( not ( = ?auto_140508 ?auto_140513 ) ) ( not ( = ?auto_140508 ?auto_140514 ) ) ( not ( = ?auto_140508 ?auto_140511 ) ) ( not ( = ?auto_140509 ?auto_140512 ) ) ( not ( = ?auto_140509 ?auto_140513 ) ) ( not ( = ?auto_140509 ?auto_140514 ) ) ( not ( = ?auto_140509 ?auto_140511 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140513 ?auto_140514 ?auto_140511 ?auto_140512 ?auto_140510 )
      ( MAKE-1PILE ?auto_140507 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140515 - BLOCK
    )
    :vars
    (
      ?auto_140519 - BLOCK
      ?auto_140521 - BLOCK
      ?auto_140520 - BLOCK
      ?auto_140518 - BLOCK
      ?auto_140522 - BLOCK
      ?auto_140516 - BLOCK
      ?auto_140517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140519 ?auto_140515 ) ( ON-TABLE ?auto_140515 ) ( not ( = ?auto_140515 ?auto_140519 ) ) ( not ( = ?auto_140515 ?auto_140521 ) ) ( not ( = ?auto_140515 ?auto_140520 ) ) ( not ( = ?auto_140519 ?auto_140521 ) ) ( not ( = ?auto_140519 ?auto_140520 ) ) ( not ( = ?auto_140521 ?auto_140520 ) ) ( ON ?auto_140521 ?auto_140519 ) ( CLEAR ?auto_140518 ) ( ON-TABLE ?auto_140522 ) ( ON ?auto_140516 ?auto_140522 ) ( ON ?auto_140517 ?auto_140516 ) ( ON ?auto_140518 ?auto_140517 ) ( not ( = ?auto_140522 ?auto_140516 ) ) ( not ( = ?auto_140522 ?auto_140517 ) ) ( not ( = ?auto_140522 ?auto_140518 ) ) ( not ( = ?auto_140522 ?auto_140520 ) ) ( not ( = ?auto_140516 ?auto_140517 ) ) ( not ( = ?auto_140516 ?auto_140518 ) ) ( not ( = ?auto_140516 ?auto_140520 ) ) ( not ( = ?auto_140517 ?auto_140518 ) ) ( not ( = ?auto_140517 ?auto_140520 ) ) ( not ( = ?auto_140518 ?auto_140520 ) ) ( not ( = ?auto_140515 ?auto_140518 ) ) ( not ( = ?auto_140515 ?auto_140522 ) ) ( not ( = ?auto_140515 ?auto_140516 ) ) ( not ( = ?auto_140515 ?auto_140517 ) ) ( not ( = ?auto_140519 ?auto_140518 ) ) ( not ( = ?auto_140519 ?auto_140522 ) ) ( not ( = ?auto_140519 ?auto_140516 ) ) ( not ( = ?auto_140519 ?auto_140517 ) ) ( not ( = ?auto_140521 ?auto_140518 ) ) ( not ( = ?auto_140521 ?auto_140522 ) ) ( not ( = ?auto_140521 ?auto_140516 ) ) ( not ( = ?auto_140521 ?auto_140517 ) ) ( ON ?auto_140520 ?auto_140521 ) ( CLEAR ?auto_140520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140515 ?auto_140519 ?auto_140521 )
      ( MAKE-1PILE ?auto_140515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140523 - BLOCK
    )
    :vars
    (
      ?auto_140530 - BLOCK
      ?auto_140526 - BLOCK
      ?auto_140529 - BLOCK
      ?auto_140527 - BLOCK
      ?auto_140528 - BLOCK
      ?auto_140525 - BLOCK
      ?auto_140524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140530 ?auto_140523 ) ( ON-TABLE ?auto_140523 ) ( not ( = ?auto_140523 ?auto_140530 ) ) ( not ( = ?auto_140523 ?auto_140526 ) ) ( not ( = ?auto_140523 ?auto_140529 ) ) ( not ( = ?auto_140530 ?auto_140526 ) ) ( not ( = ?auto_140530 ?auto_140529 ) ) ( not ( = ?auto_140526 ?auto_140529 ) ) ( ON ?auto_140526 ?auto_140530 ) ( ON-TABLE ?auto_140527 ) ( ON ?auto_140528 ?auto_140527 ) ( ON ?auto_140525 ?auto_140528 ) ( not ( = ?auto_140527 ?auto_140528 ) ) ( not ( = ?auto_140527 ?auto_140525 ) ) ( not ( = ?auto_140527 ?auto_140524 ) ) ( not ( = ?auto_140527 ?auto_140529 ) ) ( not ( = ?auto_140528 ?auto_140525 ) ) ( not ( = ?auto_140528 ?auto_140524 ) ) ( not ( = ?auto_140528 ?auto_140529 ) ) ( not ( = ?auto_140525 ?auto_140524 ) ) ( not ( = ?auto_140525 ?auto_140529 ) ) ( not ( = ?auto_140524 ?auto_140529 ) ) ( not ( = ?auto_140523 ?auto_140524 ) ) ( not ( = ?auto_140523 ?auto_140527 ) ) ( not ( = ?auto_140523 ?auto_140528 ) ) ( not ( = ?auto_140523 ?auto_140525 ) ) ( not ( = ?auto_140530 ?auto_140524 ) ) ( not ( = ?auto_140530 ?auto_140527 ) ) ( not ( = ?auto_140530 ?auto_140528 ) ) ( not ( = ?auto_140530 ?auto_140525 ) ) ( not ( = ?auto_140526 ?auto_140524 ) ) ( not ( = ?auto_140526 ?auto_140527 ) ) ( not ( = ?auto_140526 ?auto_140528 ) ) ( not ( = ?auto_140526 ?auto_140525 ) ) ( ON ?auto_140529 ?auto_140526 ) ( CLEAR ?auto_140529 ) ( HOLDING ?auto_140524 ) ( CLEAR ?auto_140525 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140527 ?auto_140528 ?auto_140525 ?auto_140524 )
      ( MAKE-1PILE ?auto_140523 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140531 - BLOCK
    )
    :vars
    (
      ?auto_140534 - BLOCK
      ?auto_140532 - BLOCK
      ?auto_140535 - BLOCK
      ?auto_140536 - BLOCK
      ?auto_140533 - BLOCK
      ?auto_140538 - BLOCK
      ?auto_140537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140534 ?auto_140531 ) ( ON-TABLE ?auto_140531 ) ( not ( = ?auto_140531 ?auto_140534 ) ) ( not ( = ?auto_140531 ?auto_140532 ) ) ( not ( = ?auto_140531 ?auto_140535 ) ) ( not ( = ?auto_140534 ?auto_140532 ) ) ( not ( = ?auto_140534 ?auto_140535 ) ) ( not ( = ?auto_140532 ?auto_140535 ) ) ( ON ?auto_140532 ?auto_140534 ) ( ON-TABLE ?auto_140536 ) ( ON ?auto_140533 ?auto_140536 ) ( ON ?auto_140538 ?auto_140533 ) ( not ( = ?auto_140536 ?auto_140533 ) ) ( not ( = ?auto_140536 ?auto_140538 ) ) ( not ( = ?auto_140536 ?auto_140537 ) ) ( not ( = ?auto_140536 ?auto_140535 ) ) ( not ( = ?auto_140533 ?auto_140538 ) ) ( not ( = ?auto_140533 ?auto_140537 ) ) ( not ( = ?auto_140533 ?auto_140535 ) ) ( not ( = ?auto_140538 ?auto_140537 ) ) ( not ( = ?auto_140538 ?auto_140535 ) ) ( not ( = ?auto_140537 ?auto_140535 ) ) ( not ( = ?auto_140531 ?auto_140537 ) ) ( not ( = ?auto_140531 ?auto_140536 ) ) ( not ( = ?auto_140531 ?auto_140533 ) ) ( not ( = ?auto_140531 ?auto_140538 ) ) ( not ( = ?auto_140534 ?auto_140537 ) ) ( not ( = ?auto_140534 ?auto_140536 ) ) ( not ( = ?auto_140534 ?auto_140533 ) ) ( not ( = ?auto_140534 ?auto_140538 ) ) ( not ( = ?auto_140532 ?auto_140537 ) ) ( not ( = ?auto_140532 ?auto_140536 ) ) ( not ( = ?auto_140532 ?auto_140533 ) ) ( not ( = ?auto_140532 ?auto_140538 ) ) ( ON ?auto_140535 ?auto_140532 ) ( CLEAR ?auto_140538 ) ( ON ?auto_140537 ?auto_140535 ) ( CLEAR ?auto_140537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140531 ?auto_140534 ?auto_140532 ?auto_140535 )
      ( MAKE-1PILE ?auto_140531 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140539 - BLOCK
    )
    :vars
    (
      ?auto_140540 - BLOCK
      ?auto_140544 - BLOCK
      ?auto_140543 - BLOCK
      ?auto_140546 - BLOCK
      ?auto_140545 - BLOCK
      ?auto_140542 - BLOCK
      ?auto_140541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140540 ?auto_140539 ) ( ON-TABLE ?auto_140539 ) ( not ( = ?auto_140539 ?auto_140540 ) ) ( not ( = ?auto_140539 ?auto_140544 ) ) ( not ( = ?auto_140539 ?auto_140543 ) ) ( not ( = ?auto_140540 ?auto_140544 ) ) ( not ( = ?auto_140540 ?auto_140543 ) ) ( not ( = ?auto_140544 ?auto_140543 ) ) ( ON ?auto_140544 ?auto_140540 ) ( ON-TABLE ?auto_140546 ) ( ON ?auto_140545 ?auto_140546 ) ( not ( = ?auto_140546 ?auto_140545 ) ) ( not ( = ?auto_140546 ?auto_140542 ) ) ( not ( = ?auto_140546 ?auto_140541 ) ) ( not ( = ?auto_140546 ?auto_140543 ) ) ( not ( = ?auto_140545 ?auto_140542 ) ) ( not ( = ?auto_140545 ?auto_140541 ) ) ( not ( = ?auto_140545 ?auto_140543 ) ) ( not ( = ?auto_140542 ?auto_140541 ) ) ( not ( = ?auto_140542 ?auto_140543 ) ) ( not ( = ?auto_140541 ?auto_140543 ) ) ( not ( = ?auto_140539 ?auto_140541 ) ) ( not ( = ?auto_140539 ?auto_140546 ) ) ( not ( = ?auto_140539 ?auto_140545 ) ) ( not ( = ?auto_140539 ?auto_140542 ) ) ( not ( = ?auto_140540 ?auto_140541 ) ) ( not ( = ?auto_140540 ?auto_140546 ) ) ( not ( = ?auto_140540 ?auto_140545 ) ) ( not ( = ?auto_140540 ?auto_140542 ) ) ( not ( = ?auto_140544 ?auto_140541 ) ) ( not ( = ?auto_140544 ?auto_140546 ) ) ( not ( = ?auto_140544 ?auto_140545 ) ) ( not ( = ?auto_140544 ?auto_140542 ) ) ( ON ?auto_140543 ?auto_140544 ) ( ON ?auto_140541 ?auto_140543 ) ( CLEAR ?auto_140541 ) ( HOLDING ?auto_140542 ) ( CLEAR ?auto_140545 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140546 ?auto_140545 ?auto_140542 )
      ( MAKE-1PILE ?auto_140539 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140547 - BLOCK
    )
    :vars
    (
      ?auto_140551 - BLOCK
      ?auto_140552 - BLOCK
      ?auto_140553 - BLOCK
      ?auto_140548 - BLOCK
      ?auto_140554 - BLOCK
      ?auto_140550 - BLOCK
      ?auto_140549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140551 ?auto_140547 ) ( ON-TABLE ?auto_140547 ) ( not ( = ?auto_140547 ?auto_140551 ) ) ( not ( = ?auto_140547 ?auto_140552 ) ) ( not ( = ?auto_140547 ?auto_140553 ) ) ( not ( = ?auto_140551 ?auto_140552 ) ) ( not ( = ?auto_140551 ?auto_140553 ) ) ( not ( = ?auto_140552 ?auto_140553 ) ) ( ON ?auto_140552 ?auto_140551 ) ( ON-TABLE ?auto_140548 ) ( ON ?auto_140554 ?auto_140548 ) ( not ( = ?auto_140548 ?auto_140554 ) ) ( not ( = ?auto_140548 ?auto_140550 ) ) ( not ( = ?auto_140548 ?auto_140549 ) ) ( not ( = ?auto_140548 ?auto_140553 ) ) ( not ( = ?auto_140554 ?auto_140550 ) ) ( not ( = ?auto_140554 ?auto_140549 ) ) ( not ( = ?auto_140554 ?auto_140553 ) ) ( not ( = ?auto_140550 ?auto_140549 ) ) ( not ( = ?auto_140550 ?auto_140553 ) ) ( not ( = ?auto_140549 ?auto_140553 ) ) ( not ( = ?auto_140547 ?auto_140549 ) ) ( not ( = ?auto_140547 ?auto_140548 ) ) ( not ( = ?auto_140547 ?auto_140554 ) ) ( not ( = ?auto_140547 ?auto_140550 ) ) ( not ( = ?auto_140551 ?auto_140549 ) ) ( not ( = ?auto_140551 ?auto_140548 ) ) ( not ( = ?auto_140551 ?auto_140554 ) ) ( not ( = ?auto_140551 ?auto_140550 ) ) ( not ( = ?auto_140552 ?auto_140549 ) ) ( not ( = ?auto_140552 ?auto_140548 ) ) ( not ( = ?auto_140552 ?auto_140554 ) ) ( not ( = ?auto_140552 ?auto_140550 ) ) ( ON ?auto_140553 ?auto_140552 ) ( ON ?auto_140549 ?auto_140553 ) ( CLEAR ?auto_140554 ) ( ON ?auto_140550 ?auto_140549 ) ( CLEAR ?auto_140550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140547 ?auto_140551 ?auto_140552 ?auto_140553 ?auto_140549 )
      ( MAKE-1PILE ?auto_140547 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140555 - BLOCK
    )
    :vars
    (
      ?auto_140562 - BLOCK
      ?auto_140559 - BLOCK
      ?auto_140561 - BLOCK
      ?auto_140557 - BLOCK
      ?auto_140558 - BLOCK
      ?auto_140556 - BLOCK
      ?auto_140560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140562 ?auto_140555 ) ( ON-TABLE ?auto_140555 ) ( not ( = ?auto_140555 ?auto_140562 ) ) ( not ( = ?auto_140555 ?auto_140559 ) ) ( not ( = ?auto_140555 ?auto_140561 ) ) ( not ( = ?auto_140562 ?auto_140559 ) ) ( not ( = ?auto_140562 ?auto_140561 ) ) ( not ( = ?auto_140559 ?auto_140561 ) ) ( ON ?auto_140559 ?auto_140562 ) ( ON-TABLE ?auto_140557 ) ( not ( = ?auto_140557 ?auto_140558 ) ) ( not ( = ?auto_140557 ?auto_140556 ) ) ( not ( = ?auto_140557 ?auto_140560 ) ) ( not ( = ?auto_140557 ?auto_140561 ) ) ( not ( = ?auto_140558 ?auto_140556 ) ) ( not ( = ?auto_140558 ?auto_140560 ) ) ( not ( = ?auto_140558 ?auto_140561 ) ) ( not ( = ?auto_140556 ?auto_140560 ) ) ( not ( = ?auto_140556 ?auto_140561 ) ) ( not ( = ?auto_140560 ?auto_140561 ) ) ( not ( = ?auto_140555 ?auto_140560 ) ) ( not ( = ?auto_140555 ?auto_140557 ) ) ( not ( = ?auto_140555 ?auto_140558 ) ) ( not ( = ?auto_140555 ?auto_140556 ) ) ( not ( = ?auto_140562 ?auto_140560 ) ) ( not ( = ?auto_140562 ?auto_140557 ) ) ( not ( = ?auto_140562 ?auto_140558 ) ) ( not ( = ?auto_140562 ?auto_140556 ) ) ( not ( = ?auto_140559 ?auto_140560 ) ) ( not ( = ?auto_140559 ?auto_140557 ) ) ( not ( = ?auto_140559 ?auto_140558 ) ) ( not ( = ?auto_140559 ?auto_140556 ) ) ( ON ?auto_140561 ?auto_140559 ) ( ON ?auto_140560 ?auto_140561 ) ( ON ?auto_140556 ?auto_140560 ) ( CLEAR ?auto_140556 ) ( HOLDING ?auto_140558 ) ( CLEAR ?auto_140557 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140557 ?auto_140558 )
      ( MAKE-1PILE ?auto_140555 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140563 - BLOCK
    )
    :vars
    (
      ?auto_140569 - BLOCK
      ?auto_140565 - BLOCK
      ?auto_140568 - BLOCK
      ?auto_140564 - BLOCK
      ?auto_140566 - BLOCK
      ?auto_140567 - BLOCK
      ?auto_140570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140569 ?auto_140563 ) ( ON-TABLE ?auto_140563 ) ( not ( = ?auto_140563 ?auto_140569 ) ) ( not ( = ?auto_140563 ?auto_140565 ) ) ( not ( = ?auto_140563 ?auto_140568 ) ) ( not ( = ?auto_140569 ?auto_140565 ) ) ( not ( = ?auto_140569 ?auto_140568 ) ) ( not ( = ?auto_140565 ?auto_140568 ) ) ( ON ?auto_140565 ?auto_140569 ) ( ON-TABLE ?auto_140564 ) ( not ( = ?auto_140564 ?auto_140566 ) ) ( not ( = ?auto_140564 ?auto_140567 ) ) ( not ( = ?auto_140564 ?auto_140570 ) ) ( not ( = ?auto_140564 ?auto_140568 ) ) ( not ( = ?auto_140566 ?auto_140567 ) ) ( not ( = ?auto_140566 ?auto_140570 ) ) ( not ( = ?auto_140566 ?auto_140568 ) ) ( not ( = ?auto_140567 ?auto_140570 ) ) ( not ( = ?auto_140567 ?auto_140568 ) ) ( not ( = ?auto_140570 ?auto_140568 ) ) ( not ( = ?auto_140563 ?auto_140570 ) ) ( not ( = ?auto_140563 ?auto_140564 ) ) ( not ( = ?auto_140563 ?auto_140566 ) ) ( not ( = ?auto_140563 ?auto_140567 ) ) ( not ( = ?auto_140569 ?auto_140570 ) ) ( not ( = ?auto_140569 ?auto_140564 ) ) ( not ( = ?auto_140569 ?auto_140566 ) ) ( not ( = ?auto_140569 ?auto_140567 ) ) ( not ( = ?auto_140565 ?auto_140570 ) ) ( not ( = ?auto_140565 ?auto_140564 ) ) ( not ( = ?auto_140565 ?auto_140566 ) ) ( not ( = ?auto_140565 ?auto_140567 ) ) ( ON ?auto_140568 ?auto_140565 ) ( ON ?auto_140570 ?auto_140568 ) ( ON ?auto_140567 ?auto_140570 ) ( CLEAR ?auto_140564 ) ( ON ?auto_140566 ?auto_140567 ) ( CLEAR ?auto_140566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140563 ?auto_140569 ?auto_140565 ?auto_140568 ?auto_140570 ?auto_140567 )
      ( MAKE-1PILE ?auto_140563 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140571 - BLOCK
    )
    :vars
    (
      ?auto_140578 - BLOCK
      ?auto_140576 - BLOCK
      ?auto_140575 - BLOCK
      ?auto_140573 - BLOCK
      ?auto_140577 - BLOCK
      ?auto_140574 - BLOCK
      ?auto_140572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140578 ?auto_140571 ) ( ON-TABLE ?auto_140571 ) ( not ( = ?auto_140571 ?auto_140578 ) ) ( not ( = ?auto_140571 ?auto_140576 ) ) ( not ( = ?auto_140571 ?auto_140575 ) ) ( not ( = ?auto_140578 ?auto_140576 ) ) ( not ( = ?auto_140578 ?auto_140575 ) ) ( not ( = ?auto_140576 ?auto_140575 ) ) ( ON ?auto_140576 ?auto_140578 ) ( not ( = ?auto_140573 ?auto_140577 ) ) ( not ( = ?auto_140573 ?auto_140574 ) ) ( not ( = ?auto_140573 ?auto_140572 ) ) ( not ( = ?auto_140573 ?auto_140575 ) ) ( not ( = ?auto_140577 ?auto_140574 ) ) ( not ( = ?auto_140577 ?auto_140572 ) ) ( not ( = ?auto_140577 ?auto_140575 ) ) ( not ( = ?auto_140574 ?auto_140572 ) ) ( not ( = ?auto_140574 ?auto_140575 ) ) ( not ( = ?auto_140572 ?auto_140575 ) ) ( not ( = ?auto_140571 ?auto_140572 ) ) ( not ( = ?auto_140571 ?auto_140573 ) ) ( not ( = ?auto_140571 ?auto_140577 ) ) ( not ( = ?auto_140571 ?auto_140574 ) ) ( not ( = ?auto_140578 ?auto_140572 ) ) ( not ( = ?auto_140578 ?auto_140573 ) ) ( not ( = ?auto_140578 ?auto_140577 ) ) ( not ( = ?auto_140578 ?auto_140574 ) ) ( not ( = ?auto_140576 ?auto_140572 ) ) ( not ( = ?auto_140576 ?auto_140573 ) ) ( not ( = ?auto_140576 ?auto_140577 ) ) ( not ( = ?auto_140576 ?auto_140574 ) ) ( ON ?auto_140575 ?auto_140576 ) ( ON ?auto_140572 ?auto_140575 ) ( ON ?auto_140574 ?auto_140572 ) ( ON ?auto_140577 ?auto_140574 ) ( CLEAR ?auto_140577 ) ( HOLDING ?auto_140573 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140573 )
      ( MAKE-1PILE ?auto_140571 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140579 - BLOCK
    )
    :vars
    (
      ?auto_140582 - BLOCK
      ?auto_140585 - BLOCK
      ?auto_140586 - BLOCK
      ?auto_140581 - BLOCK
      ?auto_140580 - BLOCK
      ?auto_140583 - BLOCK
      ?auto_140584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140582 ?auto_140579 ) ( ON-TABLE ?auto_140579 ) ( not ( = ?auto_140579 ?auto_140582 ) ) ( not ( = ?auto_140579 ?auto_140585 ) ) ( not ( = ?auto_140579 ?auto_140586 ) ) ( not ( = ?auto_140582 ?auto_140585 ) ) ( not ( = ?auto_140582 ?auto_140586 ) ) ( not ( = ?auto_140585 ?auto_140586 ) ) ( ON ?auto_140585 ?auto_140582 ) ( not ( = ?auto_140581 ?auto_140580 ) ) ( not ( = ?auto_140581 ?auto_140583 ) ) ( not ( = ?auto_140581 ?auto_140584 ) ) ( not ( = ?auto_140581 ?auto_140586 ) ) ( not ( = ?auto_140580 ?auto_140583 ) ) ( not ( = ?auto_140580 ?auto_140584 ) ) ( not ( = ?auto_140580 ?auto_140586 ) ) ( not ( = ?auto_140583 ?auto_140584 ) ) ( not ( = ?auto_140583 ?auto_140586 ) ) ( not ( = ?auto_140584 ?auto_140586 ) ) ( not ( = ?auto_140579 ?auto_140584 ) ) ( not ( = ?auto_140579 ?auto_140581 ) ) ( not ( = ?auto_140579 ?auto_140580 ) ) ( not ( = ?auto_140579 ?auto_140583 ) ) ( not ( = ?auto_140582 ?auto_140584 ) ) ( not ( = ?auto_140582 ?auto_140581 ) ) ( not ( = ?auto_140582 ?auto_140580 ) ) ( not ( = ?auto_140582 ?auto_140583 ) ) ( not ( = ?auto_140585 ?auto_140584 ) ) ( not ( = ?auto_140585 ?auto_140581 ) ) ( not ( = ?auto_140585 ?auto_140580 ) ) ( not ( = ?auto_140585 ?auto_140583 ) ) ( ON ?auto_140586 ?auto_140585 ) ( ON ?auto_140584 ?auto_140586 ) ( ON ?auto_140583 ?auto_140584 ) ( ON ?auto_140580 ?auto_140583 ) ( ON ?auto_140581 ?auto_140580 ) ( CLEAR ?auto_140581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140579 ?auto_140582 ?auto_140585 ?auto_140586 ?auto_140584 ?auto_140583 ?auto_140580 )
      ( MAKE-1PILE ?auto_140579 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140587 - BLOCK
    )
    :vars
    (
      ?auto_140593 - BLOCK
      ?auto_140588 - BLOCK
      ?auto_140594 - BLOCK
      ?auto_140589 - BLOCK
      ?auto_140592 - BLOCK
      ?auto_140590 - BLOCK
      ?auto_140591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140593 ?auto_140587 ) ( ON-TABLE ?auto_140587 ) ( not ( = ?auto_140587 ?auto_140593 ) ) ( not ( = ?auto_140587 ?auto_140588 ) ) ( not ( = ?auto_140587 ?auto_140594 ) ) ( not ( = ?auto_140593 ?auto_140588 ) ) ( not ( = ?auto_140593 ?auto_140594 ) ) ( not ( = ?auto_140588 ?auto_140594 ) ) ( ON ?auto_140588 ?auto_140593 ) ( not ( = ?auto_140589 ?auto_140592 ) ) ( not ( = ?auto_140589 ?auto_140590 ) ) ( not ( = ?auto_140589 ?auto_140591 ) ) ( not ( = ?auto_140589 ?auto_140594 ) ) ( not ( = ?auto_140592 ?auto_140590 ) ) ( not ( = ?auto_140592 ?auto_140591 ) ) ( not ( = ?auto_140592 ?auto_140594 ) ) ( not ( = ?auto_140590 ?auto_140591 ) ) ( not ( = ?auto_140590 ?auto_140594 ) ) ( not ( = ?auto_140591 ?auto_140594 ) ) ( not ( = ?auto_140587 ?auto_140591 ) ) ( not ( = ?auto_140587 ?auto_140589 ) ) ( not ( = ?auto_140587 ?auto_140592 ) ) ( not ( = ?auto_140587 ?auto_140590 ) ) ( not ( = ?auto_140593 ?auto_140591 ) ) ( not ( = ?auto_140593 ?auto_140589 ) ) ( not ( = ?auto_140593 ?auto_140592 ) ) ( not ( = ?auto_140593 ?auto_140590 ) ) ( not ( = ?auto_140588 ?auto_140591 ) ) ( not ( = ?auto_140588 ?auto_140589 ) ) ( not ( = ?auto_140588 ?auto_140592 ) ) ( not ( = ?auto_140588 ?auto_140590 ) ) ( ON ?auto_140594 ?auto_140588 ) ( ON ?auto_140591 ?auto_140594 ) ( ON ?auto_140590 ?auto_140591 ) ( ON ?auto_140592 ?auto_140590 ) ( HOLDING ?auto_140589 ) ( CLEAR ?auto_140592 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140587 ?auto_140593 ?auto_140588 ?auto_140594 ?auto_140591 ?auto_140590 ?auto_140592 ?auto_140589 )
      ( MAKE-1PILE ?auto_140587 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140595 - BLOCK
    )
    :vars
    (
      ?auto_140599 - BLOCK
      ?auto_140601 - BLOCK
      ?auto_140597 - BLOCK
      ?auto_140600 - BLOCK
      ?auto_140598 - BLOCK
      ?auto_140602 - BLOCK
      ?auto_140596 - BLOCK
      ?auto_140603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140599 ?auto_140595 ) ( ON-TABLE ?auto_140595 ) ( not ( = ?auto_140595 ?auto_140599 ) ) ( not ( = ?auto_140595 ?auto_140601 ) ) ( not ( = ?auto_140595 ?auto_140597 ) ) ( not ( = ?auto_140599 ?auto_140601 ) ) ( not ( = ?auto_140599 ?auto_140597 ) ) ( not ( = ?auto_140601 ?auto_140597 ) ) ( ON ?auto_140601 ?auto_140599 ) ( not ( = ?auto_140600 ?auto_140598 ) ) ( not ( = ?auto_140600 ?auto_140602 ) ) ( not ( = ?auto_140600 ?auto_140596 ) ) ( not ( = ?auto_140600 ?auto_140597 ) ) ( not ( = ?auto_140598 ?auto_140602 ) ) ( not ( = ?auto_140598 ?auto_140596 ) ) ( not ( = ?auto_140598 ?auto_140597 ) ) ( not ( = ?auto_140602 ?auto_140596 ) ) ( not ( = ?auto_140602 ?auto_140597 ) ) ( not ( = ?auto_140596 ?auto_140597 ) ) ( not ( = ?auto_140595 ?auto_140596 ) ) ( not ( = ?auto_140595 ?auto_140600 ) ) ( not ( = ?auto_140595 ?auto_140598 ) ) ( not ( = ?auto_140595 ?auto_140602 ) ) ( not ( = ?auto_140599 ?auto_140596 ) ) ( not ( = ?auto_140599 ?auto_140600 ) ) ( not ( = ?auto_140599 ?auto_140598 ) ) ( not ( = ?auto_140599 ?auto_140602 ) ) ( not ( = ?auto_140601 ?auto_140596 ) ) ( not ( = ?auto_140601 ?auto_140600 ) ) ( not ( = ?auto_140601 ?auto_140598 ) ) ( not ( = ?auto_140601 ?auto_140602 ) ) ( ON ?auto_140597 ?auto_140601 ) ( ON ?auto_140596 ?auto_140597 ) ( ON ?auto_140602 ?auto_140596 ) ( ON ?auto_140598 ?auto_140602 ) ( CLEAR ?auto_140598 ) ( ON ?auto_140600 ?auto_140603 ) ( CLEAR ?auto_140600 ) ( HAND-EMPTY ) ( not ( = ?auto_140595 ?auto_140603 ) ) ( not ( = ?auto_140599 ?auto_140603 ) ) ( not ( = ?auto_140601 ?auto_140603 ) ) ( not ( = ?auto_140597 ?auto_140603 ) ) ( not ( = ?auto_140600 ?auto_140603 ) ) ( not ( = ?auto_140598 ?auto_140603 ) ) ( not ( = ?auto_140602 ?auto_140603 ) ) ( not ( = ?auto_140596 ?auto_140603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140600 ?auto_140603 )
      ( MAKE-1PILE ?auto_140595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140604 - BLOCK
    )
    :vars
    (
      ?auto_140608 - BLOCK
      ?auto_140607 - BLOCK
      ?auto_140606 - BLOCK
      ?auto_140605 - BLOCK
      ?auto_140609 - BLOCK
      ?auto_140612 - BLOCK
      ?auto_140611 - BLOCK
      ?auto_140610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140608 ?auto_140604 ) ( ON-TABLE ?auto_140604 ) ( not ( = ?auto_140604 ?auto_140608 ) ) ( not ( = ?auto_140604 ?auto_140607 ) ) ( not ( = ?auto_140604 ?auto_140606 ) ) ( not ( = ?auto_140608 ?auto_140607 ) ) ( not ( = ?auto_140608 ?auto_140606 ) ) ( not ( = ?auto_140607 ?auto_140606 ) ) ( ON ?auto_140607 ?auto_140608 ) ( not ( = ?auto_140605 ?auto_140609 ) ) ( not ( = ?auto_140605 ?auto_140612 ) ) ( not ( = ?auto_140605 ?auto_140611 ) ) ( not ( = ?auto_140605 ?auto_140606 ) ) ( not ( = ?auto_140609 ?auto_140612 ) ) ( not ( = ?auto_140609 ?auto_140611 ) ) ( not ( = ?auto_140609 ?auto_140606 ) ) ( not ( = ?auto_140612 ?auto_140611 ) ) ( not ( = ?auto_140612 ?auto_140606 ) ) ( not ( = ?auto_140611 ?auto_140606 ) ) ( not ( = ?auto_140604 ?auto_140611 ) ) ( not ( = ?auto_140604 ?auto_140605 ) ) ( not ( = ?auto_140604 ?auto_140609 ) ) ( not ( = ?auto_140604 ?auto_140612 ) ) ( not ( = ?auto_140608 ?auto_140611 ) ) ( not ( = ?auto_140608 ?auto_140605 ) ) ( not ( = ?auto_140608 ?auto_140609 ) ) ( not ( = ?auto_140608 ?auto_140612 ) ) ( not ( = ?auto_140607 ?auto_140611 ) ) ( not ( = ?auto_140607 ?auto_140605 ) ) ( not ( = ?auto_140607 ?auto_140609 ) ) ( not ( = ?auto_140607 ?auto_140612 ) ) ( ON ?auto_140606 ?auto_140607 ) ( ON ?auto_140611 ?auto_140606 ) ( ON ?auto_140612 ?auto_140611 ) ( ON ?auto_140605 ?auto_140610 ) ( CLEAR ?auto_140605 ) ( not ( = ?auto_140604 ?auto_140610 ) ) ( not ( = ?auto_140608 ?auto_140610 ) ) ( not ( = ?auto_140607 ?auto_140610 ) ) ( not ( = ?auto_140606 ?auto_140610 ) ) ( not ( = ?auto_140605 ?auto_140610 ) ) ( not ( = ?auto_140609 ?auto_140610 ) ) ( not ( = ?auto_140612 ?auto_140610 ) ) ( not ( = ?auto_140611 ?auto_140610 ) ) ( HOLDING ?auto_140609 ) ( CLEAR ?auto_140612 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140604 ?auto_140608 ?auto_140607 ?auto_140606 ?auto_140611 ?auto_140612 ?auto_140609 )
      ( MAKE-1PILE ?auto_140604 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140613 - BLOCK
    )
    :vars
    (
      ?auto_140617 - BLOCK
      ?auto_140615 - BLOCK
      ?auto_140616 - BLOCK
      ?auto_140620 - BLOCK
      ?auto_140618 - BLOCK
      ?auto_140619 - BLOCK
      ?auto_140614 - BLOCK
      ?auto_140621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140617 ?auto_140613 ) ( ON-TABLE ?auto_140613 ) ( not ( = ?auto_140613 ?auto_140617 ) ) ( not ( = ?auto_140613 ?auto_140615 ) ) ( not ( = ?auto_140613 ?auto_140616 ) ) ( not ( = ?auto_140617 ?auto_140615 ) ) ( not ( = ?auto_140617 ?auto_140616 ) ) ( not ( = ?auto_140615 ?auto_140616 ) ) ( ON ?auto_140615 ?auto_140617 ) ( not ( = ?auto_140620 ?auto_140618 ) ) ( not ( = ?auto_140620 ?auto_140619 ) ) ( not ( = ?auto_140620 ?auto_140614 ) ) ( not ( = ?auto_140620 ?auto_140616 ) ) ( not ( = ?auto_140618 ?auto_140619 ) ) ( not ( = ?auto_140618 ?auto_140614 ) ) ( not ( = ?auto_140618 ?auto_140616 ) ) ( not ( = ?auto_140619 ?auto_140614 ) ) ( not ( = ?auto_140619 ?auto_140616 ) ) ( not ( = ?auto_140614 ?auto_140616 ) ) ( not ( = ?auto_140613 ?auto_140614 ) ) ( not ( = ?auto_140613 ?auto_140620 ) ) ( not ( = ?auto_140613 ?auto_140618 ) ) ( not ( = ?auto_140613 ?auto_140619 ) ) ( not ( = ?auto_140617 ?auto_140614 ) ) ( not ( = ?auto_140617 ?auto_140620 ) ) ( not ( = ?auto_140617 ?auto_140618 ) ) ( not ( = ?auto_140617 ?auto_140619 ) ) ( not ( = ?auto_140615 ?auto_140614 ) ) ( not ( = ?auto_140615 ?auto_140620 ) ) ( not ( = ?auto_140615 ?auto_140618 ) ) ( not ( = ?auto_140615 ?auto_140619 ) ) ( ON ?auto_140616 ?auto_140615 ) ( ON ?auto_140614 ?auto_140616 ) ( ON ?auto_140619 ?auto_140614 ) ( ON ?auto_140620 ?auto_140621 ) ( not ( = ?auto_140613 ?auto_140621 ) ) ( not ( = ?auto_140617 ?auto_140621 ) ) ( not ( = ?auto_140615 ?auto_140621 ) ) ( not ( = ?auto_140616 ?auto_140621 ) ) ( not ( = ?auto_140620 ?auto_140621 ) ) ( not ( = ?auto_140618 ?auto_140621 ) ) ( not ( = ?auto_140619 ?auto_140621 ) ) ( not ( = ?auto_140614 ?auto_140621 ) ) ( CLEAR ?auto_140619 ) ( ON ?auto_140618 ?auto_140620 ) ( CLEAR ?auto_140618 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140621 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140621 ?auto_140620 )
      ( MAKE-1PILE ?auto_140613 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140622 - BLOCK
    )
    :vars
    (
      ?auto_140627 - BLOCK
      ?auto_140629 - BLOCK
      ?auto_140626 - BLOCK
      ?auto_140623 - BLOCK
      ?auto_140628 - BLOCK
      ?auto_140630 - BLOCK
      ?auto_140625 - BLOCK
      ?auto_140624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140627 ?auto_140622 ) ( ON-TABLE ?auto_140622 ) ( not ( = ?auto_140622 ?auto_140627 ) ) ( not ( = ?auto_140622 ?auto_140629 ) ) ( not ( = ?auto_140622 ?auto_140626 ) ) ( not ( = ?auto_140627 ?auto_140629 ) ) ( not ( = ?auto_140627 ?auto_140626 ) ) ( not ( = ?auto_140629 ?auto_140626 ) ) ( ON ?auto_140629 ?auto_140627 ) ( not ( = ?auto_140623 ?auto_140628 ) ) ( not ( = ?auto_140623 ?auto_140630 ) ) ( not ( = ?auto_140623 ?auto_140625 ) ) ( not ( = ?auto_140623 ?auto_140626 ) ) ( not ( = ?auto_140628 ?auto_140630 ) ) ( not ( = ?auto_140628 ?auto_140625 ) ) ( not ( = ?auto_140628 ?auto_140626 ) ) ( not ( = ?auto_140630 ?auto_140625 ) ) ( not ( = ?auto_140630 ?auto_140626 ) ) ( not ( = ?auto_140625 ?auto_140626 ) ) ( not ( = ?auto_140622 ?auto_140625 ) ) ( not ( = ?auto_140622 ?auto_140623 ) ) ( not ( = ?auto_140622 ?auto_140628 ) ) ( not ( = ?auto_140622 ?auto_140630 ) ) ( not ( = ?auto_140627 ?auto_140625 ) ) ( not ( = ?auto_140627 ?auto_140623 ) ) ( not ( = ?auto_140627 ?auto_140628 ) ) ( not ( = ?auto_140627 ?auto_140630 ) ) ( not ( = ?auto_140629 ?auto_140625 ) ) ( not ( = ?auto_140629 ?auto_140623 ) ) ( not ( = ?auto_140629 ?auto_140628 ) ) ( not ( = ?auto_140629 ?auto_140630 ) ) ( ON ?auto_140626 ?auto_140629 ) ( ON ?auto_140625 ?auto_140626 ) ( ON ?auto_140623 ?auto_140624 ) ( not ( = ?auto_140622 ?auto_140624 ) ) ( not ( = ?auto_140627 ?auto_140624 ) ) ( not ( = ?auto_140629 ?auto_140624 ) ) ( not ( = ?auto_140626 ?auto_140624 ) ) ( not ( = ?auto_140623 ?auto_140624 ) ) ( not ( = ?auto_140628 ?auto_140624 ) ) ( not ( = ?auto_140630 ?auto_140624 ) ) ( not ( = ?auto_140625 ?auto_140624 ) ) ( ON ?auto_140628 ?auto_140623 ) ( CLEAR ?auto_140628 ) ( ON-TABLE ?auto_140624 ) ( HOLDING ?auto_140630 ) ( CLEAR ?auto_140625 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140622 ?auto_140627 ?auto_140629 ?auto_140626 ?auto_140625 ?auto_140630 )
      ( MAKE-1PILE ?auto_140622 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140631 - BLOCK
    )
    :vars
    (
      ?auto_140637 - BLOCK
      ?auto_140636 - BLOCK
      ?auto_140635 - BLOCK
      ?auto_140638 - BLOCK
      ?auto_140639 - BLOCK
      ?auto_140634 - BLOCK
      ?auto_140633 - BLOCK
      ?auto_140632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140637 ?auto_140631 ) ( ON-TABLE ?auto_140631 ) ( not ( = ?auto_140631 ?auto_140637 ) ) ( not ( = ?auto_140631 ?auto_140636 ) ) ( not ( = ?auto_140631 ?auto_140635 ) ) ( not ( = ?auto_140637 ?auto_140636 ) ) ( not ( = ?auto_140637 ?auto_140635 ) ) ( not ( = ?auto_140636 ?auto_140635 ) ) ( ON ?auto_140636 ?auto_140637 ) ( not ( = ?auto_140638 ?auto_140639 ) ) ( not ( = ?auto_140638 ?auto_140634 ) ) ( not ( = ?auto_140638 ?auto_140633 ) ) ( not ( = ?auto_140638 ?auto_140635 ) ) ( not ( = ?auto_140639 ?auto_140634 ) ) ( not ( = ?auto_140639 ?auto_140633 ) ) ( not ( = ?auto_140639 ?auto_140635 ) ) ( not ( = ?auto_140634 ?auto_140633 ) ) ( not ( = ?auto_140634 ?auto_140635 ) ) ( not ( = ?auto_140633 ?auto_140635 ) ) ( not ( = ?auto_140631 ?auto_140633 ) ) ( not ( = ?auto_140631 ?auto_140638 ) ) ( not ( = ?auto_140631 ?auto_140639 ) ) ( not ( = ?auto_140631 ?auto_140634 ) ) ( not ( = ?auto_140637 ?auto_140633 ) ) ( not ( = ?auto_140637 ?auto_140638 ) ) ( not ( = ?auto_140637 ?auto_140639 ) ) ( not ( = ?auto_140637 ?auto_140634 ) ) ( not ( = ?auto_140636 ?auto_140633 ) ) ( not ( = ?auto_140636 ?auto_140638 ) ) ( not ( = ?auto_140636 ?auto_140639 ) ) ( not ( = ?auto_140636 ?auto_140634 ) ) ( ON ?auto_140635 ?auto_140636 ) ( ON ?auto_140633 ?auto_140635 ) ( ON ?auto_140638 ?auto_140632 ) ( not ( = ?auto_140631 ?auto_140632 ) ) ( not ( = ?auto_140637 ?auto_140632 ) ) ( not ( = ?auto_140636 ?auto_140632 ) ) ( not ( = ?auto_140635 ?auto_140632 ) ) ( not ( = ?auto_140638 ?auto_140632 ) ) ( not ( = ?auto_140639 ?auto_140632 ) ) ( not ( = ?auto_140634 ?auto_140632 ) ) ( not ( = ?auto_140633 ?auto_140632 ) ) ( ON ?auto_140639 ?auto_140638 ) ( ON-TABLE ?auto_140632 ) ( CLEAR ?auto_140633 ) ( ON ?auto_140634 ?auto_140639 ) ( CLEAR ?auto_140634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140632 ?auto_140638 ?auto_140639 )
      ( MAKE-1PILE ?auto_140631 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140640 - BLOCK
    )
    :vars
    (
      ?auto_140642 - BLOCK
      ?auto_140645 - BLOCK
      ?auto_140643 - BLOCK
      ?auto_140648 - BLOCK
      ?auto_140641 - BLOCK
      ?auto_140647 - BLOCK
      ?auto_140646 - BLOCK
      ?auto_140644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140642 ?auto_140640 ) ( ON-TABLE ?auto_140640 ) ( not ( = ?auto_140640 ?auto_140642 ) ) ( not ( = ?auto_140640 ?auto_140645 ) ) ( not ( = ?auto_140640 ?auto_140643 ) ) ( not ( = ?auto_140642 ?auto_140645 ) ) ( not ( = ?auto_140642 ?auto_140643 ) ) ( not ( = ?auto_140645 ?auto_140643 ) ) ( ON ?auto_140645 ?auto_140642 ) ( not ( = ?auto_140648 ?auto_140641 ) ) ( not ( = ?auto_140648 ?auto_140647 ) ) ( not ( = ?auto_140648 ?auto_140646 ) ) ( not ( = ?auto_140648 ?auto_140643 ) ) ( not ( = ?auto_140641 ?auto_140647 ) ) ( not ( = ?auto_140641 ?auto_140646 ) ) ( not ( = ?auto_140641 ?auto_140643 ) ) ( not ( = ?auto_140647 ?auto_140646 ) ) ( not ( = ?auto_140647 ?auto_140643 ) ) ( not ( = ?auto_140646 ?auto_140643 ) ) ( not ( = ?auto_140640 ?auto_140646 ) ) ( not ( = ?auto_140640 ?auto_140648 ) ) ( not ( = ?auto_140640 ?auto_140641 ) ) ( not ( = ?auto_140640 ?auto_140647 ) ) ( not ( = ?auto_140642 ?auto_140646 ) ) ( not ( = ?auto_140642 ?auto_140648 ) ) ( not ( = ?auto_140642 ?auto_140641 ) ) ( not ( = ?auto_140642 ?auto_140647 ) ) ( not ( = ?auto_140645 ?auto_140646 ) ) ( not ( = ?auto_140645 ?auto_140648 ) ) ( not ( = ?auto_140645 ?auto_140641 ) ) ( not ( = ?auto_140645 ?auto_140647 ) ) ( ON ?auto_140643 ?auto_140645 ) ( ON ?auto_140648 ?auto_140644 ) ( not ( = ?auto_140640 ?auto_140644 ) ) ( not ( = ?auto_140642 ?auto_140644 ) ) ( not ( = ?auto_140645 ?auto_140644 ) ) ( not ( = ?auto_140643 ?auto_140644 ) ) ( not ( = ?auto_140648 ?auto_140644 ) ) ( not ( = ?auto_140641 ?auto_140644 ) ) ( not ( = ?auto_140647 ?auto_140644 ) ) ( not ( = ?auto_140646 ?auto_140644 ) ) ( ON ?auto_140641 ?auto_140648 ) ( ON-TABLE ?auto_140644 ) ( ON ?auto_140647 ?auto_140641 ) ( CLEAR ?auto_140647 ) ( HOLDING ?auto_140646 ) ( CLEAR ?auto_140643 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140640 ?auto_140642 ?auto_140645 ?auto_140643 ?auto_140646 )
      ( MAKE-1PILE ?auto_140640 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140649 - BLOCK
    )
    :vars
    (
      ?auto_140656 - BLOCK
      ?auto_140653 - BLOCK
      ?auto_140655 - BLOCK
      ?auto_140657 - BLOCK
      ?auto_140652 - BLOCK
      ?auto_140650 - BLOCK
      ?auto_140654 - BLOCK
      ?auto_140651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140656 ?auto_140649 ) ( ON-TABLE ?auto_140649 ) ( not ( = ?auto_140649 ?auto_140656 ) ) ( not ( = ?auto_140649 ?auto_140653 ) ) ( not ( = ?auto_140649 ?auto_140655 ) ) ( not ( = ?auto_140656 ?auto_140653 ) ) ( not ( = ?auto_140656 ?auto_140655 ) ) ( not ( = ?auto_140653 ?auto_140655 ) ) ( ON ?auto_140653 ?auto_140656 ) ( not ( = ?auto_140657 ?auto_140652 ) ) ( not ( = ?auto_140657 ?auto_140650 ) ) ( not ( = ?auto_140657 ?auto_140654 ) ) ( not ( = ?auto_140657 ?auto_140655 ) ) ( not ( = ?auto_140652 ?auto_140650 ) ) ( not ( = ?auto_140652 ?auto_140654 ) ) ( not ( = ?auto_140652 ?auto_140655 ) ) ( not ( = ?auto_140650 ?auto_140654 ) ) ( not ( = ?auto_140650 ?auto_140655 ) ) ( not ( = ?auto_140654 ?auto_140655 ) ) ( not ( = ?auto_140649 ?auto_140654 ) ) ( not ( = ?auto_140649 ?auto_140657 ) ) ( not ( = ?auto_140649 ?auto_140652 ) ) ( not ( = ?auto_140649 ?auto_140650 ) ) ( not ( = ?auto_140656 ?auto_140654 ) ) ( not ( = ?auto_140656 ?auto_140657 ) ) ( not ( = ?auto_140656 ?auto_140652 ) ) ( not ( = ?auto_140656 ?auto_140650 ) ) ( not ( = ?auto_140653 ?auto_140654 ) ) ( not ( = ?auto_140653 ?auto_140657 ) ) ( not ( = ?auto_140653 ?auto_140652 ) ) ( not ( = ?auto_140653 ?auto_140650 ) ) ( ON ?auto_140655 ?auto_140653 ) ( ON ?auto_140657 ?auto_140651 ) ( not ( = ?auto_140649 ?auto_140651 ) ) ( not ( = ?auto_140656 ?auto_140651 ) ) ( not ( = ?auto_140653 ?auto_140651 ) ) ( not ( = ?auto_140655 ?auto_140651 ) ) ( not ( = ?auto_140657 ?auto_140651 ) ) ( not ( = ?auto_140652 ?auto_140651 ) ) ( not ( = ?auto_140650 ?auto_140651 ) ) ( not ( = ?auto_140654 ?auto_140651 ) ) ( ON ?auto_140652 ?auto_140657 ) ( ON-TABLE ?auto_140651 ) ( ON ?auto_140650 ?auto_140652 ) ( CLEAR ?auto_140655 ) ( ON ?auto_140654 ?auto_140650 ) ( CLEAR ?auto_140654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140651 ?auto_140657 ?auto_140652 ?auto_140650 )
      ( MAKE-1PILE ?auto_140649 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140658 - BLOCK
    )
    :vars
    (
      ?auto_140665 - BLOCK
      ?auto_140659 - BLOCK
      ?auto_140666 - BLOCK
      ?auto_140663 - BLOCK
      ?auto_140664 - BLOCK
      ?auto_140662 - BLOCK
      ?auto_140661 - BLOCK
      ?auto_140660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140665 ?auto_140658 ) ( ON-TABLE ?auto_140658 ) ( not ( = ?auto_140658 ?auto_140665 ) ) ( not ( = ?auto_140658 ?auto_140659 ) ) ( not ( = ?auto_140658 ?auto_140666 ) ) ( not ( = ?auto_140665 ?auto_140659 ) ) ( not ( = ?auto_140665 ?auto_140666 ) ) ( not ( = ?auto_140659 ?auto_140666 ) ) ( ON ?auto_140659 ?auto_140665 ) ( not ( = ?auto_140663 ?auto_140664 ) ) ( not ( = ?auto_140663 ?auto_140662 ) ) ( not ( = ?auto_140663 ?auto_140661 ) ) ( not ( = ?auto_140663 ?auto_140666 ) ) ( not ( = ?auto_140664 ?auto_140662 ) ) ( not ( = ?auto_140664 ?auto_140661 ) ) ( not ( = ?auto_140664 ?auto_140666 ) ) ( not ( = ?auto_140662 ?auto_140661 ) ) ( not ( = ?auto_140662 ?auto_140666 ) ) ( not ( = ?auto_140661 ?auto_140666 ) ) ( not ( = ?auto_140658 ?auto_140661 ) ) ( not ( = ?auto_140658 ?auto_140663 ) ) ( not ( = ?auto_140658 ?auto_140664 ) ) ( not ( = ?auto_140658 ?auto_140662 ) ) ( not ( = ?auto_140665 ?auto_140661 ) ) ( not ( = ?auto_140665 ?auto_140663 ) ) ( not ( = ?auto_140665 ?auto_140664 ) ) ( not ( = ?auto_140665 ?auto_140662 ) ) ( not ( = ?auto_140659 ?auto_140661 ) ) ( not ( = ?auto_140659 ?auto_140663 ) ) ( not ( = ?auto_140659 ?auto_140664 ) ) ( not ( = ?auto_140659 ?auto_140662 ) ) ( ON ?auto_140663 ?auto_140660 ) ( not ( = ?auto_140658 ?auto_140660 ) ) ( not ( = ?auto_140665 ?auto_140660 ) ) ( not ( = ?auto_140659 ?auto_140660 ) ) ( not ( = ?auto_140666 ?auto_140660 ) ) ( not ( = ?auto_140663 ?auto_140660 ) ) ( not ( = ?auto_140664 ?auto_140660 ) ) ( not ( = ?auto_140662 ?auto_140660 ) ) ( not ( = ?auto_140661 ?auto_140660 ) ) ( ON ?auto_140664 ?auto_140663 ) ( ON-TABLE ?auto_140660 ) ( ON ?auto_140662 ?auto_140664 ) ( ON ?auto_140661 ?auto_140662 ) ( CLEAR ?auto_140661 ) ( HOLDING ?auto_140666 ) ( CLEAR ?auto_140659 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140658 ?auto_140665 ?auto_140659 ?auto_140666 )
      ( MAKE-1PILE ?auto_140658 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140667 - BLOCK
    )
    :vars
    (
      ?auto_140672 - BLOCK
      ?auto_140675 - BLOCK
      ?auto_140674 - BLOCK
      ?auto_140673 - BLOCK
      ?auto_140671 - BLOCK
      ?auto_140669 - BLOCK
      ?auto_140670 - BLOCK
      ?auto_140668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140672 ?auto_140667 ) ( ON-TABLE ?auto_140667 ) ( not ( = ?auto_140667 ?auto_140672 ) ) ( not ( = ?auto_140667 ?auto_140675 ) ) ( not ( = ?auto_140667 ?auto_140674 ) ) ( not ( = ?auto_140672 ?auto_140675 ) ) ( not ( = ?auto_140672 ?auto_140674 ) ) ( not ( = ?auto_140675 ?auto_140674 ) ) ( ON ?auto_140675 ?auto_140672 ) ( not ( = ?auto_140673 ?auto_140671 ) ) ( not ( = ?auto_140673 ?auto_140669 ) ) ( not ( = ?auto_140673 ?auto_140670 ) ) ( not ( = ?auto_140673 ?auto_140674 ) ) ( not ( = ?auto_140671 ?auto_140669 ) ) ( not ( = ?auto_140671 ?auto_140670 ) ) ( not ( = ?auto_140671 ?auto_140674 ) ) ( not ( = ?auto_140669 ?auto_140670 ) ) ( not ( = ?auto_140669 ?auto_140674 ) ) ( not ( = ?auto_140670 ?auto_140674 ) ) ( not ( = ?auto_140667 ?auto_140670 ) ) ( not ( = ?auto_140667 ?auto_140673 ) ) ( not ( = ?auto_140667 ?auto_140671 ) ) ( not ( = ?auto_140667 ?auto_140669 ) ) ( not ( = ?auto_140672 ?auto_140670 ) ) ( not ( = ?auto_140672 ?auto_140673 ) ) ( not ( = ?auto_140672 ?auto_140671 ) ) ( not ( = ?auto_140672 ?auto_140669 ) ) ( not ( = ?auto_140675 ?auto_140670 ) ) ( not ( = ?auto_140675 ?auto_140673 ) ) ( not ( = ?auto_140675 ?auto_140671 ) ) ( not ( = ?auto_140675 ?auto_140669 ) ) ( ON ?auto_140673 ?auto_140668 ) ( not ( = ?auto_140667 ?auto_140668 ) ) ( not ( = ?auto_140672 ?auto_140668 ) ) ( not ( = ?auto_140675 ?auto_140668 ) ) ( not ( = ?auto_140674 ?auto_140668 ) ) ( not ( = ?auto_140673 ?auto_140668 ) ) ( not ( = ?auto_140671 ?auto_140668 ) ) ( not ( = ?auto_140669 ?auto_140668 ) ) ( not ( = ?auto_140670 ?auto_140668 ) ) ( ON ?auto_140671 ?auto_140673 ) ( ON-TABLE ?auto_140668 ) ( ON ?auto_140669 ?auto_140671 ) ( ON ?auto_140670 ?auto_140669 ) ( CLEAR ?auto_140675 ) ( ON ?auto_140674 ?auto_140670 ) ( CLEAR ?auto_140674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140668 ?auto_140673 ?auto_140671 ?auto_140669 ?auto_140670 )
      ( MAKE-1PILE ?auto_140667 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140676 - BLOCK
    )
    :vars
    (
      ?auto_140679 - BLOCK
      ?auto_140684 - BLOCK
      ?auto_140680 - BLOCK
      ?auto_140682 - BLOCK
      ?auto_140681 - BLOCK
      ?auto_140678 - BLOCK
      ?auto_140683 - BLOCK
      ?auto_140677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140679 ?auto_140676 ) ( ON-TABLE ?auto_140676 ) ( not ( = ?auto_140676 ?auto_140679 ) ) ( not ( = ?auto_140676 ?auto_140684 ) ) ( not ( = ?auto_140676 ?auto_140680 ) ) ( not ( = ?auto_140679 ?auto_140684 ) ) ( not ( = ?auto_140679 ?auto_140680 ) ) ( not ( = ?auto_140684 ?auto_140680 ) ) ( not ( = ?auto_140682 ?auto_140681 ) ) ( not ( = ?auto_140682 ?auto_140678 ) ) ( not ( = ?auto_140682 ?auto_140683 ) ) ( not ( = ?auto_140682 ?auto_140680 ) ) ( not ( = ?auto_140681 ?auto_140678 ) ) ( not ( = ?auto_140681 ?auto_140683 ) ) ( not ( = ?auto_140681 ?auto_140680 ) ) ( not ( = ?auto_140678 ?auto_140683 ) ) ( not ( = ?auto_140678 ?auto_140680 ) ) ( not ( = ?auto_140683 ?auto_140680 ) ) ( not ( = ?auto_140676 ?auto_140683 ) ) ( not ( = ?auto_140676 ?auto_140682 ) ) ( not ( = ?auto_140676 ?auto_140681 ) ) ( not ( = ?auto_140676 ?auto_140678 ) ) ( not ( = ?auto_140679 ?auto_140683 ) ) ( not ( = ?auto_140679 ?auto_140682 ) ) ( not ( = ?auto_140679 ?auto_140681 ) ) ( not ( = ?auto_140679 ?auto_140678 ) ) ( not ( = ?auto_140684 ?auto_140683 ) ) ( not ( = ?auto_140684 ?auto_140682 ) ) ( not ( = ?auto_140684 ?auto_140681 ) ) ( not ( = ?auto_140684 ?auto_140678 ) ) ( ON ?auto_140682 ?auto_140677 ) ( not ( = ?auto_140676 ?auto_140677 ) ) ( not ( = ?auto_140679 ?auto_140677 ) ) ( not ( = ?auto_140684 ?auto_140677 ) ) ( not ( = ?auto_140680 ?auto_140677 ) ) ( not ( = ?auto_140682 ?auto_140677 ) ) ( not ( = ?auto_140681 ?auto_140677 ) ) ( not ( = ?auto_140678 ?auto_140677 ) ) ( not ( = ?auto_140683 ?auto_140677 ) ) ( ON ?auto_140681 ?auto_140682 ) ( ON-TABLE ?auto_140677 ) ( ON ?auto_140678 ?auto_140681 ) ( ON ?auto_140683 ?auto_140678 ) ( ON ?auto_140680 ?auto_140683 ) ( CLEAR ?auto_140680 ) ( HOLDING ?auto_140684 ) ( CLEAR ?auto_140679 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140676 ?auto_140679 ?auto_140684 )
      ( MAKE-1PILE ?auto_140676 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140685 - BLOCK
    )
    :vars
    (
      ?auto_140692 - BLOCK
      ?auto_140687 - BLOCK
      ?auto_140688 - BLOCK
      ?auto_140689 - BLOCK
      ?auto_140691 - BLOCK
      ?auto_140693 - BLOCK
      ?auto_140686 - BLOCK
      ?auto_140690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_140692 ?auto_140685 ) ( ON-TABLE ?auto_140685 ) ( not ( = ?auto_140685 ?auto_140692 ) ) ( not ( = ?auto_140685 ?auto_140687 ) ) ( not ( = ?auto_140685 ?auto_140688 ) ) ( not ( = ?auto_140692 ?auto_140687 ) ) ( not ( = ?auto_140692 ?auto_140688 ) ) ( not ( = ?auto_140687 ?auto_140688 ) ) ( not ( = ?auto_140689 ?auto_140691 ) ) ( not ( = ?auto_140689 ?auto_140693 ) ) ( not ( = ?auto_140689 ?auto_140686 ) ) ( not ( = ?auto_140689 ?auto_140688 ) ) ( not ( = ?auto_140691 ?auto_140693 ) ) ( not ( = ?auto_140691 ?auto_140686 ) ) ( not ( = ?auto_140691 ?auto_140688 ) ) ( not ( = ?auto_140693 ?auto_140686 ) ) ( not ( = ?auto_140693 ?auto_140688 ) ) ( not ( = ?auto_140686 ?auto_140688 ) ) ( not ( = ?auto_140685 ?auto_140686 ) ) ( not ( = ?auto_140685 ?auto_140689 ) ) ( not ( = ?auto_140685 ?auto_140691 ) ) ( not ( = ?auto_140685 ?auto_140693 ) ) ( not ( = ?auto_140692 ?auto_140686 ) ) ( not ( = ?auto_140692 ?auto_140689 ) ) ( not ( = ?auto_140692 ?auto_140691 ) ) ( not ( = ?auto_140692 ?auto_140693 ) ) ( not ( = ?auto_140687 ?auto_140686 ) ) ( not ( = ?auto_140687 ?auto_140689 ) ) ( not ( = ?auto_140687 ?auto_140691 ) ) ( not ( = ?auto_140687 ?auto_140693 ) ) ( ON ?auto_140689 ?auto_140690 ) ( not ( = ?auto_140685 ?auto_140690 ) ) ( not ( = ?auto_140692 ?auto_140690 ) ) ( not ( = ?auto_140687 ?auto_140690 ) ) ( not ( = ?auto_140688 ?auto_140690 ) ) ( not ( = ?auto_140689 ?auto_140690 ) ) ( not ( = ?auto_140691 ?auto_140690 ) ) ( not ( = ?auto_140693 ?auto_140690 ) ) ( not ( = ?auto_140686 ?auto_140690 ) ) ( ON ?auto_140691 ?auto_140689 ) ( ON-TABLE ?auto_140690 ) ( ON ?auto_140693 ?auto_140691 ) ( ON ?auto_140686 ?auto_140693 ) ( ON ?auto_140688 ?auto_140686 ) ( CLEAR ?auto_140692 ) ( ON ?auto_140687 ?auto_140688 ) ( CLEAR ?auto_140687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140690 ?auto_140689 ?auto_140691 ?auto_140693 ?auto_140686 ?auto_140688 )
      ( MAKE-1PILE ?auto_140685 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140712 - BLOCK
    )
    :vars
    (
      ?auto_140719 - BLOCK
      ?auto_140717 - BLOCK
      ?auto_140718 - BLOCK
      ?auto_140716 - BLOCK
      ?auto_140715 - BLOCK
      ?auto_140714 - BLOCK
      ?auto_140713 - BLOCK
      ?auto_140720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140712 ?auto_140719 ) ) ( not ( = ?auto_140712 ?auto_140717 ) ) ( not ( = ?auto_140712 ?auto_140718 ) ) ( not ( = ?auto_140719 ?auto_140717 ) ) ( not ( = ?auto_140719 ?auto_140718 ) ) ( not ( = ?auto_140717 ?auto_140718 ) ) ( not ( = ?auto_140716 ?auto_140715 ) ) ( not ( = ?auto_140716 ?auto_140714 ) ) ( not ( = ?auto_140716 ?auto_140713 ) ) ( not ( = ?auto_140716 ?auto_140718 ) ) ( not ( = ?auto_140715 ?auto_140714 ) ) ( not ( = ?auto_140715 ?auto_140713 ) ) ( not ( = ?auto_140715 ?auto_140718 ) ) ( not ( = ?auto_140714 ?auto_140713 ) ) ( not ( = ?auto_140714 ?auto_140718 ) ) ( not ( = ?auto_140713 ?auto_140718 ) ) ( not ( = ?auto_140712 ?auto_140713 ) ) ( not ( = ?auto_140712 ?auto_140716 ) ) ( not ( = ?auto_140712 ?auto_140715 ) ) ( not ( = ?auto_140712 ?auto_140714 ) ) ( not ( = ?auto_140719 ?auto_140713 ) ) ( not ( = ?auto_140719 ?auto_140716 ) ) ( not ( = ?auto_140719 ?auto_140715 ) ) ( not ( = ?auto_140719 ?auto_140714 ) ) ( not ( = ?auto_140717 ?auto_140713 ) ) ( not ( = ?auto_140717 ?auto_140716 ) ) ( not ( = ?auto_140717 ?auto_140715 ) ) ( not ( = ?auto_140717 ?auto_140714 ) ) ( ON ?auto_140716 ?auto_140720 ) ( not ( = ?auto_140712 ?auto_140720 ) ) ( not ( = ?auto_140719 ?auto_140720 ) ) ( not ( = ?auto_140717 ?auto_140720 ) ) ( not ( = ?auto_140718 ?auto_140720 ) ) ( not ( = ?auto_140716 ?auto_140720 ) ) ( not ( = ?auto_140715 ?auto_140720 ) ) ( not ( = ?auto_140714 ?auto_140720 ) ) ( not ( = ?auto_140713 ?auto_140720 ) ) ( ON ?auto_140715 ?auto_140716 ) ( ON-TABLE ?auto_140720 ) ( ON ?auto_140714 ?auto_140715 ) ( ON ?auto_140713 ?auto_140714 ) ( ON ?auto_140718 ?auto_140713 ) ( ON ?auto_140717 ?auto_140718 ) ( ON ?auto_140719 ?auto_140717 ) ( CLEAR ?auto_140719 ) ( HOLDING ?auto_140712 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140712 ?auto_140719 )
      ( MAKE-1PILE ?auto_140712 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_140721 - BLOCK
    )
    :vars
    (
      ?auto_140727 - BLOCK
      ?auto_140725 - BLOCK
      ?auto_140722 - BLOCK
      ?auto_140726 - BLOCK
      ?auto_140728 - BLOCK
      ?auto_140724 - BLOCK
      ?auto_140723 - BLOCK
      ?auto_140729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140721 ?auto_140727 ) ) ( not ( = ?auto_140721 ?auto_140725 ) ) ( not ( = ?auto_140721 ?auto_140722 ) ) ( not ( = ?auto_140727 ?auto_140725 ) ) ( not ( = ?auto_140727 ?auto_140722 ) ) ( not ( = ?auto_140725 ?auto_140722 ) ) ( not ( = ?auto_140726 ?auto_140728 ) ) ( not ( = ?auto_140726 ?auto_140724 ) ) ( not ( = ?auto_140726 ?auto_140723 ) ) ( not ( = ?auto_140726 ?auto_140722 ) ) ( not ( = ?auto_140728 ?auto_140724 ) ) ( not ( = ?auto_140728 ?auto_140723 ) ) ( not ( = ?auto_140728 ?auto_140722 ) ) ( not ( = ?auto_140724 ?auto_140723 ) ) ( not ( = ?auto_140724 ?auto_140722 ) ) ( not ( = ?auto_140723 ?auto_140722 ) ) ( not ( = ?auto_140721 ?auto_140723 ) ) ( not ( = ?auto_140721 ?auto_140726 ) ) ( not ( = ?auto_140721 ?auto_140728 ) ) ( not ( = ?auto_140721 ?auto_140724 ) ) ( not ( = ?auto_140727 ?auto_140723 ) ) ( not ( = ?auto_140727 ?auto_140726 ) ) ( not ( = ?auto_140727 ?auto_140728 ) ) ( not ( = ?auto_140727 ?auto_140724 ) ) ( not ( = ?auto_140725 ?auto_140723 ) ) ( not ( = ?auto_140725 ?auto_140726 ) ) ( not ( = ?auto_140725 ?auto_140728 ) ) ( not ( = ?auto_140725 ?auto_140724 ) ) ( ON ?auto_140726 ?auto_140729 ) ( not ( = ?auto_140721 ?auto_140729 ) ) ( not ( = ?auto_140727 ?auto_140729 ) ) ( not ( = ?auto_140725 ?auto_140729 ) ) ( not ( = ?auto_140722 ?auto_140729 ) ) ( not ( = ?auto_140726 ?auto_140729 ) ) ( not ( = ?auto_140728 ?auto_140729 ) ) ( not ( = ?auto_140724 ?auto_140729 ) ) ( not ( = ?auto_140723 ?auto_140729 ) ) ( ON ?auto_140728 ?auto_140726 ) ( ON-TABLE ?auto_140729 ) ( ON ?auto_140724 ?auto_140728 ) ( ON ?auto_140723 ?auto_140724 ) ( ON ?auto_140722 ?auto_140723 ) ( ON ?auto_140725 ?auto_140722 ) ( ON ?auto_140727 ?auto_140725 ) ( ON ?auto_140721 ?auto_140727 ) ( CLEAR ?auto_140721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140729 ?auto_140726 ?auto_140728 ?auto_140724 ?auto_140723 ?auto_140722 ?auto_140725 ?auto_140727 )
      ( MAKE-1PILE ?auto_140721 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140737 - BLOCK
      ?auto_140738 - BLOCK
      ?auto_140739 - BLOCK
      ?auto_140740 - BLOCK
      ?auto_140741 - BLOCK
      ?auto_140742 - BLOCK
      ?auto_140743 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_140743 ) ( CLEAR ?auto_140742 ) ( ON-TABLE ?auto_140737 ) ( ON ?auto_140738 ?auto_140737 ) ( ON ?auto_140739 ?auto_140738 ) ( ON ?auto_140740 ?auto_140739 ) ( ON ?auto_140741 ?auto_140740 ) ( ON ?auto_140742 ?auto_140741 ) ( not ( = ?auto_140737 ?auto_140738 ) ) ( not ( = ?auto_140737 ?auto_140739 ) ) ( not ( = ?auto_140737 ?auto_140740 ) ) ( not ( = ?auto_140737 ?auto_140741 ) ) ( not ( = ?auto_140737 ?auto_140742 ) ) ( not ( = ?auto_140737 ?auto_140743 ) ) ( not ( = ?auto_140738 ?auto_140739 ) ) ( not ( = ?auto_140738 ?auto_140740 ) ) ( not ( = ?auto_140738 ?auto_140741 ) ) ( not ( = ?auto_140738 ?auto_140742 ) ) ( not ( = ?auto_140738 ?auto_140743 ) ) ( not ( = ?auto_140739 ?auto_140740 ) ) ( not ( = ?auto_140739 ?auto_140741 ) ) ( not ( = ?auto_140739 ?auto_140742 ) ) ( not ( = ?auto_140739 ?auto_140743 ) ) ( not ( = ?auto_140740 ?auto_140741 ) ) ( not ( = ?auto_140740 ?auto_140742 ) ) ( not ( = ?auto_140740 ?auto_140743 ) ) ( not ( = ?auto_140741 ?auto_140742 ) ) ( not ( = ?auto_140741 ?auto_140743 ) ) ( not ( = ?auto_140742 ?auto_140743 ) ) )
    :subtasks
    ( ( !STACK ?auto_140743 ?auto_140742 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140744 - BLOCK
      ?auto_140745 - BLOCK
      ?auto_140746 - BLOCK
      ?auto_140747 - BLOCK
      ?auto_140748 - BLOCK
      ?auto_140749 - BLOCK
      ?auto_140750 - BLOCK
    )
    :vars
    (
      ?auto_140751 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_140749 ) ( ON-TABLE ?auto_140744 ) ( ON ?auto_140745 ?auto_140744 ) ( ON ?auto_140746 ?auto_140745 ) ( ON ?auto_140747 ?auto_140746 ) ( ON ?auto_140748 ?auto_140747 ) ( ON ?auto_140749 ?auto_140748 ) ( not ( = ?auto_140744 ?auto_140745 ) ) ( not ( = ?auto_140744 ?auto_140746 ) ) ( not ( = ?auto_140744 ?auto_140747 ) ) ( not ( = ?auto_140744 ?auto_140748 ) ) ( not ( = ?auto_140744 ?auto_140749 ) ) ( not ( = ?auto_140744 ?auto_140750 ) ) ( not ( = ?auto_140745 ?auto_140746 ) ) ( not ( = ?auto_140745 ?auto_140747 ) ) ( not ( = ?auto_140745 ?auto_140748 ) ) ( not ( = ?auto_140745 ?auto_140749 ) ) ( not ( = ?auto_140745 ?auto_140750 ) ) ( not ( = ?auto_140746 ?auto_140747 ) ) ( not ( = ?auto_140746 ?auto_140748 ) ) ( not ( = ?auto_140746 ?auto_140749 ) ) ( not ( = ?auto_140746 ?auto_140750 ) ) ( not ( = ?auto_140747 ?auto_140748 ) ) ( not ( = ?auto_140747 ?auto_140749 ) ) ( not ( = ?auto_140747 ?auto_140750 ) ) ( not ( = ?auto_140748 ?auto_140749 ) ) ( not ( = ?auto_140748 ?auto_140750 ) ) ( not ( = ?auto_140749 ?auto_140750 ) ) ( ON ?auto_140750 ?auto_140751 ) ( CLEAR ?auto_140750 ) ( HAND-EMPTY ) ( not ( = ?auto_140744 ?auto_140751 ) ) ( not ( = ?auto_140745 ?auto_140751 ) ) ( not ( = ?auto_140746 ?auto_140751 ) ) ( not ( = ?auto_140747 ?auto_140751 ) ) ( not ( = ?auto_140748 ?auto_140751 ) ) ( not ( = ?auto_140749 ?auto_140751 ) ) ( not ( = ?auto_140750 ?auto_140751 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140750 ?auto_140751 )
      ( MAKE-7PILE ?auto_140744 ?auto_140745 ?auto_140746 ?auto_140747 ?auto_140748 ?auto_140749 ?auto_140750 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140752 - BLOCK
      ?auto_140753 - BLOCK
      ?auto_140754 - BLOCK
      ?auto_140755 - BLOCK
      ?auto_140756 - BLOCK
      ?auto_140757 - BLOCK
      ?auto_140758 - BLOCK
    )
    :vars
    (
      ?auto_140759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140752 ) ( ON ?auto_140753 ?auto_140752 ) ( ON ?auto_140754 ?auto_140753 ) ( ON ?auto_140755 ?auto_140754 ) ( ON ?auto_140756 ?auto_140755 ) ( not ( = ?auto_140752 ?auto_140753 ) ) ( not ( = ?auto_140752 ?auto_140754 ) ) ( not ( = ?auto_140752 ?auto_140755 ) ) ( not ( = ?auto_140752 ?auto_140756 ) ) ( not ( = ?auto_140752 ?auto_140757 ) ) ( not ( = ?auto_140752 ?auto_140758 ) ) ( not ( = ?auto_140753 ?auto_140754 ) ) ( not ( = ?auto_140753 ?auto_140755 ) ) ( not ( = ?auto_140753 ?auto_140756 ) ) ( not ( = ?auto_140753 ?auto_140757 ) ) ( not ( = ?auto_140753 ?auto_140758 ) ) ( not ( = ?auto_140754 ?auto_140755 ) ) ( not ( = ?auto_140754 ?auto_140756 ) ) ( not ( = ?auto_140754 ?auto_140757 ) ) ( not ( = ?auto_140754 ?auto_140758 ) ) ( not ( = ?auto_140755 ?auto_140756 ) ) ( not ( = ?auto_140755 ?auto_140757 ) ) ( not ( = ?auto_140755 ?auto_140758 ) ) ( not ( = ?auto_140756 ?auto_140757 ) ) ( not ( = ?auto_140756 ?auto_140758 ) ) ( not ( = ?auto_140757 ?auto_140758 ) ) ( ON ?auto_140758 ?auto_140759 ) ( CLEAR ?auto_140758 ) ( not ( = ?auto_140752 ?auto_140759 ) ) ( not ( = ?auto_140753 ?auto_140759 ) ) ( not ( = ?auto_140754 ?auto_140759 ) ) ( not ( = ?auto_140755 ?auto_140759 ) ) ( not ( = ?auto_140756 ?auto_140759 ) ) ( not ( = ?auto_140757 ?auto_140759 ) ) ( not ( = ?auto_140758 ?auto_140759 ) ) ( HOLDING ?auto_140757 ) ( CLEAR ?auto_140756 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140752 ?auto_140753 ?auto_140754 ?auto_140755 ?auto_140756 ?auto_140757 )
      ( MAKE-7PILE ?auto_140752 ?auto_140753 ?auto_140754 ?auto_140755 ?auto_140756 ?auto_140757 ?auto_140758 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140760 - BLOCK
      ?auto_140761 - BLOCK
      ?auto_140762 - BLOCK
      ?auto_140763 - BLOCK
      ?auto_140764 - BLOCK
      ?auto_140765 - BLOCK
      ?auto_140766 - BLOCK
    )
    :vars
    (
      ?auto_140767 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140760 ) ( ON ?auto_140761 ?auto_140760 ) ( ON ?auto_140762 ?auto_140761 ) ( ON ?auto_140763 ?auto_140762 ) ( ON ?auto_140764 ?auto_140763 ) ( not ( = ?auto_140760 ?auto_140761 ) ) ( not ( = ?auto_140760 ?auto_140762 ) ) ( not ( = ?auto_140760 ?auto_140763 ) ) ( not ( = ?auto_140760 ?auto_140764 ) ) ( not ( = ?auto_140760 ?auto_140765 ) ) ( not ( = ?auto_140760 ?auto_140766 ) ) ( not ( = ?auto_140761 ?auto_140762 ) ) ( not ( = ?auto_140761 ?auto_140763 ) ) ( not ( = ?auto_140761 ?auto_140764 ) ) ( not ( = ?auto_140761 ?auto_140765 ) ) ( not ( = ?auto_140761 ?auto_140766 ) ) ( not ( = ?auto_140762 ?auto_140763 ) ) ( not ( = ?auto_140762 ?auto_140764 ) ) ( not ( = ?auto_140762 ?auto_140765 ) ) ( not ( = ?auto_140762 ?auto_140766 ) ) ( not ( = ?auto_140763 ?auto_140764 ) ) ( not ( = ?auto_140763 ?auto_140765 ) ) ( not ( = ?auto_140763 ?auto_140766 ) ) ( not ( = ?auto_140764 ?auto_140765 ) ) ( not ( = ?auto_140764 ?auto_140766 ) ) ( not ( = ?auto_140765 ?auto_140766 ) ) ( ON ?auto_140766 ?auto_140767 ) ( not ( = ?auto_140760 ?auto_140767 ) ) ( not ( = ?auto_140761 ?auto_140767 ) ) ( not ( = ?auto_140762 ?auto_140767 ) ) ( not ( = ?auto_140763 ?auto_140767 ) ) ( not ( = ?auto_140764 ?auto_140767 ) ) ( not ( = ?auto_140765 ?auto_140767 ) ) ( not ( = ?auto_140766 ?auto_140767 ) ) ( CLEAR ?auto_140764 ) ( ON ?auto_140765 ?auto_140766 ) ( CLEAR ?auto_140765 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140767 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140767 ?auto_140766 )
      ( MAKE-7PILE ?auto_140760 ?auto_140761 ?auto_140762 ?auto_140763 ?auto_140764 ?auto_140765 ?auto_140766 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140768 - BLOCK
      ?auto_140769 - BLOCK
      ?auto_140770 - BLOCK
      ?auto_140771 - BLOCK
      ?auto_140772 - BLOCK
      ?auto_140773 - BLOCK
      ?auto_140774 - BLOCK
    )
    :vars
    (
      ?auto_140775 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140768 ) ( ON ?auto_140769 ?auto_140768 ) ( ON ?auto_140770 ?auto_140769 ) ( ON ?auto_140771 ?auto_140770 ) ( not ( = ?auto_140768 ?auto_140769 ) ) ( not ( = ?auto_140768 ?auto_140770 ) ) ( not ( = ?auto_140768 ?auto_140771 ) ) ( not ( = ?auto_140768 ?auto_140772 ) ) ( not ( = ?auto_140768 ?auto_140773 ) ) ( not ( = ?auto_140768 ?auto_140774 ) ) ( not ( = ?auto_140769 ?auto_140770 ) ) ( not ( = ?auto_140769 ?auto_140771 ) ) ( not ( = ?auto_140769 ?auto_140772 ) ) ( not ( = ?auto_140769 ?auto_140773 ) ) ( not ( = ?auto_140769 ?auto_140774 ) ) ( not ( = ?auto_140770 ?auto_140771 ) ) ( not ( = ?auto_140770 ?auto_140772 ) ) ( not ( = ?auto_140770 ?auto_140773 ) ) ( not ( = ?auto_140770 ?auto_140774 ) ) ( not ( = ?auto_140771 ?auto_140772 ) ) ( not ( = ?auto_140771 ?auto_140773 ) ) ( not ( = ?auto_140771 ?auto_140774 ) ) ( not ( = ?auto_140772 ?auto_140773 ) ) ( not ( = ?auto_140772 ?auto_140774 ) ) ( not ( = ?auto_140773 ?auto_140774 ) ) ( ON ?auto_140774 ?auto_140775 ) ( not ( = ?auto_140768 ?auto_140775 ) ) ( not ( = ?auto_140769 ?auto_140775 ) ) ( not ( = ?auto_140770 ?auto_140775 ) ) ( not ( = ?auto_140771 ?auto_140775 ) ) ( not ( = ?auto_140772 ?auto_140775 ) ) ( not ( = ?auto_140773 ?auto_140775 ) ) ( not ( = ?auto_140774 ?auto_140775 ) ) ( ON ?auto_140773 ?auto_140774 ) ( CLEAR ?auto_140773 ) ( ON-TABLE ?auto_140775 ) ( HOLDING ?auto_140772 ) ( CLEAR ?auto_140771 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140768 ?auto_140769 ?auto_140770 ?auto_140771 ?auto_140772 )
      ( MAKE-7PILE ?auto_140768 ?auto_140769 ?auto_140770 ?auto_140771 ?auto_140772 ?auto_140773 ?auto_140774 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140776 - BLOCK
      ?auto_140777 - BLOCK
      ?auto_140778 - BLOCK
      ?auto_140779 - BLOCK
      ?auto_140780 - BLOCK
      ?auto_140781 - BLOCK
      ?auto_140782 - BLOCK
    )
    :vars
    (
      ?auto_140783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140776 ) ( ON ?auto_140777 ?auto_140776 ) ( ON ?auto_140778 ?auto_140777 ) ( ON ?auto_140779 ?auto_140778 ) ( not ( = ?auto_140776 ?auto_140777 ) ) ( not ( = ?auto_140776 ?auto_140778 ) ) ( not ( = ?auto_140776 ?auto_140779 ) ) ( not ( = ?auto_140776 ?auto_140780 ) ) ( not ( = ?auto_140776 ?auto_140781 ) ) ( not ( = ?auto_140776 ?auto_140782 ) ) ( not ( = ?auto_140777 ?auto_140778 ) ) ( not ( = ?auto_140777 ?auto_140779 ) ) ( not ( = ?auto_140777 ?auto_140780 ) ) ( not ( = ?auto_140777 ?auto_140781 ) ) ( not ( = ?auto_140777 ?auto_140782 ) ) ( not ( = ?auto_140778 ?auto_140779 ) ) ( not ( = ?auto_140778 ?auto_140780 ) ) ( not ( = ?auto_140778 ?auto_140781 ) ) ( not ( = ?auto_140778 ?auto_140782 ) ) ( not ( = ?auto_140779 ?auto_140780 ) ) ( not ( = ?auto_140779 ?auto_140781 ) ) ( not ( = ?auto_140779 ?auto_140782 ) ) ( not ( = ?auto_140780 ?auto_140781 ) ) ( not ( = ?auto_140780 ?auto_140782 ) ) ( not ( = ?auto_140781 ?auto_140782 ) ) ( ON ?auto_140782 ?auto_140783 ) ( not ( = ?auto_140776 ?auto_140783 ) ) ( not ( = ?auto_140777 ?auto_140783 ) ) ( not ( = ?auto_140778 ?auto_140783 ) ) ( not ( = ?auto_140779 ?auto_140783 ) ) ( not ( = ?auto_140780 ?auto_140783 ) ) ( not ( = ?auto_140781 ?auto_140783 ) ) ( not ( = ?auto_140782 ?auto_140783 ) ) ( ON ?auto_140781 ?auto_140782 ) ( ON-TABLE ?auto_140783 ) ( CLEAR ?auto_140779 ) ( ON ?auto_140780 ?auto_140781 ) ( CLEAR ?auto_140780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140783 ?auto_140782 ?auto_140781 )
      ( MAKE-7PILE ?auto_140776 ?auto_140777 ?auto_140778 ?auto_140779 ?auto_140780 ?auto_140781 ?auto_140782 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140784 - BLOCK
      ?auto_140785 - BLOCK
      ?auto_140786 - BLOCK
      ?auto_140787 - BLOCK
      ?auto_140788 - BLOCK
      ?auto_140789 - BLOCK
      ?auto_140790 - BLOCK
    )
    :vars
    (
      ?auto_140791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140784 ) ( ON ?auto_140785 ?auto_140784 ) ( ON ?auto_140786 ?auto_140785 ) ( not ( = ?auto_140784 ?auto_140785 ) ) ( not ( = ?auto_140784 ?auto_140786 ) ) ( not ( = ?auto_140784 ?auto_140787 ) ) ( not ( = ?auto_140784 ?auto_140788 ) ) ( not ( = ?auto_140784 ?auto_140789 ) ) ( not ( = ?auto_140784 ?auto_140790 ) ) ( not ( = ?auto_140785 ?auto_140786 ) ) ( not ( = ?auto_140785 ?auto_140787 ) ) ( not ( = ?auto_140785 ?auto_140788 ) ) ( not ( = ?auto_140785 ?auto_140789 ) ) ( not ( = ?auto_140785 ?auto_140790 ) ) ( not ( = ?auto_140786 ?auto_140787 ) ) ( not ( = ?auto_140786 ?auto_140788 ) ) ( not ( = ?auto_140786 ?auto_140789 ) ) ( not ( = ?auto_140786 ?auto_140790 ) ) ( not ( = ?auto_140787 ?auto_140788 ) ) ( not ( = ?auto_140787 ?auto_140789 ) ) ( not ( = ?auto_140787 ?auto_140790 ) ) ( not ( = ?auto_140788 ?auto_140789 ) ) ( not ( = ?auto_140788 ?auto_140790 ) ) ( not ( = ?auto_140789 ?auto_140790 ) ) ( ON ?auto_140790 ?auto_140791 ) ( not ( = ?auto_140784 ?auto_140791 ) ) ( not ( = ?auto_140785 ?auto_140791 ) ) ( not ( = ?auto_140786 ?auto_140791 ) ) ( not ( = ?auto_140787 ?auto_140791 ) ) ( not ( = ?auto_140788 ?auto_140791 ) ) ( not ( = ?auto_140789 ?auto_140791 ) ) ( not ( = ?auto_140790 ?auto_140791 ) ) ( ON ?auto_140789 ?auto_140790 ) ( ON-TABLE ?auto_140791 ) ( ON ?auto_140788 ?auto_140789 ) ( CLEAR ?auto_140788 ) ( HOLDING ?auto_140787 ) ( CLEAR ?auto_140786 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140784 ?auto_140785 ?auto_140786 ?auto_140787 )
      ( MAKE-7PILE ?auto_140784 ?auto_140785 ?auto_140786 ?auto_140787 ?auto_140788 ?auto_140789 ?auto_140790 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140792 - BLOCK
      ?auto_140793 - BLOCK
      ?auto_140794 - BLOCK
      ?auto_140795 - BLOCK
      ?auto_140796 - BLOCK
      ?auto_140797 - BLOCK
      ?auto_140798 - BLOCK
    )
    :vars
    (
      ?auto_140799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140792 ) ( ON ?auto_140793 ?auto_140792 ) ( ON ?auto_140794 ?auto_140793 ) ( not ( = ?auto_140792 ?auto_140793 ) ) ( not ( = ?auto_140792 ?auto_140794 ) ) ( not ( = ?auto_140792 ?auto_140795 ) ) ( not ( = ?auto_140792 ?auto_140796 ) ) ( not ( = ?auto_140792 ?auto_140797 ) ) ( not ( = ?auto_140792 ?auto_140798 ) ) ( not ( = ?auto_140793 ?auto_140794 ) ) ( not ( = ?auto_140793 ?auto_140795 ) ) ( not ( = ?auto_140793 ?auto_140796 ) ) ( not ( = ?auto_140793 ?auto_140797 ) ) ( not ( = ?auto_140793 ?auto_140798 ) ) ( not ( = ?auto_140794 ?auto_140795 ) ) ( not ( = ?auto_140794 ?auto_140796 ) ) ( not ( = ?auto_140794 ?auto_140797 ) ) ( not ( = ?auto_140794 ?auto_140798 ) ) ( not ( = ?auto_140795 ?auto_140796 ) ) ( not ( = ?auto_140795 ?auto_140797 ) ) ( not ( = ?auto_140795 ?auto_140798 ) ) ( not ( = ?auto_140796 ?auto_140797 ) ) ( not ( = ?auto_140796 ?auto_140798 ) ) ( not ( = ?auto_140797 ?auto_140798 ) ) ( ON ?auto_140798 ?auto_140799 ) ( not ( = ?auto_140792 ?auto_140799 ) ) ( not ( = ?auto_140793 ?auto_140799 ) ) ( not ( = ?auto_140794 ?auto_140799 ) ) ( not ( = ?auto_140795 ?auto_140799 ) ) ( not ( = ?auto_140796 ?auto_140799 ) ) ( not ( = ?auto_140797 ?auto_140799 ) ) ( not ( = ?auto_140798 ?auto_140799 ) ) ( ON ?auto_140797 ?auto_140798 ) ( ON-TABLE ?auto_140799 ) ( ON ?auto_140796 ?auto_140797 ) ( CLEAR ?auto_140794 ) ( ON ?auto_140795 ?auto_140796 ) ( CLEAR ?auto_140795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140799 ?auto_140798 ?auto_140797 ?auto_140796 )
      ( MAKE-7PILE ?auto_140792 ?auto_140793 ?auto_140794 ?auto_140795 ?auto_140796 ?auto_140797 ?auto_140798 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140800 - BLOCK
      ?auto_140801 - BLOCK
      ?auto_140802 - BLOCK
      ?auto_140803 - BLOCK
      ?auto_140804 - BLOCK
      ?auto_140805 - BLOCK
      ?auto_140806 - BLOCK
    )
    :vars
    (
      ?auto_140807 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140800 ) ( ON ?auto_140801 ?auto_140800 ) ( not ( = ?auto_140800 ?auto_140801 ) ) ( not ( = ?auto_140800 ?auto_140802 ) ) ( not ( = ?auto_140800 ?auto_140803 ) ) ( not ( = ?auto_140800 ?auto_140804 ) ) ( not ( = ?auto_140800 ?auto_140805 ) ) ( not ( = ?auto_140800 ?auto_140806 ) ) ( not ( = ?auto_140801 ?auto_140802 ) ) ( not ( = ?auto_140801 ?auto_140803 ) ) ( not ( = ?auto_140801 ?auto_140804 ) ) ( not ( = ?auto_140801 ?auto_140805 ) ) ( not ( = ?auto_140801 ?auto_140806 ) ) ( not ( = ?auto_140802 ?auto_140803 ) ) ( not ( = ?auto_140802 ?auto_140804 ) ) ( not ( = ?auto_140802 ?auto_140805 ) ) ( not ( = ?auto_140802 ?auto_140806 ) ) ( not ( = ?auto_140803 ?auto_140804 ) ) ( not ( = ?auto_140803 ?auto_140805 ) ) ( not ( = ?auto_140803 ?auto_140806 ) ) ( not ( = ?auto_140804 ?auto_140805 ) ) ( not ( = ?auto_140804 ?auto_140806 ) ) ( not ( = ?auto_140805 ?auto_140806 ) ) ( ON ?auto_140806 ?auto_140807 ) ( not ( = ?auto_140800 ?auto_140807 ) ) ( not ( = ?auto_140801 ?auto_140807 ) ) ( not ( = ?auto_140802 ?auto_140807 ) ) ( not ( = ?auto_140803 ?auto_140807 ) ) ( not ( = ?auto_140804 ?auto_140807 ) ) ( not ( = ?auto_140805 ?auto_140807 ) ) ( not ( = ?auto_140806 ?auto_140807 ) ) ( ON ?auto_140805 ?auto_140806 ) ( ON-TABLE ?auto_140807 ) ( ON ?auto_140804 ?auto_140805 ) ( ON ?auto_140803 ?auto_140804 ) ( CLEAR ?auto_140803 ) ( HOLDING ?auto_140802 ) ( CLEAR ?auto_140801 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140800 ?auto_140801 ?auto_140802 )
      ( MAKE-7PILE ?auto_140800 ?auto_140801 ?auto_140802 ?auto_140803 ?auto_140804 ?auto_140805 ?auto_140806 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140808 - BLOCK
      ?auto_140809 - BLOCK
      ?auto_140810 - BLOCK
      ?auto_140811 - BLOCK
      ?auto_140812 - BLOCK
      ?auto_140813 - BLOCK
      ?auto_140814 - BLOCK
    )
    :vars
    (
      ?auto_140815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140808 ) ( ON ?auto_140809 ?auto_140808 ) ( not ( = ?auto_140808 ?auto_140809 ) ) ( not ( = ?auto_140808 ?auto_140810 ) ) ( not ( = ?auto_140808 ?auto_140811 ) ) ( not ( = ?auto_140808 ?auto_140812 ) ) ( not ( = ?auto_140808 ?auto_140813 ) ) ( not ( = ?auto_140808 ?auto_140814 ) ) ( not ( = ?auto_140809 ?auto_140810 ) ) ( not ( = ?auto_140809 ?auto_140811 ) ) ( not ( = ?auto_140809 ?auto_140812 ) ) ( not ( = ?auto_140809 ?auto_140813 ) ) ( not ( = ?auto_140809 ?auto_140814 ) ) ( not ( = ?auto_140810 ?auto_140811 ) ) ( not ( = ?auto_140810 ?auto_140812 ) ) ( not ( = ?auto_140810 ?auto_140813 ) ) ( not ( = ?auto_140810 ?auto_140814 ) ) ( not ( = ?auto_140811 ?auto_140812 ) ) ( not ( = ?auto_140811 ?auto_140813 ) ) ( not ( = ?auto_140811 ?auto_140814 ) ) ( not ( = ?auto_140812 ?auto_140813 ) ) ( not ( = ?auto_140812 ?auto_140814 ) ) ( not ( = ?auto_140813 ?auto_140814 ) ) ( ON ?auto_140814 ?auto_140815 ) ( not ( = ?auto_140808 ?auto_140815 ) ) ( not ( = ?auto_140809 ?auto_140815 ) ) ( not ( = ?auto_140810 ?auto_140815 ) ) ( not ( = ?auto_140811 ?auto_140815 ) ) ( not ( = ?auto_140812 ?auto_140815 ) ) ( not ( = ?auto_140813 ?auto_140815 ) ) ( not ( = ?auto_140814 ?auto_140815 ) ) ( ON ?auto_140813 ?auto_140814 ) ( ON-TABLE ?auto_140815 ) ( ON ?auto_140812 ?auto_140813 ) ( ON ?auto_140811 ?auto_140812 ) ( CLEAR ?auto_140809 ) ( ON ?auto_140810 ?auto_140811 ) ( CLEAR ?auto_140810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140815 ?auto_140814 ?auto_140813 ?auto_140812 ?auto_140811 )
      ( MAKE-7PILE ?auto_140808 ?auto_140809 ?auto_140810 ?auto_140811 ?auto_140812 ?auto_140813 ?auto_140814 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140816 - BLOCK
      ?auto_140817 - BLOCK
      ?auto_140818 - BLOCK
      ?auto_140819 - BLOCK
      ?auto_140820 - BLOCK
      ?auto_140821 - BLOCK
      ?auto_140822 - BLOCK
    )
    :vars
    (
      ?auto_140823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140816 ) ( not ( = ?auto_140816 ?auto_140817 ) ) ( not ( = ?auto_140816 ?auto_140818 ) ) ( not ( = ?auto_140816 ?auto_140819 ) ) ( not ( = ?auto_140816 ?auto_140820 ) ) ( not ( = ?auto_140816 ?auto_140821 ) ) ( not ( = ?auto_140816 ?auto_140822 ) ) ( not ( = ?auto_140817 ?auto_140818 ) ) ( not ( = ?auto_140817 ?auto_140819 ) ) ( not ( = ?auto_140817 ?auto_140820 ) ) ( not ( = ?auto_140817 ?auto_140821 ) ) ( not ( = ?auto_140817 ?auto_140822 ) ) ( not ( = ?auto_140818 ?auto_140819 ) ) ( not ( = ?auto_140818 ?auto_140820 ) ) ( not ( = ?auto_140818 ?auto_140821 ) ) ( not ( = ?auto_140818 ?auto_140822 ) ) ( not ( = ?auto_140819 ?auto_140820 ) ) ( not ( = ?auto_140819 ?auto_140821 ) ) ( not ( = ?auto_140819 ?auto_140822 ) ) ( not ( = ?auto_140820 ?auto_140821 ) ) ( not ( = ?auto_140820 ?auto_140822 ) ) ( not ( = ?auto_140821 ?auto_140822 ) ) ( ON ?auto_140822 ?auto_140823 ) ( not ( = ?auto_140816 ?auto_140823 ) ) ( not ( = ?auto_140817 ?auto_140823 ) ) ( not ( = ?auto_140818 ?auto_140823 ) ) ( not ( = ?auto_140819 ?auto_140823 ) ) ( not ( = ?auto_140820 ?auto_140823 ) ) ( not ( = ?auto_140821 ?auto_140823 ) ) ( not ( = ?auto_140822 ?auto_140823 ) ) ( ON ?auto_140821 ?auto_140822 ) ( ON-TABLE ?auto_140823 ) ( ON ?auto_140820 ?auto_140821 ) ( ON ?auto_140819 ?auto_140820 ) ( ON ?auto_140818 ?auto_140819 ) ( CLEAR ?auto_140818 ) ( HOLDING ?auto_140817 ) ( CLEAR ?auto_140816 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140816 ?auto_140817 )
      ( MAKE-7PILE ?auto_140816 ?auto_140817 ?auto_140818 ?auto_140819 ?auto_140820 ?auto_140821 ?auto_140822 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140824 - BLOCK
      ?auto_140825 - BLOCK
      ?auto_140826 - BLOCK
      ?auto_140827 - BLOCK
      ?auto_140828 - BLOCK
      ?auto_140829 - BLOCK
      ?auto_140830 - BLOCK
    )
    :vars
    (
      ?auto_140831 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_140824 ) ( not ( = ?auto_140824 ?auto_140825 ) ) ( not ( = ?auto_140824 ?auto_140826 ) ) ( not ( = ?auto_140824 ?auto_140827 ) ) ( not ( = ?auto_140824 ?auto_140828 ) ) ( not ( = ?auto_140824 ?auto_140829 ) ) ( not ( = ?auto_140824 ?auto_140830 ) ) ( not ( = ?auto_140825 ?auto_140826 ) ) ( not ( = ?auto_140825 ?auto_140827 ) ) ( not ( = ?auto_140825 ?auto_140828 ) ) ( not ( = ?auto_140825 ?auto_140829 ) ) ( not ( = ?auto_140825 ?auto_140830 ) ) ( not ( = ?auto_140826 ?auto_140827 ) ) ( not ( = ?auto_140826 ?auto_140828 ) ) ( not ( = ?auto_140826 ?auto_140829 ) ) ( not ( = ?auto_140826 ?auto_140830 ) ) ( not ( = ?auto_140827 ?auto_140828 ) ) ( not ( = ?auto_140827 ?auto_140829 ) ) ( not ( = ?auto_140827 ?auto_140830 ) ) ( not ( = ?auto_140828 ?auto_140829 ) ) ( not ( = ?auto_140828 ?auto_140830 ) ) ( not ( = ?auto_140829 ?auto_140830 ) ) ( ON ?auto_140830 ?auto_140831 ) ( not ( = ?auto_140824 ?auto_140831 ) ) ( not ( = ?auto_140825 ?auto_140831 ) ) ( not ( = ?auto_140826 ?auto_140831 ) ) ( not ( = ?auto_140827 ?auto_140831 ) ) ( not ( = ?auto_140828 ?auto_140831 ) ) ( not ( = ?auto_140829 ?auto_140831 ) ) ( not ( = ?auto_140830 ?auto_140831 ) ) ( ON ?auto_140829 ?auto_140830 ) ( ON-TABLE ?auto_140831 ) ( ON ?auto_140828 ?auto_140829 ) ( ON ?auto_140827 ?auto_140828 ) ( ON ?auto_140826 ?auto_140827 ) ( CLEAR ?auto_140824 ) ( ON ?auto_140825 ?auto_140826 ) ( CLEAR ?auto_140825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140831 ?auto_140830 ?auto_140829 ?auto_140828 ?auto_140827 ?auto_140826 )
      ( MAKE-7PILE ?auto_140824 ?auto_140825 ?auto_140826 ?auto_140827 ?auto_140828 ?auto_140829 ?auto_140830 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140832 - BLOCK
      ?auto_140833 - BLOCK
      ?auto_140834 - BLOCK
      ?auto_140835 - BLOCK
      ?auto_140836 - BLOCK
      ?auto_140837 - BLOCK
      ?auto_140838 - BLOCK
    )
    :vars
    (
      ?auto_140839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140832 ?auto_140833 ) ) ( not ( = ?auto_140832 ?auto_140834 ) ) ( not ( = ?auto_140832 ?auto_140835 ) ) ( not ( = ?auto_140832 ?auto_140836 ) ) ( not ( = ?auto_140832 ?auto_140837 ) ) ( not ( = ?auto_140832 ?auto_140838 ) ) ( not ( = ?auto_140833 ?auto_140834 ) ) ( not ( = ?auto_140833 ?auto_140835 ) ) ( not ( = ?auto_140833 ?auto_140836 ) ) ( not ( = ?auto_140833 ?auto_140837 ) ) ( not ( = ?auto_140833 ?auto_140838 ) ) ( not ( = ?auto_140834 ?auto_140835 ) ) ( not ( = ?auto_140834 ?auto_140836 ) ) ( not ( = ?auto_140834 ?auto_140837 ) ) ( not ( = ?auto_140834 ?auto_140838 ) ) ( not ( = ?auto_140835 ?auto_140836 ) ) ( not ( = ?auto_140835 ?auto_140837 ) ) ( not ( = ?auto_140835 ?auto_140838 ) ) ( not ( = ?auto_140836 ?auto_140837 ) ) ( not ( = ?auto_140836 ?auto_140838 ) ) ( not ( = ?auto_140837 ?auto_140838 ) ) ( ON ?auto_140838 ?auto_140839 ) ( not ( = ?auto_140832 ?auto_140839 ) ) ( not ( = ?auto_140833 ?auto_140839 ) ) ( not ( = ?auto_140834 ?auto_140839 ) ) ( not ( = ?auto_140835 ?auto_140839 ) ) ( not ( = ?auto_140836 ?auto_140839 ) ) ( not ( = ?auto_140837 ?auto_140839 ) ) ( not ( = ?auto_140838 ?auto_140839 ) ) ( ON ?auto_140837 ?auto_140838 ) ( ON-TABLE ?auto_140839 ) ( ON ?auto_140836 ?auto_140837 ) ( ON ?auto_140835 ?auto_140836 ) ( ON ?auto_140834 ?auto_140835 ) ( ON ?auto_140833 ?auto_140834 ) ( CLEAR ?auto_140833 ) ( HOLDING ?auto_140832 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140832 )
      ( MAKE-7PILE ?auto_140832 ?auto_140833 ?auto_140834 ?auto_140835 ?auto_140836 ?auto_140837 ?auto_140838 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140840 - BLOCK
      ?auto_140841 - BLOCK
      ?auto_140842 - BLOCK
      ?auto_140843 - BLOCK
      ?auto_140844 - BLOCK
      ?auto_140845 - BLOCK
      ?auto_140846 - BLOCK
    )
    :vars
    (
      ?auto_140847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140840 ?auto_140841 ) ) ( not ( = ?auto_140840 ?auto_140842 ) ) ( not ( = ?auto_140840 ?auto_140843 ) ) ( not ( = ?auto_140840 ?auto_140844 ) ) ( not ( = ?auto_140840 ?auto_140845 ) ) ( not ( = ?auto_140840 ?auto_140846 ) ) ( not ( = ?auto_140841 ?auto_140842 ) ) ( not ( = ?auto_140841 ?auto_140843 ) ) ( not ( = ?auto_140841 ?auto_140844 ) ) ( not ( = ?auto_140841 ?auto_140845 ) ) ( not ( = ?auto_140841 ?auto_140846 ) ) ( not ( = ?auto_140842 ?auto_140843 ) ) ( not ( = ?auto_140842 ?auto_140844 ) ) ( not ( = ?auto_140842 ?auto_140845 ) ) ( not ( = ?auto_140842 ?auto_140846 ) ) ( not ( = ?auto_140843 ?auto_140844 ) ) ( not ( = ?auto_140843 ?auto_140845 ) ) ( not ( = ?auto_140843 ?auto_140846 ) ) ( not ( = ?auto_140844 ?auto_140845 ) ) ( not ( = ?auto_140844 ?auto_140846 ) ) ( not ( = ?auto_140845 ?auto_140846 ) ) ( ON ?auto_140846 ?auto_140847 ) ( not ( = ?auto_140840 ?auto_140847 ) ) ( not ( = ?auto_140841 ?auto_140847 ) ) ( not ( = ?auto_140842 ?auto_140847 ) ) ( not ( = ?auto_140843 ?auto_140847 ) ) ( not ( = ?auto_140844 ?auto_140847 ) ) ( not ( = ?auto_140845 ?auto_140847 ) ) ( not ( = ?auto_140846 ?auto_140847 ) ) ( ON ?auto_140845 ?auto_140846 ) ( ON-TABLE ?auto_140847 ) ( ON ?auto_140844 ?auto_140845 ) ( ON ?auto_140843 ?auto_140844 ) ( ON ?auto_140842 ?auto_140843 ) ( ON ?auto_140841 ?auto_140842 ) ( ON ?auto_140840 ?auto_140841 ) ( CLEAR ?auto_140840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140847 ?auto_140846 ?auto_140845 ?auto_140844 ?auto_140843 ?auto_140842 ?auto_140841 )
      ( MAKE-7PILE ?auto_140840 ?auto_140841 ?auto_140842 ?auto_140843 ?auto_140844 ?auto_140845 ?auto_140846 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140848 - BLOCK
      ?auto_140849 - BLOCK
      ?auto_140850 - BLOCK
      ?auto_140851 - BLOCK
      ?auto_140852 - BLOCK
      ?auto_140853 - BLOCK
      ?auto_140854 - BLOCK
    )
    :vars
    (
      ?auto_140855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140848 ?auto_140849 ) ) ( not ( = ?auto_140848 ?auto_140850 ) ) ( not ( = ?auto_140848 ?auto_140851 ) ) ( not ( = ?auto_140848 ?auto_140852 ) ) ( not ( = ?auto_140848 ?auto_140853 ) ) ( not ( = ?auto_140848 ?auto_140854 ) ) ( not ( = ?auto_140849 ?auto_140850 ) ) ( not ( = ?auto_140849 ?auto_140851 ) ) ( not ( = ?auto_140849 ?auto_140852 ) ) ( not ( = ?auto_140849 ?auto_140853 ) ) ( not ( = ?auto_140849 ?auto_140854 ) ) ( not ( = ?auto_140850 ?auto_140851 ) ) ( not ( = ?auto_140850 ?auto_140852 ) ) ( not ( = ?auto_140850 ?auto_140853 ) ) ( not ( = ?auto_140850 ?auto_140854 ) ) ( not ( = ?auto_140851 ?auto_140852 ) ) ( not ( = ?auto_140851 ?auto_140853 ) ) ( not ( = ?auto_140851 ?auto_140854 ) ) ( not ( = ?auto_140852 ?auto_140853 ) ) ( not ( = ?auto_140852 ?auto_140854 ) ) ( not ( = ?auto_140853 ?auto_140854 ) ) ( ON ?auto_140854 ?auto_140855 ) ( not ( = ?auto_140848 ?auto_140855 ) ) ( not ( = ?auto_140849 ?auto_140855 ) ) ( not ( = ?auto_140850 ?auto_140855 ) ) ( not ( = ?auto_140851 ?auto_140855 ) ) ( not ( = ?auto_140852 ?auto_140855 ) ) ( not ( = ?auto_140853 ?auto_140855 ) ) ( not ( = ?auto_140854 ?auto_140855 ) ) ( ON ?auto_140853 ?auto_140854 ) ( ON-TABLE ?auto_140855 ) ( ON ?auto_140852 ?auto_140853 ) ( ON ?auto_140851 ?auto_140852 ) ( ON ?auto_140850 ?auto_140851 ) ( ON ?auto_140849 ?auto_140850 ) ( HOLDING ?auto_140848 ) ( CLEAR ?auto_140849 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140855 ?auto_140854 ?auto_140853 ?auto_140852 ?auto_140851 ?auto_140850 ?auto_140849 ?auto_140848 )
      ( MAKE-7PILE ?auto_140848 ?auto_140849 ?auto_140850 ?auto_140851 ?auto_140852 ?auto_140853 ?auto_140854 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140856 - BLOCK
      ?auto_140857 - BLOCK
      ?auto_140858 - BLOCK
      ?auto_140859 - BLOCK
      ?auto_140860 - BLOCK
      ?auto_140861 - BLOCK
      ?auto_140862 - BLOCK
    )
    :vars
    (
      ?auto_140863 - BLOCK
      ?auto_140864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140856 ?auto_140857 ) ) ( not ( = ?auto_140856 ?auto_140858 ) ) ( not ( = ?auto_140856 ?auto_140859 ) ) ( not ( = ?auto_140856 ?auto_140860 ) ) ( not ( = ?auto_140856 ?auto_140861 ) ) ( not ( = ?auto_140856 ?auto_140862 ) ) ( not ( = ?auto_140857 ?auto_140858 ) ) ( not ( = ?auto_140857 ?auto_140859 ) ) ( not ( = ?auto_140857 ?auto_140860 ) ) ( not ( = ?auto_140857 ?auto_140861 ) ) ( not ( = ?auto_140857 ?auto_140862 ) ) ( not ( = ?auto_140858 ?auto_140859 ) ) ( not ( = ?auto_140858 ?auto_140860 ) ) ( not ( = ?auto_140858 ?auto_140861 ) ) ( not ( = ?auto_140858 ?auto_140862 ) ) ( not ( = ?auto_140859 ?auto_140860 ) ) ( not ( = ?auto_140859 ?auto_140861 ) ) ( not ( = ?auto_140859 ?auto_140862 ) ) ( not ( = ?auto_140860 ?auto_140861 ) ) ( not ( = ?auto_140860 ?auto_140862 ) ) ( not ( = ?auto_140861 ?auto_140862 ) ) ( ON ?auto_140862 ?auto_140863 ) ( not ( = ?auto_140856 ?auto_140863 ) ) ( not ( = ?auto_140857 ?auto_140863 ) ) ( not ( = ?auto_140858 ?auto_140863 ) ) ( not ( = ?auto_140859 ?auto_140863 ) ) ( not ( = ?auto_140860 ?auto_140863 ) ) ( not ( = ?auto_140861 ?auto_140863 ) ) ( not ( = ?auto_140862 ?auto_140863 ) ) ( ON ?auto_140861 ?auto_140862 ) ( ON-TABLE ?auto_140863 ) ( ON ?auto_140860 ?auto_140861 ) ( ON ?auto_140859 ?auto_140860 ) ( ON ?auto_140858 ?auto_140859 ) ( ON ?auto_140857 ?auto_140858 ) ( CLEAR ?auto_140857 ) ( ON ?auto_140856 ?auto_140864 ) ( CLEAR ?auto_140856 ) ( HAND-EMPTY ) ( not ( = ?auto_140856 ?auto_140864 ) ) ( not ( = ?auto_140857 ?auto_140864 ) ) ( not ( = ?auto_140858 ?auto_140864 ) ) ( not ( = ?auto_140859 ?auto_140864 ) ) ( not ( = ?auto_140860 ?auto_140864 ) ) ( not ( = ?auto_140861 ?auto_140864 ) ) ( not ( = ?auto_140862 ?auto_140864 ) ) ( not ( = ?auto_140863 ?auto_140864 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_140856 ?auto_140864 )
      ( MAKE-7PILE ?auto_140856 ?auto_140857 ?auto_140858 ?auto_140859 ?auto_140860 ?auto_140861 ?auto_140862 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140865 - BLOCK
      ?auto_140866 - BLOCK
      ?auto_140867 - BLOCK
      ?auto_140868 - BLOCK
      ?auto_140869 - BLOCK
      ?auto_140870 - BLOCK
      ?auto_140871 - BLOCK
    )
    :vars
    (
      ?auto_140873 - BLOCK
      ?auto_140872 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140865 ?auto_140866 ) ) ( not ( = ?auto_140865 ?auto_140867 ) ) ( not ( = ?auto_140865 ?auto_140868 ) ) ( not ( = ?auto_140865 ?auto_140869 ) ) ( not ( = ?auto_140865 ?auto_140870 ) ) ( not ( = ?auto_140865 ?auto_140871 ) ) ( not ( = ?auto_140866 ?auto_140867 ) ) ( not ( = ?auto_140866 ?auto_140868 ) ) ( not ( = ?auto_140866 ?auto_140869 ) ) ( not ( = ?auto_140866 ?auto_140870 ) ) ( not ( = ?auto_140866 ?auto_140871 ) ) ( not ( = ?auto_140867 ?auto_140868 ) ) ( not ( = ?auto_140867 ?auto_140869 ) ) ( not ( = ?auto_140867 ?auto_140870 ) ) ( not ( = ?auto_140867 ?auto_140871 ) ) ( not ( = ?auto_140868 ?auto_140869 ) ) ( not ( = ?auto_140868 ?auto_140870 ) ) ( not ( = ?auto_140868 ?auto_140871 ) ) ( not ( = ?auto_140869 ?auto_140870 ) ) ( not ( = ?auto_140869 ?auto_140871 ) ) ( not ( = ?auto_140870 ?auto_140871 ) ) ( ON ?auto_140871 ?auto_140873 ) ( not ( = ?auto_140865 ?auto_140873 ) ) ( not ( = ?auto_140866 ?auto_140873 ) ) ( not ( = ?auto_140867 ?auto_140873 ) ) ( not ( = ?auto_140868 ?auto_140873 ) ) ( not ( = ?auto_140869 ?auto_140873 ) ) ( not ( = ?auto_140870 ?auto_140873 ) ) ( not ( = ?auto_140871 ?auto_140873 ) ) ( ON ?auto_140870 ?auto_140871 ) ( ON-TABLE ?auto_140873 ) ( ON ?auto_140869 ?auto_140870 ) ( ON ?auto_140868 ?auto_140869 ) ( ON ?auto_140867 ?auto_140868 ) ( ON ?auto_140865 ?auto_140872 ) ( CLEAR ?auto_140865 ) ( not ( = ?auto_140865 ?auto_140872 ) ) ( not ( = ?auto_140866 ?auto_140872 ) ) ( not ( = ?auto_140867 ?auto_140872 ) ) ( not ( = ?auto_140868 ?auto_140872 ) ) ( not ( = ?auto_140869 ?auto_140872 ) ) ( not ( = ?auto_140870 ?auto_140872 ) ) ( not ( = ?auto_140871 ?auto_140872 ) ) ( not ( = ?auto_140873 ?auto_140872 ) ) ( HOLDING ?auto_140866 ) ( CLEAR ?auto_140867 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140873 ?auto_140871 ?auto_140870 ?auto_140869 ?auto_140868 ?auto_140867 ?auto_140866 )
      ( MAKE-7PILE ?auto_140865 ?auto_140866 ?auto_140867 ?auto_140868 ?auto_140869 ?auto_140870 ?auto_140871 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140874 - BLOCK
      ?auto_140875 - BLOCK
      ?auto_140876 - BLOCK
      ?auto_140877 - BLOCK
      ?auto_140878 - BLOCK
      ?auto_140879 - BLOCK
      ?auto_140880 - BLOCK
    )
    :vars
    (
      ?auto_140881 - BLOCK
      ?auto_140882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140874 ?auto_140875 ) ) ( not ( = ?auto_140874 ?auto_140876 ) ) ( not ( = ?auto_140874 ?auto_140877 ) ) ( not ( = ?auto_140874 ?auto_140878 ) ) ( not ( = ?auto_140874 ?auto_140879 ) ) ( not ( = ?auto_140874 ?auto_140880 ) ) ( not ( = ?auto_140875 ?auto_140876 ) ) ( not ( = ?auto_140875 ?auto_140877 ) ) ( not ( = ?auto_140875 ?auto_140878 ) ) ( not ( = ?auto_140875 ?auto_140879 ) ) ( not ( = ?auto_140875 ?auto_140880 ) ) ( not ( = ?auto_140876 ?auto_140877 ) ) ( not ( = ?auto_140876 ?auto_140878 ) ) ( not ( = ?auto_140876 ?auto_140879 ) ) ( not ( = ?auto_140876 ?auto_140880 ) ) ( not ( = ?auto_140877 ?auto_140878 ) ) ( not ( = ?auto_140877 ?auto_140879 ) ) ( not ( = ?auto_140877 ?auto_140880 ) ) ( not ( = ?auto_140878 ?auto_140879 ) ) ( not ( = ?auto_140878 ?auto_140880 ) ) ( not ( = ?auto_140879 ?auto_140880 ) ) ( ON ?auto_140880 ?auto_140881 ) ( not ( = ?auto_140874 ?auto_140881 ) ) ( not ( = ?auto_140875 ?auto_140881 ) ) ( not ( = ?auto_140876 ?auto_140881 ) ) ( not ( = ?auto_140877 ?auto_140881 ) ) ( not ( = ?auto_140878 ?auto_140881 ) ) ( not ( = ?auto_140879 ?auto_140881 ) ) ( not ( = ?auto_140880 ?auto_140881 ) ) ( ON ?auto_140879 ?auto_140880 ) ( ON-TABLE ?auto_140881 ) ( ON ?auto_140878 ?auto_140879 ) ( ON ?auto_140877 ?auto_140878 ) ( ON ?auto_140876 ?auto_140877 ) ( ON ?auto_140874 ?auto_140882 ) ( not ( = ?auto_140874 ?auto_140882 ) ) ( not ( = ?auto_140875 ?auto_140882 ) ) ( not ( = ?auto_140876 ?auto_140882 ) ) ( not ( = ?auto_140877 ?auto_140882 ) ) ( not ( = ?auto_140878 ?auto_140882 ) ) ( not ( = ?auto_140879 ?auto_140882 ) ) ( not ( = ?auto_140880 ?auto_140882 ) ) ( not ( = ?auto_140881 ?auto_140882 ) ) ( CLEAR ?auto_140876 ) ( ON ?auto_140875 ?auto_140874 ) ( CLEAR ?auto_140875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_140882 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140882 ?auto_140874 )
      ( MAKE-7PILE ?auto_140874 ?auto_140875 ?auto_140876 ?auto_140877 ?auto_140878 ?auto_140879 ?auto_140880 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140883 - BLOCK
      ?auto_140884 - BLOCK
      ?auto_140885 - BLOCK
      ?auto_140886 - BLOCK
      ?auto_140887 - BLOCK
      ?auto_140888 - BLOCK
      ?auto_140889 - BLOCK
    )
    :vars
    (
      ?auto_140891 - BLOCK
      ?auto_140890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140883 ?auto_140884 ) ) ( not ( = ?auto_140883 ?auto_140885 ) ) ( not ( = ?auto_140883 ?auto_140886 ) ) ( not ( = ?auto_140883 ?auto_140887 ) ) ( not ( = ?auto_140883 ?auto_140888 ) ) ( not ( = ?auto_140883 ?auto_140889 ) ) ( not ( = ?auto_140884 ?auto_140885 ) ) ( not ( = ?auto_140884 ?auto_140886 ) ) ( not ( = ?auto_140884 ?auto_140887 ) ) ( not ( = ?auto_140884 ?auto_140888 ) ) ( not ( = ?auto_140884 ?auto_140889 ) ) ( not ( = ?auto_140885 ?auto_140886 ) ) ( not ( = ?auto_140885 ?auto_140887 ) ) ( not ( = ?auto_140885 ?auto_140888 ) ) ( not ( = ?auto_140885 ?auto_140889 ) ) ( not ( = ?auto_140886 ?auto_140887 ) ) ( not ( = ?auto_140886 ?auto_140888 ) ) ( not ( = ?auto_140886 ?auto_140889 ) ) ( not ( = ?auto_140887 ?auto_140888 ) ) ( not ( = ?auto_140887 ?auto_140889 ) ) ( not ( = ?auto_140888 ?auto_140889 ) ) ( ON ?auto_140889 ?auto_140891 ) ( not ( = ?auto_140883 ?auto_140891 ) ) ( not ( = ?auto_140884 ?auto_140891 ) ) ( not ( = ?auto_140885 ?auto_140891 ) ) ( not ( = ?auto_140886 ?auto_140891 ) ) ( not ( = ?auto_140887 ?auto_140891 ) ) ( not ( = ?auto_140888 ?auto_140891 ) ) ( not ( = ?auto_140889 ?auto_140891 ) ) ( ON ?auto_140888 ?auto_140889 ) ( ON-TABLE ?auto_140891 ) ( ON ?auto_140887 ?auto_140888 ) ( ON ?auto_140886 ?auto_140887 ) ( ON ?auto_140883 ?auto_140890 ) ( not ( = ?auto_140883 ?auto_140890 ) ) ( not ( = ?auto_140884 ?auto_140890 ) ) ( not ( = ?auto_140885 ?auto_140890 ) ) ( not ( = ?auto_140886 ?auto_140890 ) ) ( not ( = ?auto_140887 ?auto_140890 ) ) ( not ( = ?auto_140888 ?auto_140890 ) ) ( not ( = ?auto_140889 ?auto_140890 ) ) ( not ( = ?auto_140891 ?auto_140890 ) ) ( ON ?auto_140884 ?auto_140883 ) ( CLEAR ?auto_140884 ) ( ON-TABLE ?auto_140890 ) ( HOLDING ?auto_140885 ) ( CLEAR ?auto_140886 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140891 ?auto_140889 ?auto_140888 ?auto_140887 ?auto_140886 ?auto_140885 )
      ( MAKE-7PILE ?auto_140883 ?auto_140884 ?auto_140885 ?auto_140886 ?auto_140887 ?auto_140888 ?auto_140889 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140892 - BLOCK
      ?auto_140893 - BLOCK
      ?auto_140894 - BLOCK
      ?auto_140895 - BLOCK
      ?auto_140896 - BLOCK
      ?auto_140897 - BLOCK
      ?auto_140898 - BLOCK
    )
    :vars
    (
      ?auto_140899 - BLOCK
      ?auto_140900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140892 ?auto_140893 ) ) ( not ( = ?auto_140892 ?auto_140894 ) ) ( not ( = ?auto_140892 ?auto_140895 ) ) ( not ( = ?auto_140892 ?auto_140896 ) ) ( not ( = ?auto_140892 ?auto_140897 ) ) ( not ( = ?auto_140892 ?auto_140898 ) ) ( not ( = ?auto_140893 ?auto_140894 ) ) ( not ( = ?auto_140893 ?auto_140895 ) ) ( not ( = ?auto_140893 ?auto_140896 ) ) ( not ( = ?auto_140893 ?auto_140897 ) ) ( not ( = ?auto_140893 ?auto_140898 ) ) ( not ( = ?auto_140894 ?auto_140895 ) ) ( not ( = ?auto_140894 ?auto_140896 ) ) ( not ( = ?auto_140894 ?auto_140897 ) ) ( not ( = ?auto_140894 ?auto_140898 ) ) ( not ( = ?auto_140895 ?auto_140896 ) ) ( not ( = ?auto_140895 ?auto_140897 ) ) ( not ( = ?auto_140895 ?auto_140898 ) ) ( not ( = ?auto_140896 ?auto_140897 ) ) ( not ( = ?auto_140896 ?auto_140898 ) ) ( not ( = ?auto_140897 ?auto_140898 ) ) ( ON ?auto_140898 ?auto_140899 ) ( not ( = ?auto_140892 ?auto_140899 ) ) ( not ( = ?auto_140893 ?auto_140899 ) ) ( not ( = ?auto_140894 ?auto_140899 ) ) ( not ( = ?auto_140895 ?auto_140899 ) ) ( not ( = ?auto_140896 ?auto_140899 ) ) ( not ( = ?auto_140897 ?auto_140899 ) ) ( not ( = ?auto_140898 ?auto_140899 ) ) ( ON ?auto_140897 ?auto_140898 ) ( ON-TABLE ?auto_140899 ) ( ON ?auto_140896 ?auto_140897 ) ( ON ?auto_140895 ?auto_140896 ) ( ON ?auto_140892 ?auto_140900 ) ( not ( = ?auto_140892 ?auto_140900 ) ) ( not ( = ?auto_140893 ?auto_140900 ) ) ( not ( = ?auto_140894 ?auto_140900 ) ) ( not ( = ?auto_140895 ?auto_140900 ) ) ( not ( = ?auto_140896 ?auto_140900 ) ) ( not ( = ?auto_140897 ?auto_140900 ) ) ( not ( = ?auto_140898 ?auto_140900 ) ) ( not ( = ?auto_140899 ?auto_140900 ) ) ( ON ?auto_140893 ?auto_140892 ) ( ON-TABLE ?auto_140900 ) ( CLEAR ?auto_140895 ) ( ON ?auto_140894 ?auto_140893 ) ( CLEAR ?auto_140894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140900 ?auto_140892 ?auto_140893 )
      ( MAKE-7PILE ?auto_140892 ?auto_140893 ?auto_140894 ?auto_140895 ?auto_140896 ?auto_140897 ?auto_140898 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140901 - BLOCK
      ?auto_140902 - BLOCK
      ?auto_140903 - BLOCK
      ?auto_140904 - BLOCK
      ?auto_140905 - BLOCK
      ?auto_140906 - BLOCK
      ?auto_140907 - BLOCK
    )
    :vars
    (
      ?auto_140909 - BLOCK
      ?auto_140908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140901 ?auto_140902 ) ) ( not ( = ?auto_140901 ?auto_140903 ) ) ( not ( = ?auto_140901 ?auto_140904 ) ) ( not ( = ?auto_140901 ?auto_140905 ) ) ( not ( = ?auto_140901 ?auto_140906 ) ) ( not ( = ?auto_140901 ?auto_140907 ) ) ( not ( = ?auto_140902 ?auto_140903 ) ) ( not ( = ?auto_140902 ?auto_140904 ) ) ( not ( = ?auto_140902 ?auto_140905 ) ) ( not ( = ?auto_140902 ?auto_140906 ) ) ( not ( = ?auto_140902 ?auto_140907 ) ) ( not ( = ?auto_140903 ?auto_140904 ) ) ( not ( = ?auto_140903 ?auto_140905 ) ) ( not ( = ?auto_140903 ?auto_140906 ) ) ( not ( = ?auto_140903 ?auto_140907 ) ) ( not ( = ?auto_140904 ?auto_140905 ) ) ( not ( = ?auto_140904 ?auto_140906 ) ) ( not ( = ?auto_140904 ?auto_140907 ) ) ( not ( = ?auto_140905 ?auto_140906 ) ) ( not ( = ?auto_140905 ?auto_140907 ) ) ( not ( = ?auto_140906 ?auto_140907 ) ) ( ON ?auto_140907 ?auto_140909 ) ( not ( = ?auto_140901 ?auto_140909 ) ) ( not ( = ?auto_140902 ?auto_140909 ) ) ( not ( = ?auto_140903 ?auto_140909 ) ) ( not ( = ?auto_140904 ?auto_140909 ) ) ( not ( = ?auto_140905 ?auto_140909 ) ) ( not ( = ?auto_140906 ?auto_140909 ) ) ( not ( = ?auto_140907 ?auto_140909 ) ) ( ON ?auto_140906 ?auto_140907 ) ( ON-TABLE ?auto_140909 ) ( ON ?auto_140905 ?auto_140906 ) ( ON ?auto_140901 ?auto_140908 ) ( not ( = ?auto_140901 ?auto_140908 ) ) ( not ( = ?auto_140902 ?auto_140908 ) ) ( not ( = ?auto_140903 ?auto_140908 ) ) ( not ( = ?auto_140904 ?auto_140908 ) ) ( not ( = ?auto_140905 ?auto_140908 ) ) ( not ( = ?auto_140906 ?auto_140908 ) ) ( not ( = ?auto_140907 ?auto_140908 ) ) ( not ( = ?auto_140909 ?auto_140908 ) ) ( ON ?auto_140902 ?auto_140901 ) ( ON-TABLE ?auto_140908 ) ( ON ?auto_140903 ?auto_140902 ) ( CLEAR ?auto_140903 ) ( HOLDING ?auto_140904 ) ( CLEAR ?auto_140905 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140909 ?auto_140907 ?auto_140906 ?auto_140905 ?auto_140904 )
      ( MAKE-7PILE ?auto_140901 ?auto_140902 ?auto_140903 ?auto_140904 ?auto_140905 ?auto_140906 ?auto_140907 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140910 - BLOCK
      ?auto_140911 - BLOCK
      ?auto_140912 - BLOCK
      ?auto_140913 - BLOCK
      ?auto_140914 - BLOCK
      ?auto_140915 - BLOCK
      ?auto_140916 - BLOCK
    )
    :vars
    (
      ?auto_140917 - BLOCK
      ?auto_140918 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140910 ?auto_140911 ) ) ( not ( = ?auto_140910 ?auto_140912 ) ) ( not ( = ?auto_140910 ?auto_140913 ) ) ( not ( = ?auto_140910 ?auto_140914 ) ) ( not ( = ?auto_140910 ?auto_140915 ) ) ( not ( = ?auto_140910 ?auto_140916 ) ) ( not ( = ?auto_140911 ?auto_140912 ) ) ( not ( = ?auto_140911 ?auto_140913 ) ) ( not ( = ?auto_140911 ?auto_140914 ) ) ( not ( = ?auto_140911 ?auto_140915 ) ) ( not ( = ?auto_140911 ?auto_140916 ) ) ( not ( = ?auto_140912 ?auto_140913 ) ) ( not ( = ?auto_140912 ?auto_140914 ) ) ( not ( = ?auto_140912 ?auto_140915 ) ) ( not ( = ?auto_140912 ?auto_140916 ) ) ( not ( = ?auto_140913 ?auto_140914 ) ) ( not ( = ?auto_140913 ?auto_140915 ) ) ( not ( = ?auto_140913 ?auto_140916 ) ) ( not ( = ?auto_140914 ?auto_140915 ) ) ( not ( = ?auto_140914 ?auto_140916 ) ) ( not ( = ?auto_140915 ?auto_140916 ) ) ( ON ?auto_140916 ?auto_140917 ) ( not ( = ?auto_140910 ?auto_140917 ) ) ( not ( = ?auto_140911 ?auto_140917 ) ) ( not ( = ?auto_140912 ?auto_140917 ) ) ( not ( = ?auto_140913 ?auto_140917 ) ) ( not ( = ?auto_140914 ?auto_140917 ) ) ( not ( = ?auto_140915 ?auto_140917 ) ) ( not ( = ?auto_140916 ?auto_140917 ) ) ( ON ?auto_140915 ?auto_140916 ) ( ON-TABLE ?auto_140917 ) ( ON ?auto_140914 ?auto_140915 ) ( ON ?auto_140910 ?auto_140918 ) ( not ( = ?auto_140910 ?auto_140918 ) ) ( not ( = ?auto_140911 ?auto_140918 ) ) ( not ( = ?auto_140912 ?auto_140918 ) ) ( not ( = ?auto_140913 ?auto_140918 ) ) ( not ( = ?auto_140914 ?auto_140918 ) ) ( not ( = ?auto_140915 ?auto_140918 ) ) ( not ( = ?auto_140916 ?auto_140918 ) ) ( not ( = ?auto_140917 ?auto_140918 ) ) ( ON ?auto_140911 ?auto_140910 ) ( ON-TABLE ?auto_140918 ) ( ON ?auto_140912 ?auto_140911 ) ( CLEAR ?auto_140914 ) ( ON ?auto_140913 ?auto_140912 ) ( CLEAR ?auto_140913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140918 ?auto_140910 ?auto_140911 ?auto_140912 )
      ( MAKE-7PILE ?auto_140910 ?auto_140911 ?auto_140912 ?auto_140913 ?auto_140914 ?auto_140915 ?auto_140916 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140919 - BLOCK
      ?auto_140920 - BLOCK
      ?auto_140921 - BLOCK
      ?auto_140922 - BLOCK
      ?auto_140923 - BLOCK
      ?auto_140924 - BLOCK
      ?auto_140925 - BLOCK
    )
    :vars
    (
      ?auto_140927 - BLOCK
      ?auto_140926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140919 ?auto_140920 ) ) ( not ( = ?auto_140919 ?auto_140921 ) ) ( not ( = ?auto_140919 ?auto_140922 ) ) ( not ( = ?auto_140919 ?auto_140923 ) ) ( not ( = ?auto_140919 ?auto_140924 ) ) ( not ( = ?auto_140919 ?auto_140925 ) ) ( not ( = ?auto_140920 ?auto_140921 ) ) ( not ( = ?auto_140920 ?auto_140922 ) ) ( not ( = ?auto_140920 ?auto_140923 ) ) ( not ( = ?auto_140920 ?auto_140924 ) ) ( not ( = ?auto_140920 ?auto_140925 ) ) ( not ( = ?auto_140921 ?auto_140922 ) ) ( not ( = ?auto_140921 ?auto_140923 ) ) ( not ( = ?auto_140921 ?auto_140924 ) ) ( not ( = ?auto_140921 ?auto_140925 ) ) ( not ( = ?auto_140922 ?auto_140923 ) ) ( not ( = ?auto_140922 ?auto_140924 ) ) ( not ( = ?auto_140922 ?auto_140925 ) ) ( not ( = ?auto_140923 ?auto_140924 ) ) ( not ( = ?auto_140923 ?auto_140925 ) ) ( not ( = ?auto_140924 ?auto_140925 ) ) ( ON ?auto_140925 ?auto_140927 ) ( not ( = ?auto_140919 ?auto_140927 ) ) ( not ( = ?auto_140920 ?auto_140927 ) ) ( not ( = ?auto_140921 ?auto_140927 ) ) ( not ( = ?auto_140922 ?auto_140927 ) ) ( not ( = ?auto_140923 ?auto_140927 ) ) ( not ( = ?auto_140924 ?auto_140927 ) ) ( not ( = ?auto_140925 ?auto_140927 ) ) ( ON ?auto_140924 ?auto_140925 ) ( ON-TABLE ?auto_140927 ) ( ON ?auto_140919 ?auto_140926 ) ( not ( = ?auto_140919 ?auto_140926 ) ) ( not ( = ?auto_140920 ?auto_140926 ) ) ( not ( = ?auto_140921 ?auto_140926 ) ) ( not ( = ?auto_140922 ?auto_140926 ) ) ( not ( = ?auto_140923 ?auto_140926 ) ) ( not ( = ?auto_140924 ?auto_140926 ) ) ( not ( = ?auto_140925 ?auto_140926 ) ) ( not ( = ?auto_140927 ?auto_140926 ) ) ( ON ?auto_140920 ?auto_140919 ) ( ON-TABLE ?auto_140926 ) ( ON ?auto_140921 ?auto_140920 ) ( ON ?auto_140922 ?auto_140921 ) ( CLEAR ?auto_140922 ) ( HOLDING ?auto_140923 ) ( CLEAR ?auto_140924 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_140927 ?auto_140925 ?auto_140924 ?auto_140923 )
      ( MAKE-7PILE ?auto_140919 ?auto_140920 ?auto_140921 ?auto_140922 ?auto_140923 ?auto_140924 ?auto_140925 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140928 - BLOCK
      ?auto_140929 - BLOCK
      ?auto_140930 - BLOCK
      ?auto_140931 - BLOCK
      ?auto_140932 - BLOCK
      ?auto_140933 - BLOCK
      ?auto_140934 - BLOCK
    )
    :vars
    (
      ?auto_140935 - BLOCK
      ?auto_140936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140928 ?auto_140929 ) ) ( not ( = ?auto_140928 ?auto_140930 ) ) ( not ( = ?auto_140928 ?auto_140931 ) ) ( not ( = ?auto_140928 ?auto_140932 ) ) ( not ( = ?auto_140928 ?auto_140933 ) ) ( not ( = ?auto_140928 ?auto_140934 ) ) ( not ( = ?auto_140929 ?auto_140930 ) ) ( not ( = ?auto_140929 ?auto_140931 ) ) ( not ( = ?auto_140929 ?auto_140932 ) ) ( not ( = ?auto_140929 ?auto_140933 ) ) ( not ( = ?auto_140929 ?auto_140934 ) ) ( not ( = ?auto_140930 ?auto_140931 ) ) ( not ( = ?auto_140930 ?auto_140932 ) ) ( not ( = ?auto_140930 ?auto_140933 ) ) ( not ( = ?auto_140930 ?auto_140934 ) ) ( not ( = ?auto_140931 ?auto_140932 ) ) ( not ( = ?auto_140931 ?auto_140933 ) ) ( not ( = ?auto_140931 ?auto_140934 ) ) ( not ( = ?auto_140932 ?auto_140933 ) ) ( not ( = ?auto_140932 ?auto_140934 ) ) ( not ( = ?auto_140933 ?auto_140934 ) ) ( ON ?auto_140934 ?auto_140935 ) ( not ( = ?auto_140928 ?auto_140935 ) ) ( not ( = ?auto_140929 ?auto_140935 ) ) ( not ( = ?auto_140930 ?auto_140935 ) ) ( not ( = ?auto_140931 ?auto_140935 ) ) ( not ( = ?auto_140932 ?auto_140935 ) ) ( not ( = ?auto_140933 ?auto_140935 ) ) ( not ( = ?auto_140934 ?auto_140935 ) ) ( ON ?auto_140933 ?auto_140934 ) ( ON-TABLE ?auto_140935 ) ( ON ?auto_140928 ?auto_140936 ) ( not ( = ?auto_140928 ?auto_140936 ) ) ( not ( = ?auto_140929 ?auto_140936 ) ) ( not ( = ?auto_140930 ?auto_140936 ) ) ( not ( = ?auto_140931 ?auto_140936 ) ) ( not ( = ?auto_140932 ?auto_140936 ) ) ( not ( = ?auto_140933 ?auto_140936 ) ) ( not ( = ?auto_140934 ?auto_140936 ) ) ( not ( = ?auto_140935 ?auto_140936 ) ) ( ON ?auto_140929 ?auto_140928 ) ( ON-TABLE ?auto_140936 ) ( ON ?auto_140930 ?auto_140929 ) ( ON ?auto_140931 ?auto_140930 ) ( CLEAR ?auto_140933 ) ( ON ?auto_140932 ?auto_140931 ) ( CLEAR ?auto_140932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_140936 ?auto_140928 ?auto_140929 ?auto_140930 ?auto_140931 )
      ( MAKE-7PILE ?auto_140928 ?auto_140929 ?auto_140930 ?auto_140931 ?auto_140932 ?auto_140933 ?auto_140934 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140937 - BLOCK
      ?auto_140938 - BLOCK
      ?auto_140939 - BLOCK
      ?auto_140940 - BLOCK
      ?auto_140941 - BLOCK
      ?auto_140942 - BLOCK
      ?auto_140943 - BLOCK
    )
    :vars
    (
      ?auto_140944 - BLOCK
      ?auto_140945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140937 ?auto_140938 ) ) ( not ( = ?auto_140937 ?auto_140939 ) ) ( not ( = ?auto_140937 ?auto_140940 ) ) ( not ( = ?auto_140937 ?auto_140941 ) ) ( not ( = ?auto_140937 ?auto_140942 ) ) ( not ( = ?auto_140937 ?auto_140943 ) ) ( not ( = ?auto_140938 ?auto_140939 ) ) ( not ( = ?auto_140938 ?auto_140940 ) ) ( not ( = ?auto_140938 ?auto_140941 ) ) ( not ( = ?auto_140938 ?auto_140942 ) ) ( not ( = ?auto_140938 ?auto_140943 ) ) ( not ( = ?auto_140939 ?auto_140940 ) ) ( not ( = ?auto_140939 ?auto_140941 ) ) ( not ( = ?auto_140939 ?auto_140942 ) ) ( not ( = ?auto_140939 ?auto_140943 ) ) ( not ( = ?auto_140940 ?auto_140941 ) ) ( not ( = ?auto_140940 ?auto_140942 ) ) ( not ( = ?auto_140940 ?auto_140943 ) ) ( not ( = ?auto_140941 ?auto_140942 ) ) ( not ( = ?auto_140941 ?auto_140943 ) ) ( not ( = ?auto_140942 ?auto_140943 ) ) ( ON ?auto_140943 ?auto_140944 ) ( not ( = ?auto_140937 ?auto_140944 ) ) ( not ( = ?auto_140938 ?auto_140944 ) ) ( not ( = ?auto_140939 ?auto_140944 ) ) ( not ( = ?auto_140940 ?auto_140944 ) ) ( not ( = ?auto_140941 ?auto_140944 ) ) ( not ( = ?auto_140942 ?auto_140944 ) ) ( not ( = ?auto_140943 ?auto_140944 ) ) ( ON-TABLE ?auto_140944 ) ( ON ?auto_140937 ?auto_140945 ) ( not ( = ?auto_140937 ?auto_140945 ) ) ( not ( = ?auto_140938 ?auto_140945 ) ) ( not ( = ?auto_140939 ?auto_140945 ) ) ( not ( = ?auto_140940 ?auto_140945 ) ) ( not ( = ?auto_140941 ?auto_140945 ) ) ( not ( = ?auto_140942 ?auto_140945 ) ) ( not ( = ?auto_140943 ?auto_140945 ) ) ( not ( = ?auto_140944 ?auto_140945 ) ) ( ON ?auto_140938 ?auto_140937 ) ( ON-TABLE ?auto_140945 ) ( ON ?auto_140939 ?auto_140938 ) ( ON ?auto_140940 ?auto_140939 ) ( ON ?auto_140941 ?auto_140940 ) ( CLEAR ?auto_140941 ) ( HOLDING ?auto_140942 ) ( CLEAR ?auto_140943 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_140944 ?auto_140943 ?auto_140942 )
      ( MAKE-7PILE ?auto_140937 ?auto_140938 ?auto_140939 ?auto_140940 ?auto_140941 ?auto_140942 ?auto_140943 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140946 - BLOCK
      ?auto_140947 - BLOCK
      ?auto_140948 - BLOCK
      ?auto_140949 - BLOCK
      ?auto_140950 - BLOCK
      ?auto_140951 - BLOCK
      ?auto_140952 - BLOCK
    )
    :vars
    (
      ?auto_140953 - BLOCK
      ?auto_140954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140946 ?auto_140947 ) ) ( not ( = ?auto_140946 ?auto_140948 ) ) ( not ( = ?auto_140946 ?auto_140949 ) ) ( not ( = ?auto_140946 ?auto_140950 ) ) ( not ( = ?auto_140946 ?auto_140951 ) ) ( not ( = ?auto_140946 ?auto_140952 ) ) ( not ( = ?auto_140947 ?auto_140948 ) ) ( not ( = ?auto_140947 ?auto_140949 ) ) ( not ( = ?auto_140947 ?auto_140950 ) ) ( not ( = ?auto_140947 ?auto_140951 ) ) ( not ( = ?auto_140947 ?auto_140952 ) ) ( not ( = ?auto_140948 ?auto_140949 ) ) ( not ( = ?auto_140948 ?auto_140950 ) ) ( not ( = ?auto_140948 ?auto_140951 ) ) ( not ( = ?auto_140948 ?auto_140952 ) ) ( not ( = ?auto_140949 ?auto_140950 ) ) ( not ( = ?auto_140949 ?auto_140951 ) ) ( not ( = ?auto_140949 ?auto_140952 ) ) ( not ( = ?auto_140950 ?auto_140951 ) ) ( not ( = ?auto_140950 ?auto_140952 ) ) ( not ( = ?auto_140951 ?auto_140952 ) ) ( ON ?auto_140952 ?auto_140953 ) ( not ( = ?auto_140946 ?auto_140953 ) ) ( not ( = ?auto_140947 ?auto_140953 ) ) ( not ( = ?auto_140948 ?auto_140953 ) ) ( not ( = ?auto_140949 ?auto_140953 ) ) ( not ( = ?auto_140950 ?auto_140953 ) ) ( not ( = ?auto_140951 ?auto_140953 ) ) ( not ( = ?auto_140952 ?auto_140953 ) ) ( ON-TABLE ?auto_140953 ) ( ON ?auto_140946 ?auto_140954 ) ( not ( = ?auto_140946 ?auto_140954 ) ) ( not ( = ?auto_140947 ?auto_140954 ) ) ( not ( = ?auto_140948 ?auto_140954 ) ) ( not ( = ?auto_140949 ?auto_140954 ) ) ( not ( = ?auto_140950 ?auto_140954 ) ) ( not ( = ?auto_140951 ?auto_140954 ) ) ( not ( = ?auto_140952 ?auto_140954 ) ) ( not ( = ?auto_140953 ?auto_140954 ) ) ( ON ?auto_140947 ?auto_140946 ) ( ON-TABLE ?auto_140954 ) ( ON ?auto_140948 ?auto_140947 ) ( ON ?auto_140949 ?auto_140948 ) ( ON ?auto_140950 ?auto_140949 ) ( CLEAR ?auto_140952 ) ( ON ?auto_140951 ?auto_140950 ) ( CLEAR ?auto_140951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_140954 ?auto_140946 ?auto_140947 ?auto_140948 ?auto_140949 ?auto_140950 )
      ( MAKE-7PILE ?auto_140946 ?auto_140947 ?auto_140948 ?auto_140949 ?auto_140950 ?auto_140951 ?auto_140952 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140955 - BLOCK
      ?auto_140956 - BLOCK
      ?auto_140957 - BLOCK
      ?auto_140958 - BLOCK
      ?auto_140959 - BLOCK
      ?auto_140960 - BLOCK
      ?auto_140961 - BLOCK
    )
    :vars
    (
      ?auto_140963 - BLOCK
      ?auto_140962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140955 ?auto_140956 ) ) ( not ( = ?auto_140955 ?auto_140957 ) ) ( not ( = ?auto_140955 ?auto_140958 ) ) ( not ( = ?auto_140955 ?auto_140959 ) ) ( not ( = ?auto_140955 ?auto_140960 ) ) ( not ( = ?auto_140955 ?auto_140961 ) ) ( not ( = ?auto_140956 ?auto_140957 ) ) ( not ( = ?auto_140956 ?auto_140958 ) ) ( not ( = ?auto_140956 ?auto_140959 ) ) ( not ( = ?auto_140956 ?auto_140960 ) ) ( not ( = ?auto_140956 ?auto_140961 ) ) ( not ( = ?auto_140957 ?auto_140958 ) ) ( not ( = ?auto_140957 ?auto_140959 ) ) ( not ( = ?auto_140957 ?auto_140960 ) ) ( not ( = ?auto_140957 ?auto_140961 ) ) ( not ( = ?auto_140958 ?auto_140959 ) ) ( not ( = ?auto_140958 ?auto_140960 ) ) ( not ( = ?auto_140958 ?auto_140961 ) ) ( not ( = ?auto_140959 ?auto_140960 ) ) ( not ( = ?auto_140959 ?auto_140961 ) ) ( not ( = ?auto_140960 ?auto_140961 ) ) ( not ( = ?auto_140955 ?auto_140963 ) ) ( not ( = ?auto_140956 ?auto_140963 ) ) ( not ( = ?auto_140957 ?auto_140963 ) ) ( not ( = ?auto_140958 ?auto_140963 ) ) ( not ( = ?auto_140959 ?auto_140963 ) ) ( not ( = ?auto_140960 ?auto_140963 ) ) ( not ( = ?auto_140961 ?auto_140963 ) ) ( ON-TABLE ?auto_140963 ) ( ON ?auto_140955 ?auto_140962 ) ( not ( = ?auto_140955 ?auto_140962 ) ) ( not ( = ?auto_140956 ?auto_140962 ) ) ( not ( = ?auto_140957 ?auto_140962 ) ) ( not ( = ?auto_140958 ?auto_140962 ) ) ( not ( = ?auto_140959 ?auto_140962 ) ) ( not ( = ?auto_140960 ?auto_140962 ) ) ( not ( = ?auto_140961 ?auto_140962 ) ) ( not ( = ?auto_140963 ?auto_140962 ) ) ( ON ?auto_140956 ?auto_140955 ) ( ON-TABLE ?auto_140962 ) ( ON ?auto_140957 ?auto_140956 ) ( ON ?auto_140958 ?auto_140957 ) ( ON ?auto_140959 ?auto_140958 ) ( ON ?auto_140960 ?auto_140959 ) ( CLEAR ?auto_140960 ) ( HOLDING ?auto_140961 ) ( CLEAR ?auto_140963 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_140963 ?auto_140961 )
      ( MAKE-7PILE ?auto_140955 ?auto_140956 ?auto_140957 ?auto_140958 ?auto_140959 ?auto_140960 ?auto_140961 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140964 - BLOCK
      ?auto_140965 - BLOCK
      ?auto_140966 - BLOCK
      ?auto_140967 - BLOCK
      ?auto_140968 - BLOCK
      ?auto_140969 - BLOCK
      ?auto_140970 - BLOCK
    )
    :vars
    (
      ?auto_140972 - BLOCK
      ?auto_140971 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140964 ?auto_140965 ) ) ( not ( = ?auto_140964 ?auto_140966 ) ) ( not ( = ?auto_140964 ?auto_140967 ) ) ( not ( = ?auto_140964 ?auto_140968 ) ) ( not ( = ?auto_140964 ?auto_140969 ) ) ( not ( = ?auto_140964 ?auto_140970 ) ) ( not ( = ?auto_140965 ?auto_140966 ) ) ( not ( = ?auto_140965 ?auto_140967 ) ) ( not ( = ?auto_140965 ?auto_140968 ) ) ( not ( = ?auto_140965 ?auto_140969 ) ) ( not ( = ?auto_140965 ?auto_140970 ) ) ( not ( = ?auto_140966 ?auto_140967 ) ) ( not ( = ?auto_140966 ?auto_140968 ) ) ( not ( = ?auto_140966 ?auto_140969 ) ) ( not ( = ?auto_140966 ?auto_140970 ) ) ( not ( = ?auto_140967 ?auto_140968 ) ) ( not ( = ?auto_140967 ?auto_140969 ) ) ( not ( = ?auto_140967 ?auto_140970 ) ) ( not ( = ?auto_140968 ?auto_140969 ) ) ( not ( = ?auto_140968 ?auto_140970 ) ) ( not ( = ?auto_140969 ?auto_140970 ) ) ( not ( = ?auto_140964 ?auto_140972 ) ) ( not ( = ?auto_140965 ?auto_140972 ) ) ( not ( = ?auto_140966 ?auto_140972 ) ) ( not ( = ?auto_140967 ?auto_140972 ) ) ( not ( = ?auto_140968 ?auto_140972 ) ) ( not ( = ?auto_140969 ?auto_140972 ) ) ( not ( = ?auto_140970 ?auto_140972 ) ) ( ON-TABLE ?auto_140972 ) ( ON ?auto_140964 ?auto_140971 ) ( not ( = ?auto_140964 ?auto_140971 ) ) ( not ( = ?auto_140965 ?auto_140971 ) ) ( not ( = ?auto_140966 ?auto_140971 ) ) ( not ( = ?auto_140967 ?auto_140971 ) ) ( not ( = ?auto_140968 ?auto_140971 ) ) ( not ( = ?auto_140969 ?auto_140971 ) ) ( not ( = ?auto_140970 ?auto_140971 ) ) ( not ( = ?auto_140972 ?auto_140971 ) ) ( ON ?auto_140965 ?auto_140964 ) ( ON-TABLE ?auto_140971 ) ( ON ?auto_140966 ?auto_140965 ) ( ON ?auto_140967 ?auto_140966 ) ( ON ?auto_140968 ?auto_140967 ) ( ON ?auto_140969 ?auto_140968 ) ( CLEAR ?auto_140972 ) ( ON ?auto_140970 ?auto_140969 ) ( CLEAR ?auto_140970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_140971 ?auto_140964 ?auto_140965 ?auto_140966 ?auto_140967 ?auto_140968 ?auto_140969 )
      ( MAKE-7PILE ?auto_140964 ?auto_140965 ?auto_140966 ?auto_140967 ?auto_140968 ?auto_140969 ?auto_140970 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140973 - BLOCK
      ?auto_140974 - BLOCK
      ?auto_140975 - BLOCK
      ?auto_140976 - BLOCK
      ?auto_140977 - BLOCK
      ?auto_140978 - BLOCK
      ?auto_140979 - BLOCK
    )
    :vars
    (
      ?auto_140981 - BLOCK
      ?auto_140980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140973 ?auto_140974 ) ) ( not ( = ?auto_140973 ?auto_140975 ) ) ( not ( = ?auto_140973 ?auto_140976 ) ) ( not ( = ?auto_140973 ?auto_140977 ) ) ( not ( = ?auto_140973 ?auto_140978 ) ) ( not ( = ?auto_140973 ?auto_140979 ) ) ( not ( = ?auto_140974 ?auto_140975 ) ) ( not ( = ?auto_140974 ?auto_140976 ) ) ( not ( = ?auto_140974 ?auto_140977 ) ) ( not ( = ?auto_140974 ?auto_140978 ) ) ( not ( = ?auto_140974 ?auto_140979 ) ) ( not ( = ?auto_140975 ?auto_140976 ) ) ( not ( = ?auto_140975 ?auto_140977 ) ) ( not ( = ?auto_140975 ?auto_140978 ) ) ( not ( = ?auto_140975 ?auto_140979 ) ) ( not ( = ?auto_140976 ?auto_140977 ) ) ( not ( = ?auto_140976 ?auto_140978 ) ) ( not ( = ?auto_140976 ?auto_140979 ) ) ( not ( = ?auto_140977 ?auto_140978 ) ) ( not ( = ?auto_140977 ?auto_140979 ) ) ( not ( = ?auto_140978 ?auto_140979 ) ) ( not ( = ?auto_140973 ?auto_140981 ) ) ( not ( = ?auto_140974 ?auto_140981 ) ) ( not ( = ?auto_140975 ?auto_140981 ) ) ( not ( = ?auto_140976 ?auto_140981 ) ) ( not ( = ?auto_140977 ?auto_140981 ) ) ( not ( = ?auto_140978 ?auto_140981 ) ) ( not ( = ?auto_140979 ?auto_140981 ) ) ( ON ?auto_140973 ?auto_140980 ) ( not ( = ?auto_140973 ?auto_140980 ) ) ( not ( = ?auto_140974 ?auto_140980 ) ) ( not ( = ?auto_140975 ?auto_140980 ) ) ( not ( = ?auto_140976 ?auto_140980 ) ) ( not ( = ?auto_140977 ?auto_140980 ) ) ( not ( = ?auto_140978 ?auto_140980 ) ) ( not ( = ?auto_140979 ?auto_140980 ) ) ( not ( = ?auto_140981 ?auto_140980 ) ) ( ON ?auto_140974 ?auto_140973 ) ( ON-TABLE ?auto_140980 ) ( ON ?auto_140975 ?auto_140974 ) ( ON ?auto_140976 ?auto_140975 ) ( ON ?auto_140977 ?auto_140976 ) ( ON ?auto_140978 ?auto_140977 ) ( ON ?auto_140979 ?auto_140978 ) ( CLEAR ?auto_140979 ) ( HOLDING ?auto_140981 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_140981 )
      ( MAKE-7PILE ?auto_140973 ?auto_140974 ?auto_140975 ?auto_140976 ?auto_140977 ?auto_140978 ?auto_140979 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_140982 - BLOCK
      ?auto_140983 - BLOCK
      ?auto_140984 - BLOCK
      ?auto_140985 - BLOCK
      ?auto_140986 - BLOCK
      ?auto_140987 - BLOCK
      ?auto_140988 - BLOCK
    )
    :vars
    (
      ?auto_140990 - BLOCK
      ?auto_140989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_140982 ?auto_140983 ) ) ( not ( = ?auto_140982 ?auto_140984 ) ) ( not ( = ?auto_140982 ?auto_140985 ) ) ( not ( = ?auto_140982 ?auto_140986 ) ) ( not ( = ?auto_140982 ?auto_140987 ) ) ( not ( = ?auto_140982 ?auto_140988 ) ) ( not ( = ?auto_140983 ?auto_140984 ) ) ( not ( = ?auto_140983 ?auto_140985 ) ) ( not ( = ?auto_140983 ?auto_140986 ) ) ( not ( = ?auto_140983 ?auto_140987 ) ) ( not ( = ?auto_140983 ?auto_140988 ) ) ( not ( = ?auto_140984 ?auto_140985 ) ) ( not ( = ?auto_140984 ?auto_140986 ) ) ( not ( = ?auto_140984 ?auto_140987 ) ) ( not ( = ?auto_140984 ?auto_140988 ) ) ( not ( = ?auto_140985 ?auto_140986 ) ) ( not ( = ?auto_140985 ?auto_140987 ) ) ( not ( = ?auto_140985 ?auto_140988 ) ) ( not ( = ?auto_140986 ?auto_140987 ) ) ( not ( = ?auto_140986 ?auto_140988 ) ) ( not ( = ?auto_140987 ?auto_140988 ) ) ( not ( = ?auto_140982 ?auto_140990 ) ) ( not ( = ?auto_140983 ?auto_140990 ) ) ( not ( = ?auto_140984 ?auto_140990 ) ) ( not ( = ?auto_140985 ?auto_140990 ) ) ( not ( = ?auto_140986 ?auto_140990 ) ) ( not ( = ?auto_140987 ?auto_140990 ) ) ( not ( = ?auto_140988 ?auto_140990 ) ) ( ON ?auto_140982 ?auto_140989 ) ( not ( = ?auto_140982 ?auto_140989 ) ) ( not ( = ?auto_140983 ?auto_140989 ) ) ( not ( = ?auto_140984 ?auto_140989 ) ) ( not ( = ?auto_140985 ?auto_140989 ) ) ( not ( = ?auto_140986 ?auto_140989 ) ) ( not ( = ?auto_140987 ?auto_140989 ) ) ( not ( = ?auto_140988 ?auto_140989 ) ) ( not ( = ?auto_140990 ?auto_140989 ) ) ( ON ?auto_140983 ?auto_140982 ) ( ON-TABLE ?auto_140989 ) ( ON ?auto_140984 ?auto_140983 ) ( ON ?auto_140985 ?auto_140984 ) ( ON ?auto_140986 ?auto_140985 ) ( ON ?auto_140987 ?auto_140986 ) ( ON ?auto_140988 ?auto_140987 ) ( ON ?auto_140990 ?auto_140988 ) ( CLEAR ?auto_140990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_140989 ?auto_140982 ?auto_140983 ?auto_140984 ?auto_140985 ?auto_140986 ?auto_140987 ?auto_140988 )
      ( MAKE-7PILE ?auto_140982 ?auto_140983 ?auto_140984 ?auto_140985 ?auto_140986 ?auto_140987 ?auto_140988 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_140999 - BLOCK
      ?auto_141000 - BLOCK
      ?auto_141001 - BLOCK
      ?auto_141002 - BLOCK
      ?auto_141003 - BLOCK
      ?auto_141004 - BLOCK
      ?auto_141005 - BLOCK
      ?auto_141006 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_141006 ) ( CLEAR ?auto_141005 ) ( ON-TABLE ?auto_140999 ) ( ON ?auto_141000 ?auto_140999 ) ( ON ?auto_141001 ?auto_141000 ) ( ON ?auto_141002 ?auto_141001 ) ( ON ?auto_141003 ?auto_141002 ) ( ON ?auto_141004 ?auto_141003 ) ( ON ?auto_141005 ?auto_141004 ) ( not ( = ?auto_140999 ?auto_141000 ) ) ( not ( = ?auto_140999 ?auto_141001 ) ) ( not ( = ?auto_140999 ?auto_141002 ) ) ( not ( = ?auto_140999 ?auto_141003 ) ) ( not ( = ?auto_140999 ?auto_141004 ) ) ( not ( = ?auto_140999 ?auto_141005 ) ) ( not ( = ?auto_140999 ?auto_141006 ) ) ( not ( = ?auto_141000 ?auto_141001 ) ) ( not ( = ?auto_141000 ?auto_141002 ) ) ( not ( = ?auto_141000 ?auto_141003 ) ) ( not ( = ?auto_141000 ?auto_141004 ) ) ( not ( = ?auto_141000 ?auto_141005 ) ) ( not ( = ?auto_141000 ?auto_141006 ) ) ( not ( = ?auto_141001 ?auto_141002 ) ) ( not ( = ?auto_141001 ?auto_141003 ) ) ( not ( = ?auto_141001 ?auto_141004 ) ) ( not ( = ?auto_141001 ?auto_141005 ) ) ( not ( = ?auto_141001 ?auto_141006 ) ) ( not ( = ?auto_141002 ?auto_141003 ) ) ( not ( = ?auto_141002 ?auto_141004 ) ) ( not ( = ?auto_141002 ?auto_141005 ) ) ( not ( = ?auto_141002 ?auto_141006 ) ) ( not ( = ?auto_141003 ?auto_141004 ) ) ( not ( = ?auto_141003 ?auto_141005 ) ) ( not ( = ?auto_141003 ?auto_141006 ) ) ( not ( = ?auto_141004 ?auto_141005 ) ) ( not ( = ?auto_141004 ?auto_141006 ) ) ( not ( = ?auto_141005 ?auto_141006 ) ) )
    :subtasks
    ( ( !STACK ?auto_141006 ?auto_141005 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141007 - BLOCK
      ?auto_141008 - BLOCK
      ?auto_141009 - BLOCK
      ?auto_141010 - BLOCK
      ?auto_141011 - BLOCK
      ?auto_141012 - BLOCK
      ?auto_141013 - BLOCK
      ?auto_141014 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_141013 ) ( ON-TABLE ?auto_141007 ) ( ON ?auto_141008 ?auto_141007 ) ( ON ?auto_141009 ?auto_141008 ) ( ON ?auto_141010 ?auto_141009 ) ( ON ?auto_141011 ?auto_141010 ) ( ON ?auto_141012 ?auto_141011 ) ( ON ?auto_141013 ?auto_141012 ) ( not ( = ?auto_141007 ?auto_141008 ) ) ( not ( = ?auto_141007 ?auto_141009 ) ) ( not ( = ?auto_141007 ?auto_141010 ) ) ( not ( = ?auto_141007 ?auto_141011 ) ) ( not ( = ?auto_141007 ?auto_141012 ) ) ( not ( = ?auto_141007 ?auto_141013 ) ) ( not ( = ?auto_141007 ?auto_141014 ) ) ( not ( = ?auto_141008 ?auto_141009 ) ) ( not ( = ?auto_141008 ?auto_141010 ) ) ( not ( = ?auto_141008 ?auto_141011 ) ) ( not ( = ?auto_141008 ?auto_141012 ) ) ( not ( = ?auto_141008 ?auto_141013 ) ) ( not ( = ?auto_141008 ?auto_141014 ) ) ( not ( = ?auto_141009 ?auto_141010 ) ) ( not ( = ?auto_141009 ?auto_141011 ) ) ( not ( = ?auto_141009 ?auto_141012 ) ) ( not ( = ?auto_141009 ?auto_141013 ) ) ( not ( = ?auto_141009 ?auto_141014 ) ) ( not ( = ?auto_141010 ?auto_141011 ) ) ( not ( = ?auto_141010 ?auto_141012 ) ) ( not ( = ?auto_141010 ?auto_141013 ) ) ( not ( = ?auto_141010 ?auto_141014 ) ) ( not ( = ?auto_141011 ?auto_141012 ) ) ( not ( = ?auto_141011 ?auto_141013 ) ) ( not ( = ?auto_141011 ?auto_141014 ) ) ( not ( = ?auto_141012 ?auto_141013 ) ) ( not ( = ?auto_141012 ?auto_141014 ) ) ( not ( = ?auto_141013 ?auto_141014 ) ) ( ON-TABLE ?auto_141014 ) ( CLEAR ?auto_141014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_141014 )
      ( MAKE-8PILE ?auto_141007 ?auto_141008 ?auto_141009 ?auto_141010 ?auto_141011 ?auto_141012 ?auto_141013 ?auto_141014 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141015 - BLOCK
      ?auto_141016 - BLOCK
      ?auto_141017 - BLOCK
      ?auto_141018 - BLOCK
      ?auto_141019 - BLOCK
      ?auto_141020 - BLOCK
      ?auto_141021 - BLOCK
      ?auto_141022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141015 ) ( ON ?auto_141016 ?auto_141015 ) ( ON ?auto_141017 ?auto_141016 ) ( ON ?auto_141018 ?auto_141017 ) ( ON ?auto_141019 ?auto_141018 ) ( ON ?auto_141020 ?auto_141019 ) ( not ( = ?auto_141015 ?auto_141016 ) ) ( not ( = ?auto_141015 ?auto_141017 ) ) ( not ( = ?auto_141015 ?auto_141018 ) ) ( not ( = ?auto_141015 ?auto_141019 ) ) ( not ( = ?auto_141015 ?auto_141020 ) ) ( not ( = ?auto_141015 ?auto_141021 ) ) ( not ( = ?auto_141015 ?auto_141022 ) ) ( not ( = ?auto_141016 ?auto_141017 ) ) ( not ( = ?auto_141016 ?auto_141018 ) ) ( not ( = ?auto_141016 ?auto_141019 ) ) ( not ( = ?auto_141016 ?auto_141020 ) ) ( not ( = ?auto_141016 ?auto_141021 ) ) ( not ( = ?auto_141016 ?auto_141022 ) ) ( not ( = ?auto_141017 ?auto_141018 ) ) ( not ( = ?auto_141017 ?auto_141019 ) ) ( not ( = ?auto_141017 ?auto_141020 ) ) ( not ( = ?auto_141017 ?auto_141021 ) ) ( not ( = ?auto_141017 ?auto_141022 ) ) ( not ( = ?auto_141018 ?auto_141019 ) ) ( not ( = ?auto_141018 ?auto_141020 ) ) ( not ( = ?auto_141018 ?auto_141021 ) ) ( not ( = ?auto_141018 ?auto_141022 ) ) ( not ( = ?auto_141019 ?auto_141020 ) ) ( not ( = ?auto_141019 ?auto_141021 ) ) ( not ( = ?auto_141019 ?auto_141022 ) ) ( not ( = ?auto_141020 ?auto_141021 ) ) ( not ( = ?auto_141020 ?auto_141022 ) ) ( not ( = ?auto_141021 ?auto_141022 ) ) ( ON-TABLE ?auto_141022 ) ( CLEAR ?auto_141022 ) ( HOLDING ?auto_141021 ) ( CLEAR ?auto_141020 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141015 ?auto_141016 ?auto_141017 ?auto_141018 ?auto_141019 ?auto_141020 ?auto_141021 )
      ( MAKE-8PILE ?auto_141015 ?auto_141016 ?auto_141017 ?auto_141018 ?auto_141019 ?auto_141020 ?auto_141021 ?auto_141022 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141023 - BLOCK
      ?auto_141024 - BLOCK
      ?auto_141025 - BLOCK
      ?auto_141026 - BLOCK
      ?auto_141027 - BLOCK
      ?auto_141028 - BLOCK
      ?auto_141029 - BLOCK
      ?auto_141030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141023 ) ( ON ?auto_141024 ?auto_141023 ) ( ON ?auto_141025 ?auto_141024 ) ( ON ?auto_141026 ?auto_141025 ) ( ON ?auto_141027 ?auto_141026 ) ( ON ?auto_141028 ?auto_141027 ) ( not ( = ?auto_141023 ?auto_141024 ) ) ( not ( = ?auto_141023 ?auto_141025 ) ) ( not ( = ?auto_141023 ?auto_141026 ) ) ( not ( = ?auto_141023 ?auto_141027 ) ) ( not ( = ?auto_141023 ?auto_141028 ) ) ( not ( = ?auto_141023 ?auto_141029 ) ) ( not ( = ?auto_141023 ?auto_141030 ) ) ( not ( = ?auto_141024 ?auto_141025 ) ) ( not ( = ?auto_141024 ?auto_141026 ) ) ( not ( = ?auto_141024 ?auto_141027 ) ) ( not ( = ?auto_141024 ?auto_141028 ) ) ( not ( = ?auto_141024 ?auto_141029 ) ) ( not ( = ?auto_141024 ?auto_141030 ) ) ( not ( = ?auto_141025 ?auto_141026 ) ) ( not ( = ?auto_141025 ?auto_141027 ) ) ( not ( = ?auto_141025 ?auto_141028 ) ) ( not ( = ?auto_141025 ?auto_141029 ) ) ( not ( = ?auto_141025 ?auto_141030 ) ) ( not ( = ?auto_141026 ?auto_141027 ) ) ( not ( = ?auto_141026 ?auto_141028 ) ) ( not ( = ?auto_141026 ?auto_141029 ) ) ( not ( = ?auto_141026 ?auto_141030 ) ) ( not ( = ?auto_141027 ?auto_141028 ) ) ( not ( = ?auto_141027 ?auto_141029 ) ) ( not ( = ?auto_141027 ?auto_141030 ) ) ( not ( = ?auto_141028 ?auto_141029 ) ) ( not ( = ?auto_141028 ?auto_141030 ) ) ( not ( = ?auto_141029 ?auto_141030 ) ) ( ON-TABLE ?auto_141030 ) ( CLEAR ?auto_141028 ) ( ON ?auto_141029 ?auto_141030 ) ( CLEAR ?auto_141029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141030 )
      ( MAKE-8PILE ?auto_141023 ?auto_141024 ?auto_141025 ?auto_141026 ?auto_141027 ?auto_141028 ?auto_141029 ?auto_141030 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141031 - BLOCK
      ?auto_141032 - BLOCK
      ?auto_141033 - BLOCK
      ?auto_141034 - BLOCK
      ?auto_141035 - BLOCK
      ?auto_141036 - BLOCK
      ?auto_141037 - BLOCK
      ?auto_141038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141031 ) ( ON ?auto_141032 ?auto_141031 ) ( ON ?auto_141033 ?auto_141032 ) ( ON ?auto_141034 ?auto_141033 ) ( ON ?auto_141035 ?auto_141034 ) ( not ( = ?auto_141031 ?auto_141032 ) ) ( not ( = ?auto_141031 ?auto_141033 ) ) ( not ( = ?auto_141031 ?auto_141034 ) ) ( not ( = ?auto_141031 ?auto_141035 ) ) ( not ( = ?auto_141031 ?auto_141036 ) ) ( not ( = ?auto_141031 ?auto_141037 ) ) ( not ( = ?auto_141031 ?auto_141038 ) ) ( not ( = ?auto_141032 ?auto_141033 ) ) ( not ( = ?auto_141032 ?auto_141034 ) ) ( not ( = ?auto_141032 ?auto_141035 ) ) ( not ( = ?auto_141032 ?auto_141036 ) ) ( not ( = ?auto_141032 ?auto_141037 ) ) ( not ( = ?auto_141032 ?auto_141038 ) ) ( not ( = ?auto_141033 ?auto_141034 ) ) ( not ( = ?auto_141033 ?auto_141035 ) ) ( not ( = ?auto_141033 ?auto_141036 ) ) ( not ( = ?auto_141033 ?auto_141037 ) ) ( not ( = ?auto_141033 ?auto_141038 ) ) ( not ( = ?auto_141034 ?auto_141035 ) ) ( not ( = ?auto_141034 ?auto_141036 ) ) ( not ( = ?auto_141034 ?auto_141037 ) ) ( not ( = ?auto_141034 ?auto_141038 ) ) ( not ( = ?auto_141035 ?auto_141036 ) ) ( not ( = ?auto_141035 ?auto_141037 ) ) ( not ( = ?auto_141035 ?auto_141038 ) ) ( not ( = ?auto_141036 ?auto_141037 ) ) ( not ( = ?auto_141036 ?auto_141038 ) ) ( not ( = ?auto_141037 ?auto_141038 ) ) ( ON-TABLE ?auto_141038 ) ( ON ?auto_141037 ?auto_141038 ) ( CLEAR ?auto_141037 ) ( HOLDING ?auto_141036 ) ( CLEAR ?auto_141035 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141031 ?auto_141032 ?auto_141033 ?auto_141034 ?auto_141035 ?auto_141036 )
      ( MAKE-8PILE ?auto_141031 ?auto_141032 ?auto_141033 ?auto_141034 ?auto_141035 ?auto_141036 ?auto_141037 ?auto_141038 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141039 - BLOCK
      ?auto_141040 - BLOCK
      ?auto_141041 - BLOCK
      ?auto_141042 - BLOCK
      ?auto_141043 - BLOCK
      ?auto_141044 - BLOCK
      ?auto_141045 - BLOCK
      ?auto_141046 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141039 ) ( ON ?auto_141040 ?auto_141039 ) ( ON ?auto_141041 ?auto_141040 ) ( ON ?auto_141042 ?auto_141041 ) ( ON ?auto_141043 ?auto_141042 ) ( not ( = ?auto_141039 ?auto_141040 ) ) ( not ( = ?auto_141039 ?auto_141041 ) ) ( not ( = ?auto_141039 ?auto_141042 ) ) ( not ( = ?auto_141039 ?auto_141043 ) ) ( not ( = ?auto_141039 ?auto_141044 ) ) ( not ( = ?auto_141039 ?auto_141045 ) ) ( not ( = ?auto_141039 ?auto_141046 ) ) ( not ( = ?auto_141040 ?auto_141041 ) ) ( not ( = ?auto_141040 ?auto_141042 ) ) ( not ( = ?auto_141040 ?auto_141043 ) ) ( not ( = ?auto_141040 ?auto_141044 ) ) ( not ( = ?auto_141040 ?auto_141045 ) ) ( not ( = ?auto_141040 ?auto_141046 ) ) ( not ( = ?auto_141041 ?auto_141042 ) ) ( not ( = ?auto_141041 ?auto_141043 ) ) ( not ( = ?auto_141041 ?auto_141044 ) ) ( not ( = ?auto_141041 ?auto_141045 ) ) ( not ( = ?auto_141041 ?auto_141046 ) ) ( not ( = ?auto_141042 ?auto_141043 ) ) ( not ( = ?auto_141042 ?auto_141044 ) ) ( not ( = ?auto_141042 ?auto_141045 ) ) ( not ( = ?auto_141042 ?auto_141046 ) ) ( not ( = ?auto_141043 ?auto_141044 ) ) ( not ( = ?auto_141043 ?auto_141045 ) ) ( not ( = ?auto_141043 ?auto_141046 ) ) ( not ( = ?auto_141044 ?auto_141045 ) ) ( not ( = ?auto_141044 ?auto_141046 ) ) ( not ( = ?auto_141045 ?auto_141046 ) ) ( ON-TABLE ?auto_141046 ) ( ON ?auto_141045 ?auto_141046 ) ( CLEAR ?auto_141043 ) ( ON ?auto_141044 ?auto_141045 ) ( CLEAR ?auto_141044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141046 ?auto_141045 )
      ( MAKE-8PILE ?auto_141039 ?auto_141040 ?auto_141041 ?auto_141042 ?auto_141043 ?auto_141044 ?auto_141045 ?auto_141046 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141047 - BLOCK
      ?auto_141048 - BLOCK
      ?auto_141049 - BLOCK
      ?auto_141050 - BLOCK
      ?auto_141051 - BLOCK
      ?auto_141052 - BLOCK
      ?auto_141053 - BLOCK
      ?auto_141054 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141047 ) ( ON ?auto_141048 ?auto_141047 ) ( ON ?auto_141049 ?auto_141048 ) ( ON ?auto_141050 ?auto_141049 ) ( not ( = ?auto_141047 ?auto_141048 ) ) ( not ( = ?auto_141047 ?auto_141049 ) ) ( not ( = ?auto_141047 ?auto_141050 ) ) ( not ( = ?auto_141047 ?auto_141051 ) ) ( not ( = ?auto_141047 ?auto_141052 ) ) ( not ( = ?auto_141047 ?auto_141053 ) ) ( not ( = ?auto_141047 ?auto_141054 ) ) ( not ( = ?auto_141048 ?auto_141049 ) ) ( not ( = ?auto_141048 ?auto_141050 ) ) ( not ( = ?auto_141048 ?auto_141051 ) ) ( not ( = ?auto_141048 ?auto_141052 ) ) ( not ( = ?auto_141048 ?auto_141053 ) ) ( not ( = ?auto_141048 ?auto_141054 ) ) ( not ( = ?auto_141049 ?auto_141050 ) ) ( not ( = ?auto_141049 ?auto_141051 ) ) ( not ( = ?auto_141049 ?auto_141052 ) ) ( not ( = ?auto_141049 ?auto_141053 ) ) ( not ( = ?auto_141049 ?auto_141054 ) ) ( not ( = ?auto_141050 ?auto_141051 ) ) ( not ( = ?auto_141050 ?auto_141052 ) ) ( not ( = ?auto_141050 ?auto_141053 ) ) ( not ( = ?auto_141050 ?auto_141054 ) ) ( not ( = ?auto_141051 ?auto_141052 ) ) ( not ( = ?auto_141051 ?auto_141053 ) ) ( not ( = ?auto_141051 ?auto_141054 ) ) ( not ( = ?auto_141052 ?auto_141053 ) ) ( not ( = ?auto_141052 ?auto_141054 ) ) ( not ( = ?auto_141053 ?auto_141054 ) ) ( ON-TABLE ?auto_141054 ) ( ON ?auto_141053 ?auto_141054 ) ( ON ?auto_141052 ?auto_141053 ) ( CLEAR ?auto_141052 ) ( HOLDING ?auto_141051 ) ( CLEAR ?auto_141050 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141047 ?auto_141048 ?auto_141049 ?auto_141050 ?auto_141051 )
      ( MAKE-8PILE ?auto_141047 ?auto_141048 ?auto_141049 ?auto_141050 ?auto_141051 ?auto_141052 ?auto_141053 ?auto_141054 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141055 - BLOCK
      ?auto_141056 - BLOCK
      ?auto_141057 - BLOCK
      ?auto_141058 - BLOCK
      ?auto_141059 - BLOCK
      ?auto_141060 - BLOCK
      ?auto_141061 - BLOCK
      ?auto_141062 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141055 ) ( ON ?auto_141056 ?auto_141055 ) ( ON ?auto_141057 ?auto_141056 ) ( ON ?auto_141058 ?auto_141057 ) ( not ( = ?auto_141055 ?auto_141056 ) ) ( not ( = ?auto_141055 ?auto_141057 ) ) ( not ( = ?auto_141055 ?auto_141058 ) ) ( not ( = ?auto_141055 ?auto_141059 ) ) ( not ( = ?auto_141055 ?auto_141060 ) ) ( not ( = ?auto_141055 ?auto_141061 ) ) ( not ( = ?auto_141055 ?auto_141062 ) ) ( not ( = ?auto_141056 ?auto_141057 ) ) ( not ( = ?auto_141056 ?auto_141058 ) ) ( not ( = ?auto_141056 ?auto_141059 ) ) ( not ( = ?auto_141056 ?auto_141060 ) ) ( not ( = ?auto_141056 ?auto_141061 ) ) ( not ( = ?auto_141056 ?auto_141062 ) ) ( not ( = ?auto_141057 ?auto_141058 ) ) ( not ( = ?auto_141057 ?auto_141059 ) ) ( not ( = ?auto_141057 ?auto_141060 ) ) ( not ( = ?auto_141057 ?auto_141061 ) ) ( not ( = ?auto_141057 ?auto_141062 ) ) ( not ( = ?auto_141058 ?auto_141059 ) ) ( not ( = ?auto_141058 ?auto_141060 ) ) ( not ( = ?auto_141058 ?auto_141061 ) ) ( not ( = ?auto_141058 ?auto_141062 ) ) ( not ( = ?auto_141059 ?auto_141060 ) ) ( not ( = ?auto_141059 ?auto_141061 ) ) ( not ( = ?auto_141059 ?auto_141062 ) ) ( not ( = ?auto_141060 ?auto_141061 ) ) ( not ( = ?auto_141060 ?auto_141062 ) ) ( not ( = ?auto_141061 ?auto_141062 ) ) ( ON-TABLE ?auto_141062 ) ( ON ?auto_141061 ?auto_141062 ) ( ON ?auto_141060 ?auto_141061 ) ( CLEAR ?auto_141058 ) ( ON ?auto_141059 ?auto_141060 ) ( CLEAR ?auto_141059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141062 ?auto_141061 ?auto_141060 )
      ( MAKE-8PILE ?auto_141055 ?auto_141056 ?auto_141057 ?auto_141058 ?auto_141059 ?auto_141060 ?auto_141061 ?auto_141062 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141063 - BLOCK
      ?auto_141064 - BLOCK
      ?auto_141065 - BLOCK
      ?auto_141066 - BLOCK
      ?auto_141067 - BLOCK
      ?auto_141068 - BLOCK
      ?auto_141069 - BLOCK
      ?auto_141070 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141063 ) ( ON ?auto_141064 ?auto_141063 ) ( ON ?auto_141065 ?auto_141064 ) ( not ( = ?auto_141063 ?auto_141064 ) ) ( not ( = ?auto_141063 ?auto_141065 ) ) ( not ( = ?auto_141063 ?auto_141066 ) ) ( not ( = ?auto_141063 ?auto_141067 ) ) ( not ( = ?auto_141063 ?auto_141068 ) ) ( not ( = ?auto_141063 ?auto_141069 ) ) ( not ( = ?auto_141063 ?auto_141070 ) ) ( not ( = ?auto_141064 ?auto_141065 ) ) ( not ( = ?auto_141064 ?auto_141066 ) ) ( not ( = ?auto_141064 ?auto_141067 ) ) ( not ( = ?auto_141064 ?auto_141068 ) ) ( not ( = ?auto_141064 ?auto_141069 ) ) ( not ( = ?auto_141064 ?auto_141070 ) ) ( not ( = ?auto_141065 ?auto_141066 ) ) ( not ( = ?auto_141065 ?auto_141067 ) ) ( not ( = ?auto_141065 ?auto_141068 ) ) ( not ( = ?auto_141065 ?auto_141069 ) ) ( not ( = ?auto_141065 ?auto_141070 ) ) ( not ( = ?auto_141066 ?auto_141067 ) ) ( not ( = ?auto_141066 ?auto_141068 ) ) ( not ( = ?auto_141066 ?auto_141069 ) ) ( not ( = ?auto_141066 ?auto_141070 ) ) ( not ( = ?auto_141067 ?auto_141068 ) ) ( not ( = ?auto_141067 ?auto_141069 ) ) ( not ( = ?auto_141067 ?auto_141070 ) ) ( not ( = ?auto_141068 ?auto_141069 ) ) ( not ( = ?auto_141068 ?auto_141070 ) ) ( not ( = ?auto_141069 ?auto_141070 ) ) ( ON-TABLE ?auto_141070 ) ( ON ?auto_141069 ?auto_141070 ) ( ON ?auto_141068 ?auto_141069 ) ( ON ?auto_141067 ?auto_141068 ) ( CLEAR ?auto_141067 ) ( HOLDING ?auto_141066 ) ( CLEAR ?auto_141065 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141063 ?auto_141064 ?auto_141065 ?auto_141066 )
      ( MAKE-8PILE ?auto_141063 ?auto_141064 ?auto_141065 ?auto_141066 ?auto_141067 ?auto_141068 ?auto_141069 ?auto_141070 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141071 - BLOCK
      ?auto_141072 - BLOCK
      ?auto_141073 - BLOCK
      ?auto_141074 - BLOCK
      ?auto_141075 - BLOCK
      ?auto_141076 - BLOCK
      ?auto_141077 - BLOCK
      ?auto_141078 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141071 ) ( ON ?auto_141072 ?auto_141071 ) ( ON ?auto_141073 ?auto_141072 ) ( not ( = ?auto_141071 ?auto_141072 ) ) ( not ( = ?auto_141071 ?auto_141073 ) ) ( not ( = ?auto_141071 ?auto_141074 ) ) ( not ( = ?auto_141071 ?auto_141075 ) ) ( not ( = ?auto_141071 ?auto_141076 ) ) ( not ( = ?auto_141071 ?auto_141077 ) ) ( not ( = ?auto_141071 ?auto_141078 ) ) ( not ( = ?auto_141072 ?auto_141073 ) ) ( not ( = ?auto_141072 ?auto_141074 ) ) ( not ( = ?auto_141072 ?auto_141075 ) ) ( not ( = ?auto_141072 ?auto_141076 ) ) ( not ( = ?auto_141072 ?auto_141077 ) ) ( not ( = ?auto_141072 ?auto_141078 ) ) ( not ( = ?auto_141073 ?auto_141074 ) ) ( not ( = ?auto_141073 ?auto_141075 ) ) ( not ( = ?auto_141073 ?auto_141076 ) ) ( not ( = ?auto_141073 ?auto_141077 ) ) ( not ( = ?auto_141073 ?auto_141078 ) ) ( not ( = ?auto_141074 ?auto_141075 ) ) ( not ( = ?auto_141074 ?auto_141076 ) ) ( not ( = ?auto_141074 ?auto_141077 ) ) ( not ( = ?auto_141074 ?auto_141078 ) ) ( not ( = ?auto_141075 ?auto_141076 ) ) ( not ( = ?auto_141075 ?auto_141077 ) ) ( not ( = ?auto_141075 ?auto_141078 ) ) ( not ( = ?auto_141076 ?auto_141077 ) ) ( not ( = ?auto_141076 ?auto_141078 ) ) ( not ( = ?auto_141077 ?auto_141078 ) ) ( ON-TABLE ?auto_141078 ) ( ON ?auto_141077 ?auto_141078 ) ( ON ?auto_141076 ?auto_141077 ) ( ON ?auto_141075 ?auto_141076 ) ( CLEAR ?auto_141073 ) ( ON ?auto_141074 ?auto_141075 ) ( CLEAR ?auto_141074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141078 ?auto_141077 ?auto_141076 ?auto_141075 )
      ( MAKE-8PILE ?auto_141071 ?auto_141072 ?auto_141073 ?auto_141074 ?auto_141075 ?auto_141076 ?auto_141077 ?auto_141078 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141079 - BLOCK
      ?auto_141080 - BLOCK
      ?auto_141081 - BLOCK
      ?auto_141082 - BLOCK
      ?auto_141083 - BLOCK
      ?auto_141084 - BLOCK
      ?auto_141085 - BLOCK
      ?auto_141086 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141079 ) ( ON ?auto_141080 ?auto_141079 ) ( not ( = ?auto_141079 ?auto_141080 ) ) ( not ( = ?auto_141079 ?auto_141081 ) ) ( not ( = ?auto_141079 ?auto_141082 ) ) ( not ( = ?auto_141079 ?auto_141083 ) ) ( not ( = ?auto_141079 ?auto_141084 ) ) ( not ( = ?auto_141079 ?auto_141085 ) ) ( not ( = ?auto_141079 ?auto_141086 ) ) ( not ( = ?auto_141080 ?auto_141081 ) ) ( not ( = ?auto_141080 ?auto_141082 ) ) ( not ( = ?auto_141080 ?auto_141083 ) ) ( not ( = ?auto_141080 ?auto_141084 ) ) ( not ( = ?auto_141080 ?auto_141085 ) ) ( not ( = ?auto_141080 ?auto_141086 ) ) ( not ( = ?auto_141081 ?auto_141082 ) ) ( not ( = ?auto_141081 ?auto_141083 ) ) ( not ( = ?auto_141081 ?auto_141084 ) ) ( not ( = ?auto_141081 ?auto_141085 ) ) ( not ( = ?auto_141081 ?auto_141086 ) ) ( not ( = ?auto_141082 ?auto_141083 ) ) ( not ( = ?auto_141082 ?auto_141084 ) ) ( not ( = ?auto_141082 ?auto_141085 ) ) ( not ( = ?auto_141082 ?auto_141086 ) ) ( not ( = ?auto_141083 ?auto_141084 ) ) ( not ( = ?auto_141083 ?auto_141085 ) ) ( not ( = ?auto_141083 ?auto_141086 ) ) ( not ( = ?auto_141084 ?auto_141085 ) ) ( not ( = ?auto_141084 ?auto_141086 ) ) ( not ( = ?auto_141085 ?auto_141086 ) ) ( ON-TABLE ?auto_141086 ) ( ON ?auto_141085 ?auto_141086 ) ( ON ?auto_141084 ?auto_141085 ) ( ON ?auto_141083 ?auto_141084 ) ( ON ?auto_141082 ?auto_141083 ) ( CLEAR ?auto_141082 ) ( HOLDING ?auto_141081 ) ( CLEAR ?auto_141080 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141079 ?auto_141080 ?auto_141081 )
      ( MAKE-8PILE ?auto_141079 ?auto_141080 ?auto_141081 ?auto_141082 ?auto_141083 ?auto_141084 ?auto_141085 ?auto_141086 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141087 - BLOCK
      ?auto_141088 - BLOCK
      ?auto_141089 - BLOCK
      ?auto_141090 - BLOCK
      ?auto_141091 - BLOCK
      ?auto_141092 - BLOCK
      ?auto_141093 - BLOCK
      ?auto_141094 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141087 ) ( ON ?auto_141088 ?auto_141087 ) ( not ( = ?auto_141087 ?auto_141088 ) ) ( not ( = ?auto_141087 ?auto_141089 ) ) ( not ( = ?auto_141087 ?auto_141090 ) ) ( not ( = ?auto_141087 ?auto_141091 ) ) ( not ( = ?auto_141087 ?auto_141092 ) ) ( not ( = ?auto_141087 ?auto_141093 ) ) ( not ( = ?auto_141087 ?auto_141094 ) ) ( not ( = ?auto_141088 ?auto_141089 ) ) ( not ( = ?auto_141088 ?auto_141090 ) ) ( not ( = ?auto_141088 ?auto_141091 ) ) ( not ( = ?auto_141088 ?auto_141092 ) ) ( not ( = ?auto_141088 ?auto_141093 ) ) ( not ( = ?auto_141088 ?auto_141094 ) ) ( not ( = ?auto_141089 ?auto_141090 ) ) ( not ( = ?auto_141089 ?auto_141091 ) ) ( not ( = ?auto_141089 ?auto_141092 ) ) ( not ( = ?auto_141089 ?auto_141093 ) ) ( not ( = ?auto_141089 ?auto_141094 ) ) ( not ( = ?auto_141090 ?auto_141091 ) ) ( not ( = ?auto_141090 ?auto_141092 ) ) ( not ( = ?auto_141090 ?auto_141093 ) ) ( not ( = ?auto_141090 ?auto_141094 ) ) ( not ( = ?auto_141091 ?auto_141092 ) ) ( not ( = ?auto_141091 ?auto_141093 ) ) ( not ( = ?auto_141091 ?auto_141094 ) ) ( not ( = ?auto_141092 ?auto_141093 ) ) ( not ( = ?auto_141092 ?auto_141094 ) ) ( not ( = ?auto_141093 ?auto_141094 ) ) ( ON-TABLE ?auto_141094 ) ( ON ?auto_141093 ?auto_141094 ) ( ON ?auto_141092 ?auto_141093 ) ( ON ?auto_141091 ?auto_141092 ) ( ON ?auto_141090 ?auto_141091 ) ( CLEAR ?auto_141088 ) ( ON ?auto_141089 ?auto_141090 ) ( CLEAR ?auto_141089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141094 ?auto_141093 ?auto_141092 ?auto_141091 ?auto_141090 )
      ( MAKE-8PILE ?auto_141087 ?auto_141088 ?auto_141089 ?auto_141090 ?auto_141091 ?auto_141092 ?auto_141093 ?auto_141094 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141095 - BLOCK
      ?auto_141096 - BLOCK
      ?auto_141097 - BLOCK
      ?auto_141098 - BLOCK
      ?auto_141099 - BLOCK
      ?auto_141100 - BLOCK
      ?auto_141101 - BLOCK
      ?auto_141102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141095 ) ( not ( = ?auto_141095 ?auto_141096 ) ) ( not ( = ?auto_141095 ?auto_141097 ) ) ( not ( = ?auto_141095 ?auto_141098 ) ) ( not ( = ?auto_141095 ?auto_141099 ) ) ( not ( = ?auto_141095 ?auto_141100 ) ) ( not ( = ?auto_141095 ?auto_141101 ) ) ( not ( = ?auto_141095 ?auto_141102 ) ) ( not ( = ?auto_141096 ?auto_141097 ) ) ( not ( = ?auto_141096 ?auto_141098 ) ) ( not ( = ?auto_141096 ?auto_141099 ) ) ( not ( = ?auto_141096 ?auto_141100 ) ) ( not ( = ?auto_141096 ?auto_141101 ) ) ( not ( = ?auto_141096 ?auto_141102 ) ) ( not ( = ?auto_141097 ?auto_141098 ) ) ( not ( = ?auto_141097 ?auto_141099 ) ) ( not ( = ?auto_141097 ?auto_141100 ) ) ( not ( = ?auto_141097 ?auto_141101 ) ) ( not ( = ?auto_141097 ?auto_141102 ) ) ( not ( = ?auto_141098 ?auto_141099 ) ) ( not ( = ?auto_141098 ?auto_141100 ) ) ( not ( = ?auto_141098 ?auto_141101 ) ) ( not ( = ?auto_141098 ?auto_141102 ) ) ( not ( = ?auto_141099 ?auto_141100 ) ) ( not ( = ?auto_141099 ?auto_141101 ) ) ( not ( = ?auto_141099 ?auto_141102 ) ) ( not ( = ?auto_141100 ?auto_141101 ) ) ( not ( = ?auto_141100 ?auto_141102 ) ) ( not ( = ?auto_141101 ?auto_141102 ) ) ( ON-TABLE ?auto_141102 ) ( ON ?auto_141101 ?auto_141102 ) ( ON ?auto_141100 ?auto_141101 ) ( ON ?auto_141099 ?auto_141100 ) ( ON ?auto_141098 ?auto_141099 ) ( ON ?auto_141097 ?auto_141098 ) ( CLEAR ?auto_141097 ) ( HOLDING ?auto_141096 ) ( CLEAR ?auto_141095 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141095 ?auto_141096 )
      ( MAKE-8PILE ?auto_141095 ?auto_141096 ?auto_141097 ?auto_141098 ?auto_141099 ?auto_141100 ?auto_141101 ?auto_141102 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141103 - BLOCK
      ?auto_141104 - BLOCK
      ?auto_141105 - BLOCK
      ?auto_141106 - BLOCK
      ?auto_141107 - BLOCK
      ?auto_141108 - BLOCK
      ?auto_141109 - BLOCK
      ?auto_141110 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_141103 ) ( not ( = ?auto_141103 ?auto_141104 ) ) ( not ( = ?auto_141103 ?auto_141105 ) ) ( not ( = ?auto_141103 ?auto_141106 ) ) ( not ( = ?auto_141103 ?auto_141107 ) ) ( not ( = ?auto_141103 ?auto_141108 ) ) ( not ( = ?auto_141103 ?auto_141109 ) ) ( not ( = ?auto_141103 ?auto_141110 ) ) ( not ( = ?auto_141104 ?auto_141105 ) ) ( not ( = ?auto_141104 ?auto_141106 ) ) ( not ( = ?auto_141104 ?auto_141107 ) ) ( not ( = ?auto_141104 ?auto_141108 ) ) ( not ( = ?auto_141104 ?auto_141109 ) ) ( not ( = ?auto_141104 ?auto_141110 ) ) ( not ( = ?auto_141105 ?auto_141106 ) ) ( not ( = ?auto_141105 ?auto_141107 ) ) ( not ( = ?auto_141105 ?auto_141108 ) ) ( not ( = ?auto_141105 ?auto_141109 ) ) ( not ( = ?auto_141105 ?auto_141110 ) ) ( not ( = ?auto_141106 ?auto_141107 ) ) ( not ( = ?auto_141106 ?auto_141108 ) ) ( not ( = ?auto_141106 ?auto_141109 ) ) ( not ( = ?auto_141106 ?auto_141110 ) ) ( not ( = ?auto_141107 ?auto_141108 ) ) ( not ( = ?auto_141107 ?auto_141109 ) ) ( not ( = ?auto_141107 ?auto_141110 ) ) ( not ( = ?auto_141108 ?auto_141109 ) ) ( not ( = ?auto_141108 ?auto_141110 ) ) ( not ( = ?auto_141109 ?auto_141110 ) ) ( ON-TABLE ?auto_141110 ) ( ON ?auto_141109 ?auto_141110 ) ( ON ?auto_141108 ?auto_141109 ) ( ON ?auto_141107 ?auto_141108 ) ( ON ?auto_141106 ?auto_141107 ) ( ON ?auto_141105 ?auto_141106 ) ( CLEAR ?auto_141103 ) ( ON ?auto_141104 ?auto_141105 ) ( CLEAR ?auto_141104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141110 ?auto_141109 ?auto_141108 ?auto_141107 ?auto_141106 ?auto_141105 )
      ( MAKE-8PILE ?auto_141103 ?auto_141104 ?auto_141105 ?auto_141106 ?auto_141107 ?auto_141108 ?auto_141109 ?auto_141110 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141111 - BLOCK
      ?auto_141112 - BLOCK
      ?auto_141113 - BLOCK
      ?auto_141114 - BLOCK
      ?auto_141115 - BLOCK
      ?auto_141116 - BLOCK
      ?auto_141117 - BLOCK
      ?auto_141118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141111 ?auto_141112 ) ) ( not ( = ?auto_141111 ?auto_141113 ) ) ( not ( = ?auto_141111 ?auto_141114 ) ) ( not ( = ?auto_141111 ?auto_141115 ) ) ( not ( = ?auto_141111 ?auto_141116 ) ) ( not ( = ?auto_141111 ?auto_141117 ) ) ( not ( = ?auto_141111 ?auto_141118 ) ) ( not ( = ?auto_141112 ?auto_141113 ) ) ( not ( = ?auto_141112 ?auto_141114 ) ) ( not ( = ?auto_141112 ?auto_141115 ) ) ( not ( = ?auto_141112 ?auto_141116 ) ) ( not ( = ?auto_141112 ?auto_141117 ) ) ( not ( = ?auto_141112 ?auto_141118 ) ) ( not ( = ?auto_141113 ?auto_141114 ) ) ( not ( = ?auto_141113 ?auto_141115 ) ) ( not ( = ?auto_141113 ?auto_141116 ) ) ( not ( = ?auto_141113 ?auto_141117 ) ) ( not ( = ?auto_141113 ?auto_141118 ) ) ( not ( = ?auto_141114 ?auto_141115 ) ) ( not ( = ?auto_141114 ?auto_141116 ) ) ( not ( = ?auto_141114 ?auto_141117 ) ) ( not ( = ?auto_141114 ?auto_141118 ) ) ( not ( = ?auto_141115 ?auto_141116 ) ) ( not ( = ?auto_141115 ?auto_141117 ) ) ( not ( = ?auto_141115 ?auto_141118 ) ) ( not ( = ?auto_141116 ?auto_141117 ) ) ( not ( = ?auto_141116 ?auto_141118 ) ) ( not ( = ?auto_141117 ?auto_141118 ) ) ( ON-TABLE ?auto_141118 ) ( ON ?auto_141117 ?auto_141118 ) ( ON ?auto_141116 ?auto_141117 ) ( ON ?auto_141115 ?auto_141116 ) ( ON ?auto_141114 ?auto_141115 ) ( ON ?auto_141113 ?auto_141114 ) ( ON ?auto_141112 ?auto_141113 ) ( CLEAR ?auto_141112 ) ( HOLDING ?auto_141111 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141111 )
      ( MAKE-8PILE ?auto_141111 ?auto_141112 ?auto_141113 ?auto_141114 ?auto_141115 ?auto_141116 ?auto_141117 ?auto_141118 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141119 - BLOCK
      ?auto_141120 - BLOCK
      ?auto_141121 - BLOCK
      ?auto_141122 - BLOCK
      ?auto_141123 - BLOCK
      ?auto_141124 - BLOCK
      ?auto_141125 - BLOCK
      ?auto_141126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141119 ?auto_141120 ) ) ( not ( = ?auto_141119 ?auto_141121 ) ) ( not ( = ?auto_141119 ?auto_141122 ) ) ( not ( = ?auto_141119 ?auto_141123 ) ) ( not ( = ?auto_141119 ?auto_141124 ) ) ( not ( = ?auto_141119 ?auto_141125 ) ) ( not ( = ?auto_141119 ?auto_141126 ) ) ( not ( = ?auto_141120 ?auto_141121 ) ) ( not ( = ?auto_141120 ?auto_141122 ) ) ( not ( = ?auto_141120 ?auto_141123 ) ) ( not ( = ?auto_141120 ?auto_141124 ) ) ( not ( = ?auto_141120 ?auto_141125 ) ) ( not ( = ?auto_141120 ?auto_141126 ) ) ( not ( = ?auto_141121 ?auto_141122 ) ) ( not ( = ?auto_141121 ?auto_141123 ) ) ( not ( = ?auto_141121 ?auto_141124 ) ) ( not ( = ?auto_141121 ?auto_141125 ) ) ( not ( = ?auto_141121 ?auto_141126 ) ) ( not ( = ?auto_141122 ?auto_141123 ) ) ( not ( = ?auto_141122 ?auto_141124 ) ) ( not ( = ?auto_141122 ?auto_141125 ) ) ( not ( = ?auto_141122 ?auto_141126 ) ) ( not ( = ?auto_141123 ?auto_141124 ) ) ( not ( = ?auto_141123 ?auto_141125 ) ) ( not ( = ?auto_141123 ?auto_141126 ) ) ( not ( = ?auto_141124 ?auto_141125 ) ) ( not ( = ?auto_141124 ?auto_141126 ) ) ( not ( = ?auto_141125 ?auto_141126 ) ) ( ON-TABLE ?auto_141126 ) ( ON ?auto_141125 ?auto_141126 ) ( ON ?auto_141124 ?auto_141125 ) ( ON ?auto_141123 ?auto_141124 ) ( ON ?auto_141122 ?auto_141123 ) ( ON ?auto_141121 ?auto_141122 ) ( ON ?auto_141120 ?auto_141121 ) ( ON ?auto_141119 ?auto_141120 ) ( CLEAR ?auto_141119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141126 ?auto_141125 ?auto_141124 ?auto_141123 ?auto_141122 ?auto_141121 ?auto_141120 )
      ( MAKE-8PILE ?auto_141119 ?auto_141120 ?auto_141121 ?auto_141122 ?auto_141123 ?auto_141124 ?auto_141125 ?auto_141126 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141127 - BLOCK
      ?auto_141128 - BLOCK
      ?auto_141129 - BLOCK
      ?auto_141130 - BLOCK
      ?auto_141131 - BLOCK
      ?auto_141132 - BLOCK
      ?auto_141133 - BLOCK
      ?auto_141134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141127 ?auto_141128 ) ) ( not ( = ?auto_141127 ?auto_141129 ) ) ( not ( = ?auto_141127 ?auto_141130 ) ) ( not ( = ?auto_141127 ?auto_141131 ) ) ( not ( = ?auto_141127 ?auto_141132 ) ) ( not ( = ?auto_141127 ?auto_141133 ) ) ( not ( = ?auto_141127 ?auto_141134 ) ) ( not ( = ?auto_141128 ?auto_141129 ) ) ( not ( = ?auto_141128 ?auto_141130 ) ) ( not ( = ?auto_141128 ?auto_141131 ) ) ( not ( = ?auto_141128 ?auto_141132 ) ) ( not ( = ?auto_141128 ?auto_141133 ) ) ( not ( = ?auto_141128 ?auto_141134 ) ) ( not ( = ?auto_141129 ?auto_141130 ) ) ( not ( = ?auto_141129 ?auto_141131 ) ) ( not ( = ?auto_141129 ?auto_141132 ) ) ( not ( = ?auto_141129 ?auto_141133 ) ) ( not ( = ?auto_141129 ?auto_141134 ) ) ( not ( = ?auto_141130 ?auto_141131 ) ) ( not ( = ?auto_141130 ?auto_141132 ) ) ( not ( = ?auto_141130 ?auto_141133 ) ) ( not ( = ?auto_141130 ?auto_141134 ) ) ( not ( = ?auto_141131 ?auto_141132 ) ) ( not ( = ?auto_141131 ?auto_141133 ) ) ( not ( = ?auto_141131 ?auto_141134 ) ) ( not ( = ?auto_141132 ?auto_141133 ) ) ( not ( = ?auto_141132 ?auto_141134 ) ) ( not ( = ?auto_141133 ?auto_141134 ) ) ( ON-TABLE ?auto_141134 ) ( ON ?auto_141133 ?auto_141134 ) ( ON ?auto_141132 ?auto_141133 ) ( ON ?auto_141131 ?auto_141132 ) ( ON ?auto_141130 ?auto_141131 ) ( ON ?auto_141129 ?auto_141130 ) ( ON ?auto_141128 ?auto_141129 ) ( HOLDING ?auto_141127 ) ( CLEAR ?auto_141128 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141134 ?auto_141133 ?auto_141132 ?auto_141131 ?auto_141130 ?auto_141129 ?auto_141128 ?auto_141127 )
      ( MAKE-8PILE ?auto_141127 ?auto_141128 ?auto_141129 ?auto_141130 ?auto_141131 ?auto_141132 ?auto_141133 ?auto_141134 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141135 - BLOCK
      ?auto_141136 - BLOCK
      ?auto_141137 - BLOCK
      ?auto_141138 - BLOCK
      ?auto_141139 - BLOCK
      ?auto_141140 - BLOCK
      ?auto_141141 - BLOCK
      ?auto_141142 - BLOCK
    )
    :vars
    (
      ?auto_141143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141135 ?auto_141136 ) ) ( not ( = ?auto_141135 ?auto_141137 ) ) ( not ( = ?auto_141135 ?auto_141138 ) ) ( not ( = ?auto_141135 ?auto_141139 ) ) ( not ( = ?auto_141135 ?auto_141140 ) ) ( not ( = ?auto_141135 ?auto_141141 ) ) ( not ( = ?auto_141135 ?auto_141142 ) ) ( not ( = ?auto_141136 ?auto_141137 ) ) ( not ( = ?auto_141136 ?auto_141138 ) ) ( not ( = ?auto_141136 ?auto_141139 ) ) ( not ( = ?auto_141136 ?auto_141140 ) ) ( not ( = ?auto_141136 ?auto_141141 ) ) ( not ( = ?auto_141136 ?auto_141142 ) ) ( not ( = ?auto_141137 ?auto_141138 ) ) ( not ( = ?auto_141137 ?auto_141139 ) ) ( not ( = ?auto_141137 ?auto_141140 ) ) ( not ( = ?auto_141137 ?auto_141141 ) ) ( not ( = ?auto_141137 ?auto_141142 ) ) ( not ( = ?auto_141138 ?auto_141139 ) ) ( not ( = ?auto_141138 ?auto_141140 ) ) ( not ( = ?auto_141138 ?auto_141141 ) ) ( not ( = ?auto_141138 ?auto_141142 ) ) ( not ( = ?auto_141139 ?auto_141140 ) ) ( not ( = ?auto_141139 ?auto_141141 ) ) ( not ( = ?auto_141139 ?auto_141142 ) ) ( not ( = ?auto_141140 ?auto_141141 ) ) ( not ( = ?auto_141140 ?auto_141142 ) ) ( not ( = ?auto_141141 ?auto_141142 ) ) ( ON-TABLE ?auto_141142 ) ( ON ?auto_141141 ?auto_141142 ) ( ON ?auto_141140 ?auto_141141 ) ( ON ?auto_141139 ?auto_141140 ) ( ON ?auto_141138 ?auto_141139 ) ( ON ?auto_141137 ?auto_141138 ) ( ON ?auto_141136 ?auto_141137 ) ( CLEAR ?auto_141136 ) ( ON ?auto_141135 ?auto_141143 ) ( CLEAR ?auto_141135 ) ( HAND-EMPTY ) ( not ( = ?auto_141135 ?auto_141143 ) ) ( not ( = ?auto_141136 ?auto_141143 ) ) ( not ( = ?auto_141137 ?auto_141143 ) ) ( not ( = ?auto_141138 ?auto_141143 ) ) ( not ( = ?auto_141139 ?auto_141143 ) ) ( not ( = ?auto_141140 ?auto_141143 ) ) ( not ( = ?auto_141141 ?auto_141143 ) ) ( not ( = ?auto_141142 ?auto_141143 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_141135 ?auto_141143 )
      ( MAKE-8PILE ?auto_141135 ?auto_141136 ?auto_141137 ?auto_141138 ?auto_141139 ?auto_141140 ?auto_141141 ?auto_141142 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141144 - BLOCK
      ?auto_141145 - BLOCK
      ?auto_141146 - BLOCK
      ?auto_141147 - BLOCK
      ?auto_141148 - BLOCK
      ?auto_141149 - BLOCK
      ?auto_141150 - BLOCK
      ?auto_141151 - BLOCK
    )
    :vars
    (
      ?auto_141152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141144 ?auto_141145 ) ) ( not ( = ?auto_141144 ?auto_141146 ) ) ( not ( = ?auto_141144 ?auto_141147 ) ) ( not ( = ?auto_141144 ?auto_141148 ) ) ( not ( = ?auto_141144 ?auto_141149 ) ) ( not ( = ?auto_141144 ?auto_141150 ) ) ( not ( = ?auto_141144 ?auto_141151 ) ) ( not ( = ?auto_141145 ?auto_141146 ) ) ( not ( = ?auto_141145 ?auto_141147 ) ) ( not ( = ?auto_141145 ?auto_141148 ) ) ( not ( = ?auto_141145 ?auto_141149 ) ) ( not ( = ?auto_141145 ?auto_141150 ) ) ( not ( = ?auto_141145 ?auto_141151 ) ) ( not ( = ?auto_141146 ?auto_141147 ) ) ( not ( = ?auto_141146 ?auto_141148 ) ) ( not ( = ?auto_141146 ?auto_141149 ) ) ( not ( = ?auto_141146 ?auto_141150 ) ) ( not ( = ?auto_141146 ?auto_141151 ) ) ( not ( = ?auto_141147 ?auto_141148 ) ) ( not ( = ?auto_141147 ?auto_141149 ) ) ( not ( = ?auto_141147 ?auto_141150 ) ) ( not ( = ?auto_141147 ?auto_141151 ) ) ( not ( = ?auto_141148 ?auto_141149 ) ) ( not ( = ?auto_141148 ?auto_141150 ) ) ( not ( = ?auto_141148 ?auto_141151 ) ) ( not ( = ?auto_141149 ?auto_141150 ) ) ( not ( = ?auto_141149 ?auto_141151 ) ) ( not ( = ?auto_141150 ?auto_141151 ) ) ( ON-TABLE ?auto_141151 ) ( ON ?auto_141150 ?auto_141151 ) ( ON ?auto_141149 ?auto_141150 ) ( ON ?auto_141148 ?auto_141149 ) ( ON ?auto_141147 ?auto_141148 ) ( ON ?auto_141146 ?auto_141147 ) ( ON ?auto_141144 ?auto_141152 ) ( CLEAR ?auto_141144 ) ( not ( = ?auto_141144 ?auto_141152 ) ) ( not ( = ?auto_141145 ?auto_141152 ) ) ( not ( = ?auto_141146 ?auto_141152 ) ) ( not ( = ?auto_141147 ?auto_141152 ) ) ( not ( = ?auto_141148 ?auto_141152 ) ) ( not ( = ?auto_141149 ?auto_141152 ) ) ( not ( = ?auto_141150 ?auto_141152 ) ) ( not ( = ?auto_141151 ?auto_141152 ) ) ( HOLDING ?auto_141145 ) ( CLEAR ?auto_141146 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141151 ?auto_141150 ?auto_141149 ?auto_141148 ?auto_141147 ?auto_141146 ?auto_141145 )
      ( MAKE-8PILE ?auto_141144 ?auto_141145 ?auto_141146 ?auto_141147 ?auto_141148 ?auto_141149 ?auto_141150 ?auto_141151 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141153 - BLOCK
      ?auto_141154 - BLOCK
      ?auto_141155 - BLOCK
      ?auto_141156 - BLOCK
      ?auto_141157 - BLOCK
      ?auto_141158 - BLOCK
      ?auto_141159 - BLOCK
      ?auto_141160 - BLOCK
    )
    :vars
    (
      ?auto_141161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141153 ?auto_141154 ) ) ( not ( = ?auto_141153 ?auto_141155 ) ) ( not ( = ?auto_141153 ?auto_141156 ) ) ( not ( = ?auto_141153 ?auto_141157 ) ) ( not ( = ?auto_141153 ?auto_141158 ) ) ( not ( = ?auto_141153 ?auto_141159 ) ) ( not ( = ?auto_141153 ?auto_141160 ) ) ( not ( = ?auto_141154 ?auto_141155 ) ) ( not ( = ?auto_141154 ?auto_141156 ) ) ( not ( = ?auto_141154 ?auto_141157 ) ) ( not ( = ?auto_141154 ?auto_141158 ) ) ( not ( = ?auto_141154 ?auto_141159 ) ) ( not ( = ?auto_141154 ?auto_141160 ) ) ( not ( = ?auto_141155 ?auto_141156 ) ) ( not ( = ?auto_141155 ?auto_141157 ) ) ( not ( = ?auto_141155 ?auto_141158 ) ) ( not ( = ?auto_141155 ?auto_141159 ) ) ( not ( = ?auto_141155 ?auto_141160 ) ) ( not ( = ?auto_141156 ?auto_141157 ) ) ( not ( = ?auto_141156 ?auto_141158 ) ) ( not ( = ?auto_141156 ?auto_141159 ) ) ( not ( = ?auto_141156 ?auto_141160 ) ) ( not ( = ?auto_141157 ?auto_141158 ) ) ( not ( = ?auto_141157 ?auto_141159 ) ) ( not ( = ?auto_141157 ?auto_141160 ) ) ( not ( = ?auto_141158 ?auto_141159 ) ) ( not ( = ?auto_141158 ?auto_141160 ) ) ( not ( = ?auto_141159 ?auto_141160 ) ) ( ON-TABLE ?auto_141160 ) ( ON ?auto_141159 ?auto_141160 ) ( ON ?auto_141158 ?auto_141159 ) ( ON ?auto_141157 ?auto_141158 ) ( ON ?auto_141156 ?auto_141157 ) ( ON ?auto_141155 ?auto_141156 ) ( ON ?auto_141153 ?auto_141161 ) ( not ( = ?auto_141153 ?auto_141161 ) ) ( not ( = ?auto_141154 ?auto_141161 ) ) ( not ( = ?auto_141155 ?auto_141161 ) ) ( not ( = ?auto_141156 ?auto_141161 ) ) ( not ( = ?auto_141157 ?auto_141161 ) ) ( not ( = ?auto_141158 ?auto_141161 ) ) ( not ( = ?auto_141159 ?auto_141161 ) ) ( not ( = ?auto_141160 ?auto_141161 ) ) ( CLEAR ?auto_141155 ) ( ON ?auto_141154 ?auto_141153 ) ( CLEAR ?auto_141154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_141161 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141161 ?auto_141153 )
      ( MAKE-8PILE ?auto_141153 ?auto_141154 ?auto_141155 ?auto_141156 ?auto_141157 ?auto_141158 ?auto_141159 ?auto_141160 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141162 - BLOCK
      ?auto_141163 - BLOCK
      ?auto_141164 - BLOCK
      ?auto_141165 - BLOCK
      ?auto_141166 - BLOCK
      ?auto_141167 - BLOCK
      ?auto_141168 - BLOCK
      ?auto_141169 - BLOCK
    )
    :vars
    (
      ?auto_141170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141162 ?auto_141163 ) ) ( not ( = ?auto_141162 ?auto_141164 ) ) ( not ( = ?auto_141162 ?auto_141165 ) ) ( not ( = ?auto_141162 ?auto_141166 ) ) ( not ( = ?auto_141162 ?auto_141167 ) ) ( not ( = ?auto_141162 ?auto_141168 ) ) ( not ( = ?auto_141162 ?auto_141169 ) ) ( not ( = ?auto_141163 ?auto_141164 ) ) ( not ( = ?auto_141163 ?auto_141165 ) ) ( not ( = ?auto_141163 ?auto_141166 ) ) ( not ( = ?auto_141163 ?auto_141167 ) ) ( not ( = ?auto_141163 ?auto_141168 ) ) ( not ( = ?auto_141163 ?auto_141169 ) ) ( not ( = ?auto_141164 ?auto_141165 ) ) ( not ( = ?auto_141164 ?auto_141166 ) ) ( not ( = ?auto_141164 ?auto_141167 ) ) ( not ( = ?auto_141164 ?auto_141168 ) ) ( not ( = ?auto_141164 ?auto_141169 ) ) ( not ( = ?auto_141165 ?auto_141166 ) ) ( not ( = ?auto_141165 ?auto_141167 ) ) ( not ( = ?auto_141165 ?auto_141168 ) ) ( not ( = ?auto_141165 ?auto_141169 ) ) ( not ( = ?auto_141166 ?auto_141167 ) ) ( not ( = ?auto_141166 ?auto_141168 ) ) ( not ( = ?auto_141166 ?auto_141169 ) ) ( not ( = ?auto_141167 ?auto_141168 ) ) ( not ( = ?auto_141167 ?auto_141169 ) ) ( not ( = ?auto_141168 ?auto_141169 ) ) ( ON-TABLE ?auto_141169 ) ( ON ?auto_141168 ?auto_141169 ) ( ON ?auto_141167 ?auto_141168 ) ( ON ?auto_141166 ?auto_141167 ) ( ON ?auto_141165 ?auto_141166 ) ( ON ?auto_141162 ?auto_141170 ) ( not ( = ?auto_141162 ?auto_141170 ) ) ( not ( = ?auto_141163 ?auto_141170 ) ) ( not ( = ?auto_141164 ?auto_141170 ) ) ( not ( = ?auto_141165 ?auto_141170 ) ) ( not ( = ?auto_141166 ?auto_141170 ) ) ( not ( = ?auto_141167 ?auto_141170 ) ) ( not ( = ?auto_141168 ?auto_141170 ) ) ( not ( = ?auto_141169 ?auto_141170 ) ) ( ON ?auto_141163 ?auto_141162 ) ( CLEAR ?auto_141163 ) ( ON-TABLE ?auto_141170 ) ( HOLDING ?auto_141164 ) ( CLEAR ?auto_141165 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141169 ?auto_141168 ?auto_141167 ?auto_141166 ?auto_141165 ?auto_141164 )
      ( MAKE-8PILE ?auto_141162 ?auto_141163 ?auto_141164 ?auto_141165 ?auto_141166 ?auto_141167 ?auto_141168 ?auto_141169 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141171 - BLOCK
      ?auto_141172 - BLOCK
      ?auto_141173 - BLOCK
      ?auto_141174 - BLOCK
      ?auto_141175 - BLOCK
      ?auto_141176 - BLOCK
      ?auto_141177 - BLOCK
      ?auto_141178 - BLOCK
    )
    :vars
    (
      ?auto_141179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141171 ?auto_141172 ) ) ( not ( = ?auto_141171 ?auto_141173 ) ) ( not ( = ?auto_141171 ?auto_141174 ) ) ( not ( = ?auto_141171 ?auto_141175 ) ) ( not ( = ?auto_141171 ?auto_141176 ) ) ( not ( = ?auto_141171 ?auto_141177 ) ) ( not ( = ?auto_141171 ?auto_141178 ) ) ( not ( = ?auto_141172 ?auto_141173 ) ) ( not ( = ?auto_141172 ?auto_141174 ) ) ( not ( = ?auto_141172 ?auto_141175 ) ) ( not ( = ?auto_141172 ?auto_141176 ) ) ( not ( = ?auto_141172 ?auto_141177 ) ) ( not ( = ?auto_141172 ?auto_141178 ) ) ( not ( = ?auto_141173 ?auto_141174 ) ) ( not ( = ?auto_141173 ?auto_141175 ) ) ( not ( = ?auto_141173 ?auto_141176 ) ) ( not ( = ?auto_141173 ?auto_141177 ) ) ( not ( = ?auto_141173 ?auto_141178 ) ) ( not ( = ?auto_141174 ?auto_141175 ) ) ( not ( = ?auto_141174 ?auto_141176 ) ) ( not ( = ?auto_141174 ?auto_141177 ) ) ( not ( = ?auto_141174 ?auto_141178 ) ) ( not ( = ?auto_141175 ?auto_141176 ) ) ( not ( = ?auto_141175 ?auto_141177 ) ) ( not ( = ?auto_141175 ?auto_141178 ) ) ( not ( = ?auto_141176 ?auto_141177 ) ) ( not ( = ?auto_141176 ?auto_141178 ) ) ( not ( = ?auto_141177 ?auto_141178 ) ) ( ON-TABLE ?auto_141178 ) ( ON ?auto_141177 ?auto_141178 ) ( ON ?auto_141176 ?auto_141177 ) ( ON ?auto_141175 ?auto_141176 ) ( ON ?auto_141174 ?auto_141175 ) ( ON ?auto_141171 ?auto_141179 ) ( not ( = ?auto_141171 ?auto_141179 ) ) ( not ( = ?auto_141172 ?auto_141179 ) ) ( not ( = ?auto_141173 ?auto_141179 ) ) ( not ( = ?auto_141174 ?auto_141179 ) ) ( not ( = ?auto_141175 ?auto_141179 ) ) ( not ( = ?auto_141176 ?auto_141179 ) ) ( not ( = ?auto_141177 ?auto_141179 ) ) ( not ( = ?auto_141178 ?auto_141179 ) ) ( ON ?auto_141172 ?auto_141171 ) ( ON-TABLE ?auto_141179 ) ( CLEAR ?auto_141174 ) ( ON ?auto_141173 ?auto_141172 ) ( CLEAR ?auto_141173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141179 ?auto_141171 ?auto_141172 )
      ( MAKE-8PILE ?auto_141171 ?auto_141172 ?auto_141173 ?auto_141174 ?auto_141175 ?auto_141176 ?auto_141177 ?auto_141178 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141180 - BLOCK
      ?auto_141181 - BLOCK
      ?auto_141182 - BLOCK
      ?auto_141183 - BLOCK
      ?auto_141184 - BLOCK
      ?auto_141185 - BLOCK
      ?auto_141186 - BLOCK
      ?auto_141187 - BLOCK
    )
    :vars
    (
      ?auto_141188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141180 ?auto_141181 ) ) ( not ( = ?auto_141180 ?auto_141182 ) ) ( not ( = ?auto_141180 ?auto_141183 ) ) ( not ( = ?auto_141180 ?auto_141184 ) ) ( not ( = ?auto_141180 ?auto_141185 ) ) ( not ( = ?auto_141180 ?auto_141186 ) ) ( not ( = ?auto_141180 ?auto_141187 ) ) ( not ( = ?auto_141181 ?auto_141182 ) ) ( not ( = ?auto_141181 ?auto_141183 ) ) ( not ( = ?auto_141181 ?auto_141184 ) ) ( not ( = ?auto_141181 ?auto_141185 ) ) ( not ( = ?auto_141181 ?auto_141186 ) ) ( not ( = ?auto_141181 ?auto_141187 ) ) ( not ( = ?auto_141182 ?auto_141183 ) ) ( not ( = ?auto_141182 ?auto_141184 ) ) ( not ( = ?auto_141182 ?auto_141185 ) ) ( not ( = ?auto_141182 ?auto_141186 ) ) ( not ( = ?auto_141182 ?auto_141187 ) ) ( not ( = ?auto_141183 ?auto_141184 ) ) ( not ( = ?auto_141183 ?auto_141185 ) ) ( not ( = ?auto_141183 ?auto_141186 ) ) ( not ( = ?auto_141183 ?auto_141187 ) ) ( not ( = ?auto_141184 ?auto_141185 ) ) ( not ( = ?auto_141184 ?auto_141186 ) ) ( not ( = ?auto_141184 ?auto_141187 ) ) ( not ( = ?auto_141185 ?auto_141186 ) ) ( not ( = ?auto_141185 ?auto_141187 ) ) ( not ( = ?auto_141186 ?auto_141187 ) ) ( ON-TABLE ?auto_141187 ) ( ON ?auto_141186 ?auto_141187 ) ( ON ?auto_141185 ?auto_141186 ) ( ON ?auto_141184 ?auto_141185 ) ( ON ?auto_141180 ?auto_141188 ) ( not ( = ?auto_141180 ?auto_141188 ) ) ( not ( = ?auto_141181 ?auto_141188 ) ) ( not ( = ?auto_141182 ?auto_141188 ) ) ( not ( = ?auto_141183 ?auto_141188 ) ) ( not ( = ?auto_141184 ?auto_141188 ) ) ( not ( = ?auto_141185 ?auto_141188 ) ) ( not ( = ?auto_141186 ?auto_141188 ) ) ( not ( = ?auto_141187 ?auto_141188 ) ) ( ON ?auto_141181 ?auto_141180 ) ( ON-TABLE ?auto_141188 ) ( ON ?auto_141182 ?auto_141181 ) ( CLEAR ?auto_141182 ) ( HOLDING ?auto_141183 ) ( CLEAR ?auto_141184 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141187 ?auto_141186 ?auto_141185 ?auto_141184 ?auto_141183 )
      ( MAKE-8PILE ?auto_141180 ?auto_141181 ?auto_141182 ?auto_141183 ?auto_141184 ?auto_141185 ?auto_141186 ?auto_141187 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141189 - BLOCK
      ?auto_141190 - BLOCK
      ?auto_141191 - BLOCK
      ?auto_141192 - BLOCK
      ?auto_141193 - BLOCK
      ?auto_141194 - BLOCK
      ?auto_141195 - BLOCK
      ?auto_141196 - BLOCK
    )
    :vars
    (
      ?auto_141197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141189 ?auto_141190 ) ) ( not ( = ?auto_141189 ?auto_141191 ) ) ( not ( = ?auto_141189 ?auto_141192 ) ) ( not ( = ?auto_141189 ?auto_141193 ) ) ( not ( = ?auto_141189 ?auto_141194 ) ) ( not ( = ?auto_141189 ?auto_141195 ) ) ( not ( = ?auto_141189 ?auto_141196 ) ) ( not ( = ?auto_141190 ?auto_141191 ) ) ( not ( = ?auto_141190 ?auto_141192 ) ) ( not ( = ?auto_141190 ?auto_141193 ) ) ( not ( = ?auto_141190 ?auto_141194 ) ) ( not ( = ?auto_141190 ?auto_141195 ) ) ( not ( = ?auto_141190 ?auto_141196 ) ) ( not ( = ?auto_141191 ?auto_141192 ) ) ( not ( = ?auto_141191 ?auto_141193 ) ) ( not ( = ?auto_141191 ?auto_141194 ) ) ( not ( = ?auto_141191 ?auto_141195 ) ) ( not ( = ?auto_141191 ?auto_141196 ) ) ( not ( = ?auto_141192 ?auto_141193 ) ) ( not ( = ?auto_141192 ?auto_141194 ) ) ( not ( = ?auto_141192 ?auto_141195 ) ) ( not ( = ?auto_141192 ?auto_141196 ) ) ( not ( = ?auto_141193 ?auto_141194 ) ) ( not ( = ?auto_141193 ?auto_141195 ) ) ( not ( = ?auto_141193 ?auto_141196 ) ) ( not ( = ?auto_141194 ?auto_141195 ) ) ( not ( = ?auto_141194 ?auto_141196 ) ) ( not ( = ?auto_141195 ?auto_141196 ) ) ( ON-TABLE ?auto_141196 ) ( ON ?auto_141195 ?auto_141196 ) ( ON ?auto_141194 ?auto_141195 ) ( ON ?auto_141193 ?auto_141194 ) ( ON ?auto_141189 ?auto_141197 ) ( not ( = ?auto_141189 ?auto_141197 ) ) ( not ( = ?auto_141190 ?auto_141197 ) ) ( not ( = ?auto_141191 ?auto_141197 ) ) ( not ( = ?auto_141192 ?auto_141197 ) ) ( not ( = ?auto_141193 ?auto_141197 ) ) ( not ( = ?auto_141194 ?auto_141197 ) ) ( not ( = ?auto_141195 ?auto_141197 ) ) ( not ( = ?auto_141196 ?auto_141197 ) ) ( ON ?auto_141190 ?auto_141189 ) ( ON-TABLE ?auto_141197 ) ( ON ?auto_141191 ?auto_141190 ) ( CLEAR ?auto_141193 ) ( ON ?auto_141192 ?auto_141191 ) ( CLEAR ?auto_141192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141197 ?auto_141189 ?auto_141190 ?auto_141191 )
      ( MAKE-8PILE ?auto_141189 ?auto_141190 ?auto_141191 ?auto_141192 ?auto_141193 ?auto_141194 ?auto_141195 ?auto_141196 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141198 - BLOCK
      ?auto_141199 - BLOCK
      ?auto_141200 - BLOCK
      ?auto_141201 - BLOCK
      ?auto_141202 - BLOCK
      ?auto_141203 - BLOCK
      ?auto_141204 - BLOCK
      ?auto_141205 - BLOCK
    )
    :vars
    (
      ?auto_141206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141198 ?auto_141199 ) ) ( not ( = ?auto_141198 ?auto_141200 ) ) ( not ( = ?auto_141198 ?auto_141201 ) ) ( not ( = ?auto_141198 ?auto_141202 ) ) ( not ( = ?auto_141198 ?auto_141203 ) ) ( not ( = ?auto_141198 ?auto_141204 ) ) ( not ( = ?auto_141198 ?auto_141205 ) ) ( not ( = ?auto_141199 ?auto_141200 ) ) ( not ( = ?auto_141199 ?auto_141201 ) ) ( not ( = ?auto_141199 ?auto_141202 ) ) ( not ( = ?auto_141199 ?auto_141203 ) ) ( not ( = ?auto_141199 ?auto_141204 ) ) ( not ( = ?auto_141199 ?auto_141205 ) ) ( not ( = ?auto_141200 ?auto_141201 ) ) ( not ( = ?auto_141200 ?auto_141202 ) ) ( not ( = ?auto_141200 ?auto_141203 ) ) ( not ( = ?auto_141200 ?auto_141204 ) ) ( not ( = ?auto_141200 ?auto_141205 ) ) ( not ( = ?auto_141201 ?auto_141202 ) ) ( not ( = ?auto_141201 ?auto_141203 ) ) ( not ( = ?auto_141201 ?auto_141204 ) ) ( not ( = ?auto_141201 ?auto_141205 ) ) ( not ( = ?auto_141202 ?auto_141203 ) ) ( not ( = ?auto_141202 ?auto_141204 ) ) ( not ( = ?auto_141202 ?auto_141205 ) ) ( not ( = ?auto_141203 ?auto_141204 ) ) ( not ( = ?auto_141203 ?auto_141205 ) ) ( not ( = ?auto_141204 ?auto_141205 ) ) ( ON-TABLE ?auto_141205 ) ( ON ?auto_141204 ?auto_141205 ) ( ON ?auto_141203 ?auto_141204 ) ( ON ?auto_141198 ?auto_141206 ) ( not ( = ?auto_141198 ?auto_141206 ) ) ( not ( = ?auto_141199 ?auto_141206 ) ) ( not ( = ?auto_141200 ?auto_141206 ) ) ( not ( = ?auto_141201 ?auto_141206 ) ) ( not ( = ?auto_141202 ?auto_141206 ) ) ( not ( = ?auto_141203 ?auto_141206 ) ) ( not ( = ?auto_141204 ?auto_141206 ) ) ( not ( = ?auto_141205 ?auto_141206 ) ) ( ON ?auto_141199 ?auto_141198 ) ( ON-TABLE ?auto_141206 ) ( ON ?auto_141200 ?auto_141199 ) ( ON ?auto_141201 ?auto_141200 ) ( CLEAR ?auto_141201 ) ( HOLDING ?auto_141202 ) ( CLEAR ?auto_141203 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_141205 ?auto_141204 ?auto_141203 ?auto_141202 )
      ( MAKE-8PILE ?auto_141198 ?auto_141199 ?auto_141200 ?auto_141201 ?auto_141202 ?auto_141203 ?auto_141204 ?auto_141205 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141207 - BLOCK
      ?auto_141208 - BLOCK
      ?auto_141209 - BLOCK
      ?auto_141210 - BLOCK
      ?auto_141211 - BLOCK
      ?auto_141212 - BLOCK
      ?auto_141213 - BLOCK
      ?auto_141214 - BLOCK
    )
    :vars
    (
      ?auto_141215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141207 ?auto_141208 ) ) ( not ( = ?auto_141207 ?auto_141209 ) ) ( not ( = ?auto_141207 ?auto_141210 ) ) ( not ( = ?auto_141207 ?auto_141211 ) ) ( not ( = ?auto_141207 ?auto_141212 ) ) ( not ( = ?auto_141207 ?auto_141213 ) ) ( not ( = ?auto_141207 ?auto_141214 ) ) ( not ( = ?auto_141208 ?auto_141209 ) ) ( not ( = ?auto_141208 ?auto_141210 ) ) ( not ( = ?auto_141208 ?auto_141211 ) ) ( not ( = ?auto_141208 ?auto_141212 ) ) ( not ( = ?auto_141208 ?auto_141213 ) ) ( not ( = ?auto_141208 ?auto_141214 ) ) ( not ( = ?auto_141209 ?auto_141210 ) ) ( not ( = ?auto_141209 ?auto_141211 ) ) ( not ( = ?auto_141209 ?auto_141212 ) ) ( not ( = ?auto_141209 ?auto_141213 ) ) ( not ( = ?auto_141209 ?auto_141214 ) ) ( not ( = ?auto_141210 ?auto_141211 ) ) ( not ( = ?auto_141210 ?auto_141212 ) ) ( not ( = ?auto_141210 ?auto_141213 ) ) ( not ( = ?auto_141210 ?auto_141214 ) ) ( not ( = ?auto_141211 ?auto_141212 ) ) ( not ( = ?auto_141211 ?auto_141213 ) ) ( not ( = ?auto_141211 ?auto_141214 ) ) ( not ( = ?auto_141212 ?auto_141213 ) ) ( not ( = ?auto_141212 ?auto_141214 ) ) ( not ( = ?auto_141213 ?auto_141214 ) ) ( ON-TABLE ?auto_141214 ) ( ON ?auto_141213 ?auto_141214 ) ( ON ?auto_141212 ?auto_141213 ) ( ON ?auto_141207 ?auto_141215 ) ( not ( = ?auto_141207 ?auto_141215 ) ) ( not ( = ?auto_141208 ?auto_141215 ) ) ( not ( = ?auto_141209 ?auto_141215 ) ) ( not ( = ?auto_141210 ?auto_141215 ) ) ( not ( = ?auto_141211 ?auto_141215 ) ) ( not ( = ?auto_141212 ?auto_141215 ) ) ( not ( = ?auto_141213 ?auto_141215 ) ) ( not ( = ?auto_141214 ?auto_141215 ) ) ( ON ?auto_141208 ?auto_141207 ) ( ON-TABLE ?auto_141215 ) ( ON ?auto_141209 ?auto_141208 ) ( ON ?auto_141210 ?auto_141209 ) ( CLEAR ?auto_141212 ) ( ON ?auto_141211 ?auto_141210 ) ( CLEAR ?auto_141211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_141215 ?auto_141207 ?auto_141208 ?auto_141209 ?auto_141210 )
      ( MAKE-8PILE ?auto_141207 ?auto_141208 ?auto_141209 ?auto_141210 ?auto_141211 ?auto_141212 ?auto_141213 ?auto_141214 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141216 - BLOCK
      ?auto_141217 - BLOCK
      ?auto_141218 - BLOCK
      ?auto_141219 - BLOCK
      ?auto_141220 - BLOCK
      ?auto_141221 - BLOCK
      ?auto_141222 - BLOCK
      ?auto_141223 - BLOCK
    )
    :vars
    (
      ?auto_141224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141216 ?auto_141217 ) ) ( not ( = ?auto_141216 ?auto_141218 ) ) ( not ( = ?auto_141216 ?auto_141219 ) ) ( not ( = ?auto_141216 ?auto_141220 ) ) ( not ( = ?auto_141216 ?auto_141221 ) ) ( not ( = ?auto_141216 ?auto_141222 ) ) ( not ( = ?auto_141216 ?auto_141223 ) ) ( not ( = ?auto_141217 ?auto_141218 ) ) ( not ( = ?auto_141217 ?auto_141219 ) ) ( not ( = ?auto_141217 ?auto_141220 ) ) ( not ( = ?auto_141217 ?auto_141221 ) ) ( not ( = ?auto_141217 ?auto_141222 ) ) ( not ( = ?auto_141217 ?auto_141223 ) ) ( not ( = ?auto_141218 ?auto_141219 ) ) ( not ( = ?auto_141218 ?auto_141220 ) ) ( not ( = ?auto_141218 ?auto_141221 ) ) ( not ( = ?auto_141218 ?auto_141222 ) ) ( not ( = ?auto_141218 ?auto_141223 ) ) ( not ( = ?auto_141219 ?auto_141220 ) ) ( not ( = ?auto_141219 ?auto_141221 ) ) ( not ( = ?auto_141219 ?auto_141222 ) ) ( not ( = ?auto_141219 ?auto_141223 ) ) ( not ( = ?auto_141220 ?auto_141221 ) ) ( not ( = ?auto_141220 ?auto_141222 ) ) ( not ( = ?auto_141220 ?auto_141223 ) ) ( not ( = ?auto_141221 ?auto_141222 ) ) ( not ( = ?auto_141221 ?auto_141223 ) ) ( not ( = ?auto_141222 ?auto_141223 ) ) ( ON-TABLE ?auto_141223 ) ( ON ?auto_141222 ?auto_141223 ) ( ON ?auto_141216 ?auto_141224 ) ( not ( = ?auto_141216 ?auto_141224 ) ) ( not ( = ?auto_141217 ?auto_141224 ) ) ( not ( = ?auto_141218 ?auto_141224 ) ) ( not ( = ?auto_141219 ?auto_141224 ) ) ( not ( = ?auto_141220 ?auto_141224 ) ) ( not ( = ?auto_141221 ?auto_141224 ) ) ( not ( = ?auto_141222 ?auto_141224 ) ) ( not ( = ?auto_141223 ?auto_141224 ) ) ( ON ?auto_141217 ?auto_141216 ) ( ON-TABLE ?auto_141224 ) ( ON ?auto_141218 ?auto_141217 ) ( ON ?auto_141219 ?auto_141218 ) ( ON ?auto_141220 ?auto_141219 ) ( CLEAR ?auto_141220 ) ( HOLDING ?auto_141221 ) ( CLEAR ?auto_141222 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_141223 ?auto_141222 ?auto_141221 )
      ( MAKE-8PILE ?auto_141216 ?auto_141217 ?auto_141218 ?auto_141219 ?auto_141220 ?auto_141221 ?auto_141222 ?auto_141223 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141225 - BLOCK
      ?auto_141226 - BLOCK
      ?auto_141227 - BLOCK
      ?auto_141228 - BLOCK
      ?auto_141229 - BLOCK
      ?auto_141230 - BLOCK
      ?auto_141231 - BLOCK
      ?auto_141232 - BLOCK
    )
    :vars
    (
      ?auto_141233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141225 ?auto_141226 ) ) ( not ( = ?auto_141225 ?auto_141227 ) ) ( not ( = ?auto_141225 ?auto_141228 ) ) ( not ( = ?auto_141225 ?auto_141229 ) ) ( not ( = ?auto_141225 ?auto_141230 ) ) ( not ( = ?auto_141225 ?auto_141231 ) ) ( not ( = ?auto_141225 ?auto_141232 ) ) ( not ( = ?auto_141226 ?auto_141227 ) ) ( not ( = ?auto_141226 ?auto_141228 ) ) ( not ( = ?auto_141226 ?auto_141229 ) ) ( not ( = ?auto_141226 ?auto_141230 ) ) ( not ( = ?auto_141226 ?auto_141231 ) ) ( not ( = ?auto_141226 ?auto_141232 ) ) ( not ( = ?auto_141227 ?auto_141228 ) ) ( not ( = ?auto_141227 ?auto_141229 ) ) ( not ( = ?auto_141227 ?auto_141230 ) ) ( not ( = ?auto_141227 ?auto_141231 ) ) ( not ( = ?auto_141227 ?auto_141232 ) ) ( not ( = ?auto_141228 ?auto_141229 ) ) ( not ( = ?auto_141228 ?auto_141230 ) ) ( not ( = ?auto_141228 ?auto_141231 ) ) ( not ( = ?auto_141228 ?auto_141232 ) ) ( not ( = ?auto_141229 ?auto_141230 ) ) ( not ( = ?auto_141229 ?auto_141231 ) ) ( not ( = ?auto_141229 ?auto_141232 ) ) ( not ( = ?auto_141230 ?auto_141231 ) ) ( not ( = ?auto_141230 ?auto_141232 ) ) ( not ( = ?auto_141231 ?auto_141232 ) ) ( ON-TABLE ?auto_141232 ) ( ON ?auto_141231 ?auto_141232 ) ( ON ?auto_141225 ?auto_141233 ) ( not ( = ?auto_141225 ?auto_141233 ) ) ( not ( = ?auto_141226 ?auto_141233 ) ) ( not ( = ?auto_141227 ?auto_141233 ) ) ( not ( = ?auto_141228 ?auto_141233 ) ) ( not ( = ?auto_141229 ?auto_141233 ) ) ( not ( = ?auto_141230 ?auto_141233 ) ) ( not ( = ?auto_141231 ?auto_141233 ) ) ( not ( = ?auto_141232 ?auto_141233 ) ) ( ON ?auto_141226 ?auto_141225 ) ( ON-TABLE ?auto_141233 ) ( ON ?auto_141227 ?auto_141226 ) ( ON ?auto_141228 ?auto_141227 ) ( ON ?auto_141229 ?auto_141228 ) ( CLEAR ?auto_141231 ) ( ON ?auto_141230 ?auto_141229 ) ( CLEAR ?auto_141230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_141233 ?auto_141225 ?auto_141226 ?auto_141227 ?auto_141228 ?auto_141229 )
      ( MAKE-8PILE ?auto_141225 ?auto_141226 ?auto_141227 ?auto_141228 ?auto_141229 ?auto_141230 ?auto_141231 ?auto_141232 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141234 - BLOCK
      ?auto_141235 - BLOCK
      ?auto_141236 - BLOCK
      ?auto_141237 - BLOCK
      ?auto_141238 - BLOCK
      ?auto_141239 - BLOCK
      ?auto_141240 - BLOCK
      ?auto_141241 - BLOCK
    )
    :vars
    (
      ?auto_141242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141234 ?auto_141235 ) ) ( not ( = ?auto_141234 ?auto_141236 ) ) ( not ( = ?auto_141234 ?auto_141237 ) ) ( not ( = ?auto_141234 ?auto_141238 ) ) ( not ( = ?auto_141234 ?auto_141239 ) ) ( not ( = ?auto_141234 ?auto_141240 ) ) ( not ( = ?auto_141234 ?auto_141241 ) ) ( not ( = ?auto_141235 ?auto_141236 ) ) ( not ( = ?auto_141235 ?auto_141237 ) ) ( not ( = ?auto_141235 ?auto_141238 ) ) ( not ( = ?auto_141235 ?auto_141239 ) ) ( not ( = ?auto_141235 ?auto_141240 ) ) ( not ( = ?auto_141235 ?auto_141241 ) ) ( not ( = ?auto_141236 ?auto_141237 ) ) ( not ( = ?auto_141236 ?auto_141238 ) ) ( not ( = ?auto_141236 ?auto_141239 ) ) ( not ( = ?auto_141236 ?auto_141240 ) ) ( not ( = ?auto_141236 ?auto_141241 ) ) ( not ( = ?auto_141237 ?auto_141238 ) ) ( not ( = ?auto_141237 ?auto_141239 ) ) ( not ( = ?auto_141237 ?auto_141240 ) ) ( not ( = ?auto_141237 ?auto_141241 ) ) ( not ( = ?auto_141238 ?auto_141239 ) ) ( not ( = ?auto_141238 ?auto_141240 ) ) ( not ( = ?auto_141238 ?auto_141241 ) ) ( not ( = ?auto_141239 ?auto_141240 ) ) ( not ( = ?auto_141239 ?auto_141241 ) ) ( not ( = ?auto_141240 ?auto_141241 ) ) ( ON-TABLE ?auto_141241 ) ( ON ?auto_141234 ?auto_141242 ) ( not ( = ?auto_141234 ?auto_141242 ) ) ( not ( = ?auto_141235 ?auto_141242 ) ) ( not ( = ?auto_141236 ?auto_141242 ) ) ( not ( = ?auto_141237 ?auto_141242 ) ) ( not ( = ?auto_141238 ?auto_141242 ) ) ( not ( = ?auto_141239 ?auto_141242 ) ) ( not ( = ?auto_141240 ?auto_141242 ) ) ( not ( = ?auto_141241 ?auto_141242 ) ) ( ON ?auto_141235 ?auto_141234 ) ( ON-TABLE ?auto_141242 ) ( ON ?auto_141236 ?auto_141235 ) ( ON ?auto_141237 ?auto_141236 ) ( ON ?auto_141238 ?auto_141237 ) ( ON ?auto_141239 ?auto_141238 ) ( CLEAR ?auto_141239 ) ( HOLDING ?auto_141240 ) ( CLEAR ?auto_141241 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_141241 ?auto_141240 )
      ( MAKE-8PILE ?auto_141234 ?auto_141235 ?auto_141236 ?auto_141237 ?auto_141238 ?auto_141239 ?auto_141240 ?auto_141241 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141243 - BLOCK
      ?auto_141244 - BLOCK
      ?auto_141245 - BLOCK
      ?auto_141246 - BLOCK
      ?auto_141247 - BLOCK
      ?auto_141248 - BLOCK
      ?auto_141249 - BLOCK
      ?auto_141250 - BLOCK
    )
    :vars
    (
      ?auto_141251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141243 ?auto_141244 ) ) ( not ( = ?auto_141243 ?auto_141245 ) ) ( not ( = ?auto_141243 ?auto_141246 ) ) ( not ( = ?auto_141243 ?auto_141247 ) ) ( not ( = ?auto_141243 ?auto_141248 ) ) ( not ( = ?auto_141243 ?auto_141249 ) ) ( not ( = ?auto_141243 ?auto_141250 ) ) ( not ( = ?auto_141244 ?auto_141245 ) ) ( not ( = ?auto_141244 ?auto_141246 ) ) ( not ( = ?auto_141244 ?auto_141247 ) ) ( not ( = ?auto_141244 ?auto_141248 ) ) ( not ( = ?auto_141244 ?auto_141249 ) ) ( not ( = ?auto_141244 ?auto_141250 ) ) ( not ( = ?auto_141245 ?auto_141246 ) ) ( not ( = ?auto_141245 ?auto_141247 ) ) ( not ( = ?auto_141245 ?auto_141248 ) ) ( not ( = ?auto_141245 ?auto_141249 ) ) ( not ( = ?auto_141245 ?auto_141250 ) ) ( not ( = ?auto_141246 ?auto_141247 ) ) ( not ( = ?auto_141246 ?auto_141248 ) ) ( not ( = ?auto_141246 ?auto_141249 ) ) ( not ( = ?auto_141246 ?auto_141250 ) ) ( not ( = ?auto_141247 ?auto_141248 ) ) ( not ( = ?auto_141247 ?auto_141249 ) ) ( not ( = ?auto_141247 ?auto_141250 ) ) ( not ( = ?auto_141248 ?auto_141249 ) ) ( not ( = ?auto_141248 ?auto_141250 ) ) ( not ( = ?auto_141249 ?auto_141250 ) ) ( ON-TABLE ?auto_141250 ) ( ON ?auto_141243 ?auto_141251 ) ( not ( = ?auto_141243 ?auto_141251 ) ) ( not ( = ?auto_141244 ?auto_141251 ) ) ( not ( = ?auto_141245 ?auto_141251 ) ) ( not ( = ?auto_141246 ?auto_141251 ) ) ( not ( = ?auto_141247 ?auto_141251 ) ) ( not ( = ?auto_141248 ?auto_141251 ) ) ( not ( = ?auto_141249 ?auto_141251 ) ) ( not ( = ?auto_141250 ?auto_141251 ) ) ( ON ?auto_141244 ?auto_141243 ) ( ON-TABLE ?auto_141251 ) ( ON ?auto_141245 ?auto_141244 ) ( ON ?auto_141246 ?auto_141245 ) ( ON ?auto_141247 ?auto_141246 ) ( ON ?auto_141248 ?auto_141247 ) ( CLEAR ?auto_141250 ) ( ON ?auto_141249 ?auto_141248 ) ( CLEAR ?auto_141249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_141251 ?auto_141243 ?auto_141244 ?auto_141245 ?auto_141246 ?auto_141247 ?auto_141248 )
      ( MAKE-8PILE ?auto_141243 ?auto_141244 ?auto_141245 ?auto_141246 ?auto_141247 ?auto_141248 ?auto_141249 ?auto_141250 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141252 - BLOCK
      ?auto_141253 - BLOCK
      ?auto_141254 - BLOCK
      ?auto_141255 - BLOCK
      ?auto_141256 - BLOCK
      ?auto_141257 - BLOCK
      ?auto_141258 - BLOCK
      ?auto_141259 - BLOCK
    )
    :vars
    (
      ?auto_141260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141252 ?auto_141253 ) ) ( not ( = ?auto_141252 ?auto_141254 ) ) ( not ( = ?auto_141252 ?auto_141255 ) ) ( not ( = ?auto_141252 ?auto_141256 ) ) ( not ( = ?auto_141252 ?auto_141257 ) ) ( not ( = ?auto_141252 ?auto_141258 ) ) ( not ( = ?auto_141252 ?auto_141259 ) ) ( not ( = ?auto_141253 ?auto_141254 ) ) ( not ( = ?auto_141253 ?auto_141255 ) ) ( not ( = ?auto_141253 ?auto_141256 ) ) ( not ( = ?auto_141253 ?auto_141257 ) ) ( not ( = ?auto_141253 ?auto_141258 ) ) ( not ( = ?auto_141253 ?auto_141259 ) ) ( not ( = ?auto_141254 ?auto_141255 ) ) ( not ( = ?auto_141254 ?auto_141256 ) ) ( not ( = ?auto_141254 ?auto_141257 ) ) ( not ( = ?auto_141254 ?auto_141258 ) ) ( not ( = ?auto_141254 ?auto_141259 ) ) ( not ( = ?auto_141255 ?auto_141256 ) ) ( not ( = ?auto_141255 ?auto_141257 ) ) ( not ( = ?auto_141255 ?auto_141258 ) ) ( not ( = ?auto_141255 ?auto_141259 ) ) ( not ( = ?auto_141256 ?auto_141257 ) ) ( not ( = ?auto_141256 ?auto_141258 ) ) ( not ( = ?auto_141256 ?auto_141259 ) ) ( not ( = ?auto_141257 ?auto_141258 ) ) ( not ( = ?auto_141257 ?auto_141259 ) ) ( not ( = ?auto_141258 ?auto_141259 ) ) ( ON ?auto_141252 ?auto_141260 ) ( not ( = ?auto_141252 ?auto_141260 ) ) ( not ( = ?auto_141253 ?auto_141260 ) ) ( not ( = ?auto_141254 ?auto_141260 ) ) ( not ( = ?auto_141255 ?auto_141260 ) ) ( not ( = ?auto_141256 ?auto_141260 ) ) ( not ( = ?auto_141257 ?auto_141260 ) ) ( not ( = ?auto_141258 ?auto_141260 ) ) ( not ( = ?auto_141259 ?auto_141260 ) ) ( ON ?auto_141253 ?auto_141252 ) ( ON-TABLE ?auto_141260 ) ( ON ?auto_141254 ?auto_141253 ) ( ON ?auto_141255 ?auto_141254 ) ( ON ?auto_141256 ?auto_141255 ) ( ON ?auto_141257 ?auto_141256 ) ( ON ?auto_141258 ?auto_141257 ) ( CLEAR ?auto_141258 ) ( HOLDING ?auto_141259 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_141259 )
      ( MAKE-8PILE ?auto_141252 ?auto_141253 ?auto_141254 ?auto_141255 ?auto_141256 ?auto_141257 ?auto_141258 ?auto_141259 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_141261 - BLOCK
      ?auto_141262 - BLOCK
      ?auto_141263 - BLOCK
      ?auto_141264 - BLOCK
      ?auto_141265 - BLOCK
      ?auto_141266 - BLOCK
      ?auto_141267 - BLOCK
      ?auto_141268 - BLOCK
    )
    :vars
    (
      ?auto_141269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_141261 ?auto_141262 ) ) ( not ( = ?auto_141261 ?auto_141263 ) ) ( not ( = ?auto_141261 ?auto_141264 ) ) ( not ( = ?auto_141261 ?auto_141265 ) ) ( not ( = ?auto_141261 ?auto_141266 ) ) ( not ( = ?auto_141261 ?auto_141267 ) ) ( not ( = ?auto_141261 ?auto_141268 ) ) ( not ( = ?auto_141262 ?auto_141263 ) ) ( not ( = ?auto_141262 ?auto_141264 ) ) ( not ( = ?auto_141262 ?auto_141265 ) ) ( not ( = ?auto_141262 ?auto_141266 ) ) ( not ( = ?auto_141262 ?auto_141267 ) ) ( not ( = ?auto_141262 ?auto_141268 ) ) ( not ( = ?auto_141263 ?auto_141264 ) ) ( not ( = ?auto_141263 ?auto_141265 ) ) ( not ( = ?auto_141263 ?auto_141266 ) ) ( not ( = ?auto_141263 ?auto_141267 ) ) ( not ( = ?auto_141263 ?auto_141268 ) ) ( not ( = ?auto_141264 ?auto_141265 ) ) ( not ( = ?auto_141264 ?auto_141266 ) ) ( not ( = ?auto_141264 ?auto_141267 ) ) ( not ( = ?auto_141264 ?auto_141268 ) ) ( not ( = ?auto_141265 ?auto_141266 ) ) ( not ( = ?auto_141265 ?auto_141267 ) ) ( not ( = ?auto_141265 ?auto_141268 ) ) ( not ( = ?auto_141266 ?auto_141267 ) ) ( not ( = ?auto_141266 ?auto_141268 ) ) ( not ( = ?auto_141267 ?auto_141268 ) ) ( ON ?auto_141261 ?auto_141269 ) ( not ( = ?auto_141261 ?auto_141269 ) ) ( not ( = ?auto_141262 ?auto_141269 ) ) ( not ( = ?auto_141263 ?auto_141269 ) ) ( not ( = ?auto_141264 ?auto_141269 ) ) ( not ( = ?auto_141265 ?auto_141269 ) ) ( not ( = ?auto_141266 ?auto_141269 ) ) ( not ( = ?auto_141267 ?auto_141269 ) ) ( not ( = ?auto_141268 ?auto_141269 ) ) ( ON ?auto_141262 ?auto_141261 ) ( ON-TABLE ?auto_141269 ) ( ON ?auto_141263 ?auto_141262 ) ( ON ?auto_141264 ?auto_141263 ) ( ON ?auto_141265 ?auto_141264 ) ( ON ?auto_141266 ?auto_141265 ) ( ON ?auto_141267 ?auto_141266 ) ( ON ?auto_141268 ?auto_141267 ) ( CLEAR ?auto_141268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_141269 ?auto_141261 ?auto_141262 ?auto_141263 ?auto_141264 ?auto_141265 ?auto_141266 ?auto_141267 )
      ( MAKE-8PILE ?auto_141261 ?auto_141262 ?auto_141263 ?auto_141264 ?auto_141265 ?auto_141266 ?auto_141267 ?auto_141268 ) )
  )

)

