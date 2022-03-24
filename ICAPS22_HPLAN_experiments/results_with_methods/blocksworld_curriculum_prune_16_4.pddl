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
      ?auto_490033 - BLOCK
    )
    :vars
    (
      ?auto_490034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490033 ?auto_490034 ) ( CLEAR ?auto_490033 ) ( HAND-EMPTY ) ( not ( = ?auto_490033 ?auto_490034 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_490033 ?auto_490034 )
      ( !PUTDOWN ?auto_490033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_490040 - BLOCK
      ?auto_490041 - BLOCK
    )
    :vars
    (
      ?auto_490042 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_490040 ) ( ON ?auto_490041 ?auto_490042 ) ( CLEAR ?auto_490041 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_490040 ) ( not ( = ?auto_490040 ?auto_490041 ) ) ( not ( = ?auto_490040 ?auto_490042 ) ) ( not ( = ?auto_490041 ?auto_490042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_490041 ?auto_490042 )
      ( !STACK ?auto_490041 ?auto_490040 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_490050 - BLOCK
      ?auto_490051 - BLOCK
    )
    :vars
    (
      ?auto_490052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490051 ?auto_490052 ) ( not ( = ?auto_490050 ?auto_490051 ) ) ( not ( = ?auto_490050 ?auto_490052 ) ) ( not ( = ?auto_490051 ?auto_490052 ) ) ( ON ?auto_490050 ?auto_490051 ) ( CLEAR ?auto_490050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_490050 )
      ( MAKE-2PILE ?auto_490050 ?auto_490051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_490061 - BLOCK
      ?auto_490062 - BLOCK
      ?auto_490063 - BLOCK
    )
    :vars
    (
      ?auto_490064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_490062 ) ( ON ?auto_490063 ?auto_490064 ) ( CLEAR ?auto_490063 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_490061 ) ( ON ?auto_490062 ?auto_490061 ) ( not ( = ?auto_490061 ?auto_490062 ) ) ( not ( = ?auto_490061 ?auto_490063 ) ) ( not ( = ?auto_490061 ?auto_490064 ) ) ( not ( = ?auto_490062 ?auto_490063 ) ) ( not ( = ?auto_490062 ?auto_490064 ) ) ( not ( = ?auto_490063 ?auto_490064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_490063 ?auto_490064 )
      ( !STACK ?auto_490063 ?auto_490062 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_490075 - BLOCK
      ?auto_490076 - BLOCK
      ?auto_490077 - BLOCK
    )
    :vars
    (
      ?auto_490078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490077 ?auto_490078 ) ( ON-TABLE ?auto_490075 ) ( not ( = ?auto_490075 ?auto_490076 ) ) ( not ( = ?auto_490075 ?auto_490077 ) ) ( not ( = ?auto_490075 ?auto_490078 ) ) ( not ( = ?auto_490076 ?auto_490077 ) ) ( not ( = ?auto_490076 ?auto_490078 ) ) ( not ( = ?auto_490077 ?auto_490078 ) ) ( CLEAR ?auto_490075 ) ( ON ?auto_490076 ?auto_490077 ) ( CLEAR ?auto_490076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_490075 ?auto_490076 )
      ( MAKE-3PILE ?auto_490075 ?auto_490076 ?auto_490077 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_490089 - BLOCK
      ?auto_490090 - BLOCK
      ?auto_490091 - BLOCK
    )
    :vars
    (
      ?auto_490092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490091 ?auto_490092 ) ( not ( = ?auto_490089 ?auto_490090 ) ) ( not ( = ?auto_490089 ?auto_490091 ) ) ( not ( = ?auto_490089 ?auto_490092 ) ) ( not ( = ?auto_490090 ?auto_490091 ) ) ( not ( = ?auto_490090 ?auto_490092 ) ) ( not ( = ?auto_490091 ?auto_490092 ) ) ( ON ?auto_490090 ?auto_490091 ) ( ON ?auto_490089 ?auto_490090 ) ( CLEAR ?auto_490089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_490089 )
      ( MAKE-3PILE ?auto_490089 ?auto_490090 ?auto_490091 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_490104 - BLOCK
      ?auto_490105 - BLOCK
      ?auto_490106 - BLOCK
      ?auto_490107 - BLOCK
    )
    :vars
    (
      ?auto_490108 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_490106 ) ( ON ?auto_490107 ?auto_490108 ) ( CLEAR ?auto_490107 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_490104 ) ( ON ?auto_490105 ?auto_490104 ) ( ON ?auto_490106 ?auto_490105 ) ( not ( = ?auto_490104 ?auto_490105 ) ) ( not ( = ?auto_490104 ?auto_490106 ) ) ( not ( = ?auto_490104 ?auto_490107 ) ) ( not ( = ?auto_490104 ?auto_490108 ) ) ( not ( = ?auto_490105 ?auto_490106 ) ) ( not ( = ?auto_490105 ?auto_490107 ) ) ( not ( = ?auto_490105 ?auto_490108 ) ) ( not ( = ?auto_490106 ?auto_490107 ) ) ( not ( = ?auto_490106 ?auto_490108 ) ) ( not ( = ?auto_490107 ?auto_490108 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_490107 ?auto_490108 )
      ( !STACK ?auto_490107 ?auto_490106 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_490122 - BLOCK
      ?auto_490123 - BLOCK
      ?auto_490124 - BLOCK
      ?auto_490125 - BLOCK
    )
    :vars
    (
      ?auto_490126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490125 ?auto_490126 ) ( ON-TABLE ?auto_490122 ) ( ON ?auto_490123 ?auto_490122 ) ( not ( = ?auto_490122 ?auto_490123 ) ) ( not ( = ?auto_490122 ?auto_490124 ) ) ( not ( = ?auto_490122 ?auto_490125 ) ) ( not ( = ?auto_490122 ?auto_490126 ) ) ( not ( = ?auto_490123 ?auto_490124 ) ) ( not ( = ?auto_490123 ?auto_490125 ) ) ( not ( = ?auto_490123 ?auto_490126 ) ) ( not ( = ?auto_490124 ?auto_490125 ) ) ( not ( = ?auto_490124 ?auto_490126 ) ) ( not ( = ?auto_490125 ?auto_490126 ) ) ( CLEAR ?auto_490123 ) ( ON ?auto_490124 ?auto_490125 ) ( CLEAR ?auto_490124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_490122 ?auto_490123 ?auto_490124 )
      ( MAKE-4PILE ?auto_490122 ?auto_490123 ?auto_490124 ?auto_490125 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_490140 - BLOCK
      ?auto_490141 - BLOCK
      ?auto_490142 - BLOCK
      ?auto_490143 - BLOCK
    )
    :vars
    (
      ?auto_490144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490143 ?auto_490144 ) ( ON-TABLE ?auto_490140 ) ( not ( = ?auto_490140 ?auto_490141 ) ) ( not ( = ?auto_490140 ?auto_490142 ) ) ( not ( = ?auto_490140 ?auto_490143 ) ) ( not ( = ?auto_490140 ?auto_490144 ) ) ( not ( = ?auto_490141 ?auto_490142 ) ) ( not ( = ?auto_490141 ?auto_490143 ) ) ( not ( = ?auto_490141 ?auto_490144 ) ) ( not ( = ?auto_490142 ?auto_490143 ) ) ( not ( = ?auto_490142 ?auto_490144 ) ) ( not ( = ?auto_490143 ?auto_490144 ) ) ( ON ?auto_490142 ?auto_490143 ) ( CLEAR ?auto_490140 ) ( ON ?auto_490141 ?auto_490142 ) ( CLEAR ?auto_490141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_490140 ?auto_490141 )
      ( MAKE-4PILE ?auto_490140 ?auto_490141 ?auto_490142 ?auto_490143 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_490158 - BLOCK
      ?auto_490159 - BLOCK
      ?auto_490160 - BLOCK
      ?auto_490161 - BLOCK
    )
    :vars
    (
      ?auto_490162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490161 ?auto_490162 ) ( not ( = ?auto_490158 ?auto_490159 ) ) ( not ( = ?auto_490158 ?auto_490160 ) ) ( not ( = ?auto_490158 ?auto_490161 ) ) ( not ( = ?auto_490158 ?auto_490162 ) ) ( not ( = ?auto_490159 ?auto_490160 ) ) ( not ( = ?auto_490159 ?auto_490161 ) ) ( not ( = ?auto_490159 ?auto_490162 ) ) ( not ( = ?auto_490160 ?auto_490161 ) ) ( not ( = ?auto_490160 ?auto_490162 ) ) ( not ( = ?auto_490161 ?auto_490162 ) ) ( ON ?auto_490160 ?auto_490161 ) ( ON ?auto_490159 ?auto_490160 ) ( ON ?auto_490158 ?auto_490159 ) ( CLEAR ?auto_490158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_490158 )
      ( MAKE-4PILE ?auto_490158 ?auto_490159 ?auto_490160 ?auto_490161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_490177 - BLOCK
      ?auto_490178 - BLOCK
      ?auto_490179 - BLOCK
      ?auto_490180 - BLOCK
      ?auto_490181 - BLOCK
    )
    :vars
    (
      ?auto_490182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_490180 ) ( ON ?auto_490181 ?auto_490182 ) ( CLEAR ?auto_490181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_490177 ) ( ON ?auto_490178 ?auto_490177 ) ( ON ?auto_490179 ?auto_490178 ) ( ON ?auto_490180 ?auto_490179 ) ( not ( = ?auto_490177 ?auto_490178 ) ) ( not ( = ?auto_490177 ?auto_490179 ) ) ( not ( = ?auto_490177 ?auto_490180 ) ) ( not ( = ?auto_490177 ?auto_490181 ) ) ( not ( = ?auto_490177 ?auto_490182 ) ) ( not ( = ?auto_490178 ?auto_490179 ) ) ( not ( = ?auto_490178 ?auto_490180 ) ) ( not ( = ?auto_490178 ?auto_490181 ) ) ( not ( = ?auto_490178 ?auto_490182 ) ) ( not ( = ?auto_490179 ?auto_490180 ) ) ( not ( = ?auto_490179 ?auto_490181 ) ) ( not ( = ?auto_490179 ?auto_490182 ) ) ( not ( = ?auto_490180 ?auto_490181 ) ) ( not ( = ?auto_490180 ?auto_490182 ) ) ( not ( = ?auto_490181 ?auto_490182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_490181 ?auto_490182 )
      ( !STACK ?auto_490181 ?auto_490180 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_490199 - BLOCK
      ?auto_490200 - BLOCK
      ?auto_490201 - BLOCK
      ?auto_490202 - BLOCK
      ?auto_490203 - BLOCK
    )
    :vars
    (
      ?auto_490204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490203 ?auto_490204 ) ( ON-TABLE ?auto_490199 ) ( ON ?auto_490200 ?auto_490199 ) ( ON ?auto_490201 ?auto_490200 ) ( not ( = ?auto_490199 ?auto_490200 ) ) ( not ( = ?auto_490199 ?auto_490201 ) ) ( not ( = ?auto_490199 ?auto_490202 ) ) ( not ( = ?auto_490199 ?auto_490203 ) ) ( not ( = ?auto_490199 ?auto_490204 ) ) ( not ( = ?auto_490200 ?auto_490201 ) ) ( not ( = ?auto_490200 ?auto_490202 ) ) ( not ( = ?auto_490200 ?auto_490203 ) ) ( not ( = ?auto_490200 ?auto_490204 ) ) ( not ( = ?auto_490201 ?auto_490202 ) ) ( not ( = ?auto_490201 ?auto_490203 ) ) ( not ( = ?auto_490201 ?auto_490204 ) ) ( not ( = ?auto_490202 ?auto_490203 ) ) ( not ( = ?auto_490202 ?auto_490204 ) ) ( not ( = ?auto_490203 ?auto_490204 ) ) ( CLEAR ?auto_490201 ) ( ON ?auto_490202 ?auto_490203 ) ( CLEAR ?auto_490202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_490199 ?auto_490200 ?auto_490201 ?auto_490202 )
      ( MAKE-5PILE ?auto_490199 ?auto_490200 ?auto_490201 ?auto_490202 ?auto_490203 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_490221 - BLOCK
      ?auto_490222 - BLOCK
      ?auto_490223 - BLOCK
      ?auto_490224 - BLOCK
      ?auto_490225 - BLOCK
    )
    :vars
    (
      ?auto_490226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490225 ?auto_490226 ) ( ON-TABLE ?auto_490221 ) ( ON ?auto_490222 ?auto_490221 ) ( not ( = ?auto_490221 ?auto_490222 ) ) ( not ( = ?auto_490221 ?auto_490223 ) ) ( not ( = ?auto_490221 ?auto_490224 ) ) ( not ( = ?auto_490221 ?auto_490225 ) ) ( not ( = ?auto_490221 ?auto_490226 ) ) ( not ( = ?auto_490222 ?auto_490223 ) ) ( not ( = ?auto_490222 ?auto_490224 ) ) ( not ( = ?auto_490222 ?auto_490225 ) ) ( not ( = ?auto_490222 ?auto_490226 ) ) ( not ( = ?auto_490223 ?auto_490224 ) ) ( not ( = ?auto_490223 ?auto_490225 ) ) ( not ( = ?auto_490223 ?auto_490226 ) ) ( not ( = ?auto_490224 ?auto_490225 ) ) ( not ( = ?auto_490224 ?auto_490226 ) ) ( not ( = ?auto_490225 ?auto_490226 ) ) ( ON ?auto_490224 ?auto_490225 ) ( CLEAR ?auto_490222 ) ( ON ?auto_490223 ?auto_490224 ) ( CLEAR ?auto_490223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_490221 ?auto_490222 ?auto_490223 )
      ( MAKE-5PILE ?auto_490221 ?auto_490222 ?auto_490223 ?auto_490224 ?auto_490225 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_490243 - BLOCK
      ?auto_490244 - BLOCK
      ?auto_490245 - BLOCK
      ?auto_490246 - BLOCK
      ?auto_490247 - BLOCK
    )
    :vars
    (
      ?auto_490248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490247 ?auto_490248 ) ( ON-TABLE ?auto_490243 ) ( not ( = ?auto_490243 ?auto_490244 ) ) ( not ( = ?auto_490243 ?auto_490245 ) ) ( not ( = ?auto_490243 ?auto_490246 ) ) ( not ( = ?auto_490243 ?auto_490247 ) ) ( not ( = ?auto_490243 ?auto_490248 ) ) ( not ( = ?auto_490244 ?auto_490245 ) ) ( not ( = ?auto_490244 ?auto_490246 ) ) ( not ( = ?auto_490244 ?auto_490247 ) ) ( not ( = ?auto_490244 ?auto_490248 ) ) ( not ( = ?auto_490245 ?auto_490246 ) ) ( not ( = ?auto_490245 ?auto_490247 ) ) ( not ( = ?auto_490245 ?auto_490248 ) ) ( not ( = ?auto_490246 ?auto_490247 ) ) ( not ( = ?auto_490246 ?auto_490248 ) ) ( not ( = ?auto_490247 ?auto_490248 ) ) ( ON ?auto_490246 ?auto_490247 ) ( ON ?auto_490245 ?auto_490246 ) ( CLEAR ?auto_490243 ) ( ON ?auto_490244 ?auto_490245 ) ( CLEAR ?auto_490244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_490243 ?auto_490244 )
      ( MAKE-5PILE ?auto_490243 ?auto_490244 ?auto_490245 ?auto_490246 ?auto_490247 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_490265 - BLOCK
      ?auto_490266 - BLOCK
      ?auto_490267 - BLOCK
      ?auto_490268 - BLOCK
      ?auto_490269 - BLOCK
    )
    :vars
    (
      ?auto_490270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490269 ?auto_490270 ) ( not ( = ?auto_490265 ?auto_490266 ) ) ( not ( = ?auto_490265 ?auto_490267 ) ) ( not ( = ?auto_490265 ?auto_490268 ) ) ( not ( = ?auto_490265 ?auto_490269 ) ) ( not ( = ?auto_490265 ?auto_490270 ) ) ( not ( = ?auto_490266 ?auto_490267 ) ) ( not ( = ?auto_490266 ?auto_490268 ) ) ( not ( = ?auto_490266 ?auto_490269 ) ) ( not ( = ?auto_490266 ?auto_490270 ) ) ( not ( = ?auto_490267 ?auto_490268 ) ) ( not ( = ?auto_490267 ?auto_490269 ) ) ( not ( = ?auto_490267 ?auto_490270 ) ) ( not ( = ?auto_490268 ?auto_490269 ) ) ( not ( = ?auto_490268 ?auto_490270 ) ) ( not ( = ?auto_490269 ?auto_490270 ) ) ( ON ?auto_490268 ?auto_490269 ) ( ON ?auto_490267 ?auto_490268 ) ( ON ?auto_490266 ?auto_490267 ) ( ON ?auto_490265 ?auto_490266 ) ( CLEAR ?auto_490265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_490265 )
      ( MAKE-5PILE ?auto_490265 ?auto_490266 ?auto_490267 ?auto_490268 ?auto_490269 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_490288 - BLOCK
      ?auto_490289 - BLOCK
      ?auto_490290 - BLOCK
      ?auto_490291 - BLOCK
      ?auto_490292 - BLOCK
      ?auto_490293 - BLOCK
    )
    :vars
    (
      ?auto_490294 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_490292 ) ( ON ?auto_490293 ?auto_490294 ) ( CLEAR ?auto_490293 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_490288 ) ( ON ?auto_490289 ?auto_490288 ) ( ON ?auto_490290 ?auto_490289 ) ( ON ?auto_490291 ?auto_490290 ) ( ON ?auto_490292 ?auto_490291 ) ( not ( = ?auto_490288 ?auto_490289 ) ) ( not ( = ?auto_490288 ?auto_490290 ) ) ( not ( = ?auto_490288 ?auto_490291 ) ) ( not ( = ?auto_490288 ?auto_490292 ) ) ( not ( = ?auto_490288 ?auto_490293 ) ) ( not ( = ?auto_490288 ?auto_490294 ) ) ( not ( = ?auto_490289 ?auto_490290 ) ) ( not ( = ?auto_490289 ?auto_490291 ) ) ( not ( = ?auto_490289 ?auto_490292 ) ) ( not ( = ?auto_490289 ?auto_490293 ) ) ( not ( = ?auto_490289 ?auto_490294 ) ) ( not ( = ?auto_490290 ?auto_490291 ) ) ( not ( = ?auto_490290 ?auto_490292 ) ) ( not ( = ?auto_490290 ?auto_490293 ) ) ( not ( = ?auto_490290 ?auto_490294 ) ) ( not ( = ?auto_490291 ?auto_490292 ) ) ( not ( = ?auto_490291 ?auto_490293 ) ) ( not ( = ?auto_490291 ?auto_490294 ) ) ( not ( = ?auto_490292 ?auto_490293 ) ) ( not ( = ?auto_490292 ?auto_490294 ) ) ( not ( = ?auto_490293 ?auto_490294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_490293 ?auto_490294 )
      ( !STACK ?auto_490293 ?auto_490292 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_490314 - BLOCK
      ?auto_490315 - BLOCK
      ?auto_490316 - BLOCK
      ?auto_490317 - BLOCK
      ?auto_490318 - BLOCK
      ?auto_490319 - BLOCK
    )
    :vars
    (
      ?auto_490320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490319 ?auto_490320 ) ( ON-TABLE ?auto_490314 ) ( ON ?auto_490315 ?auto_490314 ) ( ON ?auto_490316 ?auto_490315 ) ( ON ?auto_490317 ?auto_490316 ) ( not ( = ?auto_490314 ?auto_490315 ) ) ( not ( = ?auto_490314 ?auto_490316 ) ) ( not ( = ?auto_490314 ?auto_490317 ) ) ( not ( = ?auto_490314 ?auto_490318 ) ) ( not ( = ?auto_490314 ?auto_490319 ) ) ( not ( = ?auto_490314 ?auto_490320 ) ) ( not ( = ?auto_490315 ?auto_490316 ) ) ( not ( = ?auto_490315 ?auto_490317 ) ) ( not ( = ?auto_490315 ?auto_490318 ) ) ( not ( = ?auto_490315 ?auto_490319 ) ) ( not ( = ?auto_490315 ?auto_490320 ) ) ( not ( = ?auto_490316 ?auto_490317 ) ) ( not ( = ?auto_490316 ?auto_490318 ) ) ( not ( = ?auto_490316 ?auto_490319 ) ) ( not ( = ?auto_490316 ?auto_490320 ) ) ( not ( = ?auto_490317 ?auto_490318 ) ) ( not ( = ?auto_490317 ?auto_490319 ) ) ( not ( = ?auto_490317 ?auto_490320 ) ) ( not ( = ?auto_490318 ?auto_490319 ) ) ( not ( = ?auto_490318 ?auto_490320 ) ) ( not ( = ?auto_490319 ?auto_490320 ) ) ( CLEAR ?auto_490317 ) ( ON ?auto_490318 ?auto_490319 ) ( CLEAR ?auto_490318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_490314 ?auto_490315 ?auto_490316 ?auto_490317 ?auto_490318 )
      ( MAKE-6PILE ?auto_490314 ?auto_490315 ?auto_490316 ?auto_490317 ?auto_490318 ?auto_490319 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_490340 - BLOCK
      ?auto_490341 - BLOCK
      ?auto_490342 - BLOCK
      ?auto_490343 - BLOCK
      ?auto_490344 - BLOCK
      ?auto_490345 - BLOCK
    )
    :vars
    (
      ?auto_490346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490345 ?auto_490346 ) ( ON-TABLE ?auto_490340 ) ( ON ?auto_490341 ?auto_490340 ) ( ON ?auto_490342 ?auto_490341 ) ( not ( = ?auto_490340 ?auto_490341 ) ) ( not ( = ?auto_490340 ?auto_490342 ) ) ( not ( = ?auto_490340 ?auto_490343 ) ) ( not ( = ?auto_490340 ?auto_490344 ) ) ( not ( = ?auto_490340 ?auto_490345 ) ) ( not ( = ?auto_490340 ?auto_490346 ) ) ( not ( = ?auto_490341 ?auto_490342 ) ) ( not ( = ?auto_490341 ?auto_490343 ) ) ( not ( = ?auto_490341 ?auto_490344 ) ) ( not ( = ?auto_490341 ?auto_490345 ) ) ( not ( = ?auto_490341 ?auto_490346 ) ) ( not ( = ?auto_490342 ?auto_490343 ) ) ( not ( = ?auto_490342 ?auto_490344 ) ) ( not ( = ?auto_490342 ?auto_490345 ) ) ( not ( = ?auto_490342 ?auto_490346 ) ) ( not ( = ?auto_490343 ?auto_490344 ) ) ( not ( = ?auto_490343 ?auto_490345 ) ) ( not ( = ?auto_490343 ?auto_490346 ) ) ( not ( = ?auto_490344 ?auto_490345 ) ) ( not ( = ?auto_490344 ?auto_490346 ) ) ( not ( = ?auto_490345 ?auto_490346 ) ) ( ON ?auto_490344 ?auto_490345 ) ( CLEAR ?auto_490342 ) ( ON ?auto_490343 ?auto_490344 ) ( CLEAR ?auto_490343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_490340 ?auto_490341 ?auto_490342 ?auto_490343 )
      ( MAKE-6PILE ?auto_490340 ?auto_490341 ?auto_490342 ?auto_490343 ?auto_490344 ?auto_490345 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_490366 - BLOCK
      ?auto_490367 - BLOCK
      ?auto_490368 - BLOCK
      ?auto_490369 - BLOCK
      ?auto_490370 - BLOCK
      ?auto_490371 - BLOCK
    )
    :vars
    (
      ?auto_490372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490371 ?auto_490372 ) ( ON-TABLE ?auto_490366 ) ( ON ?auto_490367 ?auto_490366 ) ( not ( = ?auto_490366 ?auto_490367 ) ) ( not ( = ?auto_490366 ?auto_490368 ) ) ( not ( = ?auto_490366 ?auto_490369 ) ) ( not ( = ?auto_490366 ?auto_490370 ) ) ( not ( = ?auto_490366 ?auto_490371 ) ) ( not ( = ?auto_490366 ?auto_490372 ) ) ( not ( = ?auto_490367 ?auto_490368 ) ) ( not ( = ?auto_490367 ?auto_490369 ) ) ( not ( = ?auto_490367 ?auto_490370 ) ) ( not ( = ?auto_490367 ?auto_490371 ) ) ( not ( = ?auto_490367 ?auto_490372 ) ) ( not ( = ?auto_490368 ?auto_490369 ) ) ( not ( = ?auto_490368 ?auto_490370 ) ) ( not ( = ?auto_490368 ?auto_490371 ) ) ( not ( = ?auto_490368 ?auto_490372 ) ) ( not ( = ?auto_490369 ?auto_490370 ) ) ( not ( = ?auto_490369 ?auto_490371 ) ) ( not ( = ?auto_490369 ?auto_490372 ) ) ( not ( = ?auto_490370 ?auto_490371 ) ) ( not ( = ?auto_490370 ?auto_490372 ) ) ( not ( = ?auto_490371 ?auto_490372 ) ) ( ON ?auto_490370 ?auto_490371 ) ( ON ?auto_490369 ?auto_490370 ) ( CLEAR ?auto_490367 ) ( ON ?auto_490368 ?auto_490369 ) ( CLEAR ?auto_490368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_490366 ?auto_490367 ?auto_490368 )
      ( MAKE-6PILE ?auto_490366 ?auto_490367 ?auto_490368 ?auto_490369 ?auto_490370 ?auto_490371 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_490392 - BLOCK
      ?auto_490393 - BLOCK
      ?auto_490394 - BLOCK
      ?auto_490395 - BLOCK
      ?auto_490396 - BLOCK
      ?auto_490397 - BLOCK
    )
    :vars
    (
      ?auto_490398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490397 ?auto_490398 ) ( ON-TABLE ?auto_490392 ) ( not ( = ?auto_490392 ?auto_490393 ) ) ( not ( = ?auto_490392 ?auto_490394 ) ) ( not ( = ?auto_490392 ?auto_490395 ) ) ( not ( = ?auto_490392 ?auto_490396 ) ) ( not ( = ?auto_490392 ?auto_490397 ) ) ( not ( = ?auto_490392 ?auto_490398 ) ) ( not ( = ?auto_490393 ?auto_490394 ) ) ( not ( = ?auto_490393 ?auto_490395 ) ) ( not ( = ?auto_490393 ?auto_490396 ) ) ( not ( = ?auto_490393 ?auto_490397 ) ) ( not ( = ?auto_490393 ?auto_490398 ) ) ( not ( = ?auto_490394 ?auto_490395 ) ) ( not ( = ?auto_490394 ?auto_490396 ) ) ( not ( = ?auto_490394 ?auto_490397 ) ) ( not ( = ?auto_490394 ?auto_490398 ) ) ( not ( = ?auto_490395 ?auto_490396 ) ) ( not ( = ?auto_490395 ?auto_490397 ) ) ( not ( = ?auto_490395 ?auto_490398 ) ) ( not ( = ?auto_490396 ?auto_490397 ) ) ( not ( = ?auto_490396 ?auto_490398 ) ) ( not ( = ?auto_490397 ?auto_490398 ) ) ( ON ?auto_490396 ?auto_490397 ) ( ON ?auto_490395 ?auto_490396 ) ( ON ?auto_490394 ?auto_490395 ) ( CLEAR ?auto_490392 ) ( ON ?auto_490393 ?auto_490394 ) ( CLEAR ?auto_490393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_490392 ?auto_490393 )
      ( MAKE-6PILE ?auto_490392 ?auto_490393 ?auto_490394 ?auto_490395 ?auto_490396 ?auto_490397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_490418 - BLOCK
      ?auto_490419 - BLOCK
      ?auto_490420 - BLOCK
      ?auto_490421 - BLOCK
      ?auto_490422 - BLOCK
      ?auto_490423 - BLOCK
    )
    :vars
    (
      ?auto_490424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490423 ?auto_490424 ) ( not ( = ?auto_490418 ?auto_490419 ) ) ( not ( = ?auto_490418 ?auto_490420 ) ) ( not ( = ?auto_490418 ?auto_490421 ) ) ( not ( = ?auto_490418 ?auto_490422 ) ) ( not ( = ?auto_490418 ?auto_490423 ) ) ( not ( = ?auto_490418 ?auto_490424 ) ) ( not ( = ?auto_490419 ?auto_490420 ) ) ( not ( = ?auto_490419 ?auto_490421 ) ) ( not ( = ?auto_490419 ?auto_490422 ) ) ( not ( = ?auto_490419 ?auto_490423 ) ) ( not ( = ?auto_490419 ?auto_490424 ) ) ( not ( = ?auto_490420 ?auto_490421 ) ) ( not ( = ?auto_490420 ?auto_490422 ) ) ( not ( = ?auto_490420 ?auto_490423 ) ) ( not ( = ?auto_490420 ?auto_490424 ) ) ( not ( = ?auto_490421 ?auto_490422 ) ) ( not ( = ?auto_490421 ?auto_490423 ) ) ( not ( = ?auto_490421 ?auto_490424 ) ) ( not ( = ?auto_490422 ?auto_490423 ) ) ( not ( = ?auto_490422 ?auto_490424 ) ) ( not ( = ?auto_490423 ?auto_490424 ) ) ( ON ?auto_490422 ?auto_490423 ) ( ON ?auto_490421 ?auto_490422 ) ( ON ?auto_490420 ?auto_490421 ) ( ON ?auto_490419 ?auto_490420 ) ( ON ?auto_490418 ?auto_490419 ) ( CLEAR ?auto_490418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_490418 )
      ( MAKE-6PILE ?auto_490418 ?auto_490419 ?auto_490420 ?auto_490421 ?auto_490422 ?auto_490423 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_490445 - BLOCK
      ?auto_490446 - BLOCK
      ?auto_490447 - BLOCK
      ?auto_490448 - BLOCK
      ?auto_490449 - BLOCK
      ?auto_490450 - BLOCK
      ?auto_490451 - BLOCK
    )
    :vars
    (
      ?auto_490452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_490450 ) ( ON ?auto_490451 ?auto_490452 ) ( CLEAR ?auto_490451 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_490445 ) ( ON ?auto_490446 ?auto_490445 ) ( ON ?auto_490447 ?auto_490446 ) ( ON ?auto_490448 ?auto_490447 ) ( ON ?auto_490449 ?auto_490448 ) ( ON ?auto_490450 ?auto_490449 ) ( not ( = ?auto_490445 ?auto_490446 ) ) ( not ( = ?auto_490445 ?auto_490447 ) ) ( not ( = ?auto_490445 ?auto_490448 ) ) ( not ( = ?auto_490445 ?auto_490449 ) ) ( not ( = ?auto_490445 ?auto_490450 ) ) ( not ( = ?auto_490445 ?auto_490451 ) ) ( not ( = ?auto_490445 ?auto_490452 ) ) ( not ( = ?auto_490446 ?auto_490447 ) ) ( not ( = ?auto_490446 ?auto_490448 ) ) ( not ( = ?auto_490446 ?auto_490449 ) ) ( not ( = ?auto_490446 ?auto_490450 ) ) ( not ( = ?auto_490446 ?auto_490451 ) ) ( not ( = ?auto_490446 ?auto_490452 ) ) ( not ( = ?auto_490447 ?auto_490448 ) ) ( not ( = ?auto_490447 ?auto_490449 ) ) ( not ( = ?auto_490447 ?auto_490450 ) ) ( not ( = ?auto_490447 ?auto_490451 ) ) ( not ( = ?auto_490447 ?auto_490452 ) ) ( not ( = ?auto_490448 ?auto_490449 ) ) ( not ( = ?auto_490448 ?auto_490450 ) ) ( not ( = ?auto_490448 ?auto_490451 ) ) ( not ( = ?auto_490448 ?auto_490452 ) ) ( not ( = ?auto_490449 ?auto_490450 ) ) ( not ( = ?auto_490449 ?auto_490451 ) ) ( not ( = ?auto_490449 ?auto_490452 ) ) ( not ( = ?auto_490450 ?auto_490451 ) ) ( not ( = ?auto_490450 ?auto_490452 ) ) ( not ( = ?auto_490451 ?auto_490452 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_490451 ?auto_490452 )
      ( !STACK ?auto_490451 ?auto_490450 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_490475 - BLOCK
      ?auto_490476 - BLOCK
      ?auto_490477 - BLOCK
      ?auto_490478 - BLOCK
      ?auto_490479 - BLOCK
      ?auto_490480 - BLOCK
      ?auto_490481 - BLOCK
    )
    :vars
    (
      ?auto_490482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490481 ?auto_490482 ) ( ON-TABLE ?auto_490475 ) ( ON ?auto_490476 ?auto_490475 ) ( ON ?auto_490477 ?auto_490476 ) ( ON ?auto_490478 ?auto_490477 ) ( ON ?auto_490479 ?auto_490478 ) ( not ( = ?auto_490475 ?auto_490476 ) ) ( not ( = ?auto_490475 ?auto_490477 ) ) ( not ( = ?auto_490475 ?auto_490478 ) ) ( not ( = ?auto_490475 ?auto_490479 ) ) ( not ( = ?auto_490475 ?auto_490480 ) ) ( not ( = ?auto_490475 ?auto_490481 ) ) ( not ( = ?auto_490475 ?auto_490482 ) ) ( not ( = ?auto_490476 ?auto_490477 ) ) ( not ( = ?auto_490476 ?auto_490478 ) ) ( not ( = ?auto_490476 ?auto_490479 ) ) ( not ( = ?auto_490476 ?auto_490480 ) ) ( not ( = ?auto_490476 ?auto_490481 ) ) ( not ( = ?auto_490476 ?auto_490482 ) ) ( not ( = ?auto_490477 ?auto_490478 ) ) ( not ( = ?auto_490477 ?auto_490479 ) ) ( not ( = ?auto_490477 ?auto_490480 ) ) ( not ( = ?auto_490477 ?auto_490481 ) ) ( not ( = ?auto_490477 ?auto_490482 ) ) ( not ( = ?auto_490478 ?auto_490479 ) ) ( not ( = ?auto_490478 ?auto_490480 ) ) ( not ( = ?auto_490478 ?auto_490481 ) ) ( not ( = ?auto_490478 ?auto_490482 ) ) ( not ( = ?auto_490479 ?auto_490480 ) ) ( not ( = ?auto_490479 ?auto_490481 ) ) ( not ( = ?auto_490479 ?auto_490482 ) ) ( not ( = ?auto_490480 ?auto_490481 ) ) ( not ( = ?auto_490480 ?auto_490482 ) ) ( not ( = ?auto_490481 ?auto_490482 ) ) ( CLEAR ?auto_490479 ) ( ON ?auto_490480 ?auto_490481 ) ( CLEAR ?auto_490480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_490475 ?auto_490476 ?auto_490477 ?auto_490478 ?auto_490479 ?auto_490480 )
      ( MAKE-7PILE ?auto_490475 ?auto_490476 ?auto_490477 ?auto_490478 ?auto_490479 ?auto_490480 ?auto_490481 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_490505 - BLOCK
      ?auto_490506 - BLOCK
      ?auto_490507 - BLOCK
      ?auto_490508 - BLOCK
      ?auto_490509 - BLOCK
      ?auto_490510 - BLOCK
      ?auto_490511 - BLOCK
    )
    :vars
    (
      ?auto_490512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490511 ?auto_490512 ) ( ON-TABLE ?auto_490505 ) ( ON ?auto_490506 ?auto_490505 ) ( ON ?auto_490507 ?auto_490506 ) ( ON ?auto_490508 ?auto_490507 ) ( not ( = ?auto_490505 ?auto_490506 ) ) ( not ( = ?auto_490505 ?auto_490507 ) ) ( not ( = ?auto_490505 ?auto_490508 ) ) ( not ( = ?auto_490505 ?auto_490509 ) ) ( not ( = ?auto_490505 ?auto_490510 ) ) ( not ( = ?auto_490505 ?auto_490511 ) ) ( not ( = ?auto_490505 ?auto_490512 ) ) ( not ( = ?auto_490506 ?auto_490507 ) ) ( not ( = ?auto_490506 ?auto_490508 ) ) ( not ( = ?auto_490506 ?auto_490509 ) ) ( not ( = ?auto_490506 ?auto_490510 ) ) ( not ( = ?auto_490506 ?auto_490511 ) ) ( not ( = ?auto_490506 ?auto_490512 ) ) ( not ( = ?auto_490507 ?auto_490508 ) ) ( not ( = ?auto_490507 ?auto_490509 ) ) ( not ( = ?auto_490507 ?auto_490510 ) ) ( not ( = ?auto_490507 ?auto_490511 ) ) ( not ( = ?auto_490507 ?auto_490512 ) ) ( not ( = ?auto_490508 ?auto_490509 ) ) ( not ( = ?auto_490508 ?auto_490510 ) ) ( not ( = ?auto_490508 ?auto_490511 ) ) ( not ( = ?auto_490508 ?auto_490512 ) ) ( not ( = ?auto_490509 ?auto_490510 ) ) ( not ( = ?auto_490509 ?auto_490511 ) ) ( not ( = ?auto_490509 ?auto_490512 ) ) ( not ( = ?auto_490510 ?auto_490511 ) ) ( not ( = ?auto_490510 ?auto_490512 ) ) ( not ( = ?auto_490511 ?auto_490512 ) ) ( ON ?auto_490510 ?auto_490511 ) ( CLEAR ?auto_490508 ) ( ON ?auto_490509 ?auto_490510 ) ( CLEAR ?auto_490509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_490505 ?auto_490506 ?auto_490507 ?auto_490508 ?auto_490509 )
      ( MAKE-7PILE ?auto_490505 ?auto_490506 ?auto_490507 ?auto_490508 ?auto_490509 ?auto_490510 ?auto_490511 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_490535 - BLOCK
      ?auto_490536 - BLOCK
      ?auto_490537 - BLOCK
      ?auto_490538 - BLOCK
      ?auto_490539 - BLOCK
      ?auto_490540 - BLOCK
      ?auto_490541 - BLOCK
    )
    :vars
    (
      ?auto_490542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490541 ?auto_490542 ) ( ON-TABLE ?auto_490535 ) ( ON ?auto_490536 ?auto_490535 ) ( ON ?auto_490537 ?auto_490536 ) ( not ( = ?auto_490535 ?auto_490536 ) ) ( not ( = ?auto_490535 ?auto_490537 ) ) ( not ( = ?auto_490535 ?auto_490538 ) ) ( not ( = ?auto_490535 ?auto_490539 ) ) ( not ( = ?auto_490535 ?auto_490540 ) ) ( not ( = ?auto_490535 ?auto_490541 ) ) ( not ( = ?auto_490535 ?auto_490542 ) ) ( not ( = ?auto_490536 ?auto_490537 ) ) ( not ( = ?auto_490536 ?auto_490538 ) ) ( not ( = ?auto_490536 ?auto_490539 ) ) ( not ( = ?auto_490536 ?auto_490540 ) ) ( not ( = ?auto_490536 ?auto_490541 ) ) ( not ( = ?auto_490536 ?auto_490542 ) ) ( not ( = ?auto_490537 ?auto_490538 ) ) ( not ( = ?auto_490537 ?auto_490539 ) ) ( not ( = ?auto_490537 ?auto_490540 ) ) ( not ( = ?auto_490537 ?auto_490541 ) ) ( not ( = ?auto_490537 ?auto_490542 ) ) ( not ( = ?auto_490538 ?auto_490539 ) ) ( not ( = ?auto_490538 ?auto_490540 ) ) ( not ( = ?auto_490538 ?auto_490541 ) ) ( not ( = ?auto_490538 ?auto_490542 ) ) ( not ( = ?auto_490539 ?auto_490540 ) ) ( not ( = ?auto_490539 ?auto_490541 ) ) ( not ( = ?auto_490539 ?auto_490542 ) ) ( not ( = ?auto_490540 ?auto_490541 ) ) ( not ( = ?auto_490540 ?auto_490542 ) ) ( not ( = ?auto_490541 ?auto_490542 ) ) ( ON ?auto_490540 ?auto_490541 ) ( ON ?auto_490539 ?auto_490540 ) ( CLEAR ?auto_490537 ) ( ON ?auto_490538 ?auto_490539 ) ( CLEAR ?auto_490538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_490535 ?auto_490536 ?auto_490537 ?auto_490538 )
      ( MAKE-7PILE ?auto_490535 ?auto_490536 ?auto_490537 ?auto_490538 ?auto_490539 ?auto_490540 ?auto_490541 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_490565 - BLOCK
      ?auto_490566 - BLOCK
      ?auto_490567 - BLOCK
      ?auto_490568 - BLOCK
      ?auto_490569 - BLOCK
      ?auto_490570 - BLOCK
      ?auto_490571 - BLOCK
    )
    :vars
    (
      ?auto_490572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490571 ?auto_490572 ) ( ON-TABLE ?auto_490565 ) ( ON ?auto_490566 ?auto_490565 ) ( not ( = ?auto_490565 ?auto_490566 ) ) ( not ( = ?auto_490565 ?auto_490567 ) ) ( not ( = ?auto_490565 ?auto_490568 ) ) ( not ( = ?auto_490565 ?auto_490569 ) ) ( not ( = ?auto_490565 ?auto_490570 ) ) ( not ( = ?auto_490565 ?auto_490571 ) ) ( not ( = ?auto_490565 ?auto_490572 ) ) ( not ( = ?auto_490566 ?auto_490567 ) ) ( not ( = ?auto_490566 ?auto_490568 ) ) ( not ( = ?auto_490566 ?auto_490569 ) ) ( not ( = ?auto_490566 ?auto_490570 ) ) ( not ( = ?auto_490566 ?auto_490571 ) ) ( not ( = ?auto_490566 ?auto_490572 ) ) ( not ( = ?auto_490567 ?auto_490568 ) ) ( not ( = ?auto_490567 ?auto_490569 ) ) ( not ( = ?auto_490567 ?auto_490570 ) ) ( not ( = ?auto_490567 ?auto_490571 ) ) ( not ( = ?auto_490567 ?auto_490572 ) ) ( not ( = ?auto_490568 ?auto_490569 ) ) ( not ( = ?auto_490568 ?auto_490570 ) ) ( not ( = ?auto_490568 ?auto_490571 ) ) ( not ( = ?auto_490568 ?auto_490572 ) ) ( not ( = ?auto_490569 ?auto_490570 ) ) ( not ( = ?auto_490569 ?auto_490571 ) ) ( not ( = ?auto_490569 ?auto_490572 ) ) ( not ( = ?auto_490570 ?auto_490571 ) ) ( not ( = ?auto_490570 ?auto_490572 ) ) ( not ( = ?auto_490571 ?auto_490572 ) ) ( ON ?auto_490570 ?auto_490571 ) ( ON ?auto_490569 ?auto_490570 ) ( ON ?auto_490568 ?auto_490569 ) ( CLEAR ?auto_490566 ) ( ON ?auto_490567 ?auto_490568 ) ( CLEAR ?auto_490567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_490565 ?auto_490566 ?auto_490567 )
      ( MAKE-7PILE ?auto_490565 ?auto_490566 ?auto_490567 ?auto_490568 ?auto_490569 ?auto_490570 ?auto_490571 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_490595 - BLOCK
      ?auto_490596 - BLOCK
      ?auto_490597 - BLOCK
      ?auto_490598 - BLOCK
      ?auto_490599 - BLOCK
      ?auto_490600 - BLOCK
      ?auto_490601 - BLOCK
    )
    :vars
    (
      ?auto_490602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490601 ?auto_490602 ) ( ON-TABLE ?auto_490595 ) ( not ( = ?auto_490595 ?auto_490596 ) ) ( not ( = ?auto_490595 ?auto_490597 ) ) ( not ( = ?auto_490595 ?auto_490598 ) ) ( not ( = ?auto_490595 ?auto_490599 ) ) ( not ( = ?auto_490595 ?auto_490600 ) ) ( not ( = ?auto_490595 ?auto_490601 ) ) ( not ( = ?auto_490595 ?auto_490602 ) ) ( not ( = ?auto_490596 ?auto_490597 ) ) ( not ( = ?auto_490596 ?auto_490598 ) ) ( not ( = ?auto_490596 ?auto_490599 ) ) ( not ( = ?auto_490596 ?auto_490600 ) ) ( not ( = ?auto_490596 ?auto_490601 ) ) ( not ( = ?auto_490596 ?auto_490602 ) ) ( not ( = ?auto_490597 ?auto_490598 ) ) ( not ( = ?auto_490597 ?auto_490599 ) ) ( not ( = ?auto_490597 ?auto_490600 ) ) ( not ( = ?auto_490597 ?auto_490601 ) ) ( not ( = ?auto_490597 ?auto_490602 ) ) ( not ( = ?auto_490598 ?auto_490599 ) ) ( not ( = ?auto_490598 ?auto_490600 ) ) ( not ( = ?auto_490598 ?auto_490601 ) ) ( not ( = ?auto_490598 ?auto_490602 ) ) ( not ( = ?auto_490599 ?auto_490600 ) ) ( not ( = ?auto_490599 ?auto_490601 ) ) ( not ( = ?auto_490599 ?auto_490602 ) ) ( not ( = ?auto_490600 ?auto_490601 ) ) ( not ( = ?auto_490600 ?auto_490602 ) ) ( not ( = ?auto_490601 ?auto_490602 ) ) ( ON ?auto_490600 ?auto_490601 ) ( ON ?auto_490599 ?auto_490600 ) ( ON ?auto_490598 ?auto_490599 ) ( ON ?auto_490597 ?auto_490598 ) ( CLEAR ?auto_490595 ) ( ON ?auto_490596 ?auto_490597 ) ( CLEAR ?auto_490596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_490595 ?auto_490596 )
      ( MAKE-7PILE ?auto_490595 ?auto_490596 ?auto_490597 ?auto_490598 ?auto_490599 ?auto_490600 ?auto_490601 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_490625 - BLOCK
      ?auto_490626 - BLOCK
      ?auto_490627 - BLOCK
      ?auto_490628 - BLOCK
      ?auto_490629 - BLOCK
      ?auto_490630 - BLOCK
      ?auto_490631 - BLOCK
    )
    :vars
    (
      ?auto_490632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490631 ?auto_490632 ) ( not ( = ?auto_490625 ?auto_490626 ) ) ( not ( = ?auto_490625 ?auto_490627 ) ) ( not ( = ?auto_490625 ?auto_490628 ) ) ( not ( = ?auto_490625 ?auto_490629 ) ) ( not ( = ?auto_490625 ?auto_490630 ) ) ( not ( = ?auto_490625 ?auto_490631 ) ) ( not ( = ?auto_490625 ?auto_490632 ) ) ( not ( = ?auto_490626 ?auto_490627 ) ) ( not ( = ?auto_490626 ?auto_490628 ) ) ( not ( = ?auto_490626 ?auto_490629 ) ) ( not ( = ?auto_490626 ?auto_490630 ) ) ( not ( = ?auto_490626 ?auto_490631 ) ) ( not ( = ?auto_490626 ?auto_490632 ) ) ( not ( = ?auto_490627 ?auto_490628 ) ) ( not ( = ?auto_490627 ?auto_490629 ) ) ( not ( = ?auto_490627 ?auto_490630 ) ) ( not ( = ?auto_490627 ?auto_490631 ) ) ( not ( = ?auto_490627 ?auto_490632 ) ) ( not ( = ?auto_490628 ?auto_490629 ) ) ( not ( = ?auto_490628 ?auto_490630 ) ) ( not ( = ?auto_490628 ?auto_490631 ) ) ( not ( = ?auto_490628 ?auto_490632 ) ) ( not ( = ?auto_490629 ?auto_490630 ) ) ( not ( = ?auto_490629 ?auto_490631 ) ) ( not ( = ?auto_490629 ?auto_490632 ) ) ( not ( = ?auto_490630 ?auto_490631 ) ) ( not ( = ?auto_490630 ?auto_490632 ) ) ( not ( = ?auto_490631 ?auto_490632 ) ) ( ON ?auto_490630 ?auto_490631 ) ( ON ?auto_490629 ?auto_490630 ) ( ON ?auto_490628 ?auto_490629 ) ( ON ?auto_490627 ?auto_490628 ) ( ON ?auto_490626 ?auto_490627 ) ( ON ?auto_490625 ?auto_490626 ) ( CLEAR ?auto_490625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_490625 )
      ( MAKE-7PILE ?auto_490625 ?auto_490626 ?auto_490627 ?auto_490628 ?auto_490629 ?auto_490630 ?auto_490631 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_490656 - BLOCK
      ?auto_490657 - BLOCK
      ?auto_490658 - BLOCK
      ?auto_490659 - BLOCK
      ?auto_490660 - BLOCK
      ?auto_490661 - BLOCK
      ?auto_490662 - BLOCK
      ?auto_490663 - BLOCK
    )
    :vars
    (
      ?auto_490664 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_490662 ) ( ON ?auto_490663 ?auto_490664 ) ( CLEAR ?auto_490663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_490656 ) ( ON ?auto_490657 ?auto_490656 ) ( ON ?auto_490658 ?auto_490657 ) ( ON ?auto_490659 ?auto_490658 ) ( ON ?auto_490660 ?auto_490659 ) ( ON ?auto_490661 ?auto_490660 ) ( ON ?auto_490662 ?auto_490661 ) ( not ( = ?auto_490656 ?auto_490657 ) ) ( not ( = ?auto_490656 ?auto_490658 ) ) ( not ( = ?auto_490656 ?auto_490659 ) ) ( not ( = ?auto_490656 ?auto_490660 ) ) ( not ( = ?auto_490656 ?auto_490661 ) ) ( not ( = ?auto_490656 ?auto_490662 ) ) ( not ( = ?auto_490656 ?auto_490663 ) ) ( not ( = ?auto_490656 ?auto_490664 ) ) ( not ( = ?auto_490657 ?auto_490658 ) ) ( not ( = ?auto_490657 ?auto_490659 ) ) ( not ( = ?auto_490657 ?auto_490660 ) ) ( not ( = ?auto_490657 ?auto_490661 ) ) ( not ( = ?auto_490657 ?auto_490662 ) ) ( not ( = ?auto_490657 ?auto_490663 ) ) ( not ( = ?auto_490657 ?auto_490664 ) ) ( not ( = ?auto_490658 ?auto_490659 ) ) ( not ( = ?auto_490658 ?auto_490660 ) ) ( not ( = ?auto_490658 ?auto_490661 ) ) ( not ( = ?auto_490658 ?auto_490662 ) ) ( not ( = ?auto_490658 ?auto_490663 ) ) ( not ( = ?auto_490658 ?auto_490664 ) ) ( not ( = ?auto_490659 ?auto_490660 ) ) ( not ( = ?auto_490659 ?auto_490661 ) ) ( not ( = ?auto_490659 ?auto_490662 ) ) ( not ( = ?auto_490659 ?auto_490663 ) ) ( not ( = ?auto_490659 ?auto_490664 ) ) ( not ( = ?auto_490660 ?auto_490661 ) ) ( not ( = ?auto_490660 ?auto_490662 ) ) ( not ( = ?auto_490660 ?auto_490663 ) ) ( not ( = ?auto_490660 ?auto_490664 ) ) ( not ( = ?auto_490661 ?auto_490662 ) ) ( not ( = ?auto_490661 ?auto_490663 ) ) ( not ( = ?auto_490661 ?auto_490664 ) ) ( not ( = ?auto_490662 ?auto_490663 ) ) ( not ( = ?auto_490662 ?auto_490664 ) ) ( not ( = ?auto_490663 ?auto_490664 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_490663 ?auto_490664 )
      ( !STACK ?auto_490663 ?auto_490662 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_490690 - BLOCK
      ?auto_490691 - BLOCK
      ?auto_490692 - BLOCK
      ?auto_490693 - BLOCK
      ?auto_490694 - BLOCK
      ?auto_490695 - BLOCK
      ?auto_490696 - BLOCK
      ?auto_490697 - BLOCK
    )
    :vars
    (
      ?auto_490698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490697 ?auto_490698 ) ( ON-TABLE ?auto_490690 ) ( ON ?auto_490691 ?auto_490690 ) ( ON ?auto_490692 ?auto_490691 ) ( ON ?auto_490693 ?auto_490692 ) ( ON ?auto_490694 ?auto_490693 ) ( ON ?auto_490695 ?auto_490694 ) ( not ( = ?auto_490690 ?auto_490691 ) ) ( not ( = ?auto_490690 ?auto_490692 ) ) ( not ( = ?auto_490690 ?auto_490693 ) ) ( not ( = ?auto_490690 ?auto_490694 ) ) ( not ( = ?auto_490690 ?auto_490695 ) ) ( not ( = ?auto_490690 ?auto_490696 ) ) ( not ( = ?auto_490690 ?auto_490697 ) ) ( not ( = ?auto_490690 ?auto_490698 ) ) ( not ( = ?auto_490691 ?auto_490692 ) ) ( not ( = ?auto_490691 ?auto_490693 ) ) ( not ( = ?auto_490691 ?auto_490694 ) ) ( not ( = ?auto_490691 ?auto_490695 ) ) ( not ( = ?auto_490691 ?auto_490696 ) ) ( not ( = ?auto_490691 ?auto_490697 ) ) ( not ( = ?auto_490691 ?auto_490698 ) ) ( not ( = ?auto_490692 ?auto_490693 ) ) ( not ( = ?auto_490692 ?auto_490694 ) ) ( not ( = ?auto_490692 ?auto_490695 ) ) ( not ( = ?auto_490692 ?auto_490696 ) ) ( not ( = ?auto_490692 ?auto_490697 ) ) ( not ( = ?auto_490692 ?auto_490698 ) ) ( not ( = ?auto_490693 ?auto_490694 ) ) ( not ( = ?auto_490693 ?auto_490695 ) ) ( not ( = ?auto_490693 ?auto_490696 ) ) ( not ( = ?auto_490693 ?auto_490697 ) ) ( not ( = ?auto_490693 ?auto_490698 ) ) ( not ( = ?auto_490694 ?auto_490695 ) ) ( not ( = ?auto_490694 ?auto_490696 ) ) ( not ( = ?auto_490694 ?auto_490697 ) ) ( not ( = ?auto_490694 ?auto_490698 ) ) ( not ( = ?auto_490695 ?auto_490696 ) ) ( not ( = ?auto_490695 ?auto_490697 ) ) ( not ( = ?auto_490695 ?auto_490698 ) ) ( not ( = ?auto_490696 ?auto_490697 ) ) ( not ( = ?auto_490696 ?auto_490698 ) ) ( not ( = ?auto_490697 ?auto_490698 ) ) ( CLEAR ?auto_490695 ) ( ON ?auto_490696 ?auto_490697 ) ( CLEAR ?auto_490696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_490690 ?auto_490691 ?auto_490692 ?auto_490693 ?auto_490694 ?auto_490695 ?auto_490696 )
      ( MAKE-8PILE ?auto_490690 ?auto_490691 ?auto_490692 ?auto_490693 ?auto_490694 ?auto_490695 ?auto_490696 ?auto_490697 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_490724 - BLOCK
      ?auto_490725 - BLOCK
      ?auto_490726 - BLOCK
      ?auto_490727 - BLOCK
      ?auto_490728 - BLOCK
      ?auto_490729 - BLOCK
      ?auto_490730 - BLOCK
      ?auto_490731 - BLOCK
    )
    :vars
    (
      ?auto_490732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490731 ?auto_490732 ) ( ON-TABLE ?auto_490724 ) ( ON ?auto_490725 ?auto_490724 ) ( ON ?auto_490726 ?auto_490725 ) ( ON ?auto_490727 ?auto_490726 ) ( ON ?auto_490728 ?auto_490727 ) ( not ( = ?auto_490724 ?auto_490725 ) ) ( not ( = ?auto_490724 ?auto_490726 ) ) ( not ( = ?auto_490724 ?auto_490727 ) ) ( not ( = ?auto_490724 ?auto_490728 ) ) ( not ( = ?auto_490724 ?auto_490729 ) ) ( not ( = ?auto_490724 ?auto_490730 ) ) ( not ( = ?auto_490724 ?auto_490731 ) ) ( not ( = ?auto_490724 ?auto_490732 ) ) ( not ( = ?auto_490725 ?auto_490726 ) ) ( not ( = ?auto_490725 ?auto_490727 ) ) ( not ( = ?auto_490725 ?auto_490728 ) ) ( not ( = ?auto_490725 ?auto_490729 ) ) ( not ( = ?auto_490725 ?auto_490730 ) ) ( not ( = ?auto_490725 ?auto_490731 ) ) ( not ( = ?auto_490725 ?auto_490732 ) ) ( not ( = ?auto_490726 ?auto_490727 ) ) ( not ( = ?auto_490726 ?auto_490728 ) ) ( not ( = ?auto_490726 ?auto_490729 ) ) ( not ( = ?auto_490726 ?auto_490730 ) ) ( not ( = ?auto_490726 ?auto_490731 ) ) ( not ( = ?auto_490726 ?auto_490732 ) ) ( not ( = ?auto_490727 ?auto_490728 ) ) ( not ( = ?auto_490727 ?auto_490729 ) ) ( not ( = ?auto_490727 ?auto_490730 ) ) ( not ( = ?auto_490727 ?auto_490731 ) ) ( not ( = ?auto_490727 ?auto_490732 ) ) ( not ( = ?auto_490728 ?auto_490729 ) ) ( not ( = ?auto_490728 ?auto_490730 ) ) ( not ( = ?auto_490728 ?auto_490731 ) ) ( not ( = ?auto_490728 ?auto_490732 ) ) ( not ( = ?auto_490729 ?auto_490730 ) ) ( not ( = ?auto_490729 ?auto_490731 ) ) ( not ( = ?auto_490729 ?auto_490732 ) ) ( not ( = ?auto_490730 ?auto_490731 ) ) ( not ( = ?auto_490730 ?auto_490732 ) ) ( not ( = ?auto_490731 ?auto_490732 ) ) ( ON ?auto_490730 ?auto_490731 ) ( CLEAR ?auto_490728 ) ( ON ?auto_490729 ?auto_490730 ) ( CLEAR ?auto_490729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_490724 ?auto_490725 ?auto_490726 ?auto_490727 ?auto_490728 ?auto_490729 )
      ( MAKE-8PILE ?auto_490724 ?auto_490725 ?auto_490726 ?auto_490727 ?auto_490728 ?auto_490729 ?auto_490730 ?auto_490731 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_490758 - BLOCK
      ?auto_490759 - BLOCK
      ?auto_490760 - BLOCK
      ?auto_490761 - BLOCK
      ?auto_490762 - BLOCK
      ?auto_490763 - BLOCK
      ?auto_490764 - BLOCK
      ?auto_490765 - BLOCK
    )
    :vars
    (
      ?auto_490766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490765 ?auto_490766 ) ( ON-TABLE ?auto_490758 ) ( ON ?auto_490759 ?auto_490758 ) ( ON ?auto_490760 ?auto_490759 ) ( ON ?auto_490761 ?auto_490760 ) ( not ( = ?auto_490758 ?auto_490759 ) ) ( not ( = ?auto_490758 ?auto_490760 ) ) ( not ( = ?auto_490758 ?auto_490761 ) ) ( not ( = ?auto_490758 ?auto_490762 ) ) ( not ( = ?auto_490758 ?auto_490763 ) ) ( not ( = ?auto_490758 ?auto_490764 ) ) ( not ( = ?auto_490758 ?auto_490765 ) ) ( not ( = ?auto_490758 ?auto_490766 ) ) ( not ( = ?auto_490759 ?auto_490760 ) ) ( not ( = ?auto_490759 ?auto_490761 ) ) ( not ( = ?auto_490759 ?auto_490762 ) ) ( not ( = ?auto_490759 ?auto_490763 ) ) ( not ( = ?auto_490759 ?auto_490764 ) ) ( not ( = ?auto_490759 ?auto_490765 ) ) ( not ( = ?auto_490759 ?auto_490766 ) ) ( not ( = ?auto_490760 ?auto_490761 ) ) ( not ( = ?auto_490760 ?auto_490762 ) ) ( not ( = ?auto_490760 ?auto_490763 ) ) ( not ( = ?auto_490760 ?auto_490764 ) ) ( not ( = ?auto_490760 ?auto_490765 ) ) ( not ( = ?auto_490760 ?auto_490766 ) ) ( not ( = ?auto_490761 ?auto_490762 ) ) ( not ( = ?auto_490761 ?auto_490763 ) ) ( not ( = ?auto_490761 ?auto_490764 ) ) ( not ( = ?auto_490761 ?auto_490765 ) ) ( not ( = ?auto_490761 ?auto_490766 ) ) ( not ( = ?auto_490762 ?auto_490763 ) ) ( not ( = ?auto_490762 ?auto_490764 ) ) ( not ( = ?auto_490762 ?auto_490765 ) ) ( not ( = ?auto_490762 ?auto_490766 ) ) ( not ( = ?auto_490763 ?auto_490764 ) ) ( not ( = ?auto_490763 ?auto_490765 ) ) ( not ( = ?auto_490763 ?auto_490766 ) ) ( not ( = ?auto_490764 ?auto_490765 ) ) ( not ( = ?auto_490764 ?auto_490766 ) ) ( not ( = ?auto_490765 ?auto_490766 ) ) ( ON ?auto_490764 ?auto_490765 ) ( ON ?auto_490763 ?auto_490764 ) ( CLEAR ?auto_490761 ) ( ON ?auto_490762 ?auto_490763 ) ( CLEAR ?auto_490762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_490758 ?auto_490759 ?auto_490760 ?auto_490761 ?auto_490762 )
      ( MAKE-8PILE ?auto_490758 ?auto_490759 ?auto_490760 ?auto_490761 ?auto_490762 ?auto_490763 ?auto_490764 ?auto_490765 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_490792 - BLOCK
      ?auto_490793 - BLOCK
      ?auto_490794 - BLOCK
      ?auto_490795 - BLOCK
      ?auto_490796 - BLOCK
      ?auto_490797 - BLOCK
      ?auto_490798 - BLOCK
      ?auto_490799 - BLOCK
    )
    :vars
    (
      ?auto_490800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490799 ?auto_490800 ) ( ON-TABLE ?auto_490792 ) ( ON ?auto_490793 ?auto_490792 ) ( ON ?auto_490794 ?auto_490793 ) ( not ( = ?auto_490792 ?auto_490793 ) ) ( not ( = ?auto_490792 ?auto_490794 ) ) ( not ( = ?auto_490792 ?auto_490795 ) ) ( not ( = ?auto_490792 ?auto_490796 ) ) ( not ( = ?auto_490792 ?auto_490797 ) ) ( not ( = ?auto_490792 ?auto_490798 ) ) ( not ( = ?auto_490792 ?auto_490799 ) ) ( not ( = ?auto_490792 ?auto_490800 ) ) ( not ( = ?auto_490793 ?auto_490794 ) ) ( not ( = ?auto_490793 ?auto_490795 ) ) ( not ( = ?auto_490793 ?auto_490796 ) ) ( not ( = ?auto_490793 ?auto_490797 ) ) ( not ( = ?auto_490793 ?auto_490798 ) ) ( not ( = ?auto_490793 ?auto_490799 ) ) ( not ( = ?auto_490793 ?auto_490800 ) ) ( not ( = ?auto_490794 ?auto_490795 ) ) ( not ( = ?auto_490794 ?auto_490796 ) ) ( not ( = ?auto_490794 ?auto_490797 ) ) ( not ( = ?auto_490794 ?auto_490798 ) ) ( not ( = ?auto_490794 ?auto_490799 ) ) ( not ( = ?auto_490794 ?auto_490800 ) ) ( not ( = ?auto_490795 ?auto_490796 ) ) ( not ( = ?auto_490795 ?auto_490797 ) ) ( not ( = ?auto_490795 ?auto_490798 ) ) ( not ( = ?auto_490795 ?auto_490799 ) ) ( not ( = ?auto_490795 ?auto_490800 ) ) ( not ( = ?auto_490796 ?auto_490797 ) ) ( not ( = ?auto_490796 ?auto_490798 ) ) ( not ( = ?auto_490796 ?auto_490799 ) ) ( not ( = ?auto_490796 ?auto_490800 ) ) ( not ( = ?auto_490797 ?auto_490798 ) ) ( not ( = ?auto_490797 ?auto_490799 ) ) ( not ( = ?auto_490797 ?auto_490800 ) ) ( not ( = ?auto_490798 ?auto_490799 ) ) ( not ( = ?auto_490798 ?auto_490800 ) ) ( not ( = ?auto_490799 ?auto_490800 ) ) ( ON ?auto_490798 ?auto_490799 ) ( ON ?auto_490797 ?auto_490798 ) ( ON ?auto_490796 ?auto_490797 ) ( CLEAR ?auto_490794 ) ( ON ?auto_490795 ?auto_490796 ) ( CLEAR ?auto_490795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_490792 ?auto_490793 ?auto_490794 ?auto_490795 )
      ( MAKE-8PILE ?auto_490792 ?auto_490793 ?auto_490794 ?auto_490795 ?auto_490796 ?auto_490797 ?auto_490798 ?auto_490799 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_490826 - BLOCK
      ?auto_490827 - BLOCK
      ?auto_490828 - BLOCK
      ?auto_490829 - BLOCK
      ?auto_490830 - BLOCK
      ?auto_490831 - BLOCK
      ?auto_490832 - BLOCK
      ?auto_490833 - BLOCK
    )
    :vars
    (
      ?auto_490834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490833 ?auto_490834 ) ( ON-TABLE ?auto_490826 ) ( ON ?auto_490827 ?auto_490826 ) ( not ( = ?auto_490826 ?auto_490827 ) ) ( not ( = ?auto_490826 ?auto_490828 ) ) ( not ( = ?auto_490826 ?auto_490829 ) ) ( not ( = ?auto_490826 ?auto_490830 ) ) ( not ( = ?auto_490826 ?auto_490831 ) ) ( not ( = ?auto_490826 ?auto_490832 ) ) ( not ( = ?auto_490826 ?auto_490833 ) ) ( not ( = ?auto_490826 ?auto_490834 ) ) ( not ( = ?auto_490827 ?auto_490828 ) ) ( not ( = ?auto_490827 ?auto_490829 ) ) ( not ( = ?auto_490827 ?auto_490830 ) ) ( not ( = ?auto_490827 ?auto_490831 ) ) ( not ( = ?auto_490827 ?auto_490832 ) ) ( not ( = ?auto_490827 ?auto_490833 ) ) ( not ( = ?auto_490827 ?auto_490834 ) ) ( not ( = ?auto_490828 ?auto_490829 ) ) ( not ( = ?auto_490828 ?auto_490830 ) ) ( not ( = ?auto_490828 ?auto_490831 ) ) ( not ( = ?auto_490828 ?auto_490832 ) ) ( not ( = ?auto_490828 ?auto_490833 ) ) ( not ( = ?auto_490828 ?auto_490834 ) ) ( not ( = ?auto_490829 ?auto_490830 ) ) ( not ( = ?auto_490829 ?auto_490831 ) ) ( not ( = ?auto_490829 ?auto_490832 ) ) ( not ( = ?auto_490829 ?auto_490833 ) ) ( not ( = ?auto_490829 ?auto_490834 ) ) ( not ( = ?auto_490830 ?auto_490831 ) ) ( not ( = ?auto_490830 ?auto_490832 ) ) ( not ( = ?auto_490830 ?auto_490833 ) ) ( not ( = ?auto_490830 ?auto_490834 ) ) ( not ( = ?auto_490831 ?auto_490832 ) ) ( not ( = ?auto_490831 ?auto_490833 ) ) ( not ( = ?auto_490831 ?auto_490834 ) ) ( not ( = ?auto_490832 ?auto_490833 ) ) ( not ( = ?auto_490832 ?auto_490834 ) ) ( not ( = ?auto_490833 ?auto_490834 ) ) ( ON ?auto_490832 ?auto_490833 ) ( ON ?auto_490831 ?auto_490832 ) ( ON ?auto_490830 ?auto_490831 ) ( ON ?auto_490829 ?auto_490830 ) ( CLEAR ?auto_490827 ) ( ON ?auto_490828 ?auto_490829 ) ( CLEAR ?auto_490828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_490826 ?auto_490827 ?auto_490828 )
      ( MAKE-8PILE ?auto_490826 ?auto_490827 ?auto_490828 ?auto_490829 ?auto_490830 ?auto_490831 ?auto_490832 ?auto_490833 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_490860 - BLOCK
      ?auto_490861 - BLOCK
      ?auto_490862 - BLOCK
      ?auto_490863 - BLOCK
      ?auto_490864 - BLOCK
      ?auto_490865 - BLOCK
      ?auto_490866 - BLOCK
      ?auto_490867 - BLOCK
    )
    :vars
    (
      ?auto_490868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490867 ?auto_490868 ) ( ON-TABLE ?auto_490860 ) ( not ( = ?auto_490860 ?auto_490861 ) ) ( not ( = ?auto_490860 ?auto_490862 ) ) ( not ( = ?auto_490860 ?auto_490863 ) ) ( not ( = ?auto_490860 ?auto_490864 ) ) ( not ( = ?auto_490860 ?auto_490865 ) ) ( not ( = ?auto_490860 ?auto_490866 ) ) ( not ( = ?auto_490860 ?auto_490867 ) ) ( not ( = ?auto_490860 ?auto_490868 ) ) ( not ( = ?auto_490861 ?auto_490862 ) ) ( not ( = ?auto_490861 ?auto_490863 ) ) ( not ( = ?auto_490861 ?auto_490864 ) ) ( not ( = ?auto_490861 ?auto_490865 ) ) ( not ( = ?auto_490861 ?auto_490866 ) ) ( not ( = ?auto_490861 ?auto_490867 ) ) ( not ( = ?auto_490861 ?auto_490868 ) ) ( not ( = ?auto_490862 ?auto_490863 ) ) ( not ( = ?auto_490862 ?auto_490864 ) ) ( not ( = ?auto_490862 ?auto_490865 ) ) ( not ( = ?auto_490862 ?auto_490866 ) ) ( not ( = ?auto_490862 ?auto_490867 ) ) ( not ( = ?auto_490862 ?auto_490868 ) ) ( not ( = ?auto_490863 ?auto_490864 ) ) ( not ( = ?auto_490863 ?auto_490865 ) ) ( not ( = ?auto_490863 ?auto_490866 ) ) ( not ( = ?auto_490863 ?auto_490867 ) ) ( not ( = ?auto_490863 ?auto_490868 ) ) ( not ( = ?auto_490864 ?auto_490865 ) ) ( not ( = ?auto_490864 ?auto_490866 ) ) ( not ( = ?auto_490864 ?auto_490867 ) ) ( not ( = ?auto_490864 ?auto_490868 ) ) ( not ( = ?auto_490865 ?auto_490866 ) ) ( not ( = ?auto_490865 ?auto_490867 ) ) ( not ( = ?auto_490865 ?auto_490868 ) ) ( not ( = ?auto_490866 ?auto_490867 ) ) ( not ( = ?auto_490866 ?auto_490868 ) ) ( not ( = ?auto_490867 ?auto_490868 ) ) ( ON ?auto_490866 ?auto_490867 ) ( ON ?auto_490865 ?auto_490866 ) ( ON ?auto_490864 ?auto_490865 ) ( ON ?auto_490863 ?auto_490864 ) ( ON ?auto_490862 ?auto_490863 ) ( CLEAR ?auto_490860 ) ( ON ?auto_490861 ?auto_490862 ) ( CLEAR ?auto_490861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_490860 ?auto_490861 )
      ( MAKE-8PILE ?auto_490860 ?auto_490861 ?auto_490862 ?auto_490863 ?auto_490864 ?auto_490865 ?auto_490866 ?auto_490867 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_490894 - BLOCK
      ?auto_490895 - BLOCK
      ?auto_490896 - BLOCK
      ?auto_490897 - BLOCK
      ?auto_490898 - BLOCK
      ?auto_490899 - BLOCK
      ?auto_490900 - BLOCK
      ?auto_490901 - BLOCK
    )
    :vars
    (
      ?auto_490902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490901 ?auto_490902 ) ( not ( = ?auto_490894 ?auto_490895 ) ) ( not ( = ?auto_490894 ?auto_490896 ) ) ( not ( = ?auto_490894 ?auto_490897 ) ) ( not ( = ?auto_490894 ?auto_490898 ) ) ( not ( = ?auto_490894 ?auto_490899 ) ) ( not ( = ?auto_490894 ?auto_490900 ) ) ( not ( = ?auto_490894 ?auto_490901 ) ) ( not ( = ?auto_490894 ?auto_490902 ) ) ( not ( = ?auto_490895 ?auto_490896 ) ) ( not ( = ?auto_490895 ?auto_490897 ) ) ( not ( = ?auto_490895 ?auto_490898 ) ) ( not ( = ?auto_490895 ?auto_490899 ) ) ( not ( = ?auto_490895 ?auto_490900 ) ) ( not ( = ?auto_490895 ?auto_490901 ) ) ( not ( = ?auto_490895 ?auto_490902 ) ) ( not ( = ?auto_490896 ?auto_490897 ) ) ( not ( = ?auto_490896 ?auto_490898 ) ) ( not ( = ?auto_490896 ?auto_490899 ) ) ( not ( = ?auto_490896 ?auto_490900 ) ) ( not ( = ?auto_490896 ?auto_490901 ) ) ( not ( = ?auto_490896 ?auto_490902 ) ) ( not ( = ?auto_490897 ?auto_490898 ) ) ( not ( = ?auto_490897 ?auto_490899 ) ) ( not ( = ?auto_490897 ?auto_490900 ) ) ( not ( = ?auto_490897 ?auto_490901 ) ) ( not ( = ?auto_490897 ?auto_490902 ) ) ( not ( = ?auto_490898 ?auto_490899 ) ) ( not ( = ?auto_490898 ?auto_490900 ) ) ( not ( = ?auto_490898 ?auto_490901 ) ) ( not ( = ?auto_490898 ?auto_490902 ) ) ( not ( = ?auto_490899 ?auto_490900 ) ) ( not ( = ?auto_490899 ?auto_490901 ) ) ( not ( = ?auto_490899 ?auto_490902 ) ) ( not ( = ?auto_490900 ?auto_490901 ) ) ( not ( = ?auto_490900 ?auto_490902 ) ) ( not ( = ?auto_490901 ?auto_490902 ) ) ( ON ?auto_490900 ?auto_490901 ) ( ON ?auto_490899 ?auto_490900 ) ( ON ?auto_490898 ?auto_490899 ) ( ON ?auto_490897 ?auto_490898 ) ( ON ?auto_490896 ?auto_490897 ) ( ON ?auto_490895 ?auto_490896 ) ( ON ?auto_490894 ?auto_490895 ) ( CLEAR ?auto_490894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_490894 )
      ( MAKE-8PILE ?auto_490894 ?auto_490895 ?auto_490896 ?auto_490897 ?auto_490898 ?auto_490899 ?auto_490900 ?auto_490901 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_490929 - BLOCK
      ?auto_490930 - BLOCK
      ?auto_490931 - BLOCK
      ?auto_490932 - BLOCK
      ?auto_490933 - BLOCK
      ?auto_490934 - BLOCK
      ?auto_490935 - BLOCK
      ?auto_490936 - BLOCK
      ?auto_490937 - BLOCK
    )
    :vars
    (
      ?auto_490938 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_490936 ) ( ON ?auto_490937 ?auto_490938 ) ( CLEAR ?auto_490937 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_490929 ) ( ON ?auto_490930 ?auto_490929 ) ( ON ?auto_490931 ?auto_490930 ) ( ON ?auto_490932 ?auto_490931 ) ( ON ?auto_490933 ?auto_490932 ) ( ON ?auto_490934 ?auto_490933 ) ( ON ?auto_490935 ?auto_490934 ) ( ON ?auto_490936 ?auto_490935 ) ( not ( = ?auto_490929 ?auto_490930 ) ) ( not ( = ?auto_490929 ?auto_490931 ) ) ( not ( = ?auto_490929 ?auto_490932 ) ) ( not ( = ?auto_490929 ?auto_490933 ) ) ( not ( = ?auto_490929 ?auto_490934 ) ) ( not ( = ?auto_490929 ?auto_490935 ) ) ( not ( = ?auto_490929 ?auto_490936 ) ) ( not ( = ?auto_490929 ?auto_490937 ) ) ( not ( = ?auto_490929 ?auto_490938 ) ) ( not ( = ?auto_490930 ?auto_490931 ) ) ( not ( = ?auto_490930 ?auto_490932 ) ) ( not ( = ?auto_490930 ?auto_490933 ) ) ( not ( = ?auto_490930 ?auto_490934 ) ) ( not ( = ?auto_490930 ?auto_490935 ) ) ( not ( = ?auto_490930 ?auto_490936 ) ) ( not ( = ?auto_490930 ?auto_490937 ) ) ( not ( = ?auto_490930 ?auto_490938 ) ) ( not ( = ?auto_490931 ?auto_490932 ) ) ( not ( = ?auto_490931 ?auto_490933 ) ) ( not ( = ?auto_490931 ?auto_490934 ) ) ( not ( = ?auto_490931 ?auto_490935 ) ) ( not ( = ?auto_490931 ?auto_490936 ) ) ( not ( = ?auto_490931 ?auto_490937 ) ) ( not ( = ?auto_490931 ?auto_490938 ) ) ( not ( = ?auto_490932 ?auto_490933 ) ) ( not ( = ?auto_490932 ?auto_490934 ) ) ( not ( = ?auto_490932 ?auto_490935 ) ) ( not ( = ?auto_490932 ?auto_490936 ) ) ( not ( = ?auto_490932 ?auto_490937 ) ) ( not ( = ?auto_490932 ?auto_490938 ) ) ( not ( = ?auto_490933 ?auto_490934 ) ) ( not ( = ?auto_490933 ?auto_490935 ) ) ( not ( = ?auto_490933 ?auto_490936 ) ) ( not ( = ?auto_490933 ?auto_490937 ) ) ( not ( = ?auto_490933 ?auto_490938 ) ) ( not ( = ?auto_490934 ?auto_490935 ) ) ( not ( = ?auto_490934 ?auto_490936 ) ) ( not ( = ?auto_490934 ?auto_490937 ) ) ( not ( = ?auto_490934 ?auto_490938 ) ) ( not ( = ?auto_490935 ?auto_490936 ) ) ( not ( = ?auto_490935 ?auto_490937 ) ) ( not ( = ?auto_490935 ?auto_490938 ) ) ( not ( = ?auto_490936 ?auto_490937 ) ) ( not ( = ?auto_490936 ?auto_490938 ) ) ( not ( = ?auto_490937 ?auto_490938 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_490937 ?auto_490938 )
      ( !STACK ?auto_490937 ?auto_490936 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_490967 - BLOCK
      ?auto_490968 - BLOCK
      ?auto_490969 - BLOCK
      ?auto_490970 - BLOCK
      ?auto_490971 - BLOCK
      ?auto_490972 - BLOCK
      ?auto_490973 - BLOCK
      ?auto_490974 - BLOCK
      ?auto_490975 - BLOCK
    )
    :vars
    (
      ?auto_490976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_490975 ?auto_490976 ) ( ON-TABLE ?auto_490967 ) ( ON ?auto_490968 ?auto_490967 ) ( ON ?auto_490969 ?auto_490968 ) ( ON ?auto_490970 ?auto_490969 ) ( ON ?auto_490971 ?auto_490970 ) ( ON ?auto_490972 ?auto_490971 ) ( ON ?auto_490973 ?auto_490972 ) ( not ( = ?auto_490967 ?auto_490968 ) ) ( not ( = ?auto_490967 ?auto_490969 ) ) ( not ( = ?auto_490967 ?auto_490970 ) ) ( not ( = ?auto_490967 ?auto_490971 ) ) ( not ( = ?auto_490967 ?auto_490972 ) ) ( not ( = ?auto_490967 ?auto_490973 ) ) ( not ( = ?auto_490967 ?auto_490974 ) ) ( not ( = ?auto_490967 ?auto_490975 ) ) ( not ( = ?auto_490967 ?auto_490976 ) ) ( not ( = ?auto_490968 ?auto_490969 ) ) ( not ( = ?auto_490968 ?auto_490970 ) ) ( not ( = ?auto_490968 ?auto_490971 ) ) ( not ( = ?auto_490968 ?auto_490972 ) ) ( not ( = ?auto_490968 ?auto_490973 ) ) ( not ( = ?auto_490968 ?auto_490974 ) ) ( not ( = ?auto_490968 ?auto_490975 ) ) ( not ( = ?auto_490968 ?auto_490976 ) ) ( not ( = ?auto_490969 ?auto_490970 ) ) ( not ( = ?auto_490969 ?auto_490971 ) ) ( not ( = ?auto_490969 ?auto_490972 ) ) ( not ( = ?auto_490969 ?auto_490973 ) ) ( not ( = ?auto_490969 ?auto_490974 ) ) ( not ( = ?auto_490969 ?auto_490975 ) ) ( not ( = ?auto_490969 ?auto_490976 ) ) ( not ( = ?auto_490970 ?auto_490971 ) ) ( not ( = ?auto_490970 ?auto_490972 ) ) ( not ( = ?auto_490970 ?auto_490973 ) ) ( not ( = ?auto_490970 ?auto_490974 ) ) ( not ( = ?auto_490970 ?auto_490975 ) ) ( not ( = ?auto_490970 ?auto_490976 ) ) ( not ( = ?auto_490971 ?auto_490972 ) ) ( not ( = ?auto_490971 ?auto_490973 ) ) ( not ( = ?auto_490971 ?auto_490974 ) ) ( not ( = ?auto_490971 ?auto_490975 ) ) ( not ( = ?auto_490971 ?auto_490976 ) ) ( not ( = ?auto_490972 ?auto_490973 ) ) ( not ( = ?auto_490972 ?auto_490974 ) ) ( not ( = ?auto_490972 ?auto_490975 ) ) ( not ( = ?auto_490972 ?auto_490976 ) ) ( not ( = ?auto_490973 ?auto_490974 ) ) ( not ( = ?auto_490973 ?auto_490975 ) ) ( not ( = ?auto_490973 ?auto_490976 ) ) ( not ( = ?auto_490974 ?auto_490975 ) ) ( not ( = ?auto_490974 ?auto_490976 ) ) ( not ( = ?auto_490975 ?auto_490976 ) ) ( CLEAR ?auto_490973 ) ( ON ?auto_490974 ?auto_490975 ) ( CLEAR ?auto_490974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_490967 ?auto_490968 ?auto_490969 ?auto_490970 ?auto_490971 ?auto_490972 ?auto_490973 ?auto_490974 )
      ( MAKE-9PILE ?auto_490967 ?auto_490968 ?auto_490969 ?auto_490970 ?auto_490971 ?auto_490972 ?auto_490973 ?auto_490974 ?auto_490975 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_491005 - BLOCK
      ?auto_491006 - BLOCK
      ?auto_491007 - BLOCK
      ?auto_491008 - BLOCK
      ?auto_491009 - BLOCK
      ?auto_491010 - BLOCK
      ?auto_491011 - BLOCK
      ?auto_491012 - BLOCK
      ?auto_491013 - BLOCK
    )
    :vars
    (
      ?auto_491014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491013 ?auto_491014 ) ( ON-TABLE ?auto_491005 ) ( ON ?auto_491006 ?auto_491005 ) ( ON ?auto_491007 ?auto_491006 ) ( ON ?auto_491008 ?auto_491007 ) ( ON ?auto_491009 ?auto_491008 ) ( ON ?auto_491010 ?auto_491009 ) ( not ( = ?auto_491005 ?auto_491006 ) ) ( not ( = ?auto_491005 ?auto_491007 ) ) ( not ( = ?auto_491005 ?auto_491008 ) ) ( not ( = ?auto_491005 ?auto_491009 ) ) ( not ( = ?auto_491005 ?auto_491010 ) ) ( not ( = ?auto_491005 ?auto_491011 ) ) ( not ( = ?auto_491005 ?auto_491012 ) ) ( not ( = ?auto_491005 ?auto_491013 ) ) ( not ( = ?auto_491005 ?auto_491014 ) ) ( not ( = ?auto_491006 ?auto_491007 ) ) ( not ( = ?auto_491006 ?auto_491008 ) ) ( not ( = ?auto_491006 ?auto_491009 ) ) ( not ( = ?auto_491006 ?auto_491010 ) ) ( not ( = ?auto_491006 ?auto_491011 ) ) ( not ( = ?auto_491006 ?auto_491012 ) ) ( not ( = ?auto_491006 ?auto_491013 ) ) ( not ( = ?auto_491006 ?auto_491014 ) ) ( not ( = ?auto_491007 ?auto_491008 ) ) ( not ( = ?auto_491007 ?auto_491009 ) ) ( not ( = ?auto_491007 ?auto_491010 ) ) ( not ( = ?auto_491007 ?auto_491011 ) ) ( not ( = ?auto_491007 ?auto_491012 ) ) ( not ( = ?auto_491007 ?auto_491013 ) ) ( not ( = ?auto_491007 ?auto_491014 ) ) ( not ( = ?auto_491008 ?auto_491009 ) ) ( not ( = ?auto_491008 ?auto_491010 ) ) ( not ( = ?auto_491008 ?auto_491011 ) ) ( not ( = ?auto_491008 ?auto_491012 ) ) ( not ( = ?auto_491008 ?auto_491013 ) ) ( not ( = ?auto_491008 ?auto_491014 ) ) ( not ( = ?auto_491009 ?auto_491010 ) ) ( not ( = ?auto_491009 ?auto_491011 ) ) ( not ( = ?auto_491009 ?auto_491012 ) ) ( not ( = ?auto_491009 ?auto_491013 ) ) ( not ( = ?auto_491009 ?auto_491014 ) ) ( not ( = ?auto_491010 ?auto_491011 ) ) ( not ( = ?auto_491010 ?auto_491012 ) ) ( not ( = ?auto_491010 ?auto_491013 ) ) ( not ( = ?auto_491010 ?auto_491014 ) ) ( not ( = ?auto_491011 ?auto_491012 ) ) ( not ( = ?auto_491011 ?auto_491013 ) ) ( not ( = ?auto_491011 ?auto_491014 ) ) ( not ( = ?auto_491012 ?auto_491013 ) ) ( not ( = ?auto_491012 ?auto_491014 ) ) ( not ( = ?auto_491013 ?auto_491014 ) ) ( ON ?auto_491012 ?auto_491013 ) ( CLEAR ?auto_491010 ) ( ON ?auto_491011 ?auto_491012 ) ( CLEAR ?auto_491011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_491005 ?auto_491006 ?auto_491007 ?auto_491008 ?auto_491009 ?auto_491010 ?auto_491011 )
      ( MAKE-9PILE ?auto_491005 ?auto_491006 ?auto_491007 ?auto_491008 ?auto_491009 ?auto_491010 ?auto_491011 ?auto_491012 ?auto_491013 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_491043 - BLOCK
      ?auto_491044 - BLOCK
      ?auto_491045 - BLOCK
      ?auto_491046 - BLOCK
      ?auto_491047 - BLOCK
      ?auto_491048 - BLOCK
      ?auto_491049 - BLOCK
      ?auto_491050 - BLOCK
      ?auto_491051 - BLOCK
    )
    :vars
    (
      ?auto_491052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491051 ?auto_491052 ) ( ON-TABLE ?auto_491043 ) ( ON ?auto_491044 ?auto_491043 ) ( ON ?auto_491045 ?auto_491044 ) ( ON ?auto_491046 ?auto_491045 ) ( ON ?auto_491047 ?auto_491046 ) ( not ( = ?auto_491043 ?auto_491044 ) ) ( not ( = ?auto_491043 ?auto_491045 ) ) ( not ( = ?auto_491043 ?auto_491046 ) ) ( not ( = ?auto_491043 ?auto_491047 ) ) ( not ( = ?auto_491043 ?auto_491048 ) ) ( not ( = ?auto_491043 ?auto_491049 ) ) ( not ( = ?auto_491043 ?auto_491050 ) ) ( not ( = ?auto_491043 ?auto_491051 ) ) ( not ( = ?auto_491043 ?auto_491052 ) ) ( not ( = ?auto_491044 ?auto_491045 ) ) ( not ( = ?auto_491044 ?auto_491046 ) ) ( not ( = ?auto_491044 ?auto_491047 ) ) ( not ( = ?auto_491044 ?auto_491048 ) ) ( not ( = ?auto_491044 ?auto_491049 ) ) ( not ( = ?auto_491044 ?auto_491050 ) ) ( not ( = ?auto_491044 ?auto_491051 ) ) ( not ( = ?auto_491044 ?auto_491052 ) ) ( not ( = ?auto_491045 ?auto_491046 ) ) ( not ( = ?auto_491045 ?auto_491047 ) ) ( not ( = ?auto_491045 ?auto_491048 ) ) ( not ( = ?auto_491045 ?auto_491049 ) ) ( not ( = ?auto_491045 ?auto_491050 ) ) ( not ( = ?auto_491045 ?auto_491051 ) ) ( not ( = ?auto_491045 ?auto_491052 ) ) ( not ( = ?auto_491046 ?auto_491047 ) ) ( not ( = ?auto_491046 ?auto_491048 ) ) ( not ( = ?auto_491046 ?auto_491049 ) ) ( not ( = ?auto_491046 ?auto_491050 ) ) ( not ( = ?auto_491046 ?auto_491051 ) ) ( not ( = ?auto_491046 ?auto_491052 ) ) ( not ( = ?auto_491047 ?auto_491048 ) ) ( not ( = ?auto_491047 ?auto_491049 ) ) ( not ( = ?auto_491047 ?auto_491050 ) ) ( not ( = ?auto_491047 ?auto_491051 ) ) ( not ( = ?auto_491047 ?auto_491052 ) ) ( not ( = ?auto_491048 ?auto_491049 ) ) ( not ( = ?auto_491048 ?auto_491050 ) ) ( not ( = ?auto_491048 ?auto_491051 ) ) ( not ( = ?auto_491048 ?auto_491052 ) ) ( not ( = ?auto_491049 ?auto_491050 ) ) ( not ( = ?auto_491049 ?auto_491051 ) ) ( not ( = ?auto_491049 ?auto_491052 ) ) ( not ( = ?auto_491050 ?auto_491051 ) ) ( not ( = ?auto_491050 ?auto_491052 ) ) ( not ( = ?auto_491051 ?auto_491052 ) ) ( ON ?auto_491050 ?auto_491051 ) ( ON ?auto_491049 ?auto_491050 ) ( CLEAR ?auto_491047 ) ( ON ?auto_491048 ?auto_491049 ) ( CLEAR ?auto_491048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_491043 ?auto_491044 ?auto_491045 ?auto_491046 ?auto_491047 ?auto_491048 )
      ( MAKE-9PILE ?auto_491043 ?auto_491044 ?auto_491045 ?auto_491046 ?auto_491047 ?auto_491048 ?auto_491049 ?auto_491050 ?auto_491051 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_491081 - BLOCK
      ?auto_491082 - BLOCK
      ?auto_491083 - BLOCK
      ?auto_491084 - BLOCK
      ?auto_491085 - BLOCK
      ?auto_491086 - BLOCK
      ?auto_491087 - BLOCK
      ?auto_491088 - BLOCK
      ?auto_491089 - BLOCK
    )
    :vars
    (
      ?auto_491090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491089 ?auto_491090 ) ( ON-TABLE ?auto_491081 ) ( ON ?auto_491082 ?auto_491081 ) ( ON ?auto_491083 ?auto_491082 ) ( ON ?auto_491084 ?auto_491083 ) ( not ( = ?auto_491081 ?auto_491082 ) ) ( not ( = ?auto_491081 ?auto_491083 ) ) ( not ( = ?auto_491081 ?auto_491084 ) ) ( not ( = ?auto_491081 ?auto_491085 ) ) ( not ( = ?auto_491081 ?auto_491086 ) ) ( not ( = ?auto_491081 ?auto_491087 ) ) ( not ( = ?auto_491081 ?auto_491088 ) ) ( not ( = ?auto_491081 ?auto_491089 ) ) ( not ( = ?auto_491081 ?auto_491090 ) ) ( not ( = ?auto_491082 ?auto_491083 ) ) ( not ( = ?auto_491082 ?auto_491084 ) ) ( not ( = ?auto_491082 ?auto_491085 ) ) ( not ( = ?auto_491082 ?auto_491086 ) ) ( not ( = ?auto_491082 ?auto_491087 ) ) ( not ( = ?auto_491082 ?auto_491088 ) ) ( not ( = ?auto_491082 ?auto_491089 ) ) ( not ( = ?auto_491082 ?auto_491090 ) ) ( not ( = ?auto_491083 ?auto_491084 ) ) ( not ( = ?auto_491083 ?auto_491085 ) ) ( not ( = ?auto_491083 ?auto_491086 ) ) ( not ( = ?auto_491083 ?auto_491087 ) ) ( not ( = ?auto_491083 ?auto_491088 ) ) ( not ( = ?auto_491083 ?auto_491089 ) ) ( not ( = ?auto_491083 ?auto_491090 ) ) ( not ( = ?auto_491084 ?auto_491085 ) ) ( not ( = ?auto_491084 ?auto_491086 ) ) ( not ( = ?auto_491084 ?auto_491087 ) ) ( not ( = ?auto_491084 ?auto_491088 ) ) ( not ( = ?auto_491084 ?auto_491089 ) ) ( not ( = ?auto_491084 ?auto_491090 ) ) ( not ( = ?auto_491085 ?auto_491086 ) ) ( not ( = ?auto_491085 ?auto_491087 ) ) ( not ( = ?auto_491085 ?auto_491088 ) ) ( not ( = ?auto_491085 ?auto_491089 ) ) ( not ( = ?auto_491085 ?auto_491090 ) ) ( not ( = ?auto_491086 ?auto_491087 ) ) ( not ( = ?auto_491086 ?auto_491088 ) ) ( not ( = ?auto_491086 ?auto_491089 ) ) ( not ( = ?auto_491086 ?auto_491090 ) ) ( not ( = ?auto_491087 ?auto_491088 ) ) ( not ( = ?auto_491087 ?auto_491089 ) ) ( not ( = ?auto_491087 ?auto_491090 ) ) ( not ( = ?auto_491088 ?auto_491089 ) ) ( not ( = ?auto_491088 ?auto_491090 ) ) ( not ( = ?auto_491089 ?auto_491090 ) ) ( ON ?auto_491088 ?auto_491089 ) ( ON ?auto_491087 ?auto_491088 ) ( ON ?auto_491086 ?auto_491087 ) ( CLEAR ?auto_491084 ) ( ON ?auto_491085 ?auto_491086 ) ( CLEAR ?auto_491085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_491081 ?auto_491082 ?auto_491083 ?auto_491084 ?auto_491085 )
      ( MAKE-9PILE ?auto_491081 ?auto_491082 ?auto_491083 ?auto_491084 ?auto_491085 ?auto_491086 ?auto_491087 ?auto_491088 ?auto_491089 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_491119 - BLOCK
      ?auto_491120 - BLOCK
      ?auto_491121 - BLOCK
      ?auto_491122 - BLOCK
      ?auto_491123 - BLOCK
      ?auto_491124 - BLOCK
      ?auto_491125 - BLOCK
      ?auto_491126 - BLOCK
      ?auto_491127 - BLOCK
    )
    :vars
    (
      ?auto_491128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491127 ?auto_491128 ) ( ON-TABLE ?auto_491119 ) ( ON ?auto_491120 ?auto_491119 ) ( ON ?auto_491121 ?auto_491120 ) ( not ( = ?auto_491119 ?auto_491120 ) ) ( not ( = ?auto_491119 ?auto_491121 ) ) ( not ( = ?auto_491119 ?auto_491122 ) ) ( not ( = ?auto_491119 ?auto_491123 ) ) ( not ( = ?auto_491119 ?auto_491124 ) ) ( not ( = ?auto_491119 ?auto_491125 ) ) ( not ( = ?auto_491119 ?auto_491126 ) ) ( not ( = ?auto_491119 ?auto_491127 ) ) ( not ( = ?auto_491119 ?auto_491128 ) ) ( not ( = ?auto_491120 ?auto_491121 ) ) ( not ( = ?auto_491120 ?auto_491122 ) ) ( not ( = ?auto_491120 ?auto_491123 ) ) ( not ( = ?auto_491120 ?auto_491124 ) ) ( not ( = ?auto_491120 ?auto_491125 ) ) ( not ( = ?auto_491120 ?auto_491126 ) ) ( not ( = ?auto_491120 ?auto_491127 ) ) ( not ( = ?auto_491120 ?auto_491128 ) ) ( not ( = ?auto_491121 ?auto_491122 ) ) ( not ( = ?auto_491121 ?auto_491123 ) ) ( not ( = ?auto_491121 ?auto_491124 ) ) ( not ( = ?auto_491121 ?auto_491125 ) ) ( not ( = ?auto_491121 ?auto_491126 ) ) ( not ( = ?auto_491121 ?auto_491127 ) ) ( not ( = ?auto_491121 ?auto_491128 ) ) ( not ( = ?auto_491122 ?auto_491123 ) ) ( not ( = ?auto_491122 ?auto_491124 ) ) ( not ( = ?auto_491122 ?auto_491125 ) ) ( not ( = ?auto_491122 ?auto_491126 ) ) ( not ( = ?auto_491122 ?auto_491127 ) ) ( not ( = ?auto_491122 ?auto_491128 ) ) ( not ( = ?auto_491123 ?auto_491124 ) ) ( not ( = ?auto_491123 ?auto_491125 ) ) ( not ( = ?auto_491123 ?auto_491126 ) ) ( not ( = ?auto_491123 ?auto_491127 ) ) ( not ( = ?auto_491123 ?auto_491128 ) ) ( not ( = ?auto_491124 ?auto_491125 ) ) ( not ( = ?auto_491124 ?auto_491126 ) ) ( not ( = ?auto_491124 ?auto_491127 ) ) ( not ( = ?auto_491124 ?auto_491128 ) ) ( not ( = ?auto_491125 ?auto_491126 ) ) ( not ( = ?auto_491125 ?auto_491127 ) ) ( not ( = ?auto_491125 ?auto_491128 ) ) ( not ( = ?auto_491126 ?auto_491127 ) ) ( not ( = ?auto_491126 ?auto_491128 ) ) ( not ( = ?auto_491127 ?auto_491128 ) ) ( ON ?auto_491126 ?auto_491127 ) ( ON ?auto_491125 ?auto_491126 ) ( ON ?auto_491124 ?auto_491125 ) ( ON ?auto_491123 ?auto_491124 ) ( CLEAR ?auto_491121 ) ( ON ?auto_491122 ?auto_491123 ) ( CLEAR ?auto_491122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_491119 ?auto_491120 ?auto_491121 ?auto_491122 )
      ( MAKE-9PILE ?auto_491119 ?auto_491120 ?auto_491121 ?auto_491122 ?auto_491123 ?auto_491124 ?auto_491125 ?auto_491126 ?auto_491127 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_491157 - BLOCK
      ?auto_491158 - BLOCK
      ?auto_491159 - BLOCK
      ?auto_491160 - BLOCK
      ?auto_491161 - BLOCK
      ?auto_491162 - BLOCK
      ?auto_491163 - BLOCK
      ?auto_491164 - BLOCK
      ?auto_491165 - BLOCK
    )
    :vars
    (
      ?auto_491166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491165 ?auto_491166 ) ( ON-TABLE ?auto_491157 ) ( ON ?auto_491158 ?auto_491157 ) ( not ( = ?auto_491157 ?auto_491158 ) ) ( not ( = ?auto_491157 ?auto_491159 ) ) ( not ( = ?auto_491157 ?auto_491160 ) ) ( not ( = ?auto_491157 ?auto_491161 ) ) ( not ( = ?auto_491157 ?auto_491162 ) ) ( not ( = ?auto_491157 ?auto_491163 ) ) ( not ( = ?auto_491157 ?auto_491164 ) ) ( not ( = ?auto_491157 ?auto_491165 ) ) ( not ( = ?auto_491157 ?auto_491166 ) ) ( not ( = ?auto_491158 ?auto_491159 ) ) ( not ( = ?auto_491158 ?auto_491160 ) ) ( not ( = ?auto_491158 ?auto_491161 ) ) ( not ( = ?auto_491158 ?auto_491162 ) ) ( not ( = ?auto_491158 ?auto_491163 ) ) ( not ( = ?auto_491158 ?auto_491164 ) ) ( not ( = ?auto_491158 ?auto_491165 ) ) ( not ( = ?auto_491158 ?auto_491166 ) ) ( not ( = ?auto_491159 ?auto_491160 ) ) ( not ( = ?auto_491159 ?auto_491161 ) ) ( not ( = ?auto_491159 ?auto_491162 ) ) ( not ( = ?auto_491159 ?auto_491163 ) ) ( not ( = ?auto_491159 ?auto_491164 ) ) ( not ( = ?auto_491159 ?auto_491165 ) ) ( not ( = ?auto_491159 ?auto_491166 ) ) ( not ( = ?auto_491160 ?auto_491161 ) ) ( not ( = ?auto_491160 ?auto_491162 ) ) ( not ( = ?auto_491160 ?auto_491163 ) ) ( not ( = ?auto_491160 ?auto_491164 ) ) ( not ( = ?auto_491160 ?auto_491165 ) ) ( not ( = ?auto_491160 ?auto_491166 ) ) ( not ( = ?auto_491161 ?auto_491162 ) ) ( not ( = ?auto_491161 ?auto_491163 ) ) ( not ( = ?auto_491161 ?auto_491164 ) ) ( not ( = ?auto_491161 ?auto_491165 ) ) ( not ( = ?auto_491161 ?auto_491166 ) ) ( not ( = ?auto_491162 ?auto_491163 ) ) ( not ( = ?auto_491162 ?auto_491164 ) ) ( not ( = ?auto_491162 ?auto_491165 ) ) ( not ( = ?auto_491162 ?auto_491166 ) ) ( not ( = ?auto_491163 ?auto_491164 ) ) ( not ( = ?auto_491163 ?auto_491165 ) ) ( not ( = ?auto_491163 ?auto_491166 ) ) ( not ( = ?auto_491164 ?auto_491165 ) ) ( not ( = ?auto_491164 ?auto_491166 ) ) ( not ( = ?auto_491165 ?auto_491166 ) ) ( ON ?auto_491164 ?auto_491165 ) ( ON ?auto_491163 ?auto_491164 ) ( ON ?auto_491162 ?auto_491163 ) ( ON ?auto_491161 ?auto_491162 ) ( ON ?auto_491160 ?auto_491161 ) ( CLEAR ?auto_491158 ) ( ON ?auto_491159 ?auto_491160 ) ( CLEAR ?auto_491159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_491157 ?auto_491158 ?auto_491159 )
      ( MAKE-9PILE ?auto_491157 ?auto_491158 ?auto_491159 ?auto_491160 ?auto_491161 ?auto_491162 ?auto_491163 ?auto_491164 ?auto_491165 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_491195 - BLOCK
      ?auto_491196 - BLOCK
      ?auto_491197 - BLOCK
      ?auto_491198 - BLOCK
      ?auto_491199 - BLOCK
      ?auto_491200 - BLOCK
      ?auto_491201 - BLOCK
      ?auto_491202 - BLOCK
      ?auto_491203 - BLOCK
    )
    :vars
    (
      ?auto_491204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491203 ?auto_491204 ) ( ON-TABLE ?auto_491195 ) ( not ( = ?auto_491195 ?auto_491196 ) ) ( not ( = ?auto_491195 ?auto_491197 ) ) ( not ( = ?auto_491195 ?auto_491198 ) ) ( not ( = ?auto_491195 ?auto_491199 ) ) ( not ( = ?auto_491195 ?auto_491200 ) ) ( not ( = ?auto_491195 ?auto_491201 ) ) ( not ( = ?auto_491195 ?auto_491202 ) ) ( not ( = ?auto_491195 ?auto_491203 ) ) ( not ( = ?auto_491195 ?auto_491204 ) ) ( not ( = ?auto_491196 ?auto_491197 ) ) ( not ( = ?auto_491196 ?auto_491198 ) ) ( not ( = ?auto_491196 ?auto_491199 ) ) ( not ( = ?auto_491196 ?auto_491200 ) ) ( not ( = ?auto_491196 ?auto_491201 ) ) ( not ( = ?auto_491196 ?auto_491202 ) ) ( not ( = ?auto_491196 ?auto_491203 ) ) ( not ( = ?auto_491196 ?auto_491204 ) ) ( not ( = ?auto_491197 ?auto_491198 ) ) ( not ( = ?auto_491197 ?auto_491199 ) ) ( not ( = ?auto_491197 ?auto_491200 ) ) ( not ( = ?auto_491197 ?auto_491201 ) ) ( not ( = ?auto_491197 ?auto_491202 ) ) ( not ( = ?auto_491197 ?auto_491203 ) ) ( not ( = ?auto_491197 ?auto_491204 ) ) ( not ( = ?auto_491198 ?auto_491199 ) ) ( not ( = ?auto_491198 ?auto_491200 ) ) ( not ( = ?auto_491198 ?auto_491201 ) ) ( not ( = ?auto_491198 ?auto_491202 ) ) ( not ( = ?auto_491198 ?auto_491203 ) ) ( not ( = ?auto_491198 ?auto_491204 ) ) ( not ( = ?auto_491199 ?auto_491200 ) ) ( not ( = ?auto_491199 ?auto_491201 ) ) ( not ( = ?auto_491199 ?auto_491202 ) ) ( not ( = ?auto_491199 ?auto_491203 ) ) ( not ( = ?auto_491199 ?auto_491204 ) ) ( not ( = ?auto_491200 ?auto_491201 ) ) ( not ( = ?auto_491200 ?auto_491202 ) ) ( not ( = ?auto_491200 ?auto_491203 ) ) ( not ( = ?auto_491200 ?auto_491204 ) ) ( not ( = ?auto_491201 ?auto_491202 ) ) ( not ( = ?auto_491201 ?auto_491203 ) ) ( not ( = ?auto_491201 ?auto_491204 ) ) ( not ( = ?auto_491202 ?auto_491203 ) ) ( not ( = ?auto_491202 ?auto_491204 ) ) ( not ( = ?auto_491203 ?auto_491204 ) ) ( ON ?auto_491202 ?auto_491203 ) ( ON ?auto_491201 ?auto_491202 ) ( ON ?auto_491200 ?auto_491201 ) ( ON ?auto_491199 ?auto_491200 ) ( ON ?auto_491198 ?auto_491199 ) ( ON ?auto_491197 ?auto_491198 ) ( CLEAR ?auto_491195 ) ( ON ?auto_491196 ?auto_491197 ) ( CLEAR ?auto_491196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_491195 ?auto_491196 )
      ( MAKE-9PILE ?auto_491195 ?auto_491196 ?auto_491197 ?auto_491198 ?auto_491199 ?auto_491200 ?auto_491201 ?auto_491202 ?auto_491203 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_491233 - BLOCK
      ?auto_491234 - BLOCK
      ?auto_491235 - BLOCK
      ?auto_491236 - BLOCK
      ?auto_491237 - BLOCK
      ?auto_491238 - BLOCK
      ?auto_491239 - BLOCK
      ?auto_491240 - BLOCK
      ?auto_491241 - BLOCK
    )
    :vars
    (
      ?auto_491242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491241 ?auto_491242 ) ( not ( = ?auto_491233 ?auto_491234 ) ) ( not ( = ?auto_491233 ?auto_491235 ) ) ( not ( = ?auto_491233 ?auto_491236 ) ) ( not ( = ?auto_491233 ?auto_491237 ) ) ( not ( = ?auto_491233 ?auto_491238 ) ) ( not ( = ?auto_491233 ?auto_491239 ) ) ( not ( = ?auto_491233 ?auto_491240 ) ) ( not ( = ?auto_491233 ?auto_491241 ) ) ( not ( = ?auto_491233 ?auto_491242 ) ) ( not ( = ?auto_491234 ?auto_491235 ) ) ( not ( = ?auto_491234 ?auto_491236 ) ) ( not ( = ?auto_491234 ?auto_491237 ) ) ( not ( = ?auto_491234 ?auto_491238 ) ) ( not ( = ?auto_491234 ?auto_491239 ) ) ( not ( = ?auto_491234 ?auto_491240 ) ) ( not ( = ?auto_491234 ?auto_491241 ) ) ( not ( = ?auto_491234 ?auto_491242 ) ) ( not ( = ?auto_491235 ?auto_491236 ) ) ( not ( = ?auto_491235 ?auto_491237 ) ) ( not ( = ?auto_491235 ?auto_491238 ) ) ( not ( = ?auto_491235 ?auto_491239 ) ) ( not ( = ?auto_491235 ?auto_491240 ) ) ( not ( = ?auto_491235 ?auto_491241 ) ) ( not ( = ?auto_491235 ?auto_491242 ) ) ( not ( = ?auto_491236 ?auto_491237 ) ) ( not ( = ?auto_491236 ?auto_491238 ) ) ( not ( = ?auto_491236 ?auto_491239 ) ) ( not ( = ?auto_491236 ?auto_491240 ) ) ( not ( = ?auto_491236 ?auto_491241 ) ) ( not ( = ?auto_491236 ?auto_491242 ) ) ( not ( = ?auto_491237 ?auto_491238 ) ) ( not ( = ?auto_491237 ?auto_491239 ) ) ( not ( = ?auto_491237 ?auto_491240 ) ) ( not ( = ?auto_491237 ?auto_491241 ) ) ( not ( = ?auto_491237 ?auto_491242 ) ) ( not ( = ?auto_491238 ?auto_491239 ) ) ( not ( = ?auto_491238 ?auto_491240 ) ) ( not ( = ?auto_491238 ?auto_491241 ) ) ( not ( = ?auto_491238 ?auto_491242 ) ) ( not ( = ?auto_491239 ?auto_491240 ) ) ( not ( = ?auto_491239 ?auto_491241 ) ) ( not ( = ?auto_491239 ?auto_491242 ) ) ( not ( = ?auto_491240 ?auto_491241 ) ) ( not ( = ?auto_491240 ?auto_491242 ) ) ( not ( = ?auto_491241 ?auto_491242 ) ) ( ON ?auto_491240 ?auto_491241 ) ( ON ?auto_491239 ?auto_491240 ) ( ON ?auto_491238 ?auto_491239 ) ( ON ?auto_491237 ?auto_491238 ) ( ON ?auto_491236 ?auto_491237 ) ( ON ?auto_491235 ?auto_491236 ) ( ON ?auto_491234 ?auto_491235 ) ( ON ?auto_491233 ?auto_491234 ) ( CLEAR ?auto_491233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_491233 )
      ( MAKE-9PILE ?auto_491233 ?auto_491234 ?auto_491235 ?auto_491236 ?auto_491237 ?auto_491238 ?auto_491239 ?auto_491240 ?auto_491241 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_491272 - BLOCK
      ?auto_491273 - BLOCK
      ?auto_491274 - BLOCK
      ?auto_491275 - BLOCK
      ?auto_491276 - BLOCK
      ?auto_491277 - BLOCK
      ?auto_491278 - BLOCK
      ?auto_491279 - BLOCK
      ?auto_491280 - BLOCK
      ?auto_491281 - BLOCK
    )
    :vars
    (
      ?auto_491282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_491280 ) ( ON ?auto_491281 ?auto_491282 ) ( CLEAR ?auto_491281 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_491272 ) ( ON ?auto_491273 ?auto_491272 ) ( ON ?auto_491274 ?auto_491273 ) ( ON ?auto_491275 ?auto_491274 ) ( ON ?auto_491276 ?auto_491275 ) ( ON ?auto_491277 ?auto_491276 ) ( ON ?auto_491278 ?auto_491277 ) ( ON ?auto_491279 ?auto_491278 ) ( ON ?auto_491280 ?auto_491279 ) ( not ( = ?auto_491272 ?auto_491273 ) ) ( not ( = ?auto_491272 ?auto_491274 ) ) ( not ( = ?auto_491272 ?auto_491275 ) ) ( not ( = ?auto_491272 ?auto_491276 ) ) ( not ( = ?auto_491272 ?auto_491277 ) ) ( not ( = ?auto_491272 ?auto_491278 ) ) ( not ( = ?auto_491272 ?auto_491279 ) ) ( not ( = ?auto_491272 ?auto_491280 ) ) ( not ( = ?auto_491272 ?auto_491281 ) ) ( not ( = ?auto_491272 ?auto_491282 ) ) ( not ( = ?auto_491273 ?auto_491274 ) ) ( not ( = ?auto_491273 ?auto_491275 ) ) ( not ( = ?auto_491273 ?auto_491276 ) ) ( not ( = ?auto_491273 ?auto_491277 ) ) ( not ( = ?auto_491273 ?auto_491278 ) ) ( not ( = ?auto_491273 ?auto_491279 ) ) ( not ( = ?auto_491273 ?auto_491280 ) ) ( not ( = ?auto_491273 ?auto_491281 ) ) ( not ( = ?auto_491273 ?auto_491282 ) ) ( not ( = ?auto_491274 ?auto_491275 ) ) ( not ( = ?auto_491274 ?auto_491276 ) ) ( not ( = ?auto_491274 ?auto_491277 ) ) ( not ( = ?auto_491274 ?auto_491278 ) ) ( not ( = ?auto_491274 ?auto_491279 ) ) ( not ( = ?auto_491274 ?auto_491280 ) ) ( not ( = ?auto_491274 ?auto_491281 ) ) ( not ( = ?auto_491274 ?auto_491282 ) ) ( not ( = ?auto_491275 ?auto_491276 ) ) ( not ( = ?auto_491275 ?auto_491277 ) ) ( not ( = ?auto_491275 ?auto_491278 ) ) ( not ( = ?auto_491275 ?auto_491279 ) ) ( not ( = ?auto_491275 ?auto_491280 ) ) ( not ( = ?auto_491275 ?auto_491281 ) ) ( not ( = ?auto_491275 ?auto_491282 ) ) ( not ( = ?auto_491276 ?auto_491277 ) ) ( not ( = ?auto_491276 ?auto_491278 ) ) ( not ( = ?auto_491276 ?auto_491279 ) ) ( not ( = ?auto_491276 ?auto_491280 ) ) ( not ( = ?auto_491276 ?auto_491281 ) ) ( not ( = ?auto_491276 ?auto_491282 ) ) ( not ( = ?auto_491277 ?auto_491278 ) ) ( not ( = ?auto_491277 ?auto_491279 ) ) ( not ( = ?auto_491277 ?auto_491280 ) ) ( not ( = ?auto_491277 ?auto_491281 ) ) ( not ( = ?auto_491277 ?auto_491282 ) ) ( not ( = ?auto_491278 ?auto_491279 ) ) ( not ( = ?auto_491278 ?auto_491280 ) ) ( not ( = ?auto_491278 ?auto_491281 ) ) ( not ( = ?auto_491278 ?auto_491282 ) ) ( not ( = ?auto_491279 ?auto_491280 ) ) ( not ( = ?auto_491279 ?auto_491281 ) ) ( not ( = ?auto_491279 ?auto_491282 ) ) ( not ( = ?auto_491280 ?auto_491281 ) ) ( not ( = ?auto_491280 ?auto_491282 ) ) ( not ( = ?auto_491281 ?auto_491282 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_491281 ?auto_491282 )
      ( !STACK ?auto_491281 ?auto_491280 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_491314 - BLOCK
      ?auto_491315 - BLOCK
      ?auto_491316 - BLOCK
      ?auto_491317 - BLOCK
      ?auto_491318 - BLOCK
      ?auto_491319 - BLOCK
      ?auto_491320 - BLOCK
      ?auto_491321 - BLOCK
      ?auto_491322 - BLOCK
      ?auto_491323 - BLOCK
    )
    :vars
    (
      ?auto_491324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491323 ?auto_491324 ) ( ON-TABLE ?auto_491314 ) ( ON ?auto_491315 ?auto_491314 ) ( ON ?auto_491316 ?auto_491315 ) ( ON ?auto_491317 ?auto_491316 ) ( ON ?auto_491318 ?auto_491317 ) ( ON ?auto_491319 ?auto_491318 ) ( ON ?auto_491320 ?auto_491319 ) ( ON ?auto_491321 ?auto_491320 ) ( not ( = ?auto_491314 ?auto_491315 ) ) ( not ( = ?auto_491314 ?auto_491316 ) ) ( not ( = ?auto_491314 ?auto_491317 ) ) ( not ( = ?auto_491314 ?auto_491318 ) ) ( not ( = ?auto_491314 ?auto_491319 ) ) ( not ( = ?auto_491314 ?auto_491320 ) ) ( not ( = ?auto_491314 ?auto_491321 ) ) ( not ( = ?auto_491314 ?auto_491322 ) ) ( not ( = ?auto_491314 ?auto_491323 ) ) ( not ( = ?auto_491314 ?auto_491324 ) ) ( not ( = ?auto_491315 ?auto_491316 ) ) ( not ( = ?auto_491315 ?auto_491317 ) ) ( not ( = ?auto_491315 ?auto_491318 ) ) ( not ( = ?auto_491315 ?auto_491319 ) ) ( not ( = ?auto_491315 ?auto_491320 ) ) ( not ( = ?auto_491315 ?auto_491321 ) ) ( not ( = ?auto_491315 ?auto_491322 ) ) ( not ( = ?auto_491315 ?auto_491323 ) ) ( not ( = ?auto_491315 ?auto_491324 ) ) ( not ( = ?auto_491316 ?auto_491317 ) ) ( not ( = ?auto_491316 ?auto_491318 ) ) ( not ( = ?auto_491316 ?auto_491319 ) ) ( not ( = ?auto_491316 ?auto_491320 ) ) ( not ( = ?auto_491316 ?auto_491321 ) ) ( not ( = ?auto_491316 ?auto_491322 ) ) ( not ( = ?auto_491316 ?auto_491323 ) ) ( not ( = ?auto_491316 ?auto_491324 ) ) ( not ( = ?auto_491317 ?auto_491318 ) ) ( not ( = ?auto_491317 ?auto_491319 ) ) ( not ( = ?auto_491317 ?auto_491320 ) ) ( not ( = ?auto_491317 ?auto_491321 ) ) ( not ( = ?auto_491317 ?auto_491322 ) ) ( not ( = ?auto_491317 ?auto_491323 ) ) ( not ( = ?auto_491317 ?auto_491324 ) ) ( not ( = ?auto_491318 ?auto_491319 ) ) ( not ( = ?auto_491318 ?auto_491320 ) ) ( not ( = ?auto_491318 ?auto_491321 ) ) ( not ( = ?auto_491318 ?auto_491322 ) ) ( not ( = ?auto_491318 ?auto_491323 ) ) ( not ( = ?auto_491318 ?auto_491324 ) ) ( not ( = ?auto_491319 ?auto_491320 ) ) ( not ( = ?auto_491319 ?auto_491321 ) ) ( not ( = ?auto_491319 ?auto_491322 ) ) ( not ( = ?auto_491319 ?auto_491323 ) ) ( not ( = ?auto_491319 ?auto_491324 ) ) ( not ( = ?auto_491320 ?auto_491321 ) ) ( not ( = ?auto_491320 ?auto_491322 ) ) ( not ( = ?auto_491320 ?auto_491323 ) ) ( not ( = ?auto_491320 ?auto_491324 ) ) ( not ( = ?auto_491321 ?auto_491322 ) ) ( not ( = ?auto_491321 ?auto_491323 ) ) ( not ( = ?auto_491321 ?auto_491324 ) ) ( not ( = ?auto_491322 ?auto_491323 ) ) ( not ( = ?auto_491322 ?auto_491324 ) ) ( not ( = ?auto_491323 ?auto_491324 ) ) ( CLEAR ?auto_491321 ) ( ON ?auto_491322 ?auto_491323 ) ( CLEAR ?auto_491322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_491314 ?auto_491315 ?auto_491316 ?auto_491317 ?auto_491318 ?auto_491319 ?auto_491320 ?auto_491321 ?auto_491322 )
      ( MAKE-10PILE ?auto_491314 ?auto_491315 ?auto_491316 ?auto_491317 ?auto_491318 ?auto_491319 ?auto_491320 ?auto_491321 ?auto_491322 ?auto_491323 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_491356 - BLOCK
      ?auto_491357 - BLOCK
      ?auto_491358 - BLOCK
      ?auto_491359 - BLOCK
      ?auto_491360 - BLOCK
      ?auto_491361 - BLOCK
      ?auto_491362 - BLOCK
      ?auto_491363 - BLOCK
      ?auto_491364 - BLOCK
      ?auto_491365 - BLOCK
    )
    :vars
    (
      ?auto_491366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491365 ?auto_491366 ) ( ON-TABLE ?auto_491356 ) ( ON ?auto_491357 ?auto_491356 ) ( ON ?auto_491358 ?auto_491357 ) ( ON ?auto_491359 ?auto_491358 ) ( ON ?auto_491360 ?auto_491359 ) ( ON ?auto_491361 ?auto_491360 ) ( ON ?auto_491362 ?auto_491361 ) ( not ( = ?auto_491356 ?auto_491357 ) ) ( not ( = ?auto_491356 ?auto_491358 ) ) ( not ( = ?auto_491356 ?auto_491359 ) ) ( not ( = ?auto_491356 ?auto_491360 ) ) ( not ( = ?auto_491356 ?auto_491361 ) ) ( not ( = ?auto_491356 ?auto_491362 ) ) ( not ( = ?auto_491356 ?auto_491363 ) ) ( not ( = ?auto_491356 ?auto_491364 ) ) ( not ( = ?auto_491356 ?auto_491365 ) ) ( not ( = ?auto_491356 ?auto_491366 ) ) ( not ( = ?auto_491357 ?auto_491358 ) ) ( not ( = ?auto_491357 ?auto_491359 ) ) ( not ( = ?auto_491357 ?auto_491360 ) ) ( not ( = ?auto_491357 ?auto_491361 ) ) ( not ( = ?auto_491357 ?auto_491362 ) ) ( not ( = ?auto_491357 ?auto_491363 ) ) ( not ( = ?auto_491357 ?auto_491364 ) ) ( not ( = ?auto_491357 ?auto_491365 ) ) ( not ( = ?auto_491357 ?auto_491366 ) ) ( not ( = ?auto_491358 ?auto_491359 ) ) ( not ( = ?auto_491358 ?auto_491360 ) ) ( not ( = ?auto_491358 ?auto_491361 ) ) ( not ( = ?auto_491358 ?auto_491362 ) ) ( not ( = ?auto_491358 ?auto_491363 ) ) ( not ( = ?auto_491358 ?auto_491364 ) ) ( not ( = ?auto_491358 ?auto_491365 ) ) ( not ( = ?auto_491358 ?auto_491366 ) ) ( not ( = ?auto_491359 ?auto_491360 ) ) ( not ( = ?auto_491359 ?auto_491361 ) ) ( not ( = ?auto_491359 ?auto_491362 ) ) ( not ( = ?auto_491359 ?auto_491363 ) ) ( not ( = ?auto_491359 ?auto_491364 ) ) ( not ( = ?auto_491359 ?auto_491365 ) ) ( not ( = ?auto_491359 ?auto_491366 ) ) ( not ( = ?auto_491360 ?auto_491361 ) ) ( not ( = ?auto_491360 ?auto_491362 ) ) ( not ( = ?auto_491360 ?auto_491363 ) ) ( not ( = ?auto_491360 ?auto_491364 ) ) ( not ( = ?auto_491360 ?auto_491365 ) ) ( not ( = ?auto_491360 ?auto_491366 ) ) ( not ( = ?auto_491361 ?auto_491362 ) ) ( not ( = ?auto_491361 ?auto_491363 ) ) ( not ( = ?auto_491361 ?auto_491364 ) ) ( not ( = ?auto_491361 ?auto_491365 ) ) ( not ( = ?auto_491361 ?auto_491366 ) ) ( not ( = ?auto_491362 ?auto_491363 ) ) ( not ( = ?auto_491362 ?auto_491364 ) ) ( not ( = ?auto_491362 ?auto_491365 ) ) ( not ( = ?auto_491362 ?auto_491366 ) ) ( not ( = ?auto_491363 ?auto_491364 ) ) ( not ( = ?auto_491363 ?auto_491365 ) ) ( not ( = ?auto_491363 ?auto_491366 ) ) ( not ( = ?auto_491364 ?auto_491365 ) ) ( not ( = ?auto_491364 ?auto_491366 ) ) ( not ( = ?auto_491365 ?auto_491366 ) ) ( ON ?auto_491364 ?auto_491365 ) ( CLEAR ?auto_491362 ) ( ON ?auto_491363 ?auto_491364 ) ( CLEAR ?auto_491363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_491356 ?auto_491357 ?auto_491358 ?auto_491359 ?auto_491360 ?auto_491361 ?auto_491362 ?auto_491363 )
      ( MAKE-10PILE ?auto_491356 ?auto_491357 ?auto_491358 ?auto_491359 ?auto_491360 ?auto_491361 ?auto_491362 ?auto_491363 ?auto_491364 ?auto_491365 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_491398 - BLOCK
      ?auto_491399 - BLOCK
      ?auto_491400 - BLOCK
      ?auto_491401 - BLOCK
      ?auto_491402 - BLOCK
      ?auto_491403 - BLOCK
      ?auto_491404 - BLOCK
      ?auto_491405 - BLOCK
      ?auto_491406 - BLOCK
      ?auto_491407 - BLOCK
    )
    :vars
    (
      ?auto_491408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491407 ?auto_491408 ) ( ON-TABLE ?auto_491398 ) ( ON ?auto_491399 ?auto_491398 ) ( ON ?auto_491400 ?auto_491399 ) ( ON ?auto_491401 ?auto_491400 ) ( ON ?auto_491402 ?auto_491401 ) ( ON ?auto_491403 ?auto_491402 ) ( not ( = ?auto_491398 ?auto_491399 ) ) ( not ( = ?auto_491398 ?auto_491400 ) ) ( not ( = ?auto_491398 ?auto_491401 ) ) ( not ( = ?auto_491398 ?auto_491402 ) ) ( not ( = ?auto_491398 ?auto_491403 ) ) ( not ( = ?auto_491398 ?auto_491404 ) ) ( not ( = ?auto_491398 ?auto_491405 ) ) ( not ( = ?auto_491398 ?auto_491406 ) ) ( not ( = ?auto_491398 ?auto_491407 ) ) ( not ( = ?auto_491398 ?auto_491408 ) ) ( not ( = ?auto_491399 ?auto_491400 ) ) ( not ( = ?auto_491399 ?auto_491401 ) ) ( not ( = ?auto_491399 ?auto_491402 ) ) ( not ( = ?auto_491399 ?auto_491403 ) ) ( not ( = ?auto_491399 ?auto_491404 ) ) ( not ( = ?auto_491399 ?auto_491405 ) ) ( not ( = ?auto_491399 ?auto_491406 ) ) ( not ( = ?auto_491399 ?auto_491407 ) ) ( not ( = ?auto_491399 ?auto_491408 ) ) ( not ( = ?auto_491400 ?auto_491401 ) ) ( not ( = ?auto_491400 ?auto_491402 ) ) ( not ( = ?auto_491400 ?auto_491403 ) ) ( not ( = ?auto_491400 ?auto_491404 ) ) ( not ( = ?auto_491400 ?auto_491405 ) ) ( not ( = ?auto_491400 ?auto_491406 ) ) ( not ( = ?auto_491400 ?auto_491407 ) ) ( not ( = ?auto_491400 ?auto_491408 ) ) ( not ( = ?auto_491401 ?auto_491402 ) ) ( not ( = ?auto_491401 ?auto_491403 ) ) ( not ( = ?auto_491401 ?auto_491404 ) ) ( not ( = ?auto_491401 ?auto_491405 ) ) ( not ( = ?auto_491401 ?auto_491406 ) ) ( not ( = ?auto_491401 ?auto_491407 ) ) ( not ( = ?auto_491401 ?auto_491408 ) ) ( not ( = ?auto_491402 ?auto_491403 ) ) ( not ( = ?auto_491402 ?auto_491404 ) ) ( not ( = ?auto_491402 ?auto_491405 ) ) ( not ( = ?auto_491402 ?auto_491406 ) ) ( not ( = ?auto_491402 ?auto_491407 ) ) ( not ( = ?auto_491402 ?auto_491408 ) ) ( not ( = ?auto_491403 ?auto_491404 ) ) ( not ( = ?auto_491403 ?auto_491405 ) ) ( not ( = ?auto_491403 ?auto_491406 ) ) ( not ( = ?auto_491403 ?auto_491407 ) ) ( not ( = ?auto_491403 ?auto_491408 ) ) ( not ( = ?auto_491404 ?auto_491405 ) ) ( not ( = ?auto_491404 ?auto_491406 ) ) ( not ( = ?auto_491404 ?auto_491407 ) ) ( not ( = ?auto_491404 ?auto_491408 ) ) ( not ( = ?auto_491405 ?auto_491406 ) ) ( not ( = ?auto_491405 ?auto_491407 ) ) ( not ( = ?auto_491405 ?auto_491408 ) ) ( not ( = ?auto_491406 ?auto_491407 ) ) ( not ( = ?auto_491406 ?auto_491408 ) ) ( not ( = ?auto_491407 ?auto_491408 ) ) ( ON ?auto_491406 ?auto_491407 ) ( ON ?auto_491405 ?auto_491406 ) ( CLEAR ?auto_491403 ) ( ON ?auto_491404 ?auto_491405 ) ( CLEAR ?auto_491404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_491398 ?auto_491399 ?auto_491400 ?auto_491401 ?auto_491402 ?auto_491403 ?auto_491404 )
      ( MAKE-10PILE ?auto_491398 ?auto_491399 ?auto_491400 ?auto_491401 ?auto_491402 ?auto_491403 ?auto_491404 ?auto_491405 ?auto_491406 ?auto_491407 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_491440 - BLOCK
      ?auto_491441 - BLOCK
      ?auto_491442 - BLOCK
      ?auto_491443 - BLOCK
      ?auto_491444 - BLOCK
      ?auto_491445 - BLOCK
      ?auto_491446 - BLOCK
      ?auto_491447 - BLOCK
      ?auto_491448 - BLOCK
      ?auto_491449 - BLOCK
    )
    :vars
    (
      ?auto_491450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491449 ?auto_491450 ) ( ON-TABLE ?auto_491440 ) ( ON ?auto_491441 ?auto_491440 ) ( ON ?auto_491442 ?auto_491441 ) ( ON ?auto_491443 ?auto_491442 ) ( ON ?auto_491444 ?auto_491443 ) ( not ( = ?auto_491440 ?auto_491441 ) ) ( not ( = ?auto_491440 ?auto_491442 ) ) ( not ( = ?auto_491440 ?auto_491443 ) ) ( not ( = ?auto_491440 ?auto_491444 ) ) ( not ( = ?auto_491440 ?auto_491445 ) ) ( not ( = ?auto_491440 ?auto_491446 ) ) ( not ( = ?auto_491440 ?auto_491447 ) ) ( not ( = ?auto_491440 ?auto_491448 ) ) ( not ( = ?auto_491440 ?auto_491449 ) ) ( not ( = ?auto_491440 ?auto_491450 ) ) ( not ( = ?auto_491441 ?auto_491442 ) ) ( not ( = ?auto_491441 ?auto_491443 ) ) ( not ( = ?auto_491441 ?auto_491444 ) ) ( not ( = ?auto_491441 ?auto_491445 ) ) ( not ( = ?auto_491441 ?auto_491446 ) ) ( not ( = ?auto_491441 ?auto_491447 ) ) ( not ( = ?auto_491441 ?auto_491448 ) ) ( not ( = ?auto_491441 ?auto_491449 ) ) ( not ( = ?auto_491441 ?auto_491450 ) ) ( not ( = ?auto_491442 ?auto_491443 ) ) ( not ( = ?auto_491442 ?auto_491444 ) ) ( not ( = ?auto_491442 ?auto_491445 ) ) ( not ( = ?auto_491442 ?auto_491446 ) ) ( not ( = ?auto_491442 ?auto_491447 ) ) ( not ( = ?auto_491442 ?auto_491448 ) ) ( not ( = ?auto_491442 ?auto_491449 ) ) ( not ( = ?auto_491442 ?auto_491450 ) ) ( not ( = ?auto_491443 ?auto_491444 ) ) ( not ( = ?auto_491443 ?auto_491445 ) ) ( not ( = ?auto_491443 ?auto_491446 ) ) ( not ( = ?auto_491443 ?auto_491447 ) ) ( not ( = ?auto_491443 ?auto_491448 ) ) ( not ( = ?auto_491443 ?auto_491449 ) ) ( not ( = ?auto_491443 ?auto_491450 ) ) ( not ( = ?auto_491444 ?auto_491445 ) ) ( not ( = ?auto_491444 ?auto_491446 ) ) ( not ( = ?auto_491444 ?auto_491447 ) ) ( not ( = ?auto_491444 ?auto_491448 ) ) ( not ( = ?auto_491444 ?auto_491449 ) ) ( not ( = ?auto_491444 ?auto_491450 ) ) ( not ( = ?auto_491445 ?auto_491446 ) ) ( not ( = ?auto_491445 ?auto_491447 ) ) ( not ( = ?auto_491445 ?auto_491448 ) ) ( not ( = ?auto_491445 ?auto_491449 ) ) ( not ( = ?auto_491445 ?auto_491450 ) ) ( not ( = ?auto_491446 ?auto_491447 ) ) ( not ( = ?auto_491446 ?auto_491448 ) ) ( not ( = ?auto_491446 ?auto_491449 ) ) ( not ( = ?auto_491446 ?auto_491450 ) ) ( not ( = ?auto_491447 ?auto_491448 ) ) ( not ( = ?auto_491447 ?auto_491449 ) ) ( not ( = ?auto_491447 ?auto_491450 ) ) ( not ( = ?auto_491448 ?auto_491449 ) ) ( not ( = ?auto_491448 ?auto_491450 ) ) ( not ( = ?auto_491449 ?auto_491450 ) ) ( ON ?auto_491448 ?auto_491449 ) ( ON ?auto_491447 ?auto_491448 ) ( ON ?auto_491446 ?auto_491447 ) ( CLEAR ?auto_491444 ) ( ON ?auto_491445 ?auto_491446 ) ( CLEAR ?auto_491445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_491440 ?auto_491441 ?auto_491442 ?auto_491443 ?auto_491444 ?auto_491445 )
      ( MAKE-10PILE ?auto_491440 ?auto_491441 ?auto_491442 ?auto_491443 ?auto_491444 ?auto_491445 ?auto_491446 ?auto_491447 ?auto_491448 ?auto_491449 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_491482 - BLOCK
      ?auto_491483 - BLOCK
      ?auto_491484 - BLOCK
      ?auto_491485 - BLOCK
      ?auto_491486 - BLOCK
      ?auto_491487 - BLOCK
      ?auto_491488 - BLOCK
      ?auto_491489 - BLOCK
      ?auto_491490 - BLOCK
      ?auto_491491 - BLOCK
    )
    :vars
    (
      ?auto_491492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491491 ?auto_491492 ) ( ON-TABLE ?auto_491482 ) ( ON ?auto_491483 ?auto_491482 ) ( ON ?auto_491484 ?auto_491483 ) ( ON ?auto_491485 ?auto_491484 ) ( not ( = ?auto_491482 ?auto_491483 ) ) ( not ( = ?auto_491482 ?auto_491484 ) ) ( not ( = ?auto_491482 ?auto_491485 ) ) ( not ( = ?auto_491482 ?auto_491486 ) ) ( not ( = ?auto_491482 ?auto_491487 ) ) ( not ( = ?auto_491482 ?auto_491488 ) ) ( not ( = ?auto_491482 ?auto_491489 ) ) ( not ( = ?auto_491482 ?auto_491490 ) ) ( not ( = ?auto_491482 ?auto_491491 ) ) ( not ( = ?auto_491482 ?auto_491492 ) ) ( not ( = ?auto_491483 ?auto_491484 ) ) ( not ( = ?auto_491483 ?auto_491485 ) ) ( not ( = ?auto_491483 ?auto_491486 ) ) ( not ( = ?auto_491483 ?auto_491487 ) ) ( not ( = ?auto_491483 ?auto_491488 ) ) ( not ( = ?auto_491483 ?auto_491489 ) ) ( not ( = ?auto_491483 ?auto_491490 ) ) ( not ( = ?auto_491483 ?auto_491491 ) ) ( not ( = ?auto_491483 ?auto_491492 ) ) ( not ( = ?auto_491484 ?auto_491485 ) ) ( not ( = ?auto_491484 ?auto_491486 ) ) ( not ( = ?auto_491484 ?auto_491487 ) ) ( not ( = ?auto_491484 ?auto_491488 ) ) ( not ( = ?auto_491484 ?auto_491489 ) ) ( not ( = ?auto_491484 ?auto_491490 ) ) ( not ( = ?auto_491484 ?auto_491491 ) ) ( not ( = ?auto_491484 ?auto_491492 ) ) ( not ( = ?auto_491485 ?auto_491486 ) ) ( not ( = ?auto_491485 ?auto_491487 ) ) ( not ( = ?auto_491485 ?auto_491488 ) ) ( not ( = ?auto_491485 ?auto_491489 ) ) ( not ( = ?auto_491485 ?auto_491490 ) ) ( not ( = ?auto_491485 ?auto_491491 ) ) ( not ( = ?auto_491485 ?auto_491492 ) ) ( not ( = ?auto_491486 ?auto_491487 ) ) ( not ( = ?auto_491486 ?auto_491488 ) ) ( not ( = ?auto_491486 ?auto_491489 ) ) ( not ( = ?auto_491486 ?auto_491490 ) ) ( not ( = ?auto_491486 ?auto_491491 ) ) ( not ( = ?auto_491486 ?auto_491492 ) ) ( not ( = ?auto_491487 ?auto_491488 ) ) ( not ( = ?auto_491487 ?auto_491489 ) ) ( not ( = ?auto_491487 ?auto_491490 ) ) ( not ( = ?auto_491487 ?auto_491491 ) ) ( not ( = ?auto_491487 ?auto_491492 ) ) ( not ( = ?auto_491488 ?auto_491489 ) ) ( not ( = ?auto_491488 ?auto_491490 ) ) ( not ( = ?auto_491488 ?auto_491491 ) ) ( not ( = ?auto_491488 ?auto_491492 ) ) ( not ( = ?auto_491489 ?auto_491490 ) ) ( not ( = ?auto_491489 ?auto_491491 ) ) ( not ( = ?auto_491489 ?auto_491492 ) ) ( not ( = ?auto_491490 ?auto_491491 ) ) ( not ( = ?auto_491490 ?auto_491492 ) ) ( not ( = ?auto_491491 ?auto_491492 ) ) ( ON ?auto_491490 ?auto_491491 ) ( ON ?auto_491489 ?auto_491490 ) ( ON ?auto_491488 ?auto_491489 ) ( ON ?auto_491487 ?auto_491488 ) ( CLEAR ?auto_491485 ) ( ON ?auto_491486 ?auto_491487 ) ( CLEAR ?auto_491486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_491482 ?auto_491483 ?auto_491484 ?auto_491485 ?auto_491486 )
      ( MAKE-10PILE ?auto_491482 ?auto_491483 ?auto_491484 ?auto_491485 ?auto_491486 ?auto_491487 ?auto_491488 ?auto_491489 ?auto_491490 ?auto_491491 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_491524 - BLOCK
      ?auto_491525 - BLOCK
      ?auto_491526 - BLOCK
      ?auto_491527 - BLOCK
      ?auto_491528 - BLOCK
      ?auto_491529 - BLOCK
      ?auto_491530 - BLOCK
      ?auto_491531 - BLOCK
      ?auto_491532 - BLOCK
      ?auto_491533 - BLOCK
    )
    :vars
    (
      ?auto_491534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491533 ?auto_491534 ) ( ON-TABLE ?auto_491524 ) ( ON ?auto_491525 ?auto_491524 ) ( ON ?auto_491526 ?auto_491525 ) ( not ( = ?auto_491524 ?auto_491525 ) ) ( not ( = ?auto_491524 ?auto_491526 ) ) ( not ( = ?auto_491524 ?auto_491527 ) ) ( not ( = ?auto_491524 ?auto_491528 ) ) ( not ( = ?auto_491524 ?auto_491529 ) ) ( not ( = ?auto_491524 ?auto_491530 ) ) ( not ( = ?auto_491524 ?auto_491531 ) ) ( not ( = ?auto_491524 ?auto_491532 ) ) ( not ( = ?auto_491524 ?auto_491533 ) ) ( not ( = ?auto_491524 ?auto_491534 ) ) ( not ( = ?auto_491525 ?auto_491526 ) ) ( not ( = ?auto_491525 ?auto_491527 ) ) ( not ( = ?auto_491525 ?auto_491528 ) ) ( not ( = ?auto_491525 ?auto_491529 ) ) ( not ( = ?auto_491525 ?auto_491530 ) ) ( not ( = ?auto_491525 ?auto_491531 ) ) ( not ( = ?auto_491525 ?auto_491532 ) ) ( not ( = ?auto_491525 ?auto_491533 ) ) ( not ( = ?auto_491525 ?auto_491534 ) ) ( not ( = ?auto_491526 ?auto_491527 ) ) ( not ( = ?auto_491526 ?auto_491528 ) ) ( not ( = ?auto_491526 ?auto_491529 ) ) ( not ( = ?auto_491526 ?auto_491530 ) ) ( not ( = ?auto_491526 ?auto_491531 ) ) ( not ( = ?auto_491526 ?auto_491532 ) ) ( not ( = ?auto_491526 ?auto_491533 ) ) ( not ( = ?auto_491526 ?auto_491534 ) ) ( not ( = ?auto_491527 ?auto_491528 ) ) ( not ( = ?auto_491527 ?auto_491529 ) ) ( not ( = ?auto_491527 ?auto_491530 ) ) ( not ( = ?auto_491527 ?auto_491531 ) ) ( not ( = ?auto_491527 ?auto_491532 ) ) ( not ( = ?auto_491527 ?auto_491533 ) ) ( not ( = ?auto_491527 ?auto_491534 ) ) ( not ( = ?auto_491528 ?auto_491529 ) ) ( not ( = ?auto_491528 ?auto_491530 ) ) ( not ( = ?auto_491528 ?auto_491531 ) ) ( not ( = ?auto_491528 ?auto_491532 ) ) ( not ( = ?auto_491528 ?auto_491533 ) ) ( not ( = ?auto_491528 ?auto_491534 ) ) ( not ( = ?auto_491529 ?auto_491530 ) ) ( not ( = ?auto_491529 ?auto_491531 ) ) ( not ( = ?auto_491529 ?auto_491532 ) ) ( not ( = ?auto_491529 ?auto_491533 ) ) ( not ( = ?auto_491529 ?auto_491534 ) ) ( not ( = ?auto_491530 ?auto_491531 ) ) ( not ( = ?auto_491530 ?auto_491532 ) ) ( not ( = ?auto_491530 ?auto_491533 ) ) ( not ( = ?auto_491530 ?auto_491534 ) ) ( not ( = ?auto_491531 ?auto_491532 ) ) ( not ( = ?auto_491531 ?auto_491533 ) ) ( not ( = ?auto_491531 ?auto_491534 ) ) ( not ( = ?auto_491532 ?auto_491533 ) ) ( not ( = ?auto_491532 ?auto_491534 ) ) ( not ( = ?auto_491533 ?auto_491534 ) ) ( ON ?auto_491532 ?auto_491533 ) ( ON ?auto_491531 ?auto_491532 ) ( ON ?auto_491530 ?auto_491531 ) ( ON ?auto_491529 ?auto_491530 ) ( ON ?auto_491528 ?auto_491529 ) ( CLEAR ?auto_491526 ) ( ON ?auto_491527 ?auto_491528 ) ( CLEAR ?auto_491527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_491524 ?auto_491525 ?auto_491526 ?auto_491527 )
      ( MAKE-10PILE ?auto_491524 ?auto_491525 ?auto_491526 ?auto_491527 ?auto_491528 ?auto_491529 ?auto_491530 ?auto_491531 ?auto_491532 ?auto_491533 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_491566 - BLOCK
      ?auto_491567 - BLOCK
      ?auto_491568 - BLOCK
      ?auto_491569 - BLOCK
      ?auto_491570 - BLOCK
      ?auto_491571 - BLOCK
      ?auto_491572 - BLOCK
      ?auto_491573 - BLOCK
      ?auto_491574 - BLOCK
      ?auto_491575 - BLOCK
    )
    :vars
    (
      ?auto_491576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491575 ?auto_491576 ) ( ON-TABLE ?auto_491566 ) ( ON ?auto_491567 ?auto_491566 ) ( not ( = ?auto_491566 ?auto_491567 ) ) ( not ( = ?auto_491566 ?auto_491568 ) ) ( not ( = ?auto_491566 ?auto_491569 ) ) ( not ( = ?auto_491566 ?auto_491570 ) ) ( not ( = ?auto_491566 ?auto_491571 ) ) ( not ( = ?auto_491566 ?auto_491572 ) ) ( not ( = ?auto_491566 ?auto_491573 ) ) ( not ( = ?auto_491566 ?auto_491574 ) ) ( not ( = ?auto_491566 ?auto_491575 ) ) ( not ( = ?auto_491566 ?auto_491576 ) ) ( not ( = ?auto_491567 ?auto_491568 ) ) ( not ( = ?auto_491567 ?auto_491569 ) ) ( not ( = ?auto_491567 ?auto_491570 ) ) ( not ( = ?auto_491567 ?auto_491571 ) ) ( not ( = ?auto_491567 ?auto_491572 ) ) ( not ( = ?auto_491567 ?auto_491573 ) ) ( not ( = ?auto_491567 ?auto_491574 ) ) ( not ( = ?auto_491567 ?auto_491575 ) ) ( not ( = ?auto_491567 ?auto_491576 ) ) ( not ( = ?auto_491568 ?auto_491569 ) ) ( not ( = ?auto_491568 ?auto_491570 ) ) ( not ( = ?auto_491568 ?auto_491571 ) ) ( not ( = ?auto_491568 ?auto_491572 ) ) ( not ( = ?auto_491568 ?auto_491573 ) ) ( not ( = ?auto_491568 ?auto_491574 ) ) ( not ( = ?auto_491568 ?auto_491575 ) ) ( not ( = ?auto_491568 ?auto_491576 ) ) ( not ( = ?auto_491569 ?auto_491570 ) ) ( not ( = ?auto_491569 ?auto_491571 ) ) ( not ( = ?auto_491569 ?auto_491572 ) ) ( not ( = ?auto_491569 ?auto_491573 ) ) ( not ( = ?auto_491569 ?auto_491574 ) ) ( not ( = ?auto_491569 ?auto_491575 ) ) ( not ( = ?auto_491569 ?auto_491576 ) ) ( not ( = ?auto_491570 ?auto_491571 ) ) ( not ( = ?auto_491570 ?auto_491572 ) ) ( not ( = ?auto_491570 ?auto_491573 ) ) ( not ( = ?auto_491570 ?auto_491574 ) ) ( not ( = ?auto_491570 ?auto_491575 ) ) ( not ( = ?auto_491570 ?auto_491576 ) ) ( not ( = ?auto_491571 ?auto_491572 ) ) ( not ( = ?auto_491571 ?auto_491573 ) ) ( not ( = ?auto_491571 ?auto_491574 ) ) ( not ( = ?auto_491571 ?auto_491575 ) ) ( not ( = ?auto_491571 ?auto_491576 ) ) ( not ( = ?auto_491572 ?auto_491573 ) ) ( not ( = ?auto_491572 ?auto_491574 ) ) ( not ( = ?auto_491572 ?auto_491575 ) ) ( not ( = ?auto_491572 ?auto_491576 ) ) ( not ( = ?auto_491573 ?auto_491574 ) ) ( not ( = ?auto_491573 ?auto_491575 ) ) ( not ( = ?auto_491573 ?auto_491576 ) ) ( not ( = ?auto_491574 ?auto_491575 ) ) ( not ( = ?auto_491574 ?auto_491576 ) ) ( not ( = ?auto_491575 ?auto_491576 ) ) ( ON ?auto_491574 ?auto_491575 ) ( ON ?auto_491573 ?auto_491574 ) ( ON ?auto_491572 ?auto_491573 ) ( ON ?auto_491571 ?auto_491572 ) ( ON ?auto_491570 ?auto_491571 ) ( ON ?auto_491569 ?auto_491570 ) ( CLEAR ?auto_491567 ) ( ON ?auto_491568 ?auto_491569 ) ( CLEAR ?auto_491568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_491566 ?auto_491567 ?auto_491568 )
      ( MAKE-10PILE ?auto_491566 ?auto_491567 ?auto_491568 ?auto_491569 ?auto_491570 ?auto_491571 ?auto_491572 ?auto_491573 ?auto_491574 ?auto_491575 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_491608 - BLOCK
      ?auto_491609 - BLOCK
      ?auto_491610 - BLOCK
      ?auto_491611 - BLOCK
      ?auto_491612 - BLOCK
      ?auto_491613 - BLOCK
      ?auto_491614 - BLOCK
      ?auto_491615 - BLOCK
      ?auto_491616 - BLOCK
      ?auto_491617 - BLOCK
    )
    :vars
    (
      ?auto_491618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491617 ?auto_491618 ) ( ON-TABLE ?auto_491608 ) ( not ( = ?auto_491608 ?auto_491609 ) ) ( not ( = ?auto_491608 ?auto_491610 ) ) ( not ( = ?auto_491608 ?auto_491611 ) ) ( not ( = ?auto_491608 ?auto_491612 ) ) ( not ( = ?auto_491608 ?auto_491613 ) ) ( not ( = ?auto_491608 ?auto_491614 ) ) ( not ( = ?auto_491608 ?auto_491615 ) ) ( not ( = ?auto_491608 ?auto_491616 ) ) ( not ( = ?auto_491608 ?auto_491617 ) ) ( not ( = ?auto_491608 ?auto_491618 ) ) ( not ( = ?auto_491609 ?auto_491610 ) ) ( not ( = ?auto_491609 ?auto_491611 ) ) ( not ( = ?auto_491609 ?auto_491612 ) ) ( not ( = ?auto_491609 ?auto_491613 ) ) ( not ( = ?auto_491609 ?auto_491614 ) ) ( not ( = ?auto_491609 ?auto_491615 ) ) ( not ( = ?auto_491609 ?auto_491616 ) ) ( not ( = ?auto_491609 ?auto_491617 ) ) ( not ( = ?auto_491609 ?auto_491618 ) ) ( not ( = ?auto_491610 ?auto_491611 ) ) ( not ( = ?auto_491610 ?auto_491612 ) ) ( not ( = ?auto_491610 ?auto_491613 ) ) ( not ( = ?auto_491610 ?auto_491614 ) ) ( not ( = ?auto_491610 ?auto_491615 ) ) ( not ( = ?auto_491610 ?auto_491616 ) ) ( not ( = ?auto_491610 ?auto_491617 ) ) ( not ( = ?auto_491610 ?auto_491618 ) ) ( not ( = ?auto_491611 ?auto_491612 ) ) ( not ( = ?auto_491611 ?auto_491613 ) ) ( not ( = ?auto_491611 ?auto_491614 ) ) ( not ( = ?auto_491611 ?auto_491615 ) ) ( not ( = ?auto_491611 ?auto_491616 ) ) ( not ( = ?auto_491611 ?auto_491617 ) ) ( not ( = ?auto_491611 ?auto_491618 ) ) ( not ( = ?auto_491612 ?auto_491613 ) ) ( not ( = ?auto_491612 ?auto_491614 ) ) ( not ( = ?auto_491612 ?auto_491615 ) ) ( not ( = ?auto_491612 ?auto_491616 ) ) ( not ( = ?auto_491612 ?auto_491617 ) ) ( not ( = ?auto_491612 ?auto_491618 ) ) ( not ( = ?auto_491613 ?auto_491614 ) ) ( not ( = ?auto_491613 ?auto_491615 ) ) ( not ( = ?auto_491613 ?auto_491616 ) ) ( not ( = ?auto_491613 ?auto_491617 ) ) ( not ( = ?auto_491613 ?auto_491618 ) ) ( not ( = ?auto_491614 ?auto_491615 ) ) ( not ( = ?auto_491614 ?auto_491616 ) ) ( not ( = ?auto_491614 ?auto_491617 ) ) ( not ( = ?auto_491614 ?auto_491618 ) ) ( not ( = ?auto_491615 ?auto_491616 ) ) ( not ( = ?auto_491615 ?auto_491617 ) ) ( not ( = ?auto_491615 ?auto_491618 ) ) ( not ( = ?auto_491616 ?auto_491617 ) ) ( not ( = ?auto_491616 ?auto_491618 ) ) ( not ( = ?auto_491617 ?auto_491618 ) ) ( ON ?auto_491616 ?auto_491617 ) ( ON ?auto_491615 ?auto_491616 ) ( ON ?auto_491614 ?auto_491615 ) ( ON ?auto_491613 ?auto_491614 ) ( ON ?auto_491612 ?auto_491613 ) ( ON ?auto_491611 ?auto_491612 ) ( ON ?auto_491610 ?auto_491611 ) ( CLEAR ?auto_491608 ) ( ON ?auto_491609 ?auto_491610 ) ( CLEAR ?auto_491609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_491608 ?auto_491609 )
      ( MAKE-10PILE ?auto_491608 ?auto_491609 ?auto_491610 ?auto_491611 ?auto_491612 ?auto_491613 ?auto_491614 ?auto_491615 ?auto_491616 ?auto_491617 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_491650 - BLOCK
      ?auto_491651 - BLOCK
      ?auto_491652 - BLOCK
      ?auto_491653 - BLOCK
      ?auto_491654 - BLOCK
      ?auto_491655 - BLOCK
      ?auto_491656 - BLOCK
      ?auto_491657 - BLOCK
      ?auto_491658 - BLOCK
      ?auto_491659 - BLOCK
    )
    :vars
    (
      ?auto_491660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491659 ?auto_491660 ) ( not ( = ?auto_491650 ?auto_491651 ) ) ( not ( = ?auto_491650 ?auto_491652 ) ) ( not ( = ?auto_491650 ?auto_491653 ) ) ( not ( = ?auto_491650 ?auto_491654 ) ) ( not ( = ?auto_491650 ?auto_491655 ) ) ( not ( = ?auto_491650 ?auto_491656 ) ) ( not ( = ?auto_491650 ?auto_491657 ) ) ( not ( = ?auto_491650 ?auto_491658 ) ) ( not ( = ?auto_491650 ?auto_491659 ) ) ( not ( = ?auto_491650 ?auto_491660 ) ) ( not ( = ?auto_491651 ?auto_491652 ) ) ( not ( = ?auto_491651 ?auto_491653 ) ) ( not ( = ?auto_491651 ?auto_491654 ) ) ( not ( = ?auto_491651 ?auto_491655 ) ) ( not ( = ?auto_491651 ?auto_491656 ) ) ( not ( = ?auto_491651 ?auto_491657 ) ) ( not ( = ?auto_491651 ?auto_491658 ) ) ( not ( = ?auto_491651 ?auto_491659 ) ) ( not ( = ?auto_491651 ?auto_491660 ) ) ( not ( = ?auto_491652 ?auto_491653 ) ) ( not ( = ?auto_491652 ?auto_491654 ) ) ( not ( = ?auto_491652 ?auto_491655 ) ) ( not ( = ?auto_491652 ?auto_491656 ) ) ( not ( = ?auto_491652 ?auto_491657 ) ) ( not ( = ?auto_491652 ?auto_491658 ) ) ( not ( = ?auto_491652 ?auto_491659 ) ) ( not ( = ?auto_491652 ?auto_491660 ) ) ( not ( = ?auto_491653 ?auto_491654 ) ) ( not ( = ?auto_491653 ?auto_491655 ) ) ( not ( = ?auto_491653 ?auto_491656 ) ) ( not ( = ?auto_491653 ?auto_491657 ) ) ( not ( = ?auto_491653 ?auto_491658 ) ) ( not ( = ?auto_491653 ?auto_491659 ) ) ( not ( = ?auto_491653 ?auto_491660 ) ) ( not ( = ?auto_491654 ?auto_491655 ) ) ( not ( = ?auto_491654 ?auto_491656 ) ) ( not ( = ?auto_491654 ?auto_491657 ) ) ( not ( = ?auto_491654 ?auto_491658 ) ) ( not ( = ?auto_491654 ?auto_491659 ) ) ( not ( = ?auto_491654 ?auto_491660 ) ) ( not ( = ?auto_491655 ?auto_491656 ) ) ( not ( = ?auto_491655 ?auto_491657 ) ) ( not ( = ?auto_491655 ?auto_491658 ) ) ( not ( = ?auto_491655 ?auto_491659 ) ) ( not ( = ?auto_491655 ?auto_491660 ) ) ( not ( = ?auto_491656 ?auto_491657 ) ) ( not ( = ?auto_491656 ?auto_491658 ) ) ( not ( = ?auto_491656 ?auto_491659 ) ) ( not ( = ?auto_491656 ?auto_491660 ) ) ( not ( = ?auto_491657 ?auto_491658 ) ) ( not ( = ?auto_491657 ?auto_491659 ) ) ( not ( = ?auto_491657 ?auto_491660 ) ) ( not ( = ?auto_491658 ?auto_491659 ) ) ( not ( = ?auto_491658 ?auto_491660 ) ) ( not ( = ?auto_491659 ?auto_491660 ) ) ( ON ?auto_491658 ?auto_491659 ) ( ON ?auto_491657 ?auto_491658 ) ( ON ?auto_491656 ?auto_491657 ) ( ON ?auto_491655 ?auto_491656 ) ( ON ?auto_491654 ?auto_491655 ) ( ON ?auto_491653 ?auto_491654 ) ( ON ?auto_491652 ?auto_491653 ) ( ON ?auto_491651 ?auto_491652 ) ( ON ?auto_491650 ?auto_491651 ) ( CLEAR ?auto_491650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_491650 )
      ( MAKE-10PILE ?auto_491650 ?auto_491651 ?auto_491652 ?auto_491653 ?auto_491654 ?auto_491655 ?auto_491656 ?auto_491657 ?auto_491658 ?auto_491659 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_491693 - BLOCK
      ?auto_491694 - BLOCK
      ?auto_491695 - BLOCK
      ?auto_491696 - BLOCK
      ?auto_491697 - BLOCK
      ?auto_491698 - BLOCK
      ?auto_491699 - BLOCK
      ?auto_491700 - BLOCK
      ?auto_491701 - BLOCK
      ?auto_491702 - BLOCK
      ?auto_491703 - BLOCK
    )
    :vars
    (
      ?auto_491704 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_491702 ) ( ON ?auto_491703 ?auto_491704 ) ( CLEAR ?auto_491703 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_491693 ) ( ON ?auto_491694 ?auto_491693 ) ( ON ?auto_491695 ?auto_491694 ) ( ON ?auto_491696 ?auto_491695 ) ( ON ?auto_491697 ?auto_491696 ) ( ON ?auto_491698 ?auto_491697 ) ( ON ?auto_491699 ?auto_491698 ) ( ON ?auto_491700 ?auto_491699 ) ( ON ?auto_491701 ?auto_491700 ) ( ON ?auto_491702 ?auto_491701 ) ( not ( = ?auto_491693 ?auto_491694 ) ) ( not ( = ?auto_491693 ?auto_491695 ) ) ( not ( = ?auto_491693 ?auto_491696 ) ) ( not ( = ?auto_491693 ?auto_491697 ) ) ( not ( = ?auto_491693 ?auto_491698 ) ) ( not ( = ?auto_491693 ?auto_491699 ) ) ( not ( = ?auto_491693 ?auto_491700 ) ) ( not ( = ?auto_491693 ?auto_491701 ) ) ( not ( = ?auto_491693 ?auto_491702 ) ) ( not ( = ?auto_491693 ?auto_491703 ) ) ( not ( = ?auto_491693 ?auto_491704 ) ) ( not ( = ?auto_491694 ?auto_491695 ) ) ( not ( = ?auto_491694 ?auto_491696 ) ) ( not ( = ?auto_491694 ?auto_491697 ) ) ( not ( = ?auto_491694 ?auto_491698 ) ) ( not ( = ?auto_491694 ?auto_491699 ) ) ( not ( = ?auto_491694 ?auto_491700 ) ) ( not ( = ?auto_491694 ?auto_491701 ) ) ( not ( = ?auto_491694 ?auto_491702 ) ) ( not ( = ?auto_491694 ?auto_491703 ) ) ( not ( = ?auto_491694 ?auto_491704 ) ) ( not ( = ?auto_491695 ?auto_491696 ) ) ( not ( = ?auto_491695 ?auto_491697 ) ) ( not ( = ?auto_491695 ?auto_491698 ) ) ( not ( = ?auto_491695 ?auto_491699 ) ) ( not ( = ?auto_491695 ?auto_491700 ) ) ( not ( = ?auto_491695 ?auto_491701 ) ) ( not ( = ?auto_491695 ?auto_491702 ) ) ( not ( = ?auto_491695 ?auto_491703 ) ) ( not ( = ?auto_491695 ?auto_491704 ) ) ( not ( = ?auto_491696 ?auto_491697 ) ) ( not ( = ?auto_491696 ?auto_491698 ) ) ( not ( = ?auto_491696 ?auto_491699 ) ) ( not ( = ?auto_491696 ?auto_491700 ) ) ( not ( = ?auto_491696 ?auto_491701 ) ) ( not ( = ?auto_491696 ?auto_491702 ) ) ( not ( = ?auto_491696 ?auto_491703 ) ) ( not ( = ?auto_491696 ?auto_491704 ) ) ( not ( = ?auto_491697 ?auto_491698 ) ) ( not ( = ?auto_491697 ?auto_491699 ) ) ( not ( = ?auto_491697 ?auto_491700 ) ) ( not ( = ?auto_491697 ?auto_491701 ) ) ( not ( = ?auto_491697 ?auto_491702 ) ) ( not ( = ?auto_491697 ?auto_491703 ) ) ( not ( = ?auto_491697 ?auto_491704 ) ) ( not ( = ?auto_491698 ?auto_491699 ) ) ( not ( = ?auto_491698 ?auto_491700 ) ) ( not ( = ?auto_491698 ?auto_491701 ) ) ( not ( = ?auto_491698 ?auto_491702 ) ) ( not ( = ?auto_491698 ?auto_491703 ) ) ( not ( = ?auto_491698 ?auto_491704 ) ) ( not ( = ?auto_491699 ?auto_491700 ) ) ( not ( = ?auto_491699 ?auto_491701 ) ) ( not ( = ?auto_491699 ?auto_491702 ) ) ( not ( = ?auto_491699 ?auto_491703 ) ) ( not ( = ?auto_491699 ?auto_491704 ) ) ( not ( = ?auto_491700 ?auto_491701 ) ) ( not ( = ?auto_491700 ?auto_491702 ) ) ( not ( = ?auto_491700 ?auto_491703 ) ) ( not ( = ?auto_491700 ?auto_491704 ) ) ( not ( = ?auto_491701 ?auto_491702 ) ) ( not ( = ?auto_491701 ?auto_491703 ) ) ( not ( = ?auto_491701 ?auto_491704 ) ) ( not ( = ?auto_491702 ?auto_491703 ) ) ( not ( = ?auto_491702 ?auto_491704 ) ) ( not ( = ?auto_491703 ?auto_491704 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_491703 ?auto_491704 )
      ( !STACK ?auto_491703 ?auto_491702 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_491739 - BLOCK
      ?auto_491740 - BLOCK
      ?auto_491741 - BLOCK
      ?auto_491742 - BLOCK
      ?auto_491743 - BLOCK
      ?auto_491744 - BLOCK
      ?auto_491745 - BLOCK
      ?auto_491746 - BLOCK
      ?auto_491747 - BLOCK
      ?auto_491748 - BLOCK
      ?auto_491749 - BLOCK
    )
    :vars
    (
      ?auto_491750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491749 ?auto_491750 ) ( ON-TABLE ?auto_491739 ) ( ON ?auto_491740 ?auto_491739 ) ( ON ?auto_491741 ?auto_491740 ) ( ON ?auto_491742 ?auto_491741 ) ( ON ?auto_491743 ?auto_491742 ) ( ON ?auto_491744 ?auto_491743 ) ( ON ?auto_491745 ?auto_491744 ) ( ON ?auto_491746 ?auto_491745 ) ( ON ?auto_491747 ?auto_491746 ) ( not ( = ?auto_491739 ?auto_491740 ) ) ( not ( = ?auto_491739 ?auto_491741 ) ) ( not ( = ?auto_491739 ?auto_491742 ) ) ( not ( = ?auto_491739 ?auto_491743 ) ) ( not ( = ?auto_491739 ?auto_491744 ) ) ( not ( = ?auto_491739 ?auto_491745 ) ) ( not ( = ?auto_491739 ?auto_491746 ) ) ( not ( = ?auto_491739 ?auto_491747 ) ) ( not ( = ?auto_491739 ?auto_491748 ) ) ( not ( = ?auto_491739 ?auto_491749 ) ) ( not ( = ?auto_491739 ?auto_491750 ) ) ( not ( = ?auto_491740 ?auto_491741 ) ) ( not ( = ?auto_491740 ?auto_491742 ) ) ( not ( = ?auto_491740 ?auto_491743 ) ) ( not ( = ?auto_491740 ?auto_491744 ) ) ( not ( = ?auto_491740 ?auto_491745 ) ) ( not ( = ?auto_491740 ?auto_491746 ) ) ( not ( = ?auto_491740 ?auto_491747 ) ) ( not ( = ?auto_491740 ?auto_491748 ) ) ( not ( = ?auto_491740 ?auto_491749 ) ) ( not ( = ?auto_491740 ?auto_491750 ) ) ( not ( = ?auto_491741 ?auto_491742 ) ) ( not ( = ?auto_491741 ?auto_491743 ) ) ( not ( = ?auto_491741 ?auto_491744 ) ) ( not ( = ?auto_491741 ?auto_491745 ) ) ( not ( = ?auto_491741 ?auto_491746 ) ) ( not ( = ?auto_491741 ?auto_491747 ) ) ( not ( = ?auto_491741 ?auto_491748 ) ) ( not ( = ?auto_491741 ?auto_491749 ) ) ( not ( = ?auto_491741 ?auto_491750 ) ) ( not ( = ?auto_491742 ?auto_491743 ) ) ( not ( = ?auto_491742 ?auto_491744 ) ) ( not ( = ?auto_491742 ?auto_491745 ) ) ( not ( = ?auto_491742 ?auto_491746 ) ) ( not ( = ?auto_491742 ?auto_491747 ) ) ( not ( = ?auto_491742 ?auto_491748 ) ) ( not ( = ?auto_491742 ?auto_491749 ) ) ( not ( = ?auto_491742 ?auto_491750 ) ) ( not ( = ?auto_491743 ?auto_491744 ) ) ( not ( = ?auto_491743 ?auto_491745 ) ) ( not ( = ?auto_491743 ?auto_491746 ) ) ( not ( = ?auto_491743 ?auto_491747 ) ) ( not ( = ?auto_491743 ?auto_491748 ) ) ( not ( = ?auto_491743 ?auto_491749 ) ) ( not ( = ?auto_491743 ?auto_491750 ) ) ( not ( = ?auto_491744 ?auto_491745 ) ) ( not ( = ?auto_491744 ?auto_491746 ) ) ( not ( = ?auto_491744 ?auto_491747 ) ) ( not ( = ?auto_491744 ?auto_491748 ) ) ( not ( = ?auto_491744 ?auto_491749 ) ) ( not ( = ?auto_491744 ?auto_491750 ) ) ( not ( = ?auto_491745 ?auto_491746 ) ) ( not ( = ?auto_491745 ?auto_491747 ) ) ( not ( = ?auto_491745 ?auto_491748 ) ) ( not ( = ?auto_491745 ?auto_491749 ) ) ( not ( = ?auto_491745 ?auto_491750 ) ) ( not ( = ?auto_491746 ?auto_491747 ) ) ( not ( = ?auto_491746 ?auto_491748 ) ) ( not ( = ?auto_491746 ?auto_491749 ) ) ( not ( = ?auto_491746 ?auto_491750 ) ) ( not ( = ?auto_491747 ?auto_491748 ) ) ( not ( = ?auto_491747 ?auto_491749 ) ) ( not ( = ?auto_491747 ?auto_491750 ) ) ( not ( = ?auto_491748 ?auto_491749 ) ) ( not ( = ?auto_491748 ?auto_491750 ) ) ( not ( = ?auto_491749 ?auto_491750 ) ) ( CLEAR ?auto_491747 ) ( ON ?auto_491748 ?auto_491749 ) ( CLEAR ?auto_491748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_491739 ?auto_491740 ?auto_491741 ?auto_491742 ?auto_491743 ?auto_491744 ?auto_491745 ?auto_491746 ?auto_491747 ?auto_491748 )
      ( MAKE-11PILE ?auto_491739 ?auto_491740 ?auto_491741 ?auto_491742 ?auto_491743 ?auto_491744 ?auto_491745 ?auto_491746 ?auto_491747 ?auto_491748 ?auto_491749 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_491785 - BLOCK
      ?auto_491786 - BLOCK
      ?auto_491787 - BLOCK
      ?auto_491788 - BLOCK
      ?auto_491789 - BLOCK
      ?auto_491790 - BLOCK
      ?auto_491791 - BLOCK
      ?auto_491792 - BLOCK
      ?auto_491793 - BLOCK
      ?auto_491794 - BLOCK
      ?auto_491795 - BLOCK
    )
    :vars
    (
      ?auto_491796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491795 ?auto_491796 ) ( ON-TABLE ?auto_491785 ) ( ON ?auto_491786 ?auto_491785 ) ( ON ?auto_491787 ?auto_491786 ) ( ON ?auto_491788 ?auto_491787 ) ( ON ?auto_491789 ?auto_491788 ) ( ON ?auto_491790 ?auto_491789 ) ( ON ?auto_491791 ?auto_491790 ) ( ON ?auto_491792 ?auto_491791 ) ( not ( = ?auto_491785 ?auto_491786 ) ) ( not ( = ?auto_491785 ?auto_491787 ) ) ( not ( = ?auto_491785 ?auto_491788 ) ) ( not ( = ?auto_491785 ?auto_491789 ) ) ( not ( = ?auto_491785 ?auto_491790 ) ) ( not ( = ?auto_491785 ?auto_491791 ) ) ( not ( = ?auto_491785 ?auto_491792 ) ) ( not ( = ?auto_491785 ?auto_491793 ) ) ( not ( = ?auto_491785 ?auto_491794 ) ) ( not ( = ?auto_491785 ?auto_491795 ) ) ( not ( = ?auto_491785 ?auto_491796 ) ) ( not ( = ?auto_491786 ?auto_491787 ) ) ( not ( = ?auto_491786 ?auto_491788 ) ) ( not ( = ?auto_491786 ?auto_491789 ) ) ( not ( = ?auto_491786 ?auto_491790 ) ) ( not ( = ?auto_491786 ?auto_491791 ) ) ( not ( = ?auto_491786 ?auto_491792 ) ) ( not ( = ?auto_491786 ?auto_491793 ) ) ( not ( = ?auto_491786 ?auto_491794 ) ) ( not ( = ?auto_491786 ?auto_491795 ) ) ( not ( = ?auto_491786 ?auto_491796 ) ) ( not ( = ?auto_491787 ?auto_491788 ) ) ( not ( = ?auto_491787 ?auto_491789 ) ) ( not ( = ?auto_491787 ?auto_491790 ) ) ( not ( = ?auto_491787 ?auto_491791 ) ) ( not ( = ?auto_491787 ?auto_491792 ) ) ( not ( = ?auto_491787 ?auto_491793 ) ) ( not ( = ?auto_491787 ?auto_491794 ) ) ( not ( = ?auto_491787 ?auto_491795 ) ) ( not ( = ?auto_491787 ?auto_491796 ) ) ( not ( = ?auto_491788 ?auto_491789 ) ) ( not ( = ?auto_491788 ?auto_491790 ) ) ( not ( = ?auto_491788 ?auto_491791 ) ) ( not ( = ?auto_491788 ?auto_491792 ) ) ( not ( = ?auto_491788 ?auto_491793 ) ) ( not ( = ?auto_491788 ?auto_491794 ) ) ( not ( = ?auto_491788 ?auto_491795 ) ) ( not ( = ?auto_491788 ?auto_491796 ) ) ( not ( = ?auto_491789 ?auto_491790 ) ) ( not ( = ?auto_491789 ?auto_491791 ) ) ( not ( = ?auto_491789 ?auto_491792 ) ) ( not ( = ?auto_491789 ?auto_491793 ) ) ( not ( = ?auto_491789 ?auto_491794 ) ) ( not ( = ?auto_491789 ?auto_491795 ) ) ( not ( = ?auto_491789 ?auto_491796 ) ) ( not ( = ?auto_491790 ?auto_491791 ) ) ( not ( = ?auto_491790 ?auto_491792 ) ) ( not ( = ?auto_491790 ?auto_491793 ) ) ( not ( = ?auto_491790 ?auto_491794 ) ) ( not ( = ?auto_491790 ?auto_491795 ) ) ( not ( = ?auto_491790 ?auto_491796 ) ) ( not ( = ?auto_491791 ?auto_491792 ) ) ( not ( = ?auto_491791 ?auto_491793 ) ) ( not ( = ?auto_491791 ?auto_491794 ) ) ( not ( = ?auto_491791 ?auto_491795 ) ) ( not ( = ?auto_491791 ?auto_491796 ) ) ( not ( = ?auto_491792 ?auto_491793 ) ) ( not ( = ?auto_491792 ?auto_491794 ) ) ( not ( = ?auto_491792 ?auto_491795 ) ) ( not ( = ?auto_491792 ?auto_491796 ) ) ( not ( = ?auto_491793 ?auto_491794 ) ) ( not ( = ?auto_491793 ?auto_491795 ) ) ( not ( = ?auto_491793 ?auto_491796 ) ) ( not ( = ?auto_491794 ?auto_491795 ) ) ( not ( = ?auto_491794 ?auto_491796 ) ) ( not ( = ?auto_491795 ?auto_491796 ) ) ( ON ?auto_491794 ?auto_491795 ) ( CLEAR ?auto_491792 ) ( ON ?auto_491793 ?auto_491794 ) ( CLEAR ?auto_491793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_491785 ?auto_491786 ?auto_491787 ?auto_491788 ?auto_491789 ?auto_491790 ?auto_491791 ?auto_491792 ?auto_491793 )
      ( MAKE-11PILE ?auto_491785 ?auto_491786 ?auto_491787 ?auto_491788 ?auto_491789 ?auto_491790 ?auto_491791 ?auto_491792 ?auto_491793 ?auto_491794 ?auto_491795 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_491831 - BLOCK
      ?auto_491832 - BLOCK
      ?auto_491833 - BLOCK
      ?auto_491834 - BLOCK
      ?auto_491835 - BLOCK
      ?auto_491836 - BLOCK
      ?auto_491837 - BLOCK
      ?auto_491838 - BLOCK
      ?auto_491839 - BLOCK
      ?auto_491840 - BLOCK
      ?auto_491841 - BLOCK
    )
    :vars
    (
      ?auto_491842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491841 ?auto_491842 ) ( ON-TABLE ?auto_491831 ) ( ON ?auto_491832 ?auto_491831 ) ( ON ?auto_491833 ?auto_491832 ) ( ON ?auto_491834 ?auto_491833 ) ( ON ?auto_491835 ?auto_491834 ) ( ON ?auto_491836 ?auto_491835 ) ( ON ?auto_491837 ?auto_491836 ) ( not ( = ?auto_491831 ?auto_491832 ) ) ( not ( = ?auto_491831 ?auto_491833 ) ) ( not ( = ?auto_491831 ?auto_491834 ) ) ( not ( = ?auto_491831 ?auto_491835 ) ) ( not ( = ?auto_491831 ?auto_491836 ) ) ( not ( = ?auto_491831 ?auto_491837 ) ) ( not ( = ?auto_491831 ?auto_491838 ) ) ( not ( = ?auto_491831 ?auto_491839 ) ) ( not ( = ?auto_491831 ?auto_491840 ) ) ( not ( = ?auto_491831 ?auto_491841 ) ) ( not ( = ?auto_491831 ?auto_491842 ) ) ( not ( = ?auto_491832 ?auto_491833 ) ) ( not ( = ?auto_491832 ?auto_491834 ) ) ( not ( = ?auto_491832 ?auto_491835 ) ) ( not ( = ?auto_491832 ?auto_491836 ) ) ( not ( = ?auto_491832 ?auto_491837 ) ) ( not ( = ?auto_491832 ?auto_491838 ) ) ( not ( = ?auto_491832 ?auto_491839 ) ) ( not ( = ?auto_491832 ?auto_491840 ) ) ( not ( = ?auto_491832 ?auto_491841 ) ) ( not ( = ?auto_491832 ?auto_491842 ) ) ( not ( = ?auto_491833 ?auto_491834 ) ) ( not ( = ?auto_491833 ?auto_491835 ) ) ( not ( = ?auto_491833 ?auto_491836 ) ) ( not ( = ?auto_491833 ?auto_491837 ) ) ( not ( = ?auto_491833 ?auto_491838 ) ) ( not ( = ?auto_491833 ?auto_491839 ) ) ( not ( = ?auto_491833 ?auto_491840 ) ) ( not ( = ?auto_491833 ?auto_491841 ) ) ( not ( = ?auto_491833 ?auto_491842 ) ) ( not ( = ?auto_491834 ?auto_491835 ) ) ( not ( = ?auto_491834 ?auto_491836 ) ) ( not ( = ?auto_491834 ?auto_491837 ) ) ( not ( = ?auto_491834 ?auto_491838 ) ) ( not ( = ?auto_491834 ?auto_491839 ) ) ( not ( = ?auto_491834 ?auto_491840 ) ) ( not ( = ?auto_491834 ?auto_491841 ) ) ( not ( = ?auto_491834 ?auto_491842 ) ) ( not ( = ?auto_491835 ?auto_491836 ) ) ( not ( = ?auto_491835 ?auto_491837 ) ) ( not ( = ?auto_491835 ?auto_491838 ) ) ( not ( = ?auto_491835 ?auto_491839 ) ) ( not ( = ?auto_491835 ?auto_491840 ) ) ( not ( = ?auto_491835 ?auto_491841 ) ) ( not ( = ?auto_491835 ?auto_491842 ) ) ( not ( = ?auto_491836 ?auto_491837 ) ) ( not ( = ?auto_491836 ?auto_491838 ) ) ( not ( = ?auto_491836 ?auto_491839 ) ) ( not ( = ?auto_491836 ?auto_491840 ) ) ( not ( = ?auto_491836 ?auto_491841 ) ) ( not ( = ?auto_491836 ?auto_491842 ) ) ( not ( = ?auto_491837 ?auto_491838 ) ) ( not ( = ?auto_491837 ?auto_491839 ) ) ( not ( = ?auto_491837 ?auto_491840 ) ) ( not ( = ?auto_491837 ?auto_491841 ) ) ( not ( = ?auto_491837 ?auto_491842 ) ) ( not ( = ?auto_491838 ?auto_491839 ) ) ( not ( = ?auto_491838 ?auto_491840 ) ) ( not ( = ?auto_491838 ?auto_491841 ) ) ( not ( = ?auto_491838 ?auto_491842 ) ) ( not ( = ?auto_491839 ?auto_491840 ) ) ( not ( = ?auto_491839 ?auto_491841 ) ) ( not ( = ?auto_491839 ?auto_491842 ) ) ( not ( = ?auto_491840 ?auto_491841 ) ) ( not ( = ?auto_491840 ?auto_491842 ) ) ( not ( = ?auto_491841 ?auto_491842 ) ) ( ON ?auto_491840 ?auto_491841 ) ( ON ?auto_491839 ?auto_491840 ) ( CLEAR ?auto_491837 ) ( ON ?auto_491838 ?auto_491839 ) ( CLEAR ?auto_491838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_491831 ?auto_491832 ?auto_491833 ?auto_491834 ?auto_491835 ?auto_491836 ?auto_491837 ?auto_491838 )
      ( MAKE-11PILE ?auto_491831 ?auto_491832 ?auto_491833 ?auto_491834 ?auto_491835 ?auto_491836 ?auto_491837 ?auto_491838 ?auto_491839 ?auto_491840 ?auto_491841 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_491877 - BLOCK
      ?auto_491878 - BLOCK
      ?auto_491879 - BLOCK
      ?auto_491880 - BLOCK
      ?auto_491881 - BLOCK
      ?auto_491882 - BLOCK
      ?auto_491883 - BLOCK
      ?auto_491884 - BLOCK
      ?auto_491885 - BLOCK
      ?auto_491886 - BLOCK
      ?auto_491887 - BLOCK
    )
    :vars
    (
      ?auto_491888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491887 ?auto_491888 ) ( ON-TABLE ?auto_491877 ) ( ON ?auto_491878 ?auto_491877 ) ( ON ?auto_491879 ?auto_491878 ) ( ON ?auto_491880 ?auto_491879 ) ( ON ?auto_491881 ?auto_491880 ) ( ON ?auto_491882 ?auto_491881 ) ( not ( = ?auto_491877 ?auto_491878 ) ) ( not ( = ?auto_491877 ?auto_491879 ) ) ( not ( = ?auto_491877 ?auto_491880 ) ) ( not ( = ?auto_491877 ?auto_491881 ) ) ( not ( = ?auto_491877 ?auto_491882 ) ) ( not ( = ?auto_491877 ?auto_491883 ) ) ( not ( = ?auto_491877 ?auto_491884 ) ) ( not ( = ?auto_491877 ?auto_491885 ) ) ( not ( = ?auto_491877 ?auto_491886 ) ) ( not ( = ?auto_491877 ?auto_491887 ) ) ( not ( = ?auto_491877 ?auto_491888 ) ) ( not ( = ?auto_491878 ?auto_491879 ) ) ( not ( = ?auto_491878 ?auto_491880 ) ) ( not ( = ?auto_491878 ?auto_491881 ) ) ( not ( = ?auto_491878 ?auto_491882 ) ) ( not ( = ?auto_491878 ?auto_491883 ) ) ( not ( = ?auto_491878 ?auto_491884 ) ) ( not ( = ?auto_491878 ?auto_491885 ) ) ( not ( = ?auto_491878 ?auto_491886 ) ) ( not ( = ?auto_491878 ?auto_491887 ) ) ( not ( = ?auto_491878 ?auto_491888 ) ) ( not ( = ?auto_491879 ?auto_491880 ) ) ( not ( = ?auto_491879 ?auto_491881 ) ) ( not ( = ?auto_491879 ?auto_491882 ) ) ( not ( = ?auto_491879 ?auto_491883 ) ) ( not ( = ?auto_491879 ?auto_491884 ) ) ( not ( = ?auto_491879 ?auto_491885 ) ) ( not ( = ?auto_491879 ?auto_491886 ) ) ( not ( = ?auto_491879 ?auto_491887 ) ) ( not ( = ?auto_491879 ?auto_491888 ) ) ( not ( = ?auto_491880 ?auto_491881 ) ) ( not ( = ?auto_491880 ?auto_491882 ) ) ( not ( = ?auto_491880 ?auto_491883 ) ) ( not ( = ?auto_491880 ?auto_491884 ) ) ( not ( = ?auto_491880 ?auto_491885 ) ) ( not ( = ?auto_491880 ?auto_491886 ) ) ( not ( = ?auto_491880 ?auto_491887 ) ) ( not ( = ?auto_491880 ?auto_491888 ) ) ( not ( = ?auto_491881 ?auto_491882 ) ) ( not ( = ?auto_491881 ?auto_491883 ) ) ( not ( = ?auto_491881 ?auto_491884 ) ) ( not ( = ?auto_491881 ?auto_491885 ) ) ( not ( = ?auto_491881 ?auto_491886 ) ) ( not ( = ?auto_491881 ?auto_491887 ) ) ( not ( = ?auto_491881 ?auto_491888 ) ) ( not ( = ?auto_491882 ?auto_491883 ) ) ( not ( = ?auto_491882 ?auto_491884 ) ) ( not ( = ?auto_491882 ?auto_491885 ) ) ( not ( = ?auto_491882 ?auto_491886 ) ) ( not ( = ?auto_491882 ?auto_491887 ) ) ( not ( = ?auto_491882 ?auto_491888 ) ) ( not ( = ?auto_491883 ?auto_491884 ) ) ( not ( = ?auto_491883 ?auto_491885 ) ) ( not ( = ?auto_491883 ?auto_491886 ) ) ( not ( = ?auto_491883 ?auto_491887 ) ) ( not ( = ?auto_491883 ?auto_491888 ) ) ( not ( = ?auto_491884 ?auto_491885 ) ) ( not ( = ?auto_491884 ?auto_491886 ) ) ( not ( = ?auto_491884 ?auto_491887 ) ) ( not ( = ?auto_491884 ?auto_491888 ) ) ( not ( = ?auto_491885 ?auto_491886 ) ) ( not ( = ?auto_491885 ?auto_491887 ) ) ( not ( = ?auto_491885 ?auto_491888 ) ) ( not ( = ?auto_491886 ?auto_491887 ) ) ( not ( = ?auto_491886 ?auto_491888 ) ) ( not ( = ?auto_491887 ?auto_491888 ) ) ( ON ?auto_491886 ?auto_491887 ) ( ON ?auto_491885 ?auto_491886 ) ( ON ?auto_491884 ?auto_491885 ) ( CLEAR ?auto_491882 ) ( ON ?auto_491883 ?auto_491884 ) ( CLEAR ?auto_491883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_491877 ?auto_491878 ?auto_491879 ?auto_491880 ?auto_491881 ?auto_491882 ?auto_491883 )
      ( MAKE-11PILE ?auto_491877 ?auto_491878 ?auto_491879 ?auto_491880 ?auto_491881 ?auto_491882 ?auto_491883 ?auto_491884 ?auto_491885 ?auto_491886 ?auto_491887 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_491923 - BLOCK
      ?auto_491924 - BLOCK
      ?auto_491925 - BLOCK
      ?auto_491926 - BLOCK
      ?auto_491927 - BLOCK
      ?auto_491928 - BLOCK
      ?auto_491929 - BLOCK
      ?auto_491930 - BLOCK
      ?auto_491931 - BLOCK
      ?auto_491932 - BLOCK
      ?auto_491933 - BLOCK
    )
    :vars
    (
      ?auto_491934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491933 ?auto_491934 ) ( ON-TABLE ?auto_491923 ) ( ON ?auto_491924 ?auto_491923 ) ( ON ?auto_491925 ?auto_491924 ) ( ON ?auto_491926 ?auto_491925 ) ( ON ?auto_491927 ?auto_491926 ) ( not ( = ?auto_491923 ?auto_491924 ) ) ( not ( = ?auto_491923 ?auto_491925 ) ) ( not ( = ?auto_491923 ?auto_491926 ) ) ( not ( = ?auto_491923 ?auto_491927 ) ) ( not ( = ?auto_491923 ?auto_491928 ) ) ( not ( = ?auto_491923 ?auto_491929 ) ) ( not ( = ?auto_491923 ?auto_491930 ) ) ( not ( = ?auto_491923 ?auto_491931 ) ) ( not ( = ?auto_491923 ?auto_491932 ) ) ( not ( = ?auto_491923 ?auto_491933 ) ) ( not ( = ?auto_491923 ?auto_491934 ) ) ( not ( = ?auto_491924 ?auto_491925 ) ) ( not ( = ?auto_491924 ?auto_491926 ) ) ( not ( = ?auto_491924 ?auto_491927 ) ) ( not ( = ?auto_491924 ?auto_491928 ) ) ( not ( = ?auto_491924 ?auto_491929 ) ) ( not ( = ?auto_491924 ?auto_491930 ) ) ( not ( = ?auto_491924 ?auto_491931 ) ) ( not ( = ?auto_491924 ?auto_491932 ) ) ( not ( = ?auto_491924 ?auto_491933 ) ) ( not ( = ?auto_491924 ?auto_491934 ) ) ( not ( = ?auto_491925 ?auto_491926 ) ) ( not ( = ?auto_491925 ?auto_491927 ) ) ( not ( = ?auto_491925 ?auto_491928 ) ) ( not ( = ?auto_491925 ?auto_491929 ) ) ( not ( = ?auto_491925 ?auto_491930 ) ) ( not ( = ?auto_491925 ?auto_491931 ) ) ( not ( = ?auto_491925 ?auto_491932 ) ) ( not ( = ?auto_491925 ?auto_491933 ) ) ( not ( = ?auto_491925 ?auto_491934 ) ) ( not ( = ?auto_491926 ?auto_491927 ) ) ( not ( = ?auto_491926 ?auto_491928 ) ) ( not ( = ?auto_491926 ?auto_491929 ) ) ( not ( = ?auto_491926 ?auto_491930 ) ) ( not ( = ?auto_491926 ?auto_491931 ) ) ( not ( = ?auto_491926 ?auto_491932 ) ) ( not ( = ?auto_491926 ?auto_491933 ) ) ( not ( = ?auto_491926 ?auto_491934 ) ) ( not ( = ?auto_491927 ?auto_491928 ) ) ( not ( = ?auto_491927 ?auto_491929 ) ) ( not ( = ?auto_491927 ?auto_491930 ) ) ( not ( = ?auto_491927 ?auto_491931 ) ) ( not ( = ?auto_491927 ?auto_491932 ) ) ( not ( = ?auto_491927 ?auto_491933 ) ) ( not ( = ?auto_491927 ?auto_491934 ) ) ( not ( = ?auto_491928 ?auto_491929 ) ) ( not ( = ?auto_491928 ?auto_491930 ) ) ( not ( = ?auto_491928 ?auto_491931 ) ) ( not ( = ?auto_491928 ?auto_491932 ) ) ( not ( = ?auto_491928 ?auto_491933 ) ) ( not ( = ?auto_491928 ?auto_491934 ) ) ( not ( = ?auto_491929 ?auto_491930 ) ) ( not ( = ?auto_491929 ?auto_491931 ) ) ( not ( = ?auto_491929 ?auto_491932 ) ) ( not ( = ?auto_491929 ?auto_491933 ) ) ( not ( = ?auto_491929 ?auto_491934 ) ) ( not ( = ?auto_491930 ?auto_491931 ) ) ( not ( = ?auto_491930 ?auto_491932 ) ) ( not ( = ?auto_491930 ?auto_491933 ) ) ( not ( = ?auto_491930 ?auto_491934 ) ) ( not ( = ?auto_491931 ?auto_491932 ) ) ( not ( = ?auto_491931 ?auto_491933 ) ) ( not ( = ?auto_491931 ?auto_491934 ) ) ( not ( = ?auto_491932 ?auto_491933 ) ) ( not ( = ?auto_491932 ?auto_491934 ) ) ( not ( = ?auto_491933 ?auto_491934 ) ) ( ON ?auto_491932 ?auto_491933 ) ( ON ?auto_491931 ?auto_491932 ) ( ON ?auto_491930 ?auto_491931 ) ( ON ?auto_491929 ?auto_491930 ) ( CLEAR ?auto_491927 ) ( ON ?auto_491928 ?auto_491929 ) ( CLEAR ?auto_491928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_491923 ?auto_491924 ?auto_491925 ?auto_491926 ?auto_491927 ?auto_491928 )
      ( MAKE-11PILE ?auto_491923 ?auto_491924 ?auto_491925 ?auto_491926 ?auto_491927 ?auto_491928 ?auto_491929 ?auto_491930 ?auto_491931 ?auto_491932 ?auto_491933 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_491969 - BLOCK
      ?auto_491970 - BLOCK
      ?auto_491971 - BLOCK
      ?auto_491972 - BLOCK
      ?auto_491973 - BLOCK
      ?auto_491974 - BLOCK
      ?auto_491975 - BLOCK
      ?auto_491976 - BLOCK
      ?auto_491977 - BLOCK
      ?auto_491978 - BLOCK
      ?auto_491979 - BLOCK
    )
    :vars
    (
      ?auto_491980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_491979 ?auto_491980 ) ( ON-TABLE ?auto_491969 ) ( ON ?auto_491970 ?auto_491969 ) ( ON ?auto_491971 ?auto_491970 ) ( ON ?auto_491972 ?auto_491971 ) ( not ( = ?auto_491969 ?auto_491970 ) ) ( not ( = ?auto_491969 ?auto_491971 ) ) ( not ( = ?auto_491969 ?auto_491972 ) ) ( not ( = ?auto_491969 ?auto_491973 ) ) ( not ( = ?auto_491969 ?auto_491974 ) ) ( not ( = ?auto_491969 ?auto_491975 ) ) ( not ( = ?auto_491969 ?auto_491976 ) ) ( not ( = ?auto_491969 ?auto_491977 ) ) ( not ( = ?auto_491969 ?auto_491978 ) ) ( not ( = ?auto_491969 ?auto_491979 ) ) ( not ( = ?auto_491969 ?auto_491980 ) ) ( not ( = ?auto_491970 ?auto_491971 ) ) ( not ( = ?auto_491970 ?auto_491972 ) ) ( not ( = ?auto_491970 ?auto_491973 ) ) ( not ( = ?auto_491970 ?auto_491974 ) ) ( not ( = ?auto_491970 ?auto_491975 ) ) ( not ( = ?auto_491970 ?auto_491976 ) ) ( not ( = ?auto_491970 ?auto_491977 ) ) ( not ( = ?auto_491970 ?auto_491978 ) ) ( not ( = ?auto_491970 ?auto_491979 ) ) ( not ( = ?auto_491970 ?auto_491980 ) ) ( not ( = ?auto_491971 ?auto_491972 ) ) ( not ( = ?auto_491971 ?auto_491973 ) ) ( not ( = ?auto_491971 ?auto_491974 ) ) ( not ( = ?auto_491971 ?auto_491975 ) ) ( not ( = ?auto_491971 ?auto_491976 ) ) ( not ( = ?auto_491971 ?auto_491977 ) ) ( not ( = ?auto_491971 ?auto_491978 ) ) ( not ( = ?auto_491971 ?auto_491979 ) ) ( not ( = ?auto_491971 ?auto_491980 ) ) ( not ( = ?auto_491972 ?auto_491973 ) ) ( not ( = ?auto_491972 ?auto_491974 ) ) ( not ( = ?auto_491972 ?auto_491975 ) ) ( not ( = ?auto_491972 ?auto_491976 ) ) ( not ( = ?auto_491972 ?auto_491977 ) ) ( not ( = ?auto_491972 ?auto_491978 ) ) ( not ( = ?auto_491972 ?auto_491979 ) ) ( not ( = ?auto_491972 ?auto_491980 ) ) ( not ( = ?auto_491973 ?auto_491974 ) ) ( not ( = ?auto_491973 ?auto_491975 ) ) ( not ( = ?auto_491973 ?auto_491976 ) ) ( not ( = ?auto_491973 ?auto_491977 ) ) ( not ( = ?auto_491973 ?auto_491978 ) ) ( not ( = ?auto_491973 ?auto_491979 ) ) ( not ( = ?auto_491973 ?auto_491980 ) ) ( not ( = ?auto_491974 ?auto_491975 ) ) ( not ( = ?auto_491974 ?auto_491976 ) ) ( not ( = ?auto_491974 ?auto_491977 ) ) ( not ( = ?auto_491974 ?auto_491978 ) ) ( not ( = ?auto_491974 ?auto_491979 ) ) ( not ( = ?auto_491974 ?auto_491980 ) ) ( not ( = ?auto_491975 ?auto_491976 ) ) ( not ( = ?auto_491975 ?auto_491977 ) ) ( not ( = ?auto_491975 ?auto_491978 ) ) ( not ( = ?auto_491975 ?auto_491979 ) ) ( not ( = ?auto_491975 ?auto_491980 ) ) ( not ( = ?auto_491976 ?auto_491977 ) ) ( not ( = ?auto_491976 ?auto_491978 ) ) ( not ( = ?auto_491976 ?auto_491979 ) ) ( not ( = ?auto_491976 ?auto_491980 ) ) ( not ( = ?auto_491977 ?auto_491978 ) ) ( not ( = ?auto_491977 ?auto_491979 ) ) ( not ( = ?auto_491977 ?auto_491980 ) ) ( not ( = ?auto_491978 ?auto_491979 ) ) ( not ( = ?auto_491978 ?auto_491980 ) ) ( not ( = ?auto_491979 ?auto_491980 ) ) ( ON ?auto_491978 ?auto_491979 ) ( ON ?auto_491977 ?auto_491978 ) ( ON ?auto_491976 ?auto_491977 ) ( ON ?auto_491975 ?auto_491976 ) ( ON ?auto_491974 ?auto_491975 ) ( CLEAR ?auto_491972 ) ( ON ?auto_491973 ?auto_491974 ) ( CLEAR ?auto_491973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_491969 ?auto_491970 ?auto_491971 ?auto_491972 ?auto_491973 )
      ( MAKE-11PILE ?auto_491969 ?auto_491970 ?auto_491971 ?auto_491972 ?auto_491973 ?auto_491974 ?auto_491975 ?auto_491976 ?auto_491977 ?auto_491978 ?auto_491979 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_492015 - BLOCK
      ?auto_492016 - BLOCK
      ?auto_492017 - BLOCK
      ?auto_492018 - BLOCK
      ?auto_492019 - BLOCK
      ?auto_492020 - BLOCK
      ?auto_492021 - BLOCK
      ?auto_492022 - BLOCK
      ?auto_492023 - BLOCK
      ?auto_492024 - BLOCK
      ?auto_492025 - BLOCK
    )
    :vars
    (
      ?auto_492026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492025 ?auto_492026 ) ( ON-TABLE ?auto_492015 ) ( ON ?auto_492016 ?auto_492015 ) ( ON ?auto_492017 ?auto_492016 ) ( not ( = ?auto_492015 ?auto_492016 ) ) ( not ( = ?auto_492015 ?auto_492017 ) ) ( not ( = ?auto_492015 ?auto_492018 ) ) ( not ( = ?auto_492015 ?auto_492019 ) ) ( not ( = ?auto_492015 ?auto_492020 ) ) ( not ( = ?auto_492015 ?auto_492021 ) ) ( not ( = ?auto_492015 ?auto_492022 ) ) ( not ( = ?auto_492015 ?auto_492023 ) ) ( not ( = ?auto_492015 ?auto_492024 ) ) ( not ( = ?auto_492015 ?auto_492025 ) ) ( not ( = ?auto_492015 ?auto_492026 ) ) ( not ( = ?auto_492016 ?auto_492017 ) ) ( not ( = ?auto_492016 ?auto_492018 ) ) ( not ( = ?auto_492016 ?auto_492019 ) ) ( not ( = ?auto_492016 ?auto_492020 ) ) ( not ( = ?auto_492016 ?auto_492021 ) ) ( not ( = ?auto_492016 ?auto_492022 ) ) ( not ( = ?auto_492016 ?auto_492023 ) ) ( not ( = ?auto_492016 ?auto_492024 ) ) ( not ( = ?auto_492016 ?auto_492025 ) ) ( not ( = ?auto_492016 ?auto_492026 ) ) ( not ( = ?auto_492017 ?auto_492018 ) ) ( not ( = ?auto_492017 ?auto_492019 ) ) ( not ( = ?auto_492017 ?auto_492020 ) ) ( not ( = ?auto_492017 ?auto_492021 ) ) ( not ( = ?auto_492017 ?auto_492022 ) ) ( not ( = ?auto_492017 ?auto_492023 ) ) ( not ( = ?auto_492017 ?auto_492024 ) ) ( not ( = ?auto_492017 ?auto_492025 ) ) ( not ( = ?auto_492017 ?auto_492026 ) ) ( not ( = ?auto_492018 ?auto_492019 ) ) ( not ( = ?auto_492018 ?auto_492020 ) ) ( not ( = ?auto_492018 ?auto_492021 ) ) ( not ( = ?auto_492018 ?auto_492022 ) ) ( not ( = ?auto_492018 ?auto_492023 ) ) ( not ( = ?auto_492018 ?auto_492024 ) ) ( not ( = ?auto_492018 ?auto_492025 ) ) ( not ( = ?auto_492018 ?auto_492026 ) ) ( not ( = ?auto_492019 ?auto_492020 ) ) ( not ( = ?auto_492019 ?auto_492021 ) ) ( not ( = ?auto_492019 ?auto_492022 ) ) ( not ( = ?auto_492019 ?auto_492023 ) ) ( not ( = ?auto_492019 ?auto_492024 ) ) ( not ( = ?auto_492019 ?auto_492025 ) ) ( not ( = ?auto_492019 ?auto_492026 ) ) ( not ( = ?auto_492020 ?auto_492021 ) ) ( not ( = ?auto_492020 ?auto_492022 ) ) ( not ( = ?auto_492020 ?auto_492023 ) ) ( not ( = ?auto_492020 ?auto_492024 ) ) ( not ( = ?auto_492020 ?auto_492025 ) ) ( not ( = ?auto_492020 ?auto_492026 ) ) ( not ( = ?auto_492021 ?auto_492022 ) ) ( not ( = ?auto_492021 ?auto_492023 ) ) ( not ( = ?auto_492021 ?auto_492024 ) ) ( not ( = ?auto_492021 ?auto_492025 ) ) ( not ( = ?auto_492021 ?auto_492026 ) ) ( not ( = ?auto_492022 ?auto_492023 ) ) ( not ( = ?auto_492022 ?auto_492024 ) ) ( not ( = ?auto_492022 ?auto_492025 ) ) ( not ( = ?auto_492022 ?auto_492026 ) ) ( not ( = ?auto_492023 ?auto_492024 ) ) ( not ( = ?auto_492023 ?auto_492025 ) ) ( not ( = ?auto_492023 ?auto_492026 ) ) ( not ( = ?auto_492024 ?auto_492025 ) ) ( not ( = ?auto_492024 ?auto_492026 ) ) ( not ( = ?auto_492025 ?auto_492026 ) ) ( ON ?auto_492024 ?auto_492025 ) ( ON ?auto_492023 ?auto_492024 ) ( ON ?auto_492022 ?auto_492023 ) ( ON ?auto_492021 ?auto_492022 ) ( ON ?auto_492020 ?auto_492021 ) ( ON ?auto_492019 ?auto_492020 ) ( CLEAR ?auto_492017 ) ( ON ?auto_492018 ?auto_492019 ) ( CLEAR ?auto_492018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_492015 ?auto_492016 ?auto_492017 ?auto_492018 )
      ( MAKE-11PILE ?auto_492015 ?auto_492016 ?auto_492017 ?auto_492018 ?auto_492019 ?auto_492020 ?auto_492021 ?auto_492022 ?auto_492023 ?auto_492024 ?auto_492025 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_492061 - BLOCK
      ?auto_492062 - BLOCK
      ?auto_492063 - BLOCK
      ?auto_492064 - BLOCK
      ?auto_492065 - BLOCK
      ?auto_492066 - BLOCK
      ?auto_492067 - BLOCK
      ?auto_492068 - BLOCK
      ?auto_492069 - BLOCK
      ?auto_492070 - BLOCK
      ?auto_492071 - BLOCK
    )
    :vars
    (
      ?auto_492072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492071 ?auto_492072 ) ( ON-TABLE ?auto_492061 ) ( ON ?auto_492062 ?auto_492061 ) ( not ( = ?auto_492061 ?auto_492062 ) ) ( not ( = ?auto_492061 ?auto_492063 ) ) ( not ( = ?auto_492061 ?auto_492064 ) ) ( not ( = ?auto_492061 ?auto_492065 ) ) ( not ( = ?auto_492061 ?auto_492066 ) ) ( not ( = ?auto_492061 ?auto_492067 ) ) ( not ( = ?auto_492061 ?auto_492068 ) ) ( not ( = ?auto_492061 ?auto_492069 ) ) ( not ( = ?auto_492061 ?auto_492070 ) ) ( not ( = ?auto_492061 ?auto_492071 ) ) ( not ( = ?auto_492061 ?auto_492072 ) ) ( not ( = ?auto_492062 ?auto_492063 ) ) ( not ( = ?auto_492062 ?auto_492064 ) ) ( not ( = ?auto_492062 ?auto_492065 ) ) ( not ( = ?auto_492062 ?auto_492066 ) ) ( not ( = ?auto_492062 ?auto_492067 ) ) ( not ( = ?auto_492062 ?auto_492068 ) ) ( not ( = ?auto_492062 ?auto_492069 ) ) ( not ( = ?auto_492062 ?auto_492070 ) ) ( not ( = ?auto_492062 ?auto_492071 ) ) ( not ( = ?auto_492062 ?auto_492072 ) ) ( not ( = ?auto_492063 ?auto_492064 ) ) ( not ( = ?auto_492063 ?auto_492065 ) ) ( not ( = ?auto_492063 ?auto_492066 ) ) ( not ( = ?auto_492063 ?auto_492067 ) ) ( not ( = ?auto_492063 ?auto_492068 ) ) ( not ( = ?auto_492063 ?auto_492069 ) ) ( not ( = ?auto_492063 ?auto_492070 ) ) ( not ( = ?auto_492063 ?auto_492071 ) ) ( not ( = ?auto_492063 ?auto_492072 ) ) ( not ( = ?auto_492064 ?auto_492065 ) ) ( not ( = ?auto_492064 ?auto_492066 ) ) ( not ( = ?auto_492064 ?auto_492067 ) ) ( not ( = ?auto_492064 ?auto_492068 ) ) ( not ( = ?auto_492064 ?auto_492069 ) ) ( not ( = ?auto_492064 ?auto_492070 ) ) ( not ( = ?auto_492064 ?auto_492071 ) ) ( not ( = ?auto_492064 ?auto_492072 ) ) ( not ( = ?auto_492065 ?auto_492066 ) ) ( not ( = ?auto_492065 ?auto_492067 ) ) ( not ( = ?auto_492065 ?auto_492068 ) ) ( not ( = ?auto_492065 ?auto_492069 ) ) ( not ( = ?auto_492065 ?auto_492070 ) ) ( not ( = ?auto_492065 ?auto_492071 ) ) ( not ( = ?auto_492065 ?auto_492072 ) ) ( not ( = ?auto_492066 ?auto_492067 ) ) ( not ( = ?auto_492066 ?auto_492068 ) ) ( not ( = ?auto_492066 ?auto_492069 ) ) ( not ( = ?auto_492066 ?auto_492070 ) ) ( not ( = ?auto_492066 ?auto_492071 ) ) ( not ( = ?auto_492066 ?auto_492072 ) ) ( not ( = ?auto_492067 ?auto_492068 ) ) ( not ( = ?auto_492067 ?auto_492069 ) ) ( not ( = ?auto_492067 ?auto_492070 ) ) ( not ( = ?auto_492067 ?auto_492071 ) ) ( not ( = ?auto_492067 ?auto_492072 ) ) ( not ( = ?auto_492068 ?auto_492069 ) ) ( not ( = ?auto_492068 ?auto_492070 ) ) ( not ( = ?auto_492068 ?auto_492071 ) ) ( not ( = ?auto_492068 ?auto_492072 ) ) ( not ( = ?auto_492069 ?auto_492070 ) ) ( not ( = ?auto_492069 ?auto_492071 ) ) ( not ( = ?auto_492069 ?auto_492072 ) ) ( not ( = ?auto_492070 ?auto_492071 ) ) ( not ( = ?auto_492070 ?auto_492072 ) ) ( not ( = ?auto_492071 ?auto_492072 ) ) ( ON ?auto_492070 ?auto_492071 ) ( ON ?auto_492069 ?auto_492070 ) ( ON ?auto_492068 ?auto_492069 ) ( ON ?auto_492067 ?auto_492068 ) ( ON ?auto_492066 ?auto_492067 ) ( ON ?auto_492065 ?auto_492066 ) ( ON ?auto_492064 ?auto_492065 ) ( CLEAR ?auto_492062 ) ( ON ?auto_492063 ?auto_492064 ) ( CLEAR ?auto_492063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_492061 ?auto_492062 ?auto_492063 )
      ( MAKE-11PILE ?auto_492061 ?auto_492062 ?auto_492063 ?auto_492064 ?auto_492065 ?auto_492066 ?auto_492067 ?auto_492068 ?auto_492069 ?auto_492070 ?auto_492071 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_492107 - BLOCK
      ?auto_492108 - BLOCK
      ?auto_492109 - BLOCK
      ?auto_492110 - BLOCK
      ?auto_492111 - BLOCK
      ?auto_492112 - BLOCK
      ?auto_492113 - BLOCK
      ?auto_492114 - BLOCK
      ?auto_492115 - BLOCK
      ?auto_492116 - BLOCK
      ?auto_492117 - BLOCK
    )
    :vars
    (
      ?auto_492118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492117 ?auto_492118 ) ( ON-TABLE ?auto_492107 ) ( not ( = ?auto_492107 ?auto_492108 ) ) ( not ( = ?auto_492107 ?auto_492109 ) ) ( not ( = ?auto_492107 ?auto_492110 ) ) ( not ( = ?auto_492107 ?auto_492111 ) ) ( not ( = ?auto_492107 ?auto_492112 ) ) ( not ( = ?auto_492107 ?auto_492113 ) ) ( not ( = ?auto_492107 ?auto_492114 ) ) ( not ( = ?auto_492107 ?auto_492115 ) ) ( not ( = ?auto_492107 ?auto_492116 ) ) ( not ( = ?auto_492107 ?auto_492117 ) ) ( not ( = ?auto_492107 ?auto_492118 ) ) ( not ( = ?auto_492108 ?auto_492109 ) ) ( not ( = ?auto_492108 ?auto_492110 ) ) ( not ( = ?auto_492108 ?auto_492111 ) ) ( not ( = ?auto_492108 ?auto_492112 ) ) ( not ( = ?auto_492108 ?auto_492113 ) ) ( not ( = ?auto_492108 ?auto_492114 ) ) ( not ( = ?auto_492108 ?auto_492115 ) ) ( not ( = ?auto_492108 ?auto_492116 ) ) ( not ( = ?auto_492108 ?auto_492117 ) ) ( not ( = ?auto_492108 ?auto_492118 ) ) ( not ( = ?auto_492109 ?auto_492110 ) ) ( not ( = ?auto_492109 ?auto_492111 ) ) ( not ( = ?auto_492109 ?auto_492112 ) ) ( not ( = ?auto_492109 ?auto_492113 ) ) ( not ( = ?auto_492109 ?auto_492114 ) ) ( not ( = ?auto_492109 ?auto_492115 ) ) ( not ( = ?auto_492109 ?auto_492116 ) ) ( not ( = ?auto_492109 ?auto_492117 ) ) ( not ( = ?auto_492109 ?auto_492118 ) ) ( not ( = ?auto_492110 ?auto_492111 ) ) ( not ( = ?auto_492110 ?auto_492112 ) ) ( not ( = ?auto_492110 ?auto_492113 ) ) ( not ( = ?auto_492110 ?auto_492114 ) ) ( not ( = ?auto_492110 ?auto_492115 ) ) ( not ( = ?auto_492110 ?auto_492116 ) ) ( not ( = ?auto_492110 ?auto_492117 ) ) ( not ( = ?auto_492110 ?auto_492118 ) ) ( not ( = ?auto_492111 ?auto_492112 ) ) ( not ( = ?auto_492111 ?auto_492113 ) ) ( not ( = ?auto_492111 ?auto_492114 ) ) ( not ( = ?auto_492111 ?auto_492115 ) ) ( not ( = ?auto_492111 ?auto_492116 ) ) ( not ( = ?auto_492111 ?auto_492117 ) ) ( not ( = ?auto_492111 ?auto_492118 ) ) ( not ( = ?auto_492112 ?auto_492113 ) ) ( not ( = ?auto_492112 ?auto_492114 ) ) ( not ( = ?auto_492112 ?auto_492115 ) ) ( not ( = ?auto_492112 ?auto_492116 ) ) ( not ( = ?auto_492112 ?auto_492117 ) ) ( not ( = ?auto_492112 ?auto_492118 ) ) ( not ( = ?auto_492113 ?auto_492114 ) ) ( not ( = ?auto_492113 ?auto_492115 ) ) ( not ( = ?auto_492113 ?auto_492116 ) ) ( not ( = ?auto_492113 ?auto_492117 ) ) ( not ( = ?auto_492113 ?auto_492118 ) ) ( not ( = ?auto_492114 ?auto_492115 ) ) ( not ( = ?auto_492114 ?auto_492116 ) ) ( not ( = ?auto_492114 ?auto_492117 ) ) ( not ( = ?auto_492114 ?auto_492118 ) ) ( not ( = ?auto_492115 ?auto_492116 ) ) ( not ( = ?auto_492115 ?auto_492117 ) ) ( not ( = ?auto_492115 ?auto_492118 ) ) ( not ( = ?auto_492116 ?auto_492117 ) ) ( not ( = ?auto_492116 ?auto_492118 ) ) ( not ( = ?auto_492117 ?auto_492118 ) ) ( ON ?auto_492116 ?auto_492117 ) ( ON ?auto_492115 ?auto_492116 ) ( ON ?auto_492114 ?auto_492115 ) ( ON ?auto_492113 ?auto_492114 ) ( ON ?auto_492112 ?auto_492113 ) ( ON ?auto_492111 ?auto_492112 ) ( ON ?auto_492110 ?auto_492111 ) ( ON ?auto_492109 ?auto_492110 ) ( CLEAR ?auto_492107 ) ( ON ?auto_492108 ?auto_492109 ) ( CLEAR ?auto_492108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_492107 ?auto_492108 )
      ( MAKE-11PILE ?auto_492107 ?auto_492108 ?auto_492109 ?auto_492110 ?auto_492111 ?auto_492112 ?auto_492113 ?auto_492114 ?auto_492115 ?auto_492116 ?auto_492117 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_492153 - BLOCK
      ?auto_492154 - BLOCK
      ?auto_492155 - BLOCK
      ?auto_492156 - BLOCK
      ?auto_492157 - BLOCK
      ?auto_492158 - BLOCK
      ?auto_492159 - BLOCK
      ?auto_492160 - BLOCK
      ?auto_492161 - BLOCK
      ?auto_492162 - BLOCK
      ?auto_492163 - BLOCK
    )
    :vars
    (
      ?auto_492164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492163 ?auto_492164 ) ( not ( = ?auto_492153 ?auto_492154 ) ) ( not ( = ?auto_492153 ?auto_492155 ) ) ( not ( = ?auto_492153 ?auto_492156 ) ) ( not ( = ?auto_492153 ?auto_492157 ) ) ( not ( = ?auto_492153 ?auto_492158 ) ) ( not ( = ?auto_492153 ?auto_492159 ) ) ( not ( = ?auto_492153 ?auto_492160 ) ) ( not ( = ?auto_492153 ?auto_492161 ) ) ( not ( = ?auto_492153 ?auto_492162 ) ) ( not ( = ?auto_492153 ?auto_492163 ) ) ( not ( = ?auto_492153 ?auto_492164 ) ) ( not ( = ?auto_492154 ?auto_492155 ) ) ( not ( = ?auto_492154 ?auto_492156 ) ) ( not ( = ?auto_492154 ?auto_492157 ) ) ( not ( = ?auto_492154 ?auto_492158 ) ) ( not ( = ?auto_492154 ?auto_492159 ) ) ( not ( = ?auto_492154 ?auto_492160 ) ) ( not ( = ?auto_492154 ?auto_492161 ) ) ( not ( = ?auto_492154 ?auto_492162 ) ) ( not ( = ?auto_492154 ?auto_492163 ) ) ( not ( = ?auto_492154 ?auto_492164 ) ) ( not ( = ?auto_492155 ?auto_492156 ) ) ( not ( = ?auto_492155 ?auto_492157 ) ) ( not ( = ?auto_492155 ?auto_492158 ) ) ( not ( = ?auto_492155 ?auto_492159 ) ) ( not ( = ?auto_492155 ?auto_492160 ) ) ( not ( = ?auto_492155 ?auto_492161 ) ) ( not ( = ?auto_492155 ?auto_492162 ) ) ( not ( = ?auto_492155 ?auto_492163 ) ) ( not ( = ?auto_492155 ?auto_492164 ) ) ( not ( = ?auto_492156 ?auto_492157 ) ) ( not ( = ?auto_492156 ?auto_492158 ) ) ( not ( = ?auto_492156 ?auto_492159 ) ) ( not ( = ?auto_492156 ?auto_492160 ) ) ( not ( = ?auto_492156 ?auto_492161 ) ) ( not ( = ?auto_492156 ?auto_492162 ) ) ( not ( = ?auto_492156 ?auto_492163 ) ) ( not ( = ?auto_492156 ?auto_492164 ) ) ( not ( = ?auto_492157 ?auto_492158 ) ) ( not ( = ?auto_492157 ?auto_492159 ) ) ( not ( = ?auto_492157 ?auto_492160 ) ) ( not ( = ?auto_492157 ?auto_492161 ) ) ( not ( = ?auto_492157 ?auto_492162 ) ) ( not ( = ?auto_492157 ?auto_492163 ) ) ( not ( = ?auto_492157 ?auto_492164 ) ) ( not ( = ?auto_492158 ?auto_492159 ) ) ( not ( = ?auto_492158 ?auto_492160 ) ) ( not ( = ?auto_492158 ?auto_492161 ) ) ( not ( = ?auto_492158 ?auto_492162 ) ) ( not ( = ?auto_492158 ?auto_492163 ) ) ( not ( = ?auto_492158 ?auto_492164 ) ) ( not ( = ?auto_492159 ?auto_492160 ) ) ( not ( = ?auto_492159 ?auto_492161 ) ) ( not ( = ?auto_492159 ?auto_492162 ) ) ( not ( = ?auto_492159 ?auto_492163 ) ) ( not ( = ?auto_492159 ?auto_492164 ) ) ( not ( = ?auto_492160 ?auto_492161 ) ) ( not ( = ?auto_492160 ?auto_492162 ) ) ( not ( = ?auto_492160 ?auto_492163 ) ) ( not ( = ?auto_492160 ?auto_492164 ) ) ( not ( = ?auto_492161 ?auto_492162 ) ) ( not ( = ?auto_492161 ?auto_492163 ) ) ( not ( = ?auto_492161 ?auto_492164 ) ) ( not ( = ?auto_492162 ?auto_492163 ) ) ( not ( = ?auto_492162 ?auto_492164 ) ) ( not ( = ?auto_492163 ?auto_492164 ) ) ( ON ?auto_492162 ?auto_492163 ) ( ON ?auto_492161 ?auto_492162 ) ( ON ?auto_492160 ?auto_492161 ) ( ON ?auto_492159 ?auto_492160 ) ( ON ?auto_492158 ?auto_492159 ) ( ON ?auto_492157 ?auto_492158 ) ( ON ?auto_492156 ?auto_492157 ) ( ON ?auto_492155 ?auto_492156 ) ( ON ?auto_492154 ?auto_492155 ) ( ON ?auto_492153 ?auto_492154 ) ( CLEAR ?auto_492153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_492153 )
      ( MAKE-11PILE ?auto_492153 ?auto_492154 ?auto_492155 ?auto_492156 ?auto_492157 ?auto_492158 ?auto_492159 ?auto_492160 ?auto_492161 ?auto_492162 ?auto_492163 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_492200 - BLOCK
      ?auto_492201 - BLOCK
      ?auto_492202 - BLOCK
      ?auto_492203 - BLOCK
      ?auto_492204 - BLOCK
      ?auto_492205 - BLOCK
      ?auto_492206 - BLOCK
      ?auto_492207 - BLOCK
      ?auto_492208 - BLOCK
      ?auto_492209 - BLOCK
      ?auto_492210 - BLOCK
      ?auto_492211 - BLOCK
    )
    :vars
    (
      ?auto_492212 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_492210 ) ( ON ?auto_492211 ?auto_492212 ) ( CLEAR ?auto_492211 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_492200 ) ( ON ?auto_492201 ?auto_492200 ) ( ON ?auto_492202 ?auto_492201 ) ( ON ?auto_492203 ?auto_492202 ) ( ON ?auto_492204 ?auto_492203 ) ( ON ?auto_492205 ?auto_492204 ) ( ON ?auto_492206 ?auto_492205 ) ( ON ?auto_492207 ?auto_492206 ) ( ON ?auto_492208 ?auto_492207 ) ( ON ?auto_492209 ?auto_492208 ) ( ON ?auto_492210 ?auto_492209 ) ( not ( = ?auto_492200 ?auto_492201 ) ) ( not ( = ?auto_492200 ?auto_492202 ) ) ( not ( = ?auto_492200 ?auto_492203 ) ) ( not ( = ?auto_492200 ?auto_492204 ) ) ( not ( = ?auto_492200 ?auto_492205 ) ) ( not ( = ?auto_492200 ?auto_492206 ) ) ( not ( = ?auto_492200 ?auto_492207 ) ) ( not ( = ?auto_492200 ?auto_492208 ) ) ( not ( = ?auto_492200 ?auto_492209 ) ) ( not ( = ?auto_492200 ?auto_492210 ) ) ( not ( = ?auto_492200 ?auto_492211 ) ) ( not ( = ?auto_492200 ?auto_492212 ) ) ( not ( = ?auto_492201 ?auto_492202 ) ) ( not ( = ?auto_492201 ?auto_492203 ) ) ( not ( = ?auto_492201 ?auto_492204 ) ) ( not ( = ?auto_492201 ?auto_492205 ) ) ( not ( = ?auto_492201 ?auto_492206 ) ) ( not ( = ?auto_492201 ?auto_492207 ) ) ( not ( = ?auto_492201 ?auto_492208 ) ) ( not ( = ?auto_492201 ?auto_492209 ) ) ( not ( = ?auto_492201 ?auto_492210 ) ) ( not ( = ?auto_492201 ?auto_492211 ) ) ( not ( = ?auto_492201 ?auto_492212 ) ) ( not ( = ?auto_492202 ?auto_492203 ) ) ( not ( = ?auto_492202 ?auto_492204 ) ) ( not ( = ?auto_492202 ?auto_492205 ) ) ( not ( = ?auto_492202 ?auto_492206 ) ) ( not ( = ?auto_492202 ?auto_492207 ) ) ( not ( = ?auto_492202 ?auto_492208 ) ) ( not ( = ?auto_492202 ?auto_492209 ) ) ( not ( = ?auto_492202 ?auto_492210 ) ) ( not ( = ?auto_492202 ?auto_492211 ) ) ( not ( = ?auto_492202 ?auto_492212 ) ) ( not ( = ?auto_492203 ?auto_492204 ) ) ( not ( = ?auto_492203 ?auto_492205 ) ) ( not ( = ?auto_492203 ?auto_492206 ) ) ( not ( = ?auto_492203 ?auto_492207 ) ) ( not ( = ?auto_492203 ?auto_492208 ) ) ( not ( = ?auto_492203 ?auto_492209 ) ) ( not ( = ?auto_492203 ?auto_492210 ) ) ( not ( = ?auto_492203 ?auto_492211 ) ) ( not ( = ?auto_492203 ?auto_492212 ) ) ( not ( = ?auto_492204 ?auto_492205 ) ) ( not ( = ?auto_492204 ?auto_492206 ) ) ( not ( = ?auto_492204 ?auto_492207 ) ) ( not ( = ?auto_492204 ?auto_492208 ) ) ( not ( = ?auto_492204 ?auto_492209 ) ) ( not ( = ?auto_492204 ?auto_492210 ) ) ( not ( = ?auto_492204 ?auto_492211 ) ) ( not ( = ?auto_492204 ?auto_492212 ) ) ( not ( = ?auto_492205 ?auto_492206 ) ) ( not ( = ?auto_492205 ?auto_492207 ) ) ( not ( = ?auto_492205 ?auto_492208 ) ) ( not ( = ?auto_492205 ?auto_492209 ) ) ( not ( = ?auto_492205 ?auto_492210 ) ) ( not ( = ?auto_492205 ?auto_492211 ) ) ( not ( = ?auto_492205 ?auto_492212 ) ) ( not ( = ?auto_492206 ?auto_492207 ) ) ( not ( = ?auto_492206 ?auto_492208 ) ) ( not ( = ?auto_492206 ?auto_492209 ) ) ( not ( = ?auto_492206 ?auto_492210 ) ) ( not ( = ?auto_492206 ?auto_492211 ) ) ( not ( = ?auto_492206 ?auto_492212 ) ) ( not ( = ?auto_492207 ?auto_492208 ) ) ( not ( = ?auto_492207 ?auto_492209 ) ) ( not ( = ?auto_492207 ?auto_492210 ) ) ( not ( = ?auto_492207 ?auto_492211 ) ) ( not ( = ?auto_492207 ?auto_492212 ) ) ( not ( = ?auto_492208 ?auto_492209 ) ) ( not ( = ?auto_492208 ?auto_492210 ) ) ( not ( = ?auto_492208 ?auto_492211 ) ) ( not ( = ?auto_492208 ?auto_492212 ) ) ( not ( = ?auto_492209 ?auto_492210 ) ) ( not ( = ?auto_492209 ?auto_492211 ) ) ( not ( = ?auto_492209 ?auto_492212 ) ) ( not ( = ?auto_492210 ?auto_492211 ) ) ( not ( = ?auto_492210 ?auto_492212 ) ) ( not ( = ?auto_492211 ?auto_492212 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_492211 ?auto_492212 )
      ( !STACK ?auto_492211 ?auto_492210 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_492250 - BLOCK
      ?auto_492251 - BLOCK
      ?auto_492252 - BLOCK
      ?auto_492253 - BLOCK
      ?auto_492254 - BLOCK
      ?auto_492255 - BLOCK
      ?auto_492256 - BLOCK
      ?auto_492257 - BLOCK
      ?auto_492258 - BLOCK
      ?auto_492259 - BLOCK
      ?auto_492260 - BLOCK
      ?auto_492261 - BLOCK
    )
    :vars
    (
      ?auto_492262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492261 ?auto_492262 ) ( ON-TABLE ?auto_492250 ) ( ON ?auto_492251 ?auto_492250 ) ( ON ?auto_492252 ?auto_492251 ) ( ON ?auto_492253 ?auto_492252 ) ( ON ?auto_492254 ?auto_492253 ) ( ON ?auto_492255 ?auto_492254 ) ( ON ?auto_492256 ?auto_492255 ) ( ON ?auto_492257 ?auto_492256 ) ( ON ?auto_492258 ?auto_492257 ) ( ON ?auto_492259 ?auto_492258 ) ( not ( = ?auto_492250 ?auto_492251 ) ) ( not ( = ?auto_492250 ?auto_492252 ) ) ( not ( = ?auto_492250 ?auto_492253 ) ) ( not ( = ?auto_492250 ?auto_492254 ) ) ( not ( = ?auto_492250 ?auto_492255 ) ) ( not ( = ?auto_492250 ?auto_492256 ) ) ( not ( = ?auto_492250 ?auto_492257 ) ) ( not ( = ?auto_492250 ?auto_492258 ) ) ( not ( = ?auto_492250 ?auto_492259 ) ) ( not ( = ?auto_492250 ?auto_492260 ) ) ( not ( = ?auto_492250 ?auto_492261 ) ) ( not ( = ?auto_492250 ?auto_492262 ) ) ( not ( = ?auto_492251 ?auto_492252 ) ) ( not ( = ?auto_492251 ?auto_492253 ) ) ( not ( = ?auto_492251 ?auto_492254 ) ) ( not ( = ?auto_492251 ?auto_492255 ) ) ( not ( = ?auto_492251 ?auto_492256 ) ) ( not ( = ?auto_492251 ?auto_492257 ) ) ( not ( = ?auto_492251 ?auto_492258 ) ) ( not ( = ?auto_492251 ?auto_492259 ) ) ( not ( = ?auto_492251 ?auto_492260 ) ) ( not ( = ?auto_492251 ?auto_492261 ) ) ( not ( = ?auto_492251 ?auto_492262 ) ) ( not ( = ?auto_492252 ?auto_492253 ) ) ( not ( = ?auto_492252 ?auto_492254 ) ) ( not ( = ?auto_492252 ?auto_492255 ) ) ( not ( = ?auto_492252 ?auto_492256 ) ) ( not ( = ?auto_492252 ?auto_492257 ) ) ( not ( = ?auto_492252 ?auto_492258 ) ) ( not ( = ?auto_492252 ?auto_492259 ) ) ( not ( = ?auto_492252 ?auto_492260 ) ) ( not ( = ?auto_492252 ?auto_492261 ) ) ( not ( = ?auto_492252 ?auto_492262 ) ) ( not ( = ?auto_492253 ?auto_492254 ) ) ( not ( = ?auto_492253 ?auto_492255 ) ) ( not ( = ?auto_492253 ?auto_492256 ) ) ( not ( = ?auto_492253 ?auto_492257 ) ) ( not ( = ?auto_492253 ?auto_492258 ) ) ( not ( = ?auto_492253 ?auto_492259 ) ) ( not ( = ?auto_492253 ?auto_492260 ) ) ( not ( = ?auto_492253 ?auto_492261 ) ) ( not ( = ?auto_492253 ?auto_492262 ) ) ( not ( = ?auto_492254 ?auto_492255 ) ) ( not ( = ?auto_492254 ?auto_492256 ) ) ( not ( = ?auto_492254 ?auto_492257 ) ) ( not ( = ?auto_492254 ?auto_492258 ) ) ( not ( = ?auto_492254 ?auto_492259 ) ) ( not ( = ?auto_492254 ?auto_492260 ) ) ( not ( = ?auto_492254 ?auto_492261 ) ) ( not ( = ?auto_492254 ?auto_492262 ) ) ( not ( = ?auto_492255 ?auto_492256 ) ) ( not ( = ?auto_492255 ?auto_492257 ) ) ( not ( = ?auto_492255 ?auto_492258 ) ) ( not ( = ?auto_492255 ?auto_492259 ) ) ( not ( = ?auto_492255 ?auto_492260 ) ) ( not ( = ?auto_492255 ?auto_492261 ) ) ( not ( = ?auto_492255 ?auto_492262 ) ) ( not ( = ?auto_492256 ?auto_492257 ) ) ( not ( = ?auto_492256 ?auto_492258 ) ) ( not ( = ?auto_492256 ?auto_492259 ) ) ( not ( = ?auto_492256 ?auto_492260 ) ) ( not ( = ?auto_492256 ?auto_492261 ) ) ( not ( = ?auto_492256 ?auto_492262 ) ) ( not ( = ?auto_492257 ?auto_492258 ) ) ( not ( = ?auto_492257 ?auto_492259 ) ) ( not ( = ?auto_492257 ?auto_492260 ) ) ( not ( = ?auto_492257 ?auto_492261 ) ) ( not ( = ?auto_492257 ?auto_492262 ) ) ( not ( = ?auto_492258 ?auto_492259 ) ) ( not ( = ?auto_492258 ?auto_492260 ) ) ( not ( = ?auto_492258 ?auto_492261 ) ) ( not ( = ?auto_492258 ?auto_492262 ) ) ( not ( = ?auto_492259 ?auto_492260 ) ) ( not ( = ?auto_492259 ?auto_492261 ) ) ( not ( = ?auto_492259 ?auto_492262 ) ) ( not ( = ?auto_492260 ?auto_492261 ) ) ( not ( = ?auto_492260 ?auto_492262 ) ) ( not ( = ?auto_492261 ?auto_492262 ) ) ( CLEAR ?auto_492259 ) ( ON ?auto_492260 ?auto_492261 ) ( CLEAR ?auto_492260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_492250 ?auto_492251 ?auto_492252 ?auto_492253 ?auto_492254 ?auto_492255 ?auto_492256 ?auto_492257 ?auto_492258 ?auto_492259 ?auto_492260 )
      ( MAKE-12PILE ?auto_492250 ?auto_492251 ?auto_492252 ?auto_492253 ?auto_492254 ?auto_492255 ?auto_492256 ?auto_492257 ?auto_492258 ?auto_492259 ?auto_492260 ?auto_492261 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_492300 - BLOCK
      ?auto_492301 - BLOCK
      ?auto_492302 - BLOCK
      ?auto_492303 - BLOCK
      ?auto_492304 - BLOCK
      ?auto_492305 - BLOCK
      ?auto_492306 - BLOCK
      ?auto_492307 - BLOCK
      ?auto_492308 - BLOCK
      ?auto_492309 - BLOCK
      ?auto_492310 - BLOCK
      ?auto_492311 - BLOCK
    )
    :vars
    (
      ?auto_492312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492311 ?auto_492312 ) ( ON-TABLE ?auto_492300 ) ( ON ?auto_492301 ?auto_492300 ) ( ON ?auto_492302 ?auto_492301 ) ( ON ?auto_492303 ?auto_492302 ) ( ON ?auto_492304 ?auto_492303 ) ( ON ?auto_492305 ?auto_492304 ) ( ON ?auto_492306 ?auto_492305 ) ( ON ?auto_492307 ?auto_492306 ) ( ON ?auto_492308 ?auto_492307 ) ( not ( = ?auto_492300 ?auto_492301 ) ) ( not ( = ?auto_492300 ?auto_492302 ) ) ( not ( = ?auto_492300 ?auto_492303 ) ) ( not ( = ?auto_492300 ?auto_492304 ) ) ( not ( = ?auto_492300 ?auto_492305 ) ) ( not ( = ?auto_492300 ?auto_492306 ) ) ( not ( = ?auto_492300 ?auto_492307 ) ) ( not ( = ?auto_492300 ?auto_492308 ) ) ( not ( = ?auto_492300 ?auto_492309 ) ) ( not ( = ?auto_492300 ?auto_492310 ) ) ( not ( = ?auto_492300 ?auto_492311 ) ) ( not ( = ?auto_492300 ?auto_492312 ) ) ( not ( = ?auto_492301 ?auto_492302 ) ) ( not ( = ?auto_492301 ?auto_492303 ) ) ( not ( = ?auto_492301 ?auto_492304 ) ) ( not ( = ?auto_492301 ?auto_492305 ) ) ( not ( = ?auto_492301 ?auto_492306 ) ) ( not ( = ?auto_492301 ?auto_492307 ) ) ( not ( = ?auto_492301 ?auto_492308 ) ) ( not ( = ?auto_492301 ?auto_492309 ) ) ( not ( = ?auto_492301 ?auto_492310 ) ) ( not ( = ?auto_492301 ?auto_492311 ) ) ( not ( = ?auto_492301 ?auto_492312 ) ) ( not ( = ?auto_492302 ?auto_492303 ) ) ( not ( = ?auto_492302 ?auto_492304 ) ) ( not ( = ?auto_492302 ?auto_492305 ) ) ( not ( = ?auto_492302 ?auto_492306 ) ) ( not ( = ?auto_492302 ?auto_492307 ) ) ( not ( = ?auto_492302 ?auto_492308 ) ) ( not ( = ?auto_492302 ?auto_492309 ) ) ( not ( = ?auto_492302 ?auto_492310 ) ) ( not ( = ?auto_492302 ?auto_492311 ) ) ( not ( = ?auto_492302 ?auto_492312 ) ) ( not ( = ?auto_492303 ?auto_492304 ) ) ( not ( = ?auto_492303 ?auto_492305 ) ) ( not ( = ?auto_492303 ?auto_492306 ) ) ( not ( = ?auto_492303 ?auto_492307 ) ) ( not ( = ?auto_492303 ?auto_492308 ) ) ( not ( = ?auto_492303 ?auto_492309 ) ) ( not ( = ?auto_492303 ?auto_492310 ) ) ( not ( = ?auto_492303 ?auto_492311 ) ) ( not ( = ?auto_492303 ?auto_492312 ) ) ( not ( = ?auto_492304 ?auto_492305 ) ) ( not ( = ?auto_492304 ?auto_492306 ) ) ( not ( = ?auto_492304 ?auto_492307 ) ) ( not ( = ?auto_492304 ?auto_492308 ) ) ( not ( = ?auto_492304 ?auto_492309 ) ) ( not ( = ?auto_492304 ?auto_492310 ) ) ( not ( = ?auto_492304 ?auto_492311 ) ) ( not ( = ?auto_492304 ?auto_492312 ) ) ( not ( = ?auto_492305 ?auto_492306 ) ) ( not ( = ?auto_492305 ?auto_492307 ) ) ( not ( = ?auto_492305 ?auto_492308 ) ) ( not ( = ?auto_492305 ?auto_492309 ) ) ( not ( = ?auto_492305 ?auto_492310 ) ) ( not ( = ?auto_492305 ?auto_492311 ) ) ( not ( = ?auto_492305 ?auto_492312 ) ) ( not ( = ?auto_492306 ?auto_492307 ) ) ( not ( = ?auto_492306 ?auto_492308 ) ) ( not ( = ?auto_492306 ?auto_492309 ) ) ( not ( = ?auto_492306 ?auto_492310 ) ) ( not ( = ?auto_492306 ?auto_492311 ) ) ( not ( = ?auto_492306 ?auto_492312 ) ) ( not ( = ?auto_492307 ?auto_492308 ) ) ( not ( = ?auto_492307 ?auto_492309 ) ) ( not ( = ?auto_492307 ?auto_492310 ) ) ( not ( = ?auto_492307 ?auto_492311 ) ) ( not ( = ?auto_492307 ?auto_492312 ) ) ( not ( = ?auto_492308 ?auto_492309 ) ) ( not ( = ?auto_492308 ?auto_492310 ) ) ( not ( = ?auto_492308 ?auto_492311 ) ) ( not ( = ?auto_492308 ?auto_492312 ) ) ( not ( = ?auto_492309 ?auto_492310 ) ) ( not ( = ?auto_492309 ?auto_492311 ) ) ( not ( = ?auto_492309 ?auto_492312 ) ) ( not ( = ?auto_492310 ?auto_492311 ) ) ( not ( = ?auto_492310 ?auto_492312 ) ) ( not ( = ?auto_492311 ?auto_492312 ) ) ( ON ?auto_492310 ?auto_492311 ) ( CLEAR ?auto_492308 ) ( ON ?auto_492309 ?auto_492310 ) ( CLEAR ?auto_492309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_492300 ?auto_492301 ?auto_492302 ?auto_492303 ?auto_492304 ?auto_492305 ?auto_492306 ?auto_492307 ?auto_492308 ?auto_492309 )
      ( MAKE-12PILE ?auto_492300 ?auto_492301 ?auto_492302 ?auto_492303 ?auto_492304 ?auto_492305 ?auto_492306 ?auto_492307 ?auto_492308 ?auto_492309 ?auto_492310 ?auto_492311 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_492350 - BLOCK
      ?auto_492351 - BLOCK
      ?auto_492352 - BLOCK
      ?auto_492353 - BLOCK
      ?auto_492354 - BLOCK
      ?auto_492355 - BLOCK
      ?auto_492356 - BLOCK
      ?auto_492357 - BLOCK
      ?auto_492358 - BLOCK
      ?auto_492359 - BLOCK
      ?auto_492360 - BLOCK
      ?auto_492361 - BLOCK
    )
    :vars
    (
      ?auto_492362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492361 ?auto_492362 ) ( ON-TABLE ?auto_492350 ) ( ON ?auto_492351 ?auto_492350 ) ( ON ?auto_492352 ?auto_492351 ) ( ON ?auto_492353 ?auto_492352 ) ( ON ?auto_492354 ?auto_492353 ) ( ON ?auto_492355 ?auto_492354 ) ( ON ?auto_492356 ?auto_492355 ) ( ON ?auto_492357 ?auto_492356 ) ( not ( = ?auto_492350 ?auto_492351 ) ) ( not ( = ?auto_492350 ?auto_492352 ) ) ( not ( = ?auto_492350 ?auto_492353 ) ) ( not ( = ?auto_492350 ?auto_492354 ) ) ( not ( = ?auto_492350 ?auto_492355 ) ) ( not ( = ?auto_492350 ?auto_492356 ) ) ( not ( = ?auto_492350 ?auto_492357 ) ) ( not ( = ?auto_492350 ?auto_492358 ) ) ( not ( = ?auto_492350 ?auto_492359 ) ) ( not ( = ?auto_492350 ?auto_492360 ) ) ( not ( = ?auto_492350 ?auto_492361 ) ) ( not ( = ?auto_492350 ?auto_492362 ) ) ( not ( = ?auto_492351 ?auto_492352 ) ) ( not ( = ?auto_492351 ?auto_492353 ) ) ( not ( = ?auto_492351 ?auto_492354 ) ) ( not ( = ?auto_492351 ?auto_492355 ) ) ( not ( = ?auto_492351 ?auto_492356 ) ) ( not ( = ?auto_492351 ?auto_492357 ) ) ( not ( = ?auto_492351 ?auto_492358 ) ) ( not ( = ?auto_492351 ?auto_492359 ) ) ( not ( = ?auto_492351 ?auto_492360 ) ) ( not ( = ?auto_492351 ?auto_492361 ) ) ( not ( = ?auto_492351 ?auto_492362 ) ) ( not ( = ?auto_492352 ?auto_492353 ) ) ( not ( = ?auto_492352 ?auto_492354 ) ) ( not ( = ?auto_492352 ?auto_492355 ) ) ( not ( = ?auto_492352 ?auto_492356 ) ) ( not ( = ?auto_492352 ?auto_492357 ) ) ( not ( = ?auto_492352 ?auto_492358 ) ) ( not ( = ?auto_492352 ?auto_492359 ) ) ( not ( = ?auto_492352 ?auto_492360 ) ) ( not ( = ?auto_492352 ?auto_492361 ) ) ( not ( = ?auto_492352 ?auto_492362 ) ) ( not ( = ?auto_492353 ?auto_492354 ) ) ( not ( = ?auto_492353 ?auto_492355 ) ) ( not ( = ?auto_492353 ?auto_492356 ) ) ( not ( = ?auto_492353 ?auto_492357 ) ) ( not ( = ?auto_492353 ?auto_492358 ) ) ( not ( = ?auto_492353 ?auto_492359 ) ) ( not ( = ?auto_492353 ?auto_492360 ) ) ( not ( = ?auto_492353 ?auto_492361 ) ) ( not ( = ?auto_492353 ?auto_492362 ) ) ( not ( = ?auto_492354 ?auto_492355 ) ) ( not ( = ?auto_492354 ?auto_492356 ) ) ( not ( = ?auto_492354 ?auto_492357 ) ) ( not ( = ?auto_492354 ?auto_492358 ) ) ( not ( = ?auto_492354 ?auto_492359 ) ) ( not ( = ?auto_492354 ?auto_492360 ) ) ( not ( = ?auto_492354 ?auto_492361 ) ) ( not ( = ?auto_492354 ?auto_492362 ) ) ( not ( = ?auto_492355 ?auto_492356 ) ) ( not ( = ?auto_492355 ?auto_492357 ) ) ( not ( = ?auto_492355 ?auto_492358 ) ) ( not ( = ?auto_492355 ?auto_492359 ) ) ( not ( = ?auto_492355 ?auto_492360 ) ) ( not ( = ?auto_492355 ?auto_492361 ) ) ( not ( = ?auto_492355 ?auto_492362 ) ) ( not ( = ?auto_492356 ?auto_492357 ) ) ( not ( = ?auto_492356 ?auto_492358 ) ) ( not ( = ?auto_492356 ?auto_492359 ) ) ( not ( = ?auto_492356 ?auto_492360 ) ) ( not ( = ?auto_492356 ?auto_492361 ) ) ( not ( = ?auto_492356 ?auto_492362 ) ) ( not ( = ?auto_492357 ?auto_492358 ) ) ( not ( = ?auto_492357 ?auto_492359 ) ) ( not ( = ?auto_492357 ?auto_492360 ) ) ( not ( = ?auto_492357 ?auto_492361 ) ) ( not ( = ?auto_492357 ?auto_492362 ) ) ( not ( = ?auto_492358 ?auto_492359 ) ) ( not ( = ?auto_492358 ?auto_492360 ) ) ( not ( = ?auto_492358 ?auto_492361 ) ) ( not ( = ?auto_492358 ?auto_492362 ) ) ( not ( = ?auto_492359 ?auto_492360 ) ) ( not ( = ?auto_492359 ?auto_492361 ) ) ( not ( = ?auto_492359 ?auto_492362 ) ) ( not ( = ?auto_492360 ?auto_492361 ) ) ( not ( = ?auto_492360 ?auto_492362 ) ) ( not ( = ?auto_492361 ?auto_492362 ) ) ( ON ?auto_492360 ?auto_492361 ) ( ON ?auto_492359 ?auto_492360 ) ( CLEAR ?auto_492357 ) ( ON ?auto_492358 ?auto_492359 ) ( CLEAR ?auto_492358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_492350 ?auto_492351 ?auto_492352 ?auto_492353 ?auto_492354 ?auto_492355 ?auto_492356 ?auto_492357 ?auto_492358 )
      ( MAKE-12PILE ?auto_492350 ?auto_492351 ?auto_492352 ?auto_492353 ?auto_492354 ?auto_492355 ?auto_492356 ?auto_492357 ?auto_492358 ?auto_492359 ?auto_492360 ?auto_492361 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_492400 - BLOCK
      ?auto_492401 - BLOCK
      ?auto_492402 - BLOCK
      ?auto_492403 - BLOCK
      ?auto_492404 - BLOCK
      ?auto_492405 - BLOCK
      ?auto_492406 - BLOCK
      ?auto_492407 - BLOCK
      ?auto_492408 - BLOCK
      ?auto_492409 - BLOCK
      ?auto_492410 - BLOCK
      ?auto_492411 - BLOCK
    )
    :vars
    (
      ?auto_492412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492411 ?auto_492412 ) ( ON-TABLE ?auto_492400 ) ( ON ?auto_492401 ?auto_492400 ) ( ON ?auto_492402 ?auto_492401 ) ( ON ?auto_492403 ?auto_492402 ) ( ON ?auto_492404 ?auto_492403 ) ( ON ?auto_492405 ?auto_492404 ) ( ON ?auto_492406 ?auto_492405 ) ( not ( = ?auto_492400 ?auto_492401 ) ) ( not ( = ?auto_492400 ?auto_492402 ) ) ( not ( = ?auto_492400 ?auto_492403 ) ) ( not ( = ?auto_492400 ?auto_492404 ) ) ( not ( = ?auto_492400 ?auto_492405 ) ) ( not ( = ?auto_492400 ?auto_492406 ) ) ( not ( = ?auto_492400 ?auto_492407 ) ) ( not ( = ?auto_492400 ?auto_492408 ) ) ( not ( = ?auto_492400 ?auto_492409 ) ) ( not ( = ?auto_492400 ?auto_492410 ) ) ( not ( = ?auto_492400 ?auto_492411 ) ) ( not ( = ?auto_492400 ?auto_492412 ) ) ( not ( = ?auto_492401 ?auto_492402 ) ) ( not ( = ?auto_492401 ?auto_492403 ) ) ( not ( = ?auto_492401 ?auto_492404 ) ) ( not ( = ?auto_492401 ?auto_492405 ) ) ( not ( = ?auto_492401 ?auto_492406 ) ) ( not ( = ?auto_492401 ?auto_492407 ) ) ( not ( = ?auto_492401 ?auto_492408 ) ) ( not ( = ?auto_492401 ?auto_492409 ) ) ( not ( = ?auto_492401 ?auto_492410 ) ) ( not ( = ?auto_492401 ?auto_492411 ) ) ( not ( = ?auto_492401 ?auto_492412 ) ) ( not ( = ?auto_492402 ?auto_492403 ) ) ( not ( = ?auto_492402 ?auto_492404 ) ) ( not ( = ?auto_492402 ?auto_492405 ) ) ( not ( = ?auto_492402 ?auto_492406 ) ) ( not ( = ?auto_492402 ?auto_492407 ) ) ( not ( = ?auto_492402 ?auto_492408 ) ) ( not ( = ?auto_492402 ?auto_492409 ) ) ( not ( = ?auto_492402 ?auto_492410 ) ) ( not ( = ?auto_492402 ?auto_492411 ) ) ( not ( = ?auto_492402 ?auto_492412 ) ) ( not ( = ?auto_492403 ?auto_492404 ) ) ( not ( = ?auto_492403 ?auto_492405 ) ) ( not ( = ?auto_492403 ?auto_492406 ) ) ( not ( = ?auto_492403 ?auto_492407 ) ) ( not ( = ?auto_492403 ?auto_492408 ) ) ( not ( = ?auto_492403 ?auto_492409 ) ) ( not ( = ?auto_492403 ?auto_492410 ) ) ( not ( = ?auto_492403 ?auto_492411 ) ) ( not ( = ?auto_492403 ?auto_492412 ) ) ( not ( = ?auto_492404 ?auto_492405 ) ) ( not ( = ?auto_492404 ?auto_492406 ) ) ( not ( = ?auto_492404 ?auto_492407 ) ) ( not ( = ?auto_492404 ?auto_492408 ) ) ( not ( = ?auto_492404 ?auto_492409 ) ) ( not ( = ?auto_492404 ?auto_492410 ) ) ( not ( = ?auto_492404 ?auto_492411 ) ) ( not ( = ?auto_492404 ?auto_492412 ) ) ( not ( = ?auto_492405 ?auto_492406 ) ) ( not ( = ?auto_492405 ?auto_492407 ) ) ( not ( = ?auto_492405 ?auto_492408 ) ) ( not ( = ?auto_492405 ?auto_492409 ) ) ( not ( = ?auto_492405 ?auto_492410 ) ) ( not ( = ?auto_492405 ?auto_492411 ) ) ( not ( = ?auto_492405 ?auto_492412 ) ) ( not ( = ?auto_492406 ?auto_492407 ) ) ( not ( = ?auto_492406 ?auto_492408 ) ) ( not ( = ?auto_492406 ?auto_492409 ) ) ( not ( = ?auto_492406 ?auto_492410 ) ) ( not ( = ?auto_492406 ?auto_492411 ) ) ( not ( = ?auto_492406 ?auto_492412 ) ) ( not ( = ?auto_492407 ?auto_492408 ) ) ( not ( = ?auto_492407 ?auto_492409 ) ) ( not ( = ?auto_492407 ?auto_492410 ) ) ( not ( = ?auto_492407 ?auto_492411 ) ) ( not ( = ?auto_492407 ?auto_492412 ) ) ( not ( = ?auto_492408 ?auto_492409 ) ) ( not ( = ?auto_492408 ?auto_492410 ) ) ( not ( = ?auto_492408 ?auto_492411 ) ) ( not ( = ?auto_492408 ?auto_492412 ) ) ( not ( = ?auto_492409 ?auto_492410 ) ) ( not ( = ?auto_492409 ?auto_492411 ) ) ( not ( = ?auto_492409 ?auto_492412 ) ) ( not ( = ?auto_492410 ?auto_492411 ) ) ( not ( = ?auto_492410 ?auto_492412 ) ) ( not ( = ?auto_492411 ?auto_492412 ) ) ( ON ?auto_492410 ?auto_492411 ) ( ON ?auto_492409 ?auto_492410 ) ( ON ?auto_492408 ?auto_492409 ) ( CLEAR ?auto_492406 ) ( ON ?auto_492407 ?auto_492408 ) ( CLEAR ?auto_492407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_492400 ?auto_492401 ?auto_492402 ?auto_492403 ?auto_492404 ?auto_492405 ?auto_492406 ?auto_492407 )
      ( MAKE-12PILE ?auto_492400 ?auto_492401 ?auto_492402 ?auto_492403 ?auto_492404 ?auto_492405 ?auto_492406 ?auto_492407 ?auto_492408 ?auto_492409 ?auto_492410 ?auto_492411 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_492450 - BLOCK
      ?auto_492451 - BLOCK
      ?auto_492452 - BLOCK
      ?auto_492453 - BLOCK
      ?auto_492454 - BLOCK
      ?auto_492455 - BLOCK
      ?auto_492456 - BLOCK
      ?auto_492457 - BLOCK
      ?auto_492458 - BLOCK
      ?auto_492459 - BLOCK
      ?auto_492460 - BLOCK
      ?auto_492461 - BLOCK
    )
    :vars
    (
      ?auto_492462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492461 ?auto_492462 ) ( ON-TABLE ?auto_492450 ) ( ON ?auto_492451 ?auto_492450 ) ( ON ?auto_492452 ?auto_492451 ) ( ON ?auto_492453 ?auto_492452 ) ( ON ?auto_492454 ?auto_492453 ) ( ON ?auto_492455 ?auto_492454 ) ( not ( = ?auto_492450 ?auto_492451 ) ) ( not ( = ?auto_492450 ?auto_492452 ) ) ( not ( = ?auto_492450 ?auto_492453 ) ) ( not ( = ?auto_492450 ?auto_492454 ) ) ( not ( = ?auto_492450 ?auto_492455 ) ) ( not ( = ?auto_492450 ?auto_492456 ) ) ( not ( = ?auto_492450 ?auto_492457 ) ) ( not ( = ?auto_492450 ?auto_492458 ) ) ( not ( = ?auto_492450 ?auto_492459 ) ) ( not ( = ?auto_492450 ?auto_492460 ) ) ( not ( = ?auto_492450 ?auto_492461 ) ) ( not ( = ?auto_492450 ?auto_492462 ) ) ( not ( = ?auto_492451 ?auto_492452 ) ) ( not ( = ?auto_492451 ?auto_492453 ) ) ( not ( = ?auto_492451 ?auto_492454 ) ) ( not ( = ?auto_492451 ?auto_492455 ) ) ( not ( = ?auto_492451 ?auto_492456 ) ) ( not ( = ?auto_492451 ?auto_492457 ) ) ( not ( = ?auto_492451 ?auto_492458 ) ) ( not ( = ?auto_492451 ?auto_492459 ) ) ( not ( = ?auto_492451 ?auto_492460 ) ) ( not ( = ?auto_492451 ?auto_492461 ) ) ( not ( = ?auto_492451 ?auto_492462 ) ) ( not ( = ?auto_492452 ?auto_492453 ) ) ( not ( = ?auto_492452 ?auto_492454 ) ) ( not ( = ?auto_492452 ?auto_492455 ) ) ( not ( = ?auto_492452 ?auto_492456 ) ) ( not ( = ?auto_492452 ?auto_492457 ) ) ( not ( = ?auto_492452 ?auto_492458 ) ) ( not ( = ?auto_492452 ?auto_492459 ) ) ( not ( = ?auto_492452 ?auto_492460 ) ) ( not ( = ?auto_492452 ?auto_492461 ) ) ( not ( = ?auto_492452 ?auto_492462 ) ) ( not ( = ?auto_492453 ?auto_492454 ) ) ( not ( = ?auto_492453 ?auto_492455 ) ) ( not ( = ?auto_492453 ?auto_492456 ) ) ( not ( = ?auto_492453 ?auto_492457 ) ) ( not ( = ?auto_492453 ?auto_492458 ) ) ( not ( = ?auto_492453 ?auto_492459 ) ) ( not ( = ?auto_492453 ?auto_492460 ) ) ( not ( = ?auto_492453 ?auto_492461 ) ) ( not ( = ?auto_492453 ?auto_492462 ) ) ( not ( = ?auto_492454 ?auto_492455 ) ) ( not ( = ?auto_492454 ?auto_492456 ) ) ( not ( = ?auto_492454 ?auto_492457 ) ) ( not ( = ?auto_492454 ?auto_492458 ) ) ( not ( = ?auto_492454 ?auto_492459 ) ) ( not ( = ?auto_492454 ?auto_492460 ) ) ( not ( = ?auto_492454 ?auto_492461 ) ) ( not ( = ?auto_492454 ?auto_492462 ) ) ( not ( = ?auto_492455 ?auto_492456 ) ) ( not ( = ?auto_492455 ?auto_492457 ) ) ( not ( = ?auto_492455 ?auto_492458 ) ) ( not ( = ?auto_492455 ?auto_492459 ) ) ( not ( = ?auto_492455 ?auto_492460 ) ) ( not ( = ?auto_492455 ?auto_492461 ) ) ( not ( = ?auto_492455 ?auto_492462 ) ) ( not ( = ?auto_492456 ?auto_492457 ) ) ( not ( = ?auto_492456 ?auto_492458 ) ) ( not ( = ?auto_492456 ?auto_492459 ) ) ( not ( = ?auto_492456 ?auto_492460 ) ) ( not ( = ?auto_492456 ?auto_492461 ) ) ( not ( = ?auto_492456 ?auto_492462 ) ) ( not ( = ?auto_492457 ?auto_492458 ) ) ( not ( = ?auto_492457 ?auto_492459 ) ) ( not ( = ?auto_492457 ?auto_492460 ) ) ( not ( = ?auto_492457 ?auto_492461 ) ) ( not ( = ?auto_492457 ?auto_492462 ) ) ( not ( = ?auto_492458 ?auto_492459 ) ) ( not ( = ?auto_492458 ?auto_492460 ) ) ( not ( = ?auto_492458 ?auto_492461 ) ) ( not ( = ?auto_492458 ?auto_492462 ) ) ( not ( = ?auto_492459 ?auto_492460 ) ) ( not ( = ?auto_492459 ?auto_492461 ) ) ( not ( = ?auto_492459 ?auto_492462 ) ) ( not ( = ?auto_492460 ?auto_492461 ) ) ( not ( = ?auto_492460 ?auto_492462 ) ) ( not ( = ?auto_492461 ?auto_492462 ) ) ( ON ?auto_492460 ?auto_492461 ) ( ON ?auto_492459 ?auto_492460 ) ( ON ?auto_492458 ?auto_492459 ) ( ON ?auto_492457 ?auto_492458 ) ( CLEAR ?auto_492455 ) ( ON ?auto_492456 ?auto_492457 ) ( CLEAR ?auto_492456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_492450 ?auto_492451 ?auto_492452 ?auto_492453 ?auto_492454 ?auto_492455 ?auto_492456 )
      ( MAKE-12PILE ?auto_492450 ?auto_492451 ?auto_492452 ?auto_492453 ?auto_492454 ?auto_492455 ?auto_492456 ?auto_492457 ?auto_492458 ?auto_492459 ?auto_492460 ?auto_492461 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_492500 - BLOCK
      ?auto_492501 - BLOCK
      ?auto_492502 - BLOCK
      ?auto_492503 - BLOCK
      ?auto_492504 - BLOCK
      ?auto_492505 - BLOCK
      ?auto_492506 - BLOCK
      ?auto_492507 - BLOCK
      ?auto_492508 - BLOCK
      ?auto_492509 - BLOCK
      ?auto_492510 - BLOCK
      ?auto_492511 - BLOCK
    )
    :vars
    (
      ?auto_492512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492511 ?auto_492512 ) ( ON-TABLE ?auto_492500 ) ( ON ?auto_492501 ?auto_492500 ) ( ON ?auto_492502 ?auto_492501 ) ( ON ?auto_492503 ?auto_492502 ) ( ON ?auto_492504 ?auto_492503 ) ( not ( = ?auto_492500 ?auto_492501 ) ) ( not ( = ?auto_492500 ?auto_492502 ) ) ( not ( = ?auto_492500 ?auto_492503 ) ) ( not ( = ?auto_492500 ?auto_492504 ) ) ( not ( = ?auto_492500 ?auto_492505 ) ) ( not ( = ?auto_492500 ?auto_492506 ) ) ( not ( = ?auto_492500 ?auto_492507 ) ) ( not ( = ?auto_492500 ?auto_492508 ) ) ( not ( = ?auto_492500 ?auto_492509 ) ) ( not ( = ?auto_492500 ?auto_492510 ) ) ( not ( = ?auto_492500 ?auto_492511 ) ) ( not ( = ?auto_492500 ?auto_492512 ) ) ( not ( = ?auto_492501 ?auto_492502 ) ) ( not ( = ?auto_492501 ?auto_492503 ) ) ( not ( = ?auto_492501 ?auto_492504 ) ) ( not ( = ?auto_492501 ?auto_492505 ) ) ( not ( = ?auto_492501 ?auto_492506 ) ) ( not ( = ?auto_492501 ?auto_492507 ) ) ( not ( = ?auto_492501 ?auto_492508 ) ) ( not ( = ?auto_492501 ?auto_492509 ) ) ( not ( = ?auto_492501 ?auto_492510 ) ) ( not ( = ?auto_492501 ?auto_492511 ) ) ( not ( = ?auto_492501 ?auto_492512 ) ) ( not ( = ?auto_492502 ?auto_492503 ) ) ( not ( = ?auto_492502 ?auto_492504 ) ) ( not ( = ?auto_492502 ?auto_492505 ) ) ( not ( = ?auto_492502 ?auto_492506 ) ) ( not ( = ?auto_492502 ?auto_492507 ) ) ( not ( = ?auto_492502 ?auto_492508 ) ) ( not ( = ?auto_492502 ?auto_492509 ) ) ( not ( = ?auto_492502 ?auto_492510 ) ) ( not ( = ?auto_492502 ?auto_492511 ) ) ( not ( = ?auto_492502 ?auto_492512 ) ) ( not ( = ?auto_492503 ?auto_492504 ) ) ( not ( = ?auto_492503 ?auto_492505 ) ) ( not ( = ?auto_492503 ?auto_492506 ) ) ( not ( = ?auto_492503 ?auto_492507 ) ) ( not ( = ?auto_492503 ?auto_492508 ) ) ( not ( = ?auto_492503 ?auto_492509 ) ) ( not ( = ?auto_492503 ?auto_492510 ) ) ( not ( = ?auto_492503 ?auto_492511 ) ) ( not ( = ?auto_492503 ?auto_492512 ) ) ( not ( = ?auto_492504 ?auto_492505 ) ) ( not ( = ?auto_492504 ?auto_492506 ) ) ( not ( = ?auto_492504 ?auto_492507 ) ) ( not ( = ?auto_492504 ?auto_492508 ) ) ( not ( = ?auto_492504 ?auto_492509 ) ) ( not ( = ?auto_492504 ?auto_492510 ) ) ( not ( = ?auto_492504 ?auto_492511 ) ) ( not ( = ?auto_492504 ?auto_492512 ) ) ( not ( = ?auto_492505 ?auto_492506 ) ) ( not ( = ?auto_492505 ?auto_492507 ) ) ( not ( = ?auto_492505 ?auto_492508 ) ) ( not ( = ?auto_492505 ?auto_492509 ) ) ( not ( = ?auto_492505 ?auto_492510 ) ) ( not ( = ?auto_492505 ?auto_492511 ) ) ( not ( = ?auto_492505 ?auto_492512 ) ) ( not ( = ?auto_492506 ?auto_492507 ) ) ( not ( = ?auto_492506 ?auto_492508 ) ) ( not ( = ?auto_492506 ?auto_492509 ) ) ( not ( = ?auto_492506 ?auto_492510 ) ) ( not ( = ?auto_492506 ?auto_492511 ) ) ( not ( = ?auto_492506 ?auto_492512 ) ) ( not ( = ?auto_492507 ?auto_492508 ) ) ( not ( = ?auto_492507 ?auto_492509 ) ) ( not ( = ?auto_492507 ?auto_492510 ) ) ( not ( = ?auto_492507 ?auto_492511 ) ) ( not ( = ?auto_492507 ?auto_492512 ) ) ( not ( = ?auto_492508 ?auto_492509 ) ) ( not ( = ?auto_492508 ?auto_492510 ) ) ( not ( = ?auto_492508 ?auto_492511 ) ) ( not ( = ?auto_492508 ?auto_492512 ) ) ( not ( = ?auto_492509 ?auto_492510 ) ) ( not ( = ?auto_492509 ?auto_492511 ) ) ( not ( = ?auto_492509 ?auto_492512 ) ) ( not ( = ?auto_492510 ?auto_492511 ) ) ( not ( = ?auto_492510 ?auto_492512 ) ) ( not ( = ?auto_492511 ?auto_492512 ) ) ( ON ?auto_492510 ?auto_492511 ) ( ON ?auto_492509 ?auto_492510 ) ( ON ?auto_492508 ?auto_492509 ) ( ON ?auto_492507 ?auto_492508 ) ( ON ?auto_492506 ?auto_492507 ) ( CLEAR ?auto_492504 ) ( ON ?auto_492505 ?auto_492506 ) ( CLEAR ?auto_492505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_492500 ?auto_492501 ?auto_492502 ?auto_492503 ?auto_492504 ?auto_492505 )
      ( MAKE-12PILE ?auto_492500 ?auto_492501 ?auto_492502 ?auto_492503 ?auto_492504 ?auto_492505 ?auto_492506 ?auto_492507 ?auto_492508 ?auto_492509 ?auto_492510 ?auto_492511 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_492550 - BLOCK
      ?auto_492551 - BLOCK
      ?auto_492552 - BLOCK
      ?auto_492553 - BLOCK
      ?auto_492554 - BLOCK
      ?auto_492555 - BLOCK
      ?auto_492556 - BLOCK
      ?auto_492557 - BLOCK
      ?auto_492558 - BLOCK
      ?auto_492559 - BLOCK
      ?auto_492560 - BLOCK
      ?auto_492561 - BLOCK
    )
    :vars
    (
      ?auto_492562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492561 ?auto_492562 ) ( ON-TABLE ?auto_492550 ) ( ON ?auto_492551 ?auto_492550 ) ( ON ?auto_492552 ?auto_492551 ) ( ON ?auto_492553 ?auto_492552 ) ( not ( = ?auto_492550 ?auto_492551 ) ) ( not ( = ?auto_492550 ?auto_492552 ) ) ( not ( = ?auto_492550 ?auto_492553 ) ) ( not ( = ?auto_492550 ?auto_492554 ) ) ( not ( = ?auto_492550 ?auto_492555 ) ) ( not ( = ?auto_492550 ?auto_492556 ) ) ( not ( = ?auto_492550 ?auto_492557 ) ) ( not ( = ?auto_492550 ?auto_492558 ) ) ( not ( = ?auto_492550 ?auto_492559 ) ) ( not ( = ?auto_492550 ?auto_492560 ) ) ( not ( = ?auto_492550 ?auto_492561 ) ) ( not ( = ?auto_492550 ?auto_492562 ) ) ( not ( = ?auto_492551 ?auto_492552 ) ) ( not ( = ?auto_492551 ?auto_492553 ) ) ( not ( = ?auto_492551 ?auto_492554 ) ) ( not ( = ?auto_492551 ?auto_492555 ) ) ( not ( = ?auto_492551 ?auto_492556 ) ) ( not ( = ?auto_492551 ?auto_492557 ) ) ( not ( = ?auto_492551 ?auto_492558 ) ) ( not ( = ?auto_492551 ?auto_492559 ) ) ( not ( = ?auto_492551 ?auto_492560 ) ) ( not ( = ?auto_492551 ?auto_492561 ) ) ( not ( = ?auto_492551 ?auto_492562 ) ) ( not ( = ?auto_492552 ?auto_492553 ) ) ( not ( = ?auto_492552 ?auto_492554 ) ) ( not ( = ?auto_492552 ?auto_492555 ) ) ( not ( = ?auto_492552 ?auto_492556 ) ) ( not ( = ?auto_492552 ?auto_492557 ) ) ( not ( = ?auto_492552 ?auto_492558 ) ) ( not ( = ?auto_492552 ?auto_492559 ) ) ( not ( = ?auto_492552 ?auto_492560 ) ) ( not ( = ?auto_492552 ?auto_492561 ) ) ( not ( = ?auto_492552 ?auto_492562 ) ) ( not ( = ?auto_492553 ?auto_492554 ) ) ( not ( = ?auto_492553 ?auto_492555 ) ) ( not ( = ?auto_492553 ?auto_492556 ) ) ( not ( = ?auto_492553 ?auto_492557 ) ) ( not ( = ?auto_492553 ?auto_492558 ) ) ( not ( = ?auto_492553 ?auto_492559 ) ) ( not ( = ?auto_492553 ?auto_492560 ) ) ( not ( = ?auto_492553 ?auto_492561 ) ) ( not ( = ?auto_492553 ?auto_492562 ) ) ( not ( = ?auto_492554 ?auto_492555 ) ) ( not ( = ?auto_492554 ?auto_492556 ) ) ( not ( = ?auto_492554 ?auto_492557 ) ) ( not ( = ?auto_492554 ?auto_492558 ) ) ( not ( = ?auto_492554 ?auto_492559 ) ) ( not ( = ?auto_492554 ?auto_492560 ) ) ( not ( = ?auto_492554 ?auto_492561 ) ) ( not ( = ?auto_492554 ?auto_492562 ) ) ( not ( = ?auto_492555 ?auto_492556 ) ) ( not ( = ?auto_492555 ?auto_492557 ) ) ( not ( = ?auto_492555 ?auto_492558 ) ) ( not ( = ?auto_492555 ?auto_492559 ) ) ( not ( = ?auto_492555 ?auto_492560 ) ) ( not ( = ?auto_492555 ?auto_492561 ) ) ( not ( = ?auto_492555 ?auto_492562 ) ) ( not ( = ?auto_492556 ?auto_492557 ) ) ( not ( = ?auto_492556 ?auto_492558 ) ) ( not ( = ?auto_492556 ?auto_492559 ) ) ( not ( = ?auto_492556 ?auto_492560 ) ) ( not ( = ?auto_492556 ?auto_492561 ) ) ( not ( = ?auto_492556 ?auto_492562 ) ) ( not ( = ?auto_492557 ?auto_492558 ) ) ( not ( = ?auto_492557 ?auto_492559 ) ) ( not ( = ?auto_492557 ?auto_492560 ) ) ( not ( = ?auto_492557 ?auto_492561 ) ) ( not ( = ?auto_492557 ?auto_492562 ) ) ( not ( = ?auto_492558 ?auto_492559 ) ) ( not ( = ?auto_492558 ?auto_492560 ) ) ( not ( = ?auto_492558 ?auto_492561 ) ) ( not ( = ?auto_492558 ?auto_492562 ) ) ( not ( = ?auto_492559 ?auto_492560 ) ) ( not ( = ?auto_492559 ?auto_492561 ) ) ( not ( = ?auto_492559 ?auto_492562 ) ) ( not ( = ?auto_492560 ?auto_492561 ) ) ( not ( = ?auto_492560 ?auto_492562 ) ) ( not ( = ?auto_492561 ?auto_492562 ) ) ( ON ?auto_492560 ?auto_492561 ) ( ON ?auto_492559 ?auto_492560 ) ( ON ?auto_492558 ?auto_492559 ) ( ON ?auto_492557 ?auto_492558 ) ( ON ?auto_492556 ?auto_492557 ) ( ON ?auto_492555 ?auto_492556 ) ( CLEAR ?auto_492553 ) ( ON ?auto_492554 ?auto_492555 ) ( CLEAR ?auto_492554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_492550 ?auto_492551 ?auto_492552 ?auto_492553 ?auto_492554 )
      ( MAKE-12PILE ?auto_492550 ?auto_492551 ?auto_492552 ?auto_492553 ?auto_492554 ?auto_492555 ?auto_492556 ?auto_492557 ?auto_492558 ?auto_492559 ?auto_492560 ?auto_492561 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_492600 - BLOCK
      ?auto_492601 - BLOCK
      ?auto_492602 - BLOCK
      ?auto_492603 - BLOCK
      ?auto_492604 - BLOCK
      ?auto_492605 - BLOCK
      ?auto_492606 - BLOCK
      ?auto_492607 - BLOCK
      ?auto_492608 - BLOCK
      ?auto_492609 - BLOCK
      ?auto_492610 - BLOCK
      ?auto_492611 - BLOCK
    )
    :vars
    (
      ?auto_492612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492611 ?auto_492612 ) ( ON-TABLE ?auto_492600 ) ( ON ?auto_492601 ?auto_492600 ) ( ON ?auto_492602 ?auto_492601 ) ( not ( = ?auto_492600 ?auto_492601 ) ) ( not ( = ?auto_492600 ?auto_492602 ) ) ( not ( = ?auto_492600 ?auto_492603 ) ) ( not ( = ?auto_492600 ?auto_492604 ) ) ( not ( = ?auto_492600 ?auto_492605 ) ) ( not ( = ?auto_492600 ?auto_492606 ) ) ( not ( = ?auto_492600 ?auto_492607 ) ) ( not ( = ?auto_492600 ?auto_492608 ) ) ( not ( = ?auto_492600 ?auto_492609 ) ) ( not ( = ?auto_492600 ?auto_492610 ) ) ( not ( = ?auto_492600 ?auto_492611 ) ) ( not ( = ?auto_492600 ?auto_492612 ) ) ( not ( = ?auto_492601 ?auto_492602 ) ) ( not ( = ?auto_492601 ?auto_492603 ) ) ( not ( = ?auto_492601 ?auto_492604 ) ) ( not ( = ?auto_492601 ?auto_492605 ) ) ( not ( = ?auto_492601 ?auto_492606 ) ) ( not ( = ?auto_492601 ?auto_492607 ) ) ( not ( = ?auto_492601 ?auto_492608 ) ) ( not ( = ?auto_492601 ?auto_492609 ) ) ( not ( = ?auto_492601 ?auto_492610 ) ) ( not ( = ?auto_492601 ?auto_492611 ) ) ( not ( = ?auto_492601 ?auto_492612 ) ) ( not ( = ?auto_492602 ?auto_492603 ) ) ( not ( = ?auto_492602 ?auto_492604 ) ) ( not ( = ?auto_492602 ?auto_492605 ) ) ( not ( = ?auto_492602 ?auto_492606 ) ) ( not ( = ?auto_492602 ?auto_492607 ) ) ( not ( = ?auto_492602 ?auto_492608 ) ) ( not ( = ?auto_492602 ?auto_492609 ) ) ( not ( = ?auto_492602 ?auto_492610 ) ) ( not ( = ?auto_492602 ?auto_492611 ) ) ( not ( = ?auto_492602 ?auto_492612 ) ) ( not ( = ?auto_492603 ?auto_492604 ) ) ( not ( = ?auto_492603 ?auto_492605 ) ) ( not ( = ?auto_492603 ?auto_492606 ) ) ( not ( = ?auto_492603 ?auto_492607 ) ) ( not ( = ?auto_492603 ?auto_492608 ) ) ( not ( = ?auto_492603 ?auto_492609 ) ) ( not ( = ?auto_492603 ?auto_492610 ) ) ( not ( = ?auto_492603 ?auto_492611 ) ) ( not ( = ?auto_492603 ?auto_492612 ) ) ( not ( = ?auto_492604 ?auto_492605 ) ) ( not ( = ?auto_492604 ?auto_492606 ) ) ( not ( = ?auto_492604 ?auto_492607 ) ) ( not ( = ?auto_492604 ?auto_492608 ) ) ( not ( = ?auto_492604 ?auto_492609 ) ) ( not ( = ?auto_492604 ?auto_492610 ) ) ( not ( = ?auto_492604 ?auto_492611 ) ) ( not ( = ?auto_492604 ?auto_492612 ) ) ( not ( = ?auto_492605 ?auto_492606 ) ) ( not ( = ?auto_492605 ?auto_492607 ) ) ( not ( = ?auto_492605 ?auto_492608 ) ) ( not ( = ?auto_492605 ?auto_492609 ) ) ( not ( = ?auto_492605 ?auto_492610 ) ) ( not ( = ?auto_492605 ?auto_492611 ) ) ( not ( = ?auto_492605 ?auto_492612 ) ) ( not ( = ?auto_492606 ?auto_492607 ) ) ( not ( = ?auto_492606 ?auto_492608 ) ) ( not ( = ?auto_492606 ?auto_492609 ) ) ( not ( = ?auto_492606 ?auto_492610 ) ) ( not ( = ?auto_492606 ?auto_492611 ) ) ( not ( = ?auto_492606 ?auto_492612 ) ) ( not ( = ?auto_492607 ?auto_492608 ) ) ( not ( = ?auto_492607 ?auto_492609 ) ) ( not ( = ?auto_492607 ?auto_492610 ) ) ( not ( = ?auto_492607 ?auto_492611 ) ) ( not ( = ?auto_492607 ?auto_492612 ) ) ( not ( = ?auto_492608 ?auto_492609 ) ) ( not ( = ?auto_492608 ?auto_492610 ) ) ( not ( = ?auto_492608 ?auto_492611 ) ) ( not ( = ?auto_492608 ?auto_492612 ) ) ( not ( = ?auto_492609 ?auto_492610 ) ) ( not ( = ?auto_492609 ?auto_492611 ) ) ( not ( = ?auto_492609 ?auto_492612 ) ) ( not ( = ?auto_492610 ?auto_492611 ) ) ( not ( = ?auto_492610 ?auto_492612 ) ) ( not ( = ?auto_492611 ?auto_492612 ) ) ( ON ?auto_492610 ?auto_492611 ) ( ON ?auto_492609 ?auto_492610 ) ( ON ?auto_492608 ?auto_492609 ) ( ON ?auto_492607 ?auto_492608 ) ( ON ?auto_492606 ?auto_492607 ) ( ON ?auto_492605 ?auto_492606 ) ( ON ?auto_492604 ?auto_492605 ) ( CLEAR ?auto_492602 ) ( ON ?auto_492603 ?auto_492604 ) ( CLEAR ?auto_492603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_492600 ?auto_492601 ?auto_492602 ?auto_492603 )
      ( MAKE-12PILE ?auto_492600 ?auto_492601 ?auto_492602 ?auto_492603 ?auto_492604 ?auto_492605 ?auto_492606 ?auto_492607 ?auto_492608 ?auto_492609 ?auto_492610 ?auto_492611 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_492650 - BLOCK
      ?auto_492651 - BLOCK
      ?auto_492652 - BLOCK
      ?auto_492653 - BLOCK
      ?auto_492654 - BLOCK
      ?auto_492655 - BLOCK
      ?auto_492656 - BLOCK
      ?auto_492657 - BLOCK
      ?auto_492658 - BLOCK
      ?auto_492659 - BLOCK
      ?auto_492660 - BLOCK
      ?auto_492661 - BLOCK
    )
    :vars
    (
      ?auto_492662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492661 ?auto_492662 ) ( ON-TABLE ?auto_492650 ) ( ON ?auto_492651 ?auto_492650 ) ( not ( = ?auto_492650 ?auto_492651 ) ) ( not ( = ?auto_492650 ?auto_492652 ) ) ( not ( = ?auto_492650 ?auto_492653 ) ) ( not ( = ?auto_492650 ?auto_492654 ) ) ( not ( = ?auto_492650 ?auto_492655 ) ) ( not ( = ?auto_492650 ?auto_492656 ) ) ( not ( = ?auto_492650 ?auto_492657 ) ) ( not ( = ?auto_492650 ?auto_492658 ) ) ( not ( = ?auto_492650 ?auto_492659 ) ) ( not ( = ?auto_492650 ?auto_492660 ) ) ( not ( = ?auto_492650 ?auto_492661 ) ) ( not ( = ?auto_492650 ?auto_492662 ) ) ( not ( = ?auto_492651 ?auto_492652 ) ) ( not ( = ?auto_492651 ?auto_492653 ) ) ( not ( = ?auto_492651 ?auto_492654 ) ) ( not ( = ?auto_492651 ?auto_492655 ) ) ( not ( = ?auto_492651 ?auto_492656 ) ) ( not ( = ?auto_492651 ?auto_492657 ) ) ( not ( = ?auto_492651 ?auto_492658 ) ) ( not ( = ?auto_492651 ?auto_492659 ) ) ( not ( = ?auto_492651 ?auto_492660 ) ) ( not ( = ?auto_492651 ?auto_492661 ) ) ( not ( = ?auto_492651 ?auto_492662 ) ) ( not ( = ?auto_492652 ?auto_492653 ) ) ( not ( = ?auto_492652 ?auto_492654 ) ) ( not ( = ?auto_492652 ?auto_492655 ) ) ( not ( = ?auto_492652 ?auto_492656 ) ) ( not ( = ?auto_492652 ?auto_492657 ) ) ( not ( = ?auto_492652 ?auto_492658 ) ) ( not ( = ?auto_492652 ?auto_492659 ) ) ( not ( = ?auto_492652 ?auto_492660 ) ) ( not ( = ?auto_492652 ?auto_492661 ) ) ( not ( = ?auto_492652 ?auto_492662 ) ) ( not ( = ?auto_492653 ?auto_492654 ) ) ( not ( = ?auto_492653 ?auto_492655 ) ) ( not ( = ?auto_492653 ?auto_492656 ) ) ( not ( = ?auto_492653 ?auto_492657 ) ) ( not ( = ?auto_492653 ?auto_492658 ) ) ( not ( = ?auto_492653 ?auto_492659 ) ) ( not ( = ?auto_492653 ?auto_492660 ) ) ( not ( = ?auto_492653 ?auto_492661 ) ) ( not ( = ?auto_492653 ?auto_492662 ) ) ( not ( = ?auto_492654 ?auto_492655 ) ) ( not ( = ?auto_492654 ?auto_492656 ) ) ( not ( = ?auto_492654 ?auto_492657 ) ) ( not ( = ?auto_492654 ?auto_492658 ) ) ( not ( = ?auto_492654 ?auto_492659 ) ) ( not ( = ?auto_492654 ?auto_492660 ) ) ( not ( = ?auto_492654 ?auto_492661 ) ) ( not ( = ?auto_492654 ?auto_492662 ) ) ( not ( = ?auto_492655 ?auto_492656 ) ) ( not ( = ?auto_492655 ?auto_492657 ) ) ( not ( = ?auto_492655 ?auto_492658 ) ) ( not ( = ?auto_492655 ?auto_492659 ) ) ( not ( = ?auto_492655 ?auto_492660 ) ) ( not ( = ?auto_492655 ?auto_492661 ) ) ( not ( = ?auto_492655 ?auto_492662 ) ) ( not ( = ?auto_492656 ?auto_492657 ) ) ( not ( = ?auto_492656 ?auto_492658 ) ) ( not ( = ?auto_492656 ?auto_492659 ) ) ( not ( = ?auto_492656 ?auto_492660 ) ) ( not ( = ?auto_492656 ?auto_492661 ) ) ( not ( = ?auto_492656 ?auto_492662 ) ) ( not ( = ?auto_492657 ?auto_492658 ) ) ( not ( = ?auto_492657 ?auto_492659 ) ) ( not ( = ?auto_492657 ?auto_492660 ) ) ( not ( = ?auto_492657 ?auto_492661 ) ) ( not ( = ?auto_492657 ?auto_492662 ) ) ( not ( = ?auto_492658 ?auto_492659 ) ) ( not ( = ?auto_492658 ?auto_492660 ) ) ( not ( = ?auto_492658 ?auto_492661 ) ) ( not ( = ?auto_492658 ?auto_492662 ) ) ( not ( = ?auto_492659 ?auto_492660 ) ) ( not ( = ?auto_492659 ?auto_492661 ) ) ( not ( = ?auto_492659 ?auto_492662 ) ) ( not ( = ?auto_492660 ?auto_492661 ) ) ( not ( = ?auto_492660 ?auto_492662 ) ) ( not ( = ?auto_492661 ?auto_492662 ) ) ( ON ?auto_492660 ?auto_492661 ) ( ON ?auto_492659 ?auto_492660 ) ( ON ?auto_492658 ?auto_492659 ) ( ON ?auto_492657 ?auto_492658 ) ( ON ?auto_492656 ?auto_492657 ) ( ON ?auto_492655 ?auto_492656 ) ( ON ?auto_492654 ?auto_492655 ) ( ON ?auto_492653 ?auto_492654 ) ( CLEAR ?auto_492651 ) ( ON ?auto_492652 ?auto_492653 ) ( CLEAR ?auto_492652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_492650 ?auto_492651 ?auto_492652 )
      ( MAKE-12PILE ?auto_492650 ?auto_492651 ?auto_492652 ?auto_492653 ?auto_492654 ?auto_492655 ?auto_492656 ?auto_492657 ?auto_492658 ?auto_492659 ?auto_492660 ?auto_492661 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_492700 - BLOCK
      ?auto_492701 - BLOCK
      ?auto_492702 - BLOCK
      ?auto_492703 - BLOCK
      ?auto_492704 - BLOCK
      ?auto_492705 - BLOCK
      ?auto_492706 - BLOCK
      ?auto_492707 - BLOCK
      ?auto_492708 - BLOCK
      ?auto_492709 - BLOCK
      ?auto_492710 - BLOCK
      ?auto_492711 - BLOCK
    )
    :vars
    (
      ?auto_492712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492711 ?auto_492712 ) ( ON-TABLE ?auto_492700 ) ( not ( = ?auto_492700 ?auto_492701 ) ) ( not ( = ?auto_492700 ?auto_492702 ) ) ( not ( = ?auto_492700 ?auto_492703 ) ) ( not ( = ?auto_492700 ?auto_492704 ) ) ( not ( = ?auto_492700 ?auto_492705 ) ) ( not ( = ?auto_492700 ?auto_492706 ) ) ( not ( = ?auto_492700 ?auto_492707 ) ) ( not ( = ?auto_492700 ?auto_492708 ) ) ( not ( = ?auto_492700 ?auto_492709 ) ) ( not ( = ?auto_492700 ?auto_492710 ) ) ( not ( = ?auto_492700 ?auto_492711 ) ) ( not ( = ?auto_492700 ?auto_492712 ) ) ( not ( = ?auto_492701 ?auto_492702 ) ) ( not ( = ?auto_492701 ?auto_492703 ) ) ( not ( = ?auto_492701 ?auto_492704 ) ) ( not ( = ?auto_492701 ?auto_492705 ) ) ( not ( = ?auto_492701 ?auto_492706 ) ) ( not ( = ?auto_492701 ?auto_492707 ) ) ( not ( = ?auto_492701 ?auto_492708 ) ) ( not ( = ?auto_492701 ?auto_492709 ) ) ( not ( = ?auto_492701 ?auto_492710 ) ) ( not ( = ?auto_492701 ?auto_492711 ) ) ( not ( = ?auto_492701 ?auto_492712 ) ) ( not ( = ?auto_492702 ?auto_492703 ) ) ( not ( = ?auto_492702 ?auto_492704 ) ) ( not ( = ?auto_492702 ?auto_492705 ) ) ( not ( = ?auto_492702 ?auto_492706 ) ) ( not ( = ?auto_492702 ?auto_492707 ) ) ( not ( = ?auto_492702 ?auto_492708 ) ) ( not ( = ?auto_492702 ?auto_492709 ) ) ( not ( = ?auto_492702 ?auto_492710 ) ) ( not ( = ?auto_492702 ?auto_492711 ) ) ( not ( = ?auto_492702 ?auto_492712 ) ) ( not ( = ?auto_492703 ?auto_492704 ) ) ( not ( = ?auto_492703 ?auto_492705 ) ) ( not ( = ?auto_492703 ?auto_492706 ) ) ( not ( = ?auto_492703 ?auto_492707 ) ) ( not ( = ?auto_492703 ?auto_492708 ) ) ( not ( = ?auto_492703 ?auto_492709 ) ) ( not ( = ?auto_492703 ?auto_492710 ) ) ( not ( = ?auto_492703 ?auto_492711 ) ) ( not ( = ?auto_492703 ?auto_492712 ) ) ( not ( = ?auto_492704 ?auto_492705 ) ) ( not ( = ?auto_492704 ?auto_492706 ) ) ( not ( = ?auto_492704 ?auto_492707 ) ) ( not ( = ?auto_492704 ?auto_492708 ) ) ( not ( = ?auto_492704 ?auto_492709 ) ) ( not ( = ?auto_492704 ?auto_492710 ) ) ( not ( = ?auto_492704 ?auto_492711 ) ) ( not ( = ?auto_492704 ?auto_492712 ) ) ( not ( = ?auto_492705 ?auto_492706 ) ) ( not ( = ?auto_492705 ?auto_492707 ) ) ( not ( = ?auto_492705 ?auto_492708 ) ) ( not ( = ?auto_492705 ?auto_492709 ) ) ( not ( = ?auto_492705 ?auto_492710 ) ) ( not ( = ?auto_492705 ?auto_492711 ) ) ( not ( = ?auto_492705 ?auto_492712 ) ) ( not ( = ?auto_492706 ?auto_492707 ) ) ( not ( = ?auto_492706 ?auto_492708 ) ) ( not ( = ?auto_492706 ?auto_492709 ) ) ( not ( = ?auto_492706 ?auto_492710 ) ) ( not ( = ?auto_492706 ?auto_492711 ) ) ( not ( = ?auto_492706 ?auto_492712 ) ) ( not ( = ?auto_492707 ?auto_492708 ) ) ( not ( = ?auto_492707 ?auto_492709 ) ) ( not ( = ?auto_492707 ?auto_492710 ) ) ( not ( = ?auto_492707 ?auto_492711 ) ) ( not ( = ?auto_492707 ?auto_492712 ) ) ( not ( = ?auto_492708 ?auto_492709 ) ) ( not ( = ?auto_492708 ?auto_492710 ) ) ( not ( = ?auto_492708 ?auto_492711 ) ) ( not ( = ?auto_492708 ?auto_492712 ) ) ( not ( = ?auto_492709 ?auto_492710 ) ) ( not ( = ?auto_492709 ?auto_492711 ) ) ( not ( = ?auto_492709 ?auto_492712 ) ) ( not ( = ?auto_492710 ?auto_492711 ) ) ( not ( = ?auto_492710 ?auto_492712 ) ) ( not ( = ?auto_492711 ?auto_492712 ) ) ( ON ?auto_492710 ?auto_492711 ) ( ON ?auto_492709 ?auto_492710 ) ( ON ?auto_492708 ?auto_492709 ) ( ON ?auto_492707 ?auto_492708 ) ( ON ?auto_492706 ?auto_492707 ) ( ON ?auto_492705 ?auto_492706 ) ( ON ?auto_492704 ?auto_492705 ) ( ON ?auto_492703 ?auto_492704 ) ( ON ?auto_492702 ?auto_492703 ) ( CLEAR ?auto_492700 ) ( ON ?auto_492701 ?auto_492702 ) ( CLEAR ?auto_492701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_492700 ?auto_492701 )
      ( MAKE-12PILE ?auto_492700 ?auto_492701 ?auto_492702 ?auto_492703 ?auto_492704 ?auto_492705 ?auto_492706 ?auto_492707 ?auto_492708 ?auto_492709 ?auto_492710 ?auto_492711 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_492750 - BLOCK
      ?auto_492751 - BLOCK
      ?auto_492752 - BLOCK
      ?auto_492753 - BLOCK
      ?auto_492754 - BLOCK
      ?auto_492755 - BLOCK
      ?auto_492756 - BLOCK
      ?auto_492757 - BLOCK
      ?auto_492758 - BLOCK
      ?auto_492759 - BLOCK
      ?auto_492760 - BLOCK
      ?auto_492761 - BLOCK
    )
    :vars
    (
      ?auto_492762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492761 ?auto_492762 ) ( not ( = ?auto_492750 ?auto_492751 ) ) ( not ( = ?auto_492750 ?auto_492752 ) ) ( not ( = ?auto_492750 ?auto_492753 ) ) ( not ( = ?auto_492750 ?auto_492754 ) ) ( not ( = ?auto_492750 ?auto_492755 ) ) ( not ( = ?auto_492750 ?auto_492756 ) ) ( not ( = ?auto_492750 ?auto_492757 ) ) ( not ( = ?auto_492750 ?auto_492758 ) ) ( not ( = ?auto_492750 ?auto_492759 ) ) ( not ( = ?auto_492750 ?auto_492760 ) ) ( not ( = ?auto_492750 ?auto_492761 ) ) ( not ( = ?auto_492750 ?auto_492762 ) ) ( not ( = ?auto_492751 ?auto_492752 ) ) ( not ( = ?auto_492751 ?auto_492753 ) ) ( not ( = ?auto_492751 ?auto_492754 ) ) ( not ( = ?auto_492751 ?auto_492755 ) ) ( not ( = ?auto_492751 ?auto_492756 ) ) ( not ( = ?auto_492751 ?auto_492757 ) ) ( not ( = ?auto_492751 ?auto_492758 ) ) ( not ( = ?auto_492751 ?auto_492759 ) ) ( not ( = ?auto_492751 ?auto_492760 ) ) ( not ( = ?auto_492751 ?auto_492761 ) ) ( not ( = ?auto_492751 ?auto_492762 ) ) ( not ( = ?auto_492752 ?auto_492753 ) ) ( not ( = ?auto_492752 ?auto_492754 ) ) ( not ( = ?auto_492752 ?auto_492755 ) ) ( not ( = ?auto_492752 ?auto_492756 ) ) ( not ( = ?auto_492752 ?auto_492757 ) ) ( not ( = ?auto_492752 ?auto_492758 ) ) ( not ( = ?auto_492752 ?auto_492759 ) ) ( not ( = ?auto_492752 ?auto_492760 ) ) ( not ( = ?auto_492752 ?auto_492761 ) ) ( not ( = ?auto_492752 ?auto_492762 ) ) ( not ( = ?auto_492753 ?auto_492754 ) ) ( not ( = ?auto_492753 ?auto_492755 ) ) ( not ( = ?auto_492753 ?auto_492756 ) ) ( not ( = ?auto_492753 ?auto_492757 ) ) ( not ( = ?auto_492753 ?auto_492758 ) ) ( not ( = ?auto_492753 ?auto_492759 ) ) ( not ( = ?auto_492753 ?auto_492760 ) ) ( not ( = ?auto_492753 ?auto_492761 ) ) ( not ( = ?auto_492753 ?auto_492762 ) ) ( not ( = ?auto_492754 ?auto_492755 ) ) ( not ( = ?auto_492754 ?auto_492756 ) ) ( not ( = ?auto_492754 ?auto_492757 ) ) ( not ( = ?auto_492754 ?auto_492758 ) ) ( not ( = ?auto_492754 ?auto_492759 ) ) ( not ( = ?auto_492754 ?auto_492760 ) ) ( not ( = ?auto_492754 ?auto_492761 ) ) ( not ( = ?auto_492754 ?auto_492762 ) ) ( not ( = ?auto_492755 ?auto_492756 ) ) ( not ( = ?auto_492755 ?auto_492757 ) ) ( not ( = ?auto_492755 ?auto_492758 ) ) ( not ( = ?auto_492755 ?auto_492759 ) ) ( not ( = ?auto_492755 ?auto_492760 ) ) ( not ( = ?auto_492755 ?auto_492761 ) ) ( not ( = ?auto_492755 ?auto_492762 ) ) ( not ( = ?auto_492756 ?auto_492757 ) ) ( not ( = ?auto_492756 ?auto_492758 ) ) ( not ( = ?auto_492756 ?auto_492759 ) ) ( not ( = ?auto_492756 ?auto_492760 ) ) ( not ( = ?auto_492756 ?auto_492761 ) ) ( not ( = ?auto_492756 ?auto_492762 ) ) ( not ( = ?auto_492757 ?auto_492758 ) ) ( not ( = ?auto_492757 ?auto_492759 ) ) ( not ( = ?auto_492757 ?auto_492760 ) ) ( not ( = ?auto_492757 ?auto_492761 ) ) ( not ( = ?auto_492757 ?auto_492762 ) ) ( not ( = ?auto_492758 ?auto_492759 ) ) ( not ( = ?auto_492758 ?auto_492760 ) ) ( not ( = ?auto_492758 ?auto_492761 ) ) ( not ( = ?auto_492758 ?auto_492762 ) ) ( not ( = ?auto_492759 ?auto_492760 ) ) ( not ( = ?auto_492759 ?auto_492761 ) ) ( not ( = ?auto_492759 ?auto_492762 ) ) ( not ( = ?auto_492760 ?auto_492761 ) ) ( not ( = ?auto_492760 ?auto_492762 ) ) ( not ( = ?auto_492761 ?auto_492762 ) ) ( ON ?auto_492760 ?auto_492761 ) ( ON ?auto_492759 ?auto_492760 ) ( ON ?auto_492758 ?auto_492759 ) ( ON ?auto_492757 ?auto_492758 ) ( ON ?auto_492756 ?auto_492757 ) ( ON ?auto_492755 ?auto_492756 ) ( ON ?auto_492754 ?auto_492755 ) ( ON ?auto_492753 ?auto_492754 ) ( ON ?auto_492752 ?auto_492753 ) ( ON ?auto_492751 ?auto_492752 ) ( ON ?auto_492750 ?auto_492751 ) ( CLEAR ?auto_492750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_492750 )
      ( MAKE-12PILE ?auto_492750 ?auto_492751 ?auto_492752 ?auto_492753 ?auto_492754 ?auto_492755 ?auto_492756 ?auto_492757 ?auto_492758 ?auto_492759 ?auto_492760 ?auto_492761 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_492801 - BLOCK
      ?auto_492802 - BLOCK
      ?auto_492803 - BLOCK
      ?auto_492804 - BLOCK
      ?auto_492805 - BLOCK
      ?auto_492806 - BLOCK
      ?auto_492807 - BLOCK
      ?auto_492808 - BLOCK
      ?auto_492809 - BLOCK
      ?auto_492810 - BLOCK
      ?auto_492811 - BLOCK
      ?auto_492812 - BLOCK
      ?auto_492813 - BLOCK
    )
    :vars
    (
      ?auto_492814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_492812 ) ( ON ?auto_492813 ?auto_492814 ) ( CLEAR ?auto_492813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_492801 ) ( ON ?auto_492802 ?auto_492801 ) ( ON ?auto_492803 ?auto_492802 ) ( ON ?auto_492804 ?auto_492803 ) ( ON ?auto_492805 ?auto_492804 ) ( ON ?auto_492806 ?auto_492805 ) ( ON ?auto_492807 ?auto_492806 ) ( ON ?auto_492808 ?auto_492807 ) ( ON ?auto_492809 ?auto_492808 ) ( ON ?auto_492810 ?auto_492809 ) ( ON ?auto_492811 ?auto_492810 ) ( ON ?auto_492812 ?auto_492811 ) ( not ( = ?auto_492801 ?auto_492802 ) ) ( not ( = ?auto_492801 ?auto_492803 ) ) ( not ( = ?auto_492801 ?auto_492804 ) ) ( not ( = ?auto_492801 ?auto_492805 ) ) ( not ( = ?auto_492801 ?auto_492806 ) ) ( not ( = ?auto_492801 ?auto_492807 ) ) ( not ( = ?auto_492801 ?auto_492808 ) ) ( not ( = ?auto_492801 ?auto_492809 ) ) ( not ( = ?auto_492801 ?auto_492810 ) ) ( not ( = ?auto_492801 ?auto_492811 ) ) ( not ( = ?auto_492801 ?auto_492812 ) ) ( not ( = ?auto_492801 ?auto_492813 ) ) ( not ( = ?auto_492801 ?auto_492814 ) ) ( not ( = ?auto_492802 ?auto_492803 ) ) ( not ( = ?auto_492802 ?auto_492804 ) ) ( not ( = ?auto_492802 ?auto_492805 ) ) ( not ( = ?auto_492802 ?auto_492806 ) ) ( not ( = ?auto_492802 ?auto_492807 ) ) ( not ( = ?auto_492802 ?auto_492808 ) ) ( not ( = ?auto_492802 ?auto_492809 ) ) ( not ( = ?auto_492802 ?auto_492810 ) ) ( not ( = ?auto_492802 ?auto_492811 ) ) ( not ( = ?auto_492802 ?auto_492812 ) ) ( not ( = ?auto_492802 ?auto_492813 ) ) ( not ( = ?auto_492802 ?auto_492814 ) ) ( not ( = ?auto_492803 ?auto_492804 ) ) ( not ( = ?auto_492803 ?auto_492805 ) ) ( not ( = ?auto_492803 ?auto_492806 ) ) ( not ( = ?auto_492803 ?auto_492807 ) ) ( not ( = ?auto_492803 ?auto_492808 ) ) ( not ( = ?auto_492803 ?auto_492809 ) ) ( not ( = ?auto_492803 ?auto_492810 ) ) ( not ( = ?auto_492803 ?auto_492811 ) ) ( not ( = ?auto_492803 ?auto_492812 ) ) ( not ( = ?auto_492803 ?auto_492813 ) ) ( not ( = ?auto_492803 ?auto_492814 ) ) ( not ( = ?auto_492804 ?auto_492805 ) ) ( not ( = ?auto_492804 ?auto_492806 ) ) ( not ( = ?auto_492804 ?auto_492807 ) ) ( not ( = ?auto_492804 ?auto_492808 ) ) ( not ( = ?auto_492804 ?auto_492809 ) ) ( not ( = ?auto_492804 ?auto_492810 ) ) ( not ( = ?auto_492804 ?auto_492811 ) ) ( not ( = ?auto_492804 ?auto_492812 ) ) ( not ( = ?auto_492804 ?auto_492813 ) ) ( not ( = ?auto_492804 ?auto_492814 ) ) ( not ( = ?auto_492805 ?auto_492806 ) ) ( not ( = ?auto_492805 ?auto_492807 ) ) ( not ( = ?auto_492805 ?auto_492808 ) ) ( not ( = ?auto_492805 ?auto_492809 ) ) ( not ( = ?auto_492805 ?auto_492810 ) ) ( not ( = ?auto_492805 ?auto_492811 ) ) ( not ( = ?auto_492805 ?auto_492812 ) ) ( not ( = ?auto_492805 ?auto_492813 ) ) ( not ( = ?auto_492805 ?auto_492814 ) ) ( not ( = ?auto_492806 ?auto_492807 ) ) ( not ( = ?auto_492806 ?auto_492808 ) ) ( not ( = ?auto_492806 ?auto_492809 ) ) ( not ( = ?auto_492806 ?auto_492810 ) ) ( not ( = ?auto_492806 ?auto_492811 ) ) ( not ( = ?auto_492806 ?auto_492812 ) ) ( not ( = ?auto_492806 ?auto_492813 ) ) ( not ( = ?auto_492806 ?auto_492814 ) ) ( not ( = ?auto_492807 ?auto_492808 ) ) ( not ( = ?auto_492807 ?auto_492809 ) ) ( not ( = ?auto_492807 ?auto_492810 ) ) ( not ( = ?auto_492807 ?auto_492811 ) ) ( not ( = ?auto_492807 ?auto_492812 ) ) ( not ( = ?auto_492807 ?auto_492813 ) ) ( not ( = ?auto_492807 ?auto_492814 ) ) ( not ( = ?auto_492808 ?auto_492809 ) ) ( not ( = ?auto_492808 ?auto_492810 ) ) ( not ( = ?auto_492808 ?auto_492811 ) ) ( not ( = ?auto_492808 ?auto_492812 ) ) ( not ( = ?auto_492808 ?auto_492813 ) ) ( not ( = ?auto_492808 ?auto_492814 ) ) ( not ( = ?auto_492809 ?auto_492810 ) ) ( not ( = ?auto_492809 ?auto_492811 ) ) ( not ( = ?auto_492809 ?auto_492812 ) ) ( not ( = ?auto_492809 ?auto_492813 ) ) ( not ( = ?auto_492809 ?auto_492814 ) ) ( not ( = ?auto_492810 ?auto_492811 ) ) ( not ( = ?auto_492810 ?auto_492812 ) ) ( not ( = ?auto_492810 ?auto_492813 ) ) ( not ( = ?auto_492810 ?auto_492814 ) ) ( not ( = ?auto_492811 ?auto_492812 ) ) ( not ( = ?auto_492811 ?auto_492813 ) ) ( not ( = ?auto_492811 ?auto_492814 ) ) ( not ( = ?auto_492812 ?auto_492813 ) ) ( not ( = ?auto_492812 ?auto_492814 ) ) ( not ( = ?auto_492813 ?auto_492814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_492813 ?auto_492814 )
      ( !STACK ?auto_492813 ?auto_492812 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_492855 - BLOCK
      ?auto_492856 - BLOCK
      ?auto_492857 - BLOCK
      ?auto_492858 - BLOCK
      ?auto_492859 - BLOCK
      ?auto_492860 - BLOCK
      ?auto_492861 - BLOCK
      ?auto_492862 - BLOCK
      ?auto_492863 - BLOCK
      ?auto_492864 - BLOCK
      ?auto_492865 - BLOCK
      ?auto_492866 - BLOCK
      ?auto_492867 - BLOCK
    )
    :vars
    (
      ?auto_492868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492867 ?auto_492868 ) ( ON-TABLE ?auto_492855 ) ( ON ?auto_492856 ?auto_492855 ) ( ON ?auto_492857 ?auto_492856 ) ( ON ?auto_492858 ?auto_492857 ) ( ON ?auto_492859 ?auto_492858 ) ( ON ?auto_492860 ?auto_492859 ) ( ON ?auto_492861 ?auto_492860 ) ( ON ?auto_492862 ?auto_492861 ) ( ON ?auto_492863 ?auto_492862 ) ( ON ?auto_492864 ?auto_492863 ) ( ON ?auto_492865 ?auto_492864 ) ( not ( = ?auto_492855 ?auto_492856 ) ) ( not ( = ?auto_492855 ?auto_492857 ) ) ( not ( = ?auto_492855 ?auto_492858 ) ) ( not ( = ?auto_492855 ?auto_492859 ) ) ( not ( = ?auto_492855 ?auto_492860 ) ) ( not ( = ?auto_492855 ?auto_492861 ) ) ( not ( = ?auto_492855 ?auto_492862 ) ) ( not ( = ?auto_492855 ?auto_492863 ) ) ( not ( = ?auto_492855 ?auto_492864 ) ) ( not ( = ?auto_492855 ?auto_492865 ) ) ( not ( = ?auto_492855 ?auto_492866 ) ) ( not ( = ?auto_492855 ?auto_492867 ) ) ( not ( = ?auto_492855 ?auto_492868 ) ) ( not ( = ?auto_492856 ?auto_492857 ) ) ( not ( = ?auto_492856 ?auto_492858 ) ) ( not ( = ?auto_492856 ?auto_492859 ) ) ( not ( = ?auto_492856 ?auto_492860 ) ) ( not ( = ?auto_492856 ?auto_492861 ) ) ( not ( = ?auto_492856 ?auto_492862 ) ) ( not ( = ?auto_492856 ?auto_492863 ) ) ( not ( = ?auto_492856 ?auto_492864 ) ) ( not ( = ?auto_492856 ?auto_492865 ) ) ( not ( = ?auto_492856 ?auto_492866 ) ) ( not ( = ?auto_492856 ?auto_492867 ) ) ( not ( = ?auto_492856 ?auto_492868 ) ) ( not ( = ?auto_492857 ?auto_492858 ) ) ( not ( = ?auto_492857 ?auto_492859 ) ) ( not ( = ?auto_492857 ?auto_492860 ) ) ( not ( = ?auto_492857 ?auto_492861 ) ) ( not ( = ?auto_492857 ?auto_492862 ) ) ( not ( = ?auto_492857 ?auto_492863 ) ) ( not ( = ?auto_492857 ?auto_492864 ) ) ( not ( = ?auto_492857 ?auto_492865 ) ) ( not ( = ?auto_492857 ?auto_492866 ) ) ( not ( = ?auto_492857 ?auto_492867 ) ) ( not ( = ?auto_492857 ?auto_492868 ) ) ( not ( = ?auto_492858 ?auto_492859 ) ) ( not ( = ?auto_492858 ?auto_492860 ) ) ( not ( = ?auto_492858 ?auto_492861 ) ) ( not ( = ?auto_492858 ?auto_492862 ) ) ( not ( = ?auto_492858 ?auto_492863 ) ) ( not ( = ?auto_492858 ?auto_492864 ) ) ( not ( = ?auto_492858 ?auto_492865 ) ) ( not ( = ?auto_492858 ?auto_492866 ) ) ( not ( = ?auto_492858 ?auto_492867 ) ) ( not ( = ?auto_492858 ?auto_492868 ) ) ( not ( = ?auto_492859 ?auto_492860 ) ) ( not ( = ?auto_492859 ?auto_492861 ) ) ( not ( = ?auto_492859 ?auto_492862 ) ) ( not ( = ?auto_492859 ?auto_492863 ) ) ( not ( = ?auto_492859 ?auto_492864 ) ) ( not ( = ?auto_492859 ?auto_492865 ) ) ( not ( = ?auto_492859 ?auto_492866 ) ) ( not ( = ?auto_492859 ?auto_492867 ) ) ( not ( = ?auto_492859 ?auto_492868 ) ) ( not ( = ?auto_492860 ?auto_492861 ) ) ( not ( = ?auto_492860 ?auto_492862 ) ) ( not ( = ?auto_492860 ?auto_492863 ) ) ( not ( = ?auto_492860 ?auto_492864 ) ) ( not ( = ?auto_492860 ?auto_492865 ) ) ( not ( = ?auto_492860 ?auto_492866 ) ) ( not ( = ?auto_492860 ?auto_492867 ) ) ( not ( = ?auto_492860 ?auto_492868 ) ) ( not ( = ?auto_492861 ?auto_492862 ) ) ( not ( = ?auto_492861 ?auto_492863 ) ) ( not ( = ?auto_492861 ?auto_492864 ) ) ( not ( = ?auto_492861 ?auto_492865 ) ) ( not ( = ?auto_492861 ?auto_492866 ) ) ( not ( = ?auto_492861 ?auto_492867 ) ) ( not ( = ?auto_492861 ?auto_492868 ) ) ( not ( = ?auto_492862 ?auto_492863 ) ) ( not ( = ?auto_492862 ?auto_492864 ) ) ( not ( = ?auto_492862 ?auto_492865 ) ) ( not ( = ?auto_492862 ?auto_492866 ) ) ( not ( = ?auto_492862 ?auto_492867 ) ) ( not ( = ?auto_492862 ?auto_492868 ) ) ( not ( = ?auto_492863 ?auto_492864 ) ) ( not ( = ?auto_492863 ?auto_492865 ) ) ( not ( = ?auto_492863 ?auto_492866 ) ) ( not ( = ?auto_492863 ?auto_492867 ) ) ( not ( = ?auto_492863 ?auto_492868 ) ) ( not ( = ?auto_492864 ?auto_492865 ) ) ( not ( = ?auto_492864 ?auto_492866 ) ) ( not ( = ?auto_492864 ?auto_492867 ) ) ( not ( = ?auto_492864 ?auto_492868 ) ) ( not ( = ?auto_492865 ?auto_492866 ) ) ( not ( = ?auto_492865 ?auto_492867 ) ) ( not ( = ?auto_492865 ?auto_492868 ) ) ( not ( = ?auto_492866 ?auto_492867 ) ) ( not ( = ?auto_492866 ?auto_492868 ) ) ( not ( = ?auto_492867 ?auto_492868 ) ) ( CLEAR ?auto_492865 ) ( ON ?auto_492866 ?auto_492867 ) ( CLEAR ?auto_492866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_492855 ?auto_492856 ?auto_492857 ?auto_492858 ?auto_492859 ?auto_492860 ?auto_492861 ?auto_492862 ?auto_492863 ?auto_492864 ?auto_492865 ?auto_492866 )
      ( MAKE-13PILE ?auto_492855 ?auto_492856 ?auto_492857 ?auto_492858 ?auto_492859 ?auto_492860 ?auto_492861 ?auto_492862 ?auto_492863 ?auto_492864 ?auto_492865 ?auto_492866 ?auto_492867 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_492909 - BLOCK
      ?auto_492910 - BLOCK
      ?auto_492911 - BLOCK
      ?auto_492912 - BLOCK
      ?auto_492913 - BLOCK
      ?auto_492914 - BLOCK
      ?auto_492915 - BLOCK
      ?auto_492916 - BLOCK
      ?auto_492917 - BLOCK
      ?auto_492918 - BLOCK
      ?auto_492919 - BLOCK
      ?auto_492920 - BLOCK
      ?auto_492921 - BLOCK
    )
    :vars
    (
      ?auto_492922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492921 ?auto_492922 ) ( ON-TABLE ?auto_492909 ) ( ON ?auto_492910 ?auto_492909 ) ( ON ?auto_492911 ?auto_492910 ) ( ON ?auto_492912 ?auto_492911 ) ( ON ?auto_492913 ?auto_492912 ) ( ON ?auto_492914 ?auto_492913 ) ( ON ?auto_492915 ?auto_492914 ) ( ON ?auto_492916 ?auto_492915 ) ( ON ?auto_492917 ?auto_492916 ) ( ON ?auto_492918 ?auto_492917 ) ( not ( = ?auto_492909 ?auto_492910 ) ) ( not ( = ?auto_492909 ?auto_492911 ) ) ( not ( = ?auto_492909 ?auto_492912 ) ) ( not ( = ?auto_492909 ?auto_492913 ) ) ( not ( = ?auto_492909 ?auto_492914 ) ) ( not ( = ?auto_492909 ?auto_492915 ) ) ( not ( = ?auto_492909 ?auto_492916 ) ) ( not ( = ?auto_492909 ?auto_492917 ) ) ( not ( = ?auto_492909 ?auto_492918 ) ) ( not ( = ?auto_492909 ?auto_492919 ) ) ( not ( = ?auto_492909 ?auto_492920 ) ) ( not ( = ?auto_492909 ?auto_492921 ) ) ( not ( = ?auto_492909 ?auto_492922 ) ) ( not ( = ?auto_492910 ?auto_492911 ) ) ( not ( = ?auto_492910 ?auto_492912 ) ) ( not ( = ?auto_492910 ?auto_492913 ) ) ( not ( = ?auto_492910 ?auto_492914 ) ) ( not ( = ?auto_492910 ?auto_492915 ) ) ( not ( = ?auto_492910 ?auto_492916 ) ) ( not ( = ?auto_492910 ?auto_492917 ) ) ( not ( = ?auto_492910 ?auto_492918 ) ) ( not ( = ?auto_492910 ?auto_492919 ) ) ( not ( = ?auto_492910 ?auto_492920 ) ) ( not ( = ?auto_492910 ?auto_492921 ) ) ( not ( = ?auto_492910 ?auto_492922 ) ) ( not ( = ?auto_492911 ?auto_492912 ) ) ( not ( = ?auto_492911 ?auto_492913 ) ) ( not ( = ?auto_492911 ?auto_492914 ) ) ( not ( = ?auto_492911 ?auto_492915 ) ) ( not ( = ?auto_492911 ?auto_492916 ) ) ( not ( = ?auto_492911 ?auto_492917 ) ) ( not ( = ?auto_492911 ?auto_492918 ) ) ( not ( = ?auto_492911 ?auto_492919 ) ) ( not ( = ?auto_492911 ?auto_492920 ) ) ( not ( = ?auto_492911 ?auto_492921 ) ) ( not ( = ?auto_492911 ?auto_492922 ) ) ( not ( = ?auto_492912 ?auto_492913 ) ) ( not ( = ?auto_492912 ?auto_492914 ) ) ( not ( = ?auto_492912 ?auto_492915 ) ) ( not ( = ?auto_492912 ?auto_492916 ) ) ( not ( = ?auto_492912 ?auto_492917 ) ) ( not ( = ?auto_492912 ?auto_492918 ) ) ( not ( = ?auto_492912 ?auto_492919 ) ) ( not ( = ?auto_492912 ?auto_492920 ) ) ( not ( = ?auto_492912 ?auto_492921 ) ) ( not ( = ?auto_492912 ?auto_492922 ) ) ( not ( = ?auto_492913 ?auto_492914 ) ) ( not ( = ?auto_492913 ?auto_492915 ) ) ( not ( = ?auto_492913 ?auto_492916 ) ) ( not ( = ?auto_492913 ?auto_492917 ) ) ( not ( = ?auto_492913 ?auto_492918 ) ) ( not ( = ?auto_492913 ?auto_492919 ) ) ( not ( = ?auto_492913 ?auto_492920 ) ) ( not ( = ?auto_492913 ?auto_492921 ) ) ( not ( = ?auto_492913 ?auto_492922 ) ) ( not ( = ?auto_492914 ?auto_492915 ) ) ( not ( = ?auto_492914 ?auto_492916 ) ) ( not ( = ?auto_492914 ?auto_492917 ) ) ( not ( = ?auto_492914 ?auto_492918 ) ) ( not ( = ?auto_492914 ?auto_492919 ) ) ( not ( = ?auto_492914 ?auto_492920 ) ) ( not ( = ?auto_492914 ?auto_492921 ) ) ( not ( = ?auto_492914 ?auto_492922 ) ) ( not ( = ?auto_492915 ?auto_492916 ) ) ( not ( = ?auto_492915 ?auto_492917 ) ) ( not ( = ?auto_492915 ?auto_492918 ) ) ( not ( = ?auto_492915 ?auto_492919 ) ) ( not ( = ?auto_492915 ?auto_492920 ) ) ( not ( = ?auto_492915 ?auto_492921 ) ) ( not ( = ?auto_492915 ?auto_492922 ) ) ( not ( = ?auto_492916 ?auto_492917 ) ) ( not ( = ?auto_492916 ?auto_492918 ) ) ( not ( = ?auto_492916 ?auto_492919 ) ) ( not ( = ?auto_492916 ?auto_492920 ) ) ( not ( = ?auto_492916 ?auto_492921 ) ) ( not ( = ?auto_492916 ?auto_492922 ) ) ( not ( = ?auto_492917 ?auto_492918 ) ) ( not ( = ?auto_492917 ?auto_492919 ) ) ( not ( = ?auto_492917 ?auto_492920 ) ) ( not ( = ?auto_492917 ?auto_492921 ) ) ( not ( = ?auto_492917 ?auto_492922 ) ) ( not ( = ?auto_492918 ?auto_492919 ) ) ( not ( = ?auto_492918 ?auto_492920 ) ) ( not ( = ?auto_492918 ?auto_492921 ) ) ( not ( = ?auto_492918 ?auto_492922 ) ) ( not ( = ?auto_492919 ?auto_492920 ) ) ( not ( = ?auto_492919 ?auto_492921 ) ) ( not ( = ?auto_492919 ?auto_492922 ) ) ( not ( = ?auto_492920 ?auto_492921 ) ) ( not ( = ?auto_492920 ?auto_492922 ) ) ( not ( = ?auto_492921 ?auto_492922 ) ) ( ON ?auto_492920 ?auto_492921 ) ( CLEAR ?auto_492918 ) ( ON ?auto_492919 ?auto_492920 ) ( CLEAR ?auto_492919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_492909 ?auto_492910 ?auto_492911 ?auto_492912 ?auto_492913 ?auto_492914 ?auto_492915 ?auto_492916 ?auto_492917 ?auto_492918 ?auto_492919 )
      ( MAKE-13PILE ?auto_492909 ?auto_492910 ?auto_492911 ?auto_492912 ?auto_492913 ?auto_492914 ?auto_492915 ?auto_492916 ?auto_492917 ?auto_492918 ?auto_492919 ?auto_492920 ?auto_492921 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_492963 - BLOCK
      ?auto_492964 - BLOCK
      ?auto_492965 - BLOCK
      ?auto_492966 - BLOCK
      ?auto_492967 - BLOCK
      ?auto_492968 - BLOCK
      ?auto_492969 - BLOCK
      ?auto_492970 - BLOCK
      ?auto_492971 - BLOCK
      ?auto_492972 - BLOCK
      ?auto_492973 - BLOCK
      ?auto_492974 - BLOCK
      ?auto_492975 - BLOCK
    )
    :vars
    (
      ?auto_492976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_492975 ?auto_492976 ) ( ON-TABLE ?auto_492963 ) ( ON ?auto_492964 ?auto_492963 ) ( ON ?auto_492965 ?auto_492964 ) ( ON ?auto_492966 ?auto_492965 ) ( ON ?auto_492967 ?auto_492966 ) ( ON ?auto_492968 ?auto_492967 ) ( ON ?auto_492969 ?auto_492968 ) ( ON ?auto_492970 ?auto_492969 ) ( ON ?auto_492971 ?auto_492970 ) ( not ( = ?auto_492963 ?auto_492964 ) ) ( not ( = ?auto_492963 ?auto_492965 ) ) ( not ( = ?auto_492963 ?auto_492966 ) ) ( not ( = ?auto_492963 ?auto_492967 ) ) ( not ( = ?auto_492963 ?auto_492968 ) ) ( not ( = ?auto_492963 ?auto_492969 ) ) ( not ( = ?auto_492963 ?auto_492970 ) ) ( not ( = ?auto_492963 ?auto_492971 ) ) ( not ( = ?auto_492963 ?auto_492972 ) ) ( not ( = ?auto_492963 ?auto_492973 ) ) ( not ( = ?auto_492963 ?auto_492974 ) ) ( not ( = ?auto_492963 ?auto_492975 ) ) ( not ( = ?auto_492963 ?auto_492976 ) ) ( not ( = ?auto_492964 ?auto_492965 ) ) ( not ( = ?auto_492964 ?auto_492966 ) ) ( not ( = ?auto_492964 ?auto_492967 ) ) ( not ( = ?auto_492964 ?auto_492968 ) ) ( not ( = ?auto_492964 ?auto_492969 ) ) ( not ( = ?auto_492964 ?auto_492970 ) ) ( not ( = ?auto_492964 ?auto_492971 ) ) ( not ( = ?auto_492964 ?auto_492972 ) ) ( not ( = ?auto_492964 ?auto_492973 ) ) ( not ( = ?auto_492964 ?auto_492974 ) ) ( not ( = ?auto_492964 ?auto_492975 ) ) ( not ( = ?auto_492964 ?auto_492976 ) ) ( not ( = ?auto_492965 ?auto_492966 ) ) ( not ( = ?auto_492965 ?auto_492967 ) ) ( not ( = ?auto_492965 ?auto_492968 ) ) ( not ( = ?auto_492965 ?auto_492969 ) ) ( not ( = ?auto_492965 ?auto_492970 ) ) ( not ( = ?auto_492965 ?auto_492971 ) ) ( not ( = ?auto_492965 ?auto_492972 ) ) ( not ( = ?auto_492965 ?auto_492973 ) ) ( not ( = ?auto_492965 ?auto_492974 ) ) ( not ( = ?auto_492965 ?auto_492975 ) ) ( not ( = ?auto_492965 ?auto_492976 ) ) ( not ( = ?auto_492966 ?auto_492967 ) ) ( not ( = ?auto_492966 ?auto_492968 ) ) ( not ( = ?auto_492966 ?auto_492969 ) ) ( not ( = ?auto_492966 ?auto_492970 ) ) ( not ( = ?auto_492966 ?auto_492971 ) ) ( not ( = ?auto_492966 ?auto_492972 ) ) ( not ( = ?auto_492966 ?auto_492973 ) ) ( not ( = ?auto_492966 ?auto_492974 ) ) ( not ( = ?auto_492966 ?auto_492975 ) ) ( not ( = ?auto_492966 ?auto_492976 ) ) ( not ( = ?auto_492967 ?auto_492968 ) ) ( not ( = ?auto_492967 ?auto_492969 ) ) ( not ( = ?auto_492967 ?auto_492970 ) ) ( not ( = ?auto_492967 ?auto_492971 ) ) ( not ( = ?auto_492967 ?auto_492972 ) ) ( not ( = ?auto_492967 ?auto_492973 ) ) ( not ( = ?auto_492967 ?auto_492974 ) ) ( not ( = ?auto_492967 ?auto_492975 ) ) ( not ( = ?auto_492967 ?auto_492976 ) ) ( not ( = ?auto_492968 ?auto_492969 ) ) ( not ( = ?auto_492968 ?auto_492970 ) ) ( not ( = ?auto_492968 ?auto_492971 ) ) ( not ( = ?auto_492968 ?auto_492972 ) ) ( not ( = ?auto_492968 ?auto_492973 ) ) ( not ( = ?auto_492968 ?auto_492974 ) ) ( not ( = ?auto_492968 ?auto_492975 ) ) ( not ( = ?auto_492968 ?auto_492976 ) ) ( not ( = ?auto_492969 ?auto_492970 ) ) ( not ( = ?auto_492969 ?auto_492971 ) ) ( not ( = ?auto_492969 ?auto_492972 ) ) ( not ( = ?auto_492969 ?auto_492973 ) ) ( not ( = ?auto_492969 ?auto_492974 ) ) ( not ( = ?auto_492969 ?auto_492975 ) ) ( not ( = ?auto_492969 ?auto_492976 ) ) ( not ( = ?auto_492970 ?auto_492971 ) ) ( not ( = ?auto_492970 ?auto_492972 ) ) ( not ( = ?auto_492970 ?auto_492973 ) ) ( not ( = ?auto_492970 ?auto_492974 ) ) ( not ( = ?auto_492970 ?auto_492975 ) ) ( not ( = ?auto_492970 ?auto_492976 ) ) ( not ( = ?auto_492971 ?auto_492972 ) ) ( not ( = ?auto_492971 ?auto_492973 ) ) ( not ( = ?auto_492971 ?auto_492974 ) ) ( not ( = ?auto_492971 ?auto_492975 ) ) ( not ( = ?auto_492971 ?auto_492976 ) ) ( not ( = ?auto_492972 ?auto_492973 ) ) ( not ( = ?auto_492972 ?auto_492974 ) ) ( not ( = ?auto_492972 ?auto_492975 ) ) ( not ( = ?auto_492972 ?auto_492976 ) ) ( not ( = ?auto_492973 ?auto_492974 ) ) ( not ( = ?auto_492973 ?auto_492975 ) ) ( not ( = ?auto_492973 ?auto_492976 ) ) ( not ( = ?auto_492974 ?auto_492975 ) ) ( not ( = ?auto_492974 ?auto_492976 ) ) ( not ( = ?auto_492975 ?auto_492976 ) ) ( ON ?auto_492974 ?auto_492975 ) ( ON ?auto_492973 ?auto_492974 ) ( CLEAR ?auto_492971 ) ( ON ?auto_492972 ?auto_492973 ) ( CLEAR ?auto_492972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_492963 ?auto_492964 ?auto_492965 ?auto_492966 ?auto_492967 ?auto_492968 ?auto_492969 ?auto_492970 ?auto_492971 ?auto_492972 )
      ( MAKE-13PILE ?auto_492963 ?auto_492964 ?auto_492965 ?auto_492966 ?auto_492967 ?auto_492968 ?auto_492969 ?auto_492970 ?auto_492971 ?auto_492972 ?auto_492973 ?auto_492974 ?auto_492975 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_493017 - BLOCK
      ?auto_493018 - BLOCK
      ?auto_493019 - BLOCK
      ?auto_493020 - BLOCK
      ?auto_493021 - BLOCK
      ?auto_493022 - BLOCK
      ?auto_493023 - BLOCK
      ?auto_493024 - BLOCK
      ?auto_493025 - BLOCK
      ?auto_493026 - BLOCK
      ?auto_493027 - BLOCK
      ?auto_493028 - BLOCK
      ?auto_493029 - BLOCK
    )
    :vars
    (
      ?auto_493030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493029 ?auto_493030 ) ( ON-TABLE ?auto_493017 ) ( ON ?auto_493018 ?auto_493017 ) ( ON ?auto_493019 ?auto_493018 ) ( ON ?auto_493020 ?auto_493019 ) ( ON ?auto_493021 ?auto_493020 ) ( ON ?auto_493022 ?auto_493021 ) ( ON ?auto_493023 ?auto_493022 ) ( ON ?auto_493024 ?auto_493023 ) ( not ( = ?auto_493017 ?auto_493018 ) ) ( not ( = ?auto_493017 ?auto_493019 ) ) ( not ( = ?auto_493017 ?auto_493020 ) ) ( not ( = ?auto_493017 ?auto_493021 ) ) ( not ( = ?auto_493017 ?auto_493022 ) ) ( not ( = ?auto_493017 ?auto_493023 ) ) ( not ( = ?auto_493017 ?auto_493024 ) ) ( not ( = ?auto_493017 ?auto_493025 ) ) ( not ( = ?auto_493017 ?auto_493026 ) ) ( not ( = ?auto_493017 ?auto_493027 ) ) ( not ( = ?auto_493017 ?auto_493028 ) ) ( not ( = ?auto_493017 ?auto_493029 ) ) ( not ( = ?auto_493017 ?auto_493030 ) ) ( not ( = ?auto_493018 ?auto_493019 ) ) ( not ( = ?auto_493018 ?auto_493020 ) ) ( not ( = ?auto_493018 ?auto_493021 ) ) ( not ( = ?auto_493018 ?auto_493022 ) ) ( not ( = ?auto_493018 ?auto_493023 ) ) ( not ( = ?auto_493018 ?auto_493024 ) ) ( not ( = ?auto_493018 ?auto_493025 ) ) ( not ( = ?auto_493018 ?auto_493026 ) ) ( not ( = ?auto_493018 ?auto_493027 ) ) ( not ( = ?auto_493018 ?auto_493028 ) ) ( not ( = ?auto_493018 ?auto_493029 ) ) ( not ( = ?auto_493018 ?auto_493030 ) ) ( not ( = ?auto_493019 ?auto_493020 ) ) ( not ( = ?auto_493019 ?auto_493021 ) ) ( not ( = ?auto_493019 ?auto_493022 ) ) ( not ( = ?auto_493019 ?auto_493023 ) ) ( not ( = ?auto_493019 ?auto_493024 ) ) ( not ( = ?auto_493019 ?auto_493025 ) ) ( not ( = ?auto_493019 ?auto_493026 ) ) ( not ( = ?auto_493019 ?auto_493027 ) ) ( not ( = ?auto_493019 ?auto_493028 ) ) ( not ( = ?auto_493019 ?auto_493029 ) ) ( not ( = ?auto_493019 ?auto_493030 ) ) ( not ( = ?auto_493020 ?auto_493021 ) ) ( not ( = ?auto_493020 ?auto_493022 ) ) ( not ( = ?auto_493020 ?auto_493023 ) ) ( not ( = ?auto_493020 ?auto_493024 ) ) ( not ( = ?auto_493020 ?auto_493025 ) ) ( not ( = ?auto_493020 ?auto_493026 ) ) ( not ( = ?auto_493020 ?auto_493027 ) ) ( not ( = ?auto_493020 ?auto_493028 ) ) ( not ( = ?auto_493020 ?auto_493029 ) ) ( not ( = ?auto_493020 ?auto_493030 ) ) ( not ( = ?auto_493021 ?auto_493022 ) ) ( not ( = ?auto_493021 ?auto_493023 ) ) ( not ( = ?auto_493021 ?auto_493024 ) ) ( not ( = ?auto_493021 ?auto_493025 ) ) ( not ( = ?auto_493021 ?auto_493026 ) ) ( not ( = ?auto_493021 ?auto_493027 ) ) ( not ( = ?auto_493021 ?auto_493028 ) ) ( not ( = ?auto_493021 ?auto_493029 ) ) ( not ( = ?auto_493021 ?auto_493030 ) ) ( not ( = ?auto_493022 ?auto_493023 ) ) ( not ( = ?auto_493022 ?auto_493024 ) ) ( not ( = ?auto_493022 ?auto_493025 ) ) ( not ( = ?auto_493022 ?auto_493026 ) ) ( not ( = ?auto_493022 ?auto_493027 ) ) ( not ( = ?auto_493022 ?auto_493028 ) ) ( not ( = ?auto_493022 ?auto_493029 ) ) ( not ( = ?auto_493022 ?auto_493030 ) ) ( not ( = ?auto_493023 ?auto_493024 ) ) ( not ( = ?auto_493023 ?auto_493025 ) ) ( not ( = ?auto_493023 ?auto_493026 ) ) ( not ( = ?auto_493023 ?auto_493027 ) ) ( not ( = ?auto_493023 ?auto_493028 ) ) ( not ( = ?auto_493023 ?auto_493029 ) ) ( not ( = ?auto_493023 ?auto_493030 ) ) ( not ( = ?auto_493024 ?auto_493025 ) ) ( not ( = ?auto_493024 ?auto_493026 ) ) ( not ( = ?auto_493024 ?auto_493027 ) ) ( not ( = ?auto_493024 ?auto_493028 ) ) ( not ( = ?auto_493024 ?auto_493029 ) ) ( not ( = ?auto_493024 ?auto_493030 ) ) ( not ( = ?auto_493025 ?auto_493026 ) ) ( not ( = ?auto_493025 ?auto_493027 ) ) ( not ( = ?auto_493025 ?auto_493028 ) ) ( not ( = ?auto_493025 ?auto_493029 ) ) ( not ( = ?auto_493025 ?auto_493030 ) ) ( not ( = ?auto_493026 ?auto_493027 ) ) ( not ( = ?auto_493026 ?auto_493028 ) ) ( not ( = ?auto_493026 ?auto_493029 ) ) ( not ( = ?auto_493026 ?auto_493030 ) ) ( not ( = ?auto_493027 ?auto_493028 ) ) ( not ( = ?auto_493027 ?auto_493029 ) ) ( not ( = ?auto_493027 ?auto_493030 ) ) ( not ( = ?auto_493028 ?auto_493029 ) ) ( not ( = ?auto_493028 ?auto_493030 ) ) ( not ( = ?auto_493029 ?auto_493030 ) ) ( ON ?auto_493028 ?auto_493029 ) ( ON ?auto_493027 ?auto_493028 ) ( ON ?auto_493026 ?auto_493027 ) ( CLEAR ?auto_493024 ) ( ON ?auto_493025 ?auto_493026 ) ( CLEAR ?auto_493025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_493017 ?auto_493018 ?auto_493019 ?auto_493020 ?auto_493021 ?auto_493022 ?auto_493023 ?auto_493024 ?auto_493025 )
      ( MAKE-13PILE ?auto_493017 ?auto_493018 ?auto_493019 ?auto_493020 ?auto_493021 ?auto_493022 ?auto_493023 ?auto_493024 ?auto_493025 ?auto_493026 ?auto_493027 ?auto_493028 ?auto_493029 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_493071 - BLOCK
      ?auto_493072 - BLOCK
      ?auto_493073 - BLOCK
      ?auto_493074 - BLOCK
      ?auto_493075 - BLOCK
      ?auto_493076 - BLOCK
      ?auto_493077 - BLOCK
      ?auto_493078 - BLOCK
      ?auto_493079 - BLOCK
      ?auto_493080 - BLOCK
      ?auto_493081 - BLOCK
      ?auto_493082 - BLOCK
      ?auto_493083 - BLOCK
    )
    :vars
    (
      ?auto_493084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493083 ?auto_493084 ) ( ON-TABLE ?auto_493071 ) ( ON ?auto_493072 ?auto_493071 ) ( ON ?auto_493073 ?auto_493072 ) ( ON ?auto_493074 ?auto_493073 ) ( ON ?auto_493075 ?auto_493074 ) ( ON ?auto_493076 ?auto_493075 ) ( ON ?auto_493077 ?auto_493076 ) ( not ( = ?auto_493071 ?auto_493072 ) ) ( not ( = ?auto_493071 ?auto_493073 ) ) ( not ( = ?auto_493071 ?auto_493074 ) ) ( not ( = ?auto_493071 ?auto_493075 ) ) ( not ( = ?auto_493071 ?auto_493076 ) ) ( not ( = ?auto_493071 ?auto_493077 ) ) ( not ( = ?auto_493071 ?auto_493078 ) ) ( not ( = ?auto_493071 ?auto_493079 ) ) ( not ( = ?auto_493071 ?auto_493080 ) ) ( not ( = ?auto_493071 ?auto_493081 ) ) ( not ( = ?auto_493071 ?auto_493082 ) ) ( not ( = ?auto_493071 ?auto_493083 ) ) ( not ( = ?auto_493071 ?auto_493084 ) ) ( not ( = ?auto_493072 ?auto_493073 ) ) ( not ( = ?auto_493072 ?auto_493074 ) ) ( not ( = ?auto_493072 ?auto_493075 ) ) ( not ( = ?auto_493072 ?auto_493076 ) ) ( not ( = ?auto_493072 ?auto_493077 ) ) ( not ( = ?auto_493072 ?auto_493078 ) ) ( not ( = ?auto_493072 ?auto_493079 ) ) ( not ( = ?auto_493072 ?auto_493080 ) ) ( not ( = ?auto_493072 ?auto_493081 ) ) ( not ( = ?auto_493072 ?auto_493082 ) ) ( not ( = ?auto_493072 ?auto_493083 ) ) ( not ( = ?auto_493072 ?auto_493084 ) ) ( not ( = ?auto_493073 ?auto_493074 ) ) ( not ( = ?auto_493073 ?auto_493075 ) ) ( not ( = ?auto_493073 ?auto_493076 ) ) ( not ( = ?auto_493073 ?auto_493077 ) ) ( not ( = ?auto_493073 ?auto_493078 ) ) ( not ( = ?auto_493073 ?auto_493079 ) ) ( not ( = ?auto_493073 ?auto_493080 ) ) ( not ( = ?auto_493073 ?auto_493081 ) ) ( not ( = ?auto_493073 ?auto_493082 ) ) ( not ( = ?auto_493073 ?auto_493083 ) ) ( not ( = ?auto_493073 ?auto_493084 ) ) ( not ( = ?auto_493074 ?auto_493075 ) ) ( not ( = ?auto_493074 ?auto_493076 ) ) ( not ( = ?auto_493074 ?auto_493077 ) ) ( not ( = ?auto_493074 ?auto_493078 ) ) ( not ( = ?auto_493074 ?auto_493079 ) ) ( not ( = ?auto_493074 ?auto_493080 ) ) ( not ( = ?auto_493074 ?auto_493081 ) ) ( not ( = ?auto_493074 ?auto_493082 ) ) ( not ( = ?auto_493074 ?auto_493083 ) ) ( not ( = ?auto_493074 ?auto_493084 ) ) ( not ( = ?auto_493075 ?auto_493076 ) ) ( not ( = ?auto_493075 ?auto_493077 ) ) ( not ( = ?auto_493075 ?auto_493078 ) ) ( not ( = ?auto_493075 ?auto_493079 ) ) ( not ( = ?auto_493075 ?auto_493080 ) ) ( not ( = ?auto_493075 ?auto_493081 ) ) ( not ( = ?auto_493075 ?auto_493082 ) ) ( not ( = ?auto_493075 ?auto_493083 ) ) ( not ( = ?auto_493075 ?auto_493084 ) ) ( not ( = ?auto_493076 ?auto_493077 ) ) ( not ( = ?auto_493076 ?auto_493078 ) ) ( not ( = ?auto_493076 ?auto_493079 ) ) ( not ( = ?auto_493076 ?auto_493080 ) ) ( not ( = ?auto_493076 ?auto_493081 ) ) ( not ( = ?auto_493076 ?auto_493082 ) ) ( not ( = ?auto_493076 ?auto_493083 ) ) ( not ( = ?auto_493076 ?auto_493084 ) ) ( not ( = ?auto_493077 ?auto_493078 ) ) ( not ( = ?auto_493077 ?auto_493079 ) ) ( not ( = ?auto_493077 ?auto_493080 ) ) ( not ( = ?auto_493077 ?auto_493081 ) ) ( not ( = ?auto_493077 ?auto_493082 ) ) ( not ( = ?auto_493077 ?auto_493083 ) ) ( not ( = ?auto_493077 ?auto_493084 ) ) ( not ( = ?auto_493078 ?auto_493079 ) ) ( not ( = ?auto_493078 ?auto_493080 ) ) ( not ( = ?auto_493078 ?auto_493081 ) ) ( not ( = ?auto_493078 ?auto_493082 ) ) ( not ( = ?auto_493078 ?auto_493083 ) ) ( not ( = ?auto_493078 ?auto_493084 ) ) ( not ( = ?auto_493079 ?auto_493080 ) ) ( not ( = ?auto_493079 ?auto_493081 ) ) ( not ( = ?auto_493079 ?auto_493082 ) ) ( not ( = ?auto_493079 ?auto_493083 ) ) ( not ( = ?auto_493079 ?auto_493084 ) ) ( not ( = ?auto_493080 ?auto_493081 ) ) ( not ( = ?auto_493080 ?auto_493082 ) ) ( not ( = ?auto_493080 ?auto_493083 ) ) ( not ( = ?auto_493080 ?auto_493084 ) ) ( not ( = ?auto_493081 ?auto_493082 ) ) ( not ( = ?auto_493081 ?auto_493083 ) ) ( not ( = ?auto_493081 ?auto_493084 ) ) ( not ( = ?auto_493082 ?auto_493083 ) ) ( not ( = ?auto_493082 ?auto_493084 ) ) ( not ( = ?auto_493083 ?auto_493084 ) ) ( ON ?auto_493082 ?auto_493083 ) ( ON ?auto_493081 ?auto_493082 ) ( ON ?auto_493080 ?auto_493081 ) ( ON ?auto_493079 ?auto_493080 ) ( CLEAR ?auto_493077 ) ( ON ?auto_493078 ?auto_493079 ) ( CLEAR ?auto_493078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_493071 ?auto_493072 ?auto_493073 ?auto_493074 ?auto_493075 ?auto_493076 ?auto_493077 ?auto_493078 )
      ( MAKE-13PILE ?auto_493071 ?auto_493072 ?auto_493073 ?auto_493074 ?auto_493075 ?auto_493076 ?auto_493077 ?auto_493078 ?auto_493079 ?auto_493080 ?auto_493081 ?auto_493082 ?auto_493083 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_493125 - BLOCK
      ?auto_493126 - BLOCK
      ?auto_493127 - BLOCK
      ?auto_493128 - BLOCK
      ?auto_493129 - BLOCK
      ?auto_493130 - BLOCK
      ?auto_493131 - BLOCK
      ?auto_493132 - BLOCK
      ?auto_493133 - BLOCK
      ?auto_493134 - BLOCK
      ?auto_493135 - BLOCK
      ?auto_493136 - BLOCK
      ?auto_493137 - BLOCK
    )
    :vars
    (
      ?auto_493138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493137 ?auto_493138 ) ( ON-TABLE ?auto_493125 ) ( ON ?auto_493126 ?auto_493125 ) ( ON ?auto_493127 ?auto_493126 ) ( ON ?auto_493128 ?auto_493127 ) ( ON ?auto_493129 ?auto_493128 ) ( ON ?auto_493130 ?auto_493129 ) ( not ( = ?auto_493125 ?auto_493126 ) ) ( not ( = ?auto_493125 ?auto_493127 ) ) ( not ( = ?auto_493125 ?auto_493128 ) ) ( not ( = ?auto_493125 ?auto_493129 ) ) ( not ( = ?auto_493125 ?auto_493130 ) ) ( not ( = ?auto_493125 ?auto_493131 ) ) ( not ( = ?auto_493125 ?auto_493132 ) ) ( not ( = ?auto_493125 ?auto_493133 ) ) ( not ( = ?auto_493125 ?auto_493134 ) ) ( not ( = ?auto_493125 ?auto_493135 ) ) ( not ( = ?auto_493125 ?auto_493136 ) ) ( not ( = ?auto_493125 ?auto_493137 ) ) ( not ( = ?auto_493125 ?auto_493138 ) ) ( not ( = ?auto_493126 ?auto_493127 ) ) ( not ( = ?auto_493126 ?auto_493128 ) ) ( not ( = ?auto_493126 ?auto_493129 ) ) ( not ( = ?auto_493126 ?auto_493130 ) ) ( not ( = ?auto_493126 ?auto_493131 ) ) ( not ( = ?auto_493126 ?auto_493132 ) ) ( not ( = ?auto_493126 ?auto_493133 ) ) ( not ( = ?auto_493126 ?auto_493134 ) ) ( not ( = ?auto_493126 ?auto_493135 ) ) ( not ( = ?auto_493126 ?auto_493136 ) ) ( not ( = ?auto_493126 ?auto_493137 ) ) ( not ( = ?auto_493126 ?auto_493138 ) ) ( not ( = ?auto_493127 ?auto_493128 ) ) ( not ( = ?auto_493127 ?auto_493129 ) ) ( not ( = ?auto_493127 ?auto_493130 ) ) ( not ( = ?auto_493127 ?auto_493131 ) ) ( not ( = ?auto_493127 ?auto_493132 ) ) ( not ( = ?auto_493127 ?auto_493133 ) ) ( not ( = ?auto_493127 ?auto_493134 ) ) ( not ( = ?auto_493127 ?auto_493135 ) ) ( not ( = ?auto_493127 ?auto_493136 ) ) ( not ( = ?auto_493127 ?auto_493137 ) ) ( not ( = ?auto_493127 ?auto_493138 ) ) ( not ( = ?auto_493128 ?auto_493129 ) ) ( not ( = ?auto_493128 ?auto_493130 ) ) ( not ( = ?auto_493128 ?auto_493131 ) ) ( not ( = ?auto_493128 ?auto_493132 ) ) ( not ( = ?auto_493128 ?auto_493133 ) ) ( not ( = ?auto_493128 ?auto_493134 ) ) ( not ( = ?auto_493128 ?auto_493135 ) ) ( not ( = ?auto_493128 ?auto_493136 ) ) ( not ( = ?auto_493128 ?auto_493137 ) ) ( not ( = ?auto_493128 ?auto_493138 ) ) ( not ( = ?auto_493129 ?auto_493130 ) ) ( not ( = ?auto_493129 ?auto_493131 ) ) ( not ( = ?auto_493129 ?auto_493132 ) ) ( not ( = ?auto_493129 ?auto_493133 ) ) ( not ( = ?auto_493129 ?auto_493134 ) ) ( not ( = ?auto_493129 ?auto_493135 ) ) ( not ( = ?auto_493129 ?auto_493136 ) ) ( not ( = ?auto_493129 ?auto_493137 ) ) ( not ( = ?auto_493129 ?auto_493138 ) ) ( not ( = ?auto_493130 ?auto_493131 ) ) ( not ( = ?auto_493130 ?auto_493132 ) ) ( not ( = ?auto_493130 ?auto_493133 ) ) ( not ( = ?auto_493130 ?auto_493134 ) ) ( not ( = ?auto_493130 ?auto_493135 ) ) ( not ( = ?auto_493130 ?auto_493136 ) ) ( not ( = ?auto_493130 ?auto_493137 ) ) ( not ( = ?auto_493130 ?auto_493138 ) ) ( not ( = ?auto_493131 ?auto_493132 ) ) ( not ( = ?auto_493131 ?auto_493133 ) ) ( not ( = ?auto_493131 ?auto_493134 ) ) ( not ( = ?auto_493131 ?auto_493135 ) ) ( not ( = ?auto_493131 ?auto_493136 ) ) ( not ( = ?auto_493131 ?auto_493137 ) ) ( not ( = ?auto_493131 ?auto_493138 ) ) ( not ( = ?auto_493132 ?auto_493133 ) ) ( not ( = ?auto_493132 ?auto_493134 ) ) ( not ( = ?auto_493132 ?auto_493135 ) ) ( not ( = ?auto_493132 ?auto_493136 ) ) ( not ( = ?auto_493132 ?auto_493137 ) ) ( not ( = ?auto_493132 ?auto_493138 ) ) ( not ( = ?auto_493133 ?auto_493134 ) ) ( not ( = ?auto_493133 ?auto_493135 ) ) ( not ( = ?auto_493133 ?auto_493136 ) ) ( not ( = ?auto_493133 ?auto_493137 ) ) ( not ( = ?auto_493133 ?auto_493138 ) ) ( not ( = ?auto_493134 ?auto_493135 ) ) ( not ( = ?auto_493134 ?auto_493136 ) ) ( not ( = ?auto_493134 ?auto_493137 ) ) ( not ( = ?auto_493134 ?auto_493138 ) ) ( not ( = ?auto_493135 ?auto_493136 ) ) ( not ( = ?auto_493135 ?auto_493137 ) ) ( not ( = ?auto_493135 ?auto_493138 ) ) ( not ( = ?auto_493136 ?auto_493137 ) ) ( not ( = ?auto_493136 ?auto_493138 ) ) ( not ( = ?auto_493137 ?auto_493138 ) ) ( ON ?auto_493136 ?auto_493137 ) ( ON ?auto_493135 ?auto_493136 ) ( ON ?auto_493134 ?auto_493135 ) ( ON ?auto_493133 ?auto_493134 ) ( ON ?auto_493132 ?auto_493133 ) ( CLEAR ?auto_493130 ) ( ON ?auto_493131 ?auto_493132 ) ( CLEAR ?auto_493131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_493125 ?auto_493126 ?auto_493127 ?auto_493128 ?auto_493129 ?auto_493130 ?auto_493131 )
      ( MAKE-13PILE ?auto_493125 ?auto_493126 ?auto_493127 ?auto_493128 ?auto_493129 ?auto_493130 ?auto_493131 ?auto_493132 ?auto_493133 ?auto_493134 ?auto_493135 ?auto_493136 ?auto_493137 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_493179 - BLOCK
      ?auto_493180 - BLOCK
      ?auto_493181 - BLOCK
      ?auto_493182 - BLOCK
      ?auto_493183 - BLOCK
      ?auto_493184 - BLOCK
      ?auto_493185 - BLOCK
      ?auto_493186 - BLOCK
      ?auto_493187 - BLOCK
      ?auto_493188 - BLOCK
      ?auto_493189 - BLOCK
      ?auto_493190 - BLOCK
      ?auto_493191 - BLOCK
    )
    :vars
    (
      ?auto_493192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493191 ?auto_493192 ) ( ON-TABLE ?auto_493179 ) ( ON ?auto_493180 ?auto_493179 ) ( ON ?auto_493181 ?auto_493180 ) ( ON ?auto_493182 ?auto_493181 ) ( ON ?auto_493183 ?auto_493182 ) ( not ( = ?auto_493179 ?auto_493180 ) ) ( not ( = ?auto_493179 ?auto_493181 ) ) ( not ( = ?auto_493179 ?auto_493182 ) ) ( not ( = ?auto_493179 ?auto_493183 ) ) ( not ( = ?auto_493179 ?auto_493184 ) ) ( not ( = ?auto_493179 ?auto_493185 ) ) ( not ( = ?auto_493179 ?auto_493186 ) ) ( not ( = ?auto_493179 ?auto_493187 ) ) ( not ( = ?auto_493179 ?auto_493188 ) ) ( not ( = ?auto_493179 ?auto_493189 ) ) ( not ( = ?auto_493179 ?auto_493190 ) ) ( not ( = ?auto_493179 ?auto_493191 ) ) ( not ( = ?auto_493179 ?auto_493192 ) ) ( not ( = ?auto_493180 ?auto_493181 ) ) ( not ( = ?auto_493180 ?auto_493182 ) ) ( not ( = ?auto_493180 ?auto_493183 ) ) ( not ( = ?auto_493180 ?auto_493184 ) ) ( not ( = ?auto_493180 ?auto_493185 ) ) ( not ( = ?auto_493180 ?auto_493186 ) ) ( not ( = ?auto_493180 ?auto_493187 ) ) ( not ( = ?auto_493180 ?auto_493188 ) ) ( not ( = ?auto_493180 ?auto_493189 ) ) ( not ( = ?auto_493180 ?auto_493190 ) ) ( not ( = ?auto_493180 ?auto_493191 ) ) ( not ( = ?auto_493180 ?auto_493192 ) ) ( not ( = ?auto_493181 ?auto_493182 ) ) ( not ( = ?auto_493181 ?auto_493183 ) ) ( not ( = ?auto_493181 ?auto_493184 ) ) ( not ( = ?auto_493181 ?auto_493185 ) ) ( not ( = ?auto_493181 ?auto_493186 ) ) ( not ( = ?auto_493181 ?auto_493187 ) ) ( not ( = ?auto_493181 ?auto_493188 ) ) ( not ( = ?auto_493181 ?auto_493189 ) ) ( not ( = ?auto_493181 ?auto_493190 ) ) ( not ( = ?auto_493181 ?auto_493191 ) ) ( not ( = ?auto_493181 ?auto_493192 ) ) ( not ( = ?auto_493182 ?auto_493183 ) ) ( not ( = ?auto_493182 ?auto_493184 ) ) ( not ( = ?auto_493182 ?auto_493185 ) ) ( not ( = ?auto_493182 ?auto_493186 ) ) ( not ( = ?auto_493182 ?auto_493187 ) ) ( not ( = ?auto_493182 ?auto_493188 ) ) ( not ( = ?auto_493182 ?auto_493189 ) ) ( not ( = ?auto_493182 ?auto_493190 ) ) ( not ( = ?auto_493182 ?auto_493191 ) ) ( not ( = ?auto_493182 ?auto_493192 ) ) ( not ( = ?auto_493183 ?auto_493184 ) ) ( not ( = ?auto_493183 ?auto_493185 ) ) ( not ( = ?auto_493183 ?auto_493186 ) ) ( not ( = ?auto_493183 ?auto_493187 ) ) ( not ( = ?auto_493183 ?auto_493188 ) ) ( not ( = ?auto_493183 ?auto_493189 ) ) ( not ( = ?auto_493183 ?auto_493190 ) ) ( not ( = ?auto_493183 ?auto_493191 ) ) ( not ( = ?auto_493183 ?auto_493192 ) ) ( not ( = ?auto_493184 ?auto_493185 ) ) ( not ( = ?auto_493184 ?auto_493186 ) ) ( not ( = ?auto_493184 ?auto_493187 ) ) ( not ( = ?auto_493184 ?auto_493188 ) ) ( not ( = ?auto_493184 ?auto_493189 ) ) ( not ( = ?auto_493184 ?auto_493190 ) ) ( not ( = ?auto_493184 ?auto_493191 ) ) ( not ( = ?auto_493184 ?auto_493192 ) ) ( not ( = ?auto_493185 ?auto_493186 ) ) ( not ( = ?auto_493185 ?auto_493187 ) ) ( not ( = ?auto_493185 ?auto_493188 ) ) ( not ( = ?auto_493185 ?auto_493189 ) ) ( not ( = ?auto_493185 ?auto_493190 ) ) ( not ( = ?auto_493185 ?auto_493191 ) ) ( not ( = ?auto_493185 ?auto_493192 ) ) ( not ( = ?auto_493186 ?auto_493187 ) ) ( not ( = ?auto_493186 ?auto_493188 ) ) ( not ( = ?auto_493186 ?auto_493189 ) ) ( not ( = ?auto_493186 ?auto_493190 ) ) ( not ( = ?auto_493186 ?auto_493191 ) ) ( not ( = ?auto_493186 ?auto_493192 ) ) ( not ( = ?auto_493187 ?auto_493188 ) ) ( not ( = ?auto_493187 ?auto_493189 ) ) ( not ( = ?auto_493187 ?auto_493190 ) ) ( not ( = ?auto_493187 ?auto_493191 ) ) ( not ( = ?auto_493187 ?auto_493192 ) ) ( not ( = ?auto_493188 ?auto_493189 ) ) ( not ( = ?auto_493188 ?auto_493190 ) ) ( not ( = ?auto_493188 ?auto_493191 ) ) ( not ( = ?auto_493188 ?auto_493192 ) ) ( not ( = ?auto_493189 ?auto_493190 ) ) ( not ( = ?auto_493189 ?auto_493191 ) ) ( not ( = ?auto_493189 ?auto_493192 ) ) ( not ( = ?auto_493190 ?auto_493191 ) ) ( not ( = ?auto_493190 ?auto_493192 ) ) ( not ( = ?auto_493191 ?auto_493192 ) ) ( ON ?auto_493190 ?auto_493191 ) ( ON ?auto_493189 ?auto_493190 ) ( ON ?auto_493188 ?auto_493189 ) ( ON ?auto_493187 ?auto_493188 ) ( ON ?auto_493186 ?auto_493187 ) ( ON ?auto_493185 ?auto_493186 ) ( CLEAR ?auto_493183 ) ( ON ?auto_493184 ?auto_493185 ) ( CLEAR ?auto_493184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_493179 ?auto_493180 ?auto_493181 ?auto_493182 ?auto_493183 ?auto_493184 )
      ( MAKE-13PILE ?auto_493179 ?auto_493180 ?auto_493181 ?auto_493182 ?auto_493183 ?auto_493184 ?auto_493185 ?auto_493186 ?auto_493187 ?auto_493188 ?auto_493189 ?auto_493190 ?auto_493191 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_493233 - BLOCK
      ?auto_493234 - BLOCK
      ?auto_493235 - BLOCK
      ?auto_493236 - BLOCK
      ?auto_493237 - BLOCK
      ?auto_493238 - BLOCK
      ?auto_493239 - BLOCK
      ?auto_493240 - BLOCK
      ?auto_493241 - BLOCK
      ?auto_493242 - BLOCK
      ?auto_493243 - BLOCK
      ?auto_493244 - BLOCK
      ?auto_493245 - BLOCK
    )
    :vars
    (
      ?auto_493246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493245 ?auto_493246 ) ( ON-TABLE ?auto_493233 ) ( ON ?auto_493234 ?auto_493233 ) ( ON ?auto_493235 ?auto_493234 ) ( ON ?auto_493236 ?auto_493235 ) ( not ( = ?auto_493233 ?auto_493234 ) ) ( not ( = ?auto_493233 ?auto_493235 ) ) ( not ( = ?auto_493233 ?auto_493236 ) ) ( not ( = ?auto_493233 ?auto_493237 ) ) ( not ( = ?auto_493233 ?auto_493238 ) ) ( not ( = ?auto_493233 ?auto_493239 ) ) ( not ( = ?auto_493233 ?auto_493240 ) ) ( not ( = ?auto_493233 ?auto_493241 ) ) ( not ( = ?auto_493233 ?auto_493242 ) ) ( not ( = ?auto_493233 ?auto_493243 ) ) ( not ( = ?auto_493233 ?auto_493244 ) ) ( not ( = ?auto_493233 ?auto_493245 ) ) ( not ( = ?auto_493233 ?auto_493246 ) ) ( not ( = ?auto_493234 ?auto_493235 ) ) ( not ( = ?auto_493234 ?auto_493236 ) ) ( not ( = ?auto_493234 ?auto_493237 ) ) ( not ( = ?auto_493234 ?auto_493238 ) ) ( not ( = ?auto_493234 ?auto_493239 ) ) ( not ( = ?auto_493234 ?auto_493240 ) ) ( not ( = ?auto_493234 ?auto_493241 ) ) ( not ( = ?auto_493234 ?auto_493242 ) ) ( not ( = ?auto_493234 ?auto_493243 ) ) ( not ( = ?auto_493234 ?auto_493244 ) ) ( not ( = ?auto_493234 ?auto_493245 ) ) ( not ( = ?auto_493234 ?auto_493246 ) ) ( not ( = ?auto_493235 ?auto_493236 ) ) ( not ( = ?auto_493235 ?auto_493237 ) ) ( not ( = ?auto_493235 ?auto_493238 ) ) ( not ( = ?auto_493235 ?auto_493239 ) ) ( not ( = ?auto_493235 ?auto_493240 ) ) ( not ( = ?auto_493235 ?auto_493241 ) ) ( not ( = ?auto_493235 ?auto_493242 ) ) ( not ( = ?auto_493235 ?auto_493243 ) ) ( not ( = ?auto_493235 ?auto_493244 ) ) ( not ( = ?auto_493235 ?auto_493245 ) ) ( not ( = ?auto_493235 ?auto_493246 ) ) ( not ( = ?auto_493236 ?auto_493237 ) ) ( not ( = ?auto_493236 ?auto_493238 ) ) ( not ( = ?auto_493236 ?auto_493239 ) ) ( not ( = ?auto_493236 ?auto_493240 ) ) ( not ( = ?auto_493236 ?auto_493241 ) ) ( not ( = ?auto_493236 ?auto_493242 ) ) ( not ( = ?auto_493236 ?auto_493243 ) ) ( not ( = ?auto_493236 ?auto_493244 ) ) ( not ( = ?auto_493236 ?auto_493245 ) ) ( not ( = ?auto_493236 ?auto_493246 ) ) ( not ( = ?auto_493237 ?auto_493238 ) ) ( not ( = ?auto_493237 ?auto_493239 ) ) ( not ( = ?auto_493237 ?auto_493240 ) ) ( not ( = ?auto_493237 ?auto_493241 ) ) ( not ( = ?auto_493237 ?auto_493242 ) ) ( not ( = ?auto_493237 ?auto_493243 ) ) ( not ( = ?auto_493237 ?auto_493244 ) ) ( not ( = ?auto_493237 ?auto_493245 ) ) ( not ( = ?auto_493237 ?auto_493246 ) ) ( not ( = ?auto_493238 ?auto_493239 ) ) ( not ( = ?auto_493238 ?auto_493240 ) ) ( not ( = ?auto_493238 ?auto_493241 ) ) ( not ( = ?auto_493238 ?auto_493242 ) ) ( not ( = ?auto_493238 ?auto_493243 ) ) ( not ( = ?auto_493238 ?auto_493244 ) ) ( not ( = ?auto_493238 ?auto_493245 ) ) ( not ( = ?auto_493238 ?auto_493246 ) ) ( not ( = ?auto_493239 ?auto_493240 ) ) ( not ( = ?auto_493239 ?auto_493241 ) ) ( not ( = ?auto_493239 ?auto_493242 ) ) ( not ( = ?auto_493239 ?auto_493243 ) ) ( not ( = ?auto_493239 ?auto_493244 ) ) ( not ( = ?auto_493239 ?auto_493245 ) ) ( not ( = ?auto_493239 ?auto_493246 ) ) ( not ( = ?auto_493240 ?auto_493241 ) ) ( not ( = ?auto_493240 ?auto_493242 ) ) ( not ( = ?auto_493240 ?auto_493243 ) ) ( not ( = ?auto_493240 ?auto_493244 ) ) ( not ( = ?auto_493240 ?auto_493245 ) ) ( not ( = ?auto_493240 ?auto_493246 ) ) ( not ( = ?auto_493241 ?auto_493242 ) ) ( not ( = ?auto_493241 ?auto_493243 ) ) ( not ( = ?auto_493241 ?auto_493244 ) ) ( not ( = ?auto_493241 ?auto_493245 ) ) ( not ( = ?auto_493241 ?auto_493246 ) ) ( not ( = ?auto_493242 ?auto_493243 ) ) ( not ( = ?auto_493242 ?auto_493244 ) ) ( not ( = ?auto_493242 ?auto_493245 ) ) ( not ( = ?auto_493242 ?auto_493246 ) ) ( not ( = ?auto_493243 ?auto_493244 ) ) ( not ( = ?auto_493243 ?auto_493245 ) ) ( not ( = ?auto_493243 ?auto_493246 ) ) ( not ( = ?auto_493244 ?auto_493245 ) ) ( not ( = ?auto_493244 ?auto_493246 ) ) ( not ( = ?auto_493245 ?auto_493246 ) ) ( ON ?auto_493244 ?auto_493245 ) ( ON ?auto_493243 ?auto_493244 ) ( ON ?auto_493242 ?auto_493243 ) ( ON ?auto_493241 ?auto_493242 ) ( ON ?auto_493240 ?auto_493241 ) ( ON ?auto_493239 ?auto_493240 ) ( ON ?auto_493238 ?auto_493239 ) ( CLEAR ?auto_493236 ) ( ON ?auto_493237 ?auto_493238 ) ( CLEAR ?auto_493237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_493233 ?auto_493234 ?auto_493235 ?auto_493236 ?auto_493237 )
      ( MAKE-13PILE ?auto_493233 ?auto_493234 ?auto_493235 ?auto_493236 ?auto_493237 ?auto_493238 ?auto_493239 ?auto_493240 ?auto_493241 ?auto_493242 ?auto_493243 ?auto_493244 ?auto_493245 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_493287 - BLOCK
      ?auto_493288 - BLOCK
      ?auto_493289 - BLOCK
      ?auto_493290 - BLOCK
      ?auto_493291 - BLOCK
      ?auto_493292 - BLOCK
      ?auto_493293 - BLOCK
      ?auto_493294 - BLOCK
      ?auto_493295 - BLOCK
      ?auto_493296 - BLOCK
      ?auto_493297 - BLOCK
      ?auto_493298 - BLOCK
      ?auto_493299 - BLOCK
    )
    :vars
    (
      ?auto_493300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493299 ?auto_493300 ) ( ON-TABLE ?auto_493287 ) ( ON ?auto_493288 ?auto_493287 ) ( ON ?auto_493289 ?auto_493288 ) ( not ( = ?auto_493287 ?auto_493288 ) ) ( not ( = ?auto_493287 ?auto_493289 ) ) ( not ( = ?auto_493287 ?auto_493290 ) ) ( not ( = ?auto_493287 ?auto_493291 ) ) ( not ( = ?auto_493287 ?auto_493292 ) ) ( not ( = ?auto_493287 ?auto_493293 ) ) ( not ( = ?auto_493287 ?auto_493294 ) ) ( not ( = ?auto_493287 ?auto_493295 ) ) ( not ( = ?auto_493287 ?auto_493296 ) ) ( not ( = ?auto_493287 ?auto_493297 ) ) ( not ( = ?auto_493287 ?auto_493298 ) ) ( not ( = ?auto_493287 ?auto_493299 ) ) ( not ( = ?auto_493287 ?auto_493300 ) ) ( not ( = ?auto_493288 ?auto_493289 ) ) ( not ( = ?auto_493288 ?auto_493290 ) ) ( not ( = ?auto_493288 ?auto_493291 ) ) ( not ( = ?auto_493288 ?auto_493292 ) ) ( not ( = ?auto_493288 ?auto_493293 ) ) ( not ( = ?auto_493288 ?auto_493294 ) ) ( not ( = ?auto_493288 ?auto_493295 ) ) ( not ( = ?auto_493288 ?auto_493296 ) ) ( not ( = ?auto_493288 ?auto_493297 ) ) ( not ( = ?auto_493288 ?auto_493298 ) ) ( not ( = ?auto_493288 ?auto_493299 ) ) ( not ( = ?auto_493288 ?auto_493300 ) ) ( not ( = ?auto_493289 ?auto_493290 ) ) ( not ( = ?auto_493289 ?auto_493291 ) ) ( not ( = ?auto_493289 ?auto_493292 ) ) ( not ( = ?auto_493289 ?auto_493293 ) ) ( not ( = ?auto_493289 ?auto_493294 ) ) ( not ( = ?auto_493289 ?auto_493295 ) ) ( not ( = ?auto_493289 ?auto_493296 ) ) ( not ( = ?auto_493289 ?auto_493297 ) ) ( not ( = ?auto_493289 ?auto_493298 ) ) ( not ( = ?auto_493289 ?auto_493299 ) ) ( not ( = ?auto_493289 ?auto_493300 ) ) ( not ( = ?auto_493290 ?auto_493291 ) ) ( not ( = ?auto_493290 ?auto_493292 ) ) ( not ( = ?auto_493290 ?auto_493293 ) ) ( not ( = ?auto_493290 ?auto_493294 ) ) ( not ( = ?auto_493290 ?auto_493295 ) ) ( not ( = ?auto_493290 ?auto_493296 ) ) ( not ( = ?auto_493290 ?auto_493297 ) ) ( not ( = ?auto_493290 ?auto_493298 ) ) ( not ( = ?auto_493290 ?auto_493299 ) ) ( not ( = ?auto_493290 ?auto_493300 ) ) ( not ( = ?auto_493291 ?auto_493292 ) ) ( not ( = ?auto_493291 ?auto_493293 ) ) ( not ( = ?auto_493291 ?auto_493294 ) ) ( not ( = ?auto_493291 ?auto_493295 ) ) ( not ( = ?auto_493291 ?auto_493296 ) ) ( not ( = ?auto_493291 ?auto_493297 ) ) ( not ( = ?auto_493291 ?auto_493298 ) ) ( not ( = ?auto_493291 ?auto_493299 ) ) ( not ( = ?auto_493291 ?auto_493300 ) ) ( not ( = ?auto_493292 ?auto_493293 ) ) ( not ( = ?auto_493292 ?auto_493294 ) ) ( not ( = ?auto_493292 ?auto_493295 ) ) ( not ( = ?auto_493292 ?auto_493296 ) ) ( not ( = ?auto_493292 ?auto_493297 ) ) ( not ( = ?auto_493292 ?auto_493298 ) ) ( not ( = ?auto_493292 ?auto_493299 ) ) ( not ( = ?auto_493292 ?auto_493300 ) ) ( not ( = ?auto_493293 ?auto_493294 ) ) ( not ( = ?auto_493293 ?auto_493295 ) ) ( not ( = ?auto_493293 ?auto_493296 ) ) ( not ( = ?auto_493293 ?auto_493297 ) ) ( not ( = ?auto_493293 ?auto_493298 ) ) ( not ( = ?auto_493293 ?auto_493299 ) ) ( not ( = ?auto_493293 ?auto_493300 ) ) ( not ( = ?auto_493294 ?auto_493295 ) ) ( not ( = ?auto_493294 ?auto_493296 ) ) ( not ( = ?auto_493294 ?auto_493297 ) ) ( not ( = ?auto_493294 ?auto_493298 ) ) ( not ( = ?auto_493294 ?auto_493299 ) ) ( not ( = ?auto_493294 ?auto_493300 ) ) ( not ( = ?auto_493295 ?auto_493296 ) ) ( not ( = ?auto_493295 ?auto_493297 ) ) ( not ( = ?auto_493295 ?auto_493298 ) ) ( not ( = ?auto_493295 ?auto_493299 ) ) ( not ( = ?auto_493295 ?auto_493300 ) ) ( not ( = ?auto_493296 ?auto_493297 ) ) ( not ( = ?auto_493296 ?auto_493298 ) ) ( not ( = ?auto_493296 ?auto_493299 ) ) ( not ( = ?auto_493296 ?auto_493300 ) ) ( not ( = ?auto_493297 ?auto_493298 ) ) ( not ( = ?auto_493297 ?auto_493299 ) ) ( not ( = ?auto_493297 ?auto_493300 ) ) ( not ( = ?auto_493298 ?auto_493299 ) ) ( not ( = ?auto_493298 ?auto_493300 ) ) ( not ( = ?auto_493299 ?auto_493300 ) ) ( ON ?auto_493298 ?auto_493299 ) ( ON ?auto_493297 ?auto_493298 ) ( ON ?auto_493296 ?auto_493297 ) ( ON ?auto_493295 ?auto_493296 ) ( ON ?auto_493294 ?auto_493295 ) ( ON ?auto_493293 ?auto_493294 ) ( ON ?auto_493292 ?auto_493293 ) ( ON ?auto_493291 ?auto_493292 ) ( CLEAR ?auto_493289 ) ( ON ?auto_493290 ?auto_493291 ) ( CLEAR ?auto_493290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_493287 ?auto_493288 ?auto_493289 ?auto_493290 )
      ( MAKE-13PILE ?auto_493287 ?auto_493288 ?auto_493289 ?auto_493290 ?auto_493291 ?auto_493292 ?auto_493293 ?auto_493294 ?auto_493295 ?auto_493296 ?auto_493297 ?auto_493298 ?auto_493299 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_493341 - BLOCK
      ?auto_493342 - BLOCK
      ?auto_493343 - BLOCK
      ?auto_493344 - BLOCK
      ?auto_493345 - BLOCK
      ?auto_493346 - BLOCK
      ?auto_493347 - BLOCK
      ?auto_493348 - BLOCK
      ?auto_493349 - BLOCK
      ?auto_493350 - BLOCK
      ?auto_493351 - BLOCK
      ?auto_493352 - BLOCK
      ?auto_493353 - BLOCK
    )
    :vars
    (
      ?auto_493354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493353 ?auto_493354 ) ( ON-TABLE ?auto_493341 ) ( ON ?auto_493342 ?auto_493341 ) ( not ( = ?auto_493341 ?auto_493342 ) ) ( not ( = ?auto_493341 ?auto_493343 ) ) ( not ( = ?auto_493341 ?auto_493344 ) ) ( not ( = ?auto_493341 ?auto_493345 ) ) ( not ( = ?auto_493341 ?auto_493346 ) ) ( not ( = ?auto_493341 ?auto_493347 ) ) ( not ( = ?auto_493341 ?auto_493348 ) ) ( not ( = ?auto_493341 ?auto_493349 ) ) ( not ( = ?auto_493341 ?auto_493350 ) ) ( not ( = ?auto_493341 ?auto_493351 ) ) ( not ( = ?auto_493341 ?auto_493352 ) ) ( not ( = ?auto_493341 ?auto_493353 ) ) ( not ( = ?auto_493341 ?auto_493354 ) ) ( not ( = ?auto_493342 ?auto_493343 ) ) ( not ( = ?auto_493342 ?auto_493344 ) ) ( not ( = ?auto_493342 ?auto_493345 ) ) ( not ( = ?auto_493342 ?auto_493346 ) ) ( not ( = ?auto_493342 ?auto_493347 ) ) ( not ( = ?auto_493342 ?auto_493348 ) ) ( not ( = ?auto_493342 ?auto_493349 ) ) ( not ( = ?auto_493342 ?auto_493350 ) ) ( not ( = ?auto_493342 ?auto_493351 ) ) ( not ( = ?auto_493342 ?auto_493352 ) ) ( not ( = ?auto_493342 ?auto_493353 ) ) ( not ( = ?auto_493342 ?auto_493354 ) ) ( not ( = ?auto_493343 ?auto_493344 ) ) ( not ( = ?auto_493343 ?auto_493345 ) ) ( not ( = ?auto_493343 ?auto_493346 ) ) ( not ( = ?auto_493343 ?auto_493347 ) ) ( not ( = ?auto_493343 ?auto_493348 ) ) ( not ( = ?auto_493343 ?auto_493349 ) ) ( not ( = ?auto_493343 ?auto_493350 ) ) ( not ( = ?auto_493343 ?auto_493351 ) ) ( not ( = ?auto_493343 ?auto_493352 ) ) ( not ( = ?auto_493343 ?auto_493353 ) ) ( not ( = ?auto_493343 ?auto_493354 ) ) ( not ( = ?auto_493344 ?auto_493345 ) ) ( not ( = ?auto_493344 ?auto_493346 ) ) ( not ( = ?auto_493344 ?auto_493347 ) ) ( not ( = ?auto_493344 ?auto_493348 ) ) ( not ( = ?auto_493344 ?auto_493349 ) ) ( not ( = ?auto_493344 ?auto_493350 ) ) ( not ( = ?auto_493344 ?auto_493351 ) ) ( not ( = ?auto_493344 ?auto_493352 ) ) ( not ( = ?auto_493344 ?auto_493353 ) ) ( not ( = ?auto_493344 ?auto_493354 ) ) ( not ( = ?auto_493345 ?auto_493346 ) ) ( not ( = ?auto_493345 ?auto_493347 ) ) ( not ( = ?auto_493345 ?auto_493348 ) ) ( not ( = ?auto_493345 ?auto_493349 ) ) ( not ( = ?auto_493345 ?auto_493350 ) ) ( not ( = ?auto_493345 ?auto_493351 ) ) ( not ( = ?auto_493345 ?auto_493352 ) ) ( not ( = ?auto_493345 ?auto_493353 ) ) ( not ( = ?auto_493345 ?auto_493354 ) ) ( not ( = ?auto_493346 ?auto_493347 ) ) ( not ( = ?auto_493346 ?auto_493348 ) ) ( not ( = ?auto_493346 ?auto_493349 ) ) ( not ( = ?auto_493346 ?auto_493350 ) ) ( not ( = ?auto_493346 ?auto_493351 ) ) ( not ( = ?auto_493346 ?auto_493352 ) ) ( not ( = ?auto_493346 ?auto_493353 ) ) ( not ( = ?auto_493346 ?auto_493354 ) ) ( not ( = ?auto_493347 ?auto_493348 ) ) ( not ( = ?auto_493347 ?auto_493349 ) ) ( not ( = ?auto_493347 ?auto_493350 ) ) ( not ( = ?auto_493347 ?auto_493351 ) ) ( not ( = ?auto_493347 ?auto_493352 ) ) ( not ( = ?auto_493347 ?auto_493353 ) ) ( not ( = ?auto_493347 ?auto_493354 ) ) ( not ( = ?auto_493348 ?auto_493349 ) ) ( not ( = ?auto_493348 ?auto_493350 ) ) ( not ( = ?auto_493348 ?auto_493351 ) ) ( not ( = ?auto_493348 ?auto_493352 ) ) ( not ( = ?auto_493348 ?auto_493353 ) ) ( not ( = ?auto_493348 ?auto_493354 ) ) ( not ( = ?auto_493349 ?auto_493350 ) ) ( not ( = ?auto_493349 ?auto_493351 ) ) ( not ( = ?auto_493349 ?auto_493352 ) ) ( not ( = ?auto_493349 ?auto_493353 ) ) ( not ( = ?auto_493349 ?auto_493354 ) ) ( not ( = ?auto_493350 ?auto_493351 ) ) ( not ( = ?auto_493350 ?auto_493352 ) ) ( not ( = ?auto_493350 ?auto_493353 ) ) ( not ( = ?auto_493350 ?auto_493354 ) ) ( not ( = ?auto_493351 ?auto_493352 ) ) ( not ( = ?auto_493351 ?auto_493353 ) ) ( not ( = ?auto_493351 ?auto_493354 ) ) ( not ( = ?auto_493352 ?auto_493353 ) ) ( not ( = ?auto_493352 ?auto_493354 ) ) ( not ( = ?auto_493353 ?auto_493354 ) ) ( ON ?auto_493352 ?auto_493353 ) ( ON ?auto_493351 ?auto_493352 ) ( ON ?auto_493350 ?auto_493351 ) ( ON ?auto_493349 ?auto_493350 ) ( ON ?auto_493348 ?auto_493349 ) ( ON ?auto_493347 ?auto_493348 ) ( ON ?auto_493346 ?auto_493347 ) ( ON ?auto_493345 ?auto_493346 ) ( ON ?auto_493344 ?auto_493345 ) ( CLEAR ?auto_493342 ) ( ON ?auto_493343 ?auto_493344 ) ( CLEAR ?auto_493343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_493341 ?auto_493342 ?auto_493343 )
      ( MAKE-13PILE ?auto_493341 ?auto_493342 ?auto_493343 ?auto_493344 ?auto_493345 ?auto_493346 ?auto_493347 ?auto_493348 ?auto_493349 ?auto_493350 ?auto_493351 ?auto_493352 ?auto_493353 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_493395 - BLOCK
      ?auto_493396 - BLOCK
      ?auto_493397 - BLOCK
      ?auto_493398 - BLOCK
      ?auto_493399 - BLOCK
      ?auto_493400 - BLOCK
      ?auto_493401 - BLOCK
      ?auto_493402 - BLOCK
      ?auto_493403 - BLOCK
      ?auto_493404 - BLOCK
      ?auto_493405 - BLOCK
      ?auto_493406 - BLOCK
      ?auto_493407 - BLOCK
    )
    :vars
    (
      ?auto_493408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493407 ?auto_493408 ) ( ON-TABLE ?auto_493395 ) ( not ( = ?auto_493395 ?auto_493396 ) ) ( not ( = ?auto_493395 ?auto_493397 ) ) ( not ( = ?auto_493395 ?auto_493398 ) ) ( not ( = ?auto_493395 ?auto_493399 ) ) ( not ( = ?auto_493395 ?auto_493400 ) ) ( not ( = ?auto_493395 ?auto_493401 ) ) ( not ( = ?auto_493395 ?auto_493402 ) ) ( not ( = ?auto_493395 ?auto_493403 ) ) ( not ( = ?auto_493395 ?auto_493404 ) ) ( not ( = ?auto_493395 ?auto_493405 ) ) ( not ( = ?auto_493395 ?auto_493406 ) ) ( not ( = ?auto_493395 ?auto_493407 ) ) ( not ( = ?auto_493395 ?auto_493408 ) ) ( not ( = ?auto_493396 ?auto_493397 ) ) ( not ( = ?auto_493396 ?auto_493398 ) ) ( not ( = ?auto_493396 ?auto_493399 ) ) ( not ( = ?auto_493396 ?auto_493400 ) ) ( not ( = ?auto_493396 ?auto_493401 ) ) ( not ( = ?auto_493396 ?auto_493402 ) ) ( not ( = ?auto_493396 ?auto_493403 ) ) ( not ( = ?auto_493396 ?auto_493404 ) ) ( not ( = ?auto_493396 ?auto_493405 ) ) ( not ( = ?auto_493396 ?auto_493406 ) ) ( not ( = ?auto_493396 ?auto_493407 ) ) ( not ( = ?auto_493396 ?auto_493408 ) ) ( not ( = ?auto_493397 ?auto_493398 ) ) ( not ( = ?auto_493397 ?auto_493399 ) ) ( not ( = ?auto_493397 ?auto_493400 ) ) ( not ( = ?auto_493397 ?auto_493401 ) ) ( not ( = ?auto_493397 ?auto_493402 ) ) ( not ( = ?auto_493397 ?auto_493403 ) ) ( not ( = ?auto_493397 ?auto_493404 ) ) ( not ( = ?auto_493397 ?auto_493405 ) ) ( not ( = ?auto_493397 ?auto_493406 ) ) ( not ( = ?auto_493397 ?auto_493407 ) ) ( not ( = ?auto_493397 ?auto_493408 ) ) ( not ( = ?auto_493398 ?auto_493399 ) ) ( not ( = ?auto_493398 ?auto_493400 ) ) ( not ( = ?auto_493398 ?auto_493401 ) ) ( not ( = ?auto_493398 ?auto_493402 ) ) ( not ( = ?auto_493398 ?auto_493403 ) ) ( not ( = ?auto_493398 ?auto_493404 ) ) ( not ( = ?auto_493398 ?auto_493405 ) ) ( not ( = ?auto_493398 ?auto_493406 ) ) ( not ( = ?auto_493398 ?auto_493407 ) ) ( not ( = ?auto_493398 ?auto_493408 ) ) ( not ( = ?auto_493399 ?auto_493400 ) ) ( not ( = ?auto_493399 ?auto_493401 ) ) ( not ( = ?auto_493399 ?auto_493402 ) ) ( not ( = ?auto_493399 ?auto_493403 ) ) ( not ( = ?auto_493399 ?auto_493404 ) ) ( not ( = ?auto_493399 ?auto_493405 ) ) ( not ( = ?auto_493399 ?auto_493406 ) ) ( not ( = ?auto_493399 ?auto_493407 ) ) ( not ( = ?auto_493399 ?auto_493408 ) ) ( not ( = ?auto_493400 ?auto_493401 ) ) ( not ( = ?auto_493400 ?auto_493402 ) ) ( not ( = ?auto_493400 ?auto_493403 ) ) ( not ( = ?auto_493400 ?auto_493404 ) ) ( not ( = ?auto_493400 ?auto_493405 ) ) ( not ( = ?auto_493400 ?auto_493406 ) ) ( not ( = ?auto_493400 ?auto_493407 ) ) ( not ( = ?auto_493400 ?auto_493408 ) ) ( not ( = ?auto_493401 ?auto_493402 ) ) ( not ( = ?auto_493401 ?auto_493403 ) ) ( not ( = ?auto_493401 ?auto_493404 ) ) ( not ( = ?auto_493401 ?auto_493405 ) ) ( not ( = ?auto_493401 ?auto_493406 ) ) ( not ( = ?auto_493401 ?auto_493407 ) ) ( not ( = ?auto_493401 ?auto_493408 ) ) ( not ( = ?auto_493402 ?auto_493403 ) ) ( not ( = ?auto_493402 ?auto_493404 ) ) ( not ( = ?auto_493402 ?auto_493405 ) ) ( not ( = ?auto_493402 ?auto_493406 ) ) ( not ( = ?auto_493402 ?auto_493407 ) ) ( not ( = ?auto_493402 ?auto_493408 ) ) ( not ( = ?auto_493403 ?auto_493404 ) ) ( not ( = ?auto_493403 ?auto_493405 ) ) ( not ( = ?auto_493403 ?auto_493406 ) ) ( not ( = ?auto_493403 ?auto_493407 ) ) ( not ( = ?auto_493403 ?auto_493408 ) ) ( not ( = ?auto_493404 ?auto_493405 ) ) ( not ( = ?auto_493404 ?auto_493406 ) ) ( not ( = ?auto_493404 ?auto_493407 ) ) ( not ( = ?auto_493404 ?auto_493408 ) ) ( not ( = ?auto_493405 ?auto_493406 ) ) ( not ( = ?auto_493405 ?auto_493407 ) ) ( not ( = ?auto_493405 ?auto_493408 ) ) ( not ( = ?auto_493406 ?auto_493407 ) ) ( not ( = ?auto_493406 ?auto_493408 ) ) ( not ( = ?auto_493407 ?auto_493408 ) ) ( ON ?auto_493406 ?auto_493407 ) ( ON ?auto_493405 ?auto_493406 ) ( ON ?auto_493404 ?auto_493405 ) ( ON ?auto_493403 ?auto_493404 ) ( ON ?auto_493402 ?auto_493403 ) ( ON ?auto_493401 ?auto_493402 ) ( ON ?auto_493400 ?auto_493401 ) ( ON ?auto_493399 ?auto_493400 ) ( ON ?auto_493398 ?auto_493399 ) ( ON ?auto_493397 ?auto_493398 ) ( CLEAR ?auto_493395 ) ( ON ?auto_493396 ?auto_493397 ) ( CLEAR ?auto_493396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_493395 ?auto_493396 )
      ( MAKE-13PILE ?auto_493395 ?auto_493396 ?auto_493397 ?auto_493398 ?auto_493399 ?auto_493400 ?auto_493401 ?auto_493402 ?auto_493403 ?auto_493404 ?auto_493405 ?auto_493406 ?auto_493407 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_493449 - BLOCK
      ?auto_493450 - BLOCK
      ?auto_493451 - BLOCK
      ?auto_493452 - BLOCK
      ?auto_493453 - BLOCK
      ?auto_493454 - BLOCK
      ?auto_493455 - BLOCK
      ?auto_493456 - BLOCK
      ?auto_493457 - BLOCK
      ?auto_493458 - BLOCK
      ?auto_493459 - BLOCK
      ?auto_493460 - BLOCK
      ?auto_493461 - BLOCK
    )
    :vars
    (
      ?auto_493462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493461 ?auto_493462 ) ( not ( = ?auto_493449 ?auto_493450 ) ) ( not ( = ?auto_493449 ?auto_493451 ) ) ( not ( = ?auto_493449 ?auto_493452 ) ) ( not ( = ?auto_493449 ?auto_493453 ) ) ( not ( = ?auto_493449 ?auto_493454 ) ) ( not ( = ?auto_493449 ?auto_493455 ) ) ( not ( = ?auto_493449 ?auto_493456 ) ) ( not ( = ?auto_493449 ?auto_493457 ) ) ( not ( = ?auto_493449 ?auto_493458 ) ) ( not ( = ?auto_493449 ?auto_493459 ) ) ( not ( = ?auto_493449 ?auto_493460 ) ) ( not ( = ?auto_493449 ?auto_493461 ) ) ( not ( = ?auto_493449 ?auto_493462 ) ) ( not ( = ?auto_493450 ?auto_493451 ) ) ( not ( = ?auto_493450 ?auto_493452 ) ) ( not ( = ?auto_493450 ?auto_493453 ) ) ( not ( = ?auto_493450 ?auto_493454 ) ) ( not ( = ?auto_493450 ?auto_493455 ) ) ( not ( = ?auto_493450 ?auto_493456 ) ) ( not ( = ?auto_493450 ?auto_493457 ) ) ( not ( = ?auto_493450 ?auto_493458 ) ) ( not ( = ?auto_493450 ?auto_493459 ) ) ( not ( = ?auto_493450 ?auto_493460 ) ) ( not ( = ?auto_493450 ?auto_493461 ) ) ( not ( = ?auto_493450 ?auto_493462 ) ) ( not ( = ?auto_493451 ?auto_493452 ) ) ( not ( = ?auto_493451 ?auto_493453 ) ) ( not ( = ?auto_493451 ?auto_493454 ) ) ( not ( = ?auto_493451 ?auto_493455 ) ) ( not ( = ?auto_493451 ?auto_493456 ) ) ( not ( = ?auto_493451 ?auto_493457 ) ) ( not ( = ?auto_493451 ?auto_493458 ) ) ( not ( = ?auto_493451 ?auto_493459 ) ) ( not ( = ?auto_493451 ?auto_493460 ) ) ( not ( = ?auto_493451 ?auto_493461 ) ) ( not ( = ?auto_493451 ?auto_493462 ) ) ( not ( = ?auto_493452 ?auto_493453 ) ) ( not ( = ?auto_493452 ?auto_493454 ) ) ( not ( = ?auto_493452 ?auto_493455 ) ) ( not ( = ?auto_493452 ?auto_493456 ) ) ( not ( = ?auto_493452 ?auto_493457 ) ) ( not ( = ?auto_493452 ?auto_493458 ) ) ( not ( = ?auto_493452 ?auto_493459 ) ) ( not ( = ?auto_493452 ?auto_493460 ) ) ( not ( = ?auto_493452 ?auto_493461 ) ) ( not ( = ?auto_493452 ?auto_493462 ) ) ( not ( = ?auto_493453 ?auto_493454 ) ) ( not ( = ?auto_493453 ?auto_493455 ) ) ( not ( = ?auto_493453 ?auto_493456 ) ) ( not ( = ?auto_493453 ?auto_493457 ) ) ( not ( = ?auto_493453 ?auto_493458 ) ) ( not ( = ?auto_493453 ?auto_493459 ) ) ( not ( = ?auto_493453 ?auto_493460 ) ) ( not ( = ?auto_493453 ?auto_493461 ) ) ( not ( = ?auto_493453 ?auto_493462 ) ) ( not ( = ?auto_493454 ?auto_493455 ) ) ( not ( = ?auto_493454 ?auto_493456 ) ) ( not ( = ?auto_493454 ?auto_493457 ) ) ( not ( = ?auto_493454 ?auto_493458 ) ) ( not ( = ?auto_493454 ?auto_493459 ) ) ( not ( = ?auto_493454 ?auto_493460 ) ) ( not ( = ?auto_493454 ?auto_493461 ) ) ( not ( = ?auto_493454 ?auto_493462 ) ) ( not ( = ?auto_493455 ?auto_493456 ) ) ( not ( = ?auto_493455 ?auto_493457 ) ) ( not ( = ?auto_493455 ?auto_493458 ) ) ( not ( = ?auto_493455 ?auto_493459 ) ) ( not ( = ?auto_493455 ?auto_493460 ) ) ( not ( = ?auto_493455 ?auto_493461 ) ) ( not ( = ?auto_493455 ?auto_493462 ) ) ( not ( = ?auto_493456 ?auto_493457 ) ) ( not ( = ?auto_493456 ?auto_493458 ) ) ( not ( = ?auto_493456 ?auto_493459 ) ) ( not ( = ?auto_493456 ?auto_493460 ) ) ( not ( = ?auto_493456 ?auto_493461 ) ) ( not ( = ?auto_493456 ?auto_493462 ) ) ( not ( = ?auto_493457 ?auto_493458 ) ) ( not ( = ?auto_493457 ?auto_493459 ) ) ( not ( = ?auto_493457 ?auto_493460 ) ) ( not ( = ?auto_493457 ?auto_493461 ) ) ( not ( = ?auto_493457 ?auto_493462 ) ) ( not ( = ?auto_493458 ?auto_493459 ) ) ( not ( = ?auto_493458 ?auto_493460 ) ) ( not ( = ?auto_493458 ?auto_493461 ) ) ( not ( = ?auto_493458 ?auto_493462 ) ) ( not ( = ?auto_493459 ?auto_493460 ) ) ( not ( = ?auto_493459 ?auto_493461 ) ) ( not ( = ?auto_493459 ?auto_493462 ) ) ( not ( = ?auto_493460 ?auto_493461 ) ) ( not ( = ?auto_493460 ?auto_493462 ) ) ( not ( = ?auto_493461 ?auto_493462 ) ) ( ON ?auto_493460 ?auto_493461 ) ( ON ?auto_493459 ?auto_493460 ) ( ON ?auto_493458 ?auto_493459 ) ( ON ?auto_493457 ?auto_493458 ) ( ON ?auto_493456 ?auto_493457 ) ( ON ?auto_493455 ?auto_493456 ) ( ON ?auto_493454 ?auto_493455 ) ( ON ?auto_493453 ?auto_493454 ) ( ON ?auto_493452 ?auto_493453 ) ( ON ?auto_493451 ?auto_493452 ) ( ON ?auto_493450 ?auto_493451 ) ( ON ?auto_493449 ?auto_493450 ) ( CLEAR ?auto_493449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_493449 )
      ( MAKE-13PILE ?auto_493449 ?auto_493450 ?auto_493451 ?auto_493452 ?auto_493453 ?auto_493454 ?auto_493455 ?auto_493456 ?auto_493457 ?auto_493458 ?auto_493459 ?auto_493460 ?auto_493461 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_493504 - BLOCK
      ?auto_493505 - BLOCK
      ?auto_493506 - BLOCK
      ?auto_493507 - BLOCK
      ?auto_493508 - BLOCK
      ?auto_493509 - BLOCK
      ?auto_493510 - BLOCK
      ?auto_493511 - BLOCK
      ?auto_493512 - BLOCK
      ?auto_493513 - BLOCK
      ?auto_493514 - BLOCK
      ?auto_493515 - BLOCK
      ?auto_493516 - BLOCK
      ?auto_493517 - BLOCK
    )
    :vars
    (
      ?auto_493518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_493516 ) ( ON ?auto_493517 ?auto_493518 ) ( CLEAR ?auto_493517 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_493504 ) ( ON ?auto_493505 ?auto_493504 ) ( ON ?auto_493506 ?auto_493505 ) ( ON ?auto_493507 ?auto_493506 ) ( ON ?auto_493508 ?auto_493507 ) ( ON ?auto_493509 ?auto_493508 ) ( ON ?auto_493510 ?auto_493509 ) ( ON ?auto_493511 ?auto_493510 ) ( ON ?auto_493512 ?auto_493511 ) ( ON ?auto_493513 ?auto_493512 ) ( ON ?auto_493514 ?auto_493513 ) ( ON ?auto_493515 ?auto_493514 ) ( ON ?auto_493516 ?auto_493515 ) ( not ( = ?auto_493504 ?auto_493505 ) ) ( not ( = ?auto_493504 ?auto_493506 ) ) ( not ( = ?auto_493504 ?auto_493507 ) ) ( not ( = ?auto_493504 ?auto_493508 ) ) ( not ( = ?auto_493504 ?auto_493509 ) ) ( not ( = ?auto_493504 ?auto_493510 ) ) ( not ( = ?auto_493504 ?auto_493511 ) ) ( not ( = ?auto_493504 ?auto_493512 ) ) ( not ( = ?auto_493504 ?auto_493513 ) ) ( not ( = ?auto_493504 ?auto_493514 ) ) ( not ( = ?auto_493504 ?auto_493515 ) ) ( not ( = ?auto_493504 ?auto_493516 ) ) ( not ( = ?auto_493504 ?auto_493517 ) ) ( not ( = ?auto_493504 ?auto_493518 ) ) ( not ( = ?auto_493505 ?auto_493506 ) ) ( not ( = ?auto_493505 ?auto_493507 ) ) ( not ( = ?auto_493505 ?auto_493508 ) ) ( not ( = ?auto_493505 ?auto_493509 ) ) ( not ( = ?auto_493505 ?auto_493510 ) ) ( not ( = ?auto_493505 ?auto_493511 ) ) ( not ( = ?auto_493505 ?auto_493512 ) ) ( not ( = ?auto_493505 ?auto_493513 ) ) ( not ( = ?auto_493505 ?auto_493514 ) ) ( not ( = ?auto_493505 ?auto_493515 ) ) ( not ( = ?auto_493505 ?auto_493516 ) ) ( not ( = ?auto_493505 ?auto_493517 ) ) ( not ( = ?auto_493505 ?auto_493518 ) ) ( not ( = ?auto_493506 ?auto_493507 ) ) ( not ( = ?auto_493506 ?auto_493508 ) ) ( not ( = ?auto_493506 ?auto_493509 ) ) ( not ( = ?auto_493506 ?auto_493510 ) ) ( not ( = ?auto_493506 ?auto_493511 ) ) ( not ( = ?auto_493506 ?auto_493512 ) ) ( not ( = ?auto_493506 ?auto_493513 ) ) ( not ( = ?auto_493506 ?auto_493514 ) ) ( not ( = ?auto_493506 ?auto_493515 ) ) ( not ( = ?auto_493506 ?auto_493516 ) ) ( not ( = ?auto_493506 ?auto_493517 ) ) ( not ( = ?auto_493506 ?auto_493518 ) ) ( not ( = ?auto_493507 ?auto_493508 ) ) ( not ( = ?auto_493507 ?auto_493509 ) ) ( not ( = ?auto_493507 ?auto_493510 ) ) ( not ( = ?auto_493507 ?auto_493511 ) ) ( not ( = ?auto_493507 ?auto_493512 ) ) ( not ( = ?auto_493507 ?auto_493513 ) ) ( not ( = ?auto_493507 ?auto_493514 ) ) ( not ( = ?auto_493507 ?auto_493515 ) ) ( not ( = ?auto_493507 ?auto_493516 ) ) ( not ( = ?auto_493507 ?auto_493517 ) ) ( not ( = ?auto_493507 ?auto_493518 ) ) ( not ( = ?auto_493508 ?auto_493509 ) ) ( not ( = ?auto_493508 ?auto_493510 ) ) ( not ( = ?auto_493508 ?auto_493511 ) ) ( not ( = ?auto_493508 ?auto_493512 ) ) ( not ( = ?auto_493508 ?auto_493513 ) ) ( not ( = ?auto_493508 ?auto_493514 ) ) ( not ( = ?auto_493508 ?auto_493515 ) ) ( not ( = ?auto_493508 ?auto_493516 ) ) ( not ( = ?auto_493508 ?auto_493517 ) ) ( not ( = ?auto_493508 ?auto_493518 ) ) ( not ( = ?auto_493509 ?auto_493510 ) ) ( not ( = ?auto_493509 ?auto_493511 ) ) ( not ( = ?auto_493509 ?auto_493512 ) ) ( not ( = ?auto_493509 ?auto_493513 ) ) ( not ( = ?auto_493509 ?auto_493514 ) ) ( not ( = ?auto_493509 ?auto_493515 ) ) ( not ( = ?auto_493509 ?auto_493516 ) ) ( not ( = ?auto_493509 ?auto_493517 ) ) ( not ( = ?auto_493509 ?auto_493518 ) ) ( not ( = ?auto_493510 ?auto_493511 ) ) ( not ( = ?auto_493510 ?auto_493512 ) ) ( not ( = ?auto_493510 ?auto_493513 ) ) ( not ( = ?auto_493510 ?auto_493514 ) ) ( not ( = ?auto_493510 ?auto_493515 ) ) ( not ( = ?auto_493510 ?auto_493516 ) ) ( not ( = ?auto_493510 ?auto_493517 ) ) ( not ( = ?auto_493510 ?auto_493518 ) ) ( not ( = ?auto_493511 ?auto_493512 ) ) ( not ( = ?auto_493511 ?auto_493513 ) ) ( not ( = ?auto_493511 ?auto_493514 ) ) ( not ( = ?auto_493511 ?auto_493515 ) ) ( not ( = ?auto_493511 ?auto_493516 ) ) ( not ( = ?auto_493511 ?auto_493517 ) ) ( not ( = ?auto_493511 ?auto_493518 ) ) ( not ( = ?auto_493512 ?auto_493513 ) ) ( not ( = ?auto_493512 ?auto_493514 ) ) ( not ( = ?auto_493512 ?auto_493515 ) ) ( not ( = ?auto_493512 ?auto_493516 ) ) ( not ( = ?auto_493512 ?auto_493517 ) ) ( not ( = ?auto_493512 ?auto_493518 ) ) ( not ( = ?auto_493513 ?auto_493514 ) ) ( not ( = ?auto_493513 ?auto_493515 ) ) ( not ( = ?auto_493513 ?auto_493516 ) ) ( not ( = ?auto_493513 ?auto_493517 ) ) ( not ( = ?auto_493513 ?auto_493518 ) ) ( not ( = ?auto_493514 ?auto_493515 ) ) ( not ( = ?auto_493514 ?auto_493516 ) ) ( not ( = ?auto_493514 ?auto_493517 ) ) ( not ( = ?auto_493514 ?auto_493518 ) ) ( not ( = ?auto_493515 ?auto_493516 ) ) ( not ( = ?auto_493515 ?auto_493517 ) ) ( not ( = ?auto_493515 ?auto_493518 ) ) ( not ( = ?auto_493516 ?auto_493517 ) ) ( not ( = ?auto_493516 ?auto_493518 ) ) ( not ( = ?auto_493517 ?auto_493518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_493517 ?auto_493518 )
      ( !STACK ?auto_493517 ?auto_493516 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_493562 - BLOCK
      ?auto_493563 - BLOCK
      ?auto_493564 - BLOCK
      ?auto_493565 - BLOCK
      ?auto_493566 - BLOCK
      ?auto_493567 - BLOCK
      ?auto_493568 - BLOCK
      ?auto_493569 - BLOCK
      ?auto_493570 - BLOCK
      ?auto_493571 - BLOCK
      ?auto_493572 - BLOCK
      ?auto_493573 - BLOCK
      ?auto_493574 - BLOCK
      ?auto_493575 - BLOCK
    )
    :vars
    (
      ?auto_493576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493575 ?auto_493576 ) ( ON-TABLE ?auto_493562 ) ( ON ?auto_493563 ?auto_493562 ) ( ON ?auto_493564 ?auto_493563 ) ( ON ?auto_493565 ?auto_493564 ) ( ON ?auto_493566 ?auto_493565 ) ( ON ?auto_493567 ?auto_493566 ) ( ON ?auto_493568 ?auto_493567 ) ( ON ?auto_493569 ?auto_493568 ) ( ON ?auto_493570 ?auto_493569 ) ( ON ?auto_493571 ?auto_493570 ) ( ON ?auto_493572 ?auto_493571 ) ( ON ?auto_493573 ?auto_493572 ) ( not ( = ?auto_493562 ?auto_493563 ) ) ( not ( = ?auto_493562 ?auto_493564 ) ) ( not ( = ?auto_493562 ?auto_493565 ) ) ( not ( = ?auto_493562 ?auto_493566 ) ) ( not ( = ?auto_493562 ?auto_493567 ) ) ( not ( = ?auto_493562 ?auto_493568 ) ) ( not ( = ?auto_493562 ?auto_493569 ) ) ( not ( = ?auto_493562 ?auto_493570 ) ) ( not ( = ?auto_493562 ?auto_493571 ) ) ( not ( = ?auto_493562 ?auto_493572 ) ) ( not ( = ?auto_493562 ?auto_493573 ) ) ( not ( = ?auto_493562 ?auto_493574 ) ) ( not ( = ?auto_493562 ?auto_493575 ) ) ( not ( = ?auto_493562 ?auto_493576 ) ) ( not ( = ?auto_493563 ?auto_493564 ) ) ( not ( = ?auto_493563 ?auto_493565 ) ) ( not ( = ?auto_493563 ?auto_493566 ) ) ( not ( = ?auto_493563 ?auto_493567 ) ) ( not ( = ?auto_493563 ?auto_493568 ) ) ( not ( = ?auto_493563 ?auto_493569 ) ) ( not ( = ?auto_493563 ?auto_493570 ) ) ( not ( = ?auto_493563 ?auto_493571 ) ) ( not ( = ?auto_493563 ?auto_493572 ) ) ( not ( = ?auto_493563 ?auto_493573 ) ) ( not ( = ?auto_493563 ?auto_493574 ) ) ( not ( = ?auto_493563 ?auto_493575 ) ) ( not ( = ?auto_493563 ?auto_493576 ) ) ( not ( = ?auto_493564 ?auto_493565 ) ) ( not ( = ?auto_493564 ?auto_493566 ) ) ( not ( = ?auto_493564 ?auto_493567 ) ) ( not ( = ?auto_493564 ?auto_493568 ) ) ( not ( = ?auto_493564 ?auto_493569 ) ) ( not ( = ?auto_493564 ?auto_493570 ) ) ( not ( = ?auto_493564 ?auto_493571 ) ) ( not ( = ?auto_493564 ?auto_493572 ) ) ( not ( = ?auto_493564 ?auto_493573 ) ) ( not ( = ?auto_493564 ?auto_493574 ) ) ( not ( = ?auto_493564 ?auto_493575 ) ) ( not ( = ?auto_493564 ?auto_493576 ) ) ( not ( = ?auto_493565 ?auto_493566 ) ) ( not ( = ?auto_493565 ?auto_493567 ) ) ( not ( = ?auto_493565 ?auto_493568 ) ) ( not ( = ?auto_493565 ?auto_493569 ) ) ( not ( = ?auto_493565 ?auto_493570 ) ) ( not ( = ?auto_493565 ?auto_493571 ) ) ( not ( = ?auto_493565 ?auto_493572 ) ) ( not ( = ?auto_493565 ?auto_493573 ) ) ( not ( = ?auto_493565 ?auto_493574 ) ) ( not ( = ?auto_493565 ?auto_493575 ) ) ( not ( = ?auto_493565 ?auto_493576 ) ) ( not ( = ?auto_493566 ?auto_493567 ) ) ( not ( = ?auto_493566 ?auto_493568 ) ) ( not ( = ?auto_493566 ?auto_493569 ) ) ( not ( = ?auto_493566 ?auto_493570 ) ) ( not ( = ?auto_493566 ?auto_493571 ) ) ( not ( = ?auto_493566 ?auto_493572 ) ) ( not ( = ?auto_493566 ?auto_493573 ) ) ( not ( = ?auto_493566 ?auto_493574 ) ) ( not ( = ?auto_493566 ?auto_493575 ) ) ( not ( = ?auto_493566 ?auto_493576 ) ) ( not ( = ?auto_493567 ?auto_493568 ) ) ( not ( = ?auto_493567 ?auto_493569 ) ) ( not ( = ?auto_493567 ?auto_493570 ) ) ( not ( = ?auto_493567 ?auto_493571 ) ) ( not ( = ?auto_493567 ?auto_493572 ) ) ( not ( = ?auto_493567 ?auto_493573 ) ) ( not ( = ?auto_493567 ?auto_493574 ) ) ( not ( = ?auto_493567 ?auto_493575 ) ) ( not ( = ?auto_493567 ?auto_493576 ) ) ( not ( = ?auto_493568 ?auto_493569 ) ) ( not ( = ?auto_493568 ?auto_493570 ) ) ( not ( = ?auto_493568 ?auto_493571 ) ) ( not ( = ?auto_493568 ?auto_493572 ) ) ( not ( = ?auto_493568 ?auto_493573 ) ) ( not ( = ?auto_493568 ?auto_493574 ) ) ( not ( = ?auto_493568 ?auto_493575 ) ) ( not ( = ?auto_493568 ?auto_493576 ) ) ( not ( = ?auto_493569 ?auto_493570 ) ) ( not ( = ?auto_493569 ?auto_493571 ) ) ( not ( = ?auto_493569 ?auto_493572 ) ) ( not ( = ?auto_493569 ?auto_493573 ) ) ( not ( = ?auto_493569 ?auto_493574 ) ) ( not ( = ?auto_493569 ?auto_493575 ) ) ( not ( = ?auto_493569 ?auto_493576 ) ) ( not ( = ?auto_493570 ?auto_493571 ) ) ( not ( = ?auto_493570 ?auto_493572 ) ) ( not ( = ?auto_493570 ?auto_493573 ) ) ( not ( = ?auto_493570 ?auto_493574 ) ) ( not ( = ?auto_493570 ?auto_493575 ) ) ( not ( = ?auto_493570 ?auto_493576 ) ) ( not ( = ?auto_493571 ?auto_493572 ) ) ( not ( = ?auto_493571 ?auto_493573 ) ) ( not ( = ?auto_493571 ?auto_493574 ) ) ( not ( = ?auto_493571 ?auto_493575 ) ) ( not ( = ?auto_493571 ?auto_493576 ) ) ( not ( = ?auto_493572 ?auto_493573 ) ) ( not ( = ?auto_493572 ?auto_493574 ) ) ( not ( = ?auto_493572 ?auto_493575 ) ) ( not ( = ?auto_493572 ?auto_493576 ) ) ( not ( = ?auto_493573 ?auto_493574 ) ) ( not ( = ?auto_493573 ?auto_493575 ) ) ( not ( = ?auto_493573 ?auto_493576 ) ) ( not ( = ?auto_493574 ?auto_493575 ) ) ( not ( = ?auto_493574 ?auto_493576 ) ) ( not ( = ?auto_493575 ?auto_493576 ) ) ( CLEAR ?auto_493573 ) ( ON ?auto_493574 ?auto_493575 ) ( CLEAR ?auto_493574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_493562 ?auto_493563 ?auto_493564 ?auto_493565 ?auto_493566 ?auto_493567 ?auto_493568 ?auto_493569 ?auto_493570 ?auto_493571 ?auto_493572 ?auto_493573 ?auto_493574 )
      ( MAKE-14PILE ?auto_493562 ?auto_493563 ?auto_493564 ?auto_493565 ?auto_493566 ?auto_493567 ?auto_493568 ?auto_493569 ?auto_493570 ?auto_493571 ?auto_493572 ?auto_493573 ?auto_493574 ?auto_493575 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_493620 - BLOCK
      ?auto_493621 - BLOCK
      ?auto_493622 - BLOCK
      ?auto_493623 - BLOCK
      ?auto_493624 - BLOCK
      ?auto_493625 - BLOCK
      ?auto_493626 - BLOCK
      ?auto_493627 - BLOCK
      ?auto_493628 - BLOCK
      ?auto_493629 - BLOCK
      ?auto_493630 - BLOCK
      ?auto_493631 - BLOCK
      ?auto_493632 - BLOCK
      ?auto_493633 - BLOCK
    )
    :vars
    (
      ?auto_493634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493633 ?auto_493634 ) ( ON-TABLE ?auto_493620 ) ( ON ?auto_493621 ?auto_493620 ) ( ON ?auto_493622 ?auto_493621 ) ( ON ?auto_493623 ?auto_493622 ) ( ON ?auto_493624 ?auto_493623 ) ( ON ?auto_493625 ?auto_493624 ) ( ON ?auto_493626 ?auto_493625 ) ( ON ?auto_493627 ?auto_493626 ) ( ON ?auto_493628 ?auto_493627 ) ( ON ?auto_493629 ?auto_493628 ) ( ON ?auto_493630 ?auto_493629 ) ( not ( = ?auto_493620 ?auto_493621 ) ) ( not ( = ?auto_493620 ?auto_493622 ) ) ( not ( = ?auto_493620 ?auto_493623 ) ) ( not ( = ?auto_493620 ?auto_493624 ) ) ( not ( = ?auto_493620 ?auto_493625 ) ) ( not ( = ?auto_493620 ?auto_493626 ) ) ( not ( = ?auto_493620 ?auto_493627 ) ) ( not ( = ?auto_493620 ?auto_493628 ) ) ( not ( = ?auto_493620 ?auto_493629 ) ) ( not ( = ?auto_493620 ?auto_493630 ) ) ( not ( = ?auto_493620 ?auto_493631 ) ) ( not ( = ?auto_493620 ?auto_493632 ) ) ( not ( = ?auto_493620 ?auto_493633 ) ) ( not ( = ?auto_493620 ?auto_493634 ) ) ( not ( = ?auto_493621 ?auto_493622 ) ) ( not ( = ?auto_493621 ?auto_493623 ) ) ( not ( = ?auto_493621 ?auto_493624 ) ) ( not ( = ?auto_493621 ?auto_493625 ) ) ( not ( = ?auto_493621 ?auto_493626 ) ) ( not ( = ?auto_493621 ?auto_493627 ) ) ( not ( = ?auto_493621 ?auto_493628 ) ) ( not ( = ?auto_493621 ?auto_493629 ) ) ( not ( = ?auto_493621 ?auto_493630 ) ) ( not ( = ?auto_493621 ?auto_493631 ) ) ( not ( = ?auto_493621 ?auto_493632 ) ) ( not ( = ?auto_493621 ?auto_493633 ) ) ( not ( = ?auto_493621 ?auto_493634 ) ) ( not ( = ?auto_493622 ?auto_493623 ) ) ( not ( = ?auto_493622 ?auto_493624 ) ) ( not ( = ?auto_493622 ?auto_493625 ) ) ( not ( = ?auto_493622 ?auto_493626 ) ) ( not ( = ?auto_493622 ?auto_493627 ) ) ( not ( = ?auto_493622 ?auto_493628 ) ) ( not ( = ?auto_493622 ?auto_493629 ) ) ( not ( = ?auto_493622 ?auto_493630 ) ) ( not ( = ?auto_493622 ?auto_493631 ) ) ( not ( = ?auto_493622 ?auto_493632 ) ) ( not ( = ?auto_493622 ?auto_493633 ) ) ( not ( = ?auto_493622 ?auto_493634 ) ) ( not ( = ?auto_493623 ?auto_493624 ) ) ( not ( = ?auto_493623 ?auto_493625 ) ) ( not ( = ?auto_493623 ?auto_493626 ) ) ( not ( = ?auto_493623 ?auto_493627 ) ) ( not ( = ?auto_493623 ?auto_493628 ) ) ( not ( = ?auto_493623 ?auto_493629 ) ) ( not ( = ?auto_493623 ?auto_493630 ) ) ( not ( = ?auto_493623 ?auto_493631 ) ) ( not ( = ?auto_493623 ?auto_493632 ) ) ( not ( = ?auto_493623 ?auto_493633 ) ) ( not ( = ?auto_493623 ?auto_493634 ) ) ( not ( = ?auto_493624 ?auto_493625 ) ) ( not ( = ?auto_493624 ?auto_493626 ) ) ( not ( = ?auto_493624 ?auto_493627 ) ) ( not ( = ?auto_493624 ?auto_493628 ) ) ( not ( = ?auto_493624 ?auto_493629 ) ) ( not ( = ?auto_493624 ?auto_493630 ) ) ( not ( = ?auto_493624 ?auto_493631 ) ) ( not ( = ?auto_493624 ?auto_493632 ) ) ( not ( = ?auto_493624 ?auto_493633 ) ) ( not ( = ?auto_493624 ?auto_493634 ) ) ( not ( = ?auto_493625 ?auto_493626 ) ) ( not ( = ?auto_493625 ?auto_493627 ) ) ( not ( = ?auto_493625 ?auto_493628 ) ) ( not ( = ?auto_493625 ?auto_493629 ) ) ( not ( = ?auto_493625 ?auto_493630 ) ) ( not ( = ?auto_493625 ?auto_493631 ) ) ( not ( = ?auto_493625 ?auto_493632 ) ) ( not ( = ?auto_493625 ?auto_493633 ) ) ( not ( = ?auto_493625 ?auto_493634 ) ) ( not ( = ?auto_493626 ?auto_493627 ) ) ( not ( = ?auto_493626 ?auto_493628 ) ) ( not ( = ?auto_493626 ?auto_493629 ) ) ( not ( = ?auto_493626 ?auto_493630 ) ) ( not ( = ?auto_493626 ?auto_493631 ) ) ( not ( = ?auto_493626 ?auto_493632 ) ) ( not ( = ?auto_493626 ?auto_493633 ) ) ( not ( = ?auto_493626 ?auto_493634 ) ) ( not ( = ?auto_493627 ?auto_493628 ) ) ( not ( = ?auto_493627 ?auto_493629 ) ) ( not ( = ?auto_493627 ?auto_493630 ) ) ( not ( = ?auto_493627 ?auto_493631 ) ) ( not ( = ?auto_493627 ?auto_493632 ) ) ( not ( = ?auto_493627 ?auto_493633 ) ) ( not ( = ?auto_493627 ?auto_493634 ) ) ( not ( = ?auto_493628 ?auto_493629 ) ) ( not ( = ?auto_493628 ?auto_493630 ) ) ( not ( = ?auto_493628 ?auto_493631 ) ) ( not ( = ?auto_493628 ?auto_493632 ) ) ( not ( = ?auto_493628 ?auto_493633 ) ) ( not ( = ?auto_493628 ?auto_493634 ) ) ( not ( = ?auto_493629 ?auto_493630 ) ) ( not ( = ?auto_493629 ?auto_493631 ) ) ( not ( = ?auto_493629 ?auto_493632 ) ) ( not ( = ?auto_493629 ?auto_493633 ) ) ( not ( = ?auto_493629 ?auto_493634 ) ) ( not ( = ?auto_493630 ?auto_493631 ) ) ( not ( = ?auto_493630 ?auto_493632 ) ) ( not ( = ?auto_493630 ?auto_493633 ) ) ( not ( = ?auto_493630 ?auto_493634 ) ) ( not ( = ?auto_493631 ?auto_493632 ) ) ( not ( = ?auto_493631 ?auto_493633 ) ) ( not ( = ?auto_493631 ?auto_493634 ) ) ( not ( = ?auto_493632 ?auto_493633 ) ) ( not ( = ?auto_493632 ?auto_493634 ) ) ( not ( = ?auto_493633 ?auto_493634 ) ) ( ON ?auto_493632 ?auto_493633 ) ( CLEAR ?auto_493630 ) ( ON ?auto_493631 ?auto_493632 ) ( CLEAR ?auto_493631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_493620 ?auto_493621 ?auto_493622 ?auto_493623 ?auto_493624 ?auto_493625 ?auto_493626 ?auto_493627 ?auto_493628 ?auto_493629 ?auto_493630 ?auto_493631 )
      ( MAKE-14PILE ?auto_493620 ?auto_493621 ?auto_493622 ?auto_493623 ?auto_493624 ?auto_493625 ?auto_493626 ?auto_493627 ?auto_493628 ?auto_493629 ?auto_493630 ?auto_493631 ?auto_493632 ?auto_493633 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_493678 - BLOCK
      ?auto_493679 - BLOCK
      ?auto_493680 - BLOCK
      ?auto_493681 - BLOCK
      ?auto_493682 - BLOCK
      ?auto_493683 - BLOCK
      ?auto_493684 - BLOCK
      ?auto_493685 - BLOCK
      ?auto_493686 - BLOCK
      ?auto_493687 - BLOCK
      ?auto_493688 - BLOCK
      ?auto_493689 - BLOCK
      ?auto_493690 - BLOCK
      ?auto_493691 - BLOCK
    )
    :vars
    (
      ?auto_493692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493691 ?auto_493692 ) ( ON-TABLE ?auto_493678 ) ( ON ?auto_493679 ?auto_493678 ) ( ON ?auto_493680 ?auto_493679 ) ( ON ?auto_493681 ?auto_493680 ) ( ON ?auto_493682 ?auto_493681 ) ( ON ?auto_493683 ?auto_493682 ) ( ON ?auto_493684 ?auto_493683 ) ( ON ?auto_493685 ?auto_493684 ) ( ON ?auto_493686 ?auto_493685 ) ( ON ?auto_493687 ?auto_493686 ) ( not ( = ?auto_493678 ?auto_493679 ) ) ( not ( = ?auto_493678 ?auto_493680 ) ) ( not ( = ?auto_493678 ?auto_493681 ) ) ( not ( = ?auto_493678 ?auto_493682 ) ) ( not ( = ?auto_493678 ?auto_493683 ) ) ( not ( = ?auto_493678 ?auto_493684 ) ) ( not ( = ?auto_493678 ?auto_493685 ) ) ( not ( = ?auto_493678 ?auto_493686 ) ) ( not ( = ?auto_493678 ?auto_493687 ) ) ( not ( = ?auto_493678 ?auto_493688 ) ) ( not ( = ?auto_493678 ?auto_493689 ) ) ( not ( = ?auto_493678 ?auto_493690 ) ) ( not ( = ?auto_493678 ?auto_493691 ) ) ( not ( = ?auto_493678 ?auto_493692 ) ) ( not ( = ?auto_493679 ?auto_493680 ) ) ( not ( = ?auto_493679 ?auto_493681 ) ) ( not ( = ?auto_493679 ?auto_493682 ) ) ( not ( = ?auto_493679 ?auto_493683 ) ) ( not ( = ?auto_493679 ?auto_493684 ) ) ( not ( = ?auto_493679 ?auto_493685 ) ) ( not ( = ?auto_493679 ?auto_493686 ) ) ( not ( = ?auto_493679 ?auto_493687 ) ) ( not ( = ?auto_493679 ?auto_493688 ) ) ( not ( = ?auto_493679 ?auto_493689 ) ) ( not ( = ?auto_493679 ?auto_493690 ) ) ( not ( = ?auto_493679 ?auto_493691 ) ) ( not ( = ?auto_493679 ?auto_493692 ) ) ( not ( = ?auto_493680 ?auto_493681 ) ) ( not ( = ?auto_493680 ?auto_493682 ) ) ( not ( = ?auto_493680 ?auto_493683 ) ) ( not ( = ?auto_493680 ?auto_493684 ) ) ( not ( = ?auto_493680 ?auto_493685 ) ) ( not ( = ?auto_493680 ?auto_493686 ) ) ( not ( = ?auto_493680 ?auto_493687 ) ) ( not ( = ?auto_493680 ?auto_493688 ) ) ( not ( = ?auto_493680 ?auto_493689 ) ) ( not ( = ?auto_493680 ?auto_493690 ) ) ( not ( = ?auto_493680 ?auto_493691 ) ) ( not ( = ?auto_493680 ?auto_493692 ) ) ( not ( = ?auto_493681 ?auto_493682 ) ) ( not ( = ?auto_493681 ?auto_493683 ) ) ( not ( = ?auto_493681 ?auto_493684 ) ) ( not ( = ?auto_493681 ?auto_493685 ) ) ( not ( = ?auto_493681 ?auto_493686 ) ) ( not ( = ?auto_493681 ?auto_493687 ) ) ( not ( = ?auto_493681 ?auto_493688 ) ) ( not ( = ?auto_493681 ?auto_493689 ) ) ( not ( = ?auto_493681 ?auto_493690 ) ) ( not ( = ?auto_493681 ?auto_493691 ) ) ( not ( = ?auto_493681 ?auto_493692 ) ) ( not ( = ?auto_493682 ?auto_493683 ) ) ( not ( = ?auto_493682 ?auto_493684 ) ) ( not ( = ?auto_493682 ?auto_493685 ) ) ( not ( = ?auto_493682 ?auto_493686 ) ) ( not ( = ?auto_493682 ?auto_493687 ) ) ( not ( = ?auto_493682 ?auto_493688 ) ) ( not ( = ?auto_493682 ?auto_493689 ) ) ( not ( = ?auto_493682 ?auto_493690 ) ) ( not ( = ?auto_493682 ?auto_493691 ) ) ( not ( = ?auto_493682 ?auto_493692 ) ) ( not ( = ?auto_493683 ?auto_493684 ) ) ( not ( = ?auto_493683 ?auto_493685 ) ) ( not ( = ?auto_493683 ?auto_493686 ) ) ( not ( = ?auto_493683 ?auto_493687 ) ) ( not ( = ?auto_493683 ?auto_493688 ) ) ( not ( = ?auto_493683 ?auto_493689 ) ) ( not ( = ?auto_493683 ?auto_493690 ) ) ( not ( = ?auto_493683 ?auto_493691 ) ) ( not ( = ?auto_493683 ?auto_493692 ) ) ( not ( = ?auto_493684 ?auto_493685 ) ) ( not ( = ?auto_493684 ?auto_493686 ) ) ( not ( = ?auto_493684 ?auto_493687 ) ) ( not ( = ?auto_493684 ?auto_493688 ) ) ( not ( = ?auto_493684 ?auto_493689 ) ) ( not ( = ?auto_493684 ?auto_493690 ) ) ( not ( = ?auto_493684 ?auto_493691 ) ) ( not ( = ?auto_493684 ?auto_493692 ) ) ( not ( = ?auto_493685 ?auto_493686 ) ) ( not ( = ?auto_493685 ?auto_493687 ) ) ( not ( = ?auto_493685 ?auto_493688 ) ) ( not ( = ?auto_493685 ?auto_493689 ) ) ( not ( = ?auto_493685 ?auto_493690 ) ) ( not ( = ?auto_493685 ?auto_493691 ) ) ( not ( = ?auto_493685 ?auto_493692 ) ) ( not ( = ?auto_493686 ?auto_493687 ) ) ( not ( = ?auto_493686 ?auto_493688 ) ) ( not ( = ?auto_493686 ?auto_493689 ) ) ( not ( = ?auto_493686 ?auto_493690 ) ) ( not ( = ?auto_493686 ?auto_493691 ) ) ( not ( = ?auto_493686 ?auto_493692 ) ) ( not ( = ?auto_493687 ?auto_493688 ) ) ( not ( = ?auto_493687 ?auto_493689 ) ) ( not ( = ?auto_493687 ?auto_493690 ) ) ( not ( = ?auto_493687 ?auto_493691 ) ) ( not ( = ?auto_493687 ?auto_493692 ) ) ( not ( = ?auto_493688 ?auto_493689 ) ) ( not ( = ?auto_493688 ?auto_493690 ) ) ( not ( = ?auto_493688 ?auto_493691 ) ) ( not ( = ?auto_493688 ?auto_493692 ) ) ( not ( = ?auto_493689 ?auto_493690 ) ) ( not ( = ?auto_493689 ?auto_493691 ) ) ( not ( = ?auto_493689 ?auto_493692 ) ) ( not ( = ?auto_493690 ?auto_493691 ) ) ( not ( = ?auto_493690 ?auto_493692 ) ) ( not ( = ?auto_493691 ?auto_493692 ) ) ( ON ?auto_493690 ?auto_493691 ) ( ON ?auto_493689 ?auto_493690 ) ( CLEAR ?auto_493687 ) ( ON ?auto_493688 ?auto_493689 ) ( CLEAR ?auto_493688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_493678 ?auto_493679 ?auto_493680 ?auto_493681 ?auto_493682 ?auto_493683 ?auto_493684 ?auto_493685 ?auto_493686 ?auto_493687 ?auto_493688 )
      ( MAKE-14PILE ?auto_493678 ?auto_493679 ?auto_493680 ?auto_493681 ?auto_493682 ?auto_493683 ?auto_493684 ?auto_493685 ?auto_493686 ?auto_493687 ?auto_493688 ?auto_493689 ?auto_493690 ?auto_493691 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_493736 - BLOCK
      ?auto_493737 - BLOCK
      ?auto_493738 - BLOCK
      ?auto_493739 - BLOCK
      ?auto_493740 - BLOCK
      ?auto_493741 - BLOCK
      ?auto_493742 - BLOCK
      ?auto_493743 - BLOCK
      ?auto_493744 - BLOCK
      ?auto_493745 - BLOCK
      ?auto_493746 - BLOCK
      ?auto_493747 - BLOCK
      ?auto_493748 - BLOCK
      ?auto_493749 - BLOCK
    )
    :vars
    (
      ?auto_493750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493749 ?auto_493750 ) ( ON-TABLE ?auto_493736 ) ( ON ?auto_493737 ?auto_493736 ) ( ON ?auto_493738 ?auto_493737 ) ( ON ?auto_493739 ?auto_493738 ) ( ON ?auto_493740 ?auto_493739 ) ( ON ?auto_493741 ?auto_493740 ) ( ON ?auto_493742 ?auto_493741 ) ( ON ?auto_493743 ?auto_493742 ) ( ON ?auto_493744 ?auto_493743 ) ( not ( = ?auto_493736 ?auto_493737 ) ) ( not ( = ?auto_493736 ?auto_493738 ) ) ( not ( = ?auto_493736 ?auto_493739 ) ) ( not ( = ?auto_493736 ?auto_493740 ) ) ( not ( = ?auto_493736 ?auto_493741 ) ) ( not ( = ?auto_493736 ?auto_493742 ) ) ( not ( = ?auto_493736 ?auto_493743 ) ) ( not ( = ?auto_493736 ?auto_493744 ) ) ( not ( = ?auto_493736 ?auto_493745 ) ) ( not ( = ?auto_493736 ?auto_493746 ) ) ( not ( = ?auto_493736 ?auto_493747 ) ) ( not ( = ?auto_493736 ?auto_493748 ) ) ( not ( = ?auto_493736 ?auto_493749 ) ) ( not ( = ?auto_493736 ?auto_493750 ) ) ( not ( = ?auto_493737 ?auto_493738 ) ) ( not ( = ?auto_493737 ?auto_493739 ) ) ( not ( = ?auto_493737 ?auto_493740 ) ) ( not ( = ?auto_493737 ?auto_493741 ) ) ( not ( = ?auto_493737 ?auto_493742 ) ) ( not ( = ?auto_493737 ?auto_493743 ) ) ( not ( = ?auto_493737 ?auto_493744 ) ) ( not ( = ?auto_493737 ?auto_493745 ) ) ( not ( = ?auto_493737 ?auto_493746 ) ) ( not ( = ?auto_493737 ?auto_493747 ) ) ( not ( = ?auto_493737 ?auto_493748 ) ) ( not ( = ?auto_493737 ?auto_493749 ) ) ( not ( = ?auto_493737 ?auto_493750 ) ) ( not ( = ?auto_493738 ?auto_493739 ) ) ( not ( = ?auto_493738 ?auto_493740 ) ) ( not ( = ?auto_493738 ?auto_493741 ) ) ( not ( = ?auto_493738 ?auto_493742 ) ) ( not ( = ?auto_493738 ?auto_493743 ) ) ( not ( = ?auto_493738 ?auto_493744 ) ) ( not ( = ?auto_493738 ?auto_493745 ) ) ( not ( = ?auto_493738 ?auto_493746 ) ) ( not ( = ?auto_493738 ?auto_493747 ) ) ( not ( = ?auto_493738 ?auto_493748 ) ) ( not ( = ?auto_493738 ?auto_493749 ) ) ( not ( = ?auto_493738 ?auto_493750 ) ) ( not ( = ?auto_493739 ?auto_493740 ) ) ( not ( = ?auto_493739 ?auto_493741 ) ) ( not ( = ?auto_493739 ?auto_493742 ) ) ( not ( = ?auto_493739 ?auto_493743 ) ) ( not ( = ?auto_493739 ?auto_493744 ) ) ( not ( = ?auto_493739 ?auto_493745 ) ) ( not ( = ?auto_493739 ?auto_493746 ) ) ( not ( = ?auto_493739 ?auto_493747 ) ) ( not ( = ?auto_493739 ?auto_493748 ) ) ( not ( = ?auto_493739 ?auto_493749 ) ) ( not ( = ?auto_493739 ?auto_493750 ) ) ( not ( = ?auto_493740 ?auto_493741 ) ) ( not ( = ?auto_493740 ?auto_493742 ) ) ( not ( = ?auto_493740 ?auto_493743 ) ) ( not ( = ?auto_493740 ?auto_493744 ) ) ( not ( = ?auto_493740 ?auto_493745 ) ) ( not ( = ?auto_493740 ?auto_493746 ) ) ( not ( = ?auto_493740 ?auto_493747 ) ) ( not ( = ?auto_493740 ?auto_493748 ) ) ( not ( = ?auto_493740 ?auto_493749 ) ) ( not ( = ?auto_493740 ?auto_493750 ) ) ( not ( = ?auto_493741 ?auto_493742 ) ) ( not ( = ?auto_493741 ?auto_493743 ) ) ( not ( = ?auto_493741 ?auto_493744 ) ) ( not ( = ?auto_493741 ?auto_493745 ) ) ( not ( = ?auto_493741 ?auto_493746 ) ) ( not ( = ?auto_493741 ?auto_493747 ) ) ( not ( = ?auto_493741 ?auto_493748 ) ) ( not ( = ?auto_493741 ?auto_493749 ) ) ( not ( = ?auto_493741 ?auto_493750 ) ) ( not ( = ?auto_493742 ?auto_493743 ) ) ( not ( = ?auto_493742 ?auto_493744 ) ) ( not ( = ?auto_493742 ?auto_493745 ) ) ( not ( = ?auto_493742 ?auto_493746 ) ) ( not ( = ?auto_493742 ?auto_493747 ) ) ( not ( = ?auto_493742 ?auto_493748 ) ) ( not ( = ?auto_493742 ?auto_493749 ) ) ( not ( = ?auto_493742 ?auto_493750 ) ) ( not ( = ?auto_493743 ?auto_493744 ) ) ( not ( = ?auto_493743 ?auto_493745 ) ) ( not ( = ?auto_493743 ?auto_493746 ) ) ( not ( = ?auto_493743 ?auto_493747 ) ) ( not ( = ?auto_493743 ?auto_493748 ) ) ( not ( = ?auto_493743 ?auto_493749 ) ) ( not ( = ?auto_493743 ?auto_493750 ) ) ( not ( = ?auto_493744 ?auto_493745 ) ) ( not ( = ?auto_493744 ?auto_493746 ) ) ( not ( = ?auto_493744 ?auto_493747 ) ) ( not ( = ?auto_493744 ?auto_493748 ) ) ( not ( = ?auto_493744 ?auto_493749 ) ) ( not ( = ?auto_493744 ?auto_493750 ) ) ( not ( = ?auto_493745 ?auto_493746 ) ) ( not ( = ?auto_493745 ?auto_493747 ) ) ( not ( = ?auto_493745 ?auto_493748 ) ) ( not ( = ?auto_493745 ?auto_493749 ) ) ( not ( = ?auto_493745 ?auto_493750 ) ) ( not ( = ?auto_493746 ?auto_493747 ) ) ( not ( = ?auto_493746 ?auto_493748 ) ) ( not ( = ?auto_493746 ?auto_493749 ) ) ( not ( = ?auto_493746 ?auto_493750 ) ) ( not ( = ?auto_493747 ?auto_493748 ) ) ( not ( = ?auto_493747 ?auto_493749 ) ) ( not ( = ?auto_493747 ?auto_493750 ) ) ( not ( = ?auto_493748 ?auto_493749 ) ) ( not ( = ?auto_493748 ?auto_493750 ) ) ( not ( = ?auto_493749 ?auto_493750 ) ) ( ON ?auto_493748 ?auto_493749 ) ( ON ?auto_493747 ?auto_493748 ) ( ON ?auto_493746 ?auto_493747 ) ( CLEAR ?auto_493744 ) ( ON ?auto_493745 ?auto_493746 ) ( CLEAR ?auto_493745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_493736 ?auto_493737 ?auto_493738 ?auto_493739 ?auto_493740 ?auto_493741 ?auto_493742 ?auto_493743 ?auto_493744 ?auto_493745 )
      ( MAKE-14PILE ?auto_493736 ?auto_493737 ?auto_493738 ?auto_493739 ?auto_493740 ?auto_493741 ?auto_493742 ?auto_493743 ?auto_493744 ?auto_493745 ?auto_493746 ?auto_493747 ?auto_493748 ?auto_493749 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_493794 - BLOCK
      ?auto_493795 - BLOCK
      ?auto_493796 - BLOCK
      ?auto_493797 - BLOCK
      ?auto_493798 - BLOCK
      ?auto_493799 - BLOCK
      ?auto_493800 - BLOCK
      ?auto_493801 - BLOCK
      ?auto_493802 - BLOCK
      ?auto_493803 - BLOCK
      ?auto_493804 - BLOCK
      ?auto_493805 - BLOCK
      ?auto_493806 - BLOCK
      ?auto_493807 - BLOCK
    )
    :vars
    (
      ?auto_493808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493807 ?auto_493808 ) ( ON-TABLE ?auto_493794 ) ( ON ?auto_493795 ?auto_493794 ) ( ON ?auto_493796 ?auto_493795 ) ( ON ?auto_493797 ?auto_493796 ) ( ON ?auto_493798 ?auto_493797 ) ( ON ?auto_493799 ?auto_493798 ) ( ON ?auto_493800 ?auto_493799 ) ( ON ?auto_493801 ?auto_493800 ) ( not ( = ?auto_493794 ?auto_493795 ) ) ( not ( = ?auto_493794 ?auto_493796 ) ) ( not ( = ?auto_493794 ?auto_493797 ) ) ( not ( = ?auto_493794 ?auto_493798 ) ) ( not ( = ?auto_493794 ?auto_493799 ) ) ( not ( = ?auto_493794 ?auto_493800 ) ) ( not ( = ?auto_493794 ?auto_493801 ) ) ( not ( = ?auto_493794 ?auto_493802 ) ) ( not ( = ?auto_493794 ?auto_493803 ) ) ( not ( = ?auto_493794 ?auto_493804 ) ) ( not ( = ?auto_493794 ?auto_493805 ) ) ( not ( = ?auto_493794 ?auto_493806 ) ) ( not ( = ?auto_493794 ?auto_493807 ) ) ( not ( = ?auto_493794 ?auto_493808 ) ) ( not ( = ?auto_493795 ?auto_493796 ) ) ( not ( = ?auto_493795 ?auto_493797 ) ) ( not ( = ?auto_493795 ?auto_493798 ) ) ( not ( = ?auto_493795 ?auto_493799 ) ) ( not ( = ?auto_493795 ?auto_493800 ) ) ( not ( = ?auto_493795 ?auto_493801 ) ) ( not ( = ?auto_493795 ?auto_493802 ) ) ( not ( = ?auto_493795 ?auto_493803 ) ) ( not ( = ?auto_493795 ?auto_493804 ) ) ( not ( = ?auto_493795 ?auto_493805 ) ) ( not ( = ?auto_493795 ?auto_493806 ) ) ( not ( = ?auto_493795 ?auto_493807 ) ) ( not ( = ?auto_493795 ?auto_493808 ) ) ( not ( = ?auto_493796 ?auto_493797 ) ) ( not ( = ?auto_493796 ?auto_493798 ) ) ( not ( = ?auto_493796 ?auto_493799 ) ) ( not ( = ?auto_493796 ?auto_493800 ) ) ( not ( = ?auto_493796 ?auto_493801 ) ) ( not ( = ?auto_493796 ?auto_493802 ) ) ( not ( = ?auto_493796 ?auto_493803 ) ) ( not ( = ?auto_493796 ?auto_493804 ) ) ( not ( = ?auto_493796 ?auto_493805 ) ) ( not ( = ?auto_493796 ?auto_493806 ) ) ( not ( = ?auto_493796 ?auto_493807 ) ) ( not ( = ?auto_493796 ?auto_493808 ) ) ( not ( = ?auto_493797 ?auto_493798 ) ) ( not ( = ?auto_493797 ?auto_493799 ) ) ( not ( = ?auto_493797 ?auto_493800 ) ) ( not ( = ?auto_493797 ?auto_493801 ) ) ( not ( = ?auto_493797 ?auto_493802 ) ) ( not ( = ?auto_493797 ?auto_493803 ) ) ( not ( = ?auto_493797 ?auto_493804 ) ) ( not ( = ?auto_493797 ?auto_493805 ) ) ( not ( = ?auto_493797 ?auto_493806 ) ) ( not ( = ?auto_493797 ?auto_493807 ) ) ( not ( = ?auto_493797 ?auto_493808 ) ) ( not ( = ?auto_493798 ?auto_493799 ) ) ( not ( = ?auto_493798 ?auto_493800 ) ) ( not ( = ?auto_493798 ?auto_493801 ) ) ( not ( = ?auto_493798 ?auto_493802 ) ) ( not ( = ?auto_493798 ?auto_493803 ) ) ( not ( = ?auto_493798 ?auto_493804 ) ) ( not ( = ?auto_493798 ?auto_493805 ) ) ( not ( = ?auto_493798 ?auto_493806 ) ) ( not ( = ?auto_493798 ?auto_493807 ) ) ( not ( = ?auto_493798 ?auto_493808 ) ) ( not ( = ?auto_493799 ?auto_493800 ) ) ( not ( = ?auto_493799 ?auto_493801 ) ) ( not ( = ?auto_493799 ?auto_493802 ) ) ( not ( = ?auto_493799 ?auto_493803 ) ) ( not ( = ?auto_493799 ?auto_493804 ) ) ( not ( = ?auto_493799 ?auto_493805 ) ) ( not ( = ?auto_493799 ?auto_493806 ) ) ( not ( = ?auto_493799 ?auto_493807 ) ) ( not ( = ?auto_493799 ?auto_493808 ) ) ( not ( = ?auto_493800 ?auto_493801 ) ) ( not ( = ?auto_493800 ?auto_493802 ) ) ( not ( = ?auto_493800 ?auto_493803 ) ) ( not ( = ?auto_493800 ?auto_493804 ) ) ( not ( = ?auto_493800 ?auto_493805 ) ) ( not ( = ?auto_493800 ?auto_493806 ) ) ( not ( = ?auto_493800 ?auto_493807 ) ) ( not ( = ?auto_493800 ?auto_493808 ) ) ( not ( = ?auto_493801 ?auto_493802 ) ) ( not ( = ?auto_493801 ?auto_493803 ) ) ( not ( = ?auto_493801 ?auto_493804 ) ) ( not ( = ?auto_493801 ?auto_493805 ) ) ( not ( = ?auto_493801 ?auto_493806 ) ) ( not ( = ?auto_493801 ?auto_493807 ) ) ( not ( = ?auto_493801 ?auto_493808 ) ) ( not ( = ?auto_493802 ?auto_493803 ) ) ( not ( = ?auto_493802 ?auto_493804 ) ) ( not ( = ?auto_493802 ?auto_493805 ) ) ( not ( = ?auto_493802 ?auto_493806 ) ) ( not ( = ?auto_493802 ?auto_493807 ) ) ( not ( = ?auto_493802 ?auto_493808 ) ) ( not ( = ?auto_493803 ?auto_493804 ) ) ( not ( = ?auto_493803 ?auto_493805 ) ) ( not ( = ?auto_493803 ?auto_493806 ) ) ( not ( = ?auto_493803 ?auto_493807 ) ) ( not ( = ?auto_493803 ?auto_493808 ) ) ( not ( = ?auto_493804 ?auto_493805 ) ) ( not ( = ?auto_493804 ?auto_493806 ) ) ( not ( = ?auto_493804 ?auto_493807 ) ) ( not ( = ?auto_493804 ?auto_493808 ) ) ( not ( = ?auto_493805 ?auto_493806 ) ) ( not ( = ?auto_493805 ?auto_493807 ) ) ( not ( = ?auto_493805 ?auto_493808 ) ) ( not ( = ?auto_493806 ?auto_493807 ) ) ( not ( = ?auto_493806 ?auto_493808 ) ) ( not ( = ?auto_493807 ?auto_493808 ) ) ( ON ?auto_493806 ?auto_493807 ) ( ON ?auto_493805 ?auto_493806 ) ( ON ?auto_493804 ?auto_493805 ) ( ON ?auto_493803 ?auto_493804 ) ( CLEAR ?auto_493801 ) ( ON ?auto_493802 ?auto_493803 ) ( CLEAR ?auto_493802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_493794 ?auto_493795 ?auto_493796 ?auto_493797 ?auto_493798 ?auto_493799 ?auto_493800 ?auto_493801 ?auto_493802 )
      ( MAKE-14PILE ?auto_493794 ?auto_493795 ?auto_493796 ?auto_493797 ?auto_493798 ?auto_493799 ?auto_493800 ?auto_493801 ?auto_493802 ?auto_493803 ?auto_493804 ?auto_493805 ?auto_493806 ?auto_493807 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_493852 - BLOCK
      ?auto_493853 - BLOCK
      ?auto_493854 - BLOCK
      ?auto_493855 - BLOCK
      ?auto_493856 - BLOCK
      ?auto_493857 - BLOCK
      ?auto_493858 - BLOCK
      ?auto_493859 - BLOCK
      ?auto_493860 - BLOCK
      ?auto_493861 - BLOCK
      ?auto_493862 - BLOCK
      ?auto_493863 - BLOCK
      ?auto_493864 - BLOCK
      ?auto_493865 - BLOCK
    )
    :vars
    (
      ?auto_493866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493865 ?auto_493866 ) ( ON-TABLE ?auto_493852 ) ( ON ?auto_493853 ?auto_493852 ) ( ON ?auto_493854 ?auto_493853 ) ( ON ?auto_493855 ?auto_493854 ) ( ON ?auto_493856 ?auto_493855 ) ( ON ?auto_493857 ?auto_493856 ) ( ON ?auto_493858 ?auto_493857 ) ( not ( = ?auto_493852 ?auto_493853 ) ) ( not ( = ?auto_493852 ?auto_493854 ) ) ( not ( = ?auto_493852 ?auto_493855 ) ) ( not ( = ?auto_493852 ?auto_493856 ) ) ( not ( = ?auto_493852 ?auto_493857 ) ) ( not ( = ?auto_493852 ?auto_493858 ) ) ( not ( = ?auto_493852 ?auto_493859 ) ) ( not ( = ?auto_493852 ?auto_493860 ) ) ( not ( = ?auto_493852 ?auto_493861 ) ) ( not ( = ?auto_493852 ?auto_493862 ) ) ( not ( = ?auto_493852 ?auto_493863 ) ) ( not ( = ?auto_493852 ?auto_493864 ) ) ( not ( = ?auto_493852 ?auto_493865 ) ) ( not ( = ?auto_493852 ?auto_493866 ) ) ( not ( = ?auto_493853 ?auto_493854 ) ) ( not ( = ?auto_493853 ?auto_493855 ) ) ( not ( = ?auto_493853 ?auto_493856 ) ) ( not ( = ?auto_493853 ?auto_493857 ) ) ( not ( = ?auto_493853 ?auto_493858 ) ) ( not ( = ?auto_493853 ?auto_493859 ) ) ( not ( = ?auto_493853 ?auto_493860 ) ) ( not ( = ?auto_493853 ?auto_493861 ) ) ( not ( = ?auto_493853 ?auto_493862 ) ) ( not ( = ?auto_493853 ?auto_493863 ) ) ( not ( = ?auto_493853 ?auto_493864 ) ) ( not ( = ?auto_493853 ?auto_493865 ) ) ( not ( = ?auto_493853 ?auto_493866 ) ) ( not ( = ?auto_493854 ?auto_493855 ) ) ( not ( = ?auto_493854 ?auto_493856 ) ) ( not ( = ?auto_493854 ?auto_493857 ) ) ( not ( = ?auto_493854 ?auto_493858 ) ) ( not ( = ?auto_493854 ?auto_493859 ) ) ( not ( = ?auto_493854 ?auto_493860 ) ) ( not ( = ?auto_493854 ?auto_493861 ) ) ( not ( = ?auto_493854 ?auto_493862 ) ) ( not ( = ?auto_493854 ?auto_493863 ) ) ( not ( = ?auto_493854 ?auto_493864 ) ) ( not ( = ?auto_493854 ?auto_493865 ) ) ( not ( = ?auto_493854 ?auto_493866 ) ) ( not ( = ?auto_493855 ?auto_493856 ) ) ( not ( = ?auto_493855 ?auto_493857 ) ) ( not ( = ?auto_493855 ?auto_493858 ) ) ( not ( = ?auto_493855 ?auto_493859 ) ) ( not ( = ?auto_493855 ?auto_493860 ) ) ( not ( = ?auto_493855 ?auto_493861 ) ) ( not ( = ?auto_493855 ?auto_493862 ) ) ( not ( = ?auto_493855 ?auto_493863 ) ) ( not ( = ?auto_493855 ?auto_493864 ) ) ( not ( = ?auto_493855 ?auto_493865 ) ) ( not ( = ?auto_493855 ?auto_493866 ) ) ( not ( = ?auto_493856 ?auto_493857 ) ) ( not ( = ?auto_493856 ?auto_493858 ) ) ( not ( = ?auto_493856 ?auto_493859 ) ) ( not ( = ?auto_493856 ?auto_493860 ) ) ( not ( = ?auto_493856 ?auto_493861 ) ) ( not ( = ?auto_493856 ?auto_493862 ) ) ( not ( = ?auto_493856 ?auto_493863 ) ) ( not ( = ?auto_493856 ?auto_493864 ) ) ( not ( = ?auto_493856 ?auto_493865 ) ) ( not ( = ?auto_493856 ?auto_493866 ) ) ( not ( = ?auto_493857 ?auto_493858 ) ) ( not ( = ?auto_493857 ?auto_493859 ) ) ( not ( = ?auto_493857 ?auto_493860 ) ) ( not ( = ?auto_493857 ?auto_493861 ) ) ( not ( = ?auto_493857 ?auto_493862 ) ) ( not ( = ?auto_493857 ?auto_493863 ) ) ( not ( = ?auto_493857 ?auto_493864 ) ) ( not ( = ?auto_493857 ?auto_493865 ) ) ( not ( = ?auto_493857 ?auto_493866 ) ) ( not ( = ?auto_493858 ?auto_493859 ) ) ( not ( = ?auto_493858 ?auto_493860 ) ) ( not ( = ?auto_493858 ?auto_493861 ) ) ( not ( = ?auto_493858 ?auto_493862 ) ) ( not ( = ?auto_493858 ?auto_493863 ) ) ( not ( = ?auto_493858 ?auto_493864 ) ) ( not ( = ?auto_493858 ?auto_493865 ) ) ( not ( = ?auto_493858 ?auto_493866 ) ) ( not ( = ?auto_493859 ?auto_493860 ) ) ( not ( = ?auto_493859 ?auto_493861 ) ) ( not ( = ?auto_493859 ?auto_493862 ) ) ( not ( = ?auto_493859 ?auto_493863 ) ) ( not ( = ?auto_493859 ?auto_493864 ) ) ( not ( = ?auto_493859 ?auto_493865 ) ) ( not ( = ?auto_493859 ?auto_493866 ) ) ( not ( = ?auto_493860 ?auto_493861 ) ) ( not ( = ?auto_493860 ?auto_493862 ) ) ( not ( = ?auto_493860 ?auto_493863 ) ) ( not ( = ?auto_493860 ?auto_493864 ) ) ( not ( = ?auto_493860 ?auto_493865 ) ) ( not ( = ?auto_493860 ?auto_493866 ) ) ( not ( = ?auto_493861 ?auto_493862 ) ) ( not ( = ?auto_493861 ?auto_493863 ) ) ( not ( = ?auto_493861 ?auto_493864 ) ) ( not ( = ?auto_493861 ?auto_493865 ) ) ( not ( = ?auto_493861 ?auto_493866 ) ) ( not ( = ?auto_493862 ?auto_493863 ) ) ( not ( = ?auto_493862 ?auto_493864 ) ) ( not ( = ?auto_493862 ?auto_493865 ) ) ( not ( = ?auto_493862 ?auto_493866 ) ) ( not ( = ?auto_493863 ?auto_493864 ) ) ( not ( = ?auto_493863 ?auto_493865 ) ) ( not ( = ?auto_493863 ?auto_493866 ) ) ( not ( = ?auto_493864 ?auto_493865 ) ) ( not ( = ?auto_493864 ?auto_493866 ) ) ( not ( = ?auto_493865 ?auto_493866 ) ) ( ON ?auto_493864 ?auto_493865 ) ( ON ?auto_493863 ?auto_493864 ) ( ON ?auto_493862 ?auto_493863 ) ( ON ?auto_493861 ?auto_493862 ) ( ON ?auto_493860 ?auto_493861 ) ( CLEAR ?auto_493858 ) ( ON ?auto_493859 ?auto_493860 ) ( CLEAR ?auto_493859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_493852 ?auto_493853 ?auto_493854 ?auto_493855 ?auto_493856 ?auto_493857 ?auto_493858 ?auto_493859 )
      ( MAKE-14PILE ?auto_493852 ?auto_493853 ?auto_493854 ?auto_493855 ?auto_493856 ?auto_493857 ?auto_493858 ?auto_493859 ?auto_493860 ?auto_493861 ?auto_493862 ?auto_493863 ?auto_493864 ?auto_493865 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_493910 - BLOCK
      ?auto_493911 - BLOCK
      ?auto_493912 - BLOCK
      ?auto_493913 - BLOCK
      ?auto_493914 - BLOCK
      ?auto_493915 - BLOCK
      ?auto_493916 - BLOCK
      ?auto_493917 - BLOCK
      ?auto_493918 - BLOCK
      ?auto_493919 - BLOCK
      ?auto_493920 - BLOCK
      ?auto_493921 - BLOCK
      ?auto_493922 - BLOCK
      ?auto_493923 - BLOCK
    )
    :vars
    (
      ?auto_493924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493923 ?auto_493924 ) ( ON-TABLE ?auto_493910 ) ( ON ?auto_493911 ?auto_493910 ) ( ON ?auto_493912 ?auto_493911 ) ( ON ?auto_493913 ?auto_493912 ) ( ON ?auto_493914 ?auto_493913 ) ( ON ?auto_493915 ?auto_493914 ) ( not ( = ?auto_493910 ?auto_493911 ) ) ( not ( = ?auto_493910 ?auto_493912 ) ) ( not ( = ?auto_493910 ?auto_493913 ) ) ( not ( = ?auto_493910 ?auto_493914 ) ) ( not ( = ?auto_493910 ?auto_493915 ) ) ( not ( = ?auto_493910 ?auto_493916 ) ) ( not ( = ?auto_493910 ?auto_493917 ) ) ( not ( = ?auto_493910 ?auto_493918 ) ) ( not ( = ?auto_493910 ?auto_493919 ) ) ( not ( = ?auto_493910 ?auto_493920 ) ) ( not ( = ?auto_493910 ?auto_493921 ) ) ( not ( = ?auto_493910 ?auto_493922 ) ) ( not ( = ?auto_493910 ?auto_493923 ) ) ( not ( = ?auto_493910 ?auto_493924 ) ) ( not ( = ?auto_493911 ?auto_493912 ) ) ( not ( = ?auto_493911 ?auto_493913 ) ) ( not ( = ?auto_493911 ?auto_493914 ) ) ( not ( = ?auto_493911 ?auto_493915 ) ) ( not ( = ?auto_493911 ?auto_493916 ) ) ( not ( = ?auto_493911 ?auto_493917 ) ) ( not ( = ?auto_493911 ?auto_493918 ) ) ( not ( = ?auto_493911 ?auto_493919 ) ) ( not ( = ?auto_493911 ?auto_493920 ) ) ( not ( = ?auto_493911 ?auto_493921 ) ) ( not ( = ?auto_493911 ?auto_493922 ) ) ( not ( = ?auto_493911 ?auto_493923 ) ) ( not ( = ?auto_493911 ?auto_493924 ) ) ( not ( = ?auto_493912 ?auto_493913 ) ) ( not ( = ?auto_493912 ?auto_493914 ) ) ( not ( = ?auto_493912 ?auto_493915 ) ) ( not ( = ?auto_493912 ?auto_493916 ) ) ( not ( = ?auto_493912 ?auto_493917 ) ) ( not ( = ?auto_493912 ?auto_493918 ) ) ( not ( = ?auto_493912 ?auto_493919 ) ) ( not ( = ?auto_493912 ?auto_493920 ) ) ( not ( = ?auto_493912 ?auto_493921 ) ) ( not ( = ?auto_493912 ?auto_493922 ) ) ( not ( = ?auto_493912 ?auto_493923 ) ) ( not ( = ?auto_493912 ?auto_493924 ) ) ( not ( = ?auto_493913 ?auto_493914 ) ) ( not ( = ?auto_493913 ?auto_493915 ) ) ( not ( = ?auto_493913 ?auto_493916 ) ) ( not ( = ?auto_493913 ?auto_493917 ) ) ( not ( = ?auto_493913 ?auto_493918 ) ) ( not ( = ?auto_493913 ?auto_493919 ) ) ( not ( = ?auto_493913 ?auto_493920 ) ) ( not ( = ?auto_493913 ?auto_493921 ) ) ( not ( = ?auto_493913 ?auto_493922 ) ) ( not ( = ?auto_493913 ?auto_493923 ) ) ( not ( = ?auto_493913 ?auto_493924 ) ) ( not ( = ?auto_493914 ?auto_493915 ) ) ( not ( = ?auto_493914 ?auto_493916 ) ) ( not ( = ?auto_493914 ?auto_493917 ) ) ( not ( = ?auto_493914 ?auto_493918 ) ) ( not ( = ?auto_493914 ?auto_493919 ) ) ( not ( = ?auto_493914 ?auto_493920 ) ) ( not ( = ?auto_493914 ?auto_493921 ) ) ( not ( = ?auto_493914 ?auto_493922 ) ) ( not ( = ?auto_493914 ?auto_493923 ) ) ( not ( = ?auto_493914 ?auto_493924 ) ) ( not ( = ?auto_493915 ?auto_493916 ) ) ( not ( = ?auto_493915 ?auto_493917 ) ) ( not ( = ?auto_493915 ?auto_493918 ) ) ( not ( = ?auto_493915 ?auto_493919 ) ) ( not ( = ?auto_493915 ?auto_493920 ) ) ( not ( = ?auto_493915 ?auto_493921 ) ) ( not ( = ?auto_493915 ?auto_493922 ) ) ( not ( = ?auto_493915 ?auto_493923 ) ) ( not ( = ?auto_493915 ?auto_493924 ) ) ( not ( = ?auto_493916 ?auto_493917 ) ) ( not ( = ?auto_493916 ?auto_493918 ) ) ( not ( = ?auto_493916 ?auto_493919 ) ) ( not ( = ?auto_493916 ?auto_493920 ) ) ( not ( = ?auto_493916 ?auto_493921 ) ) ( not ( = ?auto_493916 ?auto_493922 ) ) ( not ( = ?auto_493916 ?auto_493923 ) ) ( not ( = ?auto_493916 ?auto_493924 ) ) ( not ( = ?auto_493917 ?auto_493918 ) ) ( not ( = ?auto_493917 ?auto_493919 ) ) ( not ( = ?auto_493917 ?auto_493920 ) ) ( not ( = ?auto_493917 ?auto_493921 ) ) ( not ( = ?auto_493917 ?auto_493922 ) ) ( not ( = ?auto_493917 ?auto_493923 ) ) ( not ( = ?auto_493917 ?auto_493924 ) ) ( not ( = ?auto_493918 ?auto_493919 ) ) ( not ( = ?auto_493918 ?auto_493920 ) ) ( not ( = ?auto_493918 ?auto_493921 ) ) ( not ( = ?auto_493918 ?auto_493922 ) ) ( not ( = ?auto_493918 ?auto_493923 ) ) ( not ( = ?auto_493918 ?auto_493924 ) ) ( not ( = ?auto_493919 ?auto_493920 ) ) ( not ( = ?auto_493919 ?auto_493921 ) ) ( not ( = ?auto_493919 ?auto_493922 ) ) ( not ( = ?auto_493919 ?auto_493923 ) ) ( not ( = ?auto_493919 ?auto_493924 ) ) ( not ( = ?auto_493920 ?auto_493921 ) ) ( not ( = ?auto_493920 ?auto_493922 ) ) ( not ( = ?auto_493920 ?auto_493923 ) ) ( not ( = ?auto_493920 ?auto_493924 ) ) ( not ( = ?auto_493921 ?auto_493922 ) ) ( not ( = ?auto_493921 ?auto_493923 ) ) ( not ( = ?auto_493921 ?auto_493924 ) ) ( not ( = ?auto_493922 ?auto_493923 ) ) ( not ( = ?auto_493922 ?auto_493924 ) ) ( not ( = ?auto_493923 ?auto_493924 ) ) ( ON ?auto_493922 ?auto_493923 ) ( ON ?auto_493921 ?auto_493922 ) ( ON ?auto_493920 ?auto_493921 ) ( ON ?auto_493919 ?auto_493920 ) ( ON ?auto_493918 ?auto_493919 ) ( ON ?auto_493917 ?auto_493918 ) ( CLEAR ?auto_493915 ) ( ON ?auto_493916 ?auto_493917 ) ( CLEAR ?auto_493916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_493910 ?auto_493911 ?auto_493912 ?auto_493913 ?auto_493914 ?auto_493915 ?auto_493916 )
      ( MAKE-14PILE ?auto_493910 ?auto_493911 ?auto_493912 ?auto_493913 ?auto_493914 ?auto_493915 ?auto_493916 ?auto_493917 ?auto_493918 ?auto_493919 ?auto_493920 ?auto_493921 ?auto_493922 ?auto_493923 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_493968 - BLOCK
      ?auto_493969 - BLOCK
      ?auto_493970 - BLOCK
      ?auto_493971 - BLOCK
      ?auto_493972 - BLOCK
      ?auto_493973 - BLOCK
      ?auto_493974 - BLOCK
      ?auto_493975 - BLOCK
      ?auto_493976 - BLOCK
      ?auto_493977 - BLOCK
      ?auto_493978 - BLOCK
      ?auto_493979 - BLOCK
      ?auto_493980 - BLOCK
      ?auto_493981 - BLOCK
    )
    :vars
    (
      ?auto_493982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_493981 ?auto_493982 ) ( ON-TABLE ?auto_493968 ) ( ON ?auto_493969 ?auto_493968 ) ( ON ?auto_493970 ?auto_493969 ) ( ON ?auto_493971 ?auto_493970 ) ( ON ?auto_493972 ?auto_493971 ) ( not ( = ?auto_493968 ?auto_493969 ) ) ( not ( = ?auto_493968 ?auto_493970 ) ) ( not ( = ?auto_493968 ?auto_493971 ) ) ( not ( = ?auto_493968 ?auto_493972 ) ) ( not ( = ?auto_493968 ?auto_493973 ) ) ( not ( = ?auto_493968 ?auto_493974 ) ) ( not ( = ?auto_493968 ?auto_493975 ) ) ( not ( = ?auto_493968 ?auto_493976 ) ) ( not ( = ?auto_493968 ?auto_493977 ) ) ( not ( = ?auto_493968 ?auto_493978 ) ) ( not ( = ?auto_493968 ?auto_493979 ) ) ( not ( = ?auto_493968 ?auto_493980 ) ) ( not ( = ?auto_493968 ?auto_493981 ) ) ( not ( = ?auto_493968 ?auto_493982 ) ) ( not ( = ?auto_493969 ?auto_493970 ) ) ( not ( = ?auto_493969 ?auto_493971 ) ) ( not ( = ?auto_493969 ?auto_493972 ) ) ( not ( = ?auto_493969 ?auto_493973 ) ) ( not ( = ?auto_493969 ?auto_493974 ) ) ( not ( = ?auto_493969 ?auto_493975 ) ) ( not ( = ?auto_493969 ?auto_493976 ) ) ( not ( = ?auto_493969 ?auto_493977 ) ) ( not ( = ?auto_493969 ?auto_493978 ) ) ( not ( = ?auto_493969 ?auto_493979 ) ) ( not ( = ?auto_493969 ?auto_493980 ) ) ( not ( = ?auto_493969 ?auto_493981 ) ) ( not ( = ?auto_493969 ?auto_493982 ) ) ( not ( = ?auto_493970 ?auto_493971 ) ) ( not ( = ?auto_493970 ?auto_493972 ) ) ( not ( = ?auto_493970 ?auto_493973 ) ) ( not ( = ?auto_493970 ?auto_493974 ) ) ( not ( = ?auto_493970 ?auto_493975 ) ) ( not ( = ?auto_493970 ?auto_493976 ) ) ( not ( = ?auto_493970 ?auto_493977 ) ) ( not ( = ?auto_493970 ?auto_493978 ) ) ( not ( = ?auto_493970 ?auto_493979 ) ) ( not ( = ?auto_493970 ?auto_493980 ) ) ( not ( = ?auto_493970 ?auto_493981 ) ) ( not ( = ?auto_493970 ?auto_493982 ) ) ( not ( = ?auto_493971 ?auto_493972 ) ) ( not ( = ?auto_493971 ?auto_493973 ) ) ( not ( = ?auto_493971 ?auto_493974 ) ) ( not ( = ?auto_493971 ?auto_493975 ) ) ( not ( = ?auto_493971 ?auto_493976 ) ) ( not ( = ?auto_493971 ?auto_493977 ) ) ( not ( = ?auto_493971 ?auto_493978 ) ) ( not ( = ?auto_493971 ?auto_493979 ) ) ( not ( = ?auto_493971 ?auto_493980 ) ) ( not ( = ?auto_493971 ?auto_493981 ) ) ( not ( = ?auto_493971 ?auto_493982 ) ) ( not ( = ?auto_493972 ?auto_493973 ) ) ( not ( = ?auto_493972 ?auto_493974 ) ) ( not ( = ?auto_493972 ?auto_493975 ) ) ( not ( = ?auto_493972 ?auto_493976 ) ) ( not ( = ?auto_493972 ?auto_493977 ) ) ( not ( = ?auto_493972 ?auto_493978 ) ) ( not ( = ?auto_493972 ?auto_493979 ) ) ( not ( = ?auto_493972 ?auto_493980 ) ) ( not ( = ?auto_493972 ?auto_493981 ) ) ( not ( = ?auto_493972 ?auto_493982 ) ) ( not ( = ?auto_493973 ?auto_493974 ) ) ( not ( = ?auto_493973 ?auto_493975 ) ) ( not ( = ?auto_493973 ?auto_493976 ) ) ( not ( = ?auto_493973 ?auto_493977 ) ) ( not ( = ?auto_493973 ?auto_493978 ) ) ( not ( = ?auto_493973 ?auto_493979 ) ) ( not ( = ?auto_493973 ?auto_493980 ) ) ( not ( = ?auto_493973 ?auto_493981 ) ) ( not ( = ?auto_493973 ?auto_493982 ) ) ( not ( = ?auto_493974 ?auto_493975 ) ) ( not ( = ?auto_493974 ?auto_493976 ) ) ( not ( = ?auto_493974 ?auto_493977 ) ) ( not ( = ?auto_493974 ?auto_493978 ) ) ( not ( = ?auto_493974 ?auto_493979 ) ) ( not ( = ?auto_493974 ?auto_493980 ) ) ( not ( = ?auto_493974 ?auto_493981 ) ) ( not ( = ?auto_493974 ?auto_493982 ) ) ( not ( = ?auto_493975 ?auto_493976 ) ) ( not ( = ?auto_493975 ?auto_493977 ) ) ( not ( = ?auto_493975 ?auto_493978 ) ) ( not ( = ?auto_493975 ?auto_493979 ) ) ( not ( = ?auto_493975 ?auto_493980 ) ) ( not ( = ?auto_493975 ?auto_493981 ) ) ( not ( = ?auto_493975 ?auto_493982 ) ) ( not ( = ?auto_493976 ?auto_493977 ) ) ( not ( = ?auto_493976 ?auto_493978 ) ) ( not ( = ?auto_493976 ?auto_493979 ) ) ( not ( = ?auto_493976 ?auto_493980 ) ) ( not ( = ?auto_493976 ?auto_493981 ) ) ( not ( = ?auto_493976 ?auto_493982 ) ) ( not ( = ?auto_493977 ?auto_493978 ) ) ( not ( = ?auto_493977 ?auto_493979 ) ) ( not ( = ?auto_493977 ?auto_493980 ) ) ( not ( = ?auto_493977 ?auto_493981 ) ) ( not ( = ?auto_493977 ?auto_493982 ) ) ( not ( = ?auto_493978 ?auto_493979 ) ) ( not ( = ?auto_493978 ?auto_493980 ) ) ( not ( = ?auto_493978 ?auto_493981 ) ) ( not ( = ?auto_493978 ?auto_493982 ) ) ( not ( = ?auto_493979 ?auto_493980 ) ) ( not ( = ?auto_493979 ?auto_493981 ) ) ( not ( = ?auto_493979 ?auto_493982 ) ) ( not ( = ?auto_493980 ?auto_493981 ) ) ( not ( = ?auto_493980 ?auto_493982 ) ) ( not ( = ?auto_493981 ?auto_493982 ) ) ( ON ?auto_493980 ?auto_493981 ) ( ON ?auto_493979 ?auto_493980 ) ( ON ?auto_493978 ?auto_493979 ) ( ON ?auto_493977 ?auto_493978 ) ( ON ?auto_493976 ?auto_493977 ) ( ON ?auto_493975 ?auto_493976 ) ( ON ?auto_493974 ?auto_493975 ) ( CLEAR ?auto_493972 ) ( ON ?auto_493973 ?auto_493974 ) ( CLEAR ?auto_493973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_493968 ?auto_493969 ?auto_493970 ?auto_493971 ?auto_493972 ?auto_493973 )
      ( MAKE-14PILE ?auto_493968 ?auto_493969 ?auto_493970 ?auto_493971 ?auto_493972 ?auto_493973 ?auto_493974 ?auto_493975 ?auto_493976 ?auto_493977 ?auto_493978 ?auto_493979 ?auto_493980 ?auto_493981 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_494026 - BLOCK
      ?auto_494027 - BLOCK
      ?auto_494028 - BLOCK
      ?auto_494029 - BLOCK
      ?auto_494030 - BLOCK
      ?auto_494031 - BLOCK
      ?auto_494032 - BLOCK
      ?auto_494033 - BLOCK
      ?auto_494034 - BLOCK
      ?auto_494035 - BLOCK
      ?auto_494036 - BLOCK
      ?auto_494037 - BLOCK
      ?auto_494038 - BLOCK
      ?auto_494039 - BLOCK
    )
    :vars
    (
      ?auto_494040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494039 ?auto_494040 ) ( ON-TABLE ?auto_494026 ) ( ON ?auto_494027 ?auto_494026 ) ( ON ?auto_494028 ?auto_494027 ) ( ON ?auto_494029 ?auto_494028 ) ( not ( = ?auto_494026 ?auto_494027 ) ) ( not ( = ?auto_494026 ?auto_494028 ) ) ( not ( = ?auto_494026 ?auto_494029 ) ) ( not ( = ?auto_494026 ?auto_494030 ) ) ( not ( = ?auto_494026 ?auto_494031 ) ) ( not ( = ?auto_494026 ?auto_494032 ) ) ( not ( = ?auto_494026 ?auto_494033 ) ) ( not ( = ?auto_494026 ?auto_494034 ) ) ( not ( = ?auto_494026 ?auto_494035 ) ) ( not ( = ?auto_494026 ?auto_494036 ) ) ( not ( = ?auto_494026 ?auto_494037 ) ) ( not ( = ?auto_494026 ?auto_494038 ) ) ( not ( = ?auto_494026 ?auto_494039 ) ) ( not ( = ?auto_494026 ?auto_494040 ) ) ( not ( = ?auto_494027 ?auto_494028 ) ) ( not ( = ?auto_494027 ?auto_494029 ) ) ( not ( = ?auto_494027 ?auto_494030 ) ) ( not ( = ?auto_494027 ?auto_494031 ) ) ( not ( = ?auto_494027 ?auto_494032 ) ) ( not ( = ?auto_494027 ?auto_494033 ) ) ( not ( = ?auto_494027 ?auto_494034 ) ) ( not ( = ?auto_494027 ?auto_494035 ) ) ( not ( = ?auto_494027 ?auto_494036 ) ) ( not ( = ?auto_494027 ?auto_494037 ) ) ( not ( = ?auto_494027 ?auto_494038 ) ) ( not ( = ?auto_494027 ?auto_494039 ) ) ( not ( = ?auto_494027 ?auto_494040 ) ) ( not ( = ?auto_494028 ?auto_494029 ) ) ( not ( = ?auto_494028 ?auto_494030 ) ) ( not ( = ?auto_494028 ?auto_494031 ) ) ( not ( = ?auto_494028 ?auto_494032 ) ) ( not ( = ?auto_494028 ?auto_494033 ) ) ( not ( = ?auto_494028 ?auto_494034 ) ) ( not ( = ?auto_494028 ?auto_494035 ) ) ( not ( = ?auto_494028 ?auto_494036 ) ) ( not ( = ?auto_494028 ?auto_494037 ) ) ( not ( = ?auto_494028 ?auto_494038 ) ) ( not ( = ?auto_494028 ?auto_494039 ) ) ( not ( = ?auto_494028 ?auto_494040 ) ) ( not ( = ?auto_494029 ?auto_494030 ) ) ( not ( = ?auto_494029 ?auto_494031 ) ) ( not ( = ?auto_494029 ?auto_494032 ) ) ( not ( = ?auto_494029 ?auto_494033 ) ) ( not ( = ?auto_494029 ?auto_494034 ) ) ( not ( = ?auto_494029 ?auto_494035 ) ) ( not ( = ?auto_494029 ?auto_494036 ) ) ( not ( = ?auto_494029 ?auto_494037 ) ) ( not ( = ?auto_494029 ?auto_494038 ) ) ( not ( = ?auto_494029 ?auto_494039 ) ) ( not ( = ?auto_494029 ?auto_494040 ) ) ( not ( = ?auto_494030 ?auto_494031 ) ) ( not ( = ?auto_494030 ?auto_494032 ) ) ( not ( = ?auto_494030 ?auto_494033 ) ) ( not ( = ?auto_494030 ?auto_494034 ) ) ( not ( = ?auto_494030 ?auto_494035 ) ) ( not ( = ?auto_494030 ?auto_494036 ) ) ( not ( = ?auto_494030 ?auto_494037 ) ) ( not ( = ?auto_494030 ?auto_494038 ) ) ( not ( = ?auto_494030 ?auto_494039 ) ) ( not ( = ?auto_494030 ?auto_494040 ) ) ( not ( = ?auto_494031 ?auto_494032 ) ) ( not ( = ?auto_494031 ?auto_494033 ) ) ( not ( = ?auto_494031 ?auto_494034 ) ) ( not ( = ?auto_494031 ?auto_494035 ) ) ( not ( = ?auto_494031 ?auto_494036 ) ) ( not ( = ?auto_494031 ?auto_494037 ) ) ( not ( = ?auto_494031 ?auto_494038 ) ) ( not ( = ?auto_494031 ?auto_494039 ) ) ( not ( = ?auto_494031 ?auto_494040 ) ) ( not ( = ?auto_494032 ?auto_494033 ) ) ( not ( = ?auto_494032 ?auto_494034 ) ) ( not ( = ?auto_494032 ?auto_494035 ) ) ( not ( = ?auto_494032 ?auto_494036 ) ) ( not ( = ?auto_494032 ?auto_494037 ) ) ( not ( = ?auto_494032 ?auto_494038 ) ) ( not ( = ?auto_494032 ?auto_494039 ) ) ( not ( = ?auto_494032 ?auto_494040 ) ) ( not ( = ?auto_494033 ?auto_494034 ) ) ( not ( = ?auto_494033 ?auto_494035 ) ) ( not ( = ?auto_494033 ?auto_494036 ) ) ( not ( = ?auto_494033 ?auto_494037 ) ) ( not ( = ?auto_494033 ?auto_494038 ) ) ( not ( = ?auto_494033 ?auto_494039 ) ) ( not ( = ?auto_494033 ?auto_494040 ) ) ( not ( = ?auto_494034 ?auto_494035 ) ) ( not ( = ?auto_494034 ?auto_494036 ) ) ( not ( = ?auto_494034 ?auto_494037 ) ) ( not ( = ?auto_494034 ?auto_494038 ) ) ( not ( = ?auto_494034 ?auto_494039 ) ) ( not ( = ?auto_494034 ?auto_494040 ) ) ( not ( = ?auto_494035 ?auto_494036 ) ) ( not ( = ?auto_494035 ?auto_494037 ) ) ( not ( = ?auto_494035 ?auto_494038 ) ) ( not ( = ?auto_494035 ?auto_494039 ) ) ( not ( = ?auto_494035 ?auto_494040 ) ) ( not ( = ?auto_494036 ?auto_494037 ) ) ( not ( = ?auto_494036 ?auto_494038 ) ) ( not ( = ?auto_494036 ?auto_494039 ) ) ( not ( = ?auto_494036 ?auto_494040 ) ) ( not ( = ?auto_494037 ?auto_494038 ) ) ( not ( = ?auto_494037 ?auto_494039 ) ) ( not ( = ?auto_494037 ?auto_494040 ) ) ( not ( = ?auto_494038 ?auto_494039 ) ) ( not ( = ?auto_494038 ?auto_494040 ) ) ( not ( = ?auto_494039 ?auto_494040 ) ) ( ON ?auto_494038 ?auto_494039 ) ( ON ?auto_494037 ?auto_494038 ) ( ON ?auto_494036 ?auto_494037 ) ( ON ?auto_494035 ?auto_494036 ) ( ON ?auto_494034 ?auto_494035 ) ( ON ?auto_494033 ?auto_494034 ) ( ON ?auto_494032 ?auto_494033 ) ( ON ?auto_494031 ?auto_494032 ) ( CLEAR ?auto_494029 ) ( ON ?auto_494030 ?auto_494031 ) ( CLEAR ?auto_494030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_494026 ?auto_494027 ?auto_494028 ?auto_494029 ?auto_494030 )
      ( MAKE-14PILE ?auto_494026 ?auto_494027 ?auto_494028 ?auto_494029 ?auto_494030 ?auto_494031 ?auto_494032 ?auto_494033 ?auto_494034 ?auto_494035 ?auto_494036 ?auto_494037 ?auto_494038 ?auto_494039 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_494084 - BLOCK
      ?auto_494085 - BLOCK
      ?auto_494086 - BLOCK
      ?auto_494087 - BLOCK
      ?auto_494088 - BLOCK
      ?auto_494089 - BLOCK
      ?auto_494090 - BLOCK
      ?auto_494091 - BLOCK
      ?auto_494092 - BLOCK
      ?auto_494093 - BLOCK
      ?auto_494094 - BLOCK
      ?auto_494095 - BLOCK
      ?auto_494096 - BLOCK
      ?auto_494097 - BLOCK
    )
    :vars
    (
      ?auto_494098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494097 ?auto_494098 ) ( ON-TABLE ?auto_494084 ) ( ON ?auto_494085 ?auto_494084 ) ( ON ?auto_494086 ?auto_494085 ) ( not ( = ?auto_494084 ?auto_494085 ) ) ( not ( = ?auto_494084 ?auto_494086 ) ) ( not ( = ?auto_494084 ?auto_494087 ) ) ( not ( = ?auto_494084 ?auto_494088 ) ) ( not ( = ?auto_494084 ?auto_494089 ) ) ( not ( = ?auto_494084 ?auto_494090 ) ) ( not ( = ?auto_494084 ?auto_494091 ) ) ( not ( = ?auto_494084 ?auto_494092 ) ) ( not ( = ?auto_494084 ?auto_494093 ) ) ( not ( = ?auto_494084 ?auto_494094 ) ) ( not ( = ?auto_494084 ?auto_494095 ) ) ( not ( = ?auto_494084 ?auto_494096 ) ) ( not ( = ?auto_494084 ?auto_494097 ) ) ( not ( = ?auto_494084 ?auto_494098 ) ) ( not ( = ?auto_494085 ?auto_494086 ) ) ( not ( = ?auto_494085 ?auto_494087 ) ) ( not ( = ?auto_494085 ?auto_494088 ) ) ( not ( = ?auto_494085 ?auto_494089 ) ) ( not ( = ?auto_494085 ?auto_494090 ) ) ( not ( = ?auto_494085 ?auto_494091 ) ) ( not ( = ?auto_494085 ?auto_494092 ) ) ( not ( = ?auto_494085 ?auto_494093 ) ) ( not ( = ?auto_494085 ?auto_494094 ) ) ( not ( = ?auto_494085 ?auto_494095 ) ) ( not ( = ?auto_494085 ?auto_494096 ) ) ( not ( = ?auto_494085 ?auto_494097 ) ) ( not ( = ?auto_494085 ?auto_494098 ) ) ( not ( = ?auto_494086 ?auto_494087 ) ) ( not ( = ?auto_494086 ?auto_494088 ) ) ( not ( = ?auto_494086 ?auto_494089 ) ) ( not ( = ?auto_494086 ?auto_494090 ) ) ( not ( = ?auto_494086 ?auto_494091 ) ) ( not ( = ?auto_494086 ?auto_494092 ) ) ( not ( = ?auto_494086 ?auto_494093 ) ) ( not ( = ?auto_494086 ?auto_494094 ) ) ( not ( = ?auto_494086 ?auto_494095 ) ) ( not ( = ?auto_494086 ?auto_494096 ) ) ( not ( = ?auto_494086 ?auto_494097 ) ) ( not ( = ?auto_494086 ?auto_494098 ) ) ( not ( = ?auto_494087 ?auto_494088 ) ) ( not ( = ?auto_494087 ?auto_494089 ) ) ( not ( = ?auto_494087 ?auto_494090 ) ) ( not ( = ?auto_494087 ?auto_494091 ) ) ( not ( = ?auto_494087 ?auto_494092 ) ) ( not ( = ?auto_494087 ?auto_494093 ) ) ( not ( = ?auto_494087 ?auto_494094 ) ) ( not ( = ?auto_494087 ?auto_494095 ) ) ( not ( = ?auto_494087 ?auto_494096 ) ) ( not ( = ?auto_494087 ?auto_494097 ) ) ( not ( = ?auto_494087 ?auto_494098 ) ) ( not ( = ?auto_494088 ?auto_494089 ) ) ( not ( = ?auto_494088 ?auto_494090 ) ) ( not ( = ?auto_494088 ?auto_494091 ) ) ( not ( = ?auto_494088 ?auto_494092 ) ) ( not ( = ?auto_494088 ?auto_494093 ) ) ( not ( = ?auto_494088 ?auto_494094 ) ) ( not ( = ?auto_494088 ?auto_494095 ) ) ( not ( = ?auto_494088 ?auto_494096 ) ) ( not ( = ?auto_494088 ?auto_494097 ) ) ( not ( = ?auto_494088 ?auto_494098 ) ) ( not ( = ?auto_494089 ?auto_494090 ) ) ( not ( = ?auto_494089 ?auto_494091 ) ) ( not ( = ?auto_494089 ?auto_494092 ) ) ( not ( = ?auto_494089 ?auto_494093 ) ) ( not ( = ?auto_494089 ?auto_494094 ) ) ( not ( = ?auto_494089 ?auto_494095 ) ) ( not ( = ?auto_494089 ?auto_494096 ) ) ( not ( = ?auto_494089 ?auto_494097 ) ) ( not ( = ?auto_494089 ?auto_494098 ) ) ( not ( = ?auto_494090 ?auto_494091 ) ) ( not ( = ?auto_494090 ?auto_494092 ) ) ( not ( = ?auto_494090 ?auto_494093 ) ) ( not ( = ?auto_494090 ?auto_494094 ) ) ( not ( = ?auto_494090 ?auto_494095 ) ) ( not ( = ?auto_494090 ?auto_494096 ) ) ( not ( = ?auto_494090 ?auto_494097 ) ) ( not ( = ?auto_494090 ?auto_494098 ) ) ( not ( = ?auto_494091 ?auto_494092 ) ) ( not ( = ?auto_494091 ?auto_494093 ) ) ( not ( = ?auto_494091 ?auto_494094 ) ) ( not ( = ?auto_494091 ?auto_494095 ) ) ( not ( = ?auto_494091 ?auto_494096 ) ) ( not ( = ?auto_494091 ?auto_494097 ) ) ( not ( = ?auto_494091 ?auto_494098 ) ) ( not ( = ?auto_494092 ?auto_494093 ) ) ( not ( = ?auto_494092 ?auto_494094 ) ) ( not ( = ?auto_494092 ?auto_494095 ) ) ( not ( = ?auto_494092 ?auto_494096 ) ) ( not ( = ?auto_494092 ?auto_494097 ) ) ( not ( = ?auto_494092 ?auto_494098 ) ) ( not ( = ?auto_494093 ?auto_494094 ) ) ( not ( = ?auto_494093 ?auto_494095 ) ) ( not ( = ?auto_494093 ?auto_494096 ) ) ( not ( = ?auto_494093 ?auto_494097 ) ) ( not ( = ?auto_494093 ?auto_494098 ) ) ( not ( = ?auto_494094 ?auto_494095 ) ) ( not ( = ?auto_494094 ?auto_494096 ) ) ( not ( = ?auto_494094 ?auto_494097 ) ) ( not ( = ?auto_494094 ?auto_494098 ) ) ( not ( = ?auto_494095 ?auto_494096 ) ) ( not ( = ?auto_494095 ?auto_494097 ) ) ( not ( = ?auto_494095 ?auto_494098 ) ) ( not ( = ?auto_494096 ?auto_494097 ) ) ( not ( = ?auto_494096 ?auto_494098 ) ) ( not ( = ?auto_494097 ?auto_494098 ) ) ( ON ?auto_494096 ?auto_494097 ) ( ON ?auto_494095 ?auto_494096 ) ( ON ?auto_494094 ?auto_494095 ) ( ON ?auto_494093 ?auto_494094 ) ( ON ?auto_494092 ?auto_494093 ) ( ON ?auto_494091 ?auto_494092 ) ( ON ?auto_494090 ?auto_494091 ) ( ON ?auto_494089 ?auto_494090 ) ( ON ?auto_494088 ?auto_494089 ) ( CLEAR ?auto_494086 ) ( ON ?auto_494087 ?auto_494088 ) ( CLEAR ?auto_494087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_494084 ?auto_494085 ?auto_494086 ?auto_494087 )
      ( MAKE-14PILE ?auto_494084 ?auto_494085 ?auto_494086 ?auto_494087 ?auto_494088 ?auto_494089 ?auto_494090 ?auto_494091 ?auto_494092 ?auto_494093 ?auto_494094 ?auto_494095 ?auto_494096 ?auto_494097 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_494142 - BLOCK
      ?auto_494143 - BLOCK
      ?auto_494144 - BLOCK
      ?auto_494145 - BLOCK
      ?auto_494146 - BLOCK
      ?auto_494147 - BLOCK
      ?auto_494148 - BLOCK
      ?auto_494149 - BLOCK
      ?auto_494150 - BLOCK
      ?auto_494151 - BLOCK
      ?auto_494152 - BLOCK
      ?auto_494153 - BLOCK
      ?auto_494154 - BLOCK
      ?auto_494155 - BLOCK
    )
    :vars
    (
      ?auto_494156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494155 ?auto_494156 ) ( ON-TABLE ?auto_494142 ) ( ON ?auto_494143 ?auto_494142 ) ( not ( = ?auto_494142 ?auto_494143 ) ) ( not ( = ?auto_494142 ?auto_494144 ) ) ( not ( = ?auto_494142 ?auto_494145 ) ) ( not ( = ?auto_494142 ?auto_494146 ) ) ( not ( = ?auto_494142 ?auto_494147 ) ) ( not ( = ?auto_494142 ?auto_494148 ) ) ( not ( = ?auto_494142 ?auto_494149 ) ) ( not ( = ?auto_494142 ?auto_494150 ) ) ( not ( = ?auto_494142 ?auto_494151 ) ) ( not ( = ?auto_494142 ?auto_494152 ) ) ( not ( = ?auto_494142 ?auto_494153 ) ) ( not ( = ?auto_494142 ?auto_494154 ) ) ( not ( = ?auto_494142 ?auto_494155 ) ) ( not ( = ?auto_494142 ?auto_494156 ) ) ( not ( = ?auto_494143 ?auto_494144 ) ) ( not ( = ?auto_494143 ?auto_494145 ) ) ( not ( = ?auto_494143 ?auto_494146 ) ) ( not ( = ?auto_494143 ?auto_494147 ) ) ( not ( = ?auto_494143 ?auto_494148 ) ) ( not ( = ?auto_494143 ?auto_494149 ) ) ( not ( = ?auto_494143 ?auto_494150 ) ) ( not ( = ?auto_494143 ?auto_494151 ) ) ( not ( = ?auto_494143 ?auto_494152 ) ) ( not ( = ?auto_494143 ?auto_494153 ) ) ( not ( = ?auto_494143 ?auto_494154 ) ) ( not ( = ?auto_494143 ?auto_494155 ) ) ( not ( = ?auto_494143 ?auto_494156 ) ) ( not ( = ?auto_494144 ?auto_494145 ) ) ( not ( = ?auto_494144 ?auto_494146 ) ) ( not ( = ?auto_494144 ?auto_494147 ) ) ( not ( = ?auto_494144 ?auto_494148 ) ) ( not ( = ?auto_494144 ?auto_494149 ) ) ( not ( = ?auto_494144 ?auto_494150 ) ) ( not ( = ?auto_494144 ?auto_494151 ) ) ( not ( = ?auto_494144 ?auto_494152 ) ) ( not ( = ?auto_494144 ?auto_494153 ) ) ( not ( = ?auto_494144 ?auto_494154 ) ) ( not ( = ?auto_494144 ?auto_494155 ) ) ( not ( = ?auto_494144 ?auto_494156 ) ) ( not ( = ?auto_494145 ?auto_494146 ) ) ( not ( = ?auto_494145 ?auto_494147 ) ) ( not ( = ?auto_494145 ?auto_494148 ) ) ( not ( = ?auto_494145 ?auto_494149 ) ) ( not ( = ?auto_494145 ?auto_494150 ) ) ( not ( = ?auto_494145 ?auto_494151 ) ) ( not ( = ?auto_494145 ?auto_494152 ) ) ( not ( = ?auto_494145 ?auto_494153 ) ) ( not ( = ?auto_494145 ?auto_494154 ) ) ( not ( = ?auto_494145 ?auto_494155 ) ) ( not ( = ?auto_494145 ?auto_494156 ) ) ( not ( = ?auto_494146 ?auto_494147 ) ) ( not ( = ?auto_494146 ?auto_494148 ) ) ( not ( = ?auto_494146 ?auto_494149 ) ) ( not ( = ?auto_494146 ?auto_494150 ) ) ( not ( = ?auto_494146 ?auto_494151 ) ) ( not ( = ?auto_494146 ?auto_494152 ) ) ( not ( = ?auto_494146 ?auto_494153 ) ) ( not ( = ?auto_494146 ?auto_494154 ) ) ( not ( = ?auto_494146 ?auto_494155 ) ) ( not ( = ?auto_494146 ?auto_494156 ) ) ( not ( = ?auto_494147 ?auto_494148 ) ) ( not ( = ?auto_494147 ?auto_494149 ) ) ( not ( = ?auto_494147 ?auto_494150 ) ) ( not ( = ?auto_494147 ?auto_494151 ) ) ( not ( = ?auto_494147 ?auto_494152 ) ) ( not ( = ?auto_494147 ?auto_494153 ) ) ( not ( = ?auto_494147 ?auto_494154 ) ) ( not ( = ?auto_494147 ?auto_494155 ) ) ( not ( = ?auto_494147 ?auto_494156 ) ) ( not ( = ?auto_494148 ?auto_494149 ) ) ( not ( = ?auto_494148 ?auto_494150 ) ) ( not ( = ?auto_494148 ?auto_494151 ) ) ( not ( = ?auto_494148 ?auto_494152 ) ) ( not ( = ?auto_494148 ?auto_494153 ) ) ( not ( = ?auto_494148 ?auto_494154 ) ) ( not ( = ?auto_494148 ?auto_494155 ) ) ( not ( = ?auto_494148 ?auto_494156 ) ) ( not ( = ?auto_494149 ?auto_494150 ) ) ( not ( = ?auto_494149 ?auto_494151 ) ) ( not ( = ?auto_494149 ?auto_494152 ) ) ( not ( = ?auto_494149 ?auto_494153 ) ) ( not ( = ?auto_494149 ?auto_494154 ) ) ( not ( = ?auto_494149 ?auto_494155 ) ) ( not ( = ?auto_494149 ?auto_494156 ) ) ( not ( = ?auto_494150 ?auto_494151 ) ) ( not ( = ?auto_494150 ?auto_494152 ) ) ( not ( = ?auto_494150 ?auto_494153 ) ) ( not ( = ?auto_494150 ?auto_494154 ) ) ( not ( = ?auto_494150 ?auto_494155 ) ) ( not ( = ?auto_494150 ?auto_494156 ) ) ( not ( = ?auto_494151 ?auto_494152 ) ) ( not ( = ?auto_494151 ?auto_494153 ) ) ( not ( = ?auto_494151 ?auto_494154 ) ) ( not ( = ?auto_494151 ?auto_494155 ) ) ( not ( = ?auto_494151 ?auto_494156 ) ) ( not ( = ?auto_494152 ?auto_494153 ) ) ( not ( = ?auto_494152 ?auto_494154 ) ) ( not ( = ?auto_494152 ?auto_494155 ) ) ( not ( = ?auto_494152 ?auto_494156 ) ) ( not ( = ?auto_494153 ?auto_494154 ) ) ( not ( = ?auto_494153 ?auto_494155 ) ) ( not ( = ?auto_494153 ?auto_494156 ) ) ( not ( = ?auto_494154 ?auto_494155 ) ) ( not ( = ?auto_494154 ?auto_494156 ) ) ( not ( = ?auto_494155 ?auto_494156 ) ) ( ON ?auto_494154 ?auto_494155 ) ( ON ?auto_494153 ?auto_494154 ) ( ON ?auto_494152 ?auto_494153 ) ( ON ?auto_494151 ?auto_494152 ) ( ON ?auto_494150 ?auto_494151 ) ( ON ?auto_494149 ?auto_494150 ) ( ON ?auto_494148 ?auto_494149 ) ( ON ?auto_494147 ?auto_494148 ) ( ON ?auto_494146 ?auto_494147 ) ( ON ?auto_494145 ?auto_494146 ) ( CLEAR ?auto_494143 ) ( ON ?auto_494144 ?auto_494145 ) ( CLEAR ?auto_494144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_494142 ?auto_494143 ?auto_494144 )
      ( MAKE-14PILE ?auto_494142 ?auto_494143 ?auto_494144 ?auto_494145 ?auto_494146 ?auto_494147 ?auto_494148 ?auto_494149 ?auto_494150 ?auto_494151 ?auto_494152 ?auto_494153 ?auto_494154 ?auto_494155 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_494200 - BLOCK
      ?auto_494201 - BLOCK
      ?auto_494202 - BLOCK
      ?auto_494203 - BLOCK
      ?auto_494204 - BLOCK
      ?auto_494205 - BLOCK
      ?auto_494206 - BLOCK
      ?auto_494207 - BLOCK
      ?auto_494208 - BLOCK
      ?auto_494209 - BLOCK
      ?auto_494210 - BLOCK
      ?auto_494211 - BLOCK
      ?auto_494212 - BLOCK
      ?auto_494213 - BLOCK
    )
    :vars
    (
      ?auto_494214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494213 ?auto_494214 ) ( ON-TABLE ?auto_494200 ) ( not ( = ?auto_494200 ?auto_494201 ) ) ( not ( = ?auto_494200 ?auto_494202 ) ) ( not ( = ?auto_494200 ?auto_494203 ) ) ( not ( = ?auto_494200 ?auto_494204 ) ) ( not ( = ?auto_494200 ?auto_494205 ) ) ( not ( = ?auto_494200 ?auto_494206 ) ) ( not ( = ?auto_494200 ?auto_494207 ) ) ( not ( = ?auto_494200 ?auto_494208 ) ) ( not ( = ?auto_494200 ?auto_494209 ) ) ( not ( = ?auto_494200 ?auto_494210 ) ) ( not ( = ?auto_494200 ?auto_494211 ) ) ( not ( = ?auto_494200 ?auto_494212 ) ) ( not ( = ?auto_494200 ?auto_494213 ) ) ( not ( = ?auto_494200 ?auto_494214 ) ) ( not ( = ?auto_494201 ?auto_494202 ) ) ( not ( = ?auto_494201 ?auto_494203 ) ) ( not ( = ?auto_494201 ?auto_494204 ) ) ( not ( = ?auto_494201 ?auto_494205 ) ) ( not ( = ?auto_494201 ?auto_494206 ) ) ( not ( = ?auto_494201 ?auto_494207 ) ) ( not ( = ?auto_494201 ?auto_494208 ) ) ( not ( = ?auto_494201 ?auto_494209 ) ) ( not ( = ?auto_494201 ?auto_494210 ) ) ( not ( = ?auto_494201 ?auto_494211 ) ) ( not ( = ?auto_494201 ?auto_494212 ) ) ( not ( = ?auto_494201 ?auto_494213 ) ) ( not ( = ?auto_494201 ?auto_494214 ) ) ( not ( = ?auto_494202 ?auto_494203 ) ) ( not ( = ?auto_494202 ?auto_494204 ) ) ( not ( = ?auto_494202 ?auto_494205 ) ) ( not ( = ?auto_494202 ?auto_494206 ) ) ( not ( = ?auto_494202 ?auto_494207 ) ) ( not ( = ?auto_494202 ?auto_494208 ) ) ( not ( = ?auto_494202 ?auto_494209 ) ) ( not ( = ?auto_494202 ?auto_494210 ) ) ( not ( = ?auto_494202 ?auto_494211 ) ) ( not ( = ?auto_494202 ?auto_494212 ) ) ( not ( = ?auto_494202 ?auto_494213 ) ) ( not ( = ?auto_494202 ?auto_494214 ) ) ( not ( = ?auto_494203 ?auto_494204 ) ) ( not ( = ?auto_494203 ?auto_494205 ) ) ( not ( = ?auto_494203 ?auto_494206 ) ) ( not ( = ?auto_494203 ?auto_494207 ) ) ( not ( = ?auto_494203 ?auto_494208 ) ) ( not ( = ?auto_494203 ?auto_494209 ) ) ( not ( = ?auto_494203 ?auto_494210 ) ) ( not ( = ?auto_494203 ?auto_494211 ) ) ( not ( = ?auto_494203 ?auto_494212 ) ) ( not ( = ?auto_494203 ?auto_494213 ) ) ( not ( = ?auto_494203 ?auto_494214 ) ) ( not ( = ?auto_494204 ?auto_494205 ) ) ( not ( = ?auto_494204 ?auto_494206 ) ) ( not ( = ?auto_494204 ?auto_494207 ) ) ( not ( = ?auto_494204 ?auto_494208 ) ) ( not ( = ?auto_494204 ?auto_494209 ) ) ( not ( = ?auto_494204 ?auto_494210 ) ) ( not ( = ?auto_494204 ?auto_494211 ) ) ( not ( = ?auto_494204 ?auto_494212 ) ) ( not ( = ?auto_494204 ?auto_494213 ) ) ( not ( = ?auto_494204 ?auto_494214 ) ) ( not ( = ?auto_494205 ?auto_494206 ) ) ( not ( = ?auto_494205 ?auto_494207 ) ) ( not ( = ?auto_494205 ?auto_494208 ) ) ( not ( = ?auto_494205 ?auto_494209 ) ) ( not ( = ?auto_494205 ?auto_494210 ) ) ( not ( = ?auto_494205 ?auto_494211 ) ) ( not ( = ?auto_494205 ?auto_494212 ) ) ( not ( = ?auto_494205 ?auto_494213 ) ) ( not ( = ?auto_494205 ?auto_494214 ) ) ( not ( = ?auto_494206 ?auto_494207 ) ) ( not ( = ?auto_494206 ?auto_494208 ) ) ( not ( = ?auto_494206 ?auto_494209 ) ) ( not ( = ?auto_494206 ?auto_494210 ) ) ( not ( = ?auto_494206 ?auto_494211 ) ) ( not ( = ?auto_494206 ?auto_494212 ) ) ( not ( = ?auto_494206 ?auto_494213 ) ) ( not ( = ?auto_494206 ?auto_494214 ) ) ( not ( = ?auto_494207 ?auto_494208 ) ) ( not ( = ?auto_494207 ?auto_494209 ) ) ( not ( = ?auto_494207 ?auto_494210 ) ) ( not ( = ?auto_494207 ?auto_494211 ) ) ( not ( = ?auto_494207 ?auto_494212 ) ) ( not ( = ?auto_494207 ?auto_494213 ) ) ( not ( = ?auto_494207 ?auto_494214 ) ) ( not ( = ?auto_494208 ?auto_494209 ) ) ( not ( = ?auto_494208 ?auto_494210 ) ) ( not ( = ?auto_494208 ?auto_494211 ) ) ( not ( = ?auto_494208 ?auto_494212 ) ) ( not ( = ?auto_494208 ?auto_494213 ) ) ( not ( = ?auto_494208 ?auto_494214 ) ) ( not ( = ?auto_494209 ?auto_494210 ) ) ( not ( = ?auto_494209 ?auto_494211 ) ) ( not ( = ?auto_494209 ?auto_494212 ) ) ( not ( = ?auto_494209 ?auto_494213 ) ) ( not ( = ?auto_494209 ?auto_494214 ) ) ( not ( = ?auto_494210 ?auto_494211 ) ) ( not ( = ?auto_494210 ?auto_494212 ) ) ( not ( = ?auto_494210 ?auto_494213 ) ) ( not ( = ?auto_494210 ?auto_494214 ) ) ( not ( = ?auto_494211 ?auto_494212 ) ) ( not ( = ?auto_494211 ?auto_494213 ) ) ( not ( = ?auto_494211 ?auto_494214 ) ) ( not ( = ?auto_494212 ?auto_494213 ) ) ( not ( = ?auto_494212 ?auto_494214 ) ) ( not ( = ?auto_494213 ?auto_494214 ) ) ( ON ?auto_494212 ?auto_494213 ) ( ON ?auto_494211 ?auto_494212 ) ( ON ?auto_494210 ?auto_494211 ) ( ON ?auto_494209 ?auto_494210 ) ( ON ?auto_494208 ?auto_494209 ) ( ON ?auto_494207 ?auto_494208 ) ( ON ?auto_494206 ?auto_494207 ) ( ON ?auto_494205 ?auto_494206 ) ( ON ?auto_494204 ?auto_494205 ) ( ON ?auto_494203 ?auto_494204 ) ( ON ?auto_494202 ?auto_494203 ) ( CLEAR ?auto_494200 ) ( ON ?auto_494201 ?auto_494202 ) ( CLEAR ?auto_494201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_494200 ?auto_494201 )
      ( MAKE-14PILE ?auto_494200 ?auto_494201 ?auto_494202 ?auto_494203 ?auto_494204 ?auto_494205 ?auto_494206 ?auto_494207 ?auto_494208 ?auto_494209 ?auto_494210 ?auto_494211 ?auto_494212 ?auto_494213 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_494258 - BLOCK
      ?auto_494259 - BLOCK
      ?auto_494260 - BLOCK
      ?auto_494261 - BLOCK
      ?auto_494262 - BLOCK
      ?auto_494263 - BLOCK
      ?auto_494264 - BLOCK
      ?auto_494265 - BLOCK
      ?auto_494266 - BLOCK
      ?auto_494267 - BLOCK
      ?auto_494268 - BLOCK
      ?auto_494269 - BLOCK
      ?auto_494270 - BLOCK
      ?auto_494271 - BLOCK
    )
    :vars
    (
      ?auto_494272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494271 ?auto_494272 ) ( not ( = ?auto_494258 ?auto_494259 ) ) ( not ( = ?auto_494258 ?auto_494260 ) ) ( not ( = ?auto_494258 ?auto_494261 ) ) ( not ( = ?auto_494258 ?auto_494262 ) ) ( not ( = ?auto_494258 ?auto_494263 ) ) ( not ( = ?auto_494258 ?auto_494264 ) ) ( not ( = ?auto_494258 ?auto_494265 ) ) ( not ( = ?auto_494258 ?auto_494266 ) ) ( not ( = ?auto_494258 ?auto_494267 ) ) ( not ( = ?auto_494258 ?auto_494268 ) ) ( not ( = ?auto_494258 ?auto_494269 ) ) ( not ( = ?auto_494258 ?auto_494270 ) ) ( not ( = ?auto_494258 ?auto_494271 ) ) ( not ( = ?auto_494258 ?auto_494272 ) ) ( not ( = ?auto_494259 ?auto_494260 ) ) ( not ( = ?auto_494259 ?auto_494261 ) ) ( not ( = ?auto_494259 ?auto_494262 ) ) ( not ( = ?auto_494259 ?auto_494263 ) ) ( not ( = ?auto_494259 ?auto_494264 ) ) ( not ( = ?auto_494259 ?auto_494265 ) ) ( not ( = ?auto_494259 ?auto_494266 ) ) ( not ( = ?auto_494259 ?auto_494267 ) ) ( not ( = ?auto_494259 ?auto_494268 ) ) ( not ( = ?auto_494259 ?auto_494269 ) ) ( not ( = ?auto_494259 ?auto_494270 ) ) ( not ( = ?auto_494259 ?auto_494271 ) ) ( not ( = ?auto_494259 ?auto_494272 ) ) ( not ( = ?auto_494260 ?auto_494261 ) ) ( not ( = ?auto_494260 ?auto_494262 ) ) ( not ( = ?auto_494260 ?auto_494263 ) ) ( not ( = ?auto_494260 ?auto_494264 ) ) ( not ( = ?auto_494260 ?auto_494265 ) ) ( not ( = ?auto_494260 ?auto_494266 ) ) ( not ( = ?auto_494260 ?auto_494267 ) ) ( not ( = ?auto_494260 ?auto_494268 ) ) ( not ( = ?auto_494260 ?auto_494269 ) ) ( not ( = ?auto_494260 ?auto_494270 ) ) ( not ( = ?auto_494260 ?auto_494271 ) ) ( not ( = ?auto_494260 ?auto_494272 ) ) ( not ( = ?auto_494261 ?auto_494262 ) ) ( not ( = ?auto_494261 ?auto_494263 ) ) ( not ( = ?auto_494261 ?auto_494264 ) ) ( not ( = ?auto_494261 ?auto_494265 ) ) ( not ( = ?auto_494261 ?auto_494266 ) ) ( not ( = ?auto_494261 ?auto_494267 ) ) ( not ( = ?auto_494261 ?auto_494268 ) ) ( not ( = ?auto_494261 ?auto_494269 ) ) ( not ( = ?auto_494261 ?auto_494270 ) ) ( not ( = ?auto_494261 ?auto_494271 ) ) ( not ( = ?auto_494261 ?auto_494272 ) ) ( not ( = ?auto_494262 ?auto_494263 ) ) ( not ( = ?auto_494262 ?auto_494264 ) ) ( not ( = ?auto_494262 ?auto_494265 ) ) ( not ( = ?auto_494262 ?auto_494266 ) ) ( not ( = ?auto_494262 ?auto_494267 ) ) ( not ( = ?auto_494262 ?auto_494268 ) ) ( not ( = ?auto_494262 ?auto_494269 ) ) ( not ( = ?auto_494262 ?auto_494270 ) ) ( not ( = ?auto_494262 ?auto_494271 ) ) ( not ( = ?auto_494262 ?auto_494272 ) ) ( not ( = ?auto_494263 ?auto_494264 ) ) ( not ( = ?auto_494263 ?auto_494265 ) ) ( not ( = ?auto_494263 ?auto_494266 ) ) ( not ( = ?auto_494263 ?auto_494267 ) ) ( not ( = ?auto_494263 ?auto_494268 ) ) ( not ( = ?auto_494263 ?auto_494269 ) ) ( not ( = ?auto_494263 ?auto_494270 ) ) ( not ( = ?auto_494263 ?auto_494271 ) ) ( not ( = ?auto_494263 ?auto_494272 ) ) ( not ( = ?auto_494264 ?auto_494265 ) ) ( not ( = ?auto_494264 ?auto_494266 ) ) ( not ( = ?auto_494264 ?auto_494267 ) ) ( not ( = ?auto_494264 ?auto_494268 ) ) ( not ( = ?auto_494264 ?auto_494269 ) ) ( not ( = ?auto_494264 ?auto_494270 ) ) ( not ( = ?auto_494264 ?auto_494271 ) ) ( not ( = ?auto_494264 ?auto_494272 ) ) ( not ( = ?auto_494265 ?auto_494266 ) ) ( not ( = ?auto_494265 ?auto_494267 ) ) ( not ( = ?auto_494265 ?auto_494268 ) ) ( not ( = ?auto_494265 ?auto_494269 ) ) ( not ( = ?auto_494265 ?auto_494270 ) ) ( not ( = ?auto_494265 ?auto_494271 ) ) ( not ( = ?auto_494265 ?auto_494272 ) ) ( not ( = ?auto_494266 ?auto_494267 ) ) ( not ( = ?auto_494266 ?auto_494268 ) ) ( not ( = ?auto_494266 ?auto_494269 ) ) ( not ( = ?auto_494266 ?auto_494270 ) ) ( not ( = ?auto_494266 ?auto_494271 ) ) ( not ( = ?auto_494266 ?auto_494272 ) ) ( not ( = ?auto_494267 ?auto_494268 ) ) ( not ( = ?auto_494267 ?auto_494269 ) ) ( not ( = ?auto_494267 ?auto_494270 ) ) ( not ( = ?auto_494267 ?auto_494271 ) ) ( not ( = ?auto_494267 ?auto_494272 ) ) ( not ( = ?auto_494268 ?auto_494269 ) ) ( not ( = ?auto_494268 ?auto_494270 ) ) ( not ( = ?auto_494268 ?auto_494271 ) ) ( not ( = ?auto_494268 ?auto_494272 ) ) ( not ( = ?auto_494269 ?auto_494270 ) ) ( not ( = ?auto_494269 ?auto_494271 ) ) ( not ( = ?auto_494269 ?auto_494272 ) ) ( not ( = ?auto_494270 ?auto_494271 ) ) ( not ( = ?auto_494270 ?auto_494272 ) ) ( not ( = ?auto_494271 ?auto_494272 ) ) ( ON ?auto_494270 ?auto_494271 ) ( ON ?auto_494269 ?auto_494270 ) ( ON ?auto_494268 ?auto_494269 ) ( ON ?auto_494267 ?auto_494268 ) ( ON ?auto_494266 ?auto_494267 ) ( ON ?auto_494265 ?auto_494266 ) ( ON ?auto_494264 ?auto_494265 ) ( ON ?auto_494263 ?auto_494264 ) ( ON ?auto_494262 ?auto_494263 ) ( ON ?auto_494261 ?auto_494262 ) ( ON ?auto_494260 ?auto_494261 ) ( ON ?auto_494259 ?auto_494260 ) ( ON ?auto_494258 ?auto_494259 ) ( CLEAR ?auto_494258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_494258 )
      ( MAKE-14PILE ?auto_494258 ?auto_494259 ?auto_494260 ?auto_494261 ?auto_494262 ?auto_494263 ?auto_494264 ?auto_494265 ?auto_494266 ?auto_494267 ?auto_494268 ?auto_494269 ?auto_494270 ?auto_494271 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_494317 - BLOCK
      ?auto_494318 - BLOCK
      ?auto_494319 - BLOCK
      ?auto_494320 - BLOCK
      ?auto_494321 - BLOCK
      ?auto_494322 - BLOCK
      ?auto_494323 - BLOCK
      ?auto_494324 - BLOCK
      ?auto_494325 - BLOCK
      ?auto_494326 - BLOCK
      ?auto_494327 - BLOCK
      ?auto_494328 - BLOCK
      ?auto_494329 - BLOCK
      ?auto_494330 - BLOCK
      ?auto_494331 - BLOCK
    )
    :vars
    (
      ?auto_494332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_494330 ) ( ON ?auto_494331 ?auto_494332 ) ( CLEAR ?auto_494331 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_494317 ) ( ON ?auto_494318 ?auto_494317 ) ( ON ?auto_494319 ?auto_494318 ) ( ON ?auto_494320 ?auto_494319 ) ( ON ?auto_494321 ?auto_494320 ) ( ON ?auto_494322 ?auto_494321 ) ( ON ?auto_494323 ?auto_494322 ) ( ON ?auto_494324 ?auto_494323 ) ( ON ?auto_494325 ?auto_494324 ) ( ON ?auto_494326 ?auto_494325 ) ( ON ?auto_494327 ?auto_494326 ) ( ON ?auto_494328 ?auto_494327 ) ( ON ?auto_494329 ?auto_494328 ) ( ON ?auto_494330 ?auto_494329 ) ( not ( = ?auto_494317 ?auto_494318 ) ) ( not ( = ?auto_494317 ?auto_494319 ) ) ( not ( = ?auto_494317 ?auto_494320 ) ) ( not ( = ?auto_494317 ?auto_494321 ) ) ( not ( = ?auto_494317 ?auto_494322 ) ) ( not ( = ?auto_494317 ?auto_494323 ) ) ( not ( = ?auto_494317 ?auto_494324 ) ) ( not ( = ?auto_494317 ?auto_494325 ) ) ( not ( = ?auto_494317 ?auto_494326 ) ) ( not ( = ?auto_494317 ?auto_494327 ) ) ( not ( = ?auto_494317 ?auto_494328 ) ) ( not ( = ?auto_494317 ?auto_494329 ) ) ( not ( = ?auto_494317 ?auto_494330 ) ) ( not ( = ?auto_494317 ?auto_494331 ) ) ( not ( = ?auto_494317 ?auto_494332 ) ) ( not ( = ?auto_494318 ?auto_494319 ) ) ( not ( = ?auto_494318 ?auto_494320 ) ) ( not ( = ?auto_494318 ?auto_494321 ) ) ( not ( = ?auto_494318 ?auto_494322 ) ) ( not ( = ?auto_494318 ?auto_494323 ) ) ( not ( = ?auto_494318 ?auto_494324 ) ) ( not ( = ?auto_494318 ?auto_494325 ) ) ( not ( = ?auto_494318 ?auto_494326 ) ) ( not ( = ?auto_494318 ?auto_494327 ) ) ( not ( = ?auto_494318 ?auto_494328 ) ) ( not ( = ?auto_494318 ?auto_494329 ) ) ( not ( = ?auto_494318 ?auto_494330 ) ) ( not ( = ?auto_494318 ?auto_494331 ) ) ( not ( = ?auto_494318 ?auto_494332 ) ) ( not ( = ?auto_494319 ?auto_494320 ) ) ( not ( = ?auto_494319 ?auto_494321 ) ) ( not ( = ?auto_494319 ?auto_494322 ) ) ( not ( = ?auto_494319 ?auto_494323 ) ) ( not ( = ?auto_494319 ?auto_494324 ) ) ( not ( = ?auto_494319 ?auto_494325 ) ) ( not ( = ?auto_494319 ?auto_494326 ) ) ( not ( = ?auto_494319 ?auto_494327 ) ) ( not ( = ?auto_494319 ?auto_494328 ) ) ( not ( = ?auto_494319 ?auto_494329 ) ) ( not ( = ?auto_494319 ?auto_494330 ) ) ( not ( = ?auto_494319 ?auto_494331 ) ) ( not ( = ?auto_494319 ?auto_494332 ) ) ( not ( = ?auto_494320 ?auto_494321 ) ) ( not ( = ?auto_494320 ?auto_494322 ) ) ( not ( = ?auto_494320 ?auto_494323 ) ) ( not ( = ?auto_494320 ?auto_494324 ) ) ( not ( = ?auto_494320 ?auto_494325 ) ) ( not ( = ?auto_494320 ?auto_494326 ) ) ( not ( = ?auto_494320 ?auto_494327 ) ) ( not ( = ?auto_494320 ?auto_494328 ) ) ( not ( = ?auto_494320 ?auto_494329 ) ) ( not ( = ?auto_494320 ?auto_494330 ) ) ( not ( = ?auto_494320 ?auto_494331 ) ) ( not ( = ?auto_494320 ?auto_494332 ) ) ( not ( = ?auto_494321 ?auto_494322 ) ) ( not ( = ?auto_494321 ?auto_494323 ) ) ( not ( = ?auto_494321 ?auto_494324 ) ) ( not ( = ?auto_494321 ?auto_494325 ) ) ( not ( = ?auto_494321 ?auto_494326 ) ) ( not ( = ?auto_494321 ?auto_494327 ) ) ( not ( = ?auto_494321 ?auto_494328 ) ) ( not ( = ?auto_494321 ?auto_494329 ) ) ( not ( = ?auto_494321 ?auto_494330 ) ) ( not ( = ?auto_494321 ?auto_494331 ) ) ( not ( = ?auto_494321 ?auto_494332 ) ) ( not ( = ?auto_494322 ?auto_494323 ) ) ( not ( = ?auto_494322 ?auto_494324 ) ) ( not ( = ?auto_494322 ?auto_494325 ) ) ( not ( = ?auto_494322 ?auto_494326 ) ) ( not ( = ?auto_494322 ?auto_494327 ) ) ( not ( = ?auto_494322 ?auto_494328 ) ) ( not ( = ?auto_494322 ?auto_494329 ) ) ( not ( = ?auto_494322 ?auto_494330 ) ) ( not ( = ?auto_494322 ?auto_494331 ) ) ( not ( = ?auto_494322 ?auto_494332 ) ) ( not ( = ?auto_494323 ?auto_494324 ) ) ( not ( = ?auto_494323 ?auto_494325 ) ) ( not ( = ?auto_494323 ?auto_494326 ) ) ( not ( = ?auto_494323 ?auto_494327 ) ) ( not ( = ?auto_494323 ?auto_494328 ) ) ( not ( = ?auto_494323 ?auto_494329 ) ) ( not ( = ?auto_494323 ?auto_494330 ) ) ( not ( = ?auto_494323 ?auto_494331 ) ) ( not ( = ?auto_494323 ?auto_494332 ) ) ( not ( = ?auto_494324 ?auto_494325 ) ) ( not ( = ?auto_494324 ?auto_494326 ) ) ( not ( = ?auto_494324 ?auto_494327 ) ) ( not ( = ?auto_494324 ?auto_494328 ) ) ( not ( = ?auto_494324 ?auto_494329 ) ) ( not ( = ?auto_494324 ?auto_494330 ) ) ( not ( = ?auto_494324 ?auto_494331 ) ) ( not ( = ?auto_494324 ?auto_494332 ) ) ( not ( = ?auto_494325 ?auto_494326 ) ) ( not ( = ?auto_494325 ?auto_494327 ) ) ( not ( = ?auto_494325 ?auto_494328 ) ) ( not ( = ?auto_494325 ?auto_494329 ) ) ( not ( = ?auto_494325 ?auto_494330 ) ) ( not ( = ?auto_494325 ?auto_494331 ) ) ( not ( = ?auto_494325 ?auto_494332 ) ) ( not ( = ?auto_494326 ?auto_494327 ) ) ( not ( = ?auto_494326 ?auto_494328 ) ) ( not ( = ?auto_494326 ?auto_494329 ) ) ( not ( = ?auto_494326 ?auto_494330 ) ) ( not ( = ?auto_494326 ?auto_494331 ) ) ( not ( = ?auto_494326 ?auto_494332 ) ) ( not ( = ?auto_494327 ?auto_494328 ) ) ( not ( = ?auto_494327 ?auto_494329 ) ) ( not ( = ?auto_494327 ?auto_494330 ) ) ( not ( = ?auto_494327 ?auto_494331 ) ) ( not ( = ?auto_494327 ?auto_494332 ) ) ( not ( = ?auto_494328 ?auto_494329 ) ) ( not ( = ?auto_494328 ?auto_494330 ) ) ( not ( = ?auto_494328 ?auto_494331 ) ) ( not ( = ?auto_494328 ?auto_494332 ) ) ( not ( = ?auto_494329 ?auto_494330 ) ) ( not ( = ?auto_494329 ?auto_494331 ) ) ( not ( = ?auto_494329 ?auto_494332 ) ) ( not ( = ?auto_494330 ?auto_494331 ) ) ( not ( = ?auto_494330 ?auto_494332 ) ) ( not ( = ?auto_494331 ?auto_494332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_494331 ?auto_494332 )
      ( !STACK ?auto_494331 ?auto_494330 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_494379 - BLOCK
      ?auto_494380 - BLOCK
      ?auto_494381 - BLOCK
      ?auto_494382 - BLOCK
      ?auto_494383 - BLOCK
      ?auto_494384 - BLOCK
      ?auto_494385 - BLOCK
      ?auto_494386 - BLOCK
      ?auto_494387 - BLOCK
      ?auto_494388 - BLOCK
      ?auto_494389 - BLOCK
      ?auto_494390 - BLOCK
      ?auto_494391 - BLOCK
      ?auto_494392 - BLOCK
      ?auto_494393 - BLOCK
    )
    :vars
    (
      ?auto_494394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494393 ?auto_494394 ) ( ON-TABLE ?auto_494379 ) ( ON ?auto_494380 ?auto_494379 ) ( ON ?auto_494381 ?auto_494380 ) ( ON ?auto_494382 ?auto_494381 ) ( ON ?auto_494383 ?auto_494382 ) ( ON ?auto_494384 ?auto_494383 ) ( ON ?auto_494385 ?auto_494384 ) ( ON ?auto_494386 ?auto_494385 ) ( ON ?auto_494387 ?auto_494386 ) ( ON ?auto_494388 ?auto_494387 ) ( ON ?auto_494389 ?auto_494388 ) ( ON ?auto_494390 ?auto_494389 ) ( ON ?auto_494391 ?auto_494390 ) ( not ( = ?auto_494379 ?auto_494380 ) ) ( not ( = ?auto_494379 ?auto_494381 ) ) ( not ( = ?auto_494379 ?auto_494382 ) ) ( not ( = ?auto_494379 ?auto_494383 ) ) ( not ( = ?auto_494379 ?auto_494384 ) ) ( not ( = ?auto_494379 ?auto_494385 ) ) ( not ( = ?auto_494379 ?auto_494386 ) ) ( not ( = ?auto_494379 ?auto_494387 ) ) ( not ( = ?auto_494379 ?auto_494388 ) ) ( not ( = ?auto_494379 ?auto_494389 ) ) ( not ( = ?auto_494379 ?auto_494390 ) ) ( not ( = ?auto_494379 ?auto_494391 ) ) ( not ( = ?auto_494379 ?auto_494392 ) ) ( not ( = ?auto_494379 ?auto_494393 ) ) ( not ( = ?auto_494379 ?auto_494394 ) ) ( not ( = ?auto_494380 ?auto_494381 ) ) ( not ( = ?auto_494380 ?auto_494382 ) ) ( not ( = ?auto_494380 ?auto_494383 ) ) ( not ( = ?auto_494380 ?auto_494384 ) ) ( not ( = ?auto_494380 ?auto_494385 ) ) ( not ( = ?auto_494380 ?auto_494386 ) ) ( not ( = ?auto_494380 ?auto_494387 ) ) ( not ( = ?auto_494380 ?auto_494388 ) ) ( not ( = ?auto_494380 ?auto_494389 ) ) ( not ( = ?auto_494380 ?auto_494390 ) ) ( not ( = ?auto_494380 ?auto_494391 ) ) ( not ( = ?auto_494380 ?auto_494392 ) ) ( not ( = ?auto_494380 ?auto_494393 ) ) ( not ( = ?auto_494380 ?auto_494394 ) ) ( not ( = ?auto_494381 ?auto_494382 ) ) ( not ( = ?auto_494381 ?auto_494383 ) ) ( not ( = ?auto_494381 ?auto_494384 ) ) ( not ( = ?auto_494381 ?auto_494385 ) ) ( not ( = ?auto_494381 ?auto_494386 ) ) ( not ( = ?auto_494381 ?auto_494387 ) ) ( not ( = ?auto_494381 ?auto_494388 ) ) ( not ( = ?auto_494381 ?auto_494389 ) ) ( not ( = ?auto_494381 ?auto_494390 ) ) ( not ( = ?auto_494381 ?auto_494391 ) ) ( not ( = ?auto_494381 ?auto_494392 ) ) ( not ( = ?auto_494381 ?auto_494393 ) ) ( not ( = ?auto_494381 ?auto_494394 ) ) ( not ( = ?auto_494382 ?auto_494383 ) ) ( not ( = ?auto_494382 ?auto_494384 ) ) ( not ( = ?auto_494382 ?auto_494385 ) ) ( not ( = ?auto_494382 ?auto_494386 ) ) ( not ( = ?auto_494382 ?auto_494387 ) ) ( not ( = ?auto_494382 ?auto_494388 ) ) ( not ( = ?auto_494382 ?auto_494389 ) ) ( not ( = ?auto_494382 ?auto_494390 ) ) ( not ( = ?auto_494382 ?auto_494391 ) ) ( not ( = ?auto_494382 ?auto_494392 ) ) ( not ( = ?auto_494382 ?auto_494393 ) ) ( not ( = ?auto_494382 ?auto_494394 ) ) ( not ( = ?auto_494383 ?auto_494384 ) ) ( not ( = ?auto_494383 ?auto_494385 ) ) ( not ( = ?auto_494383 ?auto_494386 ) ) ( not ( = ?auto_494383 ?auto_494387 ) ) ( not ( = ?auto_494383 ?auto_494388 ) ) ( not ( = ?auto_494383 ?auto_494389 ) ) ( not ( = ?auto_494383 ?auto_494390 ) ) ( not ( = ?auto_494383 ?auto_494391 ) ) ( not ( = ?auto_494383 ?auto_494392 ) ) ( not ( = ?auto_494383 ?auto_494393 ) ) ( not ( = ?auto_494383 ?auto_494394 ) ) ( not ( = ?auto_494384 ?auto_494385 ) ) ( not ( = ?auto_494384 ?auto_494386 ) ) ( not ( = ?auto_494384 ?auto_494387 ) ) ( not ( = ?auto_494384 ?auto_494388 ) ) ( not ( = ?auto_494384 ?auto_494389 ) ) ( not ( = ?auto_494384 ?auto_494390 ) ) ( not ( = ?auto_494384 ?auto_494391 ) ) ( not ( = ?auto_494384 ?auto_494392 ) ) ( not ( = ?auto_494384 ?auto_494393 ) ) ( not ( = ?auto_494384 ?auto_494394 ) ) ( not ( = ?auto_494385 ?auto_494386 ) ) ( not ( = ?auto_494385 ?auto_494387 ) ) ( not ( = ?auto_494385 ?auto_494388 ) ) ( not ( = ?auto_494385 ?auto_494389 ) ) ( not ( = ?auto_494385 ?auto_494390 ) ) ( not ( = ?auto_494385 ?auto_494391 ) ) ( not ( = ?auto_494385 ?auto_494392 ) ) ( not ( = ?auto_494385 ?auto_494393 ) ) ( not ( = ?auto_494385 ?auto_494394 ) ) ( not ( = ?auto_494386 ?auto_494387 ) ) ( not ( = ?auto_494386 ?auto_494388 ) ) ( not ( = ?auto_494386 ?auto_494389 ) ) ( not ( = ?auto_494386 ?auto_494390 ) ) ( not ( = ?auto_494386 ?auto_494391 ) ) ( not ( = ?auto_494386 ?auto_494392 ) ) ( not ( = ?auto_494386 ?auto_494393 ) ) ( not ( = ?auto_494386 ?auto_494394 ) ) ( not ( = ?auto_494387 ?auto_494388 ) ) ( not ( = ?auto_494387 ?auto_494389 ) ) ( not ( = ?auto_494387 ?auto_494390 ) ) ( not ( = ?auto_494387 ?auto_494391 ) ) ( not ( = ?auto_494387 ?auto_494392 ) ) ( not ( = ?auto_494387 ?auto_494393 ) ) ( not ( = ?auto_494387 ?auto_494394 ) ) ( not ( = ?auto_494388 ?auto_494389 ) ) ( not ( = ?auto_494388 ?auto_494390 ) ) ( not ( = ?auto_494388 ?auto_494391 ) ) ( not ( = ?auto_494388 ?auto_494392 ) ) ( not ( = ?auto_494388 ?auto_494393 ) ) ( not ( = ?auto_494388 ?auto_494394 ) ) ( not ( = ?auto_494389 ?auto_494390 ) ) ( not ( = ?auto_494389 ?auto_494391 ) ) ( not ( = ?auto_494389 ?auto_494392 ) ) ( not ( = ?auto_494389 ?auto_494393 ) ) ( not ( = ?auto_494389 ?auto_494394 ) ) ( not ( = ?auto_494390 ?auto_494391 ) ) ( not ( = ?auto_494390 ?auto_494392 ) ) ( not ( = ?auto_494390 ?auto_494393 ) ) ( not ( = ?auto_494390 ?auto_494394 ) ) ( not ( = ?auto_494391 ?auto_494392 ) ) ( not ( = ?auto_494391 ?auto_494393 ) ) ( not ( = ?auto_494391 ?auto_494394 ) ) ( not ( = ?auto_494392 ?auto_494393 ) ) ( not ( = ?auto_494392 ?auto_494394 ) ) ( not ( = ?auto_494393 ?auto_494394 ) ) ( CLEAR ?auto_494391 ) ( ON ?auto_494392 ?auto_494393 ) ( CLEAR ?auto_494392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_494379 ?auto_494380 ?auto_494381 ?auto_494382 ?auto_494383 ?auto_494384 ?auto_494385 ?auto_494386 ?auto_494387 ?auto_494388 ?auto_494389 ?auto_494390 ?auto_494391 ?auto_494392 )
      ( MAKE-15PILE ?auto_494379 ?auto_494380 ?auto_494381 ?auto_494382 ?auto_494383 ?auto_494384 ?auto_494385 ?auto_494386 ?auto_494387 ?auto_494388 ?auto_494389 ?auto_494390 ?auto_494391 ?auto_494392 ?auto_494393 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_494441 - BLOCK
      ?auto_494442 - BLOCK
      ?auto_494443 - BLOCK
      ?auto_494444 - BLOCK
      ?auto_494445 - BLOCK
      ?auto_494446 - BLOCK
      ?auto_494447 - BLOCK
      ?auto_494448 - BLOCK
      ?auto_494449 - BLOCK
      ?auto_494450 - BLOCK
      ?auto_494451 - BLOCK
      ?auto_494452 - BLOCK
      ?auto_494453 - BLOCK
      ?auto_494454 - BLOCK
      ?auto_494455 - BLOCK
    )
    :vars
    (
      ?auto_494456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494455 ?auto_494456 ) ( ON-TABLE ?auto_494441 ) ( ON ?auto_494442 ?auto_494441 ) ( ON ?auto_494443 ?auto_494442 ) ( ON ?auto_494444 ?auto_494443 ) ( ON ?auto_494445 ?auto_494444 ) ( ON ?auto_494446 ?auto_494445 ) ( ON ?auto_494447 ?auto_494446 ) ( ON ?auto_494448 ?auto_494447 ) ( ON ?auto_494449 ?auto_494448 ) ( ON ?auto_494450 ?auto_494449 ) ( ON ?auto_494451 ?auto_494450 ) ( ON ?auto_494452 ?auto_494451 ) ( not ( = ?auto_494441 ?auto_494442 ) ) ( not ( = ?auto_494441 ?auto_494443 ) ) ( not ( = ?auto_494441 ?auto_494444 ) ) ( not ( = ?auto_494441 ?auto_494445 ) ) ( not ( = ?auto_494441 ?auto_494446 ) ) ( not ( = ?auto_494441 ?auto_494447 ) ) ( not ( = ?auto_494441 ?auto_494448 ) ) ( not ( = ?auto_494441 ?auto_494449 ) ) ( not ( = ?auto_494441 ?auto_494450 ) ) ( not ( = ?auto_494441 ?auto_494451 ) ) ( not ( = ?auto_494441 ?auto_494452 ) ) ( not ( = ?auto_494441 ?auto_494453 ) ) ( not ( = ?auto_494441 ?auto_494454 ) ) ( not ( = ?auto_494441 ?auto_494455 ) ) ( not ( = ?auto_494441 ?auto_494456 ) ) ( not ( = ?auto_494442 ?auto_494443 ) ) ( not ( = ?auto_494442 ?auto_494444 ) ) ( not ( = ?auto_494442 ?auto_494445 ) ) ( not ( = ?auto_494442 ?auto_494446 ) ) ( not ( = ?auto_494442 ?auto_494447 ) ) ( not ( = ?auto_494442 ?auto_494448 ) ) ( not ( = ?auto_494442 ?auto_494449 ) ) ( not ( = ?auto_494442 ?auto_494450 ) ) ( not ( = ?auto_494442 ?auto_494451 ) ) ( not ( = ?auto_494442 ?auto_494452 ) ) ( not ( = ?auto_494442 ?auto_494453 ) ) ( not ( = ?auto_494442 ?auto_494454 ) ) ( not ( = ?auto_494442 ?auto_494455 ) ) ( not ( = ?auto_494442 ?auto_494456 ) ) ( not ( = ?auto_494443 ?auto_494444 ) ) ( not ( = ?auto_494443 ?auto_494445 ) ) ( not ( = ?auto_494443 ?auto_494446 ) ) ( not ( = ?auto_494443 ?auto_494447 ) ) ( not ( = ?auto_494443 ?auto_494448 ) ) ( not ( = ?auto_494443 ?auto_494449 ) ) ( not ( = ?auto_494443 ?auto_494450 ) ) ( not ( = ?auto_494443 ?auto_494451 ) ) ( not ( = ?auto_494443 ?auto_494452 ) ) ( not ( = ?auto_494443 ?auto_494453 ) ) ( not ( = ?auto_494443 ?auto_494454 ) ) ( not ( = ?auto_494443 ?auto_494455 ) ) ( not ( = ?auto_494443 ?auto_494456 ) ) ( not ( = ?auto_494444 ?auto_494445 ) ) ( not ( = ?auto_494444 ?auto_494446 ) ) ( not ( = ?auto_494444 ?auto_494447 ) ) ( not ( = ?auto_494444 ?auto_494448 ) ) ( not ( = ?auto_494444 ?auto_494449 ) ) ( not ( = ?auto_494444 ?auto_494450 ) ) ( not ( = ?auto_494444 ?auto_494451 ) ) ( not ( = ?auto_494444 ?auto_494452 ) ) ( not ( = ?auto_494444 ?auto_494453 ) ) ( not ( = ?auto_494444 ?auto_494454 ) ) ( not ( = ?auto_494444 ?auto_494455 ) ) ( not ( = ?auto_494444 ?auto_494456 ) ) ( not ( = ?auto_494445 ?auto_494446 ) ) ( not ( = ?auto_494445 ?auto_494447 ) ) ( not ( = ?auto_494445 ?auto_494448 ) ) ( not ( = ?auto_494445 ?auto_494449 ) ) ( not ( = ?auto_494445 ?auto_494450 ) ) ( not ( = ?auto_494445 ?auto_494451 ) ) ( not ( = ?auto_494445 ?auto_494452 ) ) ( not ( = ?auto_494445 ?auto_494453 ) ) ( not ( = ?auto_494445 ?auto_494454 ) ) ( not ( = ?auto_494445 ?auto_494455 ) ) ( not ( = ?auto_494445 ?auto_494456 ) ) ( not ( = ?auto_494446 ?auto_494447 ) ) ( not ( = ?auto_494446 ?auto_494448 ) ) ( not ( = ?auto_494446 ?auto_494449 ) ) ( not ( = ?auto_494446 ?auto_494450 ) ) ( not ( = ?auto_494446 ?auto_494451 ) ) ( not ( = ?auto_494446 ?auto_494452 ) ) ( not ( = ?auto_494446 ?auto_494453 ) ) ( not ( = ?auto_494446 ?auto_494454 ) ) ( not ( = ?auto_494446 ?auto_494455 ) ) ( not ( = ?auto_494446 ?auto_494456 ) ) ( not ( = ?auto_494447 ?auto_494448 ) ) ( not ( = ?auto_494447 ?auto_494449 ) ) ( not ( = ?auto_494447 ?auto_494450 ) ) ( not ( = ?auto_494447 ?auto_494451 ) ) ( not ( = ?auto_494447 ?auto_494452 ) ) ( not ( = ?auto_494447 ?auto_494453 ) ) ( not ( = ?auto_494447 ?auto_494454 ) ) ( not ( = ?auto_494447 ?auto_494455 ) ) ( not ( = ?auto_494447 ?auto_494456 ) ) ( not ( = ?auto_494448 ?auto_494449 ) ) ( not ( = ?auto_494448 ?auto_494450 ) ) ( not ( = ?auto_494448 ?auto_494451 ) ) ( not ( = ?auto_494448 ?auto_494452 ) ) ( not ( = ?auto_494448 ?auto_494453 ) ) ( not ( = ?auto_494448 ?auto_494454 ) ) ( not ( = ?auto_494448 ?auto_494455 ) ) ( not ( = ?auto_494448 ?auto_494456 ) ) ( not ( = ?auto_494449 ?auto_494450 ) ) ( not ( = ?auto_494449 ?auto_494451 ) ) ( not ( = ?auto_494449 ?auto_494452 ) ) ( not ( = ?auto_494449 ?auto_494453 ) ) ( not ( = ?auto_494449 ?auto_494454 ) ) ( not ( = ?auto_494449 ?auto_494455 ) ) ( not ( = ?auto_494449 ?auto_494456 ) ) ( not ( = ?auto_494450 ?auto_494451 ) ) ( not ( = ?auto_494450 ?auto_494452 ) ) ( not ( = ?auto_494450 ?auto_494453 ) ) ( not ( = ?auto_494450 ?auto_494454 ) ) ( not ( = ?auto_494450 ?auto_494455 ) ) ( not ( = ?auto_494450 ?auto_494456 ) ) ( not ( = ?auto_494451 ?auto_494452 ) ) ( not ( = ?auto_494451 ?auto_494453 ) ) ( not ( = ?auto_494451 ?auto_494454 ) ) ( not ( = ?auto_494451 ?auto_494455 ) ) ( not ( = ?auto_494451 ?auto_494456 ) ) ( not ( = ?auto_494452 ?auto_494453 ) ) ( not ( = ?auto_494452 ?auto_494454 ) ) ( not ( = ?auto_494452 ?auto_494455 ) ) ( not ( = ?auto_494452 ?auto_494456 ) ) ( not ( = ?auto_494453 ?auto_494454 ) ) ( not ( = ?auto_494453 ?auto_494455 ) ) ( not ( = ?auto_494453 ?auto_494456 ) ) ( not ( = ?auto_494454 ?auto_494455 ) ) ( not ( = ?auto_494454 ?auto_494456 ) ) ( not ( = ?auto_494455 ?auto_494456 ) ) ( ON ?auto_494454 ?auto_494455 ) ( CLEAR ?auto_494452 ) ( ON ?auto_494453 ?auto_494454 ) ( CLEAR ?auto_494453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_494441 ?auto_494442 ?auto_494443 ?auto_494444 ?auto_494445 ?auto_494446 ?auto_494447 ?auto_494448 ?auto_494449 ?auto_494450 ?auto_494451 ?auto_494452 ?auto_494453 )
      ( MAKE-15PILE ?auto_494441 ?auto_494442 ?auto_494443 ?auto_494444 ?auto_494445 ?auto_494446 ?auto_494447 ?auto_494448 ?auto_494449 ?auto_494450 ?auto_494451 ?auto_494452 ?auto_494453 ?auto_494454 ?auto_494455 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_494503 - BLOCK
      ?auto_494504 - BLOCK
      ?auto_494505 - BLOCK
      ?auto_494506 - BLOCK
      ?auto_494507 - BLOCK
      ?auto_494508 - BLOCK
      ?auto_494509 - BLOCK
      ?auto_494510 - BLOCK
      ?auto_494511 - BLOCK
      ?auto_494512 - BLOCK
      ?auto_494513 - BLOCK
      ?auto_494514 - BLOCK
      ?auto_494515 - BLOCK
      ?auto_494516 - BLOCK
      ?auto_494517 - BLOCK
    )
    :vars
    (
      ?auto_494518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494517 ?auto_494518 ) ( ON-TABLE ?auto_494503 ) ( ON ?auto_494504 ?auto_494503 ) ( ON ?auto_494505 ?auto_494504 ) ( ON ?auto_494506 ?auto_494505 ) ( ON ?auto_494507 ?auto_494506 ) ( ON ?auto_494508 ?auto_494507 ) ( ON ?auto_494509 ?auto_494508 ) ( ON ?auto_494510 ?auto_494509 ) ( ON ?auto_494511 ?auto_494510 ) ( ON ?auto_494512 ?auto_494511 ) ( ON ?auto_494513 ?auto_494512 ) ( not ( = ?auto_494503 ?auto_494504 ) ) ( not ( = ?auto_494503 ?auto_494505 ) ) ( not ( = ?auto_494503 ?auto_494506 ) ) ( not ( = ?auto_494503 ?auto_494507 ) ) ( not ( = ?auto_494503 ?auto_494508 ) ) ( not ( = ?auto_494503 ?auto_494509 ) ) ( not ( = ?auto_494503 ?auto_494510 ) ) ( not ( = ?auto_494503 ?auto_494511 ) ) ( not ( = ?auto_494503 ?auto_494512 ) ) ( not ( = ?auto_494503 ?auto_494513 ) ) ( not ( = ?auto_494503 ?auto_494514 ) ) ( not ( = ?auto_494503 ?auto_494515 ) ) ( not ( = ?auto_494503 ?auto_494516 ) ) ( not ( = ?auto_494503 ?auto_494517 ) ) ( not ( = ?auto_494503 ?auto_494518 ) ) ( not ( = ?auto_494504 ?auto_494505 ) ) ( not ( = ?auto_494504 ?auto_494506 ) ) ( not ( = ?auto_494504 ?auto_494507 ) ) ( not ( = ?auto_494504 ?auto_494508 ) ) ( not ( = ?auto_494504 ?auto_494509 ) ) ( not ( = ?auto_494504 ?auto_494510 ) ) ( not ( = ?auto_494504 ?auto_494511 ) ) ( not ( = ?auto_494504 ?auto_494512 ) ) ( not ( = ?auto_494504 ?auto_494513 ) ) ( not ( = ?auto_494504 ?auto_494514 ) ) ( not ( = ?auto_494504 ?auto_494515 ) ) ( not ( = ?auto_494504 ?auto_494516 ) ) ( not ( = ?auto_494504 ?auto_494517 ) ) ( not ( = ?auto_494504 ?auto_494518 ) ) ( not ( = ?auto_494505 ?auto_494506 ) ) ( not ( = ?auto_494505 ?auto_494507 ) ) ( not ( = ?auto_494505 ?auto_494508 ) ) ( not ( = ?auto_494505 ?auto_494509 ) ) ( not ( = ?auto_494505 ?auto_494510 ) ) ( not ( = ?auto_494505 ?auto_494511 ) ) ( not ( = ?auto_494505 ?auto_494512 ) ) ( not ( = ?auto_494505 ?auto_494513 ) ) ( not ( = ?auto_494505 ?auto_494514 ) ) ( not ( = ?auto_494505 ?auto_494515 ) ) ( not ( = ?auto_494505 ?auto_494516 ) ) ( not ( = ?auto_494505 ?auto_494517 ) ) ( not ( = ?auto_494505 ?auto_494518 ) ) ( not ( = ?auto_494506 ?auto_494507 ) ) ( not ( = ?auto_494506 ?auto_494508 ) ) ( not ( = ?auto_494506 ?auto_494509 ) ) ( not ( = ?auto_494506 ?auto_494510 ) ) ( not ( = ?auto_494506 ?auto_494511 ) ) ( not ( = ?auto_494506 ?auto_494512 ) ) ( not ( = ?auto_494506 ?auto_494513 ) ) ( not ( = ?auto_494506 ?auto_494514 ) ) ( not ( = ?auto_494506 ?auto_494515 ) ) ( not ( = ?auto_494506 ?auto_494516 ) ) ( not ( = ?auto_494506 ?auto_494517 ) ) ( not ( = ?auto_494506 ?auto_494518 ) ) ( not ( = ?auto_494507 ?auto_494508 ) ) ( not ( = ?auto_494507 ?auto_494509 ) ) ( not ( = ?auto_494507 ?auto_494510 ) ) ( not ( = ?auto_494507 ?auto_494511 ) ) ( not ( = ?auto_494507 ?auto_494512 ) ) ( not ( = ?auto_494507 ?auto_494513 ) ) ( not ( = ?auto_494507 ?auto_494514 ) ) ( not ( = ?auto_494507 ?auto_494515 ) ) ( not ( = ?auto_494507 ?auto_494516 ) ) ( not ( = ?auto_494507 ?auto_494517 ) ) ( not ( = ?auto_494507 ?auto_494518 ) ) ( not ( = ?auto_494508 ?auto_494509 ) ) ( not ( = ?auto_494508 ?auto_494510 ) ) ( not ( = ?auto_494508 ?auto_494511 ) ) ( not ( = ?auto_494508 ?auto_494512 ) ) ( not ( = ?auto_494508 ?auto_494513 ) ) ( not ( = ?auto_494508 ?auto_494514 ) ) ( not ( = ?auto_494508 ?auto_494515 ) ) ( not ( = ?auto_494508 ?auto_494516 ) ) ( not ( = ?auto_494508 ?auto_494517 ) ) ( not ( = ?auto_494508 ?auto_494518 ) ) ( not ( = ?auto_494509 ?auto_494510 ) ) ( not ( = ?auto_494509 ?auto_494511 ) ) ( not ( = ?auto_494509 ?auto_494512 ) ) ( not ( = ?auto_494509 ?auto_494513 ) ) ( not ( = ?auto_494509 ?auto_494514 ) ) ( not ( = ?auto_494509 ?auto_494515 ) ) ( not ( = ?auto_494509 ?auto_494516 ) ) ( not ( = ?auto_494509 ?auto_494517 ) ) ( not ( = ?auto_494509 ?auto_494518 ) ) ( not ( = ?auto_494510 ?auto_494511 ) ) ( not ( = ?auto_494510 ?auto_494512 ) ) ( not ( = ?auto_494510 ?auto_494513 ) ) ( not ( = ?auto_494510 ?auto_494514 ) ) ( not ( = ?auto_494510 ?auto_494515 ) ) ( not ( = ?auto_494510 ?auto_494516 ) ) ( not ( = ?auto_494510 ?auto_494517 ) ) ( not ( = ?auto_494510 ?auto_494518 ) ) ( not ( = ?auto_494511 ?auto_494512 ) ) ( not ( = ?auto_494511 ?auto_494513 ) ) ( not ( = ?auto_494511 ?auto_494514 ) ) ( not ( = ?auto_494511 ?auto_494515 ) ) ( not ( = ?auto_494511 ?auto_494516 ) ) ( not ( = ?auto_494511 ?auto_494517 ) ) ( not ( = ?auto_494511 ?auto_494518 ) ) ( not ( = ?auto_494512 ?auto_494513 ) ) ( not ( = ?auto_494512 ?auto_494514 ) ) ( not ( = ?auto_494512 ?auto_494515 ) ) ( not ( = ?auto_494512 ?auto_494516 ) ) ( not ( = ?auto_494512 ?auto_494517 ) ) ( not ( = ?auto_494512 ?auto_494518 ) ) ( not ( = ?auto_494513 ?auto_494514 ) ) ( not ( = ?auto_494513 ?auto_494515 ) ) ( not ( = ?auto_494513 ?auto_494516 ) ) ( not ( = ?auto_494513 ?auto_494517 ) ) ( not ( = ?auto_494513 ?auto_494518 ) ) ( not ( = ?auto_494514 ?auto_494515 ) ) ( not ( = ?auto_494514 ?auto_494516 ) ) ( not ( = ?auto_494514 ?auto_494517 ) ) ( not ( = ?auto_494514 ?auto_494518 ) ) ( not ( = ?auto_494515 ?auto_494516 ) ) ( not ( = ?auto_494515 ?auto_494517 ) ) ( not ( = ?auto_494515 ?auto_494518 ) ) ( not ( = ?auto_494516 ?auto_494517 ) ) ( not ( = ?auto_494516 ?auto_494518 ) ) ( not ( = ?auto_494517 ?auto_494518 ) ) ( ON ?auto_494516 ?auto_494517 ) ( ON ?auto_494515 ?auto_494516 ) ( CLEAR ?auto_494513 ) ( ON ?auto_494514 ?auto_494515 ) ( CLEAR ?auto_494514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_494503 ?auto_494504 ?auto_494505 ?auto_494506 ?auto_494507 ?auto_494508 ?auto_494509 ?auto_494510 ?auto_494511 ?auto_494512 ?auto_494513 ?auto_494514 )
      ( MAKE-15PILE ?auto_494503 ?auto_494504 ?auto_494505 ?auto_494506 ?auto_494507 ?auto_494508 ?auto_494509 ?auto_494510 ?auto_494511 ?auto_494512 ?auto_494513 ?auto_494514 ?auto_494515 ?auto_494516 ?auto_494517 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_494565 - BLOCK
      ?auto_494566 - BLOCK
      ?auto_494567 - BLOCK
      ?auto_494568 - BLOCK
      ?auto_494569 - BLOCK
      ?auto_494570 - BLOCK
      ?auto_494571 - BLOCK
      ?auto_494572 - BLOCK
      ?auto_494573 - BLOCK
      ?auto_494574 - BLOCK
      ?auto_494575 - BLOCK
      ?auto_494576 - BLOCK
      ?auto_494577 - BLOCK
      ?auto_494578 - BLOCK
      ?auto_494579 - BLOCK
    )
    :vars
    (
      ?auto_494580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494579 ?auto_494580 ) ( ON-TABLE ?auto_494565 ) ( ON ?auto_494566 ?auto_494565 ) ( ON ?auto_494567 ?auto_494566 ) ( ON ?auto_494568 ?auto_494567 ) ( ON ?auto_494569 ?auto_494568 ) ( ON ?auto_494570 ?auto_494569 ) ( ON ?auto_494571 ?auto_494570 ) ( ON ?auto_494572 ?auto_494571 ) ( ON ?auto_494573 ?auto_494572 ) ( ON ?auto_494574 ?auto_494573 ) ( not ( = ?auto_494565 ?auto_494566 ) ) ( not ( = ?auto_494565 ?auto_494567 ) ) ( not ( = ?auto_494565 ?auto_494568 ) ) ( not ( = ?auto_494565 ?auto_494569 ) ) ( not ( = ?auto_494565 ?auto_494570 ) ) ( not ( = ?auto_494565 ?auto_494571 ) ) ( not ( = ?auto_494565 ?auto_494572 ) ) ( not ( = ?auto_494565 ?auto_494573 ) ) ( not ( = ?auto_494565 ?auto_494574 ) ) ( not ( = ?auto_494565 ?auto_494575 ) ) ( not ( = ?auto_494565 ?auto_494576 ) ) ( not ( = ?auto_494565 ?auto_494577 ) ) ( not ( = ?auto_494565 ?auto_494578 ) ) ( not ( = ?auto_494565 ?auto_494579 ) ) ( not ( = ?auto_494565 ?auto_494580 ) ) ( not ( = ?auto_494566 ?auto_494567 ) ) ( not ( = ?auto_494566 ?auto_494568 ) ) ( not ( = ?auto_494566 ?auto_494569 ) ) ( not ( = ?auto_494566 ?auto_494570 ) ) ( not ( = ?auto_494566 ?auto_494571 ) ) ( not ( = ?auto_494566 ?auto_494572 ) ) ( not ( = ?auto_494566 ?auto_494573 ) ) ( not ( = ?auto_494566 ?auto_494574 ) ) ( not ( = ?auto_494566 ?auto_494575 ) ) ( not ( = ?auto_494566 ?auto_494576 ) ) ( not ( = ?auto_494566 ?auto_494577 ) ) ( not ( = ?auto_494566 ?auto_494578 ) ) ( not ( = ?auto_494566 ?auto_494579 ) ) ( not ( = ?auto_494566 ?auto_494580 ) ) ( not ( = ?auto_494567 ?auto_494568 ) ) ( not ( = ?auto_494567 ?auto_494569 ) ) ( not ( = ?auto_494567 ?auto_494570 ) ) ( not ( = ?auto_494567 ?auto_494571 ) ) ( not ( = ?auto_494567 ?auto_494572 ) ) ( not ( = ?auto_494567 ?auto_494573 ) ) ( not ( = ?auto_494567 ?auto_494574 ) ) ( not ( = ?auto_494567 ?auto_494575 ) ) ( not ( = ?auto_494567 ?auto_494576 ) ) ( not ( = ?auto_494567 ?auto_494577 ) ) ( not ( = ?auto_494567 ?auto_494578 ) ) ( not ( = ?auto_494567 ?auto_494579 ) ) ( not ( = ?auto_494567 ?auto_494580 ) ) ( not ( = ?auto_494568 ?auto_494569 ) ) ( not ( = ?auto_494568 ?auto_494570 ) ) ( not ( = ?auto_494568 ?auto_494571 ) ) ( not ( = ?auto_494568 ?auto_494572 ) ) ( not ( = ?auto_494568 ?auto_494573 ) ) ( not ( = ?auto_494568 ?auto_494574 ) ) ( not ( = ?auto_494568 ?auto_494575 ) ) ( not ( = ?auto_494568 ?auto_494576 ) ) ( not ( = ?auto_494568 ?auto_494577 ) ) ( not ( = ?auto_494568 ?auto_494578 ) ) ( not ( = ?auto_494568 ?auto_494579 ) ) ( not ( = ?auto_494568 ?auto_494580 ) ) ( not ( = ?auto_494569 ?auto_494570 ) ) ( not ( = ?auto_494569 ?auto_494571 ) ) ( not ( = ?auto_494569 ?auto_494572 ) ) ( not ( = ?auto_494569 ?auto_494573 ) ) ( not ( = ?auto_494569 ?auto_494574 ) ) ( not ( = ?auto_494569 ?auto_494575 ) ) ( not ( = ?auto_494569 ?auto_494576 ) ) ( not ( = ?auto_494569 ?auto_494577 ) ) ( not ( = ?auto_494569 ?auto_494578 ) ) ( not ( = ?auto_494569 ?auto_494579 ) ) ( not ( = ?auto_494569 ?auto_494580 ) ) ( not ( = ?auto_494570 ?auto_494571 ) ) ( not ( = ?auto_494570 ?auto_494572 ) ) ( not ( = ?auto_494570 ?auto_494573 ) ) ( not ( = ?auto_494570 ?auto_494574 ) ) ( not ( = ?auto_494570 ?auto_494575 ) ) ( not ( = ?auto_494570 ?auto_494576 ) ) ( not ( = ?auto_494570 ?auto_494577 ) ) ( not ( = ?auto_494570 ?auto_494578 ) ) ( not ( = ?auto_494570 ?auto_494579 ) ) ( not ( = ?auto_494570 ?auto_494580 ) ) ( not ( = ?auto_494571 ?auto_494572 ) ) ( not ( = ?auto_494571 ?auto_494573 ) ) ( not ( = ?auto_494571 ?auto_494574 ) ) ( not ( = ?auto_494571 ?auto_494575 ) ) ( not ( = ?auto_494571 ?auto_494576 ) ) ( not ( = ?auto_494571 ?auto_494577 ) ) ( not ( = ?auto_494571 ?auto_494578 ) ) ( not ( = ?auto_494571 ?auto_494579 ) ) ( not ( = ?auto_494571 ?auto_494580 ) ) ( not ( = ?auto_494572 ?auto_494573 ) ) ( not ( = ?auto_494572 ?auto_494574 ) ) ( not ( = ?auto_494572 ?auto_494575 ) ) ( not ( = ?auto_494572 ?auto_494576 ) ) ( not ( = ?auto_494572 ?auto_494577 ) ) ( not ( = ?auto_494572 ?auto_494578 ) ) ( not ( = ?auto_494572 ?auto_494579 ) ) ( not ( = ?auto_494572 ?auto_494580 ) ) ( not ( = ?auto_494573 ?auto_494574 ) ) ( not ( = ?auto_494573 ?auto_494575 ) ) ( not ( = ?auto_494573 ?auto_494576 ) ) ( not ( = ?auto_494573 ?auto_494577 ) ) ( not ( = ?auto_494573 ?auto_494578 ) ) ( not ( = ?auto_494573 ?auto_494579 ) ) ( not ( = ?auto_494573 ?auto_494580 ) ) ( not ( = ?auto_494574 ?auto_494575 ) ) ( not ( = ?auto_494574 ?auto_494576 ) ) ( not ( = ?auto_494574 ?auto_494577 ) ) ( not ( = ?auto_494574 ?auto_494578 ) ) ( not ( = ?auto_494574 ?auto_494579 ) ) ( not ( = ?auto_494574 ?auto_494580 ) ) ( not ( = ?auto_494575 ?auto_494576 ) ) ( not ( = ?auto_494575 ?auto_494577 ) ) ( not ( = ?auto_494575 ?auto_494578 ) ) ( not ( = ?auto_494575 ?auto_494579 ) ) ( not ( = ?auto_494575 ?auto_494580 ) ) ( not ( = ?auto_494576 ?auto_494577 ) ) ( not ( = ?auto_494576 ?auto_494578 ) ) ( not ( = ?auto_494576 ?auto_494579 ) ) ( not ( = ?auto_494576 ?auto_494580 ) ) ( not ( = ?auto_494577 ?auto_494578 ) ) ( not ( = ?auto_494577 ?auto_494579 ) ) ( not ( = ?auto_494577 ?auto_494580 ) ) ( not ( = ?auto_494578 ?auto_494579 ) ) ( not ( = ?auto_494578 ?auto_494580 ) ) ( not ( = ?auto_494579 ?auto_494580 ) ) ( ON ?auto_494578 ?auto_494579 ) ( ON ?auto_494577 ?auto_494578 ) ( ON ?auto_494576 ?auto_494577 ) ( CLEAR ?auto_494574 ) ( ON ?auto_494575 ?auto_494576 ) ( CLEAR ?auto_494575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_494565 ?auto_494566 ?auto_494567 ?auto_494568 ?auto_494569 ?auto_494570 ?auto_494571 ?auto_494572 ?auto_494573 ?auto_494574 ?auto_494575 )
      ( MAKE-15PILE ?auto_494565 ?auto_494566 ?auto_494567 ?auto_494568 ?auto_494569 ?auto_494570 ?auto_494571 ?auto_494572 ?auto_494573 ?auto_494574 ?auto_494575 ?auto_494576 ?auto_494577 ?auto_494578 ?auto_494579 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_494627 - BLOCK
      ?auto_494628 - BLOCK
      ?auto_494629 - BLOCK
      ?auto_494630 - BLOCK
      ?auto_494631 - BLOCK
      ?auto_494632 - BLOCK
      ?auto_494633 - BLOCK
      ?auto_494634 - BLOCK
      ?auto_494635 - BLOCK
      ?auto_494636 - BLOCK
      ?auto_494637 - BLOCK
      ?auto_494638 - BLOCK
      ?auto_494639 - BLOCK
      ?auto_494640 - BLOCK
      ?auto_494641 - BLOCK
    )
    :vars
    (
      ?auto_494642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494641 ?auto_494642 ) ( ON-TABLE ?auto_494627 ) ( ON ?auto_494628 ?auto_494627 ) ( ON ?auto_494629 ?auto_494628 ) ( ON ?auto_494630 ?auto_494629 ) ( ON ?auto_494631 ?auto_494630 ) ( ON ?auto_494632 ?auto_494631 ) ( ON ?auto_494633 ?auto_494632 ) ( ON ?auto_494634 ?auto_494633 ) ( ON ?auto_494635 ?auto_494634 ) ( not ( = ?auto_494627 ?auto_494628 ) ) ( not ( = ?auto_494627 ?auto_494629 ) ) ( not ( = ?auto_494627 ?auto_494630 ) ) ( not ( = ?auto_494627 ?auto_494631 ) ) ( not ( = ?auto_494627 ?auto_494632 ) ) ( not ( = ?auto_494627 ?auto_494633 ) ) ( not ( = ?auto_494627 ?auto_494634 ) ) ( not ( = ?auto_494627 ?auto_494635 ) ) ( not ( = ?auto_494627 ?auto_494636 ) ) ( not ( = ?auto_494627 ?auto_494637 ) ) ( not ( = ?auto_494627 ?auto_494638 ) ) ( not ( = ?auto_494627 ?auto_494639 ) ) ( not ( = ?auto_494627 ?auto_494640 ) ) ( not ( = ?auto_494627 ?auto_494641 ) ) ( not ( = ?auto_494627 ?auto_494642 ) ) ( not ( = ?auto_494628 ?auto_494629 ) ) ( not ( = ?auto_494628 ?auto_494630 ) ) ( not ( = ?auto_494628 ?auto_494631 ) ) ( not ( = ?auto_494628 ?auto_494632 ) ) ( not ( = ?auto_494628 ?auto_494633 ) ) ( not ( = ?auto_494628 ?auto_494634 ) ) ( not ( = ?auto_494628 ?auto_494635 ) ) ( not ( = ?auto_494628 ?auto_494636 ) ) ( not ( = ?auto_494628 ?auto_494637 ) ) ( not ( = ?auto_494628 ?auto_494638 ) ) ( not ( = ?auto_494628 ?auto_494639 ) ) ( not ( = ?auto_494628 ?auto_494640 ) ) ( not ( = ?auto_494628 ?auto_494641 ) ) ( not ( = ?auto_494628 ?auto_494642 ) ) ( not ( = ?auto_494629 ?auto_494630 ) ) ( not ( = ?auto_494629 ?auto_494631 ) ) ( not ( = ?auto_494629 ?auto_494632 ) ) ( not ( = ?auto_494629 ?auto_494633 ) ) ( not ( = ?auto_494629 ?auto_494634 ) ) ( not ( = ?auto_494629 ?auto_494635 ) ) ( not ( = ?auto_494629 ?auto_494636 ) ) ( not ( = ?auto_494629 ?auto_494637 ) ) ( not ( = ?auto_494629 ?auto_494638 ) ) ( not ( = ?auto_494629 ?auto_494639 ) ) ( not ( = ?auto_494629 ?auto_494640 ) ) ( not ( = ?auto_494629 ?auto_494641 ) ) ( not ( = ?auto_494629 ?auto_494642 ) ) ( not ( = ?auto_494630 ?auto_494631 ) ) ( not ( = ?auto_494630 ?auto_494632 ) ) ( not ( = ?auto_494630 ?auto_494633 ) ) ( not ( = ?auto_494630 ?auto_494634 ) ) ( not ( = ?auto_494630 ?auto_494635 ) ) ( not ( = ?auto_494630 ?auto_494636 ) ) ( not ( = ?auto_494630 ?auto_494637 ) ) ( not ( = ?auto_494630 ?auto_494638 ) ) ( not ( = ?auto_494630 ?auto_494639 ) ) ( not ( = ?auto_494630 ?auto_494640 ) ) ( not ( = ?auto_494630 ?auto_494641 ) ) ( not ( = ?auto_494630 ?auto_494642 ) ) ( not ( = ?auto_494631 ?auto_494632 ) ) ( not ( = ?auto_494631 ?auto_494633 ) ) ( not ( = ?auto_494631 ?auto_494634 ) ) ( not ( = ?auto_494631 ?auto_494635 ) ) ( not ( = ?auto_494631 ?auto_494636 ) ) ( not ( = ?auto_494631 ?auto_494637 ) ) ( not ( = ?auto_494631 ?auto_494638 ) ) ( not ( = ?auto_494631 ?auto_494639 ) ) ( not ( = ?auto_494631 ?auto_494640 ) ) ( not ( = ?auto_494631 ?auto_494641 ) ) ( not ( = ?auto_494631 ?auto_494642 ) ) ( not ( = ?auto_494632 ?auto_494633 ) ) ( not ( = ?auto_494632 ?auto_494634 ) ) ( not ( = ?auto_494632 ?auto_494635 ) ) ( not ( = ?auto_494632 ?auto_494636 ) ) ( not ( = ?auto_494632 ?auto_494637 ) ) ( not ( = ?auto_494632 ?auto_494638 ) ) ( not ( = ?auto_494632 ?auto_494639 ) ) ( not ( = ?auto_494632 ?auto_494640 ) ) ( not ( = ?auto_494632 ?auto_494641 ) ) ( not ( = ?auto_494632 ?auto_494642 ) ) ( not ( = ?auto_494633 ?auto_494634 ) ) ( not ( = ?auto_494633 ?auto_494635 ) ) ( not ( = ?auto_494633 ?auto_494636 ) ) ( not ( = ?auto_494633 ?auto_494637 ) ) ( not ( = ?auto_494633 ?auto_494638 ) ) ( not ( = ?auto_494633 ?auto_494639 ) ) ( not ( = ?auto_494633 ?auto_494640 ) ) ( not ( = ?auto_494633 ?auto_494641 ) ) ( not ( = ?auto_494633 ?auto_494642 ) ) ( not ( = ?auto_494634 ?auto_494635 ) ) ( not ( = ?auto_494634 ?auto_494636 ) ) ( not ( = ?auto_494634 ?auto_494637 ) ) ( not ( = ?auto_494634 ?auto_494638 ) ) ( not ( = ?auto_494634 ?auto_494639 ) ) ( not ( = ?auto_494634 ?auto_494640 ) ) ( not ( = ?auto_494634 ?auto_494641 ) ) ( not ( = ?auto_494634 ?auto_494642 ) ) ( not ( = ?auto_494635 ?auto_494636 ) ) ( not ( = ?auto_494635 ?auto_494637 ) ) ( not ( = ?auto_494635 ?auto_494638 ) ) ( not ( = ?auto_494635 ?auto_494639 ) ) ( not ( = ?auto_494635 ?auto_494640 ) ) ( not ( = ?auto_494635 ?auto_494641 ) ) ( not ( = ?auto_494635 ?auto_494642 ) ) ( not ( = ?auto_494636 ?auto_494637 ) ) ( not ( = ?auto_494636 ?auto_494638 ) ) ( not ( = ?auto_494636 ?auto_494639 ) ) ( not ( = ?auto_494636 ?auto_494640 ) ) ( not ( = ?auto_494636 ?auto_494641 ) ) ( not ( = ?auto_494636 ?auto_494642 ) ) ( not ( = ?auto_494637 ?auto_494638 ) ) ( not ( = ?auto_494637 ?auto_494639 ) ) ( not ( = ?auto_494637 ?auto_494640 ) ) ( not ( = ?auto_494637 ?auto_494641 ) ) ( not ( = ?auto_494637 ?auto_494642 ) ) ( not ( = ?auto_494638 ?auto_494639 ) ) ( not ( = ?auto_494638 ?auto_494640 ) ) ( not ( = ?auto_494638 ?auto_494641 ) ) ( not ( = ?auto_494638 ?auto_494642 ) ) ( not ( = ?auto_494639 ?auto_494640 ) ) ( not ( = ?auto_494639 ?auto_494641 ) ) ( not ( = ?auto_494639 ?auto_494642 ) ) ( not ( = ?auto_494640 ?auto_494641 ) ) ( not ( = ?auto_494640 ?auto_494642 ) ) ( not ( = ?auto_494641 ?auto_494642 ) ) ( ON ?auto_494640 ?auto_494641 ) ( ON ?auto_494639 ?auto_494640 ) ( ON ?auto_494638 ?auto_494639 ) ( ON ?auto_494637 ?auto_494638 ) ( CLEAR ?auto_494635 ) ( ON ?auto_494636 ?auto_494637 ) ( CLEAR ?auto_494636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_494627 ?auto_494628 ?auto_494629 ?auto_494630 ?auto_494631 ?auto_494632 ?auto_494633 ?auto_494634 ?auto_494635 ?auto_494636 )
      ( MAKE-15PILE ?auto_494627 ?auto_494628 ?auto_494629 ?auto_494630 ?auto_494631 ?auto_494632 ?auto_494633 ?auto_494634 ?auto_494635 ?auto_494636 ?auto_494637 ?auto_494638 ?auto_494639 ?auto_494640 ?auto_494641 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_494689 - BLOCK
      ?auto_494690 - BLOCK
      ?auto_494691 - BLOCK
      ?auto_494692 - BLOCK
      ?auto_494693 - BLOCK
      ?auto_494694 - BLOCK
      ?auto_494695 - BLOCK
      ?auto_494696 - BLOCK
      ?auto_494697 - BLOCK
      ?auto_494698 - BLOCK
      ?auto_494699 - BLOCK
      ?auto_494700 - BLOCK
      ?auto_494701 - BLOCK
      ?auto_494702 - BLOCK
      ?auto_494703 - BLOCK
    )
    :vars
    (
      ?auto_494704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494703 ?auto_494704 ) ( ON-TABLE ?auto_494689 ) ( ON ?auto_494690 ?auto_494689 ) ( ON ?auto_494691 ?auto_494690 ) ( ON ?auto_494692 ?auto_494691 ) ( ON ?auto_494693 ?auto_494692 ) ( ON ?auto_494694 ?auto_494693 ) ( ON ?auto_494695 ?auto_494694 ) ( ON ?auto_494696 ?auto_494695 ) ( not ( = ?auto_494689 ?auto_494690 ) ) ( not ( = ?auto_494689 ?auto_494691 ) ) ( not ( = ?auto_494689 ?auto_494692 ) ) ( not ( = ?auto_494689 ?auto_494693 ) ) ( not ( = ?auto_494689 ?auto_494694 ) ) ( not ( = ?auto_494689 ?auto_494695 ) ) ( not ( = ?auto_494689 ?auto_494696 ) ) ( not ( = ?auto_494689 ?auto_494697 ) ) ( not ( = ?auto_494689 ?auto_494698 ) ) ( not ( = ?auto_494689 ?auto_494699 ) ) ( not ( = ?auto_494689 ?auto_494700 ) ) ( not ( = ?auto_494689 ?auto_494701 ) ) ( not ( = ?auto_494689 ?auto_494702 ) ) ( not ( = ?auto_494689 ?auto_494703 ) ) ( not ( = ?auto_494689 ?auto_494704 ) ) ( not ( = ?auto_494690 ?auto_494691 ) ) ( not ( = ?auto_494690 ?auto_494692 ) ) ( not ( = ?auto_494690 ?auto_494693 ) ) ( not ( = ?auto_494690 ?auto_494694 ) ) ( not ( = ?auto_494690 ?auto_494695 ) ) ( not ( = ?auto_494690 ?auto_494696 ) ) ( not ( = ?auto_494690 ?auto_494697 ) ) ( not ( = ?auto_494690 ?auto_494698 ) ) ( not ( = ?auto_494690 ?auto_494699 ) ) ( not ( = ?auto_494690 ?auto_494700 ) ) ( not ( = ?auto_494690 ?auto_494701 ) ) ( not ( = ?auto_494690 ?auto_494702 ) ) ( not ( = ?auto_494690 ?auto_494703 ) ) ( not ( = ?auto_494690 ?auto_494704 ) ) ( not ( = ?auto_494691 ?auto_494692 ) ) ( not ( = ?auto_494691 ?auto_494693 ) ) ( not ( = ?auto_494691 ?auto_494694 ) ) ( not ( = ?auto_494691 ?auto_494695 ) ) ( not ( = ?auto_494691 ?auto_494696 ) ) ( not ( = ?auto_494691 ?auto_494697 ) ) ( not ( = ?auto_494691 ?auto_494698 ) ) ( not ( = ?auto_494691 ?auto_494699 ) ) ( not ( = ?auto_494691 ?auto_494700 ) ) ( not ( = ?auto_494691 ?auto_494701 ) ) ( not ( = ?auto_494691 ?auto_494702 ) ) ( not ( = ?auto_494691 ?auto_494703 ) ) ( not ( = ?auto_494691 ?auto_494704 ) ) ( not ( = ?auto_494692 ?auto_494693 ) ) ( not ( = ?auto_494692 ?auto_494694 ) ) ( not ( = ?auto_494692 ?auto_494695 ) ) ( not ( = ?auto_494692 ?auto_494696 ) ) ( not ( = ?auto_494692 ?auto_494697 ) ) ( not ( = ?auto_494692 ?auto_494698 ) ) ( not ( = ?auto_494692 ?auto_494699 ) ) ( not ( = ?auto_494692 ?auto_494700 ) ) ( not ( = ?auto_494692 ?auto_494701 ) ) ( not ( = ?auto_494692 ?auto_494702 ) ) ( not ( = ?auto_494692 ?auto_494703 ) ) ( not ( = ?auto_494692 ?auto_494704 ) ) ( not ( = ?auto_494693 ?auto_494694 ) ) ( not ( = ?auto_494693 ?auto_494695 ) ) ( not ( = ?auto_494693 ?auto_494696 ) ) ( not ( = ?auto_494693 ?auto_494697 ) ) ( not ( = ?auto_494693 ?auto_494698 ) ) ( not ( = ?auto_494693 ?auto_494699 ) ) ( not ( = ?auto_494693 ?auto_494700 ) ) ( not ( = ?auto_494693 ?auto_494701 ) ) ( not ( = ?auto_494693 ?auto_494702 ) ) ( not ( = ?auto_494693 ?auto_494703 ) ) ( not ( = ?auto_494693 ?auto_494704 ) ) ( not ( = ?auto_494694 ?auto_494695 ) ) ( not ( = ?auto_494694 ?auto_494696 ) ) ( not ( = ?auto_494694 ?auto_494697 ) ) ( not ( = ?auto_494694 ?auto_494698 ) ) ( not ( = ?auto_494694 ?auto_494699 ) ) ( not ( = ?auto_494694 ?auto_494700 ) ) ( not ( = ?auto_494694 ?auto_494701 ) ) ( not ( = ?auto_494694 ?auto_494702 ) ) ( not ( = ?auto_494694 ?auto_494703 ) ) ( not ( = ?auto_494694 ?auto_494704 ) ) ( not ( = ?auto_494695 ?auto_494696 ) ) ( not ( = ?auto_494695 ?auto_494697 ) ) ( not ( = ?auto_494695 ?auto_494698 ) ) ( not ( = ?auto_494695 ?auto_494699 ) ) ( not ( = ?auto_494695 ?auto_494700 ) ) ( not ( = ?auto_494695 ?auto_494701 ) ) ( not ( = ?auto_494695 ?auto_494702 ) ) ( not ( = ?auto_494695 ?auto_494703 ) ) ( not ( = ?auto_494695 ?auto_494704 ) ) ( not ( = ?auto_494696 ?auto_494697 ) ) ( not ( = ?auto_494696 ?auto_494698 ) ) ( not ( = ?auto_494696 ?auto_494699 ) ) ( not ( = ?auto_494696 ?auto_494700 ) ) ( not ( = ?auto_494696 ?auto_494701 ) ) ( not ( = ?auto_494696 ?auto_494702 ) ) ( not ( = ?auto_494696 ?auto_494703 ) ) ( not ( = ?auto_494696 ?auto_494704 ) ) ( not ( = ?auto_494697 ?auto_494698 ) ) ( not ( = ?auto_494697 ?auto_494699 ) ) ( not ( = ?auto_494697 ?auto_494700 ) ) ( not ( = ?auto_494697 ?auto_494701 ) ) ( not ( = ?auto_494697 ?auto_494702 ) ) ( not ( = ?auto_494697 ?auto_494703 ) ) ( not ( = ?auto_494697 ?auto_494704 ) ) ( not ( = ?auto_494698 ?auto_494699 ) ) ( not ( = ?auto_494698 ?auto_494700 ) ) ( not ( = ?auto_494698 ?auto_494701 ) ) ( not ( = ?auto_494698 ?auto_494702 ) ) ( not ( = ?auto_494698 ?auto_494703 ) ) ( not ( = ?auto_494698 ?auto_494704 ) ) ( not ( = ?auto_494699 ?auto_494700 ) ) ( not ( = ?auto_494699 ?auto_494701 ) ) ( not ( = ?auto_494699 ?auto_494702 ) ) ( not ( = ?auto_494699 ?auto_494703 ) ) ( not ( = ?auto_494699 ?auto_494704 ) ) ( not ( = ?auto_494700 ?auto_494701 ) ) ( not ( = ?auto_494700 ?auto_494702 ) ) ( not ( = ?auto_494700 ?auto_494703 ) ) ( not ( = ?auto_494700 ?auto_494704 ) ) ( not ( = ?auto_494701 ?auto_494702 ) ) ( not ( = ?auto_494701 ?auto_494703 ) ) ( not ( = ?auto_494701 ?auto_494704 ) ) ( not ( = ?auto_494702 ?auto_494703 ) ) ( not ( = ?auto_494702 ?auto_494704 ) ) ( not ( = ?auto_494703 ?auto_494704 ) ) ( ON ?auto_494702 ?auto_494703 ) ( ON ?auto_494701 ?auto_494702 ) ( ON ?auto_494700 ?auto_494701 ) ( ON ?auto_494699 ?auto_494700 ) ( ON ?auto_494698 ?auto_494699 ) ( CLEAR ?auto_494696 ) ( ON ?auto_494697 ?auto_494698 ) ( CLEAR ?auto_494697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_494689 ?auto_494690 ?auto_494691 ?auto_494692 ?auto_494693 ?auto_494694 ?auto_494695 ?auto_494696 ?auto_494697 )
      ( MAKE-15PILE ?auto_494689 ?auto_494690 ?auto_494691 ?auto_494692 ?auto_494693 ?auto_494694 ?auto_494695 ?auto_494696 ?auto_494697 ?auto_494698 ?auto_494699 ?auto_494700 ?auto_494701 ?auto_494702 ?auto_494703 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_494751 - BLOCK
      ?auto_494752 - BLOCK
      ?auto_494753 - BLOCK
      ?auto_494754 - BLOCK
      ?auto_494755 - BLOCK
      ?auto_494756 - BLOCK
      ?auto_494757 - BLOCK
      ?auto_494758 - BLOCK
      ?auto_494759 - BLOCK
      ?auto_494760 - BLOCK
      ?auto_494761 - BLOCK
      ?auto_494762 - BLOCK
      ?auto_494763 - BLOCK
      ?auto_494764 - BLOCK
      ?auto_494765 - BLOCK
    )
    :vars
    (
      ?auto_494766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494765 ?auto_494766 ) ( ON-TABLE ?auto_494751 ) ( ON ?auto_494752 ?auto_494751 ) ( ON ?auto_494753 ?auto_494752 ) ( ON ?auto_494754 ?auto_494753 ) ( ON ?auto_494755 ?auto_494754 ) ( ON ?auto_494756 ?auto_494755 ) ( ON ?auto_494757 ?auto_494756 ) ( not ( = ?auto_494751 ?auto_494752 ) ) ( not ( = ?auto_494751 ?auto_494753 ) ) ( not ( = ?auto_494751 ?auto_494754 ) ) ( not ( = ?auto_494751 ?auto_494755 ) ) ( not ( = ?auto_494751 ?auto_494756 ) ) ( not ( = ?auto_494751 ?auto_494757 ) ) ( not ( = ?auto_494751 ?auto_494758 ) ) ( not ( = ?auto_494751 ?auto_494759 ) ) ( not ( = ?auto_494751 ?auto_494760 ) ) ( not ( = ?auto_494751 ?auto_494761 ) ) ( not ( = ?auto_494751 ?auto_494762 ) ) ( not ( = ?auto_494751 ?auto_494763 ) ) ( not ( = ?auto_494751 ?auto_494764 ) ) ( not ( = ?auto_494751 ?auto_494765 ) ) ( not ( = ?auto_494751 ?auto_494766 ) ) ( not ( = ?auto_494752 ?auto_494753 ) ) ( not ( = ?auto_494752 ?auto_494754 ) ) ( not ( = ?auto_494752 ?auto_494755 ) ) ( not ( = ?auto_494752 ?auto_494756 ) ) ( not ( = ?auto_494752 ?auto_494757 ) ) ( not ( = ?auto_494752 ?auto_494758 ) ) ( not ( = ?auto_494752 ?auto_494759 ) ) ( not ( = ?auto_494752 ?auto_494760 ) ) ( not ( = ?auto_494752 ?auto_494761 ) ) ( not ( = ?auto_494752 ?auto_494762 ) ) ( not ( = ?auto_494752 ?auto_494763 ) ) ( not ( = ?auto_494752 ?auto_494764 ) ) ( not ( = ?auto_494752 ?auto_494765 ) ) ( not ( = ?auto_494752 ?auto_494766 ) ) ( not ( = ?auto_494753 ?auto_494754 ) ) ( not ( = ?auto_494753 ?auto_494755 ) ) ( not ( = ?auto_494753 ?auto_494756 ) ) ( not ( = ?auto_494753 ?auto_494757 ) ) ( not ( = ?auto_494753 ?auto_494758 ) ) ( not ( = ?auto_494753 ?auto_494759 ) ) ( not ( = ?auto_494753 ?auto_494760 ) ) ( not ( = ?auto_494753 ?auto_494761 ) ) ( not ( = ?auto_494753 ?auto_494762 ) ) ( not ( = ?auto_494753 ?auto_494763 ) ) ( not ( = ?auto_494753 ?auto_494764 ) ) ( not ( = ?auto_494753 ?auto_494765 ) ) ( not ( = ?auto_494753 ?auto_494766 ) ) ( not ( = ?auto_494754 ?auto_494755 ) ) ( not ( = ?auto_494754 ?auto_494756 ) ) ( not ( = ?auto_494754 ?auto_494757 ) ) ( not ( = ?auto_494754 ?auto_494758 ) ) ( not ( = ?auto_494754 ?auto_494759 ) ) ( not ( = ?auto_494754 ?auto_494760 ) ) ( not ( = ?auto_494754 ?auto_494761 ) ) ( not ( = ?auto_494754 ?auto_494762 ) ) ( not ( = ?auto_494754 ?auto_494763 ) ) ( not ( = ?auto_494754 ?auto_494764 ) ) ( not ( = ?auto_494754 ?auto_494765 ) ) ( not ( = ?auto_494754 ?auto_494766 ) ) ( not ( = ?auto_494755 ?auto_494756 ) ) ( not ( = ?auto_494755 ?auto_494757 ) ) ( not ( = ?auto_494755 ?auto_494758 ) ) ( not ( = ?auto_494755 ?auto_494759 ) ) ( not ( = ?auto_494755 ?auto_494760 ) ) ( not ( = ?auto_494755 ?auto_494761 ) ) ( not ( = ?auto_494755 ?auto_494762 ) ) ( not ( = ?auto_494755 ?auto_494763 ) ) ( not ( = ?auto_494755 ?auto_494764 ) ) ( not ( = ?auto_494755 ?auto_494765 ) ) ( not ( = ?auto_494755 ?auto_494766 ) ) ( not ( = ?auto_494756 ?auto_494757 ) ) ( not ( = ?auto_494756 ?auto_494758 ) ) ( not ( = ?auto_494756 ?auto_494759 ) ) ( not ( = ?auto_494756 ?auto_494760 ) ) ( not ( = ?auto_494756 ?auto_494761 ) ) ( not ( = ?auto_494756 ?auto_494762 ) ) ( not ( = ?auto_494756 ?auto_494763 ) ) ( not ( = ?auto_494756 ?auto_494764 ) ) ( not ( = ?auto_494756 ?auto_494765 ) ) ( not ( = ?auto_494756 ?auto_494766 ) ) ( not ( = ?auto_494757 ?auto_494758 ) ) ( not ( = ?auto_494757 ?auto_494759 ) ) ( not ( = ?auto_494757 ?auto_494760 ) ) ( not ( = ?auto_494757 ?auto_494761 ) ) ( not ( = ?auto_494757 ?auto_494762 ) ) ( not ( = ?auto_494757 ?auto_494763 ) ) ( not ( = ?auto_494757 ?auto_494764 ) ) ( not ( = ?auto_494757 ?auto_494765 ) ) ( not ( = ?auto_494757 ?auto_494766 ) ) ( not ( = ?auto_494758 ?auto_494759 ) ) ( not ( = ?auto_494758 ?auto_494760 ) ) ( not ( = ?auto_494758 ?auto_494761 ) ) ( not ( = ?auto_494758 ?auto_494762 ) ) ( not ( = ?auto_494758 ?auto_494763 ) ) ( not ( = ?auto_494758 ?auto_494764 ) ) ( not ( = ?auto_494758 ?auto_494765 ) ) ( not ( = ?auto_494758 ?auto_494766 ) ) ( not ( = ?auto_494759 ?auto_494760 ) ) ( not ( = ?auto_494759 ?auto_494761 ) ) ( not ( = ?auto_494759 ?auto_494762 ) ) ( not ( = ?auto_494759 ?auto_494763 ) ) ( not ( = ?auto_494759 ?auto_494764 ) ) ( not ( = ?auto_494759 ?auto_494765 ) ) ( not ( = ?auto_494759 ?auto_494766 ) ) ( not ( = ?auto_494760 ?auto_494761 ) ) ( not ( = ?auto_494760 ?auto_494762 ) ) ( not ( = ?auto_494760 ?auto_494763 ) ) ( not ( = ?auto_494760 ?auto_494764 ) ) ( not ( = ?auto_494760 ?auto_494765 ) ) ( not ( = ?auto_494760 ?auto_494766 ) ) ( not ( = ?auto_494761 ?auto_494762 ) ) ( not ( = ?auto_494761 ?auto_494763 ) ) ( not ( = ?auto_494761 ?auto_494764 ) ) ( not ( = ?auto_494761 ?auto_494765 ) ) ( not ( = ?auto_494761 ?auto_494766 ) ) ( not ( = ?auto_494762 ?auto_494763 ) ) ( not ( = ?auto_494762 ?auto_494764 ) ) ( not ( = ?auto_494762 ?auto_494765 ) ) ( not ( = ?auto_494762 ?auto_494766 ) ) ( not ( = ?auto_494763 ?auto_494764 ) ) ( not ( = ?auto_494763 ?auto_494765 ) ) ( not ( = ?auto_494763 ?auto_494766 ) ) ( not ( = ?auto_494764 ?auto_494765 ) ) ( not ( = ?auto_494764 ?auto_494766 ) ) ( not ( = ?auto_494765 ?auto_494766 ) ) ( ON ?auto_494764 ?auto_494765 ) ( ON ?auto_494763 ?auto_494764 ) ( ON ?auto_494762 ?auto_494763 ) ( ON ?auto_494761 ?auto_494762 ) ( ON ?auto_494760 ?auto_494761 ) ( ON ?auto_494759 ?auto_494760 ) ( CLEAR ?auto_494757 ) ( ON ?auto_494758 ?auto_494759 ) ( CLEAR ?auto_494758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_494751 ?auto_494752 ?auto_494753 ?auto_494754 ?auto_494755 ?auto_494756 ?auto_494757 ?auto_494758 )
      ( MAKE-15PILE ?auto_494751 ?auto_494752 ?auto_494753 ?auto_494754 ?auto_494755 ?auto_494756 ?auto_494757 ?auto_494758 ?auto_494759 ?auto_494760 ?auto_494761 ?auto_494762 ?auto_494763 ?auto_494764 ?auto_494765 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_494813 - BLOCK
      ?auto_494814 - BLOCK
      ?auto_494815 - BLOCK
      ?auto_494816 - BLOCK
      ?auto_494817 - BLOCK
      ?auto_494818 - BLOCK
      ?auto_494819 - BLOCK
      ?auto_494820 - BLOCK
      ?auto_494821 - BLOCK
      ?auto_494822 - BLOCK
      ?auto_494823 - BLOCK
      ?auto_494824 - BLOCK
      ?auto_494825 - BLOCK
      ?auto_494826 - BLOCK
      ?auto_494827 - BLOCK
    )
    :vars
    (
      ?auto_494828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494827 ?auto_494828 ) ( ON-TABLE ?auto_494813 ) ( ON ?auto_494814 ?auto_494813 ) ( ON ?auto_494815 ?auto_494814 ) ( ON ?auto_494816 ?auto_494815 ) ( ON ?auto_494817 ?auto_494816 ) ( ON ?auto_494818 ?auto_494817 ) ( not ( = ?auto_494813 ?auto_494814 ) ) ( not ( = ?auto_494813 ?auto_494815 ) ) ( not ( = ?auto_494813 ?auto_494816 ) ) ( not ( = ?auto_494813 ?auto_494817 ) ) ( not ( = ?auto_494813 ?auto_494818 ) ) ( not ( = ?auto_494813 ?auto_494819 ) ) ( not ( = ?auto_494813 ?auto_494820 ) ) ( not ( = ?auto_494813 ?auto_494821 ) ) ( not ( = ?auto_494813 ?auto_494822 ) ) ( not ( = ?auto_494813 ?auto_494823 ) ) ( not ( = ?auto_494813 ?auto_494824 ) ) ( not ( = ?auto_494813 ?auto_494825 ) ) ( not ( = ?auto_494813 ?auto_494826 ) ) ( not ( = ?auto_494813 ?auto_494827 ) ) ( not ( = ?auto_494813 ?auto_494828 ) ) ( not ( = ?auto_494814 ?auto_494815 ) ) ( not ( = ?auto_494814 ?auto_494816 ) ) ( not ( = ?auto_494814 ?auto_494817 ) ) ( not ( = ?auto_494814 ?auto_494818 ) ) ( not ( = ?auto_494814 ?auto_494819 ) ) ( not ( = ?auto_494814 ?auto_494820 ) ) ( not ( = ?auto_494814 ?auto_494821 ) ) ( not ( = ?auto_494814 ?auto_494822 ) ) ( not ( = ?auto_494814 ?auto_494823 ) ) ( not ( = ?auto_494814 ?auto_494824 ) ) ( not ( = ?auto_494814 ?auto_494825 ) ) ( not ( = ?auto_494814 ?auto_494826 ) ) ( not ( = ?auto_494814 ?auto_494827 ) ) ( not ( = ?auto_494814 ?auto_494828 ) ) ( not ( = ?auto_494815 ?auto_494816 ) ) ( not ( = ?auto_494815 ?auto_494817 ) ) ( not ( = ?auto_494815 ?auto_494818 ) ) ( not ( = ?auto_494815 ?auto_494819 ) ) ( not ( = ?auto_494815 ?auto_494820 ) ) ( not ( = ?auto_494815 ?auto_494821 ) ) ( not ( = ?auto_494815 ?auto_494822 ) ) ( not ( = ?auto_494815 ?auto_494823 ) ) ( not ( = ?auto_494815 ?auto_494824 ) ) ( not ( = ?auto_494815 ?auto_494825 ) ) ( not ( = ?auto_494815 ?auto_494826 ) ) ( not ( = ?auto_494815 ?auto_494827 ) ) ( not ( = ?auto_494815 ?auto_494828 ) ) ( not ( = ?auto_494816 ?auto_494817 ) ) ( not ( = ?auto_494816 ?auto_494818 ) ) ( not ( = ?auto_494816 ?auto_494819 ) ) ( not ( = ?auto_494816 ?auto_494820 ) ) ( not ( = ?auto_494816 ?auto_494821 ) ) ( not ( = ?auto_494816 ?auto_494822 ) ) ( not ( = ?auto_494816 ?auto_494823 ) ) ( not ( = ?auto_494816 ?auto_494824 ) ) ( not ( = ?auto_494816 ?auto_494825 ) ) ( not ( = ?auto_494816 ?auto_494826 ) ) ( not ( = ?auto_494816 ?auto_494827 ) ) ( not ( = ?auto_494816 ?auto_494828 ) ) ( not ( = ?auto_494817 ?auto_494818 ) ) ( not ( = ?auto_494817 ?auto_494819 ) ) ( not ( = ?auto_494817 ?auto_494820 ) ) ( not ( = ?auto_494817 ?auto_494821 ) ) ( not ( = ?auto_494817 ?auto_494822 ) ) ( not ( = ?auto_494817 ?auto_494823 ) ) ( not ( = ?auto_494817 ?auto_494824 ) ) ( not ( = ?auto_494817 ?auto_494825 ) ) ( not ( = ?auto_494817 ?auto_494826 ) ) ( not ( = ?auto_494817 ?auto_494827 ) ) ( not ( = ?auto_494817 ?auto_494828 ) ) ( not ( = ?auto_494818 ?auto_494819 ) ) ( not ( = ?auto_494818 ?auto_494820 ) ) ( not ( = ?auto_494818 ?auto_494821 ) ) ( not ( = ?auto_494818 ?auto_494822 ) ) ( not ( = ?auto_494818 ?auto_494823 ) ) ( not ( = ?auto_494818 ?auto_494824 ) ) ( not ( = ?auto_494818 ?auto_494825 ) ) ( not ( = ?auto_494818 ?auto_494826 ) ) ( not ( = ?auto_494818 ?auto_494827 ) ) ( not ( = ?auto_494818 ?auto_494828 ) ) ( not ( = ?auto_494819 ?auto_494820 ) ) ( not ( = ?auto_494819 ?auto_494821 ) ) ( not ( = ?auto_494819 ?auto_494822 ) ) ( not ( = ?auto_494819 ?auto_494823 ) ) ( not ( = ?auto_494819 ?auto_494824 ) ) ( not ( = ?auto_494819 ?auto_494825 ) ) ( not ( = ?auto_494819 ?auto_494826 ) ) ( not ( = ?auto_494819 ?auto_494827 ) ) ( not ( = ?auto_494819 ?auto_494828 ) ) ( not ( = ?auto_494820 ?auto_494821 ) ) ( not ( = ?auto_494820 ?auto_494822 ) ) ( not ( = ?auto_494820 ?auto_494823 ) ) ( not ( = ?auto_494820 ?auto_494824 ) ) ( not ( = ?auto_494820 ?auto_494825 ) ) ( not ( = ?auto_494820 ?auto_494826 ) ) ( not ( = ?auto_494820 ?auto_494827 ) ) ( not ( = ?auto_494820 ?auto_494828 ) ) ( not ( = ?auto_494821 ?auto_494822 ) ) ( not ( = ?auto_494821 ?auto_494823 ) ) ( not ( = ?auto_494821 ?auto_494824 ) ) ( not ( = ?auto_494821 ?auto_494825 ) ) ( not ( = ?auto_494821 ?auto_494826 ) ) ( not ( = ?auto_494821 ?auto_494827 ) ) ( not ( = ?auto_494821 ?auto_494828 ) ) ( not ( = ?auto_494822 ?auto_494823 ) ) ( not ( = ?auto_494822 ?auto_494824 ) ) ( not ( = ?auto_494822 ?auto_494825 ) ) ( not ( = ?auto_494822 ?auto_494826 ) ) ( not ( = ?auto_494822 ?auto_494827 ) ) ( not ( = ?auto_494822 ?auto_494828 ) ) ( not ( = ?auto_494823 ?auto_494824 ) ) ( not ( = ?auto_494823 ?auto_494825 ) ) ( not ( = ?auto_494823 ?auto_494826 ) ) ( not ( = ?auto_494823 ?auto_494827 ) ) ( not ( = ?auto_494823 ?auto_494828 ) ) ( not ( = ?auto_494824 ?auto_494825 ) ) ( not ( = ?auto_494824 ?auto_494826 ) ) ( not ( = ?auto_494824 ?auto_494827 ) ) ( not ( = ?auto_494824 ?auto_494828 ) ) ( not ( = ?auto_494825 ?auto_494826 ) ) ( not ( = ?auto_494825 ?auto_494827 ) ) ( not ( = ?auto_494825 ?auto_494828 ) ) ( not ( = ?auto_494826 ?auto_494827 ) ) ( not ( = ?auto_494826 ?auto_494828 ) ) ( not ( = ?auto_494827 ?auto_494828 ) ) ( ON ?auto_494826 ?auto_494827 ) ( ON ?auto_494825 ?auto_494826 ) ( ON ?auto_494824 ?auto_494825 ) ( ON ?auto_494823 ?auto_494824 ) ( ON ?auto_494822 ?auto_494823 ) ( ON ?auto_494821 ?auto_494822 ) ( ON ?auto_494820 ?auto_494821 ) ( CLEAR ?auto_494818 ) ( ON ?auto_494819 ?auto_494820 ) ( CLEAR ?auto_494819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_494813 ?auto_494814 ?auto_494815 ?auto_494816 ?auto_494817 ?auto_494818 ?auto_494819 )
      ( MAKE-15PILE ?auto_494813 ?auto_494814 ?auto_494815 ?auto_494816 ?auto_494817 ?auto_494818 ?auto_494819 ?auto_494820 ?auto_494821 ?auto_494822 ?auto_494823 ?auto_494824 ?auto_494825 ?auto_494826 ?auto_494827 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_494875 - BLOCK
      ?auto_494876 - BLOCK
      ?auto_494877 - BLOCK
      ?auto_494878 - BLOCK
      ?auto_494879 - BLOCK
      ?auto_494880 - BLOCK
      ?auto_494881 - BLOCK
      ?auto_494882 - BLOCK
      ?auto_494883 - BLOCK
      ?auto_494884 - BLOCK
      ?auto_494885 - BLOCK
      ?auto_494886 - BLOCK
      ?auto_494887 - BLOCK
      ?auto_494888 - BLOCK
      ?auto_494889 - BLOCK
    )
    :vars
    (
      ?auto_494890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494889 ?auto_494890 ) ( ON-TABLE ?auto_494875 ) ( ON ?auto_494876 ?auto_494875 ) ( ON ?auto_494877 ?auto_494876 ) ( ON ?auto_494878 ?auto_494877 ) ( ON ?auto_494879 ?auto_494878 ) ( not ( = ?auto_494875 ?auto_494876 ) ) ( not ( = ?auto_494875 ?auto_494877 ) ) ( not ( = ?auto_494875 ?auto_494878 ) ) ( not ( = ?auto_494875 ?auto_494879 ) ) ( not ( = ?auto_494875 ?auto_494880 ) ) ( not ( = ?auto_494875 ?auto_494881 ) ) ( not ( = ?auto_494875 ?auto_494882 ) ) ( not ( = ?auto_494875 ?auto_494883 ) ) ( not ( = ?auto_494875 ?auto_494884 ) ) ( not ( = ?auto_494875 ?auto_494885 ) ) ( not ( = ?auto_494875 ?auto_494886 ) ) ( not ( = ?auto_494875 ?auto_494887 ) ) ( not ( = ?auto_494875 ?auto_494888 ) ) ( not ( = ?auto_494875 ?auto_494889 ) ) ( not ( = ?auto_494875 ?auto_494890 ) ) ( not ( = ?auto_494876 ?auto_494877 ) ) ( not ( = ?auto_494876 ?auto_494878 ) ) ( not ( = ?auto_494876 ?auto_494879 ) ) ( not ( = ?auto_494876 ?auto_494880 ) ) ( not ( = ?auto_494876 ?auto_494881 ) ) ( not ( = ?auto_494876 ?auto_494882 ) ) ( not ( = ?auto_494876 ?auto_494883 ) ) ( not ( = ?auto_494876 ?auto_494884 ) ) ( not ( = ?auto_494876 ?auto_494885 ) ) ( not ( = ?auto_494876 ?auto_494886 ) ) ( not ( = ?auto_494876 ?auto_494887 ) ) ( not ( = ?auto_494876 ?auto_494888 ) ) ( not ( = ?auto_494876 ?auto_494889 ) ) ( not ( = ?auto_494876 ?auto_494890 ) ) ( not ( = ?auto_494877 ?auto_494878 ) ) ( not ( = ?auto_494877 ?auto_494879 ) ) ( not ( = ?auto_494877 ?auto_494880 ) ) ( not ( = ?auto_494877 ?auto_494881 ) ) ( not ( = ?auto_494877 ?auto_494882 ) ) ( not ( = ?auto_494877 ?auto_494883 ) ) ( not ( = ?auto_494877 ?auto_494884 ) ) ( not ( = ?auto_494877 ?auto_494885 ) ) ( not ( = ?auto_494877 ?auto_494886 ) ) ( not ( = ?auto_494877 ?auto_494887 ) ) ( not ( = ?auto_494877 ?auto_494888 ) ) ( not ( = ?auto_494877 ?auto_494889 ) ) ( not ( = ?auto_494877 ?auto_494890 ) ) ( not ( = ?auto_494878 ?auto_494879 ) ) ( not ( = ?auto_494878 ?auto_494880 ) ) ( not ( = ?auto_494878 ?auto_494881 ) ) ( not ( = ?auto_494878 ?auto_494882 ) ) ( not ( = ?auto_494878 ?auto_494883 ) ) ( not ( = ?auto_494878 ?auto_494884 ) ) ( not ( = ?auto_494878 ?auto_494885 ) ) ( not ( = ?auto_494878 ?auto_494886 ) ) ( not ( = ?auto_494878 ?auto_494887 ) ) ( not ( = ?auto_494878 ?auto_494888 ) ) ( not ( = ?auto_494878 ?auto_494889 ) ) ( not ( = ?auto_494878 ?auto_494890 ) ) ( not ( = ?auto_494879 ?auto_494880 ) ) ( not ( = ?auto_494879 ?auto_494881 ) ) ( not ( = ?auto_494879 ?auto_494882 ) ) ( not ( = ?auto_494879 ?auto_494883 ) ) ( not ( = ?auto_494879 ?auto_494884 ) ) ( not ( = ?auto_494879 ?auto_494885 ) ) ( not ( = ?auto_494879 ?auto_494886 ) ) ( not ( = ?auto_494879 ?auto_494887 ) ) ( not ( = ?auto_494879 ?auto_494888 ) ) ( not ( = ?auto_494879 ?auto_494889 ) ) ( not ( = ?auto_494879 ?auto_494890 ) ) ( not ( = ?auto_494880 ?auto_494881 ) ) ( not ( = ?auto_494880 ?auto_494882 ) ) ( not ( = ?auto_494880 ?auto_494883 ) ) ( not ( = ?auto_494880 ?auto_494884 ) ) ( not ( = ?auto_494880 ?auto_494885 ) ) ( not ( = ?auto_494880 ?auto_494886 ) ) ( not ( = ?auto_494880 ?auto_494887 ) ) ( not ( = ?auto_494880 ?auto_494888 ) ) ( not ( = ?auto_494880 ?auto_494889 ) ) ( not ( = ?auto_494880 ?auto_494890 ) ) ( not ( = ?auto_494881 ?auto_494882 ) ) ( not ( = ?auto_494881 ?auto_494883 ) ) ( not ( = ?auto_494881 ?auto_494884 ) ) ( not ( = ?auto_494881 ?auto_494885 ) ) ( not ( = ?auto_494881 ?auto_494886 ) ) ( not ( = ?auto_494881 ?auto_494887 ) ) ( not ( = ?auto_494881 ?auto_494888 ) ) ( not ( = ?auto_494881 ?auto_494889 ) ) ( not ( = ?auto_494881 ?auto_494890 ) ) ( not ( = ?auto_494882 ?auto_494883 ) ) ( not ( = ?auto_494882 ?auto_494884 ) ) ( not ( = ?auto_494882 ?auto_494885 ) ) ( not ( = ?auto_494882 ?auto_494886 ) ) ( not ( = ?auto_494882 ?auto_494887 ) ) ( not ( = ?auto_494882 ?auto_494888 ) ) ( not ( = ?auto_494882 ?auto_494889 ) ) ( not ( = ?auto_494882 ?auto_494890 ) ) ( not ( = ?auto_494883 ?auto_494884 ) ) ( not ( = ?auto_494883 ?auto_494885 ) ) ( not ( = ?auto_494883 ?auto_494886 ) ) ( not ( = ?auto_494883 ?auto_494887 ) ) ( not ( = ?auto_494883 ?auto_494888 ) ) ( not ( = ?auto_494883 ?auto_494889 ) ) ( not ( = ?auto_494883 ?auto_494890 ) ) ( not ( = ?auto_494884 ?auto_494885 ) ) ( not ( = ?auto_494884 ?auto_494886 ) ) ( not ( = ?auto_494884 ?auto_494887 ) ) ( not ( = ?auto_494884 ?auto_494888 ) ) ( not ( = ?auto_494884 ?auto_494889 ) ) ( not ( = ?auto_494884 ?auto_494890 ) ) ( not ( = ?auto_494885 ?auto_494886 ) ) ( not ( = ?auto_494885 ?auto_494887 ) ) ( not ( = ?auto_494885 ?auto_494888 ) ) ( not ( = ?auto_494885 ?auto_494889 ) ) ( not ( = ?auto_494885 ?auto_494890 ) ) ( not ( = ?auto_494886 ?auto_494887 ) ) ( not ( = ?auto_494886 ?auto_494888 ) ) ( not ( = ?auto_494886 ?auto_494889 ) ) ( not ( = ?auto_494886 ?auto_494890 ) ) ( not ( = ?auto_494887 ?auto_494888 ) ) ( not ( = ?auto_494887 ?auto_494889 ) ) ( not ( = ?auto_494887 ?auto_494890 ) ) ( not ( = ?auto_494888 ?auto_494889 ) ) ( not ( = ?auto_494888 ?auto_494890 ) ) ( not ( = ?auto_494889 ?auto_494890 ) ) ( ON ?auto_494888 ?auto_494889 ) ( ON ?auto_494887 ?auto_494888 ) ( ON ?auto_494886 ?auto_494887 ) ( ON ?auto_494885 ?auto_494886 ) ( ON ?auto_494884 ?auto_494885 ) ( ON ?auto_494883 ?auto_494884 ) ( ON ?auto_494882 ?auto_494883 ) ( ON ?auto_494881 ?auto_494882 ) ( CLEAR ?auto_494879 ) ( ON ?auto_494880 ?auto_494881 ) ( CLEAR ?auto_494880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_494875 ?auto_494876 ?auto_494877 ?auto_494878 ?auto_494879 ?auto_494880 )
      ( MAKE-15PILE ?auto_494875 ?auto_494876 ?auto_494877 ?auto_494878 ?auto_494879 ?auto_494880 ?auto_494881 ?auto_494882 ?auto_494883 ?auto_494884 ?auto_494885 ?auto_494886 ?auto_494887 ?auto_494888 ?auto_494889 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_494937 - BLOCK
      ?auto_494938 - BLOCK
      ?auto_494939 - BLOCK
      ?auto_494940 - BLOCK
      ?auto_494941 - BLOCK
      ?auto_494942 - BLOCK
      ?auto_494943 - BLOCK
      ?auto_494944 - BLOCK
      ?auto_494945 - BLOCK
      ?auto_494946 - BLOCK
      ?auto_494947 - BLOCK
      ?auto_494948 - BLOCK
      ?auto_494949 - BLOCK
      ?auto_494950 - BLOCK
      ?auto_494951 - BLOCK
    )
    :vars
    (
      ?auto_494952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_494951 ?auto_494952 ) ( ON-TABLE ?auto_494937 ) ( ON ?auto_494938 ?auto_494937 ) ( ON ?auto_494939 ?auto_494938 ) ( ON ?auto_494940 ?auto_494939 ) ( not ( = ?auto_494937 ?auto_494938 ) ) ( not ( = ?auto_494937 ?auto_494939 ) ) ( not ( = ?auto_494937 ?auto_494940 ) ) ( not ( = ?auto_494937 ?auto_494941 ) ) ( not ( = ?auto_494937 ?auto_494942 ) ) ( not ( = ?auto_494937 ?auto_494943 ) ) ( not ( = ?auto_494937 ?auto_494944 ) ) ( not ( = ?auto_494937 ?auto_494945 ) ) ( not ( = ?auto_494937 ?auto_494946 ) ) ( not ( = ?auto_494937 ?auto_494947 ) ) ( not ( = ?auto_494937 ?auto_494948 ) ) ( not ( = ?auto_494937 ?auto_494949 ) ) ( not ( = ?auto_494937 ?auto_494950 ) ) ( not ( = ?auto_494937 ?auto_494951 ) ) ( not ( = ?auto_494937 ?auto_494952 ) ) ( not ( = ?auto_494938 ?auto_494939 ) ) ( not ( = ?auto_494938 ?auto_494940 ) ) ( not ( = ?auto_494938 ?auto_494941 ) ) ( not ( = ?auto_494938 ?auto_494942 ) ) ( not ( = ?auto_494938 ?auto_494943 ) ) ( not ( = ?auto_494938 ?auto_494944 ) ) ( not ( = ?auto_494938 ?auto_494945 ) ) ( not ( = ?auto_494938 ?auto_494946 ) ) ( not ( = ?auto_494938 ?auto_494947 ) ) ( not ( = ?auto_494938 ?auto_494948 ) ) ( not ( = ?auto_494938 ?auto_494949 ) ) ( not ( = ?auto_494938 ?auto_494950 ) ) ( not ( = ?auto_494938 ?auto_494951 ) ) ( not ( = ?auto_494938 ?auto_494952 ) ) ( not ( = ?auto_494939 ?auto_494940 ) ) ( not ( = ?auto_494939 ?auto_494941 ) ) ( not ( = ?auto_494939 ?auto_494942 ) ) ( not ( = ?auto_494939 ?auto_494943 ) ) ( not ( = ?auto_494939 ?auto_494944 ) ) ( not ( = ?auto_494939 ?auto_494945 ) ) ( not ( = ?auto_494939 ?auto_494946 ) ) ( not ( = ?auto_494939 ?auto_494947 ) ) ( not ( = ?auto_494939 ?auto_494948 ) ) ( not ( = ?auto_494939 ?auto_494949 ) ) ( not ( = ?auto_494939 ?auto_494950 ) ) ( not ( = ?auto_494939 ?auto_494951 ) ) ( not ( = ?auto_494939 ?auto_494952 ) ) ( not ( = ?auto_494940 ?auto_494941 ) ) ( not ( = ?auto_494940 ?auto_494942 ) ) ( not ( = ?auto_494940 ?auto_494943 ) ) ( not ( = ?auto_494940 ?auto_494944 ) ) ( not ( = ?auto_494940 ?auto_494945 ) ) ( not ( = ?auto_494940 ?auto_494946 ) ) ( not ( = ?auto_494940 ?auto_494947 ) ) ( not ( = ?auto_494940 ?auto_494948 ) ) ( not ( = ?auto_494940 ?auto_494949 ) ) ( not ( = ?auto_494940 ?auto_494950 ) ) ( not ( = ?auto_494940 ?auto_494951 ) ) ( not ( = ?auto_494940 ?auto_494952 ) ) ( not ( = ?auto_494941 ?auto_494942 ) ) ( not ( = ?auto_494941 ?auto_494943 ) ) ( not ( = ?auto_494941 ?auto_494944 ) ) ( not ( = ?auto_494941 ?auto_494945 ) ) ( not ( = ?auto_494941 ?auto_494946 ) ) ( not ( = ?auto_494941 ?auto_494947 ) ) ( not ( = ?auto_494941 ?auto_494948 ) ) ( not ( = ?auto_494941 ?auto_494949 ) ) ( not ( = ?auto_494941 ?auto_494950 ) ) ( not ( = ?auto_494941 ?auto_494951 ) ) ( not ( = ?auto_494941 ?auto_494952 ) ) ( not ( = ?auto_494942 ?auto_494943 ) ) ( not ( = ?auto_494942 ?auto_494944 ) ) ( not ( = ?auto_494942 ?auto_494945 ) ) ( not ( = ?auto_494942 ?auto_494946 ) ) ( not ( = ?auto_494942 ?auto_494947 ) ) ( not ( = ?auto_494942 ?auto_494948 ) ) ( not ( = ?auto_494942 ?auto_494949 ) ) ( not ( = ?auto_494942 ?auto_494950 ) ) ( not ( = ?auto_494942 ?auto_494951 ) ) ( not ( = ?auto_494942 ?auto_494952 ) ) ( not ( = ?auto_494943 ?auto_494944 ) ) ( not ( = ?auto_494943 ?auto_494945 ) ) ( not ( = ?auto_494943 ?auto_494946 ) ) ( not ( = ?auto_494943 ?auto_494947 ) ) ( not ( = ?auto_494943 ?auto_494948 ) ) ( not ( = ?auto_494943 ?auto_494949 ) ) ( not ( = ?auto_494943 ?auto_494950 ) ) ( not ( = ?auto_494943 ?auto_494951 ) ) ( not ( = ?auto_494943 ?auto_494952 ) ) ( not ( = ?auto_494944 ?auto_494945 ) ) ( not ( = ?auto_494944 ?auto_494946 ) ) ( not ( = ?auto_494944 ?auto_494947 ) ) ( not ( = ?auto_494944 ?auto_494948 ) ) ( not ( = ?auto_494944 ?auto_494949 ) ) ( not ( = ?auto_494944 ?auto_494950 ) ) ( not ( = ?auto_494944 ?auto_494951 ) ) ( not ( = ?auto_494944 ?auto_494952 ) ) ( not ( = ?auto_494945 ?auto_494946 ) ) ( not ( = ?auto_494945 ?auto_494947 ) ) ( not ( = ?auto_494945 ?auto_494948 ) ) ( not ( = ?auto_494945 ?auto_494949 ) ) ( not ( = ?auto_494945 ?auto_494950 ) ) ( not ( = ?auto_494945 ?auto_494951 ) ) ( not ( = ?auto_494945 ?auto_494952 ) ) ( not ( = ?auto_494946 ?auto_494947 ) ) ( not ( = ?auto_494946 ?auto_494948 ) ) ( not ( = ?auto_494946 ?auto_494949 ) ) ( not ( = ?auto_494946 ?auto_494950 ) ) ( not ( = ?auto_494946 ?auto_494951 ) ) ( not ( = ?auto_494946 ?auto_494952 ) ) ( not ( = ?auto_494947 ?auto_494948 ) ) ( not ( = ?auto_494947 ?auto_494949 ) ) ( not ( = ?auto_494947 ?auto_494950 ) ) ( not ( = ?auto_494947 ?auto_494951 ) ) ( not ( = ?auto_494947 ?auto_494952 ) ) ( not ( = ?auto_494948 ?auto_494949 ) ) ( not ( = ?auto_494948 ?auto_494950 ) ) ( not ( = ?auto_494948 ?auto_494951 ) ) ( not ( = ?auto_494948 ?auto_494952 ) ) ( not ( = ?auto_494949 ?auto_494950 ) ) ( not ( = ?auto_494949 ?auto_494951 ) ) ( not ( = ?auto_494949 ?auto_494952 ) ) ( not ( = ?auto_494950 ?auto_494951 ) ) ( not ( = ?auto_494950 ?auto_494952 ) ) ( not ( = ?auto_494951 ?auto_494952 ) ) ( ON ?auto_494950 ?auto_494951 ) ( ON ?auto_494949 ?auto_494950 ) ( ON ?auto_494948 ?auto_494949 ) ( ON ?auto_494947 ?auto_494948 ) ( ON ?auto_494946 ?auto_494947 ) ( ON ?auto_494945 ?auto_494946 ) ( ON ?auto_494944 ?auto_494945 ) ( ON ?auto_494943 ?auto_494944 ) ( ON ?auto_494942 ?auto_494943 ) ( CLEAR ?auto_494940 ) ( ON ?auto_494941 ?auto_494942 ) ( CLEAR ?auto_494941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_494937 ?auto_494938 ?auto_494939 ?auto_494940 ?auto_494941 )
      ( MAKE-15PILE ?auto_494937 ?auto_494938 ?auto_494939 ?auto_494940 ?auto_494941 ?auto_494942 ?auto_494943 ?auto_494944 ?auto_494945 ?auto_494946 ?auto_494947 ?auto_494948 ?auto_494949 ?auto_494950 ?auto_494951 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_494999 - BLOCK
      ?auto_495000 - BLOCK
      ?auto_495001 - BLOCK
      ?auto_495002 - BLOCK
      ?auto_495003 - BLOCK
      ?auto_495004 - BLOCK
      ?auto_495005 - BLOCK
      ?auto_495006 - BLOCK
      ?auto_495007 - BLOCK
      ?auto_495008 - BLOCK
      ?auto_495009 - BLOCK
      ?auto_495010 - BLOCK
      ?auto_495011 - BLOCK
      ?auto_495012 - BLOCK
      ?auto_495013 - BLOCK
    )
    :vars
    (
      ?auto_495014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495013 ?auto_495014 ) ( ON-TABLE ?auto_494999 ) ( ON ?auto_495000 ?auto_494999 ) ( ON ?auto_495001 ?auto_495000 ) ( not ( = ?auto_494999 ?auto_495000 ) ) ( not ( = ?auto_494999 ?auto_495001 ) ) ( not ( = ?auto_494999 ?auto_495002 ) ) ( not ( = ?auto_494999 ?auto_495003 ) ) ( not ( = ?auto_494999 ?auto_495004 ) ) ( not ( = ?auto_494999 ?auto_495005 ) ) ( not ( = ?auto_494999 ?auto_495006 ) ) ( not ( = ?auto_494999 ?auto_495007 ) ) ( not ( = ?auto_494999 ?auto_495008 ) ) ( not ( = ?auto_494999 ?auto_495009 ) ) ( not ( = ?auto_494999 ?auto_495010 ) ) ( not ( = ?auto_494999 ?auto_495011 ) ) ( not ( = ?auto_494999 ?auto_495012 ) ) ( not ( = ?auto_494999 ?auto_495013 ) ) ( not ( = ?auto_494999 ?auto_495014 ) ) ( not ( = ?auto_495000 ?auto_495001 ) ) ( not ( = ?auto_495000 ?auto_495002 ) ) ( not ( = ?auto_495000 ?auto_495003 ) ) ( not ( = ?auto_495000 ?auto_495004 ) ) ( not ( = ?auto_495000 ?auto_495005 ) ) ( not ( = ?auto_495000 ?auto_495006 ) ) ( not ( = ?auto_495000 ?auto_495007 ) ) ( not ( = ?auto_495000 ?auto_495008 ) ) ( not ( = ?auto_495000 ?auto_495009 ) ) ( not ( = ?auto_495000 ?auto_495010 ) ) ( not ( = ?auto_495000 ?auto_495011 ) ) ( not ( = ?auto_495000 ?auto_495012 ) ) ( not ( = ?auto_495000 ?auto_495013 ) ) ( not ( = ?auto_495000 ?auto_495014 ) ) ( not ( = ?auto_495001 ?auto_495002 ) ) ( not ( = ?auto_495001 ?auto_495003 ) ) ( not ( = ?auto_495001 ?auto_495004 ) ) ( not ( = ?auto_495001 ?auto_495005 ) ) ( not ( = ?auto_495001 ?auto_495006 ) ) ( not ( = ?auto_495001 ?auto_495007 ) ) ( not ( = ?auto_495001 ?auto_495008 ) ) ( not ( = ?auto_495001 ?auto_495009 ) ) ( not ( = ?auto_495001 ?auto_495010 ) ) ( not ( = ?auto_495001 ?auto_495011 ) ) ( not ( = ?auto_495001 ?auto_495012 ) ) ( not ( = ?auto_495001 ?auto_495013 ) ) ( not ( = ?auto_495001 ?auto_495014 ) ) ( not ( = ?auto_495002 ?auto_495003 ) ) ( not ( = ?auto_495002 ?auto_495004 ) ) ( not ( = ?auto_495002 ?auto_495005 ) ) ( not ( = ?auto_495002 ?auto_495006 ) ) ( not ( = ?auto_495002 ?auto_495007 ) ) ( not ( = ?auto_495002 ?auto_495008 ) ) ( not ( = ?auto_495002 ?auto_495009 ) ) ( not ( = ?auto_495002 ?auto_495010 ) ) ( not ( = ?auto_495002 ?auto_495011 ) ) ( not ( = ?auto_495002 ?auto_495012 ) ) ( not ( = ?auto_495002 ?auto_495013 ) ) ( not ( = ?auto_495002 ?auto_495014 ) ) ( not ( = ?auto_495003 ?auto_495004 ) ) ( not ( = ?auto_495003 ?auto_495005 ) ) ( not ( = ?auto_495003 ?auto_495006 ) ) ( not ( = ?auto_495003 ?auto_495007 ) ) ( not ( = ?auto_495003 ?auto_495008 ) ) ( not ( = ?auto_495003 ?auto_495009 ) ) ( not ( = ?auto_495003 ?auto_495010 ) ) ( not ( = ?auto_495003 ?auto_495011 ) ) ( not ( = ?auto_495003 ?auto_495012 ) ) ( not ( = ?auto_495003 ?auto_495013 ) ) ( not ( = ?auto_495003 ?auto_495014 ) ) ( not ( = ?auto_495004 ?auto_495005 ) ) ( not ( = ?auto_495004 ?auto_495006 ) ) ( not ( = ?auto_495004 ?auto_495007 ) ) ( not ( = ?auto_495004 ?auto_495008 ) ) ( not ( = ?auto_495004 ?auto_495009 ) ) ( not ( = ?auto_495004 ?auto_495010 ) ) ( not ( = ?auto_495004 ?auto_495011 ) ) ( not ( = ?auto_495004 ?auto_495012 ) ) ( not ( = ?auto_495004 ?auto_495013 ) ) ( not ( = ?auto_495004 ?auto_495014 ) ) ( not ( = ?auto_495005 ?auto_495006 ) ) ( not ( = ?auto_495005 ?auto_495007 ) ) ( not ( = ?auto_495005 ?auto_495008 ) ) ( not ( = ?auto_495005 ?auto_495009 ) ) ( not ( = ?auto_495005 ?auto_495010 ) ) ( not ( = ?auto_495005 ?auto_495011 ) ) ( not ( = ?auto_495005 ?auto_495012 ) ) ( not ( = ?auto_495005 ?auto_495013 ) ) ( not ( = ?auto_495005 ?auto_495014 ) ) ( not ( = ?auto_495006 ?auto_495007 ) ) ( not ( = ?auto_495006 ?auto_495008 ) ) ( not ( = ?auto_495006 ?auto_495009 ) ) ( not ( = ?auto_495006 ?auto_495010 ) ) ( not ( = ?auto_495006 ?auto_495011 ) ) ( not ( = ?auto_495006 ?auto_495012 ) ) ( not ( = ?auto_495006 ?auto_495013 ) ) ( not ( = ?auto_495006 ?auto_495014 ) ) ( not ( = ?auto_495007 ?auto_495008 ) ) ( not ( = ?auto_495007 ?auto_495009 ) ) ( not ( = ?auto_495007 ?auto_495010 ) ) ( not ( = ?auto_495007 ?auto_495011 ) ) ( not ( = ?auto_495007 ?auto_495012 ) ) ( not ( = ?auto_495007 ?auto_495013 ) ) ( not ( = ?auto_495007 ?auto_495014 ) ) ( not ( = ?auto_495008 ?auto_495009 ) ) ( not ( = ?auto_495008 ?auto_495010 ) ) ( not ( = ?auto_495008 ?auto_495011 ) ) ( not ( = ?auto_495008 ?auto_495012 ) ) ( not ( = ?auto_495008 ?auto_495013 ) ) ( not ( = ?auto_495008 ?auto_495014 ) ) ( not ( = ?auto_495009 ?auto_495010 ) ) ( not ( = ?auto_495009 ?auto_495011 ) ) ( not ( = ?auto_495009 ?auto_495012 ) ) ( not ( = ?auto_495009 ?auto_495013 ) ) ( not ( = ?auto_495009 ?auto_495014 ) ) ( not ( = ?auto_495010 ?auto_495011 ) ) ( not ( = ?auto_495010 ?auto_495012 ) ) ( not ( = ?auto_495010 ?auto_495013 ) ) ( not ( = ?auto_495010 ?auto_495014 ) ) ( not ( = ?auto_495011 ?auto_495012 ) ) ( not ( = ?auto_495011 ?auto_495013 ) ) ( not ( = ?auto_495011 ?auto_495014 ) ) ( not ( = ?auto_495012 ?auto_495013 ) ) ( not ( = ?auto_495012 ?auto_495014 ) ) ( not ( = ?auto_495013 ?auto_495014 ) ) ( ON ?auto_495012 ?auto_495013 ) ( ON ?auto_495011 ?auto_495012 ) ( ON ?auto_495010 ?auto_495011 ) ( ON ?auto_495009 ?auto_495010 ) ( ON ?auto_495008 ?auto_495009 ) ( ON ?auto_495007 ?auto_495008 ) ( ON ?auto_495006 ?auto_495007 ) ( ON ?auto_495005 ?auto_495006 ) ( ON ?auto_495004 ?auto_495005 ) ( ON ?auto_495003 ?auto_495004 ) ( CLEAR ?auto_495001 ) ( ON ?auto_495002 ?auto_495003 ) ( CLEAR ?auto_495002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_494999 ?auto_495000 ?auto_495001 ?auto_495002 )
      ( MAKE-15PILE ?auto_494999 ?auto_495000 ?auto_495001 ?auto_495002 ?auto_495003 ?auto_495004 ?auto_495005 ?auto_495006 ?auto_495007 ?auto_495008 ?auto_495009 ?auto_495010 ?auto_495011 ?auto_495012 ?auto_495013 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_495061 - BLOCK
      ?auto_495062 - BLOCK
      ?auto_495063 - BLOCK
      ?auto_495064 - BLOCK
      ?auto_495065 - BLOCK
      ?auto_495066 - BLOCK
      ?auto_495067 - BLOCK
      ?auto_495068 - BLOCK
      ?auto_495069 - BLOCK
      ?auto_495070 - BLOCK
      ?auto_495071 - BLOCK
      ?auto_495072 - BLOCK
      ?auto_495073 - BLOCK
      ?auto_495074 - BLOCK
      ?auto_495075 - BLOCK
    )
    :vars
    (
      ?auto_495076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495075 ?auto_495076 ) ( ON-TABLE ?auto_495061 ) ( ON ?auto_495062 ?auto_495061 ) ( not ( = ?auto_495061 ?auto_495062 ) ) ( not ( = ?auto_495061 ?auto_495063 ) ) ( not ( = ?auto_495061 ?auto_495064 ) ) ( not ( = ?auto_495061 ?auto_495065 ) ) ( not ( = ?auto_495061 ?auto_495066 ) ) ( not ( = ?auto_495061 ?auto_495067 ) ) ( not ( = ?auto_495061 ?auto_495068 ) ) ( not ( = ?auto_495061 ?auto_495069 ) ) ( not ( = ?auto_495061 ?auto_495070 ) ) ( not ( = ?auto_495061 ?auto_495071 ) ) ( not ( = ?auto_495061 ?auto_495072 ) ) ( not ( = ?auto_495061 ?auto_495073 ) ) ( not ( = ?auto_495061 ?auto_495074 ) ) ( not ( = ?auto_495061 ?auto_495075 ) ) ( not ( = ?auto_495061 ?auto_495076 ) ) ( not ( = ?auto_495062 ?auto_495063 ) ) ( not ( = ?auto_495062 ?auto_495064 ) ) ( not ( = ?auto_495062 ?auto_495065 ) ) ( not ( = ?auto_495062 ?auto_495066 ) ) ( not ( = ?auto_495062 ?auto_495067 ) ) ( not ( = ?auto_495062 ?auto_495068 ) ) ( not ( = ?auto_495062 ?auto_495069 ) ) ( not ( = ?auto_495062 ?auto_495070 ) ) ( not ( = ?auto_495062 ?auto_495071 ) ) ( not ( = ?auto_495062 ?auto_495072 ) ) ( not ( = ?auto_495062 ?auto_495073 ) ) ( not ( = ?auto_495062 ?auto_495074 ) ) ( not ( = ?auto_495062 ?auto_495075 ) ) ( not ( = ?auto_495062 ?auto_495076 ) ) ( not ( = ?auto_495063 ?auto_495064 ) ) ( not ( = ?auto_495063 ?auto_495065 ) ) ( not ( = ?auto_495063 ?auto_495066 ) ) ( not ( = ?auto_495063 ?auto_495067 ) ) ( not ( = ?auto_495063 ?auto_495068 ) ) ( not ( = ?auto_495063 ?auto_495069 ) ) ( not ( = ?auto_495063 ?auto_495070 ) ) ( not ( = ?auto_495063 ?auto_495071 ) ) ( not ( = ?auto_495063 ?auto_495072 ) ) ( not ( = ?auto_495063 ?auto_495073 ) ) ( not ( = ?auto_495063 ?auto_495074 ) ) ( not ( = ?auto_495063 ?auto_495075 ) ) ( not ( = ?auto_495063 ?auto_495076 ) ) ( not ( = ?auto_495064 ?auto_495065 ) ) ( not ( = ?auto_495064 ?auto_495066 ) ) ( not ( = ?auto_495064 ?auto_495067 ) ) ( not ( = ?auto_495064 ?auto_495068 ) ) ( not ( = ?auto_495064 ?auto_495069 ) ) ( not ( = ?auto_495064 ?auto_495070 ) ) ( not ( = ?auto_495064 ?auto_495071 ) ) ( not ( = ?auto_495064 ?auto_495072 ) ) ( not ( = ?auto_495064 ?auto_495073 ) ) ( not ( = ?auto_495064 ?auto_495074 ) ) ( not ( = ?auto_495064 ?auto_495075 ) ) ( not ( = ?auto_495064 ?auto_495076 ) ) ( not ( = ?auto_495065 ?auto_495066 ) ) ( not ( = ?auto_495065 ?auto_495067 ) ) ( not ( = ?auto_495065 ?auto_495068 ) ) ( not ( = ?auto_495065 ?auto_495069 ) ) ( not ( = ?auto_495065 ?auto_495070 ) ) ( not ( = ?auto_495065 ?auto_495071 ) ) ( not ( = ?auto_495065 ?auto_495072 ) ) ( not ( = ?auto_495065 ?auto_495073 ) ) ( not ( = ?auto_495065 ?auto_495074 ) ) ( not ( = ?auto_495065 ?auto_495075 ) ) ( not ( = ?auto_495065 ?auto_495076 ) ) ( not ( = ?auto_495066 ?auto_495067 ) ) ( not ( = ?auto_495066 ?auto_495068 ) ) ( not ( = ?auto_495066 ?auto_495069 ) ) ( not ( = ?auto_495066 ?auto_495070 ) ) ( not ( = ?auto_495066 ?auto_495071 ) ) ( not ( = ?auto_495066 ?auto_495072 ) ) ( not ( = ?auto_495066 ?auto_495073 ) ) ( not ( = ?auto_495066 ?auto_495074 ) ) ( not ( = ?auto_495066 ?auto_495075 ) ) ( not ( = ?auto_495066 ?auto_495076 ) ) ( not ( = ?auto_495067 ?auto_495068 ) ) ( not ( = ?auto_495067 ?auto_495069 ) ) ( not ( = ?auto_495067 ?auto_495070 ) ) ( not ( = ?auto_495067 ?auto_495071 ) ) ( not ( = ?auto_495067 ?auto_495072 ) ) ( not ( = ?auto_495067 ?auto_495073 ) ) ( not ( = ?auto_495067 ?auto_495074 ) ) ( not ( = ?auto_495067 ?auto_495075 ) ) ( not ( = ?auto_495067 ?auto_495076 ) ) ( not ( = ?auto_495068 ?auto_495069 ) ) ( not ( = ?auto_495068 ?auto_495070 ) ) ( not ( = ?auto_495068 ?auto_495071 ) ) ( not ( = ?auto_495068 ?auto_495072 ) ) ( not ( = ?auto_495068 ?auto_495073 ) ) ( not ( = ?auto_495068 ?auto_495074 ) ) ( not ( = ?auto_495068 ?auto_495075 ) ) ( not ( = ?auto_495068 ?auto_495076 ) ) ( not ( = ?auto_495069 ?auto_495070 ) ) ( not ( = ?auto_495069 ?auto_495071 ) ) ( not ( = ?auto_495069 ?auto_495072 ) ) ( not ( = ?auto_495069 ?auto_495073 ) ) ( not ( = ?auto_495069 ?auto_495074 ) ) ( not ( = ?auto_495069 ?auto_495075 ) ) ( not ( = ?auto_495069 ?auto_495076 ) ) ( not ( = ?auto_495070 ?auto_495071 ) ) ( not ( = ?auto_495070 ?auto_495072 ) ) ( not ( = ?auto_495070 ?auto_495073 ) ) ( not ( = ?auto_495070 ?auto_495074 ) ) ( not ( = ?auto_495070 ?auto_495075 ) ) ( not ( = ?auto_495070 ?auto_495076 ) ) ( not ( = ?auto_495071 ?auto_495072 ) ) ( not ( = ?auto_495071 ?auto_495073 ) ) ( not ( = ?auto_495071 ?auto_495074 ) ) ( not ( = ?auto_495071 ?auto_495075 ) ) ( not ( = ?auto_495071 ?auto_495076 ) ) ( not ( = ?auto_495072 ?auto_495073 ) ) ( not ( = ?auto_495072 ?auto_495074 ) ) ( not ( = ?auto_495072 ?auto_495075 ) ) ( not ( = ?auto_495072 ?auto_495076 ) ) ( not ( = ?auto_495073 ?auto_495074 ) ) ( not ( = ?auto_495073 ?auto_495075 ) ) ( not ( = ?auto_495073 ?auto_495076 ) ) ( not ( = ?auto_495074 ?auto_495075 ) ) ( not ( = ?auto_495074 ?auto_495076 ) ) ( not ( = ?auto_495075 ?auto_495076 ) ) ( ON ?auto_495074 ?auto_495075 ) ( ON ?auto_495073 ?auto_495074 ) ( ON ?auto_495072 ?auto_495073 ) ( ON ?auto_495071 ?auto_495072 ) ( ON ?auto_495070 ?auto_495071 ) ( ON ?auto_495069 ?auto_495070 ) ( ON ?auto_495068 ?auto_495069 ) ( ON ?auto_495067 ?auto_495068 ) ( ON ?auto_495066 ?auto_495067 ) ( ON ?auto_495065 ?auto_495066 ) ( ON ?auto_495064 ?auto_495065 ) ( CLEAR ?auto_495062 ) ( ON ?auto_495063 ?auto_495064 ) ( CLEAR ?auto_495063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_495061 ?auto_495062 ?auto_495063 )
      ( MAKE-15PILE ?auto_495061 ?auto_495062 ?auto_495063 ?auto_495064 ?auto_495065 ?auto_495066 ?auto_495067 ?auto_495068 ?auto_495069 ?auto_495070 ?auto_495071 ?auto_495072 ?auto_495073 ?auto_495074 ?auto_495075 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_495123 - BLOCK
      ?auto_495124 - BLOCK
      ?auto_495125 - BLOCK
      ?auto_495126 - BLOCK
      ?auto_495127 - BLOCK
      ?auto_495128 - BLOCK
      ?auto_495129 - BLOCK
      ?auto_495130 - BLOCK
      ?auto_495131 - BLOCK
      ?auto_495132 - BLOCK
      ?auto_495133 - BLOCK
      ?auto_495134 - BLOCK
      ?auto_495135 - BLOCK
      ?auto_495136 - BLOCK
      ?auto_495137 - BLOCK
    )
    :vars
    (
      ?auto_495138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495137 ?auto_495138 ) ( ON-TABLE ?auto_495123 ) ( not ( = ?auto_495123 ?auto_495124 ) ) ( not ( = ?auto_495123 ?auto_495125 ) ) ( not ( = ?auto_495123 ?auto_495126 ) ) ( not ( = ?auto_495123 ?auto_495127 ) ) ( not ( = ?auto_495123 ?auto_495128 ) ) ( not ( = ?auto_495123 ?auto_495129 ) ) ( not ( = ?auto_495123 ?auto_495130 ) ) ( not ( = ?auto_495123 ?auto_495131 ) ) ( not ( = ?auto_495123 ?auto_495132 ) ) ( not ( = ?auto_495123 ?auto_495133 ) ) ( not ( = ?auto_495123 ?auto_495134 ) ) ( not ( = ?auto_495123 ?auto_495135 ) ) ( not ( = ?auto_495123 ?auto_495136 ) ) ( not ( = ?auto_495123 ?auto_495137 ) ) ( not ( = ?auto_495123 ?auto_495138 ) ) ( not ( = ?auto_495124 ?auto_495125 ) ) ( not ( = ?auto_495124 ?auto_495126 ) ) ( not ( = ?auto_495124 ?auto_495127 ) ) ( not ( = ?auto_495124 ?auto_495128 ) ) ( not ( = ?auto_495124 ?auto_495129 ) ) ( not ( = ?auto_495124 ?auto_495130 ) ) ( not ( = ?auto_495124 ?auto_495131 ) ) ( not ( = ?auto_495124 ?auto_495132 ) ) ( not ( = ?auto_495124 ?auto_495133 ) ) ( not ( = ?auto_495124 ?auto_495134 ) ) ( not ( = ?auto_495124 ?auto_495135 ) ) ( not ( = ?auto_495124 ?auto_495136 ) ) ( not ( = ?auto_495124 ?auto_495137 ) ) ( not ( = ?auto_495124 ?auto_495138 ) ) ( not ( = ?auto_495125 ?auto_495126 ) ) ( not ( = ?auto_495125 ?auto_495127 ) ) ( not ( = ?auto_495125 ?auto_495128 ) ) ( not ( = ?auto_495125 ?auto_495129 ) ) ( not ( = ?auto_495125 ?auto_495130 ) ) ( not ( = ?auto_495125 ?auto_495131 ) ) ( not ( = ?auto_495125 ?auto_495132 ) ) ( not ( = ?auto_495125 ?auto_495133 ) ) ( not ( = ?auto_495125 ?auto_495134 ) ) ( not ( = ?auto_495125 ?auto_495135 ) ) ( not ( = ?auto_495125 ?auto_495136 ) ) ( not ( = ?auto_495125 ?auto_495137 ) ) ( not ( = ?auto_495125 ?auto_495138 ) ) ( not ( = ?auto_495126 ?auto_495127 ) ) ( not ( = ?auto_495126 ?auto_495128 ) ) ( not ( = ?auto_495126 ?auto_495129 ) ) ( not ( = ?auto_495126 ?auto_495130 ) ) ( not ( = ?auto_495126 ?auto_495131 ) ) ( not ( = ?auto_495126 ?auto_495132 ) ) ( not ( = ?auto_495126 ?auto_495133 ) ) ( not ( = ?auto_495126 ?auto_495134 ) ) ( not ( = ?auto_495126 ?auto_495135 ) ) ( not ( = ?auto_495126 ?auto_495136 ) ) ( not ( = ?auto_495126 ?auto_495137 ) ) ( not ( = ?auto_495126 ?auto_495138 ) ) ( not ( = ?auto_495127 ?auto_495128 ) ) ( not ( = ?auto_495127 ?auto_495129 ) ) ( not ( = ?auto_495127 ?auto_495130 ) ) ( not ( = ?auto_495127 ?auto_495131 ) ) ( not ( = ?auto_495127 ?auto_495132 ) ) ( not ( = ?auto_495127 ?auto_495133 ) ) ( not ( = ?auto_495127 ?auto_495134 ) ) ( not ( = ?auto_495127 ?auto_495135 ) ) ( not ( = ?auto_495127 ?auto_495136 ) ) ( not ( = ?auto_495127 ?auto_495137 ) ) ( not ( = ?auto_495127 ?auto_495138 ) ) ( not ( = ?auto_495128 ?auto_495129 ) ) ( not ( = ?auto_495128 ?auto_495130 ) ) ( not ( = ?auto_495128 ?auto_495131 ) ) ( not ( = ?auto_495128 ?auto_495132 ) ) ( not ( = ?auto_495128 ?auto_495133 ) ) ( not ( = ?auto_495128 ?auto_495134 ) ) ( not ( = ?auto_495128 ?auto_495135 ) ) ( not ( = ?auto_495128 ?auto_495136 ) ) ( not ( = ?auto_495128 ?auto_495137 ) ) ( not ( = ?auto_495128 ?auto_495138 ) ) ( not ( = ?auto_495129 ?auto_495130 ) ) ( not ( = ?auto_495129 ?auto_495131 ) ) ( not ( = ?auto_495129 ?auto_495132 ) ) ( not ( = ?auto_495129 ?auto_495133 ) ) ( not ( = ?auto_495129 ?auto_495134 ) ) ( not ( = ?auto_495129 ?auto_495135 ) ) ( not ( = ?auto_495129 ?auto_495136 ) ) ( not ( = ?auto_495129 ?auto_495137 ) ) ( not ( = ?auto_495129 ?auto_495138 ) ) ( not ( = ?auto_495130 ?auto_495131 ) ) ( not ( = ?auto_495130 ?auto_495132 ) ) ( not ( = ?auto_495130 ?auto_495133 ) ) ( not ( = ?auto_495130 ?auto_495134 ) ) ( not ( = ?auto_495130 ?auto_495135 ) ) ( not ( = ?auto_495130 ?auto_495136 ) ) ( not ( = ?auto_495130 ?auto_495137 ) ) ( not ( = ?auto_495130 ?auto_495138 ) ) ( not ( = ?auto_495131 ?auto_495132 ) ) ( not ( = ?auto_495131 ?auto_495133 ) ) ( not ( = ?auto_495131 ?auto_495134 ) ) ( not ( = ?auto_495131 ?auto_495135 ) ) ( not ( = ?auto_495131 ?auto_495136 ) ) ( not ( = ?auto_495131 ?auto_495137 ) ) ( not ( = ?auto_495131 ?auto_495138 ) ) ( not ( = ?auto_495132 ?auto_495133 ) ) ( not ( = ?auto_495132 ?auto_495134 ) ) ( not ( = ?auto_495132 ?auto_495135 ) ) ( not ( = ?auto_495132 ?auto_495136 ) ) ( not ( = ?auto_495132 ?auto_495137 ) ) ( not ( = ?auto_495132 ?auto_495138 ) ) ( not ( = ?auto_495133 ?auto_495134 ) ) ( not ( = ?auto_495133 ?auto_495135 ) ) ( not ( = ?auto_495133 ?auto_495136 ) ) ( not ( = ?auto_495133 ?auto_495137 ) ) ( not ( = ?auto_495133 ?auto_495138 ) ) ( not ( = ?auto_495134 ?auto_495135 ) ) ( not ( = ?auto_495134 ?auto_495136 ) ) ( not ( = ?auto_495134 ?auto_495137 ) ) ( not ( = ?auto_495134 ?auto_495138 ) ) ( not ( = ?auto_495135 ?auto_495136 ) ) ( not ( = ?auto_495135 ?auto_495137 ) ) ( not ( = ?auto_495135 ?auto_495138 ) ) ( not ( = ?auto_495136 ?auto_495137 ) ) ( not ( = ?auto_495136 ?auto_495138 ) ) ( not ( = ?auto_495137 ?auto_495138 ) ) ( ON ?auto_495136 ?auto_495137 ) ( ON ?auto_495135 ?auto_495136 ) ( ON ?auto_495134 ?auto_495135 ) ( ON ?auto_495133 ?auto_495134 ) ( ON ?auto_495132 ?auto_495133 ) ( ON ?auto_495131 ?auto_495132 ) ( ON ?auto_495130 ?auto_495131 ) ( ON ?auto_495129 ?auto_495130 ) ( ON ?auto_495128 ?auto_495129 ) ( ON ?auto_495127 ?auto_495128 ) ( ON ?auto_495126 ?auto_495127 ) ( ON ?auto_495125 ?auto_495126 ) ( CLEAR ?auto_495123 ) ( ON ?auto_495124 ?auto_495125 ) ( CLEAR ?auto_495124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_495123 ?auto_495124 )
      ( MAKE-15PILE ?auto_495123 ?auto_495124 ?auto_495125 ?auto_495126 ?auto_495127 ?auto_495128 ?auto_495129 ?auto_495130 ?auto_495131 ?auto_495132 ?auto_495133 ?auto_495134 ?auto_495135 ?auto_495136 ?auto_495137 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_495185 - BLOCK
      ?auto_495186 - BLOCK
      ?auto_495187 - BLOCK
      ?auto_495188 - BLOCK
      ?auto_495189 - BLOCK
      ?auto_495190 - BLOCK
      ?auto_495191 - BLOCK
      ?auto_495192 - BLOCK
      ?auto_495193 - BLOCK
      ?auto_495194 - BLOCK
      ?auto_495195 - BLOCK
      ?auto_495196 - BLOCK
      ?auto_495197 - BLOCK
      ?auto_495198 - BLOCK
      ?auto_495199 - BLOCK
    )
    :vars
    (
      ?auto_495200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495199 ?auto_495200 ) ( not ( = ?auto_495185 ?auto_495186 ) ) ( not ( = ?auto_495185 ?auto_495187 ) ) ( not ( = ?auto_495185 ?auto_495188 ) ) ( not ( = ?auto_495185 ?auto_495189 ) ) ( not ( = ?auto_495185 ?auto_495190 ) ) ( not ( = ?auto_495185 ?auto_495191 ) ) ( not ( = ?auto_495185 ?auto_495192 ) ) ( not ( = ?auto_495185 ?auto_495193 ) ) ( not ( = ?auto_495185 ?auto_495194 ) ) ( not ( = ?auto_495185 ?auto_495195 ) ) ( not ( = ?auto_495185 ?auto_495196 ) ) ( not ( = ?auto_495185 ?auto_495197 ) ) ( not ( = ?auto_495185 ?auto_495198 ) ) ( not ( = ?auto_495185 ?auto_495199 ) ) ( not ( = ?auto_495185 ?auto_495200 ) ) ( not ( = ?auto_495186 ?auto_495187 ) ) ( not ( = ?auto_495186 ?auto_495188 ) ) ( not ( = ?auto_495186 ?auto_495189 ) ) ( not ( = ?auto_495186 ?auto_495190 ) ) ( not ( = ?auto_495186 ?auto_495191 ) ) ( not ( = ?auto_495186 ?auto_495192 ) ) ( not ( = ?auto_495186 ?auto_495193 ) ) ( not ( = ?auto_495186 ?auto_495194 ) ) ( not ( = ?auto_495186 ?auto_495195 ) ) ( not ( = ?auto_495186 ?auto_495196 ) ) ( not ( = ?auto_495186 ?auto_495197 ) ) ( not ( = ?auto_495186 ?auto_495198 ) ) ( not ( = ?auto_495186 ?auto_495199 ) ) ( not ( = ?auto_495186 ?auto_495200 ) ) ( not ( = ?auto_495187 ?auto_495188 ) ) ( not ( = ?auto_495187 ?auto_495189 ) ) ( not ( = ?auto_495187 ?auto_495190 ) ) ( not ( = ?auto_495187 ?auto_495191 ) ) ( not ( = ?auto_495187 ?auto_495192 ) ) ( not ( = ?auto_495187 ?auto_495193 ) ) ( not ( = ?auto_495187 ?auto_495194 ) ) ( not ( = ?auto_495187 ?auto_495195 ) ) ( not ( = ?auto_495187 ?auto_495196 ) ) ( not ( = ?auto_495187 ?auto_495197 ) ) ( not ( = ?auto_495187 ?auto_495198 ) ) ( not ( = ?auto_495187 ?auto_495199 ) ) ( not ( = ?auto_495187 ?auto_495200 ) ) ( not ( = ?auto_495188 ?auto_495189 ) ) ( not ( = ?auto_495188 ?auto_495190 ) ) ( not ( = ?auto_495188 ?auto_495191 ) ) ( not ( = ?auto_495188 ?auto_495192 ) ) ( not ( = ?auto_495188 ?auto_495193 ) ) ( not ( = ?auto_495188 ?auto_495194 ) ) ( not ( = ?auto_495188 ?auto_495195 ) ) ( not ( = ?auto_495188 ?auto_495196 ) ) ( not ( = ?auto_495188 ?auto_495197 ) ) ( not ( = ?auto_495188 ?auto_495198 ) ) ( not ( = ?auto_495188 ?auto_495199 ) ) ( not ( = ?auto_495188 ?auto_495200 ) ) ( not ( = ?auto_495189 ?auto_495190 ) ) ( not ( = ?auto_495189 ?auto_495191 ) ) ( not ( = ?auto_495189 ?auto_495192 ) ) ( not ( = ?auto_495189 ?auto_495193 ) ) ( not ( = ?auto_495189 ?auto_495194 ) ) ( not ( = ?auto_495189 ?auto_495195 ) ) ( not ( = ?auto_495189 ?auto_495196 ) ) ( not ( = ?auto_495189 ?auto_495197 ) ) ( not ( = ?auto_495189 ?auto_495198 ) ) ( not ( = ?auto_495189 ?auto_495199 ) ) ( not ( = ?auto_495189 ?auto_495200 ) ) ( not ( = ?auto_495190 ?auto_495191 ) ) ( not ( = ?auto_495190 ?auto_495192 ) ) ( not ( = ?auto_495190 ?auto_495193 ) ) ( not ( = ?auto_495190 ?auto_495194 ) ) ( not ( = ?auto_495190 ?auto_495195 ) ) ( not ( = ?auto_495190 ?auto_495196 ) ) ( not ( = ?auto_495190 ?auto_495197 ) ) ( not ( = ?auto_495190 ?auto_495198 ) ) ( not ( = ?auto_495190 ?auto_495199 ) ) ( not ( = ?auto_495190 ?auto_495200 ) ) ( not ( = ?auto_495191 ?auto_495192 ) ) ( not ( = ?auto_495191 ?auto_495193 ) ) ( not ( = ?auto_495191 ?auto_495194 ) ) ( not ( = ?auto_495191 ?auto_495195 ) ) ( not ( = ?auto_495191 ?auto_495196 ) ) ( not ( = ?auto_495191 ?auto_495197 ) ) ( not ( = ?auto_495191 ?auto_495198 ) ) ( not ( = ?auto_495191 ?auto_495199 ) ) ( not ( = ?auto_495191 ?auto_495200 ) ) ( not ( = ?auto_495192 ?auto_495193 ) ) ( not ( = ?auto_495192 ?auto_495194 ) ) ( not ( = ?auto_495192 ?auto_495195 ) ) ( not ( = ?auto_495192 ?auto_495196 ) ) ( not ( = ?auto_495192 ?auto_495197 ) ) ( not ( = ?auto_495192 ?auto_495198 ) ) ( not ( = ?auto_495192 ?auto_495199 ) ) ( not ( = ?auto_495192 ?auto_495200 ) ) ( not ( = ?auto_495193 ?auto_495194 ) ) ( not ( = ?auto_495193 ?auto_495195 ) ) ( not ( = ?auto_495193 ?auto_495196 ) ) ( not ( = ?auto_495193 ?auto_495197 ) ) ( not ( = ?auto_495193 ?auto_495198 ) ) ( not ( = ?auto_495193 ?auto_495199 ) ) ( not ( = ?auto_495193 ?auto_495200 ) ) ( not ( = ?auto_495194 ?auto_495195 ) ) ( not ( = ?auto_495194 ?auto_495196 ) ) ( not ( = ?auto_495194 ?auto_495197 ) ) ( not ( = ?auto_495194 ?auto_495198 ) ) ( not ( = ?auto_495194 ?auto_495199 ) ) ( not ( = ?auto_495194 ?auto_495200 ) ) ( not ( = ?auto_495195 ?auto_495196 ) ) ( not ( = ?auto_495195 ?auto_495197 ) ) ( not ( = ?auto_495195 ?auto_495198 ) ) ( not ( = ?auto_495195 ?auto_495199 ) ) ( not ( = ?auto_495195 ?auto_495200 ) ) ( not ( = ?auto_495196 ?auto_495197 ) ) ( not ( = ?auto_495196 ?auto_495198 ) ) ( not ( = ?auto_495196 ?auto_495199 ) ) ( not ( = ?auto_495196 ?auto_495200 ) ) ( not ( = ?auto_495197 ?auto_495198 ) ) ( not ( = ?auto_495197 ?auto_495199 ) ) ( not ( = ?auto_495197 ?auto_495200 ) ) ( not ( = ?auto_495198 ?auto_495199 ) ) ( not ( = ?auto_495198 ?auto_495200 ) ) ( not ( = ?auto_495199 ?auto_495200 ) ) ( ON ?auto_495198 ?auto_495199 ) ( ON ?auto_495197 ?auto_495198 ) ( ON ?auto_495196 ?auto_495197 ) ( ON ?auto_495195 ?auto_495196 ) ( ON ?auto_495194 ?auto_495195 ) ( ON ?auto_495193 ?auto_495194 ) ( ON ?auto_495192 ?auto_495193 ) ( ON ?auto_495191 ?auto_495192 ) ( ON ?auto_495190 ?auto_495191 ) ( ON ?auto_495189 ?auto_495190 ) ( ON ?auto_495188 ?auto_495189 ) ( ON ?auto_495187 ?auto_495188 ) ( ON ?auto_495186 ?auto_495187 ) ( ON ?auto_495185 ?auto_495186 ) ( CLEAR ?auto_495185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_495185 )
      ( MAKE-15PILE ?auto_495185 ?auto_495186 ?auto_495187 ?auto_495188 ?auto_495189 ?auto_495190 ?auto_495191 ?auto_495192 ?auto_495193 ?auto_495194 ?auto_495195 ?auto_495196 ?auto_495197 ?auto_495198 ?auto_495199 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495248 - BLOCK
      ?auto_495249 - BLOCK
      ?auto_495250 - BLOCK
      ?auto_495251 - BLOCK
      ?auto_495252 - BLOCK
      ?auto_495253 - BLOCK
      ?auto_495254 - BLOCK
      ?auto_495255 - BLOCK
      ?auto_495256 - BLOCK
      ?auto_495257 - BLOCK
      ?auto_495258 - BLOCK
      ?auto_495259 - BLOCK
      ?auto_495260 - BLOCK
      ?auto_495261 - BLOCK
      ?auto_495262 - BLOCK
      ?auto_495263 - BLOCK
    )
    :vars
    (
      ?auto_495264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_495262 ) ( ON ?auto_495263 ?auto_495264 ) ( CLEAR ?auto_495263 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_495248 ) ( ON ?auto_495249 ?auto_495248 ) ( ON ?auto_495250 ?auto_495249 ) ( ON ?auto_495251 ?auto_495250 ) ( ON ?auto_495252 ?auto_495251 ) ( ON ?auto_495253 ?auto_495252 ) ( ON ?auto_495254 ?auto_495253 ) ( ON ?auto_495255 ?auto_495254 ) ( ON ?auto_495256 ?auto_495255 ) ( ON ?auto_495257 ?auto_495256 ) ( ON ?auto_495258 ?auto_495257 ) ( ON ?auto_495259 ?auto_495258 ) ( ON ?auto_495260 ?auto_495259 ) ( ON ?auto_495261 ?auto_495260 ) ( ON ?auto_495262 ?auto_495261 ) ( not ( = ?auto_495248 ?auto_495249 ) ) ( not ( = ?auto_495248 ?auto_495250 ) ) ( not ( = ?auto_495248 ?auto_495251 ) ) ( not ( = ?auto_495248 ?auto_495252 ) ) ( not ( = ?auto_495248 ?auto_495253 ) ) ( not ( = ?auto_495248 ?auto_495254 ) ) ( not ( = ?auto_495248 ?auto_495255 ) ) ( not ( = ?auto_495248 ?auto_495256 ) ) ( not ( = ?auto_495248 ?auto_495257 ) ) ( not ( = ?auto_495248 ?auto_495258 ) ) ( not ( = ?auto_495248 ?auto_495259 ) ) ( not ( = ?auto_495248 ?auto_495260 ) ) ( not ( = ?auto_495248 ?auto_495261 ) ) ( not ( = ?auto_495248 ?auto_495262 ) ) ( not ( = ?auto_495248 ?auto_495263 ) ) ( not ( = ?auto_495248 ?auto_495264 ) ) ( not ( = ?auto_495249 ?auto_495250 ) ) ( not ( = ?auto_495249 ?auto_495251 ) ) ( not ( = ?auto_495249 ?auto_495252 ) ) ( not ( = ?auto_495249 ?auto_495253 ) ) ( not ( = ?auto_495249 ?auto_495254 ) ) ( not ( = ?auto_495249 ?auto_495255 ) ) ( not ( = ?auto_495249 ?auto_495256 ) ) ( not ( = ?auto_495249 ?auto_495257 ) ) ( not ( = ?auto_495249 ?auto_495258 ) ) ( not ( = ?auto_495249 ?auto_495259 ) ) ( not ( = ?auto_495249 ?auto_495260 ) ) ( not ( = ?auto_495249 ?auto_495261 ) ) ( not ( = ?auto_495249 ?auto_495262 ) ) ( not ( = ?auto_495249 ?auto_495263 ) ) ( not ( = ?auto_495249 ?auto_495264 ) ) ( not ( = ?auto_495250 ?auto_495251 ) ) ( not ( = ?auto_495250 ?auto_495252 ) ) ( not ( = ?auto_495250 ?auto_495253 ) ) ( not ( = ?auto_495250 ?auto_495254 ) ) ( not ( = ?auto_495250 ?auto_495255 ) ) ( not ( = ?auto_495250 ?auto_495256 ) ) ( not ( = ?auto_495250 ?auto_495257 ) ) ( not ( = ?auto_495250 ?auto_495258 ) ) ( not ( = ?auto_495250 ?auto_495259 ) ) ( not ( = ?auto_495250 ?auto_495260 ) ) ( not ( = ?auto_495250 ?auto_495261 ) ) ( not ( = ?auto_495250 ?auto_495262 ) ) ( not ( = ?auto_495250 ?auto_495263 ) ) ( not ( = ?auto_495250 ?auto_495264 ) ) ( not ( = ?auto_495251 ?auto_495252 ) ) ( not ( = ?auto_495251 ?auto_495253 ) ) ( not ( = ?auto_495251 ?auto_495254 ) ) ( not ( = ?auto_495251 ?auto_495255 ) ) ( not ( = ?auto_495251 ?auto_495256 ) ) ( not ( = ?auto_495251 ?auto_495257 ) ) ( not ( = ?auto_495251 ?auto_495258 ) ) ( not ( = ?auto_495251 ?auto_495259 ) ) ( not ( = ?auto_495251 ?auto_495260 ) ) ( not ( = ?auto_495251 ?auto_495261 ) ) ( not ( = ?auto_495251 ?auto_495262 ) ) ( not ( = ?auto_495251 ?auto_495263 ) ) ( not ( = ?auto_495251 ?auto_495264 ) ) ( not ( = ?auto_495252 ?auto_495253 ) ) ( not ( = ?auto_495252 ?auto_495254 ) ) ( not ( = ?auto_495252 ?auto_495255 ) ) ( not ( = ?auto_495252 ?auto_495256 ) ) ( not ( = ?auto_495252 ?auto_495257 ) ) ( not ( = ?auto_495252 ?auto_495258 ) ) ( not ( = ?auto_495252 ?auto_495259 ) ) ( not ( = ?auto_495252 ?auto_495260 ) ) ( not ( = ?auto_495252 ?auto_495261 ) ) ( not ( = ?auto_495252 ?auto_495262 ) ) ( not ( = ?auto_495252 ?auto_495263 ) ) ( not ( = ?auto_495252 ?auto_495264 ) ) ( not ( = ?auto_495253 ?auto_495254 ) ) ( not ( = ?auto_495253 ?auto_495255 ) ) ( not ( = ?auto_495253 ?auto_495256 ) ) ( not ( = ?auto_495253 ?auto_495257 ) ) ( not ( = ?auto_495253 ?auto_495258 ) ) ( not ( = ?auto_495253 ?auto_495259 ) ) ( not ( = ?auto_495253 ?auto_495260 ) ) ( not ( = ?auto_495253 ?auto_495261 ) ) ( not ( = ?auto_495253 ?auto_495262 ) ) ( not ( = ?auto_495253 ?auto_495263 ) ) ( not ( = ?auto_495253 ?auto_495264 ) ) ( not ( = ?auto_495254 ?auto_495255 ) ) ( not ( = ?auto_495254 ?auto_495256 ) ) ( not ( = ?auto_495254 ?auto_495257 ) ) ( not ( = ?auto_495254 ?auto_495258 ) ) ( not ( = ?auto_495254 ?auto_495259 ) ) ( not ( = ?auto_495254 ?auto_495260 ) ) ( not ( = ?auto_495254 ?auto_495261 ) ) ( not ( = ?auto_495254 ?auto_495262 ) ) ( not ( = ?auto_495254 ?auto_495263 ) ) ( not ( = ?auto_495254 ?auto_495264 ) ) ( not ( = ?auto_495255 ?auto_495256 ) ) ( not ( = ?auto_495255 ?auto_495257 ) ) ( not ( = ?auto_495255 ?auto_495258 ) ) ( not ( = ?auto_495255 ?auto_495259 ) ) ( not ( = ?auto_495255 ?auto_495260 ) ) ( not ( = ?auto_495255 ?auto_495261 ) ) ( not ( = ?auto_495255 ?auto_495262 ) ) ( not ( = ?auto_495255 ?auto_495263 ) ) ( not ( = ?auto_495255 ?auto_495264 ) ) ( not ( = ?auto_495256 ?auto_495257 ) ) ( not ( = ?auto_495256 ?auto_495258 ) ) ( not ( = ?auto_495256 ?auto_495259 ) ) ( not ( = ?auto_495256 ?auto_495260 ) ) ( not ( = ?auto_495256 ?auto_495261 ) ) ( not ( = ?auto_495256 ?auto_495262 ) ) ( not ( = ?auto_495256 ?auto_495263 ) ) ( not ( = ?auto_495256 ?auto_495264 ) ) ( not ( = ?auto_495257 ?auto_495258 ) ) ( not ( = ?auto_495257 ?auto_495259 ) ) ( not ( = ?auto_495257 ?auto_495260 ) ) ( not ( = ?auto_495257 ?auto_495261 ) ) ( not ( = ?auto_495257 ?auto_495262 ) ) ( not ( = ?auto_495257 ?auto_495263 ) ) ( not ( = ?auto_495257 ?auto_495264 ) ) ( not ( = ?auto_495258 ?auto_495259 ) ) ( not ( = ?auto_495258 ?auto_495260 ) ) ( not ( = ?auto_495258 ?auto_495261 ) ) ( not ( = ?auto_495258 ?auto_495262 ) ) ( not ( = ?auto_495258 ?auto_495263 ) ) ( not ( = ?auto_495258 ?auto_495264 ) ) ( not ( = ?auto_495259 ?auto_495260 ) ) ( not ( = ?auto_495259 ?auto_495261 ) ) ( not ( = ?auto_495259 ?auto_495262 ) ) ( not ( = ?auto_495259 ?auto_495263 ) ) ( not ( = ?auto_495259 ?auto_495264 ) ) ( not ( = ?auto_495260 ?auto_495261 ) ) ( not ( = ?auto_495260 ?auto_495262 ) ) ( not ( = ?auto_495260 ?auto_495263 ) ) ( not ( = ?auto_495260 ?auto_495264 ) ) ( not ( = ?auto_495261 ?auto_495262 ) ) ( not ( = ?auto_495261 ?auto_495263 ) ) ( not ( = ?auto_495261 ?auto_495264 ) ) ( not ( = ?auto_495262 ?auto_495263 ) ) ( not ( = ?auto_495262 ?auto_495264 ) ) ( not ( = ?auto_495263 ?auto_495264 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_495263 ?auto_495264 )
      ( !STACK ?auto_495263 ?auto_495262 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495281 - BLOCK
      ?auto_495282 - BLOCK
      ?auto_495283 - BLOCK
      ?auto_495284 - BLOCK
      ?auto_495285 - BLOCK
      ?auto_495286 - BLOCK
      ?auto_495287 - BLOCK
      ?auto_495288 - BLOCK
      ?auto_495289 - BLOCK
      ?auto_495290 - BLOCK
      ?auto_495291 - BLOCK
      ?auto_495292 - BLOCK
      ?auto_495293 - BLOCK
      ?auto_495294 - BLOCK
      ?auto_495295 - BLOCK
      ?auto_495296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_495295 ) ( ON-TABLE ?auto_495296 ) ( CLEAR ?auto_495296 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_495281 ) ( ON ?auto_495282 ?auto_495281 ) ( ON ?auto_495283 ?auto_495282 ) ( ON ?auto_495284 ?auto_495283 ) ( ON ?auto_495285 ?auto_495284 ) ( ON ?auto_495286 ?auto_495285 ) ( ON ?auto_495287 ?auto_495286 ) ( ON ?auto_495288 ?auto_495287 ) ( ON ?auto_495289 ?auto_495288 ) ( ON ?auto_495290 ?auto_495289 ) ( ON ?auto_495291 ?auto_495290 ) ( ON ?auto_495292 ?auto_495291 ) ( ON ?auto_495293 ?auto_495292 ) ( ON ?auto_495294 ?auto_495293 ) ( ON ?auto_495295 ?auto_495294 ) ( not ( = ?auto_495281 ?auto_495282 ) ) ( not ( = ?auto_495281 ?auto_495283 ) ) ( not ( = ?auto_495281 ?auto_495284 ) ) ( not ( = ?auto_495281 ?auto_495285 ) ) ( not ( = ?auto_495281 ?auto_495286 ) ) ( not ( = ?auto_495281 ?auto_495287 ) ) ( not ( = ?auto_495281 ?auto_495288 ) ) ( not ( = ?auto_495281 ?auto_495289 ) ) ( not ( = ?auto_495281 ?auto_495290 ) ) ( not ( = ?auto_495281 ?auto_495291 ) ) ( not ( = ?auto_495281 ?auto_495292 ) ) ( not ( = ?auto_495281 ?auto_495293 ) ) ( not ( = ?auto_495281 ?auto_495294 ) ) ( not ( = ?auto_495281 ?auto_495295 ) ) ( not ( = ?auto_495281 ?auto_495296 ) ) ( not ( = ?auto_495282 ?auto_495283 ) ) ( not ( = ?auto_495282 ?auto_495284 ) ) ( not ( = ?auto_495282 ?auto_495285 ) ) ( not ( = ?auto_495282 ?auto_495286 ) ) ( not ( = ?auto_495282 ?auto_495287 ) ) ( not ( = ?auto_495282 ?auto_495288 ) ) ( not ( = ?auto_495282 ?auto_495289 ) ) ( not ( = ?auto_495282 ?auto_495290 ) ) ( not ( = ?auto_495282 ?auto_495291 ) ) ( not ( = ?auto_495282 ?auto_495292 ) ) ( not ( = ?auto_495282 ?auto_495293 ) ) ( not ( = ?auto_495282 ?auto_495294 ) ) ( not ( = ?auto_495282 ?auto_495295 ) ) ( not ( = ?auto_495282 ?auto_495296 ) ) ( not ( = ?auto_495283 ?auto_495284 ) ) ( not ( = ?auto_495283 ?auto_495285 ) ) ( not ( = ?auto_495283 ?auto_495286 ) ) ( not ( = ?auto_495283 ?auto_495287 ) ) ( not ( = ?auto_495283 ?auto_495288 ) ) ( not ( = ?auto_495283 ?auto_495289 ) ) ( not ( = ?auto_495283 ?auto_495290 ) ) ( not ( = ?auto_495283 ?auto_495291 ) ) ( not ( = ?auto_495283 ?auto_495292 ) ) ( not ( = ?auto_495283 ?auto_495293 ) ) ( not ( = ?auto_495283 ?auto_495294 ) ) ( not ( = ?auto_495283 ?auto_495295 ) ) ( not ( = ?auto_495283 ?auto_495296 ) ) ( not ( = ?auto_495284 ?auto_495285 ) ) ( not ( = ?auto_495284 ?auto_495286 ) ) ( not ( = ?auto_495284 ?auto_495287 ) ) ( not ( = ?auto_495284 ?auto_495288 ) ) ( not ( = ?auto_495284 ?auto_495289 ) ) ( not ( = ?auto_495284 ?auto_495290 ) ) ( not ( = ?auto_495284 ?auto_495291 ) ) ( not ( = ?auto_495284 ?auto_495292 ) ) ( not ( = ?auto_495284 ?auto_495293 ) ) ( not ( = ?auto_495284 ?auto_495294 ) ) ( not ( = ?auto_495284 ?auto_495295 ) ) ( not ( = ?auto_495284 ?auto_495296 ) ) ( not ( = ?auto_495285 ?auto_495286 ) ) ( not ( = ?auto_495285 ?auto_495287 ) ) ( not ( = ?auto_495285 ?auto_495288 ) ) ( not ( = ?auto_495285 ?auto_495289 ) ) ( not ( = ?auto_495285 ?auto_495290 ) ) ( not ( = ?auto_495285 ?auto_495291 ) ) ( not ( = ?auto_495285 ?auto_495292 ) ) ( not ( = ?auto_495285 ?auto_495293 ) ) ( not ( = ?auto_495285 ?auto_495294 ) ) ( not ( = ?auto_495285 ?auto_495295 ) ) ( not ( = ?auto_495285 ?auto_495296 ) ) ( not ( = ?auto_495286 ?auto_495287 ) ) ( not ( = ?auto_495286 ?auto_495288 ) ) ( not ( = ?auto_495286 ?auto_495289 ) ) ( not ( = ?auto_495286 ?auto_495290 ) ) ( not ( = ?auto_495286 ?auto_495291 ) ) ( not ( = ?auto_495286 ?auto_495292 ) ) ( not ( = ?auto_495286 ?auto_495293 ) ) ( not ( = ?auto_495286 ?auto_495294 ) ) ( not ( = ?auto_495286 ?auto_495295 ) ) ( not ( = ?auto_495286 ?auto_495296 ) ) ( not ( = ?auto_495287 ?auto_495288 ) ) ( not ( = ?auto_495287 ?auto_495289 ) ) ( not ( = ?auto_495287 ?auto_495290 ) ) ( not ( = ?auto_495287 ?auto_495291 ) ) ( not ( = ?auto_495287 ?auto_495292 ) ) ( not ( = ?auto_495287 ?auto_495293 ) ) ( not ( = ?auto_495287 ?auto_495294 ) ) ( not ( = ?auto_495287 ?auto_495295 ) ) ( not ( = ?auto_495287 ?auto_495296 ) ) ( not ( = ?auto_495288 ?auto_495289 ) ) ( not ( = ?auto_495288 ?auto_495290 ) ) ( not ( = ?auto_495288 ?auto_495291 ) ) ( not ( = ?auto_495288 ?auto_495292 ) ) ( not ( = ?auto_495288 ?auto_495293 ) ) ( not ( = ?auto_495288 ?auto_495294 ) ) ( not ( = ?auto_495288 ?auto_495295 ) ) ( not ( = ?auto_495288 ?auto_495296 ) ) ( not ( = ?auto_495289 ?auto_495290 ) ) ( not ( = ?auto_495289 ?auto_495291 ) ) ( not ( = ?auto_495289 ?auto_495292 ) ) ( not ( = ?auto_495289 ?auto_495293 ) ) ( not ( = ?auto_495289 ?auto_495294 ) ) ( not ( = ?auto_495289 ?auto_495295 ) ) ( not ( = ?auto_495289 ?auto_495296 ) ) ( not ( = ?auto_495290 ?auto_495291 ) ) ( not ( = ?auto_495290 ?auto_495292 ) ) ( not ( = ?auto_495290 ?auto_495293 ) ) ( not ( = ?auto_495290 ?auto_495294 ) ) ( not ( = ?auto_495290 ?auto_495295 ) ) ( not ( = ?auto_495290 ?auto_495296 ) ) ( not ( = ?auto_495291 ?auto_495292 ) ) ( not ( = ?auto_495291 ?auto_495293 ) ) ( not ( = ?auto_495291 ?auto_495294 ) ) ( not ( = ?auto_495291 ?auto_495295 ) ) ( not ( = ?auto_495291 ?auto_495296 ) ) ( not ( = ?auto_495292 ?auto_495293 ) ) ( not ( = ?auto_495292 ?auto_495294 ) ) ( not ( = ?auto_495292 ?auto_495295 ) ) ( not ( = ?auto_495292 ?auto_495296 ) ) ( not ( = ?auto_495293 ?auto_495294 ) ) ( not ( = ?auto_495293 ?auto_495295 ) ) ( not ( = ?auto_495293 ?auto_495296 ) ) ( not ( = ?auto_495294 ?auto_495295 ) ) ( not ( = ?auto_495294 ?auto_495296 ) ) ( not ( = ?auto_495295 ?auto_495296 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_495296 )
      ( !STACK ?auto_495296 ?auto_495295 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495313 - BLOCK
      ?auto_495314 - BLOCK
      ?auto_495315 - BLOCK
      ?auto_495316 - BLOCK
      ?auto_495317 - BLOCK
      ?auto_495318 - BLOCK
      ?auto_495319 - BLOCK
      ?auto_495320 - BLOCK
      ?auto_495321 - BLOCK
      ?auto_495322 - BLOCK
      ?auto_495323 - BLOCK
      ?auto_495324 - BLOCK
      ?auto_495325 - BLOCK
      ?auto_495326 - BLOCK
      ?auto_495327 - BLOCK
      ?auto_495328 - BLOCK
    )
    :vars
    (
      ?auto_495329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495328 ?auto_495329 ) ( ON-TABLE ?auto_495313 ) ( ON ?auto_495314 ?auto_495313 ) ( ON ?auto_495315 ?auto_495314 ) ( ON ?auto_495316 ?auto_495315 ) ( ON ?auto_495317 ?auto_495316 ) ( ON ?auto_495318 ?auto_495317 ) ( ON ?auto_495319 ?auto_495318 ) ( ON ?auto_495320 ?auto_495319 ) ( ON ?auto_495321 ?auto_495320 ) ( ON ?auto_495322 ?auto_495321 ) ( ON ?auto_495323 ?auto_495322 ) ( ON ?auto_495324 ?auto_495323 ) ( ON ?auto_495325 ?auto_495324 ) ( ON ?auto_495326 ?auto_495325 ) ( not ( = ?auto_495313 ?auto_495314 ) ) ( not ( = ?auto_495313 ?auto_495315 ) ) ( not ( = ?auto_495313 ?auto_495316 ) ) ( not ( = ?auto_495313 ?auto_495317 ) ) ( not ( = ?auto_495313 ?auto_495318 ) ) ( not ( = ?auto_495313 ?auto_495319 ) ) ( not ( = ?auto_495313 ?auto_495320 ) ) ( not ( = ?auto_495313 ?auto_495321 ) ) ( not ( = ?auto_495313 ?auto_495322 ) ) ( not ( = ?auto_495313 ?auto_495323 ) ) ( not ( = ?auto_495313 ?auto_495324 ) ) ( not ( = ?auto_495313 ?auto_495325 ) ) ( not ( = ?auto_495313 ?auto_495326 ) ) ( not ( = ?auto_495313 ?auto_495327 ) ) ( not ( = ?auto_495313 ?auto_495328 ) ) ( not ( = ?auto_495313 ?auto_495329 ) ) ( not ( = ?auto_495314 ?auto_495315 ) ) ( not ( = ?auto_495314 ?auto_495316 ) ) ( not ( = ?auto_495314 ?auto_495317 ) ) ( not ( = ?auto_495314 ?auto_495318 ) ) ( not ( = ?auto_495314 ?auto_495319 ) ) ( not ( = ?auto_495314 ?auto_495320 ) ) ( not ( = ?auto_495314 ?auto_495321 ) ) ( not ( = ?auto_495314 ?auto_495322 ) ) ( not ( = ?auto_495314 ?auto_495323 ) ) ( not ( = ?auto_495314 ?auto_495324 ) ) ( not ( = ?auto_495314 ?auto_495325 ) ) ( not ( = ?auto_495314 ?auto_495326 ) ) ( not ( = ?auto_495314 ?auto_495327 ) ) ( not ( = ?auto_495314 ?auto_495328 ) ) ( not ( = ?auto_495314 ?auto_495329 ) ) ( not ( = ?auto_495315 ?auto_495316 ) ) ( not ( = ?auto_495315 ?auto_495317 ) ) ( not ( = ?auto_495315 ?auto_495318 ) ) ( not ( = ?auto_495315 ?auto_495319 ) ) ( not ( = ?auto_495315 ?auto_495320 ) ) ( not ( = ?auto_495315 ?auto_495321 ) ) ( not ( = ?auto_495315 ?auto_495322 ) ) ( not ( = ?auto_495315 ?auto_495323 ) ) ( not ( = ?auto_495315 ?auto_495324 ) ) ( not ( = ?auto_495315 ?auto_495325 ) ) ( not ( = ?auto_495315 ?auto_495326 ) ) ( not ( = ?auto_495315 ?auto_495327 ) ) ( not ( = ?auto_495315 ?auto_495328 ) ) ( not ( = ?auto_495315 ?auto_495329 ) ) ( not ( = ?auto_495316 ?auto_495317 ) ) ( not ( = ?auto_495316 ?auto_495318 ) ) ( not ( = ?auto_495316 ?auto_495319 ) ) ( not ( = ?auto_495316 ?auto_495320 ) ) ( not ( = ?auto_495316 ?auto_495321 ) ) ( not ( = ?auto_495316 ?auto_495322 ) ) ( not ( = ?auto_495316 ?auto_495323 ) ) ( not ( = ?auto_495316 ?auto_495324 ) ) ( not ( = ?auto_495316 ?auto_495325 ) ) ( not ( = ?auto_495316 ?auto_495326 ) ) ( not ( = ?auto_495316 ?auto_495327 ) ) ( not ( = ?auto_495316 ?auto_495328 ) ) ( not ( = ?auto_495316 ?auto_495329 ) ) ( not ( = ?auto_495317 ?auto_495318 ) ) ( not ( = ?auto_495317 ?auto_495319 ) ) ( not ( = ?auto_495317 ?auto_495320 ) ) ( not ( = ?auto_495317 ?auto_495321 ) ) ( not ( = ?auto_495317 ?auto_495322 ) ) ( not ( = ?auto_495317 ?auto_495323 ) ) ( not ( = ?auto_495317 ?auto_495324 ) ) ( not ( = ?auto_495317 ?auto_495325 ) ) ( not ( = ?auto_495317 ?auto_495326 ) ) ( not ( = ?auto_495317 ?auto_495327 ) ) ( not ( = ?auto_495317 ?auto_495328 ) ) ( not ( = ?auto_495317 ?auto_495329 ) ) ( not ( = ?auto_495318 ?auto_495319 ) ) ( not ( = ?auto_495318 ?auto_495320 ) ) ( not ( = ?auto_495318 ?auto_495321 ) ) ( not ( = ?auto_495318 ?auto_495322 ) ) ( not ( = ?auto_495318 ?auto_495323 ) ) ( not ( = ?auto_495318 ?auto_495324 ) ) ( not ( = ?auto_495318 ?auto_495325 ) ) ( not ( = ?auto_495318 ?auto_495326 ) ) ( not ( = ?auto_495318 ?auto_495327 ) ) ( not ( = ?auto_495318 ?auto_495328 ) ) ( not ( = ?auto_495318 ?auto_495329 ) ) ( not ( = ?auto_495319 ?auto_495320 ) ) ( not ( = ?auto_495319 ?auto_495321 ) ) ( not ( = ?auto_495319 ?auto_495322 ) ) ( not ( = ?auto_495319 ?auto_495323 ) ) ( not ( = ?auto_495319 ?auto_495324 ) ) ( not ( = ?auto_495319 ?auto_495325 ) ) ( not ( = ?auto_495319 ?auto_495326 ) ) ( not ( = ?auto_495319 ?auto_495327 ) ) ( not ( = ?auto_495319 ?auto_495328 ) ) ( not ( = ?auto_495319 ?auto_495329 ) ) ( not ( = ?auto_495320 ?auto_495321 ) ) ( not ( = ?auto_495320 ?auto_495322 ) ) ( not ( = ?auto_495320 ?auto_495323 ) ) ( not ( = ?auto_495320 ?auto_495324 ) ) ( not ( = ?auto_495320 ?auto_495325 ) ) ( not ( = ?auto_495320 ?auto_495326 ) ) ( not ( = ?auto_495320 ?auto_495327 ) ) ( not ( = ?auto_495320 ?auto_495328 ) ) ( not ( = ?auto_495320 ?auto_495329 ) ) ( not ( = ?auto_495321 ?auto_495322 ) ) ( not ( = ?auto_495321 ?auto_495323 ) ) ( not ( = ?auto_495321 ?auto_495324 ) ) ( not ( = ?auto_495321 ?auto_495325 ) ) ( not ( = ?auto_495321 ?auto_495326 ) ) ( not ( = ?auto_495321 ?auto_495327 ) ) ( not ( = ?auto_495321 ?auto_495328 ) ) ( not ( = ?auto_495321 ?auto_495329 ) ) ( not ( = ?auto_495322 ?auto_495323 ) ) ( not ( = ?auto_495322 ?auto_495324 ) ) ( not ( = ?auto_495322 ?auto_495325 ) ) ( not ( = ?auto_495322 ?auto_495326 ) ) ( not ( = ?auto_495322 ?auto_495327 ) ) ( not ( = ?auto_495322 ?auto_495328 ) ) ( not ( = ?auto_495322 ?auto_495329 ) ) ( not ( = ?auto_495323 ?auto_495324 ) ) ( not ( = ?auto_495323 ?auto_495325 ) ) ( not ( = ?auto_495323 ?auto_495326 ) ) ( not ( = ?auto_495323 ?auto_495327 ) ) ( not ( = ?auto_495323 ?auto_495328 ) ) ( not ( = ?auto_495323 ?auto_495329 ) ) ( not ( = ?auto_495324 ?auto_495325 ) ) ( not ( = ?auto_495324 ?auto_495326 ) ) ( not ( = ?auto_495324 ?auto_495327 ) ) ( not ( = ?auto_495324 ?auto_495328 ) ) ( not ( = ?auto_495324 ?auto_495329 ) ) ( not ( = ?auto_495325 ?auto_495326 ) ) ( not ( = ?auto_495325 ?auto_495327 ) ) ( not ( = ?auto_495325 ?auto_495328 ) ) ( not ( = ?auto_495325 ?auto_495329 ) ) ( not ( = ?auto_495326 ?auto_495327 ) ) ( not ( = ?auto_495326 ?auto_495328 ) ) ( not ( = ?auto_495326 ?auto_495329 ) ) ( not ( = ?auto_495327 ?auto_495328 ) ) ( not ( = ?auto_495327 ?auto_495329 ) ) ( not ( = ?auto_495328 ?auto_495329 ) ) ( CLEAR ?auto_495326 ) ( ON ?auto_495327 ?auto_495328 ) ( CLEAR ?auto_495327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_495313 ?auto_495314 ?auto_495315 ?auto_495316 ?auto_495317 ?auto_495318 ?auto_495319 ?auto_495320 ?auto_495321 ?auto_495322 ?auto_495323 ?auto_495324 ?auto_495325 ?auto_495326 ?auto_495327 )
      ( MAKE-16PILE ?auto_495313 ?auto_495314 ?auto_495315 ?auto_495316 ?auto_495317 ?auto_495318 ?auto_495319 ?auto_495320 ?auto_495321 ?auto_495322 ?auto_495323 ?auto_495324 ?auto_495325 ?auto_495326 ?auto_495327 ?auto_495328 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495346 - BLOCK
      ?auto_495347 - BLOCK
      ?auto_495348 - BLOCK
      ?auto_495349 - BLOCK
      ?auto_495350 - BLOCK
      ?auto_495351 - BLOCK
      ?auto_495352 - BLOCK
      ?auto_495353 - BLOCK
      ?auto_495354 - BLOCK
      ?auto_495355 - BLOCK
      ?auto_495356 - BLOCK
      ?auto_495357 - BLOCK
      ?auto_495358 - BLOCK
      ?auto_495359 - BLOCK
      ?auto_495360 - BLOCK
      ?auto_495361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_495361 ) ( ON-TABLE ?auto_495346 ) ( ON ?auto_495347 ?auto_495346 ) ( ON ?auto_495348 ?auto_495347 ) ( ON ?auto_495349 ?auto_495348 ) ( ON ?auto_495350 ?auto_495349 ) ( ON ?auto_495351 ?auto_495350 ) ( ON ?auto_495352 ?auto_495351 ) ( ON ?auto_495353 ?auto_495352 ) ( ON ?auto_495354 ?auto_495353 ) ( ON ?auto_495355 ?auto_495354 ) ( ON ?auto_495356 ?auto_495355 ) ( ON ?auto_495357 ?auto_495356 ) ( ON ?auto_495358 ?auto_495357 ) ( ON ?auto_495359 ?auto_495358 ) ( not ( = ?auto_495346 ?auto_495347 ) ) ( not ( = ?auto_495346 ?auto_495348 ) ) ( not ( = ?auto_495346 ?auto_495349 ) ) ( not ( = ?auto_495346 ?auto_495350 ) ) ( not ( = ?auto_495346 ?auto_495351 ) ) ( not ( = ?auto_495346 ?auto_495352 ) ) ( not ( = ?auto_495346 ?auto_495353 ) ) ( not ( = ?auto_495346 ?auto_495354 ) ) ( not ( = ?auto_495346 ?auto_495355 ) ) ( not ( = ?auto_495346 ?auto_495356 ) ) ( not ( = ?auto_495346 ?auto_495357 ) ) ( not ( = ?auto_495346 ?auto_495358 ) ) ( not ( = ?auto_495346 ?auto_495359 ) ) ( not ( = ?auto_495346 ?auto_495360 ) ) ( not ( = ?auto_495346 ?auto_495361 ) ) ( not ( = ?auto_495347 ?auto_495348 ) ) ( not ( = ?auto_495347 ?auto_495349 ) ) ( not ( = ?auto_495347 ?auto_495350 ) ) ( not ( = ?auto_495347 ?auto_495351 ) ) ( not ( = ?auto_495347 ?auto_495352 ) ) ( not ( = ?auto_495347 ?auto_495353 ) ) ( not ( = ?auto_495347 ?auto_495354 ) ) ( not ( = ?auto_495347 ?auto_495355 ) ) ( not ( = ?auto_495347 ?auto_495356 ) ) ( not ( = ?auto_495347 ?auto_495357 ) ) ( not ( = ?auto_495347 ?auto_495358 ) ) ( not ( = ?auto_495347 ?auto_495359 ) ) ( not ( = ?auto_495347 ?auto_495360 ) ) ( not ( = ?auto_495347 ?auto_495361 ) ) ( not ( = ?auto_495348 ?auto_495349 ) ) ( not ( = ?auto_495348 ?auto_495350 ) ) ( not ( = ?auto_495348 ?auto_495351 ) ) ( not ( = ?auto_495348 ?auto_495352 ) ) ( not ( = ?auto_495348 ?auto_495353 ) ) ( not ( = ?auto_495348 ?auto_495354 ) ) ( not ( = ?auto_495348 ?auto_495355 ) ) ( not ( = ?auto_495348 ?auto_495356 ) ) ( not ( = ?auto_495348 ?auto_495357 ) ) ( not ( = ?auto_495348 ?auto_495358 ) ) ( not ( = ?auto_495348 ?auto_495359 ) ) ( not ( = ?auto_495348 ?auto_495360 ) ) ( not ( = ?auto_495348 ?auto_495361 ) ) ( not ( = ?auto_495349 ?auto_495350 ) ) ( not ( = ?auto_495349 ?auto_495351 ) ) ( not ( = ?auto_495349 ?auto_495352 ) ) ( not ( = ?auto_495349 ?auto_495353 ) ) ( not ( = ?auto_495349 ?auto_495354 ) ) ( not ( = ?auto_495349 ?auto_495355 ) ) ( not ( = ?auto_495349 ?auto_495356 ) ) ( not ( = ?auto_495349 ?auto_495357 ) ) ( not ( = ?auto_495349 ?auto_495358 ) ) ( not ( = ?auto_495349 ?auto_495359 ) ) ( not ( = ?auto_495349 ?auto_495360 ) ) ( not ( = ?auto_495349 ?auto_495361 ) ) ( not ( = ?auto_495350 ?auto_495351 ) ) ( not ( = ?auto_495350 ?auto_495352 ) ) ( not ( = ?auto_495350 ?auto_495353 ) ) ( not ( = ?auto_495350 ?auto_495354 ) ) ( not ( = ?auto_495350 ?auto_495355 ) ) ( not ( = ?auto_495350 ?auto_495356 ) ) ( not ( = ?auto_495350 ?auto_495357 ) ) ( not ( = ?auto_495350 ?auto_495358 ) ) ( not ( = ?auto_495350 ?auto_495359 ) ) ( not ( = ?auto_495350 ?auto_495360 ) ) ( not ( = ?auto_495350 ?auto_495361 ) ) ( not ( = ?auto_495351 ?auto_495352 ) ) ( not ( = ?auto_495351 ?auto_495353 ) ) ( not ( = ?auto_495351 ?auto_495354 ) ) ( not ( = ?auto_495351 ?auto_495355 ) ) ( not ( = ?auto_495351 ?auto_495356 ) ) ( not ( = ?auto_495351 ?auto_495357 ) ) ( not ( = ?auto_495351 ?auto_495358 ) ) ( not ( = ?auto_495351 ?auto_495359 ) ) ( not ( = ?auto_495351 ?auto_495360 ) ) ( not ( = ?auto_495351 ?auto_495361 ) ) ( not ( = ?auto_495352 ?auto_495353 ) ) ( not ( = ?auto_495352 ?auto_495354 ) ) ( not ( = ?auto_495352 ?auto_495355 ) ) ( not ( = ?auto_495352 ?auto_495356 ) ) ( not ( = ?auto_495352 ?auto_495357 ) ) ( not ( = ?auto_495352 ?auto_495358 ) ) ( not ( = ?auto_495352 ?auto_495359 ) ) ( not ( = ?auto_495352 ?auto_495360 ) ) ( not ( = ?auto_495352 ?auto_495361 ) ) ( not ( = ?auto_495353 ?auto_495354 ) ) ( not ( = ?auto_495353 ?auto_495355 ) ) ( not ( = ?auto_495353 ?auto_495356 ) ) ( not ( = ?auto_495353 ?auto_495357 ) ) ( not ( = ?auto_495353 ?auto_495358 ) ) ( not ( = ?auto_495353 ?auto_495359 ) ) ( not ( = ?auto_495353 ?auto_495360 ) ) ( not ( = ?auto_495353 ?auto_495361 ) ) ( not ( = ?auto_495354 ?auto_495355 ) ) ( not ( = ?auto_495354 ?auto_495356 ) ) ( not ( = ?auto_495354 ?auto_495357 ) ) ( not ( = ?auto_495354 ?auto_495358 ) ) ( not ( = ?auto_495354 ?auto_495359 ) ) ( not ( = ?auto_495354 ?auto_495360 ) ) ( not ( = ?auto_495354 ?auto_495361 ) ) ( not ( = ?auto_495355 ?auto_495356 ) ) ( not ( = ?auto_495355 ?auto_495357 ) ) ( not ( = ?auto_495355 ?auto_495358 ) ) ( not ( = ?auto_495355 ?auto_495359 ) ) ( not ( = ?auto_495355 ?auto_495360 ) ) ( not ( = ?auto_495355 ?auto_495361 ) ) ( not ( = ?auto_495356 ?auto_495357 ) ) ( not ( = ?auto_495356 ?auto_495358 ) ) ( not ( = ?auto_495356 ?auto_495359 ) ) ( not ( = ?auto_495356 ?auto_495360 ) ) ( not ( = ?auto_495356 ?auto_495361 ) ) ( not ( = ?auto_495357 ?auto_495358 ) ) ( not ( = ?auto_495357 ?auto_495359 ) ) ( not ( = ?auto_495357 ?auto_495360 ) ) ( not ( = ?auto_495357 ?auto_495361 ) ) ( not ( = ?auto_495358 ?auto_495359 ) ) ( not ( = ?auto_495358 ?auto_495360 ) ) ( not ( = ?auto_495358 ?auto_495361 ) ) ( not ( = ?auto_495359 ?auto_495360 ) ) ( not ( = ?auto_495359 ?auto_495361 ) ) ( not ( = ?auto_495360 ?auto_495361 ) ) ( CLEAR ?auto_495359 ) ( ON ?auto_495360 ?auto_495361 ) ( CLEAR ?auto_495360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_495346 ?auto_495347 ?auto_495348 ?auto_495349 ?auto_495350 ?auto_495351 ?auto_495352 ?auto_495353 ?auto_495354 ?auto_495355 ?auto_495356 ?auto_495357 ?auto_495358 ?auto_495359 ?auto_495360 )
      ( MAKE-16PILE ?auto_495346 ?auto_495347 ?auto_495348 ?auto_495349 ?auto_495350 ?auto_495351 ?auto_495352 ?auto_495353 ?auto_495354 ?auto_495355 ?auto_495356 ?auto_495357 ?auto_495358 ?auto_495359 ?auto_495360 ?auto_495361 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495378 - BLOCK
      ?auto_495379 - BLOCK
      ?auto_495380 - BLOCK
      ?auto_495381 - BLOCK
      ?auto_495382 - BLOCK
      ?auto_495383 - BLOCK
      ?auto_495384 - BLOCK
      ?auto_495385 - BLOCK
      ?auto_495386 - BLOCK
      ?auto_495387 - BLOCK
      ?auto_495388 - BLOCK
      ?auto_495389 - BLOCK
      ?auto_495390 - BLOCK
      ?auto_495391 - BLOCK
      ?auto_495392 - BLOCK
      ?auto_495393 - BLOCK
    )
    :vars
    (
      ?auto_495394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495393 ?auto_495394 ) ( ON-TABLE ?auto_495378 ) ( ON ?auto_495379 ?auto_495378 ) ( ON ?auto_495380 ?auto_495379 ) ( ON ?auto_495381 ?auto_495380 ) ( ON ?auto_495382 ?auto_495381 ) ( ON ?auto_495383 ?auto_495382 ) ( ON ?auto_495384 ?auto_495383 ) ( ON ?auto_495385 ?auto_495384 ) ( ON ?auto_495386 ?auto_495385 ) ( ON ?auto_495387 ?auto_495386 ) ( ON ?auto_495388 ?auto_495387 ) ( ON ?auto_495389 ?auto_495388 ) ( ON ?auto_495390 ?auto_495389 ) ( not ( = ?auto_495378 ?auto_495379 ) ) ( not ( = ?auto_495378 ?auto_495380 ) ) ( not ( = ?auto_495378 ?auto_495381 ) ) ( not ( = ?auto_495378 ?auto_495382 ) ) ( not ( = ?auto_495378 ?auto_495383 ) ) ( not ( = ?auto_495378 ?auto_495384 ) ) ( not ( = ?auto_495378 ?auto_495385 ) ) ( not ( = ?auto_495378 ?auto_495386 ) ) ( not ( = ?auto_495378 ?auto_495387 ) ) ( not ( = ?auto_495378 ?auto_495388 ) ) ( not ( = ?auto_495378 ?auto_495389 ) ) ( not ( = ?auto_495378 ?auto_495390 ) ) ( not ( = ?auto_495378 ?auto_495391 ) ) ( not ( = ?auto_495378 ?auto_495392 ) ) ( not ( = ?auto_495378 ?auto_495393 ) ) ( not ( = ?auto_495378 ?auto_495394 ) ) ( not ( = ?auto_495379 ?auto_495380 ) ) ( not ( = ?auto_495379 ?auto_495381 ) ) ( not ( = ?auto_495379 ?auto_495382 ) ) ( not ( = ?auto_495379 ?auto_495383 ) ) ( not ( = ?auto_495379 ?auto_495384 ) ) ( not ( = ?auto_495379 ?auto_495385 ) ) ( not ( = ?auto_495379 ?auto_495386 ) ) ( not ( = ?auto_495379 ?auto_495387 ) ) ( not ( = ?auto_495379 ?auto_495388 ) ) ( not ( = ?auto_495379 ?auto_495389 ) ) ( not ( = ?auto_495379 ?auto_495390 ) ) ( not ( = ?auto_495379 ?auto_495391 ) ) ( not ( = ?auto_495379 ?auto_495392 ) ) ( not ( = ?auto_495379 ?auto_495393 ) ) ( not ( = ?auto_495379 ?auto_495394 ) ) ( not ( = ?auto_495380 ?auto_495381 ) ) ( not ( = ?auto_495380 ?auto_495382 ) ) ( not ( = ?auto_495380 ?auto_495383 ) ) ( not ( = ?auto_495380 ?auto_495384 ) ) ( not ( = ?auto_495380 ?auto_495385 ) ) ( not ( = ?auto_495380 ?auto_495386 ) ) ( not ( = ?auto_495380 ?auto_495387 ) ) ( not ( = ?auto_495380 ?auto_495388 ) ) ( not ( = ?auto_495380 ?auto_495389 ) ) ( not ( = ?auto_495380 ?auto_495390 ) ) ( not ( = ?auto_495380 ?auto_495391 ) ) ( not ( = ?auto_495380 ?auto_495392 ) ) ( not ( = ?auto_495380 ?auto_495393 ) ) ( not ( = ?auto_495380 ?auto_495394 ) ) ( not ( = ?auto_495381 ?auto_495382 ) ) ( not ( = ?auto_495381 ?auto_495383 ) ) ( not ( = ?auto_495381 ?auto_495384 ) ) ( not ( = ?auto_495381 ?auto_495385 ) ) ( not ( = ?auto_495381 ?auto_495386 ) ) ( not ( = ?auto_495381 ?auto_495387 ) ) ( not ( = ?auto_495381 ?auto_495388 ) ) ( not ( = ?auto_495381 ?auto_495389 ) ) ( not ( = ?auto_495381 ?auto_495390 ) ) ( not ( = ?auto_495381 ?auto_495391 ) ) ( not ( = ?auto_495381 ?auto_495392 ) ) ( not ( = ?auto_495381 ?auto_495393 ) ) ( not ( = ?auto_495381 ?auto_495394 ) ) ( not ( = ?auto_495382 ?auto_495383 ) ) ( not ( = ?auto_495382 ?auto_495384 ) ) ( not ( = ?auto_495382 ?auto_495385 ) ) ( not ( = ?auto_495382 ?auto_495386 ) ) ( not ( = ?auto_495382 ?auto_495387 ) ) ( not ( = ?auto_495382 ?auto_495388 ) ) ( not ( = ?auto_495382 ?auto_495389 ) ) ( not ( = ?auto_495382 ?auto_495390 ) ) ( not ( = ?auto_495382 ?auto_495391 ) ) ( not ( = ?auto_495382 ?auto_495392 ) ) ( not ( = ?auto_495382 ?auto_495393 ) ) ( not ( = ?auto_495382 ?auto_495394 ) ) ( not ( = ?auto_495383 ?auto_495384 ) ) ( not ( = ?auto_495383 ?auto_495385 ) ) ( not ( = ?auto_495383 ?auto_495386 ) ) ( not ( = ?auto_495383 ?auto_495387 ) ) ( not ( = ?auto_495383 ?auto_495388 ) ) ( not ( = ?auto_495383 ?auto_495389 ) ) ( not ( = ?auto_495383 ?auto_495390 ) ) ( not ( = ?auto_495383 ?auto_495391 ) ) ( not ( = ?auto_495383 ?auto_495392 ) ) ( not ( = ?auto_495383 ?auto_495393 ) ) ( not ( = ?auto_495383 ?auto_495394 ) ) ( not ( = ?auto_495384 ?auto_495385 ) ) ( not ( = ?auto_495384 ?auto_495386 ) ) ( not ( = ?auto_495384 ?auto_495387 ) ) ( not ( = ?auto_495384 ?auto_495388 ) ) ( not ( = ?auto_495384 ?auto_495389 ) ) ( not ( = ?auto_495384 ?auto_495390 ) ) ( not ( = ?auto_495384 ?auto_495391 ) ) ( not ( = ?auto_495384 ?auto_495392 ) ) ( not ( = ?auto_495384 ?auto_495393 ) ) ( not ( = ?auto_495384 ?auto_495394 ) ) ( not ( = ?auto_495385 ?auto_495386 ) ) ( not ( = ?auto_495385 ?auto_495387 ) ) ( not ( = ?auto_495385 ?auto_495388 ) ) ( not ( = ?auto_495385 ?auto_495389 ) ) ( not ( = ?auto_495385 ?auto_495390 ) ) ( not ( = ?auto_495385 ?auto_495391 ) ) ( not ( = ?auto_495385 ?auto_495392 ) ) ( not ( = ?auto_495385 ?auto_495393 ) ) ( not ( = ?auto_495385 ?auto_495394 ) ) ( not ( = ?auto_495386 ?auto_495387 ) ) ( not ( = ?auto_495386 ?auto_495388 ) ) ( not ( = ?auto_495386 ?auto_495389 ) ) ( not ( = ?auto_495386 ?auto_495390 ) ) ( not ( = ?auto_495386 ?auto_495391 ) ) ( not ( = ?auto_495386 ?auto_495392 ) ) ( not ( = ?auto_495386 ?auto_495393 ) ) ( not ( = ?auto_495386 ?auto_495394 ) ) ( not ( = ?auto_495387 ?auto_495388 ) ) ( not ( = ?auto_495387 ?auto_495389 ) ) ( not ( = ?auto_495387 ?auto_495390 ) ) ( not ( = ?auto_495387 ?auto_495391 ) ) ( not ( = ?auto_495387 ?auto_495392 ) ) ( not ( = ?auto_495387 ?auto_495393 ) ) ( not ( = ?auto_495387 ?auto_495394 ) ) ( not ( = ?auto_495388 ?auto_495389 ) ) ( not ( = ?auto_495388 ?auto_495390 ) ) ( not ( = ?auto_495388 ?auto_495391 ) ) ( not ( = ?auto_495388 ?auto_495392 ) ) ( not ( = ?auto_495388 ?auto_495393 ) ) ( not ( = ?auto_495388 ?auto_495394 ) ) ( not ( = ?auto_495389 ?auto_495390 ) ) ( not ( = ?auto_495389 ?auto_495391 ) ) ( not ( = ?auto_495389 ?auto_495392 ) ) ( not ( = ?auto_495389 ?auto_495393 ) ) ( not ( = ?auto_495389 ?auto_495394 ) ) ( not ( = ?auto_495390 ?auto_495391 ) ) ( not ( = ?auto_495390 ?auto_495392 ) ) ( not ( = ?auto_495390 ?auto_495393 ) ) ( not ( = ?auto_495390 ?auto_495394 ) ) ( not ( = ?auto_495391 ?auto_495392 ) ) ( not ( = ?auto_495391 ?auto_495393 ) ) ( not ( = ?auto_495391 ?auto_495394 ) ) ( not ( = ?auto_495392 ?auto_495393 ) ) ( not ( = ?auto_495392 ?auto_495394 ) ) ( not ( = ?auto_495393 ?auto_495394 ) ) ( ON ?auto_495392 ?auto_495393 ) ( CLEAR ?auto_495390 ) ( ON ?auto_495391 ?auto_495392 ) ( CLEAR ?auto_495391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_495378 ?auto_495379 ?auto_495380 ?auto_495381 ?auto_495382 ?auto_495383 ?auto_495384 ?auto_495385 ?auto_495386 ?auto_495387 ?auto_495388 ?auto_495389 ?auto_495390 ?auto_495391 )
      ( MAKE-16PILE ?auto_495378 ?auto_495379 ?auto_495380 ?auto_495381 ?auto_495382 ?auto_495383 ?auto_495384 ?auto_495385 ?auto_495386 ?auto_495387 ?auto_495388 ?auto_495389 ?auto_495390 ?auto_495391 ?auto_495392 ?auto_495393 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495411 - BLOCK
      ?auto_495412 - BLOCK
      ?auto_495413 - BLOCK
      ?auto_495414 - BLOCK
      ?auto_495415 - BLOCK
      ?auto_495416 - BLOCK
      ?auto_495417 - BLOCK
      ?auto_495418 - BLOCK
      ?auto_495419 - BLOCK
      ?auto_495420 - BLOCK
      ?auto_495421 - BLOCK
      ?auto_495422 - BLOCK
      ?auto_495423 - BLOCK
      ?auto_495424 - BLOCK
      ?auto_495425 - BLOCK
      ?auto_495426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_495426 ) ( ON-TABLE ?auto_495411 ) ( ON ?auto_495412 ?auto_495411 ) ( ON ?auto_495413 ?auto_495412 ) ( ON ?auto_495414 ?auto_495413 ) ( ON ?auto_495415 ?auto_495414 ) ( ON ?auto_495416 ?auto_495415 ) ( ON ?auto_495417 ?auto_495416 ) ( ON ?auto_495418 ?auto_495417 ) ( ON ?auto_495419 ?auto_495418 ) ( ON ?auto_495420 ?auto_495419 ) ( ON ?auto_495421 ?auto_495420 ) ( ON ?auto_495422 ?auto_495421 ) ( ON ?auto_495423 ?auto_495422 ) ( not ( = ?auto_495411 ?auto_495412 ) ) ( not ( = ?auto_495411 ?auto_495413 ) ) ( not ( = ?auto_495411 ?auto_495414 ) ) ( not ( = ?auto_495411 ?auto_495415 ) ) ( not ( = ?auto_495411 ?auto_495416 ) ) ( not ( = ?auto_495411 ?auto_495417 ) ) ( not ( = ?auto_495411 ?auto_495418 ) ) ( not ( = ?auto_495411 ?auto_495419 ) ) ( not ( = ?auto_495411 ?auto_495420 ) ) ( not ( = ?auto_495411 ?auto_495421 ) ) ( not ( = ?auto_495411 ?auto_495422 ) ) ( not ( = ?auto_495411 ?auto_495423 ) ) ( not ( = ?auto_495411 ?auto_495424 ) ) ( not ( = ?auto_495411 ?auto_495425 ) ) ( not ( = ?auto_495411 ?auto_495426 ) ) ( not ( = ?auto_495412 ?auto_495413 ) ) ( not ( = ?auto_495412 ?auto_495414 ) ) ( not ( = ?auto_495412 ?auto_495415 ) ) ( not ( = ?auto_495412 ?auto_495416 ) ) ( not ( = ?auto_495412 ?auto_495417 ) ) ( not ( = ?auto_495412 ?auto_495418 ) ) ( not ( = ?auto_495412 ?auto_495419 ) ) ( not ( = ?auto_495412 ?auto_495420 ) ) ( not ( = ?auto_495412 ?auto_495421 ) ) ( not ( = ?auto_495412 ?auto_495422 ) ) ( not ( = ?auto_495412 ?auto_495423 ) ) ( not ( = ?auto_495412 ?auto_495424 ) ) ( not ( = ?auto_495412 ?auto_495425 ) ) ( not ( = ?auto_495412 ?auto_495426 ) ) ( not ( = ?auto_495413 ?auto_495414 ) ) ( not ( = ?auto_495413 ?auto_495415 ) ) ( not ( = ?auto_495413 ?auto_495416 ) ) ( not ( = ?auto_495413 ?auto_495417 ) ) ( not ( = ?auto_495413 ?auto_495418 ) ) ( not ( = ?auto_495413 ?auto_495419 ) ) ( not ( = ?auto_495413 ?auto_495420 ) ) ( not ( = ?auto_495413 ?auto_495421 ) ) ( not ( = ?auto_495413 ?auto_495422 ) ) ( not ( = ?auto_495413 ?auto_495423 ) ) ( not ( = ?auto_495413 ?auto_495424 ) ) ( not ( = ?auto_495413 ?auto_495425 ) ) ( not ( = ?auto_495413 ?auto_495426 ) ) ( not ( = ?auto_495414 ?auto_495415 ) ) ( not ( = ?auto_495414 ?auto_495416 ) ) ( not ( = ?auto_495414 ?auto_495417 ) ) ( not ( = ?auto_495414 ?auto_495418 ) ) ( not ( = ?auto_495414 ?auto_495419 ) ) ( not ( = ?auto_495414 ?auto_495420 ) ) ( not ( = ?auto_495414 ?auto_495421 ) ) ( not ( = ?auto_495414 ?auto_495422 ) ) ( not ( = ?auto_495414 ?auto_495423 ) ) ( not ( = ?auto_495414 ?auto_495424 ) ) ( not ( = ?auto_495414 ?auto_495425 ) ) ( not ( = ?auto_495414 ?auto_495426 ) ) ( not ( = ?auto_495415 ?auto_495416 ) ) ( not ( = ?auto_495415 ?auto_495417 ) ) ( not ( = ?auto_495415 ?auto_495418 ) ) ( not ( = ?auto_495415 ?auto_495419 ) ) ( not ( = ?auto_495415 ?auto_495420 ) ) ( not ( = ?auto_495415 ?auto_495421 ) ) ( not ( = ?auto_495415 ?auto_495422 ) ) ( not ( = ?auto_495415 ?auto_495423 ) ) ( not ( = ?auto_495415 ?auto_495424 ) ) ( not ( = ?auto_495415 ?auto_495425 ) ) ( not ( = ?auto_495415 ?auto_495426 ) ) ( not ( = ?auto_495416 ?auto_495417 ) ) ( not ( = ?auto_495416 ?auto_495418 ) ) ( not ( = ?auto_495416 ?auto_495419 ) ) ( not ( = ?auto_495416 ?auto_495420 ) ) ( not ( = ?auto_495416 ?auto_495421 ) ) ( not ( = ?auto_495416 ?auto_495422 ) ) ( not ( = ?auto_495416 ?auto_495423 ) ) ( not ( = ?auto_495416 ?auto_495424 ) ) ( not ( = ?auto_495416 ?auto_495425 ) ) ( not ( = ?auto_495416 ?auto_495426 ) ) ( not ( = ?auto_495417 ?auto_495418 ) ) ( not ( = ?auto_495417 ?auto_495419 ) ) ( not ( = ?auto_495417 ?auto_495420 ) ) ( not ( = ?auto_495417 ?auto_495421 ) ) ( not ( = ?auto_495417 ?auto_495422 ) ) ( not ( = ?auto_495417 ?auto_495423 ) ) ( not ( = ?auto_495417 ?auto_495424 ) ) ( not ( = ?auto_495417 ?auto_495425 ) ) ( not ( = ?auto_495417 ?auto_495426 ) ) ( not ( = ?auto_495418 ?auto_495419 ) ) ( not ( = ?auto_495418 ?auto_495420 ) ) ( not ( = ?auto_495418 ?auto_495421 ) ) ( not ( = ?auto_495418 ?auto_495422 ) ) ( not ( = ?auto_495418 ?auto_495423 ) ) ( not ( = ?auto_495418 ?auto_495424 ) ) ( not ( = ?auto_495418 ?auto_495425 ) ) ( not ( = ?auto_495418 ?auto_495426 ) ) ( not ( = ?auto_495419 ?auto_495420 ) ) ( not ( = ?auto_495419 ?auto_495421 ) ) ( not ( = ?auto_495419 ?auto_495422 ) ) ( not ( = ?auto_495419 ?auto_495423 ) ) ( not ( = ?auto_495419 ?auto_495424 ) ) ( not ( = ?auto_495419 ?auto_495425 ) ) ( not ( = ?auto_495419 ?auto_495426 ) ) ( not ( = ?auto_495420 ?auto_495421 ) ) ( not ( = ?auto_495420 ?auto_495422 ) ) ( not ( = ?auto_495420 ?auto_495423 ) ) ( not ( = ?auto_495420 ?auto_495424 ) ) ( not ( = ?auto_495420 ?auto_495425 ) ) ( not ( = ?auto_495420 ?auto_495426 ) ) ( not ( = ?auto_495421 ?auto_495422 ) ) ( not ( = ?auto_495421 ?auto_495423 ) ) ( not ( = ?auto_495421 ?auto_495424 ) ) ( not ( = ?auto_495421 ?auto_495425 ) ) ( not ( = ?auto_495421 ?auto_495426 ) ) ( not ( = ?auto_495422 ?auto_495423 ) ) ( not ( = ?auto_495422 ?auto_495424 ) ) ( not ( = ?auto_495422 ?auto_495425 ) ) ( not ( = ?auto_495422 ?auto_495426 ) ) ( not ( = ?auto_495423 ?auto_495424 ) ) ( not ( = ?auto_495423 ?auto_495425 ) ) ( not ( = ?auto_495423 ?auto_495426 ) ) ( not ( = ?auto_495424 ?auto_495425 ) ) ( not ( = ?auto_495424 ?auto_495426 ) ) ( not ( = ?auto_495425 ?auto_495426 ) ) ( ON ?auto_495425 ?auto_495426 ) ( CLEAR ?auto_495423 ) ( ON ?auto_495424 ?auto_495425 ) ( CLEAR ?auto_495424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_495411 ?auto_495412 ?auto_495413 ?auto_495414 ?auto_495415 ?auto_495416 ?auto_495417 ?auto_495418 ?auto_495419 ?auto_495420 ?auto_495421 ?auto_495422 ?auto_495423 ?auto_495424 )
      ( MAKE-16PILE ?auto_495411 ?auto_495412 ?auto_495413 ?auto_495414 ?auto_495415 ?auto_495416 ?auto_495417 ?auto_495418 ?auto_495419 ?auto_495420 ?auto_495421 ?auto_495422 ?auto_495423 ?auto_495424 ?auto_495425 ?auto_495426 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495443 - BLOCK
      ?auto_495444 - BLOCK
      ?auto_495445 - BLOCK
      ?auto_495446 - BLOCK
      ?auto_495447 - BLOCK
      ?auto_495448 - BLOCK
      ?auto_495449 - BLOCK
      ?auto_495450 - BLOCK
      ?auto_495451 - BLOCK
      ?auto_495452 - BLOCK
      ?auto_495453 - BLOCK
      ?auto_495454 - BLOCK
      ?auto_495455 - BLOCK
      ?auto_495456 - BLOCK
      ?auto_495457 - BLOCK
      ?auto_495458 - BLOCK
    )
    :vars
    (
      ?auto_495459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495458 ?auto_495459 ) ( ON-TABLE ?auto_495443 ) ( ON ?auto_495444 ?auto_495443 ) ( ON ?auto_495445 ?auto_495444 ) ( ON ?auto_495446 ?auto_495445 ) ( ON ?auto_495447 ?auto_495446 ) ( ON ?auto_495448 ?auto_495447 ) ( ON ?auto_495449 ?auto_495448 ) ( ON ?auto_495450 ?auto_495449 ) ( ON ?auto_495451 ?auto_495450 ) ( ON ?auto_495452 ?auto_495451 ) ( ON ?auto_495453 ?auto_495452 ) ( ON ?auto_495454 ?auto_495453 ) ( not ( = ?auto_495443 ?auto_495444 ) ) ( not ( = ?auto_495443 ?auto_495445 ) ) ( not ( = ?auto_495443 ?auto_495446 ) ) ( not ( = ?auto_495443 ?auto_495447 ) ) ( not ( = ?auto_495443 ?auto_495448 ) ) ( not ( = ?auto_495443 ?auto_495449 ) ) ( not ( = ?auto_495443 ?auto_495450 ) ) ( not ( = ?auto_495443 ?auto_495451 ) ) ( not ( = ?auto_495443 ?auto_495452 ) ) ( not ( = ?auto_495443 ?auto_495453 ) ) ( not ( = ?auto_495443 ?auto_495454 ) ) ( not ( = ?auto_495443 ?auto_495455 ) ) ( not ( = ?auto_495443 ?auto_495456 ) ) ( not ( = ?auto_495443 ?auto_495457 ) ) ( not ( = ?auto_495443 ?auto_495458 ) ) ( not ( = ?auto_495443 ?auto_495459 ) ) ( not ( = ?auto_495444 ?auto_495445 ) ) ( not ( = ?auto_495444 ?auto_495446 ) ) ( not ( = ?auto_495444 ?auto_495447 ) ) ( not ( = ?auto_495444 ?auto_495448 ) ) ( not ( = ?auto_495444 ?auto_495449 ) ) ( not ( = ?auto_495444 ?auto_495450 ) ) ( not ( = ?auto_495444 ?auto_495451 ) ) ( not ( = ?auto_495444 ?auto_495452 ) ) ( not ( = ?auto_495444 ?auto_495453 ) ) ( not ( = ?auto_495444 ?auto_495454 ) ) ( not ( = ?auto_495444 ?auto_495455 ) ) ( not ( = ?auto_495444 ?auto_495456 ) ) ( not ( = ?auto_495444 ?auto_495457 ) ) ( not ( = ?auto_495444 ?auto_495458 ) ) ( not ( = ?auto_495444 ?auto_495459 ) ) ( not ( = ?auto_495445 ?auto_495446 ) ) ( not ( = ?auto_495445 ?auto_495447 ) ) ( not ( = ?auto_495445 ?auto_495448 ) ) ( not ( = ?auto_495445 ?auto_495449 ) ) ( not ( = ?auto_495445 ?auto_495450 ) ) ( not ( = ?auto_495445 ?auto_495451 ) ) ( not ( = ?auto_495445 ?auto_495452 ) ) ( not ( = ?auto_495445 ?auto_495453 ) ) ( not ( = ?auto_495445 ?auto_495454 ) ) ( not ( = ?auto_495445 ?auto_495455 ) ) ( not ( = ?auto_495445 ?auto_495456 ) ) ( not ( = ?auto_495445 ?auto_495457 ) ) ( not ( = ?auto_495445 ?auto_495458 ) ) ( not ( = ?auto_495445 ?auto_495459 ) ) ( not ( = ?auto_495446 ?auto_495447 ) ) ( not ( = ?auto_495446 ?auto_495448 ) ) ( not ( = ?auto_495446 ?auto_495449 ) ) ( not ( = ?auto_495446 ?auto_495450 ) ) ( not ( = ?auto_495446 ?auto_495451 ) ) ( not ( = ?auto_495446 ?auto_495452 ) ) ( not ( = ?auto_495446 ?auto_495453 ) ) ( not ( = ?auto_495446 ?auto_495454 ) ) ( not ( = ?auto_495446 ?auto_495455 ) ) ( not ( = ?auto_495446 ?auto_495456 ) ) ( not ( = ?auto_495446 ?auto_495457 ) ) ( not ( = ?auto_495446 ?auto_495458 ) ) ( not ( = ?auto_495446 ?auto_495459 ) ) ( not ( = ?auto_495447 ?auto_495448 ) ) ( not ( = ?auto_495447 ?auto_495449 ) ) ( not ( = ?auto_495447 ?auto_495450 ) ) ( not ( = ?auto_495447 ?auto_495451 ) ) ( not ( = ?auto_495447 ?auto_495452 ) ) ( not ( = ?auto_495447 ?auto_495453 ) ) ( not ( = ?auto_495447 ?auto_495454 ) ) ( not ( = ?auto_495447 ?auto_495455 ) ) ( not ( = ?auto_495447 ?auto_495456 ) ) ( not ( = ?auto_495447 ?auto_495457 ) ) ( not ( = ?auto_495447 ?auto_495458 ) ) ( not ( = ?auto_495447 ?auto_495459 ) ) ( not ( = ?auto_495448 ?auto_495449 ) ) ( not ( = ?auto_495448 ?auto_495450 ) ) ( not ( = ?auto_495448 ?auto_495451 ) ) ( not ( = ?auto_495448 ?auto_495452 ) ) ( not ( = ?auto_495448 ?auto_495453 ) ) ( not ( = ?auto_495448 ?auto_495454 ) ) ( not ( = ?auto_495448 ?auto_495455 ) ) ( not ( = ?auto_495448 ?auto_495456 ) ) ( not ( = ?auto_495448 ?auto_495457 ) ) ( not ( = ?auto_495448 ?auto_495458 ) ) ( not ( = ?auto_495448 ?auto_495459 ) ) ( not ( = ?auto_495449 ?auto_495450 ) ) ( not ( = ?auto_495449 ?auto_495451 ) ) ( not ( = ?auto_495449 ?auto_495452 ) ) ( not ( = ?auto_495449 ?auto_495453 ) ) ( not ( = ?auto_495449 ?auto_495454 ) ) ( not ( = ?auto_495449 ?auto_495455 ) ) ( not ( = ?auto_495449 ?auto_495456 ) ) ( not ( = ?auto_495449 ?auto_495457 ) ) ( not ( = ?auto_495449 ?auto_495458 ) ) ( not ( = ?auto_495449 ?auto_495459 ) ) ( not ( = ?auto_495450 ?auto_495451 ) ) ( not ( = ?auto_495450 ?auto_495452 ) ) ( not ( = ?auto_495450 ?auto_495453 ) ) ( not ( = ?auto_495450 ?auto_495454 ) ) ( not ( = ?auto_495450 ?auto_495455 ) ) ( not ( = ?auto_495450 ?auto_495456 ) ) ( not ( = ?auto_495450 ?auto_495457 ) ) ( not ( = ?auto_495450 ?auto_495458 ) ) ( not ( = ?auto_495450 ?auto_495459 ) ) ( not ( = ?auto_495451 ?auto_495452 ) ) ( not ( = ?auto_495451 ?auto_495453 ) ) ( not ( = ?auto_495451 ?auto_495454 ) ) ( not ( = ?auto_495451 ?auto_495455 ) ) ( not ( = ?auto_495451 ?auto_495456 ) ) ( not ( = ?auto_495451 ?auto_495457 ) ) ( not ( = ?auto_495451 ?auto_495458 ) ) ( not ( = ?auto_495451 ?auto_495459 ) ) ( not ( = ?auto_495452 ?auto_495453 ) ) ( not ( = ?auto_495452 ?auto_495454 ) ) ( not ( = ?auto_495452 ?auto_495455 ) ) ( not ( = ?auto_495452 ?auto_495456 ) ) ( not ( = ?auto_495452 ?auto_495457 ) ) ( not ( = ?auto_495452 ?auto_495458 ) ) ( not ( = ?auto_495452 ?auto_495459 ) ) ( not ( = ?auto_495453 ?auto_495454 ) ) ( not ( = ?auto_495453 ?auto_495455 ) ) ( not ( = ?auto_495453 ?auto_495456 ) ) ( not ( = ?auto_495453 ?auto_495457 ) ) ( not ( = ?auto_495453 ?auto_495458 ) ) ( not ( = ?auto_495453 ?auto_495459 ) ) ( not ( = ?auto_495454 ?auto_495455 ) ) ( not ( = ?auto_495454 ?auto_495456 ) ) ( not ( = ?auto_495454 ?auto_495457 ) ) ( not ( = ?auto_495454 ?auto_495458 ) ) ( not ( = ?auto_495454 ?auto_495459 ) ) ( not ( = ?auto_495455 ?auto_495456 ) ) ( not ( = ?auto_495455 ?auto_495457 ) ) ( not ( = ?auto_495455 ?auto_495458 ) ) ( not ( = ?auto_495455 ?auto_495459 ) ) ( not ( = ?auto_495456 ?auto_495457 ) ) ( not ( = ?auto_495456 ?auto_495458 ) ) ( not ( = ?auto_495456 ?auto_495459 ) ) ( not ( = ?auto_495457 ?auto_495458 ) ) ( not ( = ?auto_495457 ?auto_495459 ) ) ( not ( = ?auto_495458 ?auto_495459 ) ) ( ON ?auto_495457 ?auto_495458 ) ( ON ?auto_495456 ?auto_495457 ) ( CLEAR ?auto_495454 ) ( ON ?auto_495455 ?auto_495456 ) ( CLEAR ?auto_495455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_495443 ?auto_495444 ?auto_495445 ?auto_495446 ?auto_495447 ?auto_495448 ?auto_495449 ?auto_495450 ?auto_495451 ?auto_495452 ?auto_495453 ?auto_495454 ?auto_495455 )
      ( MAKE-16PILE ?auto_495443 ?auto_495444 ?auto_495445 ?auto_495446 ?auto_495447 ?auto_495448 ?auto_495449 ?auto_495450 ?auto_495451 ?auto_495452 ?auto_495453 ?auto_495454 ?auto_495455 ?auto_495456 ?auto_495457 ?auto_495458 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495476 - BLOCK
      ?auto_495477 - BLOCK
      ?auto_495478 - BLOCK
      ?auto_495479 - BLOCK
      ?auto_495480 - BLOCK
      ?auto_495481 - BLOCK
      ?auto_495482 - BLOCK
      ?auto_495483 - BLOCK
      ?auto_495484 - BLOCK
      ?auto_495485 - BLOCK
      ?auto_495486 - BLOCK
      ?auto_495487 - BLOCK
      ?auto_495488 - BLOCK
      ?auto_495489 - BLOCK
      ?auto_495490 - BLOCK
      ?auto_495491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_495491 ) ( ON-TABLE ?auto_495476 ) ( ON ?auto_495477 ?auto_495476 ) ( ON ?auto_495478 ?auto_495477 ) ( ON ?auto_495479 ?auto_495478 ) ( ON ?auto_495480 ?auto_495479 ) ( ON ?auto_495481 ?auto_495480 ) ( ON ?auto_495482 ?auto_495481 ) ( ON ?auto_495483 ?auto_495482 ) ( ON ?auto_495484 ?auto_495483 ) ( ON ?auto_495485 ?auto_495484 ) ( ON ?auto_495486 ?auto_495485 ) ( ON ?auto_495487 ?auto_495486 ) ( not ( = ?auto_495476 ?auto_495477 ) ) ( not ( = ?auto_495476 ?auto_495478 ) ) ( not ( = ?auto_495476 ?auto_495479 ) ) ( not ( = ?auto_495476 ?auto_495480 ) ) ( not ( = ?auto_495476 ?auto_495481 ) ) ( not ( = ?auto_495476 ?auto_495482 ) ) ( not ( = ?auto_495476 ?auto_495483 ) ) ( not ( = ?auto_495476 ?auto_495484 ) ) ( not ( = ?auto_495476 ?auto_495485 ) ) ( not ( = ?auto_495476 ?auto_495486 ) ) ( not ( = ?auto_495476 ?auto_495487 ) ) ( not ( = ?auto_495476 ?auto_495488 ) ) ( not ( = ?auto_495476 ?auto_495489 ) ) ( not ( = ?auto_495476 ?auto_495490 ) ) ( not ( = ?auto_495476 ?auto_495491 ) ) ( not ( = ?auto_495477 ?auto_495478 ) ) ( not ( = ?auto_495477 ?auto_495479 ) ) ( not ( = ?auto_495477 ?auto_495480 ) ) ( not ( = ?auto_495477 ?auto_495481 ) ) ( not ( = ?auto_495477 ?auto_495482 ) ) ( not ( = ?auto_495477 ?auto_495483 ) ) ( not ( = ?auto_495477 ?auto_495484 ) ) ( not ( = ?auto_495477 ?auto_495485 ) ) ( not ( = ?auto_495477 ?auto_495486 ) ) ( not ( = ?auto_495477 ?auto_495487 ) ) ( not ( = ?auto_495477 ?auto_495488 ) ) ( not ( = ?auto_495477 ?auto_495489 ) ) ( not ( = ?auto_495477 ?auto_495490 ) ) ( not ( = ?auto_495477 ?auto_495491 ) ) ( not ( = ?auto_495478 ?auto_495479 ) ) ( not ( = ?auto_495478 ?auto_495480 ) ) ( not ( = ?auto_495478 ?auto_495481 ) ) ( not ( = ?auto_495478 ?auto_495482 ) ) ( not ( = ?auto_495478 ?auto_495483 ) ) ( not ( = ?auto_495478 ?auto_495484 ) ) ( not ( = ?auto_495478 ?auto_495485 ) ) ( not ( = ?auto_495478 ?auto_495486 ) ) ( not ( = ?auto_495478 ?auto_495487 ) ) ( not ( = ?auto_495478 ?auto_495488 ) ) ( not ( = ?auto_495478 ?auto_495489 ) ) ( not ( = ?auto_495478 ?auto_495490 ) ) ( not ( = ?auto_495478 ?auto_495491 ) ) ( not ( = ?auto_495479 ?auto_495480 ) ) ( not ( = ?auto_495479 ?auto_495481 ) ) ( not ( = ?auto_495479 ?auto_495482 ) ) ( not ( = ?auto_495479 ?auto_495483 ) ) ( not ( = ?auto_495479 ?auto_495484 ) ) ( not ( = ?auto_495479 ?auto_495485 ) ) ( not ( = ?auto_495479 ?auto_495486 ) ) ( not ( = ?auto_495479 ?auto_495487 ) ) ( not ( = ?auto_495479 ?auto_495488 ) ) ( not ( = ?auto_495479 ?auto_495489 ) ) ( not ( = ?auto_495479 ?auto_495490 ) ) ( not ( = ?auto_495479 ?auto_495491 ) ) ( not ( = ?auto_495480 ?auto_495481 ) ) ( not ( = ?auto_495480 ?auto_495482 ) ) ( not ( = ?auto_495480 ?auto_495483 ) ) ( not ( = ?auto_495480 ?auto_495484 ) ) ( not ( = ?auto_495480 ?auto_495485 ) ) ( not ( = ?auto_495480 ?auto_495486 ) ) ( not ( = ?auto_495480 ?auto_495487 ) ) ( not ( = ?auto_495480 ?auto_495488 ) ) ( not ( = ?auto_495480 ?auto_495489 ) ) ( not ( = ?auto_495480 ?auto_495490 ) ) ( not ( = ?auto_495480 ?auto_495491 ) ) ( not ( = ?auto_495481 ?auto_495482 ) ) ( not ( = ?auto_495481 ?auto_495483 ) ) ( not ( = ?auto_495481 ?auto_495484 ) ) ( not ( = ?auto_495481 ?auto_495485 ) ) ( not ( = ?auto_495481 ?auto_495486 ) ) ( not ( = ?auto_495481 ?auto_495487 ) ) ( not ( = ?auto_495481 ?auto_495488 ) ) ( not ( = ?auto_495481 ?auto_495489 ) ) ( not ( = ?auto_495481 ?auto_495490 ) ) ( not ( = ?auto_495481 ?auto_495491 ) ) ( not ( = ?auto_495482 ?auto_495483 ) ) ( not ( = ?auto_495482 ?auto_495484 ) ) ( not ( = ?auto_495482 ?auto_495485 ) ) ( not ( = ?auto_495482 ?auto_495486 ) ) ( not ( = ?auto_495482 ?auto_495487 ) ) ( not ( = ?auto_495482 ?auto_495488 ) ) ( not ( = ?auto_495482 ?auto_495489 ) ) ( not ( = ?auto_495482 ?auto_495490 ) ) ( not ( = ?auto_495482 ?auto_495491 ) ) ( not ( = ?auto_495483 ?auto_495484 ) ) ( not ( = ?auto_495483 ?auto_495485 ) ) ( not ( = ?auto_495483 ?auto_495486 ) ) ( not ( = ?auto_495483 ?auto_495487 ) ) ( not ( = ?auto_495483 ?auto_495488 ) ) ( not ( = ?auto_495483 ?auto_495489 ) ) ( not ( = ?auto_495483 ?auto_495490 ) ) ( not ( = ?auto_495483 ?auto_495491 ) ) ( not ( = ?auto_495484 ?auto_495485 ) ) ( not ( = ?auto_495484 ?auto_495486 ) ) ( not ( = ?auto_495484 ?auto_495487 ) ) ( not ( = ?auto_495484 ?auto_495488 ) ) ( not ( = ?auto_495484 ?auto_495489 ) ) ( not ( = ?auto_495484 ?auto_495490 ) ) ( not ( = ?auto_495484 ?auto_495491 ) ) ( not ( = ?auto_495485 ?auto_495486 ) ) ( not ( = ?auto_495485 ?auto_495487 ) ) ( not ( = ?auto_495485 ?auto_495488 ) ) ( not ( = ?auto_495485 ?auto_495489 ) ) ( not ( = ?auto_495485 ?auto_495490 ) ) ( not ( = ?auto_495485 ?auto_495491 ) ) ( not ( = ?auto_495486 ?auto_495487 ) ) ( not ( = ?auto_495486 ?auto_495488 ) ) ( not ( = ?auto_495486 ?auto_495489 ) ) ( not ( = ?auto_495486 ?auto_495490 ) ) ( not ( = ?auto_495486 ?auto_495491 ) ) ( not ( = ?auto_495487 ?auto_495488 ) ) ( not ( = ?auto_495487 ?auto_495489 ) ) ( not ( = ?auto_495487 ?auto_495490 ) ) ( not ( = ?auto_495487 ?auto_495491 ) ) ( not ( = ?auto_495488 ?auto_495489 ) ) ( not ( = ?auto_495488 ?auto_495490 ) ) ( not ( = ?auto_495488 ?auto_495491 ) ) ( not ( = ?auto_495489 ?auto_495490 ) ) ( not ( = ?auto_495489 ?auto_495491 ) ) ( not ( = ?auto_495490 ?auto_495491 ) ) ( ON ?auto_495490 ?auto_495491 ) ( ON ?auto_495489 ?auto_495490 ) ( CLEAR ?auto_495487 ) ( ON ?auto_495488 ?auto_495489 ) ( CLEAR ?auto_495488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_495476 ?auto_495477 ?auto_495478 ?auto_495479 ?auto_495480 ?auto_495481 ?auto_495482 ?auto_495483 ?auto_495484 ?auto_495485 ?auto_495486 ?auto_495487 ?auto_495488 )
      ( MAKE-16PILE ?auto_495476 ?auto_495477 ?auto_495478 ?auto_495479 ?auto_495480 ?auto_495481 ?auto_495482 ?auto_495483 ?auto_495484 ?auto_495485 ?auto_495486 ?auto_495487 ?auto_495488 ?auto_495489 ?auto_495490 ?auto_495491 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495508 - BLOCK
      ?auto_495509 - BLOCK
      ?auto_495510 - BLOCK
      ?auto_495511 - BLOCK
      ?auto_495512 - BLOCK
      ?auto_495513 - BLOCK
      ?auto_495514 - BLOCK
      ?auto_495515 - BLOCK
      ?auto_495516 - BLOCK
      ?auto_495517 - BLOCK
      ?auto_495518 - BLOCK
      ?auto_495519 - BLOCK
      ?auto_495520 - BLOCK
      ?auto_495521 - BLOCK
      ?auto_495522 - BLOCK
      ?auto_495523 - BLOCK
    )
    :vars
    (
      ?auto_495524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495523 ?auto_495524 ) ( ON-TABLE ?auto_495508 ) ( ON ?auto_495509 ?auto_495508 ) ( ON ?auto_495510 ?auto_495509 ) ( ON ?auto_495511 ?auto_495510 ) ( ON ?auto_495512 ?auto_495511 ) ( ON ?auto_495513 ?auto_495512 ) ( ON ?auto_495514 ?auto_495513 ) ( ON ?auto_495515 ?auto_495514 ) ( ON ?auto_495516 ?auto_495515 ) ( ON ?auto_495517 ?auto_495516 ) ( ON ?auto_495518 ?auto_495517 ) ( not ( = ?auto_495508 ?auto_495509 ) ) ( not ( = ?auto_495508 ?auto_495510 ) ) ( not ( = ?auto_495508 ?auto_495511 ) ) ( not ( = ?auto_495508 ?auto_495512 ) ) ( not ( = ?auto_495508 ?auto_495513 ) ) ( not ( = ?auto_495508 ?auto_495514 ) ) ( not ( = ?auto_495508 ?auto_495515 ) ) ( not ( = ?auto_495508 ?auto_495516 ) ) ( not ( = ?auto_495508 ?auto_495517 ) ) ( not ( = ?auto_495508 ?auto_495518 ) ) ( not ( = ?auto_495508 ?auto_495519 ) ) ( not ( = ?auto_495508 ?auto_495520 ) ) ( not ( = ?auto_495508 ?auto_495521 ) ) ( not ( = ?auto_495508 ?auto_495522 ) ) ( not ( = ?auto_495508 ?auto_495523 ) ) ( not ( = ?auto_495508 ?auto_495524 ) ) ( not ( = ?auto_495509 ?auto_495510 ) ) ( not ( = ?auto_495509 ?auto_495511 ) ) ( not ( = ?auto_495509 ?auto_495512 ) ) ( not ( = ?auto_495509 ?auto_495513 ) ) ( not ( = ?auto_495509 ?auto_495514 ) ) ( not ( = ?auto_495509 ?auto_495515 ) ) ( not ( = ?auto_495509 ?auto_495516 ) ) ( not ( = ?auto_495509 ?auto_495517 ) ) ( not ( = ?auto_495509 ?auto_495518 ) ) ( not ( = ?auto_495509 ?auto_495519 ) ) ( not ( = ?auto_495509 ?auto_495520 ) ) ( not ( = ?auto_495509 ?auto_495521 ) ) ( not ( = ?auto_495509 ?auto_495522 ) ) ( not ( = ?auto_495509 ?auto_495523 ) ) ( not ( = ?auto_495509 ?auto_495524 ) ) ( not ( = ?auto_495510 ?auto_495511 ) ) ( not ( = ?auto_495510 ?auto_495512 ) ) ( not ( = ?auto_495510 ?auto_495513 ) ) ( not ( = ?auto_495510 ?auto_495514 ) ) ( not ( = ?auto_495510 ?auto_495515 ) ) ( not ( = ?auto_495510 ?auto_495516 ) ) ( not ( = ?auto_495510 ?auto_495517 ) ) ( not ( = ?auto_495510 ?auto_495518 ) ) ( not ( = ?auto_495510 ?auto_495519 ) ) ( not ( = ?auto_495510 ?auto_495520 ) ) ( not ( = ?auto_495510 ?auto_495521 ) ) ( not ( = ?auto_495510 ?auto_495522 ) ) ( not ( = ?auto_495510 ?auto_495523 ) ) ( not ( = ?auto_495510 ?auto_495524 ) ) ( not ( = ?auto_495511 ?auto_495512 ) ) ( not ( = ?auto_495511 ?auto_495513 ) ) ( not ( = ?auto_495511 ?auto_495514 ) ) ( not ( = ?auto_495511 ?auto_495515 ) ) ( not ( = ?auto_495511 ?auto_495516 ) ) ( not ( = ?auto_495511 ?auto_495517 ) ) ( not ( = ?auto_495511 ?auto_495518 ) ) ( not ( = ?auto_495511 ?auto_495519 ) ) ( not ( = ?auto_495511 ?auto_495520 ) ) ( not ( = ?auto_495511 ?auto_495521 ) ) ( not ( = ?auto_495511 ?auto_495522 ) ) ( not ( = ?auto_495511 ?auto_495523 ) ) ( not ( = ?auto_495511 ?auto_495524 ) ) ( not ( = ?auto_495512 ?auto_495513 ) ) ( not ( = ?auto_495512 ?auto_495514 ) ) ( not ( = ?auto_495512 ?auto_495515 ) ) ( not ( = ?auto_495512 ?auto_495516 ) ) ( not ( = ?auto_495512 ?auto_495517 ) ) ( not ( = ?auto_495512 ?auto_495518 ) ) ( not ( = ?auto_495512 ?auto_495519 ) ) ( not ( = ?auto_495512 ?auto_495520 ) ) ( not ( = ?auto_495512 ?auto_495521 ) ) ( not ( = ?auto_495512 ?auto_495522 ) ) ( not ( = ?auto_495512 ?auto_495523 ) ) ( not ( = ?auto_495512 ?auto_495524 ) ) ( not ( = ?auto_495513 ?auto_495514 ) ) ( not ( = ?auto_495513 ?auto_495515 ) ) ( not ( = ?auto_495513 ?auto_495516 ) ) ( not ( = ?auto_495513 ?auto_495517 ) ) ( not ( = ?auto_495513 ?auto_495518 ) ) ( not ( = ?auto_495513 ?auto_495519 ) ) ( not ( = ?auto_495513 ?auto_495520 ) ) ( not ( = ?auto_495513 ?auto_495521 ) ) ( not ( = ?auto_495513 ?auto_495522 ) ) ( not ( = ?auto_495513 ?auto_495523 ) ) ( not ( = ?auto_495513 ?auto_495524 ) ) ( not ( = ?auto_495514 ?auto_495515 ) ) ( not ( = ?auto_495514 ?auto_495516 ) ) ( not ( = ?auto_495514 ?auto_495517 ) ) ( not ( = ?auto_495514 ?auto_495518 ) ) ( not ( = ?auto_495514 ?auto_495519 ) ) ( not ( = ?auto_495514 ?auto_495520 ) ) ( not ( = ?auto_495514 ?auto_495521 ) ) ( not ( = ?auto_495514 ?auto_495522 ) ) ( not ( = ?auto_495514 ?auto_495523 ) ) ( not ( = ?auto_495514 ?auto_495524 ) ) ( not ( = ?auto_495515 ?auto_495516 ) ) ( not ( = ?auto_495515 ?auto_495517 ) ) ( not ( = ?auto_495515 ?auto_495518 ) ) ( not ( = ?auto_495515 ?auto_495519 ) ) ( not ( = ?auto_495515 ?auto_495520 ) ) ( not ( = ?auto_495515 ?auto_495521 ) ) ( not ( = ?auto_495515 ?auto_495522 ) ) ( not ( = ?auto_495515 ?auto_495523 ) ) ( not ( = ?auto_495515 ?auto_495524 ) ) ( not ( = ?auto_495516 ?auto_495517 ) ) ( not ( = ?auto_495516 ?auto_495518 ) ) ( not ( = ?auto_495516 ?auto_495519 ) ) ( not ( = ?auto_495516 ?auto_495520 ) ) ( not ( = ?auto_495516 ?auto_495521 ) ) ( not ( = ?auto_495516 ?auto_495522 ) ) ( not ( = ?auto_495516 ?auto_495523 ) ) ( not ( = ?auto_495516 ?auto_495524 ) ) ( not ( = ?auto_495517 ?auto_495518 ) ) ( not ( = ?auto_495517 ?auto_495519 ) ) ( not ( = ?auto_495517 ?auto_495520 ) ) ( not ( = ?auto_495517 ?auto_495521 ) ) ( not ( = ?auto_495517 ?auto_495522 ) ) ( not ( = ?auto_495517 ?auto_495523 ) ) ( not ( = ?auto_495517 ?auto_495524 ) ) ( not ( = ?auto_495518 ?auto_495519 ) ) ( not ( = ?auto_495518 ?auto_495520 ) ) ( not ( = ?auto_495518 ?auto_495521 ) ) ( not ( = ?auto_495518 ?auto_495522 ) ) ( not ( = ?auto_495518 ?auto_495523 ) ) ( not ( = ?auto_495518 ?auto_495524 ) ) ( not ( = ?auto_495519 ?auto_495520 ) ) ( not ( = ?auto_495519 ?auto_495521 ) ) ( not ( = ?auto_495519 ?auto_495522 ) ) ( not ( = ?auto_495519 ?auto_495523 ) ) ( not ( = ?auto_495519 ?auto_495524 ) ) ( not ( = ?auto_495520 ?auto_495521 ) ) ( not ( = ?auto_495520 ?auto_495522 ) ) ( not ( = ?auto_495520 ?auto_495523 ) ) ( not ( = ?auto_495520 ?auto_495524 ) ) ( not ( = ?auto_495521 ?auto_495522 ) ) ( not ( = ?auto_495521 ?auto_495523 ) ) ( not ( = ?auto_495521 ?auto_495524 ) ) ( not ( = ?auto_495522 ?auto_495523 ) ) ( not ( = ?auto_495522 ?auto_495524 ) ) ( not ( = ?auto_495523 ?auto_495524 ) ) ( ON ?auto_495522 ?auto_495523 ) ( ON ?auto_495521 ?auto_495522 ) ( ON ?auto_495520 ?auto_495521 ) ( CLEAR ?auto_495518 ) ( ON ?auto_495519 ?auto_495520 ) ( CLEAR ?auto_495519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_495508 ?auto_495509 ?auto_495510 ?auto_495511 ?auto_495512 ?auto_495513 ?auto_495514 ?auto_495515 ?auto_495516 ?auto_495517 ?auto_495518 ?auto_495519 )
      ( MAKE-16PILE ?auto_495508 ?auto_495509 ?auto_495510 ?auto_495511 ?auto_495512 ?auto_495513 ?auto_495514 ?auto_495515 ?auto_495516 ?auto_495517 ?auto_495518 ?auto_495519 ?auto_495520 ?auto_495521 ?auto_495522 ?auto_495523 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495541 - BLOCK
      ?auto_495542 - BLOCK
      ?auto_495543 - BLOCK
      ?auto_495544 - BLOCK
      ?auto_495545 - BLOCK
      ?auto_495546 - BLOCK
      ?auto_495547 - BLOCK
      ?auto_495548 - BLOCK
      ?auto_495549 - BLOCK
      ?auto_495550 - BLOCK
      ?auto_495551 - BLOCK
      ?auto_495552 - BLOCK
      ?auto_495553 - BLOCK
      ?auto_495554 - BLOCK
      ?auto_495555 - BLOCK
      ?auto_495556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_495556 ) ( ON-TABLE ?auto_495541 ) ( ON ?auto_495542 ?auto_495541 ) ( ON ?auto_495543 ?auto_495542 ) ( ON ?auto_495544 ?auto_495543 ) ( ON ?auto_495545 ?auto_495544 ) ( ON ?auto_495546 ?auto_495545 ) ( ON ?auto_495547 ?auto_495546 ) ( ON ?auto_495548 ?auto_495547 ) ( ON ?auto_495549 ?auto_495548 ) ( ON ?auto_495550 ?auto_495549 ) ( ON ?auto_495551 ?auto_495550 ) ( not ( = ?auto_495541 ?auto_495542 ) ) ( not ( = ?auto_495541 ?auto_495543 ) ) ( not ( = ?auto_495541 ?auto_495544 ) ) ( not ( = ?auto_495541 ?auto_495545 ) ) ( not ( = ?auto_495541 ?auto_495546 ) ) ( not ( = ?auto_495541 ?auto_495547 ) ) ( not ( = ?auto_495541 ?auto_495548 ) ) ( not ( = ?auto_495541 ?auto_495549 ) ) ( not ( = ?auto_495541 ?auto_495550 ) ) ( not ( = ?auto_495541 ?auto_495551 ) ) ( not ( = ?auto_495541 ?auto_495552 ) ) ( not ( = ?auto_495541 ?auto_495553 ) ) ( not ( = ?auto_495541 ?auto_495554 ) ) ( not ( = ?auto_495541 ?auto_495555 ) ) ( not ( = ?auto_495541 ?auto_495556 ) ) ( not ( = ?auto_495542 ?auto_495543 ) ) ( not ( = ?auto_495542 ?auto_495544 ) ) ( not ( = ?auto_495542 ?auto_495545 ) ) ( not ( = ?auto_495542 ?auto_495546 ) ) ( not ( = ?auto_495542 ?auto_495547 ) ) ( not ( = ?auto_495542 ?auto_495548 ) ) ( not ( = ?auto_495542 ?auto_495549 ) ) ( not ( = ?auto_495542 ?auto_495550 ) ) ( not ( = ?auto_495542 ?auto_495551 ) ) ( not ( = ?auto_495542 ?auto_495552 ) ) ( not ( = ?auto_495542 ?auto_495553 ) ) ( not ( = ?auto_495542 ?auto_495554 ) ) ( not ( = ?auto_495542 ?auto_495555 ) ) ( not ( = ?auto_495542 ?auto_495556 ) ) ( not ( = ?auto_495543 ?auto_495544 ) ) ( not ( = ?auto_495543 ?auto_495545 ) ) ( not ( = ?auto_495543 ?auto_495546 ) ) ( not ( = ?auto_495543 ?auto_495547 ) ) ( not ( = ?auto_495543 ?auto_495548 ) ) ( not ( = ?auto_495543 ?auto_495549 ) ) ( not ( = ?auto_495543 ?auto_495550 ) ) ( not ( = ?auto_495543 ?auto_495551 ) ) ( not ( = ?auto_495543 ?auto_495552 ) ) ( not ( = ?auto_495543 ?auto_495553 ) ) ( not ( = ?auto_495543 ?auto_495554 ) ) ( not ( = ?auto_495543 ?auto_495555 ) ) ( not ( = ?auto_495543 ?auto_495556 ) ) ( not ( = ?auto_495544 ?auto_495545 ) ) ( not ( = ?auto_495544 ?auto_495546 ) ) ( not ( = ?auto_495544 ?auto_495547 ) ) ( not ( = ?auto_495544 ?auto_495548 ) ) ( not ( = ?auto_495544 ?auto_495549 ) ) ( not ( = ?auto_495544 ?auto_495550 ) ) ( not ( = ?auto_495544 ?auto_495551 ) ) ( not ( = ?auto_495544 ?auto_495552 ) ) ( not ( = ?auto_495544 ?auto_495553 ) ) ( not ( = ?auto_495544 ?auto_495554 ) ) ( not ( = ?auto_495544 ?auto_495555 ) ) ( not ( = ?auto_495544 ?auto_495556 ) ) ( not ( = ?auto_495545 ?auto_495546 ) ) ( not ( = ?auto_495545 ?auto_495547 ) ) ( not ( = ?auto_495545 ?auto_495548 ) ) ( not ( = ?auto_495545 ?auto_495549 ) ) ( not ( = ?auto_495545 ?auto_495550 ) ) ( not ( = ?auto_495545 ?auto_495551 ) ) ( not ( = ?auto_495545 ?auto_495552 ) ) ( not ( = ?auto_495545 ?auto_495553 ) ) ( not ( = ?auto_495545 ?auto_495554 ) ) ( not ( = ?auto_495545 ?auto_495555 ) ) ( not ( = ?auto_495545 ?auto_495556 ) ) ( not ( = ?auto_495546 ?auto_495547 ) ) ( not ( = ?auto_495546 ?auto_495548 ) ) ( not ( = ?auto_495546 ?auto_495549 ) ) ( not ( = ?auto_495546 ?auto_495550 ) ) ( not ( = ?auto_495546 ?auto_495551 ) ) ( not ( = ?auto_495546 ?auto_495552 ) ) ( not ( = ?auto_495546 ?auto_495553 ) ) ( not ( = ?auto_495546 ?auto_495554 ) ) ( not ( = ?auto_495546 ?auto_495555 ) ) ( not ( = ?auto_495546 ?auto_495556 ) ) ( not ( = ?auto_495547 ?auto_495548 ) ) ( not ( = ?auto_495547 ?auto_495549 ) ) ( not ( = ?auto_495547 ?auto_495550 ) ) ( not ( = ?auto_495547 ?auto_495551 ) ) ( not ( = ?auto_495547 ?auto_495552 ) ) ( not ( = ?auto_495547 ?auto_495553 ) ) ( not ( = ?auto_495547 ?auto_495554 ) ) ( not ( = ?auto_495547 ?auto_495555 ) ) ( not ( = ?auto_495547 ?auto_495556 ) ) ( not ( = ?auto_495548 ?auto_495549 ) ) ( not ( = ?auto_495548 ?auto_495550 ) ) ( not ( = ?auto_495548 ?auto_495551 ) ) ( not ( = ?auto_495548 ?auto_495552 ) ) ( not ( = ?auto_495548 ?auto_495553 ) ) ( not ( = ?auto_495548 ?auto_495554 ) ) ( not ( = ?auto_495548 ?auto_495555 ) ) ( not ( = ?auto_495548 ?auto_495556 ) ) ( not ( = ?auto_495549 ?auto_495550 ) ) ( not ( = ?auto_495549 ?auto_495551 ) ) ( not ( = ?auto_495549 ?auto_495552 ) ) ( not ( = ?auto_495549 ?auto_495553 ) ) ( not ( = ?auto_495549 ?auto_495554 ) ) ( not ( = ?auto_495549 ?auto_495555 ) ) ( not ( = ?auto_495549 ?auto_495556 ) ) ( not ( = ?auto_495550 ?auto_495551 ) ) ( not ( = ?auto_495550 ?auto_495552 ) ) ( not ( = ?auto_495550 ?auto_495553 ) ) ( not ( = ?auto_495550 ?auto_495554 ) ) ( not ( = ?auto_495550 ?auto_495555 ) ) ( not ( = ?auto_495550 ?auto_495556 ) ) ( not ( = ?auto_495551 ?auto_495552 ) ) ( not ( = ?auto_495551 ?auto_495553 ) ) ( not ( = ?auto_495551 ?auto_495554 ) ) ( not ( = ?auto_495551 ?auto_495555 ) ) ( not ( = ?auto_495551 ?auto_495556 ) ) ( not ( = ?auto_495552 ?auto_495553 ) ) ( not ( = ?auto_495552 ?auto_495554 ) ) ( not ( = ?auto_495552 ?auto_495555 ) ) ( not ( = ?auto_495552 ?auto_495556 ) ) ( not ( = ?auto_495553 ?auto_495554 ) ) ( not ( = ?auto_495553 ?auto_495555 ) ) ( not ( = ?auto_495553 ?auto_495556 ) ) ( not ( = ?auto_495554 ?auto_495555 ) ) ( not ( = ?auto_495554 ?auto_495556 ) ) ( not ( = ?auto_495555 ?auto_495556 ) ) ( ON ?auto_495555 ?auto_495556 ) ( ON ?auto_495554 ?auto_495555 ) ( ON ?auto_495553 ?auto_495554 ) ( CLEAR ?auto_495551 ) ( ON ?auto_495552 ?auto_495553 ) ( CLEAR ?auto_495552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_495541 ?auto_495542 ?auto_495543 ?auto_495544 ?auto_495545 ?auto_495546 ?auto_495547 ?auto_495548 ?auto_495549 ?auto_495550 ?auto_495551 ?auto_495552 )
      ( MAKE-16PILE ?auto_495541 ?auto_495542 ?auto_495543 ?auto_495544 ?auto_495545 ?auto_495546 ?auto_495547 ?auto_495548 ?auto_495549 ?auto_495550 ?auto_495551 ?auto_495552 ?auto_495553 ?auto_495554 ?auto_495555 ?auto_495556 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495573 - BLOCK
      ?auto_495574 - BLOCK
      ?auto_495575 - BLOCK
      ?auto_495576 - BLOCK
      ?auto_495577 - BLOCK
      ?auto_495578 - BLOCK
      ?auto_495579 - BLOCK
      ?auto_495580 - BLOCK
      ?auto_495581 - BLOCK
      ?auto_495582 - BLOCK
      ?auto_495583 - BLOCK
      ?auto_495584 - BLOCK
      ?auto_495585 - BLOCK
      ?auto_495586 - BLOCK
      ?auto_495587 - BLOCK
      ?auto_495588 - BLOCK
    )
    :vars
    (
      ?auto_495589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495588 ?auto_495589 ) ( ON-TABLE ?auto_495573 ) ( ON ?auto_495574 ?auto_495573 ) ( ON ?auto_495575 ?auto_495574 ) ( ON ?auto_495576 ?auto_495575 ) ( ON ?auto_495577 ?auto_495576 ) ( ON ?auto_495578 ?auto_495577 ) ( ON ?auto_495579 ?auto_495578 ) ( ON ?auto_495580 ?auto_495579 ) ( ON ?auto_495581 ?auto_495580 ) ( ON ?auto_495582 ?auto_495581 ) ( not ( = ?auto_495573 ?auto_495574 ) ) ( not ( = ?auto_495573 ?auto_495575 ) ) ( not ( = ?auto_495573 ?auto_495576 ) ) ( not ( = ?auto_495573 ?auto_495577 ) ) ( not ( = ?auto_495573 ?auto_495578 ) ) ( not ( = ?auto_495573 ?auto_495579 ) ) ( not ( = ?auto_495573 ?auto_495580 ) ) ( not ( = ?auto_495573 ?auto_495581 ) ) ( not ( = ?auto_495573 ?auto_495582 ) ) ( not ( = ?auto_495573 ?auto_495583 ) ) ( not ( = ?auto_495573 ?auto_495584 ) ) ( not ( = ?auto_495573 ?auto_495585 ) ) ( not ( = ?auto_495573 ?auto_495586 ) ) ( not ( = ?auto_495573 ?auto_495587 ) ) ( not ( = ?auto_495573 ?auto_495588 ) ) ( not ( = ?auto_495573 ?auto_495589 ) ) ( not ( = ?auto_495574 ?auto_495575 ) ) ( not ( = ?auto_495574 ?auto_495576 ) ) ( not ( = ?auto_495574 ?auto_495577 ) ) ( not ( = ?auto_495574 ?auto_495578 ) ) ( not ( = ?auto_495574 ?auto_495579 ) ) ( not ( = ?auto_495574 ?auto_495580 ) ) ( not ( = ?auto_495574 ?auto_495581 ) ) ( not ( = ?auto_495574 ?auto_495582 ) ) ( not ( = ?auto_495574 ?auto_495583 ) ) ( not ( = ?auto_495574 ?auto_495584 ) ) ( not ( = ?auto_495574 ?auto_495585 ) ) ( not ( = ?auto_495574 ?auto_495586 ) ) ( not ( = ?auto_495574 ?auto_495587 ) ) ( not ( = ?auto_495574 ?auto_495588 ) ) ( not ( = ?auto_495574 ?auto_495589 ) ) ( not ( = ?auto_495575 ?auto_495576 ) ) ( not ( = ?auto_495575 ?auto_495577 ) ) ( not ( = ?auto_495575 ?auto_495578 ) ) ( not ( = ?auto_495575 ?auto_495579 ) ) ( not ( = ?auto_495575 ?auto_495580 ) ) ( not ( = ?auto_495575 ?auto_495581 ) ) ( not ( = ?auto_495575 ?auto_495582 ) ) ( not ( = ?auto_495575 ?auto_495583 ) ) ( not ( = ?auto_495575 ?auto_495584 ) ) ( not ( = ?auto_495575 ?auto_495585 ) ) ( not ( = ?auto_495575 ?auto_495586 ) ) ( not ( = ?auto_495575 ?auto_495587 ) ) ( not ( = ?auto_495575 ?auto_495588 ) ) ( not ( = ?auto_495575 ?auto_495589 ) ) ( not ( = ?auto_495576 ?auto_495577 ) ) ( not ( = ?auto_495576 ?auto_495578 ) ) ( not ( = ?auto_495576 ?auto_495579 ) ) ( not ( = ?auto_495576 ?auto_495580 ) ) ( not ( = ?auto_495576 ?auto_495581 ) ) ( not ( = ?auto_495576 ?auto_495582 ) ) ( not ( = ?auto_495576 ?auto_495583 ) ) ( not ( = ?auto_495576 ?auto_495584 ) ) ( not ( = ?auto_495576 ?auto_495585 ) ) ( not ( = ?auto_495576 ?auto_495586 ) ) ( not ( = ?auto_495576 ?auto_495587 ) ) ( not ( = ?auto_495576 ?auto_495588 ) ) ( not ( = ?auto_495576 ?auto_495589 ) ) ( not ( = ?auto_495577 ?auto_495578 ) ) ( not ( = ?auto_495577 ?auto_495579 ) ) ( not ( = ?auto_495577 ?auto_495580 ) ) ( not ( = ?auto_495577 ?auto_495581 ) ) ( not ( = ?auto_495577 ?auto_495582 ) ) ( not ( = ?auto_495577 ?auto_495583 ) ) ( not ( = ?auto_495577 ?auto_495584 ) ) ( not ( = ?auto_495577 ?auto_495585 ) ) ( not ( = ?auto_495577 ?auto_495586 ) ) ( not ( = ?auto_495577 ?auto_495587 ) ) ( not ( = ?auto_495577 ?auto_495588 ) ) ( not ( = ?auto_495577 ?auto_495589 ) ) ( not ( = ?auto_495578 ?auto_495579 ) ) ( not ( = ?auto_495578 ?auto_495580 ) ) ( not ( = ?auto_495578 ?auto_495581 ) ) ( not ( = ?auto_495578 ?auto_495582 ) ) ( not ( = ?auto_495578 ?auto_495583 ) ) ( not ( = ?auto_495578 ?auto_495584 ) ) ( not ( = ?auto_495578 ?auto_495585 ) ) ( not ( = ?auto_495578 ?auto_495586 ) ) ( not ( = ?auto_495578 ?auto_495587 ) ) ( not ( = ?auto_495578 ?auto_495588 ) ) ( not ( = ?auto_495578 ?auto_495589 ) ) ( not ( = ?auto_495579 ?auto_495580 ) ) ( not ( = ?auto_495579 ?auto_495581 ) ) ( not ( = ?auto_495579 ?auto_495582 ) ) ( not ( = ?auto_495579 ?auto_495583 ) ) ( not ( = ?auto_495579 ?auto_495584 ) ) ( not ( = ?auto_495579 ?auto_495585 ) ) ( not ( = ?auto_495579 ?auto_495586 ) ) ( not ( = ?auto_495579 ?auto_495587 ) ) ( not ( = ?auto_495579 ?auto_495588 ) ) ( not ( = ?auto_495579 ?auto_495589 ) ) ( not ( = ?auto_495580 ?auto_495581 ) ) ( not ( = ?auto_495580 ?auto_495582 ) ) ( not ( = ?auto_495580 ?auto_495583 ) ) ( not ( = ?auto_495580 ?auto_495584 ) ) ( not ( = ?auto_495580 ?auto_495585 ) ) ( not ( = ?auto_495580 ?auto_495586 ) ) ( not ( = ?auto_495580 ?auto_495587 ) ) ( not ( = ?auto_495580 ?auto_495588 ) ) ( not ( = ?auto_495580 ?auto_495589 ) ) ( not ( = ?auto_495581 ?auto_495582 ) ) ( not ( = ?auto_495581 ?auto_495583 ) ) ( not ( = ?auto_495581 ?auto_495584 ) ) ( not ( = ?auto_495581 ?auto_495585 ) ) ( not ( = ?auto_495581 ?auto_495586 ) ) ( not ( = ?auto_495581 ?auto_495587 ) ) ( not ( = ?auto_495581 ?auto_495588 ) ) ( not ( = ?auto_495581 ?auto_495589 ) ) ( not ( = ?auto_495582 ?auto_495583 ) ) ( not ( = ?auto_495582 ?auto_495584 ) ) ( not ( = ?auto_495582 ?auto_495585 ) ) ( not ( = ?auto_495582 ?auto_495586 ) ) ( not ( = ?auto_495582 ?auto_495587 ) ) ( not ( = ?auto_495582 ?auto_495588 ) ) ( not ( = ?auto_495582 ?auto_495589 ) ) ( not ( = ?auto_495583 ?auto_495584 ) ) ( not ( = ?auto_495583 ?auto_495585 ) ) ( not ( = ?auto_495583 ?auto_495586 ) ) ( not ( = ?auto_495583 ?auto_495587 ) ) ( not ( = ?auto_495583 ?auto_495588 ) ) ( not ( = ?auto_495583 ?auto_495589 ) ) ( not ( = ?auto_495584 ?auto_495585 ) ) ( not ( = ?auto_495584 ?auto_495586 ) ) ( not ( = ?auto_495584 ?auto_495587 ) ) ( not ( = ?auto_495584 ?auto_495588 ) ) ( not ( = ?auto_495584 ?auto_495589 ) ) ( not ( = ?auto_495585 ?auto_495586 ) ) ( not ( = ?auto_495585 ?auto_495587 ) ) ( not ( = ?auto_495585 ?auto_495588 ) ) ( not ( = ?auto_495585 ?auto_495589 ) ) ( not ( = ?auto_495586 ?auto_495587 ) ) ( not ( = ?auto_495586 ?auto_495588 ) ) ( not ( = ?auto_495586 ?auto_495589 ) ) ( not ( = ?auto_495587 ?auto_495588 ) ) ( not ( = ?auto_495587 ?auto_495589 ) ) ( not ( = ?auto_495588 ?auto_495589 ) ) ( ON ?auto_495587 ?auto_495588 ) ( ON ?auto_495586 ?auto_495587 ) ( ON ?auto_495585 ?auto_495586 ) ( ON ?auto_495584 ?auto_495585 ) ( CLEAR ?auto_495582 ) ( ON ?auto_495583 ?auto_495584 ) ( CLEAR ?auto_495583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_495573 ?auto_495574 ?auto_495575 ?auto_495576 ?auto_495577 ?auto_495578 ?auto_495579 ?auto_495580 ?auto_495581 ?auto_495582 ?auto_495583 )
      ( MAKE-16PILE ?auto_495573 ?auto_495574 ?auto_495575 ?auto_495576 ?auto_495577 ?auto_495578 ?auto_495579 ?auto_495580 ?auto_495581 ?auto_495582 ?auto_495583 ?auto_495584 ?auto_495585 ?auto_495586 ?auto_495587 ?auto_495588 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495606 - BLOCK
      ?auto_495607 - BLOCK
      ?auto_495608 - BLOCK
      ?auto_495609 - BLOCK
      ?auto_495610 - BLOCK
      ?auto_495611 - BLOCK
      ?auto_495612 - BLOCK
      ?auto_495613 - BLOCK
      ?auto_495614 - BLOCK
      ?auto_495615 - BLOCK
      ?auto_495616 - BLOCK
      ?auto_495617 - BLOCK
      ?auto_495618 - BLOCK
      ?auto_495619 - BLOCK
      ?auto_495620 - BLOCK
      ?auto_495621 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_495621 ) ( ON-TABLE ?auto_495606 ) ( ON ?auto_495607 ?auto_495606 ) ( ON ?auto_495608 ?auto_495607 ) ( ON ?auto_495609 ?auto_495608 ) ( ON ?auto_495610 ?auto_495609 ) ( ON ?auto_495611 ?auto_495610 ) ( ON ?auto_495612 ?auto_495611 ) ( ON ?auto_495613 ?auto_495612 ) ( ON ?auto_495614 ?auto_495613 ) ( ON ?auto_495615 ?auto_495614 ) ( not ( = ?auto_495606 ?auto_495607 ) ) ( not ( = ?auto_495606 ?auto_495608 ) ) ( not ( = ?auto_495606 ?auto_495609 ) ) ( not ( = ?auto_495606 ?auto_495610 ) ) ( not ( = ?auto_495606 ?auto_495611 ) ) ( not ( = ?auto_495606 ?auto_495612 ) ) ( not ( = ?auto_495606 ?auto_495613 ) ) ( not ( = ?auto_495606 ?auto_495614 ) ) ( not ( = ?auto_495606 ?auto_495615 ) ) ( not ( = ?auto_495606 ?auto_495616 ) ) ( not ( = ?auto_495606 ?auto_495617 ) ) ( not ( = ?auto_495606 ?auto_495618 ) ) ( not ( = ?auto_495606 ?auto_495619 ) ) ( not ( = ?auto_495606 ?auto_495620 ) ) ( not ( = ?auto_495606 ?auto_495621 ) ) ( not ( = ?auto_495607 ?auto_495608 ) ) ( not ( = ?auto_495607 ?auto_495609 ) ) ( not ( = ?auto_495607 ?auto_495610 ) ) ( not ( = ?auto_495607 ?auto_495611 ) ) ( not ( = ?auto_495607 ?auto_495612 ) ) ( not ( = ?auto_495607 ?auto_495613 ) ) ( not ( = ?auto_495607 ?auto_495614 ) ) ( not ( = ?auto_495607 ?auto_495615 ) ) ( not ( = ?auto_495607 ?auto_495616 ) ) ( not ( = ?auto_495607 ?auto_495617 ) ) ( not ( = ?auto_495607 ?auto_495618 ) ) ( not ( = ?auto_495607 ?auto_495619 ) ) ( not ( = ?auto_495607 ?auto_495620 ) ) ( not ( = ?auto_495607 ?auto_495621 ) ) ( not ( = ?auto_495608 ?auto_495609 ) ) ( not ( = ?auto_495608 ?auto_495610 ) ) ( not ( = ?auto_495608 ?auto_495611 ) ) ( not ( = ?auto_495608 ?auto_495612 ) ) ( not ( = ?auto_495608 ?auto_495613 ) ) ( not ( = ?auto_495608 ?auto_495614 ) ) ( not ( = ?auto_495608 ?auto_495615 ) ) ( not ( = ?auto_495608 ?auto_495616 ) ) ( not ( = ?auto_495608 ?auto_495617 ) ) ( not ( = ?auto_495608 ?auto_495618 ) ) ( not ( = ?auto_495608 ?auto_495619 ) ) ( not ( = ?auto_495608 ?auto_495620 ) ) ( not ( = ?auto_495608 ?auto_495621 ) ) ( not ( = ?auto_495609 ?auto_495610 ) ) ( not ( = ?auto_495609 ?auto_495611 ) ) ( not ( = ?auto_495609 ?auto_495612 ) ) ( not ( = ?auto_495609 ?auto_495613 ) ) ( not ( = ?auto_495609 ?auto_495614 ) ) ( not ( = ?auto_495609 ?auto_495615 ) ) ( not ( = ?auto_495609 ?auto_495616 ) ) ( not ( = ?auto_495609 ?auto_495617 ) ) ( not ( = ?auto_495609 ?auto_495618 ) ) ( not ( = ?auto_495609 ?auto_495619 ) ) ( not ( = ?auto_495609 ?auto_495620 ) ) ( not ( = ?auto_495609 ?auto_495621 ) ) ( not ( = ?auto_495610 ?auto_495611 ) ) ( not ( = ?auto_495610 ?auto_495612 ) ) ( not ( = ?auto_495610 ?auto_495613 ) ) ( not ( = ?auto_495610 ?auto_495614 ) ) ( not ( = ?auto_495610 ?auto_495615 ) ) ( not ( = ?auto_495610 ?auto_495616 ) ) ( not ( = ?auto_495610 ?auto_495617 ) ) ( not ( = ?auto_495610 ?auto_495618 ) ) ( not ( = ?auto_495610 ?auto_495619 ) ) ( not ( = ?auto_495610 ?auto_495620 ) ) ( not ( = ?auto_495610 ?auto_495621 ) ) ( not ( = ?auto_495611 ?auto_495612 ) ) ( not ( = ?auto_495611 ?auto_495613 ) ) ( not ( = ?auto_495611 ?auto_495614 ) ) ( not ( = ?auto_495611 ?auto_495615 ) ) ( not ( = ?auto_495611 ?auto_495616 ) ) ( not ( = ?auto_495611 ?auto_495617 ) ) ( not ( = ?auto_495611 ?auto_495618 ) ) ( not ( = ?auto_495611 ?auto_495619 ) ) ( not ( = ?auto_495611 ?auto_495620 ) ) ( not ( = ?auto_495611 ?auto_495621 ) ) ( not ( = ?auto_495612 ?auto_495613 ) ) ( not ( = ?auto_495612 ?auto_495614 ) ) ( not ( = ?auto_495612 ?auto_495615 ) ) ( not ( = ?auto_495612 ?auto_495616 ) ) ( not ( = ?auto_495612 ?auto_495617 ) ) ( not ( = ?auto_495612 ?auto_495618 ) ) ( not ( = ?auto_495612 ?auto_495619 ) ) ( not ( = ?auto_495612 ?auto_495620 ) ) ( not ( = ?auto_495612 ?auto_495621 ) ) ( not ( = ?auto_495613 ?auto_495614 ) ) ( not ( = ?auto_495613 ?auto_495615 ) ) ( not ( = ?auto_495613 ?auto_495616 ) ) ( not ( = ?auto_495613 ?auto_495617 ) ) ( not ( = ?auto_495613 ?auto_495618 ) ) ( not ( = ?auto_495613 ?auto_495619 ) ) ( not ( = ?auto_495613 ?auto_495620 ) ) ( not ( = ?auto_495613 ?auto_495621 ) ) ( not ( = ?auto_495614 ?auto_495615 ) ) ( not ( = ?auto_495614 ?auto_495616 ) ) ( not ( = ?auto_495614 ?auto_495617 ) ) ( not ( = ?auto_495614 ?auto_495618 ) ) ( not ( = ?auto_495614 ?auto_495619 ) ) ( not ( = ?auto_495614 ?auto_495620 ) ) ( not ( = ?auto_495614 ?auto_495621 ) ) ( not ( = ?auto_495615 ?auto_495616 ) ) ( not ( = ?auto_495615 ?auto_495617 ) ) ( not ( = ?auto_495615 ?auto_495618 ) ) ( not ( = ?auto_495615 ?auto_495619 ) ) ( not ( = ?auto_495615 ?auto_495620 ) ) ( not ( = ?auto_495615 ?auto_495621 ) ) ( not ( = ?auto_495616 ?auto_495617 ) ) ( not ( = ?auto_495616 ?auto_495618 ) ) ( not ( = ?auto_495616 ?auto_495619 ) ) ( not ( = ?auto_495616 ?auto_495620 ) ) ( not ( = ?auto_495616 ?auto_495621 ) ) ( not ( = ?auto_495617 ?auto_495618 ) ) ( not ( = ?auto_495617 ?auto_495619 ) ) ( not ( = ?auto_495617 ?auto_495620 ) ) ( not ( = ?auto_495617 ?auto_495621 ) ) ( not ( = ?auto_495618 ?auto_495619 ) ) ( not ( = ?auto_495618 ?auto_495620 ) ) ( not ( = ?auto_495618 ?auto_495621 ) ) ( not ( = ?auto_495619 ?auto_495620 ) ) ( not ( = ?auto_495619 ?auto_495621 ) ) ( not ( = ?auto_495620 ?auto_495621 ) ) ( ON ?auto_495620 ?auto_495621 ) ( ON ?auto_495619 ?auto_495620 ) ( ON ?auto_495618 ?auto_495619 ) ( ON ?auto_495617 ?auto_495618 ) ( CLEAR ?auto_495615 ) ( ON ?auto_495616 ?auto_495617 ) ( CLEAR ?auto_495616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_495606 ?auto_495607 ?auto_495608 ?auto_495609 ?auto_495610 ?auto_495611 ?auto_495612 ?auto_495613 ?auto_495614 ?auto_495615 ?auto_495616 )
      ( MAKE-16PILE ?auto_495606 ?auto_495607 ?auto_495608 ?auto_495609 ?auto_495610 ?auto_495611 ?auto_495612 ?auto_495613 ?auto_495614 ?auto_495615 ?auto_495616 ?auto_495617 ?auto_495618 ?auto_495619 ?auto_495620 ?auto_495621 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495638 - BLOCK
      ?auto_495639 - BLOCK
      ?auto_495640 - BLOCK
      ?auto_495641 - BLOCK
      ?auto_495642 - BLOCK
      ?auto_495643 - BLOCK
      ?auto_495644 - BLOCK
      ?auto_495645 - BLOCK
      ?auto_495646 - BLOCK
      ?auto_495647 - BLOCK
      ?auto_495648 - BLOCK
      ?auto_495649 - BLOCK
      ?auto_495650 - BLOCK
      ?auto_495651 - BLOCK
      ?auto_495652 - BLOCK
      ?auto_495653 - BLOCK
    )
    :vars
    (
      ?auto_495654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495653 ?auto_495654 ) ( ON-TABLE ?auto_495638 ) ( ON ?auto_495639 ?auto_495638 ) ( ON ?auto_495640 ?auto_495639 ) ( ON ?auto_495641 ?auto_495640 ) ( ON ?auto_495642 ?auto_495641 ) ( ON ?auto_495643 ?auto_495642 ) ( ON ?auto_495644 ?auto_495643 ) ( ON ?auto_495645 ?auto_495644 ) ( ON ?auto_495646 ?auto_495645 ) ( not ( = ?auto_495638 ?auto_495639 ) ) ( not ( = ?auto_495638 ?auto_495640 ) ) ( not ( = ?auto_495638 ?auto_495641 ) ) ( not ( = ?auto_495638 ?auto_495642 ) ) ( not ( = ?auto_495638 ?auto_495643 ) ) ( not ( = ?auto_495638 ?auto_495644 ) ) ( not ( = ?auto_495638 ?auto_495645 ) ) ( not ( = ?auto_495638 ?auto_495646 ) ) ( not ( = ?auto_495638 ?auto_495647 ) ) ( not ( = ?auto_495638 ?auto_495648 ) ) ( not ( = ?auto_495638 ?auto_495649 ) ) ( not ( = ?auto_495638 ?auto_495650 ) ) ( not ( = ?auto_495638 ?auto_495651 ) ) ( not ( = ?auto_495638 ?auto_495652 ) ) ( not ( = ?auto_495638 ?auto_495653 ) ) ( not ( = ?auto_495638 ?auto_495654 ) ) ( not ( = ?auto_495639 ?auto_495640 ) ) ( not ( = ?auto_495639 ?auto_495641 ) ) ( not ( = ?auto_495639 ?auto_495642 ) ) ( not ( = ?auto_495639 ?auto_495643 ) ) ( not ( = ?auto_495639 ?auto_495644 ) ) ( not ( = ?auto_495639 ?auto_495645 ) ) ( not ( = ?auto_495639 ?auto_495646 ) ) ( not ( = ?auto_495639 ?auto_495647 ) ) ( not ( = ?auto_495639 ?auto_495648 ) ) ( not ( = ?auto_495639 ?auto_495649 ) ) ( not ( = ?auto_495639 ?auto_495650 ) ) ( not ( = ?auto_495639 ?auto_495651 ) ) ( not ( = ?auto_495639 ?auto_495652 ) ) ( not ( = ?auto_495639 ?auto_495653 ) ) ( not ( = ?auto_495639 ?auto_495654 ) ) ( not ( = ?auto_495640 ?auto_495641 ) ) ( not ( = ?auto_495640 ?auto_495642 ) ) ( not ( = ?auto_495640 ?auto_495643 ) ) ( not ( = ?auto_495640 ?auto_495644 ) ) ( not ( = ?auto_495640 ?auto_495645 ) ) ( not ( = ?auto_495640 ?auto_495646 ) ) ( not ( = ?auto_495640 ?auto_495647 ) ) ( not ( = ?auto_495640 ?auto_495648 ) ) ( not ( = ?auto_495640 ?auto_495649 ) ) ( not ( = ?auto_495640 ?auto_495650 ) ) ( not ( = ?auto_495640 ?auto_495651 ) ) ( not ( = ?auto_495640 ?auto_495652 ) ) ( not ( = ?auto_495640 ?auto_495653 ) ) ( not ( = ?auto_495640 ?auto_495654 ) ) ( not ( = ?auto_495641 ?auto_495642 ) ) ( not ( = ?auto_495641 ?auto_495643 ) ) ( not ( = ?auto_495641 ?auto_495644 ) ) ( not ( = ?auto_495641 ?auto_495645 ) ) ( not ( = ?auto_495641 ?auto_495646 ) ) ( not ( = ?auto_495641 ?auto_495647 ) ) ( not ( = ?auto_495641 ?auto_495648 ) ) ( not ( = ?auto_495641 ?auto_495649 ) ) ( not ( = ?auto_495641 ?auto_495650 ) ) ( not ( = ?auto_495641 ?auto_495651 ) ) ( not ( = ?auto_495641 ?auto_495652 ) ) ( not ( = ?auto_495641 ?auto_495653 ) ) ( not ( = ?auto_495641 ?auto_495654 ) ) ( not ( = ?auto_495642 ?auto_495643 ) ) ( not ( = ?auto_495642 ?auto_495644 ) ) ( not ( = ?auto_495642 ?auto_495645 ) ) ( not ( = ?auto_495642 ?auto_495646 ) ) ( not ( = ?auto_495642 ?auto_495647 ) ) ( not ( = ?auto_495642 ?auto_495648 ) ) ( not ( = ?auto_495642 ?auto_495649 ) ) ( not ( = ?auto_495642 ?auto_495650 ) ) ( not ( = ?auto_495642 ?auto_495651 ) ) ( not ( = ?auto_495642 ?auto_495652 ) ) ( not ( = ?auto_495642 ?auto_495653 ) ) ( not ( = ?auto_495642 ?auto_495654 ) ) ( not ( = ?auto_495643 ?auto_495644 ) ) ( not ( = ?auto_495643 ?auto_495645 ) ) ( not ( = ?auto_495643 ?auto_495646 ) ) ( not ( = ?auto_495643 ?auto_495647 ) ) ( not ( = ?auto_495643 ?auto_495648 ) ) ( not ( = ?auto_495643 ?auto_495649 ) ) ( not ( = ?auto_495643 ?auto_495650 ) ) ( not ( = ?auto_495643 ?auto_495651 ) ) ( not ( = ?auto_495643 ?auto_495652 ) ) ( not ( = ?auto_495643 ?auto_495653 ) ) ( not ( = ?auto_495643 ?auto_495654 ) ) ( not ( = ?auto_495644 ?auto_495645 ) ) ( not ( = ?auto_495644 ?auto_495646 ) ) ( not ( = ?auto_495644 ?auto_495647 ) ) ( not ( = ?auto_495644 ?auto_495648 ) ) ( not ( = ?auto_495644 ?auto_495649 ) ) ( not ( = ?auto_495644 ?auto_495650 ) ) ( not ( = ?auto_495644 ?auto_495651 ) ) ( not ( = ?auto_495644 ?auto_495652 ) ) ( not ( = ?auto_495644 ?auto_495653 ) ) ( not ( = ?auto_495644 ?auto_495654 ) ) ( not ( = ?auto_495645 ?auto_495646 ) ) ( not ( = ?auto_495645 ?auto_495647 ) ) ( not ( = ?auto_495645 ?auto_495648 ) ) ( not ( = ?auto_495645 ?auto_495649 ) ) ( not ( = ?auto_495645 ?auto_495650 ) ) ( not ( = ?auto_495645 ?auto_495651 ) ) ( not ( = ?auto_495645 ?auto_495652 ) ) ( not ( = ?auto_495645 ?auto_495653 ) ) ( not ( = ?auto_495645 ?auto_495654 ) ) ( not ( = ?auto_495646 ?auto_495647 ) ) ( not ( = ?auto_495646 ?auto_495648 ) ) ( not ( = ?auto_495646 ?auto_495649 ) ) ( not ( = ?auto_495646 ?auto_495650 ) ) ( not ( = ?auto_495646 ?auto_495651 ) ) ( not ( = ?auto_495646 ?auto_495652 ) ) ( not ( = ?auto_495646 ?auto_495653 ) ) ( not ( = ?auto_495646 ?auto_495654 ) ) ( not ( = ?auto_495647 ?auto_495648 ) ) ( not ( = ?auto_495647 ?auto_495649 ) ) ( not ( = ?auto_495647 ?auto_495650 ) ) ( not ( = ?auto_495647 ?auto_495651 ) ) ( not ( = ?auto_495647 ?auto_495652 ) ) ( not ( = ?auto_495647 ?auto_495653 ) ) ( not ( = ?auto_495647 ?auto_495654 ) ) ( not ( = ?auto_495648 ?auto_495649 ) ) ( not ( = ?auto_495648 ?auto_495650 ) ) ( not ( = ?auto_495648 ?auto_495651 ) ) ( not ( = ?auto_495648 ?auto_495652 ) ) ( not ( = ?auto_495648 ?auto_495653 ) ) ( not ( = ?auto_495648 ?auto_495654 ) ) ( not ( = ?auto_495649 ?auto_495650 ) ) ( not ( = ?auto_495649 ?auto_495651 ) ) ( not ( = ?auto_495649 ?auto_495652 ) ) ( not ( = ?auto_495649 ?auto_495653 ) ) ( not ( = ?auto_495649 ?auto_495654 ) ) ( not ( = ?auto_495650 ?auto_495651 ) ) ( not ( = ?auto_495650 ?auto_495652 ) ) ( not ( = ?auto_495650 ?auto_495653 ) ) ( not ( = ?auto_495650 ?auto_495654 ) ) ( not ( = ?auto_495651 ?auto_495652 ) ) ( not ( = ?auto_495651 ?auto_495653 ) ) ( not ( = ?auto_495651 ?auto_495654 ) ) ( not ( = ?auto_495652 ?auto_495653 ) ) ( not ( = ?auto_495652 ?auto_495654 ) ) ( not ( = ?auto_495653 ?auto_495654 ) ) ( ON ?auto_495652 ?auto_495653 ) ( ON ?auto_495651 ?auto_495652 ) ( ON ?auto_495650 ?auto_495651 ) ( ON ?auto_495649 ?auto_495650 ) ( ON ?auto_495648 ?auto_495649 ) ( CLEAR ?auto_495646 ) ( ON ?auto_495647 ?auto_495648 ) ( CLEAR ?auto_495647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_495638 ?auto_495639 ?auto_495640 ?auto_495641 ?auto_495642 ?auto_495643 ?auto_495644 ?auto_495645 ?auto_495646 ?auto_495647 )
      ( MAKE-16PILE ?auto_495638 ?auto_495639 ?auto_495640 ?auto_495641 ?auto_495642 ?auto_495643 ?auto_495644 ?auto_495645 ?auto_495646 ?auto_495647 ?auto_495648 ?auto_495649 ?auto_495650 ?auto_495651 ?auto_495652 ?auto_495653 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495671 - BLOCK
      ?auto_495672 - BLOCK
      ?auto_495673 - BLOCK
      ?auto_495674 - BLOCK
      ?auto_495675 - BLOCK
      ?auto_495676 - BLOCK
      ?auto_495677 - BLOCK
      ?auto_495678 - BLOCK
      ?auto_495679 - BLOCK
      ?auto_495680 - BLOCK
      ?auto_495681 - BLOCK
      ?auto_495682 - BLOCK
      ?auto_495683 - BLOCK
      ?auto_495684 - BLOCK
      ?auto_495685 - BLOCK
      ?auto_495686 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_495686 ) ( ON-TABLE ?auto_495671 ) ( ON ?auto_495672 ?auto_495671 ) ( ON ?auto_495673 ?auto_495672 ) ( ON ?auto_495674 ?auto_495673 ) ( ON ?auto_495675 ?auto_495674 ) ( ON ?auto_495676 ?auto_495675 ) ( ON ?auto_495677 ?auto_495676 ) ( ON ?auto_495678 ?auto_495677 ) ( ON ?auto_495679 ?auto_495678 ) ( not ( = ?auto_495671 ?auto_495672 ) ) ( not ( = ?auto_495671 ?auto_495673 ) ) ( not ( = ?auto_495671 ?auto_495674 ) ) ( not ( = ?auto_495671 ?auto_495675 ) ) ( not ( = ?auto_495671 ?auto_495676 ) ) ( not ( = ?auto_495671 ?auto_495677 ) ) ( not ( = ?auto_495671 ?auto_495678 ) ) ( not ( = ?auto_495671 ?auto_495679 ) ) ( not ( = ?auto_495671 ?auto_495680 ) ) ( not ( = ?auto_495671 ?auto_495681 ) ) ( not ( = ?auto_495671 ?auto_495682 ) ) ( not ( = ?auto_495671 ?auto_495683 ) ) ( not ( = ?auto_495671 ?auto_495684 ) ) ( not ( = ?auto_495671 ?auto_495685 ) ) ( not ( = ?auto_495671 ?auto_495686 ) ) ( not ( = ?auto_495672 ?auto_495673 ) ) ( not ( = ?auto_495672 ?auto_495674 ) ) ( not ( = ?auto_495672 ?auto_495675 ) ) ( not ( = ?auto_495672 ?auto_495676 ) ) ( not ( = ?auto_495672 ?auto_495677 ) ) ( not ( = ?auto_495672 ?auto_495678 ) ) ( not ( = ?auto_495672 ?auto_495679 ) ) ( not ( = ?auto_495672 ?auto_495680 ) ) ( not ( = ?auto_495672 ?auto_495681 ) ) ( not ( = ?auto_495672 ?auto_495682 ) ) ( not ( = ?auto_495672 ?auto_495683 ) ) ( not ( = ?auto_495672 ?auto_495684 ) ) ( not ( = ?auto_495672 ?auto_495685 ) ) ( not ( = ?auto_495672 ?auto_495686 ) ) ( not ( = ?auto_495673 ?auto_495674 ) ) ( not ( = ?auto_495673 ?auto_495675 ) ) ( not ( = ?auto_495673 ?auto_495676 ) ) ( not ( = ?auto_495673 ?auto_495677 ) ) ( not ( = ?auto_495673 ?auto_495678 ) ) ( not ( = ?auto_495673 ?auto_495679 ) ) ( not ( = ?auto_495673 ?auto_495680 ) ) ( not ( = ?auto_495673 ?auto_495681 ) ) ( not ( = ?auto_495673 ?auto_495682 ) ) ( not ( = ?auto_495673 ?auto_495683 ) ) ( not ( = ?auto_495673 ?auto_495684 ) ) ( not ( = ?auto_495673 ?auto_495685 ) ) ( not ( = ?auto_495673 ?auto_495686 ) ) ( not ( = ?auto_495674 ?auto_495675 ) ) ( not ( = ?auto_495674 ?auto_495676 ) ) ( not ( = ?auto_495674 ?auto_495677 ) ) ( not ( = ?auto_495674 ?auto_495678 ) ) ( not ( = ?auto_495674 ?auto_495679 ) ) ( not ( = ?auto_495674 ?auto_495680 ) ) ( not ( = ?auto_495674 ?auto_495681 ) ) ( not ( = ?auto_495674 ?auto_495682 ) ) ( not ( = ?auto_495674 ?auto_495683 ) ) ( not ( = ?auto_495674 ?auto_495684 ) ) ( not ( = ?auto_495674 ?auto_495685 ) ) ( not ( = ?auto_495674 ?auto_495686 ) ) ( not ( = ?auto_495675 ?auto_495676 ) ) ( not ( = ?auto_495675 ?auto_495677 ) ) ( not ( = ?auto_495675 ?auto_495678 ) ) ( not ( = ?auto_495675 ?auto_495679 ) ) ( not ( = ?auto_495675 ?auto_495680 ) ) ( not ( = ?auto_495675 ?auto_495681 ) ) ( not ( = ?auto_495675 ?auto_495682 ) ) ( not ( = ?auto_495675 ?auto_495683 ) ) ( not ( = ?auto_495675 ?auto_495684 ) ) ( not ( = ?auto_495675 ?auto_495685 ) ) ( not ( = ?auto_495675 ?auto_495686 ) ) ( not ( = ?auto_495676 ?auto_495677 ) ) ( not ( = ?auto_495676 ?auto_495678 ) ) ( not ( = ?auto_495676 ?auto_495679 ) ) ( not ( = ?auto_495676 ?auto_495680 ) ) ( not ( = ?auto_495676 ?auto_495681 ) ) ( not ( = ?auto_495676 ?auto_495682 ) ) ( not ( = ?auto_495676 ?auto_495683 ) ) ( not ( = ?auto_495676 ?auto_495684 ) ) ( not ( = ?auto_495676 ?auto_495685 ) ) ( not ( = ?auto_495676 ?auto_495686 ) ) ( not ( = ?auto_495677 ?auto_495678 ) ) ( not ( = ?auto_495677 ?auto_495679 ) ) ( not ( = ?auto_495677 ?auto_495680 ) ) ( not ( = ?auto_495677 ?auto_495681 ) ) ( not ( = ?auto_495677 ?auto_495682 ) ) ( not ( = ?auto_495677 ?auto_495683 ) ) ( not ( = ?auto_495677 ?auto_495684 ) ) ( not ( = ?auto_495677 ?auto_495685 ) ) ( not ( = ?auto_495677 ?auto_495686 ) ) ( not ( = ?auto_495678 ?auto_495679 ) ) ( not ( = ?auto_495678 ?auto_495680 ) ) ( not ( = ?auto_495678 ?auto_495681 ) ) ( not ( = ?auto_495678 ?auto_495682 ) ) ( not ( = ?auto_495678 ?auto_495683 ) ) ( not ( = ?auto_495678 ?auto_495684 ) ) ( not ( = ?auto_495678 ?auto_495685 ) ) ( not ( = ?auto_495678 ?auto_495686 ) ) ( not ( = ?auto_495679 ?auto_495680 ) ) ( not ( = ?auto_495679 ?auto_495681 ) ) ( not ( = ?auto_495679 ?auto_495682 ) ) ( not ( = ?auto_495679 ?auto_495683 ) ) ( not ( = ?auto_495679 ?auto_495684 ) ) ( not ( = ?auto_495679 ?auto_495685 ) ) ( not ( = ?auto_495679 ?auto_495686 ) ) ( not ( = ?auto_495680 ?auto_495681 ) ) ( not ( = ?auto_495680 ?auto_495682 ) ) ( not ( = ?auto_495680 ?auto_495683 ) ) ( not ( = ?auto_495680 ?auto_495684 ) ) ( not ( = ?auto_495680 ?auto_495685 ) ) ( not ( = ?auto_495680 ?auto_495686 ) ) ( not ( = ?auto_495681 ?auto_495682 ) ) ( not ( = ?auto_495681 ?auto_495683 ) ) ( not ( = ?auto_495681 ?auto_495684 ) ) ( not ( = ?auto_495681 ?auto_495685 ) ) ( not ( = ?auto_495681 ?auto_495686 ) ) ( not ( = ?auto_495682 ?auto_495683 ) ) ( not ( = ?auto_495682 ?auto_495684 ) ) ( not ( = ?auto_495682 ?auto_495685 ) ) ( not ( = ?auto_495682 ?auto_495686 ) ) ( not ( = ?auto_495683 ?auto_495684 ) ) ( not ( = ?auto_495683 ?auto_495685 ) ) ( not ( = ?auto_495683 ?auto_495686 ) ) ( not ( = ?auto_495684 ?auto_495685 ) ) ( not ( = ?auto_495684 ?auto_495686 ) ) ( not ( = ?auto_495685 ?auto_495686 ) ) ( ON ?auto_495685 ?auto_495686 ) ( ON ?auto_495684 ?auto_495685 ) ( ON ?auto_495683 ?auto_495684 ) ( ON ?auto_495682 ?auto_495683 ) ( ON ?auto_495681 ?auto_495682 ) ( CLEAR ?auto_495679 ) ( ON ?auto_495680 ?auto_495681 ) ( CLEAR ?auto_495680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_495671 ?auto_495672 ?auto_495673 ?auto_495674 ?auto_495675 ?auto_495676 ?auto_495677 ?auto_495678 ?auto_495679 ?auto_495680 )
      ( MAKE-16PILE ?auto_495671 ?auto_495672 ?auto_495673 ?auto_495674 ?auto_495675 ?auto_495676 ?auto_495677 ?auto_495678 ?auto_495679 ?auto_495680 ?auto_495681 ?auto_495682 ?auto_495683 ?auto_495684 ?auto_495685 ?auto_495686 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495703 - BLOCK
      ?auto_495704 - BLOCK
      ?auto_495705 - BLOCK
      ?auto_495706 - BLOCK
      ?auto_495707 - BLOCK
      ?auto_495708 - BLOCK
      ?auto_495709 - BLOCK
      ?auto_495710 - BLOCK
      ?auto_495711 - BLOCK
      ?auto_495712 - BLOCK
      ?auto_495713 - BLOCK
      ?auto_495714 - BLOCK
      ?auto_495715 - BLOCK
      ?auto_495716 - BLOCK
      ?auto_495717 - BLOCK
      ?auto_495718 - BLOCK
    )
    :vars
    (
      ?auto_495719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495718 ?auto_495719 ) ( ON-TABLE ?auto_495703 ) ( ON ?auto_495704 ?auto_495703 ) ( ON ?auto_495705 ?auto_495704 ) ( ON ?auto_495706 ?auto_495705 ) ( ON ?auto_495707 ?auto_495706 ) ( ON ?auto_495708 ?auto_495707 ) ( ON ?auto_495709 ?auto_495708 ) ( ON ?auto_495710 ?auto_495709 ) ( not ( = ?auto_495703 ?auto_495704 ) ) ( not ( = ?auto_495703 ?auto_495705 ) ) ( not ( = ?auto_495703 ?auto_495706 ) ) ( not ( = ?auto_495703 ?auto_495707 ) ) ( not ( = ?auto_495703 ?auto_495708 ) ) ( not ( = ?auto_495703 ?auto_495709 ) ) ( not ( = ?auto_495703 ?auto_495710 ) ) ( not ( = ?auto_495703 ?auto_495711 ) ) ( not ( = ?auto_495703 ?auto_495712 ) ) ( not ( = ?auto_495703 ?auto_495713 ) ) ( not ( = ?auto_495703 ?auto_495714 ) ) ( not ( = ?auto_495703 ?auto_495715 ) ) ( not ( = ?auto_495703 ?auto_495716 ) ) ( not ( = ?auto_495703 ?auto_495717 ) ) ( not ( = ?auto_495703 ?auto_495718 ) ) ( not ( = ?auto_495703 ?auto_495719 ) ) ( not ( = ?auto_495704 ?auto_495705 ) ) ( not ( = ?auto_495704 ?auto_495706 ) ) ( not ( = ?auto_495704 ?auto_495707 ) ) ( not ( = ?auto_495704 ?auto_495708 ) ) ( not ( = ?auto_495704 ?auto_495709 ) ) ( not ( = ?auto_495704 ?auto_495710 ) ) ( not ( = ?auto_495704 ?auto_495711 ) ) ( not ( = ?auto_495704 ?auto_495712 ) ) ( not ( = ?auto_495704 ?auto_495713 ) ) ( not ( = ?auto_495704 ?auto_495714 ) ) ( not ( = ?auto_495704 ?auto_495715 ) ) ( not ( = ?auto_495704 ?auto_495716 ) ) ( not ( = ?auto_495704 ?auto_495717 ) ) ( not ( = ?auto_495704 ?auto_495718 ) ) ( not ( = ?auto_495704 ?auto_495719 ) ) ( not ( = ?auto_495705 ?auto_495706 ) ) ( not ( = ?auto_495705 ?auto_495707 ) ) ( not ( = ?auto_495705 ?auto_495708 ) ) ( not ( = ?auto_495705 ?auto_495709 ) ) ( not ( = ?auto_495705 ?auto_495710 ) ) ( not ( = ?auto_495705 ?auto_495711 ) ) ( not ( = ?auto_495705 ?auto_495712 ) ) ( not ( = ?auto_495705 ?auto_495713 ) ) ( not ( = ?auto_495705 ?auto_495714 ) ) ( not ( = ?auto_495705 ?auto_495715 ) ) ( not ( = ?auto_495705 ?auto_495716 ) ) ( not ( = ?auto_495705 ?auto_495717 ) ) ( not ( = ?auto_495705 ?auto_495718 ) ) ( not ( = ?auto_495705 ?auto_495719 ) ) ( not ( = ?auto_495706 ?auto_495707 ) ) ( not ( = ?auto_495706 ?auto_495708 ) ) ( not ( = ?auto_495706 ?auto_495709 ) ) ( not ( = ?auto_495706 ?auto_495710 ) ) ( not ( = ?auto_495706 ?auto_495711 ) ) ( not ( = ?auto_495706 ?auto_495712 ) ) ( not ( = ?auto_495706 ?auto_495713 ) ) ( not ( = ?auto_495706 ?auto_495714 ) ) ( not ( = ?auto_495706 ?auto_495715 ) ) ( not ( = ?auto_495706 ?auto_495716 ) ) ( not ( = ?auto_495706 ?auto_495717 ) ) ( not ( = ?auto_495706 ?auto_495718 ) ) ( not ( = ?auto_495706 ?auto_495719 ) ) ( not ( = ?auto_495707 ?auto_495708 ) ) ( not ( = ?auto_495707 ?auto_495709 ) ) ( not ( = ?auto_495707 ?auto_495710 ) ) ( not ( = ?auto_495707 ?auto_495711 ) ) ( not ( = ?auto_495707 ?auto_495712 ) ) ( not ( = ?auto_495707 ?auto_495713 ) ) ( not ( = ?auto_495707 ?auto_495714 ) ) ( not ( = ?auto_495707 ?auto_495715 ) ) ( not ( = ?auto_495707 ?auto_495716 ) ) ( not ( = ?auto_495707 ?auto_495717 ) ) ( not ( = ?auto_495707 ?auto_495718 ) ) ( not ( = ?auto_495707 ?auto_495719 ) ) ( not ( = ?auto_495708 ?auto_495709 ) ) ( not ( = ?auto_495708 ?auto_495710 ) ) ( not ( = ?auto_495708 ?auto_495711 ) ) ( not ( = ?auto_495708 ?auto_495712 ) ) ( not ( = ?auto_495708 ?auto_495713 ) ) ( not ( = ?auto_495708 ?auto_495714 ) ) ( not ( = ?auto_495708 ?auto_495715 ) ) ( not ( = ?auto_495708 ?auto_495716 ) ) ( not ( = ?auto_495708 ?auto_495717 ) ) ( not ( = ?auto_495708 ?auto_495718 ) ) ( not ( = ?auto_495708 ?auto_495719 ) ) ( not ( = ?auto_495709 ?auto_495710 ) ) ( not ( = ?auto_495709 ?auto_495711 ) ) ( not ( = ?auto_495709 ?auto_495712 ) ) ( not ( = ?auto_495709 ?auto_495713 ) ) ( not ( = ?auto_495709 ?auto_495714 ) ) ( not ( = ?auto_495709 ?auto_495715 ) ) ( not ( = ?auto_495709 ?auto_495716 ) ) ( not ( = ?auto_495709 ?auto_495717 ) ) ( not ( = ?auto_495709 ?auto_495718 ) ) ( not ( = ?auto_495709 ?auto_495719 ) ) ( not ( = ?auto_495710 ?auto_495711 ) ) ( not ( = ?auto_495710 ?auto_495712 ) ) ( not ( = ?auto_495710 ?auto_495713 ) ) ( not ( = ?auto_495710 ?auto_495714 ) ) ( not ( = ?auto_495710 ?auto_495715 ) ) ( not ( = ?auto_495710 ?auto_495716 ) ) ( not ( = ?auto_495710 ?auto_495717 ) ) ( not ( = ?auto_495710 ?auto_495718 ) ) ( not ( = ?auto_495710 ?auto_495719 ) ) ( not ( = ?auto_495711 ?auto_495712 ) ) ( not ( = ?auto_495711 ?auto_495713 ) ) ( not ( = ?auto_495711 ?auto_495714 ) ) ( not ( = ?auto_495711 ?auto_495715 ) ) ( not ( = ?auto_495711 ?auto_495716 ) ) ( not ( = ?auto_495711 ?auto_495717 ) ) ( not ( = ?auto_495711 ?auto_495718 ) ) ( not ( = ?auto_495711 ?auto_495719 ) ) ( not ( = ?auto_495712 ?auto_495713 ) ) ( not ( = ?auto_495712 ?auto_495714 ) ) ( not ( = ?auto_495712 ?auto_495715 ) ) ( not ( = ?auto_495712 ?auto_495716 ) ) ( not ( = ?auto_495712 ?auto_495717 ) ) ( not ( = ?auto_495712 ?auto_495718 ) ) ( not ( = ?auto_495712 ?auto_495719 ) ) ( not ( = ?auto_495713 ?auto_495714 ) ) ( not ( = ?auto_495713 ?auto_495715 ) ) ( not ( = ?auto_495713 ?auto_495716 ) ) ( not ( = ?auto_495713 ?auto_495717 ) ) ( not ( = ?auto_495713 ?auto_495718 ) ) ( not ( = ?auto_495713 ?auto_495719 ) ) ( not ( = ?auto_495714 ?auto_495715 ) ) ( not ( = ?auto_495714 ?auto_495716 ) ) ( not ( = ?auto_495714 ?auto_495717 ) ) ( not ( = ?auto_495714 ?auto_495718 ) ) ( not ( = ?auto_495714 ?auto_495719 ) ) ( not ( = ?auto_495715 ?auto_495716 ) ) ( not ( = ?auto_495715 ?auto_495717 ) ) ( not ( = ?auto_495715 ?auto_495718 ) ) ( not ( = ?auto_495715 ?auto_495719 ) ) ( not ( = ?auto_495716 ?auto_495717 ) ) ( not ( = ?auto_495716 ?auto_495718 ) ) ( not ( = ?auto_495716 ?auto_495719 ) ) ( not ( = ?auto_495717 ?auto_495718 ) ) ( not ( = ?auto_495717 ?auto_495719 ) ) ( not ( = ?auto_495718 ?auto_495719 ) ) ( ON ?auto_495717 ?auto_495718 ) ( ON ?auto_495716 ?auto_495717 ) ( ON ?auto_495715 ?auto_495716 ) ( ON ?auto_495714 ?auto_495715 ) ( ON ?auto_495713 ?auto_495714 ) ( ON ?auto_495712 ?auto_495713 ) ( CLEAR ?auto_495710 ) ( ON ?auto_495711 ?auto_495712 ) ( CLEAR ?auto_495711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_495703 ?auto_495704 ?auto_495705 ?auto_495706 ?auto_495707 ?auto_495708 ?auto_495709 ?auto_495710 ?auto_495711 )
      ( MAKE-16PILE ?auto_495703 ?auto_495704 ?auto_495705 ?auto_495706 ?auto_495707 ?auto_495708 ?auto_495709 ?auto_495710 ?auto_495711 ?auto_495712 ?auto_495713 ?auto_495714 ?auto_495715 ?auto_495716 ?auto_495717 ?auto_495718 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495736 - BLOCK
      ?auto_495737 - BLOCK
      ?auto_495738 - BLOCK
      ?auto_495739 - BLOCK
      ?auto_495740 - BLOCK
      ?auto_495741 - BLOCK
      ?auto_495742 - BLOCK
      ?auto_495743 - BLOCK
      ?auto_495744 - BLOCK
      ?auto_495745 - BLOCK
      ?auto_495746 - BLOCK
      ?auto_495747 - BLOCK
      ?auto_495748 - BLOCK
      ?auto_495749 - BLOCK
      ?auto_495750 - BLOCK
      ?auto_495751 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_495751 ) ( ON-TABLE ?auto_495736 ) ( ON ?auto_495737 ?auto_495736 ) ( ON ?auto_495738 ?auto_495737 ) ( ON ?auto_495739 ?auto_495738 ) ( ON ?auto_495740 ?auto_495739 ) ( ON ?auto_495741 ?auto_495740 ) ( ON ?auto_495742 ?auto_495741 ) ( ON ?auto_495743 ?auto_495742 ) ( not ( = ?auto_495736 ?auto_495737 ) ) ( not ( = ?auto_495736 ?auto_495738 ) ) ( not ( = ?auto_495736 ?auto_495739 ) ) ( not ( = ?auto_495736 ?auto_495740 ) ) ( not ( = ?auto_495736 ?auto_495741 ) ) ( not ( = ?auto_495736 ?auto_495742 ) ) ( not ( = ?auto_495736 ?auto_495743 ) ) ( not ( = ?auto_495736 ?auto_495744 ) ) ( not ( = ?auto_495736 ?auto_495745 ) ) ( not ( = ?auto_495736 ?auto_495746 ) ) ( not ( = ?auto_495736 ?auto_495747 ) ) ( not ( = ?auto_495736 ?auto_495748 ) ) ( not ( = ?auto_495736 ?auto_495749 ) ) ( not ( = ?auto_495736 ?auto_495750 ) ) ( not ( = ?auto_495736 ?auto_495751 ) ) ( not ( = ?auto_495737 ?auto_495738 ) ) ( not ( = ?auto_495737 ?auto_495739 ) ) ( not ( = ?auto_495737 ?auto_495740 ) ) ( not ( = ?auto_495737 ?auto_495741 ) ) ( not ( = ?auto_495737 ?auto_495742 ) ) ( not ( = ?auto_495737 ?auto_495743 ) ) ( not ( = ?auto_495737 ?auto_495744 ) ) ( not ( = ?auto_495737 ?auto_495745 ) ) ( not ( = ?auto_495737 ?auto_495746 ) ) ( not ( = ?auto_495737 ?auto_495747 ) ) ( not ( = ?auto_495737 ?auto_495748 ) ) ( not ( = ?auto_495737 ?auto_495749 ) ) ( not ( = ?auto_495737 ?auto_495750 ) ) ( not ( = ?auto_495737 ?auto_495751 ) ) ( not ( = ?auto_495738 ?auto_495739 ) ) ( not ( = ?auto_495738 ?auto_495740 ) ) ( not ( = ?auto_495738 ?auto_495741 ) ) ( not ( = ?auto_495738 ?auto_495742 ) ) ( not ( = ?auto_495738 ?auto_495743 ) ) ( not ( = ?auto_495738 ?auto_495744 ) ) ( not ( = ?auto_495738 ?auto_495745 ) ) ( not ( = ?auto_495738 ?auto_495746 ) ) ( not ( = ?auto_495738 ?auto_495747 ) ) ( not ( = ?auto_495738 ?auto_495748 ) ) ( not ( = ?auto_495738 ?auto_495749 ) ) ( not ( = ?auto_495738 ?auto_495750 ) ) ( not ( = ?auto_495738 ?auto_495751 ) ) ( not ( = ?auto_495739 ?auto_495740 ) ) ( not ( = ?auto_495739 ?auto_495741 ) ) ( not ( = ?auto_495739 ?auto_495742 ) ) ( not ( = ?auto_495739 ?auto_495743 ) ) ( not ( = ?auto_495739 ?auto_495744 ) ) ( not ( = ?auto_495739 ?auto_495745 ) ) ( not ( = ?auto_495739 ?auto_495746 ) ) ( not ( = ?auto_495739 ?auto_495747 ) ) ( not ( = ?auto_495739 ?auto_495748 ) ) ( not ( = ?auto_495739 ?auto_495749 ) ) ( not ( = ?auto_495739 ?auto_495750 ) ) ( not ( = ?auto_495739 ?auto_495751 ) ) ( not ( = ?auto_495740 ?auto_495741 ) ) ( not ( = ?auto_495740 ?auto_495742 ) ) ( not ( = ?auto_495740 ?auto_495743 ) ) ( not ( = ?auto_495740 ?auto_495744 ) ) ( not ( = ?auto_495740 ?auto_495745 ) ) ( not ( = ?auto_495740 ?auto_495746 ) ) ( not ( = ?auto_495740 ?auto_495747 ) ) ( not ( = ?auto_495740 ?auto_495748 ) ) ( not ( = ?auto_495740 ?auto_495749 ) ) ( not ( = ?auto_495740 ?auto_495750 ) ) ( not ( = ?auto_495740 ?auto_495751 ) ) ( not ( = ?auto_495741 ?auto_495742 ) ) ( not ( = ?auto_495741 ?auto_495743 ) ) ( not ( = ?auto_495741 ?auto_495744 ) ) ( not ( = ?auto_495741 ?auto_495745 ) ) ( not ( = ?auto_495741 ?auto_495746 ) ) ( not ( = ?auto_495741 ?auto_495747 ) ) ( not ( = ?auto_495741 ?auto_495748 ) ) ( not ( = ?auto_495741 ?auto_495749 ) ) ( not ( = ?auto_495741 ?auto_495750 ) ) ( not ( = ?auto_495741 ?auto_495751 ) ) ( not ( = ?auto_495742 ?auto_495743 ) ) ( not ( = ?auto_495742 ?auto_495744 ) ) ( not ( = ?auto_495742 ?auto_495745 ) ) ( not ( = ?auto_495742 ?auto_495746 ) ) ( not ( = ?auto_495742 ?auto_495747 ) ) ( not ( = ?auto_495742 ?auto_495748 ) ) ( not ( = ?auto_495742 ?auto_495749 ) ) ( not ( = ?auto_495742 ?auto_495750 ) ) ( not ( = ?auto_495742 ?auto_495751 ) ) ( not ( = ?auto_495743 ?auto_495744 ) ) ( not ( = ?auto_495743 ?auto_495745 ) ) ( not ( = ?auto_495743 ?auto_495746 ) ) ( not ( = ?auto_495743 ?auto_495747 ) ) ( not ( = ?auto_495743 ?auto_495748 ) ) ( not ( = ?auto_495743 ?auto_495749 ) ) ( not ( = ?auto_495743 ?auto_495750 ) ) ( not ( = ?auto_495743 ?auto_495751 ) ) ( not ( = ?auto_495744 ?auto_495745 ) ) ( not ( = ?auto_495744 ?auto_495746 ) ) ( not ( = ?auto_495744 ?auto_495747 ) ) ( not ( = ?auto_495744 ?auto_495748 ) ) ( not ( = ?auto_495744 ?auto_495749 ) ) ( not ( = ?auto_495744 ?auto_495750 ) ) ( not ( = ?auto_495744 ?auto_495751 ) ) ( not ( = ?auto_495745 ?auto_495746 ) ) ( not ( = ?auto_495745 ?auto_495747 ) ) ( not ( = ?auto_495745 ?auto_495748 ) ) ( not ( = ?auto_495745 ?auto_495749 ) ) ( not ( = ?auto_495745 ?auto_495750 ) ) ( not ( = ?auto_495745 ?auto_495751 ) ) ( not ( = ?auto_495746 ?auto_495747 ) ) ( not ( = ?auto_495746 ?auto_495748 ) ) ( not ( = ?auto_495746 ?auto_495749 ) ) ( not ( = ?auto_495746 ?auto_495750 ) ) ( not ( = ?auto_495746 ?auto_495751 ) ) ( not ( = ?auto_495747 ?auto_495748 ) ) ( not ( = ?auto_495747 ?auto_495749 ) ) ( not ( = ?auto_495747 ?auto_495750 ) ) ( not ( = ?auto_495747 ?auto_495751 ) ) ( not ( = ?auto_495748 ?auto_495749 ) ) ( not ( = ?auto_495748 ?auto_495750 ) ) ( not ( = ?auto_495748 ?auto_495751 ) ) ( not ( = ?auto_495749 ?auto_495750 ) ) ( not ( = ?auto_495749 ?auto_495751 ) ) ( not ( = ?auto_495750 ?auto_495751 ) ) ( ON ?auto_495750 ?auto_495751 ) ( ON ?auto_495749 ?auto_495750 ) ( ON ?auto_495748 ?auto_495749 ) ( ON ?auto_495747 ?auto_495748 ) ( ON ?auto_495746 ?auto_495747 ) ( ON ?auto_495745 ?auto_495746 ) ( CLEAR ?auto_495743 ) ( ON ?auto_495744 ?auto_495745 ) ( CLEAR ?auto_495744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_495736 ?auto_495737 ?auto_495738 ?auto_495739 ?auto_495740 ?auto_495741 ?auto_495742 ?auto_495743 ?auto_495744 )
      ( MAKE-16PILE ?auto_495736 ?auto_495737 ?auto_495738 ?auto_495739 ?auto_495740 ?auto_495741 ?auto_495742 ?auto_495743 ?auto_495744 ?auto_495745 ?auto_495746 ?auto_495747 ?auto_495748 ?auto_495749 ?auto_495750 ?auto_495751 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495768 - BLOCK
      ?auto_495769 - BLOCK
      ?auto_495770 - BLOCK
      ?auto_495771 - BLOCK
      ?auto_495772 - BLOCK
      ?auto_495773 - BLOCK
      ?auto_495774 - BLOCK
      ?auto_495775 - BLOCK
      ?auto_495776 - BLOCK
      ?auto_495777 - BLOCK
      ?auto_495778 - BLOCK
      ?auto_495779 - BLOCK
      ?auto_495780 - BLOCK
      ?auto_495781 - BLOCK
      ?auto_495782 - BLOCK
      ?auto_495783 - BLOCK
    )
    :vars
    (
      ?auto_495784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495783 ?auto_495784 ) ( ON-TABLE ?auto_495768 ) ( ON ?auto_495769 ?auto_495768 ) ( ON ?auto_495770 ?auto_495769 ) ( ON ?auto_495771 ?auto_495770 ) ( ON ?auto_495772 ?auto_495771 ) ( ON ?auto_495773 ?auto_495772 ) ( ON ?auto_495774 ?auto_495773 ) ( not ( = ?auto_495768 ?auto_495769 ) ) ( not ( = ?auto_495768 ?auto_495770 ) ) ( not ( = ?auto_495768 ?auto_495771 ) ) ( not ( = ?auto_495768 ?auto_495772 ) ) ( not ( = ?auto_495768 ?auto_495773 ) ) ( not ( = ?auto_495768 ?auto_495774 ) ) ( not ( = ?auto_495768 ?auto_495775 ) ) ( not ( = ?auto_495768 ?auto_495776 ) ) ( not ( = ?auto_495768 ?auto_495777 ) ) ( not ( = ?auto_495768 ?auto_495778 ) ) ( not ( = ?auto_495768 ?auto_495779 ) ) ( not ( = ?auto_495768 ?auto_495780 ) ) ( not ( = ?auto_495768 ?auto_495781 ) ) ( not ( = ?auto_495768 ?auto_495782 ) ) ( not ( = ?auto_495768 ?auto_495783 ) ) ( not ( = ?auto_495768 ?auto_495784 ) ) ( not ( = ?auto_495769 ?auto_495770 ) ) ( not ( = ?auto_495769 ?auto_495771 ) ) ( not ( = ?auto_495769 ?auto_495772 ) ) ( not ( = ?auto_495769 ?auto_495773 ) ) ( not ( = ?auto_495769 ?auto_495774 ) ) ( not ( = ?auto_495769 ?auto_495775 ) ) ( not ( = ?auto_495769 ?auto_495776 ) ) ( not ( = ?auto_495769 ?auto_495777 ) ) ( not ( = ?auto_495769 ?auto_495778 ) ) ( not ( = ?auto_495769 ?auto_495779 ) ) ( not ( = ?auto_495769 ?auto_495780 ) ) ( not ( = ?auto_495769 ?auto_495781 ) ) ( not ( = ?auto_495769 ?auto_495782 ) ) ( not ( = ?auto_495769 ?auto_495783 ) ) ( not ( = ?auto_495769 ?auto_495784 ) ) ( not ( = ?auto_495770 ?auto_495771 ) ) ( not ( = ?auto_495770 ?auto_495772 ) ) ( not ( = ?auto_495770 ?auto_495773 ) ) ( not ( = ?auto_495770 ?auto_495774 ) ) ( not ( = ?auto_495770 ?auto_495775 ) ) ( not ( = ?auto_495770 ?auto_495776 ) ) ( not ( = ?auto_495770 ?auto_495777 ) ) ( not ( = ?auto_495770 ?auto_495778 ) ) ( not ( = ?auto_495770 ?auto_495779 ) ) ( not ( = ?auto_495770 ?auto_495780 ) ) ( not ( = ?auto_495770 ?auto_495781 ) ) ( not ( = ?auto_495770 ?auto_495782 ) ) ( not ( = ?auto_495770 ?auto_495783 ) ) ( not ( = ?auto_495770 ?auto_495784 ) ) ( not ( = ?auto_495771 ?auto_495772 ) ) ( not ( = ?auto_495771 ?auto_495773 ) ) ( not ( = ?auto_495771 ?auto_495774 ) ) ( not ( = ?auto_495771 ?auto_495775 ) ) ( not ( = ?auto_495771 ?auto_495776 ) ) ( not ( = ?auto_495771 ?auto_495777 ) ) ( not ( = ?auto_495771 ?auto_495778 ) ) ( not ( = ?auto_495771 ?auto_495779 ) ) ( not ( = ?auto_495771 ?auto_495780 ) ) ( not ( = ?auto_495771 ?auto_495781 ) ) ( not ( = ?auto_495771 ?auto_495782 ) ) ( not ( = ?auto_495771 ?auto_495783 ) ) ( not ( = ?auto_495771 ?auto_495784 ) ) ( not ( = ?auto_495772 ?auto_495773 ) ) ( not ( = ?auto_495772 ?auto_495774 ) ) ( not ( = ?auto_495772 ?auto_495775 ) ) ( not ( = ?auto_495772 ?auto_495776 ) ) ( not ( = ?auto_495772 ?auto_495777 ) ) ( not ( = ?auto_495772 ?auto_495778 ) ) ( not ( = ?auto_495772 ?auto_495779 ) ) ( not ( = ?auto_495772 ?auto_495780 ) ) ( not ( = ?auto_495772 ?auto_495781 ) ) ( not ( = ?auto_495772 ?auto_495782 ) ) ( not ( = ?auto_495772 ?auto_495783 ) ) ( not ( = ?auto_495772 ?auto_495784 ) ) ( not ( = ?auto_495773 ?auto_495774 ) ) ( not ( = ?auto_495773 ?auto_495775 ) ) ( not ( = ?auto_495773 ?auto_495776 ) ) ( not ( = ?auto_495773 ?auto_495777 ) ) ( not ( = ?auto_495773 ?auto_495778 ) ) ( not ( = ?auto_495773 ?auto_495779 ) ) ( not ( = ?auto_495773 ?auto_495780 ) ) ( not ( = ?auto_495773 ?auto_495781 ) ) ( not ( = ?auto_495773 ?auto_495782 ) ) ( not ( = ?auto_495773 ?auto_495783 ) ) ( not ( = ?auto_495773 ?auto_495784 ) ) ( not ( = ?auto_495774 ?auto_495775 ) ) ( not ( = ?auto_495774 ?auto_495776 ) ) ( not ( = ?auto_495774 ?auto_495777 ) ) ( not ( = ?auto_495774 ?auto_495778 ) ) ( not ( = ?auto_495774 ?auto_495779 ) ) ( not ( = ?auto_495774 ?auto_495780 ) ) ( not ( = ?auto_495774 ?auto_495781 ) ) ( not ( = ?auto_495774 ?auto_495782 ) ) ( not ( = ?auto_495774 ?auto_495783 ) ) ( not ( = ?auto_495774 ?auto_495784 ) ) ( not ( = ?auto_495775 ?auto_495776 ) ) ( not ( = ?auto_495775 ?auto_495777 ) ) ( not ( = ?auto_495775 ?auto_495778 ) ) ( not ( = ?auto_495775 ?auto_495779 ) ) ( not ( = ?auto_495775 ?auto_495780 ) ) ( not ( = ?auto_495775 ?auto_495781 ) ) ( not ( = ?auto_495775 ?auto_495782 ) ) ( not ( = ?auto_495775 ?auto_495783 ) ) ( not ( = ?auto_495775 ?auto_495784 ) ) ( not ( = ?auto_495776 ?auto_495777 ) ) ( not ( = ?auto_495776 ?auto_495778 ) ) ( not ( = ?auto_495776 ?auto_495779 ) ) ( not ( = ?auto_495776 ?auto_495780 ) ) ( not ( = ?auto_495776 ?auto_495781 ) ) ( not ( = ?auto_495776 ?auto_495782 ) ) ( not ( = ?auto_495776 ?auto_495783 ) ) ( not ( = ?auto_495776 ?auto_495784 ) ) ( not ( = ?auto_495777 ?auto_495778 ) ) ( not ( = ?auto_495777 ?auto_495779 ) ) ( not ( = ?auto_495777 ?auto_495780 ) ) ( not ( = ?auto_495777 ?auto_495781 ) ) ( not ( = ?auto_495777 ?auto_495782 ) ) ( not ( = ?auto_495777 ?auto_495783 ) ) ( not ( = ?auto_495777 ?auto_495784 ) ) ( not ( = ?auto_495778 ?auto_495779 ) ) ( not ( = ?auto_495778 ?auto_495780 ) ) ( not ( = ?auto_495778 ?auto_495781 ) ) ( not ( = ?auto_495778 ?auto_495782 ) ) ( not ( = ?auto_495778 ?auto_495783 ) ) ( not ( = ?auto_495778 ?auto_495784 ) ) ( not ( = ?auto_495779 ?auto_495780 ) ) ( not ( = ?auto_495779 ?auto_495781 ) ) ( not ( = ?auto_495779 ?auto_495782 ) ) ( not ( = ?auto_495779 ?auto_495783 ) ) ( not ( = ?auto_495779 ?auto_495784 ) ) ( not ( = ?auto_495780 ?auto_495781 ) ) ( not ( = ?auto_495780 ?auto_495782 ) ) ( not ( = ?auto_495780 ?auto_495783 ) ) ( not ( = ?auto_495780 ?auto_495784 ) ) ( not ( = ?auto_495781 ?auto_495782 ) ) ( not ( = ?auto_495781 ?auto_495783 ) ) ( not ( = ?auto_495781 ?auto_495784 ) ) ( not ( = ?auto_495782 ?auto_495783 ) ) ( not ( = ?auto_495782 ?auto_495784 ) ) ( not ( = ?auto_495783 ?auto_495784 ) ) ( ON ?auto_495782 ?auto_495783 ) ( ON ?auto_495781 ?auto_495782 ) ( ON ?auto_495780 ?auto_495781 ) ( ON ?auto_495779 ?auto_495780 ) ( ON ?auto_495778 ?auto_495779 ) ( ON ?auto_495777 ?auto_495778 ) ( ON ?auto_495776 ?auto_495777 ) ( CLEAR ?auto_495774 ) ( ON ?auto_495775 ?auto_495776 ) ( CLEAR ?auto_495775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_495768 ?auto_495769 ?auto_495770 ?auto_495771 ?auto_495772 ?auto_495773 ?auto_495774 ?auto_495775 )
      ( MAKE-16PILE ?auto_495768 ?auto_495769 ?auto_495770 ?auto_495771 ?auto_495772 ?auto_495773 ?auto_495774 ?auto_495775 ?auto_495776 ?auto_495777 ?auto_495778 ?auto_495779 ?auto_495780 ?auto_495781 ?auto_495782 ?auto_495783 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495801 - BLOCK
      ?auto_495802 - BLOCK
      ?auto_495803 - BLOCK
      ?auto_495804 - BLOCK
      ?auto_495805 - BLOCK
      ?auto_495806 - BLOCK
      ?auto_495807 - BLOCK
      ?auto_495808 - BLOCK
      ?auto_495809 - BLOCK
      ?auto_495810 - BLOCK
      ?auto_495811 - BLOCK
      ?auto_495812 - BLOCK
      ?auto_495813 - BLOCK
      ?auto_495814 - BLOCK
      ?auto_495815 - BLOCK
      ?auto_495816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_495816 ) ( ON-TABLE ?auto_495801 ) ( ON ?auto_495802 ?auto_495801 ) ( ON ?auto_495803 ?auto_495802 ) ( ON ?auto_495804 ?auto_495803 ) ( ON ?auto_495805 ?auto_495804 ) ( ON ?auto_495806 ?auto_495805 ) ( ON ?auto_495807 ?auto_495806 ) ( not ( = ?auto_495801 ?auto_495802 ) ) ( not ( = ?auto_495801 ?auto_495803 ) ) ( not ( = ?auto_495801 ?auto_495804 ) ) ( not ( = ?auto_495801 ?auto_495805 ) ) ( not ( = ?auto_495801 ?auto_495806 ) ) ( not ( = ?auto_495801 ?auto_495807 ) ) ( not ( = ?auto_495801 ?auto_495808 ) ) ( not ( = ?auto_495801 ?auto_495809 ) ) ( not ( = ?auto_495801 ?auto_495810 ) ) ( not ( = ?auto_495801 ?auto_495811 ) ) ( not ( = ?auto_495801 ?auto_495812 ) ) ( not ( = ?auto_495801 ?auto_495813 ) ) ( not ( = ?auto_495801 ?auto_495814 ) ) ( not ( = ?auto_495801 ?auto_495815 ) ) ( not ( = ?auto_495801 ?auto_495816 ) ) ( not ( = ?auto_495802 ?auto_495803 ) ) ( not ( = ?auto_495802 ?auto_495804 ) ) ( not ( = ?auto_495802 ?auto_495805 ) ) ( not ( = ?auto_495802 ?auto_495806 ) ) ( not ( = ?auto_495802 ?auto_495807 ) ) ( not ( = ?auto_495802 ?auto_495808 ) ) ( not ( = ?auto_495802 ?auto_495809 ) ) ( not ( = ?auto_495802 ?auto_495810 ) ) ( not ( = ?auto_495802 ?auto_495811 ) ) ( not ( = ?auto_495802 ?auto_495812 ) ) ( not ( = ?auto_495802 ?auto_495813 ) ) ( not ( = ?auto_495802 ?auto_495814 ) ) ( not ( = ?auto_495802 ?auto_495815 ) ) ( not ( = ?auto_495802 ?auto_495816 ) ) ( not ( = ?auto_495803 ?auto_495804 ) ) ( not ( = ?auto_495803 ?auto_495805 ) ) ( not ( = ?auto_495803 ?auto_495806 ) ) ( not ( = ?auto_495803 ?auto_495807 ) ) ( not ( = ?auto_495803 ?auto_495808 ) ) ( not ( = ?auto_495803 ?auto_495809 ) ) ( not ( = ?auto_495803 ?auto_495810 ) ) ( not ( = ?auto_495803 ?auto_495811 ) ) ( not ( = ?auto_495803 ?auto_495812 ) ) ( not ( = ?auto_495803 ?auto_495813 ) ) ( not ( = ?auto_495803 ?auto_495814 ) ) ( not ( = ?auto_495803 ?auto_495815 ) ) ( not ( = ?auto_495803 ?auto_495816 ) ) ( not ( = ?auto_495804 ?auto_495805 ) ) ( not ( = ?auto_495804 ?auto_495806 ) ) ( not ( = ?auto_495804 ?auto_495807 ) ) ( not ( = ?auto_495804 ?auto_495808 ) ) ( not ( = ?auto_495804 ?auto_495809 ) ) ( not ( = ?auto_495804 ?auto_495810 ) ) ( not ( = ?auto_495804 ?auto_495811 ) ) ( not ( = ?auto_495804 ?auto_495812 ) ) ( not ( = ?auto_495804 ?auto_495813 ) ) ( not ( = ?auto_495804 ?auto_495814 ) ) ( not ( = ?auto_495804 ?auto_495815 ) ) ( not ( = ?auto_495804 ?auto_495816 ) ) ( not ( = ?auto_495805 ?auto_495806 ) ) ( not ( = ?auto_495805 ?auto_495807 ) ) ( not ( = ?auto_495805 ?auto_495808 ) ) ( not ( = ?auto_495805 ?auto_495809 ) ) ( not ( = ?auto_495805 ?auto_495810 ) ) ( not ( = ?auto_495805 ?auto_495811 ) ) ( not ( = ?auto_495805 ?auto_495812 ) ) ( not ( = ?auto_495805 ?auto_495813 ) ) ( not ( = ?auto_495805 ?auto_495814 ) ) ( not ( = ?auto_495805 ?auto_495815 ) ) ( not ( = ?auto_495805 ?auto_495816 ) ) ( not ( = ?auto_495806 ?auto_495807 ) ) ( not ( = ?auto_495806 ?auto_495808 ) ) ( not ( = ?auto_495806 ?auto_495809 ) ) ( not ( = ?auto_495806 ?auto_495810 ) ) ( not ( = ?auto_495806 ?auto_495811 ) ) ( not ( = ?auto_495806 ?auto_495812 ) ) ( not ( = ?auto_495806 ?auto_495813 ) ) ( not ( = ?auto_495806 ?auto_495814 ) ) ( not ( = ?auto_495806 ?auto_495815 ) ) ( not ( = ?auto_495806 ?auto_495816 ) ) ( not ( = ?auto_495807 ?auto_495808 ) ) ( not ( = ?auto_495807 ?auto_495809 ) ) ( not ( = ?auto_495807 ?auto_495810 ) ) ( not ( = ?auto_495807 ?auto_495811 ) ) ( not ( = ?auto_495807 ?auto_495812 ) ) ( not ( = ?auto_495807 ?auto_495813 ) ) ( not ( = ?auto_495807 ?auto_495814 ) ) ( not ( = ?auto_495807 ?auto_495815 ) ) ( not ( = ?auto_495807 ?auto_495816 ) ) ( not ( = ?auto_495808 ?auto_495809 ) ) ( not ( = ?auto_495808 ?auto_495810 ) ) ( not ( = ?auto_495808 ?auto_495811 ) ) ( not ( = ?auto_495808 ?auto_495812 ) ) ( not ( = ?auto_495808 ?auto_495813 ) ) ( not ( = ?auto_495808 ?auto_495814 ) ) ( not ( = ?auto_495808 ?auto_495815 ) ) ( not ( = ?auto_495808 ?auto_495816 ) ) ( not ( = ?auto_495809 ?auto_495810 ) ) ( not ( = ?auto_495809 ?auto_495811 ) ) ( not ( = ?auto_495809 ?auto_495812 ) ) ( not ( = ?auto_495809 ?auto_495813 ) ) ( not ( = ?auto_495809 ?auto_495814 ) ) ( not ( = ?auto_495809 ?auto_495815 ) ) ( not ( = ?auto_495809 ?auto_495816 ) ) ( not ( = ?auto_495810 ?auto_495811 ) ) ( not ( = ?auto_495810 ?auto_495812 ) ) ( not ( = ?auto_495810 ?auto_495813 ) ) ( not ( = ?auto_495810 ?auto_495814 ) ) ( not ( = ?auto_495810 ?auto_495815 ) ) ( not ( = ?auto_495810 ?auto_495816 ) ) ( not ( = ?auto_495811 ?auto_495812 ) ) ( not ( = ?auto_495811 ?auto_495813 ) ) ( not ( = ?auto_495811 ?auto_495814 ) ) ( not ( = ?auto_495811 ?auto_495815 ) ) ( not ( = ?auto_495811 ?auto_495816 ) ) ( not ( = ?auto_495812 ?auto_495813 ) ) ( not ( = ?auto_495812 ?auto_495814 ) ) ( not ( = ?auto_495812 ?auto_495815 ) ) ( not ( = ?auto_495812 ?auto_495816 ) ) ( not ( = ?auto_495813 ?auto_495814 ) ) ( not ( = ?auto_495813 ?auto_495815 ) ) ( not ( = ?auto_495813 ?auto_495816 ) ) ( not ( = ?auto_495814 ?auto_495815 ) ) ( not ( = ?auto_495814 ?auto_495816 ) ) ( not ( = ?auto_495815 ?auto_495816 ) ) ( ON ?auto_495815 ?auto_495816 ) ( ON ?auto_495814 ?auto_495815 ) ( ON ?auto_495813 ?auto_495814 ) ( ON ?auto_495812 ?auto_495813 ) ( ON ?auto_495811 ?auto_495812 ) ( ON ?auto_495810 ?auto_495811 ) ( ON ?auto_495809 ?auto_495810 ) ( CLEAR ?auto_495807 ) ( ON ?auto_495808 ?auto_495809 ) ( CLEAR ?auto_495808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_495801 ?auto_495802 ?auto_495803 ?auto_495804 ?auto_495805 ?auto_495806 ?auto_495807 ?auto_495808 )
      ( MAKE-16PILE ?auto_495801 ?auto_495802 ?auto_495803 ?auto_495804 ?auto_495805 ?auto_495806 ?auto_495807 ?auto_495808 ?auto_495809 ?auto_495810 ?auto_495811 ?auto_495812 ?auto_495813 ?auto_495814 ?auto_495815 ?auto_495816 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495833 - BLOCK
      ?auto_495834 - BLOCK
      ?auto_495835 - BLOCK
      ?auto_495836 - BLOCK
      ?auto_495837 - BLOCK
      ?auto_495838 - BLOCK
      ?auto_495839 - BLOCK
      ?auto_495840 - BLOCK
      ?auto_495841 - BLOCK
      ?auto_495842 - BLOCK
      ?auto_495843 - BLOCK
      ?auto_495844 - BLOCK
      ?auto_495845 - BLOCK
      ?auto_495846 - BLOCK
      ?auto_495847 - BLOCK
      ?auto_495848 - BLOCK
    )
    :vars
    (
      ?auto_495849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495848 ?auto_495849 ) ( ON-TABLE ?auto_495833 ) ( ON ?auto_495834 ?auto_495833 ) ( ON ?auto_495835 ?auto_495834 ) ( ON ?auto_495836 ?auto_495835 ) ( ON ?auto_495837 ?auto_495836 ) ( ON ?auto_495838 ?auto_495837 ) ( not ( = ?auto_495833 ?auto_495834 ) ) ( not ( = ?auto_495833 ?auto_495835 ) ) ( not ( = ?auto_495833 ?auto_495836 ) ) ( not ( = ?auto_495833 ?auto_495837 ) ) ( not ( = ?auto_495833 ?auto_495838 ) ) ( not ( = ?auto_495833 ?auto_495839 ) ) ( not ( = ?auto_495833 ?auto_495840 ) ) ( not ( = ?auto_495833 ?auto_495841 ) ) ( not ( = ?auto_495833 ?auto_495842 ) ) ( not ( = ?auto_495833 ?auto_495843 ) ) ( not ( = ?auto_495833 ?auto_495844 ) ) ( not ( = ?auto_495833 ?auto_495845 ) ) ( not ( = ?auto_495833 ?auto_495846 ) ) ( not ( = ?auto_495833 ?auto_495847 ) ) ( not ( = ?auto_495833 ?auto_495848 ) ) ( not ( = ?auto_495833 ?auto_495849 ) ) ( not ( = ?auto_495834 ?auto_495835 ) ) ( not ( = ?auto_495834 ?auto_495836 ) ) ( not ( = ?auto_495834 ?auto_495837 ) ) ( not ( = ?auto_495834 ?auto_495838 ) ) ( not ( = ?auto_495834 ?auto_495839 ) ) ( not ( = ?auto_495834 ?auto_495840 ) ) ( not ( = ?auto_495834 ?auto_495841 ) ) ( not ( = ?auto_495834 ?auto_495842 ) ) ( not ( = ?auto_495834 ?auto_495843 ) ) ( not ( = ?auto_495834 ?auto_495844 ) ) ( not ( = ?auto_495834 ?auto_495845 ) ) ( not ( = ?auto_495834 ?auto_495846 ) ) ( not ( = ?auto_495834 ?auto_495847 ) ) ( not ( = ?auto_495834 ?auto_495848 ) ) ( not ( = ?auto_495834 ?auto_495849 ) ) ( not ( = ?auto_495835 ?auto_495836 ) ) ( not ( = ?auto_495835 ?auto_495837 ) ) ( not ( = ?auto_495835 ?auto_495838 ) ) ( not ( = ?auto_495835 ?auto_495839 ) ) ( not ( = ?auto_495835 ?auto_495840 ) ) ( not ( = ?auto_495835 ?auto_495841 ) ) ( not ( = ?auto_495835 ?auto_495842 ) ) ( not ( = ?auto_495835 ?auto_495843 ) ) ( not ( = ?auto_495835 ?auto_495844 ) ) ( not ( = ?auto_495835 ?auto_495845 ) ) ( not ( = ?auto_495835 ?auto_495846 ) ) ( not ( = ?auto_495835 ?auto_495847 ) ) ( not ( = ?auto_495835 ?auto_495848 ) ) ( not ( = ?auto_495835 ?auto_495849 ) ) ( not ( = ?auto_495836 ?auto_495837 ) ) ( not ( = ?auto_495836 ?auto_495838 ) ) ( not ( = ?auto_495836 ?auto_495839 ) ) ( not ( = ?auto_495836 ?auto_495840 ) ) ( not ( = ?auto_495836 ?auto_495841 ) ) ( not ( = ?auto_495836 ?auto_495842 ) ) ( not ( = ?auto_495836 ?auto_495843 ) ) ( not ( = ?auto_495836 ?auto_495844 ) ) ( not ( = ?auto_495836 ?auto_495845 ) ) ( not ( = ?auto_495836 ?auto_495846 ) ) ( not ( = ?auto_495836 ?auto_495847 ) ) ( not ( = ?auto_495836 ?auto_495848 ) ) ( not ( = ?auto_495836 ?auto_495849 ) ) ( not ( = ?auto_495837 ?auto_495838 ) ) ( not ( = ?auto_495837 ?auto_495839 ) ) ( not ( = ?auto_495837 ?auto_495840 ) ) ( not ( = ?auto_495837 ?auto_495841 ) ) ( not ( = ?auto_495837 ?auto_495842 ) ) ( not ( = ?auto_495837 ?auto_495843 ) ) ( not ( = ?auto_495837 ?auto_495844 ) ) ( not ( = ?auto_495837 ?auto_495845 ) ) ( not ( = ?auto_495837 ?auto_495846 ) ) ( not ( = ?auto_495837 ?auto_495847 ) ) ( not ( = ?auto_495837 ?auto_495848 ) ) ( not ( = ?auto_495837 ?auto_495849 ) ) ( not ( = ?auto_495838 ?auto_495839 ) ) ( not ( = ?auto_495838 ?auto_495840 ) ) ( not ( = ?auto_495838 ?auto_495841 ) ) ( not ( = ?auto_495838 ?auto_495842 ) ) ( not ( = ?auto_495838 ?auto_495843 ) ) ( not ( = ?auto_495838 ?auto_495844 ) ) ( not ( = ?auto_495838 ?auto_495845 ) ) ( not ( = ?auto_495838 ?auto_495846 ) ) ( not ( = ?auto_495838 ?auto_495847 ) ) ( not ( = ?auto_495838 ?auto_495848 ) ) ( not ( = ?auto_495838 ?auto_495849 ) ) ( not ( = ?auto_495839 ?auto_495840 ) ) ( not ( = ?auto_495839 ?auto_495841 ) ) ( not ( = ?auto_495839 ?auto_495842 ) ) ( not ( = ?auto_495839 ?auto_495843 ) ) ( not ( = ?auto_495839 ?auto_495844 ) ) ( not ( = ?auto_495839 ?auto_495845 ) ) ( not ( = ?auto_495839 ?auto_495846 ) ) ( not ( = ?auto_495839 ?auto_495847 ) ) ( not ( = ?auto_495839 ?auto_495848 ) ) ( not ( = ?auto_495839 ?auto_495849 ) ) ( not ( = ?auto_495840 ?auto_495841 ) ) ( not ( = ?auto_495840 ?auto_495842 ) ) ( not ( = ?auto_495840 ?auto_495843 ) ) ( not ( = ?auto_495840 ?auto_495844 ) ) ( not ( = ?auto_495840 ?auto_495845 ) ) ( not ( = ?auto_495840 ?auto_495846 ) ) ( not ( = ?auto_495840 ?auto_495847 ) ) ( not ( = ?auto_495840 ?auto_495848 ) ) ( not ( = ?auto_495840 ?auto_495849 ) ) ( not ( = ?auto_495841 ?auto_495842 ) ) ( not ( = ?auto_495841 ?auto_495843 ) ) ( not ( = ?auto_495841 ?auto_495844 ) ) ( not ( = ?auto_495841 ?auto_495845 ) ) ( not ( = ?auto_495841 ?auto_495846 ) ) ( not ( = ?auto_495841 ?auto_495847 ) ) ( not ( = ?auto_495841 ?auto_495848 ) ) ( not ( = ?auto_495841 ?auto_495849 ) ) ( not ( = ?auto_495842 ?auto_495843 ) ) ( not ( = ?auto_495842 ?auto_495844 ) ) ( not ( = ?auto_495842 ?auto_495845 ) ) ( not ( = ?auto_495842 ?auto_495846 ) ) ( not ( = ?auto_495842 ?auto_495847 ) ) ( not ( = ?auto_495842 ?auto_495848 ) ) ( not ( = ?auto_495842 ?auto_495849 ) ) ( not ( = ?auto_495843 ?auto_495844 ) ) ( not ( = ?auto_495843 ?auto_495845 ) ) ( not ( = ?auto_495843 ?auto_495846 ) ) ( not ( = ?auto_495843 ?auto_495847 ) ) ( not ( = ?auto_495843 ?auto_495848 ) ) ( not ( = ?auto_495843 ?auto_495849 ) ) ( not ( = ?auto_495844 ?auto_495845 ) ) ( not ( = ?auto_495844 ?auto_495846 ) ) ( not ( = ?auto_495844 ?auto_495847 ) ) ( not ( = ?auto_495844 ?auto_495848 ) ) ( not ( = ?auto_495844 ?auto_495849 ) ) ( not ( = ?auto_495845 ?auto_495846 ) ) ( not ( = ?auto_495845 ?auto_495847 ) ) ( not ( = ?auto_495845 ?auto_495848 ) ) ( not ( = ?auto_495845 ?auto_495849 ) ) ( not ( = ?auto_495846 ?auto_495847 ) ) ( not ( = ?auto_495846 ?auto_495848 ) ) ( not ( = ?auto_495846 ?auto_495849 ) ) ( not ( = ?auto_495847 ?auto_495848 ) ) ( not ( = ?auto_495847 ?auto_495849 ) ) ( not ( = ?auto_495848 ?auto_495849 ) ) ( ON ?auto_495847 ?auto_495848 ) ( ON ?auto_495846 ?auto_495847 ) ( ON ?auto_495845 ?auto_495846 ) ( ON ?auto_495844 ?auto_495845 ) ( ON ?auto_495843 ?auto_495844 ) ( ON ?auto_495842 ?auto_495843 ) ( ON ?auto_495841 ?auto_495842 ) ( ON ?auto_495840 ?auto_495841 ) ( CLEAR ?auto_495838 ) ( ON ?auto_495839 ?auto_495840 ) ( CLEAR ?auto_495839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_495833 ?auto_495834 ?auto_495835 ?auto_495836 ?auto_495837 ?auto_495838 ?auto_495839 )
      ( MAKE-16PILE ?auto_495833 ?auto_495834 ?auto_495835 ?auto_495836 ?auto_495837 ?auto_495838 ?auto_495839 ?auto_495840 ?auto_495841 ?auto_495842 ?auto_495843 ?auto_495844 ?auto_495845 ?auto_495846 ?auto_495847 ?auto_495848 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495866 - BLOCK
      ?auto_495867 - BLOCK
      ?auto_495868 - BLOCK
      ?auto_495869 - BLOCK
      ?auto_495870 - BLOCK
      ?auto_495871 - BLOCK
      ?auto_495872 - BLOCK
      ?auto_495873 - BLOCK
      ?auto_495874 - BLOCK
      ?auto_495875 - BLOCK
      ?auto_495876 - BLOCK
      ?auto_495877 - BLOCK
      ?auto_495878 - BLOCK
      ?auto_495879 - BLOCK
      ?auto_495880 - BLOCK
      ?auto_495881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_495881 ) ( ON-TABLE ?auto_495866 ) ( ON ?auto_495867 ?auto_495866 ) ( ON ?auto_495868 ?auto_495867 ) ( ON ?auto_495869 ?auto_495868 ) ( ON ?auto_495870 ?auto_495869 ) ( ON ?auto_495871 ?auto_495870 ) ( not ( = ?auto_495866 ?auto_495867 ) ) ( not ( = ?auto_495866 ?auto_495868 ) ) ( not ( = ?auto_495866 ?auto_495869 ) ) ( not ( = ?auto_495866 ?auto_495870 ) ) ( not ( = ?auto_495866 ?auto_495871 ) ) ( not ( = ?auto_495866 ?auto_495872 ) ) ( not ( = ?auto_495866 ?auto_495873 ) ) ( not ( = ?auto_495866 ?auto_495874 ) ) ( not ( = ?auto_495866 ?auto_495875 ) ) ( not ( = ?auto_495866 ?auto_495876 ) ) ( not ( = ?auto_495866 ?auto_495877 ) ) ( not ( = ?auto_495866 ?auto_495878 ) ) ( not ( = ?auto_495866 ?auto_495879 ) ) ( not ( = ?auto_495866 ?auto_495880 ) ) ( not ( = ?auto_495866 ?auto_495881 ) ) ( not ( = ?auto_495867 ?auto_495868 ) ) ( not ( = ?auto_495867 ?auto_495869 ) ) ( not ( = ?auto_495867 ?auto_495870 ) ) ( not ( = ?auto_495867 ?auto_495871 ) ) ( not ( = ?auto_495867 ?auto_495872 ) ) ( not ( = ?auto_495867 ?auto_495873 ) ) ( not ( = ?auto_495867 ?auto_495874 ) ) ( not ( = ?auto_495867 ?auto_495875 ) ) ( not ( = ?auto_495867 ?auto_495876 ) ) ( not ( = ?auto_495867 ?auto_495877 ) ) ( not ( = ?auto_495867 ?auto_495878 ) ) ( not ( = ?auto_495867 ?auto_495879 ) ) ( not ( = ?auto_495867 ?auto_495880 ) ) ( not ( = ?auto_495867 ?auto_495881 ) ) ( not ( = ?auto_495868 ?auto_495869 ) ) ( not ( = ?auto_495868 ?auto_495870 ) ) ( not ( = ?auto_495868 ?auto_495871 ) ) ( not ( = ?auto_495868 ?auto_495872 ) ) ( not ( = ?auto_495868 ?auto_495873 ) ) ( not ( = ?auto_495868 ?auto_495874 ) ) ( not ( = ?auto_495868 ?auto_495875 ) ) ( not ( = ?auto_495868 ?auto_495876 ) ) ( not ( = ?auto_495868 ?auto_495877 ) ) ( not ( = ?auto_495868 ?auto_495878 ) ) ( not ( = ?auto_495868 ?auto_495879 ) ) ( not ( = ?auto_495868 ?auto_495880 ) ) ( not ( = ?auto_495868 ?auto_495881 ) ) ( not ( = ?auto_495869 ?auto_495870 ) ) ( not ( = ?auto_495869 ?auto_495871 ) ) ( not ( = ?auto_495869 ?auto_495872 ) ) ( not ( = ?auto_495869 ?auto_495873 ) ) ( not ( = ?auto_495869 ?auto_495874 ) ) ( not ( = ?auto_495869 ?auto_495875 ) ) ( not ( = ?auto_495869 ?auto_495876 ) ) ( not ( = ?auto_495869 ?auto_495877 ) ) ( not ( = ?auto_495869 ?auto_495878 ) ) ( not ( = ?auto_495869 ?auto_495879 ) ) ( not ( = ?auto_495869 ?auto_495880 ) ) ( not ( = ?auto_495869 ?auto_495881 ) ) ( not ( = ?auto_495870 ?auto_495871 ) ) ( not ( = ?auto_495870 ?auto_495872 ) ) ( not ( = ?auto_495870 ?auto_495873 ) ) ( not ( = ?auto_495870 ?auto_495874 ) ) ( not ( = ?auto_495870 ?auto_495875 ) ) ( not ( = ?auto_495870 ?auto_495876 ) ) ( not ( = ?auto_495870 ?auto_495877 ) ) ( not ( = ?auto_495870 ?auto_495878 ) ) ( not ( = ?auto_495870 ?auto_495879 ) ) ( not ( = ?auto_495870 ?auto_495880 ) ) ( not ( = ?auto_495870 ?auto_495881 ) ) ( not ( = ?auto_495871 ?auto_495872 ) ) ( not ( = ?auto_495871 ?auto_495873 ) ) ( not ( = ?auto_495871 ?auto_495874 ) ) ( not ( = ?auto_495871 ?auto_495875 ) ) ( not ( = ?auto_495871 ?auto_495876 ) ) ( not ( = ?auto_495871 ?auto_495877 ) ) ( not ( = ?auto_495871 ?auto_495878 ) ) ( not ( = ?auto_495871 ?auto_495879 ) ) ( not ( = ?auto_495871 ?auto_495880 ) ) ( not ( = ?auto_495871 ?auto_495881 ) ) ( not ( = ?auto_495872 ?auto_495873 ) ) ( not ( = ?auto_495872 ?auto_495874 ) ) ( not ( = ?auto_495872 ?auto_495875 ) ) ( not ( = ?auto_495872 ?auto_495876 ) ) ( not ( = ?auto_495872 ?auto_495877 ) ) ( not ( = ?auto_495872 ?auto_495878 ) ) ( not ( = ?auto_495872 ?auto_495879 ) ) ( not ( = ?auto_495872 ?auto_495880 ) ) ( not ( = ?auto_495872 ?auto_495881 ) ) ( not ( = ?auto_495873 ?auto_495874 ) ) ( not ( = ?auto_495873 ?auto_495875 ) ) ( not ( = ?auto_495873 ?auto_495876 ) ) ( not ( = ?auto_495873 ?auto_495877 ) ) ( not ( = ?auto_495873 ?auto_495878 ) ) ( not ( = ?auto_495873 ?auto_495879 ) ) ( not ( = ?auto_495873 ?auto_495880 ) ) ( not ( = ?auto_495873 ?auto_495881 ) ) ( not ( = ?auto_495874 ?auto_495875 ) ) ( not ( = ?auto_495874 ?auto_495876 ) ) ( not ( = ?auto_495874 ?auto_495877 ) ) ( not ( = ?auto_495874 ?auto_495878 ) ) ( not ( = ?auto_495874 ?auto_495879 ) ) ( not ( = ?auto_495874 ?auto_495880 ) ) ( not ( = ?auto_495874 ?auto_495881 ) ) ( not ( = ?auto_495875 ?auto_495876 ) ) ( not ( = ?auto_495875 ?auto_495877 ) ) ( not ( = ?auto_495875 ?auto_495878 ) ) ( not ( = ?auto_495875 ?auto_495879 ) ) ( not ( = ?auto_495875 ?auto_495880 ) ) ( not ( = ?auto_495875 ?auto_495881 ) ) ( not ( = ?auto_495876 ?auto_495877 ) ) ( not ( = ?auto_495876 ?auto_495878 ) ) ( not ( = ?auto_495876 ?auto_495879 ) ) ( not ( = ?auto_495876 ?auto_495880 ) ) ( not ( = ?auto_495876 ?auto_495881 ) ) ( not ( = ?auto_495877 ?auto_495878 ) ) ( not ( = ?auto_495877 ?auto_495879 ) ) ( not ( = ?auto_495877 ?auto_495880 ) ) ( not ( = ?auto_495877 ?auto_495881 ) ) ( not ( = ?auto_495878 ?auto_495879 ) ) ( not ( = ?auto_495878 ?auto_495880 ) ) ( not ( = ?auto_495878 ?auto_495881 ) ) ( not ( = ?auto_495879 ?auto_495880 ) ) ( not ( = ?auto_495879 ?auto_495881 ) ) ( not ( = ?auto_495880 ?auto_495881 ) ) ( ON ?auto_495880 ?auto_495881 ) ( ON ?auto_495879 ?auto_495880 ) ( ON ?auto_495878 ?auto_495879 ) ( ON ?auto_495877 ?auto_495878 ) ( ON ?auto_495876 ?auto_495877 ) ( ON ?auto_495875 ?auto_495876 ) ( ON ?auto_495874 ?auto_495875 ) ( ON ?auto_495873 ?auto_495874 ) ( CLEAR ?auto_495871 ) ( ON ?auto_495872 ?auto_495873 ) ( CLEAR ?auto_495872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_495866 ?auto_495867 ?auto_495868 ?auto_495869 ?auto_495870 ?auto_495871 ?auto_495872 )
      ( MAKE-16PILE ?auto_495866 ?auto_495867 ?auto_495868 ?auto_495869 ?auto_495870 ?auto_495871 ?auto_495872 ?auto_495873 ?auto_495874 ?auto_495875 ?auto_495876 ?auto_495877 ?auto_495878 ?auto_495879 ?auto_495880 ?auto_495881 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495898 - BLOCK
      ?auto_495899 - BLOCK
      ?auto_495900 - BLOCK
      ?auto_495901 - BLOCK
      ?auto_495902 - BLOCK
      ?auto_495903 - BLOCK
      ?auto_495904 - BLOCK
      ?auto_495905 - BLOCK
      ?auto_495906 - BLOCK
      ?auto_495907 - BLOCK
      ?auto_495908 - BLOCK
      ?auto_495909 - BLOCK
      ?auto_495910 - BLOCK
      ?auto_495911 - BLOCK
      ?auto_495912 - BLOCK
      ?auto_495913 - BLOCK
    )
    :vars
    (
      ?auto_495914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495913 ?auto_495914 ) ( ON-TABLE ?auto_495898 ) ( ON ?auto_495899 ?auto_495898 ) ( ON ?auto_495900 ?auto_495899 ) ( ON ?auto_495901 ?auto_495900 ) ( ON ?auto_495902 ?auto_495901 ) ( not ( = ?auto_495898 ?auto_495899 ) ) ( not ( = ?auto_495898 ?auto_495900 ) ) ( not ( = ?auto_495898 ?auto_495901 ) ) ( not ( = ?auto_495898 ?auto_495902 ) ) ( not ( = ?auto_495898 ?auto_495903 ) ) ( not ( = ?auto_495898 ?auto_495904 ) ) ( not ( = ?auto_495898 ?auto_495905 ) ) ( not ( = ?auto_495898 ?auto_495906 ) ) ( not ( = ?auto_495898 ?auto_495907 ) ) ( not ( = ?auto_495898 ?auto_495908 ) ) ( not ( = ?auto_495898 ?auto_495909 ) ) ( not ( = ?auto_495898 ?auto_495910 ) ) ( not ( = ?auto_495898 ?auto_495911 ) ) ( not ( = ?auto_495898 ?auto_495912 ) ) ( not ( = ?auto_495898 ?auto_495913 ) ) ( not ( = ?auto_495898 ?auto_495914 ) ) ( not ( = ?auto_495899 ?auto_495900 ) ) ( not ( = ?auto_495899 ?auto_495901 ) ) ( not ( = ?auto_495899 ?auto_495902 ) ) ( not ( = ?auto_495899 ?auto_495903 ) ) ( not ( = ?auto_495899 ?auto_495904 ) ) ( not ( = ?auto_495899 ?auto_495905 ) ) ( not ( = ?auto_495899 ?auto_495906 ) ) ( not ( = ?auto_495899 ?auto_495907 ) ) ( not ( = ?auto_495899 ?auto_495908 ) ) ( not ( = ?auto_495899 ?auto_495909 ) ) ( not ( = ?auto_495899 ?auto_495910 ) ) ( not ( = ?auto_495899 ?auto_495911 ) ) ( not ( = ?auto_495899 ?auto_495912 ) ) ( not ( = ?auto_495899 ?auto_495913 ) ) ( not ( = ?auto_495899 ?auto_495914 ) ) ( not ( = ?auto_495900 ?auto_495901 ) ) ( not ( = ?auto_495900 ?auto_495902 ) ) ( not ( = ?auto_495900 ?auto_495903 ) ) ( not ( = ?auto_495900 ?auto_495904 ) ) ( not ( = ?auto_495900 ?auto_495905 ) ) ( not ( = ?auto_495900 ?auto_495906 ) ) ( not ( = ?auto_495900 ?auto_495907 ) ) ( not ( = ?auto_495900 ?auto_495908 ) ) ( not ( = ?auto_495900 ?auto_495909 ) ) ( not ( = ?auto_495900 ?auto_495910 ) ) ( not ( = ?auto_495900 ?auto_495911 ) ) ( not ( = ?auto_495900 ?auto_495912 ) ) ( not ( = ?auto_495900 ?auto_495913 ) ) ( not ( = ?auto_495900 ?auto_495914 ) ) ( not ( = ?auto_495901 ?auto_495902 ) ) ( not ( = ?auto_495901 ?auto_495903 ) ) ( not ( = ?auto_495901 ?auto_495904 ) ) ( not ( = ?auto_495901 ?auto_495905 ) ) ( not ( = ?auto_495901 ?auto_495906 ) ) ( not ( = ?auto_495901 ?auto_495907 ) ) ( not ( = ?auto_495901 ?auto_495908 ) ) ( not ( = ?auto_495901 ?auto_495909 ) ) ( not ( = ?auto_495901 ?auto_495910 ) ) ( not ( = ?auto_495901 ?auto_495911 ) ) ( not ( = ?auto_495901 ?auto_495912 ) ) ( not ( = ?auto_495901 ?auto_495913 ) ) ( not ( = ?auto_495901 ?auto_495914 ) ) ( not ( = ?auto_495902 ?auto_495903 ) ) ( not ( = ?auto_495902 ?auto_495904 ) ) ( not ( = ?auto_495902 ?auto_495905 ) ) ( not ( = ?auto_495902 ?auto_495906 ) ) ( not ( = ?auto_495902 ?auto_495907 ) ) ( not ( = ?auto_495902 ?auto_495908 ) ) ( not ( = ?auto_495902 ?auto_495909 ) ) ( not ( = ?auto_495902 ?auto_495910 ) ) ( not ( = ?auto_495902 ?auto_495911 ) ) ( not ( = ?auto_495902 ?auto_495912 ) ) ( not ( = ?auto_495902 ?auto_495913 ) ) ( not ( = ?auto_495902 ?auto_495914 ) ) ( not ( = ?auto_495903 ?auto_495904 ) ) ( not ( = ?auto_495903 ?auto_495905 ) ) ( not ( = ?auto_495903 ?auto_495906 ) ) ( not ( = ?auto_495903 ?auto_495907 ) ) ( not ( = ?auto_495903 ?auto_495908 ) ) ( not ( = ?auto_495903 ?auto_495909 ) ) ( not ( = ?auto_495903 ?auto_495910 ) ) ( not ( = ?auto_495903 ?auto_495911 ) ) ( not ( = ?auto_495903 ?auto_495912 ) ) ( not ( = ?auto_495903 ?auto_495913 ) ) ( not ( = ?auto_495903 ?auto_495914 ) ) ( not ( = ?auto_495904 ?auto_495905 ) ) ( not ( = ?auto_495904 ?auto_495906 ) ) ( not ( = ?auto_495904 ?auto_495907 ) ) ( not ( = ?auto_495904 ?auto_495908 ) ) ( not ( = ?auto_495904 ?auto_495909 ) ) ( not ( = ?auto_495904 ?auto_495910 ) ) ( not ( = ?auto_495904 ?auto_495911 ) ) ( not ( = ?auto_495904 ?auto_495912 ) ) ( not ( = ?auto_495904 ?auto_495913 ) ) ( not ( = ?auto_495904 ?auto_495914 ) ) ( not ( = ?auto_495905 ?auto_495906 ) ) ( not ( = ?auto_495905 ?auto_495907 ) ) ( not ( = ?auto_495905 ?auto_495908 ) ) ( not ( = ?auto_495905 ?auto_495909 ) ) ( not ( = ?auto_495905 ?auto_495910 ) ) ( not ( = ?auto_495905 ?auto_495911 ) ) ( not ( = ?auto_495905 ?auto_495912 ) ) ( not ( = ?auto_495905 ?auto_495913 ) ) ( not ( = ?auto_495905 ?auto_495914 ) ) ( not ( = ?auto_495906 ?auto_495907 ) ) ( not ( = ?auto_495906 ?auto_495908 ) ) ( not ( = ?auto_495906 ?auto_495909 ) ) ( not ( = ?auto_495906 ?auto_495910 ) ) ( not ( = ?auto_495906 ?auto_495911 ) ) ( not ( = ?auto_495906 ?auto_495912 ) ) ( not ( = ?auto_495906 ?auto_495913 ) ) ( not ( = ?auto_495906 ?auto_495914 ) ) ( not ( = ?auto_495907 ?auto_495908 ) ) ( not ( = ?auto_495907 ?auto_495909 ) ) ( not ( = ?auto_495907 ?auto_495910 ) ) ( not ( = ?auto_495907 ?auto_495911 ) ) ( not ( = ?auto_495907 ?auto_495912 ) ) ( not ( = ?auto_495907 ?auto_495913 ) ) ( not ( = ?auto_495907 ?auto_495914 ) ) ( not ( = ?auto_495908 ?auto_495909 ) ) ( not ( = ?auto_495908 ?auto_495910 ) ) ( not ( = ?auto_495908 ?auto_495911 ) ) ( not ( = ?auto_495908 ?auto_495912 ) ) ( not ( = ?auto_495908 ?auto_495913 ) ) ( not ( = ?auto_495908 ?auto_495914 ) ) ( not ( = ?auto_495909 ?auto_495910 ) ) ( not ( = ?auto_495909 ?auto_495911 ) ) ( not ( = ?auto_495909 ?auto_495912 ) ) ( not ( = ?auto_495909 ?auto_495913 ) ) ( not ( = ?auto_495909 ?auto_495914 ) ) ( not ( = ?auto_495910 ?auto_495911 ) ) ( not ( = ?auto_495910 ?auto_495912 ) ) ( not ( = ?auto_495910 ?auto_495913 ) ) ( not ( = ?auto_495910 ?auto_495914 ) ) ( not ( = ?auto_495911 ?auto_495912 ) ) ( not ( = ?auto_495911 ?auto_495913 ) ) ( not ( = ?auto_495911 ?auto_495914 ) ) ( not ( = ?auto_495912 ?auto_495913 ) ) ( not ( = ?auto_495912 ?auto_495914 ) ) ( not ( = ?auto_495913 ?auto_495914 ) ) ( ON ?auto_495912 ?auto_495913 ) ( ON ?auto_495911 ?auto_495912 ) ( ON ?auto_495910 ?auto_495911 ) ( ON ?auto_495909 ?auto_495910 ) ( ON ?auto_495908 ?auto_495909 ) ( ON ?auto_495907 ?auto_495908 ) ( ON ?auto_495906 ?auto_495907 ) ( ON ?auto_495905 ?auto_495906 ) ( ON ?auto_495904 ?auto_495905 ) ( CLEAR ?auto_495902 ) ( ON ?auto_495903 ?auto_495904 ) ( CLEAR ?auto_495903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_495898 ?auto_495899 ?auto_495900 ?auto_495901 ?auto_495902 ?auto_495903 )
      ( MAKE-16PILE ?auto_495898 ?auto_495899 ?auto_495900 ?auto_495901 ?auto_495902 ?auto_495903 ?auto_495904 ?auto_495905 ?auto_495906 ?auto_495907 ?auto_495908 ?auto_495909 ?auto_495910 ?auto_495911 ?auto_495912 ?auto_495913 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495931 - BLOCK
      ?auto_495932 - BLOCK
      ?auto_495933 - BLOCK
      ?auto_495934 - BLOCK
      ?auto_495935 - BLOCK
      ?auto_495936 - BLOCK
      ?auto_495937 - BLOCK
      ?auto_495938 - BLOCK
      ?auto_495939 - BLOCK
      ?auto_495940 - BLOCK
      ?auto_495941 - BLOCK
      ?auto_495942 - BLOCK
      ?auto_495943 - BLOCK
      ?auto_495944 - BLOCK
      ?auto_495945 - BLOCK
      ?auto_495946 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_495946 ) ( ON-TABLE ?auto_495931 ) ( ON ?auto_495932 ?auto_495931 ) ( ON ?auto_495933 ?auto_495932 ) ( ON ?auto_495934 ?auto_495933 ) ( ON ?auto_495935 ?auto_495934 ) ( not ( = ?auto_495931 ?auto_495932 ) ) ( not ( = ?auto_495931 ?auto_495933 ) ) ( not ( = ?auto_495931 ?auto_495934 ) ) ( not ( = ?auto_495931 ?auto_495935 ) ) ( not ( = ?auto_495931 ?auto_495936 ) ) ( not ( = ?auto_495931 ?auto_495937 ) ) ( not ( = ?auto_495931 ?auto_495938 ) ) ( not ( = ?auto_495931 ?auto_495939 ) ) ( not ( = ?auto_495931 ?auto_495940 ) ) ( not ( = ?auto_495931 ?auto_495941 ) ) ( not ( = ?auto_495931 ?auto_495942 ) ) ( not ( = ?auto_495931 ?auto_495943 ) ) ( not ( = ?auto_495931 ?auto_495944 ) ) ( not ( = ?auto_495931 ?auto_495945 ) ) ( not ( = ?auto_495931 ?auto_495946 ) ) ( not ( = ?auto_495932 ?auto_495933 ) ) ( not ( = ?auto_495932 ?auto_495934 ) ) ( not ( = ?auto_495932 ?auto_495935 ) ) ( not ( = ?auto_495932 ?auto_495936 ) ) ( not ( = ?auto_495932 ?auto_495937 ) ) ( not ( = ?auto_495932 ?auto_495938 ) ) ( not ( = ?auto_495932 ?auto_495939 ) ) ( not ( = ?auto_495932 ?auto_495940 ) ) ( not ( = ?auto_495932 ?auto_495941 ) ) ( not ( = ?auto_495932 ?auto_495942 ) ) ( not ( = ?auto_495932 ?auto_495943 ) ) ( not ( = ?auto_495932 ?auto_495944 ) ) ( not ( = ?auto_495932 ?auto_495945 ) ) ( not ( = ?auto_495932 ?auto_495946 ) ) ( not ( = ?auto_495933 ?auto_495934 ) ) ( not ( = ?auto_495933 ?auto_495935 ) ) ( not ( = ?auto_495933 ?auto_495936 ) ) ( not ( = ?auto_495933 ?auto_495937 ) ) ( not ( = ?auto_495933 ?auto_495938 ) ) ( not ( = ?auto_495933 ?auto_495939 ) ) ( not ( = ?auto_495933 ?auto_495940 ) ) ( not ( = ?auto_495933 ?auto_495941 ) ) ( not ( = ?auto_495933 ?auto_495942 ) ) ( not ( = ?auto_495933 ?auto_495943 ) ) ( not ( = ?auto_495933 ?auto_495944 ) ) ( not ( = ?auto_495933 ?auto_495945 ) ) ( not ( = ?auto_495933 ?auto_495946 ) ) ( not ( = ?auto_495934 ?auto_495935 ) ) ( not ( = ?auto_495934 ?auto_495936 ) ) ( not ( = ?auto_495934 ?auto_495937 ) ) ( not ( = ?auto_495934 ?auto_495938 ) ) ( not ( = ?auto_495934 ?auto_495939 ) ) ( not ( = ?auto_495934 ?auto_495940 ) ) ( not ( = ?auto_495934 ?auto_495941 ) ) ( not ( = ?auto_495934 ?auto_495942 ) ) ( not ( = ?auto_495934 ?auto_495943 ) ) ( not ( = ?auto_495934 ?auto_495944 ) ) ( not ( = ?auto_495934 ?auto_495945 ) ) ( not ( = ?auto_495934 ?auto_495946 ) ) ( not ( = ?auto_495935 ?auto_495936 ) ) ( not ( = ?auto_495935 ?auto_495937 ) ) ( not ( = ?auto_495935 ?auto_495938 ) ) ( not ( = ?auto_495935 ?auto_495939 ) ) ( not ( = ?auto_495935 ?auto_495940 ) ) ( not ( = ?auto_495935 ?auto_495941 ) ) ( not ( = ?auto_495935 ?auto_495942 ) ) ( not ( = ?auto_495935 ?auto_495943 ) ) ( not ( = ?auto_495935 ?auto_495944 ) ) ( not ( = ?auto_495935 ?auto_495945 ) ) ( not ( = ?auto_495935 ?auto_495946 ) ) ( not ( = ?auto_495936 ?auto_495937 ) ) ( not ( = ?auto_495936 ?auto_495938 ) ) ( not ( = ?auto_495936 ?auto_495939 ) ) ( not ( = ?auto_495936 ?auto_495940 ) ) ( not ( = ?auto_495936 ?auto_495941 ) ) ( not ( = ?auto_495936 ?auto_495942 ) ) ( not ( = ?auto_495936 ?auto_495943 ) ) ( not ( = ?auto_495936 ?auto_495944 ) ) ( not ( = ?auto_495936 ?auto_495945 ) ) ( not ( = ?auto_495936 ?auto_495946 ) ) ( not ( = ?auto_495937 ?auto_495938 ) ) ( not ( = ?auto_495937 ?auto_495939 ) ) ( not ( = ?auto_495937 ?auto_495940 ) ) ( not ( = ?auto_495937 ?auto_495941 ) ) ( not ( = ?auto_495937 ?auto_495942 ) ) ( not ( = ?auto_495937 ?auto_495943 ) ) ( not ( = ?auto_495937 ?auto_495944 ) ) ( not ( = ?auto_495937 ?auto_495945 ) ) ( not ( = ?auto_495937 ?auto_495946 ) ) ( not ( = ?auto_495938 ?auto_495939 ) ) ( not ( = ?auto_495938 ?auto_495940 ) ) ( not ( = ?auto_495938 ?auto_495941 ) ) ( not ( = ?auto_495938 ?auto_495942 ) ) ( not ( = ?auto_495938 ?auto_495943 ) ) ( not ( = ?auto_495938 ?auto_495944 ) ) ( not ( = ?auto_495938 ?auto_495945 ) ) ( not ( = ?auto_495938 ?auto_495946 ) ) ( not ( = ?auto_495939 ?auto_495940 ) ) ( not ( = ?auto_495939 ?auto_495941 ) ) ( not ( = ?auto_495939 ?auto_495942 ) ) ( not ( = ?auto_495939 ?auto_495943 ) ) ( not ( = ?auto_495939 ?auto_495944 ) ) ( not ( = ?auto_495939 ?auto_495945 ) ) ( not ( = ?auto_495939 ?auto_495946 ) ) ( not ( = ?auto_495940 ?auto_495941 ) ) ( not ( = ?auto_495940 ?auto_495942 ) ) ( not ( = ?auto_495940 ?auto_495943 ) ) ( not ( = ?auto_495940 ?auto_495944 ) ) ( not ( = ?auto_495940 ?auto_495945 ) ) ( not ( = ?auto_495940 ?auto_495946 ) ) ( not ( = ?auto_495941 ?auto_495942 ) ) ( not ( = ?auto_495941 ?auto_495943 ) ) ( not ( = ?auto_495941 ?auto_495944 ) ) ( not ( = ?auto_495941 ?auto_495945 ) ) ( not ( = ?auto_495941 ?auto_495946 ) ) ( not ( = ?auto_495942 ?auto_495943 ) ) ( not ( = ?auto_495942 ?auto_495944 ) ) ( not ( = ?auto_495942 ?auto_495945 ) ) ( not ( = ?auto_495942 ?auto_495946 ) ) ( not ( = ?auto_495943 ?auto_495944 ) ) ( not ( = ?auto_495943 ?auto_495945 ) ) ( not ( = ?auto_495943 ?auto_495946 ) ) ( not ( = ?auto_495944 ?auto_495945 ) ) ( not ( = ?auto_495944 ?auto_495946 ) ) ( not ( = ?auto_495945 ?auto_495946 ) ) ( ON ?auto_495945 ?auto_495946 ) ( ON ?auto_495944 ?auto_495945 ) ( ON ?auto_495943 ?auto_495944 ) ( ON ?auto_495942 ?auto_495943 ) ( ON ?auto_495941 ?auto_495942 ) ( ON ?auto_495940 ?auto_495941 ) ( ON ?auto_495939 ?auto_495940 ) ( ON ?auto_495938 ?auto_495939 ) ( ON ?auto_495937 ?auto_495938 ) ( CLEAR ?auto_495935 ) ( ON ?auto_495936 ?auto_495937 ) ( CLEAR ?auto_495936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_495931 ?auto_495932 ?auto_495933 ?auto_495934 ?auto_495935 ?auto_495936 )
      ( MAKE-16PILE ?auto_495931 ?auto_495932 ?auto_495933 ?auto_495934 ?auto_495935 ?auto_495936 ?auto_495937 ?auto_495938 ?auto_495939 ?auto_495940 ?auto_495941 ?auto_495942 ?auto_495943 ?auto_495944 ?auto_495945 ?auto_495946 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495963 - BLOCK
      ?auto_495964 - BLOCK
      ?auto_495965 - BLOCK
      ?auto_495966 - BLOCK
      ?auto_495967 - BLOCK
      ?auto_495968 - BLOCK
      ?auto_495969 - BLOCK
      ?auto_495970 - BLOCK
      ?auto_495971 - BLOCK
      ?auto_495972 - BLOCK
      ?auto_495973 - BLOCK
      ?auto_495974 - BLOCK
      ?auto_495975 - BLOCK
      ?auto_495976 - BLOCK
      ?auto_495977 - BLOCK
      ?auto_495978 - BLOCK
    )
    :vars
    (
      ?auto_495979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_495978 ?auto_495979 ) ( ON-TABLE ?auto_495963 ) ( ON ?auto_495964 ?auto_495963 ) ( ON ?auto_495965 ?auto_495964 ) ( ON ?auto_495966 ?auto_495965 ) ( not ( = ?auto_495963 ?auto_495964 ) ) ( not ( = ?auto_495963 ?auto_495965 ) ) ( not ( = ?auto_495963 ?auto_495966 ) ) ( not ( = ?auto_495963 ?auto_495967 ) ) ( not ( = ?auto_495963 ?auto_495968 ) ) ( not ( = ?auto_495963 ?auto_495969 ) ) ( not ( = ?auto_495963 ?auto_495970 ) ) ( not ( = ?auto_495963 ?auto_495971 ) ) ( not ( = ?auto_495963 ?auto_495972 ) ) ( not ( = ?auto_495963 ?auto_495973 ) ) ( not ( = ?auto_495963 ?auto_495974 ) ) ( not ( = ?auto_495963 ?auto_495975 ) ) ( not ( = ?auto_495963 ?auto_495976 ) ) ( not ( = ?auto_495963 ?auto_495977 ) ) ( not ( = ?auto_495963 ?auto_495978 ) ) ( not ( = ?auto_495963 ?auto_495979 ) ) ( not ( = ?auto_495964 ?auto_495965 ) ) ( not ( = ?auto_495964 ?auto_495966 ) ) ( not ( = ?auto_495964 ?auto_495967 ) ) ( not ( = ?auto_495964 ?auto_495968 ) ) ( not ( = ?auto_495964 ?auto_495969 ) ) ( not ( = ?auto_495964 ?auto_495970 ) ) ( not ( = ?auto_495964 ?auto_495971 ) ) ( not ( = ?auto_495964 ?auto_495972 ) ) ( not ( = ?auto_495964 ?auto_495973 ) ) ( not ( = ?auto_495964 ?auto_495974 ) ) ( not ( = ?auto_495964 ?auto_495975 ) ) ( not ( = ?auto_495964 ?auto_495976 ) ) ( not ( = ?auto_495964 ?auto_495977 ) ) ( not ( = ?auto_495964 ?auto_495978 ) ) ( not ( = ?auto_495964 ?auto_495979 ) ) ( not ( = ?auto_495965 ?auto_495966 ) ) ( not ( = ?auto_495965 ?auto_495967 ) ) ( not ( = ?auto_495965 ?auto_495968 ) ) ( not ( = ?auto_495965 ?auto_495969 ) ) ( not ( = ?auto_495965 ?auto_495970 ) ) ( not ( = ?auto_495965 ?auto_495971 ) ) ( not ( = ?auto_495965 ?auto_495972 ) ) ( not ( = ?auto_495965 ?auto_495973 ) ) ( not ( = ?auto_495965 ?auto_495974 ) ) ( not ( = ?auto_495965 ?auto_495975 ) ) ( not ( = ?auto_495965 ?auto_495976 ) ) ( not ( = ?auto_495965 ?auto_495977 ) ) ( not ( = ?auto_495965 ?auto_495978 ) ) ( not ( = ?auto_495965 ?auto_495979 ) ) ( not ( = ?auto_495966 ?auto_495967 ) ) ( not ( = ?auto_495966 ?auto_495968 ) ) ( not ( = ?auto_495966 ?auto_495969 ) ) ( not ( = ?auto_495966 ?auto_495970 ) ) ( not ( = ?auto_495966 ?auto_495971 ) ) ( not ( = ?auto_495966 ?auto_495972 ) ) ( not ( = ?auto_495966 ?auto_495973 ) ) ( not ( = ?auto_495966 ?auto_495974 ) ) ( not ( = ?auto_495966 ?auto_495975 ) ) ( not ( = ?auto_495966 ?auto_495976 ) ) ( not ( = ?auto_495966 ?auto_495977 ) ) ( not ( = ?auto_495966 ?auto_495978 ) ) ( not ( = ?auto_495966 ?auto_495979 ) ) ( not ( = ?auto_495967 ?auto_495968 ) ) ( not ( = ?auto_495967 ?auto_495969 ) ) ( not ( = ?auto_495967 ?auto_495970 ) ) ( not ( = ?auto_495967 ?auto_495971 ) ) ( not ( = ?auto_495967 ?auto_495972 ) ) ( not ( = ?auto_495967 ?auto_495973 ) ) ( not ( = ?auto_495967 ?auto_495974 ) ) ( not ( = ?auto_495967 ?auto_495975 ) ) ( not ( = ?auto_495967 ?auto_495976 ) ) ( not ( = ?auto_495967 ?auto_495977 ) ) ( not ( = ?auto_495967 ?auto_495978 ) ) ( not ( = ?auto_495967 ?auto_495979 ) ) ( not ( = ?auto_495968 ?auto_495969 ) ) ( not ( = ?auto_495968 ?auto_495970 ) ) ( not ( = ?auto_495968 ?auto_495971 ) ) ( not ( = ?auto_495968 ?auto_495972 ) ) ( not ( = ?auto_495968 ?auto_495973 ) ) ( not ( = ?auto_495968 ?auto_495974 ) ) ( not ( = ?auto_495968 ?auto_495975 ) ) ( not ( = ?auto_495968 ?auto_495976 ) ) ( not ( = ?auto_495968 ?auto_495977 ) ) ( not ( = ?auto_495968 ?auto_495978 ) ) ( not ( = ?auto_495968 ?auto_495979 ) ) ( not ( = ?auto_495969 ?auto_495970 ) ) ( not ( = ?auto_495969 ?auto_495971 ) ) ( not ( = ?auto_495969 ?auto_495972 ) ) ( not ( = ?auto_495969 ?auto_495973 ) ) ( not ( = ?auto_495969 ?auto_495974 ) ) ( not ( = ?auto_495969 ?auto_495975 ) ) ( not ( = ?auto_495969 ?auto_495976 ) ) ( not ( = ?auto_495969 ?auto_495977 ) ) ( not ( = ?auto_495969 ?auto_495978 ) ) ( not ( = ?auto_495969 ?auto_495979 ) ) ( not ( = ?auto_495970 ?auto_495971 ) ) ( not ( = ?auto_495970 ?auto_495972 ) ) ( not ( = ?auto_495970 ?auto_495973 ) ) ( not ( = ?auto_495970 ?auto_495974 ) ) ( not ( = ?auto_495970 ?auto_495975 ) ) ( not ( = ?auto_495970 ?auto_495976 ) ) ( not ( = ?auto_495970 ?auto_495977 ) ) ( not ( = ?auto_495970 ?auto_495978 ) ) ( not ( = ?auto_495970 ?auto_495979 ) ) ( not ( = ?auto_495971 ?auto_495972 ) ) ( not ( = ?auto_495971 ?auto_495973 ) ) ( not ( = ?auto_495971 ?auto_495974 ) ) ( not ( = ?auto_495971 ?auto_495975 ) ) ( not ( = ?auto_495971 ?auto_495976 ) ) ( not ( = ?auto_495971 ?auto_495977 ) ) ( not ( = ?auto_495971 ?auto_495978 ) ) ( not ( = ?auto_495971 ?auto_495979 ) ) ( not ( = ?auto_495972 ?auto_495973 ) ) ( not ( = ?auto_495972 ?auto_495974 ) ) ( not ( = ?auto_495972 ?auto_495975 ) ) ( not ( = ?auto_495972 ?auto_495976 ) ) ( not ( = ?auto_495972 ?auto_495977 ) ) ( not ( = ?auto_495972 ?auto_495978 ) ) ( not ( = ?auto_495972 ?auto_495979 ) ) ( not ( = ?auto_495973 ?auto_495974 ) ) ( not ( = ?auto_495973 ?auto_495975 ) ) ( not ( = ?auto_495973 ?auto_495976 ) ) ( not ( = ?auto_495973 ?auto_495977 ) ) ( not ( = ?auto_495973 ?auto_495978 ) ) ( not ( = ?auto_495973 ?auto_495979 ) ) ( not ( = ?auto_495974 ?auto_495975 ) ) ( not ( = ?auto_495974 ?auto_495976 ) ) ( not ( = ?auto_495974 ?auto_495977 ) ) ( not ( = ?auto_495974 ?auto_495978 ) ) ( not ( = ?auto_495974 ?auto_495979 ) ) ( not ( = ?auto_495975 ?auto_495976 ) ) ( not ( = ?auto_495975 ?auto_495977 ) ) ( not ( = ?auto_495975 ?auto_495978 ) ) ( not ( = ?auto_495975 ?auto_495979 ) ) ( not ( = ?auto_495976 ?auto_495977 ) ) ( not ( = ?auto_495976 ?auto_495978 ) ) ( not ( = ?auto_495976 ?auto_495979 ) ) ( not ( = ?auto_495977 ?auto_495978 ) ) ( not ( = ?auto_495977 ?auto_495979 ) ) ( not ( = ?auto_495978 ?auto_495979 ) ) ( ON ?auto_495977 ?auto_495978 ) ( ON ?auto_495976 ?auto_495977 ) ( ON ?auto_495975 ?auto_495976 ) ( ON ?auto_495974 ?auto_495975 ) ( ON ?auto_495973 ?auto_495974 ) ( ON ?auto_495972 ?auto_495973 ) ( ON ?auto_495971 ?auto_495972 ) ( ON ?auto_495970 ?auto_495971 ) ( ON ?auto_495969 ?auto_495970 ) ( ON ?auto_495968 ?auto_495969 ) ( CLEAR ?auto_495966 ) ( ON ?auto_495967 ?auto_495968 ) ( CLEAR ?auto_495967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_495963 ?auto_495964 ?auto_495965 ?auto_495966 ?auto_495967 )
      ( MAKE-16PILE ?auto_495963 ?auto_495964 ?auto_495965 ?auto_495966 ?auto_495967 ?auto_495968 ?auto_495969 ?auto_495970 ?auto_495971 ?auto_495972 ?auto_495973 ?auto_495974 ?auto_495975 ?auto_495976 ?auto_495977 ?auto_495978 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_495996 - BLOCK
      ?auto_495997 - BLOCK
      ?auto_495998 - BLOCK
      ?auto_495999 - BLOCK
      ?auto_496000 - BLOCK
      ?auto_496001 - BLOCK
      ?auto_496002 - BLOCK
      ?auto_496003 - BLOCK
      ?auto_496004 - BLOCK
      ?auto_496005 - BLOCK
      ?auto_496006 - BLOCK
      ?auto_496007 - BLOCK
      ?auto_496008 - BLOCK
      ?auto_496009 - BLOCK
      ?auto_496010 - BLOCK
      ?auto_496011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_496011 ) ( ON-TABLE ?auto_495996 ) ( ON ?auto_495997 ?auto_495996 ) ( ON ?auto_495998 ?auto_495997 ) ( ON ?auto_495999 ?auto_495998 ) ( not ( = ?auto_495996 ?auto_495997 ) ) ( not ( = ?auto_495996 ?auto_495998 ) ) ( not ( = ?auto_495996 ?auto_495999 ) ) ( not ( = ?auto_495996 ?auto_496000 ) ) ( not ( = ?auto_495996 ?auto_496001 ) ) ( not ( = ?auto_495996 ?auto_496002 ) ) ( not ( = ?auto_495996 ?auto_496003 ) ) ( not ( = ?auto_495996 ?auto_496004 ) ) ( not ( = ?auto_495996 ?auto_496005 ) ) ( not ( = ?auto_495996 ?auto_496006 ) ) ( not ( = ?auto_495996 ?auto_496007 ) ) ( not ( = ?auto_495996 ?auto_496008 ) ) ( not ( = ?auto_495996 ?auto_496009 ) ) ( not ( = ?auto_495996 ?auto_496010 ) ) ( not ( = ?auto_495996 ?auto_496011 ) ) ( not ( = ?auto_495997 ?auto_495998 ) ) ( not ( = ?auto_495997 ?auto_495999 ) ) ( not ( = ?auto_495997 ?auto_496000 ) ) ( not ( = ?auto_495997 ?auto_496001 ) ) ( not ( = ?auto_495997 ?auto_496002 ) ) ( not ( = ?auto_495997 ?auto_496003 ) ) ( not ( = ?auto_495997 ?auto_496004 ) ) ( not ( = ?auto_495997 ?auto_496005 ) ) ( not ( = ?auto_495997 ?auto_496006 ) ) ( not ( = ?auto_495997 ?auto_496007 ) ) ( not ( = ?auto_495997 ?auto_496008 ) ) ( not ( = ?auto_495997 ?auto_496009 ) ) ( not ( = ?auto_495997 ?auto_496010 ) ) ( not ( = ?auto_495997 ?auto_496011 ) ) ( not ( = ?auto_495998 ?auto_495999 ) ) ( not ( = ?auto_495998 ?auto_496000 ) ) ( not ( = ?auto_495998 ?auto_496001 ) ) ( not ( = ?auto_495998 ?auto_496002 ) ) ( not ( = ?auto_495998 ?auto_496003 ) ) ( not ( = ?auto_495998 ?auto_496004 ) ) ( not ( = ?auto_495998 ?auto_496005 ) ) ( not ( = ?auto_495998 ?auto_496006 ) ) ( not ( = ?auto_495998 ?auto_496007 ) ) ( not ( = ?auto_495998 ?auto_496008 ) ) ( not ( = ?auto_495998 ?auto_496009 ) ) ( not ( = ?auto_495998 ?auto_496010 ) ) ( not ( = ?auto_495998 ?auto_496011 ) ) ( not ( = ?auto_495999 ?auto_496000 ) ) ( not ( = ?auto_495999 ?auto_496001 ) ) ( not ( = ?auto_495999 ?auto_496002 ) ) ( not ( = ?auto_495999 ?auto_496003 ) ) ( not ( = ?auto_495999 ?auto_496004 ) ) ( not ( = ?auto_495999 ?auto_496005 ) ) ( not ( = ?auto_495999 ?auto_496006 ) ) ( not ( = ?auto_495999 ?auto_496007 ) ) ( not ( = ?auto_495999 ?auto_496008 ) ) ( not ( = ?auto_495999 ?auto_496009 ) ) ( not ( = ?auto_495999 ?auto_496010 ) ) ( not ( = ?auto_495999 ?auto_496011 ) ) ( not ( = ?auto_496000 ?auto_496001 ) ) ( not ( = ?auto_496000 ?auto_496002 ) ) ( not ( = ?auto_496000 ?auto_496003 ) ) ( not ( = ?auto_496000 ?auto_496004 ) ) ( not ( = ?auto_496000 ?auto_496005 ) ) ( not ( = ?auto_496000 ?auto_496006 ) ) ( not ( = ?auto_496000 ?auto_496007 ) ) ( not ( = ?auto_496000 ?auto_496008 ) ) ( not ( = ?auto_496000 ?auto_496009 ) ) ( not ( = ?auto_496000 ?auto_496010 ) ) ( not ( = ?auto_496000 ?auto_496011 ) ) ( not ( = ?auto_496001 ?auto_496002 ) ) ( not ( = ?auto_496001 ?auto_496003 ) ) ( not ( = ?auto_496001 ?auto_496004 ) ) ( not ( = ?auto_496001 ?auto_496005 ) ) ( not ( = ?auto_496001 ?auto_496006 ) ) ( not ( = ?auto_496001 ?auto_496007 ) ) ( not ( = ?auto_496001 ?auto_496008 ) ) ( not ( = ?auto_496001 ?auto_496009 ) ) ( not ( = ?auto_496001 ?auto_496010 ) ) ( not ( = ?auto_496001 ?auto_496011 ) ) ( not ( = ?auto_496002 ?auto_496003 ) ) ( not ( = ?auto_496002 ?auto_496004 ) ) ( not ( = ?auto_496002 ?auto_496005 ) ) ( not ( = ?auto_496002 ?auto_496006 ) ) ( not ( = ?auto_496002 ?auto_496007 ) ) ( not ( = ?auto_496002 ?auto_496008 ) ) ( not ( = ?auto_496002 ?auto_496009 ) ) ( not ( = ?auto_496002 ?auto_496010 ) ) ( not ( = ?auto_496002 ?auto_496011 ) ) ( not ( = ?auto_496003 ?auto_496004 ) ) ( not ( = ?auto_496003 ?auto_496005 ) ) ( not ( = ?auto_496003 ?auto_496006 ) ) ( not ( = ?auto_496003 ?auto_496007 ) ) ( not ( = ?auto_496003 ?auto_496008 ) ) ( not ( = ?auto_496003 ?auto_496009 ) ) ( not ( = ?auto_496003 ?auto_496010 ) ) ( not ( = ?auto_496003 ?auto_496011 ) ) ( not ( = ?auto_496004 ?auto_496005 ) ) ( not ( = ?auto_496004 ?auto_496006 ) ) ( not ( = ?auto_496004 ?auto_496007 ) ) ( not ( = ?auto_496004 ?auto_496008 ) ) ( not ( = ?auto_496004 ?auto_496009 ) ) ( not ( = ?auto_496004 ?auto_496010 ) ) ( not ( = ?auto_496004 ?auto_496011 ) ) ( not ( = ?auto_496005 ?auto_496006 ) ) ( not ( = ?auto_496005 ?auto_496007 ) ) ( not ( = ?auto_496005 ?auto_496008 ) ) ( not ( = ?auto_496005 ?auto_496009 ) ) ( not ( = ?auto_496005 ?auto_496010 ) ) ( not ( = ?auto_496005 ?auto_496011 ) ) ( not ( = ?auto_496006 ?auto_496007 ) ) ( not ( = ?auto_496006 ?auto_496008 ) ) ( not ( = ?auto_496006 ?auto_496009 ) ) ( not ( = ?auto_496006 ?auto_496010 ) ) ( not ( = ?auto_496006 ?auto_496011 ) ) ( not ( = ?auto_496007 ?auto_496008 ) ) ( not ( = ?auto_496007 ?auto_496009 ) ) ( not ( = ?auto_496007 ?auto_496010 ) ) ( not ( = ?auto_496007 ?auto_496011 ) ) ( not ( = ?auto_496008 ?auto_496009 ) ) ( not ( = ?auto_496008 ?auto_496010 ) ) ( not ( = ?auto_496008 ?auto_496011 ) ) ( not ( = ?auto_496009 ?auto_496010 ) ) ( not ( = ?auto_496009 ?auto_496011 ) ) ( not ( = ?auto_496010 ?auto_496011 ) ) ( ON ?auto_496010 ?auto_496011 ) ( ON ?auto_496009 ?auto_496010 ) ( ON ?auto_496008 ?auto_496009 ) ( ON ?auto_496007 ?auto_496008 ) ( ON ?auto_496006 ?auto_496007 ) ( ON ?auto_496005 ?auto_496006 ) ( ON ?auto_496004 ?auto_496005 ) ( ON ?auto_496003 ?auto_496004 ) ( ON ?auto_496002 ?auto_496003 ) ( ON ?auto_496001 ?auto_496002 ) ( CLEAR ?auto_495999 ) ( ON ?auto_496000 ?auto_496001 ) ( CLEAR ?auto_496000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_495996 ?auto_495997 ?auto_495998 ?auto_495999 ?auto_496000 )
      ( MAKE-16PILE ?auto_495996 ?auto_495997 ?auto_495998 ?auto_495999 ?auto_496000 ?auto_496001 ?auto_496002 ?auto_496003 ?auto_496004 ?auto_496005 ?auto_496006 ?auto_496007 ?auto_496008 ?auto_496009 ?auto_496010 ?auto_496011 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_496028 - BLOCK
      ?auto_496029 - BLOCK
      ?auto_496030 - BLOCK
      ?auto_496031 - BLOCK
      ?auto_496032 - BLOCK
      ?auto_496033 - BLOCK
      ?auto_496034 - BLOCK
      ?auto_496035 - BLOCK
      ?auto_496036 - BLOCK
      ?auto_496037 - BLOCK
      ?auto_496038 - BLOCK
      ?auto_496039 - BLOCK
      ?auto_496040 - BLOCK
      ?auto_496041 - BLOCK
      ?auto_496042 - BLOCK
      ?auto_496043 - BLOCK
    )
    :vars
    (
      ?auto_496044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496043 ?auto_496044 ) ( ON-TABLE ?auto_496028 ) ( ON ?auto_496029 ?auto_496028 ) ( ON ?auto_496030 ?auto_496029 ) ( not ( = ?auto_496028 ?auto_496029 ) ) ( not ( = ?auto_496028 ?auto_496030 ) ) ( not ( = ?auto_496028 ?auto_496031 ) ) ( not ( = ?auto_496028 ?auto_496032 ) ) ( not ( = ?auto_496028 ?auto_496033 ) ) ( not ( = ?auto_496028 ?auto_496034 ) ) ( not ( = ?auto_496028 ?auto_496035 ) ) ( not ( = ?auto_496028 ?auto_496036 ) ) ( not ( = ?auto_496028 ?auto_496037 ) ) ( not ( = ?auto_496028 ?auto_496038 ) ) ( not ( = ?auto_496028 ?auto_496039 ) ) ( not ( = ?auto_496028 ?auto_496040 ) ) ( not ( = ?auto_496028 ?auto_496041 ) ) ( not ( = ?auto_496028 ?auto_496042 ) ) ( not ( = ?auto_496028 ?auto_496043 ) ) ( not ( = ?auto_496028 ?auto_496044 ) ) ( not ( = ?auto_496029 ?auto_496030 ) ) ( not ( = ?auto_496029 ?auto_496031 ) ) ( not ( = ?auto_496029 ?auto_496032 ) ) ( not ( = ?auto_496029 ?auto_496033 ) ) ( not ( = ?auto_496029 ?auto_496034 ) ) ( not ( = ?auto_496029 ?auto_496035 ) ) ( not ( = ?auto_496029 ?auto_496036 ) ) ( not ( = ?auto_496029 ?auto_496037 ) ) ( not ( = ?auto_496029 ?auto_496038 ) ) ( not ( = ?auto_496029 ?auto_496039 ) ) ( not ( = ?auto_496029 ?auto_496040 ) ) ( not ( = ?auto_496029 ?auto_496041 ) ) ( not ( = ?auto_496029 ?auto_496042 ) ) ( not ( = ?auto_496029 ?auto_496043 ) ) ( not ( = ?auto_496029 ?auto_496044 ) ) ( not ( = ?auto_496030 ?auto_496031 ) ) ( not ( = ?auto_496030 ?auto_496032 ) ) ( not ( = ?auto_496030 ?auto_496033 ) ) ( not ( = ?auto_496030 ?auto_496034 ) ) ( not ( = ?auto_496030 ?auto_496035 ) ) ( not ( = ?auto_496030 ?auto_496036 ) ) ( not ( = ?auto_496030 ?auto_496037 ) ) ( not ( = ?auto_496030 ?auto_496038 ) ) ( not ( = ?auto_496030 ?auto_496039 ) ) ( not ( = ?auto_496030 ?auto_496040 ) ) ( not ( = ?auto_496030 ?auto_496041 ) ) ( not ( = ?auto_496030 ?auto_496042 ) ) ( not ( = ?auto_496030 ?auto_496043 ) ) ( not ( = ?auto_496030 ?auto_496044 ) ) ( not ( = ?auto_496031 ?auto_496032 ) ) ( not ( = ?auto_496031 ?auto_496033 ) ) ( not ( = ?auto_496031 ?auto_496034 ) ) ( not ( = ?auto_496031 ?auto_496035 ) ) ( not ( = ?auto_496031 ?auto_496036 ) ) ( not ( = ?auto_496031 ?auto_496037 ) ) ( not ( = ?auto_496031 ?auto_496038 ) ) ( not ( = ?auto_496031 ?auto_496039 ) ) ( not ( = ?auto_496031 ?auto_496040 ) ) ( not ( = ?auto_496031 ?auto_496041 ) ) ( not ( = ?auto_496031 ?auto_496042 ) ) ( not ( = ?auto_496031 ?auto_496043 ) ) ( not ( = ?auto_496031 ?auto_496044 ) ) ( not ( = ?auto_496032 ?auto_496033 ) ) ( not ( = ?auto_496032 ?auto_496034 ) ) ( not ( = ?auto_496032 ?auto_496035 ) ) ( not ( = ?auto_496032 ?auto_496036 ) ) ( not ( = ?auto_496032 ?auto_496037 ) ) ( not ( = ?auto_496032 ?auto_496038 ) ) ( not ( = ?auto_496032 ?auto_496039 ) ) ( not ( = ?auto_496032 ?auto_496040 ) ) ( not ( = ?auto_496032 ?auto_496041 ) ) ( not ( = ?auto_496032 ?auto_496042 ) ) ( not ( = ?auto_496032 ?auto_496043 ) ) ( not ( = ?auto_496032 ?auto_496044 ) ) ( not ( = ?auto_496033 ?auto_496034 ) ) ( not ( = ?auto_496033 ?auto_496035 ) ) ( not ( = ?auto_496033 ?auto_496036 ) ) ( not ( = ?auto_496033 ?auto_496037 ) ) ( not ( = ?auto_496033 ?auto_496038 ) ) ( not ( = ?auto_496033 ?auto_496039 ) ) ( not ( = ?auto_496033 ?auto_496040 ) ) ( not ( = ?auto_496033 ?auto_496041 ) ) ( not ( = ?auto_496033 ?auto_496042 ) ) ( not ( = ?auto_496033 ?auto_496043 ) ) ( not ( = ?auto_496033 ?auto_496044 ) ) ( not ( = ?auto_496034 ?auto_496035 ) ) ( not ( = ?auto_496034 ?auto_496036 ) ) ( not ( = ?auto_496034 ?auto_496037 ) ) ( not ( = ?auto_496034 ?auto_496038 ) ) ( not ( = ?auto_496034 ?auto_496039 ) ) ( not ( = ?auto_496034 ?auto_496040 ) ) ( not ( = ?auto_496034 ?auto_496041 ) ) ( not ( = ?auto_496034 ?auto_496042 ) ) ( not ( = ?auto_496034 ?auto_496043 ) ) ( not ( = ?auto_496034 ?auto_496044 ) ) ( not ( = ?auto_496035 ?auto_496036 ) ) ( not ( = ?auto_496035 ?auto_496037 ) ) ( not ( = ?auto_496035 ?auto_496038 ) ) ( not ( = ?auto_496035 ?auto_496039 ) ) ( not ( = ?auto_496035 ?auto_496040 ) ) ( not ( = ?auto_496035 ?auto_496041 ) ) ( not ( = ?auto_496035 ?auto_496042 ) ) ( not ( = ?auto_496035 ?auto_496043 ) ) ( not ( = ?auto_496035 ?auto_496044 ) ) ( not ( = ?auto_496036 ?auto_496037 ) ) ( not ( = ?auto_496036 ?auto_496038 ) ) ( not ( = ?auto_496036 ?auto_496039 ) ) ( not ( = ?auto_496036 ?auto_496040 ) ) ( not ( = ?auto_496036 ?auto_496041 ) ) ( not ( = ?auto_496036 ?auto_496042 ) ) ( not ( = ?auto_496036 ?auto_496043 ) ) ( not ( = ?auto_496036 ?auto_496044 ) ) ( not ( = ?auto_496037 ?auto_496038 ) ) ( not ( = ?auto_496037 ?auto_496039 ) ) ( not ( = ?auto_496037 ?auto_496040 ) ) ( not ( = ?auto_496037 ?auto_496041 ) ) ( not ( = ?auto_496037 ?auto_496042 ) ) ( not ( = ?auto_496037 ?auto_496043 ) ) ( not ( = ?auto_496037 ?auto_496044 ) ) ( not ( = ?auto_496038 ?auto_496039 ) ) ( not ( = ?auto_496038 ?auto_496040 ) ) ( not ( = ?auto_496038 ?auto_496041 ) ) ( not ( = ?auto_496038 ?auto_496042 ) ) ( not ( = ?auto_496038 ?auto_496043 ) ) ( not ( = ?auto_496038 ?auto_496044 ) ) ( not ( = ?auto_496039 ?auto_496040 ) ) ( not ( = ?auto_496039 ?auto_496041 ) ) ( not ( = ?auto_496039 ?auto_496042 ) ) ( not ( = ?auto_496039 ?auto_496043 ) ) ( not ( = ?auto_496039 ?auto_496044 ) ) ( not ( = ?auto_496040 ?auto_496041 ) ) ( not ( = ?auto_496040 ?auto_496042 ) ) ( not ( = ?auto_496040 ?auto_496043 ) ) ( not ( = ?auto_496040 ?auto_496044 ) ) ( not ( = ?auto_496041 ?auto_496042 ) ) ( not ( = ?auto_496041 ?auto_496043 ) ) ( not ( = ?auto_496041 ?auto_496044 ) ) ( not ( = ?auto_496042 ?auto_496043 ) ) ( not ( = ?auto_496042 ?auto_496044 ) ) ( not ( = ?auto_496043 ?auto_496044 ) ) ( ON ?auto_496042 ?auto_496043 ) ( ON ?auto_496041 ?auto_496042 ) ( ON ?auto_496040 ?auto_496041 ) ( ON ?auto_496039 ?auto_496040 ) ( ON ?auto_496038 ?auto_496039 ) ( ON ?auto_496037 ?auto_496038 ) ( ON ?auto_496036 ?auto_496037 ) ( ON ?auto_496035 ?auto_496036 ) ( ON ?auto_496034 ?auto_496035 ) ( ON ?auto_496033 ?auto_496034 ) ( ON ?auto_496032 ?auto_496033 ) ( CLEAR ?auto_496030 ) ( ON ?auto_496031 ?auto_496032 ) ( CLEAR ?auto_496031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_496028 ?auto_496029 ?auto_496030 ?auto_496031 )
      ( MAKE-16PILE ?auto_496028 ?auto_496029 ?auto_496030 ?auto_496031 ?auto_496032 ?auto_496033 ?auto_496034 ?auto_496035 ?auto_496036 ?auto_496037 ?auto_496038 ?auto_496039 ?auto_496040 ?auto_496041 ?auto_496042 ?auto_496043 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_496061 - BLOCK
      ?auto_496062 - BLOCK
      ?auto_496063 - BLOCK
      ?auto_496064 - BLOCK
      ?auto_496065 - BLOCK
      ?auto_496066 - BLOCK
      ?auto_496067 - BLOCK
      ?auto_496068 - BLOCK
      ?auto_496069 - BLOCK
      ?auto_496070 - BLOCK
      ?auto_496071 - BLOCK
      ?auto_496072 - BLOCK
      ?auto_496073 - BLOCK
      ?auto_496074 - BLOCK
      ?auto_496075 - BLOCK
      ?auto_496076 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_496076 ) ( ON-TABLE ?auto_496061 ) ( ON ?auto_496062 ?auto_496061 ) ( ON ?auto_496063 ?auto_496062 ) ( not ( = ?auto_496061 ?auto_496062 ) ) ( not ( = ?auto_496061 ?auto_496063 ) ) ( not ( = ?auto_496061 ?auto_496064 ) ) ( not ( = ?auto_496061 ?auto_496065 ) ) ( not ( = ?auto_496061 ?auto_496066 ) ) ( not ( = ?auto_496061 ?auto_496067 ) ) ( not ( = ?auto_496061 ?auto_496068 ) ) ( not ( = ?auto_496061 ?auto_496069 ) ) ( not ( = ?auto_496061 ?auto_496070 ) ) ( not ( = ?auto_496061 ?auto_496071 ) ) ( not ( = ?auto_496061 ?auto_496072 ) ) ( not ( = ?auto_496061 ?auto_496073 ) ) ( not ( = ?auto_496061 ?auto_496074 ) ) ( not ( = ?auto_496061 ?auto_496075 ) ) ( not ( = ?auto_496061 ?auto_496076 ) ) ( not ( = ?auto_496062 ?auto_496063 ) ) ( not ( = ?auto_496062 ?auto_496064 ) ) ( not ( = ?auto_496062 ?auto_496065 ) ) ( not ( = ?auto_496062 ?auto_496066 ) ) ( not ( = ?auto_496062 ?auto_496067 ) ) ( not ( = ?auto_496062 ?auto_496068 ) ) ( not ( = ?auto_496062 ?auto_496069 ) ) ( not ( = ?auto_496062 ?auto_496070 ) ) ( not ( = ?auto_496062 ?auto_496071 ) ) ( not ( = ?auto_496062 ?auto_496072 ) ) ( not ( = ?auto_496062 ?auto_496073 ) ) ( not ( = ?auto_496062 ?auto_496074 ) ) ( not ( = ?auto_496062 ?auto_496075 ) ) ( not ( = ?auto_496062 ?auto_496076 ) ) ( not ( = ?auto_496063 ?auto_496064 ) ) ( not ( = ?auto_496063 ?auto_496065 ) ) ( not ( = ?auto_496063 ?auto_496066 ) ) ( not ( = ?auto_496063 ?auto_496067 ) ) ( not ( = ?auto_496063 ?auto_496068 ) ) ( not ( = ?auto_496063 ?auto_496069 ) ) ( not ( = ?auto_496063 ?auto_496070 ) ) ( not ( = ?auto_496063 ?auto_496071 ) ) ( not ( = ?auto_496063 ?auto_496072 ) ) ( not ( = ?auto_496063 ?auto_496073 ) ) ( not ( = ?auto_496063 ?auto_496074 ) ) ( not ( = ?auto_496063 ?auto_496075 ) ) ( not ( = ?auto_496063 ?auto_496076 ) ) ( not ( = ?auto_496064 ?auto_496065 ) ) ( not ( = ?auto_496064 ?auto_496066 ) ) ( not ( = ?auto_496064 ?auto_496067 ) ) ( not ( = ?auto_496064 ?auto_496068 ) ) ( not ( = ?auto_496064 ?auto_496069 ) ) ( not ( = ?auto_496064 ?auto_496070 ) ) ( not ( = ?auto_496064 ?auto_496071 ) ) ( not ( = ?auto_496064 ?auto_496072 ) ) ( not ( = ?auto_496064 ?auto_496073 ) ) ( not ( = ?auto_496064 ?auto_496074 ) ) ( not ( = ?auto_496064 ?auto_496075 ) ) ( not ( = ?auto_496064 ?auto_496076 ) ) ( not ( = ?auto_496065 ?auto_496066 ) ) ( not ( = ?auto_496065 ?auto_496067 ) ) ( not ( = ?auto_496065 ?auto_496068 ) ) ( not ( = ?auto_496065 ?auto_496069 ) ) ( not ( = ?auto_496065 ?auto_496070 ) ) ( not ( = ?auto_496065 ?auto_496071 ) ) ( not ( = ?auto_496065 ?auto_496072 ) ) ( not ( = ?auto_496065 ?auto_496073 ) ) ( not ( = ?auto_496065 ?auto_496074 ) ) ( not ( = ?auto_496065 ?auto_496075 ) ) ( not ( = ?auto_496065 ?auto_496076 ) ) ( not ( = ?auto_496066 ?auto_496067 ) ) ( not ( = ?auto_496066 ?auto_496068 ) ) ( not ( = ?auto_496066 ?auto_496069 ) ) ( not ( = ?auto_496066 ?auto_496070 ) ) ( not ( = ?auto_496066 ?auto_496071 ) ) ( not ( = ?auto_496066 ?auto_496072 ) ) ( not ( = ?auto_496066 ?auto_496073 ) ) ( not ( = ?auto_496066 ?auto_496074 ) ) ( not ( = ?auto_496066 ?auto_496075 ) ) ( not ( = ?auto_496066 ?auto_496076 ) ) ( not ( = ?auto_496067 ?auto_496068 ) ) ( not ( = ?auto_496067 ?auto_496069 ) ) ( not ( = ?auto_496067 ?auto_496070 ) ) ( not ( = ?auto_496067 ?auto_496071 ) ) ( not ( = ?auto_496067 ?auto_496072 ) ) ( not ( = ?auto_496067 ?auto_496073 ) ) ( not ( = ?auto_496067 ?auto_496074 ) ) ( not ( = ?auto_496067 ?auto_496075 ) ) ( not ( = ?auto_496067 ?auto_496076 ) ) ( not ( = ?auto_496068 ?auto_496069 ) ) ( not ( = ?auto_496068 ?auto_496070 ) ) ( not ( = ?auto_496068 ?auto_496071 ) ) ( not ( = ?auto_496068 ?auto_496072 ) ) ( not ( = ?auto_496068 ?auto_496073 ) ) ( not ( = ?auto_496068 ?auto_496074 ) ) ( not ( = ?auto_496068 ?auto_496075 ) ) ( not ( = ?auto_496068 ?auto_496076 ) ) ( not ( = ?auto_496069 ?auto_496070 ) ) ( not ( = ?auto_496069 ?auto_496071 ) ) ( not ( = ?auto_496069 ?auto_496072 ) ) ( not ( = ?auto_496069 ?auto_496073 ) ) ( not ( = ?auto_496069 ?auto_496074 ) ) ( not ( = ?auto_496069 ?auto_496075 ) ) ( not ( = ?auto_496069 ?auto_496076 ) ) ( not ( = ?auto_496070 ?auto_496071 ) ) ( not ( = ?auto_496070 ?auto_496072 ) ) ( not ( = ?auto_496070 ?auto_496073 ) ) ( not ( = ?auto_496070 ?auto_496074 ) ) ( not ( = ?auto_496070 ?auto_496075 ) ) ( not ( = ?auto_496070 ?auto_496076 ) ) ( not ( = ?auto_496071 ?auto_496072 ) ) ( not ( = ?auto_496071 ?auto_496073 ) ) ( not ( = ?auto_496071 ?auto_496074 ) ) ( not ( = ?auto_496071 ?auto_496075 ) ) ( not ( = ?auto_496071 ?auto_496076 ) ) ( not ( = ?auto_496072 ?auto_496073 ) ) ( not ( = ?auto_496072 ?auto_496074 ) ) ( not ( = ?auto_496072 ?auto_496075 ) ) ( not ( = ?auto_496072 ?auto_496076 ) ) ( not ( = ?auto_496073 ?auto_496074 ) ) ( not ( = ?auto_496073 ?auto_496075 ) ) ( not ( = ?auto_496073 ?auto_496076 ) ) ( not ( = ?auto_496074 ?auto_496075 ) ) ( not ( = ?auto_496074 ?auto_496076 ) ) ( not ( = ?auto_496075 ?auto_496076 ) ) ( ON ?auto_496075 ?auto_496076 ) ( ON ?auto_496074 ?auto_496075 ) ( ON ?auto_496073 ?auto_496074 ) ( ON ?auto_496072 ?auto_496073 ) ( ON ?auto_496071 ?auto_496072 ) ( ON ?auto_496070 ?auto_496071 ) ( ON ?auto_496069 ?auto_496070 ) ( ON ?auto_496068 ?auto_496069 ) ( ON ?auto_496067 ?auto_496068 ) ( ON ?auto_496066 ?auto_496067 ) ( ON ?auto_496065 ?auto_496066 ) ( CLEAR ?auto_496063 ) ( ON ?auto_496064 ?auto_496065 ) ( CLEAR ?auto_496064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_496061 ?auto_496062 ?auto_496063 ?auto_496064 )
      ( MAKE-16PILE ?auto_496061 ?auto_496062 ?auto_496063 ?auto_496064 ?auto_496065 ?auto_496066 ?auto_496067 ?auto_496068 ?auto_496069 ?auto_496070 ?auto_496071 ?auto_496072 ?auto_496073 ?auto_496074 ?auto_496075 ?auto_496076 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_496093 - BLOCK
      ?auto_496094 - BLOCK
      ?auto_496095 - BLOCK
      ?auto_496096 - BLOCK
      ?auto_496097 - BLOCK
      ?auto_496098 - BLOCK
      ?auto_496099 - BLOCK
      ?auto_496100 - BLOCK
      ?auto_496101 - BLOCK
      ?auto_496102 - BLOCK
      ?auto_496103 - BLOCK
      ?auto_496104 - BLOCK
      ?auto_496105 - BLOCK
      ?auto_496106 - BLOCK
      ?auto_496107 - BLOCK
      ?auto_496108 - BLOCK
    )
    :vars
    (
      ?auto_496109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496108 ?auto_496109 ) ( ON-TABLE ?auto_496093 ) ( ON ?auto_496094 ?auto_496093 ) ( not ( = ?auto_496093 ?auto_496094 ) ) ( not ( = ?auto_496093 ?auto_496095 ) ) ( not ( = ?auto_496093 ?auto_496096 ) ) ( not ( = ?auto_496093 ?auto_496097 ) ) ( not ( = ?auto_496093 ?auto_496098 ) ) ( not ( = ?auto_496093 ?auto_496099 ) ) ( not ( = ?auto_496093 ?auto_496100 ) ) ( not ( = ?auto_496093 ?auto_496101 ) ) ( not ( = ?auto_496093 ?auto_496102 ) ) ( not ( = ?auto_496093 ?auto_496103 ) ) ( not ( = ?auto_496093 ?auto_496104 ) ) ( not ( = ?auto_496093 ?auto_496105 ) ) ( not ( = ?auto_496093 ?auto_496106 ) ) ( not ( = ?auto_496093 ?auto_496107 ) ) ( not ( = ?auto_496093 ?auto_496108 ) ) ( not ( = ?auto_496093 ?auto_496109 ) ) ( not ( = ?auto_496094 ?auto_496095 ) ) ( not ( = ?auto_496094 ?auto_496096 ) ) ( not ( = ?auto_496094 ?auto_496097 ) ) ( not ( = ?auto_496094 ?auto_496098 ) ) ( not ( = ?auto_496094 ?auto_496099 ) ) ( not ( = ?auto_496094 ?auto_496100 ) ) ( not ( = ?auto_496094 ?auto_496101 ) ) ( not ( = ?auto_496094 ?auto_496102 ) ) ( not ( = ?auto_496094 ?auto_496103 ) ) ( not ( = ?auto_496094 ?auto_496104 ) ) ( not ( = ?auto_496094 ?auto_496105 ) ) ( not ( = ?auto_496094 ?auto_496106 ) ) ( not ( = ?auto_496094 ?auto_496107 ) ) ( not ( = ?auto_496094 ?auto_496108 ) ) ( not ( = ?auto_496094 ?auto_496109 ) ) ( not ( = ?auto_496095 ?auto_496096 ) ) ( not ( = ?auto_496095 ?auto_496097 ) ) ( not ( = ?auto_496095 ?auto_496098 ) ) ( not ( = ?auto_496095 ?auto_496099 ) ) ( not ( = ?auto_496095 ?auto_496100 ) ) ( not ( = ?auto_496095 ?auto_496101 ) ) ( not ( = ?auto_496095 ?auto_496102 ) ) ( not ( = ?auto_496095 ?auto_496103 ) ) ( not ( = ?auto_496095 ?auto_496104 ) ) ( not ( = ?auto_496095 ?auto_496105 ) ) ( not ( = ?auto_496095 ?auto_496106 ) ) ( not ( = ?auto_496095 ?auto_496107 ) ) ( not ( = ?auto_496095 ?auto_496108 ) ) ( not ( = ?auto_496095 ?auto_496109 ) ) ( not ( = ?auto_496096 ?auto_496097 ) ) ( not ( = ?auto_496096 ?auto_496098 ) ) ( not ( = ?auto_496096 ?auto_496099 ) ) ( not ( = ?auto_496096 ?auto_496100 ) ) ( not ( = ?auto_496096 ?auto_496101 ) ) ( not ( = ?auto_496096 ?auto_496102 ) ) ( not ( = ?auto_496096 ?auto_496103 ) ) ( not ( = ?auto_496096 ?auto_496104 ) ) ( not ( = ?auto_496096 ?auto_496105 ) ) ( not ( = ?auto_496096 ?auto_496106 ) ) ( not ( = ?auto_496096 ?auto_496107 ) ) ( not ( = ?auto_496096 ?auto_496108 ) ) ( not ( = ?auto_496096 ?auto_496109 ) ) ( not ( = ?auto_496097 ?auto_496098 ) ) ( not ( = ?auto_496097 ?auto_496099 ) ) ( not ( = ?auto_496097 ?auto_496100 ) ) ( not ( = ?auto_496097 ?auto_496101 ) ) ( not ( = ?auto_496097 ?auto_496102 ) ) ( not ( = ?auto_496097 ?auto_496103 ) ) ( not ( = ?auto_496097 ?auto_496104 ) ) ( not ( = ?auto_496097 ?auto_496105 ) ) ( not ( = ?auto_496097 ?auto_496106 ) ) ( not ( = ?auto_496097 ?auto_496107 ) ) ( not ( = ?auto_496097 ?auto_496108 ) ) ( not ( = ?auto_496097 ?auto_496109 ) ) ( not ( = ?auto_496098 ?auto_496099 ) ) ( not ( = ?auto_496098 ?auto_496100 ) ) ( not ( = ?auto_496098 ?auto_496101 ) ) ( not ( = ?auto_496098 ?auto_496102 ) ) ( not ( = ?auto_496098 ?auto_496103 ) ) ( not ( = ?auto_496098 ?auto_496104 ) ) ( not ( = ?auto_496098 ?auto_496105 ) ) ( not ( = ?auto_496098 ?auto_496106 ) ) ( not ( = ?auto_496098 ?auto_496107 ) ) ( not ( = ?auto_496098 ?auto_496108 ) ) ( not ( = ?auto_496098 ?auto_496109 ) ) ( not ( = ?auto_496099 ?auto_496100 ) ) ( not ( = ?auto_496099 ?auto_496101 ) ) ( not ( = ?auto_496099 ?auto_496102 ) ) ( not ( = ?auto_496099 ?auto_496103 ) ) ( not ( = ?auto_496099 ?auto_496104 ) ) ( not ( = ?auto_496099 ?auto_496105 ) ) ( not ( = ?auto_496099 ?auto_496106 ) ) ( not ( = ?auto_496099 ?auto_496107 ) ) ( not ( = ?auto_496099 ?auto_496108 ) ) ( not ( = ?auto_496099 ?auto_496109 ) ) ( not ( = ?auto_496100 ?auto_496101 ) ) ( not ( = ?auto_496100 ?auto_496102 ) ) ( not ( = ?auto_496100 ?auto_496103 ) ) ( not ( = ?auto_496100 ?auto_496104 ) ) ( not ( = ?auto_496100 ?auto_496105 ) ) ( not ( = ?auto_496100 ?auto_496106 ) ) ( not ( = ?auto_496100 ?auto_496107 ) ) ( not ( = ?auto_496100 ?auto_496108 ) ) ( not ( = ?auto_496100 ?auto_496109 ) ) ( not ( = ?auto_496101 ?auto_496102 ) ) ( not ( = ?auto_496101 ?auto_496103 ) ) ( not ( = ?auto_496101 ?auto_496104 ) ) ( not ( = ?auto_496101 ?auto_496105 ) ) ( not ( = ?auto_496101 ?auto_496106 ) ) ( not ( = ?auto_496101 ?auto_496107 ) ) ( not ( = ?auto_496101 ?auto_496108 ) ) ( not ( = ?auto_496101 ?auto_496109 ) ) ( not ( = ?auto_496102 ?auto_496103 ) ) ( not ( = ?auto_496102 ?auto_496104 ) ) ( not ( = ?auto_496102 ?auto_496105 ) ) ( not ( = ?auto_496102 ?auto_496106 ) ) ( not ( = ?auto_496102 ?auto_496107 ) ) ( not ( = ?auto_496102 ?auto_496108 ) ) ( not ( = ?auto_496102 ?auto_496109 ) ) ( not ( = ?auto_496103 ?auto_496104 ) ) ( not ( = ?auto_496103 ?auto_496105 ) ) ( not ( = ?auto_496103 ?auto_496106 ) ) ( not ( = ?auto_496103 ?auto_496107 ) ) ( not ( = ?auto_496103 ?auto_496108 ) ) ( not ( = ?auto_496103 ?auto_496109 ) ) ( not ( = ?auto_496104 ?auto_496105 ) ) ( not ( = ?auto_496104 ?auto_496106 ) ) ( not ( = ?auto_496104 ?auto_496107 ) ) ( not ( = ?auto_496104 ?auto_496108 ) ) ( not ( = ?auto_496104 ?auto_496109 ) ) ( not ( = ?auto_496105 ?auto_496106 ) ) ( not ( = ?auto_496105 ?auto_496107 ) ) ( not ( = ?auto_496105 ?auto_496108 ) ) ( not ( = ?auto_496105 ?auto_496109 ) ) ( not ( = ?auto_496106 ?auto_496107 ) ) ( not ( = ?auto_496106 ?auto_496108 ) ) ( not ( = ?auto_496106 ?auto_496109 ) ) ( not ( = ?auto_496107 ?auto_496108 ) ) ( not ( = ?auto_496107 ?auto_496109 ) ) ( not ( = ?auto_496108 ?auto_496109 ) ) ( ON ?auto_496107 ?auto_496108 ) ( ON ?auto_496106 ?auto_496107 ) ( ON ?auto_496105 ?auto_496106 ) ( ON ?auto_496104 ?auto_496105 ) ( ON ?auto_496103 ?auto_496104 ) ( ON ?auto_496102 ?auto_496103 ) ( ON ?auto_496101 ?auto_496102 ) ( ON ?auto_496100 ?auto_496101 ) ( ON ?auto_496099 ?auto_496100 ) ( ON ?auto_496098 ?auto_496099 ) ( ON ?auto_496097 ?auto_496098 ) ( ON ?auto_496096 ?auto_496097 ) ( CLEAR ?auto_496094 ) ( ON ?auto_496095 ?auto_496096 ) ( CLEAR ?auto_496095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_496093 ?auto_496094 ?auto_496095 )
      ( MAKE-16PILE ?auto_496093 ?auto_496094 ?auto_496095 ?auto_496096 ?auto_496097 ?auto_496098 ?auto_496099 ?auto_496100 ?auto_496101 ?auto_496102 ?auto_496103 ?auto_496104 ?auto_496105 ?auto_496106 ?auto_496107 ?auto_496108 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_496126 - BLOCK
      ?auto_496127 - BLOCK
      ?auto_496128 - BLOCK
      ?auto_496129 - BLOCK
      ?auto_496130 - BLOCK
      ?auto_496131 - BLOCK
      ?auto_496132 - BLOCK
      ?auto_496133 - BLOCK
      ?auto_496134 - BLOCK
      ?auto_496135 - BLOCK
      ?auto_496136 - BLOCK
      ?auto_496137 - BLOCK
      ?auto_496138 - BLOCK
      ?auto_496139 - BLOCK
      ?auto_496140 - BLOCK
      ?auto_496141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_496141 ) ( ON-TABLE ?auto_496126 ) ( ON ?auto_496127 ?auto_496126 ) ( not ( = ?auto_496126 ?auto_496127 ) ) ( not ( = ?auto_496126 ?auto_496128 ) ) ( not ( = ?auto_496126 ?auto_496129 ) ) ( not ( = ?auto_496126 ?auto_496130 ) ) ( not ( = ?auto_496126 ?auto_496131 ) ) ( not ( = ?auto_496126 ?auto_496132 ) ) ( not ( = ?auto_496126 ?auto_496133 ) ) ( not ( = ?auto_496126 ?auto_496134 ) ) ( not ( = ?auto_496126 ?auto_496135 ) ) ( not ( = ?auto_496126 ?auto_496136 ) ) ( not ( = ?auto_496126 ?auto_496137 ) ) ( not ( = ?auto_496126 ?auto_496138 ) ) ( not ( = ?auto_496126 ?auto_496139 ) ) ( not ( = ?auto_496126 ?auto_496140 ) ) ( not ( = ?auto_496126 ?auto_496141 ) ) ( not ( = ?auto_496127 ?auto_496128 ) ) ( not ( = ?auto_496127 ?auto_496129 ) ) ( not ( = ?auto_496127 ?auto_496130 ) ) ( not ( = ?auto_496127 ?auto_496131 ) ) ( not ( = ?auto_496127 ?auto_496132 ) ) ( not ( = ?auto_496127 ?auto_496133 ) ) ( not ( = ?auto_496127 ?auto_496134 ) ) ( not ( = ?auto_496127 ?auto_496135 ) ) ( not ( = ?auto_496127 ?auto_496136 ) ) ( not ( = ?auto_496127 ?auto_496137 ) ) ( not ( = ?auto_496127 ?auto_496138 ) ) ( not ( = ?auto_496127 ?auto_496139 ) ) ( not ( = ?auto_496127 ?auto_496140 ) ) ( not ( = ?auto_496127 ?auto_496141 ) ) ( not ( = ?auto_496128 ?auto_496129 ) ) ( not ( = ?auto_496128 ?auto_496130 ) ) ( not ( = ?auto_496128 ?auto_496131 ) ) ( not ( = ?auto_496128 ?auto_496132 ) ) ( not ( = ?auto_496128 ?auto_496133 ) ) ( not ( = ?auto_496128 ?auto_496134 ) ) ( not ( = ?auto_496128 ?auto_496135 ) ) ( not ( = ?auto_496128 ?auto_496136 ) ) ( not ( = ?auto_496128 ?auto_496137 ) ) ( not ( = ?auto_496128 ?auto_496138 ) ) ( not ( = ?auto_496128 ?auto_496139 ) ) ( not ( = ?auto_496128 ?auto_496140 ) ) ( not ( = ?auto_496128 ?auto_496141 ) ) ( not ( = ?auto_496129 ?auto_496130 ) ) ( not ( = ?auto_496129 ?auto_496131 ) ) ( not ( = ?auto_496129 ?auto_496132 ) ) ( not ( = ?auto_496129 ?auto_496133 ) ) ( not ( = ?auto_496129 ?auto_496134 ) ) ( not ( = ?auto_496129 ?auto_496135 ) ) ( not ( = ?auto_496129 ?auto_496136 ) ) ( not ( = ?auto_496129 ?auto_496137 ) ) ( not ( = ?auto_496129 ?auto_496138 ) ) ( not ( = ?auto_496129 ?auto_496139 ) ) ( not ( = ?auto_496129 ?auto_496140 ) ) ( not ( = ?auto_496129 ?auto_496141 ) ) ( not ( = ?auto_496130 ?auto_496131 ) ) ( not ( = ?auto_496130 ?auto_496132 ) ) ( not ( = ?auto_496130 ?auto_496133 ) ) ( not ( = ?auto_496130 ?auto_496134 ) ) ( not ( = ?auto_496130 ?auto_496135 ) ) ( not ( = ?auto_496130 ?auto_496136 ) ) ( not ( = ?auto_496130 ?auto_496137 ) ) ( not ( = ?auto_496130 ?auto_496138 ) ) ( not ( = ?auto_496130 ?auto_496139 ) ) ( not ( = ?auto_496130 ?auto_496140 ) ) ( not ( = ?auto_496130 ?auto_496141 ) ) ( not ( = ?auto_496131 ?auto_496132 ) ) ( not ( = ?auto_496131 ?auto_496133 ) ) ( not ( = ?auto_496131 ?auto_496134 ) ) ( not ( = ?auto_496131 ?auto_496135 ) ) ( not ( = ?auto_496131 ?auto_496136 ) ) ( not ( = ?auto_496131 ?auto_496137 ) ) ( not ( = ?auto_496131 ?auto_496138 ) ) ( not ( = ?auto_496131 ?auto_496139 ) ) ( not ( = ?auto_496131 ?auto_496140 ) ) ( not ( = ?auto_496131 ?auto_496141 ) ) ( not ( = ?auto_496132 ?auto_496133 ) ) ( not ( = ?auto_496132 ?auto_496134 ) ) ( not ( = ?auto_496132 ?auto_496135 ) ) ( not ( = ?auto_496132 ?auto_496136 ) ) ( not ( = ?auto_496132 ?auto_496137 ) ) ( not ( = ?auto_496132 ?auto_496138 ) ) ( not ( = ?auto_496132 ?auto_496139 ) ) ( not ( = ?auto_496132 ?auto_496140 ) ) ( not ( = ?auto_496132 ?auto_496141 ) ) ( not ( = ?auto_496133 ?auto_496134 ) ) ( not ( = ?auto_496133 ?auto_496135 ) ) ( not ( = ?auto_496133 ?auto_496136 ) ) ( not ( = ?auto_496133 ?auto_496137 ) ) ( not ( = ?auto_496133 ?auto_496138 ) ) ( not ( = ?auto_496133 ?auto_496139 ) ) ( not ( = ?auto_496133 ?auto_496140 ) ) ( not ( = ?auto_496133 ?auto_496141 ) ) ( not ( = ?auto_496134 ?auto_496135 ) ) ( not ( = ?auto_496134 ?auto_496136 ) ) ( not ( = ?auto_496134 ?auto_496137 ) ) ( not ( = ?auto_496134 ?auto_496138 ) ) ( not ( = ?auto_496134 ?auto_496139 ) ) ( not ( = ?auto_496134 ?auto_496140 ) ) ( not ( = ?auto_496134 ?auto_496141 ) ) ( not ( = ?auto_496135 ?auto_496136 ) ) ( not ( = ?auto_496135 ?auto_496137 ) ) ( not ( = ?auto_496135 ?auto_496138 ) ) ( not ( = ?auto_496135 ?auto_496139 ) ) ( not ( = ?auto_496135 ?auto_496140 ) ) ( not ( = ?auto_496135 ?auto_496141 ) ) ( not ( = ?auto_496136 ?auto_496137 ) ) ( not ( = ?auto_496136 ?auto_496138 ) ) ( not ( = ?auto_496136 ?auto_496139 ) ) ( not ( = ?auto_496136 ?auto_496140 ) ) ( not ( = ?auto_496136 ?auto_496141 ) ) ( not ( = ?auto_496137 ?auto_496138 ) ) ( not ( = ?auto_496137 ?auto_496139 ) ) ( not ( = ?auto_496137 ?auto_496140 ) ) ( not ( = ?auto_496137 ?auto_496141 ) ) ( not ( = ?auto_496138 ?auto_496139 ) ) ( not ( = ?auto_496138 ?auto_496140 ) ) ( not ( = ?auto_496138 ?auto_496141 ) ) ( not ( = ?auto_496139 ?auto_496140 ) ) ( not ( = ?auto_496139 ?auto_496141 ) ) ( not ( = ?auto_496140 ?auto_496141 ) ) ( ON ?auto_496140 ?auto_496141 ) ( ON ?auto_496139 ?auto_496140 ) ( ON ?auto_496138 ?auto_496139 ) ( ON ?auto_496137 ?auto_496138 ) ( ON ?auto_496136 ?auto_496137 ) ( ON ?auto_496135 ?auto_496136 ) ( ON ?auto_496134 ?auto_496135 ) ( ON ?auto_496133 ?auto_496134 ) ( ON ?auto_496132 ?auto_496133 ) ( ON ?auto_496131 ?auto_496132 ) ( ON ?auto_496130 ?auto_496131 ) ( ON ?auto_496129 ?auto_496130 ) ( CLEAR ?auto_496127 ) ( ON ?auto_496128 ?auto_496129 ) ( CLEAR ?auto_496128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_496126 ?auto_496127 ?auto_496128 )
      ( MAKE-16PILE ?auto_496126 ?auto_496127 ?auto_496128 ?auto_496129 ?auto_496130 ?auto_496131 ?auto_496132 ?auto_496133 ?auto_496134 ?auto_496135 ?auto_496136 ?auto_496137 ?auto_496138 ?auto_496139 ?auto_496140 ?auto_496141 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_496158 - BLOCK
      ?auto_496159 - BLOCK
      ?auto_496160 - BLOCK
      ?auto_496161 - BLOCK
      ?auto_496162 - BLOCK
      ?auto_496163 - BLOCK
      ?auto_496164 - BLOCK
      ?auto_496165 - BLOCK
      ?auto_496166 - BLOCK
      ?auto_496167 - BLOCK
      ?auto_496168 - BLOCK
      ?auto_496169 - BLOCK
      ?auto_496170 - BLOCK
      ?auto_496171 - BLOCK
      ?auto_496172 - BLOCK
      ?auto_496173 - BLOCK
    )
    :vars
    (
      ?auto_496174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496173 ?auto_496174 ) ( ON-TABLE ?auto_496158 ) ( not ( = ?auto_496158 ?auto_496159 ) ) ( not ( = ?auto_496158 ?auto_496160 ) ) ( not ( = ?auto_496158 ?auto_496161 ) ) ( not ( = ?auto_496158 ?auto_496162 ) ) ( not ( = ?auto_496158 ?auto_496163 ) ) ( not ( = ?auto_496158 ?auto_496164 ) ) ( not ( = ?auto_496158 ?auto_496165 ) ) ( not ( = ?auto_496158 ?auto_496166 ) ) ( not ( = ?auto_496158 ?auto_496167 ) ) ( not ( = ?auto_496158 ?auto_496168 ) ) ( not ( = ?auto_496158 ?auto_496169 ) ) ( not ( = ?auto_496158 ?auto_496170 ) ) ( not ( = ?auto_496158 ?auto_496171 ) ) ( not ( = ?auto_496158 ?auto_496172 ) ) ( not ( = ?auto_496158 ?auto_496173 ) ) ( not ( = ?auto_496158 ?auto_496174 ) ) ( not ( = ?auto_496159 ?auto_496160 ) ) ( not ( = ?auto_496159 ?auto_496161 ) ) ( not ( = ?auto_496159 ?auto_496162 ) ) ( not ( = ?auto_496159 ?auto_496163 ) ) ( not ( = ?auto_496159 ?auto_496164 ) ) ( not ( = ?auto_496159 ?auto_496165 ) ) ( not ( = ?auto_496159 ?auto_496166 ) ) ( not ( = ?auto_496159 ?auto_496167 ) ) ( not ( = ?auto_496159 ?auto_496168 ) ) ( not ( = ?auto_496159 ?auto_496169 ) ) ( not ( = ?auto_496159 ?auto_496170 ) ) ( not ( = ?auto_496159 ?auto_496171 ) ) ( not ( = ?auto_496159 ?auto_496172 ) ) ( not ( = ?auto_496159 ?auto_496173 ) ) ( not ( = ?auto_496159 ?auto_496174 ) ) ( not ( = ?auto_496160 ?auto_496161 ) ) ( not ( = ?auto_496160 ?auto_496162 ) ) ( not ( = ?auto_496160 ?auto_496163 ) ) ( not ( = ?auto_496160 ?auto_496164 ) ) ( not ( = ?auto_496160 ?auto_496165 ) ) ( not ( = ?auto_496160 ?auto_496166 ) ) ( not ( = ?auto_496160 ?auto_496167 ) ) ( not ( = ?auto_496160 ?auto_496168 ) ) ( not ( = ?auto_496160 ?auto_496169 ) ) ( not ( = ?auto_496160 ?auto_496170 ) ) ( not ( = ?auto_496160 ?auto_496171 ) ) ( not ( = ?auto_496160 ?auto_496172 ) ) ( not ( = ?auto_496160 ?auto_496173 ) ) ( not ( = ?auto_496160 ?auto_496174 ) ) ( not ( = ?auto_496161 ?auto_496162 ) ) ( not ( = ?auto_496161 ?auto_496163 ) ) ( not ( = ?auto_496161 ?auto_496164 ) ) ( not ( = ?auto_496161 ?auto_496165 ) ) ( not ( = ?auto_496161 ?auto_496166 ) ) ( not ( = ?auto_496161 ?auto_496167 ) ) ( not ( = ?auto_496161 ?auto_496168 ) ) ( not ( = ?auto_496161 ?auto_496169 ) ) ( not ( = ?auto_496161 ?auto_496170 ) ) ( not ( = ?auto_496161 ?auto_496171 ) ) ( not ( = ?auto_496161 ?auto_496172 ) ) ( not ( = ?auto_496161 ?auto_496173 ) ) ( not ( = ?auto_496161 ?auto_496174 ) ) ( not ( = ?auto_496162 ?auto_496163 ) ) ( not ( = ?auto_496162 ?auto_496164 ) ) ( not ( = ?auto_496162 ?auto_496165 ) ) ( not ( = ?auto_496162 ?auto_496166 ) ) ( not ( = ?auto_496162 ?auto_496167 ) ) ( not ( = ?auto_496162 ?auto_496168 ) ) ( not ( = ?auto_496162 ?auto_496169 ) ) ( not ( = ?auto_496162 ?auto_496170 ) ) ( not ( = ?auto_496162 ?auto_496171 ) ) ( not ( = ?auto_496162 ?auto_496172 ) ) ( not ( = ?auto_496162 ?auto_496173 ) ) ( not ( = ?auto_496162 ?auto_496174 ) ) ( not ( = ?auto_496163 ?auto_496164 ) ) ( not ( = ?auto_496163 ?auto_496165 ) ) ( not ( = ?auto_496163 ?auto_496166 ) ) ( not ( = ?auto_496163 ?auto_496167 ) ) ( not ( = ?auto_496163 ?auto_496168 ) ) ( not ( = ?auto_496163 ?auto_496169 ) ) ( not ( = ?auto_496163 ?auto_496170 ) ) ( not ( = ?auto_496163 ?auto_496171 ) ) ( not ( = ?auto_496163 ?auto_496172 ) ) ( not ( = ?auto_496163 ?auto_496173 ) ) ( not ( = ?auto_496163 ?auto_496174 ) ) ( not ( = ?auto_496164 ?auto_496165 ) ) ( not ( = ?auto_496164 ?auto_496166 ) ) ( not ( = ?auto_496164 ?auto_496167 ) ) ( not ( = ?auto_496164 ?auto_496168 ) ) ( not ( = ?auto_496164 ?auto_496169 ) ) ( not ( = ?auto_496164 ?auto_496170 ) ) ( not ( = ?auto_496164 ?auto_496171 ) ) ( not ( = ?auto_496164 ?auto_496172 ) ) ( not ( = ?auto_496164 ?auto_496173 ) ) ( not ( = ?auto_496164 ?auto_496174 ) ) ( not ( = ?auto_496165 ?auto_496166 ) ) ( not ( = ?auto_496165 ?auto_496167 ) ) ( not ( = ?auto_496165 ?auto_496168 ) ) ( not ( = ?auto_496165 ?auto_496169 ) ) ( not ( = ?auto_496165 ?auto_496170 ) ) ( not ( = ?auto_496165 ?auto_496171 ) ) ( not ( = ?auto_496165 ?auto_496172 ) ) ( not ( = ?auto_496165 ?auto_496173 ) ) ( not ( = ?auto_496165 ?auto_496174 ) ) ( not ( = ?auto_496166 ?auto_496167 ) ) ( not ( = ?auto_496166 ?auto_496168 ) ) ( not ( = ?auto_496166 ?auto_496169 ) ) ( not ( = ?auto_496166 ?auto_496170 ) ) ( not ( = ?auto_496166 ?auto_496171 ) ) ( not ( = ?auto_496166 ?auto_496172 ) ) ( not ( = ?auto_496166 ?auto_496173 ) ) ( not ( = ?auto_496166 ?auto_496174 ) ) ( not ( = ?auto_496167 ?auto_496168 ) ) ( not ( = ?auto_496167 ?auto_496169 ) ) ( not ( = ?auto_496167 ?auto_496170 ) ) ( not ( = ?auto_496167 ?auto_496171 ) ) ( not ( = ?auto_496167 ?auto_496172 ) ) ( not ( = ?auto_496167 ?auto_496173 ) ) ( not ( = ?auto_496167 ?auto_496174 ) ) ( not ( = ?auto_496168 ?auto_496169 ) ) ( not ( = ?auto_496168 ?auto_496170 ) ) ( not ( = ?auto_496168 ?auto_496171 ) ) ( not ( = ?auto_496168 ?auto_496172 ) ) ( not ( = ?auto_496168 ?auto_496173 ) ) ( not ( = ?auto_496168 ?auto_496174 ) ) ( not ( = ?auto_496169 ?auto_496170 ) ) ( not ( = ?auto_496169 ?auto_496171 ) ) ( not ( = ?auto_496169 ?auto_496172 ) ) ( not ( = ?auto_496169 ?auto_496173 ) ) ( not ( = ?auto_496169 ?auto_496174 ) ) ( not ( = ?auto_496170 ?auto_496171 ) ) ( not ( = ?auto_496170 ?auto_496172 ) ) ( not ( = ?auto_496170 ?auto_496173 ) ) ( not ( = ?auto_496170 ?auto_496174 ) ) ( not ( = ?auto_496171 ?auto_496172 ) ) ( not ( = ?auto_496171 ?auto_496173 ) ) ( not ( = ?auto_496171 ?auto_496174 ) ) ( not ( = ?auto_496172 ?auto_496173 ) ) ( not ( = ?auto_496172 ?auto_496174 ) ) ( not ( = ?auto_496173 ?auto_496174 ) ) ( ON ?auto_496172 ?auto_496173 ) ( ON ?auto_496171 ?auto_496172 ) ( ON ?auto_496170 ?auto_496171 ) ( ON ?auto_496169 ?auto_496170 ) ( ON ?auto_496168 ?auto_496169 ) ( ON ?auto_496167 ?auto_496168 ) ( ON ?auto_496166 ?auto_496167 ) ( ON ?auto_496165 ?auto_496166 ) ( ON ?auto_496164 ?auto_496165 ) ( ON ?auto_496163 ?auto_496164 ) ( ON ?auto_496162 ?auto_496163 ) ( ON ?auto_496161 ?auto_496162 ) ( ON ?auto_496160 ?auto_496161 ) ( CLEAR ?auto_496158 ) ( ON ?auto_496159 ?auto_496160 ) ( CLEAR ?auto_496159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_496158 ?auto_496159 )
      ( MAKE-16PILE ?auto_496158 ?auto_496159 ?auto_496160 ?auto_496161 ?auto_496162 ?auto_496163 ?auto_496164 ?auto_496165 ?auto_496166 ?auto_496167 ?auto_496168 ?auto_496169 ?auto_496170 ?auto_496171 ?auto_496172 ?auto_496173 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_496191 - BLOCK
      ?auto_496192 - BLOCK
      ?auto_496193 - BLOCK
      ?auto_496194 - BLOCK
      ?auto_496195 - BLOCK
      ?auto_496196 - BLOCK
      ?auto_496197 - BLOCK
      ?auto_496198 - BLOCK
      ?auto_496199 - BLOCK
      ?auto_496200 - BLOCK
      ?auto_496201 - BLOCK
      ?auto_496202 - BLOCK
      ?auto_496203 - BLOCK
      ?auto_496204 - BLOCK
      ?auto_496205 - BLOCK
      ?auto_496206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_496206 ) ( ON-TABLE ?auto_496191 ) ( not ( = ?auto_496191 ?auto_496192 ) ) ( not ( = ?auto_496191 ?auto_496193 ) ) ( not ( = ?auto_496191 ?auto_496194 ) ) ( not ( = ?auto_496191 ?auto_496195 ) ) ( not ( = ?auto_496191 ?auto_496196 ) ) ( not ( = ?auto_496191 ?auto_496197 ) ) ( not ( = ?auto_496191 ?auto_496198 ) ) ( not ( = ?auto_496191 ?auto_496199 ) ) ( not ( = ?auto_496191 ?auto_496200 ) ) ( not ( = ?auto_496191 ?auto_496201 ) ) ( not ( = ?auto_496191 ?auto_496202 ) ) ( not ( = ?auto_496191 ?auto_496203 ) ) ( not ( = ?auto_496191 ?auto_496204 ) ) ( not ( = ?auto_496191 ?auto_496205 ) ) ( not ( = ?auto_496191 ?auto_496206 ) ) ( not ( = ?auto_496192 ?auto_496193 ) ) ( not ( = ?auto_496192 ?auto_496194 ) ) ( not ( = ?auto_496192 ?auto_496195 ) ) ( not ( = ?auto_496192 ?auto_496196 ) ) ( not ( = ?auto_496192 ?auto_496197 ) ) ( not ( = ?auto_496192 ?auto_496198 ) ) ( not ( = ?auto_496192 ?auto_496199 ) ) ( not ( = ?auto_496192 ?auto_496200 ) ) ( not ( = ?auto_496192 ?auto_496201 ) ) ( not ( = ?auto_496192 ?auto_496202 ) ) ( not ( = ?auto_496192 ?auto_496203 ) ) ( not ( = ?auto_496192 ?auto_496204 ) ) ( not ( = ?auto_496192 ?auto_496205 ) ) ( not ( = ?auto_496192 ?auto_496206 ) ) ( not ( = ?auto_496193 ?auto_496194 ) ) ( not ( = ?auto_496193 ?auto_496195 ) ) ( not ( = ?auto_496193 ?auto_496196 ) ) ( not ( = ?auto_496193 ?auto_496197 ) ) ( not ( = ?auto_496193 ?auto_496198 ) ) ( not ( = ?auto_496193 ?auto_496199 ) ) ( not ( = ?auto_496193 ?auto_496200 ) ) ( not ( = ?auto_496193 ?auto_496201 ) ) ( not ( = ?auto_496193 ?auto_496202 ) ) ( not ( = ?auto_496193 ?auto_496203 ) ) ( not ( = ?auto_496193 ?auto_496204 ) ) ( not ( = ?auto_496193 ?auto_496205 ) ) ( not ( = ?auto_496193 ?auto_496206 ) ) ( not ( = ?auto_496194 ?auto_496195 ) ) ( not ( = ?auto_496194 ?auto_496196 ) ) ( not ( = ?auto_496194 ?auto_496197 ) ) ( not ( = ?auto_496194 ?auto_496198 ) ) ( not ( = ?auto_496194 ?auto_496199 ) ) ( not ( = ?auto_496194 ?auto_496200 ) ) ( not ( = ?auto_496194 ?auto_496201 ) ) ( not ( = ?auto_496194 ?auto_496202 ) ) ( not ( = ?auto_496194 ?auto_496203 ) ) ( not ( = ?auto_496194 ?auto_496204 ) ) ( not ( = ?auto_496194 ?auto_496205 ) ) ( not ( = ?auto_496194 ?auto_496206 ) ) ( not ( = ?auto_496195 ?auto_496196 ) ) ( not ( = ?auto_496195 ?auto_496197 ) ) ( not ( = ?auto_496195 ?auto_496198 ) ) ( not ( = ?auto_496195 ?auto_496199 ) ) ( not ( = ?auto_496195 ?auto_496200 ) ) ( not ( = ?auto_496195 ?auto_496201 ) ) ( not ( = ?auto_496195 ?auto_496202 ) ) ( not ( = ?auto_496195 ?auto_496203 ) ) ( not ( = ?auto_496195 ?auto_496204 ) ) ( not ( = ?auto_496195 ?auto_496205 ) ) ( not ( = ?auto_496195 ?auto_496206 ) ) ( not ( = ?auto_496196 ?auto_496197 ) ) ( not ( = ?auto_496196 ?auto_496198 ) ) ( not ( = ?auto_496196 ?auto_496199 ) ) ( not ( = ?auto_496196 ?auto_496200 ) ) ( not ( = ?auto_496196 ?auto_496201 ) ) ( not ( = ?auto_496196 ?auto_496202 ) ) ( not ( = ?auto_496196 ?auto_496203 ) ) ( not ( = ?auto_496196 ?auto_496204 ) ) ( not ( = ?auto_496196 ?auto_496205 ) ) ( not ( = ?auto_496196 ?auto_496206 ) ) ( not ( = ?auto_496197 ?auto_496198 ) ) ( not ( = ?auto_496197 ?auto_496199 ) ) ( not ( = ?auto_496197 ?auto_496200 ) ) ( not ( = ?auto_496197 ?auto_496201 ) ) ( not ( = ?auto_496197 ?auto_496202 ) ) ( not ( = ?auto_496197 ?auto_496203 ) ) ( not ( = ?auto_496197 ?auto_496204 ) ) ( not ( = ?auto_496197 ?auto_496205 ) ) ( not ( = ?auto_496197 ?auto_496206 ) ) ( not ( = ?auto_496198 ?auto_496199 ) ) ( not ( = ?auto_496198 ?auto_496200 ) ) ( not ( = ?auto_496198 ?auto_496201 ) ) ( not ( = ?auto_496198 ?auto_496202 ) ) ( not ( = ?auto_496198 ?auto_496203 ) ) ( not ( = ?auto_496198 ?auto_496204 ) ) ( not ( = ?auto_496198 ?auto_496205 ) ) ( not ( = ?auto_496198 ?auto_496206 ) ) ( not ( = ?auto_496199 ?auto_496200 ) ) ( not ( = ?auto_496199 ?auto_496201 ) ) ( not ( = ?auto_496199 ?auto_496202 ) ) ( not ( = ?auto_496199 ?auto_496203 ) ) ( not ( = ?auto_496199 ?auto_496204 ) ) ( not ( = ?auto_496199 ?auto_496205 ) ) ( not ( = ?auto_496199 ?auto_496206 ) ) ( not ( = ?auto_496200 ?auto_496201 ) ) ( not ( = ?auto_496200 ?auto_496202 ) ) ( not ( = ?auto_496200 ?auto_496203 ) ) ( not ( = ?auto_496200 ?auto_496204 ) ) ( not ( = ?auto_496200 ?auto_496205 ) ) ( not ( = ?auto_496200 ?auto_496206 ) ) ( not ( = ?auto_496201 ?auto_496202 ) ) ( not ( = ?auto_496201 ?auto_496203 ) ) ( not ( = ?auto_496201 ?auto_496204 ) ) ( not ( = ?auto_496201 ?auto_496205 ) ) ( not ( = ?auto_496201 ?auto_496206 ) ) ( not ( = ?auto_496202 ?auto_496203 ) ) ( not ( = ?auto_496202 ?auto_496204 ) ) ( not ( = ?auto_496202 ?auto_496205 ) ) ( not ( = ?auto_496202 ?auto_496206 ) ) ( not ( = ?auto_496203 ?auto_496204 ) ) ( not ( = ?auto_496203 ?auto_496205 ) ) ( not ( = ?auto_496203 ?auto_496206 ) ) ( not ( = ?auto_496204 ?auto_496205 ) ) ( not ( = ?auto_496204 ?auto_496206 ) ) ( not ( = ?auto_496205 ?auto_496206 ) ) ( ON ?auto_496205 ?auto_496206 ) ( ON ?auto_496204 ?auto_496205 ) ( ON ?auto_496203 ?auto_496204 ) ( ON ?auto_496202 ?auto_496203 ) ( ON ?auto_496201 ?auto_496202 ) ( ON ?auto_496200 ?auto_496201 ) ( ON ?auto_496199 ?auto_496200 ) ( ON ?auto_496198 ?auto_496199 ) ( ON ?auto_496197 ?auto_496198 ) ( ON ?auto_496196 ?auto_496197 ) ( ON ?auto_496195 ?auto_496196 ) ( ON ?auto_496194 ?auto_496195 ) ( ON ?auto_496193 ?auto_496194 ) ( CLEAR ?auto_496191 ) ( ON ?auto_496192 ?auto_496193 ) ( CLEAR ?auto_496192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_496191 ?auto_496192 )
      ( MAKE-16PILE ?auto_496191 ?auto_496192 ?auto_496193 ?auto_496194 ?auto_496195 ?auto_496196 ?auto_496197 ?auto_496198 ?auto_496199 ?auto_496200 ?auto_496201 ?auto_496202 ?auto_496203 ?auto_496204 ?auto_496205 ?auto_496206 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_496223 - BLOCK
      ?auto_496224 - BLOCK
      ?auto_496225 - BLOCK
      ?auto_496226 - BLOCK
      ?auto_496227 - BLOCK
      ?auto_496228 - BLOCK
      ?auto_496229 - BLOCK
      ?auto_496230 - BLOCK
      ?auto_496231 - BLOCK
      ?auto_496232 - BLOCK
      ?auto_496233 - BLOCK
      ?auto_496234 - BLOCK
      ?auto_496235 - BLOCK
      ?auto_496236 - BLOCK
      ?auto_496237 - BLOCK
      ?auto_496238 - BLOCK
    )
    :vars
    (
      ?auto_496239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_496238 ?auto_496239 ) ( not ( = ?auto_496223 ?auto_496224 ) ) ( not ( = ?auto_496223 ?auto_496225 ) ) ( not ( = ?auto_496223 ?auto_496226 ) ) ( not ( = ?auto_496223 ?auto_496227 ) ) ( not ( = ?auto_496223 ?auto_496228 ) ) ( not ( = ?auto_496223 ?auto_496229 ) ) ( not ( = ?auto_496223 ?auto_496230 ) ) ( not ( = ?auto_496223 ?auto_496231 ) ) ( not ( = ?auto_496223 ?auto_496232 ) ) ( not ( = ?auto_496223 ?auto_496233 ) ) ( not ( = ?auto_496223 ?auto_496234 ) ) ( not ( = ?auto_496223 ?auto_496235 ) ) ( not ( = ?auto_496223 ?auto_496236 ) ) ( not ( = ?auto_496223 ?auto_496237 ) ) ( not ( = ?auto_496223 ?auto_496238 ) ) ( not ( = ?auto_496223 ?auto_496239 ) ) ( not ( = ?auto_496224 ?auto_496225 ) ) ( not ( = ?auto_496224 ?auto_496226 ) ) ( not ( = ?auto_496224 ?auto_496227 ) ) ( not ( = ?auto_496224 ?auto_496228 ) ) ( not ( = ?auto_496224 ?auto_496229 ) ) ( not ( = ?auto_496224 ?auto_496230 ) ) ( not ( = ?auto_496224 ?auto_496231 ) ) ( not ( = ?auto_496224 ?auto_496232 ) ) ( not ( = ?auto_496224 ?auto_496233 ) ) ( not ( = ?auto_496224 ?auto_496234 ) ) ( not ( = ?auto_496224 ?auto_496235 ) ) ( not ( = ?auto_496224 ?auto_496236 ) ) ( not ( = ?auto_496224 ?auto_496237 ) ) ( not ( = ?auto_496224 ?auto_496238 ) ) ( not ( = ?auto_496224 ?auto_496239 ) ) ( not ( = ?auto_496225 ?auto_496226 ) ) ( not ( = ?auto_496225 ?auto_496227 ) ) ( not ( = ?auto_496225 ?auto_496228 ) ) ( not ( = ?auto_496225 ?auto_496229 ) ) ( not ( = ?auto_496225 ?auto_496230 ) ) ( not ( = ?auto_496225 ?auto_496231 ) ) ( not ( = ?auto_496225 ?auto_496232 ) ) ( not ( = ?auto_496225 ?auto_496233 ) ) ( not ( = ?auto_496225 ?auto_496234 ) ) ( not ( = ?auto_496225 ?auto_496235 ) ) ( not ( = ?auto_496225 ?auto_496236 ) ) ( not ( = ?auto_496225 ?auto_496237 ) ) ( not ( = ?auto_496225 ?auto_496238 ) ) ( not ( = ?auto_496225 ?auto_496239 ) ) ( not ( = ?auto_496226 ?auto_496227 ) ) ( not ( = ?auto_496226 ?auto_496228 ) ) ( not ( = ?auto_496226 ?auto_496229 ) ) ( not ( = ?auto_496226 ?auto_496230 ) ) ( not ( = ?auto_496226 ?auto_496231 ) ) ( not ( = ?auto_496226 ?auto_496232 ) ) ( not ( = ?auto_496226 ?auto_496233 ) ) ( not ( = ?auto_496226 ?auto_496234 ) ) ( not ( = ?auto_496226 ?auto_496235 ) ) ( not ( = ?auto_496226 ?auto_496236 ) ) ( not ( = ?auto_496226 ?auto_496237 ) ) ( not ( = ?auto_496226 ?auto_496238 ) ) ( not ( = ?auto_496226 ?auto_496239 ) ) ( not ( = ?auto_496227 ?auto_496228 ) ) ( not ( = ?auto_496227 ?auto_496229 ) ) ( not ( = ?auto_496227 ?auto_496230 ) ) ( not ( = ?auto_496227 ?auto_496231 ) ) ( not ( = ?auto_496227 ?auto_496232 ) ) ( not ( = ?auto_496227 ?auto_496233 ) ) ( not ( = ?auto_496227 ?auto_496234 ) ) ( not ( = ?auto_496227 ?auto_496235 ) ) ( not ( = ?auto_496227 ?auto_496236 ) ) ( not ( = ?auto_496227 ?auto_496237 ) ) ( not ( = ?auto_496227 ?auto_496238 ) ) ( not ( = ?auto_496227 ?auto_496239 ) ) ( not ( = ?auto_496228 ?auto_496229 ) ) ( not ( = ?auto_496228 ?auto_496230 ) ) ( not ( = ?auto_496228 ?auto_496231 ) ) ( not ( = ?auto_496228 ?auto_496232 ) ) ( not ( = ?auto_496228 ?auto_496233 ) ) ( not ( = ?auto_496228 ?auto_496234 ) ) ( not ( = ?auto_496228 ?auto_496235 ) ) ( not ( = ?auto_496228 ?auto_496236 ) ) ( not ( = ?auto_496228 ?auto_496237 ) ) ( not ( = ?auto_496228 ?auto_496238 ) ) ( not ( = ?auto_496228 ?auto_496239 ) ) ( not ( = ?auto_496229 ?auto_496230 ) ) ( not ( = ?auto_496229 ?auto_496231 ) ) ( not ( = ?auto_496229 ?auto_496232 ) ) ( not ( = ?auto_496229 ?auto_496233 ) ) ( not ( = ?auto_496229 ?auto_496234 ) ) ( not ( = ?auto_496229 ?auto_496235 ) ) ( not ( = ?auto_496229 ?auto_496236 ) ) ( not ( = ?auto_496229 ?auto_496237 ) ) ( not ( = ?auto_496229 ?auto_496238 ) ) ( not ( = ?auto_496229 ?auto_496239 ) ) ( not ( = ?auto_496230 ?auto_496231 ) ) ( not ( = ?auto_496230 ?auto_496232 ) ) ( not ( = ?auto_496230 ?auto_496233 ) ) ( not ( = ?auto_496230 ?auto_496234 ) ) ( not ( = ?auto_496230 ?auto_496235 ) ) ( not ( = ?auto_496230 ?auto_496236 ) ) ( not ( = ?auto_496230 ?auto_496237 ) ) ( not ( = ?auto_496230 ?auto_496238 ) ) ( not ( = ?auto_496230 ?auto_496239 ) ) ( not ( = ?auto_496231 ?auto_496232 ) ) ( not ( = ?auto_496231 ?auto_496233 ) ) ( not ( = ?auto_496231 ?auto_496234 ) ) ( not ( = ?auto_496231 ?auto_496235 ) ) ( not ( = ?auto_496231 ?auto_496236 ) ) ( not ( = ?auto_496231 ?auto_496237 ) ) ( not ( = ?auto_496231 ?auto_496238 ) ) ( not ( = ?auto_496231 ?auto_496239 ) ) ( not ( = ?auto_496232 ?auto_496233 ) ) ( not ( = ?auto_496232 ?auto_496234 ) ) ( not ( = ?auto_496232 ?auto_496235 ) ) ( not ( = ?auto_496232 ?auto_496236 ) ) ( not ( = ?auto_496232 ?auto_496237 ) ) ( not ( = ?auto_496232 ?auto_496238 ) ) ( not ( = ?auto_496232 ?auto_496239 ) ) ( not ( = ?auto_496233 ?auto_496234 ) ) ( not ( = ?auto_496233 ?auto_496235 ) ) ( not ( = ?auto_496233 ?auto_496236 ) ) ( not ( = ?auto_496233 ?auto_496237 ) ) ( not ( = ?auto_496233 ?auto_496238 ) ) ( not ( = ?auto_496233 ?auto_496239 ) ) ( not ( = ?auto_496234 ?auto_496235 ) ) ( not ( = ?auto_496234 ?auto_496236 ) ) ( not ( = ?auto_496234 ?auto_496237 ) ) ( not ( = ?auto_496234 ?auto_496238 ) ) ( not ( = ?auto_496234 ?auto_496239 ) ) ( not ( = ?auto_496235 ?auto_496236 ) ) ( not ( = ?auto_496235 ?auto_496237 ) ) ( not ( = ?auto_496235 ?auto_496238 ) ) ( not ( = ?auto_496235 ?auto_496239 ) ) ( not ( = ?auto_496236 ?auto_496237 ) ) ( not ( = ?auto_496236 ?auto_496238 ) ) ( not ( = ?auto_496236 ?auto_496239 ) ) ( not ( = ?auto_496237 ?auto_496238 ) ) ( not ( = ?auto_496237 ?auto_496239 ) ) ( not ( = ?auto_496238 ?auto_496239 ) ) ( ON ?auto_496237 ?auto_496238 ) ( ON ?auto_496236 ?auto_496237 ) ( ON ?auto_496235 ?auto_496236 ) ( ON ?auto_496234 ?auto_496235 ) ( ON ?auto_496233 ?auto_496234 ) ( ON ?auto_496232 ?auto_496233 ) ( ON ?auto_496231 ?auto_496232 ) ( ON ?auto_496230 ?auto_496231 ) ( ON ?auto_496229 ?auto_496230 ) ( ON ?auto_496228 ?auto_496229 ) ( ON ?auto_496227 ?auto_496228 ) ( ON ?auto_496226 ?auto_496227 ) ( ON ?auto_496225 ?auto_496226 ) ( ON ?auto_496224 ?auto_496225 ) ( ON ?auto_496223 ?auto_496224 ) ( CLEAR ?auto_496223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_496223 )
      ( MAKE-16PILE ?auto_496223 ?auto_496224 ?auto_496225 ?auto_496226 ?auto_496227 ?auto_496228 ?auto_496229 ?auto_496230 ?auto_496231 ?auto_496232 ?auto_496233 ?auto_496234 ?auto_496235 ?auto_496236 ?auto_496237 ?auto_496238 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_496256 - BLOCK
      ?auto_496257 - BLOCK
      ?auto_496258 - BLOCK
      ?auto_496259 - BLOCK
      ?auto_496260 - BLOCK
      ?auto_496261 - BLOCK
      ?auto_496262 - BLOCK
      ?auto_496263 - BLOCK
      ?auto_496264 - BLOCK
      ?auto_496265 - BLOCK
      ?auto_496266 - BLOCK
      ?auto_496267 - BLOCK
      ?auto_496268 - BLOCK
      ?auto_496269 - BLOCK
      ?auto_496270 - BLOCK
      ?auto_496271 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_496271 ) ( not ( = ?auto_496256 ?auto_496257 ) ) ( not ( = ?auto_496256 ?auto_496258 ) ) ( not ( = ?auto_496256 ?auto_496259 ) ) ( not ( = ?auto_496256 ?auto_496260 ) ) ( not ( = ?auto_496256 ?auto_496261 ) ) ( not ( = ?auto_496256 ?auto_496262 ) ) ( not ( = ?auto_496256 ?auto_496263 ) ) ( not ( = ?auto_496256 ?auto_496264 ) ) ( not ( = ?auto_496256 ?auto_496265 ) ) ( not ( = ?auto_496256 ?auto_496266 ) ) ( not ( = ?auto_496256 ?auto_496267 ) ) ( not ( = ?auto_496256 ?auto_496268 ) ) ( not ( = ?auto_496256 ?auto_496269 ) ) ( not ( = ?auto_496256 ?auto_496270 ) ) ( not ( = ?auto_496256 ?auto_496271 ) ) ( not ( = ?auto_496257 ?auto_496258 ) ) ( not ( = ?auto_496257 ?auto_496259 ) ) ( not ( = ?auto_496257 ?auto_496260 ) ) ( not ( = ?auto_496257 ?auto_496261 ) ) ( not ( = ?auto_496257 ?auto_496262 ) ) ( not ( = ?auto_496257 ?auto_496263 ) ) ( not ( = ?auto_496257 ?auto_496264 ) ) ( not ( = ?auto_496257 ?auto_496265 ) ) ( not ( = ?auto_496257 ?auto_496266 ) ) ( not ( = ?auto_496257 ?auto_496267 ) ) ( not ( = ?auto_496257 ?auto_496268 ) ) ( not ( = ?auto_496257 ?auto_496269 ) ) ( not ( = ?auto_496257 ?auto_496270 ) ) ( not ( = ?auto_496257 ?auto_496271 ) ) ( not ( = ?auto_496258 ?auto_496259 ) ) ( not ( = ?auto_496258 ?auto_496260 ) ) ( not ( = ?auto_496258 ?auto_496261 ) ) ( not ( = ?auto_496258 ?auto_496262 ) ) ( not ( = ?auto_496258 ?auto_496263 ) ) ( not ( = ?auto_496258 ?auto_496264 ) ) ( not ( = ?auto_496258 ?auto_496265 ) ) ( not ( = ?auto_496258 ?auto_496266 ) ) ( not ( = ?auto_496258 ?auto_496267 ) ) ( not ( = ?auto_496258 ?auto_496268 ) ) ( not ( = ?auto_496258 ?auto_496269 ) ) ( not ( = ?auto_496258 ?auto_496270 ) ) ( not ( = ?auto_496258 ?auto_496271 ) ) ( not ( = ?auto_496259 ?auto_496260 ) ) ( not ( = ?auto_496259 ?auto_496261 ) ) ( not ( = ?auto_496259 ?auto_496262 ) ) ( not ( = ?auto_496259 ?auto_496263 ) ) ( not ( = ?auto_496259 ?auto_496264 ) ) ( not ( = ?auto_496259 ?auto_496265 ) ) ( not ( = ?auto_496259 ?auto_496266 ) ) ( not ( = ?auto_496259 ?auto_496267 ) ) ( not ( = ?auto_496259 ?auto_496268 ) ) ( not ( = ?auto_496259 ?auto_496269 ) ) ( not ( = ?auto_496259 ?auto_496270 ) ) ( not ( = ?auto_496259 ?auto_496271 ) ) ( not ( = ?auto_496260 ?auto_496261 ) ) ( not ( = ?auto_496260 ?auto_496262 ) ) ( not ( = ?auto_496260 ?auto_496263 ) ) ( not ( = ?auto_496260 ?auto_496264 ) ) ( not ( = ?auto_496260 ?auto_496265 ) ) ( not ( = ?auto_496260 ?auto_496266 ) ) ( not ( = ?auto_496260 ?auto_496267 ) ) ( not ( = ?auto_496260 ?auto_496268 ) ) ( not ( = ?auto_496260 ?auto_496269 ) ) ( not ( = ?auto_496260 ?auto_496270 ) ) ( not ( = ?auto_496260 ?auto_496271 ) ) ( not ( = ?auto_496261 ?auto_496262 ) ) ( not ( = ?auto_496261 ?auto_496263 ) ) ( not ( = ?auto_496261 ?auto_496264 ) ) ( not ( = ?auto_496261 ?auto_496265 ) ) ( not ( = ?auto_496261 ?auto_496266 ) ) ( not ( = ?auto_496261 ?auto_496267 ) ) ( not ( = ?auto_496261 ?auto_496268 ) ) ( not ( = ?auto_496261 ?auto_496269 ) ) ( not ( = ?auto_496261 ?auto_496270 ) ) ( not ( = ?auto_496261 ?auto_496271 ) ) ( not ( = ?auto_496262 ?auto_496263 ) ) ( not ( = ?auto_496262 ?auto_496264 ) ) ( not ( = ?auto_496262 ?auto_496265 ) ) ( not ( = ?auto_496262 ?auto_496266 ) ) ( not ( = ?auto_496262 ?auto_496267 ) ) ( not ( = ?auto_496262 ?auto_496268 ) ) ( not ( = ?auto_496262 ?auto_496269 ) ) ( not ( = ?auto_496262 ?auto_496270 ) ) ( not ( = ?auto_496262 ?auto_496271 ) ) ( not ( = ?auto_496263 ?auto_496264 ) ) ( not ( = ?auto_496263 ?auto_496265 ) ) ( not ( = ?auto_496263 ?auto_496266 ) ) ( not ( = ?auto_496263 ?auto_496267 ) ) ( not ( = ?auto_496263 ?auto_496268 ) ) ( not ( = ?auto_496263 ?auto_496269 ) ) ( not ( = ?auto_496263 ?auto_496270 ) ) ( not ( = ?auto_496263 ?auto_496271 ) ) ( not ( = ?auto_496264 ?auto_496265 ) ) ( not ( = ?auto_496264 ?auto_496266 ) ) ( not ( = ?auto_496264 ?auto_496267 ) ) ( not ( = ?auto_496264 ?auto_496268 ) ) ( not ( = ?auto_496264 ?auto_496269 ) ) ( not ( = ?auto_496264 ?auto_496270 ) ) ( not ( = ?auto_496264 ?auto_496271 ) ) ( not ( = ?auto_496265 ?auto_496266 ) ) ( not ( = ?auto_496265 ?auto_496267 ) ) ( not ( = ?auto_496265 ?auto_496268 ) ) ( not ( = ?auto_496265 ?auto_496269 ) ) ( not ( = ?auto_496265 ?auto_496270 ) ) ( not ( = ?auto_496265 ?auto_496271 ) ) ( not ( = ?auto_496266 ?auto_496267 ) ) ( not ( = ?auto_496266 ?auto_496268 ) ) ( not ( = ?auto_496266 ?auto_496269 ) ) ( not ( = ?auto_496266 ?auto_496270 ) ) ( not ( = ?auto_496266 ?auto_496271 ) ) ( not ( = ?auto_496267 ?auto_496268 ) ) ( not ( = ?auto_496267 ?auto_496269 ) ) ( not ( = ?auto_496267 ?auto_496270 ) ) ( not ( = ?auto_496267 ?auto_496271 ) ) ( not ( = ?auto_496268 ?auto_496269 ) ) ( not ( = ?auto_496268 ?auto_496270 ) ) ( not ( = ?auto_496268 ?auto_496271 ) ) ( not ( = ?auto_496269 ?auto_496270 ) ) ( not ( = ?auto_496269 ?auto_496271 ) ) ( not ( = ?auto_496270 ?auto_496271 ) ) ( ON ?auto_496270 ?auto_496271 ) ( ON ?auto_496269 ?auto_496270 ) ( ON ?auto_496268 ?auto_496269 ) ( ON ?auto_496267 ?auto_496268 ) ( ON ?auto_496266 ?auto_496267 ) ( ON ?auto_496265 ?auto_496266 ) ( ON ?auto_496264 ?auto_496265 ) ( ON ?auto_496263 ?auto_496264 ) ( ON ?auto_496262 ?auto_496263 ) ( ON ?auto_496261 ?auto_496262 ) ( ON ?auto_496260 ?auto_496261 ) ( ON ?auto_496259 ?auto_496260 ) ( ON ?auto_496258 ?auto_496259 ) ( ON ?auto_496257 ?auto_496258 ) ( ON ?auto_496256 ?auto_496257 ) ( CLEAR ?auto_496256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_496256 )
      ( MAKE-16PILE ?auto_496256 ?auto_496257 ?auto_496258 ?auto_496259 ?auto_496260 ?auto_496261 ?auto_496262 ?auto_496263 ?auto_496264 ?auto_496265 ?auto_496266 ?auto_496267 ?auto_496268 ?auto_496269 ?auto_496270 ?auto_496271 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_496288 - BLOCK
      ?auto_496289 - BLOCK
      ?auto_496290 - BLOCK
      ?auto_496291 - BLOCK
      ?auto_496292 - BLOCK
      ?auto_496293 - BLOCK
      ?auto_496294 - BLOCK
      ?auto_496295 - BLOCK
      ?auto_496296 - BLOCK
      ?auto_496297 - BLOCK
      ?auto_496298 - BLOCK
      ?auto_496299 - BLOCK
      ?auto_496300 - BLOCK
      ?auto_496301 - BLOCK
      ?auto_496302 - BLOCK
      ?auto_496303 - BLOCK
    )
    :vars
    (
      ?auto_496304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_496288 ?auto_496289 ) ) ( not ( = ?auto_496288 ?auto_496290 ) ) ( not ( = ?auto_496288 ?auto_496291 ) ) ( not ( = ?auto_496288 ?auto_496292 ) ) ( not ( = ?auto_496288 ?auto_496293 ) ) ( not ( = ?auto_496288 ?auto_496294 ) ) ( not ( = ?auto_496288 ?auto_496295 ) ) ( not ( = ?auto_496288 ?auto_496296 ) ) ( not ( = ?auto_496288 ?auto_496297 ) ) ( not ( = ?auto_496288 ?auto_496298 ) ) ( not ( = ?auto_496288 ?auto_496299 ) ) ( not ( = ?auto_496288 ?auto_496300 ) ) ( not ( = ?auto_496288 ?auto_496301 ) ) ( not ( = ?auto_496288 ?auto_496302 ) ) ( not ( = ?auto_496288 ?auto_496303 ) ) ( not ( = ?auto_496289 ?auto_496290 ) ) ( not ( = ?auto_496289 ?auto_496291 ) ) ( not ( = ?auto_496289 ?auto_496292 ) ) ( not ( = ?auto_496289 ?auto_496293 ) ) ( not ( = ?auto_496289 ?auto_496294 ) ) ( not ( = ?auto_496289 ?auto_496295 ) ) ( not ( = ?auto_496289 ?auto_496296 ) ) ( not ( = ?auto_496289 ?auto_496297 ) ) ( not ( = ?auto_496289 ?auto_496298 ) ) ( not ( = ?auto_496289 ?auto_496299 ) ) ( not ( = ?auto_496289 ?auto_496300 ) ) ( not ( = ?auto_496289 ?auto_496301 ) ) ( not ( = ?auto_496289 ?auto_496302 ) ) ( not ( = ?auto_496289 ?auto_496303 ) ) ( not ( = ?auto_496290 ?auto_496291 ) ) ( not ( = ?auto_496290 ?auto_496292 ) ) ( not ( = ?auto_496290 ?auto_496293 ) ) ( not ( = ?auto_496290 ?auto_496294 ) ) ( not ( = ?auto_496290 ?auto_496295 ) ) ( not ( = ?auto_496290 ?auto_496296 ) ) ( not ( = ?auto_496290 ?auto_496297 ) ) ( not ( = ?auto_496290 ?auto_496298 ) ) ( not ( = ?auto_496290 ?auto_496299 ) ) ( not ( = ?auto_496290 ?auto_496300 ) ) ( not ( = ?auto_496290 ?auto_496301 ) ) ( not ( = ?auto_496290 ?auto_496302 ) ) ( not ( = ?auto_496290 ?auto_496303 ) ) ( not ( = ?auto_496291 ?auto_496292 ) ) ( not ( = ?auto_496291 ?auto_496293 ) ) ( not ( = ?auto_496291 ?auto_496294 ) ) ( not ( = ?auto_496291 ?auto_496295 ) ) ( not ( = ?auto_496291 ?auto_496296 ) ) ( not ( = ?auto_496291 ?auto_496297 ) ) ( not ( = ?auto_496291 ?auto_496298 ) ) ( not ( = ?auto_496291 ?auto_496299 ) ) ( not ( = ?auto_496291 ?auto_496300 ) ) ( not ( = ?auto_496291 ?auto_496301 ) ) ( not ( = ?auto_496291 ?auto_496302 ) ) ( not ( = ?auto_496291 ?auto_496303 ) ) ( not ( = ?auto_496292 ?auto_496293 ) ) ( not ( = ?auto_496292 ?auto_496294 ) ) ( not ( = ?auto_496292 ?auto_496295 ) ) ( not ( = ?auto_496292 ?auto_496296 ) ) ( not ( = ?auto_496292 ?auto_496297 ) ) ( not ( = ?auto_496292 ?auto_496298 ) ) ( not ( = ?auto_496292 ?auto_496299 ) ) ( not ( = ?auto_496292 ?auto_496300 ) ) ( not ( = ?auto_496292 ?auto_496301 ) ) ( not ( = ?auto_496292 ?auto_496302 ) ) ( not ( = ?auto_496292 ?auto_496303 ) ) ( not ( = ?auto_496293 ?auto_496294 ) ) ( not ( = ?auto_496293 ?auto_496295 ) ) ( not ( = ?auto_496293 ?auto_496296 ) ) ( not ( = ?auto_496293 ?auto_496297 ) ) ( not ( = ?auto_496293 ?auto_496298 ) ) ( not ( = ?auto_496293 ?auto_496299 ) ) ( not ( = ?auto_496293 ?auto_496300 ) ) ( not ( = ?auto_496293 ?auto_496301 ) ) ( not ( = ?auto_496293 ?auto_496302 ) ) ( not ( = ?auto_496293 ?auto_496303 ) ) ( not ( = ?auto_496294 ?auto_496295 ) ) ( not ( = ?auto_496294 ?auto_496296 ) ) ( not ( = ?auto_496294 ?auto_496297 ) ) ( not ( = ?auto_496294 ?auto_496298 ) ) ( not ( = ?auto_496294 ?auto_496299 ) ) ( not ( = ?auto_496294 ?auto_496300 ) ) ( not ( = ?auto_496294 ?auto_496301 ) ) ( not ( = ?auto_496294 ?auto_496302 ) ) ( not ( = ?auto_496294 ?auto_496303 ) ) ( not ( = ?auto_496295 ?auto_496296 ) ) ( not ( = ?auto_496295 ?auto_496297 ) ) ( not ( = ?auto_496295 ?auto_496298 ) ) ( not ( = ?auto_496295 ?auto_496299 ) ) ( not ( = ?auto_496295 ?auto_496300 ) ) ( not ( = ?auto_496295 ?auto_496301 ) ) ( not ( = ?auto_496295 ?auto_496302 ) ) ( not ( = ?auto_496295 ?auto_496303 ) ) ( not ( = ?auto_496296 ?auto_496297 ) ) ( not ( = ?auto_496296 ?auto_496298 ) ) ( not ( = ?auto_496296 ?auto_496299 ) ) ( not ( = ?auto_496296 ?auto_496300 ) ) ( not ( = ?auto_496296 ?auto_496301 ) ) ( not ( = ?auto_496296 ?auto_496302 ) ) ( not ( = ?auto_496296 ?auto_496303 ) ) ( not ( = ?auto_496297 ?auto_496298 ) ) ( not ( = ?auto_496297 ?auto_496299 ) ) ( not ( = ?auto_496297 ?auto_496300 ) ) ( not ( = ?auto_496297 ?auto_496301 ) ) ( not ( = ?auto_496297 ?auto_496302 ) ) ( not ( = ?auto_496297 ?auto_496303 ) ) ( not ( = ?auto_496298 ?auto_496299 ) ) ( not ( = ?auto_496298 ?auto_496300 ) ) ( not ( = ?auto_496298 ?auto_496301 ) ) ( not ( = ?auto_496298 ?auto_496302 ) ) ( not ( = ?auto_496298 ?auto_496303 ) ) ( not ( = ?auto_496299 ?auto_496300 ) ) ( not ( = ?auto_496299 ?auto_496301 ) ) ( not ( = ?auto_496299 ?auto_496302 ) ) ( not ( = ?auto_496299 ?auto_496303 ) ) ( not ( = ?auto_496300 ?auto_496301 ) ) ( not ( = ?auto_496300 ?auto_496302 ) ) ( not ( = ?auto_496300 ?auto_496303 ) ) ( not ( = ?auto_496301 ?auto_496302 ) ) ( not ( = ?auto_496301 ?auto_496303 ) ) ( not ( = ?auto_496302 ?auto_496303 ) ) ( ON ?auto_496288 ?auto_496304 ) ( not ( = ?auto_496303 ?auto_496304 ) ) ( not ( = ?auto_496302 ?auto_496304 ) ) ( not ( = ?auto_496301 ?auto_496304 ) ) ( not ( = ?auto_496300 ?auto_496304 ) ) ( not ( = ?auto_496299 ?auto_496304 ) ) ( not ( = ?auto_496298 ?auto_496304 ) ) ( not ( = ?auto_496297 ?auto_496304 ) ) ( not ( = ?auto_496296 ?auto_496304 ) ) ( not ( = ?auto_496295 ?auto_496304 ) ) ( not ( = ?auto_496294 ?auto_496304 ) ) ( not ( = ?auto_496293 ?auto_496304 ) ) ( not ( = ?auto_496292 ?auto_496304 ) ) ( not ( = ?auto_496291 ?auto_496304 ) ) ( not ( = ?auto_496290 ?auto_496304 ) ) ( not ( = ?auto_496289 ?auto_496304 ) ) ( not ( = ?auto_496288 ?auto_496304 ) ) ( ON ?auto_496289 ?auto_496288 ) ( ON ?auto_496290 ?auto_496289 ) ( ON ?auto_496291 ?auto_496290 ) ( ON ?auto_496292 ?auto_496291 ) ( ON ?auto_496293 ?auto_496292 ) ( ON ?auto_496294 ?auto_496293 ) ( ON ?auto_496295 ?auto_496294 ) ( ON ?auto_496296 ?auto_496295 ) ( ON ?auto_496297 ?auto_496296 ) ( ON ?auto_496298 ?auto_496297 ) ( ON ?auto_496299 ?auto_496298 ) ( ON ?auto_496300 ?auto_496299 ) ( ON ?auto_496301 ?auto_496300 ) ( ON ?auto_496302 ?auto_496301 ) ( ON ?auto_496303 ?auto_496302 ) ( CLEAR ?auto_496303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_496303 ?auto_496302 ?auto_496301 ?auto_496300 ?auto_496299 ?auto_496298 ?auto_496297 ?auto_496296 ?auto_496295 ?auto_496294 ?auto_496293 ?auto_496292 ?auto_496291 ?auto_496290 ?auto_496289 ?auto_496288 )
      ( MAKE-16PILE ?auto_496288 ?auto_496289 ?auto_496290 ?auto_496291 ?auto_496292 ?auto_496293 ?auto_496294 ?auto_496295 ?auto_496296 ?auto_496297 ?auto_496298 ?auto_496299 ?auto_496300 ?auto_496301 ?auto_496302 ?auto_496303 ) )
  )

)

