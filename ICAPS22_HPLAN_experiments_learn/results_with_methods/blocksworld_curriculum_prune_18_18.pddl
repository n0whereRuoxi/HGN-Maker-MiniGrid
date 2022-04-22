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
      ?auto_898027 - BLOCK
    )
    :vars
    (
      ?auto_898028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898027 ?auto_898028 ) ( CLEAR ?auto_898027 ) ( HAND-EMPTY ) ( not ( = ?auto_898027 ?auto_898028 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_898027 ?auto_898028 )
      ( !PUTDOWN ?auto_898027 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_898034 - BLOCK
      ?auto_898035 - BLOCK
    )
    :vars
    (
      ?auto_898036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_898034 ) ( ON ?auto_898035 ?auto_898036 ) ( CLEAR ?auto_898035 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_898034 ) ( not ( = ?auto_898034 ?auto_898035 ) ) ( not ( = ?auto_898034 ?auto_898036 ) ) ( not ( = ?auto_898035 ?auto_898036 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_898035 ?auto_898036 )
      ( !STACK ?auto_898035 ?auto_898034 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_898044 - BLOCK
      ?auto_898045 - BLOCK
    )
    :vars
    (
      ?auto_898046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898045 ?auto_898046 ) ( not ( = ?auto_898044 ?auto_898045 ) ) ( not ( = ?auto_898044 ?auto_898046 ) ) ( not ( = ?auto_898045 ?auto_898046 ) ) ( ON ?auto_898044 ?auto_898045 ) ( CLEAR ?auto_898044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_898044 )
      ( MAKE-2PILE ?auto_898044 ?auto_898045 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_898055 - BLOCK
      ?auto_898056 - BLOCK
      ?auto_898057 - BLOCK
    )
    :vars
    (
      ?auto_898058 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_898056 ) ( ON ?auto_898057 ?auto_898058 ) ( CLEAR ?auto_898057 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_898055 ) ( ON ?auto_898056 ?auto_898055 ) ( not ( = ?auto_898055 ?auto_898056 ) ) ( not ( = ?auto_898055 ?auto_898057 ) ) ( not ( = ?auto_898055 ?auto_898058 ) ) ( not ( = ?auto_898056 ?auto_898057 ) ) ( not ( = ?auto_898056 ?auto_898058 ) ) ( not ( = ?auto_898057 ?auto_898058 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_898057 ?auto_898058 )
      ( !STACK ?auto_898057 ?auto_898056 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_898069 - BLOCK
      ?auto_898070 - BLOCK
      ?auto_898071 - BLOCK
    )
    :vars
    (
      ?auto_898072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898071 ?auto_898072 ) ( ON-TABLE ?auto_898069 ) ( not ( = ?auto_898069 ?auto_898070 ) ) ( not ( = ?auto_898069 ?auto_898071 ) ) ( not ( = ?auto_898069 ?auto_898072 ) ) ( not ( = ?auto_898070 ?auto_898071 ) ) ( not ( = ?auto_898070 ?auto_898072 ) ) ( not ( = ?auto_898071 ?auto_898072 ) ) ( CLEAR ?auto_898069 ) ( ON ?auto_898070 ?auto_898071 ) ( CLEAR ?auto_898070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_898069 ?auto_898070 )
      ( MAKE-3PILE ?auto_898069 ?auto_898070 ?auto_898071 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_898083 - BLOCK
      ?auto_898084 - BLOCK
      ?auto_898085 - BLOCK
    )
    :vars
    (
      ?auto_898086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898085 ?auto_898086 ) ( not ( = ?auto_898083 ?auto_898084 ) ) ( not ( = ?auto_898083 ?auto_898085 ) ) ( not ( = ?auto_898083 ?auto_898086 ) ) ( not ( = ?auto_898084 ?auto_898085 ) ) ( not ( = ?auto_898084 ?auto_898086 ) ) ( not ( = ?auto_898085 ?auto_898086 ) ) ( ON ?auto_898084 ?auto_898085 ) ( ON ?auto_898083 ?auto_898084 ) ( CLEAR ?auto_898083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_898083 )
      ( MAKE-3PILE ?auto_898083 ?auto_898084 ?auto_898085 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_898098 - BLOCK
      ?auto_898099 - BLOCK
      ?auto_898100 - BLOCK
      ?auto_898101 - BLOCK
    )
    :vars
    (
      ?auto_898102 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_898100 ) ( ON ?auto_898101 ?auto_898102 ) ( CLEAR ?auto_898101 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_898098 ) ( ON ?auto_898099 ?auto_898098 ) ( ON ?auto_898100 ?auto_898099 ) ( not ( = ?auto_898098 ?auto_898099 ) ) ( not ( = ?auto_898098 ?auto_898100 ) ) ( not ( = ?auto_898098 ?auto_898101 ) ) ( not ( = ?auto_898098 ?auto_898102 ) ) ( not ( = ?auto_898099 ?auto_898100 ) ) ( not ( = ?auto_898099 ?auto_898101 ) ) ( not ( = ?auto_898099 ?auto_898102 ) ) ( not ( = ?auto_898100 ?auto_898101 ) ) ( not ( = ?auto_898100 ?auto_898102 ) ) ( not ( = ?auto_898101 ?auto_898102 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_898101 ?auto_898102 )
      ( !STACK ?auto_898101 ?auto_898100 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_898116 - BLOCK
      ?auto_898117 - BLOCK
      ?auto_898118 - BLOCK
      ?auto_898119 - BLOCK
    )
    :vars
    (
      ?auto_898120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898119 ?auto_898120 ) ( ON-TABLE ?auto_898116 ) ( ON ?auto_898117 ?auto_898116 ) ( not ( = ?auto_898116 ?auto_898117 ) ) ( not ( = ?auto_898116 ?auto_898118 ) ) ( not ( = ?auto_898116 ?auto_898119 ) ) ( not ( = ?auto_898116 ?auto_898120 ) ) ( not ( = ?auto_898117 ?auto_898118 ) ) ( not ( = ?auto_898117 ?auto_898119 ) ) ( not ( = ?auto_898117 ?auto_898120 ) ) ( not ( = ?auto_898118 ?auto_898119 ) ) ( not ( = ?auto_898118 ?auto_898120 ) ) ( not ( = ?auto_898119 ?auto_898120 ) ) ( CLEAR ?auto_898117 ) ( ON ?auto_898118 ?auto_898119 ) ( CLEAR ?auto_898118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_898116 ?auto_898117 ?auto_898118 )
      ( MAKE-4PILE ?auto_898116 ?auto_898117 ?auto_898118 ?auto_898119 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_898134 - BLOCK
      ?auto_898135 - BLOCK
      ?auto_898136 - BLOCK
      ?auto_898137 - BLOCK
    )
    :vars
    (
      ?auto_898138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898137 ?auto_898138 ) ( ON-TABLE ?auto_898134 ) ( not ( = ?auto_898134 ?auto_898135 ) ) ( not ( = ?auto_898134 ?auto_898136 ) ) ( not ( = ?auto_898134 ?auto_898137 ) ) ( not ( = ?auto_898134 ?auto_898138 ) ) ( not ( = ?auto_898135 ?auto_898136 ) ) ( not ( = ?auto_898135 ?auto_898137 ) ) ( not ( = ?auto_898135 ?auto_898138 ) ) ( not ( = ?auto_898136 ?auto_898137 ) ) ( not ( = ?auto_898136 ?auto_898138 ) ) ( not ( = ?auto_898137 ?auto_898138 ) ) ( ON ?auto_898136 ?auto_898137 ) ( CLEAR ?auto_898134 ) ( ON ?auto_898135 ?auto_898136 ) ( CLEAR ?auto_898135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_898134 ?auto_898135 )
      ( MAKE-4PILE ?auto_898134 ?auto_898135 ?auto_898136 ?auto_898137 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_898152 - BLOCK
      ?auto_898153 - BLOCK
      ?auto_898154 - BLOCK
      ?auto_898155 - BLOCK
    )
    :vars
    (
      ?auto_898156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898155 ?auto_898156 ) ( not ( = ?auto_898152 ?auto_898153 ) ) ( not ( = ?auto_898152 ?auto_898154 ) ) ( not ( = ?auto_898152 ?auto_898155 ) ) ( not ( = ?auto_898152 ?auto_898156 ) ) ( not ( = ?auto_898153 ?auto_898154 ) ) ( not ( = ?auto_898153 ?auto_898155 ) ) ( not ( = ?auto_898153 ?auto_898156 ) ) ( not ( = ?auto_898154 ?auto_898155 ) ) ( not ( = ?auto_898154 ?auto_898156 ) ) ( not ( = ?auto_898155 ?auto_898156 ) ) ( ON ?auto_898154 ?auto_898155 ) ( ON ?auto_898153 ?auto_898154 ) ( ON ?auto_898152 ?auto_898153 ) ( CLEAR ?auto_898152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_898152 )
      ( MAKE-4PILE ?auto_898152 ?auto_898153 ?auto_898154 ?auto_898155 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_898171 - BLOCK
      ?auto_898172 - BLOCK
      ?auto_898173 - BLOCK
      ?auto_898174 - BLOCK
      ?auto_898175 - BLOCK
    )
    :vars
    (
      ?auto_898176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_898174 ) ( ON ?auto_898175 ?auto_898176 ) ( CLEAR ?auto_898175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_898171 ) ( ON ?auto_898172 ?auto_898171 ) ( ON ?auto_898173 ?auto_898172 ) ( ON ?auto_898174 ?auto_898173 ) ( not ( = ?auto_898171 ?auto_898172 ) ) ( not ( = ?auto_898171 ?auto_898173 ) ) ( not ( = ?auto_898171 ?auto_898174 ) ) ( not ( = ?auto_898171 ?auto_898175 ) ) ( not ( = ?auto_898171 ?auto_898176 ) ) ( not ( = ?auto_898172 ?auto_898173 ) ) ( not ( = ?auto_898172 ?auto_898174 ) ) ( not ( = ?auto_898172 ?auto_898175 ) ) ( not ( = ?auto_898172 ?auto_898176 ) ) ( not ( = ?auto_898173 ?auto_898174 ) ) ( not ( = ?auto_898173 ?auto_898175 ) ) ( not ( = ?auto_898173 ?auto_898176 ) ) ( not ( = ?auto_898174 ?auto_898175 ) ) ( not ( = ?auto_898174 ?auto_898176 ) ) ( not ( = ?auto_898175 ?auto_898176 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_898175 ?auto_898176 )
      ( !STACK ?auto_898175 ?auto_898174 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_898193 - BLOCK
      ?auto_898194 - BLOCK
      ?auto_898195 - BLOCK
      ?auto_898196 - BLOCK
      ?auto_898197 - BLOCK
    )
    :vars
    (
      ?auto_898198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898197 ?auto_898198 ) ( ON-TABLE ?auto_898193 ) ( ON ?auto_898194 ?auto_898193 ) ( ON ?auto_898195 ?auto_898194 ) ( not ( = ?auto_898193 ?auto_898194 ) ) ( not ( = ?auto_898193 ?auto_898195 ) ) ( not ( = ?auto_898193 ?auto_898196 ) ) ( not ( = ?auto_898193 ?auto_898197 ) ) ( not ( = ?auto_898193 ?auto_898198 ) ) ( not ( = ?auto_898194 ?auto_898195 ) ) ( not ( = ?auto_898194 ?auto_898196 ) ) ( not ( = ?auto_898194 ?auto_898197 ) ) ( not ( = ?auto_898194 ?auto_898198 ) ) ( not ( = ?auto_898195 ?auto_898196 ) ) ( not ( = ?auto_898195 ?auto_898197 ) ) ( not ( = ?auto_898195 ?auto_898198 ) ) ( not ( = ?auto_898196 ?auto_898197 ) ) ( not ( = ?auto_898196 ?auto_898198 ) ) ( not ( = ?auto_898197 ?auto_898198 ) ) ( CLEAR ?auto_898195 ) ( ON ?auto_898196 ?auto_898197 ) ( CLEAR ?auto_898196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_898193 ?auto_898194 ?auto_898195 ?auto_898196 )
      ( MAKE-5PILE ?auto_898193 ?auto_898194 ?auto_898195 ?auto_898196 ?auto_898197 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_898215 - BLOCK
      ?auto_898216 - BLOCK
      ?auto_898217 - BLOCK
      ?auto_898218 - BLOCK
      ?auto_898219 - BLOCK
    )
    :vars
    (
      ?auto_898220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898219 ?auto_898220 ) ( ON-TABLE ?auto_898215 ) ( ON ?auto_898216 ?auto_898215 ) ( not ( = ?auto_898215 ?auto_898216 ) ) ( not ( = ?auto_898215 ?auto_898217 ) ) ( not ( = ?auto_898215 ?auto_898218 ) ) ( not ( = ?auto_898215 ?auto_898219 ) ) ( not ( = ?auto_898215 ?auto_898220 ) ) ( not ( = ?auto_898216 ?auto_898217 ) ) ( not ( = ?auto_898216 ?auto_898218 ) ) ( not ( = ?auto_898216 ?auto_898219 ) ) ( not ( = ?auto_898216 ?auto_898220 ) ) ( not ( = ?auto_898217 ?auto_898218 ) ) ( not ( = ?auto_898217 ?auto_898219 ) ) ( not ( = ?auto_898217 ?auto_898220 ) ) ( not ( = ?auto_898218 ?auto_898219 ) ) ( not ( = ?auto_898218 ?auto_898220 ) ) ( not ( = ?auto_898219 ?auto_898220 ) ) ( ON ?auto_898218 ?auto_898219 ) ( CLEAR ?auto_898216 ) ( ON ?auto_898217 ?auto_898218 ) ( CLEAR ?auto_898217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_898215 ?auto_898216 ?auto_898217 )
      ( MAKE-5PILE ?auto_898215 ?auto_898216 ?auto_898217 ?auto_898218 ?auto_898219 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_898237 - BLOCK
      ?auto_898238 - BLOCK
      ?auto_898239 - BLOCK
      ?auto_898240 - BLOCK
      ?auto_898241 - BLOCK
    )
    :vars
    (
      ?auto_898242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898241 ?auto_898242 ) ( ON-TABLE ?auto_898237 ) ( not ( = ?auto_898237 ?auto_898238 ) ) ( not ( = ?auto_898237 ?auto_898239 ) ) ( not ( = ?auto_898237 ?auto_898240 ) ) ( not ( = ?auto_898237 ?auto_898241 ) ) ( not ( = ?auto_898237 ?auto_898242 ) ) ( not ( = ?auto_898238 ?auto_898239 ) ) ( not ( = ?auto_898238 ?auto_898240 ) ) ( not ( = ?auto_898238 ?auto_898241 ) ) ( not ( = ?auto_898238 ?auto_898242 ) ) ( not ( = ?auto_898239 ?auto_898240 ) ) ( not ( = ?auto_898239 ?auto_898241 ) ) ( not ( = ?auto_898239 ?auto_898242 ) ) ( not ( = ?auto_898240 ?auto_898241 ) ) ( not ( = ?auto_898240 ?auto_898242 ) ) ( not ( = ?auto_898241 ?auto_898242 ) ) ( ON ?auto_898240 ?auto_898241 ) ( ON ?auto_898239 ?auto_898240 ) ( CLEAR ?auto_898237 ) ( ON ?auto_898238 ?auto_898239 ) ( CLEAR ?auto_898238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_898237 ?auto_898238 )
      ( MAKE-5PILE ?auto_898237 ?auto_898238 ?auto_898239 ?auto_898240 ?auto_898241 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_898259 - BLOCK
      ?auto_898260 - BLOCK
      ?auto_898261 - BLOCK
      ?auto_898262 - BLOCK
      ?auto_898263 - BLOCK
    )
    :vars
    (
      ?auto_898264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898263 ?auto_898264 ) ( not ( = ?auto_898259 ?auto_898260 ) ) ( not ( = ?auto_898259 ?auto_898261 ) ) ( not ( = ?auto_898259 ?auto_898262 ) ) ( not ( = ?auto_898259 ?auto_898263 ) ) ( not ( = ?auto_898259 ?auto_898264 ) ) ( not ( = ?auto_898260 ?auto_898261 ) ) ( not ( = ?auto_898260 ?auto_898262 ) ) ( not ( = ?auto_898260 ?auto_898263 ) ) ( not ( = ?auto_898260 ?auto_898264 ) ) ( not ( = ?auto_898261 ?auto_898262 ) ) ( not ( = ?auto_898261 ?auto_898263 ) ) ( not ( = ?auto_898261 ?auto_898264 ) ) ( not ( = ?auto_898262 ?auto_898263 ) ) ( not ( = ?auto_898262 ?auto_898264 ) ) ( not ( = ?auto_898263 ?auto_898264 ) ) ( ON ?auto_898262 ?auto_898263 ) ( ON ?auto_898261 ?auto_898262 ) ( ON ?auto_898260 ?auto_898261 ) ( ON ?auto_898259 ?auto_898260 ) ( CLEAR ?auto_898259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_898259 )
      ( MAKE-5PILE ?auto_898259 ?auto_898260 ?auto_898261 ?auto_898262 ?auto_898263 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_898282 - BLOCK
      ?auto_898283 - BLOCK
      ?auto_898284 - BLOCK
      ?auto_898285 - BLOCK
      ?auto_898286 - BLOCK
      ?auto_898287 - BLOCK
    )
    :vars
    (
      ?auto_898288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_898286 ) ( ON ?auto_898287 ?auto_898288 ) ( CLEAR ?auto_898287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_898282 ) ( ON ?auto_898283 ?auto_898282 ) ( ON ?auto_898284 ?auto_898283 ) ( ON ?auto_898285 ?auto_898284 ) ( ON ?auto_898286 ?auto_898285 ) ( not ( = ?auto_898282 ?auto_898283 ) ) ( not ( = ?auto_898282 ?auto_898284 ) ) ( not ( = ?auto_898282 ?auto_898285 ) ) ( not ( = ?auto_898282 ?auto_898286 ) ) ( not ( = ?auto_898282 ?auto_898287 ) ) ( not ( = ?auto_898282 ?auto_898288 ) ) ( not ( = ?auto_898283 ?auto_898284 ) ) ( not ( = ?auto_898283 ?auto_898285 ) ) ( not ( = ?auto_898283 ?auto_898286 ) ) ( not ( = ?auto_898283 ?auto_898287 ) ) ( not ( = ?auto_898283 ?auto_898288 ) ) ( not ( = ?auto_898284 ?auto_898285 ) ) ( not ( = ?auto_898284 ?auto_898286 ) ) ( not ( = ?auto_898284 ?auto_898287 ) ) ( not ( = ?auto_898284 ?auto_898288 ) ) ( not ( = ?auto_898285 ?auto_898286 ) ) ( not ( = ?auto_898285 ?auto_898287 ) ) ( not ( = ?auto_898285 ?auto_898288 ) ) ( not ( = ?auto_898286 ?auto_898287 ) ) ( not ( = ?auto_898286 ?auto_898288 ) ) ( not ( = ?auto_898287 ?auto_898288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_898287 ?auto_898288 )
      ( !STACK ?auto_898287 ?auto_898286 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_898308 - BLOCK
      ?auto_898309 - BLOCK
      ?auto_898310 - BLOCK
      ?auto_898311 - BLOCK
      ?auto_898312 - BLOCK
      ?auto_898313 - BLOCK
    )
    :vars
    (
      ?auto_898314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898313 ?auto_898314 ) ( ON-TABLE ?auto_898308 ) ( ON ?auto_898309 ?auto_898308 ) ( ON ?auto_898310 ?auto_898309 ) ( ON ?auto_898311 ?auto_898310 ) ( not ( = ?auto_898308 ?auto_898309 ) ) ( not ( = ?auto_898308 ?auto_898310 ) ) ( not ( = ?auto_898308 ?auto_898311 ) ) ( not ( = ?auto_898308 ?auto_898312 ) ) ( not ( = ?auto_898308 ?auto_898313 ) ) ( not ( = ?auto_898308 ?auto_898314 ) ) ( not ( = ?auto_898309 ?auto_898310 ) ) ( not ( = ?auto_898309 ?auto_898311 ) ) ( not ( = ?auto_898309 ?auto_898312 ) ) ( not ( = ?auto_898309 ?auto_898313 ) ) ( not ( = ?auto_898309 ?auto_898314 ) ) ( not ( = ?auto_898310 ?auto_898311 ) ) ( not ( = ?auto_898310 ?auto_898312 ) ) ( not ( = ?auto_898310 ?auto_898313 ) ) ( not ( = ?auto_898310 ?auto_898314 ) ) ( not ( = ?auto_898311 ?auto_898312 ) ) ( not ( = ?auto_898311 ?auto_898313 ) ) ( not ( = ?auto_898311 ?auto_898314 ) ) ( not ( = ?auto_898312 ?auto_898313 ) ) ( not ( = ?auto_898312 ?auto_898314 ) ) ( not ( = ?auto_898313 ?auto_898314 ) ) ( CLEAR ?auto_898311 ) ( ON ?auto_898312 ?auto_898313 ) ( CLEAR ?auto_898312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_898308 ?auto_898309 ?auto_898310 ?auto_898311 ?auto_898312 )
      ( MAKE-6PILE ?auto_898308 ?auto_898309 ?auto_898310 ?auto_898311 ?auto_898312 ?auto_898313 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_898334 - BLOCK
      ?auto_898335 - BLOCK
      ?auto_898336 - BLOCK
      ?auto_898337 - BLOCK
      ?auto_898338 - BLOCK
      ?auto_898339 - BLOCK
    )
    :vars
    (
      ?auto_898340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898339 ?auto_898340 ) ( ON-TABLE ?auto_898334 ) ( ON ?auto_898335 ?auto_898334 ) ( ON ?auto_898336 ?auto_898335 ) ( not ( = ?auto_898334 ?auto_898335 ) ) ( not ( = ?auto_898334 ?auto_898336 ) ) ( not ( = ?auto_898334 ?auto_898337 ) ) ( not ( = ?auto_898334 ?auto_898338 ) ) ( not ( = ?auto_898334 ?auto_898339 ) ) ( not ( = ?auto_898334 ?auto_898340 ) ) ( not ( = ?auto_898335 ?auto_898336 ) ) ( not ( = ?auto_898335 ?auto_898337 ) ) ( not ( = ?auto_898335 ?auto_898338 ) ) ( not ( = ?auto_898335 ?auto_898339 ) ) ( not ( = ?auto_898335 ?auto_898340 ) ) ( not ( = ?auto_898336 ?auto_898337 ) ) ( not ( = ?auto_898336 ?auto_898338 ) ) ( not ( = ?auto_898336 ?auto_898339 ) ) ( not ( = ?auto_898336 ?auto_898340 ) ) ( not ( = ?auto_898337 ?auto_898338 ) ) ( not ( = ?auto_898337 ?auto_898339 ) ) ( not ( = ?auto_898337 ?auto_898340 ) ) ( not ( = ?auto_898338 ?auto_898339 ) ) ( not ( = ?auto_898338 ?auto_898340 ) ) ( not ( = ?auto_898339 ?auto_898340 ) ) ( ON ?auto_898338 ?auto_898339 ) ( CLEAR ?auto_898336 ) ( ON ?auto_898337 ?auto_898338 ) ( CLEAR ?auto_898337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_898334 ?auto_898335 ?auto_898336 ?auto_898337 )
      ( MAKE-6PILE ?auto_898334 ?auto_898335 ?auto_898336 ?auto_898337 ?auto_898338 ?auto_898339 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_898360 - BLOCK
      ?auto_898361 - BLOCK
      ?auto_898362 - BLOCK
      ?auto_898363 - BLOCK
      ?auto_898364 - BLOCK
      ?auto_898365 - BLOCK
    )
    :vars
    (
      ?auto_898366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898365 ?auto_898366 ) ( ON-TABLE ?auto_898360 ) ( ON ?auto_898361 ?auto_898360 ) ( not ( = ?auto_898360 ?auto_898361 ) ) ( not ( = ?auto_898360 ?auto_898362 ) ) ( not ( = ?auto_898360 ?auto_898363 ) ) ( not ( = ?auto_898360 ?auto_898364 ) ) ( not ( = ?auto_898360 ?auto_898365 ) ) ( not ( = ?auto_898360 ?auto_898366 ) ) ( not ( = ?auto_898361 ?auto_898362 ) ) ( not ( = ?auto_898361 ?auto_898363 ) ) ( not ( = ?auto_898361 ?auto_898364 ) ) ( not ( = ?auto_898361 ?auto_898365 ) ) ( not ( = ?auto_898361 ?auto_898366 ) ) ( not ( = ?auto_898362 ?auto_898363 ) ) ( not ( = ?auto_898362 ?auto_898364 ) ) ( not ( = ?auto_898362 ?auto_898365 ) ) ( not ( = ?auto_898362 ?auto_898366 ) ) ( not ( = ?auto_898363 ?auto_898364 ) ) ( not ( = ?auto_898363 ?auto_898365 ) ) ( not ( = ?auto_898363 ?auto_898366 ) ) ( not ( = ?auto_898364 ?auto_898365 ) ) ( not ( = ?auto_898364 ?auto_898366 ) ) ( not ( = ?auto_898365 ?auto_898366 ) ) ( ON ?auto_898364 ?auto_898365 ) ( ON ?auto_898363 ?auto_898364 ) ( CLEAR ?auto_898361 ) ( ON ?auto_898362 ?auto_898363 ) ( CLEAR ?auto_898362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_898360 ?auto_898361 ?auto_898362 )
      ( MAKE-6PILE ?auto_898360 ?auto_898361 ?auto_898362 ?auto_898363 ?auto_898364 ?auto_898365 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_898386 - BLOCK
      ?auto_898387 - BLOCK
      ?auto_898388 - BLOCK
      ?auto_898389 - BLOCK
      ?auto_898390 - BLOCK
      ?auto_898391 - BLOCK
    )
    :vars
    (
      ?auto_898392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898391 ?auto_898392 ) ( ON-TABLE ?auto_898386 ) ( not ( = ?auto_898386 ?auto_898387 ) ) ( not ( = ?auto_898386 ?auto_898388 ) ) ( not ( = ?auto_898386 ?auto_898389 ) ) ( not ( = ?auto_898386 ?auto_898390 ) ) ( not ( = ?auto_898386 ?auto_898391 ) ) ( not ( = ?auto_898386 ?auto_898392 ) ) ( not ( = ?auto_898387 ?auto_898388 ) ) ( not ( = ?auto_898387 ?auto_898389 ) ) ( not ( = ?auto_898387 ?auto_898390 ) ) ( not ( = ?auto_898387 ?auto_898391 ) ) ( not ( = ?auto_898387 ?auto_898392 ) ) ( not ( = ?auto_898388 ?auto_898389 ) ) ( not ( = ?auto_898388 ?auto_898390 ) ) ( not ( = ?auto_898388 ?auto_898391 ) ) ( not ( = ?auto_898388 ?auto_898392 ) ) ( not ( = ?auto_898389 ?auto_898390 ) ) ( not ( = ?auto_898389 ?auto_898391 ) ) ( not ( = ?auto_898389 ?auto_898392 ) ) ( not ( = ?auto_898390 ?auto_898391 ) ) ( not ( = ?auto_898390 ?auto_898392 ) ) ( not ( = ?auto_898391 ?auto_898392 ) ) ( ON ?auto_898390 ?auto_898391 ) ( ON ?auto_898389 ?auto_898390 ) ( ON ?auto_898388 ?auto_898389 ) ( CLEAR ?auto_898386 ) ( ON ?auto_898387 ?auto_898388 ) ( CLEAR ?auto_898387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_898386 ?auto_898387 )
      ( MAKE-6PILE ?auto_898386 ?auto_898387 ?auto_898388 ?auto_898389 ?auto_898390 ?auto_898391 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_898412 - BLOCK
      ?auto_898413 - BLOCK
      ?auto_898414 - BLOCK
      ?auto_898415 - BLOCK
      ?auto_898416 - BLOCK
      ?auto_898417 - BLOCK
    )
    :vars
    (
      ?auto_898418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898417 ?auto_898418 ) ( not ( = ?auto_898412 ?auto_898413 ) ) ( not ( = ?auto_898412 ?auto_898414 ) ) ( not ( = ?auto_898412 ?auto_898415 ) ) ( not ( = ?auto_898412 ?auto_898416 ) ) ( not ( = ?auto_898412 ?auto_898417 ) ) ( not ( = ?auto_898412 ?auto_898418 ) ) ( not ( = ?auto_898413 ?auto_898414 ) ) ( not ( = ?auto_898413 ?auto_898415 ) ) ( not ( = ?auto_898413 ?auto_898416 ) ) ( not ( = ?auto_898413 ?auto_898417 ) ) ( not ( = ?auto_898413 ?auto_898418 ) ) ( not ( = ?auto_898414 ?auto_898415 ) ) ( not ( = ?auto_898414 ?auto_898416 ) ) ( not ( = ?auto_898414 ?auto_898417 ) ) ( not ( = ?auto_898414 ?auto_898418 ) ) ( not ( = ?auto_898415 ?auto_898416 ) ) ( not ( = ?auto_898415 ?auto_898417 ) ) ( not ( = ?auto_898415 ?auto_898418 ) ) ( not ( = ?auto_898416 ?auto_898417 ) ) ( not ( = ?auto_898416 ?auto_898418 ) ) ( not ( = ?auto_898417 ?auto_898418 ) ) ( ON ?auto_898416 ?auto_898417 ) ( ON ?auto_898415 ?auto_898416 ) ( ON ?auto_898414 ?auto_898415 ) ( ON ?auto_898413 ?auto_898414 ) ( ON ?auto_898412 ?auto_898413 ) ( CLEAR ?auto_898412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_898412 )
      ( MAKE-6PILE ?auto_898412 ?auto_898413 ?auto_898414 ?auto_898415 ?auto_898416 ?auto_898417 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_898439 - BLOCK
      ?auto_898440 - BLOCK
      ?auto_898441 - BLOCK
      ?auto_898442 - BLOCK
      ?auto_898443 - BLOCK
      ?auto_898444 - BLOCK
      ?auto_898445 - BLOCK
    )
    :vars
    (
      ?auto_898446 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_898444 ) ( ON ?auto_898445 ?auto_898446 ) ( CLEAR ?auto_898445 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_898439 ) ( ON ?auto_898440 ?auto_898439 ) ( ON ?auto_898441 ?auto_898440 ) ( ON ?auto_898442 ?auto_898441 ) ( ON ?auto_898443 ?auto_898442 ) ( ON ?auto_898444 ?auto_898443 ) ( not ( = ?auto_898439 ?auto_898440 ) ) ( not ( = ?auto_898439 ?auto_898441 ) ) ( not ( = ?auto_898439 ?auto_898442 ) ) ( not ( = ?auto_898439 ?auto_898443 ) ) ( not ( = ?auto_898439 ?auto_898444 ) ) ( not ( = ?auto_898439 ?auto_898445 ) ) ( not ( = ?auto_898439 ?auto_898446 ) ) ( not ( = ?auto_898440 ?auto_898441 ) ) ( not ( = ?auto_898440 ?auto_898442 ) ) ( not ( = ?auto_898440 ?auto_898443 ) ) ( not ( = ?auto_898440 ?auto_898444 ) ) ( not ( = ?auto_898440 ?auto_898445 ) ) ( not ( = ?auto_898440 ?auto_898446 ) ) ( not ( = ?auto_898441 ?auto_898442 ) ) ( not ( = ?auto_898441 ?auto_898443 ) ) ( not ( = ?auto_898441 ?auto_898444 ) ) ( not ( = ?auto_898441 ?auto_898445 ) ) ( not ( = ?auto_898441 ?auto_898446 ) ) ( not ( = ?auto_898442 ?auto_898443 ) ) ( not ( = ?auto_898442 ?auto_898444 ) ) ( not ( = ?auto_898442 ?auto_898445 ) ) ( not ( = ?auto_898442 ?auto_898446 ) ) ( not ( = ?auto_898443 ?auto_898444 ) ) ( not ( = ?auto_898443 ?auto_898445 ) ) ( not ( = ?auto_898443 ?auto_898446 ) ) ( not ( = ?auto_898444 ?auto_898445 ) ) ( not ( = ?auto_898444 ?auto_898446 ) ) ( not ( = ?auto_898445 ?auto_898446 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_898445 ?auto_898446 )
      ( !STACK ?auto_898445 ?auto_898444 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_898469 - BLOCK
      ?auto_898470 - BLOCK
      ?auto_898471 - BLOCK
      ?auto_898472 - BLOCK
      ?auto_898473 - BLOCK
      ?auto_898474 - BLOCK
      ?auto_898475 - BLOCK
    )
    :vars
    (
      ?auto_898476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898475 ?auto_898476 ) ( ON-TABLE ?auto_898469 ) ( ON ?auto_898470 ?auto_898469 ) ( ON ?auto_898471 ?auto_898470 ) ( ON ?auto_898472 ?auto_898471 ) ( ON ?auto_898473 ?auto_898472 ) ( not ( = ?auto_898469 ?auto_898470 ) ) ( not ( = ?auto_898469 ?auto_898471 ) ) ( not ( = ?auto_898469 ?auto_898472 ) ) ( not ( = ?auto_898469 ?auto_898473 ) ) ( not ( = ?auto_898469 ?auto_898474 ) ) ( not ( = ?auto_898469 ?auto_898475 ) ) ( not ( = ?auto_898469 ?auto_898476 ) ) ( not ( = ?auto_898470 ?auto_898471 ) ) ( not ( = ?auto_898470 ?auto_898472 ) ) ( not ( = ?auto_898470 ?auto_898473 ) ) ( not ( = ?auto_898470 ?auto_898474 ) ) ( not ( = ?auto_898470 ?auto_898475 ) ) ( not ( = ?auto_898470 ?auto_898476 ) ) ( not ( = ?auto_898471 ?auto_898472 ) ) ( not ( = ?auto_898471 ?auto_898473 ) ) ( not ( = ?auto_898471 ?auto_898474 ) ) ( not ( = ?auto_898471 ?auto_898475 ) ) ( not ( = ?auto_898471 ?auto_898476 ) ) ( not ( = ?auto_898472 ?auto_898473 ) ) ( not ( = ?auto_898472 ?auto_898474 ) ) ( not ( = ?auto_898472 ?auto_898475 ) ) ( not ( = ?auto_898472 ?auto_898476 ) ) ( not ( = ?auto_898473 ?auto_898474 ) ) ( not ( = ?auto_898473 ?auto_898475 ) ) ( not ( = ?auto_898473 ?auto_898476 ) ) ( not ( = ?auto_898474 ?auto_898475 ) ) ( not ( = ?auto_898474 ?auto_898476 ) ) ( not ( = ?auto_898475 ?auto_898476 ) ) ( CLEAR ?auto_898473 ) ( ON ?auto_898474 ?auto_898475 ) ( CLEAR ?auto_898474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_898469 ?auto_898470 ?auto_898471 ?auto_898472 ?auto_898473 ?auto_898474 )
      ( MAKE-7PILE ?auto_898469 ?auto_898470 ?auto_898471 ?auto_898472 ?auto_898473 ?auto_898474 ?auto_898475 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_898499 - BLOCK
      ?auto_898500 - BLOCK
      ?auto_898501 - BLOCK
      ?auto_898502 - BLOCK
      ?auto_898503 - BLOCK
      ?auto_898504 - BLOCK
      ?auto_898505 - BLOCK
    )
    :vars
    (
      ?auto_898506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898505 ?auto_898506 ) ( ON-TABLE ?auto_898499 ) ( ON ?auto_898500 ?auto_898499 ) ( ON ?auto_898501 ?auto_898500 ) ( ON ?auto_898502 ?auto_898501 ) ( not ( = ?auto_898499 ?auto_898500 ) ) ( not ( = ?auto_898499 ?auto_898501 ) ) ( not ( = ?auto_898499 ?auto_898502 ) ) ( not ( = ?auto_898499 ?auto_898503 ) ) ( not ( = ?auto_898499 ?auto_898504 ) ) ( not ( = ?auto_898499 ?auto_898505 ) ) ( not ( = ?auto_898499 ?auto_898506 ) ) ( not ( = ?auto_898500 ?auto_898501 ) ) ( not ( = ?auto_898500 ?auto_898502 ) ) ( not ( = ?auto_898500 ?auto_898503 ) ) ( not ( = ?auto_898500 ?auto_898504 ) ) ( not ( = ?auto_898500 ?auto_898505 ) ) ( not ( = ?auto_898500 ?auto_898506 ) ) ( not ( = ?auto_898501 ?auto_898502 ) ) ( not ( = ?auto_898501 ?auto_898503 ) ) ( not ( = ?auto_898501 ?auto_898504 ) ) ( not ( = ?auto_898501 ?auto_898505 ) ) ( not ( = ?auto_898501 ?auto_898506 ) ) ( not ( = ?auto_898502 ?auto_898503 ) ) ( not ( = ?auto_898502 ?auto_898504 ) ) ( not ( = ?auto_898502 ?auto_898505 ) ) ( not ( = ?auto_898502 ?auto_898506 ) ) ( not ( = ?auto_898503 ?auto_898504 ) ) ( not ( = ?auto_898503 ?auto_898505 ) ) ( not ( = ?auto_898503 ?auto_898506 ) ) ( not ( = ?auto_898504 ?auto_898505 ) ) ( not ( = ?auto_898504 ?auto_898506 ) ) ( not ( = ?auto_898505 ?auto_898506 ) ) ( ON ?auto_898504 ?auto_898505 ) ( CLEAR ?auto_898502 ) ( ON ?auto_898503 ?auto_898504 ) ( CLEAR ?auto_898503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_898499 ?auto_898500 ?auto_898501 ?auto_898502 ?auto_898503 )
      ( MAKE-7PILE ?auto_898499 ?auto_898500 ?auto_898501 ?auto_898502 ?auto_898503 ?auto_898504 ?auto_898505 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_898529 - BLOCK
      ?auto_898530 - BLOCK
      ?auto_898531 - BLOCK
      ?auto_898532 - BLOCK
      ?auto_898533 - BLOCK
      ?auto_898534 - BLOCK
      ?auto_898535 - BLOCK
    )
    :vars
    (
      ?auto_898536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898535 ?auto_898536 ) ( ON-TABLE ?auto_898529 ) ( ON ?auto_898530 ?auto_898529 ) ( ON ?auto_898531 ?auto_898530 ) ( not ( = ?auto_898529 ?auto_898530 ) ) ( not ( = ?auto_898529 ?auto_898531 ) ) ( not ( = ?auto_898529 ?auto_898532 ) ) ( not ( = ?auto_898529 ?auto_898533 ) ) ( not ( = ?auto_898529 ?auto_898534 ) ) ( not ( = ?auto_898529 ?auto_898535 ) ) ( not ( = ?auto_898529 ?auto_898536 ) ) ( not ( = ?auto_898530 ?auto_898531 ) ) ( not ( = ?auto_898530 ?auto_898532 ) ) ( not ( = ?auto_898530 ?auto_898533 ) ) ( not ( = ?auto_898530 ?auto_898534 ) ) ( not ( = ?auto_898530 ?auto_898535 ) ) ( not ( = ?auto_898530 ?auto_898536 ) ) ( not ( = ?auto_898531 ?auto_898532 ) ) ( not ( = ?auto_898531 ?auto_898533 ) ) ( not ( = ?auto_898531 ?auto_898534 ) ) ( not ( = ?auto_898531 ?auto_898535 ) ) ( not ( = ?auto_898531 ?auto_898536 ) ) ( not ( = ?auto_898532 ?auto_898533 ) ) ( not ( = ?auto_898532 ?auto_898534 ) ) ( not ( = ?auto_898532 ?auto_898535 ) ) ( not ( = ?auto_898532 ?auto_898536 ) ) ( not ( = ?auto_898533 ?auto_898534 ) ) ( not ( = ?auto_898533 ?auto_898535 ) ) ( not ( = ?auto_898533 ?auto_898536 ) ) ( not ( = ?auto_898534 ?auto_898535 ) ) ( not ( = ?auto_898534 ?auto_898536 ) ) ( not ( = ?auto_898535 ?auto_898536 ) ) ( ON ?auto_898534 ?auto_898535 ) ( ON ?auto_898533 ?auto_898534 ) ( CLEAR ?auto_898531 ) ( ON ?auto_898532 ?auto_898533 ) ( CLEAR ?auto_898532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_898529 ?auto_898530 ?auto_898531 ?auto_898532 )
      ( MAKE-7PILE ?auto_898529 ?auto_898530 ?auto_898531 ?auto_898532 ?auto_898533 ?auto_898534 ?auto_898535 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_898559 - BLOCK
      ?auto_898560 - BLOCK
      ?auto_898561 - BLOCK
      ?auto_898562 - BLOCK
      ?auto_898563 - BLOCK
      ?auto_898564 - BLOCK
      ?auto_898565 - BLOCK
    )
    :vars
    (
      ?auto_898566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898565 ?auto_898566 ) ( ON-TABLE ?auto_898559 ) ( ON ?auto_898560 ?auto_898559 ) ( not ( = ?auto_898559 ?auto_898560 ) ) ( not ( = ?auto_898559 ?auto_898561 ) ) ( not ( = ?auto_898559 ?auto_898562 ) ) ( not ( = ?auto_898559 ?auto_898563 ) ) ( not ( = ?auto_898559 ?auto_898564 ) ) ( not ( = ?auto_898559 ?auto_898565 ) ) ( not ( = ?auto_898559 ?auto_898566 ) ) ( not ( = ?auto_898560 ?auto_898561 ) ) ( not ( = ?auto_898560 ?auto_898562 ) ) ( not ( = ?auto_898560 ?auto_898563 ) ) ( not ( = ?auto_898560 ?auto_898564 ) ) ( not ( = ?auto_898560 ?auto_898565 ) ) ( not ( = ?auto_898560 ?auto_898566 ) ) ( not ( = ?auto_898561 ?auto_898562 ) ) ( not ( = ?auto_898561 ?auto_898563 ) ) ( not ( = ?auto_898561 ?auto_898564 ) ) ( not ( = ?auto_898561 ?auto_898565 ) ) ( not ( = ?auto_898561 ?auto_898566 ) ) ( not ( = ?auto_898562 ?auto_898563 ) ) ( not ( = ?auto_898562 ?auto_898564 ) ) ( not ( = ?auto_898562 ?auto_898565 ) ) ( not ( = ?auto_898562 ?auto_898566 ) ) ( not ( = ?auto_898563 ?auto_898564 ) ) ( not ( = ?auto_898563 ?auto_898565 ) ) ( not ( = ?auto_898563 ?auto_898566 ) ) ( not ( = ?auto_898564 ?auto_898565 ) ) ( not ( = ?auto_898564 ?auto_898566 ) ) ( not ( = ?auto_898565 ?auto_898566 ) ) ( ON ?auto_898564 ?auto_898565 ) ( ON ?auto_898563 ?auto_898564 ) ( ON ?auto_898562 ?auto_898563 ) ( CLEAR ?auto_898560 ) ( ON ?auto_898561 ?auto_898562 ) ( CLEAR ?auto_898561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_898559 ?auto_898560 ?auto_898561 )
      ( MAKE-7PILE ?auto_898559 ?auto_898560 ?auto_898561 ?auto_898562 ?auto_898563 ?auto_898564 ?auto_898565 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_898589 - BLOCK
      ?auto_898590 - BLOCK
      ?auto_898591 - BLOCK
      ?auto_898592 - BLOCK
      ?auto_898593 - BLOCK
      ?auto_898594 - BLOCK
      ?auto_898595 - BLOCK
    )
    :vars
    (
      ?auto_898596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898595 ?auto_898596 ) ( ON-TABLE ?auto_898589 ) ( not ( = ?auto_898589 ?auto_898590 ) ) ( not ( = ?auto_898589 ?auto_898591 ) ) ( not ( = ?auto_898589 ?auto_898592 ) ) ( not ( = ?auto_898589 ?auto_898593 ) ) ( not ( = ?auto_898589 ?auto_898594 ) ) ( not ( = ?auto_898589 ?auto_898595 ) ) ( not ( = ?auto_898589 ?auto_898596 ) ) ( not ( = ?auto_898590 ?auto_898591 ) ) ( not ( = ?auto_898590 ?auto_898592 ) ) ( not ( = ?auto_898590 ?auto_898593 ) ) ( not ( = ?auto_898590 ?auto_898594 ) ) ( not ( = ?auto_898590 ?auto_898595 ) ) ( not ( = ?auto_898590 ?auto_898596 ) ) ( not ( = ?auto_898591 ?auto_898592 ) ) ( not ( = ?auto_898591 ?auto_898593 ) ) ( not ( = ?auto_898591 ?auto_898594 ) ) ( not ( = ?auto_898591 ?auto_898595 ) ) ( not ( = ?auto_898591 ?auto_898596 ) ) ( not ( = ?auto_898592 ?auto_898593 ) ) ( not ( = ?auto_898592 ?auto_898594 ) ) ( not ( = ?auto_898592 ?auto_898595 ) ) ( not ( = ?auto_898592 ?auto_898596 ) ) ( not ( = ?auto_898593 ?auto_898594 ) ) ( not ( = ?auto_898593 ?auto_898595 ) ) ( not ( = ?auto_898593 ?auto_898596 ) ) ( not ( = ?auto_898594 ?auto_898595 ) ) ( not ( = ?auto_898594 ?auto_898596 ) ) ( not ( = ?auto_898595 ?auto_898596 ) ) ( ON ?auto_898594 ?auto_898595 ) ( ON ?auto_898593 ?auto_898594 ) ( ON ?auto_898592 ?auto_898593 ) ( ON ?auto_898591 ?auto_898592 ) ( CLEAR ?auto_898589 ) ( ON ?auto_898590 ?auto_898591 ) ( CLEAR ?auto_898590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_898589 ?auto_898590 )
      ( MAKE-7PILE ?auto_898589 ?auto_898590 ?auto_898591 ?auto_898592 ?auto_898593 ?auto_898594 ?auto_898595 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_898619 - BLOCK
      ?auto_898620 - BLOCK
      ?auto_898621 - BLOCK
      ?auto_898622 - BLOCK
      ?auto_898623 - BLOCK
      ?auto_898624 - BLOCK
      ?auto_898625 - BLOCK
    )
    :vars
    (
      ?auto_898626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898625 ?auto_898626 ) ( not ( = ?auto_898619 ?auto_898620 ) ) ( not ( = ?auto_898619 ?auto_898621 ) ) ( not ( = ?auto_898619 ?auto_898622 ) ) ( not ( = ?auto_898619 ?auto_898623 ) ) ( not ( = ?auto_898619 ?auto_898624 ) ) ( not ( = ?auto_898619 ?auto_898625 ) ) ( not ( = ?auto_898619 ?auto_898626 ) ) ( not ( = ?auto_898620 ?auto_898621 ) ) ( not ( = ?auto_898620 ?auto_898622 ) ) ( not ( = ?auto_898620 ?auto_898623 ) ) ( not ( = ?auto_898620 ?auto_898624 ) ) ( not ( = ?auto_898620 ?auto_898625 ) ) ( not ( = ?auto_898620 ?auto_898626 ) ) ( not ( = ?auto_898621 ?auto_898622 ) ) ( not ( = ?auto_898621 ?auto_898623 ) ) ( not ( = ?auto_898621 ?auto_898624 ) ) ( not ( = ?auto_898621 ?auto_898625 ) ) ( not ( = ?auto_898621 ?auto_898626 ) ) ( not ( = ?auto_898622 ?auto_898623 ) ) ( not ( = ?auto_898622 ?auto_898624 ) ) ( not ( = ?auto_898622 ?auto_898625 ) ) ( not ( = ?auto_898622 ?auto_898626 ) ) ( not ( = ?auto_898623 ?auto_898624 ) ) ( not ( = ?auto_898623 ?auto_898625 ) ) ( not ( = ?auto_898623 ?auto_898626 ) ) ( not ( = ?auto_898624 ?auto_898625 ) ) ( not ( = ?auto_898624 ?auto_898626 ) ) ( not ( = ?auto_898625 ?auto_898626 ) ) ( ON ?auto_898624 ?auto_898625 ) ( ON ?auto_898623 ?auto_898624 ) ( ON ?auto_898622 ?auto_898623 ) ( ON ?auto_898621 ?auto_898622 ) ( ON ?auto_898620 ?auto_898621 ) ( ON ?auto_898619 ?auto_898620 ) ( CLEAR ?auto_898619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_898619 )
      ( MAKE-7PILE ?auto_898619 ?auto_898620 ?auto_898621 ?auto_898622 ?auto_898623 ?auto_898624 ?auto_898625 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_898650 - BLOCK
      ?auto_898651 - BLOCK
      ?auto_898652 - BLOCK
      ?auto_898653 - BLOCK
      ?auto_898654 - BLOCK
      ?auto_898655 - BLOCK
      ?auto_898656 - BLOCK
      ?auto_898657 - BLOCK
    )
    :vars
    (
      ?auto_898658 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_898656 ) ( ON ?auto_898657 ?auto_898658 ) ( CLEAR ?auto_898657 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_898650 ) ( ON ?auto_898651 ?auto_898650 ) ( ON ?auto_898652 ?auto_898651 ) ( ON ?auto_898653 ?auto_898652 ) ( ON ?auto_898654 ?auto_898653 ) ( ON ?auto_898655 ?auto_898654 ) ( ON ?auto_898656 ?auto_898655 ) ( not ( = ?auto_898650 ?auto_898651 ) ) ( not ( = ?auto_898650 ?auto_898652 ) ) ( not ( = ?auto_898650 ?auto_898653 ) ) ( not ( = ?auto_898650 ?auto_898654 ) ) ( not ( = ?auto_898650 ?auto_898655 ) ) ( not ( = ?auto_898650 ?auto_898656 ) ) ( not ( = ?auto_898650 ?auto_898657 ) ) ( not ( = ?auto_898650 ?auto_898658 ) ) ( not ( = ?auto_898651 ?auto_898652 ) ) ( not ( = ?auto_898651 ?auto_898653 ) ) ( not ( = ?auto_898651 ?auto_898654 ) ) ( not ( = ?auto_898651 ?auto_898655 ) ) ( not ( = ?auto_898651 ?auto_898656 ) ) ( not ( = ?auto_898651 ?auto_898657 ) ) ( not ( = ?auto_898651 ?auto_898658 ) ) ( not ( = ?auto_898652 ?auto_898653 ) ) ( not ( = ?auto_898652 ?auto_898654 ) ) ( not ( = ?auto_898652 ?auto_898655 ) ) ( not ( = ?auto_898652 ?auto_898656 ) ) ( not ( = ?auto_898652 ?auto_898657 ) ) ( not ( = ?auto_898652 ?auto_898658 ) ) ( not ( = ?auto_898653 ?auto_898654 ) ) ( not ( = ?auto_898653 ?auto_898655 ) ) ( not ( = ?auto_898653 ?auto_898656 ) ) ( not ( = ?auto_898653 ?auto_898657 ) ) ( not ( = ?auto_898653 ?auto_898658 ) ) ( not ( = ?auto_898654 ?auto_898655 ) ) ( not ( = ?auto_898654 ?auto_898656 ) ) ( not ( = ?auto_898654 ?auto_898657 ) ) ( not ( = ?auto_898654 ?auto_898658 ) ) ( not ( = ?auto_898655 ?auto_898656 ) ) ( not ( = ?auto_898655 ?auto_898657 ) ) ( not ( = ?auto_898655 ?auto_898658 ) ) ( not ( = ?auto_898656 ?auto_898657 ) ) ( not ( = ?auto_898656 ?auto_898658 ) ) ( not ( = ?auto_898657 ?auto_898658 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_898657 ?auto_898658 )
      ( !STACK ?auto_898657 ?auto_898656 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_898684 - BLOCK
      ?auto_898685 - BLOCK
      ?auto_898686 - BLOCK
      ?auto_898687 - BLOCK
      ?auto_898688 - BLOCK
      ?auto_898689 - BLOCK
      ?auto_898690 - BLOCK
      ?auto_898691 - BLOCK
    )
    :vars
    (
      ?auto_898692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898691 ?auto_898692 ) ( ON-TABLE ?auto_898684 ) ( ON ?auto_898685 ?auto_898684 ) ( ON ?auto_898686 ?auto_898685 ) ( ON ?auto_898687 ?auto_898686 ) ( ON ?auto_898688 ?auto_898687 ) ( ON ?auto_898689 ?auto_898688 ) ( not ( = ?auto_898684 ?auto_898685 ) ) ( not ( = ?auto_898684 ?auto_898686 ) ) ( not ( = ?auto_898684 ?auto_898687 ) ) ( not ( = ?auto_898684 ?auto_898688 ) ) ( not ( = ?auto_898684 ?auto_898689 ) ) ( not ( = ?auto_898684 ?auto_898690 ) ) ( not ( = ?auto_898684 ?auto_898691 ) ) ( not ( = ?auto_898684 ?auto_898692 ) ) ( not ( = ?auto_898685 ?auto_898686 ) ) ( not ( = ?auto_898685 ?auto_898687 ) ) ( not ( = ?auto_898685 ?auto_898688 ) ) ( not ( = ?auto_898685 ?auto_898689 ) ) ( not ( = ?auto_898685 ?auto_898690 ) ) ( not ( = ?auto_898685 ?auto_898691 ) ) ( not ( = ?auto_898685 ?auto_898692 ) ) ( not ( = ?auto_898686 ?auto_898687 ) ) ( not ( = ?auto_898686 ?auto_898688 ) ) ( not ( = ?auto_898686 ?auto_898689 ) ) ( not ( = ?auto_898686 ?auto_898690 ) ) ( not ( = ?auto_898686 ?auto_898691 ) ) ( not ( = ?auto_898686 ?auto_898692 ) ) ( not ( = ?auto_898687 ?auto_898688 ) ) ( not ( = ?auto_898687 ?auto_898689 ) ) ( not ( = ?auto_898687 ?auto_898690 ) ) ( not ( = ?auto_898687 ?auto_898691 ) ) ( not ( = ?auto_898687 ?auto_898692 ) ) ( not ( = ?auto_898688 ?auto_898689 ) ) ( not ( = ?auto_898688 ?auto_898690 ) ) ( not ( = ?auto_898688 ?auto_898691 ) ) ( not ( = ?auto_898688 ?auto_898692 ) ) ( not ( = ?auto_898689 ?auto_898690 ) ) ( not ( = ?auto_898689 ?auto_898691 ) ) ( not ( = ?auto_898689 ?auto_898692 ) ) ( not ( = ?auto_898690 ?auto_898691 ) ) ( not ( = ?auto_898690 ?auto_898692 ) ) ( not ( = ?auto_898691 ?auto_898692 ) ) ( CLEAR ?auto_898689 ) ( ON ?auto_898690 ?auto_898691 ) ( CLEAR ?auto_898690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_898684 ?auto_898685 ?auto_898686 ?auto_898687 ?auto_898688 ?auto_898689 ?auto_898690 )
      ( MAKE-8PILE ?auto_898684 ?auto_898685 ?auto_898686 ?auto_898687 ?auto_898688 ?auto_898689 ?auto_898690 ?auto_898691 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_898718 - BLOCK
      ?auto_898719 - BLOCK
      ?auto_898720 - BLOCK
      ?auto_898721 - BLOCK
      ?auto_898722 - BLOCK
      ?auto_898723 - BLOCK
      ?auto_898724 - BLOCK
      ?auto_898725 - BLOCK
    )
    :vars
    (
      ?auto_898726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898725 ?auto_898726 ) ( ON-TABLE ?auto_898718 ) ( ON ?auto_898719 ?auto_898718 ) ( ON ?auto_898720 ?auto_898719 ) ( ON ?auto_898721 ?auto_898720 ) ( ON ?auto_898722 ?auto_898721 ) ( not ( = ?auto_898718 ?auto_898719 ) ) ( not ( = ?auto_898718 ?auto_898720 ) ) ( not ( = ?auto_898718 ?auto_898721 ) ) ( not ( = ?auto_898718 ?auto_898722 ) ) ( not ( = ?auto_898718 ?auto_898723 ) ) ( not ( = ?auto_898718 ?auto_898724 ) ) ( not ( = ?auto_898718 ?auto_898725 ) ) ( not ( = ?auto_898718 ?auto_898726 ) ) ( not ( = ?auto_898719 ?auto_898720 ) ) ( not ( = ?auto_898719 ?auto_898721 ) ) ( not ( = ?auto_898719 ?auto_898722 ) ) ( not ( = ?auto_898719 ?auto_898723 ) ) ( not ( = ?auto_898719 ?auto_898724 ) ) ( not ( = ?auto_898719 ?auto_898725 ) ) ( not ( = ?auto_898719 ?auto_898726 ) ) ( not ( = ?auto_898720 ?auto_898721 ) ) ( not ( = ?auto_898720 ?auto_898722 ) ) ( not ( = ?auto_898720 ?auto_898723 ) ) ( not ( = ?auto_898720 ?auto_898724 ) ) ( not ( = ?auto_898720 ?auto_898725 ) ) ( not ( = ?auto_898720 ?auto_898726 ) ) ( not ( = ?auto_898721 ?auto_898722 ) ) ( not ( = ?auto_898721 ?auto_898723 ) ) ( not ( = ?auto_898721 ?auto_898724 ) ) ( not ( = ?auto_898721 ?auto_898725 ) ) ( not ( = ?auto_898721 ?auto_898726 ) ) ( not ( = ?auto_898722 ?auto_898723 ) ) ( not ( = ?auto_898722 ?auto_898724 ) ) ( not ( = ?auto_898722 ?auto_898725 ) ) ( not ( = ?auto_898722 ?auto_898726 ) ) ( not ( = ?auto_898723 ?auto_898724 ) ) ( not ( = ?auto_898723 ?auto_898725 ) ) ( not ( = ?auto_898723 ?auto_898726 ) ) ( not ( = ?auto_898724 ?auto_898725 ) ) ( not ( = ?auto_898724 ?auto_898726 ) ) ( not ( = ?auto_898725 ?auto_898726 ) ) ( ON ?auto_898724 ?auto_898725 ) ( CLEAR ?auto_898722 ) ( ON ?auto_898723 ?auto_898724 ) ( CLEAR ?auto_898723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_898718 ?auto_898719 ?auto_898720 ?auto_898721 ?auto_898722 ?auto_898723 )
      ( MAKE-8PILE ?auto_898718 ?auto_898719 ?auto_898720 ?auto_898721 ?auto_898722 ?auto_898723 ?auto_898724 ?auto_898725 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_898752 - BLOCK
      ?auto_898753 - BLOCK
      ?auto_898754 - BLOCK
      ?auto_898755 - BLOCK
      ?auto_898756 - BLOCK
      ?auto_898757 - BLOCK
      ?auto_898758 - BLOCK
      ?auto_898759 - BLOCK
    )
    :vars
    (
      ?auto_898760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898759 ?auto_898760 ) ( ON-TABLE ?auto_898752 ) ( ON ?auto_898753 ?auto_898752 ) ( ON ?auto_898754 ?auto_898753 ) ( ON ?auto_898755 ?auto_898754 ) ( not ( = ?auto_898752 ?auto_898753 ) ) ( not ( = ?auto_898752 ?auto_898754 ) ) ( not ( = ?auto_898752 ?auto_898755 ) ) ( not ( = ?auto_898752 ?auto_898756 ) ) ( not ( = ?auto_898752 ?auto_898757 ) ) ( not ( = ?auto_898752 ?auto_898758 ) ) ( not ( = ?auto_898752 ?auto_898759 ) ) ( not ( = ?auto_898752 ?auto_898760 ) ) ( not ( = ?auto_898753 ?auto_898754 ) ) ( not ( = ?auto_898753 ?auto_898755 ) ) ( not ( = ?auto_898753 ?auto_898756 ) ) ( not ( = ?auto_898753 ?auto_898757 ) ) ( not ( = ?auto_898753 ?auto_898758 ) ) ( not ( = ?auto_898753 ?auto_898759 ) ) ( not ( = ?auto_898753 ?auto_898760 ) ) ( not ( = ?auto_898754 ?auto_898755 ) ) ( not ( = ?auto_898754 ?auto_898756 ) ) ( not ( = ?auto_898754 ?auto_898757 ) ) ( not ( = ?auto_898754 ?auto_898758 ) ) ( not ( = ?auto_898754 ?auto_898759 ) ) ( not ( = ?auto_898754 ?auto_898760 ) ) ( not ( = ?auto_898755 ?auto_898756 ) ) ( not ( = ?auto_898755 ?auto_898757 ) ) ( not ( = ?auto_898755 ?auto_898758 ) ) ( not ( = ?auto_898755 ?auto_898759 ) ) ( not ( = ?auto_898755 ?auto_898760 ) ) ( not ( = ?auto_898756 ?auto_898757 ) ) ( not ( = ?auto_898756 ?auto_898758 ) ) ( not ( = ?auto_898756 ?auto_898759 ) ) ( not ( = ?auto_898756 ?auto_898760 ) ) ( not ( = ?auto_898757 ?auto_898758 ) ) ( not ( = ?auto_898757 ?auto_898759 ) ) ( not ( = ?auto_898757 ?auto_898760 ) ) ( not ( = ?auto_898758 ?auto_898759 ) ) ( not ( = ?auto_898758 ?auto_898760 ) ) ( not ( = ?auto_898759 ?auto_898760 ) ) ( ON ?auto_898758 ?auto_898759 ) ( ON ?auto_898757 ?auto_898758 ) ( CLEAR ?auto_898755 ) ( ON ?auto_898756 ?auto_898757 ) ( CLEAR ?auto_898756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_898752 ?auto_898753 ?auto_898754 ?auto_898755 ?auto_898756 )
      ( MAKE-8PILE ?auto_898752 ?auto_898753 ?auto_898754 ?auto_898755 ?auto_898756 ?auto_898757 ?auto_898758 ?auto_898759 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_898786 - BLOCK
      ?auto_898787 - BLOCK
      ?auto_898788 - BLOCK
      ?auto_898789 - BLOCK
      ?auto_898790 - BLOCK
      ?auto_898791 - BLOCK
      ?auto_898792 - BLOCK
      ?auto_898793 - BLOCK
    )
    :vars
    (
      ?auto_898794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898793 ?auto_898794 ) ( ON-TABLE ?auto_898786 ) ( ON ?auto_898787 ?auto_898786 ) ( ON ?auto_898788 ?auto_898787 ) ( not ( = ?auto_898786 ?auto_898787 ) ) ( not ( = ?auto_898786 ?auto_898788 ) ) ( not ( = ?auto_898786 ?auto_898789 ) ) ( not ( = ?auto_898786 ?auto_898790 ) ) ( not ( = ?auto_898786 ?auto_898791 ) ) ( not ( = ?auto_898786 ?auto_898792 ) ) ( not ( = ?auto_898786 ?auto_898793 ) ) ( not ( = ?auto_898786 ?auto_898794 ) ) ( not ( = ?auto_898787 ?auto_898788 ) ) ( not ( = ?auto_898787 ?auto_898789 ) ) ( not ( = ?auto_898787 ?auto_898790 ) ) ( not ( = ?auto_898787 ?auto_898791 ) ) ( not ( = ?auto_898787 ?auto_898792 ) ) ( not ( = ?auto_898787 ?auto_898793 ) ) ( not ( = ?auto_898787 ?auto_898794 ) ) ( not ( = ?auto_898788 ?auto_898789 ) ) ( not ( = ?auto_898788 ?auto_898790 ) ) ( not ( = ?auto_898788 ?auto_898791 ) ) ( not ( = ?auto_898788 ?auto_898792 ) ) ( not ( = ?auto_898788 ?auto_898793 ) ) ( not ( = ?auto_898788 ?auto_898794 ) ) ( not ( = ?auto_898789 ?auto_898790 ) ) ( not ( = ?auto_898789 ?auto_898791 ) ) ( not ( = ?auto_898789 ?auto_898792 ) ) ( not ( = ?auto_898789 ?auto_898793 ) ) ( not ( = ?auto_898789 ?auto_898794 ) ) ( not ( = ?auto_898790 ?auto_898791 ) ) ( not ( = ?auto_898790 ?auto_898792 ) ) ( not ( = ?auto_898790 ?auto_898793 ) ) ( not ( = ?auto_898790 ?auto_898794 ) ) ( not ( = ?auto_898791 ?auto_898792 ) ) ( not ( = ?auto_898791 ?auto_898793 ) ) ( not ( = ?auto_898791 ?auto_898794 ) ) ( not ( = ?auto_898792 ?auto_898793 ) ) ( not ( = ?auto_898792 ?auto_898794 ) ) ( not ( = ?auto_898793 ?auto_898794 ) ) ( ON ?auto_898792 ?auto_898793 ) ( ON ?auto_898791 ?auto_898792 ) ( ON ?auto_898790 ?auto_898791 ) ( CLEAR ?auto_898788 ) ( ON ?auto_898789 ?auto_898790 ) ( CLEAR ?auto_898789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_898786 ?auto_898787 ?auto_898788 ?auto_898789 )
      ( MAKE-8PILE ?auto_898786 ?auto_898787 ?auto_898788 ?auto_898789 ?auto_898790 ?auto_898791 ?auto_898792 ?auto_898793 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_898820 - BLOCK
      ?auto_898821 - BLOCK
      ?auto_898822 - BLOCK
      ?auto_898823 - BLOCK
      ?auto_898824 - BLOCK
      ?auto_898825 - BLOCK
      ?auto_898826 - BLOCK
      ?auto_898827 - BLOCK
    )
    :vars
    (
      ?auto_898828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898827 ?auto_898828 ) ( ON-TABLE ?auto_898820 ) ( ON ?auto_898821 ?auto_898820 ) ( not ( = ?auto_898820 ?auto_898821 ) ) ( not ( = ?auto_898820 ?auto_898822 ) ) ( not ( = ?auto_898820 ?auto_898823 ) ) ( not ( = ?auto_898820 ?auto_898824 ) ) ( not ( = ?auto_898820 ?auto_898825 ) ) ( not ( = ?auto_898820 ?auto_898826 ) ) ( not ( = ?auto_898820 ?auto_898827 ) ) ( not ( = ?auto_898820 ?auto_898828 ) ) ( not ( = ?auto_898821 ?auto_898822 ) ) ( not ( = ?auto_898821 ?auto_898823 ) ) ( not ( = ?auto_898821 ?auto_898824 ) ) ( not ( = ?auto_898821 ?auto_898825 ) ) ( not ( = ?auto_898821 ?auto_898826 ) ) ( not ( = ?auto_898821 ?auto_898827 ) ) ( not ( = ?auto_898821 ?auto_898828 ) ) ( not ( = ?auto_898822 ?auto_898823 ) ) ( not ( = ?auto_898822 ?auto_898824 ) ) ( not ( = ?auto_898822 ?auto_898825 ) ) ( not ( = ?auto_898822 ?auto_898826 ) ) ( not ( = ?auto_898822 ?auto_898827 ) ) ( not ( = ?auto_898822 ?auto_898828 ) ) ( not ( = ?auto_898823 ?auto_898824 ) ) ( not ( = ?auto_898823 ?auto_898825 ) ) ( not ( = ?auto_898823 ?auto_898826 ) ) ( not ( = ?auto_898823 ?auto_898827 ) ) ( not ( = ?auto_898823 ?auto_898828 ) ) ( not ( = ?auto_898824 ?auto_898825 ) ) ( not ( = ?auto_898824 ?auto_898826 ) ) ( not ( = ?auto_898824 ?auto_898827 ) ) ( not ( = ?auto_898824 ?auto_898828 ) ) ( not ( = ?auto_898825 ?auto_898826 ) ) ( not ( = ?auto_898825 ?auto_898827 ) ) ( not ( = ?auto_898825 ?auto_898828 ) ) ( not ( = ?auto_898826 ?auto_898827 ) ) ( not ( = ?auto_898826 ?auto_898828 ) ) ( not ( = ?auto_898827 ?auto_898828 ) ) ( ON ?auto_898826 ?auto_898827 ) ( ON ?auto_898825 ?auto_898826 ) ( ON ?auto_898824 ?auto_898825 ) ( ON ?auto_898823 ?auto_898824 ) ( CLEAR ?auto_898821 ) ( ON ?auto_898822 ?auto_898823 ) ( CLEAR ?auto_898822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_898820 ?auto_898821 ?auto_898822 )
      ( MAKE-8PILE ?auto_898820 ?auto_898821 ?auto_898822 ?auto_898823 ?auto_898824 ?auto_898825 ?auto_898826 ?auto_898827 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_898854 - BLOCK
      ?auto_898855 - BLOCK
      ?auto_898856 - BLOCK
      ?auto_898857 - BLOCK
      ?auto_898858 - BLOCK
      ?auto_898859 - BLOCK
      ?auto_898860 - BLOCK
      ?auto_898861 - BLOCK
    )
    :vars
    (
      ?auto_898862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898861 ?auto_898862 ) ( ON-TABLE ?auto_898854 ) ( not ( = ?auto_898854 ?auto_898855 ) ) ( not ( = ?auto_898854 ?auto_898856 ) ) ( not ( = ?auto_898854 ?auto_898857 ) ) ( not ( = ?auto_898854 ?auto_898858 ) ) ( not ( = ?auto_898854 ?auto_898859 ) ) ( not ( = ?auto_898854 ?auto_898860 ) ) ( not ( = ?auto_898854 ?auto_898861 ) ) ( not ( = ?auto_898854 ?auto_898862 ) ) ( not ( = ?auto_898855 ?auto_898856 ) ) ( not ( = ?auto_898855 ?auto_898857 ) ) ( not ( = ?auto_898855 ?auto_898858 ) ) ( not ( = ?auto_898855 ?auto_898859 ) ) ( not ( = ?auto_898855 ?auto_898860 ) ) ( not ( = ?auto_898855 ?auto_898861 ) ) ( not ( = ?auto_898855 ?auto_898862 ) ) ( not ( = ?auto_898856 ?auto_898857 ) ) ( not ( = ?auto_898856 ?auto_898858 ) ) ( not ( = ?auto_898856 ?auto_898859 ) ) ( not ( = ?auto_898856 ?auto_898860 ) ) ( not ( = ?auto_898856 ?auto_898861 ) ) ( not ( = ?auto_898856 ?auto_898862 ) ) ( not ( = ?auto_898857 ?auto_898858 ) ) ( not ( = ?auto_898857 ?auto_898859 ) ) ( not ( = ?auto_898857 ?auto_898860 ) ) ( not ( = ?auto_898857 ?auto_898861 ) ) ( not ( = ?auto_898857 ?auto_898862 ) ) ( not ( = ?auto_898858 ?auto_898859 ) ) ( not ( = ?auto_898858 ?auto_898860 ) ) ( not ( = ?auto_898858 ?auto_898861 ) ) ( not ( = ?auto_898858 ?auto_898862 ) ) ( not ( = ?auto_898859 ?auto_898860 ) ) ( not ( = ?auto_898859 ?auto_898861 ) ) ( not ( = ?auto_898859 ?auto_898862 ) ) ( not ( = ?auto_898860 ?auto_898861 ) ) ( not ( = ?auto_898860 ?auto_898862 ) ) ( not ( = ?auto_898861 ?auto_898862 ) ) ( ON ?auto_898860 ?auto_898861 ) ( ON ?auto_898859 ?auto_898860 ) ( ON ?auto_898858 ?auto_898859 ) ( ON ?auto_898857 ?auto_898858 ) ( ON ?auto_898856 ?auto_898857 ) ( CLEAR ?auto_898854 ) ( ON ?auto_898855 ?auto_898856 ) ( CLEAR ?auto_898855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_898854 ?auto_898855 )
      ( MAKE-8PILE ?auto_898854 ?auto_898855 ?auto_898856 ?auto_898857 ?auto_898858 ?auto_898859 ?auto_898860 ?auto_898861 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_898888 - BLOCK
      ?auto_898889 - BLOCK
      ?auto_898890 - BLOCK
      ?auto_898891 - BLOCK
      ?auto_898892 - BLOCK
      ?auto_898893 - BLOCK
      ?auto_898894 - BLOCK
      ?auto_898895 - BLOCK
    )
    :vars
    (
      ?auto_898896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898895 ?auto_898896 ) ( not ( = ?auto_898888 ?auto_898889 ) ) ( not ( = ?auto_898888 ?auto_898890 ) ) ( not ( = ?auto_898888 ?auto_898891 ) ) ( not ( = ?auto_898888 ?auto_898892 ) ) ( not ( = ?auto_898888 ?auto_898893 ) ) ( not ( = ?auto_898888 ?auto_898894 ) ) ( not ( = ?auto_898888 ?auto_898895 ) ) ( not ( = ?auto_898888 ?auto_898896 ) ) ( not ( = ?auto_898889 ?auto_898890 ) ) ( not ( = ?auto_898889 ?auto_898891 ) ) ( not ( = ?auto_898889 ?auto_898892 ) ) ( not ( = ?auto_898889 ?auto_898893 ) ) ( not ( = ?auto_898889 ?auto_898894 ) ) ( not ( = ?auto_898889 ?auto_898895 ) ) ( not ( = ?auto_898889 ?auto_898896 ) ) ( not ( = ?auto_898890 ?auto_898891 ) ) ( not ( = ?auto_898890 ?auto_898892 ) ) ( not ( = ?auto_898890 ?auto_898893 ) ) ( not ( = ?auto_898890 ?auto_898894 ) ) ( not ( = ?auto_898890 ?auto_898895 ) ) ( not ( = ?auto_898890 ?auto_898896 ) ) ( not ( = ?auto_898891 ?auto_898892 ) ) ( not ( = ?auto_898891 ?auto_898893 ) ) ( not ( = ?auto_898891 ?auto_898894 ) ) ( not ( = ?auto_898891 ?auto_898895 ) ) ( not ( = ?auto_898891 ?auto_898896 ) ) ( not ( = ?auto_898892 ?auto_898893 ) ) ( not ( = ?auto_898892 ?auto_898894 ) ) ( not ( = ?auto_898892 ?auto_898895 ) ) ( not ( = ?auto_898892 ?auto_898896 ) ) ( not ( = ?auto_898893 ?auto_898894 ) ) ( not ( = ?auto_898893 ?auto_898895 ) ) ( not ( = ?auto_898893 ?auto_898896 ) ) ( not ( = ?auto_898894 ?auto_898895 ) ) ( not ( = ?auto_898894 ?auto_898896 ) ) ( not ( = ?auto_898895 ?auto_898896 ) ) ( ON ?auto_898894 ?auto_898895 ) ( ON ?auto_898893 ?auto_898894 ) ( ON ?auto_898892 ?auto_898893 ) ( ON ?auto_898891 ?auto_898892 ) ( ON ?auto_898890 ?auto_898891 ) ( ON ?auto_898889 ?auto_898890 ) ( ON ?auto_898888 ?auto_898889 ) ( CLEAR ?auto_898888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_898888 )
      ( MAKE-8PILE ?auto_898888 ?auto_898889 ?auto_898890 ?auto_898891 ?auto_898892 ?auto_898893 ?auto_898894 ?auto_898895 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_898923 - BLOCK
      ?auto_898924 - BLOCK
      ?auto_898925 - BLOCK
      ?auto_898926 - BLOCK
      ?auto_898927 - BLOCK
      ?auto_898928 - BLOCK
      ?auto_898929 - BLOCK
      ?auto_898930 - BLOCK
      ?auto_898931 - BLOCK
    )
    :vars
    (
      ?auto_898932 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_898930 ) ( ON ?auto_898931 ?auto_898932 ) ( CLEAR ?auto_898931 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_898923 ) ( ON ?auto_898924 ?auto_898923 ) ( ON ?auto_898925 ?auto_898924 ) ( ON ?auto_898926 ?auto_898925 ) ( ON ?auto_898927 ?auto_898926 ) ( ON ?auto_898928 ?auto_898927 ) ( ON ?auto_898929 ?auto_898928 ) ( ON ?auto_898930 ?auto_898929 ) ( not ( = ?auto_898923 ?auto_898924 ) ) ( not ( = ?auto_898923 ?auto_898925 ) ) ( not ( = ?auto_898923 ?auto_898926 ) ) ( not ( = ?auto_898923 ?auto_898927 ) ) ( not ( = ?auto_898923 ?auto_898928 ) ) ( not ( = ?auto_898923 ?auto_898929 ) ) ( not ( = ?auto_898923 ?auto_898930 ) ) ( not ( = ?auto_898923 ?auto_898931 ) ) ( not ( = ?auto_898923 ?auto_898932 ) ) ( not ( = ?auto_898924 ?auto_898925 ) ) ( not ( = ?auto_898924 ?auto_898926 ) ) ( not ( = ?auto_898924 ?auto_898927 ) ) ( not ( = ?auto_898924 ?auto_898928 ) ) ( not ( = ?auto_898924 ?auto_898929 ) ) ( not ( = ?auto_898924 ?auto_898930 ) ) ( not ( = ?auto_898924 ?auto_898931 ) ) ( not ( = ?auto_898924 ?auto_898932 ) ) ( not ( = ?auto_898925 ?auto_898926 ) ) ( not ( = ?auto_898925 ?auto_898927 ) ) ( not ( = ?auto_898925 ?auto_898928 ) ) ( not ( = ?auto_898925 ?auto_898929 ) ) ( not ( = ?auto_898925 ?auto_898930 ) ) ( not ( = ?auto_898925 ?auto_898931 ) ) ( not ( = ?auto_898925 ?auto_898932 ) ) ( not ( = ?auto_898926 ?auto_898927 ) ) ( not ( = ?auto_898926 ?auto_898928 ) ) ( not ( = ?auto_898926 ?auto_898929 ) ) ( not ( = ?auto_898926 ?auto_898930 ) ) ( not ( = ?auto_898926 ?auto_898931 ) ) ( not ( = ?auto_898926 ?auto_898932 ) ) ( not ( = ?auto_898927 ?auto_898928 ) ) ( not ( = ?auto_898927 ?auto_898929 ) ) ( not ( = ?auto_898927 ?auto_898930 ) ) ( not ( = ?auto_898927 ?auto_898931 ) ) ( not ( = ?auto_898927 ?auto_898932 ) ) ( not ( = ?auto_898928 ?auto_898929 ) ) ( not ( = ?auto_898928 ?auto_898930 ) ) ( not ( = ?auto_898928 ?auto_898931 ) ) ( not ( = ?auto_898928 ?auto_898932 ) ) ( not ( = ?auto_898929 ?auto_898930 ) ) ( not ( = ?auto_898929 ?auto_898931 ) ) ( not ( = ?auto_898929 ?auto_898932 ) ) ( not ( = ?auto_898930 ?auto_898931 ) ) ( not ( = ?auto_898930 ?auto_898932 ) ) ( not ( = ?auto_898931 ?auto_898932 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_898931 ?auto_898932 )
      ( !STACK ?auto_898931 ?auto_898930 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_898961 - BLOCK
      ?auto_898962 - BLOCK
      ?auto_898963 - BLOCK
      ?auto_898964 - BLOCK
      ?auto_898965 - BLOCK
      ?auto_898966 - BLOCK
      ?auto_898967 - BLOCK
      ?auto_898968 - BLOCK
      ?auto_898969 - BLOCK
    )
    :vars
    (
      ?auto_898970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_898969 ?auto_898970 ) ( ON-TABLE ?auto_898961 ) ( ON ?auto_898962 ?auto_898961 ) ( ON ?auto_898963 ?auto_898962 ) ( ON ?auto_898964 ?auto_898963 ) ( ON ?auto_898965 ?auto_898964 ) ( ON ?auto_898966 ?auto_898965 ) ( ON ?auto_898967 ?auto_898966 ) ( not ( = ?auto_898961 ?auto_898962 ) ) ( not ( = ?auto_898961 ?auto_898963 ) ) ( not ( = ?auto_898961 ?auto_898964 ) ) ( not ( = ?auto_898961 ?auto_898965 ) ) ( not ( = ?auto_898961 ?auto_898966 ) ) ( not ( = ?auto_898961 ?auto_898967 ) ) ( not ( = ?auto_898961 ?auto_898968 ) ) ( not ( = ?auto_898961 ?auto_898969 ) ) ( not ( = ?auto_898961 ?auto_898970 ) ) ( not ( = ?auto_898962 ?auto_898963 ) ) ( not ( = ?auto_898962 ?auto_898964 ) ) ( not ( = ?auto_898962 ?auto_898965 ) ) ( not ( = ?auto_898962 ?auto_898966 ) ) ( not ( = ?auto_898962 ?auto_898967 ) ) ( not ( = ?auto_898962 ?auto_898968 ) ) ( not ( = ?auto_898962 ?auto_898969 ) ) ( not ( = ?auto_898962 ?auto_898970 ) ) ( not ( = ?auto_898963 ?auto_898964 ) ) ( not ( = ?auto_898963 ?auto_898965 ) ) ( not ( = ?auto_898963 ?auto_898966 ) ) ( not ( = ?auto_898963 ?auto_898967 ) ) ( not ( = ?auto_898963 ?auto_898968 ) ) ( not ( = ?auto_898963 ?auto_898969 ) ) ( not ( = ?auto_898963 ?auto_898970 ) ) ( not ( = ?auto_898964 ?auto_898965 ) ) ( not ( = ?auto_898964 ?auto_898966 ) ) ( not ( = ?auto_898964 ?auto_898967 ) ) ( not ( = ?auto_898964 ?auto_898968 ) ) ( not ( = ?auto_898964 ?auto_898969 ) ) ( not ( = ?auto_898964 ?auto_898970 ) ) ( not ( = ?auto_898965 ?auto_898966 ) ) ( not ( = ?auto_898965 ?auto_898967 ) ) ( not ( = ?auto_898965 ?auto_898968 ) ) ( not ( = ?auto_898965 ?auto_898969 ) ) ( not ( = ?auto_898965 ?auto_898970 ) ) ( not ( = ?auto_898966 ?auto_898967 ) ) ( not ( = ?auto_898966 ?auto_898968 ) ) ( not ( = ?auto_898966 ?auto_898969 ) ) ( not ( = ?auto_898966 ?auto_898970 ) ) ( not ( = ?auto_898967 ?auto_898968 ) ) ( not ( = ?auto_898967 ?auto_898969 ) ) ( not ( = ?auto_898967 ?auto_898970 ) ) ( not ( = ?auto_898968 ?auto_898969 ) ) ( not ( = ?auto_898968 ?auto_898970 ) ) ( not ( = ?auto_898969 ?auto_898970 ) ) ( CLEAR ?auto_898967 ) ( ON ?auto_898968 ?auto_898969 ) ( CLEAR ?auto_898968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_898961 ?auto_898962 ?auto_898963 ?auto_898964 ?auto_898965 ?auto_898966 ?auto_898967 ?auto_898968 )
      ( MAKE-9PILE ?auto_898961 ?auto_898962 ?auto_898963 ?auto_898964 ?auto_898965 ?auto_898966 ?auto_898967 ?auto_898968 ?auto_898969 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_898999 - BLOCK
      ?auto_899000 - BLOCK
      ?auto_899001 - BLOCK
      ?auto_899002 - BLOCK
      ?auto_899003 - BLOCK
      ?auto_899004 - BLOCK
      ?auto_899005 - BLOCK
      ?auto_899006 - BLOCK
      ?auto_899007 - BLOCK
    )
    :vars
    (
      ?auto_899008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899007 ?auto_899008 ) ( ON-TABLE ?auto_898999 ) ( ON ?auto_899000 ?auto_898999 ) ( ON ?auto_899001 ?auto_899000 ) ( ON ?auto_899002 ?auto_899001 ) ( ON ?auto_899003 ?auto_899002 ) ( ON ?auto_899004 ?auto_899003 ) ( not ( = ?auto_898999 ?auto_899000 ) ) ( not ( = ?auto_898999 ?auto_899001 ) ) ( not ( = ?auto_898999 ?auto_899002 ) ) ( not ( = ?auto_898999 ?auto_899003 ) ) ( not ( = ?auto_898999 ?auto_899004 ) ) ( not ( = ?auto_898999 ?auto_899005 ) ) ( not ( = ?auto_898999 ?auto_899006 ) ) ( not ( = ?auto_898999 ?auto_899007 ) ) ( not ( = ?auto_898999 ?auto_899008 ) ) ( not ( = ?auto_899000 ?auto_899001 ) ) ( not ( = ?auto_899000 ?auto_899002 ) ) ( not ( = ?auto_899000 ?auto_899003 ) ) ( not ( = ?auto_899000 ?auto_899004 ) ) ( not ( = ?auto_899000 ?auto_899005 ) ) ( not ( = ?auto_899000 ?auto_899006 ) ) ( not ( = ?auto_899000 ?auto_899007 ) ) ( not ( = ?auto_899000 ?auto_899008 ) ) ( not ( = ?auto_899001 ?auto_899002 ) ) ( not ( = ?auto_899001 ?auto_899003 ) ) ( not ( = ?auto_899001 ?auto_899004 ) ) ( not ( = ?auto_899001 ?auto_899005 ) ) ( not ( = ?auto_899001 ?auto_899006 ) ) ( not ( = ?auto_899001 ?auto_899007 ) ) ( not ( = ?auto_899001 ?auto_899008 ) ) ( not ( = ?auto_899002 ?auto_899003 ) ) ( not ( = ?auto_899002 ?auto_899004 ) ) ( not ( = ?auto_899002 ?auto_899005 ) ) ( not ( = ?auto_899002 ?auto_899006 ) ) ( not ( = ?auto_899002 ?auto_899007 ) ) ( not ( = ?auto_899002 ?auto_899008 ) ) ( not ( = ?auto_899003 ?auto_899004 ) ) ( not ( = ?auto_899003 ?auto_899005 ) ) ( not ( = ?auto_899003 ?auto_899006 ) ) ( not ( = ?auto_899003 ?auto_899007 ) ) ( not ( = ?auto_899003 ?auto_899008 ) ) ( not ( = ?auto_899004 ?auto_899005 ) ) ( not ( = ?auto_899004 ?auto_899006 ) ) ( not ( = ?auto_899004 ?auto_899007 ) ) ( not ( = ?auto_899004 ?auto_899008 ) ) ( not ( = ?auto_899005 ?auto_899006 ) ) ( not ( = ?auto_899005 ?auto_899007 ) ) ( not ( = ?auto_899005 ?auto_899008 ) ) ( not ( = ?auto_899006 ?auto_899007 ) ) ( not ( = ?auto_899006 ?auto_899008 ) ) ( not ( = ?auto_899007 ?auto_899008 ) ) ( ON ?auto_899006 ?auto_899007 ) ( CLEAR ?auto_899004 ) ( ON ?auto_899005 ?auto_899006 ) ( CLEAR ?auto_899005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_898999 ?auto_899000 ?auto_899001 ?auto_899002 ?auto_899003 ?auto_899004 ?auto_899005 )
      ( MAKE-9PILE ?auto_898999 ?auto_899000 ?auto_899001 ?auto_899002 ?auto_899003 ?auto_899004 ?auto_899005 ?auto_899006 ?auto_899007 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_899037 - BLOCK
      ?auto_899038 - BLOCK
      ?auto_899039 - BLOCK
      ?auto_899040 - BLOCK
      ?auto_899041 - BLOCK
      ?auto_899042 - BLOCK
      ?auto_899043 - BLOCK
      ?auto_899044 - BLOCK
      ?auto_899045 - BLOCK
    )
    :vars
    (
      ?auto_899046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899045 ?auto_899046 ) ( ON-TABLE ?auto_899037 ) ( ON ?auto_899038 ?auto_899037 ) ( ON ?auto_899039 ?auto_899038 ) ( ON ?auto_899040 ?auto_899039 ) ( ON ?auto_899041 ?auto_899040 ) ( not ( = ?auto_899037 ?auto_899038 ) ) ( not ( = ?auto_899037 ?auto_899039 ) ) ( not ( = ?auto_899037 ?auto_899040 ) ) ( not ( = ?auto_899037 ?auto_899041 ) ) ( not ( = ?auto_899037 ?auto_899042 ) ) ( not ( = ?auto_899037 ?auto_899043 ) ) ( not ( = ?auto_899037 ?auto_899044 ) ) ( not ( = ?auto_899037 ?auto_899045 ) ) ( not ( = ?auto_899037 ?auto_899046 ) ) ( not ( = ?auto_899038 ?auto_899039 ) ) ( not ( = ?auto_899038 ?auto_899040 ) ) ( not ( = ?auto_899038 ?auto_899041 ) ) ( not ( = ?auto_899038 ?auto_899042 ) ) ( not ( = ?auto_899038 ?auto_899043 ) ) ( not ( = ?auto_899038 ?auto_899044 ) ) ( not ( = ?auto_899038 ?auto_899045 ) ) ( not ( = ?auto_899038 ?auto_899046 ) ) ( not ( = ?auto_899039 ?auto_899040 ) ) ( not ( = ?auto_899039 ?auto_899041 ) ) ( not ( = ?auto_899039 ?auto_899042 ) ) ( not ( = ?auto_899039 ?auto_899043 ) ) ( not ( = ?auto_899039 ?auto_899044 ) ) ( not ( = ?auto_899039 ?auto_899045 ) ) ( not ( = ?auto_899039 ?auto_899046 ) ) ( not ( = ?auto_899040 ?auto_899041 ) ) ( not ( = ?auto_899040 ?auto_899042 ) ) ( not ( = ?auto_899040 ?auto_899043 ) ) ( not ( = ?auto_899040 ?auto_899044 ) ) ( not ( = ?auto_899040 ?auto_899045 ) ) ( not ( = ?auto_899040 ?auto_899046 ) ) ( not ( = ?auto_899041 ?auto_899042 ) ) ( not ( = ?auto_899041 ?auto_899043 ) ) ( not ( = ?auto_899041 ?auto_899044 ) ) ( not ( = ?auto_899041 ?auto_899045 ) ) ( not ( = ?auto_899041 ?auto_899046 ) ) ( not ( = ?auto_899042 ?auto_899043 ) ) ( not ( = ?auto_899042 ?auto_899044 ) ) ( not ( = ?auto_899042 ?auto_899045 ) ) ( not ( = ?auto_899042 ?auto_899046 ) ) ( not ( = ?auto_899043 ?auto_899044 ) ) ( not ( = ?auto_899043 ?auto_899045 ) ) ( not ( = ?auto_899043 ?auto_899046 ) ) ( not ( = ?auto_899044 ?auto_899045 ) ) ( not ( = ?auto_899044 ?auto_899046 ) ) ( not ( = ?auto_899045 ?auto_899046 ) ) ( ON ?auto_899044 ?auto_899045 ) ( ON ?auto_899043 ?auto_899044 ) ( CLEAR ?auto_899041 ) ( ON ?auto_899042 ?auto_899043 ) ( CLEAR ?auto_899042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_899037 ?auto_899038 ?auto_899039 ?auto_899040 ?auto_899041 ?auto_899042 )
      ( MAKE-9PILE ?auto_899037 ?auto_899038 ?auto_899039 ?auto_899040 ?auto_899041 ?auto_899042 ?auto_899043 ?auto_899044 ?auto_899045 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_899075 - BLOCK
      ?auto_899076 - BLOCK
      ?auto_899077 - BLOCK
      ?auto_899078 - BLOCK
      ?auto_899079 - BLOCK
      ?auto_899080 - BLOCK
      ?auto_899081 - BLOCK
      ?auto_899082 - BLOCK
      ?auto_899083 - BLOCK
    )
    :vars
    (
      ?auto_899084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899083 ?auto_899084 ) ( ON-TABLE ?auto_899075 ) ( ON ?auto_899076 ?auto_899075 ) ( ON ?auto_899077 ?auto_899076 ) ( ON ?auto_899078 ?auto_899077 ) ( not ( = ?auto_899075 ?auto_899076 ) ) ( not ( = ?auto_899075 ?auto_899077 ) ) ( not ( = ?auto_899075 ?auto_899078 ) ) ( not ( = ?auto_899075 ?auto_899079 ) ) ( not ( = ?auto_899075 ?auto_899080 ) ) ( not ( = ?auto_899075 ?auto_899081 ) ) ( not ( = ?auto_899075 ?auto_899082 ) ) ( not ( = ?auto_899075 ?auto_899083 ) ) ( not ( = ?auto_899075 ?auto_899084 ) ) ( not ( = ?auto_899076 ?auto_899077 ) ) ( not ( = ?auto_899076 ?auto_899078 ) ) ( not ( = ?auto_899076 ?auto_899079 ) ) ( not ( = ?auto_899076 ?auto_899080 ) ) ( not ( = ?auto_899076 ?auto_899081 ) ) ( not ( = ?auto_899076 ?auto_899082 ) ) ( not ( = ?auto_899076 ?auto_899083 ) ) ( not ( = ?auto_899076 ?auto_899084 ) ) ( not ( = ?auto_899077 ?auto_899078 ) ) ( not ( = ?auto_899077 ?auto_899079 ) ) ( not ( = ?auto_899077 ?auto_899080 ) ) ( not ( = ?auto_899077 ?auto_899081 ) ) ( not ( = ?auto_899077 ?auto_899082 ) ) ( not ( = ?auto_899077 ?auto_899083 ) ) ( not ( = ?auto_899077 ?auto_899084 ) ) ( not ( = ?auto_899078 ?auto_899079 ) ) ( not ( = ?auto_899078 ?auto_899080 ) ) ( not ( = ?auto_899078 ?auto_899081 ) ) ( not ( = ?auto_899078 ?auto_899082 ) ) ( not ( = ?auto_899078 ?auto_899083 ) ) ( not ( = ?auto_899078 ?auto_899084 ) ) ( not ( = ?auto_899079 ?auto_899080 ) ) ( not ( = ?auto_899079 ?auto_899081 ) ) ( not ( = ?auto_899079 ?auto_899082 ) ) ( not ( = ?auto_899079 ?auto_899083 ) ) ( not ( = ?auto_899079 ?auto_899084 ) ) ( not ( = ?auto_899080 ?auto_899081 ) ) ( not ( = ?auto_899080 ?auto_899082 ) ) ( not ( = ?auto_899080 ?auto_899083 ) ) ( not ( = ?auto_899080 ?auto_899084 ) ) ( not ( = ?auto_899081 ?auto_899082 ) ) ( not ( = ?auto_899081 ?auto_899083 ) ) ( not ( = ?auto_899081 ?auto_899084 ) ) ( not ( = ?auto_899082 ?auto_899083 ) ) ( not ( = ?auto_899082 ?auto_899084 ) ) ( not ( = ?auto_899083 ?auto_899084 ) ) ( ON ?auto_899082 ?auto_899083 ) ( ON ?auto_899081 ?auto_899082 ) ( ON ?auto_899080 ?auto_899081 ) ( CLEAR ?auto_899078 ) ( ON ?auto_899079 ?auto_899080 ) ( CLEAR ?auto_899079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_899075 ?auto_899076 ?auto_899077 ?auto_899078 ?auto_899079 )
      ( MAKE-9PILE ?auto_899075 ?auto_899076 ?auto_899077 ?auto_899078 ?auto_899079 ?auto_899080 ?auto_899081 ?auto_899082 ?auto_899083 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_899113 - BLOCK
      ?auto_899114 - BLOCK
      ?auto_899115 - BLOCK
      ?auto_899116 - BLOCK
      ?auto_899117 - BLOCK
      ?auto_899118 - BLOCK
      ?auto_899119 - BLOCK
      ?auto_899120 - BLOCK
      ?auto_899121 - BLOCK
    )
    :vars
    (
      ?auto_899122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899121 ?auto_899122 ) ( ON-TABLE ?auto_899113 ) ( ON ?auto_899114 ?auto_899113 ) ( ON ?auto_899115 ?auto_899114 ) ( not ( = ?auto_899113 ?auto_899114 ) ) ( not ( = ?auto_899113 ?auto_899115 ) ) ( not ( = ?auto_899113 ?auto_899116 ) ) ( not ( = ?auto_899113 ?auto_899117 ) ) ( not ( = ?auto_899113 ?auto_899118 ) ) ( not ( = ?auto_899113 ?auto_899119 ) ) ( not ( = ?auto_899113 ?auto_899120 ) ) ( not ( = ?auto_899113 ?auto_899121 ) ) ( not ( = ?auto_899113 ?auto_899122 ) ) ( not ( = ?auto_899114 ?auto_899115 ) ) ( not ( = ?auto_899114 ?auto_899116 ) ) ( not ( = ?auto_899114 ?auto_899117 ) ) ( not ( = ?auto_899114 ?auto_899118 ) ) ( not ( = ?auto_899114 ?auto_899119 ) ) ( not ( = ?auto_899114 ?auto_899120 ) ) ( not ( = ?auto_899114 ?auto_899121 ) ) ( not ( = ?auto_899114 ?auto_899122 ) ) ( not ( = ?auto_899115 ?auto_899116 ) ) ( not ( = ?auto_899115 ?auto_899117 ) ) ( not ( = ?auto_899115 ?auto_899118 ) ) ( not ( = ?auto_899115 ?auto_899119 ) ) ( not ( = ?auto_899115 ?auto_899120 ) ) ( not ( = ?auto_899115 ?auto_899121 ) ) ( not ( = ?auto_899115 ?auto_899122 ) ) ( not ( = ?auto_899116 ?auto_899117 ) ) ( not ( = ?auto_899116 ?auto_899118 ) ) ( not ( = ?auto_899116 ?auto_899119 ) ) ( not ( = ?auto_899116 ?auto_899120 ) ) ( not ( = ?auto_899116 ?auto_899121 ) ) ( not ( = ?auto_899116 ?auto_899122 ) ) ( not ( = ?auto_899117 ?auto_899118 ) ) ( not ( = ?auto_899117 ?auto_899119 ) ) ( not ( = ?auto_899117 ?auto_899120 ) ) ( not ( = ?auto_899117 ?auto_899121 ) ) ( not ( = ?auto_899117 ?auto_899122 ) ) ( not ( = ?auto_899118 ?auto_899119 ) ) ( not ( = ?auto_899118 ?auto_899120 ) ) ( not ( = ?auto_899118 ?auto_899121 ) ) ( not ( = ?auto_899118 ?auto_899122 ) ) ( not ( = ?auto_899119 ?auto_899120 ) ) ( not ( = ?auto_899119 ?auto_899121 ) ) ( not ( = ?auto_899119 ?auto_899122 ) ) ( not ( = ?auto_899120 ?auto_899121 ) ) ( not ( = ?auto_899120 ?auto_899122 ) ) ( not ( = ?auto_899121 ?auto_899122 ) ) ( ON ?auto_899120 ?auto_899121 ) ( ON ?auto_899119 ?auto_899120 ) ( ON ?auto_899118 ?auto_899119 ) ( ON ?auto_899117 ?auto_899118 ) ( CLEAR ?auto_899115 ) ( ON ?auto_899116 ?auto_899117 ) ( CLEAR ?auto_899116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_899113 ?auto_899114 ?auto_899115 ?auto_899116 )
      ( MAKE-9PILE ?auto_899113 ?auto_899114 ?auto_899115 ?auto_899116 ?auto_899117 ?auto_899118 ?auto_899119 ?auto_899120 ?auto_899121 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_899151 - BLOCK
      ?auto_899152 - BLOCK
      ?auto_899153 - BLOCK
      ?auto_899154 - BLOCK
      ?auto_899155 - BLOCK
      ?auto_899156 - BLOCK
      ?auto_899157 - BLOCK
      ?auto_899158 - BLOCK
      ?auto_899159 - BLOCK
    )
    :vars
    (
      ?auto_899160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899159 ?auto_899160 ) ( ON-TABLE ?auto_899151 ) ( ON ?auto_899152 ?auto_899151 ) ( not ( = ?auto_899151 ?auto_899152 ) ) ( not ( = ?auto_899151 ?auto_899153 ) ) ( not ( = ?auto_899151 ?auto_899154 ) ) ( not ( = ?auto_899151 ?auto_899155 ) ) ( not ( = ?auto_899151 ?auto_899156 ) ) ( not ( = ?auto_899151 ?auto_899157 ) ) ( not ( = ?auto_899151 ?auto_899158 ) ) ( not ( = ?auto_899151 ?auto_899159 ) ) ( not ( = ?auto_899151 ?auto_899160 ) ) ( not ( = ?auto_899152 ?auto_899153 ) ) ( not ( = ?auto_899152 ?auto_899154 ) ) ( not ( = ?auto_899152 ?auto_899155 ) ) ( not ( = ?auto_899152 ?auto_899156 ) ) ( not ( = ?auto_899152 ?auto_899157 ) ) ( not ( = ?auto_899152 ?auto_899158 ) ) ( not ( = ?auto_899152 ?auto_899159 ) ) ( not ( = ?auto_899152 ?auto_899160 ) ) ( not ( = ?auto_899153 ?auto_899154 ) ) ( not ( = ?auto_899153 ?auto_899155 ) ) ( not ( = ?auto_899153 ?auto_899156 ) ) ( not ( = ?auto_899153 ?auto_899157 ) ) ( not ( = ?auto_899153 ?auto_899158 ) ) ( not ( = ?auto_899153 ?auto_899159 ) ) ( not ( = ?auto_899153 ?auto_899160 ) ) ( not ( = ?auto_899154 ?auto_899155 ) ) ( not ( = ?auto_899154 ?auto_899156 ) ) ( not ( = ?auto_899154 ?auto_899157 ) ) ( not ( = ?auto_899154 ?auto_899158 ) ) ( not ( = ?auto_899154 ?auto_899159 ) ) ( not ( = ?auto_899154 ?auto_899160 ) ) ( not ( = ?auto_899155 ?auto_899156 ) ) ( not ( = ?auto_899155 ?auto_899157 ) ) ( not ( = ?auto_899155 ?auto_899158 ) ) ( not ( = ?auto_899155 ?auto_899159 ) ) ( not ( = ?auto_899155 ?auto_899160 ) ) ( not ( = ?auto_899156 ?auto_899157 ) ) ( not ( = ?auto_899156 ?auto_899158 ) ) ( not ( = ?auto_899156 ?auto_899159 ) ) ( not ( = ?auto_899156 ?auto_899160 ) ) ( not ( = ?auto_899157 ?auto_899158 ) ) ( not ( = ?auto_899157 ?auto_899159 ) ) ( not ( = ?auto_899157 ?auto_899160 ) ) ( not ( = ?auto_899158 ?auto_899159 ) ) ( not ( = ?auto_899158 ?auto_899160 ) ) ( not ( = ?auto_899159 ?auto_899160 ) ) ( ON ?auto_899158 ?auto_899159 ) ( ON ?auto_899157 ?auto_899158 ) ( ON ?auto_899156 ?auto_899157 ) ( ON ?auto_899155 ?auto_899156 ) ( ON ?auto_899154 ?auto_899155 ) ( CLEAR ?auto_899152 ) ( ON ?auto_899153 ?auto_899154 ) ( CLEAR ?auto_899153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_899151 ?auto_899152 ?auto_899153 )
      ( MAKE-9PILE ?auto_899151 ?auto_899152 ?auto_899153 ?auto_899154 ?auto_899155 ?auto_899156 ?auto_899157 ?auto_899158 ?auto_899159 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_899189 - BLOCK
      ?auto_899190 - BLOCK
      ?auto_899191 - BLOCK
      ?auto_899192 - BLOCK
      ?auto_899193 - BLOCK
      ?auto_899194 - BLOCK
      ?auto_899195 - BLOCK
      ?auto_899196 - BLOCK
      ?auto_899197 - BLOCK
    )
    :vars
    (
      ?auto_899198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899197 ?auto_899198 ) ( ON-TABLE ?auto_899189 ) ( not ( = ?auto_899189 ?auto_899190 ) ) ( not ( = ?auto_899189 ?auto_899191 ) ) ( not ( = ?auto_899189 ?auto_899192 ) ) ( not ( = ?auto_899189 ?auto_899193 ) ) ( not ( = ?auto_899189 ?auto_899194 ) ) ( not ( = ?auto_899189 ?auto_899195 ) ) ( not ( = ?auto_899189 ?auto_899196 ) ) ( not ( = ?auto_899189 ?auto_899197 ) ) ( not ( = ?auto_899189 ?auto_899198 ) ) ( not ( = ?auto_899190 ?auto_899191 ) ) ( not ( = ?auto_899190 ?auto_899192 ) ) ( not ( = ?auto_899190 ?auto_899193 ) ) ( not ( = ?auto_899190 ?auto_899194 ) ) ( not ( = ?auto_899190 ?auto_899195 ) ) ( not ( = ?auto_899190 ?auto_899196 ) ) ( not ( = ?auto_899190 ?auto_899197 ) ) ( not ( = ?auto_899190 ?auto_899198 ) ) ( not ( = ?auto_899191 ?auto_899192 ) ) ( not ( = ?auto_899191 ?auto_899193 ) ) ( not ( = ?auto_899191 ?auto_899194 ) ) ( not ( = ?auto_899191 ?auto_899195 ) ) ( not ( = ?auto_899191 ?auto_899196 ) ) ( not ( = ?auto_899191 ?auto_899197 ) ) ( not ( = ?auto_899191 ?auto_899198 ) ) ( not ( = ?auto_899192 ?auto_899193 ) ) ( not ( = ?auto_899192 ?auto_899194 ) ) ( not ( = ?auto_899192 ?auto_899195 ) ) ( not ( = ?auto_899192 ?auto_899196 ) ) ( not ( = ?auto_899192 ?auto_899197 ) ) ( not ( = ?auto_899192 ?auto_899198 ) ) ( not ( = ?auto_899193 ?auto_899194 ) ) ( not ( = ?auto_899193 ?auto_899195 ) ) ( not ( = ?auto_899193 ?auto_899196 ) ) ( not ( = ?auto_899193 ?auto_899197 ) ) ( not ( = ?auto_899193 ?auto_899198 ) ) ( not ( = ?auto_899194 ?auto_899195 ) ) ( not ( = ?auto_899194 ?auto_899196 ) ) ( not ( = ?auto_899194 ?auto_899197 ) ) ( not ( = ?auto_899194 ?auto_899198 ) ) ( not ( = ?auto_899195 ?auto_899196 ) ) ( not ( = ?auto_899195 ?auto_899197 ) ) ( not ( = ?auto_899195 ?auto_899198 ) ) ( not ( = ?auto_899196 ?auto_899197 ) ) ( not ( = ?auto_899196 ?auto_899198 ) ) ( not ( = ?auto_899197 ?auto_899198 ) ) ( ON ?auto_899196 ?auto_899197 ) ( ON ?auto_899195 ?auto_899196 ) ( ON ?auto_899194 ?auto_899195 ) ( ON ?auto_899193 ?auto_899194 ) ( ON ?auto_899192 ?auto_899193 ) ( ON ?auto_899191 ?auto_899192 ) ( CLEAR ?auto_899189 ) ( ON ?auto_899190 ?auto_899191 ) ( CLEAR ?auto_899190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_899189 ?auto_899190 )
      ( MAKE-9PILE ?auto_899189 ?auto_899190 ?auto_899191 ?auto_899192 ?auto_899193 ?auto_899194 ?auto_899195 ?auto_899196 ?auto_899197 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_899227 - BLOCK
      ?auto_899228 - BLOCK
      ?auto_899229 - BLOCK
      ?auto_899230 - BLOCK
      ?auto_899231 - BLOCK
      ?auto_899232 - BLOCK
      ?auto_899233 - BLOCK
      ?auto_899234 - BLOCK
      ?auto_899235 - BLOCK
    )
    :vars
    (
      ?auto_899236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899235 ?auto_899236 ) ( not ( = ?auto_899227 ?auto_899228 ) ) ( not ( = ?auto_899227 ?auto_899229 ) ) ( not ( = ?auto_899227 ?auto_899230 ) ) ( not ( = ?auto_899227 ?auto_899231 ) ) ( not ( = ?auto_899227 ?auto_899232 ) ) ( not ( = ?auto_899227 ?auto_899233 ) ) ( not ( = ?auto_899227 ?auto_899234 ) ) ( not ( = ?auto_899227 ?auto_899235 ) ) ( not ( = ?auto_899227 ?auto_899236 ) ) ( not ( = ?auto_899228 ?auto_899229 ) ) ( not ( = ?auto_899228 ?auto_899230 ) ) ( not ( = ?auto_899228 ?auto_899231 ) ) ( not ( = ?auto_899228 ?auto_899232 ) ) ( not ( = ?auto_899228 ?auto_899233 ) ) ( not ( = ?auto_899228 ?auto_899234 ) ) ( not ( = ?auto_899228 ?auto_899235 ) ) ( not ( = ?auto_899228 ?auto_899236 ) ) ( not ( = ?auto_899229 ?auto_899230 ) ) ( not ( = ?auto_899229 ?auto_899231 ) ) ( not ( = ?auto_899229 ?auto_899232 ) ) ( not ( = ?auto_899229 ?auto_899233 ) ) ( not ( = ?auto_899229 ?auto_899234 ) ) ( not ( = ?auto_899229 ?auto_899235 ) ) ( not ( = ?auto_899229 ?auto_899236 ) ) ( not ( = ?auto_899230 ?auto_899231 ) ) ( not ( = ?auto_899230 ?auto_899232 ) ) ( not ( = ?auto_899230 ?auto_899233 ) ) ( not ( = ?auto_899230 ?auto_899234 ) ) ( not ( = ?auto_899230 ?auto_899235 ) ) ( not ( = ?auto_899230 ?auto_899236 ) ) ( not ( = ?auto_899231 ?auto_899232 ) ) ( not ( = ?auto_899231 ?auto_899233 ) ) ( not ( = ?auto_899231 ?auto_899234 ) ) ( not ( = ?auto_899231 ?auto_899235 ) ) ( not ( = ?auto_899231 ?auto_899236 ) ) ( not ( = ?auto_899232 ?auto_899233 ) ) ( not ( = ?auto_899232 ?auto_899234 ) ) ( not ( = ?auto_899232 ?auto_899235 ) ) ( not ( = ?auto_899232 ?auto_899236 ) ) ( not ( = ?auto_899233 ?auto_899234 ) ) ( not ( = ?auto_899233 ?auto_899235 ) ) ( not ( = ?auto_899233 ?auto_899236 ) ) ( not ( = ?auto_899234 ?auto_899235 ) ) ( not ( = ?auto_899234 ?auto_899236 ) ) ( not ( = ?auto_899235 ?auto_899236 ) ) ( ON ?auto_899234 ?auto_899235 ) ( ON ?auto_899233 ?auto_899234 ) ( ON ?auto_899232 ?auto_899233 ) ( ON ?auto_899231 ?auto_899232 ) ( ON ?auto_899230 ?auto_899231 ) ( ON ?auto_899229 ?auto_899230 ) ( ON ?auto_899228 ?auto_899229 ) ( ON ?auto_899227 ?auto_899228 ) ( CLEAR ?auto_899227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_899227 )
      ( MAKE-9PILE ?auto_899227 ?auto_899228 ?auto_899229 ?auto_899230 ?auto_899231 ?auto_899232 ?auto_899233 ?auto_899234 ?auto_899235 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_899266 - BLOCK
      ?auto_899267 - BLOCK
      ?auto_899268 - BLOCK
      ?auto_899269 - BLOCK
      ?auto_899270 - BLOCK
      ?auto_899271 - BLOCK
      ?auto_899272 - BLOCK
      ?auto_899273 - BLOCK
      ?auto_899274 - BLOCK
      ?auto_899275 - BLOCK
    )
    :vars
    (
      ?auto_899276 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_899274 ) ( ON ?auto_899275 ?auto_899276 ) ( CLEAR ?auto_899275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_899266 ) ( ON ?auto_899267 ?auto_899266 ) ( ON ?auto_899268 ?auto_899267 ) ( ON ?auto_899269 ?auto_899268 ) ( ON ?auto_899270 ?auto_899269 ) ( ON ?auto_899271 ?auto_899270 ) ( ON ?auto_899272 ?auto_899271 ) ( ON ?auto_899273 ?auto_899272 ) ( ON ?auto_899274 ?auto_899273 ) ( not ( = ?auto_899266 ?auto_899267 ) ) ( not ( = ?auto_899266 ?auto_899268 ) ) ( not ( = ?auto_899266 ?auto_899269 ) ) ( not ( = ?auto_899266 ?auto_899270 ) ) ( not ( = ?auto_899266 ?auto_899271 ) ) ( not ( = ?auto_899266 ?auto_899272 ) ) ( not ( = ?auto_899266 ?auto_899273 ) ) ( not ( = ?auto_899266 ?auto_899274 ) ) ( not ( = ?auto_899266 ?auto_899275 ) ) ( not ( = ?auto_899266 ?auto_899276 ) ) ( not ( = ?auto_899267 ?auto_899268 ) ) ( not ( = ?auto_899267 ?auto_899269 ) ) ( not ( = ?auto_899267 ?auto_899270 ) ) ( not ( = ?auto_899267 ?auto_899271 ) ) ( not ( = ?auto_899267 ?auto_899272 ) ) ( not ( = ?auto_899267 ?auto_899273 ) ) ( not ( = ?auto_899267 ?auto_899274 ) ) ( not ( = ?auto_899267 ?auto_899275 ) ) ( not ( = ?auto_899267 ?auto_899276 ) ) ( not ( = ?auto_899268 ?auto_899269 ) ) ( not ( = ?auto_899268 ?auto_899270 ) ) ( not ( = ?auto_899268 ?auto_899271 ) ) ( not ( = ?auto_899268 ?auto_899272 ) ) ( not ( = ?auto_899268 ?auto_899273 ) ) ( not ( = ?auto_899268 ?auto_899274 ) ) ( not ( = ?auto_899268 ?auto_899275 ) ) ( not ( = ?auto_899268 ?auto_899276 ) ) ( not ( = ?auto_899269 ?auto_899270 ) ) ( not ( = ?auto_899269 ?auto_899271 ) ) ( not ( = ?auto_899269 ?auto_899272 ) ) ( not ( = ?auto_899269 ?auto_899273 ) ) ( not ( = ?auto_899269 ?auto_899274 ) ) ( not ( = ?auto_899269 ?auto_899275 ) ) ( not ( = ?auto_899269 ?auto_899276 ) ) ( not ( = ?auto_899270 ?auto_899271 ) ) ( not ( = ?auto_899270 ?auto_899272 ) ) ( not ( = ?auto_899270 ?auto_899273 ) ) ( not ( = ?auto_899270 ?auto_899274 ) ) ( not ( = ?auto_899270 ?auto_899275 ) ) ( not ( = ?auto_899270 ?auto_899276 ) ) ( not ( = ?auto_899271 ?auto_899272 ) ) ( not ( = ?auto_899271 ?auto_899273 ) ) ( not ( = ?auto_899271 ?auto_899274 ) ) ( not ( = ?auto_899271 ?auto_899275 ) ) ( not ( = ?auto_899271 ?auto_899276 ) ) ( not ( = ?auto_899272 ?auto_899273 ) ) ( not ( = ?auto_899272 ?auto_899274 ) ) ( not ( = ?auto_899272 ?auto_899275 ) ) ( not ( = ?auto_899272 ?auto_899276 ) ) ( not ( = ?auto_899273 ?auto_899274 ) ) ( not ( = ?auto_899273 ?auto_899275 ) ) ( not ( = ?auto_899273 ?auto_899276 ) ) ( not ( = ?auto_899274 ?auto_899275 ) ) ( not ( = ?auto_899274 ?auto_899276 ) ) ( not ( = ?auto_899275 ?auto_899276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_899275 ?auto_899276 )
      ( !STACK ?auto_899275 ?auto_899274 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_899308 - BLOCK
      ?auto_899309 - BLOCK
      ?auto_899310 - BLOCK
      ?auto_899311 - BLOCK
      ?auto_899312 - BLOCK
      ?auto_899313 - BLOCK
      ?auto_899314 - BLOCK
      ?auto_899315 - BLOCK
      ?auto_899316 - BLOCK
      ?auto_899317 - BLOCK
    )
    :vars
    (
      ?auto_899318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899317 ?auto_899318 ) ( ON-TABLE ?auto_899308 ) ( ON ?auto_899309 ?auto_899308 ) ( ON ?auto_899310 ?auto_899309 ) ( ON ?auto_899311 ?auto_899310 ) ( ON ?auto_899312 ?auto_899311 ) ( ON ?auto_899313 ?auto_899312 ) ( ON ?auto_899314 ?auto_899313 ) ( ON ?auto_899315 ?auto_899314 ) ( not ( = ?auto_899308 ?auto_899309 ) ) ( not ( = ?auto_899308 ?auto_899310 ) ) ( not ( = ?auto_899308 ?auto_899311 ) ) ( not ( = ?auto_899308 ?auto_899312 ) ) ( not ( = ?auto_899308 ?auto_899313 ) ) ( not ( = ?auto_899308 ?auto_899314 ) ) ( not ( = ?auto_899308 ?auto_899315 ) ) ( not ( = ?auto_899308 ?auto_899316 ) ) ( not ( = ?auto_899308 ?auto_899317 ) ) ( not ( = ?auto_899308 ?auto_899318 ) ) ( not ( = ?auto_899309 ?auto_899310 ) ) ( not ( = ?auto_899309 ?auto_899311 ) ) ( not ( = ?auto_899309 ?auto_899312 ) ) ( not ( = ?auto_899309 ?auto_899313 ) ) ( not ( = ?auto_899309 ?auto_899314 ) ) ( not ( = ?auto_899309 ?auto_899315 ) ) ( not ( = ?auto_899309 ?auto_899316 ) ) ( not ( = ?auto_899309 ?auto_899317 ) ) ( not ( = ?auto_899309 ?auto_899318 ) ) ( not ( = ?auto_899310 ?auto_899311 ) ) ( not ( = ?auto_899310 ?auto_899312 ) ) ( not ( = ?auto_899310 ?auto_899313 ) ) ( not ( = ?auto_899310 ?auto_899314 ) ) ( not ( = ?auto_899310 ?auto_899315 ) ) ( not ( = ?auto_899310 ?auto_899316 ) ) ( not ( = ?auto_899310 ?auto_899317 ) ) ( not ( = ?auto_899310 ?auto_899318 ) ) ( not ( = ?auto_899311 ?auto_899312 ) ) ( not ( = ?auto_899311 ?auto_899313 ) ) ( not ( = ?auto_899311 ?auto_899314 ) ) ( not ( = ?auto_899311 ?auto_899315 ) ) ( not ( = ?auto_899311 ?auto_899316 ) ) ( not ( = ?auto_899311 ?auto_899317 ) ) ( not ( = ?auto_899311 ?auto_899318 ) ) ( not ( = ?auto_899312 ?auto_899313 ) ) ( not ( = ?auto_899312 ?auto_899314 ) ) ( not ( = ?auto_899312 ?auto_899315 ) ) ( not ( = ?auto_899312 ?auto_899316 ) ) ( not ( = ?auto_899312 ?auto_899317 ) ) ( not ( = ?auto_899312 ?auto_899318 ) ) ( not ( = ?auto_899313 ?auto_899314 ) ) ( not ( = ?auto_899313 ?auto_899315 ) ) ( not ( = ?auto_899313 ?auto_899316 ) ) ( not ( = ?auto_899313 ?auto_899317 ) ) ( not ( = ?auto_899313 ?auto_899318 ) ) ( not ( = ?auto_899314 ?auto_899315 ) ) ( not ( = ?auto_899314 ?auto_899316 ) ) ( not ( = ?auto_899314 ?auto_899317 ) ) ( not ( = ?auto_899314 ?auto_899318 ) ) ( not ( = ?auto_899315 ?auto_899316 ) ) ( not ( = ?auto_899315 ?auto_899317 ) ) ( not ( = ?auto_899315 ?auto_899318 ) ) ( not ( = ?auto_899316 ?auto_899317 ) ) ( not ( = ?auto_899316 ?auto_899318 ) ) ( not ( = ?auto_899317 ?auto_899318 ) ) ( CLEAR ?auto_899315 ) ( ON ?auto_899316 ?auto_899317 ) ( CLEAR ?auto_899316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_899308 ?auto_899309 ?auto_899310 ?auto_899311 ?auto_899312 ?auto_899313 ?auto_899314 ?auto_899315 ?auto_899316 )
      ( MAKE-10PILE ?auto_899308 ?auto_899309 ?auto_899310 ?auto_899311 ?auto_899312 ?auto_899313 ?auto_899314 ?auto_899315 ?auto_899316 ?auto_899317 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_899350 - BLOCK
      ?auto_899351 - BLOCK
      ?auto_899352 - BLOCK
      ?auto_899353 - BLOCK
      ?auto_899354 - BLOCK
      ?auto_899355 - BLOCK
      ?auto_899356 - BLOCK
      ?auto_899357 - BLOCK
      ?auto_899358 - BLOCK
      ?auto_899359 - BLOCK
    )
    :vars
    (
      ?auto_899360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899359 ?auto_899360 ) ( ON-TABLE ?auto_899350 ) ( ON ?auto_899351 ?auto_899350 ) ( ON ?auto_899352 ?auto_899351 ) ( ON ?auto_899353 ?auto_899352 ) ( ON ?auto_899354 ?auto_899353 ) ( ON ?auto_899355 ?auto_899354 ) ( ON ?auto_899356 ?auto_899355 ) ( not ( = ?auto_899350 ?auto_899351 ) ) ( not ( = ?auto_899350 ?auto_899352 ) ) ( not ( = ?auto_899350 ?auto_899353 ) ) ( not ( = ?auto_899350 ?auto_899354 ) ) ( not ( = ?auto_899350 ?auto_899355 ) ) ( not ( = ?auto_899350 ?auto_899356 ) ) ( not ( = ?auto_899350 ?auto_899357 ) ) ( not ( = ?auto_899350 ?auto_899358 ) ) ( not ( = ?auto_899350 ?auto_899359 ) ) ( not ( = ?auto_899350 ?auto_899360 ) ) ( not ( = ?auto_899351 ?auto_899352 ) ) ( not ( = ?auto_899351 ?auto_899353 ) ) ( not ( = ?auto_899351 ?auto_899354 ) ) ( not ( = ?auto_899351 ?auto_899355 ) ) ( not ( = ?auto_899351 ?auto_899356 ) ) ( not ( = ?auto_899351 ?auto_899357 ) ) ( not ( = ?auto_899351 ?auto_899358 ) ) ( not ( = ?auto_899351 ?auto_899359 ) ) ( not ( = ?auto_899351 ?auto_899360 ) ) ( not ( = ?auto_899352 ?auto_899353 ) ) ( not ( = ?auto_899352 ?auto_899354 ) ) ( not ( = ?auto_899352 ?auto_899355 ) ) ( not ( = ?auto_899352 ?auto_899356 ) ) ( not ( = ?auto_899352 ?auto_899357 ) ) ( not ( = ?auto_899352 ?auto_899358 ) ) ( not ( = ?auto_899352 ?auto_899359 ) ) ( not ( = ?auto_899352 ?auto_899360 ) ) ( not ( = ?auto_899353 ?auto_899354 ) ) ( not ( = ?auto_899353 ?auto_899355 ) ) ( not ( = ?auto_899353 ?auto_899356 ) ) ( not ( = ?auto_899353 ?auto_899357 ) ) ( not ( = ?auto_899353 ?auto_899358 ) ) ( not ( = ?auto_899353 ?auto_899359 ) ) ( not ( = ?auto_899353 ?auto_899360 ) ) ( not ( = ?auto_899354 ?auto_899355 ) ) ( not ( = ?auto_899354 ?auto_899356 ) ) ( not ( = ?auto_899354 ?auto_899357 ) ) ( not ( = ?auto_899354 ?auto_899358 ) ) ( not ( = ?auto_899354 ?auto_899359 ) ) ( not ( = ?auto_899354 ?auto_899360 ) ) ( not ( = ?auto_899355 ?auto_899356 ) ) ( not ( = ?auto_899355 ?auto_899357 ) ) ( not ( = ?auto_899355 ?auto_899358 ) ) ( not ( = ?auto_899355 ?auto_899359 ) ) ( not ( = ?auto_899355 ?auto_899360 ) ) ( not ( = ?auto_899356 ?auto_899357 ) ) ( not ( = ?auto_899356 ?auto_899358 ) ) ( not ( = ?auto_899356 ?auto_899359 ) ) ( not ( = ?auto_899356 ?auto_899360 ) ) ( not ( = ?auto_899357 ?auto_899358 ) ) ( not ( = ?auto_899357 ?auto_899359 ) ) ( not ( = ?auto_899357 ?auto_899360 ) ) ( not ( = ?auto_899358 ?auto_899359 ) ) ( not ( = ?auto_899358 ?auto_899360 ) ) ( not ( = ?auto_899359 ?auto_899360 ) ) ( ON ?auto_899358 ?auto_899359 ) ( CLEAR ?auto_899356 ) ( ON ?auto_899357 ?auto_899358 ) ( CLEAR ?auto_899357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_899350 ?auto_899351 ?auto_899352 ?auto_899353 ?auto_899354 ?auto_899355 ?auto_899356 ?auto_899357 )
      ( MAKE-10PILE ?auto_899350 ?auto_899351 ?auto_899352 ?auto_899353 ?auto_899354 ?auto_899355 ?auto_899356 ?auto_899357 ?auto_899358 ?auto_899359 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_899392 - BLOCK
      ?auto_899393 - BLOCK
      ?auto_899394 - BLOCK
      ?auto_899395 - BLOCK
      ?auto_899396 - BLOCK
      ?auto_899397 - BLOCK
      ?auto_899398 - BLOCK
      ?auto_899399 - BLOCK
      ?auto_899400 - BLOCK
      ?auto_899401 - BLOCK
    )
    :vars
    (
      ?auto_899402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899401 ?auto_899402 ) ( ON-TABLE ?auto_899392 ) ( ON ?auto_899393 ?auto_899392 ) ( ON ?auto_899394 ?auto_899393 ) ( ON ?auto_899395 ?auto_899394 ) ( ON ?auto_899396 ?auto_899395 ) ( ON ?auto_899397 ?auto_899396 ) ( not ( = ?auto_899392 ?auto_899393 ) ) ( not ( = ?auto_899392 ?auto_899394 ) ) ( not ( = ?auto_899392 ?auto_899395 ) ) ( not ( = ?auto_899392 ?auto_899396 ) ) ( not ( = ?auto_899392 ?auto_899397 ) ) ( not ( = ?auto_899392 ?auto_899398 ) ) ( not ( = ?auto_899392 ?auto_899399 ) ) ( not ( = ?auto_899392 ?auto_899400 ) ) ( not ( = ?auto_899392 ?auto_899401 ) ) ( not ( = ?auto_899392 ?auto_899402 ) ) ( not ( = ?auto_899393 ?auto_899394 ) ) ( not ( = ?auto_899393 ?auto_899395 ) ) ( not ( = ?auto_899393 ?auto_899396 ) ) ( not ( = ?auto_899393 ?auto_899397 ) ) ( not ( = ?auto_899393 ?auto_899398 ) ) ( not ( = ?auto_899393 ?auto_899399 ) ) ( not ( = ?auto_899393 ?auto_899400 ) ) ( not ( = ?auto_899393 ?auto_899401 ) ) ( not ( = ?auto_899393 ?auto_899402 ) ) ( not ( = ?auto_899394 ?auto_899395 ) ) ( not ( = ?auto_899394 ?auto_899396 ) ) ( not ( = ?auto_899394 ?auto_899397 ) ) ( not ( = ?auto_899394 ?auto_899398 ) ) ( not ( = ?auto_899394 ?auto_899399 ) ) ( not ( = ?auto_899394 ?auto_899400 ) ) ( not ( = ?auto_899394 ?auto_899401 ) ) ( not ( = ?auto_899394 ?auto_899402 ) ) ( not ( = ?auto_899395 ?auto_899396 ) ) ( not ( = ?auto_899395 ?auto_899397 ) ) ( not ( = ?auto_899395 ?auto_899398 ) ) ( not ( = ?auto_899395 ?auto_899399 ) ) ( not ( = ?auto_899395 ?auto_899400 ) ) ( not ( = ?auto_899395 ?auto_899401 ) ) ( not ( = ?auto_899395 ?auto_899402 ) ) ( not ( = ?auto_899396 ?auto_899397 ) ) ( not ( = ?auto_899396 ?auto_899398 ) ) ( not ( = ?auto_899396 ?auto_899399 ) ) ( not ( = ?auto_899396 ?auto_899400 ) ) ( not ( = ?auto_899396 ?auto_899401 ) ) ( not ( = ?auto_899396 ?auto_899402 ) ) ( not ( = ?auto_899397 ?auto_899398 ) ) ( not ( = ?auto_899397 ?auto_899399 ) ) ( not ( = ?auto_899397 ?auto_899400 ) ) ( not ( = ?auto_899397 ?auto_899401 ) ) ( not ( = ?auto_899397 ?auto_899402 ) ) ( not ( = ?auto_899398 ?auto_899399 ) ) ( not ( = ?auto_899398 ?auto_899400 ) ) ( not ( = ?auto_899398 ?auto_899401 ) ) ( not ( = ?auto_899398 ?auto_899402 ) ) ( not ( = ?auto_899399 ?auto_899400 ) ) ( not ( = ?auto_899399 ?auto_899401 ) ) ( not ( = ?auto_899399 ?auto_899402 ) ) ( not ( = ?auto_899400 ?auto_899401 ) ) ( not ( = ?auto_899400 ?auto_899402 ) ) ( not ( = ?auto_899401 ?auto_899402 ) ) ( ON ?auto_899400 ?auto_899401 ) ( ON ?auto_899399 ?auto_899400 ) ( CLEAR ?auto_899397 ) ( ON ?auto_899398 ?auto_899399 ) ( CLEAR ?auto_899398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_899392 ?auto_899393 ?auto_899394 ?auto_899395 ?auto_899396 ?auto_899397 ?auto_899398 )
      ( MAKE-10PILE ?auto_899392 ?auto_899393 ?auto_899394 ?auto_899395 ?auto_899396 ?auto_899397 ?auto_899398 ?auto_899399 ?auto_899400 ?auto_899401 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_899434 - BLOCK
      ?auto_899435 - BLOCK
      ?auto_899436 - BLOCK
      ?auto_899437 - BLOCK
      ?auto_899438 - BLOCK
      ?auto_899439 - BLOCK
      ?auto_899440 - BLOCK
      ?auto_899441 - BLOCK
      ?auto_899442 - BLOCK
      ?auto_899443 - BLOCK
    )
    :vars
    (
      ?auto_899444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899443 ?auto_899444 ) ( ON-TABLE ?auto_899434 ) ( ON ?auto_899435 ?auto_899434 ) ( ON ?auto_899436 ?auto_899435 ) ( ON ?auto_899437 ?auto_899436 ) ( ON ?auto_899438 ?auto_899437 ) ( not ( = ?auto_899434 ?auto_899435 ) ) ( not ( = ?auto_899434 ?auto_899436 ) ) ( not ( = ?auto_899434 ?auto_899437 ) ) ( not ( = ?auto_899434 ?auto_899438 ) ) ( not ( = ?auto_899434 ?auto_899439 ) ) ( not ( = ?auto_899434 ?auto_899440 ) ) ( not ( = ?auto_899434 ?auto_899441 ) ) ( not ( = ?auto_899434 ?auto_899442 ) ) ( not ( = ?auto_899434 ?auto_899443 ) ) ( not ( = ?auto_899434 ?auto_899444 ) ) ( not ( = ?auto_899435 ?auto_899436 ) ) ( not ( = ?auto_899435 ?auto_899437 ) ) ( not ( = ?auto_899435 ?auto_899438 ) ) ( not ( = ?auto_899435 ?auto_899439 ) ) ( not ( = ?auto_899435 ?auto_899440 ) ) ( not ( = ?auto_899435 ?auto_899441 ) ) ( not ( = ?auto_899435 ?auto_899442 ) ) ( not ( = ?auto_899435 ?auto_899443 ) ) ( not ( = ?auto_899435 ?auto_899444 ) ) ( not ( = ?auto_899436 ?auto_899437 ) ) ( not ( = ?auto_899436 ?auto_899438 ) ) ( not ( = ?auto_899436 ?auto_899439 ) ) ( not ( = ?auto_899436 ?auto_899440 ) ) ( not ( = ?auto_899436 ?auto_899441 ) ) ( not ( = ?auto_899436 ?auto_899442 ) ) ( not ( = ?auto_899436 ?auto_899443 ) ) ( not ( = ?auto_899436 ?auto_899444 ) ) ( not ( = ?auto_899437 ?auto_899438 ) ) ( not ( = ?auto_899437 ?auto_899439 ) ) ( not ( = ?auto_899437 ?auto_899440 ) ) ( not ( = ?auto_899437 ?auto_899441 ) ) ( not ( = ?auto_899437 ?auto_899442 ) ) ( not ( = ?auto_899437 ?auto_899443 ) ) ( not ( = ?auto_899437 ?auto_899444 ) ) ( not ( = ?auto_899438 ?auto_899439 ) ) ( not ( = ?auto_899438 ?auto_899440 ) ) ( not ( = ?auto_899438 ?auto_899441 ) ) ( not ( = ?auto_899438 ?auto_899442 ) ) ( not ( = ?auto_899438 ?auto_899443 ) ) ( not ( = ?auto_899438 ?auto_899444 ) ) ( not ( = ?auto_899439 ?auto_899440 ) ) ( not ( = ?auto_899439 ?auto_899441 ) ) ( not ( = ?auto_899439 ?auto_899442 ) ) ( not ( = ?auto_899439 ?auto_899443 ) ) ( not ( = ?auto_899439 ?auto_899444 ) ) ( not ( = ?auto_899440 ?auto_899441 ) ) ( not ( = ?auto_899440 ?auto_899442 ) ) ( not ( = ?auto_899440 ?auto_899443 ) ) ( not ( = ?auto_899440 ?auto_899444 ) ) ( not ( = ?auto_899441 ?auto_899442 ) ) ( not ( = ?auto_899441 ?auto_899443 ) ) ( not ( = ?auto_899441 ?auto_899444 ) ) ( not ( = ?auto_899442 ?auto_899443 ) ) ( not ( = ?auto_899442 ?auto_899444 ) ) ( not ( = ?auto_899443 ?auto_899444 ) ) ( ON ?auto_899442 ?auto_899443 ) ( ON ?auto_899441 ?auto_899442 ) ( ON ?auto_899440 ?auto_899441 ) ( CLEAR ?auto_899438 ) ( ON ?auto_899439 ?auto_899440 ) ( CLEAR ?auto_899439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_899434 ?auto_899435 ?auto_899436 ?auto_899437 ?auto_899438 ?auto_899439 )
      ( MAKE-10PILE ?auto_899434 ?auto_899435 ?auto_899436 ?auto_899437 ?auto_899438 ?auto_899439 ?auto_899440 ?auto_899441 ?auto_899442 ?auto_899443 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_899476 - BLOCK
      ?auto_899477 - BLOCK
      ?auto_899478 - BLOCK
      ?auto_899479 - BLOCK
      ?auto_899480 - BLOCK
      ?auto_899481 - BLOCK
      ?auto_899482 - BLOCK
      ?auto_899483 - BLOCK
      ?auto_899484 - BLOCK
      ?auto_899485 - BLOCK
    )
    :vars
    (
      ?auto_899486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899485 ?auto_899486 ) ( ON-TABLE ?auto_899476 ) ( ON ?auto_899477 ?auto_899476 ) ( ON ?auto_899478 ?auto_899477 ) ( ON ?auto_899479 ?auto_899478 ) ( not ( = ?auto_899476 ?auto_899477 ) ) ( not ( = ?auto_899476 ?auto_899478 ) ) ( not ( = ?auto_899476 ?auto_899479 ) ) ( not ( = ?auto_899476 ?auto_899480 ) ) ( not ( = ?auto_899476 ?auto_899481 ) ) ( not ( = ?auto_899476 ?auto_899482 ) ) ( not ( = ?auto_899476 ?auto_899483 ) ) ( not ( = ?auto_899476 ?auto_899484 ) ) ( not ( = ?auto_899476 ?auto_899485 ) ) ( not ( = ?auto_899476 ?auto_899486 ) ) ( not ( = ?auto_899477 ?auto_899478 ) ) ( not ( = ?auto_899477 ?auto_899479 ) ) ( not ( = ?auto_899477 ?auto_899480 ) ) ( not ( = ?auto_899477 ?auto_899481 ) ) ( not ( = ?auto_899477 ?auto_899482 ) ) ( not ( = ?auto_899477 ?auto_899483 ) ) ( not ( = ?auto_899477 ?auto_899484 ) ) ( not ( = ?auto_899477 ?auto_899485 ) ) ( not ( = ?auto_899477 ?auto_899486 ) ) ( not ( = ?auto_899478 ?auto_899479 ) ) ( not ( = ?auto_899478 ?auto_899480 ) ) ( not ( = ?auto_899478 ?auto_899481 ) ) ( not ( = ?auto_899478 ?auto_899482 ) ) ( not ( = ?auto_899478 ?auto_899483 ) ) ( not ( = ?auto_899478 ?auto_899484 ) ) ( not ( = ?auto_899478 ?auto_899485 ) ) ( not ( = ?auto_899478 ?auto_899486 ) ) ( not ( = ?auto_899479 ?auto_899480 ) ) ( not ( = ?auto_899479 ?auto_899481 ) ) ( not ( = ?auto_899479 ?auto_899482 ) ) ( not ( = ?auto_899479 ?auto_899483 ) ) ( not ( = ?auto_899479 ?auto_899484 ) ) ( not ( = ?auto_899479 ?auto_899485 ) ) ( not ( = ?auto_899479 ?auto_899486 ) ) ( not ( = ?auto_899480 ?auto_899481 ) ) ( not ( = ?auto_899480 ?auto_899482 ) ) ( not ( = ?auto_899480 ?auto_899483 ) ) ( not ( = ?auto_899480 ?auto_899484 ) ) ( not ( = ?auto_899480 ?auto_899485 ) ) ( not ( = ?auto_899480 ?auto_899486 ) ) ( not ( = ?auto_899481 ?auto_899482 ) ) ( not ( = ?auto_899481 ?auto_899483 ) ) ( not ( = ?auto_899481 ?auto_899484 ) ) ( not ( = ?auto_899481 ?auto_899485 ) ) ( not ( = ?auto_899481 ?auto_899486 ) ) ( not ( = ?auto_899482 ?auto_899483 ) ) ( not ( = ?auto_899482 ?auto_899484 ) ) ( not ( = ?auto_899482 ?auto_899485 ) ) ( not ( = ?auto_899482 ?auto_899486 ) ) ( not ( = ?auto_899483 ?auto_899484 ) ) ( not ( = ?auto_899483 ?auto_899485 ) ) ( not ( = ?auto_899483 ?auto_899486 ) ) ( not ( = ?auto_899484 ?auto_899485 ) ) ( not ( = ?auto_899484 ?auto_899486 ) ) ( not ( = ?auto_899485 ?auto_899486 ) ) ( ON ?auto_899484 ?auto_899485 ) ( ON ?auto_899483 ?auto_899484 ) ( ON ?auto_899482 ?auto_899483 ) ( ON ?auto_899481 ?auto_899482 ) ( CLEAR ?auto_899479 ) ( ON ?auto_899480 ?auto_899481 ) ( CLEAR ?auto_899480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_899476 ?auto_899477 ?auto_899478 ?auto_899479 ?auto_899480 )
      ( MAKE-10PILE ?auto_899476 ?auto_899477 ?auto_899478 ?auto_899479 ?auto_899480 ?auto_899481 ?auto_899482 ?auto_899483 ?auto_899484 ?auto_899485 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_899518 - BLOCK
      ?auto_899519 - BLOCK
      ?auto_899520 - BLOCK
      ?auto_899521 - BLOCK
      ?auto_899522 - BLOCK
      ?auto_899523 - BLOCK
      ?auto_899524 - BLOCK
      ?auto_899525 - BLOCK
      ?auto_899526 - BLOCK
      ?auto_899527 - BLOCK
    )
    :vars
    (
      ?auto_899528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899527 ?auto_899528 ) ( ON-TABLE ?auto_899518 ) ( ON ?auto_899519 ?auto_899518 ) ( ON ?auto_899520 ?auto_899519 ) ( not ( = ?auto_899518 ?auto_899519 ) ) ( not ( = ?auto_899518 ?auto_899520 ) ) ( not ( = ?auto_899518 ?auto_899521 ) ) ( not ( = ?auto_899518 ?auto_899522 ) ) ( not ( = ?auto_899518 ?auto_899523 ) ) ( not ( = ?auto_899518 ?auto_899524 ) ) ( not ( = ?auto_899518 ?auto_899525 ) ) ( not ( = ?auto_899518 ?auto_899526 ) ) ( not ( = ?auto_899518 ?auto_899527 ) ) ( not ( = ?auto_899518 ?auto_899528 ) ) ( not ( = ?auto_899519 ?auto_899520 ) ) ( not ( = ?auto_899519 ?auto_899521 ) ) ( not ( = ?auto_899519 ?auto_899522 ) ) ( not ( = ?auto_899519 ?auto_899523 ) ) ( not ( = ?auto_899519 ?auto_899524 ) ) ( not ( = ?auto_899519 ?auto_899525 ) ) ( not ( = ?auto_899519 ?auto_899526 ) ) ( not ( = ?auto_899519 ?auto_899527 ) ) ( not ( = ?auto_899519 ?auto_899528 ) ) ( not ( = ?auto_899520 ?auto_899521 ) ) ( not ( = ?auto_899520 ?auto_899522 ) ) ( not ( = ?auto_899520 ?auto_899523 ) ) ( not ( = ?auto_899520 ?auto_899524 ) ) ( not ( = ?auto_899520 ?auto_899525 ) ) ( not ( = ?auto_899520 ?auto_899526 ) ) ( not ( = ?auto_899520 ?auto_899527 ) ) ( not ( = ?auto_899520 ?auto_899528 ) ) ( not ( = ?auto_899521 ?auto_899522 ) ) ( not ( = ?auto_899521 ?auto_899523 ) ) ( not ( = ?auto_899521 ?auto_899524 ) ) ( not ( = ?auto_899521 ?auto_899525 ) ) ( not ( = ?auto_899521 ?auto_899526 ) ) ( not ( = ?auto_899521 ?auto_899527 ) ) ( not ( = ?auto_899521 ?auto_899528 ) ) ( not ( = ?auto_899522 ?auto_899523 ) ) ( not ( = ?auto_899522 ?auto_899524 ) ) ( not ( = ?auto_899522 ?auto_899525 ) ) ( not ( = ?auto_899522 ?auto_899526 ) ) ( not ( = ?auto_899522 ?auto_899527 ) ) ( not ( = ?auto_899522 ?auto_899528 ) ) ( not ( = ?auto_899523 ?auto_899524 ) ) ( not ( = ?auto_899523 ?auto_899525 ) ) ( not ( = ?auto_899523 ?auto_899526 ) ) ( not ( = ?auto_899523 ?auto_899527 ) ) ( not ( = ?auto_899523 ?auto_899528 ) ) ( not ( = ?auto_899524 ?auto_899525 ) ) ( not ( = ?auto_899524 ?auto_899526 ) ) ( not ( = ?auto_899524 ?auto_899527 ) ) ( not ( = ?auto_899524 ?auto_899528 ) ) ( not ( = ?auto_899525 ?auto_899526 ) ) ( not ( = ?auto_899525 ?auto_899527 ) ) ( not ( = ?auto_899525 ?auto_899528 ) ) ( not ( = ?auto_899526 ?auto_899527 ) ) ( not ( = ?auto_899526 ?auto_899528 ) ) ( not ( = ?auto_899527 ?auto_899528 ) ) ( ON ?auto_899526 ?auto_899527 ) ( ON ?auto_899525 ?auto_899526 ) ( ON ?auto_899524 ?auto_899525 ) ( ON ?auto_899523 ?auto_899524 ) ( ON ?auto_899522 ?auto_899523 ) ( CLEAR ?auto_899520 ) ( ON ?auto_899521 ?auto_899522 ) ( CLEAR ?auto_899521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_899518 ?auto_899519 ?auto_899520 ?auto_899521 )
      ( MAKE-10PILE ?auto_899518 ?auto_899519 ?auto_899520 ?auto_899521 ?auto_899522 ?auto_899523 ?auto_899524 ?auto_899525 ?auto_899526 ?auto_899527 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_899560 - BLOCK
      ?auto_899561 - BLOCK
      ?auto_899562 - BLOCK
      ?auto_899563 - BLOCK
      ?auto_899564 - BLOCK
      ?auto_899565 - BLOCK
      ?auto_899566 - BLOCK
      ?auto_899567 - BLOCK
      ?auto_899568 - BLOCK
      ?auto_899569 - BLOCK
    )
    :vars
    (
      ?auto_899570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899569 ?auto_899570 ) ( ON-TABLE ?auto_899560 ) ( ON ?auto_899561 ?auto_899560 ) ( not ( = ?auto_899560 ?auto_899561 ) ) ( not ( = ?auto_899560 ?auto_899562 ) ) ( not ( = ?auto_899560 ?auto_899563 ) ) ( not ( = ?auto_899560 ?auto_899564 ) ) ( not ( = ?auto_899560 ?auto_899565 ) ) ( not ( = ?auto_899560 ?auto_899566 ) ) ( not ( = ?auto_899560 ?auto_899567 ) ) ( not ( = ?auto_899560 ?auto_899568 ) ) ( not ( = ?auto_899560 ?auto_899569 ) ) ( not ( = ?auto_899560 ?auto_899570 ) ) ( not ( = ?auto_899561 ?auto_899562 ) ) ( not ( = ?auto_899561 ?auto_899563 ) ) ( not ( = ?auto_899561 ?auto_899564 ) ) ( not ( = ?auto_899561 ?auto_899565 ) ) ( not ( = ?auto_899561 ?auto_899566 ) ) ( not ( = ?auto_899561 ?auto_899567 ) ) ( not ( = ?auto_899561 ?auto_899568 ) ) ( not ( = ?auto_899561 ?auto_899569 ) ) ( not ( = ?auto_899561 ?auto_899570 ) ) ( not ( = ?auto_899562 ?auto_899563 ) ) ( not ( = ?auto_899562 ?auto_899564 ) ) ( not ( = ?auto_899562 ?auto_899565 ) ) ( not ( = ?auto_899562 ?auto_899566 ) ) ( not ( = ?auto_899562 ?auto_899567 ) ) ( not ( = ?auto_899562 ?auto_899568 ) ) ( not ( = ?auto_899562 ?auto_899569 ) ) ( not ( = ?auto_899562 ?auto_899570 ) ) ( not ( = ?auto_899563 ?auto_899564 ) ) ( not ( = ?auto_899563 ?auto_899565 ) ) ( not ( = ?auto_899563 ?auto_899566 ) ) ( not ( = ?auto_899563 ?auto_899567 ) ) ( not ( = ?auto_899563 ?auto_899568 ) ) ( not ( = ?auto_899563 ?auto_899569 ) ) ( not ( = ?auto_899563 ?auto_899570 ) ) ( not ( = ?auto_899564 ?auto_899565 ) ) ( not ( = ?auto_899564 ?auto_899566 ) ) ( not ( = ?auto_899564 ?auto_899567 ) ) ( not ( = ?auto_899564 ?auto_899568 ) ) ( not ( = ?auto_899564 ?auto_899569 ) ) ( not ( = ?auto_899564 ?auto_899570 ) ) ( not ( = ?auto_899565 ?auto_899566 ) ) ( not ( = ?auto_899565 ?auto_899567 ) ) ( not ( = ?auto_899565 ?auto_899568 ) ) ( not ( = ?auto_899565 ?auto_899569 ) ) ( not ( = ?auto_899565 ?auto_899570 ) ) ( not ( = ?auto_899566 ?auto_899567 ) ) ( not ( = ?auto_899566 ?auto_899568 ) ) ( not ( = ?auto_899566 ?auto_899569 ) ) ( not ( = ?auto_899566 ?auto_899570 ) ) ( not ( = ?auto_899567 ?auto_899568 ) ) ( not ( = ?auto_899567 ?auto_899569 ) ) ( not ( = ?auto_899567 ?auto_899570 ) ) ( not ( = ?auto_899568 ?auto_899569 ) ) ( not ( = ?auto_899568 ?auto_899570 ) ) ( not ( = ?auto_899569 ?auto_899570 ) ) ( ON ?auto_899568 ?auto_899569 ) ( ON ?auto_899567 ?auto_899568 ) ( ON ?auto_899566 ?auto_899567 ) ( ON ?auto_899565 ?auto_899566 ) ( ON ?auto_899564 ?auto_899565 ) ( ON ?auto_899563 ?auto_899564 ) ( CLEAR ?auto_899561 ) ( ON ?auto_899562 ?auto_899563 ) ( CLEAR ?auto_899562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_899560 ?auto_899561 ?auto_899562 )
      ( MAKE-10PILE ?auto_899560 ?auto_899561 ?auto_899562 ?auto_899563 ?auto_899564 ?auto_899565 ?auto_899566 ?auto_899567 ?auto_899568 ?auto_899569 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_899602 - BLOCK
      ?auto_899603 - BLOCK
      ?auto_899604 - BLOCK
      ?auto_899605 - BLOCK
      ?auto_899606 - BLOCK
      ?auto_899607 - BLOCK
      ?auto_899608 - BLOCK
      ?auto_899609 - BLOCK
      ?auto_899610 - BLOCK
      ?auto_899611 - BLOCK
    )
    :vars
    (
      ?auto_899612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899611 ?auto_899612 ) ( ON-TABLE ?auto_899602 ) ( not ( = ?auto_899602 ?auto_899603 ) ) ( not ( = ?auto_899602 ?auto_899604 ) ) ( not ( = ?auto_899602 ?auto_899605 ) ) ( not ( = ?auto_899602 ?auto_899606 ) ) ( not ( = ?auto_899602 ?auto_899607 ) ) ( not ( = ?auto_899602 ?auto_899608 ) ) ( not ( = ?auto_899602 ?auto_899609 ) ) ( not ( = ?auto_899602 ?auto_899610 ) ) ( not ( = ?auto_899602 ?auto_899611 ) ) ( not ( = ?auto_899602 ?auto_899612 ) ) ( not ( = ?auto_899603 ?auto_899604 ) ) ( not ( = ?auto_899603 ?auto_899605 ) ) ( not ( = ?auto_899603 ?auto_899606 ) ) ( not ( = ?auto_899603 ?auto_899607 ) ) ( not ( = ?auto_899603 ?auto_899608 ) ) ( not ( = ?auto_899603 ?auto_899609 ) ) ( not ( = ?auto_899603 ?auto_899610 ) ) ( not ( = ?auto_899603 ?auto_899611 ) ) ( not ( = ?auto_899603 ?auto_899612 ) ) ( not ( = ?auto_899604 ?auto_899605 ) ) ( not ( = ?auto_899604 ?auto_899606 ) ) ( not ( = ?auto_899604 ?auto_899607 ) ) ( not ( = ?auto_899604 ?auto_899608 ) ) ( not ( = ?auto_899604 ?auto_899609 ) ) ( not ( = ?auto_899604 ?auto_899610 ) ) ( not ( = ?auto_899604 ?auto_899611 ) ) ( not ( = ?auto_899604 ?auto_899612 ) ) ( not ( = ?auto_899605 ?auto_899606 ) ) ( not ( = ?auto_899605 ?auto_899607 ) ) ( not ( = ?auto_899605 ?auto_899608 ) ) ( not ( = ?auto_899605 ?auto_899609 ) ) ( not ( = ?auto_899605 ?auto_899610 ) ) ( not ( = ?auto_899605 ?auto_899611 ) ) ( not ( = ?auto_899605 ?auto_899612 ) ) ( not ( = ?auto_899606 ?auto_899607 ) ) ( not ( = ?auto_899606 ?auto_899608 ) ) ( not ( = ?auto_899606 ?auto_899609 ) ) ( not ( = ?auto_899606 ?auto_899610 ) ) ( not ( = ?auto_899606 ?auto_899611 ) ) ( not ( = ?auto_899606 ?auto_899612 ) ) ( not ( = ?auto_899607 ?auto_899608 ) ) ( not ( = ?auto_899607 ?auto_899609 ) ) ( not ( = ?auto_899607 ?auto_899610 ) ) ( not ( = ?auto_899607 ?auto_899611 ) ) ( not ( = ?auto_899607 ?auto_899612 ) ) ( not ( = ?auto_899608 ?auto_899609 ) ) ( not ( = ?auto_899608 ?auto_899610 ) ) ( not ( = ?auto_899608 ?auto_899611 ) ) ( not ( = ?auto_899608 ?auto_899612 ) ) ( not ( = ?auto_899609 ?auto_899610 ) ) ( not ( = ?auto_899609 ?auto_899611 ) ) ( not ( = ?auto_899609 ?auto_899612 ) ) ( not ( = ?auto_899610 ?auto_899611 ) ) ( not ( = ?auto_899610 ?auto_899612 ) ) ( not ( = ?auto_899611 ?auto_899612 ) ) ( ON ?auto_899610 ?auto_899611 ) ( ON ?auto_899609 ?auto_899610 ) ( ON ?auto_899608 ?auto_899609 ) ( ON ?auto_899607 ?auto_899608 ) ( ON ?auto_899606 ?auto_899607 ) ( ON ?auto_899605 ?auto_899606 ) ( ON ?auto_899604 ?auto_899605 ) ( CLEAR ?auto_899602 ) ( ON ?auto_899603 ?auto_899604 ) ( CLEAR ?auto_899603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_899602 ?auto_899603 )
      ( MAKE-10PILE ?auto_899602 ?auto_899603 ?auto_899604 ?auto_899605 ?auto_899606 ?auto_899607 ?auto_899608 ?auto_899609 ?auto_899610 ?auto_899611 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_899644 - BLOCK
      ?auto_899645 - BLOCK
      ?auto_899646 - BLOCK
      ?auto_899647 - BLOCK
      ?auto_899648 - BLOCK
      ?auto_899649 - BLOCK
      ?auto_899650 - BLOCK
      ?auto_899651 - BLOCK
      ?auto_899652 - BLOCK
      ?auto_899653 - BLOCK
    )
    :vars
    (
      ?auto_899654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899653 ?auto_899654 ) ( not ( = ?auto_899644 ?auto_899645 ) ) ( not ( = ?auto_899644 ?auto_899646 ) ) ( not ( = ?auto_899644 ?auto_899647 ) ) ( not ( = ?auto_899644 ?auto_899648 ) ) ( not ( = ?auto_899644 ?auto_899649 ) ) ( not ( = ?auto_899644 ?auto_899650 ) ) ( not ( = ?auto_899644 ?auto_899651 ) ) ( not ( = ?auto_899644 ?auto_899652 ) ) ( not ( = ?auto_899644 ?auto_899653 ) ) ( not ( = ?auto_899644 ?auto_899654 ) ) ( not ( = ?auto_899645 ?auto_899646 ) ) ( not ( = ?auto_899645 ?auto_899647 ) ) ( not ( = ?auto_899645 ?auto_899648 ) ) ( not ( = ?auto_899645 ?auto_899649 ) ) ( not ( = ?auto_899645 ?auto_899650 ) ) ( not ( = ?auto_899645 ?auto_899651 ) ) ( not ( = ?auto_899645 ?auto_899652 ) ) ( not ( = ?auto_899645 ?auto_899653 ) ) ( not ( = ?auto_899645 ?auto_899654 ) ) ( not ( = ?auto_899646 ?auto_899647 ) ) ( not ( = ?auto_899646 ?auto_899648 ) ) ( not ( = ?auto_899646 ?auto_899649 ) ) ( not ( = ?auto_899646 ?auto_899650 ) ) ( not ( = ?auto_899646 ?auto_899651 ) ) ( not ( = ?auto_899646 ?auto_899652 ) ) ( not ( = ?auto_899646 ?auto_899653 ) ) ( not ( = ?auto_899646 ?auto_899654 ) ) ( not ( = ?auto_899647 ?auto_899648 ) ) ( not ( = ?auto_899647 ?auto_899649 ) ) ( not ( = ?auto_899647 ?auto_899650 ) ) ( not ( = ?auto_899647 ?auto_899651 ) ) ( not ( = ?auto_899647 ?auto_899652 ) ) ( not ( = ?auto_899647 ?auto_899653 ) ) ( not ( = ?auto_899647 ?auto_899654 ) ) ( not ( = ?auto_899648 ?auto_899649 ) ) ( not ( = ?auto_899648 ?auto_899650 ) ) ( not ( = ?auto_899648 ?auto_899651 ) ) ( not ( = ?auto_899648 ?auto_899652 ) ) ( not ( = ?auto_899648 ?auto_899653 ) ) ( not ( = ?auto_899648 ?auto_899654 ) ) ( not ( = ?auto_899649 ?auto_899650 ) ) ( not ( = ?auto_899649 ?auto_899651 ) ) ( not ( = ?auto_899649 ?auto_899652 ) ) ( not ( = ?auto_899649 ?auto_899653 ) ) ( not ( = ?auto_899649 ?auto_899654 ) ) ( not ( = ?auto_899650 ?auto_899651 ) ) ( not ( = ?auto_899650 ?auto_899652 ) ) ( not ( = ?auto_899650 ?auto_899653 ) ) ( not ( = ?auto_899650 ?auto_899654 ) ) ( not ( = ?auto_899651 ?auto_899652 ) ) ( not ( = ?auto_899651 ?auto_899653 ) ) ( not ( = ?auto_899651 ?auto_899654 ) ) ( not ( = ?auto_899652 ?auto_899653 ) ) ( not ( = ?auto_899652 ?auto_899654 ) ) ( not ( = ?auto_899653 ?auto_899654 ) ) ( ON ?auto_899652 ?auto_899653 ) ( ON ?auto_899651 ?auto_899652 ) ( ON ?auto_899650 ?auto_899651 ) ( ON ?auto_899649 ?auto_899650 ) ( ON ?auto_899648 ?auto_899649 ) ( ON ?auto_899647 ?auto_899648 ) ( ON ?auto_899646 ?auto_899647 ) ( ON ?auto_899645 ?auto_899646 ) ( ON ?auto_899644 ?auto_899645 ) ( CLEAR ?auto_899644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_899644 )
      ( MAKE-10PILE ?auto_899644 ?auto_899645 ?auto_899646 ?auto_899647 ?auto_899648 ?auto_899649 ?auto_899650 ?auto_899651 ?auto_899652 ?auto_899653 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_899687 - BLOCK
      ?auto_899688 - BLOCK
      ?auto_899689 - BLOCK
      ?auto_899690 - BLOCK
      ?auto_899691 - BLOCK
      ?auto_899692 - BLOCK
      ?auto_899693 - BLOCK
      ?auto_899694 - BLOCK
      ?auto_899695 - BLOCK
      ?auto_899696 - BLOCK
      ?auto_899697 - BLOCK
    )
    :vars
    (
      ?auto_899698 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_899696 ) ( ON ?auto_899697 ?auto_899698 ) ( CLEAR ?auto_899697 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_899687 ) ( ON ?auto_899688 ?auto_899687 ) ( ON ?auto_899689 ?auto_899688 ) ( ON ?auto_899690 ?auto_899689 ) ( ON ?auto_899691 ?auto_899690 ) ( ON ?auto_899692 ?auto_899691 ) ( ON ?auto_899693 ?auto_899692 ) ( ON ?auto_899694 ?auto_899693 ) ( ON ?auto_899695 ?auto_899694 ) ( ON ?auto_899696 ?auto_899695 ) ( not ( = ?auto_899687 ?auto_899688 ) ) ( not ( = ?auto_899687 ?auto_899689 ) ) ( not ( = ?auto_899687 ?auto_899690 ) ) ( not ( = ?auto_899687 ?auto_899691 ) ) ( not ( = ?auto_899687 ?auto_899692 ) ) ( not ( = ?auto_899687 ?auto_899693 ) ) ( not ( = ?auto_899687 ?auto_899694 ) ) ( not ( = ?auto_899687 ?auto_899695 ) ) ( not ( = ?auto_899687 ?auto_899696 ) ) ( not ( = ?auto_899687 ?auto_899697 ) ) ( not ( = ?auto_899687 ?auto_899698 ) ) ( not ( = ?auto_899688 ?auto_899689 ) ) ( not ( = ?auto_899688 ?auto_899690 ) ) ( not ( = ?auto_899688 ?auto_899691 ) ) ( not ( = ?auto_899688 ?auto_899692 ) ) ( not ( = ?auto_899688 ?auto_899693 ) ) ( not ( = ?auto_899688 ?auto_899694 ) ) ( not ( = ?auto_899688 ?auto_899695 ) ) ( not ( = ?auto_899688 ?auto_899696 ) ) ( not ( = ?auto_899688 ?auto_899697 ) ) ( not ( = ?auto_899688 ?auto_899698 ) ) ( not ( = ?auto_899689 ?auto_899690 ) ) ( not ( = ?auto_899689 ?auto_899691 ) ) ( not ( = ?auto_899689 ?auto_899692 ) ) ( not ( = ?auto_899689 ?auto_899693 ) ) ( not ( = ?auto_899689 ?auto_899694 ) ) ( not ( = ?auto_899689 ?auto_899695 ) ) ( not ( = ?auto_899689 ?auto_899696 ) ) ( not ( = ?auto_899689 ?auto_899697 ) ) ( not ( = ?auto_899689 ?auto_899698 ) ) ( not ( = ?auto_899690 ?auto_899691 ) ) ( not ( = ?auto_899690 ?auto_899692 ) ) ( not ( = ?auto_899690 ?auto_899693 ) ) ( not ( = ?auto_899690 ?auto_899694 ) ) ( not ( = ?auto_899690 ?auto_899695 ) ) ( not ( = ?auto_899690 ?auto_899696 ) ) ( not ( = ?auto_899690 ?auto_899697 ) ) ( not ( = ?auto_899690 ?auto_899698 ) ) ( not ( = ?auto_899691 ?auto_899692 ) ) ( not ( = ?auto_899691 ?auto_899693 ) ) ( not ( = ?auto_899691 ?auto_899694 ) ) ( not ( = ?auto_899691 ?auto_899695 ) ) ( not ( = ?auto_899691 ?auto_899696 ) ) ( not ( = ?auto_899691 ?auto_899697 ) ) ( not ( = ?auto_899691 ?auto_899698 ) ) ( not ( = ?auto_899692 ?auto_899693 ) ) ( not ( = ?auto_899692 ?auto_899694 ) ) ( not ( = ?auto_899692 ?auto_899695 ) ) ( not ( = ?auto_899692 ?auto_899696 ) ) ( not ( = ?auto_899692 ?auto_899697 ) ) ( not ( = ?auto_899692 ?auto_899698 ) ) ( not ( = ?auto_899693 ?auto_899694 ) ) ( not ( = ?auto_899693 ?auto_899695 ) ) ( not ( = ?auto_899693 ?auto_899696 ) ) ( not ( = ?auto_899693 ?auto_899697 ) ) ( not ( = ?auto_899693 ?auto_899698 ) ) ( not ( = ?auto_899694 ?auto_899695 ) ) ( not ( = ?auto_899694 ?auto_899696 ) ) ( not ( = ?auto_899694 ?auto_899697 ) ) ( not ( = ?auto_899694 ?auto_899698 ) ) ( not ( = ?auto_899695 ?auto_899696 ) ) ( not ( = ?auto_899695 ?auto_899697 ) ) ( not ( = ?auto_899695 ?auto_899698 ) ) ( not ( = ?auto_899696 ?auto_899697 ) ) ( not ( = ?auto_899696 ?auto_899698 ) ) ( not ( = ?auto_899697 ?auto_899698 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_899697 ?auto_899698 )
      ( !STACK ?auto_899697 ?auto_899696 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_899733 - BLOCK
      ?auto_899734 - BLOCK
      ?auto_899735 - BLOCK
      ?auto_899736 - BLOCK
      ?auto_899737 - BLOCK
      ?auto_899738 - BLOCK
      ?auto_899739 - BLOCK
      ?auto_899740 - BLOCK
      ?auto_899741 - BLOCK
      ?auto_899742 - BLOCK
      ?auto_899743 - BLOCK
    )
    :vars
    (
      ?auto_899744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899743 ?auto_899744 ) ( ON-TABLE ?auto_899733 ) ( ON ?auto_899734 ?auto_899733 ) ( ON ?auto_899735 ?auto_899734 ) ( ON ?auto_899736 ?auto_899735 ) ( ON ?auto_899737 ?auto_899736 ) ( ON ?auto_899738 ?auto_899737 ) ( ON ?auto_899739 ?auto_899738 ) ( ON ?auto_899740 ?auto_899739 ) ( ON ?auto_899741 ?auto_899740 ) ( not ( = ?auto_899733 ?auto_899734 ) ) ( not ( = ?auto_899733 ?auto_899735 ) ) ( not ( = ?auto_899733 ?auto_899736 ) ) ( not ( = ?auto_899733 ?auto_899737 ) ) ( not ( = ?auto_899733 ?auto_899738 ) ) ( not ( = ?auto_899733 ?auto_899739 ) ) ( not ( = ?auto_899733 ?auto_899740 ) ) ( not ( = ?auto_899733 ?auto_899741 ) ) ( not ( = ?auto_899733 ?auto_899742 ) ) ( not ( = ?auto_899733 ?auto_899743 ) ) ( not ( = ?auto_899733 ?auto_899744 ) ) ( not ( = ?auto_899734 ?auto_899735 ) ) ( not ( = ?auto_899734 ?auto_899736 ) ) ( not ( = ?auto_899734 ?auto_899737 ) ) ( not ( = ?auto_899734 ?auto_899738 ) ) ( not ( = ?auto_899734 ?auto_899739 ) ) ( not ( = ?auto_899734 ?auto_899740 ) ) ( not ( = ?auto_899734 ?auto_899741 ) ) ( not ( = ?auto_899734 ?auto_899742 ) ) ( not ( = ?auto_899734 ?auto_899743 ) ) ( not ( = ?auto_899734 ?auto_899744 ) ) ( not ( = ?auto_899735 ?auto_899736 ) ) ( not ( = ?auto_899735 ?auto_899737 ) ) ( not ( = ?auto_899735 ?auto_899738 ) ) ( not ( = ?auto_899735 ?auto_899739 ) ) ( not ( = ?auto_899735 ?auto_899740 ) ) ( not ( = ?auto_899735 ?auto_899741 ) ) ( not ( = ?auto_899735 ?auto_899742 ) ) ( not ( = ?auto_899735 ?auto_899743 ) ) ( not ( = ?auto_899735 ?auto_899744 ) ) ( not ( = ?auto_899736 ?auto_899737 ) ) ( not ( = ?auto_899736 ?auto_899738 ) ) ( not ( = ?auto_899736 ?auto_899739 ) ) ( not ( = ?auto_899736 ?auto_899740 ) ) ( not ( = ?auto_899736 ?auto_899741 ) ) ( not ( = ?auto_899736 ?auto_899742 ) ) ( not ( = ?auto_899736 ?auto_899743 ) ) ( not ( = ?auto_899736 ?auto_899744 ) ) ( not ( = ?auto_899737 ?auto_899738 ) ) ( not ( = ?auto_899737 ?auto_899739 ) ) ( not ( = ?auto_899737 ?auto_899740 ) ) ( not ( = ?auto_899737 ?auto_899741 ) ) ( not ( = ?auto_899737 ?auto_899742 ) ) ( not ( = ?auto_899737 ?auto_899743 ) ) ( not ( = ?auto_899737 ?auto_899744 ) ) ( not ( = ?auto_899738 ?auto_899739 ) ) ( not ( = ?auto_899738 ?auto_899740 ) ) ( not ( = ?auto_899738 ?auto_899741 ) ) ( not ( = ?auto_899738 ?auto_899742 ) ) ( not ( = ?auto_899738 ?auto_899743 ) ) ( not ( = ?auto_899738 ?auto_899744 ) ) ( not ( = ?auto_899739 ?auto_899740 ) ) ( not ( = ?auto_899739 ?auto_899741 ) ) ( not ( = ?auto_899739 ?auto_899742 ) ) ( not ( = ?auto_899739 ?auto_899743 ) ) ( not ( = ?auto_899739 ?auto_899744 ) ) ( not ( = ?auto_899740 ?auto_899741 ) ) ( not ( = ?auto_899740 ?auto_899742 ) ) ( not ( = ?auto_899740 ?auto_899743 ) ) ( not ( = ?auto_899740 ?auto_899744 ) ) ( not ( = ?auto_899741 ?auto_899742 ) ) ( not ( = ?auto_899741 ?auto_899743 ) ) ( not ( = ?auto_899741 ?auto_899744 ) ) ( not ( = ?auto_899742 ?auto_899743 ) ) ( not ( = ?auto_899742 ?auto_899744 ) ) ( not ( = ?auto_899743 ?auto_899744 ) ) ( CLEAR ?auto_899741 ) ( ON ?auto_899742 ?auto_899743 ) ( CLEAR ?auto_899742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_899733 ?auto_899734 ?auto_899735 ?auto_899736 ?auto_899737 ?auto_899738 ?auto_899739 ?auto_899740 ?auto_899741 ?auto_899742 )
      ( MAKE-11PILE ?auto_899733 ?auto_899734 ?auto_899735 ?auto_899736 ?auto_899737 ?auto_899738 ?auto_899739 ?auto_899740 ?auto_899741 ?auto_899742 ?auto_899743 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_899779 - BLOCK
      ?auto_899780 - BLOCK
      ?auto_899781 - BLOCK
      ?auto_899782 - BLOCK
      ?auto_899783 - BLOCK
      ?auto_899784 - BLOCK
      ?auto_899785 - BLOCK
      ?auto_899786 - BLOCK
      ?auto_899787 - BLOCK
      ?auto_899788 - BLOCK
      ?auto_899789 - BLOCK
    )
    :vars
    (
      ?auto_899790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899789 ?auto_899790 ) ( ON-TABLE ?auto_899779 ) ( ON ?auto_899780 ?auto_899779 ) ( ON ?auto_899781 ?auto_899780 ) ( ON ?auto_899782 ?auto_899781 ) ( ON ?auto_899783 ?auto_899782 ) ( ON ?auto_899784 ?auto_899783 ) ( ON ?auto_899785 ?auto_899784 ) ( ON ?auto_899786 ?auto_899785 ) ( not ( = ?auto_899779 ?auto_899780 ) ) ( not ( = ?auto_899779 ?auto_899781 ) ) ( not ( = ?auto_899779 ?auto_899782 ) ) ( not ( = ?auto_899779 ?auto_899783 ) ) ( not ( = ?auto_899779 ?auto_899784 ) ) ( not ( = ?auto_899779 ?auto_899785 ) ) ( not ( = ?auto_899779 ?auto_899786 ) ) ( not ( = ?auto_899779 ?auto_899787 ) ) ( not ( = ?auto_899779 ?auto_899788 ) ) ( not ( = ?auto_899779 ?auto_899789 ) ) ( not ( = ?auto_899779 ?auto_899790 ) ) ( not ( = ?auto_899780 ?auto_899781 ) ) ( not ( = ?auto_899780 ?auto_899782 ) ) ( not ( = ?auto_899780 ?auto_899783 ) ) ( not ( = ?auto_899780 ?auto_899784 ) ) ( not ( = ?auto_899780 ?auto_899785 ) ) ( not ( = ?auto_899780 ?auto_899786 ) ) ( not ( = ?auto_899780 ?auto_899787 ) ) ( not ( = ?auto_899780 ?auto_899788 ) ) ( not ( = ?auto_899780 ?auto_899789 ) ) ( not ( = ?auto_899780 ?auto_899790 ) ) ( not ( = ?auto_899781 ?auto_899782 ) ) ( not ( = ?auto_899781 ?auto_899783 ) ) ( not ( = ?auto_899781 ?auto_899784 ) ) ( not ( = ?auto_899781 ?auto_899785 ) ) ( not ( = ?auto_899781 ?auto_899786 ) ) ( not ( = ?auto_899781 ?auto_899787 ) ) ( not ( = ?auto_899781 ?auto_899788 ) ) ( not ( = ?auto_899781 ?auto_899789 ) ) ( not ( = ?auto_899781 ?auto_899790 ) ) ( not ( = ?auto_899782 ?auto_899783 ) ) ( not ( = ?auto_899782 ?auto_899784 ) ) ( not ( = ?auto_899782 ?auto_899785 ) ) ( not ( = ?auto_899782 ?auto_899786 ) ) ( not ( = ?auto_899782 ?auto_899787 ) ) ( not ( = ?auto_899782 ?auto_899788 ) ) ( not ( = ?auto_899782 ?auto_899789 ) ) ( not ( = ?auto_899782 ?auto_899790 ) ) ( not ( = ?auto_899783 ?auto_899784 ) ) ( not ( = ?auto_899783 ?auto_899785 ) ) ( not ( = ?auto_899783 ?auto_899786 ) ) ( not ( = ?auto_899783 ?auto_899787 ) ) ( not ( = ?auto_899783 ?auto_899788 ) ) ( not ( = ?auto_899783 ?auto_899789 ) ) ( not ( = ?auto_899783 ?auto_899790 ) ) ( not ( = ?auto_899784 ?auto_899785 ) ) ( not ( = ?auto_899784 ?auto_899786 ) ) ( not ( = ?auto_899784 ?auto_899787 ) ) ( not ( = ?auto_899784 ?auto_899788 ) ) ( not ( = ?auto_899784 ?auto_899789 ) ) ( not ( = ?auto_899784 ?auto_899790 ) ) ( not ( = ?auto_899785 ?auto_899786 ) ) ( not ( = ?auto_899785 ?auto_899787 ) ) ( not ( = ?auto_899785 ?auto_899788 ) ) ( not ( = ?auto_899785 ?auto_899789 ) ) ( not ( = ?auto_899785 ?auto_899790 ) ) ( not ( = ?auto_899786 ?auto_899787 ) ) ( not ( = ?auto_899786 ?auto_899788 ) ) ( not ( = ?auto_899786 ?auto_899789 ) ) ( not ( = ?auto_899786 ?auto_899790 ) ) ( not ( = ?auto_899787 ?auto_899788 ) ) ( not ( = ?auto_899787 ?auto_899789 ) ) ( not ( = ?auto_899787 ?auto_899790 ) ) ( not ( = ?auto_899788 ?auto_899789 ) ) ( not ( = ?auto_899788 ?auto_899790 ) ) ( not ( = ?auto_899789 ?auto_899790 ) ) ( ON ?auto_899788 ?auto_899789 ) ( CLEAR ?auto_899786 ) ( ON ?auto_899787 ?auto_899788 ) ( CLEAR ?auto_899787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_899779 ?auto_899780 ?auto_899781 ?auto_899782 ?auto_899783 ?auto_899784 ?auto_899785 ?auto_899786 ?auto_899787 )
      ( MAKE-11PILE ?auto_899779 ?auto_899780 ?auto_899781 ?auto_899782 ?auto_899783 ?auto_899784 ?auto_899785 ?auto_899786 ?auto_899787 ?auto_899788 ?auto_899789 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_899825 - BLOCK
      ?auto_899826 - BLOCK
      ?auto_899827 - BLOCK
      ?auto_899828 - BLOCK
      ?auto_899829 - BLOCK
      ?auto_899830 - BLOCK
      ?auto_899831 - BLOCK
      ?auto_899832 - BLOCK
      ?auto_899833 - BLOCK
      ?auto_899834 - BLOCK
      ?auto_899835 - BLOCK
    )
    :vars
    (
      ?auto_899836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899835 ?auto_899836 ) ( ON-TABLE ?auto_899825 ) ( ON ?auto_899826 ?auto_899825 ) ( ON ?auto_899827 ?auto_899826 ) ( ON ?auto_899828 ?auto_899827 ) ( ON ?auto_899829 ?auto_899828 ) ( ON ?auto_899830 ?auto_899829 ) ( ON ?auto_899831 ?auto_899830 ) ( not ( = ?auto_899825 ?auto_899826 ) ) ( not ( = ?auto_899825 ?auto_899827 ) ) ( not ( = ?auto_899825 ?auto_899828 ) ) ( not ( = ?auto_899825 ?auto_899829 ) ) ( not ( = ?auto_899825 ?auto_899830 ) ) ( not ( = ?auto_899825 ?auto_899831 ) ) ( not ( = ?auto_899825 ?auto_899832 ) ) ( not ( = ?auto_899825 ?auto_899833 ) ) ( not ( = ?auto_899825 ?auto_899834 ) ) ( not ( = ?auto_899825 ?auto_899835 ) ) ( not ( = ?auto_899825 ?auto_899836 ) ) ( not ( = ?auto_899826 ?auto_899827 ) ) ( not ( = ?auto_899826 ?auto_899828 ) ) ( not ( = ?auto_899826 ?auto_899829 ) ) ( not ( = ?auto_899826 ?auto_899830 ) ) ( not ( = ?auto_899826 ?auto_899831 ) ) ( not ( = ?auto_899826 ?auto_899832 ) ) ( not ( = ?auto_899826 ?auto_899833 ) ) ( not ( = ?auto_899826 ?auto_899834 ) ) ( not ( = ?auto_899826 ?auto_899835 ) ) ( not ( = ?auto_899826 ?auto_899836 ) ) ( not ( = ?auto_899827 ?auto_899828 ) ) ( not ( = ?auto_899827 ?auto_899829 ) ) ( not ( = ?auto_899827 ?auto_899830 ) ) ( not ( = ?auto_899827 ?auto_899831 ) ) ( not ( = ?auto_899827 ?auto_899832 ) ) ( not ( = ?auto_899827 ?auto_899833 ) ) ( not ( = ?auto_899827 ?auto_899834 ) ) ( not ( = ?auto_899827 ?auto_899835 ) ) ( not ( = ?auto_899827 ?auto_899836 ) ) ( not ( = ?auto_899828 ?auto_899829 ) ) ( not ( = ?auto_899828 ?auto_899830 ) ) ( not ( = ?auto_899828 ?auto_899831 ) ) ( not ( = ?auto_899828 ?auto_899832 ) ) ( not ( = ?auto_899828 ?auto_899833 ) ) ( not ( = ?auto_899828 ?auto_899834 ) ) ( not ( = ?auto_899828 ?auto_899835 ) ) ( not ( = ?auto_899828 ?auto_899836 ) ) ( not ( = ?auto_899829 ?auto_899830 ) ) ( not ( = ?auto_899829 ?auto_899831 ) ) ( not ( = ?auto_899829 ?auto_899832 ) ) ( not ( = ?auto_899829 ?auto_899833 ) ) ( not ( = ?auto_899829 ?auto_899834 ) ) ( not ( = ?auto_899829 ?auto_899835 ) ) ( not ( = ?auto_899829 ?auto_899836 ) ) ( not ( = ?auto_899830 ?auto_899831 ) ) ( not ( = ?auto_899830 ?auto_899832 ) ) ( not ( = ?auto_899830 ?auto_899833 ) ) ( not ( = ?auto_899830 ?auto_899834 ) ) ( not ( = ?auto_899830 ?auto_899835 ) ) ( not ( = ?auto_899830 ?auto_899836 ) ) ( not ( = ?auto_899831 ?auto_899832 ) ) ( not ( = ?auto_899831 ?auto_899833 ) ) ( not ( = ?auto_899831 ?auto_899834 ) ) ( not ( = ?auto_899831 ?auto_899835 ) ) ( not ( = ?auto_899831 ?auto_899836 ) ) ( not ( = ?auto_899832 ?auto_899833 ) ) ( not ( = ?auto_899832 ?auto_899834 ) ) ( not ( = ?auto_899832 ?auto_899835 ) ) ( not ( = ?auto_899832 ?auto_899836 ) ) ( not ( = ?auto_899833 ?auto_899834 ) ) ( not ( = ?auto_899833 ?auto_899835 ) ) ( not ( = ?auto_899833 ?auto_899836 ) ) ( not ( = ?auto_899834 ?auto_899835 ) ) ( not ( = ?auto_899834 ?auto_899836 ) ) ( not ( = ?auto_899835 ?auto_899836 ) ) ( ON ?auto_899834 ?auto_899835 ) ( ON ?auto_899833 ?auto_899834 ) ( CLEAR ?auto_899831 ) ( ON ?auto_899832 ?auto_899833 ) ( CLEAR ?auto_899832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_899825 ?auto_899826 ?auto_899827 ?auto_899828 ?auto_899829 ?auto_899830 ?auto_899831 ?auto_899832 )
      ( MAKE-11PILE ?auto_899825 ?auto_899826 ?auto_899827 ?auto_899828 ?auto_899829 ?auto_899830 ?auto_899831 ?auto_899832 ?auto_899833 ?auto_899834 ?auto_899835 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_899871 - BLOCK
      ?auto_899872 - BLOCK
      ?auto_899873 - BLOCK
      ?auto_899874 - BLOCK
      ?auto_899875 - BLOCK
      ?auto_899876 - BLOCK
      ?auto_899877 - BLOCK
      ?auto_899878 - BLOCK
      ?auto_899879 - BLOCK
      ?auto_899880 - BLOCK
      ?auto_899881 - BLOCK
    )
    :vars
    (
      ?auto_899882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899881 ?auto_899882 ) ( ON-TABLE ?auto_899871 ) ( ON ?auto_899872 ?auto_899871 ) ( ON ?auto_899873 ?auto_899872 ) ( ON ?auto_899874 ?auto_899873 ) ( ON ?auto_899875 ?auto_899874 ) ( ON ?auto_899876 ?auto_899875 ) ( not ( = ?auto_899871 ?auto_899872 ) ) ( not ( = ?auto_899871 ?auto_899873 ) ) ( not ( = ?auto_899871 ?auto_899874 ) ) ( not ( = ?auto_899871 ?auto_899875 ) ) ( not ( = ?auto_899871 ?auto_899876 ) ) ( not ( = ?auto_899871 ?auto_899877 ) ) ( not ( = ?auto_899871 ?auto_899878 ) ) ( not ( = ?auto_899871 ?auto_899879 ) ) ( not ( = ?auto_899871 ?auto_899880 ) ) ( not ( = ?auto_899871 ?auto_899881 ) ) ( not ( = ?auto_899871 ?auto_899882 ) ) ( not ( = ?auto_899872 ?auto_899873 ) ) ( not ( = ?auto_899872 ?auto_899874 ) ) ( not ( = ?auto_899872 ?auto_899875 ) ) ( not ( = ?auto_899872 ?auto_899876 ) ) ( not ( = ?auto_899872 ?auto_899877 ) ) ( not ( = ?auto_899872 ?auto_899878 ) ) ( not ( = ?auto_899872 ?auto_899879 ) ) ( not ( = ?auto_899872 ?auto_899880 ) ) ( not ( = ?auto_899872 ?auto_899881 ) ) ( not ( = ?auto_899872 ?auto_899882 ) ) ( not ( = ?auto_899873 ?auto_899874 ) ) ( not ( = ?auto_899873 ?auto_899875 ) ) ( not ( = ?auto_899873 ?auto_899876 ) ) ( not ( = ?auto_899873 ?auto_899877 ) ) ( not ( = ?auto_899873 ?auto_899878 ) ) ( not ( = ?auto_899873 ?auto_899879 ) ) ( not ( = ?auto_899873 ?auto_899880 ) ) ( not ( = ?auto_899873 ?auto_899881 ) ) ( not ( = ?auto_899873 ?auto_899882 ) ) ( not ( = ?auto_899874 ?auto_899875 ) ) ( not ( = ?auto_899874 ?auto_899876 ) ) ( not ( = ?auto_899874 ?auto_899877 ) ) ( not ( = ?auto_899874 ?auto_899878 ) ) ( not ( = ?auto_899874 ?auto_899879 ) ) ( not ( = ?auto_899874 ?auto_899880 ) ) ( not ( = ?auto_899874 ?auto_899881 ) ) ( not ( = ?auto_899874 ?auto_899882 ) ) ( not ( = ?auto_899875 ?auto_899876 ) ) ( not ( = ?auto_899875 ?auto_899877 ) ) ( not ( = ?auto_899875 ?auto_899878 ) ) ( not ( = ?auto_899875 ?auto_899879 ) ) ( not ( = ?auto_899875 ?auto_899880 ) ) ( not ( = ?auto_899875 ?auto_899881 ) ) ( not ( = ?auto_899875 ?auto_899882 ) ) ( not ( = ?auto_899876 ?auto_899877 ) ) ( not ( = ?auto_899876 ?auto_899878 ) ) ( not ( = ?auto_899876 ?auto_899879 ) ) ( not ( = ?auto_899876 ?auto_899880 ) ) ( not ( = ?auto_899876 ?auto_899881 ) ) ( not ( = ?auto_899876 ?auto_899882 ) ) ( not ( = ?auto_899877 ?auto_899878 ) ) ( not ( = ?auto_899877 ?auto_899879 ) ) ( not ( = ?auto_899877 ?auto_899880 ) ) ( not ( = ?auto_899877 ?auto_899881 ) ) ( not ( = ?auto_899877 ?auto_899882 ) ) ( not ( = ?auto_899878 ?auto_899879 ) ) ( not ( = ?auto_899878 ?auto_899880 ) ) ( not ( = ?auto_899878 ?auto_899881 ) ) ( not ( = ?auto_899878 ?auto_899882 ) ) ( not ( = ?auto_899879 ?auto_899880 ) ) ( not ( = ?auto_899879 ?auto_899881 ) ) ( not ( = ?auto_899879 ?auto_899882 ) ) ( not ( = ?auto_899880 ?auto_899881 ) ) ( not ( = ?auto_899880 ?auto_899882 ) ) ( not ( = ?auto_899881 ?auto_899882 ) ) ( ON ?auto_899880 ?auto_899881 ) ( ON ?auto_899879 ?auto_899880 ) ( ON ?auto_899878 ?auto_899879 ) ( CLEAR ?auto_899876 ) ( ON ?auto_899877 ?auto_899878 ) ( CLEAR ?auto_899877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_899871 ?auto_899872 ?auto_899873 ?auto_899874 ?auto_899875 ?auto_899876 ?auto_899877 )
      ( MAKE-11PILE ?auto_899871 ?auto_899872 ?auto_899873 ?auto_899874 ?auto_899875 ?auto_899876 ?auto_899877 ?auto_899878 ?auto_899879 ?auto_899880 ?auto_899881 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_899917 - BLOCK
      ?auto_899918 - BLOCK
      ?auto_899919 - BLOCK
      ?auto_899920 - BLOCK
      ?auto_899921 - BLOCK
      ?auto_899922 - BLOCK
      ?auto_899923 - BLOCK
      ?auto_899924 - BLOCK
      ?auto_899925 - BLOCK
      ?auto_899926 - BLOCK
      ?auto_899927 - BLOCK
    )
    :vars
    (
      ?auto_899928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899927 ?auto_899928 ) ( ON-TABLE ?auto_899917 ) ( ON ?auto_899918 ?auto_899917 ) ( ON ?auto_899919 ?auto_899918 ) ( ON ?auto_899920 ?auto_899919 ) ( ON ?auto_899921 ?auto_899920 ) ( not ( = ?auto_899917 ?auto_899918 ) ) ( not ( = ?auto_899917 ?auto_899919 ) ) ( not ( = ?auto_899917 ?auto_899920 ) ) ( not ( = ?auto_899917 ?auto_899921 ) ) ( not ( = ?auto_899917 ?auto_899922 ) ) ( not ( = ?auto_899917 ?auto_899923 ) ) ( not ( = ?auto_899917 ?auto_899924 ) ) ( not ( = ?auto_899917 ?auto_899925 ) ) ( not ( = ?auto_899917 ?auto_899926 ) ) ( not ( = ?auto_899917 ?auto_899927 ) ) ( not ( = ?auto_899917 ?auto_899928 ) ) ( not ( = ?auto_899918 ?auto_899919 ) ) ( not ( = ?auto_899918 ?auto_899920 ) ) ( not ( = ?auto_899918 ?auto_899921 ) ) ( not ( = ?auto_899918 ?auto_899922 ) ) ( not ( = ?auto_899918 ?auto_899923 ) ) ( not ( = ?auto_899918 ?auto_899924 ) ) ( not ( = ?auto_899918 ?auto_899925 ) ) ( not ( = ?auto_899918 ?auto_899926 ) ) ( not ( = ?auto_899918 ?auto_899927 ) ) ( not ( = ?auto_899918 ?auto_899928 ) ) ( not ( = ?auto_899919 ?auto_899920 ) ) ( not ( = ?auto_899919 ?auto_899921 ) ) ( not ( = ?auto_899919 ?auto_899922 ) ) ( not ( = ?auto_899919 ?auto_899923 ) ) ( not ( = ?auto_899919 ?auto_899924 ) ) ( not ( = ?auto_899919 ?auto_899925 ) ) ( not ( = ?auto_899919 ?auto_899926 ) ) ( not ( = ?auto_899919 ?auto_899927 ) ) ( not ( = ?auto_899919 ?auto_899928 ) ) ( not ( = ?auto_899920 ?auto_899921 ) ) ( not ( = ?auto_899920 ?auto_899922 ) ) ( not ( = ?auto_899920 ?auto_899923 ) ) ( not ( = ?auto_899920 ?auto_899924 ) ) ( not ( = ?auto_899920 ?auto_899925 ) ) ( not ( = ?auto_899920 ?auto_899926 ) ) ( not ( = ?auto_899920 ?auto_899927 ) ) ( not ( = ?auto_899920 ?auto_899928 ) ) ( not ( = ?auto_899921 ?auto_899922 ) ) ( not ( = ?auto_899921 ?auto_899923 ) ) ( not ( = ?auto_899921 ?auto_899924 ) ) ( not ( = ?auto_899921 ?auto_899925 ) ) ( not ( = ?auto_899921 ?auto_899926 ) ) ( not ( = ?auto_899921 ?auto_899927 ) ) ( not ( = ?auto_899921 ?auto_899928 ) ) ( not ( = ?auto_899922 ?auto_899923 ) ) ( not ( = ?auto_899922 ?auto_899924 ) ) ( not ( = ?auto_899922 ?auto_899925 ) ) ( not ( = ?auto_899922 ?auto_899926 ) ) ( not ( = ?auto_899922 ?auto_899927 ) ) ( not ( = ?auto_899922 ?auto_899928 ) ) ( not ( = ?auto_899923 ?auto_899924 ) ) ( not ( = ?auto_899923 ?auto_899925 ) ) ( not ( = ?auto_899923 ?auto_899926 ) ) ( not ( = ?auto_899923 ?auto_899927 ) ) ( not ( = ?auto_899923 ?auto_899928 ) ) ( not ( = ?auto_899924 ?auto_899925 ) ) ( not ( = ?auto_899924 ?auto_899926 ) ) ( not ( = ?auto_899924 ?auto_899927 ) ) ( not ( = ?auto_899924 ?auto_899928 ) ) ( not ( = ?auto_899925 ?auto_899926 ) ) ( not ( = ?auto_899925 ?auto_899927 ) ) ( not ( = ?auto_899925 ?auto_899928 ) ) ( not ( = ?auto_899926 ?auto_899927 ) ) ( not ( = ?auto_899926 ?auto_899928 ) ) ( not ( = ?auto_899927 ?auto_899928 ) ) ( ON ?auto_899926 ?auto_899927 ) ( ON ?auto_899925 ?auto_899926 ) ( ON ?auto_899924 ?auto_899925 ) ( ON ?auto_899923 ?auto_899924 ) ( CLEAR ?auto_899921 ) ( ON ?auto_899922 ?auto_899923 ) ( CLEAR ?auto_899922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_899917 ?auto_899918 ?auto_899919 ?auto_899920 ?auto_899921 ?auto_899922 )
      ( MAKE-11PILE ?auto_899917 ?auto_899918 ?auto_899919 ?auto_899920 ?auto_899921 ?auto_899922 ?auto_899923 ?auto_899924 ?auto_899925 ?auto_899926 ?auto_899927 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_899963 - BLOCK
      ?auto_899964 - BLOCK
      ?auto_899965 - BLOCK
      ?auto_899966 - BLOCK
      ?auto_899967 - BLOCK
      ?auto_899968 - BLOCK
      ?auto_899969 - BLOCK
      ?auto_899970 - BLOCK
      ?auto_899971 - BLOCK
      ?auto_899972 - BLOCK
      ?auto_899973 - BLOCK
    )
    :vars
    (
      ?auto_899974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_899973 ?auto_899974 ) ( ON-TABLE ?auto_899963 ) ( ON ?auto_899964 ?auto_899963 ) ( ON ?auto_899965 ?auto_899964 ) ( ON ?auto_899966 ?auto_899965 ) ( not ( = ?auto_899963 ?auto_899964 ) ) ( not ( = ?auto_899963 ?auto_899965 ) ) ( not ( = ?auto_899963 ?auto_899966 ) ) ( not ( = ?auto_899963 ?auto_899967 ) ) ( not ( = ?auto_899963 ?auto_899968 ) ) ( not ( = ?auto_899963 ?auto_899969 ) ) ( not ( = ?auto_899963 ?auto_899970 ) ) ( not ( = ?auto_899963 ?auto_899971 ) ) ( not ( = ?auto_899963 ?auto_899972 ) ) ( not ( = ?auto_899963 ?auto_899973 ) ) ( not ( = ?auto_899963 ?auto_899974 ) ) ( not ( = ?auto_899964 ?auto_899965 ) ) ( not ( = ?auto_899964 ?auto_899966 ) ) ( not ( = ?auto_899964 ?auto_899967 ) ) ( not ( = ?auto_899964 ?auto_899968 ) ) ( not ( = ?auto_899964 ?auto_899969 ) ) ( not ( = ?auto_899964 ?auto_899970 ) ) ( not ( = ?auto_899964 ?auto_899971 ) ) ( not ( = ?auto_899964 ?auto_899972 ) ) ( not ( = ?auto_899964 ?auto_899973 ) ) ( not ( = ?auto_899964 ?auto_899974 ) ) ( not ( = ?auto_899965 ?auto_899966 ) ) ( not ( = ?auto_899965 ?auto_899967 ) ) ( not ( = ?auto_899965 ?auto_899968 ) ) ( not ( = ?auto_899965 ?auto_899969 ) ) ( not ( = ?auto_899965 ?auto_899970 ) ) ( not ( = ?auto_899965 ?auto_899971 ) ) ( not ( = ?auto_899965 ?auto_899972 ) ) ( not ( = ?auto_899965 ?auto_899973 ) ) ( not ( = ?auto_899965 ?auto_899974 ) ) ( not ( = ?auto_899966 ?auto_899967 ) ) ( not ( = ?auto_899966 ?auto_899968 ) ) ( not ( = ?auto_899966 ?auto_899969 ) ) ( not ( = ?auto_899966 ?auto_899970 ) ) ( not ( = ?auto_899966 ?auto_899971 ) ) ( not ( = ?auto_899966 ?auto_899972 ) ) ( not ( = ?auto_899966 ?auto_899973 ) ) ( not ( = ?auto_899966 ?auto_899974 ) ) ( not ( = ?auto_899967 ?auto_899968 ) ) ( not ( = ?auto_899967 ?auto_899969 ) ) ( not ( = ?auto_899967 ?auto_899970 ) ) ( not ( = ?auto_899967 ?auto_899971 ) ) ( not ( = ?auto_899967 ?auto_899972 ) ) ( not ( = ?auto_899967 ?auto_899973 ) ) ( not ( = ?auto_899967 ?auto_899974 ) ) ( not ( = ?auto_899968 ?auto_899969 ) ) ( not ( = ?auto_899968 ?auto_899970 ) ) ( not ( = ?auto_899968 ?auto_899971 ) ) ( not ( = ?auto_899968 ?auto_899972 ) ) ( not ( = ?auto_899968 ?auto_899973 ) ) ( not ( = ?auto_899968 ?auto_899974 ) ) ( not ( = ?auto_899969 ?auto_899970 ) ) ( not ( = ?auto_899969 ?auto_899971 ) ) ( not ( = ?auto_899969 ?auto_899972 ) ) ( not ( = ?auto_899969 ?auto_899973 ) ) ( not ( = ?auto_899969 ?auto_899974 ) ) ( not ( = ?auto_899970 ?auto_899971 ) ) ( not ( = ?auto_899970 ?auto_899972 ) ) ( not ( = ?auto_899970 ?auto_899973 ) ) ( not ( = ?auto_899970 ?auto_899974 ) ) ( not ( = ?auto_899971 ?auto_899972 ) ) ( not ( = ?auto_899971 ?auto_899973 ) ) ( not ( = ?auto_899971 ?auto_899974 ) ) ( not ( = ?auto_899972 ?auto_899973 ) ) ( not ( = ?auto_899972 ?auto_899974 ) ) ( not ( = ?auto_899973 ?auto_899974 ) ) ( ON ?auto_899972 ?auto_899973 ) ( ON ?auto_899971 ?auto_899972 ) ( ON ?auto_899970 ?auto_899971 ) ( ON ?auto_899969 ?auto_899970 ) ( ON ?auto_899968 ?auto_899969 ) ( CLEAR ?auto_899966 ) ( ON ?auto_899967 ?auto_899968 ) ( CLEAR ?auto_899967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_899963 ?auto_899964 ?auto_899965 ?auto_899966 ?auto_899967 )
      ( MAKE-11PILE ?auto_899963 ?auto_899964 ?auto_899965 ?auto_899966 ?auto_899967 ?auto_899968 ?auto_899969 ?auto_899970 ?auto_899971 ?auto_899972 ?auto_899973 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_900009 - BLOCK
      ?auto_900010 - BLOCK
      ?auto_900011 - BLOCK
      ?auto_900012 - BLOCK
      ?auto_900013 - BLOCK
      ?auto_900014 - BLOCK
      ?auto_900015 - BLOCK
      ?auto_900016 - BLOCK
      ?auto_900017 - BLOCK
      ?auto_900018 - BLOCK
      ?auto_900019 - BLOCK
    )
    :vars
    (
      ?auto_900020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900019 ?auto_900020 ) ( ON-TABLE ?auto_900009 ) ( ON ?auto_900010 ?auto_900009 ) ( ON ?auto_900011 ?auto_900010 ) ( not ( = ?auto_900009 ?auto_900010 ) ) ( not ( = ?auto_900009 ?auto_900011 ) ) ( not ( = ?auto_900009 ?auto_900012 ) ) ( not ( = ?auto_900009 ?auto_900013 ) ) ( not ( = ?auto_900009 ?auto_900014 ) ) ( not ( = ?auto_900009 ?auto_900015 ) ) ( not ( = ?auto_900009 ?auto_900016 ) ) ( not ( = ?auto_900009 ?auto_900017 ) ) ( not ( = ?auto_900009 ?auto_900018 ) ) ( not ( = ?auto_900009 ?auto_900019 ) ) ( not ( = ?auto_900009 ?auto_900020 ) ) ( not ( = ?auto_900010 ?auto_900011 ) ) ( not ( = ?auto_900010 ?auto_900012 ) ) ( not ( = ?auto_900010 ?auto_900013 ) ) ( not ( = ?auto_900010 ?auto_900014 ) ) ( not ( = ?auto_900010 ?auto_900015 ) ) ( not ( = ?auto_900010 ?auto_900016 ) ) ( not ( = ?auto_900010 ?auto_900017 ) ) ( not ( = ?auto_900010 ?auto_900018 ) ) ( not ( = ?auto_900010 ?auto_900019 ) ) ( not ( = ?auto_900010 ?auto_900020 ) ) ( not ( = ?auto_900011 ?auto_900012 ) ) ( not ( = ?auto_900011 ?auto_900013 ) ) ( not ( = ?auto_900011 ?auto_900014 ) ) ( not ( = ?auto_900011 ?auto_900015 ) ) ( not ( = ?auto_900011 ?auto_900016 ) ) ( not ( = ?auto_900011 ?auto_900017 ) ) ( not ( = ?auto_900011 ?auto_900018 ) ) ( not ( = ?auto_900011 ?auto_900019 ) ) ( not ( = ?auto_900011 ?auto_900020 ) ) ( not ( = ?auto_900012 ?auto_900013 ) ) ( not ( = ?auto_900012 ?auto_900014 ) ) ( not ( = ?auto_900012 ?auto_900015 ) ) ( not ( = ?auto_900012 ?auto_900016 ) ) ( not ( = ?auto_900012 ?auto_900017 ) ) ( not ( = ?auto_900012 ?auto_900018 ) ) ( not ( = ?auto_900012 ?auto_900019 ) ) ( not ( = ?auto_900012 ?auto_900020 ) ) ( not ( = ?auto_900013 ?auto_900014 ) ) ( not ( = ?auto_900013 ?auto_900015 ) ) ( not ( = ?auto_900013 ?auto_900016 ) ) ( not ( = ?auto_900013 ?auto_900017 ) ) ( not ( = ?auto_900013 ?auto_900018 ) ) ( not ( = ?auto_900013 ?auto_900019 ) ) ( not ( = ?auto_900013 ?auto_900020 ) ) ( not ( = ?auto_900014 ?auto_900015 ) ) ( not ( = ?auto_900014 ?auto_900016 ) ) ( not ( = ?auto_900014 ?auto_900017 ) ) ( not ( = ?auto_900014 ?auto_900018 ) ) ( not ( = ?auto_900014 ?auto_900019 ) ) ( not ( = ?auto_900014 ?auto_900020 ) ) ( not ( = ?auto_900015 ?auto_900016 ) ) ( not ( = ?auto_900015 ?auto_900017 ) ) ( not ( = ?auto_900015 ?auto_900018 ) ) ( not ( = ?auto_900015 ?auto_900019 ) ) ( not ( = ?auto_900015 ?auto_900020 ) ) ( not ( = ?auto_900016 ?auto_900017 ) ) ( not ( = ?auto_900016 ?auto_900018 ) ) ( not ( = ?auto_900016 ?auto_900019 ) ) ( not ( = ?auto_900016 ?auto_900020 ) ) ( not ( = ?auto_900017 ?auto_900018 ) ) ( not ( = ?auto_900017 ?auto_900019 ) ) ( not ( = ?auto_900017 ?auto_900020 ) ) ( not ( = ?auto_900018 ?auto_900019 ) ) ( not ( = ?auto_900018 ?auto_900020 ) ) ( not ( = ?auto_900019 ?auto_900020 ) ) ( ON ?auto_900018 ?auto_900019 ) ( ON ?auto_900017 ?auto_900018 ) ( ON ?auto_900016 ?auto_900017 ) ( ON ?auto_900015 ?auto_900016 ) ( ON ?auto_900014 ?auto_900015 ) ( ON ?auto_900013 ?auto_900014 ) ( CLEAR ?auto_900011 ) ( ON ?auto_900012 ?auto_900013 ) ( CLEAR ?auto_900012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_900009 ?auto_900010 ?auto_900011 ?auto_900012 )
      ( MAKE-11PILE ?auto_900009 ?auto_900010 ?auto_900011 ?auto_900012 ?auto_900013 ?auto_900014 ?auto_900015 ?auto_900016 ?auto_900017 ?auto_900018 ?auto_900019 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_900055 - BLOCK
      ?auto_900056 - BLOCK
      ?auto_900057 - BLOCK
      ?auto_900058 - BLOCK
      ?auto_900059 - BLOCK
      ?auto_900060 - BLOCK
      ?auto_900061 - BLOCK
      ?auto_900062 - BLOCK
      ?auto_900063 - BLOCK
      ?auto_900064 - BLOCK
      ?auto_900065 - BLOCK
    )
    :vars
    (
      ?auto_900066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900065 ?auto_900066 ) ( ON-TABLE ?auto_900055 ) ( ON ?auto_900056 ?auto_900055 ) ( not ( = ?auto_900055 ?auto_900056 ) ) ( not ( = ?auto_900055 ?auto_900057 ) ) ( not ( = ?auto_900055 ?auto_900058 ) ) ( not ( = ?auto_900055 ?auto_900059 ) ) ( not ( = ?auto_900055 ?auto_900060 ) ) ( not ( = ?auto_900055 ?auto_900061 ) ) ( not ( = ?auto_900055 ?auto_900062 ) ) ( not ( = ?auto_900055 ?auto_900063 ) ) ( not ( = ?auto_900055 ?auto_900064 ) ) ( not ( = ?auto_900055 ?auto_900065 ) ) ( not ( = ?auto_900055 ?auto_900066 ) ) ( not ( = ?auto_900056 ?auto_900057 ) ) ( not ( = ?auto_900056 ?auto_900058 ) ) ( not ( = ?auto_900056 ?auto_900059 ) ) ( not ( = ?auto_900056 ?auto_900060 ) ) ( not ( = ?auto_900056 ?auto_900061 ) ) ( not ( = ?auto_900056 ?auto_900062 ) ) ( not ( = ?auto_900056 ?auto_900063 ) ) ( not ( = ?auto_900056 ?auto_900064 ) ) ( not ( = ?auto_900056 ?auto_900065 ) ) ( not ( = ?auto_900056 ?auto_900066 ) ) ( not ( = ?auto_900057 ?auto_900058 ) ) ( not ( = ?auto_900057 ?auto_900059 ) ) ( not ( = ?auto_900057 ?auto_900060 ) ) ( not ( = ?auto_900057 ?auto_900061 ) ) ( not ( = ?auto_900057 ?auto_900062 ) ) ( not ( = ?auto_900057 ?auto_900063 ) ) ( not ( = ?auto_900057 ?auto_900064 ) ) ( not ( = ?auto_900057 ?auto_900065 ) ) ( not ( = ?auto_900057 ?auto_900066 ) ) ( not ( = ?auto_900058 ?auto_900059 ) ) ( not ( = ?auto_900058 ?auto_900060 ) ) ( not ( = ?auto_900058 ?auto_900061 ) ) ( not ( = ?auto_900058 ?auto_900062 ) ) ( not ( = ?auto_900058 ?auto_900063 ) ) ( not ( = ?auto_900058 ?auto_900064 ) ) ( not ( = ?auto_900058 ?auto_900065 ) ) ( not ( = ?auto_900058 ?auto_900066 ) ) ( not ( = ?auto_900059 ?auto_900060 ) ) ( not ( = ?auto_900059 ?auto_900061 ) ) ( not ( = ?auto_900059 ?auto_900062 ) ) ( not ( = ?auto_900059 ?auto_900063 ) ) ( not ( = ?auto_900059 ?auto_900064 ) ) ( not ( = ?auto_900059 ?auto_900065 ) ) ( not ( = ?auto_900059 ?auto_900066 ) ) ( not ( = ?auto_900060 ?auto_900061 ) ) ( not ( = ?auto_900060 ?auto_900062 ) ) ( not ( = ?auto_900060 ?auto_900063 ) ) ( not ( = ?auto_900060 ?auto_900064 ) ) ( not ( = ?auto_900060 ?auto_900065 ) ) ( not ( = ?auto_900060 ?auto_900066 ) ) ( not ( = ?auto_900061 ?auto_900062 ) ) ( not ( = ?auto_900061 ?auto_900063 ) ) ( not ( = ?auto_900061 ?auto_900064 ) ) ( not ( = ?auto_900061 ?auto_900065 ) ) ( not ( = ?auto_900061 ?auto_900066 ) ) ( not ( = ?auto_900062 ?auto_900063 ) ) ( not ( = ?auto_900062 ?auto_900064 ) ) ( not ( = ?auto_900062 ?auto_900065 ) ) ( not ( = ?auto_900062 ?auto_900066 ) ) ( not ( = ?auto_900063 ?auto_900064 ) ) ( not ( = ?auto_900063 ?auto_900065 ) ) ( not ( = ?auto_900063 ?auto_900066 ) ) ( not ( = ?auto_900064 ?auto_900065 ) ) ( not ( = ?auto_900064 ?auto_900066 ) ) ( not ( = ?auto_900065 ?auto_900066 ) ) ( ON ?auto_900064 ?auto_900065 ) ( ON ?auto_900063 ?auto_900064 ) ( ON ?auto_900062 ?auto_900063 ) ( ON ?auto_900061 ?auto_900062 ) ( ON ?auto_900060 ?auto_900061 ) ( ON ?auto_900059 ?auto_900060 ) ( ON ?auto_900058 ?auto_900059 ) ( CLEAR ?auto_900056 ) ( ON ?auto_900057 ?auto_900058 ) ( CLEAR ?auto_900057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_900055 ?auto_900056 ?auto_900057 )
      ( MAKE-11PILE ?auto_900055 ?auto_900056 ?auto_900057 ?auto_900058 ?auto_900059 ?auto_900060 ?auto_900061 ?auto_900062 ?auto_900063 ?auto_900064 ?auto_900065 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_900101 - BLOCK
      ?auto_900102 - BLOCK
      ?auto_900103 - BLOCK
      ?auto_900104 - BLOCK
      ?auto_900105 - BLOCK
      ?auto_900106 - BLOCK
      ?auto_900107 - BLOCK
      ?auto_900108 - BLOCK
      ?auto_900109 - BLOCK
      ?auto_900110 - BLOCK
      ?auto_900111 - BLOCK
    )
    :vars
    (
      ?auto_900112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900111 ?auto_900112 ) ( ON-TABLE ?auto_900101 ) ( not ( = ?auto_900101 ?auto_900102 ) ) ( not ( = ?auto_900101 ?auto_900103 ) ) ( not ( = ?auto_900101 ?auto_900104 ) ) ( not ( = ?auto_900101 ?auto_900105 ) ) ( not ( = ?auto_900101 ?auto_900106 ) ) ( not ( = ?auto_900101 ?auto_900107 ) ) ( not ( = ?auto_900101 ?auto_900108 ) ) ( not ( = ?auto_900101 ?auto_900109 ) ) ( not ( = ?auto_900101 ?auto_900110 ) ) ( not ( = ?auto_900101 ?auto_900111 ) ) ( not ( = ?auto_900101 ?auto_900112 ) ) ( not ( = ?auto_900102 ?auto_900103 ) ) ( not ( = ?auto_900102 ?auto_900104 ) ) ( not ( = ?auto_900102 ?auto_900105 ) ) ( not ( = ?auto_900102 ?auto_900106 ) ) ( not ( = ?auto_900102 ?auto_900107 ) ) ( not ( = ?auto_900102 ?auto_900108 ) ) ( not ( = ?auto_900102 ?auto_900109 ) ) ( not ( = ?auto_900102 ?auto_900110 ) ) ( not ( = ?auto_900102 ?auto_900111 ) ) ( not ( = ?auto_900102 ?auto_900112 ) ) ( not ( = ?auto_900103 ?auto_900104 ) ) ( not ( = ?auto_900103 ?auto_900105 ) ) ( not ( = ?auto_900103 ?auto_900106 ) ) ( not ( = ?auto_900103 ?auto_900107 ) ) ( not ( = ?auto_900103 ?auto_900108 ) ) ( not ( = ?auto_900103 ?auto_900109 ) ) ( not ( = ?auto_900103 ?auto_900110 ) ) ( not ( = ?auto_900103 ?auto_900111 ) ) ( not ( = ?auto_900103 ?auto_900112 ) ) ( not ( = ?auto_900104 ?auto_900105 ) ) ( not ( = ?auto_900104 ?auto_900106 ) ) ( not ( = ?auto_900104 ?auto_900107 ) ) ( not ( = ?auto_900104 ?auto_900108 ) ) ( not ( = ?auto_900104 ?auto_900109 ) ) ( not ( = ?auto_900104 ?auto_900110 ) ) ( not ( = ?auto_900104 ?auto_900111 ) ) ( not ( = ?auto_900104 ?auto_900112 ) ) ( not ( = ?auto_900105 ?auto_900106 ) ) ( not ( = ?auto_900105 ?auto_900107 ) ) ( not ( = ?auto_900105 ?auto_900108 ) ) ( not ( = ?auto_900105 ?auto_900109 ) ) ( not ( = ?auto_900105 ?auto_900110 ) ) ( not ( = ?auto_900105 ?auto_900111 ) ) ( not ( = ?auto_900105 ?auto_900112 ) ) ( not ( = ?auto_900106 ?auto_900107 ) ) ( not ( = ?auto_900106 ?auto_900108 ) ) ( not ( = ?auto_900106 ?auto_900109 ) ) ( not ( = ?auto_900106 ?auto_900110 ) ) ( not ( = ?auto_900106 ?auto_900111 ) ) ( not ( = ?auto_900106 ?auto_900112 ) ) ( not ( = ?auto_900107 ?auto_900108 ) ) ( not ( = ?auto_900107 ?auto_900109 ) ) ( not ( = ?auto_900107 ?auto_900110 ) ) ( not ( = ?auto_900107 ?auto_900111 ) ) ( not ( = ?auto_900107 ?auto_900112 ) ) ( not ( = ?auto_900108 ?auto_900109 ) ) ( not ( = ?auto_900108 ?auto_900110 ) ) ( not ( = ?auto_900108 ?auto_900111 ) ) ( not ( = ?auto_900108 ?auto_900112 ) ) ( not ( = ?auto_900109 ?auto_900110 ) ) ( not ( = ?auto_900109 ?auto_900111 ) ) ( not ( = ?auto_900109 ?auto_900112 ) ) ( not ( = ?auto_900110 ?auto_900111 ) ) ( not ( = ?auto_900110 ?auto_900112 ) ) ( not ( = ?auto_900111 ?auto_900112 ) ) ( ON ?auto_900110 ?auto_900111 ) ( ON ?auto_900109 ?auto_900110 ) ( ON ?auto_900108 ?auto_900109 ) ( ON ?auto_900107 ?auto_900108 ) ( ON ?auto_900106 ?auto_900107 ) ( ON ?auto_900105 ?auto_900106 ) ( ON ?auto_900104 ?auto_900105 ) ( ON ?auto_900103 ?auto_900104 ) ( CLEAR ?auto_900101 ) ( ON ?auto_900102 ?auto_900103 ) ( CLEAR ?auto_900102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_900101 ?auto_900102 )
      ( MAKE-11PILE ?auto_900101 ?auto_900102 ?auto_900103 ?auto_900104 ?auto_900105 ?auto_900106 ?auto_900107 ?auto_900108 ?auto_900109 ?auto_900110 ?auto_900111 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_900147 - BLOCK
      ?auto_900148 - BLOCK
      ?auto_900149 - BLOCK
      ?auto_900150 - BLOCK
      ?auto_900151 - BLOCK
      ?auto_900152 - BLOCK
      ?auto_900153 - BLOCK
      ?auto_900154 - BLOCK
      ?auto_900155 - BLOCK
      ?auto_900156 - BLOCK
      ?auto_900157 - BLOCK
    )
    :vars
    (
      ?auto_900158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900157 ?auto_900158 ) ( not ( = ?auto_900147 ?auto_900148 ) ) ( not ( = ?auto_900147 ?auto_900149 ) ) ( not ( = ?auto_900147 ?auto_900150 ) ) ( not ( = ?auto_900147 ?auto_900151 ) ) ( not ( = ?auto_900147 ?auto_900152 ) ) ( not ( = ?auto_900147 ?auto_900153 ) ) ( not ( = ?auto_900147 ?auto_900154 ) ) ( not ( = ?auto_900147 ?auto_900155 ) ) ( not ( = ?auto_900147 ?auto_900156 ) ) ( not ( = ?auto_900147 ?auto_900157 ) ) ( not ( = ?auto_900147 ?auto_900158 ) ) ( not ( = ?auto_900148 ?auto_900149 ) ) ( not ( = ?auto_900148 ?auto_900150 ) ) ( not ( = ?auto_900148 ?auto_900151 ) ) ( not ( = ?auto_900148 ?auto_900152 ) ) ( not ( = ?auto_900148 ?auto_900153 ) ) ( not ( = ?auto_900148 ?auto_900154 ) ) ( not ( = ?auto_900148 ?auto_900155 ) ) ( not ( = ?auto_900148 ?auto_900156 ) ) ( not ( = ?auto_900148 ?auto_900157 ) ) ( not ( = ?auto_900148 ?auto_900158 ) ) ( not ( = ?auto_900149 ?auto_900150 ) ) ( not ( = ?auto_900149 ?auto_900151 ) ) ( not ( = ?auto_900149 ?auto_900152 ) ) ( not ( = ?auto_900149 ?auto_900153 ) ) ( not ( = ?auto_900149 ?auto_900154 ) ) ( not ( = ?auto_900149 ?auto_900155 ) ) ( not ( = ?auto_900149 ?auto_900156 ) ) ( not ( = ?auto_900149 ?auto_900157 ) ) ( not ( = ?auto_900149 ?auto_900158 ) ) ( not ( = ?auto_900150 ?auto_900151 ) ) ( not ( = ?auto_900150 ?auto_900152 ) ) ( not ( = ?auto_900150 ?auto_900153 ) ) ( not ( = ?auto_900150 ?auto_900154 ) ) ( not ( = ?auto_900150 ?auto_900155 ) ) ( not ( = ?auto_900150 ?auto_900156 ) ) ( not ( = ?auto_900150 ?auto_900157 ) ) ( not ( = ?auto_900150 ?auto_900158 ) ) ( not ( = ?auto_900151 ?auto_900152 ) ) ( not ( = ?auto_900151 ?auto_900153 ) ) ( not ( = ?auto_900151 ?auto_900154 ) ) ( not ( = ?auto_900151 ?auto_900155 ) ) ( not ( = ?auto_900151 ?auto_900156 ) ) ( not ( = ?auto_900151 ?auto_900157 ) ) ( not ( = ?auto_900151 ?auto_900158 ) ) ( not ( = ?auto_900152 ?auto_900153 ) ) ( not ( = ?auto_900152 ?auto_900154 ) ) ( not ( = ?auto_900152 ?auto_900155 ) ) ( not ( = ?auto_900152 ?auto_900156 ) ) ( not ( = ?auto_900152 ?auto_900157 ) ) ( not ( = ?auto_900152 ?auto_900158 ) ) ( not ( = ?auto_900153 ?auto_900154 ) ) ( not ( = ?auto_900153 ?auto_900155 ) ) ( not ( = ?auto_900153 ?auto_900156 ) ) ( not ( = ?auto_900153 ?auto_900157 ) ) ( not ( = ?auto_900153 ?auto_900158 ) ) ( not ( = ?auto_900154 ?auto_900155 ) ) ( not ( = ?auto_900154 ?auto_900156 ) ) ( not ( = ?auto_900154 ?auto_900157 ) ) ( not ( = ?auto_900154 ?auto_900158 ) ) ( not ( = ?auto_900155 ?auto_900156 ) ) ( not ( = ?auto_900155 ?auto_900157 ) ) ( not ( = ?auto_900155 ?auto_900158 ) ) ( not ( = ?auto_900156 ?auto_900157 ) ) ( not ( = ?auto_900156 ?auto_900158 ) ) ( not ( = ?auto_900157 ?auto_900158 ) ) ( ON ?auto_900156 ?auto_900157 ) ( ON ?auto_900155 ?auto_900156 ) ( ON ?auto_900154 ?auto_900155 ) ( ON ?auto_900153 ?auto_900154 ) ( ON ?auto_900152 ?auto_900153 ) ( ON ?auto_900151 ?auto_900152 ) ( ON ?auto_900150 ?auto_900151 ) ( ON ?auto_900149 ?auto_900150 ) ( ON ?auto_900148 ?auto_900149 ) ( ON ?auto_900147 ?auto_900148 ) ( CLEAR ?auto_900147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_900147 )
      ( MAKE-11PILE ?auto_900147 ?auto_900148 ?auto_900149 ?auto_900150 ?auto_900151 ?auto_900152 ?auto_900153 ?auto_900154 ?auto_900155 ?auto_900156 ?auto_900157 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_900194 - BLOCK
      ?auto_900195 - BLOCK
      ?auto_900196 - BLOCK
      ?auto_900197 - BLOCK
      ?auto_900198 - BLOCK
      ?auto_900199 - BLOCK
      ?auto_900200 - BLOCK
      ?auto_900201 - BLOCK
      ?auto_900202 - BLOCK
      ?auto_900203 - BLOCK
      ?auto_900204 - BLOCK
      ?auto_900205 - BLOCK
    )
    :vars
    (
      ?auto_900206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_900204 ) ( ON ?auto_900205 ?auto_900206 ) ( CLEAR ?auto_900205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_900194 ) ( ON ?auto_900195 ?auto_900194 ) ( ON ?auto_900196 ?auto_900195 ) ( ON ?auto_900197 ?auto_900196 ) ( ON ?auto_900198 ?auto_900197 ) ( ON ?auto_900199 ?auto_900198 ) ( ON ?auto_900200 ?auto_900199 ) ( ON ?auto_900201 ?auto_900200 ) ( ON ?auto_900202 ?auto_900201 ) ( ON ?auto_900203 ?auto_900202 ) ( ON ?auto_900204 ?auto_900203 ) ( not ( = ?auto_900194 ?auto_900195 ) ) ( not ( = ?auto_900194 ?auto_900196 ) ) ( not ( = ?auto_900194 ?auto_900197 ) ) ( not ( = ?auto_900194 ?auto_900198 ) ) ( not ( = ?auto_900194 ?auto_900199 ) ) ( not ( = ?auto_900194 ?auto_900200 ) ) ( not ( = ?auto_900194 ?auto_900201 ) ) ( not ( = ?auto_900194 ?auto_900202 ) ) ( not ( = ?auto_900194 ?auto_900203 ) ) ( not ( = ?auto_900194 ?auto_900204 ) ) ( not ( = ?auto_900194 ?auto_900205 ) ) ( not ( = ?auto_900194 ?auto_900206 ) ) ( not ( = ?auto_900195 ?auto_900196 ) ) ( not ( = ?auto_900195 ?auto_900197 ) ) ( not ( = ?auto_900195 ?auto_900198 ) ) ( not ( = ?auto_900195 ?auto_900199 ) ) ( not ( = ?auto_900195 ?auto_900200 ) ) ( not ( = ?auto_900195 ?auto_900201 ) ) ( not ( = ?auto_900195 ?auto_900202 ) ) ( not ( = ?auto_900195 ?auto_900203 ) ) ( not ( = ?auto_900195 ?auto_900204 ) ) ( not ( = ?auto_900195 ?auto_900205 ) ) ( not ( = ?auto_900195 ?auto_900206 ) ) ( not ( = ?auto_900196 ?auto_900197 ) ) ( not ( = ?auto_900196 ?auto_900198 ) ) ( not ( = ?auto_900196 ?auto_900199 ) ) ( not ( = ?auto_900196 ?auto_900200 ) ) ( not ( = ?auto_900196 ?auto_900201 ) ) ( not ( = ?auto_900196 ?auto_900202 ) ) ( not ( = ?auto_900196 ?auto_900203 ) ) ( not ( = ?auto_900196 ?auto_900204 ) ) ( not ( = ?auto_900196 ?auto_900205 ) ) ( not ( = ?auto_900196 ?auto_900206 ) ) ( not ( = ?auto_900197 ?auto_900198 ) ) ( not ( = ?auto_900197 ?auto_900199 ) ) ( not ( = ?auto_900197 ?auto_900200 ) ) ( not ( = ?auto_900197 ?auto_900201 ) ) ( not ( = ?auto_900197 ?auto_900202 ) ) ( not ( = ?auto_900197 ?auto_900203 ) ) ( not ( = ?auto_900197 ?auto_900204 ) ) ( not ( = ?auto_900197 ?auto_900205 ) ) ( not ( = ?auto_900197 ?auto_900206 ) ) ( not ( = ?auto_900198 ?auto_900199 ) ) ( not ( = ?auto_900198 ?auto_900200 ) ) ( not ( = ?auto_900198 ?auto_900201 ) ) ( not ( = ?auto_900198 ?auto_900202 ) ) ( not ( = ?auto_900198 ?auto_900203 ) ) ( not ( = ?auto_900198 ?auto_900204 ) ) ( not ( = ?auto_900198 ?auto_900205 ) ) ( not ( = ?auto_900198 ?auto_900206 ) ) ( not ( = ?auto_900199 ?auto_900200 ) ) ( not ( = ?auto_900199 ?auto_900201 ) ) ( not ( = ?auto_900199 ?auto_900202 ) ) ( not ( = ?auto_900199 ?auto_900203 ) ) ( not ( = ?auto_900199 ?auto_900204 ) ) ( not ( = ?auto_900199 ?auto_900205 ) ) ( not ( = ?auto_900199 ?auto_900206 ) ) ( not ( = ?auto_900200 ?auto_900201 ) ) ( not ( = ?auto_900200 ?auto_900202 ) ) ( not ( = ?auto_900200 ?auto_900203 ) ) ( not ( = ?auto_900200 ?auto_900204 ) ) ( not ( = ?auto_900200 ?auto_900205 ) ) ( not ( = ?auto_900200 ?auto_900206 ) ) ( not ( = ?auto_900201 ?auto_900202 ) ) ( not ( = ?auto_900201 ?auto_900203 ) ) ( not ( = ?auto_900201 ?auto_900204 ) ) ( not ( = ?auto_900201 ?auto_900205 ) ) ( not ( = ?auto_900201 ?auto_900206 ) ) ( not ( = ?auto_900202 ?auto_900203 ) ) ( not ( = ?auto_900202 ?auto_900204 ) ) ( not ( = ?auto_900202 ?auto_900205 ) ) ( not ( = ?auto_900202 ?auto_900206 ) ) ( not ( = ?auto_900203 ?auto_900204 ) ) ( not ( = ?auto_900203 ?auto_900205 ) ) ( not ( = ?auto_900203 ?auto_900206 ) ) ( not ( = ?auto_900204 ?auto_900205 ) ) ( not ( = ?auto_900204 ?auto_900206 ) ) ( not ( = ?auto_900205 ?auto_900206 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_900205 ?auto_900206 )
      ( !STACK ?auto_900205 ?auto_900204 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_900244 - BLOCK
      ?auto_900245 - BLOCK
      ?auto_900246 - BLOCK
      ?auto_900247 - BLOCK
      ?auto_900248 - BLOCK
      ?auto_900249 - BLOCK
      ?auto_900250 - BLOCK
      ?auto_900251 - BLOCK
      ?auto_900252 - BLOCK
      ?auto_900253 - BLOCK
      ?auto_900254 - BLOCK
      ?auto_900255 - BLOCK
    )
    :vars
    (
      ?auto_900256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900255 ?auto_900256 ) ( ON-TABLE ?auto_900244 ) ( ON ?auto_900245 ?auto_900244 ) ( ON ?auto_900246 ?auto_900245 ) ( ON ?auto_900247 ?auto_900246 ) ( ON ?auto_900248 ?auto_900247 ) ( ON ?auto_900249 ?auto_900248 ) ( ON ?auto_900250 ?auto_900249 ) ( ON ?auto_900251 ?auto_900250 ) ( ON ?auto_900252 ?auto_900251 ) ( ON ?auto_900253 ?auto_900252 ) ( not ( = ?auto_900244 ?auto_900245 ) ) ( not ( = ?auto_900244 ?auto_900246 ) ) ( not ( = ?auto_900244 ?auto_900247 ) ) ( not ( = ?auto_900244 ?auto_900248 ) ) ( not ( = ?auto_900244 ?auto_900249 ) ) ( not ( = ?auto_900244 ?auto_900250 ) ) ( not ( = ?auto_900244 ?auto_900251 ) ) ( not ( = ?auto_900244 ?auto_900252 ) ) ( not ( = ?auto_900244 ?auto_900253 ) ) ( not ( = ?auto_900244 ?auto_900254 ) ) ( not ( = ?auto_900244 ?auto_900255 ) ) ( not ( = ?auto_900244 ?auto_900256 ) ) ( not ( = ?auto_900245 ?auto_900246 ) ) ( not ( = ?auto_900245 ?auto_900247 ) ) ( not ( = ?auto_900245 ?auto_900248 ) ) ( not ( = ?auto_900245 ?auto_900249 ) ) ( not ( = ?auto_900245 ?auto_900250 ) ) ( not ( = ?auto_900245 ?auto_900251 ) ) ( not ( = ?auto_900245 ?auto_900252 ) ) ( not ( = ?auto_900245 ?auto_900253 ) ) ( not ( = ?auto_900245 ?auto_900254 ) ) ( not ( = ?auto_900245 ?auto_900255 ) ) ( not ( = ?auto_900245 ?auto_900256 ) ) ( not ( = ?auto_900246 ?auto_900247 ) ) ( not ( = ?auto_900246 ?auto_900248 ) ) ( not ( = ?auto_900246 ?auto_900249 ) ) ( not ( = ?auto_900246 ?auto_900250 ) ) ( not ( = ?auto_900246 ?auto_900251 ) ) ( not ( = ?auto_900246 ?auto_900252 ) ) ( not ( = ?auto_900246 ?auto_900253 ) ) ( not ( = ?auto_900246 ?auto_900254 ) ) ( not ( = ?auto_900246 ?auto_900255 ) ) ( not ( = ?auto_900246 ?auto_900256 ) ) ( not ( = ?auto_900247 ?auto_900248 ) ) ( not ( = ?auto_900247 ?auto_900249 ) ) ( not ( = ?auto_900247 ?auto_900250 ) ) ( not ( = ?auto_900247 ?auto_900251 ) ) ( not ( = ?auto_900247 ?auto_900252 ) ) ( not ( = ?auto_900247 ?auto_900253 ) ) ( not ( = ?auto_900247 ?auto_900254 ) ) ( not ( = ?auto_900247 ?auto_900255 ) ) ( not ( = ?auto_900247 ?auto_900256 ) ) ( not ( = ?auto_900248 ?auto_900249 ) ) ( not ( = ?auto_900248 ?auto_900250 ) ) ( not ( = ?auto_900248 ?auto_900251 ) ) ( not ( = ?auto_900248 ?auto_900252 ) ) ( not ( = ?auto_900248 ?auto_900253 ) ) ( not ( = ?auto_900248 ?auto_900254 ) ) ( not ( = ?auto_900248 ?auto_900255 ) ) ( not ( = ?auto_900248 ?auto_900256 ) ) ( not ( = ?auto_900249 ?auto_900250 ) ) ( not ( = ?auto_900249 ?auto_900251 ) ) ( not ( = ?auto_900249 ?auto_900252 ) ) ( not ( = ?auto_900249 ?auto_900253 ) ) ( not ( = ?auto_900249 ?auto_900254 ) ) ( not ( = ?auto_900249 ?auto_900255 ) ) ( not ( = ?auto_900249 ?auto_900256 ) ) ( not ( = ?auto_900250 ?auto_900251 ) ) ( not ( = ?auto_900250 ?auto_900252 ) ) ( not ( = ?auto_900250 ?auto_900253 ) ) ( not ( = ?auto_900250 ?auto_900254 ) ) ( not ( = ?auto_900250 ?auto_900255 ) ) ( not ( = ?auto_900250 ?auto_900256 ) ) ( not ( = ?auto_900251 ?auto_900252 ) ) ( not ( = ?auto_900251 ?auto_900253 ) ) ( not ( = ?auto_900251 ?auto_900254 ) ) ( not ( = ?auto_900251 ?auto_900255 ) ) ( not ( = ?auto_900251 ?auto_900256 ) ) ( not ( = ?auto_900252 ?auto_900253 ) ) ( not ( = ?auto_900252 ?auto_900254 ) ) ( not ( = ?auto_900252 ?auto_900255 ) ) ( not ( = ?auto_900252 ?auto_900256 ) ) ( not ( = ?auto_900253 ?auto_900254 ) ) ( not ( = ?auto_900253 ?auto_900255 ) ) ( not ( = ?auto_900253 ?auto_900256 ) ) ( not ( = ?auto_900254 ?auto_900255 ) ) ( not ( = ?auto_900254 ?auto_900256 ) ) ( not ( = ?auto_900255 ?auto_900256 ) ) ( CLEAR ?auto_900253 ) ( ON ?auto_900254 ?auto_900255 ) ( CLEAR ?auto_900254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_900244 ?auto_900245 ?auto_900246 ?auto_900247 ?auto_900248 ?auto_900249 ?auto_900250 ?auto_900251 ?auto_900252 ?auto_900253 ?auto_900254 )
      ( MAKE-12PILE ?auto_900244 ?auto_900245 ?auto_900246 ?auto_900247 ?auto_900248 ?auto_900249 ?auto_900250 ?auto_900251 ?auto_900252 ?auto_900253 ?auto_900254 ?auto_900255 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_900294 - BLOCK
      ?auto_900295 - BLOCK
      ?auto_900296 - BLOCK
      ?auto_900297 - BLOCK
      ?auto_900298 - BLOCK
      ?auto_900299 - BLOCK
      ?auto_900300 - BLOCK
      ?auto_900301 - BLOCK
      ?auto_900302 - BLOCK
      ?auto_900303 - BLOCK
      ?auto_900304 - BLOCK
      ?auto_900305 - BLOCK
    )
    :vars
    (
      ?auto_900306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900305 ?auto_900306 ) ( ON-TABLE ?auto_900294 ) ( ON ?auto_900295 ?auto_900294 ) ( ON ?auto_900296 ?auto_900295 ) ( ON ?auto_900297 ?auto_900296 ) ( ON ?auto_900298 ?auto_900297 ) ( ON ?auto_900299 ?auto_900298 ) ( ON ?auto_900300 ?auto_900299 ) ( ON ?auto_900301 ?auto_900300 ) ( ON ?auto_900302 ?auto_900301 ) ( not ( = ?auto_900294 ?auto_900295 ) ) ( not ( = ?auto_900294 ?auto_900296 ) ) ( not ( = ?auto_900294 ?auto_900297 ) ) ( not ( = ?auto_900294 ?auto_900298 ) ) ( not ( = ?auto_900294 ?auto_900299 ) ) ( not ( = ?auto_900294 ?auto_900300 ) ) ( not ( = ?auto_900294 ?auto_900301 ) ) ( not ( = ?auto_900294 ?auto_900302 ) ) ( not ( = ?auto_900294 ?auto_900303 ) ) ( not ( = ?auto_900294 ?auto_900304 ) ) ( not ( = ?auto_900294 ?auto_900305 ) ) ( not ( = ?auto_900294 ?auto_900306 ) ) ( not ( = ?auto_900295 ?auto_900296 ) ) ( not ( = ?auto_900295 ?auto_900297 ) ) ( not ( = ?auto_900295 ?auto_900298 ) ) ( not ( = ?auto_900295 ?auto_900299 ) ) ( not ( = ?auto_900295 ?auto_900300 ) ) ( not ( = ?auto_900295 ?auto_900301 ) ) ( not ( = ?auto_900295 ?auto_900302 ) ) ( not ( = ?auto_900295 ?auto_900303 ) ) ( not ( = ?auto_900295 ?auto_900304 ) ) ( not ( = ?auto_900295 ?auto_900305 ) ) ( not ( = ?auto_900295 ?auto_900306 ) ) ( not ( = ?auto_900296 ?auto_900297 ) ) ( not ( = ?auto_900296 ?auto_900298 ) ) ( not ( = ?auto_900296 ?auto_900299 ) ) ( not ( = ?auto_900296 ?auto_900300 ) ) ( not ( = ?auto_900296 ?auto_900301 ) ) ( not ( = ?auto_900296 ?auto_900302 ) ) ( not ( = ?auto_900296 ?auto_900303 ) ) ( not ( = ?auto_900296 ?auto_900304 ) ) ( not ( = ?auto_900296 ?auto_900305 ) ) ( not ( = ?auto_900296 ?auto_900306 ) ) ( not ( = ?auto_900297 ?auto_900298 ) ) ( not ( = ?auto_900297 ?auto_900299 ) ) ( not ( = ?auto_900297 ?auto_900300 ) ) ( not ( = ?auto_900297 ?auto_900301 ) ) ( not ( = ?auto_900297 ?auto_900302 ) ) ( not ( = ?auto_900297 ?auto_900303 ) ) ( not ( = ?auto_900297 ?auto_900304 ) ) ( not ( = ?auto_900297 ?auto_900305 ) ) ( not ( = ?auto_900297 ?auto_900306 ) ) ( not ( = ?auto_900298 ?auto_900299 ) ) ( not ( = ?auto_900298 ?auto_900300 ) ) ( not ( = ?auto_900298 ?auto_900301 ) ) ( not ( = ?auto_900298 ?auto_900302 ) ) ( not ( = ?auto_900298 ?auto_900303 ) ) ( not ( = ?auto_900298 ?auto_900304 ) ) ( not ( = ?auto_900298 ?auto_900305 ) ) ( not ( = ?auto_900298 ?auto_900306 ) ) ( not ( = ?auto_900299 ?auto_900300 ) ) ( not ( = ?auto_900299 ?auto_900301 ) ) ( not ( = ?auto_900299 ?auto_900302 ) ) ( not ( = ?auto_900299 ?auto_900303 ) ) ( not ( = ?auto_900299 ?auto_900304 ) ) ( not ( = ?auto_900299 ?auto_900305 ) ) ( not ( = ?auto_900299 ?auto_900306 ) ) ( not ( = ?auto_900300 ?auto_900301 ) ) ( not ( = ?auto_900300 ?auto_900302 ) ) ( not ( = ?auto_900300 ?auto_900303 ) ) ( not ( = ?auto_900300 ?auto_900304 ) ) ( not ( = ?auto_900300 ?auto_900305 ) ) ( not ( = ?auto_900300 ?auto_900306 ) ) ( not ( = ?auto_900301 ?auto_900302 ) ) ( not ( = ?auto_900301 ?auto_900303 ) ) ( not ( = ?auto_900301 ?auto_900304 ) ) ( not ( = ?auto_900301 ?auto_900305 ) ) ( not ( = ?auto_900301 ?auto_900306 ) ) ( not ( = ?auto_900302 ?auto_900303 ) ) ( not ( = ?auto_900302 ?auto_900304 ) ) ( not ( = ?auto_900302 ?auto_900305 ) ) ( not ( = ?auto_900302 ?auto_900306 ) ) ( not ( = ?auto_900303 ?auto_900304 ) ) ( not ( = ?auto_900303 ?auto_900305 ) ) ( not ( = ?auto_900303 ?auto_900306 ) ) ( not ( = ?auto_900304 ?auto_900305 ) ) ( not ( = ?auto_900304 ?auto_900306 ) ) ( not ( = ?auto_900305 ?auto_900306 ) ) ( ON ?auto_900304 ?auto_900305 ) ( CLEAR ?auto_900302 ) ( ON ?auto_900303 ?auto_900304 ) ( CLEAR ?auto_900303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_900294 ?auto_900295 ?auto_900296 ?auto_900297 ?auto_900298 ?auto_900299 ?auto_900300 ?auto_900301 ?auto_900302 ?auto_900303 )
      ( MAKE-12PILE ?auto_900294 ?auto_900295 ?auto_900296 ?auto_900297 ?auto_900298 ?auto_900299 ?auto_900300 ?auto_900301 ?auto_900302 ?auto_900303 ?auto_900304 ?auto_900305 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_900344 - BLOCK
      ?auto_900345 - BLOCK
      ?auto_900346 - BLOCK
      ?auto_900347 - BLOCK
      ?auto_900348 - BLOCK
      ?auto_900349 - BLOCK
      ?auto_900350 - BLOCK
      ?auto_900351 - BLOCK
      ?auto_900352 - BLOCK
      ?auto_900353 - BLOCK
      ?auto_900354 - BLOCK
      ?auto_900355 - BLOCK
    )
    :vars
    (
      ?auto_900356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900355 ?auto_900356 ) ( ON-TABLE ?auto_900344 ) ( ON ?auto_900345 ?auto_900344 ) ( ON ?auto_900346 ?auto_900345 ) ( ON ?auto_900347 ?auto_900346 ) ( ON ?auto_900348 ?auto_900347 ) ( ON ?auto_900349 ?auto_900348 ) ( ON ?auto_900350 ?auto_900349 ) ( ON ?auto_900351 ?auto_900350 ) ( not ( = ?auto_900344 ?auto_900345 ) ) ( not ( = ?auto_900344 ?auto_900346 ) ) ( not ( = ?auto_900344 ?auto_900347 ) ) ( not ( = ?auto_900344 ?auto_900348 ) ) ( not ( = ?auto_900344 ?auto_900349 ) ) ( not ( = ?auto_900344 ?auto_900350 ) ) ( not ( = ?auto_900344 ?auto_900351 ) ) ( not ( = ?auto_900344 ?auto_900352 ) ) ( not ( = ?auto_900344 ?auto_900353 ) ) ( not ( = ?auto_900344 ?auto_900354 ) ) ( not ( = ?auto_900344 ?auto_900355 ) ) ( not ( = ?auto_900344 ?auto_900356 ) ) ( not ( = ?auto_900345 ?auto_900346 ) ) ( not ( = ?auto_900345 ?auto_900347 ) ) ( not ( = ?auto_900345 ?auto_900348 ) ) ( not ( = ?auto_900345 ?auto_900349 ) ) ( not ( = ?auto_900345 ?auto_900350 ) ) ( not ( = ?auto_900345 ?auto_900351 ) ) ( not ( = ?auto_900345 ?auto_900352 ) ) ( not ( = ?auto_900345 ?auto_900353 ) ) ( not ( = ?auto_900345 ?auto_900354 ) ) ( not ( = ?auto_900345 ?auto_900355 ) ) ( not ( = ?auto_900345 ?auto_900356 ) ) ( not ( = ?auto_900346 ?auto_900347 ) ) ( not ( = ?auto_900346 ?auto_900348 ) ) ( not ( = ?auto_900346 ?auto_900349 ) ) ( not ( = ?auto_900346 ?auto_900350 ) ) ( not ( = ?auto_900346 ?auto_900351 ) ) ( not ( = ?auto_900346 ?auto_900352 ) ) ( not ( = ?auto_900346 ?auto_900353 ) ) ( not ( = ?auto_900346 ?auto_900354 ) ) ( not ( = ?auto_900346 ?auto_900355 ) ) ( not ( = ?auto_900346 ?auto_900356 ) ) ( not ( = ?auto_900347 ?auto_900348 ) ) ( not ( = ?auto_900347 ?auto_900349 ) ) ( not ( = ?auto_900347 ?auto_900350 ) ) ( not ( = ?auto_900347 ?auto_900351 ) ) ( not ( = ?auto_900347 ?auto_900352 ) ) ( not ( = ?auto_900347 ?auto_900353 ) ) ( not ( = ?auto_900347 ?auto_900354 ) ) ( not ( = ?auto_900347 ?auto_900355 ) ) ( not ( = ?auto_900347 ?auto_900356 ) ) ( not ( = ?auto_900348 ?auto_900349 ) ) ( not ( = ?auto_900348 ?auto_900350 ) ) ( not ( = ?auto_900348 ?auto_900351 ) ) ( not ( = ?auto_900348 ?auto_900352 ) ) ( not ( = ?auto_900348 ?auto_900353 ) ) ( not ( = ?auto_900348 ?auto_900354 ) ) ( not ( = ?auto_900348 ?auto_900355 ) ) ( not ( = ?auto_900348 ?auto_900356 ) ) ( not ( = ?auto_900349 ?auto_900350 ) ) ( not ( = ?auto_900349 ?auto_900351 ) ) ( not ( = ?auto_900349 ?auto_900352 ) ) ( not ( = ?auto_900349 ?auto_900353 ) ) ( not ( = ?auto_900349 ?auto_900354 ) ) ( not ( = ?auto_900349 ?auto_900355 ) ) ( not ( = ?auto_900349 ?auto_900356 ) ) ( not ( = ?auto_900350 ?auto_900351 ) ) ( not ( = ?auto_900350 ?auto_900352 ) ) ( not ( = ?auto_900350 ?auto_900353 ) ) ( not ( = ?auto_900350 ?auto_900354 ) ) ( not ( = ?auto_900350 ?auto_900355 ) ) ( not ( = ?auto_900350 ?auto_900356 ) ) ( not ( = ?auto_900351 ?auto_900352 ) ) ( not ( = ?auto_900351 ?auto_900353 ) ) ( not ( = ?auto_900351 ?auto_900354 ) ) ( not ( = ?auto_900351 ?auto_900355 ) ) ( not ( = ?auto_900351 ?auto_900356 ) ) ( not ( = ?auto_900352 ?auto_900353 ) ) ( not ( = ?auto_900352 ?auto_900354 ) ) ( not ( = ?auto_900352 ?auto_900355 ) ) ( not ( = ?auto_900352 ?auto_900356 ) ) ( not ( = ?auto_900353 ?auto_900354 ) ) ( not ( = ?auto_900353 ?auto_900355 ) ) ( not ( = ?auto_900353 ?auto_900356 ) ) ( not ( = ?auto_900354 ?auto_900355 ) ) ( not ( = ?auto_900354 ?auto_900356 ) ) ( not ( = ?auto_900355 ?auto_900356 ) ) ( ON ?auto_900354 ?auto_900355 ) ( ON ?auto_900353 ?auto_900354 ) ( CLEAR ?auto_900351 ) ( ON ?auto_900352 ?auto_900353 ) ( CLEAR ?auto_900352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_900344 ?auto_900345 ?auto_900346 ?auto_900347 ?auto_900348 ?auto_900349 ?auto_900350 ?auto_900351 ?auto_900352 )
      ( MAKE-12PILE ?auto_900344 ?auto_900345 ?auto_900346 ?auto_900347 ?auto_900348 ?auto_900349 ?auto_900350 ?auto_900351 ?auto_900352 ?auto_900353 ?auto_900354 ?auto_900355 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_900394 - BLOCK
      ?auto_900395 - BLOCK
      ?auto_900396 - BLOCK
      ?auto_900397 - BLOCK
      ?auto_900398 - BLOCK
      ?auto_900399 - BLOCK
      ?auto_900400 - BLOCK
      ?auto_900401 - BLOCK
      ?auto_900402 - BLOCK
      ?auto_900403 - BLOCK
      ?auto_900404 - BLOCK
      ?auto_900405 - BLOCK
    )
    :vars
    (
      ?auto_900406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900405 ?auto_900406 ) ( ON-TABLE ?auto_900394 ) ( ON ?auto_900395 ?auto_900394 ) ( ON ?auto_900396 ?auto_900395 ) ( ON ?auto_900397 ?auto_900396 ) ( ON ?auto_900398 ?auto_900397 ) ( ON ?auto_900399 ?auto_900398 ) ( ON ?auto_900400 ?auto_900399 ) ( not ( = ?auto_900394 ?auto_900395 ) ) ( not ( = ?auto_900394 ?auto_900396 ) ) ( not ( = ?auto_900394 ?auto_900397 ) ) ( not ( = ?auto_900394 ?auto_900398 ) ) ( not ( = ?auto_900394 ?auto_900399 ) ) ( not ( = ?auto_900394 ?auto_900400 ) ) ( not ( = ?auto_900394 ?auto_900401 ) ) ( not ( = ?auto_900394 ?auto_900402 ) ) ( not ( = ?auto_900394 ?auto_900403 ) ) ( not ( = ?auto_900394 ?auto_900404 ) ) ( not ( = ?auto_900394 ?auto_900405 ) ) ( not ( = ?auto_900394 ?auto_900406 ) ) ( not ( = ?auto_900395 ?auto_900396 ) ) ( not ( = ?auto_900395 ?auto_900397 ) ) ( not ( = ?auto_900395 ?auto_900398 ) ) ( not ( = ?auto_900395 ?auto_900399 ) ) ( not ( = ?auto_900395 ?auto_900400 ) ) ( not ( = ?auto_900395 ?auto_900401 ) ) ( not ( = ?auto_900395 ?auto_900402 ) ) ( not ( = ?auto_900395 ?auto_900403 ) ) ( not ( = ?auto_900395 ?auto_900404 ) ) ( not ( = ?auto_900395 ?auto_900405 ) ) ( not ( = ?auto_900395 ?auto_900406 ) ) ( not ( = ?auto_900396 ?auto_900397 ) ) ( not ( = ?auto_900396 ?auto_900398 ) ) ( not ( = ?auto_900396 ?auto_900399 ) ) ( not ( = ?auto_900396 ?auto_900400 ) ) ( not ( = ?auto_900396 ?auto_900401 ) ) ( not ( = ?auto_900396 ?auto_900402 ) ) ( not ( = ?auto_900396 ?auto_900403 ) ) ( not ( = ?auto_900396 ?auto_900404 ) ) ( not ( = ?auto_900396 ?auto_900405 ) ) ( not ( = ?auto_900396 ?auto_900406 ) ) ( not ( = ?auto_900397 ?auto_900398 ) ) ( not ( = ?auto_900397 ?auto_900399 ) ) ( not ( = ?auto_900397 ?auto_900400 ) ) ( not ( = ?auto_900397 ?auto_900401 ) ) ( not ( = ?auto_900397 ?auto_900402 ) ) ( not ( = ?auto_900397 ?auto_900403 ) ) ( not ( = ?auto_900397 ?auto_900404 ) ) ( not ( = ?auto_900397 ?auto_900405 ) ) ( not ( = ?auto_900397 ?auto_900406 ) ) ( not ( = ?auto_900398 ?auto_900399 ) ) ( not ( = ?auto_900398 ?auto_900400 ) ) ( not ( = ?auto_900398 ?auto_900401 ) ) ( not ( = ?auto_900398 ?auto_900402 ) ) ( not ( = ?auto_900398 ?auto_900403 ) ) ( not ( = ?auto_900398 ?auto_900404 ) ) ( not ( = ?auto_900398 ?auto_900405 ) ) ( not ( = ?auto_900398 ?auto_900406 ) ) ( not ( = ?auto_900399 ?auto_900400 ) ) ( not ( = ?auto_900399 ?auto_900401 ) ) ( not ( = ?auto_900399 ?auto_900402 ) ) ( not ( = ?auto_900399 ?auto_900403 ) ) ( not ( = ?auto_900399 ?auto_900404 ) ) ( not ( = ?auto_900399 ?auto_900405 ) ) ( not ( = ?auto_900399 ?auto_900406 ) ) ( not ( = ?auto_900400 ?auto_900401 ) ) ( not ( = ?auto_900400 ?auto_900402 ) ) ( not ( = ?auto_900400 ?auto_900403 ) ) ( not ( = ?auto_900400 ?auto_900404 ) ) ( not ( = ?auto_900400 ?auto_900405 ) ) ( not ( = ?auto_900400 ?auto_900406 ) ) ( not ( = ?auto_900401 ?auto_900402 ) ) ( not ( = ?auto_900401 ?auto_900403 ) ) ( not ( = ?auto_900401 ?auto_900404 ) ) ( not ( = ?auto_900401 ?auto_900405 ) ) ( not ( = ?auto_900401 ?auto_900406 ) ) ( not ( = ?auto_900402 ?auto_900403 ) ) ( not ( = ?auto_900402 ?auto_900404 ) ) ( not ( = ?auto_900402 ?auto_900405 ) ) ( not ( = ?auto_900402 ?auto_900406 ) ) ( not ( = ?auto_900403 ?auto_900404 ) ) ( not ( = ?auto_900403 ?auto_900405 ) ) ( not ( = ?auto_900403 ?auto_900406 ) ) ( not ( = ?auto_900404 ?auto_900405 ) ) ( not ( = ?auto_900404 ?auto_900406 ) ) ( not ( = ?auto_900405 ?auto_900406 ) ) ( ON ?auto_900404 ?auto_900405 ) ( ON ?auto_900403 ?auto_900404 ) ( ON ?auto_900402 ?auto_900403 ) ( CLEAR ?auto_900400 ) ( ON ?auto_900401 ?auto_900402 ) ( CLEAR ?auto_900401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_900394 ?auto_900395 ?auto_900396 ?auto_900397 ?auto_900398 ?auto_900399 ?auto_900400 ?auto_900401 )
      ( MAKE-12PILE ?auto_900394 ?auto_900395 ?auto_900396 ?auto_900397 ?auto_900398 ?auto_900399 ?auto_900400 ?auto_900401 ?auto_900402 ?auto_900403 ?auto_900404 ?auto_900405 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_900444 - BLOCK
      ?auto_900445 - BLOCK
      ?auto_900446 - BLOCK
      ?auto_900447 - BLOCK
      ?auto_900448 - BLOCK
      ?auto_900449 - BLOCK
      ?auto_900450 - BLOCK
      ?auto_900451 - BLOCK
      ?auto_900452 - BLOCK
      ?auto_900453 - BLOCK
      ?auto_900454 - BLOCK
      ?auto_900455 - BLOCK
    )
    :vars
    (
      ?auto_900456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900455 ?auto_900456 ) ( ON-TABLE ?auto_900444 ) ( ON ?auto_900445 ?auto_900444 ) ( ON ?auto_900446 ?auto_900445 ) ( ON ?auto_900447 ?auto_900446 ) ( ON ?auto_900448 ?auto_900447 ) ( ON ?auto_900449 ?auto_900448 ) ( not ( = ?auto_900444 ?auto_900445 ) ) ( not ( = ?auto_900444 ?auto_900446 ) ) ( not ( = ?auto_900444 ?auto_900447 ) ) ( not ( = ?auto_900444 ?auto_900448 ) ) ( not ( = ?auto_900444 ?auto_900449 ) ) ( not ( = ?auto_900444 ?auto_900450 ) ) ( not ( = ?auto_900444 ?auto_900451 ) ) ( not ( = ?auto_900444 ?auto_900452 ) ) ( not ( = ?auto_900444 ?auto_900453 ) ) ( not ( = ?auto_900444 ?auto_900454 ) ) ( not ( = ?auto_900444 ?auto_900455 ) ) ( not ( = ?auto_900444 ?auto_900456 ) ) ( not ( = ?auto_900445 ?auto_900446 ) ) ( not ( = ?auto_900445 ?auto_900447 ) ) ( not ( = ?auto_900445 ?auto_900448 ) ) ( not ( = ?auto_900445 ?auto_900449 ) ) ( not ( = ?auto_900445 ?auto_900450 ) ) ( not ( = ?auto_900445 ?auto_900451 ) ) ( not ( = ?auto_900445 ?auto_900452 ) ) ( not ( = ?auto_900445 ?auto_900453 ) ) ( not ( = ?auto_900445 ?auto_900454 ) ) ( not ( = ?auto_900445 ?auto_900455 ) ) ( not ( = ?auto_900445 ?auto_900456 ) ) ( not ( = ?auto_900446 ?auto_900447 ) ) ( not ( = ?auto_900446 ?auto_900448 ) ) ( not ( = ?auto_900446 ?auto_900449 ) ) ( not ( = ?auto_900446 ?auto_900450 ) ) ( not ( = ?auto_900446 ?auto_900451 ) ) ( not ( = ?auto_900446 ?auto_900452 ) ) ( not ( = ?auto_900446 ?auto_900453 ) ) ( not ( = ?auto_900446 ?auto_900454 ) ) ( not ( = ?auto_900446 ?auto_900455 ) ) ( not ( = ?auto_900446 ?auto_900456 ) ) ( not ( = ?auto_900447 ?auto_900448 ) ) ( not ( = ?auto_900447 ?auto_900449 ) ) ( not ( = ?auto_900447 ?auto_900450 ) ) ( not ( = ?auto_900447 ?auto_900451 ) ) ( not ( = ?auto_900447 ?auto_900452 ) ) ( not ( = ?auto_900447 ?auto_900453 ) ) ( not ( = ?auto_900447 ?auto_900454 ) ) ( not ( = ?auto_900447 ?auto_900455 ) ) ( not ( = ?auto_900447 ?auto_900456 ) ) ( not ( = ?auto_900448 ?auto_900449 ) ) ( not ( = ?auto_900448 ?auto_900450 ) ) ( not ( = ?auto_900448 ?auto_900451 ) ) ( not ( = ?auto_900448 ?auto_900452 ) ) ( not ( = ?auto_900448 ?auto_900453 ) ) ( not ( = ?auto_900448 ?auto_900454 ) ) ( not ( = ?auto_900448 ?auto_900455 ) ) ( not ( = ?auto_900448 ?auto_900456 ) ) ( not ( = ?auto_900449 ?auto_900450 ) ) ( not ( = ?auto_900449 ?auto_900451 ) ) ( not ( = ?auto_900449 ?auto_900452 ) ) ( not ( = ?auto_900449 ?auto_900453 ) ) ( not ( = ?auto_900449 ?auto_900454 ) ) ( not ( = ?auto_900449 ?auto_900455 ) ) ( not ( = ?auto_900449 ?auto_900456 ) ) ( not ( = ?auto_900450 ?auto_900451 ) ) ( not ( = ?auto_900450 ?auto_900452 ) ) ( not ( = ?auto_900450 ?auto_900453 ) ) ( not ( = ?auto_900450 ?auto_900454 ) ) ( not ( = ?auto_900450 ?auto_900455 ) ) ( not ( = ?auto_900450 ?auto_900456 ) ) ( not ( = ?auto_900451 ?auto_900452 ) ) ( not ( = ?auto_900451 ?auto_900453 ) ) ( not ( = ?auto_900451 ?auto_900454 ) ) ( not ( = ?auto_900451 ?auto_900455 ) ) ( not ( = ?auto_900451 ?auto_900456 ) ) ( not ( = ?auto_900452 ?auto_900453 ) ) ( not ( = ?auto_900452 ?auto_900454 ) ) ( not ( = ?auto_900452 ?auto_900455 ) ) ( not ( = ?auto_900452 ?auto_900456 ) ) ( not ( = ?auto_900453 ?auto_900454 ) ) ( not ( = ?auto_900453 ?auto_900455 ) ) ( not ( = ?auto_900453 ?auto_900456 ) ) ( not ( = ?auto_900454 ?auto_900455 ) ) ( not ( = ?auto_900454 ?auto_900456 ) ) ( not ( = ?auto_900455 ?auto_900456 ) ) ( ON ?auto_900454 ?auto_900455 ) ( ON ?auto_900453 ?auto_900454 ) ( ON ?auto_900452 ?auto_900453 ) ( ON ?auto_900451 ?auto_900452 ) ( CLEAR ?auto_900449 ) ( ON ?auto_900450 ?auto_900451 ) ( CLEAR ?auto_900450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_900444 ?auto_900445 ?auto_900446 ?auto_900447 ?auto_900448 ?auto_900449 ?auto_900450 )
      ( MAKE-12PILE ?auto_900444 ?auto_900445 ?auto_900446 ?auto_900447 ?auto_900448 ?auto_900449 ?auto_900450 ?auto_900451 ?auto_900452 ?auto_900453 ?auto_900454 ?auto_900455 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_900494 - BLOCK
      ?auto_900495 - BLOCK
      ?auto_900496 - BLOCK
      ?auto_900497 - BLOCK
      ?auto_900498 - BLOCK
      ?auto_900499 - BLOCK
      ?auto_900500 - BLOCK
      ?auto_900501 - BLOCK
      ?auto_900502 - BLOCK
      ?auto_900503 - BLOCK
      ?auto_900504 - BLOCK
      ?auto_900505 - BLOCK
    )
    :vars
    (
      ?auto_900506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900505 ?auto_900506 ) ( ON-TABLE ?auto_900494 ) ( ON ?auto_900495 ?auto_900494 ) ( ON ?auto_900496 ?auto_900495 ) ( ON ?auto_900497 ?auto_900496 ) ( ON ?auto_900498 ?auto_900497 ) ( not ( = ?auto_900494 ?auto_900495 ) ) ( not ( = ?auto_900494 ?auto_900496 ) ) ( not ( = ?auto_900494 ?auto_900497 ) ) ( not ( = ?auto_900494 ?auto_900498 ) ) ( not ( = ?auto_900494 ?auto_900499 ) ) ( not ( = ?auto_900494 ?auto_900500 ) ) ( not ( = ?auto_900494 ?auto_900501 ) ) ( not ( = ?auto_900494 ?auto_900502 ) ) ( not ( = ?auto_900494 ?auto_900503 ) ) ( not ( = ?auto_900494 ?auto_900504 ) ) ( not ( = ?auto_900494 ?auto_900505 ) ) ( not ( = ?auto_900494 ?auto_900506 ) ) ( not ( = ?auto_900495 ?auto_900496 ) ) ( not ( = ?auto_900495 ?auto_900497 ) ) ( not ( = ?auto_900495 ?auto_900498 ) ) ( not ( = ?auto_900495 ?auto_900499 ) ) ( not ( = ?auto_900495 ?auto_900500 ) ) ( not ( = ?auto_900495 ?auto_900501 ) ) ( not ( = ?auto_900495 ?auto_900502 ) ) ( not ( = ?auto_900495 ?auto_900503 ) ) ( not ( = ?auto_900495 ?auto_900504 ) ) ( not ( = ?auto_900495 ?auto_900505 ) ) ( not ( = ?auto_900495 ?auto_900506 ) ) ( not ( = ?auto_900496 ?auto_900497 ) ) ( not ( = ?auto_900496 ?auto_900498 ) ) ( not ( = ?auto_900496 ?auto_900499 ) ) ( not ( = ?auto_900496 ?auto_900500 ) ) ( not ( = ?auto_900496 ?auto_900501 ) ) ( not ( = ?auto_900496 ?auto_900502 ) ) ( not ( = ?auto_900496 ?auto_900503 ) ) ( not ( = ?auto_900496 ?auto_900504 ) ) ( not ( = ?auto_900496 ?auto_900505 ) ) ( not ( = ?auto_900496 ?auto_900506 ) ) ( not ( = ?auto_900497 ?auto_900498 ) ) ( not ( = ?auto_900497 ?auto_900499 ) ) ( not ( = ?auto_900497 ?auto_900500 ) ) ( not ( = ?auto_900497 ?auto_900501 ) ) ( not ( = ?auto_900497 ?auto_900502 ) ) ( not ( = ?auto_900497 ?auto_900503 ) ) ( not ( = ?auto_900497 ?auto_900504 ) ) ( not ( = ?auto_900497 ?auto_900505 ) ) ( not ( = ?auto_900497 ?auto_900506 ) ) ( not ( = ?auto_900498 ?auto_900499 ) ) ( not ( = ?auto_900498 ?auto_900500 ) ) ( not ( = ?auto_900498 ?auto_900501 ) ) ( not ( = ?auto_900498 ?auto_900502 ) ) ( not ( = ?auto_900498 ?auto_900503 ) ) ( not ( = ?auto_900498 ?auto_900504 ) ) ( not ( = ?auto_900498 ?auto_900505 ) ) ( not ( = ?auto_900498 ?auto_900506 ) ) ( not ( = ?auto_900499 ?auto_900500 ) ) ( not ( = ?auto_900499 ?auto_900501 ) ) ( not ( = ?auto_900499 ?auto_900502 ) ) ( not ( = ?auto_900499 ?auto_900503 ) ) ( not ( = ?auto_900499 ?auto_900504 ) ) ( not ( = ?auto_900499 ?auto_900505 ) ) ( not ( = ?auto_900499 ?auto_900506 ) ) ( not ( = ?auto_900500 ?auto_900501 ) ) ( not ( = ?auto_900500 ?auto_900502 ) ) ( not ( = ?auto_900500 ?auto_900503 ) ) ( not ( = ?auto_900500 ?auto_900504 ) ) ( not ( = ?auto_900500 ?auto_900505 ) ) ( not ( = ?auto_900500 ?auto_900506 ) ) ( not ( = ?auto_900501 ?auto_900502 ) ) ( not ( = ?auto_900501 ?auto_900503 ) ) ( not ( = ?auto_900501 ?auto_900504 ) ) ( not ( = ?auto_900501 ?auto_900505 ) ) ( not ( = ?auto_900501 ?auto_900506 ) ) ( not ( = ?auto_900502 ?auto_900503 ) ) ( not ( = ?auto_900502 ?auto_900504 ) ) ( not ( = ?auto_900502 ?auto_900505 ) ) ( not ( = ?auto_900502 ?auto_900506 ) ) ( not ( = ?auto_900503 ?auto_900504 ) ) ( not ( = ?auto_900503 ?auto_900505 ) ) ( not ( = ?auto_900503 ?auto_900506 ) ) ( not ( = ?auto_900504 ?auto_900505 ) ) ( not ( = ?auto_900504 ?auto_900506 ) ) ( not ( = ?auto_900505 ?auto_900506 ) ) ( ON ?auto_900504 ?auto_900505 ) ( ON ?auto_900503 ?auto_900504 ) ( ON ?auto_900502 ?auto_900503 ) ( ON ?auto_900501 ?auto_900502 ) ( ON ?auto_900500 ?auto_900501 ) ( CLEAR ?auto_900498 ) ( ON ?auto_900499 ?auto_900500 ) ( CLEAR ?auto_900499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_900494 ?auto_900495 ?auto_900496 ?auto_900497 ?auto_900498 ?auto_900499 )
      ( MAKE-12PILE ?auto_900494 ?auto_900495 ?auto_900496 ?auto_900497 ?auto_900498 ?auto_900499 ?auto_900500 ?auto_900501 ?auto_900502 ?auto_900503 ?auto_900504 ?auto_900505 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_900544 - BLOCK
      ?auto_900545 - BLOCK
      ?auto_900546 - BLOCK
      ?auto_900547 - BLOCK
      ?auto_900548 - BLOCK
      ?auto_900549 - BLOCK
      ?auto_900550 - BLOCK
      ?auto_900551 - BLOCK
      ?auto_900552 - BLOCK
      ?auto_900553 - BLOCK
      ?auto_900554 - BLOCK
      ?auto_900555 - BLOCK
    )
    :vars
    (
      ?auto_900556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900555 ?auto_900556 ) ( ON-TABLE ?auto_900544 ) ( ON ?auto_900545 ?auto_900544 ) ( ON ?auto_900546 ?auto_900545 ) ( ON ?auto_900547 ?auto_900546 ) ( not ( = ?auto_900544 ?auto_900545 ) ) ( not ( = ?auto_900544 ?auto_900546 ) ) ( not ( = ?auto_900544 ?auto_900547 ) ) ( not ( = ?auto_900544 ?auto_900548 ) ) ( not ( = ?auto_900544 ?auto_900549 ) ) ( not ( = ?auto_900544 ?auto_900550 ) ) ( not ( = ?auto_900544 ?auto_900551 ) ) ( not ( = ?auto_900544 ?auto_900552 ) ) ( not ( = ?auto_900544 ?auto_900553 ) ) ( not ( = ?auto_900544 ?auto_900554 ) ) ( not ( = ?auto_900544 ?auto_900555 ) ) ( not ( = ?auto_900544 ?auto_900556 ) ) ( not ( = ?auto_900545 ?auto_900546 ) ) ( not ( = ?auto_900545 ?auto_900547 ) ) ( not ( = ?auto_900545 ?auto_900548 ) ) ( not ( = ?auto_900545 ?auto_900549 ) ) ( not ( = ?auto_900545 ?auto_900550 ) ) ( not ( = ?auto_900545 ?auto_900551 ) ) ( not ( = ?auto_900545 ?auto_900552 ) ) ( not ( = ?auto_900545 ?auto_900553 ) ) ( not ( = ?auto_900545 ?auto_900554 ) ) ( not ( = ?auto_900545 ?auto_900555 ) ) ( not ( = ?auto_900545 ?auto_900556 ) ) ( not ( = ?auto_900546 ?auto_900547 ) ) ( not ( = ?auto_900546 ?auto_900548 ) ) ( not ( = ?auto_900546 ?auto_900549 ) ) ( not ( = ?auto_900546 ?auto_900550 ) ) ( not ( = ?auto_900546 ?auto_900551 ) ) ( not ( = ?auto_900546 ?auto_900552 ) ) ( not ( = ?auto_900546 ?auto_900553 ) ) ( not ( = ?auto_900546 ?auto_900554 ) ) ( not ( = ?auto_900546 ?auto_900555 ) ) ( not ( = ?auto_900546 ?auto_900556 ) ) ( not ( = ?auto_900547 ?auto_900548 ) ) ( not ( = ?auto_900547 ?auto_900549 ) ) ( not ( = ?auto_900547 ?auto_900550 ) ) ( not ( = ?auto_900547 ?auto_900551 ) ) ( not ( = ?auto_900547 ?auto_900552 ) ) ( not ( = ?auto_900547 ?auto_900553 ) ) ( not ( = ?auto_900547 ?auto_900554 ) ) ( not ( = ?auto_900547 ?auto_900555 ) ) ( not ( = ?auto_900547 ?auto_900556 ) ) ( not ( = ?auto_900548 ?auto_900549 ) ) ( not ( = ?auto_900548 ?auto_900550 ) ) ( not ( = ?auto_900548 ?auto_900551 ) ) ( not ( = ?auto_900548 ?auto_900552 ) ) ( not ( = ?auto_900548 ?auto_900553 ) ) ( not ( = ?auto_900548 ?auto_900554 ) ) ( not ( = ?auto_900548 ?auto_900555 ) ) ( not ( = ?auto_900548 ?auto_900556 ) ) ( not ( = ?auto_900549 ?auto_900550 ) ) ( not ( = ?auto_900549 ?auto_900551 ) ) ( not ( = ?auto_900549 ?auto_900552 ) ) ( not ( = ?auto_900549 ?auto_900553 ) ) ( not ( = ?auto_900549 ?auto_900554 ) ) ( not ( = ?auto_900549 ?auto_900555 ) ) ( not ( = ?auto_900549 ?auto_900556 ) ) ( not ( = ?auto_900550 ?auto_900551 ) ) ( not ( = ?auto_900550 ?auto_900552 ) ) ( not ( = ?auto_900550 ?auto_900553 ) ) ( not ( = ?auto_900550 ?auto_900554 ) ) ( not ( = ?auto_900550 ?auto_900555 ) ) ( not ( = ?auto_900550 ?auto_900556 ) ) ( not ( = ?auto_900551 ?auto_900552 ) ) ( not ( = ?auto_900551 ?auto_900553 ) ) ( not ( = ?auto_900551 ?auto_900554 ) ) ( not ( = ?auto_900551 ?auto_900555 ) ) ( not ( = ?auto_900551 ?auto_900556 ) ) ( not ( = ?auto_900552 ?auto_900553 ) ) ( not ( = ?auto_900552 ?auto_900554 ) ) ( not ( = ?auto_900552 ?auto_900555 ) ) ( not ( = ?auto_900552 ?auto_900556 ) ) ( not ( = ?auto_900553 ?auto_900554 ) ) ( not ( = ?auto_900553 ?auto_900555 ) ) ( not ( = ?auto_900553 ?auto_900556 ) ) ( not ( = ?auto_900554 ?auto_900555 ) ) ( not ( = ?auto_900554 ?auto_900556 ) ) ( not ( = ?auto_900555 ?auto_900556 ) ) ( ON ?auto_900554 ?auto_900555 ) ( ON ?auto_900553 ?auto_900554 ) ( ON ?auto_900552 ?auto_900553 ) ( ON ?auto_900551 ?auto_900552 ) ( ON ?auto_900550 ?auto_900551 ) ( ON ?auto_900549 ?auto_900550 ) ( CLEAR ?auto_900547 ) ( ON ?auto_900548 ?auto_900549 ) ( CLEAR ?auto_900548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_900544 ?auto_900545 ?auto_900546 ?auto_900547 ?auto_900548 )
      ( MAKE-12PILE ?auto_900544 ?auto_900545 ?auto_900546 ?auto_900547 ?auto_900548 ?auto_900549 ?auto_900550 ?auto_900551 ?auto_900552 ?auto_900553 ?auto_900554 ?auto_900555 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_900594 - BLOCK
      ?auto_900595 - BLOCK
      ?auto_900596 - BLOCK
      ?auto_900597 - BLOCK
      ?auto_900598 - BLOCK
      ?auto_900599 - BLOCK
      ?auto_900600 - BLOCK
      ?auto_900601 - BLOCK
      ?auto_900602 - BLOCK
      ?auto_900603 - BLOCK
      ?auto_900604 - BLOCK
      ?auto_900605 - BLOCK
    )
    :vars
    (
      ?auto_900606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900605 ?auto_900606 ) ( ON-TABLE ?auto_900594 ) ( ON ?auto_900595 ?auto_900594 ) ( ON ?auto_900596 ?auto_900595 ) ( not ( = ?auto_900594 ?auto_900595 ) ) ( not ( = ?auto_900594 ?auto_900596 ) ) ( not ( = ?auto_900594 ?auto_900597 ) ) ( not ( = ?auto_900594 ?auto_900598 ) ) ( not ( = ?auto_900594 ?auto_900599 ) ) ( not ( = ?auto_900594 ?auto_900600 ) ) ( not ( = ?auto_900594 ?auto_900601 ) ) ( not ( = ?auto_900594 ?auto_900602 ) ) ( not ( = ?auto_900594 ?auto_900603 ) ) ( not ( = ?auto_900594 ?auto_900604 ) ) ( not ( = ?auto_900594 ?auto_900605 ) ) ( not ( = ?auto_900594 ?auto_900606 ) ) ( not ( = ?auto_900595 ?auto_900596 ) ) ( not ( = ?auto_900595 ?auto_900597 ) ) ( not ( = ?auto_900595 ?auto_900598 ) ) ( not ( = ?auto_900595 ?auto_900599 ) ) ( not ( = ?auto_900595 ?auto_900600 ) ) ( not ( = ?auto_900595 ?auto_900601 ) ) ( not ( = ?auto_900595 ?auto_900602 ) ) ( not ( = ?auto_900595 ?auto_900603 ) ) ( not ( = ?auto_900595 ?auto_900604 ) ) ( not ( = ?auto_900595 ?auto_900605 ) ) ( not ( = ?auto_900595 ?auto_900606 ) ) ( not ( = ?auto_900596 ?auto_900597 ) ) ( not ( = ?auto_900596 ?auto_900598 ) ) ( not ( = ?auto_900596 ?auto_900599 ) ) ( not ( = ?auto_900596 ?auto_900600 ) ) ( not ( = ?auto_900596 ?auto_900601 ) ) ( not ( = ?auto_900596 ?auto_900602 ) ) ( not ( = ?auto_900596 ?auto_900603 ) ) ( not ( = ?auto_900596 ?auto_900604 ) ) ( not ( = ?auto_900596 ?auto_900605 ) ) ( not ( = ?auto_900596 ?auto_900606 ) ) ( not ( = ?auto_900597 ?auto_900598 ) ) ( not ( = ?auto_900597 ?auto_900599 ) ) ( not ( = ?auto_900597 ?auto_900600 ) ) ( not ( = ?auto_900597 ?auto_900601 ) ) ( not ( = ?auto_900597 ?auto_900602 ) ) ( not ( = ?auto_900597 ?auto_900603 ) ) ( not ( = ?auto_900597 ?auto_900604 ) ) ( not ( = ?auto_900597 ?auto_900605 ) ) ( not ( = ?auto_900597 ?auto_900606 ) ) ( not ( = ?auto_900598 ?auto_900599 ) ) ( not ( = ?auto_900598 ?auto_900600 ) ) ( not ( = ?auto_900598 ?auto_900601 ) ) ( not ( = ?auto_900598 ?auto_900602 ) ) ( not ( = ?auto_900598 ?auto_900603 ) ) ( not ( = ?auto_900598 ?auto_900604 ) ) ( not ( = ?auto_900598 ?auto_900605 ) ) ( not ( = ?auto_900598 ?auto_900606 ) ) ( not ( = ?auto_900599 ?auto_900600 ) ) ( not ( = ?auto_900599 ?auto_900601 ) ) ( not ( = ?auto_900599 ?auto_900602 ) ) ( not ( = ?auto_900599 ?auto_900603 ) ) ( not ( = ?auto_900599 ?auto_900604 ) ) ( not ( = ?auto_900599 ?auto_900605 ) ) ( not ( = ?auto_900599 ?auto_900606 ) ) ( not ( = ?auto_900600 ?auto_900601 ) ) ( not ( = ?auto_900600 ?auto_900602 ) ) ( not ( = ?auto_900600 ?auto_900603 ) ) ( not ( = ?auto_900600 ?auto_900604 ) ) ( not ( = ?auto_900600 ?auto_900605 ) ) ( not ( = ?auto_900600 ?auto_900606 ) ) ( not ( = ?auto_900601 ?auto_900602 ) ) ( not ( = ?auto_900601 ?auto_900603 ) ) ( not ( = ?auto_900601 ?auto_900604 ) ) ( not ( = ?auto_900601 ?auto_900605 ) ) ( not ( = ?auto_900601 ?auto_900606 ) ) ( not ( = ?auto_900602 ?auto_900603 ) ) ( not ( = ?auto_900602 ?auto_900604 ) ) ( not ( = ?auto_900602 ?auto_900605 ) ) ( not ( = ?auto_900602 ?auto_900606 ) ) ( not ( = ?auto_900603 ?auto_900604 ) ) ( not ( = ?auto_900603 ?auto_900605 ) ) ( not ( = ?auto_900603 ?auto_900606 ) ) ( not ( = ?auto_900604 ?auto_900605 ) ) ( not ( = ?auto_900604 ?auto_900606 ) ) ( not ( = ?auto_900605 ?auto_900606 ) ) ( ON ?auto_900604 ?auto_900605 ) ( ON ?auto_900603 ?auto_900604 ) ( ON ?auto_900602 ?auto_900603 ) ( ON ?auto_900601 ?auto_900602 ) ( ON ?auto_900600 ?auto_900601 ) ( ON ?auto_900599 ?auto_900600 ) ( ON ?auto_900598 ?auto_900599 ) ( CLEAR ?auto_900596 ) ( ON ?auto_900597 ?auto_900598 ) ( CLEAR ?auto_900597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_900594 ?auto_900595 ?auto_900596 ?auto_900597 )
      ( MAKE-12PILE ?auto_900594 ?auto_900595 ?auto_900596 ?auto_900597 ?auto_900598 ?auto_900599 ?auto_900600 ?auto_900601 ?auto_900602 ?auto_900603 ?auto_900604 ?auto_900605 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_900644 - BLOCK
      ?auto_900645 - BLOCK
      ?auto_900646 - BLOCK
      ?auto_900647 - BLOCK
      ?auto_900648 - BLOCK
      ?auto_900649 - BLOCK
      ?auto_900650 - BLOCK
      ?auto_900651 - BLOCK
      ?auto_900652 - BLOCK
      ?auto_900653 - BLOCK
      ?auto_900654 - BLOCK
      ?auto_900655 - BLOCK
    )
    :vars
    (
      ?auto_900656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900655 ?auto_900656 ) ( ON-TABLE ?auto_900644 ) ( ON ?auto_900645 ?auto_900644 ) ( not ( = ?auto_900644 ?auto_900645 ) ) ( not ( = ?auto_900644 ?auto_900646 ) ) ( not ( = ?auto_900644 ?auto_900647 ) ) ( not ( = ?auto_900644 ?auto_900648 ) ) ( not ( = ?auto_900644 ?auto_900649 ) ) ( not ( = ?auto_900644 ?auto_900650 ) ) ( not ( = ?auto_900644 ?auto_900651 ) ) ( not ( = ?auto_900644 ?auto_900652 ) ) ( not ( = ?auto_900644 ?auto_900653 ) ) ( not ( = ?auto_900644 ?auto_900654 ) ) ( not ( = ?auto_900644 ?auto_900655 ) ) ( not ( = ?auto_900644 ?auto_900656 ) ) ( not ( = ?auto_900645 ?auto_900646 ) ) ( not ( = ?auto_900645 ?auto_900647 ) ) ( not ( = ?auto_900645 ?auto_900648 ) ) ( not ( = ?auto_900645 ?auto_900649 ) ) ( not ( = ?auto_900645 ?auto_900650 ) ) ( not ( = ?auto_900645 ?auto_900651 ) ) ( not ( = ?auto_900645 ?auto_900652 ) ) ( not ( = ?auto_900645 ?auto_900653 ) ) ( not ( = ?auto_900645 ?auto_900654 ) ) ( not ( = ?auto_900645 ?auto_900655 ) ) ( not ( = ?auto_900645 ?auto_900656 ) ) ( not ( = ?auto_900646 ?auto_900647 ) ) ( not ( = ?auto_900646 ?auto_900648 ) ) ( not ( = ?auto_900646 ?auto_900649 ) ) ( not ( = ?auto_900646 ?auto_900650 ) ) ( not ( = ?auto_900646 ?auto_900651 ) ) ( not ( = ?auto_900646 ?auto_900652 ) ) ( not ( = ?auto_900646 ?auto_900653 ) ) ( not ( = ?auto_900646 ?auto_900654 ) ) ( not ( = ?auto_900646 ?auto_900655 ) ) ( not ( = ?auto_900646 ?auto_900656 ) ) ( not ( = ?auto_900647 ?auto_900648 ) ) ( not ( = ?auto_900647 ?auto_900649 ) ) ( not ( = ?auto_900647 ?auto_900650 ) ) ( not ( = ?auto_900647 ?auto_900651 ) ) ( not ( = ?auto_900647 ?auto_900652 ) ) ( not ( = ?auto_900647 ?auto_900653 ) ) ( not ( = ?auto_900647 ?auto_900654 ) ) ( not ( = ?auto_900647 ?auto_900655 ) ) ( not ( = ?auto_900647 ?auto_900656 ) ) ( not ( = ?auto_900648 ?auto_900649 ) ) ( not ( = ?auto_900648 ?auto_900650 ) ) ( not ( = ?auto_900648 ?auto_900651 ) ) ( not ( = ?auto_900648 ?auto_900652 ) ) ( not ( = ?auto_900648 ?auto_900653 ) ) ( not ( = ?auto_900648 ?auto_900654 ) ) ( not ( = ?auto_900648 ?auto_900655 ) ) ( not ( = ?auto_900648 ?auto_900656 ) ) ( not ( = ?auto_900649 ?auto_900650 ) ) ( not ( = ?auto_900649 ?auto_900651 ) ) ( not ( = ?auto_900649 ?auto_900652 ) ) ( not ( = ?auto_900649 ?auto_900653 ) ) ( not ( = ?auto_900649 ?auto_900654 ) ) ( not ( = ?auto_900649 ?auto_900655 ) ) ( not ( = ?auto_900649 ?auto_900656 ) ) ( not ( = ?auto_900650 ?auto_900651 ) ) ( not ( = ?auto_900650 ?auto_900652 ) ) ( not ( = ?auto_900650 ?auto_900653 ) ) ( not ( = ?auto_900650 ?auto_900654 ) ) ( not ( = ?auto_900650 ?auto_900655 ) ) ( not ( = ?auto_900650 ?auto_900656 ) ) ( not ( = ?auto_900651 ?auto_900652 ) ) ( not ( = ?auto_900651 ?auto_900653 ) ) ( not ( = ?auto_900651 ?auto_900654 ) ) ( not ( = ?auto_900651 ?auto_900655 ) ) ( not ( = ?auto_900651 ?auto_900656 ) ) ( not ( = ?auto_900652 ?auto_900653 ) ) ( not ( = ?auto_900652 ?auto_900654 ) ) ( not ( = ?auto_900652 ?auto_900655 ) ) ( not ( = ?auto_900652 ?auto_900656 ) ) ( not ( = ?auto_900653 ?auto_900654 ) ) ( not ( = ?auto_900653 ?auto_900655 ) ) ( not ( = ?auto_900653 ?auto_900656 ) ) ( not ( = ?auto_900654 ?auto_900655 ) ) ( not ( = ?auto_900654 ?auto_900656 ) ) ( not ( = ?auto_900655 ?auto_900656 ) ) ( ON ?auto_900654 ?auto_900655 ) ( ON ?auto_900653 ?auto_900654 ) ( ON ?auto_900652 ?auto_900653 ) ( ON ?auto_900651 ?auto_900652 ) ( ON ?auto_900650 ?auto_900651 ) ( ON ?auto_900649 ?auto_900650 ) ( ON ?auto_900648 ?auto_900649 ) ( ON ?auto_900647 ?auto_900648 ) ( CLEAR ?auto_900645 ) ( ON ?auto_900646 ?auto_900647 ) ( CLEAR ?auto_900646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_900644 ?auto_900645 ?auto_900646 )
      ( MAKE-12PILE ?auto_900644 ?auto_900645 ?auto_900646 ?auto_900647 ?auto_900648 ?auto_900649 ?auto_900650 ?auto_900651 ?auto_900652 ?auto_900653 ?auto_900654 ?auto_900655 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_900694 - BLOCK
      ?auto_900695 - BLOCK
      ?auto_900696 - BLOCK
      ?auto_900697 - BLOCK
      ?auto_900698 - BLOCK
      ?auto_900699 - BLOCK
      ?auto_900700 - BLOCK
      ?auto_900701 - BLOCK
      ?auto_900702 - BLOCK
      ?auto_900703 - BLOCK
      ?auto_900704 - BLOCK
      ?auto_900705 - BLOCK
    )
    :vars
    (
      ?auto_900706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900705 ?auto_900706 ) ( ON-TABLE ?auto_900694 ) ( not ( = ?auto_900694 ?auto_900695 ) ) ( not ( = ?auto_900694 ?auto_900696 ) ) ( not ( = ?auto_900694 ?auto_900697 ) ) ( not ( = ?auto_900694 ?auto_900698 ) ) ( not ( = ?auto_900694 ?auto_900699 ) ) ( not ( = ?auto_900694 ?auto_900700 ) ) ( not ( = ?auto_900694 ?auto_900701 ) ) ( not ( = ?auto_900694 ?auto_900702 ) ) ( not ( = ?auto_900694 ?auto_900703 ) ) ( not ( = ?auto_900694 ?auto_900704 ) ) ( not ( = ?auto_900694 ?auto_900705 ) ) ( not ( = ?auto_900694 ?auto_900706 ) ) ( not ( = ?auto_900695 ?auto_900696 ) ) ( not ( = ?auto_900695 ?auto_900697 ) ) ( not ( = ?auto_900695 ?auto_900698 ) ) ( not ( = ?auto_900695 ?auto_900699 ) ) ( not ( = ?auto_900695 ?auto_900700 ) ) ( not ( = ?auto_900695 ?auto_900701 ) ) ( not ( = ?auto_900695 ?auto_900702 ) ) ( not ( = ?auto_900695 ?auto_900703 ) ) ( not ( = ?auto_900695 ?auto_900704 ) ) ( not ( = ?auto_900695 ?auto_900705 ) ) ( not ( = ?auto_900695 ?auto_900706 ) ) ( not ( = ?auto_900696 ?auto_900697 ) ) ( not ( = ?auto_900696 ?auto_900698 ) ) ( not ( = ?auto_900696 ?auto_900699 ) ) ( not ( = ?auto_900696 ?auto_900700 ) ) ( not ( = ?auto_900696 ?auto_900701 ) ) ( not ( = ?auto_900696 ?auto_900702 ) ) ( not ( = ?auto_900696 ?auto_900703 ) ) ( not ( = ?auto_900696 ?auto_900704 ) ) ( not ( = ?auto_900696 ?auto_900705 ) ) ( not ( = ?auto_900696 ?auto_900706 ) ) ( not ( = ?auto_900697 ?auto_900698 ) ) ( not ( = ?auto_900697 ?auto_900699 ) ) ( not ( = ?auto_900697 ?auto_900700 ) ) ( not ( = ?auto_900697 ?auto_900701 ) ) ( not ( = ?auto_900697 ?auto_900702 ) ) ( not ( = ?auto_900697 ?auto_900703 ) ) ( not ( = ?auto_900697 ?auto_900704 ) ) ( not ( = ?auto_900697 ?auto_900705 ) ) ( not ( = ?auto_900697 ?auto_900706 ) ) ( not ( = ?auto_900698 ?auto_900699 ) ) ( not ( = ?auto_900698 ?auto_900700 ) ) ( not ( = ?auto_900698 ?auto_900701 ) ) ( not ( = ?auto_900698 ?auto_900702 ) ) ( not ( = ?auto_900698 ?auto_900703 ) ) ( not ( = ?auto_900698 ?auto_900704 ) ) ( not ( = ?auto_900698 ?auto_900705 ) ) ( not ( = ?auto_900698 ?auto_900706 ) ) ( not ( = ?auto_900699 ?auto_900700 ) ) ( not ( = ?auto_900699 ?auto_900701 ) ) ( not ( = ?auto_900699 ?auto_900702 ) ) ( not ( = ?auto_900699 ?auto_900703 ) ) ( not ( = ?auto_900699 ?auto_900704 ) ) ( not ( = ?auto_900699 ?auto_900705 ) ) ( not ( = ?auto_900699 ?auto_900706 ) ) ( not ( = ?auto_900700 ?auto_900701 ) ) ( not ( = ?auto_900700 ?auto_900702 ) ) ( not ( = ?auto_900700 ?auto_900703 ) ) ( not ( = ?auto_900700 ?auto_900704 ) ) ( not ( = ?auto_900700 ?auto_900705 ) ) ( not ( = ?auto_900700 ?auto_900706 ) ) ( not ( = ?auto_900701 ?auto_900702 ) ) ( not ( = ?auto_900701 ?auto_900703 ) ) ( not ( = ?auto_900701 ?auto_900704 ) ) ( not ( = ?auto_900701 ?auto_900705 ) ) ( not ( = ?auto_900701 ?auto_900706 ) ) ( not ( = ?auto_900702 ?auto_900703 ) ) ( not ( = ?auto_900702 ?auto_900704 ) ) ( not ( = ?auto_900702 ?auto_900705 ) ) ( not ( = ?auto_900702 ?auto_900706 ) ) ( not ( = ?auto_900703 ?auto_900704 ) ) ( not ( = ?auto_900703 ?auto_900705 ) ) ( not ( = ?auto_900703 ?auto_900706 ) ) ( not ( = ?auto_900704 ?auto_900705 ) ) ( not ( = ?auto_900704 ?auto_900706 ) ) ( not ( = ?auto_900705 ?auto_900706 ) ) ( ON ?auto_900704 ?auto_900705 ) ( ON ?auto_900703 ?auto_900704 ) ( ON ?auto_900702 ?auto_900703 ) ( ON ?auto_900701 ?auto_900702 ) ( ON ?auto_900700 ?auto_900701 ) ( ON ?auto_900699 ?auto_900700 ) ( ON ?auto_900698 ?auto_900699 ) ( ON ?auto_900697 ?auto_900698 ) ( ON ?auto_900696 ?auto_900697 ) ( CLEAR ?auto_900694 ) ( ON ?auto_900695 ?auto_900696 ) ( CLEAR ?auto_900695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_900694 ?auto_900695 )
      ( MAKE-12PILE ?auto_900694 ?auto_900695 ?auto_900696 ?auto_900697 ?auto_900698 ?auto_900699 ?auto_900700 ?auto_900701 ?auto_900702 ?auto_900703 ?auto_900704 ?auto_900705 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_900744 - BLOCK
      ?auto_900745 - BLOCK
      ?auto_900746 - BLOCK
      ?auto_900747 - BLOCK
      ?auto_900748 - BLOCK
      ?auto_900749 - BLOCK
      ?auto_900750 - BLOCK
      ?auto_900751 - BLOCK
      ?auto_900752 - BLOCK
      ?auto_900753 - BLOCK
      ?auto_900754 - BLOCK
      ?auto_900755 - BLOCK
    )
    :vars
    (
      ?auto_900756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900755 ?auto_900756 ) ( not ( = ?auto_900744 ?auto_900745 ) ) ( not ( = ?auto_900744 ?auto_900746 ) ) ( not ( = ?auto_900744 ?auto_900747 ) ) ( not ( = ?auto_900744 ?auto_900748 ) ) ( not ( = ?auto_900744 ?auto_900749 ) ) ( not ( = ?auto_900744 ?auto_900750 ) ) ( not ( = ?auto_900744 ?auto_900751 ) ) ( not ( = ?auto_900744 ?auto_900752 ) ) ( not ( = ?auto_900744 ?auto_900753 ) ) ( not ( = ?auto_900744 ?auto_900754 ) ) ( not ( = ?auto_900744 ?auto_900755 ) ) ( not ( = ?auto_900744 ?auto_900756 ) ) ( not ( = ?auto_900745 ?auto_900746 ) ) ( not ( = ?auto_900745 ?auto_900747 ) ) ( not ( = ?auto_900745 ?auto_900748 ) ) ( not ( = ?auto_900745 ?auto_900749 ) ) ( not ( = ?auto_900745 ?auto_900750 ) ) ( not ( = ?auto_900745 ?auto_900751 ) ) ( not ( = ?auto_900745 ?auto_900752 ) ) ( not ( = ?auto_900745 ?auto_900753 ) ) ( not ( = ?auto_900745 ?auto_900754 ) ) ( not ( = ?auto_900745 ?auto_900755 ) ) ( not ( = ?auto_900745 ?auto_900756 ) ) ( not ( = ?auto_900746 ?auto_900747 ) ) ( not ( = ?auto_900746 ?auto_900748 ) ) ( not ( = ?auto_900746 ?auto_900749 ) ) ( not ( = ?auto_900746 ?auto_900750 ) ) ( not ( = ?auto_900746 ?auto_900751 ) ) ( not ( = ?auto_900746 ?auto_900752 ) ) ( not ( = ?auto_900746 ?auto_900753 ) ) ( not ( = ?auto_900746 ?auto_900754 ) ) ( not ( = ?auto_900746 ?auto_900755 ) ) ( not ( = ?auto_900746 ?auto_900756 ) ) ( not ( = ?auto_900747 ?auto_900748 ) ) ( not ( = ?auto_900747 ?auto_900749 ) ) ( not ( = ?auto_900747 ?auto_900750 ) ) ( not ( = ?auto_900747 ?auto_900751 ) ) ( not ( = ?auto_900747 ?auto_900752 ) ) ( not ( = ?auto_900747 ?auto_900753 ) ) ( not ( = ?auto_900747 ?auto_900754 ) ) ( not ( = ?auto_900747 ?auto_900755 ) ) ( not ( = ?auto_900747 ?auto_900756 ) ) ( not ( = ?auto_900748 ?auto_900749 ) ) ( not ( = ?auto_900748 ?auto_900750 ) ) ( not ( = ?auto_900748 ?auto_900751 ) ) ( not ( = ?auto_900748 ?auto_900752 ) ) ( not ( = ?auto_900748 ?auto_900753 ) ) ( not ( = ?auto_900748 ?auto_900754 ) ) ( not ( = ?auto_900748 ?auto_900755 ) ) ( not ( = ?auto_900748 ?auto_900756 ) ) ( not ( = ?auto_900749 ?auto_900750 ) ) ( not ( = ?auto_900749 ?auto_900751 ) ) ( not ( = ?auto_900749 ?auto_900752 ) ) ( not ( = ?auto_900749 ?auto_900753 ) ) ( not ( = ?auto_900749 ?auto_900754 ) ) ( not ( = ?auto_900749 ?auto_900755 ) ) ( not ( = ?auto_900749 ?auto_900756 ) ) ( not ( = ?auto_900750 ?auto_900751 ) ) ( not ( = ?auto_900750 ?auto_900752 ) ) ( not ( = ?auto_900750 ?auto_900753 ) ) ( not ( = ?auto_900750 ?auto_900754 ) ) ( not ( = ?auto_900750 ?auto_900755 ) ) ( not ( = ?auto_900750 ?auto_900756 ) ) ( not ( = ?auto_900751 ?auto_900752 ) ) ( not ( = ?auto_900751 ?auto_900753 ) ) ( not ( = ?auto_900751 ?auto_900754 ) ) ( not ( = ?auto_900751 ?auto_900755 ) ) ( not ( = ?auto_900751 ?auto_900756 ) ) ( not ( = ?auto_900752 ?auto_900753 ) ) ( not ( = ?auto_900752 ?auto_900754 ) ) ( not ( = ?auto_900752 ?auto_900755 ) ) ( not ( = ?auto_900752 ?auto_900756 ) ) ( not ( = ?auto_900753 ?auto_900754 ) ) ( not ( = ?auto_900753 ?auto_900755 ) ) ( not ( = ?auto_900753 ?auto_900756 ) ) ( not ( = ?auto_900754 ?auto_900755 ) ) ( not ( = ?auto_900754 ?auto_900756 ) ) ( not ( = ?auto_900755 ?auto_900756 ) ) ( ON ?auto_900754 ?auto_900755 ) ( ON ?auto_900753 ?auto_900754 ) ( ON ?auto_900752 ?auto_900753 ) ( ON ?auto_900751 ?auto_900752 ) ( ON ?auto_900750 ?auto_900751 ) ( ON ?auto_900749 ?auto_900750 ) ( ON ?auto_900748 ?auto_900749 ) ( ON ?auto_900747 ?auto_900748 ) ( ON ?auto_900746 ?auto_900747 ) ( ON ?auto_900745 ?auto_900746 ) ( ON ?auto_900744 ?auto_900745 ) ( CLEAR ?auto_900744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_900744 )
      ( MAKE-12PILE ?auto_900744 ?auto_900745 ?auto_900746 ?auto_900747 ?auto_900748 ?auto_900749 ?auto_900750 ?auto_900751 ?auto_900752 ?auto_900753 ?auto_900754 ?auto_900755 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_900795 - BLOCK
      ?auto_900796 - BLOCK
      ?auto_900797 - BLOCK
      ?auto_900798 - BLOCK
      ?auto_900799 - BLOCK
      ?auto_900800 - BLOCK
      ?auto_900801 - BLOCK
      ?auto_900802 - BLOCK
      ?auto_900803 - BLOCK
      ?auto_900804 - BLOCK
      ?auto_900805 - BLOCK
      ?auto_900806 - BLOCK
      ?auto_900807 - BLOCK
    )
    :vars
    (
      ?auto_900808 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_900806 ) ( ON ?auto_900807 ?auto_900808 ) ( CLEAR ?auto_900807 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_900795 ) ( ON ?auto_900796 ?auto_900795 ) ( ON ?auto_900797 ?auto_900796 ) ( ON ?auto_900798 ?auto_900797 ) ( ON ?auto_900799 ?auto_900798 ) ( ON ?auto_900800 ?auto_900799 ) ( ON ?auto_900801 ?auto_900800 ) ( ON ?auto_900802 ?auto_900801 ) ( ON ?auto_900803 ?auto_900802 ) ( ON ?auto_900804 ?auto_900803 ) ( ON ?auto_900805 ?auto_900804 ) ( ON ?auto_900806 ?auto_900805 ) ( not ( = ?auto_900795 ?auto_900796 ) ) ( not ( = ?auto_900795 ?auto_900797 ) ) ( not ( = ?auto_900795 ?auto_900798 ) ) ( not ( = ?auto_900795 ?auto_900799 ) ) ( not ( = ?auto_900795 ?auto_900800 ) ) ( not ( = ?auto_900795 ?auto_900801 ) ) ( not ( = ?auto_900795 ?auto_900802 ) ) ( not ( = ?auto_900795 ?auto_900803 ) ) ( not ( = ?auto_900795 ?auto_900804 ) ) ( not ( = ?auto_900795 ?auto_900805 ) ) ( not ( = ?auto_900795 ?auto_900806 ) ) ( not ( = ?auto_900795 ?auto_900807 ) ) ( not ( = ?auto_900795 ?auto_900808 ) ) ( not ( = ?auto_900796 ?auto_900797 ) ) ( not ( = ?auto_900796 ?auto_900798 ) ) ( not ( = ?auto_900796 ?auto_900799 ) ) ( not ( = ?auto_900796 ?auto_900800 ) ) ( not ( = ?auto_900796 ?auto_900801 ) ) ( not ( = ?auto_900796 ?auto_900802 ) ) ( not ( = ?auto_900796 ?auto_900803 ) ) ( not ( = ?auto_900796 ?auto_900804 ) ) ( not ( = ?auto_900796 ?auto_900805 ) ) ( not ( = ?auto_900796 ?auto_900806 ) ) ( not ( = ?auto_900796 ?auto_900807 ) ) ( not ( = ?auto_900796 ?auto_900808 ) ) ( not ( = ?auto_900797 ?auto_900798 ) ) ( not ( = ?auto_900797 ?auto_900799 ) ) ( not ( = ?auto_900797 ?auto_900800 ) ) ( not ( = ?auto_900797 ?auto_900801 ) ) ( not ( = ?auto_900797 ?auto_900802 ) ) ( not ( = ?auto_900797 ?auto_900803 ) ) ( not ( = ?auto_900797 ?auto_900804 ) ) ( not ( = ?auto_900797 ?auto_900805 ) ) ( not ( = ?auto_900797 ?auto_900806 ) ) ( not ( = ?auto_900797 ?auto_900807 ) ) ( not ( = ?auto_900797 ?auto_900808 ) ) ( not ( = ?auto_900798 ?auto_900799 ) ) ( not ( = ?auto_900798 ?auto_900800 ) ) ( not ( = ?auto_900798 ?auto_900801 ) ) ( not ( = ?auto_900798 ?auto_900802 ) ) ( not ( = ?auto_900798 ?auto_900803 ) ) ( not ( = ?auto_900798 ?auto_900804 ) ) ( not ( = ?auto_900798 ?auto_900805 ) ) ( not ( = ?auto_900798 ?auto_900806 ) ) ( not ( = ?auto_900798 ?auto_900807 ) ) ( not ( = ?auto_900798 ?auto_900808 ) ) ( not ( = ?auto_900799 ?auto_900800 ) ) ( not ( = ?auto_900799 ?auto_900801 ) ) ( not ( = ?auto_900799 ?auto_900802 ) ) ( not ( = ?auto_900799 ?auto_900803 ) ) ( not ( = ?auto_900799 ?auto_900804 ) ) ( not ( = ?auto_900799 ?auto_900805 ) ) ( not ( = ?auto_900799 ?auto_900806 ) ) ( not ( = ?auto_900799 ?auto_900807 ) ) ( not ( = ?auto_900799 ?auto_900808 ) ) ( not ( = ?auto_900800 ?auto_900801 ) ) ( not ( = ?auto_900800 ?auto_900802 ) ) ( not ( = ?auto_900800 ?auto_900803 ) ) ( not ( = ?auto_900800 ?auto_900804 ) ) ( not ( = ?auto_900800 ?auto_900805 ) ) ( not ( = ?auto_900800 ?auto_900806 ) ) ( not ( = ?auto_900800 ?auto_900807 ) ) ( not ( = ?auto_900800 ?auto_900808 ) ) ( not ( = ?auto_900801 ?auto_900802 ) ) ( not ( = ?auto_900801 ?auto_900803 ) ) ( not ( = ?auto_900801 ?auto_900804 ) ) ( not ( = ?auto_900801 ?auto_900805 ) ) ( not ( = ?auto_900801 ?auto_900806 ) ) ( not ( = ?auto_900801 ?auto_900807 ) ) ( not ( = ?auto_900801 ?auto_900808 ) ) ( not ( = ?auto_900802 ?auto_900803 ) ) ( not ( = ?auto_900802 ?auto_900804 ) ) ( not ( = ?auto_900802 ?auto_900805 ) ) ( not ( = ?auto_900802 ?auto_900806 ) ) ( not ( = ?auto_900802 ?auto_900807 ) ) ( not ( = ?auto_900802 ?auto_900808 ) ) ( not ( = ?auto_900803 ?auto_900804 ) ) ( not ( = ?auto_900803 ?auto_900805 ) ) ( not ( = ?auto_900803 ?auto_900806 ) ) ( not ( = ?auto_900803 ?auto_900807 ) ) ( not ( = ?auto_900803 ?auto_900808 ) ) ( not ( = ?auto_900804 ?auto_900805 ) ) ( not ( = ?auto_900804 ?auto_900806 ) ) ( not ( = ?auto_900804 ?auto_900807 ) ) ( not ( = ?auto_900804 ?auto_900808 ) ) ( not ( = ?auto_900805 ?auto_900806 ) ) ( not ( = ?auto_900805 ?auto_900807 ) ) ( not ( = ?auto_900805 ?auto_900808 ) ) ( not ( = ?auto_900806 ?auto_900807 ) ) ( not ( = ?auto_900806 ?auto_900808 ) ) ( not ( = ?auto_900807 ?auto_900808 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_900807 ?auto_900808 )
      ( !STACK ?auto_900807 ?auto_900806 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_900849 - BLOCK
      ?auto_900850 - BLOCK
      ?auto_900851 - BLOCK
      ?auto_900852 - BLOCK
      ?auto_900853 - BLOCK
      ?auto_900854 - BLOCK
      ?auto_900855 - BLOCK
      ?auto_900856 - BLOCK
      ?auto_900857 - BLOCK
      ?auto_900858 - BLOCK
      ?auto_900859 - BLOCK
      ?auto_900860 - BLOCK
      ?auto_900861 - BLOCK
    )
    :vars
    (
      ?auto_900862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900861 ?auto_900862 ) ( ON-TABLE ?auto_900849 ) ( ON ?auto_900850 ?auto_900849 ) ( ON ?auto_900851 ?auto_900850 ) ( ON ?auto_900852 ?auto_900851 ) ( ON ?auto_900853 ?auto_900852 ) ( ON ?auto_900854 ?auto_900853 ) ( ON ?auto_900855 ?auto_900854 ) ( ON ?auto_900856 ?auto_900855 ) ( ON ?auto_900857 ?auto_900856 ) ( ON ?auto_900858 ?auto_900857 ) ( ON ?auto_900859 ?auto_900858 ) ( not ( = ?auto_900849 ?auto_900850 ) ) ( not ( = ?auto_900849 ?auto_900851 ) ) ( not ( = ?auto_900849 ?auto_900852 ) ) ( not ( = ?auto_900849 ?auto_900853 ) ) ( not ( = ?auto_900849 ?auto_900854 ) ) ( not ( = ?auto_900849 ?auto_900855 ) ) ( not ( = ?auto_900849 ?auto_900856 ) ) ( not ( = ?auto_900849 ?auto_900857 ) ) ( not ( = ?auto_900849 ?auto_900858 ) ) ( not ( = ?auto_900849 ?auto_900859 ) ) ( not ( = ?auto_900849 ?auto_900860 ) ) ( not ( = ?auto_900849 ?auto_900861 ) ) ( not ( = ?auto_900849 ?auto_900862 ) ) ( not ( = ?auto_900850 ?auto_900851 ) ) ( not ( = ?auto_900850 ?auto_900852 ) ) ( not ( = ?auto_900850 ?auto_900853 ) ) ( not ( = ?auto_900850 ?auto_900854 ) ) ( not ( = ?auto_900850 ?auto_900855 ) ) ( not ( = ?auto_900850 ?auto_900856 ) ) ( not ( = ?auto_900850 ?auto_900857 ) ) ( not ( = ?auto_900850 ?auto_900858 ) ) ( not ( = ?auto_900850 ?auto_900859 ) ) ( not ( = ?auto_900850 ?auto_900860 ) ) ( not ( = ?auto_900850 ?auto_900861 ) ) ( not ( = ?auto_900850 ?auto_900862 ) ) ( not ( = ?auto_900851 ?auto_900852 ) ) ( not ( = ?auto_900851 ?auto_900853 ) ) ( not ( = ?auto_900851 ?auto_900854 ) ) ( not ( = ?auto_900851 ?auto_900855 ) ) ( not ( = ?auto_900851 ?auto_900856 ) ) ( not ( = ?auto_900851 ?auto_900857 ) ) ( not ( = ?auto_900851 ?auto_900858 ) ) ( not ( = ?auto_900851 ?auto_900859 ) ) ( not ( = ?auto_900851 ?auto_900860 ) ) ( not ( = ?auto_900851 ?auto_900861 ) ) ( not ( = ?auto_900851 ?auto_900862 ) ) ( not ( = ?auto_900852 ?auto_900853 ) ) ( not ( = ?auto_900852 ?auto_900854 ) ) ( not ( = ?auto_900852 ?auto_900855 ) ) ( not ( = ?auto_900852 ?auto_900856 ) ) ( not ( = ?auto_900852 ?auto_900857 ) ) ( not ( = ?auto_900852 ?auto_900858 ) ) ( not ( = ?auto_900852 ?auto_900859 ) ) ( not ( = ?auto_900852 ?auto_900860 ) ) ( not ( = ?auto_900852 ?auto_900861 ) ) ( not ( = ?auto_900852 ?auto_900862 ) ) ( not ( = ?auto_900853 ?auto_900854 ) ) ( not ( = ?auto_900853 ?auto_900855 ) ) ( not ( = ?auto_900853 ?auto_900856 ) ) ( not ( = ?auto_900853 ?auto_900857 ) ) ( not ( = ?auto_900853 ?auto_900858 ) ) ( not ( = ?auto_900853 ?auto_900859 ) ) ( not ( = ?auto_900853 ?auto_900860 ) ) ( not ( = ?auto_900853 ?auto_900861 ) ) ( not ( = ?auto_900853 ?auto_900862 ) ) ( not ( = ?auto_900854 ?auto_900855 ) ) ( not ( = ?auto_900854 ?auto_900856 ) ) ( not ( = ?auto_900854 ?auto_900857 ) ) ( not ( = ?auto_900854 ?auto_900858 ) ) ( not ( = ?auto_900854 ?auto_900859 ) ) ( not ( = ?auto_900854 ?auto_900860 ) ) ( not ( = ?auto_900854 ?auto_900861 ) ) ( not ( = ?auto_900854 ?auto_900862 ) ) ( not ( = ?auto_900855 ?auto_900856 ) ) ( not ( = ?auto_900855 ?auto_900857 ) ) ( not ( = ?auto_900855 ?auto_900858 ) ) ( not ( = ?auto_900855 ?auto_900859 ) ) ( not ( = ?auto_900855 ?auto_900860 ) ) ( not ( = ?auto_900855 ?auto_900861 ) ) ( not ( = ?auto_900855 ?auto_900862 ) ) ( not ( = ?auto_900856 ?auto_900857 ) ) ( not ( = ?auto_900856 ?auto_900858 ) ) ( not ( = ?auto_900856 ?auto_900859 ) ) ( not ( = ?auto_900856 ?auto_900860 ) ) ( not ( = ?auto_900856 ?auto_900861 ) ) ( not ( = ?auto_900856 ?auto_900862 ) ) ( not ( = ?auto_900857 ?auto_900858 ) ) ( not ( = ?auto_900857 ?auto_900859 ) ) ( not ( = ?auto_900857 ?auto_900860 ) ) ( not ( = ?auto_900857 ?auto_900861 ) ) ( not ( = ?auto_900857 ?auto_900862 ) ) ( not ( = ?auto_900858 ?auto_900859 ) ) ( not ( = ?auto_900858 ?auto_900860 ) ) ( not ( = ?auto_900858 ?auto_900861 ) ) ( not ( = ?auto_900858 ?auto_900862 ) ) ( not ( = ?auto_900859 ?auto_900860 ) ) ( not ( = ?auto_900859 ?auto_900861 ) ) ( not ( = ?auto_900859 ?auto_900862 ) ) ( not ( = ?auto_900860 ?auto_900861 ) ) ( not ( = ?auto_900860 ?auto_900862 ) ) ( not ( = ?auto_900861 ?auto_900862 ) ) ( CLEAR ?auto_900859 ) ( ON ?auto_900860 ?auto_900861 ) ( CLEAR ?auto_900860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_900849 ?auto_900850 ?auto_900851 ?auto_900852 ?auto_900853 ?auto_900854 ?auto_900855 ?auto_900856 ?auto_900857 ?auto_900858 ?auto_900859 ?auto_900860 )
      ( MAKE-13PILE ?auto_900849 ?auto_900850 ?auto_900851 ?auto_900852 ?auto_900853 ?auto_900854 ?auto_900855 ?auto_900856 ?auto_900857 ?auto_900858 ?auto_900859 ?auto_900860 ?auto_900861 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_900903 - BLOCK
      ?auto_900904 - BLOCK
      ?auto_900905 - BLOCK
      ?auto_900906 - BLOCK
      ?auto_900907 - BLOCK
      ?auto_900908 - BLOCK
      ?auto_900909 - BLOCK
      ?auto_900910 - BLOCK
      ?auto_900911 - BLOCK
      ?auto_900912 - BLOCK
      ?auto_900913 - BLOCK
      ?auto_900914 - BLOCK
      ?auto_900915 - BLOCK
    )
    :vars
    (
      ?auto_900916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900915 ?auto_900916 ) ( ON-TABLE ?auto_900903 ) ( ON ?auto_900904 ?auto_900903 ) ( ON ?auto_900905 ?auto_900904 ) ( ON ?auto_900906 ?auto_900905 ) ( ON ?auto_900907 ?auto_900906 ) ( ON ?auto_900908 ?auto_900907 ) ( ON ?auto_900909 ?auto_900908 ) ( ON ?auto_900910 ?auto_900909 ) ( ON ?auto_900911 ?auto_900910 ) ( ON ?auto_900912 ?auto_900911 ) ( not ( = ?auto_900903 ?auto_900904 ) ) ( not ( = ?auto_900903 ?auto_900905 ) ) ( not ( = ?auto_900903 ?auto_900906 ) ) ( not ( = ?auto_900903 ?auto_900907 ) ) ( not ( = ?auto_900903 ?auto_900908 ) ) ( not ( = ?auto_900903 ?auto_900909 ) ) ( not ( = ?auto_900903 ?auto_900910 ) ) ( not ( = ?auto_900903 ?auto_900911 ) ) ( not ( = ?auto_900903 ?auto_900912 ) ) ( not ( = ?auto_900903 ?auto_900913 ) ) ( not ( = ?auto_900903 ?auto_900914 ) ) ( not ( = ?auto_900903 ?auto_900915 ) ) ( not ( = ?auto_900903 ?auto_900916 ) ) ( not ( = ?auto_900904 ?auto_900905 ) ) ( not ( = ?auto_900904 ?auto_900906 ) ) ( not ( = ?auto_900904 ?auto_900907 ) ) ( not ( = ?auto_900904 ?auto_900908 ) ) ( not ( = ?auto_900904 ?auto_900909 ) ) ( not ( = ?auto_900904 ?auto_900910 ) ) ( not ( = ?auto_900904 ?auto_900911 ) ) ( not ( = ?auto_900904 ?auto_900912 ) ) ( not ( = ?auto_900904 ?auto_900913 ) ) ( not ( = ?auto_900904 ?auto_900914 ) ) ( not ( = ?auto_900904 ?auto_900915 ) ) ( not ( = ?auto_900904 ?auto_900916 ) ) ( not ( = ?auto_900905 ?auto_900906 ) ) ( not ( = ?auto_900905 ?auto_900907 ) ) ( not ( = ?auto_900905 ?auto_900908 ) ) ( not ( = ?auto_900905 ?auto_900909 ) ) ( not ( = ?auto_900905 ?auto_900910 ) ) ( not ( = ?auto_900905 ?auto_900911 ) ) ( not ( = ?auto_900905 ?auto_900912 ) ) ( not ( = ?auto_900905 ?auto_900913 ) ) ( not ( = ?auto_900905 ?auto_900914 ) ) ( not ( = ?auto_900905 ?auto_900915 ) ) ( not ( = ?auto_900905 ?auto_900916 ) ) ( not ( = ?auto_900906 ?auto_900907 ) ) ( not ( = ?auto_900906 ?auto_900908 ) ) ( not ( = ?auto_900906 ?auto_900909 ) ) ( not ( = ?auto_900906 ?auto_900910 ) ) ( not ( = ?auto_900906 ?auto_900911 ) ) ( not ( = ?auto_900906 ?auto_900912 ) ) ( not ( = ?auto_900906 ?auto_900913 ) ) ( not ( = ?auto_900906 ?auto_900914 ) ) ( not ( = ?auto_900906 ?auto_900915 ) ) ( not ( = ?auto_900906 ?auto_900916 ) ) ( not ( = ?auto_900907 ?auto_900908 ) ) ( not ( = ?auto_900907 ?auto_900909 ) ) ( not ( = ?auto_900907 ?auto_900910 ) ) ( not ( = ?auto_900907 ?auto_900911 ) ) ( not ( = ?auto_900907 ?auto_900912 ) ) ( not ( = ?auto_900907 ?auto_900913 ) ) ( not ( = ?auto_900907 ?auto_900914 ) ) ( not ( = ?auto_900907 ?auto_900915 ) ) ( not ( = ?auto_900907 ?auto_900916 ) ) ( not ( = ?auto_900908 ?auto_900909 ) ) ( not ( = ?auto_900908 ?auto_900910 ) ) ( not ( = ?auto_900908 ?auto_900911 ) ) ( not ( = ?auto_900908 ?auto_900912 ) ) ( not ( = ?auto_900908 ?auto_900913 ) ) ( not ( = ?auto_900908 ?auto_900914 ) ) ( not ( = ?auto_900908 ?auto_900915 ) ) ( not ( = ?auto_900908 ?auto_900916 ) ) ( not ( = ?auto_900909 ?auto_900910 ) ) ( not ( = ?auto_900909 ?auto_900911 ) ) ( not ( = ?auto_900909 ?auto_900912 ) ) ( not ( = ?auto_900909 ?auto_900913 ) ) ( not ( = ?auto_900909 ?auto_900914 ) ) ( not ( = ?auto_900909 ?auto_900915 ) ) ( not ( = ?auto_900909 ?auto_900916 ) ) ( not ( = ?auto_900910 ?auto_900911 ) ) ( not ( = ?auto_900910 ?auto_900912 ) ) ( not ( = ?auto_900910 ?auto_900913 ) ) ( not ( = ?auto_900910 ?auto_900914 ) ) ( not ( = ?auto_900910 ?auto_900915 ) ) ( not ( = ?auto_900910 ?auto_900916 ) ) ( not ( = ?auto_900911 ?auto_900912 ) ) ( not ( = ?auto_900911 ?auto_900913 ) ) ( not ( = ?auto_900911 ?auto_900914 ) ) ( not ( = ?auto_900911 ?auto_900915 ) ) ( not ( = ?auto_900911 ?auto_900916 ) ) ( not ( = ?auto_900912 ?auto_900913 ) ) ( not ( = ?auto_900912 ?auto_900914 ) ) ( not ( = ?auto_900912 ?auto_900915 ) ) ( not ( = ?auto_900912 ?auto_900916 ) ) ( not ( = ?auto_900913 ?auto_900914 ) ) ( not ( = ?auto_900913 ?auto_900915 ) ) ( not ( = ?auto_900913 ?auto_900916 ) ) ( not ( = ?auto_900914 ?auto_900915 ) ) ( not ( = ?auto_900914 ?auto_900916 ) ) ( not ( = ?auto_900915 ?auto_900916 ) ) ( ON ?auto_900914 ?auto_900915 ) ( CLEAR ?auto_900912 ) ( ON ?auto_900913 ?auto_900914 ) ( CLEAR ?auto_900913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_900903 ?auto_900904 ?auto_900905 ?auto_900906 ?auto_900907 ?auto_900908 ?auto_900909 ?auto_900910 ?auto_900911 ?auto_900912 ?auto_900913 )
      ( MAKE-13PILE ?auto_900903 ?auto_900904 ?auto_900905 ?auto_900906 ?auto_900907 ?auto_900908 ?auto_900909 ?auto_900910 ?auto_900911 ?auto_900912 ?auto_900913 ?auto_900914 ?auto_900915 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_900957 - BLOCK
      ?auto_900958 - BLOCK
      ?auto_900959 - BLOCK
      ?auto_900960 - BLOCK
      ?auto_900961 - BLOCK
      ?auto_900962 - BLOCK
      ?auto_900963 - BLOCK
      ?auto_900964 - BLOCK
      ?auto_900965 - BLOCK
      ?auto_900966 - BLOCK
      ?auto_900967 - BLOCK
      ?auto_900968 - BLOCK
      ?auto_900969 - BLOCK
    )
    :vars
    (
      ?auto_900970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_900969 ?auto_900970 ) ( ON-TABLE ?auto_900957 ) ( ON ?auto_900958 ?auto_900957 ) ( ON ?auto_900959 ?auto_900958 ) ( ON ?auto_900960 ?auto_900959 ) ( ON ?auto_900961 ?auto_900960 ) ( ON ?auto_900962 ?auto_900961 ) ( ON ?auto_900963 ?auto_900962 ) ( ON ?auto_900964 ?auto_900963 ) ( ON ?auto_900965 ?auto_900964 ) ( not ( = ?auto_900957 ?auto_900958 ) ) ( not ( = ?auto_900957 ?auto_900959 ) ) ( not ( = ?auto_900957 ?auto_900960 ) ) ( not ( = ?auto_900957 ?auto_900961 ) ) ( not ( = ?auto_900957 ?auto_900962 ) ) ( not ( = ?auto_900957 ?auto_900963 ) ) ( not ( = ?auto_900957 ?auto_900964 ) ) ( not ( = ?auto_900957 ?auto_900965 ) ) ( not ( = ?auto_900957 ?auto_900966 ) ) ( not ( = ?auto_900957 ?auto_900967 ) ) ( not ( = ?auto_900957 ?auto_900968 ) ) ( not ( = ?auto_900957 ?auto_900969 ) ) ( not ( = ?auto_900957 ?auto_900970 ) ) ( not ( = ?auto_900958 ?auto_900959 ) ) ( not ( = ?auto_900958 ?auto_900960 ) ) ( not ( = ?auto_900958 ?auto_900961 ) ) ( not ( = ?auto_900958 ?auto_900962 ) ) ( not ( = ?auto_900958 ?auto_900963 ) ) ( not ( = ?auto_900958 ?auto_900964 ) ) ( not ( = ?auto_900958 ?auto_900965 ) ) ( not ( = ?auto_900958 ?auto_900966 ) ) ( not ( = ?auto_900958 ?auto_900967 ) ) ( not ( = ?auto_900958 ?auto_900968 ) ) ( not ( = ?auto_900958 ?auto_900969 ) ) ( not ( = ?auto_900958 ?auto_900970 ) ) ( not ( = ?auto_900959 ?auto_900960 ) ) ( not ( = ?auto_900959 ?auto_900961 ) ) ( not ( = ?auto_900959 ?auto_900962 ) ) ( not ( = ?auto_900959 ?auto_900963 ) ) ( not ( = ?auto_900959 ?auto_900964 ) ) ( not ( = ?auto_900959 ?auto_900965 ) ) ( not ( = ?auto_900959 ?auto_900966 ) ) ( not ( = ?auto_900959 ?auto_900967 ) ) ( not ( = ?auto_900959 ?auto_900968 ) ) ( not ( = ?auto_900959 ?auto_900969 ) ) ( not ( = ?auto_900959 ?auto_900970 ) ) ( not ( = ?auto_900960 ?auto_900961 ) ) ( not ( = ?auto_900960 ?auto_900962 ) ) ( not ( = ?auto_900960 ?auto_900963 ) ) ( not ( = ?auto_900960 ?auto_900964 ) ) ( not ( = ?auto_900960 ?auto_900965 ) ) ( not ( = ?auto_900960 ?auto_900966 ) ) ( not ( = ?auto_900960 ?auto_900967 ) ) ( not ( = ?auto_900960 ?auto_900968 ) ) ( not ( = ?auto_900960 ?auto_900969 ) ) ( not ( = ?auto_900960 ?auto_900970 ) ) ( not ( = ?auto_900961 ?auto_900962 ) ) ( not ( = ?auto_900961 ?auto_900963 ) ) ( not ( = ?auto_900961 ?auto_900964 ) ) ( not ( = ?auto_900961 ?auto_900965 ) ) ( not ( = ?auto_900961 ?auto_900966 ) ) ( not ( = ?auto_900961 ?auto_900967 ) ) ( not ( = ?auto_900961 ?auto_900968 ) ) ( not ( = ?auto_900961 ?auto_900969 ) ) ( not ( = ?auto_900961 ?auto_900970 ) ) ( not ( = ?auto_900962 ?auto_900963 ) ) ( not ( = ?auto_900962 ?auto_900964 ) ) ( not ( = ?auto_900962 ?auto_900965 ) ) ( not ( = ?auto_900962 ?auto_900966 ) ) ( not ( = ?auto_900962 ?auto_900967 ) ) ( not ( = ?auto_900962 ?auto_900968 ) ) ( not ( = ?auto_900962 ?auto_900969 ) ) ( not ( = ?auto_900962 ?auto_900970 ) ) ( not ( = ?auto_900963 ?auto_900964 ) ) ( not ( = ?auto_900963 ?auto_900965 ) ) ( not ( = ?auto_900963 ?auto_900966 ) ) ( not ( = ?auto_900963 ?auto_900967 ) ) ( not ( = ?auto_900963 ?auto_900968 ) ) ( not ( = ?auto_900963 ?auto_900969 ) ) ( not ( = ?auto_900963 ?auto_900970 ) ) ( not ( = ?auto_900964 ?auto_900965 ) ) ( not ( = ?auto_900964 ?auto_900966 ) ) ( not ( = ?auto_900964 ?auto_900967 ) ) ( not ( = ?auto_900964 ?auto_900968 ) ) ( not ( = ?auto_900964 ?auto_900969 ) ) ( not ( = ?auto_900964 ?auto_900970 ) ) ( not ( = ?auto_900965 ?auto_900966 ) ) ( not ( = ?auto_900965 ?auto_900967 ) ) ( not ( = ?auto_900965 ?auto_900968 ) ) ( not ( = ?auto_900965 ?auto_900969 ) ) ( not ( = ?auto_900965 ?auto_900970 ) ) ( not ( = ?auto_900966 ?auto_900967 ) ) ( not ( = ?auto_900966 ?auto_900968 ) ) ( not ( = ?auto_900966 ?auto_900969 ) ) ( not ( = ?auto_900966 ?auto_900970 ) ) ( not ( = ?auto_900967 ?auto_900968 ) ) ( not ( = ?auto_900967 ?auto_900969 ) ) ( not ( = ?auto_900967 ?auto_900970 ) ) ( not ( = ?auto_900968 ?auto_900969 ) ) ( not ( = ?auto_900968 ?auto_900970 ) ) ( not ( = ?auto_900969 ?auto_900970 ) ) ( ON ?auto_900968 ?auto_900969 ) ( ON ?auto_900967 ?auto_900968 ) ( CLEAR ?auto_900965 ) ( ON ?auto_900966 ?auto_900967 ) ( CLEAR ?auto_900966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_900957 ?auto_900958 ?auto_900959 ?auto_900960 ?auto_900961 ?auto_900962 ?auto_900963 ?auto_900964 ?auto_900965 ?auto_900966 )
      ( MAKE-13PILE ?auto_900957 ?auto_900958 ?auto_900959 ?auto_900960 ?auto_900961 ?auto_900962 ?auto_900963 ?auto_900964 ?auto_900965 ?auto_900966 ?auto_900967 ?auto_900968 ?auto_900969 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_901011 - BLOCK
      ?auto_901012 - BLOCK
      ?auto_901013 - BLOCK
      ?auto_901014 - BLOCK
      ?auto_901015 - BLOCK
      ?auto_901016 - BLOCK
      ?auto_901017 - BLOCK
      ?auto_901018 - BLOCK
      ?auto_901019 - BLOCK
      ?auto_901020 - BLOCK
      ?auto_901021 - BLOCK
      ?auto_901022 - BLOCK
      ?auto_901023 - BLOCK
    )
    :vars
    (
      ?auto_901024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901023 ?auto_901024 ) ( ON-TABLE ?auto_901011 ) ( ON ?auto_901012 ?auto_901011 ) ( ON ?auto_901013 ?auto_901012 ) ( ON ?auto_901014 ?auto_901013 ) ( ON ?auto_901015 ?auto_901014 ) ( ON ?auto_901016 ?auto_901015 ) ( ON ?auto_901017 ?auto_901016 ) ( ON ?auto_901018 ?auto_901017 ) ( not ( = ?auto_901011 ?auto_901012 ) ) ( not ( = ?auto_901011 ?auto_901013 ) ) ( not ( = ?auto_901011 ?auto_901014 ) ) ( not ( = ?auto_901011 ?auto_901015 ) ) ( not ( = ?auto_901011 ?auto_901016 ) ) ( not ( = ?auto_901011 ?auto_901017 ) ) ( not ( = ?auto_901011 ?auto_901018 ) ) ( not ( = ?auto_901011 ?auto_901019 ) ) ( not ( = ?auto_901011 ?auto_901020 ) ) ( not ( = ?auto_901011 ?auto_901021 ) ) ( not ( = ?auto_901011 ?auto_901022 ) ) ( not ( = ?auto_901011 ?auto_901023 ) ) ( not ( = ?auto_901011 ?auto_901024 ) ) ( not ( = ?auto_901012 ?auto_901013 ) ) ( not ( = ?auto_901012 ?auto_901014 ) ) ( not ( = ?auto_901012 ?auto_901015 ) ) ( not ( = ?auto_901012 ?auto_901016 ) ) ( not ( = ?auto_901012 ?auto_901017 ) ) ( not ( = ?auto_901012 ?auto_901018 ) ) ( not ( = ?auto_901012 ?auto_901019 ) ) ( not ( = ?auto_901012 ?auto_901020 ) ) ( not ( = ?auto_901012 ?auto_901021 ) ) ( not ( = ?auto_901012 ?auto_901022 ) ) ( not ( = ?auto_901012 ?auto_901023 ) ) ( not ( = ?auto_901012 ?auto_901024 ) ) ( not ( = ?auto_901013 ?auto_901014 ) ) ( not ( = ?auto_901013 ?auto_901015 ) ) ( not ( = ?auto_901013 ?auto_901016 ) ) ( not ( = ?auto_901013 ?auto_901017 ) ) ( not ( = ?auto_901013 ?auto_901018 ) ) ( not ( = ?auto_901013 ?auto_901019 ) ) ( not ( = ?auto_901013 ?auto_901020 ) ) ( not ( = ?auto_901013 ?auto_901021 ) ) ( not ( = ?auto_901013 ?auto_901022 ) ) ( not ( = ?auto_901013 ?auto_901023 ) ) ( not ( = ?auto_901013 ?auto_901024 ) ) ( not ( = ?auto_901014 ?auto_901015 ) ) ( not ( = ?auto_901014 ?auto_901016 ) ) ( not ( = ?auto_901014 ?auto_901017 ) ) ( not ( = ?auto_901014 ?auto_901018 ) ) ( not ( = ?auto_901014 ?auto_901019 ) ) ( not ( = ?auto_901014 ?auto_901020 ) ) ( not ( = ?auto_901014 ?auto_901021 ) ) ( not ( = ?auto_901014 ?auto_901022 ) ) ( not ( = ?auto_901014 ?auto_901023 ) ) ( not ( = ?auto_901014 ?auto_901024 ) ) ( not ( = ?auto_901015 ?auto_901016 ) ) ( not ( = ?auto_901015 ?auto_901017 ) ) ( not ( = ?auto_901015 ?auto_901018 ) ) ( not ( = ?auto_901015 ?auto_901019 ) ) ( not ( = ?auto_901015 ?auto_901020 ) ) ( not ( = ?auto_901015 ?auto_901021 ) ) ( not ( = ?auto_901015 ?auto_901022 ) ) ( not ( = ?auto_901015 ?auto_901023 ) ) ( not ( = ?auto_901015 ?auto_901024 ) ) ( not ( = ?auto_901016 ?auto_901017 ) ) ( not ( = ?auto_901016 ?auto_901018 ) ) ( not ( = ?auto_901016 ?auto_901019 ) ) ( not ( = ?auto_901016 ?auto_901020 ) ) ( not ( = ?auto_901016 ?auto_901021 ) ) ( not ( = ?auto_901016 ?auto_901022 ) ) ( not ( = ?auto_901016 ?auto_901023 ) ) ( not ( = ?auto_901016 ?auto_901024 ) ) ( not ( = ?auto_901017 ?auto_901018 ) ) ( not ( = ?auto_901017 ?auto_901019 ) ) ( not ( = ?auto_901017 ?auto_901020 ) ) ( not ( = ?auto_901017 ?auto_901021 ) ) ( not ( = ?auto_901017 ?auto_901022 ) ) ( not ( = ?auto_901017 ?auto_901023 ) ) ( not ( = ?auto_901017 ?auto_901024 ) ) ( not ( = ?auto_901018 ?auto_901019 ) ) ( not ( = ?auto_901018 ?auto_901020 ) ) ( not ( = ?auto_901018 ?auto_901021 ) ) ( not ( = ?auto_901018 ?auto_901022 ) ) ( not ( = ?auto_901018 ?auto_901023 ) ) ( not ( = ?auto_901018 ?auto_901024 ) ) ( not ( = ?auto_901019 ?auto_901020 ) ) ( not ( = ?auto_901019 ?auto_901021 ) ) ( not ( = ?auto_901019 ?auto_901022 ) ) ( not ( = ?auto_901019 ?auto_901023 ) ) ( not ( = ?auto_901019 ?auto_901024 ) ) ( not ( = ?auto_901020 ?auto_901021 ) ) ( not ( = ?auto_901020 ?auto_901022 ) ) ( not ( = ?auto_901020 ?auto_901023 ) ) ( not ( = ?auto_901020 ?auto_901024 ) ) ( not ( = ?auto_901021 ?auto_901022 ) ) ( not ( = ?auto_901021 ?auto_901023 ) ) ( not ( = ?auto_901021 ?auto_901024 ) ) ( not ( = ?auto_901022 ?auto_901023 ) ) ( not ( = ?auto_901022 ?auto_901024 ) ) ( not ( = ?auto_901023 ?auto_901024 ) ) ( ON ?auto_901022 ?auto_901023 ) ( ON ?auto_901021 ?auto_901022 ) ( ON ?auto_901020 ?auto_901021 ) ( CLEAR ?auto_901018 ) ( ON ?auto_901019 ?auto_901020 ) ( CLEAR ?auto_901019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_901011 ?auto_901012 ?auto_901013 ?auto_901014 ?auto_901015 ?auto_901016 ?auto_901017 ?auto_901018 ?auto_901019 )
      ( MAKE-13PILE ?auto_901011 ?auto_901012 ?auto_901013 ?auto_901014 ?auto_901015 ?auto_901016 ?auto_901017 ?auto_901018 ?auto_901019 ?auto_901020 ?auto_901021 ?auto_901022 ?auto_901023 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_901065 - BLOCK
      ?auto_901066 - BLOCK
      ?auto_901067 - BLOCK
      ?auto_901068 - BLOCK
      ?auto_901069 - BLOCK
      ?auto_901070 - BLOCK
      ?auto_901071 - BLOCK
      ?auto_901072 - BLOCK
      ?auto_901073 - BLOCK
      ?auto_901074 - BLOCK
      ?auto_901075 - BLOCK
      ?auto_901076 - BLOCK
      ?auto_901077 - BLOCK
    )
    :vars
    (
      ?auto_901078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901077 ?auto_901078 ) ( ON-TABLE ?auto_901065 ) ( ON ?auto_901066 ?auto_901065 ) ( ON ?auto_901067 ?auto_901066 ) ( ON ?auto_901068 ?auto_901067 ) ( ON ?auto_901069 ?auto_901068 ) ( ON ?auto_901070 ?auto_901069 ) ( ON ?auto_901071 ?auto_901070 ) ( not ( = ?auto_901065 ?auto_901066 ) ) ( not ( = ?auto_901065 ?auto_901067 ) ) ( not ( = ?auto_901065 ?auto_901068 ) ) ( not ( = ?auto_901065 ?auto_901069 ) ) ( not ( = ?auto_901065 ?auto_901070 ) ) ( not ( = ?auto_901065 ?auto_901071 ) ) ( not ( = ?auto_901065 ?auto_901072 ) ) ( not ( = ?auto_901065 ?auto_901073 ) ) ( not ( = ?auto_901065 ?auto_901074 ) ) ( not ( = ?auto_901065 ?auto_901075 ) ) ( not ( = ?auto_901065 ?auto_901076 ) ) ( not ( = ?auto_901065 ?auto_901077 ) ) ( not ( = ?auto_901065 ?auto_901078 ) ) ( not ( = ?auto_901066 ?auto_901067 ) ) ( not ( = ?auto_901066 ?auto_901068 ) ) ( not ( = ?auto_901066 ?auto_901069 ) ) ( not ( = ?auto_901066 ?auto_901070 ) ) ( not ( = ?auto_901066 ?auto_901071 ) ) ( not ( = ?auto_901066 ?auto_901072 ) ) ( not ( = ?auto_901066 ?auto_901073 ) ) ( not ( = ?auto_901066 ?auto_901074 ) ) ( not ( = ?auto_901066 ?auto_901075 ) ) ( not ( = ?auto_901066 ?auto_901076 ) ) ( not ( = ?auto_901066 ?auto_901077 ) ) ( not ( = ?auto_901066 ?auto_901078 ) ) ( not ( = ?auto_901067 ?auto_901068 ) ) ( not ( = ?auto_901067 ?auto_901069 ) ) ( not ( = ?auto_901067 ?auto_901070 ) ) ( not ( = ?auto_901067 ?auto_901071 ) ) ( not ( = ?auto_901067 ?auto_901072 ) ) ( not ( = ?auto_901067 ?auto_901073 ) ) ( not ( = ?auto_901067 ?auto_901074 ) ) ( not ( = ?auto_901067 ?auto_901075 ) ) ( not ( = ?auto_901067 ?auto_901076 ) ) ( not ( = ?auto_901067 ?auto_901077 ) ) ( not ( = ?auto_901067 ?auto_901078 ) ) ( not ( = ?auto_901068 ?auto_901069 ) ) ( not ( = ?auto_901068 ?auto_901070 ) ) ( not ( = ?auto_901068 ?auto_901071 ) ) ( not ( = ?auto_901068 ?auto_901072 ) ) ( not ( = ?auto_901068 ?auto_901073 ) ) ( not ( = ?auto_901068 ?auto_901074 ) ) ( not ( = ?auto_901068 ?auto_901075 ) ) ( not ( = ?auto_901068 ?auto_901076 ) ) ( not ( = ?auto_901068 ?auto_901077 ) ) ( not ( = ?auto_901068 ?auto_901078 ) ) ( not ( = ?auto_901069 ?auto_901070 ) ) ( not ( = ?auto_901069 ?auto_901071 ) ) ( not ( = ?auto_901069 ?auto_901072 ) ) ( not ( = ?auto_901069 ?auto_901073 ) ) ( not ( = ?auto_901069 ?auto_901074 ) ) ( not ( = ?auto_901069 ?auto_901075 ) ) ( not ( = ?auto_901069 ?auto_901076 ) ) ( not ( = ?auto_901069 ?auto_901077 ) ) ( not ( = ?auto_901069 ?auto_901078 ) ) ( not ( = ?auto_901070 ?auto_901071 ) ) ( not ( = ?auto_901070 ?auto_901072 ) ) ( not ( = ?auto_901070 ?auto_901073 ) ) ( not ( = ?auto_901070 ?auto_901074 ) ) ( not ( = ?auto_901070 ?auto_901075 ) ) ( not ( = ?auto_901070 ?auto_901076 ) ) ( not ( = ?auto_901070 ?auto_901077 ) ) ( not ( = ?auto_901070 ?auto_901078 ) ) ( not ( = ?auto_901071 ?auto_901072 ) ) ( not ( = ?auto_901071 ?auto_901073 ) ) ( not ( = ?auto_901071 ?auto_901074 ) ) ( not ( = ?auto_901071 ?auto_901075 ) ) ( not ( = ?auto_901071 ?auto_901076 ) ) ( not ( = ?auto_901071 ?auto_901077 ) ) ( not ( = ?auto_901071 ?auto_901078 ) ) ( not ( = ?auto_901072 ?auto_901073 ) ) ( not ( = ?auto_901072 ?auto_901074 ) ) ( not ( = ?auto_901072 ?auto_901075 ) ) ( not ( = ?auto_901072 ?auto_901076 ) ) ( not ( = ?auto_901072 ?auto_901077 ) ) ( not ( = ?auto_901072 ?auto_901078 ) ) ( not ( = ?auto_901073 ?auto_901074 ) ) ( not ( = ?auto_901073 ?auto_901075 ) ) ( not ( = ?auto_901073 ?auto_901076 ) ) ( not ( = ?auto_901073 ?auto_901077 ) ) ( not ( = ?auto_901073 ?auto_901078 ) ) ( not ( = ?auto_901074 ?auto_901075 ) ) ( not ( = ?auto_901074 ?auto_901076 ) ) ( not ( = ?auto_901074 ?auto_901077 ) ) ( not ( = ?auto_901074 ?auto_901078 ) ) ( not ( = ?auto_901075 ?auto_901076 ) ) ( not ( = ?auto_901075 ?auto_901077 ) ) ( not ( = ?auto_901075 ?auto_901078 ) ) ( not ( = ?auto_901076 ?auto_901077 ) ) ( not ( = ?auto_901076 ?auto_901078 ) ) ( not ( = ?auto_901077 ?auto_901078 ) ) ( ON ?auto_901076 ?auto_901077 ) ( ON ?auto_901075 ?auto_901076 ) ( ON ?auto_901074 ?auto_901075 ) ( ON ?auto_901073 ?auto_901074 ) ( CLEAR ?auto_901071 ) ( ON ?auto_901072 ?auto_901073 ) ( CLEAR ?auto_901072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_901065 ?auto_901066 ?auto_901067 ?auto_901068 ?auto_901069 ?auto_901070 ?auto_901071 ?auto_901072 )
      ( MAKE-13PILE ?auto_901065 ?auto_901066 ?auto_901067 ?auto_901068 ?auto_901069 ?auto_901070 ?auto_901071 ?auto_901072 ?auto_901073 ?auto_901074 ?auto_901075 ?auto_901076 ?auto_901077 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_901119 - BLOCK
      ?auto_901120 - BLOCK
      ?auto_901121 - BLOCK
      ?auto_901122 - BLOCK
      ?auto_901123 - BLOCK
      ?auto_901124 - BLOCK
      ?auto_901125 - BLOCK
      ?auto_901126 - BLOCK
      ?auto_901127 - BLOCK
      ?auto_901128 - BLOCK
      ?auto_901129 - BLOCK
      ?auto_901130 - BLOCK
      ?auto_901131 - BLOCK
    )
    :vars
    (
      ?auto_901132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901131 ?auto_901132 ) ( ON-TABLE ?auto_901119 ) ( ON ?auto_901120 ?auto_901119 ) ( ON ?auto_901121 ?auto_901120 ) ( ON ?auto_901122 ?auto_901121 ) ( ON ?auto_901123 ?auto_901122 ) ( ON ?auto_901124 ?auto_901123 ) ( not ( = ?auto_901119 ?auto_901120 ) ) ( not ( = ?auto_901119 ?auto_901121 ) ) ( not ( = ?auto_901119 ?auto_901122 ) ) ( not ( = ?auto_901119 ?auto_901123 ) ) ( not ( = ?auto_901119 ?auto_901124 ) ) ( not ( = ?auto_901119 ?auto_901125 ) ) ( not ( = ?auto_901119 ?auto_901126 ) ) ( not ( = ?auto_901119 ?auto_901127 ) ) ( not ( = ?auto_901119 ?auto_901128 ) ) ( not ( = ?auto_901119 ?auto_901129 ) ) ( not ( = ?auto_901119 ?auto_901130 ) ) ( not ( = ?auto_901119 ?auto_901131 ) ) ( not ( = ?auto_901119 ?auto_901132 ) ) ( not ( = ?auto_901120 ?auto_901121 ) ) ( not ( = ?auto_901120 ?auto_901122 ) ) ( not ( = ?auto_901120 ?auto_901123 ) ) ( not ( = ?auto_901120 ?auto_901124 ) ) ( not ( = ?auto_901120 ?auto_901125 ) ) ( not ( = ?auto_901120 ?auto_901126 ) ) ( not ( = ?auto_901120 ?auto_901127 ) ) ( not ( = ?auto_901120 ?auto_901128 ) ) ( not ( = ?auto_901120 ?auto_901129 ) ) ( not ( = ?auto_901120 ?auto_901130 ) ) ( not ( = ?auto_901120 ?auto_901131 ) ) ( not ( = ?auto_901120 ?auto_901132 ) ) ( not ( = ?auto_901121 ?auto_901122 ) ) ( not ( = ?auto_901121 ?auto_901123 ) ) ( not ( = ?auto_901121 ?auto_901124 ) ) ( not ( = ?auto_901121 ?auto_901125 ) ) ( not ( = ?auto_901121 ?auto_901126 ) ) ( not ( = ?auto_901121 ?auto_901127 ) ) ( not ( = ?auto_901121 ?auto_901128 ) ) ( not ( = ?auto_901121 ?auto_901129 ) ) ( not ( = ?auto_901121 ?auto_901130 ) ) ( not ( = ?auto_901121 ?auto_901131 ) ) ( not ( = ?auto_901121 ?auto_901132 ) ) ( not ( = ?auto_901122 ?auto_901123 ) ) ( not ( = ?auto_901122 ?auto_901124 ) ) ( not ( = ?auto_901122 ?auto_901125 ) ) ( not ( = ?auto_901122 ?auto_901126 ) ) ( not ( = ?auto_901122 ?auto_901127 ) ) ( not ( = ?auto_901122 ?auto_901128 ) ) ( not ( = ?auto_901122 ?auto_901129 ) ) ( not ( = ?auto_901122 ?auto_901130 ) ) ( not ( = ?auto_901122 ?auto_901131 ) ) ( not ( = ?auto_901122 ?auto_901132 ) ) ( not ( = ?auto_901123 ?auto_901124 ) ) ( not ( = ?auto_901123 ?auto_901125 ) ) ( not ( = ?auto_901123 ?auto_901126 ) ) ( not ( = ?auto_901123 ?auto_901127 ) ) ( not ( = ?auto_901123 ?auto_901128 ) ) ( not ( = ?auto_901123 ?auto_901129 ) ) ( not ( = ?auto_901123 ?auto_901130 ) ) ( not ( = ?auto_901123 ?auto_901131 ) ) ( not ( = ?auto_901123 ?auto_901132 ) ) ( not ( = ?auto_901124 ?auto_901125 ) ) ( not ( = ?auto_901124 ?auto_901126 ) ) ( not ( = ?auto_901124 ?auto_901127 ) ) ( not ( = ?auto_901124 ?auto_901128 ) ) ( not ( = ?auto_901124 ?auto_901129 ) ) ( not ( = ?auto_901124 ?auto_901130 ) ) ( not ( = ?auto_901124 ?auto_901131 ) ) ( not ( = ?auto_901124 ?auto_901132 ) ) ( not ( = ?auto_901125 ?auto_901126 ) ) ( not ( = ?auto_901125 ?auto_901127 ) ) ( not ( = ?auto_901125 ?auto_901128 ) ) ( not ( = ?auto_901125 ?auto_901129 ) ) ( not ( = ?auto_901125 ?auto_901130 ) ) ( not ( = ?auto_901125 ?auto_901131 ) ) ( not ( = ?auto_901125 ?auto_901132 ) ) ( not ( = ?auto_901126 ?auto_901127 ) ) ( not ( = ?auto_901126 ?auto_901128 ) ) ( not ( = ?auto_901126 ?auto_901129 ) ) ( not ( = ?auto_901126 ?auto_901130 ) ) ( not ( = ?auto_901126 ?auto_901131 ) ) ( not ( = ?auto_901126 ?auto_901132 ) ) ( not ( = ?auto_901127 ?auto_901128 ) ) ( not ( = ?auto_901127 ?auto_901129 ) ) ( not ( = ?auto_901127 ?auto_901130 ) ) ( not ( = ?auto_901127 ?auto_901131 ) ) ( not ( = ?auto_901127 ?auto_901132 ) ) ( not ( = ?auto_901128 ?auto_901129 ) ) ( not ( = ?auto_901128 ?auto_901130 ) ) ( not ( = ?auto_901128 ?auto_901131 ) ) ( not ( = ?auto_901128 ?auto_901132 ) ) ( not ( = ?auto_901129 ?auto_901130 ) ) ( not ( = ?auto_901129 ?auto_901131 ) ) ( not ( = ?auto_901129 ?auto_901132 ) ) ( not ( = ?auto_901130 ?auto_901131 ) ) ( not ( = ?auto_901130 ?auto_901132 ) ) ( not ( = ?auto_901131 ?auto_901132 ) ) ( ON ?auto_901130 ?auto_901131 ) ( ON ?auto_901129 ?auto_901130 ) ( ON ?auto_901128 ?auto_901129 ) ( ON ?auto_901127 ?auto_901128 ) ( ON ?auto_901126 ?auto_901127 ) ( CLEAR ?auto_901124 ) ( ON ?auto_901125 ?auto_901126 ) ( CLEAR ?auto_901125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_901119 ?auto_901120 ?auto_901121 ?auto_901122 ?auto_901123 ?auto_901124 ?auto_901125 )
      ( MAKE-13PILE ?auto_901119 ?auto_901120 ?auto_901121 ?auto_901122 ?auto_901123 ?auto_901124 ?auto_901125 ?auto_901126 ?auto_901127 ?auto_901128 ?auto_901129 ?auto_901130 ?auto_901131 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_901173 - BLOCK
      ?auto_901174 - BLOCK
      ?auto_901175 - BLOCK
      ?auto_901176 - BLOCK
      ?auto_901177 - BLOCK
      ?auto_901178 - BLOCK
      ?auto_901179 - BLOCK
      ?auto_901180 - BLOCK
      ?auto_901181 - BLOCK
      ?auto_901182 - BLOCK
      ?auto_901183 - BLOCK
      ?auto_901184 - BLOCK
      ?auto_901185 - BLOCK
    )
    :vars
    (
      ?auto_901186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901185 ?auto_901186 ) ( ON-TABLE ?auto_901173 ) ( ON ?auto_901174 ?auto_901173 ) ( ON ?auto_901175 ?auto_901174 ) ( ON ?auto_901176 ?auto_901175 ) ( ON ?auto_901177 ?auto_901176 ) ( not ( = ?auto_901173 ?auto_901174 ) ) ( not ( = ?auto_901173 ?auto_901175 ) ) ( not ( = ?auto_901173 ?auto_901176 ) ) ( not ( = ?auto_901173 ?auto_901177 ) ) ( not ( = ?auto_901173 ?auto_901178 ) ) ( not ( = ?auto_901173 ?auto_901179 ) ) ( not ( = ?auto_901173 ?auto_901180 ) ) ( not ( = ?auto_901173 ?auto_901181 ) ) ( not ( = ?auto_901173 ?auto_901182 ) ) ( not ( = ?auto_901173 ?auto_901183 ) ) ( not ( = ?auto_901173 ?auto_901184 ) ) ( not ( = ?auto_901173 ?auto_901185 ) ) ( not ( = ?auto_901173 ?auto_901186 ) ) ( not ( = ?auto_901174 ?auto_901175 ) ) ( not ( = ?auto_901174 ?auto_901176 ) ) ( not ( = ?auto_901174 ?auto_901177 ) ) ( not ( = ?auto_901174 ?auto_901178 ) ) ( not ( = ?auto_901174 ?auto_901179 ) ) ( not ( = ?auto_901174 ?auto_901180 ) ) ( not ( = ?auto_901174 ?auto_901181 ) ) ( not ( = ?auto_901174 ?auto_901182 ) ) ( not ( = ?auto_901174 ?auto_901183 ) ) ( not ( = ?auto_901174 ?auto_901184 ) ) ( not ( = ?auto_901174 ?auto_901185 ) ) ( not ( = ?auto_901174 ?auto_901186 ) ) ( not ( = ?auto_901175 ?auto_901176 ) ) ( not ( = ?auto_901175 ?auto_901177 ) ) ( not ( = ?auto_901175 ?auto_901178 ) ) ( not ( = ?auto_901175 ?auto_901179 ) ) ( not ( = ?auto_901175 ?auto_901180 ) ) ( not ( = ?auto_901175 ?auto_901181 ) ) ( not ( = ?auto_901175 ?auto_901182 ) ) ( not ( = ?auto_901175 ?auto_901183 ) ) ( not ( = ?auto_901175 ?auto_901184 ) ) ( not ( = ?auto_901175 ?auto_901185 ) ) ( not ( = ?auto_901175 ?auto_901186 ) ) ( not ( = ?auto_901176 ?auto_901177 ) ) ( not ( = ?auto_901176 ?auto_901178 ) ) ( not ( = ?auto_901176 ?auto_901179 ) ) ( not ( = ?auto_901176 ?auto_901180 ) ) ( not ( = ?auto_901176 ?auto_901181 ) ) ( not ( = ?auto_901176 ?auto_901182 ) ) ( not ( = ?auto_901176 ?auto_901183 ) ) ( not ( = ?auto_901176 ?auto_901184 ) ) ( not ( = ?auto_901176 ?auto_901185 ) ) ( not ( = ?auto_901176 ?auto_901186 ) ) ( not ( = ?auto_901177 ?auto_901178 ) ) ( not ( = ?auto_901177 ?auto_901179 ) ) ( not ( = ?auto_901177 ?auto_901180 ) ) ( not ( = ?auto_901177 ?auto_901181 ) ) ( not ( = ?auto_901177 ?auto_901182 ) ) ( not ( = ?auto_901177 ?auto_901183 ) ) ( not ( = ?auto_901177 ?auto_901184 ) ) ( not ( = ?auto_901177 ?auto_901185 ) ) ( not ( = ?auto_901177 ?auto_901186 ) ) ( not ( = ?auto_901178 ?auto_901179 ) ) ( not ( = ?auto_901178 ?auto_901180 ) ) ( not ( = ?auto_901178 ?auto_901181 ) ) ( not ( = ?auto_901178 ?auto_901182 ) ) ( not ( = ?auto_901178 ?auto_901183 ) ) ( not ( = ?auto_901178 ?auto_901184 ) ) ( not ( = ?auto_901178 ?auto_901185 ) ) ( not ( = ?auto_901178 ?auto_901186 ) ) ( not ( = ?auto_901179 ?auto_901180 ) ) ( not ( = ?auto_901179 ?auto_901181 ) ) ( not ( = ?auto_901179 ?auto_901182 ) ) ( not ( = ?auto_901179 ?auto_901183 ) ) ( not ( = ?auto_901179 ?auto_901184 ) ) ( not ( = ?auto_901179 ?auto_901185 ) ) ( not ( = ?auto_901179 ?auto_901186 ) ) ( not ( = ?auto_901180 ?auto_901181 ) ) ( not ( = ?auto_901180 ?auto_901182 ) ) ( not ( = ?auto_901180 ?auto_901183 ) ) ( not ( = ?auto_901180 ?auto_901184 ) ) ( not ( = ?auto_901180 ?auto_901185 ) ) ( not ( = ?auto_901180 ?auto_901186 ) ) ( not ( = ?auto_901181 ?auto_901182 ) ) ( not ( = ?auto_901181 ?auto_901183 ) ) ( not ( = ?auto_901181 ?auto_901184 ) ) ( not ( = ?auto_901181 ?auto_901185 ) ) ( not ( = ?auto_901181 ?auto_901186 ) ) ( not ( = ?auto_901182 ?auto_901183 ) ) ( not ( = ?auto_901182 ?auto_901184 ) ) ( not ( = ?auto_901182 ?auto_901185 ) ) ( not ( = ?auto_901182 ?auto_901186 ) ) ( not ( = ?auto_901183 ?auto_901184 ) ) ( not ( = ?auto_901183 ?auto_901185 ) ) ( not ( = ?auto_901183 ?auto_901186 ) ) ( not ( = ?auto_901184 ?auto_901185 ) ) ( not ( = ?auto_901184 ?auto_901186 ) ) ( not ( = ?auto_901185 ?auto_901186 ) ) ( ON ?auto_901184 ?auto_901185 ) ( ON ?auto_901183 ?auto_901184 ) ( ON ?auto_901182 ?auto_901183 ) ( ON ?auto_901181 ?auto_901182 ) ( ON ?auto_901180 ?auto_901181 ) ( ON ?auto_901179 ?auto_901180 ) ( CLEAR ?auto_901177 ) ( ON ?auto_901178 ?auto_901179 ) ( CLEAR ?auto_901178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_901173 ?auto_901174 ?auto_901175 ?auto_901176 ?auto_901177 ?auto_901178 )
      ( MAKE-13PILE ?auto_901173 ?auto_901174 ?auto_901175 ?auto_901176 ?auto_901177 ?auto_901178 ?auto_901179 ?auto_901180 ?auto_901181 ?auto_901182 ?auto_901183 ?auto_901184 ?auto_901185 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_901227 - BLOCK
      ?auto_901228 - BLOCK
      ?auto_901229 - BLOCK
      ?auto_901230 - BLOCK
      ?auto_901231 - BLOCK
      ?auto_901232 - BLOCK
      ?auto_901233 - BLOCK
      ?auto_901234 - BLOCK
      ?auto_901235 - BLOCK
      ?auto_901236 - BLOCK
      ?auto_901237 - BLOCK
      ?auto_901238 - BLOCK
      ?auto_901239 - BLOCK
    )
    :vars
    (
      ?auto_901240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901239 ?auto_901240 ) ( ON-TABLE ?auto_901227 ) ( ON ?auto_901228 ?auto_901227 ) ( ON ?auto_901229 ?auto_901228 ) ( ON ?auto_901230 ?auto_901229 ) ( not ( = ?auto_901227 ?auto_901228 ) ) ( not ( = ?auto_901227 ?auto_901229 ) ) ( not ( = ?auto_901227 ?auto_901230 ) ) ( not ( = ?auto_901227 ?auto_901231 ) ) ( not ( = ?auto_901227 ?auto_901232 ) ) ( not ( = ?auto_901227 ?auto_901233 ) ) ( not ( = ?auto_901227 ?auto_901234 ) ) ( not ( = ?auto_901227 ?auto_901235 ) ) ( not ( = ?auto_901227 ?auto_901236 ) ) ( not ( = ?auto_901227 ?auto_901237 ) ) ( not ( = ?auto_901227 ?auto_901238 ) ) ( not ( = ?auto_901227 ?auto_901239 ) ) ( not ( = ?auto_901227 ?auto_901240 ) ) ( not ( = ?auto_901228 ?auto_901229 ) ) ( not ( = ?auto_901228 ?auto_901230 ) ) ( not ( = ?auto_901228 ?auto_901231 ) ) ( not ( = ?auto_901228 ?auto_901232 ) ) ( not ( = ?auto_901228 ?auto_901233 ) ) ( not ( = ?auto_901228 ?auto_901234 ) ) ( not ( = ?auto_901228 ?auto_901235 ) ) ( not ( = ?auto_901228 ?auto_901236 ) ) ( not ( = ?auto_901228 ?auto_901237 ) ) ( not ( = ?auto_901228 ?auto_901238 ) ) ( not ( = ?auto_901228 ?auto_901239 ) ) ( not ( = ?auto_901228 ?auto_901240 ) ) ( not ( = ?auto_901229 ?auto_901230 ) ) ( not ( = ?auto_901229 ?auto_901231 ) ) ( not ( = ?auto_901229 ?auto_901232 ) ) ( not ( = ?auto_901229 ?auto_901233 ) ) ( not ( = ?auto_901229 ?auto_901234 ) ) ( not ( = ?auto_901229 ?auto_901235 ) ) ( not ( = ?auto_901229 ?auto_901236 ) ) ( not ( = ?auto_901229 ?auto_901237 ) ) ( not ( = ?auto_901229 ?auto_901238 ) ) ( not ( = ?auto_901229 ?auto_901239 ) ) ( not ( = ?auto_901229 ?auto_901240 ) ) ( not ( = ?auto_901230 ?auto_901231 ) ) ( not ( = ?auto_901230 ?auto_901232 ) ) ( not ( = ?auto_901230 ?auto_901233 ) ) ( not ( = ?auto_901230 ?auto_901234 ) ) ( not ( = ?auto_901230 ?auto_901235 ) ) ( not ( = ?auto_901230 ?auto_901236 ) ) ( not ( = ?auto_901230 ?auto_901237 ) ) ( not ( = ?auto_901230 ?auto_901238 ) ) ( not ( = ?auto_901230 ?auto_901239 ) ) ( not ( = ?auto_901230 ?auto_901240 ) ) ( not ( = ?auto_901231 ?auto_901232 ) ) ( not ( = ?auto_901231 ?auto_901233 ) ) ( not ( = ?auto_901231 ?auto_901234 ) ) ( not ( = ?auto_901231 ?auto_901235 ) ) ( not ( = ?auto_901231 ?auto_901236 ) ) ( not ( = ?auto_901231 ?auto_901237 ) ) ( not ( = ?auto_901231 ?auto_901238 ) ) ( not ( = ?auto_901231 ?auto_901239 ) ) ( not ( = ?auto_901231 ?auto_901240 ) ) ( not ( = ?auto_901232 ?auto_901233 ) ) ( not ( = ?auto_901232 ?auto_901234 ) ) ( not ( = ?auto_901232 ?auto_901235 ) ) ( not ( = ?auto_901232 ?auto_901236 ) ) ( not ( = ?auto_901232 ?auto_901237 ) ) ( not ( = ?auto_901232 ?auto_901238 ) ) ( not ( = ?auto_901232 ?auto_901239 ) ) ( not ( = ?auto_901232 ?auto_901240 ) ) ( not ( = ?auto_901233 ?auto_901234 ) ) ( not ( = ?auto_901233 ?auto_901235 ) ) ( not ( = ?auto_901233 ?auto_901236 ) ) ( not ( = ?auto_901233 ?auto_901237 ) ) ( not ( = ?auto_901233 ?auto_901238 ) ) ( not ( = ?auto_901233 ?auto_901239 ) ) ( not ( = ?auto_901233 ?auto_901240 ) ) ( not ( = ?auto_901234 ?auto_901235 ) ) ( not ( = ?auto_901234 ?auto_901236 ) ) ( not ( = ?auto_901234 ?auto_901237 ) ) ( not ( = ?auto_901234 ?auto_901238 ) ) ( not ( = ?auto_901234 ?auto_901239 ) ) ( not ( = ?auto_901234 ?auto_901240 ) ) ( not ( = ?auto_901235 ?auto_901236 ) ) ( not ( = ?auto_901235 ?auto_901237 ) ) ( not ( = ?auto_901235 ?auto_901238 ) ) ( not ( = ?auto_901235 ?auto_901239 ) ) ( not ( = ?auto_901235 ?auto_901240 ) ) ( not ( = ?auto_901236 ?auto_901237 ) ) ( not ( = ?auto_901236 ?auto_901238 ) ) ( not ( = ?auto_901236 ?auto_901239 ) ) ( not ( = ?auto_901236 ?auto_901240 ) ) ( not ( = ?auto_901237 ?auto_901238 ) ) ( not ( = ?auto_901237 ?auto_901239 ) ) ( not ( = ?auto_901237 ?auto_901240 ) ) ( not ( = ?auto_901238 ?auto_901239 ) ) ( not ( = ?auto_901238 ?auto_901240 ) ) ( not ( = ?auto_901239 ?auto_901240 ) ) ( ON ?auto_901238 ?auto_901239 ) ( ON ?auto_901237 ?auto_901238 ) ( ON ?auto_901236 ?auto_901237 ) ( ON ?auto_901235 ?auto_901236 ) ( ON ?auto_901234 ?auto_901235 ) ( ON ?auto_901233 ?auto_901234 ) ( ON ?auto_901232 ?auto_901233 ) ( CLEAR ?auto_901230 ) ( ON ?auto_901231 ?auto_901232 ) ( CLEAR ?auto_901231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_901227 ?auto_901228 ?auto_901229 ?auto_901230 ?auto_901231 )
      ( MAKE-13PILE ?auto_901227 ?auto_901228 ?auto_901229 ?auto_901230 ?auto_901231 ?auto_901232 ?auto_901233 ?auto_901234 ?auto_901235 ?auto_901236 ?auto_901237 ?auto_901238 ?auto_901239 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_901281 - BLOCK
      ?auto_901282 - BLOCK
      ?auto_901283 - BLOCK
      ?auto_901284 - BLOCK
      ?auto_901285 - BLOCK
      ?auto_901286 - BLOCK
      ?auto_901287 - BLOCK
      ?auto_901288 - BLOCK
      ?auto_901289 - BLOCK
      ?auto_901290 - BLOCK
      ?auto_901291 - BLOCK
      ?auto_901292 - BLOCK
      ?auto_901293 - BLOCK
    )
    :vars
    (
      ?auto_901294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901293 ?auto_901294 ) ( ON-TABLE ?auto_901281 ) ( ON ?auto_901282 ?auto_901281 ) ( ON ?auto_901283 ?auto_901282 ) ( not ( = ?auto_901281 ?auto_901282 ) ) ( not ( = ?auto_901281 ?auto_901283 ) ) ( not ( = ?auto_901281 ?auto_901284 ) ) ( not ( = ?auto_901281 ?auto_901285 ) ) ( not ( = ?auto_901281 ?auto_901286 ) ) ( not ( = ?auto_901281 ?auto_901287 ) ) ( not ( = ?auto_901281 ?auto_901288 ) ) ( not ( = ?auto_901281 ?auto_901289 ) ) ( not ( = ?auto_901281 ?auto_901290 ) ) ( not ( = ?auto_901281 ?auto_901291 ) ) ( not ( = ?auto_901281 ?auto_901292 ) ) ( not ( = ?auto_901281 ?auto_901293 ) ) ( not ( = ?auto_901281 ?auto_901294 ) ) ( not ( = ?auto_901282 ?auto_901283 ) ) ( not ( = ?auto_901282 ?auto_901284 ) ) ( not ( = ?auto_901282 ?auto_901285 ) ) ( not ( = ?auto_901282 ?auto_901286 ) ) ( not ( = ?auto_901282 ?auto_901287 ) ) ( not ( = ?auto_901282 ?auto_901288 ) ) ( not ( = ?auto_901282 ?auto_901289 ) ) ( not ( = ?auto_901282 ?auto_901290 ) ) ( not ( = ?auto_901282 ?auto_901291 ) ) ( not ( = ?auto_901282 ?auto_901292 ) ) ( not ( = ?auto_901282 ?auto_901293 ) ) ( not ( = ?auto_901282 ?auto_901294 ) ) ( not ( = ?auto_901283 ?auto_901284 ) ) ( not ( = ?auto_901283 ?auto_901285 ) ) ( not ( = ?auto_901283 ?auto_901286 ) ) ( not ( = ?auto_901283 ?auto_901287 ) ) ( not ( = ?auto_901283 ?auto_901288 ) ) ( not ( = ?auto_901283 ?auto_901289 ) ) ( not ( = ?auto_901283 ?auto_901290 ) ) ( not ( = ?auto_901283 ?auto_901291 ) ) ( not ( = ?auto_901283 ?auto_901292 ) ) ( not ( = ?auto_901283 ?auto_901293 ) ) ( not ( = ?auto_901283 ?auto_901294 ) ) ( not ( = ?auto_901284 ?auto_901285 ) ) ( not ( = ?auto_901284 ?auto_901286 ) ) ( not ( = ?auto_901284 ?auto_901287 ) ) ( not ( = ?auto_901284 ?auto_901288 ) ) ( not ( = ?auto_901284 ?auto_901289 ) ) ( not ( = ?auto_901284 ?auto_901290 ) ) ( not ( = ?auto_901284 ?auto_901291 ) ) ( not ( = ?auto_901284 ?auto_901292 ) ) ( not ( = ?auto_901284 ?auto_901293 ) ) ( not ( = ?auto_901284 ?auto_901294 ) ) ( not ( = ?auto_901285 ?auto_901286 ) ) ( not ( = ?auto_901285 ?auto_901287 ) ) ( not ( = ?auto_901285 ?auto_901288 ) ) ( not ( = ?auto_901285 ?auto_901289 ) ) ( not ( = ?auto_901285 ?auto_901290 ) ) ( not ( = ?auto_901285 ?auto_901291 ) ) ( not ( = ?auto_901285 ?auto_901292 ) ) ( not ( = ?auto_901285 ?auto_901293 ) ) ( not ( = ?auto_901285 ?auto_901294 ) ) ( not ( = ?auto_901286 ?auto_901287 ) ) ( not ( = ?auto_901286 ?auto_901288 ) ) ( not ( = ?auto_901286 ?auto_901289 ) ) ( not ( = ?auto_901286 ?auto_901290 ) ) ( not ( = ?auto_901286 ?auto_901291 ) ) ( not ( = ?auto_901286 ?auto_901292 ) ) ( not ( = ?auto_901286 ?auto_901293 ) ) ( not ( = ?auto_901286 ?auto_901294 ) ) ( not ( = ?auto_901287 ?auto_901288 ) ) ( not ( = ?auto_901287 ?auto_901289 ) ) ( not ( = ?auto_901287 ?auto_901290 ) ) ( not ( = ?auto_901287 ?auto_901291 ) ) ( not ( = ?auto_901287 ?auto_901292 ) ) ( not ( = ?auto_901287 ?auto_901293 ) ) ( not ( = ?auto_901287 ?auto_901294 ) ) ( not ( = ?auto_901288 ?auto_901289 ) ) ( not ( = ?auto_901288 ?auto_901290 ) ) ( not ( = ?auto_901288 ?auto_901291 ) ) ( not ( = ?auto_901288 ?auto_901292 ) ) ( not ( = ?auto_901288 ?auto_901293 ) ) ( not ( = ?auto_901288 ?auto_901294 ) ) ( not ( = ?auto_901289 ?auto_901290 ) ) ( not ( = ?auto_901289 ?auto_901291 ) ) ( not ( = ?auto_901289 ?auto_901292 ) ) ( not ( = ?auto_901289 ?auto_901293 ) ) ( not ( = ?auto_901289 ?auto_901294 ) ) ( not ( = ?auto_901290 ?auto_901291 ) ) ( not ( = ?auto_901290 ?auto_901292 ) ) ( not ( = ?auto_901290 ?auto_901293 ) ) ( not ( = ?auto_901290 ?auto_901294 ) ) ( not ( = ?auto_901291 ?auto_901292 ) ) ( not ( = ?auto_901291 ?auto_901293 ) ) ( not ( = ?auto_901291 ?auto_901294 ) ) ( not ( = ?auto_901292 ?auto_901293 ) ) ( not ( = ?auto_901292 ?auto_901294 ) ) ( not ( = ?auto_901293 ?auto_901294 ) ) ( ON ?auto_901292 ?auto_901293 ) ( ON ?auto_901291 ?auto_901292 ) ( ON ?auto_901290 ?auto_901291 ) ( ON ?auto_901289 ?auto_901290 ) ( ON ?auto_901288 ?auto_901289 ) ( ON ?auto_901287 ?auto_901288 ) ( ON ?auto_901286 ?auto_901287 ) ( ON ?auto_901285 ?auto_901286 ) ( CLEAR ?auto_901283 ) ( ON ?auto_901284 ?auto_901285 ) ( CLEAR ?auto_901284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_901281 ?auto_901282 ?auto_901283 ?auto_901284 )
      ( MAKE-13PILE ?auto_901281 ?auto_901282 ?auto_901283 ?auto_901284 ?auto_901285 ?auto_901286 ?auto_901287 ?auto_901288 ?auto_901289 ?auto_901290 ?auto_901291 ?auto_901292 ?auto_901293 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_901335 - BLOCK
      ?auto_901336 - BLOCK
      ?auto_901337 - BLOCK
      ?auto_901338 - BLOCK
      ?auto_901339 - BLOCK
      ?auto_901340 - BLOCK
      ?auto_901341 - BLOCK
      ?auto_901342 - BLOCK
      ?auto_901343 - BLOCK
      ?auto_901344 - BLOCK
      ?auto_901345 - BLOCK
      ?auto_901346 - BLOCK
      ?auto_901347 - BLOCK
    )
    :vars
    (
      ?auto_901348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901347 ?auto_901348 ) ( ON-TABLE ?auto_901335 ) ( ON ?auto_901336 ?auto_901335 ) ( not ( = ?auto_901335 ?auto_901336 ) ) ( not ( = ?auto_901335 ?auto_901337 ) ) ( not ( = ?auto_901335 ?auto_901338 ) ) ( not ( = ?auto_901335 ?auto_901339 ) ) ( not ( = ?auto_901335 ?auto_901340 ) ) ( not ( = ?auto_901335 ?auto_901341 ) ) ( not ( = ?auto_901335 ?auto_901342 ) ) ( not ( = ?auto_901335 ?auto_901343 ) ) ( not ( = ?auto_901335 ?auto_901344 ) ) ( not ( = ?auto_901335 ?auto_901345 ) ) ( not ( = ?auto_901335 ?auto_901346 ) ) ( not ( = ?auto_901335 ?auto_901347 ) ) ( not ( = ?auto_901335 ?auto_901348 ) ) ( not ( = ?auto_901336 ?auto_901337 ) ) ( not ( = ?auto_901336 ?auto_901338 ) ) ( not ( = ?auto_901336 ?auto_901339 ) ) ( not ( = ?auto_901336 ?auto_901340 ) ) ( not ( = ?auto_901336 ?auto_901341 ) ) ( not ( = ?auto_901336 ?auto_901342 ) ) ( not ( = ?auto_901336 ?auto_901343 ) ) ( not ( = ?auto_901336 ?auto_901344 ) ) ( not ( = ?auto_901336 ?auto_901345 ) ) ( not ( = ?auto_901336 ?auto_901346 ) ) ( not ( = ?auto_901336 ?auto_901347 ) ) ( not ( = ?auto_901336 ?auto_901348 ) ) ( not ( = ?auto_901337 ?auto_901338 ) ) ( not ( = ?auto_901337 ?auto_901339 ) ) ( not ( = ?auto_901337 ?auto_901340 ) ) ( not ( = ?auto_901337 ?auto_901341 ) ) ( not ( = ?auto_901337 ?auto_901342 ) ) ( not ( = ?auto_901337 ?auto_901343 ) ) ( not ( = ?auto_901337 ?auto_901344 ) ) ( not ( = ?auto_901337 ?auto_901345 ) ) ( not ( = ?auto_901337 ?auto_901346 ) ) ( not ( = ?auto_901337 ?auto_901347 ) ) ( not ( = ?auto_901337 ?auto_901348 ) ) ( not ( = ?auto_901338 ?auto_901339 ) ) ( not ( = ?auto_901338 ?auto_901340 ) ) ( not ( = ?auto_901338 ?auto_901341 ) ) ( not ( = ?auto_901338 ?auto_901342 ) ) ( not ( = ?auto_901338 ?auto_901343 ) ) ( not ( = ?auto_901338 ?auto_901344 ) ) ( not ( = ?auto_901338 ?auto_901345 ) ) ( not ( = ?auto_901338 ?auto_901346 ) ) ( not ( = ?auto_901338 ?auto_901347 ) ) ( not ( = ?auto_901338 ?auto_901348 ) ) ( not ( = ?auto_901339 ?auto_901340 ) ) ( not ( = ?auto_901339 ?auto_901341 ) ) ( not ( = ?auto_901339 ?auto_901342 ) ) ( not ( = ?auto_901339 ?auto_901343 ) ) ( not ( = ?auto_901339 ?auto_901344 ) ) ( not ( = ?auto_901339 ?auto_901345 ) ) ( not ( = ?auto_901339 ?auto_901346 ) ) ( not ( = ?auto_901339 ?auto_901347 ) ) ( not ( = ?auto_901339 ?auto_901348 ) ) ( not ( = ?auto_901340 ?auto_901341 ) ) ( not ( = ?auto_901340 ?auto_901342 ) ) ( not ( = ?auto_901340 ?auto_901343 ) ) ( not ( = ?auto_901340 ?auto_901344 ) ) ( not ( = ?auto_901340 ?auto_901345 ) ) ( not ( = ?auto_901340 ?auto_901346 ) ) ( not ( = ?auto_901340 ?auto_901347 ) ) ( not ( = ?auto_901340 ?auto_901348 ) ) ( not ( = ?auto_901341 ?auto_901342 ) ) ( not ( = ?auto_901341 ?auto_901343 ) ) ( not ( = ?auto_901341 ?auto_901344 ) ) ( not ( = ?auto_901341 ?auto_901345 ) ) ( not ( = ?auto_901341 ?auto_901346 ) ) ( not ( = ?auto_901341 ?auto_901347 ) ) ( not ( = ?auto_901341 ?auto_901348 ) ) ( not ( = ?auto_901342 ?auto_901343 ) ) ( not ( = ?auto_901342 ?auto_901344 ) ) ( not ( = ?auto_901342 ?auto_901345 ) ) ( not ( = ?auto_901342 ?auto_901346 ) ) ( not ( = ?auto_901342 ?auto_901347 ) ) ( not ( = ?auto_901342 ?auto_901348 ) ) ( not ( = ?auto_901343 ?auto_901344 ) ) ( not ( = ?auto_901343 ?auto_901345 ) ) ( not ( = ?auto_901343 ?auto_901346 ) ) ( not ( = ?auto_901343 ?auto_901347 ) ) ( not ( = ?auto_901343 ?auto_901348 ) ) ( not ( = ?auto_901344 ?auto_901345 ) ) ( not ( = ?auto_901344 ?auto_901346 ) ) ( not ( = ?auto_901344 ?auto_901347 ) ) ( not ( = ?auto_901344 ?auto_901348 ) ) ( not ( = ?auto_901345 ?auto_901346 ) ) ( not ( = ?auto_901345 ?auto_901347 ) ) ( not ( = ?auto_901345 ?auto_901348 ) ) ( not ( = ?auto_901346 ?auto_901347 ) ) ( not ( = ?auto_901346 ?auto_901348 ) ) ( not ( = ?auto_901347 ?auto_901348 ) ) ( ON ?auto_901346 ?auto_901347 ) ( ON ?auto_901345 ?auto_901346 ) ( ON ?auto_901344 ?auto_901345 ) ( ON ?auto_901343 ?auto_901344 ) ( ON ?auto_901342 ?auto_901343 ) ( ON ?auto_901341 ?auto_901342 ) ( ON ?auto_901340 ?auto_901341 ) ( ON ?auto_901339 ?auto_901340 ) ( ON ?auto_901338 ?auto_901339 ) ( CLEAR ?auto_901336 ) ( ON ?auto_901337 ?auto_901338 ) ( CLEAR ?auto_901337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_901335 ?auto_901336 ?auto_901337 )
      ( MAKE-13PILE ?auto_901335 ?auto_901336 ?auto_901337 ?auto_901338 ?auto_901339 ?auto_901340 ?auto_901341 ?auto_901342 ?auto_901343 ?auto_901344 ?auto_901345 ?auto_901346 ?auto_901347 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_901389 - BLOCK
      ?auto_901390 - BLOCK
      ?auto_901391 - BLOCK
      ?auto_901392 - BLOCK
      ?auto_901393 - BLOCK
      ?auto_901394 - BLOCK
      ?auto_901395 - BLOCK
      ?auto_901396 - BLOCK
      ?auto_901397 - BLOCK
      ?auto_901398 - BLOCK
      ?auto_901399 - BLOCK
      ?auto_901400 - BLOCK
      ?auto_901401 - BLOCK
    )
    :vars
    (
      ?auto_901402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901401 ?auto_901402 ) ( ON-TABLE ?auto_901389 ) ( not ( = ?auto_901389 ?auto_901390 ) ) ( not ( = ?auto_901389 ?auto_901391 ) ) ( not ( = ?auto_901389 ?auto_901392 ) ) ( not ( = ?auto_901389 ?auto_901393 ) ) ( not ( = ?auto_901389 ?auto_901394 ) ) ( not ( = ?auto_901389 ?auto_901395 ) ) ( not ( = ?auto_901389 ?auto_901396 ) ) ( not ( = ?auto_901389 ?auto_901397 ) ) ( not ( = ?auto_901389 ?auto_901398 ) ) ( not ( = ?auto_901389 ?auto_901399 ) ) ( not ( = ?auto_901389 ?auto_901400 ) ) ( not ( = ?auto_901389 ?auto_901401 ) ) ( not ( = ?auto_901389 ?auto_901402 ) ) ( not ( = ?auto_901390 ?auto_901391 ) ) ( not ( = ?auto_901390 ?auto_901392 ) ) ( not ( = ?auto_901390 ?auto_901393 ) ) ( not ( = ?auto_901390 ?auto_901394 ) ) ( not ( = ?auto_901390 ?auto_901395 ) ) ( not ( = ?auto_901390 ?auto_901396 ) ) ( not ( = ?auto_901390 ?auto_901397 ) ) ( not ( = ?auto_901390 ?auto_901398 ) ) ( not ( = ?auto_901390 ?auto_901399 ) ) ( not ( = ?auto_901390 ?auto_901400 ) ) ( not ( = ?auto_901390 ?auto_901401 ) ) ( not ( = ?auto_901390 ?auto_901402 ) ) ( not ( = ?auto_901391 ?auto_901392 ) ) ( not ( = ?auto_901391 ?auto_901393 ) ) ( not ( = ?auto_901391 ?auto_901394 ) ) ( not ( = ?auto_901391 ?auto_901395 ) ) ( not ( = ?auto_901391 ?auto_901396 ) ) ( not ( = ?auto_901391 ?auto_901397 ) ) ( not ( = ?auto_901391 ?auto_901398 ) ) ( not ( = ?auto_901391 ?auto_901399 ) ) ( not ( = ?auto_901391 ?auto_901400 ) ) ( not ( = ?auto_901391 ?auto_901401 ) ) ( not ( = ?auto_901391 ?auto_901402 ) ) ( not ( = ?auto_901392 ?auto_901393 ) ) ( not ( = ?auto_901392 ?auto_901394 ) ) ( not ( = ?auto_901392 ?auto_901395 ) ) ( not ( = ?auto_901392 ?auto_901396 ) ) ( not ( = ?auto_901392 ?auto_901397 ) ) ( not ( = ?auto_901392 ?auto_901398 ) ) ( not ( = ?auto_901392 ?auto_901399 ) ) ( not ( = ?auto_901392 ?auto_901400 ) ) ( not ( = ?auto_901392 ?auto_901401 ) ) ( not ( = ?auto_901392 ?auto_901402 ) ) ( not ( = ?auto_901393 ?auto_901394 ) ) ( not ( = ?auto_901393 ?auto_901395 ) ) ( not ( = ?auto_901393 ?auto_901396 ) ) ( not ( = ?auto_901393 ?auto_901397 ) ) ( not ( = ?auto_901393 ?auto_901398 ) ) ( not ( = ?auto_901393 ?auto_901399 ) ) ( not ( = ?auto_901393 ?auto_901400 ) ) ( not ( = ?auto_901393 ?auto_901401 ) ) ( not ( = ?auto_901393 ?auto_901402 ) ) ( not ( = ?auto_901394 ?auto_901395 ) ) ( not ( = ?auto_901394 ?auto_901396 ) ) ( not ( = ?auto_901394 ?auto_901397 ) ) ( not ( = ?auto_901394 ?auto_901398 ) ) ( not ( = ?auto_901394 ?auto_901399 ) ) ( not ( = ?auto_901394 ?auto_901400 ) ) ( not ( = ?auto_901394 ?auto_901401 ) ) ( not ( = ?auto_901394 ?auto_901402 ) ) ( not ( = ?auto_901395 ?auto_901396 ) ) ( not ( = ?auto_901395 ?auto_901397 ) ) ( not ( = ?auto_901395 ?auto_901398 ) ) ( not ( = ?auto_901395 ?auto_901399 ) ) ( not ( = ?auto_901395 ?auto_901400 ) ) ( not ( = ?auto_901395 ?auto_901401 ) ) ( not ( = ?auto_901395 ?auto_901402 ) ) ( not ( = ?auto_901396 ?auto_901397 ) ) ( not ( = ?auto_901396 ?auto_901398 ) ) ( not ( = ?auto_901396 ?auto_901399 ) ) ( not ( = ?auto_901396 ?auto_901400 ) ) ( not ( = ?auto_901396 ?auto_901401 ) ) ( not ( = ?auto_901396 ?auto_901402 ) ) ( not ( = ?auto_901397 ?auto_901398 ) ) ( not ( = ?auto_901397 ?auto_901399 ) ) ( not ( = ?auto_901397 ?auto_901400 ) ) ( not ( = ?auto_901397 ?auto_901401 ) ) ( not ( = ?auto_901397 ?auto_901402 ) ) ( not ( = ?auto_901398 ?auto_901399 ) ) ( not ( = ?auto_901398 ?auto_901400 ) ) ( not ( = ?auto_901398 ?auto_901401 ) ) ( not ( = ?auto_901398 ?auto_901402 ) ) ( not ( = ?auto_901399 ?auto_901400 ) ) ( not ( = ?auto_901399 ?auto_901401 ) ) ( not ( = ?auto_901399 ?auto_901402 ) ) ( not ( = ?auto_901400 ?auto_901401 ) ) ( not ( = ?auto_901400 ?auto_901402 ) ) ( not ( = ?auto_901401 ?auto_901402 ) ) ( ON ?auto_901400 ?auto_901401 ) ( ON ?auto_901399 ?auto_901400 ) ( ON ?auto_901398 ?auto_901399 ) ( ON ?auto_901397 ?auto_901398 ) ( ON ?auto_901396 ?auto_901397 ) ( ON ?auto_901395 ?auto_901396 ) ( ON ?auto_901394 ?auto_901395 ) ( ON ?auto_901393 ?auto_901394 ) ( ON ?auto_901392 ?auto_901393 ) ( ON ?auto_901391 ?auto_901392 ) ( CLEAR ?auto_901389 ) ( ON ?auto_901390 ?auto_901391 ) ( CLEAR ?auto_901390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_901389 ?auto_901390 )
      ( MAKE-13PILE ?auto_901389 ?auto_901390 ?auto_901391 ?auto_901392 ?auto_901393 ?auto_901394 ?auto_901395 ?auto_901396 ?auto_901397 ?auto_901398 ?auto_901399 ?auto_901400 ?auto_901401 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_901443 - BLOCK
      ?auto_901444 - BLOCK
      ?auto_901445 - BLOCK
      ?auto_901446 - BLOCK
      ?auto_901447 - BLOCK
      ?auto_901448 - BLOCK
      ?auto_901449 - BLOCK
      ?auto_901450 - BLOCK
      ?auto_901451 - BLOCK
      ?auto_901452 - BLOCK
      ?auto_901453 - BLOCK
      ?auto_901454 - BLOCK
      ?auto_901455 - BLOCK
    )
    :vars
    (
      ?auto_901456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901455 ?auto_901456 ) ( not ( = ?auto_901443 ?auto_901444 ) ) ( not ( = ?auto_901443 ?auto_901445 ) ) ( not ( = ?auto_901443 ?auto_901446 ) ) ( not ( = ?auto_901443 ?auto_901447 ) ) ( not ( = ?auto_901443 ?auto_901448 ) ) ( not ( = ?auto_901443 ?auto_901449 ) ) ( not ( = ?auto_901443 ?auto_901450 ) ) ( not ( = ?auto_901443 ?auto_901451 ) ) ( not ( = ?auto_901443 ?auto_901452 ) ) ( not ( = ?auto_901443 ?auto_901453 ) ) ( not ( = ?auto_901443 ?auto_901454 ) ) ( not ( = ?auto_901443 ?auto_901455 ) ) ( not ( = ?auto_901443 ?auto_901456 ) ) ( not ( = ?auto_901444 ?auto_901445 ) ) ( not ( = ?auto_901444 ?auto_901446 ) ) ( not ( = ?auto_901444 ?auto_901447 ) ) ( not ( = ?auto_901444 ?auto_901448 ) ) ( not ( = ?auto_901444 ?auto_901449 ) ) ( not ( = ?auto_901444 ?auto_901450 ) ) ( not ( = ?auto_901444 ?auto_901451 ) ) ( not ( = ?auto_901444 ?auto_901452 ) ) ( not ( = ?auto_901444 ?auto_901453 ) ) ( not ( = ?auto_901444 ?auto_901454 ) ) ( not ( = ?auto_901444 ?auto_901455 ) ) ( not ( = ?auto_901444 ?auto_901456 ) ) ( not ( = ?auto_901445 ?auto_901446 ) ) ( not ( = ?auto_901445 ?auto_901447 ) ) ( not ( = ?auto_901445 ?auto_901448 ) ) ( not ( = ?auto_901445 ?auto_901449 ) ) ( not ( = ?auto_901445 ?auto_901450 ) ) ( not ( = ?auto_901445 ?auto_901451 ) ) ( not ( = ?auto_901445 ?auto_901452 ) ) ( not ( = ?auto_901445 ?auto_901453 ) ) ( not ( = ?auto_901445 ?auto_901454 ) ) ( not ( = ?auto_901445 ?auto_901455 ) ) ( not ( = ?auto_901445 ?auto_901456 ) ) ( not ( = ?auto_901446 ?auto_901447 ) ) ( not ( = ?auto_901446 ?auto_901448 ) ) ( not ( = ?auto_901446 ?auto_901449 ) ) ( not ( = ?auto_901446 ?auto_901450 ) ) ( not ( = ?auto_901446 ?auto_901451 ) ) ( not ( = ?auto_901446 ?auto_901452 ) ) ( not ( = ?auto_901446 ?auto_901453 ) ) ( not ( = ?auto_901446 ?auto_901454 ) ) ( not ( = ?auto_901446 ?auto_901455 ) ) ( not ( = ?auto_901446 ?auto_901456 ) ) ( not ( = ?auto_901447 ?auto_901448 ) ) ( not ( = ?auto_901447 ?auto_901449 ) ) ( not ( = ?auto_901447 ?auto_901450 ) ) ( not ( = ?auto_901447 ?auto_901451 ) ) ( not ( = ?auto_901447 ?auto_901452 ) ) ( not ( = ?auto_901447 ?auto_901453 ) ) ( not ( = ?auto_901447 ?auto_901454 ) ) ( not ( = ?auto_901447 ?auto_901455 ) ) ( not ( = ?auto_901447 ?auto_901456 ) ) ( not ( = ?auto_901448 ?auto_901449 ) ) ( not ( = ?auto_901448 ?auto_901450 ) ) ( not ( = ?auto_901448 ?auto_901451 ) ) ( not ( = ?auto_901448 ?auto_901452 ) ) ( not ( = ?auto_901448 ?auto_901453 ) ) ( not ( = ?auto_901448 ?auto_901454 ) ) ( not ( = ?auto_901448 ?auto_901455 ) ) ( not ( = ?auto_901448 ?auto_901456 ) ) ( not ( = ?auto_901449 ?auto_901450 ) ) ( not ( = ?auto_901449 ?auto_901451 ) ) ( not ( = ?auto_901449 ?auto_901452 ) ) ( not ( = ?auto_901449 ?auto_901453 ) ) ( not ( = ?auto_901449 ?auto_901454 ) ) ( not ( = ?auto_901449 ?auto_901455 ) ) ( not ( = ?auto_901449 ?auto_901456 ) ) ( not ( = ?auto_901450 ?auto_901451 ) ) ( not ( = ?auto_901450 ?auto_901452 ) ) ( not ( = ?auto_901450 ?auto_901453 ) ) ( not ( = ?auto_901450 ?auto_901454 ) ) ( not ( = ?auto_901450 ?auto_901455 ) ) ( not ( = ?auto_901450 ?auto_901456 ) ) ( not ( = ?auto_901451 ?auto_901452 ) ) ( not ( = ?auto_901451 ?auto_901453 ) ) ( not ( = ?auto_901451 ?auto_901454 ) ) ( not ( = ?auto_901451 ?auto_901455 ) ) ( not ( = ?auto_901451 ?auto_901456 ) ) ( not ( = ?auto_901452 ?auto_901453 ) ) ( not ( = ?auto_901452 ?auto_901454 ) ) ( not ( = ?auto_901452 ?auto_901455 ) ) ( not ( = ?auto_901452 ?auto_901456 ) ) ( not ( = ?auto_901453 ?auto_901454 ) ) ( not ( = ?auto_901453 ?auto_901455 ) ) ( not ( = ?auto_901453 ?auto_901456 ) ) ( not ( = ?auto_901454 ?auto_901455 ) ) ( not ( = ?auto_901454 ?auto_901456 ) ) ( not ( = ?auto_901455 ?auto_901456 ) ) ( ON ?auto_901454 ?auto_901455 ) ( ON ?auto_901453 ?auto_901454 ) ( ON ?auto_901452 ?auto_901453 ) ( ON ?auto_901451 ?auto_901452 ) ( ON ?auto_901450 ?auto_901451 ) ( ON ?auto_901449 ?auto_901450 ) ( ON ?auto_901448 ?auto_901449 ) ( ON ?auto_901447 ?auto_901448 ) ( ON ?auto_901446 ?auto_901447 ) ( ON ?auto_901445 ?auto_901446 ) ( ON ?auto_901444 ?auto_901445 ) ( ON ?auto_901443 ?auto_901444 ) ( CLEAR ?auto_901443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_901443 )
      ( MAKE-13PILE ?auto_901443 ?auto_901444 ?auto_901445 ?auto_901446 ?auto_901447 ?auto_901448 ?auto_901449 ?auto_901450 ?auto_901451 ?auto_901452 ?auto_901453 ?auto_901454 ?auto_901455 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_901498 - BLOCK
      ?auto_901499 - BLOCK
      ?auto_901500 - BLOCK
      ?auto_901501 - BLOCK
      ?auto_901502 - BLOCK
      ?auto_901503 - BLOCK
      ?auto_901504 - BLOCK
      ?auto_901505 - BLOCK
      ?auto_901506 - BLOCK
      ?auto_901507 - BLOCK
      ?auto_901508 - BLOCK
      ?auto_901509 - BLOCK
      ?auto_901510 - BLOCK
      ?auto_901511 - BLOCK
    )
    :vars
    (
      ?auto_901512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_901510 ) ( ON ?auto_901511 ?auto_901512 ) ( CLEAR ?auto_901511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_901498 ) ( ON ?auto_901499 ?auto_901498 ) ( ON ?auto_901500 ?auto_901499 ) ( ON ?auto_901501 ?auto_901500 ) ( ON ?auto_901502 ?auto_901501 ) ( ON ?auto_901503 ?auto_901502 ) ( ON ?auto_901504 ?auto_901503 ) ( ON ?auto_901505 ?auto_901504 ) ( ON ?auto_901506 ?auto_901505 ) ( ON ?auto_901507 ?auto_901506 ) ( ON ?auto_901508 ?auto_901507 ) ( ON ?auto_901509 ?auto_901508 ) ( ON ?auto_901510 ?auto_901509 ) ( not ( = ?auto_901498 ?auto_901499 ) ) ( not ( = ?auto_901498 ?auto_901500 ) ) ( not ( = ?auto_901498 ?auto_901501 ) ) ( not ( = ?auto_901498 ?auto_901502 ) ) ( not ( = ?auto_901498 ?auto_901503 ) ) ( not ( = ?auto_901498 ?auto_901504 ) ) ( not ( = ?auto_901498 ?auto_901505 ) ) ( not ( = ?auto_901498 ?auto_901506 ) ) ( not ( = ?auto_901498 ?auto_901507 ) ) ( not ( = ?auto_901498 ?auto_901508 ) ) ( not ( = ?auto_901498 ?auto_901509 ) ) ( not ( = ?auto_901498 ?auto_901510 ) ) ( not ( = ?auto_901498 ?auto_901511 ) ) ( not ( = ?auto_901498 ?auto_901512 ) ) ( not ( = ?auto_901499 ?auto_901500 ) ) ( not ( = ?auto_901499 ?auto_901501 ) ) ( not ( = ?auto_901499 ?auto_901502 ) ) ( not ( = ?auto_901499 ?auto_901503 ) ) ( not ( = ?auto_901499 ?auto_901504 ) ) ( not ( = ?auto_901499 ?auto_901505 ) ) ( not ( = ?auto_901499 ?auto_901506 ) ) ( not ( = ?auto_901499 ?auto_901507 ) ) ( not ( = ?auto_901499 ?auto_901508 ) ) ( not ( = ?auto_901499 ?auto_901509 ) ) ( not ( = ?auto_901499 ?auto_901510 ) ) ( not ( = ?auto_901499 ?auto_901511 ) ) ( not ( = ?auto_901499 ?auto_901512 ) ) ( not ( = ?auto_901500 ?auto_901501 ) ) ( not ( = ?auto_901500 ?auto_901502 ) ) ( not ( = ?auto_901500 ?auto_901503 ) ) ( not ( = ?auto_901500 ?auto_901504 ) ) ( not ( = ?auto_901500 ?auto_901505 ) ) ( not ( = ?auto_901500 ?auto_901506 ) ) ( not ( = ?auto_901500 ?auto_901507 ) ) ( not ( = ?auto_901500 ?auto_901508 ) ) ( not ( = ?auto_901500 ?auto_901509 ) ) ( not ( = ?auto_901500 ?auto_901510 ) ) ( not ( = ?auto_901500 ?auto_901511 ) ) ( not ( = ?auto_901500 ?auto_901512 ) ) ( not ( = ?auto_901501 ?auto_901502 ) ) ( not ( = ?auto_901501 ?auto_901503 ) ) ( not ( = ?auto_901501 ?auto_901504 ) ) ( not ( = ?auto_901501 ?auto_901505 ) ) ( not ( = ?auto_901501 ?auto_901506 ) ) ( not ( = ?auto_901501 ?auto_901507 ) ) ( not ( = ?auto_901501 ?auto_901508 ) ) ( not ( = ?auto_901501 ?auto_901509 ) ) ( not ( = ?auto_901501 ?auto_901510 ) ) ( not ( = ?auto_901501 ?auto_901511 ) ) ( not ( = ?auto_901501 ?auto_901512 ) ) ( not ( = ?auto_901502 ?auto_901503 ) ) ( not ( = ?auto_901502 ?auto_901504 ) ) ( not ( = ?auto_901502 ?auto_901505 ) ) ( not ( = ?auto_901502 ?auto_901506 ) ) ( not ( = ?auto_901502 ?auto_901507 ) ) ( not ( = ?auto_901502 ?auto_901508 ) ) ( not ( = ?auto_901502 ?auto_901509 ) ) ( not ( = ?auto_901502 ?auto_901510 ) ) ( not ( = ?auto_901502 ?auto_901511 ) ) ( not ( = ?auto_901502 ?auto_901512 ) ) ( not ( = ?auto_901503 ?auto_901504 ) ) ( not ( = ?auto_901503 ?auto_901505 ) ) ( not ( = ?auto_901503 ?auto_901506 ) ) ( not ( = ?auto_901503 ?auto_901507 ) ) ( not ( = ?auto_901503 ?auto_901508 ) ) ( not ( = ?auto_901503 ?auto_901509 ) ) ( not ( = ?auto_901503 ?auto_901510 ) ) ( not ( = ?auto_901503 ?auto_901511 ) ) ( not ( = ?auto_901503 ?auto_901512 ) ) ( not ( = ?auto_901504 ?auto_901505 ) ) ( not ( = ?auto_901504 ?auto_901506 ) ) ( not ( = ?auto_901504 ?auto_901507 ) ) ( not ( = ?auto_901504 ?auto_901508 ) ) ( not ( = ?auto_901504 ?auto_901509 ) ) ( not ( = ?auto_901504 ?auto_901510 ) ) ( not ( = ?auto_901504 ?auto_901511 ) ) ( not ( = ?auto_901504 ?auto_901512 ) ) ( not ( = ?auto_901505 ?auto_901506 ) ) ( not ( = ?auto_901505 ?auto_901507 ) ) ( not ( = ?auto_901505 ?auto_901508 ) ) ( not ( = ?auto_901505 ?auto_901509 ) ) ( not ( = ?auto_901505 ?auto_901510 ) ) ( not ( = ?auto_901505 ?auto_901511 ) ) ( not ( = ?auto_901505 ?auto_901512 ) ) ( not ( = ?auto_901506 ?auto_901507 ) ) ( not ( = ?auto_901506 ?auto_901508 ) ) ( not ( = ?auto_901506 ?auto_901509 ) ) ( not ( = ?auto_901506 ?auto_901510 ) ) ( not ( = ?auto_901506 ?auto_901511 ) ) ( not ( = ?auto_901506 ?auto_901512 ) ) ( not ( = ?auto_901507 ?auto_901508 ) ) ( not ( = ?auto_901507 ?auto_901509 ) ) ( not ( = ?auto_901507 ?auto_901510 ) ) ( not ( = ?auto_901507 ?auto_901511 ) ) ( not ( = ?auto_901507 ?auto_901512 ) ) ( not ( = ?auto_901508 ?auto_901509 ) ) ( not ( = ?auto_901508 ?auto_901510 ) ) ( not ( = ?auto_901508 ?auto_901511 ) ) ( not ( = ?auto_901508 ?auto_901512 ) ) ( not ( = ?auto_901509 ?auto_901510 ) ) ( not ( = ?auto_901509 ?auto_901511 ) ) ( not ( = ?auto_901509 ?auto_901512 ) ) ( not ( = ?auto_901510 ?auto_901511 ) ) ( not ( = ?auto_901510 ?auto_901512 ) ) ( not ( = ?auto_901511 ?auto_901512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_901511 ?auto_901512 )
      ( !STACK ?auto_901511 ?auto_901510 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_901556 - BLOCK
      ?auto_901557 - BLOCK
      ?auto_901558 - BLOCK
      ?auto_901559 - BLOCK
      ?auto_901560 - BLOCK
      ?auto_901561 - BLOCK
      ?auto_901562 - BLOCK
      ?auto_901563 - BLOCK
      ?auto_901564 - BLOCK
      ?auto_901565 - BLOCK
      ?auto_901566 - BLOCK
      ?auto_901567 - BLOCK
      ?auto_901568 - BLOCK
      ?auto_901569 - BLOCK
    )
    :vars
    (
      ?auto_901570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901569 ?auto_901570 ) ( ON-TABLE ?auto_901556 ) ( ON ?auto_901557 ?auto_901556 ) ( ON ?auto_901558 ?auto_901557 ) ( ON ?auto_901559 ?auto_901558 ) ( ON ?auto_901560 ?auto_901559 ) ( ON ?auto_901561 ?auto_901560 ) ( ON ?auto_901562 ?auto_901561 ) ( ON ?auto_901563 ?auto_901562 ) ( ON ?auto_901564 ?auto_901563 ) ( ON ?auto_901565 ?auto_901564 ) ( ON ?auto_901566 ?auto_901565 ) ( ON ?auto_901567 ?auto_901566 ) ( not ( = ?auto_901556 ?auto_901557 ) ) ( not ( = ?auto_901556 ?auto_901558 ) ) ( not ( = ?auto_901556 ?auto_901559 ) ) ( not ( = ?auto_901556 ?auto_901560 ) ) ( not ( = ?auto_901556 ?auto_901561 ) ) ( not ( = ?auto_901556 ?auto_901562 ) ) ( not ( = ?auto_901556 ?auto_901563 ) ) ( not ( = ?auto_901556 ?auto_901564 ) ) ( not ( = ?auto_901556 ?auto_901565 ) ) ( not ( = ?auto_901556 ?auto_901566 ) ) ( not ( = ?auto_901556 ?auto_901567 ) ) ( not ( = ?auto_901556 ?auto_901568 ) ) ( not ( = ?auto_901556 ?auto_901569 ) ) ( not ( = ?auto_901556 ?auto_901570 ) ) ( not ( = ?auto_901557 ?auto_901558 ) ) ( not ( = ?auto_901557 ?auto_901559 ) ) ( not ( = ?auto_901557 ?auto_901560 ) ) ( not ( = ?auto_901557 ?auto_901561 ) ) ( not ( = ?auto_901557 ?auto_901562 ) ) ( not ( = ?auto_901557 ?auto_901563 ) ) ( not ( = ?auto_901557 ?auto_901564 ) ) ( not ( = ?auto_901557 ?auto_901565 ) ) ( not ( = ?auto_901557 ?auto_901566 ) ) ( not ( = ?auto_901557 ?auto_901567 ) ) ( not ( = ?auto_901557 ?auto_901568 ) ) ( not ( = ?auto_901557 ?auto_901569 ) ) ( not ( = ?auto_901557 ?auto_901570 ) ) ( not ( = ?auto_901558 ?auto_901559 ) ) ( not ( = ?auto_901558 ?auto_901560 ) ) ( not ( = ?auto_901558 ?auto_901561 ) ) ( not ( = ?auto_901558 ?auto_901562 ) ) ( not ( = ?auto_901558 ?auto_901563 ) ) ( not ( = ?auto_901558 ?auto_901564 ) ) ( not ( = ?auto_901558 ?auto_901565 ) ) ( not ( = ?auto_901558 ?auto_901566 ) ) ( not ( = ?auto_901558 ?auto_901567 ) ) ( not ( = ?auto_901558 ?auto_901568 ) ) ( not ( = ?auto_901558 ?auto_901569 ) ) ( not ( = ?auto_901558 ?auto_901570 ) ) ( not ( = ?auto_901559 ?auto_901560 ) ) ( not ( = ?auto_901559 ?auto_901561 ) ) ( not ( = ?auto_901559 ?auto_901562 ) ) ( not ( = ?auto_901559 ?auto_901563 ) ) ( not ( = ?auto_901559 ?auto_901564 ) ) ( not ( = ?auto_901559 ?auto_901565 ) ) ( not ( = ?auto_901559 ?auto_901566 ) ) ( not ( = ?auto_901559 ?auto_901567 ) ) ( not ( = ?auto_901559 ?auto_901568 ) ) ( not ( = ?auto_901559 ?auto_901569 ) ) ( not ( = ?auto_901559 ?auto_901570 ) ) ( not ( = ?auto_901560 ?auto_901561 ) ) ( not ( = ?auto_901560 ?auto_901562 ) ) ( not ( = ?auto_901560 ?auto_901563 ) ) ( not ( = ?auto_901560 ?auto_901564 ) ) ( not ( = ?auto_901560 ?auto_901565 ) ) ( not ( = ?auto_901560 ?auto_901566 ) ) ( not ( = ?auto_901560 ?auto_901567 ) ) ( not ( = ?auto_901560 ?auto_901568 ) ) ( not ( = ?auto_901560 ?auto_901569 ) ) ( not ( = ?auto_901560 ?auto_901570 ) ) ( not ( = ?auto_901561 ?auto_901562 ) ) ( not ( = ?auto_901561 ?auto_901563 ) ) ( not ( = ?auto_901561 ?auto_901564 ) ) ( not ( = ?auto_901561 ?auto_901565 ) ) ( not ( = ?auto_901561 ?auto_901566 ) ) ( not ( = ?auto_901561 ?auto_901567 ) ) ( not ( = ?auto_901561 ?auto_901568 ) ) ( not ( = ?auto_901561 ?auto_901569 ) ) ( not ( = ?auto_901561 ?auto_901570 ) ) ( not ( = ?auto_901562 ?auto_901563 ) ) ( not ( = ?auto_901562 ?auto_901564 ) ) ( not ( = ?auto_901562 ?auto_901565 ) ) ( not ( = ?auto_901562 ?auto_901566 ) ) ( not ( = ?auto_901562 ?auto_901567 ) ) ( not ( = ?auto_901562 ?auto_901568 ) ) ( not ( = ?auto_901562 ?auto_901569 ) ) ( not ( = ?auto_901562 ?auto_901570 ) ) ( not ( = ?auto_901563 ?auto_901564 ) ) ( not ( = ?auto_901563 ?auto_901565 ) ) ( not ( = ?auto_901563 ?auto_901566 ) ) ( not ( = ?auto_901563 ?auto_901567 ) ) ( not ( = ?auto_901563 ?auto_901568 ) ) ( not ( = ?auto_901563 ?auto_901569 ) ) ( not ( = ?auto_901563 ?auto_901570 ) ) ( not ( = ?auto_901564 ?auto_901565 ) ) ( not ( = ?auto_901564 ?auto_901566 ) ) ( not ( = ?auto_901564 ?auto_901567 ) ) ( not ( = ?auto_901564 ?auto_901568 ) ) ( not ( = ?auto_901564 ?auto_901569 ) ) ( not ( = ?auto_901564 ?auto_901570 ) ) ( not ( = ?auto_901565 ?auto_901566 ) ) ( not ( = ?auto_901565 ?auto_901567 ) ) ( not ( = ?auto_901565 ?auto_901568 ) ) ( not ( = ?auto_901565 ?auto_901569 ) ) ( not ( = ?auto_901565 ?auto_901570 ) ) ( not ( = ?auto_901566 ?auto_901567 ) ) ( not ( = ?auto_901566 ?auto_901568 ) ) ( not ( = ?auto_901566 ?auto_901569 ) ) ( not ( = ?auto_901566 ?auto_901570 ) ) ( not ( = ?auto_901567 ?auto_901568 ) ) ( not ( = ?auto_901567 ?auto_901569 ) ) ( not ( = ?auto_901567 ?auto_901570 ) ) ( not ( = ?auto_901568 ?auto_901569 ) ) ( not ( = ?auto_901568 ?auto_901570 ) ) ( not ( = ?auto_901569 ?auto_901570 ) ) ( CLEAR ?auto_901567 ) ( ON ?auto_901568 ?auto_901569 ) ( CLEAR ?auto_901568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_901556 ?auto_901557 ?auto_901558 ?auto_901559 ?auto_901560 ?auto_901561 ?auto_901562 ?auto_901563 ?auto_901564 ?auto_901565 ?auto_901566 ?auto_901567 ?auto_901568 )
      ( MAKE-14PILE ?auto_901556 ?auto_901557 ?auto_901558 ?auto_901559 ?auto_901560 ?auto_901561 ?auto_901562 ?auto_901563 ?auto_901564 ?auto_901565 ?auto_901566 ?auto_901567 ?auto_901568 ?auto_901569 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_901614 - BLOCK
      ?auto_901615 - BLOCK
      ?auto_901616 - BLOCK
      ?auto_901617 - BLOCK
      ?auto_901618 - BLOCK
      ?auto_901619 - BLOCK
      ?auto_901620 - BLOCK
      ?auto_901621 - BLOCK
      ?auto_901622 - BLOCK
      ?auto_901623 - BLOCK
      ?auto_901624 - BLOCK
      ?auto_901625 - BLOCK
      ?auto_901626 - BLOCK
      ?auto_901627 - BLOCK
    )
    :vars
    (
      ?auto_901628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901627 ?auto_901628 ) ( ON-TABLE ?auto_901614 ) ( ON ?auto_901615 ?auto_901614 ) ( ON ?auto_901616 ?auto_901615 ) ( ON ?auto_901617 ?auto_901616 ) ( ON ?auto_901618 ?auto_901617 ) ( ON ?auto_901619 ?auto_901618 ) ( ON ?auto_901620 ?auto_901619 ) ( ON ?auto_901621 ?auto_901620 ) ( ON ?auto_901622 ?auto_901621 ) ( ON ?auto_901623 ?auto_901622 ) ( ON ?auto_901624 ?auto_901623 ) ( not ( = ?auto_901614 ?auto_901615 ) ) ( not ( = ?auto_901614 ?auto_901616 ) ) ( not ( = ?auto_901614 ?auto_901617 ) ) ( not ( = ?auto_901614 ?auto_901618 ) ) ( not ( = ?auto_901614 ?auto_901619 ) ) ( not ( = ?auto_901614 ?auto_901620 ) ) ( not ( = ?auto_901614 ?auto_901621 ) ) ( not ( = ?auto_901614 ?auto_901622 ) ) ( not ( = ?auto_901614 ?auto_901623 ) ) ( not ( = ?auto_901614 ?auto_901624 ) ) ( not ( = ?auto_901614 ?auto_901625 ) ) ( not ( = ?auto_901614 ?auto_901626 ) ) ( not ( = ?auto_901614 ?auto_901627 ) ) ( not ( = ?auto_901614 ?auto_901628 ) ) ( not ( = ?auto_901615 ?auto_901616 ) ) ( not ( = ?auto_901615 ?auto_901617 ) ) ( not ( = ?auto_901615 ?auto_901618 ) ) ( not ( = ?auto_901615 ?auto_901619 ) ) ( not ( = ?auto_901615 ?auto_901620 ) ) ( not ( = ?auto_901615 ?auto_901621 ) ) ( not ( = ?auto_901615 ?auto_901622 ) ) ( not ( = ?auto_901615 ?auto_901623 ) ) ( not ( = ?auto_901615 ?auto_901624 ) ) ( not ( = ?auto_901615 ?auto_901625 ) ) ( not ( = ?auto_901615 ?auto_901626 ) ) ( not ( = ?auto_901615 ?auto_901627 ) ) ( not ( = ?auto_901615 ?auto_901628 ) ) ( not ( = ?auto_901616 ?auto_901617 ) ) ( not ( = ?auto_901616 ?auto_901618 ) ) ( not ( = ?auto_901616 ?auto_901619 ) ) ( not ( = ?auto_901616 ?auto_901620 ) ) ( not ( = ?auto_901616 ?auto_901621 ) ) ( not ( = ?auto_901616 ?auto_901622 ) ) ( not ( = ?auto_901616 ?auto_901623 ) ) ( not ( = ?auto_901616 ?auto_901624 ) ) ( not ( = ?auto_901616 ?auto_901625 ) ) ( not ( = ?auto_901616 ?auto_901626 ) ) ( not ( = ?auto_901616 ?auto_901627 ) ) ( not ( = ?auto_901616 ?auto_901628 ) ) ( not ( = ?auto_901617 ?auto_901618 ) ) ( not ( = ?auto_901617 ?auto_901619 ) ) ( not ( = ?auto_901617 ?auto_901620 ) ) ( not ( = ?auto_901617 ?auto_901621 ) ) ( not ( = ?auto_901617 ?auto_901622 ) ) ( not ( = ?auto_901617 ?auto_901623 ) ) ( not ( = ?auto_901617 ?auto_901624 ) ) ( not ( = ?auto_901617 ?auto_901625 ) ) ( not ( = ?auto_901617 ?auto_901626 ) ) ( not ( = ?auto_901617 ?auto_901627 ) ) ( not ( = ?auto_901617 ?auto_901628 ) ) ( not ( = ?auto_901618 ?auto_901619 ) ) ( not ( = ?auto_901618 ?auto_901620 ) ) ( not ( = ?auto_901618 ?auto_901621 ) ) ( not ( = ?auto_901618 ?auto_901622 ) ) ( not ( = ?auto_901618 ?auto_901623 ) ) ( not ( = ?auto_901618 ?auto_901624 ) ) ( not ( = ?auto_901618 ?auto_901625 ) ) ( not ( = ?auto_901618 ?auto_901626 ) ) ( not ( = ?auto_901618 ?auto_901627 ) ) ( not ( = ?auto_901618 ?auto_901628 ) ) ( not ( = ?auto_901619 ?auto_901620 ) ) ( not ( = ?auto_901619 ?auto_901621 ) ) ( not ( = ?auto_901619 ?auto_901622 ) ) ( not ( = ?auto_901619 ?auto_901623 ) ) ( not ( = ?auto_901619 ?auto_901624 ) ) ( not ( = ?auto_901619 ?auto_901625 ) ) ( not ( = ?auto_901619 ?auto_901626 ) ) ( not ( = ?auto_901619 ?auto_901627 ) ) ( not ( = ?auto_901619 ?auto_901628 ) ) ( not ( = ?auto_901620 ?auto_901621 ) ) ( not ( = ?auto_901620 ?auto_901622 ) ) ( not ( = ?auto_901620 ?auto_901623 ) ) ( not ( = ?auto_901620 ?auto_901624 ) ) ( not ( = ?auto_901620 ?auto_901625 ) ) ( not ( = ?auto_901620 ?auto_901626 ) ) ( not ( = ?auto_901620 ?auto_901627 ) ) ( not ( = ?auto_901620 ?auto_901628 ) ) ( not ( = ?auto_901621 ?auto_901622 ) ) ( not ( = ?auto_901621 ?auto_901623 ) ) ( not ( = ?auto_901621 ?auto_901624 ) ) ( not ( = ?auto_901621 ?auto_901625 ) ) ( not ( = ?auto_901621 ?auto_901626 ) ) ( not ( = ?auto_901621 ?auto_901627 ) ) ( not ( = ?auto_901621 ?auto_901628 ) ) ( not ( = ?auto_901622 ?auto_901623 ) ) ( not ( = ?auto_901622 ?auto_901624 ) ) ( not ( = ?auto_901622 ?auto_901625 ) ) ( not ( = ?auto_901622 ?auto_901626 ) ) ( not ( = ?auto_901622 ?auto_901627 ) ) ( not ( = ?auto_901622 ?auto_901628 ) ) ( not ( = ?auto_901623 ?auto_901624 ) ) ( not ( = ?auto_901623 ?auto_901625 ) ) ( not ( = ?auto_901623 ?auto_901626 ) ) ( not ( = ?auto_901623 ?auto_901627 ) ) ( not ( = ?auto_901623 ?auto_901628 ) ) ( not ( = ?auto_901624 ?auto_901625 ) ) ( not ( = ?auto_901624 ?auto_901626 ) ) ( not ( = ?auto_901624 ?auto_901627 ) ) ( not ( = ?auto_901624 ?auto_901628 ) ) ( not ( = ?auto_901625 ?auto_901626 ) ) ( not ( = ?auto_901625 ?auto_901627 ) ) ( not ( = ?auto_901625 ?auto_901628 ) ) ( not ( = ?auto_901626 ?auto_901627 ) ) ( not ( = ?auto_901626 ?auto_901628 ) ) ( not ( = ?auto_901627 ?auto_901628 ) ) ( ON ?auto_901626 ?auto_901627 ) ( CLEAR ?auto_901624 ) ( ON ?auto_901625 ?auto_901626 ) ( CLEAR ?auto_901625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_901614 ?auto_901615 ?auto_901616 ?auto_901617 ?auto_901618 ?auto_901619 ?auto_901620 ?auto_901621 ?auto_901622 ?auto_901623 ?auto_901624 ?auto_901625 )
      ( MAKE-14PILE ?auto_901614 ?auto_901615 ?auto_901616 ?auto_901617 ?auto_901618 ?auto_901619 ?auto_901620 ?auto_901621 ?auto_901622 ?auto_901623 ?auto_901624 ?auto_901625 ?auto_901626 ?auto_901627 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_901672 - BLOCK
      ?auto_901673 - BLOCK
      ?auto_901674 - BLOCK
      ?auto_901675 - BLOCK
      ?auto_901676 - BLOCK
      ?auto_901677 - BLOCK
      ?auto_901678 - BLOCK
      ?auto_901679 - BLOCK
      ?auto_901680 - BLOCK
      ?auto_901681 - BLOCK
      ?auto_901682 - BLOCK
      ?auto_901683 - BLOCK
      ?auto_901684 - BLOCK
      ?auto_901685 - BLOCK
    )
    :vars
    (
      ?auto_901686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901685 ?auto_901686 ) ( ON-TABLE ?auto_901672 ) ( ON ?auto_901673 ?auto_901672 ) ( ON ?auto_901674 ?auto_901673 ) ( ON ?auto_901675 ?auto_901674 ) ( ON ?auto_901676 ?auto_901675 ) ( ON ?auto_901677 ?auto_901676 ) ( ON ?auto_901678 ?auto_901677 ) ( ON ?auto_901679 ?auto_901678 ) ( ON ?auto_901680 ?auto_901679 ) ( ON ?auto_901681 ?auto_901680 ) ( not ( = ?auto_901672 ?auto_901673 ) ) ( not ( = ?auto_901672 ?auto_901674 ) ) ( not ( = ?auto_901672 ?auto_901675 ) ) ( not ( = ?auto_901672 ?auto_901676 ) ) ( not ( = ?auto_901672 ?auto_901677 ) ) ( not ( = ?auto_901672 ?auto_901678 ) ) ( not ( = ?auto_901672 ?auto_901679 ) ) ( not ( = ?auto_901672 ?auto_901680 ) ) ( not ( = ?auto_901672 ?auto_901681 ) ) ( not ( = ?auto_901672 ?auto_901682 ) ) ( not ( = ?auto_901672 ?auto_901683 ) ) ( not ( = ?auto_901672 ?auto_901684 ) ) ( not ( = ?auto_901672 ?auto_901685 ) ) ( not ( = ?auto_901672 ?auto_901686 ) ) ( not ( = ?auto_901673 ?auto_901674 ) ) ( not ( = ?auto_901673 ?auto_901675 ) ) ( not ( = ?auto_901673 ?auto_901676 ) ) ( not ( = ?auto_901673 ?auto_901677 ) ) ( not ( = ?auto_901673 ?auto_901678 ) ) ( not ( = ?auto_901673 ?auto_901679 ) ) ( not ( = ?auto_901673 ?auto_901680 ) ) ( not ( = ?auto_901673 ?auto_901681 ) ) ( not ( = ?auto_901673 ?auto_901682 ) ) ( not ( = ?auto_901673 ?auto_901683 ) ) ( not ( = ?auto_901673 ?auto_901684 ) ) ( not ( = ?auto_901673 ?auto_901685 ) ) ( not ( = ?auto_901673 ?auto_901686 ) ) ( not ( = ?auto_901674 ?auto_901675 ) ) ( not ( = ?auto_901674 ?auto_901676 ) ) ( not ( = ?auto_901674 ?auto_901677 ) ) ( not ( = ?auto_901674 ?auto_901678 ) ) ( not ( = ?auto_901674 ?auto_901679 ) ) ( not ( = ?auto_901674 ?auto_901680 ) ) ( not ( = ?auto_901674 ?auto_901681 ) ) ( not ( = ?auto_901674 ?auto_901682 ) ) ( not ( = ?auto_901674 ?auto_901683 ) ) ( not ( = ?auto_901674 ?auto_901684 ) ) ( not ( = ?auto_901674 ?auto_901685 ) ) ( not ( = ?auto_901674 ?auto_901686 ) ) ( not ( = ?auto_901675 ?auto_901676 ) ) ( not ( = ?auto_901675 ?auto_901677 ) ) ( not ( = ?auto_901675 ?auto_901678 ) ) ( not ( = ?auto_901675 ?auto_901679 ) ) ( not ( = ?auto_901675 ?auto_901680 ) ) ( not ( = ?auto_901675 ?auto_901681 ) ) ( not ( = ?auto_901675 ?auto_901682 ) ) ( not ( = ?auto_901675 ?auto_901683 ) ) ( not ( = ?auto_901675 ?auto_901684 ) ) ( not ( = ?auto_901675 ?auto_901685 ) ) ( not ( = ?auto_901675 ?auto_901686 ) ) ( not ( = ?auto_901676 ?auto_901677 ) ) ( not ( = ?auto_901676 ?auto_901678 ) ) ( not ( = ?auto_901676 ?auto_901679 ) ) ( not ( = ?auto_901676 ?auto_901680 ) ) ( not ( = ?auto_901676 ?auto_901681 ) ) ( not ( = ?auto_901676 ?auto_901682 ) ) ( not ( = ?auto_901676 ?auto_901683 ) ) ( not ( = ?auto_901676 ?auto_901684 ) ) ( not ( = ?auto_901676 ?auto_901685 ) ) ( not ( = ?auto_901676 ?auto_901686 ) ) ( not ( = ?auto_901677 ?auto_901678 ) ) ( not ( = ?auto_901677 ?auto_901679 ) ) ( not ( = ?auto_901677 ?auto_901680 ) ) ( not ( = ?auto_901677 ?auto_901681 ) ) ( not ( = ?auto_901677 ?auto_901682 ) ) ( not ( = ?auto_901677 ?auto_901683 ) ) ( not ( = ?auto_901677 ?auto_901684 ) ) ( not ( = ?auto_901677 ?auto_901685 ) ) ( not ( = ?auto_901677 ?auto_901686 ) ) ( not ( = ?auto_901678 ?auto_901679 ) ) ( not ( = ?auto_901678 ?auto_901680 ) ) ( not ( = ?auto_901678 ?auto_901681 ) ) ( not ( = ?auto_901678 ?auto_901682 ) ) ( not ( = ?auto_901678 ?auto_901683 ) ) ( not ( = ?auto_901678 ?auto_901684 ) ) ( not ( = ?auto_901678 ?auto_901685 ) ) ( not ( = ?auto_901678 ?auto_901686 ) ) ( not ( = ?auto_901679 ?auto_901680 ) ) ( not ( = ?auto_901679 ?auto_901681 ) ) ( not ( = ?auto_901679 ?auto_901682 ) ) ( not ( = ?auto_901679 ?auto_901683 ) ) ( not ( = ?auto_901679 ?auto_901684 ) ) ( not ( = ?auto_901679 ?auto_901685 ) ) ( not ( = ?auto_901679 ?auto_901686 ) ) ( not ( = ?auto_901680 ?auto_901681 ) ) ( not ( = ?auto_901680 ?auto_901682 ) ) ( not ( = ?auto_901680 ?auto_901683 ) ) ( not ( = ?auto_901680 ?auto_901684 ) ) ( not ( = ?auto_901680 ?auto_901685 ) ) ( not ( = ?auto_901680 ?auto_901686 ) ) ( not ( = ?auto_901681 ?auto_901682 ) ) ( not ( = ?auto_901681 ?auto_901683 ) ) ( not ( = ?auto_901681 ?auto_901684 ) ) ( not ( = ?auto_901681 ?auto_901685 ) ) ( not ( = ?auto_901681 ?auto_901686 ) ) ( not ( = ?auto_901682 ?auto_901683 ) ) ( not ( = ?auto_901682 ?auto_901684 ) ) ( not ( = ?auto_901682 ?auto_901685 ) ) ( not ( = ?auto_901682 ?auto_901686 ) ) ( not ( = ?auto_901683 ?auto_901684 ) ) ( not ( = ?auto_901683 ?auto_901685 ) ) ( not ( = ?auto_901683 ?auto_901686 ) ) ( not ( = ?auto_901684 ?auto_901685 ) ) ( not ( = ?auto_901684 ?auto_901686 ) ) ( not ( = ?auto_901685 ?auto_901686 ) ) ( ON ?auto_901684 ?auto_901685 ) ( ON ?auto_901683 ?auto_901684 ) ( CLEAR ?auto_901681 ) ( ON ?auto_901682 ?auto_901683 ) ( CLEAR ?auto_901682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_901672 ?auto_901673 ?auto_901674 ?auto_901675 ?auto_901676 ?auto_901677 ?auto_901678 ?auto_901679 ?auto_901680 ?auto_901681 ?auto_901682 )
      ( MAKE-14PILE ?auto_901672 ?auto_901673 ?auto_901674 ?auto_901675 ?auto_901676 ?auto_901677 ?auto_901678 ?auto_901679 ?auto_901680 ?auto_901681 ?auto_901682 ?auto_901683 ?auto_901684 ?auto_901685 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_901730 - BLOCK
      ?auto_901731 - BLOCK
      ?auto_901732 - BLOCK
      ?auto_901733 - BLOCK
      ?auto_901734 - BLOCK
      ?auto_901735 - BLOCK
      ?auto_901736 - BLOCK
      ?auto_901737 - BLOCK
      ?auto_901738 - BLOCK
      ?auto_901739 - BLOCK
      ?auto_901740 - BLOCK
      ?auto_901741 - BLOCK
      ?auto_901742 - BLOCK
      ?auto_901743 - BLOCK
    )
    :vars
    (
      ?auto_901744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901743 ?auto_901744 ) ( ON-TABLE ?auto_901730 ) ( ON ?auto_901731 ?auto_901730 ) ( ON ?auto_901732 ?auto_901731 ) ( ON ?auto_901733 ?auto_901732 ) ( ON ?auto_901734 ?auto_901733 ) ( ON ?auto_901735 ?auto_901734 ) ( ON ?auto_901736 ?auto_901735 ) ( ON ?auto_901737 ?auto_901736 ) ( ON ?auto_901738 ?auto_901737 ) ( not ( = ?auto_901730 ?auto_901731 ) ) ( not ( = ?auto_901730 ?auto_901732 ) ) ( not ( = ?auto_901730 ?auto_901733 ) ) ( not ( = ?auto_901730 ?auto_901734 ) ) ( not ( = ?auto_901730 ?auto_901735 ) ) ( not ( = ?auto_901730 ?auto_901736 ) ) ( not ( = ?auto_901730 ?auto_901737 ) ) ( not ( = ?auto_901730 ?auto_901738 ) ) ( not ( = ?auto_901730 ?auto_901739 ) ) ( not ( = ?auto_901730 ?auto_901740 ) ) ( not ( = ?auto_901730 ?auto_901741 ) ) ( not ( = ?auto_901730 ?auto_901742 ) ) ( not ( = ?auto_901730 ?auto_901743 ) ) ( not ( = ?auto_901730 ?auto_901744 ) ) ( not ( = ?auto_901731 ?auto_901732 ) ) ( not ( = ?auto_901731 ?auto_901733 ) ) ( not ( = ?auto_901731 ?auto_901734 ) ) ( not ( = ?auto_901731 ?auto_901735 ) ) ( not ( = ?auto_901731 ?auto_901736 ) ) ( not ( = ?auto_901731 ?auto_901737 ) ) ( not ( = ?auto_901731 ?auto_901738 ) ) ( not ( = ?auto_901731 ?auto_901739 ) ) ( not ( = ?auto_901731 ?auto_901740 ) ) ( not ( = ?auto_901731 ?auto_901741 ) ) ( not ( = ?auto_901731 ?auto_901742 ) ) ( not ( = ?auto_901731 ?auto_901743 ) ) ( not ( = ?auto_901731 ?auto_901744 ) ) ( not ( = ?auto_901732 ?auto_901733 ) ) ( not ( = ?auto_901732 ?auto_901734 ) ) ( not ( = ?auto_901732 ?auto_901735 ) ) ( not ( = ?auto_901732 ?auto_901736 ) ) ( not ( = ?auto_901732 ?auto_901737 ) ) ( not ( = ?auto_901732 ?auto_901738 ) ) ( not ( = ?auto_901732 ?auto_901739 ) ) ( not ( = ?auto_901732 ?auto_901740 ) ) ( not ( = ?auto_901732 ?auto_901741 ) ) ( not ( = ?auto_901732 ?auto_901742 ) ) ( not ( = ?auto_901732 ?auto_901743 ) ) ( not ( = ?auto_901732 ?auto_901744 ) ) ( not ( = ?auto_901733 ?auto_901734 ) ) ( not ( = ?auto_901733 ?auto_901735 ) ) ( not ( = ?auto_901733 ?auto_901736 ) ) ( not ( = ?auto_901733 ?auto_901737 ) ) ( not ( = ?auto_901733 ?auto_901738 ) ) ( not ( = ?auto_901733 ?auto_901739 ) ) ( not ( = ?auto_901733 ?auto_901740 ) ) ( not ( = ?auto_901733 ?auto_901741 ) ) ( not ( = ?auto_901733 ?auto_901742 ) ) ( not ( = ?auto_901733 ?auto_901743 ) ) ( not ( = ?auto_901733 ?auto_901744 ) ) ( not ( = ?auto_901734 ?auto_901735 ) ) ( not ( = ?auto_901734 ?auto_901736 ) ) ( not ( = ?auto_901734 ?auto_901737 ) ) ( not ( = ?auto_901734 ?auto_901738 ) ) ( not ( = ?auto_901734 ?auto_901739 ) ) ( not ( = ?auto_901734 ?auto_901740 ) ) ( not ( = ?auto_901734 ?auto_901741 ) ) ( not ( = ?auto_901734 ?auto_901742 ) ) ( not ( = ?auto_901734 ?auto_901743 ) ) ( not ( = ?auto_901734 ?auto_901744 ) ) ( not ( = ?auto_901735 ?auto_901736 ) ) ( not ( = ?auto_901735 ?auto_901737 ) ) ( not ( = ?auto_901735 ?auto_901738 ) ) ( not ( = ?auto_901735 ?auto_901739 ) ) ( not ( = ?auto_901735 ?auto_901740 ) ) ( not ( = ?auto_901735 ?auto_901741 ) ) ( not ( = ?auto_901735 ?auto_901742 ) ) ( not ( = ?auto_901735 ?auto_901743 ) ) ( not ( = ?auto_901735 ?auto_901744 ) ) ( not ( = ?auto_901736 ?auto_901737 ) ) ( not ( = ?auto_901736 ?auto_901738 ) ) ( not ( = ?auto_901736 ?auto_901739 ) ) ( not ( = ?auto_901736 ?auto_901740 ) ) ( not ( = ?auto_901736 ?auto_901741 ) ) ( not ( = ?auto_901736 ?auto_901742 ) ) ( not ( = ?auto_901736 ?auto_901743 ) ) ( not ( = ?auto_901736 ?auto_901744 ) ) ( not ( = ?auto_901737 ?auto_901738 ) ) ( not ( = ?auto_901737 ?auto_901739 ) ) ( not ( = ?auto_901737 ?auto_901740 ) ) ( not ( = ?auto_901737 ?auto_901741 ) ) ( not ( = ?auto_901737 ?auto_901742 ) ) ( not ( = ?auto_901737 ?auto_901743 ) ) ( not ( = ?auto_901737 ?auto_901744 ) ) ( not ( = ?auto_901738 ?auto_901739 ) ) ( not ( = ?auto_901738 ?auto_901740 ) ) ( not ( = ?auto_901738 ?auto_901741 ) ) ( not ( = ?auto_901738 ?auto_901742 ) ) ( not ( = ?auto_901738 ?auto_901743 ) ) ( not ( = ?auto_901738 ?auto_901744 ) ) ( not ( = ?auto_901739 ?auto_901740 ) ) ( not ( = ?auto_901739 ?auto_901741 ) ) ( not ( = ?auto_901739 ?auto_901742 ) ) ( not ( = ?auto_901739 ?auto_901743 ) ) ( not ( = ?auto_901739 ?auto_901744 ) ) ( not ( = ?auto_901740 ?auto_901741 ) ) ( not ( = ?auto_901740 ?auto_901742 ) ) ( not ( = ?auto_901740 ?auto_901743 ) ) ( not ( = ?auto_901740 ?auto_901744 ) ) ( not ( = ?auto_901741 ?auto_901742 ) ) ( not ( = ?auto_901741 ?auto_901743 ) ) ( not ( = ?auto_901741 ?auto_901744 ) ) ( not ( = ?auto_901742 ?auto_901743 ) ) ( not ( = ?auto_901742 ?auto_901744 ) ) ( not ( = ?auto_901743 ?auto_901744 ) ) ( ON ?auto_901742 ?auto_901743 ) ( ON ?auto_901741 ?auto_901742 ) ( ON ?auto_901740 ?auto_901741 ) ( CLEAR ?auto_901738 ) ( ON ?auto_901739 ?auto_901740 ) ( CLEAR ?auto_901739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_901730 ?auto_901731 ?auto_901732 ?auto_901733 ?auto_901734 ?auto_901735 ?auto_901736 ?auto_901737 ?auto_901738 ?auto_901739 )
      ( MAKE-14PILE ?auto_901730 ?auto_901731 ?auto_901732 ?auto_901733 ?auto_901734 ?auto_901735 ?auto_901736 ?auto_901737 ?auto_901738 ?auto_901739 ?auto_901740 ?auto_901741 ?auto_901742 ?auto_901743 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_901788 - BLOCK
      ?auto_901789 - BLOCK
      ?auto_901790 - BLOCK
      ?auto_901791 - BLOCK
      ?auto_901792 - BLOCK
      ?auto_901793 - BLOCK
      ?auto_901794 - BLOCK
      ?auto_901795 - BLOCK
      ?auto_901796 - BLOCK
      ?auto_901797 - BLOCK
      ?auto_901798 - BLOCK
      ?auto_901799 - BLOCK
      ?auto_901800 - BLOCK
      ?auto_901801 - BLOCK
    )
    :vars
    (
      ?auto_901802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901801 ?auto_901802 ) ( ON-TABLE ?auto_901788 ) ( ON ?auto_901789 ?auto_901788 ) ( ON ?auto_901790 ?auto_901789 ) ( ON ?auto_901791 ?auto_901790 ) ( ON ?auto_901792 ?auto_901791 ) ( ON ?auto_901793 ?auto_901792 ) ( ON ?auto_901794 ?auto_901793 ) ( ON ?auto_901795 ?auto_901794 ) ( not ( = ?auto_901788 ?auto_901789 ) ) ( not ( = ?auto_901788 ?auto_901790 ) ) ( not ( = ?auto_901788 ?auto_901791 ) ) ( not ( = ?auto_901788 ?auto_901792 ) ) ( not ( = ?auto_901788 ?auto_901793 ) ) ( not ( = ?auto_901788 ?auto_901794 ) ) ( not ( = ?auto_901788 ?auto_901795 ) ) ( not ( = ?auto_901788 ?auto_901796 ) ) ( not ( = ?auto_901788 ?auto_901797 ) ) ( not ( = ?auto_901788 ?auto_901798 ) ) ( not ( = ?auto_901788 ?auto_901799 ) ) ( not ( = ?auto_901788 ?auto_901800 ) ) ( not ( = ?auto_901788 ?auto_901801 ) ) ( not ( = ?auto_901788 ?auto_901802 ) ) ( not ( = ?auto_901789 ?auto_901790 ) ) ( not ( = ?auto_901789 ?auto_901791 ) ) ( not ( = ?auto_901789 ?auto_901792 ) ) ( not ( = ?auto_901789 ?auto_901793 ) ) ( not ( = ?auto_901789 ?auto_901794 ) ) ( not ( = ?auto_901789 ?auto_901795 ) ) ( not ( = ?auto_901789 ?auto_901796 ) ) ( not ( = ?auto_901789 ?auto_901797 ) ) ( not ( = ?auto_901789 ?auto_901798 ) ) ( not ( = ?auto_901789 ?auto_901799 ) ) ( not ( = ?auto_901789 ?auto_901800 ) ) ( not ( = ?auto_901789 ?auto_901801 ) ) ( not ( = ?auto_901789 ?auto_901802 ) ) ( not ( = ?auto_901790 ?auto_901791 ) ) ( not ( = ?auto_901790 ?auto_901792 ) ) ( not ( = ?auto_901790 ?auto_901793 ) ) ( not ( = ?auto_901790 ?auto_901794 ) ) ( not ( = ?auto_901790 ?auto_901795 ) ) ( not ( = ?auto_901790 ?auto_901796 ) ) ( not ( = ?auto_901790 ?auto_901797 ) ) ( not ( = ?auto_901790 ?auto_901798 ) ) ( not ( = ?auto_901790 ?auto_901799 ) ) ( not ( = ?auto_901790 ?auto_901800 ) ) ( not ( = ?auto_901790 ?auto_901801 ) ) ( not ( = ?auto_901790 ?auto_901802 ) ) ( not ( = ?auto_901791 ?auto_901792 ) ) ( not ( = ?auto_901791 ?auto_901793 ) ) ( not ( = ?auto_901791 ?auto_901794 ) ) ( not ( = ?auto_901791 ?auto_901795 ) ) ( not ( = ?auto_901791 ?auto_901796 ) ) ( not ( = ?auto_901791 ?auto_901797 ) ) ( not ( = ?auto_901791 ?auto_901798 ) ) ( not ( = ?auto_901791 ?auto_901799 ) ) ( not ( = ?auto_901791 ?auto_901800 ) ) ( not ( = ?auto_901791 ?auto_901801 ) ) ( not ( = ?auto_901791 ?auto_901802 ) ) ( not ( = ?auto_901792 ?auto_901793 ) ) ( not ( = ?auto_901792 ?auto_901794 ) ) ( not ( = ?auto_901792 ?auto_901795 ) ) ( not ( = ?auto_901792 ?auto_901796 ) ) ( not ( = ?auto_901792 ?auto_901797 ) ) ( not ( = ?auto_901792 ?auto_901798 ) ) ( not ( = ?auto_901792 ?auto_901799 ) ) ( not ( = ?auto_901792 ?auto_901800 ) ) ( not ( = ?auto_901792 ?auto_901801 ) ) ( not ( = ?auto_901792 ?auto_901802 ) ) ( not ( = ?auto_901793 ?auto_901794 ) ) ( not ( = ?auto_901793 ?auto_901795 ) ) ( not ( = ?auto_901793 ?auto_901796 ) ) ( not ( = ?auto_901793 ?auto_901797 ) ) ( not ( = ?auto_901793 ?auto_901798 ) ) ( not ( = ?auto_901793 ?auto_901799 ) ) ( not ( = ?auto_901793 ?auto_901800 ) ) ( not ( = ?auto_901793 ?auto_901801 ) ) ( not ( = ?auto_901793 ?auto_901802 ) ) ( not ( = ?auto_901794 ?auto_901795 ) ) ( not ( = ?auto_901794 ?auto_901796 ) ) ( not ( = ?auto_901794 ?auto_901797 ) ) ( not ( = ?auto_901794 ?auto_901798 ) ) ( not ( = ?auto_901794 ?auto_901799 ) ) ( not ( = ?auto_901794 ?auto_901800 ) ) ( not ( = ?auto_901794 ?auto_901801 ) ) ( not ( = ?auto_901794 ?auto_901802 ) ) ( not ( = ?auto_901795 ?auto_901796 ) ) ( not ( = ?auto_901795 ?auto_901797 ) ) ( not ( = ?auto_901795 ?auto_901798 ) ) ( not ( = ?auto_901795 ?auto_901799 ) ) ( not ( = ?auto_901795 ?auto_901800 ) ) ( not ( = ?auto_901795 ?auto_901801 ) ) ( not ( = ?auto_901795 ?auto_901802 ) ) ( not ( = ?auto_901796 ?auto_901797 ) ) ( not ( = ?auto_901796 ?auto_901798 ) ) ( not ( = ?auto_901796 ?auto_901799 ) ) ( not ( = ?auto_901796 ?auto_901800 ) ) ( not ( = ?auto_901796 ?auto_901801 ) ) ( not ( = ?auto_901796 ?auto_901802 ) ) ( not ( = ?auto_901797 ?auto_901798 ) ) ( not ( = ?auto_901797 ?auto_901799 ) ) ( not ( = ?auto_901797 ?auto_901800 ) ) ( not ( = ?auto_901797 ?auto_901801 ) ) ( not ( = ?auto_901797 ?auto_901802 ) ) ( not ( = ?auto_901798 ?auto_901799 ) ) ( not ( = ?auto_901798 ?auto_901800 ) ) ( not ( = ?auto_901798 ?auto_901801 ) ) ( not ( = ?auto_901798 ?auto_901802 ) ) ( not ( = ?auto_901799 ?auto_901800 ) ) ( not ( = ?auto_901799 ?auto_901801 ) ) ( not ( = ?auto_901799 ?auto_901802 ) ) ( not ( = ?auto_901800 ?auto_901801 ) ) ( not ( = ?auto_901800 ?auto_901802 ) ) ( not ( = ?auto_901801 ?auto_901802 ) ) ( ON ?auto_901800 ?auto_901801 ) ( ON ?auto_901799 ?auto_901800 ) ( ON ?auto_901798 ?auto_901799 ) ( ON ?auto_901797 ?auto_901798 ) ( CLEAR ?auto_901795 ) ( ON ?auto_901796 ?auto_901797 ) ( CLEAR ?auto_901796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_901788 ?auto_901789 ?auto_901790 ?auto_901791 ?auto_901792 ?auto_901793 ?auto_901794 ?auto_901795 ?auto_901796 )
      ( MAKE-14PILE ?auto_901788 ?auto_901789 ?auto_901790 ?auto_901791 ?auto_901792 ?auto_901793 ?auto_901794 ?auto_901795 ?auto_901796 ?auto_901797 ?auto_901798 ?auto_901799 ?auto_901800 ?auto_901801 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_901846 - BLOCK
      ?auto_901847 - BLOCK
      ?auto_901848 - BLOCK
      ?auto_901849 - BLOCK
      ?auto_901850 - BLOCK
      ?auto_901851 - BLOCK
      ?auto_901852 - BLOCK
      ?auto_901853 - BLOCK
      ?auto_901854 - BLOCK
      ?auto_901855 - BLOCK
      ?auto_901856 - BLOCK
      ?auto_901857 - BLOCK
      ?auto_901858 - BLOCK
      ?auto_901859 - BLOCK
    )
    :vars
    (
      ?auto_901860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901859 ?auto_901860 ) ( ON-TABLE ?auto_901846 ) ( ON ?auto_901847 ?auto_901846 ) ( ON ?auto_901848 ?auto_901847 ) ( ON ?auto_901849 ?auto_901848 ) ( ON ?auto_901850 ?auto_901849 ) ( ON ?auto_901851 ?auto_901850 ) ( ON ?auto_901852 ?auto_901851 ) ( not ( = ?auto_901846 ?auto_901847 ) ) ( not ( = ?auto_901846 ?auto_901848 ) ) ( not ( = ?auto_901846 ?auto_901849 ) ) ( not ( = ?auto_901846 ?auto_901850 ) ) ( not ( = ?auto_901846 ?auto_901851 ) ) ( not ( = ?auto_901846 ?auto_901852 ) ) ( not ( = ?auto_901846 ?auto_901853 ) ) ( not ( = ?auto_901846 ?auto_901854 ) ) ( not ( = ?auto_901846 ?auto_901855 ) ) ( not ( = ?auto_901846 ?auto_901856 ) ) ( not ( = ?auto_901846 ?auto_901857 ) ) ( not ( = ?auto_901846 ?auto_901858 ) ) ( not ( = ?auto_901846 ?auto_901859 ) ) ( not ( = ?auto_901846 ?auto_901860 ) ) ( not ( = ?auto_901847 ?auto_901848 ) ) ( not ( = ?auto_901847 ?auto_901849 ) ) ( not ( = ?auto_901847 ?auto_901850 ) ) ( not ( = ?auto_901847 ?auto_901851 ) ) ( not ( = ?auto_901847 ?auto_901852 ) ) ( not ( = ?auto_901847 ?auto_901853 ) ) ( not ( = ?auto_901847 ?auto_901854 ) ) ( not ( = ?auto_901847 ?auto_901855 ) ) ( not ( = ?auto_901847 ?auto_901856 ) ) ( not ( = ?auto_901847 ?auto_901857 ) ) ( not ( = ?auto_901847 ?auto_901858 ) ) ( not ( = ?auto_901847 ?auto_901859 ) ) ( not ( = ?auto_901847 ?auto_901860 ) ) ( not ( = ?auto_901848 ?auto_901849 ) ) ( not ( = ?auto_901848 ?auto_901850 ) ) ( not ( = ?auto_901848 ?auto_901851 ) ) ( not ( = ?auto_901848 ?auto_901852 ) ) ( not ( = ?auto_901848 ?auto_901853 ) ) ( not ( = ?auto_901848 ?auto_901854 ) ) ( not ( = ?auto_901848 ?auto_901855 ) ) ( not ( = ?auto_901848 ?auto_901856 ) ) ( not ( = ?auto_901848 ?auto_901857 ) ) ( not ( = ?auto_901848 ?auto_901858 ) ) ( not ( = ?auto_901848 ?auto_901859 ) ) ( not ( = ?auto_901848 ?auto_901860 ) ) ( not ( = ?auto_901849 ?auto_901850 ) ) ( not ( = ?auto_901849 ?auto_901851 ) ) ( not ( = ?auto_901849 ?auto_901852 ) ) ( not ( = ?auto_901849 ?auto_901853 ) ) ( not ( = ?auto_901849 ?auto_901854 ) ) ( not ( = ?auto_901849 ?auto_901855 ) ) ( not ( = ?auto_901849 ?auto_901856 ) ) ( not ( = ?auto_901849 ?auto_901857 ) ) ( not ( = ?auto_901849 ?auto_901858 ) ) ( not ( = ?auto_901849 ?auto_901859 ) ) ( not ( = ?auto_901849 ?auto_901860 ) ) ( not ( = ?auto_901850 ?auto_901851 ) ) ( not ( = ?auto_901850 ?auto_901852 ) ) ( not ( = ?auto_901850 ?auto_901853 ) ) ( not ( = ?auto_901850 ?auto_901854 ) ) ( not ( = ?auto_901850 ?auto_901855 ) ) ( not ( = ?auto_901850 ?auto_901856 ) ) ( not ( = ?auto_901850 ?auto_901857 ) ) ( not ( = ?auto_901850 ?auto_901858 ) ) ( not ( = ?auto_901850 ?auto_901859 ) ) ( not ( = ?auto_901850 ?auto_901860 ) ) ( not ( = ?auto_901851 ?auto_901852 ) ) ( not ( = ?auto_901851 ?auto_901853 ) ) ( not ( = ?auto_901851 ?auto_901854 ) ) ( not ( = ?auto_901851 ?auto_901855 ) ) ( not ( = ?auto_901851 ?auto_901856 ) ) ( not ( = ?auto_901851 ?auto_901857 ) ) ( not ( = ?auto_901851 ?auto_901858 ) ) ( not ( = ?auto_901851 ?auto_901859 ) ) ( not ( = ?auto_901851 ?auto_901860 ) ) ( not ( = ?auto_901852 ?auto_901853 ) ) ( not ( = ?auto_901852 ?auto_901854 ) ) ( not ( = ?auto_901852 ?auto_901855 ) ) ( not ( = ?auto_901852 ?auto_901856 ) ) ( not ( = ?auto_901852 ?auto_901857 ) ) ( not ( = ?auto_901852 ?auto_901858 ) ) ( not ( = ?auto_901852 ?auto_901859 ) ) ( not ( = ?auto_901852 ?auto_901860 ) ) ( not ( = ?auto_901853 ?auto_901854 ) ) ( not ( = ?auto_901853 ?auto_901855 ) ) ( not ( = ?auto_901853 ?auto_901856 ) ) ( not ( = ?auto_901853 ?auto_901857 ) ) ( not ( = ?auto_901853 ?auto_901858 ) ) ( not ( = ?auto_901853 ?auto_901859 ) ) ( not ( = ?auto_901853 ?auto_901860 ) ) ( not ( = ?auto_901854 ?auto_901855 ) ) ( not ( = ?auto_901854 ?auto_901856 ) ) ( not ( = ?auto_901854 ?auto_901857 ) ) ( not ( = ?auto_901854 ?auto_901858 ) ) ( not ( = ?auto_901854 ?auto_901859 ) ) ( not ( = ?auto_901854 ?auto_901860 ) ) ( not ( = ?auto_901855 ?auto_901856 ) ) ( not ( = ?auto_901855 ?auto_901857 ) ) ( not ( = ?auto_901855 ?auto_901858 ) ) ( not ( = ?auto_901855 ?auto_901859 ) ) ( not ( = ?auto_901855 ?auto_901860 ) ) ( not ( = ?auto_901856 ?auto_901857 ) ) ( not ( = ?auto_901856 ?auto_901858 ) ) ( not ( = ?auto_901856 ?auto_901859 ) ) ( not ( = ?auto_901856 ?auto_901860 ) ) ( not ( = ?auto_901857 ?auto_901858 ) ) ( not ( = ?auto_901857 ?auto_901859 ) ) ( not ( = ?auto_901857 ?auto_901860 ) ) ( not ( = ?auto_901858 ?auto_901859 ) ) ( not ( = ?auto_901858 ?auto_901860 ) ) ( not ( = ?auto_901859 ?auto_901860 ) ) ( ON ?auto_901858 ?auto_901859 ) ( ON ?auto_901857 ?auto_901858 ) ( ON ?auto_901856 ?auto_901857 ) ( ON ?auto_901855 ?auto_901856 ) ( ON ?auto_901854 ?auto_901855 ) ( CLEAR ?auto_901852 ) ( ON ?auto_901853 ?auto_901854 ) ( CLEAR ?auto_901853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_901846 ?auto_901847 ?auto_901848 ?auto_901849 ?auto_901850 ?auto_901851 ?auto_901852 ?auto_901853 )
      ( MAKE-14PILE ?auto_901846 ?auto_901847 ?auto_901848 ?auto_901849 ?auto_901850 ?auto_901851 ?auto_901852 ?auto_901853 ?auto_901854 ?auto_901855 ?auto_901856 ?auto_901857 ?auto_901858 ?auto_901859 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_901904 - BLOCK
      ?auto_901905 - BLOCK
      ?auto_901906 - BLOCK
      ?auto_901907 - BLOCK
      ?auto_901908 - BLOCK
      ?auto_901909 - BLOCK
      ?auto_901910 - BLOCK
      ?auto_901911 - BLOCK
      ?auto_901912 - BLOCK
      ?auto_901913 - BLOCK
      ?auto_901914 - BLOCK
      ?auto_901915 - BLOCK
      ?auto_901916 - BLOCK
      ?auto_901917 - BLOCK
    )
    :vars
    (
      ?auto_901918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901917 ?auto_901918 ) ( ON-TABLE ?auto_901904 ) ( ON ?auto_901905 ?auto_901904 ) ( ON ?auto_901906 ?auto_901905 ) ( ON ?auto_901907 ?auto_901906 ) ( ON ?auto_901908 ?auto_901907 ) ( ON ?auto_901909 ?auto_901908 ) ( not ( = ?auto_901904 ?auto_901905 ) ) ( not ( = ?auto_901904 ?auto_901906 ) ) ( not ( = ?auto_901904 ?auto_901907 ) ) ( not ( = ?auto_901904 ?auto_901908 ) ) ( not ( = ?auto_901904 ?auto_901909 ) ) ( not ( = ?auto_901904 ?auto_901910 ) ) ( not ( = ?auto_901904 ?auto_901911 ) ) ( not ( = ?auto_901904 ?auto_901912 ) ) ( not ( = ?auto_901904 ?auto_901913 ) ) ( not ( = ?auto_901904 ?auto_901914 ) ) ( not ( = ?auto_901904 ?auto_901915 ) ) ( not ( = ?auto_901904 ?auto_901916 ) ) ( not ( = ?auto_901904 ?auto_901917 ) ) ( not ( = ?auto_901904 ?auto_901918 ) ) ( not ( = ?auto_901905 ?auto_901906 ) ) ( not ( = ?auto_901905 ?auto_901907 ) ) ( not ( = ?auto_901905 ?auto_901908 ) ) ( not ( = ?auto_901905 ?auto_901909 ) ) ( not ( = ?auto_901905 ?auto_901910 ) ) ( not ( = ?auto_901905 ?auto_901911 ) ) ( not ( = ?auto_901905 ?auto_901912 ) ) ( not ( = ?auto_901905 ?auto_901913 ) ) ( not ( = ?auto_901905 ?auto_901914 ) ) ( not ( = ?auto_901905 ?auto_901915 ) ) ( not ( = ?auto_901905 ?auto_901916 ) ) ( not ( = ?auto_901905 ?auto_901917 ) ) ( not ( = ?auto_901905 ?auto_901918 ) ) ( not ( = ?auto_901906 ?auto_901907 ) ) ( not ( = ?auto_901906 ?auto_901908 ) ) ( not ( = ?auto_901906 ?auto_901909 ) ) ( not ( = ?auto_901906 ?auto_901910 ) ) ( not ( = ?auto_901906 ?auto_901911 ) ) ( not ( = ?auto_901906 ?auto_901912 ) ) ( not ( = ?auto_901906 ?auto_901913 ) ) ( not ( = ?auto_901906 ?auto_901914 ) ) ( not ( = ?auto_901906 ?auto_901915 ) ) ( not ( = ?auto_901906 ?auto_901916 ) ) ( not ( = ?auto_901906 ?auto_901917 ) ) ( not ( = ?auto_901906 ?auto_901918 ) ) ( not ( = ?auto_901907 ?auto_901908 ) ) ( not ( = ?auto_901907 ?auto_901909 ) ) ( not ( = ?auto_901907 ?auto_901910 ) ) ( not ( = ?auto_901907 ?auto_901911 ) ) ( not ( = ?auto_901907 ?auto_901912 ) ) ( not ( = ?auto_901907 ?auto_901913 ) ) ( not ( = ?auto_901907 ?auto_901914 ) ) ( not ( = ?auto_901907 ?auto_901915 ) ) ( not ( = ?auto_901907 ?auto_901916 ) ) ( not ( = ?auto_901907 ?auto_901917 ) ) ( not ( = ?auto_901907 ?auto_901918 ) ) ( not ( = ?auto_901908 ?auto_901909 ) ) ( not ( = ?auto_901908 ?auto_901910 ) ) ( not ( = ?auto_901908 ?auto_901911 ) ) ( not ( = ?auto_901908 ?auto_901912 ) ) ( not ( = ?auto_901908 ?auto_901913 ) ) ( not ( = ?auto_901908 ?auto_901914 ) ) ( not ( = ?auto_901908 ?auto_901915 ) ) ( not ( = ?auto_901908 ?auto_901916 ) ) ( not ( = ?auto_901908 ?auto_901917 ) ) ( not ( = ?auto_901908 ?auto_901918 ) ) ( not ( = ?auto_901909 ?auto_901910 ) ) ( not ( = ?auto_901909 ?auto_901911 ) ) ( not ( = ?auto_901909 ?auto_901912 ) ) ( not ( = ?auto_901909 ?auto_901913 ) ) ( not ( = ?auto_901909 ?auto_901914 ) ) ( not ( = ?auto_901909 ?auto_901915 ) ) ( not ( = ?auto_901909 ?auto_901916 ) ) ( not ( = ?auto_901909 ?auto_901917 ) ) ( not ( = ?auto_901909 ?auto_901918 ) ) ( not ( = ?auto_901910 ?auto_901911 ) ) ( not ( = ?auto_901910 ?auto_901912 ) ) ( not ( = ?auto_901910 ?auto_901913 ) ) ( not ( = ?auto_901910 ?auto_901914 ) ) ( not ( = ?auto_901910 ?auto_901915 ) ) ( not ( = ?auto_901910 ?auto_901916 ) ) ( not ( = ?auto_901910 ?auto_901917 ) ) ( not ( = ?auto_901910 ?auto_901918 ) ) ( not ( = ?auto_901911 ?auto_901912 ) ) ( not ( = ?auto_901911 ?auto_901913 ) ) ( not ( = ?auto_901911 ?auto_901914 ) ) ( not ( = ?auto_901911 ?auto_901915 ) ) ( not ( = ?auto_901911 ?auto_901916 ) ) ( not ( = ?auto_901911 ?auto_901917 ) ) ( not ( = ?auto_901911 ?auto_901918 ) ) ( not ( = ?auto_901912 ?auto_901913 ) ) ( not ( = ?auto_901912 ?auto_901914 ) ) ( not ( = ?auto_901912 ?auto_901915 ) ) ( not ( = ?auto_901912 ?auto_901916 ) ) ( not ( = ?auto_901912 ?auto_901917 ) ) ( not ( = ?auto_901912 ?auto_901918 ) ) ( not ( = ?auto_901913 ?auto_901914 ) ) ( not ( = ?auto_901913 ?auto_901915 ) ) ( not ( = ?auto_901913 ?auto_901916 ) ) ( not ( = ?auto_901913 ?auto_901917 ) ) ( not ( = ?auto_901913 ?auto_901918 ) ) ( not ( = ?auto_901914 ?auto_901915 ) ) ( not ( = ?auto_901914 ?auto_901916 ) ) ( not ( = ?auto_901914 ?auto_901917 ) ) ( not ( = ?auto_901914 ?auto_901918 ) ) ( not ( = ?auto_901915 ?auto_901916 ) ) ( not ( = ?auto_901915 ?auto_901917 ) ) ( not ( = ?auto_901915 ?auto_901918 ) ) ( not ( = ?auto_901916 ?auto_901917 ) ) ( not ( = ?auto_901916 ?auto_901918 ) ) ( not ( = ?auto_901917 ?auto_901918 ) ) ( ON ?auto_901916 ?auto_901917 ) ( ON ?auto_901915 ?auto_901916 ) ( ON ?auto_901914 ?auto_901915 ) ( ON ?auto_901913 ?auto_901914 ) ( ON ?auto_901912 ?auto_901913 ) ( ON ?auto_901911 ?auto_901912 ) ( CLEAR ?auto_901909 ) ( ON ?auto_901910 ?auto_901911 ) ( CLEAR ?auto_901910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_901904 ?auto_901905 ?auto_901906 ?auto_901907 ?auto_901908 ?auto_901909 ?auto_901910 )
      ( MAKE-14PILE ?auto_901904 ?auto_901905 ?auto_901906 ?auto_901907 ?auto_901908 ?auto_901909 ?auto_901910 ?auto_901911 ?auto_901912 ?auto_901913 ?auto_901914 ?auto_901915 ?auto_901916 ?auto_901917 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_901962 - BLOCK
      ?auto_901963 - BLOCK
      ?auto_901964 - BLOCK
      ?auto_901965 - BLOCK
      ?auto_901966 - BLOCK
      ?auto_901967 - BLOCK
      ?auto_901968 - BLOCK
      ?auto_901969 - BLOCK
      ?auto_901970 - BLOCK
      ?auto_901971 - BLOCK
      ?auto_901972 - BLOCK
      ?auto_901973 - BLOCK
      ?auto_901974 - BLOCK
      ?auto_901975 - BLOCK
    )
    :vars
    (
      ?auto_901976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_901975 ?auto_901976 ) ( ON-TABLE ?auto_901962 ) ( ON ?auto_901963 ?auto_901962 ) ( ON ?auto_901964 ?auto_901963 ) ( ON ?auto_901965 ?auto_901964 ) ( ON ?auto_901966 ?auto_901965 ) ( not ( = ?auto_901962 ?auto_901963 ) ) ( not ( = ?auto_901962 ?auto_901964 ) ) ( not ( = ?auto_901962 ?auto_901965 ) ) ( not ( = ?auto_901962 ?auto_901966 ) ) ( not ( = ?auto_901962 ?auto_901967 ) ) ( not ( = ?auto_901962 ?auto_901968 ) ) ( not ( = ?auto_901962 ?auto_901969 ) ) ( not ( = ?auto_901962 ?auto_901970 ) ) ( not ( = ?auto_901962 ?auto_901971 ) ) ( not ( = ?auto_901962 ?auto_901972 ) ) ( not ( = ?auto_901962 ?auto_901973 ) ) ( not ( = ?auto_901962 ?auto_901974 ) ) ( not ( = ?auto_901962 ?auto_901975 ) ) ( not ( = ?auto_901962 ?auto_901976 ) ) ( not ( = ?auto_901963 ?auto_901964 ) ) ( not ( = ?auto_901963 ?auto_901965 ) ) ( not ( = ?auto_901963 ?auto_901966 ) ) ( not ( = ?auto_901963 ?auto_901967 ) ) ( not ( = ?auto_901963 ?auto_901968 ) ) ( not ( = ?auto_901963 ?auto_901969 ) ) ( not ( = ?auto_901963 ?auto_901970 ) ) ( not ( = ?auto_901963 ?auto_901971 ) ) ( not ( = ?auto_901963 ?auto_901972 ) ) ( not ( = ?auto_901963 ?auto_901973 ) ) ( not ( = ?auto_901963 ?auto_901974 ) ) ( not ( = ?auto_901963 ?auto_901975 ) ) ( not ( = ?auto_901963 ?auto_901976 ) ) ( not ( = ?auto_901964 ?auto_901965 ) ) ( not ( = ?auto_901964 ?auto_901966 ) ) ( not ( = ?auto_901964 ?auto_901967 ) ) ( not ( = ?auto_901964 ?auto_901968 ) ) ( not ( = ?auto_901964 ?auto_901969 ) ) ( not ( = ?auto_901964 ?auto_901970 ) ) ( not ( = ?auto_901964 ?auto_901971 ) ) ( not ( = ?auto_901964 ?auto_901972 ) ) ( not ( = ?auto_901964 ?auto_901973 ) ) ( not ( = ?auto_901964 ?auto_901974 ) ) ( not ( = ?auto_901964 ?auto_901975 ) ) ( not ( = ?auto_901964 ?auto_901976 ) ) ( not ( = ?auto_901965 ?auto_901966 ) ) ( not ( = ?auto_901965 ?auto_901967 ) ) ( not ( = ?auto_901965 ?auto_901968 ) ) ( not ( = ?auto_901965 ?auto_901969 ) ) ( not ( = ?auto_901965 ?auto_901970 ) ) ( not ( = ?auto_901965 ?auto_901971 ) ) ( not ( = ?auto_901965 ?auto_901972 ) ) ( not ( = ?auto_901965 ?auto_901973 ) ) ( not ( = ?auto_901965 ?auto_901974 ) ) ( not ( = ?auto_901965 ?auto_901975 ) ) ( not ( = ?auto_901965 ?auto_901976 ) ) ( not ( = ?auto_901966 ?auto_901967 ) ) ( not ( = ?auto_901966 ?auto_901968 ) ) ( not ( = ?auto_901966 ?auto_901969 ) ) ( not ( = ?auto_901966 ?auto_901970 ) ) ( not ( = ?auto_901966 ?auto_901971 ) ) ( not ( = ?auto_901966 ?auto_901972 ) ) ( not ( = ?auto_901966 ?auto_901973 ) ) ( not ( = ?auto_901966 ?auto_901974 ) ) ( not ( = ?auto_901966 ?auto_901975 ) ) ( not ( = ?auto_901966 ?auto_901976 ) ) ( not ( = ?auto_901967 ?auto_901968 ) ) ( not ( = ?auto_901967 ?auto_901969 ) ) ( not ( = ?auto_901967 ?auto_901970 ) ) ( not ( = ?auto_901967 ?auto_901971 ) ) ( not ( = ?auto_901967 ?auto_901972 ) ) ( not ( = ?auto_901967 ?auto_901973 ) ) ( not ( = ?auto_901967 ?auto_901974 ) ) ( not ( = ?auto_901967 ?auto_901975 ) ) ( not ( = ?auto_901967 ?auto_901976 ) ) ( not ( = ?auto_901968 ?auto_901969 ) ) ( not ( = ?auto_901968 ?auto_901970 ) ) ( not ( = ?auto_901968 ?auto_901971 ) ) ( not ( = ?auto_901968 ?auto_901972 ) ) ( not ( = ?auto_901968 ?auto_901973 ) ) ( not ( = ?auto_901968 ?auto_901974 ) ) ( not ( = ?auto_901968 ?auto_901975 ) ) ( not ( = ?auto_901968 ?auto_901976 ) ) ( not ( = ?auto_901969 ?auto_901970 ) ) ( not ( = ?auto_901969 ?auto_901971 ) ) ( not ( = ?auto_901969 ?auto_901972 ) ) ( not ( = ?auto_901969 ?auto_901973 ) ) ( not ( = ?auto_901969 ?auto_901974 ) ) ( not ( = ?auto_901969 ?auto_901975 ) ) ( not ( = ?auto_901969 ?auto_901976 ) ) ( not ( = ?auto_901970 ?auto_901971 ) ) ( not ( = ?auto_901970 ?auto_901972 ) ) ( not ( = ?auto_901970 ?auto_901973 ) ) ( not ( = ?auto_901970 ?auto_901974 ) ) ( not ( = ?auto_901970 ?auto_901975 ) ) ( not ( = ?auto_901970 ?auto_901976 ) ) ( not ( = ?auto_901971 ?auto_901972 ) ) ( not ( = ?auto_901971 ?auto_901973 ) ) ( not ( = ?auto_901971 ?auto_901974 ) ) ( not ( = ?auto_901971 ?auto_901975 ) ) ( not ( = ?auto_901971 ?auto_901976 ) ) ( not ( = ?auto_901972 ?auto_901973 ) ) ( not ( = ?auto_901972 ?auto_901974 ) ) ( not ( = ?auto_901972 ?auto_901975 ) ) ( not ( = ?auto_901972 ?auto_901976 ) ) ( not ( = ?auto_901973 ?auto_901974 ) ) ( not ( = ?auto_901973 ?auto_901975 ) ) ( not ( = ?auto_901973 ?auto_901976 ) ) ( not ( = ?auto_901974 ?auto_901975 ) ) ( not ( = ?auto_901974 ?auto_901976 ) ) ( not ( = ?auto_901975 ?auto_901976 ) ) ( ON ?auto_901974 ?auto_901975 ) ( ON ?auto_901973 ?auto_901974 ) ( ON ?auto_901972 ?auto_901973 ) ( ON ?auto_901971 ?auto_901972 ) ( ON ?auto_901970 ?auto_901971 ) ( ON ?auto_901969 ?auto_901970 ) ( ON ?auto_901968 ?auto_901969 ) ( CLEAR ?auto_901966 ) ( ON ?auto_901967 ?auto_901968 ) ( CLEAR ?auto_901967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_901962 ?auto_901963 ?auto_901964 ?auto_901965 ?auto_901966 ?auto_901967 )
      ( MAKE-14PILE ?auto_901962 ?auto_901963 ?auto_901964 ?auto_901965 ?auto_901966 ?auto_901967 ?auto_901968 ?auto_901969 ?auto_901970 ?auto_901971 ?auto_901972 ?auto_901973 ?auto_901974 ?auto_901975 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_902020 - BLOCK
      ?auto_902021 - BLOCK
      ?auto_902022 - BLOCK
      ?auto_902023 - BLOCK
      ?auto_902024 - BLOCK
      ?auto_902025 - BLOCK
      ?auto_902026 - BLOCK
      ?auto_902027 - BLOCK
      ?auto_902028 - BLOCK
      ?auto_902029 - BLOCK
      ?auto_902030 - BLOCK
      ?auto_902031 - BLOCK
      ?auto_902032 - BLOCK
      ?auto_902033 - BLOCK
    )
    :vars
    (
      ?auto_902034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902033 ?auto_902034 ) ( ON-TABLE ?auto_902020 ) ( ON ?auto_902021 ?auto_902020 ) ( ON ?auto_902022 ?auto_902021 ) ( ON ?auto_902023 ?auto_902022 ) ( not ( = ?auto_902020 ?auto_902021 ) ) ( not ( = ?auto_902020 ?auto_902022 ) ) ( not ( = ?auto_902020 ?auto_902023 ) ) ( not ( = ?auto_902020 ?auto_902024 ) ) ( not ( = ?auto_902020 ?auto_902025 ) ) ( not ( = ?auto_902020 ?auto_902026 ) ) ( not ( = ?auto_902020 ?auto_902027 ) ) ( not ( = ?auto_902020 ?auto_902028 ) ) ( not ( = ?auto_902020 ?auto_902029 ) ) ( not ( = ?auto_902020 ?auto_902030 ) ) ( not ( = ?auto_902020 ?auto_902031 ) ) ( not ( = ?auto_902020 ?auto_902032 ) ) ( not ( = ?auto_902020 ?auto_902033 ) ) ( not ( = ?auto_902020 ?auto_902034 ) ) ( not ( = ?auto_902021 ?auto_902022 ) ) ( not ( = ?auto_902021 ?auto_902023 ) ) ( not ( = ?auto_902021 ?auto_902024 ) ) ( not ( = ?auto_902021 ?auto_902025 ) ) ( not ( = ?auto_902021 ?auto_902026 ) ) ( not ( = ?auto_902021 ?auto_902027 ) ) ( not ( = ?auto_902021 ?auto_902028 ) ) ( not ( = ?auto_902021 ?auto_902029 ) ) ( not ( = ?auto_902021 ?auto_902030 ) ) ( not ( = ?auto_902021 ?auto_902031 ) ) ( not ( = ?auto_902021 ?auto_902032 ) ) ( not ( = ?auto_902021 ?auto_902033 ) ) ( not ( = ?auto_902021 ?auto_902034 ) ) ( not ( = ?auto_902022 ?auto_902023 ) ) ( not ( = ?auto_902022 ?auto_902024 ) ) ( not ( = ?auto_902022 ?auto_902025 ) ) ( not ( = ?auto_902022 ?auto_902026 ) ) ( not ( = ?auto_902022 ?auto_902027 ) ) ( not ( = ?auto_902022 ?auto_902028 ) ) ( not ( = ?auto_902022 ?auto_902029 ) ) ( not ( = ?auto_902022 ?auto_902030 ) ) ( not ( = ?auto_902022 ?auto_902031 ) ) ( not ( = ?auto_902022 ?auto_902032 ) ) ( not ( = ?auto_902022 ?auto_902033 ) ) ( not ( = ?auto_902022 ?auto_902034 ) ) ( not ( = ?auto_902023 ?auto_902024 ) ) ( not ( = ?auto_902023 ?auto_902025 ) ) ( not ( = ?auto_902023 ?auto_902026 ) ) ( not ( = ?auto_902023 ?auto_902027 ) ) ( not ( = ?auto_902023 ?auto_902028 ) ) ( not ( = ?auto_902023 ?auto_902029 ) ) ( not ( = ?auto_902023 ?auto_902030 ) ) ( not ( = ?auto_902023 ?auto_902031 ) ) ( not ( = ?auto_902023 ?auto_902032 ) ) ( not ( = ?auto_902023 ?auto_902033 ) ) ( not ( = ?auto_902023 ?auto_902034 ) ) ( not ( = ?auto_902024 ?auto_902025 ) ) ( not ( = ?auto_902024 ?auto_902026 ) ) ( not ( = ?auto_902024 ?auto_902027 ) ) ( not ( = ?auto_902024 ?auto_902028 ) ) ( not ( = ?auto_902024 ?auto_902029 ) ) ( not ( = ?auto_902024 ?auto_902030 ) ) ( not ( = ?auto_902024 ?auto_902031 ) ) ( not ( = ?auto_902024 ?auto_902032 ) ) ( not ( = ?auto_902024 ?auto_902033 ) ) ( not ( = ?auto_902024 ?auto_902034 ) ) ( not ( = ?auto_902025 ?auto_902026 ) ) ( not ( = ?auto_902025 ?auto_902027 ) ) ( not ( = ?auto_902025 ?auto_902028 ) ) ( not ( = ?auto_902025 ?auto_902029 ) ) ( not ( = ?auto_902025 ?auto_902030 ) ) ( not ( = ?auto_902025 ?auto_902031 ) ) ( not ( = ?auto_902025 ?auto_902032 ) ) ( not ( = ?auto_902025 ?auto_902033 ) ) ( not ( = ?auto_902025 ?auto_902034 ) ) ( not ( = ?auto_902026 ?auto_902027 ) ) ( not ( = ?auto_902026 ?auto_902028 ) ) ( not ( = ?auto_902026 ?auto_902029 ) ) ( not ( = ?auto_902026 ?auto_902030 ) ) ( not ( = ?auto_902026 ?auto_902031 ) ) ( not ( = ?auto_902026 ?auto_902032 ) ) ( not ( = ?auto_902026 ?auto_902033 ) ) ( not ( = ?auto_902026 ?auto_902034 ) ) ( not ( = ?auto_902027 ?auto_902028 ) ) ( not ( = ?auto_902027 ?auto_902029 ) ) ( not ( = ?auto_902027 ?auto_902030 ) ) ( not ( = ?auto_902027 ?auto_902031 ) ) ( not ( = ?auto_902027 ?auto_902032 ) ) ( not ( = ?auto_902027 ?auto_902033 ) ) ( not ( = ?auto_902027 ?auto_902034 ) ) ( not ( = ?auto_902028 ?auto_902029 ) ) ( not ( = ?auto_902028 ?auto_902030 ) ) ( not ( = ?auto_902028 ?auto_902031 ) ) ( not ( = ?auto_902028 ?auto_902032 ) ) ( not ( = ?auto_902028 ?auto_902033 ) ) ( not ( = ?auto_902028 ?auto_902034 ) ) ( not ( = ?auto_902029 ?auto_902030 ) ) ( not ( = ?auto_902029 ?auto_902031 ) ) ( not ( = ?auto_902029 ?auto_902032 ) ) ( not ( = ?auto_902029 ?auto_902033 ) ) ( not ( = ?auto_902029 ?auto_902034 ) ) ( not ( = ?auto_902030 ?auto_902031 ) ) ( not ( = ?auto_902030 ?auto_902032 ) ) ( not ( = ?auto_902030 ?auto_902033 ) ) ( not ( = ?auto_902030 ?auto_902034 ) ) ( not ( = ?auto_902031 ?auto_902032 ) ) ( not ( = ?auto_902031 ?auto_902033 ) ) ( not ( = ?auto_902031 ?auto_902034 ) ) ( not ( = ?auto_902032 ?auto_902033 ) ) ( not ( = ?auto_902032 ?auto_902034 ) ) ( not ( = ?auto_902033 ?auto_902034 ) ) ( ON ?auto_902032 ?auto_902033 ) ( ON ?auto_902031 ?auto_902032 ) ( ON ?auto_902030 ?auto_902031 ) ( ON ?auto_902029 ?auto_902030 ) ( ON ?auto_902028 ?auto_902029 ) ( ON ?auto_902027 ?auto_902028 ) ( ON ?auto_902026 ?auto_902027 ) ( ON ?auto_902025 ?auto_902026 ) ( CLEAR ?auto_902023 ) ( ON ?auto_902024 ?auto_902025 ) ( CLEAR ?auto_902024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_902020 ?auto_902021 ?auto_902022 ?auto_902023 ?auto_902024 )
      ( MAKE-14PILE ?auto_902020 ?auto_902021 ?auto_902022 ?auto_902023 ?auto_902024 ?auto_902025 ?auto_902026 ?auto_902027 ?auto_902028 ?auto_902029 ?auto_902030 ?auto_902031 ?auto_902032 ?auto_902033 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_902078 - BLOCK
      ?auto_902079 - BLOCK
      ?auto_902080 - BLOCK
      ?auto_902081 - BLOCK
      ?auto_902082 - BLOCK
      ?auto_902083 - BLOCK
      ?auto_902084 - BLOCK
      ?auto_902085 - BLOCK
      ?auto_902086 - BLOCK
      ?auto_902087 - BLOCK
      ?auto_902088 - BLOCK
      ?auto_902089 - BLOCK
      ?auto_902090 - BLOCK
      ?auto_902091 - BLOCK
    )
    :vars
    (
      ?auto_902092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902091 ?auto_902092 ) ( ON-TABLE ?auto_902078 ) ( ON ?auto_902079 ?auto_902078 ) ( ON ?auto_902080 ?auto_902079 ) ( not ( = ?auto_902078 ?auto_902079 ) ) ( not ( = ?auto_902078 ?auto_902080 ) ) ( not ( = ?auto_902078 ?auto_902081 ) ) ( not ( = ?auto_902078 ?auto_902082 ) ) ( not ( = ?auto_902078 ?auto_902083 ) ) ( not ( = ?auto_902078 ?auto_902084 ) ) ( not ( = ?auto_902078 ?auto_902085 ) ) ( not ( = ?auto_902078 ?auto_902086 ) ) ( not ( = ?auto_902078 ?auto_902087 ) ) ( not ( = ?auto_902078 ?auto_902088 ) ) ( not ( = ?auto_902078 ?auto_902089 ) ) ( not ( = ?auto_902078 ?auto_902090 ) ) ( not ( = ?auto_902078 ?auto_902091 ) ) ( not ( = ?auto_902078 ?auto_902092 ) ) ( not ( = ?auto_902079 ?auto_902080 ) ) ( not ( = ?auto_902079 ?auto_902081 ) ) ( not ( = ?auto_902079 ?auto_902082 ) ) ( not ( = ?auto_902079 ?auto_902083 ) ) ( not ( = ?auto_902079 ?auto_902084 ) ) ( not ( = ?auto_902079 ?auto_902085 ) ) ( not ( = ?auto_902079 ?auto_902086 ) ) ( not ( = ?auto_902079 ?auto_902087 ) ) ( not ( = ?auto_902079 ?auto_902088 ) ) ( not ( = ?auto_902079 ?auto_902089 ) ) ( not ( = ?auto_902079 ?auto_902090 ) ) ( not ( = ?auto_902079 ?auto_902091 ) ) ( not ( = ?auto_902079 ?auto_902092 ) ) ( not ( = ?auto_902080 ?auto_902081 ) ) ( not ( = ?auto_902080 ?auto_902082 ) ) ( not ( = ?auto_902080 ?auto_902083 ) ) ( not ( = ?auto_902080 ?auto_902084 ) ) ( not ( = ?auto_902080 ?auto_902085 ) ) ( not ( = ?auto_902080 ?auto_902086 ) ) ( not ( = ?auto_902080 ?auto_902087 ) ) ( not ( = ?auto_902080 ?auto_902088 ) ) ( not ( = ?auto_902080 ?auto_902089 ) ) ( not ( = ?auto_902080 ?auto_902090 ) ) ( not ( = ?auto_902080 ?auto_902091 ) ) ( not ( = ?auto_902080 ?auto_902092 ) ) ( not ( = ?auto_902081 ?auto_902082 ) ) ( not ( = ?auto_902081 ?auto_902083 ) ) ( not ( = ?auto_902081 ?auto_902084 ) ) ( not ( = ?auto_902081 ?auto_902085 ) ) ( not ( = ?auto_902081 ?auto_902086 ) ) ( not ( = ?auto_902081 ?auto_902087 ) ) ( not ( = ?auto_902081 ?auto_902088 ) ) ( not ( = ?auto_902081 ?auto_902089 ) ) ( not ( = ?auto_902081 ?auto_902090 ) ) ( not ( = ?auto_902081 ?auto_902091 ) ) ( not ( = ?auto_902081 ?auto_902092 ) ) ( not ( = ?auto_902082 ?auto_902083 ) ) ( not ( = ?auto_902082 ?auto_902084 ) ) ( not ( = ?auto_902082 ?auto_902085 ) ) ( not ( = ?auto_902082 ?auto_902086 ) ) ( not ( = ?auto_902082 ?auto_902087 ) ) ( not ( = ?auto_902082 ?auto_902088 ) ) ( not ( = ?auto_902082 ?auto_902089 ) ) ( not ( = ?auto_902082 ?auto_902090 ) ) ( not ( = ?auto_902082 ?auto_902091 ) ) ( not ( = ?auto_902082 ?auto_902092 ) ) ( not ( = ?auto_902083 ?auto_902084 ) ) ( not ( = ?auto_902083 ?auto_902085 ) ) ( not ( = ?auto_902083 ?auto_902086 ) ) ( not ( = ?auto_902083 ?auto_902087 ) ) ( not ( = ?auto_902083 ?auto_902088 ) ) ( not ( = ?auto_902083 ?auto_902089 ) ) ( not ( = ?auto_902083 ?auto_902090 ) ) ( not ( = ?auto_902083 ?auto_902091 ) ) ( not ( = ?auto_902083 ?auto_902092 ) ) ( not ( = ?auto_902084 ?auto_902085 ) ) ( not ( = ?auto_902084 ?auto_902086 ) ) ( not ( = ?auto_902084 ?auto_902087 ) ) ( not ( = ?auto_902084 ?auto_902088 ) ) ( not ( = ?auto_902084 ?auto_902089 ) ) ( not ( = ?auto_902084 ?auto_902090 ) ) ( not ( = ?auto_902084 ?auto_902091 ) ) ( not ( = ?auto_902084 ?auto_902092 ) ) ( not ( = ?auto_902085 ?auto_902086 ) ) ( not ( = ?auto_902085 ?auto_902087 ) ) ( not ( = ?auto_902085 ?auto_902088 ) ) ( not ( = ?auto_902085 ?auto_902089 ) ) ( not ( = ?auto_902085 ?auto_902090 ) ) ( not ( = ?auto_902085 ?auto_902091 ) ) ( not ( = ?auto_902085 ?auto_902092 ) ) ( not ( = ?auto_902086 ?auto_902087 ) ) ( not ( = ?auto_902086 ?auto_902088 ) ) ( not ( = ?auto_902086 ?auto_902089 ) ) ( not ( = ?auto_902086 ?auto_902090 ) ) ( not ( = ?auto_902086 ?auto_902091 ) ) ( not ( = ?auto_902086 ?auto_902092 ) ) ( not ( = ?auto_902087 ?auto_902088 ) ) ( not ( = ?auto_902087 ?auto_902089 ) ) ( not ( = ?auto_902087 ?auto_902090 ) ) ( not ( = ?auto_902087 ?auto_902091 ) ) ( not ( = ?auto_902087 ?auto_902092 ) ) ( not ( = ?auto_902088 ?auto_902089 ) ) ( not ( = ?auto_902088 ?auto_902090 ) ) ( not ( = ?auto_902088 ?auto_902091 ) ) ( not ( = ?auto_902088 ?auto_902092 ) ) ( not ( = ?auto_902089 ?auto_902090 ) ) ( not ( = ?auto_902089 ?auto_902091 ) ) ( not ( = ?auto_902089 ?auto_902092 ) ) ( not ( = ?auto_902090 ?auto_902091 ) ) ( not ( = ?auto_902090 ?auto_902092 ) ) ( not ( = ?auto_902091 ?auto_902092 ) ) ( ON ?auto_902090 ?auto_902091 ) ( ON ?auto_902089 ?auto_902090 ) ( ON ?auto_902088 ?auto_902089 ) ( ON ?auto_902087 ?auto_902088 ) ( ON ?auto_902086 ?auto_902087 ) ( ON ?auto_902085 ?auto_902086 ) ( ON ?auto_902084 ?auto_902085 ) ( ON ?auto_902083 ?auto_902084 ) ( ON ?auto_902082 ?auto_902083 ) ( CLEAR ?auto_902080 ) ( ON ?auto_902081 ?auto_902082 ) ( CLEAR ?auto_902081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_902078 ?auto_902079 ?auto_902080 ?auto_902081 )
      ( MAKE-14PILE ?auto_902078 ?auto_902079 ?auto_902080 ?auto_902081 ?auto_902082 ?auto_902083 ?auto_902084 ?auto_902085 ?auto_902086 ?auto_902087 ?auto_902088 ?auto_902089 ?auto_902090 ?auto_902091 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_902136 - BLOCK
      ?auto_902137 - BLOCK
      ?auto_902138 - BLOCK
      ?auto_902139 - BLOCK
      ?auto_902140 - BLOCK
      ?auto_902141 - BLOCK
      ?auto_902142 - BLOCK
      ?auto_902143 - BLOCK
      ?auto_902144 - BLOCK
      ?auto_902145 - BLOCK
      ?auto_902146 - BLOCK
      ?auto_902147 - BLOCK
      ?auto_902148 - BLOCK
      ?auto_902149 - BLOCK
    )
    :vars
    (
      ?auto_902150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902149 ?auto_902150 ) ( ON-TABLE ?auto_902136 ) ( ON ?auto_902137 ?auto_902136 ) ( not ( = ?auto_902136 ?auto_902137 ) ) ( not ( = ?auto_902136 ?auto_902138 ) ) ( not ( = ?auto_902136 ?auto_902139 ) ) ( not ( = ?auto_902136 ?auto_902140 ) ) ( not ( = ?auto_902136 ?auto_902141 ) ) ( not ( = ?auto_902136 ?auto_902142 ) ) ( not ( = ?auto_902136 ?auto_902143 ) ) ( not ( = ?auto_902136 ?auto_902144 ) ) ( not ( = ?auto_902136 ?auto_902145 ) ) ( not ( = ?auto_902136 ?auto_902146 ) ) ( not ( = ?auto_902136 ?auto_902147 ) ) ( not ( = ?auto_902136 ?auto_902148 ) ) ( not ( = ?auto_902136 ?auto_902149 ) ) ( not ( = ?auto_902136 ?auto_902150 ) ) ( not ( = ?auto_902137 ?auto_902138 ) ) ( not ( = ?auto_902137 ?auto_902139 ) ) ( not ( = ?auto_902137 ?auto_902140 ) ) ( not ( = ?auto_902137 ?auto_902141 ) ) ( not ( = ?auto_902137 ?auto_902142 ) ) ( not ( = ?auto_902137 ?auto_902143 ) ) ( not ( = ?auto_902137 ?auto_902144 ) ) ( not ( = ?auto_902137 ?auto_902145 ) ) ( not ( = ?auto_902137 ?auto_902146 ) ) ( not ( = ?auto_902137 ?auto_902147 ) ) ( not ( = ?auto_902137 ?auto_902148 ) ) ( not ( = ?auto_902137 ?auto_902149 ) ) ( not ( = ?auto_902137 ?auto_902150 ) ) ( not ( = ?auto_902138 ?auto_902139 ) ) ( not ( = ?auto_902138 ?auto_902140 ) ) ( not ( = ?auto_902138 ?auto_902141 ) ) ( not ( = ?auto_902138 ?auto_902142 ) ) ( not ( = ?auto_902138 ?auto_902143 ) ) ( not ( = ?auto_902138 ?auto_902144 ) ) ( not ( = ?auto_902138 ?auto_902145 ) ) ( not ( = ?auto_902138 ?auto_902146 ) ) ( not ( = ?auto_902138 ?auto_902147 ) ) ( not ( = ?auto_902138 ?auto_902148 ) ) ( not ( = ?auto_902138 ?auto_902149 ) ) ( not ( = ?auto_902138 ?auto_902150 ) ) ( not ( = ?auto_902139 ?auto_902140 ) ) ( not ( = ?auto_902139 ?auto_902141 ) ) ( not ( = ?auto_902139 ?auto_902142 ) ) ( not ( = ?auto_902139 ?auto_902143 ) ) ( not ( = ?auto_902139 ?auto_902144 ) ) ( not ( = ?auto_902139 ?auto_902145 ) ) ( not ( = ?auto_902139 ?auto_902146 ) ) ( not ( = ?auto_902139 ?auto_902147 ) ) ( not ( = ?auto_902139 ?auto_902148 ) ) ( not ( = ?auto_902139 ?auto_902149 ) ) ( not ( = ?auto_902139 ?auto_902150 ) ) ( not ( = ?auto_902140 ?auto_902141 ) ) ( not ( = ?auto_902140 ?auto_902142 ) ) ( not ( = ?auto_902140 ?auto_902143 ) ) ( not ( = ?auto_902140 ?auto_902144 ) ) ( not ( = ?auto_902140 ?auto_902145 ) ) ( not ( = ?auto_902140 ?auto_902146 ) ) ( not ( = ?auto_902140 ?auto_902147 ) ) ( not ( = ?auto_902140 ?auto_902148 ) ) ( not ( = ?auto_902140 ?auto_902149 ) ) ( not ( = ?auto_902140 ?auto_902150 ) ) ( not ( = ?auto_902141 ?auto_902142 ) ) ( not ( = ?auto_902141 ?auto_902143 ) ) ( not ( = ?auto_902141 ?auto_902144 ) ) ( not ( = ?auto_902141 ?auto_902145 ) ) ( not ( = ?auto_902141 ?auto_902146 ) ) ( not ( = ?auto_902141 ?auto_902147 ) ) ( not ( = ?auto_902141 ?auto_902148 ) ) ( not ( = ?auto_902141 ?auto_902149 ) ) ( not ( = ?auto_902141 ?auto_902150 ) ) ( not ( = ?auto_902142 ?auto_902143 ) ) ( not ( = ?auto_902142 ?auto_902144 ) ) ( not ( = ?auto_902142 ?auto_902145 ) ) ( not ( = ?auto_902142 ?auto_902146 ) ) ( not ( = ?auto_902142 ?auto_902147 ) ) ( not ( = ?auto_902142 ?auto_902148 ) ) ( not ( = ?auto_902142 ?auto_902149 ) ) ( not ( = ?auto_902142 ?auto_902150 ) ) ( not ( = ?auto_902143 ?auto_902144 ) ) ( not ( = ?auto_902143 ?auto_902145 ) ) ( not ( = ?auto_902143 ?auto_902146 ) ) ( not ( = ?auto_902143 ?auto_902147 ) ) ( not ( = ?auto_902143 ?auto_902148 ) ) ( not ( = ?auto_902143 ?auto_902149 ) ) ( not ( = ?auto_902143 ?auto_902150 ) ) ( not ( = ?auto_902144 ?auto_902145 ) ) ( not ( = ?auto_902144 ?auto_902146 ) ) ( not ( = ?auto_902144 ?auto_902147 ) ) ( not ( = ?auto_902144 ?auto_902148 ) ) ( not ( = ?auto_902144 ?auto_902149 ) ) ( not ( = ?auto_902144 ?auto_902150 ) ) ( not ( = ?auto_902145 ?auto_902146 ) ) ( not ( = ?auto_902145 ?auto_902147 ) ) ( not ( = ?auto_902145 ?auto_902148 ) ) ( not ( = ?auto_902145 ?auto_902149 ) ) ( not ( = ?auto_902145 ?auto_902150 ) ) ( not ( = ?auto_902146 ?auto_902147 ) ) ( not ( = ?auto_902146 ?auto_902148 ) ) ( not ( = ?auto_902146 ?auto_902149 ) ) ( not ( = ?auto_902146 ?auto_902150 ) ) ( not ( = ?auto_902147 ?auto_902148 ) ) ( not ( = ?auto_902147 ?auto_902149 ) ) ( not ( = ?auto_902147 ?auto_902150 ) ) ( not ( = ?auto_902148 ?auto_902149 ) ) ( not ( = ?auto_902148 ?auto_902150 ) ) ( not ( = ?auto_902149 ?auto_902150 ) ) ( ON ?auto_902148 ?auto_902149 ) ( ON ?auto_902147 ?auto_902148 ) ( ON ?auto_902146 ?auto_902147 ) ( ON ?auto_902145 ?auto_902146 ) ( ON ?auto_902144 ?auto_902145 ) ( ON ?auto_902143 ?auto_902144 ) ( ON ?auto_902142 ?auto_902143 ) ( ON ?auto_902141 ?auto_902142 ) ( ON ?auto_902140 ?auto_902141 ) ( ON ?auto_902139 ?auto_902140 ) ( CLEAR ?auto_902137 ) ( ON ?auto_902138 ?auto_902139 ) ( CLEAR ?auto_902138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_902136 ?auto_902137 ?auto_902138 )
      ( MAKE-14PILE ?auto_902136 ?auto_902137 ?auto_902138 ?auto_902139 ?auto_902140 ?auto_902141 ?auto_902142 ?auto_902143 ?auto_902144 ?auto_902145 ?auto_902146 ?auto_902147 ?auto_902148 ?auto_902149 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_902194 - BLOCK
      ?auto_902195 - BLOCK
      ?auto_902196 - BLOCK
      ?auto_902197 - BLOCK
      ?auto_902198 - BLOCK
      ?auto_902199 - BLOCK
      ?auto_902200 - BLOCK
      ?auto_902201 - BLOCK
      ?auto_902202 - BLOCK
      ?auto_902203 - BLOCK
      ?auto_902204 - BLOCK
      ?auto_902205 - BLOCK
      ?auto_902206 - BLOCK
      ?auto_902207 - BLOCK
    )
    :vars
    (
      ?auto_902208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902207 ?auto_902208 ) ( ON-TABLE ?auto_902194 ) ( not ( = ?auto_902194 ?auto_902195 ) ) ( not ( = ?auto_902194 ?auto_902196 ) ) ( not ( = ?auto_902194 ?auto_902197 ) ) ( not ( = ?auto_902194 ?auto_902198 ) ) ( not ( = ?auto_902194 ?auto_902199 ) ) ( not ( = ?auto_902194 ?auto_902200 ) ) ( not ( = ?auto_902194 ?auto_902201 ) ) ( not ( = ?auto_902194 ?auto_902202 ) ) ( not ( = ?auto_902194 ?auto_902203 ) ) ( not ( = ?auto_902194 ?auto_902204 ) ) ( not ( = ?auto_902194 ?auto_902205 ) ) ( not ( = ?auto_902194 ?auto_902206 ) ) ( not ( = ?auto_902194 ?auto_902207 ) ) ( not ( = ?auto_902194 ?auto_902208 ) ) ( not ( = ?auto_902195 ?auto_902196 ) ) ( not ( = ?auto_902195 ?auto_902197 ) ) ( not ( = ?auto_902195 ?auto_902198 ) ) ( not ( = ?auto_902195 ?auto_902199 ) ) ( not ( = ?auto_902195 ?auto_902200 ) ) ( not ( = ?auto_902195 ?auto_902201 ) ) ( not ( = ?auto_902195 ?auto_902202 ) ) ( not ( = ?auto_902195 ?auto_902203 ) ) ( not ( = ?auto_902195 ?auto_902204 ) ) ( not ( = ?auto_902195 ?auto_902205 ) ) ( not ( = ?auto_902195 ?auto_902206 ) ) ( not ( = ?auto_902195 ?auto_902207 ) ) ( not ( = ?auto_902195 ?auto_902208 ) ) ( not ( = ?auto_902196 ?auto_902197 ) ) ( not ( = ?auto_902196 ?auto_902198 ) ) ( not ( = ?auto_902196 ?auto_902199 ) ) ( not ( = ?auto_902196 ?auto_902200 ) ) ( not ( = ?auto_902196 ?auto_902201 ) ) ( not ( = ?auto_902196 ?auto_902202 ) ) ( not ( = ?auto_902196 ?auto_902203 ) ) ( not ( = ?auto_902196 ?auto_902204 ) ) ( not ( = ?auto_902196 ?auto_902205 ) ) ( not ( = ?auto_902196 ?auto_902206 ) ) ( not ( = ?auto_902196 ?auto_902207 ) ) ( not ( = ?auto_902196 ?auto_902208 ) ) ( not ( = ?auto_902197 ?auto_902198 ) ) ( not ( = ?auto_902197 ?auto_902199 ) ) ( not ( = ?auto_902197 ?auto_902200 ) ) ( not ( = ?auto_902197 ?auto_902201 ) ) ( not ( = ?auto_902197 ?auto_902202 ) ) ( not ( = ?auto_902197 ?auto_902203 ) ) ( not ( = ?auto_902197 ?auto_902204 ) ) ( not ( = ?auto_902197 ?auto_902205 ) ) ( not ( = ?auto_902197 ?auto_902206 ) ) ( not ( = ?auto_902197 ?auto_902207 ) ) ( not ( = ?auto_902197 ?auto_902208 ) ) ( not ( = ?auto_902198 ?auto_902199 ) ) ( not ( = ?auto_902198 ?auto_902200 ) ) ( not ( = ?auto_902198 ?auto_902201 ) ) ( not ( = ?auto_902198 ?auto_902202 ) ) ( not ( = ?auto_902198 ?auto_902203 ) ) ( not ( = ?auto_902198 ?auto_902204 ) ) ( not ( = ?auto_902198 ?auto_902205 ) ) ( not ( = ?auto_902198 ?auto_902206 ) ) ( not ( = ?auto_902198 ?auto_902207 ) ) ( not ( = ?auto_902198 ?auto_902208 ) ) ( not ( = ?auto_902199 ?auto_902200 ) ) ( not ( = ?auto_902199 ?auto_902201 ) ) ( not ( = ?auto_902199 ?auto_902202 ) ) ( not ( = ?auto_902199 ?auto_902203 ) ) ( not ( = ?auto_902199 ?auto_902204 ) ) ( not ( = ?auto_902199 ?auto_902205 ) ) ( not ( = ?auto_902199 ?auto_902206 ) ) ( not ( = ?auto_902199 ?auto_902207 ) ) ( not ( = ?auto_902199 ?auto_902208 ) ) ( not ( = ?auto_902200 ?auto_902201 ) ) ( not ( = ?auto_902200 ?auto_902202 ) ) ( not ( = ?auto_902200 ?auto_902203 ) ) ( not ( = ?auto_902200 ?auto_902204 ) ) ( not ( = ?auto_902200 ?auto_902205 ) ) ( not ( = ?auto_902200 ?auto_902206 ) ) ( not ( = ?auto_902200 ?auto_902207 ) ) ( not ( = ?auto_902200 ?auto_902208 ) ) ( not ( = ?auto_902201 ?auto_902202 ) ) ( not ( = ?auto_902201 ?auto_902203 ) ) ( not ( = ?auto_902201 ?auto_902204 ) ) ( not ( = ?auto_902201 ?auto_902205 ) ) ( not ( = ?auto_902201 ?auto_902206 ) ) ( not ( = ?auto_902201 ?auto_902207 ) ) ( not ( = ?auto_902201 ?auto_902208 ) ) ( not ( = ?auto_902202 ?auto_902203 ) ) ( not ( = ?auto_902202 ?auto_902204 ) ) ( not ( = ?auto_902202 ?auto_902205 ) ) ( not ( = ?auto_902202 ?auto_902206 ) ) ( not ( = ?auto_902202 ?auto_902207 ) ) ( not ( = ?auto_902202 ?auto_902208 ) ) ( not ( = ?auto_902203 ?auto_902204 ) ) ( not ( = ?auto_902203 ?auto_902205 ) ) ( not ( = ?auto_902203 ?auto_902206 ) ) ( not ( = ?auto_902203 ?auto_902207 ) ) ( not ( = ?auto_902203 ?auto_902208 ) ) ( not ( = ?auto_902204 ?auto_902205 ) ) ( not ( = ?auto_902204 ?auto_902206 ) ) ( not ( = ?auto_902204 ?auto_902207 ) ) ( not ( = ?auto_902204 ?auto_902208 ) ) ( not ( = ?auto_902205 ?auto_902206 ) ) ( not ( = ?auto_902205 ?auto_902207 ) ) ( not ( = ?auto_902205 ?auto_902208 ) ) ( not ( = ?auto_902206 ?auto_902207 ) ) ( not ( = ?auto_902206 ?auto_902208 ) ) ( not ( = ?auto_902207 ?auto_902208 ) ) ( ON ?auto_902206 ?auto_902207 ) ( ON ?auto_902205 ?auto_902206 ) ( ON ?auto_902204 ?auto_902205 ) ( ON ?auto_902203 ?auto_902204 ) ( ON ?auto_902202 ?auto_902203 ) ( ON ?auto_902201 ?auto_902202 ) ( ON ?auto_902200 ?auto_902201 ) ( ON ?auto_902199 ?auto_902200 ) ( ON ?auto_902198 ?auto_902199 ) ( ON ?auto_902197 ?auto_902198 ) ( ON ?auto_902196 ?auto_902197 ) ( CLEAR ?auto_902194 ) ( ON ?auto_902195 ?auto_902196 ) ( CLEAR ?auto_902195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_902194 ?auto_902195 )
      ( MAKE-14PILE ?auto_902194 ?auto_902195 ?auto_902196 ?auto_902197 ?auto_902198 ?auto_902199 ?auto_902200 ?auto_902201 ?auto_902202 ?auto_902203 ?auto_902204 ?auto_902205 ?auto_902206 ?auto_902207 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_902252 - BLOCK
      ?auto_902253 - BLOCK
      ?auto_902254 - BLOCK
      ?auto_902255 - BLOCK
      ?auto_902256 - BLOCK
      ?auto_902257 - BLOCK
      ?auto_902258 - BLOCK
      ?auto_902259 - BLOCK
      ?auto_902260 - BLOCK
      ?auto_902261 - BLOCK
      ?auto_902262 - BLOCK
      ?auto_902263 - BLOCK
      ?auto_902264 - BLOCK
      ?auto_902265 - BLOCK
    )
    :vars
    (
      ?auto_902266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902265 ?auto_902266 ) ( not ( = ?auto_902252 ?auto_902253 ) ) ( not ( = ?auto_902252 ?auto_902254 ) ) ( not ( = ?auto_902252 ?auto_902255 ) ) ( not ( = ?auto_902252 ?auto_902256 ) ) ( not ( = ?auto_902252 ?auto_902257 ) ) ( not ( = ?auto_902252 ?auto_902258 ) ) ( not ( = ?auto_902252 ?auto_902259 ) ) ( not ( = ?auto_902252 ?auto_902260 ) ) ( not ( = ?auto_902252 ?auto_902261 ) ) ( not ( = ?auto_902252 ?auto_902262 ) ) ( not ( = ?auto_902252 ?auto_902263 ) ) ( not ( = ?auto_902252 ?auto_902264 ) ) ( not ( = ?auto_902252 ?auto_902265 ) ) ( not ( = ?auto_902252 ?auto_902266 ) ) ( not ( = ?auto_902253 ?auto_902254 ) ) ( not ( = ?auto_902253 ?auto_902255 ) ) ( not ( = ?auto_902253 ?auto_902256 ) ) ( not ( = ?auto_902253 ?auto_902257 ) ) ( not ( = ?auto_902253 ?auto_902258 ) ) ( not ( = ?auto_902253 ?auto_902259 ) ) ( not ( = ?auto_902253 ?auto_902260 ) ) ( not ( = ?auto_902253 ?auto_902261 ) ) ( not ( = ?auto_902253 ?auto_902262 ) ) ( not ( = ?auto_902253 ?auto_902263 ) ) ( not ( = ?auto_902253 ?auto_902264 ) ) ( not ( = ?auto_902253 ?auto_902265 ) ) ( not ( = ?auto_902253 ?auto_902266 ) ) ( not ( = ?auto_902254 ?auto_902255 ) ) ( not ( = ?auto_902254 ?auto_902256 ) ) ( not ( = ?auto_902254 ?auto_902257 ) ) ( not ( = ?auto_902254 ?auto_902258 ) ) ( not ( = ?auto_902254 ?auto_902259 ) ) ( not ( = ?auto_902254 ?auto_902260 ) ) ( not ( = ?auto_902254 ?auto_902261 ) ) ( not ( = ?auto_902254 ?auto_902262 ) ) ( not ( = ?auto_902254 ?auto_902263 ) ) ( not ( = ?auto_902254 ?auto_902264 ) ) ( not ( = ?auto_902254 ?auto_902265 ) ) ( not ( = ?auto_902254 ?auto_902266 ) ) ( not ( = ?auto_902255 ?auto_902256 ) ) ( not ( = ?auto_902255 ?auto_902257 ) ) ( not ( = ?auto_902255 ?auto_902258 ) ) ( not ( = ?auto_902255 ?auto_902259 ) ) ( not ( = ?auto_902255 ?auto_902260 ) ) ( not ( = ?auto_902255 ?auto_902261 ) ) ( not ( = ?auto_902255 ?auto_902262 ) ) ( not ( = ?auto_902255 ?auto_902263 ) ) ( not ( = ?auto_902255 ?auto_902264 ) ) ( not ( = ?auto_902255 ?auto_902265 ) ) ( not ( = ?auto_902255 ?auto_902266 ) ) ( not ( = ?auto_902256 ?auto_902257 ) ) ( not ( = ?auto_902256 ?auto_902258 ) ) ( not ( = ?auto_902256 ?auto_902259 ) ) ( not ( = ?auto_902256 ?auto_902260 ) ) ( not ( = ?auto_902256 ?auto_902261 ) ) ( not ( = ?auto_902256 ?auto_902262 ) ) ( not ( = ?auto_902256 ?auto_902263 ) ) ( not ( = ?auto_902256 ?auto_902264 ) ) ( not ( = ?auto_902256 ?auto_902265 ) ) ( not ( = ?auto_902256 ?auto_902266 ) ) ( not ( = ?auto_902257 ?auto_902258 ) ) ( not ( = ?auto_902257 ?auto_902259 ) ) ( not ( = ?auto_902257 ?auto_902260 ) ) ( not ( = ?auto_902257 ?auto_902261 ) ) ( not ( = ?auto_902257 ?auto_902262 ) ) ( not ( = ?auto_902257 ?auto_902263 ) ) ( not ( = ?auto_902257 ?auto_902264 ) ) ( not ( = ?auto_902257 ?auto_902265 ) ) ( not ( = ?auto_902257 ?auto_902266 ) ) ( not ( = ?auto_902258 ?auto_902259 ) ) ( not ( = ?auto_902258 ?auto_902260 ) ) ( not ( = ?auto_902258 ?auto_902261 ) ) ( not ( = ?auto_902258 ?auto_902262 ) ) ( not ( = ?auto_902258 ?auto_902263 ) ) ( not ( = ?auto_902258 ?auto_902264 ) ) ( not ( = ?auto_902258 ?auto_902265 ) ) ( not ( = ?auto_902258 ?auto_902266 ) ) ( not ( = ?auto_902259 ?auto_902260 ) ) ( not ( = ?auto_902259 ?auto_902261 ) ) ( not ( = ?auto_902259 ?auto_902262 ) ) ( not ( = ?auto_902259 ?auto_902263 ) ) ( not ( = ?auto_902259 ?auto_902264 ) ) ( not ( = ?auto_902259 ?auto_902265 ) ) ( not ( = ?auto_902259 ?auto_902266 ) ) ( not ( = ?auto_902260 ?auto_902261 ) ) ( not ( = ?auto_902260 ?auto_902262 ) ) ( not ( = ?auto_902260 ?auto_902263 ) ) ( not ( = ?auto_902260 ?auto_902264 ) ) ( not ( = ?auto_902260 ?auto_902265 ) ) ( not ( = ?auto_902260 ?auto_902266 ) ) ( not ( = ?auto_902261 ?auto_902262 ) ) ( not ( = ?auto_902261 ?auto_902263 ) ) ( not ( = ?auto_902261 ?auto_902264 ) ) ( not ( = ?auto_902261 ?auto_902265 ) ) ( not ( = ?auto_902261 ?auto_902266 ) ) ( not ( = ?auto_902262 ?auto_902263 ) ) ( not ( = ?auto_902262 ?auto_902264 ) ) ( not ( = ?auto_902262 ?auto_902265 ) ) ( not ( = ?auto_902262 ?auto_902266 ) ) ( not ( = ?auto_902263 ?auto_902264 ) ) ( not ( = ?auto_902263 ?auto_902265 ) ) ( not ( = ?auto_902263 ?auto_902266 ) ) ( not ( = ?auto_902264 ?auto_902265 ) ) ( not ( = ?auto_902264 ?auto_902266 ) ) ( not ( = ?auto_902265 ?auto_902266 ) ) ( ON ?auto_902264 ?auto_902265 ) ( ON ?auto_902263 ?auto_902264 ) ( ON ?auto_902262 ?auto_902263 ) ( ON ?auto_902261 ?auto_902262 ) ( ON ?auto_902260 ?auto_902261 ) ( ON ?auto_902259 ?auto_902260 ) ( ON ?auto_902258 ?auto_902259 ) ( ON ?auto_902257 ?auto_902258 ) ( ON ?auto_902256 ?auto_902257 ) ( ON ?auto_902255 ?auto_902256 ) ( ON ?auto_902254 ?auto_902255 ) ( ON ?auto_902253 ?auto_902254 ) ( ON ?auto_902252 ?auto_902253 ) ( CLEAR ?auto_902252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_902252 )
      ( MAKE-14PILE ?auto_902252 ?auto_902253 ?auto_902254 ?auto_902255 ?auto_902256 ?auto_902257 ?auto_902258 ?auto_902259 ?auto_902260 ?auto_902261 ?auto_902262 ?auto_902263 ?auto_902264 ?auto_902265 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_902311 - BLOCK
      ?auto_902312 - BLOCK
      ?auto_902313 - BLOCK
      ?auto_902314 - BLOCK
      ?auto_902315 - BLOCK
      ?auto_902316 - BLOCK
      ?auto_902317 - BLOCK
      ?auto_902318 - BLOCK
      ?auto_902319 - BLOCK
      ?auto_902320 - BLOCK
      ?auto_902321 - BLOCK
      ?auto_902322 - BLOCK
      ?auto_902323 - BLOCK
      ?auto_902324 - BLOCK
      ?auto_902325 - BLOCK
    )
    :vars
    (
      ?auto_902326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_902324 ) ( ON ?auto_902325 ?auto_902326 ) ( CLEAR ?auto_902325 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_902311 ) ( ON ?auto_902312 ?auto_902311 ) ( ON ?auto_902313 ?auto_902312 ) ( ON ?auto_902314 ?auto_902313 ) ( ON ?auto_902315 ?auto_902314 ) ( ON ?auto_902316 ?auto_902315 ) ( ON ?auto_902317 ?auto_902316 ) ( ON ?auto_902318 ?auto_902317 ) ( ON ?auto_902319 ?auto_902318 ) ( ON ?auto_902320 ?auto_902319 ) ( ON ?auto_902321 ?auto_902320 ) ( ON ?auto_902322 ?auto_902321 ) ( ON ?auto_902323 ?auto_902322 ) ( ON ?auto_902324 ?auto_902323 ) ( not ( = ?auto_902311 ?auto_902312 ) ) ( not ( = ?auto_902311 ?auto_902313 ) ) ( not ( = ?auto_902311 ?auto_902314 ) ) ( not ( = ?auto_902311 ?auto_902315 ) ) ( not ( = ?auto_902311 ?auto_902316 ) ) ( not ( = ?auto_902311 ?auto_902317 ) ) ( not ( = ?auto_902311 ?auto_902318 ) ) ( not ( = ?auto_902311 ?auto_902319 ) ) ( not ( = ?auto_902311 ?auto_902320 ) ) ( not ( = ?auto_902311 ?auto_902321 ) ) ( not ( = ?auto_902311 ?auto_902322 ) ) ( not ( = ?auto_902311 ?auto_902323 ) ) ( not ( = ?auto_902311 ?auto_902324 ) ) ( not ( = ?auto_902311 ?auto_902325 ) ) ( not ( = ?auto_902311 ?auto_902326 ) ) ( not ( = ?auto_902312 ?auto_902313 ) ) ( not ( = ?auto_902312 ?auto_902314 ) ) ( not ( = ?auto_902312 ?auto_902315 ) ) ( not ( = ?auto_902312 ?auto_902316 ) ) ( not ( = ?auto_902312 ?auto_902317 ) ) ( not ( = ?auto_902312 ?auto_902318 ) ) ( not ( = ?auto_902312 ?auto_902319 ) ) ( not ( = ?auto_902312 ?auto_902320 ) ) ( not ( = ?auto_902312 ?auto_902321 ) ) ( not ( = ?auto_902312 ?auto_902322 ) ) ( not ( = ?auto_902312 ?auto_902323 ) ) ( not ( = ?auto_902312 ?auto_902324 ) ) ( not ( = ?auto_902312 ?auto_902325 ) ) ( not ( = ?auto_902312 ?auto_902326 ) ) ( not ( = ?auto_902313 ?auto_902314 ) ) ( not ( = ?auto_902313 ?auto_902315 ) ) ( not ( = ?auto_902313 ?auto_902316 ) ) ( not ( = ?auto_902313 ?auto_902317 ) ) ( not ( = ?auto_902313 ?auto_902318 ) ) ( not ( = ?auto_902313 ?auto_902319 ) ) ( not ( = ?auto_902313 ?auto_902320 ) ) ( not ( = ?auto_902313 ?auto_902321 ) ) ( not ( = ?auto_902313 ?auto_902322 ) ) ( not ( = ?auto_902313 ?auto_902323 ) ) ( not ( = ?auto_902313 ?auto_902324 ) ) ( not ( = ?auto_902313 ?auto_902325 ) ) ( not ( = ?auto_902313 ?auto_902326 ) ) ( not ( = ?auto_902314 ?auto_902315 ) ) ( not ( = ?auto_902314 ?auto_902316 ) ) ( not ( = ?auto_902314 ?auto_902317 ) ) ( not ( = ?auto_902314 ?auto_902318 ) ) ( not ( = ?auto_902314 ?auto_902319 ) ) ( not ( = ?auto_902314 ?auto_902320 ) ) ( not ( = ?auto_902314 ?auto_902321 ) ) ( not ( = ?auto_902314 ?auto_902322 ) ) ( not ( = ?auto_902314 ?auto_902323 ) ) ( not ( = ?auto_902314 ?auto_902324 ) ) ( not ( = ?auto_902314 ?auto_902325 ) ) ( not ( = ?auto_902314 ?auto_902326 ) ) ( not ( = ?auto_902315 ?auto_902316 ) ) ( not ( = ?auto_902315 ?auto_902317 ) ) ( not ( = ?auto_902315 ?auto_902318 ) ) ( not ( = ?auto_902315 ?auto_902319 ) ) ( not ( = ?auto_902315 ?auto_902320 ) ) ( not ( = ?auto_902315 ?auto_902321 ) ) ( not ( = ?auto_902315 ?auto_902322 ) ) ( not ( = ?auto_902315 ?auto_902323 ) ) ( not ( = ?auto_902315 ?auto_902324 ) ) ( not ( = ?auto_902315 ?auto_902325 ) ) ( not ( = ?auto_902315 ?auto_902326 ) ) ( not ( = ?auto_902316 ?auto_902317 ) ) ( not ( = ?auto_902316 ?auto_902318 ) ) ( not ( = ?auto_902316 ?auto_902319 ) ) ( not ( = ?auto_902316 ?auto_902320 ) ) ( not ( = ?auto_902316 ?auto_902321 ) ) ( not ( = ?auto_902316 ?auto_902322 ) ) ( not ( = ?auto_902316 ?auto_902323 ) ) ( not ( = ?auto_902316 ?auto_902324 ) ) ( not ( = ?auto_902316 ?auto_902325 ) ) ( not ( = ?auto_902316 ?auto_902326 ) ) ( not ( = ?auto_902317 ?auto_902318 ) ) ( not ( = ?auto_902317 ?auto_902319 ) ) ( not ( = ?auto_902317 ?auto_902320 ) ) ( not ( = ?auto_902317 ?auto_902321 ) ) ( not ( = ?auto_902317 ?auto_902322 ) ) ( not ( = ?auto_902317 ?auto_902323 ) ) ( not ( = ?auto_902317 ?auto_902324 ) ) ( not ( = ?auto_902317 ?auto_902325 ) ) ( not ( = ?auto_902317 ?auto_902326 ) ) ( not ( = ?auto_902318 ?auto_902319 ) ) ( not ( = ?auto_902318 ?auto_902320 ) ) ( not ( = ?auto_902318 ?auto_902321 ) ) ( not ( = ?auto_902318 ?auto_902322 ) ) ( not ( = ?auto_902318 ?auto_902323 ) ) ( not ( = ?auto_902318 ?auto_902324 ) ) ( not ( = ?auto_902318 ?auto_902325 ) ) ( not ( = ?auto_902318 ?auto_902326 ) ) ( not ( = ?auto_902319 ?auto_902320 ) ) ( not ( = ?auto_902319 ?auto_902321 ) ) ( not ( = ?auto_902319 ?auto_902322 ) ) ( not ( = ?auto_902319 ?auto_902323 ) ) ( not ( = ?auto_902319 ?auto_902324 ) ) ( not ( = ?auto_902319 ?auto_902325 ) ) ( not ( = ?auto_902319 ?auto_902326 ) ) ( not ( = ?auto_902320 ?auto_902321 ) ) ( not ( = ?auto_902320 ?auto_902322 ) ) ( not ( = ?auto_902320 ?auto_902323 ) ) ( not ( = ?auto_902320 ?auto_902324 ) ) ( not ( = ?auto_902320 ?auto_902325 ) ) ( not ( = ?auto_902320 ?auto_902326 ) ) ( not ( = ?auto_902321 ?auto_902322 ) ) ( not ( = ?auto_902321 ?auto_902323 ) ) ( not ( = ?auto_902321 ?auto_902324 ) ) ( not ( = ?auto_902321 ?auto_902325 ) ) ( not ( = ?auto_902321 ?auto_902326 ) ) ( not ( = ?auto_902322 ?auto_902323 ) ) ( not ( = ?auto_902322 ?auto_902324 ) ) ( not ( = ?auto_902322 ?auto_902325 ) ) ( not ( = ?auto_902322 ?auto_902326 ) ) ( not ( = ?auto_902323 ?auto_902324 ) ) ( not ( = ?auto_902323 ?auto_902325 ) ) ( not ( = ?auto_902323 ?auto_902326 ) ) ( not ( = ?auto_902324 ?auto_902325 ) ) ( not ( = ?auto_902324 ?auto_902326 ) ) ( not ( = ?auto_902325 ?auto_902326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_902325 ?auto_902326 )
      ( !STACK ?auto_902325 ?auto_902324 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_902373 - BLOCK
      ?auto_902374 - BLOCK
      ?auto_902375 - BLOCK
      ?auto_902376 - BLOCK
      ?auto_902377 - BLOCK
      ?auto_902378 - BLOCK
      ?auto_902379 - BLOCK
      ?auto_902380 - BLOCK
      ?auto_902381 - BLOCK
      ?auto_902382 - BLOCK
      ?auto_902383 - BLOCK
      ?auto_902384 - BLOCK
      ?auto_902385 - BLOCK
      ?auto_902386 - BLOCK
      ?auto_902387 - BLOCK
    )
    :vars
    (
      ?auto_902388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902387 ?auto_902388 ) ( ON-TABLE ?auto_902373 ) ( ON ?auto_902374 ?auto_902373 ) ( ON ?auto_902375 ?auto_902374 ) ( ON ?auto_902376 ?auto_902375 ) ( ON ?auto_902377 ?auto_902376 ) ( ON ?auto_902378 ?auto_902377 ) ( ON ?auto_902379 ?auto_902378 ) ( ON ?auto_902380 ?auto_902379 ) ( ON ?auto_902381 ?auto_902380 ) ( ON ?auto_902382 ?auto_902381 ) ( ON ?auto_902383 ?auto_902382 ) ( ON ?auto_902384 ?auto_902383 ) ( ON ?auto_902385 ?auto_902384 ) ( not ( = ?auto_902373 ?auto_902374 ) ) ( not ( = ?auto_902373 ?auto_902375 ) ) ( not ( = ?auto_902373 ?auto_902376 ) ) ( not ( = ?auto_902373 ?auto_902377 ) ) ( not ( = ?auto_902373 ?auto_902378 ) ) ( not ( = ?auto_902373 ?auto_902379 ) ) ( not ( = ?auto_902373 ?auto_902380 ) ) ( not ( = ?auto_902373 ?auto_902381 ) ) ( not ( = ?auto_902373 ?auto_902382 ) ) ( not ( = ?auto_902373 ?auto_902383 ) ) ( not ( = ?auto_902373 ?auto_902384 ) ) ( not ( = ?auto_902373 ?auto_902385 ) ) ( not ( = ?auto_902373 ?auto_902386 ) ) ( not ( = ?auto_902373 ?auto_902387 ) ) ( not ( = ?auto_902373 ?auto_902388 ) ) ( not ( = ?auto_902374 ?auto_902375 ) ) ( not ( = ?auto_902374 ?auto_902376 ) ) ( not ( = ?auto_902374 ?auto_902377 ) ) ( not ( = ?auto_902374 ?auto_902378 ) ) ( not ( = ?auto_902374 ?auto_902379 ) ) ( not ( = ?auto_902374 ?auto_902380 ) ) ( not ( = ?auto_902374 ?auto_902381 ) ) ( not ( = ?auto_902374 ?auto_902382 ) ) ( not ( = ?auto_902374 ?auto_902383 ) ) ( not ( = ?auto_902374 ?auto_902384 ) ) ( not ( = ?auto_902374 ?auto_902385 ) ) ( not ( = ?auto_902374 ?auto_902386 ) ) ( not ( = ?auto_902374 ?auto_902387 ) ) ( not ( = ?auto_902374 ?auto_902388 ) ) ( not ( = ?auto_902375 ?auto_902376 ) ) ( not ( = ?auto_902375 ?auto_902377 ) ) ( not ( = ?auto_902375 ?auto_902378 ) ) ( not ( = ?auto_902375 ?auto_902379 ) ) ( not ( = ?auto_902375 ?auto_902380 ) ) ( not ( = ?auto_902375 ?auto_902381 ) ) ( not ( = ?auto_902375 ?auto_902382 ) ) ( not ( = ?auto_902375 ?auto_902383 ) ) ( not ( = ?auto_902375 ?auto_902384 ) ) ( not ( = ?auto_902375 ?auto_902385 ) ) ( not ( = ?auto_902375 ?auto_902386 ) ) ( not ( = ?auto_902375 ?auto_902387 ) ) ( not ( = ?auto_902375 ?auto_902388 ) ) ( not ( = ?auto_902376 ?auto_902377 ) ) ( not ( = ?auto_902376 ?auto_902378 ) ) ( not ( = ?auto_902376 ?auto_902379 ) ) ( not ( = ?auto_902376 ?auto_902380 ) ) ( not ( = ?auto_902376 ?auto_902381 ) ) ( not ( = ?auto_902376 ?auto_902382 ) ) ( not ( = ?auto_902376 ?auto_902383 ) ) ( not ( = ?auto_902376 ?auto_902384 ) ) ( not ( = ?auto_902376 ?auto_902385 ) ) ( not ( = ?auto_902376 ?auto_902386 ) ) ( not ( = ?auto_902376 ?auto_902387 ) ) ( not ( = ?auto_902376 ?auto_902388 ) ) ( not ( = ?auto_902377 ?auto_902378 ) ) ( not ( = ?auto_902377 ?auto_902379 ) ) ( not ( = ?auto_902377 ?auto_902380 ) ) ( not ( = ?auto_902377 ?auto_902381 ) ) ( not ( = ?auto_902377 ?auto_902382 ) ) ( not ( = ?auto_902377 ?auto_902383 ) ) ( not ( = ?auto_902377 ?auto_902384 ) ) ( not ( = ?auto_902377 ?auto_902385 ) ) ( not ( = ?auto_902377 ?auto_902386 ) ) ( not ( = ?auto_902377 ?auto_902387 ) ) ( not ( = ?auto_902377 ?auto_902388 ) ) ( not ( = ?auto_902378 ?auto_902379 ) ) ( not ( = ?auto_902378 ?auto_902380 ) ) ( not ( = ?auto_902378 ?auto_902381 ) ) ( not ( = ?auto_902378 ?auto_902382 ) ) ( not ( = ?auto_902378 ?auto_902383 ) ) ( not ( = ?auto_902378 ?auto_902384 ) ) ( not ( = ?auto_902378 ?auto_902385 ) ) ( not ( = ?auto_902378 ?auto_902386 ) ) ( not ( = ?auto_902378 ?auto_902387 ) ) ( not ( = ?auto_902378 ?auto_902388 ) ) ( not ( = ?auto_902379 ?auto_902380 ) ) ( not ( = ?auto_902379 ?auto_902381 ) ) ( not ( = ?auto_902379 ?auto_902382 ) ) ( not ( = ?auto_902379 ?auto_902383 ) ) ( not ( = ?auto_902379 ?auto_902384 ) ) ( not ( = ?auto_902379 ?auto_902385 ) ) ( not ( = ?auto_902379 ?auto_902386 ) ) ( not ( = ?auto_902379 ?auto_902387 ) ) ( not ( = ?auto_902379 ?auto_902388 ) ) ( not ( = ?auto_902380 ?auto_902381 ) ) ( not ( = ?auto_902380 ?auto_902382 ) ) ( not ( = ?auto_902380 ?auto_902383 ) ) ( not ( = ?auto_902380 ?auto_902384 ) ) ( not ( = ?auto_902380 ?auto_902385 ) ) ( not ( = ?auto_902380 ?auto_902386 ) ) ( not ( = ?auto_902380 ?auto_902387 ) ) ( not ( = ?auto_902380 ?auto_902388 ) ) ( not ( = ?auto_902381 ?auto_902382 ) ) ( not ( = ?auto_902381 ?auto_902383 ) ) ( not ( = ?auto_902381 ?auto_902384 ) ) ( not ( = ?auto_902381 ?auto_902385 ) ) ( not ( = ?auto_902381 ?auto_902386 ) ) ( not ( = ?auto_902381 ?auto_902387 ) ) ( not ( = ?auto_902381 ?auto_902388 ) ) ( not ( = ?auto_902382 ?auto_902383 ) ) ( not ( = ?auto_902382 ?auto_902384 ) ) ( not ( = ?auto_902382 ?auto_902385 ) ) ( not ( = ?auto_902382 ?auto_902386 ) ) ( not ( = ?auto_902382 ?auto_902387 ) ) ( not ( = ?auto_902382 ?auto_902388 ) ) ( not ( = ?auto_902383 ?auto_902384 ) ) ( not ( = ?auto_902383 ?auto_902385 ) ) ( not ( = ?auto_902383 ?auto_902386 ) ) ( not ( = ?auto_902383 ?auto_902387 ) ) ( not ( = ?auto_902383 ?auto_902388 ) ) ( not ( = ?auto_902384 ?auto_902385 ) ) ( not ( = ?auto_902384 ?auto_902386 ) ) ( not ( = ?auto_902384 ?auto_902387 ) ) ( not ( = ?auto_902384 ?auto_902388 ) ) ( not ( = ?auto_902385 ?auto_902386 ) ) ( not ( = ?auto_902385 ?auto_902387 ) ) ( not ( = ?auto_902385 ?auto_902388 ) ) ( not ( = ?auto_902386 ?auto_902387 ) ) ( not ( = ?auto_902386 ?auto_902388 ) ) ( not ( = ?auto_902387 ?auto_902388 ) ) ( CLEAR ?auto_902385 ) ( ON ?auto_902386 ?auto_902387 ) ( CLEAR ?auto_902386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_902373 ?auto_902374 ?auto_902375 ?auto_902376 ?auto_902377 ?auto_902378 ?auto_902379 ?auto_902380 ?auto_902381 ?auto_902382 ?auto_902383 ?auto_902384 ?auto_902385 ?auto_902386 )
      ( MAKE-15PILE ?auto_902373 ?auto_902374 ?auto_902375 ?auto_902376 ?auto_902377 ?auto_902378 ?auto_902379 ?auto_902380 ?auto_902381 ?auto_902382 ?auto_902383 ?auto_902384 ?auto_902385 ?auto_902386 ?auto_902387 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_902435 - BLOCK
      ?auto_902436 - BLOCK
      ?auto_902437 - BLOCK
      ?auto_902438 - BLOCK
      ?auto_902439 - BLOCK
      ?auto_902440 - BLOCK
      ?auto_902441 - BLOCK
      ?auto_902442 - BLOCK
      ?auto_902443 - BLOCK
      ?auto_902444 - BLOCK
      ?auto_902445 - BLOCK
      ?auto_902446 - BLOCK
      ?auto_902447 - BLOCK
      ?auto_902448 - BLOCK
      ?auto_902449 - BLOCK
    )
    :vars
    (
      ?auto_902450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902449 ?auto_902450 ) ( ON-TABLE ?auto_902435 ) ( ON ?auto_902436 ?auto_902435 ) ( ON ?auto_902437 ?auto_902436 ) ( ON ?auto_902438 ?auto_902437 ) ( ON ?auto_902439 ?auto_902438 ) ( ON ?auto_902440 ?auto_902439 ) ( ON ?auto_902441 ?auto_902440 ) ( ON ?auto_902442 ?auto_902441 ) ( ON ?auto_902443 ?auto_902442 ) ( ON ?auto_902444 ?auto_902443 ) ( ON ?auto_902445 ?auto_902444 ) ( ON ?auto_902446 ?auto_902445 ) ( not ( = ?auto_902435 ?auto_902436 ) ) ( not ( = ?auto_902435 ?auto_902437 ) ) ( not ( = ?auto_902435 ?auto_902438 ) ) ( not ( = ?auto_902435 ?auto_902439 ) ) ( not ( = ?auto_902435 ?auto_902440 ) ) ( not ( = ?auto_902435 ?auto_902441 ) ) ( not ( = ?auto_902435 ?auto_902442 ) ) ( not ( = ?auto_902435 ?auto_902443 ) ) ( not ( = ?auto_902435 ?auto_902444 ) ) ( not ( = ?auto_902435 ?auto_902445 ) ) ( not ( = ?auto_902435 ?auto_902446 ) ) ( not ( = ?auto_902435 ?auto_902447 ) ) ( not ( = ?auto_902435 ?auto_902448 ) ) ( not ( = ?auto_902435 ?auto_902449 ) ) ( not ( = ?auto_902435 ?auto_902450 ) ) ( not ( = ?auto_902436 ?auto_902437 ) ) ( not ( = ?auto_902436 ?auto_902438 ) ) ( not ( = ?auto_902436 ?auto_902439 ) ) ( not ( = ?auto_902436 ?auto_902440 ) ) ( not ( = ?auto_902436 ?auto_902441 ) ) ( not ( = ?auto_902436 ?auto_902442 ) ) ( not ( = ?auto_902436 ?auto_902443 ) ) ( not ( = ?auto_902436 ?auto_902444 ) ) ( not ( = ?auto_902436 ?auto_902445 ) ) ( not ( = ?auto_902436 ?auto_902446 ) ) ( not ( = ?auto_902436 ?auto_902447 ) ) ( not ( = ?auto_902436 ?auto_902448 ) ) ( not ( = ?auto_902436 ?auto_902449 ) ) ( not ( = ?auto_902436 ?auto_902450 ) ) ( not ( = ?auto_902437 ?auto_902438 ) ) ( not ( = ?auto_902437 ?auto_902439 ) ) ( not ( = ?auto_902437 ?auto_902440 ) ) ( not ( = ?auto_902437 ?auto_902441 ) ) ( not ( = ?auto_902437 ?auto_902442 ) ) ( not ( = ?auto_902437 ?auto_902443 ) ) ( not ( = ?auto_902437 ?auto_902444 ) ) ( not ( = ?auto_902437 ?auto_902445 ) ) ( not ( = ?auto_902437 ?auto_902446 ) ) ( not ( = ?auto_902437 ?auto_902447 ) ) ( not ( = ?auto_902437 ?auto_902448 ) ) ( not ( = ?auto_902437 ?auto_902449 ) ) ( not ( = ?auto_902437 ?auto_902450 ) ) ( not ( = ?auto_902438 ?auto_902439 ) ) ( not ( = ?auto_902438 ?auto_902440 ) ) ( not ( = ?auto_902438 ?auto_902441 ) ) ( not ( = ?auto_902438 ?auto_902442 ) ) ( not ( = ?auto_902438 ?auto_902443 ) ) ( not ( = ?auto_902438 ?auto_902444 ) ) ( not ( = ?auto_902438 ?auto_902445 ) ) ( not ( = ?auto_902438 ?auto_902446 ) ) ( not ( = ?auto_902438 ?auto_902447 ) ) ( not ( = ?auto_902438 ?auto_902448 ) ) ( not ( = ?auto_902438 ?auto_902449 ) ) ( not ( = ?auto_902438 ?auto_902450 ) ) ( not ( = ?auto_902439 ?auto_902440 ) ) ( not ( = ?auto_902439 ?auto_902441 ) ) ( not ( = ?auto_902439 ?auto_902442 ) ) ( not ( = ?auto_902439 ?auto_902443 ) ) ( not ( = ?auto_902439 ?auto_902444 ) ) ( not ( = ?auto_902439 ?auto_902445 ) ) ( not ( = ?auto_902439 ?auto_902446 ) ) ( not ( = ?auto_902439 ?auto_902447 ) ) ( not ( = ?auto_902439 ?auto_902448 ) ) ( not ( = ?auto_902439 ?auto_902449 ) ) ( not ( = ?auto_902439 ?auto_902450 ) ) ( not ( = ?auto_902440 ?auto_902441 ) ) ( not ( = ?auto_902440 ?auto_902442 ) ) ( not ( = ?auto_902440 ?auto_902443 ) ) ( not ( = ?auto_902440 ?auto_902444 ) ) ( not ( = ?auto_902440 ?auto_902445 ) ) ( not ( = ?auto_902440 ?auto_902446 ) ) ( not ( = ?auto_902440 ?auto_902447 ) ) ( not ( = ?auto_902440 ?auto_902448 ) ) ( not ( = ?auto_902440 ?auto_902449 ) ) ( not ( = ?auto_902440 ?auto_902450 ) ) ( not ( = ?auto_902441 ?auto_902442 ) ) ( not ( = ?auto_902441 ?auto_902443 ) ) ( not ( = ?auto_902441 ?auto_902444 ) ) ( not ( = ?auto_902441 ?auto_902445 ) ) ( not ( = ?auto_902441 ?auto_902446 ) ) ( not ( = ?auto_902441 ?auto_902447 ) ) ( not ( = ?auto_902441 ?auto_902448 ) ) ( not ( = ?auto_902441 ?auto_902449 ) ) ( not ( = ?auto_902441 ?auto_902450 ) ) ( not ( = ?auto_902442 ?auto_902443 ) ) ( not ( = ?auto_902442 ?auto_902444 ) ) ( not ( = ?auto_902442 ?auto_902445 ) ) ( not ( = ?auto_902442 ?auto_902446 ) ) ( not ( = ?auto_902442 ?auto_902447 ) ) ( not ( = ?auto_902442 ?auto_902448 ) ) ( not ( = ?auto_902442 ?auto_902449 ) ) ( not ( = ?auto_902442 ?auto_902450 ) ) ( not ( = ?auto_902443 ?auto_902444 ) ) ( not ( = ?auto_902443 ?auto_902445 ) ) ( not ( = ?auto_902443 ?auto_902446 ) ) ( not ( = ?auto_902443 ?auto_902447 ) ) ( not ( = ?auto_902443 ?auto_902448 ) ) ( not ( = ?auto_902443 ?auto_902449 ) ) ( not ( = ?auto_902443 ?auto_902450 ) ) ( not ( = ?auto_902444 ?auto_902445 ) ) ( not ( = ?auto_902444 ?auto_902446 ) ) ( not ( = ?auto_902444 ?auto_902447 ) ) ( not ( = ?auto_902444 ?auto_902448 ) ) ( not ( = ?auto_902444 ?auto_902449 ) ) ( not ( = ?auto_902444 ?auto_902450 ) ) ( not ( = ?auto_902445 ?auto_902446 ) ) ( not ( = ?auto_902445 ?auto_902447 ) ) ( not ( = ?auto_902445 ?auto_902448 ) ) ( not ( = ?auto_902445 ?auto_902449 ) ) ( not ( = ?auto_902445 ?auto_902450 ) ) ( not ( = ?auto_902446 ?auto_902447 ) ) ( not ( = ?auto_902446 ?auto_902448 ) ) ( not ( = ?auto_902446 ?auto_902449 ) ) ( not ( = ?auto_902446 ?auto_902450 ) ) ( not ( = ?auto_902447 ?auto_902448 ) ) ( not ( = ?auto_902447 ?auto_902449 ) ) ( not ( = ?auto_902447 ?auto_902450 ) ) ( not ( = ?auto_902448 ?auto_902449 ) ) ( not ( = ?auto_902448 ?auto_902450 ) ) ( not ( = ?auto_902449 ?auto_902450 ) ) ( ON ?auto_902448 ?auto_902449 ) ( CLEAR ?auto_902446 ) ( ON ?auto_902447 ?auto_902448 ) ( CLEAR ?auto_902447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_902435 ?auto_902436 ?auto_902437 ?auto_902438 ?auto_902439 ?auto_902440 ?auto_902441 ?auto_902442 ?auto_902443 ?auto_902444 ?auto_902445 ?auto_902446 ?auto_902447 )
      ( MAKE-15PILE ?auto_902435 ?auto_902436 ?auto_902437 ?auto_902438 ?auto_902439 ?auto_902440 ?auto_902441 ?auto_902442 ?auto_902443 ?auto_902444 ?auto_902445 ?auto_902446 ?auto_902447 ?auto_902448 ?auto_902449 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_902497 - BLOCK
      ?auto_902498 - BLOCK
      ?auto_902499 - BLOCK
      ?auto_902500 - BLOCK
      ?auto_902501 - BLOCK
      ?auto_902502 - BLOCK
      ?auto_902503 - BLOCK
      ?auto_902504 - BLOCK
      ?auto_902505 - BLOCK
      ?auto_902506 - BLOCK
      ?auto_902507 - BLOCK
      ?auto_902508 - BLOCK
      ?auto_902509 - BLOCK
      ?auto_902510 - BLOCK
      ?auto_902511 - BLOCK
    )
    :vars
    (
      ?auto_902512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902511 ?auto_902512 ) ( ON-TABLE ?auto_902497 ) ( ON ?auto_902498 ?auto_902497 ) ( ON ?auto_902499 ?auto_902498 ) ( ON ?auto_902500 ?auto_902499 ) ( ON ?auto_902501 ?auto_902500 ) ( ON ?auto_902502 ?auto_902501 ) ( ON ?auto_902503 ?auto_902502 ) ( ON ?auto_902504 ?auto_902503 ) ( ON ?auto_902505 ?auto_902504 ) ( ON ?auto_902506 ?auto_902505 ) ( ON ?auto_902507 ?auto_902506 ) ( not ( = ?auto_902497 ?auto_902498 ) ) ( not ( = ?auto_902497 ?auto_902499 ) ) ( not ( = ?auto_902497 ?auto_902500 ) ) ( not ( = ?auto_902497 ?auto_902501 ) ) ( not ( = ?auto_902497 ?auto_902502 ) ) ( not ( = ?auto_902497 ?auto_902503 ) ) ( not ( = ?auto_902497 ?auto_902504 ) ) ( not ( = ?auto_902497 ?auto_902505 ) ) ( not ( = ?auto_902497 ?auto_902506 ) ) ( not ( = ?auto_902497 ?auto_902507 ) ) ( not ( = ?auto_902497 ?auto_902508 ) ) ( not ( = ?auto_902497 ?auto_902509 ) ) ( not ( = ?auto_902497 ?auto_902510 ) ) ( not ( = ?auto_902497 ?auto_902511 ) ) ( not ( = ?auto_902497 ?auto_902512 ) ) ( not ( = ?auto_902498 ?auto_902499 ) ) ( not ( = ?auto_902498 ?auto_902500 ) ) ( not ( = ?auto_902498 ?auto_902501 ) ) ( not ( = ?auto_902498 ?auto_902502 ) ) ( not ( = ?auto_902498 ?auto_902503 ) ) ( not ( = ?auto_902498 ?auto_902504 ) ) ( not ( = ?auto_902498 ?auto_902505 ) ) ( not ( = ?auto_902498 ?auto_902506 ) ) ( not ( = ?auto_902498 ?auto_902507 ) ) ( not ( = ?auto_902498 ?auto_902508 ) ) ( not ( = ?auto_902498 ?auto_902509 ) ) ( not ( = ?auto_902498 ?auto_902510 ) ) ( not ( = ?auto_902498 ?auto_902511 ) ) ( not ( = ?auto_902498 ?auto_902512 ) ) ( not ( = ?auto_902499 ?auto_902500 ) ) ( not ( = ?auto_902499 ?auto_902501 ) ) ( not ( = ?auto_902499 ?auto_902502 ) ) ( not ( = ?auto_902499 ?auto_902503 ) ) ( not ( = ?auto_902499 ?auto_902504 ) ) ( not ( = ?auto_902499 ?auto_902505 ) ) ( not ( = ?auto_902499 ?auto_902506 ) ) ( not ( = ?auto_902499 ?auto_902507 ) ) ( not ( = ?auto_902499 ?auto_902508 ) ) ( not ( = ?auto_902499 ?auto_902509 ) ) ( not ( = ?auto_902499 ?auto_902510 ) ) ( not ( = ?auto_902499 ?auto_902511 ) ) ( not ( = ?auto_902499 ?auto_902512 ) ) ( not ( = ?auto_902500 ?auto_902501 ) ) ( not ( = ?auto_902500 ?auto_902502 ) ) ( not ( = ?auto_902500 ?auto_902503 ) ) ( not ( = ?auto_902500 ?auto_902504 ) ) ( not ( = ?auto_902500 ?auto_902505 ) ) ( not ( = ?auto_902500 ?auto_902506 ) ) ( not ( = ?auto_902500 ?auto_902507 ) ) ( not ( = ?auto_902500 ?auto_902508 ) ) ( not ( = ?auto_902500 ?auto_902509 ) ) ( not ( = ?auto_902500 ?auto_902510 ) ) ( not ( = ?auto_902500 ?auto_902511 ) ) ( not ( = ?auto_902500 ?auto_902512 ) ) ( not ( = ?auto_902501 ?auto_902502 ) ) ( not ( = ?auto_902501 ?auto_902503 ) ) ( not ( = ?auto_902501 ?auto_902504 ) ) ( not ( = ?auto_902501 ?auto_902505 ) ) ( not ( = ?auto_902501 ?auto_902506 ) ) ( not ( = ?auto_902501 ?auto_902507 ) ) ( not ( = ?auto_902501 ?auto_902508 ) ) ( not ( = ?auto_902501 ?auto_902509 ) ) ( not ( = ?auto_902501 ?auto_902510 ) ) ( not ( = ?auto_902501 ?auto_902511 ) ) ( not ( = ?auto_902501 ?auto_902512 ) ) ( not ( = ?auto_902502 ?auto_902503 ) ) ( not ( = ?auto_902502 ?auto_902504 ) ) ( not ( = ?auto_902502 ?auto_902505 ) ) ( not ( = ?auto_902502 ?auto_902506 ) ) ( not ( = ?auto_902502 ?auto_902507 ) ) ( not ( = ?auto_902502 ?auto_902508 ) ) ( not ( = ?auto_902502 ?auto_902509 ) ) ( not ( = ?auto_902502 ?auto_902510 ) ) ( not ( = ?auto_902502 ?auto_902511 ) ) ( not ( = ?auto_902502 ?auto_902512 ) ) ( not ( = ?auto_902503 ?auto_902504 ) ) ( not ( = ?auto_902503 ?auto_902505 ) ) ( not ( = ?auto_902503 ?auto_902506 ) ) ( not ( = ?auto_902503 ?auto_902507 ) ) ( not ( = ?auto_902503 ?auto_902508 ) ) ( not ( = ?auto_902503 ?auto_902509 ) ) ( not ( = ?auto_902503 ?auto_902510 ) ) ( not ( = ?auto_902503 ?auto_902511 ) ) ( not ( = ?auto_902503 ?auto_902512 ) ) ( not ( = ?auto_902504 ?auto_902505 ) ) ( not ( = ?auto_902504 ?auto_902506 ) ) ( not ( = ?auto_902504 ?auto_902507 ) ) ( not ( = ?auto_902504 ?auto_902508 ) ) ( not ( = ?auto_902504 ?auto_902509 ) ) ( not ( = ?auto_902504 ?auto_902510 ) ) ( not ( = ?auto_902504 ?auto_902511 ) ) ( not ( = ?auto_902504 ?auto_902512 ) ) ( not ( = ?auto_902505 ?auto_902506 ) ) ( not ( = ?auto_902505 ?auto_902507 ) ) ( not ( = ?auto_902505 ?auto_902508 ) ) ( not ( = ?auto_902505 ?auto_902509 ) ) ( not ( = ?auto_902505 ?auto_902510 ) ) ( not ( = ?auto_902505 ?auto_902511 ) ) ( not ( = ?auto_902505 ?auto_902512 ) ) ( not ( = ?auto_902506 ?auto_902507 ) ) ( not ( = ?auto_902506 ?auto_902508 ) ) ( not ( = ?auto_902506 ?auto_902509 ) ) ( not ( = ?auto_902506 ?auto_902510 ) ) ( not ( = ?auto_902506 ?auto_902511 ) ) ( not ( = ?auto_902506 ?auto_902512 ) ) ( not ( = ?auto_902507 ?auto_902508 ) ) ( not ( = ?auto_902507 ?auto_902509 ) ) ( not ( = ?auto_902507 ?auto_902510 ) ) ( not ( = ?auto_902507 ?auto_902511 ) ) ( not ( = ?auto_902507 ?auto_902512 ) ) ( not ( = ?auto_902508 ?auto_902509 ) ) ( not ( = ?auto_902508 ?auto_902510 ) ) ( not ( = ?auto_902508 ?auto_902511 ) ) ( not ( = ?auto_902508 ?auto_902512 ) ) ( not ( = ?auto_902509 ?auto_902510 ) ) ( not ( = ?auto_902509 ?auto_902511 ) ) ( not ( = ?auto_902509 ?auto_902512 ) ) ( not ( = ?auto_902510 ?auto_902511 ) ) ( not ( = ?auto_902510 ?auto_902512 ) ) ( not ( = ?auto_902511 ?auto_902512 ) ) ( ON ?auto_902510 ?auto_902511 ) ( ON ?auto_902509 ?auto_902510 ) ( CLEAR ?auto_902507 ) ( ON ?auto_902508 ?auto_902509 ) ( CLEAR ?auto_902508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_902497 ?auto_902498 ?auto_902499 ?auto_902500 ?auto_902501 ?auto_902502 ?auto_902503 ?auto_902504 ?auto_902505 ?auto_902506 ?auto_902507 ?auto_902508 )
      ( MAKE-15PILE ?auto_902497 ?auto_902498 ?auto_902499 ?auto_902500 ?auto_902501 ?auto_902502 ?auto_902503 ?auto_902504 ?auto_902505 ?auto_902506 ?auto_902507 ?auto_902508 ?auto_902509 ?auto_902510 ?auto_902511 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_902559 - BLOCK
      ?auto_902560 - BLOCK
      ?auto_902561 - BLOCK
      ?auto_902562 - BLOCK
      ?auto_902563 - BLOCK
      ?auto_902564 - BLOCK
      ?auto_902565 - BLOCK
      ?auto_902566 - BLOCK
      ?auto_902567 - BLOCK
      ?auto_902568 - BLOCK
      ?auto_902569 - BLOCK
      ?auto_902570 - BLOCK
      ?auto_902571 - BLOCK
      ?auto_902572 - BLOCK
      ?auto_902573 - BLOCK
    )
    :vars
    (
      ?auto_902574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902573 ?auto_902574 ) ( ON-TABLE ?auto_902559 ) ( ON ?auto_902560 ?auto_902559 ) ( ON ?auto_902561 ?auto_902560 ) ( ON ?auto_902562 ?auto_902561 ) ( ON ?auto_902563 ?auto_902562 ) ( ON ?auto_902564 ?auto_902563 ) ( ON ?auto_902565 ?auto_902564 ) ( ON ?auto_902566 ?auto_902565 ) ( ON ?auto_902567 ?auto_902566 ) ( ON ?auto_902568 ?auto_902567 ) ( not ( = ?auto_902559 ?auto_902560 ) ) ( not ( = ?auto_902559 ?auto_902561 ) ) ( not ( = ?auto_902559 ?auto_902562 ) ) ( not ( = ?auto_902559 ?auto_902563 ) ) ( not ( = ?auto_902559 ?auto_902564 ) ) ( not ( = ?auto_902559 ?auto_902565 ) ) ( not ( = ?auto_902559 ?auto_902566 ) ) ( not ( = ?auto_902559 ?auto_902567 ) ) ( not ( = ?auto_902559 ?auto_902568 ) ) ( not ( = ?auto_902559 ?auto_902569 ) ) ( not ( = ?auto_902559 ?auto_902570 ) ) ( not ( = ?auto_902559 ?auto_902571 ) ) ( not ( = ?auto_902559 ?auto_902572 ) ) ( not ( = ?auto_902559 ?auto_902573 ) ) ( not ( = ?auto_902559 ?auto_902574 ) ) ( not ( = ?auto_902560 ?auto_902561 ) ) ( not ( = ?auto_902560 ?auto_902562 ) ) ( not ( = ?auto_902560 ?auto_902563 ) ) ( not ( = ?auto_902560 ?auto_902564 ) ) ( not ( = ?auto_902560 ?auto_902565 ) ) ( not ( = ?auto_902560 ?auto_902566 ) ) ( not ( = ?auto_902560 ?auto_902567 ) ) ( not ( = ?auto_902560 ?auto_902568 ) ) ( not ( = ?auto_902560 ?auto_902569 ) ) ( not ( = ?auto_902560 ?auto_902570 ) ) ( not ( = ?auto_902560 ?auto_902571 ) ) ( not ( = ?auto_902560 ?auto_902572 ) ) ( not ( = ?auto_902560 ?auto_902573 ) ) ( not ( = ?auto_902560 ?auto_902574 ) ) ( not ( = ?auto_902561 ?auto_902562 ) ) ( not ( = ?auto_902561 ?auto_902563 ) ) ( not ( = ?auto_902561 ?auto_902564 ) ) ( not ( = ?auto_902561 ?auto_902565 ) ) ( not ( = ?auto_902561 ?auto_902566 ) ) ( not ( = ?auto_902561 ?auto_902567 ) ) ( not ( = ?auto_902561 ?auto_902568 ) ) ( not ( = ?auto_902561 ?auto_902569 ) ) ( not ( = ?auto_902561 ?auto_902570 ) ) ( not ( = ?auto_902561 ?auto_902571 ) ) ( not ( = ?auto_902561 ?auto_902572 ) ) ( not ( = ?auto_902561 ?auto_902573 ) ) ( not ( = ?auto_902561 ?auto_902574 ) ) ( not ( = ?auto_902562 ?auto_902563 ) ) ( not ( = ?auto_902562 ?auto_902564 ) ) ( not ( = ?auto_902562 ?auto_902565 ) ) ( not ( = ?auto_902562 ?auto_902566 ) ) ( not ( = ?auto_902562 ?auto_902567 ) ) ( not ( = ?auto_902562 ?auto_902568 ) ) ( not ( = ?auto_902562 ?auto_902569 ) ) ( not ( = ?auto_902562 ?auto_902570 ) ) ( not ( = ?auto_902562 ?auto_902571 ) ) ( not ( = ?auto_902562 ?auto_902572 ) ) ( not ( = ?auto_902562 ?auto_902573 ) ) ( not ( = ?auto_902562 ?auto_902574 ) ) ( not ( = ?auto_902563 ?auto_902564 ) ) ( not ( = ?auto_902563 ?auto_902565 ) ) ( not ( = ?auto_902563 ?auto_902566 ) ) ( not ( = ?auto_902563 ?auto_902567 ) ) ( not ( = ?auto_902563 ?auto_902568 ) ) ( not ( = ?auto_902563 ?auto_902569 ) ) ( not ( = ?auto_902563 ?auto_902570 ) ) ( not ( = ?auto_902563 ?auto_902571 ) ) ( not ( = ?auto_902563 ?auto_902572 ) ) ( not ( = ?auto_902563 ?auto_902573 ) ) ( not ( = ?auto_902563 ?auto_902574 ) ) ( not ( = ?auto_902564 ?auto_902565 ) ) ( not ( = ?auto_902564 ?auto_902566 ) ) ( not ( = ?auto_902564 ?auto_902567 ) ) ( not ( = ?auto_902564 ?auto_902568 ) ) ( not ( = ?auto_902564 ?auto_902569 ) ) ( not ( = ?auto_902564 ?auto_902570 ) ) ( not ( = ?auto_902564 ?auto_902571 ) ) ( not ( = ?auto_902564 ?auto_902572 ) ) ( not ( = ?auto_902564 ?auto_902573 ) ) ( not ( = ?auto_902564 ?auto_902574 ) ) ( not ( = ?auto_902565 ?auto_902566 ) ) ( not ( = ?auto_902565 ?auto_902567 ) ) ( not ( = ?auto_902565 ?auto_902568 ) ) ( not ( = ?auto_902565 ?auto_902569 ) ) ( not ( = ?auto_902565 ?auto_902570 ) ) ( not ( = ?auto_902565 ?auto_902571 ) ) ( not ( = ?auto_902565 ?auto_902572 ) ) ( not ( = ?auto_902565 ?auto_902573 ) ) ( not ( = ?auto_902565 ?auto_902574 ) ) ( not ( = ?auto_902566 ?auto_902567 ) ) ( not ( = ?auto_902566 ?auto_902568 ) ) ( not ( = ?auto_902566 ?auto_902569 ) ) ( not ( = ?auto_902566 ?auto_902570 ) ) ( not ( = ?auto_902566 ?auto_902571 ) ) ( not ( = ?auto_902566 ?auto_902572 ) ) ( not ( = ?auto_902566 ?auto_902573 ) ) ( not ( = ?auto_902566 ?auto_902574 ) ) ( not ( = ?auto_902567 ?auto_902568 ) ) ( not ( = ?auto_902567 ?auto_902569 ) ) ( not ( = ?auto_902567 ?auto_902570 ) ) ( not ( = ?auto_902567 ?auto_902571 ) ) ( not ( = ?auto_902567 ?auto_902572 ) ) ( not ( = ?auto_902567 ?auto_902573 ) ) ( not ( = ?auto_902567 ?auto_902574 ) ) ( not ( = ?auto_902568 ?auto_902569 ) ) ( not ( = ?auto_902568 ?auto_902570 ) ) ( not ( = ?auto_902568 ?auto_902571 ) ) ( not ( = ?auto_902568 ?auto_902572 ) ) ( not ( = ?auto_902568 ?auto_902573 ) ) ( not ( = ?auto_902568 ?auto_902574 ) ) ( not ( = ?auto_902569 ?auto_902570 ) ) ( not ( = ?auto_902569 ?auto_902571 ) ) ( not ( = ?auto_902569 ?auto_902572 ) ) ( not ( = ?auto_902569 ?auto_902573 ) ) ( not ( = ?auto_902569 ?auto_902574 ) ) ( not ( = ?auto_902570 ?auto_902571 ) ) ( not ( = ?auto_902570 ?auto_902572 ) ) ( not ( = ?auto_902570 ?auto_902573 ) ) ( not ( = ?auto_902570 ?auto_902574 ) ) ( not ( = ?auto_902571 ?auto_902572 ) ) ( not ( = ?auto_902571 ?auto_902573 ) ) ( not ( = ?auto_902571 ?auto_902574 ) ) ( not ( = ?auto_902572 ?auto_902573 ) ) ( not ( = ?auto_902572 ?auto_902574 ) ) ( not ( = ?auto_902573 ?auto_902574 ) ) ( ON ?auto_902572 ?auto_902573 ) ( ON ?auto_902571 ?auto_902572 ) ( ON ?auto_902570 ?auto_902571 ) ( CLEAR ?auto_902568 ) ( ON ?auto_902569 ?auto_902570 ) ( CLEAR ?auto_902569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_902559 ?auto_902560 ?auto_902561 ?auto_902562 ?auto_902563 ?auto_902564 ?auto_902565 ?auto_902566 ?auto_902567 ?auto_902568 ?auto_902569 )
      ( MAKE-15PILE ?auto_902559 ?auto_902560 ?auto_902561 ?auto_902562 ?auto_902563 ?auto_902564 ?auto_902565 ?auto_902566 ?auto_902567 ?auto_902568 ?auto_902569 ?auto_902570 ?auto_902571 ?auto_902572 ?auto_902573 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_902621 - BLOCK
      ?auto_902622 - BLOCK
      ?auto_902623 - BLOCK
      ?auto_902624 - BLOCK
      ?auto_902625 - BLOCK
      ?auto_902626 - BLOCK
      ?auto_902627 - BLOCK
      ?auto_902628 - BLOCK
      ?auto_902629 - BLOCK
      ?auto_902630 - BLOCK
      ?auto_902631 - BLOCK
      ?auto_902632 - BLOCK
      ?auto_902633 - BLOCK
      ?auto_902634 - BLOCK
      ?auto_902635 - BLOCK
    )
    :vars
    (
      ?auto_902636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902635 ?auto_902636 ) ( ON-TABLE ?auto_902621 ) ( ON ?auto_902622 ?auto_902621 ) ( ON ?auto_902623 ?auto_902622 ) ( ON ?auto_902624 ?auto_902623 ) ( ON ?auto_902625 ?auto_902624 ) ( ON ?auto_902626 ?auto_902625 ) ( ON ?auto_902627 ?auto_902626 ) ( ON ?auto_902628 ?auto_902627 ) ( ON ?auto_902629 ?auto_902628 ) ( not ( = ?auto_902621 ?auto_902622 ) ) ( not ( = ?auto_902621 ?auto_902623 ) ) ( not ( = ?auto_902621 ?auto_902624 ) ) ( not ( = ?auto_902621 ?auto_902625 ) ) ( not ( = ?auto_902621 ?auto_902626 ) ) ( not ( = ?auto_902621 ?auto_902627 ) ) ( not ( = ?auto_902621 ?auto_902628 ) ) ( not ( = ?auto_902621 ?auto_902629 ) ) ( not ( = ?auto_902621 ?auto_902630 ) ) ( not ( = ?auto_902621 ?auto_902631 ) ) ( not ( = ?auto_902621 ?auto_902632 ) ) ( not ( = ?auto_902621 ?auto_902633 ) ) ( not ( = ?auto_902621 ?auto_902634 ) ) ( not ( = ?auto_902621 ?auto_902635 ) ) ( not ( = ?auto_902621 ?auto_902636 ) ) ( not ( = ?auto_902622 ?auto_902623 ) ) ( not ( = ?auto_902622 ?auto_902624 ) ) ( not ( = ?auto_902622 ?auto_902625 ) ) ( not ( = ?auto_902622 ?auto_902626 ) ) ( not ( = ?auto_902622 ?auto_902627 ) ) ( not ( = ?auto_902622 ?auto_902628 ) ) ( not ( = ?auto_902622 ?auto_902629 ) ) ( not ( = ?auto_902622 ?auto_902630 ) ) ( not ( = ?auto_902622 ?auto_902631 ) ) ( not ( = ?auto_902622 ?auto_902632 ) ) ( not ( = ?auto_902622 ?auto_902633 ) ) ( not ( = ?auto_902622 ?auto_902634 ) ) ( not ( = ?auto_902622 ?auto_902635 ) ) ( not ( = ?auto_902622 ?auto_902636 ) ) ( not ( = ?auto_902623 ?auto_902624 ) ) ( not ( = ?auto_902623 ?auto_902625 ) ) ( not ( = ?auto_902623 ?auto_902626 ) ) ( not ( = ?auto_902623 ?auto_902627 ) ) ( not ( = ?auto_902623 ?auto_902628 ) ) ( not ( = ?auto_902623 ?auto_902629 ) ) ( not ( = ?auto_902623 ?auto_902630 ) ) ( not ( = ?auto_902623 ?auto_902631 ) ) ( not ( = ?auto_902623 ?auto_902632 ) ) ( not ( = ?auto_902623 ?auto_902633 ) ) ( not ( = ?auto_902623 ?auto_902634 ) ) ( not ( = ?auto_902623 ?auto_902635 ) ) ( not ( = ?auto_902623 ?auto_902636 ) ) ( not ( = ?auto_902624 ?auto_902625 ) ) ( not ( = ?auto_902624 ?auto_902626 ) ) ( not ( = ?auto_902624 ?auto_902627 ) ) ( not ( = ?auto_902624 ?auto_902628 ) ) ( not ( = ?auto_902624 ?auto_902629 ) ) ( not ( = ?auto_902624 ?auto_902630 ) ) ( not ( = ?auto_902624 ?auto_902631 ) ) ( not ( = ?auto_902624 ?auto_902632 ) ) ( not ( = ?auto_902624 ?auto_902633 ) ) ( not ( = ?auto_902624 ?auto_902634 ) ) ( not ( = ?auto_902624 ?auto_902635 ) ) ( not ( = ?auto_902624 ?auto_902636 ) ) ( not ( = ?auto_902625 ?auto_902626 ) ) ( not ( = ?auto_902625 ?auto_902627 ) ) ( not ( = ?auto_902625 ?auto_902628 ) ) ( not ( = ?auto_902625 ?auto_902629 ) ) ( not ( = ?auto_902625 ?auto_902630 ) ) ( not ( = ?auto_902625 ?auto_902631 ) ) ( not ( = ?auto_902625 ?auto_902632 ) ) ( not ( = ?auto_902625 ?auto_902633 ) ) ( not ( = ?auto_902625 ?auto_902634 ) ) ( not ( = ?auto_902625 ?auto_902635 ) ) ( not ( = ?auto_902625 ?auto_902636 ) ) ( not ( = ?auto_902626 ?auto_902627 ) ) ( not ( = ?auto_902626 ?auto_902628 ) ) ( not ( = ?auto_902626 ?auto_902629 ) ) ( not ( = ?auto_902626 ?auto_902630 ) ) ( not ( = ?auto_902626 ?auto_902631 ) ) ( not ( = ?auto_902626 ?auto_902632 ) ) ( not ( = ?auto_902626 ?auto_902633 ) ) ( not ( = ?auto_902626 ?auto_902634 ) ) ( not ( = ?auto_902626 ?auto_902635 ) ) ( not ( = ?auto_902626 ?auto_902636 ) ) ( not ( = ?auto_902627 ?auto_902628 ) ) ( not ( = ?auto_902627 ?auto_902629 ) ) ( not ( = ?auto_902627 ?auto_902630 ) ) ( not ( = ?auto_902627 ?auto_902631 ) ) ( not ( = ?auto_902627 ?auto_902632 ) ) ( not ( = ?auto_902627 ?auto_902633 ) ) ( not ( = ?auto_902627 ?auto_902634 ) ) ( not ( = ?auto_902627 ?auto_902635 ) ) ( not ( = ?auto_902627 ?auto_902636 ) ) ( not ( = ?auto_902628 ?auto_902629 ) ) ( not ( = ?auto_902628 ?auto_902630 ) ) ( not ( = ?auto_902628 ?auto_902631 ) ) ( not ( = ?auto_902628 ?auto_902632 ) ) ( not ( = ?auto_902628 ?auto_902633 ) ) ( not ( = ?auto_902628 ?auto_902634 ) ) ( not ( = ?auto_902628 ?auto_902635 ) ) ( not ( = ?auto_902628 ?auto_902636 ) ) ( not ( = ?auto_902629 ?auto_902630 ) ) ( not ( = ?auto_902629 ?auto_902631 ) ) ( not ( = ?auto_902629 ?auto_902632 ) ) ( not ( = ?auto_902629 ?auto_902633 ) ) ( not ( = ?auto_902629 ?auto_902634 ) ) ( not ( = ?auto_902629 ?auto_902635 ) ) ( not ( = ?auto_902629 ?auto_902636 ) ) ( not ( = ?auto_902630 ?auto_902631 ) ) ( not ( = ?auto_902630 ?auto_902632 ) ) ( not ( = ?auto_902630 ?auto_902633 ) ) ( not ( = ?auto_902630 ?auto_902634 ) ) ( not ( = ?auto_902630 ?auto_902635 ) ) ( not ( = ?auto_902630 ?auto_902636 ) ) ( not ( = ?auto_902631 ?auto_902632 ) ) ( not ( = ?auto_902631 ?auto_902633 ) ) ( not ( = ?auto_902631 ?auto_902634 ) ) ( not ( = ?auto_902631 ?auto_902635 ) ) ( not ( = ?auto_902631 ?auto_902636 ) ) ( not ( = ?auto_902632 ?auto_902633 ) ) ( not ( = ?auto_902632 ?auto_902634 ) ) ( not ( = ?auto_902632 ?auto_902635 ) ) ( not ( = ?auto_902632 ?auto_902636 ) ) ( not ( = ?auto_902633 ?auto_902634 ) ) ( not ( = ?auto_902633 ?auto_902635 ) ) ( not ( = ?auto_902633 ?auto_902636 ) ) ( not ( = ?auto_902634 ?auto_902635 ) ) ( not ( = ?auto_902634 ?auto_902636 ) ) ( not ( = ?auto_902635 ?auto_902636 ) ) ( ON ?auto_902634 ?auto_902635 ) ( ON ?auto_902633 ?auto_902634 ) ( ON ?auto_902632 ?auto_902633 ) ( ON ?auto_902631 ?auto_902632 ) ( CLEAR ?auto_902629 ) ( ON ?auto_902630 ?auto_902631 ) ( CLEAR ?auto_902630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_902621 ?auto_902622 ?auto_902623 ?auto_902624 ?auto_902625 ?auto_902626 ?auto_902627 ?auto_902628 ?auto_902629 ?auto_902630 )
      ( MAKE-15PILE ?auto_902621 ?auto_902622 ?auto_902623 ?auto_902624 ?auto_902625 ?auto_902626 ?auto_902627 ?auto_902628 ?auto_902629 ?auto_902630 ?auto_902631 ?auto_902632 ?auto_902633 ?auto_902634 ?auto_902635 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_902683 - BLOCK
      ?auto_902684 - BLOCK
      ?auto_902685 - BLOCK
      ?auto_902686 - BLOCK
      ?auto_902687 - BLOCK
      ?auto_902688 - BLOCK
      ?auto_902689 - BLOCK
      ?auto_902690 - BLOCK
      ?auto_902691 - BLOCK
      ?auto_902692 - BLOCK
      ?auto_902693 - BLOCK
      ?auto_902694 - BLOCK
      ?auto_902695 - BLOCK
      ?auto_902696 - BLOCK
      ?auto_902697 - BLOCK
    )
    :vars
    (
      ?auto_902698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902697 ?auto_902698 ) ( ON-TABLE ?auto_902683 ) ( ON ?auto_902684 ?auto_902683 ) ( ON ?auto_902685 ?auto_902684 ) ( ON ?auto_902686 ?auto_902685 ) ( ON ?auto_902687 ?auto_902686 ) ( ON ?auto_902688 ?auto_902687 ) ( ON ?auto_902689 ?auto_902688 ) ( ON ?auto_902690 ?auto_902689 ) ( not ( = ?auto_902683 ?auto_902684 ) ) ( not ( = ?auto_902683 ?auto_902685 ) ) ( not ( = ?auto_902683 ?auto_902686 ) ) ( not ( = ?auto_902683 ?auto_902687 ) ) ( not ( = ?auto_902683 ?auto_902688 ) ) ( not ( = ?auto_902683 ?auto_902689 ) ) ( not ( = ?auto_902683 ?auto_902690 ) ) ( not ( = ?auto_902683 ?auto_902691 ) ) ( not ( = ?auto_902683 ?auto_902692 ) ) ( not ( = ?auto_902683 ?auto_902693 ) ) ( not ( = ?auto_902683 ?auto_902694 ) ) ( not ( = ?auto_902683 ?auto_902695 ) ) ( not ( = ?auto_902683 ?auto_902696 ) ) ( not ( = ?auto_902683 ?auto_902697 ) ) ( not ( = ?auto_902683 ?auto_902698 ) ) ( not ( = ?auto_902684 ?auto_902685 ) ) ( not ( = ?auto_902684 ?auto_902686 ) ) ( not ( = ?auto_902684 ?auto_902687 ) ) ( not ( = ?auto_902684 ?auto_902688 ) ) ( not ( = ?auto_902684 ?auto_902689 ) ) ( not ( = ?auto_902684 ?auto_902690 ) ) ( not ( = ?auto_902684 ?auto_902691 ) ) ( not ( = ?auto_902684 ?auto_902692 ) ) ( not ( = ?auto_902684 ?auto_902693 ) ) ( not ( = ?auto_902684 ?auto_902694 ) ) ( not ( = ?auto_902684 ?auto_902695 ) ) ( not ( = ?auto_902684 ?auto_902696 ) ) ( not ( = ?auto_902684 ?auto_902697 ) ) ( not ( = ?auto_902684 ?auto_902698 ) ) ( not ( = ?auto_902685 ?auto_902686 ) ) ( not ( = ?auto_902685 ?auto_902687 ) ) ( not ( = ?auto_902685 ?auto_902688 ) ) ( not ( = ?auto_902685 ?auto_902689 ) ) ( not ( = ?auto_902685 ?auto_902690 ) ) ( not ( = ?auto_902685 ?auto_902691 ) ) ( not ( = ?auto_902685 ?auto_902692 ) ) ( not ( = ?auto_902685 ?auto_902693 ) ) ( not ( = ?auto_902685 ?auto_902694 ) ) ( not ( = ?auto_902685 ?auto_902695 ) ) ( not ( = ?auto_902685 ?auto_902696 ) ) ( not ( = ?auto_902685 ?auto_902697 ) ) ( not ( = ?auto_902685 ?auto_902698 ) ) ( not ( = ?auto_902686 ?auto_902687 ) ) ( not ( = ?auto_902686 ?auto_902688 ) ) ( not ( = ?auto_902686 ?auto_902689 ) ) ( not ( = ?auto_902686 ?auto_902690 ) ) ( not ( = ?auto_902686 ?auto_902691 ) ) ( not ( = ?auto_902686 ?auto_902692 ) ) ( not ( = ?auto_902686 ?auto_902693 ) ) ( not ( = ?auto_902686 ?auto_902694 ) ) ( not ( = ?auto_902686 ?auto_902695 ) ) ( not ( = ?auto_902686 ?auto_902696 ) ) ( not ( = ?auto_902686 ?auto_902697 ) ) ( not ( = ?auto_902686 ?auto_902698 ) ) ( not ( = ?auto_902687 ?auto_902688 ) ) ( not ( = ?auto_902687 ?auto_902689 ) ) ( not ( = ?auto_902687 ?auto_902690 ) ) ( not ( = ?auto_902687 ?auto_902691 ) ) ( not ( = ?auto_902687 ?auto_902692 ) ) ( not ( = ?auto_902687 ?auto_902693 ) ) ( not ( = ?auto_902687 ?auto_902694 ) ) ( not ( = ?auto_902687 ?auto_902695 ) ) ( not ( = ?auto_902687 ?auto_902696 ) ) ( not ( = ?auto_902687 ?auto_902697 ) ) ( not ( = ?auto_902687 ?auto_902698 ) ) ( not ( = ?auto_902688 ?auto_902689 ) ) ( not ( = ?auto_902688 ?auto_902690 ) ) ( not ( = ?auto_902688 ?auto_902691 ) ) ( not ( = ?auto_902688 ?auto_902692 ) ) ( not ( = ?auto_902688 ?auto_902693 ) ) ( not ( = ?auto_902688 ?auto_902694 ) ) ( not ( = ?auto_902688 ?auto_902695 ) ) ( not ( = ?auto_902688 ?auto_902696 ) ) ( not ( = ?auto_902688 ?auto_902697 ) ) ( not ( = ?auto_902688 ?auto_902698 ) ) ( not ( = ?auto_902689 ?auto_902690 ) ) ( not ( = ?auto_902689 ?auto_902691 ) ) ( not ( = ?auto_902689 ?auto_902692 ) ) ( not ( = ?auto_902689 ?auto_902693 ) ) ( not ( = ?auto_902689 ?auto_902694 ) ) ( not ( = ?auto_902689 ?auto_902695 ) ) ( not ( = ?auto_902689 ?auto_902696 ) ) ( not ( = ?auto_902689 ?auto_902697 ) ) ( not ( = ?auto_902689 ?auto_902698 ) ) ( not ( = ?auto_902690 ?auto_902691 ) ) ( not ( = ?auto_902690 ?auto_902692 ) ) ( not ( = ?auto_902690 ?auto_902693 ) ) ( not ( = ?auto_902690 ?auto_902694 ) ) ( not ( = ?auto_902690 ?auto_902695 ) ) ( not ( = ?auto_902690 ?auto_902696 ) ) ( not ( = ?auto_902690 ?auto_902697 ) ) ( not ( = ?auto_902690 ?auto_902698 ) ) ( not ( = ?auto_902691 ?auto_902692 ) ) ( not ( = ?auto_902691 ?auto_902693 ) ) ( not ( = ?auto_902691 ?auto_902694 ) ) ( not ( = ?auto_902691 ?auto_902695 ) ) ( not ( = ?auto_902691 ?auto_902696 ) ) ( not ( = ?auto_902691 ?auto_902697 ) ) ( not ( = ?auto_902691 ?auto_902698 ) ) ( not ( = ?auto_902692 ?auto_902693 ) ) ( not ( = ?auto_902692 ?auto_902694 ) ) ( not ( = ?auto_902692 ?auto_902695 ) ) ( not ( = ?auto_902692 ?auto_902696 ) ) ( not ( = ?auto_902692 ?auto_902697 ) ) ( not ( = ?auto_902692 ?auto_902698 ) ) ( not ( = ?auto_902693 ?auto_902694 ) ) ( not ( = ?auto_902693 ?auto_902695 ) ) ( not ( = ?auto_902693 ?auto_902696 ) ) ( not ( = ?auto_902693 ?auto_902697 ) ) ( not ( = ?auto_902693 ?auto_902698 ) ) ( not ( = ?auto_902694 ?auto_902695 ) ) ( not ( = ?auto_902694 ?auto_902696 ) ) ( not ( = ?auto_902694 ?auto_902697 ) ) ( not ( = ?auto_902694 ?auto_902698 ) ) ( not ( = ?auto_902695 ?auto_902696 ) ) ( not ( = ?auto_902695 ?auto_902697 ) ) ( not ( = ?auto_902695 ?auto_902698 ) ) ( not ( = ?auto_902696 ?auto_902697 ) ) ( not ( = ?auto_902696 ?auto_902698 ) ) ( not ( = ?auto_902697 ?auto_902698 ) ) ( ON ?auto_902696 ?auto_902697 ) ( ON ?auto_902695 ?auto_902696 ) ( ON ?auto_902694 ?auto_902695 ) ( ON ?auto_902693 ?auto_902694 ) ( ON ?auto_902692 ?auto_902693 ) ( CLEAR ?auto_902690 ) ( ON ?auto_902691 ?auto_902692 ) ( CLEAR ?auto_902691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_902683 ?auto_902684 ?auto_902685 ?auto_902686 ?auto_902687 ?auto_902688 ?auto_902689 ?auto_902690 ?auto_902691 )
      ( MAKE-15PILE ?auto_902683 ?auto_902684 ?auto_902685 ?auto_902686 ?auto_902687 ?auto_902688 ?auto_902689 ?auto_902690 ?auto_902691 ?auto_902692 ?auto_902693 ?auto_902694 ?auto_902695 ?auto_902696 ?auto_902697 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_902745 - BLOCK
      ?auto_902746 - BLOCK
      ?auto_902747 - BLOCK
      ?auto_902748 - BLOCK
      ?auto_902749 - BLOCK
      ?auto_902750 - BLOCK
      ?auto_902751 - BLOCK
      ?auto_902752 - BLOCK
      ?auto_902753 - BLOCK
      ?auto_902754 - BLOCK
      ?auto_902755 - BLOCK
      ?auto_902756 - BLOCK
      ?auto_902757 - BLOCK
      ?auto_902758 - BLOCK
      ?auto_902759 - BLOCK
    )
    :vars
    (
      ?auto_902760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902759 ?auto_902760 ) ( ON-TABLE ?auto_902745 ) ( ON ?auto_902746 ?auto_902745 ) ( ON ?auto_902747 ?auto_902746 ) ( ON ?auto_902748 ?auto_902747 ) ( ON ?auto_902749 ?auto_902748 ) ( ON ?auto_902750 ?auto_902749 ) ( ON ?auto_902751 ?auto_902750 ) ( not ( = ?auto_902745 ?auto_902746 ) ) ( not ( = ?auto_902745 ?auto_902747 ) ) ( not ( = ?auto_902745 ?auto_902748 ) ) ( not ( = ?auto_902745 ?auto_902749 ) ) ( not ( = ?auto_902745 ?auto_902750 ) ) ( not ( = ?auto_902745 ?auto_902751 ) ) ( not ( = ?auto_902745 ?auto_902752 ) ) ( not ( = ?auto_902745 ?auto_902753 ) ) ( not ( = ?auto_902745 ?auto_902754 ) ) ( not ( = ?auto_902745 ?auto_902755 ) ) ( not ( = ?auto_902745 ?auto_902756 ) ) ( not ( = ?auto_902745 ?auto_902757 ) ) ( not ( = ?auto_902745 ?auto_902758 ) ) ( not ( = ?auto_902745 ?auto_902759 ) ) ( not ( = ?auto_902745 ?auto_902760 ) ) ( not ( = ?auto_902746 ?auto_902747 ) ) ( not ( = ?auto_902746 ?auto_902748 ) ) ( not ( = ?auto_902746 ?auto_902749 ) ) ( not ( = ?auto_902746 ?auto_902750 ) ) ( not ( = ?auto_902746 ?auto_902751 ) ) ( not ( = ?auto_902746 ?auto_902752 ) ) ( not ( = ?auto_902746 ?auto_902753 ) ) ( not ( = ?auto_902746 ?auto_902754 ) ) ( not ( = ?auto_902746 ?auto_902755 ) ) ( not ( = ?auto_902746 ?auto_902756 ) ) ( not ( = ?auto_902746 ?auto_902757 ) ) ( not ( = ?auto_902746 ?auto_902758 ) ) ( not ( = ?auto_902746 ?auto_902759 ) ) ( not ( = ?auto_902746 ?auto_902760 ) ) ( not ( = ?auto_902747 ?auto_902748 ) ) ( not ( = ?auto_902747 ?auto_902749 ) ) ( not ( = ?auto_902747 ?auto_902750 ) ) ( not ( = ?auto_902747 ?auto_902751 ) ) ( not ( = ?auto_902747 ?auto_902752 ) ) ( not ( = ?auto_902747 ?auto_902753 ) ) ( not ( = ?auto_902747 ?auto_902754 ) ) ( not ( = ?auto_902747 ?auto_902755 ) ) ( not ( = ?auto_902747 ?auto_902756 ) ) ( not ( = ?auto_902747 ?auto_902757 ) ) ( not ( = ?auto_902747 ?auto_902758 ) ) ( not ( = ?auto_902747 ?auto_902759 ) ) ( not ( = ?auto_902747 ?auto_902760 ) ) ( not ( = ?auto_902748 ?auto_902749 ) ) ( not ( = ?auto_902748 ?auto_902750 ) ) ( not ( = ?auto_902748 ?auto_902751 ) ) ( not ( = ?auto_902748 ?auto_902752 ) ) ( not ( = ?auto_902748 ?auto_902753 ) ) ( not ( = ?auto_902748 ?auto_902754 ) ) ( not ( = ?auto_902748 ?auto_902755 ) ) ( not ( = ?auto_902748 ?auto_902756 ) ) ( not ( = ?auto_902748 ?auto_902757 ) ) ( not ( = ?auto_902748 ?auto_902758 ) ) ( not ( = ?auto_902748 ?auto_902759 ) ) ( not ( = ?auto_902748 ?auto_902760 ) ) ( not ( = ?auto_902749 ?auto_902750 ) ) ( not ( = ?auto_902749 ?auto_902751 ) ) ( not ( = ?auto_902749 ?auto_902752 ) ) ( not ( = ?auto_902749 ?auto_902753 ) ) ( not ( = ?auto_902749 ?auto_902754 ) ) ( not ( = ?auto_902749 ?auto_902755 ) ) ( not ( = ?auto_902749 ?auto_902756 ) ) ( not ( = ?auto_902749 ?auto_902757 ) ) ( not ( = ?auto_902749 ?auto_902758 ) ) ( not ( = ?auto_902749 ?auto_902759 ) ) ( not ( = ?auto_902749 ?auto_902760 ) ) ( not ( = ?auto_902750 ?auto_902751 ) ) ( not ( = ?auto_902750 ?auto_902752 ) ) ( not ( = ?auto_902750 ?auto_902753 ) ) ( not ( = ?auto_902750 ?auto_902754 ) ) ( not ( = ?auto_902750 ?auto_902755 ) ) ( not ( = ?auto_902750 ?auto_902756 ) ) ( not ( = ?auto_902750 ?auto_902757 ) ) ( not ( = ?auto_902750 ?auto_902758 ) ) ( not ( = ?auto_902750 ?auto_902759 ) ) ( not ( = ?auto_902750 ?auto_902760 ) ) ( not ( = ?auto_902751 ?auto_902752 ) ) ( not ( = ?auto_902751 ?auto_902753 ) ) ( not ( = ?auto_902751 ?auto_902754 ) ) ( not ( = ?auto_902751 ?auto_902755 ) ) ( not ( = ?auto_902751 ?auto_902756 ) ) ( not ( = ?auto_902751 ?auto_902757 ) ) ( not ( = ?auto_902751 ?auto_902758 ) ) ( not ( = ?auto_902751 ?auto_902759 ) ) ( not ( = ?auto_902751 ?auto_902760 ) ) ( not ( = ?auto_902752 ?auto_902753 ) ) ( not ( = ?auto_902752 ?auto_902754 ) ) ( not ( = ?auto_902752 ?auto_902755 ) ) ( not ( = ?auto_902752 ?auto_902756 ) ) ( not ( = ?auto_902752 ?auto_902757 ) ) ( not ( = ?auto_902752 ?auto_902758 ) ) ( not ( = ?auto_902752 ?auto_902759 ) ) ( not ( = ?auto_902752 ?auto_902760 ) ) ( not ( = ?auto_902753 ?auto_902754 ) ) ( not ( = ?auto_902753 ?auto_902755 ) ) ( not ( = ?auto_902753 ?auto_902756 ) ) ( not ( = ?auto_902753 ?auto_902757 ) ) ( not ( = ?auto_902753 ?auto_902758 ) ) ( not ( = ?auto_902753 ?auto_902759 ) ) ( not ( = ?auto_902753 ?auto_902760 ) ) ( not ( = ?auto_902754 ?auto_902755 ) ) ( not ( = ?auto_902754 ?auto_902756 ) ) ( not ( = ?auto_902754 ?auto_902757 ) ) ( not ( = ?auto_902754 ?auto_902758 ) ) ( not ( = ?auto_902754 ?auto_902759 ) ) ( not ( = ?auto_902754 ?auto_902760 ) ) ( not ( = ?auto_902755 ?auto_902756 ) ) ( not ( = ?auto_902755 ?auto_902757 ) ) ( not ( = ?auto_902755 ?auto_902758 ) ) ( not ( = ?auto_902755 ?auto_902759 ) ) ( not ( = ?auto_902755 ?auto_902760 ) ) ( not ( = ?auto_902756 ?auto_902757 ) ) ( not ( = ?auto_902756 ?auto_902758 ) ) ( not ( = ?auto_902756 ?auto_902759 ) ) ( not ( = ?auto_902756 ?auto_902760 ) ) ( not ( = ?auto_902757 ?auto_902758 ) ) ( not ( = ?auto_902757 ?auto_902759 ) ) ( not ( = ?auto_902757 ?auto_902760 ) ) ( not ( = ?auto_902758 ?auto_902759 ) ) ( not ( = ?auto_902758 ?auto_902760 ) ) ( not ( = ?auto_902759 ?auto_902760 ) ) ( ON ?auto_902758 ?auto_902759 ) ( ON ?auto_902757 ?auto_902758 ) ( ON ?auto_902756 ?auto_902757 ) ( ON ?auto_902755 ?auto_902756 ) ( ON ?auto_902754 ?auto_902755 ) ( ON ?auto_902753 ?auto_902754 ) ( CLEAR ?auto_902751 ) ( ON ?auto_902752 ?auto_902753 ) ( CLEAR ?auto_902752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_902745 ?auto_902746 ?auto_902747 ?auto_902748 ?auto_902749 ?auto_902750 ?auto_902751 ?auto_902752 )
      ( MAKE-15PILE ?auto_902745 ?auto_902746 ?auto_902747 ?auto_902748 ?auto_902749 ?auto_902750 ?auto_902751 ?auto_902752 ?auto_902753 ?auto_902754 ?auto_902755 ?auto_902756 ?auto_902757 ?auto_902758 ?auto_902759 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_902807 - BLOCK
      ?auto_902808 - BLOCK
      ?auto_902809 - BLOCK
      ?auto_902810 - BLOCK
      ?auto_902811 - BLOCK
      ?auto_902812 - BLOCK
      ?auto_902813 - BLOCK
      ?auto_902814 - BLOCK
      ?auto_902815 - BLOCK
      ?auto_902816 - BLOCK
      ?auto_902817 - BLOCK
      ?auto_902818 - BLOCK
      ?auto_902819 - BLOCK
      ?auto_902820 - BLOCK
      ?auto_902821 - BLOCK
    )
    :vars
    (
      ?auto_902822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902821 ?auto_902822 ) ( ON-TABLE ?auto_902807 ) ( ON ?auto_902808 ?auto_902807 ) ( ON ?auto_902809 ?auto_902808 ) ( ON ?auto_902810 ?auto_902809 ) ( ON ?auto_902811 ?auto_902810 ) ( ON ?auto_902812 ?auto_902811 ) ( not ( = ?auto_902807 ?auto_902808 ) ) ( not ( = ?auto_902807 ?auto_902809 ) ) ( not ( = ?auto_902807 ?auto_902810 ) ) ( not ( = ?auto_902807 ?auto_902811 ) ) ( not ( = ?auto_902807 ?auto_902812 ) ) ( not ( = ?auto_902807 ?auto_902813 ) ) ( not ( = ?auto_902807 ?auto_902814 ) ) ( not ( = ?auto_902807 ?auto_902815 ) ) ( not ( = ?auto_902807 ?auto_902816 ) ) ( not ( = ?auto_902807 ?auto_902817 ) ) ( not ( = ?auto_902807 ?auto_902818 ) ) ( not ( = ?auto_902807 ?auto_902819 ) ) ( not ( = ?auto_902807 ?auto_902820 ) ) ( not ( = ?auto_902807 ?auto_902821 ) ) ( not ( = ?auto_902807 ?auto_902822 ) ) ( not ( = ?auto_902808 ?auto_902809 ) ) ( not ( = ?auto_902808 ?auto_902810 ) ) ( not ( = ?auto_902808 ?auto_902811 ) ) ( not ( = ?auto_902808 ?auto_902812 ) ) ( not ( = ?auto_902808 ?auto_902813 ) ) ( not ( = ?auto_902808 ?auto_902814 ) ) ( not ( = ?auto_902808 ?auto_902815 ) ) ( not ( = ?auto_902808 ?auto_902816 ) ) ( not ( = ?auto_902808 ?auto_902817 ) ) ( not ( = ?auto_902808 ?auto_902818 ) ) ( not ( = ?auto_902808 ?auto_902819 ) ) ( not ( = ?auto_902808 ?auto_902820 ) ) ( not ( = ?auto_902808 ?auto_902821 ) ) ( not ( = ?auto_902808 ?auto_902822 ) ) ( not ( = ?auto_902809 ?auto_902810 ) ) ( not ( = ?auto_902809 ?auto_902811 ) ) ( not ( = ?auto_902809 ?auto_902812 ) ) ( not ( = ?auto_902809 ?auto_902813 ) ) ( not ( = ?auto_902809 ?auto_902814 ) ) ( not ( = ?auto_902809 ?auto_902815 ) ) ( not ( = ?auto_902809 ?auto_902816 ) ) ( not ( = ?auto_902809 ?auto_902817 ) ) ( not ( = ?auto_902809 ?auto_902818 ) ) ( not ( = ?auto_902809 ?auto_902819 ) ) ( not ( = ?auto_902809 ?auto_902820 ) ) ( not ( = ?auto_902809 ?auto_902821 ) ) ( not ( = ?auto_902809 ?auto_902822 ) ) ( not ( = ?auto_902810 ?auto_902811 ) ) ( not ( = ?auto_902810 ?auto_902812 ) ) ( not ( = ?auto_902810 ?auto_902813 ) ) ( not ( = ?auto_902810 ?auto_902814 ) ) ( not ( = ?auto_902810 ?auto_902815 ) ) ( not ( = ?auto_902810 ?auto_902816 ) ) ( not ( = ?auto_902810 ?auto_902817 ) ) ( not ( = ?auto_902810 ?auto_902818 ) ) ( not ( = ?auto_902810 ?auto_902819 ) ) ( not ( = ?auto_902810 ?auto_902820 ) ) ( not ( = ?auto_902810 ?auto_902821 ) ) ( not ( = ?auto_902810 ?auto_902822 ) ) ( not ( = ?auto_902811 ?auto_902812 ) ) ( not ( = ?auto_902811 ?auto_902813 ) ) ( not ( = ?auto_902811 ?auto_902814 ) ) ( not ( = ?auto_902811 ?auto_902815 ) ) ( not ( = ?auto_902811 ?auto_902816 ) ) ( not ( = ?auto_902811 ?auto_902817 ) ) ( not ( = ?auto_902811 ?auto_902818 ) ) ( not ( = ?auto_902811 ?auto_902819 ) ) ( not ( = ?auto_902811 ?auto_902820 ) ) ( not ( = ?auto_902811 ?auto_902821 ) ) ( not ( = ?auto_902811 ?auto_902822 ) ) ( not ( = ?auto_902812 ?auto_902813 ) ) ( not ( = ?auto_902812 ?auto_902814 ) ) ( not ( = ?auto_902812 ?auto_902815 ) ) ( not ( = ?auto_902812 ?auto_902816 ) ) ( not ( = ?auto_902812 ?auto_902817 ) ) ( not ( = ?auto_902812 ?auto_902818 ) ) ( not ( = ?auto_902812 ?auto_902819 ) ) ( not ( = ?auto_902812 ?auto_902820 ) ) ( not ( = ?auto_902812 ?auto_902821 ) ) ( not ( = ?auto_902812 ?auto_902822 ) ) ( not ( = ?auto_902813 ?auto_902814 ) ) ( not ( = ?auto_902813 ?auto_902815 ) ) ( not ( = ?auto_902813 ?auto_902816 ) ) ( not ( = ?auto_902813 ?auto_902817 ) ) ( not ( = ?auto_902813 ?auto_902818 ) ) ( not ( = ?auto_902813 ?auto_902819 ) ) ( not ( = ?auto_902813 ?auto_902820 ) ) ( not ( = ?auto_902813 ?auto_902821 ) ) ( not ( = ?auto_902813 ?auto_902822 ) ) ( not ( = ?auto_902814 ?auto_902815 ) ) ( not ( = ?auto_902814 ?auto_902816 ) ) ( not ( = ?auto_902814 ?auto_902817 ) ) ( not ( = ?auto_902814 ?auto_902818 ) ) ( not ( = ?auto_902814 ?auto_902819 ) ) ( not ( = ?auto_902814 ?auto_902820 ) ) ( not ( = ?auto_902814 ?auto_902821 ) ) ( not ( = ?auto_902814 ?auto_902822 ) ) ( not ( = ?auto_902815 ?auto_902816 ) ) ( not ( = ?auto_902815 ?auto_902817 ) ) ( not ( = ?auto_902815 ?auto_902818 ) ) ( not ( = ?auto_902815 ?auto_902819 ) ) ( not ( = ?auto_902815 ?auto_902820 ) ) ( not ( = ?auto_902815 ?auto_902821 ) ) ( not ( = ?auto_902815 ?auto_902822 ) ) ( not ( = ?auto_902816 ?auto_902817 ) ) ( not ( = ?auto_902816 ?auto_902818 ) ) ( not ( = ?auto_902816 ?auto_902819 ) ) ( not ( = ?auto_902816 ?auto_902820 ) ) ( not ( = ?auto_902816 ?auto_902821 ) ) ( not ( = ?auto_902816 ?auto_902822 ) ) ( not ( = ?auto_902817 ?auto_902818 ) ) ( not ( = ?auto_902817 ?auto_902819 ) ) ( not ( = ?auto_902817 ?auto_902820 ) ) ( not ( = ?auto_902817 ?auto_902821 ) ) ( not ( = ?auto_902817 ?auto_902822 ) ) ( not ( = ?auto_902818 ?auto_902819 ) ) ( not ( = ?auto_902818 ?auto_902820 ) ) ( not ( = ?auto_902818 ?auto_902821 ) ) ( not ( = ?auto_902818 ?auto_902822 ) ) ( not ( = ?auto_902819 ?auto_902820 ) ) ( not ( = ?auto_902819 ?auto_902821 ) ) ( not ( = ?auto_902819 ?auto_902822 ) ) ( not ( = ?auto_902820 ?auto_902821 ) ) ( not ( = ?auto_902820 ?auto_902822 ) ) ( not ( = ?auto_902821 ?auto_902822 ) ) ( ON ?auto_902820 ?auto_902821 ) ( ON ?auto_902819 ?auto_902820 ) ( ON ?auto_902818 ?auto_902819 ) ( ON ?auto_902817 ?auto_902818 ) ( ON ?auto_902816 ?auto_902817 ) ( ON ?auto_902815 ?auto_902816 ) ( ON ?auto_902814 ?auto_902815 ) ( CLEAR ?auto_902812 ) ( ON ?auto_902813 ?auto_902814 ) ( CLEAR ?auto_902813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_902807 ?auto_902808 ?auto_902809 ?auto_902810 ?auto_902811 ?auto_902812 ?auto_902813 )
      ( MAKE-15PILE ?auto_902807 ?auto_902808 ?auto_902809 ?auto_902810 ?auto_902811 ?auto_902812 ?auto_902813 ?auto_902814 ?auto_902815 ?auto_902816 ?auto_902817 ?auto_902818 ?auto_902819 ?auto_902820 ?auto_902821 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_902869 - BLOCK
      ?auto_902870 - BLOCK
      ?auto_902871 - BLOCK
      ?auto_902872 - BLOCK
      ?auto_902873 - BLOCK
      ?auto_902874 - BLOCK
      ?auto_902875 - BLOCK
      ?auto_902876 - BLOCK
      ?auto_902877 - BLOCK
      ?auto_902878 - BLOCK
      ?auto_902879 - BLOCK
      ?auto_902880 - BLOCK
      ?auto_902881 - BLOCK
      ?auto_902882 - BLOCK
      ?auto_902883 - BLOCK
    )
    :vars
    (
      ?auto_902884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902883 ?auto_902884 ) ( ON-TABLE ?auto_902869 ) ( ON ?auto_902870 ?auto_902869 ) ( ON ?auto_902871 ?auto_902870 ) ( ON ?auto_902872 ?auto_902871 ) ( ON ?auto_902873 ?auto_902872 ) ( not ( = ?auto_902869 ?auto_902870 ) ) ( not ( = ?auto_902869 ?auto_902871 ) ) ( not ( = ?auto_902869 ?auto_902872 ) ) ( not ( = ?auto_902869 ?auto_902873 ) ) ( not ( = ?auto_902869 ?auto_902874 ) ) ( not ( = ?auto_902869 ?auto_902875 ) ) ( not ( = ?auto_902869 ?auto_902876 ) ) ( not ( = ?auto_902869 ?auto_902877 ) ) ( not ( = ?auto_902869 ?auto_902878 ) ) ( not ( = ?auto_902869 ?auto_902879 ) ) ( not ( = ?auto_902869 ?auto_902880 ) ) ( not ( = ?auto_902869 ?auto_902881 ) ) ( not ( = ?auto_902869 ?auto_902882 ) ) ( not ( = ?auto_902869 ?auto_902883 ) ) ( not ( = ?auto_902869 ?auto_902884 ) ) ( not ( = ?auto_902870 ?auto_902871 ) ) ( not ( = ?auto_902870 ?auto_902872 ) ) ( not ( = ?auto_902870 ?auto_902873 ) ) ( not ( = ?auto_902870 ?auto_902874 ) ) ( not ( = ?auto_902870 ?auto_902875 ) ) ( not ( = ?auto_902870 ?auto_902876 ) ) ( not ( = ?auto_902870 ?auto_902877 ) ) ( not ( = ?auto_902870 ?auto_902878 ) ) ( not ( = ?auto_902870 ?auto_902879 ) ) ( not ( = ?auto_902870 ?auto_902880 ) ) ( not ( = ?auto_902870 ?auto_902881 ) ) ( not ( = ?auto_902870 ?auto_902882 ) ) ( not ( = ?auto_902870 ?auto_902883 ) ) ( not ( = ?auto_902870 ?auto_902884 ) ) ( not ( = ?auto_902871 ?auto_902872 ) ) ( not ( = ?auto_902871 ?auto_902873 ) ) ( not ( = ?auto_902871 ?auto_902874 ) ) ( not ( = ?auto_902871 ?auto_902875 ) ) ( not ( = ?auto_902871 ?auto_902876 ) ) ( not ( = ?auto_902871 ?auto_902877 ) ) ( not ( = ?auto_902871 ?auto_902878 ) ) ( not ( = ?auto_902871 ?auto_902879 ) ) ( not ( = ?auto_902871 ?auto_902880 ) ) ( not ( = ?auto_902871 ?auto_902881 ) ) ( not ( = ?auto_902871 ?auto_902882 ) ) ( not ( = ?auto_902871 ?auto_902883 ) ) ( not ( = ?auto_902871 ?auto_902884 ) ) ( not ( = ?auto_902872 ?auto_902873 ) ) ( not ( = ?auto_902872 ?auto_902874 ) ) ( not ( = ?auto_902872 ?auto_902875 ) ) ( not ( = ?auto_902872 ?auto_902876 ) ) ( not ( = ?auto_902872 ?auto_902877 ) ) ( not ( = ?auto_902872 ?auto_902878 ) ) ( not ( = ?auto_902872 ?auto_902879 ) ) ( not ( = ?auto_902872 ?auto_902880 ) ) ( not ( = ?auto_902872 ?auto_902881 ) ) ( not ( = ?auto_902872 ?auto_902882 ) ) ( not ( = ?auto_902872 ?auto_902883 ) ) ( not ( = ?auto_902872 ?auto_902884 ) ) ( not ( = ?auto_902873 ?auto_902874 ) ) ( not ( = ?auto_902873 ?auto_902875 ) ) ( not ( = ?auto_902873 ?auto_902876 ) ) ( not ( = ?auto_902873 ?auto_902877 ) ) ( not ( = ?auto_902873 ?auto_902878 ) ) ( not ( = ?auto_902873 ?auto_902879 ) ) ( not ( = ?auto_902873 ?auto_902880 ) ) ( not ( = ?auto_902873 ?auto_902881 ) ) ( not ( = ?auto_902873 ?auto_902882 ) ) ( not ( = ?auto_902873 ?auto_902883 ) ) ( not ( = ?auto_902873 ?auto_902884 ) ) ( not ( = ?auto_902874 ?auto_902875 ) ) ( not ( = ?auto_902874 ?auto_902876 ) ) ( not ( = ?auto_902874 ?auto_902877 ) ) ( not ( = ?auto_902874 ?auto_902878 ) ) ( not ( = ?auto_902874 ?auto_902879 ) ) ( not ( = ?auto_902874 ?auto_902880 ) ) ( not ( = ?auto_902874 ?auto_902881 ) ) ( not ( = ?auto_902874 ?auto_902882 ) ) ( not ( = ?auto_902874 ?auto_902883 ) ) ( not ( = ?auto_902874 ?auto_902884 ) ) ( not ( = ?auto_902875 ?auto_902876 ) ) ( not ( = ?auto_902875 ?auto_902877 ) ) ( not ( = ?auto_902875 ?auto_902878 ) ) ( not ( = ?auto_902875 ?auto_902879 ) ) ( not ( = ?auto_902875 ?auto_902880 ) ) ( not ( = ?auto_902875 ?auto_902881 ) ) ( not ( = ?auto_902875 ?auto_902882 ) ) ( not ( = ?auto_902875 ?auto_902883 ) ) ( not ( = ?auto_902875 ?auto_902884 ) ) ( not ( = ?auto_902876 ?auto_902877 ) ) ( not ( = ?auto_902876 ?auto_902878 ) ) ( not ( = ?auto_902876 ?auto_902879 ) ) ( not ( = ?auto_902876 ?auto_902880 ) ) ( not ( = ?auto_902876 ?auto_902881 ) ) ( not ( = ?auto_902876 ?auto_902882 ) ) ( not ( = ?auto_902876 ?auto_902883 ) ) ( not ( = ?auto_902876 ?auto_902884 ) ) ( not ( = ?auto_902877 ?auto_902878 ) ) ( not ( = ?auto_902877 ?auto_902879 ) ) ( not ( = ?auto_902877 ?auto_902880 ) ) ( not ( = ?auto_902877 ?auto_902881 ) ) ( not ( = ?auto_902877 ?auto_902882 ) ) ( not ( = ?auto_902877 ?auto_902883 ) ) ( not ( = ?auto_902877 ?auto_902884 ) ) ( not ( = ?auto_902878 ?auto_902879 ) ) ( not ( = ?auto_902878 ?auto_902880 ) ) ( not ( = ?auto_902878 ?auto_902881 ) ) ( not ( = ?auto_902878 ?auto_902882 ) ) ( not ( = ?auto_902878 ?auto_902883 ) ) ( not ( = ?auto_902878 ?auto_902884 ) ) ( not ( = ?auto_902879 ?auto_902880 ) ) ( not ( = ?auto_902879 ?auto_902881 ) ) ( not ( = ?auto_902879 ?auto_902882 ) ) ( not ( = ?auto_902879 ?auto_902883 ) ) ( not ( = ?auto_902879 ?auto_902884 ) ) ( not ( = ?auto_902880 ?auto_902881 ) ) ( not ( = ?auto_902880 ?auto_902882 ) ) ( not ( = ?auto_902880 ?auto_902883 ) ) ( not ( = ?auto_902880 ?auto_902884 ) ) ( not ( = ?auto_902881 ?auto_902882 ) ) ( not ( = ?auto_902881 ?auto_902883 ) ) ( not ( = ?auto_902881 ?auto_902884 ) ) ( not ( = ?auto_902882 ?auto_902883 ) ) ( not ( = ?auto_902882 ?auto_902884 ) ) ( not ( = ?auto_902883 ?auto_902884 ) ) ( ON ?auto_902882 ?auto_902883 ) ( ON ?auto_902881 ?auto_902882 ) ( ON ?auto_902880 ?auto_902881 ) ( ON ?auto_902879 ?auto_902880 ) ( ON ?auto_902878 ?auto_902879 ) ( ON ?auto_902877 ?auto_902878 ) ( ON ?auto_902876 ?auto_902877 ) ( ON ?auto_902875 ?auto_902876 ) ( CLEAR ?auto_902873 ) ( ON ?auto_902874 ?auto_902875 ) ( CLEAR ?auto_902874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_902869 ?auto_902870 ?auto_902871 ?auto_902872 ?auto_902873 ?auto_902874 )
      ( MAKE-15PILE ?auto_902869 ?auto_902870 ?auto_902871 ?auto_902872 ?auto_902873 ?auto_902874 ?auto_902875 ?auto_902876 ?auto_902877 ?auto_902878 ?auto_902879 ?auto_902880 ?auto_902881 ?auto_902882 ?auto_902883 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_902931 - BLOCK
      ?auto_902932 - BLOCK
      ?auto_902933 - BLOCK
      ?auto_902934 - BLOCK
      ?auto_902935 - BLOCK
      ?auto_902936 - BLOCK
      ?auto_902937 - BLOCK
      ?auto_902938 - BLOCK
      ?auto_902939 - BLOCK
      ?auto_902940 - BLOCK
      ?auto_902941 - BLOCK
      ?auto_902942 - BLOCK
      ?auto_902943 - BLOCK
      ?auto_902944 - BLOCK
      ?auto_902945 - BLOCK
    )
    :vars
    (
      ?auto_902946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_902945 ?auto_902946 ) ( ON-TABLE ?auto_902931 ) ( ON ?auto_902932 ?auto_902931 ) ( ON ?auto_902933 ?auto_902932 ) ( ON ?auto_902934 ?auto_902933 ) ( not ( = ?auto_902931 ?auto_902932 ) ) ( not ( = ?auto_902931 ?auto_902933 ) ) ( not ( = ?auto_902931 ?auto_902934 ) ) ( not ( = ?auto_902931 ?auto_902935 ) ) ( not ( = ?auto_902931 ?auto_902936 ) ) ( not ( = ?auto_902931 ?auto_902937 ) ) ( not ( = ?auto_902931 ?auto_902938 ) ) ( not ( = ?auto_902931 ?auto_902939 ) ) ( not ( = ?auto_902931 ?auto_902940 ) ) ( not ( = ?auto_902931 ?auto_902941 ) ) ( not ( = ?auto_902931 ?auto_902942 ) ) ( not ( = ?auto_902931 ?auto_902943 ) ) ( not ( = ?auto_902931 ?auto_902944 ) ) ( not ( = ?auto_902931 ?auto_902945 ) ) ( not ( = ?auto_902931 ?auto_902946 ) ) ( not ( = ?auto_902932 ?auto_902933 ) ) ( not ( = ?auto_902932 ?auto_902934 ) ) ( not ( = ?auto_902932 ?auto_902935 ) ) ( not ( = ?auto_902932 ?auto_902936 ) ) ( not ( = ?auto_902932 ?auto_902937 ) ) ( not ( = ?auto_902932 ?auto_902938 ) ) ( not ( = ?auto_902932 ?auto_902939 ) ) ( not ( = ?auto_902932 ?auto_902940 ) ) ( not ( = ?auto_902932 ?auto_902941 ) ) ( not ( = ?auto_902932 ?auto_902942 ) ) ( not ( = ?auto_902932 ?auto_902943 ) ) ( not ( = ?auto_902932 ?auto_902944 ) ) ( not ( = ?auto_902932 ?auto_902945 ) ) ( not ( = ?auto_902932 ?auto_902946 ) ) ( not ( = ?auto_902933 ?auto_902934 ) ) ( not ( = ?auto_902933 ?auto_902935 ) ) ( not ( = ?auto_902933 ?auto_902936 ) ) ( not ( = ?auto_902933 ?auto_902937 ) ) ( not ( = ?auto_902933 ?auto_902938 ) ) ( not ( = ?auto_902933 ?auto_902939 ) ) ( not ( = ?auto_902933 ?auto_902940 ) ) ( not ( = ?auto_902933 ?auto_902941 ) ) ( not ( = ?auto_902933 ?auto_902942 ) ) ( not ( = ?auto_902933 ?auto_902943 ) ) ( not ( = ?auto_902933 ?auto_902944 ) ) ( not ( = ?auto_902933 ?auto_902945 ) ) ( not ( = ?auto_902933 ?auto_902946 ) ) ( not ( = ?auto_902934 ?auto_902935 ) ) ( not ( = ?auto_902934 ?auto_902936 ) ) ( not ( = ?auto_902934 ?auto_902937 ) ) ( not ( = ?auto_902934 ?auto_902938 ) ) ( not ( = ?auto_902934 ?auto_902939 ) ) ( not ( = ?auto_902934 ?auto_902940 ) ) ( not ( = ?auto_902934 ?auto_902941 ) ) ( not ( = ?auto_902934 ?auto_902942 ) ) ( not ( = ?auto_902934 ?auto_902943 ) ) ( not ( = ?auto_902934 ?auto_902944 ) ) ( not ( = ?auto_902934 ?auto_902945 ) ) ( not ( = ?auto_902934 ?auto_902946 ) ) ( not ( = ?auto_902935 ?auto_902936 ) ) ( not ( = ?auto_902935 ?auto_902937 ) ) ( not ( = ?auto_902935 ?auto_902938 ) ) ( not ( = ?auto_902935 ?auto_902939 ) ) ( not ( = ?auto_902935 ?auto_902940 ) ) ( not ( = ?auto_902935 ?auto_902941 ) ) ( not ( = ?auto_902935 ?auto_902942 ) ) ( not ( = ?auto_902935 ?auto_902943 ) ) ( not ( = ?auto_902935 ?auto_902944 ) ) ( not ( = ?auto_902935 ?auto_902945 ) ) ( not ( = ?auto_902935 ?auto_902946 ) ) ( not ( = ?auto_902936 ?auto_902937 ) ) ( not ( = ?auto_902936 ?auto_902938 ) ) ( not ( = ?auto_902936 ?auto_902939 ) ) ( not ( = ?auto_902936 ?auto_902940 ) ) ( not ( = ?auto_902936 ?auto_902941 ) ) ( not ( = ?auto_902936 ?auto_902942 ) ) ( not ( = ?auto_902936 ?auto_902943 ) ) ( not ( = ?auto_902936 ?auto_902944 ) ) ( not ( = ?auto_902936 ?auto_902945 ) ) ( not ( = ?auto_902936 ?auto_902946 ) ) ( not ( = ?auto_902937 ?auto_902938 ) ) ( not ( = ?auto_902937 ?auto_902939 ) ) ( not ( = ?auto_902937 ?auto_902940 ) ) ( not ( = ?auto_902937 ?auto_902941 ) ) ( not ( = ?auto_902937 ?auto_902942 ) ) ( not ( = ?auto_902937 ?auto_902943 ) ) ( not ( = ?auto_902937 ?auto_902944 ) ) ( not ( = ?auto_902937 ?auto_902945 ) ) ( not ( = ?auto_902937 ?auto_902946 ) ) ( not ( = ?auto_902938 ?auto_902939 ) ) ( not ( = ?auto_902938 ?auto_902940 ) ) ( not ( = ?auto_902938 ?auto_902941 ) ) ( not ( = ?auto_902938 ?auto_902942 ) ) ( not ( = ?auto_902938 ?auto_902943 ) ) ( not ( = ?auto_902938 ?auto_902944 ) ) ( not ( = ?auto_902938 ?auto_902945 ) ) ( not ( = ?auto_902938 ?auto_902946 ) ) ( not ( = ?auto_902939 ?auto_902940 ) ) ( not ( = ?auto_902939 ?auto_902941 ) ) ( not ( = ?auto_902939 ?auto_902942 ) ) ( not ( = ?auto_902939 ?auto_902943 ) ) ( not ( = ?auto_902939 ?auto_902944 ) ) ( not ( = ?auto_902939 ?auto_902945 ) ) ( not ( = ?auto_902939 ?auto_902946 ) ) ( not ( = ?auto_902940 ?auto_902941 ) ) ( not ( = ?auto_902940 ?auto_902942 ) ) ( not ( = ?auto_902940 ?auto_902943 ) ) ( not ( = ?auto_902940 ?auto_902944 ) ) ( not ( = ?auto_902940 ?auto_902945 ) ) ( not ( = ?auto_902940 ?auto_902946 ) ) ( not ( = ?auto_902941 ?auto_902942 ) ) ( not ( = ?auto_902941 ?auto_902943 ) ) ( not ( = ?auto_902941 ?auto_902944 ) ) ( not ( = ?auto_902941 ?auto_902945 ) ) ( not ( = ?auto_902941 ?auto_902946 ) ) ( not ( = ?auto_902942 ?auto_902943 ) ) ( not ( = ?auto_902942 ?auto_902944 ) ) ( not ( = ?auto_902942 ?auto_902945 ) ) ( not ( = ?auto_902942 ?auto_902946 ) ) ( not ( = ?auto_902943 ?auto_902944 ) ) ( not ( = ?auto_902943 ?auto_902945 ) ) ( not ( = ?auto_902943 ?auto_902946 ) ) ( not ( = ?auto_902944 ?auto_902945 ) ) ( not ( = ?auto_902944 ?auto_902946 ) ) ( not ( = ?auto_902945 ?auto_902946 ) ) ( ON ?auto_902944 ?auto_902945 ) ( ON ?auto_902943 ?auto_902944 ) ( ON ?auto_902942 ?auto_902943 ) ( ON ?auto_902941 ?auto_902942 ) ( ON ?auto_902940 ?auto_902941 ) ( ON ?auto_902939 ?auto_902940 ) ( ON ?auto_902938 ?auto_902939 ) ( ON ?auto_902937 ?auto_902938 ) ( ON ?auto_902936 ?auto_902937 ) ( CLEAR ?auto_902934 ) ( ON ?auto_902935 ?auto_902936 ) ( CLEAR ?auto_902935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_902931 ?auto_902932 ?auto_902933 ?auto_902934 ?auto_902935 )
      ( MAKE-15PILE ?auto_902931 ?auto_902932 ?auto_902933 ?auto_902934 ?auto_902935 ?auto_902936 ?auto_902937 ?auto_902938 ?auto_902939 ?auto_902940 ?auto_902941 ?auto_902942 ?auto_902943 ?auto_902944 ?auto_902945 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_902993 - BLOCK
      ?auto_902994 - BLOCK
      ?auto_902995 - BLOCK
      ?auto_902996 - BLOCK
      ?auto_902997 - BLOCK
      ?auto_902998 - BLOCK
      ?auto_902999 - BLOCK
      ?auto_903000 - BLOCK
      ?auto_903001 - BLOCK
      ?auto_903002 - BLOCK
      ?auto_903003 - BLOCK
      ?auto_903004 - BLOCK
      ?auto_903005 - BLOCK
      ?auto_903006 - BLOCK
      ?auto_903007 - BLOCK
    )
    :vars
    (
      ?auto_903008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903007 ?auto_903008 ) ( ON-TABLE ?auto_902993 ) ( ON ?auto_902994 ?auto_902993 ) ( ON ?auto_902995 ?auto_902994 ) ( not ( = ?auto_902993 ?auto_902994 ) ) ( not ( = ?auto_902993 ?auto_902995 ) ) ( not ( = ?auto_902993 ?auto_902996 ) ) ( not ( = ?auto_902993 ?auto_902997 ) ) ( not ( = ?auto_902993 ?auto_902998 ) ) ( not ( = ?auto_902993 ?auto_902999 ) ) ( not ( = ?auto_902993 ?auto_903000 ) ) ( not ( = ?auto_902993 ?auto_903001 ) ) ( not ( = ?auto_902993 ?auto_903002 ) ) ( not ( = ?auto_902993 ?auto_903003 ) ) ( not ( = ?auto_902993 ?auto_903004 ) ) ( not ( = ?auto_902993 ?auto_903005 ) ) ( not ( = ?auto_902993 ?auto_903006 ) ) ( not ( = ?auto_902993 ?auto_903007 ) ) ( not ( = ?auto_902993 ?auto_903008 ) ) ( not ( = ?auto_902994 ?auto_902995 ) ) ( not ( = ?auto_902994 ?auto_902996 ) ) ( not ( = ?auto_902994 ?auto_902997 ) ) ( not ( = ?auto_902994 ?auto_902998 ) ) ( not ( = ?auto_902994 ?auto_902999 ) ) ( not ( = ?auto_902994 ?auto_903000 ) ) ( not ( = ?auto_902994 ?auto_903001 ) ) ( not ( = ?auto_902994 ?auto_903002 ) ) ( not ( = ?auto_902994 ?auto_903003 ) ) ( not ( = ?auto_902994 ?auto_903004 ) ) ( not ( = ?auto_902994 ?auto_903005 ) ) ( not ( = ?auto_902994 ?auto_903006 ) ) ( not ( = ?auto_902994 ?auto_903007 ) ) ( not ( = ?auto_902994 ?auto_903008 ) ) ( not ( = ?auto_902995 ?auto_902996 ) ) ( not ( = ?auto_902995 ?auto_902997 ) ) ( not ( = ?auto_902995 ?auto_902998 ) ) ( not ( = ?auto_902995 ?auto_902999 ) ) ( not ( = ?auto_902995 ?auto_903000 ) ) ( not ( = ?auto_902995 ?auto_903001 ) ) ( not ( = ?auto_902995 ?auto_903002 ) ) ( not ( = ?auto_902995 ?auto_903003 ) ) ( not ( = ?auto_902995 ?auto_903004 ) ) ( not ( = ?auto_902995 ?auto_903005 ) ) ( not ( = ?auto_902995 ?auto_903006 ) ) ( not ( = ?auto_902995 ?auto_903007 ) ) ( not ( = ?auto_902995 ?auto_903008 ) ) ( not ( = ?auto_902996 ?auto_902997 ) ) ( not ( = ?auto_902996 ?auto_902998 ) ) ( not ( = ?auto_902996 ?auto_902999 ) ) ( not ( = ?auto_902996 ?auto_903000 ) ) ( not ( = ?auto_902996 ?auto_903001 ) ) ( not ( = ?auto_902996 ?auto_903002 ) ) ( not ( = ?auto_902996 ?auto_903003 ) ) ( not ( = ?auto_902996 ?auto_903004 ) ) ( not ( = ?auto_902996 ?auto_903005 ) ) ( not ( = ?auto_902996 ?auto_903006 ) ) ( not ( = ?auto_902996 ?auto_903007 ) ) ( not ( = ?auto_902996 ?auto_903008 ) ) ( not ( = ?auto_902997 ?auto_902998 ) ) ( not ( = ?auto_902997 ?auto_902999 ) ) ( not ( = ?auto_902997 ?auto_903000 ) ) ( not ( = ?auto_902997 ?auto_903001 ) ) ( not ( = ?auto_902997 ?auto_903002 ) ) ( not ( = ?auto_902997 ?auto_903003 ) ) ( not ( = ?auto_902997 ?auto_903004 ) ) ( not ( = ?auto_902997 ?auto_903005 ) ) ( not ( = ?auto_902997 ?auto_903006 ) ) ( not ( = ?auto_902997 ?auto_903007 ) ) ( not ( = ?auto_902997 ?auto_903008 ) ) ( not ( = ?auto_902998 ?auto_902999 ) ) ( not ( = ?auto_902998 ?auto_903000 ) ) ( not ( = ?auto_902998 ?auto_903001 ) ) ( not ( = ?auto_902998 ?auto_903002 ) ) ( not ( = ?auto_902998 ?auto_903003 ) ) ( not ( = ?auto_902998 ?auto_903004 ) ) ( not ( = ?auto_902998 ?auto_903005 ) ) ( not ( = ?auto_902998 ?auto_903006 ) ) ( not ( = ?auto_902998 ?auto_903007 ) ) ( not ( = ?auto_902998 ?auto_903008 ) ) ( not ( = ?auto_902999 ?auto_903000 ) ) ( not ( = ?auto_902999 ?auto_903001 ) ) ( not ( = ?auto_902999 ?auto_903002 ) ) ( not ( = ?auto_902999 ?auto_903003 ) ) ( not ( = ?auto_902999 ?auto_903004 ) ) ( not ( = ?auto_902999 ?auto_903005 ) ) ( not ( = ?auto_902999 ?auto_903006 ) ) ( not ( = ?auto_902999 ?auto_903007 ) ) ( not ( = ?auto_902999 ?auto_903008 ) ) ( not ( = ?auto_903000 ?auto_903001 ) ) ( not ( = ?auto_903000 ?auto_903002 ) ) ( not ( = ?auto_903000 ?auto_903003 ) ) ( not ( = ?auto_903000 ?auto_903004 ) ) ( not ( = ?auto_903000 ?auto_903005 ) ) ( not ( = ?auto_903000 ?auto_903006 ) ) ( not ( = ?auto_903000 ?auto_903007 ) ) ( not ( = ?auto_903000 ?auto_903008 ) ) ( not ( = ?auto_903001 ?auto_903002 ) ) ( not ( = ?auto_903001 ?auto_903003 ) ) ( not ( = ?auto_903001 ?auto_903004 ) ) ( not ( = ?auto_903001 ?auto_903005 ) ) ( not ( = ?auto_903001 ?auto_903006 ) ) ( not ( = ?auto_903001 ?auto_903007 ) ) ( not ( = ?auto_903001 ?auto_903008 ) ) ( not ( = ?auto_903002 ?auto_903003 ) ) ( not ( = ?auto_903002 ?auto_903004 ) ) ( not ( = ?auto_903002 ?auto_903005 ) ) ( not ( = ?auto_903002 ?auto_903006 ) ) ( not ( = ?auto_903002 ?auto_903007 ) ) ( not ( = ?auto_903002 ?auto_903008 ) ) ( not ( = ?auto_903003 ?auto_903004 ) ) ( not ( = ?auto_903003 ?auto_903005 ) ) ( not ( = ?auto_903003 ?auto_903006 ) ) ( not ( = ?auto_903003 ?auto_903007 ) ) ( not ( = ?auto_903003 ?auto_903008 ) ) ( not ( = ?auto_903004 ?auto_903005 ) ) ( not ( = ?auto_903004 ?auto_903006 ) ) ( not ( = ?auto_903004 ?auto_903007 ) ) ( not ( = ?auto_903004 ?auto_903008 ) ) ( not ( = ?auto_903005 ?auto_903006 ) ) ( not ( = ?auto_903005 ?auto_903007 ) ) ( not ( = ?auto_903005 ?auto_903008 ) ) ( not ( = ?auto_903006 ?auto_903007 ) ) ( not ( = ?auto_903006 ?auto_903008 ) ) ( not ( = ?auto_903007 ?auto_903008 ) ) ( ON ?auto_903006 ?auto_903007 ) ( ON ?auto_903005 ?auto_903006 ) ( ON ?auto_903004 ?auto_903005 ) ( ON ?auto_903003 ?auto_903004 ) ( ON ?auto_903002 ?auto_903003 ) ( ON ?auto_903001 ?auto_903002 ) ( ON ?auto_903000 ?auto_903001 ) ( ON ?auto_902999 ?auto_903000 ) ( ON ?auto_902998 ?auto_902999 ) ( ON ?auto_902997 ?auto_902998 ) ( CLEAR ?auto_902995 ) ( ON ?auto_902996 ?auto_902997 ) ( CLEAR ?auto_902996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_902993 ?auto_902994 ?auto_902995 ?auto_902996 )
      ( MAKE-15PILE ?auto_902993 ?auto_902994 ?auto_902995 ?auto_902996 ?auto_902997 ?auto_902998 ?auto_902999 ?auto_903000 ?auto_903001 ?auto_903002 ?auto_903003 ?auto_903004 ?auto_903005 ?auto_903006 ?auto_903007 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_903055 - BLOCK
      ?auto_903056 - BLOCK
      ?auto_903057 - BLOCK
      ?auto_903058 - BLOCK
      ?auto_903059 - BLOCK
      ?auto_903060 - BLOCK
      ?auto_903061 - BLOCK
      ?auto_903062 - BLOCK
      ?auto_903063 - BLOCK
      ?auto_903064 - BLOCK
      ?auto_903065 - BLOCK
      ?auto_903066 - BLOCK
      ?auto_903067 - BLOCK
      ?auto_903068 - BLOCK
      ?auto_903069 - BLOCK
    )
    :vars
    (
      ?auto_903070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903069 ?auto_903070 ) ( ON-TABLE ?auto_903055 ) ( ON ?auto_903056 ?auto_903055 ) ( not ( = ?auto_903055 ?auto_903056 ) ) ( not ( = ?auto_903055 ?auto_903057 ) ) ( not ( = ?auto_903055 ?auto_903058 ) ) ( not ( = ?auto_903055 ?auto_903059 ) ) ( not ( = ?auto_903055 ?auto_903060 ) ) ( not ( = ?auto_903055 ?auto_903061 ) ) ( not ( = ?auto_903055 ?auto_903062 ) ) ( not ( = ?auto_903055 ?auto_903063 ) ) ( not ( = ?auto_903055 ?auto_903064 ) ) ( not ( = ?auto_903055 ?auto_903065 ) ) ( not ( = ?auto_903055 ?auto_903066 ) ) ( not ( = ?auto_903055 ?auto_903067 ) ) ( not ( = ?auto_903055 ?auto_903068 ) ) ( not ( = ?auto_903055 ?auto_903069 ) ) ( not ( = ?auto_903055 ?auto_903070 ) ) ( not ( = ?auto_903056 ?auto_903057 ) ) ( not ( = ?auto_903056 ?auto_903058 ) ) ( not ( = ?auto_903056 ?auto_903059 ) ) ( not ( = ?auto_903056 ?auto_903060 ) ) ( not ( = ?auto_903056 ?auto_903061 ) ) ( not ( = ?auto_903056 ?auto_903062 ) ) ( not ( = ?auto_903056 ?auto_903063 ) ) ( not ( = ?auto_903056 ?auto_903064 ) ) ( not ( = ?auto_903056 ?auto_903065 ) ) ( not ( = ?auto_903056 ?auto_903066 ) ) ( not ( = ?auto_903056 ?auto_903067 ) ) ( not ( = ?auto_903056 ?auto_903068 ) ) ( not ( = ?auto_903056 ?auto_903069 ) ) ( not ( = ?auto_903056 ?auto_903070 ) ) ( not ( = ?auto_903057 ?auto_903058 ) ) ( not ( = ?auto_903057 ?auto_903059 ) ) ( not ( = ?auto_903057 ?auto_903060 ) ) ( not ( = ?auto_903057 ?auto_903061 ) ) ( not ( = ?auto_903057 ?auto_903062 ) ) ( not ( = ?auto_903057 ?auto_903063 ) ) ( not ( = ?auto_903057 ?auto_903064 ) ) ( not ( = ?auto_903057 ?auto_903065 ) ) ( not ( = ?auto_903057 ?auto_903066 ) ) ( not ( = ?auto_903057 ?auto_903067 ) ) ( not ( = ?auto_903057 ?auto_903068 ) ) ( not ( = ?auto_903057 ?auto_903069 ) ) ( not ( = ?auto_903057 ?auto_903070 ) ) ( not ( = ?auto_903058 ?auto_903059 ) ) ( not ( = ?auto_903058 ?auto_903060 ) ) ( not ( = ?auto_903058 ?auto_903061 ) ) ( not ( = ?auto_903058 ?auto_903062 ) ) ( not ( = ?auto_903058 ?auto_903063 ) ) ( not ( = ?auto_903058 ?auto_903064 ) ) ( not ( = ?auto_903058 ?auto_903065 ) ) ( not ( = ?auto_903058 ?auto_903066 ) ) ( not ( = ?auto_903058 ?auto_903067 ) ) ( not ( = ?auto_903058 ?auto_903068 ) ) ( not ( = ?auto_903058 ?auto_903069 ) ) ( not ( = ?auto_903058 ?auto_903070 ) ) ( not ( = ?auto_903059 ?auto_903060 ) ) ( not ( = ?auto_903059 ?auto_903061 ) ) ( not ( = ?auto_903059 ?auto_903062 ) ) ( not ( = ?auto_903059 ?auto_903063 ) ) ( not ( = ?auto_903059 ?auto_903064 ) ) ( not ( = ?auto_903059 ?auto_903065 ) ) ( not ( = ?auto_903059 ?auto_903066 ) ) ( not ( = ?auto_903059 ?auto_903067 ) ) ( not ( = ?auto_903059 ?auto_903068 ) ) ( not ( = ?auto_903059 ?auto_903069 ) ) ( not ( = ?auto_903059 ?auto_903070 ) ) ( not ( = ?auto_903060 ?auto_903061 ) ) ( not ( = ?auto_903060 ?auto_903062 ) ) ( not ( = ?auto_903060 ?auto_903063 ) ) ( not ( = ?auto_903060 ?auto_903064 ) ) ( not ( = ?auto_903060 ?auto_903065 ) ) ( not ( = ?auto_903060 ?auto_903066 ) ) ( not ( = ?auto_903060 ?auto_903067 ) ) ( not ( = ?auto_903060 ?auto_903068 ) ) ( not ( = ?auto_903060 ?auto_903069 ) ) ( not ( = ?auto_903060 ?auto_903070 ) ) ( not ( = ?auto_903061 ?auto_903062 ) ) ( not ( = ?auto_903061 ?auto_903063 ) ) ( not ( = ?auto_903061 ?auto_903064 ) ) ( not ( = ?auto_903061 ?auto_903065 ) ) ( not ( = ?auto_903061 ?auto_903066 ) ) ( not ( = ?auto_903061 ?auto_903067 ) ) ( not ( = ?auto_903061 ?auto_903068 ) ) ( not ( = ?auto_903061 ?auto_903069 ) ) ( not ( = ?auto_903061 ?auto_903070 ) ) ( not ( = ?auto_903062 ?auto_903063 ) ) ( not ( = ?auto_903062 ?auto_903064 ) ) ( not ( = ?auto_903062 ?auto_903065 ) ) ( not ( = ?auto_903062 ?auto_903066 ) ) ( not ( = ?auto_903062 ?auto_903067 ) ) ( not ( = ?auto_903062 ?auto_903068 ) ) ( not ( = ?auto_903062 ?auto_903069 ) ) ( not ( = ?auto_903062 ?auto_903070 ) ) ( not ( = ?auto_903063 ?auto_903064 ) ) ( not ( = ?auto_903063 ?auto_903065 ) ) ( not ( = ?auto_903063 ?auto_903066 ) ) ( not ( = ?auto_903063 ?auto_903067 ) ) ( not ( = ?auto_903063 ?auto_903068 ) ) ( not ( = ?auto_903063 ?auto_903069 ) ) ( not ( = ?auto_903063 ?auto_903070 ) ) ( not ( = ?auto_903064 ?auto_903065 ) ) ( not ( = ?auto_903064 ?auto_903066 ) ) ( not ( = ?auto_903064 ?auto_903067 ) ) ( not ( = ?auto_903064 ?auto_903068 ) ) ( not ( = ?auto_903064 ?auto_903069 ) ) ( not ( = ?auto_903064 ?auto_903070 ) ) ( not ( = ?auto_903065 ?auto_903066 ) ) ( not ( = ?auto_903065 ?auto_903067 ) ) ( not ( = ?auto_903065 ?auto_903068 ) ) ( not ( = ?auto_903065 ?auto_903069 ) ) ( not ( = ?auto_903065 ?auto_903070 ) ) ( not ( = ?auto_903066 ?auto_903067 ) ) ( not ( = ?auto_903066 ?auto_903068 ) ) ( not ( = ?auto_903066 ?auto_903069 ) ) ( not ( = ?auto_903066 ?auto_903070 ) ) ( not ( = ?auto_903067 ?auto_903068 ) ) ( not ( = ?auto_903067 ?auto_903069 ) ) ( not ( = ?auto_903067 ?auto_903070 ) ) ( not ( = ?auto_903068 ?auto_903069 ) ) ( not ( = ?auto_903068 ?auto_903070 ) ) ( not ( = ?auto_903069 ?auto_903070 ) ) ( ON ?auto_903068 ?auto_903069 ) ( ON ?auto_903067 ?auto_903068 ) ( ON ?auto_903066 ?auto_903067 ) ( ON ?auto_903065 ?auto_903066 ) ( ON ?auto_903064 ?auto_903065 ) ( ON ?auto_903063 ?auto_903064 ) ( ON ?auto_903062 ?auto_903063 ) ( ON ?auto_903061 ?auto_903062 ) ( ON ?auto_903060 ?auto_903061 ) ( ON ?auto_903059 ?auto_903060 ) ( ON ?auto_903058 ?auto_903059 ) ( CLEAR ?auto_903056 ) ( ON ?auto_903057 ?auto_903058 ) ( CLEAR ?auto_903057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_903055 ?auto_903056 ?auto_903057 )
      ( MAKE-15PILE ?auto_903055 ?auto_903056 ?auto_903057 ?auto_903058 ?auto_903059 ?auto_903060 ?auto_903061 ?auto_903062 ?auto_903063 ?auto_903064 ?auto_903065 ?auto_903066 ?auto_903067 ?auto_903068 ?auto_903069 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_903117 - BLOCK
      ?auto_903118 - BLOCK
      ?auto_903119 - BLOCK
      ?auto_903120 - BLOCK
      ?auto_903121 - BLOCK
      ?auto_903122 - BLOCK
      ?auto_903123 - BLOCK
      ?auto_903124 - BLOCK
      ?auto_903125 - BLOCK
      ?auto_903126 - BLOCK
      ?auto_903127 - BLOCK
      ?auto_903128 - BLOCK
      ?auto_903129 - BLOCK
      ?auto_903130 - BLOCK
      ?auto_903131 - BLOCK
    )
    :vars
    (
      ?auto_903132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903131 ?auto_903132 ) ( ON-TABLE ?auto_903117 ) ( not ( = ?auto_903117 ?auto_903118 ) ) ( not ( = ?auto_903117 ?auto_903119 ) ) ( not ( = ?auto_903117 ?auto_903120 ) ) ( not ( = ?auto_903117 ?auto_903121 ) ) ( not ( = ?auto_903117 ?auto_903122 ) ) ( not ( = ?auto_903117 ?auto_903123 ) ) ( not ( = ?auto_903117 ?auto_903124 ) ) ( not ( = ?auto_903117 ?auto_903125 ) ) ( not ( = ?auto_903117 ?auto_903126 ) ) ( not ( = ?auto_903117 ?auto_903127 ) ) ( not ( = ?auto_903117 ?auto_903128 ) ) ( not ( = ?auto_903117 ?auto_903129 ) ) ( not ( = ?auto_903117 ?auto_903130 ) ) ( not ( = ?auto_903117 ?auto_903131 ) ) ( not ( = ?auto_903117 ?auto_903132 ) ) ( not ( = ?auto_903118 ?auto_903119 ) ) ( not ( = ?auto_903118 ?auto_903120 ) ) ( not ( = ?auto_903118 ?auto_903121 ) ) ( not ( = ?auto_903118 ?auto_903122 ) ) ( not ( = ?auto_903118 ?auto_903123 ) ) ( not ( = ?auto_903118 ?auto_903124 ) ) ( not ( = ?auto_903118 ?auto_903125 ) ) ( not ( = ?auto_903118 ?auto_903126 ) ) ( not ( = ?auto_903118 ?auto_903127 ) ) ( not ( = ?auto_903118 ?auto_903128 ) ) ( not ( = ?auto_903118 ?auto_903129 ) ) ( not ( = ?auto_903118 ?auto_903130 ) ) ( not ( = ?auto_903118 ?auto_903131 ) ) ( not ( = ?auto_903118 ?auto_903132 ) ) ( not ( = ?auto_903119 ?auto_903120 ) ) ( not ( = ?auto_903119 ?auto_903121 ) ) ( not ( = ?auto_903119 ?auto_903122 ) ) ( not ( = ?auto_903119 ?auto_903123 ) ) ( not ( = ?auto_903119 ?auto_903124 ) ) ( not ( = ?auto_903119 ?auto_903125 ) ) ( not ( = ?auto_903119 ?auto_903126 ) ) ( not ( = ?auto_903119 ?auto_903127 ) ) ( not ( = ?auto_903119 ?auto_903128 ) ) ( not ( = ?auto_903119 ?auto_903129 ) ) ( not ( = ?auto_903119 ?auto_903130 ) ) ( not ( = ?auto_903119 ?auto_903131 ) ) ( not ( = ?auto_903119 ?auto_903132 ) ) ( not ( = ?auto_903120 ?auto_903121 ) ) ( not ( = ?auto_903120 ?auto_903122 ) ) ( not ( = ?auto_903120 ?auto_903123 ) ) ( not ( = ?auto_903120 ?auto_903124 ) ) ( not ( = ?auto_903120 ?auto_903125 ) ) ( not ( = ?auto_903120 ?auto_903126 ) ) ( not ( = ?auto_903120 ?auto_903127 ) ) ( not ( = ?auto_903120 ?auto_903128 ) ) ( not ( = ?auto_903120 ?auto_903129 ) ) ( not ( = ?auto_903120 ?auto_903130 ) ) ( not ( = ?auto_903120 ?auto_903131 ) ) ( not ( = ?auto_903120 ?auto_903132 ) ) ( not ( = ?auto_903121 ?auto_903122 ) ) ( not ( = ?auto_903121 ?auto_903123 ) ) ( not ( = ?auto_903121 ?auto_903124 ) ) ( not ( = ?auto_903121 ?auto_903125 ) ) ( not ( = ?auto_903121 ?auto_903126 ) ) ( not ( = ?auto_903121 ?auto_903127 ) ) ( not ( = ?auto_903121 ?auto_903128 ) ) ( not ( = ?auto_903121 ?auto_903129 ) ) ( not ( = ?auto_903121 ?auto_903130 ) ) ( not ( = ?auto_903121 ?auto_903131 ) ) ( not ( = ?auto_903121 ?auto_903132 ) ) ( not ( = ?auto_903122 ?auto_903123 ) ) ( not ( = ?auto_903122 ?auto_903124 ) ) ( not ( = ?auto_903122 ?auto_903125 ) ) ( not ( = ?auto_903122 ?auto_903126 ) ) ( not ( = ?auto_903122 ?auto_903127 ) ) ( not ( = ?auto_903122 ?auto_903128 ) ) ( not ( = ?auto_903122 ?auto_903129 ) ) ( not ( = ?auto_903122 ?auto_903130 ) ) ( not ( = ?auto_903122 ?auto_903131 ) ) ( not ( = ?auto_903122 ?auto_903132 ) ) ( not ( = ?auto_903123 ?auto_903124 ) ) ( not ( = ?auto_903123 ?auto_903125 ) ) ( not ( = ?auto_903123 ?auto_903126 ) ) ( not ( = ?auto_903123 ?auto_903127 ) ) ( not ( = ?auto_903123 ?auto_903128 ) ) ( not ( = ?auto_903123 ?auto_903129 ) ) ( not ( = ?auto_903123 ?auto_903130 ) ) ( not ( = ?auto_903123 ?auto_903131 ) ) ( not ( = ?auto_903123 ?auto_903132 ) ) ( not ( = ?auto_903124 ?auto_903125 ) ) ( not ( = ?auto_903124 ?auto_903126 ) ) ( not ( = ?auto_903124 ?auto_903127 ) ) ( not ( = ?auto_903124 ?auto_903128 ) ) ( not ( = ?auto_903124 ?auto_903129 ) ) ( not ( = ?auto_903124 ?auto_903130 ) ) ( not ( = ?auto_903124 ?auto_903131 ) ) ( not ( = ?auto_903124 ?auto_903132 ) ) ( not ( = ?auto_903125 ?auto_903126 ) ) ( not ( = ?auto_903125 ?auto_903127 ) ) ( not ( = ?auto_903125 ?auto_903128 ) ) ( not ( = ?auto_903125 ?auto_903129 ) ) ( not ( = ?auto_903125 ?auto_903130 ) ) ( not ( = ?auto_903125 ?auto_903131 ) ) ( not ( = ?auto_903125 ?auto_903132 ) ) ( not ( = ?auto_903126 ?auto_903127 ) ) ( not ( = ?auto_903126 ?auto_903128 ) ) ( not ( = ?auto_903126 ?auto_903129 ) ) ( not ( = ?auto_903126 ?auto_903130 ) ) ( not ( = ?auto_903126 ?auto_903131 ) ) ( not ( = ?auto_903126 ?auto_903132 ) ) ( not ( = ?auto_903127 ?auto_903128 ) ) ( not ( = ?auto_903127 ?auto_903129 ) ) ( not ( = ?auto_903127 ?auto_903130 ) ) ( not ( = ?auto_903127 ?auto_903131 ) ) ( not ( = ?auto_903127 ?auto_903132 ) ) ( not ( = ?auto_903128 ?auto_903129 ) ) ( not ( = ?auto_903128 ?auto_903130 ) ) ( not ( = ?auto_903128 ?auto_903131 ) ) ( not ( = ?auto_903128 ?auto_903132 ) ) ( not ( = ?auto_903129 ?auto_903130 ) ) ( not ( = ?auto_903129 ?auto_903131 ) ) ( not ( = ?auto_903129 ?auto_903132 ) ) ( not ( = ?auto_903130 ?auto_903131 ) ) ( not ( = ?auto_903130 ?auto_903132 ) ) ( not ( = ?auto_903131 ?auto_903132 ) ) ( ON ?auto_903130 ?auto_903131 ) ( ON ?auto_903129 ?auto_903130 ) ( ON ?auto_903128 ?auto_903129 ) ( ON ?auto_903127 ?auto_903128 ) ( ON ?auto_903126 ?auto_903127 ) ( ON ?auto_903125 ?auto_903126 ) ( ON ?auto_903124 ?auto_903125 ) ( ON ?auto_903123 ?auto_903124 ) ( ON ?auto_903122 ?auto_903123 ) ( ON ?auto_903121 ?auto_903122 ) ( ON ?auto_903120 ?auto_903121 ) ( ON ?auto_903119 ?auto_903120 ) ( CLEAR ?auto_903117 ) ( ON ?auto_903118 ?auto_903119 ) ( CLEAR ?auto_903118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_903117 ?auto_903118 )
      ( MAKE-15PILE ?auto_903117 ?auto_903118 ?auto_903119 ?auto_903120 ?auto_903121 ?auto_903122 ?auto_903123 ?auto_903124 ?auto_903125 ?auto_903126 ?auto_903127 ?auto_903128 ?auto_903129 ?auto_903130 ?auto_903131 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_903179 - BLOCK
      ?auto_903180 - BLOCK
      ?auto_903181 - BLOCK
      ?auto_903182 - BLOCK
      ?auto_903183 - BLOCK
      ?auto_903184 - BLOCK
      ?auto_903185 - BLOCK
      ?auto_903186 - BLOCK
      ?auto_903187 - BLOCK
      ?auto_903188 - BLOCK
      ?auto_903189 - BLOCK
      ?auto_903190 - BLOCK
      ?auto_903191 - BLOCK
      ?auto_903192 - BLOCK
      ?auto_903193 - BLOCK
    )
    :vars
    (
      ?auto_903194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903193 ?auto_903194 ) ( not ( = ?auto_903179 ?auto_903180 ) ) ( not ( = ?auto_903179 ?auto_903181 ) ) ( not ( = ?auto_903179 ?auto_903182 ) ) ( not ( = ?auto_903179 ?auto_903183 ) ) ( not ( = ?auto_903179 ?auto_903184 ) ) ( not ( = ?auto_903179 ?auto_903185 ) ) ( not ( = ?auto_903179 ?auto_903186 ) ) ( not ( = ?auto_903179 ?auto_903187 ) ) ( not ( = ?auto_903179 ?auto_903188 ) ) ( not ( = ?auto_903179 ?auto_903189 ) ) ( not ( = ?auto_903179 ?auto_903190 ) ) ( not ( = ?auto_903179 ?auto_903191 ) ) ( not ( = ?auto_903179 ?auto_903192 ) ) ( not ( = ?auto_903179 ?auto_903193 ) ) ( not ( = ?auto_903179 ?auto_903194 ) ) ( not ( = ?auto_903180 ?auto_903181 ) ) ( not ( = ?auto_903180 ?auto_903182 ) ) ( not ( = ?auto_903180 ?auto_903183 ) ) ( not ( = ?auto_903180 ?auto_903184 ) ) ( not ( = ?auto_903180 ?auto_903185 ) ) ( not ( = ?auto_903180 ?auto_903186 ) ) ( not ( = ?auto_903180 ?auto_903187 ) ) ( not ( = ?auto_903180 ?auto_903188 ) ) ( not ( = ?auto_903180 ?auto_903189 ) ) ( not ( = ?auto_903180 ?auto_903190 ) ) ( not ( = ?auto_903180 ?auto_903191 ) ) ( not ( = ?auto_903180 ?auto_903192 ) ) ( not ( = ?auto_903180 ?auto_903193 ) ) ( not ( = ?auto_903180 ?auto_903194 ) ) ( not ( = ?auto_903181 ?auto_903182 ) ) ( not ( = ?auto_903181 ?auto_903183 ) ) ( not ( = ?auto_903181 ?auto_903184 ) ) ( not ( = ?auto_903181 ?auto_903185 ) ) ( not ( = ?auto_903181 ?auto_903186 ) ) ( not ( = ?auto_903181 ?auto_903187 ) ) ( not ( = ?auto_903181 ?auto_903188 ) ) ( not ( = ?auto_903181 ?auto_903189 ) ) ( not ( = ?auto_903181 ?auto_903190 ) ) ( not ( = ?auto_903181 ?auto_903191 ) ) ( not ( = ?auto_903181 ?auto_903192 ) ) ( not ( = ?auto_903181 ?auto_903193 ) ) ( not ( = ?auto_903181 ?auto_903194 ) ) ( not ( = ?auto_903182 ?auto_903183 ) ) ( not ( = ?auto_903182 ?auto_903184 ) ) ( not ( = ?auto_903182 ?auto_903185 ) ) ( not ( = ?auto_903182 ?auto_903186 ) ) ( not ( = ?auto_903182 ?auto_903187 ) ) ( not ( = ?auto_903182 ?auto_903188 ) ) ( not ( = ?auto_903182 ?auto_903189 ) ) ( not ( = ?auto_903182 ?auto_903190 ) ) ( not ( = ?auto_903182 ?auto_903191 ) ) ( not ( = ?auto_903182 ?auto_903192 ) ) ( not ( = ?auto_903182 ?auto_903193 ) ) ( not ( = ?auto_903182 ?auto_903194 ) ) ( not ( = ?auto_903183 ?auto_903184 ) ) ( not ( = ?auto_903183 ?auto_903185 ) ) ( not ( = ?auto_903183 ?auto_903186 ) ) ( not ( = ?auto_903183 ?auto_903187 ) ) ( not ( = ?auto_903183 ?auto_903188 ) ) ( not ( = ?auto_903183 ?auto_903189 ) ) ( not ( = ?auto_903183 ?auto_903190 ) ) ( not ( = ?auto_903183 ?auto_903191 ) ) ( not ( = ?auto_903183 ?auto_903192 ) ) ( not ( = ?auto_903183 ?auto_903193 ) ) ( not ( = ?auto_903183 ?auto_903194 ) ) ( not ( = ?auto_903184 ?auto_903185 ) ) ( not ( = ?auto_903184 ?auto_903186 ) ) ( not ( = ?auto_903184 ?auto_903187 ) ) ( not ( = ?auto_903184 ?auto_903188 ) ) ( not ( = ?auto_903184 ?auto_903189 ) ) ( not ( = ?auto_903184 ?auto_903190 ) ) ( not ( = ?auto_903184 ?auto_903191 ) ) ( not ( = ?auto_903184 ?auto_903192 ) ) ( not ( = ?auto_903184 ?auto_903193 ) ) ( not ( = ?auto_903184 ?auto_903194 ) ) ( not ( = ?auto_903185 ?auto_903186 ) ) ( not ( = ?auto_903185 ?auto_903187 ) ) ( not ( = ?auto_903185 ?auto_903188 ) ) ( not ( = ?auto_903185 ?auto_903189 ) ) ( not ( = ?auto_903185 ?auto_903190 ) ) ( not ( = ?auto_903185 ?auto_903191 ) ) ( not ( = ?auto_903185 ?auto_903192 ) ) ( not ( = ?auto_903185 ?auto_903193 ) ) ( not ( = ?auto_903185 ?auto_903194 ) ) ( not ( = ?auto_903186 ?auto_903187 ) ) ( not ( = ?auto_903186 ?auto_903188 ) ) ( not ( = ?auto_903186 ?auto_903189 ) ) ( not ( = ?auto_903186 ?auto_903190 ) ) ( not ( = ?auto_903186 ?auto_903191 ) ) ( not ( = ?auto_903186 ?auto_903192 ) ) ( not ( = ?auto_903186 ?auto_903193 ) ) ( not ( = ?auto_903186 ?auto_903194 ) ) ( not ( = ?auto_903187 ?auto_903188 ) ) ( not ( = ?auto_903187 ?auto_903189 ) ) ( not ( = ?auto_903187 ?auto_903190 ) ) ( not ( = ?auto_903187 ?auto_903191 ) ) ( not ( = ?auto_903187 ?auto_903192 ) ) ( not ( = ?auto_903187 ?auto_903193 ) ) ( not ( = ?auto_903187 ?auto_903194 ) ) ( not ( = ?auto_903188 ?auto_903189 ) ) ( not ( = ?auto_903188 ?auto_903190 ) ) ( not ( = ?auto_903188 ?auto_903191 ) ) ( not ( = ?auto_903188 ?auto_903192 ) ) ( not ( = ?auto_903188 ?auto_903193 ) ) ( not ( = ?auto_903188 ?auto_903194 ) ) ( not ( = ?auto_903189 ?auto_903190 ) ) ( not ( = ?auto_903189 ?auto_903191 ) ) ( not ( = ?auto_903189 ?auto_903192 ) ) ( not ( = ?auto_903189 ?auto_903193 ) ) ( not ( = ?auto_903189 ?auto_903194 ) ) ( not ( = ?auto_903190 ?auto_903191 ) ) ( not ( = ?auto_903190 ?auto_903192 ) ) ( not ( = ?auto_903190 ?auto_903193 ) ) ( not ( = ?auto_903190 ?auto_903194 ) ) ( not ( = ?auto_903191 ?auto_903192 ) ) ( not ( = ?auto_903191 ?auto_903193 ) ) ( not ( = ?auto_903191 ?auto_903194 ) ) ( not ( = ?auto_903192 ?auto_903193 ) ) ( not ( = ?auto_903192 ?auto_903194 ) ) ( not ( = ?auto_903193 ?auto_903194 ) ) ( ON ?auto_903192 ?auto_903193 ) ( ON ?auto_903191 ?auto_903192 ) ( ON ?auto_903190 ?auto_903191 ) ( ON ?auto_903189 ?auto_903190 ) ( ON ?auto_903188 ?auto_903189 ) ( ON ?auto_903187 ?auto_903188 ) ( ON ?auto_903186 ?auto_903187 ) ( ON ?auto_903185 ?auto_903186 ) ( ON ?auto_903184 ?auto_903185 ) ( ON ?auto_903183 ?auto_903184 ) ( ON ?auto_903182 ?auto_903183 ) ( ON ?auto_903181 ?auto_903182 ) ( ON ?auto_903180 ?auto_903181 ) ( ON ?auto_903179 ?auto_903180 ) ( CLEAR ?auto_903179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_903179 )
      ( MAKE-15PILE ?auto_903179 ?auto_903180 ?auto_903181 ?auto_903182 ?auto_903183 ?auto_903184 ?auto_903185 ?auto_903186 ?auto_903187 ?auto_903188 ?auto_903189 ?auto_903190 ?auto_903191 ?auto_903192 ?auto_903193 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_903242 - BLOCK
      ?auto_903243 - BLOCK
      ?auto_903244 - BLOCK
      ?auto_903245 - BLOCK
      ?auto_903246 - BLOCK
      ?auto_903247 - BLOCK
      ?auto_903248 - BLOCK
      ?auto_903249 - BLOCK
      ?auto_903250 - BLOCK
      ?auto_903251 - BLOCK
      ?auto_903252 - BLOCK
      ?auto_903253 - BLOCK
      ?auto_903254 - BLOCK
      ?auto_903255 - BLOCK
      ?auto_903256 - BLOCK
      ?auto_903257 - BLOCK
    )
    :vars
    (
      ?auto_903258 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_903256 ) ( ON ?auto_903257 ?auto_903258 ) ( CLEAR ?auto_903257 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_903242 ) ( ON ?auto_903243 ?auto_903242 ) ( ON ?auto_903244 ?auto_903243 ) ( ON ?auto_903245 ?auto_903244 ) ( ON ?auto_903246 ?auto_903245 ) ( ON ?auto_903247 ?auto_903246 ) ( ON ?auto_903248 ?auto_903247 ) ( ON ?auto_903249 ?auto_903248 ) ( ON ?auto_903250 ?auto_903249 ) ( ON ?auto_903251 ?auto_903250 ) ( ON ?auto_903252 ?auto_903251 ) ( ON ?auto_903253 ?auto_903252 ) ( ON ?auto_903254 ?auto_903253 ) ( ON ?auto_903255 ?auto_903254 ) ( ON ?auto_903256 ?auto_903255 ) ( not ( = ?auto_903242 ?auto_903243 ) ) ( not ( = ?auto_903242 ?auto_903244 ) ) ( not ( = ?auto_903242 ?auto_903245 ) ) ( not ( = ?auto_903242 ?auto_903246 ) ) ( not ( = ?auto_903242 ?auto_903247 ) ) ( not ( = ?auto_903242 ?auto_903248 ) ) ( not ( = ?auto_903242 ?auto_903249 ) ) ( not ( = ?auto_903242 ?auto_903250 ) ) ( not ( = ?auto_903242 ?auto_903251 ) ) ( not ( = ?auto_903242 ?auto_903252 ) ) ( not ( = ?auto_903242 ?auto_903253 ) ) ( not ( = ?auto_903242 ?auto_903254 ) ) ( not ( = ?auto_903242 ?auto_903255 ) ) ( not ( = ?auto_903242 ?auto_903256 ) ) ( not ( = ?auto_903242 ?auto_903257 ) ) ( not ( = ?auto_903242 ?auto_903258 ) ) ( not ( = ?auto_903243 ?auto_903244 ) ) ( not ( = ?auto_903243 ?auto_903245 ) ) ( not ( = ?auto_903243 ?auto_903246 ) ) ( not ( = ?auto_903243 ?auto_903247 ) ) ( not ( = ?auto_903243 ?auto_903248 ) ) ( not ( = ?auto_903243 ?auto_903249 ) ) ( not ( = ?auto_903243 ?auto_903250 ) ) ( not ( = ?auto_903243 ?auto_903251 ) ) ( not ( = ?auto_903243 ?auto_903252 ) ) ( not ( = ?auto_903243 ?auto_903253 ) ) ( not ( = ?auto_903243 ?auto_903254 ) ) ( not ( = ?auto_903243 ?auto_903255 ) ) ( not ( = ?auto_903243 ?auto_903256 ) ) ( not ( = ?auto_903243 ?auto_903257 ) ) ( not ( = ?auto_903243 ?auto_903258 ) ) ( not ( = ?auto_903244 ?auto_903245 ) ) ( not ( = ?auto_903244 ?auto_903246 ) ) ( not ( = ?auto_903244 ?auto_903247 ) ) ( not ( = ?auto_903244 ?auto_903248 ) ) ( not ( = ?auto_903244 ?auto_903249 ) ) ( not ( = ?auto_903244 ?auto_903250 ) ) ( not ( = ?auto_903244 ?auto_903251 ) ) ( not ( = ?auto_903244 ?auto_903252 ) ) ( not ( = ?auto_903244 ?auto_903253 ) ) ( not ( = ?auto_903244 ?auto_903254 ) ) ( not ( = ?auto_903244 ?auto_903255 ) ) ( not ( = ?auto_903244 ?auto_903256 ) ) ( not ( = ?auto_903244 ?auto_903257 ) ) ( not ( = ?auto_903244 ?auto_903258 ) ) ( not ( = ?auto_903245 ?auto_903246 ) ) ( not ( = ?auto_903245 ?auto_903247 ) ) ( not ( = ?auto_903245 ?auto_903248 ) ) ( not ( = ?auto_903245 ?auto_903249 ) ) ( not ( = ?auto_903245 ?auto_903250 ) ) ( not ( = ?auto_903245 ?auto_903251 ) ) ( not ( = ?auto_903245 ?auto_903252 ) ) ( not ( = ?auto_903245 ?auto_903253 ) ) ( not ( = ?auto_903245 ?auto_903254 ) ) ( not ( = ?auto_903245 ?auto_903255 ) ) ( not ( = ?auto_903245 ?auto_903256 ) ) ( not ( = ?auto_903245 ?auto_903257 ) ) ( not ( = ?auto_903245 ?auto_903258 ) ) ( not ( = ?auto_903246 ?auto_903247 ) ) ( not ( = ?auto_903246 ?auto_903248 ) ) ( not ( = ?auto_903246 ?auto_903249 ) ) ( not ( = ?auto_903246 ?auto_903250 ) ) ( not ( = ?auto_903246 ?auto_903251 ) ) ( not ( = ?auto_903246 ?auto_903252 ) ) ( not ( = ?auto_903246 ?auto_903253 ) ) ( not ( = ?auto_903246 ?auto_903254 ) ) ( not ( = ?auto_903246 ?auto_903255 ) ) ( not ( = ?auto_903246 ?auto_903256 ) ) ( not ( = ?auto_903246 ?auto_903257 ) ) ( not ( = ?auto_903246 ?auto_903258 ) ) ( not ( = ?auto_903247 ?auto_903248 ) ) ( not ( = ?auto_903247 ?auto_903249 ) ) ( not ( = ?auto_903247 ?auto_903250 ) ) ( not ( = ?auto_903247 ?auto_903251 ) ) ( not ( = ?auto_903247 ?auto_903252 ) ) ( not ( = ?auto_903247 ?auto_903253 ) ) ( not ( = ?auto_903247 ?auto_903254 ) ) ( not ( = ?auto_903247 ?auto_903255 ) ) ( not ( = ?auto_903247 ?auto_903256 ) ) ( not ( = ?auto_903247 ?auto_903257 ) ) ( not ( = ?auto_903247 ?auto_903258 ) ) ( not ( = ?auto_903248 ?auto_903249 ) ) ( not ( = ?auto_903248 ?auto_903250 ) ) ( not ( = ?auto_903248 ?auto_903251 ) ) ( not ( = ?auto_903248 ?auto_903252 ) ) ( not ( = ?auto_903248 ?auto_903253 ) ) ( not ( = ?auto_903248 ?auto_903254 ) ) ( not ( = ?auto_903248 ?auto_903255 ) ) ( not ( = ?auto_903248 ?auto_903256 ) ) ( not ( = ?auto_903248 ?auto_903257 ) ) ( not ( = ?auto_903248 ?auto_903258 ) ) ( not ( = ?auto_903249 ?auto_903250 ) ) ( not ( = ?auto_903249 ?auto_903251 ) ) ( not ( = ?auto_903249 ?auto_903252 ) ) ( not ( = ?auto_903249 ?auto_903253 ) ) ( not ( = ?auto_903249 ?auto_903254 ) ) ( not ( = ?auto_903249 ?auto_903255 ) ) ( not ( = ?auto_903249 ?auto_903256 ) ) ( not ( = ?auto_903249 ?auto_903257 ) ) ( not ( = ?auto_903249 ?auto_903258 ) ) ( not ( = ?auto_903250 ?auto_903251 ) ) ( not ( = ?auto_903250 ?auto_903252 ) ) ( not ( = ?auto_903250 ?auto_903253 ) ) ( not ( = ?auto_903250 ?auto_903254 ) ) ( not ( = ?auto_903250 ?auto_903255 ) ) ( not ( = ?auto_903250 ?auto_903256 ) ) ( not ( = ?auto_903250 ?auto_903257 ) ) ( not ( = ?auto_903250 ?auto_903258 ) ) ( not ( = ?auto_903251 ?auto_903252 ) ) ( not ( = ?auto_903251 ?auto_903253 ) ) ( not ( = ?auto_903251 ?auto_903254 ) ) ( not ( = ?auto_903251 ?auto_903255 ) ) ( not ( = ?auto_903251 ?auto_903256 ) ) ( not ( = ?auto_903251 ?auto_903257 ) ) ( not ( = ?auto_903251 ?auto_903258 ) ) ( not ( = ?auto_903252 ?auto_903253 ) ) ( not ( = ?auto_903252 ?auto_903254 ) ) ( not ( = ?auto_903252 ?auto_903255 ) ) ( not ( = ?auto_903252 ?auto_903256 ) ) ( not ( = ?auto_903252 ?auto_903257 ) ) ( not ( = ?auto_903252 ?auto_903258 ) ) ( not ( = ?auto_903253 ?auto_903254 ) ) ( not ( = ?auto_903253 ?auto_903255 ) ) ( not ( = ?auto_903253 ?auto_903256 ) ) ( not ( = ?auto_903253 ?auto_903257 ) ) ( not ( = ?auto_903253 ?auto_903258 ) ) ( not ( = ?auto_903254 ?auto_903255 ) ) ( not ( = ?auto_903254 ?auto_903256 ) ) ( not ( = ?auto_903254 ?auto_903257 ) ) ( not ( = ?auto_903254 ?auto_903258 ) ) ( not ( = ?auto_903255 ?auto_903256 ) ) ( not ( = ?auto_903255 ?auto_903257 ) ) ( not ( = ?auto_903255 ?auto_903258 ) ) ( not ( = ?auto_903256 ?auto_903257 ) ) ( not ( = ?auto_903256 ?auto_903258 ) ) ( not ( = ?auto_903257 ?auto_903258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_903257 ?auto_903258 )
      ( !STACK ?auto_903257 ?auto_903256 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_903308 - BLOCK
      ?auto_903309 - BLOCK
      ?auto_903310 - BLOCK
      ?auto_903311 - BLOCK
      ?auto_903312 - BLOCK
      ?auto_903313 - BLOCK
      ?auto_903314 - BLOCK
      ?auto_903315 - BLOCK
      ?auto_903316 - BLOCK
      ?auto_903317 - BLOCK
      ?auto_903318 - BLOCK
      ?auto_903319 - BLOCK
      ?auto_903320 - BLOCK
      ?auto_903321 - BLOCK
      ?auto_903322 - BLOCK
      ?auto_903323 - BLOCK
    )
    :vars
    (
      ?auto_903324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903323 ?auto_903324 ) ( ON-TABLE ?auto_903308 ) ( ON ?auto_903309 ?auto_903308 ) ( ON ?auto_903310 ?auto_903309 ) ( ON ?auto_903311 ?auto_903310 ) ( ON ?auto_903312 ?auto_903311 ) ( ON ?auto_903313 ?auto_903312 ) ( ON ?auto_903314 ?auto_903313 ) ( ON ?auto_903315 ?auto_903314 ) ( ON ?auto_903316 ?auto_903315 ) ( ON ?auto_903317 ?auto_903316 ) ( ON ?auto_903318 ?auto_903317 ) ( ON ?auto_903319 ?auto_903318 ) ( ON ?auto_903320 ?auto_903319 ) ( ON ?auto_903321 ?auto_903320 ) ( not ( = ?auto_903308 ?auto_903309 ) ) ( not ( = ?auto_903308 ?auto_903310 ) ) ( not ( = ?auto_903308 ?auto_903311 ) ) ( not ( = ?auto_903308 ?auto_903312 ) ) ( not ( = ?auto_903308 ?auto_903313 ) ) ( not ( = ?auto_903308 ?auto_903314 ) ) ( not ( = ?auto_903308 ?auto_903315 ) ) ( not ( = ?auto_903308 ?auto_903316 ) ) ( not ( = ?auto_903308 ?auto_903317 ) ) ( not ( = ?auto_903308 ?auto_903318 ) ) ( not ( = ?auto_903308 ?auto_903319 ) ) ( not ( = ?auto_903308 ?auto_903320 ) ) ( not ( = ?auto_903308 ?auto_903321 ) ) ( not ( = ?auto_903308 ?auto_903322 ) ) ( not ( = ?auto_903308 ?auto_903323 ) ) ( not ( = ?auto_903308 ?auto_903324 ) ) ( not ( = ?auto_903309 ?auto_903310 ) ) ( not ( = ?auto_903309 ?auto_903311 ) ) ( not ( = ?auto_903309 ?auto_903312 ) ) ( not ( = ?auto_903309 ?auto_903313 ) ) ( not ( = ?auto_903309 ?auto_903314 ) ) ( not ( = ?auto_903309 ?auto_903315 ) ) ( not ( = ?auto_903309 ?auto_903316 ) ) ( not ( = ?auto_903309 ?auto_903317 ) ) ( not ( = ?auto_903309 ?auto_903318 ) ) ( not ( = ?auto_903309 ?auto_903319 ) ) ( not ( = ?auto_903309 ?auto_903320 ) ) ( not ( = ?auto_903309 ?auto_903321 ) ) ( not ( = ?auto_903309 ?auto_903322 ) ) ( not ( = ?auto_903309 ?auto_903323 ) ) ( not ( = ?auto_903309 ?auto_903324 ) ) ( not ( = ?auto_903310 ?auto_903311 ) ) ( not ( = ?auto_903310 ?auto_903312 ) ) ( not ( = ?auto_903310 ?auto_903313 ) ) ( not ( = ?auto_903310 ?auto_903314 ) ) ( not ( = ?auto_903310 ?auto_903315 ) ) ( not ( = ?auto_903310 ?auto_903316 ) ) ( not ( = ?auto_903310 ?auto_903317 ) ) ( not ( = ?auto_903310 ?auto_903318 ) ) ( not ( = ?auto_903310 ?auto_903319 ) ) ( not ( = ?auto_903310 ?auto_903320 ) ) ( not ( = ?auto_903310 ?auto_903321 ) ) ( not ( = ?auto_903310 ?auto_903322 ) ) ( not ( = ?auto_903310 ?auto_903323 ) ) ( not ( = ?auto_903310 ?auto_903324 ) ) ( not ( = ?auto_903311 ?auto_903312 ) ) ( not ( = ?auto_903311 ?auto_903313 ) ) ( not ( = ?auto_903311 ?auto_903314 ) ) ( not ( = ?auto_903311 ?auto_903315 ) ) ( not ( = ?auto_903311 ?auto_903316 ) ) ( not ( = ?auto_903311 ?auto_903317 ) ) ( not ( = ?auto_903311 ?auto_903318 ) ) ( not ( = ?auto_903311 ?auto_903319 ) ) ( not ( = ?auto_903311 ?auto_903320 ) ) ( not ( = ?auto_903311 ?auto_903321 ) ) ( not ( = ?auto_903311 ?auto_903322 ) ) ( not ( = ?auto_903311 ?auto_903323 ) ) ( not ( = ?auto_903311 ?auto_903324 ) ) ( not ( = ?auto_903312 ?auto_903313 ) ) ( not ( = ?auto_903312 ?auto_903314 ) ) ( not ( = ?auto_903312 ?auto_903315 ) ) ( not ( = ?auto_903312 ?auto_903316 ) ) ( not ( = ?auto_903312 ?auto_903317 ) ) ( not ( = ?auto_903312 ?auto_903318 ) ) ( not ( = ?auto_903312 ?auto_903319 ) ) ( not ( = ?auto_903312 ?auto_903320 ) ) ( not ( = ?auto_903312 ?auto_903321 ) ) ( not ( = ?auto_903312 ?auto_903322 ) ) ( not ( = ?auto_903312 ?auto_903323 ) ) ( not ( = ?auto_903312 ?auto_903324 ) ) ( not ( = ?auto_903313 ?auto_903314 ) ) ( not ( = ?auto_903313 ?auto_903315 ) ) ( not ( = ?auto_903313 ?auto_903316 ) ) ( not ( = ?auto_903313 ?auto_903317 ) ) ( not ( = ?auto_903313 ?auto_903318 ) ) ( not ( = ?auto_903313 ?auto_903319 ) ) ( not ( = ?auto_903313 ?auto_903320 ) ) ( not ( = ?auto_903313 ?auto_903321 ) ) ( not ( = ?auto_903313 ?auto_903322 ) ) ( not ( = ?auto_903313 ?auto_903323 ) ) ( not ( = ?auto_903313 ?auto_903324 ) ) ( not ( = ?auto_903314 ?auto_903315 ) ) ( not ( = ?auto_903314 ?auto_903316 ) ) ( not ( = ?auto_903314 ?auto_903317 ) ) ( not ( = ?auto_903314 ?auto_903318 ) ) ( not ( = ?auto_903314 ?auto_903319 ) ) ( not ( = ?auto_903314 ?auto_903320 ) ) ( not ( = ?auto_903314 ?auto_903321 ) ) ( not ( = ?auto_903314 ?auto_903322 ) ) ( not ( = ?auto_903314 ?auto_903323 ) ) ( not ( = ?auto_903314 ?auto_903324 ) ) ( not ( = ?auto_903315 ?auto_903316 ) ) ( not ( = ?auto_903315 ?auto_903317 ) ) ( not ( = ?auto_903315 ?auto_903318 ) ) ( not ( = ?auto_903315 ?auto_903319 ) ) ( not ( = ?auto_903315 ?auto_903320 ) ) ( not ( = ?auto_903315 ?auto_903321 ) ) ( not ( = ?auto_903315 ?auto_903322 ) ) ( not ( = ?auto_903315 ?auto_903323 ) ) ( not ( = ?auto_903315 ?auto_903324 ) ) ( not ( = ?auto_903316 ?auto_903317 ) ) ( not ( = ?auto_903316 ?auto_903318 ) ) ( not ( = ?auto_903316 ?auto_903319 ) ) ( not ( = ?auto_903316 ?auto_903320 ) ) ( not ( = ?auto_903316 ?auto_903321 ) ) ( not ( = ?auto_903316 ?auto_903322 ) ) ( not ( = ?auto_903316 ?auto_903323 ) ) ( not ( = ?auto_903316 ?auto_903324 ) ) ( not ( = ?auto_903317 ?auto_903318 ) ) ( not ( = ?auto_903317 ?auto_903319 ) ) ( not ( = ?auto_903317 ?auto_903320 ) ) ( not ( = ?auto_903317 ?auto_903321 ) ) ( not ( = ?auto_903317 ?auto_903322 ) ) ( not ( = ?auto_903317 ?auto_903323 ) ) ( not ( = ?auto_903317 ?auto_903324 ) ) ( not ( = ?auto_903318 ?auto_903319 ) ) ( not ( = ?auto_903318 ?auto_903320 ) ) ( not ( = ?auto_903318 ?auto_903321 ) ) ( not ( = ?auto_903318 ?auto_903322 ) ) ( not ( = ?auto_903318 ?auto_903323 ) ) ( not ( = ?auto_903318 ?auto_903324 ) ) ( not ( = ?auto_903319 ?auto_903320 ) ) ( not ( = ?auto_903319 ?auto_903321 ) ) ( not ( = ?auto_903319 ?auto_903322 ) ) ( not ( = ?auto_903319 ?auto_903323 ) ) ( not ( = ?auto_903319 ?auto_903324 ) ) ( not ( = ?auto_903320 ?auto_903321 ) ) ( not ( = ?auto_903320 ?auto_903322 ) ) ( not ( = ?auto_903320 ?auto_903323 ) ) ( not ( = ?auto_903320 ?auto_903324 ) ) ( not ( = ?auto_903321 ?auto_903322 ) ) ( not ( = ?auto_903321 ?auto_903323 ) ) ( not ( = ?auto_903321 ?auto_903324 ) ) ( not ( = ?auto_903322 ?auto_903323 ) ) ( not ( = ?auto_903322 ?auto_903324 ) ) ( not ( = ?auto_903323 ?auto_903324 ) ) ( CLEAR ?auto_903321 ) ( ON ?auto_903322 ?auto_903323 ) ( CLEAR ?auto_903322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_903308 ?auto_903309 ?auto_903310 ?auto_903311 ?auto_903312 ?auto_903313 ?auto_903314 ?auto_903315 ?auto_903316 ?auto_903317 ?auto_903318 ?auto_903319 ?auto_903320 ?auto_903321 ?auto_903322 )
      ( MAKE-16PILE ?auto_903308 ?auto_903309 ?auto_903310 ?auto_903311 ?auto_903312 ?auto_903313 ?auto_903314 ?auto_903315 ?auto_903316 ?auto_903317 ?auto_903318 ?auto_903319 ?auto_903320 ?auto_903321 ?auto_903322 ?auto_903323 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_903374 - BLOCK
      ?auto_903375 - BLOCK
      ?auto_903376 - BLOCK
      ?auto_903377 - BLOCK
      ?auto_903378 - BLOCK
      ?auto_903379 - BLOCK
      ?auto_903380 - BLOCK
      ?auto_903381 - BLOCK
      ?auto_903382 - BLOCK
      ?auto_903383 - BLOCK
      ?auto_903384 - BLOCK
      ?auto_903385 - BLOCK
      ?auto_903386 - BLOCK
      ?auto_903387 - BLOCK
      ?auto_903388 - BLOCK
      ?auto_903389 - BLOCK
    )
    :vars
    (
      ?auto_903390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903389 ?auto_903390 ) ( ON-TABLE ?auto_903374 ) ( ON ?auto_903375 ?auto_903374 ) ( ON ?auto_903376 ?auto_903375 ) ( ON ?auto_903377 ?auto_903376 ) ( ON ?auto_903378 ?auto_903377 ) ( ON ?auto_903379 ?auto_903378 ) ( ON ?auto_903380 ?auto_903379 ) ( ON ?auto_903381 ?auto_903380 ) ( ON ?auto_903382 ?auto_903381 ) ( ON ?auto_903383 ?auto_903382 ) ( ON ?auto_903384 ?auto_903383 ) ( ON ?auto_903385 ?auto_903384 ) ( ON ?auto_903386 ?auto_903385 ) ( not ( = ?auto_903374 ?auto_903375 ) ) ( not ( = ?auto_903374 ?auto_903376 ) ) ( not ( = ?auto_903374 ?auto_903377 ) ) ( not ( = ?auto_903374 ?auto_903378 ) ) ( not ( = ?auto_903374 ?auto_903379 ) ) ( not ( = ?auto_903374 ?auto_903380 ) ) ( not ( = ?auto_903374 ?auto_903381 ) ) ( not ( = ?auto_903374 ?auto_903382 ) ) ( not ( = ?auto_903374 ?auto_903383 ) ) ( not ( = ?auto_903374 ?auto_903384 ) ) ( not ( = ?auto_903374 ?auto_903385 ) ) ( not ( = ?auto_903374 ?auto_903386 ) ) ( not ( = ?auto_903374 ?auto_903387 ) ) ( not ( = ?auto_903374 ?auto_903388 ) ) ( not ( = ?auto_903374 ?auto_903389 ) ) ( not ( = ?auto_903374 ?auto_903390 ) ) ( not ( = ?auto_903375 ?auto_903376 ) ) ( not ( = ?auto_903375 ?auto_903377 ) ) ( not ( = ?auto_903375 ?auto_903378 ) ) ( not ( = ?auto_903375 ?auto_903379 ) ) ( not ( = ?auto_903375 ?auto_903380 ) ) ( not ( = ?auto_903375 ?auto_903381 ) ) ( not ( = ?auto_903375 ?auto_903382 ) ) ( not ( = ?auto_903375 ?auto_903383 ) ) ( not ( = ?auto_903375 ?auto_903384 ) ) ( not ( = ?auto_903375 ?auto_903385 ) ) ( not ( = ?auto_903375 ?auto_903386 ) ) ( not ( = ?auto_903375 ?auto_903387 ) ) ( not ( = ?auto_903375 ?auto_903388 ) ) ( not ( = ?auto_903375 ?auto_903389 ) ) ( not ( = ?auto_903375 ?auto_903390 ) ) ( not ( = ?auto_903376 ?auto_903377 ) ) ( not ( = ?auto_903376 ?auto_903378 ) ) ( not ( = ?auto_903376 ?auto_903379 ) ) ( not ( = ?auto_903376 ?auto_903380 ) ) ( not ( = ?auto_903376 ?auto_903381 ) ) ( not ( = ?auto_903376 ?auto_903382 ) ) ( not ( = ?auto_903376 ?auto_903383 ) ) ( not ( = ?auto_903376 ?auto_903384 ) ) ( not ( = ?auto_903376 ?auto_903385 ) ) ( not ( = ?auto_903376 ?auto_903386 ) ) ( not ( = ?auto_903376 ?auto_903387 ) ) ( not ( = ?auto_903376 ?auto_903388 ) ) ( not ( = ?auto_903376 ?auto_903389 ) ) ( not ( = ?auto_903376 ?auto_903390 ) ) ( not ( = ?auto_903377 ?auto_903378 ) ) ( not ( = ?auto_903377 ?auto_903379 ) ) ( not ( = ?auto_903377 ?auto_903380 ) ) ( not ( = ?auto_903377 ?auto_903381 ) ) ( not ( = ?auto_903377 ?auto_903382 ) ) ( not ( = ?auto_903377 ?auto_903383 ) ) ( not ( = ?auto_903377 ?auto_903384 ) ) ( not ( = ?auto_903377 ?auto_903385 ) ) ( not ( = ?auto_903377 ?auto_903386 ) ) ( not ( = ?auto_903377 ?auto_903387 ) ) ( not ( = ?auto_903377 ?auto_903388 ) ) ( not ( = ?auto_903377 ?auto_903389 ) ) ( not ( = ?auto_903377 ?auto_903390 ) ) ( not ( = ?auto_903378 ?auto_903379 ) ) ( not ( = ?auto_903378 ?auto_903380 ) ) ( not ( = ?auto_903378 ?auto_903381 ) ) ( not ( = ?auto_903378 ?auto_903382 ) ) ( not ( = ?auto_903378 ?auto_903383 ) ) ( not ( = ?auto_903378 ?auto_903384 ) ) ( not ( = ?auto_903378 ?auto_903385 ) ) ( not ( = ?auto_903378 ?auto_903386 ) ) ( not ( = ?auto_903378 ?auto_903387 ) ) ( not ( = ?auto_903378 ?auto_903388 ) ) ( not ( = ?auto_903378 ?auto_903389 ) ) ( not ( = ?auto_903378 ?auto_903390 ) ) ( not ( = ?auto_903379 ?auto_903380 ) ) ( not ( = ?auto_903379 ?auto_903381 ) ) ( not ( = ?auto_903379 ?auto_903382 ) ) ( not ( = ?auto_903379 ?auto_903383 ) ) ( not ( = ?auto_903379 ?auto_903384 ) ) ( not ( = ?auto_903379 ?auto_903385 ) ) ( not ( = ?auto_903379 ?auto_903386 ) ) ( not ( = ?auto_903379 ?auto_903387 ) ) ( not ( = ?auto_903379 ?auto_903388 ) ) ( not ( = ?auto_903379 ?auto_903389 ) ) ( not ( = ?auto_903379 ?auto_903390 ) ) ( not ( = ?auto_903380 ?auto_903381 ) ) ( not ( = ?auto_903380 ?auto_903382 ) ) ( not ( = ?auto_903380 ?auto_903383 ) ) ( not ( = ?auto_903380 ?auto_903384 ) ) ( not ( = ?auto_903380 ?auto_903385 ) ) ( not ( = ?auto_903380 ?auto_903386 ) ) ( not ( = ?auto_903380 ?auto_903387 ) ) ( not ( = ?auto_903380 ?auto_903388 ) ) ( not ( = ?auto_903380 ?auto_903389 ) ) ( not ( = ?auto_903380 ?auto_903390 ) ) ( not ( = ?auto_903381 ?auto_903382 ) ) ( not ( = ?auto_903381 ?auto_903383 ) ) ( not ( = ?auto_903381 ?auto_903384 ) ) ( not ( = ?auto_903381 ?auto_903385 ) ) ( not ( = ?auto_903381 ?auto_903386 ) ) ( not ( = ?auto_903381 ?auto_903387 ) ) ( not ( = ?auto_903381 ?auto_903388 ) ) ( not ( = ?auto_903381 ?auto_903389 ) ) ( not ( = ?auto_903381 ?auto_903390 ) ) ( not ( = ?auto_903382 ?auto_903383 ) ) ( not ( = ?auto_903382 ?auto_903384 ) ) ( not ( = ?auto_903382 ?auto_903385 ) ) ( not ( = ?auto_903382 ?auto_903386 ) ) ( not ( = ?auto_903382 ?auto_903387 ) ) ( not ( = ?auto_903382 ?auto_903388 ) ) ( not ( = ?auto_903382 ?auto_903389 ) ) ( not ( = ?auto_903382 ?auto_903390 ) ) ( not ( = ?auto_903383 ?auto_903384 ) ) ( not ( = ?auto_903383 ?auto_903385 ) ) ( not ( = ?auto_903383 ?auto_903386 ) ) ( not ( = ?auto_903383 ?auto_903387 ) ) ( not ( = ?auto_903383 ?auto_903388 ) ) ( not ( = ?auto_903383 ?auto_903389 ) ) ( not ( = ?auto_903383 ?auto_903390 ) ) ( not ( = ?auto_903384 ?auto_903385 ) ) ( not ( = ?auto_903384 ?auto_903386 ) ) ( not ( = ?auto_903384 ?auto_903387 ) ) ( not ( = ?auto_903384 ?auto_903388 ) ) ( not ( = ?auto_903384 ?auto_903389 ) ) ( not ( = ?auto_903384 ?auto_903390 ) ) ( not ( = ?auto_903385 ?auto_903386 ) ) ( not ( = ?auto_903385 ?auto_903387 ) ) ( not ( = ?auto_903385 ?auto_903388 ) ) ( not ( = ?auto_903385 ?auto_903389 ) ) ( not ( = ?auto_903385 ?auto_903390 ) ) ( not ( = ?auto_903386 ?auto_903387 ) ) ( not ( = ?auto_903386 ?auto_903388 ) ) ( not ( = ?auto_903386 ?auto_903389 ) ) ( not ( = ?auto_903386 ?auto_903390 ) ) ( not ( = ?auto_903387 ?auto_903388 ) ) ( not ( = ?auto_903387 ?auto_903389 ) ) ( not ( = ?auto_903387 ?auto_903390 ) ) ( not ( = ?auto_903388 ?auto_903389 ) ) ( not ( = ?auto_903388 ?auto_903390 ) ) ( not ( = ?auto_903389 ?auto_903390 ) ) ( ON ?auto_903388 ?auto_903389 ) ( CLEAR ?auto_903386 ) ( ON ?auto_903387 ?auto_903388 ) ( CLEAR ?auto_903387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_903374 ?auto_903375 ?auto_903376 ?auto_903377 ?auto_903378 ?auto_903379 ?auto_903380 ?auto_903381 ?auto_903382 ?auto_903383 ?auto_903384 ?auto_903385 ?auto_903386 ?auto_903387 )
      ( MAKE-16PILE ?auto_903374 ?auto_903375 ?auto_903376 ?auto_903377 ?auto_903378 ?auto_903379 ?auto_903380 ?auto_903381 ?auto_903382 ?auto_903383 ?auto_903384 ?auto_903385 ?auto_903386 ?auto_903387 ?auto_903388 ?auto_903389 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_903440 - BLOCK
      ?auto_903441 - BLOCK
      ?auto_903442 - BLOCK
      ?auto_903443 - BLOCK
      ?auto_903444 - BLOCK
      ?auto_903445 - BLOCK
      ?auto_903446 - BLOCK
      ?auto_903447 - BLOCK
      ?auto_903448 - BLOCK
      ?auto_903449 - BLOCK
      ?auto_903450 - BLOCK
      ?auto_903451 - BLOCK
      ?auto_903452 - BLOCK
      ?auto_903453 - BLOCK
      ?auto_903454 - BLOCK
      ?auto_903455 - BLOCK
    )
    :vars
    (
      ?auto_903456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903455 ?auto_903456 ) ( ON-TABLE ?auto_903440 ) ( ON ?auto_903441 ?auto_903440 ) ( ON ?auto_903442 ?auto_903441 ) ( ON ?auto_903443 ?auto_903442 ) ( ON ?auto_903444 ?auto_903443 ) ( ON ?auto_903445 ?auto_903444 ) ( ON ?auto_903446 ?auto_903445 ) ( ON ?auto_903447 ?auto_903446 ) ( ON ?auto_903448 ?auto_903447 ) ( ON ?auto_903449 ?auto_903448 ) ( ON ?auto_903450 ?auto_903449 ) ( ON ?auto_903451 ?auto_903450 ) ( not ( = ?auto_903440 ?auto_903441 ) ) ( not ( = ?auto_903440 ?auto_903442 ) ) ( not ( = ?auto_903440 ?auto_903443 ) ) ( not ( = ?auto_903440 ?auto_903444 ) ) ( not ( = ?auto_903440 ?auto_903445 ) ) ( not ( = ?auto_903440 ?auto_903446 ) ) ( not ( = ?auto_903440 ?auto_903447 ) ) ( not ( = ?auto_903440 ?auto_903448 ) ) ( not ( = ?auto_903440 ?auto_903449 ) ) ( not ( = ?auto_903440 ?auto_903450 ) ) ( not ( = ?auto_903440 ?auto_903451 ) ) ( not ( = ?auto_903440 ?auto_903452 ) ) ( not ( = ?auto_903440 ?auto_903453 ) ) ( not ( = ?auto_903440 ?auto_903454 ) ) ( not ( = ?auto_903440 ?auto_903455 ) ) ( not ( = ?auto_903440 ?auto_903456 ) ) ( not ( = ?auto_903441 ?auto_903442 ) ) ( not ( = ?auto_903441 ?auto_903443 ) ) ( not ( = ?auto_903441 ?auto_903444 ) ) ( not ( = ?auto_903441 ?auto_903445 ) ) ( not ( = ?auto_903441 ?auto_903446 ) ) ( not ( = ?auto_903441 ?auto_903447 ) ) ( not ( = ?auto_903441 ?auto_903448 ) ) ( not ( = ?auto_903441 ?auto_903449 ) ) ( not ( = ?auto_903441 ?auto_903450 ) ) ( not ( = ?auto_903441 ?auto_903451 ) ) ( not ( = ?auto_903441 ?auto_903452 ) ) ( not ( = ?auto_903441 ?auto_903453 ) ) ( not ( = ?auto_903441 ?auto_903454 ) ) ( not ( = ?auto_903441 ?auto_903455 ) ) ( not ( = ?auto_903441 ?auto_903456 ) ) ( not ( = ?auto_903442 ?auto_903443 ) ) ( not ( = ?auto_903442 ?auto_903444 ) ) ( not ( = ?auto_903442 ?auto_903445 ) ) ( not ( = ?auto_903442 ?auto_903446 ) ) ( not ( = ?auto_903442 ?auto_903447 ) ) ( not ( = ?auto_903442 ?auto_903448 ) ) ( not ( = ?auto_903442 ?auto_903449 ) ) ( not ( = ?auto_903442 ?auto_903450 ) ) ( not ( = ?auto_903442 ?auto_903451 ) ) ( not ( = ?auto_903442 ?auto_903452 ) ) ( not ( = ?auto_903442 ?auto_903453 ) ) ( not ( = ?auto_903442 ?auto_903454 ) ) ( not ( = ?auto_903442 ?auto_903455 ) ) ( not ( = ?auto_903442 ?auto_903456 ) ) ( not ( = ?auto_903443 ?auto_903444 ) ) ( not ( = ?auto_903443 ?auto_903445 ) ) ( not ( = ?auto_903443 ?auto_903446 ) ) ( not ( = ?auto_903443 ?auto_903447 ) ) ( not ( = ?auto_903443 ?auto_903448 ) ) ( not ( = ?auto_903443 ?auto_903449 ) ) ( not ( = ?auto_903443 ?auto_903450 ) ) ( not ( = ?auto_903443 ?auto_903451 ) ) ( not ( = ?auto_903443 ?auto_903452 ) ) ( not ( = ?auto_903443 ?auto_903453 ) ) ( not ( = ?auto_903443 ?auto_903454 ) ) ( not ( = ?auto_903443 ?auto_903455 ) ) ( not ( = ?auto_903443 ?auto_903456 ) ) ( not ( = ?auto_903444 ?auto_903445 ) ) ( not ( = ?auto_903444 ?auto_903446 ) ) ( not ( = ?auto_903444 ?auto_903447 ) ) ( not ( = ?auto_903444 ?auto_903448 ) ) ( not ( = ?auto_903444 ?auto_903449 ) ) ( not ( = ?auto_903444 ?auto_903450 ) ) ( not ( = ?auto_903444 ?auto_903451 ) ) ( not ( = ?auto_903444 ?auto_903452 ) ) ( not ( = ?auto_903444 ?auto_903453 ) ) ( not ( = ?auto_903444 ?auto_903454 ) ) ( not ( = ?auto_903444 ?auto_903455 ) ) ( not ( = ?auto_903444 ?auto_903456 ) ) ( not ( = ?auto_903445 ?auto_903446 ) ) ( not ( = ?auto_903445 ?auto_903447 ) ) ( not ( = ?auto_903445 ?auto_903448 ) ) ( not ( = ?auto_903445 ?auto_903449 ) ) ( not ( = ?auto_903445 ?auto_903450 ) ) ( not ( = ?auto_903445 ?auto_903451 ) ) ( not ( = ?auto_903445 ?auto_903452 ) ) ( not ( = ?auto_903445 ?auto_903453 ) ) ( not ( = ?auto_903445 ?auto_903454 ) ) ( not ( = ?auto_903445 ?auto_903455 ) ) ( not ( = ?auto_903445 ?auto_903456 ) ) ( not ( = ?auto_903446 ?auto_903447 ) ) ( not ( = ?auto_903446 ?auto_903448 ) ) ( not ( = ?auto_903446 ?auto_903449 ) ) ( not ( = ?auto_903446 ?auto_903450 ) ) ( not ( = ?auto_903446 ?auto_903451 ) ) ( not ( = ?auto_903446 ?auto_903452 ) ) ( not ( = ?auto_903446 ?auto_903453 ) ) ( not ( = ?auto_903446 ?auto_903454 ) ) ( not ( = ?auto_903446 ?auto_903455 ) ) ( not ( = ?auto_903446 ?auto_903456 ) ) ( not ( = ?auto_903447 ?auto_903448 ) ) ( not ( = ?auto_903447 ?auto_903449 ) ) ( not ( = ?auto_903447 ?auto_903450 ) ) ( not ( = ?auto_903447 ?auto_903451 ) ) ( not ( = ?auto_903447 ?auto_903452 ) ) ( not ( = ?auto_903447 ?auto_903453 ) ) ( not ( = ?auto_903447 ?auto_903454 ) ) ( not ( = ?auto_903447 ?auto_903455 ) ) ( not ( = ?auto_903447 ?auto_903456 ) ) ( not ( = ?auto_903448 ?auto_903449 ) ) ( not ( = ?auto_903448 ?auto_903450 ) ) ( not ( = ?auto_903448 ?auto_903451 ) ) ( not ( = ?auto_903448 ?auto_903452 ) ) ( not ( = ?auto_903448 ?auto_903453 ) ) ( not ( = ?auto_903448 ?auto_903454 ) ) ( not ( = ?auto_903448 ?auto_903455 ) ) ( not ( = ?auto_903448 ?auto_903456 ) ) ( not ( = ?auto_903449 ?auto_903450 ) ) ( not ( = ?auto_903449 ?auto_903451 ) ) ( not ( = ?auto_903449 ?auto_903452 ) ) ( not ( = ?auto_903449 ?auto_903453 ) ) ( not ( = ?auto_903449 ?auto_903454 ) ) ( not ( = ?auto_903449 ?auto_903455 ) ) ( not ( = ?auto_903449 ?auto_903456 ) ) ( not ( = ?auto_903450 ?auto_903451 ) ) ( not ( = ?auto_903450 ?auto_903452 ) ) ( not ( = ?auto_903450 ?auto_903453 ) ) ( not ( = ?auto_903450 ?auto_903454 ) ) ( not ( = ?auto_903450 ?auto_903455 ) ) ( not ( = ?auto_903450 ?auto_903456 ) ) ( not ( = ?auto_903451 ?auto_903452 ) ) ( not ( = ?auto_903451 ?auto_903453 ) ) ( not ( = ?auto_903451 ?auto_903454 ) ) ( not ( = ?auto_903451 ?auto_903455 ) ) ( not ( = ?auto_903451 ?auto_903456 ) ) ( not ( = ?auto_903452 ?auto_903453 ) ) ( not ( = ?auto_903452 ?auto_903454 ) ) ( not ( = ?auto_903452 ?auto_903455 ) ) ( not ( = ?auto_903452 ?auto_903456 ) ) ( not ( = ?auto_903453 ?auto_903454 ) ) ( not ( = ?auto_903453 ?auto_903455 ) ) ( not ( = ?auto_903453 ?auto_903456 ) ) ( not ( = ?auto_903454 ?auto_903455 ) ) ( not ( = ?auto_903454 ?auto_903456 ) ) ( not ( = ?auto_903455 ?auto_903456 ) ) ( ON ?auto_903454 ?auto_903455 ) ( ON ?auto_903453 ?auto_903454 ) ( CLEAR ?auto_903451 ) ( ON ?auto_903452 ?auto_903453 ) ( CLEAR ?auto_903452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_903440 ?auto_903441 ?auto_903442 ?auto_903443 ?auto_903444 ?auto_903445 ?auto_903446 ?auto_903447 ?auto_903448 ?auto_903449 ?auto_903450 ?auto_903451 ?auto_903452 )
      ( MAKE-16PILE ?auto_903440 ?auto_903441 ?auto_903442 ?auto_903443 ?auto_903444 ?auto_903445 ?auto_903446 ?auto_903447 ?auto_903448 ?auto_903449 ?auto_903450 ?auto_903451 ?auto_903452 ?auto_903453 ?auto_903454 ?auto_903455 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_903506 - BLOCK
      ?auto_903507 - BLOCK
      ?auto_903508 - BLOCK
      ?auto_903509 - BLOCK
      ?auto_903510 - BLOCK
      ?auto_903511 - BLOCK
      ?auto_903512 - BLOCK
      ?auto_903513 - BLOCK
      ?auto_903514 - BLOCK
      ?auto_903515 - BLOCK
      ?auto_903516 - BLOCK
      ?auto_903517 - BLOCK
      ?auto_903518 - BLOCK
      ?auto_903519 - BLOCK
      ?auto_903520 - BLOCK
      ?auto_903521 - BLOCK
    )
    :vars
    (
      ?auto_903522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903521 ?auto_903522 ) ( ON-TABLE ?auto_903506 ) ( ON ?auto_903507 ?auto_903506 ) ( ON ?auto_903508 ?auto_903507 ) ( ON ?auto_903509 ?auto_903508 ) ( ON ?auto_903510 ?auto_903509 ) ( ON ?auto_903511 ?auto_903510 ) ( ON ?auto_903512 ?auto_903511 ) ( ON ?auto_903513 ?auto_903512 ) ( ON ?auto_903514 ?auto_903513 ) ( ON ?auto_903515 ?auto_903514 ) ( ON ?auto_903516 ?auto_903515 ) ( not ( = ?auto_903506 ?auto_903507 ) ) ( not ( = ?auto_903506 ?auto_903508 ) ) ( not ( = ?auto_903506 ?auto_903509 ) ) ( not ( = ?auto_903506 ?auto_903510 ) ) ( not ( = ?auto_903506 ?auto_903511 ) ) ( not ( = ?auto_903506 ?auto_903512 ) ) ( not ( = ?auto_903506 ?auto_903513 ) ) ( not ( = ?auto_903506 ?auto_903514 ) ) ( not ( = ?auto_903506 ?auto_903515 ) ) ( not ( = ?auto_903506 ?auto_903516 ) ) ( not ( = ?auto_903506 ?auto_903517 ) ) ( not ( = ?auto_903506 ?auto_903518 ) ) ( not ( = ?auto_903506 ?auto_903519 ) ) ( not ( = ?auto_903506 ?auto_903520 ) ) ( not ( = ?auto_903506 ?auto_903521 ) ) ( not ( = ?auto_903506 ?auto_903522 ) ) ( not ( = ?auto_903507 ?auto_903508 ) ) ( not ( = ?auto_903507 ?auto_903509 ) ) ( not ( = ?auto_903507 ?auto_903510 ) ) ( not ( = ?auto_903507 ?auto_903511 ) ) ( not ( = ?auto_903507 ?auto_903512 ) ) ( not ( = ?auto_903507 ?auto_903513 ) ) ( not ( = ?auto_903507 ?auto_903514 ) ) ( not ( = ?auto_903507 ?auto_903515 ) ) ( not ( = ?auto_903507 ?auto_903516 ) ) ( not ( = ?auto_903507 ?auto_903517 ) ) ( not ( = ?auto_903507 ?auto_903518 ) ) ( not ( = ?auto_903507 ?auto_903519 ) ) ( not ( = ?auto_903507 ?auto_903520 ) ) ( not ( = ?auto_903507 ?auto_903521 ) ) ( not ( = ?auto_903507 ?auto_903522 ) ) ( not ( = ?auto_903508 ?auto_903509 ) ) ( not ( = ?auto_903508 ?auto_903510 ) ) ( not ( = ?auto_903508 ?auto_903511 ) ) ( not ( = ?auto_903508 ?auto_903512 ) ) ( not ( = ?auto_903508 ?auto_903513 ) ) ( not ( = ?auto_903508 ?auto_903514 ) ) ( not ( = ?auto_903508 ?auto_903515 ) ) ( not ( = ?auto_903508 ?auto_903516 ) ) ( not ( = ?auto_903508 ?auto_903517 ) ) ( not ( = ?auto_903508 ?auto_903518 ) ) ( not ( = ?auto_903508 ?auto_903519 ) ) ( not ( = ?auto_903508 ?auto_903520 ) ) ( not ( = ?auto_903508 ?auto_903521 ) ) ( not ( = ?auto_903508 ?auto_903522 ) ) ( not ( = ?auto_903509 ?auto_903510 ) ) ( not ( = ?auto_903509 ?auto_903511 ) ) ( not ( = ?auto_903509 ?auto_903512 ) ) ( not ( = ?auto_903509 ?auto_903513 ) ) ( not ( = ?auto_903509 ?auto_903514 ) ) ( not ( = ?auto_903509 ?auto_903515 ) ) ( not ( = ?auto_903509 ?auto_903516 ) ) ( not ( = ?auto_903509 ?auto_903517 ) ) ( not ( = ?auto_903509 ?auto_903518 ) ) ( not ( = ?auto_903509 ?auto_903519 ) ) ( not ( = ?auto_903509 ?auto_903520 ) ) ( not ( = ?auto_903509 ?auto_903521 ) ) ( not ( = ?auto_903509 ?auto_903522 ) ) ( not ( = ?auto_903510 ?auto_903511 ) ) ( not ( = ?auto_903510 ?auto_903512 ) ) ( not ( = ?auto_903510 ?auto_903513 ) ) ( not ( = ?auto_903510 ?auto_903514 ) ) ( not ( = ?auto_903510 ?auto_903515 ) ) ( not ( = ?auto_903510 ?auto_903516 ) ) ( not ( = ?auto_903510 ?auto_903517 ) ) ( not ( = ?auto_903510 ?auto_903518 ) ) ( not ( = ?auto_903510 ?auto_903519 ) ) ( not ( = ?auto_903510 ?auto_903520 ) ) ( not ( = ?auto_903510 ?auto_903521 ) ) ( not ( = ?auto_903510 ?auto_903522 ) ) ( not ( = ?auto_903511 ?auto_903512 ) ) ( not ( = ?auto_903511 ?auto_903513 ) ) ( not ( = ?auto_903511 ?auto_903514 ) ) ( not ( = ?auto_903511 ?auto_903515 ) ) ( not ( = ?auto_903511 ?auto_903516 ) ) ( not ( = ?auto_903511 ?auto_903517 ) ) ( not ( = ?auto_903511 ?auto_903518 ) ) ( not ( = ?auto_903511 ?auto_903519 ) ) ( not ( = ?auto_903511 ?auto_903520 ) ) ( not ( = ?auto_903511 ?auto_903521 ) ) ( not ( = ?auto_903511 ?auto_903522 ) ) ( not ( = ?auto_903512 ?auto_903513 ) ) ( not ( = ?auto_903512 ?auto_903514 ) ) ( not ( = ?auto_903512 ?auto_903515 ) ) ( not ( = ?auto_903512 ?auto_903516 ) ) ( not ( = ?auto_903512 ?auto_903517 ) ) ( not ( = ?auto_903512 ?auto_903518 ) ) ( not ( = ?auto_903512 ?auto_903519 ) ) ( not ( = ?auto_903512 ?auto_903520 ) ) ( not ( = ?auto_903512 ?auto_903521 ) ) ( not ( = ?auto_903512 ?auto_903522 ) ) ( not ( = ?auto_903513 ?auto_903514 ) ) ( not ( = ?auto_903513 ?auto_903515 ) ) ( not ( = ?auto_903513 ?auto_903516 ) ) ( not ( = ?auto_903513 ?auto_903517 ) ) ( not ( = ?auto_903513 ?auto_903518 ) ) ( not ( = ?auto_903513 ?auto_903519 ) ) ( not ( = ?auto_903513 ?auto_903520 ) ) ( not ( = ?auto_903513 ?auto_903521 ) ) ( not ( = ?auto_903513 ?auto_903522 ) ) ( not ( = ?auto_903514 ?auto_903515 ) ) ( not ( = ?auto_903514 ?auto_903516 ) ) ( not ( = ?auto_903514 ?auto_903517 ) ) ( not ( = ?auto_903514 ?auto_903518 ) ) ( not ( = ?auto_903514 ?auto_903519 ) ) ( not ( = ?auto_903514 ?auto_903520 ) ) ( not ( = ?auto_903514 ?auto_903521 ) ) ( not ( = ?auto_903514 ?auto_903522 ) ) ( not ( = ?auto_903515 ?auto_903516 ) ) ( not ( = ?auto_903515 ?auto_903517 ) ) ( not ( = ?auto_903515 ?auto_903518 ) ) ( not ( = ?auto_903515 ?auto_903519 ) ) ( not ( = ?auto_903515 ?auto_903520 ) ) ( not ( = ?auto_903515 ?auto_903521 ) ) ( not ( = ?auto_903515 ?auto_903522 ) ) ( not ( = ?auto_903516 ?auto_903517 ) ) ( not ( = ?auto_903516 ?auto_903518 ) ) ( not ( = ?auto_903516 ?auto_903519 ) ) ( not ( = ?auto_903516 ?auto_903520 ) ) ( not ( = ?auto_903516 ?auto_903521 ) ) ( not ( = ?auto_903516 ?auto_903522 ) ) ( not ( = ?auto_903517 ?auto_903518 ) ) ( not ( = ?auto_903517 ?auto_903519 ) ) ( not ( = ?auto_903517 ?auto_903520 ) ) ( not ( = ?auto_903517 ?auto_903521 ) ) ( not ( = ?auto_903517 ?auto_903522 ) ) ( not ( = ?auto_903518 ?auto_903519 ) ) ( not ( = ?auto_903518 ?auto_903520 ) ) ( not ( = ?auto_903518 ?auto_903521 ) ) ( not ( = ?auto_903518 ?auto_903522 ) ) ( not ( = ?auto_903519 ?auto_903520 ) ) ( not ( = ?auto_903519 ?auto_903521 ) ) ( not ( = ?auto_903519 ?auto_903522 ) ) ( not ( = ?auto_903520 ?auto_903521 ) ) ( not ( = ?auto_903520 ?auto_903522 ) ) ( not ( = ?auto_903521 ?auto_903522 ) ) ( ON ?auto_903520 ?auto_903521 ) ( ON ?auto_903519 ?auto_903520 ) ( ON ?auto_903518 ?auto_903519 ) ( CLEAR ?auto_903516 ) ( ON ?auto_903517 ?auto_903518 ) ( CLEAR ?auto_903517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_903506 ?auto_903507 ?auto_903508 ?auto_903509 ?auto_903510 ?auto_903511 ?auto_903512 ?auto_903513 ?auto_903514 ?auto_903515 ?auto_903516 ?auto_903517 )
      ( MAKE-16PILE ?auto_903506 ?auto_903507 ?auto_903508 ?auto_903509 ?auto_903510 ?auto_903511 ?auto_903512 ?auto_903513 ?auto_903514 ?auto_903515 ?auto_903516 ?auto_903517 ?auto_903518 ?auto_903519 ?auto_903520 ?auto_903521 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_903572 - BLOCK
      ?auto_903573 - BLOCK
      ?auto_903574 - BLOCK
      ?auto_903575 - BLOCK
      ?auto_903576 - BLOCK
      ?auto_903577 - BLOCK
      ?auto_903578 - BLOCK
      ?auto_903579 - BLOCK
      ?auto_903580 - BLOCK
      ?auto_903581 - BLOCK
      ?auto_903582 - BLOCK
      ?auto_903583 - BLOCK
      ?auto_903584 - BLOCK
      ?auto_903585 - BLOCK
      ?auto_903586 - BLOCK
      ?auto_903587 - BLOCK
    )
    :vars
    (
      ?auto_903588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903587 ?auto_903588 ) ( ON-TABLE ?auto_903572 ) ( ON ?auto_903573 ?auto_903572 ) ( ON ?auto_903574 ?auto_903573 ) ( ON ?auto_903575 ?auto_903574 ) ( ON ?auto_903576 ?auto_903575 ) ( ON ?auto_903577 ?auto_903576 ) ( ON ?auto_903578 ?auto_903577 ) ( ON ?auto_903579 ?auto_903578 ) ( ON ?auto_903580 ?auto_903579 ) ( ON ?auto_903581 ?auto_903580 ) ( not ( = ?auto_903572 ?auto_903573 ) ) ( not ( = ?auto_903572 ?auto_903574 ) ) ( not ( = ?auto_903572 ?auto_903575 ) ) ( not ( = ?auto_903572 ?auto_903576 ) ) ( not ( = ?auto_903572 ?auto_903577 ) ) ( not ( = ?auto_903572 ?auto_903578 ) ) ( not ( = ?auto_903572 ?auto_903579 ) ) ( not ( = ?auto_903572 ?auto_903580 ) ) ( not ( = ?auto_903572 ?auto_903581 ) ) ( not ( = ?auto_903572 ?auto_903582 ) ) ( not ( = ?auto_903572 ?auto_903583 ) ) ( not ( = ?auto_903572 ?auto_903584 ) ) ( not ( = ?auto_903572 ?auto_903585 ) ) ( not ( = ?auto_903572 ?auto_903586 ) ) ( not ( = ?auto_903572 ?auto_903587 ) ) ( not ( = ?auto_903572 ?auto_903588 ) ) ( not ( = ?auto_903573 ?auto_903574 ) ) ( not ( = ?auto_903573 ?auto_903575 ) ) ( not ( = ?auto_903573 ?auto_903576 ) ) ( not ( = ?auto_903573 ?auto_903577 ) ) ( not ( = ?auto_903573 ?auto_903578 ) ) ( not ( = ?auto_903573 ?auto_903579 ) ) ( not ( = ?auto_903573 ?auto_903580 ) ) ( not ( = ?auto_903573 ?auto_903581 ) ) ( not ( = ?auto_903573 ?auto_903582 ) ) ( not ( = ?auto_903573 ?auto_903583 ) ) ( not ( = ?auto_903573 ?auto_903584 ) ) ( not ( = ?auto_903573 ?auto_903585 ) ) ( not ( = ?auto_903573 ?auto_903586 ) ) ( not ( = ?auto_903573 ?auto_903587 ) ) ( not ( = ?auto_903573 ?auto_903588 ) ) ( not ( = ?auto_903574 ?auto_903575 ) ) ( not ( = ?auto_903574 ?auto_903576 ) ) ( not ( = ?auto_903574 ?auto_903577 ) ) ( not ( = ?auto_903574 ?auto_903578 ) ) ( not ( = ?auto_903574 ?auto_903579 ) ) ( not ( = ?auto_903574 ?auto_903580 ) ) ( not ( = ?auto_903574 ?auto_903581 ) ) ( not ( = ?auto_903574 ?auto_903582 ) ) ( not ( = ?auto_903574 ?auto_903583 ) ) ( not ( = ?auto_903574 ?auto_903584 ) ) ( not ( = ?auto_903574 ?auto_903585 ) ) ( not ( = ?auto_903574 ?auto_903586 ) ) ( not ( = ?auto_903574 ?auto_903587 ) ) ( not ( = ?auto_903574 ?auto_903588 ) ) ( not ( = ?auto_903575 ?auto_903576 ) ) ( not ( = ?auto_903575 ?auto_903577 ) ) ( not ( = ?auto_903575 ?auto_903578 ) ) ( not ( = ?auto_903575 ?auto_903579 ) ) ( not ( = ?auto_903575 ?auto_903580 ) ) ( not ( = ?auto_903575 ?auto_903581 ) ) ( not ( = ?auto_903575 ?auto_903582 ) ) ( not ( = ?auto_903575 ?auto_903583 ) ) ( not ( = ?auto_903575 ?auto_903584 ) ) ( not ( = ?auto_903575 ?auto_903585 ) ) ( not ( = ?auto_903575 ?auto_903586 ) ) ( not ( = ?auto_903575 ?auto_903587 ) ) ( not ( = ?auto_903575 ?auto_903588 ) ) ( not ( = ?auto_903576 ?auto_903577 ) ) ( not ( = ?auto_903576 ?auto_903578 ) ) ( not ( = ?auto_903576 ?auto_903579 ) ) ( not ( = ?auto_903576 ?auto_903580 ) ) ( not ( = ?auto_903576 ?auto_903581 ) ) ( not ( = ?auto_903576 ?auto_903582 ) ) ( not ( = ?auto_903576 ?auto_903583 ) ) ( not ( = ?auto_903576 ?auto_903584 ) ) ( not ( = ?auto_903576 ?auto_903585 ) ) ( not ( = ?auto_903576 ?auto_903586 ) ) ( not ( = ?auto_903576 ?auto_903587 ) ) ( not ( = ?auto_903576 ?auto_903588 ) ) ( not ( = ?auto_903577 ?auto_903578 ) ) ( not ( = ?auto_903577 ?auto_903579 ) ) ( not ( = ?auto_903577 ?auto_903580 ) ) ( not ( = ?auto_903577 ?auto_903581 ) ) ( not ( = ?auto_903577 ?auto_903582 ) ) ( not ( = ?auto_903577 ?auto_903583 ) ) ( not ( = ?auto_903577 ?auto_903584 ) ) ( not ( = ?auto_903577 ?auto_903585 ) ) ( not ( = ?auto_903577 ?auto_903586 ) ) ( not ( = ?auto_903577 ?auto_903587 ) ) ( not ( = ?auto_903577 ?auto_903588 ) ) ( not ( = ?auto_903578 ?auto_903579 ) ) ( not ( = ?auto_903578 ?auto_903580 ) ) ( not ( = ?auto_903578 ?auto_903581 ) ) ( not ( = ?auto_903578 ?auto_903582 ) ) ( not ( = ?auto_903578 ?auto_903583 ) ) ( not ( = ?auto_903578 ?auto_903584 ) ) ( not ( = ?auto_903578 ?auto_903585 ) ) ( not ( = ?auto_903578 ?auto_903586 ) ) ( not ( = ?auto_903578 ?auto_903587 ) ) ( not ( = ?auto_903578 ?auto_903588 ) ) ( not ( = ?auto_903579 ?auto_903580 ) ) ( not ( = ?auto_903579 ?auto_903581 ) ) ( not ( = ?auto_903579 ?auto_903582 ) ) ( not ( = ?auto_903579 ?auto_903583 ) ) ( not ( = ?auto_903579 ?auto_903584 ) ) ( not ( = ?auto_903579 ?auto_903585 ) ) ( not ( = ?auto_903579 ?auto_903586 ) ) ( not ( = ?auto_903579 ?auto_903587 ) ) ( not ( = ?auto_903579 ?auto_903588 ) ) ( not ( = ?auto_903580 ?auto_903581 ) ) ( not ( = ?auto_903580 ?auto_903582 ) ) ( not ( = ?auto_903580 ?auto_903583 ) ) ( not ( = ?auto_903580 ?auto_903584 ) ) ( not ( = ?auto_903580 ?auto_903585 ) ) ( not ( = ?auto_903580 ?auto_903586 ) ) ( not ( = ?auto_903580 ?auto_903587 ) ) ( not ( = ?auto_903580 ?auto_903588 ) ) ( not ( = ?auto_903581 ?auto_903582 ) ) ( not ( = ?auto_903581 ?auto_903583 ) ) ( not ( = ?auto_903581 ?auto_903584 ) ) ( not ( = ?auto_903581 ?auto_903585 ) ) ( not ( = ?auto_903581 ?auto_903586 ) ) ( not ( = ?auto_903581 ?auto_903587 ) ) ( not ( = ?auto_903581 ?auto_903588 ) ) ( not ( = ?auto_903582 ?auto_903583 ) ) ( not ( = ?auto_903582 ?auto_903584 ) ) ( not ( = ?auto_903582 ?auto_903585 ) ) ( not ( = ?auto_903582 ?auto_903586 ) ) ( not ( = ?auto_903582 ?auto_903587 ) ) ( not ( = ?auto_903582 ?auto_903588 ) ) ( not ( = ?auto_903583 ?auto_903584 ) ) ( not ( = ?auto_903583 ?auto_903585 ) ) ( not ( = ?auto_903583 ?auto_903586 ) ) ( not ( = ?auto_903583 ?auto_903587 ) ) ( not ( = ?auto_903583 ?auto_903588 ) ) ( not ( = ?auto_903584 ?auto_903585 ) ) ( not ( = ?auto_903584 ?auto_903586 ) ) ( not ( = ?auto_903584 ?auto_903587 ) ) ( not ( = ?auto_903584 ?auto_903588 ) ) ( not ( = ?auto_903585 ?auto_903586 ) ) ( not ( = ?auto_903585 ?auto_903587 ) ) ( not ( = ?auto_903585 ?auto_903588 ) ) ( not ( = ?auto_903586 ?auto_903587 ) ) ( not ( = ?auto_903586 ?auto_903588 ) ) ( not ( = ?auto_903587 ?auto_903588 ) ) ( ON ?auto_903586 ?auto_903587 ) ( ON ?auto_903585 ?auto_903586 ) ( ON ?auto_903584 ?auto_903585 ) ( ON ?auto_903583 ?auto_903584 ) ( CLEAR ?auto_903581 ) ( ON ?auto_903582 ?auto_903583 ) ( CLEAR ?auto_903582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_903572 ?auto_903573 ?auto_903574 ?auto_903575 ?auto_903576 ?auto_903577 ?auto_903578 ?auto_903579 ?auto_903580 ?auto_903581 ?auto_903582 )
      ( MAKE-16PILE ?auto_903572 ?auto_903573 ?auto_903574 ?auto_903575 ?auto_903576 ?auto_903577 ?auto_903578 ?auto_903579 ?auto_903580 ?auto_903581 ?auto_903582 ?auto_903583 ?auto_903584 ?auto_903585 ?auto_903586 ?auto_903587 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_903638 - BLOCK
      ?auto_903639 - BLOCK
      ?auto_903640 - BLOCK
      ?auto_903641 - BLOCK
      ?auto_903642 - BLOCK
      ?auto_903643 - BLOCK
      ?auto_903644 - BLOCK
      ?auto_903645 - BLOCK
      ?auto_903646 - BLOCK
      ?auto_903647 - BLOCK
      ?auto_903648 - BLOCK
      ?auto_903649 - BLOCK
      ?auto_903650 - BLOCK
      ?auto_903651 - BLOCK
      ?auto_903652 - BLOCK
      ?auto_903653 - BLOCK
    )
    :vars
    (
      ?auto_903654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903653 ?auto_903654 ) ( ON-TABLE ?auto_903638 ) ( ON ?auto_903639 ?auto_903638 ) ( ON ?auto_903640 ?auto_903639 ) ( ON ?auto_903641 ?auto_903640 ) ( ON ?auto_903642 ?auto_903641 ) ( ON ?auto_903643 ?auto_903642 ) ( ON ?auto_903644 ?auto_903643 ) ( ON ?auto_903645 ?auto_903644 ) ( ON ?auto_903646 ?auto_903645 ) ( not ( = ?auto_903638 ?auto_903639 ) ) ( not ( = ?auto_903638 ?auto_903640 ) ) ( not ( = ?auto_903638 ?auto_903641 ) ) ( not ( = ?auto_903638 ?auto_903642 ) ) ( not ( = ?auto_903638 ?auto_903643 ) ) ( not ( = ?auto_903638 ?auto_903644 ) ) ( not ( = ?auto_903638 ?auto_903645 ) ) ( not ( = ?auto_903638 ?auto_903646 ) ) ( not ( = ?auto_903638 ?auto_903647 ) ) ( not ( = ?auto_903638 ?auto_903648 ) ) ( not ( = ?auto_903638 ?auto_903649 ) ) ( not ( = ?auto_903638 ?auto_903650 ) ) ( not ( = ?auto_903638 ?auto_903651 ) ) ( not ( = ?auto_903638 ?auto_903652 ) ) ( not ( = ?auto_903638 ?auto_903653 ) ) ( not ( = ?auto_903638 ?auto_903654 ) ) ( not ( = ?auto_903639 ?auto_903640 ) ) ( not ( = ?auto_903639 ?auto_903641 ) ) ( not ( = ?auto_903639 ?auto_903642 ) ) ( not ( = ?auto_903639 ?auto_903643 ) ) ( not ( = ?auto_903639 ?auto_903644 ) ) ( not ( = ?auto_903639 ?auto_903645 ) ) ( not ( = ?auto_903639 ?auto_903646 ) ) ( not ( = ?auto_903639 ?auto_903647 ) ) ( not ( = ?auto_903639 ?auto_903648 ) ) ( not ( = ?auto_903639 ?auto_903649 ) ) ( not ( = ?auto_903639 ?auto_903650 ) ) ( not ( = ?auto_903639 ?auto_903651 ) ) ( not ( = ?auto_903639 ?auto_903652 ) ) ( not ( = ?auto_903639 ?auto_903653 ) ) ( not ( = ?auto_903639 ?auto_903654 ) ) ( not ( = ?auto_903640 ?auto_903641 ) ) ( not ( = ?auto_903640 ?auto_903642 ) ) ( not ( = ?auto_903640 ?auto_903643 ) ) ( not ( = ?auto_903640 ?auto_903644 ) ) ( not ( = ?auto_903640 ?auto_903645 ) ) ( not ( = ?auto_903640 ?auto_903646 ) ) ( not ( = ?auto_903640 ?auto_903647 ) ) ( not ( = ?auto_903640 ?auto_903648 ) ) ( not ( = ?auto_903640 ?auto_903649 ) ) ( not ( = ?auto_903640 ?auto_903650 ) ) ( not ( = ?auto_903640 ?auto_903651 ) ) ( not ( = ?auto_903640 ?auto_903652 ) ) ( not ( = ?auto_903640 ?auto_903653 ) ) ( not ( = ?auto_903640 ?auto_903654 ) ) ( not ( = ?auto_903641 ?auto_903642 ) ) ( not ( = ?auto_903641 ?auto_903643 ) ) ( not ( = ?auto_903641 ?auto_903644 ) ) ( not ( = ?auto_903641 ?auto_903645 ) ) ( not ( = ?auto_903641 ?auto_903646 ) ) ( not ( = ?auto_903641 ?auto_903647 ) ) ( not ( = ?auto_903641 ?auto_903648 ) ) ( not ( = ?auto_903641 ?auto_903649 ) ) ( not ( = ?auto_903641 ?auto_903650 ) ) ( not ( = ?auto_903641 ?auto_903651 ) ) ( not ( = ?auto_903641 ?auto_903652 ) ) ( not ( = ?auto_903641 ?auto_903653 ) ) ( not ( = ?auto_903641 ?auto_903654 ) ) ( not ( = ?auto_903642 ?auto_903643 ) ) ( not ( = ?auto_903642 ?auto_903644 ) ) ( not ( = ?auto_903642 ?auto_903645 ) ) ( not ( = ?auto_903642 ?auto_903646 ) ) ( not ( = ?auto_903642 ?auto_903647 ) ) ( not ( = ?auto_903642 ?auto_903648 ) ) ( not ( = ?auto_903642 ?auto_903649 ) ) ( not ( = ?auto_903642 ?auto_903650 ) ) ( not ( = ?auto_903642 ?auto_903651 ) ) ( not ( = ?auto_903642 ?auto_903652 ) ) ( not ( = ?auto_903642 ?auto_903653 ) ) ( not ( = ?auto_903642 ?auto_903654 ) ) ( not ( = ?auto_903643 ?auto_903644 ) ) ( not ( = ?auto_903643 ?auto_903645 ) ) ( not ( = ?auto_903643 ?auto_903646 ) ) ( not ( = ?auto_903643 ?auto_903647 ) ) ( not ( = ?auto_903643 ?auto_903648 ) ) ( not ( = ?auto_903643 ?auto_903649 ) ) ( not ( = ?auto_903643 ?auto_903650 ) ) ( not ( = ?auto_903643 ?auto_903651 ) ) ( not ( = ?auto_903643 ?auto_903652 ) ) ( not ( = ?auto_903643 ?auto_903653 ) ) ( not ( = ?auto_903643 ?auto_903654 ) ) ( not ( = ?auto_903644 ?auto_903645 ) ) ( not ( = ?auto_903644 ?auto_903646 ) ) ( not ( = ?auto_903644 ?auto_903647 ) ) ( not ( = ?auto_903644 ?auto_903648 ) ) ( not ( = ?auto_903644 ?auto_903649 ) ) ( not ( = ?auto_903644 ?auto_903650 ) ) ( not ( = ?auto_903644 ?auto_903651 ) ) ( not ( = ?auto_903644 ?auto_903652 ) ) ( not ( = ?auto_903644 ?auto_903653 ) ) ( not ( = ?auto_903644 ?auto_903654 ) ) ( not ( = ?auto_903645 ?auto_903646 ) ) ( not ( = ?auto_903645 ?auto_903647 ) ) ( not ( = ?auto_903645 ?auto_903648 ) ) ( not ( = ?auto_903645 ?auto_903649 ) ) ( not ( = ?auto_903645 ?auto_903650 ) ) ( not ( = ?auto_903645 ?auto_903651 ) ) ( not ( = ?auto_903645 ?auto_903652 ) ) ( not ( = ?auto_903645 ?auto_903653 ) ) ( not ( = ?auto_903645 ?auto_903654 ) ) ( not ( = ?auto_903646 ?auto_903647 ) ) ( not ( = ?auto_903646 ?auto_903648 ) ) ( not ( = ?auto_903646 ?auto_903649 ) ) ( not ( = ?auto_903646 ?auto_903650 ) ) ( not ( = ?auto_903646 ?auto_903651 ) ) ( not ( = ?auto_903646 ?auto_903652 ) ) ( not ( = ?auto_903646 ?auto_903653 ) ) ( not ( = ?auto_903646 ?auto_903654 ) ) ( not ( = ?auto_903647 ?auto_903648 ) ) ( not ( = ?auto_903647 ?auto_903649 ) ) ( not ( = ?auto_903647 ?auto_903650 ) ) ( not ( = ?auto_903647 ?auto_903651 ) ) ( not ( = ?auto_903647 ?auto_903652 ) ) ( not ( = ?auto_903647 ?auto_903653 ) ) ( not ( = ?auto_903647 ?auto_903654 ) ) ( not ( = ?auto_903648 ?auto_903649 ) ) ( not ( = ?auto_903648 ?auto_903650 ) ) ( not ( = ?auto_903648 ?auto_903651 ) ) ( not ( = ?auto_903648 ?auto_903652 ) ) ( not ( = ?auto_903648 ?auto_903653 ) ) ( not ( = ?auto_903648 ?auto_903654 ) ) ( not ( = ?auto_903649 ?auto_903650 ) ) ( not ( = ?auto_903649 ?auto_903651 ) ) ( not ( = ?auto_903649 ?auto_903652 ) ) ( not ( = ?auto_903649 ?auto_903653 ) ) ( not ( = ?auto_903649 ?auto_903654 ) ) ( not ( = ?auto_903650 ?auto_903651 ) ) ( not ( = ?auto_903650 ?auto_903652 ) ) ( not ( = ?auto_903650 ?auto_903653 ) ) ( not ( = ?auto_903650 ?auto_903654 ) ) ( not ( = ?auto_903651 ?auto_903652 ) ) ( not ( = ?auto_903651 ?auto_903653 ) ) ( not ( = ?auto_903651 ?auto_903654 ) ) ( not ( = ?auto_903652 ?auto_903653 ) ) ( not ( = ?auto_903652 ?auto_903654 ) ) ( not ( = ?auto_903653 ?auto_903654 ) ) ( ON ?auto_903652 ?auto_903653 ) ( ON ?auto_903651 ?auto_903652 ) ( ON ?auto_903650 ?auto_903651 ) ( ON ?auto_903649 ?auto_903650 ) ( ON ?auto_903648 ?auto_903649 ) ( CLEAR ?auto_903646 ) ( ON ?auto_903647 ?auto_903648 ) ( CLEAR ?auto_903647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_903638 ?auto_903639 ?auto_903640 ?auto_903641 ?auto_903642 ?auto_903643 ?auto_903644 ?auto_903645 ?auto_903646 ?auto_903647 )
      ( MAKE-16PILE ?auto_903638 ?auto_903639 ?auto_903640 ?auto_903641 ?auto_903642 ?auto_903643 ?auto_903644 ?auto_903645 ?auto_903646 ?auto_903647 ?auto_903648 ?auto_903649 ?auto_903650 ?auto_903651 ?auto_903652 ?auto_903653 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_903704 - BLOCK
      ?auto_903705 - BLOCK
      ?auto_903706 - BLOCK
      ?auto_903707 - BLOCK
      ?auto_903708 - BLOCK
      ?auto_903709 - BLOCK
      ?auto_903710 - BLOCK
      ?auto_903711 - BLOCK
      ?auto_903712 - BLOCK
      ?auto_903713 - BLOCK
      ?auto_903714 - BLOCK
      ?auto_903715 - BLOCK
      ?auto_903716 - BLOCK
      ?auto_903717 - BLOCK
      ?auto_903718 - BLOCK
      ?auto_903719 - BLOCK
    )
    :vars
    (
      ?auto_903720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903719 ?auto_903720 ) ( ON-TABLE ?auto_903704 ) ( ON ?auto_903705 ?auto_903704 ) ( ON ?auto_903706 ?auto_903705 ) ( ON ?auto_903707 ?auto_903706 ) ( ON ?auto_903708 ?auto_903707 ) ( ON ?auto_903709 ?auto_903708 ) ( ON ?auto_903710 ?auto_903709 ) ( ON ?auto_903711 ?auto_903710 ) ( not ( = ?auto_903704 ?auto_903705 ) ) ( not ( = ?auto_903704 ?auto_903706 ) ) ( not ( = ?auto_903704 ?auto_903707 ) ) ( not ( = ?auto_903704 ?auto_903708 ) ) ( not ( = ?auto_903704 ?auto_903709 ) ) ( not ( = ?auto_903704 ?auto_903710 ) ) ( not ( = ?auto_903704 ?auto_903711 ) ) ( not ( = ?auto_903704 ?auto_903712 ) ) ( not ( = ?auto_903704 ?auto_903713 ) ) ( not ( = ?auto_903704 ?auto_903714 ) ) ( not ( = ?auto_903704 ?auto_903715 ) ) ( not ( = ?auto_903704 ?auto_903716 ) ) ( not ( = ?auto_903704 ?auto_903717 ) ) ( not ( = ?auto_903704 ?auto_903718 ) ) ( not ( = ?auto_903704 ?auto_903719 ) ) ( not ( = ?auto_903704 ?auto_903720 ) ) ( not ( = ?auto_903705 ?auto_903706 ) ) ( not ( = ?auto_903705 ?auto_903707 ) ) ( not ( = ?auto_903705 ?auto_903708 ) ) ( not ( = ?auto_903705 ?auto_903709 ) ) ( not ( = ?auto_903705 ?auto_903710 ) ) ( not ( = ?auto_903705 ?auto_903711 ) ) ( not ( = ?auto_903705 ?auto_903712 ) ) ( not ( = ?auto_903705 ?auto_903713 ) ) ( not ( = ?auto_903705 ?auto_903714 ) ) ( not ( = ?auto_903705 ?auto_903715 ) ) ( not ( = ?auto_903705 ?auto_903716 ) ) ( not ( = ?auto_903705 ?auto_903717 ) ) ( not ( = ?auto_903705 ?auto_903718 ) ) ( not ( = ?auto_903705 ?auto_903719 ) ) ( not ( = ?auto_903705 ?auto_903720 ) ) ( not ( = ?auto_903706 ?auto_903707 ) ) ( not ( = ?auto_903706 ?auto_903708 ) ) ( not ( = ?auto_903706 ?auto_903709 ) ) ( not ( = ?auto_903706 ?auto_903710 ) ) ( not ( = ?auto_903706 ?auto_903711 ) ) ( not ( = ?auto_903706 ?auto_903712 ) ) ( not ( = ?auto_903706 ?auto_903713 ) ) ( not ( = ?auto_903706 ?auto_903714 ) ) ( not ( = ?auto_903706 ?auto_903715 ) ) ( not ( = ?auto_903706 ?auto_903716 ) ) ( not ( = ?auto_903706 ?auto_903717 ) ) ( not ( = ?auto_903706 ?auto_903718 ) ) ( not ( = ?auto_903706 ?auto_903719 ) ) ( not ( = ?auto_903706 ?auto_903720 ) ) ( not ( = ?auto_903707 ?auto_903708 ) ) ( not ( = ?auto_903707 ?auto_903709 ) ) ( not ( = ?auto_903707 ?auto_903710 ) ) ( not ( = ?auto_903707 ?auto_903711 ) ) ( not ( = ?auto_903707 ?auto_903712 ) ) ( not ( = ?auto_903707 ?auto_903713 ) ) ( not ( = ?auto_903707 ?auto_903714 ) ) ( not ( = ?auto_903707 ?auto_903715 ) ) ( not ( = ?auto_903707 ?auto_903716 ) ) ( not ( = ?auto_903707 ?auto_903717 ) ) ( not ( = ?auto_903707 ?auto_903718 ) ) ( not ( = ?auto_903707 ?auto_903719 ) ) ( not ( = ?auto_903707 ?auto_903720 ) ) ( not ( = ?auto_903708 ?auto_903709 ) ) ( not ( = ?auto_903708 ?auto_903710 ) ) ( not ( = ?auto_903708 ?auto_903711 ) ) ( not ( = ?auto_903708 ?auto_903712 ) ) ( not ( = ?auto_903708 ?auto_903713 ) ) ( not ( = ?auto_903708 ?auto_903714 ) ) ( not ( = ?auto_903708 ?auto_903715 ) ) ( not ( = ?auto_903708 ?auto_903716 ) ) ( not ( = ?auto_903708 ?auto_903717 ) ) ( not ( = ?auto_903708 ?auto_903718 ) ) ( not ( = ?auto_903708 ?auto_903719 ) ) ( not ( = ?auto_903708 ?auto_903720 ) ) ( not ( = ?auto_903709 ?auto_903710 ) ) ( not ( = ?auto_903709 ?auto_903711 ) ) ( not ( = ?auto_903709 ?auto_903712 ) ) ( not ( = ?auto_903709 ?auto_903713 ) ) ( not ( = ?auto_903709 ?auto_903714 ) ) ( not ( = ?auto_903709 ?auto_903715 ) ) ( not ( = ?auto_903709 ?auto_903716 ) ) ( not ( = ?auto_903709 ?auto_903717 ) ) ( not ( = ?auto_903709 ?auto_903718 ) ) ( not ( = ?auto_903709 ?auto_903719 ) ) ( not ( = ?auto_903709 ?auto_903720 ) ) ( not ( = ?auto_903710 ?auto_903711 ) ) ( not ( = ?auto_903710 ?auto_903712 ) ) ( not ( = ?auto_903710 ?auto_903713 ) ) ( not ( = ?auto_903710 ?auto_903714 ) ) ( not ( = ?auto_903710 ?auto_903715 ) ) ( not ( = ?auto_903710 ?auto_903716 ) ) ( not ( = ?auto_903710 ?auto_903717 ) ) ( not ( = ?auto_903710 ?auto_903718 ) ) ( not ( = ?auto_903710 ?auto_903719 ) ) ( not ( = ?auto_903710 ?auto_903720 ) ) ( not ( = ?auto_903711 ?auto_903712 ) ) ( not ( = ?auto_903711 ?auto_903713 ) ) ( not ( = ?auto_903711 ?auto_903714 ) ) ( not ( = ?auto_903711 ?auto_903715 ) ) ( not ( = ?auto_903711 ?auto_903716 ) ) ( not ( = ?auto_903711 ?auto_903717 ) ) ( not ( = ?auto_903711 ?auto_903718 ) ) ( not ( = ?auto_903711 ?auto_903719 ) ) ( not ( = ?auto_903711 ?auto_903720 ) ) ( not ( = ?auto_903712 ?auto_903713 ) ) ( not ( = ?auto_903712 ?auto_903714 ) ) ( not ( = ?auto_903712 ?auto_903715 ) ) ( not ( = ?auto_903712 ?auto_903716 ) ) ( not ( = ?auto_903712 ?auto_903717 ) ) ( not ( = ?auto_903712 ?auto_903718 ) ) ( not ( = ?auto_903712 ?auto_903719 ) ) ( not ( = ?auto_903712 ?auto_903720 ) ) ( not ( = ?auto_903713 ?auto_903714 ) ) ( not ( = ?auto_903713 ?auto_903715 ) ) ( not ( = ?auto_903713 ?auto_903716 ) ) ( not ( = ?auto_903713 ?auto_903717 ) ) ( not ( = ?auto_903713 ?auto_903718 ) ) ( not ( = ?auto_903713 ?auto_903719 ) ) ( not ( = ?auto_903713 ?auto_903720 ) ) ( not ( = ?auto_903714 ?auto_903715 ) ) ( not ( = ?auto_903714 ?auto_903716 ) ) ( not ( = ?auto_903714 ?auto_903717 ) ) ( not ( = ?auto_903714 ?auto_903718 ) ) ( not ( = ?auto_903714 ?auto_903719 ) ) ( not ( = ?auto_903714 ?auto_903720 ) ) ( not ( = ?auto_903715 ?auto_903716 ) ) ( not ( = ?auto_903715 ?auto_903717 ) ) ( not ( = ?auto_903715 ?auto_903718 ) ) ( not ( = ?auto_903715 ?auto_903719 ) ) ( not ( = ?auto_903715 ?auto_903720 ) ) ( not ( = ?auto_903716 ?auto_903717 ) ) ( not ( = ?auto_903716 ?auto_903718 ) ) ( not ( = ?auto_903716 ?auto_903719 ) ) ( not ( = ?auto_903716 ?auto_903720 ) ) ( not ( = ?auto_903717 ?auto_903718 ) ) ( not ( = ?auto_903717 ?auto_903719 ) ) ( not ( = ?auto_903717 ?auto_903720 ) ) ( not ( = ?auto_903718 ?auto_903719 ) ) ( not ( = ?auto_903718 ?auto_903720 ) ) ( not ( = ?auto_903719 ?auto_903720 ) ) ( ON ?auto_903718 ?auto_903719 ) ( ON ?auto_903717 ?auto_903718 ) ( ON ?auto_903716 ?auto_903717 ) ( ON ?auto_903715 ?auto_903716 ) ( ON ?auto_903714 ?auto_903715 ) ( ON ?auto_903713 ?auto_903714 ) ( CLEAR ?auto_903711 ) ( ON ?auto_903712 ?auto_903713 ) ( CLEAR ?auto_903712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_903704 ?auto_903705 ?auto_903706 ?auto_903707 ?auto_903708 ?auto_903709 ?auto_903710 ?auto_903711 ?auto_903712 )
      ( MAKE-16PILE ?auto_903704 ?auto_903705 ?auto_903706 ?auto_903707 ?auto_903708 ?auto_903709 ?auto_903710 ?auto_903711 ?auto_903712 ?auto_903713 ?auto_903714 ?auto_903715 ?auto_903716 ?auto_903717 ?auto_903718 ?auto_903719 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_903770 - BLOCK
      ?auto_903771 - BLOCK
      ?auto_903772 - BLOCK
      ?auto_903773 - BLOCK
      ?auto_903774 - BLOCK
      ?auto_903775 - BLOCK
      ?auto_903776 - BLOCK
      ?auto_903777 - BLOCK
      ?auto_903778 - BLOCK
      ?auto_903779 - BLOCK
      ?auto_903780 - BLOCK
      ?auto_903781 - BLOCK
      ?auto_903782 - BLOCK
      ?auto_903783 - BLOCK
      ?auto_903784 - BLOCK
      ?auto_903785 - BLOCK
    )
    :vars
    (
      ?auto_903786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903785 ?auto_903786 ) ( ON-TABLE ?auto_903770 ) ( ON ?auto_903771 ?auto_903770 ) ( ON ?auto_903772 ?auto_903771 ) ( ON ?auto_903773 ?auto_903772 ) ( ON ?auto_903774 ?auto_903773 ) ( ON ?auto_903775 ?auto_903774 ) ( ON ?auto_903776 ?auto_903775 ) ( not ( = ?auto_903770 ?auto_903771 ) ) ( not ( = ?auto_903770 ?auto_903772 ) ) ( not ( = ?auto_903770 ?auto_903773 ) ) ( not ( = ?auto_903770 ?auto_903774 ) ) ( not ( = ?auto_903770 ?auto_903775 ) ) ( not ( = ?auto_903770 ?auto_903776 ) ) ( not ( = ?auto_903770 ?auto_903777 ) ) ( not ( = ?auto_903770 ?auto_903778 ) ) ( not ( = ?auto_903770 ?auto_903779 ) ) ( not ( = ?auto_903770 ?auto_903780 ) ) ( not ( = ?auto_903770 ?auto_903781 ) ) ( not ( = ?auto_903770 ?auto_903782 ) ) ( not ( = ?auto_903770 ?auto_903783 ) ) ( not ( = ?auto_903770 ?auto_903784 ) ) ( not ( = ?auto_903770 ?auto_903785 ) ) ( not ( = ?auto_903770 ?auto_903786 ) ) ( not ( = ?auto_903771 ?auto_903772 ) ) ( not ( = ?auto_903771 ?auto_903773 ) ) ( not ( = ?auto_903771 ?auto_903774 ) ) ( not ( = ?auto_903771 ?auto_903775 ) ) ( not ( = ?auto_903771 ?auto_903776 ) ) ( not ( = ?auto_903771 ?auto_903777 ) ) ( not ( = ?auto_903771 ?auto_903778 ) ) ( not ( = ?auto_903771 ?auto_903779 ) ) ( not ( = ?auto_903771 ?auto_903780 ) ) ( not ( = ?auto_903771 ?auto_903781 ) ) ( not ( = ?auto_903771 ?auto_903782 ) ) ( not ( = ?auto_903771 ?auto_903783 ) ) ( not ( = ?auto_903771 ?auto_903784 ) ) ( not ( = ?auto_903771 ?auto_903785 ) ) ( not ( = ?auto_903771 ?auto_903786 ) ) ( not ( = ?auto_903772 ?auto_903773 ) ) ( not ( = ?auto_903772 ?auto_903774 ) ) ( not ( = ?auto_903772 ?auto_903775 ) ) ( not ( = ?auto_903772 ?auto_903776 ) ) ( not ( = ?auto_903772 ?auto_903777 ) ) ( not ( = ?auto_903772 ?auto_903778 ) ) ( not ( = ?auto_903772 ?auto_903779 ) ) ( not ( = ?auto_903772 ?auto_903780 ) ) ( not ( = ?auto_903772 ?auto_903781 ) ) ( not ( = ?auto_903772 ?auto_903782 ) ) ( not ( = ?auto_903772 ?auto_903783 ) ) ( not ( = ?auto_903772 ?auto_903784 ) ) ( not ( = ?auto_903772 ?auto_903785 ) ) ( not ( = ?auto_903772 ?auto_903786 ) ) ( not ( = ?auto_903773 ?auto_903774 ) ) ( not ( = ?auto_903773 ?auto_903775 ) ) ( not ( = ?auto_903773 ?auto_903776 ) ) ( not ( = ?auto_903773 ?auto_903777 ) ) ( not ( = ?auto_903773 ?auto_903778 ) ) ( not ( = ?auto_903773 ?auto_903779 ) ) ( not ( = ?auto_903773 ?auto_903780 ) ) ( not ( = ?auto_903773 ?auto_903781 ) ) ( not ( = ?auto_903773 ?auto_903782 ) ) ( not ( = ?auto_903773 ?auto_903783 ) ) ( not ( = ?auto_903773 ?auto_903784 ) ) ( not ( = ?auto_903773 ?auto_903785 ) ) ( not ( = ?auto_903773 ?auto_903786 ) ) ( not ( = ?auto_903774 ?auto_903775 ) ) ( not ( = ?auto_903774 ?auto_903776 ) ) ( not ( = ?auto_903774 ?auto_903777 ) ) ( not ( = ?auto_903774 ?auto_903778 ) ) ( not ( = ?auto_903774 ?auto_903779 ) ) ( not ( = ?auto_903774 ?auto_903780 ) ) ( not ( = ?auto_903774 ?auto_903781 ) ) ( not ( = ?auto_903774 ?auto_903782 ) ) ( not ( = ?auto_903774 ?auto_903783 ) ) ( not ( = ?auto_903774 ?auto_903784 ) ) ( not ( = ?auto_903774 ?auto_903785 ) ) ( not ( = ?auto_903774 ?auto_903786 ) ) ( not ( = ?auto_903775 ?auto_903776 ) ) ( not ( = ?auto_903775 ?auto_903777 ) ) ( not ( = ?auto_903775 ?auto_903778 ) ) ( not ( = ?auto_903775 ?auto_903779 ) ) ( not ( = ?auto_903775 ?auto_903780 ) ) ( not ( = ?auto_903775 ?auto_903781 ) ) ( not ( = ?auto_903775 ?auto_903782 ) ) ( not ( = ?auto_903775 ?auto_903783 ) ) ( not ( = ?auto_903775 ?auto_903784 ) ) ( not ( = ?auto_903775 ?auto_903785 ) ) ( not ( = ?auto_903775 ?auto_903786 ) ) ( not ( = ?auto_903776 ?auto_903777 ) ) ( not ( = ?auto_903776 ?auto_903778 ) ) ( not ( = ?auto_903776 ?auto_903779 ) ) ( not ( = ?auto_903776 ?auto_903780 ) ) ( not ( = ?auto_903776 ?auto_903781 ) ) ( not ( = ?auto_903776 ?auto_903782 ) ) ( not ( = ?auto_903776 ?auto_903783 ) ) ( not ( = ?auto_903776 ?auto_903784 ) ) ( not ( = ?auto_903776 ?auto_903785 ) ) ( not ( = ?auto_903776 ?auto_903786 ) ) ( not ( = ?auto_903777 ?auto_903778 ) ) ( not ( = ?auto_903777 ?auto_903779 ) ) ( not ( = ?auto_903777 ?auto_903780 ) ) ( not ( = ?auto_903777 ?auto_903781 ) ) ( not ( = ?auto_903777 ?auto_903782 ) ) ( not ( = ?auto_903777 ?auto_903783 ) ) ( not ( = ?auto_903777 ?auto_903784 ) ) ( not ( = ?auto_903777 ?auto_903785 ) ) ( not ( = ?auto_903777 ?auto_903786 ) ) ( not ( = ?auto_903778 ?auto_903779 ) ) ( not ( = ?auto_903778 ?auto_903780 ) ) ( not ( = ?auto_903778 ?auto_903781 ) ) ( not ( = ?auto_903778 ?auto_903782 ) ) ( not ( = ?auto_903778 ?auto_903783 ) ) ( not ( = ?auto_903778 ?auto_903784 ) ) ( not ( = ?auto_903778 ?auto_903785 ) ) ( not ( = ?auto_903778 ?auto_903786 ) ) ( not ( = ?auto_903779 ?auto_903780 ) ) ( not ( = ?auto_903779 ?auto_903781 ) ) ( not ( = ?auto_903779 ?auto_903782 ) ) ( not ( = ?auto_903779 ?auto_903783 ) ) ( not ( = ?auto_903779 ?auto_903784 ) ) ( not ( = ?auto_903779 ?auto_903785 ) ) ( not ( = ?auto_903779 ?auto_903786 ) ) ( not ( = ?auto_903780 ?auto_903781 ) ) ( not ( = ?auto_903780 ?auto_903782 ) ) ( not ( = ?auto_903780 ?auto_903783 ) ) ( not ( = ?auto_903780 ?auto_903784 ) ) ( not ( = ?auto_903780 ?auto_903785 ) ) ( not ( = ?auto_903780 ?auto_903786 ) ) ( not ( = ?auto_903781 ?auto_903782 ) ) ( not ( = ?auto_903781 ?auto_903783 ) ) ( not ( = ?auto_903781 ?auto_903784 ) ) ( not ( = ?auto_903781 ?auto_903785 ) ) ( not ( = ?auto_903781 ?auto_903786 ) ) ( not ( = ?auto_903782 ?auto_903783 ) ) ( not ( = ?auto_903782 ?auto_903784 ) ) ( not ( = ?auto_903782 ?auto_903785 ) ) ( not ( = ?auto_903782 ?auto_903786 ) ) ( not ( = ?auto_903783 ?auto_903784 ) ) ( not ( = ?auto_903783 ?auto_903785 ) ) ( not ( = ?auto_903783 ?auto_903786 ) ) ( not ( = ?auto_903784 ?auto_903785 ) ) ( not ( = ?auto_903784 ?auto_903786 ) ) ( not ( = ?auto_903785 ?auto_903786 ) ) ( ON ?auto_903784 ?auto_903785 ) ( ON ?auto_903783 ?auto_903784 ) ( ON ?auto_903782 ?auto_903783 ) ( ON ?auto_903781 ?auto_903782 ) ( ON ?auto_903780 ?auto_903781 ) ( ON ?auto_903779 ?auto_903780 ) ( ON ?auto_903778 ?auto_903779 ) ( CLEAR ?auto_903776 ) ( ON ?auto_903777 ?auto_903778 ) ( CLEAR ?auto_903777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_903770 ?auto_903771 ?auto_903772 ?auto_903773 ?auto_903774 ?auto_903775 ?auto_903776 ?auto_903777 )
      ( MAKE-16PILE ?auto_903770 ?auto_903771 ?auto_903772 ?auto_903773 ?auto_903774 ?auto_903775 ?auto_903776 ?auto_903777 ?auto_903778 ?auto_903779 ?auto_903780 ?auto_903781 ?auto_903782 ?auto_903783 ?auto_903784 ?auto_903785 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_903836 - BLOCK
      ?auto_903837 - BLOCK
      ?auto_903838 - BLOCK
      ?auto_903839 - BLOCK
      ?auto_903840 - BLOCK
      ?auto_903841 - BLOCK
      ?auto_903842 - BLOCK
      ?auto_903843 - BLOCK
      ?auto_903844 - BLOCK
      ?auto_903845 - BLOCK
      ?auto_903846 - BLOCK
      ?auto_903847 - BLOCK
      ?auto_903848 - BLOCK
      ?auto_903849 - BLOCK
      ?auto_903850 - BLOCK
      ?auto_903851 - BLOCK
    )
    :vars
    (
      ?auto_903852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903851 ?auto_903852 ) ( ON-TABLE ?auto_903836 ) ( ON ?auto_903837 ?auto_903836 ) ( ON ?auto_903838 ?auto_903837 ) ( ON ?auto_903839 ?auto_903838 ) ( ON ?auto_903840 ?auto_903839 ) ( ON ?auto_903841 ?auto_903840 ) ( not ( = ?auto_903836 ?auto_903837 ) ) ( not ( = ?auto_903836 ?auto_903838 ) ) ( not ( = ?auto_903836 ?auto_903839 ) ) ( not ( = ?auto_903836 ?auto_903840 ) ) ( not ( = ?auto_903836 ?auto_903841 ) ) ( not ( = ?auto_903836 ?auto_903842 ) ) ( not ( = ?auto_903836 ?auto_903843 ) ) ( not ( = ?auto_903836 ?auto_903844 ) ) ( not ( = ?auto_903836 ?auto_903845 ) ) ( not ( = ?auto_903836 ?auto_903846 ) ) ( not ( = ?auto_903836 ?auto_903847 ) ) ( not ( = ?auto_903836 ?auto_903848 ) ) ( not ( = ?auto_903836 ?auto_903849 ) ) ( not ( = ?auto_903836 ?auto_903850 ) ) ( not ( = ?auto_903836 ?auto_903851 ) ) ( not ( = ?auto_903836 ?auto_903852 ) ) ( not ( = ?auto_903837 ?auto_903838 ) ) ( not ( = ?auto_903837 ?auto_903839 ) ) ( not ( = ?auto_903837 ?auto_903840 ) ) ( not ( = ?auto_903837 ?auto_903841 ) ) ( not ( = ?auto_903837 ?auto_903842 ) ) ( not ( = ?auto_903837 ?auto_903843 ) ) ( not ( = ?auto_903837 ?auto_903844 ) ) ( not ( = ?auto_903837 ?auto_903845 ) ) ( not ( = ?auto_903837 ?auto_903846 ) ) ( not ( = ?auto_903837 ?auto_903847 ) ) ( not ( = ?auto_903837 ?auto_903848 ) ) ( not ( = ?auto_903837 ?auto_903849 ) ) ( not ( = ?auto_903837 ?auto_903850 ) ) ( not ( = ?auto_903837 ?auto_903851 ) ) ( not ( = ?auto_903837 ?auto_903852 ) ) ( not ( = ?auto_903838 ?auto_903839 ) ) ( not ( = ?auto_903838 ?auto_903840 ) ) ( not ( = ?auto_903838 ?auto_903841 ) ) ( not ( = ?auto_903838 ?auto_903842 ) ) ( not ( = ?auto_903838 ?auto_903843 ) ) ( not ( = ?auto_903838 ?auto_903844 ) ) ( not ( = ?auto_903838 ?auto_903845 ) ) ( not ( = ?auto_903838 ?auto_903846 ) ) ( not ( = ?auto_903838 ?auto_903847 ) ) ( not ( = ?auto_903838 ?auto_903848 ) ) ( not ( = ?auto_903838 ?auto_903849 ) ) ( not ( = ?auto_903838 ?auto_903850 ) ) ( not ( = ?auto_903838 ?auto_903851 ) ) ( not ( = ?auto_903838 ?auto_903852 ) ) ( not ( = ?auto_903839 ?auto_903840 ) ) ( not ( = ?auto_903839 ?auto_903841 ) ) ( not ( = ?auto_903839 ?auto_903842 ) ) ( not ( = ?auto_903839 ?auto_903843 ) ) ( not ( = ?auto_903839 ?auto_903844 ) ) ( not ( = ?auto_903839 ?auto_903845 ) ) ( not ( = ?auto_903839 ?auto_903846 ) ) ( not ( = ?auto_903839 ?auto_903847 ) ) ( not ( = ?auto_903839 ?auto_903848 ) ) ( not ( = ?auto_903839 ?auto_903849 ) ) ( not ( = ?auto_903839 ?auto_903850 ) ) ( not ( = ?auto_903839 ?auto_903851 ) ) ( not ( = ?auto_903839 ?auto_903852 ) ) ( not ( = ?auto_903840 ?auto_903841 ) ) ( not ( = ?auto_903840 ?auto_903842 ) ) ( not ( = ?auto_903840 ?auto_903843 ) ) ( not ( = ?auto_903840 ?auto_903844 ) ) ( not ( = ?auto_903840 ?auto_903845 ) ) ( not ( = ?auto_903840 ?auto_903846 ) ) ( not ( = ?auto_903840 ?auto_903847 ) ) ( not ( = ?auto_903840 ?auto_903848 ) ) ( not ( = ?auto_903840 ?auto_903849 ) ) ( not ( = ?auto_903840 ?auto_903850 ) ) ( not ( = ?auto_903840 ?auto_903851 ) ) ( not ( = ?auto_903840 ?auto_903852 ) ) ( not ( = ?auto_903841 ?auto_903842 ) ) ( not ( = ?auto_903841 ?auto_903843 ) ) ( not ( = ?auto_903841 ?auto_903844 ) ) ( not ( = ?auto_903841 ?auto_903845 ) ) ( not ( = ?auto_903841 ?auto_903846 ) ) ( not ( = ?auto_903841 ?auto_903847 ) ) ( not ( = ?auto_903841 ?auto_903848 ) ) ( not ( = ?auto_903841 ?auto_903849 ) ) ( not ( = ?auto_903841 ?auto_903850 ) ) ( not ( = ?auto_903841 ?auto_903851 ) ) ( not ( = ?auto_903841 ?auto_903852 ) ) ( not ( = ?auto_903842 ?auto_903843 ) ) ( not ( = ?auto_903842 ?auto_903844 ) ) ( not ( = ?auto_903842 ?auto_903845 ) ) ( not ( = ?auto_903842 ?auto_903846 ) ) ( not ( = ?auto_903842 ?auto_903847 ) ) ( not ( = ?auto_903842 ?auto_903848 ) ) ( not ( = ?auto_903842 ?auto_903849 ) ) ( not ( = ?auto_903842 ?auto_903850 ) ) ( not ( = ?auto_903842 ?auto_903851 ) ) ( not ( = ?auto_903842 ?auto_903852 ) ) ( not ( = ?auto_903843 ?auto_903844 ) ) ( not ( = ?auto_903843 ?auto_903845 ) ) ( not ( = ?auto_903843 ?auto_903846 ) ) ( not ( = ?auto_903843 ?auto_903847 ) ) ( not ( = ?auto_903843 ?auto_903848 ) ) ( not ( = ?auto_903843 ?auto_903849 ) ) ( not ( = ?auto_903843 ?auto_903850 ) ) ( not ( = ?auto_903843 ?auto_903851 ) ) ( not ( = ?auto_903843 ?auto_903852 ) ) ( not ( = ?auto_903844 ?auto_903845 ) ) ( not ( = ?auto_903844 ?auto_903846 ) ) ( not ( = ?auto_903844 ?auto_903847 ) ) ( not ( = ?auto_903844 ?auto_903848 ) ) ( not ( = ?auto_903844 ?auto_903849 ) ) ( not ( = ?auto_903844 ?auto_903850 ) ) ( not ( = ?auto_903844 ?auto_903851 ) ) ( not ( = ?auto_903844 ?auto_903852 ) ) ( not ( = ?auto_903845 ?auto_903846 ) ) ( not ( = ?auto_903845 ?auto_903847 ) ) ( not ( = ?auto_903845 ?auto_903848 ) ) ( not ( = ?auto_903845 ?auto_903849 ) ) ( not ( = ?auto_903845 ?auto_903850 ) ) ( not ( = ?auto_903845 ?auto_903851 ) ) ( not ( = ?auto_903845 ?auto_903852 ) ) ( not ( = ?auto_903846 ?auto_903847 ) ) ( not ( = ?auto_903846 ?auto_903848 ) ) ( not ( = ?auto_903846 ?auto_903849 ) ) ( not ( = ?auto_903846 ?auto_903850 ) ) ( not ( = ?auto_903846 ?auto_903851 ) ) ( not ( = ?auto_903846 ?auto_903852 ) ) ( not ( = ?auto_903847 ?auto_903848 ) ) ( not ( = ?auto_903847 ?auto_903849 ) ) ( not ( = ?auto_903847 ?auto_903850 ) ) ( not ( = ?auto_903847 ?auto_903851 ) ) ( not ( = ?auto_903847 ?auto_903852 ) ) ( not ( = ?auto_903848 ?auto_903849 ) ) ( not ( = ?auto_903848 ?auto_903850 ) ) ( not ( = ?auto_903848 ?auto_903851 ) ) ( not ( = ?auto_903848 ?auto_903852 ) ) ( not ( = ?auto_903849 ?auto_903850 ) ) ( not ( = ?auto_903849 ?auto_903851 ) ) ( not ( = ?auto_903849 ?auto_903852 ) ) ( not ( = ?auto_903850 ?auto_903851 ) ) ( not ( = ?auto_903850 ?auto_903852 ) ) ( not ( = ?auto_903851 ?auto_903852 ) ) ( ON ?auto_903850 ?auto_903851 ) ( ON ?auto_903849 ?auto_903850 ) ( ON ?auto_903848 ?auto_903849 ) ( ON ?auto_903847 ?auto_903848 ) ( ON ?auto_903846 ?auto_903847 ) ( ON ?auto_903845 ?auto_903846 ) ( ON ?auto_903844 ?auto_903845 ) ( ON ?auto_903843 ?auto_903844 ) ( CLEAR ?auto_903841 ) ( ON ?auto_903842 ?auto_903843 ) ( CLEAR ?auto_903842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_903836 ?auto_903837 ?auto_903838 ?auto_903839 ?auto_903840 ?auto_903841 ?auto_903842 )
      ( MAKE-16PILE ?auto_903836 ?auto_903837 ?auto_903838 ?auto_903839 ?auto_903840 ?auto_903841 ?auto_903842 ?auto_903843 ?auto_903844 ?auto_903845 ?auto_903846 ?auto_903847 ?auto_903848 ?auto_903849 ?auto_903850 ?auto_903851 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_903902 - BLOCK
      ?auto_903903 - BLOCK
      ?auto_903904 - BLOCK
      ?auto_903905 - BLOCK
      ?auto_903906 - BLOCK
      ?auto_903907 - BLOCK
      ?auto_903908 - BLOCK
      ?auto_903909 - BLOCK
      ?auto_903910 - BLOCK
      ?auto_903911 - BLOCK
      ?auto_903912 - BLOCK
      ?auto_903913 - BLOCK
      ?auto_903914 - BLOCK
      ?auto_903915 - BLOCK
      ?auto_903916 - BLOCK
      ?auto_903917 - BLOCK
    )
    :vars
    (
      ?auto_903918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903917 ?auto_903918 ) ( ON-TABLE ?auto_903902 ) ( ON ?auto_903903 ?auto_903902 ) ( ON ?auto_903904 ?auto_903903 ) ( ON ?auto_903905 ?auto_903904 ) ( ON ?auto_903906 ?auto_903905 ) ( not ( = ?auto_903902 ?auto_903903 ) ) ( not ( = ?auto_903902 ?auto_903904 ) ) ( not ( = ?auto_903902 ?auto_903905 ) ) ( not ( = ?auto_903902 ?auto_903906 ) ) ( not ( = ?auto_903902 ?auto_903907 ) ) ( not ( = ?auto_903902 ?auto_903908 ) ) ( not ( = ?auto_903902 ?auto_903909 ) ) ( not ( = ?auto_903902 ?auto_903910 ) ) ( not ( = ?auto_903902 ?auto_903911 ) ) ( not ( = ?auto_903902 ?auto_903912 ) ) ( not ( = ?auto_903902 ?auto_903913 ) ) ( not ( = ?auto_903902 ?auto_903914 ) ) ( not ( = ?auto_903902 ?auto_903915 ) ) ( not ( = ?auto_903902 ?auto_903916 ) ) ( not ( = ?auto_903902 ?auto_903917 ) ) ( not ( = ?auto_903902 ?auto_903918 ) ) ( not ( = ?auto_903903 ?auto_903904 ) ) ( not ( = ?auto_903903 ?auto_903905 ) ) ( not ( = ?auto_903903 ?auto_903906 ) ) ( not ( = ?auto_903903 ?auto_903907 ) ) ( not ( = ?auto_903903 ?auto_903908 ) ) ( not ( = ?auto_903903 ?auto_903909 ) ) ( not ( = ?auto_903903 ?auto_903910 ) ) ( not ( = ?auto_903903 ?auto_903911 ) ) ( not ( = ?auto_903903 ?auto_903912 ) ) ( not ( = ?auto_903903 ?auto_903913 ) ) ( not ( = ?auto_903903 ?auto_903914 ) ) ( not ( = ?auto_903903 ?auto_903915 ) ) ( not ( = ?auto_903903 ?auto_903916 ) ) ( not ( = ?auto_903903 ?auto_903917 ) ) ( not ( = ?auto_903903 ?auto_903918 ) ) ( not ( = ?auto_903904 ?auto_903905 ) ) ( not ( = ?auto_903904 ?auto_903906 ) ) ( not ( = ?auto_903904 ?auto_903907 ) ) ( not ( = ?auto_903904 ?auto_903908 ) ) ( not ( = ?auto_903904 ?auto_903909 ) ) ( not ( = ?auto_903904 ?auto_903910 ) ) ( not ( = ?auto_903904 ?auto_903911 ) ) ( not ( = ?auto_903904 ?auto_903912 ) ) ( not ( = ?auto_903904 ?auto_903913 ) ) ( not ( = ?auto_903904 ?auto_903914 ) ) ( not ( = ?auto_903904 ?auto_903915 ) ) ( not ( = ?auto_903904 ?auto_903916 ) ) ( not ( = ?auto_903904 ?auto_903917 ) ) ( not ( = ?auto_903904 ?auto_903918 ) ) ( not ( = ?auto_903905 ?auto_903906 ) ) ( not ( = ?auto_903905 ?auto_903907 ) ) ( not ( = ?auto_903905 ?auto_903908 ) ) ( not ( = ?auto_903905 ?auto_903909 ) ) ( not ( = ?auto_903905 ?auto_903910 ) ) ( not ( = ?auto_903905 ?auto_903911 ) ) ( not ( = ?auto_903905 ?auto_903912 ) ) ( not ( = ?auto_903905 ?auto_903913 ) ) ( not ( = ?auto_903905 ?auto_903914 ) ) ( not ( = ?auto_903905 ?auto_903915 ) ) ( not ( = ?auto_903905 ?auto_903916 ) ) ( not ( = ?auto_903905 ?auto_903917 ) ) ( not ( = ?auto_903905 ?auto_903918 ) ) ( not ( = ?auto_903906 ?auto_903907 ) ) ( not ( = ?auto_903906 ?auto_903908 ) ) ( not ( = ?auto_903906 ?auto_903909 ) ) ( not ( = ?auto_903906 ?auto_903910 ) ) ( not ( = ?auto_903906 ?auto_903911 ) ) ( not ( = ?auto_903906 ?auto_903912 ) ) ( not ( = ?auto_903906 ?auto_903913 ) ) ( not ( = ?auto_903906 ?auto_903914 ) ) ( not ( = ?auto_903906 ?auto_903915 ) ) ( not ( = ?auto_903906 ?auto_903916 ) ) ( not ( = ?auto_903906 ?auto_903917 ) ) ( not ( = ?auto_903906 ?auto_903918 ) ) ( not ( = ?auto_903907 ?auto_903908 ) ) ( not ( = ?auto_903907 ?auto_903909 ) ) ( not ( = ?auto_903907 ?auto_903910 ) ) ( not ( = ?auto_903907 ?auto_903911 ) ) ( not ( = ?auto_903907 ?auto_903912 ) ) ( not ( = ?auto_903907 ?auto_903913 ) ) ( not ( = ?auto_903907 ?auto_903914 ) ) ( not ( = ?auto_903907 ?auto_903915 ) ) ( not ( = ?auto_903907 ?auto_903916 ) ) ( not ( = ?auto_903907 ?auto_903917 ) ) ( not ( = ?auto_903907 ?auto_903918 ) ) ( not ( = ?auto_903908 ?auto_903909 ) ) ( not ( = ?auto_903908 ?auto_903910 ) ) ( not ( = ?auto_903908 ?auto_903911 ) ) ( not ( = ?auto_903908 ?auto_903912 ) ) ( not ( = ?auto_903908 ?auto_903913 ) ) ( not ( = ?auto_903908 ?auto_903914 ) ) ( not ( = ?auto_903908 ?auto_903915 ) ) ( not ( = ?auto_903908 ?auto_903916 ) ) ( not ( = ?auto_903908 ?auto_903917 ) ) ( not ( = ?auto_903908 ?auto_903918 ) ) ( not ( = ?auto_903909 ?auto_903910 ) ) ( not ( = ?auto_903909 ?auto_903911 ) ) ( not ( = ?auto_903909 ?auto_903912 ) ) ( not ( = ?auto_903909 ?auto_903913 ) ) ( not ( = ?auto_903909 ?auto_903914 ) ) ( not ( = ?auto_903909 ?auto_903915 ) ) ( not ( = ?auto_903909 ?auto_903916 ) ) ( not ( = ?auto_903909 ?auto_903917 ) ) ( not ( = ?auto_903909 ?auto_903918 ) ) ( not ( = ?auto_903910 ?auto_903911 ) ) ( not ( = ?auto_903910 ?auto_903912 ) ) ( not ( = ?auto_903910 ?auto_903913 ) ) ( not ( = ?auto_903910 ?auto_903914 ) ) ( not ( = ?auto_903910 ?auto_903915 ) ) ( not ( = ?auto_903910 ?auto_903916 ) ) ( not ( = ?auto_903910 ?auto_903917 ) ) ( not ( = ?auto_903910 ?auto_903918 ) ) ( not ( = ?auto_903911 ?auto_903912 ) ) ( not ( = ?auto_903911 ?auto_903913 ) ) ( not ( = ?auto_903911 ?auto_903914 ) ) ( not ( = ?auto_903911 ?auto_903915 ) ) ( not ( = ?auto_903911 ?auto_903916 ) ) ( not ( = ?auto_903911 ?auto_903917 ) ) ( not ( = ?auto_903911 ?auto_903918 ) ) ( not ( = ?auto_903912 ?auto_903913 ) ) ( not ( = ?auto_903912 ?auto_903914 ) ) ( not ( = ?auto_903912 ?auto_903915 ) ) ( not ( = ?auto_903912 ?auto_903916 ) ) ( not ( = ?auto_903912 ?auto_903917 ) ) ( not ( = ?auto_903912 ?auto_903918 ) ) ( not ( = ?auto_903913 ?auto_903914 ) ) ( not ( = ?auto_903913 ?auto_903915 ) ) ( not ( = ?auto_903913 ?auto_903916 ) ) ( not ( = ?auto_903913 ?auto_903917 ) ) ( not ( = ?auto_903913 ?auto_903918 ) ) ( not ( = ?auto_903914 ?auto_903915 ) ) ( not ( = ?auto_903914 ?auto_903916 ) ) ( not ( = ?auto_903914 ?auto_903917 ) ) ( not ( = ?auto_903914 ?auto_903918 ) ) ( not ( = ?auto_903915 ?auto_903916 ) ) ( not ( = ?auto_903915 ?auto_903917 ) ) ( not ( = ?auto_903915 ?auto_903918 ) ) ( not ( = ?auto_903916 ?auto_903917 ) ) ( not ( = ?auto_903916 ?auto_903918 ) ) ( not ( = ?auto_903917 ?auto_903918 ) ) ( ON ?auto_903916 ?auto_903917 ) ( ON ?auto_903915 ?auto_903916 ) ( ON ?auto_903914 ?auto_903915 ) ( ON ?auto_903913 ?auto_903914 ) ( ON ?auto_903912 ?auto_903913 ) ( ON ?auto_903911 ?auto_903912 ) ( ON ?auto_903910 ?auto_903911 ) ( ON ?auto_903909 ?auto_903910 ) ( ON ?auto_903908 ?auto_903909 ) ( CLEAR ?auto_903906 ) ( ON ?auto_903907 ?auto_903908 ) ( CLEAR ?auto_903907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_903902 ?auto_903903 ?auto_903904 ?auto_903905 ?auto_903906 ?auto_903907 )
      ( MAKE-16PILE ?auto_903902 ?auto_903903 ?auto_903904 ?auto_903905 ?auto_903906 ?auto_903907 ?auto_903908 ?auto_903909 ?auto_903910 ?auto_903911 ?auto_903912 ?auto_903913 ?auto_903914 ?auto_903915 ?auto_903916 ?auto_903917 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_903968 - BLOCK
      ?auto_903969 - BLOCK
      ?auto_903970 - BLOCK
      ?auto_903971 - BLOCK
      ?auto_903972 - BLOCK
      ?auto_903973 - BLOCK
      ?auto_903974 - BLOCK
      ?auto_903975 - BLOCK
      ?auto_903976 - BLOCK
      ?auto_903977 - BLOCK
      ?auto_903978 - BLOCK
      ?auto_903979 - BLOCK
      ?auto_903980 - BLOCK
      ?auto_903981 - BLOCK
      ?auto_903982 - BLOCK
      ?auto_903983 - BLOCK
    )
    :vars
    (
      ?auto_903984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_903983 ?auto_903984 ) ( ON-TABLE ?auto_903968 ) ( ON ?auto_903969 ?auto_903968 ) ( ON ?auto_903970 ?auto_903969 ) ( ON ?auto_903971 ?auto_903970 ) ( not ( = ?auto_903968 ?auto_903969 ) ) ( not ( = ?auto_903968 ?auto_903970 ) ) ( not ( = ?auto_903968 ?auto_903971 ) ) ( not ( = ?auto_903968 ?auto_903972 ) ) ( not ( = ?auto_903968 ?auto_903973 ) ) ( not ( = ?auto_903968 ?auto_903974 ) ) ( not ( = ?auto_903968 ?auto_903975 ) ) ( not ( = ?auto_903968 ?auto_903976 ) ) ( not ( = ?auto_903968 ?auto_903977 ) ) ( not ( = ?auto_903968 ?auto_903978 ) ) ( not ( = ?auto_903968 ?auto_903979 ) ) ( not ( = ?auto_903968 ?auto_903980 ) ) ( not ( = ?auto_903968 ?auto_903981 ) ) ( not ( = ?auto_903968 ?auto_903982 ) ) ( not ( = ?auto_903968 ?auto_903983 ) ) ( not ( = ?auto_903968 ?auto_903984 ) ) ( not ( = ?auto_903969 ?auto_903970 ) ) ( not ( = ?auto_903969 ?auto_903971 ) ) ( not ( = ?auto_903969 ?auto_903972 ) ) ( not ( = ?auto_903969 ?auto_903973 ) ) ( not ( = ?auto_903969 ?auto_903974 ) ) ( not ( = ?auto_903969 ?auto_903975 ) ) ( not ( = ?auto_903969 ?auto_903976 ) ) ( not ( = ?auto_903969 ?auto_903977 ) ) ( not ( = ?auto_903969 ?auto_903978 ) ) ( not ( = ?auto_903969 ?auto_903979 ) ) ( not ( = ?auto_903969 ?auto_903980 ) ) ( not ( = ?auto_903969 ?auto_903981 ) ) ( not ( = ?auto_903969 ?auto_903982 ) ) ( not ( = ?auto_903969 ?auto_903983 ) ) ( not ( = ?auto_903969 ?auto_903984 ) ) ( not ( = ?auto_903970 ?auto_903971 ) ) ( not ( = ?auto_903970 ?auto_903972 ) ) ( not ( = ?auto_903970 ?auto_903973 ) ) ( not ( = ?auto_903970 ?auto_903974 ) ) ( not ( = ?auto_903970 ?auto_903975 ) ) ( not ( = ?auto_903970 ?auto_903976 ) ) ( not ( = ?auto_903970 ?auto_903977 ) ) ( not ( = ?auto_903970 ?auto_903978 ) ) ( not ( = ?auto_903970 ?auto_903979 ) ) ( not ( = ?auto_903970 ?auto_903980 ) ) ( not ( = ?auto_903970 ?auto_903981 ) ) ( not ( = ?auto_903970 ?auto_903982 ) ) ( not ( = ?auto_903970 ?auto_903983 ) ) ( not ( = ?auto_903970 ?auto_903984 ) ) ( not ( = ?auto_903971 ?auto_903972 ) ) ( not ( = ?auto_903971 ?auto_903973 ) ) ( not ( = ?auto_903971 ?auto_903974 ) ) ( not ( = ?auto_903971 ?auto_903975 ) ) ( not ( = ?auto_903971 ?auto_903976 ) ) ( not ( = ?auto_903971 ?auto_903977 ) ) ( not ( = ?auto_903971 ?auto_903978 ) ) ( not ( = ?auto_903971 ?auto_903979 ) ) ( not ( = ?auto_903971 ?auto_903980 ) ) ( not ( = ?auto_903971 ?auto_903981 ) ) ( not ( = ?auto_903971 ?auto_903982 ) ) ( not ( = ?auto_903971 ?auto_903983 ) ) ( not ( = ?auto_903971 ?auto_903984 ) ) ( not ( = ?auto_903972 ?auto_903973 ) ) ( not ( = ?auto_903972 ?auto_903974 ) ) ( not ( = ?auto_903972 ?auto_903975 ) ) ( not ( = ?auto_903972 ?auto_903976 ) ) ( not ( = ?auto_903972 ?auto_903977 ) ) ( not ( = ?auto_903972 ?auto_903978 ) ) ( not ( = ?auto_903972 ?auto_903979 ) ) ( not ( = ?auto_903972 ?auto_903980 ) ) ( not ( = ?auto_903972 ?auto_903981 ) ) ( not ( = ?auto_903972 ?auto_903982 ) ) ( not ( = ?auto_903972 ?auto_903983 ) ) ( not ( = ?auto_903972 ?auto_903984 ) ) ( not ( = ?auto_903973 ?auto_903974 ) ) ( not ( = ?auto_903973 ?auto_903975 ) ) ( not ( = ?auto_903973 ?auto_903976 ) ) ( not ( = ?auto_903973 ?auto_903977 ) ) ( not ( = ?auto_903973 ?auto_903978 ) ) ( not ( = ?auto_903973 ?auto_903979 ) ) ( not ( = ?auto_903973 ?auto_903980 ) ) ( not ( = ?auto_903973 ?auto_903981 ) ) ( not ( = ?auto_903973 ?auto_903982 ) ) ( not ( = ?auto_903973 ?auto_903983 ) ) ( not ( = ?auto_903973 ?auto_903984 ) ) ( not ( = ?auto_903974 ?auto_903975 ) ) ( not ( = ?auto_903974 ?auto_903976 ) ) ( not ( = ?auto_903974 ?auto_903977 ) ) ( not ( = ?auto_903974 ?auto_903978 ) ) ( not ( = ?auto_903974 ?auto_903979 ) ) ( not ( = ?auto_903974 ?auto_903980 ) ) ( not ( = ?auto_903974 ?auto_903981 ) ) ( not ( = ?auto_903974 ?auto_903982 ) ) ( not ( = ?auto_903974 ?auto_903983 ) ) ( not ( = ?auto_903974 ?auto_903984 ) ) ( not ( = ?auto_903975 ?auto_903976 ) ) ( not ( = ?auto_903975 ?auto_903977 ) ) ( not ( = ?auto_903975 ?auto_903978 ) ) ( not ( = ?auto_903975 ?auto_903979 ) ) ( not ( = ?auto_903975 ?auto_903980 ) ) ( not ( = ?auto_903975 ?auto_903981 ) ) ( not ( = ?auto_903975 ?auto_903982 ) ) ( not ( = ?auto_903975 ?auto_903983 ) ) ( not ( = ?auto_903975 ?auto_903984 ) ) ( not ( = ?auto_903976 ?auto_903977 ) ) ( not ( = ?auto_903976 ?auto_903978 ) ) ( not ( = ?auto_903976 ?auto_903979 ) ) ( not ( = ?auto_903976 ?auto_903980 ) ) ( not ( = ?auto_903976 ?auto_903981 ) ) ( not ( = ?auto_903976 ?auto_903982 ) ) ( not ( = ?auto_903976 ?auto_903983 ) ) ( not ( = ?auto_903976 ?auto_903984 ) ) ( not ( = ?auto_903977 ?auto_903978 ) ) ( not ( = ?auto_903977 ?auto_903979 ) ) ( not ( = ?auto_903977 ?auto_903980 ) ) ( not ( = ?auto_903977 ?auto_903981 ) ) ( not ( = ?auto_903977 ?auto_903982 ) ) ( not ( = ?auto_903977 ?auto_903983 ) ) ( not ( = ?auto_903977 ?auto_903984 ) ) ( not ( = ?auto_903978 ?auto_903979 ) ) ( not ( = ?auto_903978 ?auto_903980 ) ) ( not ( = ?auto_903978 ?auto_903981 ) ) ( not ( = ?auto_903978 ?auto_903982 ) ) ( not ( = ?auto_903978 ?auto_903983 ) ) ( not ( = ?auto_903978 ?auto_903984 ) ) ( not ( = ?auto_903979 ?auto_903980 ) ) ( not ( = ?auto_903979 ?auto_903981 ) ) ( not ( = ?auto_903979 ?auto_903982 ) ) ( not ( = ?auto_903979 ?auto_903983 ) ) ( not ( = ?auto_903979 ?auto_903984 ) ) ( not ( = ?auto_903980 ?auto_903981 ) ) ( not ( = ?auto_903980 ?auto_903982 ) ) ( not ( = ?auto_903980 ?auto_903983 ) ) ( not ( = ?auto_903980 ?auto_903984 ) ) ( not ( = ?auto_903981 ?auto_903982 ) ) ( not ( = ?auto_903981 ?auto_903983 ) ) ( not ( = ?auto_903981 ?auto_903984 ) ) ( not ( = ?auto_903982 ?auto_903983 ) ) ( not ( = ?auto_903982 ?auto_903984 ) ) ( not ( = ?auto_903983 ?auto_903984 ) ) ( ON ?auto_903982 ?auto_903983 ) ( ON ?auto_903981 ?auto_903982 ) ( ON ?auto_903980 ?auto_903981 ) ( ON ?auto_903979 ?auto_903980 ) ( ON ?auto_903978 ?auto_903979 ) ( ON ?auto_903977 ?auto_903978 ) ( ON ?auto_903976 ?auto_903977 ) ( ON ?auto_903975 ?auto_903976 ) ( ON ?auto_903974 ?auto_903975 ) ( ON ?auto_903973 ?auto_903974 ) ( CLEAR ?auto_903971 ) ( ON ?auto_903972 ?auto_903973 ) ( CLEAR ?auto_903972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_903968 ?auto_903969 ?auto_903970 ?auto_903971 ?auto_903972 )
      ( MAKE-16PILE ?auto_903968 ?auto_903969 ?auto_903970 ?auto_903971 ?auto_903972 ?auto_903973 ?auto_903974 ?auto_903975 ?auto_903976 ?auto_903977 ?auto_903978 ?auto_903979 ?auto_903980 ?auto_903981 ?auto_903982 ?auto_903983 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_904034 - BLOCK
      ?auto_904035 - BLOCK
      ?auto_904036 - BLOCK
      ?auto_904037 - BLOCK
      ?auto_904038 - BLOCK
      ?auto_904039 - BLOCK
      ?auto_904040 - BLOCK
      ?auto_904041 - BLOCK
      ?auto_904042 - BLOCK
      ?auto_904043 - BLOCK
      ?auto_904044 - BLOCK
      ?auto_904045 - BLOCK
      ?auto_904046 - BLOCK
      ?auto_904047 - BLOCK
      ?auto_904048 - BLOCK
      ?auto_904049 - BLOCK
    )
    :vars
    (
      ?auto_904050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904049 ?auto_904050 ) ( ON-TABLE ?auto_904034 ) ( ON ?auto_904035 ?auto_904034 ) ( ON ?auto_904036 ?auto_904035 ) ( not ( = ?auto_904034 ?auto_904035 ) ) ( not ( = ?auto_904034 ?auto_904036 ) ) ( not ( = ?auto_904034 ?auto_904037 ) ) ( not ( = ?auto_904034 ?auto_904038 ) ) ( not ( = ?auto_904034 ?auto_904039 ) ) ( not ( = ?auto_904034 ?auto_904040 ) ) ( not ( = ?auto_904034 ?auto_904041 ) ) ( not ( = ?auto_904034 ?auto_904042 ) ) ( not ( = ?auto_904034 ?auto_904043 ) ) ( not ( = ?auto_904034 ?auto_904044 ) ) ( not ( = ?auto_904034 ?auto_904045 ) ) ( not ( = ?auto_904034 ?auto_904046 ) ) ( not ( = ?auto_904034 ?auto_904047 ) ) ( not ( = ?auto_904034 ?auto_904048 ) ) ( not ( = ?auto_904034 ?auto_904049 ) ) ( not ( = ?auto_904034 ?auto_904050 ) ) ( not ( = ?auto_904035 ?auto_904036 ) ) ( not ( = ?auto_904035 ?auto_904037 ) ) ( not ( = ?auto_904035 ?auto_904038 ) ) ( not ( = ?auto_904035 ?auto_904039 ) ) ( not ( = ?auto_904035 ?auto_904040 ) ) ( not ( = ?auto_904035 ?auto_904041 ) ) ( not ( = ?auto_904035 ?auto_904042 ) ) ( not ( = ?auto_904035 ?auto_904043 ) ) ( not ( = ?auto_904035 ?auto_904044 ) ) ( not ( = ?auto_904035 ?auto_904045 ) ) ( not ( = ?auto_904035 ?auto_904046 ) ) ( not ( = ?auto_904035 ?auto_904047 ) ) ( not ( = ?auto_904035 ?auto_904048 ) ) ( not ( = ?auto_904035 ?auto_904049 ) ) ( not ( = ?auto_904035 ?auto_904050 ) ) ( not ( = ?auto_904036 ?auto_904037 ) ) ( not ( = ?auto_904036 ?auto_904038 ) ) ( not ( = ?auto_904036 ?auto_904039 ) ) ( not ( = ?auto_904036 ?auto_904040 ) ) ( not ( = ?auto_904036 ?auto_904041 ) ) ( not ( = ?auto_904036 ?auto_904042 ) ) ( not ( = ?auto_904036 ?auto_904043 ) ) ( not ( = ?auto_904036 ?auto_904044 ) ) ( not ( = ?auto_904036 ?auto_904045 ) ) ( not ( = ?auto_904036 ?auto_904046 ) ) ( not ( = ?auto_904036 ?auto_904047 ) ) ( not ( = ?auto_904036 ?auto_904048 ) ) ( not ( = ?auto_904036 ?auto_904049 ) ) ( not ( = ?auto_904036 ?auto_904050 ) ) ( not ( = ?auto_904037 ?auto_904038 ) ) ( not ( = ?auto_904037 ?auto_904039 ) ) ( not ( = ?auto_904037 ?auto_904040 ) ) ( not ( = ?auto_904037 ?auto_904041 ) ) ( not ( = ?auto_904037 ?auto_904042 ) ) ( not ( = ?auto_904037 ?auto_904043 ) ) ( not ( = ?auto_904037 ?auto_904044 ) ) ( not ( = ?auto_904037 ?auto_904045 ) ) ( not ( = ?auto_904037 ?auto_904046 ) ) ( not ( = ?auto_904037 ?auto_904047 ) ) ( not ( = ?auto_904037 ?auto_904048 ) ) ( not ( = ?auto_904037 ?auto_904049 ) ) ( not ( = ?auto_904037 ?auto_904050 ) ) ( not ( = ?auto_904038 ?auto_904039 ) ) ( not ( = ?auto_904038 ?auto_904040 ) ) ( not ( = ?auto_904038 ?auto_904041 ) ) ( not ( = ?auto_904038 ?auto_904042 ) ) ( not ( = ?auto_904038 ?auto_904043 ) ) ( not ( = ?auto_904038 ?auto_904044 ) ) ( not ( = ?auto_904038 ?auto_904045 ) ) ( not ( = ?auto_904038 ?auto_904046 ) ) ( not ( = ?auto_904038 ?auto_904047 ) ) ( not ( = ?auto_904038 ?auto_904048 ) ) ( not ( = ?auto_904038 ?auto_904049 ) ) ( not ( = ?auto_904038 ?auto_904050 ) ) ( not ( = ?auto_904039 ?auto_904040 ) ) ( not ( = ?auto_904039 ?auto_904041 ) ) ( not ( = ?auto_904039 ?auto_904042 ) ) ( not ( = ?auto_904039 ?auto_904043 ) ) ( not ( = ?auto_904039 ?auto_904044 ) ) ( not ( = ?auto_904039 ?auto_904045 ) ) ( not ( = ?auto_904039 ?auto_904046 ) ) ( not ( = ?auto_904039 ?auto_904047 ) ) ( not ( = ?auto_904039 ?auto_904048 ) ) ( not ( = ?auto_904039 ?auto_904049 ) ) ( not ( = ?auto_904039 ?auto_904050 ) ) ( not ( = ?auto_904040 ?auto_904041 ) ) ( not ( = ?auto_904040 ?auto_904042 ) ) ( not ( = ?auto_904040 ?auto_904043 ) ) ( not ( = ?auto_904040 ?auto_904044 ) ) ( not ( = ?auto_904040 ?auto_904045 ) ) ( not ( = ?auto_904040 ?auto_904046 ) ) ( not ( = ?auto_904040 ?auto_904047 ) ) ( not ( = ?auto_904040 ?auto_904048 ) ) ( not ( = ?auto_904040 ?auto_904049 ) ) ( not ( = ?auto_904040 ?auto_904050 ) ) ( not ( = ?auto_904041 ?auto_904042 ) ) ( not ( = ?auto_904041 ?auto_904043 ) ) ( not ( = ?auto_904041 ?auto_904044 ) ) ( not ( = ?auto_904041 ?auto_904045 ) ) ( not ( = ?auto_904041 ?auto_904046 ) ) ( not ( = ?auto_904041 ?auto_904047 ) ) ( not ( = ?auto_904041 ?auto_904048 ) ) ( not ( = ?auto_904041 ?auto_904049 ) ) ( not ( = ?auto_904041 ?auto_904050 ) ) ( not ( = ?auto_904042 ?auto_904043 ) ) ( not ( = ?auto_904042 ?auto_904044 ) ) ( not ( = ?auto_904042 ?auto_904045 ) ) ( not ( = ?auto_904042 ?auto_904046 ) ) ( not ( = ?auto_904042 ?auto_904047 ) ) ( not ( = ?auto_904042 ?auto_904048 ) ) ( not ( = ?auto_904042 ?auto_904049 ) ) ( not ( = ?auto_904042 ?auto_904050 ) ) ( not ( = ?auto_904043 ?auto_904044 ) ) ( not ( = ?auto_904043 ?auto_904045 ) ) ( not ( = ?auto_904043 ?auto_904046 ) ) ( not ( = ?auto_904043 ?auto_904047 ) ) ( not ( = ?auto_904043 ?auto_904048 ) ) ( not ( = ?auto_904043 ?auto_904049 ) ) ( not ( = ?auto_904043 ?auto_904050 ) ) ( not ( = ?auto_904044 ?auto_904045 ) ) ( not ( = ?auto_904044 ?auto_904046 ) ) ( not ( = ?auto_904044 ?auto_904047 ) ) ( not ( = ?auto_904044 ?auto_904048 ) ) ( not ( = ?auto_904044 ?auto_904049 ) ) ( not ( = ?auto_904044 ?auto_904050 ) ) ( not ( = ?auto_904045 ?auto_904046 ) ) ( not ( = ?auto_904045 ?auto_904047 ) ) ( not ( = ?auto_904045 ?auto_904048 ) ) ( not ( = ?auto_904045 ?auto_904049 ) ) ( not ( = ?auto_904045 ?auto_904050 ) ) ( not ( = ?auto_904046 ?auto_904047 ) ) ( not ( = ?auto_904046 ?auto_904048 ) ) ( not ( = ?auto_904046 ?auto_904049 ) ) ( not ( = ?auto_904046 ?auto_904050 ) ) ( not ( = ?auto_904047 ?auto_904048 ) ) ( not ( = ?auto_904047 ?auto_904049 ) ) ( not ( = ?auto_904047 ?auto_904050 ) ) ( not ( = ?auto_904048 ?auto_904049 ) ) ( not ( = ?auto_904048 ?auto_904050 ) ) ( not ( = ?auto_904049 ?auto_904050 ) ) ( ON ?auto_904048 ?auto_904049 ) ( ON ?auto_904047 ?auto_904048 ) ( ON ?auto_904046 ?auto_904047 ) ( ON ?auto_904045 ?auto_904046 ) ( ON ?auto_904044 ?auto_904045 ) ( ON ?auto_904043 ?auto_904044 ) ( ON ?auto_904042 ?auto_904043 ) ( ON ?auto_904041 ?auto_904042 ) ( ON ?auto_904040 ?auto_904041 ) ( ON ?auto_904039 ?auto_904040 ) ( ON ?auto_904038 ?auto_904039 ) ( CLEAR ?auto_904036 ) ( ON ?auto_904037 ?auto_904038 ) ( CLEAR ?auto_904037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_904034 ?auto_904035 ?auto_904036 ?auto_904037 )
      ( MAKE-16PILE ?auto_904034 ?auto_904035 ?auto_904036 ?auto_904037 ?auto_904038 ?auto_904039 ?auto_904040 ?auto_904041 ?auto_904042 ?auto_904043 ?auto_904044 ?auto_904045 ?auto_904046 ?auto_904047 ?auto_904048 ?auto_904049 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_904100 - BLOCK
      ?auto_904101 - BLOCK
      ?auto_904102 - BLOCK
      ?auto_904103 - BLOCK
      ?auto_904104 - BLOCK
      ?auto_904105 - BLOCK
      ?auto_904106 - BLOCK
      ?auto_904107 - BLOCK
      ?auto_904108 - BLOCK
      ?auto_904109 - BLOCK
      ?auto_904110 - BLOCK
      ?auto_904111 - BLOCK
      ?auto_904112 - BLOCK
      ?auto_904113 - BLOCK
      ?auto_904114 - BLOCK
      ?auto_904115 - BLOCK
    )
    :vars
    (
      ?auto_904116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904115 ?auto_904116 ) ( ON-TABLE ?auto_904100 ) ( ON ?auto_904101 ?auto_904100 ) ( not ( = ?auto_904100 ?auto_904101 ) ) ( not ( = ?auto_904100 ?auto_904102 ) ) ( not ( = ?auto_904100 ?auto_904103 ) ) ( not ( = ?auto_904100 ?auto_904104 ) ) ( not ( = ?auto_904100 ?auto_904105 ) ) ( not ( = ?auto_904100 ?auto_904106 ) ) ( not ( = ?auto_904100 ?auto_904107 ) ) ( not ( = ?auto_904100 ?auto_904108 ) ) ( not ( = ?auto_904100 ?auto_904109 ) ) ( not ( = ?auto_904100 ?auto_904110 ) ) ( not ( = ?auto_904100 ?auto_904111 ) ) ( not ( = ?auto_904100 ?auto_904112 ) ) ( not ( = ?auto_904100 ?auto_904113 ) ) ( not ( = ?auto_904100 ?auto_904114 ) ) ( not ( = ?auto_904100 ?auto_904115 ) ) ( not ( = ?auto_904100 ?auto_904116 ) ) ( not ( = ?auto_904101 ?auto_904102 ) ) ( not ( = ?auto_904101 ?auto_904103 ) ) ( not ( = ?auto_904101 ?auto_904104 ) ) ( not ( = ?auto_904101 ?auto_904105 ) ) ( not ( = ?auto_904101 ?auto_904106 ) ) ( not ( = ?auto_904101 ?auto_904107 ) ) ( not ( = ?auto_904101 ?auto_904108 ) ) ( not ( = ?auto_904101 ?auto_904109 ) ) ( not ( = ?auto_904101 ?auto_904110 ) ) ( not ( = ?auto_904101 ?auto_904111 ) ) ( not ( = ?auto_904101 ?auto_904112 ) ) ( not ( = ?auto_904101 ?auto_904113 ) ) ( not ( = ?auto_904101 ?auto_904114 ) ) ( not ( = ?auto_904101 ?auto_904115 ) ) ( not ( = ?auto_904101 ?auto_904116 ) ) ( not ( = ?auto_904102 ?auto_904103 ) ) ( not ( = ?auto_904102 ?auto_904104 ) ) ( not ( = ?auto_904102 ?auto_904105 ) ) ( not ( = ?auto_904102 ?auto_904106 ) ) ( not ( = ?auto_904102 ?auto_904107 ) ) ( not ( = ?auto_904102 ?auto_904108 ) ) ( not ( = ?auto_904102 ?auto_904109 ) ) ( not ( = ?auto_904102 ?auto_904110 ) ) ( not ( = ?auto_904102 ?auto_904111 ) ) ( not ( = ?auto_904102 ?auto_904112 ) ) ( not ( = ?auto_904102 ?auto_904113 ) ) ( not ( = ?auto_904102 ?auto_904114 ) ) ( not ( = ?auto_904102 ?auto_904115 ) ) ( not ( = ?auto_904102 ?auto_904116 ) ) ( not ( = ?auto_904103 ?auto_904104 ) ) ( not ( = ?auto_904103 ?auto_904105 ) ) ( not ( = ?auto_904103 ?auto_904106 ) ) ( not ( = ?auto_904103 ?auto_904107 ) ) ( not ( = ?auto_904103 ?auto_904108 ) ) ( not ( = ?auto_904103 ?auto_904109 ) ) ( not ( = ?auto_904103 ?auto_904110 ) ) ( not ( = ?auto_904103 ?auto_904111 ) ) ( not ( = ?auto_904103 ?auto_904112 ) ) ( not ( = ?auto_904103 ?auto_904113 ) ) ( not ( = ?auto_904103 ?auto_904114 ) ) ( not ( = ?auto_904103 ?auto_904115 ) ) ( not ( = ?auto_904103 ?auto_904116 ) ) ( not ( = ?auto_904104 ?auto_904105 ) ) ( not ( = ?auto_904104 ?auto_904106 ) ) ( not ( = ?auto_904104 ?auto_904107 ) ) ( not ( = ?auto_904104 ?auto_904108 ) ) ( not ( = ?auto_904104 ?auto_904109 ) ) ( not ( = ?auto_904104 ?auto_904110 ) ) ( not ( = ?auto_904104 ?auto_904111 ) ) ( not ( = ?auto_904104 ?auto_904112 ) ) ( not ( = ?auto_904104 ?auto_904113 ) ) ( not ( = ?auto_904104 ?auto_904114 ) ) ( not ( = ?auto_904104 ?auto_904115 ) ) ( not ( = ?auto_904104 ?auto_904116 ) ) ( not ( = ?auto_904105 ?auto_904106 ) ) ( not ( = ?auto_904105 ?auto_904107 ) ) ( not ( = ?auto_904105 ?auto_904108 ) ) ( not ( = ?auto_904105 ?auto_904109 ) ) ( not ( = ?auto_904105 ?auto_904110 ) ) ( not ( = ?auto_904105 ?auto_904111 ) ) ( not ( = ?auto_904105 ?auto_904112 ) ) ( not ( = ?auto_904105 ?auto_904113 ) ) ( not ( = ?auto_904105 ?auto_904114 ) ) ( not ( = ?auto_904105 ?auto_904115 ) ) ( not ( = ?auto_904105 ?auto_904116 ) ) ( not ( = ?auto_904106 ?auto_904107 ) ) ( not ( = ?auto_904106 ?auto_904108 ) ) ( not ( = ?auto_904106 ?auto_904109 ) ) ( not ( = ?auto_904106 ?auto_904110 ) ) ( not ( = ?auto_904106 ?auto_904111 ) ) ( not ( = ?auto_904106 ?auto_904112 ) ) ( not ( = ?auto_904106 ?auto_904113 ) ) ( not ( = ?auto_904106 ?auto_904114 ) ) ( not ( = ?auto_904106 ?auto_904115 ) ) ( not ( = ?auto_904106 ?auto_904116 ) ) ( not ( = ?auto_904107 ?auto_904108 ) ) ( not ( = ?auto_904107 ?auto_904109 ) ) ( not ( = ?auto_904107 ?auto_904110 ) ) ( not ( = ?auto_904107 ?auto_904111 ) ) ( not ( = ?auto_904107 ?auto_904112 ) ) ( not ( = ?auto_904107 ?auto_904113 ) ) ( not ( = ?auto_904107 ?auto_904114 ) ) ( not ( = ?auto_904107 ?auto_904115 ) ) ( not ( = ?auto_904107 ?auto_904116 ) ) ( not ( = ?auto_904108 ?auto_904109 ) ) ( not ( = ?auto_904108 ?auto_904110 ) ) ( not ( = ?auto_904108 ?auto_904111 ) ) ( not ( = ?auto_904108 ?auto_904112 ) ) ( not ( = ?auto_904108 ?auto_904113 ) ) ( not ( = ?auto_904108 ?auto_904114 ) ) ( not ( = ?auto_904108 ?auto_904115 ) ) ( not ( = ?auto_904108 ?auto_904116 ) ) ( not ( = ?auto_904109 ?auto_904110 ) ) ( not ( = ?auto_904109 ?auto_904111 ) ) ( not ( = ?auto_904109 ?auto_904112 ) ) ( not ( = ?auto_904109 ?auto_904113 ) ) ( not ( = ?auto_904109 ?auto_904114 ) ) ( not ( = ?auto_904109 ?auto_904115 ) ) ( not ( = ?auto_904109 ?auto_904116 ) ) ( not ( = ?auto_904110 ?auto_904111 ) ) ( not ( = ?auto_904110 ?auto_904112 ) ) ( not ( = ?auto_904110 ?auto_904113 ) ) ( not ( = ?auto_904110 ?auto_904114 ) ) ( not ( = ?auto_904110 ?auto_904115 ) ) ( not ( = ?auto_904110 ?auto_904116 ) ) ( not ( = ?auto_904111 ?auto_904112 ) ) ( not ( = ?auto_904111 ?auto_904113 ) ) ( not ( = ?auto_904111 ?auto_904114 ) ) ( not ( = ?auto_904111 ?auto_904115 ) ) ( not ( = ?auto_904111 ?auto_904116 ) ) ( not ( = ?auto_904112 ?auto_904113 ) ) ( not ( = ?auto_904112 ?auto_904114 ) ) ( not ( = ?auto_904112 ?auto_904115 ) ) ( not ( = ?auto_904112 ?auto_904116 ) ) ( not ( = ?auto_904113 ?auto_904114 ) ) ( not ( = ?auto_904113 ?auto_904115 ) ) ( not ( = ?auto_904113 ?auto_904116 ) ) ( not ( = ?auto_904114 ?auto_904115 ) ) ( not ( = ?auto_904114 ?auto_904116 ) ) ( not ( = ?auto_904115 ?auto_904116 ) ) ( ON ?auto_904114 ?auto_904115 ) ( ON ?auto_904113 ?auto_904114 ) ( ON ?auto_904112 ?auto_904113 ) ( ON ?auto_904111 ?auto_904112 ) ( ON ?auto_904110 ?auto_904111 ) ( ON ?auto_904109 ?auto_904110 ) ( ON ?auto_904108 ?auto_904109 ) ( ON ?auto_904107 ?auto_904108 ) ( ON ?auto_904106 ?auto_904107 ) ( ON ?auto_904105 ?auto_904106 ) ( ON ?auto_904104 ?auto_904105 ) ( ON ?auto_904103 ?auto_904104 ) ( CLEAR ?auto_904101 ) ( ON ?auto_904102 ?auto_904103 ) ( CLEAR ?auto_904102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_904100 ?auto_904101 ?auto_904102 )
      ( MAKE-16PILE ?auto_904100 ?auto_904101 ?auto_904102 ?auto_904103 ?auto_904104 ?auto_904105 ?auto_904106 ?auto_904107 ?auto_904108 ?auto_904109 ?auto_904110 ?auto_904111 ?auto_904112 ?auto_904113 ?auto_904114 ?auto_904115 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_904166 - BLOCK
      ?auto_904167 - BLOCK
      ?auto_904168 - BLOCK
      ?auto_904169 - BLOCK
      ?auto_904170 - BLOCK
      ?auto_904171 - BLOCK
      ?auto_904172 - BLOCK
      ?auto_904173 - BLOCK
      ?auto_904174 - BLOCK
      ?auto_904175 - BLOCK
      ?auto_904176 - BLOCK
      ?auto_904177 - BLOCK
      ?auto_904178 - BLOCK
      ?auto_904179 - BLOCK
      ?auto_904180 - BLOCK
      ?auto_904181 - BLOCK
    )
    :vars
    (
      ?auto_904182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904181 ?auto_904182 ) ( ON-TABLE ?auto_904166 ) ( not ( = ?auto_904166 ?auto_904167 ) ) ( not ( = ?auto_904166 ?auto_904168 ) ) ( not ( = ?auto_904166 ?auto_904169 ) ) ( not ( = ?auto_904166 ?auto_904170 ) ) ( not ( = ?auto_904166 ?auto_904171 ) ) ( not ( = ?auto_904166 ?auto_904172 ) ) ( not ( = ?auto_904166 ?auto_904173 ) ) ( not ( = ?auto_904166 ?auto_904174 ) ) ( not ( = ?auto_904166 ?auto_904175 ) ) ( not ( = ?auto_904166 ?auto_904176 ) ) ( not ( = ?auto_904166 ?auto_904177 ) ) ( not ( = ?auto_904166 ?auto_904178 ) ) ( not ( = ?auto_904166 ?auto_904179 ) ) ( not ( = ?auto_904166 ?auto_904180 ) ) ( not ( = ?auto_904166 ?auto_904181 ) ) ( not ( = ?auto_904166 ?auto_904182 ) ) ( not ( = ?auto_904167 ?auto_904168 ) ) ( not ( = ?auto_904167 ?auto_904169 ) ) ( not ( = ?auto_904167 ?auto_904170 ) ) ( not ( = ?auto_904167 ?auto_904171 ) ) ( not ( = ?auto_904167 ?auto_904172 ) ) ( not ( = ?auto_904167 ?auto_904173 ) ) ( not ( = ?auto_904167 ?auto_904174 ) ) ( not ( = ?auto_904167 ?auto_904175 ) ) ( not ( = ?auto_904167 ?auto_904176 ) ) ( not ( = ?auto_904167 ?auto_904177 ) ) ( not ( = ?auto_904167 ?auto_904178 ) ) ( not ( = ?auto_904167 ?auto_904179 ) ) ( not ( = ?auto_904167 ?auto_904180 ) ) ( not ( = ?auto_904167 ?auto_904181 ) ) ( not ( = ?auto_904167 ?auto_904182 ) ) ( not ( = ?auto_904168 ?auto_904169 ) ) ( not ( = ?auto_904168 ?auto_904170 ) ) ( not ( = ?auto_904168 ?auto_904171 ) ) ( not ( = ?auto_904168 ?auto_904172 ) ) ( not ( = ?auto_904168 ?auto_904173 ) ) ( not ( = ?auto_904168 ?auto_904174 ) ) ( not ( = ?auto_904168 ?auto_904175 ) ) ( not ( = ?auto_904168 ?auto_904176 ) ) ( not ( = ?auto_904168 ?auto_904177 ) ) ( not ( = ?auto_904168 ?auto_904178 ) ) ( not ( = ?auto_904168 ?auto_904179 ) ) ( not ( = ?auto_904168 ?auto_904180 ) ) ( not ( = ?auto_904168 ?auto_904181 ) ) ( not ( = ?auto_904168 ?auto_904182 ) ) ( not ( = ?auto_904169 ?auto_904170 ) ) ( not ( = ?auto_904169 ?auto_904171 ) ) ( not ( = ?auto_904169 ?auto_904172 ) ) ( not ( = ?auto_904169 ?auto_904173 ) ) ( not ( = ?auto_904169 ?auto_904174 ) ) ( not ( = ?auto_904169 ?auto_904175 ) ) ( not ( = ?auto_904169 ?auto_904176 ) ) ( not ( = ?auto_904169 ?auto_904177 ) ) ( not ( = ?auto_904169 ?auto_904178 ) ) ( not ( = ?auto_904169 ?auto_904179 ) ) ( not ( = ?auto_904169 ?auto_904180 ) ) ( not ( = ?auto_904169 ?auto_904181 ) ) ( not ( = ?auto_904169 ?auto_904182 ) ) ( not ( = ?auto_904170 ?auto_904171 ) ) ( not ( = ?auto_904170 ?auto_904172 ) ) ( not ( = ?auto_904170 ?auto_904173 ) ) ( not ( = ?auto_904170 ?auto_904174 ) ) ( not ( = ?auto_904170 ?auto_904175 ) ) ( not ( = ?auto_904170 ?auto_904176 ) ) ( not ( = ?auto_904170 ?auto_904177 ) ) ( not ( = ?auto_904170 ?auto_904178 ) ) ( not ( = ?auto_904170 ?auto_904179 ) ) ( not ( = ?auto_904170 ?auto_904180 ) ) ( not ( = ?auto_904170 ?auto_904181 ) ) ( not ( = ?auto_904170 ?auto_904182 ) ) ( not ( = ?auto_904171 ?auto_904172 ) ) ( not ( = ?auto_904171 ?auto_904173 ) ) ( not ( = ?auto_904171 ?auto_904174 ) ) ( not ( = ?auto_904171 ?auto_904175 ) ) ( not ( = ?auto_904171 ?auto_904176 ) ) ( not ( = ?auto_904171 ?auto_904177 ) ) ( not ( = ?auto_904171 ?auto_904178 ) ) ( not ( = ?auto_904171 ?auto_904179 ) ) ( not ( = ?auto_904171 ?auto_904180 ) ) ( not ( = ?auto_904171 ?auto_904181 ) ) ( not ( = ?auto_904171 ?auto_904182 ) ) ( not ( = ?auto_904172 ?auto_904173 ) ) ( not ( = ?auto_904172 ?auto_904174 ) ) ( not ( = ?auto_904172 ?auto_904175 ) ) ( not ( = ?auto_904172 ?auto_904176 ) ) ( not ( = ?auto_904172 ?auto_904177 ) ) ( not ( = ?auto_904172 ?auto_904178 ) ) ( not ( = ?auto_904172 ?auto_904179 ) ) ( not ( = ?auto_904172 ?auto_904180 ) ) ( not ( = ?auto_904172 ?auto_904181 ) ) ( not ( = ?auto_904172 ?auto_904182 ) ) ( not ( = ?auto_904173 ?auto_904174 ) ) ( not ( = ?auto_904173 ?auto_904175 ) ) ( not ( = ?auto_904173 ?auto_904176 ) ) ( not ( = ?auto_904173 ?auto_904177 ) ) ( not ( = ?auto_904173 ?auto_904178 ) ) ( not ( = ?auto_904173 ?auto_904179 ) ) ( not ( = ?auto_904173 ?auto_904180 ) ) ( not ( = ?auto_904173 ?auto_904181 ) ) ( not ( = ?auto_904173 ?auto_904182 ) ) ( not ( = ?auto_904174 ?auto_904175 ) ) ( not ( = ?auto_904174 ?auto_904176 ) ) ( not ( = ?auto_904174 ?auto_904177 ) ) ( not ( = ?auto_904174 ?auto_904178 ) ) ( not ( = ?auto_904174 ?auto_904179 ) ) ( not ( = ?auto_904174 ?auto_904180 ) ) ( not ( = ?auto_904174 ?auto_904181 ) ) ( not ( = ?auto_904174 ?auto_904182 ) ) ( not ( = ?auto_904175 ?auto_904176 ) ) ( not ( = ?auto_904175 ?auto_904177 ) ) ( not ( = ?auto_904175 ?auto_904178 ) ) ( not ( = ?auto_904175 ?auto_904179 ) ) ( not ( = ?auto_904175 ?auto_904180 ) ) ( not ( = ?auto_904175 ?auto_904181 ) ) ( not ( = ?auto_904175 ?auto_904182 ) ) ( not ( = ?auto_904176 ?auto_904177 ) ) ( not ( = ?auto_904176 ?auto_904178 ) ) ( not ( = ?auto_904176 ?auto_904179 ) ) ( not ( = ?auto_904176 ?auto_904180 ) ) ( not ( = ?auto_904176 ?auto_904181 ) ) ( not ( = ?auto_904176 ?auto_904182 ) ) ( not ( = ?auto_904177 ?auto_904178 ) ) ( not ( = ?auto_904177 ?auto_904179 ) ) ( not ( = ?auto_904177 ?auto_904180 ) ) ( not ( = ?auto_904177 ?auto_904181 ) ) ( not ( = ?auto_904177 ?auto_904182 ) ) ( not ( = ?auto_904178 ?auto_904179 ) ) ( not ( = ?auto_904178 ?auto_904180 ) ) ( not ( = ?auto_904178 ?auto_904181 ) ) ( not ( = ?auto_904178 ?auto_904182 ) ) ( not ( = ?auto_904179 ?auto_904180 ) ) ( not ( = ?auto_904179 ?auto_904181 ) ) ( not ( = ?auto_904179 ?auto_904182 ) ) ( not ( = ?auto_904180 ?auto_904181 ) ) ( not ( = ?auto_904180 ?auto_904182 ) ) ( not ( = ?auto_904181 ?auto_904182 ) ) ( ON ?auto_904180 ?auto_904181 ) ( ON ?auto_904179 ?auto_904180 ) ( ON ?auto_904178 ?auto_904179 ) ( ON ?auto_904177 ?auto_904178 ) ( ON ?auto_904176 ?auto_904177 ) ( ON ?auto_904175 ?auto_904176 ) ( ON ?auto_904174 ?auto_904175 ) ( ON ?auto_904173 ?auto_904174 ) ( ON ?auto_904172 ?auto_904173 ) ( ON ?auto_904171 ?auto_904172 ) ( ON ?auto_904170 ?auto_904171 ) ( ON ?auto_904169 ?auto_904170 ) ( ON ?auto_904168 ?auto_904169 ) ( CLEAR ?auto_904166 ) ( ON ?auto_904167 ?auto_904168 ) ( CLEAR ?auto_904167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_904166 ?auto_904167 )
      ( MAKE-16PILE ?auto_904166 ?auto_904167 ?auto_904168 ?auto_904169 ?auto_904170 ?auto_904171 ?auto_904172 ?auto_904173 ?auto_904174 ?auto_904175 ?auto_904176 ?auto_904177 ?auto_904178 ?auto_904179 ?auto_904180 ?auto_904181 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_904232 - BLOCK
      ?auto_904233 - BLOCK
      ?auto_904234 - BLOCK
      ?auto_904235 - BLOCK
      ?auto_904236 - BLOCK
      ?auto_904237 - BLOCK
      ?auto_904238 - BLOCK
      ?auto_904239 - BLOCK
      ?auto_904240 - BLOCK
      ?auto_904241 - BLOCK
      ?auto_904242 - BLOCK
      ?auto_904243 - BLOCK
      ?auto_904244 - BLOCK
      ?auto_904245 - BLOCK
      ?auto_904246 - BLOCK
      ?auto_904247 - BLOCK
    )
    :vars
    (
      ?auto_904248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904247 ?auto_904248 ) ( not ( = ?auto_904232 ?auto_904233 ) ) ( not ( = ?auto_904232 ?auto_904234 ) ) ( not ( = ?auto_904232 ?auto_904235 ) ) ( not ( = ?auto_904232 ?auto_904236 ) ) ( not ( = ?auto_904232 ?auto_904237 ) ) ( not ( = ?auto_904232 ?auto_904238 ) ) ( not ( = ?auto_904232 ?auto_904239 ) ) ( not ( = ?auto_904232 ?auto_904240 ) ) ( not ( = ?auto_904232 ?auto_904241 ) ) ( not ( = ?auto_904232 ?auto_904242 ) ) ( not ( = ?auto_904232 ?auto_904243 ) ) ( not ( = ?auto_904232 ?auto_904244 ) ) ( not ( = ?auto_904232 ?auto_904245 ) ) ( not ( = ?auto_904232 ?auto_904246 ) ) ( not ( = ?auto_904232 ?auto_904247 ) ) ( not ( = ?auto_904232 ?auto_904248 ) ) ( not ( = ?auto_904233 ?auto_904234 ) ) ( not ( = ?auto_904233 ?auto_904235 ) ) ( not ( = ?auto_904233 ?auto_904236 ) ) ( not ( = ?auto_904233 ?auto_904237 ) ) ( not ( = ?auto_904233 ?auto_904238 ) ) ( not ( = ?auto_904233 ?auto_904239 ) ) ( not ( = ?auto_904233 ?auto_904240 ) ) ( not ( = ?auto_904233 ?auto_904241 ) ) ( not ( = ?auto_904233 ?auto_904242 ) ) ( not ( = ?auto_904233 ?auto_904243 ) ) ( not ( = ?auto_904233 ?auto_904244 ) ) ( not ( = ?auto_904233 ?auto_904245 ) ) ( not ( = ?auto_904233 ?auto_904246 ) ) ( not ( = ?auto_904233 ?auto_904247 ) ) ( not ( = ?auto_904233 ?auto_904248 ) ) ( not ( = ?auto_904234 ?auto_904235 ) ) ( not ( = ?auto_904234 ?auto_904236 ) ) ( not ( = ?auto_904234 ?auto_904237 ) ) ( not ( = ?auto_904234 ?auto_904238 ) ) ( not ( = ?auto_904234 ?auto_904239 ) ) ( not ( = ?auto_904234 ?auto_904240 ) ) ( not ( = ?auto_904234 ?auto_904241 ) ) ( not ( = ?auto_904234 ?auto_904242 ) ) ( not ( = ?auto_904234 ?auto_904243 ) ) ( not ( = ?auto_904234 ?auto_904244 ) ) ( not ( = ?auto_904234 ?auto_904245 ) ) ( not ( = ?auto_904234 ?auto_904246 ) ) ( not ( = ?auto_904234 ?auto_904247 ) ) ( not ( = ?auto_904234 ?auto_904248 ) ) ( not ( = ?auto_904235 ?auto_904236 ) ) ( not ( = ?auto_904235 ?auto_904237 ) ) ( not ( = ?auto_904235 ?auto_904238 ) ) ( not ( = ?auto_904235 ?auto_904239 ) ) ( not ( = ?auto_904235 ?auto_904240 ) ) ( not ( = ?auto_904235 ?auto_904241 ) ) ( not ( = ?auto_904235 ?auto_904242 ) ) ( not ( = ?auto_904235 ?auto_904243 ) ) ( not ( = ?auto_904235 ?auto_904244 ) ) ( not ( = ?auto_904235 ?auto_904245 ) ) ( not ( = ?auto_904235 ?auto_904246 ) ) ( not ( = ?auto_904235 ?auto_904247 ) ) ( not ( = ?auto_904235 ?auto_904248 ) ) ( not ( = ?auto_904236 ?auto_904237 ) ) ( not ( = ?auto_904236 ?auto_904238 ) ) ( not ( = ?auto_904236 ?auto_904239 ) ) ( not ( = ?auto_904236 ?auto_904240 ) ) ( not ( = ?auto_904236 ?auto_904241 ) ) ( not ( = ?auto_904236 ?auto_904242 ) ) ( not ( = ?auto_904236 ?auto_904243 ) ) ( not ( = ?auto_904236 ?auto_904244 ) ) ( not ( = ?auto_904236 ?auto_904245 ) ) ( not ( = ?auto_904236 ?auto_904246 ) ) ( not ( = ?auto_904236 ?auto_904247 ) ) ( not ( = ?auto_904236 ?auto_904248 ) ) ( not ( = ?auto_904237 ?auto_904238 ) ) ( not ( = ?auto_904237 ?auto_904239 ) ) ( not ( = ?auto_904237 ?auto_904240 ) ) ( not ( = ?auto_904237 ?auto_904241 ) ) ( not ( = ?auto_904237 ?auto_904242 ) ) ( not ( = ?auto_904237 ?auto_904243 ) ) ( not ( = ?auto_904237 ?auto_904244 ) ) ( not ( = ?auto_904237 ?auto_904245 ) ) ( not ( = ?auto_904237 ?auto_904246 ) ) ( not ( = ?auto_904237 ?auto_904247 ) ) ( not ( = ?auto_904237 ?auto_904248 ) ) ( not ( = ?auto_904238 ?auto_904239 ) ) ( not ( = ?auto_904238 ?auto_904240 ) ) ( not ( = ?auto_904238 ?auto_904241 ) ) ( not ( = ?auto_904238 ?auto_904242 ) ) ( not ( = ?auto_904238 ?auto_904243 ) ) ( not ( = ?auto_904238 ?auto_904244 ) ) ( not ( = ?auto_904238 ?auto_904245 ) ) ( not ( = ?auto_904238 ?auto_904246 ) ) ( not ( = ?auto_904238 ?auto_904247 ) ) ( not ( = ?auto_904238 ?auto_904248 ) ) ( not ( = ?auto_904239 ?auto_904240 ) ) ( not ( = ?auto_904239 ?auto_904241 ) ) ( not ( = ?auto_904239 ?auto_904242 ) ) ( not ( = ?auto_904239 ?auto_904243 ) ) ( not ( = ?auto_904239 ?auto_904244 ) ) ( not ( = ?auto_904239 ?auto_904245 ) ) ( not ( = ?auto_904239 ?auto_904246 ) ) ( not ( = ?auto_904239 ?auto_904247 ) ) ( not ( = ?auto_904239 ?auto_904248 ) ) ( not ( = ?auto_904240 ?auto_904241 ) ) ( not ( = ?auto_904240 ?auto_904242 ) ) ( not ( = ?auto_904240 ?auto_904243 ) ) ( not ( = ?auto_904240 ?auto_904244 ) ) ( not ( = ?auto_904240 ?auto_904245 ) ) ( not ( = ?auto_904240 ?auto_904246 ) ) ( not ( = ?auto_904240 ?auto_904247 ) ) ( not ( = ?auto_904240 ?auto_904248 ) ) ( not ( = ?auto_904241 ?auto_904242 ) ) ( not ( = ?auto_904241 ?auto_904243 ) ) ( not ( = ?auto_904241 ?auto_904244 ) ) ( not ( = ?auto_904241 ?auto_904245 ) ) ( not ( = ?auto_904241 ?auto_904246 ) ) ( not ( = ?auto_904241 ?auto_904247 ) ) ( not ( = ?auto_904241 ?auto_904248 ) ) ( not ( = ?auto_904242 ?auto_904243 ) ) ( not ( = ?auto_904242 ?auto_904244 ) ) ( not ( = ?auto_904242 ?auto_904245 ) ) ( not ( = ?auto_904242 ?auto_904246 ) ) ( not ( = ?auto_904242 ?auto_904247 ) ) ( not ( = ?auto_904242 ?auto_904248 ) ) ( not ( = ?auto_904243 ?auto_904244 ) ) ( not ( = ?auto_904243 ?auto_904245 ) ) ( not ( = ?auto_904243 ?auto_904246 ) ) ( not ( = ?auto_904243 ?auto_904247 ) ) ( not ( = ?auto_904243 ?auto_904248 ) ) ( not ( = ?auto_904244 ?auto_904245 ) ) ( not ( = ?auto_904244 ?auto_904246 ) ) ( not ( = ?auto_904244 ?auto_904247 ) ) ( not ( = ?auto_904244 ?auto_904248 ) ) ( not ( = ?auto_904245 ?auto_904246 ) ) ( not ( = ?auto_904245 ?auto_904247 ) ) ( not ( = ?auto_904245 ?auto_904248 ) ) ( not ( = ?auto_904246 ?auto_904247 ) ) ( not ( = ?auto_904246 ?auto_904248 ) ) ( not ( = ?auto_904247 ?auto_904248 ) ) ( ON ?auto_904246 ?auto_904247 ) ( ON ?auto_904245 ?auto_904246 ) ( ON ?auto_904244 ?auto_904245 ) ( ON ?auto_904243 ?auto_904244 ) ( ON ?auto_904242 ?auto_904243 ) ( ON ?auto_904241 ?auto_904242 ) ( ON ?auto_904240 ?auto_904241 ) ( ON ?auto_904239 ?auto_904240 ) ( ON ?auto_904238 ?auto_904239 ) ( ON ?auto_904237 ?auto_904238 ) ( ON ?auto_904236 ?auto_904237 ) ( ON ?auto_904235 ?auto_904236 ) ( ON ?auto_904234 ?auto_904235 ) ( ON ?auto_904233 ?auto_904234 ) ( ON ?auto_904232 ?auto_904233 ) ( CLEAR ?auto_904232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_904232 )
      ( MAKE-16PILE ?auto_904232 ?auto_904233 ?auto_904234 ?auto_904235 ?auto_904236 ?auto_904237 ?auto_904238 ?auto_904239 ?auto_904240 ?auto_904241 ?auto_904242 ?auto_904243 ?auto_904244 ?auto_904245 ?auto_904246 ?auto_904247 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_904299 - BLOCK
      ?auto_904300 - BLOCK
      ?auto_904301 - BLOCK
      ?auto_904302 - BLOCK
      ?auto_904303 - BLOCK
      ?auto_904304 - BLOCK
      ?auto_904305 - BLOCK
      ?auto_904306 - BLOCK
      ?auto_904307 - BLOCK
      ?auto_904308 - BLOCK
      ?auto_904309 - BLOCK
      ?auto_904310 - BLOCK
      ?auto_904311 - BLOCK
      ?auto_904312 - BLOCK
      ?auto_904313 - BLOCK
      ?auto_904314 - BLOCK
      ?auto_904315 - BLOCK
    )
    :vars
    (
      ?auto_904316 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_904314 ) ( ON ?auto_904315 ?auto_904316 ) ( CLEAR ?auto_904315 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_904299 ) ( ON ?auto_904300 ?auto_904299 ) ( ON ?auto_904301 ?auto_904300 ) ( ON ?auto_904302 ?auto_904301 ) ( ON ?auto_904303 ?auto_904302 ) ( ON ?auto_904304 ?auto_904303 ) ( ON ?auto_904305 ?auto_904304 ) ( ON ?auto_904306 ?auto_904305 ) ( ON ?auto_904307 ?auto_904306 ) ( ON ?auto_904308 ?auto_904307 ) ( ON ?auto_904309 ?auto_904308 ) ( ON ?auto_904310 ?auto_904309 ) ( ON ?auto_904311 ?auto_904310 ) ( ON ?auto_904312 ?auto_904311 ) ( ON ?auto_904313 ?auto_904312 ) ( ON ?auto_904314 ?auto_904313 ) ( not ( = ?auto_904299 ?auto_904300 ) ) ( not ( = ?auto_904299 ?auto_904301 ) ) ( not ( = ?auto_904299 ?auto_904302 ) ) ( not ( = ?auto_904299 ?auto_904303 ) ) ( not ( = ?auto_904299 ?auto_904304 ) ) ( not ( = ?auto_904299 ?auto_904305 ) ) ( not ( = ?auto_904299 ?auto_904306 ) ) ( not ( = ?auto_904299 ?auto_904307 ) ) ( not ( = ?auto_904299 ?auto_904308 ) ) ( not ( = ?auto_904299 ?auto_904309 ) ) ( not ( = ?auto_904299 ?auto_904310 ) ) ( not ( = ?auto_904299 ?auto_904311 ) ) ( not ( = ?auto_904299 ?auto_904312 ) ) ( not ( = ?auto_904299 ?auto_904313 ) ) ( not ( = ?auto_904299 ?auto_904314 ) ) ( not ( = ?auto_904299 ?auto_904315 ) ) ( not ( = ?auto_904299 ?auto_904316 ) ) ( not ( = ?auto_904300 ?auto_904301 ) ) ( not ( = ?auto_904300 ?auto_904302 ) ) ( not ( = ?auto_904300 ?auto_904303 ) ) ( not ( = ?auto_904300 ?auto_904304 ) ) ( not ( = ?auto_904300 ?auto_904305 ) ) ( not ( = ?auto_904300 ?auto_904306 ) ) ( not ( = ?auto_904300 ?auto_904307 ) ) ( not ( = ?auto_904300 ?auto_904308 ) ) ( not ( = ?auto_904300 ?auto_904309 ) ) ( not ( = ?auto_904300 ?auto_904310 ) ) ( not ( = ?auto_904300 ?auto_904311 ) ) ( not ( = ?auto_904300 ?auto_904312 ) ) ( not ( = ?auto_904300 ?auto_904313 ) ) ( not ( = ?auto_904300 ?auto_904314 ) ) ( not ( = ?auto_904300 ?auto_904315 ) ) ( not ( = ?auto_904300 ?auto_904316 ) ) ( not ( = ?auto_904301 ?auto_904302 ) ) ( not ( = ?auto_904301 ?auto_904303 ) ) ( not ( = ?auto_904301 ?auto_904304 ) ) ( not ( = ?auto_904301 ?auto_904305 ) ) ( not ( = ?auto_904301 ?auto_904306 ) ) ( not ( = ?auto_904301 ?auto_904307 ) ) ( not ( = ?auto_904301 ?auto_904308 ) ) ( not ( = ?auto_904301 ?auto_904309 ) ) ( not ( = ?auto_904301 ?auto_904310 ) ) ( not ( = ?auto_904301 ?auto_904311 ) ) ( not ( = ?auto_904301 ?auto_904312 ) ) ( not ( = ?auto_904301 ?auto_904313 ) ) ( not ( = ?auto_904301 ?auto_904314 ) ) ( not ( = ?auto_904301 ?auto_904315 ) ) ( not ( = ?auto_904301 ?auto_904316 ) ) ( not ( = ?auto_904302 ?auto_904303 ) ) ( not ( = ?auto_904302 ?auto_904304 ) ) ( not ( = ?auto_904302 ?auto_904305 ) ) ( not ( = ?auto_904302 ?auto_904306 ) ) ( not ( = ?auto_904302 ?auto_904307 ) ) ( not ( = ?auto_904302 ?auto_904308 ) ) ( not ( = ?auto_904302 ?auto_904309 ) ) ( not ( = ?auto_904302 ?auto_904310 ) ) ( not ( = ?auto_904302 ?auto_904311 ) ) ( not ( = ?auto_904302 ?auto_904312 ) ) ( not ( = ?auto_904302 ?auto_904313 ) ) ( not ( = ?auto_904302 ?auto_904314 ) ) ( not ( = ?auto_904302 ?auto_904315 ) ) ( not ( = ?auto_904302 ?auto_904316 ) ) ( not ( = ?auto_904303 ?auto_904304 ) ) ( not ( = ?auto_904303 ?auto_904305 ) ) ( not ( = ?auto_904303 ?auto_904306 ) ) ( not ( = ?auto_904303 ?auto_904307 ) ) ( not ( = ?auto_904303 ?auto_904308 ) ) ( not ( = ?auto_904303 ?auto_904309 ) ) ( not ( = ?auto_904303 ?auto_904310 ) ) ( not ( = ?auto_904303 ?auto_904311 ) ) ( not ( = ?auto_904303 ?auto_904312 ) ) ( not ( = ?auto_904303 ?auto_904313 ) ) ( not ( = ?auto_904303 ?auto_904314 ) ) ( not ( = ?auto_904303 ?auto_904315 ) ) ( not ( = ?auto_904303 ?auto_904316 ) ) ( not ( = ?auto_904304 ?auto_904305 ) ) ( not ( = ?auto_904304 ?auto_904306 ) ) ( not ( = ?auto_904304 ?auto_904307 ) ) ( not ( = ?auto_904304 ?auto_904308 ) ) ( not ( = ?auto_904304 ?auto_904309 ) ) ( not ( = ?auto_904304 ?auto_904310 ) ) ( not ( = ?auto_904304 ?auto_904311 ) ) ( not ( = ?auto_904304 ?auto_904312 ) ) ( not ( = ?auto_904304 ?auto_904313 ) ) ( not ( = ?auto_904304 ?auto_904314 ) ) ( not ( = ?auto_904304 ?auto_904315 ) ) ( not ( = ?auto_904304 ?auto_904316 ) ) ( not ( = ?auto_904305 ?auto_904306 ) ) ( not ( = ?auto_904305 ?auto_904307 ) ) ( not ( = ?auto_904305 ?auto_904308 ) ) ( not ( = ?auto_904305 ?auto_904309 ) ) ( not ( = ?auto_904305 ?auto_904310 ) ) ( not ( = ?auto_904305 ?auto_904311 ) ) ( not ( = ?auto_904305 ?auto_904312 ) ) ( not ( = ?auto_904305 ?auto_904313 ) ) ( not ( = ?auto_904305 ?auto_904314 ) ) ( not ( = ?auto_904305 ?auto_904315 ) ) ( not ( = ?auto_904305 ?auto_904316 ) ) ( not ( = ?auto_904306 ?auto_904307 ) ) ( not ( = ?auto_904306 ?auto_904308 ) ) ( not ( = ?auto_904306 ?auto_904309 ) ) ( not ( = ?auto_904306 ?auto_904310 ) ) ( not ( = ?auto_904306 ?auto_904311 ) ) ( not ( = ?auto_904306 ?auto_904312 ) ) ( not ( = ?auto_904306 ?auto_904313 ) ) ( not ( = ?auto_904306 ?auto_904314 ) ) ( not ( = ?auto_904306 ?auto_904315 ) ) ( not ( = ?auto_904306 ?auto_904316 ) ) ( not ( = ?auto_904307 ?auto_904308 ) ) ( not ( = ?auto_904307 ?auto_904309 ) ) ( not ( = ?auto_904307 ?auto_904310 ) ) ( not ( = ?auto_904307 ?auto_904311 ) ) ( not ( = ?auto_904307 ?auto_904312 ) ) ( not ( = ?auto_904307 ?auto_904313 ) ) ( not ( = ?auto_904307 ?auto_904314 ) ) ( not ( = ?auto_904307 ?auto_904315 ) ) ( not ( = ?auto_904307 ?auto_904316 ) ) ( not ( = ?auto_904308 ?auto_904309 ) ) ( not ( = ?auto_904308 ?auto_904310 ) ) ( not ( = ?auto_904308 ?auto_904311 ) ) ( not ( = ?auto_904308 ?auto_904312 ) ) ( not ( = ?auto_904308 ?auto_904313 ) ) ( not ( = ?auto_904308 ?auto_904314 ) ) ( not ( = ?auto_904308 ?auto_904315 ) ) ( not ( = ?auto_904308 ?auto_904316 ) ) ( not ( = ?auto_904309 ?auto_904310 ) ) ( not ( = ?auto_904309 ?auto_904311 ) ) ( not ( = ?auto_904309 ?auto_904312 ) ) ( not ( = ?auto_904309 ?auto_904313 ) ) ( not ( = ?auto_904309 ?auto_904314 ) ) ( not ( = ?auto_904309 ?auto_904315 ) ) ( not ( = ?auto_904309 ?auto_904316 ) ) ( not ( = ?auto_904310 ?auto_904311 ) ) ( not ( = ?auto_904310 ?auto_904312 ) ) ( not ( = ?auto_904310 ?auto_904313 ) ) ( not ( = ?auto_904310 ?auto_904314 ) ) ( not ( = ?auto_904310 ?auto_904315 ) ) ( not ( = ?auto_904310 ?auto_904316 ) ) ( not ( = ?auto_904311 ?auto_904312 ) ) ( not ( = ?auto_904311 ?auto_904313 ) ) ( not ( = ?auto_904311 ?auto_904314 ) ) ( not ( = ?auto_904311 ?auto_904315 ) ) ( not ( = ?auto_904311 ?auto_904316 ) ) ( not ( = ?auto_904312 ?auto_904313 ) ) ( not ( = ?auto_904312 ?auto_904314 ) ) ( not ( = ?auto_904312 ?auto_904315 ) ) ( not ( = ?auto_904312 ?auto_904316 ) ) ( not ( = ?auto_904313 ?auto_904314 ) ) ( not ( = ?auto_904313 ?auto_904315 ) ) ( not ( = ?auto_904313 ?auto_904316 ) ) ( not ( = ?auto_904314 ?auto_904315 ) ) ( not ( = ?auto_904314 ?auto_904316 ) ) ( not ( = ?auto_904315 ?auto_904316 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_904315 ?auto_904316 )
      ( !STACK ?auto_904315 ?auto_904314 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_904369 - BLOCK
      ?auto_904370 - BLOCK
      ?auto_904371 - BLOCK
      ?auto_904372 - BLOCK
      ?auto_904373 - BLOCK
      ?auto_904374 - BLOCK
      ?auto_904375 - BLOCK
      ?auto_904376 - BLOCK
      ?auto_904377 - BLOCK
      ?auto_904378 - BLOCK
      ?auto_904379 - BLOCK
      ?auto_904380 - BLOCK
      ?auto_904381 - BLOCK
      ?auto_904382 - BLOCK
      ?auto_904383 - BLOCK
      ?auto_904384 - BLOCK
      ?auto_904385 - BLOCK
    )
    :vars
    (
      ?auto_904386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904385 ?auto_904386 ) ( ON-TABLE ?auto_904369 ) ( ON ?auto_904370 ?auto_904369 ) ( ON ?auto_904371 ?auto_904370 ) ( ON ?auto_904372 ?auto_904371 ) ( ON ?auto_904373 ?auto_904372 ) ( ON ?auto_904374 ?auto_904373 ) ( ON ?auto_904375 ?auto_904374 ) ( ON ?auto_904376 ?auto_904375 ) ( ON ?auto_904377 ?auto_904376 ) ( ON ?auto_904378 ?auto_904377 ) ( ON ?auto_904379 ?auto_904378 ) ( ON ?auto_904380 ?auto_904379 ) ( ON ?auto_904381 ?auto_904380 ) ( ON ?auto_904382 ?auto_904381 ) ( ON ?auto_904383 ?auto_904382 ) ( not ( = ?auto_904369 ?auto_904370 ) ) ( not ( = ?auto_904369 ?auto_904371 ) ) ( not ( = ?auto_904369 ?auto_904372 ) ) ( not ( = ?auto_904369 ?auto_904373 ) ) ( not ( = ?auto_904369 ?auto_904374 ) ) ( not ( = ?auto_904369 ?auto_904375 ) ) ( not ( = ?auto_904369 ?auto_904376 ) ) ( not ( = ?auto_904369 ?auto_904377 ) ) ( not ( = ?auto_904369 ?auto_904378 ) ) ( not ( = ?auto_904369 ?auto_904379 ) ) ( not ( = ?auto_904369 ?auto_904380 ) ) ( not ( = ?auto_904369 ?auto_904381 ) ) ( not ( = ?auto_904369 ?auto_904382 ) ) ( not ( = ?auto_904369 ?auto_904383 ) ) ( not ( = ?auto_904369 ?auto_904384 ) ) ( not ( = ?auto_904369 ?auto_904385 ) ) ( not ( = ?auto_904369 ?auto_904386 ) ) ( not ( = ?auto_904370 ?auto_904371 ) ) ( not ( = ?auto_904370 ?auto_904372 ) ) ( not ( = ?auto_904370 ?auto_904373 ) ) ( not ( = ?auto_904370 ?auto_904374 ) ) ( not ( = ?auto_904370 ?auto_904375 ) ) ( not ( = ?auto_904370 ?auto_904376 ) ) ( not ( = ?auto_904370 ?auto_904377 ) ) ( not ( = ?auto_904370 ?auto_904378 ) ) ( not ( = ?auto_904370 ?auto_904379 ) ) ( not ( = ?auto_904370 ?auto_904380 ) ) ( not ( = ?auto_904370 ?auto_904381 ) ) ( not ( = ?auto_904370 ?auto_904382 ) ) ( not ( = ?auto_904370 ?auto_904383 ) ) ( not ( = ?auto_904370 ?auto_904384 ) ) ( not ( = ?auto_904370 ?auto_904385 ) ) ( not ( = ?auto_904370 ?auto_904386 ) ) ( not ( = ?auto_904371 ?auto_904372 ) ) ( not ( = ?auto_904371 ?auto_904373 ) ) ( not ( = ?auto_904371 ?auto_904374 ) ) ( not ( = ?auto_904371 ?auto_904375 ) ) ( not ( = ?auto_904371 ?auto_904376 ) ) ( not ( = ?auto_904371 ?auto_904377 ) ) ( not ( = ?auto_904371 ?auto_904378 ) ) ( not ( = ?auto_904371 ?auto_904379 ) ) ( not ( = ?auto_904371 ?auto_904380 ) ) ( not ( = ?auto_904371 ?auto_904381 ) ) ( not ( = ?auto_904371 ?auto_904382 ) ) ( not ( = ?auto_904371 ?auto_904383 ) ) ( not ( = ?auto_904371 ?auto_904384 ) ) ( not ( = ?auto_904371 ?auto_904385 ) ) ( not ( = ?auto_904371 ?auto_904386 ) ) ( not ( = ?auto_904372 ?auto_904373 ) ) ( not ( = ?auto_904372 ?auto_904374 ) ) ( not ( = ?auto_904372 ?auto_904375 ) ) ( not ( = ?auto_904372 ?auto_904376 ) ) ( not ( = ?auto_904372 ?auto_904377 ) ) ( not ( = ?auto_904372 ?auto_904378 ) ) ( not ( = ?auto_904372 ?auto_904379 ) ) ( not ( = ?auto_904372 ?auto_904380 ) ) ( not ( = ?auto_904372 ?auto_904381 ) ) ( not ( = ?auto_904372 ?auto_904382 ) ) ( not ( = ?auto_904372 ?auto_904383 ) ) ( not ( = ?auto_904372 ?auto_904384 ) ) ( not ( = ?auto_904372 ?auto_904385 ) ) ( not ( = ?auto_904372 ?auto_904386 ) ) ( not ( = ?auto_904373 ?auto_904374 ) ) ( not ( = ?auto_904373 ?auto_904375 ) ) ( not ( = ?auto_904373 ?auto_904376 ) ) ( not ( = ?auto_904373 ?auto_904377 ) ) ( not ( = ?auto_904373 ?auto_904378 ) ) ( not ( = ?auto_904373 ?auto_904379 ) ) ( not ( = ?auto_904373 ?auto_904380 ) ) ( not ( = ?auto_904373 ?auto_904381 ) ) ( not ( = ?auto_904373 ?auto_904382 ) ) ( not ( = ?auto_904373 ?auto_904383 ) ) ( not ( = ?auto_904373 ?auto_904384 ) ) ( not ( = ?auto_904373 ?auto_904385 ) ) ( not ( = ?auto_904373 ?auto_904386 ) ) ( not ( = ?auto_904374 ?auto_904375 ) ) ( not ( = ?auto_904374 ?auto_904376 ) ) ( not ( = ?auto_904374 ?auto_904377 ) ) ( not ( = ?auto_904374 ?auto_904378 ) ) ( not ( = ?auto_904374 ?auto_904379 ) ) ( not ( = ?auto_904374 ?auto_904380 ) ) ( not ( = ?auto_904374 ?auto_904381 ) ) ( not ( = ?auto_904374 ?auto_904382 ) ) ( not ( = ?auto_904374 ?auto_904383 ) ) ( not ( = ?auto_904374 ?auto_904384 ) ) ( not ( = ?auto_904374 ?auto_904385 ) ) ( not ( = ?auto_904374 ?auto_904386 ) ) ( not ( = ?auto_904375 ?auto_904376 ) ) ( not ( = ?auto_904375 ?auto_904377 ) ) ( not ( = ?auto_904375 ?auto_904378 ) ) ( not ( = ?auto_904375 ?auto_904379 ) ) ( not ( = ?auto_904375 ?auto_904380 ) ) ( not ( = ?auto_904375 ?auto_904381 ) ) ( not ( = ?auto_904375 ?auto_904382 ) ) ( not ( = ?auto_904375 ?auto_904383 ) ) ( not ( = ?auto_904375 ?auto_904384 ) ) ( not ( = ?auto_904375 ?auto_904385 ) ) ( not ( = ?auto_904375 ?auto_904386 ) ) ( not ( = ?auto_904376 ?auto_904377 ) ) ( not ( = ?auto_904376 ?auto_904378 ) ) ( not ( = ?auto_904376 ?auto_904379 ) ) ( not ( = ?auto_904376 ?auto_904380 ) ) ( not ( = ?auto_904376 ?auto_904381 ) ) ( not ( = ?auto_904376 ?auto_904382 ) ) ( not ( = ?auto_904376 ?auto_904383 ) ) ( not ( = ?auto_904376 ?auto_904384 ) ) ( not ( = ?auto_904376 ?auto_904385 ) ) ( not ( = ?auto_904376 ?auto_904386 ) ) ( not ( = ?auto_904377 ?auto_904378 ) ) ( not ( = ?auto_904377 ?auto_904379 ) ) ( not ( = ?auto_904377 ?auto_904380 ) ) ( not ( = ?auto_904377 ?auto_904381 ) ) ( not ( = ?auto_904377 ?auto_904382 ) ) ( not ( = ?auto_904377 ?auto_904383 ) ) ( not ( = ?auto_904377 ?auto_904384 ) ) ( not ( = ?auto_904377 ?auto_904385 ) ) ( not ( = ?auto_904377 ?auto_904386 ) ) ( not ( = ?auto_904378 ?auto_904379 ) ) ( not ( = ?auto_904378 ?auto_904380 ) ) ( not ( = ?auto_904378 ?auto_904381 ) ) ( not ( = ?auto_904378 ?auto_904382 ) ) ( not ( = ?auto_904378 ?auto_904383 ) ) ( not ( = ?auto_904378 ?auto_904384 ) ) ( not ( = ?auto_904378 ?auto_904385 ) ) ( not ( = ?auto_904378 ?auto_904386 ) ) ( not ( = ?auto_904379 ?auto_904380 ) ) ( not ( = ?auto_904379 ?auto_904381 ) ) ( not ( = ?auto_904379 ?auto_904382 ) ) ( not ( = ?auto_904379 ?auto_904383 ) ) ( not ( = ?auto_904379 ?auto_904384 ) ) ( not ( = ?auto_904379 ?auto_904385 ) ) ( not ( = ?auto_904379 ?auto_904386 ) ) ( not ( = ?auto_904380 ?auto_904381 ) ) ( not ( = ?auto_904380 ?auto_904382 ) ) ( not ( = ?auto_904380 ?auto_904383 ) ) ( not ( = ?auto_904380 ?auto_904384 ) ) ( not ( = ?auto_904380 ?auto_904385 ) ) ( not ( = ?auto_904380 ?auto_904386 ) ) ( not ( = ?auto_904381 ?auto_904382 ) ) ( not ( = ?auto_904381 ?auto_904383 ) ) ( not ( = ?auto_904381 ?auto_904384 ) ) ( not ( = ?auto_904381 ?auto_904385 ) ) ( not ( = ?auto_904381 ?auto_904386 ) ) ( not ( = ?auto_904382 ?auto_904383 ) ) ( not ( = ?auto_904382 ?auto_904384 ) ) ( not ( = ?auto_904382 ?auto_904385 ) ) ( not ( = ?auto_904382 ?auto_904386 ) ) ( not ( = ?auto_904383 ?auto_904384 ) ) ( not ( = ?auto_904383 ?auto_904385 ) ) ( not ( = ?auto_904383 ?auto_904386 ) ) ( not ( = ?auto_904384 ?auto_904385 ) ) ( not ( = ?auto_904384 ?auto_904386 ) ) ( not ( = ?auto_904385 ?auto_904386 ) ) ( CLEAR ?auto_904383 ) ( ON ?auto_904384 ?auto_904385 ) ( CLEAR ?auto_904384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_904369 ?auto_904370 ?auto_904371 ?auto_904372 ?auto_904373 ?auto_904374 ?auto_904375 ?auto_904376 ?auto_904377 ?auto_904378 ?auto_904379 ?auto_904380 ?auto_904381 ?auto_904382 ?auto_904383 ?auto_904384 )
      ( MAKE-17PILE ?auto_904369 ?auto_904370 ?auto_904371 ?auto_904372 ?auto_904373 ?auto_904374 ?auto_904375 ?auto_904376 ?auto_904377 ?auto_904378 ?auto_904379 ?auto_904380 ?auto_904381 ?auto_904382 ?auto_904383 ?auto_904384 ?auto_904385 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_904439 - BLOCK
      ?auto_904440 - BLOCK
      ?auto_904441 - BLOCK
      ?auto_904442 - BLOCK
      ?auto_904443 - BLOCK
      ?auto_904444 - BLOCK
      ?auto_904445 - BLOCK
      ?auto_904446 - BLOCK
      ?auto_904447 - BLOCK
      ?auto_904448 - BLOCK
      ?auto_904449 - BLOCK
      ?auto_904450 - BLOCK
      ?auto_904451 - BLOCK
      ?auto_904452 - BLOCK
      ?auto_904453 - BLOCK
      ?auto_904454 - BLOCK
      ?auto_904455 - BLOCK
    )
    :vars
    (
      ?auto_904456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904455 ?auto_904456 ) ( ON-TABLE ?auto_904439 ) ( ON ?auto_904440 ?auto_904439 ) ( ON ?auto_904441 ?auto_904440 ) ( ON ?auto_904442 ?auto_904441 ) ( ON ?auto_904443 ?auto_904442 ) ( ON ?auto_904444 ?auto_904443 ) ( ON ?auto_904445 ?auto_904444 ) ( ON ?auto_904446 ?auto_904445 ) ( ON ?auto_904447 ?auto_904446 ) ( ON ?auto_904448 ?auto_904447 ) ( ON ?auto_904449 ?auto_904448 ) ( ON ?auto_904450 ?auto_904449 ) ( ON ?auto_904451 ?auto_904450 ) ( ON ?auto_904452 ?auto_904451 ) ( not ( = ?auto_904439 ?auto_904440 ) ) ( not ( = ?auto_904439 ?auto_904441 ) ) ( not ( = ?auto_904439 ?auto_904442 ) ) ( not ( = ?auto_904439 ?auto_904443 ) ) ( not ( = ?auto_904439 ?auto_904444 ) ) ( not ( = ?auto_904439 ?auto_904445 ) ) ( not ( = ?auto_904439 ?auto_904446 ) ) ( not ( = ?auto_904439 ?auto_904447 ) ) ( not ( = ?auto_904439 ?auto_904448 ) ) ( not ( = ?auto_904439 ?auto_904449 ) ) ( not ( = ?auto_904439 ?auto_904450 ) ) ( not ( = ?auto_904439 ?auto_904451 ) ) ( not ( = ?auto_904439 ?auto_904452 ) ) ( not ( = ?auto_904439 ?auto_904453 ) ) ( not ( = ?auto_904439 ?auto_904454 ) ) ( not ( = ?auto_904439 ?auto_904455 ) ) ( not ( = ?auto_904439 ?auto_904456 ) ) ( not ( = ?auto_904440 ?auto_904441 ) ) ( not ( = ?auto_904440 ?auto_904442 ) ) ( not ( = ?auto_904440 ?auto_904443 ) ) ( not ( = ?auto_904440 ?auto_904444 ) ) ( not ( = ?auto_904440 ?auto_904445 ) ) ( not ( = ?auto_904440 ?auto_904446 ) ) ( not ( = ?auto_904440 ?auto_904447 ) ) ( not ( = ?auto_904440 ?auto_904448 ) ) ( not ( = ?auto_904440 ?auto_904449 ) ) ( not ( = ?auto_904440 ?auto_904450 ) ) ( not ( = ?auto_904440 ?auto_904451 ) ) ( not ( = ?auto_904440 ?auto_904452 ) ) ( not ( = ?auto_904440 ?auto_904453 ) ) ( not ( = ?auto_904440 ?auto_904454 ) ) ( not ( = ?auto_904440 ?auto_904455 ) ) ( not ( = ?auto_904440 ?auto_904456 ) ) ( not ( = ?auto_904441 ?auto_904442 ) ) ( not ( = ?auto_904441 ?auto_904443 ) ) ( not ( = ?auto_904441 ?auto_904444 ) ) ( not ( = ?auto_904441 ?auto_904445 ) ) ( not ( = ?auto_904441 ?auto_904446 ) ) ( not ( = ?auto_904441 ?auto_904447 ) ) ( not ( = ?auto_904441 ?auto_904448 ) ) ( not ( = ?auto_904441 ?auto_904449 ) ) ( not ( = ?auto_904441 ?auto_904450 ) ) ( not ( = ?auto_904441 ?auto_904451 ) ) ( not ( = ?auto_904441 ?auto_904452 ) ) ( not ( = ?auto_904441 ?auto_904453 ) ) ( not ( = ?auto_904441 ?auto_904454 ) ) ( not ( = ?auto_904441 ?auto_904455 ) ) ( not ( = ?auto_904441 ?auto_904456 ) ) ( not ( = ?auto_904442 ?auto_904443 ) ) ( not ( = ?auto_904442 ?auto_904444 ) ) ( not ( = ?auto_904442 ?auto_904445 ) ) ( not ( = ?auto_904442 ?auto_904446 ) ) ( not ( = ?auto_904442 ?auto_904447 ) ) ( not ( = ?auto_904442 ?auto_904448 ) ) ( not ( = ?auto_904442 ?auto_904449 ) ) ( not ( = ?auto_904442 ?auto_904450 ) ) ( not ( = ?auto_904442 ?auto_904451 ) ) ( not ( = ?auto_904442 ?auto_904452 ) ) ( not ( = ?auto_904442 ?auto_904453 ) ) ( not ( = ?auto_904442 ?auto_904454 ) ) ( not ( = ?auto_904442 ?auto_904455 ) ) ( not ( = ?auto_904442 ?auto_904456 ) ) ( not ( = ?auto_904443 ?auto_904444 ) ) ( not ( = ?auto_904443 ?auto_904445 ) ) ( not ( = ?auto_904443 ?auto_904446 ) ) ( not ( = ?auto_904443 ?auto_904447 ) ) ( not ( = ?auto_904443 ?auto_904448 ) ) ( not ( = ?auto_904443 ?auto_904449 ) ) ( not ( = ?auto_904443 ?auto_904450 ) ) ( not ( = ?auto_904443 ?auto_904451 ) ) ( not ( = ?auto_904443 ?auto_904452 ) ) ( not ( = ?auto_904443 ?auto_904453 ) ) ( not ( = ?auto_904443 ?auto_904454 ) ) ( not ( = ?auto_904443 ?auto_904455 ) ) ( not ( = ?auto_904443 ?auto_904456 ) ) ( not ( = ?auto_904444 ?auto_904445 ) ) ( not ( = ?auto_904444 ?auto_904446 ) ) ( not ( = ?auto_904444 ?auto_904447 ) ) ( not ( = ?auto_904444 ?auto_904448 ) ) ( not ( = ?auto_904444 ?auto_904449 ) ) ( not ( = ?auto_904444 ?auto_904450 ) ) ( not ( = ?auto_904444 ?auto_904451 ) ) ( not ( = ?auto_904444 ?auto_904452 ) ) ( not ( = ?auto_904444 ?auto_904453 ) ) ( not ( = ?auto_904444 ?auto_904454 ) ) ( not ( = ?auto_904444 ?auto_904455 ) ) ( not ( = ?auto_904444 ?auto_904456 ) ) ( not ( = ?auto_904445 ?auto_904446 ) ) ( not ( = ?auto_904445 ?auto_904447 ) ) ( not ( = ?auto_904445 ?auto_904448 ) ) ( not ( = ?auto_904445 ?auto_904449 ) ) ( not ( = ?auto_904445 ?auto_904450 ) ) ( not ( = ?auto_904445 ?auto_904451 ) ) ( not ( = ?auto_904445 ?auto_904452 ) ) ( not ( = ?auto_904445 ?auto_904453 ) ) ( not ( = ?auto_904445 ?auto_904454 ) ) ( not ( = ?auto_904445 ?auto_904455 ) ) ( not ( = ?auto_904445 ?auto_904456 ) ) ( not ( = ?auto_904446 ?auto_904447 ) ) ( not ( = ?auto_904446 ?auto_904448 ) ) ( not ( = ?auto_904446 ?auto_904449 ) ) ( not ( = ?auto_904446 ?auto_904450 ) ) ( not ( = ?auto_904446 ?auto_904451 ) ) ( not ( = ?auto_904446 ?auto_904452 ) ) ( not ( = ?auto_904446 ?auto_904453 ) ) ( not ( = ?auto_904446 ?auto_904454 ) ) ( not ( = ?auto_904446 ?auto_904455 ) ) ( not ( = ?auto_904446 ?auto_904456 ) ) ( not ( = ?auto_904447 ?auto_904448 ) ) ( not ( = ?auto_904447 ?auto_904449 ) ) ( not ( = ?auto_904447 ?auto_904450 ) ) ( not ( = ?auto_904447 ?auto_904451 ) ) ( not ( = ?auto_904447 ?auto_904452 ) ) ( not ( = ?auto_904447 ?auto_904453 ) ) ( not ( = ?auto_904447 ?auto_904454 ) ) ( not ( = ?auto_904447 ?auto_904455 ) ) ( not ( = ?auto_904447 ?auto_904456 ) ) ( not ( = ?auto_904448 ?auto_904449 ) ) ( not ( = ?auto_904448 ?auto_904450 ) ) ( not ( = ?auto_904448 ?auto_904451 ) ) ( not ( = ?auto_904448 ?auto_904452 ) ) ( not ( = ?auto_904448 ?auto_904453 ) ) ( not ( = ?auto_904448 ?auto_904454 ) ) ( not ( = ?auto_904448 ?auto_904455 ) ) ( not ( = ?auto_904448 ?auto_904456 ) ) ( not ( = ?auto_904449 ?auto_904450 ) ) ( not ( = ?auto_904449 ?auto_904451 ) ) ( not ( = ?auto_904449 ?auto_904452 ) ) ( not ( = ?auto_904449 ?auto_904453 ) ) ( not ( = ?auto_904449 ?auto_904454 ) ) ( not ( = ?auto_904449 ?auto_904455 ) ) ( not ( = ?auto_904449 ?auto_904456 ) ) ( not ( = ?auto_904450 ?auto_904451 ) ) ( not ( = ?auto_904450 ?auto_904452 ) ) ( not ( = ?auto_904450 ?auto_904453 ) ) ( not ( = ?auto_904450 ?auto_904454 ) ) ( not ( = ?auto_904450 ?auto_904455 ) ) ( not ( = ?auto_904450 ?auto_904456 ) ) ( not ( = ?auto_904451 ?auto_904452 ) ) ( not ( = ?auto_904451 ?auto_904453 ) ) ( not ( = ?auto_904451 ?auto_904454 ) ) ( not ( = ?auto_904451 ?auto_904455 ) ) ( not ( = ?auto_904451 ?auto_904456 ) ) ( not ( = ?auto_904452 ?auto_904453 ) ) ( not ( = ?auto_904452 ?auto_904454 ) ) ( not ( = ?auto_904452 ?auto_904455 ) ) ( not ( = ?auto_904452 ?auto_904456 ) ) ( not ( = ?auto_904453 ?auto_904454 ) ) ( not ( = ?auto_904453 ?auto_904455 ) ) ( not ( = ?auto_904453 ?auto_904456 ) ) ( not ( = ?auto_904454 ?auto_904455 ) ) ( not ( = ?auto_904454 ?auto_904456 ) ) ( not ( = ?auto_904455 ?auto_904456 ) ) ( ON ?auto_904454 ?auto_904455 ) ( CLEAR ?auto_904452 ) ( ON ?auto_904453 ?auto_904454 ) ( CLEAR ?auto_904453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_904439 ?auto_904440 ?auto_904441 ?auto_904442 ?auto_904443 ?auto_904444 ?auto_904445 ?auto_904446 ?auto_904447 ?auto_904448 ?auto_904449 ?auto_904450 ?auto_904451 ?auto_904452 ?auto_904453 )
      ( MAKE-17PILE ?auto_904439 ?auto_904440 ?auto_904441 ?auto_904442 ?auto_904443 ?auto_904444 ?auto_904445 ?auto_904446 ?auto_904447 ?auto_904448 ?auto_904449 ?auto_904450 ?auto_904451 ?auto_904452 ?auto_904453 ?auto_904454 ?auto_904455 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_904509 - BLOCK
      ?auto_904510 - BLOCK
      ?auto_904511 - BLOCK
      ?auto_904512 - BLOCK
      ?auto_904513 - BLOCK
      ?auto_904514 - BLOCK
      ?auto_904515 - BLOCK
      ?auto_904516 - BLOCK
      ?auto_904517 - BLOCK
      ?auto_904518 - BLOCK
      ?auto_904519 - BLOCK
      ?auto_904520 - BLOCK
      ?auto_904521 - BLOCK
      ?auto_904522 - BLOCK
      ?auto_904523 - BLOCK
      ?auto_904524 - BLOCK
      ?auto_904525 - BLOCK
    )
    :vars
    (
      ?auto_904526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904525 ?auto_904526 ) ( ON-TABLE ?auto_904509 ) ( ON ?auto_904510 ?auto_904509 ) ( ON ?auto_904511 ?auto_904510 ) ( ON ?auto_904512 ?auto_904511 ) ( ON ?auto_904513 ?auto_904512 ) ( ON ?auto_904514 ?auto_904513 ) ( ON ?auto_904515 ?auto_904514 ) ( ON ?auto_904516 ?auto_904515 ) ( ON ?auto_904517 ?auto_904516 ) ( ON ?auto_904518 ?auto_904517 ) ( ON ?auto_904519 ?auto_904518 ) ( ON ?auto_904520 ?auto_904519 ) ( ON ?auto_904521 ?auto_904520 ) ( not ( = ?auto_904509 ?auto_904510 ) ) ( not ( = ?auto_904509 ?auto_904511 ) ) ( not ( = ?auto_904509 ?auto_904512 ) ) ( not ( = ?auto_904509 ?auto_904513 ) ) ( not ( = ?auto_904509 ?auto_904514 ) ) ( not ( = ?auto_904509 ?auto_904515 ) ) ( not ( = ?auto_904509 ?auto_904516 ) ) ( not ( = ?auto_904509 ?auto_904517 ) ) ( not ( = ?auto_904509 ?auto_904518 ) ) ( not ( = ?auto_904509 ?auto_904519 ) ) ( not ( = ?auto_904509 ?auto_904520 ) ) ( not ( = ?auto_904509 ?auto_904521 ) ) ( not ( = ?auto_904509 ?auto_904522 ) ) ( not ( = ?auto_904509 ?auto_904523 ) ) ( not ( = ?auto_904509 ?auto_904524 ) ) ( not ( = ?auto_904509 ?auto_904525 ) ) ( not ( = ?auto_904509 ?auto_904526 ) ) ( not ( = ?auto_904510 ?auto_904511 ) ) ( not ( = ?auto_904510 ?auto_904512 ) ) ( not ( = ?auto_904510 ?auto_904513 ) ) ( not ( = ?auto_904510 ?auto_904514 ) ) ( not ( = ?auto_904510 ?auto_904515 ) ) ( not ( = ?auto_904510 ?auto_904516 ) ) ( not ( = ?auto_904510 ?auto_904517 ) ) ( not ( = ?auto_904510 ?auto_904518 ) ) ( not ( = ?auto_904510 ?auto_904519 ) ) ( not ( = ?auto_904510 ?auto_904520 ) ) ( not ( = ?auto_904510 ?auto_904521 ) ) ( not ( = ?auto_904510 ?auto_904522 ) ) ( not ( = ?auto_904510 ?auto_904523 ) ) ( not ( = ?auto_904510 ?auto_904524 ) ) ( not ( = ?auto_904510 ?auto_904525 ) ) ( not ( = ?auto_904510 ?auto_904526 ) ) ( not ( = ?auto_904511 ?auto_904512 ) ) ( not ( = ?auto_904511 ?auto_904513 ) ) ( not ( = ?auto_904511 ?auto_904514 ) ) ( not ( = ?auto_904511 ?auto_904515 ) ) ( not ( = ?auto_904511 ?auto_904516 ) ) ( not ( = ?auto_904511 ?auto_904517 ) ) ( not ( = ?auto_904511 ?auto_904518 ) ) ( not ( = ?auto_904511 ?auto_904519 ) ) ( not ( = ?auto_904511 ?auto_904520 ) ) ( not ( = ?auto_904511 ?auto_904521 ) ) ( not ( = ?auto_904511 ?auto_904522 ) ) ( not ( = ?auto_904511 ?auto_904523 ) ) ( not ( = ?auto_904511 ?auto_904524 ) ) ( not ( = ?auto_904511 ?auto_904525 ) ) ( not ( = ?auto_904511 ?auto_904526 ) ) ( not ( = ?auto_904512 ?auto_904513 ) ) ( not ( = ?auto_904512 ?auto_904514 ) ) ( not ( = ?auto_904512 ?auto_904515 ) ) ( not ( = ?auto_904512 ?auto_904516 ) ) ( not ( = ?auto_904512 ?auto_904517 ) ) ( not ( = ?auto_904512 ?auto_904518 ) ) ( not ( = ?auto_904512 ?auto_904519 ) ) ( not ( = ?auto_904512 ?auto_904520 ) ) ( not ( = ?auto_904512 ?auto_904521 ) ) ( not ( = ?auto_904512 ?auto_904522 ) ) ( not ( = ?auto_904512 ?auto_904523 ) ) ( not ( = ?auto_904512 ?auto_904524 ) ) ( not ( = ?auto_904512 ?auto_904525 ) ) ( not ( = ?auto_904512 ?auto_904526 ) ) ( not ( = ?auto_904513 ?auto_904514 ) ) ( not ( = ?auto_904513 ?auto_904515 ) ) ( not ( = ?auto_904513 ?auto_904516 ) ) ( not ( = ?auto_904513 ?auto_904517 ) ) ( not ( = ?auto_904513 ?auto_904518 ) ) ( not ( = ?auto_904513 ?auto_904519 ) ) ( not ( = ?auto_904513 ?auto_904520 ) ) ( not ( = ?auto_904513 ?auto_904521 ) ) ( not ( = ?auto_904513 ?auto_904522 ) ) ( not ( = ?auto_904513 ?auto_904523 ) ) ( not ( = ?auto_904513 ?auto_904524 ) ) ( not ( = ?auto_904513 ?auto_904525 ) ) ( not ( = ?auto_904513 ?auto_904526 ) ) ( not ( = ?auto_904514 ?auto_904515 ) ) ( not ( = ?auto_904514 ?auto_904516 ) ) ( not ( = ?auto_904514 ?auto_904517 ) ) ( not ( = ?auto_904514 ?auto_904518 ) ) ( not ( = ?auto_904514 ?auto_904519 ) ) ( not ( = ?auto_904514 ?auto_904520 ) ) ( not ( = ?auto_904514 ?auto_904521 ) ) ( not ( = ?auto_904514 ?auto_904522 ) ) ( not ( = ?auto_904514 ?auto_904523 ) ) ( not ( = ?auto_904514 ?auto_904524 ) ) ( not ( = ?auto_904514 ?auto_904525 ) ) ( not ( = ?auto_904514 ?auto_904526 ) ) ( not ( = ?auto_904515 ?auto_904516 ) ) ( not ( = ?auto_904515 ?auto_904517 ) ) ( not ( = ?auto_904515 ?auto_904518 ) ) ( not ( = ?auto_904515 ?auto_904519 ) ) ( not ( = ?auto_904515 ?auto_904520 ) ) ( not ( = ?auto_904515 ?auto_904521 ) ) ( not ( = ?auto_904515 ?auto_904522 ) ) ( not ( = ?auto_904515 ?auto_904523 ) ) ( not ( = ?auto_904515 ?auto_904524 ) ) ( not ( = ?auto_904515 ?auto_904525 ) ) ( not ( = ?auto_904515 ?auto_904526 ) ) ( not ( = ?auto_904516 ?auto_904517 ) ) ( not ( = ?auto_904516 ?auto_904518 ) ) ( not ( = ?auto_904516 ?auto_904519 ) ) ( not ( = ?auto_904516 ?auto_904520 ) ) ( not ( = ?auto_904516 ?auto_904521 ) ) ( not ( = ?auto_904516 ?auto_904522 ) ) ( not ( = ?auto_904516 ?auto_904523 ) ) ( not ( = ?auto_904516 ?auto_904524 ) ) ( not ( = ?auto_904516 ?auto_904525 ) ) ( not ( = ?auto_904516 ?auto_904526 ) ) ( not ( = ?auto_904517 ?auto_904518 ) ) ( not ( = ?auto_904517 ?auto_904519 ) ) ( not ( = ?auto_904517 ?auto_904520 ) ) ( not ( = ?auto_904517 ?auto_904521 ) ) ( not ( = ?auto_904517 ?auto_904522 ) ) ( not ( = ?auto_904517 ?auto_904523 ) ) ( not ( = ?auto_904517 ?auto_904524 ) ) ( not ( = ?auto_904517 ?auto_904525 ) ) ( not ( = ?auto_904517 ?auto_904526 ) ) ( not ( = ?auto_904518 ?auto_904519 ) ) ( not ( = ?auto_904518 ?auto_904520 ) ) ( not ( = ?auto_904518 ?auto_904521 ) ) ( not ( = ?auto_904518 ?auto_904522 ) ) ( not ( = ?auto_904518 ?auto_904523 ) ) ( not ( = ?auto_904518 ?auto_904524 ) ) ( not ( = ?auto_904518 ?auto_904525 ) ) ( not ( = ?auto_904518 ?auto_904526 ) ) ( not ( = ?auto_904519 ?auto_904520 ) ) ( not ( = ?auto_904519 ?auto_904521 ) ) ( not ( = ?auto_904519 ?auto_904522 ) ) ( not ( = ?auto_904519 ?auto_904523 ) ) ( not ( = ?auto_904519 ?auto_904524 ) ) ( not ( = ?auto_904519 ?auto_904525 ) ) ( not ( = ?auto_904519 ?auto_904526 ) ) ( not ( = ?auto_904520 ?auto_904521 ) ) ( not ( = ?auto_904520 ?auto_904522 ) ) ( not ( = ?auto_904520 ?auto_904523 ) ) ( not ( = ?auto_904520 ?auto_904524 ) ) ( not ( = ?auto_904520 ?auto_904525 ) ) ( not ( = ?auto_904520 ?auto_904526 ) ) ( not ( = ?auto_904521 ?auto_904522 ) ) ( not ( = ?auto_904521 ?auto_904523 ) ) ( not ( = ?auto_904521 ?auto_904524 ) ) ( not ( = ?auto_904521 ?auto_904525 ) ) ( not ( = ?auto_904521 ?auto_904526 ) ) ( not ( = ?auto_904522 ?auto_904523 ) ) ( not ( = ?auto_904522 ?auto_904524 ) ) ( not ( = ?auto_904522 ?auto_904525 ) ) ( not ( = ?auto_904522 ?auto_904526 ) ) ( not ( = ?auto_904523 ?auto_904524 ) ) ( not ( = ?auto_904523 ?auto_904525 ) ) ( not ( = ?auto_904523 ?auto_904526 ) ) ( not ( = ?auto_904524 ?auto_904525 ) ) ( not ( = ?auto_904524 ?auto_904526 ) ) ( not ( = ?auto_904525 ?auto_904526 ) ) ( ON ?auto_904524 ?auto_904525 ) ( ON ?auto_904523 ?auto_904524 ) ( CLEAR ?auto_904521 ) ( ON ?auto_904522 ?auto_904523 ) ( CLEAR ?auto_904522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_904509 ?auto_904510 ?auto_904511 ?auto_904512 ?auto_904513 ?auto_904514 ?auto_904515 ?auto_904516 ?auto_904517 ?auto_904518 ?auto_904519 ?auto_904520 ?auto_904521 ?auto_904522 )
      ( MAKE-17PILE ?auto_904509 ?auto_904510 ?auto_904511 ?auto_904512 ?auto_904513 ?auto_904514 ?auto_904515 ?auto_904516 ?auto_904517 ?auto_904518 ?auto_904519 ?auto_904520 ?auto_904521 ?auto_904522 ?auto_904523 ?auto_904524 ?auto_904525 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_904579 - BLOCK
      ?auto_904580 - BLOCK
      ?auto_904581 - BLOCK
      ?auto_904582 - BLOCK
      ?auto_904583 - BLOCK
      ?auto_904584 - BLOCK
      ?auto_904585 - BLOCK
      ?auto_904586 - BLOCK
      ?auto_904587 - BLOCK
      ?auto_904588 - BLOCK
      ?auto_904589 - BLOCK
      ?auto_904590 - BLOCK
      ?auto_904591 - BLOCK
      ?auto_904592 - BLOCK
      ?auto_904593 - BLOCK
      ?auto_904594 - BLOCK
      ?auto_904595 - BLOCK
    )
    :vars
    (
      ?auto_904596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904595 ?auto_904596 ) ( ON-TABLE ?auto_904579 ) ( ON ?auto_904580 ?auto_904579 ) ( ON ?auto_904581 ?auto_904580 ) ( ON ?auto_904582 ?auto_904581 ) ( ON ?auto_904583 ?auto_904582 ) ( ON ?auto_904584 ?auto_904583 ) ( ON ?auto_904585 ?auto_904584 ) ( ON ?auto_904586 ?auto_904585 ) ( ON ?auto_904587 ?auto_904586 ) ( ON ?auto_904588 ?auto_904587 ) ( ON ?auto_904589 ?auto_904588 ) ( ON ?auto_904590 ?auto_904589 ) ( not ( = ?auto_904579 ?auto_904580 ) ) ( not ( = ?auto_904579 ?auto_904581 ) ) ( not ( = ?auto_904579 ?auto_904582 ) ) ( not ( = ?auto_904579 ?auto_904583 ) ) ( not ( = ?auto_904579 ?auto_904584 ) ) ( not ( = ?auto_904579 ?auto_904585 ) ) ( not ( = ?auto_904579 ?auto_904586 ) ) ( not ( = ?auto_904579 ?auto_904587 ) ) ( not ( = ?auto_904579 ?auto_904588 ) ) ( not ( = ?auto_904579 ?auto_904589 ) ) ( not ( = ?auto_904579 ?auto_904590 ) ) ( not ( = ?auto_904579 ?auto_904591 ) ) ( not ( = ?auto_904579 ?auto_904592 ) ) ( not ( = ?auto_904579 ?auto_904593 ) ) ( not ( = ?auto_904579 ?auto_904594 ) ) ( not ( = ?auto_904579 ?auto_904595 ) ) ( not ( = ?auto_904579 ?auto_904596 ) ) ( not ( = ?auto_904580 ?auto_904581 ) ) ( not ( = ?auto_904580 ?auto_904582 ) ) ( not ( = ?auto_904580 ?auto_904583 ) ) ( not ( = ?auto_904580 ?auto_904584 ) ) ( not ( = ?auto_904580 ?auto_904585 ) ) ( not ( = ?auto_904580 ?auto_904586 ) ) ( not ( = ?auto_904580 ?auto_904587 ) ) ( not ( = ?auto_904580 ?auto_904588 ) ) ( not ( = ?auto_904580 ?auto_904589 ) ) ( not ( = ?auto_904580 ?auto_904590 ) ) ( not ( = ?auto_904580 ?auto_904591 ) ) ( not ( = ?auto_904580 ?auto_904592 ) ) ( not ( = ?auto_904580 ?auto_904593 ) ) ( not ( = ?auto_904580 ?auto_904594 ) ) ( not ( = ?auto_904580 ?auto_904595 ) ) ( not ( = ?auto_904580 ?auto_904596 ) ) ( not ( = ?auto_904581 ?auto_904582 ) ) ( not ( = ?auto_904581 ?auto_904583 ) ) ( not ( = ?auto_904581 ?auto_904584 ) ) ( not ( = ?auto_904581 ?auto_904585 ) ) ( not ( = ?auto_904581 ?auto_904586 ) ) ( not ( = ?auto_904581 ?auto_904587 ) ) ( not ( = ?auto_904581 ?auto_904588 ) ) ( not ( = ?auto_904581 ?auto_904589 ) ) ( not ( = ?auto_904581 ?auto_904590 ) ) ( not ( = ?auto_904581 ?auto_904591 ) ) ( not ( = ?auto_904581 ?auto_904592 ) ) ( not ( = ?auto_904581 ?auto_904593 ) ) ( not ( = ?auto_904581 ?auto_904594 ) ) ( not ( = ?auto_904581 ?auto_904595 ) ) ( not ( = ?auto_904581 ?auto_904596 ) ) ( not ( = ?auto_904582 ?auto_904583 ) ) ( not ( = ?auto_904582 ?auto_904584 ) ) ( not ( = ?auto_904582 ?auto_904585 ) ) ( not ( = ?auto_904582 ?auto_904586 ) ) ( not ( = ?auto_904582 ?auto_904587 ) ) ( not ( = ?auto_904582 ?auto_904588 ) ) ( not ( = ?auto_904582 ?auto_904589 ) ) ( not ( = ?auto_904582 ?auto_904590 ) ) ( not ( = ?auto_904582 ?auto_904591 ) ) ( not ( = ?auto_904582 ?auto_904592 ) ) ( not ( = ?auto_904582 ?auto_904593 ) ) ( not ( = ?auto_904582 ?auto_904594 ) ) ( not ( = ?auto_904582 ?auto_904595 ) ) ( not ( = ?auto_904582 ?auto_904596 ) ) ( not ( = ?auto_904583 ?auto_904584 ) ) ( not ( = ?auto_904583 ?auto_904585 ) ) ( not ( = ?auto_904583 ?auto_904586 ) ) ( not ( = ?auto_904583 ?auto_904587 ) ) ( not ( = ?auto_904583 ?auto_904588 ) ) ( not ( = ?auto_904583 ?auto_904589 ) ) ( not ( = ?auto_904583 ?auto_904590 ) ) ( not ( = ?auto_904583 ?auto_904591 ) ) ( not ( = ?auto_904583 ?auto_904592 ) ) ( not ( = ?auto_904583 ?auto_904593 ) ) ( not ( = ?auto_904583 ?auto_904594 ) ) ( not ( = ?auto_904583 ?auto_904595 ) ) ( not ( = ?auto_904583 ?auto_904596 ) ) ( not ( = ?auto_904584 ?auto_904585 ) ) ( not ( = ?auto_904584 ?auto_904586 ) ) ( not ( = ?auto_904584 ?auto_904587 ) ) ( not ( = ?auto_904584 ?auto_904588 ) ) ( not ( = ?auto_904584 ?auto_904589 ) ) ( not ( = ?auto_904584 ?auto_904590 ) ) ( not ( = ?auto_904584 ?auto_904591 ) ) ( not ( = ?auto_904584 ?auto_904592 ) ) ( not ( = ?auto_904584 ?auto_904593 ) ) ( not ( = ?auto_904584 ?auto_904594 ) ) ( not ( = ?auto_904584 ?auto_904595 ) ) ( not ( = ?auto_904584 ?auto_904596 ) ) ( not ( = ?auto_904585 ?auto_904586 ) ) ( not ( = ?auto_904585 ?auto_904587 ) ) ( not ( = ?auto_904585 ?auto_904588 ) ) ( not ( = ?auto_904585 ?auto_904589 ) ) ( not ( = ?auto_904585 ?auto_904590 ) ) ( not ( = ?auto_904585 ?auto_904591 ) ) ( not ( = ?auto_904585 ?auto_904592 ) ) ( not ( = ?auto_904585 ?auto_904593 ) ) ( not ( = ?auto_904585 ?auto_904594 ) ) ( not ( = ?auto_904585 ?auto_904595 ) ) ( not ( = ?auto_904585 ?auto_904596 ) ) ( not ( = ?auto_904586 ?auto_904587 ) ) ( not ( = ?auto_904586 ?auto_904588 ) ) ( not ( = ?auto_904586 ?auto_904589 ) ) ( not ( = ?auto_904586 ?auto_904590 ) ) ( not ( = ?auto_904586 ?auto_904591 ) ) ( not ( = ?auto_904586 ?auto_904592 ) ) ( not ( = ?auto_904586 ?auto_904593 ) ) ( not ( = ?auto_904586 ?auto_904594 ) ) ( not ( = ?auto_904586 ?auto_904595 ) ) ( not ( = ?auto_904586 ?auto_904596 ) ) ( not ( = ?auto_904587 ?auto_904588 ) ) ( not ( = ?auto_904587 ?auto_904589 ) ) ( not ( = ?auto_904587 ?auto_904590 ) ) ( not ( = ?auto_904587 ?auto_904591 ) ) ( not ( = ?auto_904587 ?auto_904592 ) ) ( not ( = ?auto_904587 ?auto_904593 ) ) ( not ( = ?auto_904587 ?auto_904594 ) ) ( not ( = ?auto_904587 ?auto_904595 ) ) ( not ( = ?auto_904587 ?auto_904596 ) ) ( not ( = ?auto_904588 ?auto_904589 ) ) ( not ( = ?auto_904588 ?auto_904590 ) ) ( not ( = ?auto_904588 ?auto_904591 ) ) ( not ( = ?auto_904588 ?auto_904592 ) ) ( not ( = ?auto_904588 ?auto_904593 ) ) ( not ( = ?auto_904588 ?auto_904594 ) ) ( not ( = ?auto_904588 ?auto_904595 ) ) ( not ( = ?auto_904588 ?auto_904596 ) ) ( not ( = ?auto_904589 ?auto_904590 ) ) ( not ( = ?auto_904589 ?auto_904591 ) ) ( not ( = ?auto_904589 ?auto_904592 ) ) ( not ( = ?auto_904589 ?auto_904593 ) ) ( not ( = ?auto_904589 ?auto_904594 ) ) ( not ( = ?auto_904589 ?auto_904595 ) ) ( not ( = ?auto_904589 ?auto_904596 ) ) ( not ( = ?auto_904590 ?auto_904591 ) ) ( not ( = ?auto_904590 ?auto_904592 ) ) ( not ( = ?auto_904590 ?auto_904593 ) ) ( not ( = ?auto_904590 ?auto_904594 ) ) ( not ( = ?auto_904590 ?auto_904595 ) ) ( not ( = ?auto_904590 ?auto_904596 ) ) ( not ( = ?auto_904591 ?auto_904592 ) ) ( not ( = ?auto_904591 ?auto_904593 ) ) ( not ( = ?auto_904591 ?auto_904594 ) ) ( not ( = ?auto_904591 ?auto_904595 ) ) ( not ( = ?auto_904591 ?auto_904596 ) ) ( not ( = ?auto_904592 ?auto_904593 ) ) ( not ( = ?auto_904592 ?auto_904594 ) ) ( not ( = ?auto_904592 ?auto_904595 ) ) ( not ( = ?auto_904592 ?auto_904596 ) ) ( not ( = ?auto_904593 ?auto_904594 ) ) ( not ( = ?auto_904593 ?auto_904595 ) ) ( not ( = ?auto_904593 ?auto_904596 ) ) ( not ( = ?auto_904594 ?auto_904595 ) ) ( not ( = ?auto_904594 ?auto_904596 ) ) ( not ( = ?auto_904595 ?auto_904596 ) ) ( ON ?auto_904594 ?auto_904595 ) ( ON ?auto_904593 ?auto_904594 ) ( ON ?auto_904592 ?auto_904593 ) ( CLEAR ?auto_904590 ) ( ON ?auto_904591 ?auto_904592 ) ( CLEAR ?auto_904591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_904579 ?auto_904580 ?auto_904581 ?auto_904582 ?auto_904583 ?auto_904584 ?auto_904585 ?auto_904586 ?auto_904587 ?auto_904588 ?auto_904589 ?auto_904590 ?auto_904591 )
      ( MAKE-17PILE ?auto_904579 ?auto_904580 ?auto_904581 ?auto_904582 ?auto_904583 ?auto_904584 ?auto_904585 ?auto_904586 ?auto_904587 ?auto_904588 ?auto_904589 ?auto_904590 ?auto_904591 ?auto_904592 ?auto_904593 ?auto_904594 ?auto_904595 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_904649 - BLOCK
      ?auto_904650 - BLOCK
      ?auto_904651 - BLOCK
      ?auto_904652 - BLOCK
      ?auto_904653 - BLOCK
      ?auto_904654 - BLOCK
      ?auto_904655 - BLOCK
      ?auto_904656 - BLOCK
      ?auto_904657 - BLOCK
      ?auto_904658 - BLOCK
      ?auto_904659 - BLOCK
      ?auto_904660 - BLOCK
      ?auto_904661 - BLOCK
      ?auto_904662 - BLOCK
      ?auto_904663 - BLOCK
      ?auto_904664 - BLOCK
      ?auto_904665 - BLOCK
    )
    :vars
    (
      ?auto_904666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904665 ?auto_904666 ) ( ON-TABLE ?auto_904649 ) ( ON ?auto_904650 ?auto_904649 ) ( ON ?auto_904651 ?auto_904650 ) ( ON ?auto_904652 ?auto_904651 ) ( ON ?auto_904653 ?auto_904652 ) ( ON ?auto_904654 ?auto_904653 ) ( ON ?auto_904655 ?auto_904654 ) ( ON ?auto_904656 ?auto_904655 ) ( ON ?auto_904657 ?auto_904656 ) ( ON ?auto_904658 ?auto_904657 ) ( ON ?auto_904659 ?auto_904658 ) ( not ( = ?auto_904649 ?auto_904650 ) ) ( not ( = ?auto_904649 ?auto_904651 ) ) ( not ( = ?auto_904649 ?auto_904652 ) ) ( not ( = ?auto_904649 ?auto_904653 ) ) ( not ( = ?auto_904649 ?auto_904654 ) ) ( not ( = ?auto_904649 ?auto_904655 ) ) ( not ( = ?auto_904649 ?auto_904656 ) ) ( not ( = ?auto_904649 ?auto_904657 ) ) ( not ( = ?auto_904649 ?auto_904658 ) ) ( not ( = ?auto_904649 ?auto_904659 ) ) ( not ( = ?auto_904649 ?auto_904660 ) ) ( not ( = ?auto_904649 ?auto_904661 ) ) ( not ( = ?auto_904649 ?auto_904662 ) ) ( not ( = ?auto_904649 ?auto_904663 ) ) ( not ( = ?auto_904649 ?auto_904664 ) ) ( not ( = ?auto_904649 ?auto_904665 ) ) ( not ( = ?auto_904649 ?auto_904666 ) ) ( not ( = ?auto_904650 ?auto_904651 ) ) ( not ( = ?auto_904650 ?auto_904652 ) ) ( not ( = ?auto_904650 ?auto_904653 ) ) ( not ( = ?auto_904650 ?auto_904654 ) ) ( not ( = ?auto_904650 ?auto_904655 ) ) ( not ( = ?auto_904650 ?auto_904656 ) ) ( not ( = ?auto_904650 ?auto_904657 ) ) ( not ( = ?auto_904650 ?auto_904658 ) ) ( not ( = ?auto_904650 ?auto_904659 ) ) ( not ( = ?auto_904650 ?auto_904660 ) ) ( not ( = ?auto_904650 ?auto_904661 ) ) ( not ( = ?auto_904650 ?auto_904662 ) ) ( not ( = ?auto_904650 ?auto_904663 ) ) ( not ( = ?auto_904650 ?auto_904664 ) ) ( not ( = ?auto_904650 ?auto_904665 ) ) ( not ( = ?auto_904650 ?auto_904666 ) ) ( not ( = ?auto_904651 ?auto_904652 ) ) ( not ( = ?auto_904651 ?auto_904653 ) ) ( not ( = ?auto_904651 ?auto_904654 ) ) ( not ( = ?auto_904651 ?auto_904655 ) ) ( not ( = ?auto_904651 ?auto_904656 ) ) ( not ( = ?auto_904651 ?auto_904657 ) ) ( not ( = ?auto_904651 ?auto_904658 ) ) ( not ( = ?auto_904651 ?auto_904659 ) ) ( not ( = ?auto_904651 ?auto_904660 ) ) ( not ( = ?auto_904651 ?auto_904661 ) ) ( not ( = ?auto_904651 ?auto_904662 ) ) ( not ( = ?auto_904651 ?auto_904663 ) ) ( not ( = ?auto_904651 ?auto_904664 ) ) ( not ( = ?auto_904651 ?auto_904665 ) ) ( not ( = ?auto_904651 ?auto_904666 ) ) ( not ( = ?auto_904652 ?auto_904653 ) ) ( not ( = ?auto_904652 ?auto_904654 ) ) ( not ( = ?auto_904652 ?auto_904655 ) ) ( not ( = ?auto_904652 ?auto_904656 ) ) ( not ( = ?auto_904652 ?auto_904657 ) ) ( not ( = ?auto_904652 ?auto_904658 ) ) ( not ( = ?auto_904652 ?auto_904659 ) ) ( not ( = ?auto_904652 ?auto_904660 ) ) ( not ( = ?auto_904652 ?auto_904661 ) ) ( not ( = ?auto_904652 ?auto_904662 ) ) ( not ( = ?auto_904652 ?auto_904663 ) ) ( not ( = ?auto_904652 ?auto_904664 ) ) ( not ( = ?auto_904652 ?auto_904665 ) ) ( not ( = ?auto_904652 ?auto_904666 ) ) ( not ( = ?auto_904653 ?auto_904654 ) ) ( not ( = ?auto_904653 ?auto_904655 ) ) ( not ( = ?auto_904653 ?auto_904656 ) ) ( not ( = ?auto_904653 ?auto_904657 ) ) ( not ( = ?auto_904653 ?auto_904658 ) ) ( not ( = ?auto_904653 ?auto_904659 ) ) ( not ( = ?auto_904653 ?auto_904660 ) ) ( not ( = ?auto_904653 ?auto_904661 ) ) ( not ( = ?auto_904653 ?auto_904662 ) ) ( not ( = ?auto_904653 ?auto_904663 ) ) ( not ( = ?auto_904653 ?auto_904664 ) ) ( not ( = ?auto_904653 ?auto_904665 ) ) ( not ( = ?auto_904653 ?auto_904666 ) ) ( not ( = ?auto_904654 ?auto_904655 ) ) ( not ( = ?auto_904654 ?auto_904656 ) ) ( not ( = ?auto_904654 ?auto_904657 ) ) ( not ( = ?auto_904654 ?auto_904658 ) ) ( not ( = ?auto_904654 ?auto_904659 ) ) ( not ( = ?auto_904654 ?auto_904660 ) ) ( not ( = ?auto_904654 ?auto_904661 ) ) ( not ( = ?auto_904654 ?auto_904662 ) ) ( not ( = ?auto_904654 ?auto_904663 ) ) ( not ( = ?auto_904654 ?auto_904664 ) ) ( not ( = ?auto_904654 ?auto_904665 ) ) ( not ( = ?auto_904654 ?auto_904666 ) ) ( not ( = ?auto_904655 ?auto_904656 ) ) ( not ( = ?auto_904655 ?auto_904657 ) ) ( not ( = ?auto_904655 ?auto_904658 ) ) ( not ( = ?auto_904655 ?auto_904659 ) ) ( not ( = ?auto_904655 ?auto_904660 ) ) ( not ( = ?auto_904655 ?auto_904661 ) ) ( not ( = ?auto_904655 ?auto_904662 ) ) ( not ( = ?auto_904655 ?auto_904663 ) ) ( not ( = ?auto_904655 ?auto_904664 ) ) ( not ( = ?auto_904655 ?auto_904665 ) ) ( not ( = ?auto_904655 ?auto_904666 ) ) ( not ( = ?auto_904656 ?auto_904657 ) ) ( not ( = ?auto_904656 ?auto_904658 ) ) ( not ( = ?auto_904656 ?auto_904659 ) ) ( not ( = ?auto_904656 ?auto_904660 ) ) ( not ( = ?auto_904656 ?auto_904661 ) ) ( not ( = ?auto_904656 ?auto_904662 ) ) ( not ( = ?auto_904656 ?auto_904663 ) ) ( not ( = ?auto_904656 ?auto_904664 ) ) ( not ( = ?auto_904656 ?auto_904665 ) ) ( not ( = ?auto_904656 ?auto_904666 ) ) ( not ( = ?auto_904657 ?auto_904658 ) ) ( not ( = ?auto_904657 ?auto_904659 ) ) ( not ( = ?auto_904657 ?auto_904660 ) ) ( not ( = ?auto_904657 ?auto_904661 ) ) ( not ( = ?auto_904657 ?auto_904662 ) ) ( not ( = ?auto_904657 ?auto_904663 ) ) ( not ( = ?auto_904657 ?auto_904664 ) ) ( not ( = ?auto_904657 ?auto_904665 ) ) ( not ( = ?auto_904657 ?auto_904666 ) ) ( not ( = ?auto_904658 ?auto_904659 ) ) ( not ( = ?auto_904658 ?auto_904660 ) ) ( not ( = ?auto_904658 ?auto_904661 ) ) ( not ( = ?auto_904658 ?auto_904662 ) ) ( not ( = ?auto_904658 ?auto_904663 ) ) ( not ( = ?auto_904658 ?auto_904664 ) ) ( not ( = ?auto_904658 ?auto_904665 ) ) ( not ( = ?auto_904658 ?auto_904666 ) ) ( not ( = ?auto_904659 ?auto_904660 ) ) ( not ( = ?auto_904659 ?auto_904661 ) ) ( not ( = ?auto_904659 ?auto_904662 ) ) ( not ( = ?auto_904659 ?auto_904663 ) ) ( not ( = ?auto_904659 ?auto_904664 ) ) ( not ( = ?auto_904659 ?auto_904665 ) ) ( not ( = ?auto_904659 ?auto_904666 ) ) ( not ( = ?auto_904660 ?auto_904661 ) ) ( not ( = ?auto_904660 ?auto_904662 ) ) ( not ( = ?auto_904660 ?auto_904663 ) ) ( not ( = ?auto_904660 ?auto_904664 ) ) ( not ( = ?auto_904660 ?auto_904665 ) ) ( not ( = ?auto_904660 ?auto_904666 ) ) ( not ( = ?auto_904661 ?auto_904662 ) ) ( not ( = ?auto_904661 ?auto_904663 ) ) ( not ( = ?auto_904661 ?auto_904664 ) ) ( not ( = ?auto_904661 ?auto_904665 ) ) ( not ( = ?auto_904661 ?auto_904666 ) ) ( not ( = ?auto_904662 ?auto_904663 ) ) ( not ( = ?auto_904662 ?auto_904664 ) ) ( not ( = ?auto_904662 ?auto_904665 ) ) ( not ( = ?auto_904662 ?auto_904666 ) ) ( not ( = ?auto_904663 ?auto_904664 ) ) ( not ( = ?auto_904663 ?auto_904665 ) ) ( not ( = ?auto_904663 ?auto_904666 ) ) ( not ( = ?auto_904664 ?auto_904665 ) ) ( not ( = ?auto_904664 ?auto_904666 ) ) ( not ( = ?auto_904665 ?auto_904666 ) ) ( ON ?auto_904664 ?auto_904665 ) ( ON ?auto_904663 ?auto_904664 ) ( ON ?auto_904662 ?auto_904663 ) ( ON ?auto_904661 ?auto_904662 ) ( CLEAR ?auto_904659 ) ( ON ?auto_904660 ?auto_904661 ) ( CLEAR ?auto_904660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_904649 ?auto_904650 ?auto_904651 ?auto_904652 ?auto_904653 ?auto_904654 ?auto_904655 ?auto_904656 ?auto_904657 ?auto_904658 ?auto_904659 ?auto_904660 )
      ( MAKE-17PILE ?auto_904649 ?auto_904650 ?auto_904651 ?auto_904652 ?auto_904653 ?auto_904654 ?auto_904655 ?auto_904656 ?auto_904657 ?auto_904658 ?auto_904659 ?auto_904660 ?auto_904661 ?auto_904662 ?auto_904663 ?auto_904664 ?auto_904665 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_904719 - BLOCK
      ?auto_904720 - BLOCK
      ?auto_904721 - BLOCK
      ?auto_904722 - BLOCK
      ?auto_904723 - BLOCK
      ?auto_904724 - BLOCK
      ?auto_904725 - BLOCK
      ?auto_904726 - BLOCK
      ?auto_904727 - BLOCK
      ?auto_904728 - BLOCK
      ?auto_904729 - BLOCK
      ?auto_904730 - BLOCK
      ?auto_904731 - BLOCK
      ?auto_904732 - BLOCK
      ?auto_904733 - BLOCK
      ?auto_904734 - BLOCK
      ?auto_904735 - BLOCK
    )
    :vars
    (
      ?auto_904736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904735 ?auto_904736 ) ( ON-TABLE ?auto_904719 ) ( ON ?auto_904720 ?auto_904719 ) ( ON ?auto_904721 ?auto_904720 ) ( ON ?auto_904722 ?auto_904721 ) ( ON ?auto_904723 ?auto_904722 ) ( ON ?auto_904724 ?auto_904723 ) ( ON ?auto_904725 ?auto_904724 ) ( ON ?auto_904726 ?auto_904725 ) ( ON ?auto_904727 ?auto_904726 ) ( ON ?auto_904728 ?auto_904727 ) ( not ( = ?auto_904719 ?auto_904720 ) ) ( not ( = ?auto_904719 ?auto_904721 ) ) ( not ( = ?auto_904719 ?auto_904722 ) ) ( not ( = ?auto_904719 ?auto_904723 ) ) ( not ( = ?auto_904719 ?auto_904724 ) ) ( not ( = ?auto_904719 ?auto_904725 ) ) ( not ( = ?auto_904719 ?auto_904726 ) ) ( not ( = ?auto_904719 ?auto_904727 ) ) ( not ( = ?auto_904719 ?auto_904728 ) ) ( not ( = ?auto_904719 ?auto_904729 ) ) ( not ( = ?auto_904719 ?auto_904730 ) ) ( not ( = ?auto_904719 ?auto_904731 ) ) ( not ( = ?auto_904719 ?auto_904732 ) ) ( not ( = ?auto_904719 ?auto_904733 ) ) ( not ( = ?auto_904719 ?auto_904734 ) ) ( not ( = ?auto_904719 ?auto_904735 ) ) ( not ( = ?auto_904719 ?auto_904736 ) ) ( not ( = ?auto_904720 ?auto_904721 ) ) ( not ( = ?auto_904720 ?auto_904722 ) ) ( not ( = ?auto_904720 ?auto_904723 ) ) ( not ( = ?auto_904720 ?auto_904724 ) ) ( not ( = ?auto_904720 ?auto_904725 ) ) ( not ( = ?auto_904720 ?auto_904726 ) ) ( not ( = ?auto_904720 ?auto_904727 ) ) ( not ( = ?auto_904720 ?auto_904728 ) ) ( not ( = ?auto_904720 ?auto_904729 ) ) ( not ( = ?auto_904720 ?auto_904730 ) ) ( not ( = ?auto_904720 ?auto_904731 ) ) ( not ( = ?auto_904720 ?auto_904732 ) ) ( not ( = ?auto_904720 ?auto_904733 ) ) ( not ( = ?auto_904720 ?auto_904734 ) ) ( not ( = ?auto_904720 ?auto_904735 ) ) ( not ( = ?auto_904720 ?auto_904736 ) ) ( not ( = ?auto_904721 ?auto_904722 ) ) ( not ( = ?auto_904721 ?auto_904723 ) ) ( not ( = ?auto_904721 ?auto_904724 ) ) ( not ( = ?auto_904721 ?auto_904725 ) ) ( not ( = ?auto_904721 ?auto_904726 ) ) ( not ( = ?auto_904721 ?auto_904727 ) ) ( not ( = ?auto_904721 ?auto_904728 ) ) ( not ( = ?auto_904721 ?auto_904729 ) ) ( not ( = ?auto_904721 ?auto_904730 ) ) ( not ( = ?auto_904721 ?auto_904731 ) ) ( not ( = ?auto_904721 ?auto_904732 ) ) ( not ( = ?auto_904721 ?auto_904733 ) ) ( not ( = ?auto_904721 ?auto_904734 ) ) ( not ( = ?auto_904721 ?auto_904735 ) ) ( not ( = ?auto_904721 ?auto_904736 ) ) ( not ( = ?auto_904722 ?auto_904723 ) ) ( not ( = ?auto_904722 ?auto_904724 ) ) ( not ( = ?auto_904722 ?auto_904725 ) ) ( not ( = ?auto_904722 ?auto_904726 ) ) ( not ( = ?auto_904722 ?auto_904727 ) ) ( not ( = ?auto_904722 ?auto_904728 ) ) ( not ( = ?auto_904722 ?auto_904729 ) ) ( not ( = ?auto_904722 ?auto_904730 ) ) ( not ( = ?auto_904722 ?auto_904731 ) ) ( not ( = ?auto_904722 ?auto_904732 ) ) ( not ( = ?auto_904722 ?auto_904733 ) ) ( not ( = ?auto_904722 ?auto_904734 ) ) ( not ( = ?auto_904722 ?auto_904735 ) ) ( not ( = ?auto_904722 ?auto_904736 ) ) ( not ( = ?auto_904723 ?auto_904724 ) ) ( not ( = ?auto_904723 ?auto_904725 ) ) ( not ( = ?auto_904723 ?auto_904726 ) ) ( not ( = ?auto_904723 ?auto_904727 ) ) ( not ( = ?auto_904723 ?auto_904728 ) ) ( not ( = ?auto_904723 ?auto_904729 ) ) ( not ( = ?auto_904723 ?auto_904730 ) ) ( not ( = ?auto_904723 ?auto_904731 ) ) ( not ( = ?auto_904723 ?auto_904732 ) ) ( not ( = ?auto_904723 ?auto_904733 ) ) ( not ( = ?auto_904723 ?auto_904734 ) ) ( not ( = ?auto_904723 ?auto_904735 ) ) ( not ( = ?auto_904723 ?auto_904736 ) ) ( not ( = ?auto_904724 ?auto_904725 ) ) ( not ( = ?auto_904724 ?auto_904726 ) ) ( not ( = ?auto_904724 ?auto_904727 ) ) ( not ( = ?auto_904724 ?auto_904728 ) ) ( not ( = ?auto_904724 ?auto_904729 ) ) ( not ( = ?auto_904724 ?auto_904730 ) ) ( not ( = ?auto_904724 ?auto_904731 ) ) ( not ( = ?auto_904724 ?auto_904732 ) ) ( not ( = ?auto_904724 ?auto_904733 ) ) ( not ( = ?auto_904724 ?auto_904734 ) ) ( not ( = ?auto_904724 ?auto_904735 ) ) ( not ( = ?auto_904724 ?auto_904736 ) ) ( not ( = ?auto_904725 ?auto_904726 ) ) ( not ( = ?auto_904725 ?auto_904727 ) ) ( not ( = ?auto_904725 ?auto_904728 ) ) ( not ( = ?auto_904725 ?auto_904729 ) ) ( not ( = ?auto_904725 ?auto_904730 ) ) ( not ( = ?auto_904725 ?auto_904731 ) ) ( not ( = ?auto_904725 ?auto_904732 ) ) ( not ( = ?auto_904725 ?auto_904733 ) ) ( not ( = ?auto_904725 ?auto_904734 ) ) ( not ( = ?auto_904725 ?auto_904735 ) ) ( not ( = ?auto_904725 ?auto_904736 ) ) ( not ( = ?auto_904726 ?auto_904727 ) ) ( not ( = ?auto_904726 ?auto_904728 ) ) ( not ( = ?auto_904726 ?auto_904729 ) ) ( not ( = ?auto_904726 ?auto_904730 ) ) ( not ( = ?auto_904726 ?auto_904731 ) ) ( not ( = ?auto_904726 ?auto_904732 ) ) ( not ( = ?auto_904726 ?auto_904733 ) ) ( not ( = ?auto_904726 ?auto_904734 ) ) ( not ( = ?auto_904726 ?auto_904735 ) ) ( not ( = ?auto_904726 ?auto_904736 ) ) ( not ( = ?auto_904727 ?auto_904728 ) ) ( not ( = ?auto_904727 ?auto_904729 ) ) ( not ( = ?auto_904727 ?auto_904730 ) ) ( not ( = ?auto_904727 ?auto_904731 ) ) ( not ( = ?auto_904727 ?auto_904732 ) ) ( not ( = ?auto_904727 ?auto_904733 ) ) ( not ( = ?auto_904727 ?auto_904734 ) ) ( not ( = ?auto_904727 ?auto_904735 ) ) ( not ( = ?auto_904727 ?auto_904736 ) ) ( not ( = ?auto_904728 ?auto_904729 ) ) ( not ( = ?auto_904728 ?auto_904730 ) ) ( not ( = ?auto_904728 ?auto_904731 ) ) ( not ( = ?auto_904728 ?auto_904732 ) ) ( not ( = ?auto_904728 ?auto_904733 ) ) ( not ( = ?auto_904728 ?auto_904734 ) ) ( not ( = ?auto_904728 ?auto_904735 ) ) ( not ( = ?auto_904728 ?auto_904736 ) ) ( not ( = ?auto_904729 ?auto_904730 ) ) ( not ( = ?auto_904729 ?auto_904731 ) ) ( not ( = ?auto_904729 ?auto_904732 ) ) ( not ( = ?auto_904729 ?auto_904733 ) ) ( not ( = ?auto_904729 ?auto_904734 ) ) ( not ( = ?auto_904729 ?auto_904735 ) ) ( not ( = ?auto_904729 ?auto_904736 ) ) ( not ( = ?auto_904730 ?auto_904731 ) ) ( not ( = ?auto_904730 ?auto_904732 ) ) ( not ( = ?auto_904730 ?auto_904733 ) ) ( not ( = ?auto_904730 ?auto_904734 ) ) ( not ( = ?auto_904730 ?auto_904735 ) ) ( not ( = ?auto_904730 ?auto_904736 ) ) ( not ( = ?auto_904731 ?auto_904732 ) ) ( not ( = ?auto_904731 ?auto_904733 ) ) ( not ( = ?auto_904731 ?auto_904734 ) ) ( not ( = ?auto_904731 ?auto_904735 ) ) ( not ( = ?auto_904731 ?auto_904736 ) ) ( not ( = ?auto_904732 ?auto_904733 ) ) ( not ( = ?auto_904732 ?auto_904734 ) ) ( not ( = ?auto_904732 ?auto_904735 ) ) ( not ( = ?auto_904732 ?auto_904736 ) ) ( not ( = ?auto_904733 ?auto_904734 ) ) ( not ( = ?auto_904733 ?auto_904735 ) ) ( not ( = ?auto_904733 ?auto_904736 ) ) ( not ( = ?auto_904734 ?auto_904735 ) ) ( not ( = ?auto_904734 ?auto_904736 ) ) ( not ( = ?auto_904735 ?auto_904736 ) ) ( ON ?auto_904734 ?auto_904735 ) ( ON ?auto_904733 ?auto_904734 ) ( ON ?auto_904732 ?auto_904733 ) ( ON ?auto_904731 ?auto_904732 ) ( ON ?auto_904730 ?auto_904731 ) ( CLEAR ?auto_904728 ) ( ON ?auto_904729 ?auto_904730 ) ( CLEAR ?auto_904729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_904719 ?auto_904720 ?auto_904721 ?auto_904722 ?auto_904723 ?auto_904724 ?auto_904725 ?auto_904726 ?auto_904727 ?auto_904728 ?auto_904729 )
      ( MAKE-17PILE ?auto_904719 ?auto_904720 ?auto_904721 ?auto_904722 ?auto_904723 ?auto_904724 ?auto_904725 ?auto_904726 ?auto_904727 ?auto_904728 ?auto_904729 ?auto_904730 ?auto_904731 ?auto_904732 ?auto_904733 ?auto_904734 ?auto_904735 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_904789 - BLOCK
      ?auto_904790 - BLOCK
      ?auto_904791 - BLOCK
      ?auto_904792 - BLOCK
      ?auto_904793 - BLOCK
      ?auto_904794 - BLOCK
      ?auto_904795 - BLOCK
      ?auto_904796 - BLOCK
      ?auto_904797 - BLOCK
      ?auto_904798 - BLOCK
      ?auto_904799 - BLOCK
      ?auto_904800 - BLOCK
      ?auto_904801 - BLOCK
      ?auto_904802 - BLOCK
      ?auto_904803 - BLOCK
      ?auto_904804 - BLOCK
      ?auto_904805 - BLOCK
    )
    :vars
    (
      ?auto_904806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904805 ?auto_904806 ) ( ON-TABLE ?auto_904789 ) ( ON ?auto_904790 ?auto_904789 ) ( ON ?auto_904791 ?auto_904790 ) ( ON ?auto_904792 ?auto_904791 ) ( ON ?auto_904793 ?auto_904792 ) ( ON ?auto_904794 ?auto_904793 ) ( ON ?auto_904795 ?auto_904794 ) ( ON ?auto_904796 ?auto_904795 ) ( ON ?auto_904797 ?auto_904796 ) ( not ( = ?auto_904789 ?auto_904790 ) ) ( not ( = ?auto_904789 ?auto_904791 ) ) ( not ( = ?auto_904789 ?auto_904792 ) ) ( not ( = ?auto_904789 ?auto_904793 ) ) ( not ( = ?auto_904789 ?auto_904794 ) ) ( not ( = ?auto_904789 ?auto_904795 ) ) ( not ( = ?auto_904789 ?auto_904796 ) ) ( not ( = ?auto_904789 ?auto_904797 ) ) ( not ( = ?auto_904789 ?auto_904798 ) ) ( not ( = ?auto_904789 ?auto_904799 ) ) ( not ( = ?auto_904789 ?auto_904800 ) ) ( not ( = ?auto_904789 ?auto_904801 ) ) ( not ( = ?auto_904789 ?auto_904802 ) ) ( not ( = ?auto_904789 ?auto_904803 ) ) ( not ( = ?auto_904789 ?auto_904804 ) ) ( not ( = ?auto_904789 ?auto_904805 ) ) ( not ( = ?auto_904789 ?auto_904806 ) ) ( not ( = ?auto_904790 ?auto_904791 ) ) ( not ( = ?auto_904790 ?auto_904792 ) ) ( not ( = ?auto_904790 ?auto_904793 ) ) ( not ( = ?auto_904790 ?auto_904794 ) ) ( not ( = ?auto_904790 ?auto_904795 ) ) ( not ( = ?auto_904790 ?auto_904796 ) ) ( not ( = ?auto_904790 ?auto_904797 ) ) ( not ( = ?auto_904790 ?auto_904798 ) ) ( not ( = ?auto_904790 ?auto_904799 ) ) ( not ( = ?auto_904790 ?auto_904800 ) ) ( not ( = ?auto_904790 ?auto_904801 ) ) ( not ( = ?auto_904790 ?auto_904802 ) ) ( not ( = ?auto_904790 ?auto_904803 ) ) ( not ( = ?auto_904790 ?auto_904804 ) ) ( not ( = ?auto_904790 ?auto_904805 ) ) ( not ( = ?auto_904790 ?auto_904806 ) ) ( not ( = ?auto_904791 ?auto_904792 ) ) ( not ( = ?auto_904791 ?auto_904793 ) ) ( not ( = ?auto_904791 ?auto_904794 ) ) ( not ( = ?auto_904791 ?auto_904795 ) ) ( not ( = ?auto_904791 ?auto_904796 ) ) ( not ( = ?auto_904791 ?auto_904797 ) ) ( not ( = ?auto_904791 ?auto_904798 ) ) ( not ( = ?auto_904791 ?auto_904799 ) ) ( not ( = ?auto_904791 ?auto_904800 ) ) ( not ( = ?auto_904791 ?auto_904801 ) ) ( not ( = ?auto_904791 ?auto_904802 ) ) ( not ( = ?auto_904791 ?auto_904803 ) ) ( not ( = ?auto_904791 ?auto_904804 ) ) ( not ( = ?auto_904791 ?auto_904805 ) ) ( not ( = ?auto_904791 ?auto_904806 ) ) ( not ( = ?auto_904792 ?auto_904793 ) ) ( not ( = ?auto_904792 ?auto_904794 ) ) ( not ( = ?auto_904792 ?auto_904795 ) ) ( not ( = ?auto_904792 ?auto_904796 ) ) ( not ( = ?auto_904792 ?auto_904797 ) ) ( not ( = ?auto_904792 ?auto_904798 ) ) ( not ( = ?auto_904792 ?auto_904799 ) ) ( not ( = ?auto_904792 ?auto_904800 ) ) ( not ( = ?auto_904792 ?auto_904801 ) ) ( not ( = ?auto_904792 ?auto_904802 ) ) ( not ( = ?auto_904792 ?auto_904803 ) ) ( not ( = ?auto_904792 ?auto_904804 ) ) ( not ( = ?auto_904792 ?auto_904805 ) ) ( not ( = ?auto_904792 ?auto_904806 ) ) ( not ( = ?auto_904793 ?auto_904794 ) ) ( not ( = ?auto_904793 ?auto_904795 ) ) ( not ( = ?auto_904793 ?auto_904796 ) ) ( not ( = ?auto_904793 ?auto_904797 ) ) ( not ( = ?auto_904793 ?auto_904798 ) ) ( not ( = ?auto_904793 ?auto_904799 ) ) ( not ( = ?auto_904793 ?auto_904800 ) ) ( not ( = ?auto_904793 ?auto_904801 ) ) ( not ( = ?auto_904793 ?auto_904802 ) ) ( not ( = ?auto_904793 ?auto_904803 ) ) ( not ( = ?auto_904793 ?auto_904804 ) ) ( not ( = ?auto_904793 ?auto_904805 ) ) ( not ( = ?auto_904793 ?auto_904806 ) ) ( not ( = ?auto_904794 ?auto_904795 ) ) ( not ( = ?auto_904794 ?auto_904796 ) ) ( not ( = ?auto_904794 ?auto_904797 ) ) ( not ( = ?auto_904794 ?auto_904798 ) ) ( not ( = ?auto_904794 ?auto_904799 ) ) ( not ( = ?auto_904794 ?auto_904800 ) ) ( not ( = ?auto_904794 ?auto_904801 ) ) ( not ( = ?auto_904794 ?auto_904802 ) ) ( not ( = ?auto_904794 ?auto_904803 ) ) ( not ( = ?auto_904794 ?auto_904804 ) ) ( not ( = ?auto_904794 ?auto_904805 ) ) ( not ( = ?auto_904794 ?auto_904806 ) ) ( not ( = ?auto_904795 ?auto_904796 ) ) ( not ( = ?auto_904795 ?auto_904797 ) ) ( not ( = ?auto_904795 ?auto_904798 ) ) ( not ( = ?auto_904795 ?auto_904799 ) ) ( not ( = ?auto_904795 ?auto_904800 ) ) ( not ( = ?auto_904795 ?auto_904801 ) ) ( not ( = ?auto_904795 ?auto_904802 ) ) ( not ( = ?auto_904795 ?auto_904803 ) ) ( not ( = ?auto_904795 ?auto_904804 ) ) ( not ( = ?auto_904795 ?auto_904805 ) ) ( not ( = ?auto_904795 ?auto_904806 ) ) ( not ( = ?auto_904796 ?auto_904797 ) ) ( not ( = ?auto_904796 ?auto_904798 ) ) ( not ( = ?auto_904796 ?auto_904799 ) ) ( not ( = ?auto_904796 ?auto_904800 ) ) ( not ( = ?auto_904796 ?auto_904801 ) ) ( not ( = ?auto_904796 ?auto_904802 ) ) ( not ( = ?auto_904796 ?auto_904803 ) ) ( not ( = ?auto_904796 ?auto_904804 ) ) ( not ( = ?auto_904796 ?auto_904805 ) ) ( not ( = ?auto_904796 ?auto_904806 ) ) ( not ( = ?auto_904797 ?auto_904798 ) ) ( not ( = ?auto_904797 ?auto_904799 ) ) ( not ( = ?auto_904797 ?auto_904800 ) ) ( not ( = ?auto_904797 ?auto_904801 ) ) ( not ( = ?auto_904797 ?auto_904802 ) ) ( not ( = ?auto_904797 ?auto_904803 ) ) ( not ( = ?auto_904797 ?auto_904804 ) ) ( not ( = ?auto_904797 ?auto_904805 ) ) ( not ( = ?auto_904797 ?auto_904806 ) ) ( not ( = ?auto_904798 ?auto_904799 ) ) ( not ( = ?auto_904798 ?auto_904800 ) ) ( not ( = ?auto_904798 ?auto_904801 ) ) ( not ( = ?auto_904798 ?auto_904802 ) ) ( not ( = ?auto_904798 ?auto_904803 ) ) ( not ( = ?auto_904798 ?auto_904804 ) ) ( not ( = ?auto_904798 ?auto_904805 ) ) ( not ( = ?auto_904798 ?auto_904806 ) ) ( not ( = ?auto_904799 ?auto_904800 ) ) ( not ( = ?auto_904799 ?auto_904801 ) ) ( not ( = ?auto_904799 ?auto_904802 ) ) ( not ( = ?auto_904799 ?auto_904803 ) ) ( not ( = ?auto_904799 ?auto_904804 ) ) ( not ( = ?auto_904799 ?auto_904805 ) ) ( not ( = ?auto_904799 ?auto_904806 ) ) ( not ( = ?auto_904800 ?auto_904801 ) ) ( not ( = ?auto_904800 ?auto_904802 ) ) ( not ( = ?auto_904800 ?auto_904803 ) ) ( not ( = ?auto_904800 ?auto_904804 ) ) ( not ( = ?auto_904800 ?auto_904805 ) ) ( not ( = ?auto_904800 ?auto_904806 ) ) ( not ( = ?auto_904801 ?auto_904802 ) ) ( not ( = ?auto_904801 ?auto_904803 ) ) ( not ( = ?auto_904801 ?auto_904804 ) ) ( not ( = ?auto_904801 ?auto_904805 ) ) ( not ( = ?auto_904801 ?auto_904806 ) ) ( not ( = ?auto_904802 ?auto_904803 ) ) ( not ( = ?auto_904802 ?auto_904804 ) ) ( not ( = ?auto_904802 ?auto_904805 ) ) ( not ( = ?auto_904802 ?auto_904806 ) ) ( not ( = ?auto_904803 ?auto_904804 ) ) ( not ( = ?auto_904803 ?auto_904805 ) ) ( not ( = ?auto_904803 ?auto_904806 ) ) ( not ( = ?auto_904804 ?auto_904805 ) ) ( not ( = ?auto_904804 ?auto_904806 ) ) ( not ( = ?auto_904805 ?auto_904806 ) ) ( ON ?auto_904804 ?auto_904805 ) ( ON ?auto_904803 ?auto_904804 ) ( ON ?auto_904802 ?auto_904803 ) ( ON ?auto_904801 ?auto_904802 ) ( ON ?auto_904800 ?auto_904801 ) ( ON ?auto_904799 ?auto_904800 ) ( CLEAR ?auto_904797 ) ( ON ?auto_904798 ?auto_904799 ) ( CLEAR ?auto_904798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_904789 ?auto_904790 ?auto_904791 ?auto_904792 ?auto_904793 ?auto_904794 ?auto_904795 ?auto_904796 ?auto_904797 ?auto_904798 )
      ( MAKE-17PILE ?auto_904789 ?auto_904790 ?auto_904791 ?auto_904792 ?auto_904793 ?auto_904794 ?auto_904795 ?auto_904796 ?auto_904797 ?auto_904798 ?auto_904799 ?auto_904800 ?auto_904801 ?auto_904802 ?auto_904803 ?auto_904804 ?auto_904805 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_904859 - BLOCK
      ?auto_904860 - BLOCK
      ?auto_904861 - BLOCK
      ?auto_904862 - BLOCK
      ?auto_904863 - BLOCK
      ?auto_904864 - BLOCK
      ?auto_904865 - BLOCK
      ?auto_904866 - BLOCK
      ?auto_904867 - BLOCK
      ?auto_904868 - BLOCK
      ?auto_904869 - BLOCK
      ?auto_904870 - BLOCK
      ?auto_904871 - BLOCK
      ?auto_904872 - BLOCK
      ?auto_904873 - BLOCK
      ?auto_904874 - BLOCK
      ?auto_904875 - BLOCK
    )
    :vars
    (
      ?auto_904876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904875 ?auto_904876 ) ( ON-TABLE ?auto_904859 ) ( ON ?auto_904860 ?auto_904859 ) ( ON ?auto_904861 ?auto_904860 ) ( ON ?auto_904862 ?auto_904861 ) ( ON ?auto_904863 ?auto_904862 ) ( ON ?auto_904864 ?auto_904863 ) ( ON ?auto_904865 ?auto_904864 ) ( ON ?auto_904866 ?auto_904865 ) ( not ( = ?auto_904859 ?auto_904860 ) ) ( not ( = ?auto_904859 ?auto_904861 ) ) ( not ( = ?auto_904859 ?auto_904862 ) ) ( not ( = ?auto_904859 ?auto_904863 ) ) ( not ( = ?auto_904859 ?auto_904864 ) ) ( not ( = ?auto_904859 ?auto_904865 ) ) ( not ( = ?auto_904859 ?auto_904866 ) ) ( not ( = ?auto_904859 ?auto_904867 ) ) ( not ( = ?auto_904859 ?auto_904868 ) ) ( not ( = ?auto_904859 ?auto_904869 ) ) ( not ( = ?auto_904859 ?auto_904870 ) ) ( not ( = ?auto_904859 ?auto_904871 ) ) ( not ( = ?auto_904859 ?auto_904872 ) ) ( not ( = ?auto_904859 ?auto_904873 ) ) ( not ( = ?auto_904859 ?auto_904874 ) ) ( not ( = ?auto_904859 ?auto_904875 ) ) ( not ( = ?auto_904859 ?auto_904876 ) ) ( not ( = ?auto_904860 ?auto_904861 ) ) ( not ( = ?auto_904860 ?auto_904862 ) ) ( not ( = ?auto_904860 ?auto_904863 ) ) ( not ( = ?auto_904860 ?auto_904864 ) ) ( not ( = ?auto_904860 ?auto_904865 ) ) ( not ( = ?auto_904860 ?auto_904866 ) ) ( not ( = ?auto_904860 ?auto_904867 ) ) ( not ( = ?auto_904860 ?auto_904868 ) ) ( not ( = ?auto_904860 ?auto_904869 ) ) ( not ( = ?auto_904860 ?auto_904870 ) ) ( not ( = ?auto_904860 ?auto_904871 ) ) ( not ( = ?auto_904860 ?auto_904872 ) ) ( not ( = ?auto_904860 ?auto_904873 ) ) ( not ( = ?auto_904860 ?auto_904874 ) ) ( not ( = ?auto_904860 ?auto_904875 ) ) ( not ( = ?auto_904860 ?auto_904876 ) ) ( not ( = ?auto_904861 ?auto_904862 ) ) ( not ( = ?auto_904861 ?auto_904863 ) ) ( not ( = ?auto_904861 ?auto_904864 ) ) ( not ( = ?auto_904861 ?auto_904865 ) ) ( not ( = ?auto_904861 ?auto_904866 ) ) ( not ( = ?auto_904861 ?auto_904867 ) ) ( not ( = ?auto_904861 ?auto_904868 ) ) ( not ( = ?auto_904861 ?auto_904869 ) ) ( not ( = ?auto_904861 ?auto_904870 ) ) ( not ( = ?auto_904861 ?auto_904871 ) ) ( not ( = ?auto_904861 ?auto_904872 ) ) ( not ( = ?auto_904861 ?auto_904873 ) ) ( not ( = ?auto_904861 ?auto_904874 ) ) ( not ( = ?auto_904861 ?auto_904875 ) ) ( not ( = ?auto_904861 ?auto_904876 ) ) ( not ( = ?auto_904862 ?auto_904863 ) ) ( not ( = ?auto_904862 ?auto_904864 ) ) ( not ( = ?auto_904862 ?auto_904865 ) ) ( not ( = ?auto_904862 ?auto_904866 ) ) ( not ( = ?auto_904862 ?auto_904867 ) ) ( not ( = ?auto_904862 ?auto_904868 ) ) ( not ( = ?auto_904862 ?auto_904869 ) ) ( not ( = ?auto_904862 ?auto_904870 ) ) ( not ( = ?auto_904862 ?auto_904871 ) ) ( not ( = ?auto_904862 ?auto_904872 ) ) ( not ( = ?auto_904862 ?auto_904873 ) ) ( not ( = ?auto_904862 ?auto_904874 ) ) ( not ( = ?auto_904862 ?auto_904875 ) ) ( not ( = ?auto_904862 ?auto_904876 ) ) ( not ( = ?auto_904863 ?auto_904864 ) ) ( not ( = ?auto_904863 ?auto_904865 ) ) ( not ( = ?auto_904863 ?auto_904866 ) ) ( not ( = ?auto_904863 ?auto_904867 ) ) ( not ( = ?auto_904863 ?auto_904868 ) ) ( not ( = ?auto_904863 ?auto_904869 ) ) ( not ( = ?auto_904863 ?auto_904870 ) ) ( not ( = ?auto_904863 ?auto_904871 ) ) ( not ( = ?auto_904863 ?auto_904872 ) ) ( not ( = ?auto_904863 ?auto_904873 ) ) ( not ( = ?auto_904863 ?auto_904874 ) ) ( not ( = ?auto_904863 ?auto_904875 ) ) ( not ( = ?auto_904863 ?auto_904876 ) ) ( not ( = ?auto_904864 ?auto_904865 ) ) ( not ( = ?auto_904864 ?auto_904866 ) ) ( not ( = ?auto_904864 ?auto_904867 ) ) ( not ( = ?auto_904864 ?auto_904868 ) ) ( not ( = ?auto_904864 ?auto_904869 ) ) ( not ( = ?auto_904864 ?auto_904870 ) ) ( not ( = ?auto_904864 ?auto_904871 ) ) ( not ( = ?auto_904864 ?auto_904872 ) ) ( not ( = ?auto_904864 ?auto_904873 ) ) ( not ( = ?auto_904864 ?auto_904874 ) ) ( not ( = ?auto_904864 ?auto_904875 ) ) ( not ( = ?auto_904864 ?auto_904876 ) ) ( not ( = ?auto_904865 ?auto_904866 ) ) ( not ( = ?auto_904865 ?auto_904867 ) ) ( not ( = ?auto_904865 ?auto_904868 ) ) ( not ( = ?auto_904865 ?auto_904869 ) ) ( not ( = ?auto_904865 ?auto_904870 ) ) ( not ( = ?auto_904865 ?auto_904871 ) ) ( not ( = ?auto_904865 ?auto_904872 ) ) ( not ( = ?auto_904865 ?auto_904873 ) ) ( not ( = ?auto_904865 ?auto_904874 ) ) ( not ( = ?auto_904865 ?auto_904875 ) ) ( not ( = ?auto_904865 ?auto_904876 ) ) ( not ( = ?auto_904866 ?auto_904867 ) ) ( not ( = ?auto_904866 ?auto_904868 ) ) ( not ( = ?auto_904866 ?auto_904869 ) ) ( not ( = ?auto_904866 ?auto_904870 ) ) ( not ( = ?auto_904866 ?auto_904871 ) ) ( not ( = ?auto_904866 ?auto_904872 ) ) ( not ( = ?auto_904866 ?auto_904873 ) ) ( not ( = ?auto_904866 ?auto_904874 ) ) ( not ( = ?auto_904866 ?auto_904875 ) ) ( not ( = ?auto_904866 ?auto_904876 ) ) ( not ( = ?auto_904867 ?auto_904868 ) ) ( not ( = ?auto_904867 ?auto_904869 ) ) ( not ( = ?auto_904867 ?auto_904870 ) ) ( not ( = ?auto_904867 ?auto_904871 ) ) ( not ( = ?auto_904867 ?auto_904872 ) ) ( not ( = ?auto_904867 ?auto_904873 ) ) ( not ( = ?auto_904867 ?auto_904874 ) ) ( not ( = ?auto_904867 ?auto_904875 ) ) ( not ( = ?auto_904867 ?auto_904876 ) ) ( not ( = ?auto_904868 ?auto_904869 ) ) ( not ( = ?auto_904868 ?auto_904870 ) ) ( not ( = ?auto_904868 ?auto_904871 ) ) ( not ( = ?auto_904868 ?auto_904872 ) ) ( not ( = ?auto_904868 ?auto_904873 ) ) ( not ( = ?auto_904868 ?auto_904874 ) ) ( not ( = ?auto_904868 ?auto_904875 ) ) ( not ( = ?auto_904868 ?auto_904876 ) ) ( not ( = ?auto_904869 ?auto_904870 ) ) ( not ( = ?auto_904869 ?auto_904871 ) ) ( not ( = ?auto_904869 ?auto_904872 ) ) ( not ( = ?auto_904869 ?auto_904873 ) ) ( not ( = ?auto_904869 ?auto_904874 ) ) ( not ( = ?auto_904869 ?auto_904875 ) ) ( not ( = ?auto_904869 ?auto_904876 ) ) ( not ( = ?auto_904870 ?auto_904871 ) ) ( not ( = ?auto_904870 ?auto_904872 ) ) ( not ( = ?auto_904870 ?auto_904873 ) ) ( not ( = ?auto_904870 ?auto_904874 ) ) ( not ( = ?auto_904870 ?auto_904875 ) ) ( not ( = ?auto_904870 ?auto_904876 ) ) ( not ( = ?auto_904871 ?auto_904872 ) ) ( not ( = ?auto_904871 ?auto_904873 ) ) ( not ( = ?auto_904871 ?auto_904874 ) ) ( not ( = ?auto_904871 ?auto_904875 ) ) ( not ( = ?auto_904871 ?auto_904876 ) ) ( not ( = ?auto_904872 ?auto_904873 ) ) ( not ( = ?auto_904872 ?auto_904874 ) ) ( not ( = ?auto_904872 ?auto_904875 ) ) ( not ( = ?auto_904872 ?auto_904876 ) ) ( not ( = ?auto_904873 ?auto_904874 ) ) ( not ( = ?auto_904873 ?auto_904875 ) ) ( not ( = ?auto_904873 ?auto_904876 ) ) ( not ( = ?auto_904874 ?auto_904875 ) ) ( not ( = ?auto_904874 ?auto_904876 ) ) ( not ( = ?auto_904875 ?auto_904876 ) ) ( ON ?auto_904874 ?auto_904875 ) ( ON ?auto_904873 ?auto_904874 ) ( ON ?auto_904872 ?auto_904873 ) ( ON ?auto_904871 ?auto_904872 ) ( ON ?auto_904870 ?auto_904871 ) ( ON ?auto_904869 ?auto_904870 ) ( ON ?auto_904868 ?auto_904869 ) ( CLEAR ?auto_904866 ) ( ON ?auto_904867 ?auto_904868 ) ( CLEAR ?auto_904867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_904859 ?auto_904860 ?auto_904861 ?auto_904862 ?auto_904863 ?auto_904864 ?auto_904865 ?auto_904866 ?auto_904867 )
      ( MAKE-17PILE ?auto_904859 ?auto_904860 ?auto_904861 ?auto_904862 ?auto_904863 ?auto_904864 ?auto_904865 ?auto_904866 ?auto_904867 ?auto_904868 ?auto_904869 ?auto_904870 ?auto_904871 ?auto_904872 ?auto_904873 ?auto_904874 ?auto_904875 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_904929 - BLOCK
      ?auto_904930 - BLOCK
      ?auto_904931 - BLOCK
      ?auto_904932 - BLOCK
      ?auto_904933 - BLOCK
      ?auto_904934 - BLOCK
      ?auto_904935 - BLOCK
      ?auto_904936 - BLOCK
      ?auto_904937 - BLOCK
      ?auto_904938 - BLOCK
      ?auto_904939 - BLOCK
      ?auto_904940 - BLOCK
      ?auto_904941 - BLOCK
      ?auto_904942 - BLOCK
      ?auto_904943 - BLOCK
      ?auto_904944 - BLOCK
      ?auto_904945 - BLOCK
    )
    :vars
    (
      ?auto_904946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_904945 ?auto_904946 ) ( ON-TABLE ?auto_904929 ) ( ON ?auto_904930 ?auto_904929 ) ( ON ?auto_904931 ?auto_904930 ) ( ON ?auto_904932 ?auto_904931 ) ( ON ?auto_904933 ?auto_904932 ) ( ON ?auto_904934 ?auto_904933 ) ( ON ?auto_904935 ?auto_904934 ) ( not ( = ?auto_904929 ?auto_904930 ) ) ( not ( = ?auto_904929 ?auto_904931 ) ) ( not ( = ?auto_904929 ?auto_904932 ) ) ( not ( = ?auto_904929 ?auto_904933 ) ) ( not ( = ?auto_904929 ?auto_904934 ) ) ( not ( = ?auto_904929 ?auto_904935 ) ) ( not ( = ?auto_904929 ?auto_904936 ) ) ( not ( = ?auto_904929 ?auto_904937 ) ) ( not ( = ?auto_904929 ?auto_904938 ) ) ( not ( = ?auto_904929 ?auto_904939 ) ) ( not ( = ?auto_904929 ?auto_904940 ) ) ( not ( = ?auto_904929 ?auto_904941 ) ) ( not ( = ?auto_904929 ?auto_904942 ) ) ( not ( = ?auto_904929 ?auto_904943 ) ) ( not ( = ?auto_904929 ?auto_904944 ) ) ( not ( = ?auto_904929 ?auto_904945 ) ) ( not ( = ?auto_904929 ?auto_904946 ) ) ( not ( = ?auto_904930 ?auto_904931 ) ) ( not ( = ?auto_904930 ?auto_904932 ) ) ( not ( = ?auto_904930 ?auto_904933 ) ) ( not ( = ?auto_904930 ?auto_904934 ) ) ( not ( = ?auto_904930 ?auto_904935 ) ) ( not ( = ?auto_904930 ?auto_904936 ) ) ( not ( = ?auto_904930 ?auto_904937 ) ) ( not ( = ?auto_904930 ?auto_904938 ) ) ( not ( = ?auto_904930 ?auto_904939 ) ) ( not ( = ?auto_904930 ?auto_904940 ) ) ( not ( = ?auto_904930 ?auto_904941 ) ) ( not ( = ?auto_904930 ?auto_904942 ) ) ( not ( = ?auto_904930 ?auto_904943 ) ) ( not ( = ?auto_904930 ?auto_904944 ) ) ( not ( = ?auto_904930 ?auto_904945 ) ) ( not ( = ?auto_904930 ?auto_904946 ) ) ( not ( = ?auto_904931 ?auto_904932 ) ) ( not ( = ?auto_904931 ?auto_904933 ) ) ( not ( = ?auto_904931 ?auto_904934 ) ) ( not ( = ?auto_904931 ?auto_904935 ) ) ( not ( = ?auto_904931 ?auto_904936 ) ) ( not ( = ?auto_904931 ?auto_904937 ) ) ( not ( = ?auto_904931 ?auto_904938 ) ) ( not ( = ?auto_904931 ?auto_904939 ) ) ( not ( = ?auto_904931 ?auto_904940 ) ) ( not ( = ?auto_904931 ?auto_904941 ) ) ( not ( = ?auto_904931 ?auto_904942 ) ) ( not ( = ?auto_904931 ?auto_904943 ) ) ( not ( = ?auto_904931 ?auto_904944 ) ) ( not ( = ?auto_904931 ?auto_904945 ) ) ( not ( = ?auto_904931 ?auto_904946 ) ) ( not ( = ?auto_904932 ?auto_904933 ) ) ( not ( = ?auto_904932 ?auto_904934 ) ) ( not ( = ?auto_904932 ?auto_904935 ) ) ( not ( = ?auto_904932 ?auto_904936 ) ) ( not ( = ?auto_904932 ?auto_904937 ) ) ( not ( = ?auto_904932 ?auto_904938 ) ) ( not ( = ?auto_904932 ?auto_904939 ) ) ( not ( = ?auto_904932 ?auto_904940 ) ) ( not ( = ?auto_904932 ?auto_904941 ) ) ( not ( = ?auto_904932 ?auto_904942 ) ) ( not ( = ?auto_904932 ?auto_904943 ) ) ( not ( = ?auto_904932 ?auto_904944 ) ) ( not ( = ?auto_904932 ?auto_904945 ) ) ( not ( = ?auto_904932 ?auto_904946 ) ) ( not ( = ?auto_904933 ?auto_904934 ) ) ( not ( = ?auto_904933 ?auto_904935 ) ) ( not ( = ?auto_904933 ?auto_904936 ) ) ( not ( = ?auto_904933 ?auto_904937 ) ) ( not ( = ?auto_904933 ?auto_904938 ) ) ( not ( = ?auto_904933 ?auto_904939 ) ) ( not ( = ?auto_904933 ?auto_904940 ) ) ( not ( = ?auto_904933 ?auto_904941 ) ) ( not ( = ?auto_904933 ?auto_904942 ) ) ( not ( = ?auto_904933 ?auto_904943 ) ) ( not ( = ?auto_904933 ?auto_904944 ) ) ( not ( = ?auto_904933 ?auto_904945 ) ) ( not ( = ?auto_904933 ?auto_904946 ) ) ( not ( = ?auto_904934 ?auto_904935 ) ) ( not ( = ?auto_904934 ?auto_904936 ) ) ( not ( = ?auto_904934 ?auto_904937 ) ) ( not ( = ?auto_904934 ?auto_904938 ) ) ( not ( = ?auto_904934 ?auto_904939 ) ) ( not ( = ?auto_904934 ?auto_904940 ) ) ( not ( = ?auto_904934 ?auto_904941 ) ) ( not ( = ?auto_904934 ?auto_904942 ) ) ( not ( = ?auto_904934 ?auto_904943 ) ) ( not ( = ?auto_904934 ?auto_904944 ) ) ( not ( = ?auto_904934 ?auto_904945 ) ) ( not ( = ?auto_904934 ?auto_904946 ) ) ( not ( = ?auto_904935 ?auto_904936 ) ) ( not ( = ?auto_904935 ?auto_904937 ) ) ( not ( = ?auto_904935 ?auto_904938 ) ) ( not ( = ?auto_904935 ?auto_904939 ) ) ( not ( = ?auto_904935 ?auto_904940 ) ) ( not ( = ?auto_904935 ?auto_904941 ) ) ( not ( = ?auto_904935 ?auto_904942 ) ) ( not ( = ?auto_904935 ?auto_904943 ) ) ( not ( = ?auto_904935 ?auto_904944 ) ) ( not ( = ?auto_904935 ?auto_904945 ) ) ( not ( = ?auto_904935 ?auto_904946 ) ) ( not ( = ?auto_904936 ?auto_904937 ) ) ( not ( = ?auto_904936 ?auto_904938 ) ) ( not ( = ?auto_904936 ?auto_904939 ) ) ( not ( = ?auto_904936 ?auto_904940 ) ) ( not ( = ?auto_904936 ?auto_904941 ) ) ( not ( = ?auto_904936 ?auto_904942 ) ) ( not ( = ?auto_904936 ?auto_904943 ) ) ( not ( = ?auto_904936 ?auto_904944 ) ) ( not ( = ?auto_904936 ?auto_904945 ) ) ( not ( = ?auto_904936 ?auto_904946 ) ) ( not ( = ?auto_904937 ?auto_904938 ) ) ( not ( = ?auto_904937 ?auto_904939 ) ) ( not ( = ?auto_904937 ?auto_904940 ) ) ( not ( = ?auto_904937 ?auto_904941 ) ) ( not ( = ?auto_904937 ?auto_904942 ) ) ( not ( = ?auto_904937 ?auto_904943 ) ) ( not ( = ?auto_904937 ?auto_904944 ) ) ( not ( = ?auto_904937 ?auto_904945 ) ) ( not ( = ?auto_904937 ?auto_904946 ) ) ( not ( = ?auto_904938 ?auto_904939 ) ) ( not ( = ?auto_904938 ?auto_904940 ) ) ( not ( = ?auto_904938 ?auto_904941 ) ) ( not ( = ?auto_904938 ?auto_904942 ) ) ( not ( = ?auto_904938 ?auto_904943 ) ) ( not ( = ?auto_904938 ?auto_904944 ) ) ( not ( = ?auto_904938 ?auto_904945 ) ) ( not ( = ?auto_904938 ?auto_904946 ) ) ( not ( = ?auto_904939 ?auto_904940 ) ) ( not ( = ?auto_904939 ?auto_904941 ) ) ( not ( = ?auto_904939 ?auto_904942 ) ) ( not ( = ?auto_904939 ?auto_904943 ) ) ( not ( = ?auto_904939 ?auto_904944 ) ) ( not ( = ?auto_904939 ?auto_904945 ) ) ( not ( = ?auto_904939 ?auto_904946 ) ) ( not ( = ?auto_904940 ?auto_904941 ) ) ( not ( = ?auto_904940 ?auto_904942 ) ) ( not ( = ?auto_904940 ?auto_904943 ) ) ( not ( = ?auto_904940 ?auto_904944 ) ) ( not ( = ?auto_904940 ?auto_904945 ) ) ( not ( = ?auto_904940 ?auto_904946 ) ) ( not ( = ?auto_904941 ?auto_904942 ) ) ( not ( = ?auto_904941 ?auto_904943 ) ) ( not ( = ?auto_904941 ?auto_904944 ) ) ( not ( = ?auto_904941 ?auto_904945 ) ) ( not ( = ?auto_904941 ?auto_904946 ) ) ( not ( = ?auto_904942 ?auto_904943 ) ) ( not ( = ?auto_904942 ?auto_904944 ) ) ( not ( = ?auto_904942 ?auto_904945 ) ) ( not ( = ?auto_904942 ?auto_904946 ) ) ( not ( = ?auto_904943 ?auto_904944 ) ) ( not ( = ?auto_904943 ?auto_904945 ) ) ( not ( = ?auto_904943 ?auto_904946 ) ) ( not ( = ?auto_904944 ?auto_904945 ) ) ( not ( = ?auto_904944 ?auto_904946 ) ) ( not ( = ?auto_904945 ?auto_904946 ) ) ( ON ?auto_904944 ?auto_904945 ) ( ON ?auto_904943 ?auto_904944 ) ( ON ?auto_904942 ?auto_904943 ) ( ON ?auto_904941 ?auto_904942 ) ( ON ?auto_904940 ?auto_904941 ) ( ON ?auto_904939 ?auto_904940 ) ( ON ?auto_904938 ?auto_904939 ) ( ON ?auto_904937 ?auto_904938 ) ( CLEAR ?auto_904935 ) ( ON ?auto_904936 ?auto_904937 ) ( CLEAR ?auto_904936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_904929 ?auto_904930 ?auto_904931 ?auto_904932 ?auto_904933 ?auto_904934 ?auto_904935 ?auto_904936 )
      ( MAKE-17PILE ?auto_904929 ?auto_904930 ?auto_904931 ?auto_904932 ?auto_904933 ?auto_904934 ?auto_904935 ?auto_904936 ?auto_904937 ?auto_904938 ?auto_904939 ?auto_904940 ?auto_904941 ?auto_904942 ?auto_904943 ?auto_904944 ?auto_904945 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_904999 - BLOCK
      ?auto_905000 - BLOCK
      ?auto_905001 - BLOCK
      ?auto_905002 - BLOCK
      ?auto_905003 - BLOCK
      ?auto_905004 - BLOCK
      ?auto_905005 - BLOCK
      ?auto_905006 - BLOCK
      ?auto_905007 - BLOCK
      ?auto_905008 - BLOCK
      ?auto_905009 - BLOCK
      ?auto_905010 - BLOCK
      ?auto_905011 - BLOCK
      ?auto_905012 - BLOCK
      ?auto_905013 - BLOCK
      ?auto_905014 - BLOCK
      ?auto_905015 - BLOCK
    )
    :vars
    (
      ?auto_905016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_905015 ?auto_905016 ) ( ON-TABLE ?auto_904999 ) ( ON ?auto_905000 ?auto_904999 ) ( ON ?auto_905001 ?auto_905000 ) ( ON ?auto_905002 ?auto_905001 ) ( ON ?auto_905003 ?auto_905002 ) ( ON ?auto_905004 ?auto_905003 ) ( not ( = ?auto_904999 ?auto_905000 ) ) ( not ( = ?auto_904999 ?auto_905001 ) ) ( not ( = ?auto_904999 ?auto_905002 ) ) ( not ( = ?auto_904999 ?auto_905003 ) ) ( not ( = ?auto_904999 ?auto_905004 ) ) ( not ( = ?auto_904999 ?auto_905005 ) ) ( not ( = ?auto_904999 ?auto_905006 ) ) ( not ( = ?auto_904999 ?auto_905007 ) ) ( not ( = ?auto_904999 ?auto_905008 ) ) ( not ( = ?auto_904999 ?auto_905009 ) ) ( not ( = ?auto_904999 ?auto_905010 ) ) ( not ( = ?auto_904999 ?auto_905011 ) ) ( not ( = ?auto_904999 ?auto_905012 ) ) ( not ( = ?auto_904999 ?auto_905013 ) ) ( not ( = ?auto_904999 ?auto_905014 ) ) ( not ( = ?auto_904999 ?auto_905015 ) ) ( not ( = ?auto_904999 ?auto_905016 ) ) ( not ( = ?auto_905000 ?auto_905001 ) ) ( not ( = ?auto_905000 ?auto_905002 ) ) ( not ( = ?auto_905000 ?auto_905003 ) ) ( not ( = ?auto_905000 ?auto_905004 ) ) ( not ( = ?auto_905000 ?auto_905005 ) ) ( not ( = ?auto_905000 ?auto_905006 ) ) ( not ( = ?auto_905000 ?auto_905007 ) ) ( not ( = ?auto_905000 ?auto_905008 ) ) ( not ( = ?auto_905000 ?auto_905009 ) ) ( not ( = ?auto_905000 ?auto_905010 ) ) ( not ( = ?auto_905000 ?auto_905011 ) ) ( not ( = ?auto_905000 ?auto_905012 ) ) ( not ( = ?auto_905000 ?auto_905013 ) ) ( not ( = ?auto_905000 ?auto_905014 ) ) ( not ( = ?auto_905000 ?auto_905015 ) ) ( not ( = ?auto_905000 ?auto_905016 ) ) ( not ( = ?auto_905001 ?auto_905002 ) ) ( not ( = ?auto_905001 ?auto_905003 ) ) ( not ( = ?auto_905001 ?auto_905004 ) ) ( not ( = ?auto_905001 ?auto_905005 ) ) ( not ( = ?auto_905001 ?auto_905006 ) ) ( not ( = ?auto_905001 ?auto_905007 ) ) ( not ( = ?auto_905001 ?auto_905008 ) ) ( not ( = ?auto_905001 ?auto_905009 ) ) ( not ( = ?auto_905001 ?auto_905010 ) ) ( not ( = ?auto_905001 ?auto_905011 ) ) ( not ( = ?auto_905001 ?auto_905012 ) ) ( not ( = ?auto_905001 ?auto_905013 ) ) ( not ( = ?auto_905001 ?auto_905014 ) ) ( not ( = ?auto_905001 ?auto_905015 ) ) ( not ( = ?auto_905001 ?auto_905016 ) ) ( not ( = ?auto_905002 ?auto_905003 ) ) ( not ( = ?auto_905002 ?auto_905004 ) ) ( not ( = ?auto_905002 ?auto_905005 ) ) ( not ( = ?auto_905002 ?auto_905006 ) ) ( not ( = ?auto_905002 ?auto_905007 ) ) ( not ( = ?auto_905002 ?auto_905008 ) ) ( not ( = ?auto_905002 ?auto_905009 ) ) ( not ( = ?auto_905002 ?auto_905010 ) ) ( not ( = ?auto_905002 ?auto_905011 ) ) ( not ( = ?auto_905002 ?auto_905012 ) ) ( not ( = ?auto_905002 ?auto_905013 ) ) ( not ( = ?auto_905002 ?auto_905014 ) ) ( not ( = ?auto_905002 ?auto_905015 ) ) ( not ( = ?auto_905002 ?auto_905016 ) ) ( not ( = ?auto_905003 ?auto_905004 ) ) ( not ( = ?auto_905003 ?auto_905005 ) ) ( not ( = ?auto_905003 ?auto_905006 ) ) ( not ( = ?auto_905003 ?auto_905007 ) ) ( not ( = ?auto_905003 ?auto_905008 ) ) ( not ( = ?auto_905003 ?auto_905009 ) ) ( not ( = ?auto_905003 ?auto_905010 ) ) ( not ( = ?auto_905003 ?auto_905011 ) ) ( not ( = ?auto_905003 ?auto_905012 ) ) ( not ( = ?auto_905003 ?auto_905013 ) ) ( not ( = ?auto_905003 ?auto_905014 ) ) ( not ( = ?auto_905003 ?auto_905015 ) ) ( not ( = ?auto_905003 ?auto_905016 ) ) ( not ( = ?auto_905004 ?auto_905005 ) ) ( not ( = ?auto_905004 ?auto_905006 ) ) ( not ( = ?auto_905004 ?auto_905007 ) ) ( not ( = ?auto_905004 ?auto_905008 ) ) ( not ( = ?auto_905004 ?auto_905009 ) ) ( not ( = ?auto_905004 ?auto_905010 ) ) ( not ( = ?auto_905004 ?auto_905011 ) ) ( not ( = ?auto_905004 ?auto_905012 ) ) ( not ( = ?auto_905004 ?auto_905013 ) ) ( not ( = ?auto_905004 ?auto_905014 ) ) ( not ( = ?auto_905004 ?auto_905015 ) ) ( not ( = ?auto_905004 ?auto_905016 ) ) ( not ( = ?auto_905005 ?auto_905006 ) ) ( not ( = ?auto_905005 ?auto_905007 ) ) ( not ( = ?auto_905005 ?auto_905008 ) ) ( not ( = ?auto_905005 ?auto_905009 ) ) ( not ( = ?auto_905005 ?auto_905010 ) ) ( not ( = ?auto_905005 ?auto_905011 ) ) ( not ( = ?auto_905005 ?auto_905012 ) ) ( not ( = ?auto_905005 ?auto_905013 ) ) ( not ( = ?auto_905005 ?auto_905014 ) ) ( not ( = ?auto_905005 ?auto_905015 ) ) ( not ( = ?auto_905005 ?auto_905016 ) ) ( not ( = ?auto_905006 ?auto_905007 ) ) ( not ( = ?auto_905006 ?auto_905008 ) ) ( not ( = ?auto_905006 ?auto_905009 ) ) ( not ( = ?auto_905006 ?auto_905010 ) ) ( not ( = ?auto_905006 ?auto_905011 ) ) ( not ( = ?auto_905006 ?auto_905012 ) ) ( not ( = ?auto_905006 ?auto_905013 ) ) ( not ( = ?auto_905006 ?auto_905014 ) ) ( not ( = ?auto_905006 ?auto_905015 ) ) ( not ( = ?auto_905006 ?auto_905016 ) ) ( not ( = ?auto_905007 ?auto_905008 ) ) ( not ( = ?auto_905007 ?auto_905009 ) ) ( not ( = ?auto_905007 ?auto_905010 ) ) ( not ( = ?auto_905007 ?auto_905011 ) ) ( not ( = ?auto_905007 ?auto_905012 ) ) ( not ( = ?auto_905007 ?auto_905013 ) ) ( not ( = ?auto_905007 ?auto_905014 ) ) ( not ( = ?auto_905007 ?auto_905015 ) ) ( not ( = ?auto_905007 ?auto_905016 ) ) ( not ( = ?auto_905008 ?auto_905009 ) ) ( not ( = ?auto_905008 ?auto_905010 ) ) ( not ( = ?auto_905008 ?auto_905011 ) ) ( not ( = ?auto_905008 ?auto_905012 ) ) ( not ( = ?auto_905008 ?auto_905013 ) ) ( not ( = ?auto_905008 ?auto_905014 ) ) ( not ( = ?auto_905008 ?auto_905015 ) ) ( not ( = ?auto_905008 ?auto_905016 ) ) ( not ( = ?auto_905009 ?auto_905010 ) ) ( not ( = ?auto_905009 ?auto_905011 ) ) ( not ( = ?auto_905009 ?auto_905012 ) ) ( not ( = ?auto_905009 ?auto_905013 ) ) ( not ( = ?auto_905009 ?auto_905014 ) ) ( not ( = ?auto_905009 ?auto_905015 ) ) ( not ( = ?auto_905009 ?auto_905016 ) ) ( not ( = ?auto_905010 ?auto_905011 ) ) ( not ( = ?auto_905010 ?auto_905012 ) ) ( not ( = ?auto_905010 ?auto_905013 ) ) ( not ( = ?auto_905010 ?auto_905014 ) ) ( not ( = ?auto_905010 ?auto_905015 ) ) ( not ( = ?auto_905010 ?auto_905016 ) ) ( not ( = ?auto_905011 ?auto_905012 ) ) ( not ( = ?auto_905011 ?auto_905013 ) ) ( not ( = ?auto_905011 ?auto_905014 ) ) ( not ( = ?auto_905011 ?auto_905015 ) ) ( not ( = ?auto_905011 ?auto_905016 ) ) ( not ( = ?auto_905012 ?auto_905013 ) ) ( not ( = ?auto_905012 ?auto_905014 ) ) ( not ( = ?auto_905012 ?auto_905015 ) ) ( not ( = ?auto_905012 ?auto_905016 ) ) ( not ( = ?auto_905013 ?auto_905014 ) ) ( not ( = ?auto_905013 ?auto_905015 ) ) ( not ( = ?auto_905013 ?auto_905016 ) ) ( not ( = ?auto_905014 ?auto_905015 ) ) ( not ( = ?auto_905014 ?auto_905016 ) ) ( not ( = ?auto_905015 ?auto_905016 ) ) ( ON ?auto_905014 ?auto_905015 ) ( ON ?auto_905013 ?auto_905014 ) ( ON ?auto_905012 ?auto_905013 ) ( ON ?auto_905011 ?auto_905012 ) ( ON ?auto_905010 ?auto_905011 ) ( ON ?auto_905009 ?auto_905010 ) ( ON ?auto_905008 ?auto_905009 ) ( ON ?auto_905007 ?auto_905008 ) ( ON ?auto_905006 ?auto_905007 ) ( CLEAR ?auto_905004 ) ( ON ?auto_905005 ?auto_905006 ) ( CLEAR ?auto_905005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_904999 ?auto_905000 ?auto_905001 ?auto_905002 ?auto_905003 ?auto_905004 ?auto_905005 )
      ( MAKE-17PILE ?auto_904999 ?auto_905000 ?auto_905001 ?auto_905002 ?auto_905003 ?auto_905004 ?auto_905005 ?auto_905006 ?auto_905007 ?auto_905008 ?auto_905009 ?auto_905010 ?auto_905011 ?auto_905012 ?auto_905013 ?auto_905014 ?auto_905015 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_905069 - BLOCK
      ?auto_905070 - BLOCK
      ?auto_905071 - BLOCK
      ?auto_905072 - BLOCK
      ?auto_905073 - BLOCK
      ?auto_905074 - BLOCK
      ?auto_905075 - BLOCK
      ?auto_905076 - BLOCK
      ?auto_905077 - BLOCK
      ?auto_905078 - BLOCK
      ?auto_905079 - BLOCK
      ?auto_905080 - BLOCK
      ?auto_905081 - BLOCK
      ?auto_905082 - BLOCK
      ?auto_905083 - BLOCK
      ?auto_905084 - BLOCK
      ?auto_905085 - BLOCK
    )
    :vars
    (
      ?auto_905086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_905085 ?auto_905086 ) ( ON-TABLE ?auto_905069 ) ( ON ?auto_905070 ?auto_905069 ) ( ON ?auto_905071 ?auto_905070 ) ( ON ?auto_905072 ?auto_905071 ) ( ON ?auto_905073 ?auto_905072 ) ( not ( = ?auto_905069 ?auto_905070 ) ) ( not ( = ?auto_905069 ?auto_905071 ) ) ( not ( = ?auto_905069 ?auto_905072 ) ) ( not ( = ?auto_905069 ?auto_905073 ) ) ( not ( = ?auto_905069 ?auto_905074 ) ) ( not ( = ?auto_905069 ?auto_905075 ) ) ( not ( = ?auto_905069 ?auto_905076 ) ) ( not ( = ?auto_905069 ?auto_905077 ) ) ( not ( = ?auto_905069 ?auto_905078 ) ) ( not ( = ?auto_905069 ?auto_905079 ) ) ( not ( = ?auto_905069 ?auto_905080 ) ) ( not ( = ?auto_905069 ?auto_905081 ) ) ( not ( = ?auto_905069 ?auto_905082 ) ) ( not ( = ?auto_905069 ?auto_905083 ) ) ( not ( = ?auto_905069 ?auto_905084 ) ) ( not ( = ?auto_905069 ?auto_905085 ) ) ( not ( = ?auto_905069 ?auto_905086 ) ) ( not ( = ?auto_905070 ?auto_905071 ) ) ( not ( = ?auto_905070 ?auto_905072 ) ) ( not ( = ?auto_905070 ?auto_905073 ) ) ( not ( = ?auto_905070 ?auto_905074 ) ) ( not ( = ?auto_905070 ?auto_905075 ) ) ( not ( = ?auto_905070 ?auto_905076 ) ) ( not ( = ?auto_905070 ?auto_905077 ) ) ( not ( = ?auto_905070 ?auto_905078 ) ) ( not ( = ?auto_905070 ?auto_905079 ) ) ( not ( = ?auto_905070 ?auto_905080 ) ) ( not ( = ?auto_905070 ?auto_905081 ) ) ( not ( = ?auto_905070 ?auto_905082 ) ) ( not ( = ?auto_905070 ?auto_905083 ) ) ( not ( = ?auto_905070 ?auto_905084 ) ) ( not ( = ?auto_905070 ?auto_905085 ) ) ( not ( = ?auto_905070 ?auto_905086 ) ) ( not ( = ?auto_905071 ?auto_905072 ) ) ( not ( = ?auto_905071 ?auto_905073 ) ) ( not ( = ?auto_905071 ?auto_905074 ) ) ( not ( = ?auto_905071 ?auto_905075 ) ) ( not ( = ?auto_905071 ?auto_905076 ) ) ( not ( = ?auto_905071 ?auto_905077 ) ) ( not ( = ?auto_905071 ?auto_905078 ) ) ( not ( = ?auto_905071 ?auto_905079 ) ) ( not ( = ?auto_905071 ?auto_905080 ) ) ( not ( = ?auto_905071 ?auto_905081 ) ) ( not ( = ?auto_905071 ?auto_905082 ) ) ( not ( = ?auto_905071 ?auto_905083 ) ) ( not ( = ?auto_905071 ?auto_905084 ) ) ( not ( = ?auto_905071 ?auto_905085 ) ) ( not ( = ?auto_905071 ?auto_905086 ) ) ( not ( = ?auto_905072 ?auto_905073 ) ) ( not ( = ?auto_905072 ?auto_905074 ) ) ( not ( = ?auto_905072 ?auto_905075 ) ) ( not ( = ?auto_905072 ?auto_905076 ) ) ( not ( = ?auto_905072 ?auto_905077 ) ) ( not ( = ?auto_905072 ?auto_905078 ) ) ( not ( = ?auto_905072 ?auto_905079 ) ) ( not ( = ?auto_905072 ?auto_905080 ) ) ( not ( = ?auto_905072 ?auto_905081 ) ) ( not ( = ?auto_905072 ?auto_905082 ) ) ( not ( = ?auto_905072 ?auto_905083 ) ) ( not ( = ?auto_905072 ?auto_905084 ) ) ( not ( = ?auto_905072 ?auto_905085 ) ) ( not ( = ?auto_905072 ?auto_905086 ) ) ( not ( = ?auto_905073 ?auto_905074 ) ) ( not ( = ?auto_905073 ?auto_905075 ) ) ( not ( = ?auto_905073 ?auto_905076 ) ) ( not ( = ?auto_905073 ?auto_905077 ) ) ( not ( = ?auto_905073 ?auto_905078 ) ) ( not ( = ?auto_905073 ?auto_905079 ) ) ( not ( = ?auto_905073 ?auto_905080 ) ) ( not ( = ?auto_905073 ?auto_905081 ) ) ( not ( = ?auto_905073 ?auto_905082 ) ) ( not ( = ?auto_905073 ?auto_905083 ) ) ( not ( = ?auto_905073 ?auto_905084 ) ) ( not ( = ?auto_905073 ?auto_905085 ) ) ( not ( = ?auto_905073 ?auto_905086 ) ) ( not ( = ?auto_905074 ?auto_905075 ) ) ( not ( = ?auto_905074 ?auto_905076 ) ) ( not ( = ?auto_905074 ?auto_905077 ) ) ( not ( = ?auto_905074 ?auto_905078 ) ) ( not ( = ?auto_905074 ?auto_905079 ) ) ( not ( = ?auto_905074 ?auto_905080 ) ) ( not ( = ?auto_905074 ?auto_905081 ) ) ( not ( = ?auto_905074 ?auto_905082 ) ) ( not ( = ?auto_905074 ?auto_905083 ) ) ( not ( = ?auto_905074 ?auto_905084 ) ) ( not ( = ?auto_905074 ?auto_905085 ) ) ( not ( = ?auto_905074 ?auto_905086 ) ) ( not ( = ?auto_905075 ?auto_905076 ) ) ( not ( = ?auto_905075 ?auto_905077 ) ) ( not ( = ?auto_905075 ?auto_905078 ) ) ( not ( = ?auto_905075 ?auto_905079 ) ) ( not ( = ?auto_905075 ?auto_905080 ) ) ( not ( = ?auto_905075 ?auto_905081 ) ) ( not ( = ?auto_905075 ?auto_905082 ) ) ( not ( = ?auto_905075 ?auto_905083 ) ) ( not ( = ?auto_905075 ?auto_905084 ) ) ( not ( = ?auto_905075 ?auto_905085 ) ) ( not ( = ?auto_905075 ?auto_905086 ) ) ( not ( = ?auto_905076 ?auto_905077 ) ) ( not ( = ?auto_905076 ?auto_905078 ) ) ( not ( = ?auto_905076 ?auto_905079 ) ) ( not ( = ?auto_905076 ?auto_905080 ) ) ( not ( = ?auto_905076 ?auto_905081 ) ) ( not ( = ?auto_905076 ?auto_905082 ) ) ( not ( = ?auto_905076 ?auto_905083 ) ) ( not ( = ?auto_905076 ?auto_905084 ) ) ( not ( = ?auto_905076 ?auto_905085 ) ) ( not ( = ?auto_905076 ?auto_905086 ) ) ( not ( = ?auto_905077 ?auto_905078 ) ) ( not ( = ?auto_905077 ?auto_905079 ) ) ( not ( = ?auto_905077 ?auto_905080 ) ) ( not ( = ?auto_905077 ?auto_905081 ) ) ( not ( = ?auto_905077 ?auto_905082 ) ) ( not ( = ?auto_905077 ?auto_905083 ) ) ( not ( = ?auto_905077 ?auto_905084 ) ) ( not ( = ?auto_905077 ?auto_905085 ) ) ( not ( = ?auto_905077 ?auto_905086 ) ) ( not ( = ?auto_905078 ?auto_905079 ) ) ( not ( = ?auto_905078 ?auto_905080 ) ) ( not ( = ?auto_905078 ?auto_905081 ) ) ( not ( = ?auto_905078 ?auto_905082 ) ) ( not ( = ?auto_905078 ?auto_905083 ) ) ( not ( = ?auto_905078 ?auto_905084 ) ) ( not ( = ?auto_905078 ?auto_905085 ) ) ( not ( = ?auto_905078 ?auto_905086 ) ) ( not ( = ?auto_905079 ?auto_905080 ) ) ( not ( = ?auto_905079 ?auto_905081 ) ) ( not ( = ?auto_905079 ?auto_905082 ) ) ( not ( = ?auto_905079 ?auto_905083 ) ) ( not ( = ?auto_905079 ?auto_905084 ) ) ( not ( = ?auto_905079 ?auto_905085 ) ) ( not ( = ?auto_905079 ?auto_905086 ) ) ( not ( = ?auto_905080 ?auto_905081 ) ) ( not ( = ?auto_905080 ?auto_905082 ) ) ( not ( = ?auto_905080 ?auto_905083 ) ) ( not ( = ?auto_905080 ?auto_905084 ) ) ( not ( = ?auto_905080 ?auto_905085 ) ) ( not ( = ?auto_905080 ?auto_905086 ) ) ( not ( = ?auto_905081 ?auto_905082 ) ) ( not ( = ?auto_905081 ?auto_905083 ) ) ( not ( = ?auto_905081 ?auto_905084 ) ) ( not ( = ?auto_905081 ?auto_905085 ) ) ( not ( = ?auto_905081 ?auto_905086 ) ) ( not ( = ?auto_905082 ?auto_905083 ) ) ( not ( = ?auto_905082 ?auto_905084 ) ) ( not ( = ?auto_905082 ?auto_905085 ) ) ( not ( = ?auto_905082 ?auto_905086 ) ) ( not ( = ?auto_905083 ?auto_905084 ) ) ( not ( = ?auto_905083 ?auto_905085 ) ) ( not ( = ?auto_905083 ?auto_905086 ) ) ( not ( = ?auto_905084 ?auto_905085 ) ) ( not ( = ?auto_905084 ?auto_905086 ) ) ( not ( = ?auto_905085 ?auto_905086 ) ) ( ON ?auto_905084 ?auto_905085 ) ( ON ?auto_905083 ?auto_905084 ) ( ON ?auto_905082 ?auto_905083 ) ( ON ?auto_905081 ?auto_905082 ) ( ON ?auto_905080 ?auto_905081 ) ( ON ?auto_905079 ?auto_905080 ) ( ON ?auto_905078 ?auto_905079 ) ( ON ?auto_905077 ?auto_905078 ) ( ON ?auto_905076 ?auto_905077 ) ( ON ?auto_905075 ?auto_905076 ) ( CLEAR ?auto_905073 ) ( ON ?auto_905074 ?auto_905075 ) ( CLEAR ?auto_905074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_905069 ?auto_905070 ?auto_905071 ?auto_905072 ?auto_905073 ?auto_905074 )
      ( MAKE-17PILE ?auto_905069 ?auto_905070 ?auto_905071 ?auto_905072 ?auto_905073 ?auto_905074 ?auto_905075 ?auto_905076 ?auto_905077 ?auto_905078 ?auto_905079 ?auto_905080 ?auto_905081 ?auto_905082 ?auto_905083 ?auto_905084 ?auto_905085 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_905139 - BLOCK
      ?auto_905140 - BLOCK
      ?auto_905141 - BLOCK
      ?auto_905142 - BLOCK
      ?auto_905143 - BLOCK
      ?auto_905144 - BLOCK
      ?auto_905145 - BLOCK
      ?auto_905146 - BLOCK
      ?auto_905147 - BLOCK
      ?auto_905148 - BLOCK
      ?auto_905149 - BLOCK
      ?auto_905150 - BLOCK
      ?auto_905151 - BLOCK
      ?auto_905152 - BLOCK
      ?auto_905153 - BLOCK
      ?auto_905154 - BLOCK
      ?auto_905155 - BLOCK
    )
    :vars
    (
      ?auto_905156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_905155 ?auto_905156 ) ( ON-TABLE ?auto_905139 ) ( ON ?auto_905140 ?auto_905139 ) ( ON ?auto_905141 ?auto_905140 ) ( ON ?auto_905142 ?auto_905141 ) ( not ( = ?auto_905139 ?auto_905140 ) ) ( not ( = ?auto_905139 ?auto_905141 ) ) ( not ( = ?auto_905139 ?auto_905142 ) ) ( not ( = ?auto_905139 ?auto_905143 ) ) ( not ( = ?auto_905139 ?auto_905144 ) ) ( not ( = ?auto_905139 ?auto_905145 ) ) ( not ( = ?auto_905139 ?auto_905146 ) ) ( not ( = ?auto_905139 ?auto_905147 ) ) ( not ( = ?auto_905139 ?auto_905148 ) ) ( not ( = ?auto_905139 ?auto_905149 ) ) ( not ( = ?auto_905139 ?auto_905150 ) ) ( not ( = ?auto_905139 ?auto_905151 ) ) ( not ( = ?auto_905139 ?auto_905152 ) ) ( not ( = ?auto_905139 ?auto_905153 ) ) ( not ( = ?auto_905139 ?auto_905154 ) ) ( not ( = ?auto_905139 ?auto_905155 ) ) ( not ( = ?auto_905139 ?auto_905156 ) ) ( not ( = ?auto_905140 ?auto_905141 ) ) ( not ( = ?auto_905140 ?auto_905142 ) ) ( not ( = ?auto_905140 ?auto_905143 ) ) ( not ( = ?auto_905140 ?auto_905144 ) ) ( not ( = ?auto_905140 ?auto_905145 ) ) ( not ( = ?auto_905140 ?auto_905146 ) ) ( not ( = ?auto_905140 ?auto_905147 ) ) ( not ( = ?auto_905140 ?auto_905148 ) ) ( not ( = ?auto_905140 ?auto_905149 ) ) ( not ( = ?auto_905140 ?auto_905150 ) ) ( not ( = ?auto_905140 ?auto_905151 ) ) ( not ( = ?auto_905140 ?auto_905152 ) ) ( not ( = ?auto_905140 ?auto_905153 ) ) ( not ( = ?auto_905140 ?auto_905154 ) ) ( not ( = ?auto_905140 ?auto_905155 ) ) ( not ( = ?auto_905140 ?auto_905156 ) ) ( not ( = ?auto_905141 ?auto_905142 ) ) ( not ( = ?auto_905141 ?auto_905143 ) ) ( not ( = ?auto_905141 ?auto_905144 ) ) ( not ( = ?auto_905141 ?auto_905145 ) ) ( not ( = ?auto_905141 ?auto_905146 ) ) ( not ( = ?auto_905141 ?auto_905147 ) ) ( not ( = ?auto_905141 ?auto_905148 ) ) ( not ( = ?auto_905141 ?auto_905149 ) ) ( not ( = ?auto_905141 ?auto_905150 ) ) ( not ( = ?auto_905141 ?auto_905151 ) ) ( not ( = ?auto_905141 ?auto_905152 ) ) ( not ( = ?auto_905141 ?auto_905153 ) ) ( not ( = ?auto_905141 ?auto_905154 ) ) ( not ( = ?auto_905141 ?auto_905155 ) ) ( not ( = ?auto_905141 ?auto_905156 ) ) ( not ( = ?auto_905142 ?auto_905143 ) ) ( not ( = ?auto_905142 ?auto_905144 ) ) ( not ( = ?auto_905142 ?auto_905145 ) ) ( not ( = ?auto_905142 ?auto_905146 ) ) ( not ( = ?auto_905142 ?auto_905147 ) ) ( not ( = ?auto_905142 ?auto_905148 ) ) ( not ( = ?auto_905142 ?auto_905149 ) ) ( not ( = ?auto_905142 ?auto_905150 ) ) ( not ( = ?auto_905142 ?auto_905151 ) ) ( not ( = ?auto_905142 ?auto_905152 ) ) ( not ( = ?auto_905142 ?auto_905153 ) ) ( not ( = ?auto_905142 ?auto_905154 ) ) ( not ( = ?auto_905142 ?auto_905155 ) ) ( not ( = ?auto_905142 ?auto_905156 ) ) ( not ( = ?auto_905143 ?auto_905144 ) ) ( not ( = ?auto_905143 ?auto_905145 ) ) ( not ( = ?auto_905143 ?auto_905146 ) ) ( not ( = ?auto_905143 ?auto_905147 ) ) ( not ( = ?auto_905143 ?auto_905148 ) ) ( not ( = ?auto_905143 ?auto_905149 ) ) ( not ( = ?auto_905143 ?auto_905150 ) ) ( not ( = ?auto_905143 ?auto_905151 ) ) ( not ( = ?auto_905143 ?auto_905152 ) ) ( not ( = ?auto_905143 ?auto_905153 ) ) ( not ( = ?auto_905143 ?auto_905154 ) ) ( not ( = ?auto_905143 ?auto_905155 ) ) ( not ( = ?auto_905143 ?auto_905156 ) ) ( not ( = ?auto_905144 ?auto_905145 ) ) ( not ( = ?auto_905144 ?auto_905146 ) ) ( not ( = ?auto_905144 ?auto_905147 ) ) ( not ( = ?auto_905144 ?auto_905148 ) ) ( not ( = ?auto_905144 ?auto_905149 ) ) ( not ( = ?auto_905144 ?auto_905150 ) ) ( not ( = ?auto_905144 ?auto_905151 ) ) ( not ( = ?auto_905144 ?auto_905152 ) ) ( not ( = ?auto_905144 ?auto_905153 ) ) ( not ( = ?auto_905144 ?auto_905154 ) ) ( not ( = ?auto_905144 ?auto_905155 ) ) ( not ( = ?auto_905144 ?auto_905156 ) ) ( not ( = ?auto_905145 ?auto_905146 ) ) ( not ( = ?auto_905145 ?auto_905147 ) ) ( not ( = ?auto_905145 ?auto_905148 ) ) ( not ( = ?auto_905145 ?auto_905149 ) ) ( not ( = ?auto_905145 ?auto_905150 ) ) ( not ( = ?auto_905145 ?auto_905151 ) ) ( not ( = ?auto_905145 ?auto_905152 ) ) ( not ( = ?auto_905145 ?auto_905153 ) ) ( not ( = ?auto_905145 ?auto_905154 ) ) ( not ( = ?auto_905145 ?auto_905155 ) ) ( not ( = ?auto_905145 ?auto_905156 ) ) ( not ( = ?auto_905146 ?auto_905147 ) ) ( not ( = ?auto_905146 ?auto_905148 ) ) ( not ( = ?auto_905146 ?auto_905149 ) ) ( not ( = ?auto_905146 ?auto_905150 ) ) ( not ( = ?auto_905146 ?auto_905151 ) ) ( not ( = ?auto_905146 ?auto_905152 ) ) ( not ( = ?auto_905146 ?auto_905153 ) ) ( not ( = ?auto_905146 ?auto_905154 ) ) ( not ( = ?auto_905146 ?auto_905155 ) ) ( not ( = ?auto_905146 ?auto_905156 ) ) ( not ( = ?auto_905147 ?auto_905148 ) ) ( not ( = ?auto_905147 ?auto_905149 ) ) ( not ( = ?auto_905147 ?auto_905150 ) ) ( not ( = ?auto_905147 ?auto_905151 ) ) ( not ( = ?auto_905147 ?auto_905152 ) ) ( not ( = ?auto_905147 ?auto_905153 ) ) ( not ( = ?auto_905147 ?auto_905154 ) ) ( not ( = ?auto_905147 ?auto_905155 ) ) ( not ( = ?auto_905147 ?auto_905156 ) ) ( not ( = ?auto_905148 ?auto_905149 ) ) ( not ( = ?auto_905148 ?auto_905150 ) ) ( not ( = ?auto_905148 ?auto_905151 ) ) ( not ( = ?auto_905148 ?auto_905152 ) ) ( not ( = ?auto_905148 ?auto_905153 ) ) ( not ( = ?auto_905148 ?auto_905154 ) ) ( not ( = ?auto_905148 ?auto_905155 ) ) ( not ( = ?auto_905148 ?auto_905156 ) ) ( not ( = ?auto_905149 ?auto_905150 ) ) ( not ( = ?auto_905149 ?auto_905151 ) ) ( not ( = ?auto_905149 ?auto_905152 ) ) ( not ( = ?auto_905149 ?auto_905153 ) ) ( not ( = ?auto_905149 ?auto_905154 ) ) ( not ( = ?auto_905149 ?auto_905155 ) ) ( not ( = ?auto_905149 ?auto_905156 ) ) ( not ( = ?auto_905150 ?auto_905151 ) ) ( not ( = ?auto_905150 ?auto_905152 ) ) ( not ( = ?auto_905150 ?auto_905153 ) ) ( not ( = ?auto_905150 ?auto_905154 ) ) ( not ( = ?auto_905150 ?auto_905155 ) ) ( not ( = ?auto_905150 ?auto_905156 ) ) ( not ( = ?auto_905151 ?auto_905152 ) ) ( not ( = ?auto_905151 ?auto_905153 ) ) ( not ( = ?auto_905151 ?auto_905154 ) ) ( not ( = ?auto_905151 ?auto_905155 ) ) ( not ( = ?auto_905151 ?auto_905156 ) ) ( not ( = ?auto_905152 ?auto_905153 ) ) ( not ( = ?auto_905152 ?auto_905154 ) ) ( not ( = ?auto_905152 ?auto_905155 ) ) ( not ( = ?auto_905152 ?auto_905156 ) ) ( not ( = ?auto_905153 ?auto_905154 ) ) ( not ( = ?auto_905153 ?auto_905155 ) ) ( not ( = ?auto_905153 ?auto_905156 ) ) ( not ( = ?auto_905154 ?auto_905155 ) ) ( not ( = ?auto_905154 ?auto_905156 ) ) ( not ( = ?auto_905155 ?auto_905156 ) ) ( ON ?auto_905154 ?auto_905155 ) ( ON ?auto_905153 ?auto_905154 ) ( ON ?auto_905152 ?auto_905153 ) ( ON ?auto_905151 ?auto_905152 ) ( ON ?auto_905150 ?auto_905151 ) ( ON ?auto_905149 ?auto_905150 ) ( ON ?auto_905148 ?auto_905149 ) ( ON ?auto_905147 ?auto_905148 ) ( ON ?auto_905146 ?auto_905147 ) ( ON ?auto_905145 ?auto_905146 ) ( ON ?auto_905144 ?auto_905145 ) ( CLEAR ?auto_905142 ) ( ON ?auto_905143 ?auto_905144 ) ( CLEAR ?auto_905143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_905139 ?auto_905140 ?auto_905141 ?auto_905142 ?auto_905143 )
      ( MAKE-17PILE ?auto_905139 ?auto_905140 ?auto_905141 ?auto_905142 ?auto_905143 ?auto_905144 ?auto_905145 ?auto_905146 ?auto_905147 ?auto_905148 ?auto_905149 ?auto_905150 ?auto_905151 ?auto_905152 ?auto_905153 ?auto_905154 ?auto_905155 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_905209 - BLOCK
      ?auto_905210 - BLOCK
      ?auto_905211 - BLOCK
      ?auto_905212 - BLOCK
      ?auto_905213 - BLOCK
      ?auto_905214 - BLOCK
      ?auto_905215 - BLOCK
      ?auto_905216 - BLOCK
      ?auto_905217 - BLOCK
      ?auto_905218 - BLOCK
      ?auto_905219 - BLOCK
      ?auto_905220 - BLOCK
      ?auto_905221 - BLOCK
      ?auto_905222 - BLOCK
      ?auto_905223 - BLOCK
      ?auto_905224 - BLOCK
      ?auto_905225 - BLOCK
    )
    :vars
    (
      ?auto_905226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_905225 ?auto_905226 ) ( ON-TABLE ?auto_905209 ) ( ON ?auto_905210 ?auto_905209 ) ( ON ?auto_905211 ?auto_905210 ) ( not ( = ?auto_905209 ?auto_905210 ) ) ( not ( = ?auto_905209 ?auto_905211 ) ) ( not ( = ?auto_905209 ?auto_905212 ) ) ( not ( = ?auto_905209 ?auto_905213 ) ) ( not ( = ?auto_905209 ?auto_905214 ) ) ( not ( = ?auto_905209 ?auto_905215 ) ) ( not ( = ?auto_905209 ?auto_905216 ) ) ( not ( = ?auto_905209 ?auto_905217 ) ) ( not ( = ?auto_905209 ?auto_905218 ) ) ( not ( = ?auto_905209 ?auto_905219 ) ) ( not ( = ?auto_905209 ?auto_905220 ) ) ( not ( = ?auto_905209 ?auto_905221 ) ) ( not ( = ?auto_905209 ?auto_905222 ) ) ( not ( = ?auto_905209 ?auto_905223 ) ) ( not ( = ?auto_905209 ?auto_905224 ) ) ( not ( = ?auto_905209 ?auto_905225 ) ) ( not ( = ?auto_905209 ?auto_905226 ) ) ( not ( = ?auto_905210 ?auto_905211 ) ) ( not ( = ?auto_905210 ?auto_905212 ) ) ( not ( = ?auto_905210 ?auto_905213 ) ) ( not ( = ?auto_905210 ?auto_905214 ) ) ( not ( = ?auto_905210 ?auto_905215 ) ) ( not ( = ?auto_905210 ?auto_905216 ) ) ( not ( = ?auto_905210 ?auto_905217 ) ) ( not ( = ?auto_905210 ?auto_905218 ) ) ( not ( = ?auto_905210 ?auto_905219 ) ) ( not ( = ?auto_905210 ?auto_905220 ) ) ( not ( = ?auto_905210 ?auto_905221 ) ) ( not ( = ?auto_905210 ?auto_905222 ) ) ( not ( = ?auto_905210 ?auto_905223 ) ) ( not ( = ?auto_905210 ?auto_905224 ) ) ( not ( = ?auto_905210 ?auto_905225 ) ) ( not ( = ?auto_905210 ?auto_905226 ) ) ( not ( = ?auto_905211 ?auto_905212 ) ) ( not ( = ?auto_905211 ?auto_905213 ) ) ( not ( = ?auto_905211 ?auto_905214 ) ) ( not ( = ?auto_905211 ?auto_905215 ) ) ( not ( = ?auto_905211 ?auto_905216 ) ) ( not ( = ?auto_905211 ?auto_905217 ) ) ( not ( = ?auto_905211 ?auto_905218 ) ) ( not ( = ?auto_905211 ?auto_905219 ) ) ( not ( = ?auto_905211 ?auto_905220 ) ) ( not ( = ?auto_905211 ?auto_905221 ) ) ( not ( = ?auto_905211 ?auto_905222 ) ) ( not ( = ?auto_905211 ?auto_905223 ) ) ( not ( = ?auto_905211 ?auto_905224 ) ) ( not ( = ?auto_905211 ?auto_905225 ) ) ( not ( = ?auto_905211 ?auto_905226 ) ) ( not ( = ?auto_905212 ?auto_905213 ) ) ( not ( = ?auto_905212 ?auto_905214 ) ) ( not ( = ?auto_905212 ?auto_905215 ) ) ( not ( = ?auto_905212 ?auto_905216 ) ) ( not ( = ?auto_905212 ?auto_905217 ) ) ( not ( = ?auto_905212 ?auto_905218 ) ) ( not ( = ?auto_905212 ?auto_905219 ) ) ( not ( = ?auto_905212 ?auto_905220 ) ) ( not ( = ?auto_905212 ?auto_905221 ) ) ( not ( = ?auto_905212 ?auto_905222 ) ) ( not ( = ?auto_905212 ?auto_905223 ) ) ( not ( = ?auto_905212 ?auto_905224 ) ) ( not ( = ?auto_905212 ?auto_905225 ) ) ( not ( = ?auto_905212 ?auto_905226 ) ) ( not ( = ?auto_905213 ?auto_905214 ) ) ( not ( = ?auto_905213 ?auto_905215 ) ) ( not ( = ?auto_905213 ?auto_905216 ) ) ( not ( = ?auto_905213 ?auto_905217 ) ) ( not ( = ?auto_905213 ?auto_905218 ) ) ( not ( = ?auto_905213 ?auto_905219 ) ) ( not ( = ?auto_905213 ?auto_905220 ) ) ( not ( = ?auto_905213 ?auto_905221 ) ) ( not ( = ?auto_905213 ?auto_905222 ) ) ( not ( = ?auto_905213 ?auto_905223 ) ) ( not ( = ?auto_905213 ?auto_905224 ) ) ( not ( = ?auto_905213 ?auto_905225 ) ) ( not ( = ?auto_905213 ?auto_905226 ) ) ( not ( = ?auto_905214 ?auto_905215 ) ) ( not ( = ?auto_905214 ?auto_905216 ) ) ( not ( = ?auto_905214 ?auto_905217 ) ) ( not ( = ?auto_905214 ?auto_905218 ) ) ( not ( = ?auto_905214 ?auto_905219 ) ) ( not ( = ?auto_905214 ?auto_905220 ) ) ( not ( = ?auto_905214 ?auto_905221 ) ) ( not ( = ?auto_905214 ?auto_905222 ) ) ( not ( = ?auto_905214 ?auto_905223 ) ) ( not ( = ?auto_905214 ?auto_905224 ) ) ( not ( = ?auto_905214 ?auto_905225 ) ) ( not ( = ?auto_905214 ?auto_905226 ) ) ( not ( = ?auto_905215 ?auto_905216 ) ) ( not ( = ?auto_905215 ?auto_905217 ) ) ( not ( = ?auto_905215 ?auto_905218 ) ) ( not ( = ?auto_905215 ?auto_905219 ) ) ( not ( = ?auto_905215 ?auto_905220 ) ) ( not ( = ?auto_905215 ?auto_905221 ) ) ( not ( = ?auto_905215 ?auto_905222 ) ) ( not ( = ?auto_905215 ?auto_905223 ) ) ( not ( = ?auto_905215 ?auto_905224 ) ) ( not ( = ?auto_905215 ?auto_905225 ) ) ( not ( = ?auto_905215 ?auto_905226 ) ) ( not ( = ?auto_905216 ?auto_905217 ) ) ( not ( = ?auto_905216 ?auto_905218 ) ) ( not ( = ?auto_905216 ?auto_905219 ) ) ( not ( = ?auto_905216 ?auto_905220 ) ) ( not ( = ?auto_905216 ?auto_905221 ) ) ( not ( = ?auto_905216 ?auto_905222 ) ) ( not ( = ?auto_905216 ?auto_905223 ) ) ( not ( = ?auto_905216 ?auto_905224 ) ) ( not ( = ?auto_905216 ?auto_905225 ) ) ( not ( = ?auto_905216 ?auto_905226 ) ) ( not ( = ?auto_905217 ?auto_905218 ) ) ( not ( = ?auto_905217 ?auto_905219 ) ) ( not ( = ?auto_905217 ?auto_905220 ) ) ( not ( = ?auto_905217 ?auto_905221 ) ) ( not ( = ?auto_905217 ?auto_905222 ) ) ( not ( = ?auto_905217 ?auto_905223 ) ) ( not ( = ?auto_905217 ?auto_905224 ) ) ( not ( = ?auto_905217 ?auto_905225 ) ) ( not ( = ?auto_905217 ?auto_905226 ) ) ( not ( = ?auto_905218 ?auto_905219 ) ) ( not ( = ?auto_905218 ?auto_905220 ) ) ( not ( = ?auto_905218 ?auto_905221 ) ) ( not ( = ?auto_905218 ?auto_905222 ) ) ( not ( = ?auto_905218 ?auto_905223 ) ) ( not ( = ?auto_905218 ?auto_905224 ) ) ( not ( = ?auto_905218 ?auto_905225 ) ) ( not ( = ?auto_905218 ?auto_905226 ) ) ( not ( = ?auto_905219 ?auto_905220 ) ) ( not ( = ?auto_905219 ?auto_905221 ) ) ( not ( = ?auto_905219 ?auto_905222 ) ) ( not ( = ?auto_905219 ?auto_905223 ) ) ( not ( = ?auto_905219 ?auto_905224 ) ) ( not ( = ?auto_905219 ?auto_905225 ) ) ( not ( = ?auto_905219 ?auto_905226 ) ) ( not ( = ?auto_905220 ?auto_905221 ) ) ( not ( = ?auto_905220 ?auto_905222 ) ) ( not ( = ?auto_905220 ?auto_905223 ) ) ( not ( = ?auto_905220 ?auto_905224 ) ) ( not ( = ?auto_905220 ?auto_905225 ) ) ( not ( = ?auto_905220 ?auto_905226 ) ) ( not ( = ?auto_905221 ?auto_905222 ) ) ( not ( = ?auto_905221 ?auto_905223 ) ) ( not ( = ?auto_905221 ?auto_905224 ) ) ( not ( = ?auto_905221 ?auto_905225 ) ) ( not ( = ?auto_905221 ?auto_905226 ) ) ( not ( = ?auto_905222 ?auto_905223 ) ) ( not ( = ?auto_905222 ?auto_905224 ) ) ( not ( = ?auto_905222 ?auto_905225 ) ) ( not ( = ?auto_905222 ?auto_905226 ) ) ( not ( = ?auto_905223 ?auto_905224 ) ) ( not ( = ?auto_905223 ?auto_905225 ) ) ( not ( = ?auto_905223 ?auto_905226 ) ) ( not ( = ?auto_905224 ?auto_905225 ) ) ( not ( = ?auto_905224 ?auto_905226 ) ) ( not ( = ?auto_905225 ?auto_905226 ) ) ( ON ?auto_905224 ?auto_905225 ) ( ON ?auto_905223 ?auto_905224 ) ( ON ?auto_905222 ?auto_905223 ) ( ON ?auto_905221 ?auto_905222 ) ( ON ?auto_905220 ?auto_905221 ) ( ON ?auto_905219 ?auto_905220 ) ( ON ?auto_905218 ?auto_905219 ) ( ON ?auto_905217 ?auto_905218 ) ( ON ?auto_905216 ?auto_905217 ) ( ON ?auto_905215 ?auto_905216 ) ( ON ?auto_905214 ?auto_905215 ) ( ON ?auto_905213 ?auto_905214 ) ( CLEAR ?auto_905211 ) ( ON ?auto_905212 ?auto_905213 ) ( CLEAR ?auto_905212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_905209 ?auto_905210 ?auto_905211 ?auto_905212 )
      ( MAKE-17PILE ?auto_905209 ?auto_905210 ?auto_905211 ?auto_905212 ?auto_905213 ?auto_905214 ?auto_905215 ?auto_905216 ?auto_905217 ?auto_905218 ?auto_905219 ?auto_905220 ?auto_905221 ?auto_905222 ?auto_905223 ?auto_905224 ?auto_905225 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_905279 - BLOCK
      ?auto_905280 - BLOCK
      ?auto_905281 - BLOCK
      ?auto_905282 - BLOCK
      ?auto_905283 - BLOCK
      ?auto_905284 - BLOCK
      ?auto_905285 - BLOCK
      ?auto_905286 - BLOCK
      ?auto_905287 - BLOCK
      ?auto_905288 - BLOCK
      ?auto_905289 - BLOCK
      ?auto_905290 - BLOCK
      ?auto_905291 - BLOCK
      ?auto_905292 - BLOCK
      ?auto_905293 - BLOCK
      ?auto_905294 - BLOCK
      ?auto_905295 - BLOCK
    )
    :vars
    (
      ?auto_905296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_905295 ?auto_905296 ) ( ON-TABLE ?auto_905279 ) ( ON ?auto_905280 ?auto_905279 ) ( not ( = ?auto_905279 ?auto_905280 ) ) ( not ( = ?auto_905279 ?auto_905281 ) ) ( not ( = ?auto_905279 ?auto_905282 ) ) ( not ( = ?auto_905279 ?auto_905283 ) ) ( not ( = ?auto_905279 ?auto_905284 ) ) ( not ( = ?auto_905279 ?auto_905285 ) ) ( not ( = ?auto_905279 ?auto_905286 ) ) ( not ( = ?auto_905279 ?auto_905287 ) ) ( not ( = ?auto_905279 ?auto_905288 ) ) ( not ( = ?auto_905279 ?auto_905289 ) ) ( not ( = ?auto_905279 ?auto_905290 ) ) ( not ( = ?auto_905279 ?auto_905291 ) ) ( not ( = ?auto_905279 ?auto_905292 ) ) ( not ( = ?auto_905279 ?auto_905293 ) ) ( not ( = ?auto_905279 ?auto_905294 ) ) ( not ( = ?auto_905279 ?auto_905295 ) ) ( not ( = ?auto_905279 ?auto_905296 ) ) ( not ( = ?auto_905280 ?auto_905281 ) ) ( not ( = ?auto_905280 ?auto_905282 ) ) ( not ( = ?auto_905280 ?auto_905283 ) ) ( not ( = ?auto_905280 ?auto_905284 ) ) ( not ( = ?auto_905280 ?auto_905285 ) ) ( not ( = ?auto_905280 ?auto_905286 ) ) ( not ( = ?auto_905280 ?auto_905287 ) ) ( not ( = ?auto_905280 ?auto_905288 ) ) ( not ( = ?auto_905280 ?auto_905289 ) ) ( not ( = ?auto_905280 ?auto_905290 ) ) ( not ( = ?auto_905280 ?auto_905291 ) ) ( not ( = ?auto_905280 ?auto_905292 ) ) ( not ( = ?auto_905280 ?auto_905293 ) ) ( not ( = ?auto_905280 ?auto_905294 ) ) ( not ( = ?auto_905280 ?auto_905295 ) ) ( not ( = ?auto_905280 ?auto_905296 ) ) ( not ( = ?auto_905281 ?auto_905282 ) ) ( not ( = ?auto_905281 ?auto_905283 ) ) ( not ( = ?auto_905281 ?auto_905284 ) ) ( not ( = ?auto_905281 ?auto_905285 ) ) ( not ( = ?auto_905281 ?auto_905286 ) ) ( not ( = ?auto_905281 ?auto_905287 ) ) ( not ( = ?auto_905281 ?auto_905288 ) ) ( not ( = ?auto_905281 ?auto_905289 ) ) ( not ( = ?auto_905281 ?auto_905290 ) ) ( not ( = ?auto_905281 ?auto_905291 ) ) ( not ( = ?auto_905281 ?auto_905292 ) ) ( not ( = ?auto_905281 ?auto_905293 ) ) ( not ( = ?auto_905281 ?auto_905294 ) ) ( not ( = ?auto_905281 ?auto_905295 ) ) ( not ( = ?auto_905281 ?auto_905296 ) ) ( not ( = ?auto_905282 ?auto_905283 ) ) ( not ( = ?auto_905282 ?auto_905284 ) ) ( not ( = ?auto_905282 ?auto_905285 ) ) ( not ( = ?auto_905282 ?auto_905286 ) ) ( not ( = ?auto_905282 ?auto_905287 ) ) ( not ( = ?auto_905282 ?auto_905288 ) ) ( not ( = ?auto_905282 ?auto_905289 ) ) ( not ( = ?auto_905282 ?auto_905290 ) ) ( not ( = ?auto_905282 ?auto_905291 ) ) ( not ( = ?auto_905282 ?auto_905292 ) ) ( not ( = ?auto_905282 ?auto_905293 ) ) ( not ( = ?auto_905282 ?auto_905294 ) ) ( not ( = ?auto_905282 ?auto_905295 ) ) ( not ( = ?auto_905282 ?auto_905296 ) ) ( not ( = ?auto_905283 ?auto_905284 ) ) ( not ( = ?auto_905283 ?auto_905285 ) ) ( not ( = ?auto_905283 ?auto_905286 ) ) ( not ( = ?auto_905283 ?auto_905287 ) ) ( not ( = ?auto_905283 ?auto_905288 ) ) ( not ( = ?auto_905283 ?auto_905289 ) ) ( not ( = ?auto_905283 ?auto_905290 ) ) ( not ( = ?auto_905283 ?auto_905291 ) ) ( not ( = ?auto_905283 ?auto_905292 ) ) ( not ( = ?auto_905283 ?auto_905293 ) ) ( not ( = ?auto_905283 ?auto_905294 ) ) ( not ( = ?auto_905283 ?auto_905295 ) ) ( not ( = ?auto_905283 ?auto_905296 ) ) ( not ( = ?auto_905284 ?auto_905285 ) ) ( not ( = ?auto_905284 ?auto_905286 ) ) ( not ( = ?auto_905284 ?auto_905287 ) ) ( not ( = ?auto_905284 ?auto_905288 ) ) ( not ( = ?auto_905284 ?auto_905289 ) ) ( not ( = ?auto_905284 ?auto_905290 ) ) ( not ( = ?auto_905284 ?auto_905291 ) ) ( not ( = ?auto_905284 ?auto_905292 ) ) ( not ( = ?auto_905284 ?auto_905293 ) ) ( not ( = ?auto_905284 ?auto_905294 ) ) ( not ( = ?auto_905284 ?auto_905295 ) ) ( not ( = ?auto_905284 ?auto_905296 ) ) ( not ( = ?auto_905285 ?auto_905286 ) ) ( not ( = ?auto_905285 ?auto_905287 ) ) ( not ( = ?auto_905285 ?auto_905288 ) ) ( not ( = ?auto_905285 ?auto_905289 ) ) ( not ( = ?auto_905285 ?auto_905290 ) ) ( not ( = ?auto_905285 ?auto_905291 ) ) ( not ( = ?auto_905285 ?auto_905292 ) ) ( not ( = ?auto_905285 ?auto_905293 ) ) ( not ( = ?auto_905285 ?auto_905294 ) ) ( not ( = ?auto_905285 ?auto_905295 ) ) ( not ( = ?auto_905285 ?auto_905296 ) ) ( not ( = ?auto_905286 ?auto_905287 ) ) ( not ( = ?auto_905286 ?auto_905288 ) ) ( not ( = ?auto_905286 ?auto_905289 ) ) ( not ( = ?auto_905286 ?auto_905290 ) ) ( not ( = ?auto_905286 ?auto_905291 ) ) ( not ( = ?auto_905286 ?auto_905292 ) ) ( not ( = ?auto_905286 ?auto_905293 ) ) ( not ( = ?auto_905286 ?auto_905294 ) ) ( not ( = ?auto_905286 ?auto_905295 ) ) ( not ( = ?auto_905286 ?auto_905296 ) ) ( not ( = ?auto_905287 ?auto_905288 ) ) ( not ( = ?auto_905287 ?auto_905289 ) ) ( not ( = ?auto_905287 ?auto_905290 ) ) ( not ( = ?auto_905287 ?auto_905291 ) ) ( not ( = ?auto_905287 ?auto_905292 ) ) ( not ( = ?auto_905287 ?auto_905293 ) ) ( not ( = ?auto_905287 ?auto_905294 ) ) ( not ( = ?auto_905287 ?auto_905295 ) ) ( not ( = ?auto_905287 ?auto_905296 ) ) ( not ( = ?auto_905288 ?auto_905289 ) ) ( not ( = ?auto_905288 ?auto_905290 ) ) ( not ( = ?auto_905288 ?auto_905291 ) ) ( not ( = ?auto_905288 ?auto_905292 ) ) ( not ( = ?auto_905288 ?auto_905293 ) ) ( not ( = ?auto_905288 ?auto_905294 ) ) ( not ( = ?auto_905288 ?auto_905295 ) ) ( not ( = ?auto_905288 ?auto_905296 ) ) ( not ( = ?auto_905289 ?auto_905290 ) ) ( not ( = ?auto_905289 ?auto_905291 ) ) ( not ( = ?auto_905289 ?auto_905292 ) ) ( not ( = ?auto_905289 ?auto_905293 ) ) ( not ( = ?auto_905289 ?auto_905294 ) ) ( not ( = ?auto_905289 ?auto_905295 ) ) ( not ( = ?auto_905289 ?auto_905296 ) ) ( not ( = ?auto_905290 ?auto_905291 ) ) ( not ( = ?auto_905290 ?auto_905292 ) ) ( not ( = ?auto_905290 ?auto_905293 ) ) ( not ( = ?auto_905290 ?auto_905294 ) ) ( not ( = ?auto_905290 ?auto_905295 ) ) ( not ( = ?auto_905290 ?auto_905296 ) ) ( not ( = ?auto_905291 ?auto_905292 ) ) ( not ( = ?auto_905291 ?auto_905293 ) ) ( not ( = ?auto_905291 ?auto_905294 ) ) ( not ( = ?auto_905291 ?auto_905295 ) ) ( not ( = ?auto_905291 ?auto_905296 ) ) ( not ( = ?auto_905292 ?auto_905293 ) ) ( not ( = ?auto_905292 ?auto_905294 ) ) ( not ( = ?auto_905292 ?auto_905295 ) ) ( not ( = ?auto_905292 ?auto_905296 ) ) ( not ( = ?auto_905293 ?auto_905294 ) ) ( not ( = ?auto_905293 ?auto_905295 ) ) ( not ( = ?auto_905293 ?auto_905296 ) ) ( not ( = ?auto_905294 ?auto_905295 ) ) ( not ( = ?auto_905294 ?auto_905296 ) ) ( not ( = ?auto_905295 ?auto_905296 ) ) ( ON ?auto_905294 ?auto_905295 ) ( ON ?auto_905293 ?auto_905294 ) ( ON ?auto_905292 ?auto_905293 ) ( ON ?auto_905291 ?auto_905292 ) ( ON ?auto_905290 ?auto_905291 ) ( ON ?auto_905289 ?auto_905290 ) ( ON ?auto_905288 ?auto_905289 ) ( ON ?auto_905287 ?auto_905288 ) ( ON ?auto_905286 ?auto_905287 ) ( ON ?auto_905285 ?auto_905286 ) ( ON ?auto_905284 ?auto_905285 ) ( ON ?auto_905283 ?auto_905284 ) ( ON ?auto_905282 ?auto_905283 ) ( CLEAR ?auto_905280 ) ( ON ?auto_905281 ?auto_905282 ) ( CLEAR ?auto_905281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_905279 ?auto_905280 ?auto_905281 )
      ( MAKE-17PILE ?auto_905279 ?auto_905280 ?auto_905281 ?auto_905282 ?auto_905283 ?auto_905284 ?auto_905285 ?auto_905286 ?auto_905287 ?auto_905288 ?auto_905289 ?auto_905290 ?auto_905291 ?auto_905292 ?auto_905293 ?auto_905294 ?auto_905295 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_905349 - BLOCK
      ?auto_905350 - BLOCK
      ?auto_905351 - BLOCK
      ?auto_905352 - BLOCK
      ?auto_905353 - BLOCK
      ?auto_905354 - BLOCK
      ?auto_905355 - BLOCK
      ?auto_905356 - BLOCK
      ?auto_905357 - BLOCK
      ?auto_905358 - BLOCK
      ?auto_905359 - BLOCK
      ?auto_905360 - BLOCK
      ?auto_905361 - BLOCK
      ?auto_905362 - BLOCK
      ?auto_905363 - BLOCK
      ?auto_905364 - BLOCK
      ?auto_905365 - BLOCK
    )
    :vars
    (
      ?auto_905366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_905365 ?auto_905366 ) ( ON-TABLE ?auto_905349 ) ( not ( = ?auto_905349 ?auto_905350 ) ) ( not ( = ?auto_905349 ?auto_905351 ) ) ( not ( = ?auto_905349 ?auto_905352 ) ) ( not ( = ?auto_905349 ?auto_905353 ) ) ( not ( = ?auto_905349 ?auto_905354 ) ) ( not ( = ?auto_905349 ?auto_905355 ) ) ( not ( = ?auto_905349 ?auto_905356 ) ) ( not ( = ?auto_905349 ?auto_905357 ) ) ( not ( = ?auto_905349 ?auto_905358 ) ) ( not ( = ?auto_905349 ?auto_905359 ) ) ( not ( = ?auto_905349 ?auto_905360 ) ) ( not ( = ?auto_905349 ?auto_905361 ) ) ( not ( = ?auto_905349 ?auto_905362 ) ) ( not ( = ?auto_905349 ?auto_905363 ) ) ( not ( = ?auto_905349 ?auto_905364 ) ) ( not ( = ?auto_905349 ?auto_905365 ) ) ( not ( = ?auto_905349 ?auto_905366 ) ) ( not ( = ?auto_905350 ?auto_905351 ) ) ( not ( = ?auto_905350 ?auto_905352 ) ) ( not ( = ?auto_905350 ?auto_905353 ) ) ( not ( = ?auto_905350 ?auto_905354 ) ) ( not ( = ?auto_905350 ?auto_905355 ) ) ( not ( = ?auto_905350 ?auto_905356 ) ) ( not ( = ?auto_905350 ?auto_905357 ) ) ( not ( = ?auto_905350 ?auto_905358 ) ) ( not ( = ?auto_905350 ?auto_905359 ) ) ( not ( = ?auto_905350 ?auto_905360 ) ) ( not ( = ?auto_905350 ?auto_905361 ) ) ( not ( = ?auto_905350 ?auto_905362 ) ) ( not ( = ?auto_905350 ?auto_905363 ) ) ( not ( = ?auto_905350 ?auto_905364 ) ) ( not ( = ?auto_905350 ?auto_905365 ) ) ( not ( = ?auto_905350 ?auto_905366 ) ) ( not ( = ?auto_905351 ?auto_905352 ) ) ( not ( = ?auto_905351 ?auto_905353 ) ) ( not ( = ?auto_905351 ?auto_905354 ) ) ( not ( = ?auto_905351 ?auto_905355 ) ) ( not ( = ?auto_905351 ?auto_905356 ) ) ( not ( = ?auto_905351 ?auto_905357 ) ) ( not ( = ?auto_905351 ?auto_905358 ) ) ( not ( = ?auto_905351 ?auto_905359 ) ) ( not ( = ?auto_905351 ?auto_905360 ) ) ( not ( = ?auto_905351 ?auto_905361 ) ) ( not ( = ?auto_905351 ?auto_905362 ) ) ( not ( = ?auto_905351 ?auto_905363 ) ) ( not ( = ?auto_905351 ?auto_905364 ) ) ( not ( = ?auto_905351 ?auto_905365 ) ) ( not ( = ?auto_905351 ?auto_905366 ) ) ( not ( = ?auto_905352 ?auto_905353 ) ) ( not ( = ?auto_905352 ?auto_905354 ) ) ( not ( = ?auto_905352 ?auto_905355 ) ) ( not ( = ?auto_905352 ?auto_905356 ) ) ( not ( = ?auto_905352 ?auto_905357 ) ) ( not ( = ?auto_905352 ?auto_905358 ) ) ( not ( = ?auto_905352 ?auto_905359 ) ) ( not ( = ?auto_905352 ?auto_905360 ) ) ( not ( = ?auto_905352 ?auto_905361 ) ) ( not ( = ?auto_905352 ?auto_905362 ) ) ( not ( = ?auto_905352 ?auto_905363 ) ) ( not ( = ?auto_905352 ?auto_905364 ) ) ( not ( = ?auto_905352 ?auto_905365 ) ) ( not ( = ?auto_905352 ?auto_905366 ) ) ( not ( = ?auto_905353 ?auto_905354 ) ) ( not ( = ?auto_905353 ?auto_905355 ) ) ( not ( = ?auto_905353 ?auto_905356 ) ) ( not ( = ?auto_905353 ?auto_905357 ) ) ( not ( = ?auto_905353 ?auto_905358 ) ) ( not ( = ?auto_905353 ?auto_905359 ) ) ( not ( = ?auto_905353 ?auto_905360 ) ) ( not ( = ?auto_905353 ?auto_905361 ) ) ( not ( = ?auto_905353 ?auto_905362 ) ) ( not ( = ?auto_905353 ?auto_905363 ) ) ( not ( = ?auto_905353 ?auto_905364 ) ) ( not ( = ?auto_905353 ?auto_905365 ) ) ( not ( = ?auto_905353 ?auto_905366 ) ) ( not ( = ?auto_905354 ?auto_905355 ) ) ( not ( = ?auto_905354 ?auto_905356 ) ) ( not ( = ?auto_905354 ?auto_905357 ) ) ( not ( = ?auto_905354 ?auto_905358 ) ) ( not ( = ?auto_905354 ?auto_905359 ) ) ( not ( = ?auto_905354 ?auto_905360 ) ) ( not ( = ?auto_905354 ?auto_905361 ) ) ( not ( = ?auto_905354 ?auto_905362 ) ) ( not ( = ?auto_905354 ?auto_905363 ) ) ( not ( = ?auto_905354 ?auto_905364 ) ) ( not ( = ?auto_905354 ?auto_905365 ) ) ( not ( = ?auto_905354 ?auto_905366 ) ) ( not ( = ?auto_905355 ?auto_905356 ) ) ( not ( = ?auto_905355 ?auto_905357 ) ) ( not ( = ?auto_905355 ?auto_905358 ) ) ( not ( = ?auto_905355 ?auto_905359 ) ) ( not ( = ?auto_905355 ?auto_905360 ) ) ( not ( = ?auto_905355 ?auto_905361 ) ) ( not ( = ?auto_905355 ?auto_905362 ) ) ( not ( = ?auto_905355 ?auto_905363 ) ) ( not ( = ?auto_905355 ?auto_905364 ) ) ( not ( = ?auto_905355 ?auto_905365 ) ) ( not ( = ?auto_905355 ?auto_905366 ) ) ( not ( = ?auto_905356 ?auto_905357 ) ) ( not ( = ?auto_905356 ?auto_905358 ) ) ( not ( = ?auto_905356 ?auto_905359 ) ) ( not ( = ?auto_905356 ?auto_905360 ) ) ( not ( = ?auto_905356 ?auto_905361 ) ) ( not ( = ?auto_905356 ?auto_905362 ) ) ( not ( = ?auto_905356 ?auto_905363 ) ) ( not ( = ?auto_905356 ?auto_905364 ) ) ( not ( = ?auto_905356 ?auto_905365 ) ) ( not ( = ?auto_905356 ?auto_905366 ) ) ( not ( = ?auto_905357 ?auto_905358 ) ) ( not ( = ?auto_905357 ?auto_905359 ) ) ( not ( = ?auto_905357 ?auto_905360 ) ) ( not ( = ?auto_905357 ?auto_905361 ) ) ( not ( = ?auto_905357 ?auto_905362 ) ) ( not ( = ?auto_905357 ?auto_905363 ) ) ( not ( = ?auto_905357 ?auto_905364 ) ) ( not ( = ?auto_905357 ?auto_905365 ) ) ( not ( = ?auto_905357 ?auto_905366 ) ) ( not ( = ?auto_905358 ?auto_905359 ) ) ( not ( = ?auto_905358 ?auto_905360 ) ) ( not ( = ?auto_905358 ?auto_905361 ) ) ( not ( = ?auto_905358 ?auto_905362 ) ) ( not ( = ?auto_905358 ?auto_905363 ) ) ( not ( = ?auto_905358 ?auto_905364 ) ) ( not ( = ?auto_905358 ?auto_905365 ) ) ( not ( = ?auto_905358 ?auto_905366 ) ) ( not ( = ?auto_905359 ?auto_905360 ) ) ( not ( = ?auto_905359 ?auto_905361 ) ) ( not ( = ?auto_905359 ?auto_905362 ) ) ( not ( = ?auto_905359 ?auto_905363 ) ) ( not ( = ?auto_905359 ?auto_905364 ) ) ( not ( = ?auto_905359 ?auto_905365 ) ) ( not ( = ?auto_905359 ?auto_905366 ) ) ( not ( = ?auto_905360 ?auto_905361 ) ) ( not ( = ?auto_905360 ?auto_905362 ) ) ( not ( = ?auto_905360 ?auto_905363 ) ) ( not ( = ?auto_905360 ?auto_905364 ) ) ( not ( = ?auto_905360 ?auto_905365 ) ) ( not ( = ?auto_905360 ?auto_905366 ) ) ( not ( = ?auto_905361 ?auto_905362 ) ) ( not ( = ?auto_905361 ?auto_905363 ) ) ( not ( = ?auto_905361 ?auto_905364 ) ) ( not ( = ?auto_905361 ?auto_905365 ) ) ( not ( = ?auto_905361 ?auto_905366 ) ) ( not ( = ?auto_905362 ?auto_905363 ) ) ( not ( = ?auto_905362 ?auto_905364 ) ) ( not ( = ?auto_905362 ?auto_905365 ) ) ( not ( = ?auto_905362 ?auto_905366 ) ) ( not ( = ?auto_905363 ?auto_905364 ) ) ( not ( = ?auto_905363 ?auto_905365 ) ) ( not ( = ?auto_905363 ?auto_905366 ) ) ( not ( = ?auto_905364 ?auto_905365 ) ) ( not ( = ?auto_905364 ?auto_905366 ) ) ( not ( = ?auto_905365 ?auto_905366 ) ) ( ON ?auto_905364 ?auto_905365 ) ( ON ?auto_905363 ?auto_905364 ) ( ON ?auto_905362 ?auto_905363 ) ( ON ?auto_905361 ?auto_905362 ) ( ON ?auto_905360 ?auto_905361 ) ( ON ?auto_905359 ?auto_905360 ) ( ON ?auto_905358 ?auto_905359 ) ( ON ?auto_905357 ?auto_905358 ) ( ON ?auto_905356 ?auto_905357 ) ( ON ?auto_905355 ?auto_905356 ) ( ON ?auto_905354 ?auto_905355 ) ( ON ?auto_905353 ?auto_905354 ) ( ON ?auto_905352 ?auto_905353 ) ( ON ?auto_905351 ?auto_905352 ) ( CLEAR ?auto_905349 ) ( ON ?auto_905350 ?auto_905351 ) ( CLEAR ?auto_905350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_905349 ?auto_905350 )
      ( MAKE-17PILE ?auto_905349 ?auto_905350 ?auto_905351 ?auto_905352 ?auto_905353 ?auto_905354 ?auto_905355 ?auto_905356 ?auto_905357 ?auto_905358 ?auto_905359 ?auto_905360 ?auto_905361 ?auto_905362 ?auto_905363 ?auto_905364 ?auto_905365 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_905419 - BLOCK
      ?auto_905420 - BLOCK
      ?auto_905421 - BLOCK
      ?auto_905422 - BLOCK
      ?auto_905423 - BLOCK
      ?auto_905424 - BLOCK
      ?auto_905425 - BLOCK
      ?auto_905426 - BLOCK
      ?auto_905427 - BLOCK
      ?auto_905428 - BLOCK
      ?auto_905429 - BLOCK
      ?auto_905430 - BLOCK
      ?auto_905431 - BLOCK
      ?auto_905432 - BLOCK
      ?auto_905433 - BLOCK
      ?auto_905434 - BLOCK
      ?auto_905435 - BLOCK
    )
    :vars
    (
      ?auto_905436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_905435 ?auto_905436 ) ( not ( = ?auto_905419 ?auto_905420 ) ) ( not ( = ?auto_905419 ?auto_905421 ) ) ( not ( = ?auto_905419 ?auto_905422 ) ) ( not ( = ?auto_905419 ?auto_905423 ) ) ( not ( = ?auto_905419 ?auto_905424 ) ) ( not ( = ?auto_905419 ?auto_905425 ) ) ( not ( = ?auto_905419 ?auto_905426 ) ) ( not ( = ?auto_905419 ?auto_905427 ) ) ( not ( = ?auto_905419 ?auto_905428 ) ) ( not ( = ?auto_905419 ?auto_905429 ) ) ( not ( = ?auto_905419 ?auto_905430 ) ) ( not ( = ?auto_905419 ?auto_905431 ) ) ( not ( = ?auto_905419 ?auto_905432 ) ) ( not ( = ?auto_905419 ?auto_905433 ) ) ( not ( = ?auto_905419 ?auto_905434 ) ) ( not ( = ?auto_905419 ?auto_905435 ) ) ( not ( = ?auto_905419 ?auto_905436 ) ) ( not ( = ?auto_905420 ?auto_905421 ) ) ( not ( = ?auto_905420 ?auto_905422 ) ) ( not ( = ?auto_905420 ?auto_905423 ) ) ( not ( = ?auto_905420 ?auto_905424 ) ) ( not ( = ?auto_905420 ?auto_905425 ) ) ( not ( = ?auto_905420 ?auto_905426 ) ) ( not ( = ?auto_905420 ?auto_905427 ) ) ( not ( = ?auto_905420 ?auto_905428 ) ) ( not ( = ?auto_905420 ?auto_905429 ) ) ( not ( = ?auto_905420 ?auto_905430 ) ) ( not ( = ?auto_905420 ?auto_905431 ) ) ( not ( = ?auto_905420 ?auto_905432 ) ) ( not ( = ?auto_905420 ?auto_905433 ) ) ( not ( = ?auto_905420 ?auto_905434 ) ) ( not ( = ?auto_905420 ?auto_905435 ) ) ( not ( = ?auto_905420 ?auto_905436 ) ) ( not ( = ?auto_905421 ?auto_905422 ) ) ( not ( = ?auto_905421 ?auto_905423 ) ) ( not ( = ?auto_905421 ?auto_905424 ) ) ( not ( = ?auto_905421 ?auto_905425 ) ) ( not ( = ?auto_905421 ?auto_905426 ) ) ( not ( = ?auto_905421 ?auto_905427 ) ) ( not ( = ?auto_905421 ?auto_905428 ) ) ( not ( = ?auto_905421 ?auto_905429 ) ) ( not ( = ?auto_905421 ?auto_905430 ) ) ( not ( = ?auto_905421 ?auto_905431 ) ) ( not ( = ?auto_905421 ?auto_905432 ) ) ( not ( = ?auto_905421 ?auto_905433 ) ) ( not ( = ?auto_905421 ?auto_905434 ) ) ( not ( = ?auto_905421 ?auto_905435 ) ) ( not ( = ?auto_905421 ?auto_905436 ) ) ( not ( = ?auto_905422 ?auto_905423 ) ) ( not ( = ?auto_905422 ?auto_905424 ) ) ( not ( = ?auto_905422 ?auto_905425 ) ) ( not ( = ?auto_905422 ?auto_905426 ) ) ( not ( = ?auto_905422 ?auto_905427 ) ) ( not ( = ?auto_905422 ?auto_905428 ) ) ( not ( = ?auto_905422 ?auto_905429 ) ) ( not ( = ?auto_905422 ?auto_905430 ) ) ( not ( = ?auto_905422 ?auto_905431 ) ) ( not ( = ?auto_905422 ?auto_905432 ) ) ( not ( = ?auto_905422 ?auto_905433 ) ) ( not ( = ?auto_905422 ?auto_905434 ) ) ( not ( = ?auto_905422 ?auto_905435 ) ) ( not ( = ?auto_905422 ?auto_905436 ) ) ( not ( = ?auto_905423 ?auto_905424 ) ) ( not ( = ?auto_905423 ?auto_905425 ) ) ( not ( = ?auto_905423 ?auto_905426 ) ) ( not ( = ?auto_905423 ?auto_905427 ) ) ( not ( = ?auto_905423 ?auto_905428 ) ) ( not ( = ?auto_905423 ?auto_905429 ) ) ( not ( = ?auto_905423 ?auto_905430 ) ) ( not ( = ?auto_905423 ?auto_905431 ) ) ( not ( = ?auto_905423 ?auto_905432 ) ) ( not ( = ?auto_905423 ?auto_905433 ) ) ( not ( = ?auto_905423 ?auto_905434 ) ) ( not ( = ?auto_905423 ?auto_905435 ) ) ( not ( = ?auto_905423 ?auto_905436 ) ) ( not ( = ?auto_905424 ?auto_905425 ) ) ( not ( = ?auto_905424 ?auto_905426 ) ) ( not ( = ?auto_905424 ?auto_905427 ) ) ( not ( = ?auto_905424 ?auto_905428 ) ) ( not ( = ?auto_905424 ?auto_905429 ) ) ( not ( = ?auto_905424 ?auto_905430 ) ) ( not ( = ?auto_905424 ?auto_905431 ) ) ( not ( = ?auto_905424 ?auto_905432 ) ) ( not ( = ?auto_905424 ?auto_905433 ) ) ( not ( = ?auto_905424 ?auto_905434 ) ) ( not ( = ?auto_905424 ?auto_905435 ) ) ( not ( = ?auto_905424 ?auto_905436 ) ) ( not ( = ?auto_905425 ?auto_905426 ) ) ( not ( = ?auto_905425 ?auto_905427 ) ) ( not ( = ?auto_905425 ?auto_905428 ) ) ( not ( = ?auto_905425 ?auto_905429 ) ) ( not ( = ?auto_905425 ?auto_905430 ) ) ( not ( = ?auto_905425 ?auto_905431 ) ) ( not ( = ?auto_905425 ?auto_905432 ) ) ( not ( = ?auto_905425 ?auto_905433 ) ) ( not ( = ?auto_905425 ?auto_905434 ) ) ( not ( = ?auto_905425 ?auto_905435 ) ) ( not ( = ?auto_905425 ?auto_905436 ) ) ( not ( = ?auto_905426 ?auto_905427 ) ) ( not ( = ?auto_905426 ?auto_905428 ) ) ( not ( = ?auto_905426 ?auto_905429 ) ) ( not ( = ?auto_905426 ?auto_905430 ) ) ( not ( = ?auto_905426 ?auto_905431 ) ) ( not ( = ?auto_905426 ?auto_905432 ) ) ( not ( = ?auto_905426 ?auto_905433 ) ) ( not ( = ?auto_905426 ?auto_905434 ) ) ( not ( = ?auto_905426 ?auto_905435 ) ) ( not ( = ?auto_905426 ?auto_905436 ) ) ( not ( = ?auto_905427 ?auto_905428 ) ) ( not ( = ?auto_905427 ?auto_905429 ) ) ( not ( = ?auto_905427 ?auto_905430 ) ) ( not ( = ?auto_905427 ?auto_905431 ) ) ( not ( = ?auto_905427 ?auto_905432 ) ) ( not ( = ?auto_905427 ?auto_905433 ) ) ( not ( = ?auto_905427 ?auto_905434 ) ) ( not ( = ?auto_905427 ?auto_905435 ) ) ( not ( = ?auto_905427 ?auto_905436 ) ) ( not ( = ?auto_905428 ?auto_905429 ) ) ( not ( = ?auto_905428 ?auto_905430 ) ) ( not ( = ?auto_905428 ?auto_905431 ) ) ( not ( = ?auto_905428 ?auto_905432 ) ) ( not ( = ?auto_905428 ?auto_905433 ) ) ( not ( = ?auto_905428 ?auto_905434 ) ) ( not ( = ?auto_905428 ?auto_905435 ) ) ( not ( = ?auto_905428 ?auto_905436 ) ) ( not ( = ?auto_905429 ?auto_905430 ) ) ( not ( = ?auto_905429 ?auto_905431 ) ) ( not ( = ?auto_905429 ?auto_905432 ) ) ( not ( = ?auto_905429 ?auto_905433 ) ) ( not ( = ?auto_905429 ?auto_905434 ) ) ( not ( = ?auto_905429 ?auto_905435 ) ) ( not ( = ?auto_905429 ?auto_905436 ) ) ( not ( = ?auto_905430 ?auto_905431 ) ) ( not ( = ?auto_905430 ?auto_905432 ) ) ( not ( = ?auto_905430 ?auto_905433 ) ) ( not ( = ?auto_905430 ?auto_905434 ) ) ( not ( = ?auto_905430 ?auto_905435 ) ) ( not ( = ?auto_905430 ?auto_905436 ) ) ( not ( = ?auto_905431 ?auto_905432 ) ) ( not ( = ?auto_905431 ?auto_905433 ) ) ( not ( = ?auto_905431 ?auto_905434 ) ) ( not ( = ?auto_905431 ?auto_905435 ) ) ( not ( = ?auto_905431 ?auto_905436 ) ) ( not ( = ?auto_905432 ?auto_905433 ) ) ( not ( = ?auto_905432 ?auto_905434 ) ) ( not ( = ?auto_905432 ?auto_905435 ) ) ( not ( = ?auto_905432 ?auto_905436 ) ) ( not ( = ?auto_905433 ?auto_905434 ) ) ( not ( = ?auto_905433 ?auto_905435 ) ) ( not ( = ?auto_905433 ?auto_905436 ) ) ( not ( = ?auto_905434 ?auto_905435 ) ) ( not ( = ?auto_905434 ?auto_905436 ) ) ( not ( = ?auto_905435 ?auto_905436 ) ) ( ON ?auto_905434 ?auto_905435 ) ( ON ?auto_905433 ?auto_905434 ) ( ON ?auto_905432 ?auto_905433 ) ( ON ?auto_905431 ?auto_905432 ) ( ON ?auto_905430 ?auto_905431 ) ( ON ?auto_905429 ?auto_905430 ) ( ON ?auto_905428 ?auto_905429 ) ( ON ?auto_905427 ?auto_905428 ) ( ON ?auto_905426 ?auto_905427 ) ( ON ?auto_905425 ?auto_905426 ) ( ON ?auto_905424 ?auto_905425 ) ( ON ?auto_905423 ?auto_905424 ) ( ON ?auto_905422 ?auto_905423 ) ( ON ?auto_905421 ?auto_905422 ) ( ON ?auto_905420 ?auto_905421 ) ( ON ?auto_905419 ?auto_905420 ) ( CLEAR ?auto_905419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_905419 )
      ( MAKE-17PILE ?auto_905419 ?auto_905420 ?auto_905421 ?auto_905422 ?auto_905423 ?auto_905424 ?auto_905425 ?auto_905426 ?auto_905427 ?auto_905428 ?auto_905429 ?auto_905430 ?auto_905431 ?auto_905432 ?auto_905433 ?auto_905434 ?auto_905435 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905490 - BLOCK
      ?auto_905491 - BLOCK
      ?auto_905492 - BLOCK
      ?auto_905493 - BLOCK
      ?auto_905494 - BLOCK
      ?auto_905495 - BLOCK
      ?auto_905496 - BLOCK
      ?auto_905497 - BLOCK
      ?auto_905498 - BLOCK
      ?auto_905499 - BLOCK
      ?auto_905500 - BLOCK
      ?auto_905501 - BLOCK
      ?auto_905502 - BLOCK
      ?auto_905503 - BLOCK
      ?auto_905504 - BLOCK
      ?auto_905505 - BLOCK
      ?auto_905506 - BLOCK
      ?auto_905507 - BLOCK
    )
    :vars
    (
      ?auto_905508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_905506 ) ( ON ?auto_905507 ?auto_905508 ) ( CLEAR ?auto_905507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_905490 ) ( ON ?auto_905491 ?auto_905490 ) ( ON ?auto_905492 ?auto_905491 ) ( ON ?auto_905493 ?auto_905492 ) ( ON ?auto_905494 ?auto_905493 ) ( ON ?auto_905495 ?auto_905494 ) ( ON ?auto_905496 ?auto_905495 ) ( ON ?auto_905497 ?auto_905496 ) ( ON ?auto_905498 ?auto_905497 ) ( ON ?auto_905499 ?auto_905498 ) ( ON ?auto_905500 ?auto_905499 ) ( ON ?auto_905501 ?auto_905500 ) ( ON ?auto_905502 ?auto_905501 ) ( ON ?auto_905503 ?auto_905502 ) ( ON ?auto_905504 ?auto_905503 ) ( ON ?auto_905505 ?auto_905504 ) ( ON ?auto_905506 ?auto_905505 ) ( not ( = ?auto_905490 ?auto_905491 ) ) ( not ( = ?auto_905490 ?auto_905492 ) ) ( not ( = ?auto_905490 ?auto_905493 ) ) ( not ( = ?auto_905490 ?auto_905494 ) ) ( not ( = ?auto_905490 ?auto_905495 ) ) ( not ( = ?auto_905490 ?auto_905496 ) ) ( not ( = ?auto_905490 ?auto_905497 ) ) ( not ( = ?auto_905490 ?auto_905498 ) ) ( not ( = ?auto_905490 ?auto_905499 ) ) ( not ( = ?auto_905490 ?auto_905500 ) ) ( not ( = ?auto_905490 ?auto_905501 ) ) ( not ( = ?auto_905490 ?auto_905502 ) ) ( not ( = ?auto_905490 ?auto_905503 ) ) ( not ( = ?auto_905490 ?auto_905504 ) ) ( not ( = ?auto_905490 ?auto_905505 ) ) ( not ( = ?auto_905490 ?auto_905506 ) ) ( not ( = ?auto_905490 ?auto_905507 ) ) ( not ( = ?auto_905490 ?auto_905508 ) ) ( not ( = ?auto_905491 ?auto_905492 ) ) ( not ( = ?auto_905491 ?auto_905493 ) ) ( not ( = ?auto_905491 ?auto_905494 ) ) ( not ( = ?auto_905491 ?auto_905495 ) ) ( not ( = ?auto_905491 ?auto_905496 ) ) ( not ( = ?auto_905491 ?auto_905497 ) ) ( not ( = ?auto_905491 ?auto_905498 ) ) ( not ( = ?auto_905491 ?auto_905499 ) ) ( not ( = ?auto_905491 ?auto_905500 ) ) ( not ( = ?auto_905491 ?auto_905501 ) ) ( not ( = ?auto_905491 ?auto_905502 ) ) ( not ( = ?auto_905491 ?auto_905503 ) ) ( not ( = ?auto_905491 ?auto_905504 ) ) ( not ( = ?auto_905491 ?auto_905505 ) ) ( not ( = ?auto_905491 ?auto_905506 ) ) ( not ( = ?auto_905491 ?auto_905507 ) ) ( not ( = ?auto_905491 ?auto_905508 ) ) ( not ( = ?auto_905492 ?auto_905493 ) ) ( not ( = ?auto_905492 ?auto_905494 ) ) ( not ( = ?auto_905492 ?auto_905495 ) ) ( not ( = ?auto_905492 ?auto_905496 ) ) ( not ( = ?auto_905492 ?auto_905497 ) ) ( not ( = ?auto_905492 ?auto_905498 ) ) ( not ( = ?auto_905492 ?auto_905499 ) ) ( not ( = ?auto_905492 ?auto_905500 ) ) ( not ( = ?auto_905492 ?auto_905501 ) ) ( not ( = ?auto_905492 ?auto_905502 ) ) ( not ( = ?auto_905492 ?auto_905503 ) ) ( not ( = ?auto_905492 ?auto_905504 ) ) ( not ( = ?auto_905492 ?auto_905505 ) ) ( not ( = ?auto_905492 ?auto_905506 ) ) ( not ( = ?auto_905492 ?auto_905507 ) ) ( not ( = ?auto_905492 ?auto_905508 ) ) ( not ( = ?auto_905493 ?auto_905494 ) ) ( not ( = ?auto_905493 ?auto_905495 ) ) ( not ( = ?auto_905493 ?auto_905496 ) ) ( not ( = ?auto_905493 ?auto_905497 ) ) ( not ( = ?auto_905493 ?auto_905498 ) ) ( not ( = ?auto_905493 ?auto_905499 ) ) ( not ( = ?auto_905493 ?auto_905500 ) ) ( not ( = ?auto_905493 ?auto_905501 ) ) ( not ( = ?auto_905493 ?auto_905502 ) ) ( not ( = ?auto_905493 ?auto_905503 ) ) ( not ( = ?auto_905493 ?auto_905504 ) ) ( not ( = ?auto_905493 ?auto_905505 ) ) ( not ( = ?auto_905493 ?auto_905506 ) ) ( not ( = ?auto_905493 ?auto_905507 ) ) ( not ( = ?auto_905493 ?auto_905508 ) ) ( not ( = ?auto_905494 ?auto_905495 ) ) ( not ( = ?auto_905494 ?auto_905496 ) ) ( not ( = ?auto_905494 ?auto_905497 ) ) ( not ( = ?auto_905494 ?auto_905498 ) ) ( not ( = ?auto_905494 ?auto_905499 ) ) ( not ( = ?auto_905494 ?auto_905500 ) ) ( not ( = ?auto_905494 ?auto_905501 ) ) ( not ( = ?auto_905494 ?auto_905502 ) ) ( not ( = ?auto_905494 ?auto_905503 ) ) ( not ( = ?auto_905494 ?auto_905504 ) ) ( not ( = ?auto_905494 ?auto_905505 ) ) ( not ( = ?auto_905494 ?auto_905506 ) ) ( not ( = ?auto_905494 ?auto_905507 ) ) ( not ( = ?auto_905494 ?auto_905508 ) ) ( not ( = ?auto_905495 ?auto_905496 ) ) ( not ( = ?auto_905495 ?auto_905497 ) ) ( not ( = ?auto_905495 ?auto_905498 ) ) ( not ( = ?auto_905495 ?auto_905499 ) ) ( not ( = ?auto_905495 ?auto_905500 ) ) ( not ( = ?auto_905495 ?auto_905501 ) ) ( not ( = ?auto_905495 ?auto_905502 ) ) ( not ( = ?auto_905495 ?auto_905503 ) ) ( not ( = ?auto_905495 ?auto_905504 ) ) ( not ( = ?auto_905495 ?auto_905505 ) ) ( not ( = ?auto_905495 ?auto_905506 ) ) ( not ( = ?auto_905495 ?auto_905507 ) ) ( not ( = ?auto_905495 ?auto_905508 ) ) ( not ( = ?auto_905496 ?auto_905497 ) ) ( not ( = ?auto_905496 ?auto_905498 ) ) ( not ( = ?auto_905496 ?auto_905499 ) ) ( not ( = ?auto_905496 ?auto_905500 ) ) ( not ( = ?auto_905496 ?auto_905501 ) ) ( not ( = ?auto_905496 ?auto_905502 ) ) ( not ( = ?auto_905496 ?auto_905503 ) ) ( not ( = ?auto_905496 ?auto_905504 ) ) ( not ( = ?auto_905496 ?auto_905505 ) ) ( not ( = ?auto_905496 ?auto_905506 ) ) ( not ( = ?auto_905496 ?auto_905507 ) ) ( not ( = ?auto_905496 ?auto_905508 ) ) ( not ( = ?auto_905497 ?auto_905498 ) ) ( not ( = ?auto_905497 ?auto_905499 ) ) ( not ( = ?auto_905497 ?auto_905500 ) ) ( not ( = ?auto_905497 ?auto_905501 ) ) ( not ( = ?auto_905497 ?auto_905502 ) ) ( not ( = ?auto_905497 ?auto_905503 ) ) ( not ( = ?auto_905497 ?auto_905504 ) ) ( not ( = ?auto_905497 ?auto_905505 ) ) ( not ( = ?auto_905497 ?auto_905506 ) ) ( not ( = ?auto_905497 ?auto_905507 ) ) ( not ( = ?auto_905497 ?auto_905508 ) ) ( not ( = ?auto_905498 ?auto_905499 ) ) ( not ( = ?auto_905498 ?auto_905500 ) ) ( not ( = ?auto_905498 ?auto_905501 ) ) ( not ( = ?auto_905498 ?auto_905502 ) ) ( not ( = ?auto_905498 ?auto_905503 ) ) ( not ( = ?auto_905498 ?auto_905504 ) ) ( not ( = ?auto_905498 ?auto_905505 ) ) ( not ( = ?auto_905498 ?auto_905506 ) ) ( not ( = ?auto_905498 ?auto_905507 ) ) ( not ( = ?auto_905498 ?auto_905508 ) ) ( not ( = ?auto_905499 ?auto_905500 ) ) ( not ( = ?auto_905499 ?auto_905501 ) ) ( not ( = ?auto_905499 ?auto_905502 ) ) ( not ( = ?auto_905499 ?auto_905503 ) ) ( not ( = ?auto_905499 ?auto_905504 ) ) ( not ( = ?auto_905499 ?auto_905505 ) ) ( not ( = ?auto_905499 ?auto_905506 ) ) ( not ( = ?auto_905499 ?auto_905507 ) ) ( not ( = ?auto_905499 ?auto_905508 ) ) ( not ( = ?auto_905500 ?auto_905501 ) ) ( not ( = ?auto_905500 ?auto_905502 ) ) ( not ( = ?auto_905500 ?auto_905503 ) ) ( not ( = ?auto_905500 ?auto_905504 ) ) ( not ( = ?auto_905500 ?auto_905505 ) ) ( not ( = ?auto_905500 ?auto_905506 ) ) ( not ( = ?auto_905500 ?auto_905507 ) ) ( not ( = ?auto_905500 ?auto_905508 ) ) ( not ( = ?auto_905501 ?auto_905502 ) ) ( not ( = ?auto_905501 ?auto_905503 ) ) ( not ( = ?auto_905501 ?auto_905504 ) ) ( not ( = ?auto_905501 ?auto_905505 ) ) ( not ( = ?auto_905501 ?auto_905506 ) ) ( not ( = ?auto_905501 ?auto_905507 ) ) ( not ( = ?auto_905501 ?auto_905508 ) ) ( not ( = ?auto_905502 ?auto_905503 ) ) ( not ( = ?auto_905502 ?auto_905504 ) ) ( not ( = ?auto_905502 ?auto_905505 ) ) ( not ( = ?auto_905502 ?auto_905506 ) ) ( not ( = ?auto_905502 ?auto_905507 ) ) ( not ( = ?auto_905502 ?auto_905508 ) ) ( not ( = ?auto_905503 ?auto_905504 ) ) ( not ( = ?auto_905503 ?auto_905505 ) ) ( not ( = ?auto_905503 ?auto_905506 ) ) ( not ( = ?auto_905503 ?auto_905507 ) ) ( not ( = ?auto_905503 ?auto_905508 ) ) ( not ( = ?auto_905504 ?auto_905505 ) ) ( not ( = ?auto_905504 ?auto_905506 ) ) ( not ( = ?auto_905504 ?auto_905507 ) ) ( not ( = ?auto_905504 ?auto_905508 ) ) ( not ( = ?auto_905505 ?auto_905506 ) ) ( not ( = ?auto_905505 ?auto_905507 ) ) ( not ( = ?auto_905505 ?auto_905508 ) ) ( not ( = ?auto_905506 ?auto_905507 ) ) ( not ( = ?auto_905506 ?auto_905508 ) ) ( not ( = ?auto_905507 ?auto_905508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_905507 ?auto_905508 )
      ( !STACK ?auto_905507 ?auto_905506 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905527 - BLOCK
      ?auto_905528 - BLOCK
      ?auto_905529 - BLOCK
      ?auto_905530 - BLOCK
      ?auto_905531 - BLOCK
      ?auto_905532 - BLOCK
      ?auto_905533 - BLOCK
      ?auto_905534 - BLOCK
      ?auto_905535 - BLOCK
      ?auto_905536 - BLOCK
      ?auto_905537 - BLOCK
      ?auto_905538 - BLOCK
      ?auto_905539 - BLOCK
      ?auto_905540 - BLOCK
      ?auto_905541 - BLOCK
      ?auto_905542 - BLOCK
      ?auto_905543 - BLOCK
      ?auto_905544 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_905543 ) ( ON-TABLE ?auto_905544 ) ( CLEAR ?auto_905544 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_905527 ) ( ON ?auto_905528 ?auto_905527 ) ( ON ?auto_905529 ?auto_905528 ) ( ON ?auto_905530 ?auto_905529 ) ( ON ?auto_905531 ?auto_905530 ) ( ON ?auto_905532 ?auto_905531 ) ( ON ?auto_905533 ?auto_905532 ) ( ON ?auto_905534 ?auto_905533 ) ( ON ?auto_905535 ?auto_905534 ) ( ON ?auto_905536 ?auto_905535 ) ( ON ?auto_905537 ?auto_905536 ) ( ON ?auto_905538 ?auto_905537 ) ( ON ?auto_905539 ?auto_905538 ) ( ON ?auto_905540 ?auto_905539 ) ( ON ?auto_905541 ?auto_905540 ) ( ON ?auto_905542 ?auto_905541 ) ( ON ?auto_905543 ?auto_905542 ) ( not ( = ?auto_905527 ?auto_905528 ) ) ( not ( = ?auto_905527 ?auto_905529 ) ) ( not ( = ?auto_905527 ?auto_905530 ) ) ( not ( = ?auto_905527 ?auto_905531 ) ) ( not ( = ?auto_905527 ?auto_905532 ) ) ( not ( = ?auto_905527 ?auto_905533 ) ) ( not ( = ?auto_905527 ?auto_905534 ) ) ( not ( = ?auto_905527 ?auto_905535 ) ) ( not ( = ?auto_905527 ?auto_905536 ) ) ( not ( = ?auto_905527 ?auto_905537 ) ) ( not ( = ?auto_905527 ?auto_905538 ) ) ( not ( = ?auto_905527 ?auto_905539 ) ) ( not ( = ?auto_905527 ?auto_905540 ) ) ( not ( = ?auto_905527 ?auto_905541 ) ) ( not ( = ?auto_905527 ?auto_905542 ) ) ( not ( = ?auto_905527 ?auto_905543 ) ) ( not ( = ?auto_905527 ?auto_905544 ) ) ( not ( = ?auto_905528 ?auto_905529 ) ) ( not ( = ?auto_905528 ?auto_905530 ) ) ( not ( = ?auto_905528 ?auto_905531 ) ) ( not ( = ?auto_905528 ?auto_905532 ) ) ( not ( = ?auto_905528 ?auto_905533 ) ) ( not ( = ?auto_905528 ?auto_905534 ) ) ( not ( = ?auto_905528 ?auto_905535 ) ) ( not ( = ?auto_905528 ?auto_905536 ) ) ( not ( = ?auto_905528 ?auto_905537 ) ) ( not ( = ?auto_905528 ?auto_905538 ) ) ( not ( = ?auto_905528 ?auto_905539 ) ) ( not ( = ?auto_905528 ?auto_905540 ) ) ( not ( = ?auto_905528 ?auto_905541 ) ) ( not ( = ?auto_905528 ?auto_905542 ) ) ( not ( = ?auto_905528 ?auto_905543 ) ) ( not ( = ?auto_905528 ?auto_905544 ) ) ( not ( = ?auto_905529 ?auto_905530 ) ) ( not ( = ?auto_905529 ?auto_905531 ) ) ( not ( = ?auto_905529 ?auto_905532 ) ) ( not ( = ?auto_905529 ?auto_905533 ) ) ( not ( = ?auto_905529 ?auto_905534 ) ) ( not ( = ?auto_905529 ?auto_905535 ) ) ( not ( = ?auto_905529 ?auto_905536 ) ) ( not ( = ?auto_905529 ?auto_905537 ) ) ( not ( = ?auto_905529 ?auto_905538 ) ) ( not ( = ?auto_905529 ?auto_905539 ) ) ( not ( = ?auto_905529 ?auto_905540 ) ) ( not ( = ?auto_905529 ?auto_905541 ) ) ( not ( = ?auto_905529 ?auto_905542 ) ) ( not ( = ?auto_905529 ?auto_905543 ) ) ( not ( = ?auto_905529 ?auto_905544 ) ) ( not ( = ?auto_905530 ?auto_905531 ) ) ( not ( = ?auto_905530 ?auto_905532 ) ) ( not ( = ?auto_905530 ?auto_905533 ) ) ( not ( = ?auto_905530 ?auto_905534 ) ) ( not ( = ?auto_905530 ?auto_905535 ) ) ( not ( = ?auto_905530 ?auto_905536 ) ) ( not ( = ?auto_905530 ?auto_905537 ) ) ( not ( = ?auto_905530 ?auto_905538 ) ) ( not ( = ?auto_905530 ?auto_905539 ) ) ( not ( = ?auto_905530 ?auto_905540 ) ) ( not ( = ?auto_905530 ?auto_905541 ) ) ( not ( = ?auto_905530 ?auto_905542 ) ) ( not ( = ?auto_905530 ?auto_905543 ) ) ( not ( = ?auto_905530 ?auto_905544 ) ) ( not ( = ?auto_905531 ?auto_905532 ) ) ( not ( = ?auto_905531 ?auto_905533 ) ) ( not ( = ?auto_905531 ?auto_905534 ) ) ( not ( = ?auto_905531 ?auto_905535 ) ) ( not ( = ?auto_905531 ?auto_905536 ) ) ( not ( = ?auto_905531 ?auto_905537 ) ) ( not ( = ?auto_905531 ?auto_905538 ) ) ( not ( = ?auto_905531 ?auto_905539 ) ) ( not ( = ?auto_905531 ?auto_905540 ) ) ( not ( = ?auto_905531 ?auto_905541 ) ) ( not ( = ?auto_905531 ?auto_905542 ) ) ( not ( = ?auto_905531 ?auto_905543 ) ) ( not ( = ?auto_905531 ?auto_905544 ) ) ( not ( = ?auto_905532 ?auto_905533 ) ) ( not ( = ?auto_905532 ?auto_905534 ) ) ( not ( = ?auto_905532 ?auto_905535 ) ) ( not ( = ?auto_905532 ?auto_905536 ) ) ( not ( = ?auto_905532 ?auto_905537 ) ) ( not ( = ?auto_905532 ?auto_905538 ) ) ( not ( = ?auto_905532 ?auto_905539 ) ) ( not ( = ?auto_905532 ?auto_905540 ) ) ( not ( = ?auto_905532 ?auto_905541 ) ) ( not ( = ?auto_905532 ?auto_905542 ) ) ( not ( = ?auto_905532 ?auto_905543 ) ) ( not ( = ?auto_905532 ?auto_905544 ) ) ( not ( = ?auto_905533 ?auto_905534 ) ) ( not ( = ?auto_905533 ?auto_905535 ) ) ( not ( = ?auto_905533 ?auto_905536 ) ) ( not ( = ?auto_905533 ?auto_905537 ) ) ( not ( = ?auto_905533 ?auto_905538 ) ) ( not ( = ?auto_905533 ?auto_905539 ) ) ( not ( = ?auto_905533 ?auto_905540 ) ) ( not ( = ?auto_905533 ?auto_905541 ) ) ( not ( = ?auto_905533 ?auto_905542 ) ) ( not ( = ?auto_905533 ?auto_905543 ) ) ( not ( = ?auto_905533 ?auto_905544 ) ) ( not ( = ?auto_905534 ?auto_905535 ) ) ( not ( = ?auto_905534 ?auto_905536 ) ) ( not ( = ?auto_905534 ?auto_905537 ) ) ( not ( = ?auto_905534 ?auto_905538 ) ) ( not ( = ?auto_905534 ?auto_905539 ) ) ( not ( = ?auto_905534 ?auto_905540 ) ) ( not ( = ?auto_905534 ?auto_905541 ) ) ( not ( = ?auto_905534 ?auto_905542 ) ) ( not ( = ?auto_905534 ?auto_905543 ) ) ( not ( = ?auto_905534 ?auto_905544 ) ) ( not ( = ?auto_905535 ?auto_905536 ) ) ( not ( = ?auto_905535 ?auto_905537 ) ) ( not ( = ?auto_905535 ?auto_905538 ) ) ( not ( = ?auto_905535 ?auto_905539 ) ) ( not ( = ?auto_905535 ?auto_905540 ) ) ( not ( = ?auto_905535 ?auto_905541 ) ) ( not ( = ?auto_905535 ?auto_905542 ) ) ( not ( = ?auto_905535 ?auto_905543 ) ) ( not ( = ?auto_905535 ?auto_905544 ) ) ( not ( = ?auto_905536 ?auto_905537 ) ) ( not ( = ?auto_905536 ?auto_905538 ) ) ( not ( = ?auto_905536 ?auto_905539 ) ) ( not ( = ?auto_905536 ?auto_905540 ) ) ( not ( = ?auto_905536 ?auto_905541 ) ) ( not ( = ?auto_905536 ?auto_905542 ) ) ( not ( = ?auto_905536 ?auto_905543 ) ) ( not ( = ?auto_905536 ?auto_905544 ) ) ( not ( = ?auto_905537 ?auto_905538 ) ) ( not ( = ?auto_905537 ?auto_905539 ) ) ( not ( = ?auto_905537 ?auto_905540 ) ) ( not ( = ?auto_905537 ?auto_905541 ) ) ( not ( = ?auto_905537 ?auto_905542 ) ) ( not ( = ?auto_905537 ?auto_905543 ) ) ( not ( = ?auto_905537 ?auto_905544 ) ) ( not ( = ?auto_905538 ?auto_905539 ) ) ( not ( = ?auto_905538 ?auto_905540 ) ) ( not ( = ?auto_905538 ?auto_905541 ) ) ( not ( = ?auto_905538 ?auto_905542 ) ) ( not ( = ?auto_905538 ?auto_905543 ) ) ( not ( = ?auto_905538 ?auto_905544 ) ) ( not ( = ?auto_905539 ?auto_905540 ) ) ( not ( = ?auto_905539 ?auto_905541 ) ) ( not ( = ?auto_905539 ?auto_905542 ) ) ( not ( = ?auto_905539 ?auto_905543 ) ) ( not ( = ?auto_905539 ?auto_905544 ) ) ( not ( = ?auto_905540 ?auto_905541 ) ) ( not ( = ?auto_905540 ?auto_905542 ) ) ( not ( = ?auto_905540 ?auto_905543 ) ) ( not ( = ?auto_905540 ?auto_905544 ) ) ( not ( = ?auto_905541 ?auto_905542 ) ) ( not ( = ?auto_905541 ?auto_905543 ) ) ( not ( = ?auto_905541 ?auto_905544 ) ) ( not ( = ?auto_905542 ?auto_905543 ) ) ( not ( = ?auto_905542 ?auto_905544 ) ) ( not ( = ?auto_905543 ?auto_905544 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_905544 )
      ( !STACK ?auto_905544 ?auto_905543 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905563 - BLOCK
      ?auto_905564 - BLOCK
      ?auto_905565 - BLOCK
      ?auto_905566 - BLOCK
      ?auto_905567 - BLOCK
      ?auto_905568 - BLOCK
      ?auto_905569 - BLOCK
      ?auto_905570 - BLOCK
      ?auto_905571 - BLOCK
      ?auto_905572 - BLOCK
      ?auto_905573 - BLOCK
      ?auto_905574 - BLOCK
      ?auto_905575 - BLOCK
      ?auto_905576 - BLOCK
      ?auto_905577 - BLOCK
      ?auto_905578 - BLOCK
      ?auto_905579 - BLOCK
      ?auto_905580 - BLOCK
    )
    :vars
    (
      ?auto_905581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_905580 ?auto_905581 ) ( ON-TABLE ?auto_905563 ) ( ON ?auto_905564 ?auto_905563 ) ( ON ?auto_905565 ?auto_905564 ) ( ON ?auto_905566 ?auto_905565 ) ( ON ?auto_905567 ?auto_905566 ) ( ON ?auto_905568 ?auto_905567 ) ( ON ?auto_905569 ?auto_905568 ) ( ON ?auto_905570 ?auto_905569 ) ( ON ?auto_905571 ?auto_905570 ) ( ON ?auto_905572 ?auto_905571 ) ( ON ?auto_905573 ?auto_905572 ) ( ON ?auto_905574 ?auto_905573 ) ( ON ?auto_905575 ?auto_905574 ) ( ON ?auto_905576 ?auto_905575 ) ( ON ?auto_905577 ?auto_905576 ) ( ON ?auto_905578 ?auto_905577 ) ( not ( = ?auto_905563 ?auto_905564 ) ) ( not ( = ?auto_905563 ?auto_905565 ) ) ( not ( = ?auto_905563 ?auto_905566 ) ) ( not ( = ?auto_905563 ?auto_905567 ) ) ( not ( = ?auto_905563 ?auto_905568 ) ) ( not ( = ?auto_905563 ?auto_905569 ) ) ( not ( = ?auto_905563 ?auto_905570 ) ) ( not ( = ?auto_905563 ?auto_905571 ) ) ( not ( = ?auto_905563 ?auto_905572 ) ) ( not ( = ?auto_905563 ?auto_905573 ) ) ( not ( = ?auto_905563 ?auto_905574 ) ) ( not ( = ?auto_905563 ?auto_905575 ) ) ( not ( = ?auto_905563 ?auto_905576 ) ) ( not ( = ?auto_905563 ?auto_905577 ) ) ( not ( = ?auto_905563 ?auto_905578 ) ) ( not ( = ?auto_905563 ?auto_905579 ) ) ( not ( = ?auto_905563 ?auto_905580 ) ) ( not ( = ?auto_905563 ?auto_905581 ) ) ( not ( = ?auto_905564 ?auto_905565 ) ) ( not ( = ?auto_905564 ?auto_905566 ) ) ( not ( = ?auto_905564 ?auto_905567 ) ) ( not ( = ?auto_905564 ?auto_905568 ) ) ( not ( = ?auto_905564 ?auto_905569 ) ) ( not ( = ?auto_905564 ?auto_905570 ) ) ( not ( = ?auto_905564 ?auto_905571 ) ) ( not ( = ?auto_905564 ?auto_905572 ) ) ( not ( = ?auto_905564 ?auto_905573 ) ) ( not ( = ?auto_905564 ?auto_905574 ) ) ( not ( = ?auto_905564 ?auto_905575 ) ) ( not ( = ?auto_905564 ?auto_905576 ) ) ( not ( = ?auto_905564 ?auto_905577 ) ) ( not ( = ?auto_905564 ?auto_905578 ) ) ( not ( = ?auto_905564 ?auto_905579 ) ) ( not ( = ?auto_905564 ?auto_905580 ) ) ( not ( = ?auto_905564 ?auto_905581 ) ) ( not ( = ?auto_905565 ?auto_905566 ) ) ( not ( = ?auto_905565 ?auto_905567 ) ) ( not ( = ?auto_905565 ?auto_905568 ) ) ( not ( = ?auto_905565 ?auto_905569 ) ) ( not ( = ?auto_905565 ?auto_905570 ) ) ( not ( = ?auto_905565 ?auto_905571 ) ) ( not ( = ?auto_905565 ?auto_905572 ) ) ( not ( = ?auto_905565 ?auto_905573 ) ) ( not ( = ?auto_905565 ?auto_905574 ) ) ( not ( = ?auto_905565 ?auto_905575 ) ) ( not ( = ?auto_905565 ?auto_905576 ) ) ( not ( = ?auto_905565 ?auto_905577 ) ) ( not ( = ?auto_905565 ?auto_905578 ) ) ( not ( = ?auto_905565 ?auto_905579 ) ) ( not ( = ?auto_905565 ?auto_905580 ) ) ( not ( = ?auto_905565 ?auto_905581 ) ) ( not ( = ?auto_905566 ?auto_905567 ) ) ( not ( = ?auto_905566 ?auto_905568 ) ) ( not ( = ?auto_905566 ?auto_905569 ) ) ( not ( = ?auto_905566 ?auto_905570 ) ) ( not ( = ?auto_905566 ?auto_905571 ) ) ( not ( = ?auto_905566 ?auto_905572 ) ) ( not ( = ?auto_905566 ?auto_905573 ) ) ( not ( = ?auto_905566 ?auto_905574 ) ) ( not ( = ?auto_905566 ?auto_905575 ) ) ( not ( = ?auto_905566 ?auto_905576 ) ) ( not ( = ?auto_905566 ?auto_905577 ) ) ( not ( = ?auto_905566 ?auto_905578 ) ) ( not ( = ?auto_905566 ?auto_905579 ) ) ( not ( = ?auto_905566 ?auto_905580 ) ) ( not ( = ?auto_905566 ?auto_905581 ) ) ( not ( = ?auto_905567 ?auto_905568 ) ) ( not ( = ?auto_905567 ?auto_905569 ) ) ( not ( = ?auto_905567 ?auto_905570 ) ) ( not ( = ?auto_905567 ?auto_905571 ) ) ( not ( = ?auto_905567 ?auto_905572 ) ) ( not ( = ?auto_905567 ?auto_905573 ) ) ( not ( = ?auto_905567 ?auto_905574 ) ) ( not ( = ?auto_905567 ?auto_905575 ) ) ( not ( = ?auto_905567 ?auto_905576 ) ) ( not ( = ?auto_905567 ?auto_905577 ) ) ( not ( = ?auto_905567 ?auto_905578 ) ) ( not ( = ?auto_905567 ?auto_905579 ) ) ( not ( = ?auto_905567 ?auto_905580 ) ) ( not ( = ?auto_905567 ?auto_905581 ) ) ( not ( = ?auto_905568 ?auto_905569 ) ) ( not ( = ?auto_905568 ?auto_905570 ) ) ( not ( = ?auto_905568 ?auto_905571 ) ) ( not ( = ?auto_905568 ?auto_905572 ) ) ( not ( = ?auto_905568 ?auto_905573 ) ) ( not ( = ?auto_905568 ?auto_905574 ) ) ( not ( = ?auto_905568 ?auto_905575 ) ) ( not ( = ?auto_905568 ?auto_905576 ) ) ( not ( = ?auto_905568 ?auto_905577 ) ) ( not ( = ?auto_905568 ?auto_905578 ) ) ( not ( = ?auto_905568 ?auto_905579 ) ) ( not ( = ?auto_905568 ?auto_905580 ) ) ( not ( = ?auto_905568 ?auto_905581 ) ) ( not ( = ?auto_905569 ?auto_905570 ) ) ( not ( = ?auto_905569 ?auto_905571 ) ) ( not ( = ?auto_905569 ?auto_905572 ) ) ( not ( = ?auto_905569 ?auto_905573 ) ) ( not ( = ?auto_905569 ?auto_905574 ) ) ( not ( = ?auto_905569 ?auto_905575 ) ) ( not ( = ?auto_905569 ?auto_905576 ) ) ( not ( = ?auto_905569 ?auto_905577 ) ) ( not ( = ?auto_905569 ?auto_905578 ) ) ( not ( = ?auto_905569 ?auto_905579 ) ) ( not ( = ?auto_905569 ?auto_905580 ) ) ( not ( = ?auto_905569 ?auto_905581 ) ) ( not ( = ?auto_905570 ?auto_905571 ) ) ( not ( = ?auto_905570 ?auto_905572 ) ) ( not ( = ?auto_905570 ?auto_905573 ) ) ( not ( = ?auto_905570 ?auto_905574 ) ) ( not ( = ?auto_905570 ?auto_905575 ) ) ( not ( = ?auto_905570 ?auto_905576 ) ) ( not ( = ?auto_905570 ?auto_905577 ) ) ( not ( = ?auto_905570 ?auto_905578 ) ) ( not ( = ?auto_905570 ?auto_905579 ) ) ( not ( = ?auto_905570 ?auto_905580 ) ) ( not ( = ?auto_905570 ?auto_905581 ) ) ( not ( = ?auto_905571 ?auto_905572 ) ) ( not ( = ?auto_905571 ?auto_905573 ) ) ( not ( = ?auto_905571 ?auto_905574 ) ) ( not ( = ?auto_905571 ?auto_905575 ) ) ( not ( = ?auto_905571 ?auto_905576 ) ) ( not ( = ?auto_905571 ?auto_905577 ) ) ( not ( = ?auto_905571 ?auto_905578 ) ) ( not ( = ?auto_905571 ?auto_905579 ) ) ( not ( = ?auto_905571 ?auto_905580 ) ) ( not ( = ?auto_905571 ?auto_905581 ) ) ( not ( = ?auto_905572 ?auto_905573 ) ) ( not ( = ?auto_905572 ?auto_905574 ) ) ( not ( = ?auto_905572 ?auto_905575 ) ) ( not ( = ?auto_905572 ?auto_905576 ) ) ( not ( = ?auto_905572 ?auto_905577 ) ) ( not ( = ?auto_905572 ?auto_905578 ) ) ( not ( = ?auto_905572 ?auto_905579 ) ) ( not ( = ?auto_905572 ?auto_905580 ) ) ( not ( = ?auto_905572 ?auto_905581 ) ) ( not ( = ?auto_905573 ?auto_905574 ) ) ( not ( = ?auto_905573 ?auto_905575 ) ) ( not ( = ?auto_905573 ?auto_905576 ) ) ( not ( = ?auto_905573 ?auto_905577 ) ) ( not ( = ?auto_905573 ?auto_905578 ) ) ( not ( = ?auto_905573 ?auto_905579 ) ) ( not ( = ?auto_905573 ?auto_905580 ) ) ( not ( = ?auto_905573 ?auto_905581 ) ) ( not ( = ?auto_905574 ?auto_905575 ) ) ( not ( = ?auto_905574 ?auto_905576 ) ) ( not ( = ?auto_905574 ?auto_905577 ) ) ( not ( = ?auto_905574 ?auto_905578 ) ) ( not ( = ?auto_905574 ?auto_905579 ) ) ( not ( = ?auto_905574 ?auto_905580 ) ) ( not ( = ?auto_905574 ?auto_905581 ) ) ( not ( = ?auto_905575 ?auto_905576 ) ) ( not ( = ?auto_905575 ?auto_905577 ) ) ( not ( = ?auto_905575 ?auto_905578 ) ) ( not ( = ?auto_905575 ?auto_905579 ) ) ( not ( = ?auto_905575 ?auto_905580 ) ) ( not ( = ?auto_905575 ?auto_905581 ) ) ( not ( = ?auto_905576 ?auto_905577 ) ) ( not ( = ?auto_905576 ?auto_905578 ) ) ( not ( = ?auto_905576 ?auto_905579 ) ) ( not ( = ?auto_905576 ?auto_905580 ) ) ( not ( = ?auto_905576 ?auto_905581 ) ) ( not ( = ?auto_905577 ?auto_905578 ) ) ( not ( = ?auto_905577 ?auto_905579 ) ) ( not ( = ?auto_905577 ?auto_905580 ) ) ( not ( = ?auto_905577 ?auto_905581 ) ) ( not ( = ?auto_905578 ?auto_905579 ) ) ( not ( = ?auto_905578 ?auto_905580 ) ) ( not ( = ?auto_905578 ?auto_905581 ) ) ( not ( = ?auto_905579 ?auto_905580 ) ) ( not ( = ?auto_905579 ?auto_905581 ) ) ( not ( = ?auto_905580 ?auto_905581 ) ) ( CLEAR ?auto_905578 ) ( ON ?auto_905579 ?auto_905580 ) ( CLEAR ?auto_905579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_905563 ?auto_905564 ?auto_905565 ?auto_905566 ?auto_905567 ?auto_905568 ?auto_905569 ?auto_905570 ?auto_905571 ?auto_905572 ?auto_905573 ?auto_905574 ?auto_905575 ?auto_905576 ?auto_905577 ?auto_905578 ?auto_905579 )
      ( MAKE-18PILE ?auto_905563 ?auto_905564 ?auto_905565 ?auto_905566 ?auto_905567 ?auto_905568 ?auto_905569 ?auto_905570 ?auto_905571 ?auto_905572 ?auto_905573 ?auto_905574 ?auto_905575 ?auto_905576 ?auto_905577 ?auto_905578 ?auto_905579 ?auto_905580 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905600 - BLOCK
      ?auto_905601 - BLOCK
      ?auto_905602 - BLOCK
      ?auto_905603 - BLOCK
      ?auto_905604 - BLOCK
      ?auto_905605 - BLOCK
      ?auto_905606 - BLOCK
      ?auto_905607 - BLOCK
      ?auto_905608 - BLOCK
      ?auto_905609 - BLOCK
      ?auto_905610 - BLOCK
      ?auto_905611 - BLOCK
      ?auto_905612 - BLOCK
      ?auto_905613 - BLOCK
      ?auto_905614 - BLOCK
      ?auto_905615 - BLOCK
      ?auto_905616 - BLOCK
      ?auto_905617 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_905617 ) ( ON-TABLE ?auto_905600 ) ( ON ?auto_905601 ?auto_905600 ) ( ON ?auto_905602 ?auto_905601 ) ( ON ?auto_905603 ?auto_905602 ) ( ON ?auto_905604 ?auto_905603 ) ( ON ?auto_905605 ?auto_905604 ) ( ON ?auto_905606 ?auto_905605 ) ( ON ?auto_905607 ?auto_905606 ) ( ON ?auto_905608 ?auto_905607 ) ( ON ?auto_905609 ?auto_905608 ) ( ON ?auto_905610 ?auto_905609 ) ( ON ?auto_905611 ?auto_905610 ) ( ON ?auto_905612 ?auto_905611 ) ( ON ?auto_905613 ?auto_905612 ) ( ON ?auto_905614 ?auto_905613 ) ( ON ?auto_905615 ?auto_905614 ) ( not ( = ?auto_905600 ?auto_905601 ) ) ( not ( = ?auto_905600 ?auto_905602 ) ) ( not ( = ?auto_905600 ?auto_905603 ) ) ( not ( = ?auto_905600 ?auto_905604 ) ) ( not ( = ?auto_905600 ?auto_905605 ) ) ( not ( = ?auto_905600 ?auto_905606 ) ) ( not ( = ?auto_905600 ?auto_905607 ) ) ( not ( = ?auto_905600 ?auto_905608 ) ) ( not ( = ?auto_905600 ?auto_905609 ) ) ( not ( = ?auto_905600 ?auto_905610 ) ) ( not ( = ?auto_905600 ?auto_905611 ) ) ( not ( = ?auto_905600 ?auto_905612 ) ) ( not ( = ?auto_905600 ?auto_905613 ) ) ( not ( = ?auto_905600 ?auto_905614 ) ) ( not ( = ?auto_905600 ?auto_905615 ) ) ( not ( = ?auto_905600 ?auto_905616 ) ) ( not ( = ?auto_905600 ?auto_905617 ) ) ( not ( = ?auto_905601 ?auto_905602 ) ) ( not ( = ?auto_905601 ?auto_905603 ) ) ( not ( = ?auto_905601 ?auto_905604 ) ) ( not ( = ?auto_905601 ?auto_905605 ) ) ( not ( = ?auto_905601 ?auto_905606 ) ) ( not ( = ?auto_905601 ?auto_905607 ) ) ( not ( = ?auto_905601 ?auto_905608 ) ) ( not ( = ?auto_905601 ?auto_905609 ) ) ( not ( = ?auto_905601 ?auto_905610 ) ) ( not ( = ?auto_905601 ?auto_905611 ) ) ( not ( = ?auto_905601 ?auto_905612 ) ) ( not ( = ?auto_905601 ?auto_905613 ) ) ( not ( = ?auto_905601 ?auto_905614 ) ) ( not ( = ?auto_905601 ?auto_905615 ) ) ( not ( = ?auto_905601 ?auto_905616 ) ) ( not ( = ?auto_905601 ?auto_905617 ) ) ( not ( = ?auto_905602 ?auto_905603 ) ) ( not ( = ?auto_905602 ?auto_905604 ) ) ( not ( = ?auto_905602 ?auto_905605 ) ) ( not ( = ?auto_905602 ?auto_905606 ) ) ( not ( = ?auto_905602 ?auto_905607 ) ) ( not ( = ?auto_905602 ?auto_905608 ) ) ( not ( = ?auto_905602 ?auto_905609 ) ) ( not ( = ?auto_905602 ?auto_905610 ) ) ( not ( = ?auto_905602 ?auto_905611 ) ) ( not ( = ?auto_905602 ?auto_905612 ) ) ( not ( = ?auto_905602 ?auto_905613 ) ) ( not ( = ?auto_905602 ?auto_905614 ) ) ( not ( = ?auto_905602 ?auto_905615 ) ) ( not ( = ?auto_905602 ?auto_905616 ) ) ( not ( = ?auto_905602 ?auto_905617 ) ) ( not ( = ?auto_905603 ?auto_905604 ) ) ( not ( = ?auto_905603 ?auto_905605 ) ) ( not ( = ?auto_905603 ?auto_905606 ) ) ( not ( = ?auto_905603 ?auto_905607 ) ) ( not ( = ?auto_905603 ?auto_905608 ) ) ( not ( = ?auto_905603 ?auto_905609 ) ) ( not ( = ?auto_905603 ?auto_905610 ) ) ( not ( = ?auto_905603 ?auto_905611 ) ) ( not ( = ?auto_905603 ?auto_905612 ) ) ( not ( = ?auto_905603 ?auto_905613 ) ) ( not ( = ?auto_905603 ?auto_905614 ) ) ( not ( = ?auto_905603 ?auto_905615 ) ) ( not ( = ?auto_905603 ?auto_905616 ) ) ( not ( = ?auto_905603 ?auto_905617 ) ) ( not ( = ?auto_905604 ?auto_905605 ) ) ( not ( = ?auto_905604 ?auto_905606 ) ) ( not ( = ?auto_905604 ?auto_905607 ) ) ( not ( = ?auto_905604 ?auto_905608 ) ) ( not ( = ?auto_905604 ?auto_905609 ) ) ( not ( = ?auto_905604 ?auto_905610 ) ) ( not ( = ?auto_905604 ?auto_905611 ) ) ( not ( = ?auto_905604 ?auto_905612 ) ) ( not ( = ?auto_905604 ?auto_905613 ) ) ( not ( = ?auto_905604 ?auto_905614 ) ) ( not ( = ?auto_905604 ?auto_905615 ) ) ( not ( = ?auto_905604 ?auto_905616 ) ) ( not ( = ?auto_905604 ?auto_905617 ) ) ( not ( = ?auto_905605 ?auto_905606 ) ) ( not ( = ?auto_905605 ?auto_905607 ) ) ( not ( = ?auto_905605 ?auto_905608 ) ) ( not ( = ?auto_905605 ?auto_905609 ) ) ( not ( = ?auto_905605 ?auto_905610 ) ) ( not ( = ?auto_905605 ?auto_905611 ) ) ( not ( = ?auto_905605 ?auto_905612 ) ) ( not ( = ?auto_905605 ?auto_905613 ) ) ( not ( = ?auto_905605 ?auto_905614 ) ) ( not ( = ?auto_905605 ?auto_905615 ) ) ( not ( = ?auto_905605 ?auto_905616 ) ) ( not ( = ?auto_905605 ?auto_905617 ) ) ( not ( = ?auto_905606 ?auto_905607 ) ) ( not ( = ?auto_905606 ?auto_905608 ) ) ( not ( = ?auto_905606 ?auto_905609 ) ) ( not ( = ?auto_905606 ?auto_905610 ) ) ( not ( = ?auto_905606 ?auto_905611 ) ) ( not ( = ?auto_905606 ?auto_905612 ) ) ( not ( = ?auto_905606 ?auto_905613 ) ) ( not ( = ?auto_905606 ?auto_905614 ) ) ( not ( = ?auto_905606 ?auto_905615 ) ) ( not ( = ?auto_905606 ?auto_905616 ) ) ( not ( = ?auto_905606 ?auto_905617 ) ) ( not ( = ?auto_905607 ?auto_905608 ) ) ( not ( = ?auto_905607 ?auto_905609 ) ) ( not ( = ?auto_905607 ?auto_905610 ) ) ( not ( = ?auto_905607 ?auto_905611 ) ) ( not ( = ?auto_905607 ?auto_905612 ) ) ( not ( = ?auto_905607 ?auto_905613 ) ) ( not ( = ?auto_905607 ?auto_905614 ) ) ( not ( = ?auto_905607 ?auto_905615 ) ) ( not ( = ?auto_905607 ?auto_905616 ) ) ( not ( = ?auto_905607 ?auto_905617 ) ) ( not ( = ?auto_905608 ?auto_905609 ) ) ( not ( = ?auto_905608 ?auto_905610 ) ) ( not ( = ?auto_905608 ?auto_905611 ) ) ( not ( = ?auto_905608 ?auto_905612 ) ) ( not ( = ?auto_905608 ?auto_905613 ) ) ( not ( = ?auto_905608 ?auto_905614 ) ) ( not ( = ?auto_905608 ?auto_905615 ) ) ( not ( = ?auto_905608 ?auto_905616 ) ) ( not ( = ?auto_905608 ?auto_905617 ) ) ( not ( = ?auto_905609 ?auto_905610 ) ) ( not ( = ?auto_905609 ?auto_905611 ) ) ( not ( = ?auto_905609 ?auto_905612 ) ) ( not ( = ?auto_905609 ?auto_905613 ) ) ( not ( = ?auto_905609 ?auto_905614 ) ) ( not ( = ?auto_905609 ?auto_905615 ) ) ( not ( = ?auto_905609 ?auto_905616 ) ) ( not ( = ?auto_905609 ?auto_905617 ) ) ( not ( = ?auto_905610 ?auto_905611 ) ) ( not ( = ?auto_905610 ?auto_905612 ) ) ( not ( = ?auto_905610 ?auto_905613 ) ) ( not ( = ?auto_905610 ?auto_905614 ) ) ( not ( = ?auto_905610 ?auto_905615 ) ) ( not ( = ?auto_905610 ?auto_905616 ) ) ( not ( = ?auto_905610 ?auto_905617 ) ) ( not ( = ?auto_905611 ?auto_905612 ) ) ( not ( = ?auto_905611 ?auto_905613 ) ) ( not ( = ?auto_905611 ?auto_905614 ) ) ( not ( = ?auto_905611 ?auto_905615 ) ) ( not ( = ?auto_905611 ?auto_905616 ) ) ( not ( = ?auto_905611 ?auto_905617 ) ) ( not ( = ?auto_905612 ?auto_905613 ) ) ( not ( = ?auto_905612 ?auto_905614 ) ) ( not ( = ?auto_905612 ?auto_905615 ) ) ( not ( = ?auto_905612 ?auto_905616 ) ) ( not ( = ?auto_905612 ?auto_905617 ) ) ( not ( = ?auto_905613 ?auto_905614 ) ) ( not ( = ?auto_905613 ?auto_905615 ) ) ( not ( = ?auto_905613 ?auto_905616 ) ) ( not ( = ?auto_905613 ?auto_905617 ) ) ( not ( = ?auto_905614 ?auto_905615 ) ) ( not ( = ?auto_905614 ?auto_905616 ) ) ( not ( = ?auto_905614 ?auto_905617 ) ) ( not ( = ?auto_905615 ?auto_905616 ) ) ( not ( = ?auto_905615 ?auto_905617 ) ) ( not ( = ?auto_905616 ?auto_905617 ) ) ( CLEAR ?auto_905615 ) ( ON ?auto_905616 ?auto_905617 ) ( CLEAR ?auto_905616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_905600 ?auto_905601 ?auto_905602 ?auto_905603 ?auto_905604 ?auto_905605 ?auto_905606 ?auto_905607 ?auto_905608 ?auto_905609 ?auto_905610 ?auto_905611 ?auto_905612 ?auto_905613 ?auto_905614 ?auto_905615 ?auto_905616 )
      ( MAKE-18PILE ?auto_905600 ?auto_905601 ?auto_905602 ?auto_905603 ?auto_905604 ?auto_905605 ?auto_905606 ?auto_905607 ?auto_905608 ?auto_905609 ?auto_905610 ?auto_905611 ?auto_905612 ?auto_905613 ?auto_905614 ?auto_905615 ?auto_905616 ?auto_905617 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905636 - BLOCK
      ?auto_905637 - BLOCK
      ?auto_905638 - BLOCK
      ?auto_905639 - BLOCK
      ?auto_905640 - BLOCK
      ?auto_905641 - BLOCK
      ?auto_905642 - BLOCK
      ?auto_905643 - BLOCK
      ?auto_905644 - BLOCK
      ?auto_905645 - BLOCK
      ?auto_905646 - BLOCK
      ?auto_905647 - BLOCK
      ?auto_905648 - BLOCK
      ?auto_905649 - BLOCK
      ?auto_905650 - BLOCK
      ?auto_905651 - BLOCK
      ?auto_905652 - BLOCK
      ?auto_905653 - BLOCK
    )
    :vars
    (
      ?auto_905654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_905653 ?auto_905654 ) ( ON-TABLE ?auto_905636 ) ( ON ?auto_905637 ?auto_905636 ) ( ON ?auto_905638 ?auto_905637 ) ( ON ?auto_905639 ?auto_905638 ) ( ON ?auto_905640 ?auto_905639 ) ( ON ?auto_905641 ?auto_905640 ) ( ON ?auto_905642 ?auto_905641 ) ( ON ?auto_905643 ?auto_905642 ) ( ON ?auto_905644 ?auto_905643 ) ( ON ?auto_905645 ?auto_905644 ) ( ON ?auto_905646 ?auto_905645 ) ( ON ?auto_905647 ?auto_905646 ) ( ON ?auto_905648 ?auto_905647 ) ( ON ?auto_905649 ?auto_905648 ) ( ON ?auto_905650 ?auto_905649 ) ( not ( = ?auto_905636 ?auto_905637 ) ) ( not ( = ?auto_905636 ?auto_905638 ) ) ( not ( = ?auto_905636 ?auto_905639 ) ) ( not ( = ?auto_905636 ?auto_905640 ) ) ( not ( = ?auto_905636 ?auto_905641 ) ) ( not ( = ?auto_905636 ?auto_905642 ) ) ( not ( = ?auto_905636 ?auto_905643 ) ) ( not ( = ?auto_905636 ?auto_905644 ) ) ( not ( = ?auto_905636 ?auto_905645 ) ) ( not ( = ?auto_905636 ?auto_905646 ) ) ( not ( = ?auto_905636 ?auto_905647 ) ) ( not ( = ?auto_905636 ?auto_905648 ) ) ( not ( = ?auto_905636 ?auto_905649 ) ) ( not ( = ?auto_905636 ?auto_905650 ) ) ( not ( = ?auto_905636 ?auto_905651 ) ) ( not ( = ?auto_905636 ?auto_905652 ) ) ( not ( = ?auto_905636 ?auto_905653 ) ) ( not ( = ?auto_905636 ?auto_905654 ) ) ( not ( = ?auto_905637 ?auto_905638 ) ) ( not ( = ?auto_905637 ?auto_905639 ) ) ( not ( = ?auto_905637 ?auto_905640 ) ) ( not ( = ?auto_905637 ?auto_905641 ) ) ( not ( = ?auto_905637 ?auto_905642 ) ) ( not ( = ?auto_905637 ?auto_905643 ) ) ( not ( = ?auto_905637 ?auto_905644 ) ) ( not ( = ?auto_905637 ?auto_905645 ) ) ( not ( = ?auto_905637 ?auto_905646 ) ) ( not ( = ?auto_905637 ?auto_905647 ) ) ( not ( = ?auto_905637 ?auto_905648 ) ) ( not ( = ?auto_905637 ?auto_905649 ) ) ( not ( = ?auto_905637 ?auto_905650 ) ) ( not ( = ?auto_905637 ?auto_905651 ) ) ( not ( = ?auto_905637 ?auto_905652 ) ) ( not ( = ?auto_905637 ?auto_905653 ) ) ( not ( = ?auto_905637 ?auto_905654 ) ) ( not ( = ?auto_905638 ?auto_905639 ) ) ( not ( = ?auto_905638 ?auto_905640 ) ) ( not ( = ?auto_905638 ?auto_905641 ) ) ( not ( = ?auto_905638 ?auto_905642 ) ) ( not ( = ?auto_905638 ?auto_905643 ) ) ( not ( = ?auto_905638 ?auto_905644 ) ) ( not ( = ?auto_905638 ?auto_905645 ) ) ( not ( = ?auto_905638 ?auto_905646 ) ) ( not ( = ?auto_905638 ?auto_905647 ) ) ( not ( = ?auto_905638 ?auto_905648 ) ) ( not ( = ?auto_905638 ?auto_905649 ) ) ( not ( = ?auto_905638 ?auto_905650 ) ) ( not ( = ?auto_905638 ?auto_905651 ) ) ( not ( = ?auto_905638 ?auto_905652 ) ) ( not ( = ?auto_905638 ?auto_905653 ) ) ( not ( = ?auto_905638 ?auto_905654 ) ) ( not ( = ?auto_905639 ?auto_905640 ) ) ( not ( = ?auto_905639 ?auto_905641 ) ) ( not ( = ?auto_905639 ?auto_905642 ) ) ( not ( = ?auto_905639 ?auto_905643 ) ) ( not ( = ?auto_905639 ?auto_905644 ) ) ( not ( = ?auto_905639 ?auto_905645 ) ) ( not ( = ?auto_905639 ?auto_905646 ) ) ( not ( = ?auto_905639 ?auto_905647 ) ) ( not ( = ?auto_905639 ?auto_905648 ) ) ( not ( = ?auto_905639 ?auto_905649 ) ) ( not ( = ?auto_905639 ?auto_905650 ) ) ( not ( = ?auto_905639 ?auto_905651 ) ) ( not ( = ?auto_905639 ?auto_905652 ) ) ( not ( = ?auto_905639 ?auto_905653 ) ) ( not ( = ?auto_905639 ?auto_905654 ) ) ( not ( = ?auto_905640 ?auto_905641 ) ) ( not ( = ?auto_905640 ?auto_905642 ) ) ( not ( = ?auto_905640 ?auto_905643 ) ) ( not ( = ?auto_905640 ?auto_905644 ) ) ( not ( = ?auto_905640 ?auto_905645 ) ) ( not ( = ?auto_905640 ?auto_905646 ) ) ( not ( = ?auto_905640 ?auto_905647 ) ) ( not ( = ?auto_905640 ?auto_905648 ) ) ( not ( = ?auto_905640 ?auto_905649 ) ) ( not ( = ?auto_905640 ?auto_905650 ) ) ( not ( = ?auto_905640 ?auto_905651 ) ) ( not ( = ?auto_905640 ?auto_905652 ) ) ( not ( = ?auto_905640 ?auto_905653 ) ) ( not ( = ?auto_905640 ?auto_905654 ) ) ( not ( = ?auto_905641 ?auto_905642 ) ) ( not ( = ?auto_905641 ?auto_905643 ) ) ( not ( = ?auto_905641 ?auto_905644 ) ) ( not ( = ?auto_905641 ?auto_905645 ) ) ( not ( = ?auto_905641 ?auto_905646 ) ) ( not ( = ?auto_905641 ?auto_905647 ) ) ( not ( = ?auto_905641 ?auto_905648 ) ) ( not ( = ?auto_905641 ?auto_905649 ) ) ( not ( = ?auto_905641 ?auto_905650 ) ) ( not ( = ?auto_905641 ?auto_905651 ) ) ( not ( = ?auto_905641 ?auto_905652 ) ) ( not ( = ?auto_905641 ?auto_905653 ) ) ( not ( = ?auto_905641 ?auto_905654 ) ) ( not ( = ?auto_905642 ?auto_905643 ) ) ( not ( = ?auto_905642 ?auto_905644 ) ) ( not ( = ?auto_905642 ?auto_905645 ) ) ( not ( = ?auto_905642 ?auto_905646 ) ) ( not ( = ?auto_905642 ?auto_905647 ) ) ( not ( = ?auto_905642 ?auto_905648 ) ) ( not ( = ?auto_905642 ?auto_905649 ) ) ( not ( = ?auto_905642 ?auto_905650 ) ) ( not ( = ?auto_905642 ?auto_905651 ) ) ( not ( = ?auto_905642 ?auto_905652 ) ) ( not ( = ?auto_905642 ?auto_905653 ) ) ( not ( = ?auto_905642 ?auto_905654 ) ) ( not ( = ?auto_905643 ?auto_905644 ) ) ( not ( = ?auto_905643 ?auto_905645 ) ) ( not ( = ?auto_905643 ?auto_905646 ) ) ( not ( = ?auto_905643 ?auto_905647 ) ) ( not ( = ?auto_905643 ?auto_905648 ) ) ( not ( = ?auto_905643 ?auto_905649 ) ) ( not ( = ?auto_905643 ?auto_905650 ) ) ( not ( = ?auto_905643 ?auto_905651 ) ) ( not ( = ?auto_905643 ?auto_905652 ) ) ( not ( = ?auto_905643 ?auto_905653 ) ) ( not ( = ?auto_905643 ?auto_905654 ) ) ( not ( = ?auto_905644 ?auto_905645 ) ) ( not ( = ?auto_905644 ?auto_905646 ) ) ( not ( = ?auto_905644 ?auto_905647 ) ) ( not ( = ?auto_905644 ?auto_905648 ) ) ( not ( = ?auto_905644 ?auto_905649 ) ) ( not ( = ?auto_905644 ?auto_905650 ) ) ( not ( = ?auto_905644 ?auto_905651 ) ) ( not ( = ?auto_905644 ?auto_905652 ) ) ( not ( = ?auto_905644 ?auto_905653 ) ) ( not ( = ?auto_905644 ?auto_905654 ) ) ( not ( = ?auto_905645 ?auto_905646 ) ) ( not ( = ?auto_905645 ?auto_905647 ) ) ( not ( = ?auto_905645 ?auto_905648 ) ) ( not ( = ?auto_905645 ?auto_905649 ) ) ( not ( = ?auto_905645 ?auto_905650 ) ) ( not ( = ?auto_905645 ?auto_905651 ) ) ( not ( = ?auto_905645 ?auto_905652 ) ) ( not ( = ?auto_905645 ?auto_905653 ) ) ( not ( = ?auto_905645 ?auto_905654 ) ) ( not ( = ?auto_905646 ?auto_905647 ) ) ( not ( = ?auto_905646 ?auto_905648 ) ) ( not ( = ?auto_905646 ?auto_905649 ) ) ( not ( = ?auto_905646 ?auto_905650 ) ) ( not ( = ?auto_905646 ?auto_905651 ) ) ( not ( = ?auto_905646 ?auto_905652 ) ) ( not ( = ?auto_905646 ?auto_905653 ) ) ( not ( = ?auto_905646 ?auto_905654 ) ) ( not ( = ?auto_905647 ?auto_905648 ) ) ( not ( = ?auto_905647 ?auto_905649 ) ) ( not ( = ?auto_905647 ?auto_905650 ) ) ( not ( = ?auto_905647 ?auto_905651 ) ) ( not ( = ?auto_905647 ?auto_905652 ) ) ( not ( = ?auto_905647 ?auto_905653 ) ) ( not ( = ?auto_905647 ?auto_905654 ) ) ( not ( = ?auto_905648 ?auto_905649 ) ) ( not ( = ?auto_905648 ?auto_905650 ) ) ( not ( = ?auto_905648 ?auto_905651 ) ) ( not ( = ?auto_905648 ?auto_905652 ) ) ( not ( = ?auto_905648 ?auto_905653 ) ) ( not ( = ?auto_905648 ?auto_905654 ) ) ( not ( = ?auto_905649 ?auto_905650 ) ) ( not ( = ?auto_905649 ?auto_905651 ) ) ( not ( = ?auto_905649 ?auto_905652 ) ) ( not ( = ?auto_905649 ?auto_905653 ) ) ( not ( = ?auto_905649 ?auto_905654 ) ) ( not ( = ?auto_905650 ?auto_905651 ) ) ( not ( = ?auto_905650 ?auto_905652 ) ) ( not ( = ?auto_905650 ?auto_905653 ) ) ( not ( = ?auto_905650 ?auto_905654 ) ) ( not ( = ?auto_905651 ?auto_905652 ) ) ( not ( = ?auto_905651 ?auto_905653 ) ) ( not ( = ?auto_905651 ?auto_905654 ) ) ( not ( = ?auto_905652 ?auto_905653 ) ) ( not ( = ?auto_905652 ?auto_905654 ) ) ( not ( = ?auto_905653 ?auto_905654 ) ) ( ON ?auto_905652 ?auto_905653 ) ( CLEAR ?auto_905650 ) ( ON ?auto_905651 ?auto_905652 ) ( CLEAR ?auto_905651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_905636 ?auto_905637 ?auto_905638 ?auto_905639 ?auto_905640 ?auto_905641 ?auto_905642 ?auto_905643 ?auto_905644 ?auto_905645 ?auto_905646 ?auto_905647 ?auto_905648 ?auto_905649 ?auto_905650 ?auto_905651 )
      ( MAKE-18PILE ?auto_905636 ?auto_905637 ?auto_905638 ?auto_905639 ?auto_905640 ?auto_905641 ?auto_905642 ?auto_905643 ?auto_905644 ?auto_905645 ?auto_905646 ?auto_905647 ?auto_905648 ?auto_905649 ?auto_905650 ?auto_905651 ?auto_905652 ?auto_905653 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905673 - BLOCK
      ?auto_905674 - BLOCK
      ?auto_905675 - BLOCK
      ?auto_905676 - BLOCK
      ?auto_905677 - BLOCK
      ?auto_905678 - BLOCK
      ?auto_905679 - BLOCK
      ?auto_905680 - BLOCK
      ?auto_905681 - BLOCK
      ?auto_905682 - BLOCK
      ?auto_905683 - BLOCK
      ?auto_905684 - BLOCK
      ?auto_905685 - BLOCK
      ?auto_905686 - BLOCK
      ?auto_905687 - BLOCK
      ?auto_905688 - BLOCK
      ?auto_905689 - BLOCK
      ?auto_905690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_905690 ) ( ON-TABLE ?auto_905673 ) ( ON ?auto_905674 ?auto_905673 ) ( ON ?auto_905675 ?auto_905674 ) ( ON ?auto_905676 ?auto_905675 ) ( ON ?auto_905677 ?auto_905676 ) ( ON ?auto_905678 ?auto_905677 ) ( ON ?auto_905679 ?auto_905678 ) ( ON ?auto_905680 ?auto_905679 ) ( ON ?auto_905681 ?auto_905680 ) ( ON ?auto_905682 ?auto_905681 ) ( ON ?auto_905683 ?auto_905682 ) ( ON ?auto_905684 ?auto_905683 ) ( ON ?auto_905685 ?auto_905684 ) ( ON ?auto_905686 ?auto_905685 ) ( ON ?auto_905687 ?auto_905686 ) ( not ( = ?auto_905673 ?auto_905674 ) ) ( not ( = ?auto_905673 ?auto_905675 ) ) ( not ( = ?auto_905673 ?auto_905676 ) ) ( not ( = ?auto_905673 ?auto_905677 ) ) ( not ( = ?auto_905673 ?auto_905678 ) ) ( not ( = ?auto_905673 ?auto_905679 ) ) ( not ( = ?auto_905673 ?auto_905680 ) ) ( not ( = ?auto_905673 ?auto_905681 ) ) ( not ( = ?auto_905673 ?auto_905682 ) ) ( not ( = ?auto_905673 ?auto_905683 ) ) ( not ( = ?auto_905673 ?auto_905684 ) ) ( not ( = ?auto_905673 ?auto_905685 ) ) ( not ( = ?auto_905673 ?auto_905686 ) ) ( not ( = ?auto_905673 ?auto_905687 ) ) ( not ( = ?auto_905673 ?auto_905688 ) ) ( not ( = ?auto_905673 ?auto_905689 ) ) ( not ( = ?auto_905673 ?auto_905690 ) ) ( not ( = ?auto_905674 ?auto_905675 ) ) ( not ( = ?auto_905674 ?auto_905676 ) ) ( not ( = ?auto_905674 ?auto_905677 ) ) ( not ( = ?auto_905674 ?auto_905678 ) ) ( not ( = ?auto_905674 ?auto_905679 ) ) ( not ( = ?auto_905674 ?auto_905680 ) ) ( not ( = ?auto_905674 ?auto_905681 ) ) ( not ( = ?auto_905674 ?auto_905682 ) ) ( not ( = ?auto_905674 ?auto_905683 ) ) ( not ( = ?auto_905674 ?auto_905684 ) ) ( not ( = ?auto_905674 ?auto_905685 ) ) ( not ( = ?auto_905674 ?auto_905686 ) ) ( not ( = ?auto_905674 ?auto_905687 ) ) ( not ( = ?auto_905674 ?auto_905688 ) ) ( not ( = ?auto_905674 ?auto_905689 ) ) ( not ( = ?auto_905674 ?auto_905690 ) ) ( not ( = ?auto_905675 ?auto_905676 ) ) ( not ( = ?auto_905675 ?auto_905677 ) ) ( not ( = ?auto_905675 ?auto_905678 ) ) ( not ( = ?auto_905675 ?auto_905679 ) ) ( not ( = ?auto_905675 ?auto_905680 ) ) ( not ( = ?auto_905675 ?auto_905681 ) ) ( not ( = ?auto_905675 ?auto_905682 ) ) ( not ( = ?auto_905675 ?auto_905683 ) ) ( not ( = ?auto_905675 ?auto_905684 ) ) ( not ( = ?auto_905675 ?auto_905685 ) ) ( not ( = ?auto_905675 ?auto_905686 ) ) ( not ( = ?auto_905675 ?auto_905687 ) ) ( not ( = ?auto_905675 ?auto_905688 ) ) ( not ( = ?auto_905675 ?auto_905689 ) ) ( not ( = ?auto_905675 ?auto_905690 ) ) ( not ( = ?auto_905676 ?auto_905677 ) ) ( not ( = ?auto_905676 ?auto_905678 ) ) ( not ( = ?auto_905676 ?auto_905679 ) ) ( not ( = ?auto_905676 ?auto_905680 ) ) ( not ( = ?auto_905676 ?auto_905681 ) ) ( not ( = ?auto_905676 ?auto_905682 ) ) ( not ( = ?auto_905676 ?auto_905683 ) ) ( not ( = ?auto_905676 ?auto_905684 ) ) ( not ( = ?auto_905676 ?auto_905685 ) ) ( not ( = ?auto_905676 ?auto_905686 ) ) ( not ( = ?auto_905676 ?auto_905687 ) ) ( not ( = ?auto_905676 ?auto_905688 ) ) ( not ( = ?auto_905676 ?auto_905689 ) ) ( not ( = ?auto_905676 ?auto_905690 ) ) ( not ( = ?auto_905677 ?auto_905678 ) ) ( not ( = ?auto_905677 ?auto_905679 ) ) ( not ( = ?auto_905677 ?auto_905680 ) ) ( not ( = ?auto_905677 ?auto_905681 ) ) ( not ( = ?auto_905677 ?auto_905682 ) ) ( not ( = ?auto_905677 ?auto_905683 ) ) ( not ( = ?auto_905677 ?auto_905684 ) ) ( not ( = ?auto_905677 ?auto_905685 ) ) ( not ( = ?auto_905677 ?auto_905686 ) ) ( not ( = ?auto_905677 ?auto_905687 ) ) ( not ( = ?auto_905677 ?auto_905688 ) ) ( not ( = ?auto_905677 ?auto_905689 ) ) ( not ( = ?auto_905677 ?auto_905690 ) ) ( not ( = ?auto_905678 ?auto_905679 ) ) ( not ( = ?auto_905678 ?auto_905680 ) ) ( not ( = ?auto_905678 ?auto_905681 ) ) ( not ( = ?auto_905678 ?auto_905682 ) ) ( not ( = ?auto_905678 ?auto_905683 ) ) ( not ( = ?auto_905678 ?auto_905684 ) ) ( not ( = ?auto_905678 ?auto_905685 ) ) ( not ( = ?auto_905678 ?auto_905686 ) ) ( not ( = ?auto_905678 ?auto_905687 ) ) ( not ( = ?auto_905678 ?auto_905688 ) ) ( not ( = ?auto_905678 ?auto_905689 ) ) ( not ( = ?auto_905678 ?auto_905690 ) ) ( not ( = ?auto_905679 ?auto_905680 ) ) ( not ( = ?auto_905679 ?auto_905681 ) ) ( not ( = ?auto_905679 ?auto_905682 ) ) ( not ( = ?auto_905679 ?auto_905683 ) ) ( not ( = ?auto_905679 ?auto_905684 ) ) ( not ( = ?auto_905679 ?auto_905685 ) ) ( not ( = ?auto_905679 ?auto_905686 ) ) ( not ( = ?auto_905679 ?auto_905687 ) ) ( not ( = ?auto_905679 ?auto_905688 ) ) ( not ( = ?auto_905679 ?auto_905689 ) ) ( not ( = ?auto_905679 ?auto_905690 ) ) ( not ( = ?auto_905680 ?auto_905681 ) ) ( not ( = ?auto_905680 ?auto_905682 ) ) ( not ( = ?auto_905680 ?auto_905683 ) ) ( not ( = ?auto_905680 ?auto_905684 ) ) ( not ( = ?auto_905680 ?auto_905685 ) ) ( not ( = ?auto_905680 ?auto_905686 ) ) ( not ( = ?auto_905680 ?auto_905687 ) ) ( not ( = ?auto_905680 ?auto_905688 ) ) ( not ( = ?auto_905680 ?auto_905689 ) ) ( not ( = ?auto_905680 ?auto_905690 ) ) ( not ( = ?auto_905681 ?auto_905682 ) ) ( not ( = ?auto_905681 ?auto_905683 ) ) ( not ( = ?auto_905681 ?auto_905684 ) ) ( not ( = ?auto_905681 ?auto_905685 ) ) ( not ( = ?auto_905681 ?auto_905686 ) ) ( not ( = ?auto_905681 ?auto_905687 ) ) ( not ( = ?auto_905681 ?auto_905688 ) ) ( not ( = ?auto_905681 ?auto_905689 ) ) ( not ( = ?auto_905681 ?auto_905690 ) ) ( not ( = ?auto_905682 ?auto_905683 ) ) ( not ( = ?auto_905682 ?auto_905684 ) ) ( not ( = ?auto_905682 ?auto_905685 ) ) ( not ( = ?auto_905682 ?auto_905686 ) ) ( not ( = ?auto_905682 ?auto_905687 ) ) ( not ( = ?auto_905682 ?auto_905688 ) ) ( not ( = ?auto_905682 ?auto_905689 ) ) ( not ( = ?auto_905682 ?auto_905690 ) ) ( not ( = ?auto_905683 ?auto_905684 ) ) ( not ( = ?auto_905683 ?auto_905685 ) ) ( not ( = ?auto_905683 ?auto_905686 ) ) ( not ( = ?auto_905683 ?auto_905687 ) ) ( not ( = ?auto_905683 ?auto_905688 ) ) ( not ( = ?auto_905683 ?auto_905689 ) ) ( not ( = ?auto_905683 ?auto_905690 ) ) ( not ( = ?auto_905684 ?auto_905685 ) ) ( not ( = ?auto_905684 ?auto_905686 ) ) ( not ( = ?auto_905684 ?auto_905687 ) ) ( not ( = ?auto_905684 ?auto_905688 ) ) ( not ( = ?auto_905684 ?auto_905689 ) ) ( not ( = ?auto_905684 ?auto_905690 ) ) ( not ( = ?auto_905685 ?auto_905686 ) ) ( not ( = ?auto_905685 ?auto_905687 ) ) ( not ( = ?auto_905685 ?auto_905688 ) ) ( not ( = ?auto_905685 ?auto_905689 ) ) ( not ( = ?auto_905685 ?auto_905690 ) ) ( not ( = ?auto_905686 ?auto_905687 ) ) ( not ( = ?auto_905686 ?auto_905688 ) ) ( not ( = ?auto_905686 ?auto_905689 ) ) ( not ( = ?auto_905686 ?auto_905690 ) ) ( not ( = ?auto_905687 ?auto_905688 ) ) ( not ( = ?auto_905687 ?auto_905689 ) ) ( not ( = ?auto_905687 ?auto_905690 ) ) ( not ( = ?auto_905688 ?auto_905689 ) ) ( not ( = ?auto_905688 ?auto_905690 ) ) ( not ( = ?auto_905689 ?auto_905690 ) ) ( ON ?auto_905689 ?auto_905690 ) ( CLEAR ?auto_905687 ) ( ON ?auto_905688 ?auto_905689 ) ( CLEAR ?auto_905688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_905673 ?auto_905674 ?auto_905675 ?auto_905676 ?auto_905677 ?auto_905678 ?auto_905679 ?auto_905680 ?auto_905681 ?auto_905682 ?auto_905683 ?auto_905684 ?auto_905685 ?auto_905686 ?auto_905687 ?auto_905688 )
      ( MAKE-18PILE ?auto_905673 ?auto_905674 ?auto_905675 ?auto_905676 ?auto_905677 ?auto_905678 ?auto_905679 ?auto_905680 ?auto_905681 ?auto_905682 ?auto_905683 ?auto_905684 ?auto_905685 ?auto_905686 ?auto_905687 ?auto_905688 ?auto_905689 ?auto_905690 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905709 - BLOCK
      ?auto_905710 - BLOCK
      ?auto_905711 - BLOCK
      ?auto_905712 - BLOCK
      ?auto_905713 - BLOCK
      ?auto_905714 - BLOCK
      ?auto_905715 - BLOCK
      ?auto_905716 - BLOCK
      ?auto_905717 - BLOCK
      ?auto_905718 - BLOCK
      ?auto_905719 - BLOCK
      ?auto_905720 - BLOCK
      ?auto_905721 - BLOCK
      ?auto_905722 - BLOCK
      ?auto_905723 - BLOCK
      ?auto_905724 - BLOCK
      ?auto_905725 - BLOCK
      ?auto_905726 - BLOCK
    )
    :vars
    (
      ?auto_905727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_905726 ?auto_905727 ) ( ON-TABLE ?auto_905709 ) ( ON ?auto_905710 ?auto_905709 ) ( ON ?auto_905711 ?auto_905710 ) ( ON ?auto_905712 ?auto_905711 ) ( ON ?auto_905713 ?auto_905712 ) ( ON ?auto_905714 ?auto_905713 ) ( ON ?auto_905715 ?auto_905714 ) ( ON ?auto_905716 ?auto_905715 ) ( ON ?auto_905717 ?auto_905716 ) ( ON ?auto_905718 ?auto_905717 ) ( ON ?auto_905719 ?auto_905718 ) ( ON ?auto_905720 ?auto_905719 ) ( ON ?auto_905721 ?auto_905720 ) ( ON ?auto_905722 ?auto_905721 ) ( not ( = ?auto_905709 ?auto_905710 ) ) ( not ( = ?auto_905709 ?auto_905711 ) ) ( not ( = ?auto_905709 ?auto_905712 ) ) ( not ( = ?auto_905709 ?auto_905713 ) ) ( not ( = ?auto_905709 ?auto_905714 ) ) ( not ( = ?auto_905709 ?auto_905715 ) ) ( not ( = ?auto_905709 ?auto_905716 ) ) ( not ( = ?auto_905709 ?auto_905717 ) ) ( not ( = ?auto_905709 ?auto_905718 ) ) ( not ( = ?auto_905709 ?auto_905719 ) ) ( not ( = ?auto_905709 ?auto_905720 ) ) ( not ( = ?auto_905709 ?auto_905721 ) ) ( not ( = ?auto_905709 ?auto_905722 ) ) ( not ( = ?auto_905709 ?auto_905723 ) ) ( not ( = ?auto_905709 ?auto_905724 ) ) ( not ( = ?auto_905709 ?auto_905725 ) ) ( not ( = ?auto_905709 ?auto_905726 ) ) ( not ( = ?auto_905709 ?auto_905727 ) ) ( not ( = ?auto_905710 ?auto_905711 ) ) ( not ( = ?auto_905710 ?auto_905712 ) ) ( not ( = ?auto_905710 ?auto_905713 ) ) ( not ( = ?auto_905710 ?auto_905714 ) ) ( not ( = ?auto_905710 ?auto_905715 ) ) ( not ( = ?auto_905710 ?auto_905716 ) ) ( not ( = ?auto_905710 ?auto_905717 ) ) ( not ( = ?auto_905710 ?auto_905718 ) ) ( not ( = ?auto_905710 ?auto_905719 ) ) ( not ( = ?auto_905710 ?auto_905720 ) ) ( not ( = ?auto_905710 ?auto_905721 ) ) ( not ( = ?auto_905710 ?auto_905722 ) ) ( not ( = ?auto_905710 ?auto_905723 ) ) ( not ( = ?auto_905710 ?auto_905724 ) ) ( not ( = ?auto_905710 ?auto_905725 ) ) ( not ( = ?auto_905710 ?auto_905726 ) ) ( not ( = ?auto_905710 ?auto_905727 ) ) ( not ( = ?auto_905711 ?auto_905712 ) ) ( not ( = ?auto_905711 ?auto_905713 ) ) ( not ( = ?auto_905711 ?auto_905714 ) ) ( not ( = ?auto_905711 ?auto_905715 ) ) ( not ( = ?auto_905711 ?auto_905716 ) ) ( not ( = ?auto_905711 ?auto_905717 ) ) ( not ( = ?auto_905711 ?auto_905718 ) ) ( not ( = ?auto_905711 ?auto_905719 ) ) ( not ( = ?auto_905711 ?auto_905720 ) ) ( not ( = ?auto_905711 ?auto_905721 ) ) ( not ( = ?auto_905711 ?auto_905722 ) ) ( not ( = ?auto_905711 ?auto_905723 ) ) ( not ( = ?auto_905711 ?auto_905724 ) ) ( not ( = ?auto_905711 ?auto_905725 ) ) ( not ( = ?auto_905711 ?auto_905726 ) ) ( not ( = ?auto_905711 ?auto_905727 ) ) ( not ( = ?auto_905712 ?auto_905713 ) ) ( not ( = ?auto_905712 ?auto_905714 ) ) ( not ( = ?auto_905712 ?auto_905715 ) ) ( not ( = ?auto_905712 ?auto_905716 ) ) ( not ( = ?auto_905712 ?auto_905717 ) ) ( not ( = ?auto_905712 ?auto_905718 ) ) ( not ( = ?auto_905712 ?auto_905719 ) ) ( not ( = ?auto_905712 ?auto_905720 ) ) ( not ( = ?auto_905712 ?auto_905721 ) ) ( not ( = ?auto_905712 ?auto_905722 ) ) ( not ( = ?auto_905712 ?auto_905723 ) ) ( not ( = ?auto_905712 ?auto_905724 ) ) ( not ( = ?auto_905712 ?auto_905725 ) ) ( not ( = ?auto_905712 ?auto_905726 ) ) ( not ( = ?auto_905712 ?auto_905727 ) ) ( not ( = ?auto_905713 ?auto_905714 ) ) ( not ( = ?auto_905713 ?auto_905715 ) ) ( not ( = ?auto_905713 ?auto_905716 ) ) ( not ( = ?auto_905713 ?auto_905717 ) ) ( not ( = ?auto_905713 ?auto_905718 ) ) ( not ( = ?auto_905713 ?auto_905719 ) ) ( not ( = ?auto_905713 ?auto_905720 ) ) ( not ( = ?auto_905713 ?auto_905721 ) ) ( not ( = ?auto_905713 ?auto_905722 ) ) ( not ( = ?auto_905713 ?auto_905723 ) ) ( not ( = ?auto_905713 ?auto_905724 ) ) ( not ( = ?auto_905713 ?auto_905725 ) ) ( not ( = ?auto_905713 ?auto_905726 ) ) ( not ( = ?auto_905713 ?auto_905727 ) ) ( not ( = ?auto_905714 ?auto_905715 ) ) ( not ( = ?auto_905714 ?auto_905716 ) ) ( not ( = ?auto_905714 ?auto_905717 ) ) ( not ( = ?auto_905714 ?auto_905718 ) ) ( not ( = ?auto_905714 ?auto_905719 ) ) ( not ( = ?auto_905714 ?auto_905720 ) ) ( not ( = ?auto_905714 ?auto_905721 ) ) ( not ( = ?auto_905714 ?auto_905722 ) ) ( not ( = ?auto_905714 ?auto_905723 ) ) ( not ( = ?auto_905714 ?auto_905724 ) ) ( not ( = ?auto_905714 ?auto_905725 ) ) ( not ( = ?auto_905714 ?auto_905726 ) ) ( not ( = ?auto_905714 ?auto_905727 ) ) ( not ( = ?auto_905715 ?auto_905716 ) ) ( not ( = ?auto_905715 ?auto_905717 ) ) ( not ( = ?auto_905715 ?auto_905718 ) ) ( not ( = ?auto_905715 ?auto_905719 ) ) ( not ( = ?auto_905715 ?auto_905720 ) ) ( not ( = ?auto_905715 ?auto_905721 ) ) ( not ( = ?auto_905715 ?auto_905722 ) ) ( not ( = ?auto_905715 ?auto_905723 ) ) ( not ( = ?auto_905715 ?auto_905724 ) ) ( not ( = ?auto_905715 ?auto_905725 ) ) ( not ( = ?auto_905715 ?auto_905726 ) ) ( not ( = ?auto_905715 ?auto_905727 ) ) ( not ( = ?auto_905716 ?auto_905717 ) ) ( not ( = ?auto_905716 ?auto_905718 ) ) ( not ( = ?auto_905716 ?auto_905719 ) ) ( not ( = ?auto_905716 ?auto_905720 ) ) ( not ( = ?auto_905716 ?auto_905721 ) ) ( not ( = ?auto_905716 ?auto_905722 ) ) ( not ( = ?auto_905716 ?auto_905723 ) ) ( not ( = ?auto_905716 ?auto_905724 ) ) ( not ( = ?auto_905716 ?auto_905725 ) ) ( not ( = ?auto_905716 ?auto_905726 ) ) ( not ( = ?auto_905716 ?auto_905727 ) ) ( not ( = ?auto_905717 ?auto_905718 ) ) ( not ( = ?auto_905717 ?auto_905719 ) ) ( not ( = ?auto_905717 ?auto_905720 ) ) ( not ( = ?auto_905717 ?auto_905721 ) ) ( not ( = ?auto_905717 ?auto_905722 ) ) ( not ( = ?auto_905717 ?auto_905723 ) ) ( not ( = ?auto_905717 ?auto_905724 ) ) ( not ( = ?auto_905717 ?auto_905725 ) ) ( not ( = ?auto_905717 ?auto_905726 ) ) ( not ( = ?auto_905717 ?auto_905727 ) ) ( not ( = ?auto_905718 ?auto_905719 ) ) ( not ( = ?auto_905718 ?auto_905720 ) ) ( not ( = ?auto_905718 ?auto_905721 ) ) ( not ( = ?auto_905718 ?auto_905722 ) ) ( not ( = ?auto_905718 ?auto_905723 ) ) ( not ( = ?auto_905718 ?auto_905724 ) ) ( not ( = ?auto_905718 ?auto_905725 ) ) ( not ( = ?auto_905718 ?auto_905726 ) ) ( not ( = ?auto_905718 ?auto_905727 ) ) ( not ( = ?auto_905719 ?auto_905720 ) ) ( not ( = ?auto_905719 ?auto_905721 ) ) ( not ( = ?auto_905719 ?auto_905722 ) ) ( not ( = ?auto_905719 ?auto_905723 ) ) ( not ( = ?auto_905719 ?auto_905724 ) ) ( not ( = ?auto_905719 ?auto_905725 ) ) ( not ( = ?auto_905719 ?auto_905726 ) ) ( not ( = ?auto_905719 ?auto_905727 ) ) ( not ( = ?auto_905720 ?auto_905721 ) ) ( not ( = ?auto_905720 ?auto_905722 ) ) ( not ( = ?auto_905720 ?auto_905723 ) ) ( not ( = ?auto_905720 ?auto_905724 ) ) ( not ( = ?auto_905720 ?auto_905725 ) ) ( not ( = ?auto_905720 ?auto_905726 ) ) ( not ( = ?auto_905720 ?auto_905727 ) ) ( not ( = ?auto_905721 ?auto_905722 ) ) ( not ( = ?auto_905721 ?auto_905723 ) ) ( not ( = ?auto_905721 ?auto_905724 ) ) ( not ( = ?auto_905721 ?auto_905725 ) ) ( not ( = ?auto_905721 ?auto_905726 ) ) ( not ( = ?auto_905721 ?auto_905727 ) ) ( not ( = ?auto_905722 ?auto_905723 ) ) ( not ( = ?auto_905722 ?auto_905724 ) ) ( not ( = ?auto_905722 ?auto_905725 ) ) ( not ( = ?auto_905722 ?auto_905726 ) ) ( not ( = ?auto_905722 ?auto_905727 ) ) ( not ( = ?auto_905723 ?auto_905724 ) ) ( not ( = ?auto_905723 ?auto_905725 ) ) ( not ( = ?auto_905723 ?auto_905726 ) ) ( not ( = ?auto_905723 ?auto_905727 ) ) ( not ( = ?auto_905724 ?auto_905725 ) ) ( not ( = ?auto_905724 ?auto_905726 ) ) ( not ( = ?auto_905724 ?auto_905727 ) ) ( not ( = ?auto_905725 ?auto_905726 ) ) ( not ( = ?auto_905725 ?auto_905727 ) ) ( not ( = ?auto_905726 ?auto_905727 ) ) ( ON ?auto_905725 ?auto_905726 ) ( ON ?auto_905724 ?auto_905725 ) ( CLEAR ?auto_905722 ) ( ON ?auto_905723 ?auto_905724 ) ( CLEAR ?auto_905723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_905709 ?auto_905710 ?auto_905711 ?auto_905712 ?auto_905713 ?auto_905714 ?auto_905715 ?auto_905716 ?auto_905717 ?auto_905718 ?auto_905719 ?auto_905720 ?auto_905721 ?auto_905722 ?auto_905723 )
      ( MAKE-18PILE ?auto_905709 ?auto_905710 ?auto_905711 ?auto_905712 ?auto_905713 ?auto_905714 ?auto_905715 ?auto_905716 ?auto_905717 ?auto_905718 ?auto_905719 ?auto_905720 ?auto_905721 ?auto_905722 ?auto_905723 ?auto_905724 ?auto_905725 ?auto_905726 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905746 - BLOCK
      ?auto_905747 - BLOCK
      ?auto_905748 - BLOCK
      ?auto_905749 - BLOCK
      ?auto_905750 - BLOCK
      ?auto_905751 - BLOCK
      ?auto_905752 - BLOCK
      ?auto_905753 - BLOCK
      ?auto_905754 - BLOCK
      ?auto_905755 - BLOCK
      ?auto_905756 - BLOCK
      ?auto_905757 - BLOCK
      ?auto_905758 - BLOCK
      ?auto_905759 - BLOCK
      ?auto_905760 - BLOCK
      ?auto_905761 - BLOCK
      ?auto_905762 - BLOCK
      ?auto_905763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_905763 ) ( ON-TABLE ?auto_905746 ) ( ON ?auto_905747 ?auto_905746 ) ( ON ?auto_905748 ?auto_905747 ) ( ON ?auto_905749 ?auto_905748 ) ( ON ?auto_905750 ?auto_905749 ) ( ON ?auto_905751 ?auto_905750 ) ( ON ?auto_905752 ?auto_905751 ) ( ON ?auto_905753 ?auto_905752 ) ( ON ?auto_905754 ?auto_905753 ) ( ON ?auto_905755 ?auto_905754 ) ( ON ?auto_905756 ?auto_905755 ) ( ON ?auto_905757 ?auto_905756 ) ( ON ?auto_905758 ?auto_905757 ) ( ON ?auto_905759 ?auto_905758 ) ( not ( = ?auto_905746 ?auto_905747 ) ) ( not ( = ?auto_905746 ?auto_905748 ) ) ( not ( = ?auto_905746 ?auto_905749 ) ) ( not ( = ?auto_905746 ?auto_905750 ) ) ( not ( = ?auto_905746 ?auto_905751 ) ) ( not ( = ?auto_905746 ?auto_905752 ) ) ( not ( = ?auto_905746 ?auto_905753 ) ) ( not ( = ?auto_905746 ?auto_905754 ) ) ( not ( = ?auto_905746 ?auto_905755 ) ) ( not ( = ?auto_905746 ?auto_905756 ) ) ( not ( = ?auto_905746 ?auto_905757 ) ) ( not ( = ?auto_905746 ?auto_905758 ) ) ( not ( = ?auto_905746 ?auto_905759 ) ) ( not ( = ?auto_905746 ?auto_905760 ) ) ( not ( = ?auto_905746 ?auto_905761 ) ) ( not ( = ?auto_905746 ?auto_905762 ) ) ( not ( = ?auto_905746 ?auto_905763 ) ) ( not ( = ?auto_905747 ?auto_905748 ) ) ( not ( = ?auto_905747 ?auto_905749 ) ) ( not ( = ?auto_905747 ?auto_905750 ) ) ( not ( = ?auto_905747 ?auto_905751 ) ) ( not ( = ?auto_905747 ?auto_905752 ) ) ( not ( = ?auto_905747 ?auto_905753 ) ) ( not ( = ?auto_905747 ?auto_905754 ) ) ( not ( = ?auto_905747 ?auto_905755 ) ) ( not ( = ?auto_905747 ?auto_905756 ) ) ( not ( = ?auto_905747 ?auto_905757 ) ) ( not ( = ?auto_905747 ?auto_905758 ) ) ( not ( = ?auto_905747 ?auto_905759 ) ) ( not ( = ?auto_905747 ?auto_905760 ) ) ( not ( = ?auto_905747 ?auto_905761 ) ) ( not ( = ?auto_905747 ?auto_905762 ) ) ( not ( = ?auto_905747 ?auto_905763 ) ) ( not ( = ?auto_905748 ?auto_905749 ) ) ( not ( = ?auto_905748 ?auto_905750 ) ) ( not ( = ?auto_905748 ?auto_905751 ) ) ( not ( = ?auto_905748 ?auto_905752 ) ) ( not ( = ?auto_905748 ?auto_905753 ) ) ( not ( = ?auto_905748 ?auto_905754 ) ) ( not ( = ?auto_905748 ?auto_905755 ) ) ( not ( = ?auto_905748 ?auto_905756 ) ) ( not ( = ?auto_905748 ?auto_905757 ) ) ( not ( = ?auto_905748 ?auto_905758 ) ) ( not ( = ?auto_905748 ?auto_905759 ) ) ( not ( = ?auto_905748 ?auto_905760 ) ) ( not ( = ?auto_905748 ?auto_905761 ) ) ( not ( = ?auto_905748 ?auto_905762 ) ) ( not ( = ?auto_905748 ?auto_905763 ) ) ( not ( = ?auto_905749 ?auto_905750 ) ) ( not ( = ?auto_905749 ?auto_905751 ) ) ( not ( = ?auto_905749 ?auto_905752 ) ) ( not ( = ?auto_905749 ?auto_905753 ) ) ( not ( = ?auto_905749 ?auto_905754 ) ) ( not ( = ?auto_905749 ?auto_905755 ) ) ( not ( = ?auto_905749 ?auto_905756 ) ) ( not ( = ?auto_905749 ?auto_905757 ) ) ( not ( = ?auto_905749 ?auto_905758 ) ) ( not ( = ?auto_905749 ?auto_905759 ) ) ( not ( = ?auto_905749 ?auto_905760 ) ) ( not ( = ?auto_905749 ?auto_905761 ) ) ( not ( = ?auto_905749 ?auto_905762 ) ) ( not ( = ?auto_905749 ?auto_905763 ) ) ( not ( = ?auto_905750 ?auto_905751 ) ) ( not ( = ?auto_905750 ?auto_905752 ) ) ( not ( = ?auto_905750 ?auto_905753 ) ) ( not ( = ?auto_905750 ?auto_905754 ) ) ( not ( = ?auto_905750 ?auto_905755 ) ) ( not ( = ?auto_905750 ?auto_905756 ) ) ( not ( = ?auto_905750 ?auto_905757 ) ) ( not ( = ?auto_905750 ?auto_905758 ) ) ( not ( = ?auto_905750 ?auto_905759 ) ) ( not ( = ?auto_905750 ?auto_905760 ) ) ( not ( = ?auto_905750 ?auto_905761 ) ) ( not ( = ?auto_905750 ?auto_905762 ) ) ( not ( = ?auto_905750 ?auto_905763 ) ) ( not ( = ?auto_905751 ?auto_905752 ) ) ( not ( = ?auto_905751 ?auto_905753 ) ) ( not ( = ?auto_905751 ?auto_905754 ) ) ( not ( = ?auto_905751 ?auto_905755 ) ) ( not ( = ?auto_905751 ?auto_905756 ) ) ( not ( = ?auto_905751 ?auto_905757 ) ) ( not ( = ?auto_905751 ?auto_905758 ) ) ( not ( = ?auto_905751 ?auto_905759 ) ) ( not ( = ?auto_905751 ?auto_905760 ) ) ( not ( = ?auto_905751 ?auto_905761 ) ) ( not ( = ?auto_905751 ?auto_905762 ) ) ( not ( = ?auto_905751 ?auto_905763 ) ) ( not ( = ?auto_905752 ?auto_905753 ) ) ( not ( = ?auto_905752 ?auto_905754 ) ) ( not ( = ?auto_905752 ?auto_905755 ) ) ( not ( = ?auto_905752 ?auto_905756 ) ) ( not ( = ?auto_905752 ?auto_905757 ) ) ( not ( = ?auto_905752 ?auto_905758 ) ) ( not ( = ?auto_905752 ?auto_905759 ) ) ( not ( = ?auto_905752 ?auto_905760 ) ) ( not ( = ?auto_905752 ?auto_905761 ) ) ( not ( = ?auto_905752 ?auto_905762 ) ) ( not ( = ?auto_905752 ?auto_905763 ) ) ( not ( = ?auto_905753 ?auto_905754 ) ) ( not ( = ?auto_905753 ?auto_905755 ) ) ( not ( = ?auto_905753 ?auto_905756 ) ) ( not ( = ?auto_905753 ?auto_905757 ) ) ( not ( = ?auto_905753 ?auto_905758 ) ) ( not ( = ?auto_905753 ?auto_905759 ) ) ( not ( = ?auto_905753 ?auto_905760 ) ) ( not ( = ?auto_905753 ?auto_905761 ) ) ( not ( = ?auto_905753 ?auto_905762 ) ) ( not ( = ?auto_905753 ?auto_905763 ) ) ( not ( = ?auto_905754 ?auto_905755 ) ) ( not ( = ?auto_905754 ?auto_905756 ) ) ( not ( = ?auto_905754 ?auto_905757 ) ) ( not ( = ?auto_905754 ?auto_905758 ) ) ( not ( = ?auto_905754 ?auto_905759 ) ) ( not ( = ?auto_905754 ?auto_905760 ) ) ( not ( = ?auto_905754 ?auto_905761 ) ) ( not ( = ?auto_905754 ?auto_905762 ) ) ( not ( = ?auto_905754 ?auto_905763 ) ) ( not ( = ?auto_905755 ?auto_905756 ) ) ( not ( = ?auto_905755 ?auto_905757 ) ) ( not ( = ?auto_905755 ?auto_905758 ) ) ( not ( = ?auto_905755 ?auto_905759 ) ) ( not ( = ?auto_905755 ?auto_905760 ) ) ( not ( = ?auto_905755 ?auto_905761 ) ) ( not ( = ?auto_905755 ?auto_905762 ) ) ( not ( = ?auto_905755 ?auto_905763 ) ) ( not ( = ?auto_905756 ?auto_905757 ) ) ( not ( = ?auto_905756 ?auto_905758 ) ) ( not ( = ?auto_905756 ?auto_905759 ) ) ( not ( = ?auto_905756 ?auto_905760 ) ) ( not ( = ?auto_905756 ?auto_905761 ) ) ( not ( = ?auto_905756 ?auto_905762 ) ) ( not ( = ?auto_905756 ?auto_905763 ) ) ( not ( = ?auto_905757 ?auto_905758 ) ) ( not ( = ?auto_905757 ?auto_905759 ) ) ( not ( = ?auto_905757 ?auto_905760 ) ) ( not ( = ?auto_905757 ?auto_905761 ) ) ( not ( = ?auto_905757 ?auto_905762 ) ) ( not ( = ?auto_905757 ?auto_905763 ) ) ( not ( = ?auto_905758 ?auto_905759 ) ) ( not ( = ?auto_905758 ?auto_905760 ) ) ( not ( = ?auto_905758 ?auto_905761 ) ) ( not ( = ?auto_905758 ?auto_905762 ) ) ( not ( = ?auto_905758 ?auto_905763 ) ) ( not ( = ?auto_905759 ?auto_905760 ) ) ( not ( = ?auto_905759 ?auto_905761 ) ) ( not ( = ?auto_905759 ?auto_905762 ) ) ( not ( = ?auto_905759 ?auto_905763 ) ) ( not ( = ?auto_905760 ?auto_905761 ) ) ( not ( = ?auto_905760 ?auto_905762 ) ) ( not ( = ?auto_905760 ?auto_905763 ) ) ( not ( = ?auto_905761 ?auto_905762 ) ) ( not ( = ?auto_905761 ?auto_905763 ) ) ( not ( = ?auto_905762 ?auto_905763 ) ) ( ON ?auto_905762 ?auto_905763 ) ( ON ?auto_905761 ?auto_905762 ) ( CLEAR ?auto_905759 ) ( ON ?auto_905760 ?auto_905761 ) ( CLEAR ?auto_905760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_905746 ?auto_905747 ?auto_905748 ?auto_905749 ?auto_905750 ?auto_905751 ?auto_905752 ?auto_905753 ?auto_905754 ?auto_905755 ?auto_905756 ?auto_905757 ?auto_905758 ?auto_905759 ?auto_905760 )
      ( MAKE-18PILE ?auto_905746 ?auto_905747 ?auto_905748 ?auto_905749 ?auto_905750 ?auto_905751 ?auto_905752 ?auto_905753 ?auto_905754 ?auto_905755 ?auto_905756 ?auto_905757 ?auto_905758 ?auto_905759 ?auto_905760 ?auto_905761 ?auto_905762 ?auto_905763 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905782 - BLOCK
      ?auto_905783 - BLOCK
      ?auto_905784 - BLOCK
      ?auto_905785 - BLOCK
      ?auto_905786 - BLOCK
      ?auto_905787 - BLOCK
      ?auto_905788 - BLOCK
      ?auto_905789 - BLOCK
      ?auto_905790 - BLOCK
      ?auto_905791 - BLOCK
      ?auto_905792 - BLOCK
      ?auto_905793 - BLOCK
      ?auto_905794 - BLOCK
      ?auto_905795 - BLOCK
      ?auto_905796 - BLOCK
      ?auto_905797 - BLOCK
      ?auto_905798 - BLOCK
      ?auto_905799 - BLOCK
    )
    :vars
    (
      ?auto_905800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_905799 ?auto_905800 ) ( ON-TABLE ?auto_905782 ) ( ON ?auto_905783 ?auto_905782 ) ( ON ?auto_905784 ?auto_905783 ) ( ON ?auto_905785 ?auto_905784 ) ( ON ?auto_905786 ?auto_905785 ) ( ON ?auto_905787 ?auto_905786 ) ( ON ?auto_905788 ?auto_905787 ) ( ON ?auto_905789 ?auto_905788 ) ( ON ?auto_905790 ?auto_905789 ) ( ON ?auto_905791 ?auto_905790 ) ( ON ?auto_905792 ?auto_905791 ) ( ON ?auto_905793 ?auto_905792 ) ( ON ?auto_905794 ?auto_905793 ) ( not ( = ?auto_905782 ?auto_905783 ) ) ( not ( = ?auto_905782 ?auto_905784 ) ) ( not ( = ?auto_905782 ?auto_905785 ) ) ( not ( = ?auto_905782 ?auto_905786 ) ) ( not ( = ?auto_905782 ?auto_905787 ) ) ( not ( = ?auto_905782 ?auto_905788 ) ) ( not ( = ?auto_905782 ?auto_905789 ) ) ( not ( = ?auto_905782 ?auto_905790 ) ) ( not ( = ?auto_905782 ?auto_905791 ) ) ( not ( = ?auto_905782 ?auto_905792 ) ) ( not ( = ?auto_905782 ?auto_905793 ) ) ( not ( = ?auto_905782 ?auto_905794 ) ) ( not ( = ?auto_905782 ?auto_905795 ) ) ( not ( = ?auto_905782 ?auto_905796 ) ) ( not ( = ?auto_905782 ?auto_905797 ) ) ( not ( = ?auto_905782 ?auto_905798 ) ) ( not ( = ?auto_905782 ?auto_905799 ) ) ( not ( = ?auto_905782 ?auto_905800 ) ) ( not ( = ?auto_905783 ?auto_905784 ) ) ( not ( = ?auto_905783 ?auto_905785 ) ) ( not ( = ?auto_905783 ?auto_905786 ) ) ( not ( = ?auto_905783 ?auto_905787 ) ) ( not ( = ?auto_905783 ?auto_905788 ) ) ( not ( = ?auto_905783 ?auto_905789 ) ) ( not ( = ?auto_905783 ?auto_905790 ) ) ( not ( = ?auto_905783 ?auto_905791 ) ) ( not ( = ?auto_905783 ?auto_905792 ) ) ( not ( = ?auto_905783 ?auto_905793 ) ) ( not ( = ?auto_905783 ?auto_905794 ) ) ( not ( = ?auto_905783 ?auto_905795 ) ) ( not ( = ?auto_905783 ?auto_905796 ) ) ( not ( = ?auto_905783 ?auto_905797 ) ) ( not ( = ?auto_905783 ?auto_905798 ) ) ( not ( = ?auto_905783 ?auto_905799 ) ) ( not ( = ?auto_905783 ?auto_905800 ) ) ( not ( = ?auto_905784 ?auto_905785 ) ) ( not ( = ?auto_905784 ?auto_905786 ) ) ( not ( = ?auto_905784 ?auto_905787 ) ) ( not ( = ?auto_905784 ?auto_905788 ) ) ( not ( = ?auto_905784 ?auto_905789 ) ) ( not ( = ?auto_905784 ?auto_905790 ) ) ( not ( = ?auto_905784 ?auto_905791 ) ) ( not ( = ?auto_905784 ?auto_905792 ) ) ( not ( = ?auto_905784 ?auto_905793 ) ) ( not ( = ?auto_905784 ?auto_905794 ) ) ( not ( = ?auto_905784 ?auto_905795 ) ) ( not ( = ?auto_905784 ?auto_905796 ) ) ( not ( = ?auto_905784 ?auto_905797 ) ) ( not ( = ?auto_905784 ?auto_905798 ) ) ( not ( = ?auto_905784 ?auto_905799 ) ) ( not ( = ?auto_905784 ?auto_905800 ) ) ( not ( = ?auto_905785 ?auto_905786 ) ) ( not ( = ?auto_905785 ?auto_905787 ) ) ( not ( = ?auto_905785 ?auto_905788 ) ) ( not ( = ?auto_905785 ?auto_905789 ) ) ( not ( = ?auto_905785 ?auto_905790 ) ) ( not ( = ?auto_905785 ?auto_905791 ) ) ( not ( = ?auto_905785 ?auto_905792 ) ) ( not ( = ?auto_905785 ?auto_905793 ) ) ( not ( = ?auto_905785 ?auto_905794 ) ) ( not ( = ?auto_905785 ?auto_905795 ) ) ( not ( = ?auto_905785 ?auto_905796 ) ) ( not ( = ?auto_905785 ?auto_905797 ) ) ( not ( = ?auto_905785 ?auto_905798 ) ) ( not ( = ?auto_905785 ?auto_905799 ) ) ( not ( = ?auto_905785 ?auto_905800 ) ) ( not ( = ?auto_905786 ?auto_905787 ) ) ( not ( = ?auto_905786 ?auto_905788 ) ) ( not ( = ?auto_905786 ?auto_905789 ) ) ( not ( = ?auto_905786 ?auto_905790 ) ) ( not ( = ?auto_905786 ?auto_905791 ) ) ( not ( = ?auto_905786 ?auto_905792 ) ) ( not ( = ?auto_905786 ?auto_905793 ) ) ( not ( = ?auto_905786 ?auto_905794 ) ) ( not ( = ?auto_905786 ?auto_905795 ) ) ( not ( = ?auto_905786 ?auto_905796 ) ) ( not ( = ?auto_905786 ?auto_905797 ) ) ( not ( = ?auto_905786 ?auto_905798 ) ) ( not ( = ?auto_905786 ?auto_905799 ) ) ( not ( = ?auto_905786 ?auto_905800 ) ) ( not ( = ?auto_905787 ?auto_905788 ) ) ( not ( = ?auto_905787 ?auto_905789 ) ) ( not ( = ?auto_905787 ?auto_905790 ) ) ( not ( = ?auto_905787 ?auto_905791 ) ) ( not ( = ?auto_905787 ?auto_905792 ) ) ( not ( = ?auto_905787 ?auto_905793 ) ) ( not ( = ?auto_905787 ?auto_905794 ) ) ( not ( = ?auto_905787 ?auto_905795 ) ) ( not ( = ?auto_905787 ?auto_905796 ) ) ( not ( = ?auto_905787 ?auto_905797 ) ) ( not ( = ?auto_905787 ?auto_905798 ) ) ( not ( = ?auto_905787 ?auto_905799 ) ) ( not ( = ?auto_905787 ?auto_905800 ) ) ( not ( = ?auto_905788 ?auto_905789 ) ) ( not ( = ?auto_905788 ?auto_905790 ) ) ( not ( = ?auto_905788 ?auto_905791 ) ) ( not ( = ?auto_905788 ?auto_905792 ) ) ( not ( = ?auto_905788 ?auto_905793 ) ) ( not ( = ?auto_905788 ?auto_905794 ) ) ( not ( = ?auto_905788 ?auto_905795 ) ) ( not ( = ?auto_905788 ?auto_905796 ) ) ( not ( = ?auto_905788 ?auto_905797 ) ) ( not ( = ?auto_905788 ?auto_905798 ) ) ( not ( = ?auto_905788 ?auto_905799 ) ) ( not ( = ?auto_905788 ?auto_905800 ) ) ( not ( = ?auto_905789 ?auto_905790 ) ) ( not ( = ?auto_905789 ?auto_905791 ) ) ( not ( = ?auto_905789 ?auto_905792 ) ) ( not ( = ?auto_905789 ?auto_905793 ) ) ( not ( = ?auto_905789 ?auto_905794 ) ) ( not ( = ?auto_905789 ?auto_905795 ) ) ( not ( = ?auto_905789 ?auto_905796 ) ) ( not ( = ?auto_905789 ?auto_905797 ) ) ( not ( = ?auto_905789 ?auto_905798 ) ) ( not ( = ?auto_905789 ?auto_905799 ) ) ( not ( = ?auto_905789 ?auto_905800 ) ) ( not ( = ?auto_905790 ?auto_905791 ) ) ( not ( = ?auto_905790 ?auto_905792 ) ) ( not ( = ?auto_905790 ?auto_905793 ) ) ( not ( = ?auto_905790 ?auto_905794 ) ) ( not ( = ?auto_905790 ?auto_905795 ) ) ( not ( = ?auto_905790 ?auto_905796 ) ) ( not ( = ?auto_905790 ?auto_905797 ) ) ( not ( = ?auto_905790 ?auto_905798 ) ) ( not ( = ?auto_905790 ?auto_905799 ) ) ( not ( = ?auto_905790 ?auto_905800 ) ) ( not ( = ?auto_905791 ?auto_905792 ) ) ( not ( = ?auto_905791 ?auto_905793 ) ) ( not ( = ?auto_905791 ?auto_905794 ) ) ( not ( = ?auto_905791 ?auto_905795 ) ) ( not ( = ?auto_905791 ?auto_905796 ) ) ( not ( = ?auto_905791 ?auto_905797 ) ) ( not ( = ?auto_905791 ?auto_905798 ) ) ( not ( = ?auto_905791 ?auto_905799 ) ) ( not ( = ?auto_905791 ?auto_905800 ) ) ( not ( = ?auto_905792 ?auto_905793 ) ) ( not ( = ?auto_905792 ?auto_905794 ) ) ( not ( = ?auto_905792 ?auto_905795 ) ) ( not ( = ?auto_905792 ?auto_905796 ) ) ( not ( = ?auto_905792 ?auto_905797 ) ) ( not ( = ?auto_905792 ?auto_905798 ) ) ( not ( = ?auto_905792 ?auto_905799 ) ) ( not ( = ?auto_905792 ?auto_905800 ) ) ( not ( = ?auto_905793 ?auto_905794 ) ) ( not ( = ?auto_905793 ?auto_905795 ) ) ( not ( = ?auto_905793 ?auto_905796 ) ) ( not ( = ?auto_905793 ?auto_905797 ) ) ( not ( = ?auto_905793 ?auto_905798 ) ) ( not ( = ?auto_905793 ?auto_905799 ) ) ( not ( = ?auto_905793 ?auto_905800 ) ) ( not ( = ?auto_905794 ?auto_905795 ) ) ( not ( = ?auto_905794 ?auto_905796 ) ) ( not ( = ?auto_905794 ?auto_905797 ) ) ( not ( = ?auto_905794 ?auto_905798 ) ) ( not ( = ?auto_905794 ?auto_905799 ) ) ( not ( = ?auto_905794 ?auto_905800 ) ) ( not ( = ?auto_905795 ?auto_905796 ) ) ( not ( = ?auto_905795 ?auto_905797 ) ) ( not ( = ?auto_905795 ?auto_905798 ) ) ( not ( = ?auto_905795 ?auto_905799 ) ) ( not ( = ?auto_905795 ?auto_905800 ) ) ( not ( = ?auto_905796 ?auto_905797 ) ) ( not ( = ?auto_905796 ?auto_905798 ) ) ( not ( = ?auto_905796 ?auto_905799 ) ) ( not ( = ?auto_905796 ?auto_905800 ) ) ( not ( = ?auto_905797 ?auto_905798 ) ) ( not ( = ?auto_905797 ?auto_905799 ) ) ( not ( = ?auto_905797 ?auto_905800 ) ) ( not ( = ?auto_905798 ?auto_905799 ) ) ( not ( = ?auto_905798 ?auto_905800 ) ) ( not ( = ?auto_905799 ?auto_905800 ) ) ( ON ?auto_905798 ?auto_905799 ) ( ON ?auto_905797 ?auto_905798 ) ( ON ?auto_905796 ?auto_905797 ) ( CLEAR ?auto_905794 ) ( ON ?auto_905795 ?auto_905796 ) ( CLEAR ?auto_905795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_905782 ?auto_905783 ?auto_905784 ?auto_905785 ?auto_905786 ?auto_905787 ?auto_905788 ?auto_905789 ?auto_905790 ?auto_905791 ?auto_905792 ?auto_905793 ?auto_905794 ?auto_905795 )
      ( MAKE-18PILE ?auto_905782 ?auto_905783 ?auto_905784 ?auto_905785 ?auto_905786 ?auto_905787 ?auto_905788 ?auto_905789 ?auto_905790 ?auto_905791 ?auto_905792 ?auto_905793 ?auto_905794 ?auto_905795 ?auto_905796 ?auto_905797 ?auto_905798 ?auto_905799 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905819 - BLOCK
      ?auto_905820 - BLOCK
      ?auto_905821 - BLOCK
      ?auto_905822 - BLOCK
      ?auto_905823 - BLOCK
      ?auto_905824 - BLOCK
      ?auto_905825 - BLOCK
      ?auto_905826 - BLOCK
      ?auto_905827 - BLOCK
      ?auto_905828 - BLOCK
      ?auto_905829 - BLOCK
      ?auto_905830 - BLOCK
      ?auto_905831 - BLOCK
      ?auto_905832 - BLOCK
      ?auto_905833 - BLOCK
      ?auto_905834 - BLOCK
      ?auto_905835 - BLOCK
      ?auto_905836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_905836 ) ( ON-TABLE ?auto_905819 ) ( ON ?auto_905820 ?auto_905819 ) ( ON ?auto_905821 ?auto_905820 ) ( ON ?auto_905822 ?auto_905821 ) ( ON ?auto_905823 ?auto_905822 ) ( ON ?auto_905824 ?auto_905823 ) ( ON ?auto_905825 ?auto_905824 ) ( ON ?auto_905826 ?auto_905825 ) ( ON ?auto_905827 ?auto_905826 ) ( ON ?auto_905828 ?auto_905827 ) ( ON ?auto_905829 ?auto_905828 ) ( ON ?auto_905830 ?auto_905829 ) ( ON ?auto_905831 ?auto_905830 ) ( not ( = ?auto_905819 ?auto_905820 ) ) ( not ( = ?auto_905819 ?auto_905821 ) ) ( not ( = ?auto_905819 ?auto_905822 ) ) ( not ( = ?auto_905819 ?auto_905823 ) ) ( not ( = ?auto_905819 ?auto_905824 ) ) ( not ( = ?auto_905819 ?auto_905825 ) ) ( not ( = ?auto_905819 ?auto_905826 ) ) ( not ( = ?auto_905819 ?auto_905827 ) ) ( not ( = ?auto_905819 ?auto_905828 ) ) ( not ( = ?auto_905819 ?auto_905829 ) ) ( not ( = ?auto_905819 ?auto_905830 ) ) ( not ( = ?auto_905819 ?auto_905831 ) ) ( not ( = ?auto_905819 ?auto_905832 ) ) ( not ( = ?auto_905819 ?auto_905833 ) ) ( not ( = ?auto_905819 ?auto_905834 ) ) ( not ( = ?auto_905819 ?auto_905835 ) ) ( not ( = ?auto_905819 ?auto_905836 ) ) ( not ( = ?auto_905820 ?auto_905821 ) ) ( not ( = ?auto_905820 ?auto_905822 ) ) ( not ( = ?auto_905820 ?auto_905823 ) ) ( not ( = ?auto_905820 ?auto_905824 ) ) ( not ( = ?auto_905820 ?auto_905825 ) ) ( not ( = ?auto_905820 ?auto_905826 ) ) ( not ( = ?auto_905820 ?auto_905827 ) ) ( not ( = ?auto_905820 ?auto_905828 ) ) ( not ( = ?auto_905820 ?auto_905829 ) ) ( not ( = ?auto_905820 ?auto_905830 ) ) ( not ( = ?auto_905820 ?auto_905831 ) ) ( not ( = ?auto_905820 ?auto_905832 ) ) ( not ( = ?auto_905820 ?auto_905833 ) ) ( not ( = ?auto_905820 ?auto_905834 ) ) ( not ( = ?auto_905820 ?auto_905835 ) ) ( not ( = ?auto_905820 ?auto_905836 ) ) ( not ( = ?auto_905821 ?auto_905822 ) ) ( not ( = ?auto_905821 ?auto_905823 ) ) ( not ( = ?auto_905821 ?auto_905824 ) ) ( not ( = ?auto_905821 ?auto_905825 ) ) ( not ( = ?auto_905821 ?auto_905826 ) ) ( not ( = ?auto_905821 ?auto_905827 ) ) ( not ( = ?auto_905821 ?auto_905828 ) ) ( not ( = ?auto_905821 ?auto_905829 ) ) ( not ( = ?auto_905821 ?auto_905830 ) ) ( not ( = ?auto_905821 ?auto_905831 ) ) ( not ( = ?auto_905821 ?auto_905832 ) ) ( not ( = ?auto_905821 ?auto_905833 ) ) ( not ( = ?auto_905821 ?auto_905834 ) ) ( not ( = ?auto_905821 ?auto_905835 ) ) ( not ( = ?auto_905821 ?auto_905836 ) ) ( not ( = ?auto_905822 ?auto_905823 ) ) ( not ( = ?auto_905822 ?auto_905824 ) ) ( not ( = ?auto_905822 ?auto_905825 ) ) ( not ( = ?auto_905822 ?auto_905826 ) ) ( not ( = ?auto_905822 ?auto_905827 ) ) ( not ( = ?auto_905822 ?auto_905828 ) ) ( not ( = ?auto_905822 ?auto_905829 ) ) ( not ( = ?auto_905822 ?auto_905830 ) ) ( not ( = ?auto_905822 ?auto_905831 ) ) ( not ( = ?auto_905822 ?auto_905832 ) ) ( not ( = ?auto_905822 ?auto_905833 ) ) ( not ( = ?auto_905822 ?auto_905834 ) ) ( not ( = ?auto_905822 ?auto_905835 ) ) ( not ( = ?auto_905822 ?auto_905836 ) ) ( not ( = ?auto_905823 ?auto_905824 ) ) ( not ( = ?auto_905823 ?auto_905825 ) ) ( not ( = ?auto_905823 ?auto_905826 ) ) ( not ( = ?auto_905823 ?auto_905827 ) ) ( not ( = ?auto_905823 ?auto_905828 ) ) ( not ( = ?auto_905823 ?auto_905829 ) ) ( not ( = ?auto_905823 ?auto_905830 ) ) ( not ( = ?auto_905823 ?auto_905831 ) ) ( not ( = ?auto_905823 ?auto_905832 ) ) ( not ( = ?auto_905823 ?auto_905833 ) ) ( not ( = ?auto_905823 ?auto_905834 ) ) ( not ( = ?auto_905823 ?auto_905835 ) ) ( not ( = ?auto_905823 ?auto_905836 ) ) ( not ( = ?auto_905824 ?auto_905825 ) ) ( not ( = ?auto_905824 ?auto_905826 ) ) ( not ( = ?auto_905824 ?auto_905827 ) ) ( not ( = ?auto_905824 ?auto_905828 ) ) ( not ( = ?auto_905824 ?auto_905829 ) ) ( not ( = ?auto_905824 ?auto_905830 ) ) ( not ( = ?auto_905824 ?auto_905831 ) ) ( not ( = ?auto_905824 ?auto_905832 ) ) ( not ( = ?auto_905824 ?auto_905833 ) ) ( not ( = ?auto_905824 ?auto_905834 ) ) ( not ( = ?auto_905824 ?auto_905835 ) ) ( not ( = ?auto_905824 ?auto_905836 ) ) ( not ( = ?auto_905825 ?auto_905826 ) ) ( not ( = ?auto_905825 ?auto_905827 ) ) ( not ( = ?auto_905825 ?auto_905828 ) ) ( not ( = ?auto_905825 ?auto_905829 ) ) ( not ( = ?auto_905825 ?auto_905830 ) ) ( not ( = ?auto_905825 ?auto_905831 ) ) ( not ( = ?auto_905825 ?auto_905832 ) ) ( not ( = ?auto_905825 ?auto_905833 ) ) ( not ( = ?auto_905825 ?auto_905834 ) ) ( not ( = ?auto_905825 ?auto_905835 ) ) ( not ( = ?auto_905825 ?auto_905836 ) ) ( not ( = ?auto_905826 ?auto_905827 ) ) ( not ( = ?auto_905826 ?auto_905828 ) ) ( not ( = ?auto_905826 ?auto_905829 ) ) ( not ( = ?auto_905826 ?auto_905830 ) ) ( not ( = ?auto_905826 ?auto_905831 ) ) ( not ( = ?auto_905826 ?auto_905832 ) ) ( not ( = ?auto_905826 ?auto_905833 ) ) ( not ( = ?auto_905826 ?auto_905834 ) ) ( not ( = ?auto_905826 ?auto_905835 ) ) ( not ( = ?auto_905826 ?auto_905836 ) ) ( not ( = ?auto_905827 ?auto_905828 ) ) ( not ( = ?auto_905827 ?auto_905829 ) ) ( not ( = ?auto_905827 ?auto_905830 ) ) ( not ( = ?auto_905827 ?auto_905831 ) ) ( not ( = ?auto_905827 ?auto_905832 ) ) ( not ( = ?auto_905827 ?auto_905833 ) ) ( not ( = ?auto_905827 ?auto_905834 ) ) ( not ( = ?auto_905827 ?auto_905835 ) ) ( not ( = ?auto_905827 ?auto_905836 ) ) ( not ( = ?auto_905828 ?auto_905829 ) ) ( not ( = ?auto_905828 ?auto_905830 ) ) ( not ( = ?auto_905828 ?auto_905831 ) ) ( not ( = ?auto_905828 ?auto_905832 ) ) ( not ( = ?auto_905828 ?auto_905833 ) ) ( not ( = ?auto_905828 ?auto_905834 ) ) ( not ( = ?auto_905828 ?auto_905835 ) ) ( not ( = ?auto_905828 ?auto_905836 ) ) ( not ( = ?auto_905829 ?auto_905830 ) ) ( not ( = ?auto_905829 ?auto_905831 ) ) ( not ( = ?auto_905829 ?auto_905832 ) ) ( not ( = ?auto_905829 ?auto_905833 ) ) ( not ( = ?auto_905829 ?auto_905834 ) ) ( not ( = ?auto_905829 ?auto_905835 ) ) ( not ( = ?auto_905829 ?auto_905836 ) ) ( not ( = ?auto_905830 ?auto_905831 ) ) ( not ( = ?auto_905830 ?auto_905832 ) ) ( not ( = ?auto_905830 ?auto_905833 ) ) ( not ( = ?auto_905830 ?auto_905834 ) ) ( not ( = ?auto_905830 ?auto_905835 ) ) ( not ( = ?auto_905830 ?auto_905836 ) ) ( not ( = ?auto_905831 ?auto_905832 ) ) ( not ( = ?auto_905831 ?auto_905833 ) ) ( not ( = ?auto_905831 ?auto_905834 ) ) ( not ( = ?auto_905831 ?auto_905835 ) ) ( not ( = ?auto_905831 ?auto_905836 ) ) ( not ( = ?auto_905832 ?auto_905833 ) ) ( not ( = ?auto_905832 ?auto_905834 ) ) ( not ( = ?auto_905832 ?auto_905835 ) ) ( not ( = ?auto_905832 ?auto_905836 ) ) ( not ( = ?auto_905833 ?auto_905834 ) ) ( not ( = ?auto_905833 ?auto_905835 ) ) ( not ( = ?auto_905833 ?auto_905836 ) ) ( not ( = ?auto_905834 ?auto_905835 ) ) ( not ( = ?auto_905834 ?auto_905836 ) ) ( not ( = ?auto_905835 ?auto_905836 ) ) ( ON ?auto_905835 ?auto_905836 ) ( ON ?auto_905834 ?auto_905835 ) ( ON ?auto_905833 ?auto_905834 ) ( CLEAR ?auto_905831 ) ( ON ?auto_905832 ?auto_905833 ) ( CLEAR ?auto_905832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_905819 ?auto_905820 ?auto_905821 ?auto_905822 ?auto_905823 ?auto_905824 ?auto_905825 ?auto_905826 ?auto_905827 ?auto_905828 ?auto_905829 ?auto_905830 ?auto_905831 ?auto_905832 )
      ( MAKE-18PILE ?auto_905819 ?auto_905820 ?auto_905821 ?auto_905822 ?auto_905823 ?auto_905824 ?auto_905825 ?auto_905826 ?auto_905827 ?auto_905828 ?auto_905829 ?auto_905830 ?auto_905831 ?auto_905832 ?auto_905833 ?auto_905834 ?auto_905835 ?auto_905836 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905855 - BLOCK
      ?auto_905856 - BLOCK
      ?auto_905857 - BLOCK
      ?auto_905858 - BLOCK
      ?auto_905859 - BLOCK
      ?auto_905860 - BLOCK
      ?auto_905861 - BLOCK
      ?auto_905862 - BLOCK
      ?auto_905863 - BLOCK
      ?auto_905864 - BLOCK
      ?auto_905865 - BLOCK
      ?auto_905866 - BLOCK
      ?auto_905867 - BLOCK
      ?auto_905868 - BLOCK
      ?auto_905869 - BLOCK
      ?auto_905870 - BLOCK
      ?auto_905871 - BLOCK
      ?auto_905872 - BLOCK
    )
    :vars
    (
      ?auto_905873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_905872 ?auto_905873 ) ( ON-TABLE ?auto_905855 ) ( ON ?auto_905856 ?auto_905855 ) ( ON ?auto_905857 ?auto_905856 ) ( ON ?auto_905858 ?auto_905857 ) ( ON ?auto_905859 ?auto_905858 ) ( ON ?auto_905860 ?auto_905859 ) ( ON ?auto_905861 ?auto_905860 ) ( ON ?auto_905862 ?auto_905861 ) ( ON ?auto_905863 ?auto_905862 ) ( ON ?auto_905864 ?auto_905863 ) ( ON ?auto_905865 ?auto_905864 ) ( ON ?auto_905866 ?auto_905865 ) ( not ( = ?auto_905855 ?auto_905856 ) ) ( not ( = ?auto_905855 ?auto_905857 ) ) ( not ( = ?auto_905855 ?auto_905858 ) ) ( not ( = ?auto_905855 ?auto_905859 ) ) ( not ( = ?auto_905855 ?auto_905860 ) ) ( not ( = ?auto_905855 ?auto_905861 ) ) ( not ( = ?auto_905855 ?auto_905862 ) ) ( not ( = ?auto_905855 ?auto_905863 ) ) ( not ( = ?auto_905855 ?auto_905864 ) ) ( not ( = ?auto_905855 ?auto_905865 ) ) ( not ( = ?auto_905855 ?auto_905866 ) ) ( not ( = ?auto_905855 ?auto_905867 ) ) ( not ( = ?auto_905855 ?auto_905868 ) ) ( not ( = ?auto_905855 ?auto_905869 ) ) ( not ( = ?auto_905855 ?auto_905870 ) ) ( not ( = ?auto_905855 ?auto_905871 ) ) ( not ( = ?auto_905855 ?auto_905872 ) ) ( not ( = ?auto_905855 ?auto_905873 ) ) ( not ( = ?auto_905856 ?auto_905857 ) ) ( not ( = ?auto_905856 ?auto_905858 ) ) ( not ( = ?auto_905856 ?auto_905859 ) ) ( not ( = ?auto_905856 ?auto_905860 ) ) ( not ( = ?auto_905856 ?auto_905861 ) ) ( not ( = ?auto_905856 ?auto_905862 ) ) ( not ( = ?auto_905856 ?auto_905863 ) ) ( not ( = ?auto_905856 ?auto_905864 ) ) ( not ( = ?auto_905856 ?auto_905865 ) ) ( not ( = ?auto_905856 ?auto_905866 ) ) ( not ( = ?auto_905856 ?auto_905867 ) ) ( not ( = ?auto_905856 ?auto_905868 ) ) ( not ( = ?auto_905856 ?auto_905869 ) ) ( not ( = ?auto_905856 ?auto_905870 ) ) ( not ( = ?auto_905856 ?auto_905871 ) ) ( not ( = ?auto_905856 ?auto_905872 ) ) ( not ( = ?auto_905856 ?auto_905873 ) ) ( not ( = ?auto_905857 ?auto_905858 ) ) ( not ( = ?auto_905857 ?auto_905859 ) ) ( not ( = ?auto_905857 ?auto_905860 ) ) ( not ( = ?auto_905857 ?auto_905861 ) ) ( not ( = ?auto_905857 ?auto_905862 ) ) ( not ( = ?auto_905857 ?auto_905863 ) ) ( not ( = ?auto_905857 ?auto_905864 ) ) ( not ( = ?auto_905857 ?auto_905865 ) ) ( not ( = ?auto_905857 ?auto_905866 ) ) ( not ( = ?auto_905857 ?auto_905867 ) ) ( not ( = ?auto_905857 ?auto_905868 ) ) ( not ( = ?auto_905857 ?auto_905869 ) ) ( not ( = ?auto_905857 ?auto_905870 ) ) ( not ( = ?auto_905857 ?auto_905871 ) ) ( not ( = ?auto_905857 ?auto_905872 ) ) ( not ( = ?auto_905857 ?auto_905873 ) ) ( not ( = ?auto_905858 ?auto_905859 ) ) ( not ( = ?auto_905858 ?auto_905860 ) ) ( not ( = ?auto_905858 ?auto_905861 ) ) ( not ( = ?auto_905858 ?auto_905862 ) ) ( not ( = ?auto_905858 ?auto_905863 ) ) ( not ( = ?auto_905858 ?auto_905864 ) ) ( not ( = ?auto_905858 ?auto_905865 ) ) ( not ( = ?auto_905858 ?auto_905866 ) ) ( not ( = ?auto_905858 ?auto_905867 ) ) ( not ( = ?auto_905858 ?auto_905868 ) ) ( not ( = ?auto_905858 ?auto_905869 ) ) ( not ( = ?auto_905858 ?auto_905870 ) ) ( not ( = ?auto_905858 ?auto_905871 ) ) ( not ( = ?auto_905858 ?auto_905872 ) ) ( not ( = ?auto_905858 ?auto_905873 ) ) ( not ( = ?auto_905859 ?auto_905860 ) ) ( not ( = ?auto_905859 ?auto_905861 ) ) ( not ( = ?auto_905859 ?auto_905862 ) ) ( not ( = ?auto_905859 ?auto_905863 ) ) ( not ( = ?auto_905859 ?auto_905864 ) ) ( not ( = ?auto_905859 ?auto_905865 ) ) ( not ( = ?auto_905859 ?auto_905866 ) ) ( not ( = ?auto_905859 ?auto_905867 ) ) ( not ( = ?auto_905859 ?auto_905868 ) ) ( not ( = ?auto_905859 ?auto_905869 ) ) ( not ( = ?auto_905859 ?auto_905870 ) ) ( not ( = ?auto_905859 ?auto_905871 ) ) ( not ( = ?auto_905859 ?auto_905872 ) ) ( not ( = ?auto_905859 ?auto_905873 ) ) ( not ( = ?auto_905860 ?auto_905861 ) ) ( not ( = ?auto_905860 ?auto_905862 ) ) ( not ( = ?auto_905860 ?auto_905863 ) ) ( not ( = ?auto_905860 ?auto_905864 ) ) ( not ( = ?auto_905860 ?auto_905865 ) ) ( not ( = ?auto_905860 ?auto_905866 ) ) ( not ( = ?auto_905860 ?auto_905867 ) ) ( not ( = ?auto_905860 ?auto_905868 ) ) ( not ( = ?auto_905860 ?auto_905869 ) ) ( not ( = ?auto_905860 ?auto_905870 ) ) ( not ( = ?auto_905860 ?auto_905871 ) ) ( not ( = ?auto_905860 ?auto_905872 ) ) ( not ( = ?auto_905860 ?auto_905873 ) ) ( not ( = ?auto_905861 ?auto_905862 ) ) ( not ( = ?auto_905861 ?auto_905863 ) ) ( not ( = ?auto_905861 ?auto_905864 ) ) ( not ( = ?auto_905861 ?auto_905865 ) ) ( not ( = ?auto_905861 ?auto_905866 ) ) ( not ( = ?auto_905861 ?auto_905867 ) ) ( not ( = ?auto_905861 ?auto_905868 ) ) ( not ( = ?auto_905861 ?auto_905869 ) ) ( not ( = ?auto_905861 ?auto_905870 ) ) ( not ( = ?auto_905861 ?auto_905871 ) ) ( not ( = ?auto_905861 ?auto_905872 ) ) ( not ( = ?auto_905861 ?auto_905873 ) ) ( not ( = ?auto_905862 ?auto_905863 ) ) ( not ( = ?auto_905862 ?auto_905864 ) ) ( not ( = ?auto_905862 ?auto_905865 ) ) ( not ( = ?auto_905862 ?auto_905866 ) ) ( not ( = ?auto_905862 ?auto_905867 ) ) ( not ( = ?auto_905862 ?auto_905868 ) ) ( not ( = ?auto_905862 ?auto_905869 ) ) ( not ( = ?auto_905862 ?auto_905870 ) ) ( not ( = ?auto_905862 ?auto_905871 ) ) ( not ( = ?auto_905862 ?auto_905872 ) ) ( not ( = ?auto_905862 ?auto_905873 ) ) ( not ( = ?auto_905863 ?auto_905864 ) ) ( not ( = ?auto_905863 ?auto_905865 ) ) ( not ( = ?auto_905863 ?auto_905866 ) ) ( not ( = ?auto_905863 ?auto_905867 ) ) ( not ( = ?auto_905863 ?auto_905868 ) ) ( not ( = ?auto_905863 ?auto_905869 ) ) ( not ( = ?auto_905863 ?auto_905870 ) ) ( not ( = ?auto_905863 ?auto_905871 ) ) ( not ( = ?auto_905863 ?auto_905872 ) ) ( not ( = ?auto_905863 ?auto_905873 ) ) ( not ( = ?auto_905864 ?auto_905865 ) ) ( not ( = ?auto_905864 ?auto_905866 ) ) ( not ( = ?auto_905864 ?auto_905867 ) ) ( not ( = ?auto_905864 ?auto_905868 ) ) ( not ( = ?auto_905864 ?auto_905869 ) ) ( not ( = ?auto_905864 ?auto_905870 ) ) ( not ( = ?auto_905864 ?auto_905871 ) ) ( not ( = ?auto_905864 ?auto_905872 ) ) ( not ( = ?auto_905864 ?auto_905873 ) ) ( not ( = ?auto_905865 ?auto_905866 ) ) ( not ( = ?auto_905865 ?auto_905867 ) ) ( not ( = ?auto_905865 ?auto_905868 ) ) ( not ( = ?auto_905865 ?auto_905869 ) ) ( not ( = ?auto_905865 ?auto_905870 ) ) ( not ( = ?auto_905865 ?auto_905871 ) ) ( not ( = ?auto_905865 ?auto_905872 ) ) ( not ( = ?auto_905865 ?auto_905873 ) ) ( not ( = ?auto_905866 ?auto_905867 ) ) ( not ( = ?auto_905866 ?auto_905868 ) ) ( not ( = ?auto_905866 ?auto_905869 ) ) ( not ( = ?auto_905866 ?auto_905870 ) ) ( not ( = ?auto_905866 ?auto_905871 ) ) ( not ( = ?auto_905866 ?auto_905872 ) ) ( not ( = ?auto_905866 ?auto_905873 ) ) ( not ( = ?auto_905867 ?auto_905868 ) ) ( not ( = ?auto_905867 ?auto_905869 ) ) ( not ( = ?auto_905867 ?auto_905870 ) ) ( not ( = ?auto_905867 ?auto_905871 ) ) ( not ( = ?auto_905867 ?auto_905872 ) ) ( not ( = ?auto_905867 ?auto_905873 ) ) ( not ( = ?auto_905868 ?auto_905869 ) ) ( not ( = ?auto_905868 ?auto_905870 ) ) ( not ( = ?auto_905868 ?auto_905871 ) ) ( not ( = ?auto_905868 ?auto_905872 ) ) ( not ( = ?auto_905868 ?auto_905873 ) ) ( not ( = ?auto_905869 ?auto_905870 ) ) ( not ( = ?auto_905869 ?auto_905871 ) ) ( not ( = ?auto_905869 ?auto_905872 ) ) ( not ( = ?auto_905869 ?auto_905873 ) ) ( not ( = ?auto_905870 ?auto_905871 ) ) ( not ( = ?auto_905870 ?auto_905872 ) ) ( not ( = ?auto_905870 ?auto_905873 ) ) ( not ( = ?auto_905871 ?auto_905872 ) ) ( not ( = ?auto_905871 ?auto_905873 ) ) ( not ( = ?auto_905872 ?auto_905873 ) ) ( ON ?auto_905871 ?auto_905872 ) ( ON ?auto_905870 ?auto_905871 ) ( ON ?auto_905869 ?auto_905870 ) ( ON ?auto_905868 ?auto_905869 ) ( CLEAR ?auto_905866 ) ( ON ?auto_905867 ?auto_905868 ) ( CLEAR ?auto_905867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_905855 ?auto_905856 ?auto_905857 ?auto_905858 ?auto_905859 ?auto_905860 ?auto_905861 ?auto_905862 ?auto_905863 ?auto_905864 ?auto_905865 ?auto_905866 ?auto_905867 )
      ( MAKE-18PILE ?auto_905855 ?auto_905856 ?auto_905857 ?auto_905858 ?auto_905859 ?auto_905860 ?auto_905861 ?auto_905862 ?auto_905863 ?auto_905864 ?auto_905865 ?auto_905866 ?auto_905867 ?auto_905868 ?auto_905869 ?auto_905870 ?auto_905871 ?auto_905872 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905892 - BLOCK
      ?auto_905893 - BLOCK
      ?auto_905894 - BLOCK
      ?auto_905895 - BLOCK
      ?auto_905896 - BLOCK
      ?auto_905897 - BLOCK
      ?auto_905898 - BLOCK
      ?auto_905899 - BLOCK
      ?auto_905900 - BLOCK
      ?auto_905901 - BLOCK
      ?auto_905902 - BLOCK
      ?auto_905903 - BLOCK
      ?auto_905904 - BLOCK
      ?auto_905905 - BLOCK
      ?auto_905906 - BLOCK
      ?auto_905907 - BLOCK
      ?auto_905908 - BLOCK
      ?auto_905909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_905909 ) ( ON-TABLE ?auto_905892 ) ( ON ?auto_905893 ?auto_905892 ) ( ON ?auto_905894 ?auto_905893 ) ( ON ?auto_905895 ?auto_905894 ) ( ON ?auto_905896 ?auto_905895 ) ( ON ?auto_905897 ?auto_905896 ) ( ON ?auto_905898 ?auto_905897 ) ( ON ?auto_905899 ?auto_905898 ) ( ON ?auto_905900 ?auto_905899 ) ( ON ?auto_905901 ?auto_905900 ) ( ON ?auto_905902 ?auto_905901 ) ( ON ?auto_905903 ?auto_905902 ) ( not ( = ?auto_905892 ?auto_905893 ) ) ( not ( = ?auto_905892 ?auto_905894 ) ) ( not ( = ?auto_905892 ?auto_905895 ) ) ( not ( = ?auto_905892 ?auto_905896 ) ) ( not ( = ?auto_905892 ?auto_905897 ) ) ( not ( = ?auto_905892 ?auto_905898 ) ) ( not ( = ?auto_905892 ?auto_905899 ) ) ( not ( = ?auto_905892 ?auto_905900 ) ) ( not ( = ?auto_905892 ?auto_905901 ) ) ( not ( = ?auto_905892 ?auto_905902 ) ) ( not ( = ?auto_905892 ?auto_905903 ) ) ( not ( = ?auto_905892 ?auto_905904 ) ) ( not ( = ?auto_905892 ?auto_905905 ) ) ( not ( = ?auto_905892 ?auto_905906 ) ) ( not ( = ?auto_905892 ?auto_905907 ) ) ( not ( = ?auto_905892 ?auto_905908 ) ) ( not ( = ?auto_905892 ?auto_905909 ) ) ( not ( = ?auto_905893 ?auto_905894 ) ) ( not ( = ?auto_905893 ?auto_905895 ) ) ( not ( = ?auto_905893 ?auto_905896 ) ) ( not ( = ?auto_905893 ?auto_905897 ) ) ( not ( = ?auto_905893 ?auto_905898 ) ) ( not ( = ?auto_905893 ?auto_905899 ) ) ( not ( = ?auto_905893 ?auto_905900 ) ) ( not ( = ?auto_905893 ?auto_905901 ) ) ( not ( = ?auto_905893 ?auto_905902 ) ) ( not ( = ?auto_905893 ?auto_905903 ) ) ( not ( = ?auto_905893 ?auto_905904 ) ) ( not ( = ?auto_905893 ?auto_905905 ) ) ( not ( = ?auto_905893 ?auto_905906 ) ) ( not ( = ?auto_905893 ?auto_905907 ) ) ( not ( = ?auto_905893 ?auto_905908 ) ) ( not ( = ?auto_905893 ?auto_905909 ) ) ( not ( = ?auto_905894 ?auto_905895 ) ) ( not ( = ?auto_905894 ?auto_905896 ) ) ( not ( = ?auto_905894 ?auto_905897 ) ) ( not ( = ?auto_905894 ?auto_905898 ) ) ( not ( = ?auto_905894 ?auto_905899 ) ) ( not ( = ?auto_905894 ?auto_905900 ) ) ( not ( = ?auto_905894 ?auto_905901 ) ) ( not ( = ?auto_905894 ?auto_905902 ) ) ( not ( = ?auto_905894 ?auto_905903 ) ) ( not ( = ?auto_905894 ?auto_905904 ) ) ( not ( = ?auto_905894 ?auto_905905 ) ) ( not ( = ?auto_905894 ?auto_905906 ) ) ( not ( = ?auto_905894 ?auto_905907 ) ) ( not ( = ?auto_905894 ?auto_905908 ) ) ( not ( = ?auto_905894 ?auto_905909 ) ) ( not ( = ?auto_905895 ?auto_905896 ) ) ( not ( = ?auto_905895 ?auto_905897 ) ) ( not ( = ?auto_905895 ?auto_905898 ) ) ( not ( = ?auto_905895 ?auto_905899 ) ) ( not ( = ?auto_905895 ?auto_905900 ) ) ( not ( = ?auto_905895 ?auto_905901 ) ) ( not ( = ?auto_905895 ?auto_905902 ) ) ( not ( = ?auto_905895 ?auto_905903 ) ) ( not ( = ?auto_905895 ?auto_905904 ) ) ( not ( = ?auto_905895 ?auto_905905 ) ) ( not ( = ?auto_905895 ?auto_905906 ) ) ( not ( = ?auto_905895 ?auto_905907 ) ) ( not ( = ?auto_905895 ?auto_905908 ) ) ( not ( = ?auto_905895 ?auto_905909 ) ) ( not ( = ?auto_905896 ?auto_905897 ) ) ( not ( = ?auto_905896 ?auto_905898 ) ) ( not ( = ?auto_905896 ?auto_905899 ) ) ( not ( = ?auto_905896 ?auto_905900 ) ) ( not ( = ?auto_905896 ?auto_905901 ) ) ( not ( = ?auto_905896 ?auto_905902 ) ) ( not ( = ?auto_905896 ?auto_905903 ) ) ( not ( = ?auto_905896 ?auto_905904 ) ) ( not ( = ?auto_905896 ?auto_905905 ) ) ( not ( = ?auto_905896 ?auto_905906 ) ) ( not ( = ?auto_905896 ?auto_905907 ) ) ( not ( = ?auto_905896 ?auto_905908 ) ) ( not ( = ?auto_905896 ?auto_905909 ) ) ( not ( = ?auto_905897 ?auto_905898 ) ) ( not ( = ?auto_905897 ?auto_905899 ) ) ( not ( = ?auto_905897 ?auto_905900 ) ) ( not ( = ?auto_905897 ?auto_905901 ) ) ( not ( = ?auto_905897 ?auto_905902 ) ) ( not ( = ?auto_905897 ?auto_905903 ) ) ( not ( = ?auto_905897 ?auto_905904 ) ) ( not ( = ?auto_905897 ?auto_905905 ) ) ( not ( = ?auto_905897 ?auto_905906 ) ) ( not ( = ?auto_905897 ?auto_905907 ) ) ( not ( = ?auto_905897 ?auto_905908 ) ) ( not ( = ?auto_905897 ?auto_905909 ) ) ( not ( = ?auto_905898 ?auto_905899 ) ) ( not ( = ?auto_905898 ?auto_905900 ) ) ( not ( = ?auto_905898 ?auto_905901 ) ) ( not ( = ?auto_905898 ?auto_905902 ) ) ( not ( = ?auto_905898 ?auto_905903 ) ) ( not ( = ?auto_905898 ?auto_905904 ) ) ( not ( = ?auto_905898 ?auto_905905 ) ) ( not ( = ?auto_905898 ?auto_905906 ) ) ( not ( = ?auto_905898 ?auto_905907 ) ) ( not ( = ?auto_905898 ?auto_905908 ) ) ( not ( = ?auto_905898 ?auto_905909 ) ) ( not ( = ?auto_905899 ?auto_905900 ) ) ( not ( = ?auto_905899 ?auto_905901 ) ) ( not ( = ?auto_905899 ?auto_905902 ) ) ( not ( = ?auto_905899 ?auto_905903 ) ) ( not ( = ?auto_905899 ?auto_905904 ) ) ( not ( = ?auto_905899 ?auto_905905 ) ) ( not ( = ?auto_905899 ?auto_905906 ) ) ( not ( = ?auto_905899 ?auto_905907 ) ) ( not ( = ?auto_905899 ?auto_905908 ) ) ( not ( = ?auto_905899 ?auto_905909 ) ) ( not ( = ?auto_905900 ?auto_905901 ) ) ( not ( = ?auto_905900 ?auto_905902 ) ) ( not ( = ?auto_905900 ?auto_905903 ) ) ( not ( = ?auto_905900 ?auto_905904 ) ) ( not ( = ?auto_905900 ?auto_905905 ) ) ( not ( = ?auto_905900 ?auto_905906 ) ) ( not ( = ?auto_905900 ?auto_905907 ) ) ( not ( = ?auto_905900 ?auto_905908 ) ) ( not ( = ?auto_905900 ?auto_905909 ) ) ( not ( = ?auto_905901 ?auto_905902 ) ) ( not ( = ?auto_905901 ?auto_905903 ) ) ( not ( = ?auto_905901 ?auto_905904 ) ) ( not ( = ?auto_905901 ?auto_905905 ) ) ( not ( = ?auto_905901 ?auto_905906 ) ) ( not ( = ?auto_905901 ?auto_905907 ) ) ( not ( = ?auto_905901 ?auto_905908 ) ) ( not ( = ?auto_905901 ?auto_905909 ) ) ( not ( = ?auto_905902 ?auto_905903 ) ) ( not ( = ?auto_905902 ?auto_905904 ) ) ( not ( = ?auto_905902 ?auto_905905 ) ) ( not ( = ?auto_905902 ?auto_905906 ) ) ( not ( = ?auto_905902 ?auto_905907 ) ) ( not ( = ?auto_905902 ?auto_905908 ) ) ( not ( = ?auto_905902 ?auto_905909 ) ) ( not ( = ?auto_905903 ?auto_905904 ) ) ( not ( = ?auto_905903 ?auto_905905 ) ) ( not ( = ?auto_905903 ?auto_905906 ) ) ( not ( = ?auto_905903 ?auto_905907 ) ) ( not ( = ?auto_905903 ?auto_905908 ) ) ( not ( = ?auto_905903 ?auto_905909 ) ) ( not ( = ?auto_905904 ?auto_905905 ) ) ( not ( = ?auto_905904 ?auto_905906 ) ) ( not ( = ?auto_905904 ?auto_905907 ) ) ( not ( = ?auto_905904 ?auto_905908 ) ) ( not ( = ?auto_905904 ?auto_905909 ) ) ( not ( = ?auto_905905 ?auto_905906 ) ) ( not ( = ?auto_905905 ?auto_905907 ) ) ( not ( = ?auto_905905 ?auto_905908 ) ) ( not ( = ?auto_905905 ?auto_905909 ) ) ( not ( = ?auto_905906 ?auto_905907 ) ) ( not ( = ?auto_905906 ?auto_905908 ) ) ( not ( = ?auto_905906 ?auto_905909 ) ) ( not ( = ?auto_905907 ?auto_905908 ) ) ( not ( = ?auto_905907 ?auto_905909 ) ) ( not ( = ?auto_905908 ?auto_905909 ) ) ( ON ?auto_905908 ?auto_905909 ) ( ON ?auto_905907 ?auto_905908 ) ( ON ?auto_905906 ?auto_905907 ) ( ON ?auto_905905 ?auto_905906 ) ( CLEAR ?auto_905903 ) ( ON ?auto_905904 ?auto_905905 ) ( CLEAR ?auto_905904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_905892 ?auto_905893 ?auto_905894 ?auto_905895 ?auto_905896 ?auto_905897 ?auto_905898 ?auto_905899 ?auto_905900 ?auto_905901 ?auto_905902 ?auto_905903 ?auto_905904 )
      ( MAKE-18PILE ?auto_905892 ?auto_905893 ?auto_905894 ?auto_905895 ?auto_905896 ?auto_905897 ?auto_905898 ?auto_905899 ?auto_905900 ?auto_905901 ?auto_905902 ?auto_905903 ?auto_905904 ?auto_905905 ?auto_905906 ?auto_905907 ?auto_905908 ?auto_905909 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905928 - BLOCK
      ?auto_905929 - BLOCK
      ?auto_905930 - BLOCK
      ?auto_905931 - BLOCK
      ?auto_905932 - BLOCK
      ?auto_905933 - BLOCK
      ?auto_905934 - BLOCK
      ?auto_905935 - BLOCK
      ?auto_905936 - BLOCK
      ?auto_905937 - BLOCK
      ?auto_905938 - BLOCK
      ?auto_905939 - BLOCK
      ?auto_905940 - BLOCK
      ?auto_905941 - BLOCK
      ?auto_905942 - BLOCK
      ?auto_905943 - BLOCK
      ?auto_905944 - BLOCK
      ?auto_905945 - BLOCK
    )
    :vars
    (
      ?auto_905946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_905945 ?auto_905946 ) ( ON-TABLE ?auto_905928 ) ( ON ?auto_905929 ?auto_905928 ) ( ON ?auto_905930 ?auto_905929 ) ( ON ?auto_905931 ?auto_905930 ) ( ON ?auto_905932 ?auto_905931 ) ( ON ?auto_905933 ?auto_905932 ) ( ON ?auto_905934 ?auto_905933 ) ( ON ?auto_905935 ?auto_905934 ) ( ON ?auto_905936 ?auto_905935 ) ( ON ?auto_905937 ?auto_905936 ) ( ON ?auto_905938 ?auto_905937 ) ( not ( = ?auto_905928 ?auto_905929 ) ) ( not ( = ?auto_905928 ?auto_905930 ) ) ( not ( = ?auto_905928 ?auto_905931 ) ) ( not ( = ?auto_905928 ?auto_905932 ) ) ( not ( = ?auto_905928 ?auto_905933 ) ) ( not ( = ?auto_905928 ?auto_905934 ) ) ( not ( = ?auto_905928 ?auto_905935 ) ) ( not ( = ?auto_905928 ?auto_905936 ) ) ( not ( = ?auto_905928 ?auto_905937 ) ) ( not ( = ?auto_905928 ?auto_905938 ) ) ( not ( = ?auto_905928 ?auto_905939 ) ) ( not ( = ?auto_905928 ?auto_905940 ) ) ( not ( = ?auto_905928 ?auto_905941 ) ) ( not ( = ?auto_905928 ?auto_905942 ) ) ( not ( = ?auto_905928 ?auto_905943 ) ) ( not ( = ?auto_905928 ?auto_905944 ) ) ( not ( = ?auto_905928 ?auto_905945 ) ) ( not ( = ?auto_905928 ?auto_905946 ) ) ( not ( = ?auto_905929 ?auto_905930 ) ) ( not ( = ?auto_905929 ?auto_905931 ) ) ( not ( = ?auto_905929 ?auto_905932 ) ) ( not ( = ?auto_905929 ?auto_905933 ) ) ( not ( = ?auto_905929 ?auto_905934 ) ) ( not ( = ?auto_905929 ?auto_905935 ) ) ( not ( = ?auto_905929 ?auto_905936 ) ) ( not ( = ?auto_905929 ?auto_905937 ) ) ( not ( = ?auto_905929 ?auto_905938 ) ) ( not ( = ?auto_905929 ?auto_905939 ) ) ( not ( = ?auto_905929 ?auto_905940 ) ) ( not ( = ?auto_905929 ?auto_905941 ) ) ( not ( = ?auto_905929 ?auto_905942 ) ) ( not ( = ?auto_905929 ?auto_905943 ) ) ( not ( = ?auto_905929 ?auto_905944 ) ) ( not ( = ?auto_905929 ?auto_905945 ) ) ( not ( = ?auto_905929 ?auto_905946 ) ) ( not ( = ?auto_905930 ?auto_905931 ) ) ( not ( = ?auto_905930 ?auto_905932 ) ) ( not ( = ?auto_905930 ?auto_905933 ) ) ( not ( = ?auto_905930 ?auto_905934 ) ) ( not ( = ?auto_905930 ?auto_905935 ) ) ( not ( = ?auto_905930 ?auto_905936 ) ) ( not ( = ?auto_905930 ?auto_905937 ) ) ( not ( = ?auto_905930 ?auto_905938 ) ) ( not ( = ?auto_905930 ?auto_905939 ) ) ( not ( = ?auto_905930 ?auto_905940 ) ) ( not ( = ?auto_905930 ?auto_905941 ) ) ( not ( = ?auto_905930 ?auto_905942 ) ) ( not ( = ?auto_905930 ?auto_905943 ) ) ( not ( = ?auto_905930 ?auto_905944 ) ) ( not ( = ?auto_905930 ?auto_905945 ) ) ( not ( = ?auto_905930 ?auto_905946 ) ) ( not ( = ?auto_905931 ?auto_905932 ) ) ( not ( = ?auto_905931 ?auto_905933 ) ) ( not ( = ?auto_905931 ?auto_905934 ) ) ( not ( = ?auto_905931 ?auto_905935 ) ) ( not ( = ?auto_905931 ?auto_905936 ) ) ( not ( = ?auto_905931 ?auto_905937 ) ) ( not ( = ?auto_905931 ?auto_905938 ) ) ( not ( = ?auto_905931 ?auto_905939 ) ) ( not ( = ?auto_905931 ?auto_905940 ) ) ( not ( = ?auto_905931 ?auto_905941 ) ) ( not ( = ?auto_905931 ?auto_905942 ) ) ( not ( = ?auto_905931 ?auto_905943 ) ) ( not ( = ?auto_905931 ?auto_905944 ) ) ( not ( = ?auto_905931 ?auto_905945 ) ) ( not ( = ?auto_905931 ?auto_905946 ) ) ( not ( = ?auto_905932 ?auto_905933 ) ) ( not ( = ?auto_905932 ?auto_905934 ) ) ( not ( = ?auto_905932 ?auto_905935 ) ) ( not ( = ?auto_905932 ?auto_905936 ) ) ( not ( = ?auto_905932 ?auto_905937 ) ) ( not ( = ?auto_905932 ?auto_905938 ) ) ( not ( = ?auto_905932 ?auto_905939 ) ) ( not ( = ?auto_905932 ?auto_905940 ) ) ( not ( = ?auto_905932 ?auto_905941 ) ) ( not ( = ?auto_905932 ?auto_905942 ) ) ( not ( = ?auto_905932 ?auto_905943 ) ) ( not ( = ?auto_905932 ?auto_905944 ) ) ( not ( = ?auto_905932 ?auto_905945 ) ) ( not ( = ?auto_905932 ?auto_905946 ) ) ( not ( = ?auto_905933 ?auto_905934 ) ) ( not ( = ?auto_905933 ?auto_905935 ) ) ( not ( = ?auto_905933 ?auto_905936 ) ) ( not ( = ?auto_905933 ?auto_905937 ) ) ( not ( = ?auto_905933 ?auto_905938 ) ) ( not ( = ?auto_905933 ?auto_905939 ) ) ( not ( = ?auto_905933 ?auto_905940 ) ) ( not ( = ?auto_905933 ?auto_905941 ) ) ( not ( = ?auto_905933 ?auto_905942 ) ) ( not ( = ?auto_905933 ?auto_905943 ) ) ( not ( = ?auto_905933 ?auto_905944 ) ) ( not ( = ?auto_905933 ?auto_905945 ) ) ( not ( = ?auto_905933 ?auto_905946 ) ) ( not ( = ?auto_905934 ?auto_905935 ) ) ( not ( = ?auto_905934 ?auto_905936 ) ) ( not ( = ?auto_905934 ?auto_905937 ) ) ( not ( = ?auto_905934 ?auto_905938 ) ) ( not ( = ?auto_905934 ?auto_905939 ) ) ( not ( = ?auto_905934 ?auto_905940 ) ) ( not ( = ?auto_905934 ?auto_905941 ) ) ( not ( = ?auto_905934 ?auto_905942 ) ) ( not ( = ?auto_905934 ?auto_905943 ) ) ( not ( = ?auto_905934 ?auto_905944 ) ) ( not ( = ?auto_905934 ?auto_905945 ) ) ( not ( = ?auto_905934 ?auto_905946 ) ) ( not ( = ?auto_905935 ?auto_905936 ) ) ( not ( = ?auto_905935 ?auto_905937 ) ) ( not ( = ?auto_905935 ?auto_905938 ) ) ( not ( = ?auto_905935 ?auto_905939 ) ) ( not ( = ?auto_905935 ?auto_905940 ) ) ( not ( = ?auto_905935 ?auto_905941 ) ) ( not ( = ?auto_905935 ?auto_905942 ) ) ( not ( = ?auto_905935 ?auto_905943 ) ) ( not ( = ?auto_905935 ?auto_905944 ) ) ( not ( = ?auto_905935 ?auto_905945 ) ) ( not ( = ?auto_905935 ?auto_905946 ) ) ( not ( = ?auto_905936 ?auto_905937 ) ) ( not ( = ?auto_905936 ?auto_905938 ) ) ( not ( = ?auto_905936 ?auto_905939 ) ) ( not ( = ?auto_905936 ?auto_905940 ) ) ( not ( = ?auto_905936 ?auto_905941 ) ) ( not ( = ?auto_905936 ?auto_905942 ) ) ( not ( = ?auto_905936 ?auto_905943 ) ) ( not ( = ?auto_905936 ?auto_905944 ) ) ( not ( = ?auto_905936 ?auto_905945 ) ) ( not ( = ?auto_905936 ?auto_905946 ) ) ( not ( = ?auto_905937 ?auto_905938 ) ) ( not ( = ?auto_905937 ?auto_905939 ) ) ( not ( = ?auto_905937 ?auto_905940 ) ) ( not ( = ?auto_905937 ?auto_905941 ) ) ( not ( = ?auto_905937 ?auto_905942 ) ) ( not ( = ?auto_905937 ?auto_905943 ) ) ( not ( = ?auto_905937 ?auto_905944 ) ) ( not ( = ?auto_905937 ?auto_905945 ) ) ( not ( = ?auto_905937 ?auto_905946 ) ) ( not ( = ?auto_905938 ?auto_905939 ) ) ( not ( = ?auto_905938 ?auto_905940 ) ) ( not ( = ?auto_905938 ?auto_905941 ) ) ( not ( = ?auto_905938 ?auto_905942 ) ) ( not ( = ?auto_905938 ?auto_905943 ) ) ( not ( = ?auto_905938 ?auto_905944 ) ) ( not ( = ?auto_905938 ?auto_905945 ) ) ( not ( = ?auto_905938 ?auto_905946 ) ) ( not ( = ?auto_905939 ?auto_905940 ) ) ( not ( = ?auto_905939 ?auto_905941 ) ) ( not ( = ?auto_905939 ?auto_905942 ) ) ( not ( = ?auto_905939 ?auto_905943 ) ) ( not ( = ?auto_905939 ?auto_905944 ) ) ( not ( = ?auto_905939 ?auto_905945 ) ) ( not ( = ?auto_905939 ?auto_905946 ) ) ( not ( = ?auto_905940 ?auto_905941 ) ) ( not ( = ?auto_905940 ?auto_905942 ) ) ( not ( = ?auto_905940 ?auto_905943 ) ) ( not ( = ?auto_905940 ?auto_905944 ) ) ( not ( = ?auto_905940 ?auto_905945 ) ) ( not ( = ?auto_905940 ?auto_905946 ) ) ( not ( = ?auto_905941 ?auto_905942 ) ) ( not ( = ?auto_905941 ?auto_905943 ) ) ( not ( = ?auto_905941 ?auto_905944 ) ) ( not ( = ?auto_905941 ?auto_905945 ) ) ( not ( = ?auto_905941 ?auto_905946 ) ) ( not ( = ?auto_905942 ?auto_905943 ) ) ( not ( = ?auto_905942 ?auto_905944 ) ) ( not ( = ?auto_905942 ?auto_905945 ) ) ( not ( = ?auto_905942 ?auto_905946 ) ) ( not ( = ?auto_905943 ?auto_905944 ) ) ( not ( = ?auto_905943 ?auto_905945 ) ) ( not ( = ?auto_905943 ?auto_905946 ) ) ( not ( = ?auto_905944 ?auto_905945 ) ) ( not ( = ?auto_905944 ?auto_905946 ) ) ( not ( = ?auto_905945 ?auto_905946 ) ) ( ON ?auto_905944 ?auto_905945 ) ( ON ?auto_905943 ?auto_905944 ) ( ON ?auto_905942 ?auto_905943 ) ( ON ?auto_905941 ?auto_905942 ) ( ON ?auto_905940 ?auto_905941 ) ( CLEAR ?auto_905938 ) ( ON ?auto_905939 ?auto_905940 ) ( CLEAR ?auto_905939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_905928 ?auto_905929 ?auto_905930 ?auto_905931 ?auto_905932 ?auto_905933 ?auto_905934 ?auto_905935 ?auto_905936 ?auto_905937 ?auto_905938 ?auto_905939 )
      ( MAKE-18PILE ?auto_905928 ?auto_905929 ?auto_905930 ?auto_905931 ?auto_905932 ?auto_905933 ?auto_905934 ?auto_905935 ?auto_905936 ?auto_905937 ?auto_905938 ?auto_905939 ?auto_905940 ?auto_905941 ?auto_905942 ?auto_905943 ?auto_905944 ?auto_905945 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_905965 - BLOCK
      ?auto_905966 - BLOCK
      ?auto_905967 - BLOCK
      ?auto_905968 - BLOCK
      ?auto_905969 - BLOCK
      ?auto_905970 - BLOCK
      ?auto_905971 - BLOCK
      ?auto_905972 - BLOCK
      ?auto_905973 - BLOCK
      ?auto_905974 - BLOCK
      ?auto_905975 - BLOCK
      ?auto_905976 - BLOCK
      ?auto_905977 - BLOCK
      ?auto_905978 - BLOCK
      ?auto_905979 - BLOCK
      ?auto_905980 - BLOCK
      ?auto_905981 - BLOCK
      ?auto_905982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_905982 ) ( ON-TABLE ?auto_905965 ) ( ON ?auto_905966 ?auto_905965 ) ( ON ?auto_905967 ?auto_905966 ) ( ON ?auto_905968 ?auto_905967 ) ( ON ?auto_905969 ?auto_905968 ) ( ON ?auto_905970 ?auto_905969 ) ( ON ?auto_905971 ?auto_905970 ) ( ON ?auto_905972 ?auto_905971 ) ( ON ?auto_905973 ?auto_905972 ) ( ON ?auto_905974 ?auto_905973 ) ( ON ?auto_905975 ?auto_905974 ) ( not ( = ?auto_905965 ?auto_905966 ) ) ( not ( = ?auto_905965 ?auto_905967 ) ) ( not ( = ?auto_905965 ?auto_905968 ) ) ( not ( = ?auto_905965 ?auto_905969 ) ) ( not ( = ?auto_905965 ?auto_905970 ) ) ( not ( = ?auto_905965 ?auto_905971 ) ) ( not ( = ?auto_905965 ?auto_905972 ) ) ( not ( = ?auto_905965 ?auto_905973 ) ) ( not ( = ?auto_905965 ?auto_905974 ) ) ( not ( = ?auto_905965 ?auto_905975 ) ) ( not ( = ?auto_905965 ?auto_905976 ) ) ( not ( = ?auto_905965 ?auto_905977 ) ) ( not ( = ?auto_905965 ?auto_905978 ) ) ( not ( = ?auto_905965 ?auto_905979 ) ) ( not ( = ?auto_905965 ?auto_905980 ) ) ( not ( = ?auto_905965 ?auto_905981 ) ) ( not ( = ?auto_905965 ?auto_905982 ) ) ( not ( = ?auto_905966 ?auto_905967 ) ) ( not ( = ?auto_905966 ?auto_905968 ) ) ( not ( = ?auto_905966 ?auto_905969 ) ) ( not ( = ?auto_905966 ?auto_905970 ) ) ( not ( = ?auto_905966 ?auto_905971 ) ) ( not ( = ?auto_905966 ?auto_905972 ) ) ( not ( = ?auto_905966 ?auto_905973 ) ) ( not ( = ?auto_905966 ?auto_905974 ) ) ( not ( = ?auto_905966 ?auto_905975 ) ) ( not ( = ?auto_905966 ?auto_905976 ) ) ( not ( = ?auto_905966 ?auto_905977 ) ) ( not ( = ?auto_905966 ?auto_905978 ) ) ( not ( = ?auto_905966 ?auto_905979 ) ) ( not ( = ?auto_905966 ?auto_905980 ) ) ( not ( = ?auto_905966 ?auto_905981 ) ) ( not ( = ?auto_905966 ?auto_905982 ) ) ( not ( = ?auto_905967 ?auto_905968 ) ) ( not ( = ?auto_905967 ?auto_905969 ) ) ( not ( = ?auto_905967 ?auto_905970 ) ) ( not ( = ?auto_905967 ?auto_905971 ) ) ( not ( = ?auto_905967 ?auto_905972 ) ) ( not ( = ?auto_905967 ?auto_905973 ) ) ( not ( = ?auto_905967 ?auto_905974 ) ) ( not ( = ?auto_905967 ?auto_905975 ) ) ( not ( = ?auto_905967 ?auto_905976 ) ) ( not ( = ?auto_905967 ?auto_905977 ) ) ( not ( = ?auto_905967 ?auto_905978 ) ) ( not ( = ?auto_905967 ?auto_905979 ) ) ( not ( = ?auto_905967 ?auto_905980 ) ) ( not ( = ?auto_905967 ?auto_905981 ) ) ( not ( = ?auto_905967 ?auto_905982 ) ) ( not ( = ?auto_905968 ?auto_905969 ) ) ( not ( = ?auto_905968 ?auto_905970 ) ) ( not ( = ?auto_905968 ?auto_905971 ) ) ( not ( = ?auto_905968 ?auto_905972 ) ) ( not ( = ?auto_905968 ?auto_905973 ) ) ( not ( = ?auto_905968 ?auto_905974 ) ) ( not ( = ?auto_905968 ?auto_905975 ) ) ( not ( = ?auto_905968 ?auto_905976 ) ) ( not ( = ?auto_905968 ?auto_905977 ) ) ( not ( = ?auto_905968 ?auto_905978 ) ) ( not ( = ?auto_905968 ?auto_905979 ) ) ( not ( = ?auto_905968 ?auto_905980 ) ) ( not ( = ?auto_905968 ?auto_905981 ) ) ( not ( = ?auto_905968 ?auto_905982 ) ) ( not ( = ?auto_905969 ?auto_905970 ) ) ( not ( = ?auto_905969 ?auto_905971 ) ) ( not ( = ?auto_905969 ?auto_905972 ) ) ( not ( = ?auto_905969 ?auto_905973 ) ) ( not ( = ?auto_905969 ?auto_905974 ) ) ( not ( = ?auto_905969 ?auto_905975 ) ) ( not ( = ?auto_905969 ?auto_905976 ) ) ( not ( = ?auto_905969 ?auto_905977 ) ) ( not ( = ?auto_905969 ?auto_905978 ) ) ( not ( = ?auto_905969 ?auto_905979 ) ) ( not ( = ?auto_905969 ?auto_905980 ) ) ( not ( = ?auto_905969 ?auto_905981 ) ) ( not ( = ?auto_905969 ?auto_905982 ) ) ( not ( = ?auto_905970 ?auto_905971 ) ) ( not ( = ?auto_905970 ?auto_905972 ) ) ( not ( = ?auto_905970 ?auto_905973 ) ) ( not ( = ?auto_905970 ?auto_905974 ) ) ( not ( = ?auto_905970 ?auto_905975 ) ) ( not ( = ?auto_905970 ?auto_905976 ) ) ( not ( = ?auto_905970 ?auto_905977 ) ) ( not ( = ?auto_905970 ?auto_905978 ) ) ( not ( = ?auto_905970 ?auto_905979 ) ) ( not ( = ?auto_905970 ?auto_905980 ) ) ( not ( = ?auto_905970 ?auto_905981 ) ) ( not ( = ?auto_905970 ?auto_905982 ) ) ( not ( = ?auto_905971 ?auto_905972 ) ) ( not ( = ?auto_905971 ?auto_905973 ) ) ( not ( = ?auto_905971 ?auto_905974 ) ) ( not ( = ?auto_905971 ?auto_905975 ) ) ( not ( = ?auto_905971 ?auto_905976 ) ) ( not ( = ?auto_905971 ?auto_905977 ) ) ( not ( = ?auto_905971 ?auto_905978 ) ) ( not ( = ?auto_905971 ?auto_905979 ) ) ( not ( = ?auto_905971 ?auto_905980 ) ) ( not ( = ?auto_905971 ?auto_905981 ) ) ( not ( = ?auto_905971 ?auto_905982 ) ) ( not ( = ?auto_905972 ?auto_905973 ) ) ( not ( = ?auto_905972 ?auto_905974 ) ) ( not ( = ?auto_905972 ?auto_905975 ) ) ( not ( = ?auto_905972 ?auto_905976 ) ) ( not ( = ?auto_905972 ?auto_905977 ) ) ( not ( = ?auto_905972 ?auto_905978 ) ) ( not ( = ?auto_905972 ?auto_905979 ) ) ( not ( = ?auto_905972 ?auto_905980 ) ) ( not ( = ?auto_905972 ?auto_905981 ) ) ( not ( = ?auto_905972 ?auto_905982 ) ) ( not ( = ?auto_905973 ?auto_905974 ) ) ( not ( = ?auto_905973 ?auto_905975 ) ) ( not ( = ?auto_905973 ?auto_905976 ) ) ( not ( = ?auto_905973 ?auto_905977 ) ) ( not ( = ?auto_905973 ?auto_905978 ) ) ( not ( = ?auto_905973 ?auto_905979 ) ) ( not ( = ?auto_905973 ?auto_905980 ) ) ( not ( = ?auto_905973 ?auto_905981 ) ) ( not ( = ?auto_905973 ?auto_905982 ) ) ( not ( = ?auto_905974 ?auto_905975 ) ) ( not ( = ?auto_905974 ?auto_905976 ) ) ( not ( = ?auto_905974 ?auto_905977 ) ) ( not ( = ?auto_905974 ?auto_905978 ) ) ( not ( = ?auto_905974 ?auto_905979 ) ) ( not ( = ?auto_905974 ?auto_905980 ) ) ( not ( = ?auto_905974 ?auto_905981 ) ) ( not ( = ?auto_905974 ?auto_905982 ) ) ( not ( = ?auto_905975 ?auto_905976 ) ) ( not ( = ?auto_905975 ?auto_905977 ) ) ( not ( = ?auto_905975 ?auto_905978 ) ) ( not ( = ?auto_905975 ?auto_905979 ) ) ( not ( = ?auto_905975 ?auto_905980 ) ) ( not ( = ?auto_905975 ?auto_905981 ) ) ( not ( = ?auto_905975 ?auto_905982 ) ) ( not ( = ?auto_905976 ?auto_905977 ) ) ( not ( = ?auto_905976 ?auto_905978 ) ) ( not ( = ?auto_905976 ?auto_905979 ) ) ( not ( = ?auto_905976 ?auto_905980 ) ) ( not ( = ?auto_905976 ?auto_905981 ) ) ( not ( = ?auto_905976 ?auto_905982 ) ) ( not ( = ?auto_905977 ?auto_905978 ) ) ( not ( = ?auto_905977 ?auto_905979 ) ) ( not ( = ?auto_905977 ?auto_905980 ) ) ( not ( = ?auto_905977 ?auto_905981 ) ) ( not ( = ?auto_905977 ?auto_905982 ) ) ( not ( = ?auto_905978 ?auto_905979 ) ) ( not ( = ?auto_905978 ?auto_905980 ) ) ( not ( = ?auto_905978 ?auto_905981 ) ) ( not ( = ?auto_905978 ?auto_905982 ) ) ( not ( = ?auto_905979 ?auto_905980 ) ) ( not ( = ?auto_905979 ?auto_905981 ) ) ( not ( = ?auto_905979 ?auto_905982 ) ) ( not ( = ?auto_905980 ?auto_905981 ) ) ( not ( = ?auto_905980 ?auto_905982 ) ) ( not ( = ?auto_905981 ?auto_905982 ) ) ( ON ?auto_905981 ?auto_905982 ) ( ON ?auto_905980 ?auto_905981 ) ( ON ?auto_905979 ?auto_905980 ) ( ON ?auto_905978 ?auto_905979 ) ( ON ?auto_905977 ?auto_905978 ) ( CLEAR ?auto_905975 ) ( ON ?auto_905976 ?auto_905977 ) ( CLEAR ?auto_905976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_905965 ?auto_905966 ?auto_905967 ?auto_905968 ?auto_905969 ?auto_905970 ?auto_905971 ?auto_905972 ?auto_905973 ?auto_905974 ?auto_905975 ?auto_905976 )
      ( MAKE-18PILE ?auto_905965 ?auto_905966 ?auto_905967 ?auto_905968 ?auto_905969 ?auto_905970 ?auto_905971 ?auto_905972 ?auto_905973 ?auto_905974 ?auto_905975 ?auto_905976 ?auto_905977 ?auto_905978 ?auto_905979 ?auto_905980 ?auto_905981 ?auto_905982 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906001 - BLOCK
      ?auto_906002 - BLOCK
      ?auto_906003 - BLOCK
      ?auto_906004 - BLOCK
      ?auto_906005 - BLOCK
      ?auto_906006 - BLOCK
      ?auto_906007 - BLOCK
      ?auto_906008 - BLOCK
      ?auto_906009 - BLOCK
      ?auto_906010 - BLOCK
      ?auto_906011 - BLOCK
      ?auto_906012 - BLOCK
      ?auto_906013 - BLOCK
      ?auto_906014 - BLOCK
      ?auto_906015 - BLOCK
      ?auto_906016 - BLOCK
      ?auto_906017 - BLOCK
      ?auto_906018 - BLOCK
    )
    :vars
    (
      ?auto_906019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906018 ?auto_906019 ) ( ON-TABLE ?auto_906001 ) ( ON ?auto_906002 ?auto_906001 ) ( ON ?auto_906003 ?auto_906002 ) ( ON ?auto_906004 ?auto_906003 ) ( ON ?auto_906005 ?auto_906004 ) ( ON ?auto_906006 ?auto_906005 ) ( ON ?auto_906007 ?auto_906006 ) ( ON ?auto_906008 ?auto_906007 ) ( ON ?auto_906009 ?auto_906008 ) ( ON ?auto_906010 ?auto_906009 ) ( not ( = ?auto_906001 ?auto_906002 ) ) ( not ( = ?auto_906001 ?auto_906003 ) ) ( not ( = ?auto_906001 ?auto_906004 ) ) ( not ( = ?auto_906001 ?auto_906005 ) ) ( not ( = ?auto_906001 ?auto_906006 ) ) ( not ( = ?auto_906001 ?auto_906007 ) ) ( not ( = ?auto_906001 ?auto_906008 ) ) ( not ( = ?auto_906001 ?auto_906009 ) ) ( not ( = ?auto_906001 ?auto_906010 ) ) ( not ( = ?auto_906001 ?auto_906011 ) ) ( not ( = ?auto_906001 ?auto_906012 ) ) ( not ( = ?auto_906001 ?auto_906013 ) ) ( not ( = ?auto_906001 ?auto_906014 ) ) ( not ( = ?auto_906001 ?auto_906015 ) ) ( not ( = ?auto_906001 ?auto_906016 ) ) ( not ( = ?auto_906001 ?auto_906017 ) ) ( not ( = ?auto_906001 ?auto_906018 ) ) ( not ( = ?auto_906001 ?auto_906019 ) ) ( not ( = ?auto_906002 ?auto_906003 ) ) ( not ( = ?auto_906002 ?auto_906004 ) ) ( not ( = ?auto_906002 ?auto_906005 ) ) ( not ( = ?auto_906002 ?auto_906006 ) ) ( not ( = ?auto_906002 ?auto_906007 ) ) ( not ( = ?auto_906002 ?auto_906008 ) ) ( not ( = ?auto_906002 ?auto_906009 ) ) ( not ( = ?auto_906002 ?auto_906010 ) ) ( not ( = ?auto_906002 ?auto_906011 ) ) ( not ( = ?auto_906002 ?auto_906012 ) ) ( not ( = ?auto_906002 ?auto_906013 ) ) ( not ( = ?auto_906002 ?auto_906014 ) ) ( not ( = ?auto_906002 ?auto_906015 ) ) ( not ( = ?auto_906002 ?auto_906016 ) ) ( not ( = ?auto_906002 ?auto_906017 ) ) ( not ( = ?auto_906002 ?auto_906018 ) ) ( not ( = ?auto_906002 ?auto_906019 ) ) ( not ( = ?auto_906003 ?auto_906004 ) ) ( not ( = ?auto_906003 ?auto_906005 ) ) ( not ( = ?auto_906003 ?auto_906006 ) ) ( not ( = ?auto_906003 ?auto_906007 ) ) ( not ( = ?auto_906003 ?auto_906008 ) ) ( not ( = ?auto_906003 ?auto_906009 ) ) ( not ( = ?auto_906003 ?auto_906010 ) ) ( not ( = ?auto_906003 ?auto_906011 ) ) ( not ( = ?auto_906003 ?auto_906012 ) ) ( not ( = ?auto_906003 ?auto_906013 ) ) ( not ( = ?auto_906003 ?auto_906014 ) ) ( not ( = ?auto_906003 ?auto_906015 ) ) ( not ( = ?auto_906003 ?auto_906016 ) ) ( not ( = ?auto_906003 ?auto_906017 ) ) ( not ( = ?auto_906003 ?auto_906018 ) ) ( not ( = ?auto_906003 ?auto_906019 ) ) ( not ( = ?auto_906004 ?auto_906005 ) ) ( not ( = ?auto_906004 ?auto_906006 ) ) ( not ( = ?auto_906004 ?auto_906007 ) ) ( not ( = ?auto_906004 ?auto_906008 ) ) ( not ( = ?auto_906004 ?auto_906009 ) ) ( not ( = ?auto_906004 ?auto_906010 ) ) ( not ( = ?auto_906004 ?auto_906011 ) ) ( not ( = ?auto_906004 ?auto_906012 ) ) ( not ( = ?auto_906004 ?auto_906013 ) ) ( not ( = ?auto_906004 ?auto_906014 ) ) ( not ( = ?auto_906004 ?auto_906015 ) ) ( not ( = ?auto_906004 ?auto_906016 ) ) ( not ( = ?auto_906004 ?auto_906017 ) ) ( not ( = ?auto_906004 ?auto_906018 ) ) ( not ( = ?auto_906004 ?auto_906019 ) ) ( not ( = ?auto_906005 ?auto_906006 ) ) ( not ( = ?auto_906005 ?auto_906007 ) ) ( not ( = ?auto_906005 ?auto_906008 ) ) ( not ( = ?auto_906005 ?auto_906009 ) ) ( not ( = ?auto_906005 ?auto_906010 ) ) ( not ( = ?auto_906005 ?auto_906011 ) ) ( not ( = ?auto_906005 ?auto_906012 ) ) ( not ( = ?auto_906005 ?auto_906013 ) ) ( not ( = ?auto_906005 ?auto_906014 ) ) ( not ( = ?auto_906005 ?auto_906015 ) ) ( not ( = ?auto_906005 ?auto_906016 ) ) ( not ( = ?auto_906005 ?auto_906017 ) ) ( not ( = ?auto_906005 ?auto_906018 ) ) ( not ( = ?auto_906005 ?auto_906019 ) ) ( not ( = ?auto_906006 ?auto_906007 ) ) ( not ( = ?auto_906006 ?auto_906008 ) ) ( not ( = ?auto_906006 ?auto_906009 ) ) ( not ( = ?auto_906006 ?auto_906010 ) ) ( not ( = ?auto_906006 ?auto_906011 ) ) ( not ( = ?auto_906006 ?auto_906012 ) ) ( not ( = ?auto_906006 ?auto_906013 ) ) ( not ( = ?auto_906006 ?auto_906014 ) ) ( not ( = ?auto_906006 ?auto_906015 ) ) ( not ( = ?auto_906006 ?auto_906016 ) ) ( not ( = ?auto_906006 ?auto_906017 ) ) ( not ( = ?auto_906006 ?auto_906018 ) ) ( not ( = ?auto_906006 ?auto_906019 ) ) ( not ( = ?auto_906007 ?auto_906008 ) ) ( not ( = ?auto_906007 ?auto_906009 ) ) ( not ( = ?auto_906007 ?auto_906010 ) ) ( not ( = ?auto_906007 ?auto_906011 ) ) ( not ( = ?auto_906007 ?auto_906012 ) ) ( not ( = ?auto_906007 ?auto_906013 ) ) ( not ( = ?auto_906007 ?auto_906014 ) ) ( not ( = ?auto_906007 ?auto_906015 ) ) ( not ( = ?auto_906007 ?auto_906016 ) ) ( not ( = ?auto_906007 ?auto_906017 ) ) ( not ( = ?auto_906007 ?auto_906018 ) ) ( not ( = ?auto_906007 ?auto_906019 ) ) ( not ( = ?auto_906008 ?auto_906009 ) ) ( not ( = ?auto_906008 ?auto_906010 ) ) ( not ( = ?auto_906008 ?auto_906011 ) ) ( not ( = ?auto_906008 ?auto_906012 ) ) ( not ( = ?auto_906008 ?auto_906013 ) ) ( not ( = ?auto_906008 ?auto_906014 ) ) ( not ( = ?auto_906008 ?auto_906015 ) ) ( not ( = ?auto_906008 ?auto_906016 ) ) ( not ( = ?auto_906008 ?auto_906017 ) ) ( not ( = ?auto_906008 ?auto_906018 ) ) ( not ( = ?auto_906008 ?auto_906019 ) ) ( not ( = ?auto_906009 ?auto_906010 ) ) ( not ( = ?auto_906009 ?auto_906011 ) ) ( not ( = ?auto_906009 ?auto_906012 ) ) ( not ( = ?auto_906009 ?auto_906013 ) ) ( not ( = ?auto_906009 ?auto_906014 ) ) ( not ( = ?auto_906009 ?auto_906015 ) ) ( not ( = ?auto_906009 ?auto_906016 ) ) ( not ( = ?auto_906009 ?auto_906017 ) ) ( not ( = ?auto_906009 ?auto_906018 ) ) ( not ( = ?auto_906009 ?auto_906019 ) ) ( not ( = ?auto_906010 ?auto_906011 ) ) ( not ( = ?auto_906010 ?auto_906012 ) ) ( not ( = ?auto_906010 ?auto_906013 ) ) ( not ( = ?auto_906010 ?auto_906014 ) ) ( not ( = ?auto_906010 ?auto_906015 ) ) ( not ( = ?auto_906010 ?auto_906016 ) ) ( not ( = ?auto_906010 ?auto_906017 ) ) ( not ( = ?auto_906010 ?auto_906018 ) ) ( not ( = ?auto_906010 ?auto_906019 ) ) ( not ( = ?auto_906011 ?auto_906012 ) ) ( not ( = ?auto_906011 ?auto_906013 ) ) ( not ( = ?auto_906011 ?auto_906014 ) ) ( not ( = ?auto_906011 ?auto_906015 ) ) ( not ( = ?auto_906011 ?auto_906016 ) ) ( not ( = ?auto_906011 ?auto_906017 ) ) ( not ( = ?auto_906011 ?auto_906018 ) ) ( not ( = ?auto_906011 ?auto_906019 ) ) ( not ( = ?auto_906012 ?auto_906013 ) ) ( not ( = ?auto_906012 ?auto_906014 ) ) ( not ( = ?auto_906012 ?auto_906015 ) ) ( not ( = ?auto_906012 ?auto_906016 ) ) ( not ( = ?auto_906012 ?auto_906017 ) ) ( not ( = ?auto_906012 ?auto_906018 ) ) ( not ( = ?auto_906012 ?auto_906019 ) ) ( not ( = ?auto_906013 ?auto_906014 ) ) ( not ( = ?auto_906013 ?auto_906015 ) ) ( not ( = ?auto_906013 ?auto_906016 ) ) ( not ( = ?auto_906013 ?auto_906017 ) ) ( not ( = ?auto_906013 ?auto_906018 ) ) ( not ( = ?auto_906013 ?auto_906019 ) ) ( not ( = ?auto_906014 ?auto_906015 ) ) ( not ( = ?auto_906014 ?auto_906016 ) ) ( not ( = ?auto_906014 ?auto_906017 ) ) ( not ( = ?auto_906014 ?auto_906018 ) ) ( not ( = ?auto_906014 ?auto_906019 ) ) ( not ( = ?auto_906015 ?auto_906016 ) ) ( not ( = ?auto_906015 ?auto_906017 ) ) ( not ( = ?auto_906015 ?auto_906018 ) ) ( not ( = ?auto_906015 ?auto_906019 ) ) ( not ( = ?auto_906016 ?auto_906017 ) ) ( not ( = ?auto_906016 ?auto_906018 ) ) ( not ( = ?auto_906016 ?auto_906019 ) ) ( not ( = ?auto_906017 ?auto_906018 ) ) ( not ( = ?auto_906017 ?auto_906019 ) ) ( not ( = ?auto_906018 ?auto_906019 ) ) ( ON ?auto_906017 ?auto_906018 ) ( ON ?auto_906016 ?auto_906017 ) ( ON ?auto_906015 ?auto_906016 ) ( ON ?auto_906014 ?auto_906015 ) ( ON ?auto_906013 ?auto_906014 ) ( ON ?auto_906012 ?auto_906013 ) ( CLEAR ?auto_906010 ) ( ON ?auto_906011 ?auto_906012 ) ( CLEAR ?auto_906011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_906001 ?auto_906002 ?auto_906003 ?auto_906004 ?auto_906005 ?auto_906006 ?auto_906007 ?auto_906008 ?auto_906009 ?auto_906010 ?auto_906011 )
      ( MAKE-18PILE ?auto_906001 ?auto_906002 ?auto_906003 ?auto_906004 ?auto_906005 ?auto_906006 ?auto_906007 ?auto_906008 ?auto_906009 ?auto_906010 ?auto_906011 ?auto_906012 ?auto_906013 ?auto_906014 ?auto_906015 ?auto_906016 ?auto_906017 ?auto_906018 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906038 - BLOCK
      ?auto_906039 - BLOCK
      ?auto_906040 - BLOCK
      ?auto_906041 - BLOCK
      ?auto_906042 - BLOCK
      ?auto_906043 - BLOCK
      ?auto_906044 - BLOCK
      ?auto_906045 - BLOCK
      ?auto_906046 - BLOCK
      ?auto_906047 - BLOCK
      ?auto_906048 - BLOCK
      ?auto_906049 - BLOCK
      ?auto_906050 - BLOCK
      ?auto_906051 - BLOCK
      ?auto_906052 - BLOCK
      ?auto_906053 - BLOCK
      ?auto_906054 - BLOCK
      ?auto_906055 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_906055 ) ( ON-TABLE ?auto_906038 ) ( ON ?auto_906039 ?auto_906038 ) ( ON ?auto_906040 ?auto_906039 ) ( ON ?auto_906041 ?auto_906040 ) ( ON ?auto_906042 ?auto_906041 ) ( ON ?auto_906043 ?auto_906042 ) ( ON ?auto_906044 ?auto_906043 ) ( ON ?auto_906045 ?auto_906044 ) ( ON ?auto_906046 ?auto_906045 ) ( ON ?auto_906047 ?auto_906046 ) ( not ( = ?auto_906038 ?auto_906039 ) ) ( not ( = ?auto_906038 ?auto_906040 ) ) ( not ( = ?auto_906038 ?auto_906041 ) ) ( not ( = ?auto_906038 ?auto_906042 ) ) ( not ( = ?auto_906038 ?auto_906043 ) ) ( not ( = ?auto_906038 ?auto_906044 ) ) ( not ( = ?auto_906038 ?auto_906045 ) ) ( not ( = ?auto_906038 ?auto_906046 ) ) ( not ( = ?auto_906038 ?auto_906047 ) ) ( not ( = ?auto_906038 ?auto_906048 ) ) ( not ( = ?auto_906038 ?auto_906049 ) ) ( not ( = ?auto_906038 ?auto_906050 ) ) ( not ( = ?auto_906038 ?auto_906051 ) ) ( not ( = ?auto_906038 ?auto_906052 ) ) ( not ( = ?auto_906038 ?auto_906053 ) ) ( not ( = ?auto_906038 ?auto_906054 ) ) ( not ( = ?auto_906038 ?auto_906055 ) ) ( not ( = ?auto_906039 ?auto_906040 ) ) ( not ( = ?auto_906039 ?auto_906041 ) ) ( not ( = ?auto_906039 ?auto_906042 ) ) ( not ( = ?auto_906039 ?auto_906043 ) ) ( not ( = ?auto_906039 ?auto_906044 ) ) ( not ( = ?auto_906039 ?auto_906045 ) ) ( not ( = ?auto_906039 ?auto_906046 ) ) ( not ( = ?auto_906039 ?auto_906047 ) ) ( not ( = ?auto_906039 ?auto_906048 ) ) ( not ( = ?auto_906039 ?auto_906049 ) ) ( not ( = ?auto_906039 ?auto_906050 ) ) ( not ( = ?auto_906039 ?auto_906051 ) ) ( not ( = ?auto_906039 ?auto_906052 ) ) ( not ( = ?auto_906039 ?auto_906053 ) ) ( not ( = ?auto_906039 ?auto_906054 ) ) ( not ( = ?auto_906039 ?auto_906055 ) ) ( not ( = ?auto_906040 ?auto_906041 ) ) ( not ( = ?auto_906040 ?auto_906042 ) ) ( not ( = ?auto_906040 ?auto_906043 ) ) ( not ( = ?auto_906040 ?auto_906044 ) ) ( not ( = ?auto_906040 ?auto_906045 ) ) ( not ( = ?auto_906040 ?auto_906046 ) ) ( not ( = ?auto_906040 ?auto_906047 ) ) ( not ( = ?auto_906040 ?auto_906048 ) ) ( not ( = ?auto_906040 ?auto_906049 ) ) ( not ( = ?auto_906040 ?auto_906050 ) ) ( not ( = ?auto_906040 ?auto_906051 ) ) ( not ( = ?auto_906040 ?auto_906052 ) ) ( not ( = ?auto_906040 ?auto_906053 ) ) ( not ( = ?auto_906040 ?auto_906054 ) ) ( not ( = ?auto_906040 ?auto_906055 ) ) ( not ( = ?auto_906041 ?auto_906042 ) ) ( not ( = ?auto_906041 ?auto_906043 ) ) ( not ( = ?auto_906041 ?auto_906044 ) ) ( not ( = ?auto_906041 ?auto_906045 ) ) ( not ( = ?auto_906041 ?auto_906046 ) ) ( not ( = ?auto_906041 ?auto_906047 ) ) ( not ( = ?auto_906041 ?auto_906048 ) ) ( not ( = ?auto_906041 ?auto_906049 ) ) ( not ( = ?auto_906041 ?auto_906050 ) ) ( not ( = ?auto_906041 ?auto_906051 ) ) ( not ( = ?auto_906041 ?auto_906052 ) ) ( not ( = ?auto_906041 ?auto_906053 ) ) ( not ( = ?auto_906041 ?auto_906054 ) ) ( not ( = ?auto_906041 ?auto_906055 ) ) ( not ( = ?auto_906042 ?auto_906043 ) ) ( not ( = ?auto_906042 ?auto_906044 ) ) ( not ( = ?auto_906042 ?auto_906045 ) ) ( not ( = ?auto_906042 ?auto_906046 ) ) ( not ( = ?auto_906042 ?auto_906047 ) ) ( not ( = ?auto_906042 ?auto_906048 ) ) ( not ( = ?auto_906042 ?auto_906049 ) ) ( not ( = ?auto_906042 ?auto_906050 ) ) ( not ( = ?auto_906042 ?auto_906051 ) ) ( not ( = ?auto_906042 ?auto_906052 ) ) ( not ( = ?auto_906042 ?auto_906053 ) ) ( not ( = ?auto_906042 ?auto_906054 ) ) ( not ( = ?auto_906042 ?auto_906055 ) ) ( not ( = ?auto_906043 ?auto_906044 ) ) ( not ( = ?auto_906043 ?auto_906045 ) ) ( not ( = ?auto_906043 ?auto_906046 ) ) ( not ( = ?auto_906043 ?auto_906047 ) ) ( not ( = ?auto_906043 ?auto_906048 ) ) ( not ( = ?auto_906043 ?auto_906049 ) ) ( not ( = ?auto_906043 ?auto_906050 ) ) ( not ( = ?auto_906043 ?auto_906051 ) ) ( not ( = ?auto_906043 ?auto_906052 ) ) ( not ( = ?auto_906043 ?auto_906053 ) ) ( not ( = ?auto_906043 ?auto_906054 ) ) ( not ( = ?auto_906043 ?auto_906055 ) ) ( not ( = ?auto_906044 ?auto_906045 ) ) ( not ( = ?auto_906044 ?auto_906046 ) ) ( not ( = ?auto_906044 ?auto_906047 ) ) ( not ( = ?auto_906044 ?auto_906048 ) ) ( not ( = ?auto_906044 ?auto_906049 ) ) ( not ( = ?auto_906044 ?auto_906050 ) ) ( not ( = ?auto_906044 ?auto_906051 ) ) ( not ( = ?auto_906044 ?auto_906052 ) ) ( not ( = ?auto_906044 ?auto_906053 ) ) ( not ( = ?auto_906044 ?auto_906054 ) ) ( not ( = ?auto_906044 ?auto_906055 ) ) ( not ( = ?auto_906045 ?auto_906046 ) ) ( not ( = ?auto_906045 ?auto_906047 ) ) ( not ( = ?auto_906045 ?auto_906048 ) ) ( not ( = ?auto_906045 ?auto_906049 ) ) ( not ( = ?auto_906045 ?auto_906050 ) ) ( not ( = ?auto_906045 ?auto_906051 ) ) ( not ( = ?auto_906045 ?auto_906052 ) ) ( not ( = ?auto_906045 ?auto_906053 ) ) ( not ( = ?auto_906045 ?auto_906054 ) ) ( not ( = ?auto_906045 ?auto_906055 ) ) ( not ( = ?auto_906046 ?auto_906047 ) ) ( not ( = ?auto_906046 ?auto_906048 ) ) ( not ( = ?auto_906046 ?auto_906049 ) ) ( not ( = ?auto_906046 ?auto_906050 ) ) ( not ( = ?auto_906046 ?auto_906051 ) ) ( not ( = ?auto_906046 ?auto_906052 ) ) ( not ( = ?auto_906046 ?auto_906053 ) ) ( not ( = ?auto_906046 ?auto_906054 ) ) ( not ( = ?auto_906046 ?auto_906055 ) ) ( not ( = ?auto_906047 ?auto_906048 ) ) ( not ( = ?auto_906047 ?auto_906049 ) ) ( not ( = ?auto_906047 ?auto_906050 ) ) ( not ( = ?auto_906047 ?auto_906051 ) ) ( not ( = ?auto_906047 ?auto_906052 ) ) ( not ( = ?auto_906047 ?auto_906053 ) ) ( not ( = ?auto_906047 ?auto_906054 ) ) ( not ( = ?auto_906047 ?auto_906055 ) ) ( not ( = ?auto_906048 ?auto_906049 ) ) ( not ( = ?auto_906048 ?auto_906050 ) ) ( not ( = ?auto_906048 ?auto_906051 ) ) ( not ( = ?auto_906048 ?auto_906052 ) ) ( not ( = ?auto_906048 ?auto_906053 ) ) ( not ( = ?auto_906048 ?auto_906054 ) ) ( not ( = ?auto_906048 ?auto_906055 ) ) ( not ( = ?auto_906049 ?auto_906050 ) ) ( not ( = ?auto_906049 ?auto_906051 ) ) ( not ( = ?auto_906049 ?auto_906052 ) ) ( not ( = ?auto_906049 ?auto_906053 ) ) ( not ( = ?auto_906049 ?auto_906054 ) ) ( not ( = ?auto_906049 ?auto_906055 ) ) ( not ( = ?auto_906050 ?auto_906051 ) ) ( not ( = ?auto_906050 ?auto_906052 ) ) ( not ( = ?auto_906050 ?auto_906053 ) ) ( not ( = ?auto_906050 ?auto_906054 ) ) ( not ( = ?auto_906050 ?auto_906055 ) ) ( not ( = ?auto_906051 ?auto_906052 ) ) ( not ( = ?auto_906051 ?auto_906053 ) ) ( not ( = ?auto_906051 ?auto_906054 ) ) ( not ( = ?auto_906051 ?auto_906055 ) ) ( not ( = ?auto_906052 ?auto_906053 ) ) ( not ( = ?auto_906052 ?auto_906054 ) ) ( not ( = ?auto_906052 ?auto_906055 ) ) ( not ( = ?auto_906053 ?auto_906054 ) ) ( not ( = ?auto_906053 ?auto_906055 ) ) ( not ( = ?auto_906054 ?auto_906055 ) ) ( ON ?auto_906054 ?auto_906055 ) ( ON ?auto_906053 ?auto_906054 ) ( ON ?auto_906052 ?auto_906053 ) ( ON ?auto_906051 ?auto_906052 ) ( ON ?auto_906050 ?auto_906051 ) ( ON ?auto_906049 ?auto_906050 ) ( CLEAR ?auto_906047 ) ( ON ?auto_906048 ?auto_906049 ) ( CLEAR ?auto_906048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_906038 ?auto_906039 ?auto_906040 ?auto_906041 ?auto_906042 ?auto_906043 ?auto_906044 ?auto_906045 ?auto_906046 ?auto_906047 ?auto_906048 )
      ( MAKE-18PILE ?auto_906038 ?auto_906039 ?auto_906040 ?auto_906041 ?auto_906042 ?auto_906043 ?auto_906044 ?auto_906045 ?auto_906046 ?auto_906047 ?auto_906048 ?auto_906049 ?auto_906050 ?auto_906051 ?auto_906052 ?auto_906053 ?auto_906054 ?auto_906055 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906074 - BLOCK
      ?auto_906075 - BLOCK
      ?auto_906076 - BLOCK
      ?auto_906077 - BLOCK
      ?auto_906078 - BLOCK
      ?auto_906079 - BLOCK
      ?auto_906080 - BLOCK
      ?auto_906081 - BLOCK
      ?auto_906082 - BLOCK
      ?auto_906083 - BLOCK
      ?auto_906084 - BLOCK
      ?auto_906085 - BLOCK
      ?auto_906086 - BLOCK
      ?auto_906087 - BLOCK
      ?auto_906088 - BLOCK
      ?auto_906089 - BLOCK
      ?auto_906090 - BLOCK
      ?auto_906091 - BLOCK
    )
    :vars
    (
      ?auto_906092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906091 ?auto_906092 ) ( ON-TABLE ?auto_906074 ) ( ON ?auto_906075 ?auto_906074 ) ( ON ?auto_906076 ?auto_906075 ) ( ON ?auto_906077 ?auto_906076 ) ( ON ?auto_906078 ?auto_906077 ) ( ON ?auto_906079 ?auto_906078 ) ( ON ?auto_906080 ?auto_906079 ) ( ON ?auto_906081 ?auto_906080 ) ( ON ?auto_906082 ?auto_906081 ) ( not ( = ?auto_906074 ?auto_906075 ) ) ( not ( = ?auto_906074 ?auto_906076 ) ) ( not ( = ?auto_906074 ?auto_906077 ) ) ( not ( = ?auto_906074 ?auto_906078 ) ) ( not ( = ?auto_906074 ?auto_906079 ) ) ( not ( = ?auto_906074 ?auto_906080 ) ) ( not ( = ?auto_906074 ?auto_906081 ) ) ( not ( = ?auto_906074 ?auto_906082 ) ) ( not ( = ?auto_906074 ?auto_906083 ) ) ( not ( = ?auto_906074 ?auto_906084 ) ) ( not ( = ?auto_906074 ?auto_906085 ) ) ( not ( = ?auto_906074 ?auto_906086 ) ) ( not ( = ?auto_906074 ?auto_906087 ) ) ( not ( = ?auto_906074 ?auto_906088 ) ) ( not ( = ?auto_906074 ?auto_906089 ) ) ( not ( = ?auto_906074 ?auto_906090 ) ) ( not ( = ?auto_906074 ?auto_906091 ) ) ( not ( = ?auto_906074 ?auto_906092 ) ) ( not ( = ?auto_906075 ?auto_906076 ) ) ( not ( = ?auto_906075 ?auto_906077 ) ) ( not ( = ?auto_906075 ?auto_906078 ) ) ( not ( = ?auto_906075 ?auto_906079 ) ) ( not ( = ?auto_906075 ?auto_906080 ) ) ( not ( = ?auto_906075 ?auto_906081 ) ) ( not ( = ?auto_906075 ?auto_906082 ) ) ( not ( = ?auto_906075 ?auto_906083 ) ) ( not ( = ?auto_906075 ?auto_906084 ) ) ( not ( = ?auto_906075 ?auto_906085 ) ) ( not ( = ?auto_906075 ?auto_906086 ) ) ( not ( = ?auto_906075 ?auto_906087 ) ) ( not ( = ?auto_906075 ?auto_906088 ) ) ( not ( = ?auto_906075 ?auto_906089 ) ) ( not ( = ?auto_906075 ?auto_906090 ) ) ( not ( = ?auto_906075 ?auto_906091 ) ) ( not ( = ?auto_906075 ?auto_906092 ) ) ( not ( = ?auto_906076 ?auto_906077 ) ) ( not ( = ?auto_906076 ?auto_906078 ) ) ( not ( = ?auto_906076 ?auto_906079 ) ) ( not ( = ?auto_906076 ?auto_906080 ) ) ( not ( = ?auto_906076 ?auto_906081 ) ) ( not ( = ?auto_906076 ?auto_906082 ) ) ( not ( = ?auto_906076 ?auto_906083 ) ) ( not ( = ?auto_906076 ?auto_906084 ) ) ( not ( = ?auto_906076 ?auto_906085 ) ) ( not ( = ?auto_906076 ?auto_906086 ) ) ( not ( = ?auto_906076 ?auto_906087 ) ) ( not ( = ?auto_906076 ?auto_906088 ) ) ( not ( = ?auto_906076 ?auto_906089 ) ) ( not ( = ?auto_906076 ?auto_906090 ) ) ( not ( = ?auto_906076 ?auto_906091 ) ) ( not ( = ?auto_906076 ?auto_906092 ) ) ( not ( = ?auto_906077 ?auto_906078 ) ) ( not ( = ?auto_906077 ?auto_906079 ) ) ( not ( = ?auto_906077 ?auto_906080 ) ) ( not ( = ?auto_906077 ?auto_906081 ) ) ( not ( = ?auto_906077 ?auto_906082 ) ) ( not ( = ?auto_906077 ?auto_906083 ) ) ( not ( = ?auto_906077 ?auto_906084 ) ) ( not ( = ?auto_906077 ?auto_906085 ) ) ( not ( = ?auto_906077 ?auto_906086 ) ) ( not ( = ?auto_906077 ?auto_906087 ) ) ( not ( = ?auto_906077 ?auto_906088 ) ) ( not ( = ?auto_906077 ?auto_906089 ) ) ( not ( = ?auto_906077 ?auto_906090 ) ) ( not ( = ?auto_906077 ?auto_906091 ) ) ( not ( = ?auto_906077 ?auto_906092 ) ) ( not ( = ?auto_906078 ?auto_906079 ) ) ( not ( = ?auto_906078 ?auto_906080 ) ) ( not ( = ?auto_906078 ?auto_906081 ) ) ( not ( = ?auto_906078 ?auto_906082 ) ) ( not ( = ?auto_906078 ?auto_906083 ) ) ( not ( = ?auto_906078 ?auto_906084 ) ) ( not ( = ?auto_906078 ?auto_906085 ) ) ( not ( = ?auto_906078 ?auto_906086 ) ) ( not ( = ?auto_906078 ?auto_906087 ) ) ( not ( = ?auto_906078 ?auto_906088 ) ) ( not ( = ?auto_906078 ?auto_906089 ) ) ( not ( = ?auto_906078 ?auto_906090 ) ) ( not ( = ?auto_906078 ?auto_906091 ) ) ( not ( = ?auto_906078 ?auto_906092 ) ) ( not ( = ?auto_906079 ?auto_906080 ) ) ( not ( = ?auto_906079 ?auto_906081 ) ) ( not ( = ?auto_906079 ?auto_906082 ) ) ( not ( = ?auto_906079 ?auto_906083 ) ) ( not ( = ?auto_906079 ?auto_906084 ) ) ( not ( = ?auto_906079 ?auto_906085 ) ) ( not ( = ?auto_906079 ?auto_906086 ) ) ( not ( = ?auto_906079 ?auto_906087 ) ) ( not ( = ?auto_906079 ?auto_906088 ) ) ( not ( = ?auto_906079 ?auto_906089 ) ) ( not ( = ?auto_906079 ?auto_906090 ) ) ( not ( = ?auto_906079 ?auto_906091 ) ) ( not ( = ?auto_906079 ?auto_906092 ) ) ( not ( = ?auto_906080 ?auto_906081 ) ) ( not ( = ?auto_906080 ?auto_906082 ) ) ( not ( = ?auto_906080 ?auto_906083 ) ) ( not ( = ?auto_906080 ?auto_906084 ) ) ( not ( = ?auto_906080 ?auto_906085 ) ) ( not ( = ?auto_906080 ?auto_906086 ) ) ( not ( = ?auto_906080 ?auto_906087 ) ) ( not ( = ?auto_906080 ?auto_906088 ) ) ( not ( = ?auto_906080 ?auto_906089 ) ) ( not ( = ?auto_906080 ?auto_906090 ) ) ( not ( = ?auto_906080 ?auto_906091 ) ) ( not ( = ?auto_906080 ?auto_906092 ) ) ( not ( = ?auto_906081 ?auto_906082 ) ) ( not ( = ?auto_906081 ?auto_906083 ) ) ( not ( = ?auto_906081 ?auto_906084 ) ) ( not ( = ?auto_906081 ?auto_906085 ) ) ( not ( = ?auto_906081 ?auto_906086 ) ) ( not ( = ?auto_906081 ?auto_906087 ) ) ( not ( = ?auto_906081 ?auto_906088 ) ) ( not ( = ?auto_906081 ?auto_906089 ) ) ( not ( = ?auto_906081 ?auto_906090 ) ) ( not ( = ?auto_906081 ?auto_906091 ) ) ( not ( = ?auto_906081 ?auto_906092 ) ) ( not ( = ?auto_906082 ?auto_906083 ) ) ( not ( = ?auto_906082 ?auto_906084 ) ) ( not ( = ?auto_906082 ?auto_906085 ) ) ( not ( = ?auto_906082 ?auto_906086 ) ) ( not ( = ?auto_906082 ?auto_906087 ) ) ( not ( = ?auto_906082 ?auto_906088 ) ) ( not ( = ?auto_906082 ?auto_906089 ) ) ( not ( = ?auto_906082 ?auto_906090 ) ) ( not ( = ?auto_906082 ?auto_906091 ) ) ( not ( = ?auto_906082 ?auto_906092 ) ) ( not ( = ?auto_906083 ?auto_906084 ) ) ( not ( = ?auto_906083 ?auto_906085 ) ) ( not ( = ?auto_906083 ?auto_906086 ) ) ( not ( = ?auto_906083 ?auto_906087 ) ) ( not ( = ?auto_906083 ?auto_906088 ) ) ( not ( = ?auto_906083 ?auto_906089 ) ) ( not ( = ?auto_906083 ?auto_906090 ) ) ( not ( = ?auto_906083 ?auto_906091 ) ) ( not ( = ?auto_906083 ?auto_906092 ) ) ( not ( = ?auto_906084 ?auto_906085 ) ) ( not ( = ?auto_906084 ?auto_906086 ) ) ( not ( = ?auto_906084 ?auto_906087 ) ) ( not ( = ?auto_906084 ?auto_906088 ) ) ( not ( = ?auto_906084 ?auto_906089 ) ) ( not ( = ?auto_906084 ?auto_906090 ) ) ( not ( = ?auto_906084 ?auto_906091 ) ) ( not ( = ?auto_906084 ?auto_906092 ) ) ( not ( = ?auto_906085 ?auto_906086 ) ) ( not ( = ?auto_906085 ?auto_906087 ) ) ( not ( = ?auto_906085 ?auto_906088 ) ) ( not ( = ?auto_906085 ?auto_906089 ) ) ( not ( = ?auto_906085 ?auto_906090 ) ) ( not ( = ?auto_906085 ?auto_906091 ) ) ( not ( = ?auto_906085 ?auto_906092 ) ) ( not ( = ?auto_906086 ?auto_906087 ) ) ( not ( = ?auto_906086 ?auto_906088 ) ) ( not ( = ?auto_906086 ?auto_906089 ) ) ( not ( = ?auto_906086 ?auto_906090 ) ) ( not ( = ?auto_906086 ?auto_906091 ) ) ( not ( = ?auto_906086 ?auto_906092 ) ) ( not ( = ?auto_906087 ?auto_906088 ) ) ( not ( = ?auto_906087 ?auto_906089 ) ) ( not ( = ?auto_906087 ?auto_906090 ) ) ( not ( = ?auto_906087 ?auto_906091 ) ) ( not ( = ?auto_906087 ?auto_906092 ) ) ( not ( = ?auto_906088 ?auto_906089 ) ) ( not ( = ?auto_906088 ?auto_906090 ) ) ( not ( = ?auto_906088 ?auto_906091 ) ) ( not ( = ?auto_906088 ?auto_906092 ) ) ( not ( = ?auto_906089 ?auto_906090 ) ) ( not ( = ?auto_906089 ?auto_906091 ) ) ( not ( = ?auto_906089 ?auto_906092 ) ) ( not ( = ?auto_906090 ?auto_906091 ) ) ( not ( = ?auto_906090 ?auto_906092 ) ) ( not ( = ?auto_906091 ?auto_906092 ) ) ( ON ?auto_906090 ?auto_906091 ) ( ON ?auto_906089 ?auto_906090 ) ( ON ?auto_906088 ?auto_906089 ) ( ON ?auto_906087 ?auto_906088 ) ( ON ?auto_906086 ?auto_906087 ) ( ON ?auto_906085 ?auto_906086 ) ( ON ?auto_906084 ?auto_906085 ) ( CLEAR ?auto_906082 ) ( ON ?auto_906083 ?auto_906084 ) ( CLEAR ?auto_906083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_906074 ?auto_906075 ?auto_906076 ?auto_906077 ?auto_906078 ?auto_906079 ?auto_906080 ?auto_906081 ?auto_906082 ?auto_906083 )
      ( MAKE-18PILE ?auto_906074 ?auto_906075 ?auto_906076 ?auto_906077 ?auto_906078 ?auto_906079 ?auto_906080 ?auto_906081 ?auto_906082 ?auto_906083 ?auto_906084 ?auto_906085 ?auto_906086 ?auto_906087 ?auto_906088 ?auto_906089 ?auto_906090 ?auto_906091 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906111 - BLOCK
      ?auto_906112 - BLOCK
      ?auto_906113 - BLOCK
      ?auto_906114 - BLOCK
      ?auto_906115 - BLOCK
      ?auto_906116 - BLOCK
      ?auto_906117 - BLOCK
      ?auto_906118 - BLOCK
      ?auto_906119 - BLOCK
      ?auto_906120 - BLOCK
      ?auto_906121 - BLOCK
      ?auto_906122 - BLOCK
      ?auto_906123 - BLOCK
      ?auto_906124 - BLOCK
      ?auto_906125 - BLOCK
      ?auto_906126 - BLOCK
      ?auto_906127 - BLOCK
      ?auto_906128 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_906128 ) ( ON-TABLE ?auto_906111 ) ( ON ?auto_906112 ?auto_906111 ) ( ON ?auto_906113 ?auto_906112 ) ( ON ?auto_906114 ?auto_906113 ) ( ON ?auto_906115 ?auto_906114 ) ( ON ?auto_906116 ?auto_906115 ) ( ON ?auto_906117 ?auto_906116 ) ( ON ?auto_906118 ?auto_906117 ) ( ON ?auto_906119 ?auto_906118 ) ( not ( = ?auto_906111 ?auto_906112 ) ) ( not ( = ?auto_906111 ?auto_906113 ) ) ( not ( = ?auto_906111 ?auto_906114 ) ) ( not ( = ?auto_906111 ?auto_906115 ) ) ( not ( = ?auto_906111 ?auto_906116 ) ) ( not ( = ?auto_906111 ?auto_906117 ) ) ( not ( = ?auto_906111 ?auto_906118 ) ) ( not ( = ?auto_906111 ?auto_906119 ) ) ( not ( = ?auto_906111 ?auto_906120 ) ) ( not ( = ?auto_906111 ?auto_906121 ) ) ( not ( = ?auto_906111 ?auto_906122 ) ) ( not ( = ?auto_906111 ?auto_906123 ) ) ( not ( = ?auto_906111 ?auto_906124 ) ) ( not ( = ?auto_906111 ?auto_906125 ) ) ( not ( = ?auto_906111 ?auto_906126 ) ) ( not ( = ?auto_906111 ?auto_906127 ) ) ( not ( = ?auto_906111 ?auto_906128 ) ) ( not ( = ?auto_906112 ?auto_906113 ) ) ( not ( = ?auto_906112 ?auto_906114 ) ) ( not ( = ?auto_906112 ?auto_906115 ) ) ( not ( = ?auto_906112 ?auto_906116 ) ) ( not ( = ?auto_906112 ?auto_906117 ) ) ( not ( = ?auto_906112 ?auto_906118 ) ) ( not ( = ?auto_906112 ?auto_906119 ) ) ( not ( = ?auto_906112 ?auto_906120 ) ) ( not ( = ?auto_906112 ?auto_906121 ) ) ( not ( = ?auto_906112 ?auto_906122 ) ) ( not ( = ?auto_906112 ?auto_906123 ) ) ( not ( = ?auto_906112 ?auto_906124 ) ) ( not ( = ?auto_906112 ?auto_906125 ) ) ( not ( = ?auto_906112 ?auto_906126 ) ) ( not ( = ?auto_906112 ?auto_906127 ) ) ( not ( = ?auto_906112 ?auto_906128 ) ) ( not ( = ?auto_906113 ?auto_906114 ) ) ( not ( = ?auto_906113 ?auto_906115 ) ) ( not ( = ?auto_906113 ?auto_906116 ) ) ( not ( = ?auto_906113 ?auto_906117 ) ) ( not ( = ?auto_906113 ?auto_906118 ) ) ( not ( = ?auto_906113 ?auto_906119 ) ) ( not ( = ?auto_906113 ?auto_906120 ) ) ( not ( = ?auto_906113 ?auto_906121 ) ) ( not ( = ?auto_906113 ?auto_906122 ) ) ( not ( = ?auto_906113 ?auto_906123 ) ) ( not ( = ?auto_906113 ?auto_906124 ) ) ( not ( = ?auto_906113 ?auto_906125 ) ) ( not ( = ?auto_906113 ?auto_906126 ) ) ( not ( = ?auto_906113 ?auto_906127 ) ) ( not ( = ?auto_906113 ?auto_906128 ) ) ( not ( = ?auto_906114 ?auto_906115 ) ) ( not ( = ?auto_906114 ?auto_906116 ) ) ( not ( = ?auto_906114 ?auto_906117 ) ) ( not ( = ?auto_906114 ?auto_906118 ) ) ( not ( = ?auto_906114 ?auto_906119 ) ) ( not ( = ?auto_906114 ?auto_906120 ) ) ( not ( = ?auto_906114 ?auto_906121 ) ) ( not ( = ?auto_906114 ?auto_906122 ) ) ( not ( = ?auto_906114 ?auto_906123 ) ) ( not ( = ?auto_906114 ?auto_906124 ) ) ( not ( = ?auto_906114 ?auto_906125 ) ) ( not ( = ?auto_906114 ?auto_906126 ) ) ( not ( = ?auto_906114 ?auto_906127 ) ) ( not ( = ?auto_906114 ?auto_906128 ) ) ( not ( = ?auto_906115 ?auto_906116 ) ) ( not ( = ?auto_906115 ?auto_906117 ) ) ( not ( = ?auto_906115 ?auto_906118 ) ) ( not ( = ?auto_906115 ?auto_906119 ) ) ( not ( = ?auto_906115 ?auto_906120 ) ) ( not ( = ?auto_906115 ?auto_906121 ) ) ( not ( = ?auto_906115 ?auto_906122 ) ) ( not ( = ?auto_906115 ?auto_906123 ) ) ( not ( = ?auto_906115 ?auto_906124 ) ) ( not ( = ?auto_906115 ?auto_906125 ) ) ( not ( = ?auto_906115 ?auto_906126 ) ) ( not ( = ?auto_906115 ?auto_906127 ) ) ( not ( = ?auto_906115 ?auto_906128 ) ) ( not ( = ?auto_906116 ?auto_906117 ) ) ( not ( = ?auto_906116 ?auto_906118 ) ) ( not ( = ?auto_906116 ?auto_906119 ) ) ( not ( = ?auto_906116 ?auto_906120 ) ) ( not ( = ?auto_906116 ?auto_906121 ) ) ( not ( = ?auto_906116 ?auto_906122 ) ) ( not ( = ?auto_906116 ?auto_906123 ) ) ( not ( = ?auto_906116 ?auto_906124 ) ) ( not ( = ?auto_906116 ?auto_906125 ) ) ( not ( = ?auto_906116 ?auto_906126 ) ) ( not ( = ?auto_906116 ?auto_906127 ) ) ( not ( = ?auto_906116 ?auto_906128 ) ) ( not ( = ?auto_906117 ?auto_906118 ) ) ( not ( = ?auto_906117 ?auto_906119 ) ) ( not ( = ?auto_906117 ?auto_906120 ) ) ( not ( = ?auto_906117 ?auto_906121 ) ) ( not ( = ?auto_906117 ?auto_906122 ) ) ( not ( = ?auto_906117 ?auto_906123 ) ) ( not ( = ?auto_906117 ?auto_906124 ) ) ( not ( = ?auto_906117 ?auto_906125 ) ) ( not ( = ?auto_906117 ?auto_906126 ) ) ( not ( = ?auto_906117 ?auto_906127 ) ) ( not ( = ?auto_906117 ?auto_906128 ) ) ( not ( = ?auto_906118 ?auto_906119 ) ) ( not ( = ?auto_906118 ?auto_906120 ) ) ( not ( = ?auto_906118 ?auto_906121 ) ) ( not ( = ?auto_906118 ?auto_906122 ) ) ( not ( = ?auto_906118 ?auto_906123 ) ) ( not ( = ?auto_906118 ?auto_906124 ) ) ( not ( = ?auto_906118 ?auto_906125 ) ) ( not ( = ?auto_906118 ?auto_906126 ) ) ( not ( = ?auto_906118 ?auto_906127 ) ) ( not ( = ?auto_906118 ?auto_906128 ) ) ( not ( = ?auto_906119 ?auto_906120 ) ) ( not ( = ?auto_906119 ?auto_906121 ) ) ( not ( = ?auto_906119 ?auto_906122 ) ) ( not ( = ?auto_906119 ?auto_906123 ) ) ( not ( = ?auto_906119 ?auto_906124 ) ) ( not ( = ?auto_906119 ?auto_906125 ) ) ( not ( = ?auto_906119 ?auto_906126 ) ) ( not ( = ?auto_906119 ?auto_906127 ) ) ( not ( = ?auto_906119 ?auto_906128 ) ) ( not ( = ?auto_906120 ?auto_906121 ) ) ( not ( = ?auto_906120 ?auto_906122 ) ) ( not ( = ?auto_906120 ?auto_906123 ) ) ( not ( = ?auto_906120 ?auto_906124 ) ) ( not ( = ?auto_906120 ?auto_906125 ) ) ( not ( = ?auto_906120 ?auto_906126 ) ) ( not ( = ?auto_906120 ?auto_906127 ) ) ( not ( = ?auto_906120 ?auto_906128 ) ) ( not ( = ?auto_906121 ?auto_906122 ) ) ( not ( = ?auto_906121 ?auto_906123 ) ) ( not ( = ?auto_906121 ?auto_906124 ) ) ( not ( = ?auto_906121 ?auto_906125 ) ) ( not ( = ?auto_906121 ?auto_906126 ) ) ( not ( = ?auto_906121 ?auto_906127 ) ) ( not ( = ?auto_906121 ?auto_906128 ) ) ( not ( = ?auto_906122 ?auto_906123 ) ) ( not ( = ?auto_906122 ?auto_906124 ) ) ( not ( = ?auto_906122 ?auto_906125 ) ) ( not ( = ?auto_906122 ?auto_906126 ) ) ( not ( = ?auto_906122 ?auto_906127 ) ) ( not ( = ?auto_906122 ?auto_906128 ) ) ( not ( = ?auto_906123 ?auto_906124 ) ) ( not ( = ?auto_906123 ?auto_906125 ) ) ( not ( = ?auto_906123 ?auto_906126 ) ) ( not ( = ?auto_906123 ?auto_906127 ) ) ( not ( = ?auto_906123 ?auto_906128 ) ) ( not ( = ?auto_906124 ?auto_906125 ) ) ( not ( = ?auto_906124 ?auto_906126 ) ) ( not ( = ?auto_906124 ?auto_906127 ) ) ( not ( = ?auto_906124 ?auto_906128 ) ) ( not ( = ?auto_906125 ?auto_906126 ) ) ( not ( = ?auto_906125 ?auto_906127 ) ) ( not ( = ?auto_906125 ?auto_906128 ) ) ( not ( = ?auto_906126 ?auto_906127 ) ) ( not ( = ?auto_906126 ?auto_906128 ) ) ( not ( = ?auto_906127 ?auto_906128 ) ) ( ON ?auto_906127 ?auto_906128 ) ( ON ?auto_906126 ?auto_906127 ) ( ON ?auto_906125 ?auto_906126 ) ( ON ?auto_906124 ?auto_906125 ) ( ON ?auto_906123 ?auto_906124 ) ( ON ?auto_906122 ?auto_906123 ) ( ON ?auto_906121 ?auto_906122 ) ( CLEAR ?auto_906119 ) ( ON ?auto_906120 ?auto_906121 ) ( CLEAR ?auto_906120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_906111 ?auto_906112 ?auto_906113 ?auto_906114 ?auto_906115 ?auto_906116 ?auto_906117 ?auto_906118 ?auto_906119 ?auto_906120 )
      ( MAKE-18PILE ?auto_906111 ?auto_906112 ?auto_906113 ?auto_906114 ?auto_906115 ?auto_906116 ?auto_906117 ?auto_906118 ?auto_906119 ?auto_906120 ?auto_906121 ?auto_906122 ?auto_906123 ?auto_906124 ?auto_906125 ?auto_906126 ?auto_906127 ?auto_906128 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906147 - BLOCK
      ?auto_906148 - BLOCK
      ?auto_906149 - BLOCK
      ?auto_906150 - BLOCK
      ?auto_906151 - BLOCK
      ?auto_906152 - BLOCK
      ?auto_906153 - BLOCK
      ?auto_906154 - BLOCK
      ?auto_906155 - BLOCK
      ?auto_906156 - BLOCK
      ?auto_906157 - BLOCK
      ?auto_906158 - BLOCK
      ?auto_906159 - BLOCK
      ?auto_906160 - BLOCK
      ?auto_906161 - BLOCK
      ?auto_906162 - BLOCK
      ?auto_906163 - BLOCK
      ?auto_906164 - BLOCK
    )
    :vars
    (
      ?auto_906165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906164 ?auto_906165 ) ( ON-TABLE ?auto_906147 ) ( ON ?auto_906148 ?auto_906147 ) ( ON ?auto_906149 ?auto_906148 ) ( ON ?auto_906150 ?auto_906149 ) ( ON ?auto_906151 ?auto_906150 ) ( ON ?auto_906152 ?auto_906151 ) ( ON ?auto_906153 ?auto_906152 ) ( ON ?auto_906154 ?auto_906153 ) ( not ( = ?auto_906147 ?auto_906148 ) ) ( not ( = ?auto_906147 ?auto_906149 ) ) ( not ( = ?auto_906147 ?auto_906150 ) ) ( not ( = ?auto_906147 ?auto_906151 ) ) ( not ( = ?auto_906147 ?auto_906152 ) ) ( not ( = ?auto_906147 ?auto_906153 ) ) ( not ( = ?auto_906147 ?auto_906154 ) ) ( not ( = ?auto_906147 ?auto_906155 ) ) ( not ( = ?auto_906147 ?auto_906156 ) ) ( not ( = ?auto_906147 ?auto_906157 ) ) ( not ( = ?auto_906147 ?auto_906158 ) ) ( not ( = ?auto_906147 ?auto_906159 ) ) ( not ( = ?auto_906147 ?auto_906160 ) ) ( not ( = ?auto_906147 ?auto_906161 ) ) ( not ( = ?auto_906147 ?auto_906162 ) ) ( not ( = ?auto_906147 ?auto_906163 ) ) ( not ( = ?auto_906147 ?auto_906164 ) ) ( not ( = ?auto_906147 ?auto_906165 ) ) ( not ( = ?auto_906148 ?auto_906149 ) ) ( not ( = ?auto_906148 ?auto_906150 ) ) ( not ( = ?auto_906148 ?auto_906151 ) ) ( not ( = ?auto_906148 ?auto_906152 ) ) ( not ( = ?auto_906148 ?auto_906153 ) ) ( not ( = ?auto_906148 ?auto_906154 ) ) ( not ( = ?auto_906148 ?auto_906155 ) ) ( not ( = ?auto_906148 ?auto_906156 ) ) ( not ( = ?auto_906148 ?auto_906157 ) ) ( not ( = ?auto_906148 ?auto_906158 ) ) ( not ( = ?auto_906148 ?auto_906159 ) ) ( not ( = ?auto_906148 ?auto_906160 ) ) ( not ( = ?auto_906148 ?auto_906161 ) ) ( not ( = ?auto_906148 ?auto_906162 ) ) ( not ( = ?auto_906148 ?auto_906163 ) ) ( not ( = ?auto_906148 ?auto_906164 ) ) ( not ( = ?auto_906148 ?auto_906165 ) ) ( not ( = ?auto_906149 ?auto_906150 ) ) ( not ( = ?auto_906149 ?auto_906151 ) ) ( not ( = ?auto_906149 ?auto_906152 ) ) ( not ( = ?auto_906149 ?auto_906153 ) ) ( not ( = ?auto_906149 ?auto_906154 ) ) ( not ( = ?auto_906149 ?auto_906155 ) ) ( not ( = ?auto_906149 ?auto_906156 ) ) ( not ( = ?auto_906149 ?auto_906157 ) ) ( not ( = ?auto_906149 ?auto_906158 ) ) ( not ( = ?auto_906149 ?auto_906159 ) ) ( not ( = ?auto_906149 ?auto_906160 ) ) ( not ( = ?auto_906149 ?auto_906161 ) ) ( not ( = ?auto_906149 ?auto_906162 ) ) ( not ( = ?auto_906149 ?auto_906163 ) ) ( not ( = ?auto_906149 ?auto_906164 ) ) ( not ( = ?auto_906149 ?auto_906165 ) ) ( not ( = ?auto_906150 ?auto_906151 ) ) ( not ( = ?auto_906150 ?auto_906152 ) ) ( not ( = ?auto_906150 ?auto_906153 ) ) ( not ( = ?auto_906150 ?auto_906154 ) ) ( not ( = ?auto_906150 ?auto_906155 ) ) ( not ( = ?auto_906150 ?auto_906156 ) ) ( not ( = ?auto_906150 ?auto_906157 ) ) ( not ( = ?auto_906150 ?auto_906158 ) ) ( not ( = ?auto_906150 ?auto_906159 ) ) ( not ( = ?auto_906150 ?auto_906160 ) ) ( not ( = ?auto_906150 ?auto_906161 ) ) ( not ( = ?auto_906150 ?auto_906162 ) ) ( not ( = ?auto_906150 ?auto_906163 ) ) ( not ( = ?auto_906150 ?auto_906164 ) ) ( not ( = ?auto_906150 ?auto_906165 ) ) ( not ( = ?auto_906151 ?auto_906152 ) ) ( not ( = ?auto_906151 ?auto_906153 ) ) ( not ( = ?auto_906151 ?auto_906154 ) ) ( not ( = ?auto_906151 ?auto_906155 ) ) ( not ( = ?auto_906151 ?auto_906156 ) ) ( not ( = ?auto_906151 ?auto_906157 ) ) ( not ( = ?auto_906151 ?auto_906158 ) ) ( not ( = ?auto_906151 ?auto_906159 ) ) ( not ( = ?auto_906151 ?auto_906160 ) ) ( not ( = ?auto_906151 ?auto_906161 ) ) ( not ( = ?auto_906151 ?auto_906162 ) ) ( not ( = ?auto_906151 ?auto_906163 ) ) ( not ( = ?auto_906151 ?auto_906164 ) ) ( not ( = ?auto_906151 ?auto_906165 ) ) ( not ( = ?auto_906152 ?auto_906153 ) ) ( not ( = ?auto_906152 ?auto_906154 ) ) ( not ( = ?auto_906152 ?auto_906155 ) ) ( not ( = ?auto_906152 ?auto_906156 ) ) ( not ( = ?auto_906152 ?auto_906157 ) ) ( not ( = ?auto_906152 ?auto_906158 ) ) ( not ( = ?auto_906152 ?auto_906159 ) ) ( not ( = ?auto_906152 ?auto_906160 ) ) ( not ( = ?auto_906152 ?auto_906161 ) ) ( not ( = ?auto_906152 ?auto_906162 ) ) ( not ( = ?auto_906152 ?auto_906163 ) ) ( not ( = ?auto_906152 ?auto_906164 ) ) ( not ( = ?auto_906152 ?auto_906165 ) ) ( not ( = ?auto_906153 ?auto_906154 ) ) ( not ( = ?auto_906153 ?auto_906155 ) ) ( not ( = ?auto_906153 ?auto_906156 ) ) ( not ( = ?auto_906153 ?auto_906157 ) ) ( not ( = ?auto_906153 ?auto_906158 ) ) ( not ( = ?auto_906153 ?auto_906159 ) ) ( not ( = ?auto_906153 ?auto_906160 ) ) ( not ( = ?auto_906153 ?auto_906161 ) ) ( not ( = ?auto_906153 ?auto_906162 ) ) ( not ( = ?auto_906153 ?auto_906163 ) ) ( not ( = ?auto_906153 ?auto_906164 ) ) ( not ( = ?auto_906153 ?auto_906165 ) ) ( not ( = ?auto_906154 ?auto_906155 ) ) ( not ( = ?auto_906154 ?auto_906156 ) ) ( not ( = ?auto_906154 ?auto_906157 ) ) ( not ( = ?auto_906154 ?auto_906158 ) ) ( not ( = ?auto_906154 ?auto_906159 ) ) ( not ( = ?auto_906154 ?auto_906160 ) ) ( not ( = ?auto_906154 ?auto_906161 ) ) ( not ( = ?auto_906154 ?auto_906162 ) ) ( not ( = ?auto_906154 ?auto_906163 ) ) ( not ( = ?auto_906154 ?auto_906164 ) ) ( not ( = ?auto_906154 ?auto_906165 ) ) ( not ( = ?auto_906155 ?auto_906156 ) ) ( not ( = ?auto_906155 ?auto_906157 ) ) ( not ( = ?auto_906155 ?auto_906158 ) ) ( not ( = ?auto_906155 ?auto_906159 ) ) ( not ( = ?auto_906155 ?auto_906160 ) ) ( not ( = ?auto_906155 ?auto_906161 ) ) ( not ( = ?auto_906155 ?auto_906162 ) ) ( not ( = ?auto_906155 ?auto_906163 ) ) ( not ( = ?auto_906155 ?auto_906164 ) ) ( not ( = ?auto_906155 ?auto_906165 ) ) ( not ( = ?auto_906156 ?auto_906157 ) ) ( not ( = ?auto_906156 ?auto_906158 ) ) ( not ( = ?auto_906156 ?auto_906159 ) ) ( not ( = ?auto_906156 ?auto_906160 ) ) ( not ( = ?auto_906156 ?auto_906161 ) ) ( not ( = ?auto_906156 ?auto_906162 ) ) ( not ( = ?auto_906156 ?auto_906163 ) ) ( not ( = ?auto_906156 ?auto_906164 ) ) ( not ( = ?auto_906156 ?auto_906165 ) ) ( not ( = ?auto_906157 ?auto_906158 ) ) ( not ( = ?auto_906157 ?auto_906159 ) ) ( not ( = ?auto_906157 ?auto_906160 ) ) ( not ( = ?auto_906157 ?auto_906161 ) ) ( not ( = ?auto_906157 ?auto_906162 ) ) ( not ( = ?auto_906157 ?auto_906163 ) ) ( not ( = ?auto_906157 ?auto_906164 ) ) ( not ( = ?auto_906157 ?auto_906165 ) ) ( not ( = ?auto_906158 ?auto_906159 ) ) ( not ( = ?auto_906158 ?auto_906160 ) ) ( not ( = ?auto_906158 ?auto_906161 ) ) ( not ( = ?auto_906158 ?auto_906162 ) ) ( not ( = ?auto_906158 ?auto_906163 ) ) ( not ( = ?auto_906158 ?auto_906164 ) ) ( not ( = ?auto_906158 ?auto_906165 ) ) ( not ( = ?auto_906159 ?auto_906160 ) ) ( not ( = ?auto_906159 ?auto_906161 ) ) ( not ( = ?auto_906159 ?auto_906162 ) ) ( not ( = ?auto_906159 ?auto_906163 ) ) ( not ( = ?auto_906159 ?auto_906164 ) ) ( not ( = ?auto_906159 ?auto_906165 ) ) ( not ( = ?auto_906160 ?auto_906161 ) ) ( not ( = ?auto_906160 ?auto_906162 ) ) ( not ( = ?auto_906160 ?auto_906163 ) ) ( not ( = ?auto_906160 ?auto_906164 ) ) ( not ( = ?auto_906160 ?auto_906165 ) ) ( not ( = ?auto_906161 ?auto_906162 ) ) ( not ( = ?auto_906161 ?auto_906163 ) ) ( not ( = ?auto_906161 ?auto_906164 ) ) ( not ( = ?auto_906161 ?auto_906165 ) ) ( not ( = ?auto_906162 ?auto_906163 ) ) ( not ( = ?auto_906162 ?auto_906164 ) ) ( not ( = ?auto_906162 ?auto_906165 ) ) ( not ( = ?auto_906163 ?auto_906164 ) ) ( not ( = ?auto_906163 ?auto_906165 ) ) ( not ( = ?auto_906164 ?auto_906165 ) ) ( ON ?auto_906163 ?auto_906164 ) ( ON ?auto_906162 ?auto_906163 ) ( ON ?auto_906161 ?auto_906162 ) ( ON ?auto_906160 ?auto_906161 ) ( ON ?auto_906159 ?auto_906160 ) ( ON ?auto_906158 ?auto_906159 ) ( ON ?auto_906157 ?auto_906158 ) ( ON ?auto_906156 ?auto_906157 ) ( CLEAR ?auto_906154 ) ( ON ?auto_906155 ?auto_906156 ) ( CLEAR ?auto_906155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_906147 ?auto_906148 ?auto_906149 ?auto_906150 ?auto_906151 ?auto_906152 ?auto_906153 ?auto_906154 ?auto_906155 )
      ( MAKE-18PILE ?auto_906147 ?auto_906148 ?auto_906149 ?auto_906150 ?auto_906151 ?auto_906152 ?auto_906153 ?auto_906154 ?auto_906155 ?auto_906156 ?auto_906157 ?auto_906158 ?auto_906159 ?auto_906160 ?auto_906161 ?auto_906162 ?auto_906163 ?auto_906164 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906184 - BLOCK
      ?auto_906185 - BLOCK
      ?auto_906186 - BLOCK
      ?auto_906187 - BLOCK
      ?auto_906188 - BLOCK
      ?auto_906189 - BLOCK
      ?auto_906190 - BLOCK
      ?auto_906191 - BLOCK
      ?auto_906192 - BLOCK
      ?auto_906193 - BLOCK
      ?auto_906194 - BLOCK
      ?auto_906195 - BLOCK
      ?auto_906196 - BLOCK
      ?auto_906197 - BLOCK
      ?auto_906198 - BLOCK
      ?auto_906199 - BLOCK
      ?auto_906200 - BLOCK
      ?auto_906201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_906201 ) ( ON-TABLE ?auto_906184 ) ( ON ?auto_906185 ?auto_906184 ) ( ON ?auto_906186 ?auto_906185 ) ( ON ?auto_906187 ?auto_906186 ) ( ON ?auto_906188 ?auto_906187 ) ( ON ?auto_906189 ?auto_906188 ) ( ON ?auto_906190 ?auto_906189 ) ( ON ?auto_906191 ?auto_906190 ) ( not ( = ?auto_906184 ?auto_906185 ) ) ( not ( = ?auto_906184 ?auto_906186 ) ) ( not ( = ?auto_906184 ?auto_906187 ) ) ( not ( = ?auto_906184 ?auto_906188 ) ) ( not ( = ?auto_906184 ?auto_906189 ) ) ( not ( = ?auto_906184 ?auto_906190 ) ) ( not ( = ?auto_906184 ?auto_906191 ) ) ( not ( = ?auto_906184 ?auto_906192 ) ) ( not ( = ?auto_906184 ?auto_906193 ) ) ( not ( = ?auto_906184 ?auto_906194 ) ) ( not ( = ?auto_906184 ?auto_906195 ) ) ( not ( = ?auto_906184 ?auto_906196 ) ) ( not ( = ?auto_906184 ?auto_906197 ) ) ( not ( = ?auto_906184 ?auto_906198 ) ) ( not ( = ?auto_906184 ?auto_906199 ) ) ( not ( = ?auto_906184 ?auto_906200 ) ) ( not ( = ?auto_906184 ?auto_906201 ) ) ( not ( = ?auto_906185 ?auto_906186 ) ) ( not ( = ?auto_906185 ?auto_906187 ) ) ( not ( = ?auto_906185 ?auto_906188 ) ) ( not ( = ?auto_906185 ?auto_906189 ) ) ( not ( = ?auto_906185 ?auto_906190 ) ) ( not ( = ?auto_906185 ?auto_906191 ) ) ( not ( = ?auto_906185 ?auto_906192 ) ) ( not ( = ?auto_906185 ?auto_906193 ) ) ( not ( = ?auto_906185 ?auto_906194 ) ) ( not ( = ?auto_906185 ?auto_906195 ) ) ( not ( = ?auto_906185 ?auto_906196 ) ) ( not ( = ?auto_906185 ?auto_906197 ) ) ( not ( = ?auto_906185 ?auto_906198 ) ) ( not ( = ?auto_906185 ?auto_906199 ) ) ( not ( = ?auto_906185 ?auto_906200 ) ) ( not ( = ?auto_906185 ?auto_906201 ) ) ( not ( = ?auto_906186 ?auto_906187 ) ) ( not ( = ?auto_906186 ?auto_906188 ) ) ( not ( = ?auto_906186 ?auto_906189 ) ) ( not ( = ?auto_906186 ?auto_906190 ) ) ( not ( = ?auto_906186 ?auto_906191 ) ) ( not ( = ?auto_906186 ?auto_906192 ) ) ( not ( = ?auto_906186 ?auto_906193 ) ) ( not ( = ?auto_906186 ?auto_906194 ) ) ( not ( = ?auto_906186 ?auto_906195 ) ) ( not ( = ?auto_906186 ?auto_906196 ) ) ( not ( = ?auto_906186 ?auto_906197 ) ) ( not ( = ?auto_906186 ?auto_906198 ) ) ( not ( = ?auto_906186 ?auto_906199 ) ) ( not ( = ?auto_906186 ?auto_906200 ) ) ( not ( = ?auto_906186 ?auto_906201 ) ) ( not ( = ?auto_906187 ?auto_906188 ) ) ( not ( = ?auto_906187 ?auto_906189 ) ) ( not ( = ?auto_906187 ?auto_906190 ) ) ( not ( = ?auto_906187 ?auto_906191 ) ) ( not ( = ?auto_906187 ?auto_906192 ) ) ( not ( = ?auto_906187 ?auto_906193 ) ) ( not ( = ?auto_906187 ?auto_906194 ) ) ( not ( = ?auto_906187 ?auto_906195 ) ) ( not ( = ?auto_906187 ?auto_906196 ) ) ( not ( = ?auto_906187 ?auto_906197 ) ) ( not ( = ?auto_906187 ?auto_906198 ) ) ( not ( = ?auto_906187 ?auto_906199 ) ) ( not ( = ?auto_906187 ?auto_906200 ) ) ( not ( = ?auto_906187 ?auto_906201 ) ) ( not ( = ?auto_906188 ?auto_906189 ) ) ( not ( = ?auto_906188 ?auto_906190 ) ) ( not ( = ?auto_906188 ?auto_906191 ) ) ( not ( = ?auto_906188 ?auto_906192 ) ) ( not ( = ?auto_906188 ?auto_906193 ) ) ( not ( = ?auto_906188 ?auto_906194 ) ) ( not ( = ?auto_906188 ?auto_906195 ) ) ( not ( = ?auto_906188 ?auto_906196 ) ) ( not ( = ?auto_906188 ?auto_906197 ) ) ( not ( = ?auto_906188 ?auto_906198 ) ) ( not ( = ?auto_906188 ?auto_906199 ) ) ( not ( = ?auto_906188 ?auto_906200 ) ) ( not ( = ?auto_906188 ?auto_906201 ) ) ( not ( = ?auto_906189 ?auto_906190 ) ) ( not ( = ?auto_906189 ?auto_906191 ) ) ( not ( = ?auto_906189 ?auto_906192 ) ) ( not ( = ?auto_906189 ?auto_906193 ) ) ( not ( = ?auto_906189 ?auto_906194 ) ) ( not ( = ?auto_906189 ?auto_906195 ) ) ( not ( = ?auto_906189 ?auto_906196 ) ) ( not ( = ?auto_906189 ?auto_906197 ) ) ( not ( = ?auto_906189 ?auto_906198 ) ) ( not ( = ?auto_906189 ?auto_906199 ) ) ( not ( = ?auto_906189 ?auto_906200 ) ) ( not ( = ?auto_906189 ?auto_906201 ) ) ( not ( = ?auto_906190 ?auto_906191 ) ) ( not ( = ?auto_906190 ?auto_906192 ) ) ( not ( = ?auto_906190 ?auto_906193 ) ) ( not ( = ?auto_906190 ?auto_906194 ) ) ( not ( = ?auto_906190 ?auto_906195 ) ) ( not ( = ?auto_906190 ?auto_906196 ) ) ( not ( = ?auto_906190 ?auto_906197 ) ) ( not ( = ?auto_906190 ?auto_906198 ) ) ( not ( = ?auto_906190 ?auto_906199 ) ) ( not ( = ?auto_906190 ?auto_906200 ) ) ( not ( = ?auto_906190 ?auto_906201 ) ) ( not ( = ?auto_906191 ?auto_906192 ) ) ( not ( = ?auto_906191 ?auto_906193 ) ) ( not ( = ?auto_906191 ?auto_906194 ) ) ( not ( = ?auto_906191 ?auto_906195 ) ) ( not ( = ?auto_906191 ?auto_906196 ) ) ( not ( = ?auto_906191 ?auto_906197 ) ) ( not ( = ?auto_906191 ?auto_906198 ) ) ( not ( = ?auto_906191 ?auto_906199 ) ) ( not ( = ?auto_906191 ?auto_906200 ) ) ( not ( = ?auto_906191 ?auto_906201 ) ) ( not ( = ?auto_906192 ?auto_906193 ) ) ( not ( = ?auto_906192 ?auto_906194 ) ) ( not ( = ?auto_906192 ?auto_906195 ) ) ( not ( = ?auto_906192 ?auto_906196 ) ) ( not ( = ?auto_906192 ?auto_906197 ) ) ( not ( = ?auto_906192 ?auto_906198 ) ) ( not ( = ?auto_906192 ?auto_906199 ) ) ( not ( = ?auto_906192 ?auto_906200 ) ) ( not ( = ?auto_906192 ?auto_906201 ) ) ( not ( = ?auto_906193 ?auto_906194 ) ) ( not ( = ?auto_906193 ?auto_906195 ) ) ( not ( = ?auto_906193 ?auto_906196 ) ) ( not ( = ?auto_906193 ?auto_906197 ) ) ( not ( = ?auto_906193 ?auto_906198 ) ) ( not ( = ?auto_906193 ?auto_906199 ) ) ( not ( = ?auto_906193 ?auto_906200 ) ) ( not ( = ?auto_906193 ?auto_906201 ) ) ( not ( = ?auto_906194 ?auto_906195 ) ) ( not ( = ?auto_906194 ?auto_906196 ) ) ( not ( = ?auto_906194 ?auto_906197 ) ) ( not ( = ?auto_906194 ?auto_906198 ) ) ( not ( = ?auto_906194 ?auto_906199 ) ) ( not ( = ?auto_906194 ?auto_906200 ) ) ( not ( = ?auto_906194 ?auto_906201 ) ) ( not ( = ?auto_906195 ?auto_906196 ) ) ( not ( = ?auto_906195 ?auto_906197 ) ) ( not ( = ?auto_906195 ?auto_906198 ) ) ( not ( = ?auto_906195 ?auto_906199 ) ) ( not ( = ?auto_906195 ?auto_906200 ) ) ( not ( = ?auto_906195 ?auto_906201 ) ) ( not ( = ?auto_906196 ?auto_906197 ) ) ( not ( = ?auto_906196 ?auto_906198 ) ) ( not ( = ?auto_906196 ?auto_906199 ) ) ( not ( = ?auto_906196 ?auto_906200 ) ) ( not ( = ?auto_906196 ?auto_906201 ) ) ( not ( = ?auto_906197 ?auto_906198 ) ) ( not ( = ?auto_906197 ?auto_906199 ) ) ( not ( = ?auto_906197 ?auto_906200 ) ) ( not ( = ?auto_906197 ?auto_906201 ) ) ( not ( = ?auto_906198 ?auto_906199 ) ) ( not ( = ?auto_906198 ?auto_906200 ) ) ( not ( = ?auto_906198 ?auto_906201 ) ) ( not ( = ?auto_906199 ?auto_906200 ) ) ( not ( = ?auto_906199 ?auto_906201 ) ) ( not ( = ?auto_906200 ?auto_906201 ) ) ( ON ?auto_906200 ?auto_906201 ) ( ON ?auto_906199 ?auto_906200 ) ( ON ?auto_906198 ?auto_906199 ) ( ON ?auto_906197 ?auto_906198 ) ( ON ?auto_906196 ?auto_906197 ) ( ON ?auto_906195 ?auto_906196 ) ( ON ?auto_906194 ?auto_906195 ) ( ON ?auto_906193 ?auto_906194 ) ( CLEAR ?auto_906191 ) ( ON ?auto_906192 ?auto_906193 ) ( CLEAR ?auto_906192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_906184 ?auto_906185 ?auto_906186 ?auto_906187 ?auto_906188 ?auto_906189 ?auto_906190 ?auto_906191 ?auto_906192 )
      ( MAKE-18PILE ?auto_906184 ?auto_906185 ?auto_906186 ?auto_906187 ?auto_906188 ?auto_906189 ?auto_906190 ?auto_906191 ?auto_906192 ?auto_906193 ?auto_906194 ?auto_906195 ?auto_906196 ?auto_906197 ?auto_906198 ?auto_906199 ?auto_906200 ?auto_906201 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906220 - BLOCK
      ?auto_906221 - BLOCK
      ?auto_906222 - BLOCK
      ?auto_906223 - BLOCK
      ?auto_906224 - BLOCK
      ?auto_906225 - BLOCK
      ?auto_906226 - BLOCK
      ?auto_906227 - BLOCK
      ?auto_906228 - BLOCK
      ?auto_906229 - BLOCK
      ?auto_906230 - BLOCK
      ?auto_906231 - BLOCK
      ?auto_906232 - BLOCK
      ?auto_906233 - BLOCK
      ?auto_906234 - BLOCK
      ?auto_906235 - BLOCK
      ?auto_906236 - BLOCK
      ?auto_906237 - BLOCK
    )
    :vars
    (
      ?auto_906238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906237 ?auto_906238 ) ( ON-TABLE ?auto_906220 ) ( ON ?auto_906221 ?auto_906220 ) ( ON ?auto_906222 ?auto_906221 ) ( ON ?auto_906223 ?auto_906222 ) ( ON ?auto_906224 ?auto_906223 ) ( ON ?auto_906225 ?auto_906224 ) ( ON ?auto_906226 ?auto_906225 ) ( not ( = ?auto_906220 ?auto_906221 ) ) ( not ( = ?auto_906220 ?auto_906222 ) ) ( not ( = ?auto_906220 ?auto_906223 ) ) ( not ( = ?auto_906220 ?auto_906224 ) ) ( not ( = ?auto_906220 ?auto_906225 ) ) ( not ( = ?auto_906220 ?auto_906226 ) ) ( not ( = ?auto_906220 ?auto_906227 ) ) ( not ( = ?auto_906220 ?auto_906228 ) ) ( not ( = ?auto_906220 ?auto_906229 ) ) ( not ( = ?auto_906220 ?auto_906230 ) ) ( not ( = ?auto_906220 ?auto_906231 ) ) ( not ( = ?auto_906220 ?auto_906232 ) ) ( not ( = ?auto_906220 ?auto_906233 ) ) ( not ( = ?auto_906220 ?auto_906234 ) ) ( not ( = ?auto_906220 ?auto_906235 ) ) ( not ( = ?auto_906220 ?auto_906236 ) ) ( not ( = ?auto_906220 ?auto_906237 ) ) ( not ( = ?auto_906220 ?auto_906238 ) ) ( not ( = ?auto_906221 ?auto_906222 ) ) ( not ( = ?auto_906221 ?auto_906223 ) ) ( not ( = ?auto_906221 ?auto_906224 ) ) ( not ( = ?auto_906221 ?auto_906225 ) ) ( not ( = ?auto_906221 ?auto_906226 ) ) ( not ( = ?auto_906221 ?auto_906227 ) ) ( not ( = ?auto_906221 ?auto_906228 ) ) ( not ( = ?auto_906221 ?auto_906229 ) ) ( not ( = ?auto_906221 ?auto_906230 ) ) ( not ( = ?auto_906221 ?auto_906231 ) ) ( not ( = ?auto_906221 ?auto_906232 ) ) ( not ( = ?auto_906221 ?auto_906233 ) ) ( not ( = ?auto_906221 ?auto_906234 ) ) ( not ( = ?auto_906221 ?auto_906235 ) ) ( not ( = ?auto_906221 ?auto_906236 ) ) ( not ( = ?auto_906221 ?auto_906237 ) ) ( not ( = ?auto_906221 ?auto_906238 ) ) ( not ( = ?auto_906222 ?auto_906223 ) ) ( not ( = ?auto_906222 ?auto_906224 ) ) ( not ( = ?auto_906222 ?auto_906225 ) ) ( not ( = ?auto_906222 ?auto_906226 ) ) ( not ( = ?auto_906222 ?auto_906227 ) ) ( not ( = ?auto_906222 ?auto_906228 ) ) ( not ( = ?auto_906222 ?auto_906229 ) ) ( not ( = ?auto_906222 ?auto_906230 ) ) ( not ( = ?auto_906222 ?auto_906231 ) ) ( not ( = ?auto_906222 ?auto_906232 ) ) ( not ( = ?auto_906222 ?auto_906233 ) ) ( not ( = ?auto_906222 ?auto_906234 ) ) ( not ( = ?auto_906222 ?auto_906235 ) ) ( not ( = ?auto_906222 ?auto_906236 ) ) ( not ( = ?auto_906222 ?auto_906237 ) ) ( not ( = ?auto_906222 ?auto_906238 ) ) ( not ( = ?auto_906223 ?auto_906224 ) ) ( not ( = ?auto_906223 ?auto_906225 ) ) ( not ( = ?auto_906223 ?auto_906226 ) ) ( not ( = ?auto_906223 ?auto_906227 ) ) ( not ( = ?auto_906223 ?auto_906228 ) ) ( not ( = ?auto_906223 ?auto_906229 ) ) ( not ( = ?auto_906223 ?auto_906230 ) ) ( not ( = ?auto_906223 ?auto_906231 ) ) ( not ( = ?auto_906223 ?auto_906232 ) ) ( not ( = ?auto_906223 ?auto_906233 ) ) ( not ( = ?auto_906223 ?auto_906234 ) ) ( not ( = ?auto_906223 ?auto_906235 ) ) ( not ( = ?auto_906223 ?auto_906236 ) ) ( not ( = ?auto_906223 ?auto_906237 ) ) ( not ( = ?auto_906223 ?auto_906238 ) ) ( not ( = ?auto_906224 ?auto_906225 ) ) ( not ( = ?auto_906224 ?auto_906226 ) ) ( not ( = ?auto_906224 ?auto_906227 ) ) ( not ( = ?auto_906224 ?auto_906228 ) ) ( not ( = ?auto_906224 ?auto_906229 ) ) ( not ( = ?auto_906224 ?auto_906230 ) ) ( not ( = ?auto_906224 ?auto_906231 ) ) ( not ( = ?auto_906224 ?auto_906232 ) ) ( not ( = ?auto_906224 ?auto_906233 ) ) ( not ( = ?auto_906224 ?auto_906234 ) ) ( not ( = ?auto_906224 ?auto_906235 ) ) ( not ( = ?auto_906224 ?auto_906236 ) ) ( not ( = ?auto_906224 ?auto_906237 ) ) ( not ( = ?auto_906224 ?auto_906238 ) ) ( not ( = ?auto_906225 ?auto_906226 ) ) ( not ( = ?auto_906225 ?auto_906227 ) ) ( not ( = ?auto_906225 ?auto_906228 ) ) ( not ( = ?auto_906225 ?auto_906229 ) ) ( not ( = ?auto_906225 ?auto_906230 ) ) ( not ( = ?auto_906225 ?auto_906231 ) ) ( not ( = ?auto_906225 ?auto_906232 ) ) ( not ( = ?auto_906225 ?auto_906233 ) ) ( not ( = ?auto_906225 ?auto_906234 ) ) ( not ( = ?auto_906225 ?auto_906235 ) ) ( not ( = ?auto_906225 ?auto_906236 ) ) ( not ( = ?auto_906225 ?auto_906237 ) ) ( not ( = ?auto_906225 ?auto_906238 ) ) ( not ( = ?auto_906226 ?auto_906227 ) ) ( not ( = ?auto_906226 ?auto_906228 ) ) ( not ( = ?auto_906226 ?auto_906229 ) ) ( not ( = ?auto_906226 ?auto_906230 ) ) ( not ( = ?auto_906226 ?auto_906231 ) ) ( not ( = ?auto_906226 ?auto_906232 ) ) ( not ( = ?auto_906226 ?auto_906233 ) ) ( not ( = ?auto_906226 ?auto_906234 ) ) ( not ( = ?auto_906226 ?auto_906235 ) ) ( not ( = ?auto_906226 ?auto_906236 ) ) ( not ( = ?auto_906226 ?auto_906237 ) ) ( not ( = ?auto_906226 ?auto_906238 ) ) ( not ( = ?auto_906227 ?auto_906228 ) ) ( not ( = ?auto_906227 ?auto_906229 ) ) ( not ( = ?auto_906227 ?auto_906230 ) ) ( not ( = ?auto_906227 ?auto_906231 ) ) ( not ( = ?auto_906227 ?auto_906232 ) ) ( not ( = ?auto_906227 ?auto_906233 ) ) ( not ( = ?auto_906227 ?auto_906234 ) ) ( not ( = ?auto_906227 ?auto_906235 ) ) ( not ( = ?auto_906227 ?auto_906236 ) ) ( not ( = ?auto_906227 ?auto_906237 ) ) ( not ( = ?auto_906227 ?auto_906238 ) ) ( not ( = ?auto_906228 ?auto_906229 ) ) ( not ( = ?auto_906228 ?auto_906230 ) ) ( not ( = ?auto_906228 ?auto_906231 ) ) ( not ( = ?auto_906228 ?auto_906232 ) ) ( not ( = ?auto_906228 ?auto_906233 ) ) ( not ( = ?auto_906228 ?auto_906234 ) ) ( not ( = ?auto_906228 ?auto_906235 ) ) ( not ( = ?auto_906228 ?auto_906236 ) ) ( not ( = ?auto_906228 ?auto_906237 ) ) ( not ( = ?auto_906228 ?auto_906238 ) ) ( not ( = ?auto_906229 ?auto_906230 ) ) ( not ( = ?auto_906229 ?auto_906231 ) ) ( not ( = ?auto_906229 ?auto_906232 ) ) ( not ( = ?auto_906229 ?auto_906233 ) ) ( not ( = ?auto_906229 ?auto_906234 ) ) ( not ( = ?auto_906229 ?auto_906235 ) ) ( not ( = ?auto_906229 ?auto_906236 ) ) ( not ( = ?auto_906229 ?auto_906237 ) ) ( not ( = ?auto_906229 ?auto_906238 ) ) ( not ( = ?auto_906230 ?auto_906231 ) ) ( not ( = ?auto_906230 ?auto_906232 ) ) ( not ( = ?auto_906230 ?auto_906233 ) ) ( not ( = ?auto_906230 ?auto_906234 ) ) ( not ( = ?auto_906230 ?auto_906235 ) ) ( not ( = ?auto_906230 ?auto_906236 ) ) ( not ( = ?auto_906230 ?auto_906237 ) ) ( not ( = ?auto_906230 ?auto_906238 ) ) ( not ( = ?auto_906231 ?auto_906232 ) ) ( not ( = ?auto_906231 ?auto_906233 ) ) ( not ( = ?auto_906231 ?auto_906234 ) ) ( not ( = ?auto_906231 ?auto_906235 ) ) ( not ( = ?auto_906231 ?auto_906236 ) ) ( not ( = ?auto_906231 ?auto_906237 ) ) ( not ( = ?auto_906231 ?auto_906238 ) ) ( not ( = ?auto_906232 ?auto_906233 ) ) ( not ( = ?auto_906232 ?auto_906234 ) ) ( not ( = ?auto_906232 ?auto_906235 ) ) ( not ( = ?auto_906232 ?auto_906236 ) ) ( not ( = ?auto_906232 ?auto_906237 ) ) ( not ( = ?auto_906232 ?auto_906238 ) ) ( not ( = ?auto_906233 ?auto_906234 ) ) ( not ( = ?auto_906233 ?auto_906235 ) ) ( not ( = ?auto_906233 ?auto_906236 ) ) ( not ( = ?auto_906233 ?auto_906237 ) ) ( not ( = ?auto_906233 ?auto_906238 ) ) ( not ( = ?auto_906234 ?auto_906235 ) ) ( not ( = ?auto_906234 ?auto_906236 ) ) ( not ( = ?auto_906234 ?auto_906237 ) ) ( not ( = ?auto_906234 ?auto_906238 ) ) ( not ( = ?auto_906235 ?auto_906236 ) ) ( not ( = ?auto_906235 ?auto_906237 ) ) ( not ( = ?auto_906235 ?auto_906238 ) ) ( not ( = ?auto_906236 ?auto_906237 ) ) ( not ( = ?auto_906236 ?auto_906238 ) ) ( not ( = ?auto_906237 ?auto_906238 ) ) ( ON ?auto_906236 ?auto_906237 ) ( ON ?auto_906235 ?auto_906236 ) ( ON ?auto_906234 ?auto_906235 ) ( ON ?auto_906233 ?auto_906234 ) ( ON ?auto_906232 ?auto_906233 ) ( ON ?auto_906231 ?auto_906232 ) ( ON ?auto_906230 ?auto_906231 ) ( ON ?auto_906229 ?auto_906230 ) ( ON ?auto_906228 ?auto_906229 ) ( CLEAR ?auto_906226 ) ( ON ?auto_906227 ?auto_906228 ) ( CLEAR ?auto_906227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_906220 ?auto_906221 ?auto_906222 ?auto_906223 ?auto_906224 ?auto_906225 ?auto_906226 ?auto_906227 )
      ( MAKE-18PILE ?auto_906220 ?auto_906221 ?auto_906222 ?auto_906223 ?auto_906224 ?auto_906225 ?auto_906226 ?auto_906227 ?auto_906228 ?auto_906229 ?auto_906230 ?auto_906231 ?auto_906232 ?auto_906233 ?auto_906234 ?auto_906235 ?auto_906236 ?auto_906237 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906257 - BLOCK
      ?auto_906258 - BLOCK
      ?auto_906259 - BLOCK
      ?auto_906260 - BLOCK
      ?auto_906261 - BLOCK
      ?auto_906262 - BLOCK
      ?auto_906263 - BLOCK
      ?auto_906264 - BLOCK
      ?auto_906265 - BLOCK
      ?auto_906266 - BLOCK
      ?auto_906267 - BLOCK
      ?auto_906268 - BLOCK
      ?auto_906269 - BLOCK
      ?auto_906270 - BLOCK
      ?auto_906271 - BLOCK
      ?auto_906272 - BLOCK
      ?auto_906273 - BLOCK
      ?auto_906274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_906274 ) ( ON-TABLE ?auto_906257 ) ( ON ?auto_906258 ?auto_906257 ) ( ON ?auto_906259 ?auto_906258 ) ( ON ?auto_906260 ?auto_906259 ) ( ON ?auto_906261 ?auto_906260 ) ( ON ?auto_906262 ?auto_906261 ) ( ON ?auto_906263 ?auto_906262 ) ( not ( = ?auto_906257 ?auto_906258 ) ) ( not ( = ?auto_906257 ?auto_906259 ) ) ( not ( = ?auto_906257 ?auto_906260 ) ) ( not ( = ?auto_906257 ?auto_906261 ) ) ( not ( = ?auto_906257 ?auto_906262 ) ) ( not ( = ?auto_906257 ?auto_906263 ) ) ( not ( = ?auto_906257 ?auto_906264 ) ) ( not ( = ?auto_906257 ?auto_906265 ) ) ( not ( = ?auto_906257 ?auto_906266 ) ) ( not ( = ?auto_906257 ?auto_906267 ) ) ( not ( = ?auto_906257 ?auto_906268 ) ) ( not ( = ?auto_906257 ?auto_906269 ) ) ( not ( = ?auto_906257 ?auto_906270 ) ) ( not ( = ?auto_906257 ?auto_906271 ) ) ( not ( = ?auto_906257 ?auto_906272 ) ) ( not ( = ?auto_906257 ?auto_906273 ) ) ( not ( = ?auto_906257 ?auto_906274 ) ) ( not ( = ?auto_906258 ?auto_906259 ) ) ( not ( = ?auto_906258 ?auto_906260 ) ) ( not ( = ?auto_906258 ?auto_906261 ) ) ( not ( = ?auto_906258 ?auto_906262 ) ) ( not ( = ?auto_906258 ?auto_906263 ) ) ( not ( = ?auto_906258 ?auto_906264 ) ) ( not ( = ?auto_906258 ?auto_906265 ) ) ( not ( = ?auto_906258 ?auto_906266 ) ) ( not ( = ?auto_906258 ?auto_906267 ) ) ( not ( = ?auto_906258 ?auto_906268 ) ) ( not ( = ?auto_906258 ?auto_906269 ) ) ( not ( = ?auto_906258 ?auto_906270 ) ) ( not ( = ?auto_906258 ?auto_906271 ) ) ( not ( = ?auto_906258 ?auto_906272 ) ) ( not ( = ?auto_906258 ?auto_906273 ) ) ( not ( = ?auto_906258 ?auto_906274 ) ) ( not ( = ?auto_906259 ?auto_906260 ) ) ( not ( = ?auto_906259 ?auto_906261 ) ) ( not ( = ?auto_906259 ?auto_906262 ) ) ( not ( = ?auto_906259 ?auto_906263 ) ) ( not ( = ?auto_906259 ?auto_906264 ) ) ( not ( = ?auto_906259 ?auto_906265 ) ) ( not ( = ?auto_906259 ?auto_906266 ) ) ( not ( = ?auto_906259 ?auto_906267 ) ) ( not ( = ?auto_906259 ?auto_906268 ) ) ( not ( = ?auto_906259 ?auto_906269 ) ) ( not ( = ?auto_906259 ?auto_906270 ) ) ( not ( = ?auto_906259 ?auto_906271 ) ) ( not ( = ?auto_906259 ?auto_906272 ) ) ( not ( = ?auto_906259 ?auto_906273 ) ) ( not ( = ?auto_906259 ?auto_906274 ) ) ( not ( = ?auto_906260 ?auto_906261 ) ) ( not ( = ?auto_906260 ?auto_906262 ) ) ( not ( = ?auto_906260 ?auto_906263 ) ) ( not ( = ?auto_906260 ?auto_906264 ) ) ( not ( = ?auto_906260 ?auto_906265 ) ) ( not ( = ?auto_906260 ?auto_906266 ) ) ( not ( = ?auto_906260 ?auto_906267 ) ) ( not ( = ?auto_906260 ?auto_906268 ) ) ( not ( = ?auto_906260 ?auto_906269 ) ) ( not ( = ?auto_906260 ?auto_906270 ) ) ( not ( = ?auto_906260 ?auto_906271 ) ) ( not ( = ?auto_906260 ?auto_906272 ) ) ( not ( = ?auto_906260 ?auto_906273 ) ) ( not ( = ?auto_906260 ?auto_906274 ) ) ( not ( = ?auto_906261 ?auto_906262 ) ) ( not ( = ?auto_906261 ?auto_906263 ) ) ( not ( = ?auto_906261 ?auto_906264 ) ) ( not ( = ?auto_906261 ?auto_906265 ) ) ( not ( = ?auto_906261 ?auto_906266 ) ) ( not ( = ?auto_906261 ?auto_906267 ) ) ( not ( = ?auto_906261 ?auto_906268 ) ) ( not ( = ?auto_906261 ?auto_906269 ) ) ( not ( = ?auto_906261 ?auto_906270 ) ) ( not ( = ?auto_906261 ?auto_906271 ) ) ( not ( = ?auto_906261 ?auto_906272 ) ) ( not ( = ?auto_906261 ?auto_906273 ) ) ( not ( = ?auto_906261 ?auto_906274 ) ) ( not ( = ?auto_906262 ?auto_906263 ) ) ( not ( = ?auto_906262 ?auto_906264 ) ) ( not ( = ?auto_906262 ?auto_906265 ) ) ( not ( = ?auto_906262 ?auto_906266 ) ) ( not ( = ?auto_906262 ?auto_906267 ) ) ( not ( = ?auto_906262 ?auto_906268 ) ) ( not ( = ?auto_906262 ?auto_906269 ) ) ( not ( = ?auto_906262 ?auto_906270 ) ) ( not ( = ?auto_906262 ?auto_906271 ) ) ( not ( = ?auto_906262 ?auto_906272 ) ) ( not ( = ?auto_906262 ?auto_906273 ) ) ( not ( = ?auto_906262 ?auto_906274 ) ) ( not ( = ?auto_906263 ?auto_906264 ) ) ( not ( = ?auto_906263 ?auto_906265 ) ) ( not ( = ?auto_906263 ?auto_906266 ) ) ( not ( = ?auto_906263 ?auto_906267 ) ) ( not ( = ?auto_906263 ?auto_906268 ) ) ( not ( = ?auto_906263 ?auto_906269 ) ) ( not ( = ?auto_906263 ?auto_906270 ) ) ( not ( = ?auto_906263 ?auto_906271 ) ) ( not ( = ?auto_906263 ?auto_906272 ) ) ( not ( = ?auto_906263 ?auto_906273 ) ) ( not ( = ?auto_906263 ?auto_906274 ) ) ( not ( = ?auto_906264 ?auto_906265 ) ) ( not ( = ?auto_906264 ?auto_906266 ) ) ( not ( = ?auto_906264 ?auto_906267 ) ) ( not ( = ?auto_906264 ?auto_906268 ) ) ( not ( = ?auto_906264 ?auto_906269 ) ) ( not ( = ?auto_906264 ?auto_906270 ) ) ( not ( = ?auto_906264 ?auto_906271 ) ) ( not ( = ?auto_906264 ?auto_906272 ) ) ( not ( = ?auto_906264 ?auto_906273 ) ) ( not ( = ?auto_906264 ?auto_906274 ) ) ( not ( = ?auto_906265 ?auto_906266 ) ) ( not ( = ?auto_906265 ?auto_906267 ) ) ( not ( = ?auto_906265 ?auto_906268 ) ) ( not ( = ?auto_906265 ?auto_906269 ) ) ( not ( = ?auto_906265 ?auto_906270 ) ) ( not ( = ?auto_906265 ?auto_906271 ) ) ( not ( = ?auto_906265 ?auto_906272 ) ) ( not ( = ?auto_906265 ?auto_906273 ) ) ( not ( = ?auto_906265 ?auto_906274 ) ) ( not ( = ?auto_906266 ?auto_906267 ) ) ( not ( = ?auto_906266 ?auto_906268 ) ) ( not ( = ?auto_906266 ?auto_906269 ) ) ( not ( = ?auto_906266 ?auto_906270 ) ) ( not ( = ?auto_906266 ?auto_906271 ) ) ( not ( = ?auto_906266 ?auto_906272 ) ) ( not ( = ?auto_906266 ?auto_906273 ) ) ( not ( = ?auto_906266 ?auto_906274 ) ) ( not ( = ?auto_906267 ?auto_906268 ) ) ( not ( = ?auto_906267 ?auto_906269 ) ) ( not ( = ?auto_906267 ?auto_906270 ) ) ( not ( = ?auto_906267 ?auto_906271 ) ) ( not ( = ?auto_906267 ?auto_906272 ) ) ( not ( = ?auto_906267 ?auto_906273 ) ) ( not ( = ?auto_906267 ?auto_906274 ) ) ( not ( = ?auto_906268 ?auto_906269 ) ) ( not ( = ?auto_906268 ?auto_906270 ) ) ( not ( = ?auto_906268 ?auto_906271 ) ) ( not ( = ?auto_906268 ?auto_906272 ) ) ( not ( = ?auto_906268 ?auto_906273 ) ) ( not ( = ?auto_906268 ?auto_906274 ) ) ( not ( = ?auto_906269 ?auto_906270 ) ) ( not ( = ?auto_906269 ?auto_906271 ) ) ( not ( = ?auto_906269 ?auto_906272 ) ) ( not ( = ?auto_906269 ?auto_906273 ) ) ( not ( = ?auto_906269 ?auto_906274 ) ) ( not ( = ?auto_906270 ?auto_906271 ) ) ( not ( = ?auto_906270 ?auto_906272 ) ) ( not ( = ?auto_906270 ?auto_906273 ) ) ( not ( = ?auto_906270 ?auto_906274 ) ) ( not ( = ?auto_906271 ?auto_906272 ) ) ( not ( = ?auto_906271 ?auto_906273 ) ) ( not ( = ?auto_906271 ?auto_906274 ) ) ( not ( = ?auto_906272 ?auto_906273 ) ) ( not ( = ?auto_906272 ?auto_906274 ) ) ( not ( = ?auto_906273 ?auto_906274 ) ) ( ON ?auto_906273 ?auto_906274 ) ( ON ?auto_906272 ?auto_906273 ) ( ON ?auto_906271 ?auto_906272 ) ( ON ?auto_906270 ?auto_906271 ) ( ON ?auto_906269 ?auto_906270 ) ( ON ?auto_906268 ?auto_906269 ) ( ON ?auto_906267 ?auto_906268 ) ( ON ?auto_906266 ?auto_906267 ) ( ON ?auto_906265 ?auto_906266 ) ( CLEAR ?auto_906263 ) ( ON ?auto_906264 ?auto_906265 ) ( CLEAR ?auto_906264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_906257 ?auto_906258 ?auto_906259 ?auto_906260 ?auto_906261 ?auto_906262 ?auto_906263 ?auto_906264 )
      ( MAKE-18PILE ?auto_906257 ?auto_906258 ?auto_906259 ?auto_906260 ?auto_906261 ?auto_906262 ?auto_906263 ?auto_906264 ?auto_906265 ?auto_906266 ?auto_906267 ?auto_906268 ?auto_906269 ?auto_906270 ?auto_906271 ?auto_906272 ?auto_906273 ?auto_906274 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906293 - BLOCK
      ?auto_906294 - BLOCK
      ?auto_906295 - BLOCK
      ?auto_906296 - BLOCK
      ?auto_906297 - BLOCK
      ?auto_906298 - BLOCK
      ?auto_906299 - BLOCK
      ?auto_906300 - BLOCK
      ?auto_906301 - BLOCK
      ?auto_906302 - BLOCK
      ?auto_906303 - BLOCK
      ?auto_906304 - BLOCK
      ?auto_906305 - BLOCK
      ?auto_906306 - BLOCK
      ?auto_906307 - BLOCK
      ?auto_906308 - BLOCK
      ?auto_906309 - BLOCK
      ?auto_906310 - BLOCK
    )
    :vars
    (
      ?auto_906311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906310 ?auto_906311 ) ( ON-TABLE ?auto_906293 ) ( ON ?auto_906294 ?auto_906293 ) ( ON ?auto_906295 ?auto_906294 ) ( ON ?auto_906296 ?auto_906295 ) ( ON ?auto_906297 ?auto_906296 ) ( ON ?auto_906298 ?auto_906297 ) ( not ( = ?auto_906293 ?auto_906294 ) ) ( not ( = ?auto_906293 ?auto_906295 ) ) ( not ( = ?auto_906293 ?auto_906296 ) ) ( not ( = ?auto_906293 ?auto_906297 ) ) ( not ( = ?auto_906293 ?auto_906298 ) ) ( not ( = ?auto_906293 ?auto_906299 ) ) ( not ( = ?auto_906293 ?auto_906300 ) ) ( not ( = ?auto_906293 ?auto_906301 ) ) ( not ( = ?auto_906293 ?auto_906302 ) ) ( not ( = ?auto_906293 ?auto_906303 ) ) ( not ( = ?auto_906293 ?auto_906304 ) ) ( not ( = ?auto_906293 ?auto_906305 ) ) ( not ( = ?auto_906293 ?auto_906306 ) ) ( not ( = ?auto_906293 ?auto_906307 ) ) ( not ( = ?auto_906293 ?auto_906308 ) ) ( not ( = ?auto_906293 ?auto_906309 ) ) ( not ( = ?auto_906293 ?auto_906310 ) ) ( not ( = ?auto_906293 ?auto_906311 ) ) ( not ( = ?auto_906294 ?auto_906295 ) ) ( not ( = ?auto_906294 ?auto_906296 ) ) ( not ( = ?auto_906294 ?auto_906297 ) ) ( not ( = ?auto_906294 ?auto_906298 ) ) ( not ( = ?auto_906294 ?auto_906299 ) ) ( not ( = ?auto_906294 ?auto_906300 ) ) ( not ( = ?auto_906294 ?auto_906301 ) ) ( not ( = ?auto_906294 ?auto_906302 ) ) ( not ( = ?auto_906294 ?auto_906303 ) ) ( not ( = ?auto_906294 ?auto_906304 ) ) ( not ( = ?auto_906294 ?auto_906305 ) ) ( not ( = ?auto_906294 ?auto_906306 ) ) ( not ( = ?auto_906294 ?auto_906307 ) ) ( not ( = ?auto_906294 ?auto_906308 ) ) ( not ( = ?auto_906294 ?auto_906309 ) ) ( not ( = ?auto_906294 ?auto_906310 ) ) ( not ( = ?auto_906294 ?auto_906311 ) ) ( not ( = ?auto_906295 ?auto_906296 ) ) ( not ( = ?auto_906295 ?auto_906297 ) ) ( not ( = ?auto_906295 ?auto_906298 ) ) ( not ( = ?auto_906295 ?auto_906299 ) ) ( not ( = ?auto_906295 ?auto_906300 ) ) ( not ( = ?auto_906295 ?auto_906301 ) ) ( not ( = ?auto_906295 ?auto_906302 ) ) ( not ( = ?auto_906295 ?auto_906303 ) ) ( not ( = ?auto_906295 ?auto_906304 ) ) ( not ( = ?auto_906295 ?auto_906305 ) ) ( not ( = ?auto_906295 ?auto_906306 ) ) ( not ( = ?auto_906295 ?auto_906307 ) ) ( not ( = ?auto_906295 ?auto_906308 ) ) ( not ( = ?auto_906295 ?auto_906309 ) ) ( not ( = ?auto_906295 ?auto_906310 ) ) ( not ( = ?auto_906295 ?auto_906311 ) ) ( not ( = ?auto_906296 ?auto_906297 ) ) ( not ( = ?auto_906296 ?auto_906298 ) ) ( not ( = ?auto_906296 ?auto_906299 ) ) ( not ( = ?auto_906296 ?auto_906300 ) ) ( not ( = ?auto_906296 ?auto_906301 ) ) ( not ( = ?auto_906296 ?auto_906302 ) ) ( not ( = ?auto_906296 ?auto_906303 ) ) ( not ( = ?auto_906296 ?auto_906304 ) ) ( not ( = ?auto_906296 ?auto_906305 ) ) ( not ( = ?auto_906296 ?auto_906306 ) ) ( not ( = ?auto_906296 ?auto_906307 ) ) ( not ( = ?auto_906296 ?auto_906308 ) ) ( not ( = ?auto_906296 ?auto_906309 ) ) ( not ( = ?auto_906296 ?auto_906310 ) ) ( not ( = ?auto_906296 ?auto_906311 ) ) ( not ( = ?auto_906297 ?auto_906298 ) ) ( not ( = ?auto_906297 ?auto_906299 ) ) ( not ( = ?auto_906297 ?auto_906300 ) ) ( not ( = ?auto_906297 ?auto_906301 ) ) ( not ( = ?auto_906297 ?auto_906302 ) ) ( not ( = ?auto_906297 ?auto_906303 ) ) ( not ( = ?auto_906297 ?auto_906304 ) ) ( not ( = ?auto_906297 ?auto_906305 ) ) ( not ( = ?auto_906297 ?auto_906306 ) ) ( not ( = ?auto_906297 ?auto_906307 ) ) ( not ( = ?auto_906297 ?auto_906308 ) ) ( not ( = ?auto_906297 ?auto_906309 ) ) ( not ( = ?auto_906297 ?auto_906310 ) ) ( not ( = ?auto_906297 ?auto_906311 ) ) ( not ( = ?auto_906298 ?auto_906299 ) ) ( not ( = ?auto_906298 ?auto_906300 ) ) ( not ( = ?auto_906298 ?auto_906301 ) ) ( not ( = ?auto_906298 ?auto_906302 ) ) ( not ( = ?auto_906298 ?auto_906303 ) ) ( not ( = ?auto_906298 ?auto_906304 ) ) ( not ( = ?auto_906298 ?auto_906305 ) ) ( not ( = ?auto_906298 ?auto_906306 ) ) ( not ( = ?auto_906298 ?auto_906307 ) ) ( not ( = ?auto_906298 ?auto_906308 ) ) ( not ( = ?auto_906298 ?auto_906309 ) ) ( not ( = ?auto_906298 ?auto_906310 ) ) ( not ( = ?auto_906298 ?auto_906311 ) ) ( not ( = ?auto_906299 ?auto_906300 ) ) ( not ( = ?auto_906299 ?auto_906301 ) ) ( not ( = ?auto_906299 ?auto_906302 ) ) ( not ( = ?auto_906299 ?auto_906303 ) ) ( not ( = ?auto_906299 ?auto_906304 ) ) ( not ( = ?auto_906299 ?auto_906305 ) ) ( not ( = ?auto_906299 ?auto_906306 ) ) ( not ( = ?auto_906299 ?auto_906307 ) ) ( not ( = ?auto_906299 ?auto_906308 ) ) ( not ( = ?auto_906299 ?auto_906309 ) ) ( not ( = ?auto_906299 ?auto_906310 ) ) ( not ( = ?auto_906299 ?auto_906311 ) ) ( not ( = ?auto_906300 ?auto_906301 ) ) ( not ( = ?auto_906300 ?auto_906302 ) ) ( not ( = ?auto_906300 ?auto_906303 ) ) ( not ( = ?auto_906300 ?auto_906304 ) ) ( not ( = ?auto_906300 ?auto_906305 ) ) ( not ( = ?auto_906300 ?auto_906306 ) ) ( not ( = ?auto_906300 ?auto_906307 ) ) ( not ( = ?auto_906300 ?auto_906308 ) ) ( not ( = ?auto_906300 ?auto_906309 ) ) ( not ( = ?auto_906300 ?auto_906310 ) ) ( not ( = ?auto_906300 ?auto_906311 ) ) ( not ( = ?auto_906301 ?auto_906302 ) ) ( not ( = ?auto_906301 ?auto_906303 ) ) ( not ( = ?auto_906301 ?auto_906304 ) ) ( not ( = ?auto_906301 ?auto_906305 ) ) ( not ( = ?auto_906301 ?auto_906306 ) ) ( not ( = ?auto_906301 ?auto_906307 ) ) ( not ( = ?auto_906301 ?auto_906308 ) ) ( not ( = ?auto_906301 ?auto_906309 ) ) ( not ( = ?auto_906301 ?auto_906310 ) ) ( not ( = ?auto_906301 ?auto_906311 ) ) ( not ( = ?auto_906302 ?auto_906303 ) ) ( not ( = ?auto_906302 ?auto_906304 ) ) ( not ( = ?auto_906302 ?auto_906305 ) ) ( not ( = ?auto_906302 ?auto_906306 ) ) ( not ( = ?auto_906302 ?auto_906307 ) ) ( not ( = ?auto_906302 ?auto_906308 ) ) ( not ( = ?auto_906302 ?auto_906309 ) ) ( not ( = ?auto_906302 ?auto_906310 ) ) ( not ( = ?auto_906302 ?auto_906311 ) ) ( not ( = ?auto_906303 ?auto_906304 ) ) ( not ( = ?auto_906303 ?auto_906305 ) ) ( not ( = ?auto_906303 ?auto_906306 ) ) ( not ( = ?auto_906303 ?auto_906307 ) ) ( not ( = ?auto_906303 ?auto_906308 ) ) ( not ( = ?auto_906303 ?auto_906309 ) ) ( not ( = ?auto_906303 ?auto_906310 ) ) ( not ( = ?auto_906303 ?auto_906311 ) ) ( not ( = ?auto_906304 ?auto_906305 ) ) ( not ( = ?auto_906304 ?auto_906306 ) ) ( not ( = ?auto_906304 ?auto_906307 ) ) ( not ( = ?auto_906304 ?auto_906308 ) ) ( not ( = ?auto_906304 ?auto_906309 ) ) ( not ( = ?auto_906304 ?auto_906310 ) ) ( not ( = ?auto_906304 ?auto_906311 ) ) ( not ( = ?auto_906305 ?auto_906306 ) ) ( not ( = ?auto_906305 ?auto_906307 ) ) ( not ( = ?auto_906305 ?auto_906308 ) ) ( not ( = ?auto_906305 ?auto_906309 ) ) ( not ( = ?auto_906305 ?auto_906310 ) ) ( not ( = ?auto_906305 ?auto_906311 ) ) ( not ( = ?auto_906306 ?auto_906307 ) ) ( not ( = ?auto_906306 ?auto_906308 ) ) ( not ( = ?auto_906306 ?auto_906309 ) ) ( not ( = ?auto_906306 ?auto_906310 ) ) ( not ( = ?auto_906306 ?auto_906311 ) ) ( not ( = ?auto_906307 ?auto_906308 ) ) ( not ( = ?auto_906307 ?auto_906309 ) ) ( not ( = ?auto_906307 ?auto_906310 ) ) ( not ( = ?auto_906307 ?auto_906311 ) ) ( not ( = ?auto_906308 ?auto_906309 ) ) ( not ( = ?auto_906308 ?auto_906310 ) ) ( not ( = ?auto_906308 ?auto_906311 ) ) ( not ( = ?auto_906309 ?auto_906310 ) ) ( not ( = ?auto_906309 ?auto_906311 ) ) ( not ( = ?auto_906310 ?auto_906311 ) ) ( ON ?auto_906309 ?auto_906310 ) ( ON ?auto_906308 ?auto_906309 ) ( ON ?auto_906307 ?auto_906308 ) ( ON ?auto_906306 ?auto_906307 ) ( ON ?auto_906305 ?auto_906306 ) ( ON ?auto_906304 ?auto_906305 ) ( ON ?auto_906303 ?auto_906304 ) ( ON ?auto_906302 ?auto_906303 ) ( ON ?auto_906301 ?auto_906302 ) ( ON ?auto_906300 ?auto_906301 ) ( CLEAR ?auto_906298 ) ( ON ?auto_906299 ?auto_906300 ) ( CLEAR ?auto_906299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_906293 ?auto_906294 ?auto_906295 ?auto_906296 ?auto_906297 ?auto_906298 ?auto_906299 )
      ( MAKE-18PILE ?auto_906293 ?auto_906294 ?auto_906295 ?auto_906296 ?auto_906297 ?auto_906298 ?auto_906299 ?auto_906300 ?auto_906301 ?auto_906302 ?auto_906303 ?auto_906304 ?auto_906305 ?auto_906306 ?auto_906307 ?auto_906308 ?auto_906309 ?auto_906310 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906330 - BLOCK
      ?auto_906331 - BLOCK
      ?auto_906332 - BLOCK
      ?auto_906333 - BLOCK
      ?auto_906334 - BLOCK
      ?auto_906335 - BLOCK
      ?auto_906336 - BLOCK
      ?auto_906337 - BLOCK
      ?auto_906338 - BLOCK
      ?auto_906339 - BLOCK
      ?auto_906340 - BLOCK
      ?auto_906341 - BLOCK
      ?auto_906342 - BLOCK
      ?auto_906343 - BLOCK
      ?auto_906344 - BLOCK
      ?auto_906345 - BLOCK
      ?auto_906346 - BLOCK
      ?auto_906347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_906347 ) ( ON-TABLE ?auto_906330 ) ( ON ?auto_906331 ?auto_906330 ) ( ON ?auto_906332 ?auto_906331 ) ( ON ?auto_906333 ?auto_906332 ) ( ON ?auto_906334 ?auto_906333 ) ( ON ?auto_906335 ?auto_906334 ) ( not ( = ?auto_906330 ?auto_906331 ) ) ( not ( = ?auto_906330 ?auto_906332 ) ) ( not ( = ?auto_906330 ?auto_906333 ) ) ( not ( = ?auto_906330 ?auto_906334 ) ) ( not ( = ?auto_906330 ?auto_906335 ) ) ( not ( = ?auto_906330 ?auto_906336 ) ) ( not ( = ?auto_906330 ?auto_906337 ) ) ( not ( = ?auto_906330 ?auto_906338 ) ) ( not ( = ?auto_906330 ?auto_906339 ) ) ( not ( = ?auto_906330 ?auto_906340 ) ) ( not ( = ?auto_906330 ?auto_906341 ) ) ( not ( = ?auto_906330 ?auto_906342 ) ) ( not ( = ?auto_906330 ?auto_906343 ) ) ( not ( = ?auto_906330 ?auto_906344 ) ) ( not ( = ?auto_906330 ?auto_906345 ) ) ( not ( = ?auto_906330 ?auto_906346 ) ) ( not ( = ?auto_906330 ?auto_906347 ) ) ( not ( = ?auto_906331 ?auto_906332 ) ) ( not ( = ?auto_906331 ?auto_906333 ) ) ( not ( = ?auto_906331 ?auto_906334 ) ) ( not ( = ?auto_906331 ?auto_906335 ) ) ( not ( = ?auto_906331 ?auto_906336 ) ) ( not ( = ?auto_906331 ?auto_906337 ) ) ( not ( = ?auto_906331 ?auto_906338 ) ) ( not ( = ?auto_906331 ?auto_906339 ) ) ( not ( = ?auto_906331 ?auto_906340 ) ) ( not ( = ?auto_906331 ?auto_906341 ) ) ( not ( = ?auto_906331 ?auto_906342 ) ) ( not ( = ?auto_906331 ?auto_906343 ) ) ( not ( = ?auto_906331 ?auto_906344 ) ) ( not ( = ?auto_906331 ?auto_906345 ) ) ( not ( = ?auto_906331 ?auto_906346 ) ) ( not ( = ?auto_906331 ?auto_906347 ) ) ( not ( = ?auto_906332 ?auto_906333 ) ) ( not ( = ?auto_906332 ?auto_906334 ) ) ( not ( = ?auto_906332 ?auto_906335 ) ) ( not ( = ?auto_906332 ?auto_906336 ) ) ( not ( = ?auto_906332 ?auto_906337 ) ) ( not ( = ?auto_906332 ?auto_906338 ) ) ( not ( = ?auto_906332 ?auto_906339 ) ) ( not ( = ?auto_906332 ?auto_906340 ) ) ( not ( = ?auto_906332 ?auto_906341 ) ) ( not ( = ?auto_906332 ?auto_906342 ) ) ( not ( = ?auto_906332 ?auto_906343 ) ) ( not ( = ?auto_906332 ?auto_906344 ) ) ( not ( = ?auto_906332 ?auto_906345 ) ) ( not ( = ?auto_906332 ?auto_906346 ) ) ( not ( = ?auto_906332 ?auto_906347 ) ) ( not ( = ?auto_906333 ?auto_906334 ) ) ( not ( = ?auto_906333 ?auto_906335 ) ) ( not ( = ?auto_906333 ?auto_906336 ) ) ( not ( = ?auto_906333 ?auto_906337 ) ) ( not ( = ?auto_906333 ?auto_906338 ) ) ( not ( = ?auto_906333 ?auto_906339 ) ) ( not ( = ?auto_906333 ?auto_906340 ) ) ( not ( = ?auto_906333 ?auto_906341 ) ) ( not ( = ?auto_906333 ?auto_906342 ) ) ( not ( = ?auto_906333 ?auto_906343 ) ) ( not ( = ?auto_906333 ?auto_906344 ) ) ( not ( = ?auto_906333 ?auto_906345 ) ) ( not ( = ?auto_906333 ?auto_906346 ) ) ( not ( = ?auto_906333 ?auto_906347 ) ) ( not ( = ?auto_906334 ?auto_906335 ) ) ( not ( = ?auto_906334 ?auto_906336 ) ) ( not ( = ?auto_906334 ?auto_906337 ) ) ( not ( = ?auto_906334 ?auto_906338 ) ) ( not ( = ?auto_906334 ?auto_906339 ) ) ( not ( = ?auto_906334 ?auto_906340 ) ) ( not ( = ?auto_906334 ?auto_906341 ) ) ( not ( = ?auto_906334 ?auto_906342 ) ) ( not ( = ?auto_906334 ?auto_906343 ) ) ( not ( = ?auto_906334 ?auto_906344 ) ) ( not ( = ?auto_906334 ?auto_906345 ) ) ( not ( = ?auto_906334 ?auto_906346 ) ) ( not ( = ?auto_906334 ?auto_906347 ) ) ( not ( = ?auto_906335 ?auto_906336 ) ) ( not ( = ?auto_906335 ?auto_906337 ) ) ( not ( = ?auto_906335 ?auto_906338 ) ) ( not ( = ?auto_906335 ?auto_906339 ) ) ( not ( = ?auto_906335 ?auto_906340 ) ) ( not ( = ?auto_906335 ?auto_906341 ) ) ( not ( = ?auto_906335 ?auto_906342 ) ) ( not ( = ?auto_906335 ?auto_906343 ) ) ( not ( = ?auto_906335 ?auto_906344 ) ) ( not ( = ?auto_906335 ?auto_906345 ) ) ( not ( = ?auto_906335 ?auto_906346 ) ) ( not ( = ?auto_906335 ?auto_906347 ) ) ( not ( = ?auto_906336 ?auto_906337 ) ) ( not ( = ?auto_906336 ?auto_906338 ) ) ( not ( = ?auto_906336 ?auto_906339 ) ) ( not ( = ?auto_906336 ?auto_906340 ) ) ( not ( = ?auto_906336 ?auto_906341 ) ) ( not ( = ?auto_906336 ?auto_906342 ) ) ( not ( = ?auto_906336 ?auto_906343 ) ) ( not ( = ?auto_906336 ?auto_906344 ) ) ( not ( = ?auto_906336 ?auto_906345 ) ) ( not ( = ?auto_906336 ?auto_906346 ) ) ( not ( = ?auto_906336 ?auto_906347 ) ) ( not ( = ?auto_906337 ?auto_906338 ) ) ( not ( = ?auto_906337 ?auto_906339 ) ) ( not ( = ?auto_906337 ?auto_906340 ) ) ( not ( = ?auto_906337 ?auto_906341 ) ) ( not ( = ?auto_906337 ?auto_906342 ) ) ( not ( = ?auto_906337 ?auto_906343 ) ) ( not ( = ?auto_906337 ?auto_906344 ) ) ( not ( = ?auto_906337 ?auto_906345 ) ) ( not ( = ?auto_906337 ?auto_906346 ) ) ( not ( = ?auto_906337 ?auto_906347 ) ) ( not ( = ?auto_906338 ?auto_906339 ) ) ( not ( = ?auto_906338 ?auto_906340 ) ) ( not ( = ?auto_906338 ?auto_906341 ) ) ( not ( = ?auto_906338 ?auto_906342 ) ) ( not ( = ?auto_906338 ?auto_906343 ) ) ( not ( = ?auto_906338 ?auto_906344 ) ) ( not ( = ?auto_906338 ?auto_906345 ) ) ( not ( = ?auto_906338 ?auto_906346 ) ) ( not ( = ?auto_906338 ?auto_906347 ) ) ( not ( = ?auto_906339 ?auto_906340 ) ) ( not ( = ?auto_906339 ?auto_906341 ) ) ( not ( = ?auto_906339 ?auto_906342 ) ) ( not ( = ?auto_906339 ?auto_906343 ) ) ( not ( = ?auto_906339 ?auto_906344 ) ) ( not ( = ?auto_906339 ?auto_906345 ) ) ( not ( = ?auto_906339 ?auto_906346 ) ) ( not ( = ?auto_906339 ?auto_906347 ) ) ( not ( = ?auto_906340 ?auto_906341 ) ) ( not ( = ?auto_906340 ?auto_906342 ) ) ( not ( = ?auto_906340 ?auto_906343 ) ) ( not ( = ?auto_906340 ?auto_906344 ) ) ( not ( = ?auto_906340 ?auto_906345 ) ) ( not ( = ?auto_906340 ?auto_906346 ) ) ( not ( = ?auto_906340 ?auto_906347 ) ) ( not ( = ?auto_906341 ?auto_906342 ) ) ( not ( = ?auto_906341 ?auto_906343 ) ) ( not ( = ?auto_906341 ?auto_906344 ) ) ( not ( = ?auto_906341 ?auto_906345 ) ) ( not ( = ?auto_906341 ?auto_906346 ) ) ( not ( = ?auto_906341 ?auto_906347 ) ) ( not ( = ?auto_906342 ?auto_906343 ) ) ( not ( = ?auto_906342 ?auto_906344 ) ) ( not ( = ?auto_906342 ?auto_906345 ) ) ( not ( = ?auto_906342 ?auto_906346 ) ) ( not ( = ?auto_906342 ?auto_906347 ) ) ( not ( = ?auto_906343 ?auto_906344 ) ) ( not ( = ?auto_906343 ?auto_906345 ) ) ( not ( = ?auto_906343 ?auto_906346 ) ) ( not ( = ?auto_906343 ?auto_906347 ) ) ( not ( = ?auto_906344 ?auto_906345 ) ) ( not ( = ?auto_906344 ?auto_906346 ) ) ( not ( = ?auto_906344 ?auto_906347 ) ) ( not ( = ?auto_906345 ?auto_906346 ) ) ( not ( = ?auto_906345 ?auto_906347 ) ) ( not ( = ?auto_906346 ?auto_906347 ) ) ( ON ?auto_906346 ?auto_906347 ) ( ON ?auto_906345 ?auto_906346 ) ( ON ?auto_906344 ?auto_906345 ) ( ON ?auto_906343 ?auto_906344 ) ( ON ?auto_906342 ?auto_906343 ) ( ON ?auto_906341 ?auto_906342 ) ( ON ?auto_906340 ?auto_906341 ) ( ON ?auto_906339 ?auto_906340 ) ( ON ?auto_906338 ?auto_906339 ) ( ON ?auto_906337 ?auto_906338 ) ( CLEAR ?auto_906335 ) ( ON ?auto_906336 ?auto_906337 ) ( CLEAR ?auto_906336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_906330 ?auto_906331 ?auto_906332 ?auto_906333 ?auto_906334 ?auto_906335 ?auto_906336 )
      ( MAKE-18PILE ?auto_906330 ?auto_906331 ?auto_906332 ?auto_906333 ?auto_906334 ?auto_906335 ?auto_906336 ?auto_906337 ?auto_906338 ?auto_906339 ?auto_906340 ?auto_906341 ?auto_906342 ?auto_906343 ?auto_906344 ?auto_906345 ?auto_906346 ?auto_906347 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906366 - BLOCK
      ?auto_906367 - BLOCK
      ?auto_906368 - BLOCK
      ?auto_906369 - BLOCK
      ?auto_906370 - BLOCK
      ?auto_906371 - BLOCK
      ?auto_906372 - BLOCK
      ?auto_906373 - BLOCK
      ?auto_906374 - BLOCK
      ?auto_906375 - BLOCK
      ?auto_906376 - BLOCK
      ?auto_906377 - BLOCK
      ?auto_906378 - BLOCK
      ?auto_906379 - BLOCK
      ?auto_906380 - BLOCK
      ?auto_906381 - BLOCK
      ?auto_906382 - BLOCK
      ?auto_906383 - BLOCK
    )
    :vars
    (
      ?auto_906384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906383 ?auto_906384 ) ( ON-TABLE ?auto_906366 ) ( ON ?auto_906367 ?auto_906366 ) ( ON ?auto_906368 ?auto_906367 ) ( ON ?auto_906369 ?auto_906368 ) ( ON ?auto_906370 ?auto_906369 ) ( not ( = ?auto_906366 ?auto_906367 ) ) ( not ( = ?auto_906366 ?auto_906368 ) ) ( not ( = ?auto_906366 ?auto_906369 ) ) ( not ( = ?auto_906366 ?auto_906370 ) ) ( not ( = ?auto_906366 ?auto_906371 ) ) ( not ( = ?auto_906366 ?auto_906372 ) ) ( not ( = ?auto_906366 ?auto_906373 ) ) ( not ( = ?auto_906366 ?auto_906374 ) ) ( not ( = ?auto_906366 ?auto_906375 ) ) ( not ( = ?auto_906366 ?auto_906376 ) ) ( not ( = ?auto_906366 ?auto_906377 ) ) ( not ( = ?auto_906366 ?auto_906378 ) ) ( not ( = ?auto_906366 ?auto_906379 ) ) ( not ( = ?auto_906366 ?auto_906380 ) ) ( not ( = ?auto_906366 ?auto_906381 ) ) ( not ( = ?auto_906366 ?auto_906382 ) ) ( not ( = ?auto_906366 ?auto_906383 ) ) ( not ( = ?auto_906366 ?auto_906384 ) ) ( not ( = ?auto_906367 ?auto_906368 ) ) ( not ( = ?auto_906367 ?auto_906369 ) ) ( not ( = ?auto_906367 ?auto_906370 ) ) ( not ( = ?auto_906367 ?auto_906371 ) ) ( not ( = ?auto_906367 ?auto_906372 ) ) ( not ( = ?auto_906367 ?auto_906373 ) ) ( not ( = ?auto_906367 ?auto_906374 ) ) ( not ( = ?auto_906367 ?auto_906375 ) ) ( not ( = ?auto_906367 ?auto_906376 ) ) ( not ( = ?auto_906367 ?auto_906377 ) ) ( not ( = ?auto_906367 ?auto_906378 ) ) ( not ( = ?auto_906367 ?auto_906379 ) ) ( not ( = ?auto_906367 ?auto_906380 ) ) ( not ( = ?auto_906367 ?auto_906381 ) ) ( not ( = ?auto_906367 ?auto_906382 ) ) ( not ( = ?auto_906367 ?auto_906383 ) ) ( not ( = ?auto_906367 ?auto_906384 ) ) ( not ( = ?auto_906368 ?auto_906369 ) ) ( not ( = ?auto_906368 ?auto_906370 ) ) ( not ( = ?auto_906368 ?auto_906371 ) ) ( not ( = ?auto_906368 ?auto_906372 ) ) ( not ( = ?auto_906368 ?auto_906373 ) ) ( not ( = ?auto_906368 ?auto_906374 ) ) ( not ( = ?auto_906368 ?auto_906375 ) ) ( not ( = ?auto_906368 ?auto_906376 ) ) ( not ( = ?auto_906368 ?auto_906377 ) ) ( not ( = ?auto_906368 ?auto_906378 ) ) ( not ( = ?auto_906368 ?auto_906379 ) ) ( not ( = ?auto_906368 ?auto_906380 ) ) ( not ( = ?auto_906368 ?auto_906381 ) ) ( not ( = ?auto_906368 ?auto_906382 ) ) ( not ( = ?auto_906368 ?auto_906383 ) ) ( not ( = ?auto_906368 ?auto_906384 ) ) ( not ( = ?auto_906369 ?auto_906370 ) ) ( not ( = ?auto_906369 ?auto_906371 ) ) ( not ( = ?auto_906369 ?auto_906372 ) ) ( not ( = ?auto_906369 ?auto_906373 ) ) ( not ( = ?auto_906369 ?auto_906374 ) ) ( not ( = ?auto_906369 ?auto_906375 ) ) ( not ( = ?auto_906369 ?auto_906376 ) ) ( not ( = ?auto_906369 ?auto_906377 ) ) ( not ( = ?auto_906369 ?auto_906378 ) ) ( not ( = ?auto_906369 ?auto_906379 ) ) ( not ( = ?auto_906369 ?auto_906380 ) ) ( not ( = ?auto_906369 ?auto_906381 ) ) ( not ( = ?auto_906369 ?auto_906382 ) ) ( not ( = ?auto_906369 ?auto_906383 ) ) ( not ( = ?auto_906369 ?auto_906384 ) ) ( not ( = ?auto_906370 ?auto_906371 ) ) ( not ( = ?auto_906370 ?auto_906372 ) ) ( not ( = ?auto_906370 ?auto_906373 ) ) ( not ( = ?auto_906370 ?auto_906374 ) ) ( not ( = ?auto_906370 ?auto_906375 ) ) ( not ( = ?auto_906370 ?auto_906376 ) ) ( not ( = ?auto_906370 ?auto_906377 ) ) ( not ( = ?auto_906370 ?auto_906378 ) ) ( not ( = ?auto_906370 ?auto_906379 ) ) ( not ( = ?auto_906370 ?auto_906380 ) ) ( not ( = ?auto_906370 ?auto_906381 ) ) ( not ( = ?auto_906370 ?auto_906382 ) ) ( not ( = ?auto_906370 ?auto_906383 ) ) ( not ( = ?auto_906370 ?auto_906384 ) ) ( not ( = ?auto_906371 ?auto_906372 ) ) ( not ( = ?auto_906371 ?auto_906373 ) ) ( not ( = ?auto_906371 ?auto_906374 ) ) ( not ( = ?auto_906371 ?auto_906375 ) ) ( not ( = ?auto_906371 ?auto_906376 ) ) ( not ( = ?auto_906371 ?auto_906377 ) ) ( not ( = ?auto_906371 ?auto_906378 ) ) ( not ( = ?auto_906371 ?auto_906379 ) ) ( not ( = ?auto_906371 ?auto_906380 ) ) ( not ( = ?auto_906371 ?auto_906381 ) ) ( not ( = ?auto_906371 ?auto_906382 ) ) ( not ( = ?auto_906371 ?auto_906383 ) ) ( not ( = ?auto_906371 ?auto_906384 ) ) ( not ( = ?auto_906372 ?auto_906373 ) ) ( not ( = ?auto_906372 ?auto_906374 ) ) ( not ( = ?auto_906372 ?auto_906375 ) ) ( not ( = ?auto_906372 ?auto_906376 ) ) ( not ( = ?auto_906372 ?auto_906377 ) ) ( not ( = ?auto_906372 ?auto_906378 ) ) ( not ( = ?auto_906372 ?auto_906379 ) ) ( not ( = ?auto_906372 ?auto_906380 ) ) ( not ( = ?auto_906372 ?auto_906381 ) ) ( not ( = ?auto_906372 ?auto_906382 ) ) ( not ( = ?auto_906372 ?auto_906383 ) ) ( not ( = ?auto_906372 ?auto_906384 ) ) ( not ( = ?auto_906373 ?auto_906374 ) ) ( not ( = ?auto_906373 ?auto_906375 ) ) ( not ( = ?auto_906373 ?auto_906376 ) ) ( not ( = ?auto_906373 ?auto_906377 ) ) ( not ( = ?auto_906373 ?auto_906378 ) ) ( not ( = ?auto_906373 ?auto_906379 ) ) ( not ( = ?auto_906373 ?auto_906380 ) ) ( not ( = ?auto_906373 ?auto_906381 ) ) ( not ( = ?auto_906373 ?auto_906382 ) ) ( not ( = ?auto_906373 ?auto_906383 ) ) ( not ( = ?auto_906373 ?auto_906384 ) ) ( not ( = ?auto_906374 ?auto_906375 ) ) ( not ( = ?auto_906374 ?auto_906376 ) ) ( not ( = ?auto_906374 ?auto_906377 ) ) ( not ( = ?auto_906374 ?auto_906378 ) ) ( not ( = ?auto_906374 ?auto_906379 ) ) ( not ( = ?auto_906374 ?auto_906380 ) ) ( not ( = ?auto_906374 ?auto_906381 ) ) ( not ( = ?auto_906374 ?auto_906382 ) ) ( not ( = ?auto_906374 ?auto_906383 ) ) ( not ( = ?auto_906374 ?auto_906384 ) ) ( not ( = ?auto_906375 ?auto_906376 ) ) ( not ( = ?auto_906375 ?auto_906377 ) ) ( not ( = ?auto_906375 ?auto_906378 ) ) ( not ( = ?auto_906375 ?auto_906379 ) ) ( not ( = ?auto_906375 ?auto_906380 ) ) ( not ( = ?auto_906375 ?auto_906381 ) ) ( not ( = ?auto_906375 ?auto_906382 ) ) ( not ( = ?auto_906375 ?auto_906383 ) ) ( not ( = ?auto_906375 ?auto_906384 ) ) ( not ( = ?auto_906376 ?auto_906377 ) ) ( not ( = ?auto_906376 ?auto_906378 ) ) ( not ( = ?auto_906376 ?auto_906379 ) ) ( not ( = ?auto_906376 ?auto_906380 ) ) ( not ( = ?auto_906376 ?auto_906381 ) ) ( not ( = ?auto_906376 ?auto_906382 ) ) ( not ( = ?auto_906376 ?auto_906383 ) ) ( not ( = ?auto_906376 ?auto_906384 ) ) ( not ( = ?auto_906377 ?auto_906378 ) ) ( not ( = ?auto_906377 ?auto_906379 ) ) ( not ( = ?auto_906377 ?auto_906380 ) ) ( not ( = ?auto_906377 ?auto_906381 ) ) ( not ( = ?auto_906377 ?auto_906382 ) ) ( not ( = ?auto_906377 ?auto_906383 ) ) ( not ( = ?auto_906377 ?auto_906384 ) ) ( not ( = ?auto_906378 ?auto_906379 ) ) ( not ( = ?auto_906378 ?auto_906380 ) ) ( not ( = ?auto_906378 ?auto_906381 ) ) ( not ( = ?auto_906378 ?auto_906382 ) ) ( not ( = ?auto_906378 ?auto_906383 ) ) ( not ( = ?auto_906378 ?auto_906384 ) ) ( not ( = ?auto_906379 ?auto_906380 ) ) ( not ( = ?auto_906379 ?auto_906381 ) ) ( not ( = ?auto_906379 ?auto_906382 ) ) ( not ( = ?auto_906379 ?auto_906383 ) ) ( not ( = ?auto_906379 ?auto_906384 ) ) ( not ( = ?auto_906380 ?auto_906381 ) ) ( not ( = ?auto_906380 ?auto_906382 ) ) ( not ( = ?auto_906380 ?auto_906383 ) ) ( not ( = ?auto_906380 ?auto_906384 ) ) ( not ( = ?auto_906381 ?auto_906382 ) ) ( not ( = ?auto_906381 ?auto_906383 ) ) ( not ( = ?auto_906381 ?auto_906384 ) ) ( not ( = ?auto_906382 ?auto_906383 ) ) ( not ( = ?auto_906382 ?auto_906384 ) ) ( not ( = ?auto_906383 ?auto_906384 ) ) ( ON ?auto_906382 ?auto_906383 ) ( ON ?auto_906381 ?auto_906382 ) ( ON ?auto_906380 ?auto_906381 ) ( ON ?auto_906379 ?auto_906380 ) ( ON ?auto_906378 ?auto_906379 ) ( ON ?auto_906377 ?auto_906378 ) ( ON ?auto_906376 ?auto_906377 ) ( ON ?auto_906375 ?auto_906376 ) ( ON ?auto_906374 ?auto_906375 ) ( ON ?auto_906373 ?auto_906374 ) ( ON ?auto_906372 ?auto_906373 ) ( CLEAR ?auto_906370 ) ( ON ?auto_906371 ?auto_906372 ) ( CLEAR ?auto_906371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_906366 ?auto_906367 ?auto_906368 ?auto_906369 ?auto_906370 ?auto_906371 )
      ( MAKE-18PILE ?auto_906366 ?auto_906367 ?auto_906368 ?auto_906369 ?auto_906370 ?auto_906371 ?auto_906372 ?auto_906373 ?auto_906374 ?auto_906375 ?auto_906376 ?auto_906377 ?auto_906378 ?auto_906379 ?auto_906380 ?auto_906381 ?auto_906382 ?auto_906383 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906403 - BLOCK
      ?auto_906404 - BLOCK
      ?auto_906405 - BLOCK
      ?auto_906406 - BLOCK
      ?auto_906407 - BLOCK
      ?auto_906408 - BLOCK
      ?auto_906409 - BLOCK
      ?auto_906410 - BLOCK
      ?auto_906411 - BLOCK
      ?auto_906412 - BLOCK
      ?auto_906413 - BLOCK
      ?auto_906414 - BLOCK
      ?auto_906415 - BLOCK
      ?auto_906416 - BLOCK
      ?auto_906417 - BLOCK
      ?auto_906418 - BLOCK
      ?auto_906419 - BLOCK
      ?auto_906420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_906420 ) ( ON-TABLE ?auto_906403 ) ( ON ?auto_906404 ?auto_906403 ) ( ON ?auto_906405 ?auto_906404 ) ( ON ?auto_906406 ?auto_906405 ) ( ON ?auto_906407 ?auto_906406 ) ( not ( = ?auto_906403 ?auto_906404 ) ) ( not ( = ?auto_906403 ?auto_906405 ) ) ( not ( = ?auto_906403 ?auto_906406 ) ) ( not ( = ?auto_906403 ?auto_906407 ) ) ( not ( = ?auto_906403 ?auto_906408 ) ) ( not ( = ?auto_906403 ?auto_906409 ) ) ( not ( = ?auto_906403 ?auto_906410 ) ) ( not ( = ?auto_906403 ?auto_906411 ) ) ( not ( = ?auto_906403 ?auto_906412 ) ) ( not ( = ?auto_906403 ?auto_906413 ) ) ( not ( = ?auto_906403 ?auto_906414 ) ) ( not ( = ?auto_906403 ?auto_906415 ) ) ( not ( = ?auto_906403 ?auto_906416 ) ) ( not ( = ?auto_906403 ?auto_906417 ) ) ( not ( = ?auto_906403 ?auto_906418 ) ) ( not ( = ?auto_906403 ?auto_906419 ) ) ( not ( = ?auto_906403 ?auto_906420 ) ) ( not ( = ?auto_906404 ?auto_906405 ) ) ( not ( = ?auto_906404 ?auto_906406 ) ) ( not ( = ?auto_906404 ?auto_906407 ) ) ( not ( = ?auto_906404 ?auto_906408 ) ) ( not ( = ?auto_906404 ?auto_906409 ) ) ( not ( = ?auto_906404 ?auto_906410 ) ) ( not ( = ?auto_906404 ?auto_906411 ) ) ( not ( = ?auto_906404 ?auto_906412 ) ) ( not ( = ?auto_906404 ?auto_906413 ) ) ( not ( = ?auto_906404 ?auto_906414 ) ) ( not ( = ?auto_906404 ?auto_906415 ) ) ( not ( = ?auto_906404 ?auto_906416 ) ) ( not ( = ?auto_906404 ?auto_906417 ) ) ( not ( = ?auto_906404 ?auto_906418 ) ) ( not ( = ?auto_906404 ?auto_906419 ) ) ( not ( = ?auto_906404 ?auto_906420 ) ) ( not ( = ?auto_906405 ?auto_906406 ) ) ( not ( = ?auto_906405 ?auto_906407 ) ) ( not ( = ?auto_906405 ?auto_906408 ) ) ( not ( = ?auto_906405 ?auto_906409 ) ) ( not ( = ?auto_906405 ?auto_906410 ) ) ( not ( = ?auto_906405 ?auto_906411 ) ) ( not ( = ?auto_906405 ?auto_906412 ) ) ( not ( = ?auto_906405 ?auto_906413 ) ) ( not ( = ?auto_906405 ?auto_906414 ) ) ( not ( = ?auto_906405 ?auto_906415 ) ) ( not ( = ?auto_906405 ?auto_906416 ) ) ( not ( = ?auto_906405 ?auto_906417 ) ) ( not ( = ?auto_906405 ?auto_906418 ) ) ( not ( = ?auto_906405 ?auto_906419 ) ) ( not ( = ?auto_906405 ?auto_906420 ) ) ( not ( = ?auto_906406 ?auto_906407 ) ) ( not ( = ?auto_906406 ?auto_906408 ) ) ( not ( = ?auto_906406 ?auto_906409 ) ) ( not ( = ?auto_906406 ?auto_906410 ) ) ( not ( = ?auto_906406 ?auto_906411 ) ) ( not ( = ?auto_906406 ?auto_906412 ) ) ( not ( = ?auto_906406 ?auto_906413 ) ) ( not ( = ?auto_906406 ?auto_906414 ) ) ( not ( = ?auto_906406 ?auto_906415 ) ) ( not ( = ?auto_906406 ?auto_906416 ) ) ( not ( = ?auto_906406 ?auto_906417 ) ) ( not ( = ?auto_906406 ?auto_906418 ) ) ( not ( = ?auto_906406 ?auto_906419 ) ) ( not ( = ?auto_906406 ?auto_906420 ) ) ( not ( = ?auto_906407 ?auto_906408 ) ) ( not ( = ?auto_906407 ?auto_906409 ) ) ( not ( = ?auto_906407 ?auto_906410 ) ) ( not ( = ?auto_906407 ?auto_906411 ) ) ( not ( = ?auto_906407 ?auto_906412 ) ) ( not ( = ?auto_906407 ?auto_906413 ) ) ( not ( = ?auto_906407 ?auto_906414 ) ) ( not ( = ?auto_906407 ?auto_906415 ) ) ( not ( = ?auto_906407 ?auto_906416 ) ) ( not ( = ?auto_906407 ?auto_906417 ) ) ( not ( = ?auto_906407 ?auto_906418 ) ) ( not ( = ?auto_906407 ?auto_906419 ) ) ( not ( = ?auto_906407 ?auto_906420 ) ) ( not ( = ?auto_906408 ?auto_906409 ) ) ( not ( = ?auto_906408 ?auto_906410 ) ) ( not ( = ?auto_906408 ?auto_906411 ) ) ( not ( = ?auto_906408 ?auto_906412 ) ) ( not ( = ?auto_906408 ?auto_906413 ) ) ( not ( = ?auto_906408 ?auto_906414 ) ) ( not ( = ?auto_906408 ?auto_906415 ) ) ( not ( = ?auto_906408 ?auto_906416 ) ) ( not ( = ?auto_906408 ?auto_906417 ) ) ( not ( = ?auto_906408 ?auto_906418 ) ) ( not ( = ?auto_906408 ?auto_906419 ) ) ( not ( = ?auto_906408 ?auto_906420 ) ) ( not ( = ?auto_906409 ?auto_906410 ) ) ( not ( = ?auto_906409 ?auto_906411 ) ) ( not ( = ?auto_906409 ?auto_906412 ) ) ( not ( = ?auto_906409 ?auto_906413 ) ) ( not ( = ?auto_906409 ?auto_906414 ) ) ( not ( = ?auto_906409 ?auto_906415 ) ) ( not ( = ?auto_906409 ?auto_906416 ) ) ( not ( = ?auto_906409 ?auto_906417 ) ) ( not ( = ?auto_906409 ?auto_906418 ) ) ( not ( = ?auto_906409 ?auto_906419 ) ) ( not ( = ?auto_906409 ?auto_906420 ) ) ( not ( = ?auto_906410 ?auto_906411 ) ) ( not ( = ?auto_906410 ?auto_906412 ) ) ( not ( = ?auto_906410 ?auto_906413 ) ) ( not ( = ?auto_906410 ?auto_906414 ) ) ( not ( = ?auto_906410 ?auto_906415 ) ) ( not ( = ?auto_906410 ?auto_906416 ) ) ( not ( = ?auto_906410 ?auto_906417 ) ) ( not ( = ?auto_906410 ?auto_906418 ) ) ( not ( = ?auto_906410 ?auto_906419 ) ) ( not ( = ?auto_906410 ?auto_906420 ) ) ( not ( = ?auto_906411 ?auto_906412 ) ) ( not ( = ?auto_906411 ?auto_906413 ) ) ( not ( = ?auto_906411 ?auto_906414 ) ) ( not ( = ?auto_906411 ?auto_906415 ) ) ( not ( = ?auto_906411 ?auto_906416 ) ) ( not ( = ?auto_906411 ?auto_906417 ) ) ( not ( = ?auto_906411 ?auto_906418 ) ) ( not ( = ?auto_906411 ?auto_906419 ) ) ( not ( = ?auto_906411 ?auto_906420 ) ) ( not ( = ?auto_906412 ?auto_906413 ) ) ( not ( = ?auto_906412 ?auto_906414 ) ) ( not ( = ?auto_906412 ?auto_906415 ) ) ( not ( = ?auto_906412 ?auto_906416 ) ) ( not ( = ?auto_906412 ?auto_906417 ) ) ( not ( = ?auto_906412 ?auto_906418 ) ) ( not ( = ?auto_906412 ?auto_906419 ) ) ( not ( = ?auto_906412 ?auto_906420 ) ) ( not ( = ?auto_906413 ?auto_906414 ) ) ( not ( = ?auto_906413 ?auto_906415 ) ) ( not ( = ?auto_906413 ?auto_906416 ) ) ( not ( = ?auto_906413 ?auto_906417 ) ) ( not ( = ?auto_906413 ?auto_906418 ) ) ( not ( = ?auto_906413 ?auto_906419 ) ) ( not ( = ?auto_906413 ?auto_906420 ) ) ( not ( = ?auto_906414 ?auto_906415 ) ) ( not ( = ?auto_906414 ?auto_906416 ) ) ( not ( = ?auto_906414 ?auto_906417 ) ) ( not ( = ?auto_906414 ?auto_906418 ) ) ( not ( = ?auto_906414 ?auto_906419 ) ) ( not ( = ?auto_906414 ?auto_906420 ) ) ( not ( = ?auto_906415 ?auto_906416 ) ) ( not ( = ?auto_906415 ?auto_906417 ) ) ( not ( = ?auto_906415 ?auto_906418 ) ) ( not ( = ?auto_906415 ?auto_906419 ) ) ( not ( = ?auto_906415 ?auto_906420 ) ) ( not ( = ?auto_906416 ?auto_906417 ) ) ( not ( = ?auto_906416 ?auto_906418 ) ) ( not ( = ?auto_906416 ?auto_906419 ) ) ( not ( = ?auto_906416 ?auto_906420 ) ) ( not ( = ?auto_906417 ?auto_906418 ) ) ( not ( = ?auto_906417 ?auto_906419 ) ) ( not ( = ?auto_906417 ?auto_906420 ) ) ( not ( = ?auto_906418 ?auto_906419 ) ) ( not ( = ?auto_906418 ?auto_906420 ) ) ( not ( = ?auto_906419 ?auto_906420 ) ) ( ON ?auto_906419 ?auto_906420 ) ( ON ?auto_906418 ?auto_906419 ) ( ON ?auto_906417 ?auto_906418 ) ( ON ?auto_906416 ?auto_906417 ) ( ON ?auto_906415 ?auto_906416 ) ( ON ?auto_906414 ?auto_906415 ) ( ON ?auto_906413 ?auto_906414 ) ( ON ?auto_906412 ?auto_906413 ) ( ON ?auto_906411 ?auto_906412 ) ( ON ?auto_906410 ?auto_906411 ) ( ON ?auto_906409 ?auto_906410 ) ( CLEAR ?auto_906407 ) ( ON ?auto_906408 ?auto_906409 ) ( CLEAR ?auto_906408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_906403 ?auto_906404 ?auto_906405 ?auto_906406 ?auto_906407 ?auto_906408 )
      ( MAKE-18PILE ?auto_906403 ?auto_906404 ?auto_906405 ?auto_906406 ?auto_906407 ?auto_906408 ?auto_906409 ?auto_906410 ?auto_906411 ?auto_906412 ?auto_906413 ?auto_906414 ?auto_906415 ?auto_906416 ?auto_906417 ?auto_906418 ?auto_906419 ?auto_906420 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906439 - BLOCK
      ?auto_906440 - BLOCK
      ?auto_906441 - BLOCK
      ?auto_906442 - BLOCK
      ?auto_906443 - BLOCK
      ?auto_906444 - BLOCK
      ?auto_906445 - BLOCK
      ?auto_906446 - BLOCK
      ?auto_906447 - BLOCK
      ?auto_906448 - BLOCK
      ?auto_906449 - BLOCK
      ?auto_906450 - BLOCK
      ?auto_906451 - BLOCK
      ?auto_906452 - BLOCK
      ?auto_906453 - BLOCK
      ?auto_906454 - BLOCK
      ?auto_906455 - BLOCK
      ?auto_906456 - BLOCK
    )
    :vars
    (
      ?auto_906457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906456 ?auto_906457 ) ( ON-TABLE ?auto_906439 ) ( ON ?auto_906440 ?auto_906439 ) ( ON ?auto_906441 ?auto_906440 ) ( ON ?auto_906442 ?auto_906441 ) ( not ( = ?auto_906439 ?auto_906440 ) ) ( not ( = ?auto_906439 ?auto_906441 ) ) ( not ( = ?auto_906439 ?auto_906442 ) ) ( not ( = ?auto_906439 ?auto_906443 ) ) ( not ( = ?auto_906439 ?auto_906444 ) ) ( not ( = ?auto_906439 ?auto_906445 ) ) ( not ( = ?auto_906439 ?auto_906446 ) ) ( not ( = ?auto_906439 ?auto_906447 ) ) ( not ( = ?auto_906439 ?auto_906448 ) ) ( not ( = ?auto_906439 ?auto_906449 ) ) ( not ( = ?auto_906439 ?auto_906450 ) ) ( not ( = ?auto_906439 ?auto_906451 ) ) ( not ( = ?auto_906439 ?auto_906452 ) ) ( not ( = ?auto_906439 ?auto_906453 ) ) ( not ( = ?auto_906439 ?auto_906454 ) ) ( not ( = ?auto_906439 ?auto_906455 ) ) ( not ( = ?auto_906439 ?auto_906456 ) ) ( not ( = ?auto_906439 ?auto_906457 ) ) ( not ( = ?auto_906440 ?auto_906441 ) ) ( not ( = ?auto_906440 ?auto_906442 ) ) ( not ( = ?auto_906440 ?auto_906443 ) ) ( not ( = ?auto_906440 ?auto_906444 ) ) ( not ( = ?auto_906440 ?auto_906445 ) ) ( not ( = ?auto_906440 ?auto_906446 ) ) ( not ( = ?auto_906440 ?auto_906447 ) ) ( not ( = ?auto_906440 ?auto_906448 ) ) ( not ( = ?auto_906440 ?auto_906449 ) ) ( not ( = ?auto_906440 ?auto_906450 ) ) ( not ( = ?auto_906440 ?auto_906451 ) ) ( not ( = ?auto_906440 ?auto_906452 ) ) ( not ( = ?auto_906440 ?auto_906453 ) ) ( not ( = ?auto_906440 ?auto_906454 ) ) ( not ( = ?auto_906440 ?auto_906455 ) ) ( not ( = ?auto_906440 ?auto_906456 ) ) ( not ( = ?auto_906440 ?auto_906457 ) ) ( not ( = ?auto_906441 ?auto_906442 ) ) ( not ( = ?auto_906441 ?auto_906443 ) ) ( not ( = ?auto_906441 ?auto_906444 ) ) ( not ( = ?auto_906441 ?auto_906445 ) ) ( not ( = ?auto_906441 ?auto_906446 ) ) ( not ( = ?auto_906441 ?auto_906447 ) ) ( not ( = ?auto_906441 ?auto_906448 ) ) ( not ( = ?auto_906441 ?auto_906449 ) ) ( not ( = ?auto_906441 ?auto_906450 ) ) ( not ( = ?auto_906441 ?auto_906451 ) ) ( not ( = ?auto_906441 ?auto_906452 ) ) ( not ( = ?auto_906441 ?auto_906453 ) ) ( not ( = ?auto_906441 ?auto_906454 ) ) ( not ( = ?auto_906441 ?auto_906455 ) ) ( not ( = ?auto_906441 ?auto_906456 ) ) ( not ( = ?auto_906441 ?auto_906457 ) ) ( not ( = ?auto_906442 ?auto_906443 ) ) ( not ( = ?auto_906442 ?auto_906444 ) ) ( not ( = ?auto_906442 ?auto_906445 ) ) ( not ( = ?auto_906442 ?auto_906446 ) ) ( not ( = ?auto_906442 ?auto_906447 ) ) ( not ( = ?auto_906442 ?auto_906448 ) ) ( not ( = ?auto_906442 ?auto_906449 ) ) ( not ( = ?auto_906442 ?auto_906450 ) ) ( not ( = ?auto_906442 ?auto_906451 ) ) ( not ( = ?auto_906442 ?auto_906452 ) ) ( not ( = ?auto_906442 ?auto_906453 ) ) ( not ( = ?auto_906442 ?auto_906454 ) ) ( not ( = ?auto_906442 ?auto_906455 ) ) ( not ( = ?auto_906442 ?auto_906456 ) ) ( not ( = ?auto_906442 ?auto_906457 ) ) ( not ( = ?auto_906443 ?auto_906444 ) ) ( not ( = ?auto_906443 ?auto_906445 ) ) ( not ( = ?auto_906443 ?auto_906446 ) ) ( not ( = ?auto_906443 ?auto_906447 ) ) ( not ( = ?auto_906443 ?auto_906448 ) ) ( not ( = ?auto_906443 ?auto_906449 ) ) ( not ( = ?auto_906443 ?auto_906450 ) ) ( not ( = ?auto_906443 ?auto_906451 ) ) ( not ( = ?auto_906443 ?auto_906452 ) ) ( not ( = ?auto_906443 ?auto_906453 ) ) ( not ( = ?auto_906443 ?auto_906454 ) ) ( not ( = ?auto_906443 ?auto_906455 ) ) ( not ( = ?auto_906443 ?auto_906456 ) ) ( not ( = ?auto_906443 ?auto_906457 ) ) ( not ( = ?auto_906444 ?auto_906445 ) ) ( not ( = ?auto_906444 ?auto_906446 ) ) ( not ( = ?auto_906444 ?auto_906447 ) ) ( not ( = ?auto_906444 ?auto_906448 ) ) ( not ( = ?auto_906444 ?auto_906449 ) ) ( not ( = ?auto_906444 ?auto_906450 ) ) ( not ( = ?auto_906444 ?auto_906451 ) ) ( not ( = ?auto_906444 ?auto_906452 ) ) ( not ( = ?auto_906444 ?auto_906453 ) ) ( not ( = ?auto_906444 ?auto_906454 ) ) ( not ( = ?auto_906444 ?auto_906455 ) ) ( not ( = ?auto_906444 ?auto_906456 ) ) ( not ( = ?auto_906444 ?auto_906457 ) ) ( not ( = ?auto_906445 ?auto_906446 ) ) ( not ( = ?auto_906445 ?auto_906447 ) ) ( not ( = ?auto_906445 ?auto_906448 ) ) ( not ( = ?auto_906445 ?auto_906449 ) ) ( not ( = ?auto_906445 ?auto_906450 ) ) ( not ( = ?auto_906445 ?auto_906451 ) ) ( not ( = ?auto_906445 ?auto_906452 ) ) ( not ( = ?auto_906445 ?auto_906453 ) ) ( not ( = ?auto_906445 ?auto_906454 ) ) ( not ( = ?auto_906445 ?auto_906455 ) ) ( not ( = ?auto_906445 ?auto_906456 ) ) ( not ( = ?auto_906445 ?auto_906457 ) ) ( not ( = ?auto_906446 ?auto_906447 ) ) ( not ( = ?auto_906446 ?auto_906448 ) ) ( not ( = ?auto_906446 ?auto_906449 ) ) ( not ( = ?auto_906446 ?auto_906450 ) ) ( not ( = ?auto_906446 ?auto_906451 ) ) ( not ( = ?auto_906446 ?auto_906452 ) ) ( not ( = ?auto_906446 ?auto_906453 ) ) ( not ( = ?auto_906446 ?auto_906454 ) ) ( not ( = ?auto_906446 ?auto_906455 ) ) ( not ( = ?auto_906446 ?auto_906456 ) ) ( not ( = ?auto_906446 ?auto_906457 ) ) ( not ( = ?auto_906447 ?auto_906448 ) ) ( not ( = ?auto_906447 ?auto_906449 ) ) ( not ( = ?auto_906447 ?auto_906450 ) ) ( not ( = ?auto_906447 ?auto_906451 ) ) ( not ( = ?auto_906447 ?auto_906452 ) ) ( not ( = ?auto_906447 ?auto_906453 ) ) ( not ( = ?auto_906447 ?auto_906454 ) ) ( not ( = ?auto_906447 ?auto_906455 ) ) ( not ( = ?auto_906447 ?auto_906456 ) ) ( not ( = ?auto_906447 ?auto_906457 ) ) ( not ( = ?auto_906448 ?auto_906449 ) ) ( not ( = ?auto_906448 ?auto_906450 ) ) ( not ( = ?auto_906448 ?auto_906451 ) ) ( not ( = ?auto_906448 ?auto_906452 ) ) ( not ( = ?auto_906448 ?auto_906453 ) ) ( not ( = ?auto_906448 ?auto_906454 ) ) ( not ( = ?auto_906448 ?auto_906455 ) ) ( not ( = ?auto_906448 ?auto_906456 ) ) ( not ( = ?auto_906448 ?auto_906457 ) ) ( not ( = ?auto_906449 ?auto_906450 ) ) ( not ( = ?auto_906449 ?auto_906451 ) ) ( not ( = ?auto_906449 ?auto_906452 ) ) ( not ( = ?auto_906449 ?auto_906453 ) ) ( not ( = ?auto_906449 ?auto_906454 ) ) ( not ( = ?auto_906449 ?auto_906455 ) ) ( not ( = ?auto_906449 ?auto_906456 ) ) ( not ( = ?auto_906449 ?auto_906457 ) ) ( not ( = ?auto_906450 ?auto_906451 ) ) ( not ( = ?auto_906450 ?auto_906452 ) ) ( not ( = ?auto_906450 ?auto_906453 ) ) ( not ( = ?auto_906450 ?auto_906454 ) ) ( not ( = ?auto_906450 ?auto_906455 ) ) ( not ( = ?auto_906450 ?auto_906456 ) ) ( not ( = ?auto_906450 ?auto_906457 ) ) ( not ( = ?auto_906451 ?auto_906452 ) ) ( not ( = ?auto_906451 ?auto_906453 ) ) ( not ( = ?auto_906451 ?auto_906454 ) ) ( not ( = ?auto_906451 ?auto_906455 ) ) ( not ( = ?auto_906451 ?auto_906456 ) ) ( not ( = ?auto_906451 ?auto_906457 ) ) ( not ( = ?auto_906452 ?auto_906453 ) ) ( not ( = ?auto_906452 ?auto_906454 ) ) ( not ( = ?auto_906452 ?auto_906455 ) ) ( not ( = ?auto_906452 ?auto_906456 ) ) ( not ( = ?auto_906452 ?auto_906457 ) ) ( not ( = ?auto_906453 ?auto_906454 ) ) ( not ( = ?auto_906453 ?auto_906455 ) ) ( not ( = ?auto_906453 ?auto_906456 ) ) ( not ( = ?auto_906453 ?auto_906457 ) ) ( not ( = ?auto_906454 ?auto_906455 ) ) ( not ( = ?auto_906454 ?auto_906456 ) ) ( not ( = ?auto_906454 ?auto_906457 ) ) ( not ( = ?auto_906455 ?auto_906456 ) ) ( not ( = ?auto_906455 ?auto_906457 ) ) ( not ( = ?auto_906456 ?auto_906457 ) ) ( ON ?auto_906455 ?auto_906456 ) ( ON ?auto_906454 ?auto_906455 ) ( ON ?auto_906453 ?auto_906454 ) ( ON ?auto_906452 ?auto_906453 ) ( ON ?auto_906451 ?auto_906452 ) ( ON ?auto_906450 ?auto_906451 ) ( ON ?auto_906449 ?auto_906450 ) ( ON ?auto_906448 ?auto_906449 ) ( ON ?auto_906447 ?auto_906448 ) ( ON ?auto_906446 ?auto_906447 ) ( ON ?auto_906445 ?auto_906446 ) ( ON ?auto_906444 ?auto_906445 ) ( CLEAR ?auto_906442 ) ( ON ?auto_906443 ?auto_906444 ) ( CLEAR ?auto_906443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_906439 ?auto_906440 ?auto_906441 ?auto_906442 ?auto_906443 )
      ( MAKE-18PILE ?auto_906439 ?auto_906440 ?auto_906441 ?auto_906442 ?auto_906443 ?auto_906444 ?auto_906445 ?auto_906446 ?auto_906447 ?auto_906448 ?auto_906449 ?auto_906450 ?auto_906451 ?auto_906452 ?auto_906453 ?auto_906454 ?auto_906455 ?auto_906456 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906476 - BLOCK
      ?auto_906477 - BLOCK
      ?auto_906478 - BLOCK
      ?auto_906479 - BLOCK
      ?auto_906480 - BLOCK
      ?auto_906481 - BLOCK
      ?auto_906482 - BLOCK
      ?auto_906483 - BLOCK
      ?auto_906484 - BLOCK
      ?auto_906485 - BLOCK
      ?auto_906486 - BLOCK
      ?auto_906487 - BLOCK
      ?auto_906488 - BLOCK
      ?auto_906489 - BLOCK
      ?auto_906490 - BLOCK
      ?auto_906491 - BLOCK
      ?auto_906492 - BLOCK
      ?auto_906493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_906493 ) ( ON-TABLE ?auto_906476 ) ( ON ?auto_906477 ?auto_906476 ) ( ON ?auto_906478 ?auto_906477 ) ( ON ?auto_906479 ?auto_906478 ) ( not ( = ?auto_906476 ?auto_906477 ) ) ( not ( = ?auto_906476 ?auto_906478 ) ) ( not ( = ?auto_906476 ?auto_906479 ) ) ( not ( = ?auto_906476 ?auto_906480 ) ) ( not ( = ?auto_906476 ?auto_906481 ) ) ( not ( = ?auto_906476 ?auto_906482 ) ) ( not ( = ?auto_906476 ?auto_906483 ) ) ( not ( = ?auto_906476 ?auto_906484 ) ) ( not ( = ?auto_906476 ?auto_906485 ) ) ( not ( = ?auto_906476 ?auto_906486 ) ) ( not ( = ?auto_906476 ?auto_906487 ) ) ( not ( = ?auto_906476 ?auto_906488 ) ) ( not ( = ?auto_906476 ?auto_906489 ) ) ( not ( = ?auto_906476 ?auto_906490 ) ) ( not ( = ?auto_906476 ?auto_906491 ) ) ( not ( = ?auto_906476 ?auto_906492 ) ) ( not ( = ?auto_906476 ?auto_906493 ) ) ( not ( = ?auto_906477 ?auto_906478 ) ) ( not ( = ?auto_906477 ?auto_906479 ) ) ( not ( = ?auto_906477 ?auto_906480 ) ) ( not ( = ?auto_906477 ?auto_906481 ) ) ( not ( = ?auto_906477 ?auto_906482 ) ) ( not ( = ?auto_906477 ?auto_906483 ) ) ( not ( = ?auto_906477 ?auto_906484 ) ) ( not ( = ?auto_906477 ?auto_906485 ) ) ( not ( = ?auto_906477 ?auto_906486 ) ) ( not ( = ?auto_906477 ?auto_906487 ) ) ( not ( = ?auto_906477 ?auto_906488 ) ) ( not ( = ?auto_906477 ?auto_906489 ) ) ( not ( = ?auto_906477 ?auto_906490 ) ) ( not ( = ?auto_906477 ?auto_906491 ) ) ( not ( = ?auto_906477 ?auto_906492 ) ) ( not ( = ?auto_906477 ?auto_906493 ) ) ( not ( = ?auto_906478 ?auto_906479 ) ) ( not ( = ?auto_906478 ?auto_906480 ) ) ( not ( = ?auto_906478 ?auto_906481 ) ) ( not ( = ?auto_906478 ?auto_906482 ) ) ( not ( = ?auto_906478 ?auto_906483 ) ) ( not ( = ?auto_906478 ?auto_906484 ) ) ( not ( = ?auto_906478 ?auto_906485 ) ) ( not ( = ?auto_906478 ?auto_906486 ) ) ( not ( = ?auto_906478 ?auto_906487 ) ) ( not ( = ?auto_906478 ?auto_906488 ) ) ( not ( = ?auto_906478 ?auto_906489 ) ) ( not ( = ?auto_906478 ?auto_906490 ) ) ( not ( = ?auto_906478 ?auto_906491 ) ) ( not ( = ?auto_906478 ?auto_906492 ) ) ( not ( = ?auto_906478 ?auto_906493 ) ) ( not ( = ?auto_906479 ?auto_906480 ) ) ( not ( = ?auto_906479 ?auto_906481 ) ) ( not ( = ?auto_906479 ?auto_906482 ) ) ( not ( = ?auto_906479 ?auto_906483 ) ) ( not ( = ?auto_906479 ?auto_906484 ) ) ( not ( = ?auto_906479 ?auto_906485 ) ) ( not ( = ?auto_906479 ?auto_906486 ) ) ( not ( = ?auto_906479 ?auto_906487 ) ) ( not ( = ?auto_906479 ?auto_906488 ) ) ( not ( = ?auto_906479 ?auto_906489 ) ) ( not ( = ?auto_906479 ?auto_906490 ) ) ( not ( = ?auto_906479 ?auto_906491 ) ) ( not ( = ?auto_906479 ?auto_906492 ) ) ( not ( = ?auto_906479 ?auto_906493 ) ) ( not ( = ?auto_906480 ?auto_906481 ) ) ( not ( = ?auto_906480 ?auto_906482 ) ) ( not ( = ?auto_906480 ?auto_906483 ) ) ( not ( = ?auto_906480 ?auto_906484 ) ) ( not ( = ?auto_906480 ?auto_906485 ) ) ( not ( = ?auto_906480 ?auto_906486 ) ) ( not ( = ?auto_906480 ?auto_906487 ) ) ( not ( = ?auto_906480 ?auto_906488 ) ) ( not ( = ?auto_906480 ?auto_906489 ) ) ( not ( = ?auto_906480 ?auto_906490 ) ) ( not ( = ?auto_906480 ?auto_906491 ) ) ( not ( = ?auto_906480 ?auto_906492 ) ) ( not ( = ?auto_906480 ?auto_906493 ) ) ( not ( = ?auto_906481 ?auto_906482 ) ) ( not ( = ?auto_906481 ?auto_906483 ) ) ( not ( = ?auto_906481 ?auto_906484 ) ) ( not ( = ?auto_906481 ?auto_906485 ) ) ( not ( = ?auto_906481 ?auto_906486 ) ) ( not ( = ?auto_906481 ?auto_906487 ) ) ( not ( = ?auto_906481 ?auto_906488 ) ) ( not ( = ?auto_906481 ?auto_906489 ) ) ( not ( = ?auto_906481 ?auto_906490 ) ) ( not ( = ?auto_906481 ?auto_906491 ) ) ( not ( = ?auto_906481 ?auto_906492 ) ) ( not ( = ?auto_906481 ?auto_906493 ) ) ( not ( = ?auto_906482 ?auto_906483 ) ) ( not ( = ?auto_906482 ?auto_906484 ) ) ( not ( = ?auto_906482 ?auto_906485 ) ) ( not ( = ?auto_906482 ?auto_906486 ) ) ( not ( = ?auto_906482 ?auto_906487 ) ) ( not ( = ?auto_906482 ?auto_906488 ) ) ( not ( = ?auto_906482 ?auto_906489 ) ) ( not ( = ?auto_906482 ?auto_906490 ) ) ( not ( = ?auto_906482 ?auto_906491 ) ) ( not ( = ?auto_906482 ?auto_906492 ) ) ( not ( = ?auto_906482 ?auto_906493 ) ) ( not ( = ?auto_906483 ?auto_906484 ) ) ( not ( = ?auto_906483 ?auto_906485 ) ) ( not ( = ?auto_906483 ?auto_906486 ) ) ( not ( = ?auto_906483 ?auto_906487 ) ) ( not ( = ?auto_906483 ?auto_906488 ) ) ( not ( = ?auto_906483 ?auto_906489 ) ) ( not ( = ?auto_906483 ?auto_906490 ) ) ( not ( = ?auto_906483 ?auto_906491 ) ) ( not ( = ?auto_906483 ?auto_906492 ) ) ( not ( = ?auto_906483 ?auto_906493 ) ) ( not ( = ?auto_906484 ?auto_906485 ) ) ( not ( = ?auto_906484 ?auto_906486 ) ) ( not ( = ?auto_906484 ?auto_906487 ) ) ( not ( = ?auto_906484 ?auto_906488 ) ) ( not ( = ?auto_906484 ?auto_906489 ) ) ( not ( = ?auto_906484 ?auto_906490 ) ) ( not ( = ?auto_906484 ?auto_906491 ) ) ( not ( = ?auto_906484 ?auto_906492 ) ) ( not ( = ?auto_906484 ?auto_906493 ) ) ( not ( = ?auto_906485 ?auto_906486 ) ) ( not ( = ?auto_906485 ?auto_906487 ) ) ( not ( = ?auto_906485 ?auto_906488 ) ) ( not ( = ?auto_906485 ?auto_906489 ) ) ( not ( = ?auto_906485 ?auto_906490 ) ) ( not ( = ?auto_906485 ?auto_906491 ) ) ( not ( = ?auto_906485 ?auto_906492 ) ) ( not ( = ?auto_906485 ?auto_906493 ) ) ( not ( = ?auto_906486 ?auto_906487 ) ) ( not ( = ?auto_906486 ?auto_906488 ) ) ( not ( = ?auto_906486 ?auto_906489 ) ) ( not ( = ?auto_906486 ?auto_906490 ) ) ( not ( = ?auto_906486 ?auto_906491 ) ) ( not ( = ?auto_906486 ?auto_906492 ) ) ( not ( = ?auto_906486 ?auto_906493 ) ) ( not ( = ?auto_906487 ?auto_906488 ) ) ( not ( = ?auto_906487 ?auto_906489 ) ) ( not ( = ?auto_906487 ?auto_906490 ) ) ( not ( = ?auto_906487 ?auto_906491 ) ) ( not ( = ?auto_906487 ?auto_906492 ) ) ( not ( = ?auto_906487 ?auto_906493 ) ) ( not ( = ?auto_906488 ?auto_906489 ) ) ( not ( = ?auto_906488 ?auto_906490 ) ) ( not ( = ?auto_906488 ?auto_906491 ) ) ( not ( = ?auto_906488 ?auto_906492 ) ) ( not ( = ?auto_906488 ?auto_906493 ) ) ( not ( = ?auto_906489 ?auto_906490 ) ) ( not ( = ?auto_906489 ?auto_906491 ) ) ( not ( = ?auto_906489 ?auto_906492 ) ) ( not ( = ?auto_906489 ?auto_906493 ) ) ( not ( = ?auto_906490 ?auto_906491 ) ) ( not ( = ?auto_906490 ?auto_906492 ) ) ( not ( = ?auto_906490 ?auto_906493 ) ) ( not ( = ?auto_906491 ?auto_906492 ) ) ( not ( = ?auto_906491 ?auto_906493 ) ) ( not ( = ?auto_906492 ?auto_906493 ) ) ( ON ?auto_906492 ?auto_906493 ) ( ON ?auto_906491 ?auto_906492 ) ( ON ?auto_906490 ?auto_906491 ) ( ON ?auto_906489 ?auto_906490 ) ( ON ?auto_906488 ?auto_906489 ) ( ON ?auto_906487 ?auto_906488 ) ( ON ?auto_906486 ?auto_906487 ) ( ON ?auto_906485 ?auto_906486 ) ( ON ?auto_906484 ?auto_906485 ) ( ON ?auto_906483 ?auto_906484 ) ( ON ?auto_906482 ?auto_906483 ) ( ON ?auto_906481 ?auto_906482 ) ( CLEAR ?auto_906479 ) ( ON ?auto_906480 ?auto_906481 ) ( CLEAR ?auto_906480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_906476 ?auto_906477 ?auto_906478 ?auto_906479 ?auto_906480 )
      ( MAKE-18PILE ?auto_906476 ?auto_906477 ?auto_906478 ?auto_906479 ?auto_906480 ?auto_906481 ?auto_906482 ?auto_906483 ?auto_906484 ?auto_906485 ?auto_906486 ?auto_906487 ?auto_906488 ?auto_906489 ?auto_906490 ?auto_906491 ?auto_906492 ?auto_906493 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906512 - BLOCK
      ?auto_906513 - BLOCK
      ?auto_906514 - BLOCK
      ?auto_906515 - BLOCK
      ?auto_906516 - BLOCK
      ?auto_906517 - BLOCK
      ?auto_906518 - BLOCK
      ?auto_906519 - BLOCK
      ?auto_906520 - BLOCK
      ?auto_906521 - BLOCK
      ?auto_906522 - BLOCK
      ?auto_906523 - BLOCK
      ?auto_906524 - BLOCK
      ?auto_906525 - BLOCK
      ?auto_906526 - BLOCK
      ?auto_906527 - BLOCK
      ?auto_906528 - BLOCK
      ?auto_906529 - BLOCK
    )
    :vars
    (
      ?auto_906530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906529 ?auto_906530 ) ( ON-TABLE ?auto_906512 ) ( ON ?auto_906513 ?auto_906512 ) ( ON ?auto_906514 ?auto_906513 ) ( not ( = ?auto_906512 ?auto_906513 ) ) ( not ( = ?auto_906512 ?auto_906514 ) ) ( not ( = ?auto_906512 ?auto_906515 ) ) ( not ( = ?auto_906512 ?auto_906516 ) ) ( not ( = ?auto_906512 ?auto_906517 ) ) ( not ( = ?auto_906512 ?auto_906518 ) ) ( not ( = ?auto_906512 ?auto_906519 ) ) ( not ( = ?auto_906512 ?auto_906520 ) ) ( not ( = ?auto_906512 ?auto_906521 ) ) ( not ( = ?auto_906512 ?auto_906522 ) ) ( not ( = ?auto_906512 ?auto_906523 ) ) ( not ( = ?auto_906512 ?auto_906524 ) ) ( not ( = ?auto_906512 ?auto_906525 ) ) ( not ( = ?auto_906512 ?auto_906526 ) ) ( not ( = ?auto_906512 ?auto_906527 ) ) ( not ( = ?auto_906512 ?auto_906528 ) ) ( not ( = ?auto_906512 ?auto_906529 ) ) ( not ( = ?auto_906512 ?auto_906530 ) ) ( not ( = ?auto_906513 ?auto_906514 ) ) ( not ( = ?auto_906513 ?auto_906515 ) ) ( not ( = ?auto_906513 ?auto_906516 ) ) ( not ( = ?auto_906513 ?auto_906517 ) ) ( not ( = ?auto_906513 ?auto_906518 ) ) ( not ( = ?auto_906513 ?auto_906519 ) ) ( not ( = ?auto_906513 ?auto_906520 ) ) ( not ( = ?auto_906513 ?auto_906521 ) ) ( not ( = ?auto_906513 ?auto_906522 ) ) ( not ( = ?auto_906513 ?auto_906523 ) ) ( not ( = ?auto_906513 ?auto_906524 ) ) ( not ( = ?auto_906513 ?auto_906525 ) ) ( not ( = ?auto_906513 ?auto_906526 ) ) ( not ( = ?auto_906513 ?auto_906527 ) ) ( not ( = ?auto_906513 ?auto_906528 ) ) ( not ( = ?auto_906513 ?auto_906529 ) ) ( not ( = ?auto_906513 ?auto_906530 ) ) ( not ( = ?auto_906514 ?auto_906515 ) ) ( not ( = ?auto_906514 ?auto_906516 ) ) ( not ( = ?auto_906514 ?auto_906517 ) ) ( not ( = ?auto_906514 ?auto_906518 ) ) ( not ( = ?auto_906514 ?auto_906519 ) ) ( not ( = ?auto_906514 ?auto_906520 ) ) ( not ( = ?auto_906514 ?auto_906521 ) ) ( not ( = ?auto_906514 ?auto_906522 ) ) ( not ( = ?auto_906514 ?auto_906523 ) ) ( not ( = ?auto_906514 ?auto_906524 ) ) ( not ( = ?auto_906514 ?auto_906525 ) ) ( not ( = ?auto_906514 ?auto_906526 ) ) ( not ( = ?auto_906514 ?auto_906527 ) ) ( not ( = ?auto_906514 ?auto_906528 ) ) ( not ( = ?auto_906514 ?auto_906529 ) ) ( not ( = ?auto_906514 ?auto_906530 ) ) ( not ( = ?auto_906515 ?auto_906516 ) ) ( not ( = ?auto_906515 ?auto_906517 ) ) ( not ( = ?auto_906515 ?auto_906518 ) ) ( not ( = ?auto_906515 ?auto_906519 ) ) ( not ( = ?auto_906515 ?auto_906520 ) ) ( not ( = ?auto_906515 ?auto_906521 ) ) ( not ( = ?auto_906515 ?auto_906522 ) ) ( not ( = ?auto_906515 ?auto_906523 ) ) ( not ( = ?auto_906515 ?auto_906524 ) ) ( not ( = ?auto_906515 ?auto_906525 ) ) ( not ( = ?auto_906515 ?auto_906526 ) ) ( not ( = ?auto_906515 ?auto_906527 ) ) ( not ( = ?auto_906515 ?auto_906528 ) ) ( not ( = ?auto_906515 ?auto_906529 ) ) ( not ( = ?auto_906515 ?auto_906530 ) ) ( not ( = ?auto_906516 ?auto_906517 ) ) ( not ( = ?auto_906516 ?auto_906518 ) ) ( not ( = ?auto_906516 ?auto_906519 ) ) ( not ( = ?auto_906516 ?auto_906520 ) ) ( not ( = ?auto_906516 ?auto_906521 ) ) ( not ( = ?auto_906516 ?auto_906522 ) ) ( not ( = ?auto_906516 ?auto_906523 ) ) ( not ( = ?auto_906516 ?auto_906524 ) ) ( not ( = ?auto_906516 ?auto_906525 ) ) ( not ( = ?auto_906516 ?auto_906526 ) ) ( not ( = ?auto_906516 ?auto_906527 ) ) ( not ( = ?auto_906516 ?auto_906528 ) ) ( not ( = ?auto_906516 ?auto_906529 ) ) ( not ( = ?auto_906516 ?auto_906530 ) ) ( not ( = ?auto_906517 ?auto_906518 ) ) ( not ( = ?auto_906517 ?auto_906519 ) ) ( not ( = ?auto_906517 ?auto_906520 ) ) ( not ( = ?auto_906517 ?auto_906521 ) ) ( not ( = ?auto_906517 ?auto_906522 ) ) ( not ( = ?auto_906517 ?auto_906523 ) ) ( not ( = ?auto_906517 ?auto_906524 ) ) ( not ( = ?auto_906517 ?auto_906525 ) ) ( not ( = ?auto_906517 ?auto_906526 ) ) ( not ( = ?auto_906517 ?auto_906527 ) ) ( not ( = ?auto_906517 ?auto_906528 ) ) ( not ( = ?auto_906517 ?auto_906529 ) ) ( not ( = ?auto_906517 ?auto_906530 ) ) ( not ( = ?auto_906518 ?auto_906519 ) ) ( not ( = ?auto_906518 ?auto_906520 ) ) ( not ( = ?auto_906518 ?auto_906521 ) ) ( not ( = ?auto_906518 ?auto_906522 ) ) ( not ( = ?auto_906518 ?auto_906523 ) ) ( not ( = ?auto_906518 ?auto_906524 ) ) ( not ( = ?auto_906518 ?auto_906525 ) ) ( not ( = ?auto_906518 ?auto_906526 ) ) ( not ( = ?auto_906518 ?auto_906527 ) ) ( not ( = ?auto_906518 ?auto_906528 ) ) ( not ( = ?auto_906518 ?auto_906529 ) ) ( not ( = ?auto_906518 ?auto_906530 ) ) ( not ( = ?auto_906519 ?auto_906520 ) ) ( not ( = ?auto_906519 ?auto_906521 ) ) ( not ( = ?auto_906519 ?auto_906522 ) ) ( not ( = ?auto_906519 ?auto_906523 ) ) ( not ( = ?auto_906519 ?auto_906524 ) ) ( not ( = ?auto_906519 ?auto_906525 ) ) ( not ( = ?auto_906519 ?auto_906526 ) ) ( not ( = ?auto_906519 ?auto_906527 ) ) ( not ( = ?auto_906519 ?auto_906528 ) ) ( not ( = ?auto_906519 ?auto_906529 ) ) ( not ( = ?auto_906519 ?auto_906530 ) ) ( not ( = ?auto_906520 ?auto_906521 ) ) ( not ( = ?auto_906520 ?auto_906522 ) ) ( not ( = ?auto_906520 ?auto_906523 ) ) ( not ( = ?auto_906520 ?auto_906524 ) ) ( not ( = ?auto_906520 ?auto_906525 ) ) ( not ( = ?auto_906520 ?auto_906526 ) ) ( not ( = ?auto_906520 ?auto_906527 ) ) ( not ( = ?auto_906520 ?auto_906528 ) ) ( not ( = ?auto_906520 ?auto_906529 ) ) ( not ( = ?auto_906520 ?auto_906530 ) ) ( not ( = ?auto_906521 ?auto_906522 ) ) ( not ( = ?auto_906521 ?auto_906523 ) ) ( not ( = ?auto_906521 ?auto_906524 ) ) ( not ( = ?auto_906521 ?auto_906525 ) ) ( not ( = ?auto_906521 ?auto_906526 ) ) ( not ( = ?auto_906521 ?auto_906527 ) ) ( not ( = ?auto_906521 ?auto_906528 ) ) ( not ( = ?auto_906521 ?auto_906529 ) ) ( not ( = ?auto_906521 ?auto_906530 ) ) ( not ( = ?auto_906522 ?auto_906523 ) ) ( not ( = ?auto_906522 ?auto_906524 ) ) ( not ( = ?auto_906522 ?auto_906525 ) ) ( not ( = ?auto_906522 ?auto_906526 ) ) ( not ( = ?auto_906522 ?auto_906527 ) ) ( not ( = ?auto_906522 ?auto_906528 ) ) ( not ( = ?auto_906522 ?auto_906529 ) ) ( not ( = ?auto_906522 ?auto_906530 ) ) ( not ( = ?auto_906523 ?auto_906524 ) ) ( not ( = ?auto_906523 ?auto_906525 ) ) ( not ( = ?auto_906523 ?auto_906526 ) ) ( not ( = ?auto_906523 ?auto_906527 ) ) ( not ( = ?auto_906523 ?auto_906528 ) ) ( not ( = ?auto_906523 ?auto_906529 ) ) ( not ( = ?auto_906523 ?auto_906530 ) ) ( not ( = ?auto_906524 ?auto_906525 ) ) ( not ( = ?auto_906524 ?auto_906526 ) ) ( not ( = ?auto_906524 ?auto_906527 ) ) ( not ( = ?auto_906524 ?auto_906528 ) ) ( not ( = ?auto_906524 ?auto_906529 ) ) ( not ( = ?auto_906524 ?auto_906530 ) ) ( not ( = ?auto_906525 ?auto_906526 ) ) ( not ( = ?auto_906525 ?auto_906527 ) ) ( not ( = ?auto_906525 ?auto_906528 ) ) ( not ( = ?auto_906525 ?auto_906529 ) ) ( not ( = ?auto_906525 ?auto_906530 ) ) ( not ( = ?auto_906526 ?auto_906527 ) ) ( not ( = ?auto_906526 ?auto_906528 ) ) ( not ( = ?auto_906526 ?auto_906529 ) ) ( not ( = ?auto_906526 ?auto_906530 ) ) ( not ( = ?auto_906527 ?auto_906528 ) ) ( not ( = ?auto_906527 ?auto_906529 ) ) ( not ( = ?auto_906527 ?auto_906530 ) ) ( not ( = ?auto_906528 ?auto_906529 ) ) ( not ( = ?auto_906528 ?auto_906530 ) ) ( not ( = ?auto_906529 ?auto_906530 ) ) ( ON ?auto_906528 ?auto_906529 ) ( ON ?auto_906527 ?auto_906528 ) ( ON ?auto_906526 ?auto_906527 ) ( ON ?auto_906525 ?auto_906526 ) ( ON ?auto_906524 ?auto_906525 ) ( ON ?auto_906523 ?auto_906524 ) ( ON ?auto_906522 ?auto_906523 ) ( ON ?auto_906521 ?auto_906522 ) ( ON ?auto_906520 ?auto_906521 ) ( ON ?auto_906519 ?auto_906520 ) ( ON ?auto_906518 ?auto_906519 ) ( ON ?auto_906517 ?auto_906518 ) ( ON ?auto_906516 ?auto_906517 ) ( CLEAR ?auto_906514 ) ( ON ?auto_906515 ?auto_906516 ) ( CLEAR ?auto_906515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_906512 ?auto_906513 ?auto_906514 ?auto_906515 )
      ( MAKE-18PILE ?auto_906512 ?auto_906513 ?auto_906514 ?auto_906515 ?auto_906516 ?auto_906517 ?auto_906518 ?auto_906519 ?auto_906520 ?auto_906521 ?auto_906522 ?auto_906523 ?auto_906524 ?auto_906525 ?auto_906526 ?auto_906527 ?auto_906528 ?auto_906529 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906549 - BLOCK
      ?auto_906550 - BLOCK
      ?auto_906551 - BLOCK
      ?auto_906552 - BLOCK
      ?auto_906553 - BLOCK
      ?auto_906554 - BLOCK
      ?auto_906555 - BLOCK
      ?auto_906556 - BLOCK
      ?auto_906557 - BLOCK
      ?auto_906558 - BLOCK
      ?auto_906559 - BLOCK
      ?auto_906560 - BLOCK
      ?auto_906561 - BLOCK
      ?auto_906562 - BLOCK
      ?auto_906563 - BLOCK
      ?auto_906564 - BLOCK
      ?auto_906565 - BLOCK
      ?auto_906566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_906566 ) ( ON-TABLE ?auto_906549 ) ( ON ?auto_906550 ?auto_906549 ) ( ON ?auto_906551 ?auto_906550 ) ( not ( = ?auto_906549 ?auto_906550 ) ) ( not ( = ?auto_906549 ?auto_906551 ) ) ( not ( = ?auto_906549 ?auto_906552 ) ) ( not ( = ?auto_906549 ?auto_906553 ) ) ( not ( = ?auto_906549 ?auto_906554 ) ) ( not ( = ?auto_906549 ?auto_906555 ) ) ( not ( = ?auto_906549 ?auto_906556 ) ) ( not ( = ?auto_906549 ?auto_906557 ) ) ( not ( = ?auto_906549 ?auto_906558 ) ) ( not ( = ?auto_906549 ?auto_906559 ) ) ( not ( = ?auto_906549 ?auto_906560 ) ) ( not ( = ?auto_906549 ?auto_906561 ) ) ( not ( = ?auto_906549 ?auto_906562 ) ) ( not ( = ?auto_906549 ?auto_906563 ) ) ( not ( = ?auto_906549 ?auto_906564 ) ) ( not ( = ?auto_906549 ?auto_906565 ) ) ( not ( = ?auto_906549 ?auto_906566 ) ) ( not ( = ?auto_906550 ?auto_906551 ) ) ( not ( = ?auto_906550 ?auto_906552 ) ) ( not ( = ?auto_906550 ?auto_906553 ) ) ( not ( = ?auto_906550 ?auto_906554 ) ) ( not ( = ?auto_906550 ?auto_906555 ) ) ( not ( = ?auto_906550 ?auto_906556 ) ) ( not ( = ?auto_906550 ?auto_906557 ) ) ( not ( = ?auto_906550 ?auto_906558 ) ) ( not ( = ?auto_906550 ?auto_906559 ) ) ( not ( = ?auto_906550 ?auto_906560 ) ) ( not ( = ?auto_906550 ?auto_906561 ) ) ( not ( = ?auto_906550 ?auto_906562 ) ) ( not ( = ?auto_906550 ?auto_906563 ) ) ( not ( = ?auto_906550 ?auto_906564 ) ) ( not ( = ?auto_906550 ?auto_906565 ) ) ( not ( = ?auto_906550 ?auto_906566 ) ) ( not ( = ?auto_906551 ?auto_906552 ) ) ( not ( = ?auto_906551 ?auto_906553 ) ) ( not ( = ?auto_906551 ?auto_906554 ) ) ( not ( = ?auto_906551 ?auto_906555 ) ) ( not ( = ?auto_906551 ?auto_906556 ) ) ( not ( = ?auto_906551 ?auto_906557 ) ) ( not ( = ?auto_906551 ?auto_906558 ) ) ( not ( = ?auto_906551 ?auto_906559 ) ) ( not ( = ?auto_906551 ?auto_906560 ) ) ( not ( = ?auto_906551 ?auto_906561 ) ) ( not ( = ?auto_906551 ?auto_906562 ) ) ( not ( = ?auto_906551 ?auto_906563 ) ) ( not ( = ?auto_906551 ?auto_906564 ) ) ( not ( = ?auto_906551 ?auto_906565 ) ) ( not ( = ?auto_906551 ?auto_906566 ) ) ( not ( = ?auto_906552 ?auto_906553 ) ) ( not ( = ?auto_906552 ?auto_906554 ) ) ( not ( = ?auto_906552 ?auto_906555 ) ) ( not ( = ?auto_906552 ?auto_906556 ) ) ( not ( = ?auto_906552 ?auto_906557 ) ) ( not ( = ?auto_906552 ?auto_906558 ) ) ( not ( = ?auto_906552 ?auto_906559 ) ) ( not ( = ?auto_906552 ?auto_906560 ) ) ( not ( = ?auto_906552 ?auto_906561 ) ) ( not ( = ?auto_906552 ?auto_906562 ) ) ( not ( = ?auto_906552 ?auto_906563 ) ) ( not ( = ?auto_906552 ?auto_906564 ) ) ( not ( = ?auto_906552 ?auto_906565 ) ) ( not ( = ?auto_906552 ?auto_906566 ) ) ( not ( = ?auto_906553 ?auto_906554 ) ) ( not ( = ?auto_906553 ?auto_906555 ) ) ( not ( = ?auto_906553 ?auto_906556 ) ) ( not ( = ?auto_906553 ?auto_906557 ) ) ( not ( = ?auto_906553 ?auto_906558 ) ) ( not ( = ?auto_906553 ?auto_906559 ) ) ( not ( = ?auto_906553 ?auto_906560 ) ) ( not ( = ?auto_906553 ?auto_906561 ) ) ( not ( = ?auto_906553 ?auto_906562 ) ) ( not ( = ?auto_906553 ?auto_906563 ) ) ( not ( = ?auto_906553 ?auto_906564 ) ) ( not ( = ?auto_906553 ?auto_906565 ) ) ( not ( = ?auto_906553 ?auto_906566 ) ) ( not ( = ?auto_906554 ?auto_906555 ) ) ( not ( = ?auto_906554 ?auto_906556 ) ) ( not ( = ?auto_906554 ?auto_906557 ) ) ( not ( = ?auto_906554 ?auto_906558 ) ) ( not ( = ?auto_906554 ?auto_906559 ) ) ( not ( = ?auto_906554 ?auto_906560 ) ) ( not ( = ?auto_906554 ?auto_906561 ) ) ( not ( = ?auto_906554 ?auto_906562 ) ) ( not ( = ?auto_906554 ?auto_906563 ) ) ( not ( = ?auto_906554 ?auto_906564 ) ) ( not ( = ?auto_906554 ?auto_906565 ) ) ( not ( = ?auto_906554 ?auto_906566 ) ) ( not ( = ?auto_906555 ?auto_906556 ) ) ( not ( = ?auto_906555 ?auto_906557 ) ) ( not ( = ?auto_906555 ?auto_906558 ) ) ( not ( = ?auto_906555 ?auto_906559 ) ) ( not ( = ?auto_906555 ?auto_906560 ) ) ( not ( = ?auto_906555 ?auto_906561 ) ) ( not ( = ?auto_906555 ?auto_906562 ) ) ( not ( = ?auto_906555 ?auto_906563 ) ) ( not ( = ?auto_906555 ?auto_906564 ) ) ( not ( = ?auto_906555 ?auto_906565 ) ) ( not ( = ?auto_906555 ?auto_906566 ) ) ( not ( = ?auto_906556 ?auto_906557 ) ) ( not ( = ?auto_906556 ?auto_906558 ) ) ( not ( = ?auto_906556 ?auto_906559 ) ) ( not ( = ?auto_906556 ?auto_906560 ) ) ( not ( = ?auto_906556 ?auto_906561 ) ) ( not ( = ?auto_906556 ?auto_906562 ) ) ( not ( = ?auto_906556 ?auto_906563 ) ) ( not ( = ?auto_906556 ?auto_906564 ) ) ( not ( = ?auto_906556 ?auto_906565 ) ) ( not ( = ?auto_906556 ?auto_906566 ) ) ( not ( = ?auto_906557 ?auto_906558 ) ) ( not ( = ?auto_906557 ?auto_906559 ) ) ( not ( = ?auto_906557 ?auto_906560 ) ) ( not ( = ?auto_906557 ?auto_906561 ) ) ( not ( = ?auto_906557 ?auto_906562 ) ) ( not ( = ?auto_906557 ?auto_906563 ) ) ( not ( = ?auto_906557 ?auto_906564 ) ) ( not ( = ?auto_906557 ?auto_906565 ) ) ( not ( = ?auto_906557 ?auto_906566 ) ) ( not ( = ?auto_906558 ?auto_906559 ) ) ( not ( = ?auto_906558 ?auto_906560 ) ) ( not ( = ?auto_906558 ?auto_906561 ) ) ( not ( = ?auto_906558 ?auto_906562 ) ) ( not ( = ?auto_906558 ?auto_906563 ) ) ( not ( = ?auto_906558 ?auto_906564 ) ) ( not ( = ?auto_906558 ?auto_906565 ) ) ( not ( = ?auto_906558 ?auto_906566 ) ) ( not ( = ?auto_906559 ?auto_906560 ) ) ( not ( = ?auto_906559 ?auto_906561 ) ) ( not ( = ?auto_906559 ?auto_906562 ) ) ( not ( = ?auto_906559 ?auto_906563 ) ) ( not ( = ?auto_906559 ?auto_906564 ) ) ( not ( = ?auto_906559 ?auto_906565 ) ) ( not ( = ?auto_906559 ?auto_906566 ) ) ( not ( = ?auto_906560 ?auto_906561 ) ) ( not ( = ?auto_906560 ?auto_906562 ) ) ( not ( = ?auto_906560 ?auto_906563 ) ) ( not ( = ?auto_906560 ?auto_906564 ) ) ( not ( = ?auto_906560 ?auto_906565 ) ) ( not ( = ?auto_906560 ?auto_906566 ) ) ( not ( = ?auto_906561 ?auto_906562 ) ) ( not ( = ?auto_906561 ?auto_906563 ) ) ( not ( = ?auto_906561 ?auto_906564 ) ) ( not ( = ?auto_906561 ?auto_906565 ) ) ( not ( = ?auto_906561 ?auto_906566 ) ) ( not ( = ?auto_906562 ?auto_906563 ) ) ( not ( = ?auto_906562 ?auto_906564 ) ) ( not ( = ?auto_906562 ?auto_906565 ) ) ( not ( = ?auto_906562 ?auto_906566 ) ) ( not ( = ?auto_906563 ?auto_906564 ) ) ( not ( = ?auto_906563 ?auto_906565 ) ) ( not ( = ?auto_906563 ?auto_906566 ) ) ( not ( = ?auto_906564 ?auto_906565 ) ) ( not ( = ?auto_906564 ?auto_906566 ) ) ( not ( = ?auto_906565 ?auto_906566 ) ) ( ON ?auto_906565 ?auto_906566 ) ( ON ?auto_906564 ?auto_906565 ) ( ON ?auto_906563 ?auto_906564 ) ( ON ?auto_906562 ?auto_906563 ) ( ON ?auto_906561 ?auto_906562 ) ( ON ?auto_906560 ?auto_906561 ) ( ON ?auto_906559 ?auto_906560 ) ( ON ?auto_906558 ?auto_906559 ) ( ON ?auto_906557 ?auto_906558 ) ( ON ?auto_906556 ?auto_906557 ) ( ON ?auto_906555 ?auto_906556 ) ( ON ?auto_906554 ?auto_906555 ) ( ON ?auto_906553 ?auto_906554 ) ( CLEAR ?auto_906551 ) ( ON ?auto_906552 ?auto_906553 ) ( CLEAR ?auto_906552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_906549 ?auto_906550 ?auto_906551 ?auto_906552 )
      ( MAKE-18PILE ?auto_906549 ?auto_906550 ?auto_906551 ?auto_906552 ?auto_906553 ?auto_906554 ?auto_906555 ?auto_906556 ?auto_906557 ?auto_906558 ?auto_906559 ?auto_906560 ?auto_906561 ?auto_906562 ?auto_906563 ?auto_906564 ?auto_906565 ?auto_906566 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906585 - BLOCK
      ?auto_906586 - BLOCK
      ?auto_906587 - BLOCK
      ?auto_906588 - BLOCK
      ?auto_906589 - BLOCK
      ?auto_906590 - BLOCK
      ?auto_906591 - BLOCK
      ?auto_906592 - BLOCK
      ?auto_906593 - BLOCK
      ?auto_906594 - BLOCK
      ?auto_906595 - BLOCK
      ?auto_906596 - BLOCK
      ?auto_906597 - BLOCK
      ?auto_906598 - BLOCK
      ?auto_906599 - BLOCK
      ?auto_906600 - BLOCK
      ?auto_906601 - BLOCK
      ?auto_906602 - BLOCK
    )
    :vars
    (
      ?auto_906603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906602 ?auto_906603 ) ( ON-TABLE ?auto_906585 ) ( ON ?auto_906586 ?auto_906585 ) ( not ( = ?auto_906585 ?auto_906586 ) ) ( not ( = ?auto_906585 ?auto_906587 ) ) ( not ( = ?auto_906585 ?auto_906588 ) ) ( not ( = ?auto_906585 ?auto_906589 ) ) ( not ( = ?auto_906585 ?auto_906590 ) ) ( not ( = ?auto_906585 ?auto_906591 ) ) ( not ( = ?auto_906585 ?auto_906592 ) ) ( not ( = ?auto_906585 ?auto_906593 ) ) ( not ( = ?auto_906585 ?auto_906594 ) ) ( not ( = ?auto_906585 ?auto_906595 ) ) ( not ( = ?auto_906585 ?auto_906596 ) ) ( not ( = ?auto_906585 ?auto_906597 ) ) ( not ( = ?auto_906585 ?auto_906598 ) ) ( not ( = ?auto_906585 ?auto_906599 ) ) ( not ( = ?auto_906585 ?auto_906600 ) ) ( not ( = ?auto_906585 ?auto_906601 ) ) ( not ( = ?auto_906585 ?auto_906602 ) ) ( not ( = ?auto_906585 ?auto_906603 ) ) ( not ( = ?auto_906586 ?auto_906587 ) ) ( not ( = ?auto_906586 ?auto_906588 ) ) ( not ( = ?auto_906586 ?auto_906589 ) ) ( not ( = ?auto_906586 ?auto_906590 ) ) ( not ( = ?auto_906586 ?auto_906591 ) ) ( not ( = ?auto_906586 ?auto_906592 ) ) ( not ( = ?auto_906586 ?auto_906593 ) ) ( not ( = ?auto_906586 ?auto_906594 ) ) ( not ( = ?auto_906586 ?auto_906595 ) ) ( not ( = ?auto_906586 ?auto_906596 ) ) ( not ( = ?auto_906586 ?auto_906597 ) ) ( not ( = ?auto_906586 ?auto_906598 ) ) ( not ( = ?auto_906586 ?auto_906599 ) ) ( not ( = ?auto_906586 ?auto_906600 ) ) ( not ( = ?auto_906586 ?auto_906601 ) ) ( not ( = ?auto_906586 ?auto_906602 ) ) ( not ( = ?auto_906586 ?auto_906603 ) ) ( not ( = ?auto_906587 ?auto_906588 ) ) ( not ( = ?auto_906587 ?auto_906589 ) ) ( not ( = ?auto_906587 ?auto_906590 ) ) ( not ( = ?auto_906587 ?auto_906591 ) ) ( not ( = ?auto_906587 ?auto_906592 ) ) ( not ( = ?auto_906587 ?auto_906593 ) ) ( not ( = ?auto_906587 ?auto_906594 ) ) ( not ( = ?auto_906587 ?auto_906595 ) ) ( not ( = ?auto_906587 ?auto_906596 ) ) ( not ( = ?auto_906587 ?auto_906597 ) ) ( not ( = ?auto_906587 ?auto_906598 ) ) ( not ( = ?auto_906587 ?auto_906599 ) ) ( not ( = ?auto_906587 ?auto_906600 ) ) ( not ( = ?auto_906587 ?auto_906601 ) ) ( not ( = ?auto_906587 ?auto_906602 ) ) ( not ( = ?auto_906587 ?auto_906603 ) ) ( not ( = ?auto_906588 ?auto_906589 ) ) ( not ( = ?auto_906588 ?auto_906590 ) ) ( not ( = ?auto_906588 ?auto_906591 ) ) ( not ( = ?auto_906588 ?auto_906592 ) ) ( not ( = ?auto_906588 ?auto_906593 ) ) ( not ( = ?auto_906588 ?auto_906594 ) ) ( not ( = ?auto_906588 ?auto_906595 ) ) ( not ( = ?auto_906588 ?auto_906596 ) ) ( not ( = ?auto_906588 ?auto_906597 ) ) ( not ( = ?auto_906588 ?auto_906598 ) ) ( not ( = ?auto_906588 ?auto_906599 ) ) ( not ( = ?auto_906588 ?auto_906600 ) ) ( not ( = ?auto_906588 ?auto_906601 ) ) ( not ( = ?auto_906588 ?auto_906602 ) ) ( not ( = ?auto_906588 ?auto_906603 ) ) ( not ( = ?auto_906589 ?auto_906590 ) ) ( not ( = ?auto_906589 ?auto_906591 ) ) ( not ( = ?auto_906589 ?auto_906592 ) ) ( not ( = ?auto_906589 ?auto_906593 ) ) ( not ( = ?auto_906589 ?auto_906594 ) ) ( not ( = ?auto_906589 ?auto_906595 ) ) ( not ( = ?auto_906589 ?auto_906596 ) ) ( not ( = ?auto_906589 ?auto_906597 ) ) ( not ( = ?auto_906589 ?auto_906598 ) ) ( not ( = ?auto_906589 ?auto_906599 ) ) ( not ( = ?auto_906589 ?auto_906600 ) ) ( not ( = ?auto_906589 ?auto_906601 ) ) ( not ( = ?auto_906589 ?auto_906602 ) ) ( not ( = ?auto_906589 ?auto_906603 ) ) ( not ( = ?auto_906590 ?auto_906591 ) ) ( not ( = ?auto_906590 ?auto_906592 ) ) ( not ( = ?auto_906590 ?auto_906593 ) ) ( not ( = ?auto_906590 ?auto_906594 ) ) ( not ( = ?auto_906590 ?auto_906595 ) ) ( not ( = ?auto_906590 ?auto_906596 ) ) ( not ( = ?auto_906590 ?auto_906597 ) ) ( not ( = ?auto_906590 ?auto_906598 ) ) ( not ( = ?auto_906590 ?auto_906599 ) ) ( not ( = ?auto_906590 ?auto_906600 ) ) ( not ( = ?auto_906590 ?auto_906601 ) ) ( not ( = ?auto_906590 ?auto_906602 ) ) ( not ( = ?auto_906590 ?auto_906603 ) ) ( not ( = ?auto_906591 ?auto_906592 ) ) ( not ( = ?auto_906591 ?auto_906593 ) ) ( not ( = ?auto_906591 ?auto_906594 ) ) ( not ( = ?auto_906591 ?auto_906595 ) ) ( not ( = ?auto_906591 ?auto_906596 ) ) ( not ( = ?auto_906591 ?auto_906597 ) ) ( not ( = ?auto_906591 ?auto_906598 ) ) ( not ( = ?auto_906591 ?auto_906599 ) ) ( not ( = ?auto_906591 ?auto_906600 ) ) ( not ( = ?auto_906591 ?auto_906601 ) ) ( not ( = ?auto_906591 ?auto_906602 ) ) ( not ( = ?auto_906591 ?auto_906603 ) ) ( not ( = ?auto_906592 ?auto_906593 ) ) ( not ( = ?auto_906592 ?auto_906594 ) ) ( not ( = ?auto_906592 ?auto_906595 ) ) ( not ( = ?auto_906592 ?auto_906596 ) ) ( not ( = ?auto_906592 ?auto_906597 ) ) ( not ( = ?auto_906592 ?auto_906598 ) ) ( not ( = ?auto_906592 ?auto_906599 ) ) ( not ( = ?auto_906592 ?auto_906600 ) ) ( not ( = ?auto_906592 ?auto_906601 ) ) ( not ( = ?auto_906592 ?auto_906602 ) ) ( not ( = ?auto_906592 ?auto_906603 ) ) ( not ( = ?auto_906593 ?auto_906594 ) ) ( not ( = ?auto_906593 ?auto_906595 ) ) ( not ( = ?auto_906593 ?auto_906596 ) ) ( not ( = ?auto_906593 ?auto_906597 ) ) ( not ( = ?auto_906593 ?auto_906598 ) ) ( not ( = ?auto_906593 ?auto_906599 ) ) ( not ( = ?auto_906593 ?auto_906600 ) ) ( not ( = ?auto_906593 ?auto_906601 ) ) ( not ( = ?auto_906593 ?auto_906602 ) ) ( not ( = ?auto_906593 ?auto_906603 ) ) ( not ( = ?auto_906594 ?auto_906595 ) ) ( not ( = ?auto_906594 ?auto_906596 ) ) ( not ( = ?auto_906594 ?auto_906597 ) ) ( not ( = ?auto_906594 ?auto_906598 ) ) ( not ( = ?auto_906594 ?auto_906599 ) ) ( not ( = ?auto_906594 ?auto_906600 ) ) ( not ( = ?auto_906594 ?auto_906601 ) ) ( not ( = ?auto_906594 ?auto_906602 ) ) ( not ( = ?auto_906594 ?auto_906603 ) ) ( not ( = ?auto_906595 ?auto_906596 ) ) ( not ( = ?auto_906595 ?auto_906597 ) ) ( not ( = ?auto_906595 ?auto_906598 ) ) ( not ( = ?auto_906595 ?auto_906599 ) ) ( not ( = ?auto_906595 ?auto_906600 ) ) ( not ( = ?auto_906595 ?auto_906601 ) ) ( not ( = ?auto_906595 ?auto_906602 ) ) ( not ( = ?auto_906595 ?auto_906603 ) ) ( not ( = ?auto_906596 ?auto_906597 ) ) ( not ( = ?auto_906596 ?auto_906598 ) ) ( not ( = ?auto_906596 ?auto_906599 ) ) ( not ( = ?auto_906596 ?auto_906600 ) ) ( not ( = ?auto_906596 ?auto_906601 ) ) ( not ( = ?auto_906596 ?auto_906602 ) ) ( not ( = ?auto_906596 ?auto_906603 ) ) ( not ( = ?auto_906597 ?auto_906598 ) ) ( not ( = ?auto_906597 ?auto_906599 ) ) ( not ( = ?auto_906597 ?auto_906600 ) ) ( not ( = ?auto_906597 ?auto_906601 ) ) ( not ( = ?auto_906597 ?auto_906602 ) ) ( not ( = ?auto_906597 ?auto_906603 ) ) ( not ( = ?auto_906598 ?auto_906599 ) ) ( not ( = ?auto_906598 ?auto_906600 ) ) ( not ( = ?auto_906598 ?auto_906601 ) ) ( not ( = ?auto_906598 ?auto_906602 ) ) ( not ( = ?auto_906598 ?auto_906603 ) ) ( not ( = ?auto_906599 ?auto_906600 ) ) ( not ( = ?auto_906599 ?auto_906601 ) ) ( not ( = ?auto_906599 ?auto_906602 ) ) ( not ( = ?auto_906599 ?auto_906603 ) ) ( not ( = ?auto_906600 ?auto_906601 ) ) ( not ( = ?auto_906600 ?auto_906602 ) ) ( not ( = ?auto_906600 ?auto_906603 ) ) ( not ( = ?auto_906601 ?auto_906602 ) ) ( not ( = ?auto_906601 ?auto_906603 ) ) ( not ( = ?auto_906602 ?auto_906603 ) ) ( ON ?auto_906601 ?auto_906602 ) ( ON ?auto_906600 ?auto_906601 ) ( ON ?auto_906599 ?auto_906600 ) ( ON ?auto_906598 ?auto_906599 ) ( ON ?auto_906597 ?auto_906598 ) ( ON ?auto_906596 ?auto_906597 ) ( ON ?auto_906595 ?auto_906596 ) ( ON ?auto_906594 ?auto_906595 ) ( ON ?auto_906593 ?auto_906594 ) ( ON ?auto_906592 ?auto_906593 ) ( ON ?auto_906591 ?auto_906592 ) ( ON ?auto_906590 ?auto_906591 ) ( ON ?auto_906589 ?auto_906590 ) ( ON ?auto_906588 ?auto_906589 ) ( CLEAR ?auto_906586 ) ( ON ?auto_906587 ?auto_906588 ) ( CLEAR ?auto_906587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_906585 ?auto_906586 ?auto_906587 )
      ( MAKE-18PILE ?auto_906585 ?auto_906586 ?auto_906587 ?auto_906588 ?auto_906589 ?auto_906590 ?auto_906591 ?auto_906592 ?auto_906593 ?auto_906594 ?auto_906595 ?auto_906596 ?auto_906597 ?auto_906598 ?auto_906599 ?auto_906600 ?auto_906601 ?auto_906602 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906622 - BLOCK
      ?auto_906623 - BLOCK
      ?auto_906624 - BLOCK
      ?auto_906625 - BLOCK
      ?auto_906626 - BLOCK
      ?auto_906627 - BLOCK
      ?auto_906628 - BLOCK
      ?auto_906629 - BLOCK
      ?auto_906630 - BLOCK
      ?auto_906631 - BLOCK
      ?auto_906632 - BLOCK
      ?auto_906633 - BLOCK
      ?auto_906634 - BLOCK
      ?auto_906635 - BLOCK
      ?auto_906636 - BLOCK
      ?auto_906637 - BLOCK
      ?auto_906638 - BLOCK
      ?auto_906639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_906639 ) ( ON-TABLE ?auto_906622 ) ( ON ?auto_906623 ?auto_906622 ) ( not ( = ?auto_906622 ?auto_906623 ) ) ( not ( = ?auto_906622 ?auto_906624 ) ) ( not ( = ?auto_906622 ?auto_906625 ) ) ( not ( = ?auto_906622 ?auto_906626 ) ) ( not ( = ?auto_906622 ?auto_906627 ) ) ( not ( = ?auto_906622 ?auto_906628 ) ) ( not ( = ?auto_906622 ?auto_906629 ) ) ( not ( = ?auto_906622 ?auto_906630 ) ) ( not ( = ?auto_906622 ?auto_906631 ) ) ( not ( = ?auto_906622 ?auto_906632 ) ) ( not ( = ?auto_906622 ?auto_906633 ) ) ( not ( = ?auto_906622 ?auto_906634 ) ) ( not ( = ?auto_906622 ?auto_906635 ) ) ( not ( = ?auto_906622 ?auto_906636 ) ) ( not ( = ?auto_906622 ?auto_906637 ) ) ( not ( = ?auto_906622 ?auto_906638 ) ) ( not ( = ?auto_906622 ?auto_906639 ) ) ( not ( = ?auto_906623 ?auto_906624 ) ) ( not ( = ?auto_906623 ?auto_906625 ) ) ( not ( = ?auto_906623 ?auto_906626 ) ) ( not ( = ?auto_906623 ?auto_906627 ) ) ( not ( = ?auto_906623 ?auto_906628 ) ) ( not ( = ?auto_906623 ?auto_906629 ) ) ( not ( = ?auto_906623 ?auto_906630 ) ) ( not ( = ?auto_906623 ?auto_906631 ) ) ( not ( = ?auto_906623 ?auto_906632 ) ) ( not ( = ?auto_906623 ?auto_906633 ) ) ( not ( = ?auto_906623 ?auto_906634 ) ) ( not ( = ?auto_906623 ?auto_906635 ) ) ( not ( = ?auto_906623 ?auto_906636 ) ) ( not ( = ?auto_906623 ?auto_906637 ) ) ( not ( = ?auto_906623 ?auto_906638 ) ) ( not ( = ?auto_906623 ?auto_906639 ) ) ( not ( = ?auto_906624 ?auto_906625 ) ) ( not ( = ?auto_906624 ?auto_906626 ) ) ( not ( = ?auto_906624 ?auto_906627 ) ) ( not ( = ?auto_906624 ?auto_906628 ) ) ( not ( = ?auto_906624 ?auto_906629 ) ) ( not ( = ?auto_906624 ?auto_906630 ) ) ( not ( = ?auto_906624 ?auto_906631 ) ) ( not ( = ?auto_906624 ?auto_906632 ) ) ( not ( = ?auto_906624 ?auto_906633 ) ) ( not ( = ?auto_906624 ?auto_906634 ) ) ( not ( = ?auto_906624 ?auto_906635 ) ) ( not ( = ?auto_906624 ?auto_906636 ) ) ( not ( = ?auto_906624 ?auto_906637 ) ) ( not ( = ?auto_906624 ?auto_906638 ) ) ( not ( = ?auto_906624 ?auto_906639 ) ) ( not ( = ?auto_906625 ?auto_906626 ) ) ( not ( = ?auto_906625 ?auto_906627 ) ) ( not ( = ?auto_906625 ?auto_906628 ) ) ( not ( = ?auto_906625 ?auto_906629 ) ) ( not ( = ?auto_906625 ?auto_906630 ) ) ( not ( = ?auto_906625 ?auto_906631 ) ) ( not ( = ?auto_906625 ?auto_906632 ) ) ( not ( = ?auto_906625 ?auto_906633 ) ) ( not ( = ?auto_906625 ?auto_906634 ) ) ( not ( = ?auto_906625 ?auto_906635 ) ) ( not ( = ?auto_906625 ?auto_906636 ) ) ( not ( = ?auto_906625 ?auto_906637 ) ) ( not ( = ?auto_906625 ?auto_906638 ) ) ( not ( = ?auto_906625 ?auto_906639 ) ) ( not ( = ?auto_906626 ?auto_906627 ) ) ( not ( = ?auto_906626 ?auto_906628 ) ) ( not ( = ?auto_906626 ?auto_906629 ) ) ( not ( = ?auto_906626 ?auto_906630 ) ) ( not ( = ?auto_906626 ?auto_906631 ) ) ( not ( = ?auto_906626 ?auto_906632 ) ) ( not ( = ?auto_906626 ?auto_906633 ) ) ( not ( = ?auto_906626 ?auto_906634 ) ) ( not ( = ?auto_906626 ?auto_906635 ) ) ( not ( = ?auto_906626 ?auto_906636 ) ) ( not ( = ?auto_906626 ?auto_906637 ) ) ( not ( = ?auto_906626 ?auto_906638 ) ) ( not ( = ?auto_906626 ?auto_906639 ) ) ( not ( = ?auto_906627 ?auto_906628 ) ) ( not ( = ?auto_906627 ?auto_906629 ) ) ( not ( = ?auto_906627 ?auto_906630 ) ) ( not ( = ?auto_906627 ?auto_906631 ) ) ( not ( = ?auto_906627 ?auto_906632 ) ) ( not ( = ?auto_906627 ?auto_906633 ) ) ( not ( = ?auto_906627 ?auto_906634 ) ) ( not ( = ?auto_906627 ?auto_906635 ) ) ( not ( = ?auto_906627 ?auto_906636 ) ) ( not ( = ?auto_906627 ?auto_906637 ) ) ( not ( = ?auto_906627 ?auto_906638 ) ) ( not ( = ?auto_906627 ?auto_906639 ) ) ( not ( = ?auto_906628 ?auto_906629 ) ) ( not ( = ?auto_906628 ?auto_906630 ) ) ( not ( = ?auto_906628 ?auto_906631 ) ) ( not ( = ?auto_906628 ?auto_906632 ) ) ( not ( = ?auto_906628 ?auto_906633 ) ) ( not ( = ?auto_906628 ?auto_906634 ) ) ( not ( = ?auto_906628 ?auto_906635 ) ) ( not ( = ?auto_906628 ?auto_906636 ) ) ( not ( = ?auto_906628 ?auto_906637 ) ) ( not ( = ?auto_906628 ?auto_906638 ) ) ( not ( = ?auto_906628 ?auto_906639 ) ) ( not ( = ?auto_906629 ?auto_906630 ) ) ( not ( = ?auto_906629 ?auto_906631 ) ) ( not ( = ?auto_906629 ?auto_906632 ) ) ( not ( = ?auto_906629 ?auto_906633 ) ) ( not ( = ?auto_906629 ?auto_906634 ) ) ( not ( = ?auto_906629 ?auto_906635 ) ) ( not ( = ?auto_906629 ?auto_906636 ) ) ( not ( = ?auto_906629 ?auto_906637 ) ) ( not ( = ?auto_906629 ?auto_906638 ) ) ( not ( = ?auto_906629 ?auto_906639 ) ) ( not ( = ?auto_906630 ?auto_906631 ) ) ( not ( = ?auto_906630 ?auto_906632 ) ) ( not ( = ?auto_906630 ?auto_906633 ) ) ( not ( = ?auto_906630 ?auto_906634 ) ) ( not ( = ?auto_906630 ?auto_906635 ) ) ( not ( = ?auto_906630 ?auto_906636 ) ) ( not ( = ?auto_906630 ?auto_906637 ) ) ( not ( = ?auto_906630 ?auto_906638 ) ) ( not ( = ?auto_906630 ?auto_906639 ) ) ( not ( = ?auto_906631 ?auto_906632 ) ) ( not ( = ?auto_906631 ?auto_906633 ) ) ( not ( = ?auto_906631 ?auto_906634 ) ) ( not ( = ?auto_906631 ?auto_906635 ) ) ( not ( = ?auto_906631 ?auto_906636 ) ) ( not ( = ?auto_906631 ?auto_906637 ) ) ( not ( = ?auto_906631 ?auto_906638 ) ) ( not ( = ?auto_906631 ?auto_906639 ) ) ( not ( = ?auto_906632 ?auto_906633 ) ) ( not ( = ?auto_906632 ?auto_906634 ) ) ( not ( = ?auto_906632 ?auto_906635 ) ) ( not ( = ?auto_906632 ?auto_906636 ) ) ( not ( = ?auto_906632 ?auto_906637 ) ) ( not ( = ?auto_906632 ?auto_906638 ) ) ( not ( = ?auto_906632 ?auto_906639 ) ) ( not ( = ?auto_906633 ?auto_906634 ) ) ( not ( = ?auto_906633 ?auto_906635 ) ) ( not ( = ?auto_906633 ?auto_906636 ) ) ( not ( = ?auto_906633 ?auto_906637 ) ) ( not ( = ?auto_906633 ?auto_906638 ) ) ( not ( = ?auto_906633 ?auto_906639 ) ) ( not ( = ?auto_906634 ?auto_906635 ) ) ( not ( = ?auto_906634 ?auto_906636 ) ) ( not ( = ?auto_906634 ?auto_906637 ) ) ( not ( = ?auto_906634 ?auto_906638 ) ) ( not ( = ?auto_906634 ?auto_906639 ) ) ( not ( = ?auto_906635 ?auto_906636 ) ) ( not ( = ?auto_906635 ?auto_906637 ) ) ( not ( = ?auto_906635 ?auto_906638 ) ) ( not ( = ?auto_906635 ?auto_906639 ) ) ( not ( = ?auto_906636 ?auto_906637 ) ) ( not ( = ?auto_906636 ?auto_906638 ) ) ( not ( = ?auto_906636 ?auto_906639 ) ) ( not ( = ?auto_906637 ?auto_906638 ) ) ( not ( = ?auto_906637 ?auto_906639 ) ) ( not ( = ?auto_906638 ?auto_906639 ) ) ( ON ?auto_906638 ?auto_906639 ) ( ON ?auto_906637 ?auto_906638 ) ( ON ?auto_906636 ?auto_906637 ) ( ON ?auto_906635 ?auto_906636 ) ( ON ?auto_906634 ?auto_906635 ) ( ON ?auto_906633 ?auto_906634 ) ( ON ?auto_906632 ?auto_906633 ) ( ON ?auto_906631 ?auto_906632 ) ( ON ?auto_906630 ?auto_906631 ) ( ON ?auto_906629 ?auto_906630 ) ( ON ?auto_906628 ?auto_906629 ) ( ON ?auto_906627 ?auto_906628 ) ( ON ?auto_906626 ?auto_906627 ) ( ON ?auto_906625 ?auto_906626 ) ( CLEAR ?auto_906623 ) ( ON ?auto_906624 ?auto_906625 ) ( CLEAR ?auto_906624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_906622 ?auto_906623 ?auto_906624 )
      ( MAKE-18PILE ?auto_906622 ?auto_906623 ?auto_906624 ?auto_906625 ?auto_906626 ?auto_906627 ?auto_906628 ?auto_906629 ?auto_906630 ?auto_906631 ?auto_906632 ?auto_906633 ?auto_906634 ?auto_906635 ?auto_906636 ?auto_906637 ?auto_906638 ?auto_906639 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906658 - BLOCK
      ?auto_906659 - BLOCK
      ?auto_906660 - BLOCK
      ?auto_906661 - BLOCK
      ?auto_906662 - BLOCK
      ?auto_906663 - BLOCK
      ?auto_906664 - BLOCK
      ?auto_906665 - BLOCK
      ?auto_906666 - BLOCK
      ?auto_906667 - BLOCK
      ?auto_906668 - BLOCK
      ?auto_906669 - BLOCK
      ?auto_906670 - BLOCK
      ?auto_906671 - BLOCK
      ?auto_906672 - BLOCK
      ?auto_906673 - BLOCK
      ?auto_906674 - BLOCK
      ?auto_906675 - BLOCK
    )
    :vars
    (
      ?auto_906676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906675 ?auto_906676 ) ( ON-TABLE ?auto_906658 ) ( not ( = ?auto_906658 ?auto_906659 ) ) ( not ( = ?auto_906658 ?auto_906660 ) ) ( not ( = ?auto_906658 ?auto_906661 ) ) ( not ( = ?auto_906658 ?auto_906662 ) ) ( not ( = ?auto_906658 ?auto_906663 ) ) ( not ( = ?auto_906658 ?auto_906664 ) ) ( not ( = ?auto_906658 ?auto_906665 ) ) ( not ( = ?auto_906658 ?auto_906666 ) ) ( not ( = ?auto_906658 ?auto_906667 ) ) ( not ( = ?auto_906658 ?auto_906668 ) ) ( not ( = ?auto_906658 ?auto_906669 ) ) ( not ( = ?auto_906658 ?auto_906670 ) ) ( not ( = ?auto_906658 ?auto_906671 ) ) ( not ( = ?auto_906658 ?auto_906672 ) ) ( not ( = ?auto_906658 ?auto_906673 ) ) ( not ( = ?auto_906658 ?auto_906674 ) ) ( not ( = ?auto_906658 ?auto_906675 ) ) ( not ( = ?auto_906658 ?auto_906676 ) ) ( not ( = ?auto_906659 ?auto_906660 ) ) ( not ( = ?auto_906659 ?auto_906661 ) ) ( not ( = ?auto_906659 ?auto_906662 ) ) ( not ( = ?auto_906659 ?auto_906663 ) ) ( not ( = ?auto_906659 ?auto_906664 ) ) ( not ( = ?auto_906659 ?auto_906665 ) ) ( not ( = ?auto_906659 ?auto_906666 ) ) ( not ( = ?auto_906659 ?auto_906667 ) ) ( not ( = ?auto_906659 ?auto_906668 ) ) ( not ( = ?auto_906659 ?auto_906669 ) ) ( not ( = ?auto_906659 ?auto_906670 ) ) ( not ( = ?auto_906659 ?auto_906671 ) ) ( not ( = ?auto_906659 ?auto_906672 ) ) ( not ( = ?auto_906659 ?auto_906673 ) ) ( not ( = ?auto_906659 ?auto_906674 ) ) ( not ( = ?auto_906659 ?auto_906675 ) ) ( not ( = ?auto_906659 ?auto_906676 ) ) ( not ( = ?auto_906660 ?auto_906661 ) ) ( not ( = ?auto_906660 ?auto_906662 ) ) ( not ( = ?auto_906660 ?auto_906663 ) ) ( not ( = ?auto_906660 ?auto_906664 ) ) ( not ( = ?auto_906660 ?auto_906665 ) ) ( not ( = ?auto_906660 ?auto_906666 ) ) ( not ( = ?auto_906660 ?auto_906667 ) ) ( not ( = ?auto_906660 ?auto_906668 ) ) ( not ( = ?auto_906660 ?auto_906669 ) ) ( not ( = ?auto_906660 ?auto_906670 ) ) ( not ( = ?auto_906660 ?auto_906671 ) ) ( not ( = ?auto_906660 ?auto_906672 ) ) ( not ( = ?auto_906660 ?auto_906673 ) ) ( not ( = ?auto_906660 ?auto_906674 ) ) ( not ( = ?auto_906660 ?auto_906675 ) ) ( not ( = ?auto_906660 ?auto_906676 ) ) ( not ( = ?auto_906661 ?auto_906662 ) ) ( not ( = ?auto_906661 ?auto_906663 ) ) ( not ( = ?auto_906661 ?auto_906664 ) ) ( not ( = ?auto_906661 ?auto_906665 ) ) ( not ( = ?auto_906661 ?auto_906666 ) ) ( not ( = ?auto_906661 ?auto_906667 ) ) ( not ( = ?auto_906661 ?auto_906668 ) ) ( not ( = ?auto_906661 ?auto_906669 ) ) ( not ( = ?auto_906661 ?auto_906670 ) ) ( not ( = ?auto_906661 ?auto_906671 ) ) ( not ( = ?auto_906661 ?auto_906672 ) ) ( not ( = ?auto_906661 ?auto_906673 ) ) ( not ( = ?auto_906661 ?auto_906674 ) ) ( not ( = ?auto_906661 ?auto_906675 ) ) ( not ( = ?auto_906661 ?auto_906676 ) ) ( not ( = ?auto_906662 ?auto_906663 ) ) ( not ( = ?auto_906662 ?auto_906664 ) ) ( not ( = ?auto_906662 ?auto_906665 ) ) ( not ( = ?auto_906662 ?auto_906666 ) ) ( not ( = ?auto_906662 ?auto_906667 ) ) ( not ( = ?auto_906662 ?auto_906668 ) ) ( not ( = ?auto_906662 ?auto_906669 ) ) ( not ( = ?auto_906662 ?auto_906670 ) ) ( not ( = ?auto_906662 ?auto_906671 ) ) ( not ( = ?auto_906662 ?auto_906672 ) ) ( not ( = ?auto_906662 ?auto_906673 ) ) ( not ( = ?auto_906662 ?auto_906674 ) ) ( not ( = ?auto_906662 ?auto_906675 ) ) ( not ( = ?auto_906662 ?auto_906676 ) ) ( not ( = ?auto_906663 ?auto_906664 ) ) ( not ( = ?auto_906663 ?auto_906665 ) ) ( not ( = ?auto_906663 ?auto_906666 ) ) ( not ( = ?auto_906663 ?auto_906667 ) ) ( not ( = ?auto_906663 ?auto_906668 ) ) ( not ( = ?auto_906663 ?auto_906669 ) ) ( not ( = ?auto_906663 ?auto_906670 ) ) ( not ( = ?auto_906663 ?auto_906671 ) ) ( not ( = ?auto_906663 ?auto_906672 ) ) ( not ( = ?auto_906663 ?auto_906673 ) ) ( not ( = ?auto_906663 ?auto_906674 ) ) ( not ( = ?auto_906663 ?auto_906675 ) ) ( not ( = ?auto_906663 ?auto_906676 ) ) ( not ( = ?auto_906664 ?auto_906665 ) ) ( not ( = ?auto_906664 ?auto_906666 ) ) ( not ( = ?auto_906664 ?auto_906667 ) ) ( not ( = ?auto_906664 ?auto_906668 ) ) ( not ( = ?auto_906664 ?auto_906669 ) ) ( not ( = ?auto_906664 ?auto_906670 ) ) ( not ( = ?auto_906664 ?auto_906671 ) ) ( not ( = ?auto_906664 ?auto_906672 ) ) ( not ( = ?auto_906664 ?auto_906673 ) ) ( not ( = ?auto_906664 ?auto_906674 ) ) ( not ( = ?auto_906664 ?auto_906675 ) ) ( not ( = ?auto_906664 ?auto_906676 ) ) ( not ( = ?auto_906665 ?auto_906666 ) ) ( not ( = ?auto_906665 ?auto_906667 ) ) ( not ( = ?auto_906665 ?auto_906668 ) ) ( not ( = ?auto_906665 ?auto_906669 ) ) ( not ( = ?auto_906665 ?auto_906670 ) ) ( not ( = ?auto_906665 ?auto_906671 ) ) ( not ( = ?auto_906665 ?auto_906672 ) ) ( not ( = ?auto_906665 ?auto_906673 ) ) ( not ( = ?auto_906665 ?auto_906674 ) ) ( not ( = ?auto_906665 ?auto_906675 ) ) ( not ( = ?auto_906665 ?auto_906676 ) ) ( not ( = ?auto_906666 ?auto_906667 ) ) ( not ( = ?auto_906666 ?auto_906668 ) ) ( not ( = ?auto_906666 ?auto_906669 ) ) ( not ( = ?auto_906666 ?auto_906670 ) ) ( not ( = ?auto_906666 ?auto_906671 ) ) ( not ( = ?auto_906666 ?auto_906672 ) ) ( not ( = ?auto_906666 ?auto_906673 ) ) ( not ( = ?auto_906666 ?auto_906674 ) ) ( not ( = ?auto_906666 ?auto_906675 ) ) ( not ( = ?auto_906666 ?auto_906676 ) ) ( not ( = ?auto_906667 ?auto_906668 ) ) ( not ( = ?auto_906667 ?auto_906669 ) ) ( not ( = ?auto_906667 ?auto_906670 ) ) ( not ( = ?auto_906667 ?auto_906671 ) ) ( not ( = ?auto_906667 ?auto_906672 ) ) ( not ( = ?auto_906667 ?auto_906673 ) ) ( not ( = ?auto_906667 ?auto_906674 ) ) ( not ( = ?auto_906667 ?auto_906675 ) ) ( not ( = ?auto_906667 ?auto_906676 ) ) ( not ( = ?auto_906668 ?auto_906669 ) ) ( not ( = ?auto_906668 ?auto_906670 ) ) ( not ( = ?auto_906668 ?auto_906671 ) ) ( not ( = ?auto_906668 ?auto_906672 ) ) ( not ( = ?auto_906668 ?auto_906673 ) ) ( not ( = ?auto_906668 ?auto_906674 ) ) ( not ( = ?auto_906668 ?auto_906675 ) ) ( not ( = ?auto_906668 ?auto_906676 ) ) ( not ( = ?auto_906669 ?auto_906670 ) ) ( not ( = ?auto_906669 ?auto_906671 ) ) ( not ( = ?auto_906669 ?auto_906672 ) ) ( not ( = ?auto_906669 ?auto_906673 ) ) ( not ( = ?auto_906669 ?auto_906674 ) ) ( not ( = ?auto_906669 ?auto_906675 ) ) ( not ( = ?auto_906669 ?auto_906676 ) ) ( not ( = ?auto_906670 ?auto_906671 ) ) ( not ( = ?auto_906670 ?auto_906672 ) ) ( not ( = ?auto_906670 ?auto_906673 ) ) ( not ( = ?auto_906670 ?auto_906674 ) ) ( not ( = ?auto_906670 ?auto_906675 ) ) ( not ( = ?auto_906670 ?auto_906676 ) ) ( not ( = ?auto_906671 ?auto_906672 ) ) ( not ( = ?auto_906671 ?auto_906673 ) ) ( not ( = ?auto_906671 ?auto_906674 ) ) ( not ( = ?auto_906671 ?auto_906675 ) ) ( not ( = ?auto_906671 ?auto_906676 ) ) ( not ( = ?auto_906672 ?auto_906673 ) ) ( not ( = ?auto_906672 ?auto_906674 ) ) ( not ( = ?auto_906672 ?auto_906675 ) ) ( not ( = ?auto_906672 ?auto_906676 ) ) ( not ( = ?auto_906673 ?auto_906674 ) ) ( not ( = ?auto_906673 ?auto_906675 ) ) ( not ( = ?auto_906673 ?auto_906676 ) ) ( not ( = ?auto_906674 ?auto_906675 ) ) ( not ( = ?auto_906674 ?auto_906676 ) ) ( not ( = ?auto_906675 ?auto_906676 ) ) ( ON ?auto_906674 ?auto_906675 ) ( ON ?auto_906673 ?auto_906674 ) ( ON ?auto_906672 ?auto_906673 ) ( ON ?auto_906671 ?auto_906672 ) ( ON ?auto_906670 ?auto_906671 ) ( ON ?auto_906669 ?auto_906670 ) ( ON ?auto_906668 ?auto_906669 ) ( ON ?auto_906667 ?auto_906668 ) ( ON ?auto_906666 ?auto_906667 ) ( ON ?auto_906665 ?auto_906666 ) ( ON ?auto_906664 ?auto_906665 ) ( ON ?auto_906663 ?auto_906664 ) ( ON ?auto_906662 ?auto_906663 ) ( ON ?auto_906661 ?auto_906662 ) ( ON ?auto_906660 ?auto_906661 ) ( CLEAR ?auto_906658 ) ( ON ?auto_906659 ?auto_906660 ) ( CLEAR ?auto_906659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_906658 ?auto_906659 )
      ( MAKE-18PILE ?auto_906658 ?auto_906659 ?auto_906660 ?auto_906661 ?auto_906662 ?auto_906663 ?auto_906664 ?auto_906665 ?auto_906666 ?auto_906667 ?auto_906668 ?auto_906669 ?auto_906670 ?auto_906671 ?auto_906672 ?auto_906673 ?auto_906674 ?auto_906675 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906695 - BLOCK
      ?auto_906696 - BLOCK
      ?auto_906697 - BLOCK
      ?auto_906698 - BLOCK
      ?auto_906699 - BLOCK
      ?auto_906700 - BLOCK
      ?auto_906701 - BLOCK
      ?auto_906702 - BLOCK
      ?auto_906703 - BLOCK
      ?auto_906704 - BLOCK
      ?auto_906705 - BLOCK
      ?auto_906706 - BLOCK
      ?auto_906707 - BLOCK
      ?auto_906708 - BLOCK
      ?auto_906709 - BLOCK
      ?auto_906710 - BLOCK
      ?auto_906711 - BLOCK
      ?auto_906712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_906712 ) ( ON-TABLE ?auto_906695 ) ( not ( = ?auto_906695 ?auto_906696 ) ) ( not ( = ?auto_906695 ?auto_906697 ) ) ( not ( = ?auto_906695 ?auto_906698 ) ) ( not ( = ?auto_906695 ?auto_906699 ) ) ( not ( = ?auto_906695 ?auto_906700 ) ) ( not ( = ?auto_906695 ?auto_906701 ) ) ( not ( = ?auto_906695 ?auto_906702 ) ) ( not ( = ?auto_906695 ?auto_906703 ) ) ( not ( = ?auto_906695 ?auto_906704 ) ) ( not ( = ?auto_906695 ?auto_906705 ) ) ( not ( = ?auto_906695 ?auto_906706 ) ) ( not ( = ?auto_906695 ?auto_906707 ) ) ( not ( = ?auto_906695 ?auto_906708 ) ) ( not ( = ?auto_906695 ?auto_906709 ) ) ( not ( = ?auto_906695 ?auto_906710 ) ) ( not ( = ?auto_906695 ?auto_906711 ) ) ( not ( = ?auto_906695 ?auto_906712 ) ) ( not ( = ?auto_906696 ?auto_906697 ) ) ( not ( = ?auto_906696 ?auto_906698 ) ) ( not ( = ?auto_906696 ?auto_906699 ) ) ( not ( = ?auto_906696 ?auto_906700 ) ) ( not ( = ?auto_906696 ?auto_906701 ) ) ( not ( = ?auto_906696 ?auto_906702 ) ) ( not ( = ?auto_906696 ?auto_906703 ) ) ( not ( = ?auto_906696 ?auto_906704 ) ) ( not ( = ?auto_906696 ?auto_906705 ) ) ( not ( = ?auto_906696 ?auto_906706 ) ) ( not ( = ?auto_906696 ?auto_906707 ) ) ( not ( = ?auto_906696 ?auto_906708 ) ) ( not ( = ?auto_906696 ?auto_906709 ) ) ( not ( = ?auto_906696 ?auto_906710 ) ) ( not ( = ?auto_906696 ?auto_906711 ) ) ( not ( = ?auto_906696 ?auto_906712 ) ) ( not ( = ?auto_906697 ?auto_906698 ) ) ( not ( = ?auto_906697 ?auto_906699 ) ) ( not ( = ?auto_906697 ?auto_906700 ) ) ( not ( = ?auto_906697 ?auto_906701 ) ) ( not ( = ?auto_906697 ?auto_906702 ) ) ( not ( = ?auto_906697 ?auto_906703 ) ) ( not ( = ?auto_906697 ?auto_906704 ) ) ( not ( = ?auto_906697 ?auto_906705 ) ) ( not ( = ?auto_906697 ?auto_906706 ) ) ( not ( = ?auto_906697 ?auto_906707 ) ) ( not ( = ?auto_906697 ?auto_906708 ) ) ( not ( = ?auto_906697 ?auto_906709 ) ) ( not ( = ?auto_906697 ?auto_906710 ) ) ( not ( = ?auto_906697 ?auto_906711 ) ) ( not ( = ?auto_906697 ?auto_906712 ) ) ( not ( = ?auto_906698 ?auto_906699 ) ) ( not ( = ?auto_906698 ?auto_906700 ) ) ( not ( = ?auto_906698 ?auto_906701 ) ) ( not ( = ?auto_906698 ?auto_906702 ) ) ( not ( = ?auto_906698 ?auto_906703 ) ) ( not ( = ?auto_906698 ?auto_906704 ) ) ( not ( = ?auto_906698 ?auto_906705 ) ) ( not ( = ?auto_906698 ?auto_906706 ) ) ( not ( = ?auto_906698 ?auto_906707 ) ) ( not ( = ?auto_906698 ?auto_906708 ) ) ( not ( = ?auto_906698 ?auto_906709 ) ) ( not ( = ?auto_906698 ?auto_906710 ) ) ( not ( = ?auto_906698 ?auto_906711 ) ) ( not ( = ?auto_906698 ?auto_906712 ) ) ( not ( = ?auto_906699 ?auto_906700 ) ) ( not ( = ?auto_906699 ?auto_906701 ) ) ( not ( = ?auto_906699 ?auto_906702 ) ) ( not ( = ?auto_906699 ?auto_906703 ) ) ( not ( = ?auto_906699 ?auto_906704 ) ) ( not ( = ?auto_906699 ?auto_906705 ) ) ( not ( = ?auto_906699 ?auto_906706 ) ) ( not ( = ?auto_906699 ?auto_906707 ) ) ( not ( = ?auto_906699 ?auto_906708 ) ) ( not ( = ?auto_906699 ?auto_906709 ) ) ( not ( = ?auto_906699 ?auto_906710 ) ) ( not ( = ?auto_906699 ?auto_906711 ) ) ( not ( = ?auto_906699 ?auto_906712 ) ) ( not ( = ?auto_906700 ?auto_906701 ) ) ( not ( = ?auto_906700 ?auto_906702 ) ) ( not ( = ?auto_906700 ?auto_906703 ) ) ( not ( = ?auto_906700 ?auto_906704 ) ) ( not ( = ?auto_906700 ?auto_906705 ) ) ( not ( = ?auto_906700 ?auto_906706 ) ) ( not ( = ?auto_906700 ?auto_906707 ) ) ( not ( = ?auto_906700 ?auto_906708 ) ) ( not ( = ?auto_906700 ?auto_906709 ) ) ( not ( = ?auto_906700 ?auto_906710 ) ) ( not ( = ?auto_906700 ?auto_906711 ) ) ( not ( = ?auto_906700 ?auto_906712 ) ) ( not ( = ?auto_906701 ?auto_906702 ) ) ( not ( = ?auto_906701 ?auto_906703 ) ) ( not ( = ?auto_906701 ?auto_906704 ) ) ( not ( = ?auto_906701 ?auto_906705 ) ) ( not ( = ?auto_906701 ?auto_906706 ) ) ( not ( = ?auto_906701 ?auto_906707 ) ) ( not ( = ?auto_906701 ?auto_906708 ) ) ( not ( = ?auto_906701 ?auto_906709 ) ) ( not ( = ?auto_906701 ?auto_906710 ) ) ( not ( = ?auto_906701 ?auto_906711 ) ) ( not ( = ?auto_906701 ?auto_906712 ) ) ( not ( = ?auto_906702 ?auto_906703 ) ) ( not ( = ?auto_906702 ?auto_906704 ) ) ( not ( = ?auto_906702 ?auto_906705 ) ) ( not ( = ?auto_906702 ?auto_906706 ) ) ( not ( = ?auto_906702 ?auto_906707 ) ) ( not ( = ?auto_906702 ?auto_906708 ) ) ( not ( = ?auto_906702 ?auto_906709 ) ) ( not ( = ?auto_906702 ?auto_906710 ) ) ( not ( = ?auto_906702 ?auto_906711 ) ) ( not ( = ?auto_906702 ?auto_906712 ) ) ( not ( = ?auto_906703 ?auto_906704 ) ) ( not ( = ?auto_906703 ?auto_906705 ) ) ( not ( = ?auto_906703 ?auto_906706 ) ) ( not ( = ?auto_906703 ?auto_906707 ) ) ( not ( = ?auto_906703 ?auto_906708 ) ) ( not ( = ?auto_906703 ?auto_906709 ) ) ( not ( = ?auto_906703 ?auto_906710 ) ) ( not ( = ?auto_906703 ?auto_906711 ) ) ( not ( = ?auto_906703 ?auto_906712 ) ) ( not ( = ?auto_906704 ?auto_906705 ) ) ( not ( = ?auto_906704 ?auto_906706 ) ) ( not ( = ?auto_906704 ?auto_906707 ) ) ( not ( = ?auto_906704 ?auto_906708 ) ) ( not ( = ?auto_906704 ?auto_906709 ) ) ( not ( = ?auto_906704 ?auto_906710 ) ) ( not ( = ?auto_906704 ?auto_906711 ) ) ( not ( = ?auto_906704 ?auto_906712 ) ) ( not ( = ?auto_906705 ?auto_906706 ) ) ( not ( = ?auto_906705 ?auto_906707 ) ) ( not ( = ?auto_906705 ?auto_906708 ) ) ( not ( = ?auto_906705 ?auto_906709 ) ) ( not ( = ?auto_906705 ?auto_906710 ) ) ( not ( = ?auto_906705 ?auto_906711 ) ) ( not ( = ?auto_906705 ?auto_906712 ) ) ( not ( = ?auto_906706 ?auto_906707 ) ) ( not ( = ?auto_906706 ?auto_906708 ) ) ( not ( = ?auto_906706 ?auto_906709 ) ) ( not ( = ?auto_906706 ?auto_906710 ) ) ( not ( = ?auto_906706 ?auto_906711 ) ) ( not ( = ?auto_906706 ?auto_906712 ) ) ( not ( = ?auto_906707 ?auto_906708 ) ) ( not ( = ?auto_906707 ?auto_906709 ) ) ( not ( = ?auto_906707 ?auto_906710 ) ) ( not ( = ?auto_906707 ?auto_906711 ) ) ( not ( = ?auto_906707 ?auto_906712 ) ) ( not ( = ?auto_906708 ?auto_906709 ) ) ( not ( = ?auto_906708 ?auto_906710 ) ) ( not ( = ?auto_906708 ?auto_906711 ) ) ( not ( = ?auto_906708 ?auto_906712 ) ) ( not ( = ?auto_906709 ?auto_906710 ) ) ( not ( = ?auto_906709 ?auto_906711 ) ) ( not ( = ?auto_906709 ?auto_906712 ) ) ( not ( = ?auto_906710 ?auto_906711 ) ) ( not ( = ?auto_906710 ?auto_906712 ) ) ( not ( = ?auto_906711 ?auto_906712 ) ) ( ON ?auto_906711 ?auto_906712 ) ( ON ?auto_906710 ?auto_906711 ) ( ON ?auto_906709 ?auto_906710 ) ( ON ?auto_906708 ?auto_906709 ) ( ON ?auto_906707 ?auto_906708 ) ( ON ?auto_906706 ?auto_906707 ) ( ON ?auto_906705 ?auto_906706 ) ( ON ?auto_906704 ?auto_906705 ) ( ON ?auto_906703 ?auto_906704 ) ( ON ?auto_906702 ?auto_906703 ) ( ON ?auto_906701 ?auto_906702 ) ( ON ?auto_906700 ?auto_906701 ) ( ON ?auto_906699 ?auto_906700 ) ( ON ?auto_906698 ?auto_906699 ) ( ON ?auto_906697 ?auto_906698 ) ( CLEAR ?auto_906695 ) ( ON ?auto_906696 ?auto_906697 ) ( CLEAR ?auto_906696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_906695 ?auto_906696 )
      ( MAKE-18PILE ?auto_906695 ?auto_906696 ?auto_906697 ?auto_906698 ?auto_906699 ?auto_906700 ?auto_906701 ?auto_906702 ?auto_906703 ?auto_906704 ?auto_906705 ?auto_906706 ?auto_906707 ?auto_906708 ?auto_906709 ?auto_906710 ?auto_906711 ?auto_906712 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906731 - BLOCK
      ?auto_906732 - BLOCK
      ?auto_906733 - BLOCK
      ?auto_906734 - BLOCK
      ?auto_906735 - BLOCK
      ?auto_906736 - BLOCK
      ?auto_906737 - BLOCK
      ?auto_906738 - BLOCK
      ?auto_906739 - BLOCK
      ?auto_906740 - BLOCK
      ?auto_906741 - BLOCK
      ?auto_906742 - BLOCK
      ?auto_906743 - BLOCK
      ?auto_906744 - BLOCK
      ?auto_906745 - BLOCK
      ?auto_906746 - BLOCK
      ?auto_906747 - BLOCK
      ?auto_906748 - BLOCK
    )
    :vars
    (
      ?auto_906749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_906748 ?auto_906749 ) ( not ( = ?auto_906731 ?auto_906732 ) ) ( not ( = ?auto_906731 ?auto_906733 ) ) ( not ( = ?auto_906731 ?auto_906734 ) ) ( not ( = ?auto_906731 ?auto_906735 ) ) ( not ( = ?auto_906731 ?auto_906736 ) ) ( not ( = ?auto_906731 ?auto_906737 ) ) ( not ( = ?auto_906731 ?auto_906738 ) ) ( not ( = ?auto_906731 ?auto_906739 ) ) ( not ( = ?auto_906731 ?auto_906740 ) ) ( not ( = ?auto_906731 ?auto_906741 ) ) ( not ( = ?auto_906731 ?auto_906742 ) ) ( not ( = ?auto_906731 ?auto_906743 ) ) ( not ( = ?auto_906731 ?auto_906744 ) ) ( not ( = ?auto_906731 ?auto_906745 ) ) ( not ( = ?auto_906731 ?auto_906746 ) ) ( not ( = ?auto_906731 ?auto_906747 ) ) ( not ( = ?auto_906731 ?auto_906748 ) ) ( not ( = ?auto_906731 ?auto_906749 ) ) ( not ( = ?auto_906732 ?auto_906733 ) ) ( not ( = ?auto_906732 ?auto_906734 ) ) ( not ( = ?auto_906732 ?auto_906735 ) ) ( not ( = ?auto_906732 ?auto_906736 ) ) ( not ( = ?auto_906732 ?auto_906737 ) ) ( not ( = ?auto_906732 ?auto_906738 ) ) ( not ( = ?auto_906732 ?auto_906739 ) ) ( not ( = ?auto_906732 ?auto_906740 ) ) ( not ( = ?auto_906732 ?auto_906741 ) ) ( not ( = ?auto_906732 ?auto_906742 ) ) ( not ( = ?auto_906732 ?auto_906743 ) ) ( not ( = ?auto_906732 ?auto_906744 ) ) ( not ( = ?auto_906732 ?auto_906745 ) ) ( not ( = ?auto_906732 ?auto_906746 ) ) ( not ( = ?auto_906732 ?auto_906747 ) ) ( not ( = ?auto_906732 ?auto_906748 ) ) ( not ( = ?auto_906732 ?auto_906749 ) ) ( not ( = ?auto_906733 ?auto_906734 ) ) ( not ( = ?auto_906733 ?auto_906735 ) ) ( not ( = ?auto_906733 ?auto_906736 ) ) ( not ( = ?auto_906733 ?auto_906737 ) ) ( not ( = ?auto_906733 ?auto_906738 ) ) ( not ( = ?auto_906733 ?auto_906739 ) ) ( not ( = ?auto_906733 ?auto_906740 ) ) ( not ( = ?auto_906733 ?auto_906741 ) ) ( not ( = ?auto_906733 ?auto_906742 ) ) ( not ( = ?auto_906733 ?auto_906743 ) ) ( not ( = ?auto_906733 ?auto_906744 ) ) ( not ( = ?auto_906733 ?auto_906745 ) ) ( not ( = ?auto_906733 ?auto_906746 ) ) ( not ( = ?auto_906733 ?auto_906747 ) ) ( not ( = ?auto_906733 ?auto_906748 ) ) ( not ( = ?auto_906733 ?auto_906749 ) ) ( not ( = ?auto_906734 ?auto_906735 ) ) ( not ( = ?auto_906734 ?auto_906736 ) ) ( not ( = ?auto_906734 ?auto_906737 ) ) ( not ( = ?auto_906734 ?auto_906738 ) ) ( not ( = ?auto_906734 ?auto_906739 ) ) ( not ( = ?auto_906734 ?auto_906740 ) ) ( not ( = ?auto_906734 ?auto_906741 ) ) ( not ( = ?auto_906734 ?auto_906742 ) ) ( not ( = ?auto_906734 ?auto_906743 ) ) ( not ( = ?auto_906734 ?auto_906744 ) ) ( not ( = ?auto_906734 ?auto_906745 ) ) ( not ( = ?auto_906734 ?auto_906746 ) ) ( not ( = ?auto_906734 ?auto_906747 ) ) ( not ( = ?auto_906734 ?auto_906748 ) ) ( not ( = ?auto_906734 ?auto_906749 ) ) ( not ( = ?auto_906735 ?auto_906736 ) ) ( not ( = ?auto_906735 ?auto_906737 ) ) ( not ( = ?auto_906735 ?auto_906738 ) ) ( not ( = ?auto_906735 ?auto_906739 ) ) ( not ( = ?auto_906735 ?auto_906740 ) ) ( not ( = ?auto_906735 ?auto_906741 ) ) ( not ( = ?auto_906735 ?auto_906742 ) ) ( not ( = ?auto_906735 ?auto_906743 ) ) ( not ( = ?auto_906735 ?auto_906744 ) ) ( not ( = ?auto_906735 ?auto_906745 ) ) ( not ( = ?auto_906735 ?auto_906746 ) ) ( not ( = ?auto_906735 ?auto_906747 ) ) ( not ( = ?auto_906735 ?auto_906748 ) ) ( not ( = ?auto_906735 ?auto_906749 ) ) ( not ( = ?auto_906736 ?auto_906737 ) ) ( not ( = ?auto_906736 ?auto_906738 ) ) ( not ( = ?auto_906736 ?auto_906739 ) ) ( not ( = ?auto_906736 ?auto_906740 ) ) ( not ( = ?auto_906736 ?auto_906741 ) ) ( not ( = ?auto_906736 ?auto_906742 ) ) ( not ( = ?auto_906736 ?auto_906743 ) ) ( not ( = ?auto_906736 ?auto_906744 ) ) ( not ( = ?auto_906736 ?auto_906745 ) ) ( not ( = ?auto_906736 ?auto_906746 ) ) ( not ( = ?auto_906736 ?auto_906747 ) ) ( not ( = ?auto_906736 ?auto_906748 ) ) ( not ( = ?auto_906736 ?auto_906749 ) ) ( not ( = ?auto_906737 ?auto_906738 ) ) ( not ( = ?auto_906737 ?auto_906739 ) ) ( not ( = ?auto_906737 ?auto_906740 ) ) ( not ( = ?auto_906737 ?auto_906741 ) ) ( not ( = ?auto_906737 ?auto_906742 ) ) ( not ( = ?auto_906737 ?auto_906743 ) ) ( not ( = ?auto_906737 ?auto_906744 ) ) ( not ( = ?auto_906737 ?auto_906745 ) ) ( not ( = ?auto_906737 ?auto_906746 ) ) ( not ( = ?auto_906737 ?auto_906747 ) ) ( not ( = ?auto_906737 ?auto_906748 ) ) ( not ( = ?auto_906737 ?auto_906749 ) ) ( not ( = ?auto_906738 ?auto_906739 ) ) ( not ( = ?auto_906738 ?auto_906740 ) ) ( not ( = ?auto_906738 ?auto_906741 ) ) ( not ( = ?auto_906738 ?auto_906742 ) ) ( not ( = ?auto_906738 ?auto_906743 ) ) ( not ( = ?auto_906738 ?auto_906744 ) ) ( not ( = ?auto_906738 ?auto_906745 ) ) ( not ( = ?auto_906738 ?auto_906746 ) ) ( not ( = ?auto_906738 ?auto_906747 ) ) ( not ( = ?auto_906738 ?auto_906748 ) ) ( not ( = ?auto_906738 ?auto_906749 ) ) ( not ( = ?auto_906739 ?auto_906740 ) ) ( not ( = ?auto_906739 ?auto_906741 ) ) ( not ( = ?auto_906739 ?auto_906742 ) ) ( not ( = ?auto_906739 ?auto_906743 ) ) ( not ( = ?auto_906739 ?auto_906744 ) ) ( not ( = ?auto_906739 ?auto_906745 ) ) ( not ( = ?auto_906739 ?auto_906746 ) ) ( not ( = ?auto_906739 ?auto_906747 ) ) ( not ( = ?auto_906739 ?auto_906748 ) ) ( not ( = ?auto_906739 ?auto_906749 ) ) ( not ( = ?auto_906740 ?auto_906741 ) ) ( not ( = ?auto_906740 ?auto_906742 ) ) ( not ( = ?auto_906740 ?auto_906743 ) ) ( not ( = ?auto_906740 ?auto_906744 ) ) ( not ( = ?auto_906740 ?auto_906745 ) ) ( not ( = ?auto_906740 ?auto_906746 ) ) ( not ( = ?auto_906740 ?auto_906747 ) ) ( not ( = ?auto_906740 ?auto_906748 ) ) ( not ( = ?auto_906740 ?auto_906749 ) ) ( not ( = ?auto_906741 ?auto_906742 ) ) ( not ( = ?auto_906741 ?auto_906743 ) ) ( not ( = ?auto_906741 ?auto_906744 ) ) ( not ( = ?auto_906741 ?auto_906745 ) ) ( not ( = ?auto_906741 ?auto_906746 ) ) ( not ( = ?auto_906741 ?auto_906747 ) ) ( not ( = ?auto_906741 ?auto_906748 ) ) ( not ( = ?auto_906741 ?auto_906749 ) ) ( not ( = ?auto_906742 ?auto_906743 ) ) ( not ( = ?auto_906742 ?auto_906744 ) ) ( not ( = ?auto_906742 ?auto_906745 ) ) ( not ( = ?auto_906742 ?auto_906746 ) ) ( not ( = ?auto_906742 ?auto_906747 ) ) ( not ( = ?auto_906742 ?auto_906748 ) ) ( not ( = ?auto_906742 ?auto_906749 ) ) ( not ( = ?auto_906743 ?auto_906744 ) ) ( not ( = ?auto_906743 ?auto_906745 ) ) ( not ( = ?auto_906743 ?auto_906746 ) ) ( not ( = ?auto_906743 ?auto_906747 ) ) ( not ( = ?auto_906743 ?auto_906748 ) ) ( not ( = ?auto_906743 ?auto_906749 ) ) ( not ( = ?auto_906744 ?auto_906745 ) ) ( not ( = ?auto_906744 ?auto_906746 ) ) ( not ( = ?auto_906744 ?auto_906747 ) ) ( not ( = ?auto_906744 ?auto_906748 ) ) ( not ( = ?auto_906744 ?auto_906749 ) ) ( not ( = ?auto_906745 ?auto_906746 ) ) ( not ( = ?auto_906745 ?auto_906747 ) ) ( not ( = ?auto_906745 ?auto_906748 ) ) ( not ( = ?auto_906745 ?auto_906749 ) ) ( not ( = ?auto_906746 ?auto_906747 ) ) ( not ( = ?auto_906746 ?auto_906748 ) ) ( not ( = ?auto_906746 ?auto_906749 ) ) ( not ( = ?auto_906747 ?auto_906748 ) ) ( not ( = ?auto_906747 ?auto_906749 ) ) ( not ( = ?auto_906748 ?auto_906749 ) ) ( ON ?auto_906747 ?auto_906748 ) ( ON ?auto_906746 ?auto_906747 ) ( ON ?auto_906745 ?auto_906746 ) ( ON ?auto_906744 ?auto_906745 ) ( ON ?auto_906743 ?auto_906744 ) ( ON ?auto_906742 ?auto_906743 ) ( ON ?auto_906741 ?auto_906742 ) ( ON ?auto_906740 ?auto_906741 ) ( ON ?auto_906739 ?auto_906740 ) ( ON ?auto_906738 ?auto_906739 ) ( ON ?auto_906737 ?auto_906738 ) ( ON ?auto_906736 ?auto_906737 ) ( ON ?auto_906735 ?auto_906736 ) ( ON ?auto_906734 ?auto_906735 ) ( ON ?auto_906733 ?auto_906734 ) ( ON ?auto_906732 ?auto_906733 ) ( ON ?auto_906731 ?auto_906732 ) ( CLEAR ?auto_906731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_906731 )
      ( MAKE-18PILE ?auto_906731 ?auto_906732 ?auto_906733 ?auto_906734 ?auto_906735 ?auto_906736 ?auto_906737 ?auto_906738 ?auto_906739 ?auto_906740 ?auto_906741 ?auto_906742 ?auto_906743 ?auto_906744 ?auto_906745 ?auto_906746 ?auto_906747 ?auto_906748 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906768 - BLOCK
      ?auto_906769 - BLOCK
      ?auto_906770 - BLOCK
      ?auto_906771 - BLOCK
      ?auto_906772 - BLOCK
      ?auto_906773 - BLOCK
      ?auto_906774 - BLOCK
      ?auto_906775 - BLOCK
      ?auto_906776 - BLOCK
      ?auto_906777 - BLOCK
      ?auto_906778 - BLOCK
      ?auto_906779 - BLOCK
      ?auto_906780 - BLOCK
      ?auto_906781 - BLOCK
      ?auto_906782 - BLOCK
      ?auto_906783 - BLOCK
      ?auto_906784 - BLOCK
      ?auto_906785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_906785 ) ( not ( = ?auto_906768 ?auto_906769 ) ) ( not ( = ?auto_906768 ?auto_906770 ) ) ( not ( = ?auto_906768 ?auto_906771 ) ) ( not ( = ?auto_906768 ?auto_906772 ) ) ( not ( = ?auto_906768 ?auto_906773 ) ) ( not ( = ?auto_906768 ?auto_906774 ) ) ( not ( = ?auto_906768 ?auto_906775 ) ) ( not ( = ?auto_906768 ?auto_906776 ) ) ( not ( = ?auto_906768 ?auto_906777 ) ) ( not ( = ?auto_906768 ?auto_906778 ) ) ( not ( = ?auto_906768 ?auto_906779 ) ) ( not ( = ?auto_906768 ?auto_906780 ) ) ( not ( = ?auto_906768 ?auto_906781 ) ) ( not ( = ?auto_906768 ?auto_906782 ) ) ( not ( = ?auto_906768 ?auto_906783 ) ) ( not ( = ?auto_906768 ?auto_906784 ) ) ( not ( = ?auto_906768 ?auto_906785 ) ) ( not ( = ?auto_906769 ?auto_906770 ) ) ( not ( = ?auto_906769 ?auto_906771 ) ) ( not ( = ?auto_906769 ?auto_906772 ) ) ( not ( = ?auto_906769 ?auto_906773 ) ) ( not ( = ?auto_906769 ?auto_906774 ) ) ( not ( = ?auto_906769 ?auto_906775 ) ) ( not ( = ?auto_906769 ?auto_906776 ) ) ( not ( = ?auto_906769 ?auto_906777 ) ) ( not ( = ?auto_906769 ?auto_906778 ) ) ( not ( = ?auto_906769 ?auto_906779 ) ) ( not ( = ?auto_906769 ?auto_906780 ) ) ( not ( = ?auto_906769 ?auto_906781 ) ) ( not ( = ?auto_906769 ?auto_906782 ) ) ( not ( = ?auto_906769 ?auto_906783 ) ) ( not ( = ?auto_906769 ?auto_906784 ) ) ( not ( = ?auto_906769 ?auto_906785 ) ) ( not ( = ?auto_906770 ?auto_906771 ) ) ( not ( = ?auto_906770 ?auto_906772 ) ) ( not ( = ?auto_906770 ?auto_906773 ) ) ( not ( = ?auto_906770 ?auto_906774 ) ) ( not ( = ?auto_906770 ?auto_906775 ) ) ( not ( = ?auto_906770 ?auto_906776 ) ) ( not ( = ?auto_906770 ?auto_906777 ) ) ( not ( = ?auto_906770 ?auto_906778 ) ) ( not ( = ?auto_906770 ?auto_906779 ) ) ( not ( = ?auto_906770 ?auto_906780 ) ) ( not ( = ?auto_906770 ?auto_906781 ) ) ( not ( = ?auto_906770 ?auto_906782 ) ) ( not ( = ?auto_906770 ?auto_906783 ) ) ( not ( = ?auto_906770 ?auto_906784 ) ) ( not ( = ?auto_906770 ?auto_906785 ) ) ( not ( = ?auto_906771 ?auto_906772 ) ) ( not ( = ?auto_906771 ?auto_906773 ) ) ( not ( = ?auto_906771 ?auto_906774 ) ) ( not ( = ?auto_906771 ?auto_906775 ) ) ( not ( = ?auto_906771 ?auto_906776 ) ) ( not ( = ?auto_906771 ?auto_906777 ) ) ( not ( = ?auto_906771 ?auto_906778 ) ) ( not ( = ?auto_906771 ?auto_906779 ) ) ( not ( = ?auto_906771 ?auto_906780 ) ) ( not ( = ?auto_906771 ?auto_906781 ) ) ( not ( = ?auto_906771 ?auto_906782 ) ) ( not ( = ?auto_906771 ?auto_906783 ) ) ( not ( = ?auto_906771 ?auto_906784 ) ) ( not ( = ?auto_906771 ?auto_906785 ) ) ( not ( = ?auto_906772 ?auto_906773 ) ) ( not ( = ?auto_906772 ?auto_906774 ) ) ( not ( = ?auto_906772 ?auto_906775 ) ) ( not ( = ?auto_906772 ?auto_906776 ) ) ( not ( = ?auto_906772 ?auto_906777 ) ) ( not ( = ?auto_906772 ?auto_906778 ) ) ( not ( = ?auto_906772 ?auto_906779 ) ) ( not ( = ?auto_906772 ?auto_906780 ) ) ( not ( = ?auto_906772 ?auto_906781 ) ) ( not ( = ?auto_906772 ?auto_906782 ) ) ( not ( = ?auto_906772 ?auto_906783 ) ) ( not ( = ?auto_906772 ?auto_906784 ) ) ( not ( = ?auto_906772 ?auto_906785 ) ) ( not ( = ?auto_906773 ?auto_906774 ) ) ( not ( = ?auto_906773 ?auto_906775 ) ) ( not ( = ?auto_906773 ?auto_906776 ) ) ( not ( = ?auto_906773 ?auto_906777 ) ) ( not ( = ?auto_906773 ?auto_906778 ) ) ( not ( = ?auto_906773 ?auto_906779 ) ) ( not ( = ?auto_906773 ?auto_906780 ) ) ( not ( = ?auto_906773 ?auto_906781 ) ) ( not ( = ?auto_906773 ?auto_906782 ) ) ( not ( = ?auto_906773 ?auto_906783 ) ) ( not ( = ?auto_906773 ?auto_906784 ) ) ( not ( = ?auto_906773 ?auto_906785 ) ) ( not ( = ?auto_906774 ?auto_906775 ) ) ( not ( = ?auto_906774 ?auto_906776 ) ) ( not ( = ?auto_906774 ?auto_906777 ) ) ( not ( = ?auto_906774 ?auto_906778 ) ) ( not ( = ?auto_906774 ?auto_906779 ) ) ( not ( = ?auto_906774 ?auto_906780 ) ) ( not ( = ?auto_906774 ?auto_906781 ) ) ( not ( = ?auto_906774 ?auto_906782 ) ) ( not ( = ?auto_906774 ?auto_906783 ) ) ( not ( = ?auto_906774 ?auto_906784 ) ) ( not ( = ?auto_906774 ?auto_906785 ) ) ( not ( = ?auto_906775 ?auto_906776 ) ) ( not ( = ?auto_906775 ?auto_906777 ) ) ( not ( = ?auto_906775 ?auto_906778 ) ) ( not ( = ?auto_906775 ?auto_906779 ) ) ( not ( = ?auto_906775 ?auto_906780 ) ) ( not ( = ?auto_906775 ?auto_906781 ) ) ( not ( = ?auto_906775 ?auto_906782 ) ) ( not ( = ?auto_906775 ?auto_906783 ) ) ( not ( = ?auto_906775 ?auto_906784 ) ) ( not ( = ?auto_906775 ?auto_906785 ) ) ( not ( = ?auto_906776 ?auto_906777 ) ) ( not ( = ?auto_906776 ?auto_906778 ) ) ( not ( = ?auto_906776 ?auto_906779 ) ) ( not ( = ?auto_906776 ?auto_906780 ) ) ( not ( = ?auto_906776 ?auto_906781 ) ) ( not ( = ?auto_906776 ?auto_906782 ) ) ( not ( = ?auto_906776 ?auto_906783 ) ) ( not ( = ?auto_906776 ?auto_906784 ) ) ( not ( = ?auto_906776 ?auto_906785 ) ) ( not ( = ?auto_906777 ?auto_906778 ) ) ( not ( = ?auto_906777 ?auto_906779 ) ) ( not ( = ?auto_906777 ?auto_906780 ) ) ( not ( = ?auto_906777 ?auto_906781 ) ) ( not ( = ?auto_906777 ?auto_906782 ) ) ( not ( = ?auto_906777 ?auto_906783 ) ) ( not ( = ?auto_906777 ?auto_906784 ) ) ( not ( = ?auto_906777 ?auto_906785 ) ) ( not ( = ?auto_906778 ?auto_906779 ) ) ( not ( = ?auto_906778 ?auto_906780 ) ) ( not ( = ?auto_906778 ?auto_906781 ) ) ( not ( = ?auto_906778 ?auto_906782 ) ) ( not ( = ?auto_906778 ?auto_906783 ) ) ( not ( = ?auto_906778 ?auto_906784 ) ) ( not ( = ?auto_906778 ?auto_906785 ) ) ( not ( = ?auto_906779 ?auto_906780 ) ) ( not ( = ?auto_906779 ?auto_906781 ) ) ( not ( = ?auto_906779 ?auto_906782 ) ) ( not ( = ?auto_906779 ?auto_906783 ) ) ( not ( = ?auto_906779 ?auto_906784 ) ) ( not ( = ?auto_906779 ?auto_906785 ) ) ( not ( = ?auto_906780 ?auto_906781 ) ) ( not ( = ?auto_906780 ?auto_906782 ) ) ( not ( = ?auto_906780 ?auto_906783 ) ) ( not ( = ?auto_906780 ?auto_906784 ) ) ( not ( = ?auto_906780 ?auto_906785 ) ) ( not ( = ?auto_906781 ?auto_906782 ) ) ( not ( = ?auto_906781 ?auto_906783 ) ) ( not ( = ?auto_906781 ?auto_906784 ) ) ( not ( = ?auto_906781 ?auto_906785 ) ) ( not ( = ?auto_906782 ?auto_906783 ) ) ( not ( = ?auto_906782 ?auto_906784 ) ) ( not ( = ?auto_906782 ?auto_906785 ) ) ( not ( = ?auto_906783 ?auto_906784 ) ) ( not ( = ?auto_906783 ?auto_906785 ) ) ( not ( = ?auto_906784 ?auto_906785 ) ) ( ON ?auto_906784 ?auto_906785 ) ( ON ?auto_906783 ?auto_906784 ) ( ON ?auto_906782 ?auto_906783 ) ( ON ?auto_906781 ?auto_906782 ) ( ON ?auto_906780 ?auto_906781 ) ( ON ?auto_906779 ?auto_906780 ) ( ON ?auto_906778 ?auto_906779 ) ( ON ?auto_906777 ?auto_906778 ) ( ON ?auto_906776 ?auto_906777 ) ( ON ?auto_906775 ?auto_906776 ) ( ON ?auto_906774 ?auto_906775 ) ( ON ?auto_906773 ?auto_906774 ) ( ON ?auto_906772 ?auto_906773 ) ( ON ?auto_906771 ?auto_906772 ) ( ON ?auto_906770 ?auto_906771 ) ( ON ?auto_906769 ?auto_906770 ) ( ON ?auto_906768 ?auto_906769 ) ( CLEAR ?auto_906768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_906768 )
      ( MAKE-18PILE ?auto_906768 ?auto_906769 ?auto_906770 ?auto_906771 ?auto_906772 ?auto_906773 ?auto_906774 ?auto_906775 ?auto_906776 ?auto_906777 ?auto_906778 ?auto_906779 ?auto_906780 ?auto_906781 ?auto_906782 ?auto_906783 ?auto_906784 ?auto_906785 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_906804 - BLOCK
      ?auto_906805 - BLOCK
      ?auto_906806 - BLOCK
      ?auto_906807 - BLOCK
      ?auto_906808 - BLOCK
      ?auto_906809 - BLOCK
      ?auto_906810 - BLOCK
      ?auto_906811 - BLOCK
      ?auto_906812 - BLOCK
      ?auto_906813 - BLOCK
      ?auto_906814 - BLOCK
      ?auto_906815 - BLOCK
      ?auto_906816 - BLOCK
      ?auto_906817 - BLOCK
      ?auto_906818 - BLOCK
      ?auto_906819 - BLOCK
      ?auto_906820 - BLOCK
      ?auto_906821 - BLOCK
    )
    :vars
    (
      ?auto_906822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_906804 ?auto_906805 ) ) ( not ( = ?auto_906804 ?auto_906806 ) ) ( not ( = ?auto_906804 ?auto_906807 ) ) ( not ( = ?auto_906804 ?auto_906808 ) ) ( not ( = ?auto_906804 ?auto_906809 ) ) ( not ( = ?auto_906804 ?auto_906810 ) ) ( not ( = ?auto_906804 ?auto_906811 ) ) ( not ( = ?auto_906804 ?auto_906812 ) ) ( not ( = ?auto_906804 ?auto_906813 ) ) ( not ( = ?auto_906804 ?auto_906814 ) ) ( not ( = ?auto_906804 ?auto_906815 ) ) ( not ( = ?auto_906804 ?auto_906816 ) ) ( not ( = ?auto_906804 ?auto_906817 ) ) ( not ( = ?auto_906804 ?auto_906818 ) ) ( not ( = ?auto_906804 ?auto_906819 ) ) ( not ( = ?auto_906804 ?auto_906820 ) ) ( not ( = ?auto_906804 ?auto_906821 ) ) ( not ( = ?auto_906805 ?auto_906806 ) ) ( not ( = ?auto_906805 ?auto_906807 ) ) ( not ( = ?auto_906805 ?auto_906808 ) ) ( not ( = ?auto_906805 ?auto_906809 ) ) ( not ( = ?auto_906805 ?auto_906810 ) ) ( not ( = ?auto_906805 ?auto_906811 ) ) ( not ( = ?auto_906805 ?auto_906812 ) ) ( not ( = ?auto_906805 ?auto_906813 ) ) ( not ( = ?auto_906805 ?auto_906814 ) ) ( not ( = ?auto_906805 ?auto_906815 ) ) ( not ( = ?auto_906805 ?auto_906816 ) ) ( not ( = ?auto_906805 ?auto_906817 ) ) ( not ( = ?auto_906805 ?auto_906818 ) ) ( not ( = ?auto_906805 ?auto_906819 ) ) ( not ( = ?auto_906805 ?auto_906820 ) ) ( not ( = ?auto_906805 ?auto_906821 ) ) ( not ( = ?auto_906806 ?auto_906807 ) ) ( not ( = ?auto_906806 ?auto_906808 ) ) ( not ( = ?auto_906806 ?auto_906809 ) ) ( not ( = ?auto_906806 ?auto_906810 ) ) ( not ( = ?auto_906806 ?auto_906811 ) ) ( not ( = ?auto_906806 ?auto_906812 ) ) ( not ( = ?auto_906806 ?auto_906813 ) ) ( not ( = ?auto_906806 ?auto_906814 ) ) ( not ( = ?auto_906806 ?auto_906815 ) ) ( not ( = ?auto_906806 ?auto_906816 ) ) ( not ( = ?auto_906806 ?auto_906817 ) ) ( not ( = ?auto_906806 ?auto_906818 ) ) ( not ( = ?auto_906806 ?auto_906819 ) ) ( not ( = ?auto_906806 ?auto_906820 ) ) ( not ( = ?auto_906806 ?auto_906821 ) ) ( not ( = ?auto_906807 ?auto_906808 ) ) ( not ( = ?auto_906807 ?auto_906809 ) ) ( not ( = ?auto_906807 ?auto_906810 ) ) ( not ( = ?auto_906807 ?auto_906811 ) ) ( not ( = ?auto_906807 ?auto_906812 ) ) ( not ( = ?auto_906807 ?auto_906813 ) ) ( not ( = ?auto_906807 ?auto_906814 ) ) ( not ( = ?auto_906807 ?auto_906815 ) ) ( not ( = ?auto_906807 ?auto_906816 ) ) ( not ( = ?auto_906807 ?auto_906817 ) ) ( not ( = ?auto_906807 ?auto_906818 ) ) ( not ( = ?auto_906807 ?auto_906819 ) ) ( not ( = ?auto_906807 ?auto_906820 ) ) ( not ( = ?auto_906807 ?auto_906821 ) ) ( not ( = ?auto_906808 ?auto_906809 ) ) ( not ( = ?auto_906808 ?auto_906810 ) ) ( not ( = ?auto_906808 ?auto_906811 ) ) ( not ( = ?auto_906808 ?auto_906812 ) ) ( not ( = ?auto_906808 ?auto_906813 ) ) ( not ( = ?auto_906808 ?auto_906814 ) ) ( not ( = ?auto_906808 ?auto_906815 ) ) ( not ( = ?auto_906808 ?auto_906816 ) ) ( not ( = ?auto_906808 ?auto_906817 ) ) ( not ( = ?auto_906808 ?auto_906818 ) ) ( not ( = ?auto_906808 ?auto_906819 ) ) ( not ( = ?auto_906808 ?auto_906820 ) ) ( not ( = ?auto_906808 ?auto_906821 ) ) ( not ( = ?auto_906809 ?auto_906810 ) ) ( not ( = ?auto_906809 ?auto_906811 ) ) ( not ( = ?auto_906809 ?auto_906812 ) ) ( not ( = ?auto_906809 ?auto_906813 ) ) ( not ( = ?auto_906809 ?auto_906814 ) ) ( not ( = ?auto_906809 ?auto_906815 ) ) ( not ( = ?auto_906809 ?auto_906816 ) ) ( not ( = ?auto_906809 ?auto_906817 ) ) ( not ( = ?auto_906809 ?auto_906818 ) ) ( not ( = ?auto_906809 ?auto_906819 ) ) ( not ( = ?auto_906809 ?auto_906820 ) ) ( not ( = ?auto_906809 ?auto_906821 ) ) ( not ( = ?auto_906810 ?auto_906811 ) ) ( not ( = ?auto_906810 ?auto_906812 ) ) ( not ( = ?auto_906810 ?auto_906813 ) ) ( not ( = ?auto_906810 ?auto_906814 ) ) ( not ( = ?auto_906810 ?auto_906815 ) ) ( not ( = ?auto_906810 ?auto_906816 ) ) ( not ( = ?auto_906810 ?auto_906817 ) ) ( not ( = ?auto_906810 ?auto_906818 ) ) ( not ( = ?auto_906810 ?auto_906819 ) ) ( not ( = ?auto_906810 ?auto_906820 ) ) ( not ( = ?auto_906810 ?auto_906821 ) ) ( not ( = ?auto_906811 ?auto_906812 ) ) ( not ( = ?auto_906811 ?auto_906813 ) ) ( not ( = ?auto_906811 ?auto_906814 ) ) ( not ( = ?auto_906811 ?auto_906815 ) ) ( not ( = ?auto_906811 ?auto_906816 ) ) ( not ( = ?auto_906811 ?auto_906817 ) ) ( not ( = ?auto_906811 ?auto_906818 ) ) ( not ( = ?auto_906811 ?auto_906819 ) ) ( not ( = ?auto_906811 ?auto_906820 ) ) ( not ( = ?auto_906811 ?auto_906821 ) ) ( not ( = ?auto_906812 ?auto_906813 ) ) ( not ( = ?auto_906812 ?auto_906814 ) ) ( not ( = ?auto_906812 ?auto_906815 ) ) ( not ( = ?auto_906812 ?auto_906816 ) ) ( not ( = ?auto_906812 ?auto_906817 ) ) ( not ( = ?auto_906812 ?auto_906818 ) ) ( not ( = ?auto_906812 ?auto_906819 ) ) ( not ( = ?auto_906812 ?auto_906820 ) ) ( not ( = ?auto_906812 ?auto_906821 ) ) ( not ( = ?auto_906813 ?auto_906814 ) ) ( not ( = ?auto_906813 ?auto_906815 ) ) ( not ( = ?auto_906813 ?auto_906816 ) ) ( not ( = ?auto_906813 ?auto_906817 ) ) ( not ( = ?auto_906813 ?auto_906818 ) ) ( not ( = ?auto_906813 ?auto_906819 ) ) ( not ( = ?auto_906813 ?auto_906820 ) ) ( not ( = ?auto_906813 ?auto_906821 ) ) ( not ( = ?auto_906814 ?auto_906815 ) ) ( not ( = ?auto_906814 ?auto_906816 ) ) ( not ( = ?auto_906814 ?auto_906817 ) ) ( not ( = ?auto_906814 ?auto_906818 ) ) ( not ( = ?auto_906814 ?auto_906819 ) ) ( not ( = ?auto_906814 ?auto_906820 ) ) ( not ( = ?auto_906814 ?auto_906821 ) ) ( not ( = ?auto_906815 ?auto_906816 ) ) ( not ( = ?auto_906815 ?auto_906817 ) ) ( not ( = ?auto_906815 ?auto_906818 ) ) ( not ( = ?auto_906815 ?auto_906819 ) ) ( not ( = ?auto_906815 ?auto_906820 ) ) ( not ( = ?auto_906815 ?auto_906821 ) ) ( not ( = ?auto_906816 ?auto_906817 ) ) ( not ( = ?auto_906816 ?auto_906818 ) ) ( not ( = ?auto_906816 ?auto_906819 ) ) ( not ( = ?auto_906816 ?auto_906820 ) ) ( not ( = ?auto_906816 ?auto_906821 ) ) ( not ( = ?auto_906817 ?auto_906818 ) ) ( not ( = ?auto_906817 ?auto_906819 ) ) ( not ( = ?auto_906817 ?auto_906820 ) ) ( not ( = ?auto_906817 ?auto_906821 ) ) ( not ( = ?auto_906818 ?auto_906819 ) ) ( not ( = ?auto_906818 ?auto_906820 ) ) ( not ( = ?auto_906818 ?auto_906821 ) ) ( not ( = ?auto_906819 ?auto_906820 ) ) ( not ( = ?auto_906819 ?auto_906821 ) ) ( not ( = ?auto_906820 ?auto_906821 ) ) ( ON ?auto_906804 ?auto_906822 ) ( not ( = ?auto_906821 ?auto_906822 ) ) ( not ( = ?auto_906820 ?auto_906822 ) ) ( not ( = ?auto_906819 ?auto_906822 ) ) ( not ( = ?auto_906818 ?auto_906822 ) ) ( not ( = ?auto_906817 ?auto_906822 ) ) ( not ( = ?auto_906816 ?auto_906822 ) ) ( not ( = ?auto_906815 ?auto_906822 ) ) ( not ( = ?auto_906814 ?auto_906822 ) ) ( not ( = ?auto_906813 ?auto_906822 ) ) ( not ( = ?auto_906812 ?auto_906822 ) ) ( not ( = ?auto_906811 ?auto_906822 ) ) ( not ( = ?auto_906810 ?auto_906822 ) ) ( not ( = ?auto_906809 ?auto_906822 ) ) ( not ( = ?auto_906808 ?auto_906822 ) ) ( not ( = ?auto_906807 ?auto_906822 ) ) ( not ( = ?auto_906806 ?auto_906822 ) ) ( not ( = ?auto_906805 ?auto_906822 ) ) ( not ( = ?auto_906804 ?auto_906822 ) ) ( ON ?auto_906805 ?auto_906804 ) ( ON ?auto_906806 ?auto_906805 ) ( ON ?auto_906807 ?auto_906806 ) ( ON ?auto_906808 ?auto_906807 ) ( ON ?auto_906809 ?auto_906808 ) ( ON ?auto_906810 ?auto_906809 ) ( ON ?auto_906811 ?auto_906810 ) ( ON ?auto_906812 ?auto_906811 ) ( ON ?auto_906813 ?auto_906812 ) ( ON ?auto_906814 ?auto_906813 ) ( ON ?auto_906815 ?auto_906814 ) ( ON ?auto_906816 ?auto_906815 ) ( ON ?auto_906817 ?auto_906816 ) ( ON ?auto_906818 ?auto_906817 ) ( ON ?auto_906819 ?auto_906818 ) ( ON ?auto_906820 ?auto_906819 ) ( ON ?auto_906821 ?auto_906820 ) ( CLEAR ?auto_906821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_906821 ?auto_906820 ?auto_906819 ?auto_906818 ?auto_906817 ?auto_906816 ?auto_906815 ?auto_906814 ?auto_906813 ?auto_906812 ?auto_906811 ?auto_906810 ?auto_906809 ?auto_906808 ?auto_906807 ?auto_906806 ?auto_906805 ?auto_906804 )
      ( MAKE-18PILE ?auto_906804 ?auto_906805 ?auto_906806 ?auto_906807 ?auto_906808 ?auto_906809 ?auto_906810 ?auto_906811 ?auto_906812 ?auto_906813 ?auto_906814 ?auto_906815 ?auto_906816 ?auto_906817 ?auto_906818 ?auto_906819 ?auto_906820 ?auto_906821 ) )
  )

)

