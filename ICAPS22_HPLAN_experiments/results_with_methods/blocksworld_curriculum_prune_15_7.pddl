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
      ?auto_397133 - BLOCK
    )
    :vars
    (
      ?auto_397134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397133 ?auto_397134 ) ( CLEAR ?auto_397133 ) ( HAND-EMPTY ) ( not ( = ?auto_397133 ?auto_397134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_397133 ?auto_397134 )
      ( !PUTDOWN ?auto_397133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_397140 - BLOCK
      ?auto_397141 - BLOCK
    )
    :vars
    (
      ?auto_397142 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_397140 ) ( ON ?auto_397141 ?auto_397142 ) ( CLEAR ?auto_397141 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_397140 ) ( not ( = ?auto_397140 ?auto_397141 ) ) ( not ( = ?auto_397140 ?auto_397142 ) ) ( not ( = ?auto_397141 ?auto_397142 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_397141 ?auto_397142 )
      ( !STACK ?auto_397141 ?auto_397140 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_397150 - BLOCK
      ?auto_397151 - BLOCK
    )
    :vars
    (
      ?auto_397152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397151 ?auto_397152 ) ( not ( = ?auto_397150 ?auto_397151 ) ) ( not ( = ?auto_397150 ?auto_397152 ) ) ( not ( = ?auto_397151 ?auto_397152 ) ) ( ON ?auto_397150 ?auto_397151 ) ( CLEAR ?auto_397150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_397150 )
      ( MAKE-2PILE ?auto_397150 ?auto_397151 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_397161 - BLOCK
      ?auto_397162 - BLOCK
      ?auto_397163 - BLOCK
    )
    :vars
    (
      ?auto_397164 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_397162 ) ( ON ?auto_397163 ?auto_397164 ) ( CLEAR ?auto_397163 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_397161 ) ( ON ?auto_397162 ?auto_397161 ) ( not ( = ?auto_397161 ?auto_397162 ) ) ( not ( = ?auto_397161 ?auto_397163 ) ) ( not ( = ?auto_397161 ?auto_397164 ) ) ( not ( = ?auto_397162 ?auto_397163 ) ) ( not ( = ?auto_397162 ?auto_397164 ) ) ( not ( = ?auto_397163 ?auto_397164 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_397163 ?auto_397164 )
      ( !STACK ?auto_397163 ?auto_397162 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_397175 - BLOCK
      ?auto_397176 - BLOCK
      ?auto_397177 - BLOCK
    )
    :vars
    (
      ?auto_397178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397177 ?auto_397178 ) ( ON-TABLE ?auto_397175 ) ( not ( = ?auto_397175 ?auto_397176 ) ) ( not ( = ?auto_397175 ?auto_397177 ) ) ( not ( = ?auto_397175 ?auto_397178 ) ) ( not ( = ?auto_397176 ?auto_397177 ) ) ( not ( = ?auto_397176 ?auto_397178 ) ) ( not ( = ?auto_397177 ?auto_397178 ) ) ( CLEAR ?auto_397175 ) ( ON ?auto_397176 ?auto_397177 ) ( CLEAR ?auto_397176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_397175 ?auto_397176 )
      ( MAKE-3PILE ?auto_397175 ?auto_397176 ?auto_397177 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_397189 - BLOCK
      ?auto_397190 - BLOCK
      ?auto_397191 - BLOCK
    )
    :vars
    (
      ?auto_397192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397191 ?auto_397192 ) ( not ( = ?auto_397189 ?auto_397190 ) ) ( not ( = ?auto_397189 ?auto_397191 ) ) ( not ( = ?auto_397189 ?auto_397192 ) ) ( not ( = ?auto_397190 ?auto_397191 ) ) ( not ( = ?auto_397190 ?auto_397192 ) ) ( not ( = ?auto_397191 ?auto_397192 ) ) ( ON ?auto_397190 ?auto_397191 ) ( ON ?auto_397189 ?auto_397190 ) ( CLEAR ?auto_397189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_397189 )
      ( MAKE-3PILE ?auto_397189 ?auto_397190 ?auto_397191 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_397204 - BLOCK
      ?auto_397205 - BLOCK
      ?auto_397206 - BLOCK
      ?auto_397207 - BLOCK
    )
    :vars
    (
      ?auto_397208 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_397206 ) ( ON ?auto_397207 ?auto_397208 ) ( CLEAR ?auto_397207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_397204 ) ( ON ?auto_397205 ?auto_397204 ) ( ON ?auto_397206 ?auto_397205 ) ( not ( = ?auto_397204 ?auto_397205 ) ) ( not ( = ?auto_397204 ?auto_397206 ) ) ( not ( = ?auto_397204 ?auto_397207 ) ) ( not ( = ?auto_397204 ?auto_397208 ) ) ( not ( = ?auto_397205 ?auto_397206 ) ) ( not ( = ?auto_397205 ?auto_397207 ) ) ( not ( = ?auto_397205 ?auto_397208 ) ) ( not ( = ?auto_397206 ?auto_397207 ) ) ( not ( = ?auto_397206 ?auto_397208 ) ) ( not ( = ?auto_397207 ?auto_397208 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_397207 ?auto_397208 )
      ( !STACK ?auto_397207 ?auto_397206 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_397222 - BLOCK
      ?auto_397223 - BLOCK
      ?auto_397224 - BLOCK
      ?auto_397225 - BLOCK
    )
    :vars
    (
      ?auto_397226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397225 ?auto_397226 ) ( ON-TABLE ?auto_397222 ) ( ON ?auto_397223 ?auto_397222 ) ( not ( = ?auto_397222 ?auto_397223 ) ) ( not ( = ?auto_397222 ?auto_397224 ) ) ( not ( = ?auto_397222 ?auto_397225 ) ) ( not ( = ?auto_397222 ?auto_397226 ) ) ( not ( = ?auto_397223 ?auto_397224 ) ) ( not ( = ?auto_397223 ?auto_397225 ) ) ( not ( = ?auto_397223 ?auto_397226 ) ) ( not ( = ?auto_397224 ?auto_397225 ) ) ( not ( = ?auto_397224 ?auto_397226 ) ) ( not ( = ?auto_397225 ?auto_397226 ) ) ( CLEAR ?auto_397223 ) ( ON ?auto_397224 ?auto_397225 ) ( CLEAR ?auto_397224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_397222 ?auto_397223 ?auto_397224 )
      ( MAKE-4PILE ?auto_397222 ?auto_397223 ?auto_397224 ?auto_397225 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_397240 - BLOCK
      ?auto_397241 - BLOCK
      ?auto_397242 - BLOCK
      ?auto_397243 - BLOCK
    )
    :vars
    (
      ?auto_397244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397243 ?auto_397244 ) ( ON-TABLE ?auto_397240 ) ( not ( = ?auto_397240 ?auto_397241 ) ) ( not ( = ?auto_397240 ?auto_397242 ) ) ( not ( = ?auto_397240 ?auto_397243 ) ) ( not ( = ?auto_397240 ?auto_397244 ) ) ( not ( = ?auto_397241 ?auto_397242 ) ) ( not ( = ?auto_397241 ?auto_397243 ) ) ( not ( = ?auto_397241 ?auto_397244 ) ) ( not ( = ?auto_397242 ?auto_397243 ) ) ( not ( = ?auto_397242 ?auto_397244 ) ) ( not ( = ?auto_397243 ?auto_397244 ) ) ( ON ?auto_397242 ?auto_397243 ) ( CLEAR ?auto_397240 ) ( ON ?auto_397241 ?auto_397242 ) ( CLEAR ?auto_397241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_397240 ?auto_397241 )
      ( MAKE-4PILE ?auto_397240 ?auto_397241 ?auto_397242 ?auto_397243 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_397258 - BLOCK
      ?auto_397259 - BLOCK
      ?auto_397260 - BLOCK
      ?auto_397261 - BLOCK
    )
    :vars
    (
      ?auto_397262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397261 ?auto_397262 ) ( not ( = ?auto_397258 ?auto_397259 ) ) ( not ( = ?auto_397258 ?auto_397260 ) ) ( not ( = ?auto_397258 ?auto_397261 ) ) ( not ( = ?auto_397258 ?auto_397262 ) ) ( not ( = ?auto_397259 ?auto_397260 ) ) ( not ( = ?auto_397259 ?auto_397261 ) ) ( not ( = ?auto_397259 ?auto_397262 ) ) ( not ( = ?auto_397260 ?auto_397261 ) ) ( not ( = ?auto_397260 ?auto_397262 ) ) ( not ( = ?auto_397261 ?auto_397262 ) ) ( ON ?auto_397260 ?auto_397261 ) ( ON ?auto_397259 ?auto_397260 ) ( ON ?auto_397258 ?auto_397259 ) ( CLEAR ?auto_397258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_397258 )
      ( MAKE-4PILE ?auto_397258 ?auto_397259 ?auto_397260 ?auto_397261 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_397277 - BLOCK
      ?auto_397278 - BLOCK
      ?auto_397279 - BLOCK
      ?auto_397280 - BLOCK
      ?auto_397281 - BLOCK
    )
    :vars
    (
      ?auto_397282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_397280 ) ( ON ?auto_397281 ?auto_397282 ) ( CLEAR ?auto_397281 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_397277 ) ( ON ?auto_397278 ?auto_397277 ) ( ON ?auto_397279 ?auto_397278 ) ( ON ?auto_397280 ?auto_397279 ) ( not ( = ?auto_397277 ?auto_397278 ) ) ( not ( = ?auto_397277 ?auto_397279 ) ) ( not ( = ?auto_397277 ?auto_397280 ) ) ( not ( = ?auto_397277 ?auto_397281 ) ) ( not ( = ?auto_397277 ?auto_397282 ) ) ( not ( = ?auto_397278 ?auto_397279 ) ) ( not ( = ?auto_397278 ?auto_397280 ) ) ( not ( = ?auto_397278 ?auto_397281 ) ) ( not ( = ?auto_397278 ?auto_397282 ) ) ( not ( = ?auto_397279 ?auto_397280 ) ) ( not ( = ?auto_397279 ?auto_397281 ) ) ( not ( = ?auto_397279 ?auto_397282 ) ) ( not ( = ?auto_397280 ?auto_397281 ) ) ( not ( = ?auto_397280 ?auto_397282 ) ) ( not ( = ?auto_397281 ?auto_397282 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_397281 ?auto_397282 )
      ( !STACK ?auto_397281 ?auto_397280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_397299 - BLOCK
      ?auto_397300 - BLOCK
      ?auto_397301 - BLOCK
      ?auto_397302 - BLOCK
      ?auto_397303 - BLOCK
    )
    :vars
    (
      ?auto_397304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397303 ?auto_397304 ) ( ON-TABLE ?auto_397299 ) ( ON ?auto_397300 ?auto_397299 ) ( ON ?auto_397301 ?auto_397300 ) ( not ( = ?auto_397299 ?auto_397300 ) ) ( not ( = ?auto_397299 ?auto_397301 ) ) ( not ( = ?auto_397299 ?auto_397302 ) ) ( not ( = ?auto_397299 ?auto_397303 ) ) ( not ( = ?auto_397299 ?auto_397304 ) ) ( not ( = ?auto_397300 ?auto_397301 ) ) ( not ( = ?auto_397300 ?auto_397302 ) ) ( not ( = ?auto_397300 ?auto_397303 ) ) ( not ( = ?auto_397300 ?auto_397304 ) ) ( not ( = ?auto_397301 ?auto_397302 ) ) ( not ( = ?auto_397301 ?auto_397303 ) ) ( not ( = ?auto_397301 ?auto_397304 ) ) ( not ( = ?auto_397302 ?auto_397303 ) ) ( not ( = ?auto_397302 ?auto_397304 ) ) ( not ( = ?auto_397303 ?auto_397304 ) ) ( CLEAR ?auto_397301 ) ( ON ?auto_397302 ?auto_397303 ) ( CLEAR ?auto_397302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_397299 ?auto_397300 ?auto_397301 ?auto_397302 )
      ( MAKE-5PILE ?auto_397299 ?auto_397300 ?auto_397301 ?auto_397302 ?auto_397303 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_397321 - BLOCK
      ?auto_397322 - BLOCK
      ?auto_397323 - BLOCK
      ?auto_397324 - BLOCK
      ?auto_397325 - BLOCK
    )
    :vars
    (
      ?auto_397326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397325 ?auto_397326 ) ( ON-TABLE ?auto_397321 ) ( ON ?auto_397322 ?auto_397321 ) ( not ( = ?auto_397321 ?auto_397322 ) ) ( not ( = ?auto_397321 ?auto_397323 ) ) ( not ( = ?auto_397321 ?auto_397324 ) ) ( not ( = ?auto_397321 ?auto_397325 ) ) ( not ( = ?auto_397321 ?auto_397326 ) ) ( not ( = ?auto_397322 ?auto_397323 ) ) ( not ( = ?auto_397322 ?auto_397324 ) ) ( not ( = ?auto_397322 ?auto_397325 ) ) ( not ( = ?auto_397322 ?auto_397326 ) ) ( not ( = ?auto_397323 ?auto_397324 ) ) ( not ( = ?auto_397323 ?auto_397325 ) ) ( not ( = ?auto_397323 ?auto_397326 ) ) ( not ( = ?auto_397324 ?auto_397325 ) ) ( not ( = ?auto_397324 ?auto_397326 ) ) ( not ( = ?auto_397325 ?auto_397326 ) ) ( ON ?auto_397324 ?auto_397325 ) ( CLEAR ?auto_397322 ) ( ON ?auto_397323 ?auto_397324 ) ( CLEAR ?auto_397323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_397321 ?auto_397322 ?auto_397323 )
      ( MAKE-5PILE ?auto_397321 ?auto_397322 ?auto_397323 ?auto_397324 ?auto_397325 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_397343 - BLOCK
      ?auto_397344 - BLOCK
      ?auto_397345 - BLOCK
      ?auto_397346 - BLOCK
      ?auto_397347 - BLOCK
    )
    :vars
    (
      ?auto_397348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397347 ?auto_397348 ) ( ON-TABLE ?auto_397343 ) ( not ( = ?auto_397343 ?auto_397344 ) ) ( not ( = ?auto_397343 ?auto_397345 ) ) ( not ( = ?auto_397343 ?auto_397346 ) ) ( not ( = ?auto_397343 ?auto_397347 ) ) ( not ( = ?auto_397343 ?auto_397348 ) ) ( not ( = ?auto_397344 ?auto_397345 ) ) ( not ( = ?auto_397344 ?auto_397346 ) ) ( not ( = ?auto_397344 ?auto_397347 ) ) ( not ( = ?auto_397344 ?auto_397348 ) ) ( not ( = ?auto_397345 ?auto_397346 ) ) ( not ( = ?auto_397345 ?auto_397347 ) ) ( not ( = ?auto_397345 ?auto_397348 ) ) ( not ( = ?auto_397346 ?auto_397347 ) ) ( not ( = ?auto_397346 ?auto_397348 ) ) ( not ( = ?auto_397347 ?auto_397348 ) ) ( ON ?auto_397346 ?auto_397347 ) ( ON ?auto_397345 ?auto_397346 ) ( CLEAR ?auto_397343 ) ( ON ?auto_397344 ?auto_397345 ) ( CLEAR ?auto_397344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_397343 ?auto_397344 )
      ( MAKE-5PILE ?auto_397343 ?auto_397344 ?auto_397345 ?auto_397346 ?auto_397347 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_397365 - BLOCK
      ?auto_397366 - BLOCK
      ?auto_397367 - BLOCK
      ?auto_397368 - BLOCK
      ?auto_397369 - BLOCK
    )
    :vars
    (
      ?auto_397370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397369 ?auto_397370 ) ( not ( = ?auto_397365 ?auto_397366 ) ) ( not ( = ?auto_397365 ?auto_397367 ) ) ( not ( = ?auto_397365 ?auto_397368 ) ) ( not ( = ?auto_397365 ?auto_397369 ) ) ( not ( = ?auto_397365 ?auto_397370 ) ) ( not ( = ?auto_397366 ?auto_397367 ) ) ( not ( = ?auto_397366 ?auto_397368 ) ) ( not ( = ?auto_397366 ?auto_397369 ) ) ( not ( = ?auto_397366 ?auto_397370 ) ) ( not ( = ?auto_397367 ?auto_397368 ) ) ( not ( = ?auto_397367 ?auto_397369 ) ) ( not ( = ?auto_397367 ?auto_397370 ) ) ( not ( = ?auto_397368 ?auto_397369 ) ) ( not ( = ?auto_397368 ?auto_397370 ) ) ( not ( = ?auto_397369 ?auto_397370 ) ) ( ON ?auto_397368 ?auto_397369 ) ( ON ?auto_397367 ?auto_397368 ) ( ON ?auto_397366 ?auto_397367 ) ( ON ?auto_397365 ?auto_397366 ) ( CLEAR ?auto_397365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_397365 )
      ( MAKE-5PILE ?auto_397365 ?auto_397366 ?auto_397367 ?auto_397368 ?auto_397369 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_397388 - BLOCK
      ?auto_397389 - BLOCK
      ?auto_397390 - BLOCK
      ?auto_397391 - BLOCK
      ?auto_397392 - BLOCK
      ?auto_397393 - BLOCK
    )
    :vars
    (
      ?auto_397394 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_397392 ) ( ON ?auto_397393 ?auto_397394 ) ( CLEAR ?auto_397393 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_397388 ) ( ON ?auto_397389 ?auto_397388 ) ( ON ?auto_397390 ?auto_397389 ) ( ON ?auto_397391 ?auto_397390 ) ( ON ?auto_397392 ?auto_397391 ) ( not ( = ?auto_397388 ?auto_397389 ) ) ( not ( = ?auto_397388 ?auto_397390 ) ) ( not ( = ?auto_397388 ?auto_397391 ) ) ( not ( = ?auto_397388 ?auto_397392 ) ) ( not ( = ?auto_397388 ?auto_397393 ) ) ( not ( = ?auto_397388 ?auto_397394 ) ) ( not ( = ?auto_397389 ?auto_397390 ) ) ( not ( = ?auto_397389 ?auto_397391 ) ) ( not ( = ?auto_397389 ?auto_397392 ) ) ( not ( = ?auto_397389 ?auto_397393 ) ) ( not ( = ?auto_397389 ?auto_397394 ) ) ( not ( = ?auto_397390 ?auto_397391 ) ) ( not ( = ?auto_397390 ?auto_397392 ) ) ( not ( = ?auto_397390 ?auto_397393 ) ) ( not ( = ?auto_397390 ?auto_397394 ) ) ( not ( = ?auto_397391 ?auto_397392 ) ) ( not ( = ?auto_397391 ?auto_397393 ) ) ( not ( = ?auto_397391 ?auto_397394 ) ) ( not ( = ?auto_397392 ?auto_397393 ) ) ( not ( = ?auto_397392 ?auto_397394 ) ) ( not ( = ?auto_397393 ?auto_397394 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_397393 ?auto_397394 )
      ( !STACK ?auto_397393 ?auto_397392 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_397414 - BLOCK
      ?auto_397415 - BLOCK
      ?auto_397416 - BLOCK
      ?auto_397417 - BLOCK
      ?auto_397418 - BLOCK
      ?auto_397419 - BLOCK
    )
    :vars
    (
      ?auto_397420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397419 ?auto_397420 ) ( ON-TABLE ?auto_397414 ) ( ON ?auto_397415 ?auto_397414 ) ( ON ?auto_397416 ?auto_397415 ) ( ON ?auto_397417 ?auto_397416 ) ( not ( = ?auto_397414 ?auto_397415 ) ) ( not ( = ?auto_397414 ?auto_397416 ) ) ( not ( = ?auto_397414 ?auto_397417 ) ) ( not ( = ?auto_397414 ?auto_397418 ) ) ( not ( = ?auto_397414 ?auto_397419 ) ) ( not ( = ?auto_397414 ?auto_397420 ) ) ( not ( = ?auto_397415 ?auto_397416 ) ) ( not ( = ?auto_397415 ?auto_397417 ) ) ( not ( = ?auto_397415 ?auto_397418 ) ) ( not ( = ?auto_397415 ?auto_397419 ) ) ( not ( = ?auto_397415 ?auto_397420 ) ) ( not ( = ?auto_397416 ?auto_397417 ) ) ( not ( = ?auto_397416 ?auto_397418 ) ) ( not ( = ?auto_397416 ?auto_397419 ) ) ( not ( = ?auto_397416 ?auto_397420 ) ) ( not ( = ?auto_397417 ?auto_397418 ) ) ( not ( = ?auto_397417 ?auto_397419 ) ) ( not ( = ?auto_397417 ?auto_397420 ) ) ( not ( = ?auto_397418 ?auto_397419 ) ) ( not ( = ?auto_397418 ?auto_397420 ) ) ( not ( = ?auto_397419 ?auto_397420 ) ) ( CLEAR ?auto_397417 ) ( ON ?auto_397418 ?auto_397419 ) ( CLEAR ?auto_397418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_397414 ?auto_397415 ?auto_397416 ?auto_397417 ?auto_397418 )
      ( MAKE-6PILE ?auto_397414 ?auto_397415 ?auto_397416 ?auto_397417 ?auto_397418 ?auto_397419 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_397440 - BLOCK
      ?auto_397441 - BLOCK
      ?auto_397442 - BLOCK
      ?auto_397443 - BLOCK
      ?auto_397444 - BLOCK
      ?auto_397445 - BLOCK
    )
    :vars
    (
      ?auto_397446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397445 ?auto_397446 ) ( ON-TABLE ?auto_397440 ) ( ON ?auto_397441 ?auto_397440 ) ( ON ?auto_397442 ?auto_397441 ) ( not ( = ?auto_397440 ?auto_397441 ) ) ( not ( = ?auto_397440 ?auto_397442 ) ) ( not ( = ?auto_397440 ?auto_397443 ) ) ( not ( = ?auto_397440 ?auto_397444 ) ) ( not ( = ?auto_397440 ?auto_397445 ) ) ( not ( = ?auto_397440 ?auto_397446 ) ) ( not ( = ?auto_397441 ?auto_397442 ) ) ( not ( = ?auto_397441 ?auto_397443 ) ) ( not ( = ?auto_397441 ?auto_397444 ) ) ( not ( = ?auto_397441 ?auto_397445 ) ) ( not ( = ?auto_397441 ?auto_397446 ) ) ( not ( = ?auto_397442 ?auto_397443 ) ) ( not ( = ?auto_397442 ?auto_397444 ) ) ( not ( = ?auto_397442 ?auto_397445 ) ) ( not ( = ?auto_397442 ?auto_397446 ) ) ( not ( = ?auto_397443 ?auto_397444 ) ) ( not ( = ?auto_397443 ?auto_397445 ) ) ( not ( = ?auto_397443 ?auto_397446 ) ) ( not ( = ?auto_397444 ?auto_397445 ) ) ( not ( = ?auto_397444 ?auto_397446 ) ) ( not ( = ?auto_397445 ?auto_397446 ) ) ( ON ?auto_397444 ?auto_397445 ) ( CLEAR ?auto_397442 ) ( ON ?auto_397443 ?auto_397444 ) ( CLEAR ?auto_397443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_397440 ?auto_397441 ?auto_397442 ?auto_397443 )
      ( MAKE-6PILE ?auto_397440 ?auto_397441 ?auto_397442 ?auto_397443 ?auto_397444 ?auto_397445 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_397466 - BLOCK
      ?auto_397467 - BLOCK
      ?auto_397468 - BLOCK
      ?auto_397469 - BLOCK
      ?auto_397470 - BLOCK
      ?auto_397471 - BLOCK
    )
    :vars
    (
      ?auto_397472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397471 ?auto_397472 ) ( ON-TABLE ?auto_397466 ) ( ON ?auto_397467 ?auto_397466 ) ( not ( = ?auto_397466 ?auto_397467 ) ) ( not ( = ?auto_397466 ?auto_397468 ) ) ( not ( = ?auto_397466 ?auto_397469 ) ) ( not ( = ?auto_397466 ?auto_397470 ) ) ( not ( = ?auto_397466 ?auto_397471 ) ) ( not ( = ?auto_397466 ?auto_397472 ) ) ( not ( = ?auto_397467 ?auto_397468 ) ) ( not ( = ?auto_397467 ?auto_397469 ) ) ( not ( = ?auto_397467 ?auto_397470 ) ) ( not ( = ?auto_397467 ?auto_397471 ) ) ( not ( = ?auto_397467 ?auto_397472 ) ) ( not ( = ?auto_397468 ?auto_397469 ) ) ( not ( = ?auto_397468 ?auto_397470 ) ) ( not ( = ?auto_397468 ?auto_397471 ) ) ( not ( = ?auto_397468 ?auto_397472 ) ) ( not ( = ?auto_397469 ?auto_397470 ) ) ( not ( = ?auto_397469 ?auto_397471 ) ) ( not ( = ?auto_397469 ?auto_397472 ) ) ( not ( = ?auto_397470 ?auto_397471 ) ) ( not ( = ?auto_397470 ?auto_397472 ) ) ( not ( = ?auto_397471 ?auto_397472 ) ) ( ON ?auto_397470 ?auto_397471 ) ( ON ?auto_397469 ?auto_397470 ) ( CLEAR ?auto_397467 ) ( ON ?auto_397468 ?auto_397469 ) ( CLEAR ?auto_397468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_397466 ?auto_397467 ?auto_397468 )
      ( MAKE-6PILE ?auto_397466 ?auto_397467 ?auto_397468 ?auto_397469 ?auto_397470 ?auto_397471 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_397492 - BLOCK
      ?auto_397493 - BLOCK
      ?auto_397494 - BLOCK
      ?auto_397495 - BLOCK
      ?auto_397496 - BLOCK
      ?auto_397497 - BLOCK
    )
    :vars
    (
      ?auto_397498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397497 ?auto_397498 ) ( ON-TABLE ?auto_397492 ) ( not ( = ?auto_397492 ?auto_397493 ) ) ( not ( = ?auto_397492 ?auto_397494 ) ) ( not ( = ?auto_397492 ?auto_397495 ) ) ( not ( = ?auto_397492 ?auto_397496 ) ) ( not ( = ?auto_397492 ?auto_397497 ) ) ( not ( = ?auto_397492 ?auto_397498 ) ) ( not ( = ?auto_397493 ?auto_397494 ) ) ( not ( = ?auto_397493 ?auto_397495 ) ) ( not ( = ?auto_397493 ?auto_397496 ) ) ( not ( = ?auto_397493 ?auto_397497 ) ) ( not ( = ?auto_397493 ?auto_397498 ) ) ( not ( = ?auto_397494 ?auto_397495 ) ) ( not ( = ?auto_397494 ?auto_397496 ) ) ( not ( = ?auto_397494 ?auto_397497 ) ) ( not ( = ?auto_397494 ?auto_397498 ) ) ( not ( = ?auto_397495 ?auto_397496 ) ) ( not ( = ?auto_397495 ?auto_397497 ) ) ( not ( = ?auto_397495 ?auto_397498 ) ) ( not ( = ?auto_397496 ?auto_397497 ) ) ( not ( = ?auto_397496 ?auto_397498 ) ) ( not ( = ?auto_397497 ?auto_397498 ) ) ( ON ?auto_397496 ?auto_397497 ) ( ON ?auto_397495 ?auto_397496 ) ( ON ?auto_397494 ?auto_397495 ) ( CLEAR ?auto_397492 ) ( ON ?auto_397493 ?auto_397494 ) ( CLEAR ?auto_397493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_397492 ?auto_397493 )
      ( MAKE-6PILE ?auto_397492 ?auto_397493 ?auto_397494 ?auto_397495 ?auto_397496 ?auto_397497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_397518 - BLOCK
      ?auto_397519 - BLOCK
      ?auto_397520 - BLOCK
      ?auto_397521 - BLOCK
      ?auto_397522 - BLOCK
      ?auto_397523 - BLOCK
    )
    :vars
    (
      ?auto_397524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397523 ?auto_397524 ) ( not ( = ?auto_397518 ?auto_397519 ) ) ( not ( = ?auto_397518 ?auto_397520 ) ) ( not ( = ?auto_397518 ?auto_397521 ) ) ( not ( = ?auto_397518 ?auto_397522 ) ) ( not ( = ?auto_397518 ?auto_397523 ) ) ( not ( = ?auto_397518 ?auto_397524 ) ) ( not ( = ?auto_397519 ?auto_397520 ) ) ( not ( = ?auto_397519 ?auto_397521 ) ) ( not ( = ?auto_397519 ?auto_397522 ) ) ( not ( = ?auto_397519 ?auto_397523 ) ) ( not ( = ?auto_397519 ?auto_397524 ) ) ( not ( = ?auto_397520 ?auto_397521 ) ) ( not ( = ?auto_397520 ?auto_397522 ) ) ( not ( = ?auto_397520 ?auto_397523 ) ) ( not ( = ?auto_397520 ?auto_397524 ) ) ( not ( = ?auto_397521 ?auto_397522 ) ) ( not ( = ?auto_397521 ?auto_397523 ) ) ( not ( = ?auto_397521 ?auto_397524 ) ) ( not ( = ?auto_397522 ?auto_397523 ) ) ( not ( = ?auto_397522 ?auto_397524 ) ) ( not ( = ?auto_397523 ?auto_397524 ) ) ( ON ?auto_397522 ?auto_397523 ) ( ON ?auto_397521 ?auto_397522 ) ( ON ?auto_397520 ?auto_397521 ) ( ON ?auto_397519 ?auto_397520 ) ( ON ?auto_397518 ?auto_397519 ) ( CLEAR ?auto_397518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_397518 )
      ( MAKE-6PILE ?auto_397518 ?auto_397519 ?auto_397520 ?auto_397521 ?auto_397522 ?auto_397523 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_397545 - BLOCK
      ?auto_397546 - BLOCK
      ?auto_397547 - BLOCK
      ?auto_397548 - BLOCK
      ?auto_397549 - BLOCK
      ?auto_397550 - BLOCK
      ?auto_397551 - BLOCK
    )
    :vars
    (
      ?auto_397552 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_397550 ) ( ON ?auto_397551 ?auto_397552 ) ( CLEAR ?auto_397551 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_397545 ) ( ON ?auto_397546 ?auto_397545 ) ( ON ?auto_397547 ?auto_397546 ) ( ON ?auto_397548 ?auto_397547 ) ( ON ?auto_397549 ?auto_397548 ) ( ON ?auto_397550 ?auto_397549 ) ( not ( = ?auto_397545 ?auto_397546 ) ) ( not ( = ?auto_397545 ?auto_397547 ) ) ( not ( = ?auto_397545 ?auto_397548 ) ) ( not ( = ?auto_397545 ?auto_397549 ) ) ( not ( = ?auto_397545 ?auto_397550 ) ) ( not ( = ?auto_397545 ?auto_397551 ) ) ( not ( = ?auto_397545 ?auto_397552 ) ) ( not ( = ?auto_397546 ?auto_397547 ) ) ( not ( = ?auto_397546 ?auto_397548 ) ) ( not ( = ?auto_397546 ?auto_397549 ) ) ( not ( = ?auto_397546 ?auto_397550 ) ) ( not ( = ?auto_397546 ?auto_397551 ) ) ( not ( = ?auto_397546 ?auto_397552 ) ) ( not ( = ?auto_397547 ?auto_397548 ) ) ( not ( = ?auto_397547 ?auto_397549 ) ) ( not ( = ?auto_397547 ?auto_397550 ) ) ( not ( = ?auto_397547 ?auto_397551 ) ) ( not ( = ?auto_397547 ?auto_397552 ) ) ( not ( = ?auto_397548 ?auto_397549 ) ) ( not ( = ?auto_397548 ?auto_397550 ) ) ( not ( = ?auto_397548 ?auto_397551 ) ) ( not ( = ?auto_397548 ?auto_397552 ) ) ( not ( = ?auto_397549 ?auto_397550 ) ) ( not ( = ?auto_397549 ?auto_397551 ) ) ( not ( = ?auto_397549 ?auto_397552 ) ) ( not ( = ?auto_397550 ?auto_397551 ) ) ( not ( = ?auto_397550 ?auto_397552 ) ) ( not ( = ?auto_397551 ?auto_397552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_397551 ?auto_397552 )
      ( !STACK ?auto_397551 ?auto_397550 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_397575 - BLOCK
      ?auto_397576 - BLOCK
      ?auto_397577 - BLOCK
      ?auto_397578 - BLOCK
      ?auto_397579 - BLOCK
      ?auto_397580 - BLOCK
      ?auto_397581 - BLOCK
    )
    :vars
    (
      ?auto_397582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397581 ?auto_397582 ) ( ON-TABLE ?auto_397575 ) ( ON ?auto_397576 ?auto_397575 ) ( ON ?auto_397577 ?auto_397576 ) ( ON ?auto_397578 ?auto_397577 ) ( ON ?auto_397579 ?auto_397578 ) ( not ( = ?auto_397575 ?auto_397576 ) ) ( not ( = ?auto_397575 ?auto_397577 ) ) ( not ( = ?auto_397575 ?auto_397578 ) ) ( not ( = ?auto_397575 ?auto_397579 ) ) ( not ( = ?auto_397575 ?auto_397580 ) ) ( not ( = ?auto_397575 ?auto_397581 ) ) ( not ( = ?auto_397575 ?auto_397582 ) ) ( not ( = ?auto_397576 ?auto_397577 ) ) ( not ( = ?auto_397576 ?auto_397578 ) ) ( not ( = ?auto_397576 ?auto_397579 ) ) ( not ( = ?auto_397576 ?auto_397580 ) ) ( not ( = ?auto_397576 ?auto_397581 ) ) ( not ( = ?auto_397576 ?auto_397582 ) ) ( not ( = ?auto_397577 ?auto_397578 ) ) ( not ( = ?auto_397577 ?auto_397579 ) ) ( not ( = ?auto_397577 ?auto_397580 ) ) ( not ( = ?auto_397577 ?auto_397581 ) ) ( not ( = ?auto_397577 ?auto_397582 ) ) ( not ( = ?auto_397578 ?auto_397579 ) ) ( not ( = ?auto_397578 ?auto_397580 ) ) ( not ( = ?auto_397578 ?auto_397581 ) ) ( not ( = ?auto_397578 ?auto_397582 ) ) ( not ( = ?auto_397579 ?auto_397580 ) ) ( not ( = ?auto_397579 ?auto_397581 ) ) ( not ( = ?auto_397579 ?auto_397582 ) ) ( not ( = ?auto_397580 ?auto_397581 ) ) ( not ( = ?auto_397580 ?auto_397582 ) ) ( not ( = ?auto_397581 ?auto_397582 ) ) ( CLEAR ?auto_397579 ) ( ON ?auto_397580 ?auto_397581 ) ( CLEAR ?auto_397580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_397575 ?auto_397576 ?auto_397577 ?auto_397578 ?auto_397579 ?auto_397580 )
      ( MAKE-7PILE ?auto_397575 ?auto_397576 ?auto_397577 ?auto_397578 ?auto_397579 ?auto_397580 ?auto_397581 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_397605 - BLOCK
      ?auto_397606 - BLOCK
      ?auto_397607 - BLOCK
      ?auto_397608 - BLOCK
      ?auto_397609 - BLOCK
      ?auto_397610 - BLOCK
      ?auto_397611 - BLOCK
    )
    :vars
    (
      ?auto_397612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397611 ?auto_397612 ) ( ON-TABLE ?auto_397605 ) ( ON ?auto_397606 ?auto_397605 ) ( ON ?auto_397607 ?auto_397606 ) ( ON ?auto_397608 ?auto_397607 ) ( not ( = ?auto_397605 ?auto_397606 ) ) ( not ( = ?auto_397605 ?auto_397607 ) ) ( not ( = ?auto_397605 ?auto_397608 ) ) ( not ( = ?auto_397605 ?auto_397609 ) ) ( not ( = ?auto_397605 ?auto_397610 ) ) ( not ( = ?auto_397605 ?auto_397611 ) ) ( not ( = ?auto_397605 ?auto_397612 ) ) ( not ( = ?auto_397606 ?auto_397607 ) ) ( not ( = ?auto_397606 ?auto_397608 ) ) ( not ( = ?auto_397606 ?auto_397609 ) ) ( not ( = ?auto_397606 ?auto_397610 ) ) ( not ( = ?auto_397606 ?auto_397611 ) ) ( not ( = ?auto_397606 ?auto_397612 ) ) ( not ( = ?auto_397607 ?auto_397608 ) ) ( not ( = ?auto_397607 ?auto_397609 ) ) ( not ( = ?auto_397607 ?auto_397610 ) ) ( not ( = ?auto_397607 ?auto_397611 ) ) ( not ( = ?auto_397607 ?auto_397612 ) ) ( not ( = ?auto_397608 ?auto_397609 ) ) ( not ( = ?auto_397608 ?auto_397610 ) ) ( not ( = ?auto_397608 ?auto_397611 ) ) ( not ( = ?auto_397608 ?auto_397612 ) ) ( not ( = ?auto_397609 ?auto_397610 ) ) ( not ( = ?auto_397609 ?auto_397611 ) ) ( not ( = ?auto_397609 ?auto_397612 ) ) ( not ( = ?auto_397610 ?auto_397611 ) ) ( not ( = ?auto_397610 ?auto_397612 ) ) ( not ( = ?auto_397611 ?auto_397612 ) ) ( ON ?auto_397610 ?auto_397611 ) ( CLEAR ?auto_397608 ) ( ON ?auto_397609 ?auto_397610 ) ( CLEAR ?auto_397609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_397605 ?auto_397606 ?auto_397607 ?auto_397608 ?auto_397609 )
      ( MAKE-7PILE ?auto_397605 ?auto_397606 ?auto_397607 ?auto_397608 ?auto_397609 ?auto_397610 ?auto_397611 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_397635 - BLOCK
      ?auto_397636 - BLOCK
      ?auto_397637 - BLOCK
      ?auto_397638 - BLOCK
      ?auto_397639 - BLOCK
      ?auto_397640 - BLOCK
      ?auto_397641 - BLOCK
    )
    :vars
    (
      ?auto_397642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397641 ?auto_397642 ) ( ON-TABLE ?auto_397635 ) ( ON ?auto_397636 ?auto_397635 ) ( ON ?auto_397637 ?auto_397636 ) ( not ( = ?auto_397635 ?auto_397636 ) ) ( not ( = ?auto_397635 ?auto_397637 ) ) ( not ( = ?auto_397635 ?auto_397638 ) ) ( not ( = ?auto_397635 ?auto_397639 ) ) ( not ( = ?auto_397635 ?auto_397640 ) ) ( not ( = ?auto_397635 ?auto_397641 ) ) ( not ( = ?auto_397635 ?auto_397642 ) ) ( not ( = ?auto_397636 ?auto_397637 ) ) ( not ( = ?auto_397636 ?auto_397638 ) ) ( not ( = ?auto_397636 ?auto_397639 ) ) ( not ( = ?auto_397636 ?auto_397640 ) ) ( not ( = ?auto_397636 ?auto_397641 ) ) ( not ( = ?auto_397636 ?auto_397642 ) ) ( not ( = ?auto_397637 ?auto_397638 ) ) ( not ( = ?auto_397637 ?auto_397639 ) ) ( not ( = ?auto_397637 ?auto_397640 ) ) ( not ( = ?auto_397637 ?auto_397641 ) ) ( not ( = ?auto_397637 ?auto_397642 ) ) ( not ( = ?auto_397638 ?auto_397639 ) ) ( not ( = ?auto_397638 ?auto_397640 ) ) ( not ( = ?auto_397638 ?auto_397641 ) ) ( not ( = ?auto_397638 ?auto_397642 ) ) ( not ( = ?auto_397639 ?auto_397640 ) ) ( not ( = ?auto_397639 ?auto_397641 ) ) ( not ( = ?auto_397639 ?auto_397642 ) ) ( not ( = ?auto_397640 ?auto_397641 ) ) ( not ( = ?auto_397640 ?auto_397642 ) ) ( not ( = ?auto_397641 ?auto_397642 ) ) ( ON ?auto_397640 ?auto_397641 ) ( ON ?auto_397639 ?auto_397640 ) ( CLEAR ?auto_397637 ) ( ON ?auto_397638 ?auto_397639 ) ( CLEAR ?auto_397638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_397635 ?auto_397636 ?auto_397637 ?auto_397638 )
      ( MAKE-7PILE ?auto_397635 ?auto_397636 ?auto_397637 ?auto_397638 ?auto_397639 ?auto_397640 ?auto_397641 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_397665 - BLOCK
      ?auto_397666 - BLOCK
      ?auto_397667 - BLOCK
      ?auto_397668 - BLOCK
      ?auto_397669 - BLOCK
      ?auto_397670 - BLOCK
      ?auto_397671 - BLOCK
    )
    :vars
    (
      ?auto_397672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397671 ?auto_397672 ) ( ON-TABLE ?auto_397665 ) ( ON ?auto_397666 ?auto_397665 ) ( not ( = ?auto_397665 ?auto_397666 ) ) ( not ( = ?auto_397665 ?auto_397667 ) ) ( not ( = ?auto_397665 ?auto_397668 ) ) ( not ( = ?auto_397665 ?auto_397669 ) ) ( not ( = ?auto_397665 ?auto_397670 ) ) ( not ( = ?auto_397665 ?auto_397671 ) ) ( not ( = ?auto_397665 ?auto_397672 ) ) ( not ( = ?auto_397666 ?auto_397667 ) ) ( not ( = ?auto_397666 ?auto_397668 ) ) ( not ( = ?auto_397666 ?auto_397669 ) ) ( not ( = ?auto_397666 ?auto_397670 ) ) ( not ( = ?auto_397666 ?auto_397671 ) ) ( not ( = ?auto_397666 ?auto_397672 ) ) ( not ( = ?auto_397667 ?auto_397668 ) ) ( not ( = ?auto_397667 ?auto_397669 ) ) ( not ( = ?auto_397667 ?auto_397670 ) ) ( not ( = ?auto_397667 ?auto_397671 ) ) ( not ( = ?auto_397667 ?auto_397672 ) ) ( not ( = ?auto_397668 ?auto_397669 ) ) ( not ( = ?auto_397668 ?auto_397670 ) ) ( not ( = ?auto_397668 ?auto_397671 ) ) ( not ( = ?auto_397668 ?auto_397672 ) ) ( not ( = ?auto_397669 ?auto_397670 ) ) ( not ( = ?auto_397669 ?auto_397671 ) ) ( not ( = ?auto_397669 ?auto_397672 ) ) ( not ( = ?auto_397670 ?auto_397671 ) ) ( not ( = ?auto_397670 ?auto_397672 ) ) ( not ( = ?auto_397671 ?auto_397672 ) ) ( ON ?auto_397670 ?auto_397671 ) ( ON ?auto_397669 ?auto_397670 ) ( ON ?auto_397668 ?auto_397669 ) ( CLEAR ?auto_397666 ) ( ON ?auto_397667 ?auto_397668 ) ( CLEAR ?auto_397667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_397665 ?auto_397666 ?auto_397667 )
      ( MAKE-7PILE ?auto_397665 ?auto_397666 ?auto_397667 ?auto_397668 ?auto_397669 ?auto_397670 ?auto_397671 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_397695 - BLOCK
      ?auto_397696 - BLOCK
      ?auto_397697 - BLOCK
      ?auto_397698 - BLOCK
      ?auto_397699 - BLOCK
      ?auto_397700 - BLOCK
      ?auto_397701 - BLOCK
    )
    :vars
    (
      ?auto_397702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397701 ?auto_397702 ) ( ON-TABLE ?auto_397695 ) ( not ( = ?auto_397695 ?auto_397696 ) ) ( not ( = ?auto_397695 ?auto_397697 ) ) ( not ( = ?auto_397695 ?auto_397698 ) ) ( not ( = ?auto_397695 ?auto_397699 ) ) ( not ( = ?auto_397695 ?auto_397700 ) ) ( not ( = ?auto_397695 ?auto_397701 ) ) ( not ( = ?auto_397695 ?auto_397702 ) ) ( not ( = ?auto_397696 ?auto_397697 ) ) ( not ( = ?auto_397696 ?auto_397698 ) ) ( not ( = ?auto_397696 ?auto_397699 ) ) ( not ( = ?auto_397696 ?auto_397700 ) ) ( not ( = ?auto_397696 ?auto_397701 ) ) ( not ( = ?auto_397696 ?auto_397702 ) ) ( not ( = ?auto_397697 ?auto_397698 ) ) ( not ( = ?auto_397697 ?auto_397699 ) ) ( not ( = ?auto_397697 ?auto_397700 ) ) ( not ( = ?auto_397697 ?auto_397701 ) ) ( not ( = ?auto_397697 ?auto_397702 ) ) ( not ( = ?auto_397698 ?auto_397699 ) ) ( not ( = ?auto_397698 ?auto_397700 ) ) ( not ( = ?auto_397698 ?auto_397701 ) ) ( not ( = ?auto_397698 ?auto_397702 ) ) ( not ( = ?auto_397699 ?auto_397700 ) ) ( not ( = ?auto_397699 ?auto_397701 ) ) ( not ( = ?auto_397699 ?auto_397702 ) ) ( not ( = ?auto_397700 ?auto_397701 ) ) ( not ( = ?auto_397700 ?auto_397702 ) ) ( not ( = ?auto_397701 ?auto_397702 ) ) ( ON ?auto_397700 ?auto_397701 ) ( ON ?auto_397699 ?auto_397700 ) ( ON ?auto_397698 ?auto_397699 ) ( ON ?auto_397697 ?auto_397698 ) ( CLEAR ?auto_397695 ) ( ON ?auto_397696 ?auto_397697 ) ( CLEAR ?auto_397696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_397695 ?auto_397696 )
      ( MAKE-7PILE ?auto_397695 ?auto_397696 ?auto_397697 ?auto_397698 ?auto_397699 ?auto_397700 ?auto_397701 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_397725 - BLOCK
      ?auto_397726 - BLOCK
      ?auto_397727 - BLOCK
      ?auto_397728 - BLOCK
      ?auto_397729 - BLOCK
      ?auto_397730 - BLOCK
      ?auto_397731 - BLOCK
    )
    :vars
    (
      ?auto_397732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397731 ?auto_397732 ) ( not ( = ?auto_397725 ?auto_397726 ) ) ( not ( = ?auto_397725 ?auto_397727 ) ) ( not ( = ?auto_397725 ?auto_397728 ) ) ( not ( = ?auto_397725 ?auto_397729 ) ) ( not ( = ?auto_397725 ?auto_397730 ) ) ( not ( = ?auto_397725 ?auto_397731 ) ) ( not ( = ?auto_397725 ?auto_397732 ) ) ( not ( = ?auto_397726 ?auto_397727 ) ) ( not ( = ?auto_397726 ?auto_397728 ) ) ( not ( = ?auto_397726 ?auto_397729 ) ) ( not ( = ?auto_397726 ?auto_397730 ) ) ( not ( = ?auto_397726 ?auto_397731 ) ) ( not ( = ?auto_397726 ?auto_397732 ) ) ( not ( = ?auto_397727 ?auto_397728 ) ) ( not ( = ?auto_397727 ?auto_397729 ) ) ( not ( = ?auto_397727 ?auto_397730 ) ) ( not ( = ?auto_397727 ?auto_397731 ) ) ( not ( = ?auto_397727 ?auto_397732 ) ) ( not ( = ?auto_397728 ?auto_397729 ) ) ( not ( = ?auto_397728 ?auto_397730 ) ) ( not ( = ?auto_397728 ?auto_397731 ) ) ( not ( = ?auto_397728 ?auto_397732 ) ) ( not ( = ?auto_397729 ?auto_397730 ) ) ( not ( = ?auto_397729 ?auto_397731 ) ) ( not ( = ?auto_397729 ?auto_397732 ) ) ( not ( = ?auto_397730 ?auto_397731 ) ) ( not ( = ?auto_397730 ?auto_397732 ) ) ( not ( = ?auto_397731 ?auto_397732 ) ) ( ON ?auto_397730 ?auto_397731 ) ( ON ?auto_397729 ?auto_397730 ) ( ON ?auto_397728 ?auto_397729 ) ( ON ?auto_397727 ?auto_397728 ) ( ON ?auto_397726 ?auto_397727 ) ( ON ?auto_397725 ?auto_397726 ) ( CLEAR ?auto_397725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_397725 )
      ( MAKE-7PILE ?auto_397725 ?auto_397726 ?auto_397727 ?auto_397728 ?auto_397729 ?auto_397730 ?auto_397731 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_397756 - BLOCK
      ?auto_397757 - BLOCK
      ?auto_397758 - BLOCK
      ?auto_397759 - BLOCK
      ?auto_397760 - BLOCK
      ?auto_397761 - BLOCK
      ?auto_397762 - BLOCK
      ?auto_397763 - BLOCK
    )
    :vars
    (
      ?auto_397764 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_397762 ) ( ON ?auto_397763 ?auto_397764 ) ( CLEAR ?auto_397763 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_397756 ) ( ON ?auto_397757 ?auto_397756 ) ( ON ?auto_397758 ?auto_397757 ) ( ON ?auto_397759 ?auto_397758 ) ( ON ?auto_397760 ?auto_397759 ) ( ON ?auto_397761 ?auto_397760 ) ( ON ?auto_397762 ?auto_397761 ) ( not ( = ?auto_397756 ?auto_397757 ) ) ( not ( = ?auto_397756 ?auto_397758 ) ) ( not ( = ?auto_397756 ?auto_397759 ) ) ( not ( = ?auto_397756 ?auto_397760 ) ) ( not ( = ?auto_397756 ?auto_397761 ) ) ( not ( = ?auto_397756 ?auto_397762 ) ) ( not ( = ?auto_397756 ?auto_397763 ) ) ( not ( = ?auto_397756 ?auto_397764 ) ) ( not ( = ?auto_397757 ?auto_397758 ) ) ( not ( = ?auto_397757 ?auto_397759 ) ) ( not ( = ?auto_397757 ?auto_397760 ) ) ( not ( = ?auto_397757 ?auto_397761 ) ) ( not ( = ?auto_397757 ?auto_397762 ) ) ( not ( = ?auto_397757 ?auto_397763 ) ) ( not ( = ?auto_397757 ?auto_397764 ) ) ( not ( = ?auto_397758 ?auto_397759 ) ) ( not ( = ?auto_397758 ?auto_397760 ) ) ( not ( = ?auto_397758 ?auto_397761 ) ) ( not ( = ?auto_397758 ?auto_397762 ) ) ( not ( = ?auto_397758 ?auto_397763 ) ) ( not ( = ?auto_397758 ?auto_397764 ) ) ( not ( = ?auto_397759 ?auto_397760 ) ) ( not ( = ?auto_397759 ?auto_397761 ) ) ( not ( = ?auto_397759 ?auto_397762 ) ) ( not ( = ?auto_397759 ?auto_397763 ) ) ( not ( = ?auto_397759 ?auto_397764 ) ) ( not ( = ?auto_397760 ?auto_397761 ) ) ( not ( = ?auto_397760 ?auto_397762 ) ) ( not ( = ?auto_397760 ?auto_397763 ) ) ( not ( = ?auto_397760 ?auto_397764 ) ) ( not ( = ?auto_397761 ?auto_397762 ) ) ( not ( = ?auto_397761 ?auto_397763 ) ) ( not ( = ?auto_397761 ?auto_397764 ) ) ( not ( = ?auto_397762 ?auto_397763 ) ) ( not ( = ?auto_397762 ?auto_397764 ) ) ( not ( = ?auto_397763 ?auto_397764 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_397763 ?auto_397764 )
      ( !STACK ?auto_397763 ?auto_397762 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_397790 - BLOCK
      ?auto_397791 - BLOCK
      ?auto_397792 - BLOCK
      ?auto_397793 - BLOCK
      ?auto_397794 - BLOCK
      ?auto_397795 - BLOCK
      ?auto_397796 - BLOCK
      ?auto_397797 - BLOCK
    )
    :vars
    (
      ?auto_397798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397797 ?auto_397798 ) ( ON-TABLE ?auto_397790 ) ( ON ?auto_397791 ?auto_397790 ) ( ON ?auto_397792 ?auto_397791 ) ( ON ?auto_397793 ?auto_397792 ) ( ON ?auto_397794 ?auto_397793 ) ( ON ?auto_397795 ?auto_397794 ) ( not ( = ?auto_397790 ?auto_397791 ) ) ( not ( = ?auto_397790 ?auto_397792 ) ) ( not ( = ?auto_397790 ?auto_397793 ) ) ( not ( = ?auto_397790 ?auto_397794 ) ) ( not ( = ?auto_397790 ?auto_397795 ) ) ( not ( = ?auto_397790 ?auto_397796 ) ) ( not ( = ?auto_397790 ?auto_397797 ) ) ( not ( = ?auto_397790 ?auto_397798 ) ) ( not ( = ?auto_397791 ?auto_397792 ) ) ( not ( = ?auto_397791 ?auto_397793 ) ) ( not ( = ?auto_397791 ?auto_397794 ) ) ( not ( = ?auto_397791 ?auto_397795 ) ) ( not ( = ?auto_397791 ?auto_397796 ) ) ( not ( = ?auto_397791 ?auto_397797 ) ) ( not ( = ?auto_397791 ?auto_397798 ) ) ( not ( = ?auto_397792 ?auto_397793 ) ) ( not ( = ?auto_397792 ?auto_397794 ) ) ( not ( = ?auto_397792 ?auto_397795 ) ) ( not ( = ?auto_397792 ?auto_397796 ) ) ( not ( = ?auto_397792 ?auto_397797 ) ) ( not ( = ?auto_397792 ?auto_397798 ) ) ( not ( = ?auto_397793 ?auto_397794 ) ) ( not ( = ?auto_397793 ?auto_397795 ) ) ( not ( = ?auto_397793 ?auto_397796 ) ) ( not ( = ?auto_397793 ?auto_397797 ) ) ( not ( = ?auto_397793 ?auto_397798 ) ) ( not ( = ?auto_397794 ?auto_397795 ) ) ( not ( = ?auto_397794 ?auto_397796 ) ) ( not ( = ?auto_397794 ?auto_397797 ) ) ( not ( = ?auto_397794 ?auto_397798 ) ) ( not ( = ?auto_397795 ?auto_397796 ) ) ( not ( = ?auto_397795 ?auto_397797 ) ) ( not ( = ?auto_397795 ?auto_397798 ) ) ( not ( = ?auto_397796 ?auto_397797 ) ) ( not ( = ?auto_397796 ?auto_397798 ) ) ( not ( = ?auto_397797 ?auto_397798 ) ) ( CLEAR ?auto_397795 ) ( ON ?auto_397796 ?auto_397797 ) ( CLEAR ?auto_397796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_397790 ?auto_397791 ?auto_397792 ?auto_397793 ?auto_397794 ?auto_397795 ?auto_397796 )
      ( MAKE-8PILE ?auto_397790 ?auto_397791 ?auto_397792 ?auto_397793 ?auto_397794 ?auto_397795 ?auto_397796 ?auto_397797 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_397824 - BLOCK
      ?auto_397825 - BLOCK
      ?auto_397826 - BLOCK
      ?auto_397827 - BLOCK
      ?auto_397828 - BLOCK
      ?auto_397829 - BLOCK
      ?auto_397830 - BLOCK
      ?auto_397831 - BLOCK
    )
    :vars
    (
      ?auto_397832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397831 ?auto_397832 ) ( ON-TABLE ?auto_397824 ) ( ON ?auto_397825 ?auto_397824 ) ( ON ?auto_397826 ?auto_397825 ) ( ON ?auto_397827 ?auto_397826 ) ( ON ?auto_397828 ?auto_397827 ) ( not ( = ?auto_397824 ?auto_397825 ) ) ( not ( = ?auto_397824 ?auto_397826 ) ) ( not ( = ?auto_397824 ?auto_397827 ) ) ( not ( = ?auto_397824 ?auto_397828 ) ) ( not ( = ?auto_397824 ?auto_397829 ) ) ( not ( = ?auto_397824 ?auto_397830 ) ) ( not ( = ?auto_397824 ?auto_397831 ) ) ( not ( = ?auto_397824 ?auto_397832 ) ) ( not ( = ?auto_397825 ?auto_397826 ) ) ( not ( = ?auto_397825 ?auto_397827 ) ) ( not ( = ?auto_397825 ?auto_397828 ) ) ( not ( = ?auto_397825 ?auto_397829 ) ) ( not ( = ?auto_397825 ?auto_397830 ) ) ( not ( = ?auto_397825 ?auto_397831 ) ) ( not ( = ?auto_397825 ?auto_397832 ) ) ( not ( = ?auto_397826 ?auto_397827 ) ) ( not ( = ?auto_397826 ?auto_397828 ) ) ( not ( = ?auto_397826 ?auto_397829 ) ) ( not ( = ?auto_397826 ?auto_397830 ) ) ( not ( = ?auto_397826 ?auto_397831 ) ) ( not ( = ?auto_397826 ?auto_397832 ) ) ( not ( = ?auto_397827 ?auto_397828 ) ) ( not ( = ?auto_397827 ?auto_397829 ) ) ( not ( = ?auto_397827 ?auto_397830 ) ) ( not ( = ?auto_397827 ?auto_397831 ) ) ( not ( = ?auto_397827 ?auto_397832 ) ) ( not ( = ?auto_397828 ?auto_397829 ) ) ( not ( = ?auto_397828 ?auto_397830 ) ) ( not ( = ?auto_397828 ?auto_397831 ) ) ( not ( = ?auto_397828 ?auto_397832 ) ) ( not ( = ?auto_397829 ?auto_397830 ) ) ( not ( = ?auto_397829 ?auto_397831 ) ) ( not ( = ?auto_397829 ?auto_397832 ) ) ( not ( = ?auto_397830 ?auto_397831 ) ) ( not ( = ?auto_397830 ?auto_397832 ) ) ( not ( = ?auto_397831 ?auto_397832 ) ) ( ON ?auto_397830 ?auto_397831 ) ( CLEAR ?auto_397828 ) ( ON ?auto_397829 ?auto_397830 ) ( CLEAR ?auto_397829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_397824 ?auto_397825 ?auto_397826 ?auto_397827 ?auto_397828 ?auto_397829 )
      ( MAKE-8PILE ?auto_397824 ?auto_397825 ?auto_397826 ?auto_397827 ?auto_397828 ?auto_397829 ?auto_397830 ?auto_397831 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_397858 - BLOCK
      ?auto_397859 - BLOCK
      ?auto_397860 - BLOCK
      ?auto_397861 - BLOCK
      ?auto_397862 - BLOCK
      ?auto_397863 - BLOCK
      ?auto_397864 - BLOCK
      ?auto_397865 - BLOCK
    )
    :vars
    (
      ?auto_397866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397865 ?auto_397866 ) ( ON-TABLE ?auto_397858 ) ( ON ?auto_397859 ?auto_397858 ) ( ON ?auto_397860 ?auto_397859 ) ( ON ?auto_397861 ?auto_397860 ) ( not ( = ?auto_397858 ?auto_397859 ) ) ( not ( = ?auto_397858 ?auto_397860 ) ) ( not ( = ?auto_397858 ?auto_397861 ) ) ( not ( = ?auto_397858 ?auto_397862 ) ) ( not ( = ?auto_397858 ?auto_397863 ) ) ( not ( = ?auto_397858 ?auto_397864 ) ) ( not ( = ?auto_397858 ?auto_397865 ) ) ( not ( = ?auto_397858 ?auto_397866 ) ) ( not ( = ?auto_397859 ?auto_397860 ) ) ( not ( = ?auto_397859 ?auto_397861 ) ) ( not ( = ?auto_397859 ?auto_397862 ) ) ( not ( = ?auto_397859 ?auto_397863 ) ) ( not ( = ?auto_397859 ?auto_397864 ) ) ( not ( = ?auto_397859 ?auto_397865 ) ) ( not ( = ?auto_397859 ?auto_397866 ) ) ( not ( = ?auto_397860 ?auto_397861 ) ) ( not ( = ?auto_397860 ?auto_397862 ) ) ( not ( = ?auto_397860 ?auto_397863 ) ) ( not ( = ?auto_397860 ?auto_397864 ) ) ( not ( = ?auto_397860 ?auto_397865 ) ) ( not ( = ?auto_397860 ?auto_397866 ) ) ( not ( = ?auto_397861 ?auto_397862 ) ) ( not ( = ?auto_397861 ?auto_397863 ) ) ( not ( = ?auto_397861 ?auto_397864 ) ) ( not ( = ?auto_397861 ?auto_397865 ) ) ( not ( = ?auto_397861 ?auto_397866 ) ) ( not ( = ?auto_397862 ?auto_397863 ) ) ( not ( = ?auto_397862 ?auto_397864 ) ) ( not ( = ?auto_397862 ?auto_397865 ) ) ( not ( = ?auto_397862 ?auto_397866 ) ) ( not ( = ?auto_397863 ?auto_397864 ) ) ( not ( = ?auto_397863 ?auto_397865 ) ) ( not ( = ?auto_397863 ?auto_397866 ) ) ( not ( = ?auto_397864 ?auto_397865 ) ) ( not ( = ?auto_397864 ?auto_397866 ) ) ( not ( = ?auto_397865 ?auto_397866 ) ) ( ON ?auto_397864 ?auto_397865 ) ( ON ?auto_397863 ?auto_397864 ) ( CLEAR ?auto_397861 ) ( ON ?auto_397862 ?auto_397863 ) ( CLEAR ?auto_397862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_397858 ?auto_397859 ?auto_397860 ?auto_397861 ?auto_397862 )
      ( MAKE-8PILE ?auto_397858 ?auto_397859 ?auto_397860 ?auto_397861 ?auto_397862 ?auto_397863 ?auto_397864 ?auto_397865 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_397892 - BLOCK
      ?auto_397893 - BLOCK
      ?auto_397894 - BLOCK
      ?auto_397895 - BLOCK
      ?auto_397896 - BLOCK
      ?auto_397897 - BLOCK
      ?auto_397898 - BLOCK
      ?auto_397899 - BLOCK
    )
    :vars
    (
      ?auto_397900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397899 ?auto_397900 ) ( ON-TABLE ?auto_397892 ) ( ON ?auto_397893 ?auto_397892 ) ( ON ?auto_397894 ?auto_397893 ) ( not ( = ?auto_397892 ?auto_397893 ) ) ( not ( = ?auto_397892 ?auto_397894 ) ) ( not ( = ?auto_397892 ?auto_397895 ) ) ( not ( = ?auto_397892 ?auto_397896 ) ) ( not ( = ?auto_397892 ?auto_397897 ) ) ( not ( = ?auto_397892 ?auto_397898 ) ) ( not ( = ?auto_397892 ?auto_397899 ) ) ( not ( = ?auto_397892 ?auto_397900 ) ) ( not ( = ?auto_397893 ?auto_397894 ) ) ( not ( = ?auto_397893 ?auto_397895 ) ) ( not ( = ?auto_397893 ?auto_397896 ) ) ( not ( = ?auto_397893 ?auto_397897 ) ) ( not ( = ?auto_397893 ?auto_397898 ) ) ( not ( = ?auto_397893 ?auto_397899 ) ) ( not ( = ?auto_397893 ?auto_397900 ) ) ( not ( = ?auto_397894 ?auto_397895 ) ) ( not ( = ?auto_397894 ?auto_397896 ) ) ( not ( = ?auto_397894 ?auto_397897 ) ) ( not ( = ?auto_397894 ?auto_397898 ) ) ( not ( = ?auto_397894 ?auto_397899 ) ) ( not ( = ?auto_397894 ?auto_397900 ) ) ( not ( = ?auto_397895 ?auto_397896 ) ) ( not ( = ?auto_397895 ?auto_397897 ) ) ( not ( = ?auto_397895 ?auto_397898 ) ) ( not ( = ?auto_397895 ?auto_397899 ) ) ( not ( = ?auto_397895 ?auto_397900 ) ) ( not ( = ?auto_397896 ?auto_397897 ) ) ( not ( = ?auto_397896 ?auto_397898 ) ) ( not ( = ?auto_397896 ?auto_397899 ) ) ( not ( = ?auto_397896 ?auto_397900 ) ) ( not ( = ?auto_397897 ?auto_397898 ) ) ( not ( = ?auto_397897 ?auto_397899 ) ) ( not ( = ?auto_397897 ?auto_397900 ) ) ( not ( = ?auto_397898 ?auto_397899 ) ) ( not ( = ?auto_397898 ?auto_397900 ) ) ( not ( = ?auto_397899 ?auto_397900 ) ) ( ON ?auto_397898 ?auto_397899 ) ( ON ?auto_397897 ?auto_397898 ) ( ON ?auto_397896 ?auto_397897 ) ( CLEAR ?auto_397894 ) ( ON ?auto_397895 ?auto_397896 ) ( CLEAR ?auto_397895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_397892 ?auto_397893 ?auto_397894 ?auto_397895 )
      ( MAKE-8PILE ?auto_397892 ?auto_397893 ?auto_397894 ?auto_397895 ?auto_397896 ?auto_397897 ?auto_397898 ?auto_397899 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_397926 - BLOCK
      ?auto_397927 - BLOCK
      ?auto_397928 - BLOCK
      ?auto_397929 - BLOCK
      ?auto_397930 - BLOCK
      ?auto_397931 - BLOCK
      ?auto_397932 - BLOCK
      ?auto_397933 - BLOCK
    )
    :vars
    (
      ?auto_397934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397933 ?auto_397934 ) ( ON-TABLE ?auto_397926 ) ( ON ?auto_397927 ?auto_397926 ) ( not ( = ?auto_397926 ?auto_397927 ) ) ( not ( = ?auto_397926 ?auto_397928 ) ) ( not ( = ?auto_397926 ?auto_397929 ) ) ( not ( = ?auto_397926 ?auto_397930 ) ) ( not ( = ?auto_397926 ?auto_397931 ) ) ( not ( = ?auto_397926 ?auto_397932 ) ) ( not ( = ?auto_397926 ?auto_397933 ) ) ( not ( = ?auto_397926 ?auto_397934 ) ) ( not ( = ?auto_397927 ?auto_397928 ) ) ( not ( = ?auto_397927 ?auto_397929 ) ) ( not ( = ?auto_397927 ?auto_397930 ) ) ( not ( = ?auto_397927 ?auto_397931 ) ) ( not ( = ?auto_397927 ?auto_397932 ) ) ( not ( = ?auto_397927 ?auto_397933 ) ) ( not ( = ?auto_397927 ?auto_397934 ) ) ( not ( = ?auto_397928 ?auto_397929 ) ) ( not ( = ?auto_397928 ?auto_397930 ) ) ( not ( = ?auto_397928 ?auto_397931 ) ) ( not ( = ?auto_397928 ?auto_397932 ) ) ( not ( = ?auto_397928 ?auto_397933 ) ) ( not ( = ?auto_397928 ?auto_397934 ) ) ( not ( = ?auto_397929 ?auto_397930 ) ) ( not ( = ?auto_397929 ?auto_397931 ) ) ( not ( = ?auto_397929 ?auto_397932 ) ) ( not ( = ?auto_397929 ?auto_397933 ) ) ( not ( = ?auto_397929 ?auto_397934 ) ) ( not ( = ?auto_397930 ?auto_397931 ) ) ( not ( = ?auto_397930 ?auto_397932 ) ) ( not ( = ?auto_397930 ?auto_397933 ) ) ( not ( = ?auto_397930 ?auto_397934 ) ) ( not ( = ?auto_397931 ?auto_397932 ) ) ( not ( = ?auto_397931 ?auto_397933 ) ) ( not ( = ?auto_397931 ?auto_397934 ) ) ( not ( = ?auto_397932 ?auto_397933 ) ) ( not ( = ?auto_397932 ?auto_397934 ) ) ( not ( = ?auto_397933 ?auto_397934 ) ) ( ON ?auto_397932 ?auto_397933 ) ( ON ?auto_397931 ?auto_397932 ) ( ON ?auto_397930 ?auto_397931 ) ( ON ?auto_397929 ?auto_397930 ) ( CLEAR ?auto_397927 ) ( ON ?auto_397928 ?auto_397929 ) ( CLEAR ?auto_397928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_397926 ?auto_397927 ?auto_397928 )
      ( MAKE-8PILE ?auto_397926 ?auto_397927 ?auto_397928 ?auto_397929 ?auto_397930 ?auto_397931 ?auto_397932 ?auto_397933 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_397960 - BLOCK
      ?auto_397961 - BLOCK
      ?auto_397962 - BLOCK
      ?auto_397963 - BLOCK
      ?auto_397964 - BLOCK
      ?auto_397965 - BLOCK
      ?auto_397966 - BLOCK
      ?auto_397967 - BLOCK
    )
    :vars
    (
      ?auto_397968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_397967 ?auto_397968 ) ( ON-TABLE ?auto_397960 ) ( not ( = ?auto_397960 ?auto_397961 ) ) ( not ( = ?auto_397960 ?auto_397962 ) ) ( not ( = ?auto_397960 ?auto_397963 ) ) ( not ( = ?auto_397960 ?auto_397964 ) ) ( not ( = ?auto_397960 ?auto_397965 ) ) ( not ( = ?auto_397960 ?auto_397966 ) ) ( not ( = ?auto_397960 ?auto_397967 ) ) ( not ( = ?auto_397960 ?auto_397968 ) ) ( not ( = ?auto_397961 ?auto_397962 ) ) ( not ( = ?auto_397961 ?auto_397963 ) ) ( not ( = ?auto_397961 ?auto_397964 ) ) ( not ( = ?auto_397961 ?auto_397965 ) ) ( not ( = ?auto_397961 ?auto_397966 ) ) ( not ( = ?auto_397961 ?auto_397967 ) ) ( not ( = ?auto_397961 ?auto_397968 ) ) ( not ( = ?auto_397962 ?auto_397963 ) ) ( not ( = ?auto_397962 ?auto_397964 ) ) ( not ( = ?auto_397962 ?auto_397965 ) ) ( not ( = ?auto_397962 ?auto_397966 ) ) ( not ( = ?auto_397962 ?auto_397967 ) ) ( not ( = ?auto_397962 ?auto_397968 ) ) ( not ( = ?auto_397963 ?auto_397964 ) ) ( not ( = ?auto_397963 ?auto_397965 ) ) ( not ( = ?auto_397963 ?auto_397966 ) ) ( not ( = ?auto_397963 ?auto_397967 ) ) ( not ( = ?auto_397963 ?auto_397968 ) ) ( not ( = ?auto_397964 ?auto_397965 ) ) ( not ( = ?auto_397964 ?auto_397966 ) ) ( not ( = ?auto_397964 ?auto_397967 ) ) ( not ( = ?auto_397964 ?auto_397968 ) ) ( not ( = ?auto_397965 ?auto_397966 ) ) ( not ( = ?auto_397965 ?auto_397967 ) ) ( not ( = ?auto_397965 ?auto_397968 ) ) ( not ( = ?auto_397966 ?auto_397967 ) ) ( not ( = ?auto_397966 ?auto_397968 ) ) ( not ( = ?auto_397967 ?auto_397968 ) ) ( ON ?auto_397966 ?auto_397967 ) ( ON ?auto_397965 ?auto_397966 ) ( ON ?auto_397964 ?auto_397965 ) ( ON ?auto_397963 ?auto_397964 ) ( ON ?auto_397962 ?auto_397963 ) ( CLEAR ?auto_397960 ) ( ON ?auto_397961 ?auto_397962 ) ( CLEAR ?auto_397961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_397960 ?auto_397961 )
      ( MAKE-8PILE ?auto_397960 ?auto_397961 ?auto_397962 ?auto_397963 ?auto_397964 ?auto_397965 ?auto_397966 ?auto_397967 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_397994 - BLOCK
      ?auto_397995 - BLOCK
      ?auto_397996 - BLOCK
      ?auto_397997 - BLOCK
      ?auto_397998 - BLOCK
      ?auto_397999 - BLOCK
      ?auto_398000 - BLOCK
      ?auto_398001 - BLOCK
    )
    :vars
    (
      ?auto_398002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398001 ?auto_398002 ) ( not ( = ?auto_397994 ?auto_397995 ) ) ( not ( = ?auto_397994 ?auto_397996 ) ) ( not ( = ?auto_397994 ?auto_397997 ) ) ( not ( = ?auto_397994 ?auto_397998 ) ) ( not ( = ?auto_397994 ?auto_397999 ) ) ( not ( = ?auto_397994 ?auto_398000 ) ) ( not ( = ?auto_397994 ?auto_398001 ) ) ( not ( = ?auto_397994 ?auto_398002 ) ) ( not ( = ?auto_397995 ?auto_397996 ) ) ( not ( = ?auto_397995 ?auto_397997 ) ) ( not ( = ?auto_397995 ?auto_397998 ) ) ( not ( = ?auto_397995 ?auto_397999 ) ) ( not ( = ?auto_397995 ?auto_398000 ) ) ( not ( = ?auto_397995 ?auto_398001 ) ) ( not ( = ?auto_397995 ?auto_398002 ) ) ( not ( = ?auto_397996 ?auto_397997 ) ) ( not ( = ?auto_397996 ?auto_397998 ) ) ( not ( = ?auto_397996 ?auto_397999 ) ) ( not ( = ?auto_397996 ?auto_398000 ) ) ( not ( = ?auto_397996 ?auto_398001 ) ) ( not ( = ?auto_397996 ?auto_398002 ) ) ( not ( = ?auto_397997 ?auto_397998 ) ) ( not ( = ?auto_397997 ?auto_397999 ) ) ( not ( = ?auto_397997 ?auto_398000 ) ) ( not ( = ?auto_397997 ?auto_398001 ) ) ( not ( = ?auto_397997 ?auto_398002 ) ) ( not ( = ?auto_397998 ?auto_397999 ) ) ( not ( = ?auto_397998 ?auto_398000 ) ) ( not ( = ?auto_397998 ?auto_398001 ) ) ( not ( = ?auto_397998 ?auto_398002 ) ) ( not ( = ?auto_397999 ?auto_398000 ) ) ( not ( = ?auto_397999 ?auto_398001 ) ) ( not ( = ?auto_397999 ?auto_398002 ) ) ( not ( = ?auto_398000 ?auto_398001 ) ) ( not ( = ?auto_398000 ?auto_398002 ) ) ( not ( = ?auto_398001 ?auto_398002 ) ) ( ON ?auto_398000 ?auto_398001 ) ( ON ?auto_397999 ?auto_398000 ) ( ON ?auto_397998 ?auto_397999 ) ( ON ?auto_397997 ?auto_397998 ) ( ON ?auto_397996 ?auto_397997 ) ( ON ?auto_397995 ?auto_397996 ) ( ON ?auto_397994 ?auto_397995 ) ( CLEAR ?auto_397994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_397994 )
      ( MAKE-8PILE ?auto_397994 ?auto_397995 ?auto_397996 ?auto_397997 ?auto_397998 ?auto_397999 ?auto_398000 ?auto_398001 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_398029 - BLOCK
      ?auto_398030 - BLOCK
      ?auto_398031 - BLOCK
      ?auto_398032 - BLOCK
      ?auto_398033 - BLOCK
      ?auto_398034 - BLOCK
      ?auto_398035 - BLOCK
      ?auto_398036 - BLOCK
      ?auto_398037 - BLOCK
    )
    :vars
    (
      ?auto_398038 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_398036 ) ( ON ?auto_398037 ?auto_398038 ) ( CLEAR ?auto_398037 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_398029 ) ( ON ?auto_398030 ?auto_398029 ) ( ON ?auto_398031 ?auto_398030 ) ( ON ?auto_398032 ?auto_398031 ) ( ON ?auto_398033 ?auto_398032 ) ( ON ?auto_398034 ?auto_398033 ) ( ON ?auto_398035 ?auto_398034 ) ( ON ?auto_398036 ?auto_398035 ) ( not ( = ?auto_398029 ?auto_398030 ) ) ( not ( = ?auto_398029 ?auto_398031 ) ) ( not ( = ?auto_398029 ?auto_398032 ) ) ( not ( = ?auto_398029 ?auto_398033 ) ) ( not ( = ?auto_398029 ?auto_398034 ) ) ( not ( = ?auto_398029 ?auto_398035 ) ) ( not ( = ?auto_398029 ?auto_398036 ) ) ( not ( = ?auto_398029 ?auto_398037 ) ) ( not ( = ?auto_398029 ?auto_398038 ) ) ( not ( = ?auto_398030 ?auto_398031 ) ) ( not ( = ?auto_398030 ?auto_398032 ) ) ( not ( = ?auto_398030 ?auto_398033 ) ) ( not ( = ?auto_398030 ?auto_398034 ) ) ( not ( = ?auto_398030 ?auto_398035 ) ) ( not ( = ?auto_398030 ?auto_398036 ) ) ( not ( = ?auto_398030 ?auto_398037 ) ) ( not ( = ?auto_398030 ?auto_398038 ) ) ( not ( = ?auto_398031 ?auto_398032 ) ) ( not ( = ?auto_398031 ?auto_398033 ) ) ( not ( = ?auto_398031 ?auto_398034 ) ) ( not ( = ?auto_398031 ?auto_398035 ) ) ( not ( = ?auto_398031 ?auto_398036 ) ) ( not ( = ?auto_398031 ?auto_398037 ) ) ( not ( = ?auto_398031 ?auto_398038 ) ) ( not ( = ?auto_398032 ?auto_398033 ) ) ( not ( = ?auto_398032 ?auto_398034 ) ) ( not ( = ?auto_398032 ?auto_398035 ) ) ( not ( = ?auto_398032 ?auto_398036 ) ) ( not ( = ?auto_398032 ?auto_398037 ) ) ( not ( = ?auto_398032 ?auto_398038 ) ) ( not ( = ?auto_398033 ?auto_398034 ) ) ( not ( = ?auto_398033 ?auto_398035 ) ) ( not ( = ?auto_398033 ?auto_398036 ) ) ( not ( = ?auto_398033 ?auto_398037 ) ) ( not ( = ?auto_398033 ?auto_398038 ) ) ( not ( = ?auto_398034 ?auto_398035 ) ) ( not ( = ?auto_398034 ?auto_398036 ) ) ( not ( = ?auto_398034 ?auto_398037 ) ) ( not ( = ?auto_398034 ?auto_398038 ) ) ( not ( = ?auto_398035 ?auto_398036 ) ) ( not ( = ?auto_398035 ?auto_398037 ) ) ( not ( = ?auto_398035 ?auto_398038 ) ) ( not ( = ?auto_398036 ?auto_398037 ) ) ( not ( = ?auto_398036 ?auto_398038 ) ) ( not ( = ?auto_398037 ?auto_398038 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_398037 ?auto_398038 )
      ( !STACK ?auto_398037 ?auto_398036 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_398067 - BLOCK
      ?auto_398068 - BLOCK
      ?auto_398069 - BLOCK
      ?auto_398070 - BLOCK
      ?auto_398071 - BLOCK
      ?auto_398072 - BLOCK
      ?auto_398073 - BLOCK
      ?auto_398074 - BLOCK
      ?auto_398075 - BLOCK
    )
    :vars
    (
      ?auto_398076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398075 ?auto_398076 ) ( ON-TABLE ?auto_398067 ) ( ON ?auto_398068 ?auto_398067 ) ( ON ?auto_398069 ?auto_398068 ) ( ON ?auto_398070 ?auto_398069 ) ( ON ?auto_398071 ?auto_398070 ) ( ON ?auto_398072 ?auto_398071 ) ( ON ?auto_398073 ?auto_398072 ) ( not ( = ?auto_398067 ?auto_398068 ) ) ( not ( = ?auto_398067 ?auto_398069 ) ) ( not ( = ?auto_398067 ?auto_398070 ) ) ( not ( = ?auto_398067 ?auto_398071 ) ) ( not ( = ?auto_398067 ?auto_398072 ) ) ( not ( = ?auto_398067 ?auto_398073 ) ) ( not ( = ?auto_398067 ?auto_398074 ) ) ( not ( = ?auto_398067 ?auto_398075 ) ) ( not ( = ?auto_398067 ?auto_398076 ) ) ( not ( = ?auto_398068 ?auto_398069 ) ) ( not ( = ?auto_398068 ?auto_398070 ) ) ( not ( = ?auto_398068 ?auto_398071 ) ) ( not ( = ?auto_398068 ?auto_398072 ) ) ( not ( = ?auto_398068 ?auto_398073 ) ) ( not ( = ?auto_398068 ?auto_398074 ) ) ( not ( = ?auto_398068 ?auto_398075 ) ) ( not ( = ?auto_398068 ?auto_398076 ) ) ( not ( = ?auto_398069 ?auto_398070 ) ) ( not ( = ?auto_398069 ?auto_398071 ) ) ( not ( = ?auto_398069 ?auto_398072 ) ) ( not ( = ?auto_398069 ?auto_398073 ) ) ( not ( = ?auto_398069 ?auto_398074 ) ) ( not ( = ?auto_398069 ?auto_398075 ) ) ( not ( = ?auto_398069 ?auto_398076 ) ) ( not ( = ?auto_398070 ?auto_398071 ) ) ( not ( = ?auto_398070 ?auto_398072 ) ) ( not ( = ?auto_398070 ?auto_398073 ) ) ( not ( = ?auto_398070 ?auto_398074 ) ) ( not ( = ?auto_398070 ?auto_398075 ) ) ( not ( = ?auto_398070 ?auto_398076 ) ) ( not ( = ?auto_398071 ?auto_398072 ) ) ( not ( = ?auto_398071 ?auto_398073 ) ) ( not ( = ?auto_398071 ?auto_398074 ) ) ( not ( = ?auto_398071 ?auto_398075 ) ) ( not ( = ?auto_398071 ?auto_398076 ) ) ( not ( = ?auto_398072 ?auto_398073 ) ) ( not ( = ?auto_398072 ?auto_398074 ) ) ( not ( = ?auto_398072 ?auto_398075 ) ) ( not ( = ?auto_398072 ?auto_398076 ) ) ( not ( = ?auto_398073 ?auto_398074 ) ) ( not ( = ?auto_398073 ?auto_398075 ) ) ( not ( = ?auto_398073 ?auto_398076 ) ) ( not ( = ?auto_398074 ?auto_398075 ) ) ( not ( = ?auto_398074 ?auto_398076 ) ) ( not ( = ?auto_398075 ?auto_398076 ) ) ( CLEAR ?auto_398073 ) ( ON ?auto_398074 ?auto_398075 ) ( CLEAR ?auto_398074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_398067 ?auto_398068 ?auto_398069 ?auto_398070 ?auto_398071 ?auto_398072 ?auto_398073 ?auto_398074 )
      ( MAKE-9PILE ?auto_398067 ?auto_398068 ?auto_398069 ?auto_398070 ?auto_398071 ?auto_398072 ?auto_398073 ?auto_398074 ?auto_398075 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_398105 - BLOCK
      ?auto_398106 - BLOCK
      ?auto_398107 - BLOCK
      ?auto_398108 - BLOCK
      ?auto_398109 - BLOCK
      ?auto_398110 - BLOCK
      ?auto_398111 - BLOCK
      ?auto_398112 - BLOCK
      ?auto_398113 - BLOCK
    )
    :vars
    (
      ?auto_398114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398113 ?auto_398114 ) ( ON-TABLE ?auto_398105 ) ( ON ?auto_398106 ?auto_398105 ) ( ON ?auto_398107 ?auto_398106 ) ( ON ?auto_398108 ?auto_398107 ) ( ON ?auto_398109 ?auto_398108 ) ( ON ?auto_398110 ?auto_398109 ) ( not ( = ?auto_398105 ?auto_398106 ) ) ( not ( = ?auto_398105 ?auto_398107 ) ) ( not ( = ?auto_398105 ?auto_398108 ) ) ( not ( = ?auto_398105 ?auto_398109 ) ) ( not ( = ?auto_398105 ?auto_398110 ) ) ( not ( = ?auto_398105 ?auto_398111 ) ) ( not ( = ?auto_398105 ?auto_398112 ) ) ( not ( = ?auto_398105 ?auto_398113 ) ) ( not ( = ?auto_398105 ?auto_398114 ) ) ( not ( = ?auto_398106 ?auto_398107 ) ) ( not ( = ?auto_398106 ?auto_398108 ) ) ( not ( = ?auto_398106 ?auto_398109 ) ) ( not ( = ?auto_398106 ?auto_398110 ) ) ( not ( = ?auto_398106 ?auto_398111 ) ) ( not ( = ?auto_398106 ?auto_398112 ) ) ( not ( = ?auto_398106 ?auto_398113 ) ) ( not ( = ?auto_398106 ?auto_398114 ) ) ( not ( = ?auto_398107 ?auto_398108 ) ) ( not ( = ?auto_398107 ?auto_398109 ) ) ( not ( = ?auto_398107 ?auto_398110 ) ) ( not ( = ?auto_398107 ?auto_398111 ) ) ( not ( = ?auto_398107 ?auto_398112 ) ) ( not ( = ?auto_398107 ?auto_398113 ) ) ( not ( = ?auto_398107 ?auto_398114 ) ) ( not ( = ?auto_398108 ?auto_398109 ) ) ( not ( = ?auto_398108 ?auto_398110 ) ) ( not ( = ?auto_398108 ?auto_398111 ) ) ( not ( = ?auto_398108 ?auto_398112 ) ) ( not ( = ?auto_398108 ?auto_398113 ) ) ( not ( = ?auto_398108 ?auto_398114 ) ) ( not ( = ?auto_398109 ?auto_398110 ) ) ( not ( = ?auto_398109 ?auto_398111 ) ) ( not ( = ?auto_398109 ?auto_398112 ) ) ( not ( = ?auto_398109 ?auto_398113 ) ) ( not ( = ?auto_398109 ?auto_398114 ) ) ( not ( = ?auto_398110 ?auto_398111 ) ) ( not ( = ?auto_398110 ?auto_398112 ) ) ( not ( = ?auto_398110 ?auto_398113 ) ) ( not ( = ?auto_398110 ?auto_398114 ) ) ( not ( = ?auto_398111 ?auto_398112 ) ) ( not ( = ?auto_398111 ?auto_398113 ) ) ( not ( = ?auto_398111 ?auto_398114 ) ) ( not ( = ?auto_398112 ?auto_398113 ) ) ( not ( = ?auto_398112 ?auto_398114 ) ) ( not ( = ?auto_398113 ?auto_398114 ) ) ( ON ?auto_398112 ?auto_398113 ) ( CLEAR ?auto_398110 ) ( ON ?auto_398111 ?auto_398112 ) ( CLEAR ?auto_398111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_398105 ?auto_398106 ?auto_398107 ?auto_398108 ?auto_398109 ?auto_398110 ?auto_398111 )
      ( MAKE-9PILE ?auto_398105 ?auto_398106 ?auto_398107 ?auto_398108 ?auto_398109 ?auto_398110 ?auto_398111 ?auto_398112 ?auto_398113 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_398143 - BLOCK
      ?auto_398144 - BLOCK
      ?auto_398145 - BLOCK
      ?auto_398146 - BLOCK
      ?auto_398147 - BLOCK
      ?auto_398148 - BLOCK
      ?auto_398149 - BLOCK
      ?auto_398150 - BLOCK
      ?auto_398151 - BLOCK
    )
    :vars
    (
      ?auto_398152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398151 ?auto_398152 ) ( ON-TABLE ?auto_398143 ) ( ON ?auto_398144 ?auto_398143 ) ( ON ?auto_398145 ?auto_398144 ) ( ON ?auto_398146 ?auto_398145 ) ( ON ?auto_398147 ?auto_398146 ) ( not ( = ?auto_398143 ?auto_398144 ) ) ( not ( = ?auto_398143 ?auto_398145 ) ) ( not ( = ?auto_398143 ?auto_398146 ) ) ( not ( = ?auto_398143 ?auto_398147 ) ) ( not ( = ?auto_398143 ?auto_398148 ) ) ( not ( = ?auto_398143 ?auto_398149 ) ) ( not ( = ?auto_398143 ?auto_398150 ) ) ( not ( = ?auto_398143 ?auto_398151 ) ) ( not ( = ?auto_398143 ?auto_398152 ) ) ( not ( = ?auto_398144 ?auto_398145 ) ) ( not ( = ?auto_398144 ?auto_398146 ) ) ( not ( = ?auto_398144 ?auto_398147 ) ) ( not ( = ?auto_398144 ?auto_398148 ) ) ( not ( = ?auto_398144 ?auto_398149 ) ) ( not ( = ?auto_398144 ?auto_398150 ) ) ( not ( = ?auto_398144 ?auto_398151 ) ) ( not ( = ?auto_398144 ?auto_398152 ) ) ( not ( = ?auto_398145 ?auto_398146 ) ) ( not ( = ?auto_398145 ?auto_398147 ) ) ( not ( = ?auto_398145 ?auto_398148 ) ) ( not ( = ?auto_398145 ?auto_398149 ) ) ( not ( = ?auto_398145 ?auto_398150 ) ) ( not ( = ?auto_398145 ?auto_398151 ) ) ( not ( = ?auto_398145 ?auto_398152 ) ) ( not ( = ?auto_398146 ?auto_398147 ) ) ( not ( = ?auto_398146 ?auto_398148 ) ) ( not ( = ?auto_398146 ?auto_398149 ) ) ( not ( = ?auto_398146 ?auto_398150 ) ) ( not ( = ?auto_398146 ?auto_398151 ) ) ( not ( = ?auto_398146 ?auto_398152 ) ) ( not ( = ?auto_398147 ?auto_398148 ) ) ( not ( = ?auto_398147 ?auto_398149 ) ) ( not ( = ?auto_398147 ?auto_398150 ) ) ( not ( = ?auto_398147 ?auto_398151 ) ) ( not ( = ?auto_398147 ?auto_398152 ) ) ( not ( = ?auto_398148 ?auto_398149 ) ) ( not ( = ?auto_398148 ?auto_398150 ) ) ( not ( = ?auto_398148 ?auto_398151 ) ) ( not ( = ?auto_398148 ?auto_398152 ) ) ( not ( = ?auto_398149 ?auto_398150 ) ) ( not ( = ?auto_398149 ?auto_398151 ) ) ( not ( = ?auto_398149 ?auto_398152 ) ) ( not ( = ?auto_398150 ?auto_398151 ) ) ( not ( = ?auto_398150 ?auto_398152 ) ) ( not ( = ?auto_398151 ?auto_398152 ) ) ( ON ?auto_398150 ?auto_398151 ) ( ON ?auto_398149 ?auto_398150 ) ( CLEAR ?auto_398147 ) ( ON ?auto_398148 ?auto_398149 ) ( CLEAR ?auto_398148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_398143 ?auto_398144 ?auto_398145 ?auto_398146 ?auto_398147 ?auto_398148 )
      ( MAKE-9PILE ?auto_398143 ?auto_398144 ?auto_398145 ?auto_398146 ?auto_398147 ?auto_398148 ?auto_398149 ?auto_398150 ?auto_398151 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_398181 - BLOCK
      ?auto_398182 - BLOCK
      ?auto_398183 - BLOCK
      ?auto_398184 - BLOCK
      ?auto_398185 - BLOCK
      ?auto_398186 - BLOCK
      ?auto_398187 - BLOCK
      ?auto_398188 - BLOCK
      ?auto_398189 - BLOCK
    )
    :vars
    (
      ?auto_398190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398189 ?auto_398190 ) ( ON-TABLE ?auto_398181 ) ( ON ?auto_398182 ?auto_398181 ) ( ON ?auto_398183 ?auto_398182 ) ( ON ?auto_398184 ?auto_398183 ) ( not ( = ?auto_398181 ?auto_398182 ) ) ( not ( = ?auto_398181 ?auto_398183 ) ) ( not ( = ?auto_398181 ?auto_398184 ) ) ( not ( = ?auto_398181 ?auto_398185 ) ) ( not ( = ?auto_398181 ?auto_398186 ) ) ( not ( = ?auto_398181 ?auto_398187 ) ) ( not ( = ?auto_398181 ?auto_398188 ) ) ( not ( = ?auto_398181 ?auto_398189 ) ) ( not ( = ?auto_398181 ?auto_398190 ) ) ( not ( = ?auto_398182 ?auto_398183 ) ) ( not ( = ?auto_398182 ?auto_398184 ) ) ( not ( = ?auto_398182 ?auto_398185 ) ) ( not ( = ?auto_398182 ?auto_398186 ) ) ( not ( = ?auto_398182 ?auto_398187 ) ) ( not ( = ?auto_398182 ?auto_398188 ) ) ( not ( = ?auto_398182 ?auto_398189 ) ) ( not ( = ?auto_398182 ?auto_398190 ) ) ( not ( = ?auto_398183 ?auto_398184 ) ) ( not ( = ?auto_398183 ?auto_398185 ) ) ( not ( = ?auto_398183 ?auto_398186 ) ) ( not ( = ?auto_398183 ?auto_398187 ) ) ( not ( = ?auto_398183 ?auto_398188 ) ) ( not ( = ?auto_398183 ?auto_398189 ) ) ( not ( = ?auto_398183 ?auto_398190 ) ) ( not ( = ?auto_398184 ?auto_398185 ) ) ( not ( = ?auto_398184 ?auto_398186 ) ) ( not ( = ?auto_398184 ?auto_398187 ) ) ( not ( = ?auto_398184 ?auto_398188 ) ) ( not ( = ?auto_398184 ?auto_398189 ) ) ( not ( = ?auto_398184 ?auto_398190 ) ) ( not ( = ?auto_398185 ?auto_398186 ) ) ( not ( = ?auto_398185 ?auto_398187 ) ) ( not ( = ?auto_398185 ?auto_398188 ) ) ( not ( = ?auto_398185 ?auto_398189 ) ) ( not ( = ?auto_398185 ?auto_398190 ) ) ( not ( = ?auto_398186 ?auto_398187 ) ) ( not ( = ?auto_398186 ?auto_398188 ) ) ( not ( = ?auto_398186 ?auto_398189 ) ) ( not ( = ?auto_398186 ?auto_398190 ) ) ( not ( = ?auto_398187 ?auto_398188 ) ) ( not ( = ?auto_398187 ?auto_398189 ) ) ( not ( = ?auto_398187 ?auto_398190 ) ) ( not ( = ?auto_398188 ?auto_398189 ) ) ( not ( = ?auto_398188 ?auto_398190 ) ) ( not ( = ?auto_398189 ?auto_398190 ) ) ( ON ?auto_398188 ?auto_398189 ) ( ON ?auto_398187 ?auto_398188 ) ( ON ?auto_398186 ?auto_398187 ) ( CLEAR ?auto_398184 ) ( ON ?auto_398185 ?auto_398186 ) ( CLEAR ?auto_398185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_398181 ?auto_398182 ?auto_398183 ?auto_398184 ?auto_398185 )
      ( MAKE-9PILE ?auto_398181 ?auto_398182 ?auto_398183 ?auto_398184 ?auto_398185 ?auto_398186 ?auto_398187 ?auto_398188 ?auto_398189 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_398219 - BLOCK
      ?auto_398220 - BLOCK
      ?auto_398221 - BLOCK
      ?auto_398222 - BLOCK
      ?auto_398223 - BLOCK
      ?auto_398224 - BLOCK
      ?auto_398225 - BLOCK
      ?auto_398226 - BLOCK
      ?auto_398227 - BLOCK
    )
    :vars
    (
      ?auto_398228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398227 ?auto_398228 ) ( ON-TABLE ?auto_398219 ) ( ON ?auto_398220 ?auto_398219 ) ( ON ?auto_398221 ?auto_398220 ) ( not ( = ?auto_398219 ?auto_398220 ) ) ( not ( = ?auto_398219 ?auto_398221 ) ) ( not ( = ?auto_398219 ?auto_398222 ) ) ( not ( = ?auto_398219 ?auto_398223 ) ) ( not ( = ?auto_398219 ?auto_398224 ) ) ( not ( = ?auto_398219 ?auto_398225 ) ) ( not ( = ?auto_398219 ?auto_398226 ) ) ( not ( = ?auto_398219 ?auto_398227 ) ) ( not ( = ?auto_398219 ?auto_398228 ) ) ( not ( = ?auto_398220 ?auto_398221 ) ) ( not ( = ?auto_398220 ?auto_398222 ) ) ( not ( = ?auto_398220 ?auto_398223 ) ) ( not ( = ?auto_398220 ?auto_398224 ) ) ( not ( = ?auto_398220 ?auto_398225 ) ) ( not ( = ?auto_398220 ?auto_398226 ) ) ( not ( = ?auto_398220 ?auto_398227 ) ) ( not ( = ?auto_398220 ?auto_398228 ) ) ( not ( = ?auto_398221 ?auto_398222 ) ) ( not ( = ?auto_398221 ?auto_398223 ) ) ( not ( = ?auto_398221 ?auto_398224 ) ) ( not ( = ?auto_398221 ?auto_398225 ) ) ( not ( = ?auto_398221 ?auto_398226 ) ) ( not ( = ?auto_398221 ?auto_398227 ) ) ( not ( = ?auto_398221 ?auto_398228 ) ) ( not ( = ?auto_398222 ?auto_398223 ) ) ( not ( = ?auto_398222 ?auto_398224 ) ) ( not ( = ?auto_398222 ?auto_398225 ) ) ( not ( = ?auto_398222 ?auto_398226 ) ) ( not ( = ?auto_398222 ?auto_398227 ) ) ( not ( = ?auto_398222 ?auto_398228 ) ) ( not ( = ?auto_398223 ?auto_398224 ) ) ( not ( = ?auto_398223 ?auto_398225 ) ) ( not ( = ?auto_398223 ?auto_398226 ) ) ( not ( = ?auto_398223 ?auto_398227 ) ) ( not ( = ?auto_398223 ?auto_398228 ) ) ( not ( = ?auto_398224 ?auto_398225 ) ) ( not ( = ?auto_398224 ?auto_398226 ) ) ( not ( = ?auto_398224 ?auto_398227 ) ) ( not ( = ?auto_398224 ?auto_398228 ) ) ( not ( = ?auto_398225 ?auto_398226 ) ) ( not ( = ?auto_398225 ?auto_398227 ) ) ( not ( = ?auto_398225 ?auto_398228 ) ) ( not ( = ?auto_398226 ?auto_398227 ) ) ( not ( = ?auto_398226 ?auto_398228 ) ) ( not ( = ?auto_398227 ?auto_398228 ) ) ( ON ?auto_398226 ?auto_398227 ) ( ON ?auto_398225 ?auto_398226 ) ( ON ?auto_398224 ?auto_398225 ) ( ON ?auto_398223 ?auto_398224 ) ( CLEAR ?auto_398221 ) ( ON ?auto_398222 ?auto_398223 ) ( CLEAR ?auto_398222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_398219 ?auto_398220 ?auto_398221 ?auto_398222 )
      ( MAKE-9PILE ?auto_398219 ?auto_398220 ?auto_398221 ?auto_398222 ?auto_398223 ?auto_398224 ?auto_398225 ?auto_398226 ?auto_398227 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_398257 - BLOCK
      ?auto_398258 - BLOCK
      ?auto_398259 - BLOCK
      ?auto_398260 - BLOCK
      ?auto_398261 - BLOCK
      ?auto_398262 - BLOCK
      ?auto_398263 - BLOCK
      ?auto_398264 - BLOCK
      ?auto_398265 - BLOCK
    )
    :vars
    (
      ?auto_398266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398265 ?auto_398266 ) ( ON-TABLE ?auto_398257 ) ( ON ?auto_398258 ?auto_398257 ) ( not ( = ?auto_398257 ?auto_398258 ) ) ( not ( = ?auto_398257 ?auto_398259 ) ) ( not ( = ?auto_398257 ?auto_398260 ) ) ( not ( = ?auto_398257 ?auto_398261 ) ) ( not ( = ?auto_398257 ?auto_398262 ) ) ( not ( = ?auto_398257 ?auto_398263 ) ) ( not ( = ?auto_398257 ?auto_398264 ) ) ( not ( = ?auto_398257 ?auto_398265 ) ) ( not ( = ?auto_398257 ?auto_398266 ) ) ( not ( = ?auto_398258 ?auto_398259 ) ) ( not ( = ?auto_398258 ?auto_398260 ) ) ( not ( = ?auto_398258 ?auto_398261 ) ) ( not ( = ?auto_398258 ?auto_398262 ) ) ( not ( = ?auto_398258 ?auto_398263 ) ) ( not ( = ?auto_398258 ?auto_398264 ) ) ( not ( = ?auto_398258 ?auto_398265 ) ) ( not ( = ?auto_398258 ?auto_398266 ) ) ( not ( = ?auto_398259 ?auto_398260 ) ) ( not ( = ?auto_398259 ?auto_398261 ) ) ( not ( = ?auto_398259 ?auto_398262 ) ) ( not ( = ?auto_398259 ?auto_398263 ) ) ( not ( = ?auto_398259 ?auto_398264 ) ) ( not ( = ?auto_398259 ?auto_398265 ) ) ( not ( = ?auto_398259 ?auto_398266 ) ) ( not ( = ?auto_398260 ?auto_398261 ) ) ( not ( = ?auto_398260 ?auto_398262 ) ) ( not ( = ?auto_398260 ?auto_398263 ) ) ( not ( = ?auto_398260 ?auto_398264 ) ) ( not ( = ?auto_398260 ?auto_398265 ) ) ( not ( = ?auto_398260 ?auto_398266 ) ) ( not ( = ?auto_398261 ?auto_398262 ) ) ( not ( = ?auto_398261 ?auto_398263 ) ) ( not ( = ?auto_398261 ?auto_398264 ) ) ( not ( = ?auto_398261 ?auto_398265 ) ) ( not ( = ?auto_398261 ?auto_398266 ) ) ( not ( = ?auto_398262 ?auto_398263 ) ) ( not ( = ?auto_398262 ?auto_398264 ) ) ( not ( = ?auto_398262 ?auto_398265 ) ) ( not ( = ?auto_398262 ?auto_398266 ) ) ( not ( = ?auto_398263 ?auto_398264 ) ) ( not ( = ?auto_398263 ?auto_398265 ) ) ( not ( = ?auto_398263 ?auto_398266 ) ) ( not ( = ?auto_398264 ?auto_398265 ) ) ( not ( = ?auto_398264 ?auto_398266 ) ) ( not ( = ?auto_398265 ?auto_398266 ) ) ( ON ?auto_398264 ?auto_398265 ) ( ON ?auto_398263 ?auto_398264 ) ( ON ?auto_398262 ?auto_398263 ) ( ON ?auto_398261 ?auto_398262 ) ( ON ?auto_398260 ?auto_398261 ) ( CLEAR ?auto_398258 ) ( ON ?auto_398259 ?auto_398260 ) ( CLEAR ?auto_398259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_398257 ?auto_398258 ?auto_398259 )
      ( MAKE-9PILE ?auto_398257 ?auto_398258 ?auto_398259 ?auto_398260 ?auto_398261 ?auto_398262 ?auto_398263 ?auto_398264 ?auto_398265 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_398295 - BLOCK
      ?auto_398296 - BLOCK
      ?auto_398297 - BLOCK
      ?auto_398298 - BLOCK
      ?auto_398299 - BLOCK
      ?auto_398300 - BLOCK
      ?auto_398301 - BLOCK
      ?auto_398302 - BLOCK
      ?auto_398303 - BLOCK
    )
    :vars
    (
      ?auto_398304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398303 ?auto_398304 ) ( ON-TABLE ?auto_398295 ) ( not ( = ?auto_398295 ?auto_398296 ) ) ( not ( = ?auto_398295 ?auto_398297 ) ) ( not ( = ?auto_398295 ?auto_398298 ) ) ( not ( = ?auto_398295 ?auto_398299 ) ) ( not ( = ?auto_398295 ?auto_398300 ) ) ( not ( = ?auto_398295 ?auto_398301 ) ) ( not ( = ?auto_398295 ?auto_398302 ) ) ( not ( = ?auto_398295 ?auto_398303 ) ) ( not ( = ?auto_398295 ?auto_398304 ) ) ( not ( = ?auto_398296 ?auto_398297 ) ) ( not ( = ?auto_398296 ?auto_398298 ) ) ( not ( = ?auto_398296 ?auto_398299 ) ) ( not ( = ?auto_398296 ?auto_398300 ) ) ( not ( = ?auto_398296 ?auto_398301 ) ) ( not ( = ?auto_398296 ?auto_398302 ) ) ( not ( = ?auto_398296 ?auto_398303 ) ) ( not ( = ?auto_398296 ?auto_398304 ) ) ( not ( = ?auto_398297 ?auto_398298 ) ) ( not ( = ?auto_398297 ?auto_398299 ) ) ( not ( = ?auto_398297 ?auto_398300 ) ) ( not ( = ?auto_398297 ?auto_398301 ) ) ( not ( = ?auto_398297 ?auto_398302 ) ) ( not ( = ?auto_398297 ?auto_398303 ) ) ( not ( = ?auto_398297 ?auto_398304 ) ) ( not ( = ?auto_398298 ?auto_398299 ) ) ( not ( = ?auto_398298 ?auto_398300 ) ) ( not ( = ?auto_398298 ?auto_398301 ) ) ( not ( = ?auto_398298 ?auto_398302 ) ) ( not ( = ?auto_398298 ?auto_398303 ) ) ( not ( = ?auto_398298 ?auto_398304 ) ) ( not ( = ?auto_398299 ?auto_398300 ) ) ( not ( = ?auto_398299 ?auto_398301 ) ) ( not ( = ?auto_398299 ?auto_398302 ) ) ( not ( = ?auto_398299 ?auto_398303 ) ) ( not ( = ?auto_398299 ?auto_398304 ) ) ( not ( = ?auto_398300 ?auto_398301 ) ) ( not ( = ?auto_398300 ?auto_398302 ) ) ( not ( = ?auto_398300 ?auto_398303 ) ) ( not ( = ?auto_398300 ?auto_398304 ) ) ( not ( = ?auto_398301 ?auto_398302 ) ) ( not ( = ?auto_398301 ?auto_398303 ) ) ( not ( = ?auto_398301 ?auto_398304 ) ) ( not ( = ?auto_398302 ?auto_398303 ) ) ( not ( = ?auto_398302 ?auto_398304 ) ) ( not ( = ?auto_398303 ?auto_398304 ) ) ( ON ?auto_398302 ?auto_398303 ) ( ON ?auto_398301 ?auto_398302 ) ( ON ?auto_398300 ?auto_398301 ) ( ON ?auto_398299 ?auto_398300 ) ( ON ?auto_398298 ?auto_398299 ) ( ON ?auto_398297 ?auto_398298 ) ( CLEAR ?auto_398295 ) ( ON ?auto_398296 ?auto_398297 ) ( CLEAR ?auto_398296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_398295 ?auto_398296 )
      ( MAKE-9PILE ?auto_398295 ?auto_398296 ?auto_398297 ?auto_398298 ?auto_398299 ?auto_398300 ?auto_398301 ?auto_398302 ?auto_398303 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_398333 - BLOCK
      ?auto_398334 - BLOCK
      ?auto_398335 - BLOCK
      ?auto_398336 - BLOCK
      ?auto_398337 - BLOCK
      ?auto_398338 - BLOCK
      ?auto_398339 - BLOCK
      ?auto_398340 - BLOCK
      ?auto_398341 - BLOCK
    )
    :vars
    (
      ?auto_398342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398341 ?auto_398342 ) ( not ( = ?auto_398333 ?auto_398334 ) ) ( not ( = ?auto_398333 ?auto_398335 ) ) ( not ( = ?auto_398333 ?auto_398336 ) ) ( not ( = ?auto_398333 ?auto_398337 ) ) ( not ( = ?auto_398333 ?auto_398338 ) ) ( not ( = ?auto_398333 ?auto_398339 ) ) ( not ( = ?auto_398333 ?auto_398340 ) ) ( not ( = ?auto_398333 ?auto_398341 ) ) ( not ( = ?auto_398333 ?auto_398342 ) ) ( not ( = ?auto_398334 ?auto_398335 ) ) ( not ( = ?auto_398334 ?auto_398336 ) ) ( not ( = ?auto_398334 ?auto_398337 ) ) ( not ( = ?auto_398334 ?auto_398338 ) ) ( not ( = ?auto_398334 ?auto_398339 ) ) ( not ( = ?auto_398334 ?auto_398340 ) ) ( not ( = ?auto_398334 ?auto_398341 ) ) ( not ( = ?auto_398334 ?auto_398342 ) ) ( not ( = ?auto_398335 ?auto_398336 ) ) ( not ( = ?auto_398335 ?auto_398337 ) ) ( not ( = ?auto_398335 ?auto_398338 ) ) ( not ( = ?auto_398335 ?auto_398339 ) ) ( not ( = ?auto_398335 ?auto_398340 ) ) ( not ( = ?auto_398335 ?auto_398341 ) ) ( not ( = ?auto_398335 ?auto_398342 ) ) ( not ( = ?auto_398336 ?auto_398337 ) ) ( not ( = ?auto_398336 ?auto_398338 ) ) ( not ( = ?auto_398336 ?auto_398339 ) ) ( not ( = ?auto_398336 ?auto_398340 ) ) ( not ( = ?auto_398336 ?auto_398341 ) ) ( not ( = ?auto_398336 ?auto_398342 ) ) ( not ( = ?auto_398337 ?auto_398338 ) ) ( not ( = ?auto_398337 ?auto_398339 ) ) ( not ( = ?auto_398337 ?auto_398340 ) ) ( not ( = ?auto_398337 ?auto_398341 ) ) ( not ( = ?auto_398337 ?auto_398342 ) ) ( not ( = ?auto_398338 ?auto_398339 ) ) ( not ( = ?auto_398338 ?auto_398340 ) ) ( not ( = ?auto_398338 ?auto_398341 ) ) ( not ( = ?auto_398338 ?auto_398342 ) ) ( not ( = ?auto_398339 ?auto_398340 ) ) ( not ( = ?auto_398339 ?auto_398341 ) ) ( not ( = ?auto_398339 ?auto_398342 ) ) ( not ( = ?auto_398340 ?auto_398341 ) ) ( not ( = ?auto_398340 ?auto_398342 ) ) ( not ( = ?auto_398341 ?auto_398342 ) ) ( ON ?auto_398340 ?auto_398341 ) ( ON ?auto_398339 ?auto_398340 ) ( ON ?auto_398338 ?auto_398339 ) ( ON ?auto_398337 ?auto_398338 ) ( ON ?auto_398336 ?auto_398337 ) ( ON ?auto_398335 ?auto_398336 ) ( ON ?auto_398334 ?auto_398335 ) ( ON ?auto_398333 ?auto_398334 ) ( CLEAR ?auto_398333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_398333 )
      ( MAKE-9PILE ?auto_398333 ?auto_398334 ?auto_398335 ?auto_398336 ?auto_398337 ?auto_398338 ?auto_398339 ?auto_398340 ?auto_398341 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_398372 - BLOCK
      ?auto_398373 - BLOCK
      ?auto_398374 - BLOCK
      ?auto_398375 - BLOCK
      ?auto_398376 - BLOCK
      ?auto_398377 - BLOCK
      ?auto_398378 - BLOCK
      ?auto_398379 - BLOCK
      ?auto_398380 - BLOCK
      ?auto_398381 - BLOCK
    )
    :vars
    (
      ?auto_398382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_398380 ) ( ON ?auto_398381 ?auto_398382 ) ( CLEAR ?auto_398381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_398372 ) ( ON ?auto_398373 ?auto_398372 ) ( ON ?auto_398374 ?auto_398373 ) ( ON ?auto_398375 ?auto_398374 ) ( ON ?auto_398376 ?auto_398375 ) ( ON ?auto_398377 ?auto_398376 ) ( ON ?auto_398378 ?auto_398377 ) ( ON ?auto_398379 ?auto_398378 ) ( ON ?auto_398380 ?auto_398379 ) ( not ( = ?auto_398372 ?auto_398373 ) ) ( not ( = ?auto_398372 ?auto_398374 ) ) ( not ( = ?auto_398372 ?auto_398375 ) ) ( not ( = ?auto_398372 ?auto_398376 ) ) ( not ( = ?auto_398372 ?auto_398377 ) ) ( not ( = ?auto_398372 ?auto_398378 ) ) ( not ( = ?auto_398372 ?auto_398379 ) ) ( not ( = ?auto_398372 ?auto_398380 ) ) ( not ( = ?auto_398372 ?auto_398381 ) ) ( not ( = ?auto_398372 ?auto_398382 ) ) ( not ( = ?auto_398373 ?auto_398374 ) ) ( not ( = ?auto_398373 ?auto_398375 ) ) ( not ( = ?auto_398373 ?auto_398376 ) ) ( not ( = ?auto_398373 ?auto_398377 ) ) ( not ( = ?auto_398373 ?auto_398378 ) ) ( not ( = ?auto_398373 ?auto_398379 ) ) ( not ( = ?auto_398373 ?auto_398380 ) ) ( not ( = ?auto_398373 ?auto_398381 ) ) ( not ( = ?auto_398373 ?auto_398382 ) ) ( not ( = ?auto_398374 ?auto_398375 ) ) ( not ( = ?auto_398374 ?auto_398376 ) ) ( not ( = ?auto_398374 ?auto_398377 ) ) ( not ( = ?auto_398374 ?auto_398378 ) ) ( not ( = ?auto_398374 ?auto_398379 ) ) ( not ( = ?auto_398374 ?auto_398380 ) ) ( not ( = ?auto_398374 ?auto_398381 ) ) ( not ( = ?auto_398374 ?auto_398382 ) ) ( not ( = ?auto_398375 ?auto_398376 ) ) ( not ( = ?auto_398375 ?auto_398377 ) ) ( not ( = ?auto_398375 ?auto_398378 ) ) ( not ( = ?auto_398375 ?auto_398379 ) ) ( not ( = ?auto_398375 ?auto_398380 ) ) ( not ( = ?auto_398375 ?auto_398381 ) ) ( not ( = ?auto_398375 ?auto_398382 ) ) ( not ( = ?auto_398376 ?auto_398377 ) ) ( not ( = ?auto_398376 ?auto_398378 ) ) ( not ( = ?auto_398376 ?auto_398379 ) ) ( not ( = ?auto_398376 ?auto_398380 ) ) ( not ( = ?auto_398376 ?auto_398381 ) ) ( not ( = ?auto_398376 ?auto_398382 ) ) ( not ( = ?auto_398377 ?auto_398378 ) ) ( not ( = ?auto_398377 ?auto_398379 ) ) ( not ( = ?auto_398377 ?auto_398380 ) ) ( not ( = ?auto_398377 ?auto_398381 ) ) ( not ( = ?auto_398377 ?auto_398382 ) ) ( not ( = ?auto_398378 ?auto_398379 ) ) ( not ( = ?auto_398378 ?auto_398380 ) ) ( not ( = ?auto_398378 ?auto_398381 ) ) ( not ( = ?auto_398378 ?auto_398382 ) ) ( not ( = ?auto_398379 ?auto_398380 ) ) ( not ( = ?auto_398379 ?auto_398381 ) ) ( not ( = ?auto_398379 ?auto_398382 ) ) ( not ( = ?auto_398380 ?auto_398381 ) ) ( not ( = ?auto_398380 ?auto_398382 ) ) ( not ( = ?auto_398381 ?auto_398382 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_398381 ?auto_398382 )
      ( !STACK ?auto_398381 ?auto_398380 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_398414 - BLOCK
      ?auto_398415 - BLOCK
      ?auto_398416 - BLOCK
      ?auto_398417 - BLOCK
      ?auto_398418 - BLOCK
      ?auto_398419 - BLOCK
      ?auto_398420 - BLOCK
      ?auto_398421 - BLOCK
      ?auto_398422 - BLOCK
      ?auto_398423 - BLOCK
    )
    :vars
    (
      ?auto_398424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398423 ?auto_398424 ) ( ON-TABLE ?auto_398414 ) ( ON ?auto_398415 ?auto_398414 ) ( ON ?auto_398416 ?auto_398415 ) ( ON ?auto_398417 ?auto_398416 ) ( ON ?auto_398418 ?auto_398417 ) ( ON ?auto_398419 ?auto_398418 ) ( ON ?auto_398420 ?auto_398419 ) ( ON ?auto_398421 ?auto_398420 ) ( not ( = ?auto_398414 ?auto_398415 ) ) ( not ( = ?auto_398414 ?auto_398416 ) ) ( not ( = ?auto_398414 ?auto_398417 ) ) ( not ( = ?auto_398414 ?auto_398418 ) ) ( not ( = ?auto_398414 ?auto_398419 ) ) ( not ( = ?auto_398414 ?auto_398420 ) ) ( not ( = ?auto_398414 ?auto_398421 ) ) ( not ( = ?auto_398414 ?auto_398422 ) ) ( not ( = ?auto_398414 ?auto_398423 ) ) ( not ( = ?auto_398414 ?auto_398424 ) ) ( not ( = ?auto_398415 ?auto_398416 ) ) ( not ( = ?auto_398415 ?auto_398417 ) ) ( not ( = ?auto_398415 ?auto_398418 ) ) ( not ( = ?auto_398415 ?auto_398419 ) ) ( not ( = ?auto_398415 ?auto_398420 ) ) ( not ( = ?auto_398415 ?auto_398421 ) ) ( not ( = ?auto_398415 ?auto_398422 ) ) ( not ( = ?auto_398415 ?auto_398423 ) ) ( not ( = ?auto_398415 ?auto_398424 ) ) ( not ( = ?auto_398416 ?auto_398417 ) ) ( not ( = ?auto_398416 ?auto_398418 ) ) ( not ( = ?auto_398416 ?auto_398419 ) ) ( not ( = ?auto_398416 ?auto_398420 ) ) ( not ( = ?auto_398416 ?auto_398421 ) ) ( not ( = ?auto_398416 ?auto_398422 ) ) ( not ( = ?auto_398416 ?auto_398423 ) ) ( not ( = ?auto_398416 ?auto_398424 ) ) ( not ( = ?auto_398417 ?auto_398418 ) ) ( not ( = ?auto_398417 ?auto_398419 ) ) ( not ( = ?auto_398417 ?auto_398420 ) ) ( not ( = ?auto_398417 ?auto_398421 ) ) ( not ( = ?auto_398417 ?auto_398422 ) ) ( not ( = ?auto_398417 ?auto_398423 ) ) ( not ( = ?auto_398417 ?auto_398424 ) ) ( not ( = ?auto_398418 ?auto_398419 ) ) ( not ( = ?auto_398418 ?auto_398420 ) ) ( not ( = ?auto_398418 ?auto_398421 ) ) ( not ( = ?auto_398418 ?auto_398422 ) ) ( not ( = ?auto_398418 ?auto_398423 ) ) ( not ( = ?auto_398418 ?auto_398424 ) ) ( not ( = ?auto_398419 ?auto_398420 ) ) ( not ( = ?auto_398419 ?auto_398421 ) ) ( not ( = ?auto_398419 ?auto_398422 ) ) ( not ( = ?auto_398419 ?auto_398423 ) ) ( not ( = ?auto_398419 ?auto_398424 ) ) ( not ( = ?auto_398420 ?auto_398421 ) ) ( not ( = ?auto_398420 ?auto_398422 ) ) ( not ( = ?auto_398420 ?auto_398423 ) ) ( not ( = ?auto_398420 ?auto_398424 ) ) ( not ( = ?auto_398421 ?auto_398422 ) ) ( not ( = ?auto_398421 ?auto_398423 ) ) ( not ( = ?auto_398421 ?auto_398424 ) ) ( not ( = ?auto_398422 ?auto_398423 ) ) ( not ( = ?auto_398422 ?auto_398424 ) ) ( not ( = ?auto_398423 ?auto_398424 ) ) ( CLEAR ?auto_398421 ) ( ON ?auto_398422 ?auto_398423 ) ( CLEAR ?auto_398422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_398414 ?auto_398415 ?auto_398416 ?auto_398417 ?auto_398418 ?auto_398419 ?auto_398420 ?auto_398421 ?auto_398422 )
      ( MAKE-10PILE ?auto_398414 ?auto_398415 ?auto_398416 ?auto_398417 ?auto_398418 ?auto_398419 ?auto_398420 ?auto_398421 ?auto_398422 ?auto_398423 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_398456 - BLOCK
      ?auto_398457 - BLOCK
      ?auto_398458 - BLOCK
      ?auto_398459 - BLOCK
      ?auto_398460 - BLOCK
      ?auto_398461 - BLOCK
      ?auto_398462 - BLOCK
      ?auto_398463 - BLOCK
      ?auto_398464 - BLOCK
      ?auto_398465 - BLOCK
    )
    :vars
    (
      ?auto_398466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398465 ?auto_398466 ) ( ON-TABLE ?auto_398456 ) ( ON ?auto_398457 ?auto_398456 ) ( ON ?auto_398458 ?auto_398457 ) ( ON ?auto_398459 ?auto_398458 ) ( ON ?auto_398460 ?auto_398459 ) ( ON ?auto_398461 ?auto_398460 ) ( ON ?auto_398462 ?auto_398461 ) ( not ( = ?auto_398456 ?auto_398457 ) ) ( not ( = ?auto_398456 ?auto_398458 ) ) ( not ( = ?auto_398456 ?auto_398459 ) ) ( not ( = ?auto_398456 ?auto_398460 ) ) ( not ( = ?auto_398456 ?auto_398461 ) ) ( not ( = ?auto_398456 ?auto_398462 ) ) ( not ( = ?auto_398456 ?auto_398463 ) ) ( not ( = ?auto_398456 ?auto_398464 ) ) ( not ( = ?auto_398456 ?auto_398465 ) ) ( not ( = ?auto_398456 ?auto_398466 ) ) ( not ( = ?auto_398457 ?auto_398458 ) ) ( not ( = ?auto_398457 ?auto_398459 ) ) ( not ( = ?auto_398457 ?auto_398460 ) ) ( not ( = ?auto_398457 ?auto_398461 ) ) ( not ( = ?auto_398457 ?auto_398462 ) ) ( not ( = ?auto_398457 ?auto_398463 ) ) ( not ( = ?auto_398457 ?auto_398464 ) ) ( not ( = ?auto_398457 ?auto_398465 ) ) ( not ( = ?auto_398457 ?auto_398466 ) ) ( not ( = ?auto_398458 ?auto_398459 ) ) ( not ( = ?auto_398458 ?auto_398460 ) ) ( not ( = ?auto_398458 ?auto_398461 ) ) ( not ( = ?auto_398458 ?auto_398462 ) ) ( not ( = ?auto_398458 ?auto_398463 ) ) ( not ( = ?auto_398458 ?auto_398464 ) ) ( not ( = ?auto_398458 ?auto_398465 ) ) ( not ( = ?auto_398458 ?auto_398466 ) ) ( not ( = ?auto_398459 ?auto_398460 ) ) ( not ( = ?auto_398459 ?auto_398461 ) ) ( not ( = ?auto_398459 ?auto_398462 ) ) ( not ( = ?auto_398459 ?auto_398463 ) ) ( not ( = ?auto_398459 ?auto_398464 ) ) ( not ( = ?auto_398459 ?auto_398465 ) ) ( not ( = ?auto_398459 ?auto_398466 ) ) ( not ( = ?auto_398460 ?auto_398461 ) ) ( not ( = ?auto_398460 ?auto_398462 ) ) ( not ( = ?auto_398460 ?auto_398463 ) ) ( not ( = ?auto_398460 ?auto_398464 ) ) ( not ( = ?auto_398460 ?auto_398465 ) ) ( not ( = ?auto_398460 ?auto_398466 ) ) ( not ( = ?auto_398461 ?auto_398462 ) ) ( not ( = ?auto_398461 ?auto_398463 ) ) ( not ( = ?auto_398461 ?auto_398464 ) ) ( not ( = ?auto_398461 ?auto_398465 ) ) ( not ( = ?auto_398461 ?auto_398466 ) ) ( not ( = ?auto_398462 ?auto_398463 ) ) ( not ( = ?auto_398462 ?auto_398464 ) ) ( not ( = ?auto_398462 ?auto_398465 ) ) ( not ( = ?auto_398462 ?auto_398466 ) ) ( not ( = ?auto_398463 ?auto_398464 ) ) ( not ( = ?auto_398463 ?auto_398465 ) ) ( not ( = ?auto_398463 ?auto_398466 ) ) ( not ( = ?auto_398464 ?auto_398465 ) ) ( not ( = ?auto_398464 ?auto_398466 ) ) ( not ( = ?auto_398465 ?auto_398466 ) ) ( ON ?auto_398464 ?auto_398465 ) ( CLEAR ?auto_398462 ) ( ON ?auto_398463 ?auto_398464 ) ( CLEAR ?auto_398463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_398456 ?auto_398457 ?auto_398458 ?auto_398459 ?auto_398460 ?auto_398461 ?auto_398462 ?auto_398463 )
      ( MAKE-10PILE ?auto_398456 ?auto_398457 ?auto_398458 ?auto_398459 ?auto_398460 ?auto_398461 ?auto_398462 ?auto_398463 ?auto_398464 ?auto_398465 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_398498 - BLOCK
      ?auto_398499 - BLOCK
      ?auto_398500 - BLOCK
      ?auto_398501 - BLOCK
      ?auto_398502 - BLOCK
      ?auto_398503 - BLOCK
      ?auto_398504 - BLOCK
      ?auto_398505 - BLOCK
      ?auto_398506 - BLOCK
      ?auto_398507 - BLOCK
    )
    :vars
    (
      ?auto_398508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398507 ?auto_398508 ) ( ON-TABLE ?auto_398498 ) ( ON ?auto_398499 ?auto_398498 ) ( ON ?auto_398500 ?auto_398499 ) ( ON ?auto_398501 ?auto_398500 ) ( ON ?auto_398502 ?auto_398501 ) ( ON ?auto_398503 ?auto_398502 ) ( not ( = ?auto_398498 ?auto_398499 ) ) ( not ( = ?auto_398498 ?auto_398500 ) ) ( not ( = ?auto_398498 ?auto_398501 ) ) ( not ( = ?auto_398498 ?auto_398502 ) ) ( not ( = ?auto_398498 ?auto_398503 ) ) ( not ( = ?auto_398498 ?auto_398504 ) ) ( not ( = ?auto_398498 ?auto_398505 ) ) ( not ( = ?auto_398498 ?auto_398506 ) ) ( not ( = ?auto_398498 ?auto_398507 ) ) ( not ( = ?auto_398498 ?auto_398508 ) ) ( not ( = ?auto_398499 ?auto_398500 ) ) ( not ( = ?auto_398499 ?auto_398501 ) ) ( not ( = ?auto_398499 ?auto_398502 ) ) ( not ( = ?auto_398499 ?auto_398503 ) ) ( not ( = ?auto_398499 ?auto_398504 ) ) ( not ( = ?auto_398499 ?auto_398505 ) ) ( not ( = ?auto_398499 ?auto_398506 ) ) ( not ( = ?auto_398499 ?auto_398507 ) ) ( not ( = ?auto_398499 ?auto_398508 ) ) ( not ( = ?auto_398500 ?auto_398501 ) ) ( not ( = ?auto_398500 ?auto_398502 ) ) ( not ( = ?auto_398500 ?auto_398503 ) ) ( not ( = ?auto_398500 ?auto_398504 ) ) ( not ( = ?auto_398500 ?auto_398505 ) ) ( not ( = ?auto_398500 ?auto_398506 ) ) ( not ( = ?auto_398500 ?auto_398507 ) ) ( not ( = ?auto_398500 ?auto_398508 ) ) ( not ( = ?auto_398501 ?auto_398502 ) ) ( not ( = ?auto_398501 ?auto_398503 ) ) ( not ( = ?auto_398501 ?auto_398504 ) ) ( not ( = ?auto_398501 ?auto_398505 ) ) ( not ( = ?auto_398501 ?auto_398506 ) ) ( not ( = ?auto_398501 ?auto_398507 ) ) ( not ( = ?auto_398501 ?auto_398508 ) ) ( not ( = ?auto_398502 ?auto_398503 ) ) ( not ( = ?auto_398502 ?auto_398504 ) ) ( not ( = ?auto_398502 ?auto_398505 ) ) ( not ( = ?auto_398502 ?auto_398506 ) ) ( not ( = ?auto_398502 ?auto_398507 ) ) ( not ( = ?auto_398502 ?auto_398508 ) ) ( not ( = ?auto_398503 ?auto_398504 ) ) ( not ( = ?auto_398503 ?auto_398505 ) ) ( not ( = ?auto_398503 ?auto_398506 ) ) ( not ( = ?auto_398503 ?auto_398507 ) ) ( not ( = ?auto_398503 ?auto_398508 ) ) ( not ( = ?auto_398504 ?auto_398505 ) ) ( not ( = ?auto_398504 ?auto_398506 ) ) ( not ( = ?auto_398504 ?auto_398507 ) ) ( not ( = ?auto_398504 ?auto_398508 ) ) ( not ( = ?auto_398505 ?auto_398506 ) ) ( not ( = ?auto_398505 ?auto_398507 ) ) ( not ( = ?auto_398505 ?auto_398508 ) ) ( not ( = ?auto_398506 ?auto_398507 ) ) ( not ( = ?auto_398506 ?auto_398508 ) ) ( not ( = ?auto_398507 ?auto_398508 ) ) ( ON ?auto_398506 ?auto_398507 ) ( ON ?auto_398505 ?auto_398506 ) ( CLEAR ?auto_398503 ) ( ON ?auto_398504 ?auto_398505 ) ( CLEAR ?auto_398504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_398498 ?auto_398499 ?auto_398500 ?auto_398501 ?auto_398502 ?auto_398503 ?auto_398504 )
      ( MAKE-10PILE ?auto_398498 ?auto_398499 ?auto_398500 ?auto_398501 ?auto_398502 ?auto_398503 ?auto_398504 ?auto_398505 ?auto_398506 ?auto_398507 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_398540 - BLOCK
      ?auto_398541 - BLOCK
      ?auto_398542 - BLOCK
      ?auto_398543 - BLOCK
      ?auto_398544 - BLOCK
      ?auto_398545 - BLOCK
      ?auto_398546 - BLOCK
      ?auto_398547 - BLOCK
      ?auto_398548 - BLOCK
      ?auto_398549 - BLOCK
    )
    :vars
    (
      ?auto_398550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398549 ?auto_398550 ) ( ON-TABLE ?auto_398540 ) ( ON ?auto_398541 ?auto_398540 ) ( ON ?auto_398542 ?auto_398541 ) ( ON ?auto_398543 ?auto_398542 ) ( ON ?auto_398544 ?auto_398543 ) ( not ( = ?auto_398540 ?auto_398541 ) ) ( not ( = ?auto_398540 ?auto_398542 ) ) ( not ( = ?auto_398540 ?auto_398543 ) ) ( not ( = ?auto_398540 ?auto_398544 ) ) ( not ( = ?auto_398540 ?auto_398545 ) ) ( not ( = ?auto_398540 ?auto_398546 ) ) ( not ( = ?auto_398540 ?auto_398547 ) ) ( not ( = ?auto_398540 ?auto_398548 ) ) ( not ( = ?auto_398540 ?auto_398549 ) ) ( not ( = ?auto_398540 ?auto_398550 ) ) ( not ( = ?auto_398541 ?auto_398542 ) ) ( not ( = ?auto_398541 ?auto_398543 ) ) ( not ( = ?auto_398541 ?auto_398544 ) ) ( not ( = ?auto_398541 ?auto_398545 ) ) ( not ( = ?auto_398541 ?auto_398546 ) ) ( not ( = ?auto_398541 ?auto_398547 ) ) ( not ( = ?auto_398541 ?auto_398548 ) ) ( not ( = ?auto_398541 ?auto_398549 ) ) ( not ( = ?auto_398541 ?auto_398550 ) ) ( not ( = ?auto_398542 ?auto_398543 ) ) ( not ( = ?auto_398542 ?auto_398544 ) ) ( not ( = ?auto_398542 ?auto_398545 ) ) ( not ( = ?auto_398542 ?auto_398546 ) ) ( not ( = ?auto_398542 ?auto_398547 ) ) ( not ( = ?auto_398542 ?auto_398548 ) ) ( not ( = ?auto_398542 ?auto_398549 ) ) ( not ( = ?auto_398542 ?auto_398550 ) ) ( not ( = ?auto_398543 ?auto_398544 ) ) ( not ( = ?auto_398543 ?auto_398545 ) ) ( not ( = ?auto_398543 ?auto_398546 ) ) ( not ( = ?auto_398543 ?auto_398547 ) ) ( not ( = ?auto_398543 ?auto_398548 ) ) ( not ( = ?auto_398543 ?auto_398549 ) ) ( not ( = ?auto_398543 ?auto_398550 ) ) ( not ( = ?auto_398544 ?auto_398545 ) ) ( not ( = ?auto_398544 ?auto_398546 ) ) ( not ( = ?auto_398544 ?auto_398547 ) ) ( not ( = ?auto_398544 ?auto_398548 ) ) ( not ( = ?auto_398544 ?auto_398549 ) ) ( not ( = ?auto_398544 ?auto_398550 ) ) ( not ( = ?auto_398545 ?auto_398546 ) ) ( not ( = ?auto_398545 ?auto_398547 ) ) ( not ( = ?auto_398545 ?auto_398548 ) ) ( not ( = ?auto_398545 ?auto_398549 ) ) ( not ( = ?auto_398545 ?auto_398550 ) ) ( not ( = ?auto_398546 ?auto_398547 ) ) ( not ( = ?auto_398546 ?auto_398548 ) ) ( not ( = ?auto_398546 ?auto_398549 ) ) ( not ( = ?auto_398546 ?auto_398550 ) ) ( not ( = ?auto_398547 ?auto_398548 ) ) ( not ( = ?auto_398547 ?auto_398549 ) ) ( not ( = ?auto_398547 ?auto_398550 ) ) ( not ( = ?auto_398548 ?auto_398549 ) ) ( not ( = ?auto_398548 ?auto_398550 ) ) ( not ( = ?auto_398549 ?auto_398550 ) ) ( ON ?auto_398548 ?auto_398549 ) ( ON ?auto_398547 ?auto_398548 ) ( ON ?auto_398546 ?auto_398547 ) ( CLEAR ?auto_398544 ) ( ON ?auto_398545 ?auto_398546 ) ( CLEAR ?auto_398545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_398540 ?auto_398541 ?auto_398542 ?auto_398543 ?auto_398544 ?auto_398545 )
      ( MAKE-10PILE ?auto_398540 ?auto_398541 ?auto_398542 ?auto_398543 ?auto_398544 ?auto_398545 ?auto_398546 ?auto_398547 ?auto_398548 ?auto_398549 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_398582 - BLOCK
      ?auto_398583 - BLOCK
      ?auto_398584 - BLOCK
      ?auto_398585 - BLOCK
      ?auto_398586 - BLOCK
      ?auto_398587 - BLOCK
      ?auto_398588 - BLOCK
      ?auto_398589 - BLOCK
      ?auto_398590 - BLOCK
      ?auto_398591 - BLOCK
    )
    :vars
    (
      ?auto_398592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398591 ?auto_398592 ) ( ON-TABLE ?auto_398582 ) ( ON ?auto_398583 ?auto_398582 ) ( ON ?auto_398584 ?auto_398583 ) ( ON ?auto_398585 ?auto_398584 ) ( not ( = ?auto_398582 ?auto_398583 ) ) ( not ( = ?auto_398582 ?auto_398584 ) ) ( not ( = ?auto_398582 ?auto_398585 ) ) ( not ( = ?auto_398582 ?auto_398586 ) ) ( not ( = ?auto_398582 ?auto_398587 ) ) ( not ( = ?auto_398582 ?auto_398588 ) ) ( not ( = ?auto_398582 ?auto_398589 ) ) ( not ( = ?auto_398582 ?auto_398590 ) ) ( not ( = ?auto_398582 ?auto_398591 ) ) ( not ( = ?auto_398582 ?auto_398592 ) ) ( not ( = ?auto_398583 ?auto_398584 ) ) ( not ( = ?auto_398583 ?auto_398585 ) ) ( not ( = ?auto_398583 ?auto_398586 ) ) ( not ( = ?auto_398583 ?auto_398587 ) ) ( not ( = ?auto_398583 ?auto_398588 ) ) ( not ( = ?auto_398583 ?auto_398589 ) ) ( not ( = ?auto_398583 ?auto_398590 ) ) ( not ( = ?auto_398583 ?auto_398591 ) ) ( not ( = ?auto_398583 ?auto_398592 ) ) ( not ( = ?auto_398584 ?auto_398585 ) ) ( not ( = ?auto_398584 ?auto_398586 ) ) ( not ( = ?auto_398584 ?auto_398587 ) ) ( not ( = ?auto_398584 ?auto_398588 ) ) ( not ( = ?auto_398584 ?auto_398589 ) ) ( not ( = ?auto_398584 ?auto_398590 ) ) ( not ( = ?auto_398584 ?auto_398591 ) ) ( not ( = ?auto_398584 ?auto_398592 ) ) ( not ( = ?auto_398585 ?auto_398586 ) ) ( not ( = ?auto_398585 ?auto_398587 ) ) ( not ( = ?auto_398585 ?auto_398588 ) ) ( not ( = ?auto_398585 ?auto_398589 ) ) ( not ( = ?auto_398585 ?auto_398590 ) ) ( not ( = ?auto_398585 ?auto_398591 ) ) ( not ( = ?auto_398585 ?auto_398592 ) ) ( not ( = ?auto_398586 ?auto_398587 ) ) ( not ( = ?auto_398586 ?auto_398588 ) ) ( not ( = ?auto_398586 ?auto_398589 ) ) ( not ( = ?auto_398586 ?auto_398590 ) ) ( not ( = ?auto_398586 ?auto_398591 ) ) ( not ( = ?auto_398586 ?auto_398592 ) ) ( not ( = ?auto_398587 ?auto_398588 ) ) ( not ( = ?auto_398587 ?auto_398589 ) ) ( not ( = ?auto_398587 ?auto_398590 ) ) ( not ( = ?auto_398587 ?auto_398591 ) ) ( not ( = ?auto_398587 ?auto_398592 ) ) ( not ( = ?auto_398588 ?auto_398589 ) ) ( not ( = ?auto_398588 ?auto_398590 ) ) ( not ( = ?auto_398588 ?auto_398591 ) ) ( not ( = ?auto_398588 ?auto_398592 ) ) ( not ( = ?auto_398589 ?auto_398590 ) ) ( not ( = ?auto_398589 ?auto_398591 ) ) ( not ( = ?auto_398589 ?auto_398592 ) ) ( not ( = ?auto_398590 ?auto_398591 ) ) ( not ( = ?auto_398590 ?auto_398592 ) ) ( not ( = ?auto_398591 ?auto_398592 ) ) ( ON ?auto_398590 ?auto_398591 ) ( ON ?auto_398589 ?auto_398590 ) ( ON ?auto_398588 ?auto_398589 ) ( ON ?auto_398587 ?auto_398588 ) ( CLEAR ?auto_398585 ) ( ON ?auto_398586 ?auto_398587 ) ( CLEAR ?auto_398586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_398582 ?auto_398583 ?auto_398584 ?auto_398585 ?auto_398586 )
      ( MAKE-10PILE ?auto_398582 ?auto_398583 ?auto_398584 ?auto_398585 ?auto_398586 ?auto_398587 ?auto_398588 ?auto_398589 ?auto_398590 ?auto_398591 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_398624 - BLOCK
      ?auto_398625 - BLOCK
      ?auto_398626 - BLOCK
      ?auto_398627 - BLOCK
      ?auto_398628 - BLOCK
      ?auto_398629 - BLOCK
      ?auto_398630 - BLOCK
      ?auto_398631 - BLOCK
      ?auto_398632 - BLOCK
      ?auto_398633 - BLOCK
    )
    :vars
    (
      ?auto_398634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398633 ?auto_398634 ) ( ON-TABLE ?auto_398624 ) ( ON ?auto_398625 ?auto_398624 ) ( ON ?auto_398626 ?auto_398625 ) ( not ( = ?auto_398624 ?auto_398625 ) ) ( not ( = ?auto_398624 ?auto_398626 ) ) ( not ( = ?auto_398624 ?auto_398627 ) ) ( not ( = ?auto_398624 ?auto_398628 ) ) ( not ( = ?auto_398624 ?auto_398629 ) ) ( not ( = ?auto_398624 ?auto_398630 ) ) ( not ( = ?auto_398624 ?auto_398631 ) ) ( not ( = ?auto_398624 ?auto_398632 ) ) ( not ( = ?auto_398624 ?auto_398633 ) ) ( not ( = ?auto_398624 ?auto_398634 ) ) ( not ( = ?auto_398625 ?auto_398626 ) ) ( not ( = ?auto_398625 ?auto_398627 ) ) ( not ( = ?auto_398625 ?auto_398628 ) ) ( not ( = ?auto_398625 ?auto_398629 ) ) ( not ( = ?auto_398625 ?auto_398630 ) ) ( not ( = ?auto_398625 ?auto_398631 ) ) ( not ( = ?auto_398625 ?auto_398632 ) ) ( not ( = ?auto_398625 ?auto_398633 ) ) ( not ( = ?auto_398625 ?auto_398634 ) ) ( not ( = ?auto_398626 ?auto_398627 ) ) ( not ( = ?auto_398626 ?auto_398628 ) ) ( not ( = ?auto_398626 ?auto_398629 ) ) ( not ( = ?auto_398626 ?auto_398630 ) ) ( not ( = ?auto_398626 ?auto_398631 ) ) ( not ( = ?auto_398626 ?auto_398632 ) ) ( not ( = ?auto_398626 ?auto_398633 ) ) ( not ( = ?auto_398626 ?auto_398634 ) ) ( not ( = ?auto_398627 ?auto_398628 ) ) ( not ( = ?auto_398627 ?auto_398629 ) ) ( not ( = ?auto_398627 ?auto_398630 ) ) ( not ( = ?auto_398627 ?auto_398631 ) ) ( not ( = ?auto_398627 ?auto_398632 ) ) ( not ( = ?auto_398627 ?auto_398633 ) ) ( not ( = ?auto_398627 ?auto_398634 ) ) ( not ( = ?auto_398628 ?auto_398629 ) ) ( not ( = ?auto_398628 ?auto_398630 ) ) ( not ( = ?auto_398628 ?auto_398631 ) ) ( not ( = ?auto_398628 ?auto_398632 ) ) ( not ( = ?auto_398628 ?auto_398633 ) ) ( not ( = ?auto_398628 ?auto_398634 ) ) ( not ( = ?auto_398629 ?auto_398630 ) ) ( not ( = ?auto_398629 ?auto_398631 ) ) ( not ( = ?auto_398629 ?auto_398632 ) ) ( not ( = ?auto_398629 ?auto_398633 ) ) ( not ( = ?auto_398629 ?auto_398634 ) ) ( not ( = ?auto_398630 ?auto_398631 ) ) ( not ( = ?auto_398630 ?auto_398632 ) ) ( not ( = ?auto_398630 ?auto_398633 ) ) ( not ( = ?auto_398630 ?auto_398634 ) ) ( not ( = ?auto_398631 ?auto_398632 ) ) ( not ( = ?auto_398631 ?auto_398633 ) ) ( not ( = ?auto_398631 ?auto_398634 ) ) ( not ( = ?auto_398632 ?auto_398633 ) ) ( not ( = ?auto_398632 ?auto_398634 ) ) ( not ( = ?auto_398633 ?auto_398634 ) ) ( ON ?auto_398632 ?auto_398633 ) ( ON ?auto_398631 ?auto_398632 ) ( ON ?auto_398630 ?auto_398631 ) ( ON ?auto_398629 ?auto_398630 ) ( ON ?auto_398628 ?auto_398629 ) ( CLEAR ?auto_398626 ) ( ON ?auto_398627 ?auto_398628 ) ( CLEAR ?auto_398627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_398624 ?auto_398625 ?auto_398626 ?auto_398627 )
      ( MAKE-10PILE ?auto_398624 ?auto_398625 ?auto_398626 ?auto_398627 ?auto_398628 ?auto_398629 ?auto_398630 ?auto_398631 ?auto_398632 ?auto_398633 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_398666 - BLOCK
      ?auto_398667 - BLOCK
      ?auto_398668 - BLOCK
      ?auto_398669 - BLOCK
      ?auto_398670 - BLOCK
      ?auto_398671 - BLOCK
      ?auto_398672 - BLOCK
      ?auto_398673 - BLOCK
      ?auto_398674 - BLOCK
      ?auto_398675 - BLOCK
    )
    :vars
    (
      ?auto_398676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398675 ?auto_398676 ) ( ON-TABLE ?auto_398666 ) ( ON ?auto_398667 ?auto_398666 ) ( not ( = ?auto_398666 ?auto_398667 ) ) ( not ( = ?auto_398666 ?auto_398668 ) ) ( not ( = ?auto_398666 ?auto_398669 ) ) ( not ( = ?auto_398666 ?auto_398670 ) ) ( not ( = ?auto_398666 ?auto_398671 ) ) ( not ( = ?auto_398666 ?auto_398672 ) ) ( not ( = ?auto_398666 ?auto_398673 ) ) ( not ( = ?auto_398666 ?auto_398674 ) ) ( not ( = ?auto_398666 ?auto_398675 ) ) ( not ( = ?auto_398666 ?auto_398676 ) ) ( not ( = ?auto_398667 ?auto_398668 ) ) ( not ( = ?auto_398667 ?auto_398669 ) ) ( not ( = ?auto_398667 ?auto_398670 ) ) ( not ( = ?auto_398667 ?auto_398671 ) ) ( not ( = ?auto_398667 ?auto_398672 ) ) ( not ( = ?auto_398667 ?auto_398673 ) ) ( not ( = ?auto_398667 ?auto_398674 ) ) ( not ( = ?auto_398667 ?auto_398675 ) ) ( not ( = ?auto_398667 ?auto_398676 ) ) ( not ( = ?auto_398668 ?auto_398669 ) ) ( not ( = ?auto_398668 ?auto_398670 ) ) ( not ( = ?auto_398668 ?auto_398671 ) ) ( not ( = ?auto_398668 ?auto_398672 ) ) ( not ( = ?auto_398668 ?auto_398673 ) ) ( not ( = ?auto_398668 ?auto_398674 ) ) ( not ( = ?auto_398668 ?auto_398675 ) ) ( not ( = ?auto_398668 ?auto_398676 ) ) ( not ( = ?auto_398669 ?auto_398670 ) ) ( not ( = ?auto_398669 ?auto_398671 ) ) ( not ( = ?auto_398669 ?auto_398672 ) ) ( not ( = ?auto_398669 ?auto_398673 ) ) ( not ( = ?auto_398669 ?auto_398674 ) ) ( not ( = ?auto_398669 ?auto_398675 ) ) ( not ( = ?auto_398669 ?auto_398676 ) ) ( not ( = ?auto_398670 ?auto_398671 ) ) ( not ( = ?auto_398670 ?auto_398672 ) ) ( not ( = ?auto_398670 ?auto_398673 ) ) ( not ( = ?auto_398670 ?auto_398674 ) ) ( not ( = ?auto_398670 ?auto_398675 ) ) ( not ( = ?auto_398670 ?auto_398676 ) ) ( not ( = ?auto_398671 ?auto_398672 ) ) ( not ( = ?auto_398671 ?auto_398673 ) ) ( not ( = ?auto_398671 ?auto_398674 ) ) ( not ( = ?auto_398671 ?auto_398675 ) ) ( not ( = ?auto_398671 ?auto_398676 ) ) ( not ( = ?auto_398672 ?auto_398673 ) ) ( not ( = ?auto_398672 ?auto_398674 ) ) ( not ( = ?auto_398672 ?auto_398675 ) ) ( not ( = ?auto_398672 ?auto_398676 ) ) ( not ( = ?auto_398673 ?auto_398674 ) ) ( not ( = ?auto_398673 ?auto_398675 ) ) ( not ( = ?auto_398673 ?auto_398676 ) ) ( not ( = ?auto_398674 ?auto_398675 ) ) ( not ( = ?auto_398674 ?auto_398676 ) ) ( not ( = ?auto_398675 ?auto_398676 ) ) ( ON ?auto_398674 ?auto_398675 ) ( ON ?auto_398673 ?auto_398674 ) ( ON ?auto_398672 ?auto_398673 ) ( ON ?auto_398671 ?auto_398672 ) ( ON ?auto_398670 ?auto_398671 ) ( ON ?auto_398669 ?auto_398670 ) ( CLEAR ?auto_398667 ) ( ON ?auto_398668 ?auto_398669 ) ( CLEAR ?auto_398668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_398666 ?auto_398667 ?auto_398668 )
      ( MAKE-10PILE ?auto_398666 ?auto_398667 ?auto_398668 ?auto_398669 ?auto_398670 ?auto_398671 ?auto_398672 ?auto_398673 ?auto_398674 ?auto_398675 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_398708 - BLOCK
      ?auto_398709 - BLOCK
      ?auto_398710 - BLOCK
      ?auto_398711 - BLOCK
      ?auto_398712 - BLOCK
      ?auto_398713 - BLOCK
      ?auto_398714 - BLOCK
      ?auto_398715 - BLOCK
      ?auto_398716 - BLOCK
      ?auto_398717 - BLOCK
    )
    :vars
    (
      ?auto_398718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398717 ?auto_398718 ) ( ON-TABLE ?auto_398708 ) ( not ( = ?auto_398708 ?auto_398709 ) ) ( not ( = ?auto_398708 ?auto_398710 ) ) ( not ( = ?auto_398708 ?auto_398711 ) ) ( not ( = ?auto_398708 ?auto_398712 ) ) ( not ( = ?auto_398708 ?auto_398713 ) ) ( not ( = ?auto_398708 ?auto_398714 ) ) ( not ( = ?auto_398708 ?auto_398715 ) ) ( not ( = ?auto_398708 ?auto_398716 ) ) ( not ( = ?auto_398708 ?auto_398717 ) ) ( not ( = ?auto_398708 ?auto_398718 ) ) ( not ( = ?auto_398709 ?auto_398710 ) ) ( not ( = ?auto_398709 ?auto_398711 ) ) ( not ( = ?auto_398709 ?auto_398712 ) ) ( not ( = ?auto_398709 ?auto_398713 ) ) ( not ( = ?auto_398709 ?auto_398714 ) ) ( not ( = ?auto_398709 ?auto_398715 ) ) ( not ( = ?auto_398709 ?auto_398716 ) ) ( not ( = ?auto_398709 ?auto_398717 ) ) ( not ( = ?auto_398709 ?auto_398718 ) ) ( not ( = ?auto_398710 ?auto_398711 ) ) ( not ( = ?auto_398710 ?auto_398712 ) ) ( not ( = ?auto_398710 ?auto_398713 ) ) ( not ( = ?auto_398710 ?auto_398714 ) ) ( not ( = ?auto_398710 ?auto_398715 ) ) ( not ( = ?auto_398710 ?auto_398716 ) ) ( not ( = ?auto_398710 ?auto_398717 ) ) ( not ( = ?auto_398710 ?auto_398718 ) ) ( not ( = ?auto_398711 ?auto_398712 ) ) ( not ( = ?auto_398711 ?auto_398713 ) ) ( not ( = ?auto_398711 ?auto_398714 ) ) ( not ( = ?auto_398711 ?auto_398715 ) ) ( not ( = ?auto_398711 ?auto_398716 ) ) ( not ( = ?auto_398711 ?auto_398717 ) ) ( not ( = ?auto_398711 ?auto_398718 ) ) ( not ( = ?auto_398712 ?auto_398713 ) ) ( not ( = ?auto_398712 ?auto_398714 ) ) ( not ( = ?auto_398712 ?auto_398715 ) ) ( not ( = ?auto_398712 ?auto_398716 ) ) ( not ( = ?auto_398712 ?auto_398717 ) ) ( not ( = ?auto_398712 ?auto_398718 ) ) ( not ( = ?auto_398713 ?auto_398714 ) ) ( not ( = ?auto_398713 ?auto_398715 ) ) ( not ( = ?auto_398713 ?auto_398716 ) ) ( not ( = ?auto_398713 ?auto_398717 ) ) ( not ( = ?auto_398713 ?auto_398718 ) ) ( not ( = ?auto_398714 ?auto_398715 ) ) ( not ( = ?auto_398714 ?auto_398716 ) ) ( not ( = ?auto_398714 ?auto_398717 ) ) ( not ( = ?auto_398714 ?auto_398718 ) ) ( not ( = ?auto_398715 ?auto_398716 ) ) ( not ( = ?auto_398715 ?auto_398717 ) ) ( not ( = ?auto_398715 ?auto_398718 ) ) ( not ( = ?auto_398716 ?auto_398717 ) ) ( not ( = ?auto_398716 ?auto_398718 ) ) ( not ( = ?auto_398717 ?auto_398718 ) ) ( ON ?auto_398716 ?auto_398717 ) ( ON ?auto_398715 ?auto_398716 ) ( ON ?auto_398714 ?auto_398715 ) ( ON ?auto_398713 ?auto_398714 ) ( ON ?auto_398712 ?auto_398713 ) ( ON ?auto_398711 ?auto_398712 ) ( ON ?auto_398710 ?auto_398711 ) ( CLEAR ?auto_398708 ) ( ON ?auto_398709 ?auto_398710 ) ( CLEAR ?auto_398709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_398708 ?auto_398709 )
      ( MAKE-10PILE ?auto_398708 ?auto_398709 ?auto_398710 ?auto_398711 ?auto_398712 ?auto_398713 ?auto_398714 ?auto_398715 ?auto_398716 ?auto_398717 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_398750 - BLOCK
      ?auto_398751 - BLOCK
      ?auto_398752 - BLOCK
      ?auto_398753 - BLOCK
      ?auto_398754 - BLOCK
      ?auto_398755 - BLOCK
      ?auto_398756 - BLOCK
      ?auto_398757 - BLOCK
      ?auto_398758 - BLOCK
      ?auto_398759 - BLOCK
    )
    :vars
    (
      ?auto_398760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398759 ?auto_398760 ) ( not ( = ?auto_398750 ?auto_398751 ) ) ( not ( = ?auto_398750 ?auto_398752 ) ) ( not ( = ?auto_398750 ?auto_398753 ) ) ( not ( = ?auto_398750 ?auto_398754 ) ) ( not ( = ?auto_398750 ?auto_398755 ) ) ( not ( = ?auto_398750 ?auto_398756 ) ) ( not ( = ?auto_398750 ?auto_398757 ) ) ( not ( = ?auto_398750 ?auto_398758 ) ) ( not ( = ?auto_398750 ?auto_398759 ) ) ( not ( = ?auto_398750 ?auto_398760 ) ) ( not ( = ?auto_398751 ?auto_398752 ) ) ( not ( = ?auto_398751 ?auto_398753 ) ) ( not ( = ?auto_398751 ?auto_398754 ) ) ( not ( = ?auto_398751 ?auto_398755 ) ) ( not ( = ?auto_398751 ?auto_398756 ) ) ( not ( = ?auto_398751 ?auto_398757 ) ) ( not ( = ?auto_398751 ?auto_398758 ) ) ( not ( = ?auto_398751 ?auto_398759 ) ) ( not ( = ?auto_398751 ?auto_398760 ) ) ( not ( = ?auto_398752 ?auto_398753 ) ) ( not ( = ?auto_398752 ?auto_398754 ) ) ( not ( = ?auto_398752 ?auto_398755 ) ) ( not ( = ?auto_398752 ?auto_398756 ) ) ( not ( = ?auto_398752 ?auto_398757 ) ) ( not ( = ?auto_398752 ?auto_398758 ) ) ( not ( = ?auto_398752 ?auto_398759 ) ) ( not ( = ?auto_398752 ?auto_398760 ) ) ( not ( = ?auto_398753 ?auto_398754 ) ) ( not ( = ?auto_398753 ?auto_398755 ) ) ( not ( = ?auto_398753 ?auto_398756 ) ) ( not ( = ?auto_398753 ?auto_398757 ) ) ( not ( = ?auto_398753 ?auto_398758 ) ) ( not ( = ?auto_398753 ?auto_398759 ) ) ( not ( = ?auto_398753 ?auto_398760 ) ) ( not ( = ?auto_398754 ?auto_398755 ) ) ( not ( = ?auto_398754 ?auto_398756 ) ) ( not ( = ?auto_398754 ?auto_398757 ) ) ( not ( = ?auto_398754 ?auto_398758 ) ) ( not ( = ?auto_398754 ?auto_398759 ) ) ( not ( = ?auto_398754 ?auto_398760 ) ) ( not ( = ?auto_398755 ?auto_398756 ) ) ( not ( = ?auto_398755 ?auto_398757 ) ) ( not ( = ?auto_398755 ?auto_398758 ) ) ( not ( = ?auto_398755 ?auto_398759 ) ) ( not ( = ?auto_398755 ?auto_398760 ) ) ( not ( = ?auto_398756 ?auto_398757 ) ) ( not ( = ?auto_398756 ?auto_398758 ) ) ( not ( = ?auto_398756 ?auto_398759 ) ) ( not ( = ?auto_398756 ?auto_398760 ) ) ( not ( = ?auto_398757 ?auto_398758 ) ) ( not ( = ?auto_398757 ?auto_398759 ) ) ( not ( = ?auto_398757 ?auto_398760 ) ) ( not ( = ?auto_398758 ?auto_398759 ) ) ( not ( = ?auto_398758 ?auto_398760 ) ) ( not ( = ?auto_398759 ?auto_398760 ) ) ( ON ?auto_398758 ?auto_398759 ) ( ON ?auto_398757 ?auto_398758 ) ( ON ?auto_398756 ?auto_398757 ) ( ON ?auto_398755 ?auto_398756 ) ( ON ?auto_398754 ?auto_398755 ) ( ON ?auto_398753 ?auto_398754 ) ( ON ?auto_398752 ?auto_398753 ) ( ON ?auto_398751 ?auto_398752 ) ( ON ?auto_398750 ?auto_398751 ) ( CLEAR ?auto_398750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_398750 )
      ( MAKE-10PILE ?auto_398750 ?auto_398751 ?auto_398752 ?auto_398753 ?auto_398754 ?auto_398755 ?auto_398756 ?auto_398757 ?auto_398758 ?auto_398759 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_398793 - BLOCK
      ?auto_398794 - BLOCK
      ?auto_398795 - BLOCK
      ?auto_398796 - BLOCK
      ?auto_398797 - BLOCK
      ?auto_398798 - BLOCK
      ?auto_398799 - BLOCK
      ?auto_398800 - BLOCK
      ?auto_398801 - BLOCK
      ?auto_398802 - BLOCK
      ?auto_398803 - BLOCK
    )
    :vars
    (
      ?auto_398804 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_398802 ) ( ON ?auto_398803 ?auto_398804 ) ( CLEAR ?auto_398803 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_398793 ) ( ON ?auto_398794 ?auto_398793 ) ( ON ?auto_398795 ?auto_398794 ) ( ON ?auto_398796 ?auto_398795 ) ( ON ?auto_398797 ?auto_398796 ) ( ON ?auto_398798 ?auto_398797 ) ( ON ?auto_398799 ?auto_398798 ) ( ON ?auto_398800 ?auto_398799 ) ( ON ?auto_398801 ?auto_398800 ) ( ON ?auto_398802 ?auto_398801 ) ( not ( = ?auto_398793 ?auto_398794 ) ) ( not ( = ?auto_398793 ?auto_398795 ) ) ( not ( = ?auto_398793 ?auto_398796 ) ) ( not ( = ?auto_398793 ?auto_398797 ) ) ( not ( = ?auto_398793 ?auto_398798 ) ) ( not ( = ?auto_398793 ?auto_398799 ) ) ( not ( = ?auto_398793 ?auto_398800 ) ) ( not ( = ?auto_398793 ?auto_398801 ) ) ( not ( = ?auto_398793 ?auto_398802 ) ) ( not ( = ?auto_398793 ?auto_398803 ) ) ( not ( = ?auto_398793 ?auto_398804 ) ) ( not ( = ?auto_398794 ?auto_398795 ) ) ( not ( = ?auto_398794 ?auto_398796 ) ) ( not ( = ?auto_398794 ?auto_398797 ) ) ( not ( = ?auto_398794 ?auto_398798 ) ) ( not ( = ?auto_398794 ?auto_398799 ) ) ( not ( = ?auto_398794 ?auto_398800 ) ) ( not ( = ?auto_398794 ?auto_398801 ) ) ( not ( = ?auto_398794 ?auto_398802 ) ) ( not ( = ?auto_398794 ?auto_398803 ) ) ( not ( = ?auto_398794 ?auto_398804 ) ) ( not ( = ?auto_398795 ?auto_398796 ) ) ( not ( = ?auto_398795 ?auto_398797 ) ) ( not ( = ?auto_398795 ?auto_398798 ) ) ( not ( = ?auto_398795 ?auto_398799 ) ) ( not ( = ?auto_398795 ?auto_398800 ) ) ( not ( = ?auto_398795 ?auto_398801 ) ) ( not ( = ?auto_398795 ?auto_398802 ) ) ( not ( = ?auto_398795 ?auto_398803 ) ) ( not ( = ?auto_398795 ?auto_398804 ) ) ( not ( = ?auto_398796 ?auto_398797 ) ) ( not ( = ?auto_398796 ?auto_398798 ) ) ( not ( = ?auto_398796 ?auto_398799 ) ) ( not ( = ?auto_398796 ?auto_398800 ) ) ( not ( = ?auto_398796 ?auto_398801 ) ) ( not ( = ?auto_398796 ?auto_398802 ) ) ( not ( = ?auto_398796 ?auto_398803 ) ) ( not ( = ?auto_398796 ?auto_398804 ) ) ( not ( = ?auto_398797 ?auto_398798 ) ) ( not ( = ?auto_398797 ?auto_398799 ) ) ( not ( = ?auto_398797 ?auto_398800 ) ) ( not ( = ?auto_398797 ?auto_398801 ) ) ( not ( = ?auto_398797 ?auto_398802 ) ) ( not ( = ?auto_398797 ?auto_398803 ) ) ( not ( = ?auto_398797 ?auto_398804 ) ) ( not ( = ?auto_398798 ?auto_398799 ) ) ( not ( = ?auto_398798 ?auto_398800 ) ) ( not ( = ?auto_398798 ?auto_398801 ) ) ( not ( = ?auto_398798 ?auto_398802 ) ) ( not ( = ?auto_398798 ?auto_398803 ) ) ( not ( = ?auto_398798 ?auto_398804 ) ) ( not ( = ?auto_398799 ?auto_398800 ) ) ( not ( = ?auto_398799 ?auto_398801 ) ) ( not ( = ?auto_398799 ?auto_398802 ) ) ( not ( = ?auto_398799 ?auto_398803 ) ) ( not ( = ?auto_398799 ?auto_398804 ) ) ( not ( = ?auto_398800 ?auto_398801 ) ) ( not ( = ?auto_398800 ?auto_398802 ) ) ( not ( = ?auto_398800 ?auto_398803 ) ) ( not ( = ?auto_398800 ?auto_398804 ) ) ( not ( = ?auto_398801 ?auto_398802 ) ) ( not ( = ?auto_398801 ?auto_398803 ) ) ( not ( = ?auto_398801 ?auto_398804 ) ) ( not ( = ?auto_398802 ?auto_398803 ) ) ( not ( = ?auto_398802 ?auto_398804 ) ) ( not ( = ?auto_398803 ?auto_398804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_398803 ?auto_398804 )
      ( !STACK ?auto_398803 ?auto_398802 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_398839 - BLOCK
      ?auto_398840 - BLOCK
      ?auto_398841 - BLOCK
      ?auto_398842 - BLOCK
      ?auto_398843 - BLOCK
      ?auto_398844 - BLOCK
      ?auto_398845 - BLOCK
      ?auto_398846 - BLOCK
      ?auto_398847 - BLOCK
      ?auto_398848 - BLOCK
      ?auto_398849 - BLOCK
    )
    :vars
    (
      ?auto_398850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398849 ?auto_398850 ) ( ON-TABLE ?auto_398839 ) ( ON ?auto_398840 ?auto_398839 ) ( ON ?auto_398841 ?auto_398840 ) ( ON ?auto_398842 ?auto_398841 ) ( ON ?auto_398843 ?auto_398842 ) ( ON ?auto_398844 ?auto_398843 ) ( ON ?auto_398845 ?auto_398844 ) ( ON ?auto_398846 ?auto_398845 ) ( ON ?auto_398847 ?auto_398846 ) ( not ( = ?auto_398839 ?auto_398840 ) ) ( not ( = ?auto_398839 ?auto_398841 ) ) ( not ( = ?auto_398839 ?auto_398842 ) ) ( not ( = ?auto_398839 ?auto_398843 ) ) ( not ( = ?auto_398839 ?auto_398844 ) ) ( not ( = ?auto_398839 ?auto_398845 ) ) ( not ( = ?auto_398839 ?auto_398846 ) ) ( not ( = ?auto_398839 ?auto_398847 ) ) ( not ( = ?auto_398839 ?auto_398848 ) ) ( not ( = ?auto_398839 ?auto_398849 ) ) ( not ( = ?auto_398839 ?auto_398850 ) ) ( not ( = ?auto_398840 ?auto_398841 ) ) ( not ( = ?auto_398840 ?auto_398842 ) ) ( not ( = ?auto_398840 ?auto_398843 ) ) ( not ( = ?auto_398840 ?auto_398844 ) ) ( not ( = ?auto_398840 ?auto_398845 ) ) ( not ( = ?auto_398840 ?auto_398846 ) ) ( not ( = ?auto_398840 ?auto_398847 ) ) ( not ( = ?auto_398840 ?auto_398848 ) ) ( not ( = ?auto_398840 ?auto_398849 ) ) ( not ( = ?auto_398840 ?auto_398850 ) ) ( not ( = ?auto_398841 ?auto_398842 ) ) ( not ( = ?auto_398841 ?auto_398843 ) ) ( not ( = ?auto_398841 ?auto_398844 ) ) ( not ( = ?auto_398841 ?auto_398845 ) ) ( not ( = ?auto_398841 ?auto_398846 ) ) ( not ( = ?auto_398841 ?auto_398847 ) ) ( not ( = ?auto_398841 ?auto_398848 ) ) ( not ( = ?auto_398841 ?auto_398849 ) ) ( not ( = ?auto_398841 ?auto_398850 ) ) ( not ( = ?auto_398842 ?auto_398843 ) ) ( not ( = ?auto_398842 ?auto_398844 ) ) ( not ( = ?auto_398842 ?auto_398845 ) ) ( not ( = ?auto_398842 ?auto_398846 ) ) ( not ( = ?auto_398842 ?auto_398847 ) ) ( not ( = ?auto_398842 ?auto_398848 ) ) ( not ( = ?auto_398842 ?auto_398849 ) ) ( not ( = ?auto_398842 ?auto_398850 ) ) ( not ( = ?auto_398843 ?auto_398844 ) ) ( not ( = ?auto_398843 ?auto_398845 ) ) ( not ( = ?auto_398843 ?auto_398846 ) ) ( not ( = ?auto_398843 ?auto_398847 ) ) ( not ( = ?auto_398843 ?auto_398848 ) ) ( not ( = ?auto_398843 ?auto_398849 ) ) ( not ( = ?auto_398843 ?auto_398850 ) ) ( not ( = ?auto_398844 ?auto_398845 ) ) ( not ( = ?auto_398844 ?auto_398846 ) ) ( not ( = ?auto_398844 ?auto_398847 ) ) ( not ( = ?auto_398844 ?auto_398848 ) ) ( not ( = ?auto_398844 ?auto_398849 ) ) ( not ( = ?auto_398844 ?auto_398850 ) ) ( not ( = ?auto_398845 ?auto_398846 ) ) ( not ( = ?auto_398845 ?auto_398847 ) ) ( not ( = ?auto_398845 ?auto_398848 ) ) ( not ( = ?auto_398845 ?auto_398849 ) ) ( not ( = ?auto_398845 ?auto_398850 ) ) ( not ( = ?auto_398846 ?auto_398847 ) ) ( not ( = ?auto_398846 ?auto_398848 ) ) ( not ( = ?auto_398846 ?auto_398849 ) ) ( not ( = ?auto_398846 ?auto_398850 ) ) ( not ( = ?auto_398847 ?auto_398848 ) ) ( not ( = ?auto_398847 ?auto_398849 ) ) ( not ( = ?auto_398847 ?auto_398850 ) ) ( not ( = ?auto_398848 ?auto_398849 ) ) ( not ( = ?auto_398848 ?auto_398850 ) ) ( not ( = ?auto_398849 ?auto_398850 ) ) ( CLEAR ?auto_398847 ) ( ON ?auto_398848 ?auto_398849 ) ( CLEAR ?auto_398848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_398839 ?auto_398840 ?auto_398841 ?auto_398842 ?auto_398843 ?auto_398844 ?auto_398845 ?auto_398846 ?auto_398847 ?auto_398848 )
      ( MAKE-11PILE ?auto_398839 ?auto_398840 ?auto_398841 ?auto_398842 ?auto_398843 ?auto_398844 ?auto_398845 ?auto_398846 ?auto_398847 ?auto_398848 ?auto_398849 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_398885 - BLOCK
      ?auto_398886 - BLOCK
      ?auto_398887 - BLOCK
      ?auto_398888 - BLOCK
      ?auto_398889 - BLOCK
      ?auto_398890 - BLOCK
      ?auto_398891 - BLOCK
      ?auto_398892 - BLOCK
      ?auto_398893 - BLOCK
      ?auto_398894 - BLOCK
      ?auto_398895 - BLOCK
    )
    :vars
    (
      ?auto_398896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398895 ?auto_398896 ) ( ON-TABLE ?auto_398885 ) ( ON ?auto_398886 ?auto_398885 ) ( ON ?auto_398887 ?auto_398886 ) ( ON ?auto_398888 ?auto_398887 ) ( ON ?auto_398889 ?auto_398888 ) ( ON ?auto_398890 ?auto_398889 ) ( ON ?auto_398891 ?auto_398890 ) ( ON ?auto_398892 ?auto_398891 ) ( not ( = ?auto_398885 ?auto_398886 ) ) ( not ( = ?auto_398885 ?auto_398887 ) ) ( not ( = ?auto_398885 ?auto_398888 ) ) ( not ( = ?auto_398885 ?auto_398889 ) ) ( not ( = ?auto_398885 ?auto_398890 ) ) ( not ( = ?auto_398885 ?auto_398891 ) ) ( not ( = ?auto_398885 ?auto_398892 ) ) ( not ( = ?auto_398885 ?auto_398893 ) ) ( not ( = ?auto_398885 ?auto_398894 ) ) ( not ( = ?auto_398885 ?auto_398895 ) ) ( not ( = ?auto_398885 ?auto_398896 ) ) ( not ( = ?auto_398886 ?auto_398887 ) ) ( not ( = ?auto_398886 ?auto_398888 ) ) ( not ( = ?auto_398886 ?auto_398889 ) ) ( not ( = ?auto_398886 ?auto_398890 ) ) ( not ( = ?auto_398886 ?auto_398891 ) ) ( not ( = ?auto_398886 ?auto_398892 ) ) ( not ( = ?auto_398886 ?auto_398893 ) ) ( not ( = ?auto_398886 ?auto_398894 ) ) ( not ( = ?auto_398886 ?auto_398895 ) ) ( not ( = ?auto_398886 ?auto_398896 ) ) ( not ( = ?auto_398887 ?auto_398888 ) ) ( not ( = ?auto_398887 ?auto_398889 ) ) ( not ( = ?auto_398887 ?auto_398890 ) ) ( not ( = ?auto_398887 ?auto_398891 ) ) ( not ( = ?auto_398887 ?auto_398892 ) ) ( not ( = ?auto_398887 ?auto_398893 ) ) ( not ( = ?auto_398887 ?auto_398894 ) ) ( not ( = ?auto_398887 ?auto_398895 ) ) ( not ( = ?auto_398887 ?auto_398896 ) ) ( not ( = ?auto_398888 ?auto_398889 ) ) ( not ( = ?auto_398888 ?auto_398890 ) ) ( not ( = ?auto_398888 ?auto_398891 ) ) ( not ( = ?auto_398888 ?auto_398892 ) ) ( not ( = ?auto_398888 ?auto_398893 ) ) ( not ( = ?auto_398888 ?auto_398894 ) ) ( not ( = ?auto_398888 ?auto_398895 ) ) ( not ( = ?auto_398888 ?auto_398896 ) ) ( not ( = ?auto_398889 ?auto_398890 ) ) ( not ( = ?auto_398889 ?auto_398891 ) ) ( not ( = ?auto_398889 ?auto_398892 ) ) ( not ( = ?auto_398889 ?auto_398893 ) ) ( not ( = ?auto_398889 ?auto_398894 ) ) ( not ( = ?auto_398889 ?auto_398895 ) ) ( not ( = ?auto_398889 ?auto_398896 ) ) ( not ( = ?auto_398890 ?auto_398891 ) ) ( not ( = ?auto_398890 ?auto_398892 ) ) ( not ( = ?auto_398890 ?auto_398893 ) ) ( not ( = ?auto_398890 ?auto_398894 ) ) ( not ( = ?auto_398890 ?auto_398895 ) ) ( not ( = ?auto_398890 ?auto_398896 ) ) ( not ( = ?auto_398891 ?auto_398892 ) ) ( not ( = ?auto_398891 ?auto_398893 ) ) ( not ( = ?auto_398891 ?auto_398894 ) ) ( not ( = ?auto_398891 ?auto_398895 ) ) ( not ( = ?auto_398891 ?auto_398896 ) ) ( not ( = ?auto_398892 ?auto_398893 ) ) ( not ( = ?auto_398892 ?auto_398894 ) ) ( not ( = ?auto_398892 ?auto_398895 ) ) ( not ( = ?auto_398892 ?auto_398896 ) ) ( not ( = ?auto_398893 ?auto_398894 ) ) ( not ( = ?auto_398893 ?auto_398895 ) ) ( not ( = ?auto_398893 ?auto_398896 ) ) ( not ( = ?auto_398894 ?auto_398895 ) ) ( not ( = ?auto_398894 ?auto_398896 ) ) ( not ( = ?auto_398895 ?auto_398896 ) ) ( ON ?auto_398894 ?auto_398895 ) ( CLEAR ?auto_398892 ) ( ON ?auto_398893 ?auto_398894 ) ( CLEAR ?auto_398893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_398885 ?auto_398886 ?auto_398887 ?auto_398888 ?auto_398889 ?auto_398890 ?auto_398891 ?auto_398892 ?auto_398893 )
      ( MAKE-11PILE ?auto_398885 ?auto_398886 ?auto_398887 ?auto_398888 ?auto_398889 ?auto_398890 ?auto_398891 ?auto_398892 ?auto_398893 ?auto_398894 ?auto_398895 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_398931 - BLOCK
      ?auto_398932 - BLOCK
      ?auto_398933 - BLOCK
      ?auto_398934 - BLOCK
      ?auto_398935 - BLOCK
      ?auto_398936 - BLOCK
      ?auto_398937 - BLOCK
      ?auto_398938 - BLOCK
      ?auto_398939 - BLOCK
      ?auto_398940 - BLOCK
      ?auto_398941 - BLOCK
    )
    :vars
    (
      ?auto_398942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398941 ?auto_398942 ) ( ON-TABLE ?auto_398931 ) ( ON ?auto_398932 ?auto_398931 ) ( ON ?auto_398933 ?auto_398932 ) ( ON ?auto_398934 ?auto_398933 ) ( ON ?auto_398935 ?auto_398934 ) ( ON ?auto_398936 ?auto_398935 ) ( ON ?auto_398937 ?auto_398936 ) ( not ( = ?auto_398931 ?auto_398932 ) ) ( not ( = ?auto_398931 ?auto_398933 ) ) ( not ( = ?auto_398931 ?auto_398934 ) ) ( not ( = ?auto_398931 ?auto_398935 ) ) ( not ( = ?auto_398931 ?auto_398936 ) ) ( not ( = ?auto_398931 ?auto_398937 ) ) ( not ( = ?auto_398931 ?auto_398938 ) ) ( not ( = ?auto_398931 ?auto_398939 ) ) ( not ( = ?auto_398931 ?auto_398940 ) ) ( not ( = ?auto_398931 ?auto_398941 ) ) ( not ( = ?auto_398931 ?auto_398942 ) ) ( not ( = ?auto_398932 ?auto_398933 ) ) ( not ( = ?auto_398932 ?auto_398934 ) ) ( not ( = ?auto_398932 ?auto_398935 ) ) ( not ( = ?auto_398932 ?auto_398936 ) ) ( not ( = ?auto_398932 ?auto_398937 ) ) ( not ( = ?auto_398932 ?auto_398938 ) ) ( not ( = ?auto_398932 ?auto_398939 ) ) ( not ( = ?auto_398932 ?auto_398940 ) ) ( not ( = ?auto_398932 ?auto_398941 ) ) ( not ( = ?auto_398932 ?auto_398942 ) ) ( not ( = ?auto_398933 ?auto_398934 ) ) ( not ( = ?auto_398933 ?auto_398935 ) ) ( not ( = ?auto_398933 ?auto_398936 ) ) ( not ( = ?auto_398933 ?auto_398937 ) ) ( not ( = ?auto_398933 ?auto_398938 ) ) ( not ( = ?auto_398933 ?auto_398939 ) ) ( not ( = ?auto_398933 ?auto_398940 ) ) ( not ( = ?auto_398933 ?auto_398941 ) ) ( not ( = ?auto_398933 ?auto_398942 ) ) ( not ( = ?auto_398934 ?auto_398935 ) ) ( not ( = ?auto_398934 ?auto_398936 ) ) ( not ( = ?auto_398934 ?auto_398937 ) ) ( not ( = ?auto_398934 ?auto_398938 ) ) ( not ( = ?auto_398934 ?auto_398939 ) ) ( not ( = ?auto_398934 ?auto_398940 ) ) ( not ( = ?auto_398934 ?auto_398941 ) ) ( not ( = ?auto_398934 ?auto_398942 ) ) ( not ( = ?auto_398935 ?auto_398936 ) ) ( not ( = ?auto_398935 ?auto_398937 ) ) ( not ( = ?auto_398935 ?auto_398938 ) ) ( not ( = ?auto_398935 ?auto_398939 ) ) ( not ( = ?auto_398935 ?auto_398940 ) ) ( not ( = ?auto_398935 ?auto_398941 ) ) ( not ( = ?auto_398935 ?auto_398942 ) ) ( not ( = ?auto_398936 ?auto_398937 ) ) ( not ( = ?auto_398936 ?auto_398938 ) ) ( not ( = ?auto_398936 ?auto_398939 ) ) ( not ( = ?auto_398936 ?auto_398940 ) ) ( not ( = ?auto_398936 ?auto_398941 ) ) ( not ( = ?auto_398936 ?auto_398942 ) ) ( not ( = ?auto_398937 ?auto_398938 ) ) ( not ( = ?auto_398937 ?auto_398939 ) ) ( not ( = ?auto_398937 ?auto_398940 ) ) ( not ( = ?auto_398937 ?auto_398941 ) ) ( not ( = ?auto_398937 ?auto_398942 ) ) ( not ( = ?auto_398938 ?auto_398939 ) ) ( not ( = ?auto_398938 ?auto_398940 ) ) ( not ( = ?auto_398938 ?auto_398941 ) ) ( not ( = ?auto_398938 ?auto_398942 ) ) ( not ( = ?auto_398939 ?auto_398940 ) ) ( not ( = ?auto_398939 ?auto_398941 ) ) ( not ( = ?auto_398939 ?auto_398942 ) ) ( not ( = ?auto_398940 ?auto_398941 ) ) ( not ( = ?auto_398940 ?auto_398942 ) ) ( not ( = ?auto_398941 ?auto_398942 ) ) ( ON ?auto_398940 ?auto_398941 ) ( ON ?auto_398939 ?auto_398940 ) ( CLEAR ?auto_398937 ) ( ON ?auto_398938 ?auto_398939 ) ( CLEAR ?auto_398938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_398931 ?auto_398932 ?auto_398933 ?auto_398934 ?auto_398935 ?auto_398936 ?auto_398937 ?auto_398938 )
      ( MAKE-11PILE ?auto_398931 ?auto_398932 ?auto_398933 ?auto_398934 ?auto_398935 ?auto_398936 ?auto_398937 ?auto_398938 ?auto_398939 ?auto_398940 ?auto_398941 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_398977 - BLOCK
      ?auto_398978 - BLOCK
      ?auto_398979 - BLOCK
      ?auto_398980 - BLOCK
      ?auto_398981 - BLOCK
      ?auto_398982 - BLOCK
      ?auto_398983 - BLOCK
      ?auto_398984 - BLOCK
      ?auto_398985 - BLOCK
      ?auto_398986 - BLOCK
      ?auto_398987 - BLOCK
    )
    :vars
    (
      ?auto_398988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_398987 ?auto_398988 ) ( ON-TABLE ?auto_398977 ) ( ON ?auto_398978 ?auto_398977 ) ( ON ?auto_398979 ?auto_398978 ) ( ON ?auto_398980 ?auto_398979 ) ( ON ?auto_398981 ?auto_398980 ) ( ON ?auto_398982 ?auto_398981 ) ( not ( = ?auto_398977 ?auto_398978 ) ) ( not ( = ?auto_398977 ?auto_398979 ) ) ( not ( = ?auto_398977 ?auto_398980 ) ) ( not ( = ?auto_398977 ?auto_398981 ) ) ( not ( = ?auto_398977 ?auto_398982 ) ) ( not ( = ?auto_398977 ?auto_398983 ) ) ( not ( = ?auto_398977 ?auto_398984 ) ) ( not ( = ?auto_398977 ?auto_398985 ) ) ( not ( = ?auto_398977 ?auto_398986 ) ) ( not ( = ?auto_398977 ?auto_398987 ) ) ( not ( = ?auto_398977 ?auto_398988 ) ) ( not ( = ?auto_398978 ?auto_398979 ) ) ( not ( = ?auto_398978 ?auto_398980 ) ) ( not ( = ?auto_398978 ?auto_398981 ) ) ( not ( = ?auto_398978 ?auto_398982 ) ) ( not ( = ?auto_398978 ?auto_398983 ) ) ( not ( = ?auto_398978 ?auto_398984 ) ) ( not ( = ?auto_398978 ?auto_398985 ) ) ( not ( = ?auto_398978 ?auto_398986 ) ) ( not ( = ?auto_398978 ?auto_398987 ) ) ( not ( = ?auto_398978 ?auto_398988 ) ) ( not ( = ?auto_398979 ?auto_398980 ) ) ( not ( = ?auto_398979 ?auto_398981 ) ) ( not ( = ?auto_398979 ?auto_398982 ) ) ( not ( = ?auto_398979 ?auto_398983 ) ) ( not ( = ?auto_398979 ?auto_398984 ) ) ( not ( = ?auto_398979 ?auto_398985 ) ) ( not ( = ?auto_398979 ?auto_398986 ) ) ( not ( = ?auto_398979 ?auto_398987 ) ) ( not ( = ?auto_398979 ?auto_398988 ) ) ( not ( = ?auto_398980 ?auto_398981 ) ) ( not ( = ?auto_398980 ?auto_398982 ) ) ( not ( = ?auto_398980 ?auto_398983 ) ) ( not ( = ?auto_398980 ?auto_398984 ) ) ( not ( = ?auto_398980 ?auto_398985 ) ) ( not ( = ?auto_398980 ?auto_398986 ) ) ( not ( = ?auto_398980 ?auto_398987 ) ) ( not ( = ?auto_398980 ?auto_398988 ) ) ( not ( = ?auto_398981 ?auto_398982 ) ) ( not ( = ?auto_398981 ?auto_398983 ) ) ( not ( = ?auto_398981 ?auto_398984 ) ) ( not ( = ?auto_398981 ?auto_398985 ) ) ( not ( = ?auto_398981 ?auto_398986 ) ) ( not ( = ?auto_398981 ?auto_398987 ) ) ( not ( = ?auto_398981 ?auto_398988 ) ) ( not ( = ?auto_398982 ?auto_398983 ) ) ( not ( = ?auto_398982 ?auto_398984 ) ) ( not ( = ?auto_398982 ?auto_398985 ) ) ( not ( = ?auto_398982 ?auto_398986 ) ) ( not ( = ?auto_398982 ?auto_398987 ) ) ( not ( = ?auto_398982 ?auto_398988 ) ) ( not ( = ?auto_398983 ?auto_398984 ) ) ( not ( = ?auto_398983 ?auto_398985 ) ) ( not ( = ?auto_398983 ?auto_398986 ) ) ( not ( = ?auto_398983 ?auto_398987 ) ) ( not ( = ?auto_398983 ?auto_398988 ) ) ( not ( = ?auto_398984 ?auto_398985 ) ) ( not ( = ?auto_398984 ?auto_398986 ) ) ( not ( = ?auto_398984 ?auto_398987 ) ) ( not ( = ?auto_398984 ?auto_398988 ) ) ( not ( = ?auto_398985 ?auto_398986 ) ) ( not ( = ?auto_398985 ?auto_398987 ) ) ( not ( = ?auto_398985 ?auto_398988 ) ) ( not ( = ?auto_398986 ?auto_398987 ) ) ( not ( = ?auto_398986 ?auto_398988 ) ) ( not ( = ?auto_398987 ?auto_398988 ) ) ( ON ?auto_398986 ?auto_398987 ) ( ON ?auto_398985 ?auto_398986 ) ( ON ?auto_398984 ?auto_398985 ) ( CLEAR ?auto_398982 ) ( ON ?auto_398983 ?auto_398984 ) ( CLEAR ?auto_398983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_398977 ?auto_398978 ?auto_398979 ?auto_398980 ?auto_398981 ?auto_398982 ?auto_398983 )
      ( MAKE-11PILE ?auto_398977 ?auto_398978 ?auto_398979 ?auto_398980 ?auto_398981 ?auto_398982 ?auto_398983 ?auto_398984 ?auto_398985 ?auto_398986 ?auto_398987 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_399023 - BLOCK
      ?auto_399024 - BLOCK
      ?auto_399025 - BLOCK
      ?auto_399026 - BLOCK
      ?auto_399027 - BLOCK
      ?auto_399028 - BLOCK
      ?auto_399029 - BLOCK
      ?auto_399030 - BLOCK
      ?auto_399031 - BLOCK
      ?auto_399032 - BLOCK
      ?auto_399033 - BLOCK
    )
    :vars
    (
      ?auto_399034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399033 ?auto_399034 ) ( ON-TABLE ?auto_399023 ) ( ON ?auto_399024 ?auto_399023 ) ( ON ?auto_399025 ?auto_399024 ) ( ON ?auto_399026 ?auto_399025 ) ( ON ?auto_399027 ?auto_399026 ) ( not ( = ?auto_399023 ?auto_399024 ) ) ( not ( = ?auto_399023 ?auto_399025 ) ) ( not ( = ?auto_399023 ?auto_399026 ) ) ( not ( = ?auto_399023 ?auto_399027 ) ) ( not ( = ?auto_399023 ?auto_399028 ) ) ( not ( = ?auto_399023 ?auto_399029 ) ) ( not ( = ?auto_399023 ?auto_399030 ) ) ( not ( = ?auto_399023 ?auto_399031 ) ) ( not ( = ?auto_399023 ?auto_399032 ) ) ( not ( = ?auto_399023 ?auto_399033 ) ) ( not ( = ?auto_399023 ?auto_399034 ) ) ( not ( = ?auto_399024 ?auto_399025 ) ) ( not ( = ?auto_399024 ?auto_399026 ) ) ( not ( = ?auto_399024 ?auto_399027 ) ) ( not ( = ?auto_399024 ?auto_399028 ) ) ( not ( = ?auto_399024 ?auto_399029 ) ) ( not ( = ?auto_399024 ?auto_399030 ) ) ( not ( = ?auto_399024 ?auto_399031 ) ) ( not ( = ?auto_399024 ?auto_399032 ) ) ( not ( = ?auto_399024 ?auto_399033 ) ) ( not ( = ?auto_399024 ?auto_399034 ) ) ( not ( = ?auto_399025 ?auto_399026 ) ) ( not ( = ?auto_399025 ?auto_399027 ) ) ( not ( = ?auto_399025 ?auto_399028 ) ) ( not ( = ?auto_399025 ?auto_399029 ) ) ( not ( = ?auto_399025 ?auto_399030 ) ) ( not ( = ?auto_399025 ?auto_399031 ) ) ( not ( = ?auto_399025 ?auto_399032 ) ) ( not ( = ?auto_399025 ?auto_399033 ) ) ( not ( = ?auto_399025 ?auto_399034 ) ) ( not ( = ?auto_399026 ?auto_399027 ) ) ( not ( = ?auto_399026 ?auto_399028 ) ) ( not ( = ?auto_399026 ?auto_399029 ) ) ( not ( = ?auto_399026 ?auto_399030 ) ) ( not ( = ?auto_399026 ?auto_399031 ) ) ( not ( = ?auto_399026 ?auto_399032 ) ) ( not ( = ?auto_399026 ?auto_399033 ) ) ( not ( = ?auto_399026 ?auto_399034 ) ) ( not ( = ?auto_399027 ?auto_399028 ) ) ( not ( = ?auto_399027 ?auto_399029 ) ) ( not ( = ?auto_399027 ?auto_399030 ) ) ( not ( = ?auto_399027 ?auto_399031 ) ) ( not ( = ?auto_399027 ?auto_399032 ) ) ( not ( = ?auto_399027 ?auto_399033 ) ) ( not ( = ?auto_399027 ?auto_399034 ) ) ( not ( = ?auto_399028 ?auto_399029 ) ) ( not ( = ?auto_399028 ?auto_399030 ) ) ( not ( = ?auto_399028 ?auto_399031 ) ) ( not ( = ?auto_399028 ?auto_399032 ) ) ( not ( = ?auto_399028 ?auto_399033 ) ) ( not ( = ?auto_399028 ?auto_399034 ) ) ( not ( = ?auto_399029 ?auto_399030 ) ) ( not ( = ?auto_399029 ?auto_399031 ) ) ( not ( = ?auto_399029 ?auto_399032 ) ) ( not ( = ?auto_399029 ?auto_399033 ) ) ( not ( = ?auto_399029 ?auto_399034 ) ) ( not ( = ?auto_399030 ?auto_399031 ) ) ( not ( = ?auto_399030 ?auto_399032 ) ) ( not ( = ?auto_399030 ?auto_399033 ) ) ( not ( = ?auto_399030 ?auto_399034 ) ) ( not ( = ?auto_399031 ?auto_399032 ) ) ( not ( = ?auto_399031 ?auto_399033 ) ) ( not ( = ?auto_399031 ?auto_399034 ) ) ( not ( = ?auto_399032 ?auto_399033 ) ) ( not ( = ?auto_399032 ?auto_399034 ) ) ( not ( = ?auto_399033 ?auto_399034 ) ) ( ON ?auto_399032 ?auto_399033 ) ( ON ?auto_399031 ?auto_399032 ) ( ON ?auto_399030 ?auto_399031 ) ( ON ?auto_399029 ?auto_399030 ) ( CLEAR ?auto_399027 ) ( ON ?auto_399028 ?auto_399029 ) ( CLEAR ?auto_399028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_399023 ?auto_399024 ?auto_399025 ?auto_399026 ?auto_399027 ?auto_399028 )
      ( MAKE-11PILE ?auto_399023 ?auto_399024 ?auto_399025 ?auto_399026 ?auto_399027 ?auto_399028 ?auto_399029 ?auto_399030 ?auto_399031 ?auto_399032 ?auto_399033 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_399069 - BLOCK
      ?auto_399070 - BLOCK
      ?auto_399071 - BLOCK
      ?auto_399072 - BLOCK
      ?auto_399073 - BLOCK
      ?auto_399074 - BLOCK
      ?auto_399075 - BLOCK
      ?auto_399076 - BLOCK
      ?auto_399077 - BLOCK
      ?auto_399078 - BLOCK
      ?auto_399079 - BLOCK
    )
    :vars
    (
      ?auto_399080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399079 ?auto_399080 ) ( ON-TABLE ?auto_399069 ) ( ON ?auto_399070 ?auto_399069 ) ( ON ?auto_399071 ?auto_399070 ) ( ON ?auto_399072 ?auto_399071 ) ( not ( = ?auto_399069 ?auto_399070 ) ) ( not ( = ?auto_399069 ?auto_399071 ) ) ( not ( = ?auto_399069 ?auto_399072 ) ) ( not ( = ?auto_399069 ?auto_399073 ) ) ( not ( = ?auto_399069 ?auto_399074 ) ) ( not ( = ?auto_399069 ?auto_399075 ) ) ( not ( = ?auto_399069 ?auto_399076 ) ) ( not ( = ?auto_399069 ?auto_399077 ) ) ( not ( = ?auto_399069 ?auto_399078 ) ) ( not ( = ?auto_399069 ?auto_399079 ) ) ( not ( = ?auto_399069 ?auto_399080 ) ) ( not ( = ?auto_399070 ?auto_399071 ) ) ( not ( = ?auto_399070 ?auto_399072 ) ) ( not ( = ?auto_399070 ?auto_399073 ) ) ( not ( = ?auto_399070 ?auto_399074 ) ) ( not ( = ?auto_399070 ?auto_399075 ) ) ( not ( = ?auto_399070 ?auto_399076 ) ) ( not ( = ?auto_399070 ?auto_399077 ) ) ( not ( = ?auto_399070 ?auto_399078 ) ) ( not ( = ?auto_399070 ?auto_399079 ) ) ( not ( = ?auto_399070 ?auto_399080 ) ) ( not ( = ?auto_399071 ?auto_399072 ) ) ( not ( = ?auto_399071 ?auto_399073 ) ) ( not ( = ?auto_399071 ?auto_399074 ) ) ( not ( = ?auto_399071 ?auto_399075 ) ) ( not ( = ?auto_399071 ?auto_399076 ) ) ( not ( = ?auto_399071 ?auto_399077 ) ) ( not ( = ?auto_399071 ?auto_399078 ) ) ( not ( = ?auto_399071 ?auto_399079 ) ) ( not ( = ?auto_399071 ?auto_399080 ) ) ( not ( = ?auto_399072 ?auto_399073 ) ) ( not ( = ?auto_399072 ?auto_399074 ) ) ( not ( = ?auto_399072 ?auto_399075 ) ) ( not ( = ?auto_399072 ?auto_399076 ) ) ( not ( = ?auto_399072 ?auto_399077 ) ) ( not ( = ?auto_399072 ?auto_399078 ) ) ( not ( = ?auto_399072 ?auto_399079 ) ) ( not ( = ?auto_399072 ?auto_399080 ) ) ( not ( = ?auto_399073 ?auto_399074 ) ) ( not ( = ?auto_399073 ?auto_399075 ) ) ( not ( = ?auto_399073 ?auto_399076 ) ) ( not ( = ?auto_399073 ?auto_399077 ) ) ( not ( = ?auto_399073 ?auto_399078 ) ) ( not ( = ?auto_399073 ?auto_399079 ) ) ( not ( = ?auto_399073 ?auto_399080 ) ) ( not ( = ?auto_399074 ?auto_399075 ) ) ( not ( = ?auto_399074 ?auto_399076 ) ) ( not ( = ?auto_399074 ?auto_399077 ) ) ( not ( = ?auto_399074 ?auto_399078 ) ) ( not ( = ?auto_399074 ?auto_399079 ) ) ( not ( = ?auto_399074 ?auto_399080 ) ) ( not ( = ?auto_399075 ?auto_399076 ) ) ( not ( = ?auto_399075 ?auto_399077 ) ) ( not ( = ?auto_399075 ?auto_399078 ) ) ( not ( = ?auto_399075 ?auto_399079 ) ) ( not ( = ?auto_399075 ?auto_399080 ) ) ( not ( = ?auto_399076 ?auto_399077 ) ) ( not ( = ?auto_399076 ?auto_399078 ) ) ( not ( = ?auto_399076 ?auto_399079 ) ) ( not ( = ?auto_399076 ?auto_399080 ) ) ( not ( = ?auto_399077 ?auto_399078 ) ) ( not ( = ?auto_399077 ?auto_399079 ) ) ( not ( = ?auto_399077 ?auto_399080 ) ) ( not ( = ?auto_399078 ?auto_399079 ) ) ( not ( = ?auto_399078 ?auto_399080 ) ) ( not ( = ?auto_399079 ?auto_399080 ) ) ( ON ?auto_399078 ?auto_399079 ) ( ON ?auto_399077 ?auto_399078 ) ( ON ?auto_399076 ?auto_399077 ) ( ON ?auto_399075 ?auto_399076 ) ( ON ?auto_399074 ?auto_399075 ) ( CLEAR ?auto_399072 ) ( ON ?auto_399073 ?auto_399074 ) ( CLEAR ?auto_399073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_399069 ?auto_399070 ?auto_399071 ?auto_399072 ?auto_399073 )
      ( MAKE-11PILE ?auto_399069 ?auto_399070 ?auto_399071 ?auto_399072 ?auto_399073 ?auto_399074 ?auto_399075 ?auto_399076 ?auto_399077 ?auto_399078 ?auto_399079 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_399115 - BLOCK
      ?auto_399116 - BLOCK
      ?auto_399117 - BLOCK
      ?auto_399118 - BLOCK
      ?auto_399119 - BLOCK
      ?auto_399120 - BLOCK
      ?auto_399121 - BLOCK
      ?auto_399122 - BLOCK
      ?auto_399123 - BLOCK
      ?auto_399124 - BLOCK
      ?auto_399125 - BLOCK
    )
    :vars
    (
      ?auto_399126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399125 ?auto_399126 ) ( ON-TABLE ?auto_399115 ) ( ON ?auto_399116 ?auto_399115 ) ( ON ?auto_399117 ?auto_399116 ) ( not ( = ?auto_399115 ?auto_399116 ) ) ( not ( = ?auto_399115 ?auto_399117 ) ) ( not ( = ?auto_399115 ?auto_399118 ) ) ( not ( = ?auto_399115 ?auto_399119 ) ) ( not ( = ?auto_399115 ?auto_399120 ) ) ( not ( = ?auto_399115 ?auto_399121 ) ) ( not ( = ?auto_399115 ?auto_399122 ) ) ( not ( = ?auto_399115 ?auto_399123 ) ) ( not ( = ?auto_399115 ?auto_399124 ) ) ( not ( = ?auto_399115 ?auto_399125 ) ) ( not ( = ?auto_399115 ?auto_399126 ) ) ( not ( = ?auto_399116 ?auto_399117 ) ) ( not ( = ?auto_399116 ?auto_399118 ) ) ( not ( = ?auto_399116 ?auto_399119 ) ) ( not ( = ?auto_399116 ?auto_399120 ) ) ( not ( = ?auto_399116 ?auto_399121 ) ) ( not ( = ?auto_399116 ?auto_399122 ) ) ( not ( = ?auto_399116 ?auto_399123 ) ) ( not ( = ?auto_399116 ?auto_399124 ) ) ( not ( = ?auto_399116 ?auto_399125 ) ) ( not ( = ?auto_399116 ?auto_399126 ) ) ( not ( = ?auto_399117 ?auto_399118 ) ) ( not ( = ?auto_399117 ?auto_399119 ) ) ( not ( = ?auto_399117 ?auto_399120 ) ) ( not ( = ?auto_399117 ?auto_399121 ) ) ( not ( = ?auto_399117 ?auto_399122 ) ) ( not ( = ?auto_399117 ?auto_399123 ) ) ( not ( = ?auto_399117 ?auto_399124 ) ) ( not ( = ?auto_399117 ?auto_399125 ) ) ( not ( = ?auto_399117 ?auto_399126 ) ) ( not ( = ?auto_399118 ?auto_399119 ) ) ( not ( = ?auto_399118 ?auto_399120 ) ) ( not ( = ?auto_399118 ?auto_399121 ) ) ( not ( = ?auto_399118 ?auto_399122 ) ) ( not ( = ?auto_399118 ?auto_399123 ) ) ( not ( = ?auto_399118 ?auto_399124 ) ) ( not ( = ?auto_399118 ?auto_399125 ) ) ( not ( = ?auto_399118 ?auto_399126 ) ) ( not ( = ?auto_399119 ?auto_399120 ) ) ( not ( = ?auto_399119 ?auto_399121 ) ) ( not ( = ?auto_399119 ?auto_399122 ) ) ( not ( = ?auto_399119 ?auto_399123 ) ) ( not ( = ?auto_399119 ?auto_399124 ) ) ( not ( = ?auto_399119 ?auto_399125 ) ) ( not ( = ?auto_399119 ?auto_399126 ) ) ( not ( = ?auto_399120 ?auto_399121 ) ) ( not ( = ?auto_399120 ?auto_399122 ) ) ( not ( = ?auto_399120 ?auto_399123 ) ) ( not ( = ?auto_399120 ?auto_399124 ) ) ( not ( = ?auto_399120 ?auto_399125 ) ) ( not ( = ?auto_399120 ?auto_399126 ) ) ( not ( = ?auto_399121 ?auto_399122 ) ) ( not ( = ?auto_399121 ?auto_399123 ) ) ( not ( = ?auto_399121 ?auto_399124 ) ) ( not ( = ?auto_399121 ?auto_399125 ) ) ( not ( = ?auto_399121 ?auto_399126 ) ) ( not ( = ?auto_399122 ?auto_399123 ) ) ( not ( = ?auto_399122 ?auto_399124 ) ) ( not ( = ?auto_399122 ?auto_399125 ) ) ( not ( = ?auto_399122 ?auto_399126 ) ) ( not ( = ?auto_399123 ?auto_399124 ) ) ( not ( = ?auto_399123 ?auto_399125 ) ) ( not ( = ?auto_399123 ?auto_399126 ) ) ( not ( = ?auto_399124 ?auto_399125 ) ) ( not ( = ?auto_399124 ?auto_399126 ) ) ( not ( = ?auto_399125 ?auto_399126 ) ) ( ON ?auto_399124 ?auto_399125 ) ( ON ?auto_399123 ?auto_399124 ) ( ON ?auto_399122 ?auto_399123 ) ( ON ?auto_399121 ?auto_399122 ) ( ON ?auto_399120 ?auto_399121 ) ( ON ?auto_399119 ?auto_399120 ) ( CLEAR ?auto_399117 ) ( ON ?auto_399118 ?auto_399119 ) ( CLEAR ?auto_399118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_399115 ?auto_399116 ?auto_399117 ?auto_399118 )
      ( MAKE-11PILE ?auto_399115 ?auto_399116 ?auto_399117 ?auto_399118 ?auto_399119 ?auto_399120 ?auto_399121 ?auto_399122 ?auto_399123 ?auto_399124 ?auto_399125 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_399161 - BLOCK
      ?auto_399162 - BLOCK
      ?auto_399163 - BLOCK
      ?auto_399164 - BLOCK
      ?auto_399165 - BLOCK
      ?auto_399166 - BLOCK
      ?auto_399167 - BLOCK
      ?auto_399168 - BLOCK
      ?auto_399169 - BLOCK
      ?auto_399170 - BLOCK
      ?auto_399171 - BLOCK
    )
    :vars
    (
      ?auto_399172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399171 ?auto_399172 ) ( ON-TABLE ?auto_399161 ) ( ON ?auto_399162 ?auto_399161 ) ( not ( = ?auto_399161 ?auto_399162 ) ) ( not ( = ?auto_399161 ?auto_399163 ) ) ( not ( = ?auto_399161 ?auto_399164 ) ) ( not ( = ?auto_399161 ?auto_399165 ) ) ( not ( = ?auto_399161 ?auto_399166 ) ) ( not ( = ?auto_399161 ?auto_399167 ) ) ( not ( = ?auto_399161 ?auto_399168 ) ) ( not ( = ?auto_399161 ?auto_399169 ) ) ( not ( = ?auto_399161 ?auto_399170 ) ) ( not ( = ?auto_399161 ?auto_399171 ) ) ( not ( = ?auto_399161 ?auto_399172 ) ) ( not ( = ?auto_399162 ?auto_399163 ) ) ( not ( = ?auto_399162 ?auto_399164 ) ) ( not ( = ?auto_399162 ?auto_399165 ) ) ( not ( = ?auto_399162 ?auto_399166 ) ) ( not ( = ?auto_399162 ?auto_399167 ) ) ( not ( = ?auto_399162 ?auto_399168 ) ) ( not ( = ?auto_399162 ?auto_399169 ) ) ( not ( = ?auto_399162 ?auto_399170 ) ) ( not ( = ?auto_399162 ?auto_399171 ) ) ( not ( = ?auto_399162 ?auto_399172 ) ) ( not ( = ?auto_399163 ?auto_399164 ) ) ( not ( = ?auto_399163 ?auto_399165 ) ) ( not ( = ?auto_399163 ?auto_399166 ) ) ( not ( = ?auto_399163 ?auto_399167 ) ) ( not ( = ?auto_399163 ?auto_399168 ) ) ( not ( = ?auto_399163 ?auto_399169 ) ) ( not ( = ?auto_399163 ?auto_399170 ) ) ( not ( = ?auto_399163 ?auto_399171 ) ) ( not ( = ?auto_399163 ?auto_399172 ) ) ( not ( = ?auto_399164 ?auto_399165 ) ) ( not ( = ?auto_399164 ?auto_399166 ) ) ( not ( = ?auto_399164 ?auto_399167 ) ) ( not ( = ?auto_399164 ?auto_399168 ) ) ( not ( = ?auto_399164 ?auto_399169 ) ) ( not ( = ?auto_399164 ?auto_399170 ) ) ( not ( = ?auto_399164 ?auto_399171 ) ) ( not ( = ?auto_399164 ?auto_399172 ) ) ( not ( = ?auto_399165 ?auto_399166 ) ) ( not ( = ?auto_399165 ?auto_399167 ) ) ( not ( = ?auto_399165 ?auto_399168 ) ) ( not ( = ?auto_399165 ?auto_399169 ) ) ( not ( = ?auto_399165 ?auto_399170 ) ) ( not ( = ?auto_399165 ?auto_399171 ) ) ( not ( = ?auto_399165 ?auto_399172 ) ) ( not ( = ?auto_399166 ?auto_399167 ) ) ( not ( = ?auto_399166 ?auto_399168 ) ) ( not ( = ?auto_399166 ?auto_399169 ) ) ( not ( = ?auto_399166 ?auto_399170 ) ) ( not ( = ?auto_399166 ?auto_399171 ) ) ( not ( = ?auto_399166 ?auto_399172 ) ) ( not ( = ?auto_399167 ?auto_399168 ) ) ( not ( = ?auto_399167 ?auto_399169 ) ) ( not ( = ?auto_399167 ?auto_399170 ) ) ( not ( = ?auto_399167 ?auto_399171 ) ) ( not ( = ?auto_399167 ?auto_399172 ) ) ( not ( = ?auto_399168 ?auto_399169 ) ) ( not ( = ?auto_399168 ?auto_399170 ) ) ( not ( = ?auto_399168 ?auto_399171 ) ) ( not ( = ?auto_399168 ?auto_399172 ) ) ( not ( = ?auto_399169 ?auto_399170 ) ) ( not ( = ?auto_399169 ?auto_399171 ) ) ( not ( = ?auto_399169 ?auto_399172 ) ) ( not ( = ?auto_399170 ?auto_399171 ) ) ( not ( = ?auto_399170 ?auto_399172 ) ) ( not ( = ?auto_399171 ?auto_399172 ) ) ( ON ?auto_399170 ?auto_399171 ) ( ON ?auto_399169 ?auto_399170 ) ( ON ?auto_399168 ?auto_399169 ) ( ON ?auto_399167 ?auto_399168 ) ( ON ?auto_399166 ?auto_399167 ) ( ON ?auto_399165 ?auto_399166 ) ( ON ?auto_399164 ?auto_399165 ) ( CLEAR ?auto_399162 ) ( ON ?auto_399163 ?auto_399164 ) ( CLEAR ?auto_399163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_399161 ?auto_399162 ?auto_399163 )
      ( MAKE-11PILE ?auto_399161 ?auto_399162 ?auto_399163 ?auto_399164 ?auto_399165 ?auto_399166 ?auto_399167 ?auto_399168 ?auto_399169 ?auto_399170 ?auto_399171 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_399207 - BLOCK
      ?auto_399208 - BLOCK
      ?auto_399209 - BLOCK
      ?auto_399210 - BLOCK
      ?auto_399211 - BLOCK
      ?auto_399212 - BLOCK
      ?auto_399213 - BLOCK
      ?auto_399214 - BLOCK
      ?auto_399215 - BLOCK
      ?auto_399216 - BLOCK
      ?auto_399217 - BLOCK
    )
    :vars
    (
      ?auto_399218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399217 ?auto_399218 ) ( ON-TABLE ?auto_399207 ) ( not ( = ?auto_399207 ?auto_399208 ) ) ( not ( = ?auto_399207 ?auto_399209 ) ) ( not ( = ?auto_399207 ?auto_399210 ) ) ( not ( = ?auto_399207 ?auto_399211 ) ) ( not ( = ?auto_399207 ?auto_399212 ) ) ( not ( = ?auto_399207 ?auto_399213 ) ) ( not ( = ?auto_399207 ?auto_399214 ) ) ( not ( = ?auto_399207 ?auto_399215 ) ) ( not ( = ?auto_399207 ?auto_399216 ) ) ( not ( = ?auto_399207 ?auto_399217 ) ) ( not ( = ?auto_399207 ?auto_399218 ) ) ( not ( = ?auto_399208 ?auto_399209 ) ) ( not ( = ?auto_399208 ?auto_399210 ) ) ( not ( = ?auto_399208 ?auto_399211 ) ) ( not ( = ?auto_399208 ?auto_399212 ) ) ( not ( = ?auto_399208 ?auto_399213 ) ) ( not ( = ?auto_399208 ?auto_399214 ) ) ( not ( = ?auto_399208 ?auto_399215 ) ) ( not ( = ?auto_399208 ?auto_399216 ) ) ( not ( = ?auto_399208 ?auto_399217 ) ) ( not ( = ?auto_399208 ?auto_399218 ) ) ( not ( = ?auto_399209 ?auto_399210 ) ) ( not ( = ?auto_399209 ?auto_399211 ) ) ( not ( = ?auto_399209 ?auto_399212 ) ) ( not ( = ?auto_399209 ?auto_399213 ) ) ( not ( = ?auto_399209 ?auto_399214 ) ) ( not ( = ?auto_399209 ?auto_399215 ) ) ( not ( = ?auto_399209 ?auto_399216 ) ) ( not ( = ?auto_399209 ?auto_399217 ) ) ( not ( = ?auto_399209 ?auto_399218 ) ) ( not ( = ?auto_399210 ?auto_399211 ) ) ( not ( = ?auto_399210 ?auto_399212 ) ) ( not ( = ?auto_399210 ?auto_399213 ) ) ( not ( = ?auto_399210 ?auto_399214 ) ) ( not ( = ?auto_399210 ?auto_399215 ) ) ( not ( = ?auto_399210 ?auto_399216 ) ) ( not ( = ?auto_399210 ?auto_399217 ) ) ( not ( = ?auto_399210 ?auto_399218 ) ) ( not ( = ?auto_399211 ?auto_399212 ) ) ( not ( = ?auto_399211 ?auto_399213 ) ) ( not ( = ?auto_399211 ?auto_399214 ) ) ( not ( = ?auto_399211 ?auto_399215 ) ) ( not ( = ?auto_399211 ?auto_399216 ) ) ( not ( = ?auto_399211 ?auto_399217 ) ) ( not ( = ?auto_399211 ?auto_399218 ) ) ( not ( = ?auto_399212 ?auto_399213 ) ) ( not ( = ?auto_399212 ?auto_399214 ) ) ( not ( = ?auto_399212 ?auto_399215 ) ) ( not ( = ?auto_399212 ?auto_399216 ) ) ( not ( = ?auto_399212 ?auto_399217 ) ) ( not ( = ?auto_399212 ?auto_399218 ) ) ( not ( = ?auto_399213 ?auto_399214 ) ) ( not ( = ?auto_399213 ?auto_399215 ) ) ( not ( = ?auto_399213 ?auto_399216 ) ) ( not ( = ?auto_399213 ?auto_399217 ) ) ( not ( = ?auto_399213 ?auto_399218 ) ) ( not ( = ?auto_399214 ?auto_399215 ) ) ( not ( = ?auto_399214 ?auto_399216 ) ) ( not ( = ?auto_399214 ?auto_399217 ) ) ( not ( = ?auto_399214 ?auto_399218 ) ) ( not ( = ?auto_399215 ?auto_399216 ) ) ( not ( = ?auto_399215 ?auto_399217 ) ) ( not ( = ?auto_399215 ?auto_399218 ) ) ( not ( = ?auto_399216 ?auto_399217 ) ) ( not ( = ?auto_399216 ?auto_399218 ) ) ( not ( = ?auto_399217 ?auto_399218 ) ) ( ON ?auto_399216 ?auto_399217 ) ( ON ?auto_399215 ?auto_399216 ) ( ON ?auto_399214 ?auto_399215 ) ( ON ?auto_399213 ?auto_399214 ) ( ON ?auto_399212 ?auto_399213 ) ( ON ?auto_399211 ?auto_399212 ) ( ON ?auto_399210 ?auto_399211 ) ( ON ?auto_399209 ?auto_399210 ) ( CLEAR ?auto_399207 ) ( ON ?auto_399208 ?auto_399209 ) ( CLEAR ?auto_399208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_399207 ?auto_399208 )
      ( MAKE-11PILE ?auto_399207 ?auto_399208 ?auto_399209 ?auto_399210 ?auto_399211 ?auto_399212 ?auto_399213 ?auto_399214 ?auto_399215 ?auto_399216 ?auto_399217 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_399253 - BLOCK
      ?auto_399254 - BLOCK
      ?auto_399255 - BLOCK
      ?auto_399256 - BLOCK
      ?auto_399257 - BLOCK
      ?auto_399258 - BLOCK
      ?auto_399259 - BLOCK
      ?auto_399260 - BLOCK
      ?auto_399261 - BLOCK
      ?auto_399262 - BLOCK
      ?auto_399263 - BLOCK
    )
    :vars
    (
      ?auto_399264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399263 ?auto_399264 ) ( not ( = ?auto_399253 ?auto_399254 ) ) ( not ( = ?auto_399253 ?auto_399255 ) ) ( not ( = ?auto_399253 ?auto_399256 ) ) ( not ( = ?auto_399253 ?auto_399257 ) ) ( not ( = ?auto_399253 ?auto_399258 ) ) ( not ( = ?auto_399253 ?auto_399259 ) ) ( not ( = ?auto_399253 ?auto_399260 ) ) ( not ( = ?auto_399253 ?auto_399261 ) ) ( not ( = ?auto_399253 ?auto_399262 ) ) ( not ( = ?auto_399253 ?auto_399263 ) ) ( not ( = ?auto_399253 ?auto_399264 ) ) ( not ( = ?auto_399254 ?auto_399255 ) ) ( not ( = ?auto_399254 ?auto_399256 ) ) ( not ( = ?auto_399254 ?auto_399257 ) ) ( not ( = ?auto_399254 ?auto_399258 ) ) ( not ( = ?auto_399254 ?auto_399259 ) ) ( not ( = ?auto_399254 ?auto_399260 ) ) ( not ( = ?auto_399254 ?auto_399261 ) ) ( not ( = ?auto_399254 ?auto_399262 ) ) ( not ( = ?auto_399254 ?auto_399263 ) ) ( not ( = ?auto_399254 ?auto_399264 ) ) ( not ( = ?auto_399255 ?auto_399256 ) ) ( not ( = ?auto_399255 ?auto_399257 ) ) ( not ( = ?auto_399255 ?auto_399258 ) ) ( not ( = ?auto_399255 ?auto_399259 ) ) ( not ( = ?auto_399255 ?auto_399260 ) ) ( not ( = ?auto_399255 ?auto_399261 ) ) ( not ( = ?auto_399255 ?auto_399262 ) ) ( not ( = ?auto_399255 ?auto_399263 ) ) ( not ( = ?auto_399255 ?auto_399264 ) ) ( not ( = ?auto_399256 ?auto_399257 ) ) ( not ( = ?auto_399256 ?auto_399258 ) ) ( not ( = ?auto_399256 ?auto_399259 ) ) ( not ( = ?auto_399256 ?auto_399260 ) ) ( not ( = ?auto_399256 ?auto_399261 ) ) ( not ( = ?auto_399256 ?auto_399262 ) ) ( not ( = ?auto_399256 ?auto_399263 ) ) ( not ( = ?auto_399256 ?auto_399264 ) ) ( not ( = ?auto_399257 ?auto_399258 ) ) ( not ( = ?auto_399257 ?auto_399259 ) ) ( not ( = ?auto_399257 ?auto_399260 ) ) ( not ( = ?auto_399257 ?auto_399261 ) ) ( not ( = ?auto_399257 ?auto_399262 ) ) ( not ( = ?auto_399257 ?auto_399263 ) ) ( not ( = ?auto_399257 ?auto_399264 ) ) ( not ( = ?auto_399258 ?auto_399259 ) ) ( not ( = ?auto_399258 ?auto_399260 ) ) ( not ( = ?auto_399258 ?auto_399261 ) ) ( not ( = ?auto_399258 ?auto_399262 ) ) ( not ( = ?auto_399258 ?auto_399263 ) ) ( not ( = ?auto_399258 ?auto_399264 ) ) ( not ( = ?auto_399259 ?auto_399260 ) ) ( not ( = ?auto_399259 ?auto_399261 ) ) ( not ( = ?auto_399259 ?auto_399262 ) ) ( not ( = ?auto_399259 ?auto_399263 ) ) ( not ( = ?auto_399259 ?auto_399264 ) ) ( not ( = ?auto_399260 ?auto_399261 ) ) ( not ( = ?auto_399260 ?auto_399262 ) ) ( not ( = ?auto_399260 ?auto_399263 ) ) ( not ( = ?auto_399260 ?auto_399264 ) ) ( not ( = ?auto_399261 ?auto_399262 ) ) ( not ( = ?auto_399261 ?auto_399263 ) ) ( not ( = ?auto_399261 ?auto_399264 ) ) ( not ( = ?auto_399262 ?auto_399263 ) ) ( not ( = ?auto_399262 ?auto_399264 ) ) ( not ( = ?auto_399263 ?auto_399264 ) ) ( ON ?auto_399262 ?auto_399263 ) ( ON ?auto_399261 ?auto_399262 ) ( ON ?auto_399260 ?auto_399261 ) ( ON ?auto_399259 ?auto_399260 ) ( ON ?auto_399258 ?auto_399259 ) ( ON ?auto_399257 ?auto_399258 ) ( ON ?auto_399256 ?auto_399257 ) ( ON ?auto_399255 ?auto_399256 ) ( ON ?auto_399254 ?auto_399255 ) ( ON ?auto_399253 ?auto_399254 ) ( CLEAR ?auto_399253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_399253 )
      ( MAKE-11PILE ?auto_399253 ?auto_399254 ?auto_399255 ?auto_399256 ?auto_399257 ?auto_399258 ?auto_399259 ?auto_399260 ?auto_399261 ?auto_399262 ?auto_399263 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_399300 - BLOCK
      ?auto_399301 - BLOCK
      ?auto_399302 - BLOCK
      ?auto_399303 - BLOCK
      ?auto_399304 - BLOCK
      ?auto_399305 - BLOCK
      ?auto_399306 - BLOCK
      ?auto_399307 - BLOCK
      ?auto_399308 - BLOCK
      ?auto_399309 - BLOCK
      ?auto_399310 - BLOCK
      ?auto_399311 - BLOCK
    )
    :vars
    (
      ?auto_399312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_399310 ) ( ON ?auto_399311 ?auto_399312 ) ( CLEAR ?auto_399311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_399300 ) ( ON ?auto_399301 ?auto_399300 ) ( ON ?auto_399302 ?auto_399301 ) ( ON ?auto_399303 ?auto_399302 ) ( ON ?auto_399304 ?auto_399303 ) ( ON ?auto_399305 ?auto_399304 ) ( ON ?auto_399306 ?auto_399305 ) ( ON ?auto_399307 ?auto_399306 ) ( ON ?auto_399308 ?auto_399307 ) ( ON ?auto_399309 ?auto_399308 ) ( ON ?auto_399310 ?auto_399309 ) ( not ( = ?auto_399300 ?auto_399301 ) ) ( not ( = ?auto_399300 ?auto_399302 ) ) ( not ( = ?auto_399300 ?auto_399303 ) ) ( not ( = ?auto_399300 ?auto_399304 ) ) ( not ( = ?auto_399300 ?auto_399305 ) ) ( not ( = ?auto_399300 ?auto_399306 ) ) ( not ( = ?auto_399300 ?auto_399307 ) ) ( not ( = ?auto_399300 ?auto_399308 ) ) ( not ( = ?auto_399300 ?auto_399309 ) ) ( not ( = ?auto_399300 ?auto_399310 ) ) ( not ( = ?auto_399300 ?auto_399311 ) ) ( not ( = ?auto_399300 ?auto_399312 ) ) ( not ( = ?auto_399301 ?auto_399302 ) ) ( not ( = ?auto_399301 ?auto_399303 ) ) ( not ( = ?auto_399301 ?auto_399304 ) ) ( not ( = ?auto_399301 ?auto_399305 ) ) ( not ( = ?auto_399301 ?auto_399306 ) ) ( not ( = ?auto_399301 ?auto_399307 ) ) ( not ( = ?auto_399301 ?auto_399308 ) ) ( not ( = ?auto_399301 ?auto_399309 ) ) ( not ( = ?auto_399301 ?auto_399310 ) ) ( not ( = ?auto_399301 ?auto_399311 ) ) ( not ( = ?auto_399301 ?auto_399312 ) ) ( not ( = ?auto_399302 ?auto_399303 ) ) ( not ( = ?auto_399302 ?auto_399304 ) ) ( not ( = ?auto_399302 ?auto_399305 ) ) ( not ( = ?auto_399302 ?auto_399306 ) ) ( not ( = ?auto_399302 ?auto_399307 ) ) ( not ( = ?auto_399302 ?auto_399308 ) ) ( not ( = ?auto_399302 ?auto_399309 ) ) ( not ( = ?auto_399302 ?auto_399310 ) ) ( not ( = ?auto_399302 ?auto_399311 ) ) ( not ( = ?auto_399302 ?auto_399312 ) ) ( not ( = ?auto_399303 ?auto_399304 ) ) ( not ( = ?auto_399303 ?auto_399305 ) ) ( not ( = ?auto_399303 ?auto_399306 ) ) ( not ( = ?auto_399303 ?auto_399307 ) ) ( not ( = ?auto_399303 ?auto_399308 ) ) ( not ( = ?auto_399303 ?auto_399309 ) ) ( not ( = ?auto_399303 ?auto_399310 ) ) ( not ( = ?auto_399303 ?auto_399311 ) ) ( not ( = ?auto_399303 ?auto_399312 ) ) ( not ( = ?auto_399304 ?auto_399305 ) ) ( not ( = ?auto_399304 ?auto_399306 ) ) ( not ( = ?auto_399304 ?auto_399307 ) ) ( not ( = ?auto_399304 ?auto_399308 ) ) ( not ( = ?auto_399304 ?auto_399309 ) ) ( not ( = ?auto_399304 ?auto_399310 ) ) ( not ( = ?auto_399304 ?auto_399311 ) ) ( not ( = ?auto_399304 ?auto_399312 ) ) ( not ( = ?auto_399305 ?auto_399306 ) ) ( not ( = ?auto_399305 ?auto_399307 ) ) ( not ( = ?auto_399305 ?auto_399308 ) ) ( not ( = ?auto_399305 ?auto_399309 ) ) ( not ( = ?auto_399305 ?auto_399310 ) ) ( not ( = ?auto_399305 ?auto_399311 ) ) ( not ( = ?auto_399305 ?auto_399312 ) ) ( not ( = ?auto_399306 ?auto_399307 ) ) ( not ( = ?auto_399306 ?auto_399308 ) ) ( not ( = ?auto_399306 ?auto_399309 ) ) ( not ( = ?auto_399306 ?auto_399310 ) ) ( not ( = ?auto_399306 ?auto_399311 ) ) ( not ( = ?auto_399306 ?auto_399312 ) ) ( not ( = ?auto_399307 ?auto_399308 ) ) ( not ( = ?auto_399307 ?auto_399309 ) ) ( not ( = ?auto_399307 ?auto_399310 ) ) ( not ( = ?auto_399307 ?auto_399311 ) ) ( not ( = ?auto_399307 ?auto_399312 ) ) ( not ( = ?auto_399308 ?auto_399309 ) ) ( not ( = ?auto_399308 ?auto_399310 ) ) ( not ( = ?auto_399308 ?auto_399311 ) ) ( not ( = ?auto_399308 ?auto_399312 ) ) ( not ( = ?auto_399309 ?auto_399310 ) ) ( not ( = ?auto_399309 ?auto_399311 ) ) ( not ( = ?auto_399309 ?auto_399312 ) ) ( not ( = ?auto_399310 ?auto_399311 ) ) ( not ( = ?auto_399310 ?auto_399312 ) ) ( not ( = ?auto_399311 ?auto_399312 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_399311 ?auto_399312 )
      ( !STACK ?auto_399311 ?auto_399310 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_399350 - BLOCK
      ?auto_399351 - BLOCK
      ?auto_399352 - BLOCK
      ?auto_399353 - BLOCK
      ?auto_399354 - BLOCK
      ?auto_399355 - BLOCK
      ?auto_399356 - BLOCK
      ?auto_399357 - BLOCK
      ?auto_399358 - BLOCK
      ?auto_399359 - BLOCK
      ?auto_399360 - BLOCK
      ?auto_399361 - BLOCK
    )
    :vars
    (
      ?auto_399362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399361 ?auto_399362 ) ( ON-TABLE ?auto_399350 ) ( ON ?auto_399351 ?auto_399350 ) ( ON ?auto_399352 ?auto_399351 ) ( ON ?auto_399353 ?auto_399352 ) ( ON ?auto_399354 ?auto_399353 ) ( ON ?auto_399355 ?auto_399354 ) ( ON ?auto_399356 ?auto_399355 ) ( ON ?auto_399357 ?auto_399356 ) ( ON ?auto_399358 ?auto_399357 ) ( ON ?auto_399359 ?auto_399358 ) ( not ( = ?auto_399350 ?auto_399351 ) ) ( not ( = ?auto_399350 ?auto_399352 ) ) ( not ( = ?auto_399350 ?auto_399353 ) ) ( not ( = ?auto_399350 ?auto_399354 ) ) ( not ( = ?auto_399350 ?auto_399355 ) ) ( not ( = ?auto_399350 ?auto_399356 ) ) ( not ( = ?auto_399350 ?auto_399357 ) ) ( not ( = ?auto_399350 ?auto_399358 ) ) ( not ( = ?auto_399350 ?auto_399359 ) ) ( not ( = ?auto_399350 ?auto_399360 ) ) ( not ( = ?auto_399350 ?auto_399361 ) ) ( not ( = ?auto_399350 ?auto_399362 ) ) ( not ( = ?auto_399351 ?auto_399352 ) ) ( not ( = ?auto_399351 ?auto_399353 ) ) ( not ( = ?auto_399351 ?auto_399354 ) ) ( not ( = ?auto_399351 ?auto_399355 ) ) ( not ( = ?auto_399351 ?auto_399356 ) ) ( not ( = ?auto_399351 ?auto_399357 ) ) ( not ( = ?auto_399351 ?auto_399358 ) ) ( not ( = ?auto_399351 ?auto_399359 ) ) ( not ( = ?auto_399351 ?auto_399360 ) ) ( not ( = ?auto_399351 ?auto_399361 ) ) ( not ( = ?auto_399351 ?auto_399362 ) ) ( not ( = ?auto_399352 ?auto_399353 ) ) ( not ( = ?auto_399352 ?auto_399354 ) ) ( not ( = ?auto_399352 ?auto_399355 ) ) ( not ( = ?auto_399352 ?auto_399356 ) ) ( not ( = ?auto_399352 ?auto_399357 ) ) ( not ( = ?auto_399352 ?auto_399358 ) ) ( not ( = ?auto_399352 ?auto_399359 ) ) ( not ( = ?auto_399352 ?auto_399360 ) ) ( not ( = ?auto_399352 ?auto_399361 ) ) ( not ( = ?auto_399352 ?auto_399362 ) ) ( not ( = ?auto_399353 ?auto_399354 ) ) ( not ( = ?auto_399353 ?auto_399355 ) ) ( not ( = ?auto_399353 ?auto_399356 ) ) ( not ( = ?auto_399353 ?auto_399357 ) ) ( not ( = ?auto_399353 ?auto_399358 ) ) ( not ( = ?auto_399353 ?auto_399359 ) ) ( not ( = ?auto_399353 ?auto_399360 ) ) ( not ( = ?auto_399353 ?auto_399361 ) ) ( not ( = ?auto_399353 ?auto_399362 ) ) ( not ( = ?auto_399354 ?auto_399355 ) ) ( not ( = ?auto_399354 ?auto_399356 ) ) ( not ( = ?auto_399354 ?auto_399357 ) ) ( not ( = ?auto_399354 ?auto_399358 ) ) ( not ( = ?auto_399354 ?auto_399359 ) ) ( not ( = ?auto_399354 ?auto_399360 ) ) ( not ( = ?auto_399354 ?auto_399361 ) ) ( not ( = ?auto_399354 ?auto_399362 ) ) ( not ( = ?auto_399355 ?auto_399356 ) ) ( not ( = ?auto_399355 ?auto_399357 ) ) ( not ( = ?auto_399355 ?auto_399358 ) ) ( not ( = ?auto_399355 ?auto_399359 ) ) ( not ( = ?auto_399355 ?auto_399360 ) ) ( not ( = ?auto_399355 ?auto_399361 ) ) ( not ( = ?auto_399355 ?auto_399362 ) ) ( not ( = ?auto_399356 ?auto_399357 ) ) ( not ( = ?auto_399356 ?auto_399358 ) ) ( not ( = ?auto_399356 ?auto_399359 ) ) ( not ( = ?auto_399356 ?auto_399360 ) ) ( not ( = ?auto_399356 ?auto_399361 ) ) ( not ( = ?auto_399356 ?auto_399362 ) ) ( not ( = ?auto_399357 ?auto_399358 ) ) ( not ( = ?auto_399357 ?auto_399359 ) ) ( not ( = ?auto_399357 ?auto_399360 ) ) ( not ( = ?auto_399357 ?auto_399361 ) ) ( not ( = ?auto_399357 ?auto_399362 ) ) ( not ( = ?auto_399358 ?auto_399359 ) ) ( not ( = ?auto_399358 ?auto_399360 ) ) ( not ( = ?auto_399358 ?auto_399361 ) ) ( not ( = ?auto_399358 ?auto_399362 ) ) ( not ( = ?auto_399359 ?auto_399360 ) ) ( not ( = ?auto_399359 ?auto_399361 ) ) ( not ( = ?auto_399359 ?auto_399362 ) ) ( not ( = ?auto_399360 ?auto_399361 ) ) ( not ( = ?auto_399360 ?auto_399362 ) ) ( not ( = ?auto_399361 ?auto_399362 ) ) ( CLEAR ?auto_399359 ) ( ON ?auto_399360 ?auto_399361 ) ( CLEAR ?auto_399360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_399350 ?auto_399351 ?auto_399352 ?auto_399353 ?auto_399354 ?auto_399355 ?auto_399356 ?auto_399357 ?auto_399358 ?auto_399359 ?auto_399360 )
      ( MAKE-12PILE ?auto_399350 ?auto_399351 ?auto_399352 ?auto_399353 ?auto_399354 ?auto_399355 ?auto_399356 ?auto_399357 ?auto_399358 ?auto_399359 ?auto_399360 ?auto_399361 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_399400 - BLOCK
      ?auto_399401 - BLOCK
      ?auto_399402 - BLOCK
      ?auto_399403 - BLOCK
      ?auto_399404 - BLOCK
      ?auto_399405 - BLOCK
      ?auto_399406 - BLOCK
      ?auto_399407 - BLOCK
      ?auto_399408 - BLOCK
      ?auto_399409 - BLOCK
      ?auto_399410 - BLOCK
      ?auto_399411 - BLOCK
    )
    :vars
    (
      ?auto_399412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399411 ?auto_399412 ) ( ON-TABLE ?auto_399400 ) ( ON ?auto_399401 ?auto_399400 ) ( ON ?auto_399402 ?auto_399401 ) ( ON ?auto_399403 ?auto_399402 ) ( ON ?auto_399404 ?auto_399403 ) ( ON ?auto_399405 ?auto_399404 ) ( ON ?auto_399406 ?auto_399405 ) ( ON ?auto_399407 ?auto_399406 ) ( ON ?auto_399408 ?auto_399407 ) ( not ( = ?auto_399400 ?auto_399401 ) ) ( not ( = ?auto_399400 ?auto_399402 ) ) ( not ( = ?auto_399400 ?auto_399403 ) ) ( not ( = ?auto_399400 ?auto_399404 ) ) ( not ( = ?auto_399400 ?auto_399405 ) ) ( not ( = ?auto_399400 ?auto_399406 ) ) ( not ( = ?auto_399400 ?auto_399407 ) ) ( not ( = ?auto_399400 ?auto_399408 ) ) ( not ( = ?auto_399400 ?auto_399409 ) ) ( not ( = ?auto_399400 ?auto_399410 ) ) ( not ( = ?auto_399400 ?auto_399411 ) ) ( not ( = ?auto_399400 ?auto_399412 ) ) ( not ( = ?auto_399401 ?auto_399402 ) ) ( not ( = ?auto_399401 ?auto_399403 ) ) ( not ( = ?auto_399401 ?auto_399404 ) ) ( not ( = ?auto_399401 ?auto_399405 ) ) ( not ( = ?auto_399401 ?auto_399406 ) ) ( not ( = ?auto_399401 ?auto_399407 ) ) ( not ( = ?auto_399401 ?auto_399408 ) ) ( not ( = ?auto_399401 ?auto_399409 ) ) ( not ( = ?auto_399401 ?auto_399410 ) ) ( not ( = ?auto_399401 ?auto_399411 ) ) ( not ( = ?auto_399401 ?auto_399412 ) ) ( not ( = ?auto_399402 ?auto_399403 ) ) ( not ( = ?auto_399402 ?auto_399404 ) ) ( not ( = ?auto_399402 ?auto_399405 ) ) ( not ( = ?auto_399402 ?auto_399406 ) ) ( not ( = ?auto_399402 ?auto_399407 ) ) ( not ( = ?auto_399402 ?auto_399408 ) ) ( not ( = ?auto_399402 ?auto_399409 ) ) ( not ( = ?auto_399402 ?auto_399410 ) ) ( not ( = ?auto_399402 ?auto_399411 ) ) ( not ( = ?auto_399402 ?auto_399412 ) ) ( not ( = ?auto_399403 ?auto_399404 ) ) ( not ( = ?auto_399403 ?auto_399405 ) ) ( not ( = ?auto_399403 ?auto_399406 ) ) ( not ( = ?auto_399403 ?auto_399407 ) ) ( not ( = ?auto_399403 ?auto_399408 ) ) ( not ( = ?auto_399403 ?auto_399409 ) ) ( not ( = ?auto_399403 ?auto_399410 ) ) ( not ( = ?auto_399403 ?auto_399411 ) ) ( not ( = ?auto_399403 ?auto_399412 ) ) ( not ( = ?auto_399404 ?auto_399405 ) ) ( not ( = ?auto_399404 ?auto_399406 ) ) ( not ( = ?auto_399404 ?auto_399407 ) ) ( not ( = ?auto_399404 ?auto_399408 ) ) ( not ( = ?auto_399404 ?auto_399409 ) ) ( not ( = ?auto_399404 ?auto_399410 ) ) ( not ( = ?auto_399404 ?auto_399411 ) ) ( not ( = ?auto_399404 ?auto_399412 ) ) ( not ( = ?auto_399405 ?auto_399406 ) ) ( not ( = ?auto_399405 ?auto_399407 ) ) ( not ( = ?auto_399405 ?auto_399408 ) ) ( not ( = ?auto_399405 ?auto_399409 ) ) ( not ( = ?auto_399405 ?auto_399410 ) ) ( not ( = ?auto_399405 ?auto_399411 ) ) ( not ( = ?auto_399405 ?auto_399412 ) ) ( not ( = ?auto_399406 ?auto_399407 ) ) ( not ( = ?auto_399406 ?auto_399408 ) ) ( not ( = ?auto_399406 ?auto_399409 ) ) ( not ( = ?auto_399406 ?auto_399410 ) ) ( not ( = ?auto_399406 ?auto_399411 ) ) ( not ( = ?auto_399406 ?auto_399412 ) ) ( not ( = ?auto_399407 ?auto_399408 ) ) ( not ( = ?auto_399407 ?auto_399409 ) ) ( not ( = ?auto_399407 ?auto_399410 ) ) ( not ( = ?auto_399407 ?auto_399411 ) ) ( not ( = ?auto_399407 ?auto_399412 ) ) ( not ( = ?auto_399408 ?auto_399409 ) ) ( not ( = ?auto_399408 ?auto_399410 ) ) ( not ( = ?auto_399408 ?auto_399411 ) ) ( not ( = ?auto_399408 ?auto_399412 ) ) ( not ( = ?auto_399409 ?auto_399410 ) ) ( not ( = ?auto_399409 ?auto_399411 ) ) ( not ( = ?auto_399409 ?auto_399412 ) ) ( not ( = ?auto_399410 ?auto_399411 ) ) ( not ( = ?auto_399410 ?auto_399412 ) ) ( not ( = ?auto_399411 ?auto_399412 ) ) ( ON ?auto_399410 ?auto_399411 ) ( CLEAR ?auto_399408 ) ( ON ?auto_399409 ?auto_399410 ) ( CLEAR ?auto_399409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_399400 ?auto_399401 ?auto_399402 ?auto_399403 ?auto_399404 ?auto_399405 ?auto_399406 ?auto_399407 ?auto_399408 ?auto_399409 )
      ( MAKE-12PILE ?auto_399400 ?auto_399401 ?auto_399402 ?auto_399403 ?auto_399404 ?auto_399405 ?auto_399406 ?auto_399407 ?auto_399408 ?auto_399409 ?auto_399410 ?auto_399411 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_399450 - BLOCK
      ?auto_399451 - BLOCK
      ?auto_399452 - BLOCK
      ?auto_399453 - BLOCK
      ?auto_399454 - BLOCK
      ?auto_399455 - BLOCK
      ?auto_399456 - BLOCK
      ?auto_399457 - BLOCK
      ?auto_399458 - BLOCK
      ?auto_399459 - BLOCK
      ?auto_399460 - BLOCK
      ?auto_399461 - BLOCK
    )
    :vars
    (
      ?auto_399462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399461 ?auto_399462 ) ( ON-TABLE ?auto_399450 ) ( ON ?auto_399451 ?auto_399450 ) ( ON ?auto_399452 ?auto_399451 ) ( ON ?auto_399453 ?auto_399452 ) ( ON ?auto_399454 ?auto_399453 ) ( ON ?auto_399455 ?auto_399454 ) ( ON ?auto_399456 ?auto_399455 ) ( ON ?auto_399457 ?auto_399456 ) ( not ( = ?auto_399450 ?auto_399451 ) ) ( not ( = ?auto_399450 ?auto_399452 ) ) ( not ( = ?auto_399450 ?auto_399453 ) ) ( not ( = ?auto_399450 ?auto_399454 ) ) ( not ( = ?auto_399450 ?auto_399455 ) ) ( not ( = ?auto_399450 ?auto_399456 ) ) ( not ( = ?auto_399450 ?auto_399457 ) ) ( not ( = ?auto_399450 ?auto_399458 ) ) ( not ( = ?auto_399450 ?auto_399459 ) ) ( not ( = ?auto_399450 ?auto_399460 ) ) ( not ( = ?auto_399450 ?auto_399461 ) ) ( not ( = ?auto_399450 ?auto_399462 ) ) ( not ( = ?auto_399451 ?auto_399452 ) ) ( not ( = ?auto_399451 ?auto_399453 ) ) ( not ( = ?auto_399451 ?auto_399454 ) ) ( not ( = ?auto_399451 ?auto_399455 ) ) ( not ( = ?auto_399451 ?auto_399456 ) ) ( not ( = ?auto_399451 ?auto_399457 ) ) ( not ( = ?auto_399451 ?auto_399458 ) ) ( not ( = ?auto_399451 ?auto_399459 ) ) ( not ( = ?auto_399451 ?auto_399460 ) ) ( not ( = ?auto_399451 ?auto_399461 ) ) ( not ( = ?auto_399451 ?auto_399462 ) ) ( not ( = ?auto_399452 ?auto_399453 ) ) ( not ( = ?auto_399452 ?auto_399454 ) ) ( not ( = ?auto_399452 ?auto_399455 ) ) ( not ( = ?auto_399452 ?auto_399456 ) ) ( not ( = ?auto_399452 ?auto_399457 ) ) ( not ( = ?auto_399452 ?auto_399458 ) ) ( not ( = ?auto_399452 ?auto_399459 ) ) ( not ( = ?auto_399452 ?auto_399460 ) ) ( not ( = ?auto_399452 ?auto_399461 ) ) ( not ( = ?auto_399452 ?auto_399462 ) ) ( not ( = ?auto_399453 ?auto_399454 ) ) ( not ( = ?auto_399453 ?auto_399455 ) ) ( not ( = ?auto_399453 ?auto_399456 ) ) ( not ( = ?auto_399453 ?auto_399457 ) ) ( not ( = ?auto_399453 ?auto_399458 ) ) ( not ( = ?auto_399453 ?auto_399459 ) ) ( not ( = ?auto_399453 ?auto_399460 ) ) ( not ( = ?auto_399453 ?auto_399461 ) ) ( not ( = ?auto_399453 ?auto_399462 ) ) ( not ( = ?auto_399454 ?auto_399455 ) ) ( not ( = ?auto_399454 ?auto_399456 ) ) ( not ( = ?auto_399454 ?auto_399457 ) ) ( not ( = ?auto_399454 ?auto_399458 ) ) ( not ( = ?auto_399454 ?auto_399459 ) ) ( not ( = ?auto_399454 ?auto_399460 ) ) ( not ( = ?auto_399454 ?auto_399461 ) ) ( not ( = ?auto_399454 ?auto_399462 ) ) ( not ( = ?auto_399455 ?auto_399456 ) ) ( not ( = ?auto_399455 ?auto_399457 ) ) ( not ( = ?auto_399455 ?auto_399458 ) ) ( not ( = ?auto_399455 ?auto_399459 ) ) ( not ( = ?auto_399455 ?auto_399460 ) ) ( not ( = ?auto_399455 ?auto_399461 ) ) ( not ( = ?auto_399455 ?auto_399462 ) ) ( not ( = ?auto_399456 ?auto_399457 ) ) ( not ( = ?auto_399456 ?auto_399458 ) ) ( not ( = ?auto_399456 ?auto_399459 ) ) ( not ( = ?auto_399456 ?auto_399460 ) ) ( not ( = ?auto_399456 ?auto_399461 ) ) ( not ( = ?auto_399456 ?auto_399462 ) ) ( not ( = ?auto_399457 ?auto_399458 ) ) ( not ( = ?auto_399457 ?auto_399459 ) ) ( not ( = ?auto_399457 ?auto_399460 ) ) ( not ( = ?auto_399457 ?auto_399461 ) ) ( not ( = ?auto_399457 ?auto_399462 ) ) ( not ( = ?auto_399458 ?auto_399459 ) ) ( not ( = ?auto_399458 ?auto_399460 ) ) ( not ( = ?auto_399458 ?auto_399461 ) ) ( not ( = ?auto_399458 ?auto_399462 ) ) ( not ( = ?auto_399459 ?auto_399460 ) ) ( not ( = ?auto_399459 ?auto_399461 ) ) ( not ( = ?auto_399459 ?auto_399462 ) ) ( not ( = ?auto_399460 ?auto_399461 ) ) ( not ( = ?auto_399460 ?auto_399462 ) ) ( not ( = ?auto_399461 ?auto_399462 ) ) ( ON ?auto_399460 ?auto_399461 ) ( ON ?auto_399459 ?auto_399460 ) ( CLEAR ?auto_399457 ) ( ON ?auto_399458 ?auto_399459 ) ( CLEAR ?auto_399458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_399450 ?auto_399451 ?auto_399452 ?auto_399453 ?auto_399454 ?auto_399455 ?auto_399456 ?auto_399457 ?auto_399458 )
      ( MAKE-12PILE ?auto_399450 ?auto_399451 ?auto_399452 ?auto_399453 ?auto_399454 ?auto_399455 ?auto_399456 ?auto_399457 ?auto_399458 ?auto_399459 ?auto_399460 ?auto_399461 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_399500 - BLOCK
      ?auto_399501 - BLOCK
      ?auto_399502 - BLOCK
      ?auto_399503 - BLOCK
      ?auto_399504 - BLOCK
      ?auto_399505 - BLOCK
      ?auto_399506 - BLOCK
      ?auto_399507 - BLOCK
      ?auto_399508 - BLOCK
      ?auto_399509 - BLOCK
      ?auto_399510 - BLOCK
      ?auto_399511 - BLOCK
    )
    :vars
    (
      ?auto_399512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399511 ?auto_399512 ) ( ON-TABLE ?auto_399500 ) ( ON ?auto_399501 ?auto_399500 ) ( ON ?auto_399502 ?auto_399501 ) ( ON ?auto_399503 ?auto_399502 ) ( ON ?auto_399504 ?auto_399503 ) ( ON ?auto_399505 ?auto_399504 ) ( ON ?auto_399506 ?auto_399505 ) ( not ( = ?auto_399500 ?auto_399501 ) ) ( not ( = ?auto_399500 ?auto_399502 ) ) ( not ( = ?auto_399500 ?auto_399503 ) ) ( not ( = ?auto_399500 ?auto_399504 ) ) ( not ( = ?auto_399500 ?auto_399505 ) ) ( not ( = ?auto_399500 ?auto_399506 ) ) ( not ( = ?auto_399500 ?auto_399507 ) ) ( not ( = ?auto_399500 ?auto_399508 ) ) ( not ( = ?auto_399500 ?auto_399509 ) ) ( not ( = ?auto_399500 ?auto_399510 ) ) ( not ( = ?auto_399500 ?auto_399511 ) ) ( not ( = ?auto_399500 ?auto_399512 ) ) ( not ( = ?auto_399501 ?auto_399502 ) ) ( not ( = ?auto_399501 ?auto_399503 ) ) ( not ( = ?auto_399501 ?auto_399504 ) ) ( not ( = ?auto_399501 ?auto_399505 ) ) ( not ( = ?auto_399501 ?auto_399506 ) ) ( not ( = ?auto_399501 ?auto_399507 ) ) ( not ( = ?auto_399501 ?auto_399508 ) ) ( not ( = ?auto_399501 ?auto_399509 ) ) ( not ( = ?auto_399501 ?auto_399510 ) ) ( not ( = ?auto_399501 ?auto_399511 ) ) ( not ( = ?auto_399501 ?auto_399512 ) ) ( not ( = ?auto_399502 ?auto_399503 ) ) ( not ( = ?auto_399502 ?auto_399504 ) ) ( not ( = ?auto_399502 ?auto_399505 ) ) ( not ( = ?auto_399502 ?auto_399506 ) ) ( not ( = ?auto_399502 ?auto_399507 ) ) ( not ( = ?auto_399502 ?auto_399508 ) ) ( not ( = ?auto_399502 ?auto_399509 ) ) ( not ( = ?auto_399502 ?auto_399510 ) ) ( not ( = ?auto_399502 ?auto_399511 ) ) ( not ( = ?auto_399502 ?auto_399512 ) ) ( not ( = ?auto_399503 ?auto_399504 ) ) ( not ( = ?auto_399503 ?auto_399505 ) ) ( not ( = ?auto_399503 ?auto_399506 ) ) ( not ( = ?auto_399503 ?auto_399507 ) ) ( not ( = ?auto_399503 ?auto_399508 ) ) ( not ( = ?auto_399503 ?auto_399509 ) ) ( not ( = ?auto_399503 ?auto_399510 ) ) ( not ( = ?auto_399503 ?auto_399511 ) ) ( not ( = ?auto_399503 ?auto_399512 ) ) ( not ( = ?auto_399504 ?auto_399505 ) ) ( not ( = ?auto_399504 ?auto_399506 ) ) ( not ( = ?auto_399504 ?auto_399507 ) ) ( not ( = ?auto_399504 ?auto_399508 ) ) ( not ( = ?auto_399504 ?auto_399509 ) ) ( not ( = ?auto_399504 ?auto_399510 ) ) ( not ( = ?auto_399504 ?auto_399511 ) ) ( not ( = ?auto_399504 ?auto_399512 ) ) ( not ( = ?auto_399505 ?auto_399506 ) ) ( not ( = ?auto_399505 ?auto_399507 ) ) ( not ( = ?auto_399505 ?auto_399508 ) ) ( not ( = ?auto_399505 ?auto_399509 ) ) ( not ( = ?auto_399505 ?auto_399510 ) ) ( not ( = ?auto_399505 ?auto_399511 ) ) ( not ( = ?auto_399505 ?auto_399512 ) ) ( not ( = ?auto_399506 ?auto_399507 ) ) ( not ( = ?auto_399506 ?auto_399508 ) ) ( not ( = ?auto_399506 ?auto_399509 ) ) ( not ( = ?auto_399506 ?auto_399510 ) ) ( not ( = ?auto_399506 ?auto_399511 ) ) ( not ( = ?auto_399506 ?auto_399512 ) ) ( not ( = ?auto_399507 ?auto_399508 ) ) ( not ( = ?auto_399507 ?auto_399509 ) ) ( not ( = ?auto_399507 ?auto_399510 ) ) ( not ( = ?auto_399507 ?auto_399511 ) ) ( not ( = ?auto_399507 ?auto_399512 ) ) ( not ( = ?auto_399508 ?auto_399509 ) ) ( not ( = ?auto_399508 ?auto_399510 ) ) ( not ( = ?auto_399508 ?auto_399511 ) ) ( not ( = ?auto_399508 ?auto_399512 ) ) ( not ( = ?auto_399509 ?auto_399510 ) ) ( not ( = ?auto_399509 ?auto_399511 ) ) ( not ( = ?auto_399509 ?auto_399512 ) ) ( not ( = ?auto_399510 ?auto_399511 ) ) ( not ( = ?auto_399510 ?auto_399512 ) ) ( not ( = ?auto_399511 ?auto_399512 ) ) ( ON ?auto_399510 ?auto_399511 ) ( ON ?auto_399509 ?auto_399510 ) ( ON ?auto_399508 ?auto_399509 ) ( CLEAR ?auto_399506 ) ( ON ?auto_399507 ?auto_399508 ) ( CLEAR ?auto_399507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_399500 ?auto_399501 ?auto_399502 ?auto_399503 ?auto_399504 ?auto_399505 ?auto_399506 ?auto_399507 )
      ( MAKE-12PILE ?auto_399500 ?auto_399501 ?auto_399502 ?auto_399503 ?auto_399504 ?auto_399505 ?auto_399506 ?auto_399507 ?auto_399508 ?auto_399509 ?auto_399510 ?auto_399511 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_399550 - BLOCK
      ?auto_399551 - BLOCK
      ?auto_399552 - BLOCK
      ?auto_399553 - BLOCK
      ?auto_399554 - BLOCK
      ?auto_399555 - BLOCK
      ?auto_399556 - BLOCK
      ?auto_399557 - BLOCK
      ?auto_399558 - BLOCK
      ?auto_399559 - BLOCK
      ?auto_399560 - BLOCK
      ?auto_399561 - BLOCK
    )
    :vars
    (
      ?auto_399562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399561 ?auto_399562 ) ( ON-TABLE ?auto_399550 ) ( ON ?auto_399551 ?auto_399550 ) ( ON ?auto_399552 ?auto_399551 ) ( ON ?auto_399553 ?auto_399552 ) ( ON ?auto_399554 ?auto_399553 ) ( ON ?auto_399555 ?auto_399554 ) ( not ( = ?auto_399550 ?auto_399551 ) ) ( not ( = ?auto_399550 ?auto_399552 ) ) ( not ( = ?auto_399550 ?auto_399553 ) ) ( not ( = ?auto_399550 ?auto_399554 ) ) ( not ( = ?auto_399550 ?auto_399555 ) ) ( not ( = ?auto_399550 ?auto_399556 ) ) ( not ( = ?auto_399550 ?auto_399557 ) ) ( not ( = ?auto_399550 ?auto_399558 ) ) ( not ( = ?auto_399550 ?auto_399559 ) ) ( not ( = ?auto_399550 ?auto_399560 ) ) ( not ( = ?auto_399550 ?auto_399561 ) ) ( not ( = ?auto_399550 ?auto_399562 ) ) ( not ( = ?auto_399551 ?auto_399552 ) ) ( not ( = ?auto_399551 ?auto_399553 ) ) ( not ( = ?auto_399551 ?auto_399554 ) ) ( not ( = ?auto_399551 ?auto_399555 ) ) ( not ( = ?auto_399551 ?auto_399556 ) ) ( not ( = ?auto_399551 ?auto_399557 ) ) ( not ( = ?auto_399551 ?auto_399558 ) ) ( not ( = ?auto_399551 ?auto_399559 ) ) ( not ( = ?auto_399551 ?auto_399560 ) ) ( not ( = ?auto_399551 ?auto_399561 ) ) ( not ( = ?auto_399551 ?auto_399562 ) ) ( not ( = ?auto_399552 ?auto_399553 ) ) ( not ( = ?auto_399552 ?auto_399554 ) ) ( not ( = ?auto_399552 ?auto_399555 ) ) ( not ( = ?auto_399552 ?auto_399556 ) ) ( not ( = ?auto_399552 ?auto_399557 ) ) ( not ( = ?auto_399552 ?auto_399558 ) ) ( not ( = ?auto_399552 ?auto_399559 ) ) ( not ( = ?auto_399552 ?auto_399560 ) ) ( not ( = ?auto_399552 ?auto_399561 ) ) ( not ( = ?auto_399552 ?auto_399562 ) ) ( not ( = ?auto_399553 ?auto_399554 ) ) ( not ( = ?auto_399553 ?auto_399555 ) ) ( not ( = ?auto_399553 ?auto_399556 ) ) ( not ( = ?auto_399553 ?auto_399557 ) ) ( not ( = ?auto_399553 ?auto_399558 ) ) ( not ( = ?auto_399553 ?auto_399559 ) ) ( not ( = ?auto_399553 ?auto_399560 ) ) ( not ( = ?auto_399553 ?auto_399561 ) ) ( not ( = ?auto_399553 ?auto_399562 ) ) ( not ( = ?auto_399554 ?auto_399555 ) ) ( not ( = ?auto_399554 ?auto_399556 ) ) ( not ( = ?auto_399554 ?auto_399557 ) ) ( not ( = ?auto_399554 ?auto_399558 ) ) ( not ( = ?auto_399554 ?auto_399559 ) ) ( not ( = ?auto_399554 ?auto_399560 ) ) ( not ( = ?auto_399554 ?auto_399561 ) ) ( not ( = ?auto_399554 ?auto_399562 ) ) ( not ( = ?auto_399555 ?auto_399556 ) ) ( not ( = ?auto_399555 ?auto_399557 ) ) ( not ( = ?auto_399555 ?auto_399558 ) ) ( not ( = ?auto_399555 ?auto_399559 ) ) ( not ( = ?auto_399555 ?auto_399560 ) ) ( not ( = ?auto_399555 ?auto_399561 ) ) ( not ( = ?auto_399555 ?auto_399562 ) ) ( not ( = ?auto_399556 ?auto_399557 ) ) ( not ( = ?auto_399556 ?auto_399558 ) ) ( not ( = ?auto_399556 ?auto_399559 ) ) ( not ( = ?auto_399556 ?auto_399560 ) ) ( not ( = ?auto_399556 ?auto_399561 ) ) ( not ( = ?auto_399556 ?auto_399562 ) ) ( not ( = ?auto_399557 ?auto_399558 ) ) ( not ( = ?auto_399557 ?auto_399559 ) ) ( not ( = ?auto_399557 ?auto_399560 ) ) ( not ( = ?auto_399557 ?auto_399561 ) ) ( not ( = ?auto_399557 ?auto_399562 ) ) ( not ( = ?auto_399558 ?auto_399559 ) ) ( not ( = ?auto_399558 ?auto_399560 ) ) ( not ( = ?auto_399558 ?auto_399561 ) ) ( not ( = ?auto_399558 ?auto_399562 ) ) ( not ( = ?auto_399559 ?auto_399560 ) ) ( not ( = ?auto_399559 ?auto_399561 ) ) ( not ( = ?auto_399559 ?auto_399562 ) ) ( not ( = ?auto_399560 ?auto_399561 ) ) ( not ( = ?auto_399560 ?auto_399562 ) ) ( not ( = ?auto_399561 ?auto_399562 ) ) ( ON ?auto_399560 ?auto_399561 ) ( ON ?auto_399559 ?auto_399560 ) ( ON ?auto_399558 ?auto_399559 ) ( ON ?auto_399557 ?auto_399558 ) ( CLEAR ?auto_399555 ) ( ON ?auto_399556 ?auto_399557 ) ( CLEAR ?auto_399556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_399550 ?auto_399551 ?auto_399552 ?auto_399553 ?auto_399554 ?auto_399555 ?auto_399556 )
      ( MAKE-12PILE ?auto_399550 ?auto_399551 ?auto_399552 ?auto_399553 ?auto_399554 ?auto_399555 ?auto_399556 ?auto_399557 ?auto_399558 ?auto_399559 ?auto_399560 ?auto_399561 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_399600 - BLOCK
      ?auto_399601 - BLOCK
      ?auto_399602 - BLOCK
      ?auto_399603 - BLOCK
      ?auto_399604 - BLOCK
      ?auto_399605 - BLOCK
      ?auto_399606 - BLOCK
      ?auto_399607 - BLOCK
      ?auto_399608 - BLOCK
      ?auto_399609 - BLOCK
      ?auto_399610 - BLOCK
      ?auto_399611 - BLOCK
    )
    :vars
    (
      ?auto_399612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399611 ?auto_399612 ) ( ON-TABLE ?auto_399600 ) ( ON ?auto_399601 ?auto_399600 ) ( ON ?auto_399602 ?auto_399601 ) ( ON ?auto_399603 ?auto_399602 ) ( ON ?auto_399604 ?auto_399603 ) ( not ( = ?auto_399600 ?auto_399601 ) ) ( not ( = ?auto_399600 ?auto_399602 ) ) ( not ( = ?auto_399600 ?auto_399603 ) ) ( not ( = ?auto_399600 ?auto_399604 ) ) ( not ( = ?auto_399600 ?auto_399605 ) ) ( not ( = ?auto_399600 ?auto_399606 ) ) ( not ( = ?auto_399600 ?auto_399607 ) ) ( not ( = ?auto_399600 ?auto_399608 ) ) ( not ( = ?auto_399600 ?auto_399609 ) ) ( not ( = ?auto_399600 ?auto_399610 ) ) ( not ( = ?auto_399600 ?auto_399611 ) ) ( not ( = ?auto_399600 ?auto_399612 ) ) ( not ( = ?auto_399601 ?auto_399602 ) ) ( not ( = ?auto_399601 ?auto_399603 ) ) ( not ( = ?auto_399601 ?auto_399604 ) ) ( not ( = ?auto_399601 ?auto_399605 ) ) ( not ( = ?auto_399601 ?auto_399606 ) ) ( not ( = ?auto_399601 ?auto_399607 ) ) ( not ( = ?auto_399601 ?auto_399608 ) ) ( not ( = ?auto_399601 ?auto_399609 ) ) ( not ( = ?auto_399601 ?auto_399610 ) ) ( not ( = ?auto_399601 ?auto_399611 ) ) ( not ( = ?auto_399601 ?auto_399612 ) ) ( not ( = ?auto_399602 ?auto_399603 ) ) ( not ( = ?auto_399602 ?auto_399604 ) ) ( not ( = ?auto_399602 ?auto_399605 ) ) ( not ( = ?auto_399602 ?auto_399606 ) ) ( not ( = ?auto_399602 ?auto_399607 ) ) ( not ( = ?auto_399602 ?auto_399608 ) ) ( not ( = ?auto_399602 ?auto_399609 ) ) ( not ( = ?auto_399602 ?auto_399610 ) ) ( not ( = ?auto_399602 ?auto_399611 ) ) ( not ( = ?auto_399602 ?auto_399612 ) ) ( not ( = ?auto_399603 ?auto_399604 ) ) ( not ( = ?auto_399603 ?auto_399605 ) ) ( not ( = ?auto_399603 ?auto_399606 ) ) ( not ( = ?auto_399603 ?auto_399607 ) ) ( not ( = ?auto_399603 ?auto_399608 ) ) ( not ( = ?auto_399603 ?auto_399609 ) ) ( not ( = ?auto_399603 ?auto_399610 ) ) ( not ( = ?auto_399603 ?auto_399611 ) ) ( not ( = ?auto_399603 ?auto_399612 ) ) ( not ( = ?auto_399604 ?auto_399605 ) ) ( not ( = ?auto_399604 ?auto_399606 ) ) ( not ( = ?auto_399604 ?auto_399607 ) ) ( not ( = ?auto_399604 ?auto_399608 ) ) ( not ( = ?auto_399604 ?auto_399609 ) ) ( not ( = ?auto_399604 ?auto_399610 ) ) ( not ( = ?auto_399604 ?auto_399611 ) ) ( not ( = ?auto_399604 ?auto_399612 ) ) ( not ( = ?auto_399605 ?auto_399606 ) ) ( not ( = ?auto_399605 ?auto_399607 ) ) ( not ( = ?auto_399605 ?auto_399608 ) ) ( not ( = ?auto_399605 ?auto_399609 ) ) ( not ( = ?auto_399605 ?auto_399610 ) ) ( not ( = ?auto_399605 ?auto_399611 ) ) ( not ( = ?auto_399605 ?auto_399612 ) ) ( not ( = ?auto_399606 ?auto_399607 ) ) ( not ( = ?auto_399606 ?auto_399608 ) ) ( not ( = ?auto_399606 ?auto_399609 ) ) ( not ( = ?auto_399606 ?auto_399610 ) ) ( not ( = ?auto_399606 ?auto_399611 ) ) ( not ( = ?auto_399606 ?auto_399612 ) ) ( not ( = ?auto_399607 ?auto_399608 ) ) ( not ( = ?auto_399607 ?auto_399609 ) ) ( not ( = ?auto_399607 ?auto_399610 ) ) ( not ( = ?auto_399607 ?auto_399611 ) ) ( not ( = ?auto_399607 ?auto_399612 ) ) ( not ( = ?auto_399608 ?auto_399609 ) ) ( not ( = ?auto_399608 ?auto_399610 ) ) ( not ( = ?auto_399608 ?auto_399611 ) ) ( not ( = ?auto_399608 ?auto_399612 ) ) ( not ( = ?auto_399609 ?auto_399610 ) ) ( not ( = ?auto_399609 ?auto_399611 ) ) ( not ( = ?auto_399609 ?auto_399612 ) ) ( not ( = ?auto_399610 ?auto_399611 ) ) ( not ( = ?auto_399610 ?auto_399612 ) ) ( not ( = ?auto_399611 ?auto_399612 ) ) ( ON ?auto_399610 ?auto_399611 ) ( ON ?auto_399609 ?auto_399610 ) ( ON ?auto_399608 ?auto_399609 ) ( ON ?auto_399607 ?auto_399608 ) ( ON ?auto_399606 ?auto_399607 ) ( CLEAR ?auto_399604 ) ( ON ?auto_399605 ?auto_399606 ) ( CLEAR ?auto_399605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_399600 ?auto_399601 ?auto_399602 ?auto_399603 ?auto_399604 ?auto_399605 )
      ( MAKE-12PILE ?auto_399600 ?auto_399601 ?auto_399602 ?auto_399603 ?auto_399604 ?auto_399605 ?auto_399606 ?auto_399607 ?auto_399608 ?auto_399609 ?auto_399610 ?auto_399611 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_399650 - BLOCK
      ?auto_399651 - BLOCK
      ?auto_399652 - BLOCK
      ?auto_399653 - BLOCK
      ?auto_399654 - BLOCK
      ?auto_399655 - BLOCK
      ?auto_399656 - BLOCK
      ?auto_399657 - BLOCK
      ?auto_399658 - BLOCK
      ?auto_399659 - BLOCK
      ?auto_399660 - BLOCK
      ?auto_399661 - BLOCK
    )
    :vars
    (
      ?auto_399662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399661 ?auto_399662 ) ( ON-TABLE ?auto_399650 ) ( ON ?auto_399651 ?auto_399650 ) ( ON ?auto_399652 ?auto_399651 ) ( ON ?auto_399653 ?auto_399652 ) ( not ( = ?auto_399650 ?auto_399651 ) ) ( not ( = ?auto_399650 ?auto_399652 ) ) ( not ( = ?auto_399650 ?auto_399653 ) ) ( not ( = ?auto_399650 ?auto_399654 ) ) ( not ( = ?auto_399650 ?auto_399655 ) ) ( not ( = ?auto_399650 ?auto_399656 ) ) ( not ( = ?auto_399650 ?auto_399657 ) ) ( not ( = ?auto_399650 ?auto_399658 ) ) ( not ( = ?auto_399650 ?auto_399659 ) ) ( not ( = ?auto_399650 ?auto_399660 ) ) ( not ( = ?auto_399650 ?auto_399661 ) ) ( not ( = ?auto_399650 ?auto_399662 ) ) ( not ( = ?auto_399651 ?auto_399652 ) ) ( not ( = ?auto_399651 ?auto_399653 ) ) ( not ( = ?auto_399651 ?auto_399654 ) ) ( not ( = ?auto_399651 ?auto_399655 ) ) ( not ( = ?auto_399651 ?auto_399656 ) ) ( not ( = ?auto_399651 ?auto_399657 ) ) ( not ( = ?auto_399651 ?auto_399658 ) ) ( not ( = ?auto_399651 ?auto_399659 ) ) ( not ( = ?auto_399651 ?auto_399660 ) ) ( not ( = ?auto_399651 ?auto_399661 ) ) ( not ( = ?auto_399651 ?auto_399662 ) ) ( not ( = ?auto_399652 ?auto_399653 ) ) ( not ( = ?auto_399652 ?auto_399654 ) ) ( not ( = ?auto_399652 ?auto_399655 ) ) ( not ( = ?auto_399652 ?auto_399656 ) ) ( not ( = ?auto_399652 ?auto_399657 ) ) ( not ( = ?auto_399652 ?auto_399658 ) ) ( not ( = ?auto_399652 ?auto_399659 ) ) ( not ( = ?auto_399652 ?auto_399660 ) ) ( not ( = ?auto_399652 ?auto_399661 ) ) ( not ( = ?auto_399652 ?auto_399662 ) ) ( not ( = ?auto_399653 ?auto_399654 ) ) ( not ( = ?auto_399653 ?auto_399655 ) ) ( not ( = ?auto_399653 ?auto_399656 ) ) ( not ( = ?auto_399653 ?auto_399657 ) ) ( not ( = ?auto_399653 ?auto_399658 ) ) ( not ( = ?auto_399653 ?auto_399659 ) ) ( not ( = ?auto_399653 ?auto_399660 ) ) ( not ( = ?auto_399653 ?auto_399661 ) ) ( not ( = ?auto_399653 ?auto_399662 ) ) ( not ( = ?auto_399654 ?auto_399655 ) ) ( not ( = ?auto_399654 ?auto_399656 ) ) ( not ( = ?auto_399654 ?auto_399657 ) ) ( not ( = ?auto_399654 ?auto_399658 ) ) ( not ( = ?auto_399654 ?auto_399659 ) ) ( not ( = ?auto_399654 ?auto_399660 ) ) ( not ( = ?auto_399654 ?auto_399661 ) ) ( not ( = ?auto_399654 ?auto_399662 ) ) ( not ( = ?auto_399655 ?auto_399656 ) ) ( not ( = ?auto_399655 ?auto_399657 ) ) ( not ( = ?auto_399655 ?auto_399658 ) ) ( not ( = ?auto_399655 ?auto_399659 ) ) ( not ( = ?auto_399655 ?auto_399660 ) ) ( not ( = ?auto_399655 ?auto_399661 ) ) ( not ( = ?auto_399655 ?auto_399662 ) ) ( not ( = ?auto_399656 ?auto_399657 ) ) ( not ( = ?auto_399656 ?auto_399658 ) ) ( not ( = ?auto_399656 ?auto_399659 ) ) ( not ( = ?auto_399656 ?auto_399660 ) ) ( not ( = ?auto_399656 ?auto_399661 ) ) ( not ( = ?auto_399656 ?auto_399662 ) ) ( not ( = ?auto_399657 ?auto_399658 ) ) ( not ( = ?auto_399657 ?auto_399659 ) ) ( not ( = ?auto_399657 ?auto_399660 ) ) ( not ( = ?auto_399657 ?auto_399661 ) ) ( not ( = ?auto_399657 ?auto_399662 ) ) ( not ( = ?auto_399658 ?auto_399659 ) ) ( not ( = ?auto_399658 ?auto_399660 ) ) ( not ( = ?auto_399658 ?auto_399661 ) ) ( not ( = ?auto_399658 ?auto_399662 ) ) ( not ( = ?auto_399659 ?auto_399660 ) ) ( not ( = ?auto_399659 ?auto_399661 ) ) ( not ( = ?auto_399659 ?auto_399662 ) ) ( not ( = ?auto_399660 ?auto_399661 ) ) ( not ( = ?auto_399660 ?auto_399662 ) ) ( not ( = ?auto_399661 ?auto_399662 ) ) ( ON ?auto_399660 ?auto_399661 ) ( ON ?auto_399659 ?auto_399660 ) ( ON ?auto_399658 ?auto_399659 ) ( ON ?auto_399657 ?auto_399658 ) ( ON ?auto_399656 ?auto_399657 ) ( ON ?auto_399655 ?auto_399656 ) ( CLEAR ?auto_399653 ) ( ON ?auto_399654 ?auto_399655 ) ( CLEAR ?auto_399654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_399650 ?auto_399651 ?auto_399652 ?auto_399653 ?auto_399654 )
      ( MAKE-12PILE ?auto_399650 ?auto_399651 ?auto_399652 ?auto_399653 ?auto_399654 ?auto_399655 ?auto_399656 ?auto_399657 ?auto_399658 ?auto_399659 ?auto_399660 ?auto_399661 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_399700 - BLOCK
      ?auto_399701 - BLOCK
      ?auto_399702 - BLOCK
      ?auto_399703 - BLOCK
      ?auto_399704 - BLOCK
      ?auto_399705 - BLOCK
      ?auto_399706 - BLOCK
      ?auto_399707 - BLOCK
      ?auto_399708 - BLOCK
      ?auto_399709 - BLOCK
      ?auto_399710 - BLOCK
      ?auto_399711 - BLOCK
    )
    :vars
    (
      ?auto_399712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399711 ?auto_399712 ) ( ON-TABLE ?auto_399700 ) ( ON ?auto_399701 ?auto_399700 ) ( ON ?auto_399702 ?auto_399701 ) ( not ( = ?auto_399700 ?auto_399701 ) ) ( not ( = ?auto_399700 ?auto_399702 ) ) ( not ( = ?auto_399700 ?auto_399703 ) ) ( not ( = ?auto_399700 ?auto_399704 ) ) ( not ( = ?auto_399700 ?auto_399705 ) ) ( not ( = ?auto_399700 ?auto_399706 ) ) ( not ( = ?auto_399700 ?auto_399707 ) ) ( not ( = ?auto_399700 ?auto_399708 ) ) ( not ( = ?auto_399700 ?auto_399709 ) ) ( not ( = ?auto_399700 ?auto_399710 ) ) ( not ( = ?auto_399700 ?auto_399711 ) ) ( not ( = ?auto_399700 ?auto_399712 ) ) ( not ( = ?auto_399701 ?auto_399702 ) ) ( not ( = ?auto_399701 ?auto_399703 ) ) ( not ( = ?auto_399701 ?auto_399704 ) ) ( not ( = ?auto_399701 ?auto_399705 ) ) ( not ( = ?auto_399701 ?auto_399706 ) ) ( not ( = ?auto_399701 ?auto_399707 ) ) ( not ( = ?auto_399701 ?auto_399708 ) ) ( not ( = ?auto_399701 ?auto_399709 ) ) ( not ( = ?auto_399701 ?auto_399710 ) ) ( not ( = ?auto_399701 ?auto_399711 ) ) ( not ( = ?auto_399701 ?auto_399712 ) ) ( not ( = ?auto_399702 ?auto_399703 ) ) ( not ( = ?auto_399702 ?auto_399704 ) ) ( not ( = ?auto_399702 ?auto_399705 ) ) ( not ( = ?auto_399702 ?auto_399706 ) ) ( not ( = ?auto_399702 ?auto_399707 ) ) ( not ( = ?auto_399702 ?auto_399708 ) ) ( not ( = ?auto_399702 ?auto_399709 ) ) ( not ( = ?auto_399702 ?auto_399710 ) ) ( not ( = ?auto_399702 ?auto_399711 ) ) ( not ( = ?auto_399702 ?auto_399712 ) ) ( not ( = ?auto_399703 ?auto_399704 ) ) ( not ( = ?auto_399703 ?auto_399705 ) ) ( not ( = ?auto_399703 ?auto_399706 ) ) ( not ( = ?auto_399703 ?auto_399707 ) ) ( not ( = ?auto_399703 ?auto_399708 ) ) ( not ( = ?auto_399703 ?auto_399709 ) ) ( not ( = ?auto_399703 ?auto_399710 ) ) ( not ( = ?auto_399703 ?auto_399711 ) ) ( not ( = ?auto_399703 ?auto_399712 ) ) ( not ( = ?auto_399704 ?auto_399705 ) ) ( not ( = ?auto_399704 ?auto_399706 ) ) ( not ( = ?auto_399704 ?auto_399707 ) ) ( not ( = ?auto_399704 ?auto_399708 ) ) ( not ( = ?auto_399704 ?auto_399709 ) ) ( not ( = ?auto_399704 ?auto_399710 ) ) ( not ( = ?auto_399704 ?auto_399711 ) ) ( not ( = ?auto_399704 ?auto_399712 ) ) ( not ( = ?auto_399705 ?auto_399706 ) ) ( not ( = ?auto_399705 ?auto_399707 ) ) ( not ( = ?auto_399705 ?auto_399708 ) ) ( not ( = ?auto_399705 ?auto_399709 ) ) ( not ( = ?auto_399705 ?auto_399710 ) ) ( not ( = ?auto_399705 ?auto_399711 ) ) ( not ( = ?auto_399705 ?auto_399712 ) ) ( not ( = ?auto_399706 ?auto_399707 ) ) ( not ( = ?auto_399706 ?auto_399708 ) ) ( not ( = ?auto_399706 ?auto_399709 ) ) ( not ( = ?auto_399706 ?auto_399710 ) ) ( not ( = ?auto_399706 ?auto_399711 ) ) ( not ( = ?auto_399706 ?auto_399712 ) ) ( not ( = ?auto_399707 ?auto_399708 ) ) ( not ( = ?auto_399707 ?auto_399709 ) ) ( not ( = ?auto_399707 ?auto_399710 ) ) ( not ( = ?auto_399707 ?auto_399711 ) ) ( not ( = ?auto_399707 ?auto_399712 ) ) ( not ( = ?auto_399708 ?auto_399709 ) ) ( not ( = ?auto_399708 ?auto_399710 ) ) ( not ( = ?auto_399708 ?auto_399711 ) ) ( not ( = ?auto_399708 ?auto_399712 ) ) ( not ( = ?auto_399709 ?auto_399710 ) ) ( not ( = ?auto_399709 ?auto_399711 ) ) ( not ( = ?auto_399709 ?auto_399712 ) ) ( not ( = ?auto_399710 ?auto_399711 ) ) ( not ( = ?auto_399710 ?auto_399712 ) ) ( not ( = ?auto_399711 ?auto_399712 ) ) ( ON ?auto_399710 ?auto_399711 ) ( ON ?auto_399709 ?auto_399710 ) ( ON ?auto_399708 ?auto_399709 ) ( ON ?auto_399707 ?auto_399708 ) ( ON ?auto_399706 ?auto_399707 ) ( ON ?auto_399705 ?auto_399706 ) ( ON ?auto_399704 ?auto_399705 ) ( CLEAR ?auto_399702 ) ( ON ?auto_399703 ?auto_399704 ) ( CLEAR ?auto_399703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_399700 ?auto_399701 ?auto_399702 ?auto_399703 )
      ( MAKE-12PILE ?auto_399700 ?auto_399701 ?auto_399702 ?auto_399703 ?auto_399704 ?auto_399705 ?auto_399706 ?auto_399707 ?auto_399708 ?auto_399709 ?auto_399710 ?auto_399711 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_399750 - BLOCK
      ?auto_399751 - BLOCK
      ?auto_399752 - BLOCK
      ?auto_399753 - BLOCK
      ?auto_399754 - BLOCK
      ?auto_399755 - BLOCK
      ?auto_399756 - BLOCK
      ?auto_399757 - BLOCK
      ?auto_399758 - BLOCK
      ?auto_399759 - BLOCK
      ?auto_399760 - BLOCK
      ?auto_399761 - BLOCK
    )
    :vars
    (
      ?auto_399762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399761 ?auto_399762 ) ( ON-TABLE ?auto_399750 ) ( ON ?auto_399751 ?auto_399750 ) ( not ( = ?auto_399750 ?auto_399751 ) ) ( not ( = ?auto_399750 ?auto_399752 ) ) ( not ( = ?auto_399750 ?auto_399753 ) ) ( not ( = ?auto_399750 ?auto_399754 ) ) ( not ( = ?auto_399750 ?auto_399755 ) ) ( not ( = ?auto_399750 ?auto_399756 ) ) ( not ( = ?auto_399750 ?auto_399757 ) ) ( not ( = ?auto_399750 ?auto_399758 ) ) ( not ( = ?auto_399750 ?auto_399759 ) ) ( not ( = ?auto_399750 ?auto_399760 ) ) ( not ( = ?auto_399750 ?auto_399761 ) ) ( not ( = ?auto_399750 ?auto_399762 ) ) ( not ( = ?auto_399751 ?auto_399752 ) ) ( not ( = ?auto_399751 ?auto_399753 ) ) ( not ( = ?auto_399751 ?auto_399754 ) ) ( not ( = ?auto_399751 ?auto_399755 ) ) ( not ( = ?auto_399751 ?auto_399756 ) ) ( not ( = ?auto_399751 ?auto_399757 ) ) ( not ( = ?auto_399751 ?auto_399758 ) ) ( not ( = ?auto_399751 ?auto_399759 ) ) ( not ( = ?auto_399751 ?auto_399760 ) ) ( not ( = ?auto_399751 ?auto_399761 ) ) ( not ( = ?auto_399751 ?auto_399762 ) ) ( not ( = ?auto_399752 ?auto_399753 ) ) ( not ( = ?auto_399752 ?auto_399754 ) ) ( not ( = ?auto_399752 ?auto_399755 ) ) ( not ( = ?auto_399752 ?auto_399756 ) ) ( not ( = ?auto_399752 ?auto_399757 ) ) ( not ( = ?auto_399752 ?auto_399758 ) ) ( not ( = ?auto_399752 ?auto_399759 ) ) ( not ( = ?auto_399752 ?auto_399760 ) ) ( not ( = ?auto_399752 ?auto_399761 ) ) ( not ( = ?auto_399752 ?auto_399762 ) ) ( not ( = ?auto_399753 ?auto_399754 ) ) ( not ( = ?auto_399753 ?auto_399755 ) ) ( not ( = ?auto_399753 ?auto_399756 ) ) ( not ( = ?auto_399753 ?auto_399757 ) ) ( not ( = ?auto_399753 ?auto_399758 ) ) ( not ( = ?auto_399753 ?auto_399759 ) ) ( not ( = ?auto_399753 ?auto_399760 ) ) ( not ( = ?auto_399753 ?auto_399761 ) ) ( not ( = ?auto_399753 ?auto_399762 ) ) ( not ( = ?auto_399754 ?auto_399755 ) ) ( not ( = ?auto_399754 ?auto_399756 ) ) ( not ( = ?auto_399754 ?auto_399757 ) ) ( not ( = ?auto_399754 ?auto_399758 ) ) ( not ( = ?auto_399754 ?auto_399759 ) ) ( not ( = ?auto_399754 ?auto_399760 ) ) ( not ( = ?auto_399754 ?auto_399761 ) ) ( not ( = ?auto_399754 ?auto_399762 ) ) ( not ( = ?auto_399755 ?auto_399756 ) ) ( not ( = ?auto_399755 ?auto_399757 ) ) ( not ( = ?auto_399755 ?auto_399758 ) ) ( not ( = ?auto_399755 ?auto_399759 ) ) ( not ( = ?auto_399755 ?auto_399760 ) ) ( not ( = ?auto_399755 ?auto_399761 ) ) ( not ( = ?auto_399755 ?auto_399762 ) ) ( not ( = ?auto_399756 ?auto_399757 ) ) ( not ( = ?auto_399756 ?auto_399758 ) ) ( not ( = ?auto_399756 ?auto_399759 ) ) ( not ( = ?auto_399756 ?auto_399760 ) ) ( not ( = ?auto_399756 ?auto_399761 ) ) ( not ( = ?auto_399756 ?auto_399762 ) ) ( not ( = ?auto_399757 ?auto_399758 ) ) ( not ( = ?auto_399757 ?auto_399759 ) ) ( not ( = ?auto_399757 ?auto_399760 ) ) ( not ( = ?auto_399757 ?auto_399761 ) ) ( not ( = ?auto_399757 ?auto_399762 ) ) ( not ( = ?auto_399758 ?auto_399759 ) ) ( not ( = ?auto_399758 ?auto_399760 ) ) ( not ( = ?auto_399758 ?auto_399761 ) ) ( not ( = ?auto_399758 ?auto_399762 ) ) ( not ( = ?auto_399759 ?auto_399760 ) ) ( not ( = ?auto_399759 ?auto_399761 ) ) ( not ( = ?auto_399759 ?auto_399762 ) ) ( not ( = ?auto_399760 ?auto_399761 ) ) ( not ( = ?auto_399760 ?auto_399762 ) ) ( not ( = ?auto_399761 ?auto_399762 ) ) ( ON ?auto_399760 ?auto_399761 ) ( ON ?auto_399759 ?auto_399760 ) ( ON ?auto_399758 ?auto_399759 ) ( ON ?auto_399757 ?auto_399758 ) ( ON ?auto_399756 ?auto_399757 ) ( ON ?auto_399755 ?auto_399756 ) ( ON ?auto_399754 ?auto_399755 ) ( ON ?auto_399753 ?auto_399754 ) ( CLEAR ?auto_399751 ) ( ON ?auto_399752 ?auto_399753 ) ( CLEAR ?auto_399752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_399750 ?auto_399751 ?auto_399752 )
      ( MAKE-12PILE ?auto_399750 ?auto_399751 ?auto_399752 ?auto_399753 ?auto_399754 ?auto_399755 ?auto_399756 ?auto_399757 ?auto_399758 ?auto_399759 ?auto_399760 ?auto_399761 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_399800 - BLOCK
      ?auto_399801 - BLOCK
      ?auto_399802 - BLOCK
      ?auto_399803 - BLOCK
      ?auto_399804 - BLOCK
      ?auto_399805 - BLOCK
      ?auto_399806 - BLOCK
      ?auto_399807 - BLOCK
      ?auto_399808 - BLOCK
      ?auto_399809 - BLOCK
      ?auto_399810 - BLOCK
      ?auto_399811 - BLOCK
    )
    :vars
    (
      ?auto_399812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399811 ?auto_399812 ) ( ON-TABLE ?auto_399800 ) ( not ( = ?auto_399800 ?auto_399801 ) ) ( not ( = ?auto_399800 ?auto_399802 ) ) ( not ( = ?auto_399800 ?auto_399803 ) ) ( not ( = ?auto_399800 ?auto_399804 ) ) ( not ( = ?auto_399800 ?auto_399805 ) ) ( not ( = ?auto_399800 ?auto_399806 ) ) ( not ( = ?auto_399800 ?auto_399807 ) ) ( not ( = ?auto_399800 ?auto_399808 ) ) ( not ( = ?auto_399800 ?auto_399809 ) ) ( not ( = ?auto_399800 ?auto_399810 ) ) ( not ( = ?auto_399800 ?auto_399811 ) ) ( not ( = ?auto_399800 ?auto_399812 ) ) ( not ( = ?auto_399801 ?auto_399802 ) ) ( not ( = ?auto_399801 ?auto_399803 ) ) ( not ( = ?auto_399801 ?auto_399804 ) ) ( not ( = ?auto_399801 ?auto_399805 ) ) ( not ( = ?auto_399801 ?auto_399806 ) ) ( not ( = ?auto_399801 ?auto_399807 ) ) ( not ( = ?auto_399801 ?auto_399808 ) ) ( not ( = ?auto_399801 ?auto_399809 ) ) ( not ( = ?auto_399801 ?auto_399810 ) ) ( not ( = ?auto_399801 ?auto_399811 ) ) ( not ( = ?auto_399801 ?auto_399812 ) ) ( not ( = ?auto_399802 ?auto_399803 ) ) ( not ( = ?auto_399802 ?auto_399804 ) ) ( not ( = ?auto_399802 ?auto_399805 ) ) ( not ( = ?auto_399802 ?auto_399806 ) ) ( not ( = ?auto_399802 ?auto_399807 ) ) ( not ( = ?auto_399802 ?auto_399808 ) ) ( not ( = ?auto_399802 ?auto_399809 ) ) ( not ( = ?auto_399802 ?auto_399810 ) ) ( not ( = ?auto_399802 ?auto_399811 ) ) ( not ( = ?auto_399802 ?auto_399812 ) ) ( not ( = ?auto_399803 ?auto_399804 ) ) ( not ( = ?auto_399803 ?auto_399805 ) ) ( not ( = ?auto_399803 ?auto_399806 ) ) ( not ( = ?auto_399803 ?auto_399807 ) ) ( not ( = ?auto_399803 ?auto_399808 ) ) ( not ( = ?auto_399803 ?auto_399809 ) ) ( not ( = ?auto_399803 ?auto_399810 ) ) ( not ( = ?auto_399803 ?auto_399811 ) ) ( not ( = ?auto_399803 ?auto_399812 ) ) ( not ( = ?auto_399804 ?auto_399805 ) ) ( not ( = ?auto_399804 ?auto_399806 ) ) ( not ( = ?auto_399804 ?auto_399807 ) ) ( not ( = ?auto_399804 ?auto_399808 ) ) ( not ( = ?auto_399804 ?auto_399809 ) ) ( not ( = ?auto_399804 ?auto_399810 ) ) ( not ( = ?auto_399804 ?auto_399811 ) ) ( not ( = ?auto_399804 ?auto_399812 ) ) ( not ( = ?auto_399805 ?auto_399806 ) ) ( not ( = ?auto_399805 ?auto_399807 ) ) ( not ( = ?auto_399805 ?auto_399808 ) ) ( not ( = ?auto_399805 ?auto_399809 ) ) ( not ( = ?auto_399805 ?auto_399810 ) ) ( not ( = ?auto_399805 ?auto_399811 ) ) ( not ( = ?auto_399805 ?auto_399812 ) ) ( not ( = ?auto_399806 ?auto_399807 ) ) ( not ( = ?auto_399806 ?auto_399808 ) ) ( not ( = ?auto_399806 ?auto_399809 ) ) ( not ( = ?auto_399806 ?auto_399810 ) ) ( not ( = ?auto_399806 ?auto_399811 ) ) ( not ( = ?auto_399806 ?auto_399812 ) ) ( not ( = ?auto_399807 ?auto_399808 ) ) ( not ( = ?auto_399807 ?auto_399809 ) ) ( not ( = ?auto_399807 ?auto_399810 ) ) ( not ( = ?auto_399807 ?auto_399811 ) ) ( not ( = ?auto_399807 ?auto_399812 ) ) ( not ( = ?auto_399808 ?auto_399809 ) ) ( not ( = ?auto_399808 ?auto_399810 ) ) ( not ( = ?auto_399808 ?auto_399811 ) ) ( not ( = ?auto_399808 ?auto_399812 ) ) ( not ( = ?auto_399809 ?auto_399810 ) ) ( not ( = ?auto_399809 ?auto_399811 ) ) ( not ( = ?auto_399809 ?auto_399812 ) ) ( not ( = ?auto_399810 ?auto_399811 ) ) ( not ( = ?auto_399810 ?auto_399812 ) ) ( not ( = ?auto_399811 ?auto_399812 ) ) ( ON ?auto_399810 ?auto_399811 ) ( ON ?auto_399809 ?auto_399810 ) ( ON ?auto_399808 ?auto_399809 ) ( ON ?auto_399807 ?auto_399808 ) ( ON ?auto_399806 ?auto_399807 ) ( ON ?auto_399805 ?auto_399806 ) ( ON ?auto_399804 ?auto_399805 ) ( ON ?auto_399803 ?auto_399804 ) ( ON ?auto_399802 ?auto_399803 ) ( CLEAR ?auto_399800 ) ( ON ?auto_399801 ?auto_399802 ) ( CLEAR ?auto_399801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_399800 ?auto_399801 )
      ( MAKE-12PILE ?auto_399800 ?auto_399801 ?auto_399802 ?auto_399803 ?auto_399804 ?auto_399805 ?auto_399806 ?auto_399807 ?auto_399808 ?auto_399809 ?auto_399810 ?auto_399811 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_399850 - BLOCK
      ?auto_399851 - BLOCK
      ?auto_399852 - BLOCK
      ?auto_399853 - BLOCK
      ?auto_399854 - BLOCK
      ?auto_399855 - BLOCK
      ?auto_399856 - BLOCK
      ?auto_399857 - BLOCK
      ?auto_399858 - BLOCK
      ?auto_399859 - BLOCK
      ?auto_399860 - BLOCK
      ?auto_399861 - BLOCK
    )
    :vars
    (
      ?auto_399862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399861 ?auto_399862 ) ( not ( = ?auto_399850 ?auto_399851 ) ) ( not ( = ?auto_399850 ?auto_399852 ) ) ( not ( = ?auto_399850 ?auto_399853 ) ) ( not ( = ?auto_399850 ?auto_399854 ) ) ( not ( = ?auto_399850 ?auto_399855 ) ) ( not ( = ?auto_399850 ?auto_399856 ) ) ( not ( = ?auto_399850 ?auto_399857 ) ) ( not ( = ?auto_399850 ?auto_399858 ) ) ( not ( = ?auto_399850 ?auto_399859 ) ) ( not ( = ?auto_399850 ?auto_399860 ) ) ( not ( = ?auto_399850 ?auto_399861 ) ) ( not ( = ?auto_399850 ?auto_399862 ) ) ( not ( = ?auto_399851 ?auto_399852 ) ) ( not ( = ?auto_399851 ?auto_399853 ) ) ( not ( = ?auto_399851 ?auto_399854 ) ) ( not ( = ?auto_399851 ?auto_399855 ) ) ( not ( = ?auto_399851 ?auto_399856 ) ) ( not ( = ?auto_399851 ?auto_399857 ) ) ( not ( = ?auto_399851 ?auto_399858 ) ) ( not ( = ?auto_399851 ?auto_399859 ) ) ( not ( = ?auto_399851 ?auto_399860 ) ) ( not ( = ?auto_399851 ?auto_399861 ) ) ( not ( = ?auto_399851 ?auto_399862 ) ) ( not ( = ?auto_399852 ?auto_399853 ) ) ( not ( = ?auto_399852 ?auto_399854 ) ) ( not ( = ?auto_399852 ?auto_399855 ) ) ( not ( = ?auto_399852 ?auto_399856 ) ) ( not ( = ?auto_399852 ?auto_399857 ) ) ( not ( = ?auto_399852 ?auto_399858 ) ) ( not ( = ?auto_399852 ?auto_399859 ) ) ( not ( = ?auto_399852 ?auto_399860 ) ) ( not ( = ?auto_399852 ?auto_399861 ) ) ( not ( = ?auto_399852 ?auto_399862 ) ) ( not ( = ?auto_399853 ?auto_399854 ) ) ( not ( = ?auto_399853 ?auto_399855 ) ) ( not ( = ?auto_399853 ?auto_399856 ) ) ( not ( = ?auto_399853 ?auto_399857 ) ) ( not ( = ?auto_399853 ?auto_399858 ) ) ( not ( = ?auto_399853 ?auto_399859 ) ) ( not ( = ?auto_399853 ?auto_399860 ) ) ( not ( = ?auto_399853 ?auto_399861 ) ) ( not ( = ?auto_399853 ?auto_399862 ) ) ( not ( = ?auto_399854 ?auto_399855 ) ) ( not ( = ?auto_399854 ?auto_399856 ) ) ( not ( = ?auto_399854 ?auto_399857 ) ) ( not ( = ?auto_399854 ?auto_399858 ) ) ( not ( = ?auto_399854 ?auto_399859 ) ) ( not ( = ?auto_399854 ?auto_399860 ) ) ( not ( = ?auto_399854 ?auto_399861 ) ) ( not ( = ?auto_399854 ?auto_399862 ) ) ( not ( = ?auto_399855 ?auto_399856 ) ) ( not ( = ?auto_399855 ?auto_399857 ) ) ( not ( = ?auto_399855 ?auto_399858 ) ) ( not ( = ?auto_399855 ?auto_399859 ) ) ( not ( = ?auto_399855 ?auto_399860 ) ) ( not ( = ?auto_399855 ?auto_399861 ) ) ( not ( = ?auto_399855 ?auto_399862 ) ) ( not ( = ?auto_399856 ?auto_399857 ) ) ( not ( = ?auto_399856 ?auto_399858 ) ) ( not ( = ?auto_399856 ?auto_399859 ) ) ( not ( = ?auto_399856 ?auto_399860 ) ) ( not ( = ?auto_399856 ?auto_399861 ) ) ( not ( = ?auto_399856 ?auto_399862 ) ) ( not ( = ?auto_399857 ?auto_399858 ) ) ( not ( = ?auto_399857 ?auto_399859 ) ) ( not ( = ?auto_399857 ?auto_399860 ) ) ( not ( = ?auto_399857 ?auto_399861 ) ) ( not ( = ?auto_399857 ?auto_399862 ) ) ( not ( = ?auto_399858 ?auto_399859 ) ) ( not ( = ?auto_399858 ?auto_399860 ) ) ( not ( = ?auto_399858 ?auto_399861 ) ) ( not ( = ?auto_399858 ?auto_399862 ) ) ( not ( = ?auto_399859 ?auto_399860 ) ) ( not ( = ?auto_399859 ?auto_399861 ) ) ( not ( = ?auto_399859 ?auto_399862 ) ) ( not ( = ?auto_399860 ?auto_399861 ) ) ( not ( = ?auto_399860 ?auto_399862 ) ) ( not ( = ?auto_399861 ?auto_399862 ) ) ( ON ?auto_399860 ?auto_399861 ) ( ON ?auto_399859 ?auto_399860 ) ( ON ?auto_399858 ?auto_399859 ) ( ON ?auto_399857 ?auto_399858 ) ( ON ?auto_399856 ?auto_399857 ) ( ON ?auto_399855 ?auto_399856 ) ( ON ?auto_399854 ?auto_399855 ) ( ON ?auto_399853 ?auto_399854 ) ( ON ?auto_399852 ?auto_399853 ) ( ON ?auto_399851 ?auto_399852 ) ( ON ?auto_399850 ?auto_399851 ) ( CLEAR ?auto_399850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_399850 )
      ( MAKE-12PILE ?auto_399850 ?auto_399851 ?auto_399852 ?auto_399853 ?auto_399854 ?auto_399855 ?auto_399856 ?auto_399857 ?auto_399858 ?auto_399859 ?auto_399860 ?auto_399861 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_399901 - BLOCK
      ?auto_399902 - BLOCK
      ?auto_399903 - BLOCK
      ?auto_399904 - BLOCK
      ?auto_399905 - BLOCK
      ?auto_399906 - BLOCK
      ?auto_399907 - BLOCK
      ?auto_399908 - BLOCK
      ?auto_399909 - BLOCK
      ?auto_399910 - BLOCK
      ?auto_399911 - BLOCK
      ?auto_399912 - BLOCK
      ?auto_399913 - BLOCK
    )
    :vars
    (
      ?auto_399914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_399912 ) ( ON ?auto_399913 ?auto_399914 ) ( CLEAR ?auto_399913 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_399901 ) ( ON ?auto_399902 ?auto_399901 ) ( ON ?auto_399903 ?auto_399902 ) ( ON ?auto_399904 ?auto_399903 ) ( ON ?auto_399905 ?auto_399904 ) ( ON ?auto_399906 ?auto_399905 ) ( ON ?auto_399907 ?auto_399906 ) ( ON ?auto_399908 ?auto_399907 ) ( ON ?auto_399909 ?auto_399908 ) ( ON ?auto_399910 ?auto_399909 ) ( ON ?auto_399911 ?auto_399910 ) ( ON ?auto_399912 ?auto_399911 ) ( not ( = ?auto_399901 ?auto_399902 ) ) ( not ( = ?auto_399901 ?auto_399903 ) ) ( not ( = ?auto_399901 ?auto_399904 ) ) ( not ( = ?auto_399901 ?auto_399905 ) ) ( not ( = ?auto_399901 ?auto_399906 ) ) ( not ( = ?auto_399901 ?auto_399907 ) ) ( not ( = ?auto_399901 ?auto_399908 ) ) ( not ( = ?auto_399901 ?auto_399909 ) ) ( not ( = ?auto_399901 ?auto_399910 ) ) ( not ( = ?auto_399901 ?auto_399911 ) ) ( not ( = ?auto_399901 ?auto_399912 ) ) ( not ( = ?auto_399901 ?auto_399913 ) ) ( not ( = ?auto_399901 ?auto_399914 ) ) ( not ( = ?auto_399902 ?auto_399903 ) ) ( not ( = ?auto_399902 ?auto_399904 ) ) ( not ( = ?auto_399902 ?auto_399905 ) ) ( not ( = ?auto_399902 ?auto_399906 ) ) ( not ( = ?auto_399902 ?auto_399907 ) ) ( not ( = ?auto_399902 ?auto_399908 ) ) ( not ( = ?auto_399902 ?auto_399909 ) ) ( not ( = ?auto_399902 ?auto_399910 ) ) ( not ( = ?auto_399902 ?auto_399911 ) ) ( not ( = ?auto_399902 ?auto_399912 ) ) ( not ( = ?auto_399902 ?auto_399913 ) ) ( not ( = ?auto_399902 ?auto_399914 ) ) ( not ( = ?auto_399903 ?auto_399904 ) ) ( not ( = ?auto_399903 ?auto_399905 ) ) ( not ( = ?auto_399903 ?auto_399906 ) ) ( not ( = ?auto_399903 ?auto_399907 ) ) ( not ( = ?auto_399903 ?auto_399908 ) ) ( not ( = ?auto_399903 ?auto_399909 ) ) ( not ( = ?auto_399903 ?auto_399910 ) ) ( not ( = ?auto_399903 ?auto_399911 ) ) ( not ( = ?auto_399903 ?auto_399912 ) ) ( not ( = ?auto_399903 ?auto_399913 ) ) ( not ( = ?auto_399903 ?auto_399914 ) ) ( not ( = ?auto_399904 ?auto_399905 ) ) ( not ( = ?auto_399904 ?auto_399906 ) ) ( not ( = ?auto_399904 ?auto_399907 ) ) ( not ( = ?auto_399904 ?auto_399908 ) ) ( not ( = ?auto_399904 ?auto_399909 ) ) ( not ( = ?auto_399904 ?auto_399910 ) ) ( not ( = ?auto_399904 ?auto_399911 ) ) ( not ( = ?auto_399904 ?auto_399912 ) ) ( not ( = ?auto_399904 ?auto_399913 ) ) ( not ( = ?auto_399904 ?auto_399914 ) ) ( not ( = ?auto_399905 ?auto_399906 ) ) ( not ( = ?auto_399905 ?auto_399907 ) ) ( not ( = ?auto_399905 ?auto_399908 ) ) ( not ( = ?auto_399905 ?auto_399909 ) ) ( not ( = ?auto_399905 ?auto_399910 ) ) ( not ( = ?auto_399905 ?auto_399911 ) ) ( not ( = ?auto_399905 ?auto_399912 ) ) ( not ( = ?auto_399905 ?auto_399913 ) ) ( not ( = ?auto_399905 ?auto_399914 ) ) ( not ( = ?auto_399906 ?auto_399907 ) ) ( not ( = ?auto_399906 ?auto_399908 ) ) ( not ( = ?auto_399906 ?auto_399909 ) ) ( not ( = ?auto_399906 ?auto_399910 ) ) ( not ( = ?auto_399906 ?auto_399911 ) ) ( not ( = ?auto_399906 ?auto_399912 ) ) ( not ( = ?auto_399906 ?auto_399913 ) ) ( not ( = ?auto_399906 ?auto_399914 ) ) ( not ( = ?auto_399907 ?auto_399908 ) ) ( not ( = ?auto_399907 ?auto_399909 ) ) ( not ( = ?auto_399907 ?auto_399910 ) ) ( not ( = ?auto_399907 ?auto_399911 ) ) ( not ( = ?auto_399907 ?auto_399912 ) ) ( not ( = ?auto_399907 ?auto_399913 ) ) ( not ( = ?auto_399907 ?auto_399914 ) ) ( not ( = ?auto_399908 ?auto_399909 ) ) ( not ( = ?auto_399908 ?auto_399910 ) ) ( not ( = ?auto_399908 ?auto_399911 ) ) ( not ( = ?auto_399908 ?auto_399912 ) ) ( not ( = ?auto_399908 ?auto_399913 ) ) ( not ( = ?auto_399908 ?auto_399914 ) ) ( not ( = ?auto_399909 ?auto_399910 ) ) ( not ( = ?auto_399909 ?auto_399911 ) ) ( not ( = ?auto_399909 ?auto_399912 ) ) ( not ( = ?auto_399909 ?auto_399913 ) ) ( not ( = ?auto_399909 ?auto_399914 ) ) ( not ( = ?auto_399910 ?auto_399911 ) ) ( not ( = ?auto_399910 ?auto_399912 ) ) ( not ( = ?auto_399910 ?auto_399913 ) ) ( not ( = ?auto_399910 ?auto_399914 ) ) ( not ( = ?auto_399911 ?auto_399912 ) ) ( not ( = ?auto_399911 ?auto_399913 ) ) ( not ( = ?auto_399911 ?auto_399914 ) ) ( not ( = ?auto_399912 ?auto_399913 ) ) ( not ( = ?auto_399912 ?auto_399914 ) ) ( not ( = ?auto_399913 ?auto_399914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_399913 ?auto_399914 )
      ( !STACK ?auto_399913 ?auto_399912 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_399955 - BLOCK
      ?auto_399956 - BLOCK
      ?auto_399957 - BLOCK
      ?auto_399958 - BLOCK
      ?auto_399959 - BLOCK
      ?auto_399960 - BLOCK
      ?auto_399961 - BLOCK
      ?auto_399962 - BLOCK
      ?auto_399963 - BLOCK
      ?auto_399964 - BLOCK
      ?auto_399965 - BLOCK
      ?auto_399966 - BLOCK
      ?auto_399967 - BLOCK
    )
    :vars
    (
      ?auto_399968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_399967 ?auto_399968 ) ( ON-TABLE ?auto_399955 ) ( ON ?auto_399956 ?auto_399955 ) ( ON ?auto_399957 ?auto_399956 ) ( ON ?auto_399958 ?auto_399957 ) ( ON ?auto_399959 ?auto_399958 ) ( ON ?auto_399960 ?auto_399959 ) ( ON ?auto_399961 ?auto_399960 ) ( ON ?auto_399962 ?auto_399961 ) ( ON ?auto_399963 ?auto_399962 ) ( ON ?auto_399964 ?auto_399963 ) ( ON ?auto_399965 ?auto_399964 ) ( not ( = ?auto_399955 ?auto_399956 ) ) ( not ( = ?auto_399955 ?auto_399957 ) ) ( not ( = ?auto_399955 ?auto_399958 ) ) ( not ( = ?auto_399955 ?auto_399959 ) ) ( not ( = ?auto_399955 ?auto_399960 ) ) ( not ( = ?auto_399955 ?auto_399961 ) ) ( not ( = ?auto_399955 ?auto_399962 ) ) ( not ( = ?auto_399955 ?auto_399963 ) ) ( not ( = ?auto_399955 ?auto_399964 ) ) ( not ( = ?auto_399955 ?auto_399965 ) ) ( not ( = ?auto_399955 ?auto_399966 ) ) ( not ( = ?auto_399955 ?auto_399967 ) ) ( not ( = ?auto_399955 ?auto_399968 ) ) ( not ( = ?auto_399956 ?auto_399957 ) ) ( not ( = ?auto_399956 ?auto_399958 ) ) ( not ( = ?auto_399956 ?auto_399959 ) ) ( not ( = ?auto_399956 ?auto_399960 ) ) ( not ( = ?auto_399956 ?auto_399961 ) ) ( not ( = ?auto_399956 ?auto_399962 ) ) ( not ( = ?auto_399956 ?auto_399963 ) ) ( not ( = ?auto_399956 ?auto_399964 ) ) ( not ( = ?auto_399956 ?auto_399965 ) ) ( not ( = ?auto_399956 ?auto_399966 ) ) ( not ( = ?auto_399956 ?auto_399967 ) ) ( not ( = ?auto_399956 ?auto_399968 ) ) ( not ( = ?auto_399957 ?auto_399958 ) ) ( not ( = ?auto_399957 ?auto_399959 ) ) ( not ( = ?auto_399957 ?auto_399960 ) ) ( not ( = ?auto_399957 ?auto_399961 ) ) ( not ( = ?auto_399957 ?auto_399962 ) ) ( not ( = ?auto_399957 ?auto_399963 ) ) ( not ( = ?auto_399957 ?auto_399964 ) ) ( not ( = ?auto_399957 ?auto_399965 ) ) ( not ( = ?auto_399957 ?auto_399966 ) ) ( not ( = ?auto_399957 ?auto_399967 ) ) ( not ( = ?auto_399957 ?auto_399968 ) ) ( not ( = ?auto_399958 ?auto_399959 ) ) ( not ( = ?auto_399958 ?auto_399960 ) ) ( not ( = ?auto_399958 ?auto_399961 ) ) ( not ( = ?auto_399958 ?auto_399962 ) ) ( not ( = ?auto_399958 ?auto_399963 ) ) ( not ( = ?auto_399958 ?auto_399964 ) ) ( not ( = ?auto_399958 ?auto_399965 ) ) ( not ( = ?auto_399958 ?auto_399966 ) ) ( not ( = ?auto_399958 ?auto_399967 ) ) ( not ( = ?auto_399958 ?auto_399968 ) ) ( not ( = ?auto_399959 ?auto_399960 ) ) ( not ( = ?auto_399959 ?auto_399961 ) ) ( not ( = ?auto_399959 ?auto_399962 ) ) ( not ( = ?auto_399959 ?auto_399963 ) ) ( not ( = ?auto_399959 ?auto_399964 ) ) ( not ( = ?auto_399959 ?auto_399965 ) ) ( not ( = ?auto_399959 ?auto_399966 ) ) ( not ( = ?auto_399959 ?auto_399967 ) ) ( not ( = ?auto_399959 ?auto_399968 ) ) ( not ( = ?auto_399960 ?auto_399961 ) ) ( not ( = ?auto_399960 ?auto_399962 ) ) ( not ( = ?auto_399960 ?auto_399963 ) ) ( not ( = ?auto_399960 ?auto_399964 ) ) ( not ( = ?auto_399960 ?auto_399965 ) ) ( not ( = ?auto_399960 ?auto_399966 ) ) ( not ( = ?auto_399960 ?auto_399967 ) ) ( not ( = ?auto_399960 ?auto_399968 ) ) ( not ( = ?auto_399961 ?auto_399962 ) ) ( not ( = ?auto_399961 ?auto_399963 ) ) ( not ( = ?auto_399961 ?auto_399964 ) ) ( not ( = ?auto_399961 ?auto_399965 ) ) ( not ( = ?auto_399961 ?auto_399966 ) ) ( not ( = ?auto_399961 ?auto_399967 ) ) ( not ( = ?auto_399961 ?auto_399968 ) ) ( not ( = ?auto_399962 ?auto_399963 ) ) ( not ( = ?auto_399962 ?auto_399964 ) ) ( not ( = ?auto_399962 ?auto_399965 ) ) ( not ( = ?auto_399962 ?auto_399966 ) ) ( not ( = ?auto_399962 ?auto_399967 ) ) ( not ( = ?auto_399962 ?auto_399968 ) ) ( not ( = ?auto_399963 ?auto_399964 ) ) ( not ( = ?auto_399963 ?auto_399965 ) ) ( not ( = ?auto_399963 ?auto_399966 ) ) ( not ( = ?auto_399963 ?auto_399967 ) ) ( not ( = ?auto_399963 ?auto_399968 ) ) ( not ( = ?auto_399964 ?auto_399965 ) ) ( not ( = ?auto_399964 ?auto_399966 ) ) ( not ( = ?auto_399964 ?auto_399967 ) ) ( not ( = ?auto_399964 ?auto_399968 ) ) ( not ( = ?auto_399965 ?auto_399966 ) ) ( not ( = ?auto_399965 ?auto_399967 ) ) ( not ( = ?auto_399965 ?auto_399968 ) ) ( not ( = ?auto_399966 ?auto_399967 ) ) ( not ( = ?auto_399966 ?auto_399968 ) ) ( not ( = ?auto_399967 ?auto_399968 ) ) ( CLEAR ?auto_399965 ) ( ON ?auto_399966 ?auto_399967 ) ( CLEAR ?auto_399966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_399955 ?auto_399956 ?auto_399957 ?auto_399958 ?auto_399959 ?auto_399960 ?auto_399961 ?auto_399962 ?auto_399963 ?auto_399964 ?auto_399965 ?auto_399966 )
      ( MAKE-13PILE ?auto_399955 ?auto_399956 ?auto_399957 ?auto_399958 ?auto_399959 ?auto_399960 ?auto_399961 ?auto_399962 ?auto_399963 ?auto_399964 ?auto_399965 ?auto_399966 ?auto_399967 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_400009 - BLOCK
      ?auto_400010 - BLOCK
      ?auto_400011 - BLOCK
      ?auto_400012 - BLOCK
      ?auto_400013 - BLOCK
      ?auto_400014 - BLOCK
      ?auto_400015 - BLOCK
      ?auto_400016 - BLOCK
      ?auto_400017 - BLOCK
      ?auto_400018 - BLOCK
      ?auto_400019 - BLOCK
      ?auto_400020 - BLOCK
      ?auto_400021 - BLOCK
    )
    :vars
    (
      ?auto_400022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400021 ?auto_400022 ) ( ON-TABLE ?auto_400009 ) ( ON ?auto_400010 ?auto_400009 ) ( ON ?auto_400011 ?auto_400010 ) ( ON ?auto_400012 ?auto_400011 ) ( ON ?auto_400013 ?auto_400012 ) ( ON ?auto_400014 ?auto_400013 ) ( ON ?auto_400015 ?auto_400014 ) ( ON ?auto_400016 ?auto_400015 ) ( ON ?auto_400017 ?auto_400016 ) ( ON ?auto_400018 ?auto_400017 ) ( not ( = ?auto_400009 ?auto_400010 ) ) ( not ( = ?auto_400009 ?auto_400011 ) ) ( not ( = ?auto_400009 ?auto_400012 ) ) ( not ( = ?auto_400009 ?auto_400013 ) ) ( not ( = ?auto_400009 ?auto_400014 ) ) ( not ( = ?auto_400009 ?auto_400015 ) ) ( not ( = ?auto_400009 ?auto_400016 ) ) ( not ( = ?auto_400009 ?auto_400017 ) ) ( not ( = ?auto_400009 ?auto_400018 ) ) ( not ( = ?auto_400009 ?auto_400019 ) ) ( not ( = ?auto_400009 ?auto_400020 ) ) ( not ( = ?auto_400009 ?auto_400021 ) ) ( not ( = ?auto_400009 ?auto_400022 ) ) ( not ( = ?auto_400010 ?auto_400011 ) ) ( not ( = ?auto_400010 ?auto_400012 ) ) ( not ( = ?auto_400010 ?auto_400013 ) ) ( not ( = ?auto_400010 ?auto_400014 ) ) ( not ( = ?auto_400010 ?auto_400015 ) ) ( not ( = ?auto_400010 ?auto_400016 ) ) ( not ( = ?auto_400010 ?auto_400017 ) ) ( not ( = ?auto_400010 ?auto_400018 ) ) ( not ( = ?auto_400010 ?auto_400019 ) ) ( not ( = ?auto_400010 ?auto_400020 ) ) ( not ( = ?auto_400010 ?auto_400021 ) ) ( not ( = ?auto_400010 ?auto_400022 ) ) ( not ( = ?auto_400011 ?auto_400012 ) ) ( not ( = ?auto_400011 ?auto_400013 ) ) ( not ( = ?auto_400011 ?auto_400014 ) ) ( not ( = ?auto_400011 ?auto_400015 ) ) ( not ( = ?auto_400011 ?auto_400016 ) ) ( not ( = ?auto_400011 ?auto_400017 ) ) ( not ( = ?auto_400011 ?auto_400018 ) ) ( not ( = ?auto_400011 ?auto_400019 ) ) ( not ( = ?auto_400011 ?auto_400020 ) ) ( not ( = ?auto_400011 ?auto_400021 ) ) ( not ( = ?auto_400011 ?auto_400022 ) ) ( not ( = ?auto_400012 ?auto_400013 ) ) ( not ( = ?auto_400012 ?auto_400014 ) ) ( not ( = ?auto_400012 ?auto_400015 ) ) ( not ( = ?auto_400012 ?auto_400016 ) ) ( not ( = ?auto_400012 ?auto_400017 ) ) ( not ( = ?auto_400012 ?auto_400018 ) ) ( not ( = ?auto_400012 ?auto_400019 ) ) ( not ( = ?auto_400012 ?auto_400020 ) ) ( not ( = ?auto_400012 ?auto_400021 ) ) ( not ( = ?auto_400012 ?auto_400022 ) ) ( not ( = ?auto_400013 ?auto_400014 ) ) ( not ( = ?auto_400013 ?auto_400015 ) ) ( not ( = ?auto_400013 ?auto_400016 ) ) ( not ( = ?auto_400013 ?auto_400017 ) ) ( not ( = ?auto_400013 ?auto_400018 ) ) ( not ( = ?auto_400013 ?auto_400019 ) ) ( not ( = ?auto_400013 ?auto_400020 ) ) ( not ( = ?auto_400013 ?auto_400021 ) ) ( not ( = ?auto_400013 ?auto_400022 ) ) ( not ( = ?auto_400014 ?auto_400015 ) ) ( not ( = ?auto_400014 ?auto_400016 ) ) ( not ( = ?auto_400014 ?auto_400017 ) ) ( not ( = ?auto_400014 ?auto_400018 ) ) ( not ( = ?auto_400014 ?auto_400019 ) ) ( not ( = ?auto_400014 ?auto_400020 ) ) ( not ( = ?auto_400014 ?auto_400021 ) ) ( not ( = ?auto_400014 ?auto_400022 ) ) ( not ( = ?auto_400015 ?auto_400016 ) ) ( not ( = ?auto_400015 ?auto_400017 ) ) ( not ( = ?auto_400015 ?auto_400018 ) ) ( not ( = ?auto_400015 ?auto_400019 ) ) ( not ( = ?auto_400015 ?auto_400020 ) ) ( not ( = ?auto_400015 ?auto_400021 ) ) ( not ( = ?auto_400015 ?auto_400022 ) ) ( not ( = ?auto_400016 ?auto_400017 ) ) ( not ( = ?auto_400016 ?auto_400018 ) ) ( not ( = ?auto_400016 ?auto_400019 ) ) ( not ( = ?auto_400016 ?auto_400020 ) ) ( not ( = ?auto_400016 ?auto_400021 ) ) ( not ( = ?auto_400016 ?auto_400022 ) ) ( not ( = ?auto_400017 ?auto_400018 ) ) ( not ( = ?auto_400017 ?auto_400019 ) ) ( not ( = ?auto_400017 ?auto_400020 ) ) ( not ( = ?auto_400017 ?auto_400021 ) ) ( not ( = ?auto_400017 ?auto_400022 ) ) ( not ( = ?auto_400018 ?auto_400019 ) ) ( not ( = ?auto_400018 ?auto_400020 ) ) ( not ( = ?auto_400018 ?auto_400021 ) ) ( not ( = ?auto_400018 ?auto_400022 ) ) ( not ( = ?auto_400019 ?auto_400020 ) ) ( not ( = ?auto_400019 ?auto_400021 ) ) ( not ( = ?auto_400019 ?auto_400022 ) ) ( not ( = ?auto_400020 ?auto_400021 ) ) ( not ( = ?auto_400020 ?auto_400022 ) ) ( not ( = ?auto_400021 ?auto_400022 ) ) ( ON ?auto_400020 ?auto_400021 ) ( CLEAR ?auto_400018 ) ( ON ?auto_400019 ?auto_400020 ) ( CLEAR ?auto_400019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_400009 ?auto_400010 ?auto_400011 ?auto_400012 ?auto_400013 ?auto_400014 ?auto_400015 ?auto_400016 ?auto_400017 ?auto_400018 ?auto_400019 )
      ( MAKE-13PILE ?auto_400009 ?auto_400010 ?auto_400011 ?auto_400012 ?auto_400013 ?auto_400014 ?auto_400015 ?auto_400016 ?auto_400017 ?auto_400018 ?auto_400019 ?auto_400020 ?auto_400021 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_400063 - BLOCK
      ?auto_400064 - BLOCK
      ?auto_400065 - BLOCK
      ?auto_400066 - BLOCK
      ?auto_400067 - BLOCK
      ?auto_400068 - BLOCK
      ?auto_400069 - BLOCK
      ?auto_400070 - BLOCK
      ?auto_400071 - BLOCK
      ?auto_400072 - BLOCK
      ?auto_400073 - BLOCK
      ?auto_400074 - BLOCK
      ?auto_400075 - BLOCK
    )
    :vars
    (
      ?auto_400076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400075 ?auto_400076 ) ( ON-TABLE ?auto_400063 ) ( ON ?auto_400064 ?auto_400063 ) ( ON ?auto_400065 ?auto_400064 ) ( ON ?auto_400066 ?auto_400065 ) ( ON ?auto_400067 ?auto_400066 ) ( ON ?auto_400068 ?auto_400067 ) ( ON ?auto_400069 ?auto_400068 ) ( ON ?auto_400070 ?auto_400069 ) ( ON ?auto_400071 ?auto_400070 ) ( not ( = ?auto_400063 ?auto_400064 ) ) ( not ( = ?auto_400063 ?auto_400065 ) ) ( not ( = ?auto_400063 ?auto_400066 ) ) ( not ( = ?auto_400063 ?auto_400067 ) ) ( not ( = ?auto_400063 ?auto_400068 ) ) ( not ( = ?auto_400063 ?auto_400069 ) ) ( not ( = ?auto_400063 ?auto_400070 ) ) ( not ( = ?auto_400063 ?auto_400071 ) ) ( not ( = ?auto_400063 ?auto_400072 ) ) ( not ( = ?auto_400063 ?auto_400073 ) ) ( not ( = ?auto_400063 ?auto_400074 ) ) ( not ( = ?auto_400063 ?auto_400075 ) ) ( not ( = ?auto_400063 ?auto_400076 ) ) ( not ( = ?auto_400064 ?auto_400065 ) ) ( not ( = ?auto_400064 ?auto_400066 ) ) ( not ( = ?auto_400064 ?auto_400067 ) ) ( not ( = ?auto_400064 ?auto_400068 ) ) ( not ( = ?auto_400064 ?auto_400069 ) ) ( not ( = ?auto_400064 ?auto_400070 ) ) ( not ( = ?auto_400064 ?auto_400071 ) ) ( not ( = ?auto_400064 ?auto_400072 ) ) ( not ( = ?auto_400064 ?auto_400073 ) ) ( not ( = ?auto_400064 ?auto_400074 ) ) ( not ( = ?auto_400064 ?auto_400075 ) ) ( not ( = ?auto_400064 ?auto_400076 ) ) ( not ( = ?auto_400065 ?auto_400066 ) ) ( not ( = ?auto_400065 ?auto_400067 ) ) ( not ( = ?auto_400065 ?auto_400068 ) ) ( not ( = ?auto_400065 ?auto_400069 ) ) ( not ( = ?auto_400065 ?auto_400070 ) ) ( not ( = ?auto_400065 ?auto_400071 ) ) ( not ( = ?auto_400065 ?auto_400072 ) ) ( not ( = ?auto_400065 ?auto_400073 ) ) ( not ( = ?auto_400065 ?auto_400074 ) ) ( not ( = ?auto_400065 ?auto_400075 ) ) ( not ( = ?auto_400065 ?auto_400076 ) ) ( not ( = ?auto_400066 ?auto_400067 ) ) ( not ( = ?auto_400066 ?auto_400068 ) ) ( not ( = ?auto_400066 ?auto_400069 ) ) ( not ( = ?auto_400066 ?auto_400070 ) ) ( not ( = ?auto_400066 ?auto_400071 ) ) ( not ( = ?auto_400066 ?auto_400072 ) ) ( not ( = ?auto_400066 ?auto_400073 ) ) ( not ( = ?auto_400066 ?auto_400074 ) ) ( not ( = ?auto_400066 ?auto_400075 ) ) ( not ( = ?auto_400066 ?auto_400076 ) ) ( not ( = ?auto_400067 ?auto_400068 ) ) ( not ( = ?auto_400067 ?auto_400069 ) ) ( not ( = ?auto_400067 ?auto_400070 ) ) ( not ( = ?auto_400067 ?auto_400071 ) ) ( not ( = ?auto_400067 ?auto_400072 ) ) ( not ( = ?auto_400067 ?auto_400073 ) ) ( not ( = ?auto_400067 ?auto_400074 ) ) ( not ( = ?auto_400067 ?auto_400075 ) ) ( not ( = ?auto_400067 ?auto_400076 ) ) ( not ( = ?auto_400068 ?auto_400069 ) ) ( not ( = ?auto_400068 ?auto_400070 ) ) ( not ( = ?auto_400068 ?auto_400071 ) ) ( not ( = ?auto_400068 ?auto_400072 ) ) ( not ( = ?auto_400068 ?auto_400073 ) ) ( not ( = ?auto_400068 ?auto_400074 ) ) ( not ( = ?auto_400068 ?auto_400075 ) ) ( not ( = ?auto_400068 ?auto_400076 ) ) ( not ( = ?auto_400069 ?auto_400070 ) ) ( not ( = ?auto_400069 ?auto_400071 ) ) ( not ( = ?auto_400069 ?auto_400072 ) ) ( not ( = ?auto_400069 ?auto_400073 ) ) ( not ( = ?auto_400069 ?auto_400074 ) ) ( not ( = ?auto_400069 ?auto_400075 ) ) ( not ( = ?auto_400069 ?auto_400076 ) ) ( not ( = ?auto_400070 ?auto_400071 ) ) ( not ( = ?auto_400070 ?auto_400072 ) ) ( not ( = ?auto_400070 ?auto_400073 ) ) ( not ( = ?auto_400070 ?auto_400074 ) ) ( not ( = ?auto_400070 ?auto_400075 ) ) ( not ( = ?auto_400070 ?auto_400076 ) ) ( not ( = ?auto_400071 ?auto_400072 ) ) ( not ( = ?auto_400071 ?auto_400073 ) ) ( not ( = ?auto_400071 ?auto_400074 ) ) ( not ( = ?auto_400071 ?auto_400075 ) ) ( not ( = ?auto_400071 ?auto_400076 ) ) ( not ( = ?auto_400072 ?auto_400073 ) ) ( not ( = ?auto_400072 ?auto_400074 ) ) ( not ( = ?auto_400072 ?auto_400075 ) ) ( not ( = ?auto_400072 ?auto_400076 ) ) ( not ( = ?auto_400073 ?auto_400074 ) ) ( not ( = ?auto_400073 ?auto_400075 ) ) ( not ( = ?auto_400073 ?auto_400076 ) ) ( not ( = ?auto_400074 ?auto_400075 ) ) ( not ( = ?auto_400074 ?auto_400076 ) ) ( not ( = ?auto_400075 ?auto_400076 ) ) ( ON ?auto_400074 ?auto_400075 ) ( ON ?auto_400073 ?auto_400074 ) ( CLEAR ?auto_400071 ) ( ON ?auto_400072 ?auto_400073 ) ( CLEAR ?auto_400072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_400063 ?auto_400064 ?auto_400065 ?auto_400066 ?auto_400067 ?auto_400068 ?auto_400069 ?auto_400070 ?auto_400071 ?auto_400072 )
      ( MAKE-13PILE ?auto_400063 ?auto_400064 ?auto_400065 ?auto_400066 ?auto_400067 ?auto_400068 ?auto_400069 ?auto_400070 ?auto_400071 ?auto_400072 ?auto_400073 ?auto_400074 ?auto_400075 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_400117 - BLOCK
      ?auto_400118 - BLOCK
      ?auto_400119 - BLOCK
      ?auto_400120 - BLOCK
      ?auto_400121 - BLOCK
      ?auto_400122 - BLOCK
      ?auto_400123 - BLOCK
      ?auto_400124 - BLOCK
      ?auto_400125 - BLOCK
      ?auto_400126 - BLOCK
      ?auto_400127 - BLOCK
      ?auto_400128 - BLOCK
      ?auto_400129 - BLOCK
    )
    :vars
    (
      ?auto_400130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400129 ?auto_400130 ) ( ON-TABLE ?auto_400117 ) ( ON ?auto_400118 ?auto_400117 ) ( ON ?auto_400119 ?auto_400118 ) ( ON ?auto_400120 ?auto_400119 ) ( ON ?auto_400121 ?auto_400120 ) ( ON ?auto_400122 ?auto_400121 ) ( ON ?auto_400123 ?auto_400122 ) ( ON ?auto_400124 ?auto_400123 ) ( not ( = ?auto_400117 ?auto_400118 ) ) ( not ( = ?auto_400117 ?auto_400119 ) ) ( not ( = ?auto_400117 ?auto_400120 ) ) ( not ( = ?auto_400117 ?auto_400121 ) ) ( not ( = ?auto_400117 ?auto_400122 ) ) ( not ( = ?auto_400117 ?auto_400123 ) ) ( not ( = ?auto_400117 ?auto_400124 ) ) ( not ( = ?auto_400117 ?auto_400125 ) ) ( not ( = ?auto_400117 ?auto_400126 ) ) ( not ( = ?auto_400117 ?auto_400127 ) ) ( not ( = ?auto_400117 ?auto_400128 ) ) ( not ( = ?auto_400117 ?auto_400129 ) ) ( not ( = ?auto_400117 ?auto_400130 ) ) ( not ( = ?auto_400118 ?auto_400119 ) ) ( not ( = ?auto_400118 ?auto_400120 ) ) ( not ( = ?auto_400118 ?auto_400121 ) ) ( not ( = ?auto_400118 ?auto_400122 ) ) ( not ( = ?auto_400118 ?auto_400123 ) ) ( not ( = ?auto_400118 ?auto_400124 ) ) ( not ( = ?auto_400118 ?auto_400125 ) ) ( not ( = ?auto_400118 ?auto_400126 ) ) ( not ( = ?auto_400118 ?auto_400127 ) ) ( not ( = ?auto_400118 ?auto_400128 ) ) ( not ( = ?auto_400118 ?auto_400129 ) ) ( not ( = ?auto_400118 ?auto_400130 ) ) ( not ( = ?auto_400119 ?auto_400120 ) ) ( not ( = ?auto_400119 ?auto_400121 ) ) ( not ( = ?auto_400119 ?auto_400122 ) ) ( not ( = ?auto_400119 ?auto_400123 ) ) ( not ( = ?auto_400119 ?auto_400124 ) ) ( not ( = ?auto_400119 ?auto_400125 ) ) ( not ( = ?auto_400119 ?auto_400126 ) ) ( not ( = ?auto_400119 ?auto_400127 ) ) ( not ( = ?auto_400119 ?auto_400128 ) ) ( not ( = ?auto_400119 ?auto_400129 ) ) ( not ( = ?auto_400119 ?auto_400130 ) ) ( not ( = ?auto_400120 ?auto_400121 ) ) ( not ( = ?auto_400120 ?auto_400122 ) ) ( not ( = ?auto_400120 ?auto_400123 ) ) ( not ( = ?auto_400120 ?auto_400124 ) ) ( not ( = ?auto_400120 ?auto_400125 ) ) ( not ( = ?auto_400120 ?auto_400126 ) ) ( not ( = ?auto_400120 ?auto_400127 ) ) ( not ( = ?auto_400120 ?auto_400128 ) ) ( not ( = ?auto_400120 ?auto_400129 ) ) ( not ( = ?auto_400120 ?auto_400130 ) ) ( not ( = ?auto_400121 ?auto_400122 ) ) ( not ( = ?auto_400121 ?auto_400123 ) ) ( not ( = ?auto_400121 ?auto_400124 ) ) ( not ( = ?auto_400121 ?auto_400125 ) ) ( not ( = ?auto_400121 ?auto_400126 ) ) ( not ( = ?auto_400121 ?auto_400127 ) ) ( not ( = ?auto_400121 ?auto_400128 ) ) ( not ( = ?auto_400121 ?auto_400129 ) ) ( not ( = ?auto_400121 ?auto_400130 ) ) ( not ( = ?auto_400122 ?auto_400123 ) ) ( not ( = ?auto_400122 ?auto_400124 ) ) ( not ( = ?auto_400122 ?auto_400125 ) ) ( not ( = ?auto_400122 ?auto_400126 ) ) ( not ( = ?auto_400122 ?auto_400127 ) ) ( not ( = ?auto_400122 ?auto_400128 ) ) ( not ( = ?auto_400122 ?auto_400129 ) ) ( not ( = ?auto_400122 ?auto_400130 ) ) ( not ( = ?auto_400123 ?auto_400124 ) ) ( not ( = ?auto_400123 ?auto_400125 ) ) ( not ( = ?auto_400123 ?auto_400126 ) ) ( not ( = ?auto_400123 ?auto_400127 ) ) ( not ( = ?auto_400123 ?auto_400128 ) ) ( not ( = ?auto_400123 ?auto_400129 ) ) ( not ( = ?auto_400123 ?auto_400130 ) ) ( not ( = ?auto_400124 ?auto_400125 ) ) ( not ( = ?auto_400124 ?auto_400126 ) ) ( not ( = ?auto_400124 ?auto_400127 ) ) ( not ( = ?auto_400124 ?auto_400128 ) ) ( not ( = ?auto_400124 ?auto_400129 ) ) ( not ( = ?auto_400124 ?auto_400130 ) ) ( not ( = ?auto_400125 ?auto_400126 ) ) ( not ( = ?auto_400125 ?auto_400127 ) ) ( not ( = ?auto_400125 ?auto_400128 ) ) ( not ( = ?auto_400125 ?auto_400129 ) ) ( not ( = ?auto_400125 ?auto_400130 ) ) ( not ( = ?auto_400126 ?auto_400127 ) ) ( not ( = ?auto_400126 ?auto_400128 ) ) ( not ( = ?auto_400126 ?auto_400129 ) ) ( not ( = ?auto_400126 ?auto_400130 ) ) ( not ( = ?auto_400127 ?auto_400128 ) ) ( not ( = ?auto_400127 ?auto_400129 ) ) ( not ( = ?auto_400127 ?auto_400130 ) ) ( not ( = ?auto_400128 ?auto_400129 ) ) ( not ( = ?auto_400128 ?auto_400130 ) ) ( not ( = ?auto_400129 ?auto_400130 ) ) ( ON ?auto_400128 ?auto_400129 ) ( ON ?auto_400127 ?auto_400128 ) ( ON ?auto_400126 ?auto_400127 ) ( CLEAR ?auto_400124 ) ( ON ?auto_400125 ?auto_400126 ) ( CLEAR ?auto_400125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_400117 ?auto_400118 ?auto_400119 ?auto_400120 ?auto_400121 ?auto_400122 ?auto_400123 ?auto_400124 ?auto_400125 )
      ( MAKE-13PILE ?auto_400117 ?auto_400118 ?auto_400119 ?auto_400120 ?auto_400121 ?auto_400122 ?auto_400123 ?auto_400124 ?auto_400125 ?auto_400126 ?auto_400127 ?auto_400128 ?auto_400129 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_400171 - BLOCK
      ?auto_400172 - BLOCK
      ?auto_400173 - BLOCK
      ?auto_400174 - BLOCK
      ?auto_400175 - BLOCK
      ?auto_400176 - BLOCK
      ?auto_400177 - BLOCK
      ?auto_400178 - BLOCK
      ?auto_400179 - BLOCK
      ?auto_400180 - BLOCK
      ?auto_400181 - BLOCK
      ?auto_400182 - BLOCK
      ?auto_400183 - BLOCK
    )
    :vars
    (
      ?auto_400184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400183 ?auto_400184 ) ( ON-TABLE ?auto_400171 ) ( ON ?auto_400172 ?auto_400171 ) ( ON ?auto_400173 ?auto_400172 ) ( ON ?auto_400174 ?auto_400173 ) ( ON ?auto_400175 ?auto_400174 ) ( ON ?auto_400176 ?auto_400175 ) ( ON ?auto_400177 ?auto_400176 ) ( not ( = ?auto_400171 ?auto_400172 ) ) ( not ( = ?auto_400171 ?auto_400173 ) ) ( not ( = ?auto_400171 ?auto_400174 ) ) ( not ( = ?auto_400171 ?auto_400175 ) ) ( not ( = ?auto_400171 ?auto_400176 ) ) ( not ( = ?auto_400171 ?auto_400177 ) ) ( not ( = ?auto_400171 ?auto_400178 ) ) ( not ( = ?auto_400171 ?auto_400179 ) ) ( not ( = ?auto_400171 ?auto_400180 ) ) ( not ( = ?auto_400171 ?auto_400181 ) ) ( not ( = ?auto_400171 ?auto_400182 ) ) ( not ( = ?auto_400171 ?auto_400183 ) ) ( not ( = ?auto_400171 ?auto_400184 ) ) ( not ( = ?auto_400172 ?auto_400173 ) ) ( not ( = ?auto_400172 ?auto_400174 ) ) ( not ( = ?auto_400172 ?auto_400175 ) ) ( not ( = ?auto_400172 ?auto_400176 ) ) ( not ( = ?auto_400172 ?auto_400177 ) ) ( not ( = ?auto_400172 ?auto_400178 ) ) ( not ( = ?auto_400172 ?auto_400179 ) ) ( not ( = ?auto_400172 ?auto_400180 ) ) ( not ( = ?auto_400172 ?auto_400181 ) ) ( not ( = ?auto_400172 ?auto_400182 ) ) ( not ( = ?auto_400172 ?auto_400183 ) ) ( not ( = ?auto_400172 ?auto_400184 ) ) ( not ( = ?auto_400173 ?auto_400174 ) ) ( not ( = ?auto_400173 ?auto_400175 ) ) ( not ( = ?auto_400173 ?auto_400176 ) ) ( not ( = ?auto_400173 ?auto_400177 ) ) ( not ( = ?auto_400173 ?auto_400178 ) ) ( not ( = ?auto_400173 ?auto_400179 ) ) ( not ( = ?auto_400173 ?auto_400180 ) ) ( not ( = ?auto_400173 ?auto_400181 ) ) ( not ( = ?auto_400173 ?auto_400182 ) ) ( not ( = ?auto_400173 ?auto_400183 ) ) ( not ( = ?auto_400173 ?auto_400184 ) ) ( not ( = ?auto_400174 ?auto_400175 ) ) ( not ( = ?auto_400174 ?auto_400176 ) ) ( not ( = ?auto_400174 ?auto_400177 ) ) ( not ( = ?auto_400174 ?auto_400178 ) ) ( not ( = ?auto_400174 ?auto_400179 ) ) ( not ( = ?auto_400174 ?auto_400180 ) ) ( not ( = ?auto_400174 ?auto_400181 ) ) ( not ( = ?auto_400174 ?auto_400182 ) ) ( not ( = ?auto_400174 ?auto_400183 ) ) ( not ( = ?auto_400174 ?auto_400184 ) ) ( not ( = ?auto_400175 ?auto_400176 ) ) ( not ( = ?auto_400175 ?auto_400177 ) ) ( not ( = ?auto_400175 ?auto_400178 ) ) ( not ( = ?auto_400175 ?auto_400179 ) ) ( not ( = ?auto_400175 ?auto_400180 ) ) ( not ( = ?auto_400175 ?auto_400181 ) ) ( not ( = ?auto_400175 ?auto_400182 ) ) ( not ( = ?auto_400175 ?auto_400183 ) ) ( not ( = ?auto_400175 ?auto_400184 ) ) ( not ( = ?auto_400176 ?auto_400177 ) ) ( not ( = ?auto_400176 ?auto_400178 ) ) ( not ( = ?auto_400176 ?auto_400179 ) ) ( not ( = ?auto_400176 ?auto_400180 ) ) ( not ( = ?auto_400176 ?auto_400181 ) ) ( not ( = ?auto_400176 ?auto_400182 ) ) ( not ( = ?auto_400176 ?auto_400183 ) ) ( not ( = ?auto_400176 ?auto_400184 ) ) ( not ( = ?auto_400177 ?auto_400178 ) ) ( not ( = ?auto_400177 ?auto_400179 ) ) ( not ( = ?auto_400177 ?auto_400180 ) ) ( not ( = ?auto_400177 ?auto_400181 ) ) ( not ( = ?auto_400177 ?auto_400182 ) ) ( not ( = ?auto_400177 ?auto_400183 ) ) ( not ( = ?auto_400177 ?auto_400184 ) ) ( not ( = ?auto_400178 ?auto_400179 ) ) ( not ( = ?auto_400178 ?auto_400180 ) ) ( not ( = ?auto_400178 ?auto_400181 ) ) ( not ( = ?auto_400178 ?auto_400182 ) ) ( not ( = ?auto_400178 ?auto_400183 ) ) ( not ( = ?auto_400178 ?auto_400184 ) ) ( not ( = ?auto_400179 ?auto_400180 ) ) ( not ( = ?auto_400179 ?auto_400181 ) ) ( not ( = ?auto_400179 ?auto_400182 ) ) ( not ( = ?auto_400179 ?auto_400183 ) ) ( not ( = ?auto_400179 ?auto_400184 ) ) ( not ( = ?auto_400180 ?auto_400181 ) ) ( not ( = ?auto_400180 ?auto_400182 ) ) ( not ( = ?auto_400180 ?auto_400183 ) ) ( not ( = ?auto_400180 ?auto_400184 ) ) ( not ( = ?auto_400181 ?auto_400182 ) ) ( not ( = ?auto_400181 ?auto_400183 ) ) ( not ( = ?auto_400181 ?auto_400184 ) ) ( not ( = ?auto_400182 ?auto_400183 ) ) ( not ( = ?auto_400182 ?auto_400184 ) ) ( not ( = ?auto_400183 ?auto_400184 ) ) ( ON ?auto_400182 ?auto_400183 ) ( ON ?auto_400181 ?auto_400182 ) ( ON ?auto_400180 ?auto_400181 ) ( ON ?auto_400179 ?auto_400180 ) ( CLEAR ?auto_400177 ) ( ON ?auto_400178 ?auto_400179 ) ( CLEAR ?auto_400178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_400171 ?auto_400172 ?auto_400173 ?auto_400174 ?auto_400175 ?auto_400176 ?auto_400177 ?auto_400178 )
      ( MAKE-13PILE ?auto_400171 ?auto_400172 ?auto_400173 ?auto_400174 ?auto_400175 ?auto_400176 ?auto_400177 ?auto_400178 ?auto_400179 ?auto_400180 ?auto_400181 ?auto_400182 ?auto_400183 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_400225 - BLOCK
      ?auto_400226 - BLOCK
      ?auto_400227 - BLOCK
      ?auto_400228 - BLOCK
      ?auto_400229 - BLOCK
      ?auto_400230 - BLOCK
      ?auto_400231 - BLOCK
      ?auto_400232 - BLOCK
      ?auto_400233 - BLOCK
      ?auto_400234 - BLOCK
      ?auto_400235 - BLOCK
      ?auto_400236 - BLOCK
      ?auto_400237 - BLOCK
    )
    :vars
    (
      ?auto_400238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400237 ?auto_400238 ) ( ON-TABLE ?auto_400225 ) ( ON ?auto_400226 ?auto_400225 ) ( ON ?auto_400227 ?auto_400226 ) ( ON ?auto_400228 ?auto_400227 ) ( ON ?auto_400229 ?auto_400228 ) ( ON ?auto_400230 ?auto_400229 ) ( not ( = ?auto_400225 ?auto_400226 ) ) ( not ( = ?auto_400225 ?auto_400227 ) ) ( not ( = ?auto_400225 ?auto_400228 ) ) ( not ( = ?auto_400225 ?auto_400229 ) ) ( not ( = ?auto_400225 ?auto_400230 ) ) ( not ( = ?auto_400225 ?auto_400231 ) ) ( not ( = ?auto_400225 ?auto_400232 ) ) ( not ( = ?auto_400225 ?auto_400233 ) ) ( not ( = ?auto_400225 ?auto_400234 ) ) ( not ( = ?auto_400225 ?auto_400235 ) ) ( not ( = ?auto_400225 ?auto_400236 ) ) ( not ( = ?auto_400225 ?auto_400237 ) ) ( not ( = ?auto_400225 ?auto_400238 ) ) ( not ( = ?auto_400226 ?auto_400227 ) ) ( not ( = ?auto_400226 ?auto_400228 ) ) ( not ( = ?auto_400226 ?auto_400229 ) ) ( not ( = ?auto_400226 ?auto_400230 ) ) ( not ( = ?auto_400226 ?auto_400231 ) ) ( not ( = ?auto_400226 ?auto_400232 ) ) ( not ( = ?auto_400226 ?auto_400233 ) ) ( not ( = ?auto_400226 ?auto_400234 ) ) ( not ( = ?auto_400226 ?auto_400235 ) ) ( not ( = ?auto_400226 ?auto_400236 ) ) ( not ( = ?auto_400226 ?auto_400237 ) ) ( not ( = ?auto_400226 ?auto_400238 ) ) ( not ( = ?auto_400227 ?auto_400228 ) ) ( not ( = ?auto_400227 ?auto_400229 ) ) ( not ( = ?auto_400227 ?auto_400230 ) ) ( not ( = ?auto_400227 ?auto_400231 ) ) ( not ( = ?auto_400227 ?auto_400232 ) ) ( not ( = ?auto_400227 ?auto_400233 ) ) ( not ( = ?auto_400227 ?auto_400234 ) ) ( not ( = ?auto_400227 ?auto_400235 ) ) ( not ( = ?auto_400227 ?auto_400236 ) ) ( not ( = ?auto_400227 ?auto_400237 ) ) ( not ( = ?auto_400227 ?auto_400238 ) ) ( not ( = ?auto_400228 ?auto_400229 ) ) ( not ( = ?auto_400228 ?auto_400230 ) ) ( not ( = ?auto_400228 ?auto_400231 ) ) ( not ( = ?auto_400228 ?auto_400232 ) ) ( not ( = ?auto_400228 ?auto_400233 ) ) ( not ( = ?auto_400228 ?auto_400234 ) ) ( not ( = ?auto_400228 ?auto_400235 ) ) ( not ( = ?auto_400228 ?auto_400236 ) ) ( not ( = ?auto_400228 ?auto_400237 ) ) ( not ( = ?auto_400228 ?auto_400238 ) ) ( not ( = ?auto_400229 ?auto_400230 ) ) ( not ( = ?auto_400229 ?auto_400231 ) ) ( not ( = ?auto_400229 ?auto_400232 ) ) ( not ( = ?auto_400229 ?auto_400233 ) ) ( not ( = ?auto_400229 ?auto_400234 ) ) ( not ( = ?auto_400229 ?auto_400235 ) ) ( not ( = ?auto_400229 ?auto_400236 ) ) ( not ( = ?auto_400229 ?auto_400237 ) ) ( not ( = ?auto_400229 ?auto_400238 ) ) ( not ( = ?auto_400230 ?auto_400231 ) ) ( not ( = ?auto_400230 ?auto_400232 ) ) ( not ( = ?auto_400230 ?auto_400233 ) ) ( not ( = ?auto_400230 ?auto_400234 ) ) ( not ( = ?auto_400230 ?auto_400235 ) ) ( not ( = ?auto_400230 ?auto_400236 ) ) ( not ( = ?auto_400230 ?auto_400237 ) ) ( not ( = ?auto_400230 ?auto_400238 ) ) ( not ( = ?auto_400231 ?auto_400232 ) ) ( not ( = ?auto_400231 ?auto_400233 ) ) ( not ( = ?auto_400231 ?auto_400234 ) ) ( not ( = ?auto_400231 ?auto_400235 ) ) ( not ( = ?auto_400231 ?auto_400236 ) ) ( not ( = ?auto_400231 ?auto_400237 ) ) ( not ( = ?auto_400231 ?auto_400238 ) ) ( not ( = ?auto_400232 ?auto_400233 ) ) ( not ( = ?auto_400232 ?auto_400234 ) ) ( not ( = ?auto_400232 ?auto_400235 ) ) ( not ( = ?auto_400232 ?auto_400236 ) ) ( not ( = ?auto_400232 ?auto_400237 ) ) ( not ( = ?auto_400232 ?auto_400238 ) ) ( not ( = ?auto_400233 ?auto_400234 ) ) ( not ( = ?auto_400233 ?auto_400235 ) ) ( not ( = ?auto_400233 ?auto_400236 ) ) ( not ( = ?auto_400233 ?auto_400237 ) ) ( not ( = ?auto_400233 ?auto_400238 ) ) ( not ( = ?auto_400234 ?auto_400235 ) ) ( not ( = ?auto_400234 ?auto_400236 ) ) ( not ( = ?auto_400234 ?auto_400237 ) ) ( not ( = ?auto_400234 ?auto_400238 ) ) ( not ( = ?auto_400235 ?auto_400236 ) ) ( not ( = ?auto_400235 ?auto_400237 ) ) ( not ( = ?auto_400235 ?auto_400238 ) ) ( not ( = ?auto_400236 ?auto_400237 ) ) ( not ( = ?auto_400236 ?auto_400238 ) ) ( not ( = ?auto_400237 ?auto_400238 ) ) ( ON ?auto_400236 ?auto_400237 ) ( ON ?auto_400235 ?auto_400236 ) ( ON ?auto_400234 ?auto_400235 ) ( ON ?auto_400233 ?auto_400234 ) ( ON ?auto_400232 ?auto_400233 ) ( CLEAR ?auto_400230 ) ( ON ?auto_400231 ?auto_400232 ) ( CLEAR ?auto_400231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_400225 ?auto_400226 ?auto_400227 ?auto_400228 ?auto_400229 ?auto_400230 ?auto_400231 )
      ( MAKE-13PILE ?auto_400225 ?auto_400226 ?auto_400227 ?auto_400228 ?auto_400229 ?auto_400230 ?auto_400231 ?auto_400232 ?auto_400233 ?auto_400234 ?auto_400235 ?auto_400236 ?auto_400237 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_400279 - BLOCK
      ?auto_400280 - BLOCK
      ?auto_400281 - BLOCK
      ?auto_400282 - BLOCK
      ?auto_400283 - BLOCK
      ?auto_400284 - BLOCK
      ?auto_400285 - BLOCK
      ?auto_400286 - BLOCK
      ?auto_400287 - BLOCK
      ?auto_400288 - BLOCK
      ?auto_400289 - BLOCK
      ?auto_400290 - BLOCK
      ?auto_400291 - BLOCK
    )
    :vars
    (
      ?auto_400292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400291 ?auto_400292 ) ( ON-TABLE ?auto_400279 ) ( ON ?auto_400280 ?auto_400279 ) ( ON ?auto_400281 ?auto_400280 ) ( ON ?auto_400282 ?auto_400281 ) ( ON ?auto_400283 ?auto_400282 ) ( not ( = ?auto_400279 ?auto_400280 ) ) ( not ( = ?auto_400279 ?auto_400281 ) ) ( not ( = ?auto_400279 ?auto_400282 ) ) ( not ( = ?auto_400279 ?auto_400283 ) ) ( not ( = ?auto_400279 ?auto_400284 ) ) ( not ( = ?auto_400279 ?auto_400285 ) ) ( not ( = ?auto_400279 ?auto_400286 ) ) ( not ( = ?auto_400279 ?auto_400287 ) ) ( not ( = ?auto_400279 ?auto_400288 ) ) ( not ( = ?auto_400279 ?auto_400289 ) ) ( not ( = ?auto_400279 ?auto_400290 ) ) ( not ( = ?auto_400279 ?auto_400291 ) ) ( not ( = ?auto_400279 ?auto_400292 ) ) ( not ( = ?auto_400280 ?auto_400281 ) ) ( not ( = ?auto_400280 ?auto_400282 ) ) ( not ( = ?auto_400280 ?auto_400283 ) ) ( not ( = ?auto_400280 ?auto_400284 ) ) ( not ( = ?auto_400280 ?auto_400285 ) ) ( not ( = ?auto_400280 ?auto_400286 ) ) ( not ( = ?auto_400280 ?auto_400287 ) ) ( not ( = ?auto_400280 ?auto_400288 ) ) ( not ( = ?auto_400280 ?auto_400289 ) ) ( not ( = ?auto_400280 ?auto_400290 ) ) ( not ( = ?auto_400280 ?auto_400291 ) ) ( not ( = ?auto_400280 ?auto_400292 ) ) ( not ( = ?auto_400281 ?auto_400282 ) ) ( not ( = ?auto_400281 ?auto_400283 ) ) ( not ( = ?auto_400281 ?auto_400284 ) ) ( not ( = ?auto_400281 ?auto_400285 ) ) ( not ( = ?auto_400281 ?auto_400286 ) ) ( not ( = ?auto_400281 ?auto_400287 ) ) ( not ( = ?auto_400281 ?auto_400288 ) ) ( not ( = ?auto_400281 ?auto_400289 ) ) ( not ( = ?auto_400281 ?auto_400290 ) ) ( not ( = ?auto_400281 ?auto_400291 ) ) ( not ( = ?auto_400281 ?auto_400292 ) ) ( not ( = ?auto_400282 ?auto_400283 ) ) ( not ( = ?auto_400282 ?auto_400284 ) ) ( not ( = ?auto_400282 ?auto_400285 ) ) ( not ( = ?auto_400282 ?auto_400286 ) ) ( not ( = ?auto_400282 ?auto_400287 ) ) ( not ( = ?auto_400282 ?auto_400288 ) ) ( not ( = ?auto_400282 ?auto_400289 ) ) ( not ( = ?auto_400282 ?auto_400290 ) ) ( not ( = ?auto_400282 ?auto_400291 ) ) ( not ( = ?auto_400282 ?auto_400292 ) ) ( not ( = ?auto_400283 ?auto_400284 ) ) ( not ( = ?auto_400283 ?auto_400285 ) ) ( not ( = ?auto_400283 ?auto_400286 ) ) ( not ( = ?auto_400283 ?auto_400287 ) ) ( not ( = ?auto_400283 ?auto_400288 ) ) ( not ( = ?auto_400283 ?auto_400289 ) ) ( not ( = ?auto_400283 ?auto_400290 ) ) ( not ( = ?auto_400283 ?auto_400291 ) ) ( not ( = ?auto_400283 ?auto_400292 ) ) ( not ( = ?auto_400284 ?auto_400285 ) ) ( not ( = ?auto_400284 ?auto_400286 ) ) ( not ( = ?auto_400284 ?auto_400287 ) ) ( not ( = ?auto_400284 ?auto_400288 ) ) ( not ( = ?auto_400284 ?auto_400289 ) ) ( not ( = ?auto_400284 ?auto_400290 ) ) ( not ( = ?auto_400284 ?auto_400291 ) ) ( not ( = ?auto_400284 ?auto_400292 ) ) ( not ( = ?auto_400285 ?auto_400286 ) ) ( not ( = ?auto_400285 ?auto_400287 ) ) ( not ( = ?auto_400285 ?auto_400288 ) ) ( not ( = ?auto_400285 ?auto_400289 ) ) ( not ( = ?auto_400285 ?auto_400290 ) ) ( not ( = ?auto_400285 ?auto_400291 ) ) ( not ( = ?auto_400285 ?auto_400292 ) ) ( not ( = ?auto_400286 ?auto_400287 ) ) ( not ( = ?auto_400286 ?auto_400288 ) ) ( not ( = ?auto_400286 ?auto_400289 ) ) ( not ( = ?auto_400286 ?auto_400290 ) ) ( not ( = ?auto_400286 ?auto_400291 ) ) ( not ( = ?auto_400286 ?auto_400292 ) ) ( not ( = ?auto_400287 ?auto_400288 ) ) ( not ( = ?auto_400287 ?auto_400289 ) ) ( not ( = ?auto_400287 ?auto_400290 ) ) ( not ( = ?auto_400287 ?auto_400291 ) ) ( not ( = ?auto_400287 ?auto_400292 ) ) ( not ( = ?auto_400288 ?auto_400289 ) ) ( not ( = ?auto_400288 ?auto_400290 ) ) ( not ( = ?auto_400288 ?auto_400291 ) ) ( not ( = ?auto_400288 ?auto_400292 ) ) ( not ( = ?auto_400289 ?auto_400290 ) ) ( not ( = ?auto_400289 ?auto_400291 ) ) ( not ( = ?auto_400289 ?auto_400292 ) ) ( not ( = ?auto_400290 ?auto_400291 ) ) ( not ( = ?auto_400290 ?auto_400292 ) ) ( not ( = ?auto_400291 ?auto_400292 ) ) ( ON ?auto_400290 ?auto_400291 ) ( ON ?auto_400289 ?auto_400290 ) ( ON ?auto_400288 ?auto_400289 ) ( ON ?auto_400287 ?auto_400288 ) ( ON ?auto_400286 ?auto_400287 ) ( ON ?auto_400285 ?auto_400286 ) ( CLEAR ?auto_400283 ) ( ON ?auto_400284 ?auto_400285 ) ( CLEAR ?auto_400284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_400279 ?auto_400280 ?auto_400281 ?auto_400282 ?auto_400283 ?auto_400284 )
      ( MAKE-13PILE ?auto_400279 ?auto_400280 ?auto_400281 ?auto_400282 ?auto_400283 ?auto_400284 ?auto_400285 ?auto_400286 ?auto_400287 ?auto_400288 ?auto_400289 ?auto_400290 ?auto_400291 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_400333 - BLOCK
      ?auto_400334 - BLOCK
      ?auto_400335 - BLOCK
      ?auto_400336 - BLOCK
      ?auto_400337 - BLOCK
      ?auto_400338 - BLOCK
      ?auto_400339 - BLOCK
      ?auto_400340 - BLOCK
      ?auto_400341 - BLOCK
      ?auto_400342 - BLOCK
      ?auto_400343 - BLOCK
      ?auto_400344 - BLOCK
      ?auto_400345 - BLOCK
    )
    :vars
    (
      ?auto_400346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400345 ?auto_400346 ) ( ON-TABLE ?auto_400333 ) ( ON ?auto_400334 ?auto_400333 ) ( ON ?auto_400335 ?auto_400334 ) ( ON ?auto_400336 ?auto_400335 ) ( not ( = ?auto_400333 ?auto_400334 ) ) ( not ( = ?auto_400333 ?auto_400335 ) ) ( not ( = ?auto_400333 ?auto_400336 ) ) ( not ( = ?auto_400333 ?auto_400337 ) ) ( not ( = ?auto_400333 ?auto_400338 ) ) ( not ( = ?auto_400333 ?auto_400339 ) ) ( not ( = ?auto_400333 ?auto_400340 ) ) ( not ( = ?auto_400333 ?auto_400341 ) ) ( not ( = ?auto_400333 ?auto_400342 ) ) ( not ( = ?auto_400333 ?auto_400343 ) ) ( not ( = ?auto_400333 ?auto_400344 ) ) ( not ( = ?auto_400333 ?auto_400345 ) ) ( not ( = ?auto_400333 ?auto_400346 ) ) ( not ( = ?auto_400334 ?auto_400335 ) ) ( not ( = ?auto_400334 ?auto_400336 ) ) ( not ( = ?auto_400334 ?auto_400337 ) ) ( not ( = ?auto_400334 ?auto_400338 ) ) ( not ( = ?auto_400334 ?auto_400339 ) ) ( not ( = ?auto_400334 ?auto_400340 ) ) ( not ( = ?auto_400334 ?auto_400341 ) ) ( not ( = ?auto_400334 ?auto_400342 ) ) ( not ( = ?auto_400334 ?auto_400343 ) ) ( not ( = ?auto_400334 ?auto_400344 ) ) ( not ( = ?auto_400334 ?auto_400345 ) ) ( not ( = ?auto_400334 ?auto_400346 ) ) ( not ( = ?auto_400335 ?auto_400336 ) ) ( not ( = ?auto_400335 ?auto_400337 ) ) ( not ( = ?auto_400335 ?auto_400338 ) ) ( not ( = ?auto_400335 ?auto_400339 ) ) ( not ( = ?auto_400335 ?auto_400340 ) ) ( not ( = ?auto_400335 ?auto_400341 ) ) ( not ( = ?auto_400335 ?auto_400342 ) ) ( not ( = ?auto_400335 ?auto_400343 ) ) ( not ( = ?auto_400335 ?auto_400344 ) ) ( not ( = ?auto_400335 ?auto_400345 ) ) ( not ( = ?auto_400335 ?auto_400346 ) ) ( not ( = ?auto_400336 ?auto_400337 ) ) ( not ( = ?auto_400336 ?auto_400338 ) ) ( not ( = ?auto_400336 ?auto_400339 ) ) ( not ( = ?auto_400336 ?auto_400340 ) ) ( not ( = ?auto_400336 ?auto_400341 ) ) ( not ( = ?auto_400336 ?auto_400342 ) ) ( not ( = ?auto_400336 ?auto_400343 ) ) ( not ( = ?auto_400336 ?auto_400344 ) ) ( not ( = ?auto_400336 ?auto_400345 ) ) ( not ( = ?auto_400336 ?auto_400346 ) ) ( not ( = ?auto_400337 ?auto_400338 ) ) ( not ( = ?auto_400337 ?auto_400339 ) ) ( not ( = ?auto_400337 ?auto_400340 ) ) ( not ( = ?auto_400337 ?auto_400341 ) ) ( not ( = ?auto_400337 ?auto_400342 ) ) ( not ( = ?auto_400337 ?auto_400343 ) ) ( not ( = ?auto_400337 ?auto_400344 ) ) ( not ( = ?auto_400337 ?auto_400345 ) ) ( not ( = ?auto_400337 ?auto_400346 ) ) ( not ( = ?auto_400338 ?auto_400339 ) ) ( not ( = ?auto_400338 ?auto_400340 ) ) ( not ( = ?auto_400338 ?auto_400341 ) ) ( not ( = ?auto_400338 ?auto_400342 ) ) ( not ( = ?auto_400338 ?auto_400343 ) ) ( not ( = ?auto_400338 ?auto_400344 ) ) ( not ( = ?auto_400338 ?auto_400345 ) ) ( not ( = ?auto_400338 ?auto_400346 ) ) ( not ( = ?auto_400339 ?auto_400340 ) ) ( not ( = ?auto_400339 ?auto_400341 ) ) ( not ( = ?auto_400339 ?auto_400342 ) ) ( not ( = ?auto_400339 ?auto_400343 ) ) ( not ( = ?auto_400339 ?auto_400344 ) ) ( not ( = ?auto_400339 ?auto_400345 ) ) ( not ( = ?auto_400339 ?auto_400346 ) ) ( not ( = ?auto_400340 ?auto_400341 ) ) ( not ( = ?auto_400340 ?auto_400342 ) ) ( not ( = ?auto_400340 ?auto_400343 ) ) ( not ( = ?auto_400340 ?auto_400344 ) ) ( not ( = ?auto_400340 ?auto_400345 ) ) ( not ( = ?auto_400340 ?auto_400346 ) ) ( not ( = ?auto_400341 ?auto_400342 ) ) ( not ( = ?auto_400341 ?auto_400343 ) ) ( not ( = ?auto_400341 ?auto_400344 ) ) ( not ( = ?auto_400341 ?auto_400345 ) ) ( not ( = ?auto_400341 ?auto_400346 ) ) ( not ( = ?auto_400342 ?auto_400343 ) ) ( not ( = ?auto_400342 ?auto_400344 ) ) ( not ( = ?auto_400342 ?auto_400345 ) ) ( not ( = ?auto_400342 ?auto_400346 ) ) ( not ( = ?auto_400343 ?auto_400344 ) ) ( not ( = ?auto_400343 ?auto_400345 ) ) ( not ( = ?auto_400343 ?auto_400346 ) ) ( not ( = ?auto_400344 ?auto_400345 ) ) ( not ( = ?auto_400344 ?auto_400346 ) ) ( not ( = ?auto_400345 ?auto_400346 ) ) ( ON ?auto_400344 ?auto_400345 ) ( ON ?auto_400343 ?auto_400344 ) ( ON ?auto_400342 ?auto_400343 ) ( ON ?auto_400341 ?auto_400342 ) ( ON ?auto_400340 ?auto_400341 ) ( ON ?auto_400339 ?auto_400340 ) ( ON ?auto_400338 ?auto_400339 ) ( CLEAR ?auto_400336 ) ( ON ?auto_400337 ?auto_400338 ) ( CLEAR ?auto_400337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_400333 ?auto_400334 ?auto_400335 ?auto_400336 ?auto_400337 )
      ( MAKE-13PILE ?auto_400333 ?auto_400334 ?auto_400335 ?auto_400336 ?auto_400337 ?auto_400338 ?auto_400339 ?auto_400340 ?auto_400341 ?auto_400342 ?auto_400343 ?auto_400344 ?auto_400345 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_400387 - BLOCK
      ?auto_400388 - BLOCK
      ?auto_400389 - BLOCK
      ?auto_400390 - BLOCK
      ?auto_400391 - BLOCK
      ?auto_400392 - BLOCK
      ?auto_400393 - BLOCK
      ?auto_400394 - BLOCK
      ?auto_400395 - BLOCK
      ?auto_400396 - BLOCK
      ?auto_400397 - BLOCK
      ?auto_400398 - BLOCK
      ?auto_400399 - BLOCK
    )
    :vars
    (
      ?auto_400400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400399 ?auto_400400 ) ( ON-TABLE ?auto_400387 ) ( ON ?auto_400388 ?auto_400387 ) ( ON ?auto_400389 ?auto_400388 ) ( not ( = ?auto_400387 ?auto_400388 ) ) ( not ( = ?auto_400387 ?auto_400389 ) ) ( not ( = ?auto_400387 ?auto_400390 ) ) ( not ( = ?auto_400387 ?auto_400391 ) ) ( not ( = ?auto_400387 ?auto_400392 ) ) ( not ( = ?auto_400387 ?auto_400393 ) ) ( not ( = ?auto_400387 ?auto_400394 ) ) ( not ( = ?auto_400387 ?auto_400395 ) ) ( not ( = ?auto_400387 ?auto_400396 ) ) ( not ( = ?auto_400387 ?auto_400397 ) ) ( not ( = ?auto_400387 ?auto_400398 ) ) ( not ( = ?auto_400387 ?auto_400399 ) ) ( not ( = ?auto_400387 ?auto_400400 ) ) ( not ( = ?auto_400388 ?auto_400389 ) ) ( not ( = ?auto_400388 ?auto_400390 ) ) ( not ( = ?auto_400388 ?auto_400391 ) ) ( not ( = ?auto_400388 ?auto_400392 ) ) ( not ( = ?auto_400388 ?auto_400393 ) ) ( not ( = ?auto_400388 ?auto_400394 ) ) ( not ( = ?auto_400388 ?auto_400395 ) ) ( not ( = ?auto_400388 ?auto_400396 ) ) ( not ( = ?auto_400388 ?auto_400397 ) ) ( not ( = ?auto_400388 ?auto_400398 ) ) ( not ( = ?auto_400388 ?auto_400399 ) ) ( not ( = ?auto_400388 ?auto_400400 ) ) ( not ( = ?auto_400389 ?auto_400390 ) ) ( not ( = ?auto_400389 ?auto_400391 ) ) ( not ( = ?auto_400389 ?auto_400392 ) ) ( not ( = ?auto_400389 ?auto_400393 ) ) ( not ( = ?auto_400389 ?auto_400394 ) ) ( not ( = ?auto_400389 ?auto_400395 ) ) ( not ( = ?auto_400389 ?auto_400396 ) ) ( not ( = ?auto_400389 ?auto_400397 ) ) ( not ( = ?auto_400389 ?auto_400398 ) ) ( not ( = ?auto_400389 ?auto_400399 ) ) ( not ( = ?auto_400389 ?auto_400400 ) ) ( not ( = ?auto_400390 ?auto_400391 ) ) ( not ( = ?auto_400390 ?auto_400392 ) ) ( not ( = ?auto_400390 ?auto_400393 ) ) ( not ( = ?auto_400390 ?auto_400394 ) ) ( not ( = ?auto_400390 ?auto_400395 ) ) ( not ( = ?auto_400390 ?auto_400396 ) ) ( not ( = ?auto_400390 ?auto_400397 ) ) ( not ( = ?auto_400390 ?auto_400398 ) ) ( not ( = ?auto_400390 ?auto_400399 ) ) ( not ( = ?auto_400390 ?auto_400400 ) ) ( not ( = ?auto_400391 ?auto_400392 ) ) ( not ( = ?auto_400391 ?auto_400393 ) ) ( not ( = ?auto_400391 ?auto_400394 ) ) ( not ( = ?auto_400391 ?auto_400395 ) ) ( not ( = ?auto_400391 ?auto_400396 ) ) ( not ( = ?auto_400391 ?auto_400397 ) ) ( not ( = ?auto_400391 ?auto_400398 ) ) ( not ( = ?auto_400391 ?auto_400399 ) ) ( not ( = ?auto_400391 ?auto_400400 ) ) ( not ( = ?auto_400392 ?auto_400393 ) ) ( not ( = ?auto_400392 ?auto_400394 ) ) ( not ( = ?auto_400392 ?auto_400395 ) ) ( not ( = ?auto_400392 ?auto_400396 ) ) ( not ( = ?auto_400392 ?auto_400397 ) ) ( not ( = ?auto_400392 ?auto_400398 ) ) ( not ( = ?auto_400392 ?auto_400399 ) ) ( not ( = ?auto_400392 ?auto_400400 ) ) ( not ( = ?auto_400393 ?auto_400394 ) ) ( not ( = ?auto_400393 ?auto_400395 ) ) ( not ( = ?auto_400393 ?auto_400396 ) ) ( not ( = ?auto_400393 ?auto_400397 ) ) ( not ( = ?auto_400393 ?auto_400398 ) ) ( not ( = ?auto_400393 ?auto_400399 ) ) ( not ( = ?auto_400393 ?auto_400400 ) ) ( not ( = ?auto_400394 ?auto_400395 ) ) ( not ( = ?auto_400394 ?auto_400396 ) ) ( not ( = ?auto_400394 ?auto_400397 ) ) ( not ( = ?auto_400394 ?auto_400398 ) ) ( not ( = ?auto_400394 ?auto_400399 ) ) ( not ( = ?auto_400394 ?auto_400400 ) ) ( not ( = ?auto_400395 ?auto_400396 ) ) ( not ( = ?auto_400395 ?auto_400397 ) ) ( not ( = ?auto_400395 ?auto_400398 ) ) ( not ( = ?auto_400395 ?auto_400399 ) ) ( not ( = ?auto_400395 ?auto_400400 ) ) ( not ( = ?auto_400396 ?auto_400397 ) ) ( not ( = ?auto_400396 ?auto_400398 ) ) ( not ( = ?auto_400396 ?auto_400399 ) ) ( not ( = ?auto_400396 ?auto_400400 ) ) ( not ( = ?auto_400397 ?auto_400398 ) ) ( not ( = ?auto_400397 ?auto_400399 ) ) ( not ( = ?auto_400397 ?auto_400400 ) ) ( not ( = ?auto_400398 ?auto_400399 ) ) ( not ( = ?auto_400398 ?auto_400400 ) ) ( not ( = ?auto_400399 ?auto_400400 ) ) ( ON ?auto_400398 ?auto_400399 ) ( ON ?auto_400397 ?auto_400398 ) ( ON ?auto_400396 ?auto_400397 ) ( ON ?auto_400395 ?auto_400396 ) ( ON ?auto_400394 ?auto_400395 ) ( ON ?auto_400393 ?auto_400394 ) ( ON ?auto_400392 ?auto_400393 ) ( ON ?auto_400391 ?auto_400392 ) ( CLEAR ?auto_400389 ) ( ON ?auto_400390 ?auto_400391 ) ( CLEAR ?auto_400390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_400387 ?auto_400388 ?auto_400389 ?auto_400390 )
      ( MAKE-13PILE ?auto_400387 ?auto_400388 ?auto_400389 ?auto_400390 ?auto_400391 ?auto_400392 ?auto_400393 ?auto_400394 ?auto_400395 ?auto_400396 ?auto_400397 ?auto_400398 ?auto_400399 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_400441 - BLOCK
      ?auto_400442 - BLOCK
      ?auto_400443 - BLOCK
      ?auto_400444 - BLOCK
      ?auto_400445 - BLOCK
      ?auto_400446 - BLOCK
      ?auto_400447 - BLOCK
      ?auto_400448 - BLOCK
      ?auto_400449 - BLOCK
      ?auto_400450 - BLOCK
      ?auto_400451 - BLOCK
      ?auto_400452 - BLOCK
      ?auto_400453 - BLOCK
    )
    :vars
    (
      ?auto_400454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400453 ?auto_400454 ) ( ON-TABLE ?auto_400441 ) ( ON ?auto_400442 ?auto_400441 ) ( not ( = ?auto_400441 ?auto_400442 ) ) ( not ( = ?auto_400441 ?auto_400443 ) ) ( not ( = ?auto_400441 ?auto_400444 ) ) ( not ( = ?auto_400441 ?auto_400445 ) ) ( not ( = ?auto_400441 ?auto_400446 ) ) ( not ( = ?auto_400441 ?auto_400447 ) ) ( not ( = ?auto_400441 ?auto_400448 ) ) ( not ( = ?auto_400441 ?auto_400449 ) ) ( not ( = ?auto_400441 ?auto_400450 ) ) ( not ( = ?auto_400441 ?auto_400451 ) ) ( not ( = ?auto_400441 ?auto_400452 ) ) ( not ( = ?auto_400441 ?auto_400453 ) ) ( not ( = ?auto_400441 ?auto_400454 ) ) ( not ( = ?auto_400442 ?auto_400443 ) ) ( not ( = ?auto_400442 ?auto_400444 ) ) ( not ( = ?auto_400442 ?auto_400445 ) ) ( not ( = ?auto_400442 ?auto_400446 ) ) ( not ( = ?auto_400442 ?auto_400447 ) ) ( not ( = ?auto_400442 ?auto_400448 ) ) ( not ( = ?auto_400442 ?auto_400449 ) ) ( not ( = ?auto_400442 ?auto_400450 ) ) ( not ( = ?auto_400442 ?auto_400451 ) ) ( not ( = ?auto_400442 ?auto_400452 ) ) ( not ( = ?auto_400442 ?auto_400453 ) ) ( not ( = ?auto_400442 ?auto_400454 ) ) ( not ( = ?auto_400443 ?auto_400444 ) ) ( not ( = ?auto_400443 ?auto_400445 ) ) ( not ( = ?auto_400443 ?auto_400446 ) ) ( not ( = ?auto_400443 ?auto_400447 ) ) ( not ( = ?auto_400443 ?auto_400448 ) ) ( not ( = ?auto_400443 ?auto_400449 ) ) ( not ( = ?auto_400443 ?auto_400450 ) ) ( not ( = ?auto_400443 ?auto_400451 ) ) ( not ( = ?auto_400443 ?auto_400452 ) ) ( not ( = ?auto_400443 ?auto_400453 ) ) ( not ( = ?auto_400443 ?auto_400454 ) ) ( not ( = ?auto_400444 ?auto_400445 ) ) ( not ( = ?auto_400444 ?auto_400446 ) ) ( not ( = ?auto_400444 ?auto_400447 ) ) ( not ( = ?auto_400444 ?auto_400448 ) ) ( not ( = ?auto_400444 ?auto_400449 ) ) ( not ( = ?auto_400444 ?auto_400450 ) ) ( not ( = ?auto_400444 ?auto_400451 ) ) ( not ( = ?auto_400444 ?auto_400452 ) ) ( not ( = ?auto_400444 ?auto_400453 ) ) ( not ( = ?auto_400444 ?auto_400454 ) ) ( not ( = ?auto_400445 ?auto_400446 ) ) ( not ( = ?auto_400445 ?auto_400447 ) ) ( not ( = ?auto_400445 ?auto_400448 ) ) ( not ( = ?auto_400445 ?auto_400449 ) ) ( not ( = ?auto_400445 ?auto_400450 ) ) ( not ( = ?auto_400445 ?auto_400451 ) ) ( not ( = ?auto_400445 ?auto_400452 ) ) ( not ( = ?auto_400445 ?auto_400453 ) ) ( not ( = ?auto_400445 ?auto_400454 ) ) ( not ( = ?auto_400446 ?auto_400447 ) ) ( not ( = ?auto_400446 ?auto_400448 ) ) ( not ( = ?auto_400446 ?auto_400449 ) ) ( not ( = ?auto_400446 ?auto_400450 ) ) ( not ( = ?auto_400446 ?auto_400451 ) ) ( not ( = ?auto_400446 ?auto_400452 ) ) ( not ( = ?auto_400446 ?auto_400453 ) ) ( not ( = ?auto_400446 ?auto_400454 ) ) ( not ( = ?auto_400447 ?auto_400448 ) ) ( not ( = ?auto_400447 ?auto_400449 ) ) ( not ( = ?auto_400447 ?auto_400450 ) ) ( not ( = ?auto_400447 ?auto_400451 ) ) ( not ( = ?auto_400447 ?auto_400452 ) ) ( not ( = ?auto_400447 ?auto_400453 ) ) ( not ( = ?auto_400447 ?auto_400454 ) ) ( not ( = ?auto_400448 ?auto_400449 ) ) ( not ( = ?auto_400448 ?auto_400450 ) ) ( not ( = ?auto_400448 ?auto_400451 ) ) ( not ( = ?auto_400448 ?auto_400452 ) ) ( not ( = ?auto_400448 ?auto_400453 ) ) ( not ( = ?auto_400448 ?auto_400454 ) ) ( not ( = ?auto_400449 ?auto_400450 ) ) ( not ( = ?auto_400449 ?auto_400451 ) ) ( not ( = ?auto_400449 ?auto_400452 ) ) ( not ( = ?auto_400449 ?auto_400453 ) ) ( not ( = ?auto_400449 ?auto_400454 ) ) ( not ( = ?auto_400450 ?auto_400451 ) ) ( not ( = ?auto_400450 ?auto_400452 ) ) ( not ( = ?auto_400450 ?auto_400453 ) ) ( not ( = ?auto_400450 ?auto_400454 ) ) ( not ( = ?auto_400451 ?auto_400452 ) ) ( not ( = ?auto_400451 ?auto_400453 ) ) ( not ( = ?auto_400451 ?auto_400454 ) ) ( not ( = ?auto_400452 ?auto_400453 ) ) ( not ( = ?auto_400452 ?auto_400454 ) ) ( not ( = ?auto_400453 ?auto_400454 ) ) ( ON ?auto_400452 ?auto_400453 ) ( ON ?auto_400451 ?auto_400452 ) ( ON ?auto_400450 ?auto_400451 ) ( ON ?auto_400449 ?auto_400450 ) ( ON ?auto_400448 ?auto_400449 ) ( ON ?auto_400447 ?auto_400448 ) ( ON ?auto_400446 ?auto_400447 ) ( ON ?auto_400445 ?auto_400446 ) ( ON ?auto_400444 ?auto_400445 ) ( CLEAR ?auto_400442 ) ( ON ?auto_400443 ?auto_400444 ) ( CLEAR ?auto_400443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_400441 ?auto_400442 ?auto_400443 )
      ( MAKE-13PILE ?auto_400441 ?auto_400442 ?auto_400443 ?auto_400444 ?auto_400445 ?auto_400446 ?auto_400447 ?auto_400448 ?auto_400449 ?auto_400450 ?auto_400451 ?auto_400452 ?auto_400453 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_400495 - BLOCK
      ?auto_400496 - BLOCK
      ?auto_400497 - BLOCK
      ?auto_400498 - BLOCK
      ?auto_400499 - BLOCK
      ?auto_400500 - BLOCK
      ?auto_400501 - BLOCK
      ?auto_400502 - BLOCK
      ?auto_400503 - BLOCK
      ?auto_400504 - BLOCK
      ?auto_400505 - BLOCK
      ?auto_400506 - BLOCK
      ?auto_400507 - BLOCK
    )
    :vars
    (
      ?auto_400508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400507 ?auto_400508 ) ( ON-TABLE ?auto_400495 ) ( not ( = ?auto_400495 ?auto_400496 ) ) ( not ( = ?auto_400495 ?auto_400497 ) ) ( not ( = ?auto_400495 ?auto_400498 ) ) ( not ( = ?auto_400495 ?auto_400499 ) ) ( not ( = ?auto_400495 ?auto_400500 ) ) ( not ( = ?auto_400495 ?auto_400501 ) ) ( not ( = ?auto_400495 ?auto_400502 ) ) ( not ( = ?auto_400495 ?auto_400503 ) ) ( not ( = ?auto_400495 ?auto_400504 ) ) ( not ( = ?auto_400495 ?auto_400505 ) ) ( not ( = ?auto_400495 ?auto_400506 ) ) ( not ( = ?auto_400495 ?auto_400507 ) ) ( not ( = ?auto_400495 ?auto_400508 ) ) ( not ( = ?auto_400496 ?auto_400497 ) ) ( not ( = ?auto_400496 ?auto_400498 ) ) ( not ( = ?auto_400496 ?auto_400499 ) ) ( not ( = ?auto_400496 ?auto_400500 ) ) ( not ( = ?auto_400496 ?auto_400501 ) ) ( not ( = ?auto_400496 ?auto_400502 ) ) ( not ( = ?auto_400496 ?auto_400503 ) ) ( not ( = ?auto_400496 ?auto_400504 ) ) ( not ( = ?auto_400496 ?auto_400505 ) ) ( not ( = ?auto_400496 ?auto_400506 ) ) ( not ( = ?auto_400496 ?auto_400507 ) ) ( not ( = ?auto_400496 ?auto_400508 ) ) ( not ( = ?auto_400497 ?auto_400498 ) ) ( not ( = ?auto_400497 ?auto_400499 ) ) ( not ( = ?auto_400497 ?auto_400500 ) ) ( not ( = ?auto_400497 ?auto_400501 ) ) ( not ( = ?auto_400497 ?auto_400502 ) ) ( not ( = ?auto_400497 ?auto_400503 ) ) ( not ( = ?auto_400497 ?auto_400504 ) ) ( not ( = ?auto_400497 ?auto_400505 ) ) ( not ( = ?auto_400497 ?auto_400506 ) ) ( not ( = ?auto_400497 ?auto_400507 ) ) ( not ( = ?auto_400497 ?auto_400508 ) ) ( not ( = ?auto_400498 ?auto_400499 ) ) ( not ( = ?auto_400498 ?auto_400500 ) ) ( not ( = ?auto_400498 ?auto_400501 ) ) ( not ( = ?auto_400498 ?auto_400502 ) ) ( not ( = ?auto_400498 ?auto_400503 ) ) ( not ( = ?auto_400498 ?auto_400504 ) ) ( not ( = ?auto_400498 ?auto_400505 ) ) ( not ( = ?auto_400498 ?auto_400506 ) ) ( not ( = ?auto_400498 ?auto_400507 ) ) ( not ( = ?auto_400498 ?auto_400508 ) ) ( not ( = ?auto_400499 ?auto_400500 ) ) ( not ( = ?auto_400499 ?auto_400501 ) ) ( not ( = ?auto_400499 ?auto_400502 ) ) ( not ( = ?auto_400499 ?auto_400503 ) ) ( not ( = ?auto_400499 ?auto_400504 ) ) ( not ( = ?auto_400499 ?auto_400505 ) ) ( not ( = ?auto_400499 ?auto_400506 ) ) ( not ( = ?auto_400499 ?auto_400507 ) ) ( not ( = ?auto_400499 ?auto_400508 ) ) ( not ( = ?auto_400500 ?auto_400501 ) ) ( not ( = ?auto_400500 ?auto_400502 ) ) ( not ( = ?auto_400500 ?auto_400503 ) ) ( not ( = ?auto_400500 ?auto_400504 ) ) ( not ( = ?auto_400500 ?auto_400505 ) ) ( not ( = ?auto_400500 ?auto_400506 ) ) ( not ( = ?auto_400500 ?auto_400507 ) ) ( not ( = ?auto_400500 ?auto_400508 ) ) ( not ( = ?auto_400501 ?auto_400502 ) ) ( not ( = ?auto_400501 ?auto_400503 ) ) ( not ( = ?auto_400501 ?auto_400504 ) ) ( not ( = ?auto_400501 ?auto_400505 ) ) ( not ( = ?auto_400501 ?auto_400506 ) ) ( not ( = ?auto_400501 ?auto_400507 ) ) ( not ( = ?auto_400501 ?auto_400508 ) ) ( not ( = ?auto_400502 ?auto_400503 ) ) ( not ( = ?auto_400502 ?auto_400504 ) ) ( not ( = ?auto_400502 ?auto_400505 ) ) ( not ( = ?auto_400502 ?auto_400506 ) ) ( not ( = ?auto_400502 ?auto_400507 ) ) ( not ( = ?auto_400502 ?auto_400508 ) ) ( not ( = ?auto_400503 ?auto_400504 ) ) ( not ( = ?auto_400503 ?auto_400505 ) ) ( not ( = ?auto_400503 ?auto_400506 ) ) ( not ( = ?auto_400503 ?auto_400507 ) ) ( not ( = ?auto_400503 ?auto_400508 ) ) ( not ( = ?auto_400504 ?auto_400505 ) ) ( not ( = ?auto_400504 ?auto_400506 ) ) ( not ( = ?auto_400504 ?auto_400507 ) ) ( not ( = ?auto_400504 ?auto_400508 ) ) ( not ( = ?auto_400505 ?auto_400506 ) ) ( not ( = ?auto_400505 ?auto_400507 ) ) ( not ( = ?auto_400505 ?auto_400508 ) ) ( not ( = ?auto_400506 ?auto_400507 ) ) ( not ( = ?auto_400506 ?auto_400508 ) ) ( not ( = ?auto_400507 ?auto_400508 ) ) ( ON ?auto_400506 ?auto_400507 ) ( ON ?auto_400505 ?auto_400506 ) ( ON ?auto_400504 ?auto_400505 ) ( ON ?auto_400503 ?auto_400504 ) ( ON ?auto_400502 ?auto_400503 ) ( ON ?auto_400501 ?auto_400502 ) ( ON ?auto_400500 ?auto_400501 ) ( ON ?auto_400499 ?auto_400500 ) ( ON ?auto_400498 ?auto_400499 ) ( ON ?auto_400497 ?auto_400498 ) ( CLEAR ?auto_400495 ) ( ON ?auto_400496 ?auto_400497 ) ( CLEAR ?auto_400496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_400495 ?auto_400496 )
      ( MAKE-13PILE ?auto_400495 ?auto_400496 ?auto_400497 ?auto_400498 ?auto_400499 ?auto_400500 ?auto_400501 ?auto_400502 ?auto_400503 ?auto_400504 ?auto_400505 ?auto_400506 ?auto_400507 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_400549 - BLOCK
      ?auto_400550 - BLOCK
      ?auto_400551 - BLOCK
      ?auto_400552 - BLOCK
      ?auto_400553 - BLOCK
      ?auto_400554 - BLOCK
      ?auto_400555 - BLOCK
      ?auto_400556 - BLOCK
      ?auto_400557 - BLOCK
      ?auto_400558 - BLOCK
      ?auto_400559 - BLOCK
      ?auto_400560 - BLOCK
      ?auto_400561 - BLOCK
    )
    :vars
    (
      ?auto_400562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400561 ?auto_400562 ) ( not ( = ?auto_400549 ?auto_400550 ) ) ( not ( = ?auto_400549 ?auto_400551 ) ) ( not ( = ?auto_400549 ?auto_400552 ) ) ( not ( = ?auto_400549 ?auto_400553 ) ) ( not ( = ?auto_400549 ?auto_400554 ) ) ( not ( = ?auto_400549 ?auto_400555 ) ) ( not ( = ?auto_400549 ?auto_400556 ) ) ( not ( = ?auto_400549 ?auto_400557 ) ) ( not ( = ?auto_400549 ?auto_400558 ) ) ( not ( = ?auto_400549 ?auto_400559 ) ) ( not ( = ?auto_400549 ?auto_400560 ) ) ( not ( = ?auto_400549 ?auto_400561 ) ) ( not ( = ?auto_400549 ?auto_400562 ) ) ( not ( = ?auto_400550 ?auto_400551 ) ) ( not ( = ?auto_400550 ?auto_400552 ) ) ( not ( = ?auto_400550 ?auto_400553 ) ) ( not ( = ?auto_400550 ?auto_400554 ) ) ( not ( = ?auto_400550 ?auto_400555 ) ) ( not ( = ?auto_400550 ?auto_400556 ) ) ( not ( = ?auto_400550 ?auto_400557 ) ) ( not ( = ?auto_400550 ?auto_400558 ) ) ( not ( = ?auto_400550 ?auto_400559 ) ) ( not ( = ?auto_400550 ?auto_400560 ) ) ( not ( = ?auto_400550 ?auto_400561 ) ) ( not ( = ?auto_400550 ?auto_400562 ) ) ( not ( = ?auto_400551 ?auto_400552 ) ) ( not ( = ?auto_400551 ?auto_400553 ) ) ( not ( = ?auto_400551 ?auto_400554 ) ) ( not ( = ?auto_400551 ?auto_400555 ) ) ( not ( = ?auto_400551 ?auto_400556 ) ) ( not ( = ?auto_400551 ?auto_400557 ) ) ( not ( = ?auto_400551 ?auto_400558 ) ) ( not ( = ?auto_400551 ?auto_400559 ) ) ( not ( = ?auto_400551 ?auto_400560 ) ) ( not ( = ?auto_400551 ?auto_400561 ) ) ( not ( = ?auto_400551 ?auto_400562 ) ) ( not ( = ?auto_400552 ?auto_400553 ) ) ( not ( = ?auto_400552 ?auto_400554 ) ) ( not ( = ?auto_400552 ?auto_400555 ) ) ( not ( = ?auto_400552 ?auto_400556 ) ) ( not ( = ?auto_400552 ?auto_400557 ) ) ( not ( = ?auto_400552 ?auto_400558 ) ) ( not ( = ?auto_400552 ?auto_400559 ) ) ( not ( = ?auto_400552 ?auto_400560 ) ) ( not ( = ?auto_400552 ?auto_400561 ) ) ( not ( = ?auto_400552 ?auto_400562 ) ) ( not ( = ?auto_400553 ?auto_400554 ) ) ( not ( = ?auto_400553 ?auto_400555 ) ) ( not ( = ?auto_400553 ?auto_400556 ) ) ( not ( = ?auto_400553 ?auto_400557 ) ) ( not ( = ?auto_400553 ?auto_400558 ) ) ( not ( = ?auto_400553 ?auto_400559 ) ) ( not ( = ?auto_400553 ?auto_400560 ) ) ( not ( = ?auto_400553 ?auto_400561 ) ) ( not ( = ?auto_400553 ?auto_400562 ) ) ( not ( = ?auto_400554 ?auto_400555 ) ) ( not ( = ?auto_400554 ?auto_400556 ) ) ( not ( = ?auto_400554 ?auto_400557 ) ) ( not ( = ?auto_400554 ?auto_400558 ) ) ( not ( = ?auto_400554 ?auto_400559 ) ) ( not ( = ?auto_400554 ?auto_400560 ) ) ( not ( = ?auto_400554 ?auto_400561 ) ) ( not ( = ?auto_400554 ?auto_400562 ) ) ( not ( = ?auto_400555 ?auto_400556 ) ) ( not ( = ?auto_400555 ?auto_400557 ) ) ( not ( = ?auto_400555 ?auto_400558 ) ) ( not ( = ?auto_400555 ?auto_400559 ) ) ( not ( = ?auto_400555 ?auto_400560 ) ) ( not ( = ?auto_400555 ?auto_400561 ) ) ( not ( = ?auto_400555 ?auto_400562 ) ) ( not ( = ?auto_400556 ?auto_400557 ) ) ( not ( = ?auto_400556 ?auto_400558 ) ) ( not ( = ?auto_400556 ?auto_400559 ) ) ( not ( = ?auto_400556 ?auto_400560 ) ) ( not ( = ?auto_400556 ?auto_400561 ) ) ( not ( = ?auto_400556 ?auto_400562 ) ) ( not ( = ?auto_400557 ?auto_400558 ) ) ( not ( = ?auto_400557 ?auto_400559 ) ) ( not ( = ?auto_400557 ?auto_400560 ) ) ( not ( = ?auto_400557 ?auto_400561 ) ) ( not ( = ?auto_400557 ?auto_400562 ) ) ( not ( = ?auto_400558 ?auto_400559 ) ) ( not ( = ?auto_400558 ?auto_400560 ) ) ( not ( = ?auto_400558 ?auto_400561 ) ) ( not ( = ?auto_400558 ?auto_400562 ) ) ( not ( = ?auto_400559 ?auto_400560 ) ) ( not ( = ?auto_400559 ?auto_400561 ) ) ( not ( = ?auto_400559 ?auto_400562 ) ) ( not ( = ?auto_400560 ?auto_400561 ) ) ( not ( = ?auto_400560 ?auto_400562 ) ) ( not ( = ?auto_400561 ?auto_400562 ) ) ( ON ?auto_400560 ?auto_400561 ) ( ON ?auto_400559 ?auto_400560 ) ( ON ?auto_400558 ?auto_400559 ) ( ON ?auto_400557 ?auto_400558 ) ( ON ?auto_400556 ?auto_400557 ) ( ON ?auto_400555 ?auto_400556 ) ( ON ?auto_400554 ?auto_400555 ) ( ON ?auto_400553 ?auto_400554 ) ( ON ?auto_400552 ?auto_400553 ) ( ON ?auto_400551 ?auto_400552 ) ( ON ?auto_400550 ?auto_400551 ) ( ON ?auto_400549 ?auto_400550 ) ( CLEAR ?auto_400549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_400549 )
      ( MAKE-13PILE ?auto_400549 ?auto_400550 ?auto_400551 ?auto_400552 ?auto_400553 ?auto_400554 ?auto_400555 ?auto_400556 ?auto_400557 ?auto_400558 ?auto_400559 ?auto_400560 ?auto_400561 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_400604 - BLOCK
      ?auto_400605 - BLOCK
      ?auto_400606 - BLOCK
      ?auto_400607 - BLOCK
      ?auto_400608 - BLOCK
      ?auto_400609 - BLOCK
      ?auto_400610 - BLOCK
      ?auto_400611 - BLOCK
      ?auto_400612 - BLOCK
      ?auto_400613 - BLOCK
      ?auto_400614 - BLOCK
      ?auto_400615 - BLOCK
      ?auto_400616 - BLOCK
      ?auto_400617 - BLOCK
    )
    :vars
    (
      ?auto_400618 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_400616 ) ( ON ?auto_400617 ?auto_400618 ) ( CLEAR ?auto_400617 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_400604 ) ( ON ?auto_400605 ?auto_400604 ) ( ON ?auto_400606 ?auto_400605 ) ( ON ?auto_400607 ?auto_400606 ) ( ON ?auto_400608 ?auto_400607 ) ( ON ?auto_400609 ?auto_400608 ) ( ON ?auto_400610 ?auto_400609 ) ( ON ?auto_400611 ?auto_400610 ) ( ON ?auto_400612 ?auto_400611 ) ( ON ?auto_400613 ?auto_400612 ) ( ON ?auto_400614 ?auto_400613 ) ( ON ?auto_400615 ?auto_400614 ) ( ON ?auto_400616 ?auto_400615 ) ( not ( = ?auto_400604 ?auto_400605 ) ) ( not ( = ?auto_400604 ?auto_400606 ) ) ( not ( = ?auto_400604 ?auto_400607 ) ) ( not ( = ?auto_400604 ?auto_400608 ) ) ( not ( = ?auto_400604 ?auto_400609 ) ) ( not ( = ?auto_400604 ?auto_400610 ) ) ( not ( = ?auto_400604 ?auto_400611 ) ) ( not ( = ?auto_400604 ?auto_400612 ) ) ( not ( = ?auto_400604 ?auto_400613 ) ) ( not ( = ?auto_400604 ?auto_400614 ) ) ( not ( = ?auto_400604 ?auto_400615 ) ) ( not ( = ?auto_400604 ?auto_400616 ) ) ( not ( = ?auto_400604 ?auto_400617 ) ) ( not ( = ?auto_400604 ?auto_400618 ) ) ( not ( = ?auto_400605 ?auto_400606 ) ) ( not ( = ?auto_400605 ?auto_400607 ) ) ( not ( = ?auto_400605 ?auto_400608 ) ) ( not ( = ?auto_400605 ?auto_400609 ) ) ( not ( = ?auto_400605 ?auto_400610 ) ) ( not ( = ?auto_400605 ?auto_400611 ) ) ( not ( = ?auto_400605 ?auto_400612 ) ) ( not ( = ?auto_400605 ?auto_400613 ) ) ( not ( = ?auto_400605 ?auto_400614 ) ) ( not ( = ?auto_400605 ?auto_400615 ) ) ( not ( = ?auto_400605 ?auto_400616 ) ) ( not ( = ?auto_400605 ?auto_400617 ) ) ( not ( = ?auto_400605 ?auto_400618 ) ) ( not ( = ?auto_400606 ?auto_400607 ) ) ( not ( = ?auto_400606 ?auto_400608 ) ) ( not ( = ?auto_400606 ?auto_400609 ) ) ( not ( = ?auto_400606 ?auto_400610 ) ) ( not ( = ?auto_400606 ?auto_400611 ) ) ( not ( = ?auto_400606 ?auto_400612 ) ) ( not ( = ?auto_400606 ?auto_400613 ) ) ( not ( = ?auto_400606 ?auto_400614 ) ) ( not ( = ?auto_400606 ?auto_400615 ) ) ( not ( = ?auto_400606 ?auto_400616 ) ) ( not ( = ?auto_400606 ?auto_400617 ) ) ( not ( = ?auto_400606 ?auto_400618 ) ) ( not ( = ?auto_400607 ?auto_400608 ) ) ( not ( = ?auto_400607 ?auto_400609 ) ) ( not ( = ?auto_400607 ?auto_400610 ) ) ( not ( = ?auto_400607 ?auto_400611 ) ) ( not ( = ?auto_400607 ?auto_400612 ) ) ( not ( = ?auto_400607 ?auto_400613 ) ) ( not ( = ?auto_400607 ?auto_400614 ) ) ( not ( = ?auto_400607 ?auto_400615 ) ) ( not ( = ?auto_400607 ?auto_400616 ) ) ( not ( = ?auto_400607 ?auto_400617 ) ) ( not ( = ?auto_400607 ?auto_400618 ) ) ( not ( = ?auto_400608 ?auto_400609 ) ) ( not ( = ?auto_400608 ?auto_400610 ) ) ( not ( = ?auto_400608 ?auto_400611 ) ) ( not ( = ?auto_400608 ?auto_400612 ) ) ( not ( = ?auto_400608 ?auto_400613 ) ) ( not ( = ?auto_400608 ?auto_400614 ) ) ( not ( = ?auto_400608 ?auto_400615 ) ) ( not ( = ?auto_400608 ?auto_400616 ) ) ( not ( = ?auto_400608 ?auto_400617 ) ) ( not ( = ?auto_400608 ?auto_400618 ) ) ( not ( = ?auto_400609 ?auto_400610 ) ) ( not ( = ?auto_400609 ?auto_400611 ) ) ( not ( = ?auto_400609 ?auto_400612 ) ) ( not ( = ?auto_400609 ?auto_400613 ) ) ( not ( = ?auto_400609 ?auto_400614 ) ) ( not ( = ?auto_400609 ?auto_400615 ) ) ( not ( = ?auto_400609 ?auto_400616 ) ) ( not ( = ?auto_400609 ?auto_400617 ) ) ( not ( = ?auto_400609 ?auto_400618 ) ) ( not ( = ?auto_400610 ?auto_400611 ) ) ( not ( = ?auto_400610 ?auto_400612 ) ) ( not ( = ?auto_400610 ?auto_400613 ) ) ( not ( = ?auto_400610 ?auto_400614 ) ) ( not ( = ?auto_400610 ?auto_400615 ) ) ( not ( = ?auto_400610 ?auto_400616 ) ) ( not ( = ?auto_400610 ?auto_400617 ) ) ( not ( = ?auto_400610 ?auto_400618 ) ) ( not ( = ?auto_400611 ?auto_400612 ) ) ( not ( = ?auto_400611 ?auto_400613 ) ) ( not ( = ?auto_400611 ?auto_400614 ) ) ( not ( = ?auto_400611 ?auto_400615 ) ) ( not ( = ?auto_400611 ?auto_400616 ) ) ( not ( = ?auto_400611 ?auto_400617 ) ) ( not ( = ?auto_400611 ?auto_400618 ) ) ( not ( = ?auto_400612 ?auto_400613 ) ) ( not ( = ?auto_400612 ?auto_400614 ) ) ( not ( = ?auto_400612 ?auto_400615 ) ) ( not ( = ?auto_400612 ?auto_400616 ) ) ( not ( = ?auto_400612 ?auto_400617 ) ) ( not ( = ?auto_400612 ?auto_400618 ) ) ( not ( = ?auto_400613 ?auto_400614 ) ) ( not ( = ?auto_400613 ?auto_400615 ) ) ( not ( = ?auto_400613 ?auto_400616 ) ) ( not ( = ?auto_400613 ?auto_400617 ) ) ( not ( = ?auto_400613 ?auto_400618 ) ) ( not ( = ?auto_400614 ?auto_400615 ) ) ( not ( = ?auto_400614 ?auto_400616 ) ) ( not ( = ?auto_400614 ?auto_400617 ) ) ( not ( = ?auto_400614 ?auto_400618 ) ) ( not ( = ?auto_400615 ?auto_400616 ) ) ( not ( = ?auto_400615 ?auto_400617 ) ) ( not ( = ?auto_400615 ?auto_400618 ) ) ( not ( = ?auto_400616 ?auto_400617 ) ) ( not ( = ?auto_400616 ?auto_400618 ) ) ( not ( = ?auto_400617 ?auto_400618 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_400617 ?auto_400618 )
      ( !STACK ?auto_400617 ?auto_400616 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_400662 - BLOCK
      ?auto_400663 - BLOCK
      ?auto_400664 - BLOCK
      ?auto_400665 - BLOCK
      ?auto_400666 - BLOCK
      ?auto_400667 - BLOCK
      ?auto_400668 - BLOCK
      ?auto_400669 - BLOCK
      ?auto_400670 - BLOCK
      ?auto_400671 - BLOCK
      ?auto_400672 - BLOCK
      ?auto_400673 - BLOCK
      ?auto_400674 - BLOCK
      ?auto_400675 - BLOCK
    )
    :vars
    (
      ?auto_400676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400675 ?auto_400676 ) ( ON-TABLE ?auto_400662 ) ( ON ?auto_400663 ?auto_400662 ) ( ON ?auto_400664 ?auto_400663 ) ( ON ?auto_400665 ?auto_400664 ) ( ON ?auto_400666 ?auto_400665 ) ( ON ?auto_400667 ?auto_400666 ) ( ON ?auto_400668 ?auto_400667 ) ( ON ?auto_400669 ?auto_400668 ) ( ON ?auto_400670 ?auto_400669 ) ( ON ?auto_400671 ?auto_400670 ) ( ON ?auto_400672 ?auto_400671 ) ( ON ?auto_400673 ?auto_400672 ) ( not ( = ?auto_400662 ?auto_400663 ) ) ( not ( = ?auto_400662 ?auto_400664 ) ) ( not ( = ?auto_400662 ?auto_400665 ) ) ( not ( = ?auto_400662 ?auto_400666 ) ) ( not ( = ?auto_400662 ?auto_400667 ) ) ( not ( = ?auto_400662 ?auto_400668 ) ) ( not ( = ?auto_400662 ?auto_400669 ) ) ( not ( = ?auto_400662 ?auto_400670 ) ) ( not ( = ?auto_400662 ?auto_400671 ) ) ( not ( = ?auto_400662 ?auto_400672 ) ) ( not ( = ?auto_400662 ?auto_400673 ) ) ( not ( = ?auto_400662 ?auto_400674 ) ) ( not ( = ?auto_400662 ?auto_400675 ) ) ( not ( = ?auto_400662 ?auto_400676 ) ) ( not ( = ?auto_400663 ?auto_400664 ) ) ( not ( = ?auto_400663 ?auto_400665 ) ) ( not ( = ?auto_400663 ?auto_400666 ) ) ( not ( = ?auto_400663 ?auto_400667 ) ) ( not ( = ?auto_400663 ?auto_400668 ) ) ( not ( = ?auto_400663 ?auto_400669 ) ) ( not ( = ?auto_400663 ?auto_400670 ) ) ( not ( = ?auto_400663 ?auto_400671 ) ) ( not ( = ?auto_400663 ?auto_400672 ) ) ( not ( = ?auto_400663 ?auto_400673 ) ) ( not ( = ?auto_400663 ?auto_400674 ) ) ( not ( = ?auto_400663 ?auto_400675 ) ) ( not ( = ?auto_400663 ?auto_400676 ) ) ( not ( = ?auto_400664 ?auto_400665 ) ) ( not ( = ?auto_400664 ?auto_400666 ) ) ( not ( = ?auto_400664 ?auto_400667 ) ) ( not ( = ?auto_400664 ?auto_400668 ) ) ( not ( = ?auto_400664 ?auto_400669 ) ) ( not ( = ?auto_400664 ?auto_400670 ) ) ( not ( = ?auto_400664 ?auto_400671 ) ) ( not ( = ?auto_400664 ?auto_400672 ) ) ( not ( = ?auto_400664 ?auto_400673 ) ) ( not ( = ?auto_400664 ?auto_400674 ) ) ( not ( = ?auto_400664 ?auto_400675 ) ) ( not ( = ?auto_400664 ?auto_400676 ) ) ( not ( = ?auto_400665 ?auto_400666 ) ) ( not ( = ?auto_400665 ?auto_400667 ) ) ( not ( = ?auto_400665 ?auto_400668 ) ) ( not ( = ?auto_400665 ?auto_400669 ) ) ( not ( = ?auto_400665 ?auto_400670 ) ) ( not ( = ?auto_400665 ?auto_400671 ) ) ( not ( = ?auto_400665 ?auto_400672 ) ) ( not ( = ?auto_400665 ?auto_400673 ) ) ( not ( = ?auto_400665 ?auto_400674 ) ) ( not ( = ?auto_400665 ?auto_400675 ) ) ( not ( = ?auto_400665 ?auto_400676 ) ) ( not ( = ?auto_400666 ?auto_400667 ) ) ( not ( = ?auto_400666 ?auto_400668 ) ) ( not ( = ?auto_400666 ?auto_400669 ) ) ( not ( = ?auto_400666 ?auto_400670 ) ) ( not ( = ?auto_400666 ?auto_400671 ) ) ( not ( = ?auto_400666 ?auto_400672 ) ) ( not ( = ?auto_400666 ?auto_400673 ) ) ( not ( = ?auto_400666 ?auto_400674 ) ) ( not ( = ?auto_400666 ?auto_400675 ) ) ( not ( = ?auto_400666 ?auto_400676 ) ) ( not ( = ?auto_400667 ?auto_400668 ) ) ( not ( = ?auto_400667 ?auto_400669 ) ) ( not ( = ?auto_400667 ?auto_400670 ) ) ( not ( = ?auto_400667 ?auto_400671 ) ) ( not ( = ?auto_400667 ?auto_400672 ) ) ( not ( = ?auto_400667 ?auto_400673 ) ) ( not ( = ?auto_400667 ?auto_400674 ) ) ( not ( = ?auto_400667 ?auto_400675 ) ) ( not ( = ?auto_400667 ?auto_400676 ) ) ( not ( = ?auto_400668 ?auto_400669 ) ) ( not ( = ?auto_400668 ?auto_400670 ) ) ( not ( = ?auto_400668 ?auto_400671 ) ) ( not ( = ?auto_400668 ?auto_400672 ) ) ( not ( = ?auto_400668 ?auto_400673 ) ) ( not ( = ?auto_400668 ?auto_400674 ) ) ( not ( = ?auto_400668 ?auto_400675 ) ) ( not ( = ?auto_400668 ?auto_400676 ) ) ( not ( = ?auto_400669 ?auto_400670 ) ) ( not ( = ?auto_400669 ?auto_400671 ) ) ( not ( = ?auto_400669 ?auto_400672 ) ) ( not ( = ?auto_400669 ?auto_400673 ) ) ( not ( = ?auto_400669 ?auto_400674 ) ) ( not ( = ?auto_400669 ?auto_400675 ) ) ( not ( = ?auto_400669 ?auto_400676 ) ) ( not ( = ?auto_400670 ?auto_400671 ) ) ( not ( = ?auto_400670 ?auto_400672 ) ) ( not ( = ?auto_400670 ?auto_400673 ) ) ( not ( = ?auto_400670 ?auto_400674 ) ) ( not ( = ?auto_400670 ?auto_400675 ) ) ( not ( = ?auto_400670 ?auto_400676 ) ) ( not ( = ?auto_400671 ?auto_400672 ) ) ( not ( = ?auto_400671 ?auto_400673 ) ) ( not ( = ?auto_400671 ?auto_400674 ) ) ( not ( = ?auto_400671 ?auto_400675 ) ) ( not ( = ?auto_400671 ?auto_400676 ) ) ( not ( = ?auto_400672 ?auto_400673 ) ) ( not ( = ?auto_400672 ?auto_400674 ) ) ( not ( = ?auto_400672 ?auto_400675 ) ) ( not ( = ?auto_400672 ?auto_400676 ) ) ( not ( = ?auto_400673 ?auto_400674 ) ) ( not ( = ?auto_400673 ?auto_400675 ) ) ( not ( = ?auto_400673 ?auto_400676 ) ) ( not ( = ?auto_400674 ?auto_400675 ) ) ( not ( = ?auto_400674 ?auto_400676 ) ) ( not ( = ?auto_400675 ?auto_400676 ) ) ( CLEAR ?auto_400673 ) ( ON ?auto_400674 ?auto_400675 ) ( CLEAR ?auto_400674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_400662 ?auto_400663 ?auto_400664 ?auto_400665 ?auto_400666 ?auto_400667 ?auto_400668 ?auto_400669 ?auto_400670 ?auto_400671 ?auto_400672 ?auto_400673 ?auto_400674 )
      ( MAKE-14PILE ?auto_400662 ?auto_400663 ?auto_400664 ?auto_400665 ?auto_400666 ?auto_400667 ?auto_400668 ?auto_400669 ?auto_400670 ?auto_400671 ?auto_400672 ?auto_400673 ?auto_400674 ?auto_400675 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_400720 - BLOCK
      ?auto_400721 - BLOCK
      ?auto_400722 - BLOCK
      ?auto_400723 - BLOCK
      ?auto_400724 - BLOCK
      ?auto_400725 - BLOCK
      ?auto_400726 - BLOCK
      ?auto_400727 - BLOCK
      ?auto_400728 - BLOCK
      ?auto_400729 - BLOCK
      ?auto_400730 - BLOCK
      ?auto_400731 - BLOCK
      ?auto_400732 - BLOCK
      ?auto_400733 - BLOCK
    )
    :vars
    (
      ?auto_400734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400733 ?auto_400734 ) ( ON-TABLE ?auto_400720 ) ( ON ?auto_400721 ?auto_400720 ) ( ON ?auto_400722 ?auto_400721 ) ( ON ?auto_400723 ?auto_400722 ) ( ON ?auto_400724 ?auto_400723 ) ( ON ?auto_400725 ?auto_400724 ) ( ON ?auto_400726 ?auto_400725 ) ( ON ?auto_400727 ?auto_400726 ) ( ON ?auto_400728 ?auto_400727 ) ( ON ?auto_400729 ?auto_400728 ) ( ON ?auto_400730 ?auto_400729 ) ( not ( = ?auto_400720 ?auto_400721 ) ) ( not ( = ?auto_400720 ?auto_400722 ) ) ( not ( = ?auto_400720 ?auto_400723 ) ) ( not ( = ?auto_400720 ?auto_400724 ) ) ( not ( = ?auto_400720 ?auto_400725 ) ) ( not ( = ?auto_400720 ?auto_400726 ) ) ( not ( = ?auto_400720 ?auto_400727 ) ) ( not ( = ?auto_400720 ?auto_400728 ) ) ( not ( = ?auto_400720 ?auto_400729 ) ) ( not ( = ?auto_400720 ?auto_400730 ) ) ( not ( = ?auto_400720 ?auto_400731 ) ) ( not ( = ?auto_400720 ?auto_400732 ) ) ( not ( = ?auto_400720 ?auto_400733 ) ) ( not ( = ?auto_400720 ?auto_400734 ) ) ( not ( = ?auto_400721 ?auto_400722 ) ) ( not ( = ?auto_400721 ?auto_400723 ) ) ( not ( = ?auto_400721 ?auto_400724 ) ) ( not ( = ?auto_400721 ?auto_400725 ) ) ( not ( = ?auto_400721 ?auto_400726 ) ) ( not ( = ?auto_400721 ?auto_400727 ) ) ( not ( = ?auto_400721 ?auto_400728 ) ) ( not ( = ?auto_400721 ?auto_400729 ) ) ( not ( = ?auto_400721 ?auto_400730 ) ) ( not ( = ?auto_400721 ?auto_400731 ) ) ( not ( = ?auto_400721 ?auto_400732 ) ) ( not ( = ?auto_400721 ?auto_400733 ) ) ( not ( = ?auto_400721 ?auto_400734 ) ) ( not ( = ?auto_400722 ?auto_400723 ) ) ( not ( = ?auto_400722 ?auto_400724 ) ) ( not ( = ?auto_400722 ?auto_400725 ) ) ( not ( = ?auto_400722 ?auto_400726 ) ) ( not ( = ?auto_400722 ?auto_400727 ) ) ( not ( = ?auto_400722 ?auto_400728 ) ) ( not ( = ?auto_400722 ?auto_400729 ) ) ( not ( = ?auto_400722 ?auto_400730 ) ) ( not ( = ?auto_400722 ?auto_400731 ) ) ( not ( = ?auto_400722 ?auto_400732 ) ) ( not ( = ?auto_400722 ?auto_400733 ) ) ( not ( = ?auto_400722 ?auto_400734 ) ) ( not ( = ?auto_400723 ?auto_400724 ) ) ( not ( = ?auto_400723 ?auto_400725 ) ) ( not ( = ?auto_400723 ?auto_400726 ) ) ( not ( = ?auto_400723 ?auto_400727 ) ) ( not ( = ?auto_400723 ?auto_400728 ) ) ( not ( = ?auto_400723 ?auto_400729 ) ) ( not ( = ?auto_400723 ?auto_400730 ) ) ( not ( = ?auto_400723 ?auto_400731 ) ) ( not ( = ?auto_400723 ?auto_400732 ) ) ( not ( = ?auto_400723 ?auto_400733 ) ) ( not ( = ?auto_400723 ?auto_400734 ) ) ( not ( = ?auto_400724 ?auto_400725 ) ) ( not ( = ?auto_400724 ?auto_400726 ) ) ( not ( = ?auto_400724 ?auto_400727 ) ) ( not ( = ?auto_400724 ?auto_400728 ) ) ( not ( = ?auto_400724 ?auto_400729 ) ) ( not ( = ?auto_400724 ?auto_400730 ) ) ( not ( = ?auto_400724 ?auto_400731 ) ) ( not ( = ?auto_400724 ?auto_400732 ) ) ( not ( = ?auto_400724 ?auto_400733 ) ) ( not ( = ?auto_400724 ?auto_400734 ) ) ( not ( = ?auto_400725 ?auto_400726 ) ) ( not ( = ?auto_400725 ?auto_400727 ) ) ( not ( = ?auto_400725 ?auto_400728 ) ) ( not ( = ?auto_400725 ?auto_400729 ) ) ( not ( = ?auto_400725 ?auto_400730 ) ) ( not ( = ?auto_400725 ?auto_400731 ) ) ( not ( = ?auto_400725 ?auto_400732 ) ) ( not ( = ?auto_400725 ?auto_400733 ) ) ( not ( = ?auto_400725 ?auto_400734 ) ) ( not ( = ?auto_400726 ?auto_400727 ) ) ( not ( = ?auto_400726 ?auto_400728 ) ) ( not ( = ?auto_400726 ?auto_400729 ) ) ( not ( = ?auto_400726 ?auto_400730 ) ) ( not ( = ?auto_400726 ?auto_400731 ) ) ( not ( = ?auto_400726 ?auto_400732 ) ) ( not ( = ?auto_400726 ?auto_400733 ) ) ( not ( = ?auto_400726 ?auto_400734 ) ) ( not ( = ?auto_400727 ?auto_400728 ) ) ( not ( = ?auto_400727 ?auto_400729 ) ) ( not ( = ?auto_400727 ?auto_400730 ) ) ( not ( = ?auto_400727 ?auto_400731 ) ) ( not ( = ?auto_400727 ?auto_400732 ) ) ( not ( = ?auto_400727 ?auto_400733 ) ) ( not ( = ?auto_400727 ?auto_400734 ) ) ( not ( = ?auto_400728 ?auto_400729 ) ) ( not ( = ?auto_400728 ?auto_400730 ) ) ( not ( = ?auto_400728 ?auto_400731 ) ) ( not ( = ?auto_400728 ?auto_400732 ) ) ( not ( = ?auto_400728 ?auto_400733 ) ) ( not ( = ?auto_400728 ?auto_400734 ) ) ( not ( = ?auto_400729 ?auto_400730 ) ) ( not ( = ?auto_400729 ?auto_400731 ) ) ( not ( = ?auto_400729 ?auto_400732 ) ) ( not ( = ?auto_400729 ?auto_400733 ) ) ( not ( = ?auto_400729 ?auto_400734 ) ) ( not ( = ?auto_400730 ?auto_400731 ) ) ( not ( = ?auto_400730 ?auto_400732 ) ) ( not ( = ?auto_400730 ?auto_400733 ) ) ( not ( = ?auto_400730 ?auto_400734 ) ) ( not ( = ?auto_400731 ?auto_400732 ) ) ( not ( = ?auto_400731 ?auto_400733 ) ) ( not ( = ?auto_400731 ?auto_400734 ) ) ( not ( = ?auto_400732 ?auto_400733 ) ) ( not ( = ?auto_400732 ?auto_400734 ) ) ( not ( = ?auto_400733 ?auto_400734 ) ) ( ON ?auto_400732 ?auto_400733 ) ( CLEAR ?auto_400730 ) ( ON ?auto_400731 ?auto_400732 ) ( CLEAR ?auto_400731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_400720 ?auto_400721 ?auto_400722 ?auto_400723 ?auto_400724 ?auto_400725 ?auto_400726 ?auto_400727 ?auto_400728 ?auto_400729 ?auto_400730 ?auto_400731 )
      ( MAKE-14PILE ?auto_400720 ?auto_400721 ?auto_400722 ?auto_400723 ?auto_400724 ?auto_400725 ?auto_400726 ?auto_400727 ?auto_400728 ?auto_400729 ?auto_400730 ?auto_400731 ?auto_400732 ?auto_400733 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_400778 - BLOCK
      ?auto_400779 - BLOCK
      ?auto_400780 - BLOCK
      ?auto_400781 - BLOCK
      ?auto_400782 - BLOCK
      ?auto_400783 - BLOCK
      ?auto_400784 - BLOCK
      ?auto_400785 - BLOCK
      ?auto_400786 - BLOCK
      ?auto_400787 - BLOCK
      ?auto_400788 - BLOCK
      ?auto_400789 - BLOCK
      ?auto_400790 - BLOCK
      ?auto_400791 - BLOCK
    )
    :vars
    (
      ?auto_400792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400791 ?auto_400792 ) ( ON-TABLE ?auto_400778 ) ( ON ?auto_400779 ?auto_400778 ) ( ON ?auto_400780 ?auto_400779 ) ( ON ?auto_400781 ?auto_400780 ) ( ON ?auto_400782 ?auto_400781 ) ( ON ?auto_400783 ?auto_400782 ) ( ON ?auto_400784 ?auto_400783 ) ( ON ?auto_400785 ?auto_400784 ) ( ON ?auto_400786 ?auto_400785 ) ( ON ?auto_400787 ?auto_400786 ) ( not ( = ?auto_400778 ?auto_400779 ) ) ( not ( = ?auto_400778 ?auto_400780 ) ) ( not ( = ?auto_400778 ?auto_400781 ) ) ( not ( = ?auto_400778 ?auto_400782 ) ) ( not ( = ?auto_400778 ?auto_400783 ) ) ( not ( = ?auto_400778 ?auto_400784 ) ) ( not ( = ?auto_400778 ?auto_400785 ) ) ( not ( = ?auto_400778 ?auto_400786 ) ) ( not ( = ?auto_400778 ?auto_400787 ) ) ( not ( = ?auto_400778 ?auto_400788 ) ) ( not ( = ?auto_400778 ?auto_400789 ) ) ( not ( = ?auto_400778 ?auto_400790 ) ) ( not ( = ?auto_400778 ?auto_400791 ) ) ( not ( = ?auto_400778 ?auto_400792 ) ) ( not ( = ?auto_400779 ?auto_400780 ) ) ( not ( = ?auto_400779 ?auto_400781 ) ) ( not ( = ?auto_400779 ?auto_400782 ) ) ( not ( = ?auto_400779 ?auto_400783 ) ) ( not ( = ?auto_400779 ?auto_400784 ) ) ( not ( = ?auto_400779 ?auto_400785 ) ) ( not ( = ?auto_400779 ?auto_400786 ) ) ( not ( = ?auto_400779 ?auto_400787 ) ) ( not ( = ?auto_400779 ?auto_400788 ) ) ( not ( = ?auto_400779 ?auto_400789 ) ) ( not ( = ?auto_400779 ?auto_400790 ) ) ( not ( = ?auto_400779 ?auto_400791 ) ) ( not ( = ?auto_400779 ?auto_400792 ) ) ( not ( = ?auto_400780 ?auto_400781 ) ) ( not ( = ?auto_400780 ?auto_400782 ) ) ( not ( = ?auto_400780 ?auto_400783 ) ) ( not ( = ?auto_400780 ?auto_400784 ) ) ( not ( = ?auto_400780 ?auto_400785 ) ) ( not ( = ?auto_400780 ?auto_400786 ) ) ( not ( = ?auto_400780 ?auto_400787 ) ) ( not ( = ?auto_400780 ?auto_400788 ) ) ( not ( = ?auto_400780 ?auto_400789 ) ) ( not ( = ?auto_400780 ?auto_400790 ) ) ( not ( = ?auto_400780 ?auto_400791 ) ) ( not ( = ?auto_400780 ?auto_400792 ) ) ( not ( = ?auto_400781 ?auto_400782 ) ) ( not ( = ?auto_400781 ?auto_400783 ) ) ( not ( = ?auto_400781 ?auto_400784 ) ) ( not ( = ?auto_400781 ?auto_400785 ) ) ( not ( = ?auto_400781 ?auto_400786 ) ) ( not ( = ?auto_400781 ?auto_400787 ) ) ( not ( = ?auto_400781 ?auto_400788 ) ) ( not ( = ?auto_400781 ?auto_400789 ) ) ( not ( = ?auto_400781 ?auto_400790 ) ) ( not ( = ?auto_400781 ?auto_400791 ) ) ( not ( = ?auto_400781 ?auto_400792 ) ) ( not ( = ?auto_400782 ?auto_400783 ) ) ( not ( = ?auto_400782 ?auto_400784 ) ) ( not ( = ?auto_400782 ?auto_400785 ) ) ( not ( = ?auto_400782 ?auto_400786 ) ) ( not ( = ?auto_400782 ?auto_400787 ) ) ( not ( = ?auto_400782 ?auto_400788 ) ) ( not ( = ?auto_400782 ?auto_400789 ) ) ( not ( = ?auto_400782 ?auto_400790 ) ) ( not ( = ?auto_400782 ?auto_400791 ) ) ( not ( = ?auto_400782 ?auto_400792 ) ) ( not ( = ?auto_400783 ?auto_400784 ) ) ( not ( = ?auto_400783 ?auto_400785 ) ) ( not ( = ?auto_400783 ?auto_400786 ) ) ( not ( = ?auto_400783 ?auto_400787 ) ) ( not ( = ?auto_400783 ?auto_400788 ) ) ( not ( = ?auto_400783 ?auto_400789 ) ) ( not ( = ?auto_400783 ?auto_400790 ) ) ( not ( = ?auto_400783 ?auto_400791 ) ) ( not ( = ?auto_400783 ?auto_400792 ) ) ( not ( = ?auto_400784 ?auto_400785 ) ) ( not ( = ?auto_400784 ?auto_400786 ) ) ( not ( = ?auto_400784 ?auto_400787 ) ) ( not ( = ?auto_400784 ?auto_400788 ) ) ( not ( = ?auto_400784 ?auto_400789 ) ) ( not ( = ?auto_400784 ?auto_400790 ) ) ( not ( = ?auto_400784 ?auto_400791 ) ) ( not ( = ?auto_400784 ?auto_400792 ) ) ( not ( = ?auto_400785 ?auto_400786 ) ) ( not ( = ?auto_400785 ?auto_400787 ) ) ( not ( = ?auto_400785 ?auto_400788 ) ) ( not ( = ?auto_400785 ?auto_400789 ) ) ( not ( = ?auto_400785 ?auto_400790 ) ) ( not ( = ?auto_400785 ?auto_400791 ) ) ( not ( = ?auto_400785 ?auto_400792 ) ) ( not ( = ?auto_400786 ?auto_400787 ) ) ( not ( = ?auto_400786 ?auto_400788 ) ) ( not ( = ?auto_400786 ?auto_400789 ) ) ( not ( = ?auto_400786 ?auto_400790 ) ) ( not ( = ?auto_400786 ?auto_400791 ) ) ( not ( = ?auto_400786 ?auto_400792 ) ) ( not ( = ?auto_400787 ?auto_400788 ) ) ( not ( = ?auto_400787 ?auto_400789 ) ) ( not ( = ?auto_400787 ?auto_400790 ) ) ( not ( = ?auto_400787 ?auto_400791 ) ) ( not ( = ?auto_400787 ?auto_400792 ) ) ( not ( = ?auto_400788 ?auto_400789 ) ) ( not ( = ?auto_400788 ?auto_400790 ) ) ( not ( = ?auto_400788 ?auto_400791 ) ) ( not ( = ?auto_400788 ?auto_400792 ) ) ( not ( = ?auto_400789 ?auto_400790 ) ) ( not ( = ?auto_400789 ?auto_400791 ) ) ( not ( = ?auto_400789 ?auto_400792 ) ) ( not ( = ?auto_400790 ?auto_400791 ) ) ( not ( = ?auto_400790 ?auto_400792 ) ) ( not ( = ?auto_400791 ?auto_400792 ) ) ( ON ?auto_400790 ?auto_400791 ) ( ON ?auto_400789 ?auto_400790 ) ( CLEAR ?auto_400787 ) ( ON ?auto_400788 ?auto_400789 ) ( CLEAR ?auto_400788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_400778 ?auto_400779 ?auto_400780 ?auto_400781 ?auto_400782 ?auto_400783 ?auto_400784 ?auto_400785 ?auto_400786 ?auto_400787 ?auto_400788 )
      ( MAKE-14PILE ?auto_400778 ?auto_400779 ?auto_400780 ?auto_400781 ?auto_400782 ?auto_400783 ?auto_400784 ?auto_400785 ?auto_400786 ?auto_400787 ?auto_400788 ?auto_400789 ?auto_400790 ?auto_400791 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_400836 - BLOCK
      ?auto_400837 - BLOCK
      ?auto_400838 - BLOCK
      ?auto_400839 - BLOCK
      ?auto_400840 - BLOCK
      ?auto_400841 - BLOCK
      ?auto_400842 - BLOCK
      ?auto_400843 - BLOCK
      ?auto_400844 - BLOCK
      ?auto_400845 - BLOCK
      ?auto_400846 - BLOCK
      ?auto_400847 - BLOCK
      ?auto_400848 - BLOCK
      ?auto_400849 - BLOCK
    )
    :vars
    (
      ?auto_400850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400849 ?auto_400850 ) ( ON-TABLE ?auto_400836 ) ( ON ?auto_400837 ?auto_400836 ) ( ON ?auto_400838 ?auto_400837 ) ( ON ?auto_400839 ?auto_400838 ) ( ON ?auto_400840 ?auto_400839 ) ( ON ?auto_400841 ?auto_400840 ) ( ON ?auto_400842 ?auto_400841 ) ( ON ?auto_400843 ?auto_400842 ) ( ON ?auto_400844 ?auto_400843 ) ( not ( = ?auto_400836 ?auto_400837 ) ) ( not ( = ?auto_400836 ?auto_400838 ) ) ( not ( = ?auto_400836 ?auto_400839 ) ) ( not ( = ?auto_400836 ?auto_400840 ) ) ( not ( = ?auto_400836 ?auto_400841 ) ) ( not ( = ?auto_400836 ?auto_400842 ) ) ( not ( = ?auto_400836 ?auto_400843 ) ) ( not ( = ?auto_400836 ?auto_400844 ) ) ( not ( = ?auto_400836 ?auto_400845 ) ) ( not ( = ?auto_400836 ?auto_400846 ) ) ( not ( = ?auto_400836 ?auto_400847 ) ) ( not ( = ?auto_400836 ?auto_400848 ) ) ( not ( = ?auto_400836 ?auto_400849 ) ) ( not ( = ?auto_400836 ?auto_400850 ) ) ( not ( = ?auto_400837 ?auto_400838 ) ) ( not ( = ?auto_400837 ?auto_400839 ) ) ( not ( = ?auto_400837 ?auto_400840 ) ) ( not ( = ?auto_400837 ?auto_400841 ) ) ( not ( = ?auto_400837 ?auto_400842 ) ) ( not ( = ?auto_400837 ?auto_400843 ) ) ( not ( = ?auto_400837 ?auto_400844 ) ) ( not ( = ?auto_400837 ?auto_400845 ) ) ( not ( = ?auto_400837 ?auto_400846 ) ) ( not ( = ?auto_400837 ?auto_400847 ) ) ( not ( = ?auto_400837 ?auto_400848 ) ) ( not ( = ?auto_400837 ?auto_400849 ) ) ( not ( = ?auto_400837 ?auto_400850 ) ) ( not ( = ?auto_400838 ?auto_400839 ) ) ( not ( = ?auto_400838 ?auto_400840 ) ) ( not ( = ?auto_400838 ?auto_400841 ) ) ( not ( = ?auto_400838 ?auto_400842 ) ) ( not ( = ?auto_400838 ?auto_400843 ) ) ( not ( = ?auto_400838 ?auto_400844 ) ) ( not ( = ?auto_400838 ?auto_400845 ) ) ( not ( = ?auto_400838 ?auto_400846 ) ) ( not ( = ?auto_400838 ?auto_400847 ) ) ( not ( = ?auto_400838 ?auto_400848 ) ) ( not ( = ?auto_400838 ?auto_400849 ) ) ( not ( = ?auto_400838 ?auto_400850 ) ) ( not ( = ?auto_400839 ?auto_400840 ) ) ( not ( = ?auto_400839 ?auto_400841 ) ) ( not ( = ?auto_400839 ?auto_400842 ) ) ( not ( = ?auto_400839 ?auto_400843 ) ) ( not ( = ?auto_400839 ?auto_400844 ) ) ( not ( = ?auto_400839 ?auto_400845 ) ) ( not ( = ?auto_400839 ?auto_400846 ) ) ( not ( = ?auto_400839 ?auto_400847 ) ) ( not ( = ?auto_400839 ?auto_400848 ) ) ( not ( = ?auto_400839 ?auto_400849 ) ) ( not ( = ?auto_400839 ?auto_400850 ) ) ( not ( = ?auto_400840 ?auto_400841 ) ) ( not ( = ?auto_400840 ?auto_400842 ) ) ( not ( = ?auto_400840 ?auto_400843 ) ) ( not ( = ?auto_400840 ?auto_400844 ) ) ( not ( = ?auto_400840 ?auto_400845 ) ) ( not ( = ?auto_400840 ?auto_400846 ) ) ( not ( = ?auto_400840 ?auto_400847 ) ) ( not ( = ?auto_400840 ?auto_400848 ) ) ( not ( = ?auto_400840 ?auto_400849 ) ) ( not ( = ?auto_400840 ?auto_400850 ) ) ( not ( = ?auto_400841 ?auto_400842 ) ) ( not ( = ?auto_400841 ?auto_400843 ) ) ( not ( = ?auto_400841 ?auto_400844 ) ) ( not ( = ?auto_400841 ?auto_400845 ) ) ( not ( = ?auto_400841 ?auto_400846 ) ) ( not ( = ?auto_400841 ?auto_400847 ) ) ( not ( = ?auto_400841 ?auto_400848 ) ) ( not ( = ?auto_400841 ?auto_400849 ) ) ( not ( = ?auto_400841 ?auto_400850 ) ) ( not ( = ?auto_400842 ?auto_400843 ) ) ( not ( = ?auto_400842 ?auto_400844 ) ) ( not ( = ?auto_400842 ?auto_400845 ) ) ( not ( = ?auto_400842 ?auto_400846 ) ) ( not ( = ?auto_400842 ?auto_400847 ) ) ( not ( = ?auto_400842 ?auto_400848 ) ) ( not ( = ?auto_400842 ?auto_400849 ) ) ( not ( = ?auto_400842 ?auto_400850 ) ) ( not ( = ?auto_400843 ?auto_400844 ) ) ( not ( = ?auto_400843 ?auto_400845 ) ) ( not ( = ?auto_400843 ?auto_400846 ) ) ( not ( = ?auto_400843 ?auto_400847 ) ) ( not ( = ?auto_400843 ?auto_400848 ) ) ( not ( = ?auto_400843 ?auto_400849 ) ) ( not ( = ?auto_400843 ?auto_400850 ) ) ( not ( = ?auto_400844 ?auto_400845 ) ) ( not ( = ?auto_400844 ?auto_400846 ) ) ( not ( = ?auto_400844 ?auto_400847 ) ) ( not ( = ?auto_400844 ?auto_400848 ) ) ( not ( = ?auto_400844 ?auto_400849 ) ) ( not ( = ?auto_400844 ?auto_400850 ) ) ( not ( = ?auto_400845 ?auto_400846 ) ) ( not ( = ?auto_400845 ?auto_400847 ) ) ( not ( = ?auto_400845 ?auto_400848 ) ) ( not ( = ?auto_400845 ?auto_400849 ) ) ( not ( = ?auto_400845 ?auto_400850 ) ) ( not ( = ?auto_400846 ?auto_400847 ) ) ( not ( = ?auto_400846 ?auto_400848 ) ) ( not ( = ?auto_400846 ?auto_400849 ) ) ( not ( = ?auto_400846 ?auto_400850 ) ) ( not ( = ?auto_400847 ?auto_400848 ) ) ( not ( = ?auto_400847 ?auto_400849 ) ) ( not ( = ?auto_400847 ?auto_400850 ) ) ( not ( = ?auto_400848 ?auto_400849 ) ) ( not ( = ?auto_400848 ?auto_400850 ) ) ( not ( = ?auto_400849 ?auto_400850 ) ) ( ON ?auto_400848 ?auto_400849 ) ( ON ?auto_400847 ?auto_400848 ) ( ON ?auto_400846 ?auto_400847 ) ( CLEAR ?auto_400844 ) ( ON ?auto_400845 ?auto_400846 ) ( CLEAR ?auto_400845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_400836 ?auto_400837 ?auto_400838 ?auto_400839 ?auto_400840 ?auto_400841 ?auto_400842 ?auto_400843 ?auto_400844 ?auto_400845 )
      ( MAKE-14PILE ?auto_400836 ?auto_400837 ?auto_400838 ?auto_400839 ?auto_400840 ?auto_400841 ?auto_400842 ?auto_400843 ?auto_400844 ?auto_400845 ?auto_400846 ?auto_400847 ?auto_400848 ?auto_400849 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_400894 - BLOCK
      ?auto_400895 - BLOCK
      ?auto_400896 - BLOCK
      ?auto_400897 - BLOCK
      ?auto_400898 - BLOCK
      ?auto_400899 - BLOCK
      ?auto_400900 - BLOCK
      ?auto_400901 - BLOCK
      ?auto_400902 - BLOCK
      ?auto_400903 - BLOCK
      ?auto_400904 - BLOCK
      ?auto_400905 - BLOCK
      ?auto_400906 - BLOCK
      ?auto_400907 - BLOCK
    )
    :vars
    (
      ?auto_400908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400907 ?auto_400908 ) ( ON-TABLE ?auto_400894 ) ( ON ?auto_400895 ?auto_400894 ) ( ON ?auto_400896 ?auto_400895 ) ( ON ?auto_400897 ?auto_400896 ) ( ON ?auto_400898 ?auto_400897 ) ( ON ?auto_400899 ?auto_400898 ) ( ON ?auto_400900 ?auto_400899 ) ( ON ?auto_400901 ?auto_400900 ) ( not ( = ?auto_400894 ?auto_400895 ) ) ( not ( = ?auto_400894 ?auto_400896 ) ) ( not ( = ?auto_400894 ?auto_400897 ) ) ( not ( = ?auto_400894 ?auto_400898 ) ) ( not ( = ?auto_400894 ?auto_400899 ) ) ( not ( = ?auto_400894 ?auto_400900 ) ) ( not ( = ?auto_400894 ?auto_400901 ) ) ( not ( = ?auto_400894 ?auto_400902 ) ) ( not ( = ?auto_400894 ?auto_400903 ) ) ( not ( = ?auto_400894 ?auto_400904 ) ) ( not ( = ?auto_400894 ?auto_400905 ) ) ( not ( = ?auto_400894 ?auto_400906 ) ) ( not ( = ?auto_400894 ?auto_400907 ) ) ( not ( = ?auto_400894 ?auto_400908 ) ) ( not ( = ?auto_400895 ?auto_400896 ) ) ( not ( = ?auto_400895 ?auto_400897 ) ) ( not ( = ?auto_400895 ?auto_400898 ) ) ( not ( = ?auto_400895 ?auto_400899 ) ) ( not ( = ?auto_400895 ?auto_400900 ) ) ( not ( = ?auto_400895 ?auto_400901 ) ) ( not ( = ?auto_400895 ?auto_400902 ) ) ( not ( = ?auto_400895 ?auto_400903 ) ) ( not ( = ?auto_400895 ?auto_400904 ) ) ( not ( = ?auto_400895 ?auto_400905 ) ) ( not ( = ?auto_400895 ?auto_400906 ) ) ( not ( = ?auto_400895 ?auto_400907 ) ) ( not ( = ?auto_400895 ?auto_400908 ) ) ( not ( = ?auto_400896 ?auto_400897 ) ) ( not ( = ?auto_400896 ?auto_400898 ) ) ( not ( = ?auto_400896 ?auto_400899 ) ) ( not ( = ?auto_400896 ?auto_400900 ) ) ( not ( = ?auto_400896 ?auto_400901 ) ) ( not ( = ?auto_400896 ?auto_400902 ) ) ( not ( = ?auto_400896 ?auto_400903 ) ) ( not ( = ?auto_400896 ?auto_400904 ) ) ( not ( = ?auto_400896 ?auto_400905 ) ) ( not ( = ?auto_400896 ?auto_400906 ) ) ( not ( = ?auto_400896 ?auto_400907 ) ) ( not ( = ?auto_400896 ?auto_400908 ) ) ( not ( = ?auto_400897 ?auto_400898 ) ) ( not ( = ?auto_400897 ?auto_400899 ) ) ( not ( = ?auto_400897 ?auto_400900 ) ) ( not ( = ?auto_400897 ?auto_400901 ) ) ( not ( = ?auto_400897 ?auto_400902 ) ) ( not ( = ?auto_400897 ?auto_400903 ) ) ( not ( = ?auto_400897 ?auto_400904 ) ) ( not ( = ?auto_400897 ?auto_400905 ) ) ( not ( = ?auto_400897 ?auto_400906 ) ) ( not ( = ?auto_400897 ?auto_400907 ) ) ( not ( = ?auto_400897 ?auto_400908 ) ) ( not ( = ?auto_400898 ?auto_400899 ) ) ( not ( = ?auto_400898 ?auto_400900 ) ) ( not ( = ?auto_400898 ?auto_400901 ) ) ( not ( = ?auto_400898 ?auto_400902 ) ) ( not ( = ?auto_400898 ?auto_400903 ) ) ( not ( = ?auto_400898 ?auto_400904 ) ) ( not ( = ?auto_400898 ?auto_400905 ) ) ( not ( = ?auto_400898 ?auto_400906 ) ) ( not ( = ?auto_400898 ?auto_400907 ) ) ( not ( = ?auto_400898 ?auto_400908 ) ) ( not ( = ?auto_400899 ?auto_400900 ) ) ( not ( = ?auto_400899 ?auto_400901 ) ) ( not ( = ?auto_400899 ?auto_400902 ) ) ( not ( = ?auto_400899 ?auto_400903 ) ) ( not ( = ?auto_400899 ?auto_400904 ) ) ( not ( = ?auto_400899 ?auto_400905 ) ) ( not ( = ?auto_400899 ?auto_400906 ) ) ( not ( = ?auto_400899 ?auto_400907 ) ) ( not ( = ?auto_400899 ?auto_400908 ) ) ( not ( = ?auto_400900 ?auto_400901 ) ) ( not ( = ?auto_400900 ?auto_400902 ) ) ( not ( = ?auto_400900 ?auto_400903 ) ) ( not ( = ?auto_400900 ?auto_400904 ) ) ( not ( = ?auto_400900 ?auto_400905 ) ) ( not ( = ?auto_400900 ?auto_400906 ) ) ( not ( = ?auto_400900 ?auto_400907 ) ) ( not ( = ?auto_400900 ?auto_400908 ) ) ( not ( = ?auto_400901 ?auto_400902 ) ) ( not ( = ?auto_400901 ?auto_400903 ) ) ( not ( = ?auto_400901 ?auto_400904 ) ) ( not ( = ?auto_400901 ?auto_400905 ) ) ( not ( = ?auto_400901 ?auto_400906 ) ) ( not ( = ?auto_400901 ?auto_400907 ) ) ( not ( = ?auto_400901 ?auto_400908 ) ) ( not ( = ?auto_400902 ?auto_400903 ) ) ( not ( = ?auto_400902 ?auto_400904 ) ) ( not ( = ?auto_400902 ?auto_400905 ) ) ( not ( = ?auto_400902 ?auto_400906 ) ) ( not ( = ?auto_400902 ?auto_400907 ) ) ( not ( = ?auto_400902 ?auto_400908 ) ) ( not ( = ?auto_400903 ?auto_400904 ) ) ( not ( = ?auto_400903 ?auto_400905 ) ) ( not ( = ?auto_400903 ?auto_400906 ) ) ( not ( = ?auto_400903 ?auto_400907 ) ) ( not ( = ?auto_400903 ?auto_400908 ) ) ( not ( = ?auto_400904 ?auto_400905 ) ) ( not ( = ?auto_400904 ?auto_400906 ) ) ( not ( = ?auto_400904 ?auto_400907 ) ) ( not ( = ?auto_400904 ?auto_400908 ) ) ( not ( = ?auto_400905 ?auto_400906 ) ) ( not ( = ?auto_400905 ?auto_400907 ) ) ( not ( = ?auto_400905 ?auto_400908 ) ) ( not ( = ?auto_400906 ?auto_400907 ) ) ( not ( = ?auto_400906 ?auto_400908 ) ) ( not ( = ?auto_400907 ?auto_400908 ) ) ( ON ?auto_400906 ?auto_400907 ) ( ON ?auto_400905 ?auto_400906 ) ( ON ?auto_400904 ?auto_400905 ) ( ON ?auto_400903 ?auto_400904 ) ( CLEAR ?auto_400901 ) ( ON ?auto_400902 ?auto_400903 ) ( CLEAR ?auto_400902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_400894 ?auto_400895 ?auto_400896 ?auto_400897 ?auto_400898 ?auto_400899 ?auto_400900 ?auto_400901 ?auto_400902 )
      ( MAKE-14PILE ?auto_400894 ?auto_400895 ?auto_400896 ?auto_400897 ?auto_400898 ?auto_400899 ?auto_400900 ?auto_400901 ?auto_400902 ?auto_400903 ?auto_400904 ?auto_400905 ?auto_400906 ?auto_400907 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_400952 - BLOCK
      ?auto_400953 - BLOCK
      ?auto_400954 - BLOCK
      ?auto_400955 - BLOCK
      ?auto_400956 - BLOCK
      ?auto_400957 - BLOCK
      ?auto_400958 - BLOCK
      ?auto_400959 - BLOCK
      ?auto_400960 - BLOCK
      ?auto_400961 - BLOCK
      ?auto_400962 - BLOCK
      ?auto_400963 - BLOCK
      ?auto_400964 - BLOCK
      ?auto_400965 - BLOCK
    )
    :vars
    (
      ?auto_400966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_400965 ?auto_400966 ) ( ON-TABLE ?auto_400952 ) ( ON ?auto_400953 ?auto_400952 ) ( ON ?auto_400954 ?auto_400953 ) ( ON ?auto_400955 ?auto_400954 ) ( ON ?auto_400956 ?auto_400955 ) ( ON ?auto_400957 ?auto_400956 ) ( ON ?auto_400958 ?auto_400957 ) ( not ( = ?auto_400952 ?auto_400953 ) ) ( not ( = ?auto_400952 ?auto_400954 ) ) ( not ( = ?auto_400952 ?auto_400955 ) ) ( not ( = ?auto_400952 ?auto_400956 ) ) ( not ( = ?auto_400952 ?auto_400957 ) ) ( not ( = ?auto_400952 ?auto_400958 ) ) ( not ( = ?auto_400952 ?auto_400959 ) ) ( not ( = ?auto_400952 ?auto_400960 ) ) ( not ( = ?auto_400952 ?auto_400961 ) ) ( not ( = ?auto_400952 ?auto_400962 ) ) ( not ( = ?auto_400952 ?auto_400963 ) ) ( not ( = ?auto_400952 ?auto_400964 ) ) ( not ( = ?auto_400952 ?auto_400965 ) ) ( not ( = ?auto_400952 ?auto_400966 ) ) ( not ( = ?auto_400953 ?auto_400954 ) ) ( not ( = ?auto_400953 ?auto_400955 ) ) ( not ( = ?auto_400953 ?auto_400956 ) ) ( not ( = ?auto_400953 ?auto_400957 ) ) ( not ( = ?auto_400953 ?auto_400958 ) ) ( not ( = ?auto_400953 ?auto_400959 ) ) ( not ( = ?auto_400953 ?auto_400960 ) ) ( not ( = ?auto_400953 ?auto_400961 ) ) ( not ( = ?auto_400953 ?auto_400962 ) ) ( not ( = ?auto_400953 ?auto_400963 ) ) ( not ( = ?auto_400953 ?auto_400964 ) ) ( not ( = ?auto_400953 ?auto_400965 ) ) ( not ( = ?auto_400953 ?auto_400966 ) ) ( not ( = ?auto_400954 ?auto_400955 ) ) ( not ( = ?auto_400954 ?auto_400956 ) ) ( not ( = ?auto_400954 ?auto_400957 ) ) ( not ( = ?auto_400954 ?auto_400958 ) ) ( not ( = ?auto_400954 ?auto_400959 ) ) ( not ( = ?auto_400954 ?auto_400960 ) ) ( not ( = ?auto_400954 ?auto_400961 ) ) ( not ( = ?auto_400954 ?auto_400962 ) ) ( not ( = ?auto_400954 ?auto_400963 ) ) ( not ( = ?auto_400954 ?auto_400964 ) ) ( not ( = ?auto_400954 ?auto_400965 ) ) ( not ( = ?auto_400954 ?auto_400966 ) ) ( not ( = ?auto_400955 ?auto_400956 ) ) ( not ( = ?auto_400955 ?auto_400957 ) ) ( not ( = ?auto_400955 ?auto_400958 ) ) ( not ( = ?auto_400955 ?auto_400959 ) ) ( not ( = ?auto_400955 ?auto_400960 ) ) ( not ( = ?auto_400955 ?auto_400961 ) ) ( not ( = ?auto_400955 ?auto_400962 ) ) ( not ( = ?auto_400955 ?auto_400963 ) ) ( not ( = ?auto_400955 ?auto_400964 ) ) ( not ( = ?auto_400955 ?auto_400965 ) ) ( not ( = ?auto_400955 ?auto_400966 ) ) ( not ( = ?auto_400956 ?auto_400957 ) ) ( not ( = ?auto_400956 ?auto_400958 ) ) ( not ( = ?auto_400956 ?auto_400959 ) ) ( not ( = ?auto_400956 ?auto_400960 ) ) ( not ( = ?auto_400956 ?auto_400961 ) ) ( not ( = ?auto_400956 ?auto_400962 ) ) ( not ( = ?auto_400956 ?auto_400963 ) ) ( not ( = ?auto_400956 ?auto_400964 ) ) ( not ( = ?auto_400956 ?auto_400965 ) ) ( not ( = ?auto_400956 ?auto_400966 ) ) ( not ( = ?auto_400957 ?auto_400958 ) ) ( not ( = ?auto_400957 ?auto_400959 ) ) ( not ( = ?auto_400957 ?auto_400960 ) ) ( not ( = ?auto_400957 ?auto_400961 ) ) ( not ( = ?auto_400957 ?auto_400962 ) ) ( not ( = ?auto_400957 ?auto_400963 ) ) ( not ( = ?auto_400957 ?auto_400964 ) ) ( not ( = ?auto_400957 ?auto_400965 ) ) ( not ( = ?auto_400957 ?auto_400966 ) ) ( not ( = ?auto_400958 ?auto_400959 ) ) ( not ( = ?auto_400958 ?auto_400960 ) ) ( not ( = ?auto_400958 ?auto_400961 ) ) ( not ( = ?auto_400958 ?auto_400962 ) ) ( not ( = ?auto_400958 ?auto_400963 ) ) ( not ( = ?auto_400958 ?auto_400964 ) ) ( not ( = ?auto_400958 ?auto_400965 ) ) ( not ( = ?auto_400958 ?auto_400966 ) ) ( not ( = ?auto_400959 ?auto_400960 ) ) ( not ( = ?auto_400959 ?auto_400961 ) ) ( not ( = ?auto_400959 ?auto_400962 ) ) ( not ( = ?auto_400959 ?auto_400963 ) ) ( not ( = ?auto_400959 ?auto_400964 ) ) ( not ( = ?auto_400959 ?auto_400965 ) ) ( not ( = ?auto_400959 ?auto_400966 ) ) ( not ( = ?auto_400960 ?auto_400961 ) ) ( not ( = ?auto_400960 ?auto_400962 ) ) ( not ( = ?auto_400960 ?auto_400963 ) ) ( not ( = ?auto_400960 ?auto_400964 ) ) ( not ( = ?auto_400960 ?auto_400965 ) ) ( not ( = ?auto_400960 ?auto_400966 ) ) ( not ( = ?auto_400961 ?auto_400962 ) ) ( not ( = ?auto_400961 ?auto_400963 ) ) ( not ( = ?auto_400961 ?auto_400964 ) ) ( not ( = ?auto_400961 ?auto_400965 ) ) ( not ( = ?auto_400961 ?auto_400966 ) ) ( not ( = ?auto_400962 ?auto_400963 ) ) ( not ( = ?auto_400962 ?auto_400964 ) ) ( not ( = ?auto_400962 ?auto_400965 ) ) ( not ( = ?auto_400962 ?auto_400966 ) ) ( not ( = ?auto_400963 ?auto_400964 ) ) ( not ( = ?auto_400963 ?auto_400965 ) ) ( not ( = ?auto_400963 ?auto_400966 ) ) ( not ( = ?auto_400964 ?auto_400965 ) ) ( not ( = ?auto_400964 ?auto_400966 ) ) ( not ( = ?auto_400965 ?auto_400966 ) ) ( ON ?auto_400964 ?auto_400965 ) ( ON ?auto_400963 ?auto_400964 ) ( ON ?auto_400962 ?auto_400963 ) ( ON ?auto_400961 ?auto_400962 ) ( ON ?auto_400960 ?auto_400961 ) ( CLEAR ?auto_400958 ) ( ON ?auto_400959 ?auto_400960 ) ( CLEAR ?auto_400959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_400952 ?auto_400953 ?auto_400954 ?auto_400955 ?auto_400956 ?auto_400957 ?auto_400958 ?auto_400959 )
      ( MAKE-14PILE ?auto_400952 ?auto_400953 ?auto_400954 ?auto_400955 ?auto_400956 ?auto_400957 ?auto_400958 ?auto_400959 ?auto_400960 ?auto_400961 ?auto_400962 ?auto_400963 ?auto_400964 ?auto_400965 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_401010 - BLOCK
      ?auto_401011 - BLOCK
      ?auto_401012 - BLOCK
      ?auto_401013 - BLOCK
      ?auto_401014 - BLOCK
      ?auto_401015 - BLOCK
      ?auto_401016 - BLOCK
      ?auto_401017 - BLOCK
      ?auto_401018 - BLOCK
      ?auto_401019 - BLOCK
      ?auto_401020 - BLOCK
      ?auto_401021 - BLOCK
      ?auto_401022 - BLOCK
      ?auto_401023 - BLOCK
    )
    :vars
    (
      ?auto_401024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401023 ?auto_401024 ) ( ON-TABLE ?auto_401010 ) ( ON ?auto_401011 ?auto_401010 ) ( ON ?auto_401012 ?auto_401011 ) ( ON ?auto_401013 ?auto_401012 ) ( ON ?auto_401014 ?auto_401013 ) ( ON ?auto_401015 ?auto_401014 ) ( not ( = ?auto_401010 ?auto_401011 ) ) ( not ( = ?auto_401010 ?auto_401012 ) ) ( not ( = ?auto_401010 ?auto_401013 ) ) ( not ( = ?auto_401010 ?auto_401014 ) ) ( not ( = ?auto_401010 ?auto_401015 ) ) ( not ( = ?auto_401010 ?auto_401016 ) ) ( not ( = ?auto_401010 ?auto_401017 ) ) ( not ( = ?auto_401010 ?auto_401018 ) ) ( not ( = ?auto_401010 ?auto_401019 ) ) ( not ( = ?auto_401010 ?auto_401020 ) ) ( not ( = ?auto_401010 ?auto_401021 ) ) ( not ( = ?auto_401010 ?auto_401022 ) ) ( not ( = ?auto_401010 ?auto_401023 ) ) ( not ( = ?auto_401010 ?auto_401024 ) ) ( not ( = ?auto_401011 ?auto_401012 ) ) ( not ( = ?auto_401011 ?auto_401013 ) ) ( not ( = ?auto_401011 ?auto_401014 ) ) ( not ( = ?auto_401011 ?auto_401015 ) ) ( not ( = ?auto_401011 ?auto_401016 ) ) ( not ( = ?auto_401011 ?auto_401017 ) ) ( not ( = ?auto_401011 ?auto_401018 ) ) ( not ( = ?auto_401011 ?auto_401019 ) ) ( not ( = ?auto_401011 ?auto_401020 ) ) ( not ( = ?auto_401011 ?auto_401021 ) ) ( not ( = ?auto_401011 ?auto_401022 ) ) ( not ( = ?auto_401011 ?auto_401023 ) ) ( not ( = ?auto_401011 ?auto_401024 ) ) ( not ( = ?auto_401012 ?auto_401013 ) ) ( not ( = ?auto_401012 ?auto_401014 ) ) ( not ( = ?auto_401012 ?auto_401015 ) ) ( not ( = ?auto_401012 ?auto_401016 ) ) ( not ( = ?auto_401012 ?auto_401017 ) ) ( not ( = ?auto_401012 ?auto_401018 ) ) ( not ( = ?auto_401012 ?auto_401019 ) ) ( not ( = ?auto_401012 ?auto_401020 ) ) ( not ( = ?auto_401012 ?auto_401021 ) ) ( not ( = ?auto_401012 ?auto_401022 ) ) ( not ( = ?auto_401012 ?auto_401023 ) ) ( not ( = ?auto_401012 ?auto_401024 ) ) ( not ( = ?auto_401013 ?auto_401014 ) ) ( not ( = ?auto_401013 ?auto_401015 ) ) ( not ( = ?auto_401013 ?auto_401016 ) ) ( not ( = ?auto_401013 ?auto_401017 ) ) ( not ( = ?auto_401013 ?auto_401018 ) ) ( not ( = ?auto_401013 ?auto_401019 ) ) ( not ( = ?auto_401013 ?auto_401020 ) ) ( not ( = ?auto_401013 ?auto_401021 ) ) ( not ( = ?auto_401013 ?auto_401022 ) ) ( not ( = ?auto_401013 ?auto_401023 ) ) ( not ( = ?auto_401013 ?auto_401024 ) ) ( not ( = ?auto_401014 ?auto_401015 ) ) ( not ( = ?auto_401014 ?auto_401016 ) ) ( not ( = ?auto_401014 ?auto_401017 ) ) ( not ( = ?auto_401014 ?auto_401018 ) ) ( not ( = ?auto_401014 ?auto_401019 ) ) ( not ( = ?auto_401014 ?auto_401020 ) ) ( not ( = ?auto_401014 ?auto_401021 ) ) ( not ( = ?auto_401014 ?auto_401022 ) ) ( not ( = ?auto_401014 ?auto_401023 ) ) ( not ( = ?auto_401014 ?auto_401024 ) ) ( not ( = ?auto_401015 ?auto_401016 ) ) ( not ( = ?auto_401015 ?auto_401017 ) ) ( not ( = ?auto_401015 ?auto_401018 ) ) ( not ( = ?auto_401015 ?auto_401019 ) ) ( not ( = ?auto_401015 ?auto_401020 ) ) ( not ( = ?auto_401015 ?auto_401021 ) ) ( not ( = ?auto_401015 ?auto_401022 ) ) ( not ( = ?auto_401015 ?auto_401023 ) ) ( not ( = ?auto_401015 ?auto_401024 ) ) ( not ( = ?auto_401016 ?auto_401017 ) ) ( not ( = ?auto_401016 ?auto_401018 ) ) ( not ( = ?auto_401016 ?auto_401019 ) ) ( not ( = ?auto_401016 ?auto_401020 ) ) ( not ( = ?auto_401016 ?auto_401021 ) ) ( not ( = ?auto_401016 ?auto_401022 ) ) ( not ( = ?auto_401016 ?auto_401023 ) ) ( not ( = ?auto_401016 ?auto_401024 ) ) ( not ( = ?auto_401017 ?auto_401018 ) ) ( not ( = ?auto_401017 ?auto_401019 ) ) ( not ( = ?auto_401017 ?auto_401020 ) ) ( not ( = ?auto_401017 ?auto_401021 ) ) ( not ( = ?auto_401017 ?auto_401022 ) ) ( not ( = ?auto_401017 ?auto_401023 ) ) ( not ( = ?auto_401017 ?auto_401024 ) ) ( not ( = ?auto_401018 ?auto_401019 ) ) ( not ( = ?auto_401018 ?auto_401020 ) ) ( not ( = ?auto_401018 ?auto_401021 ) ) ( not ( = ?auto_401018 ?auto_401022 ) ) ( not ( = ?auto_401018 ?auto_401023 ) ) ( not ( = ?auto_401018 ?auto_401024 ) ) ( not ( = ?auto_401019 ?auto_401020 ) ) ( not ( = ?auto_401019 ?auto_401021 ) ) ( not ( = ?auto_401019 ?auto_401022 ) ) ( not ( = ?auto_401019 ?auto_401023 ) ) ( not ( = ?auto_401019 ?auto_401024 ) ) ( not ( = ?auto_401020 ?auto_401021 ) ) ( not ( = ?auto_401020 ?auto_401022 ) ) ( not ( = ?auto_401020 ?auto_401023 ) ) ( not ( = ?auto_401020 ?auto_401024 ) ) ( not ( = ?auto_401021 ?auto_401022 ) ) ( not ( = ?auto_401021 ?auto_401023 ) ) ( not ( = ?auto_401021 ?auto_401024 ) ) ( not ( = ?auto_401022 ?auto_401023 ) ) ( not ( = ?auto_401022 ?auto_401024 ) ) ( not ( = ?auto_401023 ?auto_401024 ) ) ( ON ?auto_401022 ?auto_401023 ) ( ON ?auto_401021 ?auto_401022 ) ( ON ?auto_401020 ?auto_401021 ) ( ON ?auto_401019 ?auto_401020 ) ( ON ?auto_401018 ?auto_401019 ) ( ON ?auto_401017 ?auto_401018 ) ( CLEAR ?auto_401015 ) ( ON ?auto_401016 ?auto_401017 ) ( CLEAR ?auto_401016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_401010 ?auto_401011 ?auto_401012 ?auto_401013 ?auto_401014 ?auto_401015 ?auto_401016 )
      ( MAKE-14PILE ?auto_401010 ?auto_401011 ?auto_401012 ?auto_401013 ?auto_401014 ?auto_401015 ?auto_401016 ?auto_401017 ?auto_401018 ?auto_401019 ?auto_401020 ?auto_401021 ?auto_401022 ?auto_401023 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_401068 - BLOCK
      ?auto_401069 - BLOCK
      ?auto_401070 - BLOCK
      ?auto_401071 - BLOCK
      ?auto_401072 - BLOCK
      ?auto_401073 - BLOCK
      ?auto_401074 - BLOCK
      ?auto_401075 - BLOCK
      ?auto_401076 - BLOCK
      ?auto_401077 - BLOCK
      ?auto_401078 - BLOCK
      ?auto_401079 - BLOCK
      ?auto_401080 - BLOCK
      ?auto_401081 - BLOCK
    )
    :vars
    (
      ?auto_401082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401081 ?auto_401082 ) ( ON-TABLE ?auto_401068 ) ( ON ?auto_401069 ?auto_401068 ) ( ON ?auto_401070 ?auto_401069 ) ( ON ?auto_401071 ?auto_401070 ) ( ON ?auto_401072 ?auto_401071 ) ( not ( = ?auto_401068 ?auto_401069 ) ) ( not ( = ?auto_401068 ?auto_401070 ) ) ( not ( = ?auto_401068 ?auto_401071 ) ) ( not ( = ?auto_401068 ?auto_401072 ) ) ( not ( = ?auto_401068 ?auto_401073 ) ) ( not ( = ?auto_401068 ?auto_401074 ) ) ( not ( = ?auto_401068 ?auto_401075 ) ) ( not ( = ?auto_401068 ?auto_401076 ) ) ( not ( = ?auto_401068 ?auto_401077 ) ) ( not ( = ?auto_401068 ?auto_401078 ) ) ( not ( = ?auto_401068 ?auto_401079 ) ) ( not ( = ?auto_401068 ?auto_401080 ) ) ( not ( = ?auto_401068 ?auto_401081 ) ) ( not ( = ?auto_401068 ?auto_401082 ) ) ( not ( = ?auto_401069 ?auto_401070 ) ) ( not ( = ?auto_401069 ?auto_401071 ) ) ( not ( = ?auto_401069 ?auto_401072 ) ) ( not ( = ?auto_401069 ?auto_401073 ) ) ( not ( = ?auto_401069 ?auto_401074 ) ) ( not ( = ?auto_401069 ?auto_401075 ) ) ( not ( = ?auto_401069 ?auto_401076 ) ) ( not ( = ?auto_401069 ?auto_401077 ) ) ( not ( = ?auto_401069 ?auto_401078 ) ) ( not ( = ?auto_401069 ?auto_401079 ) ) ( not ( = ?auto_401069 ?auto_401080 ) ) ( not ( = ?auto_401069 ?auto_401081 ) ) ( not ( = ?auto_401069 ?auto_401082 ) ) ( not ( = ?auto_401070 ?auto_401071 ) ) ( not ( = ?auto_401070 ?auto_401072 ) ) ( not ( = ?auto_401070 ?auto_401073 ) ) ( not ( = ?auto_401070 ?auto_401074 ) ) ( not ( = ?auto_401070 ?auto_401075 ) ) ( not ( = ?auto_401070 ?auto_401076 ) ) ( not ( = ?auto_401070 ?auto_401077 ) ) ( not ( = ?auto_401070 ?auto_401078 ) ) ( not ( = ?auto_401070 ?auto_401079 ) ) ( not ( = ?auto_401070 ?auto_401080 ) ) ( not ( = ?auto_401070 ?auto_401081 ) ) ( not ( = ?auto_401070 ?auto_401082 ) ) ( not ( = ?auto_401071 ?auto_401072 ) ) ( not ( = ?auto_401071 ?auto_401073 ) ) ( not ( = ?auto_401071 ?auto_401074 ) ) ( not ( = ?auto_401071 ?auto_401075 ) ) ( not ( = ?auto_401071 ?auto_401076 ) ) ( not ( = ?auto_401071 ?auto_401077 ) ) ( not ( = ?auto_401071 ?auto_401078 ) ) ( not ( = ?auto_401071 ?auto_401079 ) ) ( not ( = ?auto_401071 ?auto_401080 ) ) ( not ( = ?auto_401071 ?auto_401081 ) ) ( not ( = ?auto_401071 ?auto_401082 ) ) ( not ( = ?auto_401072 ?auto_401073 ) ) ( not ( = ?auto_401072 ?auto_401074 ) ) ( not ( = ?auto_401072 ?auto_401075 ) ) ( not ( = ?auto_401072 ?auto_401076 ) ) ( not ( = ?auto_401072 ?auto_401077 ) ) ( not ( = ?auto_401072 ?auto_401078 ) ) ( not ( = ?auto_401072 ?auto_401079 ) ) ( not ( = ?auto_401072 ?auto_401080 ) ) ( not ( = ?auto_401072 ?auto_401081 ) ) ( not ( = ?auto_401072 ?auto_401082 ) ) ( not ( = ?auto_401073 ?auto_401074 ) ) ( not ( = ?auto_401073 ?auto_401075 ) ) ( not ( = ?auto_401073 ?auto_401076 ) ) ( not ( = ?auto_401073 ?auto_401077 ) ) ( not ( = ?auto_401073 ?auto_401078 ) ) ( not ( = ?auto_401073 ?auto_401079 ) ) ( not ( = ?auto_401073 ?auto_401080 ) ) ( not ( = ?auto_401073 ?auto_401081 ) ) ( not ( = ?auto_401073 ?auto_401082 ) ) ( not ( = ?auto_401074 ?auto_401075 ) ) ( not ( = ?auto_401074 ?auto_401076 ) ) ( not ( = ?auto_401074 ?auto_401077 ) ) ( not ( = ?auto_401074 ?auto_401078 ) ) ( not ( = ?auto_401074 ?auto_401079 ) ) ( not ( = ?auto_401074 ?auto_401080 ) ) ( not ( = ?auto_401074 ?auto_401081 ) ) ( not ( = ?auto_401074 ?auto_401082 ) ) ( not ( = ?auto_401075 ?auto_401076 ) ) ( not ( = ?auto_401075 ?auto_401077 ) ) ( not ( = ?auto_401075 ?auto_401078 ) ) ( not ( = ?auto_401075 ?auto_401079 ) ) ( not ( = ?auto_401075 ?auto_401080 ) ) ( not ( = ?auto_401075 ?auto_401081 ) ) ( not ( = ?auto_401075 ?auto_401082 ) ) ( not ( = ?auto_401076 ?auto_401077 ) ) ( not ( = ?auto_401076 ?auto_401078 ) ) ( not ( = ?auto_401076 ?auto_401079 ) ) ( not ( = ?auto_401076 ?auto_401080 ) ) ( not ( = ?auto_401076 ?auto_401081 ) ) ( not ( = ?auto_401076 ?auto_401082 ) ) ( not ( = ?auto_401077 ?auto_401078 ) ) ( not ( = ?auto_401077 ?auto_401079 ) ) ( not ( = ?auto_401077 ?auto_401080 ) ) ( not ( = ?auto_401077 ?auto_401081 ) ) ( not ( = ?auto_401077 ?auto_401082 ) ) ( not ( = ?auto_401078 ?auto_401079 ) ) ( not ( = ?auto_401078 ?auto_401080 ) ) ( not ( = ?auto_401078 ?auto_401081 ) ) ( not ( = ?auto_401078 ?auto_401082 ) ) ( not ( = ?auto_401079 ?auto_401080 ) ) ( not ( = ?auto_401079 ?auto_401081 ) ) ( not ( = ?auto_401079 ?auto_401082 ) ) ( not ( = ?auto_401080 ?auto_401081 ) ) ( not ( = ?auto_401080 ?auto_401082 ) ) ( not ( = ?auto_401081 ?auto_401082 ) ) ( ON ?auto_401080 ?auto_401081 ) ( ON ?auto_401079 ?auto_401080 ) ( ON ?auto_401078 ?auto_401079 ) ( ON ?auto_401077 ?auto_401078 ) ( ON ?auto_401076 ?auto_401077 ) ( ON ?auto_401075 ?auto_401076 ) ( ON ?auto_401074 ?auto_401075 ) ( CLEAR ?auto_401072 ) ( ON ?auto_401073 ?auto_401074 ) ( CLEAR ?auto_401073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_401068 ?auto_401069 ?auto_401070 ?auto_401071 ?auto_401072 ?auto_401073 )
      ( MAKE-14PILE ?auto_401068 ?auto_401069 ?auto_401070 ?auto_401071 ?auto_401072 ?auto_401073 ?auto_401074 ?auto_401075 ?auto_401076 ?auto_401077 ?auto_401078 ?auto_401079 ?auto_401080 ?auto_401081 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_401126 - BLOCK
      ?auto_401127 - BLOCK
      ?auto_401128 - BLOCK
      ?auto_401129 - BLOCK
      ?auto_401130 - BLOCK
      ?auto_401131 - BLOCK
      ?auto_401132 - BLOCK
      ?auto_401133 - BLOCK
      ?auto_401134 - BLOCK
      ?auto_401135 - BLOCK
      ?auto_401136 - BLOCK
      ?auto_401137 - BLOCK
      ?auto_401138 - BLOCK
      ?auto_401139 - BLOCK
    )
    :vars
    (
      ?auto_401140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401139 ?auto_401140 ) ( ON-TABLE ?auto_401126 ) ( ON ?auto_401127 ?auto_401126 ) ( ON ?auto_401128 ?auto_401127 ) ( ON ?auto_401129 ?auto_401128 ) ( not ( = ?auto_401126 ?auto_401127 ) ) ( not ( = ?auto_401126 ?auto_401128 ) ) ( not ( = ?auto_401126 ?auto_401129 ) ) ( not ( = ?auto_401126 ?auto_401130 ) ) ( not ( = ?auto_401126 ?auto_401131 ) ) ( not ( = ?auto_401126 ?auto_401132 ) ) ( not ( = ?auto_401126 ?auto_401133 ) ) ( not ( = ?auto_401126 ?auto_401134 ) ) ( not ( = ?auto_401126 ?auto_401135 ) ) ( not ( = ?auto_401126 ?auto_401136 ) ) ( not ( = ?auto_401126 ?auto_401137 ) ) ( not ( = ?auto_401126 ?auto_401138 ) ) ( not ( = ?auto_401126 ?auto_401139 ) ) ( not ( = ?auto_401126 ?auto_401140 ) ) ( not ( = ?auto_401127 ?auto_401128 ) ) ( not ( = ?auto_401127 ?auto_401129 ) ) ( not ( = ?auto_401127 ?auto_401130 ) ) ( not ( = ?auto_401127 ?auto_401131 ) ) ( not ( = ?auto_401127 ?auto_401132 ) ) ( not ( = ?auto_401127 ?auto_401133 ) ) ( not ( = ?auto_401127 ?auto_401134 ) ) ( not ( = ?auto_401127 ?auto_401135 ) ) ( not ( = ?auto_401127 ?auto_401136 ) ) ( not ( = ?auto_401127 ?auto_401137 ) ) ( not ( = ?auto_401127 ?auto_401138 ) ) ( not ( = ?auto_401127 ?auto_401139 ) ) ( not ( = ?auto_401127 ?auto_401140 ) ) ( not ( = ?auto_401128 ?auto_401129 ) ) ( not ( = ?auto_401128 ?auto_401130 ) ) ( not ( = ?auto_401128 ?auto_401131 ) ) ( not ( = ?auto_401128 ?auto_401132 ) ) ( not ( = ?auto_401128 ?auto_401133 ) ) ( not ( = ?auto_401128 ?auto_401134 ) ) ( not ( = ?auto_401128 ?auto_401135 ) ) ( not ( = ?auto_401128 ?auto_401136 ) ) ( not ( = ?auto_401128 ?auto_401137 ) ) ( not ( = ?auto_401128 ?auto_401138 ) ) ( not ( = ?auto_401128 ?auto_401139 ) ) ( not ( = ?auto_401128 ?auto_401140 ) ) ( not ( = ?auto_401129 ?auto_401130 ) ) ( not ( = ?auto_401129 ?auto_401131 ) ) ( not ( = ?auto_401129 ?auto_401132 ) ) ( not ( = ?auto_401129 ?auto_401133 ) ) ( not ( = ?auto_401129 ?auto_401134 ) ) ( not ( = ?auto_401129 ?auto_401135 ) ) ( not ( = ?auto_401129 ?auto_401136 ) ) ( not ( = ?auto_401129 ?auto_401137 ) ) ( not ( = ?auto_401129 ?auto_401138 ) ) ( not ( = ?auto_401129 ?auto_401139 ) ) ( not ( = ?auto_401129 ?auto_401140 ) ) ( not ( = ?auto_401130 ?auto_401131 ) ) ( not ( = ?auto_401130 ?auto_401132 ) ) ( not ( = ?auto_401130 ?auto_401133 ) ) ( not ( = ?auto_401130 ?auto_401134 ) ) ( not ( = ?auto_401130 ?auto_401135 ) ) ( not ( = ?auto_401130 ?auto_401136 ) ) ( not ( = ?auto_401130 ?auto_401137 ) ) ( not ( = ?auto_401130 ?auto_401138 ) ) ( not ( = ?auto_401130 ?auto_401139 ) ) ( not ( = ?auto_401130 ?auto_401140 ) ) ( not ( = ?auto_401131 ?auto_401132 ) ) ( not ( = ?auto_401131 ?auto_401133 ) ) ( not ( = ?auto_401131 ?auto_401134 ) ) ( not ( = ?auto_401131 ?auto_401135 ) ) ( not ( = ?auto_401131 ?auto_401136 ) ) ( not ( = ?auto_401131 ?auto_401137 ) ) ( not ( = ?auto_401131 ?auto_401138 ) ) ( not ( = ?auto_401131 ?auto_401139 ) ) ( not ( = ?auto_401131 ?auto_401140 ) ) ( not ( = ?auto_401132 ?auto_401133 ) ) ( not ( = ?auto_401132 ?auto_401134 ) ) ( not ( = ?auto_401132 ?auto_401135 ) ) ( not ( = ?auto_401132 ?auto_401136 ) ) ( not ( = ?auto_401132 ?auto_401137 ) ) ( not ( = ?auto_401132 ?auto_401138 ) ) ( not ( = ?auto_401132 ?auto_401139 ) ) ( not ( = ?auto_401132 ?auto_401140 ) ) ( not ( = ?auto_401133 ?auto_401134 ) ) ( not ( = ?auto_401133 ?auto_401135 ) ) ( not ( = ?auto_401133 ?auto_401136 ) ) ( not ( = ?auto_401133 ?auto_401137 ) ) ( not ( = ?auto_401133 ?auto_401138 ) ) ( not ( = ?auto_401133 ?auto_401139 ) ) ( not ( = ?auto_401133 ?auto_401140 ) ) ( not ( = ?auto_401134 ?auto_401135 ) ) ( not ( = ?auto_401134 ?auto_401136 ) ) ( not ( = ?auto_401134 ?auto_401137 ) ) ( not ( = ?auto_401134 ?auto_401138 ) ) ( not ( = ?auto_401134 ?auto_401139 ) ) ( not ( = ?auto_401134 ?auto_401140 ) ) ( not ( = ?auto_401135 ?auto_401136 ) ) ( not ( = ?auto_401135 ?auto_401137 ) ) ( not ( = ?auto_401135 ?auto_401138 ) ) ( not ( = ?auto_401135 ?auto_401139 ) ) ( not ( = ?auto_401135 ?auto_401140 ) ) ( not ( = ?auto_401136 ?auto_401137 ) ) ( not ( = ?auto_401136 ?auto_401138 ) ) ( not ( = ?auto_401136 ?auto_401139 ) ) ( not ( = ?auto_401136 ?auto_401140 ) ) ( not ( = ?auto_401137 ?auto_401138 ) ) ( not ( = ?auto_401137 ?auto_401139 ) ) ( not ( = ?auto_401137 ?auto_401140 ) ) ( not ( = ?auto_401138 ?auto_401139 ) ) ( not ( = ?auto_401138 ?auto_401140 ) ) ( not ( = ?auto_401139 ?auto_401140 ) ) ( ON ?auto_401138 ?auto_401139 ) ( ON ?auto_401137 ?auto_401138 ) ( ON ?auto_401136 ?auto_401137 ) ( ON ?auto_401135 ?auto_401136 ) ( ON ?auto_401134 ?auto_401135 ) ( ON ?auto_401133 ?auto_401134 ) ( ON ?auto_401132 ?auto_401133 ) ( ON ?auto_401131 ?auto_401132 ) ( CLEAR ?auto_401129 ) ( ON ?auto_401130 ?auto_401131 ) ( CLEAR ?auto_401130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_401126 ?auto_401127 ?auto_401128 ?auto_401129 ?auto_401130 )
      ( MAKE-14PILE ?auto_401126 ?auto_401127 ?auto_401128 ?auto_401129 ?auto_401130 ?auto_401131 ?auto_401132 ?auto_401133 ?auto_401134 ?auto_401135 ?auto_401136 ?auto_401137 ?auto_401138 ?auto_401139 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_401184 - BLOCK
      ?auto_401185 - BLOCK
      ?auto_401186 - BLOCK
      ?auto_401187 - BLOCK
      ?auto_401188 - BLOCK
      ?auto_401189 - BLOCK
      ?auto_401190 - BLOCK
      ?auto_401191 - BLOCK
      ?auto_401192 - BLOCK
      ?auto_401193 - BLOCK
      ?auto_401194 - BLOCK
      ?auto_401195 - BLOCK
      ?auto_401196 - BLOCK
      ?auto_401197 - BLOCK
    )
    :vars
    (
      ?auto_401198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401197 ?auto_401198 ) ( ON-TABLE ?auto_401184 ) ( ON ?auto_401185 ?auto_401184 ) ( ON ?auto_401186 ?auto_401185 ) ( not ( = ?auto_401184 ?auto_401185 ) ) ( not ( = ?auto_401184 ?auto_401186 ) ) ( not ( = ?auto_401184 ?auto_401187 ) ) ( not ( = ?auto_401184 ?auto_401188 ) ) ( not ( = ?auto_401184 ?auto_401189 ) ) ( not ( = ?auto_401184 ?auto_401190 ) ) ( not ( = ?auto_401184 ?auto_401191 ) ) ( not ( = ?auto_401184 ?auto_401192 ) ) ( not ( = ?auto_401184 ?auto_401193 ) ) ( not ( = ?auto_401184 ?auto_401194 ) ) ( not ( = ?auto_401184 ?auto_401195 ) ) ( not ( = ?auto_401184 ?auto_401196 ) ) ( not ( = ?auto_401184 ?auto_401197 ) ) ( not ( = ?auto_401184 ?auto_401198 ) ) ( not ( = ?auto_401185 ?auto_401186 ) ) ( not ( = ?auto_401185 ?auto_401187 ) ) ( not ( = ?auto_401185 ?auto_401188 ) ) ( not ( = ?auto_401185 ?auto_401189 ) ) ( not ( = ?auto_401185 ?auto_401190 ) ) ( not ( = ?auto_401185 ?auto_401191 ) ) ( not ( = ?auto_401185 ?auto_401192 ) ) ( not ( = ?auto_401185 ?auto_401193 ) ) ( not ( = ?auto_401185 ?auto_401194 ) ) ( not ( = ?auto_401185 ?auto_401195 ) ) ( not ( = ?auto_401185 ?auto_401196 ) ) ( not ( = ?auto_401185 ?auto_401197 ) ) ( not ( = ?auto_401185 ?auto_401198 ) ) ( not ( = ?auto_401186 ?auto_401187 ) ) ( not ( = ?auto_401186 ?auto_401188 ) ) ( not ( = ?auto_401186 ?auto_401189 ) ) ( not ( = ?auto_401186 ?auto_401190 ) ) ( not ( = ?auto_401186 ?auto_401191 ) ) ( not ( = ?auto_401186 ?auto_401192 ) ) ( not ( = ?auto_401186 ?auto_401193 ) ) ( not ( = ?auto_401186 ?auto_401194 ) ) ( not ( = ?auto_401186 ?auto_401195 ) ) ( not ( = ?auto_401186 ?auto_401196 ) ) ( not ( = ?auto_401186 ?auto_401197 ) ) ( not ( = ?auto_401186 ?auto_401198 ) ) ( not ( = ?auto_401187 ?auto_401188 ) ) ( not ( = ?auto_401187 ?auto_401189 ) ) ( not ( = ?auto_401187 ?auto_401190 ) ) ( not ( = ?auto_401187 ?auto_401191 ) ) ( not ( = ?auto_401187 ?auto_401192 ) ) ( not ( = ?auto_401187 ?auto_401193 ) ) ( not ( = ?auto_401187 ?auto_401194 ) ) ( not ( = ?auto_401187 ?auto_401195 ) ) ( not ( = ?auto_401187 ?auto_401196 ) ) ( not ( = ?auto_401187 ?auto_401197 ) ) ( not ( = ?auto_401187 ?auto_401198 ) ) ( not ( = ?auto_401188 ?auto_401189 ) ) ( not ( = ?auto_401188 ?auto_401190 ) ) ( not ( = ?auto_401188 ?auto_401191 ) ) ( not ( = ?auto_401188 ?auto_401192 ) ) ( not ( = ?auto_401188 ?auto_401193 ) ) ( not ( = ?auto_401188 ?auto_401194 ) ) ( not ( = ?auto_401188 ?auto_401195 ) ) ( not ( = ?auto_401188 ?auto_401196 ) ) ( not ( = ?auto_401188 ?auto_401197 ) ) ( not ( = ?auto_401188 ?auto_401198 ) ) ( not ( = ?auto_401189 ?auto_401190 ) ) ( not ( = ?auto_401189 ?auto_401191 ) ) ( not ( = ?auto_401189 ?auto_401192 ) ) ( not ( = ?auto_401189 ?auto_401193 ) ) ( not ( = ?auto_401189 ?auto_401194 ) ) ( not ( = ?auto_401189 ?auto_401195 ) ) ( not ( = ?auto_401189 ?auto_401196 ) ) ( not ( = ?auto_401189 ?auto_401197 ) ) ( not ( = ?auto_401189 ?auto_401198 ) ) ( not ( = ?auto_401190 ?auto_401191 ) ) ( not ( = ?auto_401190 ?auto_401192 ) ) ( not ( = ?auto_401190 ?auto_401193 ) ) ( not ( = ?auto_401190 ?auto_401194 ) ) ( not ( = ?auto_401190 ?auto_401195 ) ) ( not ( = ?auto_401190 ?auto_401196 ) ) ( not ( = ?auto_401190 ?auto_401197 ) ) ( not ( = ?auto_401190 ?auto_401198 ) ) ( not ( = ?auto_401191 ?auto_401192 ) ) ( not ( = ?auto_401191 ?auto_401193 ) ) ( not ( = ?auto_401191 ?auto_401194 ) ) ( not ( = ?auto_401191 ?auto_401195 ) ) ( not ( = ?auto_401191 ?auto_401196 ) ) ( not ( = ?auto_401191 ?auto_401197 ) ) ( not ( = ?auto_401191 ?auto_401198 ) ) ( not ( = ?auto_401192 ?auto_401193 ) ) ( not ( = ?auto_401192 ?auto_401194 ) ) ( not ( = ?auto_401192 ?auto_401195 ) ) ( not ( = ?auto_401192 ?auto_401196 ) ) ( not ( = ?auto_401192 ?auto_401197 ) ) ( not ( = ?auto_401192 ?auto_401198 ) ) ( not ( = ?auto_401193 ?auto_401194 ) ) ( not ( = ?auto_401193 ?auto_401195 ) ) ( not ( = ?auto_401193 ?auto_401196 ) ) ( not ( = ?auto_401193 ?auto_401197 ) ) ( not ( = ?auto_401193 ?auto_401198 ) ) ( not ( = ?auto_401194 ?auto_401195 ) ) ( not ( = ?auto_401194 ?auto_401196 ) ) ( not ( = ?auto_401194 ?auto_401197 ) ) ( not ( = ?auto_401194 ?auto_401198 ) ) ( not ( = ?auto_401195 ?auto_401196 ) ) ( not ( = ?auto_401195 ?auto_401197 ) ) ( not ( = ?auto_401195 ?auto_401198 ) ) ( not ( = ?auto_401196 ?auto_401197 ) ) ( not ( = ?auto_401196 ?auto_401198 ) ) ( not ( = ?auto_401197 ?auto_401198 ) ) ( ON ?auto_401196 ?auto_401197 ) ( ON ?auto_401195 ?auto_401196 ) ( ON ?auto_401194 ?auto_401195 ) ( ON ?auto_401193 ?auto_401194 ) ( ON ?auto_401192 ?auto_401193 ) ( ON ?auto_401191 ?auto_401192 ) ( ON ?auto_401190 ?auto_401191 ) ( ON ?auto_401189 ?auto_401190 ) ( ON ?auto_401188 ?auto_401189 ) ( CLEAR ?auto_401186 ) ( ON ?auto_401187 ?auto_401188 ) ( CLEAR ?auto_401187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_401184 ?auto_401185 ?auto_401186 ?auto_401187 )
      ( MAKE-14PILE ?auto_401184 ?auto_401185 ?auto_401186 ?auto_401187 ?auto_401188 ?auto_401189 ?auto_401190 ?auto_401191 ?auto_401192 ?auto_401193 ?auto_401194 ?auto_401195 ?auto_401196 ?auto_401197 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_401242 - BLOCK
      ?auto_401243 - BLOCK
      ?auto_401244 - BLOCK
      ?auto_401245 - BLOCK
      ?auto_401246 - BLOCK
      ?auto_401247 - BLOCK
      ?auto_401248 - BLOCK
      ?auto_401249 - BLOCK
      ?auto_401250 - BLOCK
      ?auto_401251 - BLOCK
      ?auto_401252 - BLOCK
      ?auto_401253 - BLOCK
      ?auto_401254 - BLOCK
      ?auto_401255 - BLOCK
    )
    :vars
    (
      ?auto_401256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401255 ?auto_401256 ) ( ON-TABLE ?auto_401242 ) ( ON ?auto_401243 ?auto_401242 ) ( not ( = ?auto_401242 ?auto_401243 ) ) ( not ( = ?auto_401242 ?auto_401244 ) ) ( not ( = ?auto_401242 ?auto_401245 ) ) ( not ( = ?auto_401242 ?auto_401246 ) ) ( not ( = ?auto_401242 ?auto_401247 ) ) ( not ( = ?auto_401242 ?auto_401248 ) ) ( not ( = ?auto_401242 ?auto_401249 ) ) ( not ( = ?auto_401242 ?auto_401250 ) ) ( not ( = ?auto_401242 ?auto_401251 ) ) ( not ( = ?auto_401242 ?auto_401252 ) ) ( not ( = ?auto_401242 ?auto_401253 ) ) ( not ( = ?auto_401242 ?auto_401254 ) ) ( not ( = ?auto_401242 ?auto_401255 ) ) ( not ( = ?auto_401242 ?auto_401256 ) ) ( not ( = ?auto_401243 ?auto_401244 ) ) ( not ( = ?auto_401243 ?auto_401245 ) ) ( not ( = ?auto_401243 ?auto_401246 ) ) ( not ( = ?auto_401243 ?auto_401247 ) ) ( not ( = ?auto_401243 ?auto_401248 ) ) ( not ( = ?auto_401243 ?auto_401249 ) ) ( not ( = ?auto_401243 ?auto_401250 ) ) ( not ( = ?auto_401243 ?auto_401251 ) ) ( not ( = ?auto_401243 ?auto_401252 ) ) ( not ( = ?auto_401243 ?auto_401253 ) ) ( not ( = ?auto_401243 ?auto_401254 ) ) ( not ( = ?auto_401243 ?auto_401255 ) ) ( not ( = ?auto_401243 ?auto_401256 ) ) ( not ( = ?auto_401244 ?auto_401245 ) ) ( not ( = ?auto_401244 ?auto_401246 ) ) ( not ( = ?auto_401244 ?auto_401247 ) ) ( not ( = ?auto_401244 ?auto_401248 ) ) ( not ( = ?auto_401244 ?auto_401249 ) ) ( not ( = ?auto_401244 ?auto_401250 ) ) ( not ( = ?auto_401244 ?auto_401251 ) ) ( not ( = ?auto_401244 ?auto_401252 ) ) ( not ( = ?auto_401244 ?auto_401253 ) ) ( not ( = ?auto_401244 ?auto_401254 ) ) ( not ( = ?auto_401244 ?auto_401255 ) ) ( not ( = ?auto_401244 ?auto_401256 ) ) ( not ( = ?auto_401245 ?auto_401246 ) ) ( not ( = ?auto_401245 ?auto_401247 ) ) ( not ( = ?auto_401245 ?auto_401248 ) ) ( not ( = ?auto_401245 ?auto_401249 ) ) ( not ( = ?auto_401245 ?auto_401250 ) ) ( not ( = ?auto_401245 ?auto_401251 ) ) ( not ( = ?auto_401245 ?auto_401252 ) ) ( not ( = ?auto_401245 ?auto_401253 ) ) ( not ( = ?auto_401245 ?auto_401254 ) ) ( not ( = ?auto_401245 ?auto_401255 ) ) ( not ( = ?auto_401245 ?auto_401256 ) ) ( not ( = ?auto_401246 ?auto_401247 ) ) ( not ( = ?auto_401246 ?auto_401248 ) ) ( not ( = ?auto_401246 ?auto_401249 ) ) ( not ( = ?auto_401246 ?auto_401250 ) ) ( not ( = ?auto_401246 ?auto_401251 ) ) ( not ( = ?auto_401246 ?auto_401252 ) ) ( not ( = ?auto_401246 ?auto_401253 ) ) ( not ( = ?auto_401246 ?auto_401254 ) ) ( not ( = ?auto_401246 ?auto_401255 ) ) ( not ( = ?auto_401246 ?auto_401256 ) ) ( not ( = ?auto_401247 ?auto_401248 ) ) ( not ( = ?auto_401247 ?auto_401249 ) ) ( not ( = ?auto_401247 ?auto_401250 ) ) ( not ( = ?auto_401247 ?auto_401251 ) ) ( not ( = ?auto_401247 ?auto_401252 ) ) ( not ( = ?auto_401247 ?auto_401253 ) ) ( not ( = ?auto_401247 ?auto_401254 ) ) ( not ( = ?auto_401247 ?auto_401255 ) ) ( not ( = ?auto_401247 ?auto_401256 ) ) ( not ( = ?auto_401248 ?auto_401249 ) ) ( not ( = ?auto_401248 ?auto_401250 ) ) ( not ( = ?auto_401248 ?auto_401251 ) ) ( not ( = ?auto_401248 ?auto_401252 ) ) ( not ( = ?auto_401248 ?auto_401253 ) ) ( not ( = ?auto_401248 ?auto_401254 ) ) ( not ( = ?auto_401248 ?auto_401255 ) ) ( not ( = ?auto_401248 ?auto_401256 ) ) ( not ( = ?auto_401249 ?auto_401250 ) ) ( not ( = ?auto_401249 ?auto_401251 ) ) ( not ( = ?auto_401249 ?auto_401252 ) ) ( not ( = ?auto_401249 ?auto_401253 ) ) ( not ( = ?auto_401249 ?auto_401254 ) ) ( not ( = ?auto_401249 ?auto_401255 ) ) ( not ( = ?auto_401249 ?auto_401256 ) ) ( not ( = ?auto_401250 ?auto_401251 ) ) ( not ( = ?auto_401250 ?auto_401252 ) ) ( not ( = ?auto_401250 ?auto_401253 ) ) ( not ( = ?auto_401250 ?auto_401254 ) ) ( not ( = ?auto_401250 ?auto_401255 ) ) ( not ( = ?auto_401250 ?auto_401256 ) ) ( not ( = ?auto_401251 ?auto_401252 ) ) ( not ( = ?auto_401251 ?auto_401253 ) ) ( not ( = ?auto_401251 ?auto_401254 ) ) ( not ( = ?auto_401251 ?auto_401255 ) ) ( not ( = ?auto_401251 ?auto_401256 ) ) ( not ( = ?auto_401252 ?auto_401253 ) ) ( not ( = ?auto_401252 ?auto_401254 ) ) ( not ( = ?auto_401252 ?auto_401255 ) ) ( not ( = ?auto_401252 ?auto_401256 ) ) ( not ( = ?auto_401253 ?auto_401254 ) ) ( not ( = ?auto_401253 ?auto_401255 ) ) ( not ( = ?auto_401253 ?auto_401256 ) ) ( not ( = ?auto_401254 ?auto_401255 ) ) ( not ( = ?auto_401254 ?auto_401256 ) ) ( not ( = ?auto_401255 ?auto_401256 ) ) ( ON ?auto_401254 ?auto_401255 ) ( ON ?auto_401253 ?auto_401254 ) ( ON ?auto_401252 ?auto_401253 ) ( ON ?auto_401251 ?auto_401252 ) ( ON ?auto_401250 ?auto_401251 ) ( ON ?auto_401249 ?auto_401250 ) ( ON ?auto_401248 ?auto_401249 ) ( ON ?auto_401247 ?auto_401248 ) ( ON ?auto_401246 ?auto_401247 ) ( ON ?auto_401245 ?auto_401246 ) ( CLEAR ?auto_401243 ) ( ON ?auto_401244 ?auto_401245 ) ( CLEAR ?auto_401244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_401242 ?auto_401243 ?auto_401244 )
      ( MAKE-14PILE ?auto_401242 ?auto_401243 ?auto_401244 ?auto_401245 ?auto_401246 ?auto_401247 ?auto_401248 ?auto_401249 ?auto_401250 ?auto_401251 ?auto_401252 ?auto_401253 ?auto_401254 ?auto_401255 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_401300 - BLOCK
      ?auto_401301 - BLOCK
      ?auto_401302 - BLOCK
      ?auto_401303 - BLOCK
      ?auto_401304 - BLOCK
      ?auto_401305 - BLOCK
      ?auto_401306 - BLOCK
      ?auto_401307 - BLOCK
      ?auto_401308 - BLOCK
      ?auto_401309 - BLOCK
      ?auto_401310 - BLOCK
      ?auto_401311 - BLOCK
      ?auto_401312 - BLOCK
      ?auto_401313 - BLOCK
    )
    :vars
    (
      ?auto_401314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401313 ?auto_401314 ) ( ON-TABLE ?auto_401300 ) ( not ( = ?auto_401300 ?auto_401301 ) ) ( not ( = ?auto_401300 ?auto_401302 ) ) ( not ( = ?auto_401300 ?auto_401303 ) ) ( not ( = ?auto_401300 ?auto_401304 ) ) ( not ( = ?auto_401300 ?auto_401305 ) ) ( not ( = ?auto_401300 ?auto_401306 ) ) ( not ( = ?auto_401300 ?auto_401307 ) ) ( not ( = ?auto_401300 ?auto_401308 ) ) ( not ( = ?auto_401300 ?auto_401309 ) ) ( not ( = ?auto_401300 ?auto_401310 ) ) ( not ( = ?auto_401300 ?auto_401311 ) ) ( not ( = ?auto_401300 ?auto_401312 ) ) ( not ( = ?auto_401300 ?auto_401313 ) ) ( not ( = ?auto_401300 ?auto_401314 ) ) ( not ( = ?auto_401301 ?auto_401302 ) ) ( not ( = ?auto_401301 ?auto_401303 ) ) ( not ( = ?auto_401301 ?auto_401304 ) ) ( not ( = ?auto_401301 ?auto_401305 ) ) ( not ( = ?auto_401301 ?auto_401306 ) ) ( not ( = ?auto_401301 ?auto_401307 ) ) ( not ( = ?auto_401301 ?auto_401308 ) ) ( not ( = ?auto_401301 ?auto_401309 ) ) ( not ( = ?auto_401301 ?auto_401310 ) ) ( not ( = ?auto_401301 ?auto_401311 ) ) ( not ( = ?auto_401301 ?auto_401312 ) ) ( not ( = ?auto_401301 ?auto_401313 ) ) ( not ( = ?auto_401301 ?auto_401314 ) ) ( not ( = ?auto_401302 ?auto_401303 ) ) ( not ( = ?auto_401302 ?auto_401304 ) ) ( not ( = ?auto_401302 ?auto_401305 ) ) ( not ( = ?auto_401302 ?auto_401306 ) ) ( not ( = ?auto_401302 ?auto_401307 ) ) ( not ( = ?auto_401302 ?auto_401308 ) ) ( not ( = ?auto_401302 ?auto_401309 ) ) ( not ( = ?auto_401302 ?auto_401310 ) ) ( not ( = ?auto_401302 ?auto_401311 ) ) ( not ( = ?auto_401302 ?auto_401312 ) ) ( not ( = ?auto_401302 ?auto_401313 ) ) ( not ( = ?auto_401302 ?auto_401314 ) ) ( not ( = ?auto_401303 ?auto_401304 ) ) ( not ( = ?auto_401303 ?auto_401305 ) ) ( not ( = ?auto_401303 ?auto_401306 ) ) ( not ( = ?auto_401303 ?auto_401307 ) ) ( not ( = ?auto_401303 ?auto_401308 ) ) ( not ( = ?auto_401303 ?auto_401309 ) ) ( not ( = ?auto_401303 ?auto_401310 ) ) ( not ( = ?auto_401303 ?auto_401311 ) ) ( not ( = ?auto_401303 ?auto_401312 ) ) ( not ( = ?auto_401303 ?auto_401313 ) ) ( not ( = ?auto_401303 ?auto_401314 ) ) ( not ( = ?auto_401304 ?auto_401305 ) ) ( not ( = ?auto_401304 ?auto_401306 ) ) ( not ( = ?auto_401304 ?auto_401307 ) ) ( not ( = ?auto_401304 ?auto_401308 ) ) ( not ( = ?auto_401304 ?auto_401309 ) ) ( not ( = ?auto_401304 ?auto_401310 ) ) ( not ( = ?auto_401304 ?auto_401311 ) ) ( not ( = ?auto_401304 ?auto_401312 ) ) ( not ( = ?auto_401304 ?auto_401313 ) ) ( not ( = ?auto_401304 ?auto_401314 ) ) ( not ( = ?auto_401305 ?auto_401306 ) ) ( not ( = ?auto_401305 ?auto_401307 ) ) ( not ( = ?auto_401305 ?auto_401308 ) ) ( not ( = ?auto_401305 ?auto_401309 ) ) ( not ( = ?auto_401305 ?auto_401310 ) ) ( not ( = ?auto_401305 ?auto_401311 ) ) ( not ( = ?auto_401305 ?auto_401312 ) ) ( not ( = ?auto_401305 ?auto_401313 ) ) ( not ( = ?auto_401305 ?auto_401314 ) ) ( not ( = ?auto_401306 ?auto_401307 ) ) ( not ( = ?auto_401306 ?auto_401308 ) ) ( not ( = ?auto_401306 ?auto_401309 ) ) ( not ( = ?auto_401306 ?auto_401310 ) ) ( not ( = ?auto_401306 ?auto_401311 ) ) ( not ( = ?auto_401306 ?auto_401312 ) ) ( not ( = ?auto_401306 ?auto_401313 ) ) ( not ( = ?auto_401306 ?auto_401314 ) ) ( not ( = ?auto_401307 ?auto_401308 ) ) ( not ( = ?auto_401307 ?auto_401309 ) ) ( not ( = ?auto_401307 ?auto_401310 ) ) ( not ( = ?auto_401307 ?auto_401311 ) ) ( not ( = ?auto_401307 ?auto_401312 ) ) ( not ( = ?auto_401307 ?auto_401313 ) ) ( not ( = ?auto_401307 ?auto_401314 ) ) ( not ( = ?auto_401308 ?auto_401309 ) ) ( not ( = ?auto_401308 ?auto_401310 ) ) ( not ( = ?auto_401308 ?auto_401311 ) ) ( not ( = ?auto_401308 ?auto_401312 ) ) ( not ( = ?auto_401308 ?auto_401313 ) ) ( not ( = ?auto_401308 ?auto_401314 ) ) ( not ( = ?auto_401309 ?auto_401310 ) ) ( not ( = ?auto_401309 ?auto_401311 ) ) ( not ( = ?auto_401309 ?auto_401312 ) ) ( not ( = ?auto_401309 ?auto_401313 ) ) ( not ( = ?auto_401309 ?auto_401314 ) ) ( not ( = ?auto_401310 ?auto_401311 ) ) ( not ( = ?auto_401310 ?auto_401312 ) ) ( not ( = ?auto_401310 ?auto_401313 ) ) ( not ( = ?auto_401310 ?auto_401314 ) ) ( not ( = ?auto_401311 ?auto_401312 ) ) ( not ( = ?auto_401311 ?auto_401313 ) ) ( not ( = ?auto_401311 ?auto_401314 ) ) ( not ( = ?auto_401312 ?auto_401313 ) ) ( not ( = ?auto_401312 ?auto_401314 ) ) ( not ( = ?auto_401313 ?auto_401314 ) ) ( ON ?auto_401312 ?auto_401313 ) ( ON ?auto_401311 ?auto_401312 ) ( ON ?auto_401310 ?auto_401311 ) ( ON ?auto_401309 ?auto_401310 ) ( ON ?auto_401308 ?auto_401309 ) ( ON ?auto_401307 ?auto_401308 ) ( ON ?auto_401306 ?auto_401307 ) ( ON ?auto_401305 ?auto_401306 ) ( ON ?auto_401304 ?auto_401305 ) ( ON ?auto_401303 ?auto_401304 ) ( ON ?auto_401302 ?auto_401303 ) ( CLEAR ?auto_401300 ) ( ON ?auto_401301 ?auto_401302 ) ( CLEAR ?auto_401301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_401300 ?auto_401301 )
      ( MAKE-14PILE ?auto_401300 ?auto_401301 ?auto_401302 ?auto_401303 ?auto_401304 ?auto_401305 ?auto_401306 ?auto_401307 ?auto_401308 ?auto_401309 ?auto_401310 ?auto_401311 ?auto_401312 ?auto_401313 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_401358 - BLOCK
      ?auto_401359 - BLOCK
      ?auto_401360 - BLOCK
      ?auto_401361 - BLOCK
      ?auto_401362 - BLOCK
      ?auto_401363 - BLOCK
      ?auto_401364 - BLOCK
      ?auto_401365 - BLOCK
      ?auto_401366 - BLOCK
      ?auto_401367 - BLOCK
      ?auto_401368 - BLOCK
      ?auto_401369 - BLOCK
      ?auto_401370 - BLOCK
      ?auto_401371 - BLOCK
    )
    :vars
    (
      ?auto_401372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401371 ?auto_401372 ) ( not ( = ?auto_401358 ?auto_401359 ) ) ( not ( = ?auto_401358 ?auto_401360 ) ) ( not ( = ?auto_401358 ?auto_401361 ) ) ( not ( = ?auto_401358 ?auto_401362 ) ) ( not ( = ?auto_401358 ?auto_401363 ) ) ( not ( = ?auto_401358 ?auto_401364 ) ) ( not ( = ?auto_401358 ?auto_401365 ) ) ( not ( = ?auto_401358 ?auto_401366 ) ) ( not ( = ?auto_401358 ?auto_401367 ) ) ( not ( = ?auto_401358 ?auto_401368 ) ) ( not ( = ?auto_401358 ?auto_401369 ) ) ( not ( = ?auto_401358 ?auto_401370 ) ) ( not ( = ?auto_401358 ?auto_401371 ) ) ( not ( = ?auto_401358 ?auto_401372 ) ) ( not ( = ?auto_401359 ?auto_401360 ) ) ( not ( = ?auto_401359 ?auto_401361 ) ) ( not ( = ?auto_401359 ?auto_401362 ) ) ( not ( = ?auto_401359 ?auto_401363 ) ) ( not ( = ?auto_401359 ?auto_401364 ) ) ( not ( = ?auto_401359 ?auto_401365 ) ) ( not ( = ?auto_401359 ?auto_401366 ) ) ( not ( = ?auto_401359 ?auto_401367 ) ) ( not ( = ?auto_401359 ?auto_401368 ) ) ( not ( = ?auto_401359 ?auto_401369 ) ) ( not ( = ?auto_401359 ?auto_401370 ) ) ( not ( = ?auto_401359 ?auto_401371 ) ) ( not ( = ?auto_401359 ?auto_401372 ) ) ( not ( = ?auto_401360 ?auto_401361 ) ) ( not ( = ?auto_401360 ?auto_401362 ) ) ( not ( = ?auto_401360 ?auto_401363 ) ) ( not ( = ?auto_401360 ?auto_401364 ) ) ( not ( = ?auto_401360 ?auto_401365 ) ) ( not ( = ?auto_401360 ?auto_401366 ) ) ( not ( = ?auto_401360 ?auto_401367 ) ) ( not ( = ?auto_401360 ?auto_401368 ) ) ( not ( = ?auto_401360 ?auto_401369 ) ) ( not ( = ?auto_401360 ?auto_401370 ) ) ( not ( = ?auto_401360 ?auto_401371 ) ) ( not ( = ?auto_401360 ?auto_401372 ) ) ( not ( = ?auto_401361 ?auto_401362 ) ) ( not ( = ?auto_401361 ?auto_401363 ) ) ( not ( = ?auto_401361 ?auto_401364 ) ) ( not ( = ?auto_401361 ?auto_401365 ) ) ( not ( = ?auto_401361 ?auto_401366 ) ) ( not ( = ?auto_401361 ?auto_401367 ) ) ( not ( = ?auto_401361 ?auto_401368 ) ) ( not ( = ?auto_401361 ?auto_401369 ) ) ( not ( = ?auto_401361 ?auto_401370 ) ) ( not ( = ?auto_401361 ?auto_401371 ) ) ( not ( = ?auto_401361 ?auto_401372 ) ) ( not ( = ?auto_401362 ?auto_401363 ) ) ( not ( = ?auto_401362 ?auto_401364 ) ) ( not ( = ?auto_401362 ?auto_401365 ) ) ( not ( = ?auto_401362 ?auto_401366 ) ) ( not ( = ?auto_401362 ?auto_401367 ) ) ( not ( = ?auto_401362 ?auto_401368 ) ) ( not ( = ?auto_401362 ?auto_401369 ) ) ( not ( = ?auto_401362 ?auto_401370 ) ) ( not ( = ?auto_401362 ?auto_401371 ) ) ( not ( = ?auto_401362 ?auto_401372 ) ) ( not ( = ?auto_401363 ?auto_401364 ) ) ( not ( = ?auto_401363 ?auto_401365 ) ) ( not ( = ?auto_401363 ?auto_401366 ) ) ( not ( = ?auto_401363 ?auto_401367 ) ) ( not ( = ?auto_401363 ?auto_401368 ) ) ( not ( = ?auto_401363 ?auto_401369 ) ) ( not ( = ?auto_401363 ?auto_401370 ) ) ( not ( = ?auto_401363 ?auto_401371 ) ) ( not ( = ?auto_401363 ?auto_401372 ) ) ( not ( = ?auto_401364 ?auto_401365 ) ) ( not ( = ?auto_401364 ?auto_401366 ) ) ( not ( = ?auto_401364 ?auto_401367 ) ) ( not ( = ?auto_401364 ?auto_401368 ) ) ( not ( = ?auto_401364 ?auto_401369 ) ) ( not ( = ?auto_401364 ?auto_401370 ) ) ( not ( = ?auto_401364 ?auto_401371 ) ) ( not ( = ?auto_401364 ?auto_401372 ) ) ( not ( = ?auto_401365 ?auto_401366 ) ) ( not ( = ?auto_401365 ?auto_401367 ) ) ( not ( = ?auto_401365 ?auto_401368 ) ) ( not ( = ?auto_401365 ?auto_401369 ) ) ( not ( = ?auto_401365 ?auto_401370 ) ) ( not ( = ?auto_401365 ?auto_401371 ) ) ( not ( = ?auto_401365 ?auto_401372 ) ) ( not ( = ?auto_401366 ?auto_401367 ) ) ( not ( = ?auto_401366 ?auto_401368 ) ) ( not ( = ?auto_401366 ?auto_401369 ) ) ( not ( = ?auto_401366 ?auto_401370 ) ) ( not ( = ?auto_401366 ?auto_401371 ) ) ( not ( = ?auto_401366 ?auto_401372 ) ) ( not ( = ?auto_401367 ?auto_401368 ) ) ( not ( = ?auto_401367 ?auto_401369 ) ) ( not ( = ?auto_401367 ?auto_401370 ) ) ( not ( = ?auto_401367 ?auto_401371 ) ) ( not ( = ?auto_401367 ?auto_401372 ) ) ( not ( = ?auto_401368 ?auto_401369 ) ) ( not ( = ?auto_401368 ?auto_401370 ) ) ( not ( = ?auto_401368 ?auto_401371 ) ) ( not ( = ?auto_401368 ?auto_401372 ) ) ( not ( = ?auto_401369 ?auto_401370 ) ) ( not ( = ?auto_401369 ?auto_401371 ) ) ( not ( = ?auto_401369 ?auto_401372 ) ) ( not ( = ?auto_401370 ?auto_401371 ) ) ( not ( = ?auto_401370 ?auto_401372 ) ) ( not ( = ?auto_401371 ?auto_401372 ) ) ( ON ?auto_401370 ?auto_401371 ) ( ON ?auto_401369 ?auto_401370 ) ( ON ?auto_401368 ?auto_401369 ) ( ON ?auto_401367 ?auto_401368 ) ( ON ?auto_401366 ?auto_401367 ) ( ON ?auto_401365 ?auto_401366 ) ( ON ?auto_401364 ?auto_401365 ) ( ON ?auto_401363 ?auto_401364 ) ( ON ?auto_401362 ?auto_401363 ) ( ON ?auto_401361 ?auto_401362 ) ( ON ?auto_401360 ?auto_401361 ) ( ON ?auto_401359 ?auto_401360 ) ( ON ?auto_401358 ?auto_401359 ) ( CLEAR ?auto_401358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_401358 )
      ( MAKE-14PILE ?auto_401358 ?auto_401359 ?auto_401360 ?auto_401361 ?auto_401362 ?auto_401363 ?auto_401364 ?auto_401365 ?auto_401366 ?auto_401367 ?auto_401368 ?auto_401369 ?auto_401370 ?auto_401371 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401417 - BLOCK
      ?auto_401418 - BLOCK
      ?auto_401419 - BLOCK
      ?auto_401420 - BLOCK
      ?auto_401421 - BLOCK
      ?auto_401422 - BLOCK
      ?auto_401423 - BLOCK
      ?auto_401424 - BLOCK
      ?auto_401425 - BLOCK
      ?auto_401426 - BLOCK
      ?auto_401427 - BLOCK
      ?auto_401428 - BLOCK
      ?auto_401429 - BLOCK
      ?auto_401430 - BLOCK
      ?auto_401431 - BLOCK
    )
    :vars
    (
      ?auto_401432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_401430 ) ( ON ?auto_401431 ?auto_401432 ) ( CLEAR ?auto_401431 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_401417 ) ( ON ?auto_401418 ?auto_401417 ) ( ON ?auto_401419 ?auto_401418 ) ( ON ?auto_401420 ?auto_401419 ) ( ON ?auto_401421 ?auto_401420 ) ( ON ?auto_401422 ?auto_401421 ) ( ON ?auto_401423 ?auto_401422 ) ( ON ?auto_401424 ?auto_401423 ) ( ON ?auto_401425 ?auto_401424 ) ( ON ?auto_401426 ?auto_401425 ) ( ON ?auto_401427 ?auto_401426 ) ( ON ?auto_401428 ?auto_401427 ) ( ON ?auto_401429 ?auto_401428 ) ( ON ?auto_401430 ?auto_401429 ) ( not ( = ?auto_401417 ?auto_401418 ) ) ( not ( = ?auto_401417 ?auto_401419 ) ) ( not ( = ?auto_401417 ?auto_401420 ) ) ( not ( = ?auto_401417 ?auto_401421 ) ) ( not ( = ?auto_401417 ?auto_401422 ) ) ( not ( = ?auto_401417 ?auto_401423 ) ) ( not ( = ?auto_401417 ?auto_401424 ) ) ( not ( = ?auto_401417 ?auto_401425 ) ) ( not ( = ?auto_401417 ?auto_401426 ) ) ( not ( = ?auto_401417 ?auto_401427 ) ) ( not ( = ?auto_401417 ?auto_401428 ) ) ( not ( = ?auto_401417 ?auto_401429 ) ) ( not ( = ?auto_401417 ?auto_401430 ) ) ( not ( = ?auto_401417 ?auto_401431 ) ) ( not ( = ?auto_401417 ?auto_401432 ) ) ( not ( = ?auto_401418 ?auto_401419 ) ) ( not ( = ?auto_401418 ?auto_401420 ) ) ( not ( = ?auto_401418 ?auto_401421 ) ) ( not ( = ?auto_401418 ?auto_401422 ) ) ( not ( = ?auto_401418 ?auto_401423 ) ) ( not ( = ?auto_401418 ?auto_401424 ) ) ( not ( = ?auto_401418 ?auto_401425 ) ) ( not ( = ?auto_401418 ?auto_401426 ) ) ( not ( = ?auto_401418 ?auto_401427 ) ) ( not ( = ?auto_401418 ?auto_401428 ) ) ( not ( = ?auto_401418 ?auto_401429 ) ) ( not ( = ?auto_401418 ?auto_401430 ) ) ( not ( = ?auto_401418 ?auto_401431 ) ) ( not ( = ?auto_401418 ?auto_401432 ) ) ( not ( = ?auto_401419 ?auto_401420 ) ) ( not ( = ?auto_401419 ?auto_401421 ) ) ( not ( = ?auto_401419 ?auto_401422 ) ) ( not ( = ?auto_401419 ?auto_401423 ) ) ( not ( = ?auto_401419 ?auto_401424 ) ) ( not ( = ?auto_401419 ?auto_401425 ) ) ( not ( = ?auto_401419 ?auto_401426 ) ) ( not ( = ?auto_401419 ?auto_401427 ) ) ( not ( = ?auto_401419 ?auto_401428 ) ) ( not ( = ?auto_401419 ?auto_401429 ) ) ( not ( = ?auto_401419 ?auto_401430 ) ) ( not ( = ?auto_401419 ?auto_401431 ) ) ( not ( = ?auto_401419 ?auto_401432 ) ) ( not ( = ?auto_401420 ?auto_401421 ) ) ( not ( = ?auto_401420 ?auto_401422 ) ) ( not ( = ?auto_401420 ?auto_401423 ) ) ( not ( = ?auto_401420 ?auto_401424 ) ) ( not ( = ?auto_401420 ?auto_401425 ) ) ( not ( = ?auto_401420 ?auto_401426 ) ) ( not ( = ?auto_401420 ?auto_401427 ) ) ( not ( = ?auto_401420 ?auto_401428 ) ) ( not ( = ?auto_401420 ?auto_401429 ) ) ( not ( = ?auto_401420 ?auto_401430 ) ) ( not ( = ?auto_401420 ?auto_401431 ) ) ( not ( = ?auto_401420 ?auto_401432 ) ) ( not ( = ?auto_401421 ?auto_401422 ) ) ( not ( = ?auto_401421 ?auto_401423 ) ) ( not ( = ?auto_401421 ?auto_401424 ) ) ( not ( = ?auto_401421 ?auto_401425 ) ) ( not ( = ?auto_401421 ?auto_401426 ) ) ( not ( = ?auto_401421 ?auto_401427 ) ) ( not ( = ?auto_401421 ?auto_401428 ) ) ( not ( = ?auto_401421 ?auto_401429 ) ) ( not ( = ?auto_401421 ?auto_401430 ) ) ( not ( = ?auto_401421 ?auto_401431 ) ) ( not ( = ?auto_401421 ?auto_401432 ) ) ( not ( = ?auto_401422 ?auto_401423 ) ) ( not ( = ?auto_401422 ?auto_401424 ) ) ( not ( = ?auto_401422 ?auto_401425 ) ) ( not ( = ?auto_401422 ?auto_401426 ) ) ( not ( = ?auto_401422 ?auto_401427 ) ) ( not ( = ?auto_401422 ?auto_401428 ) ) ( not ( = ?auto_401422 ?auto_401429 ) ) ( not ( = ?auto_401422 ?auto_401430 ) ) ( not ( = ?auto_401422 ?auto_401431 ) ) ( not ( = ?auto_401422 ?auto_401432 ) ) ( not ( = ?auto_401423 ?auto_401424 ) ) ( not ( = ?auto_401423 ?auto_401425 ) ) ( not ( = ?auto_401423 ?auto_401426 ) ) ( not ( = ?auto_401423 ?auto_401427 ) ) ( not ( = ?auto_401423 ?auto_401428 ) ) ( not ( = ?auto_401423 ?auto_401429 ) ) ( not ( = ?auto_401423 ?auto_401430 ) ) ( not ( = ?auto_401423 ?auto_401431 ) ) ( not ( = ?auto_401423 ?auto_401432 ) ) ( not ( = ?auto_401424 ?auto_401425 ) ) ( not ( = ?auto_401424 ?auto_401426 ) ) ( not ( = ?auto_401424 ?auto_401427 ) ) ( not ( = ?auto_401424 ?auto_401428 ) ) ( not ( = ?auto_401424 ?auto_401429 ) ) ( not ( = ?auto_401424 ?auto_401430 ) ) ( not ( = ?auto_401424 ?auto_401431 ) ) ( not ( = ?auto_401424 ?auto_401432 ) ) ( not ( = ?auto_401425 ?auto_401426 ) ) ( not ( = ?auto_401425 ?auto_401427 ) ) ( not ( = ?auto_401425 ?auto_401428 ) ) ( not ( = ?auto_401425 ?auto_401429 ) ) ( not ( = ?auto_401425 ?auto_401430 ) ) ( not ( = ?auto_401425 ?auto_401431 ) ) ( not ( = ?auto_401425 ?auto_401432 ) ) ( not ( = ?auto_401426 ?auto_401427 ) ) ( not ( = ?auto_401426 ?auto_401428 ) ) ( not ( = ?auto_401426 ?auto_401429 ) ) ( not ( = ?auto_401426 ?auto_401430 ) ) ( not ( = ?auto_401426 ?auto_401431 ) ) ( not ( = ?auto_401426 ?auto_401432 ) ) ( not ( = ?auto_401427 ?auto_401428 ) ) ( not ( = ?auto_401427 ?auto_401429 ) ) ( not ( = ?auto_401427 ?auto_401430 ) ) ( not ( = ?auto_401427 ?auto_401431 ) ) ( not ( = ?auto_401427 ?auto_401432 ) ) ( not ( = ?auto_401428 ?auto_401429 ) ) ( not ( = ?auto_401428 ?auto_401430 ) ) ( not ( = ?auto_401428 ?auto_401431 ) ) ( not ( = ?auto_401428 ?auto_401432 ) ) ( not ( = ?auto_401429 ?auto_401430 ) ) ( not ( = ?auto_401429 ?auto_401431 ) ) ( not ( = ?auto_401429 ?auto_401432 ) ) ( not ( = ?auto_401430 ?auto_401431 ) ) ( not ( = ?auto_401430 ?auto_401432 ) ) ( not ( = ?auto_401431 ?auto_401432 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_401431 ?auto_401432 )
      ( !STACK ?auto_401431 ?auto_401430 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401448 - BLOCK
      ?auto_401449 - BLOCK
      ?auto_401450 - BLOCK
      ?auto_401451 - BLOCK
      ?auto_401452 - BLOCK
      ?auto_401453 - BLOCK
      ?auto_401454 - BLOCK
      ?auto_401455 - BLOCK
      ?auto_401456 - BLOCK
      ?auto_401457 - BLOCK
      ?auto_401458 - BLOCK
      ?auto_401459 - BLOCK
      ?auto_401460 - BLOCK
      ?auto_401461 - BLOCK
      ?auto_401462 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_401461 ) ( ON-TABLE ?auto_401462 ) ( CLEAR ?auto_401462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_401448 ) ( ON ?auto_401449 ?auto_401448 ) ( ON ?auto_401450 ?auto_401449 ) ( ON ?auto_401451 ?auto_401450 ) ( ON ?auto_401452 ?auto_401451 ) ( ON ?auto_401453 ?auto_401452 ) ( ON ?auto_401454 ?auto_401453 ) ( ON ?auto_401455 ?auto_401454 ) ( ON ?auto_401456 ?auto_401455 ) ( ON ?auto_401457 ?auto_401456 ) ( ON ?auto_401458 ?auto_401457 ) ( ON ?auto_401459 ?auto_401458 ) ( ON ?auto_401460 ?auto_401459 ) ( ON ?auto_401461 ?auto_401460 ) ( not ( = ?auto_401448 ?auto_401449 ) ) ( not ( = ?auto_401448 ?auto_401450 ) ) ( not ( = ?auto_401448 ?auto_401451 ) ) ( not ( = ?auto_401448 ?auto_401452 ) ) ( not ( = ?auto_401448 ?auto_401453 ) ) ( not ( = ?auto_401448 ?auto_401454 ) ) ( not ( = ?auto_401448 ?auto_401455 ) ) ( not ( = ?auto_401448 ?auto_401456 ) ) ( not ( = ?auto_401448 ?auto_401457 ) ) ( not ( = ?auto_401448 ?auto_401458 ) ) ( not ( = ?auto_401448 ?auto_401459 ) ) ( not ( = ?auto_401448 ?auto_401460 ) ) ( not ( = ?auto_401448 ?auto_401461 ) ) ( not ( = ?auto_401448 ?auto_401462 ) ) ( not ( = ?auto_401449 ?auto_401450 ) ) ( not ( = ?auto_401449 ?auto_401451 ) ) ( not ( = ?auto_401449 ?auto_401452 ) ) ( not ( = ?auto_401449 ?auto_401453 ) ) ( not ( = ?auto_401449 ?auto_401454 ) ) ( not ( = ?auto_401449 ?auto_401455 ) ) ( not ( = ?auto_401449 ?auto_401456 ) ) ( not ( = ?auto_401449 ?auto_401457 ) ) ( not ( = ?auto_401449 ?auto_401458 ) ) ( not ( = ?auto_401449 ?auto_401459 ) ) ( not ( = ?auto_401449 ?auto_401460 ) ) ( not ( = ?auto_401449 ?auto_401461 ) ) ( not ( = ?auto_401449 ?auto_401462 ) ) ( not ( = ?auto_401450 ?auto_401451 ) ) ( not ( = ?auto_401450 ?auto_401452 ) ) ( not ( = ?auto_401450 ?auto_401453 ) ) ( not ( = ?auto_401450 ?auto_401454 ) ) ( not ( = ?auto_401450 ?auto_401455 ) ) ( not ( = ?auto_401450 ?auto_401456 ) ) ( not ( = ?auto_401450 ?auto_401457 ) ) ( not ( = ?auto_401450 ?auto_401458 ) ) ( not ( = ?auto_401450 ?auto_401459 ) ) ( not ( = ?auto_401450 ?auto_401460 ) ) ( not ( = ?auto_401450 ?auto_401461 ) ) ( not ( = ?auto_401450 ?auto_401462 ) ) ( not ( = ?auto_401451 ?auto_401452 ) ) ( not ( = ?auto_401451 ?auto_401453 ) ) ( not ( = ?auto_401451 ?auto_401454 ) ) ( not ( = ?auto_401451 ?auto_401455 ) ) ( not ( = ?auto_401451 ?auto_401456 ) ) ( not ( = ?auto_401451 ?auto_401457 ) ) ( not ( = ?auto_401451 ?auto_401458 ) ) ( not ( = ?auto_401451 ?auto_401459 ) ) ( not ( = ?auto_401451 ?auto_401460 ) ) ( not ( = ?auto_401451 ?auto_401461 ) ) ( not ( = ?auto_401451 ?auto_401462 ) ) ( not ( = ?auto_401452 ?auto_401453 ) ) ( not ( = ?auto_401452 ?auto_401454 ) ) ( not ( = ?auto_401452 ?auto_401455 ) ) ( not ( = ?auto_401452 ?auto_401456 ) ) ( not ( = ?auto_401452 ?auto_401457 ) ) ( not ( = ?auto_401452 ?auto_401458 ) ) ( not ( = ?auto_401452 ?auto_401459 ) ) ( not ( = ?auto_401452 ?auto_401460 ) ) ( not ( = ?auto_401452 ?auto_401461 ) ) ( not ( = ?auto_401452 ?auto_401462 ) ) ( not ( = ?auto_401453 ?auto_401454 ) ) ( not ( = ?auto_401453 ?auto_401455 ) ) ( not ( = ?auto_401453 ?auto_401456 ) ) ( not ( = ?auto_401453 ?auto_401457 ) ) ( not ( = ?auto_401453 ?auto_401458 ) ) ( not ( = ?auto_401453 ?auto_401459 ) ) ( not ( = ?auto_401453 ?auto_401460 ) ) ( not ( = ?auto_401453 ?auto_401461 ) ) ( not ( = ?auto_401453 ?auto_401462 ) ) ( not ( = ?auto_401454 ?auto_401455 ) ) ( not ( = ?auto_401454 ?auto_401456 ) ) ( not ( = ?auto_401454 ?auto_401457 ) ) ( not ( = ?auto_401454 ?auto_401458 ) ) ( not ( = ?auto_401454 ?auto_401459 ) ) ( not ( = ?auto_401454 ?auto_401460 ) ) ( not ( = ?auto_401454 ?auto_401461 ) ) ( not ( = ?auto_401454 ?auto_401462 ) ) ( not ( = ?auto_401455 ?auto_401456 ) ) ( not ( = ?auto_401455 ?auto_401457 ) ) ( not ( = ?auto_401455 ?auto_401458 ) ) ( not ( = ?auto_401455 ?auto_401459 ) ) ( not ( = ?auto_401455 ?auto_401460 ) ) ( not ( = ?auto_401455 ?auto_401461 ) ) ( not ( = ?auto_401455 ?auto_401462 ) ) ( not ( = ?auto_401456 ?auto_401457 ) ) ( not ( = ?auto_401456 ?auto_401458 ) ) ( not ( = ?auto_401456 ?auto_401459 ) ) ( not ( = ?auto_401456 ?auto_401460 ) ) ( not ( = ?auto_401456 ?auto_401461 ) ) ( not ( = ?auto_401456 ?auto_401462 ) ) ( not ( = ?auto_401457 ?auto_401458 ) ) ( not ( = ?auto_401457 ?auto_401459 ) ) ( not ( = ?auto_401457 ?auto_401460 ) ) ( not ( = ?auto_401457 ?auto_401461 ) ) ( not ( = ?auto_401457 ?auto_401462 ) ) ( not ( = ?auto_401458 ?auto_401459 ) ) ( not ( = ?auto_401458 ?auto_401460 ) ) ( not ( = ?auto_401458 ?auto_401461 ) ) ( not ( = ?auto_401458 ?auto_401462 ) ) ( not ( = ?auto_401459 ?auto_401460 ) ) ( not ( = ?auto_401459 ?auto_401461 ) ) ( not ( = ?auto_401459 ?auto_401462 ) ) ( not ( = ?auto_401460 ?auto_401461 ) ) ( not ( = ?auto_401460 ?auto_401462 ) ) ( not ( = ?auto_401461 ?auto_401462 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_401462 )
      ( !STACK ?auto_401462 ?auto_401461 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401478 - BLOCK
      ?auto_401479 - BLOCK
      ?auto_401480 - BLOCK
      ?auto_401481 - BLOCK
      ?auto_401482 - BLOCK
      ?auto_401483 - BLOCK
      ?auto_401484 - BLOCK
      ?auto_401485 - BLOCK
      ?auto_401486 - BLOCK
      ?auto_401487 - BLOCK
      ?auto_401488 - BLOCK
      ?auto_401489 - BLOCK
      ?auto_401490 - BLOCK
      ?auto_401491 - BLOCK
      ?auto_401492 - BLOCK
    )
    :vars
    (
      ?auto_401493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401492 ?auto_401493 ) ( ON-TABLE ?auto_401478 ) ( ON ?auto_401479 ?auto_401478 ) ( ON ?auto_401480 ?auto_401479 ) ( ON ?auto_401481 ?auto_401480 ) ( ON ?auto_401482 ?auto_401481 ) ( ON ?auto_401483 ?auto_401482 ) ( ON ?auto_401484 ?auto_401483 ) ( ON ?auto_401485 ?auto_401484 ) ( ON ?auto_401486 ?auto_401485 ) ( ON ?auto_401487 ?auto_401486 ) ( ON ?auto_401488 ?auto_401487 ) ( ON ?auto_401489 ?auto_401488 ) ( ON ?auto_401490 ?auto_401489 ) ( not ( = ?auto_401478 ?auto_401479 ) ) ( not ( = ?auto_401478 ?auto_401480 ) ) ( not ( = ?auto_401478 ?auto_401481 ) ) ( not ( = ?auto_401478 ?auto_401482 ) ) ( not ( = ?auto_401478 ?auto_401483 ) ) ( not ( = ?auto_401478 ?auto_401484 ) ) ( not ( = ?auto_401478 ?auto_401485 ) ) ( not ( = ?auto_401478 ?auto_401486 ) ) ( not ( = ?auto_401478 ?auto_401487 ) ) ( not ( = ?auto_401478 ?auto_401488 ) ) ( not ( = ?auto_401478 ?auto_401489 ) ) ( not ( = ?auto_401478 ?auto_401490 ) ) ( not ( = ?auto_401478 ?auto_401491 ) ) ( not ( = ?auto_401478 ?auto_401492 ) ) ( not ( = ?auto_401478 ?auto_401493 ) ) ( not ( = ?auto_401479 ?auto_401480 ) ) ( not ( = ?auto_401479 ?auto_401481 ) ) ( not ( = ?auto_401479 ?auto_401482 ) ) ( not ( = ?auto_401479 ?auto_401483 ) ) ( not ( = ?auto_401479 ?auto_401484 ) ) ( not ( = ?auto_401479 ?auto_401485 ) ) ( not ( = ?auto_401479 ?auto_401486 ) ) ( not ( = ?auto_401479 ?auto_401487 ) ) ( not ( = ?auto_401479 ?auto_401488 ) ) ( not ( = ?auto_401479 ?auto_401489 ) ) ( not ( = ?auto_401479 ?auto_401490 ) ) ( not ( = ?auto_401479 ?auto_401491 ) ) ( not ( = ?auto_401479 ?auto_401492 ) ) ( not ( = ?auto_401479 ?auto_401493 ) ) ( not ( = ?auto_401480 ?auto_401481 ) ) ( not ( = ?auto_401480 ?auto_401482 ) ) ( not ( = ?auto_401480 ?auto_401483 ) ) ( not ( = ?auto_401480 ?auto_401484 ) ) ( not ( = ?auto_401480 ?auto_401485 ) ) ( not ( = ?auto_401480 ?auto_401486 ) ) ( not ( = ?auto_401480 ?auto_401487 ) ) ( not ( = ?auto_401480 ?auto_401488 ) ) ( not ( = ?auto_401480 ?auto_401489 ) ) ( not ( = ?auto_401480 ?auto_401490 ) ) ( not ( = ?auto_401480 ?auto_401491 ) ) ( not ( = ?auto_401480 ?auto_401492 ) ) ( not ( = ?auto_401480 ?auto_401493 ) ) ( not ( = ?auto_401481 ?auto_401482 ) ) ( not ( = ?auto_401481 ?auto_401483 ) ) ( not ( = ?auto_401481 ?auto_401484 ) ) ( not ( = ?auto_401481 ?auto_401485 ) ) ( not ( = ?auto_401481 ?auto_401486 ) ) ( not ( = ?auto_401481 ?auto_401487 ) ) ( not ( = ?auto_401481 ?auto_401488 ) ) ( not ( = ?auto_401481 ?auto_401489 ) ) ( not ( = ?auto_401481 ?auto_401490 ) ) ( not ( = ?auto_401481 ?auto_401491 ) ) ( not ( = ?auto_401481 ?auto_401492 ) ) ( not ( = ?auto_401481 ?auto_401493 ) ) ( not ( = ?auto_401482 ?auto_401483 ) ) ( not ( = ?auto_401482 ?auto_401484 ) ) ( not ( = ?auto_401482 ?auto_401485 ) ) ( not ( = ?auto_401482 ?auto_401486 ) ) ( not ( = ?auto_401482 ?auto_401487 ) ) ( not ( = ?auto_401482 ?auto_401488 ) ) ( not ( = ?auto_401482 ?auto_401489 ) ) ( not ( = ?auto_401482 ?auto_401490 ) ) ( not ( = ?auto_401482 ?auto_401491 ) ) ( not ( = ?auto_401482 ?auto_401492 ) ) ( not ( = ?auto_401482 ?auto_401493 ) ) ( not ( = ?auto_401483 ?auto_401484 ) ) ( not ( = ?auto_401483 ?auto_401485 ) ) ( not ( = ?auto_401483 ?auto_401486 ) ) ( not ( = ?auto_401483 ?auto_401487 ) ) ( not ( = ?auto_401483 ?auto_401488 ) ) ( not ( = ?auto_401483 ?auto_401489 ) ) ( not ( = ?auto_401483 ?auto_401490 ) ) ( not ( = ?auto_401483 ?auto_401491 ) ) ( not ( = ?auto_401483 ?auto_401492 ) ) ( not ( = ?auto_401483 ?auto_401493 ) ) ( not ( = ?auto_401484 ?auto_401485 ) ) ( not ( = ?auto_401484 ?auto_401486 ) ) ( not ( = ?auto_401484 ?auto_401487 ) ) ( not ( = ?auto_401484 ?auto_401488 ) ) ( not ( = ?auto_401484 ?auto_401489 ) ) ( not ( = ?auto_401484 ?auto_401490 ) ) ( not ( = ?auto_401484 ?auto_401491 ) ) ( not ( = ?auto_401484 ?auto_401492 ) ) ( not ( = ?auto_401484 ?auto_401493 ) ) ( not ( = ?auto_401485 ?auto_401486 ) ) ( not ( = ?auto_401485 ?auto_401487 ) ) ( not ( = ?auto_401485 ?auto_401488 ) ) ( not ( = ?auto_401485 ?auto_401489 ) ) ( not ( = ?auto_401485 ?auto_401490 ) ) ( not ( = ?auto_401485 ?auto_401491 ) ) ( not ( = ?auto_401485 ?auto_401492 ) ) ( not ( = ?auto_401485 ?auto_401493 ) ) ( not ( = ?auto_401486 ?auto_401487 ) ) ( not ( = ?auto_401486 ?auto_401488 ) ) ( not ( = ?auto_401486 ?auto_401489 ) ) ( not ( = ?auto_401486 ?auto_401490 ) ) ( not ( = ?auto_401486 ?auto_401491 ) ) ( not ( = ?auto_401486 ?auto_401492 ) ) ( not ( = ?auto_401486 ?auto_401493 ) ) ( not ( = ?auto_401487 ?auto_401488 ) ) ( not ( = ?auto_401487 ?auto_401489 ) ) ( not ( = ?auto_401487 ?auto_401490 ) ) ( not ( = ?auto_401487 ?auto_401491 ) ) ( not ( = ?auto_401487 ?auto_401492 ) ) ( not ( = ?auto_401487 ?auto_401493 ) ) ( not ( = ?auto_401488 ?auto_401489 ) ) ( not ( = ?auto_401488 ?auto_401490 ) ) ( not ( = ?auto_401488 ?auto_401491 ) ) ( not ( = ?auto_401488 ?auto_401492 ) ) ( not ( = ?auto_401488 ?auto_401493 ) ) ( not ( = ?auto_401489 ?auto_401490 ) ) ( not ( = ?auto_401489 ?auto_401491 ) ) ( not ( = ?auto_401489 ?auto_401492 ) ) ( not ( = ?auto_401489 ?auto_401493 ) ) ( not ( = ?auto_401490 ?auto_401491 ) ) ( not ( = ?auto_401490 ?auto_401492 ) ) ( not ( = ?auto_401490 ?auto_401493 ) ) ( not ( = ?auto_401491 ?auto_401492 ) ) ( not ( = ?auto_401491 ?auto_401493 ) ) ( not ( = ?auto_401492 ?auto_401493 ) ) ( CLEAR ?auto_401490 ) ( ON ?auto_401491 ?auto_401492 ) ( CLEAR ?auto_401491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_401478 ?auto_401479 ?auto_401480 ?auto_401481 ?auto_401482 ?auto_401483 ?auto_401484 ?auto_401485 ?auto_401486 ?auto_401487 ?auto_401488 ?auto_401489 ?auto_401490 ?auto_401491 )
      ( MAKE-15PILE ?auto_401478 ?auto_401479 ?auto_401480 ?auto_401481 ?auto_401482 ?auto_401483 ?auto_401484 ?auto_401485 ?auto_401486 ?auto_401487 ?auto_401488 ?auto_401489 ?auto_401490 ?auto_401491 ?auto_401492 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401509 - BLOCK
      ?auto_401510 - BLOCK
      ?auto_401511 - BLOCK
      ?auto_401512 - BLOCK
      ?auto_401513 - BLOCK
      ?auto_401514 - BLOCK
      ?auto_401515 - BLOCK
      ?auto_401516 - BLOCK
      ?auto_401517 - BLOCK
      ?auto_401518 - BLOCK
      ?auto_401519 - BLOCK
      ?auto_401520 - BLOCK
      ?auto_401521 - BLOCK
      ?auto_401522 - BLOCK
      ?auto_401523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_401523 ) ( ON-TABLE ?auto_401509 ) ( ON ?auto_401510 ?auto_401509 ) ( ON ?auto_401511 ?auto_401510 ) ( ON ?auto_401512 ?auto_401511 ) ( ON ?auto_401513 ?auto_401512 ) ( ON ?auto_401514 ?auto_401513 ) ( ON ?auto_401515 ?auto_401514 ) ( ON ?auto_401516 ?auto_401515 ) ( ON ?auto_401517 ?auto_401516 ) ( ON ?auto_401518 ?auto_401517 ) ( ON ?auto_401519 ?auto_401518 ) ( ON ?auto_401520 ?auto_401519 ) ( ON ?auto_401521 ?auto_401520 ) ( not ( = ?auto_401509 ?auto_401510 ) ) ( not ( = ?auto_401509 ?auto_401511 ) ) ( not ( = ?auto_401509 ?auto_401512 ) ) ( not ( = ?auto_401509 ?auto_401513 ) ) ( not ( = ?auto_401509 ?auto_401514 ) ) ( not ( = ?auto_401509 ?auto_401515 ) ) ( not ( = ?auto_401509 ?auto_401516 ) ) ( not ( = ?auto_401509 ?auto_401517 ) ) ( not ( = ?auto_401509 ?auto_401518 ) ) ( not ( = ?auto_401509 ?auto_401519 ) ) ( not ( = ?auto_401509 ?auto_401520 ) ) ( not ( = ?auto_401509 ?auto_401521 ) ) ( not ( = ?auto_401509 ?auto_401522 ) ) ( not ( = ?auto_401509 ?auto_401523 ) ) ( not ( = ?auto_401510 ?auto_401511 ) ) ( not ( = ?auto_401510 ?auto_401512 ) ) ( not ( = ?auto_401510 ?auto_401513 ) ) ( not ( = ?auto_401510 ?auto_401514 ) ) ( not ( = ?auto_401510 ?auto_401515 ) ) ( not ( = ?auto_401510 ?auto_401516 ) ) ( not ( = ?auto_401510 ?auto_401517 ) ) ( not ( = ?auto_401510 ?auto_401518 ) ) ( not ( = ?auto_401510 ?auto_401519 ) ) ( not ( = ?auto_401510 ?auto_401520 ) ) ( not ( = ?auto_401510 ?auto_401521 ) ) ( not ( = ?auto_401510 ?auto_401522 ) ) ( not ( = ?auto_401510 ?auto_401523 ) ) ( not ( = ?auto_401511 ?auto_401512 ) ) ( not ( = ?auto_401511 ?auto_401513 ) ) ( not ( = ?auto_401511 ?auto_401514 ) ) ( not ( = ?auto_401511 ?auto_401515 ) ) ( not ( = ?auto_401511 ?auto_401516 ) ) ( not ( = ?auto_401511 ?auto_401517 ) ) ( not ( = ?auto_401511 ?auto_401518 ) ) ( not ( = ?auto_401511 ?auto_401519 ) ) ( not ( = ?auto_401511 ?auto_401520 ) ) ( not ( = ?auto_401511 ?auto_401521 ) ) ( not ( = ?auto_401511 ?auto_401522 ) ) ( not ( = ?auto_401511 ?auto_401523 ) ) ( not ( = ?auto_401512 ?auto_401513 ) ) ( not ( = ?auto_401512 ?auto_401514 ) ) ( not ( = ?auto_401512 ?auto_401515 ) ) ( not ( = ?auto_401512 ?auto_401516 ) ) ( not ( = ?auto_401512 ?auto_401517 ) ) ( not ( = ?auto_401512 ?auto_401518 ) ) ( not ( = ?auto_401512 ?auto_401519 ) ) ( not ( = ?auto_401512 ?auto_401520 ) ) ( not ( = ?auto_401512 ?auto_401521 ) ) ( not ( = ?auto_401512 ?auto_401522 ) ) ( not ( = ?auto_401512 ?auto_401523 ) ) ( not ( = ?auto_401513 ?auto_401514 ) ) ( not ( = ?auto_401513 ?auto_401515 ) ) ( not ( = ?auto_401513 ?auto_401516 ) ) ( not ( = ?auto_401513 ?auto_401517 ) ) ( not ( = ?auto_401513 ?auto_401518 ) ) ( not ( = ?auto_401513 ?auto_401519 ) ) ( not ( = ?auto_401513 ?auto_401520 ) ) ( not ( = ?auto_401513 ?auto_401521 ) ) ( not ( = ?auto_401513 ?auto_401522 ) ) ( not ( = ?auto_401513 ?auto_401523 ) ) ( not ( = ?auto_401514 ?auto_401515 ) ) ( not ( = ?auto_401514 ?auto_401516 ) ) ( not ( = ?auto_401514 ?auto_401517 ) ) ( not ( = ?auto_401514 ?auto_401518 ) ) ( not ( = ?auto_401514 ?auto_401519 ) ) ( not ( = ?auto_401514 ?auto_401520 ) ) ( not ( = ?auto_401514 ?auto_401521 ) ) ( not ( = ?auto_401514 ?auto_401522 ) ) ( not ( = ?auto_401514 ?auto_401523 ) ) ( not ( = ?auto_401515 ?auto_401516 ) ) ( not ( = ?auto_401515 ?auto_401517 ) ) ( not ( = ?auto_401515 ?auto_401518 ) ) ( not ( = ?auto_401515 ?auto_401519 ) ) ( not ( = ?auto_401515 ?auto_401520 ) ) ( not ( = ?auto_401515 ?auto_401521 ) ) ( not ( = ?auto_401515 ?auto_401522 ) ) ( not ( = ?auto_401515 ?auto_401523 ) ) ( not ( = ?auto_401516 ?auto_401517 ) ) ( not ( = ?auto_401516 ?auto_401518 ) ) ( not ( = ?auto_401516 ?auto_401519 ) ) ( not ( = ?auto_401516 ?auto_401520 ) ) ( not ( = ?auto_401516 ?auto_401521 ) ) ( not ( = ?auto_401516 ?auto_401522 ) ) ( not ( = ?auto_401516 ?auto_401523 ) ) ( not ( = ?auto_401517 ?auto_401518 ) ) ( not ( = ?auto_401517 ?auto_401519 ) ) ( not ( = ?auto_401517 ?auto_401520 ) ) ( not ( = ?auto_401517 ?auto_401521 ) ) ( not ( = ?auto_401517 ?auto_401522 ) ) ( not ( = ?auto_401517 ?auto_401523 ) ) ( not ( = ?auto_401518 ?auto_401519 ) ) ( not ( = ?auto_401518 ?auto_401520 ) ) ( not ( = ?auto_401518 ?auto_401521 ) ) ( not ( = ?auto_401518 ?auto_401522 ) ) ( not ( = ?auto_401518 ?auto_401523 ) ) ( not ( = ?auto_401519 ?auto_401520 ) ) ( not ( = ?auto_401519 ?auto_401521 ) ) ( not ( = ?auto_401519 ?auto_401522 ) ) ( not ( = ?auto_401519 ?auto_401523 ) ) ( not ( = ?auto_401520 ?auto_401521 ) ) ( not ( = ?auto_401520 ?auto_401522 ) ) ( not ( = ?auto_401520 ?auto_401523 ) ) ( not ( = ?auto_401521 ?auto_401522 ) ) ( not ( = ?auto_401521 ?auto_401523 ) ) ( not ( = ?auto_401522 ?auto_401523 ) ) ( CLEAR ?auto_401521 ) ( ON ?auto_401522 ?auto_401523 ) ( CLEAR ?auto_401522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_401509 ?auto_401510 ?auto_401511 ?auto_401512 ?auto_401513 ?auto_401514 ?auto_401515 ?auto_401516 ?auto_401517 ?auto_401518 ?auto_401519 ?auto_401520 ?auto_401521 ?auto_401522 )
      ( MAKE-15PILE ?auto_401509 ?auto_401510 ?auto_401511 ?auto_401512 ?auto_401513 ?auto_401514 ?auto_401515 ?auto_401516 ?auto_401517 ?auto_401518 ?auto_401519 ?auto_401520 ?auto_401521 ?auto_401522 ?auto_401523 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401539 - BLOCK
      ?auto_401540 - BLOCK
      ?auto_401541 - BLOCK
      ?auto_401542 - BLOCK
      ?auto_401543 - BLOCK
      ?auto_401544 - BLOCK
      ?auto_401545 - BLOCK
      ?auto_401546 - BLOCK
      ?auto_401547 - BLOCK
      ?auto_401548 - BLOCK
      ?auto_401549 - BLOCK
      ?auto_401550 - BLOCK
      ?auto_401551 - BLOCK
      ?auto_401552 - BLOCK
      ?auto_401553 - BLOCK
    )
    :vars
    (
      ?auto_401554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401553 ?auto_401554 ) ( ON-TABLE ?auto_401539 ) ( ON ?auto_401540 ?auto_401539 ) ( ON ?auto_401541 ?auto_401540 ) ( ON ?auto_401542 ?auto_401541 ) ( ON ?auto_401543 ?auto_401542 ) ( ON ?auto_401544 ?auto_401543 ) ( ON ?auto_401545 ?auto_401544 ) ( ON ?auto_401546 ?auto_401545 ) ( ON ?auto_401547 ?auto_401546 ) ( ON ?auto_401548 ?auto_401547 ) ( ON ?auto_401549 ?auto_401548 ) ( ON ?auto_401550 ?auto_401549 ) ( not ( = ?auto_401539 ?auto_401540 ) ) ( not ( = ?auto_401539 ?auto_401541 ) ) ( not ( = ?auto_401539 ?auto_401542 ) ) ( not ( = ?auto_401539 ?auto_401543 ) ) ( not ( = ?auto_401539 ?auto_401544 ) ) ( not ( = ?auto_401539 ?auto_401545 ) ) ( not ( = ?auto_401539 ?auto_401546 ) ) ( not ( = ?auto_401539 ?auto_401547 ) ) ( not ( = ?auto_401539 ?auto_401548 ) ) ( not ( = ?auto_401539 ?auto_401549 ) ) ( not ( = ?auto_401539 ?auto_401550 ) ) ( not ( = ?auto_401539 ?auto_401551 ) ) ( not ( = ?auto_401539 ?auto_401552 ) ) ( not ( = ?auto_401539 ?auto_401553 ) ) ( not ( = ?auto_401539 ?auto_401554 ) ) ( not ( = ?auto_401540 ?auto_401541 ) ) ( not ( = ?auto_401540 ?auto_401542 ) ) ( not ( = ?auto_401540 ?auto_401543 ) ) ( not ( = ?auto_401540 ?auto_401544 ) ) ( not ( = ?auto_401540 ?auto_401545 ) ) ( not ( = ?auto_401540 ?auto_401546 ) ) ( not ( = ?auto_401540 ?auto_401547 ) ) ( not ( = ?auto_401540 ?auto_401548 ) ) ( not ( = ?auto_401540 ?auto_401549 ) ) ( not ( = ?auto_401540 ?auto_401550 ) ) ( not ( = ?auto_401540 ?auto_401551 ) ) ( not ( = ?auto_401540 ?auto_401552 ) ) ( not ( = ?auto_401540 ?auto_401553 ) ) ( not ( = ?auto_401540 ?auto_401554 ) ) ( not ( = ?auto_401541 ?auto_401542 ) ) ( not ( = ?auto_401541 ?auto_401543 ) ) ( not ( = ?auto_401541 ?auto_401544 ) ) ( not ( = ?auto_401541 ?auto_401545 ) ) ( not ( = ?auto_401541 ?auto_401546 ) ) ( not ( = ?auto_401541 ?auto_401547 ) ) ( not ( = ?auto_401541 ?auto_401548 ) ) ( not ( = ?auto_401541 ?auto_401549 ) ) ( not ( = ?auto_401541 ?auto_401550 ) ) ( not ( = ?auto_401541 ?auto_401551 ) ) ( not ( = ?auto_401541 ?auto_401552 ) ) ( not ( = ?auto_401541 ?auto_401553 ) ) ( not ( = ?auto_401541 ?auto_401554 ) ) ( not ( = ?auto_401542 ?auto_401543 ) ) ( not ( = ?auto_401542 ?auto_401544 ) ) ( not ( = ?auto_401542 ?auto_401545 ) ) ( not ( = ?auto_401542 ?auto_401546 ) ) ( not ( = ?auto_401542 ?auto_401547 ) ) ( not ( = ?auto_401542 ?auto_401548 ) ) ( not ( = ?auto_401542 ?auto_401549 ) ) ( not ( = ?auto_401542 ?auto_401550 ) ) ( not ( = ?auto_401542 ?auto_401551 ) ) ( not ( = ?auto_401542 ?auto_401552 ) ) ( not ( = ?auto_401542 ?auto_401553 ) ) ( not ( = ?auto_401542 ?auto_401554 ) ) ( not ( = ?auto_401543 ?auto_401544 ) ) ( not ( = ?auto_401543 ?auto_401545 ) ) ( not ( = ?auto_401543 ?auto_401546 ) ) ( not ( = ?auto_401543 ?auto_401547 ) ) ( not ( = ?auto_401543 ?auto_401548 ) ) ( not ( = ?auto_401543 ?auto_401549 ) ) ( not ( = ?auto_401543 ?auto_401550 ) ) ( not ( = ?auto_401543 ?auto_401551 ) ) ( not ( = ?auto_401543 ?auto_401552 ) ) ( not ( = ?auto_401543 ?auto_401553 ) ) ( not ( = ?auto_401543 ?auto_401554 ) ) ( not ( = ?auto_401544 ?auto_401545 ) ) ( not ( = ?auto_401544 ?auto_401546 ) ) ( not ( = ?auto_401544 ?auto_401547 ) ) ( not ( = ?auto_401544 ?auto_401548 ) ) ( not ( = ?auto_401544 ?auto_401549 ) ) ( not ( = ?auto_401544 ?auto_401550 ) ) ( not ( = ?auto_401544 ?auto_401551 ) ) ( not ( = ?auto_401544 ?auto_401552 ) ) ( not ( = ?auto_401544 ?auto_401553 ) ) ( not ( = ?auto_401544 ?auto_401554 ) ) ( not ( = ?auto_401545 ?auto_401546 ) ) ( not ( = ?auto_401545 ?auto_401547 ) ) ( not ( = ?auto_401545 ?auto_401548 ) ) ( not ( = ?auto_401545 ?auto_401549 ) ) ( not ( = ?auto_401545 ?auto_401550 ) ) ( not ( = ?auto_401545 ?auto_401551 ) ) ( not ( = ?auto_401545 ?auto_401552 ) ) ( not ( = ?auto_401545 ?auto_401553 ) ) ( not ( = ?auto_401545 ?auto_401554 ) ) ( not ( = ?auto_401546 ?auto_401547 ) ) ( not ( = ?auto_401546 ?auto_401548 ) ) ( not ( = ?auto_401546 ?auto_401549 ) ) ( not ( = ?auto_401546 ?auto_401550 ) ) ( not ( = ?auto_401546 ?auto_401551 ) ) ( not ( = ?auto_401546 ?auto_401552 ) ) ( not ( = ?auto_401546 ?auto_401553 ) ) ( not ( = ?auto_401546 ?auto_401554 ) ) ( not ( = ?auto_401547 ?auto_401548 ) ) ( not ( = ?auto_401547 ?auto_401549 ) ) ( not ( = ?auto_401547 ?auto_401550 ) ) ( not ( = ?auto_401547 ?auto_401551 ) ) ( not ( = ?auto_401547 ?auto_401552 ) ) ( not ( = ?auto_401547 ?auto_401553 ) ) ( not ( = ?auto_401547 ?auto_401554 ) ) ( not ( = ?auto_401548 ?auto_401549 ) ) ( not ( = ?auto_401548 ?auto_401550 ) ) ( not ( = ?auto_401548 ?auto_401551 ) ) ( not ( = ?auto_401548 ?auto_401552 ) ) ( not ( = ?auto_401548 ?auto_401553 ) ) ( not ( = ?auto_401548 ?auto_401554 ) ) ( not ( = ?auto_401549 ?auto_401550 ) ) ( not ( = ?auto_401549 ?auto_401551 ) ) ( not ( = ?auto_401549 ?auto_401552 ) ) ( not ( = ?auto_401549 ?auto_401553 ) ) ( not ( = ?auto_401549 ?auto_401554 ) ) ( not ( = ?auto_401550 ?auto_401551 ) ) ( not ( = ?auto_401550 ?auto_401552 ) ) ( not ( = ?auto_401550 ?auto_401553 ) ) ( not ( = ?auto_401550 ?auto_401554 ) ) ( not ( = ?auto_401551 ?auto_401552 ) ) ( not ( = ?auto_401551 ?auto_401553 ) ) ( not ( = ?auto_401551 ?auto_401554 ) ) ( not ( = ?auto_401552 ?auto_401553 ) ) ( not ( = ?auto_401552 ?auto_401554 ) ) ( not ( = ?auto_401553 ?auto_401554 ) ) ( ON ?auto_401552 ?auto_401553 ) ( CLEAR ?auto_401550 ) ( ON ?auto_401551 ?auto_401552 ) ( CLEAR ?auto_401551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_401539 ?auto_401540 ?auto_401541 ?auto_401542 ?auto_401543 ?auto_401544 ?auto_401545 ?auto_401546 ?auto_401547 ?auto_401548 ?auto_401549 ?auto_401550 ?auto_401551 )
      ( MAKE-15PILE ?auto_401539 ?auto_401540 ?auto_401541 ?auto_401542 ?auto_401543 ?auto_401544 ?auto_401545 ?auto_401546 ?auto_401547 ?auto_401548 ?auto_401549 ?auto_401550 ?auto_401551 ?auto_401552 ?auto_401553 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401570 - BLOCK
      ?auto_401571 - BLOCK
      ?auto_401572 - BLOCK
      ?auto_401573 - BLOCK
      ?auto_401574 - BLOCK
      ?auto_401575 - BLOCK
      ?auto_401576 - BLOCK
      ?auto_401577 - BLOCK
      ?auto_401578 - BLOCK
      ?auto_401579 - BLOCK
      ?auto_401580 - BLOCK
      ?auto_401581 - BLOCK
      ?auto_401582 - BLOCK
      ?auto_401583 - BLOCK
      ?auto_401584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_401584 ) ( ON-TABLE ?auto_401570 ) ( ON ?auto_401571 ?auto_401570 ) ( ON ?auto_401572 ?auto_401571 ) ( ON ?auto_401573 ?auto_401572 ) ( ON ?auto_401574 ?auto_401573 ) ( ON ?auto_401575 ?auto_401574 ) ( ON ?auto_401576 ?auto_401575 ) ( ON ?auto_401577 ?auto_401576 ) ( ON ?auto_401578 ?auto_401577 ) ( ON ?auto_401579 ?auto_401578 ) ( ON ?auto_401580 ?auto_401579 ) ( ON ?auto_401581 ?auto_401580 ) ( not ( = ?auto_401570 ?auto_401571 ) ) ( not ( = ?auto_401570 ?auto_401572 ) ) ( not ( = ?auto_401570 ?auto_401573 ) ) ( not ( = ?auto_401570 ?auto_401574 ) ) ( not ( = ?auto_401570 ?auto_401575 ) ) ( not ( = ?auto_401570 ?auto_401576 ) ) ( not ( = ?auto_401570 ?auto_401577 ) ) ( not ( = ?auto_401570 ?auto_401578 ) ) ( not ( = ?auto_401570 ?auto_401579 ) ) ( not ( = ?auto_401570 ?auto_401580 ) ) ( not ( = ?auto_401570 ?auto_401581 ) ) ( not ( = ?auto_401570 ?auto_401582 ) ) ( not ( = ?auto_401570 ?auto_401583 ) ) ( not ( = ?auto_401570 ?auto_401584 ) ) ( not ( = ?auto_401571 ?auto_401572 ) ) ( not ( = ?auto_401571 ?auto_401573 ) ) ( not ( = ?auto_401571 ?auto_401574 ) ) ( not ( = ?auto_401571 ?auto_401575 ) ) ( not ( = ?auto_401571 ?auto_401576 ) ) ( not ( = ?auto_401571 ?auto_401577 ) ) ( not ( = ?auto_401571 ?auto_401578 ) ) ( not ( = ?auto_401571 ?auto_401579 ) ) ( not ( = ?auto_401571 ?auto_401580 ) ) ( not ( = ?auto_401571 ?auto_401581 ) ) ( not ( = ?auto_401571 ?auto_401582 ) ) ( not ( = ?auto_401571 ?auto_401583 ) ) ( not ( = ?auto_401571 ?auto_401584 ) ) ( not ( = ?auto_401572 ?auto_401573 ) ) ( not ( = ?auto_401572 ?auto_401574 ) ) ( not ( = ?auto_401572 ?auto_401575 ) ) ( not ( = ?auto_401572 ?auto_401576 ) ) ( not ( = ?auto_401572 ?auto_401577 ) ) ( not ( = ?auto_401572 ?auto_401578 ) ) ( not ( = ?auto_401572 ?auto_401579 ) ) ( not ( = ?auto_401572 ?auto_401580 ) ) ( not ( = ?auto_401572 ?auto_401581 ) ) ( not ( = ?auto_401572 ?auto_401582 ) ) ( not ( = ?auto_401572 ?auto_401583 ) ) ( not ( = ?auto_401572 ?auto_401584 ) ) ( not ( = ?auto_401573 ?auto_401574 ) ) ( not ( = ?auto_401573 ?auto_401575 ) ) ( not ( = ?auto_401573 ?auto_401576 ) ) ( not ( = ?auto_401573 ?auto_401577 ) ) ( not ( = ?auto_401573 ?auto_401578 ) ) ( not ( = ?auto_401573 ?auto_401579 ) ) ( not ( = ?auto_401573 ?auto_401580 ) ) ( not ( = ?auto_401573 ?auto_401581 ) ) ( not ( = ?auto_401573 ?auto_401582 ) ) ( not ( = ?auto_401573 ?auto_401583 ) ) ( not ( = ?auto_401573 ?auto_401584 ) ) ( not ( = ?auto_401574 ?auto_401575 ) ) ( not ( = ?auto_401574 ?auto_401576 ) ) ( not ( = ?auto_401574 ?auto_401577 ) ) ( not ( = ?auto_401574 ?auto_401578 ) ) ( not ( = ?auto_401574 ?auto_401579 ) ) ( not ( = ?auto_401574 ?auto_401580 ) ) ( not ( = ?auto_401574 ?auto_401581 ) ) ( not ( = ?auto_401574 ?auto_401582 ) ) ( not ( = ?auto_401574 ?auto_401583 ) ) ( not ( = ?auto_401574 ?auto_401584 ) ) ( not ( = ?auto_401575 ?auto_401576 ) ) ( not ( = ?auto_401575 ?auto_401577 ) ) ( not ( = ?auto_401575 ?auto_401578 ) ) ( not ( = ?auto_401575 ?auto_401579 ) ) ( not ( = ?auto_401575 ?auto_401580 ) ) ( not ( = ?auto_401575 ?auto_401581 ) ) ( not ( = ?auto_401575 ?auto_401582 ) ) ( not ( = ?auto_401575 ?auto_401583 ) ) ( not ( = ?auto_401575 ?auto_401584 ) ) ( not ( = ?auto_401576 ?auto_401577 ) ) ( not ( = ?auto_401576 ?auto_401578 ) ) ( not ( = ?auto_401576 ?auto_401579 ) ) ( not ( = ?auto_401576 ?auto_401580 ) ) ( not ( = ?auto_401576 ?auto_401581 ) ) ( not ( = ?auto_401576 ?auto_401582 ) ) ( not ( = ?auto_401576 ?auto_401583 ) ) ( not ( = ?auto_401576 ?auto_401584 ) ) ( not ( = ?auto_401577 ?auto_401578 ) ) ( not ( = ?auto_401577 ?auto_401579 ) ) ( not ( = ?auto_401577 ?auto_401580 ) ) ( not ( = ?auto_401577 ?auto_401581 ) ) ( not ( = ?auto_401577 ?auto_401582 ) ) ( not ( = ?auto_401577 ?auto_401583 ) ) ( not ( = ?auto_401577 ?auto_401584 ) ) ( not ( = ?auto_401578 ?auto_401579 ) ) ( not ( = ?auto_401578 ?auto_401580 ) ) ( not ( = ?auto_401578 ?auto_401581 ) ) ( not ( = ?auto_401578 ?auto_401582 ) ) ( not ( = ?auto_401578 ?auto_401583 ) ) ( not ( = ?auto_401578 ?auto_401584 ) ) ( not ( = ?auto_401579 ?auto_401580 ) ) ( not ( = ?auto_401579 ?auto_401581 ) ) ( not ( = ?auto_401579 ?auto_401582 ) ) ( not ( = ?auto_401579 ?auto_401583 ) ) ( not ( = ?auto_401579 ?auto_401584 ) ) ( not ( = ?auto_401580 ?auto_401581 ) ) ( not ( = ?auto_401580 ?auto_401582 ) ) ( not ( = ?auto_401580 ?auto_401583 ) ) ( not ( = ?auto_401580 ?auto_401584 ) ) ( not ( = ?auto_401581 ?auto_401582 ) ) ( not ( = ?auto_401581 ?auto_401583 ) ) ( not ( = ?auto_401581 ?auto_401584 ) ) ( not ( = ?auto_401582 ?auto_401583 ) ) ( not ( = ?auto_401582 ?auto_401584 ) ) ( not ( = ?auto_401583 ?auto_401584 ) ) ( ON ?auto_401583 ?auto_401584 ) ( CLEAR ?auto_401581 ) ( ON ?auto_401582 ?auto_401583 ) ( CLEAR ?auto_401582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_401570 ?auto_401571 ?auto_401572 ?auto_401573 ?auto_401574 ?auto_401575 ?auto_401576 ?auto_401577 ?auto_401578 ?auto_401579 ?auto_401580 ?auto_401581 ?auto_401582 )
      ( MAKE-15PILE ?auto_401570 ?auto_401571 ?auto_401572 ?auto_401573 ?auto_401574 ?auto_401575 ?auto_401576 ?auto_401577 ?auto_401578 ?auto_401579 ?auto_401580 ?auto_401581 ?auto_401582 ?auto_401583 ?auto_401584 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401600 - BLOCK
      ?auto_401601 - BLOCK
      ?auto_401602 - BLOCK
      ?auto_401603 - BLOCK
      ?auto_401604 - BLOCK
      ?auto_401605 - BLOCK
      ?auto_401606 - BLOCK
      ?auto_401607 - BLOCK
      ?auto_401608 - BLOCK
      ?auto_401609 - BLOCK
      ?auto_401610 - BLOCK
      ?auto_401611 - BLOCK
      ?auto_401612 - BLOCK
      ?auto_401613 - BLOCK
      ?auto_401614 - BLOCK
    )
    :vars
    (
      ?auto_401615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401614 ?auto_401615 ) ( ON-TABLE ?auto_401600 ) ( ON ?auto_401601 ?auto_401600 ) ( ON ?auto_401602 ?auto_401601 ) ( ON ?auto_401603 ?auto_401602 ) ( ON ?auto_401604 ?auto_401603 ) ( ON ?auto_401605 ?auto_401604 ) ( ON ?auto_401606 ?auto_401605 ) ( ON ?auto_401607 ?auto_401606 ) ( ON ?auto_401608 ?auto_401607 ) ( ON ?auto_401609 ?auto_401608 ) ( ON ?auto_401610 ?auto_401609 ) ( not ( = ?auto_401600 ?auto_401601 ) ) ( not ( = ?auto_401600 ?auto_401602 ) ) ( not ( = ?auto_401600 ?auto_401603 ) ) ( not ( = ?auto_401600 ?auto_401604 ) ) ( not ( = ?auto_401600 ?auto_401605 ) ) ( not ( = ?auto_401600 ?auto_401606 ) ) ( not ( = ?auto_401600 ?auto_401607 ) ) ( not ( = ?auto_401600 ?auto_401608 ) ) ( not ( = ?auto_401600 ?auto_401609 ) ) ( not ( = ?auto_401600 ?auto_401610 ) ) ( not ( = ?auto_401600 ?auto_401611 ) ) ( not ( = ?auto_401600 ?auto_401612 ) ) ( not ( = ?auto_401600 ?auto_401613 ) ) ( not ( = ?auto_401600 ?auto_401614 ) ) ( not ( = ?auto_401600 ?auto_401615 ) ) ( not ( = ?auto_401601 ?auto_401602 ) ) ( not ( = ?auto_401601 ?auto_401603 ) ) ( not ( = ?auto_401601 ?auto_401604 ) ) ( not ( = ?auto_401601 ?auto_401605 ) ) ( not ( = ?auto_401601 ?auto_401606 ) ) ( not ( = ?auto_401601 ?auto_401607 ) ) ( not ( = ?auto_401601 ?auto_401608 ) ) ( not ( = ?auto_401601 ?auto_401609 ) ) ( not ( = ?auto_401601 ?auto_401610 ) ) ( not ( = ?auto_401601 ?auto_401611 ) ) ( not ( = ?auto_401601 ?auto_401612 ) ) ( not ( = ?auto_401601 ?auto_401613 ) ) ( not ( = ?auto_401601 ?auto_401614 ) ) ( not ( = ?auto_401601 ?auto_401615 ) ) ( not ( = ?auto_401602 ?auto_401603 ) ) ( not ( = ?auto_401602 ?auto_401604 ) ) ( not ( = ?auto_401602 ?auto_401605 ) ) ( not ( = ?auto_401602 ?auto_401606 ) ) ( not ( = ?auto_401602 ?auto_401607 ) ) ( not ( = ?auto_401602 ?auto_401608 ) ) ( not ( = ?auto_401602 ?auto_401609 ) ) ( not ( = ?auto_401602 ?auto_401610 ) ) ( not ( = ?auto_401602 ?auto_401611 ) ) ( not ( = ?auto_401602 ?auto_401612 ) ) ( not ( = ?auto_401602 ?auto_401613 ) ) ( not ( = ?auto_401602 ?auto_401614 ) ) ( not ( = ?auto_401602 ?auto_401615 ) ) ( not ( = ?auto_401603 ?auto_401604 ) ) ( not ( = ?auto_401603 ?auto_401605 ) ) ( not ( = ?auto_401603 ?auto_401606 ) ) ( not ( = ?auto_401603 ?auto_401607 ) ) ( not ( = ?auto_401603 ?auto_401608 ) ) ( not ( = ?auto_401603 ?auto_401609 ) ) ( not ( = ?auto_401603 ?auto_401610 ) ) ( not ( = ?auto_401603 ?auto_401611 ) ) ( not ( = ?auto_401603 ?auto_401612 ) ) ( not ( = ?auto_401603 ?auto_401613 ) ) ( not ( = ?auto_401603 ?auto_401614 ) ) ( not ( = ?auto_401603 ?auto_401615 ) ) ( not ( = ?auto_401604 ?auto_401605 ) ) ( not ( = ?auto_401604 ?auto_401606 ) ) ( not ( = ?auto_401604 ?auto_401607 ) ) ( not ( = ?auto_401604 ?auto_401608 ) ) ( not ( = ?auto_401604 ?auto_401609 ) ) ( not ( = ?auto_401604 ?auto_401610 ) ) ( not ( = ?auto_401604 ?auto_401611 ) ) ( not ( = ?auto_401604 ?auto_401612 ) ) ( not ( = ?auto_401604 ?auto_401613 ) ) ( not ( = ?auto_401604 ?auto_401614 ) ) ( not ( = ?auto_401604 ?auto_401615 ) ) ( not ( = ?auto_401605 ?auto_401606 ) ) ( not ( = ?auto_401605 ?auto_401607 ) ) ( not ( = ?auto_401605 ?auto_401608 ) ) ( not ( = ?auto_401605 ?auto_401609 ) ) ( not ( = ?auto_401605 ?auto_401610 ) ) ( not ( = ?auto_401605 ?auto_401611 ) ) ( not ( = ?auto_401605 ?auto_401612 ) ) ( not ( = ?auto_401605 ?auto_401613 ) ) ( not ( = ?auto_401605 ?auto_401614 ) ) ( not ( = ?auto_401605 ?auto_401615 ) ) ( not ( = ?auto_401606 ?auto_401607 ) ) ( not ( = ?auto_401606 ?auto_401608 ) ) ( not ( = ?auto_401606 ?auto_401609 ) ) ( not ( = ?auto_401606 ?auto_401610 ) ) ( not ( = ?auto_401606 ?auto_401611 ) ) ( not ( = ?auto_401606 ?auto_401612 ) ) ( not ( = ?auto_401606 ?auto_401613 ) ) ( not ( = ?auto_401606 ?auto_401614 ) ) ( not ( = ?auto_401606 ?auto_401615 ) ) ( not ( = ?auto_401607 ?auto_401608 ) ) ( not ( = ?auto_401607 ?auto_401609 ) ) ( not ( = ?auto_401607 ?auto_401610 ) ) ( not ( = ?auto_401607 ?auto_401611 ) ) ( not ( = ?auto_401607 ?auto_401612 ) ) ( not ( = ?auto_401607 ?auto_401613 ) ) ( not ( = ?auto_401607 ?auto_401614 ) ) ( not ( = ?auto_401607 ?auto_401615 ) ) ( not ( = ?auto_401608 ?auto_401609 ) ) ( not ( = ?auto_401608 ?auto_401610 ) ) ( not ( = ?auto_401608 ?auto_401611 ) ) ( not ( = ?auto_401608 ?auto_401612 ) ) ( not ( = ?auto_401608 ?auto_401613 ) ) ( not ( = ?auto_401608 ?auto_401614 ) ) ( not ( = ?auto_401608 ?auto_401615 ) ) ( not ( = ?auto_401609 ?auto_401610 ) ) ( not ( = ?auto_401609 ?auto_401611 ) ) ( not ( = ?auto_401609 ?auto_401612 ) ) ( not ( = ?auto_401609 ?auto_401613 ) ) ( not ( = ?auto_401609 ?auto_401614 ) ) ( not ( = ?auto_401609 ?auto_401615 ) ) ( not ( = ?auto_401610 ?auto_401611 ) ) ( not ( = ?auto_401610 ?auto_401612 ) ) ( not ( = ?auto_401610 ?auto_401613 ) ) ( not ( = ?auto_401610 ?auto_401614 ) ) ( not ( = ?auto_401610 ?auto_401615 ) ) ( not ( = ?auto_401611 ?auto_401612 ) ) ( not ( = ?auto_401611 ?auto_401613 ) ) ( not ( = ?auto_401611 ?auto_401614 ) ) ( not ( = ?auto_401611 ?auto_401615 ) ) ( not ( = ?auto_401612 ?auto_401613 ) ) ( not ( = ?auto_401612 ?auto_401614 ) ) ( not ( = ?auto_401612 ?auto_401615 ) ) ( not ( = ?auto_401613 ?auto_401614 ) ) ( not ( = ?auto_401613 ?auto_401615 ) ) ( not ( = ?auto_401614 ?auto_401615 ) ) ( ON ?auto_401613 ?auto_401614 ) ( ON ?auto_401612 ?auto_401613 ) ( CLEAR ?auto_401610 ) ( ON ?auto_401611 ?auto_401612 ) ( CLEAR ?auto_401611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_401600 ?auto_401601 ?auto_401602 ?auto_401603 ?auto_401604 ?auto_401605 ?auto_401606 ?auto_401607 ?auto_401608 ?auto_401609 ?auto_401610 ?auto_401611 )
      ( MAKE-15PILE ?auto_401600 ?auto_401601 ?auto_401602 ?auto_401603 ?auto_401604 ?auto_401605 ?auto_401606 ?auto_401607 ?auto_401608 ?auto_401609 ?auto_401610 ?auto_401611 ?auto_401612 ?auto_401613 ?auto_401614 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401631 - BLOCK
      ?auto_401632 - BLOCK
      ?auto_401633 - BLOCK
      ?auto_401634 - BLOCK
      ?auto_401635 - BLOCK
      ?auto_401636 - BLOCK
      ?auto_401637 - BLOCK
      ?auto_401638 - BLOCK
      ?auto_401639 - BLOCK
      ?auto_401640 - BLOCK
      ?auto_401641 - BLOCK
      ?auto_401642 - BLOCK
      ?auto_401643 - BLOCK
      ?auto_401644 - BLOCK
      ?auto_401645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_401645 ) ( ON-TABLE ?auto_401631 ) ( ON ?auto_401632 ?auto_401631 ) ( ON ?auto_401633 ?auto_401632 ) ( ON ?auto_401634 ?auto_401633 ) ( ON ?auto_401635 ?auto_401634 ) ( ON ?auto_401636 ?auto_401635 ) ( ON ?auto_401637 ?auto_401636 ) ( ON ?auto_401638 ?auto_401637 ) ( ON ?auto_401639 ?auto_401638 ) ( ON ?auto_401640 ?auto_401639 ) ( ON ?auto_401641 ?auto_401640 ) ( not ( = ?auto_401631 ?auto_401632 ) ) ( not ( = ?auto_401631 ?auto_401633 ) ) ( not ( = ?auto_401631 ?auto_401634 ) ) ( not ( = ?auto_401631 ?auto_401635 ) ) ( not ( = ?auto_401631 ?auto_401636 ) ) ( not ( = ?auto_401631 ?auto_401637 ) ) ( not ( = ?auto_401631 ?auto_401638 ) ) ( not ( = ?auto_401631 ?auto_401639 ) ) ( not ( = ?auto_401631 ?auto_401640 ) ) ( not ( = ?auto_401631 ?auto_401641 ) ) ( not ( = ?auto_401631 ?auto_401642 ) ) ( not ( = ?auto_401631 ?auto_401643 ) ) ( not ( = ?auto_401631 ?auto_401644 ) ) ( not ( = ?auto_401631 ?auto_401645 ) ) ( not ( = ?auto_401632 ?auto_401633 ) ) ( not ( = ?auto_401632 ?auto_401634 ) ) ( not ( = ?auto_401632 ?auto_401635 ) ) ( not ( = ?auto_401632 ?auto_401636 ) ) ( not ( = ?auto_401632 ?auto_401637 ) ) ( not ( = ?auto_401632 ?auto_401638 ) ) ( not ( = ?auto_401632 ?auto_401639 ) ) ( not ( = ?auto_401632 ?auto_401640 ) ) ( not ( = ?auto_401632 ?auto_401641 ) ) ( not ( = ?auto_401632 ?auto_401642 ) ) ( not ( = ?auto_401632 ?auto_401643 ) ) ( not ( = ?auto_401632 ?auto_401644 ) ) ( not ( = ?auto_401632 ?auto_401645 ) ) ( not ( = ?auto_401633 ?auto_401634 ) ) ( not ( = ?auto_401633 ?auto_401635 ) ) ( not ( = ?auto_401633 ?auto_401636 ) ) ( not ( = ?auto_401633 ?auto_401637 ) ) ( not ( = ?auto_401633 ?auto_401638 ) ) ( not ( = ?auto_401633 ?auto_401639 ) ) ( not ( = ?auto_401633 ?auto_401640 ) ) ( not ( = ?auto_401633 ?auto_401641 ) ) ( not ( = ?auto_401633 ?auto_401642 ) ) ( not ( = ?auto_401633 ?auto_401643 ) ) ( not ( = ?auto_401633 ?auto_401644 ) ) ( not ( = ?auto_401633 ?auto_401645 ) ) ( not ( = ?auto_401634 ?auto_401635 ) ) ( not ( = ?auto_401634 ?auto_401636 ) ) ( not ( = ?auto_401634 ?auto_401637 ) ) ( not ( = ?auto_401634 ?auto_401638 ) ) ( not ( = ?auto_401634 ?auto_401639 ) ) ( not ( = ?auto_401634 ?auto_401640 ) ) ( not ( = ?auto_401634 ?auto_401641 ) ) ( not ( = ?auto_401634 ?auto_401642 ) ) ( not ( = ?auto_401634 ?auto_401643 ) ) ( not ( = ?auto_401634 ?auto_401644 ) ) ( not ( = ?auto_401634 ?auto_401645 ) ) ( not ( = ?auto_401635 ?auto_401636 ) ) ( not ( = ?auto_401635 ?auto_401637 ) ) ( not ( = ?auto_401635 ?auto_401638 ) ) ( not ( = ?auto_401635 ?auto_401639 ) ) ( not ( = ?auto_401635 ?auto_401640 ) ) ( not ( = ?auto_401635 ?auto_401641 ) ) ( not ( = ?auto_401635 ?auto_401642 ) ) ( not ( = ?auto_401635 ?auto_401643 ) ) ( not ( = ?auto_401635 ?auto_401644 ) ) ( not ( = ?auto_401635 ?auto_401645 ) ) ( not ( = ?auto_401636 ?auto_401637 ) ) ( not ( = ?auto_401636 ?auto_401638 ) ) ( not ( = ?auto_401636 ?auto_401639 ) ) ( not ( = ?auto_401636 ?auto_401640 ) ) ( not ( = ?auto_401636 ?auto_401641 ) ) ( not ( = ?auto_401636 ?auto_401642 ) ) ( not ( = ?auto_401636 ?auto_401643 ) ) ( not ( = ?auto_401636 ?auto_401644 ) ) ( not ( = ?auto_401636 ?auto_401645 ) ) ( not ( = ?auto_401637 ?auto_401638 ) ) ( not ( = ?auto_401637 ?auto_401639 ) ) ( not ( = ?auto_401637 ?auto_401640 ) ) ( not ( = ?auto_401637 ?auto_401641 ) ) ( not ( = ?auto_401637 ?auto_401642 ) ) ( not ( = ?auto_401637 ?auto_401643 ) ) ( not ( = ?auto_401637 ?auto_401644 ) ) ( not ( = ?auto_401637 ?auto_401645 ) ) ( not ( = ?auto_401638 ?auto_401639 ) ) ( not ( = ?auto_401638 ?auto_401640 ) ) ( not ( = ?auto_401638 ?auto_401641 ) ) ( not ( = ?auto_401638 ?auto_401642 ) ) ( not ( = ?auto_401638 ?auto_401643 ) ) ( not ( = ?auto_401638 ?auto_401644 ) ) ( not ( = ?auto_401638 ?auto_401645 ) ) ( not ( = ?auto_401639 ?auto_401640 ) ) ( not ( = ?auto_401639 ?auto_401641 ) ) ( not ( = ?auto_401639 ?auto_401642 ) ) ( not ( = ?auto_401639 ?auto_401643 ) ) ( not ( = ?auto_401639 ?auto_401644 ) ) ( not ( = ?auto_401639 ?auto_401645 ) ) ( not ( = ?auto_401640 ?auto_401641 ) ) ( not ( = ?auto_401640 ?auto_401642 ) ) ( not ( = ?auto_401640 ?auto_401643 ) ) ( not ( = ?auto_401640 ?auto_401644 ) ) ( not ( = ?auto_401640 ?auto_401645 ) ) ( not ( = ?auto_401641 ?auto_401642 ) ) ( not ( = ?auto_401641 ?auto_401643 ) ) ( not ( = ?auto_401641 ?auto_401644 ) ) ( not ( = ?auto_401641 ?auto_401645 ) ) ( not ( = ?auto_401642 ?auto_401643 ) ) ( not ( = ?auto_401642 ?auto_401644 ) ) ( not ( = ?auto_401642 ?auto_401645 ) ) ( not ( = ?auto_401643 ?auto_401644 ) ) ( not ( = ?auto_401643 ?auto_401645 ) ) ( not ( = ?auto_401644 ?auto_401645 ) ) ( ON ?auto_401644 ?auto_401645 ) ( ON ?auto_401643 ?auto_401644 ) ( CLEAR ?auto_401641 ) ( ON ?auto_401642 ?auto_401643 ) ( CLEAR ?auto_401642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_401631 ?auto_401632 ?auto_401633 ?auto_401634 ?auto_401635 ?auto_401636 ?auto_401637 ?auto_401638 ?auto_401639 ?auto_401640 ?auto_401641 ?auto_401642 )
      ( MAKE-15PILE ?auto_401631 ?auto_401632 ?auto_401633 ?auto_401634 ?auto_401635 ?auto_401636 ?auto_401637 ?auto_401638 ?auto_401639 ?auto_401640 ?auto_401641 ?auto_401642 ?auto_401643 ?auto_401644 ?auto_401645 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401661 - BLOCK
      ?auto_401662 - BLOCK
      ?auto_401663 - BLOCK
      ?auto_401664 - BLOCK
      ?auto_401665 - BLOCK
      ?auto_401666 - BLOCK
      ?auto_401667 - BLOCK
      ?auto_401668 - BLOCK
      ?auto_401669 - BLOCK
      ?auto_401670 - BLOCK
      ?auto_401671 - BLOCK
      ?auto_401672 - BLOCK
      ?auto_401673 - BLOCK
      ?auto_401674 - BLOCK
      ?auto_401675 - BLOCK
    )
    :vars
    (
      ?auto_401676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401675 ?auto_401676 ) ( ON-TABLE ?auto_401661 ) ( ON ?auto_401662 ?auto_401661 ) ( ON ?auto_401663 ?auto_401662 ) ( ON ?auto_401664 ?auto_401663 ) ( ON ?auto_401665 ?auto_401664 ) ( ON ?auto_401666 ?auto_401665 ) ( ON ?auto_401667 ?auto_401666 ) ( ON ?auto_401668 ?auto_401667 ) ( ON ?auto_401669 ?auto_401668 ) ( ON ?auto_401670 ?auto_401669 ) ( not ( = ?auto_401661 ?auto_401662 ) ) ( not ( = ?auto_401661 ?auto_401663 ) ) ( not ( = ?auto_401661 ?auto_401664 ) ) ( not ( = ?auto_401661 ?auto_401665 ) ) ( not ( = ?auto_401661 ?auto_401666 ) ) ( not ( = ?auto_401661 ?auto_401667 ) ) ( not ( = ?auto_401661 ?auto_401668 ) ) ( not ( = ?auto_401661 ?auto_401669 ) ) ( not ( = ?auto_401661 ?auto_401670 ) ) ( not ( = ?auto_401661 ?auto_401671 ) ) ( not ( = ?auto_401661 ?auto_401672 ) ) ( not ( = ?auto_401661 ?auto_401673 ) ) ( not ( = ?auto_401661 ?auto_401674 ) ) ( not ( = ?auto_401661 ?auto_401675 ) ) ( not ( = ?auto_401661 ?auto_401676 ) ) ( not ( = ?auto_401662 ?auto_401663 ) ) ( not ( = ?auto_401662 ?auto_401664 ) ) ( not ( = ?auto_401662 ?auto_401665 ) ) ( not ( = ?auto_401662 ?auto_401666 ) ) ( not ( = ?auto_401662 ?auto_401667 ) ) ( not ( = ?auto_401662 ?auto_401668 ) ) ( not ( = ?auto_401662 ?auto_401669 ) ) ( not ( = ?auto_401662 ?auto_401670 ) ) ( not ( = ?auto_401662 ?auto_401671 ) ) ( not ( = ?auto_401662 ?auto_401672 ) ) ( not ( = ?auto_401662 ?auto_401673 ) ) ( not ( = ?auto_401662 ?auto_401674 ) ) ( not ( = ?auto_401662 ?auto_401675 ) ) ( not ( = ?auto_401662 ?auto_401676 ) ) ( not ( = ?auto_401663 ?auto_401664 ) ) ( not ( = ?auto_401663 ?auto_401665 ) ) ( not ( = ?auto_401663 ?auto_401666 ) ) ( not ( = ?auto_401663 ?auto_401667 ) ) ( not ( = ?auto_401663 ?auto_401668 ) ) ( not ( = ?auto_401663 ?auto_401669 ) ) ( not ( = ?auto_401663 ?auto_401670 ) ) ( not ( = ?auto_401663 ?auto_401671 ) ) ( not ( = ?auto_401663 ?auto_401672 ) ) ( not ( = ?auto_401663 ?auto_401673 ) ) ( not ( = ?auto_401663 ?auto_401674 ) ) ( not ( = ?auto_401663 ?auto_401675 ) ) ( not ( = ?auto_401663 ?auto_401676 ) ) ( not ( = ?auto_401664 ?auto_401665 ) ) ( not ( = ?auto_401664 ?auto_401666 ) ) ( not ( = ?auto_401664 ?auto_401667 ) ) ( not ( = ?auto_401664 ?auto_401668 ) ) ( not ( = ?auto_401664 ?auto_401669 ) ) ( not ( = ?auto_401664 ?auto_401670 ) ) ( not ( = ?auto_401664 ?auto_401671 ) ) ( not ( = ?auto_401664 ?auto_401672 ) ) ( not ( = ?auto_401664 ?auto_401673 ) ) ( not ( = ?auto_401664 ?auto_401674 ) ) ( not ( = ?auto_401664 ?auto_401675 ) ) ( not ( = ?auto_401664 ?auto_401676 ) ) ( not ( = ?auto_401665 ?auto_401666 ) ) ( not ( = ?auto_401665 ?auto_401667 ) ) ( not ( = ?auto_401665 ?auto_401668 ) ) ( not ( = ?auto_401665 ?auto_401669 ) ) ( not ( = ?auto_401665 ?auto_401670 ) ) ( not ( = ?auto_401665 ?auto_401671 ) ) ( not ( = ?auto_401665 ?auto_401672 ) ) ( not ( = ?auto_401665 ?auto_401673 ) ) ( not ( = ?auto_401665 ?auto_401674 ) ) ( not ( = ?auto_401665 ?auto_401675 ) ) ( not ( = ?auto_401665 ?auto_401676 ) ) ( not ( = ?auto_401666 ?auto_401667 ) ) ( not ( = ?auto_401666 ?auto_401668 ) ) ( not ( = ?auto_401666 ?auto_401669 ) ) ( not ( = ?auto_401666 ?auto_401670 ) ) ( not ( = ?auto_401666 ?auto_401671 ) ) ( not ( = ?auto_401666 ?auto_401672 ) ) ( not ( = ?auto_401666 ?auto_401673 ) ) ( not ( = ?auto_401666 ?auto_401674 ) ) ( not ( = ?auto_401666 ?auto_401675 ) ) ( not ( = ?auto_401666 ?auto_401676 ) ) ( not ( = ?auto_401667 ?auto_401668 ) ) ( not ( = ?auto_401667 ?auto_401669 ) ) ( not ( = ?auto_401667 ?auto_401670 ) ) ( not ( = ?auto_401667 ?auto_401671 ) ) ( not ( = ?auto_401667 ?auto_401672 ) ) ( not ( = ?auto_401667 ?auto_401673 ) ) ( not ( = ?auto_401667 ?auto_401674 ) ) ( not ( = ?auto_401667 ?auto_401675 ) ) ( not ( = ?auto_401667 ?auto_401676 ) ) ( not ( = ?auto_401668 ?auto_401669 ) ) ( not ( = ?auto_401668 ?auto_401670 ) ) ( not ( = ?auto_401668 ?auto_401671 ) ) ( not ( = ?auto_401668 ?auto_401672 ) ) ( not ( = ?auto_401668 ?auto_401673 ) ) ( not ( = ?auto_401668 ?auto_401674 ) ) ( not ( = ?auto_401668 ?auto_401675 ) ) ( not ( = ?auto_401668 ?auto_401676 ) ) ( not ( = ?auto_401669 ?auto_401670 ) ) ( not ( = ?auto_401669 ?auto_401671 ) ) ( not ( = ?auto_401669 ?auto_401672 ) ) ( not ( = ?auto_401669 ?auto_401673 ) ) ( not ( = ?auto_401669 ?auto_401674 ) ) ( not ( = ?auto_401669 ?auto_401675 ) ) ( not ( = ?auto_401669 ?auto_401676 ) ) ( not ( = ?auto_401670 ?auto_401671 ) ) ( not ( = ?auto_401670 ?auto_401672 ) ) ( not ( = ?auto_401670 ?auto_401673 ) ) ( not ( = ?auto_401670 ?auto_401674 ) ) ( not ( = ?auto_401670 ?auto_401675 ) ) ( not ( = ?auto_401670 ?auto_401676 ) ) ( not ( = ?auto_401671 ?auto_401672 ) ) ( not ( = ?auto_401671 ?auto_401673 ) ) ( not ( = ?auto_401671 ?auto_401674 ) ) ( not ( = ?auto_401671 ?auto_401675 ) ) ( not ( = ?auto_401671 ?auto_401676 ) ) ( not ( = ?auto_401672 ?auto_401673 ) ) ( not ( = ?auto_401672 ?auto_401674 ) ) ( not ( = ?auto_401672 ?auto_401675 ) ) ( not ( = ?auto_401672 ?auto_401676 ) ) ( not ( = ?auto_401673 ?auto_401674 ) ) ( not ( = ?auto_401673 ?auto_401675 ) ) ( not ( = ?auto_401673 ?auto_401676 ) ) ( not ( = ?auto_401674 ?auto_401675 ) ) ( not ( = ?auto_401674 ?auto_401676 ) ) ( not ( = ?auto_401675 ?auto_401676 ) ) ( ON ?auto_401674 ?auto_401675 ) ( ON ?auto_401673 ?auto_401674 ) ( ON ?auto_401672 ?auto_401673 ) ( CLEAR ?auto_401670 ) ( ON ?auto_401671 ?auto_401672 ) ( CLEAR ?auto_401671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_401661 ?auto_401662 ?auto_401663 ?auto_401664 ?auto_401665 ?auto_401666 ?auto_401667 ?auto_401668 ?auto_401669 ?auto_401670 ?auto_401671 )
      ( MAKE-15PILE ?auto_401661 ?auto_401662 ?auto_401663 ?auto_401664 ?auto_401665 ?auto_401666 ?auto_401667 ?auto_401668 ?auto_401669 ?auto_401670 ?auto_401671 ?auto_401672 ?auto_401673 ?auto_401674 ?auto_401675 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401692 - BLOCK
      ?auto_401693 - BLOCK
      ?auto_401694 - BLOCK
      ?auto_401695 - BLOCK
      ?auto_401696 - BLOCK
      ?auto_401697 - BLOCK
      ?auto_401698 - BLOCK
      ?auto_401699 - BLOCK
      ?auto_401700 - BLOCK
      ?auto_401701 - BLOCK
      ?auto_401702 - BLOCK
      ?auto_401703 - BLOCK
      ?auto_401704 - BLOCK
      ?auto_401705 - BLOCK
      ?auto_401706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_401706 ) ( ON-TABLE ?auto_401692 ) ( ON ?auto_401693 ?auto_401692 ) ( ON ?auto_401694 ?auto_401693 ) ( ON ?auto_401695 ?auto_401694 ) ( ON ?auto_401696 ?auto_401695 ) ( ON ?auto_401697 ?auto_401696 ) ( ON ?auto_401698 ?auto_401697 ) ( ON ?auto_401699 ?auto_401698 ) ( ON ?auto_401700 ?auto_401699 ) ( ON ?auto_401701 ?auto_401700 ) ( not ( = ?auto_401692 ?auto_401693 ) ) ( not ( = ?auto_401692 ?auto_401694 ) ) ( not ( = ?auto_401692 ?auto_401695 ) ) ( not ( = ?auto_401692 ?auto_401696 ) ) ( not ( = ?auto_401692 ?auto_401697 ) ) ( not ( = ?auto_401692 ?auto_401698 ) ) ( not ( = ?auto_401692 ?auto_401699 ) ) ( not ( = ?auto_401692 ?auto_401700 ) ) ( not ( = ?auto_401692 ?auto_401701 ) ) ( not ( = ?auto_401692 ?auto_401702 ) ) ( not ( = ?auto_401692 ?auto_401703 ) ) ( not ( = ?auto_401692 ?auto_401704 ) ) ( not ( = ?auto_401692 ?auto_401705 ) ) ( not ( = ?auto_401692 ?auto_401706 ) ) ( not ( = ?auto_401693 ?auto_401694 ) ) ( not ( = ?auto_401693 ?auto_401695 ) ) ( not ( = ?auto_401693 ?auto_401696 ) ) ( not ( = ?auto_401693 ?auto_401697 ) ) ( not ( = ?auto_401693 ?auto_401698 ) ) ( not ( = ?auto_401693 ?auto_401699 ) ) ( not ( = ?auto_401693 ?auto_401700 ) ) ( not ( = ?auto_401693 ?auto_401701 ) ) ( not ( = ?auto_401693 ?auto_401702 ) ) ( not ( = ?auto_401693 ?auto_401703 ) ) ( not ( = ?auto_401693 ?auto_401704 ) ) ( not ( = ?auto_401693 ?auto_401705 ) ) ( not ( = ?auto_401693 ?auto_401706 ) ) ( not ( = ?auto_401694 ?auto_401695 ) ) ( not ( = ?auto_401694 ?auto_401696 ) ) ( not ( = ?auto_401694 ?auto_401697 ) ) ( not ( = ?auto_401694 ?auto_401698 ) ) ( not ( = ?auto_401694 ?auto_401699 ) ) ( not ( = ?auto_401694 ?auto_401700 ) ) ( not ( = ?auto_401694 ?auto_401701 ) ) ( not ( = ?auto_401694 ?auto_401702 ) ) ( not ( = ?auto_401694 ?auto_401703 ) ) ( not ( = ?auto_401694 ?auto_401704 ) ) ( not ( = ?auto_401694 ?auto_401705 ) ) ( not ( = ?auto_401694 ?auto_401706 ) ) ( not ( = ?auto_401695 ?auto_401696 ) ) ( not ( = ?auto_401695 ?auto_401697 ) ) ( not ( = ?auto_401695 ?auto_401698 ) ) ( not ( = ?auto_401695 ?auto_401699 ) ) ( not ( = ?auto_401695 ?auto_401700 ) ) ( not ( = ?auto_401695 ?auto_401701 ) ) ( not ( = ?auto_401695 ?auto_401702 ) ) ( not ( = ?auto_401695 ?auto_401703 ) ) ( not ( = ?auto_401695 ?auto_401704 ) ) ( not ( = ?auto_401695 ?auto_401705 ) ) ( not ( = ?auto_401695 ?auto_401706 ) ) ( not ( = ?auto_401696 ?auto_401697 ) ) ( not ( = ?auto_401696 ?auto_401698 ) ) ( not ( = ?auto_401696 ?auto_401699 ) ) ( not ( = ?auto_401696 ?auto_401700 ) ) ( not ( = ?auto_401696 ?auto_401701 ) ) ( not ( = ?auto_401696 ?auto_401702 ) ) ( not ( = ?auto_401696 ?auto_401703 ) ) ( not ( = ?auto_401696 ?auto_401704 ) ) ( not ( = ?auto_401696 ?auto_401705 ) ) ( not ( = ?auto_401696 ?auto_401706 ) ) ( not ( = ?auto_401697 ?auto_401698 ) ) ( not ( = ?auto_401697 ?auto_401699 ) ) ( not ( = ?auto_401697 ?auto_401700 ) ) ( not ( = ?auto_401697 ?auto_401701 ) ) ( not ( = ?auto_401697 ?auto_401702 ) ) ( not ( = ?auto_401697 ?auto_401703 ) ) ( not ( = ?auto_401697 ?auto_401704 ) ) ( not ( = ?auto_401697 ?auto_401705 ) ) ( not ( = ?auto_401697 ?auto_401706 ) ) ( not ( = ?auto_401698 ?auto_401699 ) ) ( not ( = ?auto_401698 ?auto_401700 ) ) ( not ( = ?auto_401698 ?auto_401701 ) ) ( not ( = ?auto_401698 ?auto_401702 ) ) ( not ( = ?auto_401698 ?auto_401703 ) ) ( not ( = ?auto_401698 ?auto_401704 ) ) ( not ( = ?auto_401698 ?auto_401705 ) ) ( not ( = ?auto_401698 ?auto_401706 ) ) ( not ( = ?auto_401699 ?auto_401700 ) ) ( not ( = ?auto_401699 ?auto_401701 ) ) ( not ( = ?auto_401699 ?auto_401702 ) ) ( not ( = ?auto_401699 ?auto_401703 ) ) ( not ( = ?auto_401699 ?auto_401704 ) ) ( not ( = ?auto_401699 ?auto_401705 ) ) ( not ( = ?auto_401699 ?auto_401706 ) ) ( not ( = ?auto_401700 ?auto_401701 ) ) ( not ( = ?auto_401700 ?auto_401702 ) ) ( not ( = ?auto_401700 ?auto_401703 ) ) ( not ( = ?auto_401700 ?auto_401704 ) ) ( not ( = ?auto_401700 ?auto_401705 ) ) ( not ( = ?auto_401700 ?auto_401706 ) ) ( not ( = ?auto_401701 ?auto_401702 ) ) ( not ( = ?auto_401701 ?auto_401703 ) ) ( not ( = ?auto_401701 ?auto_401704 ) ) ( not ( = ?auto_401701 ?auto_401705 ) ) ( not ( = ?auto_401701 ?auto_401706 ) ) ( not ( = ?auto_401702 ?auto_401703 ) ) ( not ( = ?auto_401702 ?auto_401704 ) ) ( not ( = ?auto_401702 ?auto_401705 ) ) ( not ( = ?auto_401702 ?auto_401706 ) ) ( not ( = ?auto_401703 ?auto_401704 ) ) ( not ( = ?auto_401703 ?auto_401705 ) ) ( not ( = ?auto_401703 ?auto_401706 ) ) ( not ( = ?auto_401704 ?auto_401705 ) ) ( not ( = ?auto_401704 ?auto_401706 ) ) ( not ( = ?auto_401705 ?auto_401706 ) ) ( ON ?auto_401705 ?auto_401706 ) ( ON ?auto_401704 ?auto_401705 ) ( ON ?auto_401703 ?auto_401704 ) ( CLEAR ?auto_401701 ) ( ON ?auto_401702 ?auto_401703 ) ( CLEAR ?auto_401702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_401692 ?auto_401693 ?auto_401694 ?auto_401695 ?auto_401696 ?auto_401697 ?auto_401698 ?auto_401699 ?auto_401700 ?auto_401701 ?auto_401702 )
      ( MAKE-15PILE ?auto_401692 ?auto_401693 ?auto_401694 ?auto_401695 ?auto_401696 ?auto_401697 ?auto_401698 ?auto_401699 ?auto_401700 ?auto_401701 ?auto_401702 ?auto_401703 ?auto_401704 ?auto_401705 ?auto_401706 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401722 - BLOCK
      ?auto_401723 - BLOCK
      ?auto_401724 - BLOCK
      ?auto_401725 - BLOCK
      ?auto_401726 - BLOCK
      ?auto_401727 - BLOCK
      ?auto_401728 - BLOCK
      ?auto_401729 - BLOCK
      ?auto_401730 - BLOCK
      ?auto_401731 - BLOCK
      ?auto_401732 - BLOCK
      ?auto_401733 - BLOCK
      ?auto_401734 - BLOCK
      ?auto_401735 - BLOCK
      ?auto_401736 - BLOCK
    )
    :vars
    (
      ?auto_401737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401736 ?auto_401737 ) ( ON-TABLE ?auto_401722 ) ( ON ?auto_401723 ?auto_401722 ) ( ON ?auto_401724 ?auto_401723 ) ( ON ?auto_401725 ?auto_401724 ) ( ON ?auto_401726 ?auto_401725 ) ( ON ?auto_401727 ?auto_401726 ) ( ON ?auto_401728 ?auto_401727 ) ( ON ?auto_401729 ?auto_401728 ) ( ON ?auto_401730 ?auto_401729 ) ( not ( = ?auto_401722 ?auto_401723 ) ) ( not ( = ?auto_401722 ?auto_401724 ) ) ( not ( = ?auto_401722 ?auto_401725 ) ) ( not ( = ?auto_401722 ?auto_401726 ) ) ( not ( = ?auto_401722 ?auto_401727 ) ) ( not ( = ?auto_401722 ?auto_401728 ) ) ( not ( = ?auto_401722 ?auto_401729 ) ) ( not ( = ?auto_401722 ?auto_401730 ) ) ( not ( = ?auto_401722 ?auto_401731 ) ) ( not ( = ?auto_401722 ?auto_401732 ) ) ( not ( = ?auto_401722 ?auto_401733 ) ) ( not ( = ?auto_401722 ?auto_401734 ) ) ( not ( = ?auto_401722 ?auto_401735 ) ) ( not ( = ?auto_401722 ?auto_401736 ) ) ( not ( = ?auto_401722 ?auto_401737 ) ) ( not ( = ?auto_401723 ?auto_401724 ) ) ( not ( = ?auto_401723 ?auto_401725 ) ) ( not ( = ?auto_401723 ?auto_401726 ) ) ( not ( = ?auto_401723 ?auto_401727 ) ) ( not ( = ?auto_401723 ?auto_401728 ) ) ( not ( = ?auto_401723 ?auto_401729 ) ) ( not ( = ?auto_401723 ?auto_401730 ) ) ( not ( = ?auto_401723 ?auto_401731 ) ) ( not ( = ?auto_401723 ?auto_401732 ) ) ( not ( = ?auto_401723 ?auto_401733 ) ) ( not ( = ?auto_401723 ?auto_401734 ) ) ( not ( = ?auto_401723 ?auto_401735 ) ) ( not ( = ?auto_401723 ?auto_401736 ) ) ( not ( = ?auto_401723 ?auto_401737 ) ) ( not ( = ?auto_401724 ?auto_401725 ) ) ( not ( = ?auto_401724 ?auto_401726 ) ) ( not ( = ?auto_401724 ?auto_401727 ) ) ( not ( = ?auto_401724 ?auto_401728 ) ) ( not ( = ?auto_401724 ?auto_401729 ) ) ( not ( = ?auto_401724 ?auto_401730 ) ) ( not ( = ?auto_401724 ?auto_401731 ) ) ( not ( = ?auto_401724 ?auto_401732 ) ) ( not ( = ?auto_401724 ?auto_401733 ) ) ( not ( = ?auto_401724 ?auto_401734 ) ) ( not ( = ?auto_401724 ?auto_401735 ) ) ( not ( = ?auto_401724 ?auto_401736 ) ) ( not ( = ?auto_401724 ?auto_401737 ) ) ( not ( = ?auto_401725 ?auto_401726 ) ) ( not ( = ?auto_401725 ?auto_401727 ) ) ( not ( = ?auto_401725 ?auto_401728 ) ) ( not ( = ?auto_401725 ?auto_401729 ) ) ( not ( = ?auto_401725 ?auto_401730 ) ) ( not ( = ?auto_401725 ?auto_401731 ) ) ( not ( = ?auto_401725 ?auto_401732 ) ) ( not ( = ?auto_401725 ?auto_401733 ) ) ( not ( = ?auto_401725 ?auto_401734 ) ) ( not ( = ?auto_401725 ?auto_401735 ) ) ( not ( = ?auto_401725 ?auto_401736 ) ) ( not ( = ?auto_401725 ?auto_401737 ) ) ( not ( = ?auto_401726 ?auto_401727 ) ) ( not ( = ?auto_401726 ?auto_401728 ) ) ( not ( = ?auto_401726 ?auto_401729 ) ) ( not ( = ?auto_401726 ?auto_401730 ) ) ( not ( = ?auto_401726 ?auto_401731 ) ) ( not ( = ?auto_401726 ?auto_401732 ) ) ( not ( = ?auto_401726 ?auto_401733 ) ) ( not ( = ?auto_401726 ?auto_401734 ) ) ( not ( = ?auto_401726 ?auto_401735 ) ) ( not ( = ?auto_401726 ?auto_401736 ) ) ( not ( = ?auto_401726 ?auto_401737 ) ) ( not ( = ?auto_401727 ?auto_401728 ) ) ( not ( = ?auto_401727 ?auto_401729 ) ) ( not ( = ?auto_401727 ?auto_401730 ) ) ( not ( = ?auto_401727 ?auto_401731 ) ) ( not ( = ?auto_401727 ?auto_401732 ) ) ( not ( = ?auto_401727 ?auto_401733 ) ) ( not ( = ?auto_401727 ?auto_401734 ) ) ( not ( = ?auto_401727 ?auto_401735 ) ) ( not ( = ?auto_401727 ?auto_401736 ) ) ( not ( = ?auto_401727 ?auto_401737 ) ) ( not ( = ?auto_401728 ?auto_401729 ) ) ( not ( = ?auto_401728 ?auto_401730 ) ) ( not ( = ?auto_401728 ?auto_401731 ) ) ( not ( = ?auto_401728 ?auto_401732 ) ) ( not ( = ?auto_401728 ?auto_401733 ) ) ( not ( = ?auto_401728 ?auto_401734 ) ) ( not ( = ?auto_401728 ?auto_401735 ) ) ( not ( = ?auto_401728 ?auto_401736 ) ) ( not ( = ?auto_401728 ?auto_401737 ) ) ( not ( = ?auto_401729 ?auto_401730 ) ) ( not ( = ?auto_401729 ?auto_401731 ) ) ( not ( = ?auto_401729 ?auto_401732 ) ) ( not ( = ?auto_401729 ?auto_401733 ) ) ( not ( = ?auto_401729 ?auto_401734 ) ) ( not ( = ?auto_401729 ?auto_401735 ) ) ( not ( = ?auto_401729 ?auto_401736 ) ) ( not ( = ?auto_401729 ?auto_401737 ) ) ( not ( = ?auto_401730 ?auto_401731 ) ) ( not ( = ?auto_401730 ?auto_401732 ) ) ( not ( = ?auto_401730 ?auto_401733 ) ) ( not ( = ?auto_401730 ?auto_401734 ) ) ( not ( = ?auto_401730 ?auto_401735 ) ) ( not ( = ?auto_401730 ?auto_401736 ) ) ( not ( = ?auto_401730 ?auto_401737 ) ) ( not ( = ?auto_401731 ?auto_401732 ) ) ( not ( = ?auto_401731 ?auto_401733 ) ) ( not ( = ?auto_401731 ?auto_401734 ) ) ( not ( = ?auto_401731 ?auto_401735 ) ) ( not ( = ?auto_401731 ?auto_401736 ) ) ( not ( = ?auto_401731 ?auto_401737 ) ) ( not ( = ?auto_401732 ?auto_401733 ) ) ( not ( = ?auto_401732 ?auto_401734 ) ) ( not ( = ?auto_401732 ?auto_401735 ) ) ( not ( = ?auto_401732 ?auto_401736 ) ) ( not ( = ?auto_401732 ?auto_401737 ) ) ( not ( = ?auto_401733 ?auto_401734 ) ) ( not ( = ?auto_401733 ?auto_401735 ) ) ( not ( = ?auto_401733 ?auto_401736 ) ) ( not ( = ?auto_401733 ?auto_401737 ) ) ( not ( = ?auto_401734 ?auto_401735 ) ) ( not ( = ?auto_401734 ?auto_401736 ) ) ( not ( = ?auto_401734 ?auto_401737 ) ) ( not ( = ?auto_401735 ?auto_401736 ) ) ( not ( = ?auto_401735 ?auto_401737 ) ) ( not ( = ?auto_401736 ?auto_401737 ) ) ( ON ?auto_401735 ?auto_401736 ) ( ON ?auto_401734 ?auto_401735 ) ( ON ?auto_401733 ?auto_401734 ) ( ON ?auto_401732 ?auto_401733 ) ( CLEAR ?auto_401730 ) ( ON ?auto_401731 ?auto_401732 ) ( CLEAR ?auto_401731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_401722 ?auto_401723 ?auto_401724 ?auto_401725 ?auto_401726 ?auto_401727 ?auto_401728 ?auto_401729 ?auto_401730 ?auto_401731 )
      ( MAKE-15PILE ?auto_401722 ?auto_401723 ?auto_401724 ?auto_401725 ?auto_401726 ?auto_401727 ?auto_401728 ?auto_401729 ?auto_401730 ?auto_401731 ?auto_401732 ?auto_401733 ?auto_401734 ?auto_401735 ?auto_401736 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401753 - BLOCK
      ?auto_401754 - BLOCK
      ?auto_401755 - BLOCK
      ?auto_401756 - BLOCK
      ?auto_401757 - BLOCK
      ?auto_401758 - BLOCK
      ?auto_401759 - BLOCK
      ?auto_401760 - BLOCK
      ?auto_401761 - BLOCK
      ?auto_401762 - BLOCK
      ?auto_401763 - BLOCK
      ?auto_401764 - BLOCK
      ?auto_401765 - BLOCK
      ?auto_401766 - BLOCK
      ?auto_401767 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_401767 ) ( ON-TABLE ?auto_401753 ) ( ON ?auto_401754 ?auto_401753 ) ( ON ?auto_401755 ?auto_401754 ) ( ON ?auto_401756 ?auto_401755 ) ( ON ?auto_401757 ?auto_401756 ) ( ON ?auto_401758 ?auto_401757 ) ( ON ?auto_401759 ?auto_401758 ) ( ON ?auto_401760 ?auto_401759 ) ( ON ?auto_401761 ?auto_401760 ) ( not ( = ?auto_401753 ?auto_401754 ) ) ( not ( = ?auto_401753 ?auto_401755 ) ) ( not ( = ?auto_401753 ?auto_401756 ) ) ( not ( = ?auto_401753 ?auto_401757 ) ) ( not ( = ?auto_401753 ?auto_401758 ) ) ( not ( = ?auto_401753 ?auto_401759 ) ) ( not ( = ?auto_401753 ?auto_401760 ) ) ( not ( = ?auto_401753 ?auto_401761 ) ) ( not ( = ?auto_401753 ?auto_401762 ) ) ( not ( = ?auto_401753 ?auto_401763 ) ) ( not ( = ?auto_401753 ?auto_401764 ) ) ( not ( = ?auto_401753 ?auto_401765 ) ) ( not ( = ?auto_401753 ?auto_401766 ) ) ( not ( = ?auto_401753 ?auto_401767 ) ) ( not ( = ?auto_401754 ?auto_401755 ) ) ( not ( = ?auto_401754 ?auto_401756 ) ) ( not ( = ?auto_401754 ?auto_401757 ) ) ( not ( = ?auto_401754 ?auto_401758 ) ) ( not ( = ?auto_401754 ?auto_401759 ) ) ( not ( = ?auto_401754 ?auto_401760 ) ) ( not ( = ?auto_401754 ?auto_401761 ) ) ( not ( = ?auto_401754 ?auto_401762 ) ) ( not ( = ?auto_401754 ?auto_401763 ) ) ( not ( = ?auto_401754 ?auto_401764 ) ) ( not ( = ?auto_401754 ?auto_401765 ) ) ( not ( = ?auto_401754 ?auto_401766 ) ) ( not ( = ?auto_401754 ?auto_401767 ) ) ( not ( = ?auto_401755 ?auto_401756 ) ) ( not ( = ?auto_401755 ?auto_401757 ) ) ( not ( = ?auto_401755 ?auto_401758 ) ) ( not ( = ?auto_401755 ?auto_401759 ) ) ( not ( = ?auto_401755 ?auto_401760 ) ) ( not ( = ?auto_401755 ?auto_401761 ) ) ( not ( = ?auto_401755 ?auto_401762 ) ) ( not ( = ?auto_401755 ?auto_401763 ) ) ( not ( = ?auto_401755 ?auto_401764 ) ) ( not ( = ?auto_401755 ?auto_401765 ) ) ( not ( = ?auto_401755 ?auto_401766 ) ) ( not ( = ?auto_401755 ?auto_401767 ) ) ( not ( = ?auto_401756 ?auto_401757 ) ) ( not ( = ?auto_401756 ?auto_401758 ) ) ( not ( = ?auto_401756 ?auto_401759 ) ) ( not ( = ?auto_401756 ?auto_401760 ) ) ( not ( = ?auto_401756 ?auto_401761 ) ) ( not ( = ?auto_401756 ?auto_401762 ) ) ( not ( = ?auto_401756 ?auto_401763 ) ) ( not ( = ?auto_401756 ?auto_401764 ) ) ( not ( = ?auto_401756 ?auto_401765 ) ) ( not ( = ?auto_401756 ?auto_401766 ) ) ( not ( = ?auto_401756 ?auto_401767 ) ) ( not ( = ?auto_401757 ?auto_401758 ) ) ( not ( = ?auto_401757 ?auto_401759 ) ) ( not ( = ?auto_401757 ?auto_401760 ) ) ( not ( = ?auto_401757 ?auto_401761 ) ) ( not ( = ?auto_401757 ?auto_401762 ) ) ( not ( = ?auto_401757 ?auto_401763 ) ) ( not ( = ?auto_401757 ?auto_401764 ) ) ( not ( = ?auto_401757 ?auto_401765 ) ) ( not ( = ?auto_401757 ?auto_401766 ) ) ( not ( = ?auto_401757 ?auto_401767 ) ) ( not ( = ?auto_401758 ?auto_401759 ) ) ( not ( = ?auto_401758 ?auto_401760 ) ) ( not ( = ?auto_401758 ?auto_401761 ) ) ( not ( = ?auto_401758 ?auto_401762 ) ) ( not ( = ?auto_401758 ?auto_401763 ) ) ( not ( = ?auto_401758 ?auto_401764 ) ) ( not ( = ?auto_401758 ?auto_401765 ) ) ( not ( = ?auto_401758 ?auto_401766 ) ) ( not ( = ?auto_401758 ?auto_401767 ) ) ( not ( = ?auto_401759 ?auto_401760 ) ) ( not ( = ?auto_401759 ?auto_401761 ) ) ( not ( = ?auto_401759 ?auto_401762 ) ) ( not ( = ?auto_401759 ?auto_401763 ) ) ( not ( = ?auto_401759 ?auto_401764 ) ) ( not ( = ?auto_401759 ?auto_401765 ) ) ( not ( = ?auto_401759 ?auto_401766 ) ) ( not ( = ?auto_401759 ?auto_401767 ) ) ( not ( = ?auto_401760 ?auto_401761 ) ) ( not ( = ?auto_401760 ?auto_401762 ) ) ( not ( = ?auto_401760 ?auto_401763 ) ) ( not ( = ?auto_401760 ?auto_401764 ) ) ( not ( = ?auto_401760 ?auto_401765 ) ) ( not ( = ?auto_401760 ?auto_401766 ) ) ( not ( = ?auto_401760 ?auto_401767 ) ) ( not ( = ?auto_401761 ?auto_401762 ) ) ( not ( = ?auto_401761 ?auto_401763 ) ) ( not ( = ?auto_401761 ?auto_401764 ) ) ( not ( = ?auto_401761 ?auto_401765 ) ) ( not ( = ?auto_401761 ?auto_401766 ) ) ( not ( = ?auto_401761 ?auto_401767 ) ) ( not ( = ?auto_401762 ?auto_401763 ) ) ( not ( = ?auto_401762 ?auto_401764 ) ) ( not ( = ?auto_401762 ?auto_401765 ) ) ( not ( = ?auto_401762 ?auto_401766 ) ) ( not ( = ?auto_401762 ?auto_401767 ) ) ( not ( = ?auto_401763 ?auto_401764 ) ) ( not ( = ?auto_401763 ?auto_401765 ) ) ( not ( = ?auto_401763 ?auto_401766 ) ) ( not ( = ?auto_401763 ?auto_401767 ) ) ( not ( = ?auto_401764 ?auto_401765 ) ) ( not ( = ?auto_401764 ?auto_401766 ) ) ( not ( = ?auto_401764 ?auto_401767 ) ) ( not ( = ?auto_401765 ?auto_401766 ) ) ( not ( = ?auto_401765 ?auto_401767 ) ) ( not ( = ?auto_401766 ?auto_401767 ) ) ( ON ?auto_401766 ?auto_401767 ) ( ON ?auto_401765 ?auto_401766 ) ( ON ?auto_401764 ?auto_401765 ) ( ON ?auto_401763 ?auto_401764 ) ( CLEAR ?auto_401761 ) ( ON ?auto_401762 ?auto_401763 ) ( CLEAR ?auto_401762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_401753 ?auto_401754 ?auto_401755 ?auto_401756 ?auto_401757 ?auto_401758 ?auto_401759 ?auto_401760 ?auto_401761 ?auto_401762 )
      ( MAKE-15PILE ?auto_401753 ?auto_401754 ?auto_401755 ?auto_401756 ?auto_401757 ?auto_401758 ?auto_401759 ?auto_401760 ?auto_401761 ?auto_401762 ?auto_401763 ?auto_401764 ?auto_401765 ?auto_401766 ?auto_401767 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401783 - BLOCK
      ?auto_401784 - BLOCK
      ?auto_401785 - BLOCK
      ?auto_401786 - BLOCK
      ?auto_401787 - BLOCK
      ?auto_401788 - BLOCK
      ?auto_401789 - BLOCK
      ?auto_401790 - BLOCK
      ?auto_401791 - BLOCK
      ?auto_401792 - BLOCK
      ?auto_401793 - BLOCK
      ?auto_401794 - BLOCK
      ?auto_401795 - BLOCK
      ?auto_401796 - BLOCK
      ?auto_401797 - BLOCK
    )
    :vars
    (
      ?auto_401798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401797 ?auto_401798 ) ( ON-TABLE ?auto_401783 ) ( ON ?auto_401784 ?auto_401783 ) ( ON ?auto_401785 ?auto_401784 ) ( ON ?auto_401786 ?auto_401785 ) ( ON ?auto_401787 ?auto_401786 ) ( ON ?auto_401788 ?auto_401787 ) ( ON ?auto_401789 ?auto_401788 ) ( ON ?auto_401790 ?auto_401789 ) ( not ( = ?auto_401783 ?auto_401784 ) ) ( not ( = ?auto_401783 ?auto_401785 ) ) ( not ( = ?auto_401783 ?auto_401786 ) ) ( not ( = ?auto_401783 ?auto_401787 ) ) ( not ( = ?auto_401783 ?auto_401788 ) ) ( not ( = ?auto_401783 ?auto_401789 ) ) ( not ( = ?auto_401783 ?auto_401790 ) ) ( not ( = ?auto_401783 ?auto_401791 ) ) ( not ( = ?auto_401783 ?auto_401792 ) ) ( not ( = ?auto_401783 ?auto_401793 ) ) ( not ( = ?auto_401783 ?auto_401794 ) ) ( not ( = ?auto_401783 ?auto_401795 ) ) ( not ( = ?auto_401783 ?auto_401796 ) ) ( not ( = ?auto_401783 ?auto_401797 ) ) ( not ( = ?auto_401783 ?auto_401798 ) ) ( not ( = ?auto_401784 ?auto_401785 ) ) ( not ( = ?auto_401784 ?auto_401786 ) ) ( not ( = ?auto_401784 ?auto_401787 ) ) ( not ( = ?auto_401784 ?auto_401788 ) ) ( not ( = ?auto_401784 ?auto_401789 ) ) ( not ( = ?auto_401784 ?auto_401790 ) ) ( not ( = ?auto_401784 ?auto_401791 ) ) ( not ( = ?auto_401784 ?auto_401792 ) ) ( not ( = ?auto_401784 ?auto_401793 ) ) ( not ( = ?auto_401784 ?auto_401794 ) ) ( not ( = ?auto_401784 ?auto_401795 ) ) ( not ( = ?auto_401784 ?auto_401796 ) ) ( not ( = ?auto_401784 ?auto_401797 ) ) ( not ( = ?auto_401784 ?auto_401798 ) ) ( not ( = ?auto_401785 ?auto_401786 ) ) ( not ( = ?auto_401785 ?auto_401787 ) ) ( not ( = ?auto_401785 ?auto_401788 ) ) ( not ( = ?auto_401785 ?auto_401789 ) ) ( not ( = ?auto_401785 ?auto_401790 ) ) ( not ( = ?auto_401785 ?auto_401791 ) ) ( not ( = ?auto_401785 ?auto_401792 ) ) ( not ( = ?auto_401785 ?auto_401793 ) ) ( not ( = ?auto_401785 ?auto_401794 ) ) ( not ( = ?auto_401785 ?auto_401795 ) ) ( not ( = ?auto_401785 ?auto_401796 ) ) ( not ( = ?auto_401785 ?auto_401797 ) ) ( not ( = ?auto_401785 ?auto_401798 ) ) ( not ( = ?auto_401786 ?auto_401787 ) ) ( not ( = ?auto_401786 ?auto_401788 ) ) ( not ( = ?auto_401786 ?auto_401789 ) ) ( not ( = ?auto_401786 ?auto_401790 ) ) ( not ( = ?auto_401786 ?auto_401791 ) ) ( not ( = ?auto_401786 ?auto_401792 ) ) ( not ( = ?auto_401786 ?auto_401793 ) ) ( not ( = ?auto_401786 ?auto_401794 ) ) ( not ( = ?auto_401786 ?auto_401795 ) ) ( not ( = ?auto_401786 ?auto_401796 ) ) ( not ( = ?auto_401786 ?auto_401797 ) ) ( not ( = ?auto_401786 ?auto_401798 ) ) ( not ( = ?auto_401787 ?auto_401788 ) ) ( not ( = ?auto_401787 ?auto_401789 ) ) ( not ( = ?auto_401787 ?auto_401790 ) ) ( not ( = ?auto_401787 ?auto_401791 ) ) ( not ( = ?auto_401787 ?auto_401792 ) ) ( not ( = ?auto_401787 ?auto_401793 ) ) ( not ( = ?auto_401787 ?auto_401794 ) ) ( not ( = ?auto_401787 ?auto_401795 ) ) ( not ( = ?auto_401787 ?auto_401796 ) ) ( not ( = ?auto_401787 ?auto_401797 ) ) ( not ( = ?auto_401787 ?auto_401798 ) ) ( not ( = ?auto_401788 ?auto_401789 ) ) ( not ( = ?auto_401788 ?auto_401790 ) ) ( not ( = ?auto_401788 ?auto_401791 ) ) ( not ( = ?auto_401788 ?auto_401792 ) ) ( not ( = ?auto_401788 ?auto_401793 ) ) ( not ( = ?auto_401788 ?auto_401794 ) ) ( not ( = ?auto_401788 ?auto_401795 ) ) ( not ( = ?auto_401788 ?auto_401796 ) ) ( not ( = ?auto_401788 ?auto_401797 ) ) ( not ( = ?auto_401788 ?auto_401798 ) ) ( not ( = ?auto_401789 ?auto_401790 ) ) ( not ( = ?auto_401789 ?auto_401791 ) ) ( not ( = ?auto_401789 ?auto_401792 ) ) ( not ( = ?auto_401789 ?auto_401793 ) ) ( not ( = ?auto_401789 ?auto_401794 ) ) ( not ( = ?auto_401789 ?auto_401795 ) ) ( not ( = ?auto_401789 ?auto_401796 ) ) ( not ( = ?auto_401789 ?auto_401797 ) ) ( not ( = ?auto_401789 ?auto_401798 ) ) ( not ( = ?auto_401790 ?auto_401791 ) ) ( not ( = ?auto_401790 ?auto_401792 ) ) ( not ( = ?auto_401790 ?auto_401793 ) ) ( not ( = ?auto_401790 ?auto_401794 ) ) ( not ( = ?auto_401790 ?auto_401795 ) ) ( not ( = ?auto_401790 ?auto_401796 ) ) ( not ( = ?auto_401790 ?auto_401797 ) ) ( not ( = ?auto_401790 ?auto_401798 ) ) ( not ( = ?auto_401791 ?auto_401792 ) ) ( not ( = ?auto_401791 ?auto_401793 ) ) ( not ( = ?auto_401791 ?auto_401794 ) ) ( not ( = ?auto_401791 ?auto_401795 ) ) ( not ( = ?auto_401791 ?auto_401796 ) ) ( not ( = ?auto_401791 ?auto_401797 ) ) ( not ( = ?auto_401791 ?auto_401798 ) ) ( not ( = ?auto_401792 ?auto_401793 ) ) ( not ( = ?auto_401792 ?auto_401794 ) ) ( not ( = ?auto_401792 ?auto_401795 ) ) ( not ( = ?auto_401792 ?auto_401796 ) ) ( not ( = ?auto_401792 ?auto_401797 ) ) ( not ( = ?auto_401792 ?auto_401798 ) ) ( not ( = ?auto_401793 ?auto_401794 ) ) ( not ( = ?auto_401793 ?auto_401795 ) ) ( not ( = ?auto_401793 ?auto_401796 ) ) ( not ( = ?auto_401793 ?auto_401797 ) ) ( not ( = ?auto_401793 ?auto_401798 ) ) ( not ( = ?auto_401794 ?auto_401795 ) ) ( not ( = ?auto_401794 ?auto_401796 ) ) ( not ( = ?auto_401794 ?auto_401797 ) ) ( not ( = ?auto_401794 ?auto_401798 ) ) ( not ( = ?auto_401795 ?auto_401796 ) ) ( not ( = ?auto_401795 ?auto_401797 ) ) ( not ( = ?auto_401795 ?auto_401798 ) ) ( not ( = ?auto_401796 ?auto_401797 ) ) ( not ( = ?auto_401796 ?auto_401798 ) ) ( not ( = ?auto_401797 ?auto_401798 ) ) ( ON ?auto_401796 ?auto_401797 ) ( ON ?auto_401795 ?auto_401796 ) ( ON ?auto_401794 ?auto_401795 ) ( ON ?auto_401793 ?auto_401794 ) ( ON ?auto_401792 ?auto_401793 ) ( CLEAR ?auto_401790 ) ( ON ?auto_401791 ?auto_401792 ) ( CLEAR ?auto_401791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_401783 ?auto_401784 ?auto_401785 ?auto_401786 ?auto_401787 ?auto_401788 ?auto_401789 ?auto_401790 ?auto_401791 )
      ( MAKE-15PILE ?auto_401783 ?auto_401784 ?auto_401785 ?auto_401786 ?auto_401787 ?auto_401788 ?auto_401789 ?auto_401790 ?auto_401791 ?auto_401792 ?auto_401793 ?auto_401794 ?auto_401795 ?auto_401796 ?auto_401797 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401814 - BLOCK
      ?auto_401815 - BLOCK
      ?auto_401816 - BLOCK
      ?auto_401817 - BLOCK
      ?auto_401818 - BLOCK
      ?auto_401819 - BLOCK
      ?auto_401820 - BLOCK
      ?auto_401821 - BLOCK
      ?auto_401822 - BLOCK
      ?auto_401823 - BLOCK
      ?auto_401824 - BLOCK
      ?auto_401825 - BLOCK
      ?auto_401826 - BLOCK
      ?auto_401827 - BLOCK
      ?auto_401828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_401828 ) ( ON-TABLE ?auto_401814 ) ( ON ?auto_401815 ?auto_401814 ) ( ON ?auto_401816 ?auto_401815 ) ( ON ?auto_401817 ?auto_401816 ) ( ON ?auto_401818 ?auto_401817 ) ( ON ?auto_401819 ?auto_401818 ) ( ON ?auto_401820 ?auto_401819 ) ( ON ?auto_401821 ?auto_401820 ) ( not ( = ?auto_401814 ?auto_401815 ) ) ( not ( = ?auto_401814 ?auto_401816 ) ) ( not ( = ?auto_401814 ?auto_401817 ) ) ( not ( = ?auto_401814 ?auto_401818 ) ) ( not ( = ?auto_401814 ?auto_401819 ) ) ( not ( = ?auto_401814 ?auto_401820 ) ) ( not ( = ?auto_401814 ?auto_401821 ) ) ( not ( = ?auto_401814 ?auto_401822 ) ) ( not ( = ?auto_401814 ?auto_401823 ) ) ( not ( = ?auto_401814 ?auto_401824 ) ) ( not ( = ?auto_401814 ?auto_401825 ) ) ( not ( = ?auto_401814 ?auto_401826 ) ) ( not ( = ?auto_401814 ?auto_401827 ) ) ( not ( = ?auto_401814 ?auto_401828 ) ) ( not ( = ?auto_401815 ?auto_401816 ) ) ( not ( = ?auto_401815 ?auto_401817 ) ) ( not ( = ?auto_401815 ?auto_401818 ) ) ( not ( = ?auto_401815 ?auto_401819 ) ) ( not ( = ?auto_401815 ?auto_401820 ) ) ( not ( = ?auto_401815 ?auto_401821 ) ) ( not ( = ?auto_401815 ?auto_401822 ) ) ( not ( = ?auto_401815 ?auto_401823 ) ) ( not ( = ?auto_401815 ?auto_401824 ) ) ( not ( = ?auto_401815 ?auto_401825 ) ) ( not ( = ?auto_401815 ?auto_401826 ) ) ( not ( = ?auto_401815 ?auto_401827 ) ) ( not ( = ?auto_401815 ?auto_401828 ) ) ( not ( = ?auto_401816 ?auto_401817 ) ) ( not ( = ?auto_401816 ?auto_401818 ) ) ( not ( = ?auto_401816 ?auto_401819 ) ) ( not ( = ?auto_401816 ?auto_401820 ) ) ( not ( = ?auto_401816 ?auto_401821 ) ) ( not ( = ?auto_401816 ?auto_401822 ) ) ( not ( = ?auto_401816 ?auto_401823 ) ) ( not ( = ?auto_401816 ?auto_401824 ) ) ( not ( = ?auto_401816 ?auto_401825 ) ) ( not ( = ?auto_401816 ?auto_401826 ) ) ( not ( = ?auto_401816 ?auto_401827 ) ) ( not ( = ?auto_401816 ?auto_401828 ) ) ( not ( = ?auto_401817 ?auto_401818 ) ) ( not ( = ?auto_401817 ?auto_401819 ) ) ( not ( = ?auto_401817 ?auto_401820 ) ) ( not ( = ?auto_401817 ?auto_401821 ) ) ( not ( = ?auto_401817 ?auto_401822 ) ) ( not ( = ?auto_401817 ?auto_401823 ) ) ( not ( = ?auto_401817 ?auto_401824 ) ) ( not ( = ?auto_401817 ?auto_401825 ) ) ( not ( = ?auto_401817 ?auto_401826 ) ) ( not ( = ?auto_401817 ?auto_401827 ) ) ( not ( = ?auto_401817 ?auto_401828 ) ) ( not ( = ?auto_401818 ?auto_401819 ) ) ( not ( = ?auto_401818 ?auto_401820 ) ) ( not ( = ?auto_401818 ?auto_401821 ) ) ( not ( = ?auto_401818 ?auto_401822 ) ) ( not ( = ?auto_401818 ?auto_401823 ) ) ( not ( = ?auto_401818 ?auto_401824 ) ) ( not ( = ?auto_401818 ?auto_401825 ) ) ( not ( = ?auto_401818 ?auto_401826 ) ) ( not ( = ?auto_401818 ?auto_401827 ) ) ( not ( = ?auto_401818 ?auto_401828 ) ) ( not ( = ?auto_401819 ?auto_401820 ) ) ( not ( = ?auto_401819 ?auto_401821 ) ) ( not ( = ?auto_401819 ?auto_401822 ) ) ( not ( = ?auto_401819 ?auto_401823 ) ) ( not ( = ?auto_401819 ?auto_401824 ) ) ( not ( = ?auto_401819 ?auto_401825 ) ) ( not ( = ?auto_401819 ?auto_401826 ) ) ( not ( = ?auto_401819 ?auto_401827 ) ) ( not ( = ?auto_401819 ?auto_401828 ) ) ( not ( = ?auto_401820 ?auto_401821 ) ) ( not ( = ?auto_401820 ?auto_401822 ) ) ( not ( = ?auto_401820 ?auto_401823 ) ) ( not ( = ?auto_401820 ?auto_401824 ) ) ( not ( = ?auto_401820 ?auto_401825 ) ) ( not ( = ?auto_401820 ?auto_401826 ) ) ( not ( = ?auto_401820 ?auto_401827 ) ) ( not ( = ?auto_401820 ?auto_401828 ) ) ( not ( = ?auto_401821 ?auto_401822 ) ) ( not ( = ?auto_401821 ?auto_401823 ) ) ( not ( = ?auto_401821 ?auto_401824 ) ) ( not ( = ?auto_401821 ?auto_401825 ) ) ( not ( = ?auto_401821 ?auto_401826 ) ) ( not ( = ?auto_401821 ?auto_401827 ) ) ( not ( = ?auto_401821 ?auto_401828 ) ) ( not ( = ?auto_401822 ?auto_401823 ) ) ( not ( = ?auto_401822 ?auto_401824 ) ) ( not ( = ?auto_401822 ?auto_401825 ) ) ( not ( = ?auto_401822 ?auto_401826 ) ) ( not ( = ?auto_401822 ?auto_401827 ) ) ( not ( = ?auto_401822 ?auto_401828 ) ) ( not ( = ?auto_401823 ?auto_401824 ) ) ( not ( = ?auto_401823 ?auto_401825 ) ) ( not ( = ?auto_401823 ?auto_401826 ) ) ( not ( = ?auto_401823 ?auto_401827 ) ) ( not ( = ?auto_401823 ?auto_401828 ) ) ( not ( = ?auto_401824 ?auto_401825 ) ) ( not ( = ?auto_401824 ?auto_401826 ) ) ( not ( = ?auto_401824 ?auto_401827 ) ) ( not ( = ?auto_401824 ?auto_401828 ) ) ( not ( = ?auto_401825 ?auto_401826 ) ) ( not ( = ?auto_401825 ?auto_401827 ) ) ( not ( = ?auto_401825 ?auto_401828 ) ) ( not ( = ?auto_401826 ?auto_401827 ) ) ( not ( = ?auto_401826 ?auto_401828 ) ) ( not ( = ?auto_401827 ?auto_401828 ) ) ( ON ?auto_401827 ?auto_401828 ) ( ON ?auto_401826 ?auto_401827 ) ( ON ?auto_401825 ?auto_401826 ) ( ON ?auto_401824 ?auto_401825 ) ( ON ?auto_401823 ?auto_401824 ) ( CLEAR ?auto_401821 ) ( ON ?auto_401822 ?auto_401823 ) ( CLEAR ?auto_401822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_401814 ?auto_401815 ?auto_401816 ?auto_401817 ?auto_401818 ?auto_401819 ?auto_401820 ?auto_401821 ?auto_401822 )
      ( MAKE-15PILE ?auto_401814 ?auto_401815 ?auto_401816 ?auto_401817 ?auto_401818 ?auto_401819 ?auto_401820 ?auto_401821 ?auto_401822 ?auto_401823 ?auto_401824 ?auto_401825 ?auto_401826 ?auto_401827 ?auto_401828 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401844 - BLOCK
      ?auto_401845 - BLOCK
      ?auto_401846 - BLOCK
      ?auto_401847 - BLOCK
      ?auto_401848 - BLOCK
      ?auto_401849 - BLOCK
      ?auto_401850 - BLOCK
      ?auto_401851 - BLOCK
      ?auto_401852 - BLOCK
      ?auto_401853 - BLOCK
      ?auto_401854 - BLOCK
      ?auto_401855 - BLOCK
      ?auto_401856 - BLOCK
      ?auto_401857 - BLOCK
      ?auto_401858 - BLOCK
    )
    :vars
    (
      ?auto_401859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401858 ?auto_401859 ) ( ON-TABLE ?auto_401844 ) ( ON ?auto_401845 ?auto_401844 ) ( ON ?auto_401846 ?auto_401845 ) ( ON ?auto_401847 ?auto_401846 ) ( ON ?auto_401848 ?auto_401847 ) ( ON ?auto_401849 ?auto_401848 ) ( ON ?auto_401850 ?auto_401849 ) ( not ( = ?auto_401844 ?auto_401845 ) ) ( not ( = ?auto_401844 ?auto_401846 ) ) ( not ( = ?auto_401844 ?auto_401847 ) ) ( not ( = ?auto_401844 ?auto_401848 ) ) ( not ( = ?auto_401844 ?auto_401849 ) ) ( not ( = ?auto_401844 ?auto_401850 ) ) ( not ( = ?auto_401844 ?auto_401851 ) ) ( not ( = ?auto_401844 ?auto_401852 ) ) ( not ( = ?auto_401844 ?auto_401853 ) ) ( not ( = ?auto_401844 ?auto_401854 ) ) ( not ( = ?auto_401844 ?auto_401855 ) ) ( not ( = ?auto_401844 ?auto_401856 ) ) ( not ( = ?auto_401844 ?auto_401857 ) ) ( not ( = ?auto_401844 ?auto_401858 ) ) ( not ( = ?auto_401844 ?auto_401859 ) ) ( not ( = ?auto_401845 ?auto_401846 ) ) ( not ( = ?auto_401845 ?auto_401847 ) ) ( not ( = ?auto_401845 ?auto_401848 ) ) ( not ( = ?auto_401845 ?auto_401849 ) ) ( not ( = ?auto_401845 ?auto_401850 ) ) ( not ( = ?auto_401845 ?auto_401851 ) ) ( not ( = ?auto_401845 ?auto_401852 ) ) ( not ( = ?auto_401845 ?auto_401853 ) ) ( not ( = ?auto_401845 ?auto_401854 ) ) ( not ( = ?auto_401845 ?auto_401855 ) ) ( not ( = ?auto_401845 ?auto_401856 ) ) ( not ( = ?auto_401845 ?auto_401857 ) ) ( not ( = ?auto_401845 ?auto_401858 ) ) ( not ( = ?auto_401845 ?auto_401859 ) ) ( not ( = ?auto_401846 ?auto_401847 ) ) ( not ( = ?auto_401846 ?auto_401848 ) ) ( not ( = ?auto_401846 ?auto_401849 ) ) ( not ( = ?auto_401846 ?auto_401850 ) ) ( not ( = ?auto_401846 ?auto_401851 ) ) ( not ( = ?auto_401846 ?auto_401852 ) ) ( not ( = ?auto_401846 ?auto_401853 ) ) ( not ( = ?auto_401846 ?auto_401854 ) ) ( not ( = ?auto_401846 ?auto_401855 ) ) ( not ( = ?auto_401846 ?auto_401856 ) ) ( not ( = ?auto_401846 ?auto_401857 ) ) ( not ( = ?auto_401846 ?auto_401858 ) ) ( not ( = ?auto_401846 ?auto_401859 ) ) ( not ( = ?auto_401847 ?auto_401848 ) ) ( not ( = ?auto_401847 ?auto_401849 ) ) ( not ( = ?auto_401847 ?auto_401850 ) ) ( not ( = ?auto_401847 ?auto_401851 ) ) ( not ( = ?auto_401847 ?auto_401852 ) ) ( not ( = ?auto_401847 ?auto_401853 ) ) ( not ( = ?auto_401847 ?auto_401854 ) ) ( not ( = ?auto_401847 ?auto_401855 ) ) ( not ( = ?auto_401847 ?auto_401856 ) ) ( not ( = ?auto_401847 ?auto_401857 ) ) ( not ( = ?auto_401847 ?auto_401858 ) ) ( not ( = ?auto_401847 ?auto_401859 ) ) ( not ( = ?auto_401848 ?auto_401849 ) ) ( not ( = ?auto_401848 ?auto_401850 ) ) ( not ( = ?auto_401848 ?auto_401851 ) ) ( not ( = ?auto_401848 ?auto_401852 ) ) ( not ( = ?auto_401848 ?auto_401853 ) ) ( not ( = ?auto_401848 ?auto_401854 ) ) ( not ( = ?auto_401848 ?auto_401855 ) ) ( not ( = ?auto_401848 ?auto_401856 ) ) ( not ( = ?auto_401848 ?auto_401857 ) ) ( not ( = ?auto_401848 ?auto_401858 ) ) ( not ( = ?auto_401848 ?auto_401859 ) ) ( not ( = ?auto_401849 ?auto_401850 ) ) ( not ( = ?auto_401849 ?auto_401851 ) ) ( not ( = ?auto_401849 ?auto_401852 ) ) ( not ( = ?auto_401849 ?auto_401853 ) ) ( not ( = ?auto_401849 ?auto_401854 ) ) ( not ( = ?auto_401849 ?auto_401855 ) ) ( not ( = ?auto_401849 ?auto_401856 ) ) ( not ( = ?auto_401849 ?auto_401857 ) ) ( not ( = ?auto_401849 ?auto_401858 ) ) ( not ( = ?auto_401849 ?auto_401859 ) ) ( not ( = ?auto_401850 ?auto_401851 ) ) ( not ( = ?auto_401850 ?auto_401852 ) ) ( not ( = ?auto_401850 ?auto_401853 ) ) ( not ( = ?auto_401850 ?auto_401854 ) ) ( not ( = ?auto_401850 ?auto_401855 ) ) ( not ( = ?auto_401850 ?auto_401856 ) ) ( not ( = ?auto_401850 ?auto_401857 ) ) ( not ( = ?auto_401850 ?auto_401858 ) ) ( not ( = ?auto_401850 ?auto_401859 ) ) ( not ( = ?auto_401851 ?auto_401852 ) ) ( not ( = ?auto_401851 ?auto_401853 ) ) ( not ( = ?auto_401851 ?auto_401854 ) ) ( not ( = ?auto_401851 ?auto_401855 ) ) ( not ( = ?auto_401851 ?auto_401856 ) ) ( not ( = ?auto_401851 ?auto_401857 ) ) ( not ( = ?auto_401851 ?auto_401858 ) ) ( not ( = ?auto_401851 ?auto_401859 ) ) ( not ( = ?auto_401852 ?auto_401853 ) ) ( not ( = ?auto_401852 ?auto_401854 ) ) ( not ( = ?auto_401852 ?auto_401855 ) ) ( not ( = ?auto_401852 ?auto_401856 ) ) ( not ( = ?auto_401852 ?auto_401857 ) ) ( not ( = ?auto_401852 ?auto_401858 ) ) ( not ( = ?auto_401852 ?auto_401859 ) ) ( not ( = ?auto_401853 ?auto_401854 ) ) ( not ( = ?auto_401853 ?auto_401855 ) ) ( not ( = ?auto_401853 ?auto_401856 ) ) ( not ( = ?auto_401853 ?auto_401857 ) ) ( not ( = ?auto_401853 ?auto_401858 ) ) ( not ( = ?auto_401853 ?auto_401859 ) ) ( not ( = ?auto_401854 ?auto_401855 ) ) ( not ( = ?auto_401854 ?auto_401856 ) ) ( not ( = ?auto_401854 ?auto_401857 ) ) ( not ( = ?auto_401854 ?auto_401858 ) ) ( not ( = ?auto_401854 ?auto_401859 ) ) ( not ( = ?auto_401855 ?auto_401856 ) ) ( not ( = ?auto_401855 ?auto_401857 ) ) ( not ( = ?auto_401855 ?auto_401858 ) ) ( not ( = ?auto_401855 ?auto_401859 ) ) ( not ( = ?auto_401856 ?auto_401857 ) ) ( not ( = ?auto_401856 ?auto_401858 ) ) ( not ( = ?auto_401856 ?auto_401859 ) ) ( not ( = ?auto_401857 ?auto_401858 ) ) ( not ( = ?auto_401857 ?auto_401859 ) ) ( not ( = ?auto_401858 ?auto_401859 ) ) ( ON ?auto_401857 ?auto_401858 ) ( ON ?auto_401856 ?auto_401857 ) ( ON ?auto_401855 ?auto_401856 ) ( ON ?auto_401854 ?auto_401855 ) ( ON ?auto_401853 ?auto_401854 ) ( ON ?auto_401852 ?auto_401853 ) ( CLEAR ?auto_401850 ) ( ON ?auto_401851 ?auto_401852 ) ( CLEAR ?auto_401851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_401844 ?auto_401845 ?auto_401846 ?auto_401847 ?auto_401848 ?auto_401849 ?auto_401850 ?auto_401851 )
      ( MAKE-15PILE ?auto_401844 ?auto_401845 ?auto_401846 ?auto_401847 ?auto_401848 ?auto_401849 ?auto_401850 ?auto_401851 ?auto_401852 ?auto_401853 ?auto_401854 ?auto_401855 ?auto_401856 ?auto_401857 ?auto_401858 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401875 - BLOCK
      ?auto_401876 - BLOCK
      ?auto_401877 - BLOCK
      ?auto_401878 - BLOCK
      ?auto_401879 - BLOCK
      ?auto_401880 - BLOCK
      ?auto_401881 - BLOCK
      ?auto_401882 - BLOCK
      ?auto_401883 - BLOCK
      ?auto_401884 - BLOCK
      ?auto_401885 - BLOCK
      ?auto_401886 - BLOCK
      ?auto_401887 - BLOCK
      ?auto_401888 - BLOCK
      ?auto_401889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_401889 ) ( ON-TABLE ?auto_401875 ) ( ON ?auto_401876 ?auto_401875 ) ( ON ?auto_401877 ?auto_401876 ) ( ON ?auto_401878 ?auto_401877 ) ( ON ?auto_401879 ?auto_401878 ) ( ON ?auto_401880 ?auto_401879 ) ( ON ?auto_401881 ?auto_401880 ) ( not ( = ?auto_401875 ?auto_401876 ) ) ( not ( = ?auto_401875 ?auto_401877 ) ) ( not ( = ?auto_401875 ?auto_401878 ) ) ( not ( = ?auto_401875 ?auto_401879 ) ) ( not ( = ?auto_401875 ?auto_401880 ) ) ( not ( = ?auto_401875 ?auto_401881 ) ) ( not ( = ?auto_401875 ?auto_401882 ) ) ( not ( = ?auto_401875 ?auto_401883 ) ) ( not ( = ?auto_401875 ?auto_401884 ) ) ( not ( = ?auto_401875 ?auto_401885 ) ) ( not ( = ?auto_401875 ?auto_401886 ) ) ( not ( = ?auto_401875 ?auto_401887 ) ) ( not ( = ?auto_401875 ?auto_401888 ) ) ( not ( = ?auto_401875 ?auto_401889 ) ) ( not ( = ?auto_401876 ?auto_401877 ) ) ( not ( = ?auto_401876 ?auto_401878 ) ) ( not ( = ?auto_401876 ?auto_401879 ) ) ( not ( = ?auto_401876 ?auto_401880 ) ) ( not ( = ?auto_401876 ?auto_401881 ) ) ( not ( = ?auto_401876 ?auto_401882 ) ) ( not ( = ?auto_401876 ?auto_401883 ) ) ( not ( = ?auto_401876 ?auto_401884 ) ) ( not ( = ?auto_401876 ?auto_401885 ) ) ( not ( = ?auto_401876 ?auto_401886 ) ) ( not ( = ?auto_401876 ?auto_401887 ) ) ( not ( = ?auto_401876 ?auto_401888 ) ) ( not ( = ?auto_401876 ?auto_401889 ) ) ( not ( = ?auto_401877 ?auto_401878 ) ) ( not ( = ?auto_401877 ?auto_401879 ) ) ( not ( = ?auto_401877 ?auto_401880 ) ) ( not ( = ?auto_401877 ?auto_401881 ) ) ( not ( = ?auto_401877 ?auto_401882 ) ) ( not ( = ?auto_401877 ?auto_401883 ) ) ( not ( = ?auto_401877 ?auto_401884 ) ) ( not ( = ?auto_401877 ?auto_401885 ) ) ( not ( = ?auto_401877 ?auto_401886 ) ) ( not ( = ?auto_401877 ?auto_401887 ) ) ( not ( = ?auto_401877 ?auto_401888 ) ) ( not ( = ?auto_401877 ?auto_401889 ) ) ( not ( = ?auto_401878 ?auto_401879 ) ) ( not ( = ?auto_401878 ?auto_401880 ) ) ( not ( = ?auto_401878 ?auto_401881 ) ) ( not ( = ?auto_401878 ?auto_401882 ) ) ( not ( = ?auto_401878 ?auto_401883 ) ) ( not ( = ?auto_401878 ?auto_401884 ) ) ( not ( = ?auto_401878 ?auto_401885 ) ) ( not ( = ?auto_401878 ?auto_401886 ) ) ( not ( = ?auto_401878 ?auto_401887 ) ) ( not ( = ?auto_401878 ?auto_401888 ) ) ( not ( = ?auto_401878 ?auto_401889 ) ) ( not ( = ?auto_401879 ?auto_401880 ) ) ( not ( = ?auto_401879 ?auto_401881 ) ) ( not ( = ?auto_401879 ?auto_401882 ) ) ( not ( = ?auto_401879 ?auto_401883 ) ) ( not ( = ?auto_401879 ?auto_401884 ) ) ( not ( = ?auto_401879 ?auto_401885 ) ) ( not ( = ?auto_401879 ?auto_401886 ) ) ( not ( = ?auto_401879 ?auto_401887 ) ) ( not ( = ?auto_401879 ?auto_401888 ) ) ( not ( = ?auto_401879 ?auto_401889 ) ) ( not ( = ?auto_401880 ?auto_401881 ) ) ( not ( = ?auto_401880 ?auto_401882 ) ) ( not ( = ?auto_401880 ?auto_401883 ) ) ( not ( = ?auto_401880 ?auto_401884 ) ) ( not ( = ?auto_401880 ?auto_401885 ) ) ( not ( = ?auto_401880 ?auto_401886 ) ) ( not ( = ?auto_401880 ?auto_401887 ) ) ( not ( = ?auto_401880 ?auto_401888 ) ) ( not ( = ?auto_401880 ?auto_401889 ) ) ( not ( = ?auto_401881 ?auto_401882 ) ) ( not ( = ?auto_401881 ?auto_401883 ) ) ( not ( = ?auto_401881 ?auto_401884 ) ) ( not ( = ?auto_401881 ?auto_401885 ) ) ( not ( = ?auto_401881 ?auto_401886 ) ) ( not ( = ?auto_401881 ?auto_401887 ) ) ( not ( = ?auto_401881 ?auto_401888 ) ) ( not ( = ?auto_401881 ?auto_401889 ) ) ( not ( = ?auto_401882 ?auto_401883 ) ) ( not ( = ?auto_401882 ?auto_401884 ) ) ( not ( = ?auto_401882 ?auto_401885 ) ) ( not ( = ?auto_401882 ?auto_401886 ) ) ( not ( = ?auto_401882 ?auto_401887 ) ) ( not ( = ?auto_401882 ?auto_401888 ) ) ( not ( = ?auto_401882 ?auto_401889 ) ) ( not ( = ?auto_401883 ?auto_401884 ) ) ( not ( = ?auto_401883 ?auto_401885 ) ) ( not ( = ?auto_401883 ?auto_401886 ) ) ( not ( = ?auto_401883 ?auto_401887 ) ) ( not ( = ?auto_401883 ?auto_401888 ) ) ( not ( = ?auto_401883 ?auto_401889 ) ) ( not ( = ?auto_401884 ?auto_401885 ) ) ( not ( = ?auto_401884 ?auto_401886 ) ) ( not ( = ?auto_401884 ?auto_401887 ) ) ( not ( = ?auto_401884 ?auto_401888 ) ) ( not ( = ?auto_401884 ?auto_401889 ) ) ( not ( = ?auto_401885 ?auto_401886 ) ) ( not ( = ?auto_401885 ?auto_401887 ) ) ( not ( = ?auto_401885 ?auto_401888 ) ) ( not ( = ?auto_401885 ?auto_401889 ) ) ( not ( = ?auto_401886 ?auto_401887 ) ) ( not ( = ?auto_401886 ?auto_401888 ) ) ( not ( = ?auto_401886 ?auto_401889 ) ) ( not ( = ?auto_401887 ?auto_401888 ) ) ( not ( = ?auto_401887 ?auto_401889 ) ) ( not ( = ?auto_401888 ?auto_401889 ) ) ( ON ?auto_401888 ?auto_401889 ) ( ON ?auto_401887 ?auto_401888 ) ( ON ?auto_401886 ?auto_401887 ) ( ON ?auto_401885 ?auto_401886 ) ( ON ?auto_401884 ?auto_401885 ) ( ON ?auto_401883 ?auto_401884 ) ( CLEAR ?auto_401881 ) ( ON ?auto_401882 ?auto_401883 ) ( CLEAR ?auto_401882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_401875 ?auto_401876 ?auto_401877 ?auto_401878 ?auto_401879 ?auto_401880 ?auto_401881 ?auto_401882 )
      ( MAKE-15PILE ?auto_401875 ?auto_401876 ?auto_401877 ?auto_401878 ?auto_401879 ?auto_401880 ?auto_401881 ?auto_401882 ?auto_401883 ?auto_401884 ?auto_401885 ?auto_401886 ?auto_401887 ?auto_401888 ?auto_401889 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401905 - BLOCK
      ?auto_401906 - BLOCK
      ?auto_401907 - BLOCK
      ?auto_401908 - BLOCK
      ?auto_401909 - BLOCK
      ?auto_401910 - BLOCK
      ?auto_401911 - BLOCK
      ?auto_401912 - BLOCK
      ?auto_401913 - BLOCK
      ?auto_401914 - BLOCK
      ?auto_401915 - BLOCK
      ?auto_401916 - BLOCK
      ?auto_401917 - BLOCK
      ?auto_401918 - BLOCK
      ?auto_401919 - BLOCK
    )
    :vars
    (
      ?auto_401920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401919 ?auto_401920 ) ( ON-TABLE ?auto_401905 ) ( ON ?auto_401906 ?auto_401905 ) ( ON ?auto_401907 ?auto_401906 ) ( ON ?auto_401908 ?auto_401907 ) ( ON ?auto_401909 ?auto_401908 ) ( ON ?auto_401910 ?auto_401909 ) ( not ( = ?auto_401905 ?auto_401906 ) ) ( not ( = ?auto_401905 ?auto_401907 ) ) ( not ( = ?auto_401905 ?auto_401908 ) ) ( not ( = ?auto_401905 ?auto_401909 ) ) ( not ( = ?auto_401905 ?auto_401910 ) ) ( not ( = ?auto_401905 ?auto_401911 ) ) ( not ( = ?auto_401905 ?auto_401912 ) ) ( not ( = ?auto_401905 ?auto_401913 ) ) ( not ( = ?auto_401905 ?auto_401914 ) ) ( not ( = ?auto_401905 ?auto_401915 ) ) ( not ( = ?auto_401905 ?auto_401916 ) ) ( not ( = ?auto_401905 ?auto_401917 ) ) ( not ( = ?auto_401905 ?auto_401918 ) ) ( not ( = ?auto_401905 ?auto_401919 ) ) ( not ( = ?auto_401905 ?auto_401920 ) ) ( not ( = ?auto_401906 ?auto_401907 ) ) ( not ( = ?auto_401906 ?auto_401908 ) ) ( not ( = ?auto_401906 ?auto_401909 ) ) ( not ( = ?auto_401906 ?auto_401910 ) ) ( not ( = ?auto_401906 ?auto_401911 ) ) ( not ( = ?auto_401906 ?auto_401912 ) ) ( not ( = ?auto_401906 ?auto_401913 ) ) ( not ( = ?auto_401906 ?auto_401914 ) ) ( not ( = ?auto_401906 ?auto_401915 ) ) ( not ( = ?auto_401906 ?auto_401916 ) ) ( not ( = ?auto_401906 ?auto_401917 ) ) ( not ( = ?auto_401906 ?auto_401918 ) ) ( not ( = ?auto_401906 ?auto_401919 ) ) ( not ( = ?auto_401906 ?auto_401920 ) ) ( not ( = ?auto_401907 ?auto_401908 ) ) ( not ( = ?auto_401907 ?auto_401909 ) ) ( not ( = ?auto_401907 ?auto_401910 ) ) ( not ( = ?auto_401907 ?auto_401911 ) ) ( not ( = ?auto_401907 ?auto_401912 ) ) ( not ( = ?auto_401907 ?auto_401913 ) ) ( not ( = ?auto_401907 ?auto_401914 ) ) ( not ( = ?auto_401907 ?auto_401915 ) ) ( not ( = ?auto_401907 ?auto_401916 ) ) ( not ( = ?auto_401907 ?auto_401917 ) ) ( not ( = ?auto_401907 ?auto_401918 ) ) ( not ( = ?auto_401907 ?auto_401919 ) ) ( not ( = ?auto_401907 ?auto_401920 ) ) ( not ( = ?auto_401908 ?auto_401909 ) ) ( not ( = ?auto_401908 ?auto_401910 ) ) ( not ( = ?auto_401908 ?auto_401911 ) ) ( not ( = ?auto_401908 ?auto_401912 ) ) ( not ( = ?auto_401908 ?auto_401913 ) ) ( not ( = ?auto_401908 ?auto_401914 ) ) ( not ( = ?auto_401908 ?auto_401915 ) ) ( not ( = ?auto_401908 ?auto_401916 ) ) ( not ( = ?auto_401908 ?auto_401917 ) ) ( not ( = ?auto_401908 ?auto_401918 ) ) ( not ( = ?auto_401908 ?auto_401919 ) ) ( not ( = ?auto_401908 ?auto_401920 ) ) ( not ( = ?auto_401909 ?auto_401910 ) ) ( not ( = ?auto_401909 ?auto_401911 ) ) ( not ( = ?auto_401909 ?auto_401912 ) ) ( not ( = ?auto_401909 ?auto_401913 ) ) ( not ( = ?auto_401909 ?auto_401914 ) ) ( not ( = ?auto_401909 ?auto_401915 ) ) ( not ( = ?auto_401909 ?auto_401916 ) ) ( not ( = ?auto_401909 ?auto_401917 ) ) ( not ( = ?auto_401909 ?auto_401918 ) ) ( not ( = ?auto_401909 ?auto_401919 ) ) ( not ( = ?auto_401909 ?auto_401920 ) ) ( not ( = ?auto_401910 ?auto_401911 ) ) ( not ( = ?auto_401910 ?auto_401912 ) ) ( not ( = ?auto_401910 ?auto_401913 ) ) ( not ( = ?auto_401910 ?auto_401914 ) ) ( not ( = ?auto_401910 ?auto_401915 ) ) ( not ( = ?auto_401910 ?auto_401916 ) ) ( not ( = ?auto_401910 ?auto_401917 ) ) ( not ( = ?auto_401910 ?auto_401918 ) ) ( not ( = ?auto_401910 ?auto_401919 ) ) ( not ( = ?auto_401910 ?auto_401920 ) ) ( not ( = ?auto_401911 ?auto_401912 ) ) ( not ( = ?auto_401911 ?auto_401913 ) ) ( not ( = ?auto_401911 ?auto_401914 ) ) ( not ( = ?auto_401911 ?auto_401915 ) ) ( not ( = ?auto_401911 ?auto_401916 ) ) ( not ( = ?auto_401911 ?auto_401917 ) ) ( not ( = ?auto_401911 ?auto_401918 ) ) ( not ( = ?auto_401911 ?auto_401919 ) ) ( not ( = ?auto_401911 ?auto_401920 ) ) ( not ( = ?auto_401912 ?auto_401913 ) ) ( not ( = ?auto_401912 ?auto_401914 ) ) ( not ( = ?auto_401912 ?auto_401915 ) ) ( not ( = ?auto_401912 ?auto_401916 ) ) ( not ( = ?auto_401912 ?auto_401917 ) ) ( not ( = ?auto_401912 ?auto_401918 ) ) ( not ( = ?auto_401912 ?auto_401919 ) ) ( not ( = ?auto_401912 ?auto_401920 ) ) ( not ( = ?auto_401913 ?auto_401914 ) ) ( not ( = ?auto_401913 ?auto_401915 ) ) ( not ( = ?auto_401913 ?auto_401916 ) ) ( not ( = ?auto_401913 ?auto_401917 ) ) ( not ( = ?auto_401913 ?auto_401918 ) ) ( not ( = ?auto_401913 ?auto_401919 ) ) ( not ( = ?auto_401913 ?auto_401920 ) ) ( not ( = ?auto_401914 ?auto_401915 ) ) ( not ( = ?auto_401914 ?auto_401916 ) ) ( not ( = ?auto_401914 ?auto_401917 ) ) ( not ( = ?auto_401914 ?auto_401918 ) ) ( not ( = ?auto_401914 ?auto_401919 ) ) ( not ( = ?auto_401914 ?auto_401920 ) ) ( not ( = ?auto_401915 ?auto_401916 ) ) ( not ( = ?auto_401915 ?auto_401917 ) ) ( not ( = ?auto_401915 ?auto_401918 ) ) ( not ( = ?auto_401915 ?auto_401919 ) ) ( not ( = ?auto_401915 ?auto_401920 ) ) ( not ( = ?auto_401916 ?auto_401917 ) ) ( not ( = ?auto_401916 ?auto_401918 ) ) ( not ( = ?auto_401916 ?auto_401919 ) ) ( not ( = ?auto_401916 ?auto_401920 ) ) ( not ( = ?auto_401917 ?auto_401918 ) ) ( not ( = ?auto_401917 ?auto_401919 ) ) ( not ( = ?auto_401917 ?auto_401920 ) ) ( not ( = ?auto_401918 ?auto_401919 ) ) ( not ( = ?auto_401918 ?auto_401920 ) ) ( not ( = ?auto_401919 ?auto_401920 ) ) ( ON ?auto_401918 ?auto_401919 ) ( ON ?auto_401917 ?auto_401918 ) ( ON ?auto_401916 ?auto_401917 ) ( ON ?auto_401915 ?auto_401916 ) ( ON ?auto_401914 ?auto_401915 ) ( ON ?auto_401913 ?auto_401914 ) ( ON ?auto_401912 ?auto_401913 ) ( CLEAR ?auto_401910 ) ( ON ?auto_401911 ?auto_401912 ) ( CLEAR ?auto_401911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_401905 ?auto_401906 ?auto_401907 ?auto_401908 ?auto_401909 ?auto_401910 ?auto_401911 )
      ( MAKE-15PILE ?auto_401905 ?auto_401906 ?auto_401907 ?auto_401908 ?auto_401909 ?auto_401910 ?auto_401911 ?auto_401912 ?auto_401913 ?auto_401914 ?auto_401915 ?auto_401916 ?auto_401917 ?auto_401918 ?auto_401919 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401936 - BLOCK
      ?auto_401937 - BLOCK
      ?auto_401938 - BLOCK
      ?auto_401939 - BLOCK
      ?auto_401940 - BLOCK
      ?auto_401941 - BLOCK
      ?auto_401942 - BLOCK
      ?auto_401943 - BLOCK
      ?auto_401944 - BLOCK
      ?auto_401945 - BLOCK
      ?auto_401946 - BLOCK
      ?auto_401947 - BLOCK
      ?auto_401948 - BLOCK
      ?auto_401949 - BLOCK
      ?auto_401950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_401950 ) ( ON-TABLE ?auto_401936 ) ( ON ?auto_401937 ?auto_401936 ) ( ON ?auto_401938 ?auto_401937 ) ( ON ?auto_401939 ?auto_401938 ) ( ON ?auto_401940 ?auto_401939 ) ( ON ?auto_401941 ?auto_401940 ) ( not ( = ?auto_401936 ?auto_401937 ) ) ( not ( = ?auto_401936 ?auto_401938 ) ) ( not ( = ?auto_401936 ?auto_401939 ) ) ( not ( = ?auto_401936 ?auto_401940 ) ) ( not ( = ?auto_401936 ?auto_401941 ) ) ( not ( = ?auto_401936 ?auto_401942 ) ) ( not ( = ?auto_401936 ?auto_401943 ) ) ( not ( = ?auto_401936 ?auto_401944 ) ) ( not ( = ?auto_401936 ?auto_401945 ) ) ( not ( = ?auto_401936 ?auto_401946 ) ) ( not ( = ?auto_401936 ?auto_401947 ) ) ( not ( = ?auto_401936 ?auto_401948 ) ) ( not ( = ?auto_401936 ?auto_401949 ) ) ( not ( = ?auto_401936 ?auto_401950 ) ) ( not ( = ?auto_401937 ?auto_401938 ) ) ( not ( = ?auto_401937 ?auto_401939 ) ) ( not ( = ?auto_401937 ?auto_401940 ) ) ( not ( = ?auto_401937 ?auto_401941 ) ) ( not ( = ?auto_401937 ?auto_401942 ) ) ( not ( = ?auto_401937 ?auto_401943 ) ) ( not ( = ?auto_401937 ?auto_401944 ) ) ( not ( = ?auto_401937 ?auto_401945 ) ) ( not ( = ?auto_401937 ?auto_401946 ) ) ( not ( = ?auto_401937 ?auto_401947 ) ) ( not ( = ?auto_401937 ?auto_401948 ) ) ( not ( = ?auto_401937 ?auto_401949 ) ) ( not ( = ?auto_401937 ?auto_401950 ) ) ( not ( = ?auto_401938 ?auto_401939 ) ) ( not ( = ?auto_401938 ?auto_401940 ) ) ( not ( = ?auto_401938 ?auto_401941 ) ) ( not ( = ?auto_401938 ?auto_401942 ) ) ( not ( = ?auto_401938 ?auto_401943 ) ) ( not ( = ?auto_401938 ?auto_401944 ) ) ( not ( = ?auto_401938 ?auto_401945 ) ) ( not ( = ?auto_401938 ?auto_401946 ) ) ( not ( = ?auto_401938 ?auto_401947 ) ) ( not ( = ?auto_401938 ?auto_401948 ) ) ( not ( = ?auto_401938 ?auto_401949 ) ) ( not ( = ?auto_401938 ?auto_401950 ) ) ( not ( = ?auto_401939 ?auto_401940 ) ) ( not ( = ?auto_401939 ?auto_401941 ) ) ( not ( = ?auto_401939 ?auto_401942 ) ) ( not ( = ?auto_401939 ?auto_401943 ) ) ( not ( = ?auto_401939 ?auto_401944 ) ) ( not ( = ?auto_401939 ?auto_401945 ) ) ( not ( = ?auto_401939 ?auto_401946 ) ) ( not ( = ?auto_401939 ?auto_401947 ) ) ( not ( = ?auto_401939 ?auto_401948 ) ) ( not ( = ?auto_401939 ?auto_401949 ) ) ( not ( = ?auto_401939 ?auto_401950 ) ) ( not ( = ?auto_401940 ?auto_401941 ) ) ( not ( = ?auto_401940 ?auto_401942 ) ) ( not ( = ?auto_401940 ?auto_401943 ) ) ( not ( = ?auto_401940 ?auto_401944 ) ) ( not ( = ?auto_401940 ?auto_401945 ) ) ( not ( = ?auto_401940 ?auto_401946 ) ) ( not ( = ?auto_401940 ?auto_401947 ) ) ( not ( = ?auto_401940 ?auto_401948 ) ) ( not ( = ?auto_401940 ?auto_401949 ) ) ( not ( = ?auto_401940 ?auto_401950 ) ) ( not ( = ?auto_401941 ?auto_401942 ) ) ( not ( = ?auto_401941 ?auto_401943 ) ) ( not ( = ?auto_401941 ?auto_401944 ) ) ( not ( = ?auto_401941 ?auto_401945 ) ) ( not ( = ?auto_401941 ?auto_401946 ) ) ( not ( = ?auto_401941 ?auto_401947 ) ) ( not ( = ?auto_401941 ?auto_401948 ) ) ( not ( = ?auto_401941 ?auto_401949 ) ) ( not ( = ?auto_401941 ?auto_401950 ) ) ( not ( = ?auto_401942 ?auto_401943 ) ) ( not ( = ?auto_401942 ?auto_401944 ) ) ( not ( = ?auto_401942 ?auto_401945 ) ) ( not ( = ?auto_401942 ?auto_401946 ) ) ( not ( = ?auto_401942 ?auto_401947 ) ) ( not ( = ?auto_401942 ?auto_401948 ) ) ( not ( = ?auto_401942 ?auto_401949 ) ) ( not ( = ?auto_401942 ?auto_401950 ) ) ( not ( = ?auto_401943 ?auto_401944 ) ) ( not ( = ?auto_401943 ?auto_401945 ) ) ( not ( = ?auto_401943 ?auto_401946 ) ) ( not ( = ?auto_401943 ?auto_401947 ) ) ( not ( = ?auto_401943 ?auto_401948 ) ) ( not ( = ?auto_401943 ?auto_401949 ) ) ( not ( = ?auto_401943 ?auto_401950 ) ) ( not ( = ?auto_401944 ?auto_401945 ) ) ( not ( = ?auto_401944 ?auto_401946 ) ) ( not ( = ?auto_401944 ?auto_401947 ) ) ( not ( = ?auto_401944 ?auto_401948 ) ) ( not ( = ?auto_401944 ?auto_401949 ) ) ( not ( = ?auto_401944 ?auto_401950 ) ) ( not ( = ?auto_401945 ?auto_401946 ) ) ( not ( = ?auto_401945 ?auto_401947 ) ) ( not ( = ?auto_401945 ?auto_401948 ) ) ( not ( = ?auto_401945 ?auto_401949 ) ) ( not ( = ?auto_401945 ?auto_401950 ) ) ( not ( = ?auto_401946 ?auto_401947 ) ) ( not ( = ?auto_401946 ?auto_401948 ) ) ( not ( = ?auto_401946 ?auto_401949 ) ) ( not ( = ?auto_401946 ?auto_401950 ) ) ( not ( = ?auto_401947 ?auto_401948 ) ) ( not ( = ?auto_401947 ?auto_401949 ) ) ( not ( = ?auto_401947 ?auto_401950 ) ) ( not ( = ?auto_401948 ?auto_401949 ) ) ( not ( = ?auto_401948 ?auto_401950 ) ) ( not ( = ?auto_401949 ?auto_401950 ) ) ( ON ?auto_401949 ?auto_401950 ) ( ON ?auto_401948 ?auto_401949 ) ( ON ?auto_401947 ?auto_401948 ) ( ON ?auto_401946 ?auto_401947 ) ( ON ?auto_401945 ?auto_401946 ) ( ON ?auto_401944 ?auto_401945 ) ( ON ?auto_401943 ?auto_401944 ) ( CLEAR ?auto_401941 ) ( ON ?auto_401942 ?auto_401943 ) ( CLEAR ?auto_401942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_401936 ?auto_401937 ?auto_401938 ?auto_401939 ?auto_401940 ?auto_401941 ?auto_401942 )
      ( MAKE-15PILE ?auto_401936 ?auto_401937 ?auto_401938 ?auto_401939 ?auto_401940 ?auto_401941 ?auto_401942 ?auto_401943 ?auto_401944 ?auto_401945 ?auto_401946 ?auto_401947 ?auto_401948 ?auto_401949 ?auto_401950 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401966 - BLOCK
      ?auto_401967 - BLOCK
      ?auto_401968 - BLOCK
      ?auto_401969 - BLOCK
      ?auto_401970 - BLOCK
      ?auto_401971 - BLOCK
      ?auto_401972 - BLOCK
      ?auto_401973 - BLOCK
      ?auto_401974 - BLOCK
      ?auto_401975 - BLOCK
      ?auto_401976 - BLOCK
      ?auto_401977 - BLOCK
      ?auto_401978 - BLOCK
      ?auto_401979 - BLOCK
      ?auto_401980 - BLOCK
    )
    :vars
    (
      ?auto_401981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_401980 ?auto_401981 ) ( ON-TABLE ?auto_401966 ) ( ON ?auto_401967 ?auto_401966 ) ( ON ?auto_401968 ?auto_401967 ) ( ON ?auto_401969 ?auto_401968 ) ( ON ?auto_401970 ?auto_401969 ) ( not ( = ?auto_401966 ?auto_401967 ) ) ( not ( = ?auto_401966 ?auto_401968 ) ) ( not ( = ?auto_401966 ?auto_401969 ) ) ( not ( = ?auto_401966 ?auto_401970 ) ) ( not ( = ?auto_401966 ?auto_401971 ) ) ( not ( = ?auto_401966 ?auto_401972 ) ) ( not ( = ?auto_401966 ?auto_401973 ) ) ( not ( = ?auto_401966 ?auto_401974 ) ) ( not ( = ?auto_401966 ?auto_401975 ) ) ( not ( = ?auto_401966 ?auto_401976 ) ) ( not ( = ?auto_401966 ?auto_401977 ) ) ( not ( = ?auto_401966 ?auto_401978 ) ) ( not ( = ?auto_401966 ?auto_401979 ) ) ( not ( = ?auto_401966 ?auto_401980 ) ) ( not ( = ?auto_401966 ?auto_401981 ) ) ( not ( = ?auto_401967 ?auto_401968 ) ) ( not ( = ?auto_401967 ?auto_401969 ) ) ( not ( = ?auto_401967 ?auto_401970 ) ) ( not ( = ?auto_401967 ?auto_401971 ) ) ( not ( = ?auto_401967 ?auto_401972 ) ) ( not ( = ?auto_401967 ?auto_401973 ) ) ( not ( = ?auto_401967 ?auto_401974 ) ) ( not ( = ?auto_401967 ?auto_401975 ) ) ( not ( = ?auto_401967 ?auto_401976 ) ) ( not ( = ?auto_401967 ?auto_401977 ) ) ( not ( = ?auto_401967 ?auto_401978 ) ) ( not ( = ?auto_401967 ?auto_401979 ) ) ( not ( = ?auto_401967 ?auto_401980 ) ) ( not ( = ?auto_401967 ?auto_401981 ) ) ( not ( = ?auto_401968 ?auto_401969 ) ) ( not ( = ?auto_401968 ?auto_401970 ) ) ( not ( = ?auto_401968 ?auto_401971 ) ) ( not ( = ?auto_401968 ?auto_401972 ) ) ( not ( = ?auto_401968 ?auto_401973 ) ) ( not ( = ?auto_401968 ?auto_401974 ) ) ( not ( = ?auto_401968 ?auto_401975 ) ) ( not ( = ?auto_401968 ?auto_401976 ) ) ( not ( = ?auto_401968 ?auto_401977 ) ) ( not ( = ?auto_401968 ?auto_401978 ) ) ( not ( = ?auto_401968 ?auto_401979 ) ) ( not ( = ?auto_401968 ?auto_401980 ) ) ( not ( = ?auto_401968 ?auto_401981 ) ) ( not ( = ?auto_401969 ?auto_401970 ) ) ( not ( = ?auto_401969 ?auto_401971 ) ) ( not ( = ?auto_401969 ?auto_401972 ) ) ( not ( = ?auto_401969 ?auto_401973 ) ) ( not ( = ?auto_401969 ?auto_401974 ) ) ( not ( = ?auto_401969 ?auto_401975 ) ) ( not ( = ?auto_401969 ?auto_401976 ) ) ( not ( = ?auto_401969 ?auto_401977 ) ) ( not ( = ?auto_401969 ?auto_401978 ) ) ( not ( = ?auto_401969 ?auto_401979 ) ) ( not ( = ?auto_401969 ?auto_401980 ) ) ( not ( = ?auto_401969 ?auto_401981 ) ) ( not ( = ?auto_401970 ?auto_401971 ) ) ( not ( = ?auto_401970 ?auto_401972 ) ) ( not ( = ?auto_401970 ?auto_401973 ) ) ( not ( = ?auto_401970 ?auto_401974 ) ) ( not ( = ?auto_401970 ?auto_401975 ) ) ( not ( = ?auto_401970 ?auto_401976 ) ) ( not ( = ?auto_401970 ?auto_401977 ) ) ( not ( = ?auto_401970 ?auto_401978 ) ) ( not ( = ?auto_401970 ?auto_401979 ) ) ( not ( = ?auto_401970 ?auto_401980 ) ) ( not ( = ?auto_401970 ?auto_401981 ) ) ( not ( = ?auto_401971 ?auto_401972 ) ) ( not ( = ?auto_401971 ?auto_401973 ) ) ( not ( = ?auto_401971 ?auto_401974 ) ) ( not ( = ?auto_401971 ?auto_401975 ) ) ( not ( = ?auto_401971 ?auto_401976 ) ) ( not ( = ?auto_401971 ?auto_401977 ) ) ( not ( = ?auto_401971 ?auto_401978 ) ) ( not ( = ?auto_401971 ?auto_401979 ) ) ( not ( = ?auto_401971 ?auto_401980 ) ) ( not ( = ?auto_401971 ?auto_401981 ) ) ( not ( = ?auto_401972 ?auto_401973 ) ) ( not ( = ?auto_401972 ?auto_401974 ) ) ( not ( = ?auto_401972 ?auto_401975 ) ) ( not ( = ?auto_401972 ?auto_401976 ) ) ( not ( = ?auto_401972 ?auto_401977 ) ) ( not ( = ?auto_401972 ?auto_401978 ) ) ( not ( = ?auto_401972 ?auto_401979 ) ) ( not ( = ?auto_401972 ?auto_401980 ) ) ( not ( = ?auto_401972 ?auto_401981 ) ) ( not ( = ?auto_401973 ?auto_401974 ) ) ( not ( = ?auto_401973 ?auto_401975 ) ) ( not ( = ?auto_401973 ?auto_401976 ) ) ( not ( = ?auto_401973 ?auto_401977 ) ) ( not ( = ?auto_401973 ?auto_401978 ) ) ( not ( = ?auto_401973 ?auto_401979 ) ) ( not ( = ?auto_401973 ?auto_401980 ) ) ( not ( = ?auto_401973 ?auto_401981 ) ) ( not ( = ?auto_401974 ?auto_401975 ) ) ( not ( = ?auto_401974 ?auto_401976 ) ) ( not ( = ?auto_401974 ?auto_401977 ) ) ( not ( = ?auto_401974 ?auto_401978 ) ) ( not ( = ?auto_401974 ?auto_401979 ) ) ( not ( = ?auto_401974 ?auto_401980 ) ) ( not ( = ?auto_401974 ?auto_401981 ) ) ( not ( = ?auto_401975 ?auto_401976 ) ) ( not ( = ?auto_401975 ?auto_401977 ) ) ( not ( = ?auto_401975 ?auto_401978 ) ) ( not ( = ?auto_401975 ?auto_401979 ) ) ( not ( = ?auto_401975 ?auto_401980 ) ) ( not ( = ?auto_401975 ?auto_401981 ) ) ( not ( = ?auto_401976 ?auto_401977 ) ) ( not ( = ?auto_401976 ?auto_401978 ) ) ( not ( = ?auto_401976 ?auto_401979 ) ) ( not ( = ?auto_401976 ?auto_401980 ) ) ( not ( = ?auto_401976 ?auto_401981 ) ) ( not ( = ?auto_401977 ?auto_401978 ) ) ( not ( = ?auto_401977 ?auto_401979 ) ) ( not ( = ?auto_401977 ?auto_401980 ) ) ( not ( = ?auto_401977 ?auto_401981 ) ) ( not ( = ?auto_401978 ?auto_401979 ) ) ( not ( = ?auto_401978 ?auto_401980 ) ) ( not ( = ?auto_401978 ?auto_401981 ) ) ( not ( = ?auto_401979 ?auto_401980 ) ) ( not ( = ?auto_401979 ?auto_401981 ) ) ( not ( = ?auto_401980 ?auto_401981 ) ) ( ON ?auto_401979 ?auto_401980 ) ( ON ?auto_401978 ?auto_401979 ) ( ON ?auto_401977 ?auto_401978 ) ( ON ?auto_401976 ?auto_401977 ) ( ON ?auto_401975 ?auto_401976 ) ( ON ?auto_401974 ?auto_401975 ) ( ON ?auto_401973 ?auto_401974 ) ( ON ?auto_401972 ?auto_401973 ) ( CLEAR ?auto_401970 ) ( ON ?auto_401971 ?auto_401972 ) ( CLEAR ?auto_401971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_401966 ?auto_401967 ?auto_401968 ?auto_401969 ?auto_401970 ?auto_401971 )
      ( MAKE-15PILE ?auto_401966 ?auto_401967 ?auto_401968 ?auto_401969 ?auto_401970 ?auto_401971 ?auto_401972 ?auto_401973 ?auto_401974 ?auto_401975 ?auto_401976 ?auto_401977 ?auto_401978 ?auto_401979 ?auto_401980 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_401997 - BLOCK
      ?auto_401998 - BLOCK
      ?auto_401999 - BLOCK
      ?auto_402000 - BLOCK
      ?auto_402001 - BLOCK
      ?auto_402002 - BLOCK
      ?auto_402003 - BLOCK
      ?auto_402004 - BLOCK
      ?auto_402005 - BLOCK
      ?auto_402006 - BLOCK
      ?auto_402007 - BLOCK
      ?auto_402008 - BLOCK
      ?auto_402009 - BLOCK
      ?auto_402010 - BLOCK
      ?auto_402011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_402011 ) ( ON-TABLE ?auto_401997 ) ( ON ?auto_401998 ?auto_401997 ) ( ON ?auto_401999 ?auto_401998 ) ( ON ?auto_402000 ?auto_401999 ) ( ON ?auto_402001 ?auto_402000 ) ( not ( = ?auto_401997 ?auto_401998 ) ) ( not ( = ?auto_401997 ?auto_401999 ) ) ( not ( = ?auto_401997 ?auto_402000 ) ) ( not ( = ?auto_401997 ?auto_402001 ) ) ( not ( = ?auto_401997 ?auto_402002 ) ) ( not ( = ?auto_401997 ?auto_402003 ) ) ( not ( = ?auto_401997 ?auto_402004 ) ) ( not ( = ?auto_401997 ?auto_402005 ) ) ( not ( = ?auto_401997 ?auto_402006 ) ) ( not ( = ?auto_401997 ?auto_402007 ) ) ( not ( = ?auto_401997 ?auto_402008 ) ) ( not ( = ?auto_401997 ?auto_402009 ) ) ( not ( = ?auto_401997 ?auto_402010 ) ) ( not ( = ?auto_401997 ?auto_402011 ) ) ( not ( = ?auto_401998 ?auto_401999 ) ) ( not ( = ?auto_401998 ?auto_402000 ) ) ( not ( = ?auto_401998 ?auto_402001 ) ) ( not ( = ?auto_401998 ?auto_402002 ) ) ( not ( = ?auto_401998 ?auto_402003 ) ) ( not ( = ?auto_401998 ?auto_402004 ) ) ( not ( = ?auto_401998 ?auto_402005 ) ) ( not ( = ?auto_401998 ?auto_402006 ) ) ( not ( = ?auto_401998 ?auto_402007 ) ) ( not ( = ?auto_401998 ?auto_402008 ) ) ( not ( = ?auto_401998 ?auto_402009 ) ) ( not ( = ?auto_401998 ?auto_402010 ) ) ( not ( = ?auto_401998 ?auto_402011 ) ) ( not ( = ?auto_401999 ?auto_402000 ) ) ( not ( = ?auto_401999 ?auto_402001 ) ) ( not ( = ?auto_401999 ?auto_402002 ) ) ( not ( = ?auto_401999 ?auto_402003 ) ) ( not ( = ?auto_401999 ?auto_402004 ) ) ( not ( = ?auto_401999 ?auto_402005 ) ) ( not ( = ?auto_401999 ?auto_402006 ) ) ( not ( = ?auto_401999 ?auto_402007 ) ) ( not ( = ?auto_401999 ?auto_402008 ) ) ( not ( = ?auto_401999 ?auto_402009 ) ) ( not ( = ?auto_401999 ?auto_402010 ) ) ( not ( = ?auto_401999 ?auto_402011 ) ) ( not ( = ?auto_402000 ?auto_402001 ) ) ( not ( = ?auto_402000 ?auto_402002 ) ) ( not ( = ?auto_402000 ?auto_402003 ) ) ( not ( = ?auto_402000 ?auto_402004 ) ) ( not ( = ?auto_402000 ?auto_402005 ) ) ( not ( = ?auto_402000 ?auto_402006 ) ) ( not ( = ?auto_402000 ?auto_402007 ) ) ( not ( = ?auto_402000 ?auto_402008 ) ) ( not ( = ?auto_402000 ?auto_402009 ) ) ( not ( = ?auto_402000 ?auto_402010 ) ) ( not ( = ?auto_402000 ?auto_402011 ) ) ( not ( = ?auto_402001 ?auto_402002 ) ) ( not ( = ?auto_402001 ?auto_402003 ) ) ( not ( = ?auto_402001 ?auto_402004 ) ) ( not ( = ?auto_402001 ?auto_402005 ) ) ( not ( = ?auto_402001 ?auto_402006 ) ) ( not ( = ?auto_402001 ?auto_402007 ) ) ( not ( = ?auto_402001 ?auto_402008 ) ) ( not ( = ?auto_402001 ?auto_402009 ) ) ( not ( = ?auto_402001 ?auto_402010 ) ) ( not ( = ?auto_402001 ?auto_402011 ) ) ( not ( = ?auto_402002 ?auto_402003 ) ) ( not ( = ?auto_402002 ?auto_402004 ) ) ( not ( = ?auto_402002 ?auto_402005 ) ) ( not ( = ?auto_402002 ?auto_402006 ) ) ( not ( = ?auto_402002 ?auto_402007 ) ) ( not ( = ?auto_402002 ?auto_402008 ) ) ( not ( = ?auto_402002 ?auto_402009 ) ) ( not ( = ?auto_402002 ?auto_402010 ) ) ( not ( = ?auto_402002 ?auto_402011 ) ) ( not ( = ?auto_402003 ?auto_402004 ) ) ( not ( = ?auto_402003 ?auto_402005 ) ) ( not ( = ?auto_402003 ?auto_402006 ) ) ( not ( = ?auto_402003 ?auto_402007 ) ) ( not ( = ?auto_402003 ?auto_402008 ) ) ( not ( = ?auto_402003 ?auto_402009 ) ) ( not ( = ?auto_402003 ?auto_402010 ) ) ( not ( = ?auto_402003 ?auto_402011 ) ) ( not ( = ?auto_402004 ?auto_402005 ) ) ( not ( = ?auto_402004 ?auto_402006 ) ) ( not ( = ?auto_402004 ?auto_402007 ) ) ( not ( = ?auto_402004 ?auto_402008 ) ) ( not ( = ?auto_402004 ?auto_402009 ) ) ( not ( = ?auto_402004 ?auto_402010 ) ) ( not ( = ?auto_402004 ?auto_402011 ) ) ( not ( = ?auto_402005 ?auto_402006 ) ) ( not ( = ?auto_402005 ?auto_402007 ) ) ( not ( = ?auto_402005 ?auto_402008 ) ) ( not ( = ?auto_402005 ?auto_402009 ) ) ( not ( = ?auto_402005 ?auto_402010 ) ) ( not ( = ?auto_402005 ?auto_402011 ) ) ( not ( = ?auto_402006 ?auto_402007 ) ) ( not ( = ?auto_402006 ?auto_402008 ) ) ( not ( = ?auto_402006 ?auto_402009 ) ) ( not ( = ?auto_402006 ?auto_402010 ) ) ( not ( = ?auto_402006 ?auto_402011 ) ) ( not ( = ?auto_402007 ?auto_402008 ) ) ( not ( = ?auto_402007 ?auto_402009 ) ) ( not ( = ?auto_402007 ?auto_402010 ) ) ( not ( = ?auto_402007 ?auto_402011 ) ) ( not ( = ?auto_402008 ?auto_402009 ) ) ( not ( = ?auto_402008 ?auto_402010 ) ) ( not ( = ?auto_402008 ?auto_402011 ) ) ( not ( = ?auto_402009 ?auto_402010 ) ) ( not ( = ?auto_402009 ?auto_402011 ) ) ( not ( = ?auto_402010 ?auto_402011 ) ) ( ON ?auto_402010 ?auto_402011 ) ( ON ?auto_402009 ?auto_402010 ) ( ON ?auto_402008 ?auto_402009 ) ( ON ?auto_402007 ?auto_402008 ) ( ON ?auto_402006 ?auto_402007 ) ( ON ?auto_402005 ?auto_402006 ) ( ON ?auto_402004 ?auto_402005 ) ( ON ?auto_402003 ?auto_402004 ) ( CLEAR ?auto_402001 ) ( ON ?auto_402002 ?auto_402003 ) ( CLEAR ?auto_402002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_401997 ?auto_401998 ?auto_401999 ?auto_402000 ?auto_402001 ?auto_402002 )
      ( MAKE-15PILE ?auto_401997 ?auto_401998 ?auto_401999 ?auto_402000 ?auto_402001 ?auto_402002 ?auto_402003 ?auto_402004 ?auto_402005 ?auto_402006 ?auto_402007 ?auto_402008 ?auto_402009 ?auto_402010 ?auto_402011 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_402027 - BLOCK
      ?auto_402028 - BLOCK
      ?auto_402029 - BLOCK
      ?auto_402030 - BLOCK
      ?auto_402031 - BLOCK
      ?auto_402032 - BLOCK
      ?auto_402033 - BLOCK
      ?auto_402034 - BLOCK
      ?auto_402035 - BLOCK
      ?auto_402036 - BLOCK
      ?auto_402037 - BLOCK
      ?auto_402038 - BLOCK
      ?auto_402039 - BLOCK
      ?auto_402040 - BLOCK
      ?auto_402041 - BLOCK
    )
    :vars
    (
      ?auto_402042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402041 ?auto_402042 ) ( ON-TABLE ?auto_402027 ) ( ON ?auto_402028 ?auto_402027 ) ( ON ?auto_402029 ?auto_402028 ) ( ON ?auto_402030 ?auto_402029 ) ( not ( = ?auto_402027 ?auto_402028 ) ) ( not ( = ?auto_402027 ?auto_402029 ) ) ( not ( = ?auto_402027 ?auto_402030 ) ) ( not ( = ?auto_402027 ?auto_402031 ) ) ( not ( = ?auto_402027 ?auto_402032 ) ) ( not ( = ?auto_402027 ?auto_402033 ) ) ( not ( = ?auto_402027 ?auto_402034 ) ) ( not ( = ?auto_402027 ?auto_402035 ) ) ( not ( = ?auto_402027 ?auto_402036 ) ) ( not ( = ?auto_402027 ?auto_402037 ) ) ( not ( = ?auto_402027 ?auto_402038 ) ) ( not ( = ?auto_402027 ?auto_402039 ) ) ( not ( = ?auto_402027 ?auto_402040 ) ) ( not ( = ?auto_402027 ?auto_402041 ) ) ( not ( = ?auto_402027 ?auto_402042 ) ) ( not ( = ?auto_402028 ?auto_402029 ) ) ( not ( = ?auto_402028 ?auto_402030 ) ) ( not ( = ?auto_402028 ?auto_402031 ) ) ( not ( = ?auto_402028 ?auto_402032 ) ) ( not ( = ?auto_402028 ?auto_402033 ) ) ( not ( = ?auto_402028 ?auto_402034 ) ) ( not ( = ?auto_402028 ?auto_402035 ) ) ( not ( = ?auto_402028 ?auto_402036 ) ) ( not ( = ?auto_402028 ?auto_402037 ) ) ( not ( = ?auto_402028 ?auto_402038 ) ) ( not ( = ?auto_402028 ?auto_402039 ) ) ( not ( = ?auto_402028 ?auto_402040 ) ) ( not ( = ?auto_402028 ?auto_402041 ) ) ( not ( = ?auto_402028 ?auto_402042 ) ) ( not ( = ?auto_402029 ?auto_402030 ) ) ( not ( = ?auto_402029 ?auto_402031 ) ) ( not ( = ?auto_402029 ?auto_402032 ) ) ( not ( = ?auto_402029 ?auto_402033 ) ) ( not ( = ?auto_402029 ?auto_402034 ) ) ( not ( = ?auto_402029 ?auto_402035 ) ) ( not ( = ?auto_402029 ?auto_402036 ) ) ( not ( = ?auto_402029 ?auto_402037 ) ) ( not ( = ?auto_402029 ?auto_402038 ) ) ( not ( = ?auto_402029 ?auto_402039 ) ) ( not ( = ?auto_402029 ?auto_402040 ) ) ( not ( = ?auto_402029 ?auto_402041 ) ) ( not ( = ?auto_402029 ?auto_402042 ) ) ( not ( = ?auto_402030 ?auto_402031 ) ) ( not ( = ?auto_402030 ?auto_402032 ) ) ( not ( = ?auto_402030 ?auto_402033 ) ) ( not ( = ?auto_402030 ?auto_402034 ) ) ( not ( = ?auto_402030 ?auto_402035 ) ) ( not ( = ?auto_402030 ?auto_402036 ) ) ( not ( = ?auto_402030 ?auto_402037 ) ) ( not ( = ?auto_402030 ?auto_402038 ) ) ( not ( = ?auto_402030 ?auto_402039 ) ) ( not ( = ?auto_402030 ?auto_402040 ) ) ( not ( = ?auto_402030 ?auto_402041 ) ) ( not ( = ?auto_402030 ?auto_402042 ) ) ( not ( = ?auto_402031 ?auto_402032 ) ) ( not ( = ?auto_402031 ?auto_402033 ) ) ( not ( = ?auto_402031 ?auto_402034 ) ) ( not ( = ?auto_402031 ?auto_402035 ) ) ( not ( = ?auto_402031 ?auto_402036 ) ) ( not ( = ?auto_402031 ?auto_402037 ) ) ( not ( = ?auto_402031 ?auto_402038 ) ) ( not ( = ?auto_402031 ?auto_402039 ) ) ( not ( = ?auto_402031 ?auto_402040 ) ) ( not ( = ?auto_402031 ?auto_402041 ) ) ( not ( = ?auto_402031 ?auto_402042 ) ) ( not ( = ?auto_402032 ?auto_402033 ) ) ( not ( = ?auto_402032 ?auto_402034 ) ) ( not ( = ?auto_402032 ?auto_402035 ) ) ( not ( = ?auto_402032 ?auto_402036 ) ) ( not ( = ?auto_402032 ?auto_402037 ) ) ( not ( = ?auto_402032 ?auto_402038 ) ) ( not ( = ?auto_402032 ?auto_402039 ) ) ( not ( = ?auto_402032 ?auto_402040 ) ) ( not ( = ?auto_402032 ?auto_402041 ) ) ( not ( = ?auto_402032 ?auto_402042 ) ) ( not ( = ?auto_402033 ?auto_402034 ) ) ( not ( = ?auto_402033 ?auto_402035 ) ) ( not ( = ?auto_402033 ?auto_402036 ) ) ( not ( = ?auto_402033 ?auto_402037 ) ) ( not ( = ?auto_402033 ?auto_402038 ) ) ( not ( = ?auto_402033 ?auto_402039 ) ) ( not ( = ?auto_402033 ?auto_402040 ) ) ( not ( = ?auto_402033 ?auto_402041 ) ) ( not ( = ?auto_402033 ?auto_402042 ) ) ( not ( = ?auto_402034 ?auto_402035 ) ) ( not ( = ?auto_402034 ?auto_402036 ) ) ( not ( = ?auto_402034 ?auto_402037 ) ) ( not ( = ?auto_402034 ?auto_402038 ) ) ( not ( = ?auto_402034 ?auto_402039 ) ) ( not ( = ?auto_402034 ?auto_402040 ) ) ( not ( = ?auto_402034 ?auto_402041 ) ) ( not ( = ?auto_402034 ?auto_402042 ) ) ( not ( = ?auto_402035 ?auto_402036 ) ) ( not ( = ?auto_402035 ?auto_402037 ) ) ( not ( = ?auto_402035 ?auto_402038 ) ) ( not ( = ?auto_402035 ?auto_402039 ) ) ( not ( = ?auto_402035 ?auto_402040 ) ) ( not ( = ?auto_402035 ?auto_402041 ) ) ( not ( = ?auto_402035 ?auto_402042 ) ) ( not ( = ?auto_402036 ?auto_402037 ) ) ( not ( = ?auto_402036 ?auto_402038 ) ) ( not ( = ?auto_402036 ?auto_402039 ) ) ( not ( = ?auto_402036 ?auto_402040 ) ) ( not ( = ?auto_402036 ?auto_402041 ) ) ( not ( = ?auto_402036 ?auto_402042 ) ) ( not ( = ?auto_402037 ?auto_402038 ) ) ( not ( = ?auto_402037 ?auto_402039 ) ) ( not ( = ?auto_402037 ?auto_402040 ) ) ( not ( = ?auto_402037 ?auto_402041 ) ) ( not ( = ?auto_402037 ?auto_402042 ) ) ( not ( = ?auto_402038 ?auto_402039 ) ) ( not ( = ?auto_402038 ?auto_402040 ) ) ( not ( = ?auto_402038 ?auto_402041 ) ) ( not ( = ?auto_402038 ?auto_402042 ) ) ( not ( = ?auto_402039 ?auto_402040 ) ) ( not ( = ?auto_402039 ?auto_402041 ) ) ( not ( = ?auto_402039 ?auto_402042 ) ) ( not ( = ?auto_402040 ?auto_402041 ) ) ( not ( = ?auto_402040 ?auto_402042 ) ) ( not ( = ?auto_402041 ?auto_402042 ) ) ( ON ?auto_402040 ?auto_402041 ) ( ON ?auto_402039 ?auto_402040 ) ( ON ?auto_402038 ?auto_402039 ) ( ON ?auto_402037 ?auto_402038 ) ( ON ?auto_402036 ?auto_402037 ) ( ON ?auto_402035 ?auto_402036 ) ( ON ?auto_402034 ?auto_402035 ) ( ON ?auto_402033 ?auto_402034 ) ( ON ?auto_402032 ?auto_402033 ) ( CLEAR ?auto_402030 ) ( ON ?auto_402031 ?auto_402032 ) ( CLEAR ?auto_402031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_402027 ?auto_402028 ?auto_402029 ?auto_402030 ?auto_402031 )
      ( MAKE-15PILE ?auto_402027 ?auto_402028 ?auto_402029 ?auto_402030 ?auto_402031 ?auto_402032 ?auto_402033 ?auto_402034 ?auto_402035 ?auto_402036 ?auto_402037 ?auto_402038 ?auto_402039 ?auto_402040 ?auto_402041 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_402058 - BLOCK
      ?auto_402059 - BLOCK
      ?auto_402060 - BLOCK
      ?auto_402061 - BLOCK
      ?auto_402062 - BLOCK
      ?auto_402063 - BLOCK
      ?auto_402064 - BLOCK
      ?auto_402065 - BLOCK
      ?auto_402066 - BLOCK
      ?auto_402067 - BLOCK
      ?auto_402068 - BLOCK
      ?auto_402069 - BLOCK
      ?auto_402070 - BLOCK
      ?auto_402071 - BLOCK
      ?auto_402072 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_402072 ) ( ON-TABLE ?auto_402058 ) ( ON ?auto_402059 ?auto_402058 ) ( ON ?auto_402060 ?auto_402059 ) ( ON ?auto_402061 ?auto_402060 ) ( not ( = ?auto_402058 ?auto_402059 ) ) ( not ( = ?auto_402058 ?auto_402060 ) ) ( not ( = ?auto_402058 ?auto_402061 ) ) ( not ( = ?auto_402058 ?auto_402062 ) ) ( not ( = ?auto_402058 ?auto_402063 ) ) ( not ( = ?auto_402058 ?auto_402064 ) ) ( not ( = ?auto_402058 ?auto_402065 ) ) ( not ( = ?auto_402058 ?auto_402066 ) ) ( not ( = ?auto_402058 ?auto_402067 ) ) ( not ( = ?auto_402058 ?auto_402068 ) ) ( not ( = ?auto_402058 ?auto_402069 ) ) ( not ( = ?auto_402058 ?auto_402070 ) ) ( not ( = ?auto_402058 ?auto_402071 ) ) ( not ( = ?auto_402058 ?auto_402072 ) ) ( not ( = ?auto_402059 ?auto_402060 ) ) ( not ( = ?auto_402059 ?auto_402061 ) ) ( not ( = ?auto_402059 ?auto_402062 ) ) ( not ( = ?auto_402059 ?auto_402063 ) ) ( not ( = ?auto_402059 ?auto_402064 ) ) ( not ( = ?auto_402059 ?auto_402065 ) ) ( not ( = ?auto_402059 ?auto_402066 ) ) ( not ( = ?auto_402059 ?auto_402067 ) ) ( not ( = ?auto_402059 ?auto_402068 ) ) ( not ( = ?auto_402059 ?auto_402069 ) ) ( not ( = ?auto_402059 ?auto_402070 ) ) ( not ( = ?auto_402059 ?auto_402071 ) ) ( not ( = ?auto_402059 ?auto_402072 ) ) ( not ( = ?auto_402060 ?auto_402061 ) ) ( not ( = ?auto_402060 ?auto_402062 ) ) ( not ( = ?auto_402060 ?auto_402063 ) ) ( not ( = ?auto_402060 ?auto_402064 ) ) ( not ( = ?auto_402060 ?auto_402065 ) ) ( not ( = ?auto_402060 ?auto_402066 ) ) ( not ( = ?auto_402060 ?auto_402067 ) ) ( not ( = ?auto_402060 ?auto_402068 ) ) ( not ( = ?auto_402060 ?auto_402069 ) ) ( not ( = ?auto_402060 ?auto_402070 ) ) ( not ( = ?auto_402060 ?auto_402071 ) ) ( not ( = ?auto_402060 ?auto_402072 ) ) ( not ( = ?auto_402061 ?auto_402062 ) ) ( not ( = ?auto_402061 ?auto_402063 ) ) ( not ( = ?auto_402061 ?auto_402064 ) ) ( not ( = ?auto_402061 ?auto_402065 ) ) ( not ( = ?auto_402061 ?auto_402066 ) ) ( not ( = ?auto_402061 ?auto_402067 ) ) ( not ( = ?auto_402061 ?auto_402068 ) ) ( not ( = ?auto_402061 ?auto_402069 ) ) ( not ( = ?auto_402061 ?auto_402070 ) ) ( not ( = ?auto_402061 ?auto_402071 ) ) ( not ( = ?auto_402061 ?auto_402072 ) ) ( not ( = ?auto_402062 ?auto_402063 ) ) ( not ( = ?auto_402062 ?auto_402064 ) ) ( not ( = ?auto_402062 ?auto_402065 ) ) ( not ( = ?auto_402062 ?auto_402066 ) ) ( not ( = ?auto_402062 ?auto_402067 ) ) ( not ( = ?auto_402062 ?auto_402068 ) ) ( not ( = ?auto_402062 ?auto_402069 ) ) ( not ( = ?auto_402062 ?auto_402070 ) ) ( not ( = ?auto_402062 ?auto_402071 ) ) ( not ( = ?auto_402062 ?auto_402072 ) ) ( not ( = ?auto_402063 ?auto_402064 ) ) ( not ( = ?auto_402063 ?auto_402065 ) ) ( not ( = ?auto_402063 ?auto_402066 ) ) ( not ( = ?auto_402063 ?auto_402067 ) ) ( not ( = ?auto_402063 ?auto_402068 ) ) ( not ( = ?auto_402063 ?auto_402069 ) ) ( not ( = ?auto_402063 ?auto_402070 ) ) ( not ( = ?auto_402063 ?auto_402071 ) ) ( not ( = ?auto_402063 ?auto_402072 ) ) ( not ( = ?auto_402064 ?auto_402065 ) ) ( not ( = ?auto_402064 ?auto_402066 ) ) ( not ( = ?auto_402064 ?auto_402067 ) ) ( not ( = ?auto_402064 ?auto_402068 ) ) ( not ( = ?auto_402064 ?auto_402069 ) ) ( not ( = ?auto_402064 ?auto_402070 ) ) ( not ( = ?auto_402064 ?auto_402071 ) ) ( not ( = ?auto_402064 ?auto_402072 ) ) ( not ( = ?auto_402065 ?auto_402066 ) ) ( not ( = ?auto_402065 ?auto_402067 ) ) ( not ( = ?auto_402065 ?auto_402068 ) ) ( not ( = ?auto_402065 ?auto_402069 ) ) ( not ( = ?auto_402065 ?auto_402070 ) ) ( not ( = ?auto_402065 ?auto_402071 ) ) ( not ( = ?auto_402065 ?auto_402072 ) ) ( not ( = ?auto_402066 ?auto_402067 ) ) ( not ( = ?auto_402066 ?auto_402068 ) ) ( not ( = ?auto_402066 ?auto_402069 ) ) ( not ( = ?auto_402066 ?auto_402070 ) ) ( not ( = ?auto_402066 ?auto_402071 ) ) ( not ( = ?auto_402066 ?auto_402072 ) ) ( not ( = ?auto_402067 ?auto_402068 ) ) ( not ( = ?auto_402067 ?auto_402069 ) ) ( not ( = ?auto_402067 ?auto_402070 ) ) ( not ( = ?auto_402067 ?auto_402071 ) ) ( not ( = ?auto_402067 ?auto_402072 ) ) ( not ( = ?auto_402068 ?auto_402069 ) ) ( not ( = ?auto_402068 ?auto_402070 ) ) ( not ( = ?auto_402068 ?auto_402071 ) ) ( not ( = ?auto_402068 ?auto_402072 ) ) ( not ( = ?auto_402069 ?auto_402070 ) ) ( not ( = ?auto_402069 ?auto_402071 ) ) ( not ( = ?auto_402069 ?auto_402072 ) ) ( not ( = ?auto_402070 ?auto_402071 ) ) ( not ( = ?auto_402070 ?auto_402072 ) ) ( not ( = ?auto_402071 ?auto_402072 ) ) ( ON ?auto_402071 ?auto_402072 ) ( ON ?auto_402070 ?auto_402071 ) ( ON ?auto_402069 ?auto_402070 ) ( ON ?auto_402068 ?auto_402069 ) ( ON ?auto_402067 ?auto_402068 ) ( ON ?auto_402066 ?auto_402067 ) ( ON ?auto_402065 ?auto_402066 ) ( ON ?auto_402064 ?auto_402065 ) ( ON ?auto_402063 ?auto_402064 ) ( CLEAR ?auto_402061 ) ( ON ?auto_402062 ?auto_402063 ) ( CLEAR ?auto_402062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_402058 ?auto_402059 ?auto_402060 ?auto_402061 ?auto_402062 )
      ( MAKE-15PILE ?auto_402058 ?auto_402059 ?auto_402060 ?auto_402061 ?auto_402062 ?auto_402063 ?auto_402064 ?auto_402065 ?auto_402066 ?auto_402067 ?auto_402068 ?auto_402069 ?auto_402070 ?auto_402071 ?auto_402072 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_402088 - BLOCK
      ?auto_402089 - BLOCK
      ?auto_402090 - BLOCK
      ?auto_402091 - BLOCK
      ?auto_402092 - BLOCK
      ?auto_402093 - BLOCK
      ?auto_402094 - BLOCK
      ?auto_402095 - BLOCK
      ?auto_402096 - BLOCK
      ?auto_402097 - BLOCK
      ?auto_402098 - BLOCK
      ?auto_402099 - BLOCK
      ?auto_402100 - BLOCK
      ?auto_402101 - BLOCK
      ?auto_402102 - BLOCK
    )
    :vars
    (
      ?auto_402103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402102 ?auto_402103 ) ( ON-TABLE ?auto_402088 ) ( ON ?auto_402089 ?auto_402088 ) ( ON ?auto_402090 ?auto_402089 ) ( not ( = ?auto_402088 ?auto_402089 ) ) ( not ( = ?auto_402088 ?auto_402090 ) ) ( not ( = ?auto_402088 ?auto_402091 ) ) ( not ( = ?auto_402088 ?auto_402092 ) ) ( not ( = ?auto_402088 ?auto_402093 ) ) ( not ( = ?auto_402088 ?auto_402094 ) ) ( not ( = ?auto_402088 ?auto_402095 ) ) ( not ( = ?auto_402088 ?auto_402096 ) ) ( not ( = ?auto_402088 ?auto_402097 ) ) ( not ( = ?auto_402088 ?auto_402098 ) ) ( not ( = ?auto_402088 ?auto_402099 ) ) ( not ( = ?auto_402088 ?auto_402100 ) ) ( not ( = ?auto_402088 ?auto_402101 ) ) ( not ( = ?auto_402088 ?auto_402102 ) ) ( not ( = ?auto_402088 ?auto_402103 ) ) ( not ( = ?auto_402089 ?auto_402090 ) ) ( not ( = ?auto_402089 ?auto_402091 ) ) ( not ( = ?auto_402089 ?auto_402092 ) ) ( not ( = ?auto_402089 ?auto_402093 ) ) ( not ( = ?auto_402089 ?auto_402094 ) ) ( not ( = ?auto_402089 ?auto_402095 ) ) ( not ( = ?auto_402089 ?auto_402096 ) ) ( not ( = ?auto_402089 ?auto_402097 ) ) ( not ( = ?auto_402089 ?auto_402098 ) ) ( not ( = ?auto_402089 ?auto_402099 ) ) ( not ( = ?auto_402089 ?auto_402100 ) ) ( not ( = ?auto_402089 ?auto_402101 ) ) ( not ( = ?auto_402089 ?auto_402102 ) ) ( not ( = ?auto_402089 ?auto_402103 ) ) ( not ( = ?auto_402090 ?auto_402091 ) ) ( not ( = ?auto_402090 ?auto_402092 ) ) ( not ( = ?auto_402090 ?auto_402093 ) ) ( not ( = ?auto_402090 ?auto_402094 ) ) ( not ( = ?auto_402090 ?auto_402095 ) ) ( not ( = ?auto_402090 ?auto_402096 ) ) ( not ( = ?auto_402090 ?auto_402097 ) ) ( not ( = ?auto_402090 ?auto_402098 ) ) ( not ( = ?auto_402090 ?auto_402099 ) ) ( not ( = ?auto_402090 ?auto_402100 ) ) ( not ( = ?auto_402090 ?auto_402101 ) ) ( not ( = ?auto_402090 ?auto_402102 ) ) ( not ( = ?auto_402090 ?auto_402103 ) ) ( not ( = ?auto_402091 ?auto_402092 ) ) ( not ( = ?auto_402091 ?auto_402093 ) ) ( not ( = ?auto_402091 ?auto_402094 ) ) ( not ( = ?auto_402091 ?auto_402095 ) ) ( not ( = ?auto_402091 ?auto_402096 ) ) ( not ( = ?auto_402091 ?auto_402097 ) ) ( not ( = ?auto_402091 ?auto_402098 ) ) ( not ( = ?auto_402091 ?auto_402099 ) ) ( not ( = ?auto_402091 ?auto_402100 ) ) ( not ( = ?auto_402091 ?auto_402101 ) ) ( not ( = ?auto_402091 ?auto_402102 ) ) ( not ( = ?auto_402091 ?auto_402103 ) ) ( not ( = ?auto_402092 ?auto_402093 ) ) ( not ( = ?auto_402092 ?auto_402094 ) ) ( not ( = ?auto_402092 ?auto_402095 ) ) ( not ( = ?auto_402092 ?auto_402096 ) ) ( not ( = ?auto_402092 ?auto_402097 ) ) ( not ( = ?auto_402092 ?auto_402098 ) ) ( not ( = ?auto_402092 ?auto_402099 ) ) ( not ( = ?auto_402092 ?auto_402100 ) ) ( not ( = ?auto_402092 ?auto_402101 ) ) ( not ( = ?auto_402092 ?auto_402102 ) ) ( not ( = ?auto_402092 ?auto_402103 ) ) ( not ( = ?auto_402093 ?auto_402094 ) ) ( not ( = ?auto_402093 ?auto_402095 ) ) ( not ( = ?auto_402093 ?auto_402096 ) ) ( not ( = ?auto_402093 ?auto_402097 ) ) ( not ( = ?auto_402093 ?auto_402098 ) ) ( not ( = ?auto_402093 ?auto_402099 ) ) ( not ( = ?auto_402093 ?auto_402100 ) ) ( not ( = ?auto_402093 ?auto_402101 ) ) ( not ( = ?auto_402093 ?auto_402102 ) ) ( not ( = ?auto_402093 ?auto_402103 ) ) ( not ( = ?auto_402094 ?auto_402095 ) ) ( not ( = ?auto_402094 ?auto_402096 ) ) ( not ( = ?auto_402094 ?auto_402097 ) ) ( not ( = ?auto_402094 ?auto_402098 ) ) ( not ( = ?auto_402094 ?auto_402099 ) ) ( not ( = ?auto_402094 ?auto_402100 ) ) ( not ( = ?auto_402094 ?auto_402101 ) ) ( not ( = ?auto_402094 ?auto_402102 ) ) ( not ( = ?auto_402094 ?auto_402103 ) ) ( not ( = ?auto_402095 ?auto_402096 ) ) ( not ( = ?auto_402095 ?auto_402097 ) ) ( not ( = ?auto_402095 ?auto_402098 ) ) ( not ( = ?auto_402095 ?auto_402099 ) ) ( not ( = ?auto_402095 ?auto_402100 ) ) ( not ( = ?auto_402095 ?auto_402101 ) ) ( not ( = ?auto_402095 ?auto_402102 ) ) ( not ( = ?auto_402095 ?auto_402103 ) ) ( not ( = ?auto_402096 ?auto_402097 ) ) ( not ( = ?auto_402096 ?auto_402098 ) ) ( not ( = ?auto_402096 ?auto_402099 ) ) ( not ( = ?auto_402096 ?auto_402100 ) ) ( not ( = ?auto_402096 ?auto_402101 ) ) ( not ( = ?auto_402096 ?auto_402102 ) ) ( not ( = ?auto_402096 ?auto_402103 ) ) ( not ( = ?auto_402097 ?auto_402098 ) ) ( not ( = ?auto_402097 ?auto_402099 ) ) ( not ( = ?auto_402097 ?auto_402100 ) ) ( not ( = ?auto_402097 ?auto_402101 ) ) ( not ( = ?auto_402097 ?auto_402102 ) ) ( not ( = ?auto_402097 ?auto_402103 ) ) ( not ( = ?auto_402098 ?auto_402099 ) ) ( not ( = ?auto_402098 ?auto_402100 ) ) ( not ( = ?auto_402098 ?auto_402101 ) ) ( not ( = ?auto_402098 ?auto_402102 ) ) ( not ( = ?auto_402098 ?auto_402103 ) ) ( not ( = ?auto_402099 ?auto_402100 ) ) ( not ( = ?auto_402099 ?auto_402101 ) ) ( not ( = ?auto_402099 ?auto_402102 ) ) ( not ( = ?auto_402099 ?auto_402103 ) ) ( not ( = ?auto_402100 ?auto_402101 ) ) ( not ( = ?auto_402100 ?auto_402102 ) ) ( not ( = ?auto_402100 ?auto_402103 ) ) ( not ( = ?auto_402101 ?auto_402102 ) ) ( not ( = ?auto_402101 ?auto_402103 ) ) ( not ( = ?auto_402102 ?auto_402103 ) ) ( ON ?auto_402101 ?auto_402102 ) ( ON ?auto_402100 ?auto_402101 ) ( ON ?auto_402099 ?auto_402100 ) ( ON ?auto_402098 ?auto_402099 ) ( ON ?auto_402097 ?auto_402098 ) ( ON ?auto_402096 ?auto_402097 ) ( ON ?auto_402095 ?auto_402096 ) ( ON ?auto_402094 ?auto_402095 ) ( ON ?auto_402093 ?auto_402094 ) ( ON ?auto_402092 ?auto_402093 ) ( CLEAR ?auto_402090 ) ( ON ?auto_402091 ?auto_402092 ) ( CLEAR ?auto_402091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_402088 ?auto_402089 ?auto_402090 ?auto_402091 )
      ( MAKE-15PILE ?auto_402088 ?auto_402089 ?auto_402090 ?auto_402091 ?auto_402092 ?auto_402093 ?auto_402094 ?auto_402095 ?auto_402096 ?auto_402097 ?auto_402098 ?auto_402099 ?auto_402100 ?auto_402101 ?auto_402102 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_402119 - BLOCK
      ?auto_402120 - BLOCK
      ?auto_402121 - BLOCK
      ?auto_402122 - BLOCK
      ?auto_402123 - BLOCK
      ?auto_402124 - BLOCK
      ?auto_402125 - BLOCK
      ?auto_402126 - BLOCK
      ?auto_402127 - BLOCK
      ?auto_402128 - BLOCK
      ?auto_402129 - BLOCK
      ?auto_402130 - BLOCK
      ?auto_402131 - BLOCK
      ?auto_402132 - BLOCK
      ?auto_402133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_402133 ) ( ON-TABLE ?auto_402119 ) ( ON ?auto_402120 ?auto_402119 ) ( ON ?auto_402121 ?auto_402120 ) ( not ( = ?auto_402119 ?auto_402120 ) ) ( not ( = ?auto_402119 ?auto_402121 ) ) ( not ( = ?auto_402119 ?auto_402122 ) ) ( not ( = ?auto_402119 ?auto_402123 ) ) ( not ( = ?auto_402119 ?auto_402124 ) ) ( not ( = ?auto_402119 ?auto_402125 ) ) ( not ( = ?auto_402119 ?auto_402126 ) ) ( not ( = ?auto_402119 ?auto_402127 ) ) ( not ( = ?auto_402119 ?auto_402128 ) ) ( not ( = ?auto_402119 ?auto_402129 ) ) ( not ( = ?auto_402119 ?auto_402130 ) ) ( not ( = ?auto_402119 ?auto_402131 ) ) ( not ( = ?auto_402119 ?auto_402132 ) ) ( not ( = ?auto_402119 ?auto_402133 ) ) ( not ( = ?auto_402120 ?auto_402121 ) ) ( not ( = ?auto_402120 ?auto_402122 ) ) ( not ( = ?auto_402120 ?auto_402123 ) ) ( not ( = ?auto_402120 ?auto_402124 ) ) ( not ( = ?auto_402120 ?auto_402125 ) ) ( not ( = ?auto_402120 ?auto_402126 ) ) ( not ( = ?auto_402120 ?auto_402127 ) ) ( not ( = ?auto_402120 ?auto_402128 ) ) ( not ( = ?auto_402120 ?auto_402129 ) ) ( not ( = ?auto_402120 ?auto_402130 ) ) ( not ( = ?auto_402120 ?auto_402131 ) ) ( not ( = ?auto_402120 ?auto_402132 ) ) ( not ( = ?auto_402120 ?auto_402133 ) ) ( not ( = ?auto_402121 ?auto_402122 ) ) ( not ( = ?auto_402121 ?auto_402123 ) ) ( not ( = ?auto_402121 ?auto_402124 ) ) ( not ( = ?auto_402121 ?auto_402125 ) ) ( not ( = ?auto_402121 ?auto_402126 ) ) ( not ( = ?auto_402121 ?auto_402127 ) ) ( not ( = ?auto_402121 ?auto_402128 ) ) ( not ( = ?auto_402121 ?auto_402129 ) ) ( not ( = ?auto_402121 ?auto_402130 ) ) ( not ( = ?auto_402121 ?auto_402131 ) ) ( not ( = ?auto_402121 ?auto_402132 ) ) ( not ( = ?auto_402121 ?auto_402133 ) ) ( not ( = ?auto_402122 ?auto_402123 ) ) ( not ( = ?auto_402122 ?auto_402124 ) ) ( not ( = ?auto_402122 ?auto_402125 ) ) ( not ( = ?auto_402122 ?auto_402126 ) ) ( not ( = ?auto_402122 ?auto_402127 ) ) ( not ( = ?auto_402122 ?auto_402128 ) ) ( not ( = ?auto_402122 ?auto_402129 ) ) ( not ( = ?auto_402122 ?auto_402130 ) ) ( not ( = ?auto_402122 ?auto_402131 ) ) ( not ( = ?auto_402122 ?auto_402132 ) ) ( not ( = ?auto_402122 ?auto_402133 ) ) ( not ( = ?auto_402123 ?auto_402124 ) ) ( not ( = ?auto_402123 ?auto_402125 ) ) ( not ( = ?auto_402123 ?auto_402126 ) ) ( not ( = ?auto_402123 ?auto_402127 ) ) ( not ( = ?auto_402123 ?auto_402128 ) ) ( not ( = ?auto_402123 ?auto_402129 ) ) ( not ( = ?auto_402123 ?auto_402130 ) ) ( not ( = ?auto_402123 ?auto_402131 ) ) ( not ( = ?auto_402123 ?auto_402132 ) ) ( not ( = ?auto_402123 ?auto_402133 ) ) ( not ( = ?auto_402124 ?auto_402125 ) ) ( not ( = ?auto_402124 ?auto_402126 ) ) ( not ( = ?auto_402124 ?auto_402127 ) ) ( not ( = ?auto_402124 ?auto_402128 ) ) ( not ( = ?auto_402124 ?auto_402129 ) ) ( not ( = ?auto_402124 ?auto_402130 ) ) ( not ( = ?auto_402124 ?auto_402131 ) ) ( not ( = ?auto_402124 ?auto_402132 ) ) ( not ( = ?auto_402124 ?auto_402133 ) ) ( not ( = ?auto_402125 ?auto_402126 ) ) ( not ( = ?auto_402125 ?auto_402127 ) ) ( not ( = ?auto_402125 ?auto_402128 ) ) ( not ( = ?auto_402125 ?auto_402129 ) ) ( not ( = ?auto_402125 ?auto_402130 ) ) ( not ( = ?auto_402125 ?auto_402131 ) ) ( not ( = ?auto_402125 ?auto_402132 ) ) ( not ( = ?auto_402125 ?auto_402133 ) ) ( not ( = ?auto_402126 ?auto_402127 ) ) ( not ( = ?auto_402126 ?auto_402128 ) ) ( not ( = ?auto_402126 ?auto_402129 ) ) ( not ( = ?auto_402126 ?auto_402130 ) ) ( not ( = ?auto_402126 ?auto_402131 ) ) ( not ( = ?auto_402126 ?auto_402132 ) ) ( not ( = ?auto_402126 ?auto_402133 ) ) ( not ( = ?auto_402127 ?auto_402128 ) ) ( not ( = ?auto_402127 ?auto_402129 ) ) ( not ( = ?auto_402127 ?auto_402130 ) ) ( not ( = ?auto_402127 ?auto_402131 ) ) ( not ( = ?auto_402127 ?auto_402132 ) ) ( not ( = ?auto_402127 ?auto_402133 ) ) ( not ( = ?auto_402128 ?auto_402129 ) ) ( not ( = ?auto_402128 ?auto_402130 ) ) ( not ( = ?auto_402128 ?auto_402131 ) ) ( not ( = ?auto_402128 ?auto_402132 ) ) ( not ( = ?auto_402128 ?auto_402133 ) ) ( not ( = ?auto_402129 ?auto_402130 ) ) ( not ( = ?auto_402129 ?auto_402131 ) ) ( not ( = ?auto_402129 ?auto_402132 ) ) ( not ( = ?auto_402129 ?auto_402133 ) ) ( not ( = ?auto_402130 ?auto_402131 ) ) ( not ( = ?auto_402130 ?auto_402132 ) ) ( not ( = ?auto_402130 ?auto_402133 ) ) ( not ( = ?auto_402131 ?auto_402132 ) ) ( not ( = ?auto_402131 ?auto_402133 ) ) ( not ( = ?auto_402132 ?auto_402133 ) ) ( ON ?auto_402132 ?auto_402133 ) ( ON ?auto_402131 ?auto_402132 ) ( ON ?auto_402130 ?auto_402131 ) ( ON ?auto_402129 ?auto_402130 ) ( ON ?auto_402128 ?auto_402129 ) ( ON ?auto_402127 ?auto_402128 ) ( ON ?auto_402126 ?auto_402127 ) ( ON ?auto_402125 ?auto_402126 ) ( ON ?auto_402124 ?auto_402125 ) ( ON ?auto_402123 ?auto_402124 ) ( CLEAR ?auto_402121 ) ( ON ?auto_402122 ?auto_402123 ) ( CLEAR ?auto_402122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_402119 ?auto_402120 ?auto_402121 ?auto_402122 )
      ( MAKE-15PILE ?auto_402119 ?auto_402120 ?auto_402121 ?auto_402122 ?auto_402123 ?auto_402124 ?auto_402125 ?auto_402126 ?auto_402127 ?auto_402128 ?auto_402129 ?auto_402130 ?auto_402131 ?auto_402132 ?auto_402133 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_402149 - BLOCK
      ?auto_402150 - BLOCK
      ?auto_402151 - BLOCK
      ?auto_402152 - BLOCK
      ?auto_402153 - BLOCK
      ?auto_402154 - BLOCK
      ?auto_402155 - BLOCK
      ?auto_402156 - BLOCK
      ?auto_402157 - BLOCK
      ?auto_402158 - BLOCK
      ?auto_402159 - BLOCK
      ?auto_402160 - BLOCK
      ?auto_402161 - BLOCK
      ?auto_402162 - BLOCK
      ?auto_402163 - BLOCK
    )
    :vars
    (
      ?auto_402164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402163 ?auto_402164 ) ( ON-TABLE ?auto_402149 ) ( ON ?auto_402150 ?auto_402149 ) ( not ( = ?auto_402149 ?auto_402150 ) ) ( not ( = ?auto_402149 ?auto_402151 ) ) ( not ( = ?auto_402149 ?auto_402152 ) ) ( not ( = ?auto_402149 ?auto_402153 ) ) ( not ( = ?auto_402149 ?auto_402154 ) ) ( not ( = ?auto_402149 ?auto_402155 ) ) ( not ( = ?auto_402149 ?auto_402156 ) ) ( not ( = ?auto_402149 ?auto_402157 ) ) ( not ( = ?auto_402149 ?auto_402158 ) ) ( not ( = ?auto_402149 ?auto_402159 ) ) ( not ( = ?auto_402149 ?auto_402160 ) ) ( not ( = ?auto_402149 ?auto_402161 ) ) ( not ( = ?auto_402149 ?auto_402162 ) ) ( not ( = ?auto_402149 ?auto_402163 ) ) ( not ( = ?auto_402149 ?auto_402164 ) ) ( not ( = ?auto_402150 ?auto_402151 ) ) ( not ( = ?auto_402150 ?auto_402152 ) ) ( not ( = ?auto_402150 ?auto_402153 ) ) ( not ( = ?auto_402150 ?auto_402154 ) ) ( not ( = ?auto_402150 ?auto_402155 ) ) ( not ( = ?auto_402150 ?auto_402156 ) ) ( not ( = ?auto_402150 ?auto_402157 ) ) ( not ( = ?auto_402150 ?auto_402158 ) ) ( not ( = ?auto_402150 ?auto_402159 ) ) ( not ( = ?auto_402150 ?auto_402160 ) ) ( not ( = ?auto_402150 ?auto_402161 ) ) ( not ( = ?auto_402150 ?auto_402162 ) ) ( not ( = ?auto_402150 ?auto_402163 ) ) ( not ( = ?auto_402150 ?auto_402164 ) ) ( not ( = ?auto_402151 ?auto_402152 ) ) ( not ( = ?auto_402151 ?auto_402153 ) ) ( not ( = ?auto_402151 ?auto_402154 ) ) ( not ( = ?auto_402151 ?auto_402155 ) ) ( not ( = ?auto_402151 ?auto_402156 ) ) ( not ( = ?auto_402151 ?auto_402157 ) ) ( not ( = ?auto_402151 ?auto_402158 ) ) ( not ( = ?auto_402151 ?auto_402159 ) ) ( not ( = ?auto_402151 ?auto_402160 ) ) ( not ( = ?auto_402151 ?auto_402161 ) ) ( not ( = ?auto_402151 ?auto_402162 ) ) ( not ( = ?auto_402151 ?auto_402163 ) ) ( not ( = ?auto_402151 ?auto_402164 ) ) ( not ( = ?auto_402152 ?auto_402153 ) ) ( not ( = ?auto_402152 ?auto_402154 ) ) ( not ( = ?auto_402152 ?auto_402155 ) ) ( not ( = ?auto_402152 ?auto_402156 ) ) ( not ( = ?auto_402152 ?auto_402157 ) ) ( not ( = ?auto_402152 ?auto_402158 ) ) ( not ( = ?auto_402152 ?auto_402159 ) ) ( not ( = ?auto_402152 ?auto_402160 ) ) ( not ( = ?auto_402152 ?auto_402161 ) ) ( not ( = ?auto_402152 ?auto_402162 ) ) ( not ( = ?auto_402152 ?auto_402163 ) ) ( not ( = ?auto_402152 ?auto_402164 ) ) ( not ( = ?auto_402153 ?auto_402154 ) ) ( not ( = ?auto_402153 ?auto_402155 ) ) ( not ( = ?auto_402153 ?auto_402156 ) ) ( not ( = ?auto_402153 ?auto_402157 ) ) ( not ( = ?auto_402153 ?auto_402158 ) ) ( not ( = ?auto_402153 ?auto_402159 ) ) ( not ( = ?auto_402153 ?auto_402160 ) ) ( not ( = ?auto_402153 ?auto_402161 ) ) ( not ( = ?auto_402153 ?auto_402162 ) ) ( not ( = ?auto_402153 ?auto_402163 ) ) ( not ( = ?auto_402153 ?auto_402164 ) ) ( not ( = ?auto_402154 ?auto_402155 ) ) ( not ( = ?auto_402154 ?auto_402156 ) ) ( not ( = ?auto_402154 ?auto_402157 ) ) ( not ( = ?auto_402154 ?auto_402158 ) ) ( not ( = ?auto_402154 ?auto_402159 ) ) ( not ( = ?auto_402154 ?auto_402160 ) ) ( not ( = ?auto_402154 ?auto_402161 ) ) ( not ( = ?auto_402154 ?auto_402162 ) ) ( not ( = ?auto_402154 ?auto_402163 ) ) ( not ( = ?auto_402154 ?auto_402164 ) ) ( not ( = ?auto_402155 ?auto_402156 ) ) ( not ( = ?auto_402155 ?auto_402157 ) ) ( not ( = ?auto_402155 ?auto_402158 ) ) ( not ( = ?auto_402155 ?auto_402159 ) ) ( not ( = ?auto_402155 ?auto_402160 ) ) ( not ( = ?auto_402155 ?auto_402161 ) ) ( not ( = ?auto_402155 ?auto_402162 ) ) ( not ( = ?auto_402155 ?auto_402163 ) ) ( not ( = ?auto_402155 ?auto_402164 ) ) ( not ( = ?auto_402156 ?auto_402157 ) ) ( not ( = ?auto_402156 ?auto_402158 ) ) ( not ( = ?auto_402156 ?auto_402159 ) ) ( not ( = ?auto_402156 ?auto_402160 ) ) ( not ( = ?auto_402156 ?auto_402161 ) ) ( not ( = ?auto_402156 ?auto_402162 ) ) ( not ( = ?auto_402156 ?auto_402163 ) ) ( not ( = ?auto_402156 ?auto_402164 ) ) ( not ( = ?auto_402157 ?auto_402158 ) ) ( not ( = ?auto_402157 ?auto_402159 ) ) ( not ( = ?auto_402157 ?auto_402160 ) ) ( not ( = ?auto_402157 ?auto_402161 ) ) ( not ( = ?auto_402157 ?auto_402162 ) ) ( not ( = ?auto_402157 ?auto_402163 ) ) ( not ( = ?auto_402157 ?auto_402164 ) ) ( not ( = ?auto_402158 ?auto_402159 ) ) ( not ( = ?auto_402158 ?auto_402160 ) ) ( not ( = ?auto_402158 ?auto_402161 ) ) ( not ( = ?auto_402158 ?auto_402162 ) ) ( not ( = ?auto_402158 ?auto_402163 ) ) ( not ( = ?auto_402158 ?auto_402164 ) ) ( not ( = ?auto_402159 ?auto_402160 ) ) ( not ( = ?auto_402159 ?auto_402161 ) ) ( not ( = ?auto_402159 ?auto_402162 ) ) ( not ( = ?auto_402159 ?auto_402163 ) ) ( not ( = ?auto_402159 ?auto_402164 ) ) ( not ( = ?auto_402160 ?auto_402161 ) ) ( not ( = ?auto_402160 ?auto_402162 ) ) ( not ( = ?auto_402160 ?auto_402163 ) ) ( not ( = ?auto_402160 ?auto_402164 ) ) ( not ( = ?auto_402161 ?auto_402162 ) ) ( not ( = ?auto_402161 ?auto_402163 ) ) ( not ( = ?auto_402161 ?auto_402164 ) ) ( not ( = ?auto_402162 ?auto_402163 ) ) ( not ( = ?auto_402162 ?auto_402164 ) ) ( not ( = ?auto_402163 ?auto_402164 ) ) ( ON ?auto_402162 ?auto_402163 ) ( ON ?auto_402161 ?auto_402162 ) ( ON ?auto_402160 ?auto_402161 ) ( ON ?auto_402159 ?auto_402160 ) ( ON ?auto_402158 ?auto_402159 ) ( ON ?auto_402157 ?auto_402158 ) ( ON ?auto_402156 ?auto_402157 ) ( ON ?auto_402155 ?auto_402156 ) ( ON ?auto_402154 ?auto_402155 ) ( ON ?auto_402153 ?auto_402154 ) ( ON ?auto_402152 ?auto_402153 ) ( CLEAR ?auto_402150 ) ( ON ?auto_402151 ?auto_402152 ) ( CLEAR ?auto_402151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_402149 ?auto_402150 ?auto_402151 )
      ( MAKE-15PILE ?auto_402149 ?auto_402150 ?auto_402151 ?auto_402152 ?auto_402153 ?auto_402154 ?auto_402155 ?auto_402156 ?auto_402157 ?auto_402158 ?auto_402159 ?auto_402160 ?auto_402161 ?auto_402162 ?auto_402163 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_402180 - BLOCK
      ?auto_402181 - BLOCK
      ?auto_402182 - BLOCK
      ?auto_402183 - BLOCK
      ?auto_402184 - BLOCK
      ?auto_402185 - BLOCK
      ?auto_402186 - BLOCK
      ?auto_402187 - BLOCK
      ?auto_402188 - BLOCK
      ?auto_402189 - BLOCK
      ?auto_402190 - BLOCK
      ?auto_402191 - BLOCK
      ?auto_402192 - BLOCK
      ?auto_402193 - BLOCK
      ?auto_402194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_402194 ) ( ON-TABLE ?auto_402180 ) ( ON ?auto_402181 ?auto_402180 ) ( not ( = ?auto_402180 ?auto_402181 ) ) ( not ( = ?auto_402180 ?auto_402182 ) ) ( not ( = ?auto_402180 ?auto_402183 ) ) ( not ( = ?auto_402180 ?auto_402184 ) ) ( not ( = ?auto_402180 ?auto_402185 ) ) ( not ( = ?auto_402180 ?auto_402186 ) ) ( not ( = ?auto_402180 ?auto_402187 ) ) ( not ( = ?auto_402180 ?auto_402188 ) ) ( not ( = ?auto_402180 ?auto_402189 ) ) ( not ( = ?auto_402180 ?auto_402190 ) ) ( not ( = ?auto_402180 ?auto_402191 ) ) ( not ( = ?auto_402180 ?auto_402192 ) ) ( not ( = ?auto_402180 ?auto_402193 ) ) ( not ( = ?auto_402180 ?auto_402194 ) ) ( not ( = ?auto_402181 ?auto_402182 ) ) ( not ( = ?auto_402181 ?auto_402183 ) ) ( not ( = ?auto_402181 ?auto_402184 ) ) ( not ( = ?auto_402181 ?auto_402185 ) ) ( not ( = ?auto_402181 ?auto_402186 ) ) ( not ( = ?auto_402181 ?auto_402187 ) ) ( not ( = ?auto_402181 ?auto_402188 ) ) ( not ( = ?auto_402181 ?auto_402189 ) ) ( not ( = ?auto_402181 ?auto_402190 ) ) ( not ( = ?auto_402181 ?auto_402191 ) ) ( not ( = ?auto_402181 ?auto_402192 ) ) ( not ( = ?auto_402181 ?auto_402193 ) ) ( not ( = ?auto_402181 ?auto_402194 ) ) ( not ( = ?auto_402182 ?auto_402183 ) ) ( not ( = ?auto_402182 ?auto_402184 ) ) ( not ( = ?auto_402182 ?auto_402185 ) ) ( not ( = ?auto_402182 ?auto_402186 ) ) ( not ( = ?auto_402182 ?auto_402187 ) ) ( not ( = ?auto_402182 ?auto_402188 ) ) ( not ( = ?auto_402182 ?auto_402189 ) ) ( not ( = ?auto_402182 ?auto_402190 ) ) ( not ( = ?auto_402182 ?auto_402191 ) ) ( not ( = ?auto_402182 ?auto_402192 ) ) ( not ( = ?auto_402182 ?auto_402193 ) ) ( not ( = ?auto_402182 ?auto_402194 ) ) ( not ( = ?auto_402183 ?auto_402184 ) ) ( not ( = ?auto_402183 ?auto_402185 ) ) ( not ( = ?auto_402183 ?auto_402186 ) ) ( not ( = ?auto_402183 ?auto_402187 ) ) ( not ( = ?auto_402183 ?auto_402188 ) ) ( not ( = ?auto_402183 ?auto_402189 ) ) ( not ( = ?auto_402183 ?auto_402190 ) ) ( not ( = ?auto_402183 ?auto_402191 ) ) ( not ( = ?auto_402183 ?auto_402192 ) ) ( not ( = ?auto_402183 ?auto_402193 ) ) ( not ( = ?auto_402183 ?auto_402194 ) ) ( not ( = ?auto_402184 ?auto_402185 ) ) ( not ( = ?auto_402184 ?auto_402186 ) ) ( not ( = ?auto_402184 ?auto_402187 ) ) ( not ( = ?auto_402184 ?auto_402188 ) ) ( not ( = ?auto_402184 ?auto_402189 ) ) ( not ( = ?auto_402184 ?auto_402190 ) ) ( not ( = ?auto_402184 ?auto_402191 ) ) ( not ( = ?auto_402184 ?auto_402192 ) ) ( not ( = ?auto_402184 ?auto_402193 ) ) ( not ( = ?auto_402184 ?auto_402194 ) ) ( not ( = ?auto_402185 ?auto_402186 ) ) ( not ( = ?auto_402185 ?auto_402187 ) ) ( not ( = ?auto_402185 ?auto_402188 ) ) ( not ( = ?auto_402185 ?auto_402189 ) ) ( not ( = ?auto_402185 ?auto_402190 ) ) ( not ( = ?auto_402185 ?auto_402191 ) ) ( not ( = ?auto_402185 ?auto_402192 ) ) ( not ( = ?auto_402185 ?auto_402193 ) ) ( not ( = ?auto_402185 ?auto_402194 ) ) ( not ( = ?auto_402186 ?auto_402187 ) ) ( not ( = ?auto_402186 ?auto_402188 ) ) ( not ( = ?auto_402186 ?auto_402189 ) ) ( not ( = ?auto_402186 ?auto_402190 ) ) ( not ( = ?auto_402186 ?auto_402191 ) ) ( not ( = ?auto_402186 ?auto_402192 ) ) ( not ( = ?auto_402186 ?auto_402193 ) ) ( not ( = ?auto_402186 ?auto_402194 ) ) ( not ( = ?auto_402187 ?auto_402188 ) ) ( not ( = ?auto_402187 ?auto_402189 ) ) ( not ( = ?auto_402187 ?auto_402190 ) ) ( not ( = ?auto_402187 ?auto_402191 ) ) ( not ( = ?auto_402187 ?auto_402192 ) ) ( not ( = ?auto_402187 ?auto_402193 ) ) ( not ( = ?auto_402187 ?auto_402194 ) ) ( not ( = ?auto_402188 ?auto_402189 ) ) ( not ( = ?auto_402188 ?auto_402190 ) ) ( not ( = ?auto_402188 ?auto_402191 ) ) ( not ( = ?auto_402188 ?auto_402192 ) ) ( not ( = ?auto_402188 ?auto_402193 ) ) ( not ( = ?auto_402188 ?auto_402194 ) ) ( not ( = ?auto_402189 ?auto_402190 ) ) ( not ( = ?auto_402189 ?auto_402191 ) ) ( not ( = ?auto_402189 ?auto_402192 ) ) ( not ( = ?auto_402189 ?auto_402193 ) ) ( not ( = ?auto_402189 ?auto_402194 ) ) ( not ( = ?auto_402190 ?auto_402191 ) ) ( not ( = ?auto_402190 ?auto_402192 ) ) ( not ( = ?auto_402190 ?auto_402193 ) ) ( not ( = ?auto_402190 ?auto_402194 ) ) ( not ( = ?auto_402191 ?auto_402192 ) ) ( not ( = ?auto_402191 ?auto_402193 ) ) ( not ( = ?auto_402191 ?auto_402194 ) ) ( not ( = ?auto_402192 ?auto_402193 ) ) ( not ( = ?auto_402192 ?auto_402194 ) ) ( not ( = ?auto_402193 ?auto_402194 ) ) ( ON ?auto_402193 ?auto_402194 ) ( ON ?auto_402192 ?auto_402193 ) ( ON ?auto_402191 ?auto_402192 ) ( ON ?auto_402190 ?auto_402191 ) ( ON ?auto_402189 ?auto_402190 ) ( ON ?auto_402188 ?auto_402189 ) ( ON ?auto_402187 ?auto_402188 ) ( ON ?auto_402186 ?auto_402187 ) ( ON ?auto_402185 ?auto_402186 ) ( ON ?auto_402184 ?auto_402185 ) ( ON ?auto_402183 ?auto_402184 ) ( CLEAR ?auto_402181 ) ( ON ?auto_402182 ?auto_402183 ) ( CLEAR ?auto_402182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_402180 ?auto_402181 ?auto_402182 )
      ( MAKE-15PILE ?auto_402180 ?auto_402181 ?auto_402182 ?auto_402183 ?auto_402184 ?auto_402185 ?auto_402186 ?auto_402187 ?auto_402188 ?auto_402189 ?auto_402190 ?auto_402191 ?auto_402192 ?auto_402193 ?auto_402194 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_402210 - BLOCK
      ?auto_402211 - BLOCK
      ?auto_402212 - BLOCK
      ?auto_402213 - BLOCK
      ?auto_402214 - BLOCK
      ?auto_402215 - BLOCK
      ?auto_402216 - BLOCK
      ?auto_402217 - BLOCK
      ?auto_402218 - BLOCK
      ?auto_402219 - BLOCK
      ?auto_402220 - BLOCK
      ?auto_402221 - BLOCK
      ?auto_402222 - BLOCK
      ?auto_402223 - BLOCK
      ?auto_402224 - BLOCK
    )
    :vars
    (
      ?auto_402225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402224 ?auto_402225 ) ( ON-TABLE ?auto_402210 ) ( not ( = ?auto_402210 ?auto_402211 ) ) ( not ( = ?auto_402210 ?auto_402212 ) ) ( not ( = ?auto_402210 ?auto_402213 ) ) ( not ( = ?auto_402210 ?auto_402214 ) ) ( not ( = ?auto_402210 ?auto_402215 ) ) ( not ( = ?auto_402210 ?auto_402216 ) ) ( not ( = ?auto_402210 ?auto_402217 ) ) ( not ( = ?auto_402210 ?auto_402218 ) ) ( not ( = ?auto_402210 ?auto_402219 ) ) ( not ( = ?auto_402210 ?auto_402220 ) ) ( not ( = ?auto_402210 ?auto_402221 ) ) ( not ( = ?auto_402210 ?auto_402222 ) ) ( not ( = ?auto_402210 ?auto_402223 ) ) ( not ( = ?auto_402210 ?auto_402224 ) ) ( not ( = ?auto_402210 ?auto_402225 ) ) ( not ( = ?auto_402211 ?auto_402212 ) ) ( not ( = ?auto_402211 ?auto_402213 ) ) ( not ( = ?auto_402211 ?auto_402214 ) ) ( not ( = ?auto_402211 ?auto_402215 ) ) ( not ( = ?auto_402211 ?auto_402216 ) ) ( not ( = ?auto_402211 ?auto_402217 ) ) ( not ( = ?auto_402211 ?auto_402218 ) ) ( not ( = ?auto_402211 ?auto_402219 ) ) ( not ( = ?auto_402211 ?auto_402220 ) ) ( not ( = ?auto_402211 ?auto_402221 ) ) ( not ( = ?auto_402211 ?auto_402222 ) ) ( not ( = ?auto_402211 ?auto_402223 ) ) ( not ( = ?auto_402211 ?auto_402224 ) ) ( not ( = ?auto_402211 ?auto_402225 ) ) ( not ( = ?auto_402212 ?auto_402213 ) ) ( not ( = ?auto_402212 ?auto_402214 ) ) ( not ( = ?auto_402212 ?auto_402215 ) ) ( not ( = ?auto_402212 ?auto_402216 ) ) ( not ( = ?auto_402212 ?auto_402217 ) ) ( not ( = ?auto_402212 ?auto_402218 ) ) ( not ( = ?auto_402212 ?auto_402219 ) ) ( not ( = ?auto_402212 ?auto_402220 ) ) ( not ( = ?auto_402212 ?auto_402221 ) ) ( not ( = ?auto_402212 ?auto_402222 ) ) ( not ( = ?auto_402212 ?auto_402223 ) ) ( not ( = ?auto_402212 ?auto_402224 ) ) ( not ( = ?auto_402212 ?auto_402225 ) ) ( not ( = ?auto_402213 ?auto_402214 ) ) ( not ( = ?auto_402213 ?auto_402215 ) ) ( not ( = ?auto_402213 ?auto_402216 ) ) ( not ( = ?auto_402213 ?auto_402217 ) ) ( not ( = ?auto_402213 ?auto_402218 ) ) ( not ( = ?auto_402213 ?auto_402219 ) ) ( not ( = ?auto_402213 ?auto_402220 ) ) ( not ( = ?auto_402213 ?auto_402221 ) ) ( not ( = ?auto_402213 ?auto_402222 ) ) ( not ( = ?auto_402213 ?auto_402223 ) ) ( not ( = ?auto_402213 ?auto_402224 ) ) ( not ( = ?auto_402213 ?auto_402225 ) ) ( not ( = ?auto_402214 ?auto_402215 ) ) ( not ( = ?auto_402214 ?auto_402216 ) ) ( not ( = ?auto_402214 ?auto_402217 ) ) ( not ( = ?auto_402214 ?auto_402218 ) ) ( not ( = ?auto_402214 ?auto_402219 ) ) ( not ( = ?auto_402214 ?auto_402220 ) ) ( not ( = ?auto_402214 ?auto_402221 ) ) ( not ( = ?auto_402214 ?auto_402222 ) ) ( not ( = ?auto_402214 ?auto_402223 ) ) ( not ( = ?auto_402214 ?auto_402224 ) ) ( not ( = ?auto_402214 ?auto_402225 ) ) ( not ( = ?auto_402215 ?auto_402216 ) ) ( not ( = ?auto_402215 ?auto_402217 ) ) ( not ( = ?auto_402215 ?auto_402218 ) ) ( not ( = ?auto_402215 ?auto_402219 ) ) ( not ( = ?auto_402215 ?auto_402220 ) ) ( not ( = ?auto_402215 ?auto_402221 ) ) ( not ( = ?auto_402215 ?auto_402222 ) ) ( not ( = ?auto_402215 ?auto_402223 ) ) ( not ( = ?auto_402215 ?auto_402224 ) ) ( not ( = ?auto_402215 ?auto_402225 ) ) ( not ( = ?auto_402216 ?auto_402217 ) ) ( not ( = ?auto_402216 ?auto_402218 ) ) ( not ( = ?auto_402216 ?auto_402219 ) ) ( not ( = ?auto_402216 ?auto_402220 ) ) ( not ( = ?auto_402216 ?auto_402221 ) ) ( not ( = ?auto_402216 ?auto_402222 ) ) ( not ( = ?auto_402216 ?auto_402223 ) ) ( not ( = ?auto_402216 ?auto_402224 ) ) ( not ( = ?auto_402216 ?auto_402225 ) ) ( not ( = ?auto_402217 ?auto_402218 ) ) ( not ( = ?auto_402217 ?auto_402219 ) ) ( not ( = ?auto_402217 ?auto_402220 ) ) ( not ( = ?auto_402217 ?auto_402221 ) ) ( not ( = ?auto_402217 ?auto_402222 ) ) ( not ( = ?auto_402217 ?auto_402223 ) ) ( not ( = ?auto_402217 ?auto_402224 ) ) ( not ( = ?auto_402217 ?auto_402225 ) ) ( not ( = ?auto_402218 ?auto_402219 ) ) ( not ( = ?auto_402218 ?auto_402220 ) ) ( not ( = ?auto_402218 ?auto_402221 ) ) ( not ( = ?auto_402218 ?auto_402222 ) ) ( not ( = ?auto_402218 ?auto_402223 ) ) ( not ( = ?auto_402218 ?auto_402224 ) ) ( not ( = ?auto_402218 ?auto_402225 ) ) ( not ( = ?auto_402219 ?auto_402220 ) ) ( not ( = ?auto_402219 ?auto_402221 ) ) ( not ( = ?auto_402219 ?auto_402222 ) ) ( not ( = ?auto_402219 ?auto_402223 ) ) ( not ( = ?auto_402219 ?auto_402224 ) ) ( not ( = ?auto_402219 ?auto_402225 ) ) ( not ( = ?auto_402220 ?auto_402221 ) ) ( not ( = ?auto_402220 ?auto_402222 ) ) ( not ( = ?auto_402220 ?auto_402223 ) ) ( not ( = ?auto_402220 ?auto_402224 ) ) ( not ( = ?auto_402220 ?auto_402225 ) ) ( not ( = ?auto_402221 ?auto_402222 ) ) ( not ( = ?auto_402221 ?auto_402223 ) ) ( not ( = ?auto_402221 ?auto_402224 ) ) ( not ( = ?auto_402221 ?auto_402225 ) ) ( not ( = ?auto_402222 ?auto_402223 ) ) ( not ( = ?auto_402222 ?auto_402224 ) ) ( not ( = ?auto_402222 ?auto_402225 ) ) ( not ( = ?auto_402223 ?auto_402224 ) ) ( not ( = ?auto_402223 ?auto_402225 ) ) ( not ( = ?auto_402224 ?auto_402225 ) ) ( ON ?auto_402223 ?auto_402224 ) ( ON ?auto_402222 ?auto_402223 ) ( ON ?auto_402221 ?auto_402222 ) ( ON ?auto_402220 ?auto_402221 ) ( ON ?auto_402219 ?auto_402220 ) ( ON ?auto_402218 ?auto_402219 ) ( ON ?auto_402217 ?auto_402218 ) ( ON ?auto_402216 ?auto_402217 ) ( ON ?auto_402215 ?auto_402216 ) ( ON ?auto_402214 ?auto_402215 ) ( ON ?auto_402213 ?auto_402214 ) ( ON ?auto_402212 ?auto_402213 ) ( CLEAR ?auto_402210 ) ( ON ?auto_402211 ?auto_402212 ) ( CLEAR ?auto_402211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_402210 ?auto_402211 )
      ( MAKE-15PILE ?auto_402210 ?auto_402211 ?auto_402212 ?auto_402213 ?auto_402214 ?auto_402215 ?auto_402216 ?auto_402217 ?auto_402218 ?auto_402219 ?auto_402220 ?auto_402221 ?auto_402222 ?auto_402223 ?auto_402224 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_402241 - BLOCK
      ?auto_402242 - BLOCK
      ?auto_402243 - BLOCK
      ?auto_402244 - BLOCK
      ?auto_402245 - BLOCK
      ?auto_402246 - BLOCK
      ?auto_402247 - BLOCK
      ?auto_402248 - BLOCK
      ?auto_402249 - BLOCK
      ?auto_402250 - BLOCK
      ?auto_402251 - BLOCK
      ?auto_402252 - BLOCK
      ?auto_402253 - BLOCK
      ?auto_402254 - BLOCK
      ?auto_402255 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_402255 ) ( ON-TABLE ?auto_402241 ) ( not ( = ?auto_402241 ?auto_402242 ) ) ( not ( = ?auto_402241 ?auto_402243 ) ) ( not ( = ?auto_402241 ?auto_402244 ) ) ( not ( = ?auto_402241 ?auto_402245 ) ) ( not ( = ?auto_402241 ?auto_402246 ) ) ( not ( = ?auto_402241 ?auto_402247 ) ) ( not ( = ?auto_402241 ?auto_402248 ) ) ( not ( = ?auto_402241 ?auto_402249 ) ) ( not ( = ?auto_402241 ?auto_402250 ) ) ( not ( = ?auto_402241 ?auto_402251 ) ) ( not ( = ?auto_402241 ?auto_402252 ) ) ( not ( = ?auto_402241 ?auto_402253 ) ) ( not ( = ?auto_402241 ?auto_402254 ) ) ( not ( = ?auto_402241 ?auto_402255 ) ) ( not ( = ?auto_402242 ?auto_402243 ) ) ( not ( = ?auto_402242 ?auto_402244 ) ) ( not ( = ?auto_402242 ?auto_402245 ) ) ( not ( = ?auto_402242 ?auto_402246 ) ) ( not ( = ?auto_402242 ?auto_402247 ) ) ( not ( = ?auto_402242 ?auto_402248 ) ) ( not ( = ?auto_402242 ?auto_402249 ) ) ( not ( = ?auto_402242 ?auto_402250 ) ) ( not ( = ?auto_402242 ?auto_402251 ) ) ( not ( = ?auto_402242 ?auto_402252 ) ) ( not ( = ?auto_402242 ?auto_402253 ) ) ( not ( = ?auto_402242 ?auto_402254 ) ) ( not ( = ?auto_402242 ?auto_402255 ) ) ( not ( = ?auto_402243 ?auto_402244 ) ) ( not ( = ?auto_402243 ?auto_402245 ) ) ( not ( = ?auto_402243 ?auto_402246 ) ) ( not ( = ?auto_402243 ?auto_402247 ) ) ( not ( = ?auto_402243 ?auto_402248 ) ) ( not ( = ?auto_402243 ?auto_402249 ) ) ( not ( = ?auto_402243 ?auto_402250 ) ) ( not ( = ?auto_402243 ?auto_402251 ) ) ( not ( = ?auto_402243 ?auto_402252 ) ) ( not ( = ?auto_402243 ?auto_402253 ) ) ( not ( = ?auto_402243 ?auto_402254 ) ) ( not ( = ?auto_402243 ?auto_402255 ) ) ( not ( = ?auto_402244 ?auto_402245 ) ) ( not ( = ?auto_402244 ?auto_402246 ) ) ( not ( = ?auto_402244 ?auto_402247 ) ) ( not ( = ?auto_402244 ?auto_402248 ) ) ( not ( = ?auto_402244 ?auto_402249 ) ) ( not ( = ?auto_402244 ?auto_402250 ) ) ( not ( = ?auto_402244 ?auto_402251 ) ) ( not ( = ?auto_402244 ?auto_402252 ) ) ( not ( = ?auto_402244 ?auto_402253 ) ) ( not ( = ?auto_402244 ?auto_402254 ) ) ( not ( = ?auto_402244 ?auto_402255 ) ) ( not ( = ?auto_402245 ?auto_402246 ) ) ( not ( = ?auto_402245 ?auto_402247 ) ) ( not ( = ?auto_402245 ?auto_402248 ) ) ( not ( = ?auto_402245 ?auto_402249 ) ) ( not ( = ?auto_402245 ?auto_402250 ) ) ( not ( = ?auto_402245 ?auto_402251 ) ) ( not ( = ?auto_402245 ?auto_402252 ) ) ( not ( = ?auto_402245 ?auto_402253 ) ) ( not ( = ?auto_402245 ?auto_402254 ) ) ( not ( = ?auto_402245 ?auto_402255 ) ) ( not ( = ?auto_402246 ?auto_402247 ) ) ( not ( = ?auto_402246 ?auto_402248 ) ) ( not ( = ?auto_402246 ?auto_402249 ) ) ( not ( = ?auto_402246 ?auto_402250 ) ) ( not ( = ?auto_402246 ?auto_402251 ) ) ( not ( = ?auto_402246 ?auto_402252 ) ) ( not ( = ?auto_402246 ?auto_402253 ) ) ( not ( = ?auto_402246 ?auto_402254 ) ) ( not ( = ?auto_402246 ?auto_402255 ) ) ( not ( = ?auto_402247 ?auto_402248 ) ) ( not ( = ?auto_402247 ?auto_402249 ) ) ( not ( = ?auto_402247 ?auto_402250 ) ) ( not ( = ?auto_402247 ?auto_402251 ) ) ( not ( = ?auto_402247 ?auto_402252 ) ) ( not ( = ?auto_402247 ?auto_402253 ) ) ( not ( = ?auto_402247 ?auto_402254 ) ) ( not ( = ?auto_402247 ?auto_402255 ) ) ( not ( = ?auto_402248 ?auto_402249 ) ) ( not ( = ?auto_402248 ?auto_402250 ) ) ( not ( = ?auto_402248 ?auto_402251 ) ) ( not ( = ?auto_402248 ?auto_402252 ) ) ( not ( = ?auto_402248 ?auto_402253 ) ) ( not ( = ?auto_402248 ?auto_402254 ) ) ( not ( = ?auto_402248 ?auto_402255 ) ) ( not ( = ?auto_402249 ?auto_402250 ) ) ( not ( = ?auto_402249 ?auto_402251 ) ) ( not ( = ?auto_402249 ?auto_402252 ) ) ( not ( = ?auto_402249 ?auto_402253 ) ) ( not ( = ?auto_402249 ?auto_402254 ) ) ( not ( = ?auto_402249 ?auto_402255 ) ) ( not ( = ?auto_402250 ?auto_402251 ) ) ( not ( = ?auto_402250 ?auto_402252 ) ) ( not ( = ?auto_402250 ?auto_402253 ) ) ( not ( = ?auto_402250 ?auto_402254 ) ) ( not ( = ?auto_402250 ?auto_402255 ) ) ( not ( = ?auto_402251 ?auto_402252 ) ) ( not ( = ?auto_402251 ?auto_402253 ) ) ( not ( = ?auto_402251 ?auto_402254 ) ) ( not ( = ?auto_402251 ?auto_402255 ) ) ( not ( = ?auto_402252 ?auto_402253 ) ) ( not ( = ?auto_402252 ?auto_402254 ) ) ( not ( = ?auto_402252 ?auto_402255 ) ) ( not ( = ?auto_402253 ?auto_402254 ) ) ( not ( = ?auto_402253 ?auto_402255 ) ) ( not ( = ?auto_402254 ?auto_402255 ) ) ( ON ?auto_402254 ?auto_402255 ) ( ON ?auto_402253 ?auto_402254 ) ( ON ?auto_402252 ?auto_402253 ) ( ON ?auto_402251 ?auto_402252 ) ( ON ?auto_402250 ?auto_402251 ) ( ON ?auto_402249 ?auto_402250 ) ( ON ?auto_402248 ?auto_402249 ) ( ON ?auto_402247 ?auto_402248 ) ( ON ?auto_402246 ?auto_402247 ) ( ON ?auto_402245 ?auto_402246 ) ( ON ?auto_402244 ?auto_402245 ) ( ON ?auto_402243 ?auto_402244 ) ( CLEAR ?auto_402241 ) ( ON ?auto_402242 ?auto_402243 ) ( CLEAR ?auto_402242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_402241 ?auto_402242 )
      ( MAKE-15PILE ?auto_402241 ?auto_402242 ?auto_402243 ?auto_402244 ?auto_402245 ?auto_402246 ?auto_402247 ?auto_402248 ?auto_402249 ?auto_402250 ?auto_402251 ?auto_402252 ?auto_402253 ?auto_402254 ?auto_402255 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_402271 - BLOCK
      ?auto_402272 - BLOCK
      ?auto_402273 - BLOCK
      ?auto_402274 - BLOCK
      ?auto_402275 - BLOCK
      ?auto_402276 - BLOCK
      ?auto_402277 - BLOCK
      ?auto_402278 - BLOCK
      ?auto_402279 - BLOCK
      ?auto_402280 - BLOCK
      ?auto_402281 - BLOCK
      ?auto_402282 - BLOCK
      ?auto_402283 - BLOCK
      ?auto_402284 - BLOCK
      ?auto_402285 - BLOCK
    )
    :vars
    (
      ?auto_402286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_402285 ?auto_402286 ) ( not ( = ?auto_402271 ?auto_402272 ) ) ( not ( = ?auto_402271 ?auto_402273 ) ) ( not ( = ?auto_402271 ?auto_402274 ) ) ( not ( = ?auto_402271 ?auto_402275 ) ) ( not ( = ?auto_402271 ?auto_402276 ) ) ( not ( = ?auto_402271 ?auto_402277 ) ) ( not ( = ?auto_402271 ?auto_402278 ) ) ( not ( = ?auto_402271 ?auto_402279 ) ) ( not ( = ?auto_402271 ?auto_402280 ) ) ( not ( = ?auto_402271 ?auto_402281 ) ) ( not ( = ?auto_402271 ?auto_402282 ) ) ( not ( = ?auto_402271 ?auto_402283 ) ) ( not ( = ?auto_402271 ?auto_402284 ) ) ( not ( = ?auto_402271 ?auto_402285 ) ) ( not ( = ?auto_402271 ?auto_402286 ) ) ( not ( = ?auto_402272 ?auto_402273 ) ) ( not ( = ?auto_402272 ?auto_402274 ) ) ( not ( = ?auto_402272 ?auto_402275 ) ) ( not ( = ?auto_402272 ?auto_402276 ) ) ( not ( = ?auto_402272 ?auto_402277 ) ) ( not ( = ?auto_402272 ?auto_402278 ) ) ( not ( = ?auto_402272 ?auto_402279 ) ) ( not ( = ?auto_402272 ?auto_402280 ) ) ( not ( = ?auto_402272 ?auto_402281 ) ) ( not ( = ?auto_402272 ?auto_402282 ) ) ( not ( = ?auto_402272 ?auto_402283 ) ) ( not ( = ?auto_402272 ?auto_402284 ) ) ( not ( = ?auto_402272 ?auto_402285 ) ) ( not ( = ?auto_402272 ?auto_402286 ) ) ( not ( = ?auto_402273 ?auto_402274 ) ) ( not ( = ?auto_402273 ?auto_402275 ) ) ( not ( = ?auto_402273 ?auto_402276 ) ) ( not ( = ?auto_402273 ?auto_402277 ) ) ( not ( = ?auto_402273 ?auto_402278 ) ) ( not ( = ?auto_402273 ?auto_402279 ) ) ( not ( = ?auto_402273 ?auto_402280 ) ) ( not ( = ?auto_402273 ?auto_402281 ) ) ( not ( = ?auto_402273 ?auto_402282 ) ) ( not ( = ?auto_402273 ?auto_402283 ) ) ( not ( = ?auto_402273 ?auto_402284 ) ) ( not ( = ?auto_402273 ?auto_402285 ) ) ( not ( = ?auto_402273 ?auto_402286 ) ) ( not ( = ?auto_402274 ?auto_402275 ) ) ( not ( = ?auto_402274 ?auto_402276 ) ) ( not ( = ?auto_402274 ?auto_402277 ) ) ( not ( = ?auto_402274 ?auto_402278 ) ) ( not ( = ?auto_402274 ?auto_402279 ) ) ( not ( = ?auto_402274 ?auto_402280 ) ) ( not ( = ?auto_402274 ?auto_402281 ) ) ( not ( = ?auto_402274 ?auto_402282 ) ) ( not ( = ?auto_402274 ?auto_402283 ) ) ( not ( = ?auto_402274 ?auto_402284 ) ) ( not ( = ?auto_402274 ?auto_402285 ) ) ( not ( = ?auto_402274 ?auto_402286 ) ) ( not ( = ?auto_402275 ?auto_402276 ) ) ( not ( = ?auto_402275 ?auto_402277 ) ) ( not ( = ?auto_402275 ?auto_402278 ) ) ( not ( = ?auto_402275 ?auto_402279 ) ) ( not ( = ?auto_402275 ?auto_402280 ) ) ( not ( = ?auto_402275 ?auto_402281 ) ) ( not ( = ?auto_402275 ?auto_402282 ) ) ( not ( = ?auto_402275 ?auto_402283 ) ) ( not ( = ?auto_402275 ?auto_402284 ) ) ( not ( = ?auto_402275 ?auto_402285 ) ) ( not ( = ?auto_402275 ?auto_402286 ) ) ( not ( = ?auto_402276 ?auto_402277 ) ) ( not ( = ?auto_402276 ?auto_402278 ) ) ( not ( = ?auto_402276 ?auto_402279 ) ) ( not ( = ?auto_402276 ?auto_402280 ) ) ( not ( = ?auto_402276 ?auto_402281 ) ) ( not ( = ?auto_402276 ?auto_402282 ) ) ( not ( = ?auto_402276 ?auto_402283 ) ) ( not ( = ?auto_402276 ?auto_402284 ) ) ( not ( = ?auto_402276 ?auto_402285 ) ) ( not ( = ?auto_402276 ?auto_402286 ) ) ( not ( = ?auto_402277 ?auto_402278 ) ) ( not ( = ?auto_402277 ?auto_402279 ) ) ( not ( = ?auto_402277 ?auto_402280 ) ) ( not ( = ?auto_402277 ?auto_402281 ) ) ( not ( = ?auto_402277 ?auto_402282 ) ) ( not ( = ?auto_402277 ?auto_402283 ) ) ( not ( = ?auto_402277 ?auto_402284 ) ) ( not ( = ?auto_402277 ?auto_402285 ) ) ( not ( = ?auto_402277 ?auto_402286 ) ) ( not ( = ?auto_402278 ?auto_402279 ) ) ( not ( = ?auto_402278 ?auto_402280 ) ) ( not ( = ?auto_402278 ?auto_402281 ) ) ( not ( = ?auto_402278 ?auto_402282 ) ) ( not ( = ?auto_402278 ?auto_402283 ) ) ( not ( = ?auto_402278 ?auto_402284 ) ) ( not ( = ?auto_402278 ?auto_402285 ) ) ( not ( = ?auto_402278 ?auto_402286 ) ) ( not ( = ?auto_402279 ?auto_402280 ) ) ( not ( = ?auto_402279 ?auto_402281 ) ) ( not ( = ?auto_402279 ?auto_402282 ) ) ( not ( = ?auto_402279 ?auto_402283 ) ) ( not ( = ?auto_402279 ?auto_402284 ) ) ( not ( = ?auto_402279 ?auto_402285 ) ) ( not ( = ?auto_402279 ?auto_402286 ) ) ( not ( = ?auto_402280 ?auto_402281 ) ) ( not ( = ?auto_402280 ?auto_402282 ) ) ( not ( = ?auto_402280 ?auto_402283 ) ) ( not ( = ?auto_402280 ?auto_402284 ) ) ( not ( = ?auto_402280 ?auto_402285 ) ) ( not ( = ?auto_402280 ?auto_402286 ) ) ( not ( = ?auto_402281 ?auto_402282 ) ) ( not ( = ?auto_402281 ?auto_402283 ) ) ( not ( = ?auto_402281 ?auto_402284 ) ) ( not ( = ?auto_402281 ?auto_402285 ) ) ( not ( = ?auto_402281 ?auto_402286 ) ) ( not ( = ?auto_402282 ?auto_402283 ) ) ( not ( = ?auto_402282 ?auto_402284 ) ) ( not ( = ?auto_402282 ?auto_402285 ) ) ( not ( = ?auto_402282 ?auto_402286 ) ) ( not ( = ?auto_402283 ?auto_402284 ) ) ( not ( = ?auto_402283 ?auto_402285 ) ) ( not ( = ?auto_402283 ?auto_402286 ) ) ( not ( = ?auto_402284 ?auto_402285 ) ) ( not ( = ?auto_402284 ?auto_402286 ) ) ( not ( = ?auto_402285 ?auto_402286 ) ) ( ON ?auto_402284 ?auto_402285 ) ( ON ?auto_402283 ?auto_402284 ) ( ON ?auto_402282 ?auto_402283 ) ( ON ?auto_402281 ?auto_402282 ) ( ON ?auto_402280 ?auto_402281 ) ( ON ?auto_402279 ?auto_402280 ) ( ON ?auto_402278 ?auto_402279 ) ( ON ?auto_402277 ?auto_402278 ) ( ON ?auto_402276 ?auto_402277 ) ( ON ?auto_402275 ?auto_402276 ) ( ON ?auto_402274 ?auto_402275 ) ( ON ?auto_402273 ?auto_402274 ) ( ON ?auto_402272 ?auto_402273 ) ( ON ?auto_402271 ?auto_402272 ) ( CLEAR ?auto_402271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_402271 )
      ( MAKE-15PILE ?auto_402271 ?auto_402272 ?auto_402273 ?auto_402274 ?auto_402275 ?auto_402276 ?auto_402277 ?auto_402278 ?auto_402279 ?auto_402280 ?auto_402281 ?auto_402282 ?auto_402283 ?auto_402284 ?auto_402285 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_402302 - BLOCK
      ?auto_402303 - BLOCK
      ?auto_402304 - BLOCK
      ?auto_402305 - BLOCK
      ?auto_402306 - BLOCK
      ?auto_402307 - BLOCK
      ?auto_402308 - BLOCK
      ?auto_402309 - BLOCK
      ?auto_402310 - BLOCK
      ?auto_402311 - BLOCK
      ?auto_402312 - BLOCK
      ?auto_402313 - BLOCK
      ?auto_402314 - BLOCK
      ?auto_402315 - BLOCK
      ?auto_402316 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_402316 ) ( not ( = ?auto_402302 ?auto_402303 ) ) ( not ( = ?auto_402302 ?auto_402304 ) ) ( not ( = ?auto_402302 ?auto_402305 ) ) ( not ( = ?auto_402302 ?auto_402306 ) ) ( not ( = ?auto_402302 ?auto_402307 ) ) ( not ( = ?auto_402302 ?auto_402308 ) ) ( not ( = ?auto_402302 ?auto_402309 ) ) ( not ( = ?auto_402302 ?auto_402310 ) ) ( not ( = ?auto_402302 ?auto_402311 ) ) ( not ( = ?auto_402302 ?auto_402312 ) ) ( not ( = ?auto_402302 ?auto_402313 ) ) ( not ( = ?auto_402302 ?auto_402314 ) ) ( not ( = ?auto_402302 ?auto_402315 ) ) ( not ( = ?auto_402302 ?auto_402316 ) ) ( not ( = ?auto_402303 ?auto_402304 ) ) ( not ( = ?auto_402303 ?auto_402305 ) ) ( not ( = ?auto_402303 ?auto_402306 ) ) ( not ( = ?auto_402303 ?auto_402307 ) ) ( not ( = ?auto_402303 ?auto_402308 ) ) ( not ( = ?auto_402303 ?auto_402309 ) ) ( not ( = ?auto_402303 ?auto_402310 ) ) ( not ( = ?auto_402303 ?auto_402311 ) ) ( not ( = ?auto_402303 ?auto_402312 ) ) ( not ( = ?auto_402303 ?auto_402313 ) ) ( not ( = ?auto_402303 ?auto_402314 ) ) ( not ( = ?auto_402303 ?auto_402315 ) ) ( not ( = ?auto_402303 ?auto_402316 ) ) ( not ( = ?auto_402304 ?auto_402305 ) ) ( not ( = ?auto_402304 ?auto_402306 ) ) ( not ( = ?auto_402304 ?auto_402307 ) ) ( not ( = ?auto_402304 ?auto_402308 ) ) ( not ( = ?auto_402304 ?auto_402309 ) ) ( not ( = ?auto_402304 ?auto_402310 ) ) ( not ( = ?auto_402304 ?auto_402311 ) ) ( not ( = ?auto_402304 ?auto_402312 ) ) ( not ( = ?auto_402304 ?auto_402313 ) ) ( not ( = ?auto_402304 ?auto_402314 ) ) ( not ( = ?auto_402304 ?auto_402315 ) ) ( not ( = ?auto_402304 ?auto_402316 ) ) ( not ( = ?auto_402305 ?auto_402306 ) ) ( not ( = ?auto_402305 ?auto_402307 ) ) ( not ( = ?auto_402305 ?auto_402308 ) ) ( not ( = ?auto_402305 ?auto_402309 ) ) ( not ( = ?auto_402305 ?auto_402310 ) ) ( not ( = ?auto_402305 ?auto_402311 ) ) ( not ( = ?auto_402305 ?auto_402312 ) ) ( not ( = ?auto_402305 ?auto_402313 ) ) ( not ( = ?auto_402305 ?auto_402314 ) ) ( not ( = ?auto_402305 ?auto_402315 ) ) ( not ( = ?auto_402305 ?auto_402316 ) ) ( not ( = ?auto_402306 ?auto_402307 ) ) ( not ( = ?auto_402306 ?auto_402308 ) ) ( not ( = ?auto_402306 ?auto_402309 ) ) ( not ( = ?auto_402306 ?auto_402310 ) ) ( not ( = ?auto_402306 ?auto_402311 ) ) ( not ( = ?auto_402306 ?auto_402312 ) ) ( not ( = ?auto_402306 ?auto_402313 ) ) ( not ( = ?auto_402306 ?auto_402314 ) ) ( not ( = ?auto_402306 ?auto_402315 ) ) ( not ( = ?auto_402306 ?auto_402316 ) ) ( not ( = ?auto_402307 ?auto_402308 ) ) ( not ( = ?auto_402307 ?auto_402309 ) ) ( not ( = ?auto_402307 ?auto_402310 ) ) ( not ( = ?auto_402307 ?auto_402311 ) ) ( not ( = ?auto_402307 ?auto_402312 ) ) ( not ( = ?auto_402307 ?auto_402313 ) ) ( not ( = ?auto_402307 ?auto_402314 ) ) ( not ( = ?auto_402307 ?auto_402315 ) ) ( not ( = ?auto_402307 ?auto_402316 ) ) ( not ( = ?auto_402308 ?auto_402309 ) ) ( not ( = ?auto_402308 ?auto_402310 ) ) ( not ( = ?auto_402308 ?auto_402311 ) ) ( not ( = ?auto_402308 ?auto_402312 ) ) ( not ( = ?auto_402308 ?auto_402313 ) ) ( not ( = ?auto_402308 ?auto_402314 ) ) ( not ( = ?auto_402308 ?auto_402315 ) ) ( not ( = ?auto_402308 ?auto_402316 ) ) ( not ( = ?auto_402309 ?auto_402310 ) ) ( not ( = ?auto_402309 ?auto_402311 ) ) ( not ( = ?auto_402309 ?auto_402312 ) ) ( not ( = ?auto_402309 ?auto_402313 ) ) ( not ( = ?auto_402309 ?auto_402314 ) ) ( not ( = ?auto_402309 ?auto_402315 ) ) ( not ( = ?auto_402309 ?auto_402316 ) ) ( not ( = ?auto_402310 ?auto_402311 ) ) ( not ( = ?auto_402310 ?auto_402312 ) ) ( not ( = ?auto_402310 ?auto_402313 ) ) ( not ( = ?auto_402310 ?auto_402314 ) ) ( not ( = ?auto_402310 ?auto_402315 ) ) ( not ( = ?auto_402310 ?auto_402316 ) ) ( not ( = ?auto_402311 ?auto_402312 ) ) ( not ( = ?auto_402311 ?auto_402313 ) ) ( not ( = ?auto_402311 ?auto_402314 ) ) ( not ( = ?auto_402311 ?auto_402315 ) ) ( not ( = ?auto_402311 ?auto_402316 ) ) ( not ( = ?auto_402312 ?auto_402313 ) ) ( not ( = ?auto_402312 ?auto_402314 ) ) ( not ( = ?auto_402312 ?auto_402315 ) ) ( not ( = ?auto_402312 ?auto_402316 ) ) ( not ( = ?auto_402313 ?auto_402314 ) ) ( not ( = ?auto_402313 ?auto_402315 ) ) ( not ( = ?auto_402313 ?auto_402316 ) ) ( not ( = ?auto_402314 ?auto_402315 ) ) ( not ( = ?auto_402314 ?auto_402316 ) ) ( not ( = ?auto_402315 ?auto_402316 ) ) ( ON ?auto_402315 ?auto_402316 ) ( ON ?auto_402314 ?auto_402315 ) ( ON ?auto_402313 ?auto_402314 ) ( ON ?auto_402312 ?auto_402313 ) ( ON ?auto_402311 ?auto_402312 ) ( ON ?auto_402310 ?auto_402311 ) ( ON ?auto_402309 ?auto_402310 ) ( ON ?auto_402308 ?auto_402309 ) ( ON ?auto_402307 ?auto_402308 ) ( ON ?auto_402306 ?auto_402307 ) ( ON ?auto_402305 ?auto_402306 ) ( ON ?auto_402304 ?auto_402305 ) ( ON ?auto_402303 ?auto_402304 ) ( ON ?auto_402302 ?auto_402303 ) ( CLEAR ?auto_402302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_402302 )
      ( MAKE-15PILE ?auto_402302 ?auto_402303 ?auto_402304 ?auto_402305 ?auto_402306 ?auto_402307 ?auto_402308 ?auto_402309 ?auto_402310 ?auto_402311 ?auto_402312 ?auto_402313 ?auto_402314 ?auto_402315 ?auto_402316 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_402332 - BLOCK
      ?auto_402333 - BLOCK
      ?auto_402334 - BLOCK
      ?auto_402335 - BLOCK
      ?auto_402336 - BLOCK
      ?auto_402337 - BLOCK
      ?auto_402338 - BLOCK
      ?auto_402339 - BLOCK
      ?auto_402340 - BLOCK
      ?auto_402341 - BLOCK
      ?auto_402342 - BLOCK
      ?auto_402343 - BLOCK
      ?auto_402344 - BLOCK
      ?auto_402345 - BLOCK
      ?auto_402346 - BLOCK
    )
    :vars
    (
      ?auto_402347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_402332 ?auto_402333 ) ) ( not ( = ?auto_402332 ?auto_402334 ) ) ( not ( = ?auto_402332 ?auto_402335 ) ) ( not ( = ?auto_402332 ?auto_402336 ) ) ( not ( = ?auto_402332 ?auto_402337 ) ) ( not ( = ?auto_402332 ?auto_402338 ) ) ( not ( = ?auto_402332 ?auto_402339 ) ) ( not ( = ?auto_402332 ?auto_402340 ) ) ( not ( = ?auto_402332 ?auto_402341 ) ) ( not ( = ?auto_402332 ?auto_402342 ) ) ( not ( = ?auto_402332 ?auto_402343 ) ) ( not ( = ?auto_402332 ?auto_402344 ) ) ( not ( = ?auto_402332 ?auto_402345 ) ) ( not ( = ?auto_402332 ?auto_402346 ) ) ( not ( = ?auto_402333 ?auto_402334 ) ) ( not ( = ?auto_402333 ?auto_402335 ) ) ( not ( = ?auto_402333 ?auto_402336 ) ) ( not ( = ?auto_402333 ?auto_402337 ) ) ( not ( = ?auto_402333 ?auto_402338 ) ) ( not ( = ?auto_402333 ?auto_402339 ) ) ( not ( = ?auto_402333 ?auto_402340 ) ) ( not ( = ?auto_402333 ?auto_402341 ) ) ( not ( = ?auto_402333 ?auto_402342 ) ) ( not ( = ?auto_402333 ?auto_402343 ) ) ( not ( = ?auto_402333 ?auto_402344 ) ) ( not ( = ?auto_402333 ?auto_402345 ) ) ( not ( = ?auto_402333 ?auto_402346 ) ) ( not ( = ?auto_402334 ?auto_402335 ) ) ( not ( = ?auto_402334 ?auto_402336 ) ) ( not ( = ?auto_402334 ?auto_402337 ) ) ( not ( = ?auto_402334 ?auto_402338 ) ) ( not ( = ?auto_402334 ?auto_402339 ) ) ( not ( = ?auto_402334 ?auto_402340 ) ) ( not ( = ?auto_402334 ?auto_402341 ) ) ( not ( = ?auto_402334 ?auto_402342 ) ) ( not ( = ?auto_402334 ?auto_402343 ) ) ( not ( = ?auto_402334 ?auto_402344 ) ) ( not ( = ?auto_402334 ?auto_402345 ) ) ( not ( = ?auto_402334 ?auto_402346 ) ) ( not ( = ?auto_402335 ?auto_402336 ) ) ( not ( = ?auto_402335 ?auto_402337 ) ) ( not ( = ?auto_402335 ?auto_402338 ) ) ( not ( = ?auto_402335 ?auto_402339 ) ) ( not ( = ?auto_402335 ?auto_402340 ) ) ( not ( = ?auto_402335 ?auto_402341 ) ) ( not ( = ?auto_402335 ?auto_402342 ) ) ( not ( = ?auto_402335 ?auto_402343 ) ) ( not ( = ?auto_402335 ?auto_402344 ) ) ( not ( = ?auto_402335 ?auto_402345 ) ) ( not ( = ?auto_402335 ?auto_402346 ) ) ( not ( = ?auto_402336 ?auto_402337 ) ) ( not ( = ?auto_402336 ?auto_402338 ) ) ( not ( = ?auto_402336 ?auto_402339 ) ) ( not ( = ?auto_402336 ?auto_402340 ) ) ( not ( = ?auto_402336 ?auto_402341 ) ) ( not ( = ?auto_402336 ?auto_402342 ) ) ( not ( = ?auto_402336 ?auto_402343 ) ) ( not ( = ?auto_402336 ?auto_402344 ) ) ( not ( = ?auto_402336 ?auto_402345 ) ) ( not ( = ?auto_402336 ?auto_402346 ) ) ( not ( = ?auto_402337 ?auto_402338 ) ) ( not ( = ?auto_402337 ?auto_402339 ) ) ( not ( = ?auto_402337 ?auto_402340 ) ) ( not ( = ?auto_402337 ?auto_402341 ) ) ( not ( = ?auto_402337 ?auto_402342 ) ) ( not ( = ?auto_402337 ?auto_402343 ) ) ( not ( = ?auto_402337 ?auto_402344 ) ) ( not ( = ?auto_402337 ?auto_402345 ) ) ( not ( = ?auto_402337 ?auto_402346 ) ) ( not ( = ?auto_402338 ?auto_402339 ) ) ( not ( = ?auto_402338 ?auto_402340 ) ) ( not ( = ?auto_402338 ?auto_402341 ) ) ( not ( = ?auto_402338 ?auto_402342 ) ) ( not ( = ?auto_402338 ?auto_402343 ) ) ( not ( = ?auto_402338 ?auto_402344 ) ) ( not ( = ?auto_402338 ?auto_402345 ) ) ( not ( = ?auto_402338 ?auto_402346 ) ) ( not ( = ?auto_402339 ?auto_402340 ) ) ( not ( = ?auto_402339 ?auto_402341 ) ) ( not ( = ?auto_402339 ?auto_402342 ) ) ( not ( = ?auto_402339 ?auto_402343 ) ) ( not ( = ?auto_402339 ?auto_402344 ) ) ( not ( = ?auto_402339 ?auto_402345 ) ) ( not ( = ?auto_402339 ?auto_402346 ) ) ( not ( = ?auto_402340 ?auto_402341 ) ) ( not ( = ?auto_402340 ?auto_402342 ) ) ( not ( = ?auto_402340 ?auto_402343 ) ) ( not ( = ?auto_402340 ?auto_402344 ) ) ( not ( = ?auto_402340 ?auto_402345 ) ) ( not ( = ?auto_402340 ?auto_402346 ) ) ( not ( = ?auto_402341 ?auto_402342 ) ) ( not ( = ?auto_402341 ?auto_402343 ) ) ( not ( = ?auto_402341 ?auto_402344 ) ) ( not ( = ?auto_402341 ?auto_402345 ) ) ( not ( = ?auto_402341 ?auto_402346 ) ) ( not ( = ?auto_402342 ?auto_402343 ) ) ( not ( = ?auto_402342 ?auto_402344 ) ) ( not ( = ?auto_402342 ?auto_402345 ) ) ( not ( = ?auto_402342 ?auto_402346 ) ) ( not ( = ?auto_402343 ?auto_402344 ) ) ( not ( = ?auto_402343 ?auto_402345 ) ) ( not ( = ?auto_402343 ?auto_402346 ) ) ( not ( = ?auto_402344 ?auto_402345 ) ) ( not ( = ?auto_402344 ?auto_402346 ) ) ( not ( = ?auto_402345 ?auto_402346 ) ) ( ON ?auto_402332 ?auto_402347 ) ( not ( = ?auto_402346 ?auto_402347 ) ) ( not ( = ?auto_402345 ?auto_402347 ) ) ( not ( = ?auto_402344 ?auto_402347 ) ) ( not ( = ?auto_402343 ?auto_402347 ) ) ( not ( = ?auto_402342 ?auto_402347 ) ) ( not ( = ?auto_402341 ?auto_402347 ) ) ( not ( = ?auto_402340 ?auto_402347 ) ) ( not ( = ?auto_402339 ?auto_402347 ) ) ( not ( = ?auto_402338 ?auto_402347 ) ) ( not ( = ?auto_402337 ?auto_402347 ) ) ( not ( = ?auto_402336 ?auto_402347 ) ) ( not ( = ?auto_402335 ?auto_402347 ) ) ( not ( = ?auto_402334 ?auto_402347 ) ) ( not ( = ?auto_402333 ?auto_402347 ) ) ( not ( = ?auto_402332 ?auto_402347 ) ) ( ON ?auto_402333 ?auto_402332 ) ( ON ?auto_402334 ?auto_402333 ) ( ON ?auto_402335 ?auto_402334 ) ( ON ?auto_402336 ?auto_402335 ) ( ON ?auto_402337 ?auto_402336 ) ( ON ?auto_402338 ?auto_402337 ) ( ON ?auto_402339 ?auto_402338 ) ( ON ?auto_402340 ?auto_402339 ) ( ON ?auto_402341 ?auto_402340 ) ( ON ?auto_402342 ?auto_402341 ) ( ON ?auto_402343 ?auto_402342 ) ( ON ?auto_402344 ?auto_402343 ) ( ON ?auto_402345 ?auto_402344 ) ( ON ?auto_402346 ?auto_402345 ) ( CLEAR ?auto_402346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_402346 ?auto_402345 ?auto_402344 ?auto_402343 ?auto_402342 ?auto_402341 ?auto_402340 ?auto_402339 ?auto_402338 ?auto_402337 ?auto_402336 ?auto_402335 ?auto_402334 ?auto_402333 ?auto_402332 )
      ( MAKE-15PILE ?auto_402332 ?auto_402333 ?auto_402334 ?auto_402335 ?auto_402336 ?auto_402337 ?auto_402338 ?auto_402339 ?auto_402340 ?auto_402341 ?auto_402342 ?auto_402343 ?auto_402344 ?auto_402345 ?auto_402346 ) )
  )

)

