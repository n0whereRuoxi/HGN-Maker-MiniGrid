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
      ?auto_766072 - BLOCK
    )
    :vars
    (
      ?auto_766073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766072 ?auto_766073 ) ( CLEAR ?auto_766072 ) ( HAND-EMPTY ) ( not ( = ?auto_766072 ?auto_766073 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_766072 ?auto_766073 )
      ( !PUTDOWN ?auto_766072 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_766079 - BLOCK
      ?auto_766080 - BLOCK
    )
    :vars
    (
      ?auto_766081 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_766079 ) ( ON ?auto_766080 ?auto_766081 ) ( CLEAR ?auto_766080 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_766079 ) ( not ( = ?auto_766079 ?auto_766080 ) ) ( not ( = ?auto_766079 ?auto_766081 ) ) ( not ( = ?auto_766080 ?auto_766081 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_766080 ?auto_766081 )
      ( !STACK ?auto_766080 ?auto_766079 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_766089 - BLOCK
      ?auto_766090 - BLOCK
    )
    :vars
    (
      ?auto_766091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766090 ?auto_766091 ) ( not ( = ?auto_766089 ?auto_766090 ) ) ( not ( = ?auto_766089 ?auto_766091 ) ) ( not ( = ?auto_766090 ?auto_766091 ) ) ( ON ?auto_766089 ?auto_766090 ) ( CLEAR ?auto_766089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_766089 )
      ( MAKE-2PILE ?auto_766089 ?auto_766090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_766100 - BLOCK
      ?auto_766101 - BLOCK
      ?auto_766102 - BLOCK
    )
    :vars
    (
      ?auto_766103 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_766101 ) ( ON ?auto_766102 ?auto_766103 ) ( CLEAR ?auto_766102 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_766100 ) ( ON ?auto_766101 ?auto_766100 ) ( not ( = ?auto_766100 ?auto_766101 ) ) ( not ( = ?auto_766100 ?auto_766102 ) ) ( not ( = ?auto_766100 ?auto_766103 ) ) ( not ( = ?auto_766101 ?auto_766102 ) ) ( not ( = ?auto_766101 ?auto_766103 ) ) ( not ( = ?auto_766102 ?auto_766103 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_766102 ?auto_766103 )
      ( !STACK ?auto_766102 ?auto_766101 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_766114 - BLOCK
      ?auto_766115 - BLOCK
      ?auto_766116 - BLOCK
    )
    :vars
    (
      ?auto_766117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766116 ?auto_766117 ) ( ON-TABLE ?auto_766114 ) ( not ( = ?auto_766114 ?auto_766115 ) ) ( not ( = ?auto_766114 ?auto_766116 ) ) ( not ( = ?auto_766114 ?auto_766117 ) ) ( not ( = ?auto_766115 ?auto_766116 ) ) ( not ( = ?auto_766115 ?auto_766117 ) ) ( not ( = ?auto_766116 ?auto_766117 ) ) ( CLEAR ?auto_766114 ) ( ON ?auto_766115 ?auto_766116 ) ( CLEAR ?auto_766115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_766114 ?auto_766115 )
      ( MAKE-3PILE ?auto_766114 ?auto_766115 ?auto_766116 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_766128 - BLOCK
      ?auto_766129 - BLOCK
      ?auto_766130 - BLOCK
    )
    :vars
    (
      ?auto_766131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766130 ?auto_766131 ) ( not ( = ?auto_766128 ?auto_766129 ) ) ( not ( = ?auto_766128 ?auto_766130 ) ) ( not ( = ?auto_766128 ?auto_766131 ) ) ( not ( = ?auto_766129 ?auto_766130 ) ) ( not ( = ?auto_766129 ?auto_766131 ) ) ( not ( = ?auto_766130 ?auto_766131 ) ) ( ON ?auto_766129 ?auto_766130 ) ( ON ?auto_766128 ?auto_766129 ) ( CLEAR ?auto_766128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_766128 )
      ( MAKE-3PILE ?auto_766128 ?auto_766129 ?auto_766130 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_766143 - BLOCK
      ?auto_766144 - BLOCK
      ?auto_766145 - BLOCK
      ?auto_766146 - BLOCK
    )
    :vars
    (
      ?auto_766147 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_766145 ) ( ON ?auto_766146 ?auto_766147 ) ( CLEAR ?auto_766146 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_766143 ) ( ON ?auto_766144 ?auto_766143 ) ( ON ?auto_766145 ?auto_766144 ) ( not ( = ?auto_766143 ?auto_766144 ) ) ( not ( = ?auto_766143 ?auto_766145 ) ) ( not ( = ?auto_766143 ?auto_766146 ) ) ( not ( = ?auto_766143 ?auto_766147 ) ) ( not ( = ?auto_766144 ?auto_766145 ) ) ( not ( = ?auto_766144 ?auto_766146 ) ) ( not ( = ?auto_766144 ?auto_766147 ) ) ( not ( = ?auto_766145 ?auto_766146 ) ) ( not ( = ?auto_766145 ?auto_766147 ) ) ( not ( = ?auto_766146 ?auto_766147 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_766146 ?auto_766147 )
      ( !STACK ?auto_766146 ?auto_766145 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_766161 - BLOCK
      ?auto_766162 - BLOCK
      ?auto_766163 - BLOCK
      ?auto_766164 - BLOCK
    )
    :vars
    (
      ?auto_766165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766164 ?auto_766165 ) ( ON-TABLE ?auto_766161 ) ( ON ?auto_766162 ?auto_766161 ) ( not ( = ?auto_766161 ?auto_766162 ) ) ( not ( = ?auto_766161 ?auto_766163 ) ) ( not ( = ?auto_766161 ?auto_766164 ) ) ( not ( = ?auto_766161 ?auto_766165 ) ) ( not ( = ?auto_766162 ?auto_766163 ) ) ( not ( = ?auto_766162 ?auto_766164 ) ) ( not ( = ?auto_766162 ?auto_766165 ) ) ( not ( = ?auto_766163 ?auto_766164 ) ) ( not ( = ?auto_766163 ?auto_766165 ) ) ( not ( = ?auto_766164 ?auto_766165 ) ) ( CLEAR ?auto_766162 ) ( ON ?auto_766163 ?auto_766164 ) ( CLEAR ?auto_766163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_766161 ?auto_766162 ?auto_766163 )
      ( MAKE-4PILE ?auto_766161 ?auto_766162 ?auto_766163 ?auto_766164 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_766179 - BLOCK
      ?auto_766180 - BLOCK
      ?auto_766181 - BLOCK
      ?auto_766182 - BLOCK
    )
    :vars
    (
      ?auto_766183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766182 ?auto_766183 ) ( ON-TABLE ?auto_766179 ) ( not ( = ?auto_766179 ?auto_766180 ) ) ( not ( = ?auto_766179 ?auto_766181 ) ) ( not ( = ?auto_766179 ?auto_766182 ) ) ( not ( = ?auto_766179 ?auto_766183 ) ) ( not ( = ?auto_766180 ?auto_766181 ) ) ( not ( = ?auto_766180 ?auto_766182 ) ) ( not ( = ?auto_766180 ?auto_766183 ) ) ( not ( = ?auto_766181 ?auto_766182 ) ) ( not ( = ?auto_766181 ?auto_766183 ) ) ( not ( = ?auto_766182 ?auto_766183 ) ) ( ON ?auto_766181 ?auto_766182 ) ( CLEAR ?auto_766179 ) ( ON ?auto_766180 ?auto_766181 ) ( CLEAR ?auto_766180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_766179 ?auto_766180 )
      ( MAKE-4PILE ?auto_766179 ?auto_766180 ?auto_766181 ?auto_766182 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_766197 - BLOCK
      ?auto_766198 - BLOCK
      ?auto_766199 - BLOCK
      ?auto_766200 - BLOCK
    )
    :vars
    (
      ?auto_766201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766200 ?auto_766201 ) ( not ( = ?auto_766197 ?auto_766198 ) ) ( not ( = ?auto_766197 ?auto_766199 ) ) ( not ( = ?auto_766197 ?auto_766200 ) ) ( not ( = ?auto_766197 ?auto_766201 ) ) ( not ( = ?auto_766198 ?auto_766199 ) ) ( not ( = ?auto_766198 ?auto_766200 ) ) ( not ( = ?auto_766198 ?auto_766201 ) ) ( not ( = ?auto_766199 ?auto_766200 ) ) ( not ( = ?auto_766199 ?auto_766201 ) ) ( not ( = ?auto_766200 ?auto_766201 ) ) ( ON ?auto_766199 ?auto_766200 ) ( ON ?auto_766198 ?auto_766199 ) ( ON ?auto_766197 ?auto_766198 ) ( CLEAR ?auto_766197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_766197 )
      ( MAKE-4PILE ?auto_766197 ?auto_766198 ?auto_766199 ?auto_766200 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_766216 - BLOCK
      ?auto_766217 - BLOCK
      ?auto_766218 - BLOCK
      ?auto_766219 - BLOCK
      ?auto_766220 - BLOCK
    )
    :vars
    (
      ?auto_766221 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_766219 ) ( ON ?auto_766220 ?auto_766221 ) ( CLEAR ?auto_766220 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_766216 ) ( ON ?auto_766217 ?auto_766216 ) ( ON ?auto_766218 ?auto_766217 ) ( ON ?auto_766219 ?auto_766218 ) ( not ( = ?auto_766216 ?auto_766217 ) ) ( not ( = ?auto_766216 ?auto_766218 ) ) ( not ( = ?auto_766216 ?auto_766219 ) ) ( not ( = ?auto_766216 ?auto_766220 ) ) ( not ( = ?auto_766216 ?auto_766221 ) ) ( not ( = ?auto_766217 ?auto_766218 ) ) ( not ( = ?auto_766217 ?auto_766219 ) ) ( not ( = ?auto_766217 ?auto_766220 ) ) ( not ( = ?auto_766217 ?auto_766221 ) ) ( not ( = ?auto_766218 ?auto_766219 ) ) ( not ( = ?auto_766218 ?auto_766220 ) ) ( not ( = ?auto_766218 ?auto_766221 ) ) ( not ( = ?auto_766219 ?auto_766220 ) ) ( not ( = ?auto_766219 ?auto_766221 ) ) ( not ( = ?auto_766220 ?auto_766221 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_766220 ?auto_766221 )
      ( !STACK ?auto_766220 ?auto_766219 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_766238 - BLOCK
      ?auto_766239 - BLOCK
      ?auto_766240 - BLOCK
      ?auto_766241 - BLOCK
      ?auto_766242 - BLOCK
    )
    :vars
    (
      ?auto_766243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766242 ?auto_766243 ) ( ON-TABLE ?auto_766238 ) ( ON ?auto_766239 ?auto_766238 ) ( ON ?auto_766240 ?auto_766239 ) ( not ( = ?auto_766238 ?auto_766239 ) ) ( not ( = ?auto_766238 ?auto_766240 ) ) ( not ( = ?auto_766238 ?auto_766241 ) ) ( not ( = ?auto_766238 ?auto_766242 ) ) ( not ( = ?auto_766238 ?auto_766243 ) ) ( not ( = ?auto_766239 ?auto_766240 ) ) ( not ( = ?auto_766239 ?auto_766241 ) ) ( not ( = ?auto_766239 ?auto_766242 ) ) ( not ( = ?auto_766239 ?auto_766243 ) ) ( not ( = ?auto_766240 ?auto_766241 ) ) ( not ( = ?auto_766240 ?auto_766242 ) ) ( not ( = ?auto_766240 ?auto_766243 ) ) ( not ( = ?auto_766241 ?auto_766242 ) ) ( not ( = ?auto_766241 ?auto_766243 ) ) ( not ( = ?auto_766242 ?auto_766243 ) ) ( CLEAR ?auto_766240 ) ( ON ?auto_766241 ?auto_766242 ) ( CLEAR ?auto_766241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_766238 ?auto_766239 ?auto_766240 ?auto_766241 )
      ( MAKE-5PILE ?auto_766238 ?auto_766239 ?auto_766240 ?auto_766241 ?auto_766242 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_766260 - BLOCK
      ?auto_766261 - BLOCK
      ?auto_766262 - BLOCK
      ?auto_766263 - BLOCK
      ?auto_766264 - BLOCK
    )
    :vars
    (
      ?auto_766265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766264 ?auto_766265 ) ( ON-TABLE ?auto_766260 ) ( ON ?auto_766261 ?auto_766260 ) ( not ( = ?auto_766260 ?auto_766261 ) ) ( not ( = ?auto_766260 ?auto_766262 ) ) ( not ( = ?auto_766260 ?auto_766263 ) ) ( not ( = ?auto_766260 ?auto_766264 ) ) ( not ( = ?auto_766260 ?auto_766265 ) ) ( not ( = ?auto_766261 ?auto_766262 ) ) ( not ( = ?auto_766261 ?auto_766263 ) ) ( not ( = ?auto_766261 ?auto_766264 ) ) ( not ( = ?auto_766261 ?auto_766265 ) ) ( not ( = ?auto_766262 ?auto_766263 ) ) ( not ( = ?auto_766262 ?auto_766264 ) ) ( not ( = ?auto_766262 ?auto_766265 ) ) ( not ( = ?auto_766263 ?auto_766264 ) ) ( not ( = ?auto_766263 ?auto_766265 ) ) ( not ( = ?auto_766264 ?auto_766265 ) ) ( ON ?auto_766263 ?auto_766264 ) ( CLEAR ?auto_766261 ) ( ON ?auto_766262 ?auto_766263 ) ( CLEAR ?auto_766262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_766260 ?auto_766261 ?auto_766262 )
      ( MAKE-5PILE ?auto_766260 ?auto_766261 ?auto_766262 ?auto_766263 ?auto_766264 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_766282 - BLOCK
      ?auto_766283 - BLOCK
      ?auto_766284 - BLOCK
      ?auto_766285 - BLOCK
      ?auto_766286 - BLOCK
    )
    :vars
    (
      ?auto_766287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766286 ?auto_766287 ) ( ON-TABLE ?auto_766282 ) ( not ( = ?auto_766282 ?auto_766283 ) ) ( not ( = ?auto_766282 ?auto_766284 ) ) ( not ( = ?auto_766282 ?auto_766285 ) ) ( not ( = ?auto_766282 ?auto_766286 ) ) ( not ( = ?auto_766282 ?auto_766287 ) ) ( not ( = ?auto_766283 ?auto_766284 ) ) ( not ( = ?auto_766283 ?auto_766285 ) ) ( not ( = ?auto_766283 ?auto_766286 ) ) ( not ( = ?auto_766283 ?auto_766287 ) ) ( not ( = ?auto_766284 ?auto_766285 ) ) ( not ( = ?auto_766284 ?auto_766286 ) ) ( not ( = ?auto_766284 ?auto_766287 ) ) ( not ( = ?auto_766285 ?auto_766286 ) ) ( not ( = ?auto_766285 ?auto_766287 ) ) ( not ( = ?auto_766286 ?auto_766287 ) ) ( ON ?auto_766285 ?auto_766286 ) ( ON ?auto_766284 ?auto_766285 ) ( CLEAR ?auto_766282 ) ( ON ?auto_766283 ?auto_766284 ) ( CLEAR ?auto_766283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_766282 ?auto_766283 )
      ( MAKE-5PILE ?auto_766282 ?auto_766283 ?auto_766284 ?auto_766285 ?auto_766286 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_766304 - BLOCK
      ?auto_766305 - BLOCK
      ?auto_766306 - BLOCK
      ?auto_766307 - BLOCK
      ?auto_766308 - BLOCK
    )
    :vars
    (
      ?auto_766309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766308 ?auto_766309 ) ( not ( = ?auto_766304 ?auto_766305 ) ) ( not ( = ?auto_766304 ?auto_766306 ) ) ( not ( = ?auto_766304 ?auto_766307 ) ) ( not ( = ?auto_766304 ?auto_766308 ) ) ( not ( = ?auto_766304 ?auto_766309 ) ) ( not ( = ?auto_766305 ?auto_766306 ) ) ( not ( = ?auto_766305 ?auto_766307 ) ) ( not ( = ?auto_766305 ?auto_766308 ) ) ( not ( = ?auto_766305 ?auto_766309 ) ) ( not ( = ?auto_766306 ?auto_766307 ) ) ( not ( = ?auto_766306 ?auto_766308 ) ) ( not ( = ?auto_766306 ?auto_766309 ) ) ( not ( = ?auto_766307 ?auto_766308 ) ) ( not ( = ?auto_766307 ?auto_766309 ) ) ( not ( = ?auto_766308 ?auto_766309 ) ) ( ON ?auto_766307 ?auto_766308 ) ( ON ?auto_766306 ?auto_766307 ) ( ON ?auto_766305 ?auto_766306 ) ( ON ?auto_766304 ?auto_766305 ) ( CLEAR ?auto_766304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_766304 )
      ( MAKE-5PILE ?auto_766304 ?auto_766305 ?auto_766306 ?auto_766307 ?auto_766308 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_766327 - BLOCK
      ?auto_766328 - BLOCK
      ?auto_766329 - BLOCK
      ?auto_766330 - BLOCK
      ?auto_766331 - BLOCK
      ?auto_766332 - BLOCK
    )
    :vars
    (
      ?auto_766333 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_766331 ) ( ON ?auto_766332 ?auto_766333 ) ( CLEAR ?auto_766332 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_766327 ) ( ON ?auto_766328 ?auto_766327 ) ( ON ?auto_766329 ?auto_766328 ) ( ON ?auto_766330 ?auto_766329 ) ( ON ?auto_766331 ?auto_766330 ) ( not ( = ?auto_766327 ?auto_766328 ) ) ( not ( = ?auto_766327 ?auto_766329 ) ) ( not ( = ?auto_766327 ?auto_766330 ) ) ( not ( = ?auto_766327 ?auto_766331 ) ) ( not ( = ?auto_766327 ?auto_766332 ) ) ( not ( = ?auto_766327 ?auto_766333 ) ) ( not ( = ?auto_766328 ?auto_766329 ) ) ( not ( = ?auto_766328 ?auto_766330 ) ) ( not ( = ?auto_766328 ?auto_766331 ) ) ( not ( = ?auto_766328 ?auto_766332 ) ) ( not ( = ?auto_766328 ?auto_766333 ) ) ( not ( = ?auto_766329 ?auto_766330 ) ) ( not ( = ?auto_766329 ?auto_766331 ) ) ( not ( = ?auto_766329 ?auto_766332 ) ) ( not ( = ?auto_766329 ?auto_766333 ) ) ( not ( = ?auto_766330 ?auto_766331 ) ) ( not ( = ?auto_766330 ?auto_766332 ) ) ( not ( = ?auto_766330 ?auto_766333 ) ) ( not ( = ?auto_766331 ?auto_766332 ) ) ( not ( = ?auto_766331 ?auto_766333 ) ) ( not ( = ?auto_766332 ?auto_766333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_766332 ?auto_766333 )
      ( !STACK ?auto_766332 ?auto_766331 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_766353 - BLOCK
      ?auto_766354 - BLOCK
      ?auto_766355 - BLOCK
      ?auto_766356 - BLOCK
      ?auto_766357 - BLOCK
      ?auto_766358 - BLOCK
    )
    :vars
    (
      ?auto_766359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766358 ?auto_766359 ) ( ON-TABLE ?auto_766353 ) ( ON ?auto_766354 ?auto_766353 ) ( ON ?auto_766355 ?auto_766354 ) ( ON ?auto_766356 ?auto_766355 ) ( not ( = ?auto_766353 ?auto_766354 ) ) ( not ( = ?auto_766353 ?auto_766355 ) ) ( not ( = ?auto_766353 ?auto_766356 ) ) ( not ( = ?auto_766353 ?auto_766357 ) ) ( not ( = ?auto_766353 ?auto_766358 ) ) ( not ( = ?auto_766353 ?auto_766359 ) ) ( not ( = ?auto_766354 ?auto_766355 ) ) ( not ( = ?auto_766354 ?auto_766356 ) ) ( not ( = ?auto_766354 ?auto_766357 ) ) ( not ( = ?auto_766354 ?auto_766358 ) ) ( not ( = ?auto_766354 ?auto_766359 ) ) ( not ( = ?auto_766355 ?auto_766356 ) ) ( not ( = ?auto_766355 ?auto_766357 ) ) ( not ( = ?auto_766355 ?auto_766358 ) ) ( not ( = ?auto_766355 ?auto_766359 ) ) ( not ( = ?auto_766356 ?auto_766357 ) ) ( not ( = ?auto_766356 ?auto_766358 ) ) ( not ( = ?auto_766356 ?auto_766359 ) ) ( not ( = ?auto_766357 ?auto_766358 ) ) ( not ( = ?auto_766357 ?auto_766359 ) ) ( not ( = ?auto_766358 ?auto_766359 ) ) ( CLEAR ?auto_766356 ) ( ON ?auto_766357 ?auto_766358 ) ( CLEAR ?auto_766357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_766353 ?auto_766354 ?auto_766355 ?auto_766356 ?auto_766357 )
      ( MAKE-6PILE ?auto_766353 ?auto_766354 ?auto_766355 ?auto_766356 ?auto_766357 ?auto_766358 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_766379 - BLOCK
      ?auto_766380 - BLOCK
      ?auto_766381 - BLOCK
      ?auto_766382 - BLOCK
      ?auto_766383 - BLOCK
      ?auto_766384 - BLOCK
    )
    :vars
    (
      ?auto_766385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766384 ?auto_766385 ) ( ON-TABLE ?auto_766379 ) ( ON ?auto_766380 ?auto_766379 ) ( ON ?auto_766381 ?auto_766380 ) ( not ( = ?auto_766379 ?auto_766380 ) ) ( not ( = ?auto_766379 ?auto_766381 ) ) ( not ( = ?auto_766379 ?auto_766382 ) ) ( not ( = ?auto_766379 ?auto_766383 ) ) ( not ( = ?auto_766379 ?auto_766384 ) ) ( not ( = ?auto_766379 ?auto_766385 ) ) ( not ( = ?auto_766380 ?auto_766381 ) ) ( not ( = ?auto_766380 ?auto_766382 ) ) ( not ( = ?auto_766380 ?auto_766383 ) ) ( not ( = ?auto_766380 ?auto_766384 ) ) ( not ( = ?auto_766380 ?auto_766385 ) ) ( not ( = ?auto_766381 ?auto_766382 ) ) ( not ( = ?auto_766381 ?auto_766383 ) ) ( not ( = ?auto_766381 ?auto_766384 ) ) ( not ( = ?auto_766381 ?auto_766385 ) ) ( not ( = ?auto_766382 ?auto_766383 ) ) ( not ( = ?auto_766382 ?auto_766384 ) ) ( not ( = ?auto_766382 ?auto_766385 ) ) ( not ( = ?auto_766383 ?auto_766384 ) ) ( not ( = ?auto_766383 ?auto_766385 ) ) ( not ( = ?auto_766384 ?auto_766385 ) ) ( ON ?auto_766383 ?auto_766384 ) ( CLEAR ?auto_766381 ) ( ON ?auto_766382 ?auto_766383 ) ( CLEAR ?auto_766382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_766379 ?auto_766380 ?auto_766381 ?auto_766382 )
      ( MAKE-6PILE ?auto_766379 ?auto_766380 ?auto_766381 ?auto_766382 ?auto_766383 ?auto_766384 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_766405 - BLOCK
      ?auto_766406 - BLOCK
      ?auto_766407 - BLOCK
      ?auto_766408 - BLOCK
      ?auto_766409 - BLOCK
      ?auto_766410 - BLOCK
    )
    :vars
    (
      ?auto_766411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766410 ?auto_766411 ) ( ON-TABLE ?auto_766405 ) ( ON ?auto_766406 ?auto_766405 ) ( not ( = ?auto_766405 ?auto_766406 ) ) ( not ( = ?auto_766405 ?auto_766407 ) ) ( not ( = ?auto_766405 ?auto_766408 ) ) ( not ( = ?auto_766405 ?auto_766409 ) ) ( not ( = ?auto_766405 ?auto_766410 ) ) ( not ( = ?auto_766405 ?auto_766411 ) ) ( not ( = ?auto_766406 ?auto_766407 ) ) ( not ( = ?auto_766406 ?auto_766408 ) ) ( not ( = ?auto_766406 ?auto_766409 ) ) ( not ( = ?auto_766406 ?auto_766410 ) ) ( not ( = ?auto_766406 ?auto_766411 ) ) ( not ( = ?auto_766407 ?auto_766408 ) ) ( not ( = ?auto_766407 ?auto_766409 ) ) ( not ( = ?auto_766407 ?auto_766410 ) ) ( not ( = ?auto_766407 ?auto_766411 ) ) ( not ( = ?auto_766408 ?auto_766409 ) ) ( not ( = ?auto_766408 ?auto_766410 ) ) ( not ( = ?auto_766408 ?auto_766411 ) ) ( not ( = ?auto_766409 ?auto_766410 ) ) ( not ( = ?auto_766409 ?auto_766411 ) ) ( not ( = ?auto_766410 ?auto_766411 ) ) ( ON ?auto_766409 ?auto_766410 ) ( ON ?auto_766408 ?auto_766409 ) ( CLEAR ?auto_766406 ) ( ON ?auto_766407 ?auto_766408 ) ( CLEAR ?auto_766407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_766405 ?auto_766406 ?auto_766407 )
      ( MAKE-6PILE ?auto_766405 ?auto_766406 ?auto_766407 ?auto_766408 ?auto_766409 ?auto_766410 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_766431 - BLOCK
      ?auto_766432 - BLOCK
      ?auto_766433 - BLOCK
      ?auto_766434 - BLOCK
      ?auto_766435 - BLOCK
      ?auto_766436 - BLOCK
    )
    :vars
    (
      ?auto_766437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766436 ?auto_766437 ) ( ON-TABLE ?auto_766431 ) ( not ( = ?auto_766431 ?auto_766432 ) ) ( not ( = ?auto_766431 ?auto_766433 ) ) ( not ( = ?auto_766431 ?auto_766434 ) ) ( not ( = ?auto_766431 ?auto_766435 ) ) ( not ( = ?auto_766431 ?auto_766436 ) ) ( not ( = ?auto_766431 ?auto_766437 ) ) ( not ( = ?auto_766432 ?auto_766433 ) ) ( not ( = ?auto_766432 ?auto_766434 ) ) ( not ( = ?auto_766432 ?auto_766435 ) ) ( not ( = ?auto_766432 ?auto_766436 ) ) ( not ( = ?auto_766432 ?auto_766437 ) ) ( not ( = ?auto_766433 ?auto_766434 ) ) ( not ( = ?auto_766433 ?auto_766435 ) ) ( not ( = ?auto_766433 ?auto_766436 ) ) ( not ( = ?auto_766433 ?auto_766437 ) ) ( not ( = ?auto_766434 ?auto_766435 ) ) ( not ( = ?auto_766434 ?auto_766436 ) ) ( not ( = ?auto_766434 ?auto_766437 ) ) ( not ( = ?auto_766435 ?auto_766436 ) ) ( not ( = ?auto_766435 ?auto_766437 ) ) ( not ( = ?auto_766436 ?auto_766437 ) ) ( ON ?auto_766435 ?auto_766436 ) ( ON ?auto_766434 ?auto_766435 ) ( ON ?auto_766433 ?auto_766434 ) ( CLEAR ?auto_766431 ) ( ON ?auto_766432 ?auto_766433 ) ( CLEAR ?auto_766432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_766431 ?auto_766432 )
      ( MAKE-6PILE ?auto_766431 ?auto_766432 ?auto_766433 ?auto_766434 ?auto_766435 ?auto_766436 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_766457 - BLOCK
      ?auto_766458 - BLOCK
      ?auto_766459 - BLOCK
      ?auto_766460 - BLOCK
      ?auto_766461 - BLOCK
      ?auto_766462 - BLOCK
    )
    :vars
    (
      ?auto_766463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766462 ?auto_766463 ) ( not ( = ?auto_766457 ?auto_766458 ) ) ( not ( = ?auto_766457 ?auto_766459 ) ) ( not ( = ?auto_766457 ?auto_766460 ) ) ( not ( = ?auto_766457 ?auto_766461 ) ) ( not ( = ?auto_766457 ?auto_766462 ) ) ( not ( = ?auto_766457 ?auto_766463 ) ) ( not ( = ?auto_766458 ?auto_766459 ) ) ( not ( = ?auto_766458 ?auto_766460 ) ) ( not ( = ?auto_766458 ?auto_766461 ) ) ( not ( = ?auto_766458 ?auto_766462 ) ) ( not ( = ?auto_766458 ?auto_766463 ) ) ( not ( = ?auto_766459 ?auto_766460 ) ) ( not ( = ?auto_766459 ?auto_766461 ) ) ( not ( = ?auto_766459 ?auto_766462 ) ) ( not ( = ?auto_766459 ?auto_766463 ) ) ( not ( = ?auto_766460 ?auto_766461 ) ) ( not ( = ?auto_766460 ?auto_766462 ) ) ( not ( = ?auto_766460 ?auto_766463 ) ) ( not ( = ?auto_766461 ?auto_766462 ) ) ( not ( = ?auto_766461 ?auto_766463 ) ) ( not ( = ?auto_766462 ?auto_766463 ) ) ( ON ?auto_766461 ?auto_766462 ) ( ON ?auto_766460 ?auto_766461 ) ( ON ?auto_766459 ?auto_766460 ) ( ON ?auto_766458 ?auto_766459 ) ( ON ?auto_766457 ?auto_766458 ) ( CLEAR ?auto_766457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_766457 )
      ( MAKE-6PILE ?auto_766457 ?auto_766458 ?auto_766459 ?auto_766460 ?auto_766461 ?auto_766462 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_766484 - BLOCK
      ?auto_766485 - BLOCK
      ?auto_766486 - BLOCK
      ?auto_766487 - BLOCK
      ?auto_766488 - BLOCK
      ?auto_766489 - BLOCK
      ?auto_766490 - BLOCK
    )
    :vars
    (
      ?auto_766491 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_766489 ) ( ON ?auto_766490 ?auto_766491 ) ( CLEAR ?auto_766490 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_766484 ) ( ON ?auto_766485 ?auto_766484 ) ( ON ?auto_766486 ?auto_766485 ) ( ON ?auto_766487 ?auto_766486 ) ( ON ?auto_766488 ?auto_766487 ) ( ON ?auto_766489 ?auto_766488 ) ( not ( = ?auto_766484 ?auto_766485 ) ) ( not ( = ?auto_766484 ?auto_766486 ) ) ( not ( = ?auto_766484 ?auto_766487 ) ) ( not ( = ?auto_766484 ?auto_766488 ) ) ( not ( = ?auto_766484 ?auto_766489 ) ) ( not ( = ?auto_766484 ?auto_766490 ) ) ( not ( = ?auto_766484 ?auto_766491 ) ) ( not ( = ?auto_766485 ?auto_766486 ) ) ( not ( = ?auto_766485 ?auto_766487 ) ) ( not ( = ?auto_766485 ?auto_766488 ) ) ( not ( = ?auto_766485 ?auto_766489 ) ) ( not ( = ?auto_766485 ?auto_766490 ) ) ( not ( = ?auto_766485 ?auto_766491 ) ) ( not ( = ?auto_766486 ?auto_766487 ) ) ( not ( = ?auto_766486 ?auto_766488 ) ) ( not ( = ?auto_766486 ?auto_766489 ) ) ( not ( = ?auto_766486 ?auto_766490 ) ) ( not ( = ?auto_766486 ?auto_766491 ) ) ( not ( = ?auto_766487 ?auto_766488 ) ) ( not ( = ?auto_766487 ?auto_766489 ) ) ( not ( = ?auto_766487 ?auto_766490 ) ) ( not ( = ?auto_766487 ?auto_766491 ) ) ( not ( = ?auto_766488 ?auto_766489 ) ) ( not ( = ?auto_766488 ?auto_766490 ) ) ( not ( = ?auto_766488 ?auto_766491 ) ) ( not ( = ?auto_766489 ?auto_766490 ) ) ( not ( = ?auto_766489 ?auto_766491 ) ) ( not ( = ?auto_766490 ?auto_766491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_766490 ?auto_766491 )
      ( !STACK ?auto_766490 ?auto_766489 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_766514 - BLOCK
      ?auto_766515 - BLOCK
      ?auto_766516 - BLOCK
      ?auto_766517 - BLOCK
      ?auto_766518 - BLOCK
      ?auto_766519 - BLOCK
      ?auto_766520 - BLOCK
    )
    :vars
    (
      ?auto_766521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766520 ?auto_766521 ) ( ON-TABLE ?auto_766514 ) ( ON ?auto_766515 ?auto_766514 ) ( ON ?auto_766516 ?auto_766515 ) ( ON ?auto_766517 ?auto_766516 ) ( ON ?auto_766518 ?auto_766517 ) ( not ( = ?auto_766514 ?auto_766515 ) ) ( not ( = ?auto_766514 ?auto_766516 ) ) ( not ( = ?auto_766514 ?auto_766517 ) ) ( not ( = ?auto_766514 ?auto_766518 ) ) ( not ( = ?auto_766514 ?auto_766519 ) ) ( not ( = ?auto_766514 ?auto_766520 ) ) ( not ( = ?auto_766514 ?auto_766521 ) ) ( not ( = ?auto_766515 ?auto_766516 ) ) ( not ( = ?auto_766515 ?auto_766517 ) ) ( not ( = ?auto_766515 ?auto_766518 ) ) ( not ( = ?auto_766515 ?auto_766519 ) ) ( not ( = ?auto_766515 ?auto_766520 ) ) ( not ( = ?auto_766515 ?auto_766521 ) ) ( not ( = ?auto_766516 ?auto_766517 ) ) ( not ( = ?auto_766516 ?auto_766518 ) ) ( not ( = ?auto_766516 ?auto_766519 ) ) ( not ( = ?auto_766516 ?auto_766520 ) ) ( not ( = ?auto_766516 ?auto_766521 ) ) ( not ( = ?auto_766517 ?auto_766518 ) ) ( not ( = ?auto_766517 ?auto_766519 ) ) ( not ( = ?auto_766517 ?auto_766520 ) ) ( not ( = ?auto_766517 ?auto_766521 ) ) ( not ( = ?auto_766518 ?auto_766519 ) ) ( not ( = ?auto_766518 ?auto_766520 ) ) ( not ( = ?auto_766518 ?auto_766521 ) ) ( not ( = ?auto_766519 ?auto_766520 ) ) ( not ( = ?auto_766519 ?auto_766521 ) ) ( not ( = ?auto_766520 ?auto_766521 ) ) ( CLEAR ?auto_766518 ) ( ON ?auto_766519 ?auto_766520 ) ( CLEAR ?auto_766519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_766514 ?auto_766515 ?auto_766516 ?auto_766517 ?auto_766518 ?auto_766519 )
      ( MAKE-7PILE ?auto_766514 ?auto_766515 ?auto_766516 ?auto_766517 ?auto_766518 ?auto_766519 ?auto_766520 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_766544 - BLOCK
      ?auto_766545 - BLOCK
      ?auto_766546 - BLOCK
      ?auto_766547 - BLOCK
      ?auto_766548 - BLOCK
      ?auto_766549 - BLOCK
      ?auto_766550 - BLOCK
    )
    :vars
    (
      ?auto_766551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766550 ?auto_766551 ) ( ON-TABLE ?auto_766544 ) ( ON ?auto_766545 ?auto_766544 ) ( ON ?auto_766546 ?auto_766545 ) ( ON ?auto_766547 ?auto_766546 ) ( not ( = ?auto_766544 ?auto_766545 ) ) ( not ( = ?auto_766544 ?auto_766546 ) ) ( not ( = ?auto_766544 ?auto_766547 ) ) ( not ( = ?auto_766544 ?auto_766548 ) ) ( not ( = ?auto_766544 ?auto_766549 ) ) ( not ( = ?auto_766544 ?auto_766550 ) ) ( not ( = ?auto_766544 ?auto_766551 ) ) ( not ( = ?auto_766545 ?auto_766546 ) ) ( not ( = ?auto_766545 ?auto_766547 ) ) ( not ( = ?auto_766545 ?auto_766548 ) ) ( not ( = ?auto_766545 ?auto_766549 ) ) ( not ( = ?auto_766545 ?auto_766550 ) ) ( not ( = ?auto_766545 ?auto_766551 ) ) ( not ( = ?auto_766546 ?auto_766547 ) ) ( not ( = ?auto_766546 ?auto_766548 ) ) ( not ( = ?auto_766546 ?auto_766549 ) ) ( not ( = ?auto_766546 ?auto_766550 ) ) ( not ( = ?auto_766546 ?auto_766551 ) ) ( not ( = ?auto_766547 ?auto_766548 ) ) ( not ( = ?auto_766547 ?auto_766549 ) ) ( not ( = ?auto_766547 ?auto_766550 ) ) ( not ( = ?auto_766547 ?auto_766551 ) ) ( not ( = ?auto_766548 ?auto_766549 ) ) ( not ( = ?auto_766548 ?auto_766550 ) ) ( not ( = ?auto_766548 ?auto_766551 ) ) ( not ( = ?auto_766549 ?auto_766550 ) ) ( not ( = ?auto_766549 ?auto_766551 ) ) ( not ( = ?auto_766550 ?auto_766551 ) ) ( ON ?auto_766549 ?auto_766550 ) ( CLEAR ?auto_766547 ) ( ON ?auto_766548 ?auto_766549 ) ( CLEAR ?auto_766548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_766544 ?auto_766545 ?auto_766546 ?auto_766547 ?auto_766548 )
      ( MAKE-7PILE ?auto_766544 ?auto_766545 ?auto_766546 ?auto_766547 ?auto_766548 ?auto_766549 ?auto_766550 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_766574 - BLOCK
      ?auto_766575 - BLOCK
      ?auto_766576 - BLOCK
      ?auto_766577 - BLOCK
      ?auto_766578 - BLOCK
      ?auto_766579 - BLOCK
      ?auto_766580 - BLOCK
    )
    :vars
    (
      ?auto_766581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766580 ?auto_766581 ) ( ON-TABLE ?auto_766574 ) ( ON ?auto_766575 ?auto_766574 ) ( ON ?auto_766576 ?auto_766575 ) ( not ( = ?auto_766574 ?auto_766575 ) ) ( not ( = ?auto_766574 ?auto_766576 ) ) ( not ( = ?auto_766574 ?auto_766577 ) ) ( not ( = ?auto_766574 ?auto_766578 ) ) ( not ( = ?auto_766574 ?auto_766579 ) ) ( not ( = ?auto_766574 ?auto_766580 ) ) ( not ( = ?auto_766574 ?auto_766581 ) ) ( not ( = ?auto_766575 ?auto_766576 ) ) ( not ( = ?auto_766575 ?auto_766577 ) ) ( not ( = ?auto_766575 ?auto_766578 ) ) ( not ( = ?auto_766575 ?auto_766579 ) ) ( not ( = ?auto_766575 ?auto_766580 ) ) ( not ( = ?auto_766575 ?auto_766581 ) ) ( not ( = ?auto_766576 ?auto_766577 ) ) ( not ( = ?auto_766576 ?auto_766578 ) ) ( not ( = ?auto_766576 ?auto_766579 ) ) ( not ( = ?auto_766576 ?auto_766580 ) ) ( not ( = ?auto_766576 ?auto_766581 ) ) ( not ( = ?auto_766577 ?auto_766578 ) ) ( not ( = ?auto_766577 ?auto_766579 ) ) ( not ( = ?auto_766577 ?auto_766580 ) ) ( not ( = ?auto_766577 ?auto_766581 ) ) ( not ( = ?auto_766578 ?auto_766579 ) ) ( not ( = ?auto_766578 ?auto_766580 ) ) ( not ( = ?auto_766578 ?auto_766581 ) ) ( not ( = ?auto_766579 ?auto_766580 ) ) ( not ( = ?auto_766579 ?auto_766581 ) ) ( not ( = ?auto_766580 ?auto_766581 ) ) ( ON ?auto_766579 ?auto_766580 ) ( ON ?auto_766578 ?auto_766579 ) ( CLEAR ?auto_766576 ) ( ON ?auto_766577 ?auto_766578 ) ( CLEAR ?auto_766577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_766574 ?auto_766575 ?auto_766576 ?auto_766577 )
      ( MAKE-7PILE ?auto_766574 ?auto_766575 ?auto_766576 ?auto_766577 ?auto_766578 ?auto_766579 ?auto_766580 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_766604 - BLOCK
      ?auto_766605 - BLOCK
      ?auto_766606 - BLOCK
      ?auto_766607 - BLOCK
      ?auto_766608 - BLOCK
      ?auto_766609 - BLOCK
      ?auto_766610 - BLOCK
    )
    :vars
    (
      ?auto_766611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766610 ?auto_766611 ) ( ON-TABLE ?auto_766604 ) ( ON ?auto_766605 ?auto_766604 ) ( not ( = ?auto_766604 ?auto_766605 ) ) ( not ( = ?auto_766604 ?auto_766606 ) ) ( not ( = ?auto_766604 ?auto_766607 ) ) ( not ( = ?auto_766604 ?auto_766608 ) ) ( not ( = ?auto_766604 ?auto_766609 ) ) ( not ( = ?auto_766604 ?auto_766610 ) ) ( not ( = ?auto_766604 ?auto_766611 ) ) ( not ( = ?auto_766605 ?auto_766606 ) ) ( not ( = ?auto_766605 ?auto_766607 ) ) ( not ( = ?auto_766605 ?auto_766608 ) ) ( not ( = ?auto_766605 ?auto_766609 ) ) ( not ( = ?auto_766605 ?auto_766610 ) ) ( not ( = ?auto_766605 ?auto_766611 ) ) ( not ( = ?auto_766606 ?auto_766607 ) ) ( not ( = ?auto_766606 ?auto_766608 ) ) ( not ( = ?auto_766606 ?auto_766609 ) ) ( not ( = ?auto_766606 ?auto_766610 ) ) ( not ( = ?auto_766606 ?auto_766611 ) ) ( not ( = ?auto_766607 ?auto_766608 ) ) ( not ( = ?auto_766607 ?auto_766609 ) ) ( not ( = ?auto_766607 ?auto_766610 ) ) ( not ( = ?auto_766607 ?auto_766611 ) ) ( not ( = ?auto_766608 ?auto_766609 ) ) ( not ( = ?auto_766608 ?auto_766610 ) ) ( not ( = ?auto_766608 ?auto_766611 ) ) ( not ( = ?auto_766609 ?auto_766610 ) ) ( not ( = ?auto_766609 ?auto_766611 ) ) ( not ( = ?auto_766610 ?auto_766611 ) ) ( ON ?auto_766609 ?auto_766610 ) ( ON ?auto_766608 ?auto_766609 ) ( ON ?auto_766607 ?auto_766608 ) ( CLEAR ?auto_766605 ) ( ON ?auto_766606 ?auto_766607 ) ( CLEAR ?auto_766606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_766604 ?auto_766605 ?auto_766606 )
      ( MAKE-7PILE ?auto_766604 ?auto_766605 ?auto_766606 ?auto_766607 ?auto_766608 ?auto_766609 ?auto_766610 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_766634 - BLOCK
      ?auto_766635 - BLOCK
      ?auto_766636 - BLOCK
      ?auto_766637 - BLOCK
      ?auto_766638 - BLOCK
      ?auto_766639 - BLOCK
      ?auto_766640 - BLOCK
    )
    :vars
    (
      ?auto_766641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766640 ?auto_766641 ) ( ON-TABLE ?auto_766634 ) ( not ( = ?auto_766634 ?auto_766635 ) ) ( not ( = ?auto_766634 ?auto_766636 ) ) ( not ( = ?auto_766634 ?auto_766637 ) ) ( not ( = ?auto_766634 ?auto_766638 ) ) ( not ( = ?auto_766634 ?auto_766639 ) ) ( not ( = ?auto_766634 ?auto_766640 ) ) ( not ( = ?auto_766634 ?auto_766641 ) ) ( not ( = ?auto_766635 ?auto_766636 ) ) ( not ( = ?auto_766635 ?auto_766637 ) ) ( not ( = ?auto_766635 ?auto_766638 ) ) ( not ( = ?auto_766635 ?auto_766639 ) ) ( not ( = ?auto_766635 ?auto_766640 ) ) ( not ( = ?auto_766635 ?auto_766641 ) ) ( not ( = ?auto_766636 ?auto_766637 ) ) ( not ( = ?auto_766636 ?auto_766638 ) ) ( not ( = ?auto_766636 ?auto_766639 ) ) ( not ( = ?auto_766636 ?auto_766640 ) ) ( not ( = ?auto_766636 ?auto_766641 ) ) ( not ( = ?auto_766637 ?auto_766638 ) ) ( not ( = ?auto_766637 ?auto_766639 ) ) ( not ( = ?auto_766637 ?auto_766640 ) ) ( not ( = ?auto_766637 ?auto_766641 ) ) ( not ( = ?auto_766638 ?auto_766639 ) ) ( not ( = ?auto_766638 ?auto_766640 ) ) ( not ( = ?auto_766638 ?auto_766641 ) ) ( not ( = ?auto_766639 ?auto_766640 ) ) ( not ( = ?auto_766639 ?auto_766641 ) ) ( not ( = ?auto_766640 ?auto_766641 ) ) ( ON ?auto_766639 ?auto_766640 ) ( ON ?auto_766638 ?auto_766639 ) ( ON ?auto_766637 ?auto_766638 ) ( ON ?auto_766636 ?auto_766637 ) ( CLEAR ?auto_766634 ) ( ON ?auto_766635 ?auto_766636 ) ( CLEAR ?auto_766635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_766634 ?auto_766635 )
      ( MAKE-7PILE ?auto_766634 ?auto_766635 ?auto_766636 ?auto_766637 ?auto_766638 ?auto_766639 ?auto_766640 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_766664 - BLOCK
      ?auto_766665 - BLOCK
      ?auto_766666 - BLOCK
      ?auto_766667 - BLOCK
      ?auto_766668 - BLOCK
      ?auto_766669 - BLOCK
      ?auto_766670 - BLOCK
    )
    :vars
    (
      ?auto_766671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766670 ?auto_766671 ) ( not ( = ?auto_766664 ?auto_766665 ) ) ( not ( = ?auto_766664 ?auto_766666 ) ) ( not ( = ?auto_766664 ?auto_766667 ) ) ( not ( = ?auto_766664 ?auto_766668 ) ) ( not ( = ?auto_766664 ?auto_766669 ) ) ( not ( = ?auto_766664 ?auto_766670 ) ) ( not ( = ?auto_766664 ?auto_766671 ) ) ( not ( = ?auto_766665 ?auto_766666 ) ) ( not ( = ?auto_766665 ?auto_766667 ) ) ( not ( = ?auto_766665 ?auto_766668 ) ) ( not ( = ?auto_766665 ?auto_766669 ) ) ( not ( = ?auto_766665 ?auto_766670 ) ) ( not ( = ?auto_766665 ?auto_766671 ) ) ( not ( = ?auto_766666 ?auto_766667 ) ) ( not ( = ?auto_766666 ?auto_766668 ) ) ( not ( = ?auto_766666 ?auto_766669 ) ) ( not ( = ?auto_766666 ?auto_766670 ) ) ( not ( = ?auto_766666 ?auto_766671 ) ) ( not ( = ?auto_766667 ?auto_766668 ) ) ( not ( = ?auto_766667 ?auto_766669 ) ) ( not ( = ?auto_766667 ?auto_766670 ) ) ( not ( = ?auto_766667 ?auto_766671 ) ) ( not ( = ?auto_766668 ?auto_766669 ) ) ( not ( = ?auto_766668 ?auto_766670 ) ) ( not ( = ?auto_766668 ?auto_766671 ) ) ( not ( = ?auto_766669 ?auto_766670 ) ) ( not ( = ?auto_766669 ?auto_766671 ) ) ( not ( = ?auto_766670 ?auto_766671 ) ) ( ON ?auto_766669 ?auto_766670 ) ( ON ?auto_766668 ?auto_766669 ) ( ON ?auto_766667 ?auto_766668 ) ( ON ?auto_766666 ?auto_766667 ) ( ON ?auto_766665 ?auto_766666 ) ( ON ?auto_766664 ?auto_766665 ) ( CLEAR ?auto_766664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_766664 )
      ( MAKE-7PILE ?auto_766664 ?auto_766665 ?auto_766666 ?auto_766667 ?auto_766668 ?auto_766669 ?auto_766670 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_766695 - BLOCK
      ?auto_766696 - BLOCK
      ?auto_766697 - BLOCK
      ?auto_766698 - BLOCK
      ?auto_766699 - BLOCK
      ?auto_766700 - BLOCK
      ?auto_766701 - BLOCK
      ?auto_766702 - BLOCK
    )
    :vars
    (
      ?auto_766703 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_766701 ) ( ON ?auto_766702 ?auto_766703 ) ( CLEAR ?auto_766702 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_766695 ) ( ON ?auto_766696 ?auto_766695 ) ( ON ?auto_766697 ?auto_766696 ) ( ON ?auto_766698 ?auto_766697 ) ( ON ?auto_766699 ?auto_766698 ) ( ON ?auto_766700 ?auto_766699 ) ( ON ?auto_766701 ?auto_766700 ) ( not ( = ?auto_766695 ?auto_766696 ) ) ( not ( = ?auto_766695 ?auto_766697 ) ) ( not ( = ?auto_766695 ?auto_766698 ) ) ( not ( = ?auto_766695 ?auto_766699 ) ) ( not ( = ?auto_766695 ?auto_766700 ) ) ( not ( = ?auto_766695 ?auto_766701 ) ) ( not ( = ?auto_766695 ?auto_766702 ) ) ( not ( = ?auto_766695 ?auto_766703 ) ) ( not ( = ?auto_766696 ?auto_766697 ) ) ( not ( = ?auto_766696 ?auto_766698 ) ) ( not ( = ?auto_766696 ?auto_766699 ) ) ( not ( = ?auto_766696 ?auto_766700 ) ) ( not ( = ?auto_766696 ?auto_766701 ) ) ( not ( = ?auto_766696 ?auto_766702 ) ) ( not ( = ?auto_766696 ?auto_766703 ) ) ( not ( = ?auto_766697 ?auto_766698 ) ) ( not ( = ?auto_766697 ?auto_766699 ) ) ( not ( = ?auto_766697 ?auto_766700 ) ) ( not ( = ?auto_766697 ?auto_766701 ) ) ( not ( = ?auto_766697 ?auto_766702 ) ) ( not ( = ?auto_766697 ?auto_766703 ) ) ( not ( = ?auto_766698 ?auto_766699 ) ) ( not ( = ?auto_766698 ?auto_766700 ) ) ( not ( = ?auto_766698 ?auto_766701 ) ) ( not ( = ?auto_766698 ?auto_766702 ) ) ( not ( = ?auto_766698 ?auto_766703 ) ) ( not ( = ?auto_766699 ?auto_766700 ) ) ( not ( = ?auto_766699 ?auto_766701 ) ) ( not ( = ?auto_766699 ?auto_766702 ) ) ( not ( = ?auto_766699 ?auto_766703 ) ) ( not ( = ?auto_766700 ?auto_766701 ) ) ( not ( = ?auto_766700 ?auto_766702 ) ) ( not ( = ?auto_766700 ?auto_766703 ) ) ( not ( = ?auto_766701 ?auto_766702 ) ) ( not ( = ?auto_766701 ?auto_766703 ) ) ( not ( = ?auto_766702 ?auto_766703 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_766702 ?auto_766703 )
      ( !STACK ?auto_766702 ?auto_766701 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_766729 - BLOCK
      ?auto_766730 - BLOCK
      ?auto_766731 - BLOCK
      ?auto_766732 - BLOCK
      ?auto_766733 - BLOCK
      ?auto_766734 - BLOCK
      ?auto_766735 - BLOCK
      ?auto_766736 - BLOCK
    )
    :vars
    (
      ?auto_766737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766736 ?auto_766737 ) ( ON-TABLE ?auto_766729 ) ( ON ?auto_766730 ?auto_766729 ) ( ON ?auto_766731 ?auto_766730 ) ( ON ?auto_766732 ?auto_766731 ) ( ON ?auto_766733 ?auto_766732 ) ( ON ?auto_766734 ?auto_766733 ) ( not ( = ?auto_766729 ?auto_766730 ) ) ( not ( = ?auto_766729 ?auto_766731 ) ) ( not ( = ?auto_766729 ?auto_766732 ) ) ( not ( = ?auto_766729 ?auto_766733 ) ) ( not ( = ?auto_766729 ?auto_766734 ) ) ( not ( = ?auto_766729 ?auto_766735 ) ) ( not ( = ?auto_766729 ?auto_766736 ) ) ( not ( = ?auto_766729 ?auto_766737 ) ) ( not ( = ?auto_766730 ?auto_766731 ) ) ( not ( = ?auto_766730 ?auto_766732 ) ) ( not ( = ?auto_766730 ?auto_766733 ) ) ( not ( = ?auto_766730 ?auto_766734 ) ) ( not ( = ?auto_766730 ?auto_766735 ) ) ( not ( = ?auto_766730 ?auto_766736 ) ) ( not ( = ?auto_766730 ?auto_766737 ) ) ( not ( = ?auto_766731 ?auto_766732 ) ) ( not ( = ?auto_766731 ?auto_766733 ) ) ( not ( = ?auto_766731 ?auto_766734 ) ) ( not ( = ?auto_766731 ?auto_766735 ) ) ( not ( = ?auto_766731 ?auto_766736 ) ) ( not ( = ?auto_766731 ?auto_766737 ) ) ( not ( = ?auto_766732 ?auto_766733 ) ) ( not ( = ?auto_766732 ?auto_766734 ) ) ( not ( = ?auto_766732 ?auto_766735 ) ) ( not ( = ?auto_766732 ?auto_766736 ) ) ( not ( = ?auto_766732 ?auto_766737 ) ) ( not ( = ?auto_766733 ?auto_766734 ) ) ( not ( = ?auto_766733 ?auto_766735 ) ) ( not ( = ?auto_766733 ?auto_766736 ) ) ( not ( = ?auto_766733 ?auto_766737 ) ) ( not ( = ?auto_766734 ?auto_766735 ) ) ( not ( = ?auto_766734 ?auto_766736 ) ) ( not ( = ?auto_766734 ?auto_766737 ) ) ( not ( = ?auto_766735 ?auto_766736 ) ) ( not ( = ?auto_766735 ?auto_766737 ) ) ( not ( = ?auto_766736 ?auto_766737 ) ) ( CLEAR ?auto_766734 ) ( ON ?auto_766735 ?auto_766736 ) ( CLEAR ?auto_766735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_766729 ?auto_766730 ?auto_766731 ?auto_766732 ?auto_766733 ?auto_766734 ?auto_766735 )
      ( MAKE-8PILE ?auto_766729 ?auto_766730 ?auto_766731 ?auto_766732 ?auto_766733 ?auto_766734 ?auto_766735 ?auto_766736 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_766763 - BLOCK
      ?auto_766764 - BLOCK
      ?auto_766765 - BLOCK
      ?auto_766766 - BLOCK
      ?auto_766767 - BLOCK
      ?auto_766768 - BLOCK
      ?auto_766769 - BLOCK
      ?auto_766770 - BLOCK
    )
    :vars
    (
      ?auto_766771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766770 ?auto_766771 ) ( ON-TABLE ?auto_766763 ) ( ON ?auto_766764 ?auto_766763 ) ( ON ?auto_766765 ?auto_766764 ) ( ON ?auto_766766 ?auto_766765 ) ( ON ?auto_766767 ?auto_766766 ) ( not ( = ?auto_766763 ?auto_766764 ) ) ( not ( = ?auto_766763 ?auto_766765 ) ) ( not ( = ?auto_766763 ?auto_766766 ) ) ( not ( = ?auto_766763 ?auto_766767 ) ) ( not ( = ?auto_766763 ?auto_766768 ) ) ( not ( = ?auto_766763 ?auto_766769 ) ) ( not ( = ?auto_766763 ?auto_766770 ) ) ( not ( = ?auto_766763 ?auto_766771 ) ) ( not ( = ?auto_766764 ?auto_766765 ) ) ( not ( = ?auto_766764 ?auto_766766 ) ) ( not ( = ?auto_766764 ?auto_766767 ) ) ( not ( = ?auto_766764 ?auto_766768 ) ) ( not ( = ?auto_766764 ?auto_766769 ) ) ( not ( = ?auto_766764 ?auto_766770 ) ) ( not ( = ?auto_766764 ?auto_766771 ) ) ( not ( = ?auto_766765 ?auto_766766 ) ) ( not ( = ?auto_766765 ?auto_766767 ) ) ( not ( = ?auto_766765 ?auto_766768 ) ) ( not ( = ?auto_766765 ?auto_766769 ) ) ( not ( = ?auto_766765 ?auto_766770 ) ) ( not ( = ?auto_766765 ?auto_766771 ) ) ( not ( = ?auto_766766 ?auto_766767 ) ) ( not ( = ?auto_766766 ?auto_766768 ) ) ( not ( = ?auto_766766 ?auto_766769 ) ) ( not ( = ?auto_766766 ?auto_766770 ) ) ( not ( = ?auto_766766 ?auto_766771 ) ) ( not ( = ?auto_766767 ?auto_766768 ) ) ( not ( = ?auto_766767 ?auto_766769 ) ) ( not ( = ?auto_766767 ?auto_766770 ) ) ( not ( = ?auto_766767 ?auto_766771 ) ) ( not ( = ?auto_766768 ?auto_766769 ) ) ( not ( = ?auto_766768 ?auto_766770 ) ) ( not ( = ?auto_766768 ?auto_766771 ) ) ( not ( = ?auto_766769 ?auto_766770 ) ) ( not ( = ?auto_766769 ?auto_766771 ) ) ( not ( = ?auto_766770 ?auto_766771 ) ) ( ON ?auto_766769 ?auto_766770 ) ( CLEAR ?auto_766767 ) ( ON ?auto_766768 ?auto_766769 ) ( CLEAR ?auto_766768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_766763 ?auto_766764 ?auto_766765 ?auto_766766 ?auto_766767 ?auto_766768 )
      ( MAKE-8PILE ?auto_766763 ?auto_766764 ?auto_766765 ?auto_766766 ?auto_766767 ?auto_766768 ?auto_766769 ?auto_766770 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_766797 - BLOCK
      ?auto_766798 - BLOCK
      ?auto_766799 - BLOCK
      ?auto_766800 - BLOCK
      ?auto_766801 - BLOCK
      ?auto_766802 - BLOCK
      ?auto_766803 - BLOCK
      ?auto_766804 - BLOCK
    )
    :vars
    (
      ?auto_766805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766804 ?auto_766805 ) ( ON-TABLE ?auto_766797 ) ( ON ?auto_766798 ?auto_766797 ) ( ON ?auto_766799 ?auto_766798 ) ( ON ?auto_766800 ?auto_766799 ) ( not ( = ?auto_766797 ?auto_766798 ) ) ( not ( = ?auto_766797 ?auto_766799 ) ) ( not ( = ?auto_766797 ?auto_766800 ) ) ( not ( = ?auto_766797 ?auto_766801 ) ) ( not ( = ?auto_766797 ?auto_766802 ) ) ( not ( = ?auto_766797 ?auto_766803 ) ) ( not ( = ?auto_766797 ?auto_766804 ) ) ( not ( = ?auto_766797 ?auto_766805 ) ) ( not ( = ?auto_766798 ?auto_766799 ) ) ( not ( = ?auto_766798 ?auto_766800 ) ) ( not ( = ?auto_766798 ?auto_766801 ) ) ( not ( = ?auto_766798 ?auto_766802 ) ) ( not ( = ?auto_766798 ?auto_766803 ) ) ( not ( = ?auto_766798 ?auto_766804 ) ) ( not ( = ?auto_766798 ?auto_766805 ) ) ( not ( = ?auto_766799 ?auto_766800 ) ) ( not ( = ?auto_766799 ?auto_766801 ) ) ( not ( = ?auto_766799 ?auto_766802 ) ) ( not ( = ?auto_766799 ?auto_766803 ) ) ( not ( = ?auto_766799 ?auto_766804 ) ) ( not ( = ?auto_766799 ?auto_766805 ) ) ( not ( = ?auto_766800 ?auto_766801 ) ) ( not ( = ?auto_766800 ?auto_766802 ) ) ( not ( = ?auto_766800 ?auto_766803 ) ) ( not ( = ?auto_766800 ?auto_766804 ) ) ( not ( = ?auto_766800 ?auto_766805 ) ) ( not ( = ?auto_766801 ?auto_766802 ) ) ( not ( = ?auto_766801 ?auto_766803 ) ) ( not ( = ?auto_766801 ?auto_766804 ) ) ( not ( = ?auto_766801 ?auto_766805 ) ) ( not ( = ?auto_766802 ?auto_766803 ) ) ( not ( = ?auto_766802 ?auto_766804 ) ) ( not ( = ?auto_766802 ?auto_766805 ) ) ( not ( = ?auto_766803 ?auto_766804 ) ) ( not ( = ?auto_766803 ?auto_766805 ) ) ( not ( = ?auto_766804 ?auto_766805 ) ) ( ON ?auto_766803 ?auto_766804 ) ( ON ?auto_766802 ?auto_766803 ) ( CLEAR ?auto_766800 ) ( ON ?auto_766801 ?auto_766802 ) ( CLEAR ?auto_766801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_766797 ?auto_766798 ?auto_766799 ?auto_766800 ?auto_766801 )
      ( MAKE-8PILE ?auto_766797 ?auto_766798 ?auto_766799 ?auto_766800 ?auto_766801 ?auto_766802 ?auto_766803 ?auto_766804 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_766831 - BLOCK
      ?auto_766832 - BLOCK
      ?auto_766833 - BLOCK
      ?auto_766834 - BLOCK
      ?auto_766835 - BLOCK
      ?auto_766836 - BLOCK
      ?auto_766837 - BLOCK
      ?auto_766838 - BLOCK
    )
    :vars
    (
      ?auto_766839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766838 ?auto_766839 ) ( ON-TABLE ?auto_766831 ) ( ON ?auto_766832 ?auto_766831 ) ( ON ?auto_766833 ?auto_766832 ) ( not ( = ?auto_766831 ?auto_766832 ) ) ( not ( = ?auto_766831 ?auto_766833 ) ) ( not ( = ?auto_766831 ?auto_766834 ) ) ( not ( = ?auto_766831 ?auto_766835 ) ) ( not ( = ?auto_766831 ?auto_766836 ) ) ( not ( = ?auto_766831 ?auto_766837 ) ) ( not ( = ?auto_766831 ?auto_766838 ) ) ( not ( = ?auto_766831 ?auto_766839 ) ) ( not ( = ?auto_766832 ?auto_766833 ) ) ( not ( = ?auto_766832 ?auto_766834 ) ) ( not ( = ?auto_766832 ?auto_766835 ) ) ( not ( = ?auto_766832 ?auto_766836 ) ) ( not ( = ?auto_766832 ?auto_766837 ) ) ( not ( = ?auto_766832 ?auto_766838 ) ) ( not ( = ?auto_766832 ?auto_766839 ) ) ( not ( = ?auto_766833 ?auto_766834 ) ) ( not ( = ?auto_766833 ?auto_766835 ) ) ( not ( = ?auto_766833 ?auto_766836 ) ) ( not ( = ?auto_766833 ?auto_766837 ) ) ( not ( = ?auto_766833 ?auto_766838 ) ) ( not ( = ?auto_766833 ?auto_766839 ) ) ( not ( = ?auto_766834 ?auto_766835 ) ) ( not ( = ?auto_766834 ?auto_766836 ) ) ( not ( = ?auto_766834 ?auto_766837 ) ) ( not ( = ?auto_766834 ?auto_766838 ) ) ( not ( = ?auto_766834 ?auto_766839 ) ) ( not ( = ?auto_766835 ?auto_766836 ) ) ( not ( = ?auto_766835 ?auto_766837 ) ) ( not ( = ?auto_766835 ?auto_766838 ) ) ( not ( = ?auto_766835 ?auto_766839 ) ) ( not ( = ?auto_766836 ?auto_766837 ) ) ( not ( = ?auto_766836 ?auto_766838 ) ) ( not ( = ?auto_766836 ?auto_766839 ) ) ( not ( = ?auto_766837 ?auto_766838 ) ) ( not ( = ?auto_766837 ?auto_766839 ) ) ( not ( = ?auto_766838 ?auto_766839 ) ) ( ON ?auto_766837 ?auto_766838 ) ( ON ?auto_766836 ?auto_766837 ) ( ON ?auto_766835 ?auto_766836 ) ( CLEAR ?auto_766833 ) ( ON ?auto_766834 ?auto_766835 ) ( CLEAR ?auto_766834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_766831 ?auto_766832 ?auto_766833 ?auto_766834 )
      ( MAKE-8PILE ?auto_766831 ?auto_766832 ?auto_766833 ?auto_766834 ?auto_766835 ?auto_766836 ?auto_766837 ?auto_766838 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_766865 - BLOCK
      ?auto_766866 - BLOCK
      ?auto_766867 - BLOCK
      ?auto_766868 - BLOCK
      ?auto_766869 - BLOCK
      ?auto_766870 - BLOCK
      ?auto_766871 - BLOCK
      ?auto_766872 - BLOCK
    )
    :vars
    (
      ?auto_766873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766872 ?auto_766873 ) ( ON-TABLE ?auto_766865 ) ( ON ?auto_766866 ?auto_766865 ) ( not ( = ?auto_766865 ?auto_766866 ) ) ( not ( = ?auto_766865 ?auto_766867 ) ) ( not ( = ?auto_766865 ?auto_766868 ) ) ( not ( = ?auto_766865 ?auto_766869 ) ) ( not ( = ?auto_766865 ?auto_766870 ) ) ( not ( = ?auto_766865 ?auto_766871 ) ) ( not ( = ?auto_766865 ?auto_766872 ) ) ( not ( = ?auto_766865 ?auto_766873 ) ) ( not ( = ?auto_766866 ?auto_766867 ) ) ( not ( = ?auto_766866 ?auto_766868 ) ) ( not ( = ?auto_766866 ?auto_766869 ) ) ( not ( = ?auto_766866 ?auto_766870 ) ) ( not ( = ?auto_766866 ?auto_766871 ) ) ( not ( = ?auto_766866 ?auto_766872 ) ) ( not ( = ?auto_766866 ?auto_766873 ) ) ( not ( = ?auto_766867 ?auto_766868 ) ) ( not ( = ?auto_766867 ?auto_766869 ) ) ( not ( = ?auto_766867 ?auto_766870 ) ) ( not ( = ?auto_766867 ?auto_766871 ) ) ( not ( = ?auto_766867 ?auto_766872 ) ) ( not ( = ?auto_766867 ?auto_766873 ) ) ( not ( = ?auto_766868 ?auto_766869 ) ) ( not ( = ?auto_766868 ?auto_766870 ) ) ( not ( = ?auto_766868 ?auto_766871 ) ) ( not ( = ?auto_766868 ?auto_766872 ) ) ( not ( = ?auto_766868 ?auto_766873 ) ) ( not ( = ?auto_766869 ?auto_766870 ) ) ( not ( = ?auto_766869 ?auto_766871 ) ) ( not ( = ?auto_766869 ?auto_766872 ) ) ( not ( = ?auto_766869 ?auto_766873 ) ) ( not ( = ?auto_766870 ?auto_766871 ) ) ( not ( = ?auto_766870 ?auto_766872 ) ) ( not ( = ?auto_766870 ?auto_766873 ) ) ( not ( = ?auto_766871 ?auto_766872 ) ) ( not ( = ?auto_766871 ?auto_766873 ) ) ( not ( = ?auto_766872 ?auto_766873 ) ) ( ON ?auto_766871 ?auto_766872 ) ( ON ?auto_766870 ?auto_766871 ) ( ON ?auto_766869 ?auto_766870 ) ( ON ?auto_766868 ?auto_766869 ) ( CLEAR ?auto_766866 ) ( ON ?auto_766867 ?auto_766868 ) ( CLEAR ?auto_766867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_766865 ?auto_766866 ?auto_766867 )
      ( MAKE-8PILE ?auto_766865 ?auto_766866 ?auto_766867 ?auto_766868 ?auto_766869 ?auto_766870 ?auto_766871 ?auto_766872 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_766899 - BLOCK
      ?auto_766900 - BLOCK
      ?auto_766901 - BLOCK
      ?auto_766902 - BLOCK
      ?auto_766903 - BLOCK
      ?auto_766904 - BLOCK
      ?auto_766905 - BLOCK
      ?auto_766906 - BLOCK
    )
    :vars
    (
      ?auto_766907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766906 ?auto_766907 ) ( ON-TABLE ?auto_766899 ) ( not ( = ?auto_766899 ?auto_766900 ) ) ( not ( = ?auto_766899 ?auto_766901 ) ) ( not ( = ?auto_766899 ?auto_766902 ) ) ( not ( = ?auto_766899 ?auto_766903 ) ) ( not ( = ?auto_766899 ?auto_766904 ) ) ( not ( = ?auto_766899 ?auto_766905 ) ) ( not ( = ?auto_766899 ?auto_766906 ) ) ( not ( = ?auto_766899 ?auto_766907 ) ) ( not ( = ?auto_766900 ?auto_766901 ) ) ( not ( = ?auto_766900 ?auto_766902 ) ) ( not ( = ?auto_766900 ?auto_766903 ) ) ( not ( = ?auto_766900 ?auto_766904 ) ) ( not ( = ?auto_766900 ?auto_766905 ) ) ( not ( = ?auto_766900 ?auto_766906 ) ) ( not ( = ?auto_766900 ?auto_766907 ) ) ( not ( = ?auto_766901 ?auto_766902 ) ) ( not ( = ?auto_766901 ?auto_766903 ) ) ( not ( = ?auto_766901 ?auto_766904 ) ) ( not ( = ?auto_766901 ?auto_766905 ) ) ( not ( = ?auto_766901 ?auto_766906 ) ) ( not ( = ?auto_766901 ?auto_766907 ) ) ( not ( = ?auto_766902 ?auto_766903 ) ) ( not ( = ?auto_766902 ?auto_766904 ) ) ( not ( = ?auto_766902 ?auto_766905 ) ) ( not ( = ?auto_766902 ?auto_766906 ) ) ( not ( = ?auto_766902 ?auto_766907 ) ) ( not ( = ?auto_766903 ?auto_766904 ) ) ( not ( = ?auto_766903 ?auto_766905 ) ) ( not ( = ?auto_766903 ?auto_766906 ) ) ( not ( = ?auto_766903 ?auto_766907 ) ) ( not ( = ?auto_766904 ?auto_766905 ) ) ( not ( = ?auto_766904 ?auto_766906 ) ) ( not ( = ?auto_766904 ?auto_766907 ) ) ( not ( = ?auto_766905 ?auto_766906 ) ) ( not ( = ?auto_766905 ?auto_766907 ) ) ( not ( = ?auto_766906 ?auto_766907 ) ) ( ON ?auto_766905 ?auto_766906 ) ( ON ?auto_766904 ?auto_766905 ) ( ON ?auto_766903 ?auto_766904 ) ( ON ?auto_766902 ?auto_766903 ) ( ON ?auto_766901 ?auto_766902 ) ( CLEAR ?auto_766899 ) ( ON ?auto_766900 ?auto_766901 ) ( CLEAR ?auto_766900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_766899 ?auto_766900 )
      ( MAKE-8PILE ?auto_766899 ?auto_766900 ?auto_766901 ?auto_766902 ?auto_766903 ?auto_766904 ?auto_766905 ?auto_766906 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_766933 - BLOCK
      ?auto_766934 - BLOCK
      ?auto_766935 - BLOCK
      ?auto_766936 - BLOCK
      ?auto_766937 - BLOCK
      ?auto_766938 - BLOCK
      ?auto_766939 - BLOCK
      ?auto_766940 - BLOCK
    )
    :vars
    (
      ?auto_766941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_766940 ?auto_766941 ) ( not ( = ?auto_766933 ?auto_766934 ) ) ( not ( = ?auto_766933 ?auto_766935 ) ) ( not ( = ?auto_766933 ?auto_766936 ) ) ( not ( = ?auto_766933 ?auto_766937 ) ) ( not ( = ?auto_766933 ?auto_766938 ) ) ( not ( = ?auto_766933 ?auto_766939 ) ) ( not ( = ?auto_766933 ?auto_766940 ) ) ( not ( = ?auto_766933 ?auto_766941 ) ) ( not ( = ?auto_766934 ?auto_766935 ) ) ( not ( = ?auto_766934 ?auto_766936 ) ) ( not ( = ?auto_766934 ?auto_766937 ) ) ( not ( = ?auto_766934 ?auto_766938 ) ) ( not ( = ?auto_766934 ?auto_766939 ) ) ( not ( = ?auto_766934 ?auto_766940 ) ) ( not ( = ?auto_766934 ?auto_766941 ) ) ( not ( = ?auto_766935 ?auto_766936 ) ) ( not ( = ?auto_766935 ?auto_766937 ) ) ( not ( = ?auto_766935 ?auto_766938 ) ) ( not ( = ?auto_766935 ?auto_766939 ) ) ( not ( = ?auto_766935 ?auto_766940 ) ) ( not ( = ?auto_766935 ?auto_766941 ) ) ( not ( = ?auto_766936 ?auto_766937 ) ) ( not ( = ?auto_766936 ?auto_766938 ) ) ( not ( = ?auto_766936 ?auto_766939 ) ) ( not ( = ?auto_766936 ?auto_766940 ) ) ( not ( = ?auto_766936 ?auto_766941 ) ) ( not ( = ?auto_766937 ?auto_766938 ) ) ( not ( = ?auto_766937 ?auto_766939 ) ) ( not ( = ?auto_766937 ?auto_766940 ) ) ( not ( = ?auto_766937 ?auto_766941 ) ) ( not ( = ?auto_766938 ?auto_766939 ) ) ( not ( = ?auto_766938 ?auto_766940 ) ) ( not ( = ?auto_766938 ?auto_766941 ) ) ( not ( = ?auto_766939 ?auto_766940 ) ) ( not ( = ?auto_766939 ?auto_766941 ) ) ( not ( = ?auto_766940 ?auto_766941 ) ) ( ON ?auto_766939 ?auto_766940 ) ( ON ?auto_766938 ?auto_766939 ) ( ON ?auto_766937 ?auto_766938 ) ( ON ?auto_766936 ?auto_766937 ) ( ON ?auto_766935 ?auto_766936 ) ( ON ?auto_766934 ?auto_766935 ) ( ON ?auto_766933 ?auto_766934 ) ( CLEAR ?auto_766933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_766933 )
      ( MAKE-8PILE ?auto_766933 ?auto_766934 ?auto_766935 ?auto_766936 ?auto_766937 ?auto_766938 ?auto_766939 ?auto_766940 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_766968 - BLOCK
      ?auto_766969 - BLOCK
      ?auto_766970 - BLOCK
      ?auto_766971 - BLOCK
      ?auto_766972 - BLOCK
      ?auto_766973 - BLOCK
      ?auto_766974 - BLOCK
      ?auto_766975 - BLOCK
      ?auto_766976 - BLOCK
    )
    :vars
    (
      ?auto_766977 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_766975 ) ( ON ?auto_766976 ?auto_766977 ) ( CLEAR ?auto_766976 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_766968 ) ( ON ?auto_766969 ?auto_766968 ) ( ON ?auto_766970 ?auto_766969 ) ( ON ?auto_766971 ?auto_766970 ) ( ON ?auto_766972 ?auto_766971 ) ( ON ?auto_766973 ?auto_766972 ) ( ON ?auto_766974 ?auto_766973 ) ( ON ?auto_766975 ?auto_766974 ) ( not ( = ?auto_766968 ?auto_766969 ) ) ( not ( = ?auto_766968 ?auto_766970 ) ) ( not ( = ?auto_766968 ?auto_766971 ) ) ( not ( = ?auto_766968 ?auto_766972 ) ) ( not ( = ?auto_766968 ?auto_766973 ) ) ( not ( = ?auto_766968 ?auto_766974 ) ) ( not ( = ?auto_766968 ?auto_766975 ) ) ( not ( = ?auto_766968 ?auto_766976 ) ) ( not ( = ?auto_766968 ?auto_766977 ) ) ( not ( = ?auto_766969 ?auto_766970 ) ) ( not ( = ?auto_766969 ?auto_766971 ) ) ( not ( = ?auto_766969 ?auto_766972 ) ) ( not ( = ?auto_766969 ?auto_766973 ) ) ( not ( = ?auto_766969 ?auto_766974 ) ) ( not ( = ?auto_766969 ?auto_766975 ) ) ( not ( = ?auto_766969 ?auto_766976 ) ) ( not ( = ?auto_766969 ?auto_766977 ) ) ( not ( = ?auto_766970 ?auto_766971 ) ) ( not ( = ?auto_766970 ?auto_766972 ) ) ( not ( = ?auto_766970 ?auto_766973 ) ) ( not ( = ?auto_766970 ?auto_766974 ) ) ( not ( = ?auto_766970 ?auto_766975 ) ) ( not ( = ?auto_766970 ?auto_766976 ) ) ( not ( = ?auto_766970 ?auto_766977 ) ) ( not ( = ?auto_766971 ?auto_766972 ) ) ( not ( = ?auto_766971 ?auto_766973 ) ) ( not ( = ?auto_766971 ?auto_766974 ) ) ( not ( = ?auto_766971 ?auto_766975 ) ) ( not ( = ?auto_766971 ?auto_766976 ) ) ( not ( = ?auto_766971 ?auto_766977 ) ) ( not ( = ?auto_766972 ?auto_766973 ) ) ( not ( = ?auto_766972 ?auto_766974 ) ) ( not ( = ?auto_766972 ?auto_766975 ) ) ( not ( = ?auto_766972 ?auto_766976 ) ) ( not ( = ?auto_766972 ?auto_766977 ) ) ( not ( = ?auto_766973 ?auto_766974 ) ) ( not ( = ?auto_766973 ?auto_766975 ) ) ( not ( = ?auto_766973 ?auto_766976 ) ) ( not ( = ?auto_766973 ?auto_766977 ) ) ( not ( = ?auto_766974 ?auto_766975 ) ) ( not ( = ?auto_766974 ?auto_766976 ) ) ( not ( = ?auto_766974 ?auto_766977 ) ) ( not ( = ?auto_766975 ?auto_766976 ) ) ( not ( = ?auto_766975 ?auto_766977 ) ) ( not ( = ?auto_766976 ?auto_766977 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_766976 ?auto_766977 )
      ( !STACK ?auto_766976 ?auto_766975 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_767006 - BLOCK
      ?auto_767007 - BLOCK
      ?auto_767008 - BLOCK
      ?auto_767009 - BLOCK
      ?auto_767010 - BLOCK
      ?auto_767011 - BLOCK
      ?auto_767012 - BLOCK
      ?auto_767013 - BLOCK
      ?auto_767014 - BLOCK
    )
    :vars
    (
      ?auto_767015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767014 ?auto_767015 ) ( ON-TABLE ?auto_767006 ) ( ON ?auto_767007 ?auto_767006 ) ( ON ?auto_767008 ?auto_767007 ) ( ON ?auto_767009 ?auto_767008 ) ( ON ?auto_767010 ?auto_767009 ) ( ON ?auto_767011 ?auto_767010 ) ( ON ?auto_767012 ?auto_767011 ) ( not ( = ?auto_767006 ?auto_767007 ) ) ( not ( = ?auto_767006 ?auto_767008 ) ) ( not ( = ?auto_767006 ?auto_767009 ) ) ( not ( = ?auto_767006 ?auto_767010 ) ) ( not ( = ?auto_767006 ?auto_767011 ) ) ( not ( = ?auto_767006 ?auto_767012 ) ) ( not ( = ?auto_767006 ?auto_767013 ) ) ( not ( = ?auto_767006 ?auto_767014 ) ) ( not ( = ?auto_767006 ?auto_767015 ) ) ( not ( = ?auto_767007 ?auto_767008 ) ) ( not ( = ?auto_767007 ?auto_767009 ) ) ( not ( = ?auto_767007 ?auto_767010 ) ) ( not ( = ?auto_767007 ?auto_767011 ) ) ( not ( = ?auto_767007 ?auto_767012 ) ) ( not ( = ?auto_767007 ?auto_767013 ) ) ( not ( = ?auto_767007 ?auto_767014 ) ) ( not ( = ?auto_767007 ?auto_767015 ) ) ( not ( = ?auto_767008 ?auto_767009 ) ) ( not ( = ?auto_767008 ?auto_767010 ) ) ( not ( = ?auto_767008 ?auto_767011 ) ) ( not ( = ?auto_767008 ?auto_767012 ) ) ( not ( = ?auto_767008 ?auto_767013 ) ) ( not ( = ?auto_767008 ?auto_767014 ) ) ( not ( = ?auto_767008 ?auto_767015 ) ) ( not ( = ?auto_767009 ?auto_767010 ) ) ( not ( = ?auto_767009 ?auto_767011 ) ) ( not ( = ?auto_767009 ?auto_767012 ) ) ( not ( = ?auto_767009 ?auto_767013 ) ) ( not ( = ?auto_767009 ?auto_767014 ) ) ( not ( = ?auto_767009 ?auto_767015 ) ) ( not ( = ?auto_767010 ?auto_767011 ) ) ( not ( = ?auto_767010 ?auto_767012 ) ) ( not ( = ?auto_767010 ?auto_767013 ) ) ( not ( = ?auto_767010 ?auto_767014 ) ) ( not ( = ?auto_767010 ?auto_767015 ) ) ( not ( = ?auto_767011 ?auto_767012 ) ) ( not ( = ?auto_767011 ?auto_767013 ) ) ( not ( = ?auto_767011 ?auto_767014 ) ) ( not ( = ?auto_767011 ?auto_767015 ) ) ( not ( = ?auto_767012 ?auto_767013 ) ) ( not ( = ?auto_767012 ?auto_767014 ) ) ( not ( = ?auto_767012 ?auto_767015 ) ) ( not ( = ?auto_767013 ?auto_767014 ) ) ( not ( = ?auto_767013 ?auto_767015 ) ) ( not ( = ?auto_767014 ?auto_767015 ) ) ( CLEAR ?auto_767012 ) ( ON ?auto_767013 ?auto_767014 ) ( CLEAR ?auto_767013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_767006 ?auto_767007 ?auto_767008 ?auto_767009 ?auto_767010 ?auto_767011 ?auto_767012 ?auto_767013 )
      ( MAKE-9PILE ?auto_767006 ?auto_767007 ?auto_767008 ?auto_767009 ?auto_767010 ?auto_767011 ?auto_767012 ?auto_767013 ?auto_767014 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_767044 - BLOCK
      ?auto_767045 - BLOCK
      ?auto_767046 - BLOCK
      ?auto_767047 - BLOCK
      ?auto_767048 - BLOCK
      ?auto_767049 - BLOCK
      ?auto_767050 - BLOCK
      ?auto_767051 - BLOCK
      ?auto_767052 - BLOCK
    )
    :vars
    (
      ?auto_767053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767052 ?auto_767053 ) ( ON-TABLE ?auto_767044 ) ( ON ?auto_767045 ?auto_767044 ) ( ON ?auto_767046 ?auto_767045 ) ( ON ?auto_767047 ?auto_767046 ) ( ON ?auto_767048 ?auto_767047 ) ( ON ?auto_767049 ?auto_767048 ) ( not ( = ?auto_767044 ?auto_767045 ) ) ( not ( = ?auto_767044 ?auto_767046 ) ) ( not ( = ?auto_767044 ?auto_767047 ) ) ( not ( = ?auto_767044 ?auto_767048 ) ) ( not ( = ?auto_767044 ?auto_767049 ) ) ( not ( = ?auto_767044 ?auto_767050 ) ) ( not ( = ?auto_767044 ?auto_767051 ) ) ( not ( = ?auto_767044 ?auto_767052 ) ) ( not ( = ?auto_767044 ?auto_767053 ) ) ( not ( = ?auto_767045 ?auto_767046 ) ) ( not ( = ?auto_767045 ?auto_767047 ) ) ( not ( = ?auto_767045 ?auto_767048 ) ) ( not ( = ?auto_767045 ?auto_767049 ) ) ( not ( = ?auto_767045 ?auto_767050 ) ) ( not ( = ?auto_767045 ?auto_767051 ) ) ( not ( = ?auto_767045 ?auto_767052 ) ) ( not ( = ?auto_767045 ?auto_767053 ) ) ( not ( = ?auto_767046 ?auto_767047 ) ) ( not ( = ?auto_767046 ?auto_767048 ) ) ( not ( = ?auto_767046 ?auto_767049 ) ) ( not ( = ?auto_767046 ?auto_767050 ) ) ( not ( = ?auto_767046 ?auto_767051 ) ) ( not ( = ?auto_767046 ?auto_767052 ) ) ( not ( = ?auto_767046 ?auto_767053 ) ) ( not ( = ?auto_767047 ?auto_767048 ) ) ( not ( = ?auto_767047 ?auto_767049 ) ) ( not ( = ?auto_767047 ?auto_767050 ) ) ( not ( = ?auto_767047 ?auto_767051 ) ) ( not ( = ?auto_767047 ?auto_767052 ) ) ( not ( = ?auto_767047 ?auto_767053 ) ) ( not ( = ?auto_767048 ?auto_767049 ) ) ( not ( = ?auto_767048 ?auto_767050 ) ) ( not ( = ?auto_767048 ?auto_767051 ) ) ( not ( = ?auto_767048 ?auto_767052 ) ) ( not ( = ?auto_767048 ?auto_767053 ) ) ( not ( = ?auto_767049 ?auto_767050 ) ) ( not ( = ?auto_767049 ?auto_767051 ) ) ( not ( = ?auto_767049 ?auto_767052 ) ) ( not ( = ?auto_767049 ?auto_767053 ) ) ( not ( = ?auto_767050 ?auto_767051 ) ) ( not ( = ?auto_767050 ?auto_767052 ) ) ( not ( = ?auto_767050 ?auto_767053 ) ) ( not ( = ?auto_767051 ?auto_767052 ) ) ( not ( = ?auto_767051 ?auto_767053 ) ) ( not ( = ?auto_767052 ?auto_767053 ) ) ( ON ?auto_767051 ?auto_767052 ) ( CLEAR ?auto_767049 ) ( ON ?auto_767050 ?auto_767051 ) ( CLEAR ?auto_767050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_767044 ?auto_767045 ?auto_767046 ?auto_767047 ?auto_767048 ?auto_767049 ?auto_767050 )
      ( MAKE-9PILE ?auto_767044 ?auto_767045 ?auto_767046 ?auto_767047 ?auto_767048 ?auto_767049 ?auto_767050 ?auto_767051 ?auto_767052 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_767082 - BLOCK
      ?auto_767083 - BLOCK
      ?auto_767084 - BLOCK
      ?auto_767085 - BLOCK
      ?auto_767086 - BLOCK
      ?auto_767087 - BLOCK
      ?auto_767088 - BLOCK
      ?auto_767089 - BLOCK
      ?auto_767090 - BLOCK
    )
    :vars
    (
      ?auto_767091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767090 ?auto_767091 ) ( ON-TABLE ?auto_767082 ) ( ON ?auto_767083 ?auto_767082 ) ( ON ?auto_767084 ?auto_767083 ) ( ON ?auto_767085 ?auto_767084 ) ( ON ?auto_767086 ?auto_767085 ) ( not ( = ?auto_767082 ?auto_767083 ) ) ( not ( = ?auto_767082 ?auto_767084 ) ) ( not ( = ?auto_767082 ?auto_767085 ) ) ( not ( = ?auto_767082 ?auto_767086 ) ) ( not ( = ?auto_767082 ?auto_767087 ) ) ( not ( = ?auto_767082 ?auto_767088 ) ) ( not ( = ?auto_767082 ?auto_767089 ) ) ( not ( = ?auto_767082 ?auto_767090 ) ) ( not ( = ?auto_767082 ?auto_767091 ) ) ( not ( = ?auto_767083 ?auto_767084 ) ) ( not ( = ?auto_767083 ?auto_767085 ) ) ( not ( = ?auto_767083 ?auto_767086 ) ) ( not ( = ?auto_767083 ?auto_767087 ) ) ( not ( = ?auto_767083 ?auto_767088 ) ) ( not ( = ?auto_767083 ?auto_767089 ) ) ( not ( = ?auto_767083 ?auto_767090 ) ) ( not ( = ?auto_767083 ?auto_767091 ) ) ( not ( = ?auto_767084 ?auto_767085 ) ) ( not ( = ?auto_767084 ?auto_767086 ) ) ( not ( = ?auto_767084 ?auto_767087 ) ) ( not ( = ?auto_767084 ?auto_767088 ) ) ( not ( = ?auto_767084 ?auto_767089 ) ) ( not ( = ?auto_767084 ?auto_767090 ) ) ( not ( = ?auto_767084 ?auto_767091 ) ) ( not ( = ?auto_767085 ?auto_767086 ) ) ( not ( = ?auto_767085 ?auto_767087 ) ) ( not ( = ?auto_767085 ?auto_767088 ) ) ( not ( = ?auto_767085 ?auto_767089 ) ) ( not ( = ?auto_767085 ?auto_767090 ) ) ( not ( = ?auto_767085 ?auto_767091 ) ) ( not ( = ?auto_767086 ?auto_767087 ) ) ( not ( = ?auto_767086 ?auto_767088 ) ) ( not ( = ?auto_767086 ?auto_767089 ) ) ( not ( = ?auto_767086 ?auto_767090 ) ) ( not ( = ?auto_767086 ?auto_767091 ) ) ( not ( = ?auto_767087 ?auto_767088 ) ) ( not ( = ?auto_767087 ?auto_767089 ) ) ( not ( = ?auto_767087 ?auto_767090 ) ) ( not ( = ?auto_767087 ?auto_767091 ) ) ( not ( = ?auto_767088 ?auto_767089 ) ) ( not ( = ?auto_767088 ?auto_767090 ) ) ( not ( = ?auto_767088 ?auto_767091 ) ) ( not ( = ?auto_767089 ?auto_767090 ) ) ( not ( = ?auto_767089 ?auto_767091 ) ) ( not ( = ?auto_767090 ?auto_767091 ) ) ( ON ?auto_767089 ?auto_767090 ) ( ON ?auto_767088 ?auto_767089 ) ( CLEAR ?auto_767086 ) ( ON ?auto_767087 ?auto_767088 ) ( CLEAR ?auto_767087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_767082 ?auto_767083 ?auto_767084 ?auto_767085 ?auto_767086 ?auto_767087 )
      ( MAKE-9PILE ?auto_767082 ?auto_767083 ?auto_767084 ?auto_767085 ?auto_767086 ?auto_767087 ?auto_767088 ?auto_767089 ?auto_767090 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_767120 - BLOCK
      ?auto_767121 - BLOCK
      ?auto_767122 - BLOCK
      ?auto_767123 - BLOCK
      ?auto_767124 - BLOCK
      ?auto_767125 - BLOCK
      ?auto_767126 - BLOCK
      ?auto_767127 - BLOCK
      ?auto_767128 - BLOCK
    )
    :vars
    (
      ?auto_767129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767128 ?auto_767129 ) ( ON-TABLE ?auto_767120 ) ( ON ?auto_767121 ?auto_767120 ) ( ON ?auto_767122 ?auto_767121 ) ( ON ?auto_767123 ?auto_767122 ) ( not ( = ?auto_767120 ?auto_767121 ) ) ( not ( = ?auto_767120 ?auto_767122 ) ) ( not ( = ?auto_767120 ?auto_767123 ) ) ( not ( = ?auto_767120 ?auto_767124 ) ) ( not ( = ?auto_767120 ?auto_767125 ) ) ( not ( = ?auto_767120 ?auto_767126 ) ) ( not ( = ?auto_767120 ?auto_767127 ) ) ( not ( = ?auto_767120 ?auto_767128 ) ) ( not ( = ?auto_767120 ?auto_767129 ) ) ( not ( = ?auto_767121 ?auto_767122 ) ) ( not ( = ?auto_767121 ?auto_767123 ) ) ( not ( = ?auto_767121 ?auto_767124 ) ) ( not ( = ?auto_767121 ?auto_767125 ) ) ( not ( = ?auto_767121 ?auto_767126 ) ) ( not ( = ?auto_767121 ?auto_767127 ) ) ( not ( = ?auto_767121 ?auto_767128 ) ) ( not ( = ?auto_767121 ?auto_767129 ) ) ( not ( = ?auto_767122 ?auto_767123 ) ) ( not ( = ?auto_767122 ?auto_767124 ) ) ( not ( = ?auto_767122 ?auto_767125 ) ) ( not ( = ?auto_767122 ?auto_767126 ) ) ( not ( = ?auto_767122 ?auto_767127 ) ) ( not ( = ?auto_767122 ?auto_767128 ) ) ( not ( = ?auto_767122 ?auto_767129 ) ) ( not ( = ?auto_767123 ?auto_767124 ) ) ( not ( = ?auto_767123 ?auto_767125 ) ) ( not ( = ?auto_767123 ?auto_767126 ) ) ( not ( = ?auto_767123 ?auto_767127 ) ) ( not ( = ?auto_767123 ?auto_767128 ) ) ( not ( = ?auto_767123 ?auto_767129 ) ) ( not ( = ?auto_767124 ?auto_767125 ) ) ( not ( = ?auto_767124 ?auto_767126 ) ) ( not ( = ?auto_767124 ?auto_767127 ) ) ( not ( = ?auto_767124 ?auto_767128 ) ) ( not ( = ?auto_767124 ?auto_767129 ) ) ( not ( = ?auto_767125 ?auto_767126 ) ) ( not ( = ?auto_767125 ?auto_767127 ) ) ( not ( = ?auto_767125 ?auto_767128 ) ) ( not ( = ?auto_767125 ?auto_767129 ) ) ( not ( = ?auto_767126 ?auto_767127 ) ) ( not ( = ?auto_767126 ?auto_767128 ) ) ( not ( = ?auto_767126 ?auto_767129 ) ) ( not ( = ?auto_767127 ?auto_767128 ) ) ( not ( = ?auto_767127 ?auto_767129 ) ) ( not ( = ?auto_767128 ?auto_767129 ) ) ( ON ?auto_767127 ?auto_767128 ) ( ON ?auto_767126 ?auto_767127 ) ( ON ?auto_767125 ?auto_767126 ) ( CLEAR ?auto_767123 ) ( ON ?auto_767124 ?auto_767125 ) ( CLEAR ?auto_767124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_767120 ?auto_767121 ?auto_767122 ?auto_767123 ?auto_767124 )
      ( MAKE-9PILE ?auto_767120 ?auto_767121 ?auto_767122 ?auto_767123 ?auto_767124 ?auto_767125 ?auto_767126 ?auto_767127 ?auto_767128 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_767158 - BLOCK
      ?auto_767159 - BLOCK
      ?auto_767160 - BLOCK
      ?auto_767161 - BLOCK
      ?auto_767162 - BLOCK
      ?auto_767163 - BLOCK
      ?auto_767164 - BLOCK
      ?auto_767165 - BLOCK
      ?auto_767166 - BLOCK
    )
    :vars
    (
      ?auto_767167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767166 ?auto_767167 ) ( ON-TABLE ?auto_767158 ) ( ON ?auto_767159 ?auto_767158 ) ( ON ?auto_767160 ?auto_767159 ) ( not ( = ?auto_767158 ?auto_767159 ) ) ( not ( = ?auto_767158 ?auto_767160 ) ) ( not ( = ?auto_767158 ?auto_767161 ) ) ( not ( = ?auto_767158 ?auto_767162 ) ) ( not ( = ?auto_767158 ?auto_767163 ) ) ( not ( = ?auto_767158 ?auto_767164 ) ) ( not ( = ?auto_767158 ?auto_767165 ) ) ( not ( = ?auto_767158 ?auto_767166 ) ) ( not ( = ?auto_767158 ?auto_767167 ) ) ( not ( = ?auto_767159 ?auto_767160 ) ) ( not ( = ?auto_767159 ?auto_767161 ) ) ( not ( = ?auto_767159 ?auto_767162 ) ) ( not ( = ?auto_767159 ?auto_767163 ) ) ( not ( = ?auto_767159 ?auto_767164 ) ) ( not ( = ?auto_767159 ?auto_767165 ) ) ( not ( = ?auto_767159 ?auto_767166 ) ) ( not ( = ?auto_767159 ?auto_767167 ) ) ( not ( = ?auto_767160 ?auto_767161 ) ) ( not ( = ?auto_767160 ?auto_767162 ) ) ( not ( = ?auto_767160 ?auto_767163 ) ) ( not ( = ?auto_767160 ?auto_767164 ) ) ( not ( = ?auto_767160 ?auto_767165 ) ) ( not ( = ?auto_767160 ?auto_767166 ) ) ( not ( = ?auto_767160 ?auto_767167 ) ) ( not ( = ?auto_767161 ?auto_767162 ) ) ( not ( = ?auto_767161 ?auto_767163 ) ) ( not ( = ?auto_767161 ?auto_767164 ) ) ( not ( = ?auto_767161 ?auto_767165 ) ) ( not ( = ?auto_767161 ?auto_767166 ) ) ( not ( = ?auto_767161 ?auto_767167 ) ) ( not ( = ?auto_767162 ?auto_767163 ) ) ( not ( = ?auto_767162 ?auto_767164 ) ) ( not ( = ?auto_767162 ?auto_767165 ) ) ( not ( = ?auto_767162 ?auto_767166 ) ) ( not ( = ?auto_767162 ?auto_767167 ) ) ( not ( = ?auto_767163 ?auto_767164 ) ) ( not ( = ?auto_767163 ?auto_767165 ) ) ( not ( = ?auto_767163 ?auto_767166 ) ) ( not ( = ?auto_767163 ?auto_767167 ) ) ( not ( = ?auto_767164 ?auto_767165 ) ) ( not ( = ?auto_767164 ?auto_767166 ) ) ( not ( = ?auto_767164 ?auto_767167 ) ) ( not ( = ?auto_767165 ?auto_767166 ) ) ( not ( = ?auto_767165 ?auto_767167 ) ) ( not ( = ?auto_767166 ?auto_767167 ) ) ( ON ?auto_767165 ?auto_767166 ) ( ON ?auto_767164 ?auto_767165 ) ( ON ?auto_767163 ?auto_767164 ) ( ON ?auto_767162 ?auto_767163 ) ( CLEAR ?auto_767160 ) ( ON ?auto_767161 ?auto_767162 ) ( CLEAR ?auto_767161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_767158 ?auto_767159 ?auto_767160 ?auto_767161 )
      ( MAKE-9PILE ?auto_767158 ?auto_767159 ?auto_767160 ?auto_767161 ?auto_767162 ?auto_767163 ?auto_767164 ?auto_767165 ?auto_767166 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_767196 - BLOCK
      ?auto_767197 - BLOCK
      ?auto_767198 - BLOCK
      ?auto_767199 - BLOCK
      ?auto_767200 - BLOCK
      ?auto_767201 - BLOCK
      ?auto_767202 - BLOCK
      ?auto_767203 - BLOCK
      ?auto_767204 - BLOCK
    )
    :vars
    (
      ?auto_767205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767204 ?auto_767205 ) ( ON-TABLE ?auto_767196 ) ( ON ?auto_767197 ?auto_767196 ) ( not ( = ?auto_767196 ?auto_767197 ) ) ( not ( = ?auto_767196 ?auto_767198 ) ) ( not ( = ?auto_767196 ?auto_767199 ) ) ( not ( = ?auto_767196 ?auto_767200 ) ) ( not ( = ?auto_767196 ?auto_767201 ) ) ( not ( = ?auto_767196 ?auto_767202 ) ) ( not ( = ?auto_767196 ?auto_767203 ) ) ( not ( = ?auto_767196 ?auto_767204 ) ) ( not ( = ?auto_767196 ?auto_767205 ) ) ( not ( = ?auto_767197 ?auto_767198 ) ) ( not ( = ?auto_767197 ?auto_767199 ) ) ( not ( = ?auto_767197 ?auto_767200 ) ) ( not ( = ?auto_767197 ?auto_767201 ) ) ( not ( = ?auto_767197 ?auto_767202 ) ) ( not ( = ?auto_767197 ?auto_767203 ) ) ( not ( = ?auto_767197 ?auto_767204 ) ) ( not ( = ?auto_767197 ?auto_767205 ) ) ( not ( = ?auto_767198 ?auto_767199 ) ) ( not ( = ?auto_767198 ?auto_767200 ) ) ( not ( = ?auto_767198 ?auto_767201 ) ) ( not ( = ?auto_767198 ?auto_767202 ) ) ( not ( = ?auto_767198 ?auto_767203 ) ) ( not ( = ?auto_767198 ?auto_767204 ) ) ( not ( = ?auto_767198 ?auto_767205 ) ) ( not ( = ?auto_767199 ?auto_767200 ) ) ( not ( = ?auto_767199 ?auto_767201 ) ) ( not ( = ?auto_767199 ?auto_767202 ) ) ( not ( = ?auto_767199 ?auto_767203 ) ) ( not ( = ?auto_767199 ?auto_767204 ) ) ( not ( = ?auto_767199 ?auto_767205 ) ) ( not ( = ?auto_767200 ?auto_767201 ) ) ( not ( = ?auto_767200 ?auto_767202 ) ) ( not ( = ?auto_767200 ?auto_767203 ) ) ( not ( = ?auto_767200 ?auto_767204 ) ) ( not ( = ?auto_767200 ?auto_767205 ) ) ( not ( = ?auto_767201 ?auto_767202 ) ) ( not ( = ?auto_767201 ?auto_767203 ) ) ( not ( = ?auto_767201 ?auto_767204 ) ) ( not ( = ?auto_767201 ?auto_767205 ) ) ( not ( = ?auto_767202 ?auto_767203 ) ) ( not ( = ?auto_767202 ?auto_767204 ) ) ( not ( = ?auto_767202 ?auto_767205 ) ) ( not ( = ?auto_767203 ?auto_767204 ) ) ( not ( = ?auto_767203 ?auto_767205 ) ) ( not ( = ?auto_767204 ?auto_767205 ) ) ( ON ?auto_767203 ?auto_767204 ) ( ON ?auto_767202 ?auto_767203 ) ( ON ?auto_767201 ?auto_767202 ) ( ON ?auto_767200 ?auto_767201 ) ( ON ?auto_767199 ?auto_767200 ) ( CLEAR ?auto_767197 ) ( ON ?auto_767198 ?auto_767199 ) ( CLEAR ?auto_767198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_767196 ?auto_767197 ?auto_767198 )
      ( MAKE-9PILE ?auto_767196 ?auto_767197 ?auto_767198 ?auto_767199 ?auto_767200 ?auto_767201 ?auto_767202 ?auto_767203 ?auto_767204 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_767234 - BLOCK
      ?auto_767235 - BLOCK
      ?auto_767236 - BLOCK
      ?auto_767237 - BLOCK
      ?auto_767238 - BLOCK
      ?auto_767239 - BLOCK
      ?auto_767240 - BLOCK
      ?auto_767241 - BLOCK
      ?auto_767242 - BLOCK
    )
    :vars
    (
      ?auto_767243 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767242 ?auto_767243 ) ( ON-TABLE ?auto_767234 ) ( not ( = ?auto_767234 ?auto_767235 ) ) ( not ( = ?auto_767234 ?auto_767236 ) ) ( not ( = ?auto_767234 ?auto_767237 ) ) ( not ( = ?auto_767234 ?auto_767238 ) ) ( not ( = ?auto_767234 ?auto_767239 ) ) ( not ( = ?auto_767234 ?auto_767240 ) ) ( not ( = ?auto_767234 ?auto_767241 ) ) ( not ( = ?auto_767234 ?auto_767242 ) ) ( not ( = ?auto_767234 ?auto_767243 ) ) ( not ( = ?auto_767235 ?auto_767236 ) ) ( not ( = ?auto_767235 ?auto_767237 ) ) ( not ( = ?auto_767235 ?auto_767238 ) ) ( not ( = ?auto_767235 ?auto_767239 ) ) ( not ( = ?auto_767235 ?auto_767240 ) ) ( not ( = ?auto_767235 ?auto_767241 ) ) ( not ( = ?auto_767235 ?auto_767242 ) ) ( not ( = ?auto_767235 ?auto_767243 ) ) ( not ( = ?auto_767236 ?auto_767237 ) ) ( not ( = ?auto_767236 ?auto_767238 ) ) ( not ( = ?auto_767236 ?auto_767239 ) ) ( not ( = ?auto_767236 ?auto_767240 ) ) ( not ( = ?auto_767236 ?auto_767241 ) ) ( not ( = ?auto_767236 ?auto_767242 ) ) ( not ( = ?auto_767236 ?auto_767243 ) ) ( not ( = ?auto_767237 ?auto_767238 ) ) ( not ( = ?auto_767237 ?auto_767239 ) ) ( not ( = ?auto_767237 ?auto_767240 ) ) ( not ( = ?auto_767237 ?auto_767241 ) ) ( not ( = ?auto_767237 ?auto_767242 ) ) ( not ( = ?auto_767237 ?auto_767243 ) ) ( not ( = ?auto_767238 ?auto_767239 ) ) ( not ( = ?auto_767238 ?auto_767240 ) ) ( not ( = ?auto_767238 ?auto_767241 ) ) ( not ( = ?auto_767238 ?auto_767242 ) ) ( not ( = ?auto_767238 ?auto_767243 ) ) ( not ( = ?auto_767239 ?auto_767240 ) ) ( not ( = ?auto_767239 ?auto_767241 ) ) ( not ( = ?auto_767239 ?auto_767242 ) ) ( not ( = ?auto_767239 ?auto_767243 ) ) ( not ( = ?auto_767240 ?auto_767241 ) ) ( not ( = ?auto_767240 ?auto_767242 ) ) ( not ( = ?auto_767240 ?auto_767243 ) ) ( not ( = ?auto_767241 ?auto_767242 ) ) ( not ( = ?auto_767241 ?auto_767243 ) ) ( not ( = ?auto_767242 ?auto_767243 ) ) ( ON ?auto_767241 ?auto_767242 ) ( ON ?auto_767240 ?auto_767241 ) ( ON ?auto_767239 ?auto_767240 ) ( ON ?auto_767238 ?auto_767239 ) ( ON ?auto_767237 ?auto_767238 ) ( ON ?auto_767236 ?auto_767237 ) ( CLEAR ?auto_767234 ) ( ON ?auto_767235 ?auto_767236 ) ( CLEAR ?auto_767235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_767234 ?auto_767235 )
      ( MAKE-9PILE ?auto_767234 ?auto_767235 ?auto_767236 ?auto_767237 ?auto_767238 ?auto_767239 ?auto_767240 ?auto_767241 ?auto_767242 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_767272 - BLOCK
      ?auto_767273 - BLOCK
      ?auto_767274 - BLOCK
      ?auto_767275 - BLOCK
      ?auto_767276 - BLOCK
      ?auto_767277 - BLOCK
      ?auto_767278 - BLOCK
      ?auto_767279 - BLOCK
      ?auto_767280 - BLOCK
    )
    :vars
    (
      ?auto_767281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767280 ?auto_767281 ) ( not ( = ?auto_767272 ?auto_767273 ) ) ( not ( = ?auto_767272 ?auto_767274 ) ) ( not ( = ?auto_767272 ?auto_767275 ) ) ( not ( = ?auto_767272 ?auto_767276 ) ) ( not ( = ?auto_767272 ?auto_767277 ) ) ( not ( = ?auto_767272 ?auto_767278 ) ) ( not ( = ?auto_767272 ?auto_767279 ) ) ( not ( = ?auto_767272 ?auto_767280 ) ) ( not ( = ?auto_767272 ?auto_767281 ) ) ( not ( = ?auto_767273 ?auto_767274 ) ) ( not ( = ?auto_767273 ?auto_767275 ) ) ( not ( = ?auto_767273 ?auto_767276 ) ) ( not ( = ?auto_767273 ?auto_767277 ) ) ( not ( = ?auto_767273 ?auto_767278 ) ) ( not ( = ?auto_767273 ?auto_767279 ) ) ( not ( = ?auto_767273 ?auto_767280 ) ) ( not ( = ?auto_767273 ?auto_767281 ) ) ( not ( = ?auto_767274 ?auto_767275 ) ) ( not ( = ?auto_767274 ?auto_767276 ) ) ( not ( = ?auto_767274 ?auto_767277 ) ) ( not ( = ?auto_767274 ?auto_767278 ) ) ( not ( = ?auto_767274 ?auto_767279 ) ) ( not ( = ?auto_767274 ?auto_767280 ) ) ( not ( = ?auto_767274 ?auto_767281 ) ) ( not ( = ?auto_767275 ?auto_767276 ) ) ( not ( = ?auto_767275 ?auto_767277 ) ) ( not ( = ?auto_767275 ?auto_767278 ) ) ( not ( = ?auto_767275 ?auto_767279 ) ) ( not ( = ?auto_767275 ?auto_767280 ) ) ( not ( = ?auto_767275 ?auto_767281 ) ) ( not ( = ?auto_767276 ?auto_767277 ) ) ( not ( = ?auto_767276 ?auto_767278 ) ) ( not ( = ?auto_767276 ?auto_767279 ) ) ( not ( = ?auto_767276 ?auto_767280 ) ) ( not ( = ?auto_767276 ?auto_767281 ) ) ( not ( = ?auto_767277 ?auto_767278 ) ) ( not ( = ?auto_767277 ?auto_767279 ) ) ( not ( = ?auto_767277 ?auto_767280 ) ) ( not ( = ?auto_767277 ?auto_767281 ) ) ( not ( = ?auto_767278 ?auto_767279 ) ) ( not ( = ?auto_767278 ?auto_767280 ) ) ( not ( = ?auto_767278 ?auto_767281 ) ) ( not ( = ?auto_767279 ?auto_767280 ) ) ( not ( = ?auto_767279 ?auto_767281 ) ) ( not ( = ?auto_767280 ?auto_767281 ) ) ( ON ?auto_767279 ?auto_767280 ) ( ON ?auto_767278 ?auto_767279 ) ( ON ?auto_767277 ?auto_767278 ) ( ON ?auto_767276 ?auto_767277 ) ( ON ?auto_767275 ?auto_767276 ) ( ON ?auto_767274 ?auto_767275 ) ( ON ?auto_767273 ?auto_767274 ) ( ON ?auto_767272 ?auto_767273 ) ( CLEAR ?auto_767272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_767272 )
      ( MAKE-9PILE ?auto_767272 ?auto_767273 ?auto_767274 ?auto_767275 ?auto_767276 ?auto_767277 ?auto_767278 ?auto_767279 ?auto_767280 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_767311 - BLOCK
      ?auto_767312 - BLOCK
      ?auto_767313 - BLOCK
      ?auto_767314 - BLOCK
      ?auto_767315 - BLOCK
      ?auto_767316 - BLOCK
      ?auto_767317 - BLOCK
      ?auto_767318 - BLOCK
      ?auto_767319 - BLOCK
      ?auto_767320 - BLOCK
    )
    :vars
    (
      ?auto_767321 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_767319 ) ( ON ?auto_767320 ?auto_767321 ) ( CLEAR ?auto_767320 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_767311 ) ( ON ?auto_767312 ?auto_767311 ) ( ON ?auto_767313 ?auto_767312 ) ( ON ?auto_767314 ?auto_767313 ) ( ON ?auto_767315 ?auto_767314 ) ( ON ?auto_767316 ?auto_767315 ) ( ON ?auto_767317 ?auto_767316 ) ( ON ?auto_767318 ?auto_767317 ) ( ON ?auto_767319 ?auto_767318 ) ( not ( = ?auto_767311 ?auto_767312 ) ) ( not ( = ?auto_767311 ?auto_767313 ) ) ( not ( = ?auto_767311 ?auto_767314 ) ) ( not ( = ?auto_767311 ?auto_767315 ) ) ( not ( = ?auto_767311 ?auto_767316 ) ) ( not ( = ?auto_767311 ?auto_767317 ) ) ( not ( = ?auto_767311 ?auto_767318 ) ) ( not ( = ?auto_767311 ?auto_767319 ) ) ( not ( = ?auto_767311 ?auto_767320 ) ) ( not ( = ?auto_767311 ?auto_767321 ) ) ( not ( = ?auto_767312 ?auto_767313 ) ) ( not ( = ?auto_767312 ?auto_767314 ) ) ( not ( = ?auto_767312 ?auto_767315 ) ) ( not ( = ?auto_767312 ?auto_767316 ) ) ( not ( = ?auto_767312 ?auto_767317 ) ) ( not ( = ?auto_767312 ?auto_767318 ) ) ( not ( = ?auto_767312 ?auto_767319 ) ) ( not ( = ?auto_767312 ?auto_767320 ) ) ( not ( = ?auto_767312 ?auto_767321 ) ) ( not ( = ?auto_767313 ?auto_767314 ) ) ( not ( = ?auto_767313 ?auto_767315 ) ) ( not ( = ?auto_767313 ?auto_767316 ) ) ( not ( = ?auto_767313 ?auto_767317 ) ) ( not ( = ?auto_767313 ?auto_767318 ) ) ( not ( = ?auto_767313 ?auto_767319 ) ) ( not ( = ?auto_767313 ?auto_767320 ) ) ( not ( = ?auto_767313 ?auto_767321 ) ) ( not ( = ?auto_767314 ?auto_767315 ) ) ( not ( = ?auto_767314 ?auto_767316 ) ) ( not ( = ?auto_767314 ?auto_767317 ) ) ( not ( = ?auto_767314 ?auto_767318 ) ) ( not ( = ?auto_767314 ?auto_767319 ) ) ( not ( = ?auto_767314 ?auto_767320 ) ) ( not ( = ?auto_767314 ?auto_767321 ) ) ( not ( = ?auto_767315 ?auto_767316 ) ) ( not ( = ?auto_767315 ?auto_767317 ) ) ( not ( = ?auto_767315 ?auto_767318 ) ) ( not ( = ?auto_767315 ?auto_767319 ) ) ( not ( = ?auto_767315 ?auto_767320 ) ) ( not ( = ?auto_767315 ?auto_767321 ) ) ( not ( = ?auto_767316 ?auto_767317 ) ) ( not ( = ?auto_767316 ?auto_767318 ) ) ( not ( = ?auto_767316 ?auto_767319 ) ) ( not ( = ?auto_767316 ?auto_767320 ) ) ( not ( = ?auto_767316 ?auto_767321 ) ) ( not ( = ?auto_767317 ?auto_767318 ) ) ( not ( = ?auto_767317 ?auto_767319 ) ) ( not ( = ?auto_767317 ?auto_767320 ) ) ( not ( = ?auto_767317 ?auto_767321 ) ) ( not ( = ?auto_767318 ?auto_767319 ) ) ( not ( = ?auto_767318 ?auto_767320 ) ) ( not ( = ?auto_767318 ?auto_767321 ) ) ( not ( = ?auto_767319 ?auto_767320 ) ) ( not ( = ?auto_767319 ?auto_767321 ) ) ( not ( = ?auto_767320 ?auto_767321 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_767320 ?auto_767321 )
      ( !STACK ?auto_767320 ?auto_767319 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_767353 - BLOCK
      ?auto_767354 - BLOCK
      ?auto_767355 - BLOCK
      ?auto_767356 - BLOCK
      ?auto_767357 - BLOCK
      ?auto_767358 - BLOCK
      ?auto_767359 - BLOCK
      ?auto_767360 - BLOCK
      ?auto_767361 - BLOCK
      ?auto_767362 - BLOCK
    )
    :vars
    (
      ?auto_767363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767362 ?auto_767363 ) ( ON-TABLE ?auto_767353 ) ( ON ?auto_767354 ?auto_767353 ) ( ON ?auto_767355 ?auto_767354 ) ( ON ?auto_767356 ?auto_767355 ) ( ON ?auto_767357 ?auto_767356 ) ( ON ?auto_767358 ?auto_767357 ) ( ON ?auto_767359 ?auto_767358 ) ( ON ?auto_767360 ?auto_767359 ) ( not ( = ?auto_767353 ?auto_767354 ) ) ( not ( = ?auto_767353 ?auto_767355 ) ) ( not ( = ?auto_767353 ?auto_767356 ) ) ( not ( = ?auto_767353 ?auto_767357 ) ) ( not ( = ?auto_767353 ?auto_767358 ) ) ( not ( = ?auto_767353 ?auto_767359 ) ) ( not ( = ?auto_767353 ?auto_767360 ) ) ( not ( = ?auto_767353 ?auto_767361 ) ) ( not ( = ?auto_767353 ?auto_767362 ) ) ( not ( = ?auto_767353 ?auto_767363 ) ) ( not ( = ?auto_767354 ?auto_767355 ) ) ( not ( = ?auto_767354 ?auto_767356 ) ) ( not ( = ?auto_767354 ?auto_767357 ) ) ( not ( = ?auto_767354 ?auto_767358 ) ) ( not ( = ?auto_767354 ?auto_767359 ) ) ( not ( = ?auto_767354 ?auto_767360 ) ) ( not ( = ?auto_767354 ?auto_767361 ) ) ( not ( = ?auto_767354 ?auto_767362 ) ) ( not ( = ?auto_767354 ?auto_767363 ) ) ( not ( = ?auto_767355 ?auto_767356 ) ) ( not ( = ?auto_767355 ?auto_767357 ) ) ( not ( = ?auto_767355 ?auto_767358 ) ) ( not ( = ?auto_767355 ?auto_767359 ) ) ( not ( = ?auto_767355 ?auto_767360 ) ) ( not ( = ?auto_767355 ?auto_767361 ) ) ( not ( = ?auto_767355 ?auto_767362 ) ) ( not ( = ?auto_767355 ?auto_767363 ) ) ( not ( = ?auto_767356 ?auto_767357 ) ) ( not ( = ?auto_767356 ?auto_767358 ) ) ( not ( = ?auto_767356 ?auto_767359 ) ) ( not ( = ?auto_767356 ?auto_767360 ) ) ( not ( = ?auto_767356 ?auto_767361 ) ) ( not ( = ?auto_767356 ?auto_767362 ) ) ( not ( = ?auto_767356 ?auto_767363 ) ) ( not ( = ?auto_767357 ?auto_767358 ) ) ( not ( = ?auto_767357 ?auto_767359 ) ) ( not ( = ?auto_767357 ?auto_767360 ) ) ( not ( = ?auto_767357 ?auto_767361 ) ) ( not ( = ?auto_767357 ?auto_767362 ) ) ( not ( = ?auto_767357 ?auto_767363 ) ) ( not ( = ?auto_767358 ?auto_767359 ) ) ( not ( = ?auto_767358 ?auto_767360 ) ) ( not ( = ?auto_767358 ?auto_767361 ) ) ( not ( = ?auto_767358 ?auto_767362 ) ) ( not ( = ?auto_767358 ?auto_767363 ) ) ( not ( = ?auto_767359 ?auto_767360 ) ) ( not ( = ?auto_767359 ?auto_767361 ) ) ( not ( = ?auto_767359 ?auto_767362 ) ) ( not ( = ?auto_767359 ?auto_767363 ) ) ( not ( = ?auto_767360 ?auto_767361 ) ) ( not ( = ?auto_767360 ?auto_767362 ) ) ( not ( = ?auto_767360 ?auto_767363 ) ) ( not ( = ?auto_767361 ?auto_767362 ) ) ( not ( = ?auto_767361 ?auto_767363 ) ) ( not ( = ?auto_767362 ?auto_767363 ) ) ( CLEAR ?auto_767360 ) ( ON ?auto_767361 ?auto_767362 ) ( CLEAR ?auto_767361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_767353 ?auto_767354 ?auto_767355 ?auto_767356 ?auto_767357 ?auto_767358 ?auto_767359 ?auto_767360 ?auto_767361 )
      ( MAKE-10PILE ?auto_767353 ?auto_767354 ?auto_767355 ?auto_767356 ?auto_767357 ?auto_767358 ?auto_767359 ?auto_767360 ?auto_767361 ?auto_767362 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_767395 - BLOCK
      ?auto_767396 - BLOCK
      ?auto_767397 - BLOCK
      ?auto_767398 - BLOCK
      ?auto_767399 - BLOCK
      ?auto_767400 - BLOCK
      ?auto_767401 - BLOCK
      ?auto_767402 - BLOCK
      ?auto_767403 - BLOCK
      ?auto_767404 - BLOCK
    )
    :vars
    (
      ?auto_767405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767404 ?auto_767405 ) ( ON-TABLE ?auto_767395 ) ( ON ?auto_767396 ?auto_767395 ) ( ON ?auto_767397 ?auto_767396 ) ( ON ?auto_767398 ?auto_767397 ) ( ON ?auto_767399 ?auto_767398 ) ( ON ?auto_767400 ?auto_767399 ) ( ON ?auto_767401 ?auto_767400 ) ( not ( = ?auto_767395 ?auto_767396 ) ) ( not ( = ?auto_767395 ?auto_767397 ) ) ( not ( = ?auto_767395 ?auto_767398 ) ) ( not ( = ?auto_767395 ?auto_767399 ) ) ( not ( = ?auto_767395 ?auto_767400 ) ) ( not ( = ?auto_767395 ?auto_767401 ) ) ( not ( = ?auto_767395 ?auto_767402 ) ) ( not ( = ?auto_767395 ?auto_767403 ) ) ( not ( = ?auto_767395 ?auto_767404 ) ) ( not ( = ?auto_767395 ?auto_767405 ) ) ( not ( = ?auto_767396 ?auto_767397 ) ) ( not ( = ?auto_767396 ?auto_767398 ) ) ( not ( = ?auto_767396 ?auto_767399 ) ) ( not ( = ?auto_767396 ?auto_767400 ) ) ( not ( = ?auto_767396 ?auto_767401 ) ) ( not ( = ?auto_767396 ?auto_767402 ) ) ( not ( = ?auto_767396 ?auto_767403 ) ) ( not ( = ?auto_767396 ?auto_767404 ) ) ( not ( = ?auto_767396 ?auto_767405 ) ) ( not ( = ?auto_767397 ?auto_767398 ) ) ( not ( = ?auto_767397 ?auto_767399 ) ) ( not ( = ?auto_767397 ?auto_767400 ) ) ( not ( = ?auto_767397 ?auto_767401 ) ) ( not ( = ?auto_767397 ?auto_767402 ) ) ( not ( = ?auto_767397 ?auto_767403 ) ) ( not ( = ?auto_767397 ?auto_767404 ) ) ( not ( = ?auto_767397 ?auto_767405 ) ) ( not ( = ?auto_767398 ?auto_767399 ) ) ( not ( = ?auto_767398 ?auto_767400 ) ) ( not ( = ?auto_767398 ?auto_767401 ) ) ( not ( = ?auto_767398 ?auto_767402 ) ) ( not ( = ?auto_767398 ?auto_767403 ) ) ( not ( = ?auto_767398 ?auto_767404 ) ) ( not ( = ?auto_767398 ?auto_767405 ) ) ( not ( = ?auto_767399 ?auto_767400 ) ) ( not ( = ?auto_767399 ?auto_767401 ) ) ( not ( = ?auto_767399 ?auto_767402 ) ) ( not ( = ?auto_767399 ?auto_767403 ) ) ( not ( = ?auto_767399 ?auto_767404 ) ) ( not ( = ?auto_767399 ?auto_767405 ) ) ( not ( = ?auto_767400 ?auto_767401 ) ) ( not ( = ?auto_767400 ?auto_767402 ) ) ( not ( = ?auto_767400 ?auto_767403 ) ) ( not ( = ?auto_767400 ?auto_767404 ) ) ( not ( = ?auto_767400 ?auto_767405 ) ) ( not ( = ?auto_767401 ?auto_767402 ) ) ( not ( = ?auto_767401 ?auto_767403 ) ) ( not ( = ?auto_767401 ?auto_767404 ) ) ( not ( = ?auto_767401 ?auto_767405 ) ) ( not ( = ?auto_767402 ?auto_767403 ) ) ( not ( = ?auto_767402 ?auto_767404 ) ) ( not ( = ?auto_767402 ?auto_767405 ) ) ( not ( = ?auto_767403 ?auto_767404 ) ) ( not ( = ?auto_767403 ?auto_767405 ) ) ( not ( = ?auto_767404 ?auto_767405 ) ) ( ON ?auto_767403 ?auto_767404 ) ( CLEAR ?auto_767401 ) ( ON ?auto_767402 ?auto_767403 ) ( CLEAR ?auto_767402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_767395 ?auto_767396 ?auto_767397 ?auto_767398 ?auto_767399 ?auto_767400 ?auto_767401 ?auto_767402 )
      ( MAKE-10PILE ?auto_767395 ?auto_767396 ?auto_767397 ?auto_767398 ?auto_767399 ?auto_767400 ?auto_767401 ?auto_767402 ?auto_767403 ?auto_767404 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_767437 - BLOCK
      ?auto_767438 - BLOCK
      ?auto_767439 - BLOCK
      ?auto_767440 - BLOCK
      ?auto_767441 - BLOCK
      ?auto_767442 - BLOCK
      ?auto_767443 - BLOCK
      ?auto_767444 - BLOCK
      ?auto_767445 - BLOCK
      ?auto_767446 - BLOCK
    )
    :vars
    (
      ?auto_767447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767446 ?auto_767447 ) ( ON-TABLE ?auto_767437 ) ( ON ?auto_767438 ?auto_767437 ) ( ON ?auto_767439 ?auto_767438 ) ( ON ?auto_767440 ?auto_767439 ) ( ON ?auto_767441 ?auto_767440 ) ( ON ?auto_767442 ?auto_767441 ) ( not ( = ?auto_767437 ?auto_767438 ) ) ( not ( = ?auto_767437 ?auto_767439 ) ) ( not ( = ?auto_767437 ?auto_767440 ) ) ( not ( = ?auto_767437 ?auto_767441 ) ) ( not ( = ?auto_767437 ?auto_767442 ) ) ( not ( = ?auto_767437 ?auto_767443 ) ) ( not ( = ?auto_767437 ?auto_767444 ) ) ( not ( = ?auto_767437 ?auto_767445 ) ) ( not ( = ?auto_767437 ?auto_767446 ) ) ( not ( = ?auto_767437 ?auto_767447 ) ) ( not ( = ?auto_767438 ?auto_767439 ) ) ( not ( = ?auto_767438 ?auto_767440 ) ) ( not ( = ?auto_767438 ?auto_767441 ) ) ( not ( = ?auto_767438 ?auto_767442 ) ) ( not ( = ?auto_767438 ?auto_767443 ) ) ( not ( = ?auto_767438 ?auto_767444 ) ) ( not ( = ?auto_767438 ?auto_767445 ) ) ( not ( = ?auto_767438 ?auto_767446 ) ) ( not ( = ?auto_767438 ?auto_767447 ) ) ( not ( = ?auto_767439 ?auto_767440 ) ) ( not ( = ?auto_767439 ?auto_767441 ) ) ( not ( = ?auto_767439 ?auto_767442 ) ) ( not ( = ?auto_767439 ?auto_767443 ) ) ( not ( = ?auto_767439 ?auto_767444 ) ) ( not ( = ?auto_767439 ?auto_767445 ) ) ( not ( = ?auto_767439 ?auto_767446 ) ) ( not ( = ?auto_767439 ?auto_767447 ) ) ( not ( = ?auto_767440 ?auto_767441 ) ) ( not ( = ?auto_767440 ?auto_767442 ) ) ( not ( = ?auto_767440 ?auto_767443 ) ) ( not ( = ?auto_767440 ?auto_767444 ) ) ( not ( = ?auto_767440 ?auto_767445 ) ) ( not ( = ?auto_767440 ?auto_767446 ) ) ( not ( = ?auto_767440 ?auto_767447 ) ) ( not ( = ?auto_767441 ?auto_767442 ) ) ( not ( = ?auto_767441 ?auto_767443 ) ) ( not ( = ?auto_767441 ?auto_767444 ) ) ( not ( = ?auto_767441 ?auto_767445 ) ) ( not ( = ?auto_767441 ?auto_767446 ) ) ( not ( = ?auto_767441 ?auto_767447 ) ) ( not ( = ?auto_767442 ?auto_767443 ) ) ( not ( = ?auto_767442 ?auto_767444 ) ) ( not ( = ?auto_767442 ?auto_767445 ) ) ( not ( = ?auto_767442 ?auto_767446 ) ) ( not ( = ?auto_767442 ?auto_767447 ) ) ( not ( = ?auto_767443 ?auto_767444 ) ) ( not ( = ?auto_767443 ?auto_767445 ) ) ( not ( = ?auto_767443 ?auto_767446 ) ) ( not ( = ?auto_767443 ?auto_767447 ) ) ( not ( = ?auto_767444 ?auto_767445 ) ) ( not ( = ?auto_767444 ?auto_767446 ) ) ( not ( = ?auto_767444 ?auto_767447 ) ) ( not ( = ?auto_767445 ?auto_767446 ) ) ( not ( = ?auto_767445 ?auto_767447 ) ) ( not ( = ?auto_767446 ?auto_767447 ) ) ( ON ?auto_767445 ?auto_767446 ) ( ON ?auto_767444 ?auto_767445 ) ( CLEAR ?auto_767442 ) ( ON ?auto_767443 ?auto_767444 ) ( CLEAR ?auto_767443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_767437 ?auto_767438 ?auto_767439 ?auto_767440 ?auto_767441 ?auto_767442 ?auto_767443 )
      ( MAKE-10PILE ?auto_767437 ?auto_767438 ?auto_767439 ?auto_767440 ?auto_767441 ?auto_767442 ?auto_767443 ?auto_767444 ?auto_767445 ?auto_767446 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_767479 - BLOCK
      ?auto_767480 - BLOCK
      ?auto_767481 - BLOCK
      ?auto_767482 - BLOCK
      ?auto_767483 - BLOCK
      ?auto_767484 - BLOCK
      ?auto_767485 - BLOCK
      ?auto_767486 - BLOCK
      ?auto_767487 - BLOCK
      ?auto_767488 - BLOCK
    )
    :vars
    (
      ?auto_767489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767488 ?auto_767489 ) ( ON-TABLE ?auto_767479 ) ( ON ?auto_767480 ?auto_767479 ) ( ON ?auto_767481 ?auto_767480 ) ( ON ?auto_767482 ?auto_767481 ) ( ON ?auto_767483 ?auto_767482 ) ( not ( = ?auto_767479 ?auto_767480 ) ) ( not ( = ?auto_767479 ?auto_767481 ) ) ( not ( = ?auto_767479 ?auto_767482 ) ) ( not ( = ?auto_767479 ?auto_767483 ) ) ( not ( = ?auto_767479 ?auto_767484 ) ) ( not ( = ?auto_767479 ?auto_767485 ) ) ( not ( = ?auto_767479 ?auto_767486 ) ) ( not ( = ?auto_767479 ?auto_767487 ) ) ( not ( = ?auto_767479 ?auto_767488 ) ) ( not ( = ?auto_767479 ?auto_767489 ) ) ( not ( = ?auto_767480 ?auto_767481 ) ) ( not ( = ?auto_767480 ?auto_767482 ) ) ( not ( = ?auto_767480 ?auto_767483 ) ) ( not ( = ?auto_767480 ?auto_767484 ) ) ( not ( = ?auto_767480 ?auto_767485 ) ) ( not ( = ?auto_767480 ?auto_767486 ) ) ( not ( = ?auto_767480 ?auto_767487 ) ) ( not ( = ?auto_767480 ?auto_767488 ) ) ( not ( = ?auto_767480 ?auto_767489 ) ) ( not ( = ?auto_767481 ?auto_767482 ) ) ( not ( = ?auto_767481 ?auto_767483 ) ) ( not ( = ?auto_767481 ?auto_767484 ) ) ( not ( = ?auto_767481 ?auto_767485 ) ) ( not ( = ?auto_767481 ?auto_767486 ) ) ( not ( = ?auto_767481 ?auto_767487 ) ) ( not ( = ?auto_767481 ?auto_767488 ) ) ( not ( = ?auto_767481 ?auto_767489 ) ) ( not ( = ?auto_767482 ?auto_767483 ) ) ( not ( = ?auto_767482 ?auto_767484 ) ) ( not ( = ?auto_767482 ?auto_767485 ) ) ( not ( = ?auto_767482 ?auto_767486 ) ) ( not ( = ?auto_767482 ?auto_767487 ) ) ( not ( = ?auto_767482 ?auto_767488 ) ) ( not ( = ?auto_767482 ?auto_767489 ) ) ( not ( = ?auto_767483 ?auto_767484 ) ) ( not ( = ?auto_767483 ?auto_767485 ) ) ( not ( = ?auto_767483 ?auto_767486 ) ) ( not ( = ?auto_767483 ?auto_767487 ) ) ( not ( = ?auto_767483 ?auto_767488 ) ) ( not ( = ?auto_767483 ?auto_767489 ) ) ( not ( = ?auto_767484 ?auto_767485 ) ) ( not ( = ?auto_767484 ?auto_767486 ) ) ( not ( = ?auto_767484 ?auto_767487 ) ) ( not ( = ?auto_767484 ?auto_767488 ) ) ( not ( = ?auto_767484 ?auto_767489 ) ) ( not ( = ?auto_767485 ?auto_767486 ) ) ( not ( = ?auto_767485 ?auto_767487 ) ) ( not ( = ?auto_767485 ?auto_767488 ) ) ( not ( = ?auto_767485 ?auto_767489 ) ) ( not ( = ?auto_767486 ?auto_767487 ) ) ( not ( = ?auto_767486 ?auto_767488 ) ) ( not ( = ?auto_767486 ?auto_767489 ) ) ( not ( = ?auto_767487 ?auto_767488 ) ) ( not ( = ?auto_767487 ?auto_767489 ) ) ( not ( = ?auto_767488 ?auto_767489 ) ) ( ON ?auto_767487 ?auto_767488 ) ( ON ?auto_767486 ?auto_767487 ) ( ON ?auto_767485 ?auto_767486 ) ( CLEAR ?auto_767483 ) ( ON ?auto_767484 ?auto_767485 ) ( CLEAR ?auto_767484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_767479 ?auto_767480 ?auto_767481 ?auto_767482 ?auto_767483 ?auto_767484 )
      ( MAKE-10PILE ?auto_767479 ?auto_767480 ?auto_767481 ?auto_767482 ?auto_767483 ?auto_767484 ?auto_767485 ?auto_767486 ?auto_767487 ?auto_767488 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_767521 - BLOCK
      ?auto_767522 - BLOCK
      ?auto_767523 - BLOCK
      ?auto_767524 - BLOCK
      ?auto_767525 - BLOCK
      ?auto_767526 - BLOCK
      ?auto_767527 - BLOCK
      ?auto_767528 - BLOCK
      ?auto_767529 - BLOCK
      ?auto_767530 - BLOCK
    )
    :vars
    (
      ?auto_767531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767530 ?auto_767531 ) ( ON-TABLE ?auto_767521 ) ( ON ?auto_767522 ?auto_767521 ) ( ON ?auto_767523 ?auto_767522 ) ( ON ?auto_767524 ?auto_767523 ) ( not ( = ?auto_767521 ?auto_767522 ) ) ( not ( = ?auto_767521 ?auto_767523 ) ) ( not ( = ?auto_767521 ?auto_767524 ) ) ( not ( = ?auto_767521 ?auto_767525 ) ) ( not ( = ?auto_767521 ?auto_767526 ) ) ( not ( = ?auto_767521 ?auto_767527 ) ) ( not ( = ?auto_767521 ?auto_767528 ) ) ( not ( = ?auto_767521 ?auto_767529 ) ) ( not ( = ?auto_767521 ?auto_767530 ) ) ( not ( = ?auto_767521 ?auto_767531 ) ) ( not ( = ?auto_767522 ?auto_767523 ) ) ( not ( = ?auto_767522 ?auto_767524 ) ) ( not ( = ?auto_767522 ?auto_767525 ) ) ( not ( = ?auto_767522 ?auto_767526 ) ) ( not ( = ?auto_767522 ?auto_767527 ) ) ( not ( = ?auto_767522 ?auto_767528 ) ) ( not ( = ?auto_767522 ?auto_767529 ) ) ( not ( = ?auto_767522 ?auto_767530 ) ) ( not ( = ?auto_767522 ?auto_767531 ) ) ( not ( = ?auto_767523 ?auto_767524 ) ) ( not ( = ?auto_767523 ?auto_767525 ) ) ( not ( = ?auto_767523 ?auto_767526 ) ) ( not ( = ?auto_767523 ?auto_767527 ) ) ( not ( = ?auto_767523 ?auto_767528 ) ) ( not ( = ?auto_767523 ?auto_767529 ) ) ( not ( = ?auto_767523 ?auto_767530 ) ) ( not ( = ?auto_767523 ?auto_767531 ) ) ( not ( = ?auto_767524 ?auto_767525 ) ) ( not ( = ?auto_767524 ?auto_767526 ) ) ( not ( = ?auto_767524 ?auto_767527 ) ) ( not ( = ?auto_767524 ?auto_767528 ) ) ( not ( = ?auto_767524 ?auto_767529 ) ) ( not ( = ?auto_767524 ?auto_767530 ) ) ( not ( = ?auto_767524 ?auto_767531 ) ) ( not ( = ?auto_767525 ?auto_767526 ) ) ( not ( = ?auto_767525 ?auto_767527 ) ) ( not ( = ?auto_767525 ?auto_767528 ) ) ( not ( = ?auto_767525 ?auto_767529 ) ) ( not ( = ?auto_767525 ?auto_767530 ) ) ( not ( = ?auto_767525 ?auto_767531 ) ) ( not ( = ?auto_767526 ?auto_767527 ) ) ( not ( = ?auto_767526 ?auto_767528 ) ) ( not ( = ?auto_767526 ?auto_767529 ) ) ( not ( = ?auto_767526 ?auto_767530 ) ) ( not ( = ?auto_767526 ?auto_767531 ) ) ( not ( = ?auto_767527 ?auto_767528 ) ) ( not ( = ?auto_767527 ?auto_767529 ) ) ( not ( = ?auto_767527 ?auto_767530 ) ) ( not ( = ?auto_767527 ?auto_767531 ) ) ( not ( = ?auto_767528 ?auto_767529 ) ) ( not ( = ?auto_767528 ?auto_767530 ) ) ( not ( = ?auto_767528 ?auto_767531 ) ) ( not ( = ?auto_767529 ?auto_767530 ) ) ( not ( = ?auto_767529 ?auto_767531 ) ) ( not ( = ?auto_767530 ?auto_767531 ) ) ( ON ?auto_767529 ?auto_767530 ) ( ON ?auto_767528 ?auto_767529 ) ( ON ?auto_767527 ?auto_767528 ) ( ON ?auto_767526 ?auto_767527 ) ( CLEAR ?auto_767524 ) ( ON ?auto_767525 ?auto_767526 ) ( CLEAR ?auto_767525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_767521 ?auto_767522 ?auto_767523 ?auto_767524 ?auto_767525 )
      ( MAKE-10PILE ?auto_767521 ?auto_767522 ?auto_767523 ?auto_767524 ?auto_767525 ?auto_767526 ?auto_767527 ?auto_767528 ?auto_767529 ?auto_767530 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_767563 - BLOCK
      ?auto_767564 - BLOCK
      ?auto_767565 - BLOCK
      ?auto_767566 - BLOCK
      ?auto_767567 - BLOCK
      ?auto_767568 - BLOCK
      ?auto_767569 - BLOCK
      ?auto_767570 - BLOCK
      ?auto_767571 - BLOCK
      ?auto_767572 - BLOCK
    )
    :vars
    (
      ?auto_767573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767572 ?auto_767573 ) ( ON-TABLE ?auto_767563 ) ( ON ?auto_767564 ?auto_767563 ) ( ON ?auto_767565 ?auto_767564 ) ( not ( = ?auto_767563 ?auto_767564 ) ) ( not ( = ?auto_767563 ?auto_767565 ) ) ( not ( = ?auto_767563 ?auto_767566 ) ) ( not ( = ?auto_767563 ?auto_767567 ) ) ( not ( = ?auto_767563 ?auto_767568 ) ) ( not ( = ?auto_767563 ?auto_767569 ) ) ( not ( = ?auto_767563 ?auto_767570 ) ) ( not ( = ?auto_767563 ?auto_767571 ) ) ( not ( = ?auto_767563 ?auto_767572 ) ) ( not ( = ?auto_767563 ?auto_767573 ) ) ( not ( = ?auto_767564 ?auto_767565 ) ) ( not ( = ?auto_767564 ?auto_767566 ) ) ( not ( = ?auto_767564 ?auto_767567 ) ) ( not ( = ?auto_767564 ?auto_767568 ) ) ( not ( = ?auto_767564 ?auto_767569 ) ) ( not ( = ?auto_767564 ?auto_767570 ) ) ( not ( = ?auto_767564 ?auto_767571 ) ) ( not ( = ?auto_767564 ?auto_767572 ) ) ( not ( = ?auto_767564 ?auto_767573 ) ) ( not ( = ?auto_767565 ?auto_767566 ) ) ( not ( = ?auto_767565 ?auto_767567 ) ) ( not ( = ?auto_767565 ?auto_767568 ) ) ( not ( = ?auto_767565 ?auto_767569 ) ) ( not ( = ?auto_767565 ?auto_767570 ) ) ( not ( = ?auto_767565 ?auto_767571 ) ) ( not ( = ?auto_767565 ?auto_767572 ) ) ( not ( = ?auto_767565 ?auto_767573 ) ) ( not ( = ?auto_767566 ?auto_767567 ) ) ( not ( = ?auto_767566 ?auto_767568 ) ) ( not ( = ?auto_767566 ?auto_767569 ) ) ( not ( = ?auto_767566 ?auto_767570 ) ) ( not ( = ?auto_767566 ?auto_767571 ) ) ( not ( = ?auto_767566 ?auto_767572 ) ) ( not ( = ?auto_767566 ?auto_767573 ) ) ( not ( = ?auto_767567 ?auto_767568 ) ) ( not ( = ?auto_767567 ?auto_767569 ) ) ( not ( = ?auto_767567 ?auto_767570 ) ) ( not ( = ?auto_767567 ?auto_767571 ) ) ( not ( = ?auto_767567 ?auto_767572 ) ) ( not ( = ?auto_767567 ?auto_767573 ) ) ( not ( = ?auto_767568 ?auto_767569 ) ) ( not ( = ?auto_767568 ?auto_767570 ) ) ( not ( = ?auto_767568 ?auto_767571 ) ) ( not ( = ?auto_767568 ?auto_767572 ) ) ( not ( = ?auto_767568 ?auto_767573 ) ) ( not ( = ?auto_767569 ?auto_767570 ) ) ( not ( = ?auto_767569 ?auto_767571 ) ) ( not ( = ?auto_767569 ?auto_767572 ) ) ( not ( = ?auto_767569 ?auto_767573 ) ) ( not ( = ?auto_767570 ?auto_767571 ) ) ( not ( = ?auto_767570 ?auto_767572 ) ) ( not ( = ?auto_767570 ?auto_767573 ) ) ( not ( = ?auto_767571 ?auto_767572 ) ) ( not ( = ?auto_767571 ?auto_767573 ) ) ( not ( = ?auto_767572 ?auto_767573 ) ) ( ON ?auto_767571 ?auto_767572 ) ( ON ?auto_767570 ?auto_767571 ) ( ON ?auto_767569 ?auto_767570 ) ( ON ?auto_767568 ?auto_767569 ) ( ON ?auto_767567 ?auto_767568 ) ( CLEAR ?auto_767565 ) ( ON ?auto_767566 ?auto_767567 ) ( CLEAR ?auto_767566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_767563 ?auto_767564 ?auto_767565 ?auto_767566 )
      ( MAKE-10PILE ?auto_767563 ?auto_767564 ?auto_767565 ?auto_767566 ?auto_767567 ?auto_767568 ?auto_767569 ?auto_767570 ?auto_767571 ?auto_767572 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_767605 - BLOCK
      ?auto_767606 - BLOCK
      ?auto_767607 - BLOCK
      ?auto_767608 - BLOCK
      ?auto_767609 - BLOCK
      ?auto_767610 - BLOCK
      ?auto_767611 - BLOCK
      ?auto_767612 - BLOCK
      ?auto_767613 - BLOCK
      ?auto_767614 - BLOCK
    )
    :vars
    (
      ?auto_767615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767614 ?auto_767615 ) ( ON-TABLE ?auto_767605 ) ( ON ?auto_767606 ?auto_767605 ) ( not ( = ?auto_767605 ?auto_767606 ) ) ( not ( = ?auto_767605 ?auto_767607 ) ) ( not ( = ?auto_767605 ?auto_767608 ) ) ( not ( = ?auto_767605 ?auto_767609 ) ) ( not ( = ?auto_767605 ?auto_767610 ) ) ( not ( = ?auto_767605 ?auto_767611 ) ) ( not ( = ?auto_767605 ?auto_767612 ) ) ( not ( = ?auto_767605 ?auto_767613 ) ) ( not ( = ?auto_767605 ?auto_767614 ) ) ( not ( = ?auto_767605 ?auto_767615 ) ) ( not ( = ?auto_767606 ?auto_767607 ) ) ( not ( = ?auto_767606 ?auto_767608 ) ) ( not ( = ?auto_767606 ?auto_767609 ) ) ( not ( = ?auto_767606 ?auto_767610 ) ) ( not ( = ?auto_767606 ?auto_767611 ) ) ( not ( = ?auto_767606 ?auto_767612 ) ) ( not ( = ?auto_767606 ?auto_767613 ) ) ( not ( = ?auto_767606 ?auto_767614 ) ) ( not ( = ?auto_767606 ?auto_767615 ) ) ( not ( = ?auto_767607 ?auto_767608 ) ) ( not ( = ?auto_767607 ?auto_767609 ) ) ( not ( = ?auto_767607 ?auto_767610 ) ) ( not ( = ?auto_767607 ?auto_767611 ) ) ( not ( = ?auto_767607 ?auto_767612 ) ) ( not ( = ?auto_767607 ?auto_767613 ) ) ( not ( = ?auto_767607 ?auto_767614 ) ) ( not ( = ?auto_767607 ?auto_767615 ) ) ( not ( = ?auto_767608 ?auto_767609 ) ) ( not ( = ?auto_767608 ?auto_767610 ) ) ( not ( = ?auto_767608 ?auto_767611 ) ) ( not ( = ?auto_767608 ?auto_767612 ) ) ( not ( = ?auto_767608 ?auto_767613 ) ) ( not ( = ?auto_767608 ?auto_767614 ) ) ( not ( = ?auto_767608 ?auto_767615 ) ) ( not ( = ?auto_767609 ?auto_767610 ) ) ( not ( = ?auto_767609 ?auto_767611 ) ) ( not ( = ?auto_767609 ?auto_767612 ) ) ( not ( = ?auto_767609 ?auto_767613 ) ) ( not ( = ?auto_767609 ?auto_767614 ) ) ( not ( = ?auto_767609 ?auto_767615 ) ) ( not ( = ?auto_767610 ?auto_767611 ) ) ( not ( = ?auto_767610 ?auto_767612 ) ) ( not ( = ?auto_767610 ?auto_767613 ) ) ( not ( = ?auto_767610 ?auto_767614 ) ) ( not ( = ?auto_767610 ?auto_767615 ) ) ( not ( = ?auto_767611 ?auto_767612 ) ) ( not ( = ?auto_767611 ?auto_767613 ) ) ( not ( = ?auto_767611 ?auto_767614 ) ) ( not ( = ?auto_767611 ?auto_767615 ) ) ( not ( = ?auto_767612 ?auto_767613 ) ) ( not ( = ?auto_767612 ?auto_767614 ) ) ( not ( = ?auto_767612 ?auto_767615 ) ) ( not ( = ?auto_767613 ?auto_767614 ) ) ( not ( = ?auto_767613 ?auto_767615 ) ) ( not ( = ?auto_767614 ?auto_767615 ) ) ( ON ?auto_767613 ?auto_767614 ) ( ON ?auto_767612 ?auto_767613 ) ( ON ?auto_767611 ?auto_767612 ) ( ON ?auto_767610 ?auto_767611 ) ( ON ?auto_767609 ?auto_767610 ) ( ON ?auto_767608 ?auto_767609 ) ( CLEAR ?auto_767606 ) ( ON ?auto_767607 ?auto_767608 ) ( CLEAR ?auto_767607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_767605 ?auto_767606 ?auto_767607 )
      ( MAKE-10PILE ?auto_767605 ?auto_767606 ?auto_767607 ?auto_767608 ?auto_767609 ?auto_767610 ?auto_767611 ?auto_767612 ?auto_767613 ?auto_767614 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_767647 - BLOCK
      ?auto_767648 - BLOCK
      ?auto_767649 - BLOCK
      ?auto_767650 - BLOCK
      ?auto_767651 - BLOCK
      ?auto_767652 - BLOCK
      ?auto_767653 - BLOCK
      ?auto_767654 - BLOCK
      ?auto_767655 - BLOCK
      ?auto_767656 - BLOCK
    )
    :vars
    (
      ?auto_767657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767656 ?auto_767657 ) ( ON-TABLE ?auto_767647 ) ( not ( = ?auto_767647 ?auto_767648 ) ) ( not ( = ?auto_767647 ?auto_767649 ) ) ( not ( = ?auto_767647 ?auto_767650 ) ) ( not ( = ?auto_767647 ?auto_767651 ) ) ( not ( = ?auto_767647 ?auto_767652 ) ) ( not ( = ?auto_767647 ?auto_767653 ) ) ( not ( = ?auto_767647 ?auto_767654 ) ) ( not ( = ?auto_767647 ?auto_767655 ) ) ( not ( = ?auto_767647 ?auto_767656 ) ) ( not ( = ?auto_767647 ?auto_767657 ) ) ( not ( = ?auto_767648 ?auto_767649 ) ) ( not ( = ?auto_767648 ?auto_767650 ) ) ( not ( = ?auto_767648 ?auto_767651 ) ) ( not ( = ?auto_767648 ?auto_767652 ) ) ( not ( = ?auto_767648 ?auto_767653 ) ) ( not ( = ?auto_767648 ?auto_767654 ) ) ( not ( = ?auto_767648 ?auto_767655 ) ) ( not ( = ?auto_767648 ?auto_767656 ) ) ( not ( = ?auto_767648 ?auto_767657 ) ) ( not ( = ?auto_767649 ?auto_767650 ) ) ( not ( = ?auto_767649 ?auto_767651 ) ) ( not ( = ?auto_767649 ?auto_767652 ) ) ( not ( = ?auto_767649 ?auto_767653 ) ) ( not ( = ?auto_767649 ?auto_767654 ) ) ( not ( = ?auto_767649 ?auto_767655 ) ) ( not ( = ?auto_767649 ?auto_767656 ) ) ( not ( = ?auto_767649 ?auto_767657 ) ) ( not ( = ?auto_767650 ?auto_767651 ) ) ( not ( = ?auto_767650 ?auto_767652 ) ) ( not ( = ?auto_767650 ?auto_767653 ) ) ( not ( = ?auto_767650 ?auto_767654 ) ) ( not ( = ?auto_767650 ?auto_767655 ) ) ( not ( = ?auto_767650 ?auto_767656 ) ) ( not ( = ?auto_767650 ?auto_767657 ) ) ( not ( = ?auto_767651 ?auto_767652 ) ) ( not ( = ?auto_767651 ?auto_767653 ) ) ( not ( = ?auto_767651 ?auto_767654 ) ) ( not ( = ?auto_767651 ?auto_767655 ) ) ( not ( = ?auto_767651 ?auto_767656 ) ) ( not ( = ?auto_767651 ?auto_767657 ) ) ( not ( = ?auto_767652 ?auto_767653 ) ) ( not ( = ?auto_767652 ?auto_767654 ) ) ( not ( = ?auto_767652 ?auto_767655 ) ) ( not ( = ?auto_767652 ?auto_767656 ) ) ( not ( = ?auto_767652 ?auto_767657 ) ) ( not ( = ?auto_767653 ?auto_767654 ) ) ( not ( = ?auto_767653 ?auto_767655 ) ) ( not ( = ?auto_767653 ?auto_767656 ) ) ( not ( = ?auto_767653 ?auto_767657 ) ) ( not ( = ?auto_767654 ?auto_767655 ) ) ( not ( = ?auto_767654 ?auto_767656 ) ) ( not ( = ?auto_767654 ?auto_767657 ) ) ( not ( = ?auto_767655 ?auto_767656 ) ) ( not ( = ?auto_767655 ?auto_767657 ) ) ( not ( = ?auto_767656 ?auto_767657 ) ) ( ON ?auto_767655 ?auto_767656 ) ( ON ?auto_767654 ?auto_767655 ) ( ON ?auto_767653 ?auto_767654 ) ( ON ?auto_767652 ?auto_767653 ) ( ON ?auto_767651 ?auto_767652 ) ( ON ?auto_767650 ?auto_767651 ) ( ON ?auto_767649 ?auto_767650 ) ( CLEAR ?auto_767647 ) ( ON ?auto_767648 ?auto_767649 ) ( CLEAR ?auto_767648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_767647 ?auto_767648 )
      ( MAKE-10PILE ?auto_767647 ?auto_767648 ?auto_767649 ?auto_767650 ?auto_767651 ?auto_767652 ?auto_767653 ?auto_767654 ?auto_767655 ?auto_767656 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_767689 - BLOCK
      ?auto_767690 - BLOCK
      ?auto_767691 - BLOCK
      ?auto_767692 - BLOCK
      ?auto_767693 - BLOCK
      ?auto_767694 - BLOCK
      ?auto_767695 - BLOCK
      ?auto_767696 - BLOCK
      ?auto_767697 - BLOCK
      ?auto_767698 - BLOCK
    )
    :vars
    (
      ?auto_767699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767698 ?auto_767699 ) ( not ( = ?auto_767689 ?auto_767690 ) ) ( not ( = ?auto_767689 ?auto_767691 ) ) ( not ( = ?auto_767689 ?auto_767692 ) ) ( not ( = ?auto_767689 ?auto_767693 ) ) ( not ( = ?auto_767689 ?auto_767694 ) ) ( not ( = ?auto_767689 ?auto_767695 ) ) ( not ( = ?auto_767689 ?auto_767696 ) ) ( not ( = ?auto_767689 ?auto_767697 ) ) ( not ( = ?auto_767689 ?auto_767698 ) ) ( not ( = ?auto_767689 ?auto_767699 ) ) ( not ( = ?auto_767690 ?auto_767691 ) ) ( not ( = ?auto_767690 ?auto_767692 ) ) ( not ( = ?auto_767690 ?auto_767693 ) ) ( not ( = ?auto_767690 ?auto_767694 ) ) ( not ( = ?auto_767690 ?auto_767695 ) ) ( not ( = ?auto_767690 ?auto_767696 ) ) ( not ( = ?auto_767690 ?auto_767697 ) ) ( not ( = ?auto_767690 ?auto_767698 ) ) ( not ( = ?auto_767690 ?auto_767699 ) ) ( not ( = ?auto_767691 ?auto_767692 ) ) ( not ( = ?auto_767691 ?auto_767693 ) ) ( not ( = ?auto_767691 ?auto_767694 ) ) ( not ( = ?auto_767691 ?auto_767695 ) ) ( not ( = ?auto_767691 ?auto_767696 ) ) ( not ( = ?auto_767691 ?auto_767697 ) ) ( not ( = ?auto_767691 ?auto_767698 ) ) ( not ( = ?auto_767691 ?auto_767699 ) ) ( not ( = ?auto_767692 ?auto_767693 ) ) ( not ( = ?auto_767692 ?auto_767694 ) ) ( not ( = ?auto_767692 ?auto_767695 ) ) ( not ( = ?auto_767692 ?auto_767696 ) ) ( not ( = ?auto_767692 ?auto_767697 ) ) ( not ( = ?auto_767692 ?auto_767698 ) ) ( not ( = ?auto_767692 ?auto_767699 ) ) ( not ( = ?auto_767693 ?auto_767694 ) ) ( not ( = ?auto_767693 ?auto_767695 ) ) ( not ( = ?auto_767693 ?auto_767696 ) ) ( not ( = ?auto_767693 ?auto_767697 ) ) ( not ( = ?auto_767693 ?auto_767698 ) ) ( not ( = ?auto_767693 ?auto_767699 ) ) ( not ( = ?auto_767694 ?auto_767695 ) ) ( not ( = ?auto_767694 ?auto_767696 ) ) ( not ( = ?auto_767694 ?auto_767697 ) ) ( not ( = ?auto_767694 ?auto_767698 ) ) ( not ( = ?auto_767694 ?auto_767699 ) ) ( not ( = ?auto_767695 ?auto_767696 ) ) ( not ( = ?auto_767695 ?auto_767697 ) ) ( not ( = ?auto_767695 ?auto_767698 ) ) ( not ( = ?auto_767695 ?auto_767699 ) ) ( not ( = ?auto_767696 ?auto_767697 ) ) ( not ( = ?auto_767696 ?auto_767698 ) ) ( not ( = ?auto_767696 ?auto_767699 ) ) ( not ( = ?auto_767697 ?auto_767698 ) ) ( not ( = ?auto_767697 ?auto_767699 ) ) ( not ( = ?auto_767698 ?auto_767699 ) ) ( ON ?auto_767697 ?auto_767698 ) ( ON ?auto_767696 ?auto_767697 ) ( ON ?auto_767695 ?auto_767696 ) ( ON ?auto_767694 ?auto_767695 ) ( ON ?auto_767693 ?auto_767694 ) ( ON ?auto_767692 ?auto_767693 ) ( ON ?auto_767691 ?auto_767692 ) ( ON ?auto_767690 ?auto_767691 ) ( ON ?auto_767689 ?auto_767690 ) ( CLEAR ?auto_767689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_767689 )
      ( MAKE-10PILE ?auto_767689 ?auto_767690 ?auto_767691 ?auto_767692 ?auto_767693 ?auto_767694 ?auto_767695 ?auto_767696 ?auto_767697 ?auto_767698 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_767732 - BLOCK
      ?auto_767733 - BLOCK
      ?auto_767734 - BLOCK
      ?auto_767735 - BLOCK
      ?auto_767736 - BLOCK
      ?auto_767737 - BLOCK
      ?auto_767738 - BLOCK
      ?auto_767739 - BLOCK
      ?auto_767740 - BLOCK
      ?auto_767741 - BLOCK
      ?auto_767742 - BLOCK
    )
    :vars
    (
      ?auto_767743 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_767741 ) ( ON ?auto_767742 ?auto_767743 ) ( CLEAR ?auto_767742 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_767732 ) ( ON ?auto_767733 ?auto_767732 ) ( ON ?auto_767734 ?auto_767733 ) ( ON ?auto_767735 ?auto_767734 ) ( ON ?auto_767736 ?auto_767735 ) ( ON ?auto_767737 ?auto_767736 ) ( ON ?auto_767738 ?auto_767737 ) ( ON ?auto_767739 ?auto_767738 ) ( ON ?auto_767740 ?auto_767739 ) ( ON ?auto_767741 ?auto_767740 ) ( not ( = ?auto_767732 ?auto_767733 ) ) ( not ( = ?auto_767732 ?auto_767734 ) ) ( not ( = ?auto_767732 ?auto_767735 ) ) ( not ( = ?auto_767732 ?auto_767736 ) ) ( not ( = ?auto_767732 ?auto_767737 ) ) ( not ( = ?auto_767732 ?auto_767738 ) ) ( not ( = ?auto_767732 ?auto_767739 ) ) ( not ( = ?auto_767732 ?auto_767740 ) ) ( not ( = ?auto_767732 ?auto_767741 ) ) ( not ( = ?auto_767732 ?auto_767742 ) ) ( not ( = ?auto_767732 ?auto_767743 ) ) ( not ( = ?auto_767733 ?auto_767734 ) ) ( not ( = ?auto_767733 ?auto_767735 ) ) ( not ( = ?auto_767733 ?auto_767736 ) ) ( not ( = ?auto_767733 ?auto_767737 ) ) ( not ( = ?auto_767733 ?auto_767738 ) ) ( not ( = ?auto_767733 ?auto_767739 ) ) ( not ( = ?auto_767733 ?auto_767740 ) ) ( not ( = ?auto_767733 ?auto_767741 ) ) ( not ( = ?auto_767733 ?auto_767742 ) ) ( not ( = ?auto_767733 ?auto_767743 ) ) ( not ( = ?auto_767734 ?auto_767735 ) ) ( not ( = ?auto_767734 ?auto_767736 ) ) ( not ( = ?auto_767734 ?auto_767737 ) ) ( not ( = ?auto_767734 ?auto_767738 ) ) ( not ( = ?auto_767734 ?auto_767739 ) ) ( not ( = ?auto_767734 ?auto_767740 ) ) ( not ( = ?auto_767734 ?auto_767741 ) ) ( not ( = ?auto_767734 ?auto_767742 ) ) ( not ( = ?auto_767734 ?auto_767743 ) ) ( not ( = ?auto_767735 ?auto_767736 ) ) ( not ( = ?auto_767735 ?auto_767737 ) ) ( not ( = ?auto_767735 ?auto_767738 ) ) ( not ( = ?auto_767735 ?auto_767739 ) ) ( not ( = ?auto_767735 ?auto_767740 ) ) ( not ( = ?auto_767735 ?auto_767741 ) ) ( not ( = ?auto_767735 ?auto_767742 ) ) ( not ( = ?auto_767735 ?auto_767743 ) ) ( not ( = ?auto_767736 ?auto_767737 ) ) ( not ( = ?auto_767736 ?auto_767738 ) ) ( not ( = ?auto_767736 ?auto_767739 ) ) ( not ( = ?auto_767736 ?auto_767740 ) ) ( not ( = ?auto_767736 ?auto_767741 ) ) ( not ( = ?auto_767736 ?auto_767742 ) ) ( not ( = ?auto_767736 ?auto_767743 ) ) ( not ( = ?auto_767737 ?auto_767738 ) ) ( not ( = ?auto_767737 ?auto_767739 ) ) ( not ( = ?auto_767737 ?auto_767740 ) ) ( not ( = ?auto_767737 ?auto_767741 ) ) ( not ( = ?auto_767737 ?auto_767742 ) ) ( not ( = ?auto_767737 ?auto_767743 ) ) ( not ( = ?auto_767738 ?auto_767739 ) ) ( not ( = ?auto_767738 ?auto_767740 ) ) ( not ( = ?auto_767738 ?auto_767741 ) ) ( not ( = ?auto_767738 ?auto_767742 ) ) ( not ( = ?auto_767738 ?auto_767743 ) ) ( not ( = ?auto_767739 ?auto_767740 ) ) ( not ( = ?auto_767739 ?auto_767741 ) ) ( not ( = ?auto_767739 ?auto_767742 ) ) ( not ( = ?auto_767739 ?auto_767743 ) ) ( not ( = ?auto_767740 ?auto_767741 ) ) ( not ( = ?auto_767740 ?auto_767742 ) ) ( not ( = ?auto_767740 ?auto_767743 ) ) ( not ( = ?auto_767741 ?auto_767742 ) ) ( not ( = ?auto_767741 ?auto_767743 ) ) ( not ( = ?auto_767742 ?auto_767743 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_767742 ?auto_767743 )
      ( !STACK ?auto_767742 ?auto_767741 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_767778 - BLOCK
      ?auto_767779 - BLOCK
      ?auto_767780 - BLOCK
      ?auto_767781 - BLOCK
      ?auto_767782 - BLOCK
      ?auto_767783 - BLOCK
      ?auto_767784 - BLOCK
      ?auto_767785 - BLOCK
      ?auto_767786 - BLOCK
      ?auto_767787 - BLOCK
      ?auto_767788 - BLOCK
    )
    :vars
    (
      ?auto_767789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767788 ?auto_767789 ) ( ON-TABLE ?auto_767778 ) ( ON ?auto_767779 ?auto_767778 ) ( ON ?auto_767780 ?auto_767779 ) ( ON ?auto_767781 ?auto_767780 ) ( ON ?auto_767782 ?auto_767781 ) ( ON ?auto_767783 ?auto_767782 ) ( ON ?auto_767784 ?auto_767783 ) ( ON ?auto_767785 ?auto_767784 ) ( ON ?auto_767786 ?auto_767785 ) ( not ( = ?auto_767778 ?auto_767779 ) ) ( not ( = ?auto_767778 ?auto_767780 ) ) ( not ( = ?auto_767778 ?auto_767781 ) ) ( not ( = ?auto_767778 ?auto_767782 ) ) ( not ( = ?auto_767778 ?auto_767783 ) ) ( not ( = ?auto_767778 ?auto_767784 ) ) ( not ( = ?auto_767778 ?auto_767785 ) ) ( not ( = ?auto_767778 ?auto_767786 ) ) ( not ( = ?auto_767778 ?auto_767787 ) ) ( not ( = ?auto_767778 ?auto_767788 ) ) ( not ( = ?auto_767778 ?auto_767789 ) ) ( not ( = ?auto_767779 ?auto_767780 ) ) ( not ( = ?auto_767779 ?auto_767781 ) ) ( not ( = ?auto_767779 ?auto_767782 ) ) ( not ( = ?auto_767779 ?auto_767783 ) ) ( not ( = ?auto_767779 ?auto_767784 ) ) ( not ( = ?auto_767779 ?auto_767785 ) ) ( not ( = ?auto_767779 ?auto_767786 ) ) ( not ( = ?auto_767779 ?auto_767787 ) ) ( not ( = ?auto_767779 ?auto_767788 ) ) ( not ( = ?auto_767779 ?auto_767789 ) ) ( not ( = ?auto_767780 ?auto_767781 ) ) ( not ( = ?auto_767780 ?auto_767782 ) ) ( not ( = ?auto_767780 ?auto_767783 ) ) ( not ( = ?auto_767780 ?auto_767784 ) ) ( not ( = ?auto_767780 ?auto_767785 ) ) ( not ( = ?auto_767780 ?auto_767786 ) ) ( not ( = ?auto_767780 ?auto_767787 ) ) ( not ( = ?auto_767780 ?auto_767788 ) ) ( not ( = ?auto_767780 ?auto_767789 ) ) ( not ( = ?auto_767781 ?auto_767782 ) ) ( not ( = ?auto_767781 ?auto_767783 ) ) ( not ( = ?auto_767781 ?auto_767784 ) ) ( not ( = ?auto_767781 ?auto_767785 ) ) ( not ( = ?auto_767781 ?auto_767786 ) ) ( not ( = ?auto_767781 ?auto_767787 ) ) ( not ( = ?auto_767781 ?auto_767788 ) ) ( not ( = ?auto_767781 ?auto_767789 ) ) ( not ( = ?auto_767782 ?auto_767783 ) ) ( not ( = ?auto_767782 ?auto_767784 ) ) ( not ( = ?auto_767782 ?auto_767785 ) ) ( not ( = ?auto_767782 ?auto_767786 ) ) ( not ( = ?auto_767782 ?auto_767787 ) ) ( not ( = ?auto_767782 ?auto_767788 ) ) ( not ( = ?auto_767782 ?auto_767789 ) ) ( not ( = ?auto_767783 ?auto_767784 ) ) ( not ( = ?auto_767783 ?auto_767785 ) ) ( not ( = ?auto_767783 ?auto_767786 ) ) ( not ( = ?auto_767783 ?auto_767787 ) ) ( not ( = ?auto_767783 ?auto_767788 ) ) ( not ( = ?auto_767783 ?auto_767789 ) ) ( not ( = ?auto_767784 ?auto_767785 ) ) ( not ( = ?auto_767784 ?auto_767786 ) ) ( not ( = ?auto_767784 ?auto_767787 ) ) ( not ( = ?auto_767784 ?auto_767788 ) ) ( not ( = ?auto_767784 ?auto_767789 ) ) ( not ( = ?auto_767785 ?auto_767786 ) ) ( not ( = ?auto_767785 ?auto_767787 ) ) ( not ( = ?auto_767785 ?auto_767788 ) ) ( not ( = ?auto_767785 ?auto_767789 ) ) ( not ( = ?auto_767786 ?auto_767787 ) ) ( not ( = ?auto_767786 ?auto_767788 ) ) ( not ( = ?auto_767786 ?auto_767789 ) ) ( not ( = ?auto_767787 ?auto_767788 ) ) ( not ( = ?auto_767787 ?auto_767789 ) ) ( not ( = ?auto_767788 ?auto_767789 ) ) ( CLEAR ?auto_767786 ) ( ON ?auto_767787 ?auto_767788 ) ( CLEAR ?auto_767787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_767778 ?auto_767779 ?auto_767780 ?auto_767781 ?auto_767782 ?auto_767783 ?auto_767784 ?auto_767785 ?auto_767786 ?auto_767787 )
      ( MAKE-11PILE ?auto_767778 ?auto_767779 ?auto_767780 ?auto_767781 ?auto_767782 ?auto_767783 ?auto_767784 ?auto_767785 ?auto_767786 ?auto_767787 ?auto_767788 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_767824 - BLOCK
      ?auto_767825 - BLOCK
      ?auto_767826 - BLOCK
      ?auto_767827 - BLOCK
      ?auto_767828 - BLOCK
      ?auto_767829 - BLOCK
      ?auto_767830 - BLOCK
      ?auto_767831 - BLOCK
      ?auto_767832 - BLOCK
      ?auto_767833 - BLOCK
      ?auto_767834 - BLOCK
    )
    :vars
    (
      ?auto_767835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767834 ?auto_767835 ) ( ON-TABLE ?auto_767824 ) ( ON ?auto_767825 ?auto_767824 ) ( ON ?auto_767826 ?auto_767825 ) ( ON ?auto_767827 ?auto_767826 ) ( ON ?auto_767828 ?auto_767827 ) ( ON ?auto_767829 ?auto_767828 ) ( ON ?auto_767830 ?auto_767829 ) ( ON ?auto_767831 ?auto_767830 ) ( not ( = ?auto_767824 ?auto_767825 ) ) ( not ( = ?auto_767824 ?auto_767826 ) ) ( not ( = ?auto_767824 ?auto_767827 ) ) ( not ( = ?auto_767824 ?auto_767828 ) ) ( not ( = ?auto_767824 ?auto_767829 ) ) ( not ( = ?auto_767824 ?auto_767830 ) ) ( not ( = ?auto_767824 ?auto_767831 ) ) ( not ( = ?auto_767824 ?auto_767832 ) ) ( not ( = ?auto_767824 ?auto_767833 ) ) ( not ( = ?auto_767824 ?auto_767834 ) ) ( not ( = ?auto_767824 ?auto_767835 ) ) ( not ( = ?auto_767825 ?auto_767826 ) ) ( not ( = ?auto_767825 ?auto_767827 ) ) ( not ( = ?auto_767825 ?auto_767828 ) ) ( not ( = ?auto_767825 ?auto_767829 ) ) ( not ( = ?auto_767825 ?auto_767830 ) ) ( not ( = ?auto_767825 ?auto_767831 ) ) ( not ( = ?auto_767825 ?auto_767832 ) ) ( not ( = ?auto_767825 ?auto_767833 ) ) ( not ( = ?auto_767825 ?auto_767834 ) ) ( not ( = ?auto_767825 ?auto_767835 ) ) ( not ( = ?auto_767826 ?auto_767827 ) ) ( not ( = ?auto_767826 ?auto_767828 ) ) ( not ( = ?auto_767826 ?auto_767829 ) ) ( not ( = ?auto_767826 ?auto_767830 ) ) ( not ( = ?auto_767826 ?auto_767831 ) ) ( not ( = ?auto_767826 ?auto_767832 ) ) ( not ( = ?auto_767826 ?auto_767833 ) ) ( not ( = ?auto_767826 ?auto_767834 ) ) ( not ( = ?auto_767826 ?auto_767835 ) ) ( not ( = ?auto_767827 ?auto_767828 ) ) ( not ( = ?auto_767827 ?auto_767829 ) ) ( not ( = ?auto_767827 ?auto_767830 ) ) ( not ( = ?auto_767827 ?auto_767831 ) ) ( not ( = ?auto_767827 ?auto_767832 ) ) ( not ( = ?auto_767827 ?auto_767833 ) ) ( not ( = ?auto_767827 ?auto_767834 ) ) ( not ( = ?auto_767827 ?auto_767835 ) ) ( not ( = ?auto_767828 ?auto_767829 ) ) ( not ( = ?auto_767828 ?auto_767830 ) ) ( not ( = ?auto_767828 ?auto_767831 ) ) ( not ( = ?auto_767828 ?auto_767832 ) ) ( not ( = ?auto_767828 ?auto_767833 ) ) ( not ( = ?auto_767828 ?auto_767834 ) ) ( not ( = ?auto_767828 ?auto_767835 ) ) ( not ( = ?auto_767829 ?auto_767830 ) ) ( not ( = ?auto_767829 ?auto_767831 ) ) ( not ( = ?auto_767829 ?auto_767832 ) ) ( not ( = ?auto_767829 ?auto_767833 ) ) ( not ( = ?auto_767829 ?auto_767834 ) ) ( not ( = ?auto_767829 ?auto_767835 ) ) ( not ( = ?auto_767830 ?auto_767831 ) ) ( not ( = ?auto_767830 ?auto_767832 ) ) ( not ( = ?auto_767830 ?auto_767833 ) ) ( not ( = ?auto_767830 ?auto_767834 ) ) ( not ( = ?auto_767830 ?auto_767835 ) ) ( not ( = ?auto_767831 ?auto_767832 ) ) ( not ( = ?auto_767831 ?auto_767833 ) ) ( not ( = ?auto_767831 ?auto_767834 ) ) ( not ( = ?auto_767831 ?auto_767835 ) ) ( not ( = ?auto_767832 ?auto_767833 ) ) ( not ( = ?auto_767832 ?auto_767834 ) ) ( not ( = ?auto_767832 ?auto_767835 ) ) ( not ( = ?auto_767833 ?auto_767834 ) ) ( not ( = ?auto_767833 ?auto_767835 ) ) ( not ( = ?auto_767834 ?auto_767835 ) ) ( ON ?auto_767833 ?auto_767834 ) ( CLEAR ?auto_767831 ) ( ON ?auto_767832 ?auto_767833 ) ( CLEAR ?auto_767832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_767824 ?auto_767825 ?auto_767826 ?auto_767827 ?auto_767828 ?auto_767829 ?auto_767830 ?auto_767831 ?auto_767832 )
      ( MAKE-11PILE ?auto_767824 ?auto_767825 ?auto_767826 ?auto_767827 ?auto_767828 ?auto_767829 ?auto_767830 ?auto_767831 ?auto_767832 ?auto_767833 ?auto_767834 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_767870 - BLOCK
      ?auto_767871 - BLOCK
      ?auto_767872 - BLOCK
      ?auto_767873 - BLOCK
      ?auto_767874 - BLOCK
      ?auto_767875 - BLOCK
      ?auto_767876 - BLOCK
      ?auto_767877 - BLOCK
      ?auto_767878 - BLOCK
      ?auto_767879 - BLOCK
      ?auto_767880 - BLOCK
    )
    :vars
    (
      ?auto_767881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767880 ?auto_767881 ) ( ON-TABLE ?auto_767870 ) ( ON ?auto_767871 ?auto_767870 ) ( ON ?auto_767872 ?auto_767871 ) ( ON ?auto_767873 ?auto_767872 ) ( ON ?auto_767874 ?auto_767873 ) ( ON ?auto_767875 ?auto_767874 ) ( ON ?auto_767876 ?auto_767875 ) ( not ( = ?auto_767870 ?auto_767871 ) ) ( not ( = ?auto_767870 ?auto_767872 ) ) ( not ( = ?auto_767870 ?auto_767873 ) ) ( not ( = ?auto_767870 ?auto_767874 ) ) ( not ( = ?auto_767870 ?auto_767875 ) ) ( not ( = ?auto_767870 ?auto_767876 ) ) ( not ( = ?auto_767870 ?auto_767877 ) ) ( not ( = ?auto_767870 ?auto_767878 ) ) ( not ( = ?auto_767870 ?auto_767879 ) ) ( not ( = ?auto_767870 ?auto_767880 ) ) ( not ( = ?auto_767870 ?auto_767881 ) ) ( not ( = ?auto_767871 ?auto_767872 ) ) ( not ( = ?auto_767871 ?auto_767873 ) ) ( not ( = ?auto_767871 ?auto_767874 ) ) ( not ( = ?auto_767871 ?auto_767875 ) ) ( not ( = ?auto_767871 ?auto_767876 ) ) ( not ( = ?auto_767871 ?auto_767877 ) ) ( not ( = ?auto_767871 ?auto_767878 ) ) ( not ( = ?auto_767871 ?auto_767879 ) ) ( not ( = ?auto_767871 ?auto_767880 ) ) ( not ( = ?auto_767871 ?auto_767881 ) ) ( not ( = ?auto_767872 ?auto_767873 ) ) ( not ( = ?auto_767872 ?auto_767874 ) ) ( not ( = ?auto_767872 ?auto_767875 ) ) ( not ( = ?auto_767872 ?auto_767876 ) ) ( not ( = ?auto_767872 ?auto_767877 ) ) ( not ( = ?auto_767872 ?auto_767878 ) ) ( not ( = ?auto_767872 ?auto_767879 ) ) ( not ( = ?auto_767872 ?auto_767880 ) ) ( not ( = ?auto_767872 ?auto_767881 ) ) ( not ( = ?auto_767873 ?auto_767874 ) ) ( not ( = ?auto_767873 ?auto_767875 ) ) ( not ( = ?auto_767873 ?auto_767876 ) ) ( not ( = ?auto_767873 ?auto_767877 ) ) ( not ( = ?auto_767873 ?auto_767878 ) ) ( not ( = ?auto_767873 ?auto_767879 ) ) ( not ( = ?auto_767873 ?auto_767880 ) ) ( not ( = ?auto_767873 ?auto_767881 ) ) ( not ( = ?auto_767874 ?auto_767875 ) ) ( not ( = ?auto_767874 ?auto_767876 ) ) ( not ( = ?auto_767874 ?auto_767877 ) ) ( not ( = ?auto_767874 ?auto_767878 ) ) ( not ( = ?auto_767874 ?auto_767879 ) ) ( not ( = ?auto_767874 ?auto_767880 ) ) ( not ( = ?auto_767874 ?auto_767881 ) ) ( not ( = ?auto_767875 ?auto_767876 ) ) ( not ( = ?auto_767875 ?auto_767877 ) ) ( not ( = ?auto_767875 ?auto_767878 ) ) ( not ( = ?auto_767875 ?auto_767879 ) ) ( not ( = ?auto_767875 ?auto_767880 ) ) ( not ( = ?auto_767875 ?auto_767881 ) ) ( not ( = ?auto_767876 ?auto_767877 ) ) ( not ( = ?auto_767876 ?auto_767878 ) ) ( not ( = ?auto_767876 ?auto_767879 ) ) ( not ( = ?auto_767876 ?auto_767880 ) ) ( not ( = ?auto_767876 ?auto_767881 ) ) ( not ( = ?auto_767877 ?auto_767878 ) ) ( not ( = ?auto_767877 ?auto_767879 ) ) ( not ( = ?auto_767877 ?auto_767880 ) ) ( not ( = ?auto_767877 ?auto_767881 ) ) ( not ( = ?auto_767878 ?auto_767879 ) ) ( not ( = ?auto_767878 ?auto_767880 ) ) ( not ( = ?auto_767878 ?auto_767881 ) ) ( not ( = ?auto_767879 ?auto_767880 ) ) ( not ( = ?auto_767879 ?auto_767881 ) ) ( not ( = ?auto_767880 ?auto_767881 ) ) ( ON ?auto_767879 ?auto_767880 ) ( ON ?auto_767878 ?auto_767879 ) ( CLEAR ?auto_767876 ) ( ON ?auto_767877 ?auto_767878 ) ( CLEAR ?auto_767877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_767870 ?auto_767871 ?auto_767872 ?auto_767873 ?auto_767874 ?auto_767875 ?auto_767876 ?auto_767877 )
      ( MAKE-11PILE ?auto_767870 ?auto_767871 ?auto_767872 ?auto_767873 ?auto_767874 ?auto_767875 ?auto_767876 ?auto_767877 ?auto_767878 ?auto_767879 ?auto_767880 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_767916 - BLOCK
      ?auto_767917 - BLOCK
      ?auto_767918 - BLOCK
      ?auto_767919 - BLOCK
      ?auto_767920 - BLOCK
      ?auto_767921 - BLOCK
      ?auto_767922 - BLOCK
      ?auto_767923 - BLOCK
      ?auto_767924 - BLOCK
      ?auto_767925 - BLOCK
      ?auto_767926 - BLOCK
    )
    :vars
    (
      ?auto_767927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767926 ?auto_767927 ) ( ON-TABLE ?auto_767916 ) ( ON ?auto_767917 ?auto_767916 ) ( ON ?auto_767918 ?auto_767917 ) ( ON ?auto_767919 ?auto_767918 ) ( ON ?auto_767920 ?auto_767919 ) ( ON ?auto_767921 ?auto_767920 ) ( not ( = ?auto_767916 ?auto_767917 ) ) ( not ( = ?auto_767916 ?auto_767918 ) ) ( not ( = ?auto_767916 ?auto_767919 ) ) ( not ( = ?auto_767916 ?auto_767920 ) ) ( not ( = ?auto_767916 ?auto_767921 ) ) ( not ( = ?auto_767916 ?auto_767922 ) ) ( not ( = ?auto_767916 ?auto_767923 ) ) ( not ( = ?auto_767916 ?auto_767924 ) ) ( not ( = ?auto_767916 ?auto_767925 ) ) ( not ( = ?auto_767916 ?auto_767926 ) ) ( not ( = ?auto_767916 ?auto_767927 ) ) ( not ( = ?auto_767917 ?auto_767918 ) ) ( not ( = ?auto_767917 ?auto_767919 ) ) ( not ( = ?auto_767917 ?auto_767920 ) ) ( not ( = ?auto_767917 ?auto_767921 ) ) ( not ( = ?auto_767917 ?auto_767922 ) ) ( not ( = ?auto_767917 ?auto_767923 ) ) ( not ( = ?auto_767917 ?auto_767924 ) ) ( not ( = ?auto_767917 ?auto_767925 ) ) ( not ( = ?auto_767917 ?auto_767926 ) ) ( not ( = ?auto_767917 ?auto_767927 ) ) ( not ( = ?auto_767918 ?auto_767919 ) ) ( not ( = ?auto_767918 ?auto_767920 ) ) ( not ( = ?auto_767918 ?auto_767921 ) ) ( not ( = ?auto_767918 ?auto_767922 ) ) ( not ( = ?auto_767918 ?auto_767923 ) ) ( not ( = ?auto_767918 ?auto_767924 ) ) ( not ( = ?auto_767918 ?auto_767925 ) ) ( not ( = ?auto_767918 ?auto_767926 ) ) ( not ( = ?auto_767918 ?auto_767927 ) ) ( not ( = ?auto_767919 ?auto_767920 ) ) ( not ( = ?auto_767919 ?auto_767921 ) ) ( not ( = ?auto_767919 ?auto_767922 ) ) ( not ( = ?auto_767919 ?auto_767923 ) ) ( not ( = ?auto_767919 ?auto_767924 ) ) ( not ( = ?auto_767919 ?auto_767925 ) ) ( not ( = ?auto_767919 ?auto_767926 ) ) ( not ( = ?auto_767919 ?auto_767927 ) ) ( not ( = ?auto_767920 ?auto_767921 ) ) ( not ( = ?auto_767920 ?auto_767922 ) ) ( not ( = ?auto_767920 ?auto_767923 ) ) ( not ( = ?auto_767920 ?auto_767924 ) ) ( not ( = ?auto_767920 ?auto_767925 ) ) ( not ( = ?auto_767920 ?auto_767926 ) ) ( not ( = ?auto_767920 ?auto_767927 ) ) ( not ( = ?auto_767921 ?auto_767922 ) ) ( not ( = ?auto_767921 ?auto_767923 ) ) ( not ( = ?auto_767921 ?auto_767924 ) ) ( not ( = ?auto_767921 ?auto_767925 ) ) ( not ( = ?auto_767921 ?auto_767926 ) ) ( not ( = ?auto_767921 ?auto_767927 ) ) ( not ( = ?auto_767922 ?auto_767923 ) ) ( not ( = ?auto_767922 ?auto_767924 ) ) ( not ( = ?auto_767922 ?auto_767925 ) ) ( not ( = ?auto_767922 ?auto_767926 ) ) ( not ( = ?auto_767922 ?auto_767927 ) ) ( not ( = ?auto_767923 ?auto_767924 ) ) ( not ( = ?auto_767923 ?auto_767925 ) ) ( not ( = ?auto_767923 ?auto_767926 ) ) ( not ( = ?auto_767923 ?auto_767927 ) ) ( not ( = ?auto_767924 ?auto_767925 ) ) ( not ( = ?auto_767924 ?auto_767926 ) ) ( not ( = ?auto_767924 ?auto_767927 ) ) ( not ( = ?auto_767925 ?auto_767926 ) ) ( not ( = ?auto_767925 ?auto_767927 ) ) ( not ( = ?auto_767926 ?auto_767927 ) ) ( ON ?auto_767925 ?auto_767926 ) ( ON ?auto_767924 ?auto_767925 ) ( ON ?auto_767923 ?auto_767924 ) ( CLEAR ?auto_767921 ) ( ON ?auto_767922 ?auto_767923 ) ( CLEAR ?auto_767922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_767916 ?auto_767917 ?auto_767918 ?auto_767919 ?auto_767920 ?auto_767921 ?auto_767922 )
      ( MAKE-11PILE ?auto_767916 ?auto_767917 ?auto_767918 ?auto_767919 ?auto_767920 ?auto_767921 ?auto_767922 ?auto_767923 ?auto_767924 ?auto_767925 ?auto_767926 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_767962 - BLOCK
      ?auto_767963 - BLOCK
      ?auto_767964 - BLOCK
      ?auto_767965 - BLOCK
      ?auto_767966 - BLOCK
      ?auto_767967 - BLOCK
      ?auto_767968 - BLOCK
      ?auto_767969 - BLOCK
      ?auto_767970 - BLOCK
      ?auto_767971 - BLOCK
      ?auto_767972 - BLOCK
    )
    :vars
    (
      ?auto_767973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_767972 ?auto_767973 ) ( ON-TABLE ?auto_767962 ) ( ON ?auto_767963 ?auto_767962 ) ( ON ?auto_767964 ?auto_767963 ) ( ON ?auto_767965 ?auto_767964 ) ( ON ?auto_767966 ?auto_767965 ) ( not ( = ?auto_767962 ?auto_767963 ) ) ( not ( = ?auto_767962 ?auto_767964 ) ) ( not ( = ?auto_767962 ?auto_767965 ) ) ( not ( = ?auto_767962 ?auto_767966 ) ) ( not ( = ?auto_767962 ?auto_767967 ) ) ( not ( = ?auto_767962 ?auto_767968 ) ) ( not ( = ?auto_767962 ?auto_767969 ) ) ( not ( = ?auto_767962 ?auto_767970 ) ) ( not ( = ?auto_767962 ?auto_767971 ) ) ( not ( = ?auto_767962 ?auto_767972 ) ) ( not ( = ?auto_767962 ?auto_767973 ) ) ( not ( = ?auto_767963 ?auto_767964 ) ) ( not ( = ?auto_767963 ?auto_767965 ) ) ( not ( = ?auto_767963 ?auto_767966 ) ) ( not ( = ?auto_767963 ?auto_767967 ) ) ( not ( = ?auto_767963 ?auto_767968 ) ) ( not ( = ?auto_767963 ?auto_767969 ) ) ( not ( = ?auto_767963 ?auto_767970 ) ) ( not ( = ?auto_767963 ?auto_767971 ) ) ( not ( = ?auto_767963 ?auto_767972 ) ) ( not ( = ?auto_767963 ?auto_767973 ) ) ( not ( = ?auto_767964 ?auto_767965 ) ) ( not ( = ?auto_767964 ?auto_767966 ) ) ( not ( = ?auto_767964 ?auto_767967 ) ) ( not ( = ?auto_767964 ?auto_767968 ) ) ( not ( = ?auto_767964 ?auto_767969 ) ) ( not ( = ?auto_767964 ?auto_767970 ) ) ( not ( = ?auto_767964 ?auto_767971 ) ) ( not ( = ?auto_767964 ?auto_767972 ) ) ( not ( = ?auto_767964 ?auto_767973 ) ) ( not ( = ?auto_767965 ?auto_767966 ) ) ( not ( = ?auto_767965 ?auto_767967 ) ) ( not ( = ?auto_767965 ?auto_767968 ) ) ( not ( = ?auto_767965 ?auto_767969 ) ) ( not ( = ?auto_767965 ?auto_767970 ) ) ( not ( = ?auto_767965 ?auto_767971 ) ) ( not ( = ?auto_767965 ?auto_767972 ) ) ( not ( = ?auto_767965 ?auto_767973 ) ) ( not ( = ?auto_767966 ?auto_767967 ) ) ( not ( = ?auto_767966 ?auto_767968 ) ) ( not ( = ?auto_767966 ?auto_767969 ) ) ( not ( = ?auto_767966 ?auto_767970 ) ) ( not ( = ?auto_767966 ?auto_767971 ) ) ( not ( = ?auto_767966 ?auto_767972 ) ) ( not ( = ?auto_767966 ?auto_767973 ) ) ( not ( = ?auto_767967 ?auto_767968 ) ) ( not ( = ?auto_767967 ?auto_767969 ) ) ( not ( = ?auto_767967 ?auto_767970 ) ) ( not ( = ?auto_767967 ?auto_767971 ) ) ( not ( = ?auto_767967 ?auto_767972 ) ) ( not ( = ?auto_767967 ?auto_767973 ) ) ( not ( = ?auto_767968 ?auto_767969 ) ) ( not ( = ?auto_767968 ?auto_767970 ) ) ( not ( = ?auto_767968 ?auto_767971 ) ) ( not ( = ?auto_767968 ?auto_767972 ) ) ( not ( = ?auto_767968 ?auto_767973 ) ) ( not ( = ?auto_767969 ?auto_767970 ) ) ( not ( = ?auto_767969 ?auto_767971 ) ) ( not ( = ?auto_767969 ?auto_767972 ) ) ( not ( = ?auto_767969 ?auto_767973 ) ) ( not ( = ?auto_767970 ?auto_767971 ) ) ( not ( = ?auto_767970 ?auto_767972 ) ) ( not ( = ?auto_767970 ?auto_767973 ) ) ( not ( = ?auto_767971 ?auto_767972 ) ) ( not ( = ?auto_767971 ?auto_767973 ) ) ( not ( = ?auto_767972 ?auto_767973 ) ) ( ON ?auto_767971 ?auto_767972 ) ( ON ?auto_767970 ?auto_767971 ) ( ON ?auto_767969 ?auto_767970 ) ( ON ?auto_767968 ?auto_767969 ) ( CLEAR ?auto_767966 ) ( ON ?auto_767967 ?auto_767968 ) ( CLEAR ?auto_767967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_767962 ?auto_767963 ?auto_767964 ?auto_767965 ?auto_767966 ?auto_767967 )
      ( MAKE-11PILE ?auto_767962 ?auto_767963 ?auto_767964 ?auto_767965 ?auto_767966 ?auto_767967 ?auto_767968 ?auto_767969 ?auto_767970 ?auto_767971 ?auto_767972 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_768008 - BLOCK
      ?auto_768009 - BLOCK
      ?auto_768010 - BLOCK
      ?auto_768011 - BLOCK
      ?auto_768012 - BLOCK
      ?auto_768013 - BLOCK
      ?auto_768014 - BLOCK
      ?auto_768015 - BLOCK
      ?auto_768016 - BLOCK
      ?auto_768017 - BLOCK
      ?auto_768018 - BLOCK
    )
    :vars
    (
      ?auto_768019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768018 ?auto_768019 ) ( ON-TABLE ?auto_768008 ) ( ON ?auto_768009 ?auto_768008 ) ( ON ?auto_768010 ?auto_768009 ) ( ON ?auto_768011 ?auto_768010 ) ( not ( = ?auto_768008 ?auto_768009 ) ) ( not ( = ?auto_768008 ?auto_768010 ) ) ( not ( = ?auto_768008 ?auto_768011 ) ) ( not ( = ?auto_768008 ?auto_768012 ) ) ( not ( = ?auto_768008 ?auto_768013 ) ) ( not ( = ?auto_768008 ?auto_768014 ) ) ( not ( = ?auto_768008 ?auto_768015 ) ) ( not ( = ?auto_768008 ?auto_768016 ) ) ( not ( = ?auto_768008 ?auto_768017 ) ) ( not ( = ?auto_768008 ?auto_768018 ) ) ( not ( = ?auto_768008 ?auto_768019 ) ) ( not ( = ?auto_768009 ?auto_768010 ) ) ( not ( = ?auto_768009 ?auto_768011 ) ) ( not ( = ?auto_768009 ?auto_768012 ) ) ( not ( = ?auto_768009 ?auto_768013 ) ) ( not ( = ?auto_768009 ?auto_768014 ) ) ( not ( = ?auto_768009 ?auto_768015 ) ) ( not ( = ?auto_768009 ?auto_768016 ) ) ( not ( = ?auto_768009 ?auto_768017 ) ) ( not ( = ?auto_768009 ?auto_768018 ) ) ( not ( = ?auto_768009 ?auto_768019 ) ) ( not ( = ?auto_768010 ?auto_768011 ) ) ( not ( = ?auto_768010 ?auto_768012 ) ) ( not ( = ?auto_768010 ?auto_768013 ) ) ( not ( = ?auto_768010 ?auto_768014 ) ) ( not ( = ?auto_768010 ?auto_768015 ) ) ( not ( = ?auto_768010 ?auto_768016 ) ) ( not ( = ?auto_768010 ?auto_768017 ) ) ( not ( = ?auto_768010 ?auto_768018 ) ) ( not ( = ?auto_768010 ?auto_768019 ) ) ( not ( = ?auto_768011 ?auto_768012 ) ) ( not ( = ?auto_768011 ?auto_768013 ) ) ( not ( = ?auto_768011 ?auto_768014 ) ) ( not ( = ?auto_768011 ?auto_768015 ) ) ( not ( = ?auto_768011 ?auto_768016 ) ) ( not ( = ?auto_768011 ?auto_768017 ) ) ( not ( = ?auto_768011 ?auto_768018 ) ) ( not ( = ?auto_768011 ?auto_768019 ) ) ( not ( = ?auto_768012 ?auto_768013 ) ) ( not ( = ?auto_768012 ?auto_768014 ) ) ( not ( = ?auto_768012 ?auto_768015 ) ) ( not ( = ?auto_768012 ?auto_768016 ) ) ( not ( = ?auto_768012 ?auto_768017 ) ) ( not ( = ?auto_768012 ?auto_768018 ) ) ( not ( = ?auto_768012 ?auto_768019 ) ) ( not ( = ?auto_768013 ?auto_768014 ) ) ( not ( = ?auto_768013 ?auto_768015 ) ) ( not ( = ?auto_768013 ?auto_768016 ) ) ( not ( = ?auto_768013 ?auto_768017 ) ) ( not ( = ?auto_768013 ?auto_768018 ) ) ( not ( = ?auto_768013 ?auto_768019 ) ) ( not ( = ?auto_768014 ?auto_768015 ) ) ( not ( = ?auto_768014 ?auto_768016 ) ) ( not ( = ?auto_768014 ?auto_768017 ) ) ( not ( = ?auto_768014 ?auto_768018 ) ) ( not ( = ?auto_768014 ?auto_768019 ) ) ( not ( = ?auto_768015 ?auto_768016 ) ) ( not ( = ?auto_768015 ?auto_768017 ) ) ( not ( = ?auto_768015 ?auto_768018 ) ) ( not ( = ?auto_768015 ?auto_768019 ) ) ( not ( = ?auto_768016 ?auto_768017 ) ) ( not ( = ?auto_768016 ?auto_768018 ) ) ( not ( = ?auto_768016 ?auto_768019 ) ) ( not ( = ?auto_768017 ?auto_768018 ) ) ( not ( = ?auto_768017 ?auto_768019 ) ) ( not ( = ?auto_768018 ?auto_768019 ) ) ( ON ?auto_768017 ?auto_768018 ) ( ON ?auto_768016 ?auto_768017 ) ( ON ?auto_768015 ?auto_768016 ) ( ON ?auto_768014 ?auto_768015 ) ( ON ?auto_768013 ?auto_768014 ) ( CLEAR ?auto_768011 ) ( ON ?auto_768012 ?auto_768013 ) ( CLEAR ?auto_768012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_768008 ?auto_768009 ?auto_768010 ?auto_768011 ?auto_768012 )
      ( MAKE-11PILE ?auto_768008 ?auto_768009 ?auto_768010 ?auto_768011 ?auto_768012 ?auto_768013 ?auto_768014 ?auto_768015 ?auto_768016 ?auto_768017 ?auto_768018 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_768054 - BLOCK
      ?auto_768055 - BLOCK
      ?auto_768056 - BLOCK
      ?auto_768057 - BLOCK
      ?auto_768058 - BLOCK
      ?auto_768059 - BLOCK
      ?auto_768060 - BLOCK
      ?auto_768061 - BLOCK
      ?auto_768062 - BLOCK
      ?auto_768063 - BLOCK
      ?auto_768064 - BLOCK
    )
    :vars
    (
      ?auto_768065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768064 ?auto_768065 ) ( ON-TABLE ?auto_768054 ) ( ON ?auto_768055 ?auto_768054 ) ( ON ?auto_768056 ?auto_768055 ) ( not ( = ?auto_768054 ?auto_768055 ) ) ( not ( = ?auto_768054 ?auto_768056 ) ) ( not ( = ?auto_768054 ?auto_768057 ) ) ( not ( = ?auto_768054 ?auto_768058 ) ) ( not ( = ?auto_768054 ?auto_768059 ) ) ( not ( = ?auto_768054 ?auto_768060 ) ) ( not ( = ?auto_768054 ?auto_768061 ) ) ( not ( = ?auto_768054 ?auto_768062 ) ) ( not ( = ?auto_768054 ?auto_768063 ) ) ( not ( = ?auto_768054 ?auto_768064 ) ) ( not ( = ?auto_768054 ?auto_768065 ) ) ( not ( = ?auto_768055 ?auto_768056 ) ) ( not ( = ?auto_768055 ?auto_768057 ) ) ( not ( = ?auto_768055 ?auto_768058 ) ) ( not ( = ?auto_768055 ?auto_768059 ) ) ( not ( = ?auto_768055 ?auto_768060 ) ) ( not ( = ?auto_768055 ?auto_768061 ) ) ( not ( = ?auto_768055 ?auto_768062 ) ) ( not ( = ?auto_768055 ?auto_768063 ) ) ( not ( = ?auto_768055 ?auto_768064 ) ) ( not ( = ?auto_768055 ?auto_768065 ) ) ( not ( = ?auto_768056 ?auto_768057 ) ) ( not ( = ?auto_768056 ?auto_768058 ) ) ( not ( = ?auto_768056 ?auto_768059 ) ) ( not ( = ?auto_768056 ?auto_768060 ) ) ( not ( = ?auto_768056 ?auto_768061 ) ) ( not ( = ?auto_768056 ?auto_768062 ) ) ( not ( = ?auto_768056 ?auto_768063 ) ) ( not ( = ?auto_768056 ?auto_768064 ) ) ( not ( = ?auto_768056 ?auto_768065 ) ) ( not ( = ?auto_768057 ?auto_768058 ) ) ( not ( = ?auto_768057 ?auto_768059 ) ) ( not ( = ?auto_768057 ?auto_768060 ) ) ( not ( = ?auto_768057 ?auto_768061 ) ) ( not ( = ?auto_768057 ?auto_768062 ) ) ( not ( = ?auto_768057 ?auto_768063 ) ) ( not ( = ?auto_768057 ?auto_768064 ) ) ( not ( = ?auto_768057 ?auto_768065 ) ) ( not ( = ?auto_768058 ?auto_768059 ) ) ( not ( = ?auto_768058 ?auto_768060 ) ) ( not ( = ?auto_768058 ?auto_768061 ) ) ( not ( = ?auto_768058 ?auto_768062 ) ) ( not ( = ?auto_768058 ?auto_768063 ) ) ( not ( = ?auto_768058 ?auto_768064 ) ) ( not ( = ?auto_768058 ?auto_768065 ) ) ( not ( = ?auto_768059 ?auto_768060 ) ) ( not ( = ?auto_768059 ?auto_768061 ) ) ( not ( = ?auto_768059 ?auto_768062 ) ) ( not ( = ?auto_768059 ?auto_768063 ) ) ( not ( = ?auto_768059 ?auto_768064 ) ) ( not ( = ?auto_768059 ?auto_768065 ) ) ( not ( = ?auto_768060 ?auto_768061 ) ) ( not ( = ?auto_768060 ?auto_768062 ) ) ( not ( = ?auto_768060 ?auto_768063 ) ) ( not ( = ?auto_768060 ?auto_768064 ) ) ( not ( = ?auto_768060 ?auto_768065 ) ) ( not ( = ?auto_768061 ?auto_768062 ) ) ( not ( = ?auto_768061 ?auto_768063 ) ) ( not ( = ?auto_768061 ?auto_768064 ) ) ( not ( = ?auto_768061 ?auto_768065 ) ) ( not ( = ?auto_768062 ?auto_768063 ) ) ( not ( = ?auto_768062 ?auto_768064 ) ) ( not ( = ?auto_768062 ?auto_768065 ) ) ( not ( = ?auto_768063 ?auto_768064 ) ) ( not ( = ?auto_768063 ?auto_768065 ) ) ( not ( = ?auto_768064 ?auto_768065 ) ) ( ON ?auto_768063 ?auto_768064 ) ( ON ?auto_768062 ?auto_768063 ) ( ON ?auto_768061 ?auto_768062 ) ( ON ?auto_768060 ?auto_768061 ) ( ON ?auto_768059 ?auto_768060 ) ( ON ?auto_768058 ?auto_768059 ) ( CLEAR ?auto_768056 ) ( ON ?auto_768057 ?auto_768058 ) ( CLEAR ?auto_768057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_768054 ?auto_768055 ?auto_768056 ?auto_768057 )
      ( MAKE-11PILE ?auto_768054 ?auto_768055 ?auto_768056 ?auto_768057 ?auto_768058 ?auto_768059 ?auto_768060 ?auto_768061 ?auto_768062 ?auto_768063 ?auto_768064 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_768100 - BLOCK
      ?auto_768101 - BLOCK
      ?auto_768102 - BLOCK
      ?auto_768103 - BLOCK
      ?auto_768104 - BLOCK
      ?auto_768105 - BLOCK
      ?auto_768106 - BLOCK
      ?auto_768107 - BLOCK
      ?auto_768108 - BLOCK
      ?auto_768109 - BLOCK
      ?auto_768110 - BLOCK
    )
    :vars
    (
      ?auto_768111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768110 ?auto_768111 ) ( ON-TABLE ?auto_768100 ) ( ON ?auto_768101 ?auto_768100 ) ( not ( = ?auto_768100 ?auto_768101 ) ) ( not ( = ?auto_768100 ?auto_768102 ) ) ( not ( = ?auto_768100 ?auto_768103 ) ) ( not ( = ?auto_768100 ?auto_768104 ) ) ( not ( = ?auto_768100 ?auto_768105 ) ) ( not ( = ?auto_768100 ?auto_768106 ) ) ( not ( = ?auto_768100 ?auto_768107 ) ) ( not ( = ?auto_768100 ?auto_768108 ) ) ( not ( = ?auto_768100 ?auto_768109 ) ) ( not ( = ?auto_768100 ?auto_768110 ) ) ( not ( = ?auto_768100 ?auto_768111 ) ) ( not ( = ?auto_768101 ?auto_768102 ) ) ( not ( = ?auto_768101 ?auto_768103 ) ) ( not ( = ?auto_768101 ?auto_768104 ) ) ( not ( = ?auto_768101 ?auto_768105 ) ) ( not ( = ?auto_768101 ?auto_768106 ) ) ( not ( = ?auto_768101 ?auto_768107 ) ) ( not ( = ?auto_768101 ?auto_768108 ) ) ( not ( = ?auto_768101 ?auto_768109 ) ) ( not ( = ?auto_768101 ?auto_768110 ) ) ( not ( = ?auto_768101 ?auto_768111 ) ) ( not ( = ?auto_768102 ?auto_768103 ) ) ( not ( = ?auto_768102 ?auto_768104 ) ) ( not ( = ?auto_768102 ?auto_768105 ) ) ( not ( = ?auto_768102 ?auto_768106 ) ) ( not ( = ?auto_768102 ?auto_768107 ) ) ( not ( = ?auto_768102 ?auto_768108 ) ) ( not ( = ?auto_768102 ?auto_768109 ) ) ( not ( = ?auto_768102 ?auto_768110 ) ) ( not ( = ?auto_768102 ?auto_768111 ) ) ( not ( = ?auto_768103 ?auto_768104 ) ) ( not ( = ?auto_768103 ?auto_768105 ) ) ( not ( = ?auto_768103 ?auto_768106 ) ) ( not ( = ?auto_768103 ?auto_768107 ) ) ( not ( = ?auto_768103 ?auto_768108 ) ) ( not ( = ?auto_768103 ?auto_768109 ) ) ( not ( = ?auto_768103 ?auto_768110 ) ) ( not ( = ?auto_768103 ?auto_768111 ) ) ( not ( = ?auto_768104 ?auto_768105 ) ) ( not ( = ?auto_768104 ?auto_768106 ) ) ( not ( = ?auto_768104 ?auto_768107 ) ) ( not ( = ?auto_768104 ?auto_768108 ) ) ( not ( = ?auto_768104 ?auto_768109 ) ) ( not ( = ?auto_768104 ?auto_768110 ) ) ( not ( = ?auto_768104 ?auto_768111 ) ) ( not ( = ?auto_768105 ?auto_768106 ) ) ( not ( = ?auto_768105 ?auto_768107 ) ) ( not ( = ?auto_768105 ?auto_768108 ) ) ( not ( = ?auto_768105 ?auto_768109 ) ) ( not ( = ?auto_768105 ?auto_768110 ) ) ( not ( = ?auto_768105 ?auto_768111 ) ) ( not ( = ?auto_768106 ?auto_768107 ) ) ( not ( = ?auto_768106 ?auto_768108 ) ) ( not ( = ?auto_768106 ?auto_768109 ) ) ( not ( = ?auto_768106 ?auto_768110 ) ) ( not ( = ?auto_768106 ?auto_768111 ) ) ( not ( = ?auto_768107 ?auto_768108 ) ) ( not ( = ?auto_768107 ?auto_768109 ) ) ( not ( = ?auto_768107 ?auto_768110 ) ) ( not ( = ?auto_768107 ?auto_768111 ) ) ( not ( = ?auto_768108 ?auto_768109 ) ) ( not ( = ?auto_768108 ?auto_768110 ) ) ( not ( = ?auto_768108 ?auto_768111 ) ) ( not ( = ?auto_768109 ?auto_768110 ) ) ( not ( = ?auto_768109 ?auto_768111 ) ) ( not ( = ?auto_768110 ?auto_768111 ) ) ( ON ?auto_768109 ?auto_768110 ) ( ON ?auto_768108 ?auto_768109 ) ( ON ?auto_768107 ?auto_768108 ) ( ON ?auto_768106 ?auto_768107 ) ( ON ?auto_768105 ?auto_768106 ) ( ON ?auto_768104 ?auto_768105 ) ( ON ?auto_768103 ?auto_768104 ) ( CLEAR ?auto_768101 ) ( ON ?auto_768102 ?auto_768103 ) ( CLEAR ?auto_768102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_768100 ?auto_768101 ?auto_768102 )
      ( MAKE-11PILE ?auto_768100 ?auto_768101 ?auto_768102 ?auto_768103 ?auto_768104 ?auto_768105 ?auto_768106 ?auto_768107 ?auto_768108 ?auto_768109 ?auto_768110 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_768146 - BLOCK
      ?auto_768147 - BLOCK
      ?auto_768148 - BLOCK
      ?auto_768149 - BLOCK
      ?auto_768150 - BLOCK
      ?auto_768151 - BLOCK
      ?auto_768152 - BLOCK
      ?auto_768153 - BLOCK
      ?auto_768154 - BLOCK
      ?auto_768155 - BLOCK
      ?auto_768156 - BLOCK
    )
    :vars
    (
      ?auto_768157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768156 ?auto_768157 ) ( ON-TABLE ?auto_768146 ) ( not ( = ?auto_768146 ?auto_768147 ) ) ( not ( = ?auto_768146 ?auto_768148 ) ) ( not ( = ?auto_768146 ?auto_768149 ) ) ( not ( = ?auto_768146 ?auto_768150 ) ) ( not ( = ?auto_768146 ?auto_768151 ) ) ( not ( = ?auto_768146 ?auto_768152 ) ) ( not ( = ?auto_768146 ?auto_768153 ) ) ( not ( = ?auto_768146 ?auto_768154 ) ) ( not ( = ?auto_768146 ?auto_768155 ) ) ( not ( = ?auto_768146 ?auto_768156 ) ) ( not ( = ?auto_768146 ?auto_768157 ) ) ( not ( = ?auto_768147 ?auto_768148 ) ) ( not ( = ?auto_768147 ?auto_768149 ) ) ( not ( = ?auto_768147 ?auto_768150 ) ) ( not ( = ?auto_768147 ?auto_768151 ) ) ( not ( = ?auto_768147 ?auto_768152 ) ) ( not ( = ?auto_768147 ?auto_768153 ) ) ( not ( = ?auto_768147 ?auto_768154 ) ) ( not ( = ?auto_768147 ?auto_768155 ) ) ( not ( = ?auto_768147 ?auto_768156 ) ) ( not ( = ?auto_768147 ?auto_768157 ) ) ( not ( = ?auto_768148 ?auto_768149 ) ) ( not ( = ?auto_768148 ?auto_768150 ) ) ( not ( = ?auto_768148 ?auto_768151 ) ) ( not ( = ?auto_768148 ?auto_768152 ) ) ( not ( = ?auto_768148 ?auto_768153 ) ) ( not ( = ?auto_768148 ?auto_768154 ) ) ( not ( = ?auto_768148 ?auto_768155 ) ) ( not ( = ?auto_768148 ?auto_768156 ) ) ( not ( = ?auto_768148 ?auto_768157 ) ) ( not ( = ?auto_768149 ?auto_768150 ) ) ( not ( = ?auto_768149 ?auto_768151 ) ) ( not ( = ?auto_768149 ?auto_768152 ) ) ( not ( = ?auto_768149 ?auto_768153 ) ) ( not ( = ?auto_768149 ?auto_768154 ) ) ( not ( = ?auto_768149 ?auto_768155 ) ) ( not ( = ?auto_768149 ?auto_768156 ) ) ( not ( = ?auto_768149 ?auto_768157 ) ) ( not ( = ?auto_768150 ?auto_768151 ) ) ( not ( = ?auto_768150 ?auto_768152 ) ) ( not ( = ?auto_768150 ?auto_768153 ) ) ( not ( = ?auto_768150 ?auto_768154 ) ) ( not ( = ?auto_768150 ?auto_768155 ) ) ( not ( = ?auto_768150 ?auto_768156 ) ) ( not ( = ?auto_768150 ?auto_768157 ) ) ( not ( = ?auto_768151 ?auto_768152 ) ) ( not ( = ?auto_768151 ?auto_768153 ) ) ( not ( = ?auto_768151 ?auto_768154 ) ) ( not ( = ?auto_768151 ?auto_768155 ) ) ( not ( = ?auto_768151 ?auto_768156 ) ) ( not ( = ?auto_768151 ?auto_768157 ) ) ( not ( = ?auto_768152 ?auto_768153 ) ) ( not ( = ?auto_768152 ?auto_768154 ) ) ( not ( = ?auto_768152 ?auto_768155 ) ) ( not ( = ?auto_768152 ?auto_768156 ) ) ( not ( = ?auto_768152 ?auto_768157 ) ) ( not ( = ?auto_768153 ?auto_768154 ) ) ( not ( = ?auto_768153 ?auto_768155 ) ) ( not ( = ?auto_768153 ?auto_768156 ) ) ( not ( = ?auto_768153 ?auto_768157 ) ) ( not ( = ?auto_768154 ?auto_768155 ) ) ( not ( = ?auto_768154 ?auto_768156 ) ) ( not ( = ?auto_768154 ?auto_768157 ) ) ( not ( = ?auto_768155 ?auto_768156 ) ) ( not ( = ?auto_768155 ?auto_768157 ) ) ( not ( = ?auto_768156 ?auto_768157 ) ) ( ON ?auto_768155 ?auto_768156 ) ( ON ?auto_768154 ?auto_768155 ) ( ON ?auto_768153 ?auto_768154 ) ( ON ?auto_768152 ?auto_768153 ) ( ON ?auto_768151 ?auto_768152 ) ( ON ?auto_768150 ?auto_768151 ) ( ON ?auto_768149 ?auto_768150 ) ( ON ?auto_768148 ?auto_768149 ) ( CLEAR ?auto_768146 ) ( ON ?auto_768147 ?auto_768148 ) ( CLEAR ?auto_768147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_768146 ?auto_768147 )
      ( MAKE-11PILE ?auto_768146 ?auto_768147 ?auto_768148 ?auto_768149 ?auto_768150 ?auto_768151 ?auto_768152 ?auto_768153 ?auto_768154 ?auto_768155 ?auto_768156 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_768192 - BLOCK
      ?auto_768193 - BLOCK
      ?auto_768194 - BLOCK
      ?auto_768195 - BLOCK
      ?auto_768196 - BLOCK
      ?auto_768197 - BLOCK
      ?auto_768198 - BLOCK
      ?auto_768199 - BLOCK
      ?auto_768200 - BLOCK
      ?auto_768201 - BLOCK
      ?auto_768202 - BLOCK
    )
    :vars
    (
      ?auto_768203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768202 ?auto_768203 ) ( not ( = ?auto_768192 ?auto_768193 ) ) ( not ( = ?auto_768192 ?auto_768194 ) ) ( not ( = ?auto_768192 ?auto_768195 ) ) ( not ( = ?auto_768192 ?auto_768196 ) ) ( not ( = ?auto_768192 ?auto_768197 ) ) ( not ( = ?auto_768192 ?auto_768198 ) ) ( not ( = ?auto_768192 ?auto_768199 ) ) ( not ( = ?auto_768192 ?auto_768200 ) ) ( not ( = ?auto_768192 ?auto_768201 ) ) ( not ( = ?auto_768192 ?auto_768202 ) ) ( not ( = ?auto_768192 ?auto_768203 ) ) ( not ( = ?auto_768193 ?auto_768194 ) ) ( not ( = ?auto_768193 ?auto_768195 ) ) ( not ( = ?auto_768193 ?auto_768196 ) ) ( not ( = ?auto_768193 ?auto_768197 ) ) ( not ( = ?auto_768193 ?auto_768198 ) ) ( not ( = ?auto_768193 ?auto_768199 ) ) ( not ( = ?auto_768193 ?auto_768200 ) ) ( not ( = ?auto_768193 ?auto_768201 ) ) ( not ( = ?auto_768193 ?auto_768202 ) ) ( not ( = ?auto_768193 ?auto_768203 ) ) ( not ( = ?auto_768194 ?auto_768195 ) ) ( not ( = ?auto_768194 ?auto_768196 ) ) ( not ( = ?auto_768194 ?auto_768197 ) ) ( not ( = ?auto_768194 ?auto_768198 ) ) ( not ( = ?auto_768194 ?auto_768199 ) ) ( not ( = ?auto_768194 ?auto_768200 ) ) ( not ( = ?auto_768194 ?auto_768201 ) ) ( not ( = ?auto_768194 ?auto_768202 ) ) ( not ( = ?auto_768194 ?auto_768203 ) ) ( not ( = ?auto_768195 ?auto_768196 ) ) ( not ( = ?auto_768195 ?auto_768197 ) ) ( not ( = ?auto_768195 ?auto_768198 ) ) ( not ( = ?auto_768195 ?auto_768199 ) ) ( not ( = ?auto_768195 ?auto_768200 ) ) ( not ( = ?auto_768195 ?auto_768201 ) ) ( not ( = ?auto_768195 ?auto_768202 ) ) ( not ( = ?auto_768195 ?auto_768203 ) ) ( not ( = ?auto_768196 ?auto_768197 ) ) ( not ( = ?auto_768196 ?auto_768198 ) ) ( not ( = ?auto_768196 ?auto_768199 ) ) ( not ( = ?auto_768196 ?auto_768200 ) ) ( not ( = ?auto_768196 ?auto_768201 ) ) ( not ( = ?auto_768196 ?auto_768202 ) ) ( not ( = ?auto_768196 ?auto_768203 ) ) ( not ( = ?auto_768197 ?auto_768198 ) ) ( not ( = ?auto_768197 ?auto_768199 ) ) ( not ( = ?auto_768197 ?auto_768200 ) ) ( not ( = ?auto_768197 ?auto_768201 ) ) ( not ( = ?auto_768197 ?auto_768202 ) ) ( not ( = ?auto_768197 ?auto_768203 ) ) ( not ( = ?auto_768198 ?auto_768199 ) ) ( not ( = ?auto_768198 ?auto_768200 ) ) ( not ( = ?auto_768198 ?auto_768201 ) ) ( not ( = ?auto_768198 ?auto_768202 ) ) ( not ( = ?auto_768198 ?auto_768203 ) ) ( not ( = ?auto_768199 ?auto_768200 ) ) ( not ( = ?auto_768199 ?auto_768201 ) ) ( not ( = ?auto_768199 ?auto_768202 ) ) ( not ( = ?auto_768199 ?auto_768203 ) ) ( not ( = ?auto_768200 ?auto_768201 ) ) ( not ( = ?auto_768200 ?auto_768202 ) ) ( not ( = ?auto_768200 ?auto_768203 ) ) ( not ( = ?auto_768201 ?auto_768202 ) ) ( not ( = ?auto_768201 ?auto_768203 ) ) ( not ( = ?auto_768202 ?auto_768203 ) ) ( ON ?auto_768201 ?auto_768202 ) ( ON ?auto_768200 ?auto_768201 ) ( ON ?auto_768199 ?auto_768200 ) ( ON ?auto_768198 ?auto_768199 ) ( ON ?auto_768197 ?auto_768198 ) ( ON ?auto_768196 ?auto_768197 ) ( ON ?auto_768195 ?auto_768196 ) ( ON ?auto_768194 ?auto_768195 ) ( ON ?auto_768193 ?auto_768194 ) ( ON ?auto_768192 ?auto_768193 ) ( CLEAR ?auto_768192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_768192 )
      ( MAKE-11PILE ?auto_768192 ?auto_768193 ?auto_768194 ?auto_768195 ?auto_768196 ?auto_768197 ?auto_768198 ?auto_768199 ?auto_768200 ?auto_768201 ?auto_768202 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_768239 - BLOCK
      ?auto_768240 - BLOCK
      ?auto_768241 - BLOCK
      ?auto_768242 - BLOCK
      ?auto_768243 - BLOCK
      ?auto_768244 - BLOCK
      ?auto_768245 - BLOCK
      ?auto_768246 - BLOCK
      ?auto_768247 - BLOCK
      ?auto_768248 - BLOCK
      ?auto_768249 - BLOCK
      ?auto_768250 - BLOCK
    )
    :vars
    (
      ?auto_768251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_768249 ) ( ON ?auto_768250 ?auto_768251 ) ( CLEAR ?auto_768250 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_768239 ) ( ON ?auto_768240 ?auto_768239 ) ( ON ?auto_768241 ?auto_768240 ) ( ON ?auto_768242 ?auto_768241 ) ( ON ?auto_768243 ?auto_768242 ) ( ON ?auto_768244 ?auto_768243 ) ( ON ?auto_768245 ?auto_768244 ) ( ON ?auto_768246 ?auto_768245 ) ( ON ?auto_768247 ?auto_768246 ) ( ON ?auto_768248 ?auto_768247 ) ( ON ?auto_768249 ?auto_768248 ) ( not ( = ?auto_768239 ?auto_768240 ) ) ( not ( = ?auto_768239 ?auto_768241 ) ) ( not ( = ?auto_768239 ?auto_768242 ) ) ( not ( = ?auto_768239 ?auto_768243 ) ) ( not ( = ?auto_768239 ?auto_768244 ) ) ( not ( = ?auto_768239 ?auto_768245 ) ) ( not ( = ?auto_768239 ?auto_768246 ) ) ( not ( = ?auto_768239 ?auto_768247 ) ) ( not ( = ?auto_768239 ?auto_768248 ) ) ( not ( = ?auto_768239 ?auto_768249 ) ) ( not ( = ?auto_768239 ?auto_768250 ) ) ( not ( = ?auto_768239 ?auto_768251 ) ) ( not ( = ?auto_768240 ?auto_768241 ) ) ( not ( = ?auto_768240 ?auto_768242 ) ) ( not ( = ?auto_768240 ?auto_768243 ) ) ( not ( = ?auto_768240 ?auto_768244 ) ) ( not ( = ?auto_768240 ?auto_768245 ) ) ( not ( = ?auto_768240 ?auto_768246 ) ) ( not ( = ?auto_768240 ?auto_768247 ) ) ( not ( = ?auto_768240 ?auto_768248 ) ) ( not ( = ?auto_768240 ?auto_768249 ) ) ( not ( = ?auto_768240 ?auto_768250 ) ) ( not ( = ?auto_768240 ?auto_768251 ) ) ( not ( = ?auto_768241 ?auto_768242 ) ) ( not ( = ?auto_768241 ?auto_768243 ) ) ( not ( = ?auto_768241 ?auto_768244 ) ) ( not ( = ?auto_768241 ?auto_768245 ) ) ( not ( = ?auto_768241 ?auto_768246 ) ) ( not ( = ?auto_768241 ?auto_768247 ) ) ( not ( = ?auto_768241 ?auto_768248 ) ) ( not ( = ?auto_768241 ?auto_768249 ) ) ( not ( = ?auto_768241 ?auto_768250 ) ) ( not ( = ?auto_768241 ?auto_768251 ) ) ( not ( = ?auto_768242 ?auto_768243 ) ) ( not ( = ?auto_768242 ?auto_768244 ) ) ( not ( = ?auto_768242 ?auto_768245 ) ) ( not ( = ?auto_768242 ?auto_768246 ) ) ( not ( = ?auto_768242 ?auto_768247 ) ) ( not ( = ?auto_768242 ?auto_768248 ) ) ( not ( = ?auto_768242 ?auto_768249 ) ) ( not ( = ?auto_768242 ?auto_768250 ) ) ( not ( = ?auto_768242 ?auto_768251 ) ) ( not ( = ?auto_768243 ?auto_768244 ) ) ( not ( = ?auto_768243 ?auto_768245 ) ) ( not ( = ?auto_768243 ?auto_768246 ) ) ( not ( = ?auto_768243 ?auto_768247 ) ) ( not ( = ?auto_768243 ?auto_768248 ) ) ( not ( = ?auto_768243 ?auto_768249 ) ) ( not ( = ?auto_768243 ?auto_768250 ) ) ( not ( = ?auto_768243 ?auto_768251 ) ) ( not ( = ?auto_768244 ?auto_768245 ) ) ( not ( = ?auto_768244 ?auto_768246 ) ) ( not ( = ?auto_768244 ?auto_768247 ) ) ( not ( = ?auto_768244 ?auto_768248 ) ) ( not ( = ?auto_768244 ?auto_768249 ) ) ( not ( = ?auto_768244 ?auto_768250 ) ) ( not ( = ?auto_768244 ?auto_768251 ) ) ( not ( = ?auto_768245 ?auto_768246 ) ) ( not ( = ?auto_768245 ?auto_768247 ) ) ( not ( = ?auto_768245 ?auto_768248 ) ) ( not ( = ?auto_768245 ?auto_768249 ) ) ( not ( = ?auto_768245 ?auto_768250 ) ) ( not ( = ?auto_768245 ?auto_768251 ) ) ( not ( = ?auto_768246 ?auto_768247 ) ) ( not ( = ?auto_768246 ?auto_768248 ) ) ( not ( = ?auto_768246 ?auto_768249 ) ) ( not ( = ?auto_768246 ?auto_768250 ) ) ( not ( = ?auto_768246 ?auto_768251 ) ) ( not ( = ?auto_768247 ?auto_768248 ) ) ( not ( = ?auto_768247 ?auto_768249 ) ) ( not ( = ?auto_768247 ?auto_768250 ) ) ( not ( = ?auto_768247 ?auto_768251 ) ) ( not ( = ?auto_768248 ?auto_768249 ) ) ( not ( = ?auto_768248 ?auto_768250 ) ) ( not ( = ?auto_768248 ?auto_768251 ) ) ( not ( = ?auto_768249 ?auto_768250 ) ) ( not ( = ?auto_768249 ?auto_768251 ) ) ( not ( = ?auto_768250 ?auto_768251 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_768250 ?auto_768251 )
      ( !STACK ?auto_768250 ?auto_768249 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_768289 - BLOCK
      ?auto_768290 - BLOCK
      ?auto_768291 - BLOCK
      ?auto_768292 - BLOCK
      ?auto_768293 - BLOCK
      ?auto_768294 - BLOCK
      ?auto_768295 - BLOCK
      ?auto_768296 - BLOCK
      ?auto_768297 - BLOCK
      ?auto_768298 - BLOCK
      ?auto_768299 - BLOCK
      ?auto_768300 - BLOCK
    )
    :vars
    (
      ?auto_768301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768300 ?auto_768301 ) ( ON-TABLE ?auto_768289 ) ( ON ?auto_768290 ?auto_768289 ) ( ON ?auto_768291 ?auto_768290 ) ( ON ?auto_768292 ?auto_768291 ) ( ON ?auto_768293 ?auto_768292 ) ( ON ?auto_768294 ?auto_768293 ) ( ON ?auto_768295 ?auto_768294 ) ( ON ?auto_768296 ?auto_768295 ) ( ON ?auto_768297 ?auto_768296 ) ( ON ?auto_768298 ?auto_768297 ) ( not ( = ?auto_768289 ?auto_768290 ) ) ( not ( = ?auto_768289 ?auto_768291 ) ) ( not ( = ?auto_768289 ?auto_768292 ) ) ( not ( = ?auto_768289 ?auto_768293 ) ) ( not ( = ?auto_768289 ?auto_768294 ) ) ( not ( = ?auto_768289 ?auto_768295 ) ) ( not ( = ?auto_768289 ?auto_768296 ) ) ( not ( = ?auto_768289 ?auto_768297 ) ) ( not ( = ?auto_768289 ?auto_768298 ) ) ( not ( = ?auto_768289 ?auto_768299 ) ) ( not ( = ?auto_768289 ?auto_768300 ) ) ( not ( = ?auto_768289 ?auto_768301 ) ) ( not ( = ?auto_768290 ?auto_768291 ) ) ( not ( = ?auto_768290 ?auto_768292 ) ) ( not ( = ?auto_768290 ?auto_768293 ) ) ( not ( = ?auto_768290 ?auto_768294 ) ) ( not ( = ?auto_768290 ?auto_768295 ) ) ( not ( = ?auto_768290 ?auto_768296 ) ) ( not ( = ?auto_768290 ?auto_768297 ) ) ( not ( = ?auto_768290 ?auto_768298 ) ) ( not ( = ?auto_768290 ?auto_768299 ) ) ( not ( = ?auto_768290 ?auto_768300 ) ) ( not ( = ?auto_768290 ?auto_768301 ) ) ( not ( = ?auto_768291 ?auto_768292 ) ) ( not ( = ?auto_768291 ?auto_768293 ) ) ( not ( = ?auto_768291 ?auto_768294 ) ) ( not ( = ?auto_768291 ?auto_768295 ) ) ( not ( = ?auto_768291 ?auto_768296 ) ) ( not ( = ?auto_768291 ?auto_768297 ) ) ( not ( = ?auto_768291 ?auto_768298 ) ) ( not ( = ?auto_768291 ?auto_768299 ) ) ( not ( = ?auto_768291 ?auto_768300 ) ) ( not ( = ?auto_768291 ?auto_768301 ) ) ( not ( = ?auto_768292 ?auto_768293 ) ) ( not ( = ?auto_768292 ?auto_768294 ) ) ( not ( = ?auto_768292 ?auto_768295 ) ) ( not ( = ?auto_768292 ?auto_768296 ) ) ( not ( = ?auto_768292 ?auto_768297 ) ) ( not ( = ?auto_768292 ?auto_768298 ) ) ( not ( = ?auto_768292 ?auto_768299 ) ) ( not ( = ?auto_768292 ?auto_768300 ) ) ( not ( = ?auto_768292 ?auto_768301 ) ) ( not ( = ?auto_768293 ?auto_768294 ) ) ( not ( = ?auto_768293 ?auto_768295 ) ) ( not ( = ?auto_768293 ?auto_768296 ) ) ( not ( = ?auto_768293 ?auto_768297 ) ) ( not ( = ?auto_768293 ?auto_768298 ) ) ( not ( = ?auto_768293 ?auto_768299 ) ) ( not ( = ?auto_768293 ?auto_768300 ) ) ( not ( = ?auto_768293 ?auto_768301 ) ) ( not ( = ?auto_768294 ?auto_768295 ) ) ( not ( = ?auto_768294 ?auto_768296 ) ) ( not ( = ?auto_768294 ?auto_768297 ) ) ( not ( = ?auto_768294 ?auto_768298 ) ) ( not ( = ?auto_768294 ?auto_768299 ) ) ( not ( = ?auto_768294 ?auto_768300 ) ) ( not ( = ?auto_768294 ?auto_768301 ) ) ( not ( = ?auto_768295 ?auto_768296 ) ) ( not ( = ?auto_768295 ?auto_768297 ) ) ( not ( = ?auto_768295 ?auto_768298 ) ) ( not ( = ?auto_768295 ?auto_768299 ) ) ( not ( = ?auto_768295 ?auto_768300 ) ) ( not ( = ?auto_768295 ?auto_768301 ) ) ( not ( = ?auto_768296 ?auto_768297 ) ) ( not ( = ?auto_768296 ?auto_768298 ) ) ( not ( = ?auto_768296 ?auto_768299 ) ) ( not ( = ?auto_768296 ?auto_768300 ) ) ( not ( = ?auto_768296 ?auto_768301 ) ) ( not ( = ?auto_768297 ?auto_768298 ) ) ( not ( = ?auto_768297 ?auto_768299 ) ) ( not ( = ?auto_768297 ?auto_768300 ) ) ( not ( = ?auto_768297 ?auto_768301 ) ) ( not ( = ?auto_768298 ?auto_768299 ) ) ( not ( = ?auto_768298 ?auto_768300 ) ) ( not ( = ?auto_768298 ?auto_768301 ) ) ( not ( = ?auto_768299 ?auto_768300 ) ) ( not ( = ?auto_768299 ?auto_768301 ) ) ( not ( = ?auto_768300 ?auto_768301 ) ) ( CLEAR ?auto_768298 ) ( ON ?auto_768299 ?auto_768300 ) ( CLEAR ?auto_768299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_768289 ?auto_768290 ?auto_768291 ?auto_768292 ?auto_768293 ?auto_768294 ?auto_768295 ?auto_768296 ?auto_768297 ?auto_768298 ?auto_768299 )
      ( MAKE-12PILE ?auto_768289 ?auto_768290 ?auto_768291 ?auto_768292 ?auto_768293 ?auto_768294 ?auto_768295 ?auto_768296 ?auto_768297 ?auto_768298 ?auto_768299 ?auto_768300 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_768339 - BLOCK
      ?auto_768340 - BLOCK
      ?auto_768341 - BLOCK
      ?auto_768342 - BLOCK
      ?auto_768343 - BLOCK
      ?auto_768344 - BLOCK
      ?auto_768345 - BLOCK
      ?auto_768346 - BLOCK
      ?auto_768347 - BLOCK
      ?auto_768348 - BLOCK
      ?auto_768349 - BLOCK
      ?auto_768350 - BLOCK
    )
    :vars
    (
      ?auto_768351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768350 ?auto_768351 ) ( ON-TABLE ?auto_768339 ) ( ON ?auto_768340 ?auto_768339 ) ( ON ?auto_768341 ?auto_768340 ) ( ON ?auto_768342 ?auto_768341 ) ( ON ?auto_768343 ?auto_768342 ) ( ON ?auto_768344 ?auto_768343 ) ( ON ?auto_768345 ?auto_768344 ) ( ON ?auto_768346 ?auto_768345 ) ( ON ?auto_768347 ?auto_768346 ) ( not ( = ?auto_768339 ?auto_768340 ) ) ( not ( = ?auto_768339 ?auto_768341 ) ) ( not ( = ?auto_768339 ?auto_768342 ) ) ( not ( = ?auto_768339 ?auto_768343 ) ) ( not ( = ?auto_768339 ?auto_768344 ) ) ( not ( = ?auto_768339 ?auto_768345 ) ) ( not ( = ?auto_768339 ?auto_768346 ) ) ( not ( = ?auto_768339 ?auto_768347 ) ) ( not ( = ?auto_768339 ?auto_768348 ) ) ( not ( = ?auto_768339 ?auto_768349 ) ) ( not ( = ?auto_768339 ?auto_768350 ) ) ( not ( = ?auto_768339 ?auto_768351 ) ) ( not ( = ?auto_768340 ?auto_768341 ) ) ( not ( = ?auto_768340 ?auto_768342 ) ) ( not ( = ?auto_768340 ?auto_768343 ) ) ( not ( = ?auto_768340 ?auto_768344 ) ) ( not ( = ?auto_768340 ?auto_768345 ) ) ( not ( = ?auto_768340 ?auto_768346 ) ) ( not ( = ?auto_768340 ?auto_768347 ) ) ( not ( = ?auto_768340 ?auto_768348 ) ) ( not ( = ?auto_768340 ?auto_768349 ) ) ( not ( = ?auto_768340 ?auto_768350 ) ) ( not ( = ?auto_768340 ?auto_768351 ) ) ( not ( = ?auto_768341 ?auto_768342 ) ) ( not ( = ?auto_768341 ?auto_768343 ) ) ( not ( = ?auto_768341 ?auto_768344 ) ) ( not ( = ?auto_768341 ?auto_768345 ) ) ( not ( = ?auto_768341 ?auto_768346 ) ) ( not ( = ?auto_768341 ?auto_768347 ) ) ( not ( = ?auto_768341 ?auto_768348 ) ) ( not ( = ?auto_768341 ?auto_768349 ) ) ( not ( = ?auto_768341 ?auto_768350 ) ) ( not ( = ?auto_768341 ?auto_768351 ) ) ( not ( = ?auto_768342 ?auto_768343 ) ) ( not ( = ?auto_768342 ?auto_768344 ) ) ( not ( = ?auto_768342 ?auto_768345 ) ) ( not ( = ?auto_768342 ?auto_768346 ) ) ( not ( = ?auto_768342 ?auto_768347 ) ) ( not ( = ?auto_768342 ?auto_768348 ) ) ( not ( = ?auto_768342 ?auto_768349 ) ) ( not ( = ?auto_768342 ?auto_768350 ) ) ( not ( = ?auto_768342 ?auto_768351 ) ) ( not ( = ?auto_768343 ?auto_768344 ) ) ( not ( = ?auto_768343 ?auto_768345 ) ) ( not ( = ?auto_768343 ?auto_768346 ) ) ( not ( = ?auto_768343 ?auto_768347 ) ) ( not ( = ?auto_768343 ?auto_768348 ) ) ( not ( = ?auto_768343 ?auto_768349 ) ) ( not ( = ?auto_768343 ?auto_768350 ) ) ( not ( = ?auto_768343 ?auto_768351 ) ) ( not ( = ?auto_768344 ?auto_768345 ) ) ( not ( = ?auto_768344 ?auto_768346 ) ) ( not ( = ?auto_768344 ?auto_768347 ) ) ( not ( = ?auto_768344 ?auto_768348 ) ) ( not ( = ?auto_768344 ?auto_768349 ) ) ( not ( = ?auto_768344 ?auto_768350 ) ) ( not ( = ?auto_768344 ?auto_768351 ) ) ( not ( = ?auto_768345 ?auto_768346 ) ) ( not ( = ?auto_768345 ?auto_768347 ) ) ( not ( = ?auto_768345 ?auto_768348 ) ) ( not ( = ?auto_768345 ?auto_768349 ) ) ( not ( = ?auto_768345 ?auto_768350 ) ) ( not ( = ?auto_768345 ?auto_768351 ) ) ( not ( = ?auto_768346 ?auto_768347 ) ) ( not ( = ?auto_768346 ?auto_768348 ) ) ( not ( = ?auto_768346 ?auto_768349 ) ) ( not ( = ?auto_768346 ?auto_768350 ) ) ( not ( = ?auto_768346 ?auto_768351 ) ) ( not ( = ?auto_768347 ?auto_768348 ) ) ( not ( = ?auto_768347 ?auto_768349 ) ) ( not ( = ?auto_768347 ?auto_768350 ) ) ( not ( = ?auto_768347 ?auto_768351 ) ) ( not ( = ?auto_768348 ?auto_768349 ) ) ( not ( = ?auto_768348 ?auto_768350 ) ) ( not ( = ?auto_768348 ?auto_768351 ) ) ( not ( = ?auto_768349 ?auto_768350 ) ) ( not ( = ?auto_768349 ?auto_768351 ) ) ( not ( = ?auto_768350 ?auto_768351 ) ) ( ON ?auto_768349 ?auto_768350 ) ( CLEAR ?auto_768347 ) ( ON ?auto_768348 ?auto_768349 ) ( CLEAR ?auto_768348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_768339 ?auto_768340 ?auto_768341 ?auto_768342 ?auto_768343 ?auto_768344 ?auto_768345 ?auto_768346 ?auto_768347 ?auto_768348 )
      ( MAKE-12PILE ?auto_768339 ?auto_768340 ?auto_768341 ?auto_768342 ?auto_768343 ?auto_768344 ?auto_768345 ?auto_768346 ?auto_768347 ?auto_768348 ?auto_768349 ?auto_768350 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_768389 - BLOCK
      ?auto_768390 - BLOCK
      ?auto_768391 - BLOCK
      ?auto_768392 - BLOCK
      ?auto_768393 - BLOCK
      ?auto_768394 - BLOCK
      ?auto_768395 - BLOCK
      ?auto_768396 - BLOCK
      ?auto_768397 - BLOCK
      ?auto_768398 - BLOCK
      ?auto_768399 - BLOCK
      ?auto_768400 - BLOCK
    )
    :vars
    (
      ?auto_768401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768400 ?auto_768401 ) ( ON-TABLE ?auto_768389 ) ( ON ?auto_768390 ?auto_768389 ) ( ON ?auto_768391 ?auto_768390 ) ( ON ?auto_768392 ?auto_768391 ) ( ON ?auto_768393 ?auto_768392 ) ( ON ?auto_768394 ?auto_768393 ) ( ON ?auto_768395 ?auto_768394 ) ( ON ?auto_768396 ?auto_768395 ) ( not ( = ?auto_768389 ?auto_768390 ) ) ( not ( = ?auto_768389 ?auto_768391 ) ) ( not ( = ?auto_768389 ?auto_768392 ) ) ( not ( = ?auto_768389 ?auto_768393 ) ) ( not ( = ?auto_768389 ?auto_768394 ) ) ( not ( = ?auto_768389 ?auto_768395 ) ) ( not ( = ?auto_768389 ?auto_768396 ) ) ( not ( = ?auto_768389 ?auto_768397 ) ) ( not ( = ?auto_768389 ?auto_768398 ) ) ( not ( = ?auto_768389 ?auto_768399 ) ) ( not ( = ?auto_768389 ?auto_768400 ) ) ( not ( = ?auto_768389 ?auto_768401 ) ) ( not ( = ?auto_768390 ?auto_768391 ) ) ( not ( = ?auto_768390 ?auto_768392 ) ) ( not ( = ?auto_768390 ?auto_768393 ) ) ( not ( = ?auto_768390 ?auto_768394 ) ) ( not ( = ?auto_768390 ?auto_768395 ) ) ( not ( = ?auto_768390 ?auto_768396 ) ) ( not ( = ?auto_768390 ?auto_768397 ) ) ( not ( = ?auto_768390 ?auto_768398 ) ) ( not ( = ?auto_768390 ?auto_768399 ) ) ( not ( = ?auto_768390 ?auto_768400 ) ) ( not ( = ?auto_768390 ?auto_768401 ) ) ( not ( = ?auto_768391 ?auto_768392 ) ) ( not ( = ?auto_768391 ?auto_768393 ) ) ( not ( = ?auto_768391 ?auto_768394 ) ) ( not ( = ?auto_768391 ?auto_768395 ) ) ( not ( = ?auto_768391 ?auto_768396 ) ) ( not ( = ?auto_768391 ?auto_768397 ) ) ( not ( = ?auto_768391 ?auto_768398 ) ) ( not ( = ?auto_768391 ?auto_768399 ) ) ( not ( = ?auto_768391 ?auto_768400 ) ) ( not ( = ?auto_768391 ?auto_768401 ) ) ( not ( = ?auto_768392 ?auto_768393 ) ) ( not ( = ?auto_768392 ?auto_768394 ) ) ( not ( = ?auto_768392 ?auto_768395 ) ) ( not ( = ?auto_768392 ?auto_768396 ) ) ( not ( = ?auto_768392 ?auto_768397 ) ) ( not ( = ?auto_768392 ?auto_768398 ) ) ( not ( = ?auto_768392 ?auto_768399 ) ) ( not ( = ?auto_768392 ?auto_768400 ) ) ( not ( = ?auto_768392 ?auto_768401 ) ) ( not ( = ?auto_768393 ?auto_768394 ) ) ( not ( = ?auto_768393 ?auto_768395 ) ) ( not ( = ?auto_768393 ?auto_768396 ) ) ( not ( = ?auto_768393 ?auto_768397 ) ) ( not ( = ?auto_768393 ?auto_768398 ) ) ( not ( = ?auto_768393 ?auto_768399 ) ) ( not ( = ?auto_768393 ?auto_768400 ) ) ( not ( = ?auto_768393 ?auto_768401 ) ) ( not ( = ?auto_768394 ?auto_768395 ) ) ( not ( = ?auto_768394 ?auto_768396 ) ) ( not ( = ?auto_768394 ?auto_768397 ) ) ( not ( = ?auto_768394 ?auto_768398 ) ) ( not ( = ?auto_768394 ?auto_768399 ) ) ( not ( = ?auto_768394 ?auto_768400 ) ) ( not ( = ?auto_768394 ?auto_768401 ) ) ( not ( = ?auto_768395 ?auto_768396 ) ) ( not ( = ?auto_768395 ?auto_768397 ) ) ( not ( = ?auto_768395 ?auto_768398 ) ) ( not ( = ?auto_768395 ?auto_768399 ) ) ( not ( = ?auto_768395 ?auto_768400 ) ) ( not ( = ?auto_768395 ?auto_768401 ) ) ( not ( = ?auto_768396 ?auto_768397 ) ) ( not ( = ?auto_768396 ?auto_768398 ) ) ( not ( = ?auto_768396 ?auto_768399 ) ) ( not ( = ?auto_768396 ?auto_768400 ) ) ( not ( = ?auto_768396 ?auto_768401 ) ) ( not ( = ?auto_768397 ?auto_768398 ) ) ( not ( = ?auto_768397 ?auto_768399 ) ) ( not ( = ?auto_768397 ?auto_768400 ) ) ( not ( = ?auto_768397 ?auto_768401 ) ) ( not ( = ?auto_768398 ?auto_768399 ) ) ( not ( = ?auto_768398 ?auto_768400 ) ) ( not ( = ?auto_768398 ?auto_768401 ) ) ( not ( = ?auto_768399 ?auto_768400 ) ) ( not ( = ?auto_768399 ?auto_768401 ) ) ( not ( = ?auto_768400 ?auto_768401 ) ) ( ON ?auto_768399 ?auto_768400 ) ( ON ?auto_768398 ?auto_768399 ) ( CLEAR ?auto_768396 ) ( ON ?auto_768397 ?auto_768398 ) ( CLEAR ?auto_768397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_768389 ?auto_768390 ?auto_768391 ?auto_768392 ?auto_768393 ?auto_768394 ?auto_768395 ?auto_768396 ?auto_768397 )
      ( MAKE-12PILE ?auto_768389 ?auto_768390 ?auto_768391 ?auto_768392 ?auto_768393 ?auto_768394 ?auto_768395 ?auto_768396 ?auto_768397 ?auto_768398 ?auto_768399 ?auto_768400 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_768439 - BLOCK
      ?auto_768440 - BLOCK
      ?auto_768441 - BLOCK
      ?auto_768442 - BLOCK
      ?auto_768443 - BLOCK
      ?auto_768444 - BLOCK
      ?auto_768445 - BLOCK
      ?auto_768446 - BLOCK
      ?auto_768447 - BLOCK
      ?auto_768448 - BLOCK
      ?auto_768449 - BLOCK
      ?auto_768450 - BLOCK
    )
    :vars
    (
      ?auto_768451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768450 ?auto_768451 ) ( ON-TABLE ?auto_768439 ) ( ON ?auto_768440 ?auto_768439 ) ( ON ?auto_768441 ?auto_768440 ) ( ON ?auto_768442 ?auto_768441 ) ( ON ?auto_768443 ?auto_768442 ) ( ON ?auto_768444 ?auto_768443 ) ( ON ?auto_768445 ?auto_768444 ) ( not ( = ?auto_768439 ?auto_768440 ) ) ( not ( = ?auto_768439 ?auto_768441 ) ) ( not ( = ?auto_768439 ?auto_768442 ) ) ( not ( = ?auto_768439 ?auto_768443 ) ) ( not ( = ?auto_768439 ?auto_768444 ) ) ( not ( = ?auto_768439 ?auto_768445 ) ) ( not ( = ?auto_768439 ?auto_768446 ) ) ( not ( = ?auto_768439 ?auto_768447 ) ) ( not ( = ?auto_768439 ?auto_768448 ) ) ( not ( = ?auto_768439 ?auto_768449 ) ) ( not ( = ?auto_768439 ?auto_768450 ) ) ( not ( = ?auto_768439 ?auto_768451 ) ) ( not ( = ?auto_768440 ?auto_768441 ) ) ( not ( = ?auto_768440 ?auto_768442 ) ) ( not ( = ?auto_768440 ?auto_768443 ) ) ( not ( = ?auto_768440 ?auto_768444 ) ) ( not ( = ?auto_768440 ?auto_768445 ) ) ( not ( = ?auto_768440 ?auto_768446 ) ) ( not ( = ?auto_768440 ?auto_768447 ) ) ( not ( = ?auto_768440 ?auto_768448 ) ) ( not ( = ?auto_768440 ?auto_768449 ) ) ( not ( = ?auto_768440 ?auto_768450 ) ) ( not ( = ?auto_768440 ?auto_768451 ) ) ( not ( = ?auto_768441 ?auto_768442 ) ) ( not ( = ?auto_768441 ?auto_768443 ) ) ( not ( = ?auto_768441 ?auto_768444 ) ) ( not ( = ?auto_768441 ?auto_768445 ) ) ( not ( = ?auto_768441 ?auto_768446 ) ) ( not ( = ?auto_768441 ?auto_768447 ) ) ( not ( = ?auto_768441 ?auto_768448 ) ) ( not ( = ?auto_768441 ?auto_768449 ) ) ( not ( = ?auto_768441 ?auto_768450 ) ) ( not ( = ?auto_768441 ?auto_768451 ) ) ( not ( = ?auto_768442 ?auto_768443 ) ) ( not ( = ?auto_768442 ?auto_768444 ) ) ( not ( = ?auto_768442 ?auto_768445 ) ) ( not ( = ?auto_768442 ?auto_768446 ) ) ( not ( = ?auto_768442 ?auto_768447 ) ) ( not ( = ?auto_768442 ?auto_768448 ) ) ( not ( = ?auto_768442 ?auto_768449 ) ) ( not ( = ?auto_768442 ?auto_768450 ) ) ( not ( = ?auto_768442 ?auto_768451 ) ) ( not ( = ?auto_768443 ?auto_768444 ) ) ( not ( = ?auto_768443 ?auto_768445 ) ) ( not ( = ?auto_768443 ?auto_768446 ) ) ( not ( = ?auto_768443 ?auto_768447 ) ) ( not ( = ?auto_768443 ?auto_768448 ) ) ( not ( = ?auto_768443 ?auto_768449 ) ) ( not ( = ?auto_768443 ?auto_768450 ) ) ( not ( = ?auto_768443 ?auto_768451 ) ) ( not ( = ?auto_768444 ?auto_768445 ) ) ( not ( = ?auto_768444 ?auto_768446 ) ) ( not ( = ?auto_768444 ?auto_768447 ) ) ( not ( = ?auto_768444 ?auto_768448 ) ) ( not ( = ?auto_768444 ?auto_768449 ) ) ( not ( = ?auto_768444 ?auto_768450 ) ) ( not ( = ?auto_768444 ?auto_768451 ) ) ( not ( = ?auto_768445 ?auto_768446 ) ) ( not ( = ?auto_768445 ?auto_768447 ) ) ( not ( = ?auto_768445 ?auto_768448 ) ) ( not ( = ?auto_768445 ?auto_768449 ) ) ( not ( = ?auto_768445 ?auto_768450 ) ) ( not ( = ?auto_768445 ?auto_768451 ) ) ( not ( = ?auto_768446 ?auto_768447 ) ) ( not ( = ?auto_768446 ?auto_768448 ) ) ( not ( = ?auto_768446 ?auto_768449 ) ) ( not ( = ?auto_768446 ?auto_768450 ) ) ( not ( = ?auto_768446 ?auto_768451 ) ) ( not ( = ?auto_768447 ?auto_768448 ) ) ( not ( = ?auto_768447 ?auto_768449 ) ) ( not ( = ?auto_768447 ?auto_768450 ) ) ( not ( = ?auto_768447 ?auto_768451 ) ) ( not ( = ?auto_768448 ?auto_768449 ) ) ( not ( = ?auto_768448 ?auto_768450 ) ) ( not ( = ?auto_768448 ?auto_768451 ) ) ( not ( = ?auto_768449 ?auto_768450 ) ) ( not ( = ?auto_768449 ?auto_768451 ) ) ( not ( = ?auto_768450 ?auto_768451 ) ) ( ON ?auto_768449 ?auto_768450 ) ( ON ?auto_768448 ?auto_768449 ) ( ON ?auto_768447 ?auto_768448 ) ( CLEAR ?auto_768445 ) ( ON ?auto_768446 ?auto_768447 ) ( CLEAR ?auto_768446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_768439 ?auto_768440 ?auto_768441 ?auto_768442 ?auto_768443 ?auto_768444 ?auto_768445 ?auto_768446 )
      ( MAKE-12PILE ?auto_768439 ?auto_768440 ?auto_768441 ?auto_768442 ?auto_768443 ?auto_768444 ?auto_768445 ?auto_768446 ?auto_768447 ?auto_768448 ?auto_768449 ?auto_768450 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_768489 - BLOCK
      ?auto_768490 - BLOCK
      ?auto_768491 - BLOCK
      ?auto_768492 - BLOCK
      ?auto_768493 - BLOCK
      ?auto_768494 - BLOCK
      ?auto_768495 - BLOCK
      ?auto_768496 - BLOCK
      ?auto_768497 - BLOCK
      ?auto_768498 - BLOCK
      ?auto_768499 - BLOCK
      ?auto_768500 - BLOCK
    )
    :vars
    (
      ?auto_768501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768500 ?auto_768501 ) ( ON-TABLE ?auto_768489 ) ( ON ?auto_768490 ?auto_768489 ) ( ON ?auto_768491 ?auto_768490 ) ( ON ?auto_768492 ?auto_768491 ) ( ON ?auto_768493 ?auto_768492 ) ( ON ?auto_768494 ?auto_768493 ) ( not ( = ?auto_768489 ?auto_768490 ) ) ( not ( = ?auto_768489 ?auto_768491 ) ) ( not ( = ?auto_768489 ?auto_768492 ) ) ( not ( = ?auto_768489 ?auto_768493 ) ) ( not ( = ?auto_768489 ?auto_768494 ) ) ( not ( = ?auto_768489 ?auto_768495 ) ) ( not ( = ?auto_768489 ?auto_768496 ) ) ( not ( = ?auto_768489 ?auto_768497 ) ) ( not ( = ?auto_768489 ?auto_768498 ) ) ( not ( = ?auto_768489 ?auto_768499 ) ) ( not ( = ?auto_768489 ?auto_768500 ) ) ( not ( = ?auto_768489 ?auto_768501 ) ) ( not ( = ?auto_768490 ?auto_768491 ) ) ( not ( = ?auto_768490 ?auto_768492 ) ) ( not ( = ?auto_768490 ?auto_768493 ) ) ( not ( = ?auto_768490 ?auto_768494 ) ) ( not ( = ?auto_768490 ?auto_768495 ) ) ( not ( = ?auto_768490 ?auto_768496 ) ) ( not ( = ?auto_768490 ?auto_768497 ) ) ( not ( = ?auto_768490 ?auto_768498 ) ) ( not ( = ?auto_768490 ?auto_768499 ) ) ( not ( = ?auto_768490 ?auto_768500 ) ) ( not ( = ?auto_768490 ?auto_768501 ) ) ( not ( = ?auto_768491 ?auto_768492 ) ) ( not ( = ?auto_768491 ?auto_768493 ) ) ( not ( = ?auto_768491 ?auto_768494 ) ) ( not ( = ?auto_768491 ?auto_768495 ) ) ( not ( = ?auto_768491 ?auto_768496 ) ) ( not ( = ?auto_768491 ?auto_768497 ) ) ( not ( = ?auto_768491 ?auto_768498 ) ) ( not ( = ?auto_768491 ?auto_768499 ) ) ( not ( = ?auto_768491 ?auto_768500 ) ) ( not ( = ?auto_768491 ?auto_768501 ) ) ( not ( = ?auto_768492 ?auto_768493 ) ) ( not ( = ?auto_768492 ?auto_768494 ) ) ( not ( = ?auto_768492 ?auto_768495 ) ) ( not ( = ?auto_768492 ?auto_768496 ) ) ( not ( = ?auto_768492 ?auto_768497 ) ) ( not ( = ?auto_768492 ?auto_768498 ) ) ( not ( = ?auto_768492 ?auto_768499 ) ) ( not ( = ?auto_768492 ?auto_768500 ) ) ( not ( = ?auto_768492 ?auto_768501 ) ) ( not ( = ?auto_768493 ?auto_768494 ) ) ( not ( = ?auto_768493 ?auto_768495 ) ) ( not ( = ?auto_768493 ?auto_768496 ) ) ( not ( = ?auto_768493 ?auto_768497 ) ) ( not ( = ?auto_768493 ?auto_768498 ) ) ( not ( = ?auto_768493 ?auto_768499 ) ) ( not ( = ?auto_768493 ?auto_768500 ) ) ( not ( = ?auto_768493 ?auto_768501 ) ) ( not ( = ?auto_768494 ?auto_768495 ) ) ( not ( = ?auto_768494 ?auto_768496 ) ) ( not ( = ?auto_768494 ?auto_768497 ) ) ( not ( = ?auto_768494 ?auto_768498 ) ) ( not ( = ?auto_768494 ?auto_768499 ) ) ( not ( = ?auto_768494 ?auto_768500 ) ) ( not ( = ?auto_768494 ?auto_768501 ) ) ( not ( = ?auto_768495 ?auto_768496 ) ) ( not ( = ?auto_768495 ?auto_768497 ) ) ( not ( = ?auto_768495 ?auto_768498 ) ) ( not ( = ?auto_768495 ?auto_768499 ) ) ( not ( = ?auto_768495 ?auto_768500 ) ) ( not ( = ?auto_768495 ?auto_768501 ) ) ( not ( = ?auto_768496 ?auto_768497 ) ) ( not ( = ?auto_768496 ?auto_768498 ) ) ( not ( = ?auto_768496 ?auto_768499 ) ) ( not ( = ?auto_768496 ?auto_768500 ) ) ( not ( = ?auto_768496 ?auto_768501 ) ) ( not ( = ?auto_768497 ?auto_768498 ) ) ( not ( = ?auto_768497 ?auto_768499 ) ) ( not ( = ?auto_768497 ?auto_768500 ) ) ( not ( = ?auto_768497 ?auto_768501 ) ) ( not ( = ?auto_768498 ?auto_768499 ) ) ( not ( = ?auto_768498 ?auto_768500 ) ) ( not ( = ?auto_768498 ?auto_768501 ) ) ( not ( = ?auto_768499 ?auto_768500 ) ) ( not ( = ?auto_768499 ?auto_768501 ) ) ( not ( = ?auto_768500 ?auto_768501 ) ) ( ON ?auto_768499 ?auto_768500 ) ( ON ?auto_768498 ?auto_768499 ) ( ON ?auto_768497 ?auto_768498 ) ( ON ?auto_768496 ?auto_768497 ) ( CLEAR ?auto_768494 ) ( ON ?auto_768495 ?auto_768496 ) ( CLEAR ?auto_768495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_768489 ?auto_768490 ?auto_768491 ?auto_768492 ?auto_768493 ?auto_768494 ?auto_768495 )
      ( MAKE-12PILE ?auto_768489 ?auto_768490 ?auto_768491 ?auto_768492 ?auto_768493 ?auto_768494 ?auto_768495 ?auto_768496 ?auto_768497 ?auto_768498 ?auto_768499 ?auto_768500 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_768539 - BLOCK
      ?auto_768540 - BLOCK
      ?auto_768541 - BLOCK
      ?auto_768542 - BLOCK
      ?auto_768543 - BLOCK
      ?auto_768544 - BLOCK
      ?auto_768545 - BLOCK
      ?auto_768546 - BLOCK
      ?auto_768547 - BLOCK
      ?auto_768548 - BLOCK
      ?auto_768549 - BLOCK
      ?auto_768550 - BLOCK
    )
    :vars
    (
      ?auto_768551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768550 ?auto_768551 ) ( ON-TABLE ?auto_768539 ) ( ON ?auto_768540 ?auto_768539 ) ( ON ?auto_768541 ?auto_768540 ) ( ON ?auto_768542 ?auto_768541 ) ( ON ?auto_768543 ?auto_768542 ) ( not ( = ?auto_768539 ?auto_768540 ) ) ( not ( = ?auto_768539 ?auto_768541 ) ) ( not ( = ?auto_768539 ?auto_768542 ) ) ( not ( = ?auto_768539 ?auto_768543 ) ) ( not ( = ?auto_768539 ?auto_768544 ) ) ( not ( = ?auto_768539 ?auto_768545 ) ) ( not ( = ?auto_768539 ?auto_768546 ) ) ( not ( = ?auto_768539 ?auto_768547 ) ) ( not ( = ?auto_768539 ?auto_768548 ) ) ( not ( = ?auto_768539 ?auto_768549 ) ) ( not ( = ?auto_768539 ?auto_768550 ) ) ( not ( = ?auto_768539 ?auto_768551 ) ) ( not ( = ?auto_768540 ?auto_768541 ) ) ( not ( = ?auto_768540 ?auto_768542 ) ) ( not ( = ?auto_768540 ?auto_768543 ) ) ( not ( = ?auto_768540 ?auto_768544 ) ) ( not ( = ?auto_768540 ?auto_768545 ) ) ( not ( = ?auto_768540 ?auto_768546 ) ) ( not ( = ?auto_768540 ?auto_768547 ) ) ( not ( = ?auto_768540 ?auto_768548 ) ) ( not ( = ?auto_768540 ?auto_768549 ) ) ( not ( = ?auto_768540 ?auto_768550 ) ) ( not ( = ?auto_768540 ?auto_768551 ) ) ( not ( = ?auto_768541 ?auto_768542 ) ) ( not ( = ?auto_768541 ?auto_768543 ) ) ( not ( = ?auto_768541 ?auto_768544 ) ) ( not ( = ?auto_768541 ?auto_768545 ) ) ( not ( = ?auto_768541 ?auto_768546 ) ) ( not ( = ?auto_768541 ?auto_768547 ) ) ( not ( = ?auto_768541 ?auto_768548 ) ) ( not ( = ?auto_768541 ?auto_768549 ) ) ( not ( = ?auto_768541 ?auto_768550 ) ) ( not ( = ?auto_768541 ?auto_768551 ) ) ( not ( = ?auto_768542 ?auto_768543 ) ) ( not ( = ?auto_768542 ?auto_768544 ) ) ( not ( = ?auto_768542 ?auto_768545 ) ) ( not ( = ?auto_768542 ?auto_768546 ) ) ( not ( = ?auto_768542 ?auto_768547 ) ) ( not ( = ?auto_768542 ?auto_768548 ) ) ( not ( = ?auto_768542 ?auto_768549 ) ) ( not ( = ?auto_768542 ?auto_768550 ) ) ( not ( = ?auto_768542 ?auto_768551 ) ) ( not ( = ?auto_768543 ?auto_768544 ) ) ( not ( = ?auto_768543 ?auto_768545 ) ) ( not ( = ?auto_768543 ?auto_768546 ) ) ( not ( = ?auto_768543 ?auto_768547 ) ) ( not ( = ?auto_768543 ?auto_768548 ) ) ( not ( = ?auto_768543 ?auto_768549 ) ) ( not ( = ?auto_768543 ?auto_768550 ) ) ( not ( = ?auto_768543 ?auto_768551 ) ) ( not ( = ?auto_768544 ?auto_768545 ) ) ( not ( = ?auto_768544 ?auto_768546 ) ) ( not ( = ?auto_768544 ?auto_768547 ) ) ( not ( = ?auto_768544 ?auto_768548 ) ) ( not ( = ?auto_768544 ?auto_768549 ) ) ( not ( = ?auto_768544 ?auto_768550 ) ) ( not ( = ?auto_768544 ?auto_768551 ) ) ( not ( = ?auto_768545 ?auto_768546 ) ) ( not ( = ?auto_768545 ?auto_768547 ) ) ( not ( = ?auto_768545 ?auto_768548 ) ) ( not ( = ?auto_768545 ?auto_768549 ) ) ( not ( = ?auto_768545 ?auto_768550 ) ) ( not ( = ?auto_768545 ?auto_768551 ) ) ( not ( = ?auto_768546 ?auto_768547 ) ) ( not ( = ?auto_768546 ?auto_768548 ) ) ( not ( = ?auto_768546 ?auto_768549 ) ) ( not ( = ?auto_768546 ?auto_768550 ) ) ( not ( = ?auto_768546 ?auto_768551 ) ) ( not ( = ?auto_768547 ?auto_768548 ) ) ( not ( = ?auto_768547 ?auto_768549 ) ) ( not ( = ?auto_768547 ?auto_768550 ) ) ( not ( = ?auto_768547 ?auto_768551 ) ) ( not ( = ?auto_768548 ?auto_768549 ) ) ( not ( = ?auto_768548 ?auto_768550 ) ) ( not ( = ?auto_768548 ?auto_768551 ) ) ( not ( = ?auto_768549 ?auto_768550 ) ) ( not ( = ?auto_768549 ?auto_768551 ) ) ( not ( = ?auto_768550 ?auto_768551 ) ) ( ON ?auto_768549 ?auto_768550 ) ( ON ?auto_768548 ?auto_768549 ) ( ON ?auto_768547 ?auto_768548 ) ( ON ?auto_768546 ?auto_768547 ) ( ON ?auto_768545 ?auto_768546 ) ( CLEAR ?auto_768543 ) ( ON ?auto_768544 ?auto_768545 ) ( CLEAR ?auto_768544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_768539 ?auto_768540 ?auto_768541 ?auto_768542 ?auto_768543 ?auto_768544 )
      ( MAKE-12PILE ?auto_768539 ?auto_768540 ?auto_768541 ?auto_768542 ?auto_768543 ?auto_768544 ?auto_768545 ?auto_768546 ?auto_768547 ?auto_768548 ?auto_768549 ?auto_768550 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_768589 - BLOCK
      ?auto_768590 - BLOCK
      ?auto_768591 - BLOCK
      ?auto_768592 - BLOCK
      ?auto_768593 - BLOCK
      ?auto_768594 - BLOCK
      ?auto_768595 - BLOCK
      ?auto_768596 - BLOCK
      ?auto_768597 - BLOCK
      ?auto_768598 - BLOCK
      ?auto_768599 - BLOCK
      ?auto_768600 - BLOCK
    )
    :vars
    (
      ?auto_768601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768600 ?auto_768601 ) ( ON-TABLE ?auto_768589 ) ( ON ?auto_768590 ?auto_768589 ) ( ON ?auto_768591 ?auto_768590 ) ( ON ?auto_768592 ?auto_768591 ) ( not ( = ?auto_768589 ?auto_768590 ) ) ( not ( = ?auto_768589 ?auto_768591 ) ) ( not ( = ?auto_768589 ?auto_768592 ) ) ( not ( = ?auto_768589 ?auto_768593 ) ) ( not ( = ?auto_768589 ?auto_768594 ) ) ( not ( = ?auto_768589 ?auto_768595 ) ) ( not ( = ?auto_768589 ?auto_768596 ) ) ( not ( = ?auto_768589 ?auto_768597 ) ) ( not ( = ?auto_768589 ?auto_768598 ) ) ( not ( = ?auto_768589 ?auto_768599 ) ) ( not ( = ?auto_768589 ?auto_768600 ) ) ( not ( = ?auto_768589 ?auto_768601 ) ) ( not ( = ?auto_768590 ?auto_768591 ) ) ( not ( = ?auto_768590 ?auto_768592 ) ) ( not ( = ?auto_768590 ?auto_768593 ) ) ( not ( = ?auto_768590 ?auto_768594 ) ) ( not ( = ?auto_768590 ?auto_768595 ) ) ( not ( = ?auto_768590 ?auto_768596 ) ) ( not ( = ?auto_768590 ?auto_768597 ) ) ( not ( = ?auto_768590 ?auto_768598 ) ) ( not ( = ?auto_768590 ?auto_768599 ) ) ( not ( = ?auto_768590 ?auto_768600 ) ) ( not ( = ?auto_768590 ?auto_768601 ) ) ( not ( = ?auto_768591 ?auto_768592 ) ) ( not ( = ?auto_768591 ?auto_768593 ) ) ( not ( = ?auto_768591 ?auto_768594 ) ) ( not ( = ?auto_768591 ?auto_768595 ) ) ( not ( = ?auto_768591 ?auto_768596 ) ) ( not ( = ?auto_768591 ?auto_768597 ) ) ( not ( = ?auto_768591 ?auto_768598 ) ) ( not ( = ?auto_768591 ?auto_768599 ) ) ( not ( = ?auto_768591 ?auto_768600 ) ) ( not ( = ?auto_768591 ?auto_768601 ) ) ( not ( = ?auto_768592 ?auto_768593 ) ) ( not ( = ?auto_768592 ?auto_768594 ) ) ( not ( = ?auto_768592 ?auto_768595 ) ) ( not ( = ?auto_768592 ?auto_768596 ) ) ( not ( = ?auto_768592 ?auto_768597 ) ) ( not ( = ?auto_768592 ?auto_768598 ) ) ( not ( = ?auto_768592 ?auto_768599 ) ) ( not ( = ?auto_768592 ?auto_768600 ) ) ( not ( = ?auto_768592 ?auto_768601 ) ) ( not ( = ?auto_768593 ?auto_768594 ) ) ( not ( = ?auto_768593 ?auto_768595 ) ) ( not ( = ?auto_768593 ?auto_768596 ) ) ( not ( = ?auto_768593 ?auto_768597 ) ) ( not ( = ?auto_768593 ?auto_768598 ) ) ( not ( = ?auto_768593 ?auto_768599 ) ) ( not ( = ?auto_768593 ?auto_768600 ) ) ( not ( = ?auto_768593 ?auto_768601 ) ) ( not ( = ?auto_768594 ?auto_768595 ) ) ( not ( = ?auto_768594 ?auto_768596 ) ) ( not ( = ?auto_768594 ?auto_768597 ) ) ( not ( = ?auto_768594 ?auto_768598 ) ) ( not ( = ?auto_768594 ?auto_768599 ) ) ( not ( = ?auto_768594 ?auto_768600 ) ) ( not ( = ?auto_768594 ?auto_768601 ) ) ( not ( = ?auto_768595 ?auto_768596 ) ) ( not ( = ?auto_768595 ?auto_768597 ) ) ( not ( = ?auto_768595 ?auto_768598 ) ) ( not ( = ?auto_768595 ?auto_768599 ) ) ( not ( = ?auto_768595 ?auto_768600 ) ) ( not ( = ?auto_768595 ?auto_768601 ) ) ( not ( = ?auto_768596 ?auto_768597 ) ) ( not ( = ?auto_768596 ?auto_768598 ) ) ( not ( = ?auto_768596 ?auto_768599 ) ) ( not ( = ?auto_768596 ?auto_768600 ) ) ( not ( = ?auto_768596 ?auto_768601 ) ) ( not ( = ?auto_768597 ?auto_768598 ) ) ( not ( = ?auto_768597 ?auto_768599 ) ) ( not ( = ?auto_768597 ?auto_768600 ) ) ( not ( = ?auto_768597 ?auto_768601 ) ) ( not ( = ?auto_768598 ?auto_768599 ) ) ( not ( = ?auto_768598 ?auto_768600 ) ) ( not ( = ?auto_768598 ?auto_768601 ) ) ( not ( = ?auto_768599 ?auto_768600 ) ) ( not ( = ?auto_768599 ?auto_768601 ) ) ( not ( = ?auto_768600 ?auto_768601 ) ) ( ON ?auto_768599 ?auto_768600 ) ( ON ?auto_768598 ?auto_768599 ) ( ON ?auto_768597 ?auto_768598 ) ( ON ?auto_768596 ?auto_768597 ) ( ON ?auto_768595 ?auto_768596 ) ( ON ?auto_768594 ?auto_768595 ) ( CLEAR ?auto_768592 ) ( ON ?auto_768593 ?auto_768594 ) ( CLEAR ?auto_768593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_768589 ?auto_768590 ?auto_768591 ?auto_768592 ?auto_768593 )
      ( MAKE-12PILE ?auto_768589 ?auto_768590 ?auto_768591 ?auto_768592 ?auto_768593 ?auto_768594 ?auto_768595 ?auto_768596 ?auto_768597 ?auto_768598 ?auto_768599 ?auto_768600 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_768639 - BLOCK
      ?auto_768640 - BLOCK
      ?auto_768641 - BLOCK
      ?auto_768642 - BLOCK
      ?auto_768643 - BLOCK
      ?auto_768644 - BLOCK
      ?auto_768645 - BLOCK
      ?auto_768646 - BLOCK
      ?auto_768647 - BLOCK
      ?auto_768648 - BLOCK
      ?auto_768649 - BLOCK
      ?auto_768650 - BLOCK
    )
    :vars
    (
      ?auto_768651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768650 ?auto_768651 ) ( ON-TABLE ?auto_768639 ) ( ON ?auto_768640 ?auto_768639 ) ( ON ?auto_768641 ?auto_768640 ) ( not ( = ?auto_768639 ?auto_768640 ) ) ( not ( = ?auto_768639 ?auto_768641 ) ) ( not ( = ?auto_768639 ?auto_768642 ) ) ( not ( = ?auto_768639 ?auto_768643 ) ) ( not ( = ?auto_768639 ?auto_768644 ) ) ( not ( = ?auto_768639 ?auto_768645 ) ) ( not ( = ?auto_768639 ?auto_768646 ) ) ( not ( = ?auto_768639 ?auto_768647 ) ) ( not ( = ?auto_768639 ?auto_768648 ) ) ( not ( = ?auto_768639 ?auto_768649 ) ) ( not ( = ?auto_768639 ?auto_768650 ) ) ( not ( = ?auto_768639 ?auto_768651 ) ) ( not ( = ?auto_768640 ?auto_768641 ) ) ( not ( = ?auto_768640 ?auto_768642 ) ) ( not ( = ?auto_768640 ?auto_768643 ) ) ( not ( = ?auto_768640 ?auto_768644 ) ) ( not ( = ?auto_768640 ?auto_768645 ) ) ( not ( = ?auto_768640 ?auto_768646 ) ) ( not ( = ?auto_768640 ?auto_768647 ) ) ( not ( = ?auto_768640 ?auto_768648 ) ) ( not ( = ?auto_768640 ?auto_768649 ) ) ( not ( = ?auto_768640 ?auto_768650 ) ) ( not ( = ?auto_768640 ?auto_768651 ) ) ( not ( = ?auto_768641 ?auto_768642 ) ) ( not ( = ?auto_768641 ?auto_768643 ) ) ( not ( = ?auto_768641 ?auto_768644 ) ) ( not ( = ?auto_768641 ?auto_768645 ) ) ( not ( = ?auto_768641 ?auto_768646 ) ) ( not ( = ?auto_768641 ?auto_768647 ) ) ( not ( = ?auto_768641 ?auto_768648 ) ) ( not ( = ?auto_768641 ?auto_768649 ) ) ( not ( = ?auto_768641 ?auto_768650 ) ) ( not ( = ?auto_768641 ?auto_768651 ) ) ( not ( = ?auto_768642 ?auto_768643 ) ) ( not ( = ?auto_768642 ?auto_768644 ) ) ( not ( = ?auto_768642 ?auto_768645 ) ) ( not ( = ?auto_768642 ?auto_768646 ) ) ( not ( = ?auto_768642 ?auto_768647 ) ) ( not ( = ?auto_768642 ?auto_768648 ) ) ( not ( = ?auto_768642 ?auto_768649 ) ) ( not ( = ?auto_768642 ?auto_768650 ) ) ( not ( = ?auto_768642 ?auto_768651 ) ) ( not ( = ?auto_768643 ?auto_768644 ) ) ( not ( = ?auto_768643 ?auto_768645 ) ) ( not ( = ?auto_768643 ?auto_768646 ) ) ( not ( = ?auto_768643 ?auto_768647 ) ) ( not ( = ?auto_768643 ?auto_768648 ) ) ( not ( = ?auto_768643 ?auto_768649 ) ) ( not ( = ?auto_768643 ?auto_768650 ) ) ( not ( = ?auto_768643 ?auto_768651 ) ) ( not ( = ?auto_768644 ?auto_768645 ) ) ( not ( = ?auto_768644 ?auto_768646 ) ) ( not ( = ?auto_768644 ?auto_768647 ) ) ( not ( = ?auto_768644 ?auto_768648 ) ) ( not ( = ?auto_768644 ?auto_768649 ) ) ( not ( = ?auto_768644 ?auto_768650 ) ) ( not ( = ?auto_768644 ?auto_768651 ) ) ( not ( = ?auto_768645 ?auto_768646 ) ) ( not ( = ?auto_768645 ?auto_768647 ) ) ( not ( = ?auto_768645 ?auto_768648 ) ) ( not ( = ?auto_768645 ?auto_768649 ) ) ( not ( = ?auto_768645 ?auto_768650 ) ) ( not ( = ?auto_768645 ?auto_768651 ) ) ( not ( = ?auto_768646 ?auto_768647 ) ) ( not ( = ?auto_768646 ?auto_768648 ) ) ( not ( = ?auto_768646 ?auto_768649 ) ) ( not ( = ?auto_768646 ?auto_768650 ) ) ( not ( = ?auto_768646 ?auto_768651 ) ) ( not ( = ?auto_768647 ?auto_768648 ) ) ( not ( = ?auto_768647 ?auto_768649 ) ) ( not ( = ?auto_768647 ?auto_768650 ) ) ( not ( = ?auto_768647 ?auto_768651 ) ) ( not ( = ?auto_768648 ?auto_768649 ) ) ( not ( = ?auto_768648 ?auto_768650 ) ) ( not ( = ?auto_768648 ?auto_768651 ) ) ( not ( = ?auto_768649 ?auto_768650 ) ) ( not ( = ?auto_768649 ?auto_768651 ) ) ( not ( = ?auto_768650 ?auto_768651 ) ) ( ON ?auto_768649 ?auto_768650 ) ( ON ?auto_768648 ?auto_768649 ) ( ON ?auto_768647 ?auto_768648 ) ( ON ?auto_768646 ?auto_768647 ) ( ON ?auto_768645 ?auto_768646 ) ( ON ?auto_768644 ?auto_768645 ) ( ON ?auto_768643 ?auto_768644 ) ( CLEAR ?auto_768641 ) ( ON ?auto_768642 ?auto_768643 ) ( CLEAR ?auto_768642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_768639 ?auto_768640 ?auto_768641 ?auto_768642 )
      ( MAKE-12PILE ?auto_768639 ?auto_768640 ?auto_768641 ?auto_768642 ?auto_768643 ?auto_768644 ?auto_768645 ?auto_768646 ?auto_768647 ?auto_768648 ?auto_768649 ?auto_768650 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_768689 - BLOCK
      ?auto_768690 - BLOCK
      ?auto_768691 - BLOCK
      ?auto_768692 - BLOCK
      ?auto_768693 - BLOCK
      ?auto_768694 - BLOCK
      ?auto_768695 - BLOCK
      ?auto_768696 - BLOCK
      ?auto_768697 - BLOCK
      ?auto_768698 - BLOCK
      ?auto_768699 - BLOCK
      ?auto_768700 - BLOCK
    )
    :vars
    (
      ?auto_768701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768700 ?auto_768701 ) ( ON-TABLE ?auto_768689 ) ( ON ?auto_768690 ?auto_768689 ) ( not ( = ?auto_768689 ?auto_768690 ) ) ( not ( = ?auto_768689 ?auto_768691 ) ) ( not ( = ?auto_768689 ?auto_768692 ) ) ( not ( = ?auto_768689 ?auto_768693 ) ) ( not ( = ?auto_768689 ?auto_768694 ) ) ( not ( = ?auto_768689 ?auto_768695 ) ) ( not ( = ?auto_768689 ?auto_768696 ) ) ( not ( = ?auto_768689 ?auto_768697 ) ) ( not ( = ?auto_768689 ?auto_768698 ) ) ( not ( = ?auto_768689 ?auto_768699 ) ) ( not ( = ?auto_768689 ?auto_768700 ) ) ( not ( = ?auto_768689 ?auto_768701 ) ) ( not ( = ?auto_768690 ?auto_768691 ) ) ( not ( = ?auto_768690 ?auto_768692 ) ) ( not ( = ?auto_768690 ?auto_768693 ) ) ( not ( = ?auto_768690 ?auto_768694 ) ) ( not ( = ?auto_768690 ?auto_768695 ) ) ( not ( = ?auto_768690 ?auto_768696 ) ) ( not ( = ?auto_768690 ?auto_768697 ) ) ( not ( = ?auto_768690 ?auto_768698 ) ) ( not ( = ?auto_768690 ?auto_768699 ) ) ( not ( = ?auto_768690 ?auto_768700 ) ) ( not ( = ?auto_768690 ?auto_768701 ) ) ( not ( = ?auto_768691 ?auto_768692 ) ) ( not ( = ?auto_768691 ?auto_768693 ) ) ( not ( = ?auto_768691 ?auto_768694 ) ) ( not ( = ?auto_768691 ?auto_768695 ) ) ( not ( = ?auto_768691 ?auto_768696 ) ) ( not ( = ?auto_768691 ?auto_768697 ) ) ( not ( = ?auto_768691 ?auto_768698 ) ) ( not ( = ?auto_768691 ?auto_768699 ) ) ( not ( = ?auto_768691 ?auto_768700 ) ) ( not ( = ?auto_768691 ?auto_768701 ) ) ( not ( = ?auto_768692 ?auto_768693 ) ) ( not ( = ?auto_768692 ?auto_768694 ) ) ( not ( = ?auto_768692 ?auto_768695 ) ) ( not ( = ?auto_768692 ?auto_768696 ) ) ( not ( = ?auto_768692 ?auto_768697 ) ) ( not ( = ?auto_768692 ?auto_768698 ) ) ( not ( = ?auto_768692 ?auto_768699 ) ) ( not ( = ?auto_768692 ?auto_768700 ) ) ( not ( = ?auto_768692 ?auto_768701 ) ) ( not ( = ?auto_768693 ?auto_768694 ) ) ( not ( = ?auto_768693 ?auto_768695 ) ) ( not ( = ?auto_768693 ?auto_768696 ) ) ( not ( = ?auto_768693 ?auto_768697 ) ) ( not ( = ?auto_768693 ?auto_768698 ) ) ( not ( = ?auto_768693 ?auto_768699 ) ) ( not ( = ?auto_768693 ?auto_768700 ) ) ( not ( = ?auto_768693 ?auto_768701 ) ) ( not ( = ?auto_768694 ?auto_768695 ) ) ( not ( = ?auto_768694 ?auto_768696 ) ) ( not ( = ?auto_768694 ?auto_768697 ) ) ( not ( = ?auto_768694 ?auto_768698 ) ) ( not ( = ?auto_768694 ?auto_768699 ) ) ( not ( = ?auto_768694 ?auto_768700 ) ) ( not ( = ?auto_768694 ?auto_768701 ) ) ( not ( = ?auto_768695 ?auto_768696 ) ) ( not ( = ?auto_768695 ?auto_768697 ) ) ( not ( = ?auto_768695 ?auto_768698 ) ) ( not ( = ?auto_768695 ?auto_768699 ) ) ( not ( = ?auto_768695 ?auto_768700 ) ) ( not ( = ?auto_768695 ?auto_768701 ) ) ( not ( = ?auto_768696 ?auto_768697 ) ) ( not ( = ?auto_768696 ?auto_768698 ) ) ( not ( = ?auto_768696 ?auto_768699 ) ) ( not ( = ?auto_768696 ?auto_768700 ) ) ( not ( = ?auto_768696 ?auto_768701 ) ) ( not ( = ?auto_768697 ?auto_768698 ) ) ( not ( = ?auto_768697 ?auto_768699 ) ) ( not ( = ?auto_768697 ?auto_768700 ) ) ( not ( = ?auto_768697 ?auto_768701 ) ) ( not ( = ?auto_768698 ?auto_768699 ) ) ( not ( = ?auto_768698 ?auto_768700 ) ) ( not ( = ?auto_768698 ?auto_768701 ) ) ( not ( = ?auto_768699 ?auto_768700 ) ) ( not ( = ?auto_768699 ?auto_768701 ) ) ( not ( = ?auto_768700 ?auto_768701 ) ) ( ON ?auto_768699 ?auto_768700 ) ( ON ?auto_768698 ?auto_768699 ) ( ON ?auto_768697 ?auto_768698 ) ( ON ?auto_768696 ?auto_768697 ) ( ON ?auto_768695 ?auto_768696 ) ( ON ?auto_768694 ?auto_768695 ) ( ON ?auto_768693 ?auto_768694 ) ( ON ?auto_768692 ?auto_768693 ) ( CLEAR ?auto_768690 ) ( ON ?auto_768691 ?auto_768692 ) ( CLEAR ?auto_768691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_768689 ?auto_768690 ?auto_768691 )
      ( MAKE-12PILE ?auto_768689 ?auto_768690 ?auto_768691 ?auto_768692 ?auto_768693 ?auto_768694 ?auto_768695 ?auto_768696 ?auto_768697 ?auto_768698 ?auto_768699 ?auto_768700 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_768739 - BLOCK
      ?auto_768740 - BLOCK
      ?auto_768741 - BLOCK
      ?auto_768742 - BLOCK
      ?auto_768743 - BLOCK
      ?auto_768744 - BLOCK
      ?auto_768745 - BLOCK
      ?auto_768746 - BLOCK
      ?auto_768747 - BLOCK
      ?auto_768748 - BLOCK
      ?auto_768749 - BLOCK
      ?auto_768750 - BLOCK
    )
    :vars
    (
      ?auto_768751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768750 ?auto_768751 ) ( ON-TABLE ?auto_768739 ) ( not ( = ?auto_768739 ?auto_768740 ) ) ( not ( = ?auto_768739 ?auto_768741 ) ) ( not ( = ?auto_768739 ?auto_768742 ) ) ( not ( = ?auto_768739 ?auto_768743 ) ) ( not ( = ?auto_768739 ?auto_768744 ) ) ( not ( = ?auto_768739 ?auto_768745 ) ) ( not ( = ?auto_768739 ?auto_768746 ) ) ( not ( = ?auto_768739 ?auto_768747 ) ) ( not ( = ?auto_768739 ?auto_768748 ) ) ( not ( = ?auto_768739 ?auto_768749 ) ) ( not ( = ?auto_768739 ?auto_768750 ) ) ( not ( = ?auto_768739 ?auto_768751 ) ) ( not ( = ?auto_768740 ?auto_768741 ) ) ( not ( = ?auto_768740 ?auto_768742 ) ) ( not ( = ?auto_768740 ?auto_768743 ) ) ( not ( = ?auto_768740 ?auto_768744 ) ) ( not ( = ?auto_768740 ?auto_768745 ) ) ( not ( = ?auto_768740 ?auto_768746 ) ) ( not ( = ?auto_768740 ?auto_768747 ) ) ( not ( = ?auto_768740 ?auto_768748 ) ) ( not ( = ?auto_768740 ?auto_768749 ) ) ( not ( = ?auto_768740 ?auto_768750 ) ) ( not ( = ?auto_768740 ?auto_768751 ) ) ( not ( = ?auto_768741 ?auto_768742 ) ) ( not ( = ?auto_768741 ?auto_768743 ) ) ( not ( = ?auto_768741 ?auto_768744 ) ) ( not ( = ?auto_768741 ?auto_768745 ) ) ( not ( = ?auto_768741 ?auto_768746 ) ) ( not ( = ?auto_768741 ?auto_768747 ) ) ( not ( = ?auto_768741 ?auto_768748 ) ) ( not ( = ?auto_768741 ?auto_768749 ) ) ( not ( = ?auto_768741 ?auto_768750 ) ) ( not ( = ?auto_768741 ?auto_768751 ) ) ( not ( = ?auto_768742 ?auto_768743 ) ) ( not ( = ?auto_768742 ?auto_768744 ) ) ( not ( = ?auto_768742 ?auto_768745 ) ) ( not ( = ?auto_768742 ?auto_768746 ) ) ( not ( = ?auto_768742 ?auto_768747 ) ) ( not ( = ?auto_768742 ?auto_768748 ) ) ( not ( = ?auto_768742 ?auto_768749 ) ) ( not ( = ?auto_768742 ?auto_768750 ) ) ( not ( = ?auto_768742 ?auto_768751 ) ) ( not ( = ?auto_768743 ?auto_768744 ) ) ( not ( = ?auto_768743 ?auto_768745 ) ) ( not ( = ?auto_768743 ?auto_768746 ) ) ( not ( = ?auto_768743 ?auto_768747 ) ) ( not ( = ?auto_768743 ?auto_768748 ) ) ( not ( = ?auto_768743 ?auto_768749 ) ) ( not ( = ?auto_768743 ?auto_768750 ) ) ( not ( = ?auto_768743 ?auto_768751 ) ) ( not ( = ?auto_768744 ?auto_768745 ) ) ( not ( = ?auto_768744 ?auto_768746 ) ) ( not ( = ?auto_768744 ?auto_768747 ) ) ( not ( = ?auto_768744 ?auto_768748 ) ) ( not ( = ?auto_768744 ?auto_768749 ) ) ( not ( = ?auto_768744 ?auto_768750 ) ) ( not ( = ?auto_768744 ?auto_768751 ) ) ( not ( = ?auto_768745 ?auto_768746 ) ) ( not ( = ?auto_768745 ?auto_768747 ) ) ( not ( = ?auto_768745 ?auto_768748 ) ) ( not ( = ?auto_768745 ?auto_768749 ) ) ( not ( = ?auto_768745 ?auto_768750 ) ) ( not ( = ?auto_768745 ?auto_768751 ) ) ( not ( = ?auto_768746 ?auto_768747 ) ) ( not ( = ?auto_768746 ?auto_768748 ) ) ( not ( = ?auto_768746 ?auto_768749 ) ) ( not ( = ?auto_768746 ?auto_768750 ) ) ( not ( = ?auto_768746 ?auto_768751 ) ) ( not ( = ?auto_768747 ?auto_768748 ) ) ( not ( = ?auto_768747 ?auto_768749 ) ) ( not ( = ?auto_768747 ?auto_768750 ) ) ( not ( = ?auto_768747 ?auto_768751 ) ) ( not ( = ?auto_768748 ?auto_768749 ) ) ( not ( = ?auto_768748 ?auto_768750 ) ) ( not ( = ?auto_768748 ?auto_768751 ) ) ( not ( = ?auto_768749 ?auto_768750 ) ) ( not ( = ?auto_768749 ?auto_768751 ) ) ( not ( = ?auto_768750 ?auto_768751 ) ) ( ON ?auto_768749 ?auto_768750 ) ( ON ?auto_768748 ?auto_768749 ) ( ON ?auto_768747 ?auto_768748 ) ( ON ?auto_768746 ?auto_768747 ) ( ON ?auto_768745 ?auto_768746 ) ( ON ?auto_768744 ?auto_768745 ) ( ON ?auto_768743 ?auto_768744 ) ( ON ?auto_768742 ?auto_768743 ) ( ON ?auto_768741 ?auto_768742 ) ( CLEAR ?auto_768739 ) ( ON ?auto_768740 ?auto_768741 ) ( CLEAR ?auto_768740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_768739 ?auto_768740 )
      ( MAKE-12PILE ?auto_768739 ?auto_768740 ?auto_768741 ?auto_768742 ?auto_768743 ?auto_768744 ?auto_768745 ?auto_768746 ?auto_768747 ?auto_768748 ?auto_768749 ?auto_768750 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_768789 - BLOCK
      ?auto_768790 - BLOCK
      ?auto_768791 - BLOCK
      ?auto_768792 - BLOCK
      ?auto_768793 - BLOCK
      ?auto_768794 - BLOCK
      ?auto_768795 - BLOCK
      ?auto_768796 - BLOCK
      ?auto_768797 - BLOCK
      ?auto_768798 - BLOCK
      ?auto_768799 - BLOCK
      ?auto_768800 - BLOCK
    )
    :vars
    (
      ?auto_768801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768800 ?auto_768801 ) ( not ( = ?auto_768789 ?auto_768790 ) ) ( not ( = ?auto_768789 ?auto_768791 ) ) ( not ( = ?auto_768789 ?auto_768792 ) ) ( not ( = ?auto_768789 ?auto_768793 ) ) ( not ( = ?auto_768789 ?auto_768794 ) ) ( not ( = ?auto_768789 ?auto_768795 ) ) ( not ( = ?auto_768789 ?auto_768796 ) ) ( not ( = ?auto_768789 ?auto_768797 ) ) ( not ( = ?auto_768789 ?auto_768798 ) ) ( not ( = ?auto_768789 ?auto_768799 ) ) ( not ( = ?auto_768789 ?auto_768800 ) ) ( not ( = ?auto_768789 ?auto_768801 ) ) ( not ( = ?auto_768790 ?auto_768791 ) ) ( not ( = ?auto_768790 ?auto_768792 ) ) ( not ( = ?auto_768790 ?auto_768793 ) ) ( not ( = ?auto_768790 ?auto_768794 ) ) ( not ( = ?auto_768790 ?auto_768795 ) ) ( not ( = ?auto_768790 ?auto_768796 ) ) ( not ( = ?auto_768790 ?auto_768797 ) ) ( not ( = ?auto_768790 ?auto_768798 ) ) ( not ( = ?auto_768790 ?auto_768799 ) ) ( not ( = ?auto_768790 ?auto_768800 ) ) ( not ( = ?auto_768790 ?auto_768801 ) ) ( not ( = ?auto_768791 ?auto_768792 ) ) ( not ( = ?auto_768791 ?auto_768793 ) ) ( not ( = ?auto_768791 ?auto_768794 ) ) ( not ( = ?auto_768791 ?auto_768795 ) ) ( not ( = ?auto_768791 ?auto_768796 ) ) ( not ( = ?auto_768791 ?auto_768797 ) ) ( not ( = ?auto_768791 ?auto_768798 ) ) ( not ( = ?auto_768791 ?auto_768799 ) ) ( not ( = ?auto_768791 ?auto_768800 ) ) ( not ( = ?auto_768791 ?auto_768801 ) ) ( not ( = ?auto_768792 ?auto_768793 ) ) ( not ( = ?auto_768792 ?auto_768794 ) ) ( not ( = ?auto_768792 ?auto_768795 ) ) ( not ( = ?auto_768792 ?auto_768796 ) ) ( not ( = ?auto_768792 ?auto_768797 ) ) ( not ( = ?auto_768792 ?auto_768798 ) ) ( not ( = ?auto_768792 ?auto_768799 ) ) ( not ( = ?auto_768792 ?auto_768800 ) ) ( not ( = ?auto_768792 ?auto_768801 ) ) ( not ( = ?auto_768793 ?auto_768794 ) ) ( not ( = ?auto_768793 ?auto_768795 ) ) ( not ( = ?auto_768793 ?auto_768796 ) ) ( not ( = ?auto_768793 ?auto_768797 ) ) ( not ( = ?auto_768793 ?auto_768798 ) ) ( not ( = ?auto_768793 ?auto_768799 ) ) ( not ( = ?auto_768793 ?auto_768800 ) ) ( not ( = ?auto_768793 ?auto_768801 ) ) ( not ( = ?auto_768794 ?auto_768795 ) ) ( not ( = ?auto_768794 ?auto_768796 ) ) ( not ( = ?auto_768794 ?auto_768797 ) ) ( not ( = ?auto_768794 ?auto_768798 ) ) ( not ( = ?auto_768794 ?auto_768799 ) ) ( not ( = ?auto_768794 ?auto_768800 ) ) ( not ( = ?auto_768794 ?auto_768801 ) ) ( not ( = ?auto_768795 ?auto_768796 ) ) ( not ( = ?auto_768795 ?auto_768797 ) ) ( not ( = ?auto_768795 ?auto_768798 ) ) ( not ( = ?auto_768795 ?auto_768799 ) ) ( not ( = ?auto_768795 ?auto_768800 ) ) ( not ( = ?auto_768795 ?auto_768801 ) ) ( not ( = ?auto_768796 ?auto_768797 ) ) ( not ( = ?auto_768796 ?auto_768798 ) ) ( not ( = ?auto_768796 ?auto_768799 ) ) ( not ( = ?auto_768796 ?auto_768800 ) ) ( not ( = ?auto_768796 ?auto_768801 ) ) ( not ( = ?auto_768797 ?auto_768798 ) ) ( not ( = ?auto_768797 ?auto_768799 ) ) ( not ( = ?auto_768797 ?auto_768800 ) ) ( not ( = ?auto_768797 ?auto_768801 ) ) ( not ( = ?auto_768798 ?auto_768799 ) ) ( not ( = ?auto_768798 ?auto_768800 ) ) ( not ( = ?auto_768798 ?auto_768801 ) ) ( not ( = ?auto_768799 ?auto_768800 ) ) ( not ( = ?auto_768799 ?auto_768801 ) ) ( not ( = ?auto_768800 ?auto_768801 ) ) ( ON ?auto_768799 ?auto_768800 ) ( ON ?auto_768798 ?auto_768799 ) ( ON ?auto_768797 ?auto_768798 ) ( ON ?auto_768796 ?auto_768797 ) ( ON ?auto_768795 ?auto_768796 ) ( ON ?auto_768794 ?auto_768795 ) ( ON ?auto_768793 ?auto_768794 ) ( ON ?auto_768792 ?auto_768793 ) ( ON ?auto_768791 ?auto_768792 ) ( ON ?auto_768790 ?auto_768791 ) ( ON ?auto_768789 ?auto_768790 ) ( CLEAR ?auto_768789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_768789 )
      ( MAKE-12PILE ?auto_768789 ?auto_768790 ?auto_768791 ?auto_768792 ?auto_768793 ?auto_768794 ?auto_768795 ?auto_768796 ?auto_768797 ?auto_768798 ?auto_768799 ?auto_768800 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_768840 - BLOCK
      ?auto_768841 - BLOCK
      ?auto_768842 - BLOCK
      ?auto_768843 - BLOCK
      ?auto_768844 - BLOCK
      ?auto_768845 - BLOCK
      ?auto_768846 - BLOCK
      ?auto_768847 - BLOCK
      ?auto_768848 - BLOCK
      ?auto_768849 - BLOCK
      ?auto_768850 - BLOCK
      ?auto_768851 - BLOCK
      ?auto_768852 - BLOCK
    )
    :vars
    (
      ?auto_768853 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_768851 ) ( ON ?auto_768852 ?auto_768853 ) ( CLEAR ?auto_768852 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_768840 ) ( ON ?auto_768841 ?auto_768840 ) ( ON ?auto_768842 ?auto_768841 ) ( ON ?auto_768843 ?auto_768842 ) ( ON ?auto_768844 ?auto_768843 ) ( ON ?auto_768845 ?auto_768844 ) ( ON ?auto_768846 ?auto_768845 ) ( ON ?auto_768847 ?auto_768846 ) ( ON ?auto_768848 ?auto_768847 ) ( ON ?auto_768849 ?auto_768848 ) ( ON ?auto_768850 ?auto_768849 ) ( ON ?auto_768851 ?auto_768850 ) ( not ( = ?auto_768840 ?auto_768841 ) ) ( not ( = ?auto_768840 ?auto_768842 ) ) ( not ( = ?auto_768840 ?auto_768843 ) ) ( not ( = ?auto_768840 ?auto_768844 ) ) ( not ( = ?auto_768840 ?auto_768845 ) ) ( not ( = ?auto_768840 ?auto_768846 ) ) ( not ( = ?auto_768840 ?auto_768847 ) ) ( not ( = ?auto_768840 ?auto_768848 ) ) ( not ( = ?auto_768840 ?auto_768849 ) ) ( not ( = ?auto_768840 ?auto_768850 ) ) ( not ( = ?auto_768840 ?auto_768851 ) ) ( not ( = ?auto_768840 ?auto_768852 ) ) ( not ( = ?auto_768840 ?auto_768853 ) ) ( not ( = ?auto_768841 ?auto_768842 ) ) ( not ( = ?auto_768841 ?auto_768843 ) ) ( not ( = ?auto_768841 ?auto_768844 ) ) ( not ( = ?auto_768841 ?auto_768845 ) ) ( not ( = ?auto_768841 ?auto_768846 ) ) ( not ( = ?auto_768841 ?auto_768847 ) ) ( not ( = ?auto_768841 ?auto_768848 ) ) ( not ( = ?auto_768841 ?auto_768849 ) ) ( not ( = ?auto_768841 ?auto_768850 ) ) ( not ( = ?auto_768841 ?auto_768851 ) ) ( not ( = ?auto_768841 ?auto_768852 ) ) ( not ( = ?auto_768841 ?auto_768853 ) ) ( not ( = ?auto_768842 ?auto_768843 ) ) ( not ( = ?auto_768842 ?auto_768844 ) ) ( not ( = ?auto_768842 ?auto_768845 ) ) ( not ( = ?auto_768842 ?auto_768846 ) ) ( not ( = ?auto_768842 ?auto_768847 ) ) ( not ( = ?auto_768842 ?auto_768848 ) ) ( not ( = ?auto_768842 ?auto_768849 ) ) ( not ( = ?auto_768842 ?auto_768850 ) ) ( not ( = ?auto_768842 ?auto_768851 ) ) ( not ( = ?auto_768842 ?auto_768852 ) ) ( not ( = ?auto_768842 ?auto_768853 ) ) ( not ( = ?auto_768843 ?auto_768844 ) ) ( not ( = ?auto_768843 ?auto_768845 ) ) ( not ( = ?auto_768843 ?auto_768846 ) ) ( not ( = ?auto_768843 ?auto_768847 ) ) ( not ( = ?auto_768843 ?auto_768848 ) ) ( not ( = ?auto_768843 ?auto_768849 ) ) ( not ( = ?auto_768843 ?auto_768850 ) ) ( not ( = ?auto_768843 ?auto_768851 ) ) ( not ( = ?auto_768843 ?auto_768852 ) ) ( not ( = ?auto_768843 ?auto_768853 ) ) ( not ( = ?auto_768844 ?auto_768845 ) ) ( not ( = ?auto_768844 ?auto_768846 ) ) ( not ( = ?auto_768844 ?auto_768847 ) ) ( not ( = ?auto_768844 ?auto_768848 ) ) ( not ( = ?auto_768844 ?auto_768849 ) ) ( not ( = ?auto_768844 ?auto_768850 ) ) ( not ( = ?auto_768844 ?auto_768851 ) ) ( not ( = ?auto_768844 ?auto_768852 ) ) ( not ( = ?auto_768844 ?auto_768853 ) ) ( not ( = ?auto_768845 ?auto_768846 ) ) ( not ( = ?auto_768845 ?auto_768847 ) ) ( not ( = ?auto_768845 ?auto_768848 ) ) ( not ( = ?auto_768845 ?auto_768849 ) ) ( not ( = ?auto_768845 ?auto_768850 ) ) ( not ( = ?auto_768845 ?auto_768851 ) ) ( not ( = ?auto_768845 ?auto_768852 ) ) ( not ( = ?auto_768845 ?auto_768853 ) ) ( not ( = ?auto_768846 ?auto_768847 ) ) ( not ( = ?auto_768846 ?auto_768848 ) ) ( not ( = ?auto_768846 ?auto_768849 ) ) ( not ( = ?auto_768846 ?auto_768850 ) ) ( not ( = ?auto_768846 ?auto_768851 ) ) ( not ( = ?auto_768846 ?auto_768852 ) ) ( not ( = ?auto_768846 ?auto_768853 ) ) ( not ( = ?auto_768847 ?auto_768848 ) ) ( not ( = ?auto_768847 ?auto_768849 ) ) ( not ( = ?auto_768847 ?auto_768850 ) ) ( not ( = ?auto_768847 ?auto_768851 ) ) ( not ( = ?auto_768847 ?auto_768852 ) ) ( not ( = ?auto_768847 ?auto_768853 ) ) ( not ( = ?auto_768848 ?auto_768849 ) ) ( not ( = ?auto_768848 ?auto_768850 ) ) ( not ( = ?auto_768848 ?auto_768851 ) ) ( not ( = ?auto_768848 ?auto_768852 ) ) ( not ( = ?auto_768848 ?auto_768853 ) ) ( not ( = ?auto_768849 ?auto_768850 ) ) ( not ( = ?auto_768849 ?auto_768851 ) ) ( not ( = ?auto_768849 ?auto_768852 ) ) ( not ( = ?auto_768849 ?auto_768853 ) ) ( not ( = ?auto_768850 ?auto_768851 ) ) ( not ( = ?auto_768850 ?auto_768852 ) ) ( not ( = ?auto_768850 ?auto_768853 ) ) ( not ( = ?auto_768851 ?auto_768852 ) ) ( not ( = ?auto_768851 ?auto_768853 ) ) ( not ( = ?auto_768852 ?auto_768853 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_768852 ?auto_768853 )
      ( !STACK ?auto_768852 ?auto_768851 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_768894 - BLOCK
      ?auto_768895 - BLOCK
      ?auto_768896 - BLOCK
      ?auto_768897 - BLOCK
      ?auto_768898 - BLOCK
      ?auto_768899 - BLOCK
      ?auto_768900 - BLOCK
      ?auto_768901 - BLOCK
      ?auto_768902 - BLOCK
      ?auto_768903 - BLOCK
      ?auto_768904 - BLOCK
      ?auto_768905 - BLOCK
      ?auto_768906 - BLOCK
    )
    :vars
    (
      ?auto_768907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768906 ?auto_768907 ) ( ON-TABLE ?auto_768894 ) ( ON ?auto_768895 ?auto_768894 ) ( ON ?auto_768896 ?auto_768895 ) ( ON ?auto_768897 ?auto_768896 ) ( ON ?auto_768898 ?auto_768897 ) ( ON ?auto_768899 ?auto_768898 ) ( ON ?auto_768900 ?auto_768899 ) ( ON ?auto_768901 ?auto_768900 ) ( ON ?auto_768902 ?auto_768901 ) ( ON ?auto_768903 ?auto_768902 ) ( ON ?auto_768904 ?auto_768903 ) ( not ( = ?auto_768894 ?auto_768895 ) ) ( not ( = ?auto_768894 ?auto_768896 ) ) ( not ( = ?auto_768894 ?auto_768897 ) ) ( not ( = ?auto_768894 ?auto_768898 ) ) ( not ( = ?auto_768894 ?auto_768899 ) ) ( not ( = ?auto_768894 ?auto_768900 ) ) ( not ( = ?auto_768894 ?auto_768901 ) ) ( not ( = ?auto_768894 ?auto_768902 ) ) ( not ( = ?auto_768894 ?auto_768903 ) ) ( not ( = ?auto_768894 ?auto_768904 ) ) ( not ( = ?auto_768894 ?auto_768905 ) ) ( not ( = ?auto_768894 ?auto_768906 ) ) ( not ( = ?auto_768894 ?auto_768907 ) ) ( not ( = ?auto_768895 ?auto_768896 ) ) ( not ( = ?auto_768895 ?auto_768897 ) ) ( not ( = ?auto_768895 ?auto_768898 ) ) ( not ( = ?auto_768895 ?auto_768899 ) ) ( not ( = ?auto_768895 ?auto_768900 ) ) ( not ( = ?auto_768895 ?auto_768901 ) ) ( not ( = ?auto_768895 ?auto_768902 ) ) ( not ( = ?auto_768895 ?auto_768903 ) ) ( not ( = ?auto_768895 ?auto_768904 ) ) ( not ( = ?auto_768895 ?auto_768905 ) ) ( not ( = ?auto_768895 ?auto_768906 ) ) ( not ( = ?auto_768895 ?auto_768907 ) ) ( not ( = ?auto_768896 ?auto_768897 ) ) ( not ( = ?auto_768896 ?auto_768898 ) ) ( not ( = ?auto_768896 ?auto_768899 ) ) ( not ( = ?auto_768896 ?auto_768900 ) ) ( not ( = ?auto_768896 ?auto_768901 ) ) ( not ( = ?auto_768896 ?auto_768902 ) ) ( not ( = ?auto_768896 ?auto_768903 ) ) ( not ( = ?auto_768896 ?auto_768904 ) ) ( not ( = ?auto_768896 ?auto_768905 ) ) ( not ( = ?auto_768896 ?auto_768906 ) ) ( not ( = ?auto_768896 ?auto_768907 ) ) ( not ( = ?auto_768897 ?auto_768898 ) ) ( not ( = ?auto_768897 ?auto_768899 ) ) ( not ( = ?auto_768897 ?auto_768900 ) ) ( not ( = ?auto_768897 ?auto_768901 ) ) ( not ( = ?auto_768897 ?auto_768902 ) ) ( not ( = ?auto_768897 ?auto_768903 ) ) ( not ( = ?auto_768897 ?auto_768904 ) ) ( not ( = ?auto_768897 ?auto_768905 ) ) ( not ( = ?auto_768897 ?auto_768906 ) ) ( not ( = ?auto_768897 ?auto_768907 ) ) ( not ( = ?auto_768898 ?auto_768899 ) ) ( not ( = ?auto_768898 ?auto_768900 ) ) ( not ( = ?auto_768898 ?auto_768901 ) ) ( not ( = ?auto_768898 ?auto_768902 ) ) ( not ( = ?auto_768898 ?auto_768903 ) ) ( not ( = ?auto_768898 ?auto_768904 ) ) ( not ( = ?auto_768898 ?auto_768905 ) ) ( not ( = ?auto_768898 ?auto_768906 ) ) ( not ( = ?auto_768898 ?auto_768907 ) ) ( not ( = ?auto_768899 ?auto_768900 ) ) ( not ( = ?auto_768899 ?auto_768901 ) ) ( not ( = ?auto_768899 ?auto_768902 ) ) ( not ( = ?auto_768899 ?auto_768903 ) ) ( not ( = ?auto_768899 ?auto_768904 ) ) ( not ( = ?auto_768899 ?auto_768905 ) ) ( not ( = ?auto_768899 ?auto_768906 ) ) ( not ( = ?auto_768899 ?auto_768907 ) ) ( not ( = ?auto_768900 ?auto_768901 ) ) ( not ( = ?auto_768900 ?auto_768902 ) ) ( not ( = ?auto_768900 ?auto_768903 ) ) ( not ( = ?auto_768900 ?auto_768904 ) ) ( not ( = ?auto_768900 ?auto_768905 ) ) ( not ( = ?auto_768900 ?auto_768906 ) ) ( not ( = ?auto_768900 ?auto_768907 ) ) ( not ( = ?auto_768901 ?auto_768902 ) ) ( not ( = ?auto_768901 ?auto_768903 ) ) ( not ( = ?auto_768901 ?auto_768904 ) ) ( not ( = ?auto_768901 ?auto_768905 ) ) ( not ( = ?auto_768901 ?auto_768906 ) ) ( not ( = ?auto_768901 ?auto_768907 ) ) ( not ( = ?auto_768902 ?auto_768903 ) ) ( not ( = ?auto_768902 ?auto_768904 ) ) ( not ( = ?auto_768902 ?auto_768905 ) ) ( not ( = ?auto_768902 ?auto_768906 ) ) ( not ( = ?auto_768902 ?auto_768907 ) ) ( not ( = ?auto_768903 ?auto_768904 ) ) ( not ( = ?auto_768903 ?auto_768905 ) ) ( not ( = ?auto_768903 ?auto_768906 ) ) ( not ( = ?auto_768903 ?auto_768907 ) ) ( not ( = ?auto_768904 ?auto_768905 ) ) ( not ( = ?auto_768904 ?auto_768906 ) ) ( not ( = ?auto_768904 ?auto_768907 ) ) ( not ( = ?auto_768905 ?auto_768906 ) ) ( not ( = ?auto_768905 ?auto_768907 ) ) ( not ( = ?auto_768906 ?auto_768907 ) ) ( CLEAR ?auto_768904 ) ( ON ?auto_768905 ?auto_768906 ) ( CLEAR ?auto_768905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_768894 ?auto_768895 ?auto_768896 ?auto_768897 ?auto_768898 ?auto_768899 ?auto_768900 ?auto_768901 ?auto_768902 ?auto_768903 ?auto_768904 ?auto_768905 )
      ( MAKE-13PILE ?auto_768894 ?auto_768895 ?auto_768896 ?auto_768897 ?auto_768898 ?auto_768899 ?auto_768900 ?auto_768901 ?auto_768902 ?auto_768903 ?auto_768904 ?auto_768905 ?auto_768906 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_768948 - BLOCK
      ?auto_768949 - BLOCK
      ?auto_768950 - BLOCK
      ?auto_768951 - BLOCK
      ?auto_768952 - BLOCK
      ?auto_768953 - BLOCK
      ?auto_768954 - BLOCK
      ?auto_768955 - BLOCK
      ?auto_768956 - BLOCK
      ?auto_768957 - BLOCK
      ?auto_768958 - BLOCK
      ?auto_768959 - BLOCK
      ?auto_768960 - BLOCK
    )
    :vars
    (
      ?auto_768961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_768960 ?auto_768961 ) ( ON-TABLE ?auto_768948 ) ( ON ?auto_768949 ?auto_768948 ) ( ON ?auto_768950 ?auto_768949 ) ( ON ?auto_768951 ?auto_768950 ) ( ON ?auto_768952 ?auto_768951 ) ( ON ?auto_768953 ?auto_768952 ) ( ON ?auto_768954 ?auto_768953 ) ( ON ?auto_768955 ?auto_768954 ) ( ON ?auto_768956 ?auto_768955 ) ( ON ?auto_768957 ?auto_768956 ) ( not ( = ?auto_768948 ?auto_768949 ) ) ( not ( = ?auto_768948 ?auto_768950 ) ) ( not ( = ?auto_768948 ?auto_768951 ) ) ( not ( = ?auto_768948 ?auto_768952 ) ) ( not ( = ?auto_768948 ?auto_768953 ) ) ( not ( = ?auto_768948 ?auto_768954 ) ) ( not ( = ?auto_768948 ?auto_768955 ) ) ( not ( = ?auto_768948 ?auto_768956 ) ) ( not ( = ?auto_768948 ?auto_768957 ) ) ( not ( = ?auto_768948 ?auto_768958 ) ) ( not ( = ?auto_768948 ?auto_768959 ) ) ( not ( = ?auto_768948 ?auto_768960 ) ) ( not ( = ?auto_768948 ?auto_768961 ) ) ( not ( = ?auto_768949 ?auto_768950 ) ) ( not ( = ?auto_768949 ?auto_768951 ) ) ( not ( = ?auto_768949 ?auto_768952 ) ) ( not ( = ?auto_768949 ?auto_768953 ) ) ( not ( = ?auto_768949 ?auto_768954 ) ) ( not ( = ?auto_768949 ?auto_768955 ) ) ( not ( = ?auto_768949 ?auto_768956 ) ) ( not ( = ?auto_768949 ?auto_768957 ) ) ( not ( = ?auto_768949 ?auto_768958 ) ) ( not ( = ?auto_768949 ?auto_768959 ) ) ( not ( = ?auto_768949 ?auto_768960 ) ) ( not ( = ?auto_768949 ?auto_768961 ) ) ( not ( = ?auto_768950 ?auto_768951 ) ) ( not ( = ?auto_768950 ?auto_768952 ) ) ( not ( = ?auto_768950 ?auto_768953 ) ) ( not ( = ?auto_768950 ?auto_768954 ) ) ( not ( = ?auto_768950 ?auto_768955 ) ) ( not ( = ?auto_768950 ?auto_768956 ) ) ( not ( = ?auto_768950 ?auto_768957 ) ) ( not ( = ?auto_768950 ?auto_768958 ) ) ( not ( = ?auto_768950 ?auto_768959 ) ) ( not ( = ?auto_768950 ?auto_768960 ) ) ( not ( = ?auto_768950 ?auto_768961 ) ) ( not ( = ?auto_768951 ?auto_768952 ) ) ( not ( = ?auto_768951 ?auto_768953 ) ) ( not ( = ?auto_768951 ?auto_768954 ) ) ( not ( = ?auto_768951 ?auto_768955 ) ) ( not ( = ?auto_768951 ?auto_768956 ) ) ( not ( = ?auto_768951 ?auto_768957 ) ) ( not ( = ?auto_768951 ?auto_768958 ) ) ( not ( = ?auto_768951 ?auto_768959 ) ) ( not ( = ?auto_768951 ?auto_768960 ) ) ( not ( = ?auto_768951 ?auto_768961 ) ) ( not ( = ?auto_768952 ?auto_768953 ) ) ( not ( = ?auto_768952 ?auto_768954 ) ) ( not ( = ?auto_768952 ?auto_768955 ) ) ( not ( = ?auto_768952 ?auto_768956 ) ) ( not ( = ?auto_768952 ?auto_768957 ) ) ( not ( = ?auto_768952 ?auto_768958 ) ) ( not ( = ?auto_768952 ?auto_768959 ) ) ( not ( = ?auto_768952 ?auto_768960 ) ) ( not ( = ?auto_768952 ?auto_768961 ) ) ( not ( = ?auto_768953 ?auto_768954 ) ) ( not ( = ?auto_768953 ?auto_768955 ) ) ( not ( = ?auto_768953 ?auto_768956 ) ) ( not ( = ?auto_768953 ?auto_768957 ) ) ( not ( = ?auto_768953 ?auto_768958 ) ) ( not ( = ?auto_768953 ?auto_768959 ) ) ( not ( = ?auto_768953 ?auto_768960 ) ) ( not ( = ?auto_768953 ?auto_768961 ) ) ( not ( = ?auto_768954 ?auto_768955 ) ) ( not ( = ?auto_768954 ?auto_768956 ) ) ( not ( = ?auto_768954 ?auto_768957 ) ) ( not ( = ?auto_768954 ?auto_768958 ) ) ( not ( = ?auto_768954 ?auto_768959 ) ) ( not ( = ?auto_768954 ?auto_768960 ) ) ( not ( = ?auto_768954 ?auto_768961 ) ) ( not ( = ?auto_768955 ?auto_768956 ) ) ( not ( = ?auto_768955 ?auto_768957 ) ) ( not ( = ?auto_768955 ?auto_768958 ) ) ( not ( = ?auto_768955 ?auto_768959 ) ) ( not ( = ?auto_768955 ?auto_768960 ) ) ( not ( = ?auto_768955 ?auto_768961 ) ) ( not ( = ?auto_768956 ?auto_768957 ) ) ( not ( = ?auto_768956 ?auto_768958 ) ) ( not ( = ?auto_768956 ?auto_768959 ) ) ( not ( = ?auto_768956 ?auto_768960 ) ) ( not ( = ?auto_768956 ?auto_768961 ) ) ( not ( = ?auto_768957 ?auto_768958 ) ) ( not ( = ?auto_768957 ?auto_768959 ) ) ( not ( = ?auto_768957 ?auto_768960 ) ) ( not ( = ?auto_768957 ?auto_768961 ) ) ( not ( = ?auto_768958 ?auto_768959 ) ) ( not ( = ?auto_768958 ?auto_768960 ) ) ( not ( = ?auto_768958 ?auto_768961 ) ) ( not ( = ?auto_768959 ?auto_768960 ) ) ( not ( = ?auto_768959 ?auto_768961 ) ) ( not ( = ?auto_768960 ?auto_768961 ) ) ( ON ?auto_768959 ?auto_768960 ) ( CLEAR ?auto_768957 ) ( ON ?auto_768958 ?auto_768959 ) ( CLEAR ?auto_768958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_768948 ?auto_768949 ?auto_768950 ?auto_768951 ?auto_768952 ?auto_768953 ?auto_768954 ?auto_768955 ?auto_768956 ?auto_768957 ?auto_768958 )
      ( MAKE-13PILE ?auto_768948 ?auto_768949 ?auto_768950 ?auto_768951 ?auto_768952 ?auto_768953 ?auto_768954 ?auto_768955 ?auto_768956 ?auto_768957 ?auto_768958 ?auto_768959 ?auto_768960 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_769002 - BLOCK
      ?auto_769003 - BLOCK
      ?auto_769004 - BLOCK
      ?auto_769005 - BLOCK
      ?auto_769006 - BLOCK
      ?auto_769007 - BLOCK
      ?auto_769008 - BLOCK
      ?auto_769009 - BLOCK
      ?auto_769010 - BLOCK
      ?auto_769011 - BLOCK
      ?auto_769012 - BLOCK
      ?auto_769013 - BLOCK
      ?auto_769014 - BLOCK
    )
    :vars
    (
      ?auto_769015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769014 ?auto_769015 ) ( ON-TABLE ?auto_769002 ) ( ON ?auto_769003 ?auto_769002 ) ( ON ?auto_769004 ?auto_769003 ) ( ON ?auto_769005 ?auto_769004 ) ( ON ?auto_769006 ?auto_769005 ) ( ON ?auto_769007 ?auto_769006 ) ( ON ?auto_769008 ?auto_769007 ) ( ON ?auto_769009 ?auto_769008 ) ( ON ?auto_769010 ?auto_769009 ) ( not ( = ?auto_769002 ?auto_769003 ) ) ( not ( = ?auto_769002 ?auto_769004 ) ) ( not ( = ?auto_769002 ?auto_769005 ) ) ( not ( = ?auto_769002 ?auto_769006 ) ) ( not ( = ?auto_769002 ?auto_769007 ) ) ( not ( = ?auto_769002 ?auto_769008 ) ) ( not ( = ?auto_769002 ?auto_769009 ) ) ( not ( = ?auto_769002 ?auto_769010 ) ) ( not ( = ?auto_769002 ?auto_769011 ) ) ( not ( = ?auto_769002 ?auto_769012 ) ) ( not ( = ?auto_769002 ?auto_769013 ) ) ( not ( = ?auto_769002 ?auto_769014 ) ) ( not ( = ?auto_769002 ?auto_769015 ) ) ( not ( = ?auto_769003 ?auto_769004 ) ) ( not ( = ?auto_769003 ?auto_769005 ) ) ( not ( = ?auto_769003 ?auto_769006 ) ) ( not ( = ?auto_769003 ?auto_769007 ) ) ( not ( = ?auto_769003 ?auto_769008 ) ) ( not ( = ?auto_769003 ?auto_769009 ) ) ( not ( = ?auto_769003 ?auto_769010 ) ) ( not ( = ?auto_769003 ?auto_769011 ) ) ( not ( = ?auto_769003 ?auto_769012 ) ) ( not ( = ?auto_769003 ?auto_769013 ) ) ( not ( = ?auto_769003 ?auto_769014 ) ) ( not ( = ?auto_769003 ?auto_769015 ) ) ( not ( = ?auto_769004 ?auto_769005 ) ) ( not ( = ?auto_769004 ?auto_769006 ) ) ( not ( = ?auto_769004 ?auto_769007 ) ) ( not ( = ?auto_769004 ?auto_769008 ) ) ( not ( = ?auto_769004 ?auto_769009 ) ) ( not ( = ?auto_769004 ?auto_769010 ) ) ( not ( = ?auto_769004 ?auto_769011 ) ) ( not ( = ?auto_769004 ?auto_769012 ) ) ( not ( = ?auto_769004 ?auto_769013 ) ) ( not ( = ?auto_769004 ?auto_769014 ) ) ( not ( = ?auto_769004 ?auto_769015 ) ) ( not ( = ?auto_769005 ?auto_769006 ) ) ( not ( = ?auto_769005 ?auto_769007 ) ) ( not ( = ?auto_769005 ?auto_769008 ) ) ( not ( = ?auto_769005 ?auto_769009 ) ) ( not ( = ?auto_769005 ?auto_769010 ) ) ( not ( = ?auto_769005 ?auto_769011 ) ) ( not ( = ?auto_769005 ?auto_769012 ) ) ( not ( = ?auto_769005 ?auto_769013 ) ) ( not ( = ?auto_769005 ?auto_769014 ) ) ( not ( = ?auto_769005 ?auto_769015 ) ) ( not ( = ?auto_769006 ?auto_769007 ) ) ( not ( = ?auto_769006 ?auto_769008 ) ) ( not ( = ?auto_769006 ?auto_769009 ) ) ( not ( = ?auto_769006 ?auto_769010 ) ) ( not ( = ?auto_769006 ?auto_769011 ) ) ( not ( = ?auto_769006 ?auto_769012 ) ) ( not ( = ?auto_769006 ?auto_769013 ) ) ( not ( = ?auto_769006 ?auto_769014 ) ) ( not ( = ?auto_769006 ?auto_769015 ) ) ( not ( = ?auto_769007 ?auto_769008 ) ) ( not ( = ?auto_769007 ?auto_769009 ) ) ( not ( = ?auto_769007 ?auto_769010 ) ) ( not ( = ?auto_769007 ?auto_769011 ) ) ( not ( = ?auto_769007 ?auto_769012 ) ) ( not ( = ?auto_769007 ?auto_769013 ) ) ( not ( = ?auto_769007 ?auto_769014 ) ) ( not ( = ?auto_769007 ?auto_769015 ) ) ( not ( = ?auto_769008 ?auto_769009 ) ) ( not ( = ?auto_769008 ?auto_769010 ) ) ( not ( = ?auto_769008 ?auto_769011 ) ) ( not ( = ?auto_769008 ?auto_769012 ) ) ( not ( = ?auto_769008 ?auto_769013 ) ) ( not ( = ?auto_769008 ?auto_769014 ) ) ( not ( = ?auto_769008 ?auto_769015 ) ) ( not ( = ?auto_769009 ?auto_769010 ) ) ( not ( = ?auto_769009 ?auto_769011 ) ) ( not ( = ?auto_769009 ?auto_769012 ) ) ( not ( = ?auto_769009 ?auto_769013 ) ) ( not ( = ?auto_769009 ?auto_769014 ) ) ( not ( = ?auto_769009 ?auto_769015 ) ) ( not ( = ?auto_769010 ?auto_769011 ) ) ( not ( = ?auto_769010 ?auto_769012 ) ) ( not ( = ?auto_769010 ?auto_769013 ) ) ( not ( = ?auto_769010 ?auto_769014 ) ) ( not ( = ?auto_769010 ?auto_769015 ) ) ( not ( = ?auto_769011 ?auto_769012 ) ) ( not ( = ?auto_769011 ?auto_769013 ) ) ( not ( = ?auto_769011 ?auto_769014 ) ) ( not ( = ?auto_769011 ?auto_769015 ) ) ( not ( = ?auto_769012 ?auto_769013 ) ) ( not ( = ?auto_769012 ?auto_769014 ) ) ( not ( = ?auto_769012 ?auto_769015 ) ) ( not ( = ?auto_769013 ?auto_769014 ) ) ( not ( = ?auto_769013 ?auto_769015 ) ) ( not ( = ?auto_769014 ?auto_769015 ) ) ( ON ?auto_769013 ?auto_769014 ) ( ON ?auto_769012 ?auto_769013 ) ( CLEAR ?auto_769010 ) ( ON ?auto_769011 ?auto_769012 ) ( CLEAR ?auto_769011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_769002 ?auto_769003 ?auto_769004 ?auto_769005 ?auto_769006 ?auto_769007 ?auto_769008 ?auto_769009 ?auto_769010 ?auto_769011 )
      ( MAKE-13PILE ?auto_769002 ?auto_769003 ?auto_769004 ?auto_769005 ?auto_769006 ?auto_769007 ?auto_769008 ?auto_769009 ?auto_769010 ?auto_769011 ?auto_769012 ?auto_769013 ?auto_769014 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_769056 - BLOCK
      ?auto_769057 - BLOCK
      ?auto_769058 - BLOCK
      ?auto_769059 - BLOCK
      ?auto_769060 - BLOCK
      ?auto_769061 - BLOCK
      ?auto_769062 - BLOCK
      ?auto_769063 - BLOCK
      ?auto_769064 - BLOCK
      ?auto_769065 - BLOCK
      ?auto_769066 - BLOCK
      ?auto_769067 - BLOCK
      ?auto_769068 - BLOCK
    )
    :vars
    (
      ?auto_769069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769068 ?auto_769069 ) ( ON-TABLE ?auto_769056 ) ( ON ?auto_769057 ?auto_769056 ) ( ON ?auto_769058 ?auto_769057 ) ( ON ?auto_769059 ?auto_769058 ) ( ON ?auto_769060 ?auto_769059 ) ( ON ?auto_769061 ?auto_769060 ) ( ON ?auto_769062 ?auto_769061 ) ( ON ?auto_769063 ?auto_769062 ) ( not ( = ?auto_769056 ?auto_769057 ) ) ( not ( = ?auto_769056 ?auto_769058 ) ) ( not ( = ?auto_769056 ?auto_769059 ) ) ( not ( = ?auto_769056 ?auto_769060 ) ) ( not ( = ?auto_769056 ?auto_769061 ) ) ( not ( = ?auto_769056 ?auto_769062 ) ) ( not ( = ?auto_769056 ?auto_769063 ) ) ( not ( = ?auto_769056 ?auto_769064 ) ) ( not ( = ?auto_769056 ?auto_769065 ) ) ( not ( = ?auto_769056 ?auto_769066 ) ) ( not ( = ?auto_769056 ?auto_769067 ) ) ( not ( = ?auto_769056 ?auto_769068 ) ) ( not ( = ?auto_769056 ?auto_769069 ) ) ( not ( = ?auto_769057 ?auto_769058 ) ) ( not ( = ?auto_769057 ?auto_769059 ) ) ( not ( = ?auto_769057 ?auto_769060 ) ) ( not ( = ?auto_769057 ?auto_769061 ) ) ( not ( = ?auto_769057 ?auto_769062 ) ) ( not ( = ?auto_769057 ?auto_769063 ) ) ( not ( = ?auto_769057 ?auto_769064 ) ) ( not ( = ?auto_769057 ?auto_769065 ) ) ( not ( = ?auto_769057 ?auto_769066 ) ) ( not ( = ?auto_769057 ?auto_769067 ) ) ( not ( = ?auto_769057 ?auto_769068 ) ) ( not ( = ?auto_769057 ?auto_769069 ) ) ( not ( = ?auto_769058 ?auto_769059 ) ) ( not ( = ?auto_769058 ?auto_769060 ) ) ( not ( = ?auto_769058 ?auto_769061 ) ) ( not ( = ?auto_769058 ?auto_769062 ) ) ( not ( = ?auto_769058 ?auto_769063 ) ) ( not ( = ?auto_769058 ?auto_769064 ) ) ( not ( = ?auto_769058 ?auto_769065 ) ) ( not ( = ?auto_769058 ?auto_769066 ) ) ( not ( = ?auto_769058 ?auto_769067 ) ) ( not ( = ?auto_769058 ?auto_769068 ) ) ( not ( = ?auto_769058 ?auto_769069 ) ) ( not ( = ?auto_769059 ?auto_769060 ) ) ( not ( = ?auto_769059 ?auto_769061 ) ) ( not ( = ?auto_769059 ?auto_769062 ) ) ( not ( = ?auto_769059 ?auto_769063 ) ) ( not ( = ?auto_769059 ?auto_769064 ) ) ( not ( = ?auto_769059 ?auto_769065 ) ) ( not ( = ?auto_769059 ?auto_769066 ) ) ( not ( = ?auto_769059 ?auto_769067 ) ) ( not ( = ?auto_769059 ?auto_769068 ) ) ( not ( = ?auto_769059 ?auto_769069 ) ) ( not ( = ?auto_769060 ?auto_769061 ) ) ( not ( = ?auto_769060 ?auto_769062 ) ) ( not ( = ?auto_769060 ?auto_769063 ) ) ( not ( = ?auto_769060 ?auto_769064 ) ) ( not ( = ?auto_769060 ?auto_769065 ) ) ( not ( = ?auto_769060 ?auto_769066 ) ) ( not ( = ?auto_769060 ?auto_769067 ) ) ( not ( = ?auto_769060 ?auto_769068 ) ) ( not ( = ?auto_769060 ?auto_769069 ) ) ( not ( = ?auto_769061 ?auto_769062 ) ) ( not ( = ?auto_769061 ?auto_769063 ) ) ( not ( = ?auto_769061 ?auto_769064 ) ) ( not ( = ?auto_769061 ?auto_769065 ) ) ( not ( = ?auto_769061 ?auto_769066 ) ) ( not ( = ?auto_769061 ?auto_769067 ) ) ( not ( = ?auto_769061 ?auto_769068 ) ) ( not ( = ?auto_769061 ?auto_769069 ) ) ( not ( = ?auto_769062 ?auto_769063 ) ) ( not ( = ?auto_769062 ?auto_769064 ) ) ( not ( = ?auto_769062 ?auto_769065 ) ) ( not ( = ?auto_769062 ?auto_769066 ) ) ( not ( = ?auto_769062 ?auto_769067 ) ) ( not ( = ?auto_769062 ?auto_769068 ) ) ( not ( = ?auto_769062 ?auto_769069 ) ) ( not ( = ?auto_769063 ?auto_769064 ) ) ( not ( = ?auto_769063 ?auto_769065 ) ) ( not ( = ?auto_769063 ?auto_769066 ) ) ( not ( = ?auto_769063 ?auto_769067 ) ) ( not ( = ?auto_769063 ?auto_769068 ) ) ( not ( = ?auto_769063 ?auto_769069 ) ) ( not ( = ?auto_769064 ?auto_769065 ) ) ( not ( = ?auto_769064 ?auto_769066 ) ) ( not ( = ?auto_769064 ?auto_769067 ) ) ( not ( = ?auto_769064 ?auto_769068 ) ) ( not ( = ?auto_769064 ?auto_769069 ) ) ( not ( = ?auto_769065 ?auto_769066 ) ) ( not ( = ?auto_769065 ?auto_769067 ) ) ( not ( = ?auto_769065 ?auto_769068 ) ) ( not ( = ?auto_769065 ?auto_769069 ) ) ( not ( = ?auto_769066 ?auto_769067 ) ) ( not ( = ?auto_769066 ?auto_769068 ) ) ( not ( = ?auto_769066 ?auto_769069 ) ) ( not ( = ?auto_769067 ?auto_769068 ) ) ( not ( = ?auto_769067 ?auto_769069 ) ) ( not ( = ?auto_769068 ?auto_769069 ) ) ( ON ?auto_769067 ?auto_769068 ) ( ON ?auto_769066 ?auto_769067 ) ( ON ?auto_769065 ?auto_769066 ) ( CLEAR ?auto_769063 ) ( ON ?auto_769064 ?auto_769065 ) ( CLEAR ?auto_769064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_769056 ?auto_769057 ?auto_769058 ?auto_769059 ?auto_769060 ?auto_769061 ?auto_769062 ?auto_769063 ?auto_769064 )
      ( MAKE-13PILE ?auto_769056 ?auto_769057 ?auto_769058 ?auto_769059 ?auto_769060 ?auto_769061 ?auto_769062 ?auto_769063 ?auto_769064 ?auto_769065 ?auto_769066 ?auto_769067 ?auto_769068 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_769110 - BLOCK
      ?auto_769111 - BLOCK
      ?auto_769112 - BLOCK
      ?auto_769113 - BLOCK
      ?auto_769114 - BLOCK
      ?auto_769115 - BLOCK
      ?auto_769116 - BLOCK
      ?auto_769117 - BLOCK
      ?auto_769118 - BLOCK
      ?auto_769119 - BLOCK
      ?auto_769120 - BLOCK
      ?auto_769121 - BLOCK
      ?auto_769122 - BLOCK
    )
    :vars
    (
      ?auto_769123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769122 ?auto_769123 ) ( ON-TABLE ?auto_769110 ) ( ON ?auto_769111 ?auto_769110 ) ( ON ?auto_769112 ?auto_769111 ) ( ON ?auto_769113 ?auto_769112 ) ( ON ?auto_769114 ?auto_769113 ) ( ON ?auto_769115 ?auto_769114 ) ( ON ?auto_769116 ?auto_769115 ) ( not ( = ?auto_769110 ?auto_769111 ) ) ( not ( = ?auto_769110 ?auto_769112 ) ) ( not ( = ?auto_769110 ?auto_769113 ) ) ( not ( = ?auto_769110 ?auto_769114 ) ) ( not ( = ?auto_769110 ?auto_769115 ) ) ( not ( = ?auto_769110 ?auto_769116 ) ) ( not ( = ?auto_769110 ?auto_769117 ) ) ( not ( = ?auto_769110 ?auto_769118 ) ) ( not ( = ?auto_769110 ?auto_769119 ) ) ( not ( = ?auto_769110 ?auto_769120 ) ) ( not ( = ?auto_769110 ?auto_769121 ) ) ( not ( = ?auto_769110 ?auto_769122 ) ) ( not ( = ?auto_769110 ?auto_769123 ) ) ( not ( = ?auto_769111 ?auto_769112 ) ) ( not ( = ?auto_769111 ?auto_769113 ) ) ( not ( = ?auto_769111 ?auto_769114 ) ) ( not ( = ?auto_769111 ?auto_769115 ) ) ( not ( = ?auto_769111 ?auto_769116 ) ) ( not ( = ?auto_769111 ?auto_769117 ) ) ( not ( = ?auto_769111 ?auto_769118 ) ) ( not ( = ?auto_769111 ?auto_769119 ) ) ( not ( = ?auto_769111 ?auto_769120 ) ) ( not ( = ?auto_769111 ?auto_769121 ) ) ( not ( = ?auto_769111 ?auto_769122 ) ) ( not ( = ?auto_769111 ?auto_769123 ) ) ( not ( = ?auto_769112 ?auto_769113 ) ) ( not ( = ?auto_769112 ?auto_769114 ) ) ( not ( = ?auto_769112 ?auto_769115 ) ) ( not ( = ?auto_769112 ?auto_769116 ) ) ( not ( = ?auto_769112 ?auto_769117 ) ) ( not ( = ?auto_769112 ?auto_769118 ) ) ( not ( = ?auto_769112 ?auto_769119 ) ) ( not ( = ?auto_769112 ?auto_769120 ) ) ( not ( = ?auto_769112 ?auto_769121 ) ) ( not ( = ?auto_769112 ?auto_769122 ) ) ( not ( = ?auto_769112 ?auto_769123 ) ) ( not ( = ?auto_769113 ?auto_769114 ) ) ( not ( = ?auto_769113 ?auto_769115 ) ) ( not ( = ?auto_769113 ?auto_769116 ) ) ( not ( = ?auto_769113 ?auto_769117 ) ) ( not ( = ?auto_769113 ?auto_769118 ) ) ( not ( = ?auto_769113 ?auto_769119 ) ) ( not ( = ?auto_769113 ?auto_769120 ) ) ( not ( = ?auto_769113 ?auto_769121 ) ) ( not ( = ?auto_769113 ?auto_769122 ) ) ( not ( = ?auto_769113 ?auto_769123 ) ) ( not ( = ?auto_769114 ?auto_769115 ) ) ( not ( = ?auto_769114 ?auto_769116 ) ) ( not ( = ?auto_769114 ?auto_769117 ) ) ( not ( = ?auto_769114 ?auto_769118 ) ) ( not ( = ?auto_769114 ?auto_769119 ) ) ( not ( = ?auto_769114 ?auto_769120 ) ) ( not ( = ?auto_769114 ?auto_769121 ) ) ( not ( = ?auto_769114 ?auto_769122 ) ) ( not ( = ?auto_769114 ?auto_769123 ) ) ( not ( = ?auto_769115 ?auto_769116 ) ) ( not ( = ?auto_769115 ?auto_769117 ) ) ( not ( = ?auto_769115 ?auto_769118 ) ) ( not ( = ?auto_769115 ?auto_769119 ) ) ( not ( = ?auto_769115 ?auto_769120 ) ) ( not ( = ?auto_769115 ?auto_769121 ) ) ( not ( = ?auto_769115 ?auto_769122 ) ) ( not ( = ?auto_769115 ?auto_769123 ) ) ( not ( = ?auto_769116 ?auto_769117 ) ) ( not ( = ?auto_769116 ?auto_769118 ) ) ( not ( = ?auto_769116 ?auto_769119 ) ) ( not ( = ?auto_769116 ?auto_769120 ) ) ( not ( = ?auto_769116 ?auto_769121 ) ) ( not ( = ?auto_769116 ?auto_769122 ) ) ( not ( = ?auto_769116 ?auto_769123 ) ) ( not ( = ?auto_769117 ?auto_769118 ) ) ( not ( = ?auto_769117 ?auto_769119 ) ) ( not ( = ?auto_769117 ?auto_769120 ) ) ( not ( = ?auto_769117 ?auto_769121 ) ) ( not ( = ?auto_769117 ?auto_769122 ) ) ( not ( = ?auto_769117 ?auto_769123 ) ) ( not ( = ?auto_769118 ?auto_769119 ) ) ( not ( = ?auto_769118 ?auto_769120 ) ) ( not ( = ?auto_769118 ?auto_769121 ) ) ( not ( = ?auto_769118 ?auto_769122 ) ) ( not ( = ?auto_769118 ?auto_769123 ) ) ( not ( = ?auto_769119 ?auto_769120 ) ) ( not ( = ?auto_769119 ?auto_769121 ) ) ( not ( = ?auto_769119 ?auto_769122 ) ) ( not ( = ?auto_769119 ?auto_769123 ) ) ( not ( = ?auto_769120 ?auto_769121 ) ) ( not ( = ?auto_769120 ?auto_769122 ) ) ( not ( = ?auto_769120 ?auto_769123 ) ) ( not ( = ?auto_769121 ?auto_769122 ) ) ( not ( = ?auto_769121 ?auto_769123 ) ) ( not ( = ?auto_769122 ?auto_769123 ) ) ( ON ?auto_769121 ?auto_769122 ) ( ON ?auto_769120 ?auto_769121 ) ( ON ?auto_769119 ?auto_769120 ) ( ON ?auto_769118 ?auto_769119 ) ( CLEAR ?auto_769116 ) ( ON ?auto_769117 ?auto_769118 ) ( CLEAR ?auto_769117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_769110 ?auto_769111 ?auto_769112 ?auto_769113 ?auto_769114 ?auto_769115 ?auto_769116 ?auto_769117 )
      ( MAKE-13PILE ?auto_769110 ?auto_769111 ?auto_769112 ?auto_769113 ?auto_769114 ?auto_769115 ?auto_769116 ?auto_769117 ?auto_769118 ?auto_769119 ?auto_769120 ?auto_769121 ?auto_769122 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_769164 - BLOCK
      ?auto_769165 - BLOCK
      ?auto_769166 - BLOCK
      ?auto_769167 - BLOCK
      ?auto_769168 - BLOCK
      ?auto_769169 - BLOCK
      ?auto_769170 - BLOCK
      ?auto_769171 - BLOCK
      ?auto_769172 - BLOCK
      ?auto_769173 - BLOCK
      ?auto_769174 - BLOCK
      ?auto_769175 - BLOCK
      ?auto_769176 - BLOCK
    )
    :vars
    (
      ?auto_769177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769176 ?auto_769177 ) ( ON-TABLE ?auto_769164 ) ( ON ?auto_769165 ?auto_769164 ) ( ON ?auto_769166 ?auto_769165 ) ( ON ?auto_769167 ?auto_769166 ) ( ON ?auto_769168 ?auto_769167 ) ( ON ?auto_769169 ?auto_769168 ) ( not ( = ?auto_769164 ?auto_769165 ) ) ( not ( = ?auto_769164 ?auto_769166 ) ) ( not ( = ?auto_769164 ?auto_769167 ) ) ( not ( = ?auto_769164 ?auto_769168 ) ) ( not ( = ?auto_769164 ?auto_769169 ) ) ( not ( = ?auto_769164 ?auto_769170 ) ) ( not ( = ?auto_769164 ?auto_769171 ) ) ( not ( = ?auto_769164 ?auto_769172 ) ) ( not ( = ?auto_769164 ?auto_769173 ) ) ( not ( = ?auto_769164 ?auto_769174 ) ) ( not ( = ?auto_769164 ?auto_769175 ) ) ( not ( = ?auto_769164 ?auto_769176 ) ) ( not ( = ?auto_769164 ?auto_769177 ) ) ( not ( = ?auto_769165 ?auto_769166 ) ) ( not ( = ?auto_769165 ?auto_769167 ) ) ( not ( = ?auto_769165 ?auto_769168 ) ) ( not ( = ?auto_769165 ?auto_769169 ) ) ( not ( = ?auto_769165 ?auto_769170 ) ) ( not ( = ?auto_769165 ?auto_769171 ) ) ( not ( = ?auto_769165 ?auto_769172 ) ) ( not ( = ?auto_769165 ?auto_769173 ) ) ( not ( = ?auto_769165 ?auto_769174 ) ) ( not ( = ?auto_769165 ?auto_769175 ) ) ( not ( = ?auto_769165 ?auto_769176 ) ) ( not ( = ?auto_769165 ?auto_769177 ) ) ( not ( = ?auto_769166 ?auto_769167 ) ) ( not ( = ?auto_769166 ?auto_769168 ) ) ( not ( = ?auto_769166 ?auto_769169 ) ) ( not ( = ?auto_769166 ?auto_769170 ) ) ( not ( = ?auto_769166 ?auto_769171 ) ) ( not ( = ?auto_769166 ?auto_769172 ) ) ( not ( = ?auto_769166 ?auto_769173 ) ) ( not ( = ?auto_769166 ?auto_769174 ) ) ( not ( = ?auto_769166 ?auto_769175 ) ) ( not ( = ?auto_769166 ?auto_769176 ) ) ( not ( = ?auto_769166 ?auto_769177 ) ) ( not ( = ?auto_769167 ?auto_769168 ) ) ( not ( = ?auto_769167 ?auto_769169 ) ) ( not ( = ?auto_769167 ?auto_769170 ) ) ( not ( = ?auto_769167 ?auto_769171 ) ) ( not ( = ?auto_769167 ?auto_769172 ) ) ( not ( = ?auto_769167 ?auto_769173 ) ) ( not ( = ?auto_769167 ?auto_769174 ) ) ( not ( = ?auto_769167 ?auto_769175 ) ) ( not ( = ?auto_769167 ?auto_769176 ) ) ( not ( = ?auto_769167 ?auto_769177 ) ) ( not ( = ?auto_769168 ?auto_769169 ) ) ( not ( = ?auto_769168 ?auto_769170 ) ) ( not ( = ?auto_769168 ?auto_769171 ) ) ( not ( = ?auto_769168 ?auto_769172 ) ) ( not ( = ?auto_769168 ?auto_769173 ) ) ( not ( = ?auto_769168 ?auto_769174 ) ) ( not ( = ?auto_769168 ?auto_769175 ) ) ( not ( = ?auto_769168 ?auto_769176 ) ) ( not ( = ?auto_769168 ?auto_769177 ) ) ( not ( = ?auto_769169 ?auto_769170 ) ) ( not ( = ?auto_769169 ?auto_769171 ) ) ( not ( = ?auto_769169 ?auto_769172 ) ) ( not ( = ?auto_769169 ?auto_769173 ) ) ( not ( = ?auto_769169 ?auto_769174 ) ) ( not ( = ?auto_769169 ?auto_769175 ) ) ( not ( = ?auto_769169 ?auto_769176 ) ) ( not ( = ?auto_769169 ?auto_769177 ) ) ( not ( = ?auto_769170 ?auto_769171 ) ) ( not ( = ?auto_769170 ?auto_769172 ) ) ( not ( = ?auto_769170 ?auto_769173 ) ) ( not ( = ?auto_769170 ?auto_769174 ) ) ( not ( = ?auto_769170 ?auto_769175 ) ) ( not ( = ?auto_769170 ?auto_769176 ) ) ( not ( = ?auto_769170 ?auto_769177 ) ) ( not ( = ?auto_769171 ?auto_769172 ) ) ( not ( = ?auto_769171 ?auto_769173 ) ) ( not ( = ?auto_769171 ?auto_769174 ) ) ( not ( = ?auto_769171 ?auto_769175 ) ) ( not ( = ?auto_769171 ?auto_769176 ) ) ( not ( = ?auto_769171 ?auto_769177 ) ) ( not ( = ?auto_769172 ?auto_769173 ) ) ( not ( = ?auto_769172 ?auto_769174 ) ) ( not ( = ?auto_769172 ?auto_769175 ) ) ( not ( = ?auto_769172 ?auto_769176 ) ) ( not ( = ?auto_769172 ?auto_769177 ) ) ( not ( = ?auto_769173 ?auto_769174 ) ) ( not ( = ?auto_769173 ?auto_769175 ) ) ( not ( = ?auto_769173 ?auto_769176 ) ) ( not ( = ?auto_769173 ?auto_769177 ) ) ( not ( = ?auto_769174 ?auto_769175 ) ) ( not ( = ?auto_769174 ?auto_769176 ) ) ( not ( = ?auto_769174 ?auto_769177 ) ) ( not ( = ?auto_769175 ?auto_769176 ) ) ( not ( = ?auto_769175 ?auto_769177 ) ) ( not ( = ?auto_769176 ?auto_769177 ) ) ( ON ?auto_769175 ?auto_769176 ) ( ON ?auto_769174 ?auto_769175 ) ( ON ?auto_769173 ?auto_769174 ) ( ON ?auto_769172 ?auto_769173 ) ( ON ?auto_769171 ?auto_769172 ) ( CLEAR ?auto_769169 ) ( ON ?auto_769170 ?auto_769171 ) ( CLEAR ?auto_769170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_769164 ?auto_769165 ?auto_769166 ?auto_769167 ?auto_769168 ?auto_769169 ?auto_769170 )
      ( MAKE-13PILE ?auto_769164 ?auto_769165 ?auto_769166 ?auto_769167 ?auto_769168 ?auto_769169 ?auto_769170 ?auto_769171 ?auto_769172 ?auto_769173 ?auto_769174 ?auto_769175 ?auto_769176 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_769218 - BLOCK
      ?auto_769219 - BLOCK
      ?auto_769220 - BLOCK
      ?auto_769221 - BLOCK
      ?auto_769222 - BLOCK
      ?auto_769223 - BLOCK
      ?auto_769224 - BLOCK
      ?auto_769225 - BLOCK
      ?auto_769226 - BLOCK
      ?auto_769227 - BLOCK
      ?auto_769228 - BLOCK
      ?auto_769229 - BLOCK
      ?auto_769230 - BLOCK
    )
    :vars
    (
      ?auto_769231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769230 ?auto_769231 ) ( ON-TABLE ?auto_769218 ) ( ON ?auto_769219 ?auto_769218 ) ( ON ?auto_769220 ?auto_769219 ) ( ON ?auto_769221 ?auto_769220 ) ( ON ?auto_769222 ?auto_769221 ) ( not ( = ?auto_769218 ?auto_769219 ) ) ( not ( = ?auto_769218 ?auto_769220 ) ) ( not ( = ?auto_769218 ?auto_769221 ) ) ( not ( = ?auto_769218 ?auto_769222 ) ) ( not ( = ?auto_769218 ?auto_769223 ) ) ( not ( = ?auto_769218 ?auto_769224 ) ) ( not ( = ?auto_769218 ?auto_769225 ) ) ( not ( = ?auto_769218 ?auto_769226 ) ) ( not ( = ?auto_769218 ?auto_769227 ) ) ( not ( = ?auto_769218 ?auto_769228 ) ) ( not ( = ?auto_769218 ?auto_769229 ) ) ( not ( = ?auto_769218 ?auto_769230 ) ) ( not ( = ?auto_769218 ?auto_769231 ) ) ( not ( = ?auto_769219 ?auto_769220 ) ) ( not ( = ?auto_769219 ?auto_769221 ) ) ( not ( = ?auto_769219 ?auto_769222 ) ) ( not ( = ?auto_769219 ?auto_769223 ) ) ( not ( = ?auto_769219 ?auto_769224 ) ) ( not ( = ?auto_769219 ?auto_769225 ) ) ( not ( = ?auto_769219 ?auto_769226 ) ) ( not ( = ?auto_769219 ?auto_769227 ) ) ( not ( = ?auto_769219 ?auto_769228 ) ) ( not ( = ?auto_769219 ?auto_769229 ) ) ( not ( = ?auto_769219 ?auto_769230 ) ) ( not ( = ?auto_769219 ?auto_769231 ) ) ( not ( = ?auto_769220 ?auto_769221 ) ) ( not ( = ?auto_769220 ?auto_769222 ) ) ( not ( = ?auto_769220 ?auto_769223 ) ) ( not ( = ?auto_769220 ?auto_769224 ) ) ( not ( = ?auto_769220 ?auto_769225 ) ) ( not ( = ?auto_769220 ?auto_769226 ) ) ( not ( = ?auto_769220 ?auto_769227 ) ) ( not ( = ?auto_769220 ?auto_769228 ) ) ( not ( = ?auto_769220 ?auto_769229 ) ) ( not ( = ?auto_769220 ?auto_769230 ) ) ( not ( = ?auto_769220 ?auto_769231 ) ) ( not ( = ?auto_769221 ?auto_769222 ) ) ( not ( = ?auto_769221 ?auto_769223 ) ) ( not ( = ?auto_769221 ?auto_769224 ) ) ( not ( = ?auto_769221 ?auto_769225 ) ) ( not ( = ?auto_769221 ?auto_769226 ) ) ( not ( = ?auto_769221 ?auto_769227 ) ) ( not ( = ?auto_769221 ?auto_769228 ) ) ( not ( = ?auto_769221 ?auto_769229 ) ) ( not ( = ?auto_769221 ?auto_769230 ) ) ( not ( = ?auto_769221 ?auto_769231 ) ) ( not ( = ?auto_769222 ?auto_769223 ) ) ( not ( = ?auto_769222 ?auto_769224 ) ) ( not ( = ?auto_769222 ?auto_769225 ) ) ( not ( = ?auto_769222 ?auto_769226 ) ) ( not ( = ?auto_769222 ?auto_769227 ) ) ( not ( = ?auto_769222 ?auto_769228 ) ) ( not ( = ?auto_769222 ?auto_769229 ) ) ( not ( = ?auto_769222 ?auto_769230 ) ) ( not ( = ?auto_769222 ?auto_769231 ) ) ( not ( = ?auto_769223 ?auto_769224 ) ) ( not ( = ?auto_769223 ?auto_769225 ) ) ( not ( = ?auto_769223 ?auto_769226 ) ) ( not ( = ?auto_769223 ?auto_769227 ) ) ( not ( = ?auto_769223 ?auto_769228 ) ) ( not ( = ?auto_769223 ?auto_769229 ) ) ( not ( = ?auto_769223 ?auto_769230 ) ) ( not ( = ?auto_769223 ?auto_769231 ) ) ( not ( = ?auto_769224 ?auto_769225 ) ) ( not ( = ?auto_769224 ?auto_769226 ) ) ( not ( = ?auto_769224 ?auto_769227 ) ) ( not ( = ?auto_769224 ?auto_769228 ) ) ( not ( = ?auto_769224 ?auto_769229 ) ) ( not ( = ?auto_769224 ?auto_769230 ) ) ( not ( = ?auto_769224 ?auto_769231 ) ) ( not ( = ?auto_769225 ?auto_769226 ) ) ( not ( = ?auto_769225 ?auto_769227 ) ) ( not ( = ?auto_769225 ?auto_769228 ) ) ( not ( = ?auto_769225 ?auto_769229 ) ) ( not ( = ?auto_769225 ?auto_769230 ) ) ( not ( = ?auto_769225 ?auto_769231 ) ) ( not ( = ?auto_769226 ?auto_769227 ) ) ( not ( = ?auto_769226 ?auto_769228 ) ) ( not ( = ?auto_769226 ?auto_769229 ) ) ( not ( = ?auto_769226 ?auto_769230 ) ) ( not ( = ?auto_769226 ?auto_769231 ) ) ( not ( = ?auto_769227 ?auto_769228 ) ) ( not ( = ?auto_769227 ?auto_769229 ) ) ( not ( = ?auto_769227 ?auto_769230 ) ) ( not ( = ?auto_769227 ?auto_769231 ) ) ( not ( = ?auto_769228 ?auto_769229 ) ) ( not ( = ?auto_769228 ?auto_769230 ) ) ( not ( = ?auto_769228 ?auto_769231 ) ) ( not ( = ?auto_769229 ?auto_769230 ) ) ( not ( = ?auto_769229 ?auto_769231 ) ) ( not ( = ?auto_769230 ?auto_769231 ) ) ( ON ?auto_769229 ?auto_769230 ) ( ON ?auto_769228 ?auto_769229 ) ( ON ?auto_769227 ?auto_769228 ) ( ON ?auto_769226 ?auto_769227 ) ( ON ?auto_769225 ?auto_769226 ) ( ON ?auto_769224 ?auto_769225 ) ( CLEAR ?auto_769222 ) ( ON ?auto_769223 ?auto_769224 ) ( CLEAR ?auto_769223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_769218 ?auto_769219 ?auto_769220 ?auto_769221 ?auto_769222 ?auto_769223 )
      ( MAKE-13PILE ?auto_769218 ?auto_769219 ?auto_769220 ?auto_769221 ?auto_769222 ?auto_769223 ?auto_769224 ?auto_769225 ?auto_769226 ?auto_769227 ?auto_769228 ?auto_769229 ?auto_769230 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_769272 - BLOCK
      ?auto_769273 - BLOCK
      ?auto_769274 - BLOCK
      ?auto_769275 - BLOCK
      ?auto_769276 - BLOCK
      ?auto_769277 - BLOCK
      ?auto_769278 - BLOCK
      ?auto_769279 - BLOCK
      ?auto_769280 - BLOCK
      ?auto_769281 - BLOCK
      ?auto_769282 - BLOCK
      ?auto_769283 - BLOCK
      ?auto_769284 - BLOCK
    )
    :vars
    (
      ?auto_769285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769284 ?auto_769285 ) ( ON-TABLE ?auto_769272 ) ( ON ?auto_769273 ?auto_769272 ) ( ON ?auto_769274 ?auto_769273 ) ( ON ?auto_769275 ?auto_769274 ) ( not ( = ?auto_769272 ?auto_769273 ) ) ( not ( = ?auto_769272 ?auto_769274 ) ) ( not ( = ?auto_769272 ?auto_769275 ) ) ( not ( = ?auto_769272 ?auto_769276 ) ) ( not ( = ?auto_769272 ?auto_769277 ) ) ( not ( = ?auto_769272 ?auto_769278 ) ) ( not ( = ?auto_769272 ?auto_769279 ) ) ( not ( = ?auto_769272 ?auto_769280 ) ) ( not ( = ?auto_769272 ?auto_769281 ) ) ( not ( = ?auto_769272 ?auto_769282 ) ) ( not ( = ?auto_769272 ?auto_769283 ) ) ( not ( = ?auto_769272 ?auto_769284 ) ) ( not ( = ?auto_769272 ?auto_769285 ) ) ( not ( = ?auto_769273 ?auto_769274 ) ) ( not ( = ?auto_769273 ?auto_769275 ) ) ( not ( = ?auto_769273 ?auto_769276 ) ) ( not ( = ?auto_769273 ?auto_769277 ) ) ( not ( = ?auto_769273 ?auto_769278 ) ) ( not ( = ?auto_769273 ?auto_769279 ) ) ( not ( = ?auto_769273 ?auto_769280 ) ) ( not ( = ?auto_769273 ?auto_769281 ) ) ( not ( = ?auto_769273 ?auto_769282 ) ) ( not ( = ?auto_769273 ?auto_769283 ) ) ( not ( = ?auto_769273 ?auto_769284 ) ) ( not ( = ?auto_769273 ?auto_769285 ) ) ( not ( = ?auto_769274 ?auto_769275 ) ) ( not ( = ?auto_769274 ?auto_769276 ) ) ( not ( = ?auto_769274 ?auto_769277 ) ) ( not ( = ?auto_769274 ?auto_769278 ) ) ( not ( = ?auto_769274 ?auto_769279 ) ) ( not ( = ?auto_769274 ?auto_769280 ) ) ( not ( = ?auto_769274 ?auto_769281 ) ) ( not ( = ?auto_769274 ?auto_769282 ) ) ( not ( = ?auto_769274 ?auto_769283 ) ) ( not ( = ?auto_769274 ?auto_769284 ) ) ( not ( = ?auto_769274 ?auto_769285 ) ) ( not ( = ?auto_769275 ?auto_769276 ) ) ( not ( = ?auto_769275 ?auto_769277 ) ) ( not ( = ?auto_769275 ?auto_769278 ) ) ( not ( = ?auto_769275 ?auto_769279 ) ) ( not ( = ?auto_769275 ?auto_769280 ) ) ( not ( = ?auto_769275 ?auto_769281 ) ) ( not ( = ?auto_769275 ?auto_769282 ) ) ( not ( = ?auto_769275 ?auto_769283 ) ) ( not ( = ?auto_769275 ?auto_769284 ) ) ( not ( = ?auto_769275 ?auto_769285 ) ) ( not ( = ?auto_769276 ?auto_769277 ) ) ( not ( = ?auto_769276 ?auto_769278 ) ) ( not ( = ?auto_769276 ?auto_769279 ) ) ( not ( = ?auto_769276 ?auto_769280 ) ) ( not ( = ?auto_769276 ?auto_769281 ) ) ( not ( = ?auto_769276 ?auto_769282 ) ) ( not ( = ?auto_769276 ?auto_769283 ) ) ( not ( = ?auto_769276 ?auto_769284 ) ) ( not ( = ?auto_769276 ?auto_769285 ) ) ( not ( = ?auto_769277 ?auto_769278 ) ) ( not ( = ?auto_769277 ?auto_769279 ) ) ( not ( = ?auto_769277 ?auto_769280 ) ) ( not ( = ?auto_769277 ?auto_769281 ) ) ( not ( = ?auto_769277 ?auto_769282 ) ) ( not ( = ?auto_769277 ?auto_769283 ) ) ( not ( = ?auto_769277 ?auto_769284 ) ) ( not ( = ?auto_769277 ?auto_769285 ) ) ( not ( = ?auto_769278 ?auto_769279 ) ) ( not ( = ?auto_769278 ?auto_769280 ) ) ( not ( = ?auto_769278 ?auto_769281 ) ) ( not ( = ?auto_769278 ?auto_769282 ) ) ( not ( = ?auto_769278 ?auto_769283 ) ) ( not ( = ?auto_769278 ?auto_769284 ) ) ( not ( = ?auto_769278 ?auto_769285 ) ) ( not ( = ?auto_769279 ?auto_769280 ) ) ( not ( = ?auto_769279 ?auto_769281 ) ) ( not ( = ?auto_769279 ?auto_769282 ) ) ( not ( = ?auto_769279 ?auto_769283 ) ) ( not ( = ?auto_769279 ?auto_769284 ) ) ( not ( = ?auto_769279 ?auto_769285 ) ) ( not ( = ?auto_769280 ?auto_769281 ) ) ( not ( = ?auto_769280 ?auto_769282 ) ) ( not ( = ?auto_769280 ?auto_769283 ) ) ( not ( = ?auto_769280 ?auto_769284 ) ) ( not ( = ?auto_769280 ?auto_769285 ) ) ( not ( = ?auto_769281 ?auto_769282 ) ) ( not ( = ?auto_769281 ?auto_769283 ) ) ( not ( = ?auto_769281 ?auto_769284 ) ) ( not ( = ?auto_769281 ?auto_769285 ) ) ( not ( = ?auto_769282 ?auto_769283 ) ) ( not ( = ?auto_769282 ?auto_769284 ) ) ( not ( = ?auto_769282 ?auto_769285 ) ) ( not ( = ?auto_769283 ?auto_769284 ) ) ( not ( = ?auto_769283 ?auto_769285 ) ) ( not ( = ?auto_769284 ?auto_769285 ) ) ( ON ?auto_769283 ?auto_769284 ) ( ON ?auto_769282 ?auto_769283 ) ( ON ?auto_769281 ?auto_769282 ) ( ON ?auto_769280 ?auto_769281 ) ( ON ?auto_769279 ?auto_769280 ) ( ON ?auto_769278 ?auto_769279 ) ( ON ?auto_769277 ?auto_769278 ) ( CLEAR ?auto_769275 ) ( ON ?auto_769276 ?auto_769277 ) ( CLEAR ?auto_769276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_769272 ?auto_769273 ?auto_769274 ?auto_769275 ?auto_769276 )
      ( MAKE-13PILE ?auto_769272 ?auto_769273 ?auto_769274 ?auto_769275 ?auto_769276 ?auto_769277 ?auto_769278 ?auto_769279 ?auto_769280 ?auto_769281 ?auto_769282 ?auto_769283 ?auto_769284 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_769326 - BLOCK
      ?auto_769327 - BLOCK
      ?auto_769328 - BLOCK
      ?auto_769329 - BLOCK
      ?auto_769330 - BLOCK
      ?auto_769331 - BLOCK
      ?auto_769332 - BLOCK
      ?auto_769333 - BLOCK
      ?auto_769334 - BLOCK
      ?auto_769335 - BLOCK
      ?auto_769336 - BLOCK
      ?auto_769337 - BLOCK
      ?auto_769338 - BLOCK
    )
    :vars
    (
      ?auto_769339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769338 ?auto_769339 ) ( ON-TABLE ?auto_769326 ) ( ON ?auto_769327 ?auto_769326 ) ( ON ?auto_769328 ?auto_769327 ) ( not ( = ?auto_769326 ?auto_769327 ) ) ( not ( = ?auto_769326 ?auto_769328 ) ) ( not ( = ?auto_769326 ?auto_769329 ) ) ( not ( = ?auto_769326 ?auto_769330 ) ) ( not ( = ?auto_769326 ?auto_769331 ) ) ( not ( = ?auto_769326 ?auto_769332 ) ) ( not ( = ?auto_769326 ?auto_769333 ) ) ( not ( = ?auto_769326 ?auto_769334 ) ) ( not ( = ?auto_769326 ?auto_769335 ) ) ( not ( = ?auto_769326 ?auto_769336 ) ) ( not ( = ?auto_769326 ?auto_769337 ) ) ( not ( = ?auto_769326 ?auto_769338 ) ) ( not ( = ?auto_769326 ?auto_769339 ) ) ( not ( = ?auto_769327 ?auto_769328 ) ) ( not ( = ?auto_769327 ?auto_769329 ) ) ( not ( = ?auto_769327 ?auto_769330 ) ) ( not ( = ?auto_769327 ?auto_769331 ) ) ( not ( = ?auto_769327 ?auto_769332 ) ) ( not ( = ?auto_769327 ?auto_769333 ) ) ( not ( = ?auto_769327 ?auto_769334 ) ) ( not ( = ?auto_769327 ?auto_769335 ) ) ( not ( = ?auto_769327 ?auto_769336 ) ) ( not ( = ?auto_769327 ?auto_769337 ) ) ( not ( = ?auto_769327 ?auto_769338 ) ) ( not ( = ?auto_769327 ?auto_769339 ) ) ( not ( = ?auto_769328 ?auto_769329 ) ) ( not ( = ?auto_769328 ?auto_769330 ) ) ( not ( = ?auto_769328 ?auto_769331 ) ) ( not ( = ?auto_769328 ?auto_769332 ) ) ( not ( = ?auto_769328 ?auto_769333 ) ) ( not ( = ?auto_769328 ?auto_769334 ) ) ( not ( = ?auto_769328 ?auto_769335 ) ) ( not ( = ?auto_769328 ?auto_769336 ) ) ( not ( = ?auto_769328 ?auto_769337 ) ) ( not ( = ?auto_769328 ?auto_769338 ) ) ( not ( = ?auto_769328 ?auto_769339 ) ) ( not ( = ?auto_769329 ?auto_769330 ) ) ( not ( = ?auto_769329 ?auto_769331 ) ) ( not ( = ?auto_769329 ?auto_769332 ) ) ( not ( = ?auto_769329 ?auto_769333 ) ) ( not ( = ?auto_769329 ?auto_769334 ) ) ( not ( = ?auto_769329 ?auto_769335 ) ) ( not ( = ?auto_769329 ?auto_769336 ) ) ( not ( = ?auto_769329 ?auto_769337 ) ) ( not ( = ?auto_769329 ?auto_769338 ) ) ( not ( = ?auto_769329 ?auto_769339 ) ) ( not ( = ?auto_769330 ?auto_769331 ) ) ( not ( = ?auto_769330 ?auto_769332 ) ) ( not ( = ?auto_769330 ?auto_769333 ) ) ( not ( = ?auto_769330 ?auto_769334 ) ) ( not ( = ?auto_769330 ?auto_769335 ) ) ( not ( = ?auto_769330 ?auto_769336 ) ) ( not ( = ?auto_769330 ?auto_769337 ) ) ( not ( = ?auto_769330 ?auto_769338 ) ) ( not ( = ?auto_769330 ?auto_769339 ) ) ( not ( = ?auto_769331 ?auto_769332 ) ) ( not ( = ?auto_769331 ?auto_769333 ) ) ( not ( = ?auto_769331 ?auto_769334 ) ) ( not ( = ?auto_769331 ?auto_769335 ) ) ( not ( = ?auto_769331 ?auto_769336 ) ) ( not ( = ?auto_769331 ?auto_769337 ) ) ( not ( = ?auto_769331 ?auto_769338 ) ) ( not ( = ?auto_769331 ?auto_769339 ) ) ( not ( = ?auto_769332 ?auto_769333 ) ) ( not ( = ?auto_769332 ?auto_769334 ) ) ( not ( = ?auto_769332 ?auto_769335 ) ) ( not ( = ?auto_769332 ?auto_769336 ) ) ( not ( = ?auto_769332 ?auto_769337 ) ) ( not ( = ?auto_769332 ?auto_769338 ) ) ( not ( = ?auto_769332 ?auto_769339 ) ) ( not ( = ?auto_769333 ?auto_769334 ) ) ( not ( = ?auto_769333 ?auto_769335 ) ) ( not ( = ?auto_769333 ?auto_769336 ) ) ( not ( = ?auto_769333 ?auto_769337 ) ) ( not ( = ?auto_769333 ?auto_769338 ) ) ( not ( = ?auto_769333 ?auto_769339 ) ) ( not ( = ?auto_769334 ?auto_769335 ) ) ( not ( = ?auto_769334 ?auto_769336 ) ) ( not ( = ?auto_769334 ?auto_769337 ) ) ( not ( = ?auto_769334 ?auto_769338 ) ) ( not ( = ?auto_769334 ?auto_769339 ) ) ( not ( = ?auto_769335 ?auto_769336 ) ) ( not ( = ?auto_769335 ?auto_769337 ) ) ( not ( = ?auto_769335 ?auto_769338 ) ) ( not ( = ?auto_769335 ?auto_769339 ) ) ( not ( = ?auto_769336 ?auto_769337 ) ) ( not ( = ?auto_769336 ?auto_769338 ) ) ( not ( = ?auto_769336 ?auto_769339 ) ) ( not ( = ?auto_769337 ?auto_769338 ) ) ( not ( = ?auto_769337 ?auto_769339 ) ) ( not ( = ?auto_769338 ?auto_769339 ) ) ( ON ?auto_769337 ?auto_769338 ) ( ON ?auto_769336 ?auto_769337 ) ( ON ?auto_769335 ?auto_769336 ) ( ON ?auto_769334 ?auto_769335 ) ( ON ?auto_769333 ?auto_769334 ) ( ON ?auto_769332 ?auto_769333 ) ( ON ?auto_769331 ?auto_769332 ) ( ON ?auto_769330 ?auto_769331 ) ( CLEAR ?auto_769328 ) ( ON ?auto_769329 ?auto_769330 ) ( CLEAR ?auto_769329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_769326 ?auto_769327 ?auto_769328 ?auto_769329 )
      ( MAKE-13PILE ?auto_769326 ?auto_769327 ?auto_769328 ?auto_769329 ?auto_769330 ?auto_769331 ?auto_769332 ?auto_769333 ?auto_769334 ?auto_769335 ?auto_769336 ?auto_769337 ?auto_769338 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_769380 - BLOCK
      ?auto_769381 - BLOCK
      ?auto_769382 - BLOCK
      ?auto_769383 - BLOCK
      ?auto_769384 - BLOCK
      ?auto_769385 - BLOCK
      ?auto_769386 - BLOCK
      ?auto_769387 - BLOCK
      ?auto_769388 - BLOCK
      ?auto_769389 - BLOCK
      ?auto_769390 - BLOCK
      ?auto_769391 - BLOCK
      ?auto_769392 - BLOCK
    )
    :vars
    (
      ?auto_769393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769392 ?auto_769393 ) ( ON-TABLE ?auto_769380 ) ( ON ?auto_769381 ?auto_769380 ) ( not ( = ?auto_769380 ?auto_769381 ) ) ( not ( = ?auto_769380 ?auto_769382 ) ) ( not ( = ?auto_769380 ?auto_769383 ) ) ( not ( = ?auto_769380 ?auto_769384 ) ) ( not ( = ?auto_769380 ?auto_769385 ) ) ( not ( = ?auto_769380 ?auto_769386 ) ) ( not ( = ?auto_769380 ?auto_769387 ) ) ( not ( = ?auto_769380 ?auto_769388 ) ) ( not ( = ?auto_769380 ?auto_769389 ) ) ( not ( = ?auto_769380 ?auto_769390 ) ) ( not ( = ?auto_769380 ?auto_769391 ) ) ( not ( = ?auto_769380 ?auto_769392 ) ) ( not ( = ?auto_769380 ?auto_769393 ) ) ( not ( = ?auto_769381 ?auto_769382 ) ) ( not ( = ?auto_769381 ?auto_769383 ) ) ( not ( = ?auto_769381 ?auto_769384 ) ) ( not ( = ?auto_769381 ?auto_769385 ) ) ( not ( = ?auto_769381 ?auto_769386 ) ) ( not ( = ?auto_769381 ?auto_769387 ) ) ( not ( = ?auto_769381 ?auto_769388 ) ) ( not ( = ?auto_769381 ?auto_769389 ) ) ( not ( = ?auto_769381 ?auto_769390 ) ) ( not ( = ?auto_769381 ?auto_769391 ) ) ( not ( = ?auto_769381 ?auto_769392 ) ) ( not ( = ?auto_769381 ?auto_769393 ) ) ( not ( = ?auto_769382 ?auto_769383 ) ) ( not ( = ?auto_769382 ?auto_769384 ) ) ( not ( = ?auto_769382 ?auto_769385 ) ) ( not ( = ?auto_769382 ?auto_769386 ) ) ( not ( = ?auto_769382 ?auto_769387 ) ) ( not ( = ?auto_769382 ?auto_769388 ) ) ( not ( = ?auto_769382 ?auto_769389 ) ) ( not ( = ?auto_769382 ?auto_769390 ) ) ( not ( = ?auto_769382 ?auto_769391 ) ) ( not ( = ?auto_769382 ?auto_769392 ) ) ( not ( = ?auto_769382 ?auto_769393 ) ) ( not ( = ?auto_769383 ?auto_769384 ) ) ( not ( = ?auto_769383 ?auto_769385 ) ) ( not ( = ?auto_769383 ?auto_769386 ) ) ( not ( = ?auto_769383 ?auto_769387 ) ) ( not ( = ?auto_769383 ?auto_769388 ) ) ( not ( = ?auto_769383 ?auto_769389 ) ) ( not ( = ?auto_769383 ?auto_769390 ) ) ( not ( = ?auto_769383 ?auto_769391 ) ) ( not ( = ?auto_769383 ?auto_769392 ) ) ( not ( = ?auto_769383 ?auto_769393 ) ) ( not ( = ?auto_769384 ?auto_769385 ) ) ( not ( = ?auto_769384 ?auto_769386 ) ) ( not ( = ?auto_769384 ?auto_769387 ) ) ( not ( = ?auto_769384 ?auto_769388 ) ) ( not ( = ?auto_769384 ?auto_769389 ) ) ( not ( = ?auto_769384 ?auto_769390 ) ) ( not ( = ?auto_769384 ?auto_769391 ) ) ( not ( = ?auto_769384 ?auto_769392 ) ) ( not ( = ?auto_769384 ?auto_769393 ) ) ( not ( = ?auto_769385 ?auto_769386 ) ) ( not ( = ?auto_769385 ?auto_769387 ) ) ( not ( = ?auto_769385 ?auto_769388 ) ) ( not ( = ?auto_769385 ?auto_769389 ) ) ( not ( = ?auto_769385 ?auto_769390 ) ) ( not ( = ?auto_769385 ?auto_769391 ) ) ( not ( = ?auto_769385 ?auto_769392 ) ) ( not ( = ?auto_769385 ?auto_769393 ) ) ( not ( = ?auto_769386 ?auto_769387 ) ) ( not ( = ?auto_769386 ?auto_769388 ) ) ( not ( = ?auto_769386 ?auto_769389 ) ) ( not ( = ?auto_769386 ?auto_769390 ) ) ( not ( = ?auto_769386 ?auto_769391 ) ) ( not ( = ?auto_769386 ?auto_769392 ) ) ( not ( = ?auto_769386 ?auto_769393 ) ) ( not ( = ?auto_769387 ?auto_769388 ) ) ( not ( = ?auto_769387 ?auto_769389 ) ) ( not ( = ?auto_769387 ?auto_769390 ) ) ( not ( = ?auto_769387 ?auto_769391 ) ) ( not ( = ?auto_769387 ?auto_769392 ) ) ( not ( = ?auto_769387 ?auto_769393 ) ) ( not ( = ?auto_769388 ?auto_769389 ) ) ( not ( = ?auto_769388 ?auto_769390 ) ) ( not ( = ?auto_769388 ?auto_769391 ) ) ( not ( = ?auto_769388 ?auto_769392 ) ) ( not ( = ?auto_769388 ?auto_769393 ) ) ( not ( = ?auto_769389 ?auto_769390 ) ) ( not ( = ?auto_769389 ?auto_769391 ) ) ( not ( = ?auto_769389 ?auto_769392 ) ) ( not ( = ?auto_769389 ?auto_769393 ) ) ( not ( = ?auto_769390 ?auto_769391 ) ) ( not ( = ?auto_769390 ?auto_769392 ) ) ( not ( = ?auto_769390 ?auto_769393 ) ) ( not ( = ?auto_769391 ?auto_769392 ) ) ( not ( = ?auto_769391 ?auto_769393 ) ) ( not ( = ?auto_769392 ?auto_769393 ) ) ( ON ?auto_769391 ?auto_769392 ) ( ON ?auto_769390 ?auto_769391 ) ( ON ?auto_769389 ?auto_769390 ) ( ON ?auto_769388 ?auto_769389 ) ( ON ?auto_769387 ?auto_769388 ) ( ON ?auto_769386 ?auto_769387 ) ( ON ?auto_769385 ?auto_769386 ) ( ON ?auto_769384 ?auto_769385 ) ( ON ?auto_769383 ?auto_769384 ) ( CLEAR ?auto_769381 ) ( ON ?auto_769382 ?auto_769383 ) ( CLEAR ?auto_769382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_769380 ?auto_769381 ?auto_769382 )
      ( MAKE-13PILE ?auto_769380 ?auto_769381 ?auto_769382 ?auto_769383 ?auto_769384 ?auto_769385 ?auto_769386 ?auto_769387 ?auto_769388 ?auto_769389 ?auto_769390 ?auto_769391 ?auto_769392 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_769434 - BLOCK
      ?auto_769435 - BLOCK
      ?auto_769436 - BLOCK
      ?auto_769437 - BLOCK
      ?auto_769438 - BLOCK
      ?auto_769439 - BLOCK
      ?auto_769440 - BLOCK
      ?auto_769441 - BLOCK
      ?auto_769442 - BLOCK
      ?auto_769443 - BLOCK
      ?auto_769444 - BLOCK
      ?auto_769445 - BLOCK
      ?auto_769446 - BLOCK
    )
    :vars
    (
      ?auto_769447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769446 ?auto_769447 ) ( ON-TABLE ?auto_769434 ) ( not ( = ?auto_769434 ?auto_769435 ) ) ( not ( = ?auto_769434 ?auto_769436 ) ) ( not ( = ?auto_769434 ?auto_769437 ) ) ( not ( = ?auto_769434 ?auto_769438 ) ) ( not ( = ?auto_769434 ?auto_769439 ) ) ( not ( = ?auto_769434 ?auto_769440 ) ) ( not ( = ?auto_769434 ?auto_769441 ) ) ( not ( = ?auto_769434 ?auto_769442 ) ) ( not ( = ?auto_769434 ?auto_769443 ) ) ( not ( = ?auto_769434 ?auto_769444 ) ) ( not ( = ?auto_769434 ?auto_769445 ) ) ( not ( = ?auto_769434 ?auto_769446 ) ) ( not ( = ?auto_769434 ?auto_769447 ) ) ( not ( = ?auto_769435 ?auto_769436 ) ) ( not ( = ?auto_769435 ?auto_769437 ) ) ( not ( = ?auto_769435 ?auto_769438 ) ) ( not ( = ?auto_769435 ?auto_769439 ) ) ( not ( = ?auto_769435 ?auto_769440 ) ) ( not ( = ?auto_769435 ?auto_769441 ) ) ( not ( = ?auto_769435 ?auto_769442 ) ) ( not ( = ?auto_769435 ?auto_769443 ) ) ( not ( = ?auto_769435 ?auto_769444 ) ) ( not ( = ?auto_769435 ?auto_769445 ) ) ( not ( = ?auto_769435 ?auto_769446 ) ) ( not ( = ?auto_769435 ?auto_769447 ) ) ( not ( = ?auto_769436 ?auto_769437 ) ) ( not ( = ?auto_769436 ?auto_769438 ) ) ( not ( = ?auto_769436 ?auto_769439 ) ) ( not ( = ?auto_769436 ?auto_769440 ) ) ( not ( = ?auto_769436 ?auto_769441 ) ) ( not ( = ?auto_769436 ?auto_769442 ) ) ( not ( = ?auto_769436 ?auto_769443 ) ) ( not ( = ?auto_769436 ?auto_769444 ) ) ( not ( = ?auto_769436 ?auto_769445 ) ) ( not ( = ?auto_769436 ?auto_769446 ) ) ( not ( = ?auto_769436 ?auto_769447 ) ) ( not ( = ?auto_769437 ?auto_769438 ) ) ( not ( = ?auto_769437 ?auto_769439 ) ) ( not ( = ?auto_769437 ?auto_769440 ) ) ( not ( = ?auto_769437 ?auto_769441 ) ) ( not ( = ?auto_769437 ?auto_769442 ) ) ( not ( = ?auto_769437 ?auto_769443 ) ) ( not ( = ?auto_769437 ?auto_769444 ) ) ( not ( = ?auto_769437 ?auto_769445 ) ) ( not ( = ?auto_769437 ?auto_769446 ) ) ( not ( = ?auto_769437 ?auto_769447 ) ) ( not ( = ?auto_769438 ?auto_769439 ) ) ( not ( = ?auto_769438 ?auto_769440 ) ) ( not ( = ?auto_769438 ?auto_769441 ) ) ( not ( = ?auto_769438 ?auto_769442 ) ) ( not ( = ?auto_769438 ?auto_769443 ) ) ( not ( = ?auto_769438 ?auto_769444 ) ) ( not ( = ?auto_769438 ?auto_769445 ) ) ( not ( = ?auto_769438 ?auto_769446 ) ) ( not ( = ?auto_769438 ?auto_769447 ) ) ( not ( = ?auto_769439 ?auto_769440 ) ) ( not ( = ?auto_769439 ?auto_769441 ) ) ( not ( = ?auto_769439 ?auto_769442 ) ) ( not ( = ?auto_769439 ?auto_769443 ) ) ( not ( = ?auto_769439 ?auto_769444 ) ) ( not ( = ?auto_769439 ?auto_769445 ) ) ( not ( = ?auto_769439 ?auto_769446 ) ) ( not ( = ?auto_769439 ?auto_769447 ) ) ( not ( = ?auto_769440 ?auto_769441 ) ) ( not ( = ?auto_769440 ?auto_769442 ) ) ( not ( = ?auto_769440 ?auto_769443 ) ) ( not ( = ?auto_769440 ?auto_769444 ) ) ( not ( = ?auto_769440 ?auto_769445 ) ) ( not ( = ?auto_769440 ?auto_769446 ) ) ( not ( = ?auto_769440 ?auto_769447 ) ) ( not ( = ?auto_769441 ?auto_769442 ) ) ( not ( = ?auto_769441 ?auto_769443 ) ) ( not ( = ?auto_769441 ?auto_769444 ) ) ( not ( = ?auto_769441 ?auto_769445 ) ) ( not ( = ?auto_769441 ?auto_769446 ) ) ( not ( = ?auto_769441 ?auto_769447 ) ) ( not ( = ?auto_769442 ?auto_769443 ) ) ( not ( = ?auto_769442 ?auto_769444 ) ) ( not ( = ?auto_769442 ?auto_769445 ) ) ( not ( = ?auto_769442 ?auto_769446 ) ) ( not ( = ?auto_769442 ?auto_769447 ) ) ( not ( = ?auto_769443 ?auto_769444 ) ) ( not ( = ?auto_769443 ?auto_769445 ) ) ( not ( = ?auto_769443 ?auto_769446 ) ) ( not ( = ?auto_769443 ?auto_769447 ) ) ( not ( = ?auto_769444 ?auto_769445 ) ) ( not ( = ?auto_769444 ?auto_769446 ) ) ( not ( = ?auto_769444 ?auto_769447 ) ) ( not ( = ?auto_769445 ?auto_769446 ) ) ( not ( = ?auto_769445 ?auto_769447 ) ) ( not ( = ?auto_769446 ?auto_769447 ) ) ( ON ?auto_769445 ?auto_769446 ) ( ON ?auto_769444 ?auto_769445 ) ( ON ?auto_769443 ?auto_769444 ) ( ON ?auto_769442 ?auto_769443 ) ( ON ?auto_769441 ?auto_769442 ) ( ON ?auto_769440 ?auto_769441 ) ( ON ?auto_769439 ?auto_769440 ) ( ON ?auto_769438 ?auto_769439 ) ( ON ?auto_769437 ?auto_769438 ) ( ON ?auto_769436 ?auto_769437 ) ( CLEAR ?auto_769434 ) ( ON ?auto_769435 ?auto_769436 ) ( CLEAR ?auto_769435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_769434 ?auto_769435 )
      ( MAKE-13PILE ?auto_769434 ?auto_769435 ?auto_769436 ?auto_769437 ?auto_769438 ?auto_769439 ?auto_769440 ?auto_769441 ?auto_769442 ?auto_769443 ?auto_769444 ?auto_769445 ?auto_769446 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_769488 - BLOCK
      ?auto_769489 - BLOCK
      ?auto_769490 - BLOCK
      ?auto_769491 - BLOCK
      ?auto_769492 - BLOCK
      ?auto_769493 - BLOCK
      ?auto_769494 - BLOCK
      ?auto_769495 - BLOCK
      ?auto_769496 - BLOCK
      ?auto_769497 - BLOCK
      ?auto_769498 - BLOCK
      ?auto_769499 - BLOCK
      ?auto_769500 - BLOCK
    )
    :vars
    (
      ?auto_769501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769500 ?auto_769501 ) ( not ( = ?auto_769488 ?auto_769489 ) ) ( not ( = ?auto_769488 ?auto_769490 ) ) ( not ( = ?auto_769488 ?auto_769491 ) ) ( not ( = ?auto_769488 ?auto_769492 ) ) ( not ( = ?auto_769488 ?auto_769493 ) ) ( not ( = ?auto_769488 ?auto_769494 ) ) ( not ( = ?auto_769488 ?auto_769495 ) ) ( not ( = ?auto_769488 ?auto_769496 ) ) ( not ( = ?auto_769488 ?auto_769497 ) ) ( not ( = ?auto_769488 ?auto_769498 ) ) ( not ( = ?auto_769488 ?auto_769499 ) ) ( not ( = ?auto_769488 ?auto_769500 ) ) ( not ( = ?auto_769488 ?auto_769501 ) ) ( not ( = ?auto_769489 ?auto_769490 ) ) ( not ( = ?auto_769489 ?auto_769491 ) ) ( not ( = ?auto_769489 ?auto_769492 ) ) ( not ( = ?auto_769489 ?auto_769493 ) ) ( not ( = ?auto_769489 ?auto_769494 ) ) ( not ( = ?auto_769489 ?auto_769495 ) ) ( not ( = ?auto_769489 ?auto_769496 ) ) ( not ( = ?auto_769489 ?auto_769497 ) ) ( not ( = ?auto_769489 ?auto_769498 ) ) ( not ( = ?auto_769489 ?auto_769499 ) ) ( not ( = ?auto_769489 ?auto_769500 ) ) ( not ( = ?auto_769489 ?auto_769501 ) ) ( not ( = ?auto_769490 ?auto_769491 ) ) ( not ( = ?auto_769490 ?auto_769492 ) ) ( not ( = ?auto_769490 ?auto_769493 ) ) ( not ( = ?auto_769490 ?auto_769494 ) ) ( not ( = ?auto_769490 ?auto_769495 ) ) ( not ( = ?auto_769490 ?auto_769496 ) ) ( not ( = ?auto_769490 ?auto_769497 ) ) ( not ( = ?auto_769490 ?auto_769498 ) ) ( not ( = ?auto_769490 ?auto_769499 ) ) ( not ( = ?auto_769490 ?auto_769500 ) ) ( not ( = ?auto_769490 ?auto_769501 ) ) ( not ( = ?auto_769491 ?auto_769492 ) ) ( not ( = ?auto_769491 ?auto_769493 ) ) ( not ( = ?auto_769491 ?auto_769494 ) ) ( not ( = ?auto_769491 ?auto_769495 ) ) ( not ( = ?auto_769491 ?auto_769496 ) ) ( not ( = ?auto_769491 ?auto_769497 ) ) ( not ( = ?auto_769491 ?auto_769498 ) ) ( not ( = ?auto_769491 ?auto_769499 ) ) ( not ( = ?auto_769491 ?auto_769500 ) ) ( not ( = ?auto_769491 ?auto_769501 ) ) ( not ( = ?auto_769492 ?auto_769493 ) ) ( not ( = ?auto_769492 ?auto_769494 ) ) ( not ( = ?auto_769492 ?auto_769495 ) ) ( not ( = ?auto_769492 ?auto_769496 ) ) ( not ( = ?auto_769492 ?auto_769497 ) ) ( not ( = ?auto_769492 ?auto_769498 ) ) ( not ( = ?auto_769492 ?auto_769499 ) ) ( not ( = ?auto_769492 ?auto_769500 ) ) ( not ( = ?auto_769492 ?auto_769501 ) ) ( not ( = ?auto_769493 ?auto_769494 ) ) ( not ( = ?auto_769493 ?auto_769495 ) ) ( not ( = ?auto_769493 ?auto_769496 ) ) ( not ( = ?auto_769493 ?auto_769497 ) ) ( not ( = ?auto_769493 ?auto_769498 ) ) ( not ( = ?auto_769493 ?auto_769499 ) ) ( not ( = ?auto_769493 ?auto_769500 ) ) ( not ( = ?auto_769493 ?auto_769501 ) ) ( not ( = ?auto_769494 ?auto_769495 ) ) ( not ( = ?auto_769494 ?auto_769496 ) ) ( not ( = ?auto_769494 ?auto_769497 ) ) ( not ( = ?auto_769494 ?auto_769498 ) ) ( not ( = ?auto_769494 ?auto_769499 ) ) ( not ( = ?auto_769494 ?auto_769500 ) ) ( not ( = ?auto_769494 ?auto_769501 ) ) ( not ( = ?auto_769495 ?auto_769496 ) ) ( not ( = ?auto_769495 ?auto_769497 ) ) ( not ( = ?auto_769495 ?auto_769498 ) ) ( not ( = ?auto_769495 ?auto_769499 ) ) ( not ( = ?auto_769495 ?auto_769500 ) ) ( not ( = ?auto_769495 ?auto_769501 ) ) ( not ( = ?auto_769496 ?auto_769497 ) ) ( not ( = ?auto_769496 ?auto_769498 ) ) ( not ( = ?auto_769496 ?auto_769499 ) ) ( not ( = ?auto_769496 ?auto_769500 ) ) ( not ( = ?auto_769496 ?auto_769501 ) ) ( not ( = ?auto_769497 ?auto_769498 ) ) ( not ( = ?auto_769497 ?auto_769499 ) ) ( not ( = ?auto_769497 ?auto_769500 ) ) ( not ( = ?auto_769497 ?auto_769501 ) ) ( not ( = ?auto_769498 ?auto_769499 ) ) ( not ( = ?auto_769498 ?auto_769500 ) ) ( not ( = ?auto_769498 ?auto_769501 ) ) ( not ( = ?auto_769499 ?auto_769500 ) ) ( not ( = ?auto_769499 ?auto_769501 ) ) ( not ( = ?auto_769500 ?auto_769501 ) ) ( ON ?auto_769499 ?auto_769500 ) ( ON ?auto_769498 ?auto_769499 ) ( ON ?auto_769497 ?auto_769498 ) ( ON ?auto_769496 ?auto_769497 ) ( ON ?auto_769495 ?auto_769496 ) ( ON ?auto_769494 ?auto_769495 ) ( ON ?auto_769493 ?auto_769494 ) ( ON ?auto_769492 ?auto_769493 ) ( ON ?auto_769491 ?auto_769492 ) ( ON ?auto_769490 ?auto_769491 ) ( ON ?auto_769489 ?auto_769490 ) ( ON ?auto_769488 ?auto_769489 ) ( CLEAR ?auto_769488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_769488 )
      ( MAKE-13PILE ?auto_769488 ?auto_769489 ?auto_769490 ?auto_769491 ?auto_769492 ?auto_769493 ?auto_769494 ?auto_769495 ?auto_769496 ?auto_769497 ?auto_769498 ?auto_769499 ?auto_769500 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_769543 - BLOCK
      ?auto_769544 - BLOCK
      ?auto_769545 - BLOCK
      ?auto_769546 - BLOCK
      ?auto_769547 - BLOCK
      ?auto_769548 - BLOCK
      ?auto_769549 - BLOCK
      ?auto_769550 - BLOCK
      ?auto_769551 - BLOCK
      ?auto_769552 - BLOCK
      ?auto_769553 - BLOCK
      ?auto_769554 - BLOCK
      ?auto_769555 - BLOCK
      ?auto_769556 - BLOCK
    )
    :vars
    (
      ?auto_769557 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_769555 ) ( ON ?auto_769556 ?auto_769557 ) ( CLEAR ?auto_769556 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_769543 ) ( ON ?auto_769544 ?auto_769543 ) ( ON ?auto_769545 ?auto_769544 ) ( ON ?auto_769546 ?auto_769545 ) ( ON ?auto_769547 ?auto_769546 ) ( ON ?auto_769548 ?auto_769547 ) ( ON ?auto_769549 ?auto_769548 ) ( ON ?auto_769550 ?auto_769549 ) ( ON ?auto_769551 ?auto_769550 ) ( ON ?auto_769552 ?auto_769551 ) ( ON ?auto_769553 ?auto_769552 ) ( ON ?auto_769554 ?auto_769553 ) ( ON ?auto_769555 ?auto_769554 ) ( not ( = ?auto_769543 ?auto_769544 ) ) ( not ( = ?auto_769543 ?auto_769545 ) ) ( not ( = ?auto_769543 ?auto_769546 ) ) ( not ( = ?auto_769543 ?auto_769547 ) ) ( not ( = ?auto_769543 ?auto_769548 ) ) ( not ( = ?auto_769543 ?auto_769549 ) ) ( not ( = ?auto_769543 ?auto_769550 ) ) ( not ( = ?auto_769543 ?auto_769551 ) ) ( not ( = ?auto_769543 ?auto_769552 ) ) ( not ( = ?auto_769543 ?auto_769553 ) ) ( not ( = ?auto_769543 ?auto_769554 ) ) ( not ( = ?auto_769543 ?auto_769555 ) ) ( not ( = ?auto_769543 ?auto_769556 ) ) ( not ( = ?auto_769543 ?auto_769557 ) ) ( not ( = ?auto_769544 ?auto_769545 ) ) ( not ( = ?auto_769544 ?auto_769546 ) ) ( not ( = ?auto_769544 ?auto_769547 ) ) ( not ( = ?auto_769544 ?auto_769548 ) ) ( not ( = ?auto_769544 ?auto_769549 ) ) ( not ( = ?auto_769544 ?auto_769550 ) ) ( not ( = ?auto_769544 ?auto_769551 ) ) ( not ( = ?auto_769544 ?auto_769552 ) ) ( not ( = ?auto_769544 ?auto_769553 ) ) ( not ( = ?auto_769544 ?auto_769554 ) ) ( not ( = ?auto_769544 ?auto_769555 ) ) ( not ( = ?auto_769544 ?auto_769556 ) ) ( not ( = ?auto_769544 ?auto_769557 ) ) ( not ( = ?auto_769545 ?auto_769546 ) ) ( not ( = ?auto_769545 ?auto_769547 ) ) ( not ( = ?auto_769545 ?auto_769548 ) ) ( not ( = ?auto_769545 ?auto_769549 ) ) ( not ( = ?auto_769545 ?auto_769550 ) ) ( not ( = ?auto_769545 ?auto_769551 ) ) ( not ( = ?auto_769545 ?auto_769552 ) ) ( not ( = ?auto_769545 ?auto_769553 ) ) ( not ( = ?auto_769545 ?auto_769554 ) ) ( not ( = ?auto_769545 ?auto_769555 ) ) ( not ( = ?auto_769545 ?auto_769556 ) ) ( not ( = ?auto_769545 ?auto_769557 ) ) ( not ( = ?auto_769546 ?auto_769547 ) ) ( not ( = ?auto_769546 ?auto_769548 ) ) ( not ( = ?auto_769546 ?auto_769549 ) ) ( not ( = ?auto_769546 ?auto_769550 ) ) ( not ( = ?auto_769546 ?auto_769551 ) ) ( not ( = ?auto_769546 ?auto_769552 ) ) ( not ( = ?auto_769546 ?auto_769553 ) ) ( not ( = ?auto_769546 ?auto_769554 ) ) ( not ( = ?auto_769546 ?auto_769555 ) ) ( not ( = ?auto_769546 ?auto_769556 ) ) ( not ( = ?auto_769546 ?auto_769557 ) ) ( not ( = ?auto_769547 ?auto_769548 ) ) ( not ( = ?auto_769547 ?auto_769549 ) ) ( not ( = ?auto_769547 ?auto_769550 ) ) ( not ( = ?auto_769547 ?auto_769551 ) ) ( not ( = ?auto_769547 ?auto_769552 ) ) ( not ( = ?auto_769547 ?auto_769553 ) ) ( not ( = ?auto_769547 ?auto_769554 ) ) ( not ( = ?auto_769547 ?auto_769555 ) ) ( not ( = ?auto_769547 ?auto_769556 ) ) ( not ( = ?auto_769547 ?auto_769557 ) ) ( not ( = ?auto_769548 ?auto_769549 ) ) ( not ( = ?auto_769548 ?auto_769550 ) ) ( not ( = ?auto_769548 ?auto_769551 ) ) ( not ( = ?auto_769548 ?auto_769552 ) ) ( not ( = ?auto_769548 ?auto_769553 ) ) ( not ( = ?auto_769548 ?auto_769554 ) ) ( not ( = ?auto_769548 ?auto_769555 ) ) ( not ( = ?auto_769548 ?auto_769556 ) ) ( not ( = ?auto_769548 ?auto_769557 ) ) ( not ( = ?auto_769549 ?auto_769550 ) ) ( not ( = ?auto_769549 ?auto_769551 ) ) ( not ( = ?auto_769549 ?auto_769552 ) ) ( not ( = ?auto_769549 ?auto_769553 ) ) ( not ( = ?auto_769549 ?auto_769554 ) ) ( not ( = ?auto_769549 ?auto_769555 ) ) ( not ( = ?auto_769549 ?auto_769556 ) ) ( not ( = ?auto_769549 ?auto_769557 ) ) ( not ( = ?auto_769550 ?auto_769551 ) ) ( not ( = ?auto_769550 ?auto_769552 ) ) ( not ( = ?auto_769550 ?auto_769553 ) ) ( not ( = ?auto_769550 ?auto_769554 ) ) ( not ( = ?auto_769550 ?auto_769555 ) ) ( not ( = ?auto_769550 ?auto_769556 ) ) ( not ( = ?auto_769550 ?auto_769557 ) ) ( not ( = ?auto_769551 ?auto_769552 ) ) ( not ( = ?auto_769551 ?auto_769553 ) ) ( not ( = ?auto_769551 ?auto_769554 ) ) ( not ( = ?auto_769551 ?auto_769555 ) ) ( not ( = ?auto_769551 ?auto_769556 ) ) ( not ( = ?auto_769551 ?auto_769557 ) ) ( not ( = ?auto_769552 ?auto_769553 ) ) ( not ( = ?auto_769552 ?auto_769554 ) ) ( not ( = ?auto_769552 ?auto_769555 ) ) ( not ( = ?auto_769552 ?auto_769556 ) ) ( not ( = ?auto_769552 ?auto_769557 ) ) ( not ( = ?auto_769553 ?auto_769554 ) ) ( not ( = ?auto_769553 ?auto_769555 ) ) ( not ( = ?auto_769553 ?auto_769556 ) ) ( not ( = ?auto_769553 ?auto_769557 ) ) ( not ( = ?auto_769554 ?auto_769555 ) ) ( not ( = ?auto_769554 ?auto_769556 ) ) ( not ( = ?auto_769554 ?auto_769557 ) ) ( not ( = ?auto_769555 ?auto_769556 ) ) ( not ( = ?auto_769555 ?auto_769557 ) ) ( not ( = ?auto_769556 ?auto_769557 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_769556 ?auto_769557 )
      ( !STACK ?auto_769556 ?auto_769555 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_769601 - BLOCK
      ?auto_769602 - BLOCK
      ?auto_769603 - BLOCK
      ?auto_769604 - BLOCK
      ?auto_769605 - BLOCK
      ?auto_769606 - BLOCK
      ?auto_769607 - BLOCK
      ?auto_769608 - BLOCK
      ?auto_769609 - BLOCK
      ?auto_769610 - BLOCK
      ?auto_769611 - BLOCK
      ?auto_769612 - BLOCK
      ?auto_769613 - BLOCK
      ?auto_769614 - BLOCK
    )
    :vars
    (
      ?auto_769615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769614 ?auto_769615 ) ( ON-TABLE ?auto_769601 ) ( ON ?auto_769602 ?auto_769601 ) ( ON ?auto_769603 ?auto_769602 ) ( ON ?auto_769604 ?auto_769603 ) ( ON ?auto_769605 ?auto_769604 ) ( ON ?auto_769606 ?auto_769605 ) ( ON ?auto_769607 ?auto_769606 ) ( ON ?auto_769608 ?auto_769607 ) ( ON ?auto_769609 ?auto_769608 ) ( ON ?auto_769610 ?auto_769609 ) ( ON ?auto_769611 ?auto_769610 ) ( ON ?auto_769612 ?auto_769611 ) ( not ( = ?auto_769601 ?auto_769602 ) ) ( not ( = ?auto_769601 ?auto_769603 ) ) ( not ( = ?auto_769601 ?auto_769604 ) ) ( not ( = ?auto_769601 ?auto_769605 ) ) ( not ( = ?auto_769601 ?auto_769606 ) ) ( not ( = ?auto_769601 ?auto_769607 ) ) ( not ( = ?auto_769601 ?auto_769608 ) ) ( not ( = ?auto_769601 ?auto_769609 ) ) ( not ( = ?auto_769601 ?auto_769610 ) ) ( not ( = ?auto_769601 ?auto_769611 ) ) ( not ( = ?auto_769601 ?auto_769612 ) ) ( not ( = ?auto_769601 ?auto_769613 ) ) ( not ( = ?auto_769601 ?auto_769614 ) ) ( not ( = ?auto_769601 ?auto_769615 ) ) ( not ( = ?auto_769602 ?auto_769603 ) ) ( not ( = ?auto_769602 ?auto_769604 ) ) ( not ( = ?auto_769602 ?auto_769605 ) ) ( not ( = ?auto_769602 ?auto_769606 ) ) ( not ( = ?auto_769602 ?auto_769607 ) ) ( not ( = ?auto_769602 ?auto_769608 ) ) ( not ( = ?auto_769602 ?auto_769609 ) ) ( not ( = ?auto_769602 ?auto_769610 ) ) ( not ( = ?auto_769602 ?auto_769611 ) ) ( not ( = ?auto_769602 ?auto_769612 ) ) ( not ( = ?auto_769602 ?auto_769613 ) ) ( not ( = ?auto_769602 ?auto_769614 ) ) ( not ( = ?auto_769602 ?auto_769615 ) ) ( not ( = ?auto_769603 ?auto_769604 ) ) ( not ( = ?auto_769603 ?auto_769605 ) ) ( not ( = ?auto_769603 ?auto_769606 ) ) ( not ( = ?auto_769603 ?auto_769607 ) ) ( not ( = ?auto_769603 ?auto_769608 ) ) ( not ( = ?auto_769603 ?auto_769609 ) ) ( not ( = ?auto_769603 ?auto_769610 ) ) ( not ( = ?auto_769603 ?auto_769611 ) ) ( not ( = ?auto_769603 ?auto_769612 ) ) ( not ( = ?auto_769603 ?auto_769613 ) ) ( not ( = ?auto_769603 ?auto_769614 ) ) ( not ( = ?auto_769603 ?auto_769615 ) ) ( not ( = ?auto_769604 ?auto_769605 ) ) ( not ( = ?auto_769604 ?auto_769606 ) ) ( not ( = ?auto_769604 ?auto_769607 ) ) ( not ( = ?auto_769604 ?auto_769608 ) ) ( not ( = ?auto_769604 ?auto_769609 ) ) ( not ( = ?auto_769604 ?auto_769610 ) ) ( not ( = ?auto_769604 ?auto_769611 ) ) ( not ( = ?auto_769604 ?auto_769612 ) ) ( not ( = ?auto_769604 ?auto_769613 ) ) ( not ( = ?auto_769604 ?auto_769614 ) ) ( not ( = ?auto_769604 ?auto_769615 ) ) ( not ( = ?auto_769605 ?auto_769606 ) ) ( not ( = ?auto_769605 ?auto_769607 ) ) ( not ( = ?auto_769605 ?auto_769608 ) ) ( not ( = ?auto_769605 ?auto_769609 ) ) ( not ( = ?auto_769605 ?auto_769610 ) ) ( not ( = ?auto_769605 ?auto_769611 ) ) ( not ( = ?auto_769605 ?auto_769612 ) ) ( not ( = ?auto_769605 ?auto_769613 ) ) ( not ( = ?auto_769605 ?auto_769614 ) ) ( not ( = ?auto_769605 ?auto_769615 ) ) ( not ( = ?auto_769606 ?auto_769607 ) ) ( not ( = ?auto_769606 ?auto_769608 ) ) ( not ( = ?auto_769606 ?auto_769609 ) ) ( not ( = ?auto_769606 ?auto_769610 ) ) ( not ( = ?auto_769606 ?auto_769611 ) ) ( not ( = ?auto_769606 ?auto_769612 ) ) ( not ( = ?auto_769606 ?auto_769613 ) ) ( not ( = ?auto_769606 ?auto_769614 ) ) ( not ( = ?auto_769606 ?auto_769615 ) ) ( not ( = ?auto_769607 ?auto_769608 ) ) ( not ( = ?auto_769607 ?auto_769609 ) ) ( not ( = ?auto_769607 ?auto_769610 ) ) ( not ( = ?auto_769607 ?auto_769611 ) ) ( not ( = ?auto_769607 ?auto_769612 ) ) ( not ( = ?auto_769607 ?auto_769613 ) ) ( not ( = ?auto_769607 ?auto_769614 ) ) ( not ( = ?auto_769607 ?auto_769615 ) ) ( not ( = ?auto_769608 ?auto_769609 ) ) ( not ( = ?auto_769608 ?auto_769610 ) ) ( not ( = ?auto_769608 ?auto_769611 ) ) ( not ( = ?auto_769608 ?auto_769612 ) ) ( not ( = ?auto_769608 ?auto_769613 ) ) ( not ( = ?auto_769608 ?auto_769614 ) ) ( not ( = ?auto_769608 ?auto_769615 ) ) ( not ( = ?auto_769609 ?auto_769610 ) ) ( not ( = ?auto_769609 ?auto_769611 ) ) ( not ( = ?auto_769609 ?auto_769612 ) ) ( not ( = ?auto_769609 ?auto_769613 ) ) ( not ( = ?auto_769609 ?auto_769614 ) ) ( not ( = ?auto_769609 ?auto_769615 ) ) ( not ( = ?auto_769610 ?auto_769611 ) ) ( not ( = ?auto_769610 ?auto_769612 ) ) ( not ( = ?auto_769610 ?auto_769613 ) ) ( not ( = ?auto_769610 ?auto_769614 ) ) ( not ( = ?auto_769610 ?auto_769615 ) ) ( not ( = ?auto_769611 ?auto_769612 ) ) ( not ( = ?auto_769611 ?auto_769613 ) ) ( not ( = ?auto_769611 ?auto_769614 ) ) ( not ( = ?auto_769611 ?auto_769615 ) ) ( not ( = ?auto_769612 ?auto_769613 ) ) ( not ( = ?auto_769612 ?auto_769614 ) ) ( not ( = ?auto_769612 ?auto_769615 ) ) ( not ( = ?auto_769613 ?auto_769614 ) ) ( not ( = ?auto_769613 ?auto_769615 ) ) ( not ( = ?auto_769614 ?auto_769615 ) ) ( CLEAR ?auto_769612 ) ( ON ?auto_769613 ?auto_769614 ) ( CLEAR ?auto_769613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_769601 ?auto_769602 ?auto_769603 ?auto_769604 ?auto_769605 ?auto_769606 ?auto_769607 ?auto_769608 ?auto_769609 ?auto_769610 ?auto_769611 ?auto_769612 ?auto_769613 )
      ( MAKE-14PILE ?auto_769601 ?auto_769602 ?auto_769603 ?auto_769604 ?auto_769605 ?auto_769606 ?auto_769607 ?auto_769608 ?auto_769609 ?auto_769610 ?auto_769611 ?auto_769612 ?auto_769613 ?auto_769614 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_769659 - BLOCK
      ?auto_769660 - BLOCK
      ?auto_769661 - BLOCK
      ?auto_769662 - BLOCK
      ?auto_769663 - BLOCK
      ?auto_769664 - BLOCK
      ?auto_769665 - BLOCK
      ?auto_769666 - BLOCK
      ?auto_769667 - BLOCK
      ?auto_769668 - BLOCK
      ?auto_769669 - BLOCK
      ?auto_769670 - BLOCK
      ?auto_769671 - BLOCK
      ?auto_769672 - BLOCK
    )
    :vars
    (
      ?auto_769673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769672 ?auto_769673 ) ( ON-TABLE ?auto_769659 ) ( ON ?auto_769660 ?auto_769659 ) ( ON ?auto_769661 ?auto_769660 ) ( ON ?auto_769662 ?auto_769661 ) ( ON ?auto_769663 ?auto_769662 ) ( ON ?auto_769664 ?auto_769663 ) ( ON ?auto_769665 ?auto_769664 ) ( ON ?auto_769666 ?auto_769665 ) ( ON ?auto_769667 ?auto_769666 ) ( ON ?auto_769668 ?auto_769667 ) ( ON ?auto_769669 ?auto_769668 ) ( not ( = ?auto_769659 ?auto_769660 ) ) ( not ( = ?auto_769659 ?auto_769661 ) ) ( not ( = ?auto_769659 ?auto_769662 ) ) ( not ( = ?auto_769659 ?auto_769663 ) ) ( not ( = ?auto_769659 ?auto_769664 ) ) ( not ( = ?auto_769659 ?auto_769665 ) ) ( not ( = ?auto_769659 ?auto_769666 ) ) ( not ( = ?auto_769659 ?auto_769667 ) ) ( not ( = ?auto_769659 ?auto_769668 ) ) ( not ( = ?auto_769659 ?auto_769669 ) ) ( not ( = ?auto_769659 ?auto_769670 ) ) ( not ( = ?auto_769659 ?auto_769671 ) ) ( not ( = ?auto_769659 ?auto_769672 ) ) ( not ( = ?auto_769659 ?auto_769673 ) ) ( not ( = ?auto_769660 ?auto_769661 ) ) ( not ( = ?auto_769660 ?auto_769662 ) ) ( not ( = ?auto_769660 ?auto_769663 ) ) ( not ( = ?auto_769660 ?auto_769664 ) ) ( not ( = ?auto_769660 ?auto_769665 ) ) ( not ( = ?auto_769660 ?auto_769666 ) ) ( not ( = ?auto_769660 ?auto_769667 ) ) ( not ( = ?auto_769660 ?auto_769668 ) ) ( not ( = ?auto_769660 ?auto_769669 ) ) ( not ( = ?auto_769660 ?auto_769670 ) ) ( not ( = ?auto_769660 ?auto_769671 ) ) ( not ( = ?auto_769660 ?auto_769672 ) ) ( not ( = ?auto_769660 ?auto_769673 ) ) ( not ( = ?auto_769661 ?auto_769662 ) ) ( not ( = ?auto_769661 ?auto_769663 ) ) ( not ( = ?auto_769661 ?auto_769664 ) ) ( not ( = ?auto_769661 ?auto_769665 ) ) ( not ( = ?auto_769661 ?auto_769666 ) ) ( not ( = ?auto_769661 ?auto_769667 ) ) ( not ( = ?auto_769661 ?auto_769668 ) ) ( not ( = ?auto_769661 ?auto_769669 ) ) ( not ( = ?auto_769661 ?auto_769670 ) ) ( not ( = ?auto_769661 ?auto_769671 ) ) ( not ( = ?auto_769661 ?auto_769672 ) ) ( not ( = ?auto_769661 ?auto_769673 ) ) ( not ( = ?auto_769662 ?auto_769663 ) ) ( not ( = ?auto_769662 ?auto_769664 ) ) ( not ( = ?auto_769662 ?auto_769665 ) ) ( not ( = ?auto_769662 ?auto_769666 ) ) ( not ( = ?auto_769662 ?auto_769667 ) ) ( not ( = ?auto_769662 ?auto_769668 ) ) ( not ( = ?auto_769662 ?auto_769669 ) ) ( not ( = ?auto_769662 ?auto_769670 ) ) ( not ( = ?auto_769662 ?auto_769671 ) ) ( not ( = ?auto_769662 ?auto_769672 ) ) ( not ( = ?auto_769662 ?auto_769673 ) ) ( not ( = ?auto_769663 ?auto_769664 ) ) ( not ( = ?auto_769663 ?auto_769665 ) ) ( not ( = ?auto_769663 ?auto_769666 ) ) ( not ( = ?auto_769663 ?auto_769667 ) ) ( not ( = ?auto_769663 ?auto_769668 ) ) ( not ( = ?auto_769663 ?auto_769669 ) ) ( not ( = ?auto_769663 ?auto_769670 ) ) ( not ( = ?auto_769663 ?auto_769671 ) ) ( not ( = ?auto_769663 ?auto_769672 ) ) ( not ( = ?auto_769663 ?auto_769673 ) ) ( not ( = ?auto_769664 ?auto_769665 ) ) ( not ( = ?auto_769664 ?auto_769666 ) ) ( not ( = ?auto_769664 ?auto_769667 ) ) ( not ( = ?auto_769664 ?auto_769668 ) ) ( not ( = ?auto_769664 ?auto_769669 ) ) ( not ( = ?auto_769664 ?auto_769670 ) ) ( not ( = ?auto_769664 ?auto_769671 ) ) ( not ( = ?auto_769664 ?auto_769672 ) ) ( not ( = ?auto_769664 ?auto_769673 ) ) ( not ( = ?auto_769665 ?auto_769666 ) ) ( not ( = ?auto_769665 ?auto_769667 ) ) ( not ( = ?auto_769665 ?auto_769668 ) ) ( not ( = ?auto_769665 ?auto_769669 ) ) ( not ( = ?auto_769665 ?auto_769670 ) ) ( not ( = ?auto_769665 ?auto_769671 ) ) ( not ( = ?auto_769665 ?auto_769672 ) ) ( not ( = ?auto_769665 ?auto_769673 ) ) ( not ( = ?auto_769666 ?auto_769667 ) ) ( not ( = ?auto_769666 ?auto_769668 ) ) ( not ( = ?auto_769666 ?auto_769669 ) ) ( not ( = ?auto_769666 ?auto_769670 ) ) ( not ( = ?auto_769666 ?auto_769671 ) ) ( not ( = ?auto_769666 ?auto_769672 ) ) ( not ( = ?auto_769666 ?auto_769673 ) ) ( not ( = ?auto_769667 ?auto_769668 ) ) ( not ( = ?auto_769667 ?auto_769669 ) ) ( not ( = ?auto_769667 ?auto_769670 ) ) ( not ( = ?auto_769667 ?auto_769671 ) ) ( not ( = ?auto_769667 ?auto_769672 ) ) ( not ( = ?auto_769667 ?auto_769673 ) ) ( not ( = ?auto_769668 ?auto_769669 ) ) ( not ( = ?auto_769668 ?auto_769670 ) ) ( not ( = ?auto_769668 ?auto_769671 ) ) ( not ( = ?auto_769668 ?auto_769672 ) ) ( not ( = ?auto_769668 ?auto_769673 ) ) ( not ( = ?auto_769669 ?auto_769670 ) ) ( not ( = ?auto_769669 ?auto_769671 ) ) ( not ( = ?auto_769669 ?auto_769672 ) ) ( not ( = ?auto_769669 ?auto_769673 ) ) ( not ( = ?auto_769670 ?auto_769671 ) ) ( not ( = ?auto_769670 ?auto_769672 ) ) ( not ( = ?auto_769670 ?auto_769673 ) ) ( not ( = ?auto_769671 ?auto_769672 ) ) ( not ( = ?auto_769671 ?auto_769673 ) ) ( not ( = ?auto_769672 ?auto_769673 ) ) ( ON ?auto_769671 ?auto_769672 ) ( CLEAR ?auto_769669 ) ( ON ?auto_769670 ?auto_769671 ) ( CLEAR ?auto_769670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_769659 ?auto_769660 ?auto_769661 ?auto_769662 ?auto_769663 ?auto_769664 ?auto_769665 ?auto_769666 ?auto_769667 ?auto_769668 ?auto_769669 ?auto_769670 )
      ( MAKE-14PILE ?auto_769659 ?auto_769660 ?auto_769661 ?auto_769662 ?auto_769663 ?auto_769664 ?auto_769665 ?auto_769666 ?auto_769667 ?auto_769668 ?auto_769669 ?auto_769670 ?auto_769671 ?auto_769672 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_769717 - BLOCK
      ?auto_769718 - BLOCK
      ?auto_769719 - BLOCK
      ?auto_769720 - BLOCK
      ?auto_769721 - BLOCK
      ?auto_769722 - BLOCK
      ?auto_769723 - BLOCK
      ?auto_769724 - BLOCK
      ?auto_769725 - BLOCK
      ?auto_769726 - BLOCK
      ?auto_769727 - BLOCK
      ?auto_769728 - BLOCK
      ?auto_769729 - BLOCK
      ?auto_769730 - BLOCK
    )
    :vars
    (
      ?auto_769731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769730 ?auto_769731 ) ( ON-TABLE ?auto_769717 ) ( ON ?auto_769718 ?auto_769717 ) ( ON ?auto_769719 ?auto_769718 ) ( ON ?auto_769720 ?auto_769719 ) ( ON ?auto_769721 ?auto_769720 ) ( ON ?auto_769722 ?auto_769721 ) ( ON ?auto_769723 ?auto_769722 ) ( ON ?auto_769724 ?auto_769723 ) ( ON ?auto_769725 ?auto_769724 ) ( ON ?auto_769726 ?auto_769725 ) ( not ( = ?auto_769717 ?auto_769718 ) ) ( not ( = ?auto_769717 ?auto_769719 ) ) ( not ( = ?auto_769717 ?auto_769720 ) ) ( not ( = ?auto_769717 ?auto_769721 ) ) ( not ( = ?auto_769717 ?auto_769722 ) ) ( not ( = ?auto_769717 ?auto_769723 ) ) ( not ( = ?auto_769717 ?auto_769724 ) ) ( not ( = ?auto_769717 ?auto_769725 ) ) ( not ( = ?auto_769717 ?auto_769726 ) ) ( not ( = ?auto_769717 ?auto_769727 ) ) ( not ( = ?auto_769717 ?auto_769728 ) ) ( not ( = ?auto_769717 ?auto_769729 ) ) ( not ( = ?auto_769717 ?auto_769730 ) ) ( not ( = ?auto_769717 ?auto_769731 ) ) ( not ( = ?auto_769718 ?auto_769719 ) ) ( not ( = ?auto_769718 ?auto_769720 ) ) ( not ( = ?auto_769718 ?auto_769721 ) ) ( not ( = ?auto_769718 ?auto_769722 ) ) ( not ( = ?auto_769718 ?auto_769723 ) ) ( not ( = ?auto_769718 ?auto_769724 ) ) ( not ( = ?auto_769718 ?auto_769725 ) ) ( not ( = ?auto_769718 ?auto_769726 ) ) ( not ( = ?auto_769718 ?auto_769727 ) ) ( not ( = ?auto_769718 ?auto_769728 ) ) ( not ( = ?auto_769718 ?auto_769729 ) ) ( not ( = ?auto_769718 ?auto_769730 ) ) ( not ( = ?auto_769718 ?auto_769731 ) ) ( not ( = ?auto_769719 ?auto_769720 ) ) ( not ( = ?auto_769719 ?auto_769721 ) ) ( not ( = ?auto_769719 ?auto_769722 ) ) ( not ( = ?auto_769719 ?auto_769723 ) ) ( not ( = ?auto_769719 ?auto_769724 ) ) ( not ( = ?auto_769719 ?auto_769725 ) ) ( not ( = ?auto_769719 ?auto_769726 ) ) ( not ( = ?auto_769719 ?auto_769727 ) ) ( not ( = ?auto_769719 ?auto_769728 ) ) ( not ( = ?auto_769719 ?auto_769729 ) ) ( not ( = ?auto_769719 ?auto_769730 ) ) ( not ( = ?auto_769719 ?auto_769731 ) ) ( not ( = ?auto_769720 ?auto_769721 ) ) ( not ( = ?auto_769720 ?auto_769722 ) ) ( not ( = ?auto_769720 ?auto_769723 ) ) ( not ( = ?auto_769720 ?auto_769724 ) ) ( not ( = ?auto_769720 ?auto_769725 ) ) ( not ( = ?auto_769720 ?auto_769726 ) ) ( not ( = ?auto_769720 ?auto_769727 ) ) ( not ( = ?auto_769720 ?auto_769728 ) ) ( not ( = ?auto_769720 ?auto_769729 ) ) ( not ( = ?auto_769720 ?auto_769730 ) ) ( not ( = ?auto_769720 ?auto_769731 ) ) ( not ( = ?auto_769721 ?auto_769722 ) ) ( not ( = ?auto_769721 ?auto_769723 ) ) ( not ( = ?auto_769721 ?auto_769724 ) ) ( not ( = ?auto_769721 ?auto_769725 ) ) ( not ( = ?auto_769721 ?auto_769726 ) ) ( not ( = ?auto_769721 ?auto_769727 ) ) ( not ( = ?auto_769721 ?auto_769728 ) ) ( not ( = ?auto_769721 ?auto_769729 ) ) ( not ( = ?auto_769721 ?auto_769730 ) ) ( not ( = ?auto_769721 ?auto_769731 ) ) ( not ( = ?auto_769722 ?auto_769723 ) ) ( not ( = ?auto_769722 ?auto_769724 ) ) ( not ( = ?auto_769722 ?auto_769725 ) ) ( not ( = ?auto_769722 ?auto_769726 ) ) ( not ( = ?auto_769722 ?auto_769727 ) ) ( not ( = ?auto_769722 ?auto_769728 ) ) ( not ( = ?auto_769722 ?auto_769729 ) ) ( not ( = ?auto_769722 ?auto_769730 ) ) ( not ( = ?auto_769722 ?auto_769731 ) ) ( not ( = ?auto_769723 ?auto_769724 ) ) ( not ( = ?auto_769723 ?auto_769725 ) ) ( not ( = ?auto_769723 ?auto_769726 ) ) ( not ( = ?auto_769723 ?auto_769727 ) ) ( not ( = ?auto_769723 ?auto_769728 ) ) ( not ( = ?auto_769723 ?auto_769729 ) ) ( not ( = ?auto_769723 ?auto_769730 ) ) ( not ( = ?auto_769723 ?auto_769731 ) ) ( not ( = ?auto_769724 ?auto_769725 ) ) ( not ( = ?auto_769724 ?auto_769726 ) ) ( not ( = ?auto_769724 ?auto_769727 ) ) ( not ( = ?auto_769724 ?auto_769728 ) ) ( not ( = ?auto_769724 ?auto_769729 ) ) ( not ( = ?auto_769724 ?auto_769730 ) ) ( not ( = ?auto_769724 ?auto_769731 ) ) ( not ( = ?auto_769725 ?auto_769726 ) ) ( not ( = ?auto_769725 ?auto_769727 ) ) ( not ( = ?auto_769725 ?auto_769728 ) ) ( not ( = ?auto_769725 ?auto_769729 ) ) ( not ( = ?auto_769725 ?auto_769730 ) ) ( not ( = ?auto_769725 ?auto_769731 ) ) ( not ( = ?auto_769726 ?auto_769727 ) ) ( not ( = ?auto_769726 ?auto_769728 ) ) ( not ( = ?auto_769726 ?auto_769729 ) ) ( not ( = ?auto_769726 ?auto_769730 ) ) ( not ( = ?auto_769726 ?auto_769731 ) ) ( not ( = ?auto_769727 ?auto_769728 ) ) ( not ( = ?auto_769727 ?auto_769729 ) ) ( not ( = ?auto_769727 ?auto_769730 ) ) ( not ( = ?auto_769727 ?auto_769731 ) ) ( not ( = ?auto_769728 ?auto_769729 ) ) ( not ( = ?auto_769728 ?auto_769730 ) ) ( not ( = ?auto_769728 ?auto_769731 ) ) ( not ( = ?auto_769729 ?auto_769730 ) ) ( not ( = ?auto_769729 ?auto_769731 ) ) ( not ( = ?auto_769730 ?auto_769731 ) ) ( ON ?auto_769729 ?auto_769730 ) ( ON ?auto_769728 ?auto_769729 ) ( CLEAR ?auto_769726 ) ( ON ?auto_769727 ?auto_769728 ) ( CLEAR ?auto_769727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_769717 ?auto_769718 ?auto_769719 ?auto_769720 ?auto_769721 ?auto_769722 ?auto_769723 ?auto_769724 ?auto_769725 ?auto_769726 ?auto_769727 )
      ( MAKE-14PILE ?auto_769717 ?auto_769718 ?auto_769719 ?auto_769720 ?auto_769721 ?auto_769722 ?auto_769723 ?auto_769724 ?auto_769725 ?auto_769726 ?auto_769727 ?auto_769728 ?auto_769729 ?auto_769730 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_769775 - BLOCK
      ?auto_769776 - BLOCK
      ?auto_769777 - BLOCK
      ?auto_769778 - BLOCK
      ?auto_769779 - BLOCK
      ?auto_769780 - BLOCK
      ?auto_769781 - BLOCK
      ?auto_769782 - BLOCK
      ?auto_769783 - BLOCK
      ?auto_769784 - BLOCK
      ?auto_769785 - BLOCK
      ?auto_769786 - BLOCK
      ?auto_769787 - BLOCK
      ?auto_769788 - BLOCK
    )
    :vars
    (
      ?auto_769789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769788 ?auto_769789 ) ( ON-TABLE ?auto_769775 ) ( ON ?auto_769776 ?auto_769775 ) ( ON ?auto_769777 ?auto_769776 ) ( ON ?auto_769778 ?auto_769777 ) ( ON ?auto_769779 ?auto_769778 ) ( ON ?auto_769780 ?auto_769779 ) ( ON ?auto_769781 ?auto_769780 ) ( ON ?auto_769782 ?auto_769781 ) ( ON ?auto_769783 ?auto_769782 ) ( not ( = ?auto_769775 ?auto_769776 ) ) ( not ( = ?auto_769775 ?auto_769777 ) ) ( not ( = ?auto_769775 ?auto_769778 ) ) ( not ( = ?auto_769775 ?auto_769779 ) ) ( not ( = ?auto_769775 ?auto_769780 ) ) ( not ( = ?auto_769775 ?auto_769781 ) ) ( not ( = ?auto_769775 ?auto_769782 ) ) ( not ( = ?auto_769775 ?auto_769783 ) ) ( not ( = ?auto_769775 ?auto_769784 ) ) ( not ( = ?auto_769775 ?auto_769785 ) ) ( not ( = ?auto_769775 ?auto_769786 ) ) ( not ( = ?auto_769775 ?auto_769787 ) ) ( not ( = ?auto_769775 ?auto_769788 ) ) ( not ( = ?auto_769775 ?auto_769789 ) ) ( not ( = ?auto_769776 ?auto_769777 ) ) ( not ( = ?auto_769776 ?auto_769778 ) ) ( not ( = ?auto_769776 ?auto_769779 ) ) ( not ( = ?auto_769776 ?auto_769780 ) ) ( not ( = ?auto_769776 ?auto_769781 ) ) ( not ( = ?auto_769776 ?auto_769782 ) ) ( not ( = ?auto_769776 ?auto_769783 ) ) ( not ( = ?auto_769776 ?auto_769784 ) ) ( not ( = ?auto_769776 ?auto_769785 ) ) ( not ( = ?auto_769776 ?auto_769786 ) ) ( not ( = ?auto_769776 ?auto_769787 ) ) ( not ( = ?auto_769776 ?auto_769788 ) ) ( not ( = ?auto_769776 ?auto_769789 ) ) ( not ( = ?auto_769777 ?auto_769778 ) ) ( not ( = ?auto_769777 ?auto_769779 ) ) ( not ( = ?auto_769777 ?auto_769780 ) ) ( not ( = ?auto_769777 ?auto_769781 ) ) ( not ( = ?auto_769777 ?auto_769782 ) ) ( not ( = ?auto_769777 ?auto_769783 ) ) ( not ( = ?auto_769777 ?auto_769784 ) ) ( not ( = ?auto_769777 ?auto_769785 ) ) ( not ( = ?auto_769777 ?auto_769786 ) ) ( not ( = ?auto_769777 ?auto_769787 ) ) ( not ( = ?auto_769777 ?auto_769788 ) ) ( not ( = ?auto_769777 ?auto_769789 ) ) ( not ( = ?auto_769778 ?auto_769779 ) ) ( not ( = ?auto_769778 ?auto_769780 ) ) ( not ( = ?auto_769778 ?auto_769781 ) ) ( not ( = ?auto_769778 ?auto_769782 ) ) ( not ( = ?auto_769778 ?auto_769783 ) ) ( not ( = ?auto_769778 ?auto_769784 ) ) ( not ( = ?auto_769778 ?auto_769785 ) ) ( not ( = ?auto_769778 ?auto_769786 ) ) ( not ( = ?auto_769778 ?auto_769787 ) ) ( not ( = ?auto_769778 ?auto_769788 ) ) ( not ( = ?auto_769778 ?auto_769789 ) ) ( not ( = ?auto_769779 ?auto_769780 ) ) ( not ( = ?auto_769779 ?auto_769781 ) ) ( not ( = ?auto_769779 ?auto_769782 ) ) ( not ( = ?auto_769779 ?auto_769783 ) ) ( not ( = ?auto_769779 ?auto_769784 ) ) ( not ( = ?auto_769779 ?auto_769785 ) ) ( not ( = ?auto_769779 ?auto_769786 ) ) ( not ( = ?auto_769779 ?auto_769787 ) ) ( not ( = ?auto_769779 ?auto_769788 ) ) ( not ( = ?auto_769779 ?auto_769789 ) ) ( not ( = ?auto_769780 ?auto_769781 ) ) ( not ( = ?auto_769780 ?auto_769782 ) ) ( not ( = ?auto_769780 ?auto_769783 ) ) ( not ( = ?auto_769780 ?auto_769784 ) ) ( not ( = ?auto_769780 ?auto_769785 ) ) ( not ( = ?auto_769780 ?auto_769786 ) ) ( not ( = ?auto_769780 ?auto_769787 ) ) ( not ( = ?auto_769780 ?auto_769788 ) ) ( not ( = ?auto_769780 ?auto_769789 ) ) ( not ( = ?auto_769781 ?auto_769782 ) ) ( not ( = ?auto_769781 ?auto_769783 ) ) ( not ( = ?auto_769781 ?auto_769784 ) ) ( not ( = ?auto_769781 ?auto_769785 ) ) ( not ( = ?auto_769781 ?auto_769786 ) ) ( not ( = ?auto_769781 ?auto_769787 ) ) ( not ( = ?auto_769781 ?auto_769788 ) ) ( not ( = ?auto_769781 ?auto_769789 ) ) ( not ( = ?auto_769782 ?auto_769783 ) ) ( not ( = ?auto_769782 ?auto_769784 ) ) ( not ( = ?auto_769782 ?auto_769785 ) ) ( not ( = ?auto_769782 ?auto_769786 ) ) ( not ( = ?auto_769782 ?auto_769787 ) ) ( not ( = ?auto_769782 ?auto_769788 ) ) ( not ( = ?auto_769782 ?auto_769789 ) ) ( not ( = ?auto_769783 ?auto_769784 ) ) ( not ( = ?auto_769783 ?auto_769785 ) ) ( not ( = ?auto_769783 ?auto_769786 ) ) ( not ( = ?auto_769783 ?auto_769787 ) ) ( not ( = ?auto_769783 ?auto_769788 ) ) ( not ( = ?auto_769783 ?auto_769789 ) ) ( not ( = ?auto_769784 ?auto_769785 ) ) ( not ( = ?auto_769784 ?auto_769786 ) ) ( not ( = ?auto_769784 ?auto_769787 ) ) ( not ( = ?auto_769784 ?auto_769788 ) ) ( not ( = ?auto_769784 ?auto_769789 ) ) ( not ( = ?auto_769785 ?auto_769786 ) ) ( not ( = ?auto_769785 ?auto_769787 ) ) ( not ( = ?auto_769785 ?auto_769788 ) ) ( not ( = ?auto_769785 ?auto_769789 ) ) ( not ( = ?auto_769786 ?auto_769787 ) ) ( not ( = ?auto_769786 ?auto_769788 ) ) ( not ( = ?auto_769786 ?auto_769789 ) ) ( not ( = ?auto_769787 ?auto_769788 ) ) ( not ( = ?auto_769787 ?auto_769789 ) ) ( not ( = ?auto_769788 ?auto_769789 ) ) ( ON ?auto_769787 ?auto_769788 ) ( ON ?auto_769786 ?auto_769787 ) ( ON ?auto_769785 ?auto_769786 ) ( CLEAR ?auto_769783 ) ( ON ?auto_769784 ?auto_769785 ) ( CLEAR ?auto_769784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_769775 ?auto_769776 ?auto_769777 ?auto_769778 ?auto_769779 ?auto_769780 ?auto_769781 ?auto_769782 ?auto_769783 ?auto_769784 )
      ( MAKE-14PILE ?auto_769775 ?auto_769776 ?auto_769777 ?auto_769778 ?auto_769779 ?auto_769780 ?auto_769781 ?auto_769782 ?auto_769783 ?auto_769784 ?auto_769785 ?auto_769786 ?auto_769787 ?auto_769788 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_769833 - BLOCK
      ?auto_769834 - BLOCK
      ?auto_769835 - BLOCK
      ?auto_769836 - BLOCK
      ?auto_769837 - BLOCK
      ?auto_769838 - BLOCK
      ?auto_769839 - BLOCK
      ?auto_769840 - BLOCK
      ?auto_769841 - BLOCK
      ?auto_769842 - BLOCK
      ?auto_769843 - BLOCK
      ?auto_769844 - BLOCK
      ?auto_769845 - BLOCK
      ?auto_769846 - BLOCK
    )
    :vars
    (
      ?auto_769847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769846 ?auto_769847 ) ( ON-TABLE ?auto_769833 ) ( ON ?auto_769834 ?auto_769833 ) ( ON ?auto_769835 ?auto_769834 ) ( ON ?auto_769836 ?auto_769835 ) ( ON ?auto_769837 ?auto_769836 ) ( ON ?auto_769838 ?auto_769837 ) ( ON ?auto_769839 ?auto_769838 ) ( ON ?auto_769840 ?auto_769839 ) ( not ( = ?auto_769833 ?auto_769834 ) ) ( not ( = ?auto_769833 ?auto_769835 ) ) ( not ( = ?auto_769833 ?auto_769836 ) ) ( not ( = ?auto_769833 ?auto_769837 ) ) ( not ( = ?auto_769833 ?auto_769838 ) ) ( not ( = ?auto_769833 ?auto_769839 ) ) ( not ( = ?auto_769833 ?auto_769840 ) ) ( not ( = ?auto_769833 ?auto_769841 ) ) ( not ( = ?auto_769833 ?auto_769842 ) ) ( not ( = ?auto_769833 ?auto_769843 ) ) ( not ( = ?auto_769833 ?auto_769844 ) ) ( not ( = ?auto_769833 ?auto_769845 ) ) ( not ( = ?auto_769833 ?auto_769846 ) ) ( not ( = ?auto_769833 ?auto_769847 ) ) ( not ( = ?auto_769834 ?auto_769835 ) ) ( not ( = ?auto_769834 ?auto_769836 ) ) ( not ( = ?auto_769834 ?auto_769837 ) ) ( not ( = ?auto_769834 ?auto_769838 ) ) ( not ( = ?auto_769834 ?auto_769839 ) ) ( not ( = ?auto_769834 ?auto_769840 ) ) ( not ( = ?auto_769834 ?auto_769841 ) ) ( not ( = ?auto_769834 ?auto_769842 ) ) ( not ( = ?auto_769834 ?auto_769843 ) ) ( not ( = ?auto_769834 ?auto_769844 ) ) ( not ( = ?auto_769834 ?auto_769845 ) ) ( not ( = ?auto_769834 ?auto_769846 ) ) ( not ( = ?auto_769834 ?auto_769847 ) ) ( not ( = ?auto_769835 ?auto_769836 ) ) ( not ( = ?auto_769835 ?auto_769837 ) ) ( not ( = ?auto_769835 ?auto_769838 ) ) ( not ( = ?auto_769835 ?auto_769839 ) ) ( not ( = ?auto_769835 ?auto_769840 ) ) ( not ( = ?auto_769835 ?auto_769841 ) ) ( not ( = ?auto_769835 ?auto_769842 ) ) ( not ( = ?auto_769835 ?auto_769843 ) ) ( not ( = ?auto_769835 ?auto_769844 ) ) ( not ( = ?auto_769835 ?auto_769845 ) ) ( not ( = ?auto_769835 ?auto_769846 ) ) ( not ( = ?auto_769835 ?auto_769847 ) ) ( not ( = ?auto_769836 ?auto_769837 ) ) ( not ( = ?auto_769836 ?auto_769838 ) ) ( not ( = ?auto_769836 ?auto_769839 ) ) ( not ( = ?auto_769836 ?auto_769840 ) ) ( not ( = ?auto_769836 ?auto_769841 ) ) ( not ( = ?auto_769836 ?auto_769842 ) ) ( not ( = ?auto_769836 ?auto_769843 ) ) ( not ( = ?auto_769836 ?auto_769844 ) ) ( not ( = ?auto_769836 ?auto_769845 ) ) ( not ( = ?auto_769836 ?auto_769846 ) ) ( not ( = ?auto_769836 ?auto_769847 ) ) ( not ( = ?auto_769837 ?auto_769838 ) ) ( not ( = ?auto_769837 ?auto_769839 ) ) ( not ( = ?auto_769837 ?auto_769840 ) ) ( not ( = ?auto_769837 ?auto_769841 ) ) ( not ( = ?auto_769837 ?auto_769842 ) ) ( not ( = ?auto_769837 ?auto_769843 ) ) ( not ( = ?auto_769837 ?auto_769844 ) ) ( not ( = ?auto_769837 ?auto_769845 ) ) ( not ( = ?auto_769837 ?auto_769846 ) ) ( not ( = ?auto_769837 ?auto_769847 ) ) ( not ( = ?auto_769838 ?auto_769839 ) ) ( not ( = ?auto_769838 ?auto_769840 ) ) ( not ( = ?auto_769838 ?auto_769841 ) ) ( not ( = ?auto_769838 ?auto_769842 ) ) ( not ( = ?auto_769838 ?auto_769843 ) ) ( not ( = ?auto_769838 ?auto_769844 ) ) ( not ( = ?auto_769838 ?auto_769845 ) ) ( not ( = ?auto_769838 ?auto_769846 ) ) ( not ( = ?auto_769838 ?auto_769847 ) ) ( not ( = ?auto_769839 ?auto_769840 ) ) ( not ( = ?auto_769839 ?auto_769841 ) ) ( not ( = ?auto_769839 ?auto_769842 ) ) ( not ( = ?auto_769839 ?auto_769843 ) ) ( not ( = ?auto_769839 ?auto_769844 ) ) ( not ( = ?auto_769839 ?auto_769845 ) ) ( not ( = ?auto_769839 ?auto_769846 ) ) ( not ( = ?auto_769839 ?auto_769847 ) ) ( not ( = ?auto_769840 ?auto_769841 ) ) ( not ( = ?auto_769840 ?auto_769842 ) ) ( not ( = ?auto_769840 ?auto_769843 ) ) ( not ( = ?auto_769840 ?auto_769844 ) ) ( not ( = ?auto_769840 ?auto_769845 ) ) ( not ( = ?auto_769840 ?auto_769846 ) ) ( not ( = ?auto_769840 ?auto_769847 ) ) ( not ( = ?auto_769841 ?auto_769842 ) ) ( not ( = ?auto_769841 ?auto_769843 ) ) ( not ( = ?auto_769841 ?auto_769844 ) ) ( not ( = ?auto_769841 ?auto_769845 ) ) ( not ( = ?auto_769841 ?auto_769846 ) ) ( not ( = ?auto_769841 ?auto_769847 ) ) ( not ( = ?auto_769842 ?auto_769843 ) ) ( not ( = ?auto_769842 ?auto_769844 ) ) ( not ( = ?auto_769842 ?auto_769845 ) ) ( not ( = ?auto_769842 ?auto_769846 ) ) ( not ( = ?auto_769842 ?auto_769847 ) ) ( not ( = ?auto_769843 ?auto_769844 ) ) ( not ( = ?auto_769843 ?auto_769845 ) ) ( not ( = ?auto_769843 ?auto_769846 ) ) ( not ( = ?auto_769843 ?auto_769847 ) ) ( not ( = ?auto_769844 ?auto_769845 ) ) ( not ( = ?auto_769844 ?auto_769846 ) ) ( not ( = ?auto_769844 ?auto_769847 ) ) ( not ( = ?auto_769845 ?auto_769846 ) ) ( not ( = ?auto_769845 ?auto_769847 ) ) ( not ( = ?auto_769846 ?auto_769847 ) ) ( ON ?auto_769845 ?auto_769846 ) ( ON ?auto_769844 ?auto_769845 ) ( ON ?auto_769843 ?auto_769844 ) ( ON ?auto_769842 ?auto_769843 ) ( CLEAR ?auto_769840 ) ( ON ?auto_769841 ?auto_769842 ) ( CLEAR ?auto_769841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_769833 ?auto_769834 ?auto_769835 ?auto_769836 ?auto_769837 ?auto_769838 ?auto_769839 ?auto_769840 ?auto_769841 )
      ( MAKE-14PILE ?auto_769833 ?auto_769834 ?auto_769835 ?auto_769836 ?auto_769837 ?auto_769838 ?auto_769839 ?auto_769840 ?auto_769841 ?auto_769842 ?auto_769843 ?auto_769844 ?auto_769845 ?auto_769846 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_769891 - BLOCK
      ?auto_769892 - BLOCK
      ?auto_769893 - BLOCK
      ?auto_769894 - BLOCK
      ?auto_769895 - BLOCK
      ?auto_769896 - BLOCK
      ?auto_769897 - BLOCK
      ?auto_769898 - BLOCK
      ?auto_769899 - BLOCK
      ?auto_769900 - BLOCK
      ?auto_769901 - BLOCK
      ?auto_769902 - BLOCK
      ?auto_769903 - BLOCK
      ?auto_769904 - BLOCK
    )
    :vars
    (
      ?auto_769905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769904 ?auto_769905 ) ( ON-TABLE ?auto_769891 ) ( ON ?auto_769892 ?auto_769891 ) ( ON ?auto_769893 ?auto_769892 ) ( ON ?auto_769894 ?auto_769893 ) ( ON ?auto_769895 ?auto_769894 ) ( ON ?auto_769896 ?auto_769895 ) ( ON ?auto_769897 ?auto_769896 ) ( not ( = ?auto_769891 ?auto_769892 ) ) ( not ( = ?auto_769891 ?auto_769893 ) ) ( not ( = ?auto_769891 ?auto_769894 ) ) ( not ( = ?auto_769891 ?auto_769895 ) ) ( not ( = ?auto_769891 ?auto_769896 ) ) ( not ( = ?auto_769891 ?auto_769897 ) ) ( not ( = ?auto_769891 ?auto_769898 ) ) ( not ( = ?auto_769891 ?auto_769899 ) ) ( not ( = ?auto_769891 ?auto_769900 ) ) ( not ( = ?auto_769891 ?auto_769901 ) ) ( not ( = ?auto_769891 ?auto_769902 ) ) ( not ( = ?auto_769891 ?auto_769903 ) ) ( not ( = ?auto_769891 ?auto_769904 ) ) ( not ( = ?auto_769891 ?auto_769905 ) ) ( not ( = ?auto_769892 ?auto_769893 ) ) ( not ( = ?auto_769892 ?auto_769894 ) ) ( not ( = ?auto_769892 ?auto_769895 ) ) ( not ( = ?auto_769892 ?auto_769896 ) ) ( not ( = ?auto_769892 ?auto_769897 ) ) ( not ( = ?auto_769892 ?auto_769898 ) ) ( not ( = ?auto_769892 ?auto_769899 ) ) ( not ( = ?auto_769892 ?auto_769900 ) ) ( not ( = ?auto_769892 ?auto_769901 ) ) ( not ( = ?auto_769892 ?auto_769902 ) ) ( not ( = ?auto_769892 ?auto_769903 ) ) ( not ( = ?auto_769892 ?auto_769904 ) ) ( not ( = ?auto_769892 ?auto_769905 ) ) ( not ( = ?auto_769893 ?auto_769894 ) ) ( not ( = ?auto_769893 ?auto_769895 ) ) ( not ( = ?auto_769893 ?auto_769896 ) ) ( not ( = ?auto_769893 ?auto_769897 ) ) ( not ( = ?auto_769893 ?auto_769898 ) ) ( not ( = ?auto_769893 ?auto_769899 ) ) ( not ( = ?auto_769893 ?auto_769900 ) ) ( not ( = ?auto_769893 ?auto_769901 ) ) ( not ( = ?auto_769893 ?auto_769902 ) ) ( not ( = ?auto_769893 ?auto_769903 ) ) ( not ( = ?auto_769893 ?auto_769904 ) ) ( not ( = ?auto_769893 ?auto_769905 ) ) ( not ( = ?auto_769894 ?auto_769895 ) ) ( not ( = ?auto_769894 ?auto_769896 ) ) ( not ( = ?auto_769894 ?auto_769897 ) ) ( not ( = ?auto_769894 ?auto_769898 ) ) ( not ( = ?auto_769894 ?auto_769899 ) ) ( not ( = ?auto_769894 ?auto_769900 ) ) ( not ( = ?auto_769894 ?auto_769901 ) ) ( not ( = ?auto_769894 ?auto_769902 ) ) ( not ( = ?auto_769894 ?auto_769903 ) ) ( not ( = ?auto_769894 ?auto_769904 ) ) ( not ( = ?auto_769894 ?auto_769905 ) ) ( not ( = ?auto_769895 ?auto_769896 ) ) ( not ( = ?auto_769895 ?auto_769897 ) ) ( not ( = ?auto_769895 ?auto_769898 ) ) ( not ( = ?auto_769895 ?auto_769899 ) ) ( not ( = ?auto_769895 ?auto_769900 ) ) ( not ( = ?auto_769895 ?auto_769901 ) ) ( not ( = ?auto_769895 ?auto_769902 ) ) ( not ( = ?auto_769895 ?auto_769903 ) ) ( not ( = ?auto_769895 ?auto_769904 ) ) ( not ( = ?auto_769895 ?auto_769905 ) ) ( not ( = ?auto_769896 ?auto_769897 ) ) ( not ( = ?auto_769896 ?auto_769898 ) ) ( not ( = ?auto_769896 ?auto_769899 ) ) ( not ( = ?auto_769896 ?auto_769900 ) ) ( not ( = ?auto_769896 ?auto_769901 ) ) ( not ( = ?auto_769896 ?auto_769902 ) ) ( not ( = ?auto_769896 ?auto_769903 ) ) ( not ( = ?auto_769896 ?auto_769904 ) ) ( not ( = ?auto_769896 ?auto_769905 ) ) ( not ( = ?auto_769897 ?auto_769898 ) ) ( not ( = ?auto_769897 ?auto_769899 ) ) ( not ( = ?auto_769897 ?auto_769900 ) ) ( not ( = ?auto_769897 ?auto_769901 ) ) ( not ( = ?auto_769897 ?auto_769902 ) ) ( not ( = ?auto_769897 ?auto_769903 ) ) ( not ( = ?auto_769897 ?auto_769904 ) ) ( not ( = ?auto_769897 ?auto_769905 ) ) ( not ( = ?auto_769898 ?auto_769899 ) ) ( not ( = ?auto_769898 ?auto_769900 ) ) ( not ( = ?auto_769898 ?auto_769901 ) ) ( not ( = ?auto_769898 ?auto_769902 ) ) ( not ( = ?auto_769898 ?auto_769903 ) ) ( not ( = ?auto_769898 ?auto_769904 ) ) ( not ( = ?auto_769898 ?auto_769905 ) ) ( not ( = ?auto_769899 ?auto_769900 ) ) ( not ( = ?auto_769899 ?auto_769901 ) ) ( not ( = ?auto_769899 ?auto_769902 ) ) ( not ( = ?auto_769899 ?auto_769903 ) ) ( not ( = ?auto_769899 ?auto_769904 ) ) ( not ( = ?auto_769899 ?auto_769905 ) ) ( not ( = ?auto_769900 ?auto_769901 ) ) ( not ( = ?auto_769900 ?auto_769902 ) ) ( not ( = ?auto_769900 ?auto_769903 ) ) ( not ( = ?auto_769900 ?auto_769904 ) ) ( not ( = ?auto_769900 ?auto_769905 ) ) ( not ( = ?auto_769901 ?auto_769902 ) ) ( not ( = ?auto_769901 ?auto_769903 ) ) ( not ( = ?auto_769901 ?auto_769904 ) ) ( not ( = ?auto_769901 ?auto_769905 ) ) ( not ( = ?auto_769902 ?auto_769903 ) ) ( not ( = ?auto_769902 ?auto_769904 ) ) ( not ( = ?auto_769902 ?auto_769905 ) ) ( not ( = ?auto_769903 ?auto_769904 ) ) ( not ( = ?auto_769903 ?auto_769905 ) ) ( not ( = ?auto_769904 ?auto_769905 ) ) ( ON ?auto_769903 ?auto_769904 ) ( ON ?auto_769902 ?auto_769903 ) ( ON ?auto_769901 ?auto_769902 ) ( ON ?auto_769900 ?auto_769901 ) ( ON ?auto_769899 ?auto_769900 ) ( CLEAR ?auto_769897 ) ( ON ?auto_769898 ?auto_769899 ) ( CLEAR ?auto_769898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_769891 ?auto_769892 ?auto_769893 ?auto_769894 ?auto_769895 ?auto_769896 ?auto_769897 ?auto_769898 )
      ( MAKE-14PILE ?auto_769891 ?auto_769892 ?auto_769893 ?auto_769894 ?auto_769895 ?auto_769896 ?auto_769897 ?auto_769898 ?auto_769899 ?auto_769900 ?auto_769901 ?auto_769902 ?auto_769903 ?auto_769904 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_769949 - BLOCK
      ?auto_769950 - BLOCK
      ?auto_769951 - BLOCK
      ?auto_769952 - BLOCK
      ?auto_769953 - BLOCK
      ?auto_769954 - BLOCK
      ?auto_769955 - BLOCK
      ?auto_769956 - BLOCK
      ?auto_769957 - BLOCK
      ?auto_769958 - BLOCK
      ?auto_769959 - BLOCK
      ?auto_769960 - BLOCK
      ?auto_769961 - BLOCK
      ?auto_769962 - BLOCK
    )
    :vars
    (
      ?auto_769963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_769962 ?auto_769963 ) ( ON-TABLE ?auto_769949 ) ( ON ?auto_769950 ?auto_769949 ) ( ON ?auto_769951 ?auto_769950 ) ( ON ?auto_769952 ?auto_769951 ) ( ON ?auto_769953 ?auto_769952 ) ( ON ?auto_769954 ?auto_769953 ) ( not ( = ?auto_769949 ?auto_769950 ) ) ( not ( = ?auto_769949 ?auto_769951 ) ) ( not ( = ?auto_769949 ?auto_769952 ) ) ( not ( = ?auto_769949 ?auto_769953 ) ) ( not ( = ?auto_769949 ?auto_769954 ) ) ( not ( = ?auto_769949 ?auto_769955 ) ) ( not ( = ?auto_769949 ?auto_769956 ) ) ( not ( = ?auto_769949 ?auto_769957 ) ) ( not ( = ?auto_769949 ?auto_769958 ) ) ( not ( = ?auto_769949 ?auto_769959 ) ) ( not ( = ?auto_769949 ?auto_769960 ) ) ( not ( = ?auto_769949 ?auto_769961 ) ) ( not ( = ?auto_769949 ?auto_769962 ) ) ( not ( = ?auto_769949 ?auto_769963 ) ) ( not ( = ?auto_769950 ?auto_769951 ) ) ( not ( = ?auto_769950 ?auto_769952 ) ) ( not ( = ?auto_769950 ?auto_769953 ) ) ( not ( = ?auto_769950 ?auto_769954 ) ) ( not ( = ?auto_769950 ?auto_769955 ) ) ( not ( = ?auto_769950 ?auto_769956 ) ) ( not ( = ?auto_769950 ?auto_769957 ) ) ( not ( = ?auto_769950 ?auto_769958 ) ) ( not ( = ?auto_769950 ?auto_769959 ) ) ( not ( = ?auto_769950 ?auto_769960 ) ) ( not ( = ?auto_769950 ?auto_769961 ) ) ( not ( = ?auto_769950 ?auto_769962 ) ) ( not ( = ?auto_769950 ?auto_769963 ) ) ( not ( = ?auto_769951 ?auto_769952 ) ) ( not ( = ?auto_769951 ?auto_769953 ) ) ( not ( = ?auto_769951 ?auto_769954 ) ) ( not ( = ?auto_769951 ?auto_769955 ) ) ( not ( = ?auto_769951 ?auto_769956 ) ) ( not ( = ?auto_769951 ?auto_769957 ) ) ( not ( = ?auto_769951 ?auto_769958 ) ) ( not ( = ?auto_769951 ?auto_769959 ) ) ( not ( = ?auto_769951 ?auto_769960 ) ) ( not ( = ?auto_769951 ?auto_769961 ) ) ( not ( = ?auto_769951 ?auto_769962 ) ) ( not ( = ?auto_769951 ?auto_769963 ) ) ( not ( = ?auto_769952 ?auto_769953 ) ) ( not ( = ?auto_769952 ?auto_769954 ) ) ( not ( = ?auto_769952 ?auto_769955 ) ) ( not ( = ?auto_769952 ?auto_769956 ) ) ( not ( = ?auto_769952 ?auto_769957 ) ) ( not ( = ?auto_769952 ?auto_769958 ) ) ( not ( = ?auto_769952 ?auto_769959 ) ) ( not ( = ?auto_769952 ?auto_769960 ) ) ( not ( = ?auto_769952 ?auto_769961 ) ) ( not ( = ?auto_769952 ?auto_769962 ) ) ( not ( = ?auto_769952 ?auto_769963 ) ) ( not ( = ?auto_769953 ?auto_769954 ) ) ( not ( = ?auto_769953 ?auto_769955 ) ) ( not ( = ?auto_769953 ?auto_769956 ) ) ( not ( = ?auto_769953 ?auto_769957 ) ) ( not ( = ?auto_769953 ?auto_769958 ) ) ( not ( = ?auto_769953 ?auto_769959 ) ) ( not ( = ?auto_769953 ?auto_769960 ) ) ( not ( = ?auto_769953 ?auto_769961 ) ) ( not ( = ?auto_769953 ?auto_769962 ) ) ( not ( = ?auto_769953 ?auto_769963 ) ) ( not ( = ?auto_769954 ?auto_769955 ) ) ( not ( = ?auto_769954 ?auto_769956 ) ) ( not ( = ?auto_769954 ?auto_769957 ) ) ( not ( = ?auto_769954 ?auto_769958 ) ) ( not ( = ?auto_769954 ?auto_769959 ) ) ( not ( = ?auto_769954 ?auto_769960 ) ) ( not ( = ?auto_769954 ?auto_769961 ) ) ( not ( = ?auto_769954 ?auto_769962 ) ) ( not ( = ?auto_769954 ?auto_769963 ) ) ( not ( = ?auto_769955 ?auto_769956 ) ) ( not ( = ?auto_769955 ?auto_769957 ) ) ( not ( = ?auto_769955 ?auto_769958 ) ) ( not ( = ?auto_769955 ?auto_769959 ) ) ( not ( = ?auto_769955 ?auto_769960 ) ) ( not ( = ?auto_769955 ?auto_769961 ) ) ( not ( = ?auto_769955 ?auto_769962 ) ) ( not ( = ?auto_769955 ?auto_769963 ) ) ( not ( = ?auto_769956 ?auto_769957 ) ) ( not ( = ?auto_769956 ?auto_769958 ) ) ( not ( = ?auto_769956 ?auto_769959 ) ) ( not ( = ?auto_769956 ?auto_769960 ) ) ( not ( = ?auto_769956 ?auto_769961 ) ) ( not ( = ?auto_769956 ?auto_769962 ) ) ( not ( = ?auto_769956 ?auto_769963 ) ) ( not ( = ?auto_769957 ?auto_769958 ) ) ( not ( = ?auto_769957 ?auto_769959 ) ) ( not ( = ?auto_769957 ?auto_769960 ) ) ( not ( = ?auto_769957 ?auto_769961 ) ) ( not ( = ?auto_769957 ?auto_769962 ) ) ( not ( = ?auto_769957 ?auto_769963 ) ) ( not ( = ?auto_769958 ?auto_769959 ) ) ( not ( = ?auto_769958 ?auto_769960 ) ) ( not ( = ?auto_769958 ?auto_769961 ) ) ( not ( = ?auto_769958 ?auto_769962 ) ) ( not ( = ?auto_769958 ?auto_769963 ) ) ( not ( = ?auto_769959 ?auto_769960 ) ) ( not ( = ?auto_769959 ?auto_769961 ) ) ( not ( = ?auto_769959 ?auto_769962 ) ) ( not ( = ?auto_769959 ?auto_769963 ) ) ( not ( = ?auto_769960 ?auto_769961 ) ) ( not ( = ?auto_769960 ?auto_769962 ) ) ( not ( = ?auto_769960 ?auto_769963 ) ) ( not ( = ?auto_769961 ?auto_769962 ) ) ( not ( = ?auto_769961 ?auto_769963 ) ) ( not ( = ?auto_769962 ?auto_769963 ) ) ( ON ?auto_769961 ?auto_769962 ) ( ON ?auto_769960 ?auto_769961 ) ( ON ?auto_769959 ?auto_769960 ) ( ON ?auto_769958 ?auto_769959 ) ( ON ?auto_769957 ?auto_769958 ) ( ON ?auto_769956 ?auto_769957 ) ( CLEAR ?auto_769954 ) ( ON ?auto_769955 ?auto_769956 ) ( CLEAR ?auto_769955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_769949 ?auto_769950 ?auto_769951 ?auto_769952 ?auto_769953 ?auto_769954 ?auto_769955 )
      ( MAKE-14PILE ?auto_769949 ?auto_769950 ?auto_769951 ?auto_769952 ?auto_769953 ?auto_769954 ?auto_769955 ?auto_769956 ?auto_769957 ?auto_769958 ?auto_769959 ?auto_769960 ?auto_769961 ?auto_769962 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_770007 - BLOCK
      ?auto_770008 - BLOCK
      ?auto_770009 - BLOCK
      ?auto_770010 - BLOCK
      ?auto_770011 - BLOCK
      ?auto_770012 - BLOCK
      ?auto_770013 - BLOCK
      ?auto_770014 - BLOCK
      ?auto_770015 - BLOCK
      ?auto_770016 - BLOCK
      ?auto_770017 - BLOCK
      ?auto_770018 - BLOCK
      ?auto_770019 - BLOCK
      ?auto_770020 - BLOCK
    )
    :vars
    (
      ?auto_770021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770020 ?auto_770021 ) ( ON-TABLE ?auto_770007 ) ( ON ?auto_770008 ?auto_770007 ) ( ON ?auto_770009 ?auto_770008 ) ( ON ?auto_770010 ?auto_770009 ) ( ON ?auto_770011 ?auto_770010 ) ( not ( = ?auto_770007 ?auto_770008 ) ) ( not ( = ?auto_770007 ?auto_770009 ) ) ( not ( = ?auto_770007 ?auto_770010 ) ) ( not ( = ?auto_770007 ?auto_770011 ) ) ( not ( = ?auto_770007 ?auto_770012 ) ) ( not ( = ?auto_770007 ?auto_770013 ) ) ( not ( = ?auto_770007 ?auto_770014 ) ) ( not ( = ?auto_770007 ?auto_770015 ) ) ( not ( = ?auto_770007 ?auto_770016 ) ) ( not ( = ?auto_770007 ?auto_770017 ) ) ( not ( = ?auto_770007 ?auto_770018 ) ) ( not ( = ?auto_770007 ?auto_770019 ) ) ( not ( = ?auto_770007 ?auto_770020 ) ) ( not ( = ?auto_770007 ?auto_770021 ) ) ( not ( = ?auto_770008 ?auto_770009 ) ) ( not ( = ?auto_770008 ?auto_770010 ) ) ( not ( = ?auto_770008 ?auto_770011 ) ) ( not ( = ?auto_770008 ?auto_770012 ) ) ( not ( = ?auto_770008 ?auto_770013 ) ) ( not ( = ?auto_770008 ?auto_770014 ) ) ( not ( = ?auto_770008 ?auto_770015 ) ) ( not ( = ?auto_770008 ?auto_770016 ) ) ( not ( = ?auto_770008 ?auto_770017 ) ) ( not ( = ?auto_770008 ?auto_770018 ) ) ( not ( = ?auto_770008 ?auto_770019 ) ) ( not ( = ?auto_770008 ?auto_770020 ) ) ( not ( = ?auto_770008 ?auto_770021 ) ) ( not ( = ?auto_770009 ?auto_770010 ) ) ( not ( = ?auto_770009 ?auto_770011 ) ) ( not ( = ?auto_770009 ?auto_770012 ) ) ( not ( = ?auto_770009 ?auto_770013 ) ) ( not ( = ?auto_770009 ?auto_770014 ) ) ( not ( = ?auto_770009 ?auto_770015 ) ) ( not ( = ?auto_770009 ?auto_770016 ) ) ( not ( = ?auto_770009 ?auto_770017 ) ) ( not ( = ?auto_770009 ?auto_770018 ) ) ( not ( = ?auto_770009 ?auto_770019 ) ) ( not ( = ?auto_770009 ?auto_770020 ) ) ( not ( = ?auto_770009 ?auto_770021 ) ) ( not ( = ?auto_770010 ?auto_770011 ) ) ( not ( = ?auto_770010 ?auto_770012 ) ) ( not ( = ?auto_770010 ?auto_770013 ) ) ( not ( = ?auto_770010 ?auto_770014 ) ) ( not ( = ?auto_770010 ?auto_770015 ) ) ( not ( = ?auto_770010 ?auto_770016 ) ) ( not ( = ?auto_770010 ?auto_770017 ) ) ( not ( = ?auto_770010 ?auto_770018 ) ) ( not ( = ?auto_770010 ?auto_770019 ) ) ( not ( = ?auto_770010 ?auto_770020 ) ) ( not ( = ?auto_770010 ?auto_770021 ) ) ( not ( = ?auto_770011 ?auto_770012 ) ) ( not ( = ?auto_770011 ?auto_770013 ) ) ( not ( = ?auto_770011 ?auto_770014 ) ) ( not ( = ?auto_770011 ?auto_770015 ) ) ( not ( = ?auto_770011 ?auto_770016 ) ) ( not ( = ?auto_770011 ?auto_770017 ) ) ( not ( = ?auto_770011 ?auto_770018 ) ) ( not ( = ?auto_770011 ?auto_770019 ) ) ( not ( = ?auto_770011 ?auto_770020 ) ) ( not ( = ?auto_770011 ?auto_770021 ) ) ( not ( = ?auto_770012 ?auto_770013 ) ) ( not ( = ?auto_770012 ?auto_770014 ) ) ( not ( = ?auto_770012 ?auto_770015 ) ) ( not ( = ?auto_770012 ?auto_770016 ) ) ( not ( = ?auto_770012 ?auto_770017 ) ) ( not ( = ?auto_770012 ?auto_770018 ) ) ( not ( = ?auto_770012 ?auto_770019 ) ) ( not ( = ?auto_770012 ?auto_770020 ) ) ( not ( = ?auto_770012 ?auto_770021 ) ) ( not ( = ?auto_770013 ?auto_770014 ) ) ( not ( = ?auto_770013 ?auto_770015 ) ) ( not ( = ?auto_770013 ?auto_770016 ) ) ( not ( = ?auto_770013 ?auto_770017 ) ) ( not ( = ?auto_770013 ?auto_770018 ) ) ( not ( = ?auto_770013 ?auto_770019 ) ) ( not ( = ?auto_770013 ?auto_770020 ) ) ( not ( = ?auto_770013 ?auto_770021 ) ) ( not ( = ?auto_770014 ?auto_770015 ) ) ( not ( = ?auto_770014 ?auto_770016 ) ) ( not ( = ?auto_770014 ?auto_770017 ) ) ( not ( = ?auto_770014 ?auto_770018 ) ) ( not ( = ?auto_770014 ?auto_770019 ) ) ( not ( = ?auto_770014 ?auto_770020 ) ) ( not ( = ?auto_770014 ?auto_770021 ) ) ( not ( = ?auto_770015 ?auto_770016 ) ) ( not ( = ?auto_770015 ?auto_770017 ) ) ( not ( = ?auto_770015 ?auto_770018 ) ) ( not ( = ?auto_770015 ?auto_770019 ) ) ( not ( = ?auto_770015 ?auto_770020 ) ) ( not ( = ?auto_770015 ?auto_770021 ) ) ( not ( = ?auto_770016 ?auto_770017 ) ) ( not ( = ?auto_770016 ?auto_770018 ) ) ( not ( = ?auto_770016 ?auto_770019 ) ) ( not ( = ?auto_770016 ?auto_770020 ) ) ( not ( = ?auto_770016 ?auto_770021 ) ) ( not ( = ?auto_770017 ?auto_770018 ) ) ( not ( = ?auto_770017 ?auto_770019 ) ) ( not ( = ?auto_770017 ?auto_770020 ) ) ( not ( = ?auto_770017 ?auto_770021 ) ) ( not ( = ?auto_770018 ?auto_770019 ) ) ( not ( = ?auto_770018 ?auto_770020 ) ) ( not ( = ?auto_770018 ?auto_770021 ) ) ( not ( = ?auto_770019 ?auto_770020 ) ) ( not ( = ?auto_770019 ?auto_770021 ) ) ( not ( = ?auto_770020 ?auto_770021 ) ) ( ON ?auto_770019 ?auto_770020 ) ( ON ?auto_770018 ?auto_770019 ) ( ON ?auto_770017 ?auto_770018 ) ( ON ?auto_770016 ?auto_770017 ) ( ON ?auto_770015 ?auto_770016 ) ( ON ?auto_770014 ?auto_770015 ) ( ON ?auto_770013 ?auto_770014 ) ( CLEAR ?auto_770011 ) ( ON ?auto_770012 ?auto_770013 ) ( CLEAR ?auto_770012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_770007 ?auto_770008 ?auto_770009 ?auto_770010 ?auto_770011 ?auto_770012 )
      ( MAKE-14PILE ?auto_770007 ?auto_770008 ?auto_770009 ?auto_770010 ?auto_770011 ?auto_770012 ?auto_770013 ?auto_770014 ?auto_770015 ?auto_770016 ?auto_770017 ?auto_770018 ?auto_770019 ?auto_770020 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_770065 - BLOCK
      ?auto_770066 - BLOCK
      ?auto_770067 - BLOCK
      ?auto_770068 - BLOCK
      ?auto_770069 - BLOCK
      ?auto_770070 - BLOCK
      ?auto_770071 - BLOCK
      ?auto_770072 - BLOCK
      ?auto_770073 - BLOCK
      ?auto_770074 - BLOCK
      ?auto_770075 - BLOCK
      ?auto_770076 - BLOCK
      ?auto_770077 - BLOCK
      ?auto_770078 - BLOCK
    )
    :vars
    (
      ?auto_770079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770078 ?auto_770079 ) ( ON-TABLE ?auto_770065 ) ( ON ?auto_770066 ?auto_770065 ) ( ON ?auto_770067 ?auto_770066 ) ( ON ?auto_770068 ?auto_770067 ) ( not ( = ?auto_770065 ?auto_770066 ) ) ( not ( = ?auto_770065 ?auto_770067 ) ) ( not ( = ?auto_770065 ?auto_770068 ) ) ( not ( = ?auto_770065 ?auto_770069 ) ) ( not ( = ?auto_770065 ?auto_770070 ) ) ( not ( = ?auto_770065 ?auto_770071 ) ) ( not ( = ?auto_770065 ?auto_770072 ) ) ( not ( = ?auto_770065 ?auto_770073 ) ) ( not ( = ?auto_770065 ?auto_770074 ) ) ( not ( = ?auto_770065 ?auto_770075 ) ) ( not ( = ?auto_770065 ?auto_770076 ) ) ( not ( = ?auto_770065 ?auto_770077 ) ) ( not ( = ?auto_770065 ?auto_770078 ) ) ( not ( = ?auto_770065 ?auto_770079 ) ) ( not ( = ?auto_770066 ?auto_770067 ) ) ( not ( = ?auto_770066 ?auto_770068 ) ) ( not ( = ?auto_770066 ?auto_770069 ) ) ( not ( = ?auto_770066 ?auto_770070 ) ) ( not ( = ?auto_770066 ?auto_770071 ) ) ( not ( = ?auto_770066 ?auto_770072 ) ) ( not ( = ?auto_770066 ?auto_770073 ) ) ( not ( = ?auto_770066 ?auto_770074 ) ) ( not ( = ?auto_770066 ?auto_770075 ) ) ( not ( = ?auto_770066 ?auto_770076 ) ) ( not ( = ?auto_770066 ?auto_770077 ) ) ( not ( = ?auto_770066 ?auto_770078 ) ) ( not ( = ?auto_770066 ?auto_770079 ) ) ( not ( = ?auto_770067 ?auto_770068 ) ) ( not ( = ?auto_770067 ?auto_770069 ) ) ( not ( = ?auto_770067 ?auto_770070 ) ) ( not ( = ?auto_770067 ?auto_770071 ) ) ( not ( = ?auto_770067 ?auto_770072 ) ) ( not ( = ?auto_770067 ?auto_770073 ) ) ( not ( = ?auto_770067 ?auto_770074 ) ) ( not ( = ?auto_770067 ?auto_770075 ) ) ( not ( = ?auto_770067 ?auto_770076 ) ) ( not ( = ?auto_770067 ?auto_770077 ) ) ( not ( = ?auto_770067 ?auto_770078 ) ) ( not ( = ?auto_770067 ?auto_770079 ) ) ( not ( = ?auto_770068 ?auto_770069 ) ) ( not ( = ?auto_770068 ?auto_770070 ) ) ( not ( = ?auto_770068 ?auto_770071 ) ) ( not ( = ?auto_770068 ?auto_770072 ) ) ( not ( = ?auto_770068 ?auto_770073 ) ) ( not ( = ?auto_770068 ?auto_770074 ) ) ( not ( = ?auto_770068 ?auto_770075 ) ) ( not ( = ?auto_770068 ?auto_770076 ) ) ( not ( = ?auto_770068 ?auto_770077 ) ) ( not ( = ?auto_770068 ?auto_770078 ) ) ( not ( = ?auto_770068 ?auto_770079 ) ) ( not ( = ?auto_770069 ?auto_770070 ) ) ( not ( = ?auto_770069 ?auto_770071 ) ) ( not ( = ?auto_770069 ?auto_770072 ) ) ( not ( = ?auto_770069 ?auto_770073 ) ) ( not ( = ?auto_770069 ?auto_770074 ) ) ( not ( = ?auto_770069 ?auto_770075 ) ) ( not ( = ?auto_770069 ?auto_770076 ) ) ( not ( = ?auto_770069 ?auto_770077 ) ) ( not ( = ?auto_770069 ?auto_770078 ) ) ( not ( = ?auto_770069 ?auto_770079 ) ) ( not ( = ?auto_770070 ?auto_770071 ) ) ( not ( = ?auto_770070 ?auto_770072 ) ) ( not ( = ?auto_770070 ?auto_770073 ) ) ( not ( = ?auto_770070 ?auto_770074 ) ) ( not ( = ?auto_770070 ?auto_770075 ) ) ( not ( = ?auto_770070 ?auto_770076 ) ) ( not ( = ?auto_770070 ?auto_770077 ) ) ( not ( = ?auto_770070 ?auto_770078 ) ) ( not ( = ?auto_770070 ?auto_770079 ) ) ( not ( = ?auto_770071 ?auto_770072 ) ) ( not ( = ?auto_770071 ?auto_770073 ) ) ( not ( = ?auto_770071 ?auto_770074 ) ) ( not ( = ?auto_770071 ?auto_770075 ) ) ( not ( = ?auto_770071 ?auto_770076 ) ) ( not ( = ?auto_770071 ?auto_770077 ) ) ( not ( = ?auto_770071 ?auto_770078 ) ) ( not ( = ?auto_770071 ?auto_770079 ) ) ( not ( = ?auto_770072 ?auto_770073 ) ) ( not ( = ?auto_770072 ?auto_770074 ) ) ( not ( = ?auto_770072 ?auto_770075 ) ) ( not ( = ?auto_770072 ?auto_770076 ) ) ( not ( = ?auto_770072 ?auto_770077 ) ) ( not ( = ?auto_770072 ?auto_770078 ) ) ( not ( = ?auto_770072 ?auto_770079 ) ) ( not ( = ?auto_770073 ?auto_770074 ) ) ( not ( = ?auto_770073 ?auto_770075 ) ) ( not ( = ?auto_770073 ?auto_770076 ) ) ( not ( = ?auto_770073 ?auto_770077 ) ) ( not ( = ?auto_770073 ?auto_770078 ) ) ( not ( = ?auto_770073 ?auto_770079 ) ) ( not ( = ?auto_770074 ?auto_770075 ) ) ( not ( = ?auto_770074 ?auto_770076 ) ) ( not ( = ?auto_770074 ?auto_770077 ) ) ( not ( = ?auto_770074 ?auto_770078 ) ) ( not ( = ?auto_770074 ?auto_770079 ) ) ( not ( = ?auto_770075 ?auto_770076 ) ) ( not ( = ?auto_770075 ?auto_770077 ) ) ( not ( = ?auto_770075 ?auto_770078 ) ) ( not ( = ?auto_770075 ?auto_770079 ) ) ( not ( = ?auto_770076 ?auto_770077 ) ) ( not ( = ?auto_770076 ?auto_770078 ) ) ( not ( = ?auto_770076 ?auto_770079 ) ) ( not ( = ?auto_770077 ?auto_770078 ) ) ( not ( = ?auto_770077 ?auto_770079 ) ) ( not ( = ?auto_770078 ?auto_770079 ) ) ( ON ?auto_770077 ?auto_770078 ) ( ON ?auto_770076 ?auto_770077 ) ( ON ?auto_770075 ?auto_770076 ) ( ON ?auto_770074 ?auto_770075 ) ( ON ?auto_770073 ?auto_770074 ) ( ON ?auto_770072 ?auto_770073 ) ( ON ?auto_770071 ?auto_770072 ) ( ON ?auto_770070 ?auto_770071 ) ( CLEAR ?auto_770068 ) ( ON ?auto_770069 ?auto_770070 ) ( CLEAR ?auto_770069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_770065 ?auto_770066 ?auto_770067 ?auto_770068 ?auto_770069 )
      ( MAKE-14PILE ?auto_770065 ?auto_770066 ?auto_770067 ?auto_770068 ?auto_770069 ?auto_770070 ?auto_770071 ?auto_770072 ?auto_770073 ?auto_770074 ?auto_770075 ?auto_770076 ?auto_770077 ?auto_770078 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_770123 - BLOCK
      ?auto_770124 - BLOCK
      ?auto_770125 - BLOCK
      ?auto_770126 - BLOCK
      ?auto_770127 - BLOCK
      ?auto_770128 - BLOCK
      ?auto_770129 - BLOCK
      ?auto_770130 - BLOCK
      ?auto_770131 - BLOCK
      ?auto_770132 - BLOCK
      ?auto_770133 - BLOCK
      ?auto_770134 - BLOCK
      ?auto_770135 - BLOCK
      ?auto_770136 - BLOCK
    )
    :vars
    (
      ?auto_770137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770136 ?auto_770137 ) ( ON-TABLE ?auto_770123 ) ( ON ?auto_770124 ?auto_770123 ) ( ON ?auto_770125 ?auto_770124 ) ( not ( = ?auto_770123 ?auto_770124 ) ) ( not ( = ?auto_770123 ?auto_770125 ) ) ( not ( = ?auto_770123 ?auto_770126 ) ) ( not ( = ?auto_770123 ?auto_770127 ) ) ( not ( = ?auto_770123 ?auto_770128 ) ) ( not ( = ?auto_770123 ?auto_770129 ) ) ( not ( = ?auto_770123 ?auto_770130 ) ) ( not ( = ?auto_770123 ?auto_770131 ) ) ( not ( = ?auto_770123 ?auto_770132 ) ) ( not ( = ?auto_770123 ?auto_770133 ) ) ( not ( = ?auto_770123 ?auto_770134 ) ) ( not ( = ?auto_770123 ?auto_770135 ) ) ( not ( = ?auto_770123 ?auto_770136 ) ) ( not ( = ?auto_770123 ?auto_770137 ) ) ( not ( = ?auto_770124 ?auto_770125 ) ) ( not ( = ?auto_770124 ?auto_770126 ) ) ( not ( = ?auto_770124 ?auto_770127 ) ) ( not ( = ?auto_770124 ?auto_770128 ) ) ( not ( = ?auto_770124 ?auto_770129 ) ) ( not ( = ?auto_770124 ?auto_770130 ) ) ( not ( = ?auto_770124 ?auto_770131 ) ) ( not ( = ?auto_770124 ?auto_770132 ) ) ( not ( = ?auto_770124 ?auto_770133 ) ) ( not ( = ?auto_770124 ?auto_770134 ) ) ( not ( = ?auto_770124 ?auto_770135 ) ) ( not ( = ?auto_770124 ?auto_770136 ) ) ( not ( = ?auto_770124 ?auto_770137 ) ) ( not ( = ?auto_770125 ?auto_770126 ) ) ( not ( = ?auto_770125 ?auto_770127 ) ) ( not ( = ?auto_770125 ?auto_770128 ) ) ( not ( = ?auto_770125 ?auto_770129 ) ) ( not ( = ?auto_770125 ?auto_770130 ) ) ( not ( = ?auto_770125 ?auto_770131 ) ) ( not ( = ?auto_770125 ?auto_770132 ) ) ( not ( = ?auto_770125 ?auto_770133 ) ) ( not ( = ?auto_770125 ?auto_770134 ) ) ( not ( = ?auto_770125 ?auto_770135 ) ) ( not ( = ?auto_770125 ?auto_770136 ) ) ( not ( = ?auto_770125 ?auto_770137 ) ) ( not ( = ?auto_770126 ?auto_770127 ) ) ( not ( = ?auto_770126 ?auto_770128 ) ) ( not ( = ?auto_770126 ?auto_770129 ) ) ( not ( = ?auto_770126 ?auto_770130 ) ) ( not ( = ?auto_770126 ?auto_770131 ) ) ( not ( = ?auto_770126 ?auto_770132 ) ) ( not ( = ?auto_770126 ?auto_770133 ) ) ( not ( = ?auto_770126 ?auto_770134 ) ) ( not ( = ?auto_770126 ?auto_770135 ) ) ( not ( = ?auto_770126 ?auto_770136 ) ) ( not ( = ?auto_770126 ?auto_770137 ) ) ( not ( = ?auto_770127 ?auto_770128 ) ) ( not ( = ?auto_770127 ?auto_770129 ) ) ( not ( = ?auto_770127 ?auto_770130 ) ) ( not ( = ?auto_770127 ?auto_770131 ) ) ( not ( = ?auto_770127 ?auto_770132 ) ) ( not ( = ?auto_770127 ?auto_770133 ) ) ( not ( = ?auto_770127 ?auto_770134 ) ) ( not ( = ?auto_770127 ?auto_770135 ) ) ( not ( = ?auto_770127 ?auto_770136 ) ) ( not ( = ?auto_770127 ?auto_770137 ) ) ( not ( = ?auto_770128 ?auto_770129 ) ) ( not ( = ?auto_770128 ?auto_770130 ) ) ( not ( = ?auto_770128 ?auto_770131 ) ) ( not ( = ?auto_770128 ?auto_770132 ) ) ( not ( = ?auto_770128 ?auto_770133 ) ) ( not ( = ?auto_770128 ?auto_770134 ) ) ( not ( = ?auto_770128 ?auto_770135 ) ) ( not ( = ?auto_770128 ?auto_770136 ) ) ( not ( = ?auto_770128 ?auto_770137 ) ) ( not ( = ?auto_770129 ?auto_770130 ) ) ( not ( = ?auto_770129 ?auto_770131 ) ) ( not ( = ?auto_770129 ?auto_770132 ) ) ( not ( = ?auto_770129 ?auto_770133 ) ) ( not ( = ?auto_770129 ?auto_770134 ) ) ( not ( = ?auto_770129 ?auto_770135 ) ) ( not ( = ?auto_770129 ?auto_770136 ) ) ( not ( = ?auto_770129 ?auto_770137 ) ) ( not ( = ?auto_770130 ?auto_770131 ) ) ( not ( = ?auto_770130 ?auto_770132 ) ) ( not ( = ?auto_770130 ?auto_770133 ) ) ( not ( = ?auto_770130 ?auto_770134 ) ) ( not ( = ?auto_770130 ?auto_770135 ) ) ( not ( = ?auto_770130 ?auto_770136 ) ) ( not ( = ?auto_770130 ?auto_770137 ) ) ( not ( = ?auto_770131 ?auto_770132 ) ) ( not ( = ?auto_770131 ?auto_770133 ) ) ( not ( = ?auto_770131 ?auto_770134 ) ) ( not ( = ?auto_770131 ?auto_770135 ) ) ( not ( = ?auto_770131 ?auto_770136 ) ) ( not ( = ?auto_770131 ?auto_770137 ) ) ( not ( = ?auto_770132 ?auto_770133 ) ) ( not ( = ?auto_770132 ?auto_770134 ) ) ( not ( = ?auto_770132 ?auto_770135 ) ) ( not ( = ?auto_770132 ?auto_770136 ) ) ( not ( = ?auto_770132 ?auto_770137 ) ) ( not ( = ?auto_770133 ?auto_770134 ) ) ( not ( = ?auto_770133 ?auto_770135 ) ) ( not ( = ?auto_770133 ?auto_770136 ) ) ( not ( = ?auto_770133 ?auto_770137 ) ) ( not ( = ?auto_770134 ?auto_770135 ) ) ( not ( = ?auto_770134 ?auto_770136 ) ) ( not ( = ?auto_770134 ?auto_770137 ) ) ( not ( = ?auto_770135 ?auto_770136 ) ) ( not ( = ?auto_770135 ?auto_770137 ) ) ( not ( = ?auto_770136 ?auto_770137 ) ) ( ON ?auto_770135 ?auto_770136 ) ( ON ?auto_770134 ?auto_770135 ) ( ON ?auto_770133 ?auto_770134 ) ( ON ?auto_770132 ?auto_770133 ) ( ON ?auto_770131 ?auto_770132 ) ( ON ?auto_770130 ?auto_770131 ) ( ON ?auto_770129 ?auto_770130 ) ( ON ?auto_770128 ?auto_770129 ) ( ON ?auto_770127 ?auto_770128 ) ( CLEAR ?auto_770125 ) ( ON ?auto_770126 ?auto_770127 ) ( CLEAR ?auto_770126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_770123 ?auto_770124 ?auto_770125 ?auto_770126 )
      ( MAKE-14PILE ?auto_770123 ?auto_770124 ?auto_770125 ?auto_770126 ?auto_770127 ?auto_770128 ?auto_770129 ?auto_770130 ?auto_770131 ?auto_770132 ?auto_770133 ?auto_770134 ?auto_770135 ?auto_770136 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_770181 - BLOCK
      ?auto_770182 - BLOCK
      ?auto_770183 - BLOCK
      ?auto_770184 - BLOCK
      ?auto_770185 - BLOCK
      ?auto_770186 - BLOCK
      ?auto_770187 - BLOCK
      ?auto_770188 - BLOCK
      ?auto_770189 - BLOCK
      ?auto_770190 - BLOCK
      ?auto_770191 - BLOCK
      ?auto_770192 - BLOCK
      ?auto_770193 - BLOCK
      ?auto_770194 - BLOCK
    )
    :vars
    (
      ?auto_770195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770194 ?auto_770195 ) ( ON-TABLE ?auto_770181 ) ( ON ?auto_770182 ?auto_770181 ) ( not ( = ?auto_770181 ?auto_770182 ) ) ( not ( = ?auto_770181 ?auto_770183 ) ) ( not ( = ?auto_770181 ?auto_770184 ) ) ( not ( = ?auto_770181 ?auto_770185 ) ) ( not ( = ?auto_770181 ?auto_770186 ) ) ( not ( = ?auto_770181 ?auto_770187 ) ) ( not ( = ?auto_770181 ?auto_770188 ) ) ( not ( = ?auto_770181 ?auto_770189 ) ) ( not ( = ?auto_770181 ?auto_770190 ) ) ( not ( = ?auto_770181 ?auto_770191 ) ) ( not ( = ?auto_770181 ?auto_770192 ) ) ( not ( = ?auto_770181 ?auto_770193 ) ) ( not ( = ?auto_770181 ?auto_770194 ) ) ( not ( = ?auto_770181 ?auto_770195 ) ) ( not ( = ?auto_770182 ?auto_770183 ) ) ( not ( = ?auto_770182 ?auto_770184 ) ) ( not ( = ?auto_770182 ?auto_770185 ) ) ( not ( = ?auto_770182 ?auto_770186 ) ) ( not ( = ?auto_770182 ?auto_770187 ) ) ( not ( = ?auto_770182 ?auto_770188 ) ) ( not ( = ?auto_770182 ?auto_770189 ) ) ( not ( = ?auto_770182 ?auto_770190 ) ) ( not ( = ?auto_770182 ?auto_770191 ) ) ( not ( = ?auto_770182 ?auto_770192 ) ) ( not ( = ?auto_770182 ?auto_770193 ) ) ( not ( = ?auto_770182 ?auto_770194 ) ) ( not ( = ?auto_770182 ?auto_770195 ) ) ( not ( = ?auto_770183 ?auto_770184 ) ) ( not ( = ?auto_770183 ?auto_770185 ) ) ( not ( = ?auto_770183 ?auto_770186 ) ) ( not ( = ?auto_770183 ?auto_770187 ) ) ( not ( = ?auto_770183 ?auto_770188 ) ) ( not ( = ?auto_770183 ?auto_770189 ) ) ( not ( = ?auto_770183 ?auto_770190 ) ) ( not ( = ?auto_770183 ?auto_770191 ) ) ( not ( = ?auto_770183 ?auto_770192 ) ) ( not ( = ?auto_770183 ?auto_770193 ) ) ( not ( = ?auto_770183 ?auto_770194 ) ) ( not ( = ?auto_770183 ?auto_770195 ) ) ( not ( = ?auto_770184 ?auto_770185 ) ) ( not ( = ?auto_770184 ?auto_770186 ) ) ( not ( = ?auto_770184 ?auto_770187 ) ) ( not ( = ?auto_770184 ?auto_770188 ) ) ( not ( = ?auto_770184 ?auto_770189 ) ) ( not ( = ?auto_770184 ?auto_770190 ) ) ( not ( = ?auto_770184 ?auto_770191 ) ) ( not ( = ?auto_770184 ?auto_770192 ) ) ( not ( = ?auto_770184 ?auto_770193 ) ) ( not ( = ?auto_770184 ?auto_770194 ) ) ( not ( = ?auto_770184 ?auto_770195 ) ) ( not ( = ?auto_770185 ?auto_770186 ) ) ( not ( = ?auto_770185 ?auto_770187 ) ) ( not ( = ?auto_770185 ?auto_770188 ) ) ( not ( = ?auto_770185 ?auto_770189 ) ) ( not ( = ?auto_770185 ?auto_770190 ) ) ( not ( = ?auto_770185 ?auto_770191 ) ) ( not ( = ?auto_770185 ?auto_770192 ) ) ( not ( = ?auto_770185 ?auto_770193 ) ) ( not ( = ?auto_770185 ?auto_770194 ) ) ( not ( = ?auto_770185 ?auto_770195 ) ) ( not ( = ?auto_770186 ?auto_770187 ) ) ( not ( = ?auto_770186 ?auto_770188 ) ) ( not ( = ?auto_770186 ?auto_770189 ) ) ( not ( = ?auto_770186 ?auto_770190 ) ) ( not ( = ?auto_770186 ?auto_770191 ) ) ( not ( = ?auto_770186 ?auto_770192 ) ) ( not ( = ?auto_770186 ?auto_770193 ) ) ( not ( = ?auto_770186 ?auto_770194 ) ) ( not ( = ?auto_770186 ?auto_770195 ) ) ( not ( = ?auto_770187 ?auto_770188 ) ) ( not ( = ?auto_770187 ?auto_770189 ) ) ( not ( = ?auto_770187 ?auto_770190 ) ) ( not ( = ?auto_770187 ?auto_770191 ) ) ( not ( = ?auto_770187 ?auto_770192 ) ) ( not ( = ?auto_770187 ?auto_770193 ) ) ( not ( = ?auto_770187 ?auto_770194 ) ) ( not ( = ?auto_770187 ?auto_770195 ) ) ( not ( = ?auto_770188 ?auto_770189 ) ) ( not ( = ?auto_770188 ?auto_770190 ) ) ( not ( = ?auto_770188 ?auto_770191 ) ) ( not ( = ?auto_770188 ?auto_770192 ) ) ( not ( = ?auto_770188 ?auto_770193 ) ) ( not ( = ?auto_770188 ?auto_770194 ) ) ( not ( = ?auto_770188 ?auto_770195 ) ) ( not ( = ?auto_770189 ?auto_770190 ) ) ( not ( = ?auto_770189 ?auto_770191 ) ) ( not ( = ?auto_770189 ?auto_770192 ) ) ( not ( = ?auto_770189 ?auto_770193 ) ) ( not ( = ?auto_770189 ?auto_770194 ) ) ( not ( = ?auto_770189 ?auto_770195 ) ) ( not ( = ?auto_770190 ?auto_770191 ) ) ( not ( = ?auto_770190 ?auto_770192 ) ) ( not ( = ?auto_770190 ?auto_770193 ) ) ( not ( = ?auto_770190 ?auto_770194 ) ) ( not ( = ?auto_770190 ?auto_770195 ) ) ( not ( = ?auto_770191 ?auto_770192 ) ) ( not ( = ?auto_770191 ?auto_770193 ) ) ( not ( = ?auto_770191 ?auto_770194 ) ) ( not ( = ?auto_770191 ?auto_770195 ) ) ( not ( = ?auto_770192 ?auto_770193 ) ) ( not ( = ?auto_770192 ?auto_770194 ) ) ( not ( = ?auto_770192 ?auto_770195 ) ) ( not ( = ?auto_770193 ?auto_770194 ) ) ( not ( = ?auto_770193 ?auto_770195 ) ) ( not ( = ?auto_770194 ?auto_770195 ) ) ( ON ?auto_770193 ?auto_770194 ) ( ON ?auto_770192 ?auto_770193 ) ( ON ?auto_770191 ?auto_770192 ) ( ON ?auto_770190 ?auto_770191 ) ( ON ?auto_770189 ?auto_770190 ) ( ON ?auto_770188 ?auto_770189 ) ( ON ?auto_770187 ?auto_770188 ) ( ON ?auto_770186 ?auto_770187 ) ( ON ?auto_770185 ?auto_770186 ) ( ON ?auto_770184 ?auto_770185 ) ( CLEAR ?auto_770182 ) ( ON ?auto_770183 ?auto_770184 ) ( CLEAR ?auto_770183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_770181 ?auto_770182 ?auto_770183 )
      ( MAKE-14PILE ?auto_770181 ?auto_770182 ?auto_770183 ?auto_770184 ?auto_770185 ?auto_770186 ?auto_770187 ?auto_770188 ?auto_770189 ?auto_770190 ?auto_770191 ?auto_770192 ?auto_770193 ?auto_770194 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_770239 - BLOCK
      ?auto_770240 - BLOCK
      ?auto_770241 - BLOCK
      ?auto_770242 - BLOCK
      ?auto_770243 - BLOCK
      ?auto_770244 - BLOCK
      ?auto_770245 - BLOCK
      ?auto_770246 - BLOCK
      ?auto_770247 - BLOCK
      ?auto_770248 - BLOCK
      ?auto_770249 - BLOCK
      ?auto_770250 - BLOCK
      ?auto_770251 - BLOCK
      ?auto_770252 - BLOCK
    )
    :vars
    (
      ?auto_770253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770252 ?auto_770253 ) ( ON-TABLE ?auto_770239 ) ( not ( = ?auto_770239 ?auto_770240 ) ) ( not ( = ?auto_770239 ?auto_770241 ) ) ( not ( = ?auto_770239 ?auto_770242 ) ) ( not ( = ?auto_770239 ?auto_770243 ) ) ( not ( = ?auto_770239 ?auto_770244 ) ) ( not ( = ?auto_770239 ?auto_770245 ) ) ( not ( = ?auto_770239 ?auto_770246 ) ) ( not ( = ?auto_770239 ?auto_770247 ) ) ( not ( = ?auto_770239 ?auto_770248 ) ) ( not ( = ?auto_770239 ?auto_770249 ) ) ( not ( = ?auto_770239 ?auto_770250 ) ) ( not ( = ?auto_770239 ?auto_770251 ) ) ( not ( = ?auto_770239 ?auto_770252 ) ) ( not ( = ?auto_770239 ?auto_770253 ) ) ( not ( = ?auto_770240 ?auto_770241 ) ) ( not ( = ?auto_770240 ?auto_770242 ) ) ( not ( = ?auto_770240 ?auto_770243 ) ) ( not ( = ?auto_770240 ?auto_770244 ) ) ( not ( = ?auto_770240 ?auto_770245 ) ) ( not ( = ?auto_770240 ?auto_770246 ) ) ( not ( = ?auto_770240 ?auto_770247 ) ) ( not ( = ?auto_770240 ?auto_770248 ) ) ( not ( = ?auto_770240 ?auto_770249 ) ) ( not ( = ?auto_770240 ?auto_770250 ) ) ( not ( = ?auto_770240 ?auto_770251 ) ) ( not ( = ?auto_770240 ?auto_770252 ) ) ( not ( = ?auto_770240 ?auto_770253 ) ) ( not ( = ?auto_770241 ?auto_770242 ) ) ( not ( = ?auto_770241 ?auto_770243 ) ) ( not ( = ?auto_770241 ?auto_770244 ) ) ( not ( = ?auto_770241 ?auto_770245 ) ) ( not ( = ?auto_770241 ?auto_770246 ) ) ( not ( = ?auto_770241 ?auto_770247 ) ) ( not ( = ?auto_770241 ?auto_770248 ) ) ( not ( = ?auto_770241 ?auto_770249 ) ) ( not ( = ?auto_770241 ?auto_770250 ) ) ( not ( = ?auto_770241 ?auto_770251 ) ) ( not ( = ?auto_770241 ?auto_770252 ) ) ( not ( = ?auto_770241 ?auto_770253 ) ) ( not ( = ?auto_770242 ?auto_770243 ) ) ( not ( = ?auto_770242 ?auto_770244 ) ) ( not ( = ?auto_770242 ?auto_770245 ) ) ( not ( = ?auto_770242 ?auto_770246 ) ) ( not ( = ?auto_770242 ?auto_770247 ) ) ( not ( = ?auto_770242 ?auto_770248 ) ) ( not ( = ?auto_770242 ?auto_770249 ) ) ( not ( = ?auto_770242 ?auto_770250 ) ) ( not ( = ?auto_770242 ?auto_770251 ) ) ( not ( = ?auto_770242 ?auto_770252 ) ) ( not ( = ?auto_770242 ?auto_770253 ) ) ( not ( = ?auto_770243 ?auto_770244 ) ) ( not ( = ?auto_770243 ?auto_770245 ) ) ( not ( = ?auto_770243 ?auto_770246 ) ) ( not ( = ?auto_770243 ?auto_770247 ) ) ( not ( = ?auto_770243 ?auto_770248 ) ) ( not ( = ?auto_770243 ?auto_770249 ) ) ( not ( = ?auto_770243 ?auto_770250 ) ) ( not ( = ?auto_770243 ?auto_770251 ) ) ( not ( = ?auto_770243 ?auto_770252 ) ) ( not ( = ?auto_770243 ?auto_770253 ) ) ( not ( = ?auto_770244 ?auto_770245 ) ) ( not ( = ?auto_770244 ?auto_770246 ) ) ( not ( = ?auto_770244 ?auto_770247 ) ) ( not ( = ?auto_770244 ?auto_770248 ) ) ( not ( = ?auto_770244 ?auto_770249 ) ) ( not ( = ?auto_770244 ?auto_770250 ) ) ( not ( = ?auto_770244 ?auto_770251 ) ) ( not ( = ?auto_770244 ?auto_770252 ) ) ( not ( = ?auto_770244 ?auto_770253 ) ) ( not ( = ?auto_770245 ?auto_770246 ) ) ( not ( = ?auto_770245 ?auto_770247 ) ) ( not ( = ?auto_770245 ?auto_770248 ) ) ( not ( = ?auto_770245 ?auto_770249 ) ) ( not ( = ?auto_770245 ?auto_770250 ) ) ( not ( = ?auto_770245 ?auto_770251 ) ) ( not ( = ?auto_770245 ?auto_770252 ) ) ( not ( = ?auto_770245 ?auto_770253 ) ) ( not ( = ?auto_770246 ?auto_770247 ) ) ( not ( = ?auto_770246 ?auto_770248 ) ) ( not ( = ?auto_770246 ?auto_770249 ) ) ( not ( = ?auto_770246 ?auto_770250 ) ) ( not ( = ?auto_770246 ?auto_770251 ) ) ( not ( = ?auto_770246 ?auto_770252 ) ) ( not ( = ?auto_770246 ?auto_770253 ) ) ( not ( = ?auto_770247 ?auto_770248 ) ) ( not ( = ?auto_770247 ?auto_770249 ) ) ( not ( = ?auto_770247 ?auto_770250 ) ) ( not ( = ?auto_770247 ?auto_770251 ) ) ( not ( = ?auto_770247 ?auto_770252 ) ) ( not ( = ?auto_770247 ?auto_770253 ) ) ( not ( = ?auto_770248 ?auto_770249 ) ) ( not ( = ?auto_770248 ?auto_770250 ) ) ( not ( = ?auto_770248 ?auto_770251 ) ) ( not ( = ?auto_770248 ?auto_770252 ) ) ( not ( = ?auto_770248 ?auto_770253 ) ) ( not ( = ?auto_770249 ?auto_770250 ) ) ( not ( = ?auto_770249 ?auto_770251 ) ) ( not ( = ?auto_770249 ?auto_770252 ) ) ( not ( = ?auto_770249 ?auto_770253 ) ) ( not ( = ?auto_770250 ?auto_770251 ) ) ( not ( = ?auto_770250 ?auto_770252 ) ) ( not ( = ?auto_770250 ?auto_770253 ) ) ( not ( = ?auto_770251 ?auto_770252 ) ) ( not ( = ?auto_770251 ?auto_770253 ) ) ( not ( = ?auto_770252 ?auto_770253 ) ) ( ON ?auto_770251 ?auto_770252 ) ( ON ?auto_770250 ?auto_770251 ) ( ON ?auto_770249 ?auto_770250 ) ( ON ?auto_770248 ?auto_770249 ) ( ON ?auto_770247 ?auto_770248 ) ( ON ?auto_770246 ?auto_770247 ) ( ON ?auto_770245 ?auto_770246 ) ( ON ?auto_770244 ?auto_770245 ) ( ON ?auto_770243 ?auto_770244 ) ( ON ?auto_770242 ?auto_770243 ) ( ON ?auto_770241 ?auto_770242 ) ( CLEAR ?auto_770239 ) ( ON ?auto_770240 ?auto_770241 ) ( CLEAR ?auto_770240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_770239 ?auto_770240 )
      ( MAKE-14PILE ?auto_770239 ?auto_770240 ?auto_770241 ?auto_770242 ?auto_770243 ?auto_770244 ?auto_770245 ?auto_770246 ?auto_770247 ?auto_770248 ?auto_770249 ?auto_770250 ?auto_770251 ?auto_770252 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_770297 - BLOCK
      ?auto_770298 - BLOCK
      ?auto_770299 - BLOCK
      ?auto_770300 - BLOCK
      ?auto_770301 - BLOCK
      ?auto_770302 - BLOCK
      ?auto_770303 - BLOCK
      ?auto_770304 - BLOCK
      ?auto_770305 - BLOCK
      ?auto_770306 - BLOCK
      ?auto_770307 - BLOCK
      ?auto_770308 - BLOCK
      ?auto_770309 - BLOCK
      ?auto_770310 - BLOCK
    )
    :vars
    (
      ?auto_770311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770310 ?auto_770311 ) ( not ( = ?auto_770297 ?auto_770298 ) ) ( not ( = ?auto_770297 ?auto_770299 ) ) ( not ( = ?auto_770297 ?auto_770300 ) ) ( not ( = ?auto_770297 ?auto_770301 ) ) ( not ( = ?auto_770297 ?auto_770302 ) ) ( not ( = ?auto_770297 ?auto_770303 ) ) ( not ( = ?auto_770297 ?auto_770304 ) ) ( not ( = ?auto_770297 ?auto_770305 ) ) ( not ( = ?auto_770297 ?auto_770306 ) ) ( not ( = ?auto_770297 ?auto_770307 ) ) ( not ( = ?auto_770297 ?auto_770308 ) ) ( not ( = ?auto_770297 ?auto_770309 ) ) ( not ( = ?auto_770297 ?auto_770310 ) ) ( not ( = ?auto_770297 ?auto_770311 ) ) ( not ( = ?auto_770298 ?auto_770299 ) ) ( not ( = ?auto_770298 ?auto_770300 ) ) ( not ( = ?auto_770298 ?auto_770301 ) ) ( not ( = ?auto_770298 ?auto_770302 ) ) ( not ( = ?auto_770298 ?auto_770303 ) ) ( not ( = ?auto_770298 ?auto_770304 ) ) ( not ( = ?auto_770298 ?auto_770305 ) ) ( not ( = ?auto_770298 ?auto_770306 ) ) ( not ( = ?auto_770298 ?auto_770307 ) ) ( not ( = ?auto_770298 ?auto_770308 ) ) ( not ( = ?auto_770298 ?auto_770309 ) ) ( not ( = ?auto_770298 ?auto_770310 ) ) ( not ( = ?auto_770298 ?auto_770311 ) ) ( not ( = ?auto_770299 ?auto_770300 ) ) ( not ( = ?auto_770299 ?auto_770301 ) ) ( not ( = ?auto_770299 ?auto_770302 ) ) ( not ( = ?auto_770299 ?auto_770303 ) ) ( not ( = ?auto_770299 ?auto_770304 ) ) ( not ( = ?auto_770299 ?auto_770305 ) ) ( not ( = ?auto_770299 ?auto_770306 ) ) ( not ( = ?auto_770299 ?auto_770307 ) ) ( not ( = ?auto_770299 ?auto_770308 ) ) ( not ( = ?auto_770299 ?auto_770309 ) ) ( not ( = ?auto_770299 ?auto_770310 ) ) ( not ( = ?auto_770299 ?auto_770311 ) ) ( not ( = ?auto_770300 ?auto_770301 ) ) ( not ( = ?auto_770300 ?auto_770302 ) ) ( not ( = ?auto_770300 ?auto_770303 ) ) ( not ( = ?auto_770300 ?auto_770304 ) ) ( not ( = ?auto_770300 ?auto_770305 ) ) ( not ( = ?auto_770300 ?auto_770306 ) ) ( not ( = ?auto_770300 ?auto_770307 ) ) ( not ( = ?auto_770300 ?auto_770308 ) ) ( not ( = ?auto_770300 ?auto_770309 ) ) ( not ( = ?auto_770300 ?auto_770310 ) ) ( not ( = ?auto_770300 ?auto_770311 ) ) ( not ( = ?auto_770301 ?auto_770302 ) ) ( not ( = ?auto_770301 ?auto_770303 ) ) ( not ( = ?auto_770301 ?auto_770304 ) ) ( not ( = ?auto_770301 ?auto_770305 ) ) ( not ( = ?auto_770301 ?auto_770306 ) ) ( not ( = ?auto_770301 ?auto_770307 ) ) ( not ( = ?auto_770301 ?auto_770308 ) ) ( not ( = ?auto_770301 ?auto_770309 ) ) ( not ( = ?auto_770301 ?auto_770310 ) ) ( not ( = ?auto_770301 ?auto_770311 ) ) ( not ( = ?auto_770302 ?auto_770303 ) ) ( not ( = ?auto_770302 ?auto_770304 ) ) ( not ( = ?auto_770302 ?auto_770305 ) ) ( not ( = ?auto_770302 ?auto_770306 ) ) ( not ( = ?auto_770302 ?auto_770307 ) ) ( not ( = ?auto_770302 ?auto_770308 ) ) ( not ( = ?auto_770302 ?auto_770309 ) ) ( not ( = ?auto_770302 ?auto_770310 ) ) ( not ( = ?auto_770302 ?auto_770311 ) ) ( not ( = ?auto_770303 ?auto_770304 ) ) ( not ( = ?auto_770303 ?auto_770305 ) ) ( not ( = ?auto_770303 ?auto_770306 ) ) ( not ( = ?auto_770303 ?auto_770307 ) ) ( not ( = ?auto_770303 ?auto_770308 ) ) ( not ( = ?auto_770303 ?auto_770309 ) ) ( not ( = ?auto_770303 ?auto_770310 ) ) ( not ( = ?auto_770303 ?auto_770311 ) ) ( not ( = ?auto_770304 ?auto_770305 ) ) ( not ( = ?auto_770304 ?auto_770306 ) ) ( not ( = ?auto_770304 ?auto_770307 ) ) ( not ( = ?auto_770304 ?auto_770308 ) ) ( not ( = ?auto_770304 ?auto_770309 ) ) ( not ( = ?auto_770304 ?auto_770310 ) ) ( not ( = ?auto_770304 ?auto_770311 ) ) ( not ( = ?auto_770305 ?auto_770306 ) ) ( not ( = ?auto_770305 ?auto_770307 ) ) ( not ( = ?auto_770305 ?auto_770308 ) ) ( not ( = ?auto_770305 ?auto_770309 ) ) ( not ( = ?auto_770305 ?auto_770310 ) ) ( not ( = ?auto_770305 ?auto_770311 ) ) ( not ( = ?auto_770306 ?auto_770307 ) ) ( not ( = ?auto_770306 ?auto_770308 ) ) ( not ( = ?auto_770306 ?auto_770309 ) ) ( not ( = ?auto_770306 ?auto_770310 ) ) ( not ( = ?auto_770306 ?auto_770311 ) ) ( not ( = ?auto_770307 ?auto_770308 ) ) ( not ( = ?auto_770307 ?auto_770309 ) ) ( not ( = ?auto_770307 ?auto_770310 ) ) ( not ( = ?auto_770307 ?auto_770311 ) ) ( not ( = ?auto_770308 ?auto_770309 ) ) ( not ( = ?auto_770308 ?auto_770310 ) ) ( not ( = ?auto_770308 ?auto_770311 ) ) ( not ( = ?auto_770309 ?auto_770310 ) ) ( not ( = ?auto_770309 ?auto_770311 ) ) ( not ( = ?auto_770310 ?auto_770311 ) ) ( ON ?auto_770309 ?auto_770310 ) ( ON ?auto_770308 ?auto_770309 ) ( ON ?auto_770307 ?auto_770308 ) ( ON ?auto_770306 ?auto_770307 ) ( ON ?auto_770305 ?auto_770306 ) ( ON ?auto_770304 ?auto_770305 ) ( ON ?auto_770303 ?auto_770304 ) ( ON ?auto_770302 ?auto_770303 ) ( ON ?auto_770301 ?auto_770302 ) ( ON ?auto_770300 ?auto_770301 ) ( ON ?auto_770299 ?auto_770300 ) ( ON ?auto_770298 ?auto_770299 ) ( ON ?auto_770297 ?auto_770298 ) ( CLEAR ?auto_770297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_770297 )
      ( MAKE-14PILE ?auto_770297 ?auto_770298 ?auto_770299 ?auto_770300 ?auto_770301 ?auto_770302 ?auto_770303 ?auto_770304 ?auto_770305 ?auto_770306 ?auto_770307 ?auto_770308 ?auto_770309 ?auto_770310 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_770356 - BLOCK
      ?auto_770357 - BLOCK
      ?auto_770358 - BLOCK
      ?auto_770359 - BLOCK
      ?auto_770360 - BLOCK
      ?auto_770361 - BLOCK
      ?auto_770362 - BLOCK
      ?auto_770363 - BLOCK
      ?auto_770364 - BLOCK
      ?auto_770365 - BLOCK
      ?auto_770366 - BLOCK
      ?auto_770367 - BLOCK
      ?auto_770368 - BLOCK
      ?auto_770369 - BLOCK
      ?auto_770370 - BLOCK
    )
    :vars
    (
      ?auto_770371 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_770369 ) ( ON ?auto_770370 ?auto_770371 ) ( CLEAR ?auto_770370 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_770356 ) ( ON ?auto_770357 ?auto_770356 ) ( ON ?auto_770358 ?auto_770357 ) ( ON ?auto_770359 ?auto_770358 ) ( ON ?auto_770360 ?auto_770359 ) ( ON ?auto_770361 ?auto_770360 ) ( ON ?auto_770362 ?auto_770361 ) ( ON ?auto_770363 ?auto_770362 ) ( ON ?auto_770364 ?auto_770363 ) ( ON ?auto_770365 ?auto_770364 ) ( ON ?auto_770366 ?auto_770365 ) ( ON ?auto_770367 ?auto_770366 ) ( ON ?auto_770368 ?auto_770367 ) ( ON ?auto_770369 ?auto_770368 ) ( not ( = ?auto_770356 ?auto_770357 ) ) ( not ( = ?auto_770356 ?auto_770358 ) ) ( not ( = ?auto_770356 ?auto_770359 ) ) ( not ( = ?auto_770356 ?auto_770360 ) ) ( not ( = ?auto_770356 ?auto_770361 ) ) ( not ( = ?auto_770356 ?auto_770362 ) ) ( not ( = ?auto_770356 ?auto_770363 ) ) ( not ( = ?auto_770356 ?auto_770364 ) ) ( not ( = ?auto_770356 ?auto_770365 ) ) ( not ( = ?auto_770356 ?auto_770366 ) ) ( not ( = ?auto_770356 ?auto_770367 ) ) ( not ( = ?auto_770356 ?auto_770368 ) ) ( not ( = ?auto_770356 ?auto_770369 ) ) ( not ( = ?auto_770356 ?auto_770370 ) ) ( not ( = ?auto_770356 ?auto_770371 ) ) ( not ( = ?auto_770357 ?auto_770358 ) ) ( not ( = ?auto_770357 ?auto_770359 ) ) ( not ( = ?auto_770357 ?auto_770360 ) ) ( not ( = ?auto_770357 ?auto_770361 ) ) ( not ( = ?auto_770357 ?auto_770362 ) ) ( not ( = ?auto_770357 ?auto_770363 ) ) ( not ( = ?auto_770357 ?auto_770364 ) ) ( not ( = ?auto_770357 ?auto_770365 ) ) ( not ( = ?auto_770357 ?auto_770366 ) ) ( not ( = ?auto_770357 ?auto_770367 ) ) ( not ( = ?auto_770357 ?auto_770368 ) ) ( not ( = ?auto_770357 ?auto_770369 ) ) ( not ( = ?auto_770357 ?auto_770370 ) ) ( not ( = ?auto_770357 ?auto_770371 ) ) ( not ( = ?auto_770358 ?auto_770359 ) ) ( not ( = ?auto_770358 ?auto_770360 ) ) ( not ( = ?auto_770358 ?auto_770361 ) ) ( not ( = ?auto_770358 ?auto_770362 ) ) ( not ( = ?auto_770358 ?auto_770363 ) ) ( not ( = ?auto_770358 ?auto_770364 ) ) ( not ( = ?auto_770358 ?auto_770365 ) ) ( not ( = ?auto_770358 ?auto_770366 ) ) ( not ( = ?auto_770358 ?auto_770367 ) ) ( not ( = ?auto_770358 ?auto_770368 ) ) ( not ( = ?auto_770358 ?auto_770369 ) ) ( not ( = ?auto_770358 ?auto_770370 ) ) ( not ( = ?auto_770358 ?auto_770371 ) ) ( not ( = ?auto_770359 ?auto_770360 ) ) ( not ( = ?auto_770359 ?auto_770361 ) ) ( not ( = ?auto_770359 ?auto_770362 ) ) ( not ( = ?auto_770359 ?auto_770363 ) ) ( not ( = ?auto_770359 ?auto_770364 ) ) ( not ( = ?auto_770359 ?auto_770365 ) ) ( not ( = ?auto_770359 ?auto_770366 ) ) ( not ( = ?auto_770359 ?auto_770367 ) ) ( not ( = ?auto_770359 ?auto_770368 ) ) ( not ( = ?auto_770359 ?auto_770369 ) ) ( not ( = ?auto_770359 ?auto_770370 ) ) ( not ( = ?auto_770359 ?auto_770371 ) ) ( not ( = ?auto_770360 ?auto_770361 ) ) ( not ( = ?auto_770360 ?auto_770362 ) ) ( not ( = ?auto_770360 ?auto_770363 ) ) ( not ( = ?auto_770360 ?auto_770364 ) ) ( not ( = ?auto_770360 ?auto_770365 ) ) ( not ( = ?auto_770360 ?auto_770366 ) ) ( not ( = ?auto_770360 ?auto_770367 ) ) ( not ( = ?auto_770360 ?auto_770368 ) ) ( not ( = ?auto_770360 ?auto_770369 ) ) ( not ( = ?auto_770360 ?auto_770370 ) ) ( not ( = ?auto_770360 ?auto_770371 ) ) ( not ( = ?auto_770361 ?auto_770362 ) ) ( not ( = ?auto_770361 ?auto_770363 ) ) ( not ( = ?auto_770361 ?auto_770364 ) ) ( not ( = ?auto_770361 ?auto_770365 ) ) ( not ( = ?auto_770361 ?auto_770366 ) ) ( not ( = ?auto_770361 ?auto_770367 ) ) ( not ( = ?auto_770361 ?auto_770368 ) ) ( not ( = ?auto_770361 ?auto_770369 ) ) ( not ( = ?auto_770361 ?auto_770370 ) ) ( not ( = ?auto_770361 ?auto_770371 ) ) ( not ( = ?auto_770362 ?auto_770363 ) ) ( not ( = ?auto_770362 ?auto_770364 ) ) ( not ( = ?auto_770362 ?auto_770365 ) ) ( not ( = ?auto_770362 ?auto_770366 ) ) ( not ( = ?auto_770362 ?auto_770367 ) ) ( not ( = ?auto_770362 ?auto_770368 ) ) ( not ( = ?auto_770362 ?auto_770369 ) ) ( not ( = ?auto_770362 ?auto_770370 ) ) ( not ( = ?auto_770362 ?auto_770371 ) ) ( not ( = ?auto_770363 ?auto_770364 ) ) ( not ( = ?auto_770363 ?auto_770365 ) ) ( not ( = ?auto_770363 ?auto_770366 ) ) ( not ( = ?auto_770363 ?auto_770367 ) ) ( not ( = ?auto_770363 ?auto_770368 ) ) ( not ( = ?auto_770363 ?auto_770369 ) ) ( not ( = ?auto_770363 ?auto_770370 ) ) ( not ( = ?auto_770363 ?auto_770371 ) ) ( not ( = ?auto_770364 ?auto_770365 ) ) ( not ( = ?auto_770364 ?auto_770366 ) ) ( not ( = ?auto_770364 ?auto_770367 ) ) ( not ( = ?auto_770364 ?auto_770368 ) ) ( not ( = ?auto_770364 ?auto_770369 ) ) ( not ( = ?auto_770364 ?auto_770370 ) ) ( not ( = ?auto_770364 ?auto_770371 ) ) ( not ( = ?auto_770365 ?auto_770366 ) ) ( not ( = ?auto_770365 ?auto_770367 ) ) ( not ( = ?auto_770365 ?auto_770368 ) ) ( not ( = ?auto_770365 ?auto_770369 ) ) ( not ( = ?auto_770365 ?auto_770370 ) ) ( not ( = ?auto_770365 ?auto_770371 ) ) ( not ( = ?auto_770366 ?auto_770367 ) ) ( not ( = ?auto_770366 ?auto_770368 ) ) ( not ( = ?auto_770366 ?auto_770369 ) ) ( not ( = ?auto_770366 ?auto_770370 ) ) ( not ( = ?auto_770366 ?auto_770371 ) ) ( not ( = ?auto_770367 ?auto_770368 ) ) ( not ( = ?auto_770367 ?auto_770369 ) ) ( not ( = ?auto_770367 ?auto_770370 ) ) ( not ( = ?auto_770367 ?auto_770371 ) ) ( not ( = ?auto_770368 ?auto_770369 ) ) ( not ( = ?auto_770368 ?auto_770370 ) ) ( not ( = ?auto_770368 ?auto_770371 ) ) ( not ( = ?auto_770369 ?auto_770370 ) ) ( not ( = ?auto_770369 ?auto_770371 ) ) ( not ( = ?auto_770370 ?auto_770371 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_770370 ?auto_770371 )
      ( !STACK ?auto_770370 ?auto_770369 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_770418 - BLOCK
      ?auto_770419 - BLOCK
      ?auto_770420 - BLOCK
      ?auto_770421 - BLOCK
      ?auto_770422 - BLOCK
      ?auto_770423 - BLOCK
      ?auto_770424 - BLOCK
      ?auto_770425 - BLOCK
      ?auto_770426 - BLOCK
      ?auto_770427 - BLOCK
      ?auto_770428 - BLOCK
      ?auto_770429 - BLOCK
      ?auto_770430 - BLOCK
      ?auto_770431 - BLOCK
      ?auto_770432 - BLOCK
    )
    :vars
    (
      ?auto_770433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770432 ?auto_770433 ) ( ON-TABLE ?auto_770418 ) ( ON ?auto_770419 ?auto_770418 ) ( ON ?auto_770420 ?auto_770419 ) ( ON ?auto_770421 ?auto_770420 ) ( ON ?auto_770422 ?auto_770421 ) ( ON ?auto_770423 ?auto_770422 ) ( ON ?auto_770424 ?auto_770423 ) ( ON ?auto_770425 ?auto_770424 ) ( ON ?auto_770426 ?auto_770425 ) ( ON ?auto_770427 ?auto_770426 ) ( ON ?auto_770428 ?auto_770427 ) ( ON ?auto_770429 ?auto_770428 ) ( ON ?auto_770430 ?auto_770429 ) ( not ( = ?auto_770418 ?auto_770419 ) ) ( not ( = ?auto_770418 ?auto_770420 ) ) ( not ( = ?auto_770418 ?auto_770421 ) ) ( not ( = ?auto_770418 ?auto_770422 ) ) ( not ( = ?auto_770418 ?auto_770423 ) ) ( not ( = ?auto_770418 ?auto_770424 ) ) ( not ( = ?auto_770418 ?auto_770425 ) ) ( not ( = ?auto_770418 ?auto_770426 ) ) ( not ( = ?auto_770418 ?auto_770427 ) ) ( not ( = ?auto_770418 ?auto_770428 ) ) ( not ( = ?auto_770418 ?auto_770429 ) ) ( not ( = ?auto_770418 ?auto_770430 ) ) ( not ( = ?auto_770418 ?auto_770431 ) ) ( not ( = ?auto_770418 ?auto_770432 ) ) ( not ( = ?auto_770418 ?auto_770433 ) ) ( not ( = ?auto_770419 ?auto_770420 ) ) ( not ( = ?auto_770419 ?auto_770421 ) ) ( not ( = ?auto_770419 ?auto_770422 ) ) ( not ( = ?auto_770419 ?auto_770423 ) ) ( not ( = ?auto_770419 ?auto_770424 ) ) ( not ( = ?auto_770419 ?auto_770425 ) ) ( not ( = ?auto_770419 ?auto_770426 ) ) ( not ( = ?auto_770419 ?auto_770427 ) ) ( not ( = ?auto_770419 ?auto_770428 ) ) ( not ( = ?auto_770419 ?auto_770429 ) ) ( not ( = ?auto_770419 ?auto_770430 ) ) ( not ( = ?auto_770419 ?auto_770431 ) ) ( not ( = ?auto_770419 ?auto_770432 ) ) ( not ( = ?auto_770419 ?auto_770433 ) ) ( not ( = ?auto_770420 ?auto_770421 ) ) ( not ( = ?auto_770420 ?auto_770422 ) ) ( not ( = ?auto_770420 ?auto_770423 ) ) ( not ( = ?auto_770420 ?auto_770424 ) ) ( not ( = ?auto_770420 ?auto_770425 ) ) ( not ( = ?auto_770420 ?auto_770426 ) ) ( not ( = ?auto_770420 ?auto_770427 ) ) ( not ( = ?auto_770420 ?auto_770428 ) ) ( not ( = ?auto_770420 ?auto_770429 ) ) ( not ( = ?auto_770420 ?auto_770430 ) ) ( not ( = ?auto_770420 ?auto_770431 ) ) ( not ( = ?auto_770420 ?auto_770432 ) ) ( not ( = ?auto_770420 ?auto_770433 ) ) ( not ( = ?auto_770421 ?auto_770422 ) ) ( not ( = ?auto_770421 ?auto_770423 ) ) ( not ( = ?auto_770421 ?auto_770424 ) ) ( not ( = ?auto_770421 ?auto_770425 ) ) ( not ( = ?auto_770421 ?auto_770426 ) ) ( not ( = ?auto_770421 ?auto_770427 ) ) ( not ( = ?auto_770421 ?auto_770428 ) ) ( not ( = ?auto_770421 ?auto_770429 ) ) ( not ( = ?auto_770421 ?auto_770430 ) ) ( not ( = ?auto_770421 ?auto_770431 ) ) ( not ( = ?auto_770421 ?auto_770432 ) ) ( not ( = ?auto_770421 ?auto_770433 ) ) ( not ( = ?auto_770422 ?auto_770423 ) ) ( not ( = ?auto_770422 ?auto_770424 ) ) ( not ( = ?auto_770422 ?auto_770425 ) ) ( not ( = ?auto_770422 ?auto_770426 ) ) ( not ( = ?auto_770422 ?auto_770427 ) ) ( not ( = ?auto_770422 ?auto_770428 ) ) ( not ( = ?auto_770422 ?auto_770429 ) ) ( not ( = ?auto_770422 ?auto_770430 ) ) ( not ( = ?auto_770422 ?auto_770431 ) ) ( not ( = ?auto_770422 ?auto_770432 ) ) ( not ( = ?auto_770422 ?auto_770433 ) ) ( not ( = ?auto_770423 ?auto_770424 ) ) ( not ( = ?auto_770423 ?auto_770425 ) ) ( not ( = ?auto_770423 ?auto_770426 ) ) ( not ( = ?auto_770423 ?auto_770427 ) ) ( not ( = ?auto_770423 ?auto_770428 ) ) ( not ( = ?auto_770423 ?auto_770429 ) ) ( not ( = ?auto_770423 ?auto_770430 ) ) ( not ( = ?auto_770423 ?auto_770431 ) ) ( not ( = ?auto_770423 ?auto_770432 ) ) ( not ( = ?auto_770423 ?auto_770433 ) ) ( not ( = ?auto_770424 ?auto_770425 ) ) ( not ( = ?auto_770424 ?auto_770426 ) ) ( not ( = ?auto_770424 ?auto_770427 ) ) ( not ( = ?auto_770424 ?auto_770428 ) ) ( not ( = ?auto_770424 ?auto_770429 ) ) ( not ( = ?auto_770424 ?auto_770430 ) ) ( not ( = ?auto_770424 ?auto_770431 ) ) ( not ( = ?auto_770424 ?auto_770432 ) ) ( not ( = ?auto_770424 ?auto_770433 ) ) ( not ( = ?auto_770425 ?auto_770426 ) ) ( not ( = ?auto_770425 ?auto_770427 ) ) ( not ( = ?auto_770425 ?auto_770428 ) ) ( not ( = ?auto_770425 ?auto_770429 ) ) ( not ( = ?auto_770425 ?auto_770430 ) ) ( not ( = ?auto_770425 ?auto_770431 ) ) ( not ( = ?auto_770425 ?auto_770432 ) ) ( not ( = ?auto_770425 ?auto_770433 ) ) ( not ( = ?auto_770426 ?auto_770427 ) ) ( not ( = ?auto_770426 ?auto_770428 ) ) ( not ( = ?auto_770426 ?auto_770429 ) ) ( not ( = ?auto_770426 ?auto_770430 ) ) ( not ( = ?auto_770426 ?auto_770431 ) ) ( not ( = ?auto_770426 ?auto_770432 ) ) ( not ( = ?auto_770426 ?auto_770433 ) ) ( not ( = ?auto_770427 ?auto_770428 ) ) ( not ( = ?auto_770427 ?auto_770429 ) ) ( not ( = ?auto_770427 ?auto_770430 ) ) ( not ( = ?auto_770427 ?auto_770431 ) ) ( not ( = ?auto_770427 ?auto_770432 ) ) ( not ( = ?auto_770427 ?auto_770433 ) ) ( not ( = ?auto_770428 ?auto_770429 ) ) ( not ( = ?auto_770428 ?auto_770430 ) ) ( not ( = ?auto_770428 ?auto_770431 ) ) ( not ( = ?auto_770428 ?auto_770432 ) ) ( not ( = ?auto_770428 ?auto_770433 ) ) ( not ( = ?auto_770429 ?auto_770430 ) ) ( not ( = ?auto_770429 ?auto_770431 ) ) ( not ( = ?auto_770429 ?auto_770432 ) ) ( not ( = ?auto_770429 ?auto_770433 ) ) ( not ( = ?auto_770430 ?auto_770431 ) ) ( not ( = ?auto_770430 ?auto_770432 ) ) ( not ( = ?auto_770430 ?auto_770433 ) ) ( not ( = ?auto_770431 ?auto_770432 ) ) ( not ( = ?auto_770431 ?auto_770433 ) ) ( not ( = ?auto_770432 ?auto_770433 ) ) ( CLEAR ?auto_770430 ) ( ON ?auto_770431 ?auto_770432 ) ( CLEAR ?auto_770431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_770418 ?auto_770419 ?auto_770420 ?auto_770421 ?auto_770422 ?auto_770423 ?auto_770424 ?auto_770425 ?auto_770426 ?auto_770427 ?auto_770428 ?auto_770429 ?auto_770430 ?auto_770431 )
      ( MAKE-15PILE ?auto_770418 ?auto_770419 ?auto_770420 ?auto_770421 ?auto_770422 ?auto_770423 ?auto_770424 ?auto_770425 ?auto_770426 ?auto_770427 ?auto_770428 ?auto_770429 ?auto_770430 ?auto_770431 ?auto_770432 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_770480 - BLOCK
      ?auto_770481 - BLOCK
      ?auto_770482 - BLOCK
      ?auto_770483 - BLOCK
      ?auto_770484 - BLOCK
      ?auto_770485 - BLOCK
      ?auto_770486 - BLOCK
      ?auto_770487 - BLOCK
      ?auto_770488 - BLOCK
      ?auto_770489 - BLOCK
      ?auto_770490 - BLOCK
      ?auto_770491 - BLOCK
      ?auto_770492 - BLOCK
      ?auto_770493 - BLOCK
      ?auto_770494 - BLOCK
    )
    :vars
    (
      ?auto_770495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770494 ?auto_770495 ) ( ON-TABLE ?auto_770480 ) ( ON ?auto_770481 ?auto_770480 ) ( ON ?auto_770482 ?auto_770481 ) ( ON ?auto_770483 ?auto_770482 ) ( ON ?auto_770484 ?auto_770483 ) ( ON ?auto_770485 ?auto_770484 ) ( ON ?auto_770486 ?auto_770485 ) ( ON ?auto_770487 ?auto_770486 ) ( ON ?auto_770488 ?auto_770487 ) ( ON ?auto_770489 ?auto_770488 ) ( ON ?auto_770490 ?auto_770489 ) ( ON ?auto_770491 ?auto_770490 ) ( not ( = ?auto_770480 ?auto_770481 ) ) ( not ( = ?auto_770480 ?auto_770482 ) ) ( not ( = ?auto_770480 ?auto_770483 ) ) ( not ( = ?auto_770480 ?auto_770484 ) ) ( not ( = ?auto_770480 ?auto_770485 ) ) ( not ( = ?auto_770480 ?auto_770486 ) ) ( not ( = ?auto_770480 ?auto_770487 ) ) ( not ( = ?auto_770480 ?auto_770488 ) ) ( not ( = ?auto_770480 ?auto_770489 ) ) ( not ( = ?auto_770480 ?auto_770490 ) ) ( not ( = ?auto_770480 ?auto_770491 ) ) ( not ( = ?auto_770480 ?auto_770492 ) ) ( not ( = ?auto_770480 ?auto_770493 ) ) ( not ( = ?auto_770480 ?auto_770494 ) ) ( not ( = ?auto_770480 ?auto_770495 ) ) ( not ( = ?auto_770481 ?auto_770482 ) ) ( not ( = ?auto_770481 ?auto_770483 ) ) ( not ( = ?auto_770481 ?auto_770484 ) ) ( not ( = ?auto_770481 ?auto_770485 ) ) ( not ( = ?auto_770481 ?auto_770486 ) ) ( not ( = ?auto_770481 ?auto_770487 ) ) ( not ( = ?auto_770481 ?auto_770488 ) ) ( not ( = ?auto_770481 ?auto_770489 ) ) ( not ( = ?auto_770481 ?auto_770490 ) ) ( not ( = ?auto_770481 ?auto_770491 ) ) ( not ( = ?auto_770481 ?auto_770492 ) ) ( not ( = ?auto_770481 ?auto_770493 ) ) ( not ( = ?auto_770481 ?auto_770494 ) ) ( not ( = ?auto_770481 ?auto_770495 ) ) ( not ( = ?auto_770482 ?auto_770483 ) ) ( not ( = ?auto_770482 ?auto_770484 ) ) ( not ( = ?auto_770482 ?auto_770485 ) ) ( not ( = ?auto_770482 ?auto_770486 ) ) ( not ( = ?auto_770482 ?auto_770487 ) ) ( not ( = ?auto_770482 ?auto_770488 ) ) ( not ( = ?auto_770482 ?auto_770489 ) ) ( not ( = ?auto_770482 ?auto_770490 ) ) ( not ( = ?auto_770482 ?auto_770491 ) ) ( not ( = ?auto_770482 ?auto_770492 ) ) ( not ( = ?auto_770482 ?auto_770493 ) ) ( not ( = ?auto_770482 ?auto_770494 ) ) ( not ( = ?auto_770482 ?auto_770495 ) ) ( not ( = ?auto_770483 ?auto_770484 ) ) ( not ( = ?auto_770483 ?auto_770485 ) ) ( not ( = ?auto_770483 ?auto_770486 ) ) ( not ( = ?auto_770483 ?auto_770487 ) ) ( not ( = ?auto_770483 ?auto_770488 ) ) ( not ( = ?auto_770483 ?auto_770489 ) ) ( not ( = ?auto_770483 ?auto_770490 ) ) ( not ( = ?auto_770483 ?auto_770491 ) ) ( not ( = ?auto_770483 ?auto_770492 ) ) ( not ( = ?auto_770483 ?auto_770493 ) ) ( not ( = ?auto_770483 ?auto_770494 ) ) ( not ( = ?auto_770483 ?auto_770495 ) ) ( not ( = ?auto_770484 ?auto_770485 ) ) ( not ( = ?auto_770484 ?auto_770486 ) ) ( not ( = ?auto_770484 ?auto_770487 ) ) ( not ( = ?auto_770484 ?auto_770488 ) ) ( not ( = ?auto_770484 ?auto_770489 ) ) ( not ( = ?auto_770484 ?auto_770490 ) ) ( not ( = ?auto_770484 ?auto_770491 ) ) ( not ( = ?auto_770484 ?auto_770492 ) ) ( not ( = ?auto_770484 ?auto_770493 ) ) ( not ( = ?auto_770484 ?auto_770494 ) ) ( not ( = ?auto_770484 ?auto_770495 ) ) ( not ( = ?auto_770485 ?auto_770486 ) ) ( not ( = ?auto_770485 ?auto_770487 ) ) ( not ( = ?auto_770485 ?auto_770488 ) ) ( not ( = ?auto_770485 ?auto_770489 ) ) ( not ( = ?auto_770485 ?auto_770490 ) ) ( not ( = ?auto_770485 ?auto_770491 ) ) ( not ( = ?auto_770485 ?auto_770492 ) ) ( not ( = ?auto_770485 ?auto_770493 ) ) ( not ( = ?auto_770485 ?auto_770494 ) ) ( not ( = ?auto_770485 ?auto_770495 ) ) ( not ( = ?auto_770486 ?auto_770487 ) ) ( not ( = ?auto_770486 ?auto_770488 ) ) ( not ( = ?auto_770486 ?auto_770489 ) ) ( not ( = ?auto_770486 ?auto_770490 ) ) ( not ( = ?auto_770486 ?auto_770491 ) ) ( not ( = ?auto_770486 ?auto_770492 ) ) ( not ( = ?auto_770486 ?auto_770493 ) ) ( not ( = ?auto_770486 ?auto_770494 ) ) ( not ( = ?auto_770486 ?auto_770495 ) ) ( not ( = ?auto_770487 ?auto_770488 ) ) ( not ( = ?auto_770487 ?auto_770489 ) ) ( not ( = ?auto_770487 ?auto_770490 ) ) ( not ( = ?auto_770487 ?auto_770491 ) ) ( not ( = ?auto_770487 ?auto_770492 ) ) ( not ( = ?auto_770487 ?auto_770493 ) ) ( not ( = ?auto_770487 ?auto_770494 ) ) ( not ( = ?auto_770487 ?auto_770495 ) ) ( not ( = ?auto_770488 ?auto_770489 ) ) ( not ( = ?auto_770488 ?auto_770490 ) ) ( not ( = ?auto_770488 ?auto_770491 ) ) ( not ( = ?auto_770488 ?auto_770492 ) ) ( not ( = ?auto_770488 ?auto_770493 ) ) ( not ( = ?auto_770488 ?auto_770494 ) ) ( not ( = ?auto_770488 ?auto_770495 ) ) ( not ( = ?auto_770489 ?auto_770490 ) ) ( not ( = ?auto_770489 ?auto_770491 ) ) ( not ( = ?auto_770489 ?auto_770492 ) ) ( not ( = ?auto_770489 ?auto_770493 ) ) ( not ( = ?auto_770489 ?auto_770494 ) ) ( not ( = ?auto_770489 ?auto_770495 ) ) ( not ( = ?auto_770490 ?auto_770491 ) ) ( not ( = ?auto_770490 ?auto_770492 ) ) ( not ( = ?auto_770490 ?auto_770493 ) ) ( not ( = ?auto_770490 ?auto_770494 ) ) ( not ( = ?auto_770490 ?auto_770495 ) ) ( not ( = ?auto_770491 ?auto_770492 ) ) ( not ( = ?auto_770491 ?auto_770493 ) ) ( not ( = ?auto_770491 ?auto_770494 ) ) ( not ( = ?auto_770491 ?auto_770495 ) ) ( not ( = ?auto_770492 ?auto_770493 ) ) ( not ( = ?auto_770492 ?auto_770494 ) ) ( not ( = ?auto_770492 ?auto_770495 ) ) ( not ( = ?auto_770493 ?auto_770494 ) ) ( not ( = ?auto_770493 ?auto_770495 ) ) ( not ( = ?auto_770494 ?auto_770495 ) ) ( ON ?auto_770493 ?auto_770494 ) ( CLEAR ?auto_770491 ) ( ON ?auto_770492 ?auto_770493 ) ( CLEAR ?auto_770492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_770480 ?auto_770481 ?auto_770482 ?auto_770483 ?auto_770484 ?auto_770485 ?auto_770486 ?auto_770487 ?auto_770488 ?auto_770489 ?auto_770490 ?auto_770491 ?auto_770492 )
      ( MAKE-15PILE ?auto_770480 ?auto_770481 ?auto_770482 ?auto_770483 ?auto_770484 ?auto_770485 ?auto_770486 ?auto_770487 ?auto_770488 ?auto_770489 ?auto_770490 ?auto_770491 ?auto_770492 ?auto_770493 ?auto_770494 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_770542 - BLOCK
      ?auto_770543 - BLOCK
      ?auto_770544 - BLOCK
      ?auto_770545 - BLOCK
      ?auto_770546 - BLOCK
      ?auto_770547 - BLOCK
      ?auto_770548 - BLOCK
      ?auto_770549 - BLOCK
      ?auto_770550 - BLOCK
      ?auto_770551 - BLOCK
      ?auto_770552 - BLOCK
      ?auto_770553 - BLOCK
      ?auto_770554 - BLOCK
      ?auto_770555 - BLOCK
      ?auto_770556 - BLOCK
    )
    :vars
    (
      ?auto_770557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770556 ?auto_770557 ) ( ON-TABLE ?auto_770542 ) ( ON ?auto_770543 ?auto_770542 ) ( ON ?auto_770544 ?auto_770543 ) ( ON ?auto_770545 ?auto_770544 ) ( ON ?auto_770546 ?auto_770545 ) ( ON ?auto_770547 ?auto_770546 ) ( ON ?auto_770548 ?auto_770547 ) ( ON ?auto_770549 ?auto_770548 ) ( ON ?auto_770550 ?auto_770549 ) ( ON ?auto_770551 ?auto_770550 ) ( ON ?auto_770552 ?auto_770551 ) ( not ( = ?auto_770542 ?auto_770543 ) ) ( not ( = ?auto_770542 ?auto_770544 ) ) ( not ( = ?auto_770542 ?auto_770545 ) ) ( not ( = ?auto_770542 ?auto_770546 ) ) ( not ( = ?auto_770542 ?auto_770547 ) ) ( not ( = ?auto_770542 ?auto_770548 ) ) ( not ( = ?auto_770542 ?auto_770549 ) ) ( not ( = ?auto_770542 ?auto_770550 ) ) ( not ( = ?auto_770542 ?auto_770551 ) ) ( not ( = ?auto_770542 ?auto_770552 ) ) ( not ( = ?auto_770542 ?auto_770553 ) ) ( not ( = ?auto_770542 ?auto_770554 ) ) ( not ( = ?auto_770542 ?auto_770555 ) ) ( not ( = ?auto_770542 ?auto_770556 ) ) ( not ( = ?auto_770542 ?auto_770557 ) ) ( not ( = ?auto_770543 ?auto_770544 ) ) ( not ( = ?auto_770543 ?auto_770545 ) ) ( not ( = ?auto_770543 ?auto_770546 ) ) ( not ( = ?auto_770543 ?auto_770547 ) ) ( not ( = ?auto_770543 ?auto_770548 ) ) ( not ( = ?auto_770543 ?auto_770549 ) ) ( not ( = ?auto_770543 ?auto_770550 ) ) ( not ( = ?auto_770543 ?auto_770551 ) ) ( not ( = ?auto_770543 ?auto_770552 ) ) ( not ( = ?auto_770543 ?auto_770553 ) ) ( not ( = ?auto_770543 ?auto_770554 ) ) ( not ( = ?auto_770543 ?auto_770555 ) ) ( not ( = ?auto_770543 ?auto_770556 ) ) ( not ( = ?auto_770543 ?auto_770557 ) ) ( not ( = ?auto_770544 ?auto_770545 ) ) ( not ( = ?auto_770544 ?auto_770546 ) ) ( not ( = ?auto_770544 ?auto_770547 ) ) ( not ( = ?auto_770544 ?auto_770548 ) ) ( not ( = ?auto_770544 ?auto_770549 ) ) ( not ( = ?auto_770544 ?auto_770550 ) ) ( not ( = ?auto_770544 ?auto_770551 ) ) ( not ( = ?auto_770544 ?auto_770552 ) ) ( not ( = ?auto_770544 ?auto_770553 ) ) ( not ( = ?auto_770544 ?auto_770554 ) ) ( not ( = ?auto_770544 ?auto_770555 ) ) ( not ( = ?auto_770544 ?auto_770556 ) ) ( not ( = ?auto_770544 ?auto_770557 ) ) ( not ( = ?auto_770545 ?auto_770546 ) ) ( not ( = ?auto_770545 ?auto_770547 ) ) ( not ( = ?auto_770545 ?auto_770548 ) ) ( not ( = ?auto_770545 ?auto_770549 ) ) ( not ( = ?auto_770545 ?auto_770550 ) ) ( not ( = ?auto_770545 ?auto_770551 ) ) ( not ( = ?auto_770545 ?auto_770552 ) ) ( not ( = ?auto_770545 ?auto_770553 ) ) ( not ( = ?auto_770545 ?auto_770554 ) ) ( not ( = ?auto_770545 ?auto_770555 ) ) ( not ( = ?auto_770545 ?auto_770556 ) ) ( not ( = ?auto_770545 ?auto_770557 ) ) ( not ( = ?auto_770546 ?auto_770547 ) ) ( not ( = ?auto_770546 ?auto_770548 ) ) ( not ( = ?auto_770546 ?auto_770549 ) ) ( not ( = ?auto_770546 ?auto_770550 ) ) ( not ( = ?auto_770546 ?auto_770551 ) ) ( not ( = ?auto_770546 ?auto_770552 ) ) ( not ( = ?auto_770546 ?auto_770553 ) ) ( not ( = ?auto_770546 ?auto_770554 ) ) ( not ( = ?auto_770546 ?auto_770555 ) ) ( not ( = ?auto_770546 ?auto_770556 ) ) ( not ( = ?auto_770546 ?auto_770557 ) ) ( not ( = ?auto_770547 ?auto_770548 ) ) ( not ( = ?auto_770547 ?auto_770549 ) ) ( not ( = ?auto_770547 ?auto_770550 ) ) ( not ( = ?auto_770547 ?auto_770551 ) ) ( not ( = ?auto_770547 ?auto_770552 ) ) ( not ( = ?auto_770547 ?auto_770553 ) ) ( not ( = ?auto_770547 ?auto_770554 ) ) ( not ( = ?auto_770547 ?auto_770555 ) ) ( not ( = ?auto_770547 ?auto_770556 ) ) ( not ( = ?auto_770547 ?auto_770557 ) ) ( not ( = ?auto_770548 ?auto_770549 ) ) ( not ( = ?auto_770548 ?auto_770550 ) ) ( not ( = ?auto_770548 ?auto_770551 ) ) ( not ( = ?auto_770548 ?auto_770552 ) ) ( not ( = ?auto_770548 ?auto_770553 ) ) ( not ( = ?auto_770548 ?auto_770554 ) ) ( not ( = ?auto_770548 ?auto_770555 ) ) ( not ( = ?auto_770548 ?auto_770556 ) ) ( not ( = ?auto_770548 ?auto_770557 ) ) ( not ( = ?auto_770549 ?auto_770550 ) ) ( not ( = ?auto_770549 ?auto_770551 ) ) ( not ( = ?auto_770549 ?auto_770552 ) ) ( not ( = ?auto_770549 ?auto_770553 ) ) ( not ( = ?auto_770549 ?auto_770554 ) ) ( not ( = ?auto_770549 ?auto_770555 ) ) ( not ( = ?auto_770549 ?auto_770556 ) ) ( not ( = ?auto_770549 ?auto_770557 ) ) ( not ( = ?auto_770550 ?auto_770551 ) ) ( not ( = ?auto_770550 ?auto_770552 ) ) ( not ( = ?auto_770550 ?auto_770553 ) ) ( not ( = ?auto_770550 ?auto_770554 ) ) ( not ( = ?auto_770550 ?auto_770555 ) ) ( not ( = ?auto_770550 ?auto_770556 ) ) ( not ( = ?auto_770550 ?auto_770557 ) ) ( not ( = ?auto_770551 ?auto_770552 ) ) ( not ( = ?auto_770551 ?auto_770553 ) ) ( not ( = ?auto_770551 ?auto_770554 ) ) ( not ( = ?auto_770551 ?auto_770555 ) ) ( not ( = ?auto_770551 ?auto_770556 ) ) ( not ( = ?auto_770551 ?auto_770557 ) ) ( not ( = ?auto_770552 ?auto_770553 ) ) ( not ( = ?auto_770552 ?auto_770554 ) ) ( not ( = ?auto_770552 ?auto_770555 ) ) ( not ( = ?auto_770552 ?auto_770556 ) ) ( not ( = ?auto_770552 ?auto_770557 ) ) ( not ( = ?auto_770553 ?auto_770554 ) ) ( not ( = ?auto_770553 ?auto_770555 ) ) ( not ( = ?auto_770553 ?auto_770556 ) ) ( not ( = ?auto_770553 ?auto_770557 ) ) ( not ( = ?auto_770554 ?auto_770555 ) ) ( not ( = ?auto_770554 ?auto_770556 ) ) ( not ( = ?auto_770554 ?auto_770557 ) ) ( not ( = ?auto_770555 ?auto_770556 ) ) ( not ( = ?auto_770555 ?auto_770557 ) ) ( not ( = ?auto_770556 ?auto_770557 ) ) ( ON ?auto_770555 ?auto_770556 ) ( ON ?auto_770554 ?auto_770555 ) ( CLEAR ?auto_770552 ) ( ON ?auto_770553 ?auto_770554 ) ( CLEAR ?auto_770553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_770542 ?auto_770543 ?auto_770544 ?auto_770545 ?auto_770546 ?auto_770547 ?auto_770548 ?auto_770549 ?auto_770550 ?auto_770551 ?auto_770552 ?auto_770553 )
      ( MAKE-15PILE ?auto_770542 ?auto_770543 ?auto_770544 ?auto_770545 ?auto_770546 ?auto_770547 ?auto_770548 ?auto_770549 ?auto_770550 ?auto_770551 ?auto_770552 ?auto_770553 ?auto_770554 ?auto_770555 ?auto_770556 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_770604 - BLOCK
      ?auto_770605 - BLOCK
      ?auto_770606 - BLOCK
      ?auto_770607 - BLOCK
      ?auto_770608 - BLOCK
      ?auto_770609 - BLOCK
      ?auto_770610 - BLOCK
      ?auto_770611 - BLOCK
      ?auto_770612 - BLOCK
      ?auto_770613 - BLOCK
      ?auto_770614 - BLOCK
      ?auto_770615 - BLOCK
      ?auto_770616 - BLOCK
      ?auto_770617 - BLOCK
      ?auto_770618 - BLOCK
    )
    :vars
    (
      ?auto_770619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770618 ?auto_770619 ) ( ON-TABLE ?auto_770604 ) ( ON ?auto_770605 ?auto_770604 ) ( ON ?auto_770606 ?auto_770605 ) ( ON ?auto_770607 ?auto_770606 ) ( ON ?auto_770608 ?auto_770607 ) ( ON ?auto_770609 ?auto_770608 ) ( ON ?auto_770610 ?auto_770609 ) ( ON ?auto_770611 ?auto_770610 ) ( ON ?auto_770612 ?auto_770611 ) ( ON ?auto_770613 ?auto_770612 ) ( not ( = ?auto_770604 ?auto_770605 ) ) ( not ( = ?auto_770604 ?auto_770606 ) ) ( not ( = ?auto_770604 ?auto_770607 ) ) ( not ( = ?auto_770604 ?auto_770608 ) ) ( not ( = ?auto_770604 ?auto_770609 ) ) ( not ( = ?auto_770604 ?auto_770610 ) ) ( not ( = ?auto_770604 ?auto_770611 ) ) ( not ( = ?auto_770604 ?auto_770612 ) ) ( not ( = ?auto_770604 ?auto_770613 ) ) ( not ( = ?auto_770604 ?auto_770614 ) ) ( not ( = ?auto_770604 ?auto_770615 ) ) ( not ( = ?auto_770604 ?auto_770616 ) ) ( not ( = ?auto_770604 ?auto_770617 ) ) ( not ( = ?auto_770604 ?auto_770618 ) ) ( not ( = ?auto_770604 ?auto_770619 ) ) ( not ( = ?auto_770605 ?auto_770606 ) ) ( not ( = ?auto_770605 ?auto_770607 ) ) ( not ( = ?auto_770605 ?auto_770608 ) ) ( not ( = ?auto_770605 ?auto_770609 ) ) ( not ( = ?auto_770605 ?auto_770610 ) ) ( not ( = ?auto_770605 ?auto_770611 ) ) ( not ( = ?auto_770605 ?auto_770612 ) ) ( not ( = ?auto_770605 ?auto_770613 ) ) ( not ( = ?auto_770605 ?auto_770614 ) ) ( not ( = ?auto_770605 ?auto_770615 ) ) ( not ( = ?auto_770605 ?auto_770616 ) ) ( not ( = ?auto_770605 ?auto_770617 ) ) ( not ( = ?auto_770605 ?auto_770618 ) ) ( not ( = ?auto_770605 ?auto_770619 ) ) ( not ( = ?auto_770606 ?auto_770607 ) ) ( not ( = ?auto_770606 ?auto_770608 ) ) ( not ( = ?auto_770606 ?auto_770609 ) ) ( not ( = ?auto_770606 ?auto_770610 ) ) ( not ( = ?auto_770606 ?auto_770611 ) ) ( not ( = ?auto_770606 ?auto_770612 ) ) ( not ( = ?auto_770606 ?auto_770613 ) ) ( not ( = ?auto_770606 ?auto_770614 ) ) ( not ( = ?auto_770606 ?auto_770615 ) ) ( not ( = ?auto_770606 ?auto_770616 ) ) ( not ( = ?auto_770606 ?auto_770617 ) ) ( not ( = ?auto_770606 ?auto_770618 ) ) ( not ( = ?auto_770606 ?auto_770619 ) ) ( not ( = ?auto_770607 ?auto_770608 ) ) ( not ( = ?auto_770607 ?auto_770609 ) ) ( not ( = ?auto_770607 ?auto_770610 ) ) ( not ( = ?auto_770607 ?auto_770611 ) ) ( not ( = ?auto_770607 ?auto_770612 ) ) ( not ( = ?auto_770607 ?auto_770613 ) ) ( not ( = ?auto_770607 ?auto_770614 ) ) ( not ( = ?auto_770607 ?auto_770615 ) ) ( not ( = ?auto_770607 ?auto_770616 ) ) ( not ( = ?auto_770607 ?auto_770617 ) ) ( not ( = ?auto_770607 ?auto_770618 ) ) ( not ( = ?auto_770607 ?auto_770619 ) ) ( not ( = ?auto_770608 ?auto_770609 ) ) ( not ( = ?auto_770608 ?auto_770610 ) ) ( not ( = ?auto_770608 ?auto_770611 ) ) ( not ( = ?auto_770608 ?auto_770612 ) ) ( not ( = ?auto_770608 ?auto_770613 ) ) ( not ( = ?auto_770608 ?auto_770614 ) ) ( not ( = ?auto_770608 ?auto_770615 ) ) ( not ( = ?auto_770608 ?auto_770616 ) ) ( not ( = ?auto_770608 ?auto_770617 ) ) ( not ( = ?auto_770608 ?auto_770618 ) ) ( not ( = ?auto_770608 ?auto_770619 ) ) ( not ( = ?auto_770609 ?auto_770610 ) ) ( not ( = ?auto_770609 ?auto_770611 ) ) ( not ( = ?auto_770609 ?auto_770612 ) ) ( not ( = ?auto_770609 ?auto_770613 ) ) ( not ( = ?auto_770609 ?auto_770614 ) ) ( not ( = ?auto_770609 ?auto_770615 ) ) ( not ( = ?auto_770609 ?auto_770616 ) ) ( not ( = ?auto_770609 ?auto_770617 ) ) ( not ( = ?auto_770609 ?auto_770618 ) ) ( not ( = ?auto_770609 ?auto_770619 ) ) ( not ( = ?auto_770610 ?auto_770611 ) ) ( not ( = ?auto_770610 ?auto_770612 ) ) ( not ( = ?auto_770610 ?auto_770613 ) ) ( not ( = ?auto_770610 ?auto_770614 ) ) ( not ( = ?auto_770610 ?auto_770615 ) ) ( not ( = ?auto_770610 ?auto_770616 ) ) ( not ( = ?auto_770610 ?auto_770617 ) ) ( not ( = ?auto_770610 ?auto_770618 ) ) ( not ( = ?auto_770610 ?auto_770619 ) ) ( not ( = ?auto_770611 ?auto_770612 ) ) ( not ( = ?auto_770611 ?auto_770613 ) ) ( not ( = ?auto_770611 ?auto_770614 ) ) ( not ( = ?auto_770611 ?auto_770615 ) ) ( not ( = ?auto_770611 ?auto_770616 ) ) ( not ( = ?auto_770611 ?auto_770617 ) ) ( not ( = ?auto_770611 ?auto_770618 ) ) ( not ( = ?auto_770611 ?auto_770619 ) ) ( not ( = ?auto_770612 ?auto_770613 ) ) ( not ( = ?auto_770612 ?auto_770614 ) ) ( not ( = ?auto_770612 ?auto_770615 ) ) ( not ( = ?auto_770612 ?auto_770616 ) ) ( not ( = ?auto_770612 ?auto_770617 ) ) ( not ( = ?auto_770612 ?auto_770618 ) ) ( not ( = ?auto_770612 ?auto_770619 ) ) ( not ( = ?auto_770613 ?auto_770614 ) ) ( not ( = ?auto_770613 ?auto_770615 ) ) ( not ( = ?auto_770613 ?auto_770616 ) ) ( not ( = ?auto_770613 ?auto_770617 ) ) ( not ( = ?auto_770613 ?auto_770618 ) ) ( not ( = ?auto_770613 ?auto_770619 ) ) ( not ( = ?auto_770614 ?auto_770615 ) ) ( not ( = ?auto_770614 ?auto_770616 ) ) ( not ( = ?auto_770614 ?auto_770617 ) ) ( not ( = ?auto_770614 ?auto_770618 ) ) ( not ( = ?auto_770614 ?auto_770619 ) ) ( not ( = ?auto_770615 ?auto_770616 ) ) ( not ( = ?auto_770615 ?auto_770617 ) ) ( not ( = ?auto_770615 ?auto_770618 ) ) ( not ( = ?auto_770615 ?auto_770619 ) ) ( not ( = ?auto_770616 ?auto_770617 ) ) ( not ( = ?auto_770616 ?auto_770618 ) ) ( not ( = ?auto_770616 ?auto_770619 ) ) ( not ( = ?auto_770617 ?auto_770618 ) ) ( not ( = ?auto_770617 ?auto_770619 ) ) ( not ( = ?auto_770618 ?auto_770619 ) ) ( ON ?auto_770617 ?auto_770618 ) ( ON ?auto_770616 ?auto_770617 ) ( ON ?auto_770615 ?auto_770616 ) ( CLEAR ?auto_770613 ) ( ON ?auto_770614 ?auto_770615 ) ( CLEAR ?auto_770614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_770604 ?auto_770605 ?auto_770606 ?auto_770607 ?auto_770608 ?auto_770609 ?auto_770610 ?auto_770611 ?auto_770612 ?auto_770613 ?auto_770614 )
      ( MAKE-15PILE ?auto_770604 ?auto_770605 ?auto_770606 ?auto_770607 ?auto_770608 ?auto_770609 ?auto_770610 ?auto_770611 ?auto_770612 ?auto_770613 ?auto_770614 ?auto_770615 ?auto_770616 ?auto_770617 ?auto_770618 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_770666 - BLOCK
      ?auto_770667 - BLOCK
      ?auto_770668 - BLOCK
      ?auto_770669 - BLOCK
      ?auto_770670 - BLOCK
      ?auto_770671 - BLOCK
      ?auto_770672 - BLOCK
      ?auto_770673 - BLOCK
      ?auto_770674 - BLOCK
      ?auto_770675 - BLOCK
      ?auto_770676 - BLOCK
      ?auto_770677 - BLOCK
      ?auto_770678 - BLOCK
      ?auto_770679 - BLOCK
      ?auto_770680 - BLOCK
    )
    :vars
    (
      ?auto_770681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770680 ?auto_770681 ) ( ON-TABLE ?auto_770666 ) ( ON ?auto_770667 ?auto_770666 ) ( ON ?auto_770668 ?auto_770667 ) ( ON ?auto_770669 ?auto_770668 ) ( ON ?auto_770670 ?auto_770669 ) ( ON ?auto_770671 ?auto_770670 ) ( ON ?auto_770672 ?auto_770671 ) ( ON ?auto_770673 ?auto_770672 ) ( ON ?auto_770674 ?auto_770673 ) ( not ( = ?auto_770666 ?auto_770667 ) ) ( not ( = ?auto_770666 ?auto_770668 ) ) ( not ( = ?auto_770666 ?auto_770669 ) ) ( not ( = ?auto_770666 ?auto_770670 ) ) ( not ( = ?auto_770666 ?auto_770671 ) ) ( not ( = ?auto_770666 ?auto_770672 ) ) ( not ( = ?auto_770666 ?auto_770673 ) ) ( not ( = ?auto_770666 ?auto_770674 ) ) ( not ( = ?auto_770666 ?auto_770675 ) ) ( not ( = ?auto_770666 ?auto_770676 ) ) ( not ( = ?auto_770666 ?auto_770677 ) ) ( not ( = ?auto_770666 ?auto_770678 ) ) ( not ( = ?auto_770666 ?auto_770679 ) ) ( not ( = ?auto_770666 ?auto_770680 ) ) ( not ( = ?auto_770666 ?auto_770681 ) ) ( not ( = ?auto_770667 ?auto_770668 ) ) ( not ( = ?auto_770667 ?auto_770669 ) ) ( not ( = ?auto_770667 ?auto_770670 ) ) ( not ( = ?auto_770667 ?auto_770671 ) ) ( not ( = ?auto_770667 ?auto_770672 ) ) ( not ( = ?auto_770667 ?auto_770673 ) ) ( not ( = ?auto_770667 ?auto_770674 ) ) ( not ( = ?auto_770667 ?auto_770675 ) ) ( not ( = ?auto_770667 ?auto_770676 ) ) ( not ( = ?auto_770667 ?auto_770677 ) ) ( not ( = ?auto_770667 ?auto_770678 ) ) ( not ( = ?auto_770667 ?auto_770679 ) ) ( not ( = ?auto_770667 ?auto_770680 ) ) ( not ( = ?auto_770667 ?auto_770681 ) ) ( not ( = ?auto_770668 ?auto_770669 ) ) ( not ( = ?auto_770668 ?auto_770670 ) ) ( not ( = ?auto_770668 ?auto_770671 ) ) ( not ( = ?auto_770668 ?auto_770672 ) ) ( not ( = ?auto_770668 ?auto_770673 ) ) ( not ( = ?auto_770668 ?auto_770674 ) ) ( not ( = ?auto_770668 ?auto_770675 ) ) ( not ( = ?auto_770668 ?auto_770676 ) ) ( not ( = ?auto_770668 ?auto_770677 ) ) ( not ( = ?auto_770668 ?auto_770678 ) ) ( not ( = ?auto_770668 ?auto_770679 ) ) ( not ( = ?auto_770668 ?auto_770680 ) ) ( not ( = ?auto_770668 ?auto_770681 ) ) ( not ( = ?auto_770669 ?auto_770670 ) ) ( not ( = ?auto_770669 ?auto_770671 ) ) ( not ( = ?auto_770669 ?auto_770672 ) ) ( not ( = ?auto_770669 ?auto_770673 ) ) ( not ( = ?auto_770669 ?auto_770674 ) ) ( not ( = ?auto_770669 ?auto_770675 ) ) ( not ( = ?auto_770669 ?auto_770676 ) ) ( not ( = ?auto_770669 ?auto_770677 ) ) ( not ( = ?auto_770669 ?auto_770678 ) ) ( not ( = ?auto_770669 ?auto_770679 ) ) ( not ( = ?auto_770669 ?auto_770680 ) ) ( not ( = ?auto_770669 ?auto_770681 ) ) ( not ( = ?auto_770670 ?auto_770671 ) ) ( not ( = ?auto_770670 ?auto_770672 ) ) ( not ( = ?auto_770670 ?auto_770673 ) ) ( not ( = ?auto_770670 ?auto_770674 ) ) ( not ( = ?auto_770670 ?auto_770675 ) ) ( not ( = ?auto_770670 ?auto_770676 ) ) ( not ( = ?auto_770670 ?auto_770677 ) ) ( not ( = ?auto_770670 ?auto_770678 ) ) ( not ( = ?auto_770670 ?auto_770679 ) ) ( not ( = ?auto_770670 ?auto_770680 ) ) ( not ( = ?auto_770670 ?auto_770681 ) ) ( not ( = ?auto_770671 ?auto_770672 ) ) ( not ( = ?auto_770671 ?auto_770673 ) ) ( not ( = ?auto_770671 ?auto_770674 ) ) ( not ( = ?auto_770671 ?auto_770675 ) ) ( not ( = ?auto_770671 ?auto_770676 ) ) ( not ( = ?auto_770671 ?auto_770677 ) ) ( not ( = ?auto_770671 ?auto_770678 ) ) ( not ( = ?auto_770671 ?auto_770679 ) ) ( not ( = ?auto_770671 ?auto_770680 ) ) ( not ( = ?auto_770671 ?auto_770681 ) ) ( not ( = ?auto_770672 ?auto_770673 ) ) ( not ( = ?auto_770672 ?auto_770674 ) ) ( not ( = ?auto_770672 ?auto_770675 ) ) ( not ( = ?auto_770672 ?auto_770676 ) ) ( not ( = ?auto_770672 ?auto_770677 ) ) ( not ( = ?auto_770672 ?auto_770678 ) ) ( not ( = ?auto_770672 ?auto_770679 ) ) ( not ( = ?auto_770672 ?auto_770680 ) ) ( not ( = ?auto_770672 ?auto_770681 ) ) ( not ( = ?auto_770673 ?auto_770674 ) ) ( not ( = ?auto_770673 ?auto_770675 ) ) ( not ( = ?auto_770673 ?auto_770676 ) ) ( not ( = ?auto_770673 ?auto_770677 ) ) ( not ( = ?auto_770673 ?auto_770678 ) ) ( not ( = ?auto_770673 ?auto_770679 ) ) ( not ( = ?auto_770673 ?auto_770680 ) ) ( not ( = ?auto_770673 ?auto_770681 ) ) ( not ( = ?auto_770674 ?auto_770675 ) ) ( not ( = ?auto_770674 ?auto_770676 ) ) ( not ( = ?auto_770674 ?auto_770677 ) ) ( not ( = ?auto_770674 ?auto_770678 ) ) ( not ( = ?auto_770674 ?auto_770679 ) ) ( not ( = ?auto_770674 ?auto_770680 ) ) ( not ( = ?auto_770674 ?auto_770681 ) ) ( not ( = ?auto_770675 ?auto_770676 ) ) ( not ( = ?auto_770675 ?auto_770677 ) ) ( not ( = ?auto_770675 ?auto_770678 ) ) ( not ( = ?auto_770675 ?auto_770679 ) ) ( not ( = ?auto_770675 ?auto_770680 ) ) ( not ( = ?auto_770675 ?auto_770681 ) ) ( not ( = ?auto_770676 ?auto_770677 ) ) ( not ( = ?auto_770676 ?auto_770678 ) ) ( not ( = ?auto_770676 ?auto_770679 ) ) ( not ( = ?auto_770676 ?auto_770680 ) ) ( not ( = ?auto_770676 ?auto_770681 ) ) ( not ( = ?auto_770677 ?auto_770678 ) ) ( not ( = ?auto_770677 ?auto_770679 ) ) ( not ( = ?auto_770677 ?auto_770680 ) ) ( not ( = ?auto_770677 ?auto_770681 ) ) ( not ( = ?auto_770678 ?auto_770679 ) ) ( not ( = ?auto_770678 ?auto_770680 ) ) ( not ( = ?auto_770678 ?auto_770681 ) ) ( not ( = ?auto_770679 ?auto_770680 ) ) ( not ( = ?auto_770679 ?auto_770681 ) ) ( not ( = ?auto_770680 ?auto_770681 ) ) ( ON ?auto_770679 ?auto_770680 ) ( ON ?auto_770678 ?auto_770679 ) ( ON ?auto_770677 ?auto_770678 ) ( ON ?auto_770676 ?auto_770677 ) ( CLEAR ?auto_770674 ) ( ON ?auto_770675 ?auto_770676 ) ( CLEAR ?auto_770675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_770666 ?auto_770667 ?auto_770668 ?auto_770669 ?auto_770670 ?auto_770671 ?auto_770672 ?auto_770673 ?auto_770674 ?auto_770675 )
      ( MAKE-15PILE ?auto_770666 ?auto_770667 ?auto_770668 ?auto_770669 ?auto_770670 ?auto_770671 ?auto_770672 ?auto_770673 ?auto_770674 ?auto_770675 ?auto_770676 ?auto_770677 ?auto_770678 ?auto_770679 ?auto_770680 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_770728 - BLOCK
      ?auto_770729 - BLOCK
      ?auto_770730 - BLOCK
      ?auto_770731 - BLOCK
      ?auto_770732 - BLOCK
      ?auto_770733 - BLOCK
      ?auto_770734 - BLOCK
      ?auto_770735 - BLOCK
      ?auto_770736 - BLOCK
      ?auto_770737 - BLOCK
      ?auto_770738 - BLOCK
      ?auto_770739 - BLOCK
      ?auto_770740 - BLOCK
      ?auto_770741 - BLOCK
      ?auto_770742 - BLOCK
    )
    :vars
    (
      ?auto_770743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770742 ?auto_770743 ) ( ON-TABLE ?auto_770728 ) ( ON ?auto_770729 ?auto_770728 ) ( ON ?auto_770730 ?auto_770729 ) ( ON ?auto_770731 ?auto_770730 ) ( ON ?auto_770732 ?auto_770731 ) ( ON ?auto_770733 ?auto_770732 ) ( ON ?auto_770734 ?auto_770733 ) ( ON ?auto_770735 ?auto_770734 ) ( not ( = ?auto_770728 ?auto_770729 ) ) ( not ( = ?auto_770728 ?auto_770730 ) ) ( not ( = ?auto_770728 ?auto_770731 ) ) ( not ( = ?auto_770728 ?auto_770732 ) ) ( not ( = ?auto_770728 ?auto_770733 ) ) ( not ( = ?auto_770728 ?auto_770734 ) ) ( not ( = ?auto_770728 ?auto_770735 ) ) ( not ( = ?auto_770728 ?auto_770736 ) ) ( not ( = ?auto_770728 ?auto_770737 ) ) ( not ( = ?auto_770728 ?auto_770738 ) ) ( not ( = ?auto_770728 ?auto_770739 ) ) ( not ( = ?auto_770728 ?auto_770740 ) ) ( not ( = ?auto_770728 ?auto_770741 ) ) ( not ( = ?auto_770728 ?auto_770742 ) ) ( not ( = ?auto_770728 ?auto_770743 ) ) ( not ( = ?auto_770729 ?auto_770730 ) ) ( not ( = ?auto_770729 ?auto_770731 ) ) ( not ( = ?auto_770729 ?auto_770732 ) ) ( not ( = ?auto_770729 ?auto_770733 ) ) ( not ( = ?auto_770729 ?auto_770734 ) ) ( not ( = ?auto_770729 ?auto_770735 ) ) ( not ( = ?auto_770729 ?auto_770736 ) ) ( not ( = ?auto_770729 ?auto_770737 ) ) ( not ( = ?auto_770729 ?auto_770738 ) ) ( not ( = ?auto_770729 ?auto_770739 ) ) ( not ( = ?auto_770729 ?auto_770740 ) ) ( not ( = ?auto_770729 ?auto_770741 ) ) ( not ( = ?auto_770729 ?auto_770742 ) ) ( not ( = ?auto_770729 ?auto_770743 ) ) ( not ( = ?auto_770730 ?auto_770731 ) ) ( not ( = ?auto_770730 ?auto_770732 ) ) ( not ( = ?auto_770730 ?auto_770733 ) ) ( not ( = ?auto_770730 ?auto_770734 ) ) ( not ( = ?auto_770730 ?auto_770735 ) ) ( not ( = ?auto_770730 ?auto_770736 ) ) ( not ( = ?auto_770730 ?auto_770737 ) ) ( not ( = ?auto_770730 ?auto_770738 ) ) ( not ( = ?auto_770730 ?auto_770739 ) ) ( not ( = ?auto_770730 ?auto_770740 ) ) ( not ( = ?auto_770730 ?auto_770741 ) ) ( not ( = ?auto_770730 ?auto_770742 ) ) ( not ( = ?auto_770730 ?auto_770743 ) ) ( not ( = ?auto_770731 ?auto_770732 ) ) ( not ( = ?auto_770731 ?auto_770733 ) ) ( not ( = ?auto_770731 ?auto_770734 ) ) ( not ( = ?auto_770731 ?auto_770735 ) ) ( not ( = ?auto_770731 ?auto_770736 ) ) ( not ( = ?auto_770731 ?auto_770737 ) ) ( not ( = ?auto_770731 ?auto_770738 ) ) ( not ( = ?auto_770731 ?auto_770739 ) ) ( not ( = ?auto_770731 ?auto_770740 ) ) ( not ( = ?auto_770731 ?auto_770741 ) ) ( not ( = ?auto_770731 ?auto_770742 ) ) ( not ( = ?auto_770731 ?auto_770743 ) ) ( not ( = ?auto_770732 ?auto_770733 ) ) ( not ( = ?auto_770732 ?auto_770734 ) ) ( not ( = ?auto_770732 ?auto_770735 ) ) ( not ( = ?auto_770732 ?auto_770736 ) ) ( not ( = ?auto_770732 ?auto_770737 ) ) ( not ( = ?auto_770732 ?auto_770738 ) ) ( not ( = ?auto_770732 ?auto_770739 ) ) ( not ( = ?auto_770732 ?auto_770740 ) ) ( not ( = ?auto_770732 ?auto_770741 ) ) ( not ( = ?auto_770732 ?auto_770742 ) ) ( not ( = ?auto_770732 ?auto_770743 ) ) ( not ( = ?auto_770733 ?auto_770734 ) ) ( not ( = ?auto_770733 ?auto_770735 ) ) ( not ( = ?auto_770733 ?auto_770736 ) ) ( not ( = ?auto_770733 ?auto_770737 ) ) ( not ( = ?auto_770733 ?auto_770738 ) ) ( not ( = ?auto_770733 ?auto_770739 ) ) ( not ( = ?auto_770733 ?auto_770740 ) ) ( not ( = ?auto_770733 ?auto_770741 ) ) ( not ( = ?auto_770733 ?auto_770742 ) ) ( not ( = ?auto_770733 ?auto_770743 ) ) ( not ( = ?auto_770734 ?auto_770735 ) ) ( not ( = ?auto_770734 ?auto_770736 ) ) ( not ( = ?auto_770734 ?auto_770737 ) ) ( not ( = ?auto_770734 ?auto_770738 ) ) ( not ( = ?auto_770734 ?auto_770739 ) ) ( not ( = ?auto_770734 ?auto_770740 ) ) ( not ( = ?auto_770734 ?auto_770741 ) ) ( not ( = ?auto_770734 ?auto_770742 ) ) ( not ( = ?auto_770734 ?auto_770743 ) ) ( not ( = ?auto_770735 ?auto_770736 ) ) ( not ( = ?auto_770735 ?auto_770737 ) ) ( not ( = ?auto_770735 ?auto_770738 ) ) ( not ( = ?auto_770735 ?auto_770739 ) ) ( not ( = ?auto_770735 ?auto_770740 ) ) ( not ( = ?auto_770735 ?auto_770741 ) ) ( not ( = ?auto_770735 ?auto_770742 ) ) ( not ( = ?auto_770735 ?auto_770743 ) ) ( not ( = ?auto_770736 ?auto_770737 ) ) ( not ( = ?auto_770736 ?auto_770738 ) ) ( not ( = ?auto_770736 ?auto_770739 ) ) ( not ( = ?auto_770736 ?auto_770740 ) ) ( not ( = ?auto_770736 ?auto_770741 ) ) ( not ( = ?auto_770736 ?auto_770742 ) ) ( not ( = ?auto_770736 ?auto_770743 ) ) ( not ( = ?auto_770737 ?auto_770738 ) ) ( not ( = ?auto_770737 ?auto_770739 ) ) ( not ( = ?auto_770737 ?auto_770740 ) ) ( not ( = ?auto_770737 ?auto_770741 ) ) ( not ( = ?auto_770737 ?auto_770742 ) ) ( not ( = ?auto_770737 ?auto_770743 ) ) ( not ( = ?auto_770738 ?auto_770739 ) ) ( not ( = ?auto_770738 ?auto_770740 ) ) ( not ( = ?auto_770738 ?auto_770741 ) ) ( not ( = ?auto_770738 ?auto_770742 ) ) ( not ( = ?auto_770738 ?auto_770743 ) ) ( not ( = ?auto_770739 ?auto_770740 ) ) ( not ( = ?auto_770739 ?auto_770741 ) ) ( not ( = ?auto_770739 ?auto_770742 ) ) ( not ( = ?auto_770739 ?auto_770743 ) ) ( not ( = ?auto_770740 ?auto_770741 ) ) ( not ( = ?auto_770740 ?auto_770742 ) ) ( not ( = ?auto_770740 ?auto_770743 ) ) ( not ( = ?auto_770741 ?auto_770742 ) ) ( not ( = ?auto_770741 ?auto_770743 ) ) ( not ( = ?auto_770742 ?auto_770743 ) ) ( ON ?auto_770741 ?auto_770742 ) ( ON ?auto_770740 ?auto_770741 ) ( ON ?auto_770739 ?auto_770740 ) ( ON ?auto_770738 ?auto_770739 ) ( ON ?auto_770737 ?auto_770738 ) ( CLEAR ?auto_770735 ) ( ON ?auto_770736 ?auto_770737 ) ( CLEAR ?auto_770736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_770728 ?auto_770729 ?auto_770730 ?auto_770731 ?auto_770732 ?auto_770733 ?auto_770734 ?auto_770735 ?auto_770736 )
      ( MAKE-15PILE ?auto_770728 ?auto_770729 ?auto_770730 ?auto_770731 ?auto_770732 ?auto_770733 ?auto_770734 ?auto_770735 ?auto_770736 ?auto_770737 ?auto_770738 ?auto_770739 ?auto_770740 ?auto_770741 ?auto_770742 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_770790 - BLOCK
      ?auto_770791 - BLOCK
      ?auto_770792 - BLOCK
      ?auto_770793 - BLOCK
      ?auto_770794 - BLOCK
      ?auto_770795 - BLOCK
      ?auto_770796 - BLOCK
      ?auto_770797 - BLOCK
      ?auto_770798 - BLOCK
      ?auto_770799 - BLOCK
      ?auto_770800 - BLOCK
      ?auto_770801 - BLOCK
      ?auto_770802 - BLOCK
      ?auto_770803 - BLOCK
      ?auto_770804 - BLOCK
    )
    :vars
    (
      ?auto_770805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770804 ?auto_770805 ) ( ON-TABLE ?auto_770790 ) ( ON ?auto_770791 ?auto_770790 ) ( ON ?auto_770792 ?auto_770791 ) ( ON ?auto_770793 ?auto_770792 ) ( ON ?auto_770794 ?auto_770793 ) ( ON ?auto_770795 ?auto_770794 ) ( ON ?auto_770796 ?auto_770795 ) ( not ( = ?auto_770790 ?auto_770791 ) ) ( not ( = ?auto_770790 ?auto_770792 ) ) ( not ( = ?auto_770790 ?auto_770793 ) ) ( not ( = ?auto_770790 ?auto_770794 ) ) ( not ( = ?auto_770790 ?auto_770795 ) ) ( not ( = ?auto_770790 ?auto_770796 ) ) ( not ( = ?auto_770790 ?auto_770797 ) ) ( not ( = ?auto_770790 ?auto_770798 ) ) ( not ( = ?auto_770790 ?auto_770799 ) ) ( not ( = ?auto_770790 ?auto_770800 ) ) ( not ( = ?auto_770790 ?auto_770801 ) ) ( not ( = ?auto_770790 ?auto_770802 ) ) ( not ( = ?auto_770790 ?auto_770803 ) ) ( not ( = ?auto_770790 ?auto_770804 ) ) ( not ( = ?auto_770790 ?auto_770805 ) ) ( not ( = ?auto_770791 ?auto_770792 ) ) ( not ( = ?auto_770791 ?auto_770793 ) ) ( not ( = ?auto_770791 ?auto_770794 ) ) ( not ( = ?auto_770791 ?auto_770795 ) ) ( not ( = ?auto_770791 ?auto_770796 ) ) ( not ( = ?auto_770791 ?auto_770797 ) ) ( not ( = ?auto_770791 ?auto_770798 ) ) ( not ( = ?auto_770791 ?auto_770799 ) ) ( not ( = ?auto_770791 ?auto_770800 ) ) ( not ( = ?auto_770791 ?auto_770801 ) ) ( not ( = ?auto_770791 ?auto_770802 ) ) ( not ( = ?auto_770791 ?auto_770803 ) ) ( not ( = ?auto_770791 ?auto_770804 ) ) ( not ( = ?auto_770791 ?auto_770805 ) ) ( not ( = ?auto_770792 ?auto_770793 ) ) ( not ( = ?auto_770792 ?auto_770794 ) ) ( not ( = ?auto_770792 ?auto_770795 ) ) ( not ( = ?auto_770792 ?auto_770796 ) ) ( not ( = ?auto_770792 ?auto_770797 ) ) ( not ( = ?auto_770792 ?auto_770798 ) ) ( not ( = ?auto_770792 ?auto_770799 ) ) ( not ( = ?auto_770792 ?auto_770800 ) ) ( not ( = ?auto_770792 ?auto_770801 ) ) ( not ( = ?auto_770792 ?auto_770802 ) ) ( not ( = ?auto_770792 ?auto_770803 ) ) ( not ( = ?auto_770792 ?auto_770804 ) ) ( not ( = ?auto_770792 ?auto_770805 ) ) ( not ( = ?auto_770793 ?auto_770794 ) ) ( not ( = ?auto_770793 ?auto_770795 ) ) ( not ( = ?auto_770793 ?auto_770796 ) ) ( not ( = ?auto_770793 ?auto_770797 ) ) ( not ( = ?auto_770793 ?auto_770798 ) ) ( not ( = ?auto_770793 ?auto_770799 ) ) ( not ( = ?auto_770793 ?auto_770800 ) ) ( not ( = ?auto_770793 ?auto_770801 ) ) ( not ( = ?auto_770793 ?auto_770802 ) ) ( not ( = ?auto_770793 ?auto_770803 ) ) ( not ( = ?auto_770793 ?auto_770804 ) ) ( not ( = ?auto_770793 ?auto_770805 ) ) ( not ( = ?auto_770794 ?auto_770795 ) ) ( not ( = ?auto_770794 ?auto_770796 ) ) ( not ( = ?auto_770794 ?auto_770797 ) ) ( not ( = ?auto_770794 ?auto_770798 ) ) ( not ( = ?auto_770794 ?auto_770799 ) ) ( not ( = ?auto_770794 ?auto_770800 ) ) ( not ( = ?auto_770794 ?auto_770801 ) ) ( not ( = ?auto_770794 ?auto_770802 ) ) ( not ( = ?auto_770794 ?auto_770803 ) ) ( not ( = ?auto_770794 ?auto_770804 ) ) ( not ( = ?auto_770794 ?auto_770805 ) ) ( not ( = ?auto_770795 ?auto_770796 ) ) ( not ( = ?auto_770795 ?auto_770797 ) ) ( not ( = ?auto_770795 ?auto_770798 ) ) ( not ( = ?auto_770795 ?auto_770799 ) ) ( not ( = ?auto_770795 ?auto_770800 ) ) ( not ( = ?auto_770795 ?auto_770801 ) ) ( not ( = ?auto_770795 ?auto_770802 ) ) ( not ( = ?auto_770795 ?auto_770803 ) ) ( not ( = ?auto_770795 ?auto_770804 ) ) ( not ( = ?auto_770795 ?auto_770805 ) ) ( not ( = ?auto_770796 ?auto_770797 ) ) ( not ( = ?auto_770796 ?auto_770798 ) ) ( not ( = ?auto_770796 ?auto_770799 ) ) ( not ( = ?auto_770796 ?auto_770800 ) ) ( not ( = ?auto_770796 ?auto_770801 ) ) ( not ( = ?auto_770796 ?auto_770802 ) ) ( not ( = ?auto_770796 ?auto_770803 ) ) ( not ( = ?auto_770796 ?auto_770804 ) ) ( not ( = ?auto_770796 ?auto_770805 ) ) ( not ( = ?auto_770797 ?auto_770798 ) ) ( not ( = ?auto_770797 ?auto_770799 ) ) ( not ( = ?auto_770797 ?auto_770800 ) ) ( not ( = ?auto_770797 ?auto_770801 ) ) ( not ( = ?auto_770797 ?auto_770802 ) ) ( not ( = ?auto_770797 ?auto_770803 ) ) ( not ( = ?auto_770797 ?auto_770804 ) ) ( not ( = ?auto_770797 ?auto_770805 ) ) ( not ( = ?auto_770798 ?auto_770799 ) ) ( not ( = ?auto_770798 ?auto_770800 ) ) ( not ( = ?auto_770798 ?auto_770801 ) ) ( not ( = ?auto_770798 ?auto_770802 ) ) ( not ( = ?auto_770798 ?auto_770803 ) ) ( not ( = ?auto_770798 ?auto_770804 ) ) ( not ( = ?auto_770798 ?auto_770805 ) ) ( not ( = ?auto_770799 ?auto_770800 ) ) ( not ( = ?auto_770799 ?auto_770801 ) ) ( not ( = ?auto_770799 ?auto_770802 ) ) ( not ( = ?auto_770799 ?auto_770803 ) ) ( not ( = ?auto_770799 ?auto_770804 ) ) ( not ( = ?auto_770799 ?auto_770805 ) ) ( not ( = ?auto_770800 ?auto_770801 ) ) ( not ( = ?auto_770800 ?auto_770802 ) ) ( not ( = ?auto_770800 ?auto_770803 ) ) ( not ( = ?auto_770800 ?auto_770804 ) ) ( not ( = ?auto_770800 ?auto_770805 ) ) ( not ( = ?auto_770801 ?auto_770802 ) ) ( not ( = ?auto_770801 ?auto_770803 ) ) ( not ( = ?auto_770801 ?auto_770804 ) ) ( not ( = ?auto_770801 ?auto_770805 ) ) ( not ( = ?auto_770802 ?auto_770803 ) ) ( not ( = ?auto_770802 ?auto_770804 ) ) ( not ( = ?auto_770802 ?auto_770805 ) ) ( not ( = ?auto_770803 ?auto_770804 ) ) ( not ( = ?auto_770803 ?auto_770805 ) ) ( not ( = ?auto_770804 ?auto_770805 ) ) ( ON ?auto_770803 ?auto_770804 ) ( ON ?auto_770802 ?auto_770803 ) ( ON ?auto_770801 ?auto_770802 ) ( ON ?auto_770800 ?auto_770801 ) ( ON ?auto_770799 ?auto_770800 ) ( ON ?auto_770798 ?auto_770799 ) ( CLEAR ?auto_770796 ) ( ON ?auto_770797 ?auto_770798 ) ( CLEAR ?auto_770797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_770790 ?auto_770791 ?auto_770792 ?auto_770793 ?auto_770794 ?auto_770795 ?auto_770796 ?auto_770797 )
      ( MAKE-15PILE ?auto_770790 ?auto_770791 ?auto_770792 ?auto_770793 ?auto_770794 ?auto_770795 ?auto_770796 ?auto_770797 ?auto_770798 ?auto_770799 ?auto_770800 ?auto_770801 ?auto_770802 ?auto_770803 ?auto_770804 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_770852 - BLOCK
      ?auto_770853 - BLOCK
      ?auto_770854 - BLOCK
      ?auto_770855 - BLOCK
      ?auto_770856 - BLOCK
      ?auto_770857 - BLOCK
      ?auto_770858 - BLOCK
      ?auto_770859 - BLOCK
      ?auto_770860 - BLOCK
      ?auto_770861 - BLOCK
      ?auto_770862 - BLOCK
      ?auto_770863 - BLOCK
      ?auto_770864 - BLOCK
      ?auto_770865 - BLOCK
      ?auto_770866 - BLOCK
    )
    :vars
    (
      ?auto_770867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770866 ?auto_770867 ) ( ON-TABLE ?auto_770852 ) ( ON ?auto_770853 ?auto_770852 ) ( ON ?auto_770854 ?auto_770853 ) ( ON ?auto_770855 ?auto_770854 ) ( ON ?auto_770856 ?auto_770855 ) ( ON ?auto_770857 ?auto_770856 ) ( not ( = ?auto_770852 ?auto_770853 ) ) ( not ( = ?auto_770852 ?auto_770854 ) ) ( not ( = ?auto_770852 ?auto_770855 ) ) ( not ( = ?auto_770852 ?auto_770856 ) ) ( not ( = ?auto_770852 ?auto_770857 ) ) ( not ( = ?auto_770852 ?auto_770858 ) ) ( not ( = ?auto_770852 ?auto_770859 ) ) ( not ( = ?auto_770852 ?auto_770860 ) ) ( not ( = ?auto_770852 ?auto_770861 ) ) ( not ( = ?auto_770852 ?auto_770862 ) ) ( not ( = ?auto_770852 ?auto_770863 ) ) ( not ( = ?auto_770852 ?auto_770864 ) ) ( not ( = ?auto_770852 ?auto_770865 ) ) ( not ( = ?auto_770852 ?auto_770866 ) ) ( not ( = ?auto_770852 ?auto_770867 ) ) ( not ( = ?auto_770853 ?auto_770854 ) ) ( not ( = ?auto_770853 ?auto_770855 ) ) ( not ( = ?auto_770853 ?auto_770856 ) ) ( not ( = ?auto_770853 ?auto_770857 ) ) ( not ( = ?auto_770853 ?auto_770858 ) ) ( not ( = ?auto_770853 ?auto_770859 ) ) ( not ( = ?auto_770853 ?auto_770860 ) ) ( not ( = ?auto_770853 ?auto_770861 ) ) ( not ( = ?auto_770853 ?auto_770862 ) ) ( not ( = ?auto_770853 ?auto_770863 ) ) ( not ( = ?auto_770853 ?auto_770864 ) ) ( not ( = ?auto_770853 ?auto_770865 ) ) ( not ( = ?auto_770853 ?auto_770866 ) ) ( not ( = ?auto_770853 ?auto_770867 ) ) ( not ( = ?auto_770854 ?auto_770855 ) ) ( not ( = ?auto_770854 ?auto_770856 ) ) ( not ( = ?auto_770854 ?auto_770857 ) ) ( not ( = ?auto_770854 ?auto_770858 ) ) ( not ( = ?auto_770854 ?auto_770859 ) ) ( not ( = ?auto_770854 ?auto_770860 ) ) ( not ( = ?auto_770854 ?auto_770861 ) ) ( not ( = ?auto_770854 ?auto_770862 ) ) ( not ( = ?auto_770854 ?auto_770863 ) ) ( not ( = ?auto_770854 ?auto_770864 ) ) ( not ( = ?auto_770854 ?auto_770865 ) ) ( not ( = ?auto_770854 ?auto_770866 ) ) ( not ( = ?auto_770854 ?auto_770867 ) ) ( not ( = ?auto_770855 ?auto_770856 ) ) ( not ( = ?auto_770855 ?auto_770857 ) ) ( not ( = ?auto_770855 ?auto_770858 ) ) ( not ( = ?auto_770855 ?auto_770859 ) ) ( not ( = ?auto_770855 ?auto_770860 ) ) ( not ( = ?auto_770855 ?auto_770861 ) ) ( not ( = ?auto_770855 ?auto_770862 ) ) ( not ( = ?auto_770855 ?auto_770863 ) ) ( not ( = ?auto_770855 ?auto_770864 ) ) ( not ( = ?auto_770855 ?auto_770865 ) ) ( not ( = ?auto_770855 ?auto_770866 ) ) ( not ( = ?auto_770855 ?auto_770867 ) ) ( not ( = ?auto_770856 ?auto_770857 ) ) ( not ( = ?auto_770856 ?auto_770858 ) ) ( not ( = ?auto_770856 ?auto_770859 ) ) ( not ( = ?auto_770856 ?auto_770860 ) ) ( not ( = ?auto_770856 ?auto_770861 ) ) ( not ( = ?auto_770856 ?auto_770862 ) ) ( not ( = ?auto_770856 ?auto_770863 ) ) ( not ( = ?auto_770856 ?auto_770864 ) ) ( not ( = ?auto_770856 ?auto_770865 ) ) ( not ( = ?auto_770856 ?auto_770866 ) ) ( not ( = ?auto_770856 ?auto_770867 ) ) ( not ( = ?auto_770857 ?auto_770858 ) ) ( not ( = ?auto_770857 ?auto_770859 ) ) ( not ( = ?auto_770857 ?auto_770860 ) ) ( not ( = ?auto_770857 ?auto_770861 ) ) ( not ( = ?auto_770857 ?auto_770862 ) ) ( not ( = ?auto_770857 ?auto_770863 ) ) ( not ( = ?auto_770857 ?auto_770864 ) ) ( not ( = ?auto_770857 ?auto_770865 ) ) ( not ( = ?auto_770857 ?auto_770866 ) ) ( not ( = ?auto_770857 ?auto_770867 ) ) ( not ( = ?auto_770858 ?auto_770859 ) ) ( not ( = ?auto_770858 ?auto_770860 ) ) ( not ( = ?auto_770858 ?auto_770861 ) ) ( not ( = ?auto_770858 ?auto_770862 ) ) ( not ( = ?auto_770858 ?auto_770863 ) ) ( not ( = ?auto_770858 ?auto_770864 ) ) ( not ( = ?auto_770858 ?auto_770865 ) ) ( not ( = ?auto_770858 ?auto_770866 ) ) ( not ( = ?auto_770858 ?auto_770867 ) ) ( not ( = ?auto_770859 ?auto_770860 ) ) ( not ( = ?auto_770859 ?auto_770861 ) ) ( not ( = ?auto_770859 ?auto_770862 ) ) ( not ( = ?auto_770859 ?auto_770863 ) ) ( not ( = ?auto_770859 ?auto_770864 ) ) ( not ( = ?auto_770859 ?auto_770865 ) ) ( not ( = ?auto_770859 ?auto_770866 ) ) ( not ( = ?auto_770859 ?auto_770867 ) ) ( not ( = ?auto_770860 ?auto_770861 ) ) ( not ( = ?auto_770860 ?auto_770862 ) ) ( not ( = ?auto_770860 ?auto_770863 ) ) ( not ( = ?auto_770860 ?auto_770864 ) ) ( not ( = ?auto_770860 ?auto_770865 ) ) ( not ( = ?auto_770860 ?auto_770866 ) ) ( not ( = ?auto_770860 ?auto_770867 ) ) ( not ( = ?auto_770861 ?auto_770862 ) ) ( not ( = ?auto_770861 ?auto_770863 ) ) ( not ( = ?auto_770861 ?auto_770864 ) ) ( not ( = ?auto_770861 ?auto_770865 ) ) ( not ( = ?auto_770861 ?auto_770866 ) ) ( not ( = ?auto_770861 ?auto_770867 ) ) ( not ( = ?auto_770862 ?auto_770863 ) ) ( not ( = ?auto_770862 ?auto_770864 ) ) ( not ( = ?auto_770862 ?auto_770865 ) ) ( not ( = ?auto_770862 ?auto_770866 ) ) ( not ( = ?auto_770862 ?auto_770867 ) ) ( not ( = ?auto_770863 ?auto_770864 ) ) ( not ( = ?auto_770863 ?auto_770865 ) ) ( not ( = ?auto_770863 ?auto_770866 ) ) ( not ( = ?auto_770863 ?auto_770867 ) ) ( not ( = ?auto_770864 ?auto_770865 ) ) ( not ( = ?auto_770864 ?auto_770866 ) ) ( not ( = ?auto_770864 ?auto_770867 ) ) ( not ( = ?auto_770865 ?auto_770866 ) ) ( not ( = ?auto_770865 ?auto_770867 ) ) ( not ( = ?auto_770866 ?auto_770867 ) ) ( ON ?auto_770865 ?auto_770866 ) ( ON ?auto_770864 ?auto_770865 ) ( ON ?auto_770863 ?auto_770864 ) ( ON ?auto_770862 ?auto_770863 ) ( ON ?auto_770861 ?auto_770862 ) ( ON ?auto_770860 ?auto_770861 ) ( ON ?auto_770859 ?auto_770860 ) ( CLEAR ?auto_770857 ) ( ON ?auto_770858 ?auto_770859 ) ( CLEAR ?auto_770858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_770852 ?auto_770853 ?auto_770854 ?auto_770855 ?auto_770856 ?auto_770857 ?auto_770858 )
      ( MAKE-15PILE ?auto_770852 ?auto_770853 ?auto_770854 ?auto_770855 ?auto_770856 ?auto_770857 ?auto_770858 ?auto_770859 ?auto_770860 ?auto_770861 ?auto_770862 ?auto_770863 ?auto_770864 ?auto_770865 ?auto_770866 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_770914 - BLOCK
      ?auto_770915 - BLOCK
      ?auto_770916 - BLOCK
      ?auto_770917 - BLOCK
      ?auto_770918 - BLOCK
      ?auto_770919 - BLOCK
      ?auto_770920 - BLOCK
      ?auto_770921 - BLOCK
      ?auto_770922 - BLOCK
      ?auto_770923 - BLOCK
      ?auto_770924 - BLOCK
      ?auto_770925 - BLOCK
      ?auto_770926 - BLOCK
      ?auto_770927 - BLOCK
      ?auto_770928 - BLOCK
    )
    :vars
    (
      ?auto_770929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770928 ?auto_770929 ) ( ON-TABLE ?auto_770914 ) ( ON ?auto_770915 ?auto_770914 ) ( ON ?auto_770916 ?auto_770915 ) ( ON ?auto_770917 ?auto_770916 ) ( ON ?auto_770918 ?auto_770917 ) ( not ( = ?auto_770914 ?auto_770915 ) ) ( not ( = ?auto_770914 ?auto_770916 ) ) ( not ( = ?auto_770914 ?auto_770917 ) ) ( not ( = ?auto_770914 ?auto_770918 ) ) ( not ( = ?auto_770914 ?auto_770919 ) ) ( not ( = ?auto_770914 ?auto_770920 ) ) ( not ( = ?auto_770914 ?auto_770921 ) ) ( not ( = ?auto_770914 ?auto_770922 ) ) ( not ( = ?auto_770914 ?auto_770923 ) ) ( not ( = ?auto_770914 ?auto_770924 ) ) ( not ( = ?auto_770914 ?auto_770925 ) ) ( not ( = ?auto_770914 ?auto_770926 ) ) ( not ( = ?auto_770914 ?auto_770927 ) ) ( not ( = ?auto_770914 ?auto_770928 ) ) ( not ( = ?auto_770914 ?auto_770929 ) ) ( not ( = ?auto_770915 ?auto_770916 ) ) ( not ( = ?auto_770915 ?auto_770917 ) ) ( not ( = ?auto_770915 ?auto_770918 ) ) ( not ( = ?auto_770915 ?auto_770919 ) ) ( not ( = ?auto_770915 ?auto_770920 ) ) ( not ( = ?auto_770915 ?auto_770921 ) ) ( not ( = ?auto_770915 ?auto_770922 ) ) ( not ( = ?auto_770915 ?auto_770923 ) ) ( not ( = ?auto_770915 ?auto_770924 ) ) ( not ( = ?auto_770915 ?auto_770925 ) ) ( not ( = ?auto_770915 ?auto_770926 ) ) ( not ( = ?auto_770915 ?auto_770927 ) ) ( not ( = ?auto_770915 ?auto_770928 ) ) ( not ( = ?auto_770915 ?auto_770929 ) ) ( not ( = ?auto_770916 ?auto_770917 ) ) ( not ( = ?auto_770916 ?auto_770918 ) ) ( not ( = ?auto_770916 ?auto_770919 ) ) ( not ( = ?auto_770916 ?auto_770920 ) ) ( not ( = ?auto_770916 ?auto_770921 ) ) ( not ( = ?auto_770916 ?auto_770922 ) ) ( not ( = ?auto_770916 ?auto_770923 ) ) ( not ( = ?auto_770916 ?auto_770924 ) ) ( not ( = ?auto_770916 ?auto_770925 ) ) ( not ( = ?auto_770916 ?auto_770926 ) ) ( not ( = ?auto_770916 ?auto_770927 ) ) ( not ( = ?auto_770916 ?auto_770928 ) ) ( not ( = ?auto_770916 ?auto_770929 ) ) ( not ( = ?auto_770917 ?auto_770918 ) ) ( not ( = ?auto_770917 ?auto_770919 ) ) ( not ( = ?auto_770917 ?auto_770920 ) ) ( not ( = ?auto_770917 ?auto_770921 ) ) ( not ( = ?auto_770917 ?auto_770922 ) ) ( not ( = ?auto_770917 ?auto_770923 ) ) ( not ( = ?auto_770917 ?auto_770924 ) ) ( not ( = ?auto_770917 ?auto_770925 ) ) ( not ( = ?auto_770917 ?auto_770926 ) ) ( not ( = ?auto_770917 ?auto_770927 ) ) ( not ( = ?auto_770917 ?auto_770928 ) ) ( not ( = ?auto_770917 ?auto_770929 ) ) ( not ( = ?auto_770918 ?auto_770919 ) ) ( not ( = ?auto_770918 ?auto_770920 ) ) ( not ( = ?auto_770918 ?auto_770921 ) ) ( not ( = ?auto_770918 ?auto_770922 ) ) ( not ( = ?auto_770918 ?auto_770923 ) ) ( not ( = ?auto_770918 ?auto_770924 ) ) ( not ( = ?auto_770918 ?auto_770925 ) ) ( not ( = ?auto_770918 ?auto_770926 ) ) ( not ( = ?auto_770918 ?auto_770927 ) ) ( not ( = ?auto_770918 ?auto_770928 ) ) ( not ( = ?auto_770918 ?auto_770929 ) ) ( not ( = ?auto_770919 ?auto_770920 ) ) ( not ( = ?auto_770919 ?auto_770921 ) ) ( not ( = ?auto_770919 ?auto_770922 ) ) ( not ( = ?auto_770919 ?auto_770923 ) ) ( not ( = ?auto_770919 ?auto_770924 ) ) ( not ( = ?auto_770919 ?auto_770925 ) ) ( not ( = ?auto_770919 ?auto_770926 ) ) ( not ( = ?auto_770919 ?auto_770927 ) ) ( not ( = ?auto_770919 ?auto_770928 ) ) ( not ( = ?auto_770919 ?auto_770929 ) ) ( not ( = ?auto_770920 ?auto_770921 ) ) ( not ( = ?auto_770920 ?auto_770922 ) ) ( not ( = ?auto_770920 ?auto_770923 ) ) ( not ( = ?auto_770920 ?auto_770924 ) ) ( not ( = ?auto_770920 ?auto_770925 ) ) ( not ( = ?auto_770920 ?auto_770926 ) ) ( not ( = ?auto_770920 ?auto_770927 ) ) ( not ( = ?auto_770920 ?auto_770928 ) ) ( not ( = ?auto_770920 ?auto_770929 ) ) ( not ( = ?auto_770921 ?auto_770922 ) ) ( not ( = ?auto_770921 ?auto_770923 ) ) ( not ( = ?auto_770921 ?auto_770924 ) ) ( not ( = ?auto_770921 ?auto_770925 ) ) ( not ( = ?auto_770921 ?auto_770926 ) ) ( not ( = ?auto_770921 ?auto_770927 ) ) ( not ( = ?auto_770921 ?auto_770928 ) ) ( not ( = ?auto_770921 ?auto_770929 ) ) ( not ( = ?auto_770922 ?auto_770923 ) ) ( not ( = ?auto_770922 ?auto_770924 ) ) ( not ( = ?auto_770922 ?auto_770925 ) ) ( not ( = ?auto_770922 ?auto_770926 ) ) ( not ( = ?auto_770922 ?auto_770927 ) ) ( not ( = ?auto_770922 ?auto_770928 ) ) ( not ( = ?auto_770922 ?auto_770929 ) ) ( not ( = ?auto_770923 ?auto_770924 ) ) ( not ( = ?auto_770923 ?auto_770925 ) ) ( not ( = ?auto_770923 ?auto_770926 ) ) ( not ( = ?auto_770923 ?auto_770927 ) ) ( not ( = ?auto_770923 ?auto_770928 ) ) ( not ( = ?auto_770923 ?auto_770929 ) ) ( not ( = ?auto_770924 ?auto_770925 ) ) ( not ( = ?auto_770924 ?auto_770926 ) ) ( not ( = ?auto_770924 ?auto_770927 ) ) ( not ( = ?auto_770924 ?auto_770928 ) ) ( not ( = ?auto_770924 ?auto_770929 ) ) ( not ( = ?auto_770925 ?auto_770926 ) ) ( not ( = ?auto_770925 ?auto_770927 ) ) ( not ( = ?auto_770925 ?auto_770928 ) ) ( not ( = ?auto_770925 ?auto_770929 ) ) ( not ( = ?auto_770926 ?auto_770927 ) ) ( not ( = ?auto_770926 ?auto_770928 ) ) ( not ( = ?auto_770926 ?auto_770929 ) ) ( not ( = ?auto_770927 ?auto_770928 ) ) ( not ( = ?auto_770927 ?auto_770929 ) ) ( not ( = ?auto_770928 ?auto_770929 ) ) ( ON ?auto_770927 ?auto_770928 ) ( ON ?auto_770926 ?auto_770927 ) ( ON ?auto_770925 ?auto_770926 ) ( ON ?auto_770924 ?auto_770925 ) ( ON ?auto_770923 ?auto_770924 ) ( ON ?auto_770922 ?auto_770923 ) ( ON ?auto_770921 ?auto_770922 ) ( ON ?auto_770920 ?auto_770921 ) ( CLEAR ?auto_770918 ) ( ON ?auto_770919 ?auto_770920 ) ( CLEAR ?auto_770919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_770914 ?auto_770915 ?auto_770916 ?auto_770917 ?auto_770918 ?auto_770919 )
      ( MAKE-15PILE ?auto_770914 ?auto_770915 ?auto_770916 ?auto_770917 ?auto_770918 ?auto_770919 ?auto_770920 ?auto_770921 ?auto_770922 ?auto_770923 ?auto_770924 ?auto_770925 ?auto_770926 ?auto_770927 ?auto_770928 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_770976 - BLOCK
      ?auto_770977 - BLOCK
      ?auto_770978 - BLOCK
      ?auto_770979 - BLOCK
      ?auto_770980 - BLOCK
      ?auto_770981 - BLOCK
      ?auto_770982 - BLOCK
      ?auto_770983 - BLOCK
      ?auto_770984 - BLOCK
      ?auto_770985 - BLOCK
      ?auto_770986 - BLOCK
      ?auto_770987 - BLOCK
      ?auto_770988 - BLOCK
      ?auto_770989 - BLOCK
      ?auto_770990 - BLOCK
    )
    :vars
    (
      ?auto_770991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_770990 ?auto_770991 ) ( ON-TABLE ?auto_770976 ) ( ON ?auto_770977 ?auto_770976 ) ( ON ?auto_770978 ?auto_770977 ) ( ON ?auto_770979 ?auto_770978 ) ( not ( = ?auto_770976 ?auto_770977 ) ) ( not ( = ?auto_770976 ?auto_770978 ) ) ( not ( = ?auto_770976 ?auto_770979 ) ) ( not ( = ?auto_770976 ?auto_770980 ) ) ( not ( = ?auto_770976 ?auto_770981 ) ) ( not ( = ?auto_770976 ?auto_770982 ) ) ( not ( = ?auto_770976 ?auto_770983 ) ) ( not ( = ?auto_770976 ?auto_770984 ) ) ( not ( = ?auto_770976 ?auto_770985 ) ) ( not ( = ?auto_770976 ?auto_770986 ) ) ( not ( = ?auto_770976 ?auto_770987 ) ) ( not ( = ?auto_770976 ?auto_770988 ) ) ( not ( = ?auto_770976 ?auto_770989 ) ) ( not ( = ?auto_770976 ?auto_770990 ) ) ( not ( = ?auto_770976 ?auto_770991 ) ) ( not ( = ?auto_770977 ?auto_770978 ) ) ( not ( = ?auto_770977 ?auto_770979 ) ) ( not ( = ?auto_770977 ?auto_770980 ) ) ( not ( = ?auto_770977 ?auto_770981 ) ) ( not ( = ?auto_770977 ?auto_770982 ) ) ( not ( = ?auto_770977 ?auto_770983 ) ) ( not ( = ?auto_770977 ?auto_770984 ) ) ( not ( = ?auto_770977 ?auto_770985 ) ) ( not ( = ?auto_770977 ?auto_770986 ) ) ( not ( = ?auto_770977 ?auto_770987 ) ) ( not ( = ?auto_770977 ?auto_770988 ) ) ( not ( = ?auto_770977 ?auto_770989 ) ) ( not ( = ?auto_770977 ?auto_770990 ) ) ( not ( = ?auto_770977 ?auto_770991 ) ) ( not ( = ?auto_770978 ?auto_770979 ) ) ( not ( = ?auto_770978 ?auto_770980 ) ) ( not ( = ?auto_770978 ?auto_770981 ) ) ( not ( = ?auto_770978 ?auto_770982 ) ) ( not ( = ?auto_770978 ?auto_770983 ) ) ( not ( = ?auto_770978 ?auto_770984 ) ) ( not ( = ?auto_770978 ?auto_770985 ) ) ( not ( = ?auto_770978 ?auto_770986 ) ) ( not ( = ?auto_770978 ?auto_770987 ) ) ( not ( = ?auto_770978 ?auto_770988 ) ) ( not ( = ?auto_770978 ?auto_770989 ) ) ( not ( = ?auto_770978 ?auto_770990 ) ) ( not ( = ?auto_770978 ?auto_770991 ) ) ( not ( = ?auto_770979 ?auto_770980 ) ) ( not ( = ?auto_770979 ?auto_770981 ) ) ( not ( = ?auto_770979 ?auto_770982 ) ) ( not ( = ?auto_770979 ?auto_770983 ) ) ( not ( = ?auto_770979 ?auto_770984 ) ) ( not ( = ?auto_770979 ?auto_770985 ) ) ( not ( = ?auto_770979 ?auto_770986 ) ) ( not ( = ?auto_770979 ?auto_770987 ) ) ( not ( = ?auto_770979 ?auto_770988 ) ) ( not ( = ?auto_770979 ?auto_770989 ) ) ( not ( = ?auto_770979 ?auto_770990 ) ) ( not ( = ?auto_770979 ?auto_770991 ) ) ( not ( = ?auto_770980 ?auto_770981 ) ) ( not ( = ?auto_770980 ?auto_770982 ) ) ( not ( = ?auto_770980 ?auto_770983 ) ) ( not ( = ?auto_770980 ?auto_770984 ) ) ( not ( = ?auto_770980 ?auto_770985 ) ) ( not ( = ?auto_770980 ?auto_770986 ) ) ( not ( = ?auto_770980 ?auto_770987 ) ) ( not ( = ?auto_770980 ?auto_770988 ) ) ( not ( = ?auto_770980 ?auto_770989 ) ) ( not ( = ?auto_770980 ?auto_770990 ) ) ( not ( = ?auto_770980 ?auto_770991 ) ) ( not ( = ?auto_770981 ?auto_770982 ) ) ( not ( = ?auto_770981 ?auto_770983 ) ) ( not ( = ?auto_770981 ?auto_770984 ) ) ( not ( = ?auto_770981 ?auto_770985 ) ) ( not ( = ?auto_770981 ?auto_770986 ) ) ( not ( = ?auto_770981 ?auto_770987 ) ) ( not ( = ?auto_770981 ?auto_770988 ) ) ( not ( = ?auto_770981 ?auto_770989 ) ) ( not ( = ?auto_770981 ?auto_770990 ) ) ( not ( = ?auto_770981 ?auto_770991 ) ) ( not ( = ?auto_770982 ?auto_770983 ) ) ( not ( = ?auto_770982 ?auto_770984 ) ) ( not ( = ?auto_770982 ?auto_770985 ) ) ( not ( = ?auto_770982 ?auto_770986 ) ) ( not ( = ?auto_770982 ?auto_770987 ) ) ( not ( = ?auto_770982 ?auto_770988 ) ) ( not ( = ?auto_770982 ?auto_770989 ) ) ( not ( = ?auto_770982 ?auto_770990 ) ) ( not ( = ?auto_770982 ?auto_770991 ) ) ( not ( = ?auto_770983 ?auto_770984 ) ) ( not ( = ?auto_770983 ?auto_770985 ) ) ( not ( = ?auto_770983 ?auto_770986 ) ) ( not ( = ?auto_770983 ?auto_770987 ) ) ( not ( = ?auto_770983 ?auto_770988 ) ) ( not ( = ?auto_770983 ?auto_770989 ) ) ( not ( = ?auto_770983 ?auto_770990 ) ) ( not ( = ?auto_770983 ?auto_770991 ) ) ( not ( = ?auto_770984 ?auto_770985 ) ) ( not ( = ?auto_770984 ?auto_770986 ) ) ( not ( = ?auto_770984 ?auto_770987 ) ) ( not ( = ?auto_770984 ?auto_770988 ) ) ( not ( = ?auto_770984 ?auto_770989 ) ) ( not ( = ?auto_770984 ?auto_770990 ) ) ( not ( = ?auto_770984 ?auto_770991 ) ) ( not ( = ?auto_770985 ?auto_770986 ) ) ( not ( = ?auto_770985 ?auto_770987 ) ) ( not ( = ?auto_770985 ?auto_770988 ) ) ( not ( = ?auto_770985 ?auto_770989 ) ) ( not ( = ?auto_770985 ?auto_770990 ) ) ( not ( = ?auto_770985 ?auto_770991 ) ) ( not ( = ?auto_770986 ?auto_770987 ) ) ( not ( = ?auto_770986 ?auto_770988 ) ) ( not ( = ?auto_770986 ?auto_770989 ) ) ( not ( = ?auto_770986 ?auto_770990 ) ) ( not ( = ?auto_770986 ?auto_770991 ) ) ( not ( = ?auto_770987 ?auto_770988 ) ) ( not ( = ?auto_770987 ?auto_770989 ) ) ( not ( = ?auto_770987 ?auto_770990 ) ) ( not ( = ?auto_770987 ?auto_770991 ) ) ( not ( = ?auto_770988 ?auto_770989 ) ) ( not ( = ?auto_770988 ?auto_770990 ) ) ( not ( = ?auto_770988 ?auto_770991 ) ) ( not ( = ?auto_770989 ?auto_770990 ) ) ( not ( = ?auto_770989 ?auto_770991 ) ) ( not ( = ?auto_770990 ?auto_770991 ) ) ( ON ?auto_770989 ?auto_770990 ) ( ON ?auto_770988 ?auto_770989 ) ( ON ?auto_770987 ?auto_770988 ) ( ON ?auto_770986 ?auto_770987 ) ( ON ?auto_770985 ?auto_770986 ) ( ON ?auto_770984 ?auto_770985 ) ( ON ?auto_770983 ?auto_770984 ) ( ON ?auto_770982 ?auto_770983 ) ( ON ?auto_770981 ?auto_770982 ) ( CLEAR ?auto_770979 ) ( ON ?auto_770980 ?auto_770981 ) ( CLEAR ?auto_770980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_770976 ?auto_770977 ?auto_770978 ?auto_770979 ?auto_770980 )
      ( MAKE-15PILE ?auto_770976 ?auto_770977 ?auto_770978 ?auto_770979 ?auto_770980 ?auto_770981 ?auto_770982 ?auto_770983 ?auto_770984 ?auto_770985 ?auto_770986 ?auto_770987 ?auto_770988 ?auto_770989 ?auto_770990 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_771038 - BLOCK
      ?auto_771039 - BLOCK
      ?auto_771040 - BLOCK
      ?auto_771041 - BLOCK
      ?auto_771042 - BLOCK
      ?auto_771043 - BLOCK
      ?auto_771044 - BLOCK
      ?auto_771045 - BLOCK
      ?auto_771046 - BLOCK
      ?auto_771047 - BLOCK
      ?auto_771048 - BLOCK
      ?auto_771049 - BLOCK
      ?auto_771050 - BLOCK
      ?auto_771051 - BLOCK
      ?auto_771052 - BLOCK
    )
    :vars
    (
      ?auto_771053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771052 ?auto_771053 ) ( ON-TABLE ?auto_771038 ) ( ON ?auto_771039 ?auto_771038 ) ( ON ?auto_771040 ?auto_771039 ) ( not ( = ?auto_771038 ?auto_771039 ) ) ( not ( = ?auto_771038 ?auto_771040 ) ) ( not ( = ?auto_771038 ?auto_771041 ) ) ( not ( = ?auto_771038 ?auto_771042 ) ) ( not ( = ?auto_771038 ?auto_771043 ) ) ( not ( = ?auto_771038 ?auto_771044 ) ) ( not ( = ?auto_771038 ?auto_771045 ) ) ( not ( = ?auto_771038 ?auto_771046 ) ) ( not ( = ?auto_771038 ?auto_771047 ) ) ( not ( = ?auto_771038 ?auto_771048 ) ) ( not ( = ?auto_771038 ?auto_771049 ) ) ( not ( = ?auto_771038 ?auto_771050 ) ) ( not ( = ?auto_771038 ?auto_771051 ) ) ( not ( = ?auto_771038 ?auto_771052 ) ) ( not ( = ?auto_771038 ?auto_771053 ) ) ( not ( = ?auto_771039 ?auto_771040 ) ) ( not ( = ?auto_771039 ?auto_771041 ) ) ( not ( = ?auto_771039 ?auto_771042 ) ) ( not ( = ?auto_771039 ?auto_771043 ) ) ( not ( = ?auto_771039 ?auto_771044 ) ) ( not ( = ?auto_771039 ?auto_771045 ) ) ( not ( = ?auto_771039 ?auto_771046 ) ) ( not ( = ?auto_771039 ?auto_771047 ) ) ( not ( = ?auto_771039 ?auto_771048 ) ) ( not ( = ?auto_771039 ?auto_771049 ) ) ( not ( = ?auto_771039 ?auto_771050 ) ) ( not ( = ?auto_771039 ?auto_771051 ) ) ( not ( = ?auto_771039 ?auto_771052 ) ) ( not ( = ?auto_771039 ?auto_771053 ) ) ( not ( = ?auto_771040 ?auto_771041 ) ) ( not ( = ?auto_771040 ?auto_771042 ) ) ( not ( = ?auto_771040 ?auto_771043 ) ) ( not ( = ?auto_771040 ?auto_771044 ) ) ( not ( = ?auto_771040 ?auto_771045 ) ) ( not ( = ?auto_771040 ?auto_771046 ) ) ( not ( = ?auto_771040 ?auto_771047 ) ) ( not ( = ?auto_771040 ?auto_771048 ) ) ( not ( = ?auto_771040 ?auto_771049 ) ) ( not ( = ?auto_771040 ?auto_771050 ) ) ( not ( = ?auto_771040 ?auto_771051 ) ) ( not ( = ?auto_771040 ?auto_771052 ) ) ( not ( = ?auto_771040 ?auto_771053 ) ) ( not ( = ?auto_771041 ?auto_771042 ) ) ( not ( = ?auto_771041 ?auto_771043 ) ) ( not ( = ?auto_771041 ?auto_771044 ) ) ( not ( = ?auto_771041 ?auto_771045 ) ) ( not ( = ?auto_771041 ?auto_771046 ) ) ( not ( = ?auto_771041 ?auto_771047 ) ) ( not ( = ?auto_771041 ?auto_771048 ) ) ( not ( = ?auto_771041 ?auto_771049 ) ) ( not ( = ?auto_771041 ?auto_771050 ) ) ( not ( = ?auto_771041 ?auto_771051 ) ) ( not ( = ?auto_771041 ?auto_771052 ) ) ( not ( = ?auto_771041 ?auto_771053 ) ) ( not ( = ?auto_771042 ?auto_771043 ) ) ( not ( = ?auto_771042 ?auto_771044 ) ) ( not ( = ?auto_771042 ?auto_771045 ) ) ( not ( = ?auto_771042 ?auto_771046 ) ) ( not ( = ?auto_771042 ?auto_771047 ) ) ( not ( = ?auto_771042 ?auto_771048 ) ) ( not ( = ?auto_771042 ?auto_771049 ) ) ( not ( = ?auto_771042 ?auto_771050 ) ) ( not ( = ?auto_771042 ?auto_771051 ) ) ( not ( = ?auto_771042 ?auto_771052 ) ) ( not ( = ?auto_771042 ?auto_771053 ) ) ( not ( = ?auto_771043 ?auto_771044 ) ) ( not ( = ?auto_771043 ?auto_771045 ) ) ( not ( = ?auto_771043 ?auto_771046 ) ) ( not ( = ?auto_771043 ?auto_771047 ) ) ( not ( = ?auto_771043 ?auto_771048 ) ) ( not ( = ?auto_771043 ?auto_771049 ) ) ( not ( = ?auto_771043 ?auto_771050 ) ) ( not ( = ?auto_771043 ?auto_771051 ) ) ( not ( = ?auto_771043 ?auto_771052 ) ) ( not ( = ?auto_771043 ?auto_771053 ) ) ( not ( = ?auto_771044 ?auto_771045 ) ) ( not ( = ?auto_771044 ?auto_771046 ) ) ( not ( = ?auto_771044 ?auto_771047 ) ) ( not ( = ?auto_771044 ?auto_771048 ) ) ( not ( = ?auto_771044 ?auto_771049 ) ) ( not ( = ?auto_771044 ?auto_771050 ) ) ( not ( = ?auto_771044 ?auto_771051 ) ) ( not ( = ?auto_771044 ?auto_771052 ) ) ( not ( = ?auto_771044 ?auto_771053 ) ) ( not ( = ?auto_771045 ?auto_771046 ) ) ( not ( = ?auto_771045 ?auto_771047 ) ) ( not ( = ?auto_771045 ?auto_771048 ) ) ( not ( = ?auto_771045 ?auto_771049 ) ) ( not ( = ?auto_771045 ?auto_771050 ) ) ( not ( = ?auto_771045 ?auto_771051 ) ) ( not ( = ?auto_771045 ?auto_771052 ) ) ( not ( = ?auto_771045 ?auto_771053 ) ) ( not ( = ?auto_771046 ?auto_771047 ) ) ( not ( = ?auto_771046 ?auto_771048 ) ) ( not ( = ?auto_771046 ?auto_771049 ) ) ( not ( = ?auto_771046 ?auto_771050 ) ) ( not ( = ?auto_771046 ?auto_771051 ) ) ( not ( = ?auto_771046 ?auto_771052 ) ) ( not ( = ?auto_771046 ?auto_771053 ) ) ( not ( = ?auto_771047 ?auto_771048 ) ) ( not ( = ?auto_771047 ?auto_771049 ) ) ( not ( = ?auto_771047 ?auto_771050 ) ) ( not ( = ?auto_771047 ?auto_771051 ) ) ( not ( = ?auto_771047 ?auto_771052 ) ) ( not ( = ?auto_771047 ?auto_771053 ) ) ( not ( = ?auto_771048 ?auto_771049 ) ) ( not ( = ?auto_771048 ?auto_771050 ) ) ( not ( = ?auto_771048 ?auto_771051 ) ) ( not ( = ?auto_771048 ?auto_771052 ) ) ( not ( = ?auto_771048 ?auto_771053 ) ) ( not ( = ?auto_771049 ?auto_771050 ) ) ( not ( = ?auto_771049 ?auto_771051 ) ) ( not ( = ?auto_771049 ?auto_771052 ) ) ( not ( = ?auto_771049 ?auto_771053 ) ) ( not ( = ?auto_771050 ?auto_771051 ) ) ( not ( = ?auto_771050 ?auto_771052 ) ) ( not ( = ?auto_771050 ?auto_771053 ) ) ( not ( = ?auto_771051 ?auto_771052 ) ) ( not ( = ?auto_771051 ?auto_771053 ) ) ( not ( = ?auto_771052 ?auto_771053 ) ) ( ON ?auto_771051 ?auto_771052 ) ( ON ?auto_771050 ?auto_771051 ) ( ON ?auto_771049 ?auto_771050 ) ( ON ?auto_771048 ?auto_771049 ) ( ON ?auto_771047 ?auto_771048 ) ( ON ?auto_771046 ?auto_771047 ) ( ON ?auto_771045 ?auto_771046 ) ( ON ?auto_771044 ?auto_771045 ) ( ON ?auto_771043 ?auto_771044 ) ( ON ?auto_771042 ?auto_771043 ) ( CLEAR ?auto_771040 ) ( ON ?auto_771041 ?auto_771042 ) ( CLEAR ?auto_771041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_771038 ?auto_771039 ?auto_771040 ?auto_771041 )
      ( MAKE-15PILE ?auto_771038 ?auto_771039 ?auto_771040 ?auto_771041 ?auto_771042 ?auto_771043 ?auto_771044 ?auto_771045 ?auto_771046 ?auto_771047 ?auto_771048 ?auto_771049 ?auto_771050 ?auto_771051 ?auto_771052 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_771100 - BLOCK
      ?auto_771101 - BLOCK
      ?auto_771102 - BLOCK
      ?auto_771103 - BLOCK
      ?auto_771104 - BLOCK
      ?auto_771105 - BLOCK
      ?auto_771106 - BLOCK
      ?auto_771107 - BLOCK
      ?auto_771108 - BLOCK
      ?auto_771109 - BLOCK
      ?auto_771110 - BLOCK
      ?auto_771111 - BLOCK
      ?auto_771112 - BLOCK
      ?auto_771113 - BLOCK
      ?auto_771114 - BLOCK
    )
    :vars
    (
      ?auto_771115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771114 ?auto_771115 ) ( ON-TABLE ?auto_771100 ) ( ON ?auto_771101 ?auto_771100 ) ( not ( = ?auto_771100 ?auto_771101 ) ) ( not ( = ?auto_771100 ?auto_771102 ) ) ( not ( = ?auto_771100 ?auto_771103 ) ) ( not ( = ?auto_771100 ?auto_771104 ) ) ( not ( = ?auto_771100 ?auto_771105 ) ) ( not ( = ?auto_771100 ?auto_771106 ) ) ( not ( = ?auto_771100 ?auto_771107 ) ) ( not ( = ?auto_771100 ?auto_771108 ) ) ( not ( = ?auto_771100 ?auto_771109 ) ) ( not ( = ?auto_771100 ?auto_771110 ) ) ( not ( = ?auto_771100 ?auto_771111 ) ) ( not ( = ?auto_771100 ?auto_771112 ) ) ( not ( = ?auto_771100 ?auto_771113 ) ) ( not ( = ?auto_771100 ?auto_771114 ) ) ( not ( = ?auto_771100 ?auto_771115 ) ) ( not ( = ?auto_771101 ?auto_771102 ) ) ( not ( = ?auto_771101 ?auto_771103 ) ) ( not ( = ?auto_771101 ?auto_771104 ) ) ( not ( = ?auto_771101 ?auto_771105 ) ) ( not ( = ?auto_771101 ?auto_771106 ) ) ( not ( = ?auto_771101 ?auto_771107 ) ) ( not ( = ?auto_771101 ?auto_771108 ) ) ( not ( = ?auto_771101 ?auto_771109 ) ) ( not ( = ?auto_771101 ?auto_771110 ) ) ( not ( = ?auto_771101 ?auto_771111 ) ) ( not ( = ?auto_771101 ?auto_771112 ) ) ( not ( = ?auto_771101 ?auto_771113 ) ) ( not ( = ?auto_771101 ?auto_771114 ) ) ( not ( = ?auto_771101 ?auto_771115 ) ) ( not ( = ?auto_771102 ?auto_771103 ) ) ( not ( = ?auto_771102 ?auto_771104 ) ) ( not ( = ?auto_771102 ?auto_771105 ) ) ( not ( = ?auto_771102 ?auto_771106 ) ) ( not ( = ?auto_771102 ?auto_771107 ) ) ( not ( = ?auto_771102 ?auto_771108 ) ) ( not ( = ?auto_771102 ?auto_771109 ) ) ( not ( = ?auto_771102 ?auto_771110 ) ) ( not ( = ?auto_771102 ?auto_771111 ) ) ( not ( = ?auto_771102 ?auto_771112 ) ) ( not ( = ?auto_771102 ?auto_771113 ) ) ( not ( = ?auto_771102 ?auto_771114 ) ) ( not ( = ?auto_771102 ?auto_771115 ) ) ( not ( = ?auto_771103 ?auto_771104 ) ) ( not ( = ?auto_771103 ?auto_771105 ) ) ( not ( = ?auto_771103 ?auto_771106 ) ) ( not ( = ?auto_771103 ?auto_771107 ) ) ( not ( = ?auto_771103 ?auto_771108 ) ) ( not ( = ?auto_771103 ?auto_771109 ) ) ( not ( = ?auto_771103 ?auto_771110 ) ) ( not ( = ?auto_771103 ?auto_771111 ) ) ( not ( = ?auto_771103 ?auto_771112 ) ) ( not ( = ?auto_771103 ?auto_771113 ) ) ( not ( = ?auto_771103 ?auto_771114 ) ) ( not ( = ?auto_771103 ?auto_771115 ) ) ( not ( = ?auto_771104 ?auto_771105 ) ) ( not ( = ?auto_771104 ?auto_771106 ) ) ( not ( = ?auto_771104 ?auto_771107 ) ) ( not ( = ?auto_771104 ?auto_771108 ) ) ( not ( = ?auto_771104 ?auto_771109 ) ) ( not ( = ?auto_771104 ?auto_771110 ) ) ( not ( = ?auto_771104 ?auto_771111 ) ) ( not ( = ?auto_771104 ?auto_771112 ) ) ( not ( = ?auto_771104 ?auto_771113 ) ) ( not ( = ?auto_771104 ?auto_771114 ) ) ( not ( = ?auto_771104 ?auto_771115 ) ) ( not ( = ?auto_771105 ?auto_771106 ) ) ( not ( = ?auto_771105 ?auto_771107 ) ) ( not ( = ?auto_771105 ?auto_771108 ) ) ( not ( = ?auto_771105 ?auto_771109 ) ) ( not ( = ?auto_771105 ?auto_771110 ) ) ( not ( = ?auto_771105 ?auto_771111 ) ) ( not ( = ?auto_771105 ?auto_771112 ) ) ( not ( = ?auto_771105 ?auto_771113 ) ) ( not ( = ?auto_771105 ?auto_771114 ) ) ( not ( = ?auto_771105 ?auto_771115 ) ) ( not ( = ?auto_771106 ?auto_771107 ) ) ( not ( = ?auto_771106 ?auto_771108 ) ) ( not ( = ?auto_771106 ?auto_771109 ) ) ( not ( = ?auto_771106 ?auto_771110 ) ) ( not ( = ?auto_771106 ?auto_771111 ) ) ( not ( = ?auto_771106 ?auto_771112 ) ) ( not ( = ?auto_771106 ?auto_771113 ) ) ( not ( = ?auto_771106 ?auto_771114 ) ) ( not ( = ?auto_771106 ?auto_771115 ) ) ( not ( = ?auto_771107 ?auto_771108 ) ) ( not ( = ?auto_771107 ?auto_771109 ) ) ( not ( = ?auto_771107 ?auto_771110 ) ) ( not ( = ?auto_771107 ?auto_771111 ) ) ( not ( = ?auto_771107 ?auto_771112 ) ) ( not ( = ?auto_771107 ?auto_771113 ) ) ( not ( = ?auto_771107 ?auto_771114 ) ) ( not ( = ?auto_771107 ?auto_771115 ) ) ( not ( = ?auto_771108 ?auto_771109 ) ) ( not ( = ?auto_771108 ?auto_771110 ) ) ( not ( = ?auto_771108 ?auto_771111 ) ) ( not ( = ?auto_771108 ?auto_771112 ) ) ( not ( = ?auto_771108 ?auto_771113 ) ) ( not ( = ?auto_771108 ?auto_771114 ) ) ( not ( = ?auto_771108 ?auto_771115 ) ) ( not ( = ?auto_771109 ?auto_771110 ) ) ( not ( = ?auto_771109 ?auto_771111 ) ) ( not ( = ?auto_771109 ?auto_771112 ) ) ( not ( = ?auto_771109 ?auto_771113 ) ) ( not ( = ?auto_771109 ?auto_771114 ) ) ( not ( = ?auto_771109 ?auto_771115 ) ) ( not ( = ?auto_771110 ?auto_771111 ) ) ( not ( = ?auto_771110 ?auto_771112 ) ) ( not ( = ?auto_771110 ?auto_771113 ) ) ( not ( = ?auto_771110 ?auto_771114 ) ) ( not ( = ?auto_771110 ?auto_771115 ) ) ( not ( = ?auto_771111 ?auto_771112 ) ) ( not ( = ?auto_771111 ?auto_771113 ) ) ( not ( = ?auto_771111 ?auto_771114 ) ) ( not ( = ?auto_771111 ?auto_771115 ) ) ( not ( = ?auto_771112 ?auto_771113 ) ) ( not ( = ?auto_771112 ?auto_771114 ) ) ( not ( = ?auto_771112 ?auto_771115 ) ) ( not ( = ?auto_771113 ?auto_771114 ) ) ( not ( = ?auto_771113 ?auto_771115 ) ) ( not ( = ?auto_771114 ?auto_771115 ) ) ( ON ?auto_771113 ?auto_771114 ) ( ON ?auto_771112 ?auto_771113 ) ( ON ?auto_771111 ?auto_771112 ) ( ON ?auto_771110 ?auto_771111 ) ( ON ?auto_771109 ?auto_771110 ) ( ON ?auto_771108 ?auto_771109 ) ( ON ?auto_771107 ?auto_771108 ) ( ON ?auto_771106 ?auto_771107 ) ( ON ?auto_771105 ?auto_771106 ) ( ON ?auto_771104 ?auto_771105 ) ( ON ?auto_771103 ?auto_771104 ) ( CLEAR ?auto_771101 ) ( ON ?auto_771102 ?auto_771103 ) ( CLEAR ?auto_771102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_771100 ?auto_771101 ?auto_771102 )
      ( MAKE-15PILE ?auto_771100 ?auto_771101 ?auto_771102 ?auto_771103 ?auto_771104 ?auto_771105 ?auto_771106 ?auto_771107 ?auto_771108 ?auto_771109 ?auto_771110 ?auto_771111 ?auto_771112 ?auto_771113 ?auto_771114 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_771162 - BLOCK
      ?auto_771163 - BLOCK
      ?auto_771164 - BLOCK
      ?auto_771165 - BLOCK
      ?auto_771166 - BLOCK
      ?auto_771167 - BLOCK
      ?auto_771168 - BLOCK
      ?auto_771169 - BLOCK
      ?auto_771170 - BLOCK
      ?auto_771171 - BLOCK
      ?auto_771172 - BLOCK
      ?auto_771173 - BLOCK
      ?auto_771174 - BLOCK
      ?auto_771175 - BLOCK
      ?auto_771176 - BLOCK
    )
    :vars
    (
      ?auto_771177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771176 ?auto_771177 ) ( ON-TABLE ?auto_771162 ) ( not ( = ?auto_771162 ?auto_771163 ) ) ( not ( = ?auto_771162 ?auto_771164 ) ) ( not ( = ?auto_771162 ?auto_771165 ) ) ( not ( = ?auto_771162 ?auto_771166 ) ) ( not ( = ?auto_771162 ?auto_771167 ) ) ( not ( = ?auto_771162 ?auto_771168 ) ) ( not ( = ?auto_771162 ?auto_771169 ) ) ( not ( = ?auto_771162 ?auto_771170 ) ) ( not ( = ?auto_771162 ?auto_771171 ) ) ( not ( = ?auto_771162 ?auto_771172 ) ) ( not ( = ?auto_771162 ?auto_771173 ) ) ( not ( = ?auto_771162 ?auto_771174 ) ) ( not ( = ?auto_771162 ?auto_771175 ) ) ( not ( = ?auto_771162 ?auto_771176 ) ) ( not ( = ?auto_771162 ?auto_771177 ) ) ( not ( = ?auto_771163 ?auto_771164 ) ) ( not ( = ?auto_771163 ?auto_771165 ) ) ( not ( = ?auto_771163 ?auto_771166 ) ) ( not ( = ?auto_771163 ?auto_771167 ) ) ( not ( = ?auto_771163 ?auto_771168 ) ) ( not ( = ?auto_771163 ?auto_771169 ) ) ( not ( = ?auto_771163 ?auto_771170 ) ) ( not ( = ?auto_771163 ?auto_771171 ) ) ( not ( = ?auto_771163 ?auto_771172 ) ) ( not ( = ?auto_771163 ?auto_771173 ) ) ( not ( = ?auto_771163 ?auto_771174 ) ) ( not ( = ?auto_771163 ?auto_771175 ) ) ( not ( = ?auto_771163 ?auto_771176 ) ) ( not ( = ?auto_771163 ?auto_771177 ) ) ( not ( = ?auto_771164 ?auto_771165 ) ) ( not ( = ?auto_771164 ?auto_771166 ) ) ( not ( = ?auto_771164 ?auto_771167 ) ) ( not ( = ?auto_771164 ?auto_771168 ) ) ( not ( = ?auto_771164 ?auto_771169 ) ) ( not ( = ?auto_771164 ?auto_771170 ) ) ( not ( = ?auto_771164 ?auto_771171 ) ) ( not ( = ?auto_771164 ?auto_771172 ) ) ( not ( = ?auto_771164 ?auto_771173 ) ) ( not ( = ?auto_771164 ?auto_771174 ) ) ( not ( = ?auto_771164 ?auto_771175 ) ) ( not ( = ?auto_771164 ?auto_771176 ) ) ( not ( = ?auto_771164 ?auto_771177 ) ) ( not ( = ?auto_771165 ?auto_771166 ) ) ( not ( = ?auto_771165 ?auto_771167 ) ) ( not ( = ?auto_771165 ?auto_771168 ) ) ( not ( = ?auto_771165 ?auto_771169 ) ) ( not ( = ?auto_771165 ?auto_771170 ) ) ( not ( = ?auto_771165 ?auto_771171 ) ) ( not ( = ?auto_771165 ?auto_771172 ) ) ( not ( = ?auto_771165 ?auto_771173 ) ) ( not ( = ?auto_771165 ?auto_771174 ) ) ( not ( = ?auto_771165 ?auto_771175 ) ) ( not ( = ?auto_771165 ?auto_771176 ) ) ( not ( = ?auto_771165 ?auto_771177 ) ) ( not ( = ?auto_771166 ?auto_771167 ) ) ( not ( = ?auto_771166 ?auto_771168 ) ) ( not ( = ?auto_771166 ?auto_771169 ) ) ( not ( = ?auto_771166 ?auto_771170 ) ) ( not ( = ?auto_771166 ?auto_771171 ) ) ( not ( = ?auto_771166 ?auto_771172 ) ) ( not ( = ?auto_771166 ?auto_771173 ) ) ( not ( = ?auto_771166 ?auto_771174 ) ) ( not ( = ?auto_771166 ?auto_771175 ) ) ( not ( = ?auto_771166 ?auto_771176 ) ) ( not ( = ?auto_771166 ?auto_771177 ) ) ( not ( = ?auto_771167 ?auto_771168 ) ) ( not ( = ?auto_771167 ?auto_771169 ) ) ( not ( = ?auto_771167 ?auto_771170 ) ) ( not ( = ?auto_771167 ?auto_771171 ) ) ( not ( = ?auto_771167 ?auto_771172 ) ) ( not ( = ?auto_771167 ?auto_771173 ) ) ( not ( = ?auto_771167 ?auto_771174 ) ) ( not ( = ?auto_771167 ?auto_771175 ) ) ( not ( = ?auto_771167 ?auto_771176 ) ) ( not ( = ?auto_771167 ?auto_771177 ) ) ( not ( = ?auto_771168 ?auto_771169 ) ) ( not ( = ?auto_771168 ?auto_771170 ) ) ( not ( = ?auto_771168 ?auto_771171 ) ) ( not ( = ?auto_771168 ?auto_771172 ) ) ( not ( = ?auto_771168 ?auto_771173 ) ) ( not ( = ?auto_771168 ?auto_771174 ) ) ( not ( = ?auto_771168 ?auto_771175 ) ) ( not ( = ?auto_771168 ?auto_771176 ) ) ( not ( = ?auto_771168 ?auto_771177 ) ) ( not ( = ?auto_771169 ?auto_771170 ) ) ( not ( = ?auto_771169 ?auto_771171 ) ) ( not ( = ?auto_771169 ?auto_771172 ) ) ( not ( = ?auto_771169 ?auto_771173 ) ) ( not ( = ?auto_771169 ?auto_771174 ) ) ( not ( = ?auto_771169 ?auto_771175 ) ) ( not ( = ?auto_771169 ?auto_771176 ) ) ( not ( = ?auto_771169 ?auto_771177 ) ) ( not ( = ?auto_771170 ?auto_771171 ) ) ( not ( = ?auto_771170 ?auto_771172 ) ) ( not ( = ?auto_771170 ?auto_771173 ) ) ( not ( = ?auto_771170 ?auto_771174 ) ) ( not ( = ?auto_771170 ?auto_771175 ) ) ( not ( = ?auto_771170 ?auto_771176 ) ) ( not ( = ?auto_771170 ?auto_771177 ) ) ( not ( = ?auto_771171 ?auto_771172 ) ) ( not ( = ?auto_771171 ?auto_771173 ) ) ( not ( = ?auto_771171 ?auto_771174 ) ) ( not ( = ?auto_771171 ?auto_771175 ) ) ( not ( = ?auto_771171 ?auto_771176 ) ) ( not ( = ?auto_771171 ?auto_771177 ) ) ( not ( = ?auto_771172 ?auto_771173 ) ) ( not ( = ?auto_771172 ?auto_771174 ) ) ( not ( = ?auto_771172 ?auto_771175 ) ) ( not ( = ?auto_771172 ?auto_771176 ) ) ( not ( = ?auto_771172 ?auto_771177 ) ) ( not ( = ?auto_771173 ?auto_771174 ) ) ( not ( = ?auto_771173 ?auto_771175 ) ) ( not ( = ?auto_771173 ?auto_771176 ) ) ( not ( = ?auto_771173 ?auto_771177 ) ) ( not ( = ?auto_771174 ?auto_771175 ) ) ( not ( = ?auto_771174 ?auto_771176 ) ) ( not ( = ?auto_771174 ?auto_771177 ) ) ( not ( = ?auto_771175 ?auto_771176 ) ) ( not ( = ?auto_771175 ?auto_771177 ) ) ( not ( = ?auto_771176 ?auto_771177 ) ) ( ON ?auto_771175 ?auto_771176 ) ( ON ?auto_771174 ?auto_771175 ) ( ON ?auto_771173 ?auto_771174 ) ( ON ?auto_771172 ?auto_771173 ) ( ON ?auto_771171 ?auto_771172 ) ( ON ?auto_771170 ?auto_771171 ) ( ON ?auto_771169 ?auto_771170 ) ( ON ?auto_771168 ?auto_771169 ) ( ON ?auto_771167 ?auto_771168 ) ( ON ?auto_771166 ?auto_771167 ) ( ON ?auto_771165 ?auto_771166 ) ( ON ?auto_771164 ?auto_771165 ) ( CLEAR ?auto_771162 ) ( ON ?auto_771163 ?auto_771164 ) ( CLEAR ?auto_771163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_771162 ?auto_771163 )
      ( MAKE-15PILE ?auto_771162 ?auto_771163 ?auto_771164 ?auto_771165 ?auto_771166 ?auto_771167 ?auto_771168 ?auto_771169 ?auto_771170 ?auto_771171 ?auto_771172 ?auto_771173 ?auto_771174 ?auto_771175 ?auto_771176 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_771224 - BLOCK
      ?auto_771225 - BLOCK
      ?auto_771226 - BLOCK
      ?auto_771227 - BLOCK
      ?auto_771228 - BLOCK
      ?auto_771229 - BLOCK
      ?auto_771230 - BLOCK
      ?auto_771231 - BLOCK
      ?auto_771232 - BLOCK
      ?auto_771233 - BLOCK
      ?auto_771234 - BLOCK
      ?auto_771235 - BLOCK
      ?auto_771236 - BLOCK
      ?auto_771237 - BLOCK
      ?auto_771238 - BLOCK
    )
    :vars
    (
      ?auto_771239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771238 ?auto_771239 ) ( not ( = ?auto_771224 ?auto_771225 ) ) ( not ( = ?auto_771224 ?auto_771226 ) ) ( not ( = ?auto_771224 ?auto_771227 ) ) ( not ( = ?auto_771224 ?auto_771228 ) ) ( not ( = ?auto_771224 ?auto_771229 ) ) ( not ( = ?auto_771224 ?auto_771230 ) ) ( not ( = ?auto_771224 ?auto_771231 ) ) ( not ( = ?auto_771224 ?auto_771232 ) ) ( not ( = ?auto_771224 ?auto_771233 ) ) ( not ( = ?auto_771224 ?auto_771234 ) ) ( not ( = ?auto_771224 ?auto_771235 ) ) ( not ( = ?auto_771224 ?auto_771236 ) ) ( not ( = ?auto_771224 ?auto_771237 ) ) ( not ( = ?auto_771224 ?auto_771238 ) ) ( not ( = ?auto_771224 ?auto_771239 ) ) ( not ( = ?auto_771225 ?auto_771226 ) ) ( not ( = ?auto_771225 ?auto_771227 ) ) ( not ( = ?auto_771225 ?auto_771228 ) ) ( not ( = ?auto_771225 ?auto_771229 ) ) ( not ( = ?auto_771225 ?auto_771230 ) ) ( not ( = ?auto_771225 ?auto_771231 ) ) ( not ( = ?auto_771225 ?auto_771232 ) ) ( not ( = ?auto_771225 ?auto_771233 ) ) ( not ( = ?auto_771225 ?auto_771234 ) ) ( not ( = ?auto_771225 ?auto_771235 ) ) ( not ( = ?auto_771225 ?auto_771236 ) ) ( not ( = ?auto_771225 ?auto_771237 ) ) ( not ( = ?auto_771225 ?auto_771238 ) ) ( not ( = ?auto_771225 ?auto_771239 ) ) ( not ( = ?auto_771226 ?auto_771227 ) ) ( not ( = ?auto_771226 ?auto_771228 ) ) ( not ( = ?auto_771226 ?auto_771229 ) ) ( not ( = ?auto_771226 ?auto_771230 ) ) ( not ( = ?auto_771226 ?auto_771231 ) ) ( not ( = ?auto_771226 ?auto_771232 ) ) ( not ( = ?auto_771226 ?auto_771233 ) ) ( not ( = ?auto_771226 ?auto_771234 ) ) ( not ( = ?auto_771226 ?auto_771235 ) ) ( not ( = ?auto_771226 ?auto_771236 ) ) ( not ( = ?auto_771226 ?auto_771237 ) ) ( not ( = ?auto_771226 ?auto_771238 ) ) ( not ( = ?auto_771226 ?auto_771239 ) ) ( not ( = ?auto_771227 ?auto_771228 ) ) ( not ( = ?auto_771227 ?auto_771229 ) ) ( not ( = ?auto_771227 ?auto_771230 ) ) ( not ( = ?auto_771227 ?auto_771231 ) ) ( not ( = ?auto_771227 ?auto_771232 ) ) ( not ( = ?auto_771227 ?auto_771233 ) ) ( not ( = ?auto_771227 ?auto_771234 ) ) ( not ( = ?auto_771227 ?auto_771235 ) ) ( not ( = ?auto_771227 ?auto_771236 ) ) ( not ( = ?auto_771227 ?auto_771237 ) ) ( not ( = ?auto_771227 ?auto_771238 ) ) ( not ( = ?auto_771227 ?auto_771239 ) ) ( not ( = ?auto_771228 ?auto_771229 ) ) ( not ( = ?auto_771228 ?auto_771230 ) ) ( not ( = ?auto_771228 ?auto_771231 ) ) ( not ( = ?auto_771228 ?auto_771232 ) ) ( not ( = ?auto_771228 ?auto_771233 ) ) ( not ( = ?auto_771228 ?auto_771234 ) ) ( not ( = ?auto_771228 ?auto_771235 ) ) ( not ( = ?auto_771228 ?auto_771236 ) ) ( not ( = ?auto_771228 ?auto_771237 ) ) ( not ( = ?auto_771228 ?auto_771238 ) ) ( not ( = ?auto_771228 ?auto_771239 ) ) ( not ( = ?auto_771229 ?auto_771230 ) ) ( not ( = ?auto_771229 ?auto_771231 ) ) ( not ( = ?auto_771229 ?auto_771232 ) ) ( not ( = ?auto_771229 ?auto_771233 ) ) ( not ( = ?auto_771229 ?auto_771234 ) ) ( not ( = ?auto_771229 ?auto_771235 ) ) ( not ( = ?auto_771229 ?auto_771236 ) ) ( not ( = ?auto_771229 ?auto_771237 ) ) ( not ( = ?auto_771229 ?auto_771238 ) ) ( not ( = ?auto_771229 ?auto_771239 ) ) ( not ( = ?auto_771230 ?auto_771231 ) ) ( not ( = ?auto_771230 ?auto_771232 ) ) ( not ( = ?auto_771230 ?auto_771233 ) ) ( not ( = ?auto_771230 ?auto_771234 ) ) ( not ( = ?auto_771230 ?auto_771235 ) ) ( not ( = ?auto_771230 ?auto_771236 ) ) ( not ( = ?auto_771230 ?auto_771237 ) ) ( not ( = ?auto_771230 ?auto_771238 ) ) ( not ( = ?auto_771230 ?auto_771239 ) ) ( not ( = ?auto_771231 ?auto_771232 ) ) ( not ( = ?auto_771231 ?auto_771233 ) ) ( not ( = ?auto_771231 ?auto_771234 ) ) ( not ( = ?auto_771231 ?auto_771235 ) ) ( not ( = ?auto_771231 ?auto_771236 ) ) ( not ( = ?auto_771231 ?auto_771237 ) ) ( not ( = ?auto_771231 ?auto_771238 ) ) ( not ( = ?auto_771231 ?auto_771239 ) ) ( not ( = ?auto_771232 ?auto_771233 ) ) ( not ( = ?auto_771232 ?auto_771234 ) ) ( not ( = ?auto_771232 ?auto_771235 ) ) ( not ( = ?auto_771232 ?auto_771236 ) ) ( not ( = ?auto_771232 ?auto_771237 ) ) ( not ( = ?auto_771232 ?auto_771238 ) ) ( not ( = ?auto_771232 ?auto_771239 ) ) ( not ( = ?auto_771233 ?auto_771234 ) ) ( not ( = ?auto_771233 ?auto_771235 ) ) ( not ( = ?auto_771233 ?auto_771236 ) ) ( not ( = ?auto_771233 ?auto_771237 ) ) ( not ( = ?auto_771233 ?auto_771238 ) ) ( not ( = ?auto_771233 ?auto_771239 ) ) ( not ( = ?auto_771234 ?auto_771235 ) ) ( not ( = ?auto_771234 ?auto_771236 ) ) ( not ( = ?auto_771234 ?auto_771237 ) ) ( not ( = ?auto_771234 ?auto_771238 ) ) ( not ( = ?auto_771234 ?auto_771239 ) ) ( not ( = ?auto_771235 ?auto_771236 ) ) ( not ( = ?auto_771235 ?auto_771237 ) ) ( not ( = ?auto_771235 ?auto_771238 ) ) ( not ( = ?auto_771235 ?auto_771239 ) ) ( not ( = ?auto_771236 ?auto_771237 ) ) ( not ( = ?auto_771236 ?auto_771238 ) ) ( not ( = ?auto_771236 ?auto_771239 ) ) ( not ( = ?auto_771237 ?auto_771238 ) ) ( not ( = ?auto_771237 ?auto_771239 ) ) ( not ( = ?auto_771238 ?auto_771239 ) ) ( ON ?auto_771237 ?auto_771238 ) ( ON ?auto_771236 ?auto_771237 ) ( ON ?auto_771235 ?auto_771236 ) ( ON ?auto_771234 ?auto_771235 ) ( ON ?auto_771233 ?auto_771234 ) ( ON ?auto_771232 ?auto_771233 ) ( ON ?auto_771231 ?auto_771232 ) ( ON ?auto_771230 ?auto_771231 ) ( ON ?auto_771229 ?auto_771230 ) ( ON ?auto_771228 ?auto_771229 ) ( ON ?auto_771227 ?auto_771228 ) ( ON ?auto_771226 ?auto_771227 ) ( ON ?auto_771225 ?auto_771226 ) ( ON ?auto_771224 ?auto_771225 ) ( CLEAR ?auto_771224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_771224 )
      ( MAKE-15PILE ?auto_771224 ?auto_771225 ?auto_771226 ?auto_771227 ?auto_771228 ?auto_771229 ?auto_771230 ?auto_771231 ?auto_771232 ?auto_771233 ?auto_771234 ?auto_771235 ?auto_771236 ?auto_771237 ?auto_771238 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_771287 - BLOCK
      ?auto_771288 - BLOCK
      ?auto_771289 - BLOCK
      ?auto_771290 - BLOCK
      ?auto_771291 - BLOCK
      ?auto_771292 - BLOCK
      ?auto_771293 - BLOCK
      ?auto_771294 - BLOCK
      ?auto_771295 - BLOCK
      ?auto_771296 - BLOCK
      ?auto_771297 - BLOCK
      ?auto_771298 - BLOCK
      ?auto_771299 - BLOCK
      ?auto_771300 - BLOCK
      ?auto_771301 - BLOCK
      ?auto_771302 - BLOCK
    )
    :vars
    (
      ?auto_771303 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_771301 ) ( ON ?auto_771302 ?auto_771303 ) ( CLEAR ?auto_771302 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_771287 ) ( ON ?auto_771288 ?auto_771287 ) ( ON ?auto_771289 ?auto_771288 ) ( ON ?auto_771290 ?auto_771289 ) ( ON ?auto_771291 ?auto_771290 ) ( ON ?auto_771292 ?auto_771291 ) ( ON ?auto_771293 ?auto_771292 ) ( ON ?auto_771294 ?auto_771293 ) ( ON ?auto_771295 ?auto_771294 ) ( ON ?auto_771296 ?auto_771295 ) ( ON ?auto_771297 ?auto_771296 ) ( ON ?auto_771298 ?auto_771297 ) ( ON ?auto_771299 ?auto_771298 ) ( ON ?auto_771300 ?auto_771299 ) ( ON ?auto_771301 ?auto_771300 ) ( not ( = ?auto_771287 ?auto_771288 ) ) ( not ( = ?auto_771287 ?auto_771289 ) ) ( not ( = ?auto_771287 ?auto_771290 ) ) ( not ( = ?auto_771287 ?auto_771291 ) ) ( not ( = ?auto_771287 ?auto_771292 ) ) ( not ( = ?auto_771287 ?auto_771293 ) ) ( not ( = ?auto_771287 ?auto_771294 ) ) ( not ( = ?auto_771287 ?auto_771295 ) ) ( not ( = ?auto_771287 ?auto_771296 ) ) ( not ( = ?auto_771287 ?auto_771297 ) ) ( not ( = ?auto_771287 ?auto_771298 ) ) ( not ( = ?auto_771287 ?auto_771299 ) ) ( not ( = ?auto_771287 ?auto_771300 ) ) ( not ( = ?auto_771287 ?auto_771301 ) ) ( not ( = ?auto_771287 ?auto_771302 ) ) ( not ( = ?auto_771287 ?auto_771303 ) ) ( not ( = ?auto_771288 ?auto_771289 ) ) ( not ( = ?auto_771288 ?auto_771290 ) ) ( not ( = ?auto_771288 ?auto_771291 ) ) ( not ( = ?auto_771288 ?auto_771292 ) ) ( not ( = ?auto_771288 ?auto_771293 ) ) ( not ( = ?auto_771288 ?auto_771294 ) ) ( not ( = ?auto_771288 ?auto_771295 ) ) ( not ( = ?auto_771288 ?auto_771296 ) ) ( not ( = ?auto_771288 ?auto_771297 ) ) ( not ( = ?auto_771288 ?auto_771298 ) ) ( not ( = ?auto_771288 ?auto_771299 ) ) ( not ( = ?auto_771288 ?auto_771300 ) ) ( not ( = ?auto_771288 ?auto_771301 ) ) ( not ( = ?auto_771288 ?auto_771302 ) ) ( not ( = ?auto_771288 ?auto_771303 ) ) ( not ( = ?auto_771289 ?auto_771290 ) ) ( not ( = ?auto_771289 ?auto_771291 ) ) ( not ( = ?auto_771289 ?auto_771292 ) ) ( not ( = ?auto_771289 ?auto_771293 ) ) ( not ( = ?auto_771289 ?auto_771294 ) ) ( not ( = ?auto_771289 ?auto_771295 ) ) ( not ( = ?auto_771289 ?auto_771296 ) ) ( not ( = ?auto_771289 ?auto_771297 ) ) ( not ( = ?auto_771289 ?auto_771298 ) ) ( not ( = ?auto_771289 ?auto_771299 ) ) ( not ( = ?auto_771289 ?auto_771300 ) ) ( not ( = ?auto_771289 ?auto_771301 ) ) ( not ( = ?auto_771289 ?auto_771302 ) ) ( not ( = ?auto_771289 ?auto_771303 ) ) ( not ( = ?auto_771290 ?auto_771291 ) ) ( not ( = ?auto_771290 ?auto_771292 ) ) ( not ( = ?auto_771290 ?auto_771293 ) ) ( not ( = ?auto_771290 ?auto_771294 ) ) ( not ( = ?auto_771290 ?auto_771295 ) ) ( not ( = ?auto_771290 ?auto_771296 ) ) ( not ( = ?auto_771290 ?auto_771297 ) ) ( not ( = ?auto_771290 ?auto_771298 ) ) ( not ( = ?auto_771290 ?auto_771299 ) ) ( not ( = ?auto_771290 ?auto_771300 ) ) ( not ( = ?auto_771290 ?auto_771301 ) ) ( not ( = ?auto_771290 ?auto_771302 ) ) ( not ( = ?auto_771290 ?auto_771303 ) ) ( not ( = ?auto_771291 ?auto_771292 ) ) ( not ( = ?auto_771291 ?auto_771293 ) ) ( not ( = ?auto_771291 ?auto_771294 ) ) ( not ( = ?auto_771291 ?auto_771295 ) ) ( not ( = ?auto_771291 ?auto_771296 ) ) ( not ( = ?auto_771291 ?auto_771297 ) ) ( not ( = ?auto_771291 ?auto_771298 ) ) ( not ( = ?auto_771291 ?auto_771299 ) ) ( not ( = ?auto_771291 ?auto_771300 ) ) ( not ( = ?auto_771291 ?auto_771301 ) ) ( not ( = ?auto_771291 ?auto_771302 ) ) ( not ( = ?auto_771291 ?auto_771303 ) ) ( not ( = ?auto_771292 ?auto_771293 ) ) ( not ( = ?auto_771292 ?auto_771294 ) ) ( not ( = ?auto_771292 ?auto_771295 ) ) ( not ( = ?auto_771292 ?auto_771296 ) ) ( not ( = ?auto_771292 ?auto_771297 ) ) ( not ( = ?auto_771292 ?auto_771298 ) ) ( not ( = ?auto_771292 ?auto_771299 ) ) ( not ( = ?auto_771292 ?auto_771300 ) ) ( not ( = ?auto_771292 ?auto_771301 ) ) ( not ( = ?auto_771292 ?auto_771302 ) ) ( not ( = ?auto_771292 ?auto_771303 ) ) ( not ( = ?auto_771293 ?auto_771294 ) ) ( not ( = ?auto_771293 ?auto_771295 ) ) ( not ( = ?auto_771293 ?auto_771296 ) ) ( not ( = ?auto_771293 ?auto_771297 ) ) ( not ( = ?auto_771293 ?auto_771298 ) ) ( not ( = ?auto_771293 ?auto_771299 ) ) ( not ( = ?auto_771293 ?auto_771300 ) ) ( not ( = ?auto_771293 ?auto_771301 ) ) ( not ( = ?auto_771293 ?auto_771302 ) ) ( not ( = ?auto_771293 ?auto_771303 ) ) ( not ( = ?auto_771294 ?auto_771295 ) ) ( not ( = ?auto_771294 ?auto_771296 ) ) ( not ( = ?auto_771294 ?auto_771297 ) ) ( not ( = ?auto_771294 ?auto_771298 ) ) ( not ( = ?auto_771294 ?auto_771299 ) ) ( not ( = ?auto_771294 ?auto_771300 ) ) ( not ( = ?auto_771294 ?auto_771301 ) ) ( not ( = ?auto_771294 ?auto_771302 ) ) ( not ( = ?auto_771294 ?auto_771303 ) ) ( not ( = ?auto_771295 ?auto_771296 ) ) ( not ( = ?auto_771295 ?auto_771297 ) ) ( not ( = ?auto_771295 ?auto_771298 ) ) ( not ( = ?auto_771295 ?auto_771299 ) ) ( not ( = ?auto_771295 ?auto_771300 ) ) ( not ( = ?auto_771295 ?auto_771301 ) ) ( not ( = ?auto_771295 ?auto_771302 ) ) ( not ( = ?auto_771295 ?auto_771303 ) ) ( not ( = ?auto_771296 ?auto_771297 ) ) ( not ( = ?auto_771296 ?auto_771298 ) ) ( not ( = ?auto_771296 ?auto_771299 ) ) ( not ( = ?auto_771296 ?auto_771300 ) ) ( not ( = ?auto_771296 ?auto_771301 ) ) ( not ( = ?auto_771296 ?auto_771302 ) ) ( not ( = ?auto_771296 ?auto_771303 ) ) ( not ( = ?auto_771297 ?auto_771298 ) ) ( not ( = ?auto_771297 ?auto_771299 ) ) ( not ( = ?auto_771297 ?auto_771300 ) ) ( not ( = ?auto_771297 ?auto_771301 ) ) ( not ( = ?auto_771297 ?auto_771302 ) ) ( not ( = ?auto_771297 ?auto_771303 ) ) ( not ( = ?auto_771298 ?auto_771299 ) ) ( not ( = ?auto_771298 ?auto_771300 ) ) ( not ( = ?auto_771298 ?auto_771301 ) ) ( not ( = ?auto_771298 ?auto_771302 ) ) ( not ( = ?auto_771298 ?auto_771303 ) ) ( not ( = ?auto_771299 ?auto_771300 ) ) ( not ( = ?auto_771299 ?auto_771301 ) ) ( not ( = ?auto_771299 ?auto_771302 ) ) ( not ( = ?auto_771299 ?auto_771303 ) ) ( not ( = ?auto_771300 ?auto_771301 ) ) ( not ( = ?auto_771300 ?auto_771302 ) ) ( not ( = ?auto_771300 ?auto_771303 ) ) ( not ( = ?auto_771301 ?auto_771302 ) ) ( not ( = ?auto_771301 ?auto_771303 ) ) ( not ( = ?auto_771302 ?auto_771303 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_771302 ?auto_771303 )
      ( !STACK ?auto_771302 ?auto_771301 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_771353 - BLOCK
      ?auto_771354 - BLOCK
      ?auto_771355 - BLOCK
      ?auto_771356 - BLOCK
      ?auto_771357 - BLOCK
      ?auto_771358 - BLOCK
      ?auto_771359 - BLOCK
      ?auto_771360 - BLOCK
      ?auto_771361 - BLOCK
      ?auto_771362 - BLOCK
      ?auto_771363 - BLOCK
      ?auto_771364 - BLOCK
      ?auto_771365 - BLOCK
      ?auto_771366 - BLOCK
      ?auto_771367 - BLOCK
      ?auto_771368 - BLOCK
    )
    :vars
    (
      ?auto_771369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771368 ?auto_771369 ) ( ON-TABLE ?auto_771353 ) ( ON ?auto_771354 ?auto_771353 ) ( ON ?auto_771355 ?auto_771354 ) ( ON ?auto_771356 ?auto_771355 ) ( ON ?auto_771357 ?auto_771356 ) ( ON ?auto_771358 ?auto_771357 ) ( ON ?auto_771359 ?auto_771358 ) ( ON ?auto_771360 ?auto_771359 ) ( ON ?auto_771361 ?auto_771360 ) ( ON ?auto_771362 ?auto_771361 ) ( ON ?auto_771363 ?auto_771362 ) ( ON ?auto_771364 ?auto_771363 ) ( ON ?auto_771365 ?auto_771364 ) ( ON ?auto_771366 ?auto_771365 ) ( not ( = ?auto_771353 ?auto_771354 ) ) ( not ( = ?auto_771353 ?auto_771355 ) ) ( not ( = ?auto_771353 ?auto_771356 ) ) ( not ( = ?auto_771353 ?auto_771357 ) ) ( not ( = ?auto_771353 ?auto_771358 ) ) ( not ( = ?auto_771353 ?auto_771359 ) ) ( not ( = ?auto_771353 ?auto_771360 ) ) ( not ( = ?auto_771353 ?auto_771361 ) ) ( not ( = ?auto_771353 ?auto_771362 ) ) ( not ( = ?auto_771353 ?auto_771363 ) ) ( not ( = ?auto_771353 ?auto_771364 ) ) ( not ( = ?auto_771353 ?auto_771365 ) ) ( not ( = ?auto_771353 ?auto_771366 ) ) ( not ( = ?auto_771353 ?auto_771367 ) ) ( not ( = ?auto_771353 ?auto_771368 ) ) ( not ( = ?auto_771353 ?auto_771369 ) ) ( not ( = ?auto_771354 ?auto_771355 ) ) ( not ( = ?auto_771354 ?auto_771356 ) ) ( not ( = ?auto_771354 ?auto_771357 ) ) ( not ( = ?auto_771354 ?auto_771358 ) ) ( not ( = ?auto_771354 ?auto_771359 ) ) ( not ( = ?auto_771354 ?auto_771360 ) ) ( not ( = ?auto_771354 ?auto_771361 ) ) ( not ( = ?auto_771354 ?auto_771362 ) ) ( not ( = ?auto_771354 ?auto_771363 ) ) ( not ( = ?auto_771354 ?auto_771364 ) ) ( not ( = ?auto_771354 ?auto_771365 ) ) ( not ( = ?auto_771354 ?auto_771366 ) ) ( not ( = ?auto_771354 ?auto_771367 ) ) ( not ( = ?auto_771354 ?auto_771368 ) ) ( not ( = ?auto_771354 ?auto_771369 ) ) ( not ( = ?auto_771355 ?auto_771356 ) ) ( not ( = ?auto_771355 ?auto_771357 ) ) ( not ( = ?auto_771355 ?auto_771358 ) ) ( not ( = ?auto_771355 ?auto_771359 ) ) ( not ( = ?auto_771355 ?auto_771360 ) ) ( not ( = ?auto_771355 ?auto_771361 ) ) ( not ( = ?auto_771355 ?auto_771362 ) ) ( not ( = ?auto_771355 ?auto_771363 ) ) ( not ( = ?auto_771355 ?auto_771364 ) ) ( not ( = ?auto_771355 ?auto_771365 ) ) ( not ( = ?auto_771355 ?auto_771366 ) ) ( not ( = ?auto_771355 ?auto_771367 ) ) ( not ( = ?auto_771355 ?auto_771368 ) ) ( not ( = ?auto_771355 ?auto_771369 ) ) ( not ( = ?auto_771356 ?auto_771357 ) ) ( not ( = ?auto_771356 ?auto_771358 ) ) ( not ( = ?auto_771356 ?auto_771359 ) ) ( not ( = ?auto_771356 ?auto_771360 ) ) ( not ( = ?auto_771356 ?auto_771361 ) ) ( not ( = ?auto_771356 ?auto_771362 ) ) ( not ( = ?auto_771356 ?auto_771363 ) ) ( not ( = ?auto_771356 ?auto_771364 ) ) ( not ( = ?auto_771356 ?auto_771365 ) ) ( not ( = ?auto_771356 ?auto_771366 ) ) ( not ( = ?auto_771356 ?auto_771367 ) ) ( not ( = ?auto_771356 ?auto_771368 ) ) ( not ( = ?auto_771356 ?auto_771369 ) ) ( not ( = ?auto_771357 ?auto_771358 ) ) ( not ( = ?auto_771357 ?auto_771359 ) ) ( not ( = ?auto_771357 ?auto_771360 ) ) ( not ( = ?auto_771357 ?auto_771361 ) ) ( not ( = ?auto_771357 ?auto_771362 ) ) ( not ( = ?auto_771357 ?auto_771363 ) ) ( not ( = ?auto_771357 ?auto_771364 ) ) ( not ( = ?auto_771357 ?auto_771365 ) ) ( not ( = ?auto_771357 ?auto_771366 ) ) ( not ( = ?auto_771357 ?auto_771367 ) ) ( not ( = ?auto_771357 ?auto_771368 ) ) ( not ( = ?auto_771357 ?auto_771369 ) ) ( not ( = ?auto_771358 ?auto_771359 ) ) ( not ( = ?auto_771358 ?auto_771360 ) ) ( not ( = ?auto_771358 ?auto_771361 ) ) ( not ( = ?auto_771358 ?auto_771362 ) ) ( not ( = ?auto_771358 ?auto_771363 ) ) ( not ( = ?auto_771358 ?auto_771364 ) ) ( not ( = ?auto_771358 ?auto_771365 ) ) ( not ( = ?auto_771358 ?auto_771366 ) ) ( not ( = ?auto_771358 ?auto_771367 ) ) ( not ( = ?auto_771358 ?auto_771368 ) ) ( not ( = ?auto_771358 ?auto_771369 ) ) ( not ( = ?auto_771359 ?auto_771360 ) ) ( not ( = ?auto_771359 ?auto_771361 ) ) ( not ( = ?auto_771359 ?auto_771362 ) ) ( not ( = ?auto_771359 ?auto_771363 ) ) ( not ( = ?auto_771359 ?auto_771364 ) ) ( not ( = ?auto_771359 ?auto_771365 ) ) ( not ( = ?auto_771359 ?auto_771366 ) ) ( not ( = ?auto_771359 ?auto_771367 ) ) ( not ( = ?auto_771359 ?auto_771368 ) ) ( not ( = ?auto_771359 ?auto_771369 ) ) ( not ( = ?auto_771360 ?auto_771361 ) ) ( not ( = ?auto_771360 ?auto_771362 ) ) ( not ( = ?auto_771360 ?auto_771363 ) ) ( not ( = ?auto_771360 ?auto_771364 ) ) ( not ( = ?auto_771360 ?auto_771365 ) ) ( not ( = ?auto_771360 ?auto_771366 ) ) ( not ( = ?auto_771360 ?auto_771367 ) ) ( not ( = ?auto_771360 ?auto_771368 ) ) ( not ( = ?auto_771360 ?auto_771369 ) ) ( not ( = ?auto_771361 ?auto_771362 ) ) ( not ( = ?auto_771361 ?auto_771363 ) ) ( not ( = ?auto_771361 ?auto_771364 ) ) ( not ( = ?auto_771361 ?auto_771365 ) ) ( not ( = ?auto_771361 ?auto_771366 ) ) ( not ( = ?auto_771361 ?auto_771367 ) ) ( not ( = ?auto_771361 ?auto_771368 ) ) ( not ( = ?auto_771361 ?auto_771369 ) ) ( not ( = ?auto_771362 ?auto_771363 ) ) ( not ( = ?auto_771362 ?auto_771364 ) ) ( not ( = ?auto_771362 ?auto_771365 ) ) ( not ( = ?auto_771362 ?auto_771366 ) ) ( not ( = ?auto_771362 ?auto_771367 ) ) ( not ( = ?auto_771362 ?auto_771368 ) ) ( not ( = ?auto_771362 ?auto_771369 ) ) ( not ( = ?auto_771363 ?auto_771364 ) ) ( not ( = ?auto_771363 ?auto_771365 ) ) ( not ( = ?auto_771363 ?auto_771366 ) ) ( not ( = ?auto_771363 ?auto_771367 ) ) ( not ( = ?auto_771363 ?auto_771368 ) ) ( not ( = ?auto_771363 ?auto_771369 ) ) ( not ( = ?auto_771364 ?auto_771365 ) ) ( not ( = ?auto_771364 ?auto_771366 ) ) ( not ( = ?auto_771364 ?auto_771367 ) ) ( not ( = ?auto_771364 ?auto_771368 ) ) ( not ( = ?auto_771364 ?auto_771369 ) ) ( not ( = ?auto_771365 ?auto_771366 ) ) ( not ( = ?auto_771365 ?auto_771367 ) ) ( not ( = ?auto_771365 ?auto_771368 ) ) ( not ( = ?auto_771365 ?auto_771369 ) ) ( not ( = ?auto_771366 ?auto_771367 ) ) ( not ( = ?auto_771366 ?auto_771368 ) ) ( not ( = ?auto_771366 ?auto_771369 ) ) ( not ( = ?auto_771367 ?auto_771368 ) ) ( not ( = ?auto_771367 ?auto_771369 ) ) ( not ( = ?auto_771368 ?auto_771369 ) ) ( CLEAR ?auto_771366 ) ( ON ?auto_771367 ?auto_771368 ) ( CLEAR ?auto_771367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_771353 ?auto_771354 ?auto_771355 ?auto_771356 ?auto_771357 ?auto_771358 ?auto_771359 ?auto_771360 ?auto_771361 ?auto_771362 ?auto_771363 ?auto_771364 ?auto_771365 ?auto_771366 ?auto_771367 )
      ( MAKE-16PILE ?auto_771353 ?auto_771354 ?auto_771355 ?auto_771356 ?auto_771357 ?auto_771358 ?auto_771359 ?auto_771360 ?auto_771361 ?auto_771362 ?auto_771363 ?auto_771364 ?auto_771365 ?auto_771366 ?auto_771367 ?auto_771368 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_771419 - BLOCK
      ?auto_771420 - BLOCK
      ?auto_771421 - BLOCK
      ?auto_771422 - BLOCK
      ?auto_771423 - BLOCK
      ?auto_771424 - BLOCK
      ?auto_771425 - BLOCK
      ?auto_771426 - BLOCK
      ?auto_771427 - BLOCK
      ?auto_771428 - BLOCK
      ?auto_771429 - BLOCK
      ?auto_771430 - BLOCK
      ?auto_771431 - BLOCK
      ?auto_771432 - BLOCK
      ?auto_771433 - BLOCK
      ?auto_771434 - BLOCK
    )
    :vars
    (
      ?auto_771435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771434 ?auto_771435 ) ( ON-TABLE ?auto_771419 ) ( ON ?auto_771420 ?auto_771419 ) ( ON ?auto_771421 ?auto_771420 ) ( ON ?auto_771422 ?auto_771421 ) ( ON ?auto_771423 ?auto_771422 ) ( ON ?auto_771424 ?auto_771423 ) ( ON ?auto_771425 ?auto_771424 ) ( ON ?auto_771426 ?auto_771425 ) ( ON ?auto_771427 ?auto_771426 ) ( ON ?auto_771428 ?auto_771427 ) ( ON ?auto_771429 ?auto_771428 ) ( ON ?auto_771430 ?auto_771429 ) ( ON ?auto_771431 ?auto_771430 ) ( not ( = ?auto_771419 ?auto_771420 ) ) ( not ( = ?auto_771419 ?auto_771421 ) ) ( not ( = ?auto_771419 ?auto_771422 ) ) ( not ( = ?auto_771419 ?auto_771423 ) ) ( not ( = ?auto_771419 ?auto_771424 ) ) ( not ( = ?auto_771419 ?auto_771425 ) ) ( not ( = ?auto_771419 ?auto_771426 ) ) ( not ( = ?auto_771419 ?auto_771427 ) ) ( not ( = ?auto_771419 ?auto_771428 ) ) ( not ( = ?auto_771419 ?auto_771429 ) ) ( not ( = ?auto_771419 ?auto_771430 ) ) ( not ( = ?auto_771419 ?auto_771431 ) ) ( not ( = ?auto_771419 ?auto_771432 ) ) ( not ( = ?auto_771419 ?auto_771433 ) ) ( not ( = ?auto_771419 ?auto_771434 ) ) ( not ( = ?auto_771419 ?auto_771435 ) ) ( not ( = ?auto_771420 ?auto_771421 ) ) ( not ( = ?auto_771420 ?auto_771422 ) ) ( not ( = ?auto_771420 ?auto_771423 ) ) ( not ( = ?auto_771420 ?auto_771424 ) ) ( not ( = ?auto_771420 ?auto_771425 ) ) ( not ( = ?auto_771420 ?auto_771426 ) ) ( not ( = ?auto_771420 ?auto_771427 ) ) ( not ( = ?auto_771420 ?auto_771428 ) ) ( not ( = ?auto_771420 ?auto_771429 ) ) ( not ( = ?auto_771420 ?auto_771430 ) ) ( not ( = ?auto_771420 ?auto_771431 ) ) ( not ( = ?auto_771420 ?auto_771432 ) ) ( not ( = ?auto_771420 ?auto_771433 ) ) ( not ( = ?auto_771420 ?auto_771434 ) ) ( not ( = ?auto_771420 ?auto_771435 ) ) ( not ( = ?auto_771421 ?auto_771422 ) ) ( not ( = ?auto_771421 ?auto_771423 ) ) ( not ( = ?auto_771421 ?auto_771424 ) ) ( not ( = ?auto_771421 ?auto_771425 ) ) ( not ( = ?auto_771421 ?auto_771426 ) ) ( not ( = ?auto_771421 ?auto_771427 ) ) ( not ( = ?auto_771421 ?auto_771428 ) ) ( not ( = ?auto_771421 ?auto_771429 ) ) ( not ( = ?auto_771421 ?auto_771430 ) ) ( not ( = ?auto_771421 ?auto_771431 ) ) ( not ( = ?auto_771421 ?auto_771432 ) ) ( not ( = ?auto_771421 ?auto_771433 ) ) ( not ( = ?auto_771421 ?auto_771434 ) ) ( not ( = ?auto_771421 ?auto_771435 ) ) ( not ( = ?auto_771422 ?auto_771423 ) ) ( not ( = ?auto_771422 ?auto_771424 ) ) ( not ( = ?auto_771422 ?auto_771425 ) ) ( not ( = ?auto_771422 ?auto_771426 ) ) ( not ( = ?auto_771422 ?auto_771427 ) ) ( not ( = ?auto_771422 ?auto_771428 ) ) ( not ( = ?auto_771422 ?auto_771429 ) ) ( not ( = ?auto_771422 ?auto_771430 ) ) ( not ( = ?auto_771422 ?auto_771431 ) ) ( not ( = ?auto_771422 ?auto_771432 ) ) ( not ( = ?auto_771422 ?auto_771433 ) ) ( not ( = ?auto_771422 ?auto_771434 ) ) ( not ( = ?auto_771422 ?auto_771435 ) ) ( not ( = ?auto_771423 ?auto_771424 ) ) ( not ( = ?auto_771423 ?auto_771425 ) ) ( not ( = ?auto_771423 ?auto_771426 ) ) ( not ( = ?auto_771423 ?auto_771427 ) ) ( not ( = ?auto_771423 ?auto_771428 ) ) ( not ( = ?auto_771423 ?auto_771429 ) ) ( not ( = ?auto_771423 ?auto_771430 ) ) ( not ( = ?auto_771423 ?auto_771431 ) ) ( not ( = ?auto_771423 ?auto_771432 ) ) ( not ( = ?auto_771423 ?auto_771433 ) ) ( not ( = ?auto_771423 ?auto_771434 ) ) ( not ( = ?auto_771423 ?auto_771435 ) ) ( not ( = ?auto_771424 ?auto_771425 ) ) ( not ( = ?auto_771424 ?auto_771426 ) ) ( not ( = ?auto_771424 ?auto_771427 ) ) ( not ( = ?auto_771424 ?auto_771428 ) ) ( not ( = ?auto_771424 ?auto_771429 ) ) ( not ( = ?auto_771424 ?auto_771430 ) ) ( not ( = ?auto_771424 ?auto_771431 ) ) ( not ( = ?auto_771424 ?auto_771432 ) ) ( not ( = ?auto_771424 ?auto_771433 ) ) ( not ( = ?auto_771424 ?auto_771434 ) ) ( not ( = ?auto_771424 ?auto_771435 ) ) ( not ( = ?auto_771425 ?auto_771426 ) ) ( not ( = ?auto_771425 ?auto_771427 ) ) ( not ( = ?auto_771425 ?auto_771428 ) ) ( not ( = ?auto_771425 ?auto_771429 ) ) ( not ( = ?auto_771425 ?auto_771430 ) ) ( not ( = ?auto_771425 ?auto_771431 ) ) ( not ( = ?auto_771425 ?auto_771432 ) ) ( not ( = ?auto_771425 ?auto_771433 ) ) ( not ( = ?auto_771425 ?auto_771434 ) ) ( not ( = ?auto_771425 ?auto_771435 ) ) ( not ( = ?auto_771426 ?auto_771427 ) ) ( not ( = ?auto_771426 ?auto_771428 ) ) ( not ( = ?auto_771426 ?auto_771429 ) ) ( not ( = ?auto_771426 ?auto_771430 ) ) ( not ( = ?auto_771426 ?auto_771431 ) ) ( not ( = ?auto_771426 ?auto_771432 ) ) ( not ( = ?auto_771426 ?auto_771433 ) ) ( not ( = ?auto_771426 ?auto_771434 ) ) ( not ( = ?auto_771426 ?auto_771435 ) ) ( not ( = ?auto_771427 ?auto_771428 ) ) ( not ( = ?auto_771427 ?auto_771429 ) ) ( not ( = ?auto_771427 ?auto_771430 ) ) ( not ( = ?auto_771427 ?auto_771431 ) ) ( not ( = ?auto_771427 ?auto_771432 ) ) ( not ( = ?auto_771427 ?auto_771433 ) ) ( not ( = ?auto_771427 ?auto_771434 ) ) ( not ( = ?auto_771427 ?auto_771435 ) ) ( not ( = ?auto_771428 ?auto_771429 ) ) ( not ( = ?auto_771428 ?auto_771430 ) ) ( not ( = ?auto_771428 ?auto_771431 ) ) ( not ( = ?auto_771428 ?auto_771432 ) ) ( not ( = ?auto_771428 ?auto_771433 ) ) ( not ( = ?auto_771428 ?auto_771434 ) ) ( not ( = ?auto_771428 ?auto_771435 ) ) ( not ( = ?auto_771429 ?auto_771430 ) ) ( not ( = ?auto_771429 ?auto_771431 ) ) ( not ( = ?auto_771429 ?auto_771432 ) ) ( not ( = ?auto_771429 ?auto_771433 ) ) ( not ( = ?auto_771429 ?auto_771434 ) ) ( not ( = ?auto_771429 ?auto_771435 ) ) ( not ( = ?auto_771430 ?auto_771431 ) ) ( not ( = ?auto_771430 ?auto_771432 ) ) ( not ( = ?auto_771430 ?auto_771433 ) ) ( not ( = ?auto_771430 ?auto_771434 ) ) ( not ( = ?auto_771430 ?auto_771435 ) ) ( not ( = ?auto_771431 ?auto_771432 ) ) ( not ( = ?auto_771431 ?auto_771433 ) ) ( not ( = ?auto_771431 ?auto_771434 ) ) ( not ( = ?auto_771431 ?auto_771435 ) ) ( not ( = ?auto_771432 ?auto_771433 ) ) ( not ( = ?auto_771432 ?auto_771434 ) ) ( not ( = ?auto_771432 ?auto_771435 ) ) ( not ( = ?auto_771433 ?auto_771434 ) ) ( not ( = ?auto_771433 ?auto_771435 ) ) ( not ( = ?auto_771434 ?auto_771435 ) ) ( ON ?auto_771433 ?auto_771434 ) ( CLEAR ?auto_771431 ) ( ON ?auto_771432 ?auto_771433 ) ( CLEAR ?auto_771432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_771419 ?auto_771420 ?auto_771421 ?auto_771422 ?auto_771423 ?auto_771424 ?auto_771425 ?auto_771426 ?auto_771427 ?auto_771428 ?auto_771429 ?auto_771430 ?auto_771431 ?auto_771432 )
      ( MAKE-16PILE ?auto_771419 ?auto_771420 ?auto_771421 ?auto_771422 ?auto_771423 ?auto_771424 ?auto_771425 ?auto_771426 ?auto_771427 ?auto_771428 ?auto_771429 ?auto_771430 ?auto_771431 ?auto_771432 ?auto_771433 ?auto_771434 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_771485 - BLOCK
      ?auto_771486 - BLOCK
      ?auto_771487 - BLOCK
      ?auto_771488 - BLOCK
      ?auto_771489 - BLOCK
      ?auto_771490 - BLOCK
      ?auto_771491 - BLOCK
      ?auto_771492 - BLOCK
      ?auto_771493 - BLOCK
      ?auto_771494 - BLOCK
      ?auto_771495 - BLOCK
      ?auto_771496 - BLOCK
      ?auto_771497 - BLOCK
      ?auto_771498 - BLOCK
      ?auto_771499 - BLOCK
      ?auto_771500 - BLOCK
    )
    :vars
    (
      ?auto_771501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771500 ?auto_771501 ) ( ON-TABLE ?auto_771485 ) ( ON ?auto_771486 ?auto_771485 ) ( ON ?auto_771487 ?auto_771486 ) ( ON ?auto_771488 ?auto_771487 ) ( ON ?auto_771489 ?auto_771488 ) ( ON ?auto_771490 ?auto_771489 ) ( ON ?auto_771491 ?auto_771490 ) ( ON ?auto_771492 ?auto_771491 ) ( ON ?auto_771493 ?auto_771492 ) ( ON ?auto_771494 ?auto_771493 ) ( ON ?auto_771495 ?auto_771494 ) ( ON ?auto_771496 ?auto_771495 ) ( not ( = ?auto_771485 ?auto_771486 ) ) ( not ( = ?auto_771485 ?auto_771487 ) ) ( not ( = ?auto_771485 ?auto_771488 ) ) ( not ( = ?auto_771485 ?auto_771489 ) ) ( not ( = ?auto_771485 ?auto_771490 ) ) ( not ( = ?auto_771485 ?auto_771491 ) ) ( not ( = ?auto_771485 ?auto_771492 ) ) ( not ( = ?auto_771485 ?auto_771493 ) ) ( not ( = ?auto_771485 ?auto_771494 ) ) ( not ( = ?auto_771485 ?auto_771495 ) ) ( not ( = ?auto_771485 ?auto_771496 ) ) ( not ( = ?auto_771485 ?auto_771497 ) ) ( not ( = ?auto_771485 ?auto_771498 ) ) ( not ( = ?auto_771485 ?auto_771499 ) ) ( not ( = ?auto_771485 ?auto_771500 ) ) ( not ( = ?auto_771485 ?auto_771501 ) ) ( not ( = ?auto_771486 ?auto_771487 ) ) ( not ( = ?auto_771486 ?auto_771488 ) ) ( not ( = ?auto_771486 ?auto_771489 ) ) ( not ( = ?auto_771486 ?auto_771490 ) ) ( not ( = ?auto_771486 ?auto_771491 ) ) ( not ( = ?auto_771486 ?auto_771492 ) ) ( not ( = ?auto_771486 ?auto_771493 ) ) ( not ( = ?auto_771486 ?auto_771494 ) ) ( not ( = ?auto_771486 ?auto_771495 ) ) ( not ( = ?auto_771486 ?auto_771496 ) ) ( not ( = ?auto_771486 ?auto_771497 ) ) ( not ( = ?auto_771486 ?auto_771498 ) ) ( not ( = ?auto_771486 ?auto_771499 ) ) ( not ( = ?auto_771486 ?auto_771500 ) ) ( not ( = ?auto_771486 ?auto_771501 ) ) ( not ( = ?auto_771487 ?auto_771488 ) ) ( not ( = ?auto_771487 ?auto_771489 ) ) ( not ( = ?auto_771487 ?auto_771490 ) ) ( not ( = ?auto_771487 ?auto_771491 ) ) ( not ( = ?auto_771487 ?auto_771492 ) ) ( not ( = ?auto_771487 ?auto_771493 ) ) ( not ( = ?auto_771487 ?auto_771494 ) ) ( not ( = ?auto_771487 ?auto_771495 ) ) ( not ( = ?auto_771487 ?auto_771496 ) ) ( not ( = ?auto_771487 ?auto_771497 ) ) ( not ( = ?auto_771487 ?auto_771498 ) ) ( not ( = ?auto_771487 ?auto_771499 ) ) ( not ( = ?auto_771487 ?auto_771500 ) ) ( not ( = ?auto_771487 ?auto_771501 ) ) ( not ( = ?auto_771488 ?auto_771489 ) ) ( not ( = ?auto_771488 ?auto_771490 ) ) ( not ( = ?auto_771488 ?auto_771491 ) ) ( not ( = ?auto_771488 ?auto_771492 ) ) ( not ( = ?auto_771488 ?auto_771493 ) ) ( not ( = ?auto_771488 ?auto_771494 ) ) ( not ( = ?auto_771488 ?auto_771495 ) ) ( not ( = ?auto_771488 ?auto_771496 ) ) ( not ( = ?auto_771488 ?auto_771497 ) ) ( not ( = ?auto_771488 ?auto_771498 ) ) ( not ( = ?auto_771488 ?auto_771499 ) ) ( not ( = ?auto_771488 ?auto_771500 ) ) ( not ( = ?auto_771488 ?auto_771501 ) ) ( not ( = ?auto_771489 ?auto_771490 ) ) ( not ( = ?auto_771489 ?auto_771491 ) ) ( not ( = ?auto_771489 ?auto_771492 ) ) ( not ( = ?auto_771489 ?auto_771493 ) ) ( not ( = ?auto_771489 ?auto_771494 ) ) ( not ( = ?auto_771489 ?auto_771495 ) ) ( not ( = ?auto_771489 ?auto_771496 ) ) ( not ( = ?auto_771489 ?auto_771497 ) ) ( not ( = ?auto_771489 ?auto_771498 ) ) ( not ( = ?auto_771489 ?auto_771499 ) ) ( not ( = ?auto_771489 ?auto_771500 ) ) ( not ( = ?auto_771489 ?auto_771501 ) ) ( not ( = ?auto_771490 ?auto_771491 ) ) ( not ( = ?auto_771490 ?auto_771492 ) ) ( not ( = ?auto_771490 ?auto_771493 ) ) ( not ( = ?auto_771490 ?auto_771494 ) ) ( not ( = ?auto_771490 ?auto_771495 ) ) ( not ( = ?auto_771490 ?auto_771496 ) ) ( not ( = ?auto_771490 ?auto_771497 ) ) ( not ( = ?auto_771490 ?auto_771498 ) ) ( not ( = ?auto_771490 ?auto_771499 ) ) ( not ( = ?auto_771490 ?auto_771500 ) ) ( not ( = ?auto_771490 ?auto_771501 ) ) ( not ( = ?auto_771491 ?auto_771492 ) ) ( not ( = ?auto_771491 ?auto_771493 ) ) ( not ( = ?auto_771491 ?auto_771494 ) ) ( not ( = ?auto_771491 ?auto_771495 ) ) ( not ( = ?auto_771491 ?auto_771496 ) ) ( not ( = ?auto_771491 ?auto_771497 ) ) ( not ( = ?auto_771491 ?auto_771498 ) ) ( not ( = ?auto_771491 ?auto_771499 ) ) ( not ( = ?auto_771491 ?auto_771500 ) ) ( not ( = ?auto_771491 ?auto_771501 ) ) ( not ( = ?auto_771492 ?auto_771493 ) ) ( not ( = ?auto_771492 ?auto_771494 ) ) ( not ( = ?auto_771492 ?auto_771495 ) ) ( not ( = ?auto_771492 ?auto_771496 ) ) ( not ( = ?auto_771492 ?auto_771497 ) ) ( not ( = ?auto_771492 ?auto_771498 ) ) ( not ( = ?auto_771492 ?auto_771499 ) ) ( not ( = ?auto_771492 ?auto_771500 ) ) ( not ( = ?auto_771492 ?auto_771501 ) ) ( not ( = ?auto_771493 ?auto_771494 ) ) ( not ( = ?auto_771493 ?auto_771495 ) ) ( not ( = ?auto_771493 ?auto_771496 ) ) ( not ( = ?auto_771493 ?auto_771497 ) ) ( not ( = ?auto_771493 ?auto_771498 ) ) ( not ( = ?auto_771493 ?auto_771499 ) ) ( not ( = ?auto_771493 ?auto_771500 ) ) ( not ( = ?auto_771493 ?auto_771501 ) ) ( not ( = ?auto_771494 ?auto_771495 ) ) ( not ( = ?auto_771494 ?auto_771496 ) ) ( not ( = ?auto_771494 ?auto_771497 ) ) ( not ( = ?auto_771494 ?auto_771498 ) ) ( not ( = ?auto_771494 ?auto_771499 ) ) ( not ( = ?auto_771494 ?auto_771500 ) ) ( not ( = ?auto_771494 ?auto_771501 ) ) ( not ( = ?auto_771495 ?auto_771496 ) ) ( not ( = ?auto_771495 ?auto_771497 ) ) ( not ( = ?auto_771495 ?auto_771498 ) ) ( not ( = ?auto_771495 ?auto_771499 ) ) ( not ( = ?auto_771495 ?auto_771500 ) ) ( not ( = ?auto_771495 ?auto_771501 ) ) ( not ( = ?auto_771496 ?auto_771497 ) ) ( not ( = ?auto_771496 ?auto_771498 ) ) ( not ( = ?auto_771496 ?auto_771499 ) ) ( not ( = ?auto_771496 ?auto_771500 ) ) ( not ( = ?auto_771496 ?auto_771501 ) ) ( not ( = ?auto_771497 ?auto_771498 ) ) ( not ( = ?auto_771497 ?auto_771499 ) ) ( not ( = ?auto_771497 ?auto_771500 ) ) ( not ( = ?auto_771497 ?auto_771501 ) ) ( not ( = ?auto_771498 ?auto_771499 ) ) ( not ( = ?auto_771498 ?auto_771500 ) ) ( not ( = ?auto_771498 ?auto_771501 ) ) ( not ( = ?auto_771499 ?auto_771500 ) ) ( not ( = ?auto_771499 ?auto_771501 ) ) ( not ( = ?auto_771500 ?auto_771501 ) ) ( ON ?auto_771499 ?auto_771500 ) ( ON ?auto_771498 ?auto_771499 ) ( CLEAR ?auto_771496 ) ( ON ?auto_771497 ?auto_771498 ) ( CLEAR ?auto_771497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_771485 ?auto_771486 ?auto_771487 ?auto_771488 ?auto_771489 ?auto_771490 ?auto_771491 ?auto_771492 ?auto_771493 ?auto_771494 ?auto_771495 ?auto_771496 ?auto_771497 )
      ( MAKE-16PILE ?auto_771485 ?auto_771486 ?auto_771487 ?auto_771488 ?auto_771489 ?auto_771490 ?auto_771491 ?auto_771492 ?auto_771493 ?auto_771494 ?auto_771495 ?auto_771496 ?auto_771497 ?auto_771498 ?auto_771499 ?auto_771500 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_771551 - BLOCK
      ?auto_771552 - BLOCK
      ?auto_771553 - BLOCK
      ?auto_771554 - BLOCK
      ?auto_771555 - BLOCK
      ?auto_771556 - BLOCK
      ?auto_771557 - BLOCK
      ?auto_771558 - BLOCK
      ?auto_771559 - BLOCK
      ?auto_771560 - BLOCK
      ?auto_771561 - BLOCK
      ?auto_771562 - BLOCK
      ?auto_771563 - BLOCK
      ?auto_771564 - BLOCK
      ?auto_771565 - BLOCK
      ?auto_771566 - BLOCK
    )
    :vars
    (
      ?auto_771567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771566 ?auto_771567 ) ( ON-TABLE ?auto_771551 ) ( ON ?auto_771552 ?auto_771551 ) ( ON ?auto_771553 ?auto_771552 ) ( ON ?auto_771554 ?auto_771553 ) ( ON ?auto_771555 ?auto_771554 ) ( ON ?auto_771556 ?auto_771555 ) ( ON ?auto_771557 ?auto_771556 ) ( ON ?auto_771558 ?auto_771557 ) ( ON ?auto_771559 ?auto_771558 ) ( ON ?auto_771560 ?auto_771559 ) ( ON ?auto_771561 ?auto_771560 ) ( not ( = ?auto_771551 ?auto_771552 ) ) ( not ( = ?auto_771551 ?auto_771553 ) ) ( not ( = ?auto_771551 ?auto_771554 ) ) ( not ( = ?auto_771551 ?auto_771555 ) ) ( not ( = ?auto_771551 ?auto_771556 ) ) ( not ( = ?auto_771551 ?auto_771557 ) ) ( not ( = ?auto_771551 ?auto_771558 ) ) ( not ( = ?auto_771551 ?auto_771559 ) ) ( not ( = ?auto_771551 ?auto_771560 ) ) ( not ( = ?auto_771551 ?auto_771561 ) ) ( not ( = ?auto_771551 ?auto_771562 ) ) ( not ( = ?auto_771551 ?auto_771563 ) ) ( not ( = ?auto_771551 ?auto_771564 ) ) ( not ( = ?auto_771551 ?auto_771565 ) ) ( not ( = ?auto_771551 ?auto_771566 ) ) ( not ( = ?auto_771551 ?auto_771567 ) ) ( not ( = ?auto_771552 ?auto_771553 ) ) ( not ( = ?auto_771552 ?auto_771554 ) ) ( not ( = ?auto_771552 ?auto_771555 ) ) ( not ( = ?auto_771552 ?auto_771556 ) ) ( not ( = ?auto_771552 ?auto_771557 ) ) ( not ( = ?auto_771552 ?auto_771558 ) ) ( not ( = ?auto_771552 ?auto_771559 ) ) ( not ( = ?auto_771552 ?auto_771560 ) ) ( not ( = ?auto_771552 ?auto_771561 ) ) ( not ( = ?auto_771552 ?auto_771562 ) ) ( not ( = ?auto_771552 ?auto_771563 ) ) ( not ( = ?auto_771552 ?auto_771564 ) ) ( not ( = ?auto_771552 ?auto_771565 ) ) ( not ( = ?auto_771552 ?auto_771566 ) ) ( not ( = ?auto_771552 ?auto_771567 ) ) ( not ( = ?auto_771553 ?auto_771554 ) ) ( not ( = ?auto_771553 ?auto_771555 ) ) ( not ( = ?auto_771553 ?auto_771556 ) ) ( not ( = ?auto_771553 ?auto_771557 ) ) ( not ( = ?auto_771553 ?auto_771558 ) ) ( not ( = ?auto_771553 ?auto_771559 ) ) ( not ( = ?auto_771553 ?auto_771560 ) ) ( not ( = ?auto_771553 ?auto_771561 ) ) ( not ( = ?auto_771553 ?auto_771562 ) ) ( not ( = ?auto_771553 ?auto_771563 ) ) ( not ( = ?auto_771553 ?auto_771564 ) ) ( not ( = ?auto_771553 ?auto_771565 ) ) ( not ( = ?auto_771553 ?auto_771566 ) ) ( not ( = ?auto_771553 ?auto_771567 ) ) ( not ( = ?auto_771554 ?auto_771555 ) ) ( not ( = ?auto_771554 ?auto_771556 ) ) ( not ( = ?auto_771554 ?auto_771557 ) ) ( not ( = ?auto_771554 ?auto_771558 ) ) ( not ( = ?auto_771554 ?auto_771559 ) ) ( not ( = ?auto_771554 ?auto_771560 ) ) ( not ( = ?auto_771554 ?auto_771561 ) ) ( not ( = ?auto_771554 ?auto_771562 ) ) ( not ( = ?auto_771554 ?auto_771563 ) ) ( not ( = ?auto_771554 ?auto_771564 ) ) ( not ( = ?auto_771554 ?auto_771565 ) ) ( not ( = ?auto_771554 ?auto_771566 ) ) ( not ( = ?auto_771554 ?auto_771567 ) ) ( not ( = ?auto_771555 ?auto_771556 ) ) ( not ( = ?auto_771555 ?auto_771557 ) ) ( not ( = ?auto_771555 ?auto_771558 ) ) ( not ( = ?auto_771555 ?auto_771559 ) ) ( not ( = ?auto_771555 ?auto_771560 ) ) ( not ( = ?auto_771555 ?auto_771561 ) ) ( not ( = ?auto_771555 ?auto_771562 ) ) ( not ( = ?auto_771555 ?auto_771563 ) ) ( not ( = ?auto_771555 ?auto_771564 ) ) ( not ( = ?auto_771555 ?auto_771565 ) ) ( not ( = ?auto_771555 ?auto_771566 ) ) ( not ( = ?auto_771555 ?auto_771567 ) ) ( not ( = ?auto_771556 ?auto_771557 ) ) ( not ( = ?auto_771556 ?auto_771558 ) ) ( not ( = ?auto_771556 ?auto_771559 ) ) ( not ( = ?auto_771556 ?auto_771560 ) ) ( not ( = ?auto_771556 ?auto_771561 ) ) ( not ( = ?auto_771556 ?auto_771562 ) ) ( not ( = ?auto_771556 ?auto_771563 ) ) ( not ( = ?auto_771556 ?auto_771564 ) ) ( not ( = ?auto_771556 ?auto_771565 ) ) ( not ( = ?auto_771556 ?auto_771566 ) ) ( not ( = ?auto_771556 ?auto_771567 ) ) ( not ( = ?auto_771557 ?auto_771558 ) ) ( not ( = ?auto_771557 ?auto_771559 ) ) ( not ( = ?auto_771557 ?auto_771560 ) ) ( not ( = ?auto_771557 ?auto_771561 ) ) ( not ( = ?auto_771557 ?auto_771562 ) ) ( not ( = ?auto_771557 ?auto_771563 ) ) ( not ( = ?auto_771557 ?auto_771564 ) ) ( not ( = ?auto_771557 ?auto_771565 ) ) ( not ( = ?auto_771557 ?auto_771566 ) ) ( not ( = ?auto_771557 ?auto_771567 ) ) ( not ( = ?auto_771558 ?auto_771559 ) ) ( not ( = ?auto_771558 ?auto_771560 ) ) ( not ( = ?auto_771558 ?auto_771561 ) ) ( not ( = ?auto_771558 ?auto_771562 ) ) ( not ( = ?auto_771558 ?auto_771563 ) ) ( not ( = ?auto_771558 ?auto_771564 ) ) ( not ( = ?auto_771558 ?auto_771565 ) ) ( not ( = ?auto_771558 ?auto_771566 ) ) ( not ( = ?auto_771558 ?auto_771567 ) ) ( not ( = ?auto_771559 ?auto_771560 ) ) ( not ( = ?auto_771559 ?auto_771561 ) ) ( not ( = ?auto_771559 ?auto_771562 ) ) ( not ( = ?auto_771559 ?auto_771563 ) ) ( not ( = ?auto_771559 ?auto_771564 ) ) ( not ( = ?auto_771559 ?auto_771565 ) ) ( not ( = ?auto_771559 ?auto_771566 ) ) ( not ( = ?auto_771559 ?auto_771567 ) ) ( not ( = ?auto_771560 ?auto_771561 ) ) ( not ( = ?auto_771560 ?auto_771562 ) ) ( not ( = ?auto_771560 ?auto_771563 ) ) ( not ( = ?auto_771560 ?auto_771564 ) ) ( not ( = ?auto_771560 ?auto_771565 ) ) ( not ( = ?auto_771560 ?auto_771566 ) ) ( not ( = ?auto_771560 ?auto_771567 ) ) ( not ( = ?auto_771561 ?auto_771562 ) ) ( not ( = ?auto_771561 ?auto_771563 ) ) ( not ( = ?auto_771561 ?auto_771564 ) ) ( not ( = ?auto_771561 ?auto_771565 ) ) ( not ( = ?auto_771561 ?auto_771566 ) ) ( not ( = ?auto_771561 ?auto_771567 ) ) ( not ( = ?auto_771562 ?auto_771563 ) ) ( not ( = ?auto_771562 ?auto_771564 ) ) ( not ( = ?auto_771562 ?auto_771565 ) ) ( not ( = ?auto_771562 ?auto_771566 ) ) ( not ( = ?auto_771562 ?auto_771567 ) ) ( not ( = ?auto_771563 ?auto_771564 ) ) ( not ( = ?auto_771563 ?auto_771565 ) ) ( not ( = ?auto_771563 ?auto_771566 ) ) ( not ( = ?auto_771563 ?auto_771567 ) ) ( not ( = ?auto_771564 ?auto_771565 ) ) ( not ( = ?auto_771564 ?auto_771566 ) ) ( not ( = ?auto_771564 ?auto_771567 ) ) ( not ( = ?auto_771565 ?auto_771566 ) ) ( not ( = ?auto_771565 ?auto_771567 ) ) ( not ( = ?auto_771566 ?auto_771567 ) ) ( ON ?auto_771565 ?auto_771566 ) ( ON ?auto_771564 ?auto_771565 ) ( ON ?auto_771563 ?auto_771564 ) ( CLEAR ?auto_771561 ) ( ON ?auto_771562 ?auto_771563 ) ( CLEAR ?auto_771562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_771551 ?auto_771552 ?auto_771553 ?auto_771554 ?auto_771555 ?auto_771556 ?auto_771557 ?auto_771558 ?auto_771559 ?auto_771560 ?auto_771561 ?auto_771562 )
      ( MAKE-16PILE ?auto_771551 ?auto_771552 ?auto_771553 ?auto_771554 ?auto_771555 ?auto_771556 ?auto_771557 ?auto_771558 ?auto_771559 ?auto_771560 ?auto_771561 ?auto_771562 ?auto_771563 ?auto_771564 ?auto_771565 ?auto_771566 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_771617 - BLOCK
      ?auto_771618 - BLOCK
      ?auto_771619 - BLOCK
      ?auto_771620 - BLOCK
      ?auto_771621 - BLOCK
      ?auto_771622 - BLOCK
      ?auto_771623 - BLOCK
      ?auto_771624 - BLOCK
      ?auto_771625 - BLOCK
      ?auto_771626 - BLOCK
      ?auto_771627 - BLOCK
      ?auto_771628 - BLOCK
      ?auto_771629 - BLOCK
      ?auto_771630 - BLOCK
      ?auto_771631 - BLOCK
      ?auto_771632 - BLOCK
    )
    :vars
    (
      ?auto_771633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771632 ?auto_771633 ) ( ON-TABLE ?auto_771617 ) ( ON ?auto_771618 ?auto_771617 ) ( ON ?auto_771619 ?auto_771618 ) ( ON ?auto_771620 ?auto_771619 ) ( ON ?auto_771621 ?auto_771620 ) ( ON ?auto_771622 ?auto_771621 ) ( ON ?auto_771623 ?auto_771622 ) ( ON ?auto_771624 ?auto_771623 ) ( ON ?auto_771625 ?auto_771624 ) ( ON ?auto_771626 ?auto_771625 ) ( not ( = ?auto_771617 ?auto_771618 ) ) ( not ( = ?auto_771617 ?auto_771619 ) ) ( not ( = ?auto_771617 ?auto_771620 ) ) ( not ( = ?auto_771617 ?auto_771621 ) ) ( not ( = ?auto_771617 ?auto_771622 ) ) ( not ( = ?auto_771617 ?auto_771623 ) ) ( not ( = ?auto_771617 ?auto_771624 ) ) ( not ( = ?auto_771617 ?auto_771625 ) ) ( not ( = ?auto_771617 ?auto_771626 ) ) ( not ( = ?auto_771617 ?auto_771627 ) ) ( not ( = ?auto_771617 ?auto_771628 ) ) ( not ( = ?auto_771617 ?auto_771629 ) ) ( not ( = ?auto_771617 ?auto_771630 ) ) ( not ( = ?auto_771617 ?auto_771631 ) ) ( not ( = ?auto_771617 ?auto_771632 ) ) ( not ( = ?auto_771617 ?auto_771633 ) ) ( not ( = ?auto_771618 ?auto_771619 ) ) ( not ( = ?auto_771618 ?auto_771620 ) ) ( not ( = ?auto_771618 ?auto_771621 ) ) ( not ( = ?auto_771618 ?auto_771622 ) ) ( not ( = ?auto_771618 ?auto_771623 ) ) ( not ( = ?auto_771618 ?auto_771624 ) ) ( not ( = ?auto_771618 ?auto_771625 ) ) ( not ( = ?auto_771618 ?auto_771626 ) ) ( not ( = ?auto_771618 ?auto_771627 ) ) ( not ( = ?auto_771618 ?auto_771628 ) ) ( not ( = ?auto_771618 ?auto_771629 ) ) ( not ( = ?auto_771618 ?auto_771630 ) ) ( not ( = ?auto_771618 ?auto_771631 ) ) ( not ( = ?auto_771618 ?auto_771632 ) ) ( not ( = ?auto_771618 ?auto_771633 ) ) ( not ( = ?auto_771619 ?auto_771620 ) ) ( not ( = ?auto_771619 ?auto_771621 ) ) ( not ( = ?auto_771619 ?auto_771622 ) ) ( not ( = ?auto_771619 ?auto_771623 ) ) ( not ( = ?auto_771619 ?auto_771624 ) ) ( not ( = ?auto_771619 ?auto_771625 ) ) ( not ( = ?auto_771619 ?auto_771626 ) ) ( not ( = ?auto_771619 ?auto_771627 ) ) ( not ( = ?auto_771619 ?auto_771628 ) ) ( not ( = ?auto_771619 ?auto_771629 ) ) ( not ( = ?auto_771619 ?auto_771630 ) ) ( not ( = ?auto_771619 ?auto_771631 ) ) ( not ( = ?auto_771619 ?auto_771632 ) ) ( not ( = ?auto_771619 ?auto_771633 ) ) ( not ( = ?auto_771620 ?auto_771621 ) ) ( not ( = ?auto_771620 ?auto_771622 ) ) ( not ( = ?auto_771620 ?auto_771623 ) ) ( not ( = ?auto_771620 ?auto_771624 ) ) ( not ( = ?auto_771620 ?auto_771625 ) ) ( not ( = ?auto_771620 ?auto_771626 ) ) ( not ( = ?auto_771620 ?auto_771627 ) ) ( not ( = ?auto_771620 ?auto_771628 ) ) ( not ( = ?auto_771620 ?auto_771629 ) ) ( not ( = ?auto_771620 ?auto_771630 ) ) ( not ( = ?auto_771620 ?auto_771631 ) ) ( not ( = ?auto_771620 ?auto_771632 ) ) ( not ( = ?auto_771620 ?auto_771633 ) ) ( not ( = ?auto_771621 ?auto_771622 ) ) ( not ( = ?auto_771621 ?auto_771623 ) ) ( not ( = ?auto_771621 ?auto_771624 ) ) ( not ( = ?auto_771621 ?auto_771625 ) ) ( not ( = ?auto_771621 ?auto_771626 ) ) ( not ( = ?auto_771621 ?auto_771627 ) ) ( not ( = ?auto_771621 ?auto_771628 ) ) ( not ( = ?auto_771621 ?auto_771629 ) ) ( not ( = ?auto_771621 ?auto_771630 ) ) ( not ( = ?auto_771621 ?auto_771631 ) ) ( not ( = ?auto_771621 ?auto_771632 ) ) ( not ( = ?auto_771621 ?auto_771633 ) ) ( not ( = ?auto_771622 ?auto_771623 ) ) ( not ( = ?auto_771622 ?auto_771624 ) ) ( not ( = ?auto_771622 ?auto_771625 ) ) ( not ( = ?auto_771622 ?auto_771626 ) ) ( not ( = ?auto_771622 ?auto_771627 ) ) ( not ( = ?auto_771622 ?auto_771628 ) ) ( not ( = ?auto_771622 ?auto_771629 ) ) ( not ( = ?auto_771622 ?auto_771630 ) ) ( not ( = ?auto_771622 ?auto_771631 ) ) ( not ( = ?auto_771622 ?auto_771632 ) ) ( not ( = ?auto_771622 ?auto_771633 ) ) ( not ( = ?auto_771623 ?auto_771624 ) ) ( not ( = ?auto_771623 ?auto_771625 ) ) ( not ( = ?auto_771623 ?auto_771626 ) ) ( not ( = ?auto_771623 ?auto_771627 ) ) ( not ( = ?auto_771623 ?auto_771628 ) ) ( not ( = ?auto_771623 ?auto_771629 ) ) ( not ( = ?auto_771623 ?auto_771630 ) ) ( not ( = ?auto_771623 ?auto_771631 ) ) ( not ( = ?auto_771623 ?auto_771632 ) ) ( not ( = ?auto_771623 ?auto_771633 ) ) ( not ( = ?auto_771624 ?auto_771625 ) ) ( not ( = ?auto_771624 ?auto_771626 ) ) ( not ( = ?auto_771624 ?auto_771627 ) ) ( not ( = ?auto_771624 ?auto_771628 ) ) ( not ( = ?auto_771624 ?auto_771629 ) ) ( not ( = ?auto_771624 ?auto_771630 ) ) ( not ( = ?auto_771624 ?auto_771631 ) ) ( not ( = ?auto_771624 ?auto_771632 ) ) ( not ( = ?auto_771624 ?auto_771633 ) ) ( not ( = ?auto_771625 ?auto_771626 ) ) ( not ( = ?auto_771625 ?auto_771627 ) ) ( not ( = ?auto_771625 ?auto_771628 ) ) ( not ( = ?auto_771625 ?auto_771629 ) ) ( not ( = ?auto_771625 ?auto_771630 ) ) ( not ( = ?auto_771625 ?auto_771631 ) ) ( not ( = ?auto_771625 ?auto_771632 ) ) ( not ( = ?auto_771625 ?auto_771633 ) ) ( not ( = ?auto_771626 ?auto_771627 ) ) ( not ( = ?auto_771626 ?auto_771628 ) ) ( not ( = ?auto_771626 ?auto_771629 ) ) ( not ( = ?auto_771626 ?auto_771630 ) ) ( not ( = ?auto_771626 ?auto_771631 ) ) ( not ( = ?auto_771626 ?auto_771632 ) ) ( not ( = ?auto_771626 ?auto_771633 ) ) ( not ( = ?auto_771627 ?auto_771628 ) ) ( not ( = ?auto_771627 ?auto_771629 ) ) ( not ( = ?auto_771627 ?auto_771630 ) ) ( not ( = ?auto_771627 ?auto_771631 ) ) ( not ( = ?auto_771627 ?auto_771632 ) ) ( not ( = ?auto_771627 ?auto_771633 ) ) ( not ( = ?auto_771628 ?auto_771629 ) ) ( not ( = ?auto_771628 ?auto_771630 ) ) ( not ( = ?auto_771628 ?auto_771631 ) ) ( not ( = ?auto_771628 ?auto_771632 ) ) ( not ( = ?auto_771628 ?auto_771633 ) ) ( not ( = ?auto_771629 ?auto_771630 ) ) ( not ( = ?auto_771629 ?auto_771631 ) ) ( not ( = ?auto_771629 ?auto_771632 ) ) ( not ( = ?auto_771629 ?auto_771633 ) ) ( not ( = ?auto_771630 ?auto_771631 ) ) ( not ( = ?auto_771630 ?auto_771632 ) ) ( not ( = ?auto_771630 ?auto_771633 ) ) ( not ( = ?auto_771631 ?auto_771632 ) ) ( not ( = ?auto_771631 ?auto_771633 ) ) ( not ( = ?auto_771632 ?auto_771633 ) ) ( ON ?auto_771631 ?auto_771632 ) ( ON ?auto_771630 ?auto_771631 ) ( ON ?auto_771629 ?auto_771630 ) ( ON ?auto_771628 ?auto_771629 ) ( CLEAR ?auto_771626 ) ( ON ?auto_771627 ?auto_771628 ) ( CLEAR ?auto_771627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_771617 ?auto_771618 ?auto_771619 ?auto_771620 ?auto_771621 ?auto_771622 ?auto_771623 ?auto_771624 ?auto_771625 ?auto_771626 ?auto_771627 )
      ( MAKE-16PILE ?auto_771617 ?auto_771618 ?auto_771619 ?auto_771620 ?auto_771621 ?auto_771622 ?auto_771623 ?auto_771624 ?auto_771625 ?auto_771626 ?auto_771627 ?auto_771628 ?auto_771629 ?auto_771630 ?auto_771631 ?auto_771632 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_771683 - BLOCK
      ?auto_771684 - BLOCK
      ?auto_771685 - BLOCK
      ?auto_771686 - BLOCK
      ?auto_771687 - BLOCK
      ?auto_771688 - BLOCK
      ?auto_771689 - BLOCK
      ?auto_771690 - BLOCK
      ?auto_771691 - BLOCK
      ?auto_771692 - BLOCK
      ?auto_771693 - BLOCK
      ?auto_771694 - BLOCK
      ?auto_771695 - BLOCK
      ?auto_771696 - BLOCK
      ?auto_771697 - BLOCK
      ?auto_771698 - BLOCK
    )
    :vars
    (
      ?auto_771699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771698 ?auto_771699 ) ( ON-TABLE ?auto_771683 ) ( ON ?auto_771684 ?auto_771683 ) ( ON ?auto_771685 ?auto_771684 ) ( ON ?auto_771686 ?auto_771685 ) ( ON ?auto_771687 ?auto_771686 ) ( ON ?auto_771688 ?auto_771687 ) ( ON ?auto_771689 ?auto_771688 ) ( ON ?auto_771690 ?auto_771689 ) ( ON ?auto_771691 ?auto_771690 ) ( not ( = ?auto_771683 ?auto_771684 ) ) ( not ( = ?auto_771683 ?auto_771685 ) ) ( not ( = ?auto_771683 ?auto_771686 ) ) ( not ( = ?auto_771683 ?auto_771687 ) ) ( not ( = ?auto_771683 ?auto_771688 ) ) ( not ( = ?auto_771683 ?auto_771689 ) ) ( not ( = ?auto_771683 ?auto_771690 ) ) ( not ( = ?auto_771683 ?auto_771691 ) ) ( not ( = ?auto_771683 ?auto_771692 ) ) ( not ( = ?auto_771683 ?auto_771693 ) ) ( not ( = ?auto_771683 ?auto_771694 ) ) ( not ( = ?auto_771683 ?auto_771695 ) ) ( not ( = ?auto_771683 ?auto_771696 ) ) ( not ( = ?auto_771683 ?auto_771697 ) ) ( not ( = ?auto_771683 ?auto_771698 ) ) ( not ( = ?auto_771683 ?auto_771699 ) ) ( not ( = ?auto_771684 ?auto_771685 ) ) ( not ( = ?auto_771684 ?auto_771686 ) ) ( not ( = ?auto_771684 ?auto_771687 ) ) ( not ( = ?auto_771684 ?auto_771688 ) ) ( not ( = ?auto_771684 ?auto_771689 ) ) ( not ( = ?auto_771684 ?auto_771690 ) ) ( not ( = ?auto_771684 ?auto_771691 ) ) ( not ( = ?auto_771684 ?auto_771692 ) ) ( not ( = ?auto_771684 ?auto_771693 ) ) ( not ( = ?auto_771684 ?auto_771694 ) ) ( not ( = ?auto_771684 ?auto_771695 ) ) ( not ( = ?auto_771684 ?auto_771696 ) ) ( not ( = ?auto_771684 ?auto_771697 ) ) ( not ( = ?auto_771684 ?auto_771698 ) ) ( not ( = ?auto_771684 ?auto_771699 ) ) ( not ( = ?auto_771685 ?auto_771686 ) ) ( not ( = ?auto_771685 ?auto_771687 ) ) ( not ( = ?auto_771685 ?auto_771688 ) ) ( not ( = ?auto_771685 ?auto_771689 ) ) ( not ( = ?auto_771685 ?auto_771690 ) ) ( not ( = ?auto_771685 ?auto_771691 ) ) ( not ( = ?auto_771685 ?auto_771692 ) ) ( not ( = ?auto_771685 ?auto_771693 ) ) ( not ( = ?auto_771685 ?auto_771694 ) ) ( not ( = ?auto_771685 ?auto_771695 ) ) ( not ( = ?auto_771685 ?auto_771696 ) ) ( not ( = ?auto_771685 ?auto_771697 ) ) ( not ( = ?auto_771685 ?auto_771698 ) ) ( not ( = ?auto_771685 ?auto_771699 ) ) ( not ( = ?auto_771686 ?auto_771687 ) ) ( not ( = ?auto_771686 ?auto_771688 ) ) ( not ( = ?auto_771686 ?auto_771689 ) ) ( not ( = ?auto_771686 ?auto_771690 ) ) ( not ( = ?auto_771686 ?auto_771691 ) ) ( not ( = ?auto_771686 ?auto_771692 ) ) ( not ( = ?auto_771686 ?auto_771693 ) ) ( not ( = ?auto_771686 ?auto_771694 ) ) ( not ( = ?auto_771686 ?auto_771695 ) ) ( not ( = ?auto_771686 ?auto_771696 ) ) ( not ( = ?auto_771686 ?auto_771697 ) ) ( not ( = ?auto_771686 ?auto_771698 ) ) ( not ( = ?auto_771686 ?auto_771699 ) ) ( not ( = ?auto_771687 ?auto_771688 ) ) ( not ( = ?auto_771687 ?auto_771689 ) ) ( not ( = ?auto_771687 ?auto_771690 ) ) ( not ( = ?auto_771687 ?auto_771691 ) ) ( not ( = ?auto_771687 ?auto_771692 ) ) ( not ( = ?auto_771687 ?auto_771693 ) ) ( not ( = ?auto_771687 ?auto_771694 ) ) ( not ( = ?auto_771687 ?auto_771695 ) ) ( not ( = ?auto_771687 ?auto_771696 ) ) ( not ( = ?auto_771687 ?auto_771697 ) ) ( not ( = ?auto_771687 ?auto_771698 ) ) ( not ( = ?auto_771687 ?auto_771699 ) ) ( not ( = ?auto_771688 ?auto_771689 ) ) ( not ( = ?auto_771688 ?auto_771690 ) ) ( not ( = ?auto_771688 ?auto_771691 ) ) ( not ( = ?auto_771688 ?auto_771692 ) ) ( not ( = ?auto_771688 ?auto_771693 ) ) ( not ( = ?auto_771688 ?auto_771694 ) ) ( not ( = ?auto_771688 ?auto_771695 ) ) ( not ( = ?auto_771688 ?auto_771696 ) ) ( not ( = ?auto_771688 ?auto_771697 ) ) ( not ( = ?auto_771688 ?auto_771698 ) ) ( not ( = ?auto_771688 ?auto_771699 ) ) ( not ( = ?auto_771689 ?auto_771690 ) ) ( not ( = ?auto_771689 ?auto_771691 ) ) ( not ( = ?auto_771689 ?auto_771692 ) ) ( not ( = ?auto_771689 ?auto_771693 ) ) ( not ( = ?auto_771689 ?auto_771694 ) ) ( not ( = ?auto_771689 ?auto_771695 ) ) ( not ( = ?auto_771689 ?auto_771696 ) ) ( not ( = ?auto_771689 ?auto_771697 ) ) ( not ( = ?auto_771689 ?auto_771698 ) ) ( not ( = ?auto_771689 ?auto_771699 ) ) ( not ( = ?auto_771690 ?auto_771691 ) ) ( not ( = ?auto_771690 ?auto_771692 ) ) ( not ( = ?auto_771690 ?auto_771693 ) ) ( not ( = ?auto_771690 ?auto_771694 ) ) ( not ( = ?auto_771690 ?auto_771695 ) ) ( not ( = ?auto_771690 ?auto_771696 ) ) ( not ( = ?auto_771690 ?auto_771697 ) ) ( not ( = ?auto_771690 ?auto_771698 ) ) ( not ( = ?auto_771690 ?auto_771699 ) ) ( not ( = ?auto_771691 ?auto_771692 ) ) ( not ( = ?auto_771691 ?auto_771693 ) ) ( not ( = ?auto_771691 ?auto_771694 ) ) ( not ( = ?auto_771691 ?auto_771695 ) ) ( not ( = ?auto_771691 ?auto_771696 ) ) ( not ( = ?auto_771691 ?auto_771697 ) ) ( not ( = ?auto_771691 ?auto_771698 ) ) ( not ( = ?auto_771691 ?auto_771699 ) ) ( not ( = ?auto_771692 ?auto_771693 ) ) ( not ( = ?auto_771692 ?auto_771694 ) ) ( not ( = ?auto_771692 ?auto_771695 ) ) ( not ( = ?auto_771692 ?auto_771696 ) ) ( not ( = ?auto_771692 ?auto_771697 ) ) ( not ( = ?auto_771692 ?auto_771698 ) ) ( not ( = ?auto_771692 ?auto_771699 ) ) ( not ( = ?auto_771693 ?auto_771694 ) ) ( not ( = ?auto_771693 ?auto_771695 ) ) ( not ( = ?auto_771693 ?auto_771696 ) ) ( not ( = ?auto_771693 ?auto_771697 ) ) ( not ( = ?auto_771693 ?auto_771698 ) ) ( not ( = ?auto_771693 ?auto_771699 ) ) ( not ( = ?auto_771694 ?auto_771695 ) ) ( not ( = ?auto_771694 ?auto_771696 ) ) ( not ( = ?auto_771694 ?auto_771697 ) ) ( not ( = ?auto_771694 ?auto_771698 ) ) ( not ( = ?auto_771694 ?auto_771699 ) ) ( not ( = ?auto_771695 ?auto_771696 ) ) ( not ( = ?auto_771695 ?auto_771697 ) ) ( not ( = ?auto_771695 ?auto_771698 ) ) ( not ( = ?auto_771695 ?auto_771699 ) ) ( not ( = ?auto_771696 ?auto_771697 ) ) ( not ( = ?auto_771696 ?auto_771698 ) ) ( not ( = ?auto_771696 ?auto_771699 ) ) ( not ( = ?auto_771697 ?auto_771698 ) ) ( not ( = ?auto_771697 ?auto_771699 ) ) ( not ( = ?auto_771698 ?auto_771699 ) ) ( ON ?auto_771697 ?auto_771698 ) ( ON ?auto_771696 ?auto_771697 ) ( ON ?auto_771695 ?auto_771696 ) ( ON ?auto_771694 ?auto_771695 ) ( ON ?auto_771693 ?auto_771694 ) ( CLEAR ?auto_771691 ) ( ON ?auto_771692 ?auto_771693 ) ( CLEAR ?auto_771692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_771683 ?auto_771684 ?auto_771685 ?auto_771686 ?auto_771687 ?auto_771688 ?auto_771689 ?auto_771690 ?auto_771691 ?auto_771692 )
      ( MAKE-16PILE ?auto_771683 ?auto_771684 ?auto_771685 ?auto_771686 ?auto_771687 ?auto_771688 ?auto_771689 ?auto_771690 ?auto_771691 ?auto_771692 ?auto_771693 ?auto_771694 ?auto_771695 ?auto_771696 ?auto_771697 ?auto_771698 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_771749 - BLOCK
      ?auto_771750 - BLOCK
      ?auto_771751 - BLOCK
      ?auto_771752 - BLOCK
      ?auto_771753 - BLOCK
      ?auto_771754 - BLOCK
      ?auto_771755 - BLOCK
      ?auto_771756 - BLOCK
      ?auto_771757 - BLOCK
      ?auto_771758 - BLOCK
      ?auto_771759 - BLOCK
      ?auto_771760 - BLOCK
      ?auto_771761 - BLOCK
      ?auto_771762 - BLOCK
      ?auto_771763 - BLOCK
      ?auto_771764 - BLOCK
    )
    :vars
    (
      ?auto_771765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771764 ?auto_771765 ) ( ON-TABLE ?auto_771749 ) ( ON ?auto_771750 ?auto_771749 ) ( ON ?auto_771751 ?auto_771750 ) ( ON ?auto_771752 ?auto_771751 ) ( ON ?auto_771753 ?auto_771752 ) ( ON ?auto_771754 ?auto_771753 ) ( ON ?auto_771755 ?auto_771754 ) ( ON ?auto_771756 ?auto_771755 ) ( not ( = ?auto_771749 ?auto_771750 ) ) ( not ( = ?auto_771749 ?auto_771751 ) ) ( not ( = ?auto_771749 ?auto_771752 ) ) ( not ( = ?auto_771749 ?auto_771753 ) ) ( not ( = ?auto_771749 ?auto_771754 ) ) ( not ( = ?auto_771749 ?auto_771755 ) ) ( not ( = ?auto_771749 ?auto_771756 ) ) ( not ( = ?auto_771749 ?auto_771757 ) ) ( not ( = ?auto_771749 ?auto_771758 ) ) ( not ( = ?auto_771749 ?auto_771759 ) ) ( not ( = ?auto_771749 ?auto_771760 ) ) ( not ( = ?auto_771749 ?auto_771761 ) ) ( not ( = ?auto_771749 ?auto_771762 ) ) ( not ( = ?auto_771749 ?auto_771763 ) ) ( not ( = ?auto_771749 ?auto_771764 ) ) ( not ( = ?auto_771749 ?auto_771765 ) ) ( not ( = ?auto_771750 ?auto_771751 ) ) ( not ( = ?auto_771750 ?auto_771752 ) ) ( not ( = ?auto_771750 ?auto_771753 ) ) ( not ( = ?auto_771750 ?auto_771754 ) ) ( not ( = ?auto_771750 ?auto_771755 ) ) ( not ( = ?auto_771750 ?auto_771756 ) ) ( not ( = ?auto_771750 ?auto_771757 ) ) ( not ( = ?auto_771750 ?auto_771758 ) ) ( not ( = ?auto_771750 ?auto_771759 ) ) ( not ( = ?auto_771750 ?auto_771760 ) ) ( not ( = ?auto_771750 ?auto_771761 ) ) ( not ( = ?auto_771750 ?auto_771762 ) ) ( not ( = ?auto_771750 ?auto_771763 ) ) ( not ( = ?auto_771750 ?auto_771764 ) ) ( not ( = ?auto_771750 ?auto_771765 ) ) ( not ( = ?auto_771751 ?auto_771752 ) ) ( not ( = ?auto_771751 ?auto_771753 ) ) ( not ( = ?auto_771751 ?auto_771754 ) ) ( not ( = ?auto_771751 ?auto_771755 ) ) ( not ( = ?auto_771751 ?auto_771756 ) ) ( not ( = ?auto_771751 ?auto_771757 ) ) ( not ( = ?auto_771751 ?auto_771758 ) ) ( not ( = ?auto_771751 ?auto_771759 ) ) ( not ( = ?auto_771751 ?auto_771760 ) ) ( not ( = ?auto_771751 ?auto_771761 ) ) ( not ( = ?auto_771751 ?auto_771762 ) ) ( not ( = ?auto_771751 ?auto_771763 ) ) ( not ( = ?auto_771751 ?auto_771764 ) ) ( not ( = ?auto_771751 ?auto_771765 ) ) ( not ( = ?auto_771752 ?auto_771753 ) ) ( not ( = ?auto_771752 ?auto_771754 ) ) ( not ( = ?auto_771752 ?auto_771755 ) ) ( not ( = ?auto_771752 ?auto_771756 ) ) ( not ( = ?auto_771752 ?auto_771757 ) ) ( not ( = ?auto_771752 ?auto_771758 ) ) ( not ( = ?auto_771752 ?auto_771759 ) ) ( not ( = ?auto_771752 ?auto_771760 ) ) ( not ( = ?auto_771752 ?auto_771761 ) ) ( not ( = ?auto_771752 ?auto_771762 ) ) ( not ( = ?auto_771752 ?auto_771763 ) ) ( not ( = ?auto_771752 ?auto_771764 ) ) ( not ( = ?auto_771752 ?auto_771765 ) ) ( not ( = ?auto_771753 ?auto_771754 ) ) ( not ( = ?auto_771753 ?auto_771755 ) ) ( not ( = ?auto_771753 ?auto_771756 ) ) ( not ( = ?auto_771753 ?auto_771757 ) ) ( not ( = ?auto_771753 ?auto_771758 ) ) ( not ( = ?auto_771753 ?auto_771759 ) ) ( not ( = ?auto_771753 ?auto_771760 ) ) ( not ( = ?auto_771753 ?auto_771761 ) ) ( not ( = ?auto_771753 ?auto_771762 ) ) ( not ( = ?auto_771753 ?auto_771763 ) ) ( not ( = ?auto_771753 ?auto_771764 ) ) ( not ( = ?auto_771753 ?auto_771765 ) ) ( not ( = ?auto_771754 ?auto_771755 ) ) ( not ( = ?auto_771754 ?auto_771756 ) ) ( not ( = ?auto_771754 ?auto_771757 ) ) ( not ( = ?auto_771754 ?auto_771758 ) ) ( not ( = ?auto_771754 ?auto_771759 ) ) ( not ( = ?auto_771754 ?auto_771760 ) ) ( not ( = ?auto_771754 ?auto_771761 ) ) ( not ( = ?auto_771754 ?auto_771762 ) ) ( not ( = ?auto_771754 ?auto_771763 ) ) ( not ( = ?auto_771754 ?auto_771764 ) ) ( not ( = ?auto_771754 ?auto_771765 ) ) ( not ( = ?auto_771755 ?auto_771756 ) ) ( not ( = ?auto_771755 ?auto_771757 ) ) ( not ( = ?auto_771755 ?auto_771758 ) ) ( not ( = ?auto_771755 ?auto_771759 ) ) ( not ( = ?auto_771755 ?auto_771760 ) ) ( not ( = ?auto_771755 ?auto_771761 ) ) ( not ( = ?auto_771755 ?auto_771762 ) ) ( not ( = ?auto_771755 ?auto_771763 ) ) ( not ( = ?auto_771755 ?auto_771764 ) ) ( not ( = ?auto_771755 ?auto_771765 ) ) ( not ( = ?auto_771756 ?auto_771757 ) ) ( not ( = ?auto_771756 ?auto_771758 ) ) ( not ( = ?auto_771756 ?auto_771759 ) ) ( not ( = ?auto_771756 ?auto_771760 ) ) ( not ( = ?auto_771756 ?auto_771761 ) ) ( not ( = ?auto_771756 ?auto_771762 ) ) ( not ( = ?auto_771756 ?auto_771763 ) ) ( not ( = ?auto_771756 ?auto_771764 ) ) ( not ( = ?auto_771756 ?auto_771765 ) ) ( not ( = ?auto_771757 ?auto_771758 ) ) ( not ( = ?auto_771757 ?auto_771759 ) ) ( not ( = ?auto_771757 ?auto_771760 ) ) ( not ( = ?auto_771757 ?auto_771761 ) ) ( not ( = ?auto_771757 ?auto_771762 ) ) ( not ( = ?auto_771757 ?auto_771763 ) ) ( not ( = ?auto_771757 ?auto_771764 ) ) ( not ( = ?auto_771757 ?auto_771765 ) ) ( not ( = ?auto_771758 ?auto_771759 ) ) ( not ( = ?auto_771758 ?auto_771760 ) ) ( not ( = ?auto_771758 ?auto_771761 ) ) ( not ( = ?auto_771758 ?auto_771762 ) ) ( not ( = ?auto_771758 ?auto_771763 ) ) ( not ( = ?auto_771758 ?auto_771764 ) ) ( not ( = ?auto_771758 ?auto_771765 ) ) ( not ( = ?auto_771759 ?auto_771760 ) ) ( not ( = ?auto_771759 ?auto_771761 ) ) ( not ( = ?auto_771759 ?auto_771762 ) ) ( not ( = ?auto_771759 ?auto_771763 ) ) ( not ( = ?auto_771759 ?auto_771764 ) ) ( not ( = ?auto_771759 ?auto_771765 ) ) ( not ( = ?auto_771760 ?auto_771761 ) ) ( not ( = ?auto_771760 ?auto_771762 ) ) ( not ( = ?auto_771760 ?auto_771763 ) ) ( not ( = ?auto_771760 ?auto_771764 ) ) ( not ( = ?auto_771760 ?auto_771765 ) ) ( not ( = ?auto_771761 ?auto_771762 ) ) ( not ( = ?auto_771761 ?auto_771763 ) ) ( not ( = ?auto_771761 ?auto_771764 ) ) ( not ( = ?auto_771761 ?auto_771765 ) ) ( not ( = ?auto_771762 ?auto_771763 ) ) ( not ( = ?auto_771762 ?auto_771764 ) ) ( not ( = ?auto_771762 ?auto_771765 ) ) ( not ( = ?auto_771763 ?auto_771764 ) ) ( not ( = ?auto_771763 ?auto_771765 ) ) ( not ( = ?auto_771764 ?auto_771765 ) ) ( ON ?auto_771763 ?auto_771764 ) ( ON ?auto_771762 ?auto_771763 ) ( ON ?auto_771761 ?auto_771762 ) ( ON ?auto_771760 ?auto_771761 ) ( ON ?auto_771759 ?auto_771760 ) ( ON ?auto_771758 ?auto_771759 ) ( CLEAR ?auto_771756 ) ( ON ?auto_771757 ?auto_771758 ) ( CLEAR ?auto_771757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_771749 ?auto_771750 ?auto_771751 ?auto_771752 ?auto_771753 ?auto_771754 ?auto_771755 ?auto_771756 ?auto_771757 )
      ( MAKE-16PILE ?auto_771749 ?auto_771750 ?auto_771751 ?auto_771752 ?auto_771753 ?auto_771754 ?auto_771755 ?auto_771756 ?auto_771757 ?auto_771758 ?auto_771759 ?auto_771760 ?auto_771761 ?auto_771762 ?auto_771763 ?auto_771764 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_771815 - BLOCK
      ?auto_771816 - BLOCK
      ?auto_771817 - BLOCK
      ?auto_771818 - BLOCK
      ?auto_771819 - BLOCK
      ?auto_771820 - BLOCK
      ?auto_771821 - BLOCK
      ?auto_771822 - BLOCK
      ?auto_771823 - BLOCK
      ?auto_771824 - BLOCK
      ?auto_771825 - BLOCK
      ?auto_771826 - BLOCK
      ?auto_771827 - BLOCK
      ?auto_771828 - BLOCK
      ?auto_771829 - BLOCK
      ?auto_771830 - BLOCK
    )
    :vars
    (
      ?auto_771831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771830 ?auto_771831 ) ( ON-TABLE ?auto_771815 ) ( ON ?auto_771816 ?auto_771815 ) ( ON ?auto_771817 ?auto_771816 ) ( ON ?auto_771818 ?auto_771817 ) ( ON ?auto_771819 ?auto_771818 ) ( ON ?auto_771820 ?auto_771819 ) ( ON ?auto_771821 ?auto_771820 ) ( not ( = ?auto_771815 ?auto_771816 ) ) ( not ( = ?auto_771815 ?auto_771817 ) ) ( not ( = ?auto_771815 ?auto_771818 ) ) ( not ( = ?auto_771815 ?auto_771819 ) ) ( not ( = ?auto_771815 ?auto_771820 ) ) ( not ( = ?auto_771815 ?auto_771821 ) ) ( not ( = ?auto_771815 ?auto_771822 ) ) ( not ( = ?auto_771815 ?auto_771823 ) ) ( not ( = ?auto_771815 ?auto_771824 ) ) ( not ( = ?auto_771815 ?auto_771825 ) ) ( not ( = ?auto_771815 ?auto_771826 ) ) ( not ( = ?auto_771815 ?auto_771827 ) ) ( not ( = ?auto_771815 ?auto_771828 ) ) ( not ( = ?auto_771815 ?auto_771829 ) ) ( not ( = ?auto_771815 ?auto_771830 ) ) ( not ( = ?auto_771815 ?auto_771831 ) ) ( not ( = ?auto_771816 ?auto_771817 ) ) ( not ( = ?auto_771816 ?auto_771818 ) ) ( not ( = ?auto_771816 ?auto_771819 ) ) ( not ( = ?auto_771816 ?auto_771820 ) ) ( not ( = ?auto_771816 ?auto_771821 ) ) ( not ( = ?auto_771816 ?auto_771822 ) ) ( not ( = ?auto_771816 ?auto_771823 ) ) ( not ( = ?auto_771816 ?auto_771824 ) ) ( not ( = ?auto_771816 ?auto_771825 ) ) ( not ( = ?auto_771816 ?auto_771826 ) ) ( not ( = ?auto_771816 ?auto_771827 ) ) ( not ( = ?auto_771816 ?auto_771828 ) ) ( not ( = ?auto_771816 ?auto_771829 ) ) ( not ( = ?auto_771816 ?auto_771830 ) ) ( not ( = ?auto_771816 ?auto_771831 ) ) ( not ( = ?auto_771817 ?auto_771818 ) ) ( not ( = ?auto_771817 ?auto_771819 ) ) ( not ( = ?auto_771817 ?auto_771820 ) ) ( not ( = ?auto_771817 ?auto_771821 ) ) ( not ( = ?auto_771817 ?auto_771822 ) ) ( not ( = ?auto_771817 ?auto_771823 ) ) ( not ( = ?auto_771817 ?auto_771824 ) ) ( not ( = ?auto_771817 ?auto_771825 ) ) ( not ( = ?auto_771817 ?auto_771826 ) ) ( not ( = ?auto_771817 ?auto_771827 ) ) ( not ( = ?auto_771817 ?auto_771828 ) ) ( not ( = ?auto_771817 ?auto_771829 ) ) ( not ( = ?auto_771817 ?auto_771830 ) ) ( not ( = ?auto_771817 ?auto_771831 ) ) ( not ( = ?auto_771818 ?auto_771819 ) ) ( not ( = ?auto_771818 ?auto_771820 ) ) ( not ( = ?auto_771818 ?auto_771821 ) ) ( not ( = ?auto_771818 ?auto_771822 ) ) ( not ( = ?auto_771818 ?auto_771823 ) ) ( not ( = ?auto_771818 ?auto_771824 ) ) ( not ( = ?auto_771818 ?auto_771825 ) ) ( not ( = ?auto_771818 ?auto_771826 ) ) ( not ( = ?auto_771818 ?auto_771827 ) ) ( not ( = ?auto_771818 ?auto_771828 ) ) ( not ( = ?auto_771818 ?auto_771829 ) ) ( not ( = ?auto_771818 ?auto_771830 ) ) ( not ( = ?auto_771818 ?auto_771831 ) ) ( not ( = ?auto_771819 ?auto_771820 ) ) ( not ( = ?auto_771819 ?auto_771821 ) ) ( not ( = ?auto_771819 ?auto_771822 ) ) ( not ( = ?auto_771819 ?auto_771823 ) ) ( not ( = ?auto_771819 ?auto_771824 ) ) ( not ( = ?auto_771819 ?auto_771825 ) ) ( not ( = ?auto_771819 ?auto_771826 ) ) ( not ( = ?auto_771819 ?auto_771827 ) ) ( not ( = ?auto_771819 ?auto_771828 ) ) ( not ( = ?auto_771819 ?auto_771829 ) ) ( not ( = ?auto_771819 ?auto_771830 ) ) ( not ( = ?auto_771819 ?auto_771831 ) ) ( not ( = ?auto_771820 ?auto_771821 ) ) ( not ( = ?auto_771820 ?auto_771822 ) ) ( not ( = ?auto_771820 ?auto_771823 ) ) ( not ( = ?auto_771820 ?auto_771824 ) ) ( not ( = ?auto_771820 ?auto_771825 ) ) ( not ( = ?auto_771820 ?auto_771826 ) ) ( not ( = ?auto_771820 ?auto_771827 ) ) ( not ( = ?auto_771820 ?auto_771828 ) ) ( not ( = ?auto_771820 ?auto_771829 ) ) ( not ( = ?auto_771820 ?auto_771830 ) ) ( not ( = ?auto_771820 ?auto_771831 ) ) ( not ( = ?auto_771821 ?auto_771822 ) ) ( not ( = ?auto_771821 ?auto_771823 ) ) ( not ( = ?auto_771821 ?auto_771824 ) ) ( not ( = ?auto_771821 ?auto_771825 ) ) ( not ( = ?auto_771821 ?auto_771826 ) ) ( not ( = ?auto_771821 ?auto_771827 ) ) ( not ( = ?auto_771821 ?auto_771828 ) ) ( not ( = ?auto_771821 ?auto_771829 ) ) ( not ( = ?auto_771821 ?auto_771830 ) ) ( not ( = ?auto_771821 ?auto_771831 ) ) ( not ( = ?auto_771822 ?auto_771823 ) ) ( not ( = ?auto_771822 ?auto_771824 ) ) ( not ( = ?auto_771822 ?auto_771825 ) ) ( not ( = ?auto_771822 ?auto_771826 ) ) ( not ( = ?auto_771822 ?auto_771827 ) ) ( not ( = ?auto_771822 ?auto_771828 ) ) ( not ( = ?auto_771822 ?auto_771829 ) ) ( not ( = ?auto_771822 ?auto_771830 ) ) ( not ( = ?auto_771822 ?auto_771831 ) ) ( not ( = ?auto_771823 ?auto_771824 ) ) ( not ( = ?auto_771823 ?auto_771825 ) ) ( not ( = ?auto_771823 ?auto_771826 ) ) ( not ( = ?auto_771823 ?auto_771827 ) ) ( not ( = ?auto_771823 ?auto_771828 ) ) ( not ( = ?auto_771823 ?auto_771829 ) ) ( not ( = ?auto_771823 ?auto_771830 ) ) ( not ( = ?auto_771823 ?auto_771831 ) ) ( not ( = ?auto_771824 ?auto_771825 ) ) ( not ( = ?auto_771824 ?auto_771826 ) ) ( not ( = ?auto_771824 ?auto_771827 ) ) ( not ( = ?auto_771824 ?auto_771828 ) ) ( not ( = ?auto_771824 ?auto_771829 ) ) ( not ( = ?auto_771824 ?auto_771830 ) ) ( not ( = ?auto_771824 ?auto_771831 ) ) ( not ( = ?auto_771825 ?auto_771826 ) ) ( not ( = ?auto_771825 ?auto_771827 ) ) ( not ( = ?auto_771825 ?auto_771828 ) ) ( not ( = ?auto_771825 ?auto_771829 ) ) ( not ( = ?auto_771825 ?auto_771830 ) ) ( not ( = ?auto_771825 ?auto_771831 ) ) ( not ( = ?auto_771826 ?auto_771827 ) ) ( not ( = ?auto_771826 ?auto_771828 ) ) ( not ( = ?auto_771826 ?auto_771829 ) ) ( not ( = ?auto_771826 ?auto_771830 ) ) ( not ( = ?auto_771826 ?auto_771831 ) ) ( not ( = ?auto_771827 ?auto_771828 ) ) ( not ( = ?auto_771827 ?auto_771829 ) ) ( not ( = ?auto_771827 ?auto_771830 ) ) ( not ( = ?auto_771827 ?auto_771831 ) ) ( not ( = ?auto_771828 ?auto_771829 ) ) ( not ( = ?auto_771828 ?auto_771830 ) ) ( not ( = ?auto_771828 ?auto_771831 ) ) ( not ( = ?auto_771829 ?auto_771830 ) ) ( not ( = ?auto_771829 ?auto_771831 ) ) ( not ( = ?auto_771830 ?auto_771831 ) ) ( ON ?auto_771829 ?auto_771830 ) ( ON ?auto_771828 ?auto_771829 ) ( ON ?auto_771827 ?auto_771828 ) ( ON ?auto_771826 ?auto_771827 ) ( ON ?auto_771825 ?auto_771826 ) ( ON ?auto_771824 ?auto_771825 ) ( ON ?auto_771823 ?auto_771824 ) ( CLEAR ?auto_771821 ) ( ON ?auto_771822 ?auto_771823 ) ( CLEAR ?auto_771822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_771815 ?auto_771816 ?auto_771817 ?auto_771818 ?auto_771819 ?auto_771820 ?auto_771821 ?auto_771822 )
      ( MAKE-16PILE ?auto_771815 ?auto_771816 ?auto_771817 ?auto_771818 ?auto_771819 ?auto_771820 ?auto_771821 ?auto_771822 ?auto_771823 ?auto_771824 ?auto_771825 ?auto_771826 ?auto_771827 ?auto_771828 ?auto_771829 ?auto_771830 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_771881 - BLOCK
      ?auto_771882 - BLOCK
      ?auto_771883 - BLOCK
      ?auto_771884 - BLOCK
      ?auto_771885 - BLOCK
      ?auto_771886 - BLOCK
      ?auto_771887 - BLOCK
      ?auto_771888 - BLOCK
      ?auto_771889 - BLOCK
      ?auto_771890 - BLOCK
      ?auto_771891 - BLOCK
      ?auto_771892 - BLOCK
      ?auto_771893 - BLOCK
      ?auto_771894 - BLOCK
      ?auto_771895 - BLOCK
      ?auto_771896 - BLOCK
    )
    :vars
    (
      ?auto_771897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771896 ?auto_771897 ) ( ON-TABLE ?auto_771881 ) ( ON ?auto_771882 ?auto_771881 ) ( ON ?auto_771883 ?auto_771882 ) ( ON ?auto_771884 ?auto_771883 ) ( ON ?auto_771885 ?auto_771884 ) ( ON ?auto_771886 ?auto_771885 ) ( not ( = ?auto_771881 ?auto_771882 ) ) ( not ( = ?auto_771881 ?auto_771883 ) ) ( not ( = ?auto_771881 ?auto_771884 ) ) ( not ( = ?auto_771881 ?auto_771885 ) ) ( not ( = ?auto_771881 ?auto_771886 ) ) ( not ( = ?auto_771881 ?auto_771887 ) ) ( not ( = ?auto_771881 ?auto_771888 ) ) ( not ( = ?auto_771881 ?auto_771889 ) ) ( not ( = ?auto_771881 ?auto_771890 ) ) ( not ( = ?auto_771881 ?auto_771891 ) ) ( not ( = ?auto_771881 ?auto_771892 ) ) ( not ( = ?auto_771881 ?auto_771893 ) ) ( not ( = ?auto_771881 ?auto_771894 ) ) ( not ( = ?auto_771881 ?auto_771895 ) ) ( not ( = ?auto_771881 ?auto_771896 ) ) ( not ( = ?auto_771881 ?auto_771897 ) ) ( not ( = ?auto_771882 ?auto_771883 ) ) ( not ( = ?auto_771882 ?auto_771884 ) ) ( not ( = ?auto_771882 ?auto_771885 ) ) ( not ( = ?auto_771882 ?auto_771886 ) ) ( not ( = ?auto_771882 ?auto_771887 ) ) ( not ( = ?auto_771882 ?auto_771888 ) ) ( not ( = ?auto_771882 ?auto_771889 ) ) ( not ( = ?auto_771882 ?auto_771890 ) ) ( not ( = ?auto_771882 ?auto_771891 ) ) ( not ( = ?auto_771882 ?auto_771892 ) ) ( not ( = ?auto_771882 ?auto_771893 ) ) ( not ( = ?auto_771882 ?auto_771894 ) ) ( not ( = ?auto_771882 ?auto_771895 ) ) ( not ( = ?auto_771882 ?auto_771896 ) ) ( not ( = ?auto_771882 ?auto_771897 ) ) ( not ( = ?auto_771883 ?auto_771884 ) ) ( not ( = ?auto_771883 ?auto_771885 ) ) ( not ( = ?auto_771883 ?auto_771886 ) ) ( not ( = ?auto_771883 ?auto_771887 ) ) ( not ( = ?auto_771883 ?auto_771888 ) ) ( not ( = ?auto_771883 ?auto_771889 ) ) ( not ( = ?auto_771883 ?auto_771890 ) ) ( not ( = ?auto_771883 ?auto_771891 ) ) ( not ( = ?auto_771883 ?auto_771892 ) ) ( not ( = ?auto_771883 ?auto_771893 ) ) ( not ( = ?auto_771883 ?auto_771894 ) ) ( not ( = ?auto_771883 ?auto_771895 ) ) ( not ( = ?auto_771883 ?auto_771896 ) ) ( not ( = ?auto_771883 ?auto_771897 ) ) ( not ( = ?auto_771884 ?auto_771885 ) ) ( not ( = ?auto_771884 ?auto_771886 ) ) ( not ( = ?auto_771884 ?auto_771887 ) ) ( not ( = ?auto_771884 ?auto_771888 ) ) ( not ( = ?auto_771884 ?auto_771889 ) ) ( not ( = ?auto_771884 ?auto_771890 ) ) ( not ( = ?auto_771884 ?auto_771891 ) ) ( not ( = ?auto_771884 ?auto_771892 ) ) ( not ( = ?auto_771884 ?auto_771893 ) ) ( not ( = ?auto_771884 ?auto_771894 ) ) ( not ( = ?auto_771884 ?auto_771895 ) ) ( not ( = ?auto_771884 ?auto_771896 ) ) ( not ( = ?auto_771884 ?auto_771897 ) ) ( not ( = ?auto_771885 ?auto_771886 ) ) ( not ( = ?auto_771885 ?auto_771887 ) ) ( not ( = ?auto_771885 ?auto_771888 ) ) ( not ( = ?auto_771885 ?auto_771889 ) ) ( not ( = ?auto_771885 ?auto_771890 ) ) ( not ( = ?auto_771885 ?auto_771891 ) ) ( not ( = ?auto_771885 ?auto_771892 ) ) ( not ( = ?auto_771885 ?auto_771893 ) ) ( not ( = ?auto_771885 ?auto_771894 ) ) ( not ( = ?auto_771885 ?auto_771895 ) ) ( not ( = ?auto_771885 ?auto_771896 ) ) ( not ( = ?auto_771885 ?auto_771897 ) ) ( not ( = ?auto_771886 ?auto_771887 ) ) ( not ( = ?auto_771886 ?auto_771888 ) ) ( not ( = ?auto_771886 ?auto_771889 ) ) ( not ( = ?auto_771886 ?auto_771890 ) ) ( not ( = ?auto_771886 ?auto_771891 ) ) ( not ( = ?auto_771886 ?auto_771892 ) ) ( not ( = ?auto_771886 ?auto_771893 ) ) ( not ( = ?auto_771886 ?auto_771894 ) ) ( not ( = ?auto_771886 ?auto_771895 ) ) ( not ( = ?auto_771886 ?auto_771896 ) ) ( not ( = ?auto_771886 ?auto_771897 ) ) ( not ( = ?auto_771887 ?auto_771888 ) ) ( not ( = ?auto_771887 ?auto_771889 ) ) ( not ( = ?auto_771887 ?auto_771890 ) ) ( not ( = ?auto_771887 ?auto_771891 ) ) ( not ( = ?auto_771887 ?auto_771892 ) ) ( not ( = ?auto_771887 ?auto_771893 ) ) ( not ( = ?auto_771887 ?auto_771894 ) ) ( not ( = ?auto_771887 ?auto_771895 ) ) ( not ( = ?auto_771887 ?auto_771896 ) ) ( not ( = ?auto_771887 ?auto_771897 ) ) ( not ( = ?auto_771888 ?auto_771889 ) ) ( not ( = ?auto_771888 ?auto_771890 ) ) ( not ( = ?auto_771888 ?auto_771891 ) ) ( not ( = ?auto_771888 ?auto_771892 ) ) ( not ( = ?auto_771888 ?auto_771893 ) ) ( not ( = ?auto_771888 ?auto_771894 ) ) ( not ( = ?auto_771888 ?auto_771895 ) ) ( not ( = ?auto_771888 ?auto_771896 ) ) ( not ( = ?auto_771888 ?auto_771897 ) ) ( not ( = ?auto_771889 ?auto_771890 ) ) ( not ( = ?auto_771889 ?auto_771891 ) ) ( not ( = ?auto_771889 ?auto_771892 ) ) ( not ( = ?auto_771889 ?auto_771893 ) ) ( not ( = ?auto_771889 ?auto_771894 ) ) ( not ( = ?auto_771889 ?auto_771895 ) ) ( not ( = ?auto_771889 ?auto_771896 ) ) ( not ( = ?auto_771889 ?auto_771897 ) ) ( not ( = ?auto_771890 ?auto_771891 ) ) ( not ( = ?auto_771890 ?auto_771892 ) ) ( not ( = ?auto_771890 ?auto_771893 ) ) ( not ( = ?auto_771890 ?auto_771894 ) ) ( not ( = ?auto_771890 ?auto_771895 ) ) ( not ( = ?auto_771890 ?auto_771896 ) ) ( not ( = ?auto_771890 ?auto_771897 ) ) ( not ( = ?auto_771891 ?auto_771892 ) ) ( not ( = ?auto_771891 ?auto_771893 ) ) ( not ( = ?auto_771891 ?auto_771894 ) ) ( not ( = ?auto_771891 ?auto_771895 ) ) ( not ( = ?auto_771891 ?auto_771896 ) ) ( not ( = ?auto_771891 ?auto_771897 ) ) ( not ( = ?auto_771892 ?auto_771893 ) ) ( not ( = ?auto_771892 ?auto_771894 ) ) ( not ( = ?auto_771892 ?auto_771895 ) ) ( not ( = ?auto_771892 ?auto_771896 ) ) ( not ( = ?auto_771892 ?auto_771897 ) ) ( not ( = ?auto_771893 ?auto_771894 ) ) ( not ( = ?auto_771893 ?auto_771895 ) ) ( not ( = ?auto_771893 ?auto_771896 ) ) ( not ( = ?auto_771893 ?auto_771897 ) ) ( not ( = ?auto_771894 ?auto_771895 ) ) ( not ( = ?auto_771894 ?auto_771896 ) ) ( not ( = ?auto_771894 ?auto_771897 ) ) ( not ( = ?auto_771895 ?auto_771896 ) ) ( not ( = ?auto_771895 ?auto_771897 ) ) ( not ( = ?auto_771896 ?auto_771897 ) ) ( ON ?auto_771895 ?auto_771896 ) ( ON ?auto_771894 ?auto_771895 ) ( ON ?auto_771893 ?auto_771894 ) ( ON ?auto_771892 ?auto_771893 ) ( ON ?auto_771891 ?auto_771892 ) ( ON ?auto_771890 ?auto_771891 ) ( ON ?auto_771889 ?auto_771890 ) ( ON ?auto_771888 ?auto_771889 ) ( CLEAR ?auto_771886 ) ( ON ?auto_771887 ?auto_771888 ) ( CLEAR ?auto_771887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_771881 ?auto_771882 ?auto_771883 ?auto_771884 ?auto_771885 ?auto_771886 ?auto_771887 )
      ( MAKE-16PILE ?auto_771881 ?auto_771882 ?auto_771883 ?auto_771884 ?auto_771885 ?auto_771886 ?auto_771887 ?auto_771888 ?auto_771889 ?auto_771890 ?auto_771891 ?auto_771892 ?auto_771893 ?auto_771894 ?auto_771895 ?auto_771896 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_771947 - BLOCK
      ?auto_771948 - BLOCK
      ?auto_771949 - BLOCK
      ?auto_771950 - BLOCK
      ?auto_771951 - BLOCK
      ?auto_771952 - BLOCK
      ?auto_771953 - BLOCK
      ?auto_771954 - BLOCK
      ?auto_771955 - BLOCK
      ?auto_771956 - BLOCK
      ?auto_771957 - BLOCK
      ?auto_771958 - BLOCK
      ?auto_771959 - BLOCK
      ?auto_771960 - BLOCK
      ?auto_771961 - BLOCK
      ?auto_771962 - BLOCK
    )
    :vars
    (
      ?auto_771963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_771962 ?auto_771963 ) ( ON-TABLE ?auto_771947 ) ( ON ?auto_771948 ?auto_771947 ) ( ON ?auto_771949 ?auto_771948 ) ( ON ?auto_771950 ?auto_771949 ) ( ON ?auto_771951 ?auto_771950 ) ( not ( = ?auto_771947 ?auto_771948 ) ) ( not ( = ?auto_771947 ?auto_771949 ) ) ( not ( = ?auto_771947 ?auto_771950 ) ) ( not ( = ?auto_771947 ?auto_771951 ) ) ( not ( = ?auto_771947 ?auto_771952 ) ) ( not ( = ?auto_771947 ?auto_771953 ) ) ( not ( = ?auto_771947 ?auto_771954 ) ) ( not ( = ?auto_771947 ?auto_771955 ) ) ( not ( = ?auto_771947 ?auto_771956 ) ) ( not ( = ?auto_771947 ?auto_771957 ) ) ( not ( = ?auto_771947 ?auto_771958 ) ) ( not ( = ?auto_771947 ?auto_771959 ) ) ( not ( = ?auto_771947 ?auto_771960 ) ) ( not ( = ?auto_771947 ?auto_771961 ) ) ( not ( = ?auto_771947 ?auto_771962 ) ) ( not ( = ?auto_771947 ?auto_771963 ) ) ( not ( = ?auto_771948 ?auto_771949 ) ) ( not ( = ?auto_771948 ?auto_771950 ) ) ( not ( = ?auto_771948 ?auto_771951 ) ) ( not ( = ?auto_771948 ?auto_771952 ) ) ( not ( = ?auto_771948 ?auto_771953 ) ) ( not ( = ?auto_771948 ?auto_771954 ) ) ( not ( = ?auto_771948 ?auto_771955 ) ) ( not ( = ?auto_771948 ?auto_771956 ) ) ( not ( = ?auto_771948 ?auto_771957 ) ) ( not ( = ?auto_771948 ?auto_771958 ) ) ( not ( = ?auto_771948 ?auto_771959 ) ) ( not ( = ?auto_771948 ?auto_771960 ) ) ( not ( = ?auto_771948 ?auto_771961 ) ) ( not ( = ?auto_771948 ?auto_771962 ) ) ( not ( = ?auto_771948 ?auto_771963 ) ) ( not ( = ?auto_771949 ?auto_771950 ) ) ( not ( = ?auto_771949 ?auto_771951 ) ) ( not ( = ?auto_771949 ?auto_771952 ) ) ( not ( = ?auto_771949 ?auto_771953 ) ) ( not ( = ?auto_771949 ?auto_771954 ) ) ( not ( = ?auto_771949 ?auto_771955 ) ) ( not ( = ?auto_771949 ?auto_771956 ) ) ( not ( = ?auto_771949 ?auto_771957 ) ) ( not ( = ?auto_771949 ?auto_771958 ) ) ( not ( = ?auto_771949 ?auto_771959 ) ) ( not ( = ?auto_771949 ?auto_771960 ) ) ( not ( = ?auto_771949 ?auto_771961 ) ) ( not ( = ?auto_771949 ?auto_771962 ) ) ( not ( = ?auto_771949 ?auto_771963 ) ) ( not ( = ?auto_771950 ?auto_771951 ) ) ( not ( = ?auto_771950 ?auto_771952 ) ) ( not ( = ?auto_771950 ?auto_771953 ) ) ( not ( = ?auto_771950 ?auto_771954 ) ) ( not ( = ?auto_771950 ?auto_771955 ) ) ( not ( = ?auto_771950 ?auto_771956 ) ) ( not ( = ?auto_771950 ?auto_771957 ) ) ( not ( = ?auto_771950 ?auto_771958 ) ) ( not ( = ?auto_771950 ?auto_771959 ) ) ( not ( = ?auto_771950 ?auto_771960 ) ) ( not ( = ?auto_771950 ?auto_771961 ) ) ( not ( = ?auto_771950 ?auto_771962 ) ) ( not ( = ?auto_771950 ?auto_771963 ) ) ( not ( = ?auto_771951 ?auto_771952 ) ) ( not ( = ?auto_771951 ?auto_771953 ) ) ( not ( = ?auto_771951 ?auto_771954 ) ) ( not ( = ?auto_771951 ?auto_771955 ) ) ( not ( = ?auto_771951 ?auto_771956 ) ) ( not ( = ?auto_771951 ?auto_771957 ) ) ( not ( = ?auto_771951 ?auto_771958 ) ) ( not ( = ?auto_771951 ?auto_771959 ) ) ( not ( = ?auto_771951 ?auto_771960 ) ) ( not ( = ?auto_771951 ?auto_771961 ) ) ( not ( = ?auto_771951 ?auto_771962 ) ) ( not ( = ?auto_771951 ?auto_771963 ) ) ( not ( = ?auto_771952 ?auto_771953 ) ) ( not ( = ?auto_771952 ?auto_771954 ) ) ( not ( = ?auto_771952 ?auto_771955 ) ) ( not ( = ?auto_771952 ?auto_771956 ) ) ( not ( = ?auto_771952 ?auto_771957 ) ) ( not ( = ?auto_771952 ?auto_771958 ) ) ( not ( = ?auto_771952 ?auto_771959 ) ) ( not ( = ?auto_771952 ?auto_771960 ) ) ( not ( = ?auto_771952 ?auto_771961 ) ) ( not ( = ?auto_771952 ?auto_771962 ) ) ( not ( = ?auto_771952 ?auto_771963 ) ) ( not ( = ?auto_771953 ?auto_771954 ) ) ( not ( = ?auto_771953 ?auto_771955 ) ) ( not ( = ?auto_771953 ?auto_771956 ) ) ( not ( = ?auto_771953 ?auto_771957 ) ) ( not ( = ?auto_771953 ?auto_771958 ) ) ( not ( = ?auto_771953 ?auto_771959 ) ) ( not ( = ?auto_771953 ?auto_771960 ) ) ( not ( = ?auto_771953 ?auto_771961 ) ) ( not ( = ?auto_771953 ?auto_771962 ) ) ( not ( = ?auto_771953 ?auto_771963 ) ) ( not ( = ?auto_771954 ?auto_771955 ) ) ( not ( = ?auto_771954 ?auto_771956 ) ) ( not ( = ?auto_771954 ?auto_771957 ) ) ( not ( = ?auto_771954 ?auto_771958 ) ) ( not ( = ?auto_771954 ?auto_771959 ) ) ( not ( = ?auto_771954 ?auto_771960 ) ) ( not ( = ?auto_771954 ?auto_771961 ) ) ( not ( = ?auto_771954 ?auto_771962 ) ) ( not ( = ?auto_771954 ?auto_771963 ) ) ( not ( = ?auto_771955 ?auto_771956 ) ) ( not ( = ?auto_771955 ?auto_771957 ) ) ( not ( = ?auto_771955 ?auto_771958 ) ) ( not ( = ?auto_771955 ?auto_771959 ) ) ( not ( = ?auto_771955 ?auto_771960 ) ) ( not ( = ?auto_771955 ?auto_771961 ) ) ( not ( = ?auto_771955 ?auto_771962 ) ) ( not ( = ?auto_771955 ?auto_771963 ) ) ( not ( = ?auto_771956 ?auto_771957 ) ) ( not ( = ?auto_771956 ?auto_771958 ) ) ( not ( = ?auto_771956 ?auto_771959 ) ) ( not ( = ?auto_771956 ?auto_771960 ) ) ( not ( = ?auto_771956 ?auto_771961 ) ) ( not ( = ?auto_771956 ?auto_771962 ) ) ( not ( = ?auto_771956 ?auto_771963 ) ) ( not ( = ?auto_771957 ?auto_771958 ) ) ( not ( = ?auto_771957 ?auto_771959 ) ) ( not ( = ?auto_771957 ?auto_771960 ) ) ( not ( = ?auto_771957 ?auto_771961 ) ) ( not ( = ?auto_771957 ?auto_771962 ) ) ( not ( = ?auto_771957 ?auto_771963 ) ) ( not ( = ?auto_771958 ?auto_771959 ) ) ( not ( = ?auto_771958 ?auto_771960 ) ) ( not ( = ?auto_771958 ?auto_771961 ) ) ( not ( = ?auto_771958 ?auto_771962 ) ) ( not ( = ?auto_771958 ?auto_771963 ) ) ( not ( = ?auto_771959 ?auto_771960 ) ) ( not ( = ?auto_771959 ?auto_771961 ) ) ( not ( = ?auto_771959 ?auto_771962 ) ) ( not ( = ?auto_771959 ?auto_771963 ) ) ( not ( = ?auto_771960 ?auto_771961 ) ) ( not ( = ?auto_771960 ?auto_771962 ) ) ( not ( = ?auto_771960 ?auto_771963 ) ) ( not ( = ?auto_771961 ?auto_771962 ) ) ( not ( = ?auto_771961 ?auto_771963 ) ) ( not ( = ?auto_771962 ?auto_771963 ) ) ( ON ?auto_771961 ?auto_771962 ) ( ON ?auto_771960 ?auto_771961 ) ( ON ?auto_771959 ?auto_771960 ) ( ON ?auto_771958 ?auto_771959 ) ( ON ?auto_771957 ?auto_771958 ) ( ON ?auto_771956 ?auto_771957 ) ( ON ?auto_771955 ?auto_771956 ) ( ON ?auto_771954 ?auto_771955 ) ( ON ?auto_771953 ?auto_771954 ) ( CLEAR ?auto_771951 ) ( ON ?auto_771952 ?auto_771953 ) ( CLEAR ?auto_771952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_771947 ?auto_771948 ?auto_771949 ?auto_771950 ?auto_771951 ?auto_771952 )
      ( MAKE-16PILE ?auto_771947 ?auto_771948 ?auto_771949 ?auto_771950 ?auto_771951 ?auto_771952 ?auto_771953 ?auto_771954 ?auto_771955 ?auto_771956 ?auto_771957 ?auto_771958 ?auto_771959 ?auto_771960 ?auto_771961 ?auto_771962 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_772013 - BLOCK
      ?auto_772014 - BLOCK
      ?auto_772015 - BLOCK
      ?auto_772016 - BLOCK
      ?auto_772017 - BLOCK
      ?auto_772018 - BLOCK
      ?auto_772019 - BLOCK
      ?auto_772020 - BLOCK
      ?auto_772021 - BLOCK
      ?auto_772022 - BLOCK
      ?auto_772023 - BLOCK
      ?auto_772024 - BLOCK
      ?auto_772025 - BLOCK
      ?auto_772026 - BLOCK
      ?auto_772027 - BLOCK
      ?auto_772028 - BLOCK
    )
    :vars
    (
      ?auto_772029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772028 ?auto_772029 ) ( ON-TABLE ?auto_772013 ) ( ON ?auto_772014 ?auto_772013 ) ( ON ?auto_772015 ?auto_772014 ) ( ON ?auto_772016 ?auto_772015 ) ( not ( = ?auto_772013 ?auto_772014 ) ) ( not ( = ?auto_772013 ?auto_772015 ) ) ( not ( = ?auto_772013 ?auto_772016 ) ) ( not ( = ?auto_772013 ?auto_772017 ) ) ( not ( = ?auto_772013 ?auto_772018 ) ) ( not ( = ?auto_772013 ?auto_772019 ) ) ( not ( = ?auto_772013 ?auto_772020 ) ) ( not ( = ?auto_772013 ?auto_772021 ) ) ( not ( = ?auto_772013 ?auto_772022 ) ) ( not ( = ?auto_772013 ?auto_772023 ) ) ( not ( = ?auto_772013 ?auto_772024 ) ) ( not ( = ?auto_772013 ?auto_772025 ) ) ( not ( = ?auto_772013 ?auto_772026 ) ) ( not ( = ?auto_772013 ?auto_772027 ) ) ( not ( = ?auto_772013 ?auto_772028 ) ) ( not ( = ?auto_772013 ?auto_772029 ) ) ( not ( = ?auto_772014 ?auto_772015 ) ) ( not ( = ?auto_772014 ?auto_772016 ) ) ( not ( = ?auto_772014 ?auto_772017 ) ) ( not ( = ?auto_772014 ?auto_772018 ) ) ( not ( = ?auto_772014 ?auto_772019 ) ) ( not ( = ?auto_772014 ?auto_772020 ) ) ( not ( = ?auto_772014 ?auto_772021 ) ) ( not ( = ?auto_772014 ?auto_772022 ) ) ( not ( = ?auto_772014 ?auto_772023 ) ) ( not ( = ?auto_772014 ?auto_772024 ) ) ( not ( = ?auto_772014 ?auto_772025 ) ) ( not ( = ?auto_772014 ?auto_772026 ) ) ( not ( = ?auto_772014 ?auto_772027 ) ) ( not ( = ?auto_772014 ?auto_772028 ) ) ( not ( = ?auto_772014 ?auto_772029 ) ) ( not ( = ?auto_772015 ?auto_772016 ) ) ( not ( = ?auto_772015 ?auto_772017 ) ) ( not ( = ?auto_772015 ?auto_772018 ) ) ( not ( = ?auto_772015 ?auto_772019 ) ) ( not ( = ?auto_772015 ?auto_772020 ) ) ( not ( = ?auto_772015 ?auto_772021 ) ) ( not ( = ?auto_772015 ?auto_772022 ) ) ( not ( = ?auto_772015 ?auto_772023 ) ) ( not ( = ?auto_772015 ?auto_772024 ) ) ( not ( = ?auto_772015 ?auto_772025 ) ) ( not ( = ?auto_772015 ?auto_772026 ) ) ( not ( = ?auto_772015 ?auto_772027 ) ) ( not ( = ?auto_772015 ?auto_772028 ) ) ( not ( = ?auto_772015 ?auto_772029 ) ) ( not ( = ?auto_772016 ?auto_772017 ) ) ( not ( = ?auto_772016 ?auto_772018 ) ) ( not ( = ?auto_772016 ?auto_772019 ) ) ( not ( = ?auto_772016 ?auto_772020 ) ) ( not ( = ?auto_772016 ?auto_772021 ) ) ( not ( = ?auto_772016 ?auto_772022 ) ) ( not ( = ?auto_772016 ?auto_772023 ) ) ( not ( = ?auto_772016 ?auto_772024 ) ) ( not ( = ?auto_772016 ?auto_772025 ) ) ( not ( = ?auto_772016 ?auto_772026 ) ) ( not ( = ?auto_772016 ?auto_772027 ) ) ( not ( = ?auto_772016 ?auto_772028 ) ) ( not ( = ?auto_772016 ?auto_772029 ) ) ( not ( = ?auto_772017 ?auto_772018 ) ) ( not ( = ?auto_772017 ?auto_772019 ) ) ( not ( = ?auto_772017 ?auto_772020 ) ) ( not ( = ?auto_772017 ?auto_772021 ) ) ( not ( = ?auto_772017 ?auto_772022 ) ) ( not ( = ?auto_772017 ?auto_772023 ) ) ( not ( = ?auto_772017 ?auto_772024 ) ) ( not ( = ?auto_772017 ?auto_772025 ) ) ( not ( = ?auto_772017 ?auto_772026 ) ) ( not ( = ?auto_772017 ?auto_772027 ) ) ( not ( = ?auto_772017 ?auto_772028 ) ) ( not ( = ?auto_772017 ?auto_772029 ) ) ( not ( = ?auto_772018 ?auto_772019 ) ) ( not ( = ?auto_772018 ?auto_772020 ) ) ( not ( = ?auto_772018 ?auto_772021 ) ) ( not ( = ?auto_772018 ?auto_772022 ) ) ( not ( = ?auto_772018 ?auto_772023 ) ) ( not ( = ?auto_772018 ?auto_772024 ) ) ( not ( = ?auto_772018 ?auto_772025 ) ) ( not ( = ?auto_772018 ?auto_772026 ) ) ( not ( = ?auto_772018 ?auto_772027 ) ) ( not ( = ?auto_772018 ?auto_772028 ) ) ( not ( = ?auto_772018 ?auto_772029 ) ) ( not ( = ?auto_772019 ?auto_772020 ) ) ( not ( = ?auto_772019 ?auto_772021 ) ) ( not ( = ?auto_772019 ?auto_772022 ) ) ( not ( = ?auto_772019 ?auto_772023 ) ) ( not ( = ?auto_772019 ?auto_772024 ) ) ( not ( = ?auto_772019 ?auto_772025 ) ) ( not ( = ?auto_772019 ?auto_772026 ) ) ( not ( = ?auto_772019 ?auto_772027 ) ) ( not ( = ?auto_772019 ?auto_772028 ) ) ( not ( = ?auto_772019 ?auto_772029 ) ) ( not ( = ?auto_772020 ?auto_772021 ) ) ( not ( = ?auto_772020 ?auto_772022 ) ) ( not ( = ?auto_772020 ?auto_772023 ) ) ( not ( = ?auto_772020 ?auto_772024 ) ) ( not ( = ?auto_772020 ?auto_772025 ) ) ( not ( = ?auto_772020 ?auto_772026 ) ) ( not ( = ?auto_772020 ?auto_772027 ) ) ( not ( = ?auto_772020 ?auto_772028 ) ) ( not ( = ?auto_772020 ?auto_772029 ) ) ( not ( = ?auto_772021 ?auto_772022 ) ) ( not ( = ?auto_772021 ?auto_772023 ) ) ( not ( = ?auto_772021 ?auto_772024 ) ) ( not ( = ?auto_772021 ?auto_772025 ) ) ( not ( = ?auto_772021 ?auto_772026 ) ) ( not ( = ?auto_772021 ?auto_772027 ) ) ( not ( = ?auto_772021 ?auto_772028 ) ) ( not ( = ?auto_772021 ?auto_772029 ) ) ( not ( = ?auto_772022 ?auto_772023 ) ) ( not ( = ?auto_772022 ?auto_772024 ) ) ( not ( = ?auto_772022 ?auto_772025 ) ) ( not ( = ?auto_772022 ?auto_772026 ) ) ( not ( = ?auto_772022 ?auto_772027 ) ) ( not ( = ?auto_772022 ?auto_772028 ) ) ( not ( = ?auto_772022 ?auto_772029 ) ) ( not ( = ?auto_772023 ?auto_772024 ) ) ( not ( = ?auto_772023 ?auto_772025 ) ) ( not ( = ?auto_772023 ?auto_772026 ) ) ( not ( = ?auto_772023 ?auto_772027 ) ) ( not ( = ?auto_772023 ?auto_772028 ) ) ( not ( = ?auto_772023 ?auto_772029 ) ) ( not ( = ?auto_772024 ?auto_772025 ) ) ( not ( = ?auto_772024 ?auto_772026 ) ) ( not ( = ?auto_772024 ?auto_772027 ) ) ( not ( = ?auto_772024 ?auto_772028 ) ) ( not ( = ?auto_772024 ?auto_772029 ) ) ( not ( = ?auto_772025 ?auto_772026 ) ) ( not ( = ?auto_772025 ?auto_772027 ) ) ( not ( = ?auto_772025 ?auto_772028 ) ) ( not ( = ?auto_772025 ?auto_772029 ) ) ( not ( = ?auto_772026 ?auto_772027 ) ) ( not ( = ?auto_772026 ?auto_772028 ) ) ( not ( = ?auto_772026 ?auto_772029 ) ) ( not ( = ?auto_772027 ?auto_772028 ) ) ( not ( = ?auto_772027 ?auto_772029 ) ) ( not ( = ?auto_772028 ?auto_772029 ) ) ( ON ?auto_772027 ?auto_772028 ) ( ON ?auto_772026 ?auto_772027 ) ( ON ?auto_772025 ?auto_772026 ) ( ON ?auto_772024 ?auto_772025 ) ( ON ?auto_772023 ?auto_772024 ) ( ON ?auto_772022 ?auto_772023 ) ( ON ?auto_772021 ?auto_772022 ) ( ON ?auto_772020 ?auto_772021 ) ( ON ?auto_772019 ?auto_772020 ) ( ON ?auto_772018 ?auto_772019 ) ( CLEAR ?auto_772016 ) ( ON ?auto_772017 ?auto_772018 ) ( CLEAR ?auto_772017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_772013 ?auto_772014 ?auto_772015 ?auto_772016 ?auto_772017 )
      ( MAKE-16PILE ?auto_772013 ?auto_772014 ?auto_772015 ?auto_772016 ?auto_772017 ?auto_772018 ?auto_772019 ?auto_772020 ?auto_772021 ?auto_772022 ?auto_772023 ?auto_772024 ?auto_772025 ?auto_772026 ?auto_772027 ?auto_772028 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_772079 - BLOCK
      ?auto_772080 - BLOCK
      ?auto_772081 - BLOCK
      ?auto_772082 - BLOCK
      ?auto_772083 - BLOCK
      ?auto_772084 - BLOCK
      ?auto_772085 - BLOCK
      ?auto_772086 - BLOCK
      ?auto_772087 - BLOCK
      ?auto_772088 - BLOCK
      ?auto_772089 - BLOCK
      ?auto_772090 - BLOCK
      ?auto_772091 - BLOCK
      ?auto_772092 - BLOCK
      ?auto_772093 - BLOCK
      ?auto_772094 - BLOCK
    )
    :vars
    (
      ?auto_772095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772094 ?auto_772095 ) ( ON-TABLE ?auto_772079 ) ( ON ?auto_772080 ?auto_772079 ) ( ON ?auto_772081 ?auto_772080 ) ( not ( = ?auto_772079 ?auto_772080 ) ) ( not ( = ?auto_772079 ?auto_772081 ) ) ( not ( = ?auto_772079 ?auto_772082 ) ) ( not ( = ?auto_772079 ?auto_772083 ) ) ( not ( = ?auto_772079 ?auto_772084 ) ) ( not ( = ?auto_772079 ?auto_772085 ) ) ( not ( = ?auto_772079 ?auto_772086 ) ) ( not ( = ?auto_772079 ?auto_772087 ) ) ( not ( = ?auto_772079 ?auto_772088 ) ) ( not ( = ?auto_772079 ?auto_772089 ) ) ( not ( = ?auto_772079 ?auto_772090 ) ) ( not ( = ?auto_772079 ?auto_772091 ) ) ( not ( = ?auto_772079 ?auto_772092 ) ) ( not ( = ?auto_772079 ?auto_772093 ) ) ( not ( = ?auto_772079 ?auto_772094 ) ) ( not ( = ?auto_772079 ?auto_772095 ) ) ( not ( = ?auto_772080 ?auto_772081 ) ) ( not ( = ?auto_772080 ?auto_772082 ) ) ( not ( = ?auto_772080 ?auto_772083 ) ) ( not ( = ?auto_772080 ?auto_772084 ) ) ( not ( = ?auto_772080 ?auto_772085 ) ) ( not ( = ?auto_772080 ?auto_772086 ) ) ( not ( = ?auto_772080 ?auto_772087 ) ) ( not ( = ?auto_772080 ?auto_772088 ) ) ( not ( = ?auto_772080 ?auto_772089 ) ) ( not ( = ?auto_772080 ?auto_772090 ) ) ( not ( = ?auto_772080 ?auto_772091 ) ) ( not ( = ?auto_772080 ?auto_772092 ) ) ( not ( = ?auto_772080 ?auto_772093 ) ) ( not ( = ?auto_772080 ?auto_772094 ) ) ( not ( = ?auto_772080 ?auto_772095 ) ) ( not ( = ?auto_772081 ?auto_772082 ) ) ( not ( = ?auto_772081 ?auto_772083 ) ) ( not ( = ?auto_772081 ?auto_772084 ) ) ( not ( = ?auto_772081 ?auto_772085 ) ) ( not ( = ?auto_772081 ?auto_772086 ) ) ( not ( = ?auto_772081 ?auto_772087 ) ) ( not ( = ?auto_772081 ?auto_772088 ) ) ( not ( = ?auto_772081 ?auto_772089 ) ) ( not ( = ?auto_772081 ?auto_772090 ) ) ( not ( = ?auto_772081 ?auto_772091 ) ) ( not ( = ?auto_772081 ?auto_772092 ) ) ( not ( = ?auto_772081 ?auto_772093 ) ) ( not ( = ?auto_772081 ?auto_772094 ) ) ( not ( = ?auto_772081 ?auto_772095 ) ) ( not ( = ?auto_772082 ?auto_772083 ) ) ( not ( = ?auto_772082 ?auto_772084 ) ) ( not ( = ?auto_772082 ?auto_772085 ) ) ( not ( = ?auto_772082 ?auto_772086 ) ) ( not ( = ?auto_772082 ?auto_772087 ) ) ( not ( = ?auto_772082 ?auto_772088 ) ) ( not ( = ?auto_772082 ?auto_772089 ) ) ( not ( = ?auto_772082 ?auto_772090 ) ) ( not ( = ?auto_772082 ?auto_772091 ) ) ( not ( = ?auto_772082 ?auto_772092 ) ) ( not ( = ?auto_772082 ?auto_772093 ) ) ( not ( = ?auto_772082 ?auto_772094 ) ) ( not ( = ?auto_772082 ?auto_772095 ) ) ( not ( = ?auto_772083 ?auto_772084 ) ) ( not ( = ?auto_772083 ?auto_772085 ) ) ( not ( = ?auto_772083 ?auto_772086 ) ) ( not ( = ?auto_772083 ?auto_772087 ) ) ( not ( = ?auto_772083 ?auto_772088 ) ) ( not ( = ?auto_772083 ?auto_772089 ) ) ( not ( = ?auto_772083 ?auto_772090 ) ) ( not ( = ?auto_772083 ?auto_772091 ) ) ( not ( = ?auto_772083 ?auto_772092 ) ) ( not ( = ?auto_772083 ?auto_772093 ) ) ( not ( = ?auto_772083 ?auto_772094 ) ) ( not ( = ?auto_772083 ?auto_772095 ) ) ( not ( = ?auto_772084 ?auto_772085 ) ) ( not ( = ?auto_772084 ?auto_772086 ) ) ( not ( = ?auto_772084 ?auto_772087 ) ) ( not ( = ?auto_772084 ?auto_772088 ) ) ( not ( = ?auto_772084 ?auto_772089 ) ) ( not ( = ?auto_772084 ?auto_772090 ) ) ( not ( = ?auto_772084 ?auto_772091 ) ) ( not ( = ?auto_772084 ?auto_772092 ) ) ( not ( = ?auto_772084 ?auto_772093 ) ) ( not ( = ?auto_772084 ?auto_772094 ) ) ( not ( = ?auto_772084 ?auto_772095 ) ) ( not ( = ?auto_772085 ?auto_772086 ) ) ( not ( = ?auto_772085 ?auto_772087 ) ) ( not ( = ?auto_772085 ?auto_772088 ) ) ( not ( = ?auto_772085 ?auto_772089 ) ) ( not ( = ?auto_772085 ?auto_772090 ) ) ( not ( = ?auto_772085 ?auto_772091 ) ) ( not ( = ?auto_772085 ?auto_772092 ) ) ( not ( = ?auto_772085 ?auto_772093 ) ) ( not ( = ?auto_772085 ?auto_772094 ) ) ( not ( = ?auto_772085 ?auto_772095 ) ) ( not ( = ?auto_772086 ?auto_772087 ) ) ( not ( = ?auto_772086 ?auto_772088 ) ) ( not ( = ?auto_772086 ?auto_772089 ) ) ( not ( = ?auto_772086 ?auto_772090 ) ) ( not ( = ?auto_772086 ?auto_772091 ) ) ( not ( = ?auto_772086 ?auto_772092 ) ) ( not ( = ?auto_772086 ?auto_772093 ) ) ( not ( = ?auto_772086 ?auto_772094 ) ) ( not ( = ?auto_772086 ?auto_772095 ) ) ( not ( = ?auto_772087 ?auto_772088 ) ) ( not ( = ?auto_772087 ?auto_772089 ) ) ( not ( = ?auto_772087 ?auto_772090 ) ) ( not ( = ?auto_772087 ?auto_772091 ) ) ( not ( = ?auto_772087 ?auto_772092 ) ) ( not ( = ?auto_772087 ?auto_772093 ) ) ( not ( = ?auto_772087 ?auto_772094 ) ) ( not ( = ?auto_772087 ?auto_772095 ) ) ( not ( = ?auto_772088 ?auto_772089 ) ) ( not ( = ?auto_772088 ?auto_772090 ) ) ( not ( = ?auto_772088 ?auto_772091 ) ) ( not ( = ?auto_772088 ?auto_772092 ) ) ( not ( = ?auto_772088 ?auto_772093 ) ) ( not ( = ?auto_772088 ?auto_772094 ) ) ( not ( = ?auto_772088 ?auto_772095 ) ) ( not ( = ?auto_772089 ?auto_772090 ) ) ( not ( = ?auto_772089 ?auto_772091 ) ) ( not ( = ?auto_772089 ?auto_772092 ) ) ( not ( = ?auto_772089 ?auto_772093 ) ) ( not ( = ?auto_772089 ?auto_772094 ) ) ( not ( = ?auto_772089 ?auto_772095 ) ) ( not ( = ?auto_772090 ?auto_772091 ) ) ( not ( = ?auto_772090 ?auto_772092 ) ) ( not ( = ?auto_772090 ?auto_772093 ) ) ( not ( = ?auto_772090 ?auto_772094 ) ) ( not ( = ?auto_772090 ?auto_772095 ) ) ( not ( = ?auto_772091 ?auto_772092 ) ) ( not ( = ?auto_772091 ?auto_772093 ) ) ( not ( = ?auto_772091 ?auto_772094 ) ) ( not ( = ?auto_772091 ?auto_772095 ) ) ( not ( = ?auto_772092 ?auto_772093 ) ) ( not ( = ?auto_772092 ?auto_772094 ) ) ( not ( = ?auto_772092 ?auto_772095 ) ) ( not ( = ?auto_772093 ?auto_772094 ) ) ( not ( = ?auto_772093 ?auto_772095 ) ) ( not ( = ?auto_772094 ?auto_772095 ) ) ( ON ?auto_772093 ?auto_772094 ) ( ON ?auto_772092 ?auto_772093 ) ( ON ?auto_772091 ?auto_772092 ) ( ON ?auto_772090 ?auto_772091 ) ( ON ?auto_772089 ?auto_772090 ) ( ON ?auto_772088 ?auto_772089 ) ( ON ?auto_772087 ?auto_772088 ) ( ON ?auto_772086 ?auto_772087 ) ( ON ?auto_772085 ?auto_772086 ) ( ON ?auto_772084 ?auto_772085 ) ( ON ?auto_772083 ?auto_772084 ) ( CLEAR ?auto_772081 ) ( ON ?auto_772082 ?auto_772083 ) ( CLEAR ?auto_772082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_772079 ?auto_772080 ?auto_772081 ?auto_772082 )
      ( MAKE-16PILE ?auto_772079 ?auto_772080 ?auto_772081 ?auto_772082 ?auto_772083 ?auto_772084 ?auto_772085 ?auto_772086 ?auto_772087 ?auto_772088 ?auto_772089 ?auto_772090 ?auto_772091 ?auto_772092 ?auto_772093 ?auto_772094 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_772145 - BLOCK
      ?auto_772146 - BLOCK
      ?auto_772147 - BLOCK
      ?auto_772148 - BLOCK
      ?auto_772149 - BLOCK
      ?auto_772150 - BLOCK
      ?auto_772151 - BLOCK
      ?auto_772152 - BLOCK
      ?auto_772153 - BLOCK
      ?auto_772154 - BLOCK
      ?auto_772155 - BLOCK
      ?auto_772156 - BLOCK
      ?auto_772157 - BLOCK
      ?auto_772158 - BLOCK
      ?auto_772159 - BLOCK
      ?auto_772160 - BLOCK
    )
    :vars
    (
      ?auto_772161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772160 ?auto_772161 ) ( ON-TABLE ?auto_772145 ) ( ON ?auto_772146 ?auto_772145 ) ( not ( = ?auto_772145 ?auto_772146 ) ) ( not ( = ?auto_772145 ?auto_772147 ) ) ( not ( = ?auto_772145 ?auto_772148 ) ) ( not ( = ?auto_772145 ?auto_772149 ) ) ( not ( = ?auto_772145 ?auto_772150 ) ) ( not ( = ?auto_772145 ?auto_772151 ) ) ( not ( = ?auto_772145 ?auto_772152 ) ) ( not ( = ?auto_772145 ?auto_772153 ) ) ( not ( = ?auto_772145 ?auto_772154 ) ) ( not ( = ?auto_772145 ?auto_772155 ) ) ( not ( = ?auto_772145 ?auto_772156 ) ) ( not ( = ?auto_772145 ?auto_772157 ) ) ( not ( = ?auto_772145 ?auto_772158 ) ) ( not ( = ?auto_772145 ?auto_772159 ) ) ( not ( = ?auto_772145 ?auto_772160 ) ) ( not ( = ?auto_772145 ?auto_772161 ) ) ( not ( = ?auto_772146 ?auto_772147 ) ) ( not ( = ?auto_772146 ?auto_772148 ) ) ( not ( = ?auto_772146 ?auto_772149 ) ) ( not ( = ?auto_772146 ?auto_772150 ) ) ( not ( = ?auto_772146 ?auto_772151 ) ) ( not ( = ?auto_772146 ?auto_772152 ) ) ( not ( = ?auto_772146 ?auto_772153 ) ) ( not ( = ?auto_772146 ?auto_772154 ) ) ( not ( = ?auto_772146 ?auto_772155 ) ) ( not ( = ?auto_772146 ?auto_772156 ) ) ( not ( = ?auto_772146 ?auto_772157 ) ) ( not ( = ?auto_772146 ?auto_772158 ) ) ( not ( = ?auto_772146 ?auto_772159 ) ) ( not ( = ?auto_772146 ?auto_772160 ) ) ( not ( = ?auto_772146 ?auto_772161 ) ) ( not ( = ?auto_772147 ?auto_772148 ) ) ( not ( = ?auto_772147 ?auto_772149 ) ) ( not ( = ?auto_772147 ?auto_772150 ) ) ( not ( = ?auto_772147 ?auto_772151 ) ) ( not ( = ?auto_772147 ?auto_772152 ) ) ( not ( = ?auto_772147 ?auto_772153 ) ) ( not ( = ?auto_772147 ?auto_772154 ) ) ( not ( = ?auto_772147 ?auto_772155 ) ) ( not ( = ?auto_772147 ?auto_772156 ) ) ( not ( = ?auto_772147 ?auto_772157 ) ) ( not ( = ?auto_772147 ?auto_772158 ) ) ( not ( = ?auto_772147 ?auto_772159 ) ) ( not ( = ?auto_772147 ?auto_772160 ) ) ( not ( = ?auto_772147 ?auto_772161 ) ) ( not ( = ?auto_772148 ?auto_772149 ) ) ( not ( = ?auto_772148 ?auto_772150 ) ) ( not ( = ?auto_772148 ?auto_772151 ) ) ( not ( = ?auto_772148 ?auto_772152 ) ) ( not ( = ?auto_772148 ?auto_772153 ) ) ( not ( = ?auto_772148 ?auto_772154 ) ) ( not ( = ?auto_772148 ?auto_772155 ) ) ( not ( = ?auto_772148 ?auto_772156 ) ) ( not ( = ?auto_772148 ?auto_772157 ) ) ( not ( = ?auto_772148 ?auto_772158 ) ) ( not ( = ?auto_772148 ?auto_772159 ) ) ( not ( = ?auto_772148 ?auto_772160 ) ) ( not ( = ?auto_772148 ?auto_772161 ) ) ( not ( = ?auto_772149 ?auto_772150 ) ) ( not ( = ?auto_772149 ?auto_772151 ) ) ( not ( = ?auto_772149 ?auto_772152 ) ) ( not ( = ?auto_772149 ?auto_772153 ) ) ( not ( = ?auto_772149 ?auto_772154 ) ) ( not ( = ?auto_772149 ?auto_772155 ) ) ( not ( = ?auto_772149 ?auto_772156 ) ) ( not ( = ?auto_772149 ?auto_772157 ) ) ( not ( = ?auto_772149 ?auto_772158 ) ) ( not ( = ?auto_772149 ?auto_772159 ) ) ( not ( = ?auto_772149 ?auto_772160 ) ) ( not ( = ?auto_772149 ?auto_772161 ) ) ( not ( = ?auto_772150 ?auto_772151 ) ) ( not ( = ?auto_772150 ?auto_772152 ) ) ( not ( = ?auto_772150 ?auto_772153 ) ) ( not ( = ?auto_772150 ?auto_772154 ) ) ( not ( = ?auto_772150 ?auto_772155 ) ) ( not ( = ?auto_772150 ?auto_772156 ) ) ( not ( = ?auto_772150 ?auto_772157 ) ) ( not ( = ?auto_772150 ?auto_772158 ) ) ( not ( = ?auto_772150 ?auto_772159 ) ) ( not ( = ?auto_772150 ?auto_772160 ) ) ( not ( = ?auto_772150 ?auto_772161 ) ) ( not ( = ?auto_772151 ?auto_772152 ) ) ( not ( = ?auto_772151 ?auto_772153 ) ) ( not ( = ?auto_772151 ?auto_772154 ) ) ( not ( = ?auto_772151 ?auto_772155 ) ) ( not ( = ?auto_772151 ?auto_772156 ) ) ( not ( = ?auto_772151 ?auto_772157 ) ) ( not ( = ?auto_772151 ?auto_772158 ) ) ( not ( = ?auto_772151 ?auto_772159 ) ) ( not ( = ?auto_772151 ?auto_772160 ) ) ( not ( = ?auto_772151 ?auto_772161 ) ) ( not ( = ?auto_772152 ?auto_772153 ) ) ( not ( = ?auto_772152 ?auto_772154 ) ) ( not ( = ?auto_772152 ?auto_772155 ) ) ( not ( = ?auto_772152 ?auto_772156 ) ) ( not ( = ?auto_772152 ?auto_772157 ) ) ( not ( = ?auto_772152 ?auto_772158 ) ) ( not ( = ?auto_772152 ?auto_772159 ) ) ( not ( = ?auto_772152 ?auto_772160 ) ) ( not ( = ?auto_772152 ?auto_772161 ) ) ( not ( = ?auto_772153 ?auto_772154 ) ) ( not ( = ?auto_772153 ?auto_772155 ) ) ( not ( = ?auto_772153 ?auto_772156 ) ) ( not ( = ?auto_772153 ?auto_772157 ) ) ( not ( = ?auto_772153 ?auto_772158 ) ) ( not ( = ?auto_772153 ?auto_772159 ) ) ( not ( = ?auto_772153 ?auto_772160 ) ) ( not ( = ?auto_772153 ?auto_772161 ) ) ( not ( = ?auto_772154 ?auto_772155 ) ) ( not ( = ?auto_772154 ?auto_772156 ) ) ( not ( = ?auto_772154 ?auto_772157 ) ) ( not ( = ?auto_772154 ?auto_772158 ) ) ( not ( = ?auto_772154 ?auto_772159 ) ) ( not ( = ?auto_772154 ?auto_772160 ) ) ( not ( = ?auto_772154 ?auto_772161 ) ) ( not ( = ?auto_772155 ?auto_772156 ) ) ( not ( = ?auto_772155 ?auto_772157 ) ) ( not ( = ?auto_772155 ?auto_772158 ) ) ( not ( = ?auto_772155 ?auto_772159 ) ) ( not ( = ?auto_772155 ?auto_772160 ) ) ( not ( = ?auto_772155 ?auto_772161 ) ) ( not ( = ?auto_772156 ?auto_772157 ) ) ( not ( = ?auto_772156 ?auto_772158 ) ) ( not ( = ?auto_772156 ?auto_772159 ) ) ( not ( = ?auto_772156 ?auto_772160 ) ) ( not ( = ?auto_772156 ?auto_772161 ) ) ( not ( = ?auto_772157 ?auto_772158 ) ) ( not ( = ?auto_772157 ?auto_772159 ) ) ( not ( = ?auto_772157 ?auto_772160 ) ) ( not ( = ?auto_772157 ?auto_772161 ) ) ( not ( = ?auto_772158 ?auto_772159 ) ) ( not ( = ?auto_772158 ?auto_772160 ) ) ( not ( = ?auto_772158 ?auto_772161 ) ) ( not ( = ?auto_772159 ?auto_772160 ) ) ( not ( = ?auto_772159 ?auto_772161 ) ) ( not ( = ?auto_772160 ?auto_772161 ) ) ( ON ?auto_772159 ?auto_772160 ) ( ON ?auto_772158 ?auto_772159 ) ( ON ?auto_772157 ?auto_772158 ) ( ON ?auto_772156 ?auto_772157 ) ( ON ?auto_772155 ?auto_772156 ) ( ON ?auto_772154 ?auto_772155 ) ( ON ?auto_772153 ?auto_772154 ) ( ON ?auto_772152 ?auto_772153 ) ( ON ?auto_772151 ?auto_772152 ) ( ON ?auto_772150 ?auto_772151 ) ( ON ?auto_772149 ?auto_772150 ) ( ON ?auto_772148 ?auto_772149 ) ( CLEAR ?auto_772146 ) ( ON ?auto_772147 ?auto_772148 ) ( CLEAR ?auto_772147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_772145 ?auto_772146 ?auto_772147 )
      ( MAKE-16PILE ?auto_772145 ?auto_772146 ?auto_772147 ?auto_772148 ?auto_772149 ?auto_772150 ?auto_772151 ?auto_772152 ?auto_772153 ?auto_772154 ?auto_772155 ?auto_772156 ?auto_772157 ?auto_772158 ?auto_772159 ?auto_772160 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_772211 - BLOCK
      ?auto_772212 - BLOCK
      ?auto_772213 - BLOCK
      ?auto_772214 - BLOCK
      ?auto_772215 - BLOCK
      ?auto_772216 - BLOCK
      ?auto_772217 - BLOCK
      ?auto_772218 - BLOCK
      ?auto_772219 - BLOCK
      ?auto_772220 - BLOCK
      ?auto_772221 - BLOCK
      ?auto_772222 - BLOCK
      ?auto_772223 - BLOCK
      ?auto_772224 - BLOCK
      ?auto_772225 - BLOCK
      ?auto_772226 - BLOCK
    )
    :vars
    (
      ?auto_772227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772226 ?auto_772227 ) ( ON-TABLE ?auto_772211 ) ( not ( = ?auto_772211 ?auto_772212 ) ) ( not ( = ?auto_772211 ?auto_772213 ) ) ( not ( = ?auto_772211 ?auto_772214 ) ) ( not ( = ?auto_772211 ?auto_772215 ) ) ( not ( = ?auto_772211 ?auto_772216 ) ) ( not ( = ?auto_772211 ?auto_772217 ) ) ( not ( = ?auto_772211 ?auto_772218 ) ) ( not ( = ?auto_772211 ?auto_772219 ) ) ( not ( = ?auto_772211 ?auto_772220 ) ) ( not ( = ?auto_772211 ?auto_772221 ) ) ( not ( = ?auto_772211 ?auto_772222 ) ) ( not ( = ?auto_772211 ?auto_772223 ) ) ( not ( = ?auto_772211 ?auto_772224 ) ) ( not ( = ?auto_772211 ?auto_772225 ) ) ( not ( = ?auto_772211 ?auto_772226 ) ) ( not ( = ?auto_772211 ?auto_772227 ) ) ( not ( = ?auto_772212 ?auto_772213 ) ) ( not ( = ?auto_772212 ?auto_772214 ) ) ( not ( = ?auto_772212 ?auto_772215 ) ) ( not ( = ?auto_772212 ?auto_772216 ) ) ( not ( = ?auto_772212 ?auto_772217 ) ) ( not ( = ?auto_772212 ?auto_772218 ) ) ( not ( = ?auto_772212 ?auto_772219 ) ) ( not ( = ?auto_772212 ?auto_772220 ) ) ( not ( = ?auto_772212 ?auto_772221 ) ) ( not ( = ?auto_772212 ?auto_772222 ) ) ( not ( = ?auto_772212 ?auto_772223 ) ) ( not ( = ?auto_772212 ?auto_772224 ) ) ( not ( = ?auto_772212 ?auto_772225 ) ) ( not ( = ?auto_772212 ?auto_772226 ) ) ( not ( = ?auto_772212 ?auto_772227 ) ) ( not ( = ?auto_772213 ?auto_772214 ) ) ( not ( = ?auto_772213 ?auto_772215 ) ) ( not ( = ?auto_772213 ?auto_772216 ) ) ( not ( = ?auto_772213 ?auto_772217 ) ) ( not ( = ?auto_772213 ?auto_772218 ) ) ( not ( = ?auto_772213 ?auto_772219 ) ) ( not ( = ?auto_772213 ?auto_772220 ) ) ( not ( = ?auto_772213 ?auto_772221 ) ) ( not ( = ?auto_772213 ?auto_772222 ) ) ( not ( = ?auto_772213 ?auto_772223 ) ) ( not ( = ?auto_772213 ?auto_772224 ) ) ( not ( = ?auto_772213 ?auto_772225 ) ) ( not ( = ?auto_772213 ?auto_772226 ) ) ( not ( = ?auto_772213 ?auto_772227 ) ) ( not ( = ?auto_772214 ?auto_772215 ) ) ( not ( = ?auto_772214 ?auto_772216 ) ) ( not ( = ?auto_772214 ?auto_772217 ) ) ( not ( = ?auto_772214 ?auto_772218 ) ) ( not ( = ?auto_772214 ?auto_772219 ) ) ( not ( = ?auto_772214 ?auto_772220 ) ) ( not ( = ?auto_772214 ?auto_772221 ) ) ( not ( = ?auto_772214 ?auto_772222 ) ) ( not ( = ?auto_772214 ?auto_772223 ) ) ( not ( = ?auto_772214 ?auto_772224 ) ) ( not ( = ?auto_772214 ?auto_772225 ) ) ( not ( = ?auto_772214 ?auto_772226 ) ) ( not ( = ?auto_772214 ?auto_772227 ) ) ( not ( = ?auto_772215 ?auto_772216 ) ) ( not ( = ?auto_772215 ?auto_772217 ) ) ( not ( = ?auto_772215 ?auto_772218 ) ) ( not ( = ?auto_772215 ?auto_772219 ) ) ( not ( = ?auto_772215 ?auto_772220 ) ) ( not ( = ?auto_772215 ?auto_772221 ) ) ( not ( = ?auto_772215 ?auto_772222 ) ) ( not ( = ?auto_772215 ?auto_772223 ) ) ( not ( = ?auto_772215 ?auto_772224 ) ) ( not ( = ?auto_772215 ?auto_772225 ) ) ( not ( = ?auto_772215 ?auto_772226 ) ) ( not ( = ?auto_772215 ?auto_772227 ) ) ( not ( = ?auto_772216 ?auto_772217 ) ) ( not ( = ?auto_772216 ?auto_772218 ) ) ( not ( = ?auto_772216 ?auto_772219 ) ) ( not ( = ?auto_772216 ?auto_772220 ) ) ( not ( = ?auto_772216 ?auto_772221 ) ) ( not ( = ?auto_772216 ?auto_772222 ) ) ( not ( = ?auto_772216 ?auto_772223 ) ) ( not ( = ?auto_772216 ?auto_772224 ) ) ( not ( = ?auto_772216 ?auto_772225 ) ) ( not ( = ?auto_772216 ?auto_772226 ) ) ( not ( = ?auto_772216 ?auto_772227 ) ) ( not ( = ?auto_772217 ?auto_772218 ) ) ( not ( = ?auto_772217 ?auto_772219 ) ) ( not ( = ?auto_772217 ?auto_772220 ) ) ( not ( = ?auto_772217 ?auto_772221 ) ) ( not ( = ?auto_772217 ?auto_772222 ) ) ( not ( = ?auto_772217 ?auto_772223 ) ) ( not ( = ?auto_772217 ?auto_772224 ) ) ( not ( = ?auto_772217 ?auto_772225 ) ) ( not ( = ?auto_772217 ?auto_772226 ) ) ( not ( = ?auto_772217 ?auto_772227 ) ) ( not ( = ?auto_772218 ?auto_772219 ) ) ( not ( = ?auto_772218 ?auto_772220 ) ) ( not ( = ?auto_772218 ?auto_772221 ) ) ( not ( = ?auto_772218 ?auto_772222 ) ) ( not ( = ?auto_772218 ?auto_772223 ) ) ( not ( = ?auto_772218 ?auto_772224 ) ) ( not ( = ?auto_772218 ?auto_772225 ) ) ( not ( = ?auto_772218 ?auto_772226 ) ) ( not ( = ?auto_772218 ?auto_772227 ) ) ( not ( = ?auto_772219 ?auto_772220 ) ) ( not ( = ?auto_772219 ?auto_772221 ) ) ( not ( = ?auto_772219 ?auto_772222 ) ) ( not ( = ?auto_772219 ?auto_772223 ) ) ( not ( = ?auto_772219 ?auto_772224 ) ) ( not ( = ?auto_772219 ?auto_772225 ) ) ( not ( = ?auto_772219 ?auto_772226 ) ) ( not ( = ?auto_772219 ?auto_772227 ) ) ( not ( = ?auto_772220 ?auto_772221 ) ) ( not ( = ?auto_772220 ?auto_772222 ) ) ( not ( = ?auto_772220 ?auto_772223 ) ) ( not ( = ?auto_772220 ?auto_772224 ) ) ( not ( = ?auto_772220 ?auto_772225 ) ) ( not ( = ?auto_772220 ?auto_772226 ) ) ( not ( = ?auto_772220 ?auto_772227 ) ) ( not ( = ?auto_772221 ?auto_772222 ) ) ( not ( = ?auto_772221 ?auto_772223 ) ) ( not ( = ?auto_772221 ?auto_772224 ) ) ( not ( = ?auto_772221 ?auto_772225 ) ) ( not ( = ?auto_772221 ?auto_772226 ) ) ( not ( = ?auto_772221 ?auto_772227 ) ) ( not ( = ?auto_772222 ?auto_772223 ) ) ( not ( = ?auto_772222 ?auto_772224 ) ) ( not ( = ?auto_772222 ?auto_772225 ) ) ( not ( = ?auto_772222 ?auto_772226 ) ) ( not ( = ?auto_772222 ?auto_772227 ) ) ( not ( = ?auto_772223 ?auto_772224 ) ) ( not ( = ?auto_772223 ?auto_772225 ) ) ( not ( = ?auto_772223 ?auto_772226 ) ) ( not ( = ?auto_772223 ?auto_772227 ) ) ( not ( = ?auto_772224 ?auto_772225 ) ) ( not ( = ?auto_772224 ?auto_772226 ) ) ( not ( = ?auto_772224 ?auto_772227 ) ) ( not ( = ?auto_772225 ?auto_772226 ) ) ( not ( = ?auto_772225 ?auto_772227 ) ) ( not ( = ?auto_772226 ?auto_772227 ) ) ( ON ?auto_772225 ?auto_772226 ) ( ON ?auto_772224 ?auto_772225 ) ( ON ?auto_772223 ?auto_772224 ) ( ON ?auto_772222 ?auto_772223 ) ( ON ?auto_772221 ?auto_772222 ) ( ON ?auto_772220 ?auto_772221 ) ( ON ?auto_772219 ?auto_772220 ) ( ON ?auto_772218 ?auto_772219 ) ( ON ?auto_772217 ?auto_772218 ) ( ON ?auto_772216 ?auto_772217 ) ( ON ?auto_772215 ?auto_772216 ) ( ON ?auto_772214 ?auto_772215 ) ( ON ?auto_772213 ?auto_772214 ) ( CLEAR ?auto_772211 ) ( ON ?auto_772212 ?auto_772213 ) ( CLEAR ?auto_772212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_772211 ?auto_772212 )
      ( MAKE-16PILE ?auto_772211 ?auto_772212 ?auto_772213 ?auto_772214 ?auto_772215 ?auto_772216 ?auto_772217 ?auto_772218 ?auto_772219 ?auto_772220 ?auto_772221 ?auto_772222 ?auto_772223 ?auto_772224 ?auto_772225 ?auto_772226 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_772277 - BLOCK
      ?auto_772278 - BLOCK
      ?auto_772279 - BLOCK
      ?auto_772280 - BLOCK
      ?auto_772281 - BLOCK
      ?auto_772282 - BLOCK
      ?auto_772283 - BLOCK
      ?auto_772284 - BLOCK
      ?auto_772285 - BLOCK
      ?auto_772286 - BLOCK
      ?auto_772287 - BLOCK
      ?auto_772288 - BLOCK
      ?auto_772289 - BLOCK
      ?auto_772290 - BLOCK
      ?auto_772291 - BLOCK
      ?auto_772292 - BLOCK
    )
    :vars
    (
      ?auto_772293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772292 ?auto_772293 ) ( not ( = ?auto_772277 ?auto_772278 ) ) ( not ( = ?auto_772277 ?auto_772279 ) ) ( not ( = ?auto_772277 ?auto_772280 ) ) ( not ( = ?auto_772277 ?auto_772281 ) ) ( not ( = ?auto_772277 ?auto_772282 ) ) ( not ( = ?auto_772277 ?auto_772283 ) ) ( not ( = ?auto_772277 ?auto_772284 ) ) ( not ( = ?auto_772277 ?auto_772285 ) ) ( not ( = ?auto_772277 ?auto_772286 ) ) ( not ( = ?auto_772277 ?auto_772287 ) ) ( not ( = ?auto_772277 ?auto_772288 ) ) ( not ( = ?auto_772277 ?auto_772289 ) ) ( not ( = ?auto_772277 ?auto_772290 ) ) ( not ( = ?auto_772277 ?auto_772291 ) ) ( not ( = ?auto_772277 ?auto_772292 ) ) ( not ( = ?auto_772277 ?auto_772293 ) ) ( not ( = ?auto_772278 ?auto_772279 ) ) ( not ( = ?auto_772278 ?auto_772280 ) ) ( not ( = ?auto_772278 ?auto_772281 ) ) ( not ( = ?auto_772278 ?auto_772282 ) ) ( not ( = ?auto_772278 ?auto_772283 ) ) ( not ( = ?auto_772278 ?auto_772284 ) ) ( not ( = ?auto_772278 ?auto_772285 ) ) ( not ( = ?auto_772278 ?auto_772286 ) ) ( not ( = ?auto_772278 ?auto_772287 ) ) ( not ( = ?auto_772278 ?auto_772288 ) ) ( not ( = ?auto_772278 ?auto_772289 ) ) ( not ( = ?auto_772278 ?auto_772290 ) ) ( not ( = ?auto_772278 ?auto_772291 ) ) ( not ( = ?auto_772278 ?auto_772292 ) ) ( not ( = ?auto_772278 ?auto_772293 ) ) ( not ( = ?auto_772279 ?auto_772280 ) ) ( not ( = ?auto_772279 ?auto_772281 ) ) ( not ( = ?auto_772279 ?auto_772282 ) ) ( not ( = ?auto_772279 ?auto_772283 ) ) ( not ( = ?auto_772279 ?auto_772284 ) ) ( not ( = ?auto_772279 ?auto_772285 ) ) ( not ( = ?auto_772279 ?auto_772286 ) ) ( not ( = ?auto_772279 ?auto_772287 ) ) ( not ( = ?auto_772279 ?auto_772288 ) ) ( not ( = ?auto_772279 ?auto_772289 ) ) ( not ( = ?auto_772279 ?auto_772290 ) ) ( not ( = ?auto_772279 ?auto_772291 ) ) ( not ( = ?auto_772279 ?auto_772292 ) ) ( not ( = ?auto_772279 ?auto_772293 ) ) ( not ( = ?auto_772280 ?auto_772281 ) ) ( not ( = ?auto_772280 ?auto_772282 ) ) ( not ( = ?auto_772280 ?auto_772283 ) ) ( not ( = ?auto_772280 ?auto_772284 ) ) ( not ( = ?auto_772280 ?auto_772285 ) ) ( not ( = ?auto_772280 ?auto_772286 ) ) ( not ( = ?auto_772280 ?auto_772287 ) ) ( not ( = ?auto_772280 ?auto_772288 ) ) ( not ( = ?auto_772280 ?auto_772289 ) ) ( not ( = ?auto_772280 ?auto_772290 ) ) ( not ( = ?auto_772280 ?auto_772291 ) ) ( not ( = ?auto_772280 ?auto_772292 ) ) ( not ( = ?auto_772280 ?auto_772293 ) ) ( not ( = ?auto_772281 ?auto_772282 ) ) ( not ( = ?auto_772281 ?auto_772283 ) ) ( not ( = ?auto_772281 ?auto_772284 ) ) ( not ( = ?auto_772281 ?auto_772285 ) ) ( not ( = ?auto_772281 ?auto_772286 ) ) ( not ( = ?auto_772281 ?auto_772287 ) ) ( not ( = ?auto_772281 ?auto_772288 ) ) ( not ( = ?auto_772281 ?auto_772289 ) ) ( not ( = ?auto_772281 ?auto_772290 ) ) ( not ( = ?auto_772281 ?auto_772291 ) ) ( not ( = ?auto_772281 ?auto_772292 ) ) ( not ( = ?auto_772281 ?auto_772293 ) ) ( not ( = ?auto_772282 ?auto_772283 ) ) ( not ( = ?auto_772282 ?auto_772284 ) ) ( not ( = ?auto_772282 ?auto_772285 ) ) ( not ( = ?auto_772282 ?auto_772286 ) ) ( not ( = ?auto_772282 ?auto_772287 ) ) ( not ( = ?auto_772282 ?auto_772288 ) ) ( not ( = ?auto_772282 ?auto_772289 ) ) ( not ( = ?auto_772282 ?auto_772290 ) ) ( not ( = ?auto_772282 ?auto_772291 ) ) ( not ( = ?auto_772282 ?auto_772292 ) ) ( not ( = ?auto_772282 ?auto_772293 ) ) ( not ( = ?auto_772283 ?auto_772284 ) ) ( not ( = ?auto_772283 ?auto_772285 ) ) ( not ( = ?auto_772283 ?auto_772286 ) ) ( not ( = ?auto_772283 ?auto_772287 ) ) ( not ( = ?auto_772283 ?auto_772288 ) ) ( not ( = ?auto_772283 ?auto_772289 ) ) ( not ( = ?auto_772283 ?auto_772290 ) ) ( not ( = ?auto_772283 ?auto_772291 ) ) ( not ( = ?auto_772283 ?auto_772292 ) ) ( not ( = ?auto_772283 ?auto_772293 ) ) ( not ( = ?auto_772284 ?auto_772285 ) ) ( not ( = ?auto_772284 ?auto_772286 ) ) ( not ( = ?auto_772284 ?auto_772287 ) ) ( not ( = ?auto_772284 ?auto_772288 ) ) ( not ( = ?auto_772284 ?auto_772289 ) ) ( not ( = ?auto_772284 ?auto_772290 ) ) ( not ( = ?auto_772284 ?auto_772291 ) ) ( not ( = ?auto_772284 ?auto_772292 ) ) ( not ( = ?auto_772284 ?auto_772293 ) ) ( not ( = ?auto_772285 ?auto_772286 ) ) ( not ( = ?auto_772285 ?auto_772287 ) ) ( not ( = ?auto_772285 ?auto_772288 ) ) ( not ( = ?auto_772285 ?auto_772289 ) ) ( not ( = ?auto_772285 ?auto_772290 ) ) ( not ( = ?auto_772285 ?auto_772291 ) ) ( not ( = ?auto_772285 ?auto_772292 ) ) ( not ( = ?auto_772285 ?auto_772293 ) ) ( not ( = ?auto_772286 ?auto_772287 ) ) ( not ( = ?auto_772286 ?auto_772288 ) ) ( not ( = ?auto_772286 ?auto_772289 ) ) ( not ( = ?auto_772286 ?auto_772290 ) ) ( not ( = ?auto_772286 ?auto_772291 ) ) ( not ( = ?auto_772286 ?auto_772292 ) ) ( not ( = ?auto_772286 ?auto_772293 ) ) ( not ( = ?auto_772287 ?auto_772288 ) ) ( not ( = ?auto_772287 ?auto_772289 ) ) ( not ( = ?auto_772287 ?auto_772290 ) ) ( not ( = ?auto_772287 ?auto_772291 ) ) ( not ( = ?auto_772287 ?auto_772292 ) ) ( not ( = ?auto_772287 ?auto_772293 ) ) ( not ( = ?auto_772288 ?auto_772289 ) ) ( not ( = ?auto_772288 ?auto_772290 ) ) ( not ( = ?auto_772288 ?auto_772291 ) ) ( not ( = ?auto_772288 ?auto_772292 ) ) ( not ( = ?auto_772288 ?auto_772293 ) ) ( not ( = ?auto_772289 ?auto_772290 ) ) ( not ( = ?auto_772289 ?auto_772291 ) ) ( not ( = ?auto_772289 ?auto_772292 ) ) ( not ( = ?auto_772289 ?auto_772293 ) ) ( not ( = ?auto_772290 ?auto_772291 ) ) ( not ( = ?auto_772290 ?auto_772292 ) ) ( not ( = ?auto_772290 ?auto_772293 ) ) ( not ( = ?auto_772291 ?auto_772292 ) ) ( not ( = ?auto_772291 ?auto_772293 ) ) ( not ( = ?auto_772292 ?auto_772293 ) ) ( ON ?auto_772291 ?auto_772292 ) ( ON ?auto_772290 ?auto_772291 ) ( ON ?auto_772289 ?auto_772290 ) ( ON ?auto_772288 ?auto_772289 ) ( ON ?auto_772287 ?auto_772288 ) ( ON ?auto_772286 ?auto_772287 ) ( ON ?auto_772285 ?auto_772286 ) ( ON ?auto_772284 ?auto_772285 ) ( ON ?auto_772283 ?auto_772284 ) ( ON ?auto_772282 ?auto_772283 ) ( ON ?auto_772281 ?auto_772282 ) ( ON ?auto_772280 ?auto_772281 ) ( ON ?auto_772279 ?auto_772280 ) ( ON ?auto_772278 ?auto_772279 ) ( ON ?auto_772277 ?auto_772278 ) ( CLEAR ?auto_772277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_772277 )
      ( MAKE-16PILE ?auto_772277 ?auto_772278 ?auto_772279 ?auto_772280 ?auto_772281 ?auto_772282 ?auto_772283 ?auto_772284 ?auto_772285 ?auto_772286 ?auto_772287 ?auto_772288 ?auto_772289 ?auto_772290 ?auto_772291 ?auto_772292 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_772344 - BLOCK
      ?auto_772345 - BLOCK
      ?auto_772346 - BLOCK
      ?auto_772347 - BLOCK
      ?auto_772348 - BLOCK
      ?auto_772349 - BLOCK
      ?auto_772350 - BLOCK
      ?auto_772351 - BLOCK
      ?auto_772352 - BLOCK
      ?auto_772353 - BLOCK
      ?auto_772354 - BLOCK
      ?auto_772355 - BLOCK
      ?auto_772356 - BLOCK
      ?auto_772357 - BLOCK
      ?auto_772358 - BLOCK
      ?auto_772359 - BLOCK
      ?auto_772360 - BLOCK
    )
    :vars
    (
      ?auto_772361 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_772359 ) ( ON ?auto_772360 ?auto_772361 ) ( CLEAR ?auto_772360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_772344 ) ( ON ?auto_772345 ?auto_772344 ) ( ON ?auto_772346 ?auto_772345 ) ( ON ?auto_772347 ?auto_772346 ) ( ON ?auto_772348 ?auto_772347 ) ( ON ?auto_772349 ?auto_772348 ) ( ON ?auto_772350 ?auto_772349 ) ( ON ?auto_772351 ?auto_772350 ) ( ON ?auto_772352 ?auto_772351 ) ( ON ?auto_772353 ?auto_772352 ) ( ON ?auto_772354 ?auto_772353 ) ( ON ?auto_772355 ?auto_772354 ) ( ON ?auto_772356 ?auto_772355 ) ( ON ?auto_772357 ?auto_772356 ) ( ON ?auto_772358 ?auto_772357 ) ( ON ?auto_772359 ?auto_772358 ) ( not ( = ?auto_772344 ?auto_772345 ) ) ( not ( = ?auto_772344 ?auto_772346 ) ) ( not ( = ?auto_772344 ?auto_772347 ) ) ( not ( = ?auto_772344 ?auto_772348 ) ) ( not ( = ?auto_772344 ?auto_772349 ) ) ( not ( = ?auto_772344 ?auto_772350 ) ) ( not ( = ?auto_772344 ?auto_772351 ) ) ( not ( = ?auto_772344 ?auto_772352 ) ) ( not ( = ?auto_772344 ?auto_772353 ) ) ( not ( = ?auto_772344 ?auto_772354 ) ) ( not ( = ?auto_772344 ?auto_772355 ) ) ( not ( = ?auto_772344 ?auto_772356 ) ) ( not ( = ?auto_772344 ?auto_772357 ) ) ( not ( = ?auto_772344 ?auto_772358 ) ) ( not ( = ?auto_772344 ?auto_772359 ) ) ( not ( = ?auto_772344 ?auto_772360 ) ) ( not ( = ?auto_772344 ?auto_772361 ) ) ( not ( = ?auto_772345 ?auto_772346 ) ) ( not ( = ?auto_772345 ?auto_772347 ) ) ( not ( = ?auto_772345 ?auto_772348 ) ) ( not ( = ?auto_772345 ?auto_772349 ) ) ( not ( = ?auto_772345 ?auto_772350 ) ) ( not ( = ?auto_772345 ?auto_772351 ) ) ( not ( = ?auto_772345 ?auto_772352 ) ) ( not ( = ?auto_772345 ?auto_772353 ) ) ( not ( = ?auto_772345 ?auto_772354 ) ) ( not ( = ?auto_772345 ?auto_772355 ) ) ( not ( = ?auto_772345 ?auto_772356 ) ) ( not ( = ?auto_772345 ?auto_772357 ) ) ( not ( = ?auto_772345 ?auto_772358 ) ) ( not ( = ?auto_772345 ?auto_772359 ) ) ( not ( = ?auto_772345 ?auto_772360 ) ) ( not ( = ?auto_772345 ?auto_772361 ) ) ( not ( = ?auto_772346 ?auto_772347 ) ) ( not ( = ?auto_772346 ?auto_772348 ) ) ( not ( = ?auto_772346 ?auto_772349 ) ) ( not ( = ?auto_772346 ?auto_772350 ) ) ( not ( = ?auto_772346 ?auto_772351 ) ) ( not ( = ?auto_772346 ?auto_772352 ) ) ( not ( = ?auto_772346 ?auto_772353 ) ) ( not ( = ?auto_772346 ?auto_772354 ) ) ( not ( = ?auto_772346 ?auto_772355 ) ) ( not ( = ?auto_772346 ?auto_772356 ) ) ( not ( = ?auto_772346 ?auto_772357 ) ) ( not ( = ?auto_772346 ?auto_772358 ) ) ( not ( = ?auto_772346 ?auto_772359 ) ) ( not ( = ?auto_772346 ?auto_772360 ) ) ( not ( = ?auto_772346 ?auto_772361 ) ) ( not ( = ?auto_772347 ?auto_772348 ) ) ( not ( = ?auto_772347 ?auto_772349 ) ) ( not ( = ?auto_772347 ?auto_772350 ) ) ( not ( = ?auto_772347 ?auto_772351 ) ) ( not ( = ?auto_772347 ?auto_772352 ) ) ( not ( = ?auto_772347 ?auto_772353 ) ) ( not ( = ?auto_772347 ?auto_772354 ) ) ( not ( = ?auto_772347 ?auto_772355 ) ) ( not ( = ?auto_772347 ?auto_772356 ) ) ( not ( = ?auto_772347 ?auto_772357 ) ) ( not ( = ?auto_772347 ?auto_772358 ) ) ( not ( = ?auto_772347 ?auto_772359 ) ) ( not ( = ?auto_772347 ?auto_772360 ) ) ( not ( = ?auto_772347 ?auto_772361 ) ) ( not ( = ?auto_772348 ?auto_772349 ) ) ( not ( = ?auto_772348 ?auto_772350 ) ) ( not ( = ?auto_772348 ?auto_772351 ) ) ( not ( = ?auto_772348 ?auto_772352 ) ) ( not ( = ?auto_772348 ?auto_772353 ) ) ( not ( = ?auto_772348 ?auto_772354 ) ) ( not ( = ?auto_772348 ?auto_772355 ) ) ( not ( = ?auto_772348 ?auto_772356 ) ) ( not ( = ?auto_772348 ?auto_772357 ) ) ( not ( = ?auto_772348 ?auto_772358 ) ) ( not ( = ?auto_772348 ?auto_772359 ) ) ( not ( = ?auto_772348 ?auto_772360 ) ) ( not ( = ?auto_772348 ?auto_772361 ) ) ( not ( = ?auto_772349 ?auto_772350 ) ) ( not ( = ?auto_772349 ?auto_772351 ) ) ( not ( = ?auto_772349 ?auto_772352 ) ) ( not ( = ?auto_772349 ?auto_772353 ) ) ( not ( = ?auto_772349 ?auto_772354 ) ) ( not ( = ?auto_772349 ?auto_772355 ) ) ( not ( = ?auto_772349 ?auto_772356 ) ) ( not ( = ?auto_772349 ?auto_772357 ) ) ( not ( = ?auto_772349 ?auto_772358 ) ) ( not ( = ?auto_772349 ?auto_772359 ) ) ( not ( = ?auto_772349 ?auto_772360 ) ) ( not ( = ?auto_772349 ?auto_772361 ) ) ( not ( = ?auto_772350 ?auto_772351 ) ) ( not ( = ?auto_772350 ?auto_772352 ) ) ( not ( = ?auto_772350 ?auto_772353 ) ) ( not ( = ?auto_772350 ?auto_772354 ) ) ( not ( = ?auto_772350 ?auto_772355 ) ) ( not ( = ?auto_772350 ?auto_772356 ) ) ( not ( = ?auto_772350 ?auto_772357 ) ) ( not ( = ?auto_772350 ?auto_772358 ) ) ( not ( = ?auto_772350 ?auto_772359 ) ) ( not ( = ?auto_772350 ?auto_772360 ) ) ( not ( = ?auto_772350 ?auto_772361 ) ) ( not ( = ?auto_772351 ?auto_772352 ) ) ( not ( = ?auto_772351 ?auto_772353 ) ) ( not ( = ?auto_772351 ?auto_772354 ) ) ( not ( = ?auto_772351 ?auto_772355 ) ) ( not ( = ?auto_772351 ?auto_772356 ) ) ( not ( = ?auto_772351 ?auto_772357 ) ) ( not ( = ?auto_772351 ?auto_772358 ) ) ( not ( = ?auto_772351 ?auto_772359 ) ) ( not ( = ?auto_772351 ?auto_772360 ) ) ( not ( = ?auto_772351 ?auto_772361 ) ) ( not ( = ?auto_772352 ?auto_772353 ) ) ( not ( = ?auto_772352 ?auto_772354 ) ) ( not ( = ?auto_772352 ?auto_772355 ) ) ( not ( = ?auto_772352 ?auto_772356 ) ) ( not ( = ?auto_772352 ?auto_772357 ) ) ( not ( = ?auto_772352 ?auto_772358 ) ) ( not ( = ?auto_772352 ?auto_772359 ) ) ( not ( = ?auto_772352 ?auto_772360 ) ) ( not ( = ?auto_772352 ?auto_772361 ) ) ( not ( = ?auto_772353 ?auto_772354 ) ) ( not ( = ?auto_772353 ?auto_772355 ) ) ( not ( = ?auto_772353 ?auto_772356 ) ) ( not ( = ?auto_772353 ?auto_772357 ) ) ( not ( = ?auto_772353 ?auto_772358 ) ) ( not ( = ?auto_772353 ?auto_772359 ) ) ( not ( = ?auto_772353 ?auto_772360 ) ) ( not ( = ?auto_772353 ?auto_772361 ) ) ( not ( = ?auto_772354 ?auto_772355 ) ) ( not ( = ?auto_772354 ?auto_772356 ) ) ( not ( = ?auto_772354 ?auto_772357 ) ) ( not ( = ?auto_772354 ?auto_772358 ) ) ( not ( = ?auto_772354 ?auto_772359 ) ) ( not ( = ?auto_772354 ?auto_772360 ) ) ( not ( = ?auto_772354 ?auto_772361 ) ) ( not ( = ?auto_772355 ?auto_772356 ) ) ( not ( = ?auto_772355 ?auto_772357 ) ) ( not ( = ?auto_772355 ?auto_772358 ) ) ( not ( = ?auto_772355 ?auto_772359 ) ) ( not ( = ?auto_772355 ?auto_772360 ) ) ( not ( = ?auto_772355 ?auto_772361 ) ) ( not ( = ?auto_772356 ?auto_772357 ) ) ( not ( = ?auto_772356 ?auto_772358 ) ) ( not ( = ?auto_772356 ?auto_772359 ) ) ( not ( = ?auto_772356 ?auto_772360 ) ) ( not ( = ?auto_772356 ?auto_772361 ) ) ( not ( = ?auto_772357 ?auto_772358 ) ) ( not ( = ?auto_772357 ?auto_772359 ) ) ( not ( = ?auto_772357 ?auto_772360 ) ) ( not ( = ?auto_772357 ?auto_772361 ) ) ( not ( = ?auto_772358 ?auto_772359 ) ) ( not ( = ?auto_772358 ?auto_772360 ) ) ( not ( = ?auto_772358 ?auto_772361 ) ) ( not ( = ?auto_772359 ?auto_772360 ) ) ( not ( = ?auto_772359 ?auto_772361 ) ) ( not ( = ?auto_772360 ?auto_772361 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_772360 ?auto_772361 )
      ( !STACK ?auto_772360 ?auto_772359 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_772414 - BLOCK
      ?auto_772415 - BLOCK
      ?auto_772416 - BLOCK
      ?auto_772417 - BLOCK
      ?auto_772418 - BLOCK
      ?auto_772419 - BLOCK
      ?auto_772420 - BLOCK
      ?auto_772421 - BLOCK
      ?auto_772422 - BLOCK
      ?auto_772423 - BLOCK
      ?auto_772424 - BLOCK
      ?auto_772425 - BLOCK
      ?auto_772426 - BLOCK
      ?auto_772427 - BLOCK
      ?auto_772428 - BLOCK
      ?auto_772429 - BLOCK
      ?auto_772430 - BLOCK
    )
    :vars
    (
      ?auto_772431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772430 ?auto_772431 ) ( ON-TABLE ?auto_772414 ) ( ON ?auto_772415 ?auto_772414 ) ( ON ?auto_772416 ?auto_772415 ) ( ON ?auto_772417 ?auto_772416 ) ( ON ?auto_772418 ?auto_772417 ) ( ON ?auto_772419 ?auto_772418 ) ( ON ?auto_772420 ?auto_772419 ) ( ON ?auto_772421 ?auto_772420 ) ( ON ?auto_772422 ?auto_772421 ) ( ON ?auto_772423 ?auto_772422 ) ( ON ?auto_772424 ?auto_772423 ) ( ON ?auto_772425 ?auto_772424 ) ( ON ?auto_772426 ?auto_772425 ) ( ON ?auto_772427 ?auto_772426 ) ( ON ?auto_772428 ?auto_772427 ) ( not ( = ?auto_772414 ?auto_772415 ) ) ( not ( = ?auto_772414 ?auto_772416 ) ) ( not ( = ?auto_772414 ?auto_772417 ) ) ( not ( = ?auto_772414 ?auto_772418 ) ) ( not ( = ?auto_772414 ?auto_772419 ) ) ( not ( = ?auto_772414 ?auto_772420 ) ) ( not ( = ?auto_772414 ?auto_772421 ) ) ( not ( = ?auto_772414 ?auto_772422 ) ) ( not ( = ?auto_772414 ?auto_772423 ) ) ( not ( = ?auto_772414 ?auto_772424 ) ) ( not ( = ?auto_772414 ?auto_772425 ) ) ( not ( = ?auto_772414 ?auto_772426 ) ) ( not ( = ?auto_772414 ?auto_772427 ) ) ( not ( = ?auto_772414 ?auto_772428 ) ) ( not ( = ?auto_772414 ?auto_772429 ) ) ( not ( = ?auto_772414 ?auto_772430 ) ) ( not ( = ?auto_772414 ?auto_772431 ) ) ( not ( = ?auto_772415 ?auto_772416 ) ) ( not ( = ?auto_772415 ?auto_772417 ) ) ( not ( = ?auto_772415 ?auto_772418 ) ) ( not ( = ?auto_772415 ?auto_772419 ) ) ( not ( = ?auto_772415 ?auto_772420 ) ) ( not ( = ?auto_772415 ?auto_772421 ) ) ( not ( = ?auto_772415 ?auto_772422 ) ) ( not ( = ?auto_772415 ?auto_772423 ) ) ( not ( = ?auto_772415 ?auto_772424 ) ) ( not ( = ?auto_772415 ?auto_772425 ) ) ( not ( = ?auto_772415 ?auto_772426 ) ) ( not ( = ?auto_772415 ?auto_772427 ) ) ( not ( = ?auto_772415 ?auto_772428 ) ) ( not ( = ?auto_772415 ?auto_772429 ) ) ( not ( = ?auto_772415 ?auto_772430 ) ) ( not ( = ?auto_772415 ?auto_772431 ) ) ( not ( = ?auto_772416 ?auto_772417 ) ) ( not ( = ?auto_772416 ?auto_772418 ) ) ( not ( = ?auto_772416 ?auto_772419 ) ) ( not ( = ?auto_772416 ?auto_772420 ) ) ( not ( = ?auto_772416 ?auto_772421 ) ) ( not ( = ?auto_772416 ?auto_772422 ) ) ( not ( = ?auto_772416 ?auto_772423 ) ) ( not ( = ?auto_772416 ?auto_772424 ) ) ( not ( = ?auto_772416 ?auto_772425 ) ) ( not ( = ?auto_772416 ?auto_772426 ) ) ( not ( = ?auto_772416 ?auto_772427 ) ) ( not ( = ?auto_772416 ?auto_772428 ) ) ( not ( = ?auto_772416 ?auto_772429 ) ) ( not ( = ?auto_772416 ?auto_772430 ) ) ( not ( = ?auto_772416 ?auto_772431 ) ) ( not ( = ?auto_772417 ?auto_772418 ) ) ( not ( = ?auto_772417 ?auto_772419 ) ) ( not ( = ?auto_772417 ?auto_772420 ) ) ( not ( = ?auto_772417 ?auto_772421 ) ) ( not ( = ?auto_772417 ?auto_772422 ) ) ( not ( = ?auto_772417 ?auto_772423 ) ) ( not ( = ?auto_772417 ?auto_772424 ) ) ( not ( = ?auto_772417 ?auto_772425 ) ) ( not ( = ?auto_772417 ?auto_772426 ) ) ( not ( = ?auto_772417 ?auto_772427 ) ) ( not ( = ?auto_772417 ?auto_772428 ) ) ( not ( = ?auto_772417 ?auto_772429 ) ) ( not ( = ?auto_772417 ?auto_772430 ) ) ( not ( = ?auto_772417 ?auto_772431 ) ) ( not ( = ?auto_772418 ?auto_772419 ) ) ( not ( = ?auto_772418 ?auto_772420 ) ) ( not ( = ?auto_772418 ?auto_772421 ) ) ( not ( = ?auto_772418 ?auto_772422 ) ) ( not ( = ?auto_772418 ?auto_772423 ) ) ( not ( = ?auto_772418 ?auto_772424 ) ) ( not ( = ?auto_772418 ?auto_772425 ) ) ( not ( = ?auto_772418 ?auto_772426 ) ) ( not ( = ?auto_772418 ?auto_772427 ) ) ( not ( = ?auto_772418 ?auto_772428 ) ) ( not ( = ?auto_772418 ?auto_772429 ) ) ( not ( = ?auto_772418 ?auto_772430 ) ) ( not ( = ?auto_772418 ?auto_772431 ) ) ( not ( = ?auto_772419 ?auto_772420 ) ) ( not ( = ?auto_772419 ?auto_772421 ) ) ( not ( = ?auto_772419 ?auto_772422 ) ) ( not ( = ?auto_772419 ?auto_772423 ) ) ( not ( = ?auto_772419 ?auto_772424 ) ) ( not ( = ?auto_772419 ?auto_772425 ) ) ( not ( = ?auto_772419 ?auto_772426 ) ) ( not ( = ?auto_772419 ?auto_772427 ) ) ( not ( = ?auto_772419 ?auto_772428 ) ) ( not ( = ?auto_772419 ?auto_772429 ) ) ( not ( = ?auto_772419 ?auto_772430 ) ) ( not ( = ?auto_772419 ?auto_772431 ) ) ( not ( = ?auto_772420 ?auto_772421 ) ) ( not ( = ?auto_772420 ?auto_772422 ) ) ( not ( = ?auto_772420 ?auto_772423 ) ) ( not ( = ?auto_772420 ?auto_772424 ) ) ( not ( = ?auto_772420 ?auto_772425 ) ) ( not ( = ?auto_772420 ?auto_772426 ) ) ( not ( = ?auto_772420 ?auto_772427 ) ) ( not ( = ?auto_772420 ?auto_772428 ) ) ( not ( = ?auto_772420 ?auto_772429 ) ) ( not ( = ?auto_772420 ?auto_772430 ) ) ( not ( = ?auto_772420 ?auto_772431 ) ) ( not ( = ?auto_772421 ?auto_772422 ) ) ( not ( = ?auto_772421 ?auto_772423 ) ) ( not ( = ?auto_772421 ?auto_772424 ) ) ( not ( = ?auto_772421 ?auto_772425 ) ) ( not ( = ?auto_772421 ?auto_772426 ) ) ( not ( = ?auto_772421 ?auto_772427 ) ) ( not ( = ?auto_772421 ?auto_772428 ) ) ( not ( = ?auto_772421 ?auto_772429 ) ) ( not ( = ?auto_772421 ?auto_772430 ) ) ( not ( = ?auto_772421 ?auto_772431 ) ) ( not ( = ?auto_772422 ?auto_772423 ) ) ( not ( = ?auto_772422 ?auto_772424 ) ) ( not ( = ?auto_772422 ?auto_772425 ) ) ( not ( = ?auto_772422 ?auto_772426 ) ) ( not ( = ?auto_772422 ?auto_772427 ) ) ( not ( = ?auto_772422 ?auto_772428 ) ) ( not ( = ?auto_772422 ?auto_772429 ) ) ( not ( = ?auto_772422 ?auto_772430 ) ) ( not ( = ?auto_772422 ?auto_772431 ) ) ( not ( = ?auto_772423 ?auto_772424 ) ) ( not ( = ?auto_772423 ?auto_772425 ) ) ( not ( = ?auto_772423 ?auto_772426 ) ) ( not ( = ?auto_772423 ?auto_772427 ) ) ( not ( = ?auto_772423 ?auto_772428 ) ) ( not ( = ?auto_772423 ?auto_772429 ) ) ( not ( = ?auto_772423 ?auto_772430 ) ) ( not ( = ?auto_772423 ?auto_772431 ) ) ( not ( = ?auto_772424 ?auto_772425 ) ) ( not ( = ?auto_772424 ?auto_772426 ) ) ( not ( = ?auto_772424 ?auto_772427 ) ) ( not ( = ?auto_772424 ?auto_772428 ) ) ( not ( = ?auto_772424 ?auto_772429 ) ) ( not ( = ?auto_772424 ?auto_772430 ) ) ( not ( = ?auto_772424 ?auto_772431 ) ) ( not ( = ?auto_772425 ?auto_772426 ) ) ( not ( = ?auto_772425 ?auto_772427 ) ) ( not ( = ?auto_772425 ?auto_772428 ) ) ( not ( = ?auto_772425 ?auto_772429 ) ) ( not ( = ?auto_772425 ?auto_772430 ) ) ( not ( = ?auto_772425 ?auto_772431 ) ) ( not ( = ?auto_772426 ?auto_772427 ) ) ( not ( = ?auto_772426 ?auto_772428 ) ) ( not ( = ?auto_772426 ?auto_772429 ) ) ( not ( = ?auto_772426 ?auto_772430 ) ) ( not ( = ?auto_772426 ?auto_772431 ) ) ( not ( = ?auto_772427 ?auto_772428 ) ) ( not ( = ?auto_772427 ?auto_772429 ) ) ( not ( = ?auto_772427 ?auto_772430 ) ) ( not ( = ?auto_772427 ?auto_772431 ) ) ( not ( = ?auto_772428 ?auto_772429 ) ) ( not ( = ?auto_772428 ?auto_772430 ) ) ( not ( = ?auto_772428 ?auto_772431 ) ) ( not ( = ?auto_772429 ?auto_772430 ) ) ( not ( = ?auto_772429 ?auto_772431 ) ) ( not ( = ?auto_772430 ?auto_772431 ) ) ( CLEAR ?auto_772428 ) ( ON ?auto_772429 ?auto_772430 ) ( CLEAR ?auto_772429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_772414 ?auto_772415 ?auto_772416 ?auto_772417 ?auto_772418 ?auto_772419 ?auto_772420 ?auto_772421 ?auto_772422 ?auto_772423 ?auto_772424 ?auto_772425 ?auto_772426 ?auto_772427 ?auto_772428 ?auto_772429 )
      ( MAKE-17PILE ?auto_772414 ?auto_772415 ?auto_772416 ?auto_772417 ?auto_772418 ?auto_772419 ?auto_772420 ?auto_772421 ?auto_772422 ?auto_772423 ?auto_772424 ?auto_772425 ?auto_772426 ?auto_772427 ?auto_772428 ?auto_772429 ?auto_772430 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_772484 - BLOCK
      ?auto_772485 - BLOCK
      ?auto_772486 - BLOCK
      ?auto_772487 - BLOCK
      ?auto_772488 - BLOCK
      ?auto_772489 - BLOCK
      ?auto_772490 - BLOCK
      ?auto_772491 - BLOCK
      ?auto_772492 - BLOCK
      ?auto_772493 - BLOCK
      ?auto_772494 - BLOCK
      ?auto_772495 - BLOCK
      ?auto_772496 - BLOCK
      ?auto_772497 - BLOCK
      ?auto_772498 - BLOCK
      ?auto_772499 - BLOCK
      ?auto_772500 - BLOCK
    )
    :vars
    (
      ?auto_772501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772500 ?auto_772501 ) ( ON-TABLE ?auto_772484 ) ( ON ?auto_772485 ?auto_772484 ) ( ON ?auto_772486 ?auto_772485 ) ( ON ?auto_772487 ?auto_772486 ) ( ON ?auto_772488 ?auto_772487 ) ( ON ?auto_772489 ?auto_772488 ) ( ON ?auto_772490 ?auto_772489 ) ( ON ?auto_772491 ?auto_772490 ) ( ON ?auto_772492 ?auto_772491 ) ( ON ?auto_772493 ?auto_772492 ) ( ON ?auto_772494 ?auto_772493 ) ( ON ?auto_772495 ?auto_772494 ) ( ON ?auto_772496 ?auto_772495 ) ( ON ?auto_772497 ?auto_772496 ) ( not ( = ?auto_772484 ?auto_772485 ) ) ( not ( = ?auto_772484 ?auto_772486 ) ) ( not ( = ?auto_772484 ?auto_772487 ) ) ( not ( = ?auto_772484 ?auto_772488 ) ) ( not ( = ?auto_772484 ?auto_772489 ) ) ( not ( = ?auto_772484 ?auto_772490 ) ) ( not ( = ?auto_772484 ?auto_772491 ) ) ( not ( = ?auto_772484 ?auto_772492 ) ) ( not ( = ?auto_772484 ?auto_772493 ) ) ( not ( = ?auto_772484 ?auto_772494 ) ) ( not ( = ?auto_772484 ?auto_772495 ) ) ( not ( = ?auto_772484 ?auto_772496 ) ) ( not ( = ?auto_772484 ?auto_772497 ) ) ( not ( = ?auto_772484 ?auto_772498 ) ) ( not ( = ?auto_772484 ?auto_772499 ) ) ( not ( = ?auto_772484 ?auto_772500 ) ) ( not ( = ?auto_772484 ?auto_772501 ) ) ( not ( = ?auto_772485 ?auto_772486 ) ) ( not ( = ?auto_772485 ?auto_772487 ) ) ( not ( = ?auto_772485 ?auto_772488 ) ) ( not ( = ?auto_772485 ?auto_772489 ) ) ( not ( = ?auto_772485 ?auto_772490 ) ) ( not ( = ?auto_772485 ?auto_772491 ) ) ( not ( = ?auto_772485 ?auto_772492 ) ) ( not ( = ?auto_772485 ?auto_772493 ) ) ( not ( = ?auto_772485 ?auto_772494 ) ) ( not ( = ?auto_772485 ?auto_772495 ) ) ( not ( = ?auto_772485 ?auto_772496 ) ) ( not ( = ?auto_772485 ?auto_772497 ) ) ( not ( = ?auto_772485 ?auto_772498 ) ) ( not ( = ?auto_772485 ?auto_772499 ) ) ( not ( = ?auto_772485 ?auto_772500 ) ) ( not ( = ?auto_772485 ?auto_772501 ) ) ( not ( = ?auto_772486 ?auto_772487 ) ) ( not ( = ?auto_772486 ?auto_772488 ) ) ( not ( = ?auto_772486 ?auto_772489 ) ) ( not ( = ?auto_772486 ?auto_772490 ) ) ( not ( = ?auto_772486 ?auto_772491 ) ) ( not ( = ?auto_772486 ?auto_772492 ) ) ( not ( = ?auto_772486 ?auto_772493 ) ) ( not ( = ?auto_772486 ?auto_772494 ) ) ( not ( = ?auto_772486 ?auto_772495 ) ) ( not ( = ?auto_772486 ?auto_772496 ) ) ( not ( = ?auto_772486 ?auto_772497 ) ) ( not ( = ?auto_772486 ?auto_772498 ) ) ( not ( = ?auto_772486 ?auto_772499 ) ) ( not ( = ?auto_772486 ?auto_772500 ) ) ( not ( = ?auto_772486 ?auto_772501 ) ) ( not ( = ?auto_772487 ?auto_772488 ) ) ( not ( = ?auto_772487 ?auto_772489 ) ) ( not ( = ?auto_772487 ?auto_772490 ) ) ( not ( = ?auto_772487 ?auto_772491 ) ) ( not ( = ?auto_772487 ?auto_772492 ) ) ( not ( = ?auto_772487 ?auto_772493 ) ) ( not ( = ?auto_772487 ?auto_772494 ) ) ( not ( = ?auto_772487 ?auto_772495 ) ) ( not ( = ?auto_772487 ?auto_772496 ) ) ( not ( = ?auto_772487 ?auto_772497 ) ) ( not ( = ?auto_772487 ?auto_772498 ) ) ( not ( = ?auto_772487 ?auto_772499 ) ) ( not ( = ?auto_772487 ?auto_772500 ) ) ( not ( = ?auto_772487 ?auto_772501 ) ) ( not ( = ?auto_772488 ?auto_772489 ) ) ( not ( = ?auto_772488 ?auto_772490 ) ) ( not ( = ?auto_772488 ?auto_772491 ) ) ( not ( = ?auto_772488 ?auto_772492 ) ) ( not ( = ?auto_772488 ?auto_772493 ) ) ( not ( = ?auto_772488 ?auto_772494 ) ) ( not ( = ?auto_772488 ?auto_772495 ) ) ( not ( = ?auto_772488 ?auto_772496 ) ) ( not ( = ?auto_772488 ?auto_772497 ) ) ( not ( = ?auto_772488 ?auto_772498 ) ) ( not ( = ?auto_772488 ?auto_772499 ) ) ( not ( = ?auto_772488 ?auto_772500 ) ) ( not ( = ?auto_772488 ?auto_772501 ) ) ( not ( = ?auto_772489 ?auto_772490 ) ) ( not ( = ?auto_772489 ?auto_772491 ) ) ( not ( = ?auto_772489 ?auto_772492 ) ) ( not ( = ?auto_772489 ?auto_772493 ) ) ( not ( = ?auto_772489 ?auto_772494 ) ) ( not ( = ?auto_772489 ?auto_772495 ) ) ( not ( = ?auto_772489 ?auto_772496 ) ) ( not ( = ?auto_772489 ?auto_772497 ) ) ( not ( = ?auto_772489 ?auto_772498 ) ) ( not ( = ?auto_772489 ?auto_772499 ) ) ( not ( = ?auto_772489 ?auto_772500 ) ) ( not ( = ?auto_772489 ?auto_772501 ) ) ( not ( = ?auto_772490 ?auto_772491 ) ) ( not ( = ?auto_772490 ?auto_772492 ) ) ( not ( = ?auto_772490 ?auto_772493 ) ) ( not ( = ?auto_772490 ?auto_772494 ) ) ( not ( = ?auto_772490 ?auto_772495 ) ) ( not ( = ?auto_772490 ?auto_772496 ) ) ( not ( = ?auto_772490 ?auto_772497 ) ) ( not ( = ?auto_772490 ?auto_772498 ) ) ( not ( = ?auto_772490 ?auto_772499 ) ) ( not ( = ?auto_772490 ?auto_772500 ) ) ( not ( = ?auto_772490 ?auto_772501 ) ) ( not ( = ?auto_772491 ?auto_772492 ) ) ( not ( = ?auto_772491 ?auto_772493 ) ) ( not ( = ?auto_772491 ?auto_772494 ) ) ( not ( = ?auto_772491 ?auto_772495 ) ) ( not ( = ?auto_772491 ?auto_772496 ) ) ( not ( = ?auto_772491 ?auto_772497 ) ) ( not ( = ?auto_772491 ?auto_772498 ) ) ( not ( = ?auto_772491 ?auto_772499 ) ) ( not ( = ?auto_772491 ?auto_772500 ) ) ( not ( = ?auto_772491 ?auto_772501 ) ) ( not ( = ?auto_772492 ?auto_772493 ) ) ( not ( = ?auto_772492 ?auto_772494 ) ) ( not ( = ?auto_772492 ?auto_772495 ) ) ( not ( = ?auto_772492 ?auto_772496 ) ) ( not ( = ?auto_772492 ?auto_772497 ) ) ( not ( = ?auto_772492 ?auto_772498 ) ) ( not ( = ?auto_772492 ?auto_772499 ) ) ( not ( = ?auto_772492 ?auto_772500 ) ) ( not ( = ?auto_772492 ?auto_772501 ) ) ( not ( = ?auto_772493 ?auto_772494 ) ) ( not ( = ?auto_772493 ?auto_772495 ) ) ( not ( = ?auto_772493 ?auto_772496 ) ) ( not ( = ?auto_772493 ?auto_772497 ) ) ( not ( = ?auto_772493 ?auto_772498 ) ) ( not ( = ?auto_772493 ?auto_772499 ) ) ( not ( = ?auto_772493 ?auto_772500 ) ) ( not ( = ?auto_772493 ?auto_772501 ) ) ( not ( = ?auto_772494 ?auto_772495 ) ) ( not ( = ?auto_772494 ?auto_772496 ) ) ( not ( = ?auto_772494 ?auto_772497 ) ) ( not ( = ?auto_772494 ?auto_772498 ) ) ( not ( = ?auto_772494 ?auto_772499 ) ) ( not ( = ?auto_772494 ?auto_772500 ) ) ( not ( = ?auto_772494 ?auto_772501 ) ) ( not ( = ?auto_772495 ?auto_772496 ) ) ( not ( = ?auto_772495 ?auto_772497 ) ) ( not ( = ?auto_772495 ?auto_772498 ) ) ( not ( = ?auto_772495 ?auto_772499 ) ) ( not ( = ?auto_772495 ?auto_772500 ) ) ( not ( = ?auto_772495 ?auto_772501 ) ) ( not ( = ?auto_772496 ?auto_772497 ) ) ( not ( = ?auto_772496 ?auto_772498 ) ) ( not ( = ?auto_772496 ?auto_772499 ) ) ( not ( = ?auto_772496 ?auto_772500 ) ) ( not ( = ?auto_772496 ?auto_772501 ) ) ( not ( = ?auto_772497 ?auto_772498 ) ) ( not ( = ?auto_772497 ?auto_772499 ) ) ( not ( = ?auto_772497 ?auto_772500 ) ) ( not ( = ?auto_772497 ?auto_772501 ) ) ( not ( = ?auto_772498 ?auto_772499 ) ) ( not ( = ?auto_772498 ?auto_772500 ) ) ( not ( = ?auto_772498 ?auto_772501 ) ) ( not ( = ?auto_772499 ?auto_772500 ) ) ( not ( = ?auto_772499 ?auto_772501 ) ) ( not ( = ?auto_772500 ?auto_772501 ) ) ( ON ?auto_772499 ?auto_772500 ) ( CLEAR ?auto_772497 ) ( ON ?auto_772498 ?auto_772499 ) ( CLEAR ?auto_772498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_772484 ?auto_772485 ?auto_772486 ?auto_772487 ?auto_772488 ?auto_772489 ?auto_772490 ?auto_772491 ?auto_772492 ?auto_772493 ?auto_772494 ?auto_772495 ?auto_772496 ?auto_772497 ?auto_772498 )
      ( MAKE-17PILE ?auto_772484 ?auto_772485 ?auto_772486 ?auto_772487 ?auto_772488 ?auto_772489 ?auto_772490 ?auto_772491 ?auto_772492 ?auto_772493 ?auto_772494 ?auto_772495 ?auto_772496 ?auto_772497 ?auto_772498 ?auto_772499 ?auto_772500 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_772554 - BLOCK
      ?auto_772555 - BLOCK
      ?auto_772556 - BLOCK
      ?auto_772557 - BLOCK
      ?auto_772558 - BLOCK
      ?auto_772559 - BLOCK
      ?auto_772560 - BLOCK
      ?auto_772561 - BLOCK
      ?auto_772562 - BLOCK
      ?auto_772563 - BLOCK
      ?auto_772564 - BLOCK
      ?auto_772565 - BLOCK
      ?auto_772566 - BLOCK
      ?auto_772567 - BLOCK
      ?auto_772568 - BLOCK
      ?auto_772569 - BLOCK
      ?auto_772570 - BLOCK
    )
    :vars
    (
      ?auto_772571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772570 ?auto_772571 ) ( ON-TABLE ?auto_772554 ) ( ON ?auto_772555 ?auto_772554 ) ( ON ?auto_772556 ?auto_772555 ) ( ON ?auto_772557 ?auto_772556 ) ( ON ?auto_772558 ?auto_772557 ) ( ON ?auto_772559 ?auto_772558 ) ( ON ?auto_772560 ?auto_772559 ) ( ON ?auto_772561 ?auto_772560 ) ( ON ?auto_772562 ?auto_772561 ) ( ON ?auto_772563 ?auto_772562 ) ( ON ?auto_772564 ?auto_772563 ) ( ON ?auto_772565 ?auto_772564 ) ( ON ?auto_772566 ?auto_772565 ) ( not ( = ?auto_772554 ?auto_772555 ) ) ( not ( = ?auto_772554 ?auto_772556 ) ) ( not ( = ?auto_772554 ?auto_772557 ) ) ( not ( = ?auto_772554 ?auto_772558 ) ) ( not ( = ?auto_772554 ?auto_772559 ) ) ( not ( = ?auto_772554 ?auto_772560 ) ) ( not ( = ?auto_772554 ?auto_772561 ) ) ( not ( = ?auto_772554 ?auto_772562 ) ) ( not ( = ?auto_772554 ?auto_772563 ) ) ( not ( = ?auto_772554 ?auto_772564 ) ) ( not ( = ?auto_772554 ?auto_772565 ) ) ( not ( = ?auto_772554 ?auto_772566 ) ) ( not ( = ?auto_772554 ?auto_772567 ) ) ( not ( = ?auto_772554 ?auto_772568 ) ) ( not ( = ?auto_772554 ?auto_772569 ) ) ( not ( = ?auto_772554 ?auto_772570 ) ) ( not ( = ?auto_772554 ?auto_772571 ) ) ( not ( = ?auto_772555 ?auto_772556 ) ) ( not ( = ?auto_772555 ?auto_772557 ) ) ( not ( = ?auto_772555 ?auto_772558 ) ) ( not ( = ?auto_772555 ?auto_772559 ) ) ( not ( = ?auto_772555 ?auto_772560 ) ) ( not ( = ?auto_772555 ?auto_772561 ) ) ( not ( = ?auto_772555 ?auto_772562 ) ) ( not ( = ?auto_772555 ?auto_772563 ) ) ( not ( = ?auto_772555 ?auto_772564 ) ) ( not ( = ?auto_772555 ?auto_772565 ) ) ( not ( = ?auto_772555 ?auto_772566 ) ) ( not ( = ?auto_772555 ?auto_772567 ) ) ( not ( = ?auto_772555 ?auto_772568 ) ) ( not ( = ?auto_772555 ?auto_772569 ) ) ( not ( = ?auto_772555 ?auto_772570 ) ) ( not ( = ?auto_772555 ?auto_772571 ) ) ( not ( = ?auto_772556 ?auto_772557 ) ) ( not ( = ?auto_772556 ?auto_772558 ) ) ( not ( = ?auto_772556 ?auto_772559 ) ) ( not ( = ?auto_772556 ?auto_772560 ) ) ( not ( = ?auto_772556 ?auto_772561 ) ) ( not ( = ?auto_772556 ?auto_772562 ) ) ( not ( = ?auto_772556 ?auto_772563 ) ) ( not ( = ?auto_772556 ?auto_772564 ) ) ( not ( = ?auto_772556 ?auto_772565 ) ) ( not ( = ?auto_772556 ?auto_772566 ) ) ( not ( = ?auto_772556 ?auto_772567 ) ) ( not ( = ?auto_772556 ?auto_772568 ) ) ( not ( = ?auto_772556 ?auto_772569 ) ) ( not ( = ?auto_772556 ?auto_772570 ) ) ( not ( = ?auto_772556 ?auto_772571 ) ) ( not ( = ?auto_772557 ?auto_772558 ) ) ( not ( = ?auto_772557 ?auto_772559 ) ) ( not ( = ?auto_772557 ?auto_772560 ) ) ( not ( = ?auto_772557 ?auto_772561 ) ) ( not ( = ?auto_772557 ?auto_772562 ) ) ( not ( = ?auto_772557 ?auto_772563 ) ) ( not ( = ?auto_772557 ?auto_772564 ) ) ( not ( = ?auto_772557 ?auto_772565 ) ) ( not ( = ?auto_772557 ?auto_772566 ) ) ( not ( = ?auto_772557 ?auto_772567 ) ) ( not ( = ?auto_772557 ?auto_772568 ) ) ( not ( = ?auto_772557 ?auto_772569 ) ) ( not ( = ?auto_772557 ?auto_772570 ) ) ( not ( = ?auto_772557 ?auto_772571 ) ) ( not ( = ?auto_772558 ?auto_772559 ) ) ( not ( = ?auto_772558 ?auto_772560 ) ) ( not ( = ?auto_772558 ?auto_772561 ) ) ( not ( = ?auto_772558 ?auto_772562 ) ) ( not ( = ?auto_772558 ?auto_772563 ) ) ( not ( = ?auto_772558 ?auto_772564 ) ) ( not ( = ?auto_772558 ?auto_772565 ) ) ( not ( = ?auto_772558 ?auto_772566 ) ) ( not ( = ?auto_772558 ?auto_772567 ) ) ( not ( = ?auto_772558 ?auto_772568 ) ) ( not ( = ?auto_772558 ?auto_772569 ) ) ( not ( = ?auto_772558 ?auto_772570 ) ) ( not ( = ?auto_772558 ?auto_772571 ) ) ( not ( = ?auto_772559 ?auto_772560 ) ) ( not ( = ?auto_772559 ?auto_772561 ) ) ( not ( = ?auto_772559 ?auto_772562 ) ) ( not ( = ?auto_772559 ?auto_772563 ) ) ( not ( = ?auto_772559 ?auto_772564 ) ) ( not ( = ?auto_772559 ?auto_772565 ) ) ( not ( = ?auto_772559 ?auto_772566 ) ) ( not ( = ?auto_772559 ?auto_772567 ) ) ( not ( = ?auto_772559 ?auto_772568 ) ) ( not ( = ?auto_772559 ?auto_772569 ) ) ( not ( = ?auto_772559 ?auto_772570 ) ) ( not ( = ?auto_772559 ?auto_772571 ) ) ( not ( = ?auto_772560 ?auto_772561 ) ) ( not ( = ?auto_772560 ?auto_772562 ) ) ( not ( = ?auto_772560 ?auto_772563 ) ) ( not ( = ?auto_772560 ?auto_772564 ) ) ( not ( = ?auto_772560 ?auto_772565 ) ) ( not ( = ?auto_772560 ?auto_772566 ) ) ( not ( = ?auto_772560 ?auto_772567 ) ) ( not ( = ?auto_772560 ?auto_772568 ) ) ( not ( = ?auto_772560 ?auto_772569 ) ) ( not ( = ?auto_772560 ?auto_772570 ) ) ( not ( = ?auto_772560 ?auto_772571 ) ) ( not ( = ?auto_772561 ?auto_772562 ) ) ( not ( = ?auto_772561 ?auto_772563 ) ) ( not ( = ?auto_772561 ?auto_772564 ) ) ( not ( = ?auto_772561 ?auto_772565 ) ) ( not ( = ?auto_772561 ?auto_772566 ) ) ( not ( = ?auto_772561 ?auto_772567 ) ) ( not ( = ?auto_772561 ?auto_772568 ) ) ( not ( = ?auto_772561 ?auto_772569 ) ) ( not ( = ?auto_772561 ?auto_772570 ) ) ( not ( = ?auto_772561 ?auto_772571 ) ) ( not ( = ?auto_772562 ?auto_772563 ) ) ( not ( = ?auto_772562 ?auto_772564 ) ) ( not ( = ?auto_772562 ?auto_772565 ) ) ( not ( = ?auto_772562 ?auto_772566 ) ) ( not ( = ?auto_772562 ?auto_772567 ) ) ( not ( = ?auto_772562 ?auto_772568 ) ) ( not ( = ?auto_772562 ?auto_772569 ) ) ( not ( = ?auto_772562 ?auto_772570 ) ) ( not ( = ?auto_772562 ?auto_772571 ) ) ( not ( = ?auto_772563 ?auto_772564 ) ) ( not ( = ?auto_772563 ?auto_772565 ) ) ( not ( = ?auto_772563 ?auto_772566 ) ) ( not ( = ?auto_772563 ?auto_772567 ) ) ( not ( = ?auto_772563 ?auto_772568 ) ) ( not ( = ?auto_772563 ?auto_772569 ) ) ( not ( = ?auto_772563 ?auto_772570 ) ) ( not ( = ?auto_772563 ?auto_772571 ) ) ( not ( = ?auto_772564 ?auto_772565 ) ) ( not ( = ?auto_772564 ?auto_772566 ) ) ( not ( = ?auto_772564 ?auto_772567 ) ) ( not ( = ?auto_772564 ?auto_772568 ) ) ( not ( = ?auto_772564 ?auto_772569 ) ) ( not ( = ?auto_772564 ?auto_772570 ) ) ( not ( = ?auto_772564 ?auto_772571 ) ) ( not ( = ?auto_772565 ?auto_772566 ) ) ( not ( = ?auto_772565 ?auto_772567 ) ) ( not ( = ?auto_772565 ?auto_772568 ) ) ( not ( = ?auto_772565 ?auto_772569 ) ) ( not ( = ?auto_772565 ?auto_772570 ) ) ( not ( = ?auto_772565 ?auto_772571 ) ) ( not ( = ?auto_772566 ?auto_772567 ) ) ( not ( = ?auto_772566 ?auto_772568 ) ) ( not ( = ?auto_772566 ?auto_772569 ) ) ( not ( = ?auto_772566 ?auto_772570 ) ) ( not ( = ?auto_772566 ?auto_772571 ) ) ( not ( = ?auto_772567 ?auto_772568 ) ) ( not ( = ?auto_772567 ?auto_772569 ) ) ( not ( = ?auto_772567 ?auto_772570 ) ) ( not ( = ?auto_772567 ?auto_772571 ) ) ( not ( = ?auto_772568 ?auto_772569 ) ) ( not ( = ?auto_772568 ?auto_772570 ) ) ( not ( = ?auto_772568 ?auto_772571 ) ) ( not ( = ?auto_772569 ?auto_772570 ) ) ( not ( = ?auto_772569 ?auto_772571 ) ) ( not ( = ?auto_772570 ?auto_772571 ) ) ( ON ?auto_772569 ?auto_772570 ) ( ON ?auto_772568 ?auto_772569 ) ( CLEAR ?auto_772566 ) ( ON ?auto_772567 ?auto_772568 ) ( CLEAR ?auto_772567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_772554 ?auto_772555 ?auto_772556 ?auto_772557 ?auto_772558 ?auto_772559 ?auto_772560 ?auto_772561 ?auto_772562 ?auto_772563 ?auto_772564 ?auto_772565 ?auto_772566 ?auto_772567 )
      ( MAKE-17PILE ?auto_772554 ?auto_772555 ?auto_772556 ?auto_772557 ?auto_772558 ?auto_772559 ?auto_772560 ?auto_772561 ?auto_772562 ?auto_772563 ?auto_772564 ?auto_772565 ?auto_772566 ?auto_772567 ?auto_772568 ?auto_772569 ?auto_772570 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_772624 - BLOCK
      ?auto_772625 - BLOCK
      ?auto_772626 - BLOCK
      ?auto_772627 - BLOCK
      ?auto_772628 - BLOCK
      ?auto_772629 - BLOCK
      ?auto_772630 - BLOCK
      ?auto_772631 - BLOCK
      ?auto_772632 - BLOCK
      ?auto_772633 - BLOCK
      ?auto_772634 - BLOCK
      ?auto_772635 - BLOCK
      ?auto_772636 - BLOCK
      ?auto_772637 - BLOCK
      ?auto_772638 - BLOCK
      ?auto_772639 - BLOCK
      ?auto_772640 - BLOCK
    )
    :vars
    (
      ?auto_772641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772640 ?auto_772641 ) ( ON-TABLE ?auto_772624 ) ( ON ?auto_772625 ?auto_772624 ) ( ON ?auto_772626 ?auto_772625 ) ( ON ?auto_772627 ?auto_772626 ) ( ON ?auto_772628 ?auto_772627 ) ( ON ?auto_772629 ?auto_772628 ) ( ON ?auto_772630 ?auto_772629 ) ( ON ?auto_772631 ?auto_772630 ) ( ON ?auto_772632 ?auto_772631 ) ( ON ?auto_772633 ?auto_772632 ) ( ON ?auto_772634 ?auto_772633 ) ( ON ?auto_772635 ?auto_772634 ) ( not ( = ?auto_772624 ?auto_772625 ) ) ( not ( = ?auto_772624 ?auto_772626 ) ) ( not ( = ?auto_772624 ?auto_772627 ) ) ( not ( = ?auto_772624 ?auto_772628 ) ) ( not ( = ?auto_772624 ?auto_772629 ) ) ( not ( = ?auto_772624 ?auto_772630 ) ) ( not ( = ?auto_772624 ?auto_772631 ) ) ( not ( = ?auto_772624 ?auto_772632 ) ) ( not ( = ?auto_772624 ?auto_772633 ) ) ( not ( = ?auto_772624 ?auto_772634 ) ) ( not ( = ?auto_772624 ?auto_772635 ) ) ( not ( = ?auto_772624 ?auto_772636 ) ) ( not ( = ?auto_772624 ?auto_772637 ) ) ( not ( = ?auto_772624 ?auto_772638 ) ) ( not ( = ?auto_772624 ?auto_772639 ) ) ( not ( = ?auto_772624 ?auto_772640 ) ) ( not ( = ?auto_772624 ?auto_772641 ) ) ( not ( = ?auto_772625 ?auto_772626 ) ) ( not ( = ?auto_772625 ?auto_772627 ) ) ( not ( = ?auto_772625 ?auto_772628 ) ) ( not ( = ?auto_772625 ?auto_772629 ) ) ( not ( = ?auto_772625 ?auto_772630 ) ) ( not ( = ?auto_772625 ?auto_772631 ) ) ( not ( = ?auto_772625 ?auto_772632 ) ) ( not ( = ?auto_772625 ?auto_772633 ) ) ( not ( = ?auto_772625 ?auto_772634 ) ) ( not ( = ?auto_772625 ?auto_772635 ) ) ( not ( = ?auto_772625 ?auto_772636 ) ) ( not ( = ?auto_772625 ?auto_772637 ) ) ( not ( = ?auto_772625 ?auto_772638 ) ) ( not ( = ?auto_772625 ?auto_772639 ) ) ( not ( = ?auto_772625 ?auto_772640 ) ) ( not ( = ?auto_772625 ?auto_772641 ) ) ( not ( = ?auto_772626 ?auto_772627 ) ) ( not ( = ?auto_772626 ?auto_772628 ) ) ( not ( = ?auto_772626 ?auto_772629 ) ) ( not ( = ?auto_772626 ?auto_772630 ) ) ( not ( = ?auto_772626 ?auto_772631 ) ) ( not ( = ?auto_772626 ?auto_772632 ) ) ( not ( = ?auto_772626 ?auto_772633 ) ) ( not ( = ?auto_772626 ?auto_772634 ) ) ( not ( = ?auto_772626 ?auto_772635 ) ) ( not ( = ?auto_772626 ?auto_772636 ) ) ( not ( = ?auto_772626 ?auto_772637 ) ) ( not ( = ?auto_772626 ?auto_772638 ) ) ( not ( = ?auto_772626 ?auto_772639 ) ) ( not ( = ?auto_772626 ?auto_772640 ) ) ( not ( = ?auto_772626 ?auto_772641 ) ) ( not ( = ?auto_772627 ?auto_772628 ) ) ( not ( = ?auto_772627 ?auto_772629 ) ) ( not ( = ?auto_772627 ?auto_772630 ) ) ( not ( = ?auto_772627 ?auto_772631 ) ) ( not ( = ?auto_772627 ?auto_772632 ) ) ( not ( = ?auto_772627 ?auto_772633 ) ) ( not ( = ?auto_772627 ?auto_772634 ) ) ( not ( = ?auto_772627 ?auto_772635 ) ) ( not ( = ?auto_772627 ?auto_772636 ) ) ( not ( = ?auto_772627 ?auto_772637 ) ) ( not ( = ?auto_772627 ?auto_772638 ) ) ( not ( = ?auto_772627 ?auto_772639 ) ) ( not ( = ?auto_772627 ?auto_772640 ) ) ( not ( = ?auto_772627 ?auto_772641 ) ) ( not ( = ?auto_772628 ?auto_772629 ) ) ( not ( = ?auto_772628 ?auto_772630 ) ) ( not ( = ?auto_772628 ?auto_772631 ) ) ( not ( = ?auto_772628 ?auto_772632 ) ) ( not ( = ?auto_772628 ?auto_772633 ) ) ( not ( = ?auto_772628 ?auto_772634 ) ) ( not ( = ?auto_772628 ?auto_772635 ) ) ( not ( = ?auto_772628 ?auto_772636 ) ) ( not ( = ?auto_772628 ?auto_772637 ) ) ( not ( = ?auto_772628 ?auto_772638 ) ) ( not ( = ?auto_772628 ?auto_772639 ) ) ( not ( = ?auto_772628 ?auto_772640 ) ) ( not ( = ?auto_772628 ?auto_772641 ) ) ( not ( = ?auto_772629 ?auto_772630 ) ) ( not ( = ?auto_772629 ?auto_772631 ) ) ( not ( = ?auto_772629 ?auto_772632 ) ) ( not ( = ?auto_772629 ?auto_772633 ) ) ( not ( = ?auto_772629 ?auto_772634 ) ) ( not ( = ?auto_772629 ?auto_772635 ) ) ( not ( = ?auto_772629 ?auto_772636 ) ) ( not ( = ?auto_772629 ?auto_772637 ) ) ( not ( = ?auto_772629 ?auto_772638 ) ) ( not ( = ?auto_772629 ?auto_772639 ) ) ( not ( = ?auto_772629 ?auto_772640 ) ) ( not ( = ?auto_772629 ?auto_772641 ) ) ( not ( = ?auto_772630 ?auto_772631 ) ) ( not ( = ?auto_772630 ?auto_772632 ) ) ( not ( = ?auto_772630 ?auto_772633 ) ) ( not ( = ?auto_772630 ?auto_772634 ) ) ( not ( = ?auto_772630 ?auto_772635 ) ) ( not ( = ?auto_772630 ?auto_772636 ) ) ( not ( = ?auto_772630 ?auto_772637 ) ) ( not ( = ?auto_772630 ?auto_772638 ) ) ( not ( = ?auto_772630 ?auto_772639 ) ) ( not ( = ?auto_772630 ?auto_772640 ) ) ( not ( = ?auto_772630 ?auto_772641 ) ) ( not ( = ?auto_772631 ?auto_772632 ) ) ( not ( = ?auto_772631 ?auto_772633 ) ) ( not ( = ?auto_772631 ?auto_772634 ) ) ( not ( = ?auto_772631 ?auto_772635 ) ) ( not ( = ?auto_772631 ?auto_772636 ) ) ( not ( = ?auto_772631 ?auto_772637 ) ) ( not ( = ?auto_772631 ?auto_772638 ) ) ( not ( = ?auto_772631 ?auto_772639 ) ) ( not ( = ?auto_772631 ?auto_772640 ) ) ( not ( = ?auto_772631 ?auto_772641 ) ) ( not ( = ?auto_772632 ?auto_772633 ) ) ( not ( = ?auto_772632 ?auto_772634 ) ) ( not ( = ?auto_772632 ?auto_772635 ) ) ( not ( = ?auto_772632 ?auto_772636 ) ) ( not ( = ?auto_772632 ?auto_772637 ) ) ( not ( = ?auto_772632 ?auto_772638 ) ) ( not ( = ?auto_772632 ?auto_772639 ) ) ( not ( = ?auto_772632 ?auto_772640 ) ) ( not ( = ?auto_772632 ?auto_772641 ) ) ( not ( = ?auto_772633 ?auto_772634 ) ) ( not ( = ?auto_772633 ?auto_772635 ) ) ( not ( = ?auto_772633 ?auto_772636 ) ) ( not ( = ?auto_772633 ?auto_772637 ) ) ( not ( = ?auto_772633 ?auto_772638 ) ) ( not ( = ?auto_772633 ?auto_772639 ) ) ( not ( = ?auto_772633 ?auto_772640 ) ) ( not ( = ?auto_772633 ?auto_772641 ) ) ( not ( = ?auto_772634 ?auto_772635 ) ) ( not ( = ?auto_772634 ?auto_772636 ) ) ( not ( = ?auto_772634 ?auto_772637 ) ) ( not ( = ?auto_772634 ?auto_772638 ) ) ( not ( = ?auto_772634 ?auto_772639 ) ) ( not ( = ?auto_772634 ?auto_772640 ) ) ( not ( = ?auto_772634 ?auto_772641 ) ) ( not ( = ?auto_772635 ?auto_772636 ) ) ( not ( = ?auto_772635 ?auto_772637 ) ) ( not ( = ?auto_772635 ?auto_772638 ) ) ( not ( = ?auto_772635 ?auto_772639 ) ) ( not ( = ?auto_772635 ?auto_772640 ) ) ( not ( = ?auto_772635 ?auto_772641 ) ) ( not ( = ?auto_772636 ?auto_772637 ) ) ( not ( = ?auto_772636 ?auto_772638 ) ) ( not ( = ?auto_772636 ?auto_772639 ) ) ( not ( = ?auto_772636 ?auto_772640 ) ) ( not ( = ?auto_772636 ?auto_772641 ) ) ( not ( = ?auto_772637 ?auto_772638 ) ) ( not ( = ?auto_772637 ?auto_772639 ) ) ( not ( = ?auto_772637 ?auto_772640 ) ) ( not ( = ?auto_772637 ?auto_772641 ) ) ( not ( = ?auto_772638 ?auto_772639 ) ) ( not ( = ?auto_772638 ?auto_772640 ) ) ( not ( = ?auto_772638 ?auto_772641 ) ) ( not ( = ?auto_772639 ?auto_772640 ) ) ( not ( = ?auto_772639 ?auto_772641 ) ) ( not ( = ?auto_772640 ?auto_772641 ) ) ( ON ?auto_772639 ?auto_772640 ) ( ON ?auto_772638 ?auto_772639 ) ( ON ?auto_772637 ?auto_772638 ) ( CLEAR ?auto_772635 ) ( ON ?auto_772636 ?auto_772637 ) ( CLEAR ?auto_772636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_772624 ?auto_772625 ?auto_772626 ?auto_772627 ?auto_772628 ?auto_772629 ?auto_772630 ?auto_772631 ?auto_772632 ?auto_772633 ?auto_772634 ?auto_772635 ?auto_772636 )
      ( MAKE-17PILE ?auto_772624 ?auto_772625 ?auto_772626 ?auto_772627 ?auto_772628 ?auto_772629 ?auto_772630 ?auto_772631 ?auto_772632 ?auto_772633 ?auto_772634 ?auto_772635 ?auto_772636 ?auto_772637 ?auto_772638 ?auto_772639 ?auto_772640 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_772694 - BLOCK
      ?auto_772695 - BLOCK
      ?auto_772696 - BLOCK
      ?auto_772697 - BLOCK
      ?auto_772698 - BLOCK
      ?auto_772699 - BLOCK
      ?auto_772700 - BLOCK
      ?auto_772701 - BLOCK
      ?auto_772702 - BLOCK
      ?auto_772703 - BLOCK
      ?auto_772704 - BLOCK
      ?auto_772705 - BLOCK
      ?auto_772706 - BLOCK
      ?auto_772707 - BLOCK
      ?auto_772708 - BLOCK
      ?auto_772709 - BLOCK
      ?auto_772710 - BLOCK
    )
    :vars
    (
      ?auto_772711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772710 ?auto_772711 ) ( ON-TABLE ?auto_772694 ) ( ON ?auto_772695 ?auto_772694 ) ( ON ?auto_772696 ?auto_772695 ) ( ON ?auto_772697 ?auto_772696 ) ( ON ?auto_772698 ?auto_772697 ) ( ON ?auto_772699 ?auto_772698 ) ( ON ?auto_772700 ?auto_772699 ) ( ON ?auto_772701 ?auto_772700 ) ( ON ?auto_772702 ?auto_772701 ) ( ON ?auto_772703 ?auto_772702 ) ( ON ?auto_772704 ?auto_772703 ) ( not ( = ?auto_772694 ?auto_772695 ) ) ( not ( = ?auto_772694 ?auto_772696 ) ) ( not ( = ?auto_772694 ?auto_772697 ) ) ( not ( = ?auto_772694 ?auto_772698 ) ) ( not ( = ?auto_772694 ?auto_772699 ) ) ( not ( = ?auto_772694 ?auto_772700 ) ) ( not ( = ?auto_772694 ?auto_772701 ) ) ( not ( = ?auto_772694 ?auto_772702 ) ) ( not ( = ?auto_772694 ?auto_772703 ) ) ( not ( = ?auto_772694 ?auto_772704 ) ) ( not ( = ?auto_772694 ?auto_772705 ) ) ( not ( = ?auto_772694 ?auto_772706 ) ) ( not ( = ?auto_772694 ?auto_772707 ) ) ( not ( = ?auto_772694 ?auto_772708 ) ) ( not ( = ?auto_772694 ?auto_772709 ) ) ( not ( = ?auto_772694 ?auto_772710 ) ) ( not ( = ?auto_772694 ?auto_772711 ) ) ( not ( = ?auto_772695 ?auto_772696 ) ) ( not ( = ?auto_772695 ?auto_772697 ) ) ( not ( = ?auto_772695 ?auto_772698 ) ) ( not ( = ?auto_772695 ?auto_772699 ) ) ( not ( = ?auto_772695 ?auto_772700 ) ) ( not ( = ?auto_772695 ?auto_772701 ) ) ( not ( = ?auto_772695 ?auto_772702 ) ) ( not ( = ?auto_772695 ?auto_772703 ) ) ( not ( = ?auto_772695 ?auto_772704 ) ) ( not ( = ?auto_772695 ?auto_772705 ) ) ( not ( = ?auto_772695 ?auto_772706 ) ) ( not ( = ?auto_772695 ?auto_772707 ) ) ( not ( = ?auto_772695 ?auto_772708 ) ) ( not ( = ?auto_772695 ?auto_772709 ) ) ( not ( = ?auto_772695 ?auto_772710 ) ) ( not ( = ?auto_772695 ?auto_772711 ) ) ( not ( = ?auto_772696 ?auto_772697 ) ) ( not ( = ?auto_772696 ?auto_772698 ) ) ( not ( = ?auto_772696 ?auto_772699 ) ) ( not ( = ?auto_772696 ?auto_772700 ) ) ( not ( = ?auto_772696 ?auto_772701 ) ) ( not ( = ?auto_772696 ?auto_772702 ) ) ( not ( = ?auto_772696 ?auto_772703 ) ) ( not ( = ?auto_772696 ?auto_772704 ) ) ( not ( = ?auto_772696 ?auto_772705 ) ) ( not ( = ?auto_772696 ?auto_772706 ) ) ( not ( = ?auto_772696 ?auto_772707 ) ) ( not ( = ?auto_772696 ?auto_772708 ) ) ( not ( = ?auto_772696 ?auto_772709 ) ) ( not ( = ?auto_772696 ?auto_772710 ) ) ( not ( = ?auto_772696 ?auto_772711 ) ) ( not ( = ?auto_772697 ?auto_772698 ) ) ( not ( = ?auto_772697 ?auto_772699 ) ) ( not ( = ?auto_772697 ?auto_772700 ) ) ( not ( = ?auto_772697 ?auto_772701 ) ) ( not ( = ?auto_772697 ?auto_772702 ) ) ( not ( = ?auto_772697 ?auto_772703 ) ) ( not ( = ?auto_772697 ?auto_772704 ) ) ( not ( = ?auto_772697 ?auto_772705 ) ) ( not ( = ?auto_772697 ?auto_772706 ) ) ( not ( = ?auto_772697 ?auto_772707 ) ) ( not ( = ?auto_772697 ?auto_772708 ) ) ( not ( = ?auto_772697 ?auto_772709 ) ) ( not ( = ?auto_772697 ?auto_772710 ) ) ( not ( = ?auto_772697 ?auto_772711 ) ) ( not ( = ?auto_772698 ?auto_772699 ) ) ( not ( = ?auto_772698 ?auto_772700 ) ) ( not ( = ?auto_772698 ?auto_772701 ) ) ( not ( = ?auto_772698 ?auto_772702 ) ) ( not ( = ?auto_772698 ?auto_772703 ) ) ( not ( = ?auto_772698 ?auto_772704 ) ) ( not ( = ?auto_772698 ?auto_772705 ) ) ( not ( = ?auto_772698 ?auto_772706 ) ) ( not ( = ?auto_772698 ?auto_772707 ) ) ( not ( = ?auto_772698 ?auto_772708 ) ) ( not ( = ?auto_772698 ?auto_772709 ) ) ( not ( = ?auto_772698 ?auto_772710 ) ) ( not ( = ?auto_772698 ?auto_772711 ) ) ( not ( = ?auto_772699 ?auto_772700 ) ) ( not ( = ?auto_772699 ?auto_772701 ) ) ( not ( = ?auto_772699 ?auto_772702 ) ) ( not ( = ?auto_772699 ?auto_772703 ) ) ( not ( = ?auto_772699 ?auto_772704 ) ) ( not ( = ?auto_772699 ?auto_772705 ) ) ( not ( = ?auto_772699 ?auto_772706 ) ) ( not ( = ?auto_772699 ?auto_772707 ) ) ( not ( = ?auto_772699 ?auto_772708 ) ) ( not ( = ?auto_772699 ?auto_772709 ) ) ( not ( = ?auto_772699 ?auto_772710 ) ) ( not ( = ?auto_772699 ?auto_772711 ) ) ( not ( = ?auto_772700 ?auto_772701 ) ) ( not ( = ?auto_772700 ?auto_772702 ) ) ( not ( = ?auto_772700 ?auto_772703 ) ) ( not ( = ?auto_772700 ?auto_772704 ) ) ( not ( = ?auto_772700 ?auto_772705 ) ) ( not ( = ?auto_772700 ?auto_772706 ) ) ( not ( = ?auto_772700 ?auto_772707 ) ) ( not ( = ?auto_772700 ?auto_772708 ) ) ( not ( = ?auto_772700 ?auto_772709 ) ) ( not ( = ?auto_772700 ?auto_772710 ) ) ( not ( = ?auto_772700 ?auto_772711 ) ) ( not ( = ?auto_772701 ?auto_772702 ) ) ( not ( = ?auto_772701 ?auto_772703 ) ) ( not ( = ?auto_772701 ?auto_772704 ) ) ( not ( = ?auto_772701 ?auto_772705 ) ) ( not ( = ?auto_772701 ?auto_772706 ) ) ( not ( = ?auto_772701 ?auto_772707 ) ) ( not ( = ?auto_772701 ?auto_772708 ) ) ( not ( = ?auto_772701 ?auto_772709 ) ) ( not ( = ?auto_772701 ?auto_772710 ) ) ( not ( = ?auto_772701 ?auto_772711 ) ) ( not ( = ?auto_772702 ?auto_772703 ) ) ( not ( = ?auto_772702 ?auto_772704 ) ) ( not ( = ?auto_772702 ?auto_772705 ) ) ( not ( = ?auto_772702 ?auto_772706 ) ) ( not ( = ?auto_772702 ?auto_772707 ) ) ( not ( = ?auto_772702 ?auto_772708 ) ) ( not ( = ?auto_772702 ?auto_772709 ) ) ( not ( = ?auto_772702 ?auto_772710 ) ) ( not ( = ?auto_772702 ?auto_772711 ) ) ( not ( = ?auto_772703 ?auto_772704 ) ) ( not ( = ?auto_772703 ?auto_772705 ) ) ( not ( = ?auto_772703 ?auto_772706 ) ) ( not ( = ?auto_772703 ?auto_772707 ) ) ( not ( = ?auto_772703 ?auto_772708 ) ) ( not ( = ?auto_772703 ?auto_772709 ) ) ( not ( = ?auto_772703 ?auto_772710 ) ) ( not ( = ?auto_772703 ?auto_772711 ) ) ( not ( = ?auto_772704 ?auto_772705 ) ) ( not ( = ?auto_772704 ?auto_772706 ) ) ( not ( = ?auto_772704 ?auto_772707 ) ) ( not ( = ?auto_772704 ?auto_772708 ) ) ( not ( = ?auto_772704 ?auto_772709 ) ) ( not ( = ?auto_772704 ?auto_772710 ) ) ( not ( = ?auto_772704 ?auto_772711 ) ) ( not ( = ?auto_772705 ?auto_772706 ) ) ( not ( = ?auto_772705 ?auto_772707 ) ) ( not ( = ?auto_772705 ?auto_772708 ) ) ( not ( = ?auto_772705 ?auto_772709 ) ) ( not ( = ?auto_772705 ?auto_772710 ) ) ( not ( = ?auto_772705 ?auto_772711 ) ) ( not ( = ?auto_772706 ?auto_772707 ) ) ( not ( = ?auto_772706 ?auto_772708 ) ) ( not ( = ?auto_772706 ?auto_772709 ) ) ( not ( = ?auto_772706 ?auto_772710 ) ) ( not ( = ?auto_772706 ?auto_772711 ) ) ( not ( = ?auto_772707 ?auto_772708 ) ) ( not ( = ?auto_772707 ?auto_772709 ) ) ( not ( = ?auto_772707 ?auto_772710 ) ) ( not ( = ?auto_772707 ?auto_772711 ) ) ( not ( = ?auto_772708 ?auto_772709 ) ) ( not ( = ?auto_772708 ?auto_772710 ) ) ( not ( = ?auto_772708 ?auto_772711 ) ) ( not ( = ?auto_772709 ?auto_772710 ) ) ( not ( = ?auto_772709 ?auto_772711 ) ) ( not ( = ?auto_772710 ?auto_772711 ) ) ( ON ?auto_772709 ?auto_772710 ) ( ON ?auto_772708 ?auto_772709 ) ( ON ?auto_772707 ?auto_772708 ) ( ON ?auto_772706 ?auto_772707 ) ( CLEAR ?auto_772704 ) ( ON ?auto_772705 ?auto_772706 ) ( CLEAR ?auto_772705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_772694 ?auto_772695 ?auto_772696 ?auto_772697 ?auto_772698 ?auto_772699 ?auto_772700 ?auto_772701 ?auto_772702 ?auto_772703 ?auto_772704 ?auto_772705 )
      ( MAKE-17PILE ?auto_772694 ?auto_772695 ?auto_772696 ?auto_772697 ?auto_772698 ?auto_772699 ?auto_772700 ?auto_772701 ?auto_772702 ?auto_772703 ?auto_772704 ?auto_772705 ?auto_772706 ?auto_772707 ?auto_772708 ?auto_772709 ?auto_772710 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_772764 - BLOCK
      ?auto_772765 - BLOCK
      ?auto_772766 - BLOCK
      ?auto_772767 - BLOCK
      ?auto_772768 - BLOCK
      ?auto_772769 - BLOCK
      ?auto_772770 - BLOCK
      ?auto_772771 - BLOCK
      ?auto_772772 - BLOCK
      ?auto_772773 - BLOCK
      ?auto_772774 - BLOCK
      ?auto_772775 - BLOCK
      ?auto_772776 - BLOCK
      ?auto_772777 - BLOCK
      ?auto_772778 - BLOCK
      ?auto_772779 - BLOCK
      ?auto_772780 - BLOCK
    )
    :vars
    (
      ?auto_772781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772780 ?auto_772781 ) ( ON-TABLE ?auto_772764 ) ( ON ?auto_772765 ?auto_772764 ) ( ON ?auto_772766 ?auto_772765 ) ( ON ?auto_772767 ?auto_772766 ) ( ON ?auto_772768 ?auto_772767 ) ( ON ?auto_772769 ?auto_772768 ) ( ON ?auto_772770 ?auto_772769 ) ( ON ?auto_772771 ?auto_772770 ) ( ON ?auto_772772 ?auto_772771 ) ( ON ?auto_772773 ?auto_772772 ) ( not ( = ?auto_772764 ?auto_772765 ) ) ( not ( = ?auto_772764 ?auto_772766 ) ) ( not ( = ?auto_772764 ?auto_772767 ) ) ( not ( = ?auto_772764 ?auto_772768 ) ) ( not ( = ?auto_772764 ?auto_772769 ) ) ( not ( = ?auto_772764 ?auto_772770 ) ) ( not ( = ?auto_772764 ?auto_772771 ) ) ( not ( = ?auto_772764 ?auto_772772 ) ) ( not ( = ?auto_772764 ?auto_772773 ) ) ( not ( = ?auto_772764 ?auto_772774 ) ) ( not ( = ?auto_772764 ?auto_772775 ) ) ( not ( = ?auto_772764 ?auto_772776 ) ) ( not ( = ?auto_772764 ?auto_772777 ) ) ( not ( = ?auto_772764 ?auto_772778 ) ) ( not ( = ?auto_772764 ?auto_772779 ) ) ( not ( = ?auto_772764 ?auto_772780 ) ) ( not ( = ?auto_772764 ?auto_772781 ) ) ( not ( = ?auto_772765 ?auto_772766 ) ) ( not ( = ?auto_772765 ?auto_772767 ) ) ( not ( = ?auto_772765 ?auto_772768 ) ) ( not ( = ?auto_772765 ?auto_772769 ) ) ( not ( = ?auto_772765 ?auto_772770 ) ) ( not ( = ?auto_772765 ?auto_772771 ) ) ( not ( = ?auto_772765 ?auto_772772 ) ) ( not ( = ?auto_772765 ?auto_772773 ) ) ( not ( = ?auto_772765 ?auto_772774 ) ) ( not ( = ?auto_772765 ?auto_772775 ) ) ( not ( = ?auto_772765 ?auto_772776 ) ) ( not ( = ?auto_772765 ?auto_772777 ) ) ( not ( = ?auto_772765 ?auto_772778 ) ) ( not ( = ?auto_772765 ?auto_772779 ) ) ( not ( = ?auto_772765 ?auto_772780 ) ) ( not ( = ?auto_772765 ?auto_772781 ) ) ( not ( = ?auto_772766 ?auto_772767 ) ) ( not ( = ?auto_772766 ?auto_772768 ) ) ( not ( = ?auto_772766 ?auto_772769 ) ) ( not ( = ?auto_772766 ?auto_772770 ) ) ( not ( = ?auto_772766 ?auto_772771 ) ) ( not ( = ?auto_772766 ?auto_772772 ) ) ( not ( = ?auto_772766 ?auto_772773 ) ) ( not ( = ?auto_772766 ?auto_772774 ) ) ( not ( = ?auto_772766 ?auto_772775 ) ) ( not ( = ?auto_772766 ?auto_772776 ) ) ( not ( = ?auto_772766 ?auto_772777 ) ) ( not ( = ?auto_772766 ?auto_772778 ) ) ( not ( = ?auto_772766 ?auto_772779 ) ) ( not ( = ?auto_772766 ?auto_772780 ) ) ( not ( = ?auto_772766 ?auto_772781 ) ) ( not ( = ?auto_772767 ?auto_772768 ) ) ( not ( = ?auto_772767 ?auto_772769 ) ) ( not ( = ?auto_772767 ?auto_772770 ) ) ( not ( = ?auto_772767 ?auto_772771 ) ) ( not ( = ?auto_772767 ?auto_772772 ) ) ( not ( = ?auto_772767 ?auto_772773 ) ) ( not ( = ?auto_772767 ?auto_772774 ) ) ( not ( = ?auto_772767 ?auto_772775 ) ) ( not ( = ?auto_772767 ?auto_772776 ) ) ( not ( = ?auto_772767 ?auto_772777 ) ) ( not ( = ?auto_772767 ?auto_772778 ) ) ( not ( = ?auto_772767 ?auto_772779 ) ) ( not ( = ?auto_772767 ?auto_772780 ) ) ( not ( = ?auto_772767 ?auto_772781 ) ) ( not ( = ?auto_772768 ?auto_772769 ) ) ( not ( = ?auto_772768 ?auto_772770 ) ) ( not ( = ?auto_772768 ?auto_772771 ) ) ( not ( = ?auto_772768 ?auto_772772 ) ) ( not ( = ?auto_772768 ?auto_772773 ) ) ( not ( = ?auto_772768 ?auto_772774 ) ) ( not ( = ?auto_772768 ?auto_772775 ) ) ( not ( = ?auto_772768 ?auto_772776 ) ) ( not ( = ?auto_772768 ?auto_772777 ) ) ( not ( = ?auto_772768 ?auto_772778 ) ) ( not ( = ?auto_772768 ?auto_772779 ) ) ( not ( = ?auto_772768 ?auto_772780 ) ) ( not ( = ?auto_772768 ?auto_772781 ) ) ( not ( = ?auto_772769 ?auto_772770 ) ) ( not ( = ?auto_772769 ?auto_772771 ) ) ( not ( = ?auto_772769 ?auto_772772 ) ) ( not ( = ?auto_772769 ?auto_772773 ) ) ( not ( = ?auto_772769 ?auto_772774 ) ) ( not ( = ?auto_772769 ?auto_772775 ) ) ( not ( = ?auto_772769 ?auto_772776 ) ) ( not ( = ?auto_772769 ?auto_772777 ) ) ( not ( = ?auto_772769 ?auto_772778 ) ) ( not ( = ?auto_772769 ?auto_772779 ) ) ( not ( = ?auto_772769 ?auto_772780 ) ) ( not ( = ?auto_772769 ?auto_772781 ) ) ( not ( = ?auto_772770 ?auto_772771 ) ) ( not ( = ?auto_772770 ?auto_772772 ) ) ( not ( = ?auto_772770 ?auto_772773 ) ) ( not ( = ?auto_772770 ?auto_772774 ) ) ( not ( = ?auto_772770 ?auto_772775 ) ) ( not ( = ?auto_772770 ?auto_772776 ) ) ( not ( = ?auto_772770 ?auto_772777 ) ) ( not ( = ?auto_772770 ?auto_772778 ) ) ( not ( = ?auto_772770 ?auto_772779 ) ) ( not ( = ?auto_772770 ?auto_772780 ) ) ( not ( = ?auto_772770 ?auto_772781 ) ) ( not ( = ?auto_772771 ?auto_772772 ) ) ( not ( = ?auto_772771 ?auto_772773 ) ) ( not ( = ?auto_772771 ?auto_772774 ) ) ( not ( = ?auto_772771 ?auto_772775 ) ) ( not ( = ?auto_772771 ?auto_772776 ) ) ( not ( = ?auto_772771 ?auto_772777 ) ) ( not ( = ?auto_772771 ?auto_772778 ) ) ( not ( = ?auto_772771 ?auto_772779 ) ) ( not ( = ?auto_772771 ?auto_772780 ) ) ( not ( = ?auto_772771 ?auto_772781 ) ) ( not ( = ?auto_772772 ?auto_772773 ) ) ( not ( = ?auto_772772 ?auto_772774 ) ) ( not ( = ?auto_772772 ?auto_772775 ) ) ( not ( = ?auto_772772 ?auto_772776 ) ) ( not ( = ?auto_772772 ?auto_772777 ) ) ( not ( = ?auto_772772 ?auto_772778 ) ) ( not ( = ?auto_772772 ?auto_772779 ) ) ( not ( = ?auto_772772 ?auto_772780 ) ) ( not ( = ?auto_772772 ?auto_772781 ) ) ( not ( = ?auto_772773 ?auto_772774 ) ) ( not ( = ?auto_772773 ?auto_772775 ) ) ( not ( = ?auto_772773 ?auto_772776 ) ) ( not ( = ?auto_772773 ?auto_772777 ) ) ( not ( = ?auto_772773 ?auto_772778 ) ) ( not ( = ?auto_772773 ?auto_772779 ) ) ( not ( = ?auto_772773 ?auto_772780 ) ) ( not ( = ?auto_772773 ?auto_772781 ) ) ( not ( = ?auto_772774 ?auto_772775 ) ) ( not ( = ?auto_772774 ?auto_772776 ) ) ( not ( = ?auto_772774 ?auto_772777 ) ) ( not ( = ?auto_772774 ?auto_772778 ) ) ( not ( = ?auto_772774 ?auto_772779 ) ) ( not ( = ?auto_772774 ?auto_772780 ) ) ( not ( = ?auto_772774 ?auto_772781 ) ) ( not ( = ?auto_772775 ?auto_772776 ) ) ( not ( = ?auto_772775 ?auto_772777 ) ) ( not ( = ?auto_772775 ?auto_772778 ) ) ( not ( = ?auto_772775 ?auto_772779 ) ) ( not ( = ?auto_772775 ?auto_772780 ) ) ( not ( = ?auto_772775 ?auto_772781 ) ) ( not ( = ?auto_772776 ?auto_772777 ) ) ( not ( = ?auto_772776 ?auto_772778 ) ) ( not ( = ?auto_772776 ?auto_772779 ) ) ( not ( = ?auto_772776 ?auto_772780 ) ) ( not ( = ?auto_772776 ?auto_772781 ) ) ( not ( = ?auto_772777 ?auto_772778 ) ) ( not ( = ?auto_772777 ?auto_772779 ) ) ( not ( = ?auto_772777 ?auto_772780 ) ) ( not ( = ?auto_772777 ?auto_772781 ) ) ( not ( = ?auto_772778 ?auto_772779 ) ) ( not ( = ?auto_772778 ?auto_772780 ) ) ( not ( = ?auto_772778 ?auto_772781 ) ) ( not ( = ?auto_772779 ?auto_772780 ) ) ( not ( = ?auto_772779 ?auto_772781 ) ) ( not ( = ?auto_772780 ?auto_772781 ) ) ( ON ?auto_772779 ?auto_772780 ) ( ON ?auto_772778 ?auto_772779 ) ( ON ?auto_772777 ?auto_772778 ) ( ON ?auto_772776 ?auto_772777 ) ( ON ?auto_772775 ?auto_772776 ) ( CLEAR ?auto_772773 ) ( ON ?auto_772774 ?auto_772775 ) ( CLEAR ?auto_772774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_772764 ?auto_772765 ?auto_772766 ?auto_772767 ?auto_772768 ?auto_772769 ?auto_772770 ?auto_772771 ?auto_772772 ?auto_772773 ?auto_772774 )
      ( MAKE-17PILE ?auto_772764 ?auto_772765 ?auto_772766 ?auto_772767 ?auto_772768 ?auto_772769 ?auto_772770 ?auto_772771 ?auto_772772 ?auto_772773 ?auto_772774 ?auto_772775 ?auto_772776 ?auto_772777 ?auto_772778 ?auto_772779 ?auto_772780 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_772834 - BLOCK
      ?auto_772835 - BLOCK
      ?auto_772836 - BLOCK
      ?auto_772837 - BLOCK
      ?auto_772838 - BLOCK
      ?auto_772839 - BLOCK
      ?auto_772840 - BLOCK
      ?auto_772841 - BLOCK
      ?auto_772842 - BLOCK
      ?auto_772843 - BLOCK
      ?auto_772844 - BLOCK
      ?auto_772845 - BLOCK
      ?auto_772846 - BLOCK
      ?auto_772847 - BLOCK
      ?auto_772848 - BLOCK
      ?auto_772849 - BLOCK
      ?auto_772850 - BLOCK
    )
    :vars
    (
      ?auto_772851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772850 ?auto_772851 ) ( ON-TABLE ?auto_772834 ) ( ON ?auto_772835 ?auto_772834 ) ( ON ?auto_772836 ?auto_772835 ) ( ON ?auto_772837 ?auto_772836 ) ( ON ?auto_772838 ?auto_772837 ) ( ON ?auto_772839 ?auto_772838 ) ( ON ?auto_772840 ?auto_772839 ) ( ON ?auto_772841 ?auto_772840 ) ( ON ?auto_772842 ?auto_772841 ) ( not ( = ?auto_772834 ?auto_772835 ) ) ( not ( = ?auto_772834 ?auto_772836 ) ) ( not ( = ?auto_772834 ?auto_772837 ) ) ( not ( = ?auto_772834 ?auto_772838 ) ) ( not ( = ?auto_772834 ?auto_772839 ) ) ( not ( = ?auto_772834 ?auto_772840 ) ) ( not ( = ?auto_772834 ?auto_772841 ) ) ( not ( = ?auto_772834 ?auto_772842 ) ) ( not ( = ?auto_772834 ?auto_772843 ) ) ( not ( = ?auto_772834 ?auto_772844 ) ) ( not ( = ?auto_772834 ?auto_772845 ) ) ( not ( = ?auto_772834 ?auto_772846 ) ) ( not ( = ?auto_772834 ?auto_772847 ) ) ( not ( = ?auto_772834 ?auto_772848 ) ) ( not ( = ?auto_772834 ?auto_772849 ) ) ( not ( = ?auto_772834 ?auto_772850 ) ) ( not ( = ?auto_772834 ?auto_772851 ) ) ( not ( = ?auto_772835 ?auto_772836 ) ) ( not ( = ?auto_772835 ?auto_772837 ) ) ( not ( = ?auto_772835 ?auto_772838 ) ) ( not ( = ?auto_772835 ?auto_772839 ) ) ( not ( = ?auto_772835 ?auto_772840 ) ) ( not ( = ?auto_772835 ?auto_772841 ) ) ( not ( = ?auto_772835 ?auto_772842 ) ) ( not ( = ?auto_772835 ?auto_772843 ) ) ( not ( = ?auto_772835 ?auto_772844 ) ) ( not ( = ?auto_772835 ?auto_772845 ) ) ( not ( = ?auto_772835 ?auto_772846 ) ) ( not ( = ?auto_772835 ?auto_772847 ) ) ( not ( = ?auto_772835 ?auto_772848 ) ) ( not ( = ?auto_772835 ?auto_772849 ) ) ( not ( = ?auto_772835 ?auto_772850 ) ) ( not ( = ?auto_772835 ?auto_772851 ) ) ( not ( = ?auto_772836 ?auto_772837 ) ) ( not ( = ?auto_772836 ?auto_772838 ) ) ( not ( = ?auto_772836 ?auto_772839 ) ) ( not ( = ?auto_772836 ?auto_772840 ) ) ( not ( = ?auto_772836 ?auto_772841 ) ) ( not ( = ?auto_772836 ?auto_772842 ) ) ( not ( = ?auto_772836 ?auto_772843 ) ) ( not ( = ?auto_772836 ?auto_772844 ) ) ( not ( = ?auto_772836 ?auto_772845 ) ) ( not ( = ?auto_772836 ?auto_772846 ) ) ( not ( = ?auto_772836 ?auto_772847 ) ) ( not ( = ?auto_772836 ?auto_772848 ) ) ( not ( = ?auto_772836 ?auto_772849 ) ) ( not ( = ?auto_772836 ?auto_772850 ) ) ( not ( = ?auto_772836 ?auto_772851 ) ) ( not ( = ?auto_772837 ?auto_772838 ) ) ( not ( = ?auto_772837 ?auto_772839 ) ) ( not ( = ?auto_772837 ?auto_772840 ) ) ( not ( = ?auto_772837 ?auto_772841 ) ) ( not ( = ?auto_772837 ?auto_772842 ) ) ( not ( = ?auto_772837 ?auto_772843 ) ) ( not ( = ?auto_772837 ?auto_772844 ) ) ( not ( = ?auto_772837 ?auto_772845 ) ) ( not ( = ?auto_772837 ?auto_772846 ) ) ( not ( = ?auto_772837 ?auto_772847 ) ) ( not ( = ?auto_772837 ?auto_772848 ) ) ( not ( = ?auto_772837 ?auto_772849 ) ) ( not ( = ?auto_772837 ?auto_772850 ) ) ( not ( = ?auto_772837 ?auto_772851 ) ) ( not ( = ?auto_772838 ?auto_772839 ) ) ( not ( = ?auto_772838 ?auto_772840 ) ) ( not ( = ?auto_772838 ?auto_772841 ) ) ( not ( = ?auto_772838 ?auto_772842 ) ) ( not ( = ?auto_772838 ?auto_772843 ) ) ( not ( = ?auto_772838 ?auto_772844 ) ) ( not ( = ?auto_772838 ?auto_772845 ) ) ( not ( = ?auto_772838 ?auto_772846 ) ) ( not ( = ?auto_772838 ?auto_772847 ) ) ( not ( = ?auto_772838 ?auto_772848 ) ) ( not ( = ?auto_772838 ?auto_772849 ) ) ( not ( = ?auto_772838 ?auto_772850 ) ) ( not ( = ?auto_772838 ?auto_772851 ) ) ( not ( = ?auto_772839 ?auto_772840 ) ) ( not ( = ?auto_772839 ?auto_772841 ) ) ( not ( = ?auto_772839 ?auto_772842 ) ) ( not ( = ?auto_772839 ?auto_772843 ) ) ( not ( = ?auto_772839 ?auto_772844 ) ) ( not ( = ?auto_772839 ?auto_772845 ) ) ( not ( = ?auto_772839 ?auto_772846 ) ) ( not ( = ?auto_772839 ?auto_772847 ) ) ( not ( = ?auto_772839 ?auto_772848 ) ) ( not ( = ?auto_772839 ?auto_772849 ) ) ( not ( = ?auto_772839 ?auto_772850 ) ) ( not ( = ?auto_772839 ?auto_772851 ) ) ( not ( = ?auto_772840 ?auto_772841 ) ) ( not ( = ?auto_772840 ?auto_772842 ) ) ( not ( = ?auto_772840 ?auto_772843 ) ) ( not ( = ?auto_772840 ?auto_772844 ) ) ( not ( = ?auto_772840 ?auto_772845 ) ) ( not ( = ?auto_772840 ?auto_772846 ) ) ( not ( = ?auto_772840 ?auto_772847 ) ) ( not ( = ?auto_772840 ?auto_772848 ) ) ( not ( = ?auto_772840 ?auto_772849 ) ) ( not ( = ?auto_772840 ?auto_772850 ) ) ( not ( = ?auto_772840 ?auto_772851 ) ) ( not ( = ?auto_772841 ?auto_772842 ) ) ( not ( = ?auto_772841 ?auto_772843 ) ) ( not ( = ?auto_772841 ?auto_772844 ) ) ( not ( = ?auto_772841 ?auto_772845 ) ) ( not ( = ?auto_772841 ?auto_772846 ) ) ( not ( = ?auto_772841 ?auto_772847 ) ) ( not ( = ?auto_772841 ?auto_772848 ) ) ( not ( = ?auto_772841 ?auto_772849 ) ) ( not ( = ?auto_772841 ?auto_772850 ) ) ( not ( = ?auto_772841 ?auto_772851 ) ) ( not ( = ?auto_772842 ?auto_772843 ) ) ( not ( = ?auto_772842 ?auto_772844 ) ) ( not ( = ?auto_772842 ?auto_772845 ) ) ( not ( = ?auto_772842 ?auto_772846 ) ) ( not ( = ?auto_772842 ?auto_772847 ) ) ( not ( = ?auto_772842 ?auto_772848 ) ) ( not ( = ?auto_772842 ?auto_772849 ) ) ( not ( = ?auto_772842 ?auto_772850 ) ) ( not ( = ?auto_772842 ?auto_772851 ) ) ( not ( = ?auto_772843 ?auto_772844 ) ) ( not ( = ?auto_772843 ?auto_772845 ) ) ( not ( = ?auto_772843 ?auto_772846 ) ) ( not ( = ?auto_772843 ?auto_772847 ) ) ( not ( = ?auto_772843 ?auto_772848 ) ) ( not ( = ?auto_772843 ?auto_772849 ) ) ( not ( = ?auto_772843 ?auto_772850 ) ) ( not ( = ?auto_772843 ?auto_772851 ) ) ( not ( = ?auto_772844 ?auto_772845 ) ) ( not ( = ?auto_772844 ?auto_772846 ) ) ( not ( = ?auto_772844 ?auto_772847 ) ) ( not ( = ?auto_772844 ?auto_772848 ) ) ( not ( = ?auto_772844 ?auto_772849 ) ) ( not ( = ?auto_772844 ?auto_772850 ) ) ( not ( = ?auto_772844 ?auto_772851 ) ) ( not ( = ?auto_772845 ?auto_772846 ) ) ( not ( = ?auto_772845 ?auto_772847 ) ) ( not ( = ?auto_772845 ?auto_772848 ) ) ( not ( = ?auto_772845 ?auto_772849 ) ) ( not ( = ?auto_772845 ?auto_772850 ) ) ( not ( = ?auto_772845 ?auto_772851 ) ) ( not ( = ?auto_772846 ?auto_772847 ) ) ( not ( = ?auto_772846 ?auto_772848 ) ) ( not ( = ?auto_772846 ?auto_772849 ) ) ( not ( = ?auto_772846 ?auto_772850 ) ) ( not ( = ?auto_772846 ?auto_772851 ) ) ( not ( = ?auto_772847 ?auto_772848 ) ) ( not ( = ?auto_772847 ?auto_772849 ) ) ( not ( = ?auto_772847 ?auto_772850 ) ) ( not ( = ?auto_772847 ?auto_772851 ) ) ( not ( = ?auto_772848 ?auto_772849 ) ) ( not ( = ?auto_772848 ?auto_772850 ) ) ( not ( = ?auto_772848 ?auto_772851 ) ) ( not ( = ?auto_772849 ?auto_772850 ) ) ( not ( = ?auto_772849 ?auto_772851 ) ) ( not ( = ?auto_772850 ?auto_772851 ) ) ( ON ?auto_772849 ?auto_772850 ) ( ON ?auto_772848 ?auto_772849 ) ( ON ?auto_772847 ?auto_772848 ) ( ON ?auto_772846 ?auto_772847 ) ( ON ?auto_772845 ?auto_772846 ) ( ON ?auto_772844 ?auto_772845 ) ( CLEAR ?auto_772842 ) ( ON ?auto_772843 ?auto_772844 ) ( CLEAR ?auto_772843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_772834 ?auto_772835 ?auto_772836 ?auto_772837 ?auto_772838 ?auto_772839 ?auto_772840 ?auto_772841 ?auto_772842 ?auto_772843 )
      ( MAKE-17PILE ?auto_772834 ?auto_772835 ?auto_772836 ?auto_772837 ?auto_772838 ?auto_772839 ?auto_772840 ?auto_772841 ?auto_772842 ?auto_772843 ?auto_772844 ?auto_772845 ?auto_772846 ?auto_772847 ?auto_772848 ?auto_772849 ?auto_772850 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_772904 - BLOCK
      ?auto_772905 - BLOCK
      ?auto_772906 - BLOCK
      ?auto_772907 - BLOCK
      ?auto_772908 - BLOCK
      ?auto_772909 - BLOCK
      ?auto_772910 - BLOCK
      ?auto_772911 - BLOCK
      ?auto_772912 - BLOCK
      ?auto_772913 - BLOCK
      ?auto_772914 - BLOCK
      ?auto_772915 - BLOCK
      ?auto_772916 - BLOCK
      ?auto_772917 - BLOCK
      ?auto_772918 - BLOCK
      ?auto_772919 - BLOCK
      ?auto_772920 - BLOCK
    )
    :vars
    (
      ?auto_772921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772920 ?auto_772921 ) ( ON-TABLE ?auto_772904 ) ( ON ?auto_772905 ?auto_772904 ) ( ON ?auto_772906 ?auto_772905 ) ( ON ?auto_772907 ?auto_772906 ) ( ON ?auto_772908 ?auto_772907 ) ( ON ?auto_772909 ?auto_772908 ) ( ON ?auto_772910 ?auto_772909 ) ( ON ?auto_772911 ?auto_772910 ) ( not ( = ?auto_772904 ?auto_772905 ) ) ( not ( = ?auto_772904 ?auto_772906 ) ) ( not ( = ?auto_772904 ?auto_772907 ) ) ( not ( = ?auto_772904 ?auto_772908 ) ) ( not ( = ?auto_772904 ?auto_772909 ) ) ( not ( = ?auto_772904 ?auto_772910 ) ) ( not ( = ?auto_772904 ?auto_772911 ) ) ( not ( = ?auto_772904 ?auto_772912 ) ) ( not ( = ?auto_772904 ?auto_772913 ) ) ( not ( = ?auto_772904 ?auto_772914 ) ) ( not ( = ?auto_772904 ?auto_772915 ) ) ( not ( = ?auto_772904 ?auto_772916 ) ) ( not ( = ?auto_772904 ?auto_772917 ) ) ( not ( = ?auto_772904 ?auto_772918 ) ) ( not ( = ?auto_772904 ?auto_772919 ) ) ( not ( = ?auto_772904 ?auto_772920 ) ) ( not ( = ?auto_772904 ?auto_772921 ) ) ( not ( = ?auto_772905 ?auto_772906 ) ) ( not ( = ?auto_772905 ?auto_772907 ) ) ( not ( = ?auto_772905 ?auto_772908 ) ) ( not ( = ?auto_772905 ?auto_772909 ) ) ( not ( = ?auto_772905 ?auto_772910 ) ) ( not ( = ?auto_772905 ?auto_772911 ) ) ( not ( = ?auto_772905 ?auto_772912 ) ) ( not ( = ?auto_772905 ?auto_772913 ) ) ( not ( = ?auto_772905 ?auto_772914 ) ) ( not ( = ?auto_772905 ?auto_772915 ) ) ( not ( = ?auto_772905 ?auto_772916 ) ) ( not ( = ?auto_772905 ?auto_772917 ) ) ( not ( = ?auto_772905 ?auto_772918 ) ) ( not ( = ?auto_772905 ?auto_772919 ) ) ( not ( = ?auto_772905 ?auto_772920 ) ) ( not ( = ?auto_772905 ?auto_772921 ) ) ( not ( = ?auto_772906 ?auto_772907 ) ) ( not ( = ?auto_772906 ?auto_772908 ) ) ( not ( = ?auto_772906 ?auto_772909 ) ) ( not ( = ?auto_772906 ?auto_772910 ) ) ( not ( = ?auto_772906 ?auto_772911 ) ) ( not ( = ?auto_772906 ?auto_772912 ) ) ( not ( = ?auto_772906 ?auto_772913 ) ) ( not ( = ?auto_772906 ?auto_772914 ) ) ( not ( = ?auto_772906 ?auto_772915 ) ) ( not ( = ?auto_772906 ?auto_772916 ) ) ( not ( = ?auto_772906 ?auto_772917 ) ) ( not ( = ?auto_772906 ?auto_772918 ) ) ( not ( = ?auto_772906 ?auto_772919 ) ) ( not ( = ?auto_772906 ?auto_772920 ) ) ( not ( = ?auto_772906 ?auto_772921 ) ) ( not ( = ?auto_772907 ?auto_772908 ) ) ( not ( = ?auto_772907 ?auto_772909 ) ) ( not ( = ?auto_772907 ?auto_772910 ) ) ( not ( = ?auto_772907 ?auto_772911 ) ) ( not ( = ?auto_772907 ?auto_772912 ) ) ( not ( = ?auto_772907 ?auto_772913 ) ) ( not ( = ?auto_772907 ?auto_772914 ) ) ( not ( = ?auto_772907 ?auto_772915 ) ) ( not ( = ?auto_772907 ?auto_772916 ) ) ( not ( = ?auto_772907 ?auto_772917 ) ) ( not ( = ?auto_772907 ?auto_772918 ) ) ( not ( = ?auto_772907 ?auto_772919 ) ) ( not ( = ?auto_772907 ?auto_772920 ) ) ( not ( = ?auto_772907 ?auto_772921 ) ) ( not ( = ?auto_772908 ?auto_772909 ) ) ( not ( = ?auto_772908 ?auto_772910 ) ) ( not ( = ?auto_772908 ?auto_772911 ) ) ( not ( = ?auto_772908 ?auto_772912 ) ) ( not ( = ?auto_772908 ?auto_772913 ) ) ( not ( = ?auto_772908 ?auto_772914 ) ) ( not ( = ?auto_772908 ?auto_772915 ) ) ( not ( = ?auto_772908 ?auto_772916 ) ) ( not ( = ?auto_772908 ?auto_772917 ) ) ( not ( = ?auto_772908 ?auto_772918 ) ) ( not ( = ?auto_772908 ?auto_772919 ) ) ( not ( = ?auto_772908 ?auto_772920 ) ) ( not ( = ?auto_772908 ?auto_772921 ) ) ( not ( = ?auto_772909 ?auto_772910 ) ) ( not ( = ?auto_772909 ?auto_772911 ) ) ( not ( = ?auto_772909 ?auto_772912 ) ) ( not ( = ?auto_772909 ?auto_772913 ) ) ( not ( = ?auto_772909 ?auto_772914 ) ) ( not ( = ?auto_772909 ?auto_772915 ) ) ( not ( = ?auto_772909 ?auto_772916 ) ) ( not ( = ?auto_772909 ?auto_772917 ) ) ( not ( = ?auto_772909 ?auto_772918 ) ) ( not ( = ?auto_772909 ?auto_772919 ) ) ( not ( = ?auto_772909 ?auto_772920 ) ) ( not ( = ?auto_772909 ?auto_772921 ) ) ( not ( = ?auto_772910 ?auto_772911 ) ) ( not ( = ?auto_772910 ?auto_772912 ) ) ( not ( = ?auto_772910 ?auto_772913 ) ) ( not ( = ?auto_772910 ?auto_772914 ) ) ( not ( = ?auto_772910 ?auto_772915 ) ) ( not ( = ?auto_772910 ?auto_772916 ) ) ( not ( = ?auto_772910 ?auto_772917 ) ) ( not ( = ?auto_772910 ?auto_772918 ) ) ( not ( = ?auto_772910 ?auto_772919 ) ) ( not ( = ?auto_772910 ?auto_772920 ) ) ( not ( = ?auto_772910 ?auto_772921 ) ) ( not ( = ?auto_772911 ?auto_772912 ) ) ( not ( = ?auto_772911 ?auto_772913 ) ) ( not ( = ?auto_772911 ?auto_772914 ) ) ( not ( = ?auto_772911 ?auto_772915 ) ) ( not ( = ?auto_772911 ?auto_772916 ) ) ( not ( = ?auto_772911 ?auto_772917 ) ) ( not ( = ?auto_772911 ?auto_772918 ) ) ( not ( = ?auto_772911 ?auto_772919 ) ) ( not ( = ?auto_772911 ?auto_772920 ) ) ( not ( = ?auto_772911 ?auto_772921 ) ) ( not ( = ?auto_772912 ?auto_772913 ) ) ( not ( = ?auto_772912 ?auto_772914 ) ) ( not ( = ?auto_772912 ?auto_772915 ) ) ( not ( = ?auto_772912 ?auto_772916 ) ) ( not ( = ?auto_772912 ?auto_772917 ) ) ( not ( = ?auto_772912 ?auto_772918 ) ) ( not ( = ?auto_772912 ?auto_772919 ) ) ( not ( = ?auto_772912 ?auto_772920 ) ) ( not ( = ?auto_772912 ?auto_772921 ) ) ( not ( = ?auto_772913 ?auto_772914 ) ) ( not ( = ?auto_772913 ?auto_772915 ) ) ( not ( = ?auto_772913 ?auto_772916 ) ) ( not ( = ?auto_772913 ?auto_772917 ) ) ( not ( = ?auto_772913 ?auto_772918 ) ) ( not ( = ?auto_772913 ?auto_772919 ) ) ( not ( = ?auto_772913 ?auto_772920 ) ) ( not ( = ?auto_772913 ?auto_772921 ) ) ( not ( = ?auto_772914 ?auto_772915 ) ) ( not ( = ?auto_772914 ?auto_772916 ) ) ( not ( = ?auto_772914 ?auto_772917 ) ) ( not ( = ?auto_772914 ?auto_772918 ) ) ( not ( = ?auto_772914 ?auto_772919 ) ) ( not ( = ?auto_772914 ?auto_772920 ) ) ( not ( = ?auto_772914 ?auto_772921 ) ) ( not ( = ?auto_772915 ?auto_772916 ) ) ( not ( = ?auto_772915 ?auto_772917 ) ) ( not ( = ?auto_772915 ?auto_772918 ) ) ( not ( = ?auto_772915 ?auto_772919 ) ) ( not ( = ?auto_772915 ?auto_772920 ) ) ( not ( = ?auto_772915 ?auto_772921 ) ) ( not ( = ?auto_772916 ?auto_772917 ) ) ( not ( = ?auto_772916 ?auto_772918 ) ) ( not ( = ?auto_772916 ?auto_772919 ) ) ( not ( = ?auto_772916 ?auto_772920 ) ) ( not ( = ?auto_772916 ?auto_772921 ) ) ( not ( = ?auto_772917 ?auto_772918 ) ) ( not ( = ?auto_772917 ?auto_772919 ) ) ( not ( = ?auto_772917 ?auto_772920 ) ) ( not ( = ?auto_772917 ?auto_772921 ) ) ( not ( = ?auto_772918 ?auto_772919 ) ) ( not ( = ?auto_772918 ?auto_772920 ) ) ( not ( = ?auto_772918 ?auto_772921 ) ) ( not ( = ?auto_772919 ?auto_772920 ) ) ( not ( = ?auto_772919 ?auto_772921 ) ) ( not ( = ?auto_772920 ?auto_772921 ) ) ( ON ?auto_772919 ?auto_772920 ) ( ON ?auto_772918 ?auto_772919 ) ( ON ?auto_772917 ?auto_772918 ) ( ON ?auto_772916 ?auto_772917 ) ( ON ?auto_772915 ?auto_772916 ) ( ON ?auto_772914 ?auto_772915 ) ( ON ?auto_772913 ?auto_772914 ) ( CLEAR ?auto_772911 ) ( ON ?auto_772912 ?auto_772913 ) ( CLEAR ?auto_772912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_772904 ?auto_772905 ?auto_772906 ?auto_772907 ?auto_772908 ?auto_772909 ?auto_772910 ?auto_772911 ?auto_772912 )
      ( MAKE-17PILE ?auto_772904 ?auto_772905 ?auto_772906 ?auto_772907 ?auto_772908 ?auto_772909 ?auto_772910 ?auto_772911 ?auto_772912 ?auto_772913 ?auto_772914 ?auto_772915 ?auto_772916 ?auto_772917 ?auto_772918 ?auto_772919 ?auto_772920 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_772974 - BLOCK
      ?auto_772975 - BLOCK
      ?auto_772976 - BLOCK
      ?auto_772977 - BLOCK
      ?auto_772978 - BLOCK
      ?auto_772979 - BLOCK
      ?auto_772980 - BLOCK
      ?auto_772981 - BLOCK
      ?auto_772982 - BLOCK
      ?auto_772983 - BLOCK
      ?auto_772984 - BLOCK
      ?auto_772985 - BLOCK
      ?auto_772986 - BLOCK
      ?auto_772987 - BLOCK
      ?auto_772988 - BLOCK
      ?auto_772989 - BLOCK
      ?auto_772990 - BLOCK
    )
    :vars
    (
      ?auto_772991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_772990 ?auto_772991 ) ( ON-TABLE ?auto_772974 ) ( ON ?auto_772975 ?auto_772974 ) ( ON ?auto_772976 ?auto_772975 ) ( ON ?auto_772977 ?auto_772976 ) ( ON ?auto_772978 ?auto_772977 ) ( ON ?auto_772979 ?auto_772978 ) ( ON ?auto_772980 ?auto_772979 ) ( not ( = ?auto_772974 ?auto_772975 ) ) ( not ( = ?auto_772974 ?auto_772976 ) ) ( not ( = ?auto_772974 ?auto_772977 ) ) ( not ( = ?auto_772974 ?auto_772978 ) ) ( not ( = ?auto_772974 ?auto_772979 ) ) ( not ( = ?auto_772974 ?auto_772980 ) ) ( not ( = ?auto_772974 ?auto_772981 ) ) ( not ( = ?auto_772974 ?auto_772982 ) ) ( not ( = ?auto_772974 ?auto_772983 ) ) ( not ( = ?auto_772974 ?auto_772984 ) ) ( not ( = ?auto_772974 ?auto_772985 ) ) ( not ( = ?auto_772974 ?auto_772986 ) ) ( not ( = ?auto_772974 ?auto_772987 ) ) ( not ( = ?auto_772974 ?auto_772988 ) ) ( not ( = ?auto_772974 ?auto_772989 ) ) ( not ( = ?auto_772974 ?auto_772990 ) ) ( not ( = ?auto_772974 ?auto_772991 ) ) ( not ( = ?auto_772975 ?auto_772976 ) ) ( not ( = ?auto_772975 ?auto_772977 ) ) ( not ( = ?auto_772975 ?auto_772978 ) ) ( not ( = ?auto_772975 ?auto_772979 ) ) ( not ( = ?auto_772975 ?auto_772980 ) ) ( not ( = ?auto_772975 ?auto_772981 ) ) ( not ( = ?auto_772975 ?auto_772982 ) ) ( not ( = ?auto_772975 ?auto_772983 ) ) ( not ( = ?auto_772975 ?auto_772984 ) ) ( not ( = ?auto_772975 ?auto_772985 ) ) ( not ( = ?auto_772975 ?auto_772986 ) ) ( not ( = ?auto_772975 ?auto_772987 ) ) ( not ( = ?auto_772975 ?auto_772988 ) ) ( not ( = ?auto_772975 ?auto_772989 ) ) ( not ( = ?auto_772975 ?auto_772990 ) ) ( not ( = ?auto_772975 ?auto_772991 ) ) ( not ( = ?auto_772976 ?auto_772977 ) ) ( not ( = ?auto_772976 ?auto_772978 ) ) ( not ( = ?auto_772976 ?auto_772979 ) ) ( not ( = ?auto_772976 ?auto_772980 ) ) ( not ( = ?auto_772976 ?auto_772981 ) ) ( not ( = ?auto_772976 ?auto_772982 ) ) ( not ( = ?auto_772976 ?auto_772983 ) ) ( not ( = ?auto_772976 ?auto_772984 ) ) ( not ( = ?auto_772976 ?auto_772985 ) ) ( not ( = ?auto_772976 ?auto_772986 ) ) ( not ( = ?auto_772976 ?auto_772987 ) ) ( not ( = ?auto_772976 ?auto_772988 ) ) ( not ( = ?auto_772976 ?auto_772989 ) ) ( not ( = ?auto_772976 ?auto_772990 ) ) ( not ( = ?auto_772976 ?auto_772991 ) ) ( not ( = ?auto_772977 ?auto_772978 ) ) ( not ( = ?auto_772977 ?auto_772979 ) ) ( not ( = ?auto_772977 ?auto_772980 ) ) ( not ( = ?auto_772977 ?auto_772981 ) ) ( not ( = ?auto_772977 ?auto_772982 ) ) ( not ( = ?auto_772977 ?auto_772983 ) ) ( not ( = ?auto_772977 ?auto_772984 ) ) ( not ( = ?auto_772977 ?auto_772985 ) ) ( not ( = ?auto_772977 ?auto_772986 ) ) ( not ( = ?auto_772977 ?auto_772987 ) ) ( not ( = ?auto_772977 ?auto_772988 ) ) ( not ( = ?auto_772977 ?auto_772989 ) ) ( not ( = ?auto_772977 ?auto_772990 ) ) ( not ( = ?auto_772977 ?auto_772991 ) ) ( not ( = ?auto_772978 ?auto_772979 ) ) ( not ( = ?auto_772978 ?auto_772980 ) ) ( not ( = ?auto_772978 ?auto_772981 ) ) ( not ( = ?auto_772978 ?auto_772982 ) ) ( not ( = ?auto_772978 ?auto_772983 ) ) ( not ( = ?auto_772978 ?auto_772984 ) ) ( not ( = ?auto_772978 ?auto_772985 ) ) ( not ( = ?auto_772978 ?auto_772986 ) ) ( not ( = ?auto_772978 ?auto_772987 ) ) ( not ( = ?auto_772978 ?auto_772988 ) ) ( not ( = ?auto_772978 ?auto_772989 ) ) ( not ( = ?auto_772978 ?auto_772990 ) ) ( not ( = ?auto_772978 ?auto_772991 ) ) ( not ( = ?auto_772979 ?auto_772980 ) ) ( not ( = ?auto_772979 ?auto_772981 ) ) ( not ( = ?auto_772979 ?auto_772982 ) ) ( not ( = ?auto_772979 ?auto_772983 ) ) ( not ( = ?auto_772979 ?auto_772984 ) ) ( not ( = ?auto_772979 ?auto_772985 ) ) ( not ( = ?auto_772979 ?auto_772986 ) ) ( not ( = ?auto_772979 ?auto_772987 ) ) ( not ( = ?auto_772979 ?auto_772988 ) ) ( not ( = ?auto_772979 ?auto_772989 ) ) ( not ( = ?auto_772979 ?auto_772990 ) ) ( not ( = ?auto_772979 ?auto_772991 ) ) ( not ( = ?auto_772980 ?auto_772981 ) ) ( not ( = ?auto_772980 ?auto_772982 ) ) ( not ( = ?auto_772980 ?auto_772983 ) ) ( not ( = ?auto_772980 ?auto_772984 ) ) ( not ( = ?auto_772980 ?auto_772985 ) ) ( not ( = ?auto_772980 ?auto_772986 ) ) ( not ( = ?auto_772980 ?auto_772987 ) ) ( not ( = ?auto_772980 ?auto_772988 ) ) ( not ( = ?auto_772980 ?auto_772989 ) ) ( not ( = ?auto_772980 ?auto_772990 ) ) ( not ( = ?auto_772980 ?auto_772991 ) ) ( not ( = ?auto_772981 ?auto_772982 ) ) ( not ( = ?auto_772981 ?auto_772983 ) ) ( not ( = ?auto_772981 ?auto_772984 ) ) ( not ( = ?auto_772981 ?auto_772985 ) ) ( not ( = ?auto_772981 ?auto_772986 ) ) ( not ( = ?auto_772981 ?auto_772987 ) ) ( not ( = ?auto_772981 ?auto_772988 ) ) ( not ( = ?auto_772981 ?auto_772989 ) ) ( not ( = ?auto_772981 ?auto_772990 ) ) ( not ( = ?auto_772981 ?auto_772991 ) ) ( not ( = ?auto_772982 ?auto_772983 ) ) ( not ( = ?auto_772982 ?auto_772984 ) ) ( not ( = ?auto_772982 ?auto_772985 ) ) ( not ( = ?auto_772982 ?auto_772986 ) ) ( not ( = ?auto_772982 ?auto_772987 ) ) ( not ( = ?auto_772982 ?auto_772988 ) ) ( not ( = ?auto_772982 ?auto_772989 ) ) ( not ( = ?auto_772982 ?auto_772990 ) ) ( not ( = ?auto_772982 ?auto_772991 ) ) ( not ( = ?auto_772983 ?auto_772984 ) ) ( not ( = ?auto_772983 ?auto_772985 ) ) ( not ( = ?auto_772983 ?auto_772986 ) ) ( not ( = ?auto_772983 ?auto_772987 ) ) ( not ( = ?auto_772983 ?auto_772988 ) ) ( not ( = ?auto_772983 ?auto_772989 ) ) ( not ( = ?auto_772983 ?auto_772990 ) ) ( not ( = ?auto_772983 ?auto_772991 ) ) ( not ( = ?auto_772984 ?auto_772985 ) ) ( not ( = ?auto_772984 ?auto_772986 ) ) ( not ( = ?auto_772984 ?auto_772987 ) ) ( not ( = ?auto_772984 ?auto_772988 ) ) ( not ( = ?auto_772984 ?auto_772989 ) ) ( not ( = ?auto_772984 ?auto_772990 ) ) ( not ( = ?auto_772984 ?auto_772991 ) ) ( not ( = ?auto_772985 ?auto_772986 ) ) ( not ( = ?auto_772985 ?auto_772987 ) ) ( not ( = ?auto_772985 ?auto_772988 ) ) ( not ( = ?auto_772985 ?auto_772989 ) ) ( not ( = ?auto_772985 ?auto_772990 ) ) ( not ( = ?auto_772985 ?auto_772991 ) ) ( not ( = ?auto_772986 ?auto_772987 ) ) ( not ( = ?auto_772986 ?auto_772988 ) ) ( not ( = ?auto_772986 ?auto_772989 ) ) ( not ( = ?auto_772986 ?auto_772990 ) ) ( not ( = ?auto_772986 ?auto_772991 ) ) ( not ( = ?auto_772987 ?auto_772988 ) ) ( not ( = ?auto_772987 ?auto_772989 ) ) ( not ( = ?auto_772987 ?auto_772990 ) ) ( not ( = ?auto_772987 ?auto_772991 ) ) ( not ( = ?auto_772988 ?auto_772989 ) ) ( not ( = ?auto_772988 ?auto_772990 ) ) ( not ( = ?auto_772988 ?auto_772991 ) ) ( not ( = ?auto_772989 ?auto_772990 ) ) ( not ( = ?auto_772989 ?auto_772991 ) ) ( not ( = ?auto_772990 ?auto_772991 ) ) ( ON ?auto_772989 ?auto_772990 ) ( ON ?auto_772988 ?auto_772989 ) ( ON ?auto_772987 ?auto_772988 ) ( ON ?auto_772986 ?auto_772987 ) ( ON ?auto_772985 ?auto_772986 ) ( ON ?auto_772984 ?auto_772985 ) ( ON ?auto_772983 ?auto_772984 ) ( ON ?auto_772982 ?auto_772983 ) ( CLEAR ?auto_772980 ) ( ON ?auto_772981 ?auto_772982 ) ( CLEAR ?auto_772981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_772974 ?auto_772975 ?auto_772976 ?auto_772977 ?auto_772978 ?auto_772979 ?auto_772980 ?auto_772981 )
      ( MAKE-17PILE ?auto_772974 ?auto_772975 ?auto_772976 ?auto_772977 ?auto_772978 ?auto_772979 ?auto_772980 ?auto_772981 ?auto_772982 ?auto_772983 ?auto_772984 ?auto_772985 ?auto_772986 ?auto_772987 ?auto_772988 ?auto_772989 ?auto_772990 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_773044 - BLOCK
      ?auto_773045 - BLOCK
      ?auto_773046 - BLOCK
      ?auto_773047 - BLOCK
      ?auto_773048 - BLOCK
      ?auto_773049 - BLOCK
      ?auto_773050 - BLOCK
      ?auto_773051 - BLOCK
      ?auto_773052 - BLOCK
      ?auto_773053 - BLOCK
      ?auto_773054 - BLOCK
      ?auto_773055 - BLOCK
      ?auto_773056 - BLOCK
      ?auto_773057 - BLOCK
      ?auto_773058 - BLOCK
      ?auto_773059 - BLOCK
      ?auto_773060 - BLOCK
    )
    :vars
    (
      ?auto_773061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_773060 ?auto_773061 ) ( ON-TABLE ?auto_773044 ) ( ON ?auto_773045 ?auto_773044 ) ( ON ?auto_773046 ?auto_773045 ) ( ON ?auto_773047 ?auto_773046 ) ( ON ?auto_773048 ?auto_773047 ) ( ON ?auto_773049 ?auto_773048 ) ( not ( = ?auto_773044 ?auto_773045 ) ) ( not ( = ?auto_773044 ?auto_773046 ) ) ( not ( = ?auto_773044 ?auto_773047 ) ) ( not ( = ?auto_773044 ?auto_773048 ) ) ( not ( = ?auto_773044 ?auto_773049 ) ) ( not ( = ?auto_773044 ?auto_773050 ) ) ( not ( = ?auto_773044 ?auto_773051 ) ) ( not ( = ?auto_773044 ?auto_773052 ) ) ( not ( = ?auto_773044 ?auto_773053 ) ) ( not ( = ?auto_773044 ?auto_773054 ) ) ( not ( = ?auto_773044 ?auto_773055 ) ) ( not ( = ?auto_773044 ?auto_773056 ) ) ( not ( = ?auto_773044 ?auto_773057 ) ) ( not ( = ?auto_773044 ?auto_773058 ) ) ( not ( = ?auto_773044 ?auto_773059 ) ) ( not ( = ?auto_773044 ?auto_773060 ) ) ( not ( = ?auto_773044 ?auto_773061 ) ) ( not ( = ?auto_773045 ?auto_773046 ) ) ( not ( = ?auto_773045 ?auto_773047 ) ) ( not ( = ?auto_773045 ?auto_773048 ) ) ( not ( = ?auto_773045 ?auto_773049 ) ) ( not ( = ?auto_773045 ?auto_773050 ) ) ( not ( = ?auto_773045 ?auto_773051 ) ) ( not ( = ?auto_773045 ?auto_773052 ) ) ( not ( = ?auto_773045 ?auto_773053 ) ) ( not ( = ?auto_773045 ?auto_773054 ) ) ( not ( = ?auto_773045 ?auto_773055 ) ) ( not ( = ?auto_773045 ?auto_773056 ) ) ( not ( = ?auto_773045 ?auto_773057 ) ) ( not ( = ?auto_773045 ?auto_773058 ) ) ( not ( = ?auto_773045 ?auto_773059 ) ) ( not ( = ?auto_773045 ?auto_773060 ) ) ( not ( = ?auto_773045 ?auto_773061 ) ) ( not ( = ?auto_773046 ?auto_773047 ) ) ( not ( = ?auto_773046 ?auto_773048 ) ) ( not ( = ?auto_773046 ?auto_773049 ) ) ( not ( = ?auto_773046 ?auto_773050 ) ) ( not ( = ?auto_773046 ?auto_773051 ) ) ( not ( = ?auto_773046 ?auto_773052 ) ) ( not ( = ?auto_773046 ?auto_773053 ) ) ( not ( = ?auto_773046 ?auto_773054 ) ) ( not ( = ?auto_773046 ?auto_773055 ) ) ( not ( = ?auto_773046 ?auto_773056 ) ) ( not ( = ?auto_773046 ?auto_773057 ) ) ( not ( = ?auto_773046 ?auto_773058 ) ) ( not ( = ?auto_773046 ?auto_773059 ) ) ( not ( = ?auto_773046 ?auto_773060 ) ) ( not ( = ?auto_773046 ?auto_773061 ) ) ( not ( = ?auto_773047 ?auto_773048 ) ) ( not ( = ?auto_773047 ?auto_773049 ) ) ( not ( = ?auto_773047 ?auto_773050 ) ) ( not ( = ?auto_773047 ?auto_773051 ) ) ( not ( = ?auto_773047 ?auto_773052 ) ) ( not ( = ?auto_773047 ?auto_773053 ) ) ( not ( = ?auto_773047 ?auto_773054 ) ) ( not ( = ?auto_773047 ?auto_773055 ) ) ( not ( = ?auto_773047 ?auto_773056 ) ) ( not ( = ?auto_773047 ?auto_773057 ) ) ( not ( = ?auto_773047 ?auto_773058 ) ) ( not ( = ?auto_773047 ?auto_773059 ) ) ( not ( = ?auto_773047 ?auto_773060 ) ) ( not ( = ?auto_773047 ?auto_773061 ) ) ( not ( = ?auto_773048 ?auto_773049 ) ) ( not ( = ?auto_773048 ?auto_773050 ) ) ( not ( = ?auto_773048 ?auto_773051 ) ) ( not ( = ?auto_773048 ?auto_773052 ) ) ( not ( = ?auto_773048 ?auto_773053 ) ) ( not ( = ?auto_773048 ?auto_773054 ) ) ( not ( = ?auto_773048 ?auto_773055 ) ) ( not ( = ?auto_773048 ?auto_773056 ) ) ( not ( = ?auto_773048 ?auto_773057 ) ) ( not ( = ?auto_773048 ?auto_773058 ) ) ( not ( = ?auto_773048 ?auto_773059 ) ) ( not ( = ?auto_773048 ?auto_773060 ) ) ( not ( = ?auto_773048 ?auto_773061 ) ) ( not ( = ?auto_773049 ?auto_773050 ) ) ( not ( = ?auto_773049 ?auto_773051 ) ) ( not ( = ?auto_773049 ?auto_773052 ) ) ( not ( = ?auto_773049 ?auto_773053 ) ) ( not ( = ?auto_773049 ?auto_773054 ) ) ( not ( = ?auto_773049 ?auto_773055 ) ) ( not ( = ?auto_773049 ?auto_773056 ) ) ( not ( = ?auto_773049 ?auto_773057 ) ) ( not ( = ?auto_773049 ?auto_773058 ) ) ( not ( = ?auto_773049 ?auto_773059 ) ) ( not ( = ?auto_773049 ?auto_773060 ) ) ( not ( = ?auto_773049 ?auto_773061 ) ) ( not ( = ?auto_773050 ?auto_773051 ) ) ( not ( = ?auto_773050 ?auto_773052 ) ) ( not ( = ?auto_773050 ?auto_773053 ) ) ( not ( = ?auto_773050 ?auto_773054 ) ) ( not ( = ?auto_773050 ?auto_773055 ) ) ( not ( = ?auto_773050 ?auto_773056 ) ) ( not ( = ?auto_773050 ?auto_773057 ) ) ( not ( = ?auto_773050 ?auto_773058 ) ) ( not ( = ?auto_773050 ?auto_773059 ) ) ( not ( = ?auto_773050 ?auto_773060 ) ) ( not ( = ?auto_773050 ?auto_773061 ) ) ( not ( = ?auto_773051 ?auto_773052 ) ) ( not ( = ?auto_773051 ?auto_773053 ) ) ( not ( = ?auto_773051 ?auto_773054 ) ) ( not ( = ?auto_773051 ?auto_773055 ) ) ( not ( = ?auto_773051 ?auto_773056 ) ) ( not ( = ?auto_773051 ?auto_773057 ) ) ( not ( = ?auto_773051 ?auto_773058 ) ) ( not ( = ?auto_773051 ?auto_773059 ) ) ( not ( = ?auto_773051 ?auto_773060 ) ) ( not ( = ?auto_773051 ?auto_773061 ) ) ( not ( = ?auto_773052 ?auto_773053 ) ) ( not ( = ?auto_773052 ?auto_773054 ) ) ( not ( = ?auto_773052 ?auto_773055 ) ) ( not ( = ?auto_773052 ?auto_773056 ) ) ( not ( = ?auto_773052 ?auto_773057 ) ) ( not ( = ?auto_773052 ?auto_773058 ) ) ( not ( = ?auto_773052 ?auto_773059 ) ) ( not ( = ?auto_773052 ?auto_773060 ) ) ( not ( = ?auto_773052 ?auto_773061 ) ) ( not ( = ?auto_773053 ?auto_773054 ) ) ( not ( = ?auto_773053 ?auto_773055 ) ) ( not ( = ?auto_773053 ?auto_773056 ) ) ( not ( = ?auto_773053 ?auto_773057 ) ) ( not ( = ?auto_773053 ?auto_773058 ) ) ( not ( = ?auto_773053 ?auto_773059 ) ) ( not ( = ?auto_773053 ?auto_773060 ) ) ( not ( = ?auto_773053 ?auto_773061 ) ) ( not ( = ?auto_773054 ?auto_773055 ) ) ( not ( = ?auto_773054 ?auto_773056 ) ) ( not ( = ?auto_773054 ?auto_773057 ) ) ( not ( = ?auto_773054 ?auto_773058 ) ) ( not ( = ?auto_773054 ?auto_773059 ) ) ( not ( = ?auto_773054 ?auto_773060 ) ) ( not ( = ?auto_773054 ?auto_773061 ) ) ( not ( = ?auto_773055 ?auto_773056 ) ) ( not ( = ?auto_773055 ?auto_773057 ) ) ( not ( = ?auto_773055 ?auto_773058 ) ) ( not ( = ?auto_773055 ?auto_773059 ) ) ( not ( = ?auto_773055 ?auto_773060 ) ) ( not ( = ?auto_773055 ?auto_773061 ) ) ( not ( = ?auto_773056 ?auto_773057 ) ) ( not ( = ?auto_773056 ?auto_773058 ) ) ( not ( = ?auto_773056 ?auto_773059 ) ) ( not ( = ?auto_773056 ?auto_773060 ) ) ( not ( = ?auto_773056 ?auto_773061 ) ) ( not ( = ?auto_773057 ?auto_773058 ) ) ( not ( = ?auto_773057 ?auto_773059 ) ) ( not ( = ?auto_773057 ?auto_773060 ) ) ( not ( = ?auto_773057 ?auto_773061 ) ) ( not ( = ?auto_773058 ?auto_773059 ) ) ( not ( = ?auto_773058 ?auto_773060 ) ) ( not ( = ?auto_773058 ?auto_773061 ) ) ( not ( = ?auto_773059 ?auto_773060 ) ) ( not ( = ?auto_773059 ?auto_773061 ) ) ( not ( = ?auto_773060 ?auto_773061 ) ) ( ON ?auto_773059 ?auto_773060 ) ( ON ?auto_773058 ?auto_773059 ) ( ON ?auto_773057 ?auto_773058 ) ( ON ?auto_773056 ?auto_773057 ) ( ON ?auto_773055 ?auto_773056 ) ( ON ?auto_773054 ?auto_773055 ) ( ON ?auto_773053 ?auto_773054 ) ( ON ?auto_773052 ?auto_773053 ) ( ON ?auto_773051 ?auto_773052 ) ( CLEAR ?auto_773049 ) ( ON ?auto_773050 ?auto_773051 ) ( CLEAR ?auto_773050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_773044 ?auto_773045 ?auto_773046 ?auto_773047 ?auto_773048 ?auto_773049 ?auto_773050 )
      ( MAKE-17PILE ?auto_773044 ?auto_773045 ?auto_773046 ?auto_773047 ?auto_773048 ?auto_773049 ?auto_773050 ?auto_773051 ?auto_773052 ?auto_773053 ?auto_773054 ?auto_773055 ?auto_773056 ?auto_773057 ?auto_773058 ?auto_773059 ?auto_773060 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_773114 - BLOCK
      ?auto_773115 - BLOCK
      ?auto_773116 - BLOCK
      ?auto_773117 - BLOCK
      ?auto_773118 - BLOCK
      ?auto_773119 - BLOCK
      ?auto_773120 - BLOCK
      ?auto_773121 - BLOCK
      ?auto_773122 - BLOCK
      ?auto_773123 - BLOCK
      ?auto_773124 - BLOCK
      ?auto_773125 - BLOCK
      ?auto_773126 - BLOCK
      ?auto_773127 - BLOCK
      ?auto_773128 - BLOCK
      ?auto_773129 - BLOCK
      ?auto_773130 - BLOCK
    )
    :vars
    (
      ?auto_773131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_773130 ?auto_773131 ) ( ON-TABLE ?auto_773114 ) ( ON ?auto_773115 ?auto_773114 ) ( ON ?auto_773116 ?auto_773115 ) ( ON ?auto_773117 ?auto_773116 ) ( ON ?auto_773118 ?auto_773117 ) ( not ( = ?auto_773114 ?auto_773115 ) ) ( not ( = ?auto_773114 ?auto_773116 ) ) ( not ( = ?auto_773114 ?auto_773117 ) ) ( not ( = ?auto_773114 ?auto_773118 ) ) ( not ( = ?auto_773114 ?auto_773119 ) ) ( not ( = ?auto_773114 ?auto_773120 ) ) ( not ( = ?auto_773114 ?auto_773121 ) ) ( not ( = ?auto_773114 ?auto_773122 ) ) ( not ( = ?auto_773114 ?auto_773123 ) ) ( not ( = ?auto_773114 ?auto_773124 ) ) ( not ( = ?auto_773114 ?auto_773125 ) ) ( not ( = ?auto_773114 ?auto_773126 ) ) ( not ( = ?auto_773114 ?auto_773127 ) ) ( not ( = ?auto_773114 ?auto_773128 ) ) ( not ( = ?auto_773114 ?auto_773129 ) ) ( not ( = ?auto_773114 ?auto_773130 ) ) ( not ( = ?auto_773114 ?auto_773131 ) ) ( not ( = ?auto_773115 ?auto_773116 ) ) ( not ( = ?auto_773115 ?auto_773117 ) ) ( not ( = ?auto_773115 ?auto_773118 ) ) ( not ( = ?auto_773115 ?auto_773119 ) ) ( not ( = ?auto_773115 ?auto_773120 ) ) ( not ( = ?auto_773115 ?auto_773121 ) ) ( not ( = ?auto_773115 ?auto_773122 ) ) ( not ( = ?auto_773115 ?auto_773123 ) ) ( not ( = ?auto_773115 ?auto_773124 ) ) ( not ( = ?auto_773115 ?auto_773125 ) ) ( not ( = ?auto_773115 ?auto_773126 ) ) ( not ( = ?auto_773115 ?auto_773127 ) ) ( not ( = ?auto_773115 ?auto_773128 ) ) ( not ( = ?auto_773115 ?auto_773129 ) ) ( not ( = ?auto_773115 ?auto_773130 ) ) ( not ( = ?auto_773115 ?auto_773131 ) ) ( not ( = ?auto_773116 ?auto_773117 ) ) ( not ( = ?auto_773116 ?auto_773118 ) ) ( not ( = ?auto_773116 ?auto_773119 ) ) ( not ( = ?auto_773116 ?auto_773120 ) ) ( not ( = ?auto_773116 ?auto_773121 ) ) ( not ( = ?auto_773116 ?auto_773122 ) ) ( not ( = ?auto_773116 ?auto_773123 ) ) ( not ( = ?auto_773116 ?auto_773124 ) ) ( not ( = ?auto_773116 ?auto_773125 ) ) ( not ( = ?auto_773116 ?auto_773126 ) ) ( not ( = ?auto_773116 ?auto_773127 ) ) ( not ( = ?auto_773116 ?auto_773128 ) ) ( not ( = ?auto_773116 ?auto_773129 ) ) ( not ( = ?auto_773116 ?auto_773130 ) ) ( not ( = ?auto_773116 ?auto_773131 ) ) ( not ( = ?auto_773117 ?auto_773118 ) ) ( not ( = ?auto_773117 ?auto_773119 ) ) ( not ( = ?auto_773117 ?auto_773120 ) ) ( not ( = ?auto_773117 ?auto_773121 ) ) ( not ( = ?auto_773117 ?auto_773122 ) ) ( not ( = ?auto_773117 ?auto_773123 ) ) ( not ( = ?auto_773117 ?auto_773124 ) ) ( not ( = ?auto_773117 ?auto_773125 ) ) ( not ( = ?auto_773117 ?auto_773126 ) ) ( not ( = ?auto_773117 ?auto_773127 ) ) ( not ( = ?auto_773117 ?auto_773128 ) ) ( not ( = ?auto_773117 ?auto_773129 ) ) ( not ( = ?auto_773117 ?auto_773130 ) ) ( not ( = ?auto_773117 ?auto_773131 ) ) ( not ( = ?auto_773118 ?auto_773119 ) ) ( not ( = ?auto_773118 ?auto_773120 ) ) ( not ( = ?auto_773118 ?auto_773121 ) ) ( not ( = ?auto_773118 ?auto_773122 ) ) ( not ( = ?auto_773118 ?auto_773123 ) ) ( not ( = ?auto_773118 ?auto_773124 ) ) ( not ( = ?auto_773118 ?auto_773125 ) ) ( not ( = ?auto_773118 ?auto_773126 ) ) ( not ( = ?auto_773118 ?auto_773127 ) ) ( not ( = ?auto_773118 ?auto_773128 ) ) ( not ( = ?auto_773118 ?auto_773129 ) ) ( not ( = ?auto_773118 ?auto_773130 ) ) ( not ( = ?auto_773118 ?auto_773131 ) ) ( not ( = ?auto_773119 ?auto_773120 ) ) ( not ( = ?auto_773119 ?auto_773121 ) ) ( not ( = ?auto_773119 ?auto_773122 ) ) ( not ( = ?auto_773119 ?auto_773123 ) ) ( not ( = ?auto_773119 ?auto_773124 ) ) ( not ( = ?auto_773119 ?auto_773125 ) ) ( not ( = ?auto_773119 ?auto_773126 ) ) ( not ( = ?auto_773119 ?auto_773127 ) ) ( not ( = ?auto_773119 ?auto_773128 ) ) ( not ( = ?auto_773119 ?auto_773129 ) ) ( not ( = ?auto_773119 ?auto_773130 ) ) ( not ( = ?auto_773119 ?auto_773131 ) ) ( not ( = ?auto_773120 ?auto_773121 ) ) ( not ( = ?auto_773120 ?auto_773122 ) ) ( not ( = ?auto_773120 ?auto_773123 ) ) ( not ( = ?auto_773120 ?auto_773124 ) ) ( not ( = ?auto_773120 ?auto_773125 ) ) ( not ( = ?auto_773120 ?auto_773126 ) ) ( not ( = ?auto_773120 ?auto_773127 ) ) ( not ( = ?auto_773120 ?auto_773128 ) ) ( not ( = ?auto_773120 ?auto_773129 ) ) ( not ( = ?auto_773120 ?auto_773130 ) ) ( not ( = ?auto_773120 ?auto_773131 ) ) ( not ( = ?auto_773121 ?auto_773122 ) ) ( not ( = ?auto_773121 ?auto_773123 ) ) ( not ( = ?auto_773121 ?auto_773124 ) ) ( not ( = ?auto_773121 ?auto_773125 ) ) ( not ( = ?auto_773121 ?auto_773126 ) ) ( not ( = ?auto_773121 ?auto_773127 ) ) ( not ( = ?auto_773121 ?auto_773128 ) ) ( not ( = ?auto_773121 ?auto_773129 ) ) ( not ( = ?auto_773121 ?auto_773130 ) ) ( not ( = ?auto_773121 ?auto_773131 ) ) ( not ( = ?auto_773122 ?auto_773123 ) ) ( not ( = ?auto_773122 ?auto_773124 ) ) ( not ( = ?auto_773122 ?auto_773125 ) ) ( not ( = ?auto_773122 ?auto_773126 ) ) ( not ( = ?auto_773122 ?auto_773127 ) ) ( not ( = ?auto_773122 ?auto_773128 ) ) ( not ( = ?auto_773122 ?auto_773129 ) ) ( not ( = ?auto_773122 ?auto_773130 ) ) ( not ( = ?auto_773122 ?auto_773131 ) ) ( not ( = ?auto_773123 ?auto_773124 ) ) ( not ( = ?auto_773123 ?auto_773125 ) ) ( not ( = ?auto_773123 ?auto_773126 ) ) ( not ( = ?auto_773123 ?auto_773127 ) ) ( not ( = ?auto_773123 ?auto_773128 ) ) ( not ( = ?auto_773123 ?auto_773129 ) ) ( not ( = ?auto_773123 ?auto_773130 ) ) ( not ( = ?auto_773123 ?auto_773131 ) ) ( not ( = ?auto_773124 ?auto_773125 ) ) ( not ( = ?auto_773124 ?auto_773126 ) ) ( not ( = ?auto_773124 ?auto_773127 ) ) ( not ( = ?auto_773124 ?auto_773128 ) ) ( not ( = ?auto_773124 ?auto_773129 ) ) ( not ( = ?auto_773124 ?auto_773130 ) ) ( not ( = ?auto_773124 ?auto_773131 ) ) ( not ( = ?auto_773125 ?auto_773126 ) ) ( not ( = ?auto_773125 ?auto_773127 ) ) ( not ( = ?auto_773125 ?auto_773128 ) ) ( not ( = ?auto_773125 ?auto_773129 ) ) ( not ( = ?auto_773125 ?auto_773130 ) ) ( not ( = ?auto_773125 ?auto_773131 ) ) ( not ( = ?auto_773126 ?auto_773127 ) ) ( not ( = ?auto_773126 ?auto_773128 ) ) ( not ( = ?auto_773126 ?auto_773129 ) ) ( not ( = ?auto_773126 ?auto_773130 ) ) ( not ( = ?auto_773126 ?auto_773131 ) ) ( not ( = ?auto_773127 ?auto_773128 ) ) ( not ( = ?auto_773127 ?auto_773129 ) ) ( not ( = ?auto_773127 ?auto_773130 ) ) ( not ( = ?auto_773127 ?auto_773131 ) ) ( not ( = ?auto_773128 ?auto_773129 ) ) ( not ( = ?auto_773128 ?auto_773130 ) ) ( not ( = ?auto_773128 ?auto_773131 ) ) ( not ( = ?auto_773129 ?auto_773130 ) ) ( not ( = ?auto_773129 ?auto_773131 ) ) ( not ( = ?auto_773130 ?auto_773131 ) ) ( ON ?auto_773129 ?auto_773130 ) ( ON ?auto_773128 ?auto_773129 ) ( ON ?auto_773127 ?auto_773128 ) ( ON ?auto_773126 ?auto_773127 ) ( ON ?auto_773125 ?auto_773126 ) ( ON ?auto_773124 ?auto_773125 ) ( ON ?auto_773123 ?auto_773124 ) ( ON ?auto_773122 ?auto_773123 ) ( ON ?auto_773121 ?auto_773122 ) ( ON ?auto_773120 ?auto_773121 ) ( CLEAR ?auto_773118 ) ( ON ?auto_773119 ?auto_773120 ) ( CLEAR ?auto_773119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_773114 ?auto_773115 ?auto_773116 ?auto_773117 ?auto_773118 ?auto_773119 )
      ( MAKE-17PILE ?auto_773114 ?auto_773115 ?auto_773116 ?auto_773117 ?auto_773118 ?auto_773119 ?auto_773120 ?auto_773121 ?auto_773122 ?auto_773123 ?auto_773124 ?auto_773125 ?auto_773126 ?auto_773127 ?auto_773128 ?auto_773129 ?auto_773130 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_773184 - BLOCK
      ?auto_773185 - BLOCK
      ?auto_773186 - BLOCK
      ?auto_773187 - BLOCK
      ?auto_773188 - BLOCK
      ?auto_773189 - BLOCK
      ?auto_773190 - BLOCK
      ?auto_773191 - BLOCK
      ?auto_773192 - BLOCK
      ?auto_773193 - BLOCK
      ?auto_773194 - BLOCK
      ?auto_773195 - BLOCK
      ?auto_773196 - BLOCK
      ?auto_773197 - BLOCK
      ?auto_773198 - BLOCK
      ?auto_773199 - BLOCK
      ?auto_773200 - BLOCK
    )
    :vars
    (
      ?auto_773201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_773200 ?auto_773201 ) ( ON-TABLE ?auto_773184 ) ( ON ?auto_773185 ?auto_773184 ) ( ON ?auto_773186 ?auto_773185 ) ( ON ?auto_773187 ?auto_773186 ) ( not ( = ?auto_773184 ?auto_773185 ) ) ( not ( = ?auto_773184 ?auto_773186 ) ) ( not ( = ?auto_773184 ?auto_773187 ) ) ( not ( = ?auto_773184 ?auto_773188 ) ) ( not ( = ?auto_773184 ?auto_773189 ) ) ( not ( = ?auto_773184 ?auto_773190 ) ) ( not ( = ?auto_773184 ?auto_773191 ) ) ( not ( = ?auto_773184 ?auto_773192 ) ) ( not ( = ?auto_773184 ?auto_773193 ) ) ( not ( = ?auto_773184 ?auto_773194 ) ) ( not ( = ?auto_773184 ?auto_773195 ) ) ( not ( = ?auto_773184 ?auto_773196 ) ) ( not ( = ?auto_773184 ?auto_773197 ) ) ( not ( = ?auto_773184 ?auto_773198 ) ) ( not ( = ?auto_773184 ?auto_773199 ) ) ( not ( = ?auto_773184 ?auto_773200 ) ) ( not ( = ?auto_773184 ?auto_773201 ) ) ( not ( = ?auto_773185 ?auto_773186 ) ) ( not ( = ?auto_773185 ?auto_773187 ) ) ( not ( = ?auto_773185 ?auto_773188 ) ) ( not ( = ?auto_773185 ?auto_773189 ) ) ( not ( = ?auto_773185 ?auto_773190 ) ) ( not ( = ?auto_773185 ?auto_773191 ) ) ( not ( = ?auto_773185 ?auto_773192 ) ) ( not ( = ?auto_773185 ?auto_773193 ) ) ( not ( = ?auto_773185 ?auto_773194 ) ) ( not ( = ?auto_773185 ?auto_773195 ) ) ( not ( = ?auto_773185 ?auto_773196 ) ) ( not ( = ?auto_773185 ?auto_773197 ) ) ( not ( = ?auto_773185 ?auto_773198 ) ) ( not ( = ?auto_773185 ?auto_773199 ) ) ( not ( = ?auto_773185 ?auto_773200 ) ) ( not ( = ?auto_773185 ?auto_773201 ) ) ( not ( = ?auto_773186 ?auto_773187 ) ) ( not ( = ?auto_773186 ?auto_773188 ) ) ( not ( = ?auto_773186 ?auto_773189 ) ) ( not ( = ?auto_773186 ?auto_773190 ) ) ( not ( = ?auto_773186 ?auto_773191 ) ) ( not ( = ?auto_773186 ?auto_773192 ) ) ( not ( = ?auto_773186 ?auto_773193 ) ) ( not ( = ?auto_773186 ?auto_773194 ) ) ( not ( = ?auto_773186 ?auto_773195 ) ) ( not ( = ?auto_773186 ?auto_773196 ) ) ( not ( = ?auto_773186 ?auto_773197 ) ) ( not ( = ?auto_773186 ?auto_773198 ) ) ( not ( = ?auto_773186 ?auto_773199 ) ) ( not ( = ?auto_773186 ?auto_773200 ) ) ( not ( = ?auto_773186 ?auto_773201 ) ) ( not ( = ?auto_773187 ?auto_773188 ) ) ( not ( = ?auto_773187 ?auto_773189 ) ) ( not ( = ?auto_773187 ?auto_773190 ) ) ( not ( = ?auto_773187 ?auto_773191 ) ) ( not ( = ?auto_773187 ?auto_773192 ) ) ( not ( = ?auto_773187 ?auto_773193 ) ) ( not ( = ?auto_773187 ?auto_773194 ) ) ( not ( = ?auto_773187 ?auto_773195 ) ) ( not ( = ?auto_773187 ?auto_773196 ) ) ( not ( = ?auto_773187 ?auto_773197 ) ) ( not ( = ?auto_773187 ?auto_773198 ) ) ( not ( = ?auto_773187 ?auto_773199 ) ) ( not ( = ?auto_773187 ?auto_773200 ) ) ( not ( = ?auto_773187 ?auto_773201 ) ) ( not ( = ?auto_773188 ?auto_773189 ) ) ( not ( = ?auto_773188 ?auto_773190 ) ) ( not ( = ?auto_773188 ?auto_773191 ) ) ( not ( = ?auto_773188 ?auto_773192 ) ) ( not ( = ?auto_773188 ?auto_773193 ) ) ( not ( = ?auto_773188 ?auto_773194 ) ) ( not ( = ?auto_773188 ?auto_773195 ) ) ( not ( = ?auto_773188 ?auto_773196 ) ) ( not ( = ?auto_773188 ?auto_773197 ) ) ( not ( = ?auto_773188 ?auto_773198 ) ) ( not ( = ?auto_773188 ?auto_773199 ) ) ( not ( = ?auto_773188 ?auto_773200 ) ) ( not ( = ?auto_773188 ?auto_773201 ) ) ( not ( = ?auto_773189 ?auto_773190 ) ) ( not ( = ?auto_773189 ?auto_773191 ) ) ( not ( = ?auto_773189 ?auto_773192 ) ) ( not ( = ?auto_773189 ?auto_773193 ) ) ( not ( = ?auto_773189 ?auto_773194 ) ) ( not ( = ?auto_773189 ?auto_773195 ) ) ( not ( = ?auto_773189 ?auto_773196 ) ) ( not ( = ?auto_773189 ?auto_773197 ) ) ( not ( = ?auto_773189 ?auto_773198 ) ) ( not ( = ?auto_773189 ?auto_773199 ) ) ( not ( = ?auto_773189 ?auto_773200 ) ) ( not ( = ?auto_773189 ?auto_773201 ) ) ( not ( = ?auto_773190 ?auto_773191 ) ) ( not ( = ?auto_773190 ?auto_773192 ) ) ( not ( = ?auto_773190 ?auto_773193 ) ) ( not ( = ?auto_773190 ?auto_773194 ) ) ( not ( = ?auto_773190 ?auto_773195 ) ) ( not ( = ?auto_773190 ?auto_773196 ) ) ( not ( = ?auto_773190 ?auto_773197 ) ) ( not ( = ?auto_773190 ?auto_773198 ) ) ( not ( = ?auto_773190 ?auto_773199 ) ) ( not ( = ?auto_773190 ?auto_773200 ) ) ( not ( = ?auto_773190 ?auto_773201 ) ) ( not ( = ?auto_773191 ?auto_773192 ) ) ( not ( = ?auto_773191 ?auto_773193 ) ) ( not ( = ?auto_773191 ?auto_773194 ) ) ( not ( = ?auto_773191 ?auto_773195 ) ) ( not ( = ?auto_773191 ?auto_773196 ) ) ( not ( = ?auto_773191 ?auto_773197 ) ) ( not ( = ?auto_773191 ?auto_773198 ) ) ( not ( = ?auto_773191 ?auto_773199 ) ) ( not ( = ?auto_773191 ?auto_773200 ) ) ( not ( = ?auto_773191 ?auto_773201 ) ) ( not ( = ?auto_773192 ?auto_773193 ) ) ( not ( = ?auto_773192 ?auto_773194 ) ) ( not ( = ?auto_773192 ?auto_773195 ) ) ( not ( = ?auto_773192 ?auto_773196 ) ) ( not ( = ?auto_773192 ?auto_773197 ) ) ( not ( = ?auto_773192 ?auto_773198 ) ) ( not ( = ?auto_773192 ?auto_773199 ) ) ( not ( = ?auto_773192 ?auto_773200 ) ) ( not ( = ?auto_773192 ?auto_773201 ) ) ( not ( = ?auto_773193 ?auto_773194 ) ) ( not ( = ?auto_773193 ?auto_773195 ) ) ( not ( = ?auto_773193 ?auto_773196 ) ) ( not ( = ?auto_773193 ?auto_773197 ) ) ( not ( = ?auto_773193 ?auto_773198 ) ) ( not ( = ?auto_773193 ?auto_773199 ) ) ( not ( = ?auto_773193 ?auto_773200 ) ) ( not ( = ?auto_773193 ?auto_773201 ) ) ( not ( = ?auto_773194 ?auto_773195 ) ) ( not ( = ?auto_773194 ?auto_773196 ) ) ( not ( = ?auto_773194 ?auto_773197 ) ) ( not ( = ?auto_773194 ?auto_773198 ) ) ( not ( = ?auto_773194 ?auto_773199 ) ) ( not ( = ?auto_773194 ?auto_773200 ) ) ( not ( = ?auto_773194 ?auto_773201 ) ) ( not ( = ?auto_773195 ?auto_773196 ) ) ( not ( = ?auto_773195 ?auto_773197 ) ) ( not ( = ?auto_773195 ?auto_773198 ) ) ( not ( = ?auto_773195 ?auto_773199 ) ) ( not ( = ?auto_773195 ?auto_773200 ) ) ( not ( = ?auto_773195 ?auto_773201 ) ) ( not ( = ?auto_773196 ?auto_773197 ) ) ( not ( = ?auto_773196 ?auto_773198 ) ) ( not ( = ?auto_773196 ?auto_773199 ) ) ( not ( = ?auto_773196 ?auto_773200 ) ) ( not ( = ?auto_773196 ?auto_773201 ) ) ( not ( = ?auto_773197 ?auto_773198 ) ) ( not ( = ?auto_773197 ?auto_773199 ) ) ( not ( = ?auto_773197 ?auto_773200 ) ) ( not ( = ?auto_773197 ?auto_773201 ) ) ( not ( = ?auto_773198 ?auto_773199 ) ) ( not ( = ?auto_773198 ?auto_773200 ) ) ( not ( = ?auto_773198 ?auto_773201 ) ) ( not ( = ?auto_773199 ?auto_773200 ) ) ( not ( = ?auto_773199 ?auto_773201 ) ) ( not ( = ?auto_773200 ?auto_773201 ) ) ( ON ?auto_773199 ?auto_773200 ) ( ON ?auto_773198 ?auto_773199 ) ( ON ?auto_773197 ?auto_773198 ) ( ON ?auto_773196 ?auto_773197 ) ( ON ?auto_773195 ?auto_773196 ) ( ON ?auto_773194 ?auto_773195 ) ( ON ?auto_773193 ?auto_773194 ) ( ON ?auto_773192 ?auto_773193 ) ( ON ?auto_773191 ?auto_773192 ) ( ON ?auto_773190 ?auto_773191 ) ( ON ?auto_773189 ?auto_773190 ) ( CLEAR ?auto_773187 ) ( ON ?auto_773188 ?auto_773189 ) ( CLEAR ?auto_773188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_773184 ?auto_773185 ?auto_773186 ?auto_773187 ?auto_773188 )
      ( MAKE-17PILE ?auto_773184 ?auto_773185 ?auto_773186 ?auto_773187 ?auto_773188 ?auto_773189 ?auto_773190 ?auto_773191 ?auto_773192 ?auto_773193 ?auto_773194 ?auto_773195 ?auto_773196 ?auto_773197 ?auto_773198 ?auto_773199 ?auto_773200 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_773254 - BLOCK
      ?auto_773255 - BLOCK
      ?auto_773256 - BLOCK
      ?auto_773257 - BLOCK
      ?auto_773258 - BLOCK
      ?auto_773259 - BLOCK
      ?auto_773260 - BLOCK
      ?auto_773261 - BLOCK
      ?auto_773262 - BLOCK
      ?auto_773263 - BLOCK
      ?auto_773264 - BLOCK
      ?auto_773265 - BLOCK
      ?auto_773266 - BLOCK
      ?auto_773267 - BLOCK
      ?auto_773268 - BLOCK
      ?auto_773269 - BLOCK
      ?auto_773270 - BLOCK
    )
    :vars
    (
      ?auto_773271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_773270 ?auto_773271 ) ( ON-TABLE ?auto_773254 ) ( ON ?auto_773255 ?auto_773254 ) ( ON ?auto_773256 ?auto_773255 ) ( not ( = ?auto_773254 ?auto_773255 ) ) ( not ( = ?auto_773254 ?auto_773256 ) ) ( not ( = ?auto_773254 ?auto_773257 ) ) ( not ( = ?auto_773254 ?auto_773258 ) ) ( not ( = ?auto_773254 ?auto_773259 ) ) ( not ( = ?auto_773254 ?auto_773260 ) ) ( not ( = ?auto_773254 ?auto_773261 ) ) ( not ( = ?auto_773254 ?auto_773262 ) ) ( not ( = ?auto_773254 ?auto_773263 ) ) ( not ( = ?auto_773254 ?auto_773264 ) ) ( not ( = ?auto_773254 ?auto_773265 ) ) ( not ( = ?auto_773254 ?auto_773266 ) ) ( not ( = ?auto_773254 ?auto_773267 ) ) ( not ( = ?auto_773254 ?auto_773268 ) ) ( not ( = ?auto_773254 ?auto_773269 ) ) ( not ( = ?auto_773254 ?auto_773270 ) ) ( not ( = ?auto_773254 ?auto_773271 ) ) ( not ( = ?auto_773255 ?auto_773256 ) ) ( not ( = ?auto_773255 ?auto_773257 ) ) ( not ( = ?auto_773255 ?auto_773258 ) ) ( not ( = ?auto_773255 ?auto_773259 ) ) ( not ( = ?auto_773255 ?auto_773260 ) ) ( not ( = ?auto_773255 ?auto_773261 ) ) ( not ( = ?auto_773255 ?auto_773262 ) ) ( not ( = ?auto_773255 ?auto_773263 ) ) ( not ( = ?auto_773255 ?auto_773264 ) ) ( not ( = ?auto_773255 ?auto_773265 ) ) ( not ( = ?auto_773255 ?auto_773266 ) ) ( not ( = ?auto_773255 ?auto_773267 ) ) ( not ( = ?auto_773255 ?auto_773268 ) ) ( not ( = ?auto_773255 ?auto_773269 ) ) ( not ( = ?auto_773255 ?auto_773270 ) ) ( not ( = ?auto_773255 ?auto_773271 ) ) ( not ( = ?auto_773256 ?auto_773257 ) ) ( not ( = ?auto_773256 ?auto_773258 ) ) ( not ( = ?auto_773256 ?auto_773259 ) ) ( not ( = ?auto_773256 ?auto_773260 ) ) ( not ( = ?auto_773256 ?auto_773261 ) ) ( not ( = ?auto_773256 ?auto_773262 ) ) ( not ( = ?auto_773256 ?auto_773263 ) ) ( not ( = ?auto_773256 ?auto_773264 ) ) ( not ( = ?auto_773256 ?auto_773265 ) ) ( not ( = ?auto_773256 ?auto_773266 ) ) ( not ( = ?auto_773256 ?auto_773267 ) ) ( not ( = ?auto_773256 ?auto_773268 ) ) ( not ( = ?auto_773256 ?auto_773269 ) ) ( not ( = ?auto_773256 ?auto_773270 ) ) ( not ( = ?auto_773256 ?auto_773271 ) ) ( not ( = ?auto_773257 ?auto_773258 ) ) ( not ( = ?auto_773257 ?auto_773259 ) ) ( not ( = ?auto_773257 ?auto_773260 ) ) ( not ( = ?auto_773257 ?auto_773261 ) ) ( not ( = ?auto_773257 ?auto_773262 ) ) ( not ( = ?auto_773257 ?auto_773263 ) ) ( not ( = ?auto_773257 ?auto_773264 ) ) ( not ( = ?auto_773257 ?auto_773265 ) ) ( not ( = ?auto_773257 ?auto_773266 ) ) ( not ( = ?auto_773257 ?auto_773267 ) ) ( not ( = ?auto_773257 ?auto_773268 ) ) ( not ( = ?auto_773257 ?auto_773269 ) ) ( not ( = ?auto_773257 ?auto_773270 ) ) ( not ( = ?auto_773257 ?auto_773271 ) ) ( not ( = ?auto_773258 ?auto_773259 ) ) ( not ( = ?auto_773258 ?auto_773260 ) ) ( not ( = ?auto_773258 ?auto_773261 ) ) ( not ( = ?auto_773258 ?auto_773262 ) ) ( not ( = ?auto_773258 ?auto_773263 ) ) ( not ( = ?auto_773258 ?auto_773264 ) ) ( not ( = ?auto_773258 ?auto_773265 ) ) ( not ( = ?auto_773258 ?auto_773266 ) ) ( not ( = ?auto_773258 ?auto_773267 ) ) ( not ( = ?auto_773258 ?auto_773268 ) ) ( not ( = ?auto_773258 ?auto_773269 ) ) ( not ( = ?auto_773258 ?auto_773270 ) ) ( not ( = ?auto_773258 ?auto_773271 ) ) ( not ( = ?auto_773259 ?auto_773260 ) ) ( not ( = ?auto_773259 ?auto_773261 ) ) ( not ( = ?auto_773259 ?auto_773262 ) ) ( not ( = ?auto_773259 ?auto_773263 ) ) ( not ( = ?auto_773259 ?auto_773264 ) ) ( not ( = ?auto_773259 ?auto_773265 ) ) ( not ( = ?auto_773259 ?auto_773266 ) ) ( not ( = ?auto_773259 ?auto_773267 ) ) ( not ( = ?auto_773259 ?auto_773268 ) ) ( not ( = ?auto_773259 ?auto_773269 ) ) ( not ( = ?auto_773259 ?auto_773270 ) ) ( not ( = ?auto_773259 ?auto_773271 ) ) ( not ( = ?auto_773260 ?auto_773261 ) ) ( not ( = ?auto_773260 ?auto_773262 ) ) ( not ( = ?auto_773260 ?auto_773263 ) ) ( not ( = ?auto_773260 ?auto_773264 ) ) ( not ( = ?auto_773260 ?auto_773265 ) ) ( not ( = ?auto_773260 ?auto_773266 ) ) ( not ( = ?auto_773260 ?auto_773267 ) ) ( not ( = ?auto_773260 ?auto_773268 ) ) ( not ( = ?auto_773260 ?auto_773269 ) ) ( not ( = ?auto_773260 ?auto_773270 ) ) ( not ( = ?auto_773260 ?auto_773271 ) ) ( not ( = ?auto_773261 ?auto_773262 ) ) ( not ( = ?auto_773261 ?auto_773263 ) ) ( not ( = ?auto_773261 ?auto_773264 ) ) ( not ( = ?auto_773261 ?auto_773265 ) ) ( not ( = ?auto_773261 ?auto_773266 ) ) ( not ( = ?auto_773261 ?auto_773267 ) ) ( not ( = ?auto_773261 ?auto_773268 ) ) ( not ( = ?auto_773261 ?auto_773269 ) ) ( not ( = ?auto_773261 ?auto_773270 ) ) ( not ( = ?auto_773261 ?auto_773271 ) ) ( not ( = ?auto_773262 ?auto_773263 ) ) ( not ( = ?auto_773262 ?auto_773264 ) ) ( not ( = ?auto_773262 ?auto_773265 ) ) ( not ( = ?auto_773262 ?auto_773266 ) ) ( not ( = ?auto_773262 ?auto_773267 ) ) ( not ( = ?auto_773262 ?auto_773268 ) ) ( not ( = ?auto_773262 ?auto_773269 ) ) ( not ( = ?auto_773262 ?auto_773270 ) ) ( not ( = ?auto_773262 ?auto_773271 ) ) ( not ( = ?auto_773263 ?auto_773264 ) ) ( not ( = ?auto_773263 ?auto_773265 ) ) ( not ( = ?auto_773263 ?auto_773266 ) ) ( not ( = ?auto_773263 ?auto_773267 ) ) ( not ( = ?auto_773263 ?auto_773268 ) ) ( not ( = ?auto_773263 ?auto_773269 ) ) ( not ( = ?auto_773263 ?auto_773270 ) ) ( not ( = ?auto_773263 ?auto_773271 ) ) ( not ( = ?auto_773264 ?auto_773265 ) ) ( not ( = ?auto_773264 ?auto_773266 ) ) ( not ( = ?auto_773264 ?auto_773267 ) ) ( not ( = ?auto_773264 ?auto_773268 ) ) ( not ( = ?auto_773264 ?auto_773269 ) ) ( not ( = ?auto_773264 ?auto_773270 ) ) ( not ( = ?auto_773264 ?auto_773271 ) ) ( not ( = ?auto_773265 ?auto_773266 ) ) ( not ( = ?auto_773265 ?auto_773267 ) ) ( not ( = ?auto_773265 ?auto_773268 ) ) ( not ( = ?auto_773265 ?auto_773269 ) ) ( not ( = ?auto_773265 ?auto_773270 ) ) ( not ( = ?auto_773265 ?auto_773271 ) ) ( not ( = ?auto_773266 ?auto_773267 ) ) ( not ( = ?auto_773266 ?auto_773268 ) ) ( not ( = ?auto_773266 ?auto_773269 ) ) ( not ( = ?auto_773266 ?auto_773270 ) ) ( not ( = ?auto_773266 ?auto_773271 ) ) ( not ( = ?auto_773267 ?auto_773268 ) ) ( not ( = ?auto_773267 ?auto_773269 ) ) ( not ( = ?auto_773267 ?auto_773270 ) ) ( not ( = ?auto_773267 ?auto_773271 ) ) ( not ( = ?auto_773268 ?auto_773269 ) ) ( not ( = ?auto_773268 ?auto_773270 ) ) ( not ( = ?auto_773268 ?auto_773271 ) ) ( not ( = ?auto_773269 ?auto_773270 ) ) ( not ( = ?auto_773269 ?auto_773271 ) ) ( not ( = ?auto_773270 ?auto_773271 ) ) ( ON ?auto_773269 ?auto_773270 ) ( ON ?auto_773268 ?auto_773269 ) ( ON ?auto_773267 ?auto_773268 ) ( ON ?auto_773266 ?auto_773267 ) ( ON ?auto_773265 ?auto_773266 ) ( ON ?auto_773264 ?auto_773265 ) ( ON ?auto_773263 ?auto_773264 ) ( ON ?auto_773262 ?auto_773263 ) ( ON ?auto_773261 ?auto_773262 ) ( ON ?auto_773260 ?auto_773261 ) ( ON ?auto_773259 ?auto_773260 ) ( ON ?auto_773258 ?auto_773259 ) ( CLEAR ?auto_773256 ) ( ON ?auto_773257 ?auto_773258 ) ( CLEAR ?auto_773257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_773254 ?auto_773255 ?auto_773256 ?auto_773257 )
      ( MAKE-17PILE ?auto_773254 ?auto_773255 ?auto_773256 ?auto_773257 ?auto_773258 ?auto_773259 ?auto_773260 ?auto_773261 ?auto_773262 ?auto_773263 ?auto_773264 ?auto_773265 ?auto_773266 ?auto_773267 ?auto_773268 ?auto_773269 ?auto_773270 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_773324 - BLOCK
      ?auto_773325 - BLOCK
      ?auto_773326 - BLOCK
      ?auto_773327 - BLOCK
      ?auto_773328 - BLOCK
      ?auto_773329 - BLOCK
      ?auto_773330 - BLOCK
      ?auto_773331 - BLOCK
      ?auto_773332 - BLOCK
      ?auto_773333 - BLOCK
      ?auto_773334 - BLOCK
      ?auto_773335 - BLOCK
      ?auto_773336 - BLOCK
      ?auto_773337 - BLOCK
      ?auto_773338 - BLOCK
      ?auto_773339 - BLOCK
      ?auto_773340 - BLOCK
    )
    :vars
    (
      ?auto_773341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_773340 ?auto_773341 ) ( ON-TABLE ?auto_773324 ) ( ON ?auto_773325 ?auto_773324 ) ( not ( = ?auto_773324 ?auto_773325 ) ) ( not ( = ?auto_773324 ?auto_773326 ) ) ( not ( = ?auto_773324 ?auto_773327 ) ) ( not ( = ?auto_773324 ?auto_773328 ) ) ( not ( = ?auto_773324 ?auto_773329 ) ) ( not ( = ?auto_773324 ?auto_773330 ) ) ( not ( = ?auto_773324 ?auto_773331 ) ) ( not ( = ?auto_773324 ?auto_773332 ) ) ( not ( = ?auto_773324 ?auto_773333 ) ) ( not ( = ?auto_773324 ?auto_773334 ) ) ( not ( = ?auto_773324 ?auto_773335 ) ) ( not ( = ?auto_773324 ?auto_773336 ) ) ( not ( = ?auto_773324 ?auto_773337 ) ) ( not ( = ?auto_773324 ?auto_773338 ) ) ( not ( = ?auto_773324 ?auto_773339 ) ) ( not ( = ?auto_773324 ?auto_773340 ) ) ( not ( = ?auto_773324 ?auto_773341 ) ) ( not ( = ?auto_773325 ?auto_773326 ) ) ( not ( = ?auto_773325 ?auto_773327 ) ) ( not ( = ?auto_773325 ?auto_773328 ) ) ( not ( = ?auto_773325 ?auto_773329 ) ) ( not ( = ?auto_773325 ?auto_773330 ) ) ( not ( = ?auto_773325 ?auto_773331 ) ) ( not ( = ?auto_773325 ?auto_773332 ) ) ( not ( = ?auto_773325 ?auto_773333 ) ) ( not ( = ?auto_773325 ?auto_773334 ) ) ( not ( = ?auto_773325 ?auto_773335 ) ) ( not ( = ?auto_773325 ?auto_773336 ) ) ( not ( = ?auto_773325 ?auto_773337 ) ) ( not ( = ?auto_773325 ?auto_773338 ) ) ( not ( = ?auto_773325 ?auto_773339 ) ) ( not ( = ?auto_773325 ?auto_773340 ) ) ( not ( = ?auto_773325 ?auto_773341 ) ) ( not ( = ?auto_773326 ?auto_773327 ) ) ( not ( = ?auto_773326 ?auto_773328 ) ) ( not ( = ?auto_773326 ?auto_773329 ) ) ( not ( = ?auto_773326 ?auto_773330 ) ) ( not ( = ?auto_773326 ?auto_773331 ) ) ( not ( = ?auto_773326 ?auto_773332 ) ) ( not ( = ?auto_773326 ?auto_773333 ) ) ( not ( = ?auto_773326 ?auto_773334 ) ) ( not ( = ?auto_773326 ?auto_773335 ) ) ( not ( = ?auto_773326 ?auto_773336 ) ) ( not ( = ?auto_773326 ?auto_773337 ) ) ( not ( = ?auto_773326 ?auto_773338 ) ) ( not ( = ?auto_773326 ?auto_773339 ) ) ( not ( = ?auto_773326 ?auto_773340 ) ) ( not ( = ?auto_773326 ?auto_773341 ) ) ( not ( = ?auto_773327 ?auto_773328 ) ) ( not ( = ?auto_773327 ?auto_773329 ) ) ( not ( = ?auto_773327 ?auto_773330 ) ) ( not ( = ?auto_773327 ?auto_773331 ) ) ( not ( = ?auto_773327 ?auto_773332 ) ) ( not ( = ?auto_773327 ?auto_773333 ) ) ( not ( = ?auto_773327 ?auto_773334 ) ) ( not ( = ?auto_773327 ?auto_773335 ) ) ( not ( = ?auto_773327 ?auto_773336 ) ) ( not ( = ?auto_773327 ?auto_773337 ) ) ( not ( = ?auto_773327 ?auto_773338 ) ) ( not ( = ?auto_773327 ?auto_773339 ) ) ( not ( = ?auto_773327 ?auto_773340 ) ) ( not ( = ?auto_773327 ?auto_773341 ) ) ( not ( = ?auto_773328 ?auto_773329 ) ) ( not ( = ?auto_773328 ?auto_773330 ) ) ( not ( = ?auto_773328 ?auto_773331 ) ) ( not ( = ?auto_773328 ?auto_773332 ) ) ( not ( = ?auto_773328 ?auto_773333 ) ) ( not ( = ?auto_773328 ?auto_773334 ) ) ( not ( = ?auto_773328 ?auto_773335 ) ) ( not ( = ?auto_773328 ?auto_773336 ) ) ( not ( = ?auto_773328 ?auto_773337 ) ) ( not ( = ?auto_773328 ?auto_773338 ) ) ( not ( = ?auto_773328 ?auto_773339 ) ) ( not ( = ?auto_773328 ?auto_773340 ) ) ( not ( = ?auto_773328 ?auto_773341 ) ) ( not ( = ?auto_773329 ?auto_773330 ) ) ( not ( = ?auto_773329 ?auto_773331 ) ) ( not ( = ?auto_773329 ?auto_773332 ) ) ( not ( = ?auto_773329 ?auto_773333 ) ) ( not ( = ?auto_773329 ?auto_773334 ) ) ( not ( = ?auto_773329 ?auto_773335 ) ) ( not ( = ?auto_773329 ?auto_773336 ) ) ( not ( = ?auto_773329 ?auto_773337 ) ) ( not ( = ?auto_773329 ?auto_773338 ) ) ( not ( = ?auto_773329 ?auto_773339 ) ) ( not ( = ?auto_773329 ?auto_773340 ) ) ( not ( = ?auto_773329 ?auto_773341 ) ) ( not ( = ?auto_773330 ?auto_773331 ) ) ( not ( = ?auto_773330 ?auto_773332 ) ) ( not ( = ?auto_773330 ?auto_773333 ) ) ( not ( = ?auto_773330 ?auto_773334 ) ) ( not ( = ?auto_773330 ?auto_773335 ) ) ( not ( = ?auto_773330 ?auto_773336 ) ) ( not ( = ?auto_773330 ?auto_773337 ) ) ( not ( = ?auto_773330 ?auto_773338 ) ) ( not ( = ?auto_773330 ?auto_773339 ) ) ( not ( = ?auto_773330 ?auto_773340 ) ) ( not ( = ?auto_773330 ?auto_773341 ) ) ( not ( = ?auto_773331 ?auto_773332 ) ) ( not ( = ?auto_773331 ?auto_773333 ) ) ( not ( = ?auto_773331 ?auto_773334 ) ) ( not ( = ?auto_773331 ?auto_773335 ) ) ( not ( = ?auto_773331 ?auto_773336 ) ) ( not ( = ?auto_773331 ?auto_773337 ) ) ( not ( = ?auto_773331 ?auto_773338 ) ) ( not ( = ?auto_773331 ?auto_773339 ) ) ( not ( = ?auto_773331 ?auto_773340 ) ) ( not ( = ?auto_773331 ?auto_773341 ) ) ( not ( = ?auto_773332 ?auto_773333 ) ) ( not ( = ?auto_773332 ?auto_773334 ) ) ( not ( = ?auto_773332 ?auto_773335 ) ) ( not ( = ?auto_773332 ?auto_773336 ) ) ( not ( = ?auto_773332 ?auto_773337 ) ) ( not ( = ?auto_773332 ?auto_773338 ) ) ( not ( = ?auto_773332 ?auto_773339 ) ) ( not ( = ?auto_773332 ?auto_773340 ) ) ( not ( = ?auto_773332 ?auto_773341 ) ) ( not ( = ?auto_773333 ?auto_773334 ) ) ( not ( = ?auto_773333 ?auto_773335 ) ) ( not ( = ?auto_773333 ?auto_773336 ) ) ( not ( = ?auto_773333 ?auto_773337 ) ) ( not ( = ?auto_773333 ?auto_773338 ) ) ( not ( = ?auto_773333 ?auto_773339 ) ) ( not ( = ?auto_773333 ?auto_773340 ) ) ( not ( = ?auto_773333 ?auto_773341 ) ) ( not ( = ?auto_773334 ?auto_773335 ) ) ( not ( = ?auto_773334 ?auto_773336 ) ) ( not ( = ?auto_773334 ?auto_773337 ) ) ( not ( = ?auto_773334 ?auto_773338 ) ) ( not ( = ?auto_773334 ?auto_773339 ) ) ( not ( = ?auto_773334 ?auto_773340 ) ) ( not ( = ?auto_773334 ?auto_773341 ) ) ( not ( = ?auto_773335 ?auto_773336 ) ) ( not ( = ?auto_773335 ?auto_773337 ) ) ( not ( = ?auto_773335 ?auto_773338 ) ) ( not ( = ?auto_773335 ?auto_773339 ) ) ( not ( = ?auto_773335 ?auto_773340 ) ) ( not ( = ?auto_773335 ?auto_773341 ) ) ( not ( = ?auto_773336 ?auto_773337 ) ) ( not ( = ?auto_773336 ?auto_773338 ) ) ( not ( = ?auto_773336 ?auto_773339 ) ) ( not ( = ?auto_773336 ?auto_773340 ) ) ( not ( = ?auto_773336 ?auto_773341 ) ) ( not ( = ?auto_773337 ?auto_773338 ) ) ( not ( = ?auto_773337 ?auto_773339 ) ) ( not ( = ?auto_773337 ?auto_773340 ) ) ( not ( = ?auto_773337 ?auto_773341 ) ) ( not ( = ?auto_773338 ?auto_773339 ) ) ( not ( = ?auto_773338 ?auto_773340 ) ) ( not ( = ?auto_773338 ?auto_773341 ) ) ( not ( = ?auto_773339 ?auto_773340 ) ) ( not ( = ?auto_773339 ?auto_773341 ) ) ( not ( = ?auto_773340 ?auto_773341 ) ) ( ON ?auto_773339 ?auto_773340 ) ( ON ?auto_773338 ?auto_773339 ) ( ON ?auto_773337 ?auto_773338 ) ( ON ?auto_773336 ?auto_773337 ) ( ON ?auto_773335 ?auto_773336 ) ( ON ?auto_773334 ?auto_773335 ) ( ON ?auto_773333 ?auto_773334 ) ( ON ?auto_773332 ?auto_773333 ) ( ON ?auto_773331 ?auto_773332 ) ( ON ?auto_773330 ?auto_773331 ) ( ON ?auto_773329 ?auto_773330 ) ( ON ?auto_773328 ?auto_773329 ) ( ON ?auto_773327 ?auto_773328 ) ( CLEAR ?auto_773325 ) ( ON ?auto_773326 ?auto_773327 ) ( CLEAR ?auto_773326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_773324 ?auto_773325 ?auto_773326 )
      ( MAKE-17PILE ?auto_773324 ?auto_773325 ?auto_773326 ?auto_773327 ?auto_773328 ?auto_773329 ?auto_773330 ?auto_773331 ?auto_773332 ?auto_773333 ?auto_773334 ?auto_773335 ?auto_773336 ?auto_773337 ?auto_773338 ?auto_773339 ?auto_773340 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_773394 - BLOCK
      ?auto_773395 - BLOCK
      ?auto_773396 - BLOCK
      ?auto_773397 - BLOCK
      ?auto_773398 - BLOCK
      ?auto_773399 - BLOCK
      ?auto_773400 - BLOCK
      ?auto_773401 - BLOCK
      ?auto_773402 - BLOCK
      ?auto_773403 - BLOCK
      ?auto_773404 - BLOCK
      ?auto_773405 - BLOCK
      ?auto_773406 - BLOCK
      ?auto_773407 - BLOCK
      ?auto_773408 - BLOCK
      ?auto_773409 - BLOCK
      ?auto_773410 - BLOCK
    )
    :vars
    (
      ?auto_773411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_773410 ?auto_773411 ) ( ON-TABLE ?auto_773394 ) ( not ( = ?auto_773394 ?auto_773395 ) ) ( not ( = ?auto_773394 ?auto_773396 ) ) ( not ( = ?auto_773394 ?auto_773397 ) ) ( not ( = ?auto_773394 ?auto_773398 ) ) ( not ( = ?auto_773394 ?auto_773399 ) ) ( not ( = ?auto_773394 ?auto_773400 ) ) ( not ( = ?auto_773394 ?auto_773401 ) ) ( not ( = ?auto_773394 ?auto_773402 ) ) ( not ( = ?auto_773394 ?auto_773403 ) ) ( not ( = ?auto_773394 ?auto_773404 ) ) ( not ( = ?auto_773394 ?auto_773405 ) ) ( not ( = ?auto_773394 ?auto_773406 ) ) ( not ( = ?auto_773394 ?auto_773407 ) ) ( not ( = ?auto_773394 ?auto_773408 ) ) ( not ( = ?auto_773394 ?auto_773409 ) ) ( not ( = ?auto_773394 ?auto_773410 ) ) ( not ( = ?auto_773394 ?auto_773411 ) ) ( not ( = ?auto_773395 ?auto_773396 ) ) ( not ( = ?auto_773395 ?auto_773397 ) ) ( not ( = ?auto_773395 ?auto_773398 ) ) ( not ( = ?auto_773395 ?auto_773399 ) ) ( not ( = ?auto_773395 ?auto_773400 ) ) ( not ( = ?auto_773395 ?auto_773401 ) ) ( not ( = ?auto_773395 ?auto_773402 ) ) ( not ( = ?auto_773395 ?auto_773403 ) ) ( not ( = ?auto_773395 ?auto_773404 ) ) ( not ( = ?auto_773395 ?auto_773405 ) ) ( not ( = ?auto_773395 ?auto_773406 ) ) ( not ( = ?auto_773395 ?auto_773407 ) ) ( not ( = ?auto_773395 ?auto_773408 ) ) ( not ( = ?auto_773395 ?auto_773409 ) ) ( not ( = ?auto_773395 ?auto_773410 ) ) ( not ( = ?auto_773395 ?auto_773411 ) ) ( not ( = ?auto_773396 ?auto_773397 ) ) ( not ( = ?auto_773396 ?auto_773398 ) ) ( not ( = ?auto_773396 ?auto_773399 ) ) ( not ( = ?auto_773396 ?auto_773400 ) ) ( not ( = ?auto_773396 ?auto_773401 ) ) ( not ( = ?auto_773396 ?auto_773402 ) ) ( not ( = ?auto_773396 ?auto_773403 ) ) ( not ( = ?auto_773396 ?auto_773404 ) ) ( not ( = ?auto_773396 ?auto_773405 ) ) ( not ( = ?auto_773396 ?auto_773406 ) ) ( not ( = ?auto_773396 ?auto_773407 ) ) ( not ( = ?auto_773396 ?auto_773408 ) ) ( not ( = ?auto_773396 ?auto_773409 ) ) ( not ( = ?auto_773396 ?auto_773410 ) ) ( not ( = ?auto_773396 ?auto_773411 ) ) ( not ( = ?auto_773397 ?auto_773398 ) ) ( not ( = ?auto_773397 ?auto_773399 ) ) ( not ( = ?auto_773397 ?auto_773400 ) ) ( not ( = ?auto_773397 ?auto_773401 ) ) ( not ( = ?auto_773397 ?auto_773402 ) ) ( not ( = ?auto_773397 ?auto_773403 ) ) ( not ( = ?auto_773397 ?auto_773404 ) ) ( not ( = ?auto_773397 ?auto_773405 ) ) ( not ( = ?auto_773397 ?auto_773406 ) ) ( not ( = ?auto_773397 ?auto_773407 ) ) ( not ( = ?auto_773397 ?auto_773408 ) ) ( not ( = ?auto_773397 ?auto_773409 ) ) ( not ( = ?auto_773397 ?auto_773410 ) ) ( not ( = ?auto_773397 ?auto_773411 ) ) ( not ( = ?auto_773398 ?auto_773399 ) ) ( not ( = ?auto_773398 ?auto_773400 ) ) ( not ( = ?auto_773398 ?auto_773401 ) ) ( not ( = ?auto_773398 ?auto_773402 ) ) ( not ( = ?auto_773398 ?auto_773403 ) ) ( not ( = ?auto_773398 ?auto_773404 ) ) ( not ( = ?auto_773398 ?auto_773405 ) ) ( not ( = ?auto_773398 ?auto_773406 ) ) ( not ( = ?auto_773398 ?auto_773407 ) ) ( not ( = ?auto_773398 ?auto_773408 ) ) ( not ( = ?auto_773398 ?auto_773409 ) ) ( not ( = ?auto_773398 ?auto_773410 ) ) ( not ( = ?auto_773398 ?auto_773411 ) ) ( not ( = ?auto_773399 ?auto_773400 ) ) ( not ( = ?auto_773399 ?auto_773401 ) ) ( not ( = ?auto_773399 ?auto_773402 ) ) ( not ( = ?auto_773399 ?auto_773403 ) ) ( not ( = ?auto_773399 ?auto_773404 ) ) ( not ( = ?auto_773399 ?auto_773405 ) ) ( not ( = ?auto_773399 ?auto_773406 ) ) ( not ( = ?auto_773399 ?auto_773407 ) ) ( not ( = ?auto_773399 ?auto_773408 ) ) ( not ( = ?auto_773399 ?auto_773409 ) ) ( not ( = ?auto_773399 ?auto_773410 ) ) ( not ( = ?auto_773399 ?auto_773411 ) ) ( not ( = ?auto_773400 ?auto_773401 ) ) ( not ( = ?auto_773400 ?auto_773402 ) ) ( not ( = ?auto_773400 ?auto_773403 ) ) ( not ( = ?auto_773400 ?auto_773404 ) ) ( not ( = ?auto_773400 ?auto_773405 ) ) ( not ( = ?auto_773400 ?auto_773406 ) ) ( not ( = ?auto_773400 ?auto_773407 ) ) ( not ( = ?auto_773400 ?auto_773408 ) ) ( not ( = ?auto_773400 ?auto_773409 ) ) ( not ( = ?auto_773400 ?auto_773410 ) ) ( not ( = ?auto_773400 ?auto_773411 ) ) ( not ( = ?auto_773401 ?auto_773402 ) ) ( not ( = ?auto_773401 ?auto_773403 ) ) ( not ( = ?auto_773401 ?auto_773404 ) ) ( not ( = ?auto_773401 ?auto_773405 ) ) ( not ( = ?auto_773401 ?auto_773406 ) ) ( not ( = ?auto_773401 ?auto_773407 ) ) ( not ( = ?auto_773401 ?auto_773408 ) ) ( not ( = ?auto_773401 ?auto_773409 ) ) ( not ( = ?auto_773401 ?auto_773410 ) ) ( not ( = ?auto_773401 ?auto_773411 ) ) ( not ( = ?auto_773402 ?auto_773403 ) ) ( not ( = ?auto_773402 ?auto_773404 ) ) ( not ( = ?auto_773402 ?auto_773405 ) ) ( not ( = ?auto_773402 ?auto_773406 ) ) ( not ( = ?auto_773402 ?auto_773407 ) ) ( not ( = ?auto_773402 ?auto_773408 ) ) ( not ( = ?auto_773402 ?auto_773409 ) ) ( not ( = ?auto_773402 ?auto_773410 ) ) ( not ( = ?auto_773402 ?auto_773411 ) ) ( not ( = ?auto_773403 ?auto_773404 ) ) ( not ( = ?auto_773403 ?auto_773405 ) ) ( not ( = ?auto_773403 ?auto_773406 ) ) ( not ( = ?auto_773403 ?auto_773407 ) ) ( not ( = ?auto_773403 ?auto_773408 ) ) ( not ( = ?auto_773403 ?auto_773409 ) ) ( not ( = ?auto_773403 ?auto_773410 ) ) ( not ( = ?auto_773403 ?auto_773411 ) ) ( not ( = ?auto_773404 ?auto_773405 ) ) ( not ( = ?auto_773404 ?auto_773406 ) ) ( not ( = ?auto_773404 ?auto_773407 ) ) ( not ( = ?auto_773404 ?auto_773408 ) ) ( not ( = ?auto_773404 ?auto_773409 ) ) ( not ( = ?auto_773404 ?auto_773410 ) ) ( not ( = ?auto_773404 ?auto_773411 ) ) ( not ( = ?auto_773405 ?auto_773406 ) ) ( not ( = ?auto_773405 ?auto_773407 ) ) ( not ( = ?auto_773405 ?auto_773408 ) ) ( not ( = ?auto_773405 ?auto_773409 ) ) ( not ( = ?auto_773405 ?auto_773410 ) ) ( not ( = ?auto_773405 ?auto_773411 ) ) ( not ( = ?auto_773406 ?auto_773407 ) ) ( not ( = ?auto_773406 ?auto_773408 ) ) ( not ( = ?auto_773406 ?auto_773409 ) ) ( not ( = ?auto_773406 ?auto_773410 ) ) ( not ( = ?auto_773406 ?auto_773411 ) ) ( not ( = ?auto_773407 ?auto_773408 ) ) ( not ( = ?auto_773407 ?auto_773409 ) ) ( not ( = ?auto_773407 ?auto_773410 ) ) ( not ( = ?auto_773407 ?auto_773411 ) ) ( not ( = ?auto_773408 ?auto_773409 ) ) ( not ( = ?auto_773408 ?auto_773410 ) ) ( not ( = ?auto_773408 ?auto_773411 ) ) ( not ( = ?auto_773409 ?auto_773410 ) ) ( not ( = ?auto_773409 ?auto_773411 ) ) ( not ( = ?auto_773410 ?auto_773411 ) ) ( ON ?auto_773409 ?auto_773410 ) ( ON ?auto_773408 ?auto_773409 ) ( ON ?auto_773407 ?auto_773408 ) ( ON ?auto_773406 ?auto_773407 ) ( ON ?auto_773405 ?auto_773406 ) ( ON ?auto_773404 ?auto_773405 ) ( ON ?auto_773403 ?auto_773404 ) ( ON ?auto_773402 ?auto_773403 ) ( ON ?auto_773401 ?auto_773402 ) ( ON ?auto_773400 ?auto_773401 ) ( ON ?auto_773399 ?auto_773400 ) ( ON ?auto_773398 ?auto_773399 ) ( ON ?auto_773397 ?auto_773398 ) ( ON ?auto_773396 ?auto_773397 ) ( CLEAR ?auto_773394 ) ( ON ?auto_773395 ?auto_773396 ) ( CLEAR ?auto_773395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_773394 ?auto_773395 )
      ( MAKE-17PILE ?auto_773394 ?auto_773395 ?auto_773396 ?auto_773397 ?auto_773398 ?auto_773399 ?auto_773400 ?auto_773401 ?auto_773402 ?auto_773403 ?auto_773404 ?auto_773405 ?auto_773406 ?auto_773407 ?auto_773408 ?auto_773409 ?auto_773410 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_773464 - BLOCK
      ?auto_773465 - BLOCK
      ?auto_773466 - BLOCK
      ?auto_773467 - BLOCK
      ?auto_773468 - BLOCK
      ?auto_773469 - BLOCK
      ?auto_773470 - BLOCK
      ?auto_773471 - BLOCK
      ?auto_773472 - BLOCK
      ?auto_773473 - BLOCK
      ?auto_773474 - BLOCK
      ?auto_773475 - BLOCK
      ?auto_773476 - BLOCK
      ?auto_773477 - BLOCK
      ?auto_773478 - BLOCK
      ?auto_773479 - BLOCK
      ?auto_773480 - BLOCK
    )
    :vars
    (
      ?auto_773481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_773480 ?auto_773481 ) ( not ( = ?auto_773464 ?auto_773465 ) ) ( not ( = ?auto_773464 ?auto_773466 ) ) ( not ( = ?auto_773464 ?auto_773467 ) ) ( not ( = ?auto_773464 ?auto_773468 ) ) ( not ( = ?auto_773464 ?auto_773469 ) ) ( not ( = ?auto_773464 ?auto_773470 ) ) ( not ( = ?auto_773464 ?auto_773471 ) ) ( not ( = ?auto_773464 ?auto_773472 ) ) ( not ( = ?auto_773464 ?auto_773473 ) ) ( not ( = ?auto_773464 ?auto_773474 ) ) ( not ( = ?auto_773464 ?auto_773475 ) ) ( not ( = ?auto_773464 ?auto_773476 ) ) ( not ( = ?auto_773464 ?auto_773477 ) ) ( not ( = ?auto_773464 ?auto_773478 ) ) ( not ( = ?auto_773464 ?auto_773479 ) ) ( not ( = ?auto_773464 ?auto_773480 ) ) ( not ( = ?auto_773464 ?auto_773481 ) ) ( not ( = ?auto_773465 ?auto_773466 ) ) ( not ( = ?auto_773465 ?auto_773467 ) ) ( not ( = ?auto_773465 ?auto_773468 ) ) ( not ( = ?auto_773465 ?auto_773469 ) ) ( not ( = ?auto_773465 ?auto_773470 ) ) ( not ( = ?auto_773465 ?auto_773471 ) ) ( not ( = ?auto_773465 ?auto_773472 ) ) ( not ( = ?auto_773465 ?auto_773473 ) ) ( not ( = ?auto_773465 ?auto_773474 ) ) ( not ( = ?auto_773465 ?auto_773475 ) ) ( not ( = ?auto_773465 ?auto_773476 ) ) ( not ( = ?auto_773465 ?auto_773477 ) ) ( not ( = ?auto_773465 ?auto_773478 ) ) ( not ( = ?auto_773465 ?auto_773479 ) ) ( not ( = ?auto_773465 ?auto_773480 ) ) ( not ( = ?auto_773465 ?auto_773481 ) ) ( not ( = ?auto_773466 ?auto_773467 ) ) ( not ( = ?auto_773466 ?auto_773468 ) ) ( not ( = ?auto_773466 ?auto_773469 ) ) ( not ( = ?auto_773466 ?auto_773470 ) ) ( not ( = ?auto_773466 ?auto_773471 ) ) ( not ( = ?auto_773466 ?auto_773472 ) ) ( not ( = ?auto_773466 ?auto_773473 ) ) ( not ( = ?auto_773466 ?auto_773474 ) ) ( not ( = ?auto_773466 ?auto_773475 ) ) ( not ( = ?auto_773466 ?auto_773476 ) ) ( not ( = ?auto_773466 ?auto_773477 ) ) ( not ( = ?auto_773466 ?auto_773478 ) ) ( not ( = ?auto_773466 ?auto_773479 ) ) ( not ( = ?auto_773466 ?auto_773480 ) ) ( not ( = ?auto_773466 ?auto_773481 ) ) ( not ( = ?auto_773467 ?auto_773468 ) ) ( not ( = ?auto_773467 ?auto_773469 ) ) ( not ( = ?auto_773467 ?auto_773470 ) ) ( not ( = ?auto_773467 ?auto_773471 ) ) ( not ( = ?auto_773467 ?auto_773472 ) ) ( not ( = ?auto_773467 ?auto_773473 ) ) ( not ( = ?auto_773467 ?auto_773474 ) ) ( not ( = ?auto_773467 ?auto_773475 ) ) ( not ( = ?auto_773467 ?auto_773476 ) ) ( not ( = ?auto_773467 ?auto_773477 ) ) ( not ( = ?auto_773467 ?auto_773478 ) ) ( not ( = ?auto_773467 ?auto_773479 ) ) ( not ( = ?auto_773467 ?auto_773480 ) ) ( not ( = ?auto_773467 ?auto_773481 ) ) ( not ( = ?auto_773468 ?auto_773469 ) ) ( not ( = ?auto_773468 ?auto_773470 ) ) ( not ( = ?auto_773468 ?auto_773471 ) ) ( not ( = ?auto_773468 ?auto_773472 ) ) ( not ( = ?auto_773468 ?auto_773473 ) ) ( not ( = ?auto_773468 ?auto_773474 ) ) ( not ( = ?auto_773468 ?auto_773475 ) ) ( not ( = ?auto_773468 ?auto_773476 ) ) ( not ( = ?auto_773468 ?auto_773477 ) ) ( not ( = ?auto_773468 ?auto_773478 ) ) ( not ( = ?auto_773468 ?auto_773479 ) ) ( not ( = ?auto_773468 ?auto_773480 ) ) ( not ( = ?auto_773468 ?auto_773481 ) ) ( not ( = ?auto_773469 ?auto_773470 ) ) ( not ( = ?auto_773469 ?auto_773471 ) ) ( not ( = ?auto_773469 ?auto_773472 ) ) ( not ( = ?auto_773469 ?auto_773473 ) ) ( not ( = ?auto_773469 ?auto_773474 ) ) ( not ( = ?auto_773469 ?auto_773475 ) ) ( not ( = ?auto_773469 ?auto_773476 ) ) ( not ( = ?auto_773469 ?auto_773477 ) ) ( not ( = ?auto_773469 ?auto_773478 ) ) ( not ( = ?auto_773469 ?auto_773479 ) ) ( not ( = ?auto_773469 ?auto_773480 ) ) ( not ( = ?auto_773469 ?auto_773481 ) ) ( not ( = ?auto_773470 ?auto_773471 ) ) ( not ( = ?auto_773470 ?auto_773472 ) ) ( not ( = ?auto_773470 ?auto_773473 ) ) ( not ( = ?auto_773470 ?auto_773474 ) ) ( not ( = ?auto_773470 ?auto_773475 ) ) ( not ( = ?auto_773470 ?auto_773476 ) ) ( not ( = ?auto_773470 ?auto_773477 ) ) ( not ( = ?auto_773470 ?auto_773478 ) ) ( not ( = ?auto_773470 ?auto_773479 ) ) ( not ( = ?auto_773470 ?auto_773480 ) ) ( not ( = ?auto_773470 ?auto_773481 ) ) ( not ( = ?auto_773471 ?auto_773472 ) ) ( not ( = ?auto_773471 ?auto_773473 ) ) ( not ( = ?auto_773471 ?auto_773474 ) ) ( not ( = ?auto_773471 ?auto_773475 ) ) ( not ( = ?auto_773471 ?auto_773476 ) ) ( not ( = ?auto_773471 ?auto_773477 ) ) ( not ( = ?auto_773471 ?auto_773478 ) ) ( not ( = ?auto_773471 ?auto_773479 ) ) ( not ( = ?auto_773471 ?auto_773480 ) ) ( not ( = ?auto_773471 ?auto_773481 ) ) ( not ( = ?auto_773472 ?auto_773473 ) ) ( not ( = ?auto_773472 ?auto_773474 ) ) ( not ( = ?auto_773472 ?auto_773475 ) ) ( not ( = ?auto_773472 ?auto_773476 ) ) ( not ( = ?auto_773472 ?auto_773477 ) ) ( not ( = ?auto_773472 ?auto_773478 ) ) ( not ( = ?auto_773472 ?auto_773479 ) ) ( not ( = ?auto_773472 ?auto_773480 ) ) ( not ( = ?auto_773472 ?auto_773481 ) ) ( not ( = ?auto_773473 ?auto_773474 ) ) ( not ( = ?auto_773473 ?auto_773475 ) ) ( not ( = ?auto_773473 ?auto_773476 ) ) ( not ( = ?auto_773473 ?auto_773477 ) ) ( not ( = ?auto_773473 ?auto_773478 ) ) ( not ( = ?auto_773473 ?auto_773479 ) ) ( not ( = ?auto_773473 ?auto_773480 ) ) ( not ( = ?auto_773473 ?auto_773481 ) ) ( not ( = ?auto_773474 ?auto_773475 ) ) ( not ( = ?auto_773474 ?auto_773476 ) ) ( not ( = ?auto_773474 ?auto_773477 ) ) ( not ( = ?auto_773474 ?auto_773478 ) ) ( not ( = ?auto_773474 ?auto_773479 ) ) ( not ( = ?auto_773474 ?auto_773480 ) ) ( not ( = ?auto_773474 ?auto_773481 ) ) ( not ( = ?auto_773475 ?auto_773476 ) ) ( not ( = ?auto_773475 ?auto_773477 ) ) ( not ( = ?auto_773475 ?auto_773478 ) ) ( not ( = ?auto_773475 ?auto_773479 ) ) ( not ( = ?auto_773475 ?auto_773480 ) ) ( not ( = ?auto_773475 ?auto_773481 ) ) ( not ( = ?auto_773476 ?auto_773477 ) ) ( not ( = ?auto_773476 ?auto_773478 ) ) ( not ( = ?auto_773476 ?auto_773479 ) ) ( not ( = ?auto_773476 ?auto_773480 ) ) ( not ( = ?auto_773476 ?auto_773481 ) ) ( not ( = ?auto_773477 ?auto_773478 ) ) ( not ( = ?auto_773477 ?auto_773479 ) ) ( not ( = ?auto_773477 ?auto_773480 ) ) ( not ( = ?auto_773477 ?auto_773481 ) ) ( not ( = ?auto_773478 ?auto_773479 ) ) ( not ( = ?auto_773478 ?auto_773480 ) ) ( not ( = ?auto_773478 ?auto_773481 ) ) ( not ( = ?auto_773479 ?auto_773480 ) ) ( not ( = ?auto_773479 ?auto_773481 ) ) ( not ( = ?auto_773480 ?auto_773481 ) ) ( ON ?auto_773479 ?auto_773480 ) ( ON ?auto_773478 ?auto_773479 ) ( ON ?auto_773477 ?auto_773478 ) ( ON ?auto_773476 ?auto_773477 ) ( ON ?auto_773475 ?auto_773476 ) ( ON ?auto_773474 ?auto_773475 ) ( ON ?auto_773473 ?auto_773474 ) ( ON ?auto_773472 ?auto_773473 ) ( ON ?auto_773471 ?auto_773472 ) ( ON ?auto_773470 ?auto_773471 ) ( ON ?auto_773469 ?auto_773470 ) ( ON ?auto_773468 ?auto_773469 ) ( ON ?auto_773467 ?auto_773468 ) ( ON ?auto_773466 ?auto_773467 ) ( ON ?auto_773465 ?auto_773466 ) ( ON ?auto_773464 ?auto_773465 ) ( CLEAR ?auto_773464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_773464 )
      ( MAKE-17PILE ?auto_773464 ?auto_773465 ?auto_773466 ?auto_773467 ?auto_773468 ?auto_773469 ?auto_773470 ?auto_773471 ?auto_773472 ?auto_773473 ?auto_773474 ?auto_773475 ?auto_773476 ?auto_773477 ?auto_773478 ?auto_773479 ?auto_773480 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_773535 - BLOCK
      ?auto_773536 - BLOCK
      ?auto_773537 - BLOCK
      ?auto_773538 - BLOCK
      ?auto_773539 - BLOCK
      ?auto_773540 - BLOCK
      ?auto_773541 - BLOCK
      ?auto_773542 - BLOCK
      ?auto_773543 - BLOCK
      ?auto_773544 - BLOCK
      ?auto_773545 - BLOCK
      ?auto_773546 - BLOCK
      ?auto_773547 - BLOCK
      ?auto_773548 - BLOCK
      ?auto_773549 - BLOCK
      ?auto_773550 - BLOCK
      ?auto_773551 - BLOCK
      ?auto_773552 - BLOCK
    )
    :vars
    (
      ?auto_773553 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_773551 ) ( ON ?auto_773552 ?auto_773553 ) ( CLEAR ?auto_773552 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_773535 ) ( ON ?auto_773536 ?auto_773535 ) ( ON ?auto_773537 ?auto_773536 ) ( ON ?auto_773538 ?auto_773537 ) ( ON ?auto_773539 ?auto_773538 ) ( ON ?auto_773540 ?auto_773539 ) ( ON ?auto_773541 ?auto_773540 ) ( ON ?auto_773542 ?auto_773541 ) ( ON ?auto_773543 ?auto_773542 ) ( ON ?auto_773544 ?auto_773543 ) ( ON ?auto_773545 ?auto_773544 ) ( ON ?auto_773546 ?auto_773545 ) ( ON ?auto_773547 ?auto_773546 ) ( ON ?auto_773548 ?auto_773547 ) ( ON ?auto_773549 ?auto_773548 ) ( ON ?auto_773550 ?auto_773549 ) ( ON ?auto_773551 ?auto_773550 ) ( not ( = ?auto_773535 ?auto_773536 ) ) ( not ( = ?auto_773535 ?auto_773537 ) ) ( not ( = ?auto_773535 ?auto_773538 ) ) ( not ( = ?auto_773535 ?auto_773539 ) ) ( not ( = ?auto_773535 ?auto_773540 ) ) ( not ( = ?auto_773535 ?auto_773541 ) ) ( not ( = ?auto_773535 ?auto_773542 ) ) ( not ( = ?auto_773535 ?auto_773543 ) ) ( not ( = ?auto_773535 ?auto_773544 ) ) ( not ( = ?auto_773535 ?auto_773545 ) ) ( not ( = ?auto_773535 ?auto_773546 ) ) ( not ( = ?auto_773535 ?auto_773547 ) ) ( not ( = ?auto_773535 ?auto_773548 ) ) ( not ( = ?auto_773535 ?auto_773549 ) ) ( not ( = ?auto_773535 ?auto_773550 ) ) ( not ( = ?auto_773535 ?auto_773551 ) ) ( not ( = ?auto_773535 ?auto_773552 ) ) ( not ( = ?auto_773535 ?auto_773553 ) ) ( not ( = ?auto_773536 ?auto_773537 ) ) ( not ( = ?auto_773536 ?auto_773538 ) ) ( not ( = ?auto_773536 ?auto_773539 ) ) ( not ( = ?auto_773536 ?auto_773540 ) ) ( not ( = ?auto_773536 ?auto_773541 ) ) ( not ( = ?auto_773536 ?auto_773542 ) ) ( not ( = ?auto_773536 ?auto_773543 ) ) ( not ( = ?auto_773536 ?auto_773544 ) ) ( not ( = ?auto_773536 ?auto_773545 ) ) ( not ( = ?auto_773536 ?auto_773546 ) ) ( not ( = ?auto_773536 ?auto_773547 ) ) ( not ( = ?auto_773536 ?auto_773548 ) ) ( not ( = ?auto_773536 ?auto_773549 ) ) ( not ( = ?auto_773536 ?auto_773550 ) ) ( not ( = ?auto_773536 ?auto_773551 ) ) ( not ( = ?auto_773536 ?auto_773552 ) ) ( not ( = ?auto_773536 ?auto_773553 ) ) ( not ( = ?auto_773537 ?auto_773538 ) ) ( not ( = ?auto_773537 ?auto_773539 ) ) ( not ( = ?auto_773537 ?auto_773540 ) ) ( not ( = ?auto_773537 ?auto_773541 ) ) ( not ( = ?auto_773537 ?auto_773542 ) ) ( not ( = ?auto_773537 ?auto_773543 ) ) ( not ( = ?auto_773537 ?auto_773544 ) ) ( not ( = ?auto_773537 ?auto_773545 ) ) ( not ( = ?auto_773537 ?auto_773546 ) ) ( not ( = ?auto_773537 ?auto_773547 ) ) ( not ( = ?auto_773537 ?auto_773548 ) ) ( not ( = ?auto_773537 ?auto_773549 ) ) ( not ( = ?auto_773537 ?auto_773550 ) ) ( not ( = ?auto_773537 ?auto_773551 ) ) ( not ( = ?auto_773537 ?auto_773552 ) ) ( not ( = ?auto_773537 ?auto_773553 ) ) ( not ( = ?auto_773538 ?auto_773539 ) ) ( not ( = ?auto_773538 ?auto_773540 ) ) ( not ( = ?auto_773538 ?auto_773541 ) ) ( not ( = ?auto_773538 ?auto_773542 ) ) ( not ( = ?auto_773538 ?auto_773543 ) ) ( not ( = ?auto_773538 ?auto_773544 ) ) ( not ( = ?auto_773538 ?auto_773545 ) ) ( not ( = ?auto_773538 ?auto_773546 ) ) ( not ( = ?auto_773538 ?auto_773547 ) ) ( not ( = ?auto_773538 ?auto_773548 ) ) ( not ( = ?auto_773538 ?auto_773549 ) ) ( not ( = ?auto_773538 ?auto_773550 ) ) ( not ( = ?auto_773538 ?auto_773551 ) ) ( not ( = ?auto_773538 ?auto_773552 ) ) ( not ( = ?auto_773538 ?auto_773553 ) ) ( not ( = ?auto_773539 ?auto_773540 ) ) ( not ( = ?auto_773539 ?auto_773541 ) ) ( not ( = ?auto_773539 ?auto_773542 ) ) ( not ( = ?auto_773539 ?auto_773543 ) ) ( not ( = ?auto_773539 ?auto_773544 ) ) ( not ( = ?auto_773539 ?auto_773545 ) ) ( not ( = ?auto_773539 ?auto_773546 ) ) ( not ( = ?auto_773539 ?auto_773547 ) ) ( not ( = ?auto_773539 ?auto_773548 ) ) ( not ( = ?auto_773539 ?auto_773549 ) ) ( not ( = ?auto_773539 ?auto_773550 ) ) ( not ( = ?auto_773539 ?auto_773551 ) ) ( not ( = ?auto_773539 ?auto_773552 ) ) ( not ( = ?auto_773539 ?auto_773553 ) ) ( not ( = ?auto_773540 ?auto_773541 ) ) ( not ( = ?auto_773540 ?auto_773542 ) ) ( not ( = ?auto_773540 ?auto_773543 ) ) ( not ( = ?auto_773540 ?auto_773544 ) ) ( not ( = ?auto_773540 ?auto_773545 ) ) ( not ( = ?auto_773540 ?auto_773546 ) ) ( not ( = ?auto_773540 ?auto_773547 ) ) ( not ( = ?auto_773540 ?auto_773548 ) ) ( not ( = ?auto_773540 ?auto_773549 ) ) ( not ( = ?auto_773540 ?auto_773550 ) ) ( not ( = ?auto_773540 ?auto_773551 ) ) ( not ( = ?auto_773540 ?auto_773552 ) ) ( not ( = ?auto_773540 ?auto_773553 ) ) ( not ( = ?auto_773541 ?auto_773542 ) ) ( not ( = ?auto_773541 ?auto_773543 ) ) ( not ( = ?auto_773541 ?auto_773544 ) ) ( not ( = ?auto_773541 ?auto_773545 ) ) ( not ( = ?auto_773541 ?auto_773546 ) ) ( not ( = ?auto_773541 ?auto_773547 ) ) ( not ( = ?auto_773541 ?auto_773548 ) ) ( not ( = ?auto_773541 ?auto_773549 ) ) ( not ( = ?auto_773541 ?auto_773550 ) ) ( not ( = ?auto_773541 ?auto_773551 ) ) ( not ( = ?auto_773541 ?auto_773552 ) ) ( not ( = ?auto_773541 ?auto_773553 ) ) ( not ( = ?auto_773542 ?auto_773543 ) ) ( not ( = ?auto_773542 ?auto_773544 ) ) ( not ( = ?auto_773542 ?auto_773545 ) ) ( not ( = ?auto_773542 ?auto_773546 ) ) ( not ( = ?auto_773542 ?auto_773547 ) ) ( not ( = ?auto_773542 ?auto_773548 ) ) ( not ( = ?auto_773542 ?auto_773549 ) ) ( not ( = ?auto_773542 ?auto_773550 ) ) ( not ( = ?auto_773542 ?auto_773551 ) ) ( not ( = ?auto_773542 ?auto_773552 ) ) ( not ( = ?auto_773542 ?auto_773553 ) ) ( not ( = ?auto_773543 ?auto_773544 ) ) ( not ( = ?auto_773543 ?auto_773545 ) ) ( not ( = ?auto_773543 ?auto_773546 ) ) ( not ( = ?auto_773543 ?auto_773547 ) ) ( not ( = ?auto_773543 ?auto_773548 ) ) ( not ( = ?auto_773543 ?auto_773549 ) ) ( not ( = ?auto_773543 ?auto_773550 ) ) ( not ( = ?auto_773543 ?auto_773551 ) ) ( not ( = ?auto_773543 ?auto_773552 ) ) ( not ( = ?auto_773543 ?auto_773553 ) ) ( not ( = ?auto_773544 ?auto_773545 ) ) ( not ( = ?auto_773544 ?auto_773546 ) ) ( not ( = ?auto_773544 ?auto_773547 ) ) ( not ( = ?auto_773544 ?auto_773548 ) ) ( not ( = ?auto_773544 ?auto_773549 ) ) ( not ( = ?auto_773544 ?auto_773550 ) ) ( not ( = ?auto_773544 ?auto_773551 ) ) ( not ( = ?auto_773544 ?auto_773552 ) ) ( not ( = ?auto_773544 ?auto_773553 ) ) ( not ( = ?auto_773545 ?auto_773546 ) ) ( not ( = ?auto_773545 ?auto_773547 ) ) ( not ( = ?auto_773545 ?auto_773548 ) ) ( not ( = ?auto_773545 ?auto_773549 ) ) ( not ( = ?auto_773545 ?auto_773550 ) ) ( not ( = ?auto_773545 ?auto_773551 ) ) ( not ( = ?auto_773545 ?auto_773552 ) ) ( not ( = ?auto_773545 ?auto_773553 ) ) ( not ( = ?auto_773546 ?auto_773547 ) ) ( not ( = ?auto_773546 ?auto_773548 ) ) ( not ( = ?auto_773546 ?auto_773549 ) ) ( not ( = ?auto_773546 ?auto_773550 ) ) ( not ( = ?auto_773546 ?auto_773551 ) ) ( not ( = ?auto_773546 ?auto_773552 ) ) ( not ( = ?auto_773546 ?auto_773553 ) ) ( not ( = ?auto_773547 ?auto_773548 ) ) ( not ( = ?auto_773547 ?auto_773549 ) ) ( not ( = ?auto_773547 ?auto_773550 ) ) ( not ( = ?auto_773547 ?auto_773551 ) ) ( not ( = ?auto_773547 ?auto_773552 ) ) ( not ( = ?auto_773547 ?auto_773553 ) ) ( not ( = ?auto_773548 ?auto_773549 ) ) ( not ( = ?auto_773548 ?auto_773550 ) ) ( not ( = ?auto_773548 ?auto_773551 ) ) ( not ( = ?auto_773548 ?auto_773552 ) ) ( not ( = ?auto_773548 ?auto_773553 ) ) ( not ( = ?auto_773549 ?auto_773550 ) ) ( not ( = ?auto_773549 ?auto_773551 ) ) ( not ( = ?auto_773549 ?auto_773552 ) ) ( not ( = ?auto_773549 ?auto_773553 ) ) ( not ( = ?auto_773550 ?auto_773551 ) ) ( not ( = ?auto_773550 ?auto_773552 ) ) ( not ( = ?auto_773550 ?auto_773553 ) ) ( not ( = ?auto_773551 ?auto_773552 ) ) ( not ( = ?auto_773551 ?auto_773553 ) ) ( not ( = ?auto_773552 ?auto_773553 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_773552 ?auto_773553 )
      ( !STACK ?auto_773552 ?auto_773551 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_773572 - BLOCK
      ?auto_773573 - BLOCK
      ?auto_773574 - BLOCK
      ?auto_773575 - BLOCK
      ?auto_773576 - BLOCK
      ?auto_773577 - BLOCK
      ?auto_773578 - BLOCK
      ?auto_773579 - BLOCK
      ?auto_773580 - BLOCK
      ?auto_773581 - BLOCK
      ?auto_773582 - BLOCK
      ?auto_773583 - BLOCK
      ?auto_773584 - BLOCK
      ?auto_773585 - BLOCK
      ?auto_773586 - BLOCK
      ?auto_773587 - BLOCK
      ?auto_773588 - BLOCK
      ?auto_773589 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_773588 ) ( ON-TABLE ?auto_773589 ) ( CLEAR ?auto_773589 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_773572 ) ( ON ?auto_773573 ?auto_773572 ) ( ON ?auto_773574 ?auto_773573 ) ( ON ?auto_773575 ?auto_773574 ) ( ON ?auto_773576 ?auto_773575 ) ( ON ?auto_773577 ?auto_773576 ) ( ON ?auto_773578 ?auto_773577 ) ( ON ?auto_773579 ?auto_773578 ) ( ON ?auto_773580 ?auto_773579 ) ( ON ?auto_773581 ?auto_773580 ) ( ON ?auto_773582 ?auto_773581 ) ( ON ?auto_773583 ?auto_773582 ) ( ON ?auto_773584 ?auto_773583 ) ( ON ?auto_773585 ?auto_773584 ) ( ON ?auto_773586 ?auto_773585 ) ( ON ?auto_773587 ?auto_773586 ) ( ON ?auto_773588 ?auto_773587 ) ( not ( = ?auto_773572 ?auto_773573 ) ) ( not ( = ?auto_773572 ?auto_773574 ) ) ( not ( = ?auto_773572 ?auto_773575 ) ) ( not ( = ?auto_773572 ?auto_773576 ) ) ( not ( = ?auto_773572 ?auto_773577 ) ) ( not ( = ?auto_773572 ?auto_773578 ) ) ( not ( = ?auto_773572 ?auto_773579 ) ) ( not ( = ?auto_773572 ?auto_773580 ) ) ( not ( = ?auto_773572 ?auto_773581 ) ) ( not ( = ?auto_773572 ?auto_773582 ) ) ( not ( = ?auto_773572 ?auto_773583 ) ) ( not ( = ?auto_773572 ?auto_773584 ) ) ( not ( = ?auto_773572 ?auto_773585 ) ) ( not ( = ?auto_773572 ?auto_773586 ) ) ( not ( = ?auto_773572 ?auto_773587 ) ) ( not ( = ?auto_773572 ?auto_773588 ) ) ( not ( = ?auto_773572 ?auto_773589 ) ) ( not ( = ?auto_773573 ?auto_773574 ) ) ( not ( = ?auto_773573 ?auto_773575 ) ) ( not ( = ?auto_773573 ?auto_773576 ) ) ( not ( = ?auto_773573 ?auto_773577 ) ) ( not ( = ?auto_773573 ?auto_773578 ) ) ( not ( = ?auto_773573 ?auto_773579 ) ) ( not ( = ?auto_773573 ?auto_773580 ) ) ( not ( = ?auto_773573 ?auto_773581 ) ) ( not ( = ?auto_773573 ?auto_773582 ) ) ( not ( = ?auto_773573 ?auto_773583 ) ) ( not ( = ?auto_773573 ?auto_773584 ) ) ( not ( = ?auto_773573 ?auto_773585 ) ) ( not ( = ?auto_773573 ?auto_773586 ) ) ( not ( = ?auto_773573 ?auto_773587 ) ) ( not ( = ?auto_773573 ?auto_773588 ) ) ( not ( = ?auto_773573 ?auto_773589 ) ) ( not ( = ?auto_773574 ?auto_773575 ) ) ( not ( = ?auto_773574 ?auto_773576 ) ) ( not ( = ?auto_773574 ?auto_773577 ) ) ( not ( = ?auto_773574 ?auto_773578 ) ) ( not ( = ?auto_773574 ?auto_773579 ) ) ( not ( = ?auto_773574 ?auto_773580 ) ) ( not ( = ?auto_773574 ?auto_773581 ) ) ( not ( = ?auto_773574 ?auto_773582 ) ) ( not ( = ?auto_773574 ?auto_773583 ) ) ( not ( = ?auto_773574 ?auto_773584 ) ) ( not ( = ?auto_773574 ?auto_773585 ) ) ( not ( = ?auto_773574 ?auto_773586 ) ) ( not ( = ?auto_773574 ?auto_773587 ) ) ( not ( = ?auto_773574 ?auto_773588 ) ) ( not ( = ?auto_773574 ?auto_773589 ) ) ( not ( = ?auto_773575 ?auto_773576 ) ) ( not ( = ?auto_773575 ?auto_773577 ) ) ( not ( = ?auto_773575 ?auto_773578 ) ) ( not ( = ?auto_773575 ?auto_773579 ) ) ( not ( = ?auto_773575 ?auto_773580 ) ) ( not ( = ?auto_773575 ?auto_773581 ) ) ( not ( = ?auto_773575 ?auto_773582 ) ) ( not ( = ?auto_773575 ?auto_773583 ) ) ( not ( = ?auto_773575 ?auto_773584 ) ) ( not ( = ?auto_773575 ?auto_773585 ) ) ( not ( = ?auto_773575 ?auto_773586 ) ) ( not ( = ?auto_773575 ?auto_773587 ) ) ( not ( = ?auto_773575 ?auto_773588 ) ) ( not ( = ?auto_773575 ?auto_773589 ) ) ( not ( = ?auto_773576 ?auto_773577 ) ) ( not ( = ?auto_773576 ?auto_773578 ) ) ( not ( = ?auto_773576 ?auto_773579 ) ) ( not ( = ?auto_773576 ?auto_773580 ) ) ( not ( = ?auto_773576 ?auto_773581 ) ) ( not ( = ?auto_773576 ?auto_773582 ) ) ( not ( = ?auto_773576 ?auto_773583 ) ) ( not ( = ?auto_773576 ?auto_773584 ) ) ( not ( = ?auto_773576 ?auto_773585 ) ) ( not ( = ?auto_773576 ?auto_773586 ) ) ( not ( = ?auto_773576 ?auto_773587 ) ) ( not ( = ?auto_773576 ?auto_773588 ) ) ( not ( = ?auto_773576 ?auto_773589 ) ) ( not ( = ?auto_773577 ?auto_773578 ) ) ( not ( = ?auto_773577 ?auto_773579 ) ) ( not ( = ?auto_773577 ?auto_773580 ) ) ( not ( = ?auto_773577 ?auto_773581 ) ) ( not ( = ?auto_773577 ?auto_773582 ) ) ( not ( = ?auto_773577 ?auto_773583 ) ) ( not ( = ?auto_773577 ?auto_773584 ) ) ( not ( = ?auto_773577 ?auto_773585 ) ) ( not ( = ?auto_773577 ?auto_773586 ) ) ( not ( = ?auto_773577 ?auto_773587 ) ) ( not ( = ?auto_773577 ?auto_773588 ) ) ( not ( = ?auto_773577 ?auto_773589 ) ) ( not ( = ?auto_773578 ?auto_773579 ) ) ( not ( = ?auto_773578 ?auto_773580 ) ) ( not ( = ?auto_773578 ?auto_773581 ) ) ( not ( = ?auto_773578 ?auto_773582 ) ) ( not ( = ?auto_773578 ?auto_773583 ) ) ( not ( = ?auto_773578 ?auto_773584 ) ) ( not ( = ?auto_773578 ?auto_773585 ) ) ( not ( = ?auto_773578 ?auto_773586 ) ) ( not ( = ?auto_773578 ?auto_773587 ) ) ( not ( = ?auto_773578 ?auto_773588 ) ) ( not ( = ?auto_773578 ?auto_773589 ) ) ( not ( = ?auto_773579 ?auto_773580 ) ) ( not ( = ?auto_773579 ?auto_773581 ) ) ( not ( = ?auto_773579 ?auto_773582 ) ) ( not ( = ?auto_773579 ?auto_773583 ) ) ( not ( = ?auto_773579 ?auto_773584 ) ) ( not ( = ?auto_773579 ?auto_773585 ) ) ( not ( = ?auto_773579 ?auto_773586 ) ) ( not ( = ?auto_773579 ?auto_773587 ) ) ( not ( = ?auto_773579 ?auto_773588 ) ) ( not ( = ?auto_773579 ?auto_773589 ) ) ( not ( = ?auto_773580 ?auto_773581 ) ) ( not ( = ?auto_773580 ?auto_773582 ) ) ( not ( = ?auto_773580 ?auto_773583 ) ) ( not ( = ?auto_773580 ?auto_773584 ) ) ( not ( = ?auto_773580 ?auto_773585 ) ) ( not ( = ?auto_773580 ?auto_773586 ) ) ( not ( = ?auto_773580 ?auto_773587 ) ) ( not ( = ?auto_773580 ?auto_773588 ) ) ( not ( = ?auto_773580 ?auto_773589 ) ) ( not ( = ?auto_773581 ?auto_773582 ) ) ( not ( = ?auto_773581 ?auto_773583 ) ) ( not ( = ?auto_773581 ?auto_773584 ) ) ( not ( = ?auto_773581 ?auto_773585 ) ) ( not ( = ?auto_773581 ?auto_773586 ) ) ( not ( = ?auto_773581 ?auto_773587 ) ) ( not ( = ?auto_773581 ?auto_773588 ) ) ( not ( = ?auto_773581 ?auto_773589 ) ) ( not ( = ?auto_773582 ?auto_773583 ) ) ( not ( = ?auto_773582 ?auto_773584 ) ) ( not ( = ?auto_773582 ?auto_773585 ) ) ( not ( = ?auto_773582 ?auto_773586 ) ) ( not ( = ?auto_773582 ?auto_773587 ) ) ( not ( = ?auto_773582 ?auto_773588 ) ) ( not ( = ?auto_773582 ?auto_773589 ) ) ( not ( = ?auto_773583 ?auto_773584 ) ) ( not ( = ?auto_773583 ?auto_773585 ) ) ( not ( = ?auto_773583 ?auto_773586 ) ) ( not ( = ?auto_773583 ?auto_773587 ) ) ( not ( = ?auto_773583 ?auto_773588 ) ) ( not ( = ?auto_773583 ?auto_773589 ) ) ( not ( = ?auto_773584 ?auto_773585 ) ) ( not ( = ?auto_773584 ?auto_773586 ) ) ( not ( = ?auto_773584 ?auto_773587 ) ) ( not ( = ?auto_773584 ?auto_773588 ) ) ( not ( = ?auto_773584 ?auto_773589 ) ) ( not ( = ?auto_773585 ?auto_773586 ) ) ( not ( = ?auto_773585 ?auto_773587 ) ) ( not ( = ?auto_773585 ?auto_773588 ) ) ( not ( = ?auto_773585 ?auto_773589 ) ) ( not ( = ?auto_773586 ?auto_773587 ) ) ( not ( = ?auto_773586 ?auto_773588 ) ) ( not ( = ?auto_773586 ?auto_773589 ) ) ( not ( = ?auto_773587 ?auto_773588 ) ) ( not ( = ?auto_773587 ?auto_773589 ) ) ( not ( = ?auto_773588 ?auto_773589 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_773589 )
      ( !STACK ?auto_773589 ?auto_773588 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_773608 - BLOCK
      ?auto_773609 - BLOCK
      ?auto_773610 - BLOCK
      ?auto_773611 - BLOCK
      ?auto_773612 - BLOCK
      ?auto_773613 - BLOCK
      ?auto_773614 - BLOCK
      ?auto_773615 - BLOCK
      ?auto_773616 - BLOCK
      ?auto_773617 - BLOCK
      ?auto_773618 - BLOCK
      ?auto_773619 - BLOCK
      ?auto_773620 - BLOCK
      ?auto_773621 - BLOCK
      ?auto_773622 - BLOCK
      ?auto_773623 - BLOCK
      ?auto_773624 - BLOCK
      ?auto_773625 - BLOCK
    )
    :vars
    (
      ?auto_773626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_773625 ?auto_773626 ) ( ON-TABLE ?auto_773608 ) ( ON ?auto_773609 ?auto_773608 ) ( ON ?auto_773610 ?auto_773609 ) ( ON ?auto_773611 ?auto_773610 ) ( ON ?auto_773612 ?auto_773611 ) ( ON ?auto_773613 ?auto_773612 ) ( ON ?auto_773614 ?auto_773613 ) ( ON ?auto_773615 ?auto_773614 ) ( ON ?auto_773616 ?auto_773615 ) ( ON ?auto_773617 ?auto_773616 ) ( ON ?auto_773618 ?auto_773617 ) ( ON ?auto_773619 ?auto_773618 ) ( ON ?auto_773620 ?auto_773619 ) ( ON ?auto_773621 ?auto_773620 ) ( ON ?auto_773622 ?auto_773621 ) ( ON ?auto_773623 ?auto_773622 ) ( not ( = ?auto_773608 ?auto_773609 ) ) ( not ( = ?auto_773608 ?auto_773610 ) ) ( not ( = ?auto_773608 ?auto_773611 ) ) ( not ( = ?auto_773608 ?auto_773612 ) ) ( not ( = ?auto_773608 ?auto_773613 ) ) ( not ( = ?auto_773608 ?auto_773614 ) ) ( not ( = ?auto_773608 ?auto_773615 ) ) ( not ( = ?auto_773608 ?auto_773616 ) ) ( not ( = ?auto_773608 ?auto_773617 ) ) ( not ( = ?auto_773608 ?auto_773618 ) ) ( not ( = ?auto_773608 ?auto_773619 ) ) ( not ( = ?auto_773608 ?auto_773620 ) ) ( not ( = ?auto_773608 ?auto_773621 ) ) ( not ( = ?auto_773608 ?auto_773622 ) ) ( not ( = ?auto_773608 ?auto_773623 ) ) ( not ( = ?auto_773608 ?auto_773624 ) ) ( not ( = ?auto_773608 ?auto_773625 ) ) ( not ( = ?auto_773608 ?auto_773626 ) ) ( not ( = ?auto_773609 ?auto_773610 ) ) ( not ( = ?auto_773609 ?auto_773611 ) ) ( not ( = ?auto_773609 ?auto_773612 ) ) ( not ( = ?auto_773609 ?auto_773613 ) ) ( not ( = ?auto_773609 ?auto_773614 ) ) ( not ( = ?auto_773609 ?auto_773615 ) ) ( not ( = ?auto_773609 ?auto_773616 ) ) ( not ( = ?auto_773609 ?auto_773617 ) ) ( not ( = ?auto_773609 ?auto_773618 ) ) ( not ( = ?auto_773609 ?auto_773619 ) ) ( not ( = ?auto_773609 ?auto_773620 ) ) ( not ( = ?auto_773609 ?auto_773621 ) ) ( not ( = ?auto_773609 ?auto_773622 ) ) ( not ( = ?auto_773609 ?auto_773623 ) ) ( not ( = ?auto_773609 ?auto_773624 ) ) ( not ( = ?auto_773609 ?auto_773625 ) ) ( not ( = ?auto_773609 ?auto_773626 ) ) ( not ( = ?auto_773610 ?auto_773611 ) ) ( not ( = ?auto_773610 ?auto_773612 ) ) ( not ( = ?auto_773610 ?auto_773613 ) ) ( not ( = ?auto_773610 ?auto_773614 ) ) ( not ( = ?auto_773610 ?auto_773615 ) ) ( not ( = ?auto_773610 ?auto_773616 ) ) ( not ( = ?auto_773610 ?auto_773617 ) ) ( not ( = ?auto_773610 ?auto_773618 ) ) ( not ( = ?auto_773610 ?auto_773619 ) ) ( not ( = ?auto_773610 ?auto_773620 ) ) ( not ( = ?auto_773610 ?auto_773621 ) ) ( not ( = ?auto_773610 ?auto_773622 ) ) ( not ( = ?auto_773610 ?auto_773623 ) ) ( not ( = ?auto_773610 ?auto_773624 ) ) ( not ( = ?auto_773610 ?auto_773625 ) ) ( not ( = ?auto_773610 ?auto_773626 ) ) ( not ( = ?auto_773611 ?auto_773612 ) ) ( not ( = ?auto_773611 ?auto_773613 ) ) ( not ( = ?auto_773611 ?auto_773614 ) ) ( not ( = ?auto_773611 ?auto_773615 ) ) ( not ( = ?auto_773611 ?auto_773616 ) ) ( not ( = ?auto_773611 ?auto_773617 ) ) ( not ( = ?auto_773611 ?auto_773618 ) ) ( not ( = ?auto_773611 ?auto_773619 ) ) ( not ( = ?auto_773611 ?auto_773620 ) ) ( not ( = ?auto_773611 ?auto_773621 ) ) ( not ( = ?auto_773611 ?auto_773622 ) ) ( not ( = ?auto_773611 ?auto_773623 ) ) ( not ( = ?auto_773611 ?auto_773624 ) ) ( not ( = ?auto_773611 ?auto_773625 ) ) ( not ( = ?auto_773611 ?auto_773626 ) ) ( not ( = ?auto_773612 ?auto_773613 ) ) ( not ( = ?auto_773612 ?auto_773614 ) ) ( not ( = ?auto_773612 ?auto_773615 ) ) ( not ( = ?auto_773612 ?auto_773616 ) ) ( not ( = ?auto_773612 ?auto_773617 ) ) ( not ( = ?auto_773612 ?auto_773618 ) ) ( not ( = ?auto_773612 ?auto_773619 ) ) ( not ( = ?auto_773612 ?auto_773620 ) ) ( not ( = ?auto_773612 ?auto_773621 ) ) ( not ( = ?auto_773612 ?auto_773622 ) ) ( not ( = ?auto_773612 ?auto_773623 ) ) ( not ( = ?auto_773612 ?auto_773624 ) ) ( not ( = ?auto_773612 ?auto_773625 ) ) ( not ( = ?auto_773612 ?auto_773626 ) ) ( not ( = ?auto_773613 ?auto_773614 ) ) ( not ( = ?auto_773613 ?auto_773615 ) ) ( not ( = ?auto_773613 ?auto_773616 ) ) ( not ( = ?auto_773613 ?auto_773617 ) ) ( not ( = ?auto_773613 ?auto_773618 ) ) ( not ( = ?auto_773613 ?auto_773619 ) ) ( not ( = ?auto_773613 ?auto_773620 ) ) ( not ( = ?auto_773613 ?auto_773621 ) ) ( not ( = ?auto_773613 ?auto_773622 ) ) ( not ( = ?auto_773613 ?auto_773623 ) ) ( not ( = ?auto_773613 ?auto_773624 ) ) ( not ( = ?auto_773613 ?auto_773625 ) ) ( not ( = ?auto_773613 ?auto_773626 ) ) ( not ( = ?auto_773614 ?auto_773615 ) ) ( not ( = ?auto_773614 ?auto_773616 ) ) ( not ( = ?auto_773614 ?auto_773617 ) ) ( not ( = ?auto_773614 ?auto_773618 ) ) ( not ( = ?auto_773614 ?auto_773619 ) ) ( not ( = ?auto_773614 ?auto_773620 ) ) ( not ( = ?auto_773614 ?auto_773621 ) ) ( not ( = ?auto_773614 ?auto_773622 ) ) ( not ( = ?auto_773614 ?auto_773623 ) ) ( not ( = ?auto_773614 ?auto_773624 ) ) ( not ( = ?auto_773614 ?auto_773625 ) ) ( not ( = ?auto_773614 ?auto_773626 ) ) ( not ( = ?auto_773615 ?auto_773616 ) ) ( not ( = ?auto_773615 ?auto_773617 ) ) ( not ( = ?auto_773615 ?auto_773618 ) ) ( not ( = ?auto_773615 ?auto_773619 ) ) ( not ( = ?auto_773615 ?auto_773620 ) ) ( not ( = ?auto_773615 ?auto_773621 ) ) ( not ( = ?auto_773615 ?auto_773622 ) ) ( not ( = ?auto_773615 ?auto_773623 ) ) ( not ( = ?auto_773615 ?auto_773624 ) ) ( not ( = ?auto_773615 ?auto_773625 ) ) ( not ( = ?auto_773615 ?auto_773626 ) ) ( not ( = ?auto_773616 ?auto_773617 ) ) ( not ( = ?auto_773616 ?auto_773618 ) ) ( not ( = ?auto_773616 ?auto_773619 ) ) ( not ( = ?auto_773616 ?auto_773620 ) ) ( not ( = ?auto_773616 ?auto_773621 ) ) ( not ( = ?auto_773616 ?auto_773622 ) ) ( not ( = ?auto_773616 ?auto_773623 ) ) ( not ( = ?auto_773616 ?auto_773624 ) ) ( not ( = ?auto_773616 ?auto_773625 ) ) ( not ( = ?auto_773616 ?auto_773626 ) ) ( not ( = ?auto_773617 ?auto_773618 ) ) ( not ( = ?auto_773617 ?auto_773619 ) ) ( not ( = ?auto_773617 ?auto_773620 ) ) ( not ( = ?auto_773617 ?auto_773621 ) ) ( not ( = ?auto_773617 ?auto_773622 ) ) ( not ( = ?auto_773617 ?auto_773623 ) ) ( not ( = ?auto_773617 ?auto_773624 ) ) ( not ( = ?auto_773617 ?auto_773625 ) ) ( not ( = ?auto_773617 ?auto_773626 ) ) ( not ( = ?auto_773618 ?auto_773619 ) ) ( not ( = ?auto_773618 ?auto_773620 ) ) ( not ( = ?auto_773618 ?auto_773621 ) ) ( not ( = ?auto_773618 ?auto_773622 ) ) ( not ( = ?auto_773618 ?auto_773623 ) ) ( not ( = ?auto_773618 ?auto_773624 ) ) ( not ( = ?auto_773618 ?auto_773625 ) ) ( not ( = ?auto_773618 ?auto_773626 ) ) ( not ( = ?auto_773619 ?auto_773620 ) ) ( not ( = ?auto_773619 ?auto_773621 ) ) ( not ( = ?auto_773619 ?auto_773622 ) ) ( not ( = ?auto_773619 ?auto_773623 ) ) ( not ( = ?auto_773619 ?auto_773624 ) ) ( not ( = ?auto_773619 ?auto_773625 ) ) ( not ( = ?auto_773619 ?auto_773626 ) ) ( not ( = ?auto_773620 ?auto_773621 ) ) ( not ( = ?auto_773620 ?auto_773622 ) ) ( not ( = ?auto_773620 ?auto_773623 ) ) ( not ( = ?auto_773620 ?auto_773624 ) ) ( not ( = ?auto_773620 ?auto_773625 ) ) ( not ( = ?auto_773620 ?auto_773626 ) ) ( not ( = ?auto_773621 ?auto_773622 ) ) ( not ( = ?auto_773621 ?auto_773623 ) ) ( not ( = ?auto_773621 ?auto_773624 ) ) ( not ( = ?auto_773621 ?auto_773625 ) ) ( not ( = ?auto_773621 ?auto_773626 ) ) ( not ( = ?auto_773622 ?auto_773623 ) ) ( not ( = ?auto_773622 ?auto_773624 ) ) ( not ( = ?auto_773622 ?auto_773625 ) ) ( not ( = ?auto_773622 ?auto_773626 ) ) ( not ( = ?auto_773623 ?auto_773624 ) ) ( not ( = ?auto_773623 ?auto_773625 ) ) ( not ( = ?auto_773623 ?auto_773626 ) ) ( not ( = ?auto_773624 ?auto_773625 ) ) ( not ( = ?auto_773624 ?auto_773626 ) ) ( not ( = ?auto_773625 ?auto_773626 ) ) ( CLEAR ?auto_773623 ) ( ON ?auto_773624 ?auto_773625 ) ( CLEAR ?auto_773624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_773608 ?auto_773609 ?auto_773610 ?auto_773611 ?auto_773612 ?auto_773613 ?auto_773614 ?auto_773615 ?auto_773616 ?auto_773617 ?auto_773618 ?auto_773619 ?auto_773620 ?auto_773621 ?auto_773622 ?auto_773623 ?auto_773624 )
      ( MAKE-18PILE ?auto_773608 ?auto_773609 ?auto_773610 ?auto_773611 ?auto_773612 ?auto_773613 ?auto_773614 ?auto_773615 ?auto_773616 ?auto_773617 ?auto_773618 ?auto_773619 ?auto_773620 ?auto_773621 ?auto_773622 ?auto_773623 ?auto_773624 ?auto_773625 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_773645 - BLOCK
      ?auto_773646 - BLOCK
      ?auto_773647 - BLOCK
      ?auto_773648 - BLOCK
      ?auto_773649 - BLOCK
      ?auto_773650 - BLOCK
      ?auto_773651 - BLOCK
      ?auto_773652 - BLOCK
      ?auto_773653 - BLOCK
      ?auto_773654 - BLOCK
      ?auto_773655 - BLOCK
      ?auto_773656 - BLOCK
      ?auto_773657 - BLOCK
      ?auto_773658 - BLOCK
      ?auto_773659 - BLOCK
      ?auto_773660 - BLOCK
      ?auto_773661 - BLOCK
      ?auto_773662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_773662 ) ( ON-TABLE ?auto_773645 ) ( ON ?auto_773646 ?auto_773645 ) ( ON ?auto_773647 ?auto_773646 ) ( ON ?auto_773648 ?auto_773647 ) ( ON ?auto_773649 ?auto_773648 ) ( ON ?auto_773650 ?auto_773649 ) ( ON ?auto_773651 ?auto_773650 ) ( ON ?auto_773652 ?auto_773651 ) ( ON ?auto_773653 ?auto_773652 ) ( ON ?auto_773654 ?auto_773653 ) ( ON ?auto_773655 ?auto_773654 ) ( ON ?auto_773656 ?auto_773655 ) ( ON ?auto_773657 ?auto_773656 ) ( ON ?auto_773658 ?auto_773657 ) ( ON ?auto_773659 ?auto_773658 ) ( ON ?auto_773660 ?auto_773659 ) ( not ( = ?auto_773645 ?auto_773646 ) ) ( not ( = ?auto_773645 ?auto_773647 ) ) ( not ( = ?auto_773645 ?auto_773648 ) ) ( not ( = ?auto_773645 ?auto_773649 ) ) ( not ( = ?auto_773645 ?auto_773650 ) ) ( not ( = ?auto_773645 ?auto_773651 ) ) ( not ( = ?auto_773645 ?auto_773652 ) ) ( not ( = ?auto_773645 ?auto_773653 ) ) ( not ( = ?auto_773645 ?auto_773654 ) ) ( not ( = ?auto_773645 ?auto_773655 ) ) ( not ( = ?auto_773645 ?auto_773656 ) ) ( not ( = ?auto_773645 ?auto_773657 ) ) ( not ( = ?auto_773645 ?auto_773658 ) ) ( not ( = ?auto_773645 ?auto_773659 ) ) ( not ( = ?auto_773645 ?auto_773660 ) ) ( not ( = ?auto_773645 ?auto_773661 ) ) ( not ( = ?auto_773645 ?auto_773662 ) ) ( not ( = ?auto_773646 ?auto_773647 ) ) ( not ( = ?auto_773646 ?auto_773648 ) ) ( not ( = ?auto_773646 ?auto_773649 ) ) ( not ( = ?auto_773646 ?auto_773650 ) ) ( not ( = ?auto_773646 ?auto_773651 ) ) ( not ( = ?auto_773646 ?auto_773652 ) ) ( not ( = ?auto_773646 ?auto_773653 ) ) ( not ( = ?auto_773646 ?auto_773654 ) ) ( not ( = ?auto_773646 ?auto_773655 ) ) ( not ( = ?auto_773646 ?auto_773656 ) ) ( not ( = ?auto_773646 ?auto_773657 ) ) ( not ( = ?auto_773646 ?auto_773658 ) ) ( not ( = ?auto_773646 ?auto_773659 ) ) ( not ( = ?auto_773646 ?auto_773660 ) ) ( not ( = ?auto_773646 ?auto_773661 ) ) ( not ( = ?auto_773646 ?auto_773662 ) ) ( not ( = ?auto_773647 ?auto_773648 ) ) ( not ( = ?auto_773647 ?auto_773649 ) ) ( not ( = ?auto_773647 ?auto_773650 ) ) ( not ( = ?auto_773647 ?auto_773651 ) ) ( not ( = ?auto_773647 ?auto_773652 ) ) ( not ( = ?auto_773647 ?auto_773653 ) ) ( not ( = ?auto_773647 ?auto_773654 ) ) ( not ( = ?auto_773647 ?auto_773655 ) ) ( not ( = ?auto_773647 ?auto_773656 ) ) ( not ( = ?auto_773647 ?auto_773657 ) ) ( not ( = ?auto_773647 ?auto_773658 ) ) ( not ( = ?auto_773647 ?auto_773659 ) ) ( not ( = ?auto_773647 ?auto_773660 ) ) ( not ( = ?auto_773647 ?auto_773661 ) ) ( not ( = ?auto_773647 ?auto_773662 ) ) ( not ( = ?auto_773648 ?auto_773649 ) ) ( not ( = ?auto_773648 ?auto_773650 ) ) ( not ( = ?auto_773648 ?auto_773651 ) ) ( not ( = ?auto_773648 ?auto_773652 ) ) ( not ( = ?auto_773648 ?auto_773653 ) ) ( not ( = ?auto_773648 ?auto_773654 ) ) ( not ( = ?auto_773648 ?auto_773655 ) ) ( not ( = ?auto_773648 ?auto_773656 ) ) ( not ( = ?auto_773648 ?auto_773657 ) ) ( not ( = ?auto_773648 ?auto_773658 ) ) ( not ( = ?auto_773648 ?auto_773659 ) ) ( not ( = ?auto_773648 ?auto_773660 ) ) ( not ( = ?auto_773648 ?auto_773661 ) ) ( not ( = ?auto_773648 ?auto_773662 ) ) ( not ( = ?auto_773649 ?auto_773650 ) ) ( not ( = ?auto_773649 ?auto_773651 ) ) ( not ( = ?auto_773649 ?auto_773652 ) ) ( not ( = ?auto_773649 ?auto_773653 ) ) ( not ( = ?auto_773649 ?auto_773654 ) ) ( not ( = ?auto_773649 ?auto_773655 ) ) ( not ( = ?auto_773649 ?auto_773656 ) ) ( not ( = ?auto_773649 ?auto_773657 ) ) ( not ( = ?auto_773649 ?auto_773658 ) ) ( not ( = ?auto_773649 ?auto_773659 ) ) ( not ( = ?auto_773649 ?auto_773660 ) ) ( not ( = ?auto_773649 ?auto_773661 ) ) ( not ( = ?auto_773649 ?auto_773662 ) ) ( not ( = ?auto_773650 ?auto_773651 ) ) ( not ( = ?auto_773650 ?auto_773652 ) ) ( not ( = ?auto_773650 ?auto_773653 ) ) ( not ( = ?auto_773650 ?auto_773654 ) ) ( not ( = ?auto_773650 ?auto_773655 ) ) ( not ( = ?auto_773650 ?auto_773656 ) ) ( not ( = ?auto_773650 ?auto_773657 ) ) ( not ( = ?auto_773650 ?auto_773658 ) ) ( not ( = ?auto_773650 ?auto_773659 ) ) ( not ( = ?auto_773650 ?auto_773660 ) ) ( not ( = ?auto_773650 ?auto_773661 ) ) ( not ( = ?auto_773650 ?auto_773662 ) ) ( not ( = ?auto_773651 ?auto_773652 ) ) ( not ( = ?auto_773651 ?auto_773653 ) ) ( not ( = ?auto_773651 ?auto_773654 ) ) ( not ( = ?auto_773651 ?auto_773655 ) ) ( not ( = ?auto_773651 ?auto_773656 ) ) ( not ( = ?auto_773651 ?auto_773657 ) ) ( not ( = ?auto_773651 ?auto_773658 ) ) ( not ( = ?auto_773651 ?auto_773659 ) ) ( not ( = ?auto_773651 ?auto_773660 ) ) ( not ( = ?auto_773651 ?auto_773661 ) ) ( not ( = ?auto_773651 ?auto_773662 ) ) ( not ( = ?auto_773652 ?auto_773653 ) ) ( not ( = ?auto_773652 ?auto_773654 ) ) ( not ( = ?auto_773652 ?auto_773655 ) ) ( not ( = ?auto_773652 ?auto_773656 ) ) ( not ( = ?auto_773652 ?auto_773657 ) ) ( not ( = ?auto_773652 ?auto_773658 ) ) ( not ( = ?auto_773652 ?auto_773659 ) ) ( not ( = ?auto_773652 ?auto_773660 ) ) ( not ( = ?auto_773652 ?auto_773661 ) ) ( not ( = ?auto_773652 ?auto_773662 ) ) ( not ( = ?auto_773653 ?auto_773654 ) ) ( not ( = ?auto_773653 ?auto_773655 ) ) ( not ( = ?auto_773653 ?auto_773656 ) ) ( not ( = ?auto_773653 ?auto_773657 ) ) ( not ( = ?auto_773653 ?auto_773658 ) ) ( not ( = ?auto_773653 ?auto_773659 ) ) ( not ( = ?auto_773653 ?auto_773660 ) ) ( not ( = ?auto_773653 ?auto_773661 ) ) ( not ( = ?auto_773653 ?auto_773662 ) ) ( not ( = ?auto_773654 ?auto_773655 ) ) ( not ( = ?auto_773654 ?auto_773656 ) ) ( not ( = ?auto_773654 ?auto_773657 ) ) ( not ( = ?auto_773654 ?auto_773658 ) ) ( not ( = ?auto_773654 ?auto_773659 ) ) ( not ( = ?auto_773654 ?auto_773660 ) ) ( not ( = ?auto_773654 ?auto_773661 ) ) ( not ( = ?auto_773654 ?auto_773662 ) ) ( not ( = ?auto_773655 ?auto_773656 ) ) ( not ( = ?auto_773655 ?auto_773657 ) ) ( not ( = ?auto_773655 ?auto_773658 ) ) ( not ( = ?auto_773655 ?auto_773659 ) ) ( not ( = ?auto_773655 ?auto_773660 ) ) ( not ( = ?auto_773655 ?auto_773661 ) ) ( not ( = ?auto_773655 ?auto_773662 ) ) ( not ( = ?auto_773656 ?auto_773657 ) ) ( not ( = ?auto_773656 ?auto_773658 ) ) ( not ( = ?auto_773656 ?auto_773659 ) ) ( not ( = ?auto_773656 ?auto_773660 ) ) ( not ( = ?auto_773656 ?auto_773661 ) ) ( not ( = ?auto_773656 ?auto_773662 ) ) ( not ( = ?auto_773657 ?auto_773658 ) ) ( not ( = ?auto_773657 ?auto_773659 ) ) ( not ( = ?auto_773657 ?auto_773660 ) ) ( not ( = ?auto_773657 ?auto_773661 ) ) ( not ( = ?auto_773657 ?auto_773662 ) ) ( not ( = ?auto_773658 ?auto_773659 ) ) ( not ( = ?auto_773658 ?auto_773660 ) ) ( not ( = ?auto_773658 ?auto_773661 ) ) ( not ( = ?auto_773658 ?auto_773662 ) ) ( not ( = ?auto_773659 ?auto_773660 ) ) ( not ( = ?auto_773659 ?auto_773661 ) ) ( not ( = ?auto_773659 ?auto_773662 ) ) ( not ( = ?auto_773660 ?auto_773661 ) ) ( not ( = ?auto_773660 ?auto_773662 ) ) ( not ( = ?auto_773661 ?auto_773662 ) ) ( CLEAR ?auto_773660 ) ( ON ?auto_773661 ?auto_773662 ) ( CLEAR ?auto_773661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_773645 ?auto_773646 ?auto_773647 ?auto_773648 ?auto_773649 ?auto_773650 ?auto_773651 ?auto_773652 ?auto_773653 ?auto_773654 ?auto_773655 ?auto_773656 ?auto_773657 ?auto_773658 ?auto_773659 ?auto_773660 ?auto_773661 )
      ( MAKE-18PILE ?auto_773645 ?auto_773646 ?auto_773647 ?auto_773648 ?auto_773649 ?auto_773650 ?auto_773651 ?auto_773652 ?auto_773653 ?auto_773654 ?auto_773655 ?auto_773656 ?auto_773657 ?auto_773658 ?auto_773659 ?auto_773660 ?auto_773661 ?auto_773662 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_773681 - BLOCK
      ?auto_773682 - BLOCK
      ?auto_773683 - BLOCK
      ?auto_773684 - BLOCK
      ?auto_773685 - BLOCK
      ?auto_773686 - BLOCK
      ?auto_773687 - BLOCK
      ?auto_773688 - BLOCK
      ?auto_773689 - BLOCK
      ?auto_773690 - BLOCK
      ?auto_773691 - BLOCK
      ?auto_773692 - BLOCK
      ?auto_773693 - BLOCK
      ?auto_773694 - BLOCK
      ?auto_773695 - BLOCK
      ?auto_773696 - BLOCK
      ?auto_773697 - BLOCK
      ?auto_773698 - BLOCK
    )
    :vars
    (
      ?auto_773699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_773698 ?auto_773699 ) ( ON-TABLE ?auto_773681 ) ( ON ?auto_773682 ?auto_773681 ) ( ON ?auto_773683 ?auto_773682 ) ( ON ?auto_773684 ?auto_773683 ) ( ON ?auto_773685 ?auto_773684 ) ( ON ?auto_773686 ?auto_773685 ) ( ON ?auto_773687 ?auto_773686 ) ( ON ?auto_773688 ?auto_773687 ) ( ON ?auto_773689 ?auto_773688 ) ( ON ?auto_773690 ?auto_773689 ) ( ON ?auto_773691 ?auto_773690 ) ( ON ?auto_773692 ?auto_773691 ) ( ON ?auto_773693 ?auto_773692 ) ( ON ?auto_773694 ?auto_773693 ) ( ON ?auto_773695 ?auto_773694 ) ( not ( = ?auto_773681 ?auto_773682 ) ) ( not ( = ?auto_773681 ?auto_773683 ) ) ( not ( = ?auto_773681 ?auto_773684 ) ) ( not ( = ?auto_773681 ?auto_773685 ) ) ( not ( = ?auto_773681 ?auto_773686 ) ) ( not ( = ?auto_773681 ?auto_773687 ) ) ( not ( = ?auto_773681 ?auto_773688 ) ) ( not ( = ?auto_773681 ?auto_773689 ) ) ( not ( = ?auto_773681 ?auto_773690 ) ) ( not ( = ?auto_773681 ?auto_773691 ) ) ( not ( = ?auto_773681 ?auto_773692 ) ) ( not ( = ?auto_773681 ?auto_773693 ) ) ( not ( = ?auto_773681 ?auto_773694 ) ) ( not ( = ?auto_773681 ?auto_773695 ) ) ( not ( = ?auto_773681 ?auto_773696 ) ) ( not ( = ?auto_773681 ?auto_773697 ) ) ( not ( = ?auto_773681 ?auto_773698 ) ) ( not ( = ?auto_773681 ?auto_773699 ) ) ( not ( = ?auto_773682 ?auto_773683 ) ) ( not ( = ?auto_773682 ?auto_773684 ) ) ( not ( = ?auto_773682 ?auto_773685 ) ) ( not ( = ?auto_773682 ?auto_773686 ) ) ( not ( = ?auto_773682 ?auto_773687 ) ) ( not ( = ?auto_773682 ?auto_773688 ) ) ( not ( = ?auto_773682 ?auto_773689 ) ) ( not ( = ?auto_773682 ?auto_773690 ) ) ( not ( = ?auto_773682 ?auto_773691 ) ) ( not ( = ?auto_773682 ?auto_773692 ) ) ( not ( = ?auto_773682 ?auto_773693 ) ) ( not ( = ?auto_773682 ?auto_773694 ) ) ( not ( = ?auto_773682 ?auto_773695 ) ) ( not ( = ?auto_773682 ?auto_773696 ) ) ( not ( = ?auto_773682 ?auto_773697 ) ) ( not ( = ?auto_773682 ?auto_773698 ) ) ( not ( = ?auto_773682 ?auto_773699 ) ) ( not ( = ?auto_773683 ?auto_773684 ) ) ( not ( = ?auto_773683 ?auto_773685 ) ) ( not ( = ?auto_773683 ?auto_773686 ) ) ( not ( = ?auto_773683 ?auto_773687 ) ) ( not ( = ?auto_773683 ?auto_773688 ) ) ( not ( = ?auto_773683 ?auto_773689 ) ) ( not ( = ?auto_773683 ?auto_773690 ) ) ( not ( = ?auto_773683 ?auto_773691 ) ) ( not ( = ?auto_773683 ?auto_773692 ) ) ( not ( = ?auto_773683 ?auto_773693 ) ) ( not ( = ?auto_773683 ?auto_773694 ) ) ( not ( = ?auto_773683 ?auto_773695 ) ) ( not ( = ?auto_773683 ?auto_773696 ) ) ( not ( = ?auto_773683 ?auto_773697 ) ) ( not ( = ?auto_773683 ?auto_773698 ) ) ( not ( = ?auto_773683 ?auto_773699 ) ) ( not ( = ?auto_773684 ?auto_773685 ) ) ( not ( = ?auto_773684 ?auto_773686 ) ) ( not ( = ?auto_773684 ?auto_773687 ) ) ( not ( = ?auto_773684 ?auto_773688 ) ) ( not ( = ?auto_773684 ?auto_773689 ) ) ( not ( = ?auto_773684 ?auto_773690 ) ) ( not ( = ?auto_773684 ?auto_773691 ) ) ( not ( = ?auto_773684 ?auto_773692 ) ) ( not ( = ?auto_773684 ?auto_773693 ) ) ( not ( = ?auto_773684 ?auto_773694 ) ) ( not ( = ?auto_773684 ?auto_773695 ) ) ( not ( = ?auto_773684 ?auto_773696 ) ) ( not ( = ?auto_773684 ?auto_773697 ) ) ( not ( = ?auto_773684 ?auto_773698 ) ) ( not ( = ?auto_773684 ?auto_773699 ) ) ( not ( = ?auto_773685 ?auto_773686 ) ) ( not ( = ?auto_773685 ?auto_773687 ) ) ( not ( = ?auto_773685 ?auto_773688 ) ) ( not ( = ?auto_773685 ?auto_773689 ) ) ( not ( = ?auto_773685 ?auto_773690 ) ) ( not ( = ?auto_773685 ?auto_773691 ) ) ( not ( = ?auto_773685 ?auto_773692 ) ) ( not ( = ?auto_773685 ?auto_773693 ) ) ( not ( = ?auto_773685 ?auto_773694 ) ) ( not ( = ?auto_773685 ?auto_773695 ) ) ( not ( = ?auto_773685 ?auto_773696 ) ) ( not ( = ?auto_773685 ?auto_773697 ) ) ( not ( = ?auto_773685 ?auto_773698 ) ) ( not ( = ?auto_773685 ?auto_773699 ) ) ( not ( = ?auto_773686 ?auto_773687 ) ) ( not ( = ?auto_773686 ?auto_773688 ) ) ( not ( = ?auto_773686 ?auto_773689 ) ) ( not ( = ?auto_773686 ?auto_773690 ) ) ( not ( = ?auto_773686 ?auto_773691 ) ) ( not ( = ?auto_773686 ?auto_773692 ) ) ( not ( = ?auto_773686 ?auto_773693 ) ) ( not ( = ?auto_773686 ?auto_773694 ) ) ( not ( = ?auto_773686 ?auto_773695 ) ) ( not ( = ?auto_773686 ?auto_773696 ) ) ( not ( = ?auto_773686 ?auto_773697 ) ) ( not ( = ?auto_773686 ?auto_773698 ) ) ( not ( = ?auto_773686 ?auto_773699 ) ) ( not ( = ?auto_773687 ?auto_773688 ) ) ( not ( = ?auto_773687 ?auto_773689 ) ) ( not ( = ?auto_773687 ?auto_773690 ) ) ( not ( = ?auto_773687 ?auto_773691 ) ) ( not ( = ?auto_773687 ?auto_773692 ) ) ( not ( = ?auto_773687 ?auto_773693 ) ) ( not ( = ?auto_773687 ?auto_773694 ) ) ( not ( = ?auto_773687 ?auto_773695 ) ) ( not ( = ?auto_773687 ?auto_773696 ) ) ( not ( = ?auto_773687 ?auto_773697 ) ) ( not ( = ?auto_773687 ?auto_773698 ) ) ( not ( = ?auto_773687 ?auto_773699 ) ) ( not ( = ?auto_773688 ?auto_773689 ) ) ( not ( = ?auto_773688 ?auto_773690 ) ) ( not ( = ?auto_773688 ?auto_773691 ) ) ( not ( = ?auto_773688 ?auto_773692 ) ) ( not ( = ?auto_773688 ?auto_773693 ) ) ( not ( = ?auto_773688 ?auto_773694 ) ) ( not ( = ?auto_773688 ?auto_773695 ) ) ( not ( = ?auto_773688 ?auto_773696 ) ) ( not ( = ?auto_773688 ?auto_773697 ) ) ( not ( = ?auto_773688 ?auto_773698 ) ) ( not ( = ?auto_773688 ?auto_773699 ) ) ( not ( = ?auto_773689 ?auto_773690 ) ) ( not ( = ?auto_773689 ?auto_773691 ) ) ( not ( = ?auto_773689 ?auto_773692 ) ) ( not ( = ?auto_773689 ?auto_773693 ) ) ( not ( = ?auto_773689 ?auto_773694 ) ) ( not ( = ?auto_773689 ?auto_773695 ) ) ( not ( = ?auto_773689 ?auto_773696 ) ) ( not ( = ?auto_773689 ?auto_773697 ) ) ( not ( = ?auto_773689 ?auto_773698 ) ) ( not ( = ?auto_773689 ?auto_773699 ) ) ( not ( = ?auto_773690 ?auto_773691 ) ) ( not ( = ?auto_773690 ?auto_773692 ) ) ( not ( = ?auto_773690 ?auto_773693 ) ) ( not ( = ?auto_773690 ?auto_773694 ) ) ( not ( = ?auto_773690 ?auto_773695 ) ) ( not ( = ?auto_773690 ?auto_773696 ) ) ( not ( = ?auto_773690 ?auto_773697 ) ) ( not ( = ?auto_773690 ?auto_773698 ) ) ( not ( = ?auto_773690 ?auto_773699 ) ) ( not ( = ?auto_773691 ?auto_773692 ) ) ( not ( = ?auto_773691 ?auto_773693 ) ) ( not ( = ?auto_773691 ?auto_773694 ) ) ( not ( = ?auto_773691 ?auto_773695 ) ) ( not ( = ?auto_773691 ?auto_773696 ) ) ( not ( = ?auto_773691 ?auto_773697 ) ) ( not ( = ?auto_773691 ?auto_773698 ) ) ( not ( = ?auto_773691 ?auto_773699 ) ) ( not ( = ?auto_773692 ?auto_773693 ) ) ( not ( = ?auto_773692 ?auto_773694 ) ) ( not ( = ?auto_773692 ?auto_773695 ) ) ( not ( = ?auto_773692 ?auto_773696 ) ) ( not ( = ?auto_773692 ?auto_773697 ) ) ( not ( = ?auto_773692 ?auto_773698 ) ) ( not ( = ?auto_773692 ?auto_773699 ) ) ( not ( = ?auto_773693 ?auto_773694 ) ) ( not ( = ?auto_773693 ?auto_773695 ) ) ( not ( = ?auto_773693 ?auto_773696 ) ) ( not ( = ?auto_773693 ?auto_773697 ) ) ( not ( = ?auto_773693 ?auto_773698 ) ) ( not ( = ?auto_773693 ?auto_773699 ) ) ( not ( = ?auto_773694 ?auto_773695 ) ) ( not ( = ?auto_773694 ?auto_773696 ) ) ( not ( = ?auto_773694 ?auto_773697 ) ) ( not ( = ?auto_773694 ?auto_773698 ) ) ( not ( = ?auto_773694 ?auto_773699 ) ) ( not ( = ?auto_773695 ?auto_773696 ) ) ( not ( = ?auto_773695 ?auto_773697 ) ) ( not ( = ?auto_773695 ?auto_773698 ) ) ( not ( = ?auto_773695 ?auto_773699 ) ) ( not ( = ?auto_773696 ?auto_773697 ) ) ( not ( = ?auto_773696 ?auto_773698 ) ) ( not ( = ?auto_773696 ?auto_773699 ) ) ( not ( = ?auto_773697 ?auto_773698 ) ) ( not ( = ?auto_773697 ?auto_773699 ) ) ( not ( = ?auto_773698 ?auto_773699 ) ) ( ON ?auto_773697 ?auto_773698 ) ( CLEAR ?auto_773695 ) ( ON ?auto_773696 ?auto_773697 ) ( CLEAR ?auto_773696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_773681 ?auto_773682 ?auto_773683 ?auto_773684 ?auto_773685 ?auto_773686 ?auto_773687 ?auto_773688 ?auto_773689 ?auto_773690 ?auto_773691 ?auto_773692 ?auto_773693 ?auto_773694 ?auto_773695 ?auto_773696 )
      ( MAKE-18PILE ?auto_773681 ?auto_773682 ?auto_773683 ?auto_773684 ?auto_773685 ?auto_773686 ?auto_773687 ?auto_773688 ?auto_773689 ?auto_773690 ?auto_773691 ?auto_773692 ?auto_773693 ?auto_773694 ?auto_773695 ?auto_773696 ?auto_773697 ?auto_773698 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_773718 - BLOCK
      ?auto_773719 - BLOCK
      ?auto_773720 - BLOCK
      ?auto_773721 - BLOCK
      ?auto_773722 - BLOCK
      ?auto_773723 - BLOCK
      ?auto_773724 - BLOCK
      ?auto_773725 - BLOCK
      ?auto_773726 - BLOCK
      ?auto_773727 - BLOCK
      ?auto_773728 - BLOCK
      ?auto_773729 - BLOCK
      ?auto_773730 - BLOCK
      ?auto_773731 - BLOCK
      ?auto_773732 - BLOCK
      ?auto_773733 - BLOCK
      ?auto_773734 - BLOCK
      ?auto_773735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_773735 ) ( ON-TABLE ?auto_773718 ) ( ON ?auto_773719 ?auto_773718 ) ( ON ?auto_773720 ?auto_773719 ) ( ON ?auto_773721 ?auto_773720 ) ( ON ?auto_773722 ?auto_773721 ) ( ON ?auto_773723 ?auto_773722 ) ( ON ?auto_773724 ?auto_773723 ) ( ON ?auto_773725 ?auto_773724 ) ( ON ?auto_773726 ?auto_773725 ) ( ON ?auto_773727 ?auto_773726 ) ( ON ?auto_773728 ?auto_773727 ) ( ON ?auto_773729 ?auto_773728 ) ( ON ?auto_773730 ?auto_773729 ) ( ON ?auto_773731 ?auto_773730 ) ( ON ?auto_773732 ?auto_773731 ) ( not ( = ?auto_773718 ?auto_773719 ) ) ( not ( = ?auto_773718 ?auto_773720 ) ) ( not ( = ?auto_773718 ?auto_773721 ) ) ( not ( = ?auto_773718 ?auto_773722 ) ) ( not ( = ?auto_773718 ?auto_773723 ) ) ( not ( = ?auto_773718 ?auto_773724 ) ) ( not ( = ?auto_773718 ?auto_773725 ) ) ( not ( = ?auto_773718 ?auto_773726 ) ) ( not ( = ?auto_773718 ?auto_773727 ) ) ( not ( = ?auto_773718 ?auto_773728 ) ) ( not ( = ?auto_773718 ?auto_773729 ) ) ( not ( = ?auto_773718 ?auto_773730 ) ) ( not ( = ?auto_773718 ?auto_773731 ) ) ( not ( = ?auto_773718 ?auto_773732 ) ) ( not ( = ?auto_773718 ?auto_773733 ) ) ( not ( = ?auto_773718 ?auto_773734 ) ) ( not ( = ?auto_773718 ?auto_773735 ) ) ( not ( = ?auto_773719 ?auto_773720 ) ) ( not ( = ?auto_773719 ?auto_773721 ) ) ( not ( = ?auto_773719 ?auto_773722 ) ) ( not ( = ?auto_773719 ?auto_773723 ) ) ( not ( = ?auto_773719 ?auto_773724 ) ) ( not ( = ?auto_773719 ?auto_773725 ) ) ( not ( = ?auto_773719 ?auto_773726 ) ) ( not ( = ?auto_773719 ?auto_773727 ) ) ( not ( = ?auto_773719 ?auto_773728 ) ) ( not ( = ?auto_773719 ?auto_773729 ) ) ( not ( = ?auto_773719 ?auto_773730 ) ) ( not ( = ?auto_773719 ?auto_773731 ) ) ( not ( = ?auto_773719 ?auto_773732 ) ) ( not ( = ?auto_773719 ?auto_773733 ) ) ( not ( = ?auto_773719 ?auto_773734 ) ) ( not ( = ?auto_773719 ?auto_773735 ) ) ( not ( = ?auto_773720 ?auto_773721 ) ) ( not ( = ?auto_773720 ?auto_773722 ) ) ( not ( = ?auto_773720 ?auto_773723 ) ) ( not ( = ?auto_773720 ?auto_773724 ) ) ( not ( = ?auto_773720 ?auto_773725 ) ) ( not ( = ?auto_773720 ?auto_773726 ) ) ( not ( = ?auto_773720 ?auto_773727 ) ) ( not ( = ?auto_773720 ?auto_773728 ) ) ( not ( = ?auto_773720 ?auto_773729 ) ) ( not ( = ?auto_773720 ?auto_773730 ) ) ( not ( = ?auto_773720 ?auto_773731 ) ) ( not ( = ?auto_773720 ?auto_773732 ) ) ( not ( = ?auto_773720 ?auto_773733 ) ) ( not ( = ?auto_773720 ?auto_773734 ) ) ( not ( = ?auto_773720 ?auto_773735 ) ) ( not ( = ?auto_773721 ?auto_773722 ) ) ( not ( = ?auto_773721 ?auto_773723 ) ) ( not ( = ?auto_773721 ?auto_773724 ) ) ( not ( = ?auto_773721 ?auto_773725 ) ) ( not ( = ?auto_773721 ?auto_773726 ) ) ( not ( = ?auto_773721 ?auto_773727 ) ) ( not ( = ?auto_773721 ?auto_773728 ) ) ( not ( = ?auto_773721 ?auto_773729 ) ) ( not ( = ?auto_773721 ?auto_773730 ) ) ( not ( = ?auto_773721 ?auto_773731 ) ) ( not ( = ?auto_773721 ?auto_773732 ) ) ( not ( = ?auto_773721 ?auto_773733 ) ) ( not ( = ?auto_773721 ?auto_773734 ) ) ( not ( = ?auto_773721 ?auto_773735 ) ) ( not ( = ?auto_773722 ?auto_773723 ) ) ( not ( = ?auto_773722 ?auto_773724 ) ) ( not ( = ?auto_773722 ?auto_773725 ) ) ( not ( = ?auto_773722 ?auto_773726 ) ) ( not ( = ?auto_773722 ?auto_773727 ) ) ( not ( = ?auto_773722 ?auto_773728 ) ) ( not ( = ?auto_773722 ?auto_773729 ) ) ( not ( = ?auto_773722 ?auto_773730 ) ) ( not ( = ?auto_773722 ?auto_773731 ) ) ( not ( = ?auto_773722 ?auto_773732 ) ) ( not ( = ?auto_773722 ?auto_773733 ) ) ( not ( = ?auto_773722 ?auto_773734 ) ) ( not ( = ?auto_773722 ?auto_773735 ) ) ( not ( = ?auto_773723 ?auto_773724 ) ) ( not ( = ?auto_773723 ?auto_773725 ) ) ( not ( = ?auto_773723 ?auto_773726 ) ) ( not ( = ?auto_773723 ?auto_773727 ) ) ( not ( = ?auto_773723 ?auto_773728 ) ) ( not ( = ?auto_773723 ?auto_773729 ) ) ( not ( = ?auto_773723 ?auto_773730 ) ) ( not ( = ?auto_773723 ?auto_773731 ) ) ( not ( = ?auto_773723 ?auto_773732 ) ) ( not ( = ?auto_773723 ?auto_773733 ) ) ( not ( = ?auto_773723 ?auto_773734 ) ) ( not ( = ?auto_773723 ?auto_773735 ) ) ( not ( = ?auto_773724 ?auto_773725 ) ) ( not ( = ?auto_773724 ?auto_773726 ) ) ( not ( = ?auto_773724 ?auto_773727 ) ) ( not ( = ?auto_773724 ?auto_773728 ) ) ( not ( = ?auto_773724 ?auto_773729 ) ) ( not ( = ?auto_773724 ?auto_773730 ) ) ( not ( = ?auto_773724 ?auto_773731 ) ) ( not ( = ?auto_773724 ?auto_773732 ) ) ( not ( = ?auto_773724 ?auto_773733 ) ) ( not ( = ?auto_773724 ?auto_773734 ) ) ( not ( = ?auto_773724 ?auto_773735 ) ) ( not ( = ?auto_773725 ?auto_773726 ) ) ( not ( = ?auto_773725 ?auto_773727 ) ) ( not ( = ?auto_773725 ?auto_773728 ) ) ( not ( = ?auto_773725 ?auto_773729 ) ) ( not ( = ?auto_773725 ?auto_773730 ) ) ( not ( = ?auto_773725 ?auto_773731 ) ) ( not ( = ?auto_773725 ?auto_773732 ) ) ( not ( = ?auto_773725 ?auto_773733 ) ) ( not ( = ?auto_773725 ?auto_773734 ) ) ( not ( = ?auto_773725 ?auto_773735 ) ) ( not ( = ?auto_773726 ?auto_773727 ) ) ( not ( = ?auto_773726 ?auto_773728 ) ) ( not ( = ?auto_773726 ?auto_773729 ) ) ( not ( = ?auto_773726 ?auto_773730 ) ) ( not ( = ?auto_773726 ?auto_773731 ) ) ( not ( = ?auto_773726 ?auto_773732 ) ) ( not ( = ?auto_773726 ?auto_773733 ) ) ( not ( = ?auto_773726 ?auto_773734 ) ) ( not ( = ?auto_773726 ?auto_773735 ) ) ( not ( = ?auto_773727 ?auto_773728 ) ) ( not ( = ?auto_773727 ?auto_773729 ) ) ( not ( = ?auto_773727 ?auto_773730 ) ) ( not ( = ?auto_773727 ?auto_773731 ) ) ( not ( = ?auto_773727 ?auto_773732 ) ) ( not ( = ?auto_773727 ?auto_773733 ) ) ( not ( = ?auto_773727 ?auto_773734 ) ) ( not ( = ?auto_773727 ?auto_773735 ) ) ( not ( = ?auto_773728 ?auto_773729 ) ) ( not ( = ?auto_773728 ?auto_773730 ) ) ( not ( = ?auto_773728 ?auto_773731 ) ) ( not ( = ?auto_773728 ?auto_773732 ) ) ( not ( = ?auto_773728 ?auto_773733 ) ) ( not ( = ?auto_773728 ?auto_773734 ) ) ( not ( = ?auto_773728 ?auto_773735 ) ) ( not ( = ?auto_773729 ?auto_773730 ) ) ( not ( = ?auto_773729 ?auto_773731 ) ) ( not ( = ?auto_773729 ?auto_773732 ) ) ( not ( = ?auto_773729 ?auto_773733 ) ) ( not ( = ?auto_773729 ?auto_773734 ) ) ( not ( = ?auto_773729 ?auto_773735 ) ) ( not ( = ?auto_773730 ?auto_773731 ) ) ( not ( = ?auto_773730 ?auto_773732 ) ) ( not ( = ?auto_773730 ?auto_773733 ) ) ( not ( = ?auto_773730 ?auto_773734 ) ) ( not ( = ?auto_773730 ?auto_773735 ) ) ( not ( = ?auto_773731 ?auto_773732 ) ) ( not ( = ?auto_773731 ?auto_773733 ) ) ( not ( = ?auto_773731 ?auto_773734 ) ) ( not ( = ?auto_773731 ?auto_773735 ) ) ( not ( = ?auto_773732 ?auto_773733 ) ) ( not ( = ?auto_773732 ?auto_773734 ) ) ( not ( = ?auto_773732 ?auto_773735 ) ) ( not ( = ?auto_773733 ?auto_773734 ) ) ( not ( = ?auto_773733 ?auto_773735 ) ) ( not ( = ?auto_773734 ?auto_773735 ) ) ( ON ?auto_773734 ?auto_773735 ) ( CLEAR ?auto_773732 ) ( ON ?auto_773733 ?auto_773734 ) ( CLEAR ?auto_773733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_773718 ?auto_773719 ?auto_773720 ?auto_773721 ?auto_773722 ?auto_773723 ?auto_773724 ?auto_773725 ?auto_773726 ?auto_773727 ?auto_773728 ?auto_773729 ?auto_773730 ?auto_773731 ?auto_773732 ?auto_773733 )
      ( MAKE-18PILE ?auto_773718 ?auto_773719 ?auto_773720 ?auto_773721 ?auto_773722 ?auto_773723 ?auto_773724 ?auto_773725 ?auto_773726 ?auto_773727 ?auto_773728 ?auto_773729 ?auto_773730 ?auto_773731 ?auto_773732 ?auto_773733 ?auto_773734 ?auto_773735 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_773754 - BLOCK
      ?auto_773755 - BLOCK
      ?auto_773756 - BLOCK
      ?auto_773757 - BLOCK
      ?auto_773758 - BLOCK
      ?auto_773759 - BLOCK
      ?auto_773760 - BLOCK
      ?auto_773761 - BLOCK
      ?auto_773762 - BLOCK
      ?auto_773763 - BLOCK
      ?auto_773764 - BLOCK
      ?auto_773765 - BLOCK
      ?auto_773766 - BLOCK
      ?auto_773767 - BLOCK
      ?auto_773768 - BLOCK
      ?auto_773769 - BLOCK
      ?auto_773770 - BLOCK
      ?auto_773771 - BLOCK
    )
    :vars
    (
      ?auto_773772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_773771 ?auto_773772 ) ( ON-TABLE ?auto_773754 ) ( ON ?auto_773755 ?auto_773754 ) ( ON ?auto_773756 ?auto_773755 ) ( ON ?auto_773757 ?auto_773756 ) ( ON ?auto_773758 ?auto_773757 ) ( ON ?auto_773759 ?auto_773758 ) ( ON ?auto_773760 ?auto_773759 ) ( ON ?auto_773761 ?auto_773760 ) ( ON ?auto_773762 ?auto_773761 ) ( ON ?auto_773763 ?auto_773762 ) ( ON ?auto_773764 ?auto_773763 ) ( ON ?auto_773765 ?auto_773764 ) ( ON ?auto_773766 ?auto_773765 ) ( ON ?auto_773767 ?auto_773766 ) ( not ( = ?auto_773754 ?auto_773755 ) ) ( not ( = ?auto_773754 ?auto_773756 ) ) ( not ( = ?auto_773754 ?auto_773757 ) ) ( not ( = ?auto_773754 ?auto_773758 ) ) ( not ( = ?auto_773754 ?auto_773759 ) ) ( not ( = ?auto_773754 ?auto_773760 ) ) ( not ( = ?auto_773754 ?auto_773761 ) ) ( not ( = ?auto_773754 ?auto_773762 ) ) ( not ( = ?auto_773754 ?auto_773763 ) ) ( not ( = ?auto_773754 ?auto_773764 ) ) ( not ( = ?auto_773754 ?auto_773765 ) ) ( not ( = ?auto_773754 ?auto_773766 ) ) ( not ( = ?auto_773754 ?auto_773767 ) ) ( not ( = ?auto_773754 ?auto_773768 ) ) ( not ( = ?auto_773754 ?auto_773769 ) ) ( not ( = ?auto_773754 ?auto_773770 ) ) ( not ( = ?auto_773754 ?auto_773771 ) ) ( not ( = ?auto_773754 ?auto_773772 ) ) ( not ( = ?auto_773755 ?auto_773756 ) ) ( not ( = ?auto_773755 ?auto_773757 ) ) ( not ( = ?auto_773755 ?auto_773758 ) ) ( not ( = ?auto_773755 ?auto_773759 ) ) ( not ( = ?auto_773755 ?auto_773760 ) ) ( not ( = ?auto_773755 ?auto_773761 ) ) ( not ( = ?auto_773755 ?auto_773762 ) ) ( not ( = ?auto_773755 ?auto_773763 ) ) ( not ( = ?auto_773755 ?auto_773764 ) ) ( not ( = ?auto_773755 ?auto_773765 ) ) ( not ( = ?auto_773755 ?auto_773766 ) ) ( not ( = ?auto_773755 ?auto_773767 ) ) ( not ( = ?auto_773755 ?auto_773768 ) ) ( not ( = ?auto_773755 ?auto_773769 ) ) ( not ( = ?auto_773755 ?auto_773770 ) ) ( not ( = ?auto_773755 ?auto_773771 ) ) ( not ( = ?auto_773755 ?auto_773772 ) ) ( not ( = ?auto_773756 ?auto_773757 ) ) ( not ( = ?auto_773756 ?auto_773758 ) ) ( not ( = ?auto_773756 ?auto_773759 ) ) ( not ( = ?auto_773756 ?auto_773760 ) ) ( not ( = ?auto_773756 ?auto_773761 ) ) ( not ( = ?auto_773756 ?auto_773762 ) ) ( not ( = ?auto_773756 ?auto_773763 ) ) ( not ( = ?auto_773756 ?auto_773764 ) ) ( not ( = ?auto_773756 ?auto_773765 ) ) ( not ( = ?auto_773756 ?auto_773766 ) ) ( not ( = ?auto_773756 ?auto_773767 ) ) ( not ( = ?auto_773756 ?auto_773768 ) ) ( not ( = ?auto_773756 ?auto_773769 ) ) ( not ( = ?auto_773756 ?auto_773770 ) ) ( not ( = ?auto_773756 ?auto_773771 ) ) ( not ( = ?auto_773756 ?auto_773772 ) ) ( not ( = ?auto_773757 ?auto_773758 ) ) ( not ( = ?auto_773757 ?auto_773759 ) ) ( not ( = ?auto_773757 ?auto_773760 ) ) ( not ( = ?auto_773757 ?auto_773761 ) ) ( not ( = ?auto_773757 ?auto_773762 ) ) ( not ( = ?auto_773757 ?auto_773763 ) ) ( not ( = ?auto_773757 ?auto_773764 ) ) ( not ( = ?auto_773757 ?auto_773765 ) ) ( not ( = ?auto_773757 ?auto_773766 ) ) ( not ( = ?auto_773757 ?auto_773767 ) ) ( not ( = ?auto_773757 ?auto_773768 ) ) ( not ( = ?auto_773757 ?auto_773769 ) ) ( not ( = ?auto_773757 ?auto_773770 ) ) ( not ( = ?auto_773757 ?auto_773771 ) ) ( not ( = ?auto_773757 ?auto_773772 ) ) ( not ( = ?auto_773758 ?auto_773759 ) ) ( not ( = ?auto_773758 ?auto_773760 ) ) ( not ( = ?auto_773758 ?auto_773761 ) ) ( not ( = ?auto_773758 ?auto_773762 ) ) ( not ( = ?auto_773758 ?auto_773763 ) ) ( not ( = ?auto_773758 ?auto_773764 ) ) ( not ( = ?auto_773758 ?auto_773765 ) ) ( not ( = ?auto_773758 ?auto_773766 ) ) ( not ( = ?auto_773758 ?auto_773767 ) ) ( not ( = ?auto_773758 ?auto_773768 ) ) ( not ( = ?auto_773758 ?auto_773769 ) ) ( not ( = ?auto_773758 ?auto_773770 ) ) ( not ( = ?auto_773758 ?auto_773771 ) ) ( not ( = ?auto_773758 ?auto_773772 ) ) ( not ( = ?auto_773759 ?auto_773760 ) ) ( not ( = ?auto_773759 ?auto_773761 ) ) ( not ( = ?auto_773759 ?auto_773762 ) ) ( not ( = ?auto_773759 ?auto_773763 ) ) ( not ( = ?auto_773759 ?auto_773764 ) ) ( not ( = ?auto_773759 ?auto_773765 ) ) ( not ( = ?auto_773759 ?auto_773766 ) ) ( not ( = ?auto_773759 ?auto_773767 ) ) ( not ( = ?auto_773759 ?auto_773768 ) ) ( not ( = ?auto_773759 ?auto_773769 ) ) ( not ( = ?auto_773759 ?auto_773770 ) ) ( not ( = ?auto_773759 ?auto_773771 ) ) ( not ( = ?auto_773759 ?auto_773772 ) ) ( not ( = ?auto_773760 ?auto_773761 ) ) ( not ( = ?auto_773760 ?auto_773762 ) ) ( not ( = ?auto_773760 ?auto_773763 ) ) ( not ( = ?auto_773760 ?auto_773764 ) ) ( not ( = ?auto_773760 ?auto_773765 ) ) ( not ( = ?auto_773760 ?auto_773766 ) ) ( not ( = ?auto_773760 ?auto_773767 ) ) ( not ( = ?auto_773760 ?auto_773768 ) ) ( not ( = ?auto_773760 ?auto_773769 ) ) ( not ( = ?auto_773760 ?auto_773770 ) ) ( not ( = ?auto_773760 ?auto_773771 ) ) ( not ( = ?auto_773760 ?auto_773772 ) ) ( not ( = ?auto_773761 ?auto_773762 ) ) ( not ( = ?auto_773761 ?auto_773763 ) ) ( not ( = ?auto_773761 ?auto_773764 ) ) ( not ( = ?auto_773761 ?auto_773765 ) ) ( not ( = ?auto_773761 ?auto_773766 ) ) ( not ( = ?auto_773761 ?auto_773767 ) ) ( not ( = ?auto_773761 ?auto_773768 ) ) ( not ( = ?auto_773761 ?auto_773769 ) ) ( not ( = ?auto_773761 ?auto_773770 ) ) ( not ( = ?auto_773761 ?auto_773771 ) ) ( not ( = ?auto_773761 ?auto_773772 ) ) ( not ( = ?auto_773762 ?auto_773763 ) ) ( not ( = ?auto_773762 ?auto_773764 ) ) ( not ( = ?auto_773762 ?auto_773765 ) ) ( not ( = ?auto_773762 ?auto_773766 ) ) ( not ( = ?auto_773762 ?auto_773767 ) ) ( not ( = ?auto_773762 ?auto_773768 ) ) ( not ( = ?auto_773762 ?auto_773769 ) ) ( not ( = ?auto_773762 ?auto_773770 ) ) ( not ( = ?auto_773762 ?auto_773771 ) ) ( not ( = ?auto_773762 ?auto_773772 ) ) ( not ( = ?auto_773763 ?auto_773764 ) ) ( not ( = ?auto_773763 ?auto_773765 ) ) ( not ( = ?auto_773763 ?auto_773766 ) ) ( not ( = ?auto_773763 ?auto_773767 ) ) ( not ( = ?auto_773763 ?auto_773768 ) ) ( not ( = ?auto_773763 ?auto_773769 ) ) ( not ( = ?auto_773763 ?auto_773770 ) ) ( not ( = ?auto_773763 ?auto_773771 ) ) ( not ( = ?auto_773763 ?auto_773772 ) ) ( not ( = ?auto_773764 ?auto_773765 ) ) ( not ( = ?auto_773764 ?auto_773766 ) ) ( not ( = ?auto_773764 ?auto_773767 ) ) ( not ( = ?auto_773764 ?auto_773768 ) ) ( not ( = ?auto_773764 ?auto_773769 ) ) ( not ( = ?auto_773764 ?auto_773770 ) ) ( not ( = ?auto_773764 ?auto_773771 ) ) ( not ( = ?auto_773764 ?auto_773772 ) ) ( not ( = ?auto_773765 ?auto_773766 ) ) ( not ( = ?auto_773765 ?auto_773767 ) ) ( not ( = ?auto_773765 ?auto_773768 ) ) ( not ( = ?auto_773765 ?auto_773769 ) ) ( not ( = ?auto_773765 ?auto_773770 ) ) ( not ( = ?auto_773765 ?auto_773771 ) ) ( not ( = ?auto_773765 ?auto_773772 ) ) ( not ( = ?auto_773766 ?auto_773767 ) ) ( not ( = ?auto_773766 ?auto_773768 ) ) ( not ( = ?auto_773766 ?auto_773769 ) ) ( not ( = ?auto_773766 ?auto_773770 ) ) ( not ( = ?auto_773766 ?auto_773771 ) ) ( not ( = ?auto_773766 ?auto_773772 ) ) ( not ( = ?auto_773767 ?auto_773768 ) ) ( not ( = ?auto_773767 ?auto_773769 ) ) ( not ( = ?auto_773767 ?auto_773770 ) ) ( not ( = ?auto_773767 ?auto_773771 ) ) ( not ( = ?auto_773767 ?auto_773772 ) ) ( not ( = ?auto_773768 ?auto_773769 ) ) ( not ( = ?auto_773768 ?auto_773770 ) ) ( not ( = ?auto_773768 ?auto_773771 ) ) ( not ( = ?auto_773768 ?auto_773772 ) ) ( not ( = ?auto_773769 ?auto_773770 ) ) ( not ( = ?auto_773769 ?auto_773771 ) ) ( not ( = ?auto_773769 ?auto_773772 ) ) ( not ( = ?auto_773770 ?auto_773771 ) ) ( not ( = ?auto_773770 ?auto_773772 ) ) ( not ( = ?auto_773771 ?auto_773772 ) ) ( ON ?auto_773770 ?auto_773771 ) ( ON ?auto_773769 ?auto_773770 ) ( CLEAR ?auto_773767 ) ( ON ?auto_773768 ?auto_773769 ) ( CLEAR ?auto_773768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_773754 ?auto_773755 ?auto_773756 ?auto_773757 ?auto_773758 ?auto_773759 ?auto_773760 ?auto_773761 ?auto_773762 ?auto_773763 ?auto_773764 ?auto_773765 ?auto_773766 ?auto_773767 ?auto_773768 )
      ( MAKE-18PILE ?auto_773754 ?auto_773755 ?auto_773756 ?auto_773757 ?auto_773758 ?auto_773759 ?auto_773760 ?auto_773761 ?auto_773762 ?auto_773763 ?auto_773764 ?auto_773765 ?auto_773766 ?auto_773767 ?auto_773768 ?auto_773769 ?auto_773770 ?auto_773771 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_773791 - BLOCK
      ?auto_773792 - BLOCK
      ?auto_773793 - BLOCK
      ?auto_773794 - BLOCK
      ?auto_773795 - BLOCK
      ?auto_773796 - BLOCK
      ?auto_773797 - BLOCK
      ?auto_773798 - BLOCK
      ?auto_773799 - BLOCK
      ?auto_773800 - BLOCK
      ?auto_773801 - BLOCK
      ?auto_773802 - BLOCK
      ?auto_773803 - BLOCK
      ?auto_773804 - BLOCK
      ?auto_773805 - BLOCK
      ?auto_773806 - BLOCK
      ?auto_773807 - BLOCK
      ?auto_773808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_773808 ) ( ON-TABLE ?auto_773791 ) ( ON ?auto_773792 ?auto_773791 ) ( ON ?auto_773793 ?auto_773792 ) ( ON ?auto_773794 ?auto_773793 ) ( ON ?auto_773795 ?auto_773794 ) ( ON ?auto_773796 ?auto_773795 ) ( ON ?auto_773797 ?auto_773796 ) ( ON ?auto_773798 ?auto_773797 ) ( ON ?auto_773799 ?auto_773798 ) ( ON ?auto_773800 ?auto_773799 ) ( ON ?auto_773801 ?auto_773800 ) ( ON ?auto_773802 ?auto_773801 ) ( ON ?auto_773803 ?auto_773802 ) ( ON ?auto_773804 ?auto_773803 ) ( not ( = ?auto_773791 ?auto_773792 ) ) ( not ( = ?auto_773791 ?auto_773793 ) ) ( not ( = ?auto_773791 ?auto_773794 ) ) ( not ( = ?auto_773791 ?auto_773795 ) ) ( not ( = ?auto_773791 ?auto_773796 ) ) ( not ( = ?auto_773791 ?auto_773797 ) ) ( not ( = ?auto_773791 ?auto_773798 ) ) ( not ( = ?auto_773791 ?auto_773799 ) ) ( not ( = ?auto_773791 ?auto_773800 ) ) ( not ( = ?auto_773791 ?auto_773801 ) ) ( not ( = ?auto_773791 ?auto_773802 ) ) ( not ( = ?auto_773791 ?auto_773803 ) ) ( not ( = ?auto_773791 ?auto_773804 ) ) ( not ( = ?auto_773791 ?auto_773805 ) ) ( not ( = ?auto_773791 ?auto_773806 ) ) ( not ( = ?auto_773791 ?auto_773807 ) ) ( not ( = ?auto_773791 ?auto_773808 ) ) ( not ( = ?auto_773792 ?auto_773793 ) ) ( not ( = ?auto_773792 ?auto_773794 ) ) ( not ( = ?auto_773792 ?auto_773795 ) ) ( not ( = ?auto_773792 ?auto_773796 ) ) ( not ( = ?auto_773792 ?auto_773797 ) ) ( not ( = ?auto_773792 ?auto_773798 ) ) ( not ( = ?auto_773792 ?auto_773799 ) ) ( not ( = ?auto_773792 ?auto_773800 ) ) ( not ( = ?auto_773792 ?auto_773801 ) ) ( not ( = ?auto_773792 ?auto_773802 ) ) ( not ( = ?auto_773792 ?auto_773803 ) ) ( not ( = ?auto_773792 ?auto_773804 ) ) ( not ( = ?auto_773792 ?auto_773805 ) ) ( not ( = ?auto_773792 ?auto_773806 ) ) ( not ( = ?auto_773792 ?auto_773807 ) ) ( not ( = ?auto_773792 ?auto_773808 ) ) ( not ( = ?auto_773793 ?auto_773794 ) ) ( not ( = ?auto_773793 ?auto_773795 ) ) ( not ( = ?auto_773793 ?auto_773796 ) ) ( not ( = ?auto_773793 ?auto_773797 ) ) ( not ( = ?auto_773793 ?auto_773798 ) ) ( not ( = ?auto_773793 ?auto_773799 ) ) ( not ( = ?auto_773793 ?auto_773800 ) ) ( not ( = ?auto_773793 ?auto_773801 ) ) ( not ( = ?auto_773793 ?auto_773802 ) ) ( not ( = ?auto_773793 ?auto_773803 ) ) ( not ( = ?auto_773793 ?auto_773804 ) ) ( not ( = ?auto_773793 ?auto_773805 ) ) ( not ( = ?auto_773793 ?auto_773806 ) ) ( not ( = ?auto_773793 ?auto_773807 ) ) ( not ( = ?auto_773793 ?auto_773808 ) ) ( not ( = ?auto_773794 ?auto_773795 ) ) ( not ( = ?auto_773794 ?auto_773796 ) ) ( not ( = ?auto_773794 ?auto_773797 ) ) ( not ( = ?auto_773794 ?auto_773798 ) ) ( not ( = ?auto_773794 ?auto_773799 ) ) ( not ( = ?auto_773794 ?auto_773800 ) ) ( not ( = ?auto_773794 ?auto_773801 ) ) ( not ( = ?auto_773794 ?auto_773802 ) ) ( not ( = ?auto_773794 ?auto_773803 ) ) ( not ( = ?auto_773794 ?auto_773804 ) ) ( not ( = ?auto_773794 ?auto_773805 ) ) ( not ( = ?auto_773794 ?auto_773806 ) ) ( not ( = ?auto_773794 ?auto_773807 ) ) ( not ( = ?auto_773794 ?auto_773808 ) ) ( not ( = ?auto_773795 ?auto_773796 ) ) ( not ( = ?auto_773795 ?auto_773797 ) ) ( not ( = ?auto_773795 ?auto_773798 ) ) ( not ( = ?auto_773795 ?auto_773799 ) ) ( not ( = ?auto_773795 ?auto_773800 ) ) ( not ( = ?auto_773795 ?auto_773801 ) ) ( not ( = ?auto_773795 ?auto_773802 ) ) ( not ( = ?auto_773795 ?auto_773803 ) ) ( not ( = ?auto_773795 ?auto_773804 ) ) ( not ( = ?auto_773795 ?auto_773805 ) ) ( not ( = ?auto_773795 ?auto_773806 ) ) ( not ( = ?auto_773795 ?auto_773807 ) ) ( not ( = ?auto_773795 ?auto_773808 ) ) ( not ( = ?auto_773796 ?auto_773797 ) ) ( not ( = ?auto_773796 ?auto_773798 ) ) ( not ( = ?auto_773796 ?auto_773799 ) ) ( not ( = ?auto_773796 ?auto_773800 ) ) ( not ( = ?auto_773796 ?auto_773801 ) ) ( not ( = ?auto_773796 ?auto_773802 ) ) ( not ( = ?auto_773796 ?auto_773803 ) ) ( not ( = ?auto_773796 ?auto_773804 ) ) ( not ( = ?auto_773796 ?auto_773805 ) ) ( not ( = ?auto_773796 ?auto_773806 ) ) ( not ( = ?auto_773796 ?auto_773807 ) ) ( not ( = ?auto_773796 ?auto_773808 ) ) ( not ( = ?auto_773797 ?auto_773798 ) ) ( not ( = ?auto_773797 ?auto_773799 ) ) ( not ( = ?auto_773797 ?auto_773800 ) ) ( not ( = ?auto_773797 ?auto_773801 ) ) ( not ( = ?auto_773797 ?auto_773802 ) ) ( not ( = ?auto_773797 ?auto_773803 ) ) ( not ( = ?auto_773797 ?auto_773804 ) ) ( not ( = ?auto_773797 ?auto_773805 ) ) ( not ( = ?auto_773797 ?auto_773806 ) ) ( not ( = ?auto_773797 ?auto_773807 ) ) ( not ( = ?auto_773797 ?auto_773808 ) ) ( not ( = ?auto_773798 ?auto_773799 ) ) ( not ( = ?auto_773798 ?auto_773800 ) ) ( not ( = ?auto_773798 ?auto_773801 ) ) ( not ( = ?auto_773798 ?auto_773802 ) ) ( not ( = ?auto_773798 ?auto_773803 ) ) ( not ( = ?auto_773798 ?auto_773804 ) ) ( not ( = ?auto_773798 ?auto_773805 ) ) ( not ( = ?auto_773798 ?auto_773806 ) ) ( not ( = ?auto_773798 ?auto_773807 ) ) ( not ( = ?auto_773798 ?auto_773808 ) ) ( not ( = ?auto_773799 ?auto_773800 ) ) ( not ( = ?auto_773799 ?auto_773801 ) ) ( not ( = ?auto_773799 ?auto_773802 ) ) ( not ( = ?auto_773799 ?auto_773803 ) ) ( not ( = ?auto_773799 ?auto_773804 ) ) ( not ( = ?auto_773799 ?auto_773805 ) ) ( not ( = ?auto_773799 ?auto_773806 ) ) ( not ( = ?auto_773799 ?auto_773807 ) ) ( not ( = ?auto_773799 ?auto_773808 ) ) ( not ( = ?auto_773800 ?auto_773801 ) ) ( not ( = ?auto_773800 ?auto_773802 ) ) ( not ( = ?auto_773800 ?auto_773803 ) ) ( not ( = ?auto_773800 ?auto_773804 ) ) ( not ( = ?auto_773800 ?auto_773805 ) ) ( not ( = ?auto_773800 ?auto_773806 ) ) ( not ( = ?auto_773800 ?auto_773807 ) ) ( not ( = ?auto_773800 ?auto_773808 ) ) ( not ( = ?auto_773801 ?auto_773802 ) ) ( not ( = ?auto_773801 ?auto_773803 ) ) ( not ( = ?auto_773801 ?auto_773804 ) ) ( not ( = ?auto_773801 ?auto_773805 ) ) ( not ( = ?auto_773801 ?auto_773806 ) ) ( not ( = ?auto_773801 ?auto_773807 ) ) ( not ( = ?auto_773801 ?auto_773808 ) ) ( not ( = ?auto_773802 ?auto_773803 ) ) ( not ( = ?auto_773802 ?auto_773804 ) ) ( not ( = ?auto_773802 ?auto_773805 ) ) ( not ( = ?auto_773802 ?auto_773806 ) ) ( not ( = ?auto_773802 ?auto_773807 ) ) ( not ( = ?auto_773802 ?auto_773808 ) ) ( not ( = ?auto_773803 ?auto_773804 ) ) ( not ( = ?auto_773803 ?auto_773805 ) ) ( not ( = ?auto_773803 ?auto_773806 ) ) ( not ( = ?auto_773803 ?auto_773807 ) ) ( not ( = ?auto_773803 ?auto_773808 ) ) ( not ( = ?auto_773804 ?auto_773805 ) ) ( not ( = ?auto_773804 ?auto_773806 ) ) ( not ( = ?auto_773804 ?auto_773807 ) ) ( not ( = ?auto_773804 ?auto_773808 ) ) ( not ( = ?auto_773805 ?auto_773806 ) ) ( not ( = ?auto_773805 ?auto_773807 ) ) ( not ( = ?auto_773805 ?auto_773808 ) ) ( not ( = ?auto_773806 ?auto_773807 ) ) ( not ( = ?auto_773806 ?auto_773808 ) ) ( not ( = ?auto_773807 ?auto_773808 ) ) ( ON ?auto_773807 ?auto_773808 ) ( ON ?auto_773806 ?auto_773807 ) ( CLEAR ?auto_773804 ) ( ON ?auto_773805 ?auto_773806 ) ( CLEAR ?auto_773805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_773791 ?auto_773792 ?auto_773793 ?auto_773794 ?auto_773795 ?auto_773796 ?auto_773797 ?auto_773798 ?auto_773799 ?auto_773800 ?auto_773801 ?auto_773802 ?auto_773803 ?auto_773804 ?auto_773805 )
      ( MAKE-18PILE ?auto_773791 ?auto_773792 ?auto_773793 ?auto_773794 ?auto_773795 ?auto_773796 ?auto_773797 ?auto_773798 ?auto_773799 ?auto_773800 ?auto_773801 ?auto_773802 ?auto_773803 ?auto_773804 ?auto_773805 ?auto_773806 ?auto_773807 ?auto_773808 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_773827 - BLOCK
      ?auto_773828 - BLOCK
      ?auto_773829 - BLOCK
      ?auto_773830 - BLOCK
      ?auto_773831 - BLOCK
      ?auto_773832 - BLOCK
      ?auto_773833 - BLOCK
      ?auto_773834 - BLOCK
      ?auto_773835 - BLOCK
      ?auto_773836 - BLOCK
      ?auto_773837 - BLOCK
      ?auto_773838 - BLOCK
      ?auto_773839 - BLOCK
      ?auto_773840 - BLOCK
      ?auto_773841 - BLOCK
      ?auto_773842 - BLOCK
      ?auto_773843 - BLOCK
      ?auto_773844 - BLOCK
    )
    :vars
    (
      ?auto_773845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_773844 ?auto_773845 ) ( ON-TABLE ?auto_773827 ) ( ON ?auto_773828 ?auto_773827 ) ( ON ?auto_773829 ?auto_773828 ) ( ON ?auto_773830 ?auto_773829 ) ( ON ?auto_773831 ?auto_773830 ) ( ON ?auto_773832 ?auto_773831 ) ( ON ?auto_773833 ?auto_773832 ) ( ON ?auto_773834 ?auto_773833 ) ( ON ?auto_773835 ?auto_773834 ) ( ON ?auto_773836 ?auto_773835 ) ( ON ?auto_773837 ?auto_773836 ) ( ON ?auto_773838 ?auto_773837 ) ( ON ?auto_773839 ?auto_773838 ) ( not ( = ?auto_773827 ?auto_773828 ) ) ( not ( = ?auto_773827 ?auto_773829 ) ) ( not ( = ?auto_773827 ?auto_773830 ) ) ( not ( = ?auto_773827 ?auto_773831 ) ) ( not ( = ?auto_773827 ?auto_773832 ) ) ( not ( = ?auto_773827 ?auto_773833 ) ) ( not ( = ?auto_773827 ?auto_773834 ) ) ( not ( = ?auto_773827 ?auto_773835 ) ) ( not ( = ?auto_773827 ?auto_773836 ) ) ( not ( = ?auto_773827 ?auto_773837 ) ) ( not ( = ?auto_773827 ?auto_773838 ) ) ( not ( = ?auto_773827 ?auto_773839 ) ) ( not ( = ?auto_773827 ?auto_773840 ) ) ( not ( = ?auto_773827 ?auto_773841 ) ) ( not ( = ?auto_773827 ?auto_773842 ) ) ( not ( = ?auto_773827 ?auto_773843 ) ) ( not ( = ?auto_773827 ?auto_773844 ) ) ( not ( = ?auto_773827 ?auto_773845 ) ) ( not ( = ?auto_773828 ?auto_773829 ) ) ( not ( = ?auto_773828 ?auto_773830 ) ) ( not ( = ?auto_773828 ?auto_773831 ) ) ( not ( = ?auto_773828 ?auto_773832 ) ) ( not ( = ?auto_773828 ?auto_773833 ) ) ( not ( = ?auto_773828 ?auto_773834 ) ) ( not ( = ?auto_773828 ?auto_773835 ) ) ( not ( = ?auto_773828 ?auto_773836 ) ) ( not ( = ?auto_773828 ?auto_773837 ) ) ( not ( = ?auto_773828 ?auto_773838 ) ) ( not ( = ?auto_773828 ?auto_773839 ) ) ( not ( = ?auto_773828 ?auto_773840 ) ) ( not ( = ?auto_773828 ?auto_773841 ) ) ( not ( = ?auto_773828 ?auto_773842 ) ) ( not ( = ?auto_773828 ?auto_773843 ) ) ( not ( = ?auto_773828 ?auto_773844 ) ) ( not ( = ?auto_773828 ?auto_773845 ) ) ( not ( = ?auto_773829 ?auto_773830 ) ) ( not ( = ?auto_773829 ?auto_773831 ) ) ( not ( = ?auto_773829 ?auto_773832 ) ) ( not ( = ?auto_773829 ?auto_773833 ) ) ( not ( = ?auto_773829 ?auto_773834 ) ) ( not ( = ?auto_773829 ?auto_773835 ) ) ( not ( = ?auto_773829 ?auto_773836 ) ) ( not ( = ?auto_773829 ?auto_773837 ) ) ( not ( = ?auto_773829 ?auto_773838 ) ) ( not ( = ?auto_773829 ?auto_773839 ) ) ( not ( = ?auto_773829 ?auto_773840 ) ) ( not ( = ?auto_773829 ?auto_773841 ) ) ( not ( = ?auto_773829 ?auto_773842 ) ) ( not ( = ?auto_773829 ?auto_773843 ) ) ( not ( = ?auto_773829 ?auto_773844 ) ) ( not ( = ?auto_773829 ?auto_773845 ) ) ( not ( = ?auto_773830 ?auto_773831 ) ) ( not ( = ?auto_773830 ?auto_773832 ) ) ( not ( = ?auto_773830 ?auto_773833 ) ) ( not ( = ?auto_773830 ?auto_773834 ) ) ( not ( = ?auto_773830 ?auto_773835 ) ) ( not ( = ?auto_773830 ?auto_773836 ) ) ( not ( = ?auto_773830 ?auto_773837 ) ) ( not ( = ?auto_773830 ?auto_773838 ) ) ( not ( = ?auto_773830 ?auto_773839 ) ) ( not ( = ?auto_773830 ?auto_773840 ) ) ( not ( = ?auto_773830 ?auto_773841 ) ) ( not ( = ?auto_773830 ?auto_773842 ) ) ( not ( = ?auto_773830 ?auto_773843 ) ) ( not ( = ?auto_773830 ?auto_773844 ) ) ( not ( = ?auto_773830 ?auto_773845 ) ) ( not ( = ?auto_773831 ?auto_773832 ) ) ( not ( = ?auto_773831 ?auto_773833 ) ) ( not ( = ?auto_773831 ?auto_773834 ) ) ( not ( = ?auto_773831 ?auto_773835 ) ) ( not ( = ?auto_773831 ?auto_773836 ) ) ( not ( = ?auto_773831 ?auto_773837 ) ) ( not ( = ?auto_773831 ?auto_773838 ) ) ( not ( = ?auto_773831 ?auto_773839 ) ) ( not ( = ?auto_773831 ?auto_773840 ) ) ( not ( = ?auto_773831 ?auto_773841 ) ) ( not ( = ?auto_773831 ?auto_773842 ) ) ( not ( = ?auto_773831 ?auto_773843 ) ) ( not ( = ?auto_773831 ?auto_773844 ) ) ( not ( = ?auto_773831 ?auto_773845 ) ) ( not ( = ?auto_773832 ?auto_773833 ) ) ( not ( = ?auto_773832 ?auto_773834 ) ) ( not ( = ?auto_773832 ?auto_773835 ) ) ( not ( = ?auto_773832 ?auto_773836 ) ) ( not ( = ?auto_773832 ?auto_773837 ) ) ( not ( = ?auto_773832 ?auto_773838 ) ) ( not ( = ?auto_773832 ?auto_773839 ) ) ( not ( = ?auto_773832 ?auto_773840 ) ) ( not ( = ?auto_773832 ?auto_773841 ) ) ( not ( = ?auto_773832 ?auto_773842 ) ) ( not ( = ?auto_773832 ?auto_773843 ) ) ( not ( = ?auto_773832 ?auto_773844 ) ) ( not ( = ?auto_773832 ?auto_773845 ) ) ( not ( = ?auto_773833 ?auto_773834 ) ) ( not ( = ?auto_773833 ?auto_773835 ) ) ( not ( = ?auto_773833 ?auto_773836 ) ) ( not ( = ?auto_773833 ?auto_773837 ) ) ( not ( = ?auto_773833 ?auto_773838 ) ) ( not ( = ?auto_773833 ?auto_773839 ) ) ( not ( = ?auto_773833 ?auto_773840 ) ) ( not ( = ?auto_773833 ?auto_773841 ) ) ( not ( = ?auto_773833 ?auto_773842 ) ) ( not ( = ?auto_773833 ?auto_773843 ) ) ( not ( = ?auto_773833 ?auto_773844 ) ) ( not ( = ?auto_773833 ?auto_773845 ) ) ( not ( = ?auto_773834 ?auto_773835 ) ) ( not ( = ?auto_773834 ?auto_773836 ) ) ( not ( = ?auto_773834 ?auto_773837 ) ) ( not ( = ?auto_773834 ?auto_773838 ) ) ( not ( = ?auto_773834 ?auto_773839 ) ) ( not ( = ?auto_773834 ?auto_773840 ) ) ( not ( = ?auto_773834 ?auto_773841 ) ) ( not ( = ?auto_773834 ?auto_773842 ) ) ( not ( = ?auto_773834 ?auto_773843 ) ) ( not ( = ?auto_773834 ?auto_773844 ) ) ( not ( = ?auto_773834 ?auto_773845 ) ) ( not ( = ?auto_773835 ?auto_773836 ) ) ( not ( = ?auto_773835 ?auto_773837 ) ) ( not ( = ?auto_773835 ?auto_773838 ) ) ( not ( = ?auto_773835 ?auto_773839 ) ) ( not ( = ?auto_773835 ?auto_773840 ) ) ( not ( = ?auto_773835 ?auto_773841 ) ) ( not ( = ?auto_773835 ?auto_773842 ) ) ( not ( = ?auto_773835 ?auto_773843 ) ) ( not ( = ?auto_773835 ?auto_773844 ) ) ( not ( = ?auto_773835 ?auto_773845 ) ) ( not ( = ?auto_773836 ?auto_773837 ) ) ( not ( = ?auto_773836 ?auto_773838 ) ) ( not ( = ?auto_773836 ?auto_773839 ) ) ( not ( = ?auto_773836 ?auto_773840 ) ) ( not ( = ?auto_773836 ?auto_773841 ) ) ( not ( = ?auto_773836 ?auto_773842 ) ) ( not ( = ?auto_773836 ?auto_773843 ) ) ( not ( = ?auto_773836 ?auto_773844 ) ) ( not ( = ?auto_773836 ?auto_773845 ) ) ( not ( = ?auto_773837 ?auto_773838 ) ) ( not ( = ?auto_773837 ?auto_773839 ) ) ( not ( = ?auto_773837 ?auto_773840 ) ) ( not ( = ?auto_773837 ?auto_773841 ) ) ( not ( = ?auto_773837 ?auto_773842 ) ) ( not ( = ?auto_773837 ?auto_773843 ) ) ( not ( = ?auto_773837 ?auto_773844 ) ) ( not ( = ?auto_773837 ?auto_773845 ) ) ( not ( = ?auto_773838 ?auto_773839 ) ) ( not ( = ?auto_773838 ?auto_773840 ) ) ( not ( = ?auto_773838 ?auto_773841 ) ) ( not ( = ?auto_773838 ?auto_773842 ) ) ( not ( = ?auto_773838 ?auto_773843 ) ) ( not ( = ?auto_773838 ?auto_773844 ) ) ( not ( = ?auto_773838 ?auto_773845 ) ) ( not ( = ?auto_773839 ?auto_773840 ) ) ( not ( = ?auto_773839 ?auto_773841 ) ) ( not ( = ?auto_773839 ?auto_773842 ) ) ( not ( = ?auto_773839 ?auto_773843 ) ) ( not ( = ?auto_773839 ?auto_773844 ) ) ( not ( = ?auto_773839 ?auto_773845 ) ) ( not ( = ?auto_773840 ?auto_773841 ) ) ( not ( = ?auto_773840 ?auto_773842 ) ) ( not ( = ?auto_773840 ?auto_773843 ) ) ( not ( = ?auto_773840 ?auto_773844 ) ) ( not ( = ?auto_773840 ?auto_773845 ) ) ( not ( = ?auto_773841 ?auto_773842 ) ) ( not ( = ?auto_773841 ?auto_773843 ) ) ( not ( = ?auto_773841 ?auto_773844 ) ) ( not ( = ?auto_773841 ?auto_773845 ) ) ( not ( = ?auto_773842 ?auto_773843 ) ) ( not ( = ?auto_773842 ?auto_773844 ) ) ( not ( = ?auto_773842 ?auto_773845 ) ) ( not ( = ?auto_773843 ?auto_773844 ) ) ( not ( = ?auto_773843 ?auto_773845 ) ) ( not ( = ?auto_773844 ?auto_773845 ) ) ( ON ?auto_773843 ?auto_773844 ) ( ON ?auto_773842 ?auto_773843 ) ( ON ?auto_773841 ?auto_773842 ) ( CLEAR ?auto_773839 ) ( ON ?auto_773840 ?auto_773841 ) ( CLEAR ?auto_773840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_773827 ?auto_773828 ?auto_773829 ?auto_773830 ?auto_773831 ?auto_773832 ?auto_773833 ?auto_773834 ?auto_773835 ?auto_773836 ?auto_773837 ?auto_773838 ?auto_773839 ?auto_773840 )
      ( MAKE-18PILE ?auto_773827 ?auto_773828 ?auto_773829 ?auto_773830 ?auto_773831 ?auto_773832 ?auto_773833 ?auto_773834 ?auto_773835 ?auto_773836 ?auto_773837 ?auto_773838 ?auto_773839 ?auto_773840 ?auto_773841 ?auto_773842 ?auto_773843 ?auto_773844 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_773864 - BLOCK
      ?auto_773865 - BLOCK
      ?auto_773866 - BLOCK
      ?auto_773867 - BLOCK
      ?auto_773868 - BLOCK
      ?auto_773869 - BLOCK
      ?auto_773870 - BLOCK
      ?auto_773871 - BLOCK
      ?auto_773872 - BLOCK
      ?auto_773873 - BLOCK
      ?auto_773874 - BLOCK
      ?auto_773875 - BLOCK
      ?auto_773876 - BLOCK
      ?auto_773877 - BLOCK
      ?auto_773878 - BLOCK
      ?auto_773879 - BLOCK
      ?auto_773880 - BLOCK
      ?auto_773881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_773881 ) ( ON-TABLE ?auto_773864 ) ( ON ?auto_773865 ?auto_773864 ) ( ON ?auto_773866 ?auto_773865 ) ( ON ?auto_773867 ?auto_773866 ) ( ON ?auto_773868 ?auto_773867 ) ( ON ?auto_773869 ?auto_773868 ) ( ON ?auto_773870 ?auto_773869 ) ( ON ?auto_773871 ?auto_773870 ) ( ON ?auto_773872 ?auto_773871 ) ( ON ?auto_773873 ?auto_773872 ) ( ON ?auto_773874 ?auto_773873 ) ( ON ?auto_773875 ?auto_773874 ) ( ON ?auto_773876 ?auto_773875 ) ( not ( = ?auto_773864 ?auto_773865 ) ) ( not ( = ?auto_773864 ?auto_773866 ) ) ( not ( = ?auto_773864 ?auto_773867 ) ) ( not ( = ?auto_773864 ?auto_773868 ) ) ( not ( = ?auto_773864 ?auto_773869 ) ) ( not ( = ?auto_773864 ?auto_773870 ) ) ( not ( = ?auto_773864 ?auto_773871 ) ) ( not ( = ?auto_773864 ?auto_773872 ) ) ( not ( = ?auto_773864 ?auto_773873 ) ) ( not ( = ?auto_773864 ?auto_773874 ) ) ( not ( = ?auto_773864 ?auto_773875 ) ) ( not ( = ?auto_773864 ?auto_773876 ) ) ( not ( = ?auto_773864 ?auto_773877 ) ) ( not ( = ?auto_773864 ?auto_773878 ) ) ( not ( = ?auto_773864 ?auto_773879 ) ) ( not ( = ?auto_773864 ?auto_773880 ) ) ( not ( = ?auto_773864 ?auto_773881 ) ) ( not ( = ?auto_773865 ?auto_773866 ) ) ( not ( = ?auto_773865 ?auto_773867 ) ) ( not ( = ?auto_773865 ?auto_773868 ) ) ( not ( = ?auto_773865 ?auto_773869 ) ) ( not ( = ?auto_773865 ?auto_773870 ) ) ( not ( = ?auto_773865 ?auto_773871 ) ) ( not ( = ?auto_773865 ?auto_773872 ) ) ( not ( = ?auto_773865 ?auto_773873 ) ) ( not ( = ?auto_773865 ?auto_773874 ) ) ( not ( = ?auto_773865 ?auto_773875 ) ) ( not ( = ?auto_773865 ?auto_773876 ) ) ( not ( = ?auto_773865 ?auto_773877 ) ) ( not ( = ?auto_773865 ?auto_773878 ) ) ( not ( = ?auto_773865 ?auto_773879 ) ) ( not ( = ?auto_773865 ?auto_773880 ) ) ( not ( = ?auto_773865 ?auto_773881 ) ) ( not ( = ?auto_773866 ?auto_773867 ) ) ( not ( = ?auto_773866 ?auto_773868 ) ) ( not ( = ?auto_773866 ?auto_773869 ) ) ( not ( = ?auto_773866 ?auto_773870 ) ) ( not ( = ?auto_773866 ?auto_773871 ) ) ( not ( = ?auto_773866 ?auto_773872 ) ) ( not ( = ?auto_773866 ?auto_773873 ) ) ( not ( = ?auto_773866 ?auto_773874 ) ) ( not ( = ?auto_773866 ?auto_773875 ) ) ( not ( = ?auto_773866 ?auto_773876 ) ) ( not ( = ?auto_773866 ?auto_773877 ) ) ( not ( = ?auto_773866 ?auto_773878 ) ) ( not ( = ?auto_773866 ?auto_773879 ) ) ( not ( = ?auto_773866 ?auto_773880 ) ) ( not ( = ?auto_773866 ?auto_773881 ) ) ( not ( = ?auto_773867 ?auto_773868 ) ) ( not ( = ?auto_773867 ?auto_773869 ) ) ( not ( = ?auto_773867 ?auto_773870 ) ) ( not ( = ?auto_773867 ?auto_773871 ) ) ( not ( = ?auto_773867 ?auto_773872 ) ) ( not ( = ?auto_773867 ?auto_773873 ) ) ( not ( = ?auto_773867 ?auto_773874 ) ) ( not ( = ?auto_773867 ?auto_773875 ) ) ( not ( = ?auto_773867 ?auto_773876 ) ) ( not ( = ?auto_773867 ?auto_773877 ) ) ( not ( = ?auto_773867 ?auto_773878 ) ) ( not ( = ?auto_773867 ?auto_773879 ) ) ( not ( = ?auto_773867 ?auto_773880 ) ) ( not ( = ?auto_773867 ?auto_773881 ) ) ( not ( = ?auto_773868 ?auto_773869 ) ) ( not ( = ?auto_773868 ?auto_773870 ) ) ( not ( = ?auto_773868 ?auto_773871 ) ) ( not ( = ?auto_773868 ?auto_773872 ) ) ( not ( = ?auto_773868 ?auto_773873 ) ) ( not ( = ?auto_773868 ?auto_773874 ) ) ( not ( = ?auto_773868 ?auto_773875 ) ) ( not ( = ?auto_773868 ?auto_773876 ) ) ( not ( = ?auto_773868 ?auto_773877 ) ) ( not ( = ?auto_773868 ?auto_773878 ) ) ( not ( = ?auto_773868 ?auto_773879 ) ) ( not ( = ?auto_773868 ?auto_773880 ) ) ( not ( = ?auto_773868 ?auto_773881 ) ) ( not ( = ?auto_773869 ?auto_773870 ) ) ( not ( = ?auto_773869 ?auto_773871 ) ) ( not ( = ?auto_773869 ?auto_773872 ) ) ( not ( = ?auto_773869 ?auto_773873 ) ) ( not ( = ?auto_773869 ?auto_773874 ) ) ( not ( = ?auto_773869 ?auto_773875 ) ) ( not ( = ?auto_773869 ?auto_773876 ) ) ( not ( = ?auto_773869 ?auto_773877 ) ) ( not ( = ?auto_773869 ?auto_773878 ) ) ( not ( = ?auto_773869 ?auto_773879 ) ) ( not ( = ?auto_773869 ?auto_773880 ) ) ( not ( = ?auto_773869 ?auto_773881 ) ) ( not ( = ?auto_773870 ?auto_773871 ) ) ( not ( = ?auto_773870 ?auto_773872 ) ) ( not ( = ?auto_773870 ?auto_773873 ) ) ( not ( = ?auto_773870 ?auto_773874 ) ) ( not ( = ?auto_773870 ?auto_773875 ) ) ( not ( = ?auto_773870 ?auto_773876 ) ) ( not ( = ?auto_773870 ?auto_773877 ) ) ( not ( = ?auto_773870 ?auto_773878 ) ) ( not ( = ?auto_773870 ?auto_773879 ) ) ( not ( = ?auto_773870 ?auto_773880 ) ) ( not ( = ?auto_773870 ?auto_773881 ) ) ( not ( = ?auto_773871 ?auto_773872 ) ) ( not ( = ?auto_773871 ?auto_773873 ) ) ( not ( = ?auto_773871 ?auto_773874 ) ) ( not ( = ?auto_773871 ?auto_773875 ) ) ( not ( = ?auto_773871 ?auto_773876 ) ) ( not ( = ?auto_773871 ?auto_773877 ) ) ( not ( = ?auto_773871 ?auto_773878 ) ) ( not ( = ?auto_773871 ?auto_773879 ) ) ( not ( = ?auto_773871 ?auto_773880 ) ) ( not ( = ?auto_773871 ?auto_773881 ) ) ( not ( = ?auto_773872 ?auto_773873 ) ) ( not ( = ?auto_773872 ?auto_773874 ) ) ( not ( = ?auto_773872 ?auto_773875 ) ) ( not ( = ?auto_773872 ?auto_773876 ) ) ( not ( = ?auto_773872 ?auto_773877 ) ) ( not ( = ?auto_773872 ?auto_773878 ) ) ( not ( = ?auto_773872 ?auto_773879 ) ) ( not ( = ?auto_773872 ?auto_773880 ) ) ( not ( = ?auto_773872 ?auto_773881 ) ) ( not ( = ?auto_773873 ?auto_773874 ) ) ( not ( = ?auto_773873 ?auto_773875 ) ) ( not ( = ?auto_773873 ?auto_773876 ) ) ( not ( = ?auto_773873 ?auto_773877 ) ) ( not ( = ?auto_773873 ?auto_773878 ) ) ( not ( = ?auto_773873 ?auto_773879 ) ) ( not ( = ?auto_773873 ?auto_773880 ) ) ( not ( = ?auto_773873 ?auto_773881 ) ) ( not ( = ?auto_773874 ?auto_773875 ) ) ( not ( = ?auto_773874 ?auto_773876 ) ) ( not ( = ?auto_773874 ?auto_773877 ) ) ( not ( = ?auto_773874 ?auto_773878 ) ) ( not ( = ?auto_773874 ?auto_773879 ) ) ( not ( = ?auto_773874 ?auto_773880 ) ) ( not ( = ?auto_773874 ?auto_773881 ) ) ( not ( = ?auto_773875 ?auto_773876 ) ) ( not ( = ?auto_773875 ?auto_773877 ) ) ( not ( = ?auto_773875 ?auto_773878 ) ) ( not ( = ?auto_773875 ?auto_773879 ) ) ( not ( = ?auto_773875 ?auto_773880 ) ) ( not ( = ?auto_773875 ?auto_773881 ) ) ( not ( = ?auto_773876 ?auto_773877 ) ) ( not ( = ?auto_773876 ?auto_773878 ) ) ( not ( = ?auto_773876 ?auto_773879 ) ) ( not ( = ?auto_773876 ?auto_773880 ) ) ( not ( = ?auto_773876 ?auto_773881 ) ) ( not ( = ?auto_773877 ?auto_773878 ) ) ( not ( = ?auto_773877 ?auto_773879 ) ) ( not ( = ?auto_773877 ?auto_773880 ) ) ( not ( = ?auto_773877 ?auto_773881 ) ) ( not ( = ?auto_773878 ?auto_773879 ) ) ( not ( = ?auto_773878 ?auto_773880 ) ) ( not ( = ?auto_773878 ?auto_773881 ) ) ( not ( = ?auto_773879 ?auto_773880 ) ) ( not ( = ?auto_773879 ?auto_773881 ) ) ( not ( = ?auto_773880 ?auto_773881 ) ) ( ON ?auto_773880 ?auto_773881 ) ( ON ?auto_773879 ?auto_773880 ) ( ON ?auto_773878 ?auto_773879 ) ( CLEAR ?auto_773876 ) ( ON ?auto_773877 ?auto_773878 ) ( CLEAR ?auto_773877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_773864 ?auto_773865 ?auto_773866 ?auto_773867 ?auto_773868 ?auto_773869 ?auto_773870 ?auto_773871 ?auto_773872 ?auto_773873 ?auto_773874 ?auto_773875 ?auto_773876 ?auto_773877 )
      ( MAKE-18PILE ?auto_773864 ?auto_773865 ?auto_773866 ?auto_773867 ?auto_773868 ?auto_773869 ?auto_773870 ?auto_773871 ?auto_773872 ?auto_773873 ?auto_773874 ?auto_773875 ?auto_773876 ?auto_773877 ?auto_773878 ?auto_773879 ?auto_773880 ?auto_773881 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_773900 - BLOCK
      ?auto_773901 - BLOCK
      ?auto_773902 - BLOCK
      ?auto_773903 - BLOCK
      ?auto_773904 - BLOCK
      ?auto_773905 - BLOCK
      ?auto_773906 - BLOCK
      ?auto_773907 - BLOCK
      ?auto_773908 - BLOCK
      ?auto_773909 - BLOCK
      ?auto_773910 - BLOCK
      ?auto_773911 - BLOCK
      ?auto_773912 - BLOCK
      ?auto_773913 - BLOCK
      ?auto_773914 - BLOCK
      ?auto_773915 - BLOCK
      ?auto_773916 - BLOCK
      ?auto_773917 - BLOCK
    )
    :vars
    (
      ?auto_773918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_773917 ?auto_773918 ) ( ON-TABLE ?auto_773900 ) ( ON ?auto_773901 ?auto_773900 ) ( ON ?auto_773902 ?auto_773901 ) ( ON ?auto_773903 ?auto_773902 ) ( ON ?auto_773904 ?auto_773903 ) ( ON ?auto_773905 ?auto_773904 ) ( ON ?auto_773906 ?auto_773905 ) ( ON ?auto_773907 ?auto_773906 ) ( ON ?auto_773908 ?auto_773907 ) ( ON ?auto_773909 ?auto_773908 ) ( ON ?auto_773910 ?auto_773909 ) ( ON ?auto_773911 ?auto_773910 ) ( not ( = ?auto_773900 ?auto_773901 ) ) ( not ( = ?auto_773900 ?auto_773902 ) ) ( not ( = ?auto_773900 ?auto_773903 ) ) ( not ( = ?auto_773900 ?auto_773904 ) ) ( not ( = ?auto_773900 ?auto_773905 ) ) ( not ( = ?auto_773900 ?auto_773906 ) ) ( not ( = ?auto_773900 ?auto_773907 ) ) ( not ( = ?auto_773900 ?auto_773908 ) ) ( not ( = ?auto_773900 ?auto_773909 ) ) ( not ( = ?auto_773900 ?auto_773910 ) ) ( not ( = ?auto_773900 ?auto_773911 ) ) ( not ( = ?auto_773900 ?auto_773912 ) ) ( not ( = ?auto_773900 ?auto_773913 ) ) ( not ( = ?auto_773900 ?auto_773914 ) ) ( not ( = ?auto_773900 ?auto_773915 ) ) ( not ( = ?auto_773900 ?auto_773916 ) ) ( not ( = ?auto_773900 ?auto_773917 ) ) ( not ( = ?auto_773900 ?auto_773918 ) ) ( not ( = ?auto_773901 ?auto_773902 ) ) ( not ( = ?auto_773901 ?auto_773903 ) ) ( not ( = ?auto_773901 ?auto_773904 ) ) ( not ( = ?auto_773901 ?auto_773905 ) ) ( not ( = ?auto_773901 ?auto_773906 ) ) ( not ( = ?auto_773901 ?auto_773907 ) ) ( not ( = ?auto_773901 ?auto_773908 ) ) ( not ( = ?auto_773901 ?auto_773909 ) ) ( not ( = ?auto_773901 ?auto_773910 ) ) ( not ( = ?auto_773901 ?auto_773911 ) ) ( not ( = ?auto_773901 ?auto_773912 ) ) ( not ( = ?auto_773901 ?auto_773913 ) ) ( not ( = ?auto_773901 ?auto_773914 ) ) ( not ( = ?auto_773901 ?auto_773915 ) ) ( not ( = ?auto_773901 ?auto_773916 ) ) ( not ( = ?auto_773901 ?auto_773917 ) ) ( not ( = ?auto_773901 ?auto_773918 ) ) ( not ( = ?auto_773902 ?auto_773903 ) ) ( not ( = ?auto_773902 ?auto_773904 ) ) ( not ( = ?auto_773902 ?auto_773905 ) ) ( not ( = ?auto_773902 ?auto_773906 ) ) ( not ( = ?auto_773902 ?auto_773907 ) ) ( not ( = ?auto_773902 ?auto_773908 ) ) ( not ( = ?auto_773902 ?auto_773909 ) ) ( not ( = ?auto_773902 ?auto_773910 ) ) ( not ( = ?auto_773902 ?auto_773911 ) ) ( not ( = ?auto_773902 ?auto_773912 ) ) ( not ( = ?auto_773902 ?auto_773913 ) ) ( not ( = ?auto_773902 ?auto_773914 ) ) ( not ( = ?auto_773902 ?auto_773915 ) ) ( not ( = ?auto_773902 ?auto_773916 ) ) ( not ( = ?auto_773902 ?auto_773917 ) ) ( not ( = ?auto_773902 ?auto_773918 ) ) ( not ( = ?auto_773903 ?auto_773904 ) ) ( not ( = ?auto_773903 ?auto_773905 ) ) ( not ( = ?auto_773903 ?auto_773906 ) ) ( not ( = ?auto_773903 ?auto_773907 ) ) ( not ( = ?auto_773903 ?auto_773908 ) ) ( not ( = ?auto_773903 ?auto_773909 ) ) ( not ( = ?auto_773903 ?auto_773910 ) ) ( not ( = ?auto_773903 ?auto_773911 ) ) ( not ( = ?auto_773903 ?auto_773912 ) ) ( not ( = ?auto_773903 ?auto_773913 ) ) ( not ( = ?auto_773903 ?auto_773914 ) ) ( not ( = ?auto_773903 ?auto_773915 ) ) ( not ( = ?auto_773903 ?auto_773916 ) ) ( not ( = ?auto_773903 ?auto_773917 ) ) ( not ( = ?auto_773903 ?auto_773918 ) ) ( not ( = ?auto_773904 ?auto_773905 ) ) ( not ( = ?auto_773904 ?auto_773906 ) ) ( not ( = ?auto_773904 ?auto_773907 ) ) ( not ( = ?auto_773904 ?auto_773908 ) ) ( not ( = ?auto_773904 ?auto_773909 ) ) ( not ( = ?auto_773904 ?auto_773910 ) ) ( not ( = ?auto_773904 ?auto_773911 ) ) ( not ( = ?auto_773904 ?auto_773912 ) ) ( not ( = ?auto_773904 ?auto_773913 ) ) ( not ( = ?auto_773904 ?auto_773914 ) ) ( not ( = ?auto_773904 ?auto_773915 ) ) ( not ( = ?auto_773904 ?auto_773916 ) ) ( not ( = ?auto_773904 ?auto_773917 ) ) ( not ( = ?auto_773904 ?auto_773918 ) ) ( not ( = ?auto_773905 ?auto_773906 ) ) ( not ( = ?auto_773905 ?auto_773907 ) ) ( not ( = ?auto_773905 ?auto_773908 ) ) ( not ( = ?auto_773905 ?auto_773909 ) ) ( not ( = ?auto_773905 ?auto_773910 ) ) ( not ( = ?auto_773905 ?auto_773911 ) ) ( not ( = ?auto_773905 ?auto_773912 ) ) ( not ( = ?auto_773905 ?auto_773913 ) ) ( not ( = ?auto_773905 ?auto_773914 ) ) ( not ( = ?auto_773905 ?auto_773915 ) ) ( not ( = ?auto_773905 ?auto_773916 ) ) ( not ( = ?auto_773905 ?auto_773917 ) ) ( not ( = ?auto_773905 ?auto_773918 ) ) ( not ( = ?auto_773906 ?auto_773907 ) ) ( not ( = ?auto_773906 ?auto_773908 ) ) ( not ( = ?auto_773906 ?auto_773909 ) ) ( not ( = ?auto_773906 ?auto_773910 ) ) ( not ( = ?auto_773906 ?auto_773911 ) ) ( not ( = ?auto_773906 ?auto_773912 ) ) ( not ( = ?auto_773906 ?auto_773913 ) ) ( not ( = ?auto_773906 ?auto_773914 ) ) ( not ( = ?auto_773906 ?auto_773915 ) ) ( not ( = ?auto_773906 ?auto_773916 ) ) ( not ( = ?auto_773906 ?auto_773917 ) ) ( not ( = ?auto_773906 ?auto_773918 ) ) ( not ( = ?auto_773907 ?auto_773908 ) ) ( not ( = ?auto_773907 ?auto_773909 ) ) ( not ( = ?auto_773907 ?auto_773910 ) ) ( not ( = ?auto_773907 ?auto_773911 ) ) ( not ( = ?auto_773907 ?auto_773912 ) ) ( not ( = ?auto_773907 ?auto_773913 ) ) ( not ( = ?auto_773907 ?auto_773914 ) ) ( not ( = ?auto_773907 ?auto_773915 ) ) ( not ( = ?auto_773907 ?auto_773916 ) ) ( not ( = ?auto_773907 ?auto_773917 ) ) ( not ( = ?auto_773907 ?auto_773918 ) ) ( not ( = ?auto_773908 ?auto_773909 ) ) ( not ( = ?auto_773908 ?auto_773910 ) ) ( not ( = ?auto_773908 ?auto_773911 ) ) ( not ( = ?auto_773908 ?auto_773912 ) ) ( not ( = ?auto_773908 ?auto_773913 ) ) ( not ( = ?auto_773908 ?auto_773914 ) ) ( not ( = ?auto_773908 ?auto_773915 ) ) ( not ( = ?auto_773908 ?auto_773916 ) ) ( not ( = ?auto_773908 ?auto_773917 ) ) ( not ( = ?auto_773908 ?auto_773918 ) ) ( not ( = ?auto_773909 ?auto_773910 ) ) ( not ( = ?auto_773909 ?auto_773911 ) ) ( not ( = ?auto_773909 ?auto_773912 ) ) ( not ( = ?auto_773909 ?auto_773913 ) ) ( not ( = ?auto_773909 ?auto_773914 ) ) ( not ( = ?auto_773909 ?auto_773915 ) ) ( not ( = ?auto_773909 ?auto_773916 ) ) ( not ( = ?auto_773909 ?auto_773917 ) ) ( not ( = ?auto_773909 ?auto_773918 ) ) ( not ( = ?auto_773910 ?auto_773911 ) ) ( not ( = ?auto_773910 ?auto_773912 ) ) ( not ( = ?auto_773910 ?auto_773913 ) ) ( not ( = ?auto_773910 ?auto_773914 ) ) ( not ( = ?auto_773910 ?auto_773915 ) ) ( not ( = ?auto_773910 ?auto_773916 ) ) ( not ( = ?auto_773910 ?auto_773917 ) ) ( not ( = ?auto_773910 ?auto_773918 ) ) ( not ( = ?auto_773911 ?auto_773912 ) ) ( not ( = ?auto_773911 ?auto_773913 ) ) ( not ( = ?auto_773911 ?auto_773914 ) ) ( not ( = ?auto_773911 ?auto_773915 ) ) ( not ( = ?auto_773911 ?auto_773916 ) ) ( not ( = ?auto_773911 ?auto_773917 ) ) ( not ( = ?auto_773911 ?auto_773918 ) ) ( not ( = ?auto_773912 ?auto_773913 ) ) ( not ( = ?auto_773912 ?auto_773914 ) ) ( not ( = ?auto_773912 ?auto_773915 ) ) ( not ( = ?auto_773912 ?auto_773916 ) ) ( not ( = ?auto_773912 ?auto_773917 ) ) ( not ( = ?auto_773912 ?auto_773918 ) ) ( not ( = ?auto_773913 ?auto_773914 ) ) ( not ( = ?auto_773913 ?auto_773915 ) ) ( not ( = ?auto_773913 ?auto_773916 ) ) ( not ( = ?auto_773913 ?auto_773917 ) ) ( not ( = ?auto_773913 ?auto_773918 ) ) ( not ( = ?auto_773914 ?auto_773915 ) ) ( not ( = ?auto_773914 ?auto_773916 ) ) ( not ( = ?auto_773914 ?auto_773917 ) ) ( not ( = ?auto_773914 ?auto_773918 ) ) ( not ( = ?auto_773915 ?auto_773916 ) ) ( not ( = ?auto_773915 ?auto_773917 ) ) ( not ( = ?auto_773915 ?auto_773918 ) ) ( not ( = ?auto_773916 ?auto_773917 ) ) ( not ( = ?auto_773916 ?auto_773918 ) ) ( not ( = ?auto_773917 ?auto_773918 ) ) ( ON ?auto_773916 ?auto_773917 ) ( ON ?auto_773915 ?auto_773916 ) ( ON ?auto_773914 ?auto_773915 ) ( ON ?auto_773913 ?auto_773914 ) ( CLEAR ?auto_773911 ) ( ON ?auto_773912 ?auto_773913 ) ( CLEAR ?auto_773912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_773900 ?auto_773901 ?auto_773902 ?auto_773903 ?auto_773904 ?auto_773905 ?auto_773906 ?auto_773907 ?auto_773908 ?auto_773909 ?auto_773910 ?auto_773911 ?auto_773912 )
      ( MAKE-18PILE ?auto_773900 ?auto_773901 ?auto_773902 ?auto_773903 ?auto_773904 ?auto_773905 ?auto_773906 ?auto_773907 ?auto_773908 ?auto_773909 ?auto_773910 ?auto_773911 ?auto_773912 ?auto_773913 ?auto_773914 ?auto_773915 ?auto_773916 ?auto_773917 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_773937 - BLOCK
      ?auto_773938 - BLOCK
      ?auto_773939 - BLOCK
      ?auto_773940 - BLOCK
      ?auto_773941 - BLOCK
      ?auto_773942 - BLOCK
      ?auto_773943 - BLOCK
      ?auto_773944 - BLOCK
      ?auto_773945 - BLOCK
      ?auto_773946 - BLOCK
      ?auto_773947 - BLOCK
      ?auto_773948 - BLOCK
      ?auto_773949 - BLOCK
      ?auto_773950 - BLOCK
      ?auto_773951 - BLOCK
      ?auto_773952 - BLOCK
      ?auto_773953 - BLOCK
      ?auto_773954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_773954 ) ( ON-TABLE ?auto_773937 ) ( ON ?auto_773938 ?auto_773937 ) ( ON ?auto_773939 ?auto_773938 ) ( ON ?auto_773940 ?auto_773939 ) ( ON ?auto_773941 ?auto_773940 ) ( ON ?auto_773942 ?auto_773941 ) ( ON ?auto_773943 ?auto_773942 ) ( ON ?auto_773944 ?auto_773943 ) ( ON ?auto_773945 ?auto_773944 ) ( ON ?auto_773946 ?auto_773945 ) ( ON ?auto_773947 ?auto_773946 ) ( ON ?auto_773948 ?auto_773947 ) ( not ( = ?auto_773937 ?auto_773938 ) ) ( not ( = ?auto_773937 ?auto_773939 ) ) ( not ( = ?auto_773937 ?auto_773940 ) ) ( not ( = ?auto_773937 ?auto_773941 ) ) ( not ( = ?auto_773937 ?auto_773942 ) ) ( not ( = ?auto_773937 ?auto_773943 ) ) ( not ( = ?auto_773937 ?auto_773944 ) ) ( not ( = ?auto_773937 ?auto_773945 ) ) ( not ( = ?auto_773937 ?auto_773946 ) ) ( not ( = ?auto_773937 ?auto_773947 ) ) ( not ( = ?auto_773937 ?auto_773948 ) ) ( not ( = ?auto_773937 ?auto_773949 ) ) ( not ( = ?auto_773937 ?auto_773950 ) ) ( not ( = ?auto_773937 ?auto_773951 ) ) ( not ( = ?auto_773937 ?auto_773952 ) ) ( not ( = ?auto_773937 ?auto_773953 ) ) ( not ( = ?auto_773937 ?auto_773954 ) ) ( not ( = ?auto_773938 ?auto_773939 ) ) ( not ( = ?auto_773938 ?auto_773940 ) ) ( not ( = ?auto_773938 ?auto_773941 ) ) ( not ( = ?auto_773938 ?auto_773942 ) ) ( not ( = ?auto_773938 ?auto_773943 ) ) ( not ( = ?auto_773938 ?auto_773944 ) ) ( not ( = ?auto_773938 ?auto_773945 ) ) ( not ( = ?auto_773938 ?auto_773946 ) ) ( not ( = ?auto_773938 ?auto_773947 ) ) ( not ( = ?auto_773938 ?auto_773948 ) ) ( not ( = ?auto_773938 ?auto_773949 ) ) ( not ( = ?auto_773938 ?auto_773950 ) ) ( not ( = ?auto_773938 ?auto_773951 ) ) ( not ( = ?auto_773938 ?auto_773952 ) ) ( not ( = ?auto_773938 ?auto_773953 ) ) ( not ( = ?auto_773938 ?auto_773954 ) ) ( not ( = ?auto_773939 ?auto_773940 ) ) ( not ( = ?auto_773939 ?auto_773941 ) ) ( not ( = ?auto_773939 ?auto_773942 ) ) ( not ( = ?auto_773939 ?auto_773943 ) ) ( not ( = ?auto_773939 ?auto_773944 ) ) ( not ( = ?auto_773939 ?auto_773945 ) ) ( not ( = ?auto_773939 ?auto_773946 ) ) ( not ( = ?auto_773939 ?auto_773947 ) ) ( not ( = ?auto_773939 ?auto_773948 ) ) ( not ( = ?auto_773939 ?auto_773949 ) ) ( not ( = ?auto_773939 ?auto_773950 ) ) ( not ( = ?auto_773939 ?auto_773951 ) ) ( not ( = ?auto_773939 ?auto_773952 ) ) ( not ( = ?auto_773939 ?auto_773953 ) ) ( not ( = ?auto_773939 ?auto_773954 ) ) ( not ( = ?auto_773940 ?auto_773941 ) ) ( not ( = ?auto_773940 ?auto_773942 ) ) ( not ( = ?auto_773940 ?auto_773943 ) ) ( not ( = ?auto_773940 ?auto_773944 ) ) ( not ( = ?auto_773940 ?auto_773945 ) ) ( not ( = ?auto_773940 ?auto_773946 ) ) ( not ( = ?auto_773940 ?auto_773947 ) ) ( not ( = ?auto_773940 ?auto_773948 ) ) ( not ( = ?auto_773940 ?auto_773949 ) ) ( not ( = ?auto_773940 ?auto_773950 ) ) ( not ( = ?auto_773940 ?auto_773951 ) ) ( not ( = ?auto_773940 ?auto_773952 ) ) ( not ( = ?auto_773940 ?auto_773953 ) ) ( not ( = ?auto_773940 ?auto_773954 ) ) ( not ( = ?auto_773941 ?auto_773942 ) ) ( not ( = ?auto_773941 ?auto_773943 ) ) ( not ( = ?auto_773941 ?auto_773944 ) ) ( not ( = ?auto_773941 ?auto_773945 ) ) ( not ( = ?auto_773941 ?auto_773946 ) ) ( not ( = ?auto_773941 ?auto_773947 ) ) ( not ( = ?auto_773941 ?auto_773948 ) ) ( not ( = ?auto_773941 ?auto_773949 ) ) ( not ( = ?auto_773941 ?auto_773950 ) ) ( not ( = ?auto_773941 ?auto_773951 ) ) ( not ( = ?auto_773941 ?auto_773952 ) ) ( not ( = ?auto_773941 ?auto_773953 ) ) ( not ( = ?auto_773941 ?auto_773954 ) ) ( not ( = ?auto_773942 ?auto_773943 ) ) ( not ( = ?auto_773942 ?auto_773944 ) ) ( not ( = ?auto_773942 ?auto_773945 ) ) ( not ( = ?auto_773942 ?auto_773946 ) ) ( not ( = ?auto_773942 ?auto_773947 ) ) ( not ( = ?auto_773942 ?auto_773948 ) ) ( not ( = ?auto_773942 ?auto_773949 ) ) ( not ( = ?auto_773942 ?auto_773950 ) ) ( not ( = ?auto_773942 ?auto_773951 ) ) ( not ( = ?auto_773942 ?auto_773952 ) ) ( not ( = ?auto_773942 ?auto_773953 ) ) ( not ( = ?auto_773942 ?auto_773954 ) ) ( not ( = ?auto_773943 ?auto_773944 ) ) ( not ( = ?auto_773943 ?auto_773945 ) ) ( not ( = ?auto_773943 ?auto_773946 ) ) ( not ( = ?auto_773943 ?auto_773947 ) ) ( not ( = ?auto_773943 ?auto_773948 ) ) ( not ( = ?auto_773943 ?auto_773949 ) ) ( not ( = ?auto_773943 ?auto_773950 ) ) ( not ( = ?auto_773943 ?auto_773951 ) ) ( not ( = ?auto_773943 ?auto_773952 ) ) ( not ( = ?auto_773943 ?auto_773953 ) ) ( not ( = ?auto_773943 ?auto_773954 ) ) ( not ( = ?auto_773944 ?auto_773945 ) ) ( not ( = ?auto_773944 ?auto_773946 ) ) ( not ( = ?auto_773944 ?auto_773947 ) ) ( not ( = ?auto_773944 ?auto_773948 ) ) ( not ( = ?auto_773944 ?auto_773949 ) ) ( not ( = ?auto_773944 ?auto_773950 ) ) ( not ( = ?auto_773944 ?auto_773951 ) ) ( not ( = ?auto_773944 ?auto_773952 ) ) ( not ( = ?auto_773944 ?auto_773953 ) ) ( not ( = ?auto_773944 ?auto_773954 ) ) ( not ( = ?auto_773945 ?auto_773946 ) ) ( not ( = ?auto_773945 ?auto_773947 ) ) ( not ( = ?auto_773945 ?auto_773948 ) ) ( not ( = ?auto_773945 ?auto_773949 ) ) ( not ( = ?auto_773945 ?auto_773950 ) ) ( not ( = ?auto_773945 ?auto_773951 ) ) ( not ( = ?auto_773945 ?auto_773952 ) ) ( not ( = ?auto_773945 ?auto_773953 ) ) ( not ( = ?auto_773945 ?auto_773954 ) ) ( not ( = ?auto_773946 ?auto_773947 ) ) ( not ( = ?auto_773946 ?auto_773948 ) ) ( not ( = ?auto_773946 ?auto_773949 ) ) ( not ( = ?auto_773946 ?auto_773950 ) ) ( not ( = ?auto_773946 ?auto_773951 ) ) ( not ( = ?auto_773946 ?auto_773952 ) ) ( not ( = ?auto_773946 ?auto_773953 ) ) ( not ( = ?auto_773946 ?auto_773954 ) ) ( not ( = ?auto_773947 ?auto_773948 ) ) ( not ( = ?auto_773947 ?auto_773949 ) ) ( not ( = ?auto_773947 ?auto_773950 ) ) ( not ( = ?auto_773947 ?auto_773951 ) ) ( not ( = ?auto_773947 ?auto_773952 ) ) ( not ( = ?auto_773947 ?auto_773953 ) ) ( not ( = ?auto_773947 ?auto_773954 ) ) ( not ( = ?auto_773948 ?auto_773949 ) ) ( not ( = ?auto_773948 ?auto_773950 ) ) ( not ( = ?auto_773948 ?auto_773951 ) ) ( not ( = ?auto_773948 ?auto_773952 ) ) ( not ( = ?auto_773948 ?auto_773953 ) ) ( not ( = ?auto_773948 ?auto_773954 ) ) ( not ( = ?auto_773949 ?auto_773950 ) ) ( not ( = ?auto_773949 ?auto_773951 ) ) ( not ( = ?auto_773949 ?auto_773952 ) ) ( not ( = ?auto_773949 ?auto_773953 ) ) ( not ( = ?auto_773949 ?auto_773954 ) ) ( not ( = ?auto_773950 ?auto_773951 ) ) ( not ( = ?auto_773950 ?auto_773952 ) ) ( not ( = ?auto_773950 ?auto_773953 ) ) ( not ( = ?auto_773950 ?auto_773954 ) ) ( not ( = ?auto_773951 ?auto_773952 ) ) ( not ( = ?auto_773951 ?auto_773953 ) ) ( not ( = ?auto_773951 ?auto_773954 ) ) ( not ( = ?auto_773952 ?auto_773953 ) ) ( not ( = ?auto_773952 ?auto_773954 ) ) ( not ( = ?auto_773953 ?auto_773954 ) ) ( ON ?auto_773953 ?auto_773954 ) ( ON ?auto_773952 ?auto_773953 ) ( ON ?auto_773951 ?auto_773952 ) ( ON ?auto_773950 ?auto_773951 ) ( CLEAR ?auto_773948 ) ( ON ?auto_773949 ?auto_773950 ) ( CLEAR ?auto_773949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_773937 ?auto_773938 ?auto_773939 ?auto_773940 ?auto_773941 ?auto_773942 ?auto_773943 ?auto_773944 ?auto_773945 ?auto_773946 ?auto_773947 ?auto_773948 ?auto_773949 )
      ( MAKE-18PILE ?auto_773937 ?auto_773938 ?auto_773939 ?auto_773940 ?auto_773941 ?auto_773942 ?auto_773943 ?auto_773944 ?auto_773945 ?auto_773946 ?auto_773947 ?auto_773948 ?auto_773949 ?auto_773950 ?auto_773951 ?auto_773952 ?auto_773953 ?auto_773954 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_773973 - BLOCK
      ?auto_773974 - BLOCK
      ?auto_773975 - BLOCK
      ?auto_773976 - BLOCK
      ?auto_773977 - BLOCK
      ?auto_773978 - BLOCK
      ?auto_773979 - BLOCK
      ?auto_773980 - BLOCK
      ?auto_773981 - BLOCK
      ?auto_773982 - BLOCK
      ?auto_773983 - BLOCK
      ?auto_773984 - BLOCK
      ?auto_773985 - BLOCK
      ?auto_773986 - BLOCK
      ?auto_773987 - BLOCK
      ?auto_773988 - BLOCK
      ?auto_773989 - BLOCK
      ?auto_773990 - BLOCK
    )
    :vars
    (
      ?auto_773991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_773990 ?auto_773991 ) ( ON-TABLE ?auto_773973 ) ( ON ?auto_773974 ?auto_773973 ) ( ON ?auto_773975 ?auto_773974 ) ( ON ?auto_773976 ?auto_773975 ) ( ON ?auto_773977 ?auto_773976 ) ( ON ?auto_773978 ?auto_773977 ) ( ON ?auto_773979 ?auto_773978 ) ( ON ?auto_773980 ?auto_773979 ) ( ON ?auto_773981 ?auto_773980 ) ( ON ?auto_773982 ?auto_773981 ) ( ON ?auto_773983 ?auto_773982 ) ( not ( = ?auto_773973 ?auto_773974 ) ) ( not ( = ?auto_773973 ?auto_773975 ) ) ( not ( = ?auto_773973 ?auto_773976 ) ) ( not ( = ?auto_773973 ?auto_773977 ) ) ( not ( = ?auto_773973 ?auto_773978 ) ) ( not ( = ?auto_773973 ?auto_773979 ) ) ( not ( = ?auto_773973 ?auto_773980 ) ) ( not ( = ?auto_773973 ?auto_773981 ) ) ( not ( = ?auto_773973 ?auto_773982 ) ) ( not ( = ?auto_773973 ?auto_773983 ) ) ( not ( = ?auto_773973 ?auto_773984 ) ) ( not ( = ?auto_773973 ?auto_773985 ) ) ( not ( = ?auto_773973 ?auto_773986 ) ) ( not ( = ?auto_773973 ?auto_773987 ) ) ( not ( = ?auto_773973 ?auto_773988 ) ) ( not ( = ?auto_773973 ?auto_773989 ) ) ( not ( = ?auto_773973 ?auto_773990 ) ) ( not ( = ?auto_773973 ?auto_773991 ) ) ( not ( = ?auto_773974 ?auto_773975 ) ) ( not ( = ?auto_773974 ?auto_773976 ) ) ( not ( = ?auto_773974 ?auto_773977 ) ) ( not ( = ?auto_773974 ?auto_773978 ) ) ( not ( = ?auto_773974 ?auto_773979 ) ) ( not ( = ?auto_773974 ?auto_773980 ) ) ( not ( = ?auto_773974 ?auto_773981 ) ) ( not ( = ?auto_773974 ?auto_773982 ) ) ( not ( = ?auto_773974 ?auto_773983 ) ) ( not ( = ?auto_773974 ?auto_773984 ) ) ( not ( = ?auto_773974 ?auto_773985 ) ) ( not ( = ?auto_773974 ?auto_773986 ) ) ( not ( = ?auto_773974 ?auto_773987 ) ) ( not ( = ?auto_773974 ?auto_773988 ) ) ( not ( = ?auto_773974 ?auto_773989 ) ) ( not ( = ?auto_773974 ?auto_773990 ) ) ( not ( = ?auto_773974 ?auto_773991 ) ) ( not ( = ?auto_773975 ?auto_773976 ) ) ( not ( = ?auto_773975 ?auto_773977 ) ) ( not ( = ?auto_773975 ?auto_773978 ) ) ( not ( = ?auto_773975 ?auto_773979 ) ) ( not ( = ?auto_773975 ?auto_773980 ) ) ( not ( = ?auto_773975 ?auto_773981 ) ) ( not ( = ?auto_773975 ?auto_773982 ) ) ( not ( = ?auto_773975 ?auto_773983 ) ) ( not ( = ?auto_773975 ?auto_773984 ) ) ( not ( = ?auto_773975 ?auto_773985 ) ) ( not ( = ?auto_773975 ?auto_773986 ) ) ( not ( = ?auto_773975 ?auto_773987 ) ) ( not ( = ?auto_773975 ?auto_773988 ) ) ( not ( = ?auto_773975 ?auto_773989 ) ) ( not ( = ?auto_773975 ?auto_773990 ) ) ( not ( = ?auto_773975 ?auto_773991 ) ) ( not ( = ?auto_773976 ?auto_773977 ) ) ( not ( = ?auto_773976 ?auto_773978 ) ) ( not ( = ?auto_773976 ?auto_773979 ) ) ( not ( = ?auto_773976 ?auto_773980 ) ) ( not ( = ?auto_773976 ?auto_773981 ) ) ( not ( = ?auto_773976 ?auto_773982 ) ) ( not ( = ?auto_773976 ?auto_773983 ) ) ( not ( = ?auto_773976 ?auto_773984 ) ) ( not ( = ?auto_773976 ?auto_773985 ) ) ( not ( = ?auto_773976 ?auto_773986 ) ) ( not ( = ?auto_773976 ?auto_773987 ) ) ( not ( = ?auto_773976 ?auto_773988 ) ) ( not ( = ?auto_773976 ?auto_773989 ) ) ( not ( = ?auto_773976 ?auto_773990 ) ) ( not ( = ?auto_773976 ?auto_773991 ) ) ( not ( = ?auto_773977 ?auto_773978 ) ) ( not ( = ?auto_773977 ?auto_773979 ) ) ( not ( = ?auto_773977 ?auto_773980 ) ) ( not ( = ?auto_773977 ?auto_773981 ) ) ( not ( = ?auto_773977 ?auto_773982 ) ) ( not ( = ?auto_773977 ?auto_773983 ) ) ( not ( = ?auto_773977 ?auto_773984 ) ) ( not ( = ?auto_773977 ?auto_773985 ) ) ( not ( = ?auto_773977 ?auto_773986 ) ) ( not ( = ?auto_773977 ?auto_773987 ) ) ( not ( = ?auto_773977 ?auto_773988 ) ) ( not ( = ?auto_773977 ?auto_773989 ) ) ( not ( = ?auto_773977 ?auto_773990 ) ) ( not ( = ?auto_773977 ?auto_773991 ) ) ( not ( = ?auto_773978 ?auto_773979 ) ) ( not ( = ?auto_773978 ?auto_773980 ) ) ( not ( = ?auto_773978 ?auto_773981 ) ) ( not ( = ?auto_773978 ?auto_773982 ) ) ( not ( = ?auto_773978 ?auto_773983 ) ) ( not ( = ?auto_773978 ?auto_773984 ) ) ( not ( = ?auto_773978 ?auto_773985 ) ) ( not ( = ?auto_773978 ?auto_773986 ) ) ( not ( = ?auto_773978 ?auto_773987 ) ) ( not ( = ?auto_773978 ?auto_773988 ) ) ( not ( = ?auto_773978 ?auto_773989 ) ) ( not ( = ?auto_773978 ?auto_773990 ) ) ( not ( = ?auto_773978 ?auto_773991 ) ) ( not ( = ?auto_773979 ?auto_773980 ) ) ( not ( = ?auto_773979 ?auto_773981 ) ) ( not ( = ?auto_773979 ?auto_773982 ) ) ( not ( = ?auto_773979 ?auto_773983 ) ) ( not ( = ?auto_773979 ?auto_773984 ) ) ( not ( = ?auto_773979 ?auto_773985 ) ) ( not ( = ?auto_773979 ?auto_773986 ) ) ( not ( = ?auto_773979 ?auto_773987 ) ) ( not ( = ?auto_773979 ?auto_773988 ) ) ( not ( = ?auto_773979 ?auto_773989 ) ) ( not ( = ?auto_773979 ?auto_773990 ) ) ( not ( = ?auto_773979 ?auto_773991 ) ) ( not ( = ?auto_773980 ?auto_773981 ) ) ( not ( = ?auto_773980 ?auto_773982 ) ) ( not ( = ?auto_773980 ?auto_773983 ) ) ( not ( = ?auto_773980 ?auto_773984 ) ) ( not ( = ?auto_773980 ?auto_773985 ) ) ( not ( = ?auto_773980 ?auto_773986 ) ) ( not ( = ?auto_773980 ?auto_773987 ) ) ( not ( = ?auto_773980 ?auto_773988 ) ) ( not ( = ?auto_773980 ?auto_773989 ) ) ( not ( = ?auto_773980 ?auto_773990 ) ) ( not ( = ?auto_773980 ?auto_773991 ) ) ( not ( = ?auto_773981 ?auto_773982 ) ) ( not ( = ?auto_773981 ?auto_773983 ) ) ( not ( = ?auto_773981 ?auto_773984 ) ) ( not ( = ?auto_773981 ?auto_773985 ) ) ( not ( = ?auto_773981 ?auto_773986 ) ) ( not ( = ?auto_773981 ?auto_773987 ) ) ( not ( = ?auto_773981 ?auto_773988 ) ) ( not ( = ?auto_773981 ?auto_773989 ) ) ( not ( = ?auto_773981 ?auto_773990 ) ) ( not ( = ?auto_773981 ?auto_773991 ) ) ( not ( = ?auto_773982 ?auto_773983 ) ) ( not ( = ?auto_773982 ?auto_773984 ) ) ( not ( = ?auto_773982 ?auto_773985 ) ) ( not ( = ?auto_773982 ?auto_773986 ) ) ( not ( = ?auto_773982 ?auto_773987 ) ) ( not ( = ?auto_773982 ?auto_773988 ) ) ( not ( = ?auto_773982 ?auto_773989 ) ) ( not ( = ?auto_773982 ?auto_773990 ) ) ( not ( = ?auto_773982 ?auto_773991 ) ) ( not ( = ?auto_773983 ?auto_773984 ) ) ( not ( = ?auto_773983 ?auto_773985 ) ) ( not ( = ?auto_773983 ?auto_773986 ) ) ( not ( = ?auto_773983 ?auto_773987 ) ) ( not ( = ?auto_773983 ?auto_773988 ) ) ( not ( = ?auto_773983 ?auto_773989 ) ) ( not ( = ?auto_773983 ?auto_773990 ) ) ( not ( = ?auto_773983 ?auto_773991 ) ) ( not ( = ?auto_773984 ?auto_773985 ) ) ( not ( = ?auto_773984 ?auto_773986 ) ) ( not ( = ?auto_773984 ?auto_773987 ) ) ( not ( = ?auto_773984 ?auto_773988 ) ) ( not ( = ?auto_773984 ?auto_773989 ) ) ( not ( = ?auto_773984 ?auto_773990 ) ) ( not ( = ?auto_773984 ?auto_773991 ) ) ( not ( = ?auto_773985 ?auto_773986 ) ) ( not ( = ?auto_773985 ?auto_773987 ) ) ( not ( = ?auto_773985 ?auto_773988 ) ) ( not ( = ?auto_773985 ?auto_773989 ) ) ( not ( = ?auto_773985 ?auto_773990 ) ) ( not ( = ?auto_773985 ?auto_773991 ) ) ( not ( = ?auto_773986 ?auto_773987 ) ) ( not ( = ?auto_773986 ?auto_773988 ) ) ( not ( = ?auto_773986 ?auto_773989 ) ) ( not ( = ?auto_773986 ?auto_773990 ) ) ( not ( = ?auto_773986 ?auto_773991 ) ) ( not ( = ?auto_773987 ?auto_773988 ) ) ( not ( = ?auto_773987 ?auto_773989 ) ) ( not ( = ?auto_773987 ?auto_773990 ) ) ( not ( = ?auto_773987 ?auto_773991 ) ) ( not ( = ?auto_773988 ?auto_773989 ) ) ( not ( = ?auto_773988 ?auto_773990 ) ) ( not ( = ?auto_773988 ?auto_773991 ) ) ( not ( = ?auto_773989 ?auto_773990 ) ) ( not ( = ?auto_773989 ?auto_773991 ) ) ( not ( = ?auto_773990 ?auto_773991 ) ) ( ON ?auto_773989 ?auto_773990 ) ( ON ?auto_773988 ?auto_773989 ) ( ON ?auto_773987 ?auto_773988 ) ( ON ?auto_773986 ?auto_773987 ) ( ON ?auto_773985 ?auto_773986 ) ( CLEAR ?auto_773983 ) ( ON ?auto_773984 ?auto_773985 ) ( CLEAR ?auto_773984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_773973 ?auto_773974 ?auto_773975 ?auto_773976 ?auto_773977 ?auto_773978 ?auto_773979 ?auto_773980 ?auto_773981 ?auto_773982 ?auto_773983 ?auto_773984 )
      ( MAKE-18PILE ?auto_773973 ?auto_773974 ?auto_773975 ?auto_773976 ?auto_773977 ?auto_773978 ?auto_773979 ?auto_773980 ?auto_773981 ?auto_773982 ?auto_773983 ?auto_773984 ?auto_773985 ?auto_773986 ?auto_773987 ?auto_773988 ?auto_773989 ?auto_773990 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774010 - BLOCK
      ?auto_774011 - BLOCK
      ?auto_774012 - BLOCK
      ?auto_774013 - BLOCK
      ?auto_774014 - BLOCK
      ?auto_774015 - BLOCK
      ?auto_774016 - BLOCK
      ?auto_774017 - BLOCK
      ?auto_774018 - BLOCK
      ?auto_774019 - BLOCK
      ?auto_774020 - BLOCK
      ?auto_774021 - BLOCK
      ?auto_774022 - BLOCK
      ?auto_774023 - BLOCK
      ?auto_774024 - BLOCK
      ?auto_774025 - BLOCK
      ?auto_774026 - BLOCK
      ?auto_774027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_774027 ) ( ON-TABLE ?auto_774010 ) ( ON ?auto_774011 ?auto_774010 ) ( ON ?auto_774012 ?auto_774011 ) ( ON ?auto_774013 ?auto_774012 ) ( ON ?auto_774014 ?auto_774013 ) ( ON ?auto_774015 ?auto_774014 ) ( ON ?auto_774016 ?auto_774015 ) ( ON ?auto_774017 ?auto_774016 ) ( ON ?auto_774018 ?auto_774017 ) ( ON ?auto_774019 ?auto_774018 ) ( ON ?auto_774020 ?auto_774019 ) ( not ( = ?auto_774010 ?auto_774011 ) ) ( not ( = ?auto_774010 ?auto_774012 ) ) ( not ( = ?auto_774010 ?auto_774013 ) ) ( not ( = ?auto_774010 ?auto_774014 ) ) ( not ( = ?auto_774010 ?auto_774015 ) ) ( not ( = ?auto_774010 ?auto_774016 ) ) ( not ( = ?auto_774010 ?auto_774017 ) ) ( not ( = ?auto_774010 ?auto_774018 ) ) ( not ( = ?auto_774010 ?auto_774019 ) ) ( not ( = ?auto_774010 ?auto_774020 ) ) ( not ( = ?auto_774010 ?auto_774021 ) ) ( not ( = ?auto_774010 ?auto_774022 ) ) ( not ( = ?auto_774010 ?auto_774023 ) ) ( not ( = ?auto_774010 ?auto_774024 ) ) ( not ( = ?auto_774010 ?auto_774025 ) ) ( not ( = ?auto_774010 ?auto_774026 ) ) ( not ( = ?auto_774010 ?auto_774027 ) ) ( not ( = ?auto_774011 ?auto_774012 ) ) ( not ( = ?auto_774011 ?auto_774013 ) ) ( not ( = ?auto_774011 ?auto_774014 ) ) ( not ( = ?auto_774011 ?auto_774015 ) ) ( not ( = ?auto_774011 ?auto_774016 ) ) ( not ( = ?auto_774011 ?auto_774017 ) ) ( not ( = ?auto_774011 ?auto_774018 ) ) ( not ( = ?auto_774011 ?auto_774019 ) ) ( not ( = ?auto_774011 ?auto_774020 ) ) ( not ( = ?auto_774011 ?auto_774021 ) ) ( not ( = ?auto_774011 ?auto_774022 ) ) ( not ( = ?auto_774011 ?auto_774023 ) ) ( not ( = ?auto_774011 ?auto_774024 ) ) ( not ( = ?auto_774011 ?auto_774025 ) ) ( not ( = ?auto_774011 ?auto_774026 ) ) ( not ( = ?auto_774011 ?auto_774027 ) ) ( not ( = ?auto_774012 ?auto_774013 ) ) ( not ( = ?auto_774012 ?auto_774014 ) ) ( not ( = ?auto_774012 ?auto_774015 ) ) ( not ( = ?auto_774012 ?auto_774016 ) ) ( not ( = ?auto_774012 ?auto_774017 ) ) ( not ( = ?auto_774012 ?auto_774018 ) ) ( not ( = ?auto_774012 ?auto_774019 ) ) ( not ( = ?auto_774012 ?auto_774020 ) ) ( not ( = ?auto_774012 ?auto_774021 ) ) ( not ( = ?auto_774012 ?auto_774022 ) ) ( not ( = ?auto_774012 ?auto_774023 ) ) ( not ( = ?auto_774012 ?auto_774024 ) ) ( not ( = ?auto_774012 ?auto_774025 ) ) ( not ( = ?auto_774012 ?auto_774026 ) ) ( not ( = ?auto_774012 ?auto_774027 ) ) ( not ( = ?auto_774013 ?auto_774014 ) ) ( not ( = ?auto_774013 ?auto_774015 ) ) ( not ( = ?auto_774013 ?auto_774016 ) ) ( not ( = ?auto_774013 ?auto_774017 ) ) ( not ( = ?auto_774013 ?auto_774018 ) ) ( not ( = ?auto_774013 ?auto_774019 ) ) ( not ( = ?auto_774013 ?auto_774020 ) ) ( not ( = ?auto_774013 ?auto_774021 ) ) ( not ( = ?auto_774013 ?auto_774022 ) ) ( not ( = ?auto_774013 ?auto_774023 ) ) ( not ( = ?auto_774013 ?auto_774024 ) ) ( not ( = ?auto_774013 ?auto_774025 ) ) ( not ( = ?auto_774013 ?auto_774026 ) ) ( not ( = ?auto_774013 ?auto_774027 ) ) ( not ( = ?auto_774014 ?auto_774015 ) ) ( not ( = ?auto_774014 ?auto_774016 ) ) ( not ( = ?auto_774014 ?auto_774017 ) ) ( not ( = ?auto_774014 ?auto_774018 ) ) ( not ( = ?auto_774014 ?auto_774019 ) ) ( not ( = ?auto_774014 ?auto_774020 ) ) ( not ( = ?auto_774014 ?auto_774021 ) ) ( not ( = ?auto_774014 ?auto_774022 ) ) ( not ( = ?auto_774014 ?auto_774023 ) ) ( not ( = ?auto_774014 ?auto_774024 ) ) ( not ( = ?auto_774014 ?auto_774025 ) ) ( not ( = ?auto_774014 ?auto_774026 ) ) ( not ( = ?auto_774014 ?auto_774027 ) ) ( not ( = ?auto_774015 ?auto_774016 ) ) ( not ( = ?auto_774015 ?auto_774017 ) ) ( not ( = ?auto_774015 ?auto_774018 ) ) ( not ( = ?auto_774015 ?auto_774019 ) ) ( not ( = ?auto_774015 ?auto_774020 ) ) ( not ( = ?auto_774015 ?auto_774021 ) ) ( not ( = ?auto_774015 ?auto_774022 ) ) ( not ( = ?auto_774015 ?auto_774023 ) ) ( not ( = ?auto_774015 ?auto_774024 ) ) ( not ( = ?auto_774015 ?auto_774025 ) ) ( not ( = ?auto_774015 ?auto_774026 ) ) ( not ( = ?auto_774015 ?auto_774027 ) ) ( not ( = ?auto_774016 ?auto_774017 ) ) ( not ( = ?auto_774016 ?auto_774018 ) ) ( not ( = ?auto_774016 ?auto_774019 ) ) ( not ( = ?auto_774016 ?auto_774020 ) ) ( not ( = ?auto_774016 ?auto_774021 ) ) ( not ( = ?auto_774016 ?auto_774022 ) ) ( not ( = ?auto_774016 ?auto_774023 ) ) ( not ( = ?auto_774016 ?auto_774024 ) ) ( not ( = ?auto_774016 ?auto_774025 ) ) ( not ( = ?auto_774016 ?auto_774026 ) ) ( not ( = ?auto_774016 ?auto_774027 ) ) ( not ( = ?auto_774017 ?auto_774018 ) ) ( not ( = ?auto_774017 ?auto_774019 ) ) ( not ( = ?auto_774017 ?auto_774020 ) ) ( not ( = ?auto_774017 ?auto_774021 ) ) ( not ( = ?auto_774017 ?auto_774022 ) ) ( not ( = ?auto_774017 ?auto_774023 ) ) ( not ( = ?auto_774017 ?auto_774024 ) ) ( not ( = ?auto_774017 ?auto_774025 ) ) ( not ( = ?auto_774017 ?auto_774026 ) ) ( not ( = ?auto_774017 ?auto_774027 ) ) ( not ( = ?auto_774018 ?auto_774019 ) ) ( not ( = ?auto_774018 ?auto_774020 ) ) ( not ( = ?auto_774018 ?auto_774021 ) ) ( not ( = ?auto_774018 ?auto_774022 ) ) ( not ( = ?auto_774018 ?auto_774023 ) ) ( not ( = ?auto_774018 ?auto_774024 ) ) ( not ( = ?auto_774018 ?auto_774025 ) ) ( not ( = ?auto_774018 ?auto_774026 ) ) ( not ( = ?auto_774018 ?auto_774027 ) ) ( not ( = ?auto_774019 ?auto_774020 ) ) ( not ( = ?auto_774019 ?auto_774021 ) ) ( not ( = ?auto_774019 ?auto_774022 ) ) ( not ( = ?auto_774019 ?auto_774023 ) ) ( not ( = ?auto_774019 ?auto_774024 ) ) ( not ( = ?auto_774019 ?auto_774025 ) ) ( not ( = ?auto_774019 ?auto_774026 ) ) ( not ( = ?auto_774019 ?auto_774027 ) ) ( not ( = ?auto_774020 ?auto_774021 ) ) ( not ( = ?auto_774020 ?auto_774022 ) ) ( not ( = ?auto_774020 ?auto_774023 ) ) ( not ( = ?auto_774020 ?auto_774024 ) ) ( not ( = ?auto_774020 ?auto_774025 ) ) ( not ( = ?auto_774020 ?auto_774026 ) ) ( not ( = ?auto_774020 ?auto_774027 ) ) ( not ( = ?auto_774021 ?auto_774022 ) ) ( not ( = ?auto_774021 ?auto_774023 ) ) ( not ( = ?auto_774021 ?auto_774024 ) ) ( not ( = ?auto_774021 ?auto_774025 ) ) ( not ( = ?auto_774021 ?auto_774026 ) ) ( not ( = ?auto_774021 ?auto_774027 ) ) ( not ( = ?auto_774022 ?auto_774023 ) ) ( not ( = ?auto_774022 ?auto_774024 ) ) ( not ( = ?auto_774022 ?auto_774025 ) ) ( not ( = ?auto_774022 ?auto_774026 ) ) ( not ( = ?auto_774022 ?auto_774027 ) ) ( not ( = ?auto_774023 ?auto_774024 ) ) ( not ( = ?auto_774023 ?auto_774025 ) ) ( not ( = ?auto_774023 ?auto_774026 ) ) ( not ( = ?auto_774023 ?auto_774027 ) ) ( not ( = ?auto_774024 ?auto_774025 ) ) ( not ( = ?auto_774024 ?auto_774026 ) ) ( not ( = ?auto_774024 ?auto_774027 ) ) ( not ( = ?auto_774025 ?auto_774026 ) ) ( not ( = ?auto_774025 ?auto_774027 ) ) ( not ( = ?auto_774026 ?auto_774027 ) ) ( ON ?auto_774026 ?auto_774027 ) ( ON ?auto_774025 ?auto_774026 ) ( ON ?auto_774024 ?auto_774025 ) ( ON ?auto_774023 ?auto_774024 ) ( ON ?auto_774022 ?auto_774023 ) ( CLEAR ?auto_774020 ) ( ON ?auto_774021 ?auto_774022 ) ( CLEAR ?auto_774021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_774010 ?auto_774011 ?auto_774012 ?auto_774013 ?auto_774014 ?auto_774015 ?auto_774016 ?auto_774017 ?auto_774018 ?auto_774019 ?auto_774020 ?auto_774021 )
      ( MAKE-18PILE ?auto_774010 ?auto_774011 ?auto_774012 ?auto_774013 ?auto_774014 ?auto_774015 ?auto_774016 ?auto_774017 ?auto_774018 ?auto_774019 ?auto_774020 ?auto_774021 ?auto_774022 ?auto_774023 ?auto_774024 ?auto_774025 ?auto_774026 ?auto_774027 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774046 - BLOCK
      ?auto_774047 - BLOCK
      ?auto_774048 - BLOCK
      ?auto_774049 - BLOCK
      ?auto_774050 - BLOCK
      ?auto_774051 - BLOCK
      ?auto_774052 - BLOCK
      ?auto_774053 - BLOCK
      ?auto_774054 - BLOCK
      ?auto_774055 - BLOCK
      ?auto_774056 - BLOCK
      ?auto_774057 - BLOCK
      ?auto_774058 - BLOCK
      ?auto_774059 - BLOCK
      ?auto_774060 - BLOCK
      ?auto_774061 - BLOCK
      ?auto_774062 - BLOCK
      ?auto_774063 - BLOCK
    )
    :vars
    (
      ?auto_774064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774063 ?auto_774064 ) ( ON-TABLE ?auto_774046 ) ( ON ?auto_774047 ?auto_774046 ) ( ON ?auto_774048 ?auto_774047 ) ( ON ?auto_774049 ?auto_774048 ) ( ON ?auto_774050 ?auto_774049 ) ( ON ?auto_774051 ?auto_774050 ) ( ON ?auto_774052 ?auto_774051 ) ( ON ?auto_774053 ?auto_774052 ) ( ON ?auto_774054 ?auto_774053 ) ( ON ?auto_774055 ?auto_774054 ) ( not ( = ?auto_774046 ?auto_774047 ) ) ( not ( = ?auto_774046 ?auto_774048 ) ) ( not ( = ?auto_774046 ?auto_774049 ) ) ( not ( = ?auto_774046 ?auto_774050 ) ) ( not ( = ?auto_774046 ?auto_774051 ) ) ( not ( = ?auto_774046 ?auto_774052 ) ) ( not ( = ?auto_774046 ?auto_774053 ) ) ( not ( = ?auto_774046 ?auto_774054 ) ) ( not ( = ?auto_774046 ?auto_774055 ) ) ( not ( = ?auto_774046 ?auto_774056 ) ) ( not ( = ?auto_774046 ?auto_774057 ) ) ( not ( = ?auto_774046 ?auto_774058 ) ) ( not ( = ?auto_774046 ?auto_774059 ) ) ( not ( = ?auto_774046 ?auto_774060 ) ) ( not ( = ?auto_774046 ?auto_774061 ) ) ( not ( = ?auto_774046 ?auto_774062 ) ) ( not ( = ?auto_774046 ?auto_774063 ) ) ( not ( = ?auto_774046 ?auto_774064 ) ) ( not ( = ?auto_774047 ?auto_774048 ) ) ( not ( = ?auto_774047 ?auto_774049 ) ) ( not ( = ?auto_774047 ?auto_774050 ) ) ( not ( = ?auto_774047 ?auto_774051 ) ) ( not ( = ?auto_774047 ?auto_774052 ) ) ( not ( = ?auto_774047 ?auto_774053 ) ) ( not ( = ?auto_774047 ?auto_774054 ) ) ( not ( = ?auto_774047 ?auto_774055 ) ) ( not ( = ?auto_774047 ?auto_774056 ) ) ( not ( = ?auto_774047 ?auto_774057 ) ) ( not ( = ?auto_774047 ?auto_774058 ) ) ( not ( = ?auto_774047 ?auto_774059 ) ) ( not ( = ?auto_774047 ?auto_774060 ) ) ( not ( = ?auto_774047 ?auto_774061 ) ) ( not ( = ?auto_774047 ?auto_774062 ) ) ( not ( = ?auto_774047 ?auto_774063 ) ) ( not ( = ?auto_774047 ?auto_774064 ) ) ( not ( = ?auto_774048 ?auto_774049 ) ) ( not ( = ?auto_774048 ?auto_774050 ) ) ( not ( = ?auto_774048 ?auto_774051 ) ) ( not ( = ?auto_774048 ?auto_774052 ) ) ( not ( = ?auto_774048 ?auto_774053 ) ) ( not ( = ?auto_774048 ?auto_774054 ) ) ( not ( = ?auto_774048 ?auto_774055 ) ) ( not ( = ?auto_774048 ?auto_774056 ) ) ( not ( = ?auto_774048 ?auto_774057 ) ) ( not ( = ?auto_774048 ?auto_774058 ) ) ( not ( = ?auto_774048 ?auto_774059 ) ) ( not ( = ?auto_774048 ?auto_774060 ) ) ( not ( = ?auto_774048 ?auto_774061 ) ) ( not ( = ?auto_774048 ?auto_774062 ) ) ( not ( = ?auto_774048 ?auto_774063 ) ) ( not ( = ?auto_774048 ?auto_774064 ) ) ( not ( = ?auto_774049 ?auto_774050 ) ) ( not ( = ?auto_774049 ?auto_774051 ) ) ( not ( = ?auto_774049 ?auto_774052 ) ) ( not ( = ?auto_774049 ?auto_774053 ) ) ( not ( = ?auto_774049 ?auto_774054 ) ) ( not ( = ?auto_774049 ?auto_774055 ) ) ( not ( = ?auto_774049 ?auto_774056 ) ) ( not ( = ?auto_774049 ?auto_774057 ) ) ( not ( = ?auto_774049 ?auto_774058 ) ) ( not ( = ?auto_774049 ?auto_774059 ) ) ( not ( = ?auto_774049 ?auto_774060 ) ) ( not ( = ?auto_774049 ?auto_774061 ) ) ( not ( = ?auto_774049 ?auto_774062 ) ) ( not ( = ?auto_774049 ?auto_774063 ) ) ( not ( = ?auto_774049 ?auto_774064 ) ) ( not ( = ?auto_774050 ?auto_774051 ) ) ( not ( = ?auto_774050 ?auto_774052 ) ) ( not ( = ?auto_774050 ?auto_774053 ) ) ( not ( = ?auto_774050 ?auto_774054 ) ) ( not ( = ?auto_774050 ?auto_774055 ) ) ( not ( = ?auto_774050 ?auto_774056 ) ) ( not ( = ?auto_774050 ?auto_774057 ) ) ( not ( = ?auto_774050 ?auto_774058 ) ) ( not ( = ?auto_774050 ?auto_774059 ) ) ( not ( = ?auto_774050 ?auto_774060 ) ) ( not ( = ?auto_774050 ?auto_774061 ) ) ( not ( = ?auto_774050 ?auto_774062 ) ) ( not ( = ?auto_774050 ?auto_774063 ) ) ( not ( = ?auto_774050 ?auto_774064 ) ) ( not ( = ?auto_774051 ?auto_774052 ) ) ( not ( = ?auto_774051 ?auto_774053 ) ) ( not ( = ?auto_774051 ?auto_774054 ) ) ( not ( = ?auto_774051 ?auto_774055 ) ) ( not ( = ?auto_774051 ?auto_774056 ) ) ( not ( = ?auto_774051 ?auto_774057 ) ) ( not ( = ?auto_774051 ?auto_774058 ) ) ( not ( = ?auto_774051 ?auto_774059 ) ) ( not ( = ?auto_774051 ?auto_774060 ) ) ( not ( = ?auto_774051 ?auto_774061 ) ) ( not ( = ?auto_774051 ?auto_774062 ) ) ( not ( = ?auto_774051 ?auto_774063 ) ) ( not ( = ?auto_774051 ?auto_774064 ) ) ( not ( = ?auto_774052 ?auto_774053 ) ) ( not ( = ?auto_774052 ?auto_774054 ) ) ( not ( = ?auto_774052 ?auto_774055 ) ) ( not ( = ?auto_774052 ?auto_774056 ) ) ( not ( = ?auto_774052 ?auto_774057 ) ) ( not ( = ?auto_774052 ?auto_774058 ) ) ( not ( = ?auto_774052 ?auto_774059 ) ) ( not ( = ?auto_774052 ?auto_774060 ) ) ( not ( = ?auto_774052 ?auto_774061 ) ) ( not ( = ?auto_774052 ?auto_774062 ) ) ( not ( = ?auto_774052 ?auto_774063 ) ) ( not ( = ?auto_774052 ?auto_774064 ) ) ( not ( = ?auto_774053 ?auto_774054 ) ) ( not ( = ?auto_774053 ?auto_774055 ) ) ( not ( = ?auto_774053 ?auto_774056 ) ) ( not ( = ?auto_774053 ?auto_774057 ) ) ( not ( = ?auto_774053 ?auto_774058 ) ) ( not ( = ?auto_774053 ?auto_774059 ) ) ( not ( = ?auto_774053 ?auto_774060 ) ) ( not ( = ?auto_774053 ?auto_774061 ) ) ( not ( = ?auto_774053 ?auto_774062 ) ) ( not ( = ?auto_774053 ?auto_774063 ) ) ( not ( = ?auto_774053 ?auto_774064 ) ) ( not ( = ?auto_774054 ?auto_774055 ) ) ( not ( = ?auto_774054 ?auto_774056 ) ) ( not ( = ?auto_774054 ?auto_774057 ) ) ( not ( = ?auto_774054 ?auto_774058 ) ) ( not ( = ?auto_774054 ?auto_774059 ) ) ( not ( = ?auto_774054 ?auto_774060 ) ) ( not ( = ?auto_774054 ?auto_774061 ) ) ( not ( = ?auto_774054 ?auto_774062 ) ) ( not ( = ?auto_774054 ?auto_774063 ) ) ( not ( = ?auto_774054 ?auto_774064 ) ) ( not ( = ?auto_774055 ?auto_774056 ) ) ( not ( = ?auto_774055 ?auto_774057 ) ) ( not ( = ?auto_774055 ?auto_774058 ) ) ( not ( = ?auto_774055 ?auto_774059 ) ) ( not ( = ?auto_774055 ?auto_774060 ) ) ( not ( = ?auto_774055 ?auto_774061 ) ) ( not ( = ?auto_774055 ?auto_774062 ) ) ( not ( = ?auto_774055 ?auto_774063 ) ) ( not ( = ?auto_774055 ?auto_774064 ) ) ( not ( = ?auto_774056 ?auto_774057 ) ) ( not ( = ?auto_774056 ?auto_774058 ) ) ( not ( = ?auto_774056 ?auto_774059 ) ) ( not ( = ?auto_774056 ?auto_774060 ) ) ( not ( = ?auto_774056 ?auto_774061 ) ) ( not ( = ?auto_774056 ?auto_774062 ) ) ( not ( = ?auto_774056 ?auto_774063 ) ) ( not ( = ?auto_774056 ?auto_774064 ) ) ( not ( = ?auto_774057 ?auto_774058 ) ) ( not ( = ?auto_774057 ?auto_774059 ) ) ( not ( = ?auto_774057 ?auto_774060 ) ) ( not ( = ?auto_774057 ?auto_774061 ) ) ( not ( = ?auto_774057 ?auto_774062 ) ) ( not ( = ?auto_774057 ?auto_774063 ) ) ( not ( = ?auto_774057 ?auto_774064 ) ) ( not ( = ?auto_774058 ?auto_774059 ) ) ( not ( = ?auto_774058 ?auto_774060 ) ) ( not ( = ?auto_774058 ?auto_774061 ) ) ( not ( = ?auto_774058 ?auto_774062 ) ) ( not ( = ?auto_774058 ?auto_774063 ) ) ( not ( = ?auto_774058 ?auto_774064 ) ) ( not ( = ?auto_774059 ?auto_774060 ) ) ( not ( = ?auto_774059 ?auto_774061 ) ) ( not ( = ?auto_774059 ?auto_774062 ) ) ( not ( = ?auto_774059 ?auto_774063 ) ) ( not ( = ?auto_774059 ?auto_774064 ) ) ( not ( = ?auto_774060 ?auto_774061 ) ) ( not ( = ?auto_774060 ?auto_774062 ) ) ( not ( = ?auto_774060 ?auto_774063 ) ) ( not ( = ?auto_774060 ?auto_774064 ) ) ( not ( = ?auto_774061 ?auto_774062 ) ) ( not ( = ?auto_774061 ?auto_774063 ) ) ( not ( = ?auto_774061 ?auto_774064 ) ) ( not ( = ?auto_774062 ?auto_774063 ) ) ( not ( = ?auto_774062 ?auto_774064 ) ) ( not ( = ?auto_774063 ?auto_774064 ) ) ( ON ?auto_774062 ?auto_774063 ) ( ON ?auto_774061 ?auto_774062 ) ( ON ?auto_774060 ?auto_774061 ) ( ON ?auto_774059 ?auto_774060 ) ( ON ?auto_774058 ?auto_774059 ) ( ON ?auto_774057 ?auto_774058 ) ( CLEAR ?auto_774055 ) ( ON ?auto_774056 ?auto_774057 ) ( CLEAR ?auto_774056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_774046 ?auto_774047 ?auto_774048 ?auto_774049 ?auto_774050 ?auto_774051 ?auto_774052 ?auto_774053 ?auto_774054 ?auto_774055 ?auto_774056 )
      ( MAKE-18PILE ?auto_774046 ?auto_774047 ?auto_774048 ?auto_774049 ?auto_774050 ?auto_774051 ?auto_774052 ?auto_774053 ?auto_774054 ?auto_774055 ?auto_774056 ?auto_774057 ?auto_774058 ?auto_774059 ?auto_774060 ?auto_774061 ?auto_774062 ?auto_774063 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774083 - BLOCK
      ?auto_774084 - BLOCK
      ?auto_774085 - BLOCK
      ?auto_774086 - BLOCK
      ?auto_774087 - BLOCK
      ?auto_774088 - BLOCK
      ?auto_774089 - BLOCK
      ?auto_774090 - BLOCK
      ?auto_774091 - BLOCK
      ?auto_774092 - BLOCK
      ?auto_774093 - BLOCK
      ?auto_774094 - BLOCK
      ?auto_774095 - BLOCK
      ?auto_774096 - BLOCK
      ?auto_774097 - BLOCK
      ?auto_774098 - BLOCK
      ?auto_774099 - BLOCK
      ?auto_774100 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_774100 ) ( ON-TABLE ?auto_774083 ) ( ON ?auto_774084 ?auto_774083 ) ( ON ?auto_774085 ?auto_774084 ) ( ON ?auto_774086 ?auto_774085 ) ( ON ?auto_774087 ?auto_774086 ) ( ON ?auto_774088 ?auto_774087 ) ( ON ?auto_774089 ?auto_774088 ) ( ON ?auto_774090 ?auto_774089 ) ( ON ?auto_774091 ?auto_774090 ) ( ON ?auto_774092 ?auto_774091 ) ( not ( = ?auto_774083 ?auto_774084 ) ) ( not ( = ?auto_774083 ?auto_774085 ) ) ( not ( = ?auto_774083 ?auto_774086 ) ) ( not ( = ?auto_774083 ?auto_774087 ) ) ( not ( = ?auto_774083 ?auto_774088 ) ) ( not ( = ?auto_774083 ?auto_774089 ) ) ( not ( = ?auto_774083 ?auto_774090 ) ) ( not ( = ?auto_774083 ?auto_774091 ) ) ( not ( = ?auto_774083 ?auto_774092 ) ) ( not ( = ?auto_774083 ?auto_774093 ) ) ( not ( = ?auto_774083 ?auto_774094 ) ) ( not ( = ?auto_774083 ?auto_774095 ) ) ( not ( = ?auto_774083 ?auto_774096 ) ) ( not ( = ?auto_774083 ?auto_774097 ) ) ( not ( = ?auto_774083 ?auto_774098 ) ) ( not ( = ?auto_774083 ?auto_774099 ) ) ( not ( = ?auto_774083 ?auto_774100 ) ) ( not ( = ?auto_774084 ?auto_774085 ) ) ( not ( = ?auto_774084 ?auto_774086 ) ) ( not ( = ?auto_774084 ?auto_774087 ) ) ( not ( = ?auto_774084 ?auto_774088 ) ) ( not ( = ?auto_774084 ?auto_774089 ) ) ( not ( = ?auto_774084 ?auto_774090 ) ) ( not ( = ?auto_774084 ?auto_774091 ) ) ( not ( = ?auto_774084 ?auto_774092 ) ) ( not ( = ?auto_774084 ?auto_774093 ) ) ( not ( = ?auto_774084 ?auto_774094 ) ) ( not ( = ?auto_774084 ?auto_774095 ) ) ( not ( = ?auto_774084 ?auto_774096 ) ) ( not ( = ?auto_774084 ?auto_774097 ) ) ( not ( = ?auto_774084 ?auto_774098 ) ) ( not ( = ?auto_774084 ?auto_774099 ) ) ( not ( = ?auto_774084 ?auto_774100 ) ) ( not ( = ?auto_774085 ?auto_774086 ) ) ( not ( = ?auto_774085 ?auto_774087 ) ) ( not ( = ?auto_774085 ?auto_774088 ) ) ( not ( = ?auto_774085 ?auto_774089 ) ) ( not ( = ?auto_774085 ?auto_774090 ) ) ( not ( = ?auto_774085 ?auto_774091 ) ) ( not ( = ?auto_774085 ?auto_774092 ) ) ( not ( = ?auto_774085 ?auto_774093 ) ) ( not ( = ?auto_774085 ?auto_774094 ) ) ( not ( = ?auto_774085 ?auto_774095 ) ) ( not ( = ?auto_774085 ?auto_774096 ) ) ( not ( = ?auto_774085 ?auto_774097 ) ) ( not ( = ?auto_774085 ?auto_774098 ) ) ( not ( = ?auto_774085 ?auto_774099 ) ) ( not ( = ?auto_774085 ?auto_774100 ) ) ( not ( = ?auto_774086 ?auto_774087 ) ) ( not ( = ?auto_774086 ?auto_774088 ) ) ( not ( = ?auto_774086 ?auto_774089 ) ) ( not ( = ?auto_774086 ?auto_774090 ) ) ( not ( = ?auto_774086 ?auto_774091 ) ) ( not ( = ?auto_774086 ?auto_774092 ) ) ( not ( = ?auto_774086 ?auto_774093 ) ) ( not ( = ?auto_774086 ?auto_774094 ) ) ( not ( = ?auto_774086 ?auto_774095 ) ) ( not ( = ?auto_774086 ?auto_774096 ) ) ( not ( = ?auto_774086 ?auto_774097 ) ) ( not ( = ?auto_774086 ?auto_774098 ) ) ( not ( = ?auto_774086 ?auto_774099 ) ) ( not ( = ?auto_774086 ?auto_774100 ) ) ( not ( = ?auto_774087 ?auto_774088 ) ) ( not ( = ?auto_774087 ?auto_774089 ) ) ( not ( = ?auto_774087 ?auto_774090 ) ) ( not ( = ?auto_774087 ?auto_774091 ) ) ( not ( = ?auto_774087 ?auto_774092 ) ) ( not ( = ?auto_774087 ?auto_774093 ) ) ( not ( = ?auto_774087 ?auto_774094 ) ) ( not ( = ?auto_774087 ?auto_774095 ) ) ( not ( = ?auto_774087 ?auto_774096 ) ) ( not ( = ?auto_774087 ?auto_774097 ) ) ( not ( = ?auto_774087 ?auto_774098 ) ) ( not ( = ?auto_774087 ?auto_774099 ) ) ( not ( = ?auto_774087 ?auto_774100 ) ) ( not ( = ?auto_774088 ?auto_774089 ) ) ( not ( = ?auto_774088 ?auto_774090 ) ) ( not ( = ?auto_774088 ?auto_774091 ) ) ( not ( = ?auto_774088 ?auto_774092 ) ) ( not ( = ?auto_774088 ?auto_774093 ) ) ( not ( = ?auto_774088 ?auto_774094 ) ) ( not ( = ?auto_774088 ?auto_774095 ) ) ( not ( = ?auto_774088 ?auto_774096 ) ) ( not ( = ?auto_774088 ?auto_774097 ) ) ( not ( = ?auto_774088 ?auto_774098 ) ) ( not ( = ?auto_774088 ?auto_774099 ) ) ( not ( = ?auto_774088 ?auto_774100 ) ) ( not ( = ?auto_774089 ?auto_774090 ) ) ( not ( = ?auto_774089 ?auto_774091 ) ) ( not ( = ?auto_774089 ?auto_774092 ) ) ( not ( = ?auto_774089 ?auto_774093 ) ) ( not ( = ?auto_774089 ?auto_774094 ) ) ( not ( = ?auto_774089 ?auto_774095 ) ) ( not ( = ?auto_774089 ?auto_774096 ) ) ( not ( = ?auto_774089 ?auto_774097 ) ) ( not ( = ?auto_774089 ?auto_774098 ) ) ( not ( = ?auto_774089 ?auto_774099 ) ) ( not ( = ?auto_774089 ?auto_774100 ) ) ( not ( = ?auto_774090 ?auto_774091 ) ) ( not ( = ?auto_774090 ?auto_774092 ) ) ( not ( = ?auto_774090 ?auto_774093 ) ) ( not ( = ?auto_774090 ?auto_774094 ) ) ( not ( = ?auto_774090 ?auto_774095 ) ) ( not ( = ?auto_774090 ?auto_774096 ) ) ( not ( = ?auto_774090 ?auto_774097 ) ) ( not ( = ?auto_774090 ?auto_774098 ) ) ( not ( = ?auto_774090 ?auto_774099 ) ) ( not ( = ?auto_774090 ?auto_774100 ) ) ( not ( = ?auto_774091 ?auto_774092 ) ) ( not ( = ?auto_774091 ?auto_774093 ) ) ( not ( = ?auto_774091 ?auto_774094 ) ) ( not ( = ?auto_774091 ?auto_774095 ) ) ( not ( = ?auto_774091 ?auto_774096 ) ) ( not ( = ?auto_774091 ?auto_774097 ) ) ( not ( = ?auto_774091 ?auto_774098 ) ) ( not ( = ?auto_774091 ?auto_774099 ) ) ( not ( = ?auto_774091 ?auto_774100 ) ) ( not ( = ?auto_774092 ?auto_774093 ) ) ( not ( = ?auto_774092 ?auto_774094 ) ) ( not ( = ?auto_774092 ?auto_774095 ) ) ( not ( = ?auto_774092 ?auto_774096 ) ) ( not ( = ?auto_774092 ?auto_774097 ) ) ( not ( = ?auto_774092 ?auto_774098 ) ) ( not ( = ?auto_774092 ?auto_774099 ) ) ( not ( = ?auto_774092 ?auto_774100 ) ) ( not ( = ?auto_774093 ?auto_774094 ) ) ( not ( = ?auto_774093 ?auto_774095 ) ) ( not ( = ?auto_774093 ?auto_774096 ) ) ( not ( = ?auto_774093 ?auto_774097 ) ) ( not ( = ?auto_774093 ?auto_774098 ) ) ( not ( = ?auto_774093 ?auto_774099 ) ) ( not ( = ?auto_774093 ?auto_774100 ) ) ( not ( = ?auto_774094 ?auto_774095 ) ) ( not ( = ?auto_774094 ?auto_774096 ) ) ( not ( = ?auto_774094 ?auto_774097 ) ) ( not ( = ?auto_774094 ?auto_774098 ) ) ( not ( = ?auto_774094 ?auto_774099 ) ) ( not ( = ?auto_774094 ?auto_774100 ) ) ( not ( = ?auto_774095 ?auto_774096 ) ) ( not ( = ?auto_774095 ?auto_774097 ) ) ( not ( = ?auto_774095 ?auto_774098 ) ) ( not ( = ?auto_774095 ?auto_774099 ) ) ( not ( = ?auto_774095 ?auto_774100 ) ) ( not ( = ?auto_774096 ?auto_774097 ) ) ( not ( = ?auto_774096 ?auto_774098 ) ) ( not ( = ?auto_774096 ?auto_774099 ) ) ( not ( = ?auto_774096 ?auto_774100 ) ) ( not ( = ?auto_774097 ?auto_774098 ) ) ( not ( = ?auto_774097 ?auto_774099 ) ) ( not ( = ?auto_774097 ?auto_774100 ) ) ( not ( = ?auto_774098 ?auto_774099 ) ) ( not ( = ?auto_774098 ?auto_774100 ) ) ( not ( = ?auto_774099 ?auto_774100 ) ) ( ON ?auto_774099 ?auto_774100 ) ( ON ?auto_774098 ?auto_774099 ) ( ON ?auto_774097 ?auto_774098 ) ( ON ?auto_774096 ?auto_774097 ) ( ON ?auto_774095 ?auto_774096 ) ( ON ?auto_774094 ?auto_774095 ) ( CLEAR ?auto_774092 ) ( ON ?auto_774093 ?auto_774094 ) ( CLEAR ?auto_774093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_774083 ?auto_774084 ?auto_774085 ?auto_774086 ?auto_774087 ?auto_774088 ?auto_774089 ?auto_774090 ?auto_774091 ?auto_774092 ?auto_774093 )
      ( MAKE-18PILE ?auto_774083 ?auto_774084 ?auto_774085 ?auto_774086 ?auto_774087 ?auto_774088 ?auto_774089 ?auto_774090 ?auto_774091 ?auto_774092 ?auto_774093 ?auto_774094 ?auto_774095 ?auto_774096 ?auto_774097 ?auto_774098 ?auto_774099 ?auto_774100 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774119 - BLOCK
      ?auto_774120 - BLOCK
      ?auto_774121 - BLOCK
      ?auto_774122 - BLOCK
      ?auto_774123 - BLOCK
      ?auto_774124 - BLOCK
      ?auto_774125 - BLOCK
      ?auto_774126 - BLOCK
      ?auto_774127 - BLOCK
      ?auto_774128 - BLOCK
      ?auto_774129 - BLOCK
      ?auto_774130 - BLOCK
      ?auto_774131 - BLOCK
      ?auto_774132 - BLOCK
      ?auto_774133 - BLOCK
      ?auto_774134 - BLOCK
      ?auto_774135 - BLOCK
      ?auto_774136 - BLOCK
    )
    :vars
    (
      ?auto_774137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774136 ?auto_774137 ) ( ON-TABLE ?auto_774119 ) ( ON ?auto_774120 ?auto_774119 ) ( ON ?auto_774121 ?auto_774120 ) ( ON ?auto_774122 ?auto_774121 ) ( ON ?auto_774123 ?auto_774122 ) ( ON ?auto_774124 ?auto_774123 ) ( ON ?auto_774125 ?auto_774124 ) ( ON ?auto_774126 ?auto_774125 ) ( ON ?auto_774127 ?auto_774126 ) ( not ( = ?auto_774119 ?auto_774120 ) ) ( not ( = ?auto_774119 ?auto_774121 ) ) ( not ( = ?auto_774119 ?auto_774122 ) ) ( not ( = ?auto_774119 ?auto_774123 ) ) ( not ( = ?auto_774119 ?auto_774124 ) ) ( not ( = ?auto_774119 ?auto_774125 ) ) ( not ( = ?auto_774119 ?auto_774126 ) ) ( not ( = ?auto_774119 ?auto_774127 ) ) ( not ( = ?auto_774119 ?auto_774128 ) ) ( not ( = ?auto_774119 ?auto_774129 ) ) ( not ( = ?auto_774119 ?auto_774130 ) ) ( not ( = ?auto_774119 ?auto_774131 ) ) ( not ( = ?auto_774119 ?auto_774132 ) ) ( not ( = ?auto_774119 ?auto_774133 ) ) ( not ( = ?auto_774119 ?auto_774134 ) ) ( not ( = ?auto_774119 ?auto_774135 ) ) ( not ( = ?auto_774119 ?auto_774136 ) ) ( not ( = ?auto_774119 ?auto_774137 ) ) ( not ( = ?auto_774120 ?auto_774121 ) ) ( not ( = ?auto_774120 ?auto_774122 ) ) ( not ( = ?auto_774120 ?auto_774123 ) ) ( not ( = ?auto_774120 ?auto_774124 ) ) ( not ( = ?auto_774120 ?auto_774125 ) ) ( not ( = ?auto_774120 ?auto_774126 ) ) ( not ( = ?auto_774120 ?auto_774127 ) ) ( not ( = ?auto_774120 ?auto_774128 ) ) ( not ( = ?auto_774120 ?auto_774129 ) ) ( not ( = ?auto_774120 ?auto_774130 ) ) ( not ( = ?auto_774120 ?auto_774131 ) ) ( not ( = ?auto_774120 ?auto_774132 ) ) ( not ( = ?auto_774120 ?auto_774133 ) ) ( not ( = ?auto_774120 ?auto_774134 ) ) ( not ( = ?auto_774120 ?auto_774135 ) ) ( not ( = ?auto_774120 ?auto_774136 ) ) ( not ( = ?auto_774120 ?auto_774137 ) ) ( not ( = ?auto_774121 ?auto_774122 ) ) ( not ( = ?auto_774121 ?auto_774123 ) ) ( not ( = ?auto_774121 ?auto_774124 ) ) ( not ( = ?auto_774121 ?auto_774125 ) ) ( not ( = ?auto_774121 ?auto_774126 ) ) ( not ( = ?auto_774121 ?auto_774127 ) ) ( not ( = ?auto_774121 ?auto_774128 ) ) ( not ( = ?auto_774121 ?auto_774129 ) ) ( not ( = ?auto_774121 ?auto_774130 ) ) ( not ( = ?auto_774121 ?auto_774131 ) ) ( not ( = ?auto_774121 ?auto_774132 ) ) ( not ( = ?auto_774121 ?auto_774133 ) ) ( not ( = ?auto_774121 ?auto_774134 ) ) ( not ( = ?auto_774121 ?auto_774135 ) ) ( not ( = ?auto_774121 ?auto_774136 ) ) ( not ( = ?auto_774121 ?auto_774137 ) ) ( not ( = ?auto_774122 ?auto_774123 ) ) ( not ( = ?auto_774122 ?auto_774124 ) ) ( not ( = ?auto_774122 ?auto_774125 ) ) ( not ( = ?auto_774122 ?auto_774126 ) ) ( not ( = ?auto_774122 ?auto_774127 ) ) ( not ( = ?auto_774122 ?auto_774128 ) ) ( not ( = ?auto_774122 ?auto_774129 ) ) ( not ( = ?auto_774122 ?auto_774130 ) ) ( not ( = ?auto_774122 ?auto_774131 ) ) ( not ( = ?auto_774122 ?auto_774132 ) ) ( not ( = ?auto_774122 ?auto_774133 ) ) ( not ( = ?auto_774122 ?auto_774134 ) ) ( not ( = ?auto_774122 ?auto_774135 ) ) ( not ( = ?auto_774122 ?auto_774136 ) ) ( not ( = ?auto_774122 ?auto_774137 ) ) ( not ( = ?auto_774123 ?auto_774124 ) ) ( not ( = ?auto_774123 ?auto_774125 ) ) ( not ( = ?auto_774123 ?auto_774126 ) ) ( not ( = ?auto_774123 ?auto_774127 ) ) ( not ( = ?auto_774123 ?auto_774128 ) ) ( not ( = ?auto_774123 ?auto_774129 ) ) ( not ( = ?auto_774123 ?auto_774130 ) ) ( not ( = ?auto_774123 ?auto_774131 ) ) ( not ( = ?auto_774123 ?auto_774132 ) ) ( not ( = ?auto_774123 ?auto_774133 ) ) ( not ( = ?auto_774123 ?auto_774134 ) ) ( not ( = ?auto_774123 ?auto_774135 ) ) ( not ( = ?auto_774123 ?auto_774136 ) ) ( not ( = ?auto_774123 ?auto_774137 ) ) ( not ( = ?auto_774124 ?auto_774125 ) ) ( not ( = ?auto_774124 ?auto_774126 ) ) ( not ( = ?auto_774124 ?auto_774127 ) ) ( not ( = ?auto_774124 ?auto_774128 ) ) ( not ( = ?auto_774124 ?auto_774129 ) ) ( not ( = ?auto_774124 ?auto_774130 ) ) ( not ( = ?auto_774124 ?auto_774131 ) ) ( not ( = ?auto_774124 ?auto_774132 ) ) ( not ( = ?auto_774124 ?auto_774133 ) ) ( not ( = ?auto_774124 ?auto_774134 ) ) ( not ( = ?auto_774124 ?auto_774135 ) ) ( not ( = ?auto_774124 ?auto_774136 ) ) ( not ( = ?auto_774124 ?auto_774137 ) ) ( not ( = ?auto_774125 ?auto_774126 ) ) ( not ( = ?auto_774125 ?auto_774127 ) ) ( not ( = ?auto_774125 ?auto_774128 ) ) ( not ( = ?auto_774125 ?auto_774129 ) ) ( not ( = ?auto_774125 ?auto_774130 ) ) ( not ( = ?auto_774125 ?auto_774131 ) ) ( not ( = ?auto_774125 ?auto_774132 ) ) ( not ( = ?auto_774125 ?auto_774133 ) ) ( not ( = ?auto_774125 ?auto_774134 ) ) ( not ( = ?auto_774125 ?auto_774135 ) ) ( not ( = ?auto_774125 ?auto_774136 ) ) ( not ( = ?auto_774125 ?auto_774137 ) ) ( not ( = ?auto_774126 ?auto_774127 ) ) ( not ( = ?auto_774126 ?auto_774128 ) ) ( not ( = ?auto_774126 ?auto_774129 ) ) ( not ( = ?auto_774126 ?auto_774130 ) ) ( not ( = ?auto_774126 ?auto_774131 ) ) ( not ( = ?auto_774126 ?auto_774132 ) ) ( not ( = ?auto_774126 ?auto_774133 ) ) ( not ( = ?auto_774126 ?auto_774134 ) ) ( not ( = ?auto_774126 ?auto_774135 ) ) ( not ( = ?auto_774126 ?auto_774136 ) ) ( not ( = ?auto_774126 ?auto_774137 ) ) ( not ( = ?auto_774127 ?auto_774128 ) ) ( not ( = ?auto_774127 ?auto_774129 ) ) ( not ( = ?auto_774127 ?auto_774130 ) ) ( not ( = ?auto_774127 ?auto_774131 ) ) ( not ( = ?auto_774127 ?auto_774132 ) ) ( not ( = ?auto_774127 ?auto_774133 ) ) ( not ( = ?auto_774127 ?auto_774134 ) ) ( not ( = ?auto_774127 ?auto_774135 ) ) ( not ( = ?auto_774127 ?auto_774136 ) ) ( not ( = ?auto_774127 ?auto_774137 ) ) ( not ( = ?auto_774128 ?auto_774129 ) ) ( not ( = ?auto_774128 ?auto_774130 ) ) ( not ( = ?auto_774128 ?auto_774131 ) ) ( not ( = ?auto_774128 ?auto_774132 ) ) ( not ( = ?auto_774128 ?auto_774133 ) ) ( not ( = ?auto_774128 ?auto_774134 ) ) ( not ( = ?auto_774128 ?auto_774135 ) ) ( not ( = ?auto_774128 ?auto_774136 ) ) ( not ( = ?auto_774128 ?auto_774137 ) ) ( not ( = ?auto_774129 ?auto_774130 ) ) ( not ( = ?auto_774129 ?auto_774131 ) ) ( not ( = ?auto_774129 ?auto_774132 ) ) ( not ( = ?auto_774129 ?auto_774133 ) ) ( not ( = ?auto_774129 ?auto_774134 ) ) ( not ( = ?auto_774129 ?auto_774135 ) ) ( not ( = ?auto_774129 ?auto_774136 ) ) ( not ( = ?auto_774129 ?auto_774137 ) ) ( not ( = ?auto_774130 ?auto_774131 ) ) ( not ( = ?auto_774130 ?auto_774132 ) ) ( not ( = ?auto_774130 ?auto_774133 ) ) ( not ( = ?auto_774130 ?auto_774134 ) ) ( not ( = ?auto_774130 ?auto_774135 ) ) ( not ( = ?auto_774130 ?auto_774136 ) ) ( not ( = ?auto_774130 ?auto_774137 ) ) ( not ( = ?auto_774131 ?auto_774132 ) ) ( not ( = ?auto_774131 ?auto_774133 ) ) ( not ( = ?auto_774131 ?auto_774134 ) ) ( not ( = ?auto_774131 ?auto_774135 ) ) ( not ( = ?auto_774131 ?auto_774136 ) ) ( not ( = ?auto_774131 ?auto_774137 ) ) ( not ( = ?auto_774132 ?auto_774133 ) ) ( not ( = ?auto_774132 ?auto_774134 ) ) ( not ( = ?auto_774132 ?auto_774135 ) ) ( not ( = ?auto_774132 ?auto_774136 ) ) ( not ( = ?auto_774132 ?auto_774137 ) ) ( not ( = ?auto_774133 ?auto_774134 ) ) ( not ( = ?auto_774133 ?auto_774135 ) ) ( not ( = ?auto_774133 ?auto_774136 ) ) ( not ( = ?auto_774133 ?auto_774137 ) ) ( not ( = ?auto_774134 ?auto_774135 ) ) ( not ( = ?auto_774134 ?auto_774136 ) ) ( not ( = ?auto_774134 ?auto_774137 ) ) ( not ( = ?auto_774135 ?auto_774136 ) ) ( not ( = ?auto_774135 ?auto_774137 ) ) ( not ( = ?auto_774136 ?auto_774137 ) ) ( ON ?auto_774135 ?auto_774136 ) ( ON ?auto_774134 ?auto_774135 ) ( ON ?auto_774133 ?auto_774134 ) ( ON ?auto_774132 ?auto_774133 ) ( ON ?auto_774131 ?auto_774132 ) ( ON ?auto_774130 ?auto_774131 ) ( ON ?auto_774129 ?auto_774130 ) ( CLEAR ?auto_774127 ) ( ON ?auto_774128 ?auto_774129 ) ( CLEAR ?auto_774128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_774119 ?auto_774120 ?auto_774121 ?auto_774122 ?auto_774123 ?auto_774124 ?auto_774125 ?auto_774126 ?auto_774127 ?auto_774128 )
      ( MAKE-18PILE ?auto_774119 ?auto_774120 ?auto_774121 ?auto_774122 ?auto_774123 ?auto_774124 ?auto_774125 ?auto_774126 ?auto_774127 ?auto_774128 ?auto_774129 ?auto_774130 ?auto_774131 ?auto_774132 ?auto_774133 ?auto_774134 ?auto_774135 ?auto_774136 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774156 - BLOCK
      ?auto_774157 - BLOCK
      ?auto_774158 - BLOCK
      ?auto_774159 - BLOCK
      ?auto_774160 - BLOCK
      ?auto_774161 - BLOCK
      ?auto_774162 - BLOCK
      ?auto_774163 - BLOCK
      ?auto_774164 - BLOCK
      ?auto_774165 - BLOCK
      ?auto_774166 - BLOCK
      ?auto_774167 - BLOCK
      ?auto_774168 - BLOCK
      ?auto_774169 - BLOCK
      ?auto_774170 - BLOCK
      ?auto_774171 - BLOCK
      ?auto_774172 - BLOCK
      ?auto_774173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_774173 ) ( ON-TABLE ?auto_774156 ) ( ON ?auto_774157 ?auto_774156 ) ( ON ?auto_774158 ?auto_774157 ) ( ON ?auto_774159 ?auto_774158 ) ( ON ?auto_774160 ?auto_774159 ) ( ON ?auto_774161 ?auto_774160 ) ( ON ?auto_774162 ?auto_774161 ) ( ON ?auto_774163 ?auto_774162 ) ( ON ?auto_774164 ?auto_774163 ) ( not ( = ?auto_774156 ?auto_774157 ) ) ( not ( = ?auto_774156 ?auto_774158 ) ) ( not ( = ?auto_774156 ?auto_774159 ) ) ( not ( = ?auto_774156 ?auto_774160 ) ) ( not ( = ?auto_774156 ?auto_774161 ) ) ( not ( = ?auto_774156 ?auto_774162 ) ) ( not ( = ?auto_774156 ?auto_774163 ) ) ( not ( = ?auto_774156 ?auto_774164 ) ) ( not ( = ?auto_774156 ?auto_774165 ) ) ( not ( = ?auto_774156 ?auto_774166 ) ) ( not ( = ?auto_774156 ?auto_774167 ) ) ( not ( = ?auto_774156 ?auto_774168 ) ) ( not ( = ?auto_774156 ?auto_774169 ) ) ( not ( = ?auto_774156 ?auto_774170 ) ) ( not ( = ?auto_774156 ?auto_774171 ) ) ( not ( = ?auto_774156 ?auto_774172 ) ) ( not ( = ?auto_774156 ?auto_774173 ) ) ( not ( = ?auto_774157 ?auto_774158 ) ) ( not ( = ?auto_774157 ?auto_774159 ) ) ( not ( = ?auto_774157 ?auto_774160 ) ) ( not ( = ?auto_774157 ?auto_774161 ) ) ( not ( = ?auto_774157 ?auto_774162 ) ) ( not ( = ?auto_774157 ?auto_774163 ) ) ( not ( = ?auto_774157 ?auto_774164 ) ) ( not ( = ?auto_774157 ?auto_774165 ) ) ( not ( = ?auto_774157 ?auto_774166 ) ) ( not ( = ?auto_774157 ?auto_774167 ) ) ( not ( = ?auto_774157 ?auto_774168 ) ) ( not ( = ?auto_774157 ?auto_774169 ) ) ( not ( = ?auto_774157 ?auto_774170 ) ) ( not ( = ?auto_774157 ?auto_774171 ) ) ( not ( = ?auto_774157 ?auto_774172 ) ) ( not ( = ?auto_774157 ?auto_774173 ) ) ( not ( = ?auto_774158 ?auto_774159 ) ) ( not ( = ?auto_774158 ?auto_774160 ) ) ( not ( = ?auto_774158 ?auto_774161 ) ) ( not ( = ?auto_774158 ?auto_774162 ) ) ( not ( = ?auto_774158 ?auto_774163 ) ) ( not ( = ?auto_774158 ?auto_774164 ) ) ( not ( = ?auto_774158 ?auto_774165 ) ) ( not ( = ?auto_774158 ?auto_774166 ) ) ( not ( = ?auto_774158 ?auto_774167 ) ) ( not ( = ?auto_774158 ?auto_774168 ) ) ( not ( = ?auto_774158 ?auto_774169 ) ) ( not ( = ?auto_774158 ?auto_774170 ) ) ( not ( = ?auto_774158 ?auto_774171 ) ) ( not ( = ?auto_774158 ?auto_774172 ) ) ( not ( = ?auto_774158 ?auto_774173 ) ) ( not ( = ?auto_774159 ?auto_774160 ) ) ( not ( = ?auto_774159 ?auto_774161 ) ) ( not ( = ?auto_774159 ?auto_774162 ) ) ( not ( = ?auto_774159 ?auto_774163 ) ) ( not ( = ?auto_774159 ?auto_774164 ) ) ( not ( = ?auto_774159 ?auto_774165 ) ) ( not ( = ?auto_774159 ?auto_774166 ) ) ( not ( = ?auto_774159 ?auto_774167 ) ) ( not ( = ?auto_774159 ?auto_774168 ) ) ( not ( = ?auto_774159 ?auto_774169 ) ) ( not ( = ?auto_774159 ?auto_774170 ) ) ( not ( = ?auto_774159 ?auto_774171 ) ) ( not ( = ?auto_774159 ?auto_774172 ) ) ( not ( = ?auto_774159 ?auto_774173 ) ) ( not ( = ?auto_774160 ?auto_774161 ) ) ( not ( = ?auto_774160 ?auto_774162 ) ) ( not ( = ?auto_774160 ?auto_774163 ) ) ( not ( = ?auto_774160 ?auto_774164 ) ) ( not ( = ?auto_774160 ?auto_774165 ) ) ( not ( = ?auto_774160 ?auto_774166 ) ) ( not ( = ?auto_774160 ?auto_774167 ) ) ( not ( = ?auto_774160 ?auto_774168 ) ) ( not ( = ?auto_774160 ?auto_774169 ) ) ( not ( = ?auto_774160 ?auto_774170 ) ) ( not ( = ?auto_774160 ?auto_774171 ) ) ( not ( = ?auto_774160 ?auto_774172 ) ) ( not ( = ?auto_774160 ?auto_774173 ) ) ( not ( = ?auto_774161 ?auto_774162 ) ) ( not ( = ?auto_774161 ?auto_774163 ) ) ( not ( = ?auto_774161 ?auto_774164 ) ) ( not ( = ?auto_774161 ?auto_774165 ) ) ( not ( = ?auto_774161 ?auto_774166 ) ) ( not ( = ?auto_774161 ?auto_774167 ) ) ( not ( = ?auto_774161 ?auto_774168 ) ) ( not ( = ?auto_774161 ?auto_774169 ) ) ( not ( = ?auto_774161 ?auto_774170 ) ) ( not ( = ?auto_774161 ?auto_774171 ) ) ( not ( = ?auto_774161 ?auto_774172 ) ) ( not ( = ?auto_774161 ?auto_774173 ) ) ( not ( = ?auto_774162 ?auto_774163 ) ) ( not ( = ?auto_774162 ?auto_774164 ) ) ( not ( = ?auto_774162 ?auto_774165 ) ) ( not ( = ?auto_774162 ?auto_774166 ) ) ( not ( = ?auto_774162 ?auto_774167 ) ) ( not ( = ?auto_774162 ?auto_774168 ) ) ( not ( = ?auto_774162 ?auto_774169 ) ) ( not ( = ?auto_774162 ?auto_774170 ) ) ( not ( = ?auto_774162 ?auto_774171 ) ) ( not ( = ?auto_774162 ?auto_774172 ) ) ( not ( = ?auto_774162 ?auto_774173 ) ) ( not ( = ?auto_774163 ?auto_774164 ) ) ( not ( = ?auto_774163 ?auto_774165 ) ) ( not ( = ?auto_774163 ?auto_774166 ) ) ( not ( = ?auto_774163 ?auto_774167 ) ) ( not ( = ?auto_774163 ?auto_774168 ) ) ( not ( = ?auto_774163 ?auto_774169 ) ) ( not ( = ?auto_774163 ?auto_774170 ) ) ( not ( = ?auto_774163 ?auto_774171 ) ) ( not ( = ?auto_774163 ?auto_774172 ) ) ( not ( = ?auto_774163 ?auto_774173 ) ) ( not ( = ?auto_774164 ?auto_774165 ) ) ( not ( = ?auto_774164 ?auto_774166 ) ) ( not ( = ?auto_774164 ?auto_774167 ) ) ( not ( = ?auto_774164 ?auto_774168 ) ) ( not ( = ?auto_774164 ?auto_774169 ) ) ( not ( = ?auto_774164 ?auto_774170 ) ) ( not ( = ?auto_774164 ?auto_774171 ) ) ( not ( = ?auto_774164 ?auto_774172 ) ) ( not ( = ?auto_774164 ?auto_774173 ) ) ( not ( = ?auto_774165 ?auto_774166 ) ) ( not ( = ?auto_774165 ?auto_774167 ) ) ( not ( = ?auto_774165 ?auto_774168 ) ) ( not ( = ?auto_774165 ?auto_774169 ) ) ( not ( = ?auto_774165 ?auto_774170 ) ) ( not ( = ?auto_774165 ?auto_774171 ) ) ( not ( = ?auto_774165 ?auto_774172 ) ) ( not ( = ?auto_774165 ?auto_774173 ) ) ( not ( = ?auto_774166 ?auto_774167 ) ) ( not ( = ?auto_774166 ?auto_774168 ) ) ( not ( = ?auto_774166 ?auto_774169 ) ) ( not ( = ?auto_774166 ?auto_774170 ) ) ( not ( = ?auto_774166 ?auto_774171 ) ) ( not ( = ?auto_774166 ?auto_774172 ) ) ( not ( = ?auto_774166 ?auto_774173 ) ) ( not ( = ?auto_774167 ?auto_774168 ) ) ( not ( = ?auto_774167 ?auto_774169 ) ) ( not ( = ?auto_774167 ?auto_774170 ) ) ( not ( = ?auto_774167 ?auto_774171 ) ) ( not ( = ?auto_774167 ?auto_774172 ) ) ( not ( = ?auto_774167 ?auto_774173 ) ) ( not ( = ?auto_774168 ?auto_774169 ) ) ( not ( = ?auto_774168 ?auto_774170 ) ) ( not ( = ?auto_774168 ?auto_774171 ) ) ( not ( = ?auto_774168 ?auto_774172 ) ) ( not ( = ?auto_774168 ?auto_774173 ) ) ( not ( = ?auto_774169 ?auto_774170 ) ) ( not ( = ?auto_774169 ?auto_774171 ) ) ( not ( = ?auto_774169 ?auto_774172 ) ) ( not ( = ?auto_774169 ?auto_774173 ) ) ( not ( = ?auto_774170 ?auto_774171 ) ) ( not ( = ?auto_774170 ?auto_774172 ) ) ( not ( = ?auto_774170 ?auto_774173 ) ) ( not ( = ?auto_774171 ?auto_774172 ) ) ( not ( = ?auto_774171 ?auto_774173 ) ) ( not ( = ?auto_774172 ?auto_774173 ) ) ( ON ?auto_774172 ?auto_774173 ) ( ON ?auto_774171 ?auto_774172 ) ( ON ?auto_774170 ?auto_774171 ) ( ON ?auto_774169 ?auto_774170 ) ( ON ?auto_774168 ?auto_774169 ) ( ON ?auto_774167 ?auto_774168 ) ( ON ?auto_774166 ?auto_774167 ) ( CLEAR ?auto_774164 ) ( ON ?auto_774165 ?auto_774166 ) ( CLEAR ?auto_774165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_774156 ?auto_774157 ?auto_774158 ?auto_774159 ?auto_774160 ?auto_774161 ?auto_774162 ?auto_774163 ?auto_774164 ?auto_774165 )
      ( MAKE-18PILE ?auto_774156 ?auto_774157 ?auto_774158 ?auto_774159 ?auto_774160 ?auto_774161 ?auto_774162 ?auto_774163 ?auto_774164 ?auto_774165 ?auto_774166 ?auto_774167 ?auto_774168 ?auto_774169 ?auto_774170 ?auto_774171 ?auto_774172 ?auto_774173 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774192 - BLOCK
      ?auto_774193 - BLOCK
      ?auto_774194 - BLOCK
      ?auto_774195 - BLOCK
      ?auto_774196 - BLOCK
      ?auto_774197 - BLOCK
      ?auto_774198 - BLOCK
      ?auto_774199 - BLOCK
      ?auto_774200 - BLOCK
      ?auto_774201 - BLOCK
      ?auto_774202 - BLOCK
      ?auto_774203 - BLOCK
      ?auto_774204 - BLOCK
      ?auto_774205 - BLOCK
      ?auto_774206 - BLOCK
      ?auto_774207 - BLOCK
      ?auto_774208 - BLOCK
      ?auto_774209 - BLOCK
    )
    :vars
    (
      ?auto_774210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774209 ?auto_774210 ) ( ON-TABLE ?auto_774192 ) ( ON ?auto_774193 ?auto_774192 ) ( ON ?auto_774194 ?auto_774193 ) ( ON ?auto_774195 ?auto_774194 ) ( ON ?auto_774196 ?auto_774195 ) ( ON ?auto_774197 ?auto_774196 ) ( ON ?auto_774198 ?auto_774197 ) ( ON ?auto_774199 ?auto_774198 ) ( not ( = ?auto_774192 ?auto_774193 ) ) ( not ( = ?auto_774192 ?auto_774194 ) ) ( not ( = ?auto_774192 ?auto_774195 ) ) ( not ( = ?auto_774192 ?auto_774196 ) ) ( not ( = ?auto_774192 ?auto_774197 ) ) ( not ( = ?auto_774192 ?auto_774198 ) ) ( not ( = ?auto_774192 ?auto_774199 ) ) ( not ( = ?auto_774192 ?auto_774200 ) ) ( not ( = ?auto_774192 ?auto_774201 ) ) ( not ( = ?auto_774192 ?auto_774202 ) ) ( not ( = ?auto_774192 ?auto_774203 ) ) ( not ( = ?auto_774192 ?auto_774204 ) ) ( not ( = ?auto_774192 ?auto_774205 ) ) ( not ( = ?auto_774192 ?auto_774206 ) ) ( not ( = ?auto_774192 ?auto_774207 ) ) ( not ( = ?auto_774192 ?auto_774208 ) ) ( not ( = ?auto_774192 ?auto_774209 ) ) ( not ( = ?auto_774192 ?auto_774210 ) ) ( not ( = ?auto_774193 ?auto_774194 ) ) ( not ( = ?auto_774193 ?auto_774195 ) ) ( not ( = ?auto_774193 ?auto_774196 ) ) ( not ( = ?auto_774193 ?auto_774197 ) ) ( not ( = ?auto_774193 ?auto_774198 ) ) ( not ( = ?auto_774193 ?auto_774199 ) ) ( not ( = ?auto_774193 ?auto_774200 ) ) ( not ( = ?auto_774193 ?auto_774201 ) ) ( not ( = ?auto_774193 ?auto_774202 ) ) ( not ( = ?auto_774193 ?auto_774203 ) ) ( not ( = ?auto_774193 ?auto_774204 ) ) ( not ( = ?auto_774193 ?auto_774205 ) ) ( not ( = ?auto_774193 ?auto_774206 ) ) ( not ( = ?auto_774193 ?auto_774207 ) ) ( not ( = ?auto_774193 ?auto_774208 ) ) ( not ( = ?auto_774193 ?auto_774209 ) ) ( not ( = ?auto_774193 ?auto_774210 ) ) ( not ( = ?auto_774194 ?auto_774195 ) ) ( not ( = ?auto_774194 ?auto_774196 ) ) ( not ( = ?auto_774194 ?auto_774197 ) ) ( not ( = ?auto_774194 ?auto_774198 ) ) ( not ( = ?auto_774194 ?auto_774199 ) ) ( not ( = ?auto_774194 ?auto_774200 ) ) ( not ( = ?auto_774194 ?auto_774201 ) ) ( not ( = ?auto_774194 ?auto_774202 ) ) ( not ( = ?auto_774194 ?auto_774203 ) ) ( not ( = ?auto_774194 ?auto_774204 ) ) ( not ( = ?auto_774194 ?auto_774205 ) ) ( not ( = ?auto_774194 ?auto_774206 ) ) ( not ( = ?auto_774194 ?auto_774207 ) ) ( not ( = ?auto_774194 ?auto_774208 ) ) ( not ( = ?auto_774194 ?auto_774209 ) ) ( not ( = ?auto_774194 ?auto_774210 ) ) ( not ( = ?auto_774195 ?auto_774196 ) ) ( not ( = ?auto_774195 ?auto_774197 ) ) ( not ( = ?auto_774195 ?auto_774198 ) ) ( not ( = ?auto_774195 ?auto_774199 ) ) ( not ( = ?auto_774195 ?auto_774200 ) ) ( not ( = ?auto_774195 ?auto_774201 ) ) ( not ( = ?auto_774195 ?auto_774202 ) ) ( not ( = ?auto_774195 ?auto_774203 ) ) ( not ( = ?auto_774195 ?auto_774204 ) ) ( not ( = ?auto_774195 ?auto_774205 ) ) ( not ( = ?auto_774195 ?auto_774206 ) ) ( not ( = ?auto_774195 ?auto_774207 ) ) ( not ( = ?auto_774195 ?auto_774208 ) ) ( not ( = ?auto_774195 ?auto_774209 ) ) ( not ( = ?auto_774195 ?auto_774210 ) ) ( not ( = ?auto_774196 ?auto_774197 ) ) ( not ( = ?auto_774196 ?auto_774198 ) ) ( not ( = ?auto_774196 ?auto_774199 ) ) ( not ( = ?auto_774196 ?auto_774200 ) ) ( not ( = ?auto_774196 ?auto_774201 ) ) ( not ( = ?auto_774196 ?auto_774202 ) ) ( not ( = ?auto_774196 ?auto_774203 ) ) ( not ( = ?auto_774196 ?auto_774204 ) ) ( not ( = ?auto_774196 ?auto_774205 ) ) ( not ( = ?auto_774196 ?auto_774206 ) ) ( not ( = ?auto_774196 ?auto_774207 ) ) ( not ( = ?auto_774196 ?auto_774208 ) ) ( not ( = ?auto_774196 ?auto_774209 ) ) ( not ( = ?auto_774196 ?auto_774210 ) ) ( not ( = ?auto_774197 ?auto_774198 ) ) ( not ( = ?auto_774197 ?auto_774199 ) ) ( not ( = ?auto_774197 ?auto_774200 ) ) ( not ( = ?auto_774197 ?auto_774201 ) ) ( not ( = ?auto_774197 ?auto_774202 ) ) ( not ( = ?auto_774197 ?auto_774203 ) ) ( not ( = ?auto_774197 ?auto_774204 ) ) ( not ( = ?auto_774197 ?auto_774205 ) ) ( not ( = ?auto_774197 ?auto_774206 ) ) ( not ( = ?auto_774197 ?auto_774207 ) ) ( not ( = ?auto_774197 ?auto_774208 ) ) ( not ( = ?auto_774197 ?auto_774209 ) ) ( not ( = ?auto_774197 ?auto_774210 ) ) ( not ( = ?auto_774198 ?auto_774199 ) ) ( not ( = ?auto_774198 ?auto_774200 ) ) ( not ( = ?auto_774198 ?auto_774201 ) ) ( not ( = ?auto_774198 ?auto_774202 ) ) ( not ( = ?auto_774198 ?auto_774203 ) ) ( not ( = ?auto_774198 ?auto_774204 ) ) ( not ( = ?auto_774198 ?auto_774205 ) ) ( not ( = ?auto_774198 ?auto_774206 ) ) ( not ( = ?auto_774198 ?auto_774207 ) ) ( not ( = ?auto_774198 ?auto_774208 ) ) ( not ( = ?auto_774198 ?auto_774209 ) ) ( not ( = ?auto_774198 ?auto_774210 ) ) ( not ( = ?auto_774199 ?auto_774200 ) ) ( not ( = ?auto_774199 ?auto_774201 ) ) ( not ( = ?auto_774199 ?auto_774202 ) ) ( not ( = ?auto_774199 ?auto_774203 ) ) ( not ( = ?auto_774199 ?auto_774204 ) ) ( not ( = ?auto_774199 ?auto_774205 ) ) ( not ( = ?auto_774199 ?auto_774206 ) ) ( not ( = ?auto_774199 ?auto_774207 ) ) ( not ( = ?auto_774199 ?auto_774208 ) ) ( not ( = ?auto_774199 ?auto_774209 ) ) ( not ( = ?auto_774199 ?auto_774210 ) ) ( not ( = ?auto_774200 ?auto_774201 ) ) ( not ( = ?auto_774200 ?auto_774202 ) ) ( not ( = ?auto_774200 ?auto_774203 ) ) ( not ( = ?auto_774200 ?auto_774204 ) ) ( not ( = ?auto_774200 ?auto_774205 ) ) ( not ( = ?auto_774200 ?auto_774206 ) ) ( not ( = ?auto_774200 ?auto_774207 ) ) ( not ( = ?auto_774200 ?auto_774208 ) ) ( not ( = ?auto_774200 ?auto_774209 ) ) ( not ( = ?auto_774200 ?auto_774210 ) ) ( not ( = ?auto_774201 ?auto_774202 ) ) ( not ( = ?auto_774201 ?auto_774203 ) ) ( not ( = ?auto_774201 ?auto_774204 ) ) ( not ( = ?auto_774201 ?auto_774205 ) ) ( not ( = ?auto_774201 ?auto_774206 ) ) ( not ( = ?auto_774201 ?auto_774207 ) ) ( not ( = ?auto_774201 ?auto_774208 ) ) ( not ( = ?auto_774201 ?auto_774209 ) ) ( not ( = ?auto_774201 ?auto_774210 ) ) ( not ( = ?auto_774202 ?auto_774203 ) ) ( not ( = ?auto_774202 ?auto_774204 ) ) ( not ( = ?auto_774202 ?auto_774205 ) ) ( not ( = ?auto_774202 ?auto_774206 ) ) ( not ( = ?auto_774202 ?auto_774207 ) ) ( not ( = ?auto_774202 ?auto_774208 ) ) ( not ( = ?auto_774202 ?auto_774209 ) ) ( not ( = ?auto_774202 ?auto_774210 ) ) ( not ( = ?auto_774203 ?auto_774204 ) ) ( not ( = ?auto_774203 ?auto_774205 ) ) ( not ( = ?auto_774203 ?auto_774206 ) ) ( not ( = ?auto_774203 ?auto_774207 ) ) ( not ( = ?auto_774203 ?auto_774208 ) ) ( not ( = ?auto_774203 ?auto_774209 ) ) ( not ( = ?auto_774203 ?auto_774210 ) ) ( not ( = ?auto_774204 ?auto_774205 ) ) ( not ( = ?auto_774204 ?auto_774206 ) ) ( not ( = ?auto_774204 ?auto_774207 ) ) ( not ( = ?auto_774204 ?auto_774208 ) ) ( not ( = ?auto_774204 ?auto_774209 ) ) ( not ( = ?auto_774204 ?auto_774210 ) ) ( not ( = ?auto_774205 ?auto_774206 ) ) ( not ( = ?auto_774205 ?auto_774207 ) ) ( not ( = ?auto_774205 ?auto_774208 ) ) ( not ( = ?auto_774205 ?auto_774209 ) ) ( not ( = ?auto_774205 ?auto_774210 ) ) ( not ( = ?auto_774206 ?auto_774207 ) ) ( not ( = ?auto_774206 ?auto_774208 ) ) ( not ( = ?auto_774206 ?auto_774209 ) ) ( not ( = ?auto_774206 ?auto_774210 ) ) ( not ( = ?auto_774207 ?auto_774208 ) ) ( not ( = ?auto_774207 ?auto_774209 ) ) ( not ( = ?auto_774207 ?auto_774210 ) ) ( not ( = ?auto_774208 ?auto_774209 ) ) ( not ( = ?auto_774208 ?auto_774210 ) ) ( not ( = ?auto_774209 ?auto_774210 ) ) ( ON ?auto_774208 ?auto_774209 ) ( ON ?auto_774207 ?auto_774208 ) ( ON ?auto_774206 ?auto_774207 ) ( ON ?auto_774205 ?auto_774206 ) ( ON ?auto_774204 ?auto_774205 ) ( ON ?auto_774203 ?auto_774204 ) ( ON ?auto_774202 ?auto_774203 ) ( ON ?auto_774201 ?auto_774202 ) ( CLEAR ?auto_774199 ) ( ON ?auto_774200 ?auto_774201 ) ( CLEAR ?auto_774200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_774192 ?auto_774193 ?auto_774194 ?auto_774195 ?auto_774196 ?auto_774197 ?auto_774198 ?auto_774199 ?auto_774200 )
      ( MAKE-18PILE ?auto_774192 ?auto_774193 ?auto_774194 ?auto_774195 ?auto_774196 ?auto_774197 ?auto_774198 ?auto_774199 ?auto_774200 ?auto_774201 ?auto_774202 ?auto_774203 ?auto_774204 ?auto_774205 ?auto_774206 ?auto_774207 ?auto_774208 ?auto_774209 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774229 - BLOCK
      ?auto_774230 - BLOCK
      ?auto_774231 - BLOCK
      ?auto_774232 - BLOCK
      ?auto_774233 - BLOCK
      ?auto_774234 - BLOCK
      ?auto_774235 - BLOCK
      ?auto_774236 - BLOCK
      ?auto_774237 - BLOCK
      ?auto_774238 - BLOCK
      ?auto_774239 - BLOCK
      ?auto_774240 - BLOCK
      ?auto_774241 - BLOCK
      ?auto_774242 - BLOCK
      ?auto_774243 - BLOCK
      ?auto_774244 - BLOCK
      ?auto_774245 - BLOCK
      ?auto_774246 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_774246 ) ( ON-TABLE ?auto_774229 ) ( ON ?auto_774230 ?auto_774229 ) ( ON ?auto_774231 ?auto_774230 ) ( ON ?auto_774232 ?auto_774231 ) ( ON ?auto_774233 ?auto_774232 ) ( ON ?auto_774234 ?auto_774233 ) ( ON ?auto_774235 ?auto_774234 ) ( ON ?auto_774236 ?auto_774235 ) ( not ( = ?auto_774229 ?auto_774230 ) ) ( not ( = ?auto_774229 ?auto_774231 ) ) ( not ( = ?auto_774229 ?auto_774232 ) ) ( not ( = ?auto_774229 ?auto_774233 ) ) ( not ( = ?auto_774229 ?auto_774234 ) ) ( not ( = ?auto_774229 ?auto_774235 ) ) ( not ( = ?auto_774229 ?auto_774236 ) ) ( not ( = ?auto_774229 ?auto_774237 ) ) ( not ( = ?auto_774229 ?auto_774238 ) ) ( not ( = ?auto_774229 ?auto_774239 ) ) ( not ( = ?auto_774229 ?auto_774240 ) ) ( not ( = ?auto_774229 ?auto_774241 ) ) ( not ( = ?auto_774229 ?auto_774242 ) ) ( not ( = ?auto_774229 ?auto_774243 ) ) ( not ( = ?auto_774229 ?auto_774244 ) ) ( not ( = ?auto_774229 ?auto_774245 ) ) ( not ( = ?auto_774229 ?auto_774246 ) ) ( not ( = ?auto_774230 ?auto_774231 ) ) ( not ( = ?auto_774230 ?auto_774232 ) ) ( not ( = ?auto_774230 ?auto_774233 ) ) ( not ( = ?auto_774230 ?auto_774234 ) ) ( not ( = ?auto_774230 ?auto_774235 ) ) ( not ( = ?auto_774230 ?auto_774236 ) ) ( not ( = ?auto_774230 ?auto_774237 ) ) ( not ( = ?auto_774230 ?auto_774238 ) ) ( not ( = ?auto_774230 ?auto_774239 ) ) ( not ( = ?auto_774230 ?auto_774240 ) ) ( not ( = ?auto_774230 ?auto_774241 ) ) ( not ( = ?auto_774230 ?auto_774242 ) ) ( not ( = ?auto_774230 ?auto_774243 ) ) ( not ( = ?auto_774230 ?auto_774244 ) ) ( not ( = ?auto_774230 ?auto_774245 ) ) ( not ( = ?auto_774230 ?auto_774246 ) ) ( not ( = ?auto_774231 ?auto_774232 ) ) ( not ( = ?auto_774231 ?auto_774233 ) ) ( not ( = ?auto_774231 ?auto_774234 ) ) ( not ( = ?auto_774231 ?auto_774235 ) ) ( not ( = ?auto_774231 ?auto_774236 ) ) ( not ( = ?auto_774231 ?auto_774237 ) ) ( not ( = ?auto_774231 ?auto_774238 ) ) ( not ( = ?auto_774231 ?auto_774239 ) ) ( not ( = ?auto_774231 ?auto_774240 ) ) ( not ( = ?auto_774231 ?auto_774241 ) ) ( not ( = ?auto_774231 ?auto_774242 ) ) ( not ( = ?auto_774231 ?auto_774243 ) ) ( not ( = ?auto_774231 ?auto_774244 ) ) ( not ( = ?auto_774231 ?auto_774245 ) ) ( not ( = ?auto_774231 ?auto_774246 ) ) ( not ( = ?auto_774232 ?auto_774233 ) ) ( not ( = ?auto_774232 ?auto_774234 ) ) ( not ( = ?auto_774232 ?auto_774235 ) ) ( not ( = ?auto_774232 ?auto_774236 ) ) ( not ( = ?auto_774232 ?auto_774237 ) ) ( not ( = ?auto_774232 ?auto_774238 ) ) ( not ( = ?auto_774232 ?auto_774239 ) ) ( not ( = ?auto_774232 ?auto_774240 ) ) ( not ( = ?auto_774232 ?auto_774241 ) ) ( not ( = ?auto_774232 ?auto_774242 ) ) ( not ( = ?auto_774232 ?auto_774243 ) ) ( not ( = ?auto_774232 ?auto_774244 ) ) ( not ( = ?auto_774232 ?auto_774245 ) ) ( not ( = ?auto_774232 ?auto_774246 ) ) ( not ( = ?auto_774233 ?auto_774234 ) ) ( not ( = ?auto_774233 ?auto_774235 ) ) ( not ( = ?auto_774233 ?auto_774236 ) ) ( not ( = ?auto_774233 ?auto_774237 ) ) ( not ( = ?auto_774233 ?auto_774238 ) ) ( not ( = ?auto_774233 ?auto_774239 ) ) ( not ( = ?auto_774233 ?auto_774240 ) ) ( not ( = ?auto_774233 ?auto_774241 ) ) ( not ( = ?auto_774233 ?auto_774242 ) ) ( not ( = ?auto_774233 ?auto_774243 ) ) ( not ( = ?auto_774233 ?auto_774244 ) ) ( not ( = ?auto_774233 ?auto_774245 ) ) ( not ( = ?auto_774233 ?auto_774246 ) ) ( not ( = ?auto_774234 ?auto_774235 ) ) ( not ( = ?auto_774234 ?auto_774236 ) ) ( not ( = ?auto_774234 ?auto_774237 ) ) ( not ( = ?auto_774234 ?auto_774238 ) ) ( not ( = ?auto_774234 ?auto_774239 ) ) ( not ( = ?auto_774234 ?auto_774240 ) ) ( not ( = ?auto_774234 ?auto_774241 ) ) ( not ( = ?auto_774234 ?auto_774242 ) ) ( not ( = ?auto_774234 ?auto_774243 ) ) ( not ( = ?auto_774234 ?auto_774244 ) ) ( not ( = ?auto_774234 ?auto_774245 ) ) ( not ( = ?auto_774234 ?auto_774246 ) ) ( not ( = ?auto_774235 ?auto_774236 ) ) ( not ( = ?auto_774235 ?auto_774237 ) ) ( not ( = ?auto_774235 ?auto_774238 ) ) ( not ( = ?auto_774235 ?auto_774239 ) ) ( not ( = ?auto_774235 ?auto_774240 ) ) ( not ( = ?auto_774235 ?auto_774241 ) ) ( not ( = ?auto_774235 ?auto_774242 ) ) ( not ( = ?auto_774235 ?auto_774243 ) ) ( not ( = ?auto_774235 ?auto_774244 ) ) ( not ( = ?auto_774235 ?auto_774245 ) ) ( not ( = ?auto_774235 ?auto_774246 ) ) ( not ( = ?auto_774236 ?auto_774237 ) ) ( not ( = ?auto_774236 ?auto_774238 ) ) ( not ( = ?auto_774236 ?auto_774239 ) ) ( not ( = ?auto_774236 ?auto_774240 ) ) ( not ( = ?auto_774236 ?auto_774241 ) ) ( not ( = ?auto_774236 ?auto_774242 ) ) ( not ( = ?auto_774236 ?auto_774243 ) ) ( not ( = ?auto_774236 ?auto_774244 ) ) ( not ( = ?auto_774236 ?auto_774245 ) ) ( not ( = ?auto_774236 ?auto_774246 ) ) ( not ( = ?auto_774237 ?auto_774238 ) ) ( not ( = ?auto_774237 ?auto_774239 ) ) ( not ( = ?auto_774237 ?auto_774240 ) ) ( not ( = ?auto_774237 ?auto_774241 ) ) ( not ( = ?auto_774237 ?auto_774242 ) ) ( not ( = ?auto_774237 ?auto_774243 ) ) ( not ( = ?auto_774237 ?auto_774244 ) ) ( not ( = ?auto_774237 ?auto_774245 ) ) ( not ( = ?auto_774237 ?auto_774246 ) ) ( not ( = ?auto_774238 ?auto_774239 ) ) ( not ( = ?auto_774238 ?auto_774240 ) ) ( not ( = ?auto_774238 ?auto_774241 ) ) ( not ( = ?auto_774238 ?auto_774242 ) ) ( not ( = ?auto_774238 ?auto_774243 ) ) ( not ( = ?auto_774238 ?auto_774244 ) ) ( not ( = ?auto_774238 ?auto_774245 ) ) ( not ( = ?auto_774238 ?auto_774246 ) ) ( not ( = ?auto_774239 ?auto_774240 ) ) ( not ( = ?auto_774239 ?auto_774241 ) ) ( not ( = ?auto_774239 ?auto_774242 ) ) ( not ( = ?auto_774239 ?auto_774243 ) ) ( not ( = ?auto_774239 ?auto_774244 ) ) ( not ( = ?auto_774239 ?auto_774245 ) ) ( not ( = ?auto_774239 ?auto_774246 ) ) ( not ( = ?auto_774240 ?auto_774241 ) ) ( not ( = ?auto_774240 ?auto_774242 ) ) ( not ( = ?auto_774240 ?auto_774243 ) ) ( not ( = ?auto_774240 ?auto_774244 ) ) ( not ( = ?auto_774240 ?auto_774245 ) ) ( not ( = ?auto_774240 ?auto_774246 ) ) ( not ( = ?auto_774241 ?auto_774242 ) ) ( not ( = ?auto_774241 ?auto_774243 ) ) ( not ( = ?auto_774241 ?auto_774244 ) ) ( not ( = ?auto_774241 ?auto_774245 ) ) ( not ( = ?auto_774241 ?auto_774246 ) ) ( not ( = ?auto_774242 ?auto_774243 ) ) ( not ( = ?auto_774242 ?auto_774244 ) ) ( not ( = ?auto_774242 ?auto_774245 ) ) ( not ( = ?auto_774242 ?auto_774246 ) ) ( not ( = ?auto_774243 ?auto_774244 ) ) ( not ( = ?auto_774243 ?auto_774245 ) ) ( not ( = ?auto_774243 ?auto_774246 ) ) ( not ( = ?auto_774244 ?auto_774245 ) ) ( not ( = ?auto_774244 ?auto_774246 ) ) ( not ( = ?auto_774245 ?auto_774246 ) ) ( ON ?auto_774245 ?auto_774246 ) ( ON ?auto_774244 ?auto_774245 ) ( ON ?auto_774243 ?auto_774244 ) ( ON ?auto_774242 ?auto_774243 ) ( ON ?auto_774241 ?auto_774242 ) ( ON ?auto_774240 ?auto_774241 ) ( ON ?auto_774239 ?auto_774240 ) ( ON ?auto_774238 ?auto_774239 ) ( CLEAR ?auto_774236 ) ( ON ?auto_774237 ?auto_774238 ) ( CLEAR ?auto_774237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_774229 ?auto_774230 ?auto_774231 ?auto_774232 ?auto_774233 ?auto_774234 ?auto_774235 ?auto_774236 ?auto_774237 )
      ( MAKE-18PILE ?auto_774229 ?auto_774230 ?auto_774231 ?auto_774232 ?auto_774233 ?auto_774234 ?auto_774235 ?auto_774236 ?auto_774237 ?auto_774238 ?auto_774239 ?auto_774240 ?auto_774241 ?auto_774242 ?auto_774243 ?auto_774244 ?auto_774245 ?auto_774246 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774265 - BLOCK
      ?auto_774266 - BLOCK
      ?auto_774267 - BLOCK
      ?auto_774268 - BLOCK
      ?auto_774269 - BLOCK
      ?auto_774270 - BLOCK
      ?auto_774271 - BLOCK
      ?auto_774272 - BLOCK
      ?auto_774273 - BLOCK
      ?auto_774274 - BLOCK
      ?auto_774275 - BLOCK
      ?auto_774276 - BLOCK
      ?auto_774277 - BLOCK
      ?auto_774278 - BLOCK
      ?auto_774279 - BLOCK
      ?auto_774280 - BLOCK
      ?auto_774281 - BLOCK
      ?auto_774282 - BLOCK
    )
    :vars
    (
      ?auto_774283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774282 ?auto_774283 ) ( ON-TABLE ?auto_774265 ) ( ON ?auto_774266 ?auto_774265 ) ( ON ?auto_774267 ?auto_774266 ) ( ON ?auto_774268 ?auto_774267 ) ( ON ?auto_774269 ?auto_774268 ) ( ON ?auto_774270 ?auto_774269 ) ( ON ?auto_774271 ?auto_774270 ) ( not ( = ?auto_774265 ?auto_774266 ) ) ( not ( = ?auto_774265 ?auto_774267 ) ) ( not ( = ?auto_774265 ?auto_774268 ) ) ( not ( = ?auto_774265 ?auto_774269 ) ) ( not ( = ?auto_774265 ?auto_774270 ) ) ( not ( = ?auto_774265 ?auto_774271 ) ) ( not ( = ?auto_774265 ?auto_774272 ) ) ( not ( = ?auto_774265 ?auto_774273 ) ) ( not ( = ?auto_774265 ?auto_774274 ) ) ( not ( = ?auto_774265 ?auto_774275 ) ) ( not ( = ?auto_774265 ?auto_774276 ) ) ( not ( = ?auto_774265 ?auto_774277 ) ) ( not ( = ?auto_774265 ?auto_774278 ) ) ( not ( = ?auto_774265 ?auto_774279 ) ) ( not ( = ?auto_774265 ?auto_774280 ) ) ( not ( = ?auto_774265 ?auto_774281 ) ) ( not ( = ?auto_774265 ?auto_774282 ) ) ( not ( = ?auto_774265 ?auto_774283 ) ) ( not ( = ?auto_774266 ?auto_774267 ) ) ( not ( = ?auto_774266 ?auto_774268 ) ) ( not ( = ?auto_774266 ?auto_774269 ) ) ( not ( = ?auto_774266 ?auto_774270 ) ) ( not ( = ?auto_774266 ?auto_774271 ) ) ( not ( = ?auto_774266 ?auto_774272 ) ) ( not ( = ?auto_774266 ?auto_774273 ) ) ( not ( = ?auto_774266 ?auto_774274 ) ) ( not ( = ?auto_774266 ?auto_774275 ) ) ( not ( = ?auto_774266 ?auto_774276 ) ) ( not ( = ?auto_774266 ?auto_774277 ) ) ( not ( = ?auto_774266 ?auto_774278 ) ) ( not ( = ?auto_774266 ?auto_774279 ) ) ( not ( = ?auto_774266 ?auto_774280 ) ) ( not ( = ?auto_774266 ?auto_774281 ) ) ( not ( = ?auto_774266 ?auto_774282 ) ) ( not ( = ?auto_774266 ?auto_774283 ) ) ( not ( = ?auto_774267 ?auto_774268 ) ) ( not ( = ?auto_774267 ?auto_774269 ) ) ( not ( = ?auto_774267 ?auto_774270 ) ) ( not ( = ?auto_774267 ?auto_774271 ) ) ( not ( = ?auto_774267 ?auto_774272 ) ) ( not ( = ?auto_774267 ?auto_774273 ) ) ( not ( = ?auto_774267 ?auto_774274 ) ) ( not ( = ?auto_774267 ?auto_774275 ) ) ( not ( = ?auto_774267 ?auto_774276 ) ) ( not ( = ?auto_774267 ?auto_774277 ) ) ( not ( = ?auto_774267 ?auto_774278 ) ) ( not ( = ?auto_774267 ?auto_774279 ) ) ( not ( = ?auto_774267 ?auto_774280 ) ) ( not ( = ?auto_774267 ?auto_774281 ) ) ( not ( = ?auto_774267 ?auto_774282 ) ) ( not ( = ?auto_774267 ?auto_774283 ) ) ( not ( = ?auto_774268 ?auto_774269 ) ) ( not ( = ?auto_774268 ?auto_774270 ) ) ( not ( = ?auto_774268 ?auto_774271 ) ) ( not ( = ?auto_774268 ?auto_774272 ) ) ( not ( = ?auto_774268 ?auto_774273 ) ) ( not ( = ?auto_774268 ?auto_774274 ) ) ( not ( = ?auto_774268 ?auto_774275 ) ) ( not ( = ?auto_774268 ?auto_774276 ) ) ( not ( = ?auto_774268 ?auto_774277 ) ) ( not ( = ?auto_774268 ?auto_774278 ) ) ( not ( = ?auto_774268 ?auto_774279 ) ) ( not ( = ?auto_774268 ?auto_774280 ) ) ( not ( = ?auto_774268 ?auto_774281 ) ) ( not ( = ?auto_774268 ?auto_774282 ) ) ( not ( = ?auto_774268 ?auto_774283 ) ) ( not ( = ?auto_774269 ?auto_774270 ) ) ( not ( = ?auto_774269 ?auto_774271 ) ) ( not ( = ?auto_774269 ?auto_774272 ) ) ( not ( = ?auto_774269 ?auto_774273 ) ) ( not ( = ?auto_774269 ?auto_774274 ) ) ( not ( = ?auto_774269 ?auto_774275 ) ) ( not ( = ?auto_774269 ?auto_774276 ) ) ( not ( = ?auto_774269 ?auto_774277 ) ) ( not ( = ?auto_774269 ?auto_774278 ) ) ( not ( = ?auto_774269 ?auto_774279 ) ) ( not ( = ?auto_774269 ?auto_774280 ) ) ( not ( = ?auto_774269 ?auto_774281 ) ) ( not ( = ?auto_774269 ?auto_774282 ) ) ( not ( = ?auto_774269 ?auto_774283 ) ) ( not ( = ?auto_774270 ?auto_774271 ) ) ( not ( = ?auto_774270 ?auto_774272 ) ) ( not ( = ?auto_774270 ?auto_774273 ) ) ( not ( = ?auto_774270 ?auto_774274 ) ) ( not ( = ?auto_774270 ?auto_774275 ) ) ( not ( = ?auto_774270 ?auto_774276 ) ) ( not ( = ?auto_774270 ?auto_774277 ) ) ( not ( = ?auto_774270 ?auto_774278 ) ) ( not ( = ?auto_774270 ?auto_774279 ) ) ( not ( = ?auto_774270 ?auto_774280 ) ) ( not ( = ?auto_774270 ?auto_774281 ) ) ( not ( = ?auto_774270 ?auto_774282 ) ) ( not ( = ?auto_774270 ?auto_774283 ) ) ( not ( = ?auto_774271 ?auto_774272 ) ) ( not ( = ?auto_774271 ?auto_774273 ) ) ( not ( = ?auto_774271 ?auto_774274 ) ) ( not ( = ?auto_774271 ?auto_774275 ) ) ( not ( = ?auto_774271 ?auto_774276 ) ) ( not ( = ?auto_774271 ?auto_774277 ) ) ( not ( = ?auto_774271 ?auto_774278 ) ) ( not ( = ?auto_774271 ?auto_774279 ) ) ( not ( = ?auto_774271 ?auto_774280 ) ) ( not ( = ?auto_774271 ?auto_774281 ) ) ( not ( = ?auto_774271 ?auto_774282 ) ) ( not ( = ?auto_774271 ?auto_774283 ) ) ( not ( = ?auto_774272 ?auto_774273 ) ) ( not ( = ?auto_774272 ?auto_774274 ) ) ( not ( = ?auto_774272 ?auto_774275 ) ) ( not ( = ?auto_774272 ?auto_774276 ) ) ( not ( = ?auto_774272 ?auto_774277 ) ) ( not ( = ?auto_774272 ?auto_774278 ) ) ( not ( = ?auto_774272 ?auto_774279 ) ) ( not ( = ?auto_774272 ?auto_774280 ) ) ( not ( = ?auto_774272 ?auto_774281 ) ) ( not ( = ?auto_774272 ?auto_774282 ) ) ( not ( = ?auto_774272 ?auto_774283 ) ) ( not ( = ?auto_774273 ?auto_774274 ) ) ( not ( = ?auto_774273 ?auto_774275 ) ) ( not ( = ?auto_774273 ?auto_774276 ) ) ( not ( = ?auto_774273 ?auto_774277 ) ) ( not ( = ?auto_774273 ?auto_774278 ) ) ( not ( = ?auto_774273 ?auto_774279 ) ) ( not ( = ?auto_774273 ?auto_774280 ) ) ( not ( = ?auto_774273 ?auto_774281 ) ) ( not ( = ?auto_774273 ?auto_774282 ) ) ( not ( = ?auto_774273 ?auto_774283 ) ) ( not ( = ?auto_774274 ?auto_774275 ) ) ( not ( = ?auto_774274 ?auto_774276 ) ) ( not ( = ?auto_774274 ?auto_774277 ) ) ( not ( = ?auto_774274 ?auto_774278 ) ) ( not ( = ?auto_774274 ?auto_774279 ) ) ( not ( = ?auto_774274 ?auto_774280 ) ) ( not ( = ?auto_774274 ?auto_774281 ) ) ( not ( = ?auto_774274 ?auto_774282 ) ) ( not ( = ?auto_774274 ?auto_774283 ) ) ( not ( = ?auto_774275 ?auto_774276 ) ) ( not ( = ?auto_774275 ?auto_774277 ) ) ( not ( = ?auto_774275 ?auto_774278 ) ) ( not ( = ?auto_774275 ?auto_774279 ) ) ( not ( = ?auto_774275 ?auto_774280 ) ) ( not ( = ?auto_774275 ?auto_774281 ) ) ( not ( = ?auto_774275 ?auto_774282 ) ) ( not ( = ?auto_774275 ?auto_774283 ) ) ( not ( = ?auto_774276 ?auto_774277 ) ) ( not ( = ?auto_774276 ?auto_774278 ) ) ( not ( = ?auto_774276 ?auto_774279 ) ) ( not ( = ?auto_774276 ?auto_774280 ) ) ( not ( = ?auto_774276 ?auto_774281 ) ) ( not ( = ?auto_774276 ?auto_774282 ) ) ( not ( = ?auto_774276 ?auto_774283 ) ) ( not ( = ?auto_774277 ?auto_774278 ) ) ( not ( = ?auto_774277 ?auto_774279 ) ) ( not ( = ?auto_774277 ?auto_774280 ) ) ( not ( = ?auto_774277 ?auto_774281 ) ) ( not ( = ?auto_774277 ?auto_774282 ) ) ( not ( = ?auto_774277 ?auto_774283 ) ) ( not ( = ?auto_774278 ?auto_774279 ) ) ( not ( = ?auto_774278 ?auto_774280 ) ) ( not ( = ?auto_774278 ?auto_774281 ) ) ( not ( = ?auto_774278 ?auto_774282 ) ) ( not ( = ?auto_774278 ?auto_774283 ) ) ( not ( = ?auto_774279 ?auto_774280 ) ) ( not ( = ?auto_774279 ?auto_774281 ) ) ( not ( = ?auto_774279 ?auto_774282 ) ) ( not ( = ?auto_774279 ?auto_774283 ) ) ( not ( = ?auto_774280 ?auto_774281 ) ) ( not ( = ?auto_774280 ?auto_774282 ) ) ( not ( = ?auto_774280 ?auto_774283 ) ) ( not ( = ?auto_774281 ?auto_774282 ) ) ( not ( = ?auto_774281 ?auto_774283 ) ) ( not ( = ?auto_774282 ?auto_774283 ) ) ( ON ?auto_774281 ?auto_774282 ) ( ON ?auto_774280 ?auto_774281 ) ( ON ?auto_774279 ?auto_774280 ) ( ON ?auto_774278 ?auto_774279 ) ( ON ?auto_774277 ?auto_774278 ) ( ON ?auto_774276 ?auto_774277 ) ( ON ?auto_774275 ?auto_774276 ) ( ON ?auto_774274 ?auto_774275 ) ( ON ?auto_774273 ?auto_774274 ) ( CLEAR ?auto_774271 ) ( ON ?auto_774272 ?auto_774273 ) ( CLEAR ?auto_774272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_774265 ?auto_774266 ?auto_774267 ?auto_774268 ?auto_774269 ?auto_774270 ?auto_774271 ?auto_774272 )
      ( MAKE-18PILE ?auto_774265 ?auto_774266 ?auto_774267 ?auto_774268 ?auto_774269 ?auto_774270 ?auto_774271 ?auto_774272 ?auto_774273 ?auto_774274 ?auto_774275 ?auto_774276 ?auto_774277 ?auto_774278 ?auto_774279 ?auto_774280 ?auto_774281 ?auto_774282 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774302 - BLOCK
      ?auto_774303 - BLOCK
      ?auto_774304 - BLOCK
      ?auto_774305 - BLOCK
      ?auto_774306 - BLOCK
      ?auto_774307 - BLOCK
      ?auto_774308 - BLOCK
      ?auto_774309 - BLOCK
      ?auto_774310 - BLOCK
      ?auto_774311 - BLOCK
      ?auto_774312 - BLOCK
      ?auto_774313 - BLOCK
      ?auto_774314 - BLOCK
      ?auto_774315 - BLOCK
      ?auto_774316 - BLOCK
      ?auto_774317 - BLOCK
      ?auto_774318 - BLOCK
      ?auto_774319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_774319 ) ( ON-TABLE ?auto_774302 ) ( ON ?auto_774303 ?auto_774302 ) ( ON ?auto_774304 ?auto_774303 ) ( ON ?auto_774305 ?auto_774304 ) ( ON ?auto_774306 ?auto_774305 ) ( ON ?auto_774307 ?auto_774306 ) ( ON ?auto_774308 ?auto_774307 ) ( not ( = ?auto_774302 ?auto_774303 ) ) ( not ( = ?auto_774302 ?auto_774304 ) ) ( not ( = ?auto_774302 ?auto_774305 ) ) ( not ( = ?auto_774302 ?auto_774306 ) ) ( not ( = ?auto_774302 ?auto_774307 ) ) ( not ( = ?auto_774302 ?auto_774308 ) ) ( not ( = ?auto_774302 ?auto_774309 ) ) ( not ( = ?auto_774302 ?auto_774310 ) ) ( not ( = ?auto_774302 ?auto_774311 ) ) ( not ( = ?auto_774302 ?auto_774312 ) ) ( not ( = ?auto_774302 ?auto_774313 ) ) ( not ( = ?auto_774302 ?auto_774314 ) ) ( not ( = ?auto_774302 ?auto_774315 ) ) ( not ( = ?auto_774302 ?auto_774316 ) ) ( not ( = ?auto_774302 ?auto_774317 ) ) ( not ( = ?auto_774302 ?auto_774318 ) ) ( not ( = ?auto_774302 ?auto_774319 ) ) ( not ( = ?auto_774303 ?auto_774304 ) ) ( not ( = ?auto_774303 ?auto_774305 ) ) ( not ( = ?auto_774303 ?auto_774306 ) ) ( not ( = ?auto_774303 ?auto_774307 ) ) ( not ( = ?auto_774303 ?auto_774308 ) ) ( not ( = ?auto_774303 ?auto_774309 ) ) ( not ( = ?auto_774303 ?auto_774310 ) ) ( not ( = ?auto_774303 ?auto_774311 ) ) ( not ( = ?auto_774303 ?auto_774312 ) ) ( not ( = ?auto_774303 ?auto_774313 ) ) ( not ( = ?auto_774303 ?auto_774314 ) ) ( not ( = ?auto_774303 ?auto_774315 ) ) ( not ( = ?auto_774303 ?auto_774316 ) ) ( not ( = ?auto_774303 ?auto_774317 ) ) ( not ( = ?auto_774303 ?auto_774318 ) ) ( not ( = ?auto_774303 ?auto_774319 ) ) ( not ( = ?auto_774304 ?auto_774305 ) ) ( not ( = ?auto_774304 ?auto_774306 ) ) ( not ( = ?auto_774304 ?auto_774307 ) ) ( not ( = ?auto_774304 ?auto_774308 ) ) ( not ( = ?auto_774304 ?auto_774309 ) ) ( not ( = ?auto_774304 ?auto_774310 ) ) ( not ( = ?auto_774304 ?auto_774311 ) ) ( not ( = ?auto_774304 ?auto_774312 ) ) ( not ( = ?auto_774304 ?auto_774313 ) ) ( not ( = ?auto_774304 ?auto_774314 ) ) ( not ( = ?auto_774304 ?auto_774315 ) ) ( not ( = ?auto_774304 ?auto_774316 ) ) ( not ( = ?auto_774304 ?auto_774317 ) ) ( not ( = ?auto_774304 ?auto_774318 ) ) ( not ( = ?auto_774304 ?auto_774319 ) ) ( not ( = ?auto_774305 ?auto_774306 ) ) ( not ( = ?auto_774305 ?auto_774307 ) ) ( not ( = ?auto_774305 ?auto_774308 ) ) ( not ( = ?auto_774305 ?auto_774309 ) ) ( not ( = ?auto_774305 ?auto_774310 ) ) ( not ( = ?auto_774305 ?auto_774311 ) ) ( not ( = ?auto_774305 ?auto_774312 ) ) ( not ( = ?auto_774305 ?auto_774313 ) ) ( not ( = ?auto_774305 ?auto_774314 ) ) ( not ( = ?auto_774305 ?auto_774315 ) ) ( not ( = ?auto_774305 ?auto_774316 ) ) ( not ( = ?auto_774305 ?auto_774317 ) ) ( not ( = ?auto_774305 ?auto_774318 ) ) ( not ( = ?auto_774305 ?auto_774319 ) ) ( not ( = ?auto_774306 ?auto_774307 ) ) ( not ( = ?auto_774306 ?auto_774308 ) ) ( not ( = ?auto_774306 ?auto_774309 ) ) ( not ( = ?auto_774306 ?auto_774310 ) ) ( not ( = ?auto_774306 ?auto_774311 ) ) ( not ( = ?auto_774306 ?auto_774312 ) ) ( not ( = ?auto_774306 ?auto_774313 ) ) ( not ( = ?auto_774306 ?auto_774314 ) ) ( not ( = ?auto_774306 ?auto_774315 ) ) ( not ( = ?auto_774306 ?auto_774316 ) ) ( not ( = ?auto_774306 ?auto_774317 ) ) ( not ( = ?auto_774306 ?auto_774318 ) ) ( not ( = ?auto_774306 ?auto_774319 ) ) ( not ( = ?auto_774307 ?auto_774308 ) ) ( not ( = ?auto_774307 ?auto_774309 ) ) ( not ( = ?auto_774307 ?auto_774310 ) ) ( not ( = ?auto_774307 ?auto_774311 ) ) ( not ( = ?auto_774307 ?auto_774312 ) ) ( not ( = ?auto_774307 ?auto_774313 ) ) ( not ( = ?auto_774307 ?auto_774314 ) ) ( not ( = ?auto_774307 ?auto_774315 ) ) ( not ( = ?auto_774307 ?auto_774316 ) ) ( not ( = ?auto_774307 ?auto_774317 ) ) ( not ( = ?auto_774307 ?auto_774318 ) ) ( not ( = ?auto_774307 ?auto_774319 ) ) ( not ( = ?auto_774308 ?auto_774309 ) ) ( not ( = ?auto_774308 ?auto_774310 ) ) ( not ( = ?auto_774308 ?auto_774311 ) ) ( not ( = ?auto_774308 ?auto_774312 ) ) ( not ( = ?auto_774308 ?auto_774313 ) ) ( not ( = ?auto_774308 ?auto_774314 ) ) ( not ( = ?auto_774308 ?auto_774315 ) ) ( not ( = ?auto_774308 ?auto_774316 ) ) ( not ( = ?auto_774308 ?auto_774317 ) ) ( not ( = ?auto_774308 ?auto_774318 ) ) ( not ( = ?auto_774308 ?auto_774319 ) ) ( not ( = ?auto_774309 ?auto_774310 ) ) ( not ( = ?auto_774309 ?auto_774311 ) ) ( not ( = ?auto_774309 ?auto_774312 ) ) ( not ( = ?auto_774309 ?auto_774313 ) ) ( not ( = ?auto_774309 ?auto_774314 ) ) ( not ( = ?auto_774309 ?auto_774315 ) ) ( not ( = ?auto_774309 ?auto_774316 ) ) ( not ( = ?auto_774309 ?auto_774317 ) ) ( not ( = ?auto_774309 ?auto_774318 ) ) ( not ( = ?auto_774309 ?auto_774319 ) ) ( not ( = ?auto_774310 ?auto_774311 ) ) ( not ( = ?auto_774310 ?auto_774312 ) ) ( not ( = ?auto_774310 ?auto_774313 ) ) ( not ( = ?auto_774310 ?auto_774314 ) ) ( not ( = ?auto_774310 ?auto_774315 ) ) ( not ( = ?auto_774310 ?auto_774316 ) ) ( not ( = ?auto_774310 ?auto_774317 ) ) ( not ( = ?auto_774310 ?auto_774318 ) ) ( not ( = ?auto_774310 ?auto_774319 ) ) ( not ( = ?auto_774311 ?auto_774312 ) ) ( not ( = ?auto_774311 ?auto_774313 ) ) ( not ( = ?auto_774311 ?auto_774314 ) ) ( not ( = ?auto_774311 ?auto_774315 ) ) ( not ( = ?auto_774311 ?auto_774316 ) ) ( not ( = ?auto_774311 ?auto_774317 ) ) ( not ( = ?auto_774311 ?auto_774318 ) ) ( not ( = ?auto_774311 ?auto_774319 ) ) ( not ( = ?auto_774312 ?auto_774313 ) ) ( not ( = ?auto_774312 ?auto_774314 ) ) ( not ( = ?auto_774312 ?auto_774315 ) ) ( not ( = ?auto_774312 ?auto_774316 ) ) ( not ( = ?auto_774312 ?auto_774317 ) ) ( not ( = ?auto_774312 ?auto_774318 ) ) ( not ( = ?auto_774312 ?auto_774319 ) ) ( not ( = ?auto_774313 ?auto_774314 ) ) ( not ( = ?auto_774313 ?auto_774315 ) ) ( not ( = ?auto_774313 ?auto_774316 ) ) ( not ( = ?auto_774313 ?auto_774317 ) ) ( not ( = ?auto_774313 ?auto_774318 ) ) ( not ( = ?auto_774313 ?auto_774319 ) ) ( not ( = ?auto_774314 ?auto_774315 ) ) ( not ( = ?auto_774314 ?auto_774316 ) ) ( not ( = ?auto_774314 ?auto_774317 ) ) ( not ( = ?auto_774314 ?auto_774318 ) ) ( not ( = ?auto_774314 ?auto_774319 ) ) ( not ( = ?auto_774315 ?auto_774316 ) ) ( not ( = ?auto_774315 ?auto_774317 ) ) ( not ( = ?auto_774315 ?auto_774318 ) ) ( not ( = ?auto_774315 ?auto_774319 ) ) ( not ( = ?auto_774316 ?auto_774317 ) ) ( not ( = ?auto_774316 ?auto_774318 ) ) ( not ( = ?auto_774316 ?auto_774319 ) ) ( not ( = ?auto_774317 ?auto_774318 ) ) ( not ( = ?auto_774317 ?auto_774319 ) ) ( not ( = ?auto_774318 ?auto_774319 ) ) ( ON ?auto_774318 ?auto_774319 ) ( ON ?auto_774317 ?auto_774318 ) ( ON ?auto_774316 ?auto_774317 ) ( ON ?auto_774315 ?auto_774316 ) ( ON ?auto_774314 ?auto_774315 ) ( ON ?auto_774313 ?auto_774314 ) ( ON ?auto_774312 ?auto_774313 ) ( ON ?auto_774311 ?auto_774312 ) ( ON ?auto_774310 ?auto_774311 ) ( CLEAR ?auto_774308 ) ( ON ?auto_774309 ?auto_774310 ) ( CLEAR ?auto_774309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_774302 ?auto_774303 ?auto_774304 ?auto_774305 ?auto_774306 ?auto_774307 ?auto_774308 ?auto_774309 )
      ( MAKE-18PILE ?auto_774302 ?auto_774303 ?auto_774304 ?auto_774305 ?auto_774306 ?auto_774307 ?auto_774308 ?auto_774309 ?auto_774310 ?auto_774311 ?auto_774312 ?auto_774313 ?auto_774314 ?auto_774315 ?auto_774316 ?auto_774317 ?auto_774318 ?auto_774319 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774338 - BLOCK
      ?auto_774339 - BLOCK
      ?auto_774340 - BLOCK
      ?auto_774341 - BLOCK
      ?auto_774342 - BLOCK
      ?auto_774343 - BLOCK
      ?auto_774344 - BLOCK
      ?auto_774345 - BLOCK
      ?auto_774346 - BLOCK
      ?auto_774347 - BLOCK
      ?auto_774348 - BLOCK
      ?auto_774349 - BLOCK
      ?auto_774350 - BLOCK
      ?auto_774351 - BLOCK
      ?auto_774352 - BLOCK
      ?auto_774353 - BLOCK
      ?auto_774354 - BLOCK
      ?auto_774355 - BLOCK
    )
    :vars
    (
      ?auto_774356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774355 ?auto_774356 ) ( ON-TABLE ?auto_774338 ) ( ON ?auto_774339 ?auto_774338 ) ( ON ?auto_774340 ?auto_774339 ) ( ON ?auto_774341 ?auto_774340 ) ( ON ?auto_774342 ?auto_774341 ) ( ON ?auto_774343 ?auto_774342 ) ( not ( = ?auto_774338 ?auto_774339 ) ) ( not ( = ?auto_774338 ?auto_774340 ) ) ( not ( = ?auto_774338 ?auto_774341 ) ) ( not ( = ?auto_774338 ?auto_774342 ) ) ( not ( = ?auto_774338 ?auto_774343 ) ) ( not ( = ?auto_774338 ?auto_774344 ) ) ( not ( = ?auto_774338 ?auto_774345 ) ) ( not ( = ?auto_774338 ?auto_774346 ) ) ( not ( = ?auto_774338 ?auto_774347 ) ) ( not ( = ?auto_774338 ?auto_774348 ) ) ( not ( = ?auto_774338 ?auto_774349 ) ) ( not ( = ?auto_774338 ?auto_774350 ) ) ( not ( = ?auto_774338 ?auto_774351 ) ) ( not ( = ?auto_774338 ?auto_774352 ) ) ( not ( = ?auto_774338 ?auto_774353 ) ) ( not ( = ?auto_774338 ?auto_774354 ) ) ( not ( = ?auto_774338 ?auto_774355 ) ) ( not ( = ?auto_774338 ?auto_774356 ) ) ( not ( = ?auto_774339 ?auto_774340 ) ) ( not ( = ?auto_774339 ?auto_774341 ) ) ( not ( = ?auto_774339 ?auto_774342 ) ) ( not ( = ?auto_774339 ?auto_774343 ) ) ( not ( = ?auto_774339 ?auto_774344 ) ) ( not ( = ?auto_774339 ?auto_774345 ) ) ( not ( = ?auto_774339 ?auto_774346 ) ) ( not ( = ?auto_774339 ?auto_774347 ) ) ( not ( = ?auto_774339 ?auto_774348 ) ) ( not ( = ?auto_774339 ?auto_774349 ) ) ( not ( = ?auto_774339 ?auto_774350 ) ) ( not ( = ?auto_774339 ?auto_774351 ) ) ( not ( = ?auto_774339 ?auto_774352 ) ) ( not ( = ?auto_774339 ?auto_774353 ) ) ( not ( = ?auto_774339 ?auto_774354 ) ) ( not ( = ?auto_774339 ?auto_774355 ) ) ( not ( = ?auto_774339 ?auto_774356 ) ) ( not ( = ?auto_774340 ?auto_774341 ) ) ( not ( = ?auto_774340 ?auto_774342 ) ) ( not ( = ?auto_774340 ?auto_774343 ) ) ( not ( = ?auto_774340 ?auto_774344 ) ) ( not ( = ?auto_774340 ?auto_774345 ) ) ( not ( = ?auto_774340 ?auto_774346 ) ) ( not ( = ?auto_774340 ?auto_774347 ) ) ( not ( = ?auto_774340 ?auto_774348 ) ) ( not ( = ?auto_774340 ?auto_774349 ) ) ( not ( = ?auto_774340 ?auto_774350 ) ) ( not ( = ?auto_774340 ?auto_774351 ) ) ( not ( = ?auto_774340 ?auto_774352 ) ) ( not ( = ?auto_774340 ?auto_774353 ) ) ( not ( = ?auto_774340 ?auto_774354 ) ) ( not ( = ?auto_774340 ?auto_774355 ) ) ( not ( = ?auto_774340 ?auto_774356 ) ) ( not ( = ?auto_774341 ?auto_774342 ) ) ( not ( = ?auto_774341 ?auto_774343 ) ) ( not ( = ?auto_774341 ?auto_774344 ) ) ( not ( = ?auto_774341 ?auto_774345 ) ) ( not ( = ?auto_774341 ?auto_774346 ) ) ( not ( = ?auto_774341 ?auto_774347 ) ) ( not ( = ?auto_774341 ?auto_774348 ) ) ( not ( = ?auto_774341 ?auto_774349 ) ) ( not ( = ?auto_774341 ?auto_774350 ) ) ( not ( = ?auto_774341 ?auto_774351 ) ) ( not ( = ?auto_774341 ?auto_774352 ) ) ( not ( = ?auto_774341 ?auto_774353 ) ) ( not ( = ?auto_774341 ?auto_774354 ) ) ( not ( = ?auto_774341 ?auto_774355 ) ) ( not ( = ?auto_774341 ?auto_774356 ) ) ( not ( = ?auto_774342 ?auto_774343 ) ) ( not ( = ?auto_774342 ?auto_774344 ) ) ( not ( = ?auto_774342 ?auto_774345 ) ) ( not ( = ?auto_774342 ?auto_774346 ) ) ( not ( = ?auto_774342 ?auto_774347 ) ) ( not ( = ?auto_774342 ?auto_774348 ) ) ( not ( = ?auto_774342 ?auto_774349 ) ) ( not ( = ?auto_774342 ?auto_774350 ) ) ( not ( = ?auto_774342 ?auto_774351 ) ) ( not ( = ?auto_774342 ?auto_774352 ) ) ( not ( = ?auto_774342 ?auto_774353 ) ) ( not ( = ?auto_774342 ?auto_774354 ) ) ( not ( = ?auto_774342 ?auto_774355 ) ) ( not ( = ?auto_774342 ?auto_774356 ) ) ( not ( = ?auto_774343 ?auto_774344 ) ) ( not ( = ?auto_774343 ?auto_774345 ) ) ( not ( = ?auto_774343 ?auto_774346 ) ) ( not ( = ?auto_774343 ?auto_774347 ) ) ( not ( = ?auto_774343 ?auto_774348 ) ) ( not ( = ?auto_774343 ?auto_774349 ) ) ( not ( = ?auto_774343 ?auto_774350 ) ) ( not ( = ?auto_774343 ?auto_774351 ) ) ( not ( = ?auto_774343 ?auto_774352 ) ) ( not ( = ?auto_774343 ?auto_774353 ) ) ( not ( = ?auto_774343 ?auto_774354 ) ) ( not ( = ?auto_774343 ?auto_774355 ) ) ( not ( = ?auto_774343 ?auto_774356 ) ) ( not ( = ?auto_774344 ?auto_774345 ) ) ( not ( = ?auto_774344 ?auto_774346 ) ) ( not ( = ?auto_774344 ?auto_774347 ) ) ( not ( = ?auto_774344 ?auto_774348 ) ) ( not ( = ?auto_774344 ?auto_774349 ) ) ( not ( = ?auto_774344 ?auto_774350 ) ) ( not ( = ?auto_774344 ?auto_774351 ) ) ( not ( = ?auto_774344 ?auto_774352 ) ) ( not ( = ?auto_774344 ?auto_774353 ) ) ( not ( = ?auto_774344 ?auto_774354 ) ) ( not ( = ?auto_774344 ?auto_774355 ) ) ( not ( = ?auto_774344 ?auto_774356 ) ) ( not ( = ?auto_774345 ?auto_774346 ) ) ( not ( = ?auto_774345 ?auto_774347 ) ) ( not ( = ?auto_774345 ?auto_774348 ) ) ( not ( = ?auto_774345 ?auto_774349 ) ) ( not ( = ?auto_774345 ?auto_774350 ) ) ( not ( = ?auto_774345 ?auto_774351 ) ) ( not ( = ?auto_774345 ?auto_774352 ) ) ( not ( = ?auto_774345 ?auto_774353 ) ) ( not ( = ?auto_774345 ?auto_774354 ) ) ( not ( = ?auto_774345 ?auto_774355 ) ) ( not ( = ?auto_774345 ?auto_774356 ) ) ( not ( = ?auto_774346 ?auto_774347 ) ) ( not ( = ?auto_774346 ?auto_774348 ) ) ( not ( = ?auto_774346 ?auto_774349 ) ) ( not ( = ?auto_774346 ?auto_774350 ) ) ( not ( = ?auto_774346 ?auto_774351 ) ) ( not ( = ?auto_774346 ?auto_774352 ) ) ( not ( = ?auto_774346 ?auto_774353 ) ) ( not ( = ?auto_774346 ?auto_774354 ) ) ( not ( = ?auto_774346 ?auto_774355 ) ) ( not ( = ?auto_774346 ?auto_774356 ) ) ( not ( = ?auto_774347 ?auto_774348 ) ) ( not ( = ?auto_774347 ?auto_774349 ) ) ( not ( = ?auto_774347 ?auto_774350 ) ) ( not ( = ?auto_774347 ?auto_774351 ) ) ( not ( = ?auto_774347 ?auto_774352 ) ) ( not ( = ?auto_774347 ?auto_774353 ) ) ( not ( = ?auto_774347 ?auto_774354 ) ) ( not ( = ?auto_774347 ?auto_774355 ) ) ( not ( = ?auto_774347 ?auto_774356 ) ) ( not ( = ?auto_774348 ?auto_774349 ) ) ( not ( = ?auto_774348 ?auto_774350 ) ) ( not ( = ?auto_774348 ?auto_774351 ) ) ( not ( = ?auto_774348 ?auto_774352 ) ) ( not ( = ?auto_774348 ?auto_774353 ) ) ( not ( = ?auto_774348 ?auto_774354 ) ) ( not ( = ?auto_774348 ?auto_774355 ) ) ( not ( = ?auto_774348 ?auto_774356 ) ) ( not ( = ?auto_774349 ?auto_774350 ) ) ( not ( = ?auto_774349 ?auto_774351 ) ) ( not ( = ?auto_774349 ?auto_774352 ) ) ( not ( = ?auto_774349 ?auto_774353 ) ) ( not ( = ?auto_774349 ?auto_774354 ) ) ( not ( = ?auto_774349 ?auto_774355 ) ) ( not ( = ?auto_774349 ?auto_774356 ) ) ( not ( = ?auto_774350 ?auto_774351 ) ) ( not ( = ?auto_774350 ?auto_774352 ) ) ( not ( = ?auto_774350 ?auto_774353 ) ) ( not ( = ?auto_774350 ?auto_774354 ) ) ( not ( = ?auto_774350 ?auto_774355 ) ) ( not ( = ?auto_774350 ?auto_774356 ) ) ( not ( = ?auto_774351 ?auto_774352 ) ) ( not ( = ?auto_774351 ?auto_774353 ) ) ( not ( = ?auto_774351 ?auto_774354 ) ) ( not ( = ?auto_774351 ?auto_774355 ) ) ( not ( = ?auto_774351 ?auto_774356 ) ) ( not ( = ?auto_774352 ?auto_774353 ) ) ( not ( = ?auto_774352 ?auto_774354 ) ) ( not ( = ?auto_774352 ?auto_774355 ) ) ( not ( = ?auto_774352 ?auto_774356 ) ) ( not ( = ?auto_774353 ?auto_774354 ) ) ( not ( = ?auto_774353 ?auto_774355 ) ) ( not ( = ?auto_774353 ?auto_774356 ) ) ( not ( = ?auto_774354 ?auto_774355 ) ) ( not ( = ?auto_774354 ?auto_774356 ) ) ( not ( = ?auto_774355 ?auto_774356 ) ) ( ON ?auto_774354 ?auto_774355 ) ( ON ?auto_774353 ?auto_774354 ) ( ON ?auto_774352 ?auto_774353 ) ( ON ?auto_774351 ?auto_774352 ) ( ON ?auto_774350 ?auto_774351 ) ( ON ?auto_774349 ?auto_774350 ) ( ON ?auto_774348 ?auto_774349 ) ( ON ?auto_774347 ?auto_774348 ) ( ON ?auto_774346 ?auto_774347 ) ( ON ?auto_774345 ?auto_774346 ) ( CLEAR ?auto_774343 ) ( ON ?auto_774344 ?auto_774345 ) ( CLEAR ?auto_774344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_774338 ?auto_774339 ?auto_774340 ?auto_774341 ?auto_774342 ?auto_774343 ?auto_774344 )
      ( MAKE-18PILE ?auto_774338 ?auto_774339 ?auto_774340 ?auto_774341 ?auto_774342 ?auto_774343 ?auto_774344 ?auto_774345 ?auto_774346 ?auto_774347 ?auto_774348 ?auto_774349 ?auto_774350 ?auto_774351 ?auto_774352 ?auto_774353 ?auto_774354 ?auto_774355 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774375 - BLOCK
      ?auto_774376 - BLOCK
      ?auto_774377 - BLOCK
      ?auto_774378 - BLOCK
      ?auto_774379 - BLOCK
      ?auto_774380 - BLOCK
      ?auto_774381 - BLOCK
      ?auto_774382 - BLOCK
      ?auto_774383 - BLOCK
      ?auto_774384 - BLOCK
      ?auto_774385 - BLOCK
      ?auto_774386 - BLOCK
      ?auto_774387 - BLOCK
      ?auto_774388 - BLOCK
      ?auto_774389 - BLOCK
      ?auto_774390 - BLOCK
      ?auto_774391 - BLOCK
      ?auto_774392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_774392 ) ( ON-TABLE ?auto_774375 ) ( ON ?auto_774376 ?auto_774375 ) ( ON ?auto_774377 ?auto_774376 ) ( ON ?auto_774378 ?auto_774377 ) ( ON ?auto_774379 ?auto_774378 ) ( ON ?auto_774380 ?auto_774379 ) ( not ( = ?auto_774375 ?auto_774376 ) ) ( not ( = ?auto_774375 ?auto_774377 ) ) ( not ( = ?auto_774375 ?auto_774378 ) ) ( not ( = ?auto_774375 ?auto_774379 ) ) ( not ( = ?auto_774375 ?auto_774380 ) ) ( not ( = ?auto_774375 ?auto_774381 ) ) ( not ( = ?auto_774375 ?auto_774382 ) ) ( not ( = ?auto_774375 ?auto_774383 ) ) ( not ( = ?auto_774375 ?auto_774384 ) ) ( not ( = ?auto_774375 ?auto_774385 ) ) ( not ( = ?auto_774375 ?auto_774386 ) ) ( not ( = ?auto_774375 ?auto_774387 ) ) ( not ( = ?auto_774375 ?auto_774388 ) ) ( not ( = ?auto_774375 ?auto_774389 ) ) ( not ( = ?auto_774375 ?auto_774390 ) ) ( not ( = ?auto_774375 ?auto_774391 ) ) ( not ( = ?auto_774375 ?auto_774392 ) ) ( not ( = ?auto_774376 ?auto_774377 ) ) ( not ( = ?auto_774376 ?auto_774378 ) ) ( not ( = ?auto_774376 ?auto_774379 ) ) ( not ( = ?auto_774376 ?auto_774380 ) ) ( not ( = ?auto_774376 ?auto_774381 ) ) ( not ( = ?auto_774376 ?auto_774382 ) ) ( not ( = ?auto_774376 ?auto_774383 ) ) ( not ( = ?auto_774376 ?auto_774384 ) ) ( not ( = ?auto_774376 ?auto_774385 ) ) ( not ( = ?auto_774376 ?auto_774386 ) ) ( not ( = ?auto_774376 ?auto_774387 ) ) ( not ( = ?auto_774376 ?auto_774388 ) ) ( not ( = ?auto_774376 ?auto_774389 ) ) ( not ( = ?auto_774376 ?auto_774390 ) ) ( not ( = ?auto_774376 ?auto_774391 ) ) ( not ( = ?auto_774376 ?auto_774392 ) ) ( not ( = ?auto_774377 ?auto_774378 ) ) ( not ( = ?auto_774377 ?auto_774379 ) ) ( not ( = ?auto_774377 ?auto_774380 ) ) ( not ( = ?auto_774377 ?auto_774381 ) ) ( not ( = ?auto_774377 ?auto_774382 ) ) ( not ( = ?auto_774377 ?auto_774383 ) ) ( not ( = ?auto_774377 ?auto_774384 ) ) ( not ( = ?auto_774377 ?auto_774385 ) ) ( not ( = ?auto_774377 ?auto_774386 ) ) ( not ( = ?auto_774377 ?auto_774387 ) ) ( not ( = ?auto_774377 ?auto_774388 ) ) ( not ( = ?auto_774377 ?auto_774389 ) ) ( not ( = ?auto_774377 ?auto_774390 ) ) ( not ( = ?auto_774377 ?auto_774391 ) ) ( not ( = ?auto_774377 ?auto_774392 ) ) ( not ( = ?auto_774378 ?auto_774379 ) ) ( not ( = ?auto_774378 ?auto_774380 ) ) ( not ( = ?auto_774378 ?auto_774381 ) ) ( not ( = ?auto_774378 ?auto_774382 ) ) ( not ( = ?auto_774378 ?auto_774383 ) ) ( not ( = ?auto_774378 ?auto_774384 ) ) ( not ( = ?auto_774378 ?auto_774385 ) ) ( not ( = ?auto_774378 ?auto_774386 ) ) ( not ( = ?auto_774378 ?auto_774387 ) ) ( not ( = ?auto_774378 ?auto_774388 ) ) ( not ( = ?auto_774378 ?auto_774389 ) ) ( not ( = ?auto_774378 ?auto_774390 ) ) ( not ( = ?auto_774378 ?auto_774391 ) ) ( not ( = ?auto_774378 ?auto_774392 ) ) ( not ( = ?auto_774379 ?auto_774380 ) ) ( not ( = ?auto_774379 ?auto_774381 ) ) ( not ( = ?auto_774379 ?auto_774382 ) ) ( not ( = ?auto_774379 ?auto_774383 ) ) ( not ( = ?auto_774379 ?auto_774384 ) ) ( not ( = ?auto_774379 ?auto_774385 ) ) ( not ( = ?auto_774379 ?auto_774386 ) ) ( not ( = ?auto_774379 ?auto_774387 ) ) ( not ( = ?auto_774379 ?auto_774388 ) ) ( not ( = ?auto_774379 ?auto_774389 ) ) ( not ( = ?auto_774379 ?auto_774390 ) ) ( not ( = ?auto_774379 ?auto_774391 ) ) ( not ( = ?auto_774379 ?auto_774392 ) ) ( not ( = ?auto_774380 ?auto_774381 ) ) ( not ( = ?auto_774380 ?auto_774382 ) ) ( not ( = ?auto_774380 ?auto_774383 ) ) ( not ( = ?auto_774380 ?auto_774384 ) ) ( not ( = ?auto_774380 ?auto_774385 ) ) ( not ( = ?auto_774380 ?auto_774386 ) ) ( not ( = ?auto_774380 ?auto_774387 ) ) ( not ( = ?auto_774380 ?auto_774388 ) ) ( not ( = ?auto_774380 ?auto_774389 ) ) ( not ( = ?auto_774380 ?auto_774390 ) ) ( not ( = ?auto_774380 ?auto_774391 ) ) ( not ( = ?auto_774380 ?auto_774392 ) ) ( not ( = ?auto_774381 ?auto_774382 ) ) ( not ( = ?auto_774381 ?auto_774383 ) ) ( not ( = ?auto_774381 ?auto_774384 ) ) ( not ( = ?auto_774381 ?auto_774385 ) ) ( not ( = ?auto_774381 ?auto_774386 ) ) ( not ( = ?auto_774381 ?auto_774387 ) ) ( not ( = ?auto_774381 ?auto_774388 ) ) ( not ( = ?auto_774381 ?auto_774389 ) ) ( not ( = ?auto_774381 ?auto_774390 ) ) ( not ( = ?auto_774381 ?auto_774391 ) ) ( not ( = ?auto_774381 ?auto_774392 ) ) ( not ( = ?auto_774382 ?auto_774383 ) ) ( not ( = ?auto_774382 ?auto_774384 ) ) ( not ( = ?auto_774382 ?auto_774385 ) ) ( not ( = ?auto_774382 ?auto_774386 ) ) ( not ( = ?auto_774382 ?auto_774387 ) ) ( not ( = ?auto_774382 ?auto_774388 ) ) ( not ( = ?auto_774382 ?auto_774389 ) ) ( not ( = ?auto_774382 ?auto_774390 ) ) ( not ( = ?auto_774382 ?auto_774391 ) ) ( not ( = ?auto_774382 ?auto_774392 ) ) ( not ( = ?auto_774383 ?auto_774384 ) ) ( not ( = ?auto_774383 ?auto_774385 ) ) ( not ( = ?auto_774383 ?auto_774386 ) ) ( not ( = ?auto_774383 ?auto_774387 ) ) ( not ( = ?auto_774383 ?auto_774388 ) ) ( not ( = ?auto_774383 ?auto_774389 ) ) ( not ( = ?auto_774383 ?auto_774390 ) ) ( not ( = ?auto_774383 ?auto_774391 ) ) ( not ( = ?auto_774383 ?auto_774392 ) ) ( not ( = ?auto_774384 ?auto_774385 ) ) ( not ( = ?auto_774384 ?auto_774386 ) ) ( not ( = ?auto_774384 ?auto_774387 ) ) ( not ( = ?auto_774384 ?auto_774388 ) ) ( not ( = ?auto_774384 ?auto_774389 ) ) ( not ( = ?auto_774384 ?auto_774390 ) ) ( not ( = ?auto_774384 ?auto_774391 ) ) ( not ( = ?auto_774384 ?auto_774392 ) ) ( not ( = ?auto_774385 ?auto_774386 ) ) ( not ( = ?auto_774385 ?auto_774387 ) ) ( not ( = ?auto_774385 ?auto_774388 ) ) ( not ( = ?auto_774385 ?auto_774389 ) ) ( not ( = ?auto_774385 ?auto_774390 ) ) ( not ( = ?auto_774385 ?auto_774391 ) ) ( not ( = ?auto_774385 ?auto_774392 ) ) ( not ( = ?auto_774386 ?auto_774387 ) ) ( not ( = ?auto_774386 ?auto_774388 ) ) ( not ( = ?auto_774386 ?auto_774389 ) ) ( not ( = ?auto_774386 ?auto_774390 ) ) ( not ( = ?auto_774386 ?auto_774391 ) ) ( not ( = ?auto_774386 ?auto_774392 ) ) ( not ( = ?auto_774387 ?auto_774388 ) ) ( not ( = ?auto_774387 ?auto_774389 ) ) ( not ( = ?auto_774387 ?auto_774390 ) ) ( not ( = ?auto_774387 ?auto_774391 ) ) ( not ( = ?auto_774387 ?auto_774392 ) ) ( not ( = ?auto_774388 ?auto_774389 ) ) ( not ( = ?auto_774388 ?auto_774390 ) ) ( not ( = ?auto_774388 ?auto_774391 ) ) ( not ( = ?auto_774388 ?auto_774392 ) ) ( not ( = ?auto_774389 ?auto_774390 ) ) ( not ( = ?auto_774389 ?auto_774391 ) ) ( not ( = ?auto_774389 ?auto_774392 ) ) ( not ( = ?auto_774390 ?auto_774391 ) ) ( not ( = ?auto_774390 ?auto_774392 ) ) ( not ( = ?auto_774391 ?auto_774392 ) ) ( ON ?auto_774391 ?auto_774392 ) ( ON ?auto_774390 ?auto_774391 ) ( ON ?auto_774389 ?auto_774390 ) ( ON ?auto_774388 ?auto_774389 ) ( ON ?auto_774387 ?auto_774388 ) ( ON ?auto_774386 ?auto_774387 ) ( ON ?auto_774385 ?auto_774386 ) ( ON ?auto_774384 ?auto_774385 ) ( ON ?auto_774383 ?auto_774384 ) ( ON ?auto_774382 ?auto_774383 ) ( CLEAR ?auto_774380 ) ( ON ?auto_774381 ?auto_774382 ) ( CLEAR ?auto_774381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_774375 ?auto_774376 ?auto_774377 ?auto_774378 ?auto_774379 ?auto_774380 ?auto_774381 )
      ( MAKE-18PILE ?auto_774375 ?auto_774376 ?auto_774377 ?auto_774378 ?auto_774379 ?auto_774380 ?auto_774381 ?auto_774382 ?auto_774383 ?auto_774384 ?auto_774385 ?auto_774386 ?auto_774387 ?auto_774388 ?auto_774389 ?auto_774390 ?auto_774391 ?auto_774392 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774411 - BLOCK
      ?auto_774412 - BLOCK
      ?auto_774413 - BLOCK
      ?auto_774414 - BLOCK
      ?auto_774415 - BLOCK
      ?auto_774416 - BLOCK
      ?auto_774417 - BLOCK
      ?auto_774418 - BLOCK
      ?auto_774419 - BLOCK
      ?auto_774420 - BLOCK
      ?auto_774421 - BLOCK
      ?auto_774422 - BLOCK
      ?auto_774423 - BLOCK
      ?auto_774424 - BLOCK
      ?auto_774425 - BLOCK
      ?auto_774426 - BLOCK
      ?auto_774427 - BLOCK
      ?auto_774428 - BLOCK
    )
    :vars
    (
      ?auto_774429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774428 ?auto_774429 ) ( ON-TABLE ?auto_774411 ) ( ON ?auto_774412 ?auto_774411 ) ( ON ?auto_774413 ?auto_774412 ) ( ON ?auto_774414 ?auto_774413 ) ( ON ?auto_774415 ?auto_774414 ) ( not ( = ?auto_774411 ?auto_774412 ) ) ( not ( = ?auto_774411 ?auto_774413 ) ) ( not ( = ?auto_774411 ?auto_774414 ) ) ( not ( = ?auto_774411 ?auto_774415 ) ) ( not ( = ?auto_774411 ?auto_774416 ) ) ( not ( = ?auto_774411 ?auto_774417 ) ) ( not ( = ?auto_774411 ?auto_774418 ) ) ( not ( = ?auto_774411 ?auto_774419 ) ) ( not ( = ?auto_774411 ?auto_774420 ) ) ( not ( = ?auto_774411 ?auto_774421 ) ) ( not ( = ?auto_774411 ?auto_774422 ) ) ( not ( = ?auto_774411 ?auto_774423 ) ) ( not ( = ?auto_774411 ?auto_774424 ) ) ( not ( = ?auto_774411 ?auto_774425 ) ) ( not ( = ?auto_774411 ?auto_774426 ) ) ( not ( = ?auto_774411 ?auto_774427 ) ) ( not ( = ?auto_774411 ?auto_774428 ) ) ( not ( = ?auto_774411 ?auto_774429 ) ) ( not ( = ?auto_774412 ?auto_774413 ) ) ( not ( = ?auto_774412 ?auto_774414 ) ) ( not ( = ?auto_774412 ?auto_774415 ) ) ( not ( = ?auto_774412 ?auto_774416 ) ) ( not ( = ?auto_774412 ?auto_774417 ) ) ( not ( = ?auto_774412 ?auto_774418 ) ) ( not ( = ?auto_774412 ?auto_774419 ) ) ( not ( = ?auto_774412 ?auto_774420 ) ) ( not ( = ?auto_774412 ?auto_774421 ) ) ( not ( = ?auto_774412 ?auto_774422 ) ) ( not ( = ?auto_774412 ?auto_774423 ) ) ( not ( = ?auto_774412 ?auto_774424 ) ) ( not ( = ?auto_774412 ?auto_774425 ) ) ( not ( = ?auto_774412 ?auto_774426 ) ) ( not ( = ?auto_774412 ?auto_774427 ) ) ( not ( = ?auto_774412 ?auto_774428 ) ) ( not ( = ?auto_774412 ?auto_774429 ) ) ( not ( = ?auto_774413 ?auto_774414 ) ) ( not ( = ?auto_774413 ?auto_774415 ) ) ( not ( = ?auto_774413 ?auto_774416 ) ) ( not ( = ?auto_774413 ?auto_774417 ) ) ( not ( = ?auto_774413 ?auto_774418 ) ) ( not ( = ?auto_774413 ?auto_774419 ) ) ( not ( = ?auto_774413 ?auto_774420 ) ) ( not ( = ?auto_774413 ?auto_774421 ) ) ( not ( = ?auto_774413 ?auto_774422 ) ) ( not ( = ?auto_774413 ?auto_774423 ) ) ( not ( = ?auto_774413 ?auto_774424 ) ) ( not ( = ?auto_774413 ?auto_774425 ) ) ( not ( = ?auto_774413 ?auto_774426 ) ) ( not ( = ?auto_774413 ?auto_774427 ) ) ( not ( = ?auto_774413 ?auto_774428 ) ) ( not ( = ?auto_774413 ?auto_774429 ) ) ( not ( = ?auto_774414 ?auto_774415 ) ) ( not ( = ?auto_774414 ?auto_774416 ) ) ( not ( = ?auto_774414 ?auto_774417 ) ) ( not ( = ?auto_774414 ?auto_774418 ) ) ( not ( = ?auto_774414 ?auto_774419 ) ) ( not ( = ?auto_774414 ?auto_774420 ) ) ( not ( = ?auto_774414 ?auto_774421 ) ) ( not ( = ?auto_774414 ?auto_774422 ) ) ( not ( = ?auto_774414 ?auto_774423 ) ) ( not ( = ?auto_774414 ?auto_774424 ) ) ( not ( = ?auto_774414 ?auto_774425 ) ) ( not ( = ?auto_774414 ?auto_774426 ) ) ( not ( = ?auto_774414 ?auto_774427 ) ) ( not ( = ?auto_774414 ?auto_774428 ) ) ( not ( = ?auto_774414 ?auto_774429 ) ) ( not ( = ?auto_774415 ?auto_774416 ) ) ( not ( = ?auto_774415 ?auto_774417 ) ) ( not ( = ?auto_774415 ?auto_774418 ) ) ( not ( = ?auto_774415 ?auto_774419 ) ) ( not ( = ?auto_774415 ?auto_774420 ) ) ( not ( = ?auto_774415 ?auto_774421 ) ) ( not ( = ?auto_774415 ?auto_774422 ) ) ( not ( = ?auto_774415 ?auto_774423 ) ) ( not ( = ?auto_774415 ?auto_774424 ) ) ( not ( = ?auto_774415 ?auto_774425 ) ) ( not ( = ?auto_774415 ?auto_774426 ) ) ( not ( = ?auto_774415 ?auto_774427 ) ) ( not ( = ?auto_774415 ?auto_774428 ) ) ( not ( = ?auto_774415 ?auto_774429 ) ) ( not ( = ?auto_774416 ?auto_774417 ) ) ( not ( = ?auto_774416 ?auto_774418 ) ) ( not ( = ?auto_774416 ?auto_774419 ) ) ( not ( = ?auto_774416 ?auto_774420 ) ) ( not ( = ?auto_774416 ?auto_774421 ) ) ( not ( = ?auto_774416 ?auto_774422 ) ) ( not ( = ?auto_774416 ?auto_774423 ) ) ( not ( = ?auto_774416 ?auto_774424 ) ) ( not ( = ?auto_774416 ?auto_774425 ) ) ( not ( = ?auto_774416 ?auto_774426 ) ) ( not ( = ?auto_774416 ?auto_774427 ) ) ( not ( = ?auto_774416 ?auto_774428 ) ) ( not ( = ?auto_774416 ?auto_774429 ) ) ( not ( = ?auto_774417 ?auto_774418 ) ) ( not ( = ?auto_774417 ?auto_774419 ) ) ( not ( = ?auto_774417 ?auto_774420 ) ) ( not ( = ?auto_774417 ?auto_774421 ) ) ( not ( = ?auto_774417 ?auto_774422 ) ) ( not ( = ?auto_774417 ?auto_774423 ) ) ( not ( = ?auto_774417 ?auto_774424 ) ) ( not ( = ?auto_774417 ?auto_774425 ) ) ( not ( = ?auto_774417 ?auto_774426 ) ) ( not ( = ?auto_774417 ?auto_774427 ) ) ( not ( = ?auto_774417 ?auto_774428 ) ) ( not ( = ?auto_774417 ?auto_774429 ) ) ( not ( = ?auto_774418 ?auto_774419 ) ) ( not ( = ?auto_774418 ?auto_774420 ) ) ( not ( = ?auto_774418 ?auto_774421 ) ) ( not ( = ?auto_774418 ?auto_774422 ) ) ( not ( = ?auto_774418 ?auto_774423 ) ) ( not ( = ?auto_774418 ?auto_774424 ) ) ( not ( = ?auto_774418 ?auto_774425 ) ) ( not ( = ?auto_774418 ?auto_774426 ) ) ( not ( = ?auto_774418 ?auto_774427 ) ) ( not ( = ?auto_774418 ?auto_774428 ) ) ( not ( = ?auto_774418 ?auto_774429 ) ) ( not ( = ?auto_774419 ?auto_774420 ) ) ( not ( = ?auto_774419 ?auto_774421 ) ) ( not ( = ?auto_774419 ?auto_774422 ) ) ( not ( = ?auto_774419 ?auto_774423 ) ) ( not ( = ?auto_774419 ?auto_774424 ) ) ( not ( = ?auto_774419 ?auto_774425 ) ) ( not ( = ?auto_774419 ?auto_774426 ) ) ( not ( = ?auto_774419 ?auto_774427 ) ) ( not ( = ?auto_774419 ?auto_774428 ) ) ( not ( = ?auto_774419 ?auto_774429 ) ) ( not ( = ?auto_774420 ?auto_774421 ) ) ( not ( = ?auto_774420 ?auto_774422 ) ) ( not ( = ?auto_774420 ?auto_774423 ) ) ( not ( = ?auto_774420 ?auto_774424 ) ) ( not ( = ?auto_774420 ?auto_774425 ) ) ( not ( = ?auto_774420 ?auto_774426 ) ) ( not ( = ?auto_774420 ?auto_774427 ) ) ( not ( = ?auto_774420 ?auto_774428 ) ) ( not ( = ?auto_774420 ?auto_774429 ) ) ( not ( = ?auto_774421 ?auto_774422 ) ) ( not ( = ?auto_774421 ?auto_774423 ) ) ( not ( = ?auto_774421 ?auto_774424 ) ) ( not ( = ?auto_774421 ?auto_774425 ) ) ( not ( = ?auto_774421 ?auto_774426 ) ) ( not ( = ?auto_774421 ?auto_774427 ) ) ( not ( = ?auto_774421 ?auto_774428 ) ) ( not ( = ?auto_774421 ?auto_774429 ) ) ( not ( = ?auto_774422 ?auto_774423 ) ) ( not ( = ?auto_774422 ?auto_774424 ) ) ( not ( = ?auto_774422 ?auto_774425 ) ) ( not ( = ?auto_774422 ?auto_774426 ) ) ( not ( = ?auto_774422 ?auto_774427 ) ) ( not ( = ?auto_774422 ?auto_774428 ) ) ( not ( = ?auto_774422 ?auto_774429 ) ) ( not ( = ?auto_774423 ?auto_774424 ) ) ( not ( = ?auto_774423 ?auto_774425 ) ) ( not ( = ?auto_774423 ?auto_774426 ) ) ( not ( = ?auto_774423 ?auto_774427 ) ) ( not ( = ?auto_774423 ?auto_774428 ) ) ( not ( = ?auto_774423 ?auto_774429 ) ) ( not ( = ?auto_774424 ?auto_774425 ) ) ( not ( = ?auto_774424 ?auto_774426 ) ) ( not ( = ?auto_774424 ?auto_774427 ) ) ( not ( = ?auto_774424 ?auto_774428 ) ) ( not ( = ?auto_774424 ?auto_774429 ) ) ( not ( = ?auto_774425 ?auto_774426 ) ) ( not ( = ?auto_774425 ?auto_774427 ) ) ( not ( = ?auto_774425 ?auto_774428 ) ) ( not ( = ?auto_774425 ?auto_774429 ) ) ( not ( = ?auto_774426 ?auto_774427 ) ) ( not ( = ?auto_774426 ?auto_774428 ) ) ( not ( = ?auto_774426 ?auto_774429 ) ) ( not ( = ?auto_774427 ?auto_774428 ) ) ( not ( = ?auto_774427 ?auto_774429 ) ) ( not ( = ?auto_774428 ?auto_774429 ) ) ( ON ?auto_774427 ?auto_774428 ) ( ON ?auto_774426 ?auto_774427 ) ( ON ?auto_774425 ?auto_774426 ) ( ON ?auto_774424 ?auto_774425 ) ( ON ?auto_774423 ?auto_774424 ) ( ON ?auto_774422 ?auto_774423 ) ( ON ?auto_774421 ?auto_774422 ) ( ON ?auto_774420 ?auto_774421 ) ( ON ?auto_774419 ?auto_774420 ) ( ON ?auto_774418 ?auto_774419 ) ( ON ?auto_774417 ?auto_774418 ) ( CLEAR ?auto_774415 ) ( ON ?auto_774416 ?auto_774417 ) ( CLEAR ?auto_774416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_774411 ?auto_774412 ?auto_774413 ?auto_774414 ?auto_774415 ?auto_774416 )
      ( MAKE-18PILE ?auto_774411 ?auto_774412 ?auto_774413 ?auto_774414 ?auto_774415 ?auto_774416 ?auto_774417 ?auto_774418 ?auto_774419 ?auto_774420 ?auto_774421 ?auto_774422 ?auto_774423 ?auto_774424 ?auto_774425 ?auto_774426 ?auto_774427 ?auto_774428 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774448 - BLOCK
      ?auto_774449 - BLOCK
      ?auto_774450 - BLOCK
      ?auto_774451 - BLOCK
      ?auto_774452 - BLOCK
      ?auto_774453 - BLOCK
      ?auto_774454 - BLOCK
      ?auto_774455 - BLOCK
      ?auto_774456 - BLOCK
      ?auto_774457 - BLOCK
      ?auto_774458 - BLOCK
      ?auto_774459 - BLOCK
      ?auto_774460 - BLOCK
      ?auto_774461 - BLOCK
      ?auto_774462 - BLOCK
      ?auto_774463 - BLOCK
      ?auto_774464 - BLOCK
      ?auto_774465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_774465 ) ( ON-TABLE ?auto_774448 ) ( ON ?auto_774449 ?auto_774448 ) ( ON ?auto_774450 ?auto_774449 ) ( ON ?auto_774451 ?auto_774450 ) ( ON ?auto_774452 ?auto_774451 ) ( not ( = ?auto_774448 ?auto_774449 ) ) ( not ( = ?auto_774448 ?auto_774450 ) ) ( not ( = ?auto_774448 ?auto_774451 ) ) ( not ( = ?auto_774448 ?auto_774452 ) ) ( not ( = ?auto_774448 ?auto_774453 ) ) ( not ( = ?auto_774448 ?auto_774454 ) ) ( not ( = ?auto_774448 ?auto_774455 ) ) ( not ( = ?auto_774448 ?auto_774456 ) ) ( not ( = ?auto_774448 ?auto_774457 ) ) ( not ( = ?auto_774448 ?auto_774458 ) ) ( not ( = ?auto_774448 ?auto_774459 ) ) ( not ( = ?auto_774448 ?auto_774460 ) ) ( not ( = ?auto_774448 ?auto_774461 ) ) ( not ( = ?auto_774448 ?auto_774462 ) ) ( not ( = ?auto_774448 ?auto_774463 ) ) ( not ( = ?auto_774448 ?auto_774464 ) ) ( not ( = ?auto_774448 ?auto_774465 ) ) ( not ( = ?auto_774449 ?auto_774450 ) ) ( not ( = ?auto_774449 ?auto_774451 ) ) ( not ( = ?auto_774449 ?auto_774452 ) ) ( not ( = ?auto_774449 ?auto_774453 ) ) ( not ( = ?auto_774449 ?auto_774454 ) ) ( not ( = ?auto_774449 ?auto_774455 ) ) ( not ( = ?auto_774449 ?auto_774456 ) ) ( not ( = ?auto_774449 ?auto_774457 ) ) ( not ( = ?auto_774449 ?auto_774458 ) ) ( not ( = ?auto_774449 ?auto_774459 ) ) ( not ( = ?auto_774449 ?auto_774460 ) ) ( not ( = ?auto_774449 ?auto_774461 ) ) ( not ( = ?auto_774449 ?auto_774462 ) ) ( not ( = ?auto_774449 ?auto_774463 ) ) ( not ( = ?auto_774449 ?auto_774464 ) ) ( not ( = ?auto_774449 ?auto_774465 ) ) ( not ( = ?auto_774450 ?auto_774451 ) ) ( not ( = ?auto_774450 ?auto_774452 ) ) ( not ( = ?auto_774450 ?auto_774453 ) ) ( not ( = ?auto_774450 ?auto_774454 ) ) ( not ( = ?auto_774450 ?auto_774455 ) ) ( not ( = ?auto_774450 ?auto_774456 ) ) ( not ( = ?auto_774450 ?auto_774457 ) ) ( not ( = ?auto_774450 ?auto_774458 ) ) ( not ( = ?auto_774450 ?auto_774459 ) ) ( not ( = ?auto_774450 ?auto_774460 ) ) ( not ( = ?auto_774450 ?auto_774461 ) ) ( not ( = ?auto_774450 ?auto_774462 ) ) ( not ( = ?auto_774450 ?auto_774463 ) ) ( not ( = ?auto_774450 ?auto_774464 ) ) ( not ( = ?auto_774450 ?auto_774465 ) ) ( not ( = ?auto_774451 ?auto_774452 ) ) ( not ( = ?auto_774451 ?auto_774453 ) ) ( not ( = ?auto_774451 ?auto_774454 ) ) ( not ( = ?auto_774451 ?auto_774455 ) ) ( not ( = ?auto_774451 ?auto_774456 ) ) ( not ( = ?auto_774451 ?auto_774457 ) ) ( not ( = ?auto_774451 ?auto_774458 ) ) ( not ( = ?auto_774451 ?auto_774459 ) ) ( not ( = ?auto_774451 ?auto_774460 ) ) ( not ( = ?auto_774451 ?auto_774461 ) ) ( not ( = ?auto_774451 ?auto_774462 ) ) ( not ( = ?auto_774451 ?auto_774463 ) ) ( not ( = ?auto_774451 ?auto_774464 ) ) ( not ( = ?auto_774451 ?auto_774465 ) ) ( not ( = ?auto_774452 ?auto_774453 ) ) ( not ( = ?auto_774452 ?auto_774454 ) ) ( not ( = ?auto_774452 ?auto_774455 ) ) ( not ( = ?auto_774452 ?auto_774456 ) ) ( not ( = ?auto_774452 ?auto_774457 ) ) ( not ( = ?auto_774452 ?auto_774458 ) ) ( not ( = ?auto_774452 ?auto_774459 ) ) ( not ( = ?auto_774452 ?auto_774460 ) ) ( not ( = ?auto_774452 ?auto_774461 ) ) ( not ( = ?auto_774452 ?auto_774462 ) ) ( not ( = ?auto_774452 ?auto_774463 ) ) ( not ( = ?auto_774452 ?auto_774464 ) ) ( not ( = ?auto_774452 ?auto_774465 ) ) ( not ( = ?auto_774453 ?auto_774454 ) ) ( not ( = ?auto_774453 ?auto_774455 ) ) ( not ( = ?auto_774453 ?auto_774456 ) ) ( not ( = ?auto_774453 ?auto_774457 ) ) ( not ( = ?auto_774453 ?auto_774458 ) ) ( not ( = ?auto_774453 ?auto_774459 ) ) ( not ( = ?auto_774453 ?auto_774460 ) ) ( not ( = ?auto_774453 ?auto_774461 ) ) ( not ( = ?auto_774453 ?auto_774462 ) ) ( not ( = ?auto_774453 ?auto_774463 ) ) ( not ( = ?auto_774453 ?auto_774464 ) ) ( not ( = ?auto_774453 ?auto_774465 ) ) ( not ( = ?auto_774454 ?auto_774455 ) ) ( not ( = ?auto_774454 ?auto_774456 ) ) ( not ( = ?auto_774454 ?auto_774457 ) ) ( not ( = ?auto_774454 ?auto_774458 ) ) ( not ( = ?auto_774454 ?auto_774459 ) ) ( not ( = ?auto_774454 ?auto_774460 ) ) ( not ( = ?auto_774454 ?auto_774461 ) ) ( not ( = ?auto_774454 ?auto_774462 ) ) ( not ( = ?auto_774454 ?auto_774463 ) ) ( not ( = ?auto_774454 ?auto_774464 ) ) ( not ( = ?auto_774454 ?auto_774465 ) ) ( not ( = ?auto_774455 ?auto_774456 ) ) ( not ( = ?auto_774455 ?auto_774457 ) ) ( not ( = ?auto_774455 ?auto_774458 ) ) ( not ( = ?auto_774455 ?auto_774459 ) ) ( not ( = ?auto_774455 ?auto_774460 ) ) ( not ( = ?auto_774455 ?auto_774461 ) ) ( not ( = ?auto_774455 ?auto_774462 ) ) ( not ( = ?auto_774455 ?auto_774463 ) ) ( not ( = ?auto_774455 ?auto_774464 ) ) ( not ( = ?auto_774455 ?auto_774465 ) ) ( not ( = ?auto_774456 ?auto_774457 ) ) ( not ( = ?auto_774456 ?auto_774458 ) ) ( not ( = ?auto_774456 ?auto_774459 ) ) ( not ( = ?auto_774456 ?auto_774460 ) ) ( not ( = ?auto_774456 ?auto_774461 ) ) ( not ( = ?auto_774456 ?auto_774462 ) ) ( not ( = ?auto_774456 ?auto_774463 ) ) ( not ( = ?auto_774456 ?auto_774464 ) ) ( not ( = ?auto_774456 ?auto_774465 ) ) ( not ( = ?auto_774457 ?auto_774458 ) ) ( not ( = ?auto_774457 ?auto_774459 ) ) ( not ( = ?auto_774457 ?auto_774460 ) ) ( not ( = ?auto_774457 ?auto_774461 ) ) ( not ( = ?auto_774457 ?auto_774462 ) ) ( not ( = ?auto_774457 ?auto_774463 ) ) ( not ( = ?auto_774457 ?auto_774464 ) ) ( not ( = ?auto_774457 ?auto_774465 ) ) ( not ( = ?auto_774458 ?auto_774459 ) ) ( not ( = ?auto_774458 ?auto_774460 ) ) ( not ( = ?auto_774458 ?auto_774461 ) ) ( not ( = ?auto_774458 ?auto_774462 ) ) ( not ( = ?auto_774458 ?auto_774463 ) ) ( not ( = ?auto_774458 ?auto_774464 ) ) ( not ( = ?auto_774458 ?auto_774465 ) ) ( not ( = ?auto_774459 ?auto_774460 ) ) ( not ( = ?auto_774459 ?auto_774461 ) ) ( not ( = ?auto_774459 ?auto_774462 ) ) ( not ( = ?auto_774459 ?auto_774463 ) ) ( not ( = ?auto_774459 ?auto_774464 ) ) ( not ( = ?auto_774459 ?auto_774465 ) ) ( not ( = ?auto_774460 ?auto_774461 ) ) ( not ( = ?auto_774460 ?auto_774462 ) ) ( not ( = ?auto_774460 ?auto_774463 ) ) ( not ( = ?auto_774460 ?auto_774464 ) ) ( not ( = ?auto_774460 ?auto_774465 ) ) ( not ( = ?auto_774461 ?auto_774462 ) ) ( not ( = ?auto_774461 ?auto_774463 ) ) ( not ( = ?auto_774461 ?auto_774464 ) ) ( not ( = ?auto_774461 ?auto_774465 ) ) ( not ( = ?auto_774462 ?auto_774463 ) ) ( not ( = ?auto_774462 ?auto_774464 ) ) ( not ( = ?auto_774462 ?auto_774465 ) ) ( not ( = ?auto_774463 ?auto_774464 ) ) ( not ( = ?auto_774463 ?auto_774465 ) ) ( not ( = ?auto_774464 ?auto_774465 ) ) ( ON ?auto_774464 ?auto_774465 ) ( ON ?auto_774463 ?auto_774464 ) ( ON ?auto_774462 ?auto_774463 ) ( ON ?auto_774461 ?auto_774462 ) ( ON ?auto_774460 ?auto_774461 ) ( ON ?auto_774459 ?auto_774460 ) ( ON ?auto_774458 ?auto_774459 ) ( ON ?auto_774457 ?auto_774458 ) ( ON ?auto_774456 ?auto_774457 ) ( ON ?auto_774455 ?auto_774456 ) ( ON ?auto_774454 ?auto_774455 ) ( CLEAR ?auto_774452 ) ( ON ?auto_774453 ?auto_774454 ) ( CLEAR ?auto_774453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_774448 ?auto_774449 ?auto_774450 ?auto_774451 ?auto_774452 ?auto_774453 )
      ( MAKE-18PILE ?auto_774448 ?auto_774449 ?auto_774450 ?auto_774451 ?auto_774452 ?auto_774453 ?auto_774454 ?auto_774455 ?auto_774456 ?auto_774457 ?auto_774458 ?auto_774459 ?auto_774460 ?auto_774461 ?auto_774462 ?auto_774463 ?auto_774464 ?auto_774465 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774484 - BLOCK
      ?auto_774485 - BLOCK
      ?auto_774486 - BLOCK
      ?auto_774487 - BLOCK
      ?auto_774488 - BLOCK
      ?auto_774489 - BLOCK
      ?auto_774490 - BLOCK
      ?auto_774491 - BLOCK
      ?auto_774492 - BLOCK
      ?auto_774493 - BLOCK
      ?auto_774494 - BLOCK
      ?auto_774495 - BLOCK
      ?auto_774496 - BLOCK
      ?auto_774497 - BLOCK
      ?auto_774498 - BLOCK
      ?auto_774499 - BLOCK
      ?auto_774500 - BLOCK
      ?auto_774501 - BLOCK
    )
    :vars
    (
      ?auto_774502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774501 ?auto_774502 ) ( ON-TABLE ?auto_774484 ) ( ON ?auto_774485 ?auto_774484 ) ( ON ?auto_774486 ?auto_774485 ) ( ON ?auto_774487 ?auto_774486 ) ( not ( = ?auto_774484 ?auto_774485 ) ) ( not ( = ?auto_774484 ?auto_774486 ) ) ( not ( = ?auto_774484 ?auto_774487 ) ) ( not ( = ?auto_774484 ?auto_774488 ) ) ( not ( = ?auto_774484 ?auto_774489 ) ) ( not ( = ?auto_774484 ?auto_774490 ) ) ( not ( = ?auto_774484 ?auto_774491 ) ) ( not ( = ?auto_774484 ?auto_774492 ) ) ( not ( = ?auto_774484 ?auto_774493 ) ) ( not ( = ?auto_774484 ?auto_774494 ) ) ( not ( = ?auto_774484 ?auto_774495 ) ) ( not ( = ?auto_774484 ?auto_774496 ) ) ( not ( = ?auto_774484 ?auto_774497 ) ) ( not ( = ?auto_774484 ?auto_774498 ) ) ( not ( = ?auto_774484 ?auto_774499 ) ) ( not ( = ?auto_774484 ?auto_774500 ) ) ( not ( = ?auto_774484 ?auto_774501 ) ) ( not ( = ?auto_774484 ?auto_774502 ) ) ( not ( = ?auto_774485 ?auto_774486 ) ) ( not ( = ?auto_774485 ?auto_774487 ) ) ( not ( = ?auto_774485 ?auto_774488 ) ) ( not ( = ?auto_774485 ?auto_774489 ) ) ( not ( = ?auto_774485 ?auto_774490 ) ) ( not ( = ?auto_774485 ?auto_774491 ) ) ( not ( = ?auto_774485 ?auto_774492 ) ) ( not ( = ?auto_774485 ?auto_774493 ) ) ( not ( = ?auto_774485 ?auto_774494 ) ) ( not ( = ?auto_774485 ?auto_774495 ) ) ( not ( = ?auto_774485 ?auto_774496 ) ) ( not ( = ?auto_774485 ?auto_774497 ) ) ( not ( = ?auto_774485 ?auto_774498 ) ) ( not ( = ?auto_774485 ?auto_774499 ) ) ( not ( = ?auto_774485 ?auto_774500 ) ) ( not ( = ?auto_774485 ?auto_774501 ) ) ( not ( = ?auto_774485 ?auto_774502 ) ) ( not ( = ?auto_774486 ?auto_774487 ) ) ( not ( = ?auto_774486 ?auto_774488 ) ) ( not ( = ?auto_774486 ?auto_774489 ) ) ( not ( = ?auto_774486 ?auto_774490 ) ) ( not ( = ?auto_774486 ?auto_774491 ) ) ( not ( = ?auto_774486 ?auto_774492 ) ) ( not ( = ?auto_774486 ?auto_774493 ) ) ( not ( = ?auto_774486 ?auto_774494 ) ) ( not ( = ?auto_774486 ?auto_774495 ) ) ( not ( = ?auto_774486 ?auto_774496 ) ) ( not ( = ?auto_774486 ?auto_774497 ) ) ( not ( = ?auto_774486 ?auto_774498 ) ) ( not ( = ?auto_774486 ?auto_774499 ) ) ( not ( = ?auto_774486 ?auto_774500 ) ) ( not ( = ?auto_774486 ?auto_774501 ) ) ( not ( = ?auto_774486 ?auto_774502 ) ) ( not ( = ?auto_774487 ?auto_774488 ) ) ( not ( = ?auto_774487 ?auto_774489 ) ) ( not ( = ?auto_774487 ?auto_774490 ) ) ( not ( = ?auto_774487 ?auto_774491 ) ) ( not ( = ?auto_774487 ?auto_774492 ) ) ( not ( = ?auto_774487 ?auto_774493 ) ) ( not ( = ?auto_774487 ?auto_774494 ) ) ( not ( = ?auto_774487 ?auto_774495 ) ) ( not ( = ?auto_774487 ?auto_774496 ) ) ( not ( = ?auto_774487 ?auto_774497 ) ) ( not ( = ?auto_774487 ?auto_774498 ) ) ( not ( = ?auto_774487 ?auto_774499 ) ) ( not ( = ?auto_774487 ?auto_774500 ) ) ( not ( = ?auto_774487 ?auto_774501 ) ) ( not ( = ?auto_774487 ?auto_774502 ) ) ( not ( = ?auto_774488 ?auto_774489 ) ) ( not ( = ?auto_774488 ?auto_774490 ) ) ( not ( = ?auto_774488 ?auto_774491 ) ) ( not ( = ?auto_774488 ?auto_774492 ) ) ( not ( = ?auto_774488 ?auto_774493 ) ) ( not ( = ?auto_774488 ?auto_774494 ) ) ( not ( = ?auto_774488 ?auto_774495 ) ) ( not ( = ?auto_774488 ?auto_774496 ) ) ( not ( = ?auto_774488 ?auto_774497 ) ) ( not ( = ?auto_774488 ?auto_774498 ) ) ( not ( = ?auto_774488 ?auto_774499 ) ) ( not ( = ?auto_774488 ?auto_774500 ) ) ( not ( = ?auto_774488 ?auto_774501 ) ) ( not ( = ?auto_774488 ?auto_774502 ) ) ( not ( = ?auto_774489 ?auto_774490 ) ) ( not ( = ?auto_774489 ?auto_774491 ) ) ( not ( = ?auto_774489 ?auto_774492 ) ) ( not ( = ?auto_774489 ?auto_774493 ) ) ( not ( = ?auto_774489 ?auto_774494 ) ) ( not ( = ?auto_774489 ?auto_774495 ) ) ( not ( = ?auto_774489 ?auto_774496 ) ) ( not ( = ?auto_774489 ?auto_774497 ) ) ( not ( = ?auto_774489 ?auto_774498 ) ) ( not ( = ?auto_774489 ?auto_774499 ) ) ( not ( = ?auto_774489 ?auto_774500 ) ) ( not ( = ?auto_774489 ?auto_774501 ) ) ( not ( = ?auto_774489 ?auto_774502 ) ) ( not ( = ?auto_774490 ?auto_774491 ) ) ( not ( = ?auto_774490 ?auto_774492 ) ) ( not ( = ?auto_774490 ?auto_774493 ) ) ( not ( = ?auto_774490 ?auto_774494 ) ) ( not ( = ?auto_774490 ?auto_774495 ) ) ( not ( = ?auto_774490 ?auto_774496 ) ) ( not ( = ?auto_774490 ?auto_774497 ) ) ( not ( = ?auto_774490 ?auto_774498 ) ) ( not ( = ?auto_774490 ?auto_774499 ) ) ( not ( = ?auto_774490 ?auto_774500 ) ) ( not ( = ?auto_774490 ?auto_774501 ) ) ( not ( = ?auto_774490 ?auto_774502 ) ) ( not ( = ?auto_774491 ?auto_774492 ) ) ( not ( = ?auto_774491 ?auto_774493 ) ) ( not ( = ?auto_774491 ?auto_774494 ) ) ( not ( = ?auto_774491 ?auto_774495 ) ) ( not ( = ?auto_774491 ?auto_774496 ) ) ( not ( = ?auto_774491 ?auto_774497 ) ) ( not ( = ?auto_774491 ?auto_774498 ) ) ( not ( = ?auto_774491 ?auto_774499 ) ) ( not ( = ?auto_774491 ?auto_774500 ) ) ( not ( = ?auto_774491 ?auto_774501 ) ) ( not ( = ?auto_774491 ?auto_774502 ) ) ( not ( = ?auto_774492 ?auto_774493 ) ) ( not ( = ?auto_774492 ?auto_774494 ) ) ( not ( = ?auto_774492 ?auto_774495 ) ) ( not ( = ?auto_774492 ?auto_774496 ) ) ( not ( = ?auto_774492 ?auto_774497 ) ) ( not ( = ?auto_774492 ?auto_774498 ) ) ( not ( = ?auto_774492 ?auto_774499 ) ) ( not ( = ?auto_774492 ?auto_774500 ) ) ( not ( = ?auto_774492 ?auto_774501 ) ) ( not ( = ?auto_774492 ?auto_774502 ) ) ( not ( = ?auto_774493 ?auto_774494 ) ) ( not ( = ?auto_774493 ?auto_774495 ) ) ( not ( = ?auto_774493 ?auto_774496 ) ) ( not ( = ?auto_774493 ?auto_774497 ) ) ( not ( = ?auto_774493 ?auto_774498 ) ) ( not ( = ?auto_774493 ?auto_774499 ) ) ( not ( = ?auto_774493 ?auto_774500 ) ) ( not ( = ?auto_774493 ?auto_774501 ) ) ( not ( = ?auto_774493 ?auto_774502 ) ) ( not ( = ?auto_774494 ?auto_774495 ) ) ( not ( = ?auto_774494 ?auto_774496 ) ) ( not ( = ?auto_774494 ?auto_774497 ) ) ( not ( = ?auto_774494 ?auto_774498 ) ) ( not ( = ?auto_774494 ?auto_774499 ) ) ( not ( = ?auto_774494 ?auto_774500 ) ) ( not ( = ?auto_774494 ?auto_774501 ) ) ( not ( = ?auto_774494 ?auto_774502 ) ) ( not ( = ?auto_774495 ?auto_774496 ) ) ( not ( = ?auto_774495 ?auto_774497 ) ) ( not ( = ?auto_774495 ?auto_774498 ) ) ( not ( = ?auto_774495 ?auto_774499 ) ) ( not ( = ?auto_774495 ?auto_774500 ) ) ( not ( = ?auto_774495 ?auto_774501 ) ) ( not ( = ?auto_774495 ?auto_774502 ) ) ( not ( = ?auto_774496 ?auto_774497 ) ) ( not ( = ?auto_774496 ?auto_774498 ) ) ( not ( = ?auto_774496 ?auto_774499 ) ) ( not ( = ?auto_774496 ?auto_774500 ) ) ( not ( = ?auto_774496 ?auto_774501 ) ) ( not ( = ?auto_774496 ?auto_774502 ) ) ( not ( = ?auto_774497 ?auto_774498 ) ) ( not ( = ?auto_774497 ?auto_774499 ) ) ( not ( = ?auto_774497 ?auto_774500 ) ) ( not ( = ?auto_774497 ?auto_774501 ) ) ( not ( = ?auto_774497 ?auto_774502 ) ) ( not ( = ?auto_774498 ?auto_774499 ) ) ( not ( = ?auto_774498 ?auto_774500 ) ) ( not ( = ?auto_774498 ?auto_774501 ) ) ( not ( = ?auto_774498 ?auto_774502 ) ) ( not ( = ?auto_774499 ?auto_774500 ) ) ( not ( = ?auto_774499 ?auto_774501 ) ) ( not ( = ?auto_774499 ?auto_774502 ) ) ( not ( = ?auto_774500 ?auto_774501 ) ) ( not ( = ?auto_774500 ?auto_774502 ) ) ( not ( = ?auto_774501 ?auto_774502 ) ) ( ON ?auto_774500 ?auto_774501 ) ( ON ?auto_774499 ?auto_774500 ) ( ON ?auto_774498 ?auto_774499 ) ( ON ?auto_774497 ?auto_774498 ) ( ON ?auto_774496 ?auto_774497 ) ( ON ?auto_774495 ?auto_774496 ) ( ON ?auto_774494 ?auto_774495 ) ( ON ?auto_774493 ?auto_774494 ) ( ON ?auto_774492 ?auto_774493 ) ( ON ?auto_774491 ?auto_774492 ) ( ON ?auto_774490 ?auto_774491 ) ( ON ?auto_774489 ?auto_774490 ) ( CLEAR ?auto_774487 ) ( ON ?auto_774488 ?auto_774489 ) ( CLEAR ?auto_774488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_774484 ?auto_774485 ?auto_774486 ?auto_774487 ?auto_774488 )
      ( MAKE-18PILE ?auto_774484 ?auto_774485 ?auto_774486 ?auto_774487 ?auto_774488 ?auto_774489 ?auto_774490 ?auto_774491 ?auto_774492 ?auto_774493 ?auto_774494 ?auto_774495 ?auto_774496 ?auto_774497 ?auto_774498 ?auto_774499 ?auto_774500 ?auto_774501 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774521 - BLOCK
      ?auto_774522 - BLOCK
      ?auto_774523 - BLOCK
      ?auto_774524 - BLOCK
      ?auto_774525 - BLOCK
      ?auto_774526 - BLOCK
      ?auto_774527 - BLOCK
      ?auto_774528 - BLOCK
      ?auto_774529 - BLOCK
      ?auto_774530 - BLOCK
      ?auto_774531 - BLOCK
      ?auto_774532 - BLOCK
      ?auto_774533 - BLOCK
      ?auto_774534 - BLOCK
      ?auto_774535 - BLOCK
      ?auto_774536 - BLOCK
      ?auto_774537 - BLOCK
      ?auto_774538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_774538 ) ( ON-TABLE ?auto_774521 ) ( ON ?auto_774522 ?auto_774521 ) ( ON ?auto_774523 ?auto_774522 ) ( ON ?auto_774524 ?auto_774523 ) ( not ( = ?auto_774521 ?auto_774522 ) ) ( not ( = ?auto_774521 ?auto_774523 ) ) ( not ( = ?auto_774521 ?auto_774524 ) ) ( not ( = ?auto_774521 ?auto_774525 ) ) ( not ( = ?auto_774521 ?auto_774526 ) ) ( not ( = ?auto_774521 ?auto_774527 ) ) ( not ( = ?auto_774521 ?auto_774528 ) ) ( not ( = ?auto_774521 ?auto_774529 ) ) ( not ( = ?auto_774521 ?auto_774530 ) ) ( not ( = ?auto_774521 ?auto_774531 ) ) ( not ( = ?auto_774521 ?auto_774532 ) ) ( not ( = ?auto_774521 ?auto_774533 ) ) ( not ( = ?auto_774521 ?auto_774534 ) ) ( not ( = ?auto_774521 ?auto_774535 ) ) ( not ( = ?auto_774521 ?auto_774536 ) ) ( not ( = ?auto_774521 ?auto_774537 ) ) ( not ( = ?auto_774521 ?auto_774538 ) ) ( not ( = ?auto_774522 ?auto_774523 ) ) ( not ( = ?auto_774522 ?auto_774524 ) ) ( not ( = ?auto_774522 ?auto_774525 ) ) ( not ( = ?auto_774522 ?auto_774526 ) ) ( not ( = ?auto_774522 ?auto_774527 ) ) ( not ( = ?auto_774522 ?auto_774528 ) ) ( not ( = ?auto_774522 ?auto_774529 ) ) ( not ( = ?auto_774522 ?auto_774530 ) ) ( not ( = ?auto_774522 ?auto_774531 ) ) ( not ( = ?auto_774522 ?auto_774532 ) ) ( not ( = ?auto_774522 ?auto_774533 ) ) ( not ( = ?auto_774522 ?auto_774534 ) ) ( not ( = ?auto_774522 ?auto_774535 ) ) ( not ( = ?auto_774522 ?auto_774536 ) ) ( not ( = ?auto_774522 ?auto_774537 ) ) ( not ( = ?auto_774522 ?auto_774538 ) ) ( not ( = ?auto_774523 ?auto_774524 ) ) ( not ( = ?auto_774523 ?auto_774525 ) ) ( not ( = ?auto_774523 ?auto_774526 ) ) ( not ( = ?auto_774523 ?auto_774527 ) ) ( not ( = ?auto_774523 ?auto_774528 ) ) ( not ( = ?auto_774523 ?auto_774529 ) ) ( not ( = ?auto_774523 ?auto_774530 ) ) ( not ( = ?auto_774523 ?auto_774531 ) ) ( not ( = ?auto_774523 ?auto_774532 ) ) ( not ( = ?auto_774523 ?auto_774533 ) ) ( not ( = ?auto_774523 ?auto_774534 ) ) ( not ( = ?auto_774523 ?auto_774535 ) ) ( not ( = ?auto_774523 ?auto_774536 ) ) ( not ( = ?auto_774523 ?auto_774537 ) ) ( not ( = ?auto_774523 ?auto_774538 ) ) ( not ( = ?auto_774524 ?auto_774525 ) ) ( not ( = ?auto_774524 ?auto_774526 ) ) ( not ( = ?auto_774524 ?auto_774527 ) ) ( not ( = ?auto_774524 ?auto_774528 ) ) ( not ( = ?auto_774524 ?auto_774529 ) ) ( not ( = ?auto_774524 ?auto_774530 ) ) ( not ( = ?auto_774524 ?auto_774531 ) ) ( not ( = ?auto_774524 ?auto_774532 ) ) ( not ( = ?auto_774524 ?auto_774533 ) ) ( not ( = ?auto_774524 ?auto_774534 ) ) ( not ( = ?auto_774524 ?auto_774535 ) ) ( not ( = ?auto_774524 ?auto_774536 ) ) ( not ( = ?auto_774524 ?auto_774537 ) ) ( not ( = ?auto_774524 ?auto_774538 ) ) ( not ( = ?auto_774525 ?auto_774526 ) ) ( not ( = ?auto_774525 ?auto_774527 ) ) ( not ( = ?auto_774525 ?auto_774528 ) ) ( not ( = ?auto_774525 ?auto_774529 ) ) ( not ( = ?auto_774525 ?auto_774530 ) ) ( not ( = ?auto_774525 ?auto_774531 ) ) ( not ( = ?auto_774525 ?auto_774532 ) ) ( not ( = ?auto_774525 ?auto_774533 ) ) ( not ( = ?auto_774525 ?auto_774534 ) ) ( not ( = ?auto_774525 ?auto_774535 ) ) ( not ( = ?auto_774525 ?auto_774536 ) ) ( not ( = ?auto_774525 ?auto_774537 ) ) ( not ( = ?auto_774525 ?auto_774538 ) ) ( not ( = ?auto_774526 ?auto_774527 ) ) ( not ( = ?auto_774526 ?auto_774528 ) ) ( not ( = ?auto_774526 ?auto_774529 ) ) ( not ( = ?auto_774526 ?auto_774530 ) ) ( not ( = ?auto_774526 ?auto_774531 ) ) ( not ( = ?auto_774526 ?auto_774532 ) ) ( not ( = ?auto_774526 ?auto_774533 ) ) ( not ( = ?auto_774526 ?auto_774534 ) ) ( not ( = ?auto_774526 ?auto_774535 ) ) ( not ( = ?auto_774526 ?auto_774536 ) ) ( not ( = ?auto_774526 ?auto_774537 ) ) ( not ( = ?auto_774526 ?auto_774538 ) ) ( not ( = ?auto_774527 ?auto_774528 ) ) ( not ( = ?auto_774527 ?auto_774529 ) ) ( not ( = ?auto_774527 ?auto_774530 ) ) ( not ( = ?auto_774527 ?auto_774531 ) ) ( not ( = ?auto_774527 ?auto_774532 ) ) ( not ( = ?auto_774527 ?auto_774533 ) ) ( not ( = ?auto_774527 ?auto_774534 ) ) ( not ( = ?auto_774527 ?auto_774535 ) ) ( not ( = ?auto_774527 ?auto_774536 ) ) ( not ( = ?auto_774527 ?auto_774537 ) ) ( not ( = ?auto_774527 ?auto_774538 ) ) ( not ( = ?auto_774528 ?auto_774529 ) ) ( not ( = ?auto_774528 ?auto_774530 ) ) ( not ( = ?auto_774528 ?auto_774531 ) ) ( not ( = ?auto_774528 ?auto_774532 ) ) ( not ( = ?auto_774528 ?auto_774533 ) ) ( not ( = ?auto_774528 ?auto_774534 ) ) ( not ( = ?auto_774528 ?auto_774535 ) ) ( not ( = ?auto_774528 ?auto_774536 ) ) ( not ( = ?auto_774528 ?auto_774537 ) ) ( not ( = ?auto_774528 ?auto_774538 ) ) ( not ( = ?auto_774529 ?auto_774530 ) ) ( not ( = ?auto_774529 ?auto_774531 ) ) ( not ( = ?auto_774529 ?auto_774532 ) ) ( not ( = ?auto_774529 ?auto_774533 ) ) ( not ( = ?auto_774529 ?auto_774534 ) ) ( not ( = ?auto_774529 ?auto_774535 ) ) ( not ( = ?auto_774529 ?auto_774536 ) ) ( not ( = ?auto_774529 ?auto_774537 ) ) ( not ( = ?auto_774529 ?auto_774538 ) ) ( not ( = ?auto_774530 ?auto_774531 ) ) ( not ( = ?auto_774530 ?auto_774532 ) ) ( not ( = ?auto_774530 ?auto_774533 ) ) ( not ( = ?auto_774530 ?auto_774534 ) ) ( not ( = ?auto_774530 ?auto_774535 ) ) ( not ( = ?auto_774530 ?auto_774536 ) ) ( not ( = ?auto_774530 ?auto_774537 ) ) ( not ( = ?auto_774530 ?auto_774538 ) ) ( not ( = ?auto_774531 ?auto_774532 ) ) ( not ( = ?auto_774531 ?auto_774533 ) ) ( not ( = ?auto_774531 ?auto_774534 ) ) ( not ( = ?auto_774531 ?auto_774535 ) ) ( not ( = ?auto_774531 ?auto_774536 ) ) ( not ( = ?auto_774531 ?auto_774537 ) ) ( not ( = ?auto_774531 ?auto_774538 ) ) ( not ( = ?auto_774532 ?auto_774533 ) ) ( not ( = ?auto_774532 ?auto_774534 ) ) ( not ( = ?auto_774532 ?auto_774535 ) ) ( not ( = ?auto_774532 ?auto_774536 ) ) ( not ( = ?auto_774532 ?auto_774537 ) ) ( not ( = ?auto_774532 ?auto_774538 ) ) ( not ( = ?auto_774533 ?auto_774534 ) ) ( not ( = ?auto_774533 ?auto_774535 ) ) ( not ( = ?auto_774533 ?auto_774536 ) ) ( not ( = ?auto_774533 ?auto_774537 ) ) ( not ( = ?auto_774533 ?auto_774538 ) ) ( not ( = ?auto_774534 ?auto_774535 ) ) ( not ( = ?auto_774534 ?auto_774536 ) ) ( not ( = ?auto_774534 ?auto_774537 ) ) ( not ( = ?auto_774534 ?auto_774538 ) ) ( not ( = ?auto_774535 ?auto_774536 ) ) ( not ( = ?auto_774535 ?auto_774537 ) ) ( not ( = ?auto_774535 ?auto_774538 ) ) ( not ( = ?auto_774536 ?auto_774537 ) ) ( not ( = ?auto_774536 ?auto_774538 ) ) ( not ( = ?auto_774537 ?auto_774538 ) ) ( ON ?auto_774537 ?auto_774538 ) ( ON ?auto_774536 ?auto_774537 ) ( ON ?auto_774535 ?auto_774536 ) ( ON ?auto_774534 ?auto_774535 ) ( ON ?auto_774533 ?auto_774534 ) ( ON ?auto_774532 ?auto_774533 ) ( ON ?auto_774531 ?auto_774532 ) ( ON ?auto_774530 ?auto_774531 ) ( ON ?auto_774529 ?auto_774530 ) ( ON ?auto_774528 ?auto_774529 ) ( ON ?auto_774527 ?auto_774528 ) ( ON ?auto_774526 ?auto_774527 ) ( CLEAR ?auto_774524 ) ( ON ?auto_774525 ?auto_774526 ) ( CLEAR ?auto_774525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_774521 ?auto_774522 ?auto_774523 ?auto_774524 ?auto_774525 )
      ( MAKE-18PILE ?auto_774521 ?auto_774522 ?auto_774523 ?auto_774524 ?auto_774525 ?auto_774526 ?auto_774527 ?auto_774528 ?auto_774529 ?auto_774530 ?auto_774531 ?auto_774532 ?auto_774533 ?auto_774534 ?auto_774535 ?auto_774536 ?auto_774537 ?auto_774538 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774557 - BLOCK
      ?auto_774558 - BLOCK
      ?auto_774559 - BLOCK
      ?auto_774560 - BLOCK
      ?auto_774561 - BLOCK
      ?auto_774562 - BLOCK
      ?auto_774563 - BLOCK
      ?auto_774564 - BLOCK
      ?auto_774565 - BLOCK
      ?auto_774566 - BLOCK
      ?auto_774567 - BLOCK
      ?auto_774568 - BLOCK
      ?auto_774569 - BLOCK
      ?auto_774570 - BLOCK
      ?auto_774571 - BLOCK
      ?auto_774572 - BLOCK
      ?auto_774573 - BLOCK
      ?auto_774574 - BLOCK
    )
    :vars
    (
      ?auto_774575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774574 ?auto_774575 ) ( ON-TABLE ?auto_774557 ) ( ON ?auto_774558 ?auto_774557 ) ( ON ?auto_774559 ?auto_774558 ) ( not ( = ?auto_774557 ?auto_774558 ) ) ( not ( = ?auto_774557 ?auto_774559 ) ) ( not ( = ?auto_774557 ?auto_774560 ) ) ( not ( = ?auto_774557 ?auto_774561 ) ) ( not ( = ?auto_774557 ?auto_774562 ) ) ( not ( = ?auto_774557 ?auto_774563 ) ) ( not ( = ?auto_774557 ?auto_774564 ) ) ( not ( = ?auto_774557 ?auto_774565 ) ) ( not ( = ?auto_774557 ?auto_774566 ) ) ( not ( = ?auto_774557 ?auto_774567 ) ) ( not ( = ?auto_774557 ?auto_774568 ) ) ( not ( = ?auto_774557 ?auto_774569 ) ) ( not ( = ?auto_774557 ?auto_774570 ) ) ( not ( = ?auto_774557 ?auto_774571 ) ) ( not ( = ?auto_774557 ?auto_774572 ) ) ( not ( = ?auto_774557 ?auto_774573 ) ) ( not ( = ?auto_774557 ?auto_774574 ) ) ( not ( = ?auto_774557 ?auto_774575 ) ) ( not ( = ?auto_774558 ?auto_774559 ) ) ( not ( = ?auto_774558 ?auto_774560 ) ) ( not ( = ?auto_774558 ?auto_774561 ) ) ( not ( = ?auto_774558 ?auto_774562 ) ) ( not ( = ?auto_774558 ?auto_774563 ) ) ( not ( = ?auto_774558 ?auto_774564 ) ) ( not ( = ?auto_774558 ?auto_774565 ) ) ( not ( = ?auto_774558 ?auto_774566 ) ) ( not ( = ?auto_774558 ?auto_774567 ) ) ( not ( = ?auto_774558 ?auto_774568 ) ) ( not ( = ?auto_774558 ?auto_774569 ) ) ( not ( = ?auto_774558 ?auto_774570 ) ) ( not ( = ?auto_774558 ?auto_774571 ) ) ( not ( = ?auto_774558 ?auto_774572 ) ) ( not ( = ?auto_774558 ?auto_774573 ) ) ( not ( = ?auto_774558 ?auto_774574 ) ) ( not ( = ?auto_774558 ?auto_774575 ) ) ( not ( = ?auto_774559 ?auto_774560 ) ) ( not ( = ?auto_774559 ?auto_774561 ) ) ( not ( = ?auto_774559 ?auto_774562 ) ) ( not ( = ?auto_774559 ?auto_774563 ) ) ( not ( = ?auto_774559 ?auto_774564 ) ) ( not ( = ?auto_774559 ?auto_774565 ) ) ( not ( = ?auto_774559 ?auto_774566 ) ) ( not ( = ?auto_774559 ?auto_774567 ) ) ( not ( = ?auto_774559 ?auto_774568 ) ) ( not ( = ?auto_774559 ?auto_774569 ) ) ( not ( = ?auto_774559 ?auto_774570 ) ) ( not ( = ?auto_774559 ?auto_774571 ) ) ( not ( = ?auto_774559 ?auto_774572 ) ) ( not ( = ?auto_774559 ?auto_774573 ) ) ( not ( = ?auto_774559 ?auto_774574 ) ) ( not ( = ?auto_774559 ?auto_774575 ) ) ( not ( = ?auto_774560 ?auto_774561 ) ) ( not ( = ?auto_774560 ?auto_774562 ) ) ( not ( = ?auto_774560 ?auto_774563 ) ) ( not ( = ?auto_774560 ?auto_774564 ) ) ( not ( = ?auto_774560 ?auto_774565 ) ) ( not ( = ?auto_774560 ?auto_774566 ) ) ( not ( = ?auto_774560 ?auto_774567 ) ) ( not ( = ?auto_774560 ?auto_774568 ) ) ( not ( = ?auto_774560 ?auto_774569 ) ) ( not ( = ?auto_774560 ?auto_774570 ) ) ( not ( = ?auto_774560 ?auto_774571 ) ) ( not ( = ?auto_774560 ?auto_774572 ) ) ( not ( = ?auto_774560 ?auto_774573 ) ) ( not ( = ?auto_774560 ?auto_774574 ) ) ( not ( = ?auto_774560 ?auto_774575 ) ) ( not ( = ?auto_774561 ?auto_774562 ) ) ( not ( = ?auto_774561 ?auto_774563 ) ) ( not ( = ?auto_774561 ?auto_774564 ) ) ( not ( = ?auto_774561 ?auto_774565 ) ) ( not ( = ?auto_774561 ?auto_774566 ) ) ( not ( = ?auto_774561 ?auto_774567 ) ) ( not ( = ?auto_774561 ?auto_774568 ) ) ( not ( = ?auto_774561 ?auto_774569 ) ) ( not ( = ?auto_774561 ?auto_774570 ) ) ( not ( = ?auto_774561 ?auto_774571 ) ) ( not ( = ?auto_774561 ?auto_774572 ) ) ( not ( = ?auto_774561 ?auto_774573 ) ) ( not ( = ?auto_774561 ?auto_774574 ) ) ( not ( = ?auto_774561 ?auto_774575 ) ) ( not ( = ?auto_774562 ?auto_774563 ) ) ( not ( = ?auto_774562 ?auto_774564 ) ) ( not ( = ?auto_774562 ?auto_774565 ) ) ( not ( = ?auto_774562 ?auto_774566 ) ) ( not ( = ?auto_774562 ?auto_774567 ) ) ( not ( = ?auto_774562 ?auto_774568 ) ) ( not ( = ?auto_774562 ?auto_774569 ) ) ( not ( = ?auto_774562 ?auto_774570 ) ) ( not ( = ?auto_774562 ?auto_774571 ) ) ( not ( = ?auto_774562 ?auto_774572 ) ) ( not ( = ?auto_774562 ?auto_774573 ) ) ( not ( = ?auto_774562 ?auto_774574 ) ) ( not ( = ?auto_774562 ?auto_774575 ) ) ( not ( = ?auto_774563 ?auto_774564 ) ) ( not ( = ?auto_774563 ?auto_774565 ) ) ( not ( = ?auto_774563 ?auto_774566 ) ) ( not ( = ?auto_774563 ?auto_774567 ) ) ( not ( = ?auto_774563 ?auto_774568 ) ) ( not ( = ?auto_774563 ?auto_774569 ) ) ( not ( = ?auto_774563 ?auto_774570 ) ) ( not ( = ?auto_774563 ?auto_774571 ) ) ( not ( = ?auto_774563 ?auto_774572 ) ) ( not ( = ?auto_774563 ?auto_774573 ) ) ( not ( = ?auto_774563 ?auto_774574 ) ) ( not ( = ?auto_774563 ?auto_774575 ) ) ( not ( = ?auto_774564 ?auto_774565 ) ) ( not ( = ?auto_774564 ?auto_774566 ) ) ( not ( = ?auto_774564 ?auto_774567 ) ) ( not ( = ?auto_774564 ?auto_774568 ) ) ( not ( = ?auto_774564 ?auto_774569 ) ) ( not ( = ?auto_774564 ?auto_774570 ) ) ( not ( = ?auto_774564 ?auto_774571 ) ) ( not ( = ?auto_774564 ?auto_774572 ) ) ( not ( = ?auto_774564 ?auto_774573 ) ) ( not ( = ?auto_774564 ?auto_774574 ) ) ( not ( = ?auto_774564 ?auto_774575 ) ) ( not ( = ?auto_774565 ?auto_774566 ) ) ( not ( = ?auto_774565 ?auto_774567 ) ) ( not ( = ?auto_774565 ?auto_774568 ) ) ( not ( = ?auto_774565 ?auto_774569 ) ) ( not ( = ?auto_774565 ?auto_774570 ) ) ( not ( = ?auto_774565 ?auto_774571 ) ) ( not ( = ?auto_774565 ?auto_774572 ) ) ( not ( = ?auto_774565 ?auto_774573 ) ) ( not ( = ?auto_774565 ?auto_774574 ) ) ( not ( = ?auto_774565 ?auto_774575 ) ) ( not ( = ?auto_774566 ?auto_774567 ) ) ( not ( = ?auto_774566 ?auto_774568 ) ) ( not ( = ?auto_774566 ?auto_774569 ) ) ( not ( = ?auto_774566 ?auto_774570 ) ) ( not ( = ?auto_774566 ?auto_774571 ) ) ( not ( = ?auto_774566 ?auto_774572 ) ) ( not ( = ?auto_774566 ?auto_774573 ) ) ( not ( = ?auto_774566 ?auto_774574 ) ) ( not ( = ?auto_774566 ?auto_774575 ) ) ( not ( = ?auto_774567 ?auto_774568 ) ) ( not ( = ?auto_774567 ?auto_774569 ) ) ( not ( = ?auto_774567 ?auto_774570 ) ) ( not ( = ?auto_774567 ?auto_774571 ) ) ( not ( = ?auto_774567 ?auto_774572 ) ) ( not ( = ?auto_774567 ?auto_774573 ) ) ( not ( = ?auto_774567 ?auto_774574 ) ) ( not ( = ?auto_774567 ?auto_774575 ) ) ( not ( = ?auto_774568 ?auto_774569 ) ) ( not ( = ?auto_774568 ?auto_774570 ) ) ( not ( = ?auto_774568 ?auto_774571 ) ) ( not ( = ?auto_774568 ?auto_774572 ) ) ( not ( = ?auto_774568 ?auto_774573 ) ) ( not ( = ?auto_774568 ?auto_774574 ) ) ( not ( = ?auto_774568 ?auto_774575 ) ) ( not ( = ?auto_774569 ?auto_774570 ) ) ( not ( = ?auto_774569 ?auto_774571 ) ) ( not ( = ?auto_774569 ?auto_774572 ) ) ( not ( = ?auto_774569 ?auto_774573 ) ) ( not ( = ?auto_774569 ?auto_774574 ) ) ( not ( = ?auto_774569 ?auto_774575 ) ) ( not ( = ?auto_774570 ?auto_774571 ) ) ( not ( = ?auto_774570 ?auto_774572 ) ) ( not ( = ?auto_774570 ?auto_774573 ) ) ( not ( = ?auto_774570 ?auto_774574 ) ) ( not ( = ?auto_774570 ?auto_774575 ) ) ( not ( = ?auto_774571 ?auto_774572 ) ) ( not ( = ?auto_774571 ?auto_774573 ) ) ( not ( = ?auto_774571 ?auto_774574 ) ) ( not ( = ?auto_774571 ?auto_774575 ) ) ( not ( = ?auto_774572 ?auto_774573 ) ) ( not ( = ?auto_774572 ?auto_774574 ) ) ( not ( = ?auto_774572 ?auto_774575 ) ) ( not ( = ?auto_774573 ?auto_774574 ) ) ( not ( = ?auto_774573 ?auto_774575 ) ) ( not ( = ?auto_774574 ?auto_774575 ) ) ( ON ?auto_774573 ?auto_774574 ) ( ON ?auto_774572 ?auto_774573 ) ( ON ?auto_774571 ?auto_774572 ) ( ON ?auto_774570 ?auto_774571 ) ( ON ?auto_774569 ?auto_774570 ) ( ON ?auto_774568 ?auto_774569 ) ( ON ?auto_774567 ?auto_774568 ) ( ON ?auto_774566 ?auto_774567 ) ( ON ?auto_774565 ?auto_774566 ) ( ON ?auto_774564 ?auto_774565 ) ( ON ?auto_774563 ?auto_774564 ) ( ON ?auto_774562 ?auto_774563 ) ( ON ?auto_774561 ?auto_774562 ) ( CLEAR ?auto_774559 ) ( ON ?auto_774560 ?auto_774561 ) ( CLEAR ?auto_774560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_774557 ?auto_774558 ?auto_774559 ?auto_774560 )
      ( MAKE-18PILE ?auto_774557 ?auto_774558 ?auto_774559 ?auto_774560 ?auto_774561 ?auto_774562 ?auto_774563 ?auto_774564 ?auto_774565 ?auto_774566 ?auto_774567 ?auto_774568 ?auto_774569 ?auto_774570 ?auto_774571 ?auto_774572 ?auto_774573 ?auto_774574 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774594 - BLOCK
      ?auto_774595 - BLOCK
      ?auto_774596 - BLOCK
      ?auto_774597 - BLOCK
      ?auto_774598 - BLOCK
      ?auto_774599 - BLOCK
      ?auto_774600 - BLOCK
      ?auto_774601 - BLOCK
      ?auto_774602 - BLOCK
      ?auto_774603 - BLOCK
      ?auto_774604 - BLOCK
      ?auto_774605 - BLOCK
      ?auto_774606 - BLOCK
      ?auto_774607 - BLOCK
      ?auto_774608 - BLOCK
      ?auto_774609 - BLOCK
      ?auto_774610 - BLOCK
      ?auto_774611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_774611 ) ( ON-TABLE ?auto_774594 ) ( ON ?auto_774595 ?auto_774594 ) ( ON ?auto_774596 ?auto_774595 ) ( not ( = ?auto_774594 ?auto_774595 ) ) ( not ( = ?auto_774594 ?auto_774596 ) ) ( not ( = ?auto_774594 ?auto_774597 ) ) ( not ( = ?auto_774594 ?auto_774598 ) ) ( not ( = ?auto_774594 ?auto_774599 ) ) ( not ( = ?auto_774594 ?auto_774600 ) ) ( not ( = ?auto_774594 ?auto_774601 ) ) ( not ( = ?auto_774594 ?auto_774602 ) ) ( not ( = ?auto_774594 ?auto_774603 ) ) ( not ( = ?auto_774594 ?auto_774604 ) ) ( not ( = ?auto_774594 ?auto_774605 ) ) ( not ( = ?auto_774594 ?auto_774606 ) ) ( not ( = ?auto_774594 ?auto_774607 ) ) ( not ( = ?auto_774594 ?auto_774608 ) ) ( not ( = ?auto_774594 ?auto_774609 ) ) ( not ( = ?auto_774594 ?auto_774610 ) ) ( not ( = ?auto_774594 ?auto_774611 ) ) ( not ( = ?auto_774595 ?auto_774596 ) ) ( not ( = ?auto_774595 ?auto_774597 ) ) ( not ( = ?auto_774595 ?auto_774598 ) ) ( not ( = ?auto_774595 ?auto_774599 ) ) ( not ( = ?auto_774595 ?auto_774600 ) ) ( not ( = ?auto_774595 ?auto_774601 ) ) ( not ( = ?auto_774595 ?auto_774602 ) ) ( not ( = ?auto_774595 ?auto_774603 ) ) ( not ( = ?auto_774595 ?auto_774604 ) ) ( not ( = ?auto_774595 ?auto_774605 ) ) ( not ( = ?auto_774595 ?auto_774606 ) ) ( not ( = ?auto_774595 ?auto_774607 ) ) ( not ( = ?auto_774595 ?auto_774608 ) ) ( not ( = ?auto_774595 ?auto_774609 ) ) ( not ( = ?auto_774595 ?auto_774610 ) ) ( not ( = ?auto_774595 ?auto_774611 ) ) ( not ( = ?auto_774596 ?auto_774597 ) ) ( not ( = ?auto_774596 ?auto_774598 ) ) ( not ( = ?auto_774596 ?auto_774599 ) ) ( not ( = ?auto_774596 ?auto_774600 ) ) ( not ( = ?auto_774596 ?auto_774601 ) ) ( not ( = ?auto_774596 ?auto_774602 ) ) ( not ( = ?auto_774596 ?auto_774603 ) ) ( not ( = ?auto_774596 ?auto_774604 ) ) ( not ( = ?auto_774596 ?auto_774605 ) ) ( not ( = ?auto_774596 ?auto_774606 ) ) ( not ( = ?auto_774596 ?auto_774607 ) ) ( not ( = ?auto_774596 ?auto_774608 ) ) ( not ( = ?auto_774596 ?auto_774609 ) ) ( not ( = ?auto_774596 ?auto_774610 ) ) ( not ( = ?auto_774596 ?auto_774611 ) ) ( not ( = ?auto_774597 ?auto_774598 ) ) ( not ( = ?auto_774597 ?auto_774599 ) ) ( not ( = ?auto_774597 ?auto_774600 ) ) ( not ( = ?auto_774597 ?auto_774601 ) ) ( not ( = ?auto_774597 ?auto_774602 ) ) ( not ( = ?auto_774597 ?auto_774603 ) ) ( not ( = ?auto_774597 ?auto_774604 ) ) ( not ( = ?auto_774597 ?auto_774605 ) ) ( not ( = ?auto_774597 ?auto_774606 ) ) ( not ( = ?auto_774597 ?auto_774607 ) ) ( not ( = ?auto_774597 ?auto_774608 ) ) ( not ( = ?auto_774597 ?auto_774609 ) ) ( not ( = ?auto_774597 ?auto_774610 ) ) ( not ( = ?auto_774597 ?auto_774611 ) ) ( not ( = ?auto_774598 ?auto_774599 ) ) ( not ( = ?auto_774598 ?auto_774600 ) ) ( not ( = ?auto_774598 ?auto_774601 ) ) ( not ( = ?auto_774598 ?auto_774602 ) ) ( not ( = ?auto_774598 ?auto_774603 ) ) ( not ( = ?auto_774598 ?auto_774604 ) ) ( not ( = ?auto_774598 ?auto_774605 ) ) ( not ( = ?auto_774598 ?auto_774606 ) ) ( not ( = ?auto_774598 ?auto_774607 ) ) ( not ( = ?auto_774598 ?auto_774608 ) ) ( not ( = ?auto_774598 ?auto_774609 ) ) ( not ( = ?auto_774598 ?auto_774610 ) ) ( not ( = ?auto_774598 ?auto_774611 ) ) ( not ( = ?auto_774599 ?auto_774600 ) ) ( not ( = ?auto_774599 ?auto_774601 ) ) ( not ( = ?auto_774599 ?auto_774602 ) ) ( not ( = ?auto_774599 ?auto_774603 ) ) ( not ( = ?auto_774599 ?auto_774604 ) ) ( not ( = ?auto_774599 ?auto_774605 ) ) ( not ( = ?auto_774599 ?auto_774606 ) ) ( not ( = ?auto_774599 ?auto_774607 ) ) ( not ( = ?auto_774599 ?auto_774608 ) ) ( not ( = ?auto_774599 ?auto_774609 ) ) ( not ( = ?auto_774599 ?auto_774610 ) ) ( not ( = ?auto_774599 ?auto_774611 ) ) ( not ( = ?auto_774600 ?auto_774601 ) ) ( not ( = ?auto_774600 ?auto_774602 ) ) ( not ( = ?auto_774600 ?auto_774603 ) ) ( not ( = ?auto_774600 ?auto_774604 ) ) ( not ( = ?auto_774600 ?auto_774605 ) ) ( not ( = ?auto_774600 ?auto_774606 ) ) ( not ( = ?auto_774600 ?auto_774607 ) ) ( not ( = ?auto_774600 ?auto_774608 ) ) ( not ( = ?auto_774600 ?auto_774609 ) ) ( not ( = ?auto_774600 ?auto_774610 ) ) ( not ( = ?auto_774600 ?auto_774611 ) ) ( not ( = ?auto_774601 ?auto_774602 ) ) ( not ( = ?auto_774601 ?auto_774603 ) ) ( not ( = ?auto_774601 ?auto_774604 ) ) ( not ( = ?auto_774601 ?auto_774605 ) ) ( not ( = ?auto_774601 ?auto_774606 ) ) ( not ( = ?auto_774601 ?auto_774607 ) ) ( not ( = ?auto_774601 ?auto_774608 ) ) ( not ( = ?auto_774601 ?auto_774609 ) ) ( not ( = ?auto_774601 ?auto_774610 ) ) ( not ( = ?auto_774601 ?auto_774611 ) ) ( not ( = ?auto_774602 ?auto_774603 ) ) ( not ( = ?auto_774602 ?auto_774604 ) ) ( not ( = ?auto_774602 ?auto_774605 ) ) ( not ( = ?auto_774602 ?auto_774606 ) ) ( not ( = ?auto_774602 ?auto_774607 ) ) ( not ( = ?auto_774602 ?auto_774608 ) ) ( not ( = ?auto_774602 ?auto_774609 ) ) ( not ( = ?auto_774602 ?auto_774610 ) ) ( not ( = ?auto_774602 ?auto_774611 ) ) ( not ( = ?auto_774603 ?auto_774604 ) ) ( not ( = ?auto_774603 ?auto_774605 ) ) ( not ( = ?auto_774603 ?auto_774606 ) ) ( not ( = ?auto_774603 ?auto_774607 ) ) ( not ( = ?auto_774603 ?auto_774608 ) ) ( not ( = ?auto_774603 ?auto_774609 ) ) ( not ( = ?auto_774603 ?auto_774610 ) ) ( not ( = ?auto_774603 ?auto_774611 ) ) ( not ( = ?auto_774604 ?auto_774605 ) ) ( not ( = ?auto_774604 ?auto_774606 ) ) ( not ( = ?auto_774604 ?auto_774607 ) ) ( not ( = ?auto_774604 ?auto_774608 ) ) ( not ( = ?auto_774604 ?auto_774609 ) ) ( not ( = ?auto_774604 ?auto_774610 ) ) ( not ( = ?auto_774604 ?auto_774611 ) ) ( not ( = ?auto_774605 ?auto_774606 ) ) ( not ( = ?auto_774605 ?auto_774607 ) ) ( not ( = ?auto_774605 ?auto_774608 ) ) ( not ( = ?auto_774605 ?auto_774609 ) ) ( not ( = ?auto_774605 ?auto_774610 ) ) ( not ( = ?auto_774605 ?auto_774611 ) ) ( not ( = ?auto_774606 ?auto_774607 ) ) ( not ( = ?auto_774606 ?auto_774608 ) ) ( not ( = ?auto_774606 ?auto_774609 ) ) ( not ( = ?auto_774606 ?auto_774610 ) ) ( not ( = ?auto_774606 ?auto_774611 ) ) ( not ( = ?auto_774607 ?auto_774608 ) ) ( not ( = ?auto_774607 ?auto_774609 ) ) ( not ( = ?auto_774607 ?auto_774610 ) ) ( not ( = ?auto_774607 ?auto_774611 ) ) ( not ( = ?auto_774608 ?auto_774609 ) ) ( not ( = ?auto_774608 ?auto_774610 ) ) ( not ( = ?auto_774608 ?auto_774611 ) ) ( not ( = ?auto_774609 ?auto_774610 ) ) ( not ( = ?auto_774609 ?auto_774611 ) ) ( not ( = ?auto_774610 ?auto_774611 ) ) ( ON ?auto_774610 ?auto_774611 ) ( ON ?auto_774609 ?auto_774610 ) ( ON ?auto_774608 ?auto_774609 ) ( ON ?auto_774607 ?auto_774608 ) ( ON ?auto_774606 ?auto_774607 ) ( ON ?auto_774605 ?auto_774606 ) ( ON ?auto_774604 ?auto_774605 ) ( ON ?auto_774603 ?auto_774604 ) ( ON ?auto_774602 ?auto_774603 ) ( ON ?auto_774601 ?auto_774602 ) ( ON ?auto_774600 ?auto_774601 ) ( ON ?auto_774599 ?auto_774600 ) ( ON ?auto_774598 ?auto_774599 ) ( CLEAR ?auto_774596 ) ( ON ?auto_774597 ?auto_774598 ) ( CLEAR ?auto_774597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_774594 ?auto_774595 ?auto_774596 ?auto_774597 )
      ( MAKE-18PILE ?auto_774594 ?auto_774595 ?auto_774596 ?auto_774597 ?auto_774598 ?auto_774599 ?auto_774600 ?auto_774601 ?auto_774602 ?auto_774603 ?auto_774604 ?auto_774605 ?auto_774606 ?auto_774607 ?auto_774608 ?auto_774609 ?auto_774610 ?auto_774611 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774630 - BLOCK
      ?auto_774631 - BLOCK
      ?auto_774632 - BLOCK
      ?auto_774633 - BLOCK
      ?auto_774634 - BLOCK
      ?auto_774635 - BLOCK
      ?auto_774636 - BLOCK
      ?auto_774637 - BLOCK
      ?auto_774638 - BLOCK
      ?auto_774639 - BLOCK
      ?auto_774640 - BLOCK
      ?auto_774641 - BLOCK
      ?auto_774642 - BLOCK
      ?auto_774643 - BLOCK
      ?auto_774644 - BLOCK
      ?auto_774645 - BLOCK
      ?auto_774646 - BLOCK
      ?auto_774647 - BLOCK
    )
    :vars
    (
      ?auto_774648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774647 ?auto_774648 ) ( ON-TABLE ?auto_774630 ) ( ON ?auto_774631 ?auto_774630 ) ( not ( = ?auto_774630 ?auto_774631 ) ) ( not ( = ?auto_774630 ?auto_774632 ) ) ( not ( = ?auto_774630 ?auto_774633 ) ) ( not ( = ?auto_774630 ?auto_774634 ) ) ( not ( = ?auto_774630 ?auto_774635 ) ) ( not ( = ?auto_774630 ?auto_774636 ) ) ( not ( = ?auto_774630 ?auto_774637 ) ) ( not ( = ?auto_774630 ?auto_774638 ) ) ( not ( = ?auto_774630 ?auto_774639 ) ) ( not ( = ?auto_774630 ?auto_774640 ) ) ( not ( = ?auto_774630 ?auto_774641 ) ) ( not ( = ?auto_774630 ?auto_774642 ) ) ( not ( = ?auto_774630 ?auto_774643 ) ) ( not ( = ?auto_774630 ?auto_774644 ) ) ( not ( = ?auto_774630 ?auto_774645 ) ) ( not ( = ?auto_774630 ?auto_774646 ) ) ( not ( = ?auto_774630 ?auto_774647 ) ) ( not ( = ?auto_774630 ?auto_774648 ) ) ( not ( = ?auto_774631 ?auto_774632 ) ) ( not ( = ?auto_774631 ?auto_774633 ) ) ( not ( = ?auto_774631 ?auto_774634 ) ) ( not ( = ?auto_774631 ?auto_774635 ) ) ( not ( = ?auto_774631 ?auto_774636 ) ) ( not ( = ?auto_774631 ?auto_774637 ) ) ( not ( = ?auto_774631 ?auto_774638 ) ) ( not ( = ?auto_774631 ?auto_774639 ) ) ( not ( = ?auto_774631 ?auto_774640 ) ) ( not ( = ?auto_774631 ?auto_774641 ) ) ( not ( = ?auto_774631 ?auto_774642 ) ) ( not ( = ?auto_774631 ?auto_774643 ) ) ( not ( = ?auto_774631 ?auto_774644 ) ) ( not ( = ?auto_774631 ?auto_774645 ) ) ( not ( = ?auto_774631 ?auto_774646 ) ) ( not ( = ?auto_774631 ?auto_774647 ) ) ( not ( = ?auto_774631 ?auto_774648 ) ) ( not ( = ?auto_774632 ?auto_774633 ) ) ( not ( = ?auto_774632 ?auto_774634 ) ) ( not ( = ?auto_774632 ?auto_774635 ) ) ( not ( = ?auto_774632 ?auto_774636 ) ) ( not ( = ?auto_774632 ?auto_774637 ) ) ( not ( = ?auto_774632 ?auto_774638 ) ) ( not ( = ?auto_774632 ?auto_774639 ) ) ( not ( = ?auto_774632 ?auto_774640 ) ) ( not ( = ?auto_774632 ?auto_774641 ) ) ( not ( = ?auto_774632 ?auto_774642 ) ) ( not ( = ?auto_774632 ?auto_774643 ) ) ( not ( = ?auto_774632 ?auto_774644 ) ) ( not ( = ?auto_774632 ?auto_774645 ) ) ( not ( = ?auto_774632 ?auto_774646 ) ) ( not ( = ?auto_774632 ?auto_774647 ) ) ( not ( = ?auto_774632 ?auto_774648 ) ) ( not ( = ?auto_774633 ?auto_774634 ) ) ( not ( = ?auto_774633 ?auto_774635 ) ) ( not ( = ?auto_774633 ?auto_774636 ) ) ( not ( = ?auto_774633 ?auto_774637 ) ) ( not ( = ?auto_774633 ?auto_774638 ) ) ( not ( = ?auto_774633 ?auto_774639 ) ) ( not ( = ?auto_774633 ?auto_774640 ) ) ( not ( = ?auto_774633 ?auto_774641 ) ) ( not ( = ?auto_774633 ?auto_774642 ) ) ( not ( = ?auto_774633 ?auto_774643 ) ) ( not ( = ?auto_774633 ?auto_774644 ) ) ( not ( = ?auto_774633 ?auto_774645 ) ) ( not ( = ?auto_774633 ?auto_774646 ) ) ( not ( = ?auto_774633 ?auto_774647 ) ) ( not ( = ?auto_774633 ?auto_774648 ) ) ( not ( = ?auto_774634 ?auto_774635 ) ) ( not ( = ?auto_774634 ?auto_774636 ) ) ( not ( = ?auto_774634 ?auto_774637 ) ) ( not ( = ?auto_774634 ?auto_774638 ) ) ( not ( = ?auto_774634 ?auto_774639 ) ) ( not ( = ?auto_774634 ?auto_774640 ) ) ( not ( = ?auto_774634 ?auto_774641 ) ) ( not ( = ?auto_774634 ?auto_774642 ) ) ( not ( = ?auto_774634 ?auto_774643 ) ) ( not ( = ?auto_774634 ?auto_774644 ) ) ( not ( = ?auto_774634 ?auto_774645 ) ) ( not ( = ?auto_774634 ?auto_774646 ) ) ( not ( = ?auto_774634 ?auto_774647 ) ) ( not ( = ?auto_774634 ?auto_774648 ) ) ( not ( = ?auto_774635 ?auto_774636 ) ) ( not ( = ?auto_774635 ?auto_774637 ) ) ( not ( = ?auto_774635 ?auto_774638 ) ) ( not ( = ?auto_774635 ?auto_774639 ) ) ( not ( = ?auto_774635 ?auto_774640 ) ) ( not ( = ?auto_774635 ?auto_774641 ) ) ( not ( = ?auto_774635 ?auto_774642 ) ) ( not ( = ?auto_774635 ?auto_774643 ) ) ( not ( = ?auto_774635 ?auto_774644 ) ) ( not ( = ?auto_774635 ?auto_774645 ) ) ( not ( = ?auto_774635 ?auto_774646 ) ) ( not ( = ?auto_774635 ?auto_774647 ) ) ( not ( = ?auto_774635 ?auto_774648 ) ) ( not ( = ?auto_774636 ?auto_774637 ) ) ( not ( = ?auto_774636 ?auto_774638 ) ) ( not ( = ?auto_774636 ?auto_774639 ) ) ( not ( = ?auto_774636 ?auto_774640 ) ) ( not ( = ?auto_774636 ?auto_774641 ) ) ( not ( = ?auto_774636 ?auto_774642 ) ) ( not ( = ?auto_774636 ?auto_774643 ) ) ( not ( = ?auto_774636 ?auto_774644 ) ) ( not ( = ?auto_774636 ?auto_774645 ) ) ( not ( = ?auto_774636 ?auto_774646 ) ) ( not ( = ?auto_774636 ?auto_774647 ) ) ( not ( = ?auto_774636 ?auto_774648 ) ) ( not ( = ?auto_774637 ?auto_774638 ) ) ( not ( = ?auto_774637 ?auto_774639 ) ) ( not ( = ?auto_774637 ?auto_774640 ) ) ( not ( = ?auto_774637 ?auto_774641 ) ) ( not ( = ?auto_774637 ?auto_774642 ) ) ( not ( = ?auto_774637 ?auto_774643 ) ) ( not ( = ?auto_774637 ?auto_774644 ) ) ( not ( = ?auto_774637 ?auto_774645 ) ) ( not ( = ?auto_774637 ?auto_774646 ) ) ( not ( = ?auto_774637 ?auto_774647 ) ) ( not ( = ?auto_774637 ?auto_774648 ) ) ( not ( = ?auto_774638 ?auto_774639 ) ) ( not ( = ?auto_774638 ?auto_774640 ) ) ( not ( = ?auto_774638 ?auto_774641 ) ) ( not ( = ?auto_774638 ?auto_774642 ) ) ( not ( = ?auto_774638 ?auto_774643 ) ) ( not ( = ?auto_774638 ?auto_774644 ) ) ( not ( = ?auto_774638 ?auto_774645 ) ) ( not ( = ?auto_774638 ?auto_774646 ) ) ( not ( = ?auto_774638 ?auto_774647 ) ) ( not ( = ?auto_774638 ?auto_774648 ) ) ( not ( = ?auto_774639 ?auto_774640 ) ) ( not ( = ?auto_774639 ?auto_774641 ) ) ( not ( = ?auto_774639 ?auto_774642 ) ) ( not ( = ?auto_774639 ?auto_774643 ) ) ( not ( = ?auto_774639 ?auto_774644 ) ) ( not ( = ?auto_774639 ?auto_774645 ) ) ( not ( = ?auto_774639 ?auto_774646 ) ) ( not ( = ?auto_774639 ?auto_774647 ) ) ( not ( = ?auto_774639 ?auto_774648 ) ) ( not ( = ?auto_774640 ?auto_774641 ) ) ( not ( = ?auto_774640 ?auto_774642 ) ) ( not ( = ?auto_774640 ?auto_774643 ) ) ( not ( = ?auto_774640 ?auto_774644 ) ) ( not ( = ?auto_774640 ?auto_774645 ) ) ( not ( = ?auto_774640 ?auto_774646 ) ) ( not ( = ?auto_774640 ?auto_774647 ) ) ( not ( = ?auto_774640 ?auto_774648 ) ) ( not ( = ?auto_774641 ?auto_774642 ) ) ( not ( = ?auto_774641 ?auto_774643 ) ) ( not ( = ?auto_774641 ?auto_774644 ) ) ( not ( = ?auto_774641 ?auto_774645 ) ) ( not ( = ?auto_774641 ?auto_774646 ) ) ( not ( = ?auto_774641 ?auto_774647 ) ) ( not ( = ?auto_774641 ?auto_774648 ) ) ( not ( = ?auto_774642 ?auto_774643 ) ) ( not ( = ?auto_774642 ?auto_774644 ) ) ( not ( = ?auto_774642 ?auto_774645 ) ) ( not ( = ?auto_774642 ?auto_774646 ) ) ( not ( = ?auto_774642 ?auto_774647 ) ) ( not ( = ?auto_774642 ?auto_774648 ) ) ( not ( = ?auto_774643 ?auto_774644 ) ) ( not ( = ?auto_774643 ?auto_774645 ) ) ( not ( = ?auto_774643 ?auto_774646 ) ) ( not ( = ?auto_774643 ?auto_774647 ) ) ( not ( = ?auto_774643 ?auto_774648 ) ) ( not ( = ?auto_774644 ?auto_774645 ) ) ( not ( = ?auto_774644 ?auto_774646 ) ) ( not ( = ?auto_774644 ?auto_774647 ) ) ( not ( = ?auto_774644 ?auto_774648 ) ) ( not ( = ?auto_774645 ?auto_774646 ) ) ( not ( = ?auto_774645 ?auto_774647 ) ) ( not ( = ?auto_774645 ?auto_774648 ) ) ( not ( = ?auto_774646 ?auto_774647 ) ) ( not ( = ?auto_774646 ?auto_774648 ) ) ( not ( = ?auto_774647 ?auto_774648 ) ) ( ON ?auto_774646 ?auto_774647 ) ( ON ?auto_774645 ?auto_774646 ) ( ON ?auto_774644 ?auto_774645 ) ( ON ?auto_774643 ?auto_774644 ) ( ON ?auto_774642 ?auto_774643 ) ( ON ?auto_774641 ?auto_774642 ) ( ON ?auto_774640 ?auto_774641 ) ( ON ?auto_774639 ?auto_774640 ) ( ON ?auto_774638 ?auto_774639 ) ( ON ?auto_774637 ?auto_774638 ) ( ON ?auto_774636 ?auto_774637 ) ( ON ?auto_774635 ?auto_774636 ) ( ON ?auto_774634 ?auto_774635 ) ( ON ?auto_774633 ?auto_774634 ) ( CLEAR ?auto_774631 ) ( ON ?auto_774632 ?auto_774633 ) ( CLEAR ?auto_774632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_774630 ?auto_774631 ?auto_774632 )
      ( MAKE-18PILE ?auto_774630 ?auto_774631 ?auto_774632 ?auto_774633 ?auto_774634 ?auto_774635 ?auto_774636 ?auto_774637 ?auto_774638 ?auto_774639 ?auto_774640 ?auto_774641 ?auto_774642 ?auto_774643 ?auto_774644 ?auto_774645 ?auto_774646 ?auto_774647 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774667 - BLOCK
      ?auto_774668 - BLOCK
      ?auto_774669 - BLOCK
      ?auto_774670 - BLOCK
      ?auto_774671 - BLOCK
      ?auto_774672 - BLOCK
      ?auto_774673 - BLOCK
      ?auto_774674 - BLOCK
      ?auto_774675 - BLOCK
      ?auto_774676 - BLOCK
      ?auto_774677 - BLOCK
      ?auto_774678 - BLOCK
      ?auto_774679 - BLOCK
      ?auto_774680 - BLOCK
      ?auto_774681 - BLOCK
      ?auto_774682 - BLOCK
      ?auto_774683 - BLOCK
      ?auto_774684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_774684 ) ( ON-TABLE ?auto_774667 ) ( ON ?auto_774668 ?auto_774667 ) ( not ( = ?auto_774667 ?auto_774668 ) ) ( not ( = ?auto_774667 ?auto_774669 ) ) ( not ( = ?auto_774667 ?auto_774670 ) ) ( not ( = ?auto_774667 ?auto_774671 ) ) ( not ( = ?auto_774667 ?auto_774672 ) ) ( not ( = ?auto_774667 ?auto_774673 ) ) ( not ( = ?auto_774667 ?auto_774674 ) ) ( not ( = ?auto_774667 ?auto_774675 ) ) ( not ( = ?auto_774667 ?auto_774676 ) ) ( not ( = ?auto_774667 ?auto_774677 ) ) ( not ( = ?auto_774667 ?auto_774678 ) ) ( not ( = ?auto_774667 ?auto_774679 ) ) ( not ( = ?auto_774667 ?auto_774680 ) ) ( not ( = ?auto_774667 ?auto_774681 ) ) ( not ( = ?auto_774667 ?auto_774682 ) ) ( not ( = ?auto_774667 ?auto_774683 ) ) ( not ( = ?auto_774667 ?auto_774684 ) ) ( not ( = ?auto_774668 ?auto_774669 ) ) ( not ( = ?auto_774668 ?auto_774670 ) ) ( not ( = ?auto_774668 ?auto_774671 ) ) ( not ( = ?auto_774668 ?auto_774672 ) ) ( not ( = ?auto_774668 ?auto_774673 ) ) ( not ( = ?auto_774668 ?auto_774674 ) ) ( not ( = ?auto_774668 ?auto_774675 ) ) ( not ( = ?auto_774668 ?auto_774676 ) ) ( not ( = ?auto_774668 ?auto_774677 ) ) ( not ( = ?auto_774668 ?auto_774678 ) ) ( not ( = ?auto_774668 ?auto_774679 ) ) ( not ( = ?auto_774668 ?auto_774680 ) ) ( not ( = ?auto_774668 ?auto_774681 ) ) ( not ( = ?auto_774668 ?auto_774682 ) ) ( not ( = ?auto_774668 ?auto_774683 ) ) ( not ( = ?auto_774668 ?auto_774684 ) ) ( not ( = ?auto_774669 ?auto_774670 ) ) ( not ( = ?auto_774669 ?auto_774671 ) ) ( not ( = ?auto_774669 ?auto_774672 ) ) ( not ( = ?auto_774669 ?auto_774673 ) ) ( not ( = ?auto_774669 ?auto_774674 ) ) ( not ( = ?auto_774669 ?auto_774675 ) ) ( not ( = ?auto_774669 ?auto_774676 ) ) ( not ( = ?auto_774669 ?auto_774677 ) ) ( not ( = ?auto_774669 ?auto_774678 ) ) ( not ( = ?auto_774669 ?auto_774679 ) ) ( not ( = ?auto_774669 ?auto_774680 ) ) ( not ( = ?auto_774669 ?auto_774681 ) ) ( not ( = ?auto_774669 ?auto_774682 ) ) ( not ( = ?auto_774669 ?auto_774683 ) ) ( not ( = ?auto_774669 ?auto_774684 ) ) ( not ( = ?auto_774670 ?auto_774671 ) ) ( not ( = ?auto_774670 ?auto_774672 ) ) ( not ( = ?auto_774670 ?auto_774673 ) ) ( not ( = ?auto_774670 ?auto_774674 ) ) ( not ( = ?auto_774670 ?auto_774675 ) ) ( not ( = ?auto_774670 ?auto_774676 ) ) ( not ( = ?auto_774670 ?auto_774677 ) ) ( not ( = ?auto_774670 ?auto_774678 ) ) ( not ( = ?auto_774670 ?auto_774679 ) ) ( not ( = ?auto_774670 ?auto_774680 ) ) ( not ( = ?auto_774670 ?auto_774681 ) ) ( not ( = ?auto_774670 ?auto_774682 ) ) ( not ( = ?auto_774670 ?auto_774683 ) ) ( not ( = ?auto_774670 ?auto_774684 ) ) ( not ( = ?auto_774671 ?auto_774672 ) ) ( not ( = ?auto_774671 ?auto_774673 ) ) ( not ( = ?auto_774671 ?auto_774674 ) ) ( not ( = ?auto_774671 ?auto_774675 ) ) ( not ( = ?auto_774671 ?auto_774676 ) ) ( not ( = ?auto_774671 ?auto_774677 ) ) ( not ( = ?auto_774671 ?auto_774678 ) ) ( not ( = ?auto_774671 ?auto_774679 ) ) ( not ( = ?auto_774671 ?auto_774680 ) ) ( not ( = ?auto_774671 ?auto_774681 ) ) ( not ( = ?auto_774671 ?auto_774682 ) ) ( not ( = ?auto_774671 ?auto_774683 ) ) ( not ( = ?auto_774671 ?auto_774684 ) ) ( not ( = ?auto_774672 ?auto_774673 ) ) ( not ( = ?auto_774672 ?auto_774674 ) ) ( not ( = ?auto_774672 ?auto_774675 ) ) ( not ( = ?auto_774672 ?auto_774676 ) ) ( not ( = ?auto_774672 ?auto_774677 ) ) ( not ( = ?auto_774672 ?auto_774678 ) ) ( not ( = ?auto_774672 ?auto_774679 ) ) ( not ( = ?auto_774672 ?auto_774680 ) ) ( not ( = ?auto_774672 ?auto_774681 ) ) ( not ( = ?auto_774672 ?auto_774682 ) ) ( not ( = ?auto_774672 ?auto_774683 ) ) ( not ( = ?auto_774672 ?auto_774684 ) ) ( not ( = ?auto_774673 ?auto_774674 ) ) ( not ( = ?auto_774673 ?auto_774675 ) ) ( not ( = ?auto_774673 ?auto_774676 ) ) ( not ( = ?auto_774673 ?auto_774677 ) ) ( not ( = ?auto_774673 ?auto_774678 ) ) ( not ( = ?auto_774673 ?auto_774679 ) ) ( not ( = ?auto_774673 ?auto_774680 ) ) ( not ( = ?auto_774673 ?auto_774681 ) ) ( not ( = ?auto_774673 ?auto_774682 ) ) ( not ( = ?auto_774673 ?auto_774683 ) ) ( not ( = ?auto_774673 ?auto_774684 ) ) ( not ( = ?auto_774674 ?auto_774675 ) ) ( not ( = ?auto_774674 ?auto_774676 ) ) ( not ( = ?auto_774674 ?auto_774677 ) ) ( not ( = ?auto_774674 ?auto_774678 ) ) ( not ( = ?auto_774674 ?auto_774679 ) ) ( not ( = ?auto_774674 ?auto_774680 ) ) ( not ( = ?auto_774674 ?auto_774681 ) ) ( not ( = ?auto_774674 ?auto_774682 ) ) ( not ( = ?auto_774674 ?auto_774683 ) ) ( not ( = ?auto_774674 ?auto_774684 ) ) ( not ( = ?auto_774675 ?auto_774676 ) ) ( not ( = ?auto_774675 ?auto_774677 ) ) ( not ( = ?auto_774675 ?auto_774678 ) ) ( not ( = ?auto_774675 ?auto_774679 ) ) ( not ( = ?auto_774675 ?auto_774680 ) ) ( not ( = ?auto_774675 ?auto_774681 ) ) ( not ( = ?auto_774675 ?auto_774682 ) ) ( not ( = ?auto_774675 ?auto_774683 ) ) ( not ( = ?auto_774675 ?auto_774684 ) ) ( not ( = ?auto_774676 ?auto_774677 ) ) ( not ( = ?auto_774676 ?auto_774678 ) ) ( not ( = ?auto_774676 ?auto_774679 ) ) ( not ( = ?auto_774676 ?auto_774680 ) ) ( not ( = ?auto_774676 ?auto_774681 ) ) ( not ( = ?auto_774676 ?auto_774682 ) ) ( not ( = ?auto_774676 ?auto_774683 ) ) ( not ( = ?auto_774676 ?auto_774684 ) ) ( not ( = ?auto_774677 ?auto_774678 ) ) ( not ( = ?auto_774677 ?auto_774679 ) ) ( not ( = ?auto_774677 ?auto_774680 ) ) ( not ( = ?auto_774677 ?auto_774681 ) ) ( not ( = ?auto_774677 ?auto_774682 ) ) ( not ( = ?auto_774677 ?auto_774683 ) ) ( not ( = ?auto_774677 ?auto_774684 ) ) ( not ( = ?auto_774678 ?auto_774679 ) ) ( not ( = ?auto_774678 ?auto_774680 ) ) ( not ( = ?auto_774678 ?auto_774681 ) ) ( not ( = ?auto_774678 ?auto_774682 ) ) ( not ( = ?auto_774678 ?auto_774683 ) ) ( not ( = ?auto_774678 ?auto_774684 ) ) ( not ( = ?auto_774679 ?auto_774680 ) ) ( not ( = ?auto_774679 ?auto_774681 ) ) ( not ( = ?auto_774679 ?auto_774682 ) ) ( not ( = ?auto_774679 ?auto_774683 ) ) ( not ( = ?auto_774679 ?auto_774684 ) ) ( not ( = ?auto_774680 ?auto_774681 ) ) ( not ( = ?auto_774680 ?auto_774682 ) ) ( not ( = ?auto_774680 ?auto_774683 ) ) ( not ( = ?auto_774680 ?auto_774684 ) ) ( not ( = ?auto_774681 ?auto_774682 ) ) ( not ( = ?auto_774681 ?auto_774683 ) ) ( not ( = ?auto_774681 ?auto_774684 ) ) ( not ( = ?auto_774682 ?auto_774683 ) ) ( not ( = ?auto_774682 ?auto_774684 ) ) ( not ( = ?auto_774683 ?auto_774684 ) ) ( ON ?auto_774683 ?auto_774684 ) ( ON ?auto_774682 ?auto_774683 ) ( ON ?auto_774681 ?auto_774682 ) ( ON ?auto_774680 ?auto_774681 ) ( ON ?auto_774679 ?auto_774680 ) ( ON ?auto_774678 ?auto_774679 ) ( ON ?auto_774677 ?auto_774678 ) ( ON ?auto_774676 ?auto_774677 ) ( ON ?auto_774675 ?auto_774676 ) ( ON ?auto_774674 ?auto_774675 ) ( ON ?auto_774673 ?auto_774674 ) ( ON ?auto_774672 ?auto_774673 ) ( ON ?auto_774671 ?auto_774672 ) ( ON ?auto_774670 ?auto_774671 ) ( CLEAR ?auto_774668 ) ( ON ?auto_774669 ?auto_774670 ) ( CLEAR ?auto_774669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_774667 ?auto_774668 ?auto_774669 )
      ( MAKE-18PILE ?auto_774667 ?auto_774668 ?auto_774669 ?auto_774670 ?auto_774671 ?auto_774672 ?auto_774673 ?auto_774674 ?auto_774675 ?auto_774676 ?auto_774677 ?auto_774678 ?auto_774679 ?auto_774680 ?auto_774681 ?auto_774682 ?auto_774683 ?auto_774684 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774703 - BLOCK
      ?auto_774704 - BLOCK
      ?auto_774705 - BLOCK
      ?auto_774706 - BLOCK
      ?auto_774707 - BLOCK
      ?auto_774708 - BLOCK
      ?auto_774709 - BLOCK
      ?auto_774710 - BLOCK
      ?auto_774711 - BLOCK
      ?auto_774712 - BLOCK
      ?auto_774713 - BLOCK
      ?auto_774714 - BLOCK
      ?auto_774715 - BLOCK
      ?auto_774716 - BLOCK
      ?auto_774717 - BLOCK
      ?auto_774718 - BLOCK
      ?auto_774719 - BLOCK
      ?auto_774720 - BLOCK
    )
    :vars
    (
      ?auto_774721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774720 ?auto_774721 ) ( ON-TABLE ?auto_774703 ) ( not ( = ?auto_774703 ?auto_774704 ) ) ( not ( = ?auto_774703 ?auto_774705 ) ) ( not ( = ?auto_774703 ?auto_774706 ) ) ( not ( = ?auto_774703 ?auto_774707 ) ) ( not ( = ?auto_774703 ?auto_774708 ) ) ( not ( = ?auto_774703 ?auto_774709 ) ) ( not ( = ?auto_774703 ?auto_774710 ) ) ( not ( = ?auto_774703 ?auto_774711 ) ) ( not ( = ?auto_774703 ?auto_774712 ) ) ( not ( = ?auto_774703 ?auto_774713 ) ) ( not ( = ?auto_774703 ?auto_774714 ) ) ( not ( = ?auto_774703 ?auto_774715 ) ) ( not ( = ?auto_774703 ?auto_774716 ) ) ( not ( = ?auto_774703 ?auto_774717 ) ) ( not ( = ?auto_774703 ?auto_774718 ) ) ( not ( = ?auto_774703 ?auto_774719 ) ) ( not ( = ?auto_774703 ?auto_774720 ) ) ( not ( = ?auto_774703 ?auto_774721 ) ) ( not ( = ?auto_774704 ?auto_774705 ) ) ( not ( = ?auto_774704 ?auto_774706 ) ) ( not ( = ?auto_774704 ?auto_774707 ) ) ( not ( = ?auto_774704 ?auto_774708 ) ) ( not ( = ?auto_774704 ?auto_774709 ) ) ( not ( = ?auto_774704 ?auto_774710 ) ) ( not ( = ?auto_774704 ?auto_774711 ) ) ( not ( = ?auto_774704 ?auto_774712 ) ) ( not ( = ?auto_774704 ?auto_774713 ) ) ( not ( = ?auto_774704 ?auto_774714 ) ) ( not ( = ?auto_774704 ?auto_774715 ) ) ( not ( = ?auto_774704 ?auto_774716 ) ) ( not ( = ?auto_774704 ?auto_774717 ) ) ( not ( = ?auto_774704 ?auto_774718 ) ) ( not ( = ?auto_774704 ?auto_774719 ) ) ( not ( = ?auto_774704 ?auto_774720 ) ) ( not ( = ?auto_774704 ?auto_774721 ) ) ( not ( = ?auto_774705 ?auto_774706 ) ) ( not ( = ?auto_774705 ?auto_774707 ) ) ( not ( = ?auto_774705 ?auto_774708 ) ) ( not ( = ?auto_774705 ?auto_774709 ) ) ( not ( = ?auto_774705 ?auto_774710 ) ) ( not ( = ?auto_774705 ?auto_774711 ) ) ( not ( = ?auto_774705 ?auto_774712 ) ) ( not ( = ?auto_774705 ?auto_774713 ) ) ( not ( = ?auto_774705 ?auto_774714 ) ) ( not ( = ?auto_774705 ?auto_774715 ) ) ( not ( = ?auto_774705 ?auto_774716 ) ) ( not ( = ?auto_774705 ?auto_774717 ) ) ( not ( = ?auto_774705 ?auto_774718 ) ) ( not ( = ?auto_774705 ?auto_774719 ) ) ( not ( = ?auto_774705 ?auto_774720 ) ) ( not ( = ?auto_774705 ?auto_774721 ) ) ( not ( = ?auto_774706 ?auto_774707 ) ) ( not ( = ?auto_774706 ?auto_774708 ) ) ( not ( = ?auto_774706 ?auto_774709 ) ) ( not ( = ?auto_774706 ?auto_774710 ) ) ( not ( = ?auto_774706 ?auto_774711 ) ) ( not ( = ?auto_774706 ?auto_774712 ) ) ( not ( = ?auto_774706 ?auto_774713 ) ) ( not ( = ?auto_774706 ?auto_774714 ) ) ( not ( = ?auto_774706 ?auto_774715 ) ) ( not ( = ?auto_774706 ?auto_774716 ) ) ( not ( = ?auto_774706 ?auto_774717 ) ) ( not ( = ?auto_774706 ?auto_774718 ) ) ( not ( = ?auto_774706 ?auto_774719 ) ) ( not ( = ?auto_774706 ?auto_774720 ) ) ( not ( = ?auto_774706 ?auto_774721 ) ) ( not ( = ?auto_774707 ?auto_774708 ) ) ( not ( = ?auto_774707 ?auto_774709 ) ) ( not ( = ?auto_774707 ?auto_774710 ) ) ( not ( = ?auto_774707 ?auto_774711 ) ) ( not ( = ?auto_774707 ?auto_774712 ) ) ( not ( = ?auto_774707 ?auto_774713 ) ) ( not ( = ?auto_774707 ?auto_774714 ) ) ( not ( = ?auto_774707 ?auto_774715 ) ) ( not ( = ?auto_774707 ?auto_774716 ) ) ( not ( = ?auto_774707 ?auto_774717 ) ) ( not ( = ?auto_774707 ?auto_774718 ) ) ( not ( = ?auto_774707 ?auto_774719 ) ) ( not ( = ?auto_774707 ?auto_774720 ) ) ( not ( = ?auto_774707 ?auto_774721 ) ) ( not ( = ?auto_774708 ?auto_774709 ) ) ( not ( = ?auto_774708 ?auto_774710 ) ) ( not ( = ?auto_774708 ?auto_774711 ) ) ( not ( = ?auto_774708 ?auto_774712 ) ) ( not ( = ?auto_774708 ?auto_774713 ) ) ( not ( = ?auto_774708 ?auto_774714 ) ) ( not ( = ?auto_774708 ?auto_774715 ) ) ( not ( = ?auto_774708 ?auto_774716 ) ) ( not ( = ?auto_774708 ?auto_774717 ) ) ( not ( = ?auto_774708 ?auto_774718 ) ) ( not ( = ?auto_774708 ?auto_774719 ) ) ( not ( = ?auto_774708 ?auto_774720 ) ) ( not ( = ?auto_774708 ?auto_774721 ) ) ( not ( = ?auto_774709 ?auto_774710 ) ) ( not ( = ?auto_774709 ?auto_774711 ) ) ( not ( = ?auto_774709 ?auto_774712 ) ) ( not ( = ?auto_774709 ?auto_774713 ) ) ( not ( = ?auto_774709 ?auto_774714 ) ) ( not ( = ?auto_774709 ?auto_774715 ) ) ( not ( = ?auto_774709 ?auto_774716 ) ) ( not ( = ?auto_774709 ?auto_774717 ) ) ( not ( = ?auto_774709 ?auto_774718 ) ) ( not ( = ?auto_774709 ?auto_774719 ) ) ( not ( = ?auto_774709 ?auto_774720 ) ) ( not ( = ?auto_774709 ?auto_774721 ) ) ( not ( = ?auto_774710 ?auto_774711 ) ) ( not ( = ?auto_774710 ?auto_774712 ) ) ( not ( = ?auto_774710 ?auto_774713 ) ) ( not ( = ?auto_774710 ?auto_774714 ) ) ( not ( = ?auto_774710 ?auto_774715 ) ) ( not ( = ?auto_774710 ?auto_774716 ) ) ( not ( = ?auto_774710 ?auto_774717 ) ) ( not ( = ?auto_774710 ?auto_774718 ) ) ( not ( = ?auto_774710 ?auto_774719 ) ) ( not ( = ?auto_774710 ?auto_774720 ) ) ( not ( = ?auto_774710 ?auto_774721 ) ) ( not ( = ?auto_774711 ?auto_774712 ) ) ( not ( = ?auto_774711 ?auto_774713 ) ) ( not ( = ?auto_774711 ?auto_774714 ) ) ( not ( = ?auto_774711 ?auto_774715 ) ) ( not ( = ?auto_774711 ?auto_774716 ) ) ( not ( = ?auto_774711 ?auto_774717 ) ) ( not ( = ?auto_774711 ?auto_774718 ) ) ( not ( = ?auto_774711 ?auto_774719 ) ) ( not ( = ?auto_774711 ?auto_774720 ) ) ( not ( = ?auto_774711 ?auto_774721 ) ) ( not ( = ?auto_774712 ?auto_774713 ) ) ( not ( = ?auto_774712 ?auto_774714 ) ) ( not ( = ?auto_774712 ?auto_774715 ) ) ( not ( = ?auto_774712 ?auto_774716 ) ) ( not ( = ?auto_774712 ?auto_774717 ) ) ( not ( = ?auto_774712 ?auto_774718 ) ) ( not ( = ?auto_774712 ?auto_774719 ) ) ( not ( = ?auto_774712 ?auto_774720 ) ) ( not ( = ?auto_774712 ?auto_774721 ) ) ( not ( = ?auto_774713 ?auto_774714 ) ) ( not ( = ?auto_774713 ?auto_774715 ) ) ( not ( = ?auto_774713 ?auto_774716 ) ) ( not ( = ?auto_774713 ?auto_774717 ) ) ( not ( = ?auto_774713 ?auto_774718 ) ) ( not ( = ?auto_774713 ?auto_774719 ) ) ( not ( = ?auto_774713 ?auto_774720 ) ) ( not ( = ?auto_774713 ?auto_774721 ) ) ( not ( = ?auto_774714 ?auto_774715 ) ) ( not ( = ?auto_774714 ?auto_774716 ) ) ( not ( = ?auto_774714 ?auto_774717 ) ) ( not ( = ?auto_774714 ?auto_774718 ) ) ( not ( = ?auto_774714 ?auto_774719 ) ) ( not ( = ?auto_774714 ?auto_774720 ) ) ( not ( = ?auto_774714 ?auto_774721 ) ) ( not ( = ?auto_774715 ?auto_774716 ) ) ( not ( = ?auto_774715 ?auto_774717 ) ) ( not ( = ?auto_774715 ?auto_774718 ) ) ( not ( = ?auto_774715 ?auto_774719 ) ) ( not ( = ?auto_774715 ?auto_774720 ) ) ( not ( = ?auto_774715 ?auto_774721 ) ) ( not ( = ?auto_774716 ?auto_774717 ) ) ( not ( = ?auto_774716 ?auto_774718 ) ) ( not ( = ?auto_774716 ?auto_774719 ) ) ( not ( = ?auto_774716 ?auto_774720 ) ) ( not ( = ?auto_774716 ?auto_774721 ) ) ( not ( = ?auto_774717 ?auto_774718 ) ) ( not ( = ?auto_774717 ?auto_774719 ) ) ( not ( = ?auto_774717 ?auto_774720 ) ) ( not ( = ?auto_774717 ?auto_774721 ) ) ( not ( = ?auto_774718 ?auto_774719 ) ) ( not ( = ?auto_774718 ?auto_774720 ) ) ( not ( = ?auto_774718 ?auto_774721 ) ) ( not ( = ?auto_774719 ?auto_774720 ) ) ( not ( = ?auto_774719 ?auto_774721 ) ) ( not ( = ?auto_774720 ?auto_774721 ) ) ( ON ?auto_774719 ?auto_774720 ) ( ON ?auto_774718 ?auto_774719 ) ( ON ?auto_774717 ?auto_774718 ) ( ON ?auto_774716 ?auto_774717 ) ( ON ?auto_774715 ?auto_774716 ) ( ON ?auto_774714 ?auto_774715 ) ( ON ?auto_774713 ?auto_774714 ) ( ON ?auto_774712 ?auto_774713 ) ( ON ?auto_774711 ?auto_774712 ) ( ON ?auto_774710 ?auto_774711 ) ( ON ?auto_774709 ?auto_774710 ) ( ON ?auto_774708 ?auto_774709 ) ( ON ?auto_774707 ?auto_774708 ) ( ON ?auto_774706 ?auto_774707 ) ( ON ?auto_774705 ?auto_774706 ) ( CLEAR ?auto_774703 ) ( ON ?auto_774704 ?auto_774705 ) ( CLEAR ?auto_774704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_774703 ?auto_774704 )
      ( MAKE-18PILE ?auto_774703 ?auto_774704 ?auto_774705 ?auto_774706 ?auto_774707 ?auto_774708 ?auto_774709 ?auto_774710 ?auto_774711 ?auto_774712 ?auto_774713 ?auto_774714 ?auto_774715 ?auto_774716 ?auto_774717 ?auto_774718 ?auto_774719 ?auto_774720 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774740 - BLOCK
      ?auto_774741 - BLOCK
      ?auto_774742 - BLOCK
      ?auto_774743 - BLOCK
      ?auto_774744 - BLOCK
      ?auto_774745 - BLOCK
      ?auto_774746 - BLOCK
      ?auto_774747 - BLOCK
      ?auto_774748 - BLOCK
      ?auto_774749 - BLOCK
      ?auto_774750 - BLOCK
      ?auto_774751 - BLOCK
      ?auto_774752 - BLOCK
      ?auto_774753 - BLOCK
      ?auto_774754 - BLOCK
      ?auto_774755 - BLOCK
      ?auto_774756 - BLOCK
      ?auto_774757 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_774757 ) ( ON-TABLE ?auto_774740 ) ( not ( = ?auto_774740 ?auto_774741 ) ) ( not ( = ?auto_774740 ?auto_774742 ) ) ( not ( = ?auto_774740 ?auto_774743 ) ) ( not ( = ?auto_774740 ?auto_774744 ) ) ( not ( = ?auto_774740 ?auto_774745 ) ) ( not ( = ?auto_774740 ?auto_774746 ) ) ( not ( = ?auto_774740 ?auto_774747 ) ) ( not ( = ?auto_774740 ?auto_774748 ) ) ( not ( = ?auto_774740 ?auto_774749 ) ) ( not ( = ?auto_774740 ?auto_774750 ) ) ( not ( = ?auto_774740 ?auto_774751 ) ) ( not ( = ?auto_774740 ?auto_774752 ) ) ( not ( = ?auto_774740 ?auto_774753 ) ) ( not ( = ?auto_774740 ?auto_774754 ) ) ( not ( = ?auto_774740 ?auto_774755 ) ) ( not ( = ?auto_774740 ?auto_774756 ) ) ( not ( = ?auto_774740 ?auto_774757 ) ) ( not ( = ?auto_774741 ?auto_774742 ) ) ( not ( = ?auto_774741 ?auto_774743 ) ) ( not ( = ?auto_774741 ?auto_774744 ) ) ( not ( = ?auto_774741 ?auto_774745 ) ) ( not ( = ?auto_774741 ?auto_774746 ) ) ( not ( = ?auto_774741 ?auto_774747 ) ) ( not ( = ?auto_774741 ?auto_774748 ) ) ( not ( = ?auto_774741 ?auto_774749 ) ) ( not ( = ?auto_774741 ?auto_774750 ) ) ( not ( = ?auto_774741 ?auto_774751 ) ) ( not ( = ?auto_774741 ?auto_774752 ) ) ( not ( = ?auto_774741 ?auto_774753 ) ) ( not ( = ?auto_774741 ?auto_774754 ) ) ( not ( = ?auto_774741 ?auto_774755 ) ) ( not ( = ?auto_774741 ?auto_774756 ) ) ( not ( = ?auto_774741 ?auto_774757 ) ) ( not ( = ?auto_774742 ?auto_774743 ) ) ( not ( = ?auto_774742 ?auto_774744 ) ) ( not ( = ?auto_774742 ?auto_774745 ) ) ( not ( = ?auto_774742 ?auto_774746 ) ) ( not ( = ?auto_774742 ?auto_774747 ) ) ( not ( = ?auto_774742 ?auto_774748 ) ) ( not ( = ?auto_774742 ?auto_774749 ) ) ( not ( = ?auto_774742 ?auto_774750 ) ) ( not ( = ?auto_774742 ?auto_774751 ) ) ( not ( = ?auto_774742 ?auto_774752 ) ) ( not ( = ?auto_774742 ?auto_774753 ) ) ( not ( = ?auto_774742 ?auto_774754 ) ) ( not ( = ?auto_774742 ?auto_774755 ) ) ( not ( = ?auto_774742 ?auto_774756 ) ) ( not ( = ?auto_774742 ?auto_774757 ) ) ( not ( = ?auto_774743 ?auto_774744 ) ) ( not ( = ?auto_774743 ?auto_774745 ) ) ( not ( = ?auto_774743 ?auto_774746 ) ) ( not ( = ?auto_774743 ?auto_774747 ) ) ( not ( = ?auto_774743 ?auto_774748 ) ) ( not ( = ?auto_774743 ?auto_774749 ) ) ( not ( = ?auto_774743 ?auto_774750 ) ) ( not ( = ?auto_774743 ?auto_774751 ) ) ( not ( = ?auto_774743 ?auto_774752 ) ) ( not ( = ?auto_774743 ?auto_774753 ) ) ( not ( = ?auto_774743 ?auto_774754 ) ) ( not ( = ?auto_774743 ?auto_774755 ) ) ( not ( = ?auto_774743 ?auto_774756 ) ) ( not ( = ?auto_774743 ?auto_774757 ) ) ( not ( = ?auto_774744 ?auto_774745 ) ) ( not ( = ?auto_774744 ?auto_774746 ) ) ( not ( = ?auto_774744 ?auto_774747 ) ) ( not ( = ?auto_774744 ?auto_774748 ) ) ( not ( = ?auto_774744 ?auto_774749 ) ) ( not ( = ?auto_774744 ?auto_774750 ) ) ( not ( = ?auto_774744 ?auto_774751 ) ) ( not ( = ?auto_774744 ?auto_774752 ) ) ( not ( = ?auto_774744 ?auto_774753 ) ) ( not ( = ?auto_774744 ?auto_774754 ) ) ( not ( = ?auto_774744 ?auto_774755 ) ) ( not ( = ?auto_774744 ?auto_774756 ) ) ( not ( = ?auto_774744 ?auto_774757 ) ) ( not ( = ?auto_774745 ?auto_774746 ) ) ( not ( = ?auto_774745 ?auto_774747 ) ) ( not ( = ?auto_774745 ?auto_774748 ) ) ( not ( = ?auto_774745 ?auto_774749 ) ) ( not ( = ?auto_774745 ?auto_774750 ) ) ( not ( = ?auto_774745 ?auto_774751 ) ) ( not ( = ?auto_774745 ?auto_774752 ) ) ( not ( = ?auto_774745 ?auto_774753 ) ) ( not ( = ?auto_774745 ?auto_774754 ) ) ( not ( = ?auto_774745 ?auto_774755 ) ) ( not ( = ?auto_774745 ?auto_774756 ) ) ( not ( = ?auto_774745 ?auto_774757 ) ) ( not ( = ?auto_774746 ?auto_774747 ) ) ( not ( = ?auto_774746 ?auto_774748 ) ) ( not ( = ?auto_774746 ?auto_774749 ) ) ( not ( = ?auto_774746 ?auto_774750 ) ) ( not ( = ?auto_774746 ?auto_774751 ) ) ( not ( = ?auto_774746 ?auto_774752 ) ) ( not ( = ?auto_774746 ?auto_774753 ) ) ( not ( = ?auto_774746 ?auto_774754 ) ) ( not ( = ?auto_774746 ?auto_774755 ) ) ( not ( = ?auto_774746 ?auto_774756 ) ) ( not ( = ?auto_774746 ?auto_774757 ) ) ( not ( = ?auto_774747 ?auto_774748 ) ) ( not ( = ?auto_774747 ?auto_774749 ) ) ( not ( = ?auto_774747 ?auto_774750 ) ) ( not ( = ?auto_774747 ?auto_774751 ) ) ( not ( = ?auto_774747 ?auto_774752 ) ) ( not ( = ?auto_774747 ?auto_774753 ) ) ( not ( = ?auto_774747 ?auto_774754 ) ) ( not ( = ?auto_774747 ?auto_774755 ) ) ( not ( = ?auto_774747 ?auto_774756 ) ) ( not ( = ?auto_774747 ?auto_774757 ) ) ( not ( = ?auto_774748 ?auto_774749 ) ) ( not ( = ?auto_774748 ?auto_774750 ) ) ( not ( = ?auto_774748 ?auto_774751 ) ) ( not ( = ?auto_774748 ?auto_774752 ) ) ( not ( = ?auto_774748 ?auto_774753 ) ) ( not ( = ?auto_774748 ?auto_774754 ) ) ( not ( = ?auto_774748 ?auto_774755 ) ) ( not ( = ?auto_774748 ?auto_774756 ) ) ( not ( = ?auto_774748 ?auto_774757 ) ) ( not ( = ?auto_774749 ?auto_774750 ) ) ( not ( = ?auto_774749 ?auto_774751 ) ) ( not ( = ?auto_774749 ?auto_774752 ) ) ( not ( = ?auto_774749 ?auto_774753 ) ) ( not ( = ?auto_774749 ?auto_774754 ) ) ( not ( = ?auto_774749 ?auto_774755 ) ) ( not ( = ?auto_774749 ?auto_774756 ) ) ( not ( = ?auto_774749 ?auto_774757 ) ) ( not ( = ?auto_774750 ?auto_774751 ) ) ( not ( = ?auto_774750 ?auto_774752 ) ) ( not ( = ?auto_774750 ?auto_774753 ) ) ( not ( = ?auto_774750 ?auto_774754 ) ) ( not ( = ?auto_774750 ?auto_774755 ) ) ( not ( = ?auto_774750 ?auto_774756 ) ) ( not ( = ?auto_774750 ?auto_774757 ) ) ( not ( = ?auto_774751 ?auto_774752 ) ) ( not ( = ?auto_774751 ?auto_774753 ) ) ( not ( = ?auto_774751 ?auto_774754 ) ) ( not ( = ?auto_774751 ?auto_774755 ) ) ( not ( = ?auto_774751 ?auto_774756 ) ) ( not ( = ?auto_774751 ?auto_774757 ) ) ( not ( = ?auto_774752 ?auto_774753 ) ) ( not ( = ?auto_774752 ?auto_774754 ) ) ( not ( = ?auto_774752 ?auto_774755 ) ) ( not ( = ?auto_774752 ?auto_774756 ) ) ( not ( = ?auto_774752 ?auto_774757 ) ) ( not ( = ?auto_774753 ?auto_774754 ) ) ( not ( = ?auto_774753 ?auto_774755 ) ) ( not ( = ?auto_774753 ?auto_774756 ) ) ( not ( = ?auto_774753 ?auto_774757 ) ) ( not ( = ?auto_774754 ?auto_774755 ) ) ( not ( = ?auto_774754 ?auto_774756 ) ) ( not ( = ?auto_774754 ?auto_774757 ) ) ( not ( = ?auto_774755 ?auto_774756 ) ) ( not ( = ?auto_774755 ?auto_774757 ) ) ( not ( = ?auto_774756 ?auto_774757 ) ) ( ON ?auto_774756 ?auto_774757 ) ( ON ?auto_774755 ?auto_774756 ) ( ON ?auto_774754 ?auto_774755 ) ( ON ?auto_774753 ?auto_774754 ) ( ON ?auto_774752 ?auto_774753 ) ( ON ?auto_774751 ?auto_774752 ) ( ON ?auto_774750 ?auto_774751 ) ( ON ?auto_774749 ?auto_774750 ) ( ON ?auto_774748 ?auto_774749 ) ( ON ?auto_774747 ?auto_774748 ) ( ON ?auto_774746 ?auto_774747 ) ( ON ?auto_774745 ?auto_774746 ) ( ON ?auto_774744 ?auto_774745 ) ( ON ?auto_774743 ?auto_774744 ) ( ON ?auto_774742 ?auto_774743 ) ( CLEAR ?auto_774740 ) ( ON ?auto_774741 ?auto_774742 ) ( CLEAR ?auto_774741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_774740 ?auto_774741 )
      ( MAKE-18PILE ?auto_774740 ?auto_774741 ?auto_774742 ?auto_774743 ?auto_774744 ?auto_774745 ?auto_774746 ?auto_774747 ?auto_774748 ?auto_774749 ?auto_774750 ?auto_774751 ?auto_774752 ?auto_774753 ?auto_774754 ?auto_774755 ?auto_774756 ?auto_774757 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774776 - BLOCK
      ?auto_774777 - BLOCK
      ?auto_774778 - BLOCK
      ?auto_774779 - BLOCK
      ?auto_774780 - BLOCK
      ?auto_774781 - BLOCK
      ?auto_774782 - BLOCK
      ?auto_774783 - BLOCK
      ?auto_774784 - BLOCK
      ?auto_774785 - BLOCK
      ?auto_774786 - BLOCK
      ?auto_774787 - BLOCK
      ?auto_774788 - BLOCK
      ?auto_774789 - BLOCK
      ?auto_774790 - BLOCK
      ?auto_774791 - BLOCK
      ?auto_774792 - BLOCK
      ?auto_774793 - BLOCK
    )
    :vars
    (
      ?auto_774794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_774793 ?auto_774794 ) ( not ( = ?auto_774776 ?auto_774777 ) ) ( not ( = ?auto_774776 ?auto_774778 ) ) ( not ( = ?auto_774776 ?auto_774779 ) ) ( not ( = ?auto_774776 ?auto_774780 ) ) ( not ( = ?auto_774776 ?auto_774781 ) ) ( not ( = ?auto_774776 ?auto_774782 ) ) ( not ( = ?auto_774776 ?auto_774783 ) ) ( not ( = ?auto_774776 ?auto_774784 ) ) ( not ( = ?auto_774776 ?auto_774785 ) ) ( not ( = ?auto_774776 ?auto_774786 ) ) ( not ( = ?auto_774776 ?auto_774787 ) ) ( not ( = ?auto_774776 ?auto_774788 ) ) ( not ( = ?auto_774776 ?auto_774789 ) ) ( not ( = ?auto_774776 ?auto_774790 ) ) ( not ( = ?auto_774776 ?auto_774791 ) ) ( not ( = ?auto_774776 ?auto_774792 ) ) ( not ( = ?auto_774776 ?auto_774793 ) ) ( not ( = ?auto_774776 ?auto_774794 ) ) ( not ( = ?auto_774777 ?auto_774778 ) ) ( not ( = ?auto_774777 ?auto_774779 ) ) ( not ( = ?auto_774777 ?auto_774780 ) ) ( not ( = ?auto_774777 ?auto_774781 ) ) ( not ( = ?auto_774777 ?auto_774782 ) ) ( not ( = ?auto_774777 ?auto_774783 ) ) ( not ( = ?auto_774777 ?auto_774784 ) ) ( not ( = ?auto_774777 ?auto_774785 ) ) ( not ( = ?auto_774777 ?auto_774786 ) ) ( not ( = ?auto_774777 ?auto_774787 ) ) ( not ( = ?auto_774777 ?auto_774788 ) ) ( not ( = ?auto_774777 ?auto_774789 ) ) ( not ( = ?auto_774777 ?auto_774790 ) ) ( not ( = ?auto_774777 ?auto_774791 ) ) ( not ( = ?auto_774777 ?auto_774792 ) ) ( not ( = ?auto_774777 ?auto_774793 ) ) ( not ( = ?auto_774777 ?auto_774794 ) ) ( not ( = ?auto_774778 ?auto_774779 ) ) ( not ( = ?auto_774778 ?auto_774780 ) ) ( not ( = ?auto_774778 ?auto_774781 ) ) ( not ( = ?auto_774778 ?auto_774782 ) ) ( not ( = ?auto_774778 ?auto_774783 ) ) ( not ( = ?auto_774778 ?auto_774784 ) ) ( not ( = ?auto_774778 ?auto_774785 ) ) ( not ( = ?auto_774778 ?auto_774786 ) ) ( not ( = ?auto_774778 ?auto_774787 ) ) ( not ( = ?auto_774778 ?auto_774788 ) ) ( not ( = ?auto_774778 ?auto_774789 ) ) ( not ( = ?auto_774778 ?auto_774790 ) ) ( not ( = ?auto_774778 ?auto_774791 ) ) ( not ( = ?auto_774778 ?auto_774792 ) ) ( not ( = ?auto_774778 ?auto_774793 ) ) ( not ( = ?auto_774778 ?auto_774794 ) ) ( not ( = ?auto_774779 ?auto_774780 ) ) ( not ( = ?auto_774779 ?auto_774781 ) ) ( not ( = ?auto_774779 ?auto_774782 ) ) ( not ( = ?auto_774779 ?auto_774783 ) ) ( not ( = ?auto_774779 ?auto_774784 ) ) ( not ( = ?auto_774779 ?auto_774785 ) ) ( not ( = ?auto_774779 ?auto_774786 ) ) ( not ( = ?auto_774779 ?auto_774787 ) ) ( not ( = ?auto_774779 ?auto_774788 ) ) ( not ( = ?auto_774779 ?auto_774789 ) ) ( not ( = ?auto_774779 ?auto_774790 ) ) ( not ( = ?auto_774779 ?auto_774791 ) ) ( not ( = ?auto_774779 ?auto_774792 ) ) ( not ( = ?auto_774779 ?auto_774793 ) ) ( not ( = ?auto_774779 ?auto_774794 ) ) ( not ( = ?auto_774780 ?auto_774781 ) ) ( not ( = ?auto_774780 ?auto_774782 ) ) ( not ( = ?auto_774780 ?auto_774783 ) ) ( not ( = ?auto_774780 ?auto_774784 ) ) ( not ( = ?auto_774780 ?auto_774785 ) ) ( not ( = ?auto_774780 ?auto_774786 ) ) ( not ( = ?auto_774780 ?auto_774787 ) ) ( not ( = ?auto_774780 ?auto_774788 ) ) ( not ( = ?auto_774780 ?auto_774789 ) ) ( not ( = ?auto_774780 ?auto_774790 ) ) ( not ( = ?auto_774780 ?auto_774791 ) ) ( not ( = ?auto_774780 ?auto_774792 ) ) ( not ( = ?auto_774780 ?auto_774793 ) ) ( not ( = ?auto_774780 ?auto_774794 ) ) ( not ( = ?auto_774781 ?auto_774782 ) ) ( not ( = ?auto_774781 ?auto_774783 ) ) ( not ( = ?auto_774781 ?auto_774784 ) ) ( not ( = ?auto_774781 ?auto_774785 ) ) ( not ( = ?auto_774781 ?auto_774786 ) ) ( not ( = ?auto_774781 ?auto_774787 ) ) ( not ( = ?auto_774781 ?auto_774788 ) ) ( not ( = ?auto_774781 ?auto_774789 ) ) ( not ( = ?auto_774781 ?auto_774790 ) ) ( not ( = ?auto_774781 ?auto_774791 ) ) ( not ( = ?auto_774781 ?auto_774792 ) ) ( not ( = ?auto_774781 ?auto_774793 ) ) ( not ( = ?auto_774781 ?auto_774794 ) ) ( not ( = ?auto_774782 ?auto_774783 ) ) ( not ( = ?auto_774782 ?auto_774784 ) ) ( not ( = ?auto_774782 ?auto_774785 ) ) ( not ( = ?auto_774782 ?auto_774786 ) ) ( not ( = ?auto_774782 ?auto_774787 ) ) ( not ( = ?auto_774782 ?auto_774788 ) ) ( not ( = ?auto_774782 ?auto_774789 ) ) ( not ( = ?auto_774782 ?auto_774790 ) ) ( not ( = ?auto_774782 ?auto_774791 ) ) ( not ( = ?auto_774782 ?auto_774792 ) ) ( not ( = ?auto_774782 ?auto_774793 ) ) ( not ( = ?auto_774782 ?auto_774794 ) ) ( not ( = ?auto_774783 ?auto_774784 ) ) ( not ( = ?auto_774783 ?auto_774785 ) ) ( not ( = ?auto_774783 ?auto_774786 ) ) ( not ( = ?auto_774783 ?auto_774787 ) ) ( not ( = ?auto_774783 ?auto_774788 ) ) ( not ( = ?auto_774783 ?auto_774789 ) ) ( not ( = ?auto_774783 ?auto_774790 ) ) ( not ( = ?auto_774783 ?auto_774791 ) ) ( not ( = ?auto_774783 ?auto_774792 ) ) ( not ( = ?auto_774783 ?auto_774793 ) ) ( not ( = ?auto_774783 ?auto_774794 ) ) ( not ( = ?auto_774784 ?auto_774785 ) ) ( not ( = ?auto_774784 ?auto_774786 ) ) ( not ( = ?auto_774784 ?auto_774787 ) ) ( not ( = ?auto_774784 ?auto_774788 ) ) ( not ( = ?auto_774784 ?auto_774789 ) ) ( not ( = ?auto_774784 ?auto_774790 ) ) ( not ( = ?auto_774784 ?auto_774791 ) ) ( not ( = ?auto_774784 ?auto_774792 ) ) ( not ( = ?auto_774784 ?auto_774793 ) ) ( not ( = ?auto_774784 ?auto_774794 ) ) ( not ( = ?auto_774785 ?auto_774786 ) ) ( not ( = ?auto_774785 ?auto_774787 ) ) ( not ( = ?auto_774785 ?auto_774788 ) ) ( not ( = ?auto_774785 ?auto_774789 ) ) ( not ( = ?auto_774785 ?auto_774790 ) ) ( not ( = ?auto_774785 ?auto_774791 ) ) ( not ( = ?auto_774785 ?auto_774792 ) ) ( not ( = ?auto_774785 ?auto_774793 ) ) ( not ( = ?auto_774785 ?auto_774794 ) ) ( not ( = ?auto_774786 ?auto_774787 ) ) ( not ( = ?auto_774786 ?auto_774788 ) ) ( not ( = ?auto_774786 ?auto_774789 ) ) ( not ( = ?auto_774786 ?auto_774790 ) ) ( not ( = ?auto_774786 ?auto_774791 ) ) ( not ( = ?auto_774786 ?auto_774792 ) ) ( not ( = ?auto_774786 ?auto_774793 ) ) ( not ( = ?auto_774786 ?auto_774794 ) ) ( not ( = ?auto_774787 ?auto_774788 ) ) ( not ( = ?auto_774787 ?auto_774789 ) ) ( not ( = ?auto_774787 ?auto_774790 ) ) ( not ( = ?auto_774787 ?auto_774791 ) ) ( not ( = ?auto_774787 ?auto_774792 ) ) ( not ( = ?auto_774787 ?auto_774793 ) ) ( not ( = ?auto_774787 ?auto_774794 ) ) ( not ( = ?auto_774788 ?auto_774789 ) ) ( not ( = ?auto_774788 ?auto_774790 ) ) ( not ( = ?auto_774788 ?auto_774791 ) ) ( not ( = ?auto_774788 ?auto_774792 ) ) ( not ( = ?auto_774788 ?auto_774793 ) ) ( not ( = ?auto_774788 ?auto_774794 ) ) ( not ( = ?auto_774789 ?auto_774790 ) ) ( not ( = ?auto_774789 ?auto_774791 ) ) ( not ( = ?auto_774789 ?auto_774792 ) ) ( not ( = ?auto_774789 ?auto_774793 ) ) ( not ( = ?auto_774789 ?auto_774794 ) ) ( not ( = ?auto_774790 ?auto_774791 ) ) ( not ( = ?auto_774790 ?auto_774792 ) ) ( not ( = ?auto_774790 ?auto_774793 ) ) ( not ( = ?auto_774790 ?auto_774794 ) ) ( not ( = ?auto_774791 ?auto_774792 ) ) ( not ( = ?auto_774791 ?auto_774793 ) ) ( not ( = ?auto_774791 ?auto_774794 ) ) ( not ( = ?auto_774792 ?auto_774793 ) ) ( not ( = ?auto_774792 ?auto_774794 ) ) ( not ( = ?auto_774793 ?auto_774794 ) ) ( ON ?auto_774792 ?auto_774793 ) ( ON ?auto_774791 ?auto_774792 ) ( ON ?auto_774790 ?auto_774791 ) ( ON ?auto_774789 ?auto_774790 ) ( ON ?auto_774788 ?auto_774789 ) ( ON ?auto_774787 ?auto_774788 ) ( ON ?auto_774786 ?auto_774787 ) ( ON ?auto_774785 ?auto_774786 ) ( ON ?auto_774784 ?auto_774785 ) ( ON ?auto_774783 ?auto_774784 ) ( ON ?auto_774782 ?auto_774783 ) ( ON ?auto_774781 ?auto_774782 ) ( ON ?auto_774780 ?auto_774781 ) ( ON ?auto_774779 ?auto_774780 ) ( ON ?auto_774778 ?auto_774779 ) ( ON ?auto_774777 ?auto_774778 ) ( ON ?auto_774776 ?auto_774777 ) ( CLEAR ?auto_774776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_774776 )
      ( MAKE-18PILE ?auto_774776 ?auto_774777 ?auto_774778 ?auto_774779 ?auto_774780 ?auto_774781 ?auto_774782 ?auto_774783 ?auto_774784 ?auto_774785 ?auto_774786 ?auto_774787 ?auto_774788 ?auto_774789 ?auto_774790 ?auto_774791 ?auto_774792 ?auto_774793 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774813 - BLOCK
      ?auto_774814 - BLOCK
      ?auto_774815 - BLOCK
      ?auto_774816 - BLOCK
      ?auto_774817 - BLOCK
      ?auto_774818 - BLOCK
      ?auto_774819 - BLOCK
      ?auto_774820 - BLOCK
      ?auto_774821 - BLOCK
      ?auto_774822 - BLOCK
      ?auto_774823 - BLOCK
      ?auto_774824 - BLOCK
      ?auto_774825 - BLOCK
      ?auto_774826 - BLOCK
      ?auto_774827 - BLOCK
      ?auto_774828 - BLOCK
      ?auto_774829 - BLOCK
      ?auto_774830 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_774830 ) ( not ( = ?auto_774813 ?auto_774814 ) ) ( not ( = ?auto_774813 ?auto_774815 ) ) ( not ( = ?auto_774813 ?auto_774816 ) ) ( not ( = ?auto_774813 ?auto_774817 ) ) ( not ( = ?auto_774813 ?auto_774818 ) ) ( not ( = ?auto_774813 ?auto_774819 ) ) ( not ( = ?auto_774813 ?auto_774820 ) ) ( not ( = ?auto_774813 ?auto_774821 ) ) ( not ( = ?auto_774813 ?auto_774822 ) ) ( not ( = ?auto_774813 ?auto_774823 ) ) ( not ( = ?auto_774813 ?auto_774824 ) ) ( not ( = ?auto_774813 ?auto_774825 ) ) ( not ( = ?auto_774813 ?auto_774826 ) ) ( not ( = ?auto_774813 ?auto_774827 ) ) ( not ( = ?auto_774813 ?auto_774828 ) ) ( not ( = ?auto_774813 ?auto_774829 ) ) ( not ( = ?auto_774813 ?auto_774830 ) ) ( not ( = ?auto_774814 ?auto_774815 ) ) ( not ( = ?auto_774814 ?auto_774816 ) ) ( not ( = ?auto_774814 ?auto_774817 ) ) ( not ( = ?auto_774814 ?auto_774818 ) ) ( not ( = ?auto_774814 ?auto_774819 ) ) ( not ( = ?auto_774814 ?auto_774820 ) ) ( not ( = ?auto_774814 ?auto_774821 ) ) ( not ( = ?auto_774814 ?auto_774822 ) ) ( not ( = ?auto_774814 ?auto_774823 ) ) ( not ( = ?auto_774814 ?auto_774824 ) ) ( not ( = ?auto_774814 ?auto_774825 ) ) ( not ( = ?auto_774814 ?auto_774826 ) ) ( not ( = ?auto_774814 ?auto_774827 ) ) ( not ( = ?auto_774814 ?auto_774828 ) ) ( not ( = ?auto_774814 ?auto_774829 ) ) ( not ( = ?auto_774814 ?auto_774830 ) ) ( not ( = ?auto_774815 ?auto_774816 ) ) ( not ( = ?auto_774815 ?auto_774817 ) ) ( not ( = ?auto_774815 ?auto_774818 ) ) ( not ( = ?auto_774815 ?auto_774819 ) ) ( not ( = ?auto_774815 ?auto_774820 ) ) ( not ( = ?auto_774815 ?auto_774821 ) ) ( not ( = ?auto_774815 ?auto_774822 ) ) ( not ( = ?auto_774815 ?auto_774823 ) ) ( not ( = ?auto_774815 ?auto_774824 ) ) ( not ( = ?auto_774815 ?auto_774825 ) ) ( not ( = ?auto_774815 ?auto_774826 ) ) ( not ( = ?auto_774815 ?auto_774827 ) ) ( not ( = ?auto_774815 ?auto_774828 ) ) ( not ( = ?auto_774815 ?auto_774829 ) ) ( not ( = ?auto_774815 ?auto_774830 ) ) ( not ( = ?auto_774816 ?auto_774817 ) ) ( not ( = ?auto_774816 ?auto_774818 ) ) ( not ( = ?auto_774816 ?auto_774819 ) ) ( not ( = ?auto_774816 ?auto_774820 ) ) ( not ( = ?auto_774816 ?auto_774821 ) ) ( not ( = ?auto_774816 ?auto_774822 ) ) ( not ( = ?auto_774816 ?auto_774823 ) ) ( not ( = ?auto_774816 ?auto_774824 ) ) ( not ( = ?auto_774816 ?auto_774825 ) ) ( not ( = ?auto_774816 ?auto_774826 ) ) ( not ( = ?auto_774816 ?auto_774827 ) ) ( not ( = ?auto_774816 ?auto_774828 ) ) ( not ( = ?auto_774816 ?auto_774829 ) ) ( not ( = ?auto_774816 ?auto_774830 ) ) ( not ( = ?auto_774817 ?auto_774818 ) ) ( not ( = ?auto_774817 ?auto_774819 ) ) ( not ( = ?auto_774817 ?auto_774820 ) ) ( not ( = ?auto_774817 ?auto_774821 ) ) ( not ( = ?auto_774817 ?auto_774822 ) ) ( not ( = ?auto_774817 ?auto_774823 ) ) ( not ( = ?auto_774817 ?auto_774824 ) ) ( not ( = ?auto_774817 ?auto_774825 ) ) ( not ( = ?auto_774817 ?auto_774826 ) ) ( not ( = ?auto_774817 ?auto_774827 ) ) ( not ( = ?auto_774817 ?auto_774828 ) ) ( not ( = ?auto_774817 ?auto_774829 ) ) ( not ( = ?auto_774817 ?auto_774830 ) ) ( not ( = ?auto_774818 ?auto_774819 ) ) ( not ( = ?auto_774818 ?auto_774820 ) ) ( not ( = ?auto_774818 ?auto_774821 ) ) ( not ( = ?auto_774818 ?auto_774822 ) ) ( not ( = ?auto_774818 ?auto_774823 ) ) ( not ( = ?auto_774818 ?auto_774824 ) ) ( not ( = ?auto_774818 ?auto_774825 ) ) ( not ( = ?auto_774818 ?auto_774826 ) ) ( not ( = ?auto_774818 ?auto_774827 ) ) ( not ( = ?auto_774818 ?auto_774828 ) ) ( not ( = ?auto_774818 ?auto_774829 ) ) ( not ( = ?auto_774818 ?auto_774830 ) ) ( not ( = ?auto_774819 ?auto_774820 ) ) ( not ( = ?auto_774819 ?auto_774821 ) ) ( not ( = ?auto_774819 ?auto_774822 ) ) ( not ( = ?auto_774819 ?auto_774823 ) ) ( not ( = ?auto_774819 ?auto_774824 ) ) ( not ( = ?auto_774819 ?auto_774825 ) ) ( not ( = ?auto_774819 ?auto_774826 ) ) ( not ( = ?auto_774819 ?auto_774827 ) ) ( not ( = ?auto_774819 ?auto_774828 ) ) ( not ( = ?auto_774819 ?auto_774829 ) ) ( not ( = ?auto_774819 ?auto_774830 ) ) ( not ( = ?auto_774820 ?auto_774821 ) ) ( not ( = ?auto_774820 ?auto_774822 ) ) ( not ( = ?auto_774820 ?auto_774823 ) ) ( not ( = ?auto_774820 ?auto_774824 ) ) ( not ( = ?auto_774820 ?auto_774825 ) ) ( not ( = ?auto_774820 ?auto_774826 ) ) ( not ( = ?auto_774820 ?auto_774827 ) ) ( not ( = ?auto_774820 ?auto_774828 ) ) ( not ( = ?auto_774820 ?auto_774829 ) ) ( not ( = ?auto_774820 ?auto_774830 ) ) ( not ( = ?auto_774821 ?auto_774822 ) ) ( not ( = ?auto_774821 ?auto_774823 ) ) ( not ( = ?auto_774821 ?auto_774824 ) ) ( not ( = ?auto_774821 ?auto_774825 ) ) ( not ( = ?auto_774821 ?auto_774826 ) ) ( not ( = ?auto_774821 ?auto_774827 ) ) ( not ( = ?auto_774821 ?auto_774828 ) ) ( not ( = ?auto_774821 ?auto_774829 ) ) ( not ( = ?auto_774821 ?auto_774830 ) ) ( not ( = ?auto_774822 ?auto_774823 ) ) ( not ( = ?auto_774822 ?auto_774824 ) ) ( not ( = ?auto_774822 ?auto_774825 ) ) ( not ( = ?auto_774822 ?auto_774826 ) ) ( not ( = ?auto_774822 ?auto_774827 ) ) ( not ( = ?auto_774822 ?auto_774828 ) ) ( not ( = ?auto_774822 ?auto_774829 ) ) ( not ( = ?auto_774822 ?auto_774830 ) ) ( not ( = ?auto_774823 ?auto_774824 ) ) ( not ( = ?auto_774823 ?auto_774825 ) ) ( not ( = ?auto_774823 ?auto_774826 ) ) ( not ( = ?auto_774823 ?auto_774827 ) ) ( not ( = ?auto_774823 ?auto_774828 ) ) ( not ( = ?auto_774823 ?auto_774829 ) ) ( not ( = ?auto_774823 ?auto_774830 ) ) ( not ( = ?auto_774824 ?auto_774825 ) ) ( not ( = ?auto_774824 ?auto_774826 ) ) ( not ( = ?auto_774824 ?auto_774827 ) ) ( not ( = ?auto_774824 ?auto_774828 ) ) ( not ( = ?auto_774824 ?auto_774829 ) ) ( not ( = ?auto_774824 ?auto_774830 ) ) ( not ( = ?auto_774825 ?auto_774826 ) ) ( not ( = ?auto_774825 ?auto_774827 ) ) ( not ( = ?auto_774825 ?auto_774828 ) ) ( not ( = ?auto_774825 ?auto_774829 ) ) ( not ( = ?auto_774825 ?auto_774830 ) ) ( not ( = ?auto_774826 ?auto_774827 ) ) ( not ( = ?auto_774826 ?auto_774828 ) ) ( not ( = ?auto_774826 ?auto_774829 ) ) ( not ( = ?auto_774826 ?auto_774830 ) ) ( not ( = ?auto_774827 ?auto_774828 ) ) ( not ( = ?auto_774827 ?auto_774829 ) ) ( not ( = ?auto_774827 ?auto_774830 ) ) ( not ( = ?auto_774828 ?auto_774829 ) ) ( not ( = ?auto_774828 ?auto_774830 ) ) ( not ( = ?auto_774829 ?auto_774830 ) ) ( ON ?auto_774829 ?auto_774830 ) ( ON ?auto_774828 ?auto_774829 ) ( ON ?auto_774827 ?auto_774828 ) ( ON ?auto_774826 ?auto_774827 ) ( ON ?auto_774825 ?auto_774826 ) ( ON ?auto_774824 ?auto_774825 ) ( ON ?auto_774823 ?auto_774824 ) ( ON ?auto_774822 ?auto_774823 ) ( ON ?auto_774821 ?auto_774822 ) ( ON ?auto_774820 ?auto_774821 ) ( ON ?auto_774819 ?auto_774820 ) ( ON ?auto_774818 ?auto_774819 ) ( ON ?auto_774817 ?auto_774818 ) ( ON ?auto_774816 ?auto_774817 ) ( ON ?auto_774815 ?auto_774816 ) ( ON ?auto_774814 ?auto_774815 ) ( ON ?auto_774813 ?auto_774814 ) ( CLEAR ?auto_774813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_774813 )
      ( MAKE-18PILE ?auto_774813 ?auto_774814 ?auto_774815 ?auto_774816 ?auto_774817 ?auto_774818 ?auto_774819 ?auto_774820 ?auto_774821 ?auto_774822 ?auto_774823 ?auto_774824 ?auto_774825 ?auto_774826 ?auto_774827 ?auto_774828 ?auto_774829 ?auto_774830 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_774849 - BLOCK
      ?auto_774850 - BLOCK
      ?auto_774851 - BLOCK
      ?auto_774852 - BLOCK
      ?auto_774853 - BLOCK
      ?auto_774854 - BLOCK
      ?auto_774855 - BLOCK
      ?auto_774856 - BLOCK
      ?auto_774857 - BLOCK
      ?auto_774858 - BLOCK
      ?auto_774859 - BLOCK
      ?auto_774860 - BLOCK
      ?auto_774861 - BLOCK
      ?auto_774862 - BLOCK
      ?auto_774863 - BLOCK
      ?auto_774864 - BLOCK
      ?auto_774865 - BLOCK
      ?auto_774866 - BLOCK
    )
    :vars
    (
      ?auto_774867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_774849 ?auto_774850 ) ) ( not ( = ?auto_774849 ?auto_774851 ) ) ( not ( = ?auto_774849 ?auto_774852 ) ) ( not ( = ?auto_774849 ?auto_774853 ) ) ( not ( = ?auto_774849 ?auto_774854 ) ) ( not ( = ?auto_774849 ?auto_774855 ) ) ( not ( = ?auto_774849 ?auto_774856 ) ) ( not ( = ?auto_774849 ?auto_774857 ) ) ( not ( = ?auto_774849 ?auto_774858 ) ) ( not ( = ?auto_774849 ?auto_774859 ) ) ( not ( = ?auto_774849 ?auto_774860 ) ) ( not ( = ?auto_774849 ?auto_774861 ) ) ( not ( = ?auto_774849 ?auto_774862 ) ) ( not ( = ?auto_774849 ?auto_774863 ) ) ( not ( = ?auto_774849 ?auto_774864 ) ) ( not ( = ?auto_774849 ?auto_774865 ) ) ( not ( = ?auto_774849 ?auto_774866 ) ) ( not ( = ?auto_774850 ?auto_774851 ) ) ( not ( = ?auto_774850 ?auto_774852 ) ) ( not ( = ?auto_774850 ?auto_774853 ) ) ( not ( = ?auto_774850 ?auto_774854 ) ) ( not ( = ?auto_774850 ?auto_774855 ) ) ( not ( = ?auto_774850 ?auto_774856 ) ) ( not ( = ?auto_774850 ?auto_774857 ) ) ( not ( = ?auto_774850 ?auto_774858 ) ) ( not ( = ?auto_774850 ?auto_774859 ) ) ( not ( = ?auto_774850 ?auto_774860 ) ) ( not ( = ?auto_774850 ?auto_774861 ) ) ( not ( = ?auto_774850 ?auto_774862 ) ) ( not ( = ?auto_774850 ?auto_774863 ) ) ( not ( = ?auto_774850 ?auto_774864 ) ) ( not ( = ?auto_774850 ?auto_774865 ) ) ( not ( = ?auto_774850 ?auto_774866 ) ) ( not ( = ?auto_774851 ?auto_774852 ) ) ( not ( = ?auto_774851 ?auto_774853 ) ) ( not ( = ?auto_774851 ?auto_774854 ) ) ( not ( = ?auto_774851 ?auto_774855 ) ) ( not ( = ?auto_774851 ?auto_774856 ) ) ( not ( = ?auto_774851 ?auto_774857 ) ) ( not ( = ?auto_774851 ?auto_774858 ) ) ( not ( = ?auto_774851 ?auto_774859 ) ) ( not ( = ?auto_774851 ?auto_774860 ) ) ( not ( = ?auto_774851 ?auto_774861 ) ) ( not ( = ?auto_774851 ?auto_774862 ) ) ( not ( = ?auto_774851 ?auto_774863 ) ) ( not ( = ?auto_774851 ?auto_774864 ) ) ( not ( = ?auto_774851 ?auto_774865 ) ) ( not ( = ?auto_774851 ?auto_774866 ) ) ( not ( = ?auto_774852 ?auto_774853 ) ) ( not ( = ?auto_774852 ?auto_774854 ) ) ( not ( = ?auto_774852 ?auto_774855 ) ) ( not ( = ?auto_774852 ?auto_774856 ) ) ( not ( = ?auto_774852 ?auto_774857 ) ) ( not ( = ?auto_774852 ?auto_774858 ) ) ( not ( = ?auto_774852 ?auto_774859 ) ) ( not ( = ?auto_774852 ?auto_774860 ) ) ( not ( = ?auto_774852 ?auto_774861 ) ) ( not ( = ?auto_774852 ?auto_774862 ) ) ( not ( = ?auto_774852 ?auto_774863 ) ) ( not ( = ?auto_774852 ?auto_774864 ) ) ( not ( = ?auto_774852 ?auto_774865 ) ) ( not ( = ?auto_774852 ?auto_774866 ) ) ( not ( = ?auto_774853 ?auto_774854 ) ) ( not ( = ?auto_774853 ?auto_774855 ) ) ( not ( = ?auto_774853 ?auto_774856 ) ) ( not ( = ?auto_774853 ?auto_774857 ) ) ( not ( = ?auto_774853 ?auto_774858 ) ) ( not ( = ?auto_774853 ?auto_774859 ) ) ( not ( = ?auto_774853 ?auto_774860 ) ) ( not ( = ?auto_774853 ?auto_774861 ) ) ( not ( = ?auto_774853 ?auto_774862 ) ) ( not ( = ?auto_774853 ?auto_774863 ) ) ( not ( = ?auto_774853 ?auto_774864 ) ) ( not ( = ?auto_774853 ?auto_774865 ) ) ( not ( = ?auto_774853 ?auto_774866 ) ) ( not ( = ?auto_774854 ?auto_774855 ) ) ( not ( = ?auto_774854 ?auto_774856 ) ) ( not ( = ?auto_774854 ?auto_774857 ) ) ( not ( = ?auto_774854 ?auto_774858 ) ) ( not ( = ?auto_774854 ?auto_774859 ) ) ( not ( = ?auto_774854 ?auto_774860 ) ) ( not ( = ?auto_774854 ?auto_774861 ) ) ( not ( = ?auto_774854 ?auto_774862 ) ) ( not ( = ?auto_774854 ?auto_774863 ) ) ( not ( = ?auto_774854 ?auto_774864 ) ) ( not ( = ?auto_774854 ?auto_774865 ) ) ( not ( = ?auto_774854 ?auto_774866 ) ) ( not ( = ?auto_774855 ?auto_774856 ) ) ( not ( = ?auto_774855 ?auto_774857 ) ) ( not ( = ?auto_774855 ?auto_774858 ) ) ( not ( = ?auto_774855 ?auto_774859 ) ) ( not ( = ?auto_774855 ?auto_774860 ) ) ( not ( = ?auto_774855 ?auto_774861 ) ) ( not ( = ?auto_774855 ?auto_774862 ) ) ( not ( = ?auto_774855 ?auto_774863 ) ) ( not ( = ?auto_774855 ?auto_774864 ) ) ( not ( = ?auto_774855 ?auto_774865 ) ) ( not ( = ?auto_774855 ?auto_774866 ) ) ( not ( = ?auto_774856 ?auto_774857 ) ) ( not ( = ?auto_774856 ?auto_774858 ) ) ( not ( = ?auto_774856 ?auto_774859 ) ) ( not ( = ?auto_774856 ?auto_774860 ) ) ( not ( = ?auto_774856 ?auto_774861 ) ) ( not ( = ?auto_774856 ?auto_774862 ) ) ( not ( = ?auto_774856 ?auto_774863 ) ) ( not ( = ?auto_774856 ?auto_774864 ) ) ( not ( = ?auto_774856 ?auto_774865 ) ) ( not ( = ?auto_774856 ?auto_774866 ) ) ( not ( = ?auto_774857 ?auto_774858 ) ) ( not ( = ?auto_774857 ?auto_774859 ) ) ( not ( = ?auto_774857 ?auto_774860 ) ) ( not ( = ?auto_774857 ?auto_774861 ) ) ( not ( = ?auto_774857 ?auto_774862 ) ) ( not ( = ?auto_774857 ?auto_774863 ) ) ( not ( = ?auto_774857 ?auto_774864 ) ) ( not ( = ?auto_774857 ?auto_774865 ) ) ( not ( = ?auto_774857 ?auto_774866 ) ) ( not ( = ?auto_774858 ?auto_774859 ) ) ( not ( = ?auto_774858 ?auto_774860 ) ) ( not ( = ?auto_774858 ?auto_774861 ) ) ( not ( = ?auto_774858 ?auto_774862 ) ) ( not ( = ?auto_774858 ?auto_774863 ) ) ( not ( = ?auto_774858 ?auto_774864 ) ) ( not ( = ?auto_774858 ?auto_774865 ) ) ( not ( = ?auto_774858 ?auto_774866 ) ) ( not ( = ?auto_774859 ?auto_774860 ) ) ( not ( = ?auto_774859 ?auto_774861 ) ) ( not ( = ?auto_774859 ?auto_774862 ) ) ( not ( = ?auto_774859 ?auto_774863 ) ) ( not ( = ?auto_774859 ?auto_774864 ) ) ( not ( = ?auto_774859 ?auto_774865 ) ) ( not ( = ?auto_774859 ?auto_774866 ) ) ( not ( = ?auto_774860 ?auto_774861 ) ) ( not ( = ?auto_774860 ?auto_774862 ) ) ( not ( = ?auto_774860 ?auto_774863 ) ) ( not ( = ?auto_774860 ?auto_774864 ) ) ( not ( = ?auto_774860 ?auto_774865 ) ) ( not ( = ?auto_774860 ?auto_774866 ) ) ( not ( = ?auto_774861 ?auto_774862 ) ) ( not ( = ?auto_774861 ?auto_774863 ) ) ( not ( = ?auto_774861 ?auto_774864 ) ) ( not ( = ?auto_774861 ?auto_774865 ) ) ( not ( = ?auto_774861 ?auto_774866 ) ) ( not ( = ?auto_774862 ?auto_774863 ) ) ( not ( = ?auto_774862 ?auto_774864 ) ) ( not ( = ?auto_774862 ?auto_774865 ) ) ( not ( = ?auto_774862 ?auto_774866 ) ) ( not ( = ?auto_774863 ?auto_774864 ) ) ( not ( = ?auto_774863 ?auto_774865 ) ) ( not ( = ?auto_774863 ?auto_774866 ) ) ( not ( = ?auto_774864 ?auto_774865 ) ) ( not ( = ?auto_774864 ?auto_774866 ) ) ( not ( = ?auto_774865 ?auto_774866 ) ) ( ON ?auto_774849 ?auto_774867 ) ( not ( = ?auto_774866 ?auto_774867 ) ) ( not ( = ?auto_774865 ?auto_774867 ) ) ( not ( = ?auto_774864 ?auto_774867 ) ) ( not ( = ?auto_774863 ?auto_774867 ) ) ( not ( = ?auto_774862 ?auto_774867 ) ) ( not ( = ?auto_774861 ?auto_774867 ) ) ( not ( = ?auto_774860 ?auto_774867 ) ) ( not ( = ?auto_774859 ?auto_774867 ) ) ( not ( = ?auto_774858 ?auto_774867 ) ) ( not ( = ?auto_774857 ?auto_774867 ) ) ( not ( = ?auto_774856 ?auto_774867 ) ) ( not ( = ?auto_774855 ?auto_774867 ) ) ( not ( = ?auto_774854 ?auto_774867 ) ) ( not ( = ?auto_774853 ?auto_774867 ) ) ( not ( = ?auto_774852 ?auto_774867 ) ) ( not ( = ?auto_774851 ?auto_774867 ) ) ( not ( = ?auto_774850 ?auto_774867 ) ) ( not ( = ?auto_774849 ?auto_774867 ) ) ( ON ?auto_774850 ?auto_774849 ) ( ON ?auto_774851 ?auto_774850 ) ( ON ?auto_774852 ?auto_774851 ) ( ON ?auto_774853 ?auto_774852 ) ( ON ?auto_774854 ?auto_774853 ) ( ON ?auto_774855 ?auto_774854 ) ( ON ?auto_774856 ?auto_774855 ) ( ON ?auto_774857 ?auto_774856 ) ( ON ?auto_774858 ?auto_774857 ) ( ON ?auto_774859 ?auto_774858 ) ( ON ?auto_774860 ?auto_774859 ) ( ON ?auto_774861 ?auto_774860 ) ( ON ?auto_774862 ?auto_774861 ) ( ON ?auto_774863 ?auto_774862 ) ( ON ?auto_774864 ?auto_774863 ) ( ON ?auto_774865 ?auto_774864 ) ( ON ?auto_774866 ?auto_774865 ) ( CLEAR ?auto_774866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_774866 ?auto_774865 ?auto_774864 ?auto_774863 ?auto_774862 ?auto_774861 ?auto_774860 ?auto_774859 ?auto_774858 ?auto_774857 ?auto_774856 ?auto_774855 ?auto_774854 ?auto_774853 ?auto_774852 ?auto_774851 ?auto_774850 ?auto_774849 )
      ( MAKE-18PILE ?auto_774849 ?auto_774850 ?auto_774851 ?auto_774852 ?auto_774853 ?auto_774854 ?auto_774855 ?auto_774856 ?auto_774857 ?auto_774858 ?auto_774859 ?auto_774860 ?auto_774861 ?auto_774862 ?auto_774863 ?auto_774864 ?auto_774865 ?auto_774866 ) )
  )

)

