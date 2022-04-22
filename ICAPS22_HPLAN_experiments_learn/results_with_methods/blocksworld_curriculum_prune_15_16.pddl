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
      ?auto_444077 - BLOCK
    )
    :vars
    (
      ?auto_444078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444077 ?auto_444078 ) ( CLEAR ?auto_444077 ) ( HAND-EMPTY ) ( not ( = ?auto_444077 ?auto_444078 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_444077 ?auto_444078 )
      ( !PUTDOWN ?auto_444077 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_444084 - BLOCK
      ?auto_444085 - BLOCK
    )
    :vars
    (
      ?auto_444086 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_444084 ) ( ON ?auto_444085 ?auto_444086 ) ( CLEAR ?auto_444085 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_444084 ) ( not ( = ?auto_444084 ?auto_444085 ) ) ( not ( = ?auto_444084 ?auto_444086 ) ) ( not ( = ?auto_444085 ?auto_444086 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_444085 ?auto_444086 )
      ( !STACK ?auto_444085 ?auto_444084 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_444094 - BLOCK
      ?auto_444095 - BLOCK
    )
    :vars
    (
      ?auto_444096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444095 ?auto_444096 ) ( not ( = ?auto_444094 ?auto_444095 ) ) ( not ( = ?auto_444094 ?auto_444096 ) ) ( not ( = ?auto_444095 ?auto_444096 ) ) ( ON ?auto_444094 ?auto_444095 ) ( CLEAR ?auto_444094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_444094 )
      ( MAKE-2PILE ?auto_444094 ?auto_444095 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_444105 - BLOCK
      ?auto_444106 - BLOCK
      ?auto_444107 - BLOCK
    )
    :vars
    (
      ?auto_444108 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_444106 ) ( ON ?auto_444107 ?auto_444108 ) ( CLEAR ?auto_444107 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_444105 ) ( ON ?auto_444106 ?auto_444105 ) ( not ( = ?auto_444105 ?auto_444106 ) ) ( not ( = ?auto_444105 ?auto_444107 ) ) ( not ( = ?auto_444105 ?auto_444108 ) ) ( not ( = ?auto_444106 ?auto_444107 ) ) ( not ( = ?auto_444106 ?auto_444108 ) ) ( not ( = ?auto_444107 ?auto_444108 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_444107 ?auto_444108 )
      ( !STACK ?auto_444107 ?auto_444106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_444119 - BLOCK
      ?auto_444120 - BLOCK
      ?auto_444121 - BLOCK
    )
    :vars
    (
      ?auto_444122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444121 ?auto_444122 ) ( ON-TABLE ?auto_444119 ) ( not ( = ?auto_444119 ?auto_444120 ) ) ( not ( = ?auto_444119 ?auto_444121 ) ) ( not ( = ?auto_444119 ?auto_444122 ) ) ( not ( = ?auto_444120 ?auto_444121 ) ) ( not ( = ?auto_444120 ?auto_444122 ) ) ( not ( = ?auto_444121 ?auto_444122 ) ) ( CLEAR ?auto_444119 ) ( ON ?auto_444120 ?auto_444121 ) ( CLEAR ?auto_444120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_444119 ?auto_444120 )
      ( MAKE-3PILE ?auto_444119 ?auto_444120 ?auto_444121 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_444133 - BLOCK
      ?auto_444134 - BLOCK
      ?auto_444135 - BLOCK
    )
    :vars
    (
      ?auto_444136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444135 ?auto_444136 ) ( not ( = ?auto_444133 ?auto_444134 ) ) ( not ( = ?auto_444133 ?auto_444135 ) ) ( not ( = ?auto_444133 ?auto_444136 ) ) ( not ( = ?auto_444134 ?auto_444135 ) ) ( not ( = ?auto_444134 ?auto_444136 ) ) ( not ( = ?auto_444135 ?auto_444136 ) ) ( ON ?auto_444134 ?auto_444135 ) ( ON ?auto_444133 ?auto_444134 ) ( CLEAR ?auto_444133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_444133 )
      ( MAKE-3PILE ?auto_444133 ?auto_444134 ?auto_444135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_444148 - BLOCK
      ?auto_444149 - BLOCK
      ?auto_444150 - BLOCK
      ?auto_444151 - BLOCK
    )
    :vars
    (
      ?auto_444152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_444150 ) ( ON ?auto_444151 ?auto_444152 ) ( CLEAR ?auto_444151 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_444148 ) ( ON ?auto_444149 ?auto_444148 ) ( ON ?auto_444150 ?auto_444149 ) ( not ( = ?auto_444148 ?auto_444149 ) ) ( not ( = ?auto_444148 ?auto_444150 ) ) ( not ( = ?auto_444148 ?auto_444151 ) ) ( not ( = ?auto_444148 ?auto_444152 ) ) ( not ( = ?auto_444149 ?auto_444150 ) ) ( not ( = ?auto_444149 ?auto_444151 ) ) ( not ( = ?auto_444149 ?auto_444152 ) ) ( not ( = ?auto_444150 ?auto_444151 ) ) ( not ( = ?auto_444150 ?auto_444152 ) ) ( not ( = ?auto_444151 ?auto_444152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_444151 ?auto_444152 )
      ( !STACK ?auto_444151 ?auto_444150 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_444166 - BLOCK
      ?auto_444167 - BLOCK
      ?auto_444168 - BLOCK
      ?auto_444169 - BLOCK
    )
    :vars
    (
      ?auto_444170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444169 ?auto_444170 ) ( ON-TABLE ?auto_444166 ) ( ON ?auto_444167 ?auto_444166 ) ( not ( = ?auto_444166 ?auto_444167 ) ) ( not ( = ?auto_444166 ?auto_444168 ) ) ( not ( = ?auto_444166 ?auto_444169 ) ) ( not ( = ?auto_444166 ?auto_444170 ) ) ( not ( = ?auto_444167 ?auto_444168 ) ) ( not ( = ?auto_444167 ?auto_444169 ) ) ( not ( = ?auto_444167 ?auto_444170 ) ) ( not ( = ?auto_444168 ?auto_444169 ) ) ( not ( = ?auto_444168 ?auto_444170 ) ) ( not ( = ?auto_444169 ?auto_444170 ) ) ( CLEAR ?auto_444167 ) ( ON ?auto_444168 ?auto_444169 ) ( CLEAR ?auto_444168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_444166 ?auto_444167 ?auto_444168 )
      ( MAKE-4PILE ?auto_444166 ?auto_444167 ?auto_444168 ?auto_444169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_444184 - BLOCK
      ?auto_444185 - BLOCK
      ?auto_444186 - BLOCK
      ?auto_444187 - BLOCK
    )
    :vars
    (
      ?auto_444188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444187 ?auto_444188 ) ( ON-TABLE ?auto_444184 ) ( not ( = ?auto_444184 ?auto_444185 ) ) ( not ( = ?auto_444184 ?auto_444186 ) ) ( not ( = ?auto_444184 ?auto_444187 ) ) ( not ( = ?auto_444184 ?auto_444188 ) ) ( not ( = ?auto_444185 ?auto_444186 ) ) ( not ( = ?auto_444185 ?auto_444187 ) ) ( not ( = ?auto_444185 ?auto_444188 ) ) ( not ( = ?auto_444186 ?auto_444187 ) ) ( not ( = ?auto_444186 ?auto_444188 ) ) ( not ( = ?auto_444187 ?auto_444188 ) ) ( ON ?auto_444186 ?auto_444187 ) ( CLEAR ?auto_444184 ) ( ON ?auto_444185 ?auto_444186 ) ( CLEAR ?auto_444185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_444184 ?auto_444185 )
      ( MAKE-4PILE ?auto_444184 ?auto_444185 ?auto_444186 ?auto_444187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_444202 - BLOCK
      ?auto_444203 - BLOCK
      ?auto_444204 - BLOCK
      ?auto_444205 - BLOCK
    )
    :vars
    (
      ?auto_444206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444205 ?auto_444206 ) ( not ( = ?auto_444202 ?auto_444203 ) ) ( not ( = ?auto_444202 ?auto_444204 ) ) ( not ( = ?auto_444202 ?auto_444205 ) ) ( not ( = ?auto_444202 ?auto_444206 ) ) ( not ( = ?auto_444203 ?auto_444204 ) ) ( not ( = ?auto_444203 ?auto_444205 ) ) ( not ( = ?auto_444203 ?auto_444206 ) ) ( not ( = ?auto_444204 ?auto_444205 ) ) ( not ( = ?auto_444204 ?auto_444206 ) ) ( not ( = ?auto_444205 ?auto_444206 ) ) ( ON ?auto_444204 ?auto_444205 ) ( ON ?auto_444203 ?auto_444204 ) ( ON ?auto_444202 ?auto_444203 ) ( CLEAR ?auto_444202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_444202 )
      ( MAKE-4PILE ?auto_444202 ?auto_444203 ?auto_444204 ?auto_444205 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_444221 - BLOCK
      ?auto_444222 - BLOCK
      ?auto_444223 - BLOCK
      ?auto_444224 - BLOCK
      ?auto_444225 - BLOCK
    )
    :vars
    (
      ?auto_444226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_444224 ) ( ON ?auto_444225 ?auto_444226 ) ( CLEAR ?auto_444225 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_444221 ) ( ON ?auto_444222 ?auto_444221 ) ( ON ?auto_444223 ?auto_444222 ) ( ON ?auto_444224 ?auto_444223 ) ( not ( = ?auto_444221 ?auto_444222 ) ) ( not ( = ?auto_444221 ?auto_444223 ) ) ( not ( = ?auto_444221 ?auto_444224 ) ) ( not ( = ?auto_444221 ?auto_444225 ) ) ( not ( = ?auto_444221 ?auto_444226 ) ) ( not ( = ?auto_444222 ?auto_444223 ) ) ( not ( = ?auto_444222 ?auto_444224 ) ) ( not ( = ?auto_444222 ?auto_444225 ) ) ( not ( = ?auto_444222 ?auto_444226 ) ) ( not ( = ?auto_444223 ?auto_444224 ) ) ( not ( = ?auto_444223 ?auto_444225 ) ) ( not ( = ?auto_444223 ?auto_444226 ) ) ( not ( = ?auto_444224 ?auto_444225 ) ) ( not ( = ?auto_444224 ?auto_444226 ) ) ( not ( = ?auto_444225 ?auto_444226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_444225 ?auto_444226 )
      ( !STACK ?auto_444225 ?auto_444224 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_444243 - BLOCK
      ?auto_444244 - BLOCK
      ?auto_444245 - BLOCK
      ?auto_444246 - BLOCK
      ?auto_444247 - BLOCK
    )
    :vars
    (
      ?auto_444248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444247 ?auto_444248 ) ( ON-TABLE ?auto_444243 ) ( ON ?auto_444244 ?auto_444243 ) ( ON ?auto_444245 ?auto_444244 ) ( not ( = ?auto_444243 ?auto_444244 ) ) ( not ( = ?auto_444243 ?auto_444245 ) ) ( not ( = ?auto_444243 ?auto_444246 ) ) ( not ( = ?auto_444243 ?auto_444247 ) ) ( not ( = ?auto_444243 ?auto_444248 ) ) ( not ( = ?auto_444244 ?auto_444245 ) ) ( not ( = ?auto_444244 ?auto_444246 ) ) ( not ( = ?auto_444244 ?auto_444247 ) ) ( not ( = ?auto_444244 ?auto_444248 ) ) ( not ( = ?auto_444245 ?auto_444246 ) ) ( not ( = ?auto_444245 ?auto_444247 ) ) ( not ( = ?auto_444245 ?auto_444248 ) ) ( not ( = ?auto_444246 ?auto_444247 ) ) ( not ( = ?auto_444246 ?auto_444248 ) ) ( not ( = ?auto_444247 ?auto_444248 ) ) ( CLEAR ?auto_444245 ) ( ON ?auto_444246 ?auto_444247 ) ( CLEAR ?auto_444246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_444243 ?auto_444244 ?auto_444245 ?auto_444246 )
      ( MAKE-5PILE ?auto_444243 ?auto_444244 ?auto_444245 ?auto_444246 ?auto_444247 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_444265 - BLOCK
      ?auto_444266 - BLOCK
      ?auto_444267 - BLOCK
      ?auto_444268 - BLOCK
      ?auto_444269 - BLOCK
    )
    :vars
    (
      ?auto_444270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444269 ?auto_444270 ) ( ON-TABLE ?auto_444265 ) ( ON ?auto_444266 ?auto_444265 ) ( not ( = ?auto_444265 ?auto_444266 ) ) ( not ( = ?auto_444265 ?auto_444267 ) ) ( not ( = ?auto_444265 ?auto_444268 ) ) ( not ( = ?auto_444265 ?auto_444269 ) ) ( not ( = ?auto_444265 ?auto_444270 ) ) ( not ( = ?auto_444266 ?auto_444267 ) ) ( not ( = ?auto_444266 ?auto_444268 ) ) ( not ( = ?auto_444266 ?auto_444269 ) ) ( not ( = ?auto_444266 ?auto_444270 ) ) ( not ( = ?auto_444267 ?auto_444268 ) ) ( not ( = ?auto_444267 ?auto_444269 ) ) ( not ( = ?auto_444267 ?auto_444270 ) ) ( not ( = ?auto_444268 ?auto_444269 ) ) ( not ( = ?auto_444268 ?auto_444270 ) ) ( not ( = ?auto_444269 ?auto_444270 ) ) ( ON ?auto_444268 ?auto_444269 ) ( CLEAR ?auto_444266 ) ( ON ?auto_444267 ?auto_444268 ) ( CLEAR ?auto_444267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_444265 ?auto_444266 ?auto_444267 )
      ( MAKE-5PILE ?auto_444265 ?auto_444266 ?auto_444267 ?auto_444268 ?auto_444269 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_444287 - BLOCK
      ?auto_444288 - BLOCK
      ?auto_444289 - BLOCK
      ?auto_444290 - BLOCK
      ?auto_444291 - BLOCK
    )
    :vars
    (
      ?auto_444292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444291 ?auto_444292 ) ( ON-TABLE ?auto_444287 ) ( not ( = ?auto_444287 ?auto_444288 ) ) ( not ( = ?auto_444287 ?auto_444289 ) ) ( not ( = ?auto_444287 ?auto_444290 ) ) ( not ( = ?auto_444287 ?auto_444291 ) ) ( not ( = ?auto_444287 ?auto_444292 ) ) ( not ( = ?auto_444288 ?auto_444289 ) ) ( not ( = ?auto_444288 ?auto_444290 ) ) ( not ( = ?auto_444288 ?auto_444291 ) ) ( not ( = ?auto_444288 ?auto_444292 ) ) ( not ( = ?auto_444289 ?auto_444290 ) ) ( not ( = ?auto_444289 ?auto_444291 ) ) ( not ( = ?auto_444289 ?auto_444292 ) ) ( not ( = ?auto_444290 ?auto_444291 ) ) ( not ( = ?auto_444290 ?auto_444292 ) ) ( not ( = ?auto_444291 ?auto_444292 ) ) ( ON ?auto_444290 ?auto_444291 ) ( ON ?auto_444289 ?auto_444290 ) ( CLEAR ?auto_444287 ) ( ON ?auto_444288 ?auto_444289 ) ( CLEAR ?auto_444288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_444287 ?auto_444288 )
      ( MAKE-5PILE ?auto_444287 ?auto_444288 ?auto_444289 ?auto_444290 ?auto_444291 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_444309 - BLOCK
      ?auto_444310 - BLOCK
      ?auto_444311 - BLOCK
      ?auto_444312 - BLOCK
      ?auto_444313 - BLOCK
    )
    :vars
    (
      ?auto_444314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444313 ?auto_444314 ) ( not ( = ?auto_444309 ?auto_444310 ) ) ( not ( = ?auto_444309 ?auto_444311 ) ) ( not ( = ?auto_444309 ?auto_444312 ) ) ( not ( = ?auto_444309 ?auto_444313 ) ) ( not ( = ?auto_444309 ?auto_444314 ) ) ( not ( = ?auto_444310 ?auto_444311 ) ) ( not ( = ?auto_444310 ?auto_444312 ) ) ( not ( = ?auto_444310 ?auto_444313 ) ) ( not ( = ?auto_444310 ?auto_444314 ) ) ( not ( = ?auto_444311 ?auto_444312 ) ) ( not ( = ?auto_444311 ?auto_444313 ) ) ( not ( = ?auto_444311 ?auto_444314 ) ) ( not ( = ?auto_444312 ?auto_444313 ) ) ( not ( = ?auto_444312 ?auto_444314 ) ) ( not ( = ?auto_444313 ?auto_444314 ) ) ( ON ?auto_444312 ?auto_444313 ) ( ON ?auto_444311 ?auto_444312 ) ( ON ?auto_444310 ?auto_444311 ) ( ON ?auto_444309 ?auto_444310 ) ( CLEAR ?auto_444309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_444309 )
      ( MAKE-5PILE ?auto_444309 ?auto_444310 ?auto_444311 ?auto_444312 ?auto_444313 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_444332 - BLOCK
      ?auto_444333 - BLOCK
      ?auto_444334 - BLOCK
      ?auto_444335 - BLOCK
      ?auto_444336 - BLOCK
      ?auto_444337 - BLOCK
    )
    :vars
    (
      ?auto_444338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_444336 ) ( ON ?auto_444337 ?auto_444338 ) ( CLEAR ?auto_444337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_444332 ) ( ON ?auto_444333 ?auto_444332 ) ( ON ?auto_444334 ?auto_444333 ) ( ON ?auto_444335 ?auto_444334 ) ( ON ?auto_444336 ?auto_444335 ) ( not ( = ?auto_444332 ?auto_444333 ) ) ( not ( = ?auto_444332 ?auto_444334 ) ) ( not ( = ?auto_444332 ?auto_444335 ) ) ( not ( = ?auto_444332 ?auto_444336 ) ) ( not ( = ?auto_444332 ?auto_444337 ) ) ( not ( = ?auto_444332 ?auto_444338 ) ) ( not ( = ?auto_444333 ?auto_444334 ) ) ( not ( = ?auto_444333 ?auto_444335 ) ) ( not ( = ?auto_444333 ?auto_444336 ) ) ( not ( = ?auto_444333 ?auto_444337 ) ) ( not ( = ?auto_444333 ?auto_444338 ) ) ( not ( = ?auto_444334 ?auto_444335 ) ) ( not ( = ?auto_444334 ?auto_444336 ) ) ( not ( = ?auto_444334 ?auto_444337 ) ) ( not ( = ?auto_444334 ?auto_444338 ) ) ( not ( = ?auto_444335 ?auto_444336 ) ) ( not ( = ?auto_444335 ?auto_444337 ) ) ( not ( = ?auto_444335 ?auto_444338 ) ) ( not ( = ?auto_444336 ?auto_444337 ) ) ( not ( = ?auto_444336 ?auto_444338 ) ) ( not ( = ?auto_444337 ?auto_444338 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_444337 ?auto_444338 )
      ( !STACK ?auto_444337 ?auto_444336 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_444358 - BLOCK
      ?auto_444359 - BLOCK
      ?auto_444360 - BLOCK
      ?auto_444361 - BLOCK
      ?auto_444362 - BLOCK
      ?auto_444363 - BLOCK
    )
    :vars
    (
      ?auto_444364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444363 ?auto_444364 ) ( ON-TABLE ?auto_444358 ) ( ON ?auto_444359 ?auto_444358 ) ( ON ?auto_444360 ?auto_444359 ) ( ON ?auto_444361 ?auto_444360 ) ( not ( = ?auto_444358 ?auto_444359 ) ) ( not ( = ?auto_444358 ?auto_444360 ) ) ( not ( = ?auto_444358 ?auto_444361 ) ) ( not ( = ?auto_444358 ?auto_444362 ) ) ( not ( = ?auto_444358 ?auto_444363 ) ) ( not ( = ?auto_444358 ?auto_444364 ) ) ( not ( = ?auto_444359 ?auto_444360 ) ) ( not ( = ?auto_444359 ?auto_444361 ) ) ( not ( = ?auto_444359 ?auto_444362 ) ) ( not ( = ?auto_444359 ?auto_444363 ) ) ( not ( = ?auto_444359 ?auto_444364 ) ) ( not ( = ?auto_444360 ?auto_444361 ) ) ( not ( = ?auto_444360 ?auto_444362 ) ) ( not ( = ?auto_444360 ?auto_444363 ) ) ( not ( = ?auto_444360 ?auto_444364 ) ) ( not ( = ?auto_444361 ?auto_444362 ) ) ( not ( = ?auto_444361 ?auto_444363 ) ) ( not ( = ?auto_444361 ?auto_444364 ) ) ( not ( = ?auto_444362 ?auto_444363 ) ) ( not ( = ?auto_444362 ?auto_444364 ) ) ( not ( = ?auto_444363 ?auto_444364 ) ) ( CLEAR ?auto_444361 ) ( ON ?auto_444362 ?auto_444363 ) ( CLEAR ?auto_444362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_444358 ?auto_444359 ?auto_444360 ?auto_444361 ?auto_444362 )
      ( MAKE-6PILE ?auto_444358 ?auto_444359 ?auto_444360 ?auto_444361 ?auto_444362 ?auto_444363 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_444384 - BLOCK
      ?auto_444385 - BLOCK
      ?auto_444386 - BLOCK
      ?auto_444387 - BLOCK
      ?auto_444388 - BLOCK
      ?auto_444389 - BLOCK
    )
    :vars
    (
      ?auto_444390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444389 ?auto_444390 ) ( ON-TABLE ?auto_444384 ) ( ON ?auto_444385 ?auto_444384 ) ( ON ?auto_444386 ?auto_444385 ) ( not ( = ?auto_444384 ?auto_444385 ) ) ( not ( = ?auto_444384 ?auto_444386 ) ) ( not ( = ?auto_444384 ?auto_444387 ) ) ( not ( = ?auto_444384 ?auto_444388 ) ) ( not ( = ?auto_444384 ?auto_444389 ) ) ( not ( = ?auto_444384 ?auto_444390 ) ) ( not ( = ?auto_444385 ?auto_444386 ) ) ( not ( = ?auto_444385 ?auto_444387 ) ) ( not ( = ?auto_444385 ?auto_444388 ) ) ( not ( = ?auto_444385 ?auto_444389 ) ) ( not ( = ?auto_444385 ?auto_444390 ) ) ( not ( = ?auto_444386 ?auto_444387 ) ) ( not ( = ?auto_444386 ?auto_444388 ) ) ( not ( = ?auto_444386 ?auto_444389 ) ) ( not ( = ?auto_444386 ?auto_444390 ) ) ( not ( = ?auto_444387 ?auto_444388 ) ) ( not ( = ?auto_444387 ?auto_444389 ) ) ( not ( = ?auto_444387 ?auto_444390 ) ) ( not ( = ?auto_444388 ?auto_444389 ) ) ( not ( = ?auto_444388 ?auto_444390 ) ) ( not ( = ?auto_444389 ?auto_444390 ) ) ( ON ?auto_444388 ?auto_444389 ) ( CLEAR ?auto_444386 ) ( ON ?auto_444387 ?auto_444388 ) ( CLEAR ?auto_444387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_444384 ?auto_444385 ?auto_444386 ?auto_444387 )
      ( MAKE-6PILE ?auto_444384 ?auto_444385 ?auto_444386 ?auto_444387 ?auto_444388 ?auto_444389 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_444410 - BLOCK
      ?auto_444411 - BLOCK
      ?auto_444412 - BLOCK
      ?auto_444413 - BLOCK
      ?auto_444414 - BLOCK
      ?auto_444415 - BLOCK
    )
    :vars
    (
      ?auto_444416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444415 ?auto_444416 ) ( ON-TABLE ?auto_444410 ) ( ON ?auto_444411 ?auto_444410 ) ( not ( = ?auto_444410 ?auto_444411 ) ) ( not ( = ?auto_444410 ?auto_444412 ) ) ( not ( = ?auto_444410 ?auto_444413 ) ) ( not ( = ?auto_444410 ?auto_444414 ) ) ( not ( = ?auto_444410 ?auto_444415 ) ) ( not ( = ?auto_444410 ?auto_444416 ) ) ( not ( = ?auto_444411 ?auto_444412 ) ) ( not ( = ?auto_444411 ?auto_444413 ) ) ( not ( = ?auto_444411 ?auto_444414 ) ) ( not ( = ?auto_444411 ?auto_444415 ) ) ( not ( = ?auto_444411 ?auto_444416 ) ) ( not ( = ?auto_444412 ?auto_444413 ) ) ( not ( = ?auto_444412 ?auto_444414 ) ) ( not ( = ?auto_444412 ?auto_444415 ) ) ( not ( = ?auto_444412 ?auto_444416 ) ) ( not ( = ?auto_444413 ?auto_444414 ) ) ( not ( = ?auto_444413 ?auto_444415 ) ) ( not ( = ?auto_444413 ?auto_444416 ) ) ( not ( = ?auto_444414 ?auto_444415 ) ) ( not ( = ?auto_444414 ?auto_444416 ) ) ( not ( = ?auto_444415 ?auto_444416 ) ) ( ON ?auto_444414 ?auto_444415 ) ( ON ?auto_444413 ?auto_444414 ) ( CLEAR ?auto_444411 ) ( ON ?auto_444412 ?auto_444413 ) ( CLEAR ?auto_444412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_444410 ?auto_444411 ?auto_444412 )
      ( MAKE-6PILE ?auto_444410 ?auto_444411 ?auto_444412 ?auto_444413 ?auto_444414 ?auto_444415 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_444436 - BLOCK
      ?auto_444437 - BLOCK
      ?auto_444438 - BLOCK
      ?auto_444439 - BLOCK
      ?auto_444440 - BLOCK
      ?auto_444441 - BLOCK
    )
    :vars
    (
      ?auto_444442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444441 ?auto_444442 ) ( ON-TABLE ?auto_444436 ) ( not ( = ?auto_444436 ?auto_444437 ) ) ( not ( = ?auto_444436 ?auto_444438 ) ) ( not ( = ?auto_444436 ?auto_444439 ) ) ( not ( = ?auto_444436 ?auto_444440 ) ) ( not ( = ?auto_444436 ?auto_444441 ) ) ( not ( = ?auto_444436 ?auto_444442 ) ) ( not ( = ?auto_444437 ?auto_444438 ) ) ( not ( = ?auto_444437 ?auto_444439 ) ) ( not ( = ?auto_444437 ?auto_444440 ) ) ( not ( = ?auto_444437 ?auto_444441 ) ) ( not ( = ?auto_444437 ?auto_444442 ) ) ( not ( = ?auto_444438 ?auto_444439 ) ) ( not ( = ?auto_444438 ?auto_444440 ) ) ( not ( = ?auto_444438 ?auto_444441 ) ) ( not ( = ?auto_444438 ?auto_444442 ) ) ( not ( = ?auto_444439 ?auto_444440 ) ) ( not ( = ?auto_444439 ?auto_444441 ) ) ( not ( = ?auto_444439 ?auto_444442 ) ) ( not ( = ?auto_444440 ?auto_444441 ) ) ( not ( = ?auto_444440 ?auto_444442 ) ) ( not ( = ?auto_444441 ?auto_444442 ) ) ( ON ?auto_444440 ?auto_444441 ) ( ON ?auto_444439 ?auto_444440 ) ( ON ?auto_444438 ?auto_444439 ) ( CLEAR ?auto_444436 ) ( ON ?auto_444437 ?auto_444438 ) ( CLEAR ?auto_444437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_444436 ?auto_444437 )
      ( MAKE-6PILE ?auto_444436 ?auto_444437 ?auto_444438 ?auto_444439 ?auto_444440 ?auto_444441 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_444462 - BLOCK
      ?auto_444463 - BLOCK
      ?auto_444464 - BLOCK
      ?auto_444465 - BLOCK
      ?auto_444466 - BLOCK
      ?auto_444467 - BLOCK
    )
    :vars
    (
      ?auto_444468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444467 ?auto_444468 ) ( not ( = ?auto_444462 ?auto_444463 ) ) ( not ( = ?auto_444462 ?auto_444464 ) ) ( not ( = ?auto_444462 ?auto_444465 ) ) ( not ( = ?auto_444462 ?auto_444466 ) ) ( not ( = ?auto_444462 ?auto_444467 ) ) ( not ( = ?auto_444462 ?auto_444468 ) ) ( not ( = ?auto_444463 ?auto_444464 ) ) ( not ( = ?auto_444463 ?auto_444465 ) ) ( not ( = ?auto_444463 ?auto_444466 ) ) ( not ( = ?auto_444463 ?auto_444467 ) ) ( not ( = ?auto_444463 ?auto_444468 ) ) ( not ( = ?auto_444464 ?auto_444465 ) ) ( not ( = ?auto_444464 ?auto_444466 ) ) ( not ( = ?auto_444464 ?auto_444467 ) ) ( not ( = ?auto_444464 ?auto_444468 ) ) ( not ( = ?auto_444465 ?auto_444466 ) ) ( not ( = ?auto_444465 ?auto_444467 ) ) ( not ( = ?auto_444465 ?auto_444468 ) ) ( not ( = ?auto_444466 ?auto_444467 ) ) ( not ( = ?auto_444466 ?auto_444468 ) ) ( not ( = ?auto_444467 ?auto_444468 ) ) ( ON ?auto_444466 ?auto_444467 ) ( ON ?auto_444465 ?auto_444466 ) ( ON ?auto_444464 ?auto_444465 ) ( ON ?auto_444463 ?auto_444464 ) ( ON ?auto_444462 ?auto_444463 ) ( CLEAR ?auto_444462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_444462 )
      ( MAKE-6PILE ?auto_444462 ?auto_444463 ?auto_444464 ?auto_444465 ?auto_444466 ?auto_444467 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_444489 - BLOCK
      ?auto_444490 - BLOCK
      ?auto_444491 - BLOCK
      ?auto_444492 - BLOCK
      ?auto_444493 - BLOCK
      ?auto_444494 - BLOCK
      ?auto_444495 - BLOCK
    )
    :vars
    (
      ?auto_444496 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_444494 ) ( ON ?auto_444495 ?auto_444496 ) ( CLEAR ?auto_444495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_444489 ) ( ON ?auto_444490 ?auto_444489 ) ( ON ?auto_444491 ?auto_444490 ) ( ON ?auto_444492 ?auto_444491 ) ( ON ?auto_444493 ?auto_444492 ) ( ON ?auto_444494 ?auto_444493 ) ( not ( = ?auto_444489 ?auto_444490 ) ) ( not ( = ?auto_444489 ?auto_444491 ) ) ( not ( = ?auto_444489 ?auto_444492 ) ) ( not ( = ?auto_444489 ?auto_444493 ) ) ( not ( = ?auto_444489 ?auto_444494 ) ) ( not ( = ?auto_444489 ?auto_444495 ) ) ( not ( = ?auto_444489 ?auto_444496 ) ) ( not ( = ?auto_444490 ?auto_444491 ) ) ( not ( = ?auto_444490 ?auto_444492 ) ) ( not ( = ?auto_444490 ?auto_444493 ) ) ( not ( = ?auto_444490 ?auto_444494 ) ) ( not ( = ?auto_444490 ?auto_444495 ) ) ( not ( = ?auto_444490 ?auto_444496 ) ) ( not ( = ?auto_444491 ?auto_444492 ) ) ( not ( = ?auto_444491 ?auto_444493 ) ) ( not ( = ?auto_444491 ?auto_444494 ) ) ( not ( = ?auto_444491 ?auto_444495 ) ) ( not ( = ?auto_444491 ?auto_444496 ) ) ( not ( = ?auto_444492 ?auto_444493 ) ) ( not ( = ?auto_444492 ?auto_444494 ) ) ( not ( = ?auto_444492 ?auto_444495 ) ) ( not ( = ?auto_444492 ?auto_444496 ) ) ( not ( = ?auto_444493 ?auto_444494 ) ) ( not ( = ?auto_444493 ?auto_444495 ) ) ( not ( = ?auto_444493 ?auto_444496 ) ) ( not ( = ?auto_444494 ?auto_444495 ) ) ( not ( = ?auto_444494 ?auto_444496 ) ) ( not ( = ?auto_444495 ?auto_444496 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_444495 ?auto_444496 )
      ( !STACK ?auto_444495 ?auto_444494 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_444519 - BLOCK
      ?auto_444520 - BLOCK
      ?auto_444521 - BLOCK
      ?auto_444522 - BLOCK
      ?auto_444523 - BLOCK
      ?auto_444524 - BLOCK
      ?auto_444525 - BLOCK
    )
    :vars
    (
      ?auto_444526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444525 ?auto_444526 ) ( ON-TABLE ?auto_444519 ) ( ON ?auto_444520 ?auto_444519 ) ( ON ?auto_444521 ?auto_444520 ) ( ON ?auto_444522 ?auto_444521 ) ( ON ?auto_444523 ?auto_444522 ) ( not ( = ?auto_444519 ?auto_444520 ) ) ( not ( = ?auto_444519 ?auto_444521 ) ) ( not ( = ?auto_444519 ?auto_444522 ) ) ( not ( = ?auto_444519 ?auto_444523 ) ) ( not ( = ?auto_444519 ?auto_444524 ) ) ( not ( = ?auto_444519 ?auto_444525 ) ) ( not ( = ?auto_444519 ?auto_444526 ) ) ( not ( = ?auto_444520 ?auto_444521 ) ) ( not ( = ?auto_444520 ?auto_444522 ) ) ( not ( = ?auto_444520 ?auto_444523 ) ) ( not ( = ?auto_444520 ?auto_444524 ) ) ( not ( = ?auto_444520 ?auto_444525 ) ) ( not ( = ?auto_444520 ?auto_444526 ) ) ( not ( = ?auto_444521 ?auto_444522 ) ) ( not ( = ?auto_444521 ?auto_444523 ) ) ( not ( = ?auto_444521 ?auto_444524 ) ) ( not ( = ?auto_444521 ?auto_444525 ) ) ( not ( = ?auto_444521 ?auto_444526 ) ) ( not ( = ?auto_444522 ?auto_444523 ) ) ( not ( = ?auto_444522 ?auto_444524 ) ) ( not ( = ?auto_444522 ?auto_444525 ) ) ( not ( = ?auto_444522 ?auto_444526 ) ) ( not ( = ?auto_444523 ?auto_444524 ) ) ( not ( = ?auto_444523 ?auto_444525 ) ) ( not ( = ?auto_444523 ?auto_444526 ) ) ( not ( = ?auto_444524 ?auto_444525 ) ) ( not ( = ?auto_444524 ?auto_444526 ) ) ( not ( = ?auto_444525 ?auto_444526 ) ) ( CLEAR ?auto_444523 ) ( ON ?auto_444524 ?auto_444525 ) ( CLEAR ?auto_444524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_444519 ?auto_444520 ?auto_444521 ?auto_444522 ?auto_444523 ?auto_444524 )
      ( MAKE-7PILE ?auto_444519 ?auto_444520 ?auto_444521 ?auto_444522 ?auto_444523 ?auto_444524 ?auto_444525 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_444549 - BLOCK
      ?auto_444550 - BLOCK
      ?auto_444551 - BLOCK
      ?auto_444552 - BLOCK
      ?auto_444553 - BLOCK
      ?auto_444554 - BLOCK
      ?auto_444555 - BLOCK
    )
    :vars
    (
      ?auto_444556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444555 ?auto_444556 ) ( ON-TABLE ?auto_444549 ) ( ON ?auto_444550 ?auto_444549 ) ( ON ?auto_444551 ?auto_444550 ) ( ON ?auto_444552 ?auto_444551 ) ( not ( = ?auto_444549 ?auto_444550 ) ) ( not ( = ?auto_444549 ?auto_444551 ) ) ( not ( = ?auto_444549 ?auto_444552 ) ) ( not ( = ?auto_444549 ?auto_444553 ) ) ( not ( = ?auto_444549 ?auto_444554 ) ) ( not ( = ?auto_444549 ?auto_444555 ) ) ( not ( = ?auto_444549 ?auto_444556 ) ) ( not ( = ?auto_444550 ?auto_444551 ) ) ( not ( = ?auto_444550 ?auto_444552 ) ) ( not ( = ?auto_444550 ?auto_444553 ) ) ( not ( = ?auto_444550 ?auto_444554 ) ) ( not ( = ?auto_444550 ?auto_444555 ) ) ( not ( = ?auto_444550 ?auto_444556 ) ) ( not ( = ?auto_444551 ?auto_444552 ) ) ( not ( = ?auto_444551 ?auto_444553 ) ) ( not ( = ?auto_444551 ?auto_444554 ) ) ( not ( = ?auto_444551 ?auto_444555 ) ) ( not ( = ?auto_444551 ?auto_444556 ) ) ( not ( = ?auto_444552 ?auto_444553 ) ) ( not ( = ?auto_444552 ?auto_444554 ) ) ( not ( = ?auto_444552 ?auto_444555 ) ) ( not ( = ?auto_444552 ?auto_444556 ) ) ( not ( = ?auto_444553 ?auto_444554 ) ) ( not ( = ?auto_444553 ?auto_444555 ) ) ( not ( = ?auto_444553 ?auto_444556 ) ) ( not ( = ?auto_444554 ?auto_444555 ) ) ( not ( = ?auto_444554 ?auto_444556 ) ) ( not ( = ?auto_444555 ?auto_444556 ) ) ( ON ?auto_444554 ?auto_444555 ) ( CLEAR ?auto_444552 ) ( ON ?auto_444553 ?auto_444554 ) ( CLEAR ?auto_444553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_444549 ?auto_444550 ?auto_444551 ?auto_444552 ?auto_444553 )
      ( MAKE-7PILE ?auto_444549 ?auto_444550 ?auto_444551 ?auto_444552 ?auto_444553 ?auto_444554 ?auto_444555 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_444579 - BLOCK
      ?auto_444580 - BLOCK
      ?auto_444581 - BLOCK
      ?auto_444582 - BLOCK
      ?auto_444583 - BLOCK
      ?auto_444584 - BLOCK
      ?auto_444585 - BLOCK
    )
    :vars
    (
      ?auto_444586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444585 ?auto_444586 ) ( ON-TABLE ?auto_444579 ) ( ON ?auto_444580 ?auto_444579 ) ( ON ?auto_444581 ?auto_444580 ) ( not ( = ?auto_444579 ?auto_444580 ) ) ( not ( = ?auto_444579 ?auto_444581 ) ) ( not ( = ?auto_444579 ?auto_444582 ) ) ( not ( = ?auto_444579 ?auto_444583 ) ) ( not ( = ?auto_444579 ?auto_444584 ) ) ( not ( = ?auto_444579 ?auto_444585 ) ) ( not ( = ?auto_444579 ?auto_444586 ) ) ( not ( = ?auto_444580 ?auto_444581 ) ) ( not ( = ?auto_444580 ?auto_444582 ) ) ( not ( = ?auto_444580 ?auto_444583 ) ) ( not ( = ?auto_444580 ?auto_444584 ) ) ( not ( = ?auto_444580 ?auto_444585 ) ) ( not ( = ?auto_444580 ?auto_444586 ) ) ( not ( = ?auto_444581 ?auto_444582 ) ) ( not ( = ?auto_444581 ?auto_444583 ) ) ( not ( = ?auto_444581 ?auto_444584 ) ) ( not ( = ?auto_444581 ?auto_444585 ) ) ( not ( = ?auto_444581 ?auto_444586 ) ) ( not ( = ?auto_444582 ?auto_444583 ) ) ( not ( = ?auto_444582 ?auto_444584 ) ) ( not ( = ?auto_444582 ?auto_444585 ) ) ( not ( = ?auto_444582 ?auto_444586 ) ) ( not ( = ?auto_444583 ?auto_444584 ) ) ( not ( = ?auto_444583 ?auto_444585 ) ) ( not ( = ?auto_444583 ?auto_444586 ) ) ( not ( = ?auto_444584 ?auto_444585 ) ) ( not ( = ?auto_444584 ?auto_444586 ) ) ( not ( = ?auto_444585 ?auto_444586 ) ) ( ON ?auto_444584 ?auto_444585 ) ( ON ?auto_444583 ?auto_444584 ) ( CLEAR ?auto_444581 ) ( ON ?auto_444582 ?auto_444583 ) ( CLEAR ?auto_444582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_444579 ?auto_444580 ?auto_444581 ?auto_444582 )
      ( MAKE-7PILE ?auto_444579 ?auto_444580 ?auto_444581 ?auto_444582 ?auto_444583 ?auto_444584 ?auto_444585 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_444609 - BLOCK
      ?auto_444610 - BLOCK
      ?auto_444611 - BLOCK
      ?auto_444612 - BLOCK
      ?auto_444613 - BLOCK
      ?auto_444614 - BLOCK
      ?auto_444615 - BLOCK
    )
    :vars
    (
      ?auto_444616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444615 ?auto_444616 ) ( ON-TABLE ?auto_444609 ) ( ON ?auto_444610 ?auto_444609 ) ( not ( = ?auto_444609 ?auto_444610 ) ) ( not ( = ?auto_444609 ?auto_444611 ) ) ( not ( = ?auto_444609 ?auto_444612 ) ) ( not ( = ?auto_444609 ?auto_444613 ) ) ( not ( = ?auto_444609 ?auto_444614 ) ) ( not ( = ?auto_444609 ?auto_444615 ) ) ( not ( = ?auto_444609 ?auto_444616 ) ) ( not ( = ?auto_444610 ?auto_444611 ) ) ( not ( = ?auto_444610 ?auto_444612 ) ) ( not ( = ?auto_444610 ?auto_444613 ) ) ( not ( = ?auto_444610 ?auto_444614 ) ) ( not ( = ?auto_444610 ?auto_444615 ) ) ( not ( = ?auto_444610 ?auto_444616 ) ) ( not ( = ?auto_444611 ?auto_444612 ) ) ( not ( = ?auto_444611 ?auto_444613 ) ) ( not ( = ?auto_444611 ?auto_444614 ) ) ( not ( = ?auto_444611 ?auto_444615 ) ) ( not ( = ?auto_444611 ?auto_444616 ) ) ( not ( = ?auto_444612 ?auto_444613 ) ) ( not ( = ?auto_444612 ?auto_444614 ) ) ( not ( = ?auto_444612 ?auto_444615 ) ) ( not ( = ?auto_444612 ?auto_444616 ) ) ( not ( = ?auto_444613 ?auto_444614 ) ) ( not ( = ?auto_444613 ?auto_444615 ) ) ( not ( = ?auto_444613 ?auto_444616 ) ) ( not ( = ?auto_444614 ?auto_444615 ) ) ( not ( = ?auto_444614 ?auto_444616 ) ) ( not ( = ?auto_444615 ?auto_444616 ) ) ( ON ?auto_444614 ?auto_444615 ) ( ON ?auto_444613 ?auto_444614 ) ( ON ?auto_444612 ?auto_444613 ) ( CLEAR ?auto_444610 ) ( ON ?auto_444611 ?auto_444612 ) ( CLEAR ?auto_444611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_444609 ?auto_444610 ?auto_444611 )
      ( MAKE-7PILE ?auto_444609 ?auto_444610 ?auto_444611 ?auto_444612 ?auto_444613 ?auto_444614 ?auto_444615 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_444639 - BLOCK
      ?auto_444640 - BLOCK
      ?auto_444641 - BLOCK
      ?auto_444642 - BLOCK
      ?auto_444643 - BLOCK
      ?auto_444644 - BLOCK
      ?auto_444645 - BLOCK
    )
    :vars
    (
      ?auto_444646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444645 ?auto_444646 ) ( ON-TABLE ?auto_444639 ) ( not ( = ?auto_444639 ?auto_444640 ) ) ( not ( = ?auto_444639 ?auto_444641 ) ) ( not ( = ?auto_444639 ?auto_444642 ) ) ( not ( = ?auto_444639 ?auto_444643 ) ) ( not ( = ?auto_444639 ?auto_444644 ) ) ( not ( = ?auto_444639 ?auto_444645 ) ) ( not ( = ?auto_444639 ?auto_444646 ) ) ( not ( = ?auto_444640 ?auto_444641 ) ) ( not ( = ?auto_444640 ?auto_444642 ) ) ( not ( = ?auto_444640 ?auto_444643 ) ) ( not ( = ?auto_444640 ?auto_444644 ) ) ( not ( = ?auto_444640 ?auto_444645 ) ) ( not ( = ?auto_444640 ?auto_444646 ) ) ( not ( = ?auto_444641 ?auto_444642 ) ) ( not ( = ?auto_444641 ?auto_444643 ) ) ( not ( = ?auto_444641 ?auto_444644 ) ) ( not ( = ?auto_444641 ?auto_444645 ) ) ( not ( = ?auto_444641 ?auto_444646 ) ) ( not ( = ?auto_444642 ?auto_444643 ) ) ( not ( = ?auto_444642 ?auto_444644 ) ) ( not ( = ?auto_444642 ?auto_444645 ) ) ( not ( = ?auto_444642 ?auto_444646 ) ) ( not ( = ?auto_444643 ?auto_444644 ) ) ( not ( = ?auto_444643 ?auto_444645 ) ) ( not ( = ?auto_444643 ?auto_444646 ) ) ( not ( = ?auto_444644 ?auto_444645 ) ) ( not ( = ?auto_444644 ?auto_444646 ) ) ( not ( = ?auto_444645 ?auto_444646 ) ) ( ON ?auto_444644 ?auto_444645 ) ( ON ?auto_444643 ?auto_444644 ) ( ON ?auto_444642 ?auto_444643 ) ( ON ?auto_444641 ?auto_444642 ) ( CLEAR ?auto_444639 ) ( ON ?auto_444640 ?auto_444641 ) ( CLEAR ?auto_444640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_444639 ?auto_444640 )
      ( MAKE-7PILE ?auto_444639 ?auto_444640 ?auto_444641 ?auto_444642 ?auto_444643 ?auto_444644 ?auto_444645 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_444669 - BLOCK
      ?auto_444670 - BLOCK
      ?auto_444671 - BLOCK
      ?auto_444672 - BLOCK
      ?auto_444673 - BLOCK
      ?auto_444674 - BLOCK
      ?auto_444675 - BLOCK
    )
    :vars
    (
      ?auto_444676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444675 ?auto_444676 ) ( not ( = ?auto_444669 ?auto_444670 ) ) ( not ( = ?auto_444669 ?auto_444671 ) ) ( not ( = ?auto_444669 ?auto_444672 ) ) ( not ( = ?auto_444669 ?auto_444673 ) ) ( not ( = ?auto_444669 ?auto_444674 ) ) ( not ( = ?auto_444669 ?auto_444675 ) ) ( not ( = ?auto_444669 ?auto_444676 ) ) ( not ( = ?auto_444670 ?auto_444671 ) ) ( not ( = ?auto_444670 ?auto_444672 ) ) ( not ( = ?auto_444670 ?auto_444673 ) ) ( not ( = ?auto_444670 ?auto_444674 ) ) ( not ( = ?auto_444670 ?auto_444675 ) ) ( not ( = ?auto_444670 ?auto_444676 ) ) ( not ( = ?auto_444671 ?auto_444672 ) ) ( not ( = ?auto_444671 ?auto_444673 ) ) ( not ( = ?auto_444671 ?auto_444674 ) ) ( not ( = ?auto_444671 ?auto_444675 ) ) ( not ( = ?auto_444671 ?auto_444676 ) ) ( not ( = ?auto_444672 ?auto_444673 ) ) ( not ( = ?auto_444672 ?auto_444674 ) ) ( not ( = ?auto_444672 ?auto_444675 ) ) ( not ( = ?auto_444672 ?auto_444676 ) ) ( not ( = ?auto_444673 ?auto_444674 ) ) ( not ( = ?auto_444673 ?auto_444675 ) ) ( not ( = ?auto_444673 ?auto_444676 ) ) ( not ( = ?auto_444674 ?auto_444675 ) ) ( not ( = ?auto_444674 ?auto_444676 ) ) ( not ( = ?auto_444675 ?auto_444676 ) ) ( ON ?auto_444674 ?auto_444675 ) ( ON ?auto_444673 ?auto_444674 ) ( ON ?auto_444672 ?auto_444673 ) ( ON ?auto_444671 ?auto_444672 ) ( ON ?auto_444670 ?auto_444671 ) ( ON ?auto_444669 ?auto_444670 ) ( CLEAR ?auto_444669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_444669 )
      ( MAKE-7PILE ?auto_444669 ?auto_444670 ?auto_444671 ?auto_444672 ?auto_444673 ?auto_444674 ?auto_444675 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_444700 - BLOCK
      ?auto_444701 - BLOCK
      ?auto_444702 - BLOCK
      ?auto_444703 - BLOCK
      ?auto_444704 - BLOCK
      ?auto_444705 - BLOCK
      ?auto_444706 - BLOCK
      ?auto_444707 - BLOCK
    )
    :vars
    (
      ?auto_444708 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_444706 ) ( ON ?auto_444707 ?auto_444708 ) ( CLEAR ?auto_444707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_444700 ) ( ON ?auto_444701 ?auto_444700 ) ( ON ?auto_444702 ?auto_444701 ) ( ON ?auto_444703 ?auto_444702 ) ( ON ?auto_444704 ?auto_444703 ) ( ON ?auto_444705 ?auto_444704 ) ( ON ?auto_444706 ?auto_444705 ) ( not ( = ?auto_444700 ?auto_444701 ) ) ( not ( = ?auto_444700 ?auto_444702 ) ) ( not ( = ?auto_444700 ?auto_444703 ) ) ( not ( = ?auto_444700 ?auto_444704 ) ) ( not ( = ?auto_444700 ?auto_444705 ) ) ( not ( = ?auto_444700 ?auto_444706 ) ) ( not ( = ?auto_444700 ?auto_444707 ) ) ( not ( = ?auto_444700 ?auto_444708 ) ) ( not ( = ?auto_444701 ?auto_444702 ) ) ( not ( = ?auto_444701 ?auto_444703 ) ) ( not ( = ?auto_444701 ?auto_444704 ) ) ( not ( = ?auto_444701 ?auto_444705 ) ) ( not ( = ?auto_444701 ?auto_444706 ) ) ( not ( = ?auto_444701 ?auto_444707 ) ) ( not ( = ?auto_444701 ?auto_444708 ) ) ( not ( = ?auto_444702 ?auto_444703 ) ) ( not ( = ?auto_444702 ?auto_444704 ) ) ( not ( = ?auto_444702 ?auto_444705 ) ) ( not ( = ?auto_444702 ?auto_444706 ) ) ( not ( = ?auto_444702 ?auto_444707 ) ) ( not ( = ?auto_444702 ?auto_444708 ) ) ( not ( = ?auto_444703 ?auto_444704 ) ) ( not ( = ?auto_444703 ?auto_444705 ) ) ( not ( = ?auto_444703 ?auto_444706 ) ) ( not ( = ?auto_444703 ?auto_444707 ) ) ( not ( = ?auto_444703 ?auto_444708 ) ) ( not ( = ?auto_444704 ?auto_444705 ) ) ( not ( = ?auto_444704 ?auto_444706 ) ) ( not ( = ?auto_444704 ?auto_444707 ) ) ( not ( = ?auto_444704 ?auto_444708 ) ) ( not ( = ?auto_444705 ?auto_444706 ) ) ( not ( = ?auto_444705 ?auto_444707 ) ) ( not ( = ?auto_444705 ?auto_444708 ) ) ( not ( = ?auto_444706 ?auto_444707 ) ) ( not ( = ?auto_444706 ?auto_444708 ) ) ( not ( = ?auto_444707 ?auto_444708 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_444707 ?auto_444708 )
      ( !STACK ?auto_444707 ?auto_444706 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_444734 - BLOCK
      ?auto_444735 - BLOCK
      ?auto_444736 - BLOCK
      ?auto_444737 - BLOCK
      ?auto_444738 - BLOCK
      ?auto_444739 - BLOCK
      ?auto_444740 - BLOCK
      ?auto_444741 - BLOCK
    )
    :vars
    (
      ?auto_444742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444741 ?auto_444742 ) ( ON-TABLE ?auto_444734 ) ( ON ?auto_444735 ?auto_444734 ) ( ON ?auto_444736 ?auto_444735 ) ( ON ?auto_444737 ?auto_444736 ) ( ON ?auto_444738 ?auto_444737 ) ( ON ?auto_444739 ?auto_444738 ) ( not ( = ?auto_444734 ?auto_444735 ) ) ( not ( = ?auto_444734 ?auto_444736 ) ) ( not ( = ?auto_444734 ?auto_444737 ) ) ( not ( = ?auto_444734 ?auto_444738 ) ) ( not ( = ?auto_444734 ?auto_444739 ) ) ( not ( = ?auto_444734 ?auto_444740 ) ) ( not ( = ?auto_444734 ?auto_444741 ) ) ( not ( = ?auto_444734 ?auto_444742 ) ) ( not ( = ?auto_444735 ?auto_444736 ) ) ( not ( = ?auto_444735 ?auto_444737 ) ) ( not ( = ?auto_444735 ?auto_444738 ) ) ( not ( = ?auto_444735 ?auto_444739 ) ) ( not ( = ?auto_444735 ?auto_444740 ) ) ( not ( = ?auto_444735 ?auto_444741 ) ) ( not ( = ?auto_444735 ?auto_444742 ) ) ( not ( = ?auto_444736 ?auto_444737 ) ) ( not ( = ?auto_444736 ?auto_444738 ) ) ( not ( = ?auto_444736 ?auto_444739 ) ) ( not ( = ?auto_444736 ?auto_444740 ) ) ( not ( = ?auto_444736 ?auto_444741 ) ) ( not ( = ?auto_444736 ?auto_444742 ) ) ( not ( = ?auto_444737 ?auto_444738 ) ) ( not ( = ?auto_444737 ?auto_444739 ) ) ( not ( = ?auto_444737 ?auto_444740 ) ) ( not ( = ?auto_444737 ?auto_444741 ) ) ( not ( = ?auto_444737 ?auto_444742 ) ) ( not ( = ?auto_444738 ?auto_444739 ) ) ( not ( = ?auto_444738 ?auto_444740 ) ) ( not ( = ?auto_444738 ?auto_444741 ) ) ( not ( = ?auto_444738 ?auto_444742 ) ) ( not ( = ?auto_444739 ?auto_444740 ) ) ( not ( = ?auto_444739 ?auto_444741 ) ) ( not ( = ?auto_444739 ?auto_444742 ) ) ( not ( = ?auto_444740 ?auto_444741 ) ) ( not ( = ?auto_444740 ?auto_444742 ) ) ( not ( = ?auto_444741 ?auto_444742 ) ) ( CLEAR ?auto_444739 ) ( ON ?auto_444740 ?auto_444741 ) ( CLEAR ?auto_444740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_444734 ?auto_444735 ?auto_444736 ?auto_444737 ?auto_444738 ?auto_444739 ?auto_444740 )
      ( MAKE-8PILE ?auto_444734 ?auto_444735 ?auto_444736 ?auto_444737 ?auto_444738 ?auto_444739 ?auto_444740 ?auto_444741 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_444768 - BLOCK
      ?auto_444769 - BLOCK
      ?auto_444770 - BLOCK
      ?auto_444771 - BLOCK
      ?auto_444772 - BLOCK
      ?auto_444773 - BLOCK
      ?auto_444774 - BLOCK
      ?auto_444775 - BLOCK
    )
    :vars
    (
      ?auto_444776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444775 ?auto_444776 ) ( ON-TABLE ?auto_444768 ) ( ON ?auto_444769 ?auto_444768 ) ( ON ?auto_444770 ?auto_444769 ) ( ON ?auto_444771 ?auto_444770 ) ( ON ?auto_444772 ?auto_444771 ) ( not ( = ?auto_444768 ?auto_444769 ) ) ( not ( = ?auto_444768 ?auto_444770 ) ) ( not ( = ?auto_444768 ?auto_444771 ) ) ( not ( = ?auto_444768 ?auto_444772 ) ) ( not ( = ?auto_444768 ?auto_444773 ) ) ( not ( = ?auto_444768 ?auto_444774 ) ) ( not ( = ?auto_444768 ?auto_444775 ) ) ( not ( = ?auto_444768 ?auto_444776 ) ) ( not ( = ?auto_444769 ?auto_444770 ) ) ( not ( = ?auto_444769 ?auto_444771 ) ) ( not ( = ?auto_444769 ?auto_444772 ) ) ( not ( = ?auto_444769 ?auto_444773 ) ) ( not ( = ?auto_444769 ?auto_444774 ) ) ( not ( = ?auto_444769 ?auto_444775 ) ) ( not ( = ?auto_444769 ?auto_444776 ) ) ( not ( = ?auto_444770 ?auto_444771 ) ) ( not ( = ?auto_444770 ?auto_444772 ) ) ( not ( = ?auto_444770 ?auto_444773 ) ) ( not ( = ?auto_444770 ?auto_444774 ) ) ( not ( = ?auto_444770 ?auto_444775 ) ) ( not ( = ?auto_444770 ?auto_444776 ) ) ( not ( = ?auto_444771 ?auto_444772 ) ) ( not ( = ?auto_444771 ?auto_444773 ) ) ( not ( = ?auto_444771 ?auto_444774 ) ) ( not ( = ?auto_444771 ?auto_444775 ) ) ( not ( = ?auto_444771 ?auto_444776 ) ) ( not ( = ?auto_444772 ?auto_444773 ) ) ( not ( = ?auto_444772 ?auto_444774 ) ) ( not ( = ?auto_444772 ?auto_444775 ) ) ( not ( = ?auto_444772 ?auto_444776 ) ) ( not ( = ?auto_444773 ?auto_444774 ) ) ( not ( = ?auto_444773 ?auto_444775 ) ) ( not ( = ?auto_444773 ?auto_444776 ) ) ( not ( = ?auto_444774 ?auto_444775 ) ) ( not ( = ?auto_444774 ?auto_444776 ) ) ( not ( = ?auto_444775 ?auto_444776 ) ) ( ON ?auto_444774 ?auto_444775 ) ( CLEAR ?auto_444772 ) ( ON ?auto_444773 ?auto_444774 ) ( CLEAR ?auto_444773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_444768 ?auto_444769 ?auto_444770 ?auto_444771 ?auto_444772 ?auto_444773 )
      ( MAKE-8PILE ?auto_444768 ?auto_444769 ?auto_444770 ?auto_444771 ?auto_444772 ?auto_444773 ?auto_444774 ?auto_444775 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_444802 - BLOCK
      ?auto_444803 - BLOCK
      ?auto_444804 - BLOCK
      ?auto_444805 - BLOCK
      ?auto_444806 - BLOCK
      ?auto_444807 - BLOCK
      ?auto_444808 - BLOCK
      ?auto_444809 - BLOCK
    )
    :vars
    (
      ?auto_444810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444809 ?auto_444810 ) ( ON-TABLE ?auto_444802 ) ( ON ?auto_444803 ?auto_444802 ) ( ON ?auto_444804 ?auto_444803 ) ( ON ?auto_444805 ?auto_444804 ) ( not ( = ?auto_444802 ?auto_444803 ) ) ( not ( = ?auto_444802 ?auto_444804 ) ) ( not ( = ?auto_444802 ?auto_444805 ) ) ( not ( = ?auto_444802 ?auto_444806 ) ) ( not ( = ?auto_444802 ?auto_444807 ) ) ( not ( = ?auto_444802 ?auto_444808 ) ) ( not ( = ?auto_444802 ?auto_444809 ) ) ( not ( = ?auto_444802 ?auto_444810 ) ) ( not ( = ?auto_444803 ?auto_444804 ) ) ( not ( = ?auto_444803 ?auto_444805 ) ) ( not ( = ?auto_444803 ?auto_444806 ) ) ( not ( = ?auto_444803 ?auto_444807 ) ) ( not ( = ?auto_444803 ?auto_444808 ) ) ( not ( = ?auto_444803 ?auto_444809 ) ) ( not ( = ?auto_444803 ?auto_444810 ) ) ( not ( = ?auto_444804 ?auto_444805 ) ) ( not ( = ?auto_444804 ?auto_444806 ) ) ( not ( = ?auto_444804 ?auto_444807 ) ) ( not ( = ?auto_444804 ?auto_444808 ) ) ( not ( = ?auto_444804 ?auto_444809 ) ) ( not ( = ?auto_444804 ?auto_444810 ) ) ( not ( = ?auto_444805 ?auto_444806 ) ) ( not ( = ?auto_444805 ?auto_444807 ) ) ( not ( = ?auto_444805 ?auto_444808 ) ) ( not ( = ?auto_444805 ?auto_444809 ) ) ( not ( = ?auto_444805 ?auto_444810 ) ) ( not ( = ?auto_444806 ?auto_444807 ) ) ( not ( = ?auto_444806 ?auto_444808 ) ) ( not ( = ?auto_444806 ?auto_444809 ) ) ( not ( = ?auto_444806 ?auto_444810 ) ) ( not ( = ?auto_444807 ?auto_444808 ) ) ( not ( = ?auto_444807 ?auto_444809 ) ) ( not ( = ?auto_444807 ?auto_444810 ) ) ( not ( = ?auto_444808 ?auto_444809 ) ) ( not ( = ?auto_444808 ?auto_444810 ) ) ( not ( = ?auto_444809 ?auto_444810 ) ) ( ON ?auto_444808 ?auto_444809 ) ( ON ?auto_444807 ?auto_444808 ) ( CLEAR ?auto_444805 ) ( ON ?auto_444806 ?auto_444807 ) ( CLEAR ?auto_444806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_444802 ?auto_444803 ?auto_444804 ?auto_444805 ?auto_444806 )
      ( MAKE-8PILE ?auto_444802 ?auto_444803 ?auto_444804 ?auto_444805 ?auto_444806 ?auto_444807 ?auto_444808 ?auto_444809 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_444836 - BLOCK
      ?auto_444837 - BLOCK
      ?auto_444838 - BLOCK
      ?auto_444839 - BLOCK
      ?auto_444840 - BLOCK
      ?auto_444841 - BLOCK
      ?auto_444842 - BLOCK
      ?auto_444843 - BLOCK
    )
    :vars
    (
      ?auto_444844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444843 ?auto_444844 ) ( ON-TABLE ?auto_444836 ) ( ON ?auto_444837 ?auto_444836 ) ( ON ?auto_444838 ?auto_444837 ) ( not ( = ?auto_444836 ?auto_444837 ) ) ( not ( = ?auto_444836 ?auto_444838 ) ) ( not ( = ?auto_444836 ?auto_444839 ) ) ( not ( = ?auto_444836 ?auto_444840 ) ) ( not ( = ?auto_444836 ?auto_444841 ) ) ( not ( = ?auto_444836 ?auto_444842 ) ) ( not ( = ?auto_444836 ?auto_444843 ) ) ( not ( = ?auto_444836 ?auto_444844 ) ) ( not ( = ?auto_444837 ?auto_444838 ) ) ( not ( = ?auto_444837 ?auto_444839 ) ) ( not ( = ?auto_444837 ?auto_444840 ) ) ( not ( = ?auto_444837 ?auto_444841 ) ) ( not ( = ?auto_444837 ?auto_444842 ) ) ( not ( = ?auto_444837 ?auto_444843 ) ) ( not ( = ?auto_444837 ?auto_444844 ) ) ( not ( = ?auto_444838 ?auto_444839 ) ) ( not ( = ?auto_444838 ?auto_444840 ) ) ( not ( = ?auto_444838 ?auto_444841 ) ) ( not ( = ?auto_444838 ?auto_444842 ) ) ( not ( = ?auto_444838 ?auto_444843 ) ) ( not ( = ?auto_444838 ?auto_444844 ) ) ( not ( = ?auto_444839 ?auto_444840 ) ) ( not ( = ?auto_444839 ?auto_444841 ) ) ( not ( = ?auto_444839 ?auto_444842 ) ) ( not ( = ?auto_444839 ?auto_444843 ) ) ( not ( = ?auto_444839 ?auto_444844 ) ) ( not ( = ?auto_444840 ?auto_444841 ) ) ( not ( = ?auto_444840 ?auto_444842 ) ) ( not ( = ?auto_444840 ?auto_444843 ) ) ( not ( = ?auto_444840 ?auto_444844 ) ) ( not ( = ?auto_444841 ?auto_444842 ) ) ( not ( = ?auto_444841 ?auto_444843 ) ) ( not ( = ?auto_444841 ?auto_444844 ) ) ( not ( = ?auto_444842 ?auto_444843 ) ) ( not ( = ?auto_444842 ?auto_444844 ) ) ( not ( = ?auto_444843 ?auto_444844 ) ) ( ON ?auto_444842 ?auto_444843 ) ( ON ?auto_444841 ?auto_444842 ) ( ON ?auto_444840 ?auto_444841 ) ( CLEAR ?auto_444838 ) ( ON ?auto_444839 ?auto_444840 ) ( CLEAR ?auto_444839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_444836 ?auto_444837 ?auto_444838 ?auto_444839 )
      ( MAKE-8PILE ?auto_444836 ?auto_444837 ?auto_444838 ?auto_444839 ?auto_444840 ?auto_444841 ?auto_444842 ?auto_444843 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_444870 - BLOCK
      ?auto_444871 - BLOCK
      ?auto_444872 - BLOCK
      ?auto_444873 - BLOCK
      ?auto_444874 - BLOCK
      ?auto_444875 - BLOCK
      ?auto_444876 - BLOCK
      ?auto_444877 - BLOCK
    )
    :vars
    (
      ?auto_444878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444877 ?auto_444878 ) ( ON-TABLE ?auto_444870 ) ( ON ?auto_444871 ?auto_444870 ) ( not ( = ?auto_444870 ?auto_444871 ) ) ( not ( = ?auto_444870 ?auto_444872 ) ) ( not ( = ?auto_444870 ?auto_444873 ) ) ( not ( = ?auto_444870 ?auto_444874 ) ) ( not ( = ?auto_444870 ?auto_444875 ) ) ( not ( = ?auto_444870 ?auto_444876 ) ) ( not ( = ?auto_444870 ?auto_444877 ) ) ( not ( = ?auto_444870 ?auto_444878 ) ) ( not ( = ?auto_444871 ?auto_444872 ) ) ( not ( = ?auto_444871 ?auto_444873 ) ) ( not ( = ?auto_444871 ?auto_444874 ) ) ( not ( = ?auto_444871 ?auto_444875 ) ) ( not ( = ?auto_444871 ?auto_444876 ) ) ( not ( = ?auto_444871 ?auto_444877 ) ) ( not ( = ?auto_444871 ?auto_444878 ) ) ( not ( = ?auto_444872 ?auto_444873 ) ) ( not ( = ?auto_444872 ?auto_444874 ) ) ( not ( = ?auto_444872 ?auto_444875 ) ) ( not ( = ?auto_444872 ?auto_444876 ) ) ( not ( = ?auto_444872 ?auto_444877 ) ) ( not ( = ?auto_444872 ?auto_444878 ) ) ( not ( = ?auto_444873 ?auto_444874 ) ) ( not ( = ?auto_444873 ?auto_444875 ) ) ( not ( = ?auto_444873 ?auto_444876 ) ) ( not ( = ?auto_444873 ?auto_444877 ) ) ( not ( = ?auto_444873 ?auto_444878 ) ) ( not ( = ?auto_444874 ?auto_444875 ) ) ( not ( = ?auto_444874 ?auto_444876 ) ) ( not ( = ?auto_444874 ?auto_444877 ) ) ( not ( = ?auto_444874 ?auto_444878 ) ) ( not ( = ?auto_444875 ?auto_444876 ) ) ( not ( = ?auto_444875 ?auto_444877 ) ) ( not ( = ?auto_444875 ?auto_444878 ) ) ( not ( = ?auto_444876 ?auto_444877 ) ) ( not ( = ?auto_444876 ?auto_444878 ) ) ( not ( = ?auto_444877 ?auto_444878 ) ) ( ON ?auto_444876 ?auto_444877 ) ( ON ?auto_444875 ?auto_444876 ) ( ON ?auto_444874 ?auto_444875 ) ( ON ?auto_444873 ?auto_444874 ) ( CLEAR ?auto_444871 ) ( ON ?auto_444872 ?auto_444873 ) ( CLEAR ?auto_444872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_444870 ?auto_444871 ?auto_444872 )
      ( MAKE-8PILE ?auto_444870 ?auto_444871 ?auto_444872 ?auto_444873 ?auto_444874 ?auto_444875 ?auto_444876 ?auto_444877 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_444904 - BLOCK
      ?auto_444905 - BLOCK
      ?auto_444906 - BLOCK
      ?auto_444907 - BLOCK
      ?auto_444908 - BLOCK
      ?auto_444909 - BLOCK
      ?auto_444910 - BLOCK
      ?auto_444911 - BLOCK
    )
    :vars
    (
      ?auto_444912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444911 ?auto_444912 ) ( ON-TABLE ?auto_444904 ) ( not ( = ?auto_444904 ?auto_444905 ) ) ( not ( = ?auto_444904 ?auto_444906 ) ) ( not ( = ?auto_444904 ?auto_444907 ) ) ( not ( = ?auto_444904 ?auto_444908 ) ) ( not ( = ?auto_444904 ?auto_444909 ) ) ( not ( = ?auto_444904 ?auto_444910 ) ) ( not ( = ?auto_444904 ?auto_444911 ) ) ( not ( = ?auto_444904 ?auto_444912 ) ) ( not ( = ?auto_444905 ?auto_444906 ) ) ( not ( = ?auto_444905 ?auto_444907 ) ) ( not ( = ?auto_444905 ?auto_444908 ) ) ( not ( = ?auto_444905 ?auto_444909 ) ) ( not ( = ?auto_444905 ?auto_444910 ) ) ( not ( = ?auto_444905 ?auto_444911 ) ) ( not ( = ?auto_444905 ?auto_444912 ) ) ( not ( = ?auto_444906 ?auto_444907 ) ) ( not ( = ?auto_444906 ?auto_444908 ) ) ( not ( = ?auto_444906 ?auto_444909 ) ) ( not ( = ?auto_444906 ?auto_444910 ) ) ( not ( = ?auto_444906 ?auto_444911 ) ) ( not ( = ?auto_444906 ?auto_444912 ) ) ( not ( = ?auto_444907 ?auto_444908 ) ) ( not ( = ?auto_444907 ?auto_444909 ) ) ( not ( = ?auto_444907 ?auto_444910 ) ) ( not ( = ?auto_444907 ?auto_444911 ) ) ( not ( = ?auto_444907 ?auto_444912 ) ) ( not ( = ?auto_444908 ?auto_444909 ) ) ( not ( = ?auto_444908 ?auto_444910 ) ) ( not ( = ?auto_444908 ?auto_444911 ) ) ( not ( = ?auto_444908 ?auto_444912 ) ) ( not ( = ?auto_444909 ?auto_444910 ) ) ( not ( = ?auto_444909 ?auto_444911 ) ) ( not ( = ?auto_444909 ?auto_444912 ) ) ( not ( = ?auto_444910 ?auto_444911 ) ) ( not ( = ?auto_444910 ?auto_444912 ) ) ( not ( = ?auto_444911 ?auto_444912 ) ) ( ON ?auto_444910 ?auto_444911 ) ( ON ?auto_444909 ?auto_444910 ) ( ON ?auto_444908 ?auto_444909 ) ( ON ?auto_444907 ?auto_444908 ) ( ON ?auto_444906 ?auto_444907 ) ( CLEAR ?auto_444904 ) ( ON ?auto_444905 ?auto_444906 ) ( CLEAR ?auto_444905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_444904 ?auto_444905 )
      ( MAKE-8PILE ?auto_444904 ?auto_444905 ?auto_444906 ?auto_444907 ?auto_444908 ?auto_444909 ?auto_444910 ?auto_444911 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_444938 - BLOCK
      ?auto_444939 - BLOCK
      ?auto_444940 - BLOCK
      ?auto_444941 - BLOCK
      ?auto_444942 - BLOCK
      ?auto_444943 - BLOCK
      ?auto_444944 - BLOCK
      ?auto_444945 - BLOCK
    )
    :vars
    (
      ?auto_444946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_444945 ?auto_444946 ) ( not ( = ?auto_444938 ?auto_444939 ) ) ( not ( = ?auto_444938 ?auto_444940 ) ) ( not ( = ?auto_444938 ?auto_444941 ) ) ( not ( = ?auto_444938 ?auto_444942 ) ) ( not ( = ?auto_444938 ?auto_444943 ) ) ( not ( = ?auto_444938 ?auto_444944 ) ) ( not ( = ?auto_444938 ?auto_444945 ) ) ( not ( = ?auto_444938 ?auto_444946 ) ) ( not ( = ?auto_444939 ?auto_444940 ) ) ( not ( = ?auto_444939 ?auto_444941 ) ) ( not ( = ?auto_444939 ?auto_444942 ) ) ( not ( = ?auto_444939 ?auto_444943 ) ) ( not ( = ?auto_444939 ?auto_444944 ) ) ( not ( = ?auto_444939 ?auto_444945 ) ) ( not ( = ?auto_444939 ?auto_444946 ) ) ( not ( = ?auto_444940 ?auto_444941 ) ) ( not ( = ?auto_444940 ?auto_444942 ) ) ( not ( = ?auto_444940 ?auto_444943 ) ) ( not ( = ?auto_444940 ?auto_444944 ) ) ( not ( = ?auto_444940 ?auto_444945 ) ) ( not ( = ?auto_444940 ?auto_444946 ) ) ( not ( = ?auto_444941 ?auto_444942 ) ) ( not ( = ?auto_444941 ?auto_444943 ) ) ( not ( = ?auto_444941 ?auto_444944 ) ) ( not ( = ?auto_444941 ?auto_444945 ) ) ( not ( = ?auto_444941 ?auto_444946 ) ) ( not ( = ?auto_444942 ?auto_444943 ) ) ( not ( = ?auto_444942 ?auto_444944 ) ) ( not ( = ?auto_444942 ?auto_444945 ) ) ( not ( = ?auto_444942 ?auto_444946 ) ) ( not ( = ?auto_444943 ?auto_444944 ) ) ( not ( = ?auto_444943 ?auto_444945 ) ) ( not ( = ?auto_444943 ?auto_444946 ) ) ( not ( = ?auto_444944 ?auto_444945 ) ) ( not ( = ?auto_444944 ?auto_444946 ) ) ( not ( = ?auto_444945 ?auto_444946 ) ) ( ON ?auto_444944 ?auto_444945 ) ( ON ?auto_444943 ?auto_444944 ) ( ON ?auto_444942 ?auto_444943 ) ( ON ?auto_444941 ?auto_444942 ) ( ON ?auto_444940 ?auto_444941 ) ( ON ?auto_444939 ?auto_444940 ) ( ON ?auto_444938 ?auto_444939 ) ( CLEAR ?auto_444938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_444938 )
      ( MAKE-8PILE ?auto_444938 ?auto_444939 ?auto_444940 ?auto_444941 ?auto_444942 ?auto_444943 ?auto_444944 ?auto_444945 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_444973 - BLOCK
      ?auto_444974 - BLOCK
      ?auto_444975 - BLOCK
      ?auto_444976 - BLOCK
      ?auto_444977 - BLOCK
      ?auto_444978 - BLOCK
      ?auto_444979 - BLOCK
      ?auto_444980 - BLOCK
      ?auto_444981 - BLOCK
    )
    :vars
    (
      ?auto_444982 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_444980 ) ( ON ?auto_444981 ?auto_444982 ) ( CLEAR ?auto_444981 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_444973 ) ( ON ?auto_444974 ?auto_444973 ) ( ON ?auto_444975 ?auto_444974 ) ( ON ?auto_444976 ?auto_444975 ) ( ON ?auto_444977 ?auto_444976 ) ( ON ?auto_444978 ?auto_444977 ) ( ON ?auto_444979 ?auto_444978 ) ( ON ?auto_444980 ?auto_444979 ) ( not ( = ?auto_444973 ?auto_444974 ) ) ( not ( = ?auto_444973 ?auto_444975 ) ) ( not ( = ?auto_444973 ?auto_444976 ) ) ( not ( = ?auto_444973 ?auto_444977 ) ) ( not ( = ?auto_444973 ?auto_444978 ) ) ( not ( = ?auto_444973 ?auto_444979 ) ) ( not ( = ?auto_444973 ?auto_444980 ) ) ( not ( = ?auto_444973 ?auto_444981 ) ) ( not ( = ?auto_444973 ?auto_444982 ) ) ( not ( = ?auto_444974 ?auto_444975 ) ) ( not ( = ?auto_444974 ?auto_444976 ) ) ( not ( = ?auto_444974 ?auto_444977 ) ) ( not ( = ?auto_444974 ?auto_444978 ) ) ( not ( = ?auto_444974 ?auto_444979 ) ) ( not ( = ?auto_444974 ?auto_444980 ) ) ( not ( = ?auto_444974 ?auto_444981 ) ) ( not ( = ?auto_444974 ?auto_444982 ) ) ( not ( = ?auto_444975 ?auto_444976 ) ) ( not ( = ?auto_444975 ?auto_444977 ) ) ( not ( = ?auto_444975 ?auto_444978 ) ) ( not ( = ?auto_444975 ?auto_444979 ) ) ( not ( = ?auto_444975 ?auto_444980 ) ) ( not ( = ?auto_444975 ?auto_444981 ) ) ( not ( = ?auto_444975 ?auto_444982 ) ) ( not ( = ?auto_444976 ?auto_444977 ) ) ( not ( = ?auto_444976 ?auto_444978 ) ) ( not ( = ?auto_444976 ?auto_444979 ) ) ( not ( = ?auto_444976 ?auto_444980 ) ) ( not ( = ?auto_444976 ?auto_444981 ) ) ( not ( = ?auto_444976 ?auto_444982 ) ) ( not ( = ?auto_444977 ?auto_444978 ) ) ( not ( = ?auto_444977 ?auto_444979 ) ) ( not ( = ?auto_444977 ?auto_444980 ) ) ( not ( = ?auto_444977 ?auto_444981 ) ) ( not ( = ?auto_444977 ?auto_444982 ) ) ( not ( = ?auto_444978 ?auto_444979 ) ) ( not ( = ?auto_444978 ?auto_444980 ) ) ( not ( = ?auto_444978 ?auto_444981 ) ) ( not ( = ?auto_444978 ?auto_444982 ) ) ( not ( = ?auto_444979 ?auto_444980 ) ) ( not ( = ?auto_444979 ?auto_444981 ) ) ( not ( = ?auto_444979 ?auto_444982 ) ) ( not ( = ?auto_444980 ?auto_444981 ) ) ( not ( = ?auto_444980 ?auto_444982 ) ) ( not ( = ?auto_444981 ?auto_444982 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_444981 ?auto_444982 )
      ( !STACK ?auto_444981 ?auto_444980 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_445011 - BLOCK
      ?auto_445012 - BLOCK
      ?auto_445013 - BLOCK
      ?auto_445014 - BLOCK
      ?auto_445015 - BLOCK
      ?auto_445016 - BLOCK
      ?auto_445017 - BLOCK
      ?auto_445018 - BLOCK
      ?auto_445019 - BLOCK
    )
    :vars
    (
      ?auto_445020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445019 ?auto_445020 ) ( ON-TABLE ?auto_445011 ) ( ON ?auto_445012 ?auto_445011 ) ( ON ?auto_445013 ?auto_445012 ) ( ON ?auto_445014 ?auto_445013 ) ( ON ?auto_445015 ?auto_445014 ) ( ON ?auto_445016 ?auto_445015 ) ( ON ?auto_445017 ?auto_445016 ) ( not ( = ?auto_445011 ?auto_445012 ) ) ( not ( = ?auto_445011 ?auto_445013 ) ) ( not ( = ?auto_445011 ?auto_445014 ) ) ( not ( = ?auto_445011 ?auto_445015 ) ) ( not ( = ?auto_445011 ?auto_445016 ) ) ( not ( = ?auto_445011 ?auto_445017 ) ) ( not ( = ?auto_445011 ?auto_445018 ) ) ( not ( = ?auto_445011 ?auto_445019 ) ) ( not ( = ?auto_445011 ?auto_445020 ) ) ( not ( = ?auto_445012 ?auto_445013 ) ) ( not ( = ?auto_445012 ?auto_445014 ) ) ( not ( = ?auto_445012 ?auto_445015 ) ) ( not ( = ?auto_445012 ?auto_445016 ) ) ( not ( = ?auto_445012 ?auto_445017 ) ) ( not ( = ?auto_445012 ?auto_445018 ) ) ( not ( = ?auto_445012 ?auto_445019 ) ) ( not ( = ?auto_445012 ?auto_445020 ) ) ( not ( = ?auto_445013 ?auto_445014 ) ) ( not ( = ?auto_445013 ?auto_445015 ) ) ( not ( = ?auto_445013 ?auto_445016 ) ) ( not ( = ?auto_445013 ?auto_445017 ) ) ( not ( = ?auto_445013 ?auto_445018 ) ) ( not ( = ?auto_445013 ?auto_445019 ) ) ( not ( = ?auto_445013 ?auto_445020 ) ) ( not ( = ?auto_445014 ?auto_445015 ) ) ( not ( = ?auto_445014 ?auto_445016 ) ) ( not ( = ?auto_445014 ?auto_445017 ) ) ( not ( = ?auto_445014 ?auto_445018 ) ) ( not ( = ?auto_445014 ?auto_445019 ) ) ( not ( = ?auto_445014 ?auto_445020 ) ) ( not ( = ?auto_445015 ?auto_445016 ) ) ( not ( = ?auto_445015 ?auto_445017 ) ) ( not ( = ?auto_445015 ?auto_445018 ) ) ( not ( = ?auto_445015 ?auto_445019 ) ) ( not ( = ?auto_445015 ?auto_445020 ) ) ( not ( = ?auto_445016 ?auto_445017 ) ) ( not ( = ?auto_445016 ?auto_445018 ) ) ( not ( = ?auto_445016 ?auto_445019 ) ) ( not ( = ?auto_445016 ?auto_445020 ) ) ( not ( = ?auto_445017 ?auto_445018 ) ) ( not ( = ?auto_445017 ?auto_445019 ) ) ( not ( = ?auto_445017 ?auto_445020 ) ) ( not ( = ?auto_445018 ?auto_445019 ) ) ( not ( = ?auto_445018 ?auto_445020 ) ) ( not ( = ?auto_445019 ?auto_445020 ) ) ( CLEAR ?auto_445017 ) ( ON ?auto_445018 ?auto_445019 ) ( CLEAR ?auto_445018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_445011 ?auto_445012 ?auto_445013 ?auto_445014 ?auto_445015 ?auto_445016 ?auto_445017 ?auto_445018 )
      ( MAKE-9PILE ?auto_445011 ?auto_445012 ?auto_445013 ?auto_445014 ?auto_445015 ?auto_445016 ?auto_445017 ?auto_445018 ?auto_445019 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_445049 - BLOCK
      ?auto_445050 - BLOCK
      ?auto_445051 - BLOCK
      ?auto_445052 - BLOCK
      ?auto_445053 - BLOCK
      ?auto_445054 - BLOCK
      ?auto_445055 - BLOCK
      ?auto_445056 - BLOCK
      ?auto_445057 - BLOCK
    )
    :vars
    (
      ?auto_445058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445057 ?auto_445058 ) ( ON-TABLE ?auto_445049 ) ( ON ?auto_445050 ?auto_445049 ) ( ON ?auto_445051 ?auto_445050 ) ( ON ?auto_445052 ?auto_445051 ) ( ON ?auto_445053 ?auto_445052 ) ( ON ?auto_445054 ?auto_445053 ) ( not ( = ?auto_445049 ?auto_445050 ) ) ( not ( = ?auto_445049 ?auto_445051 ) ) ( not ( = ?auto_445049 ?auto_445052 ) ) ( not ( = ?auto_445049 ?auto_445053 ) ) ( not ( = ?auto_445049 ?auto_445054 ) ) ( not ( = ?auto_445049 ?auto_445055 ) ) ( not ( = ?auto_445049 ?auto_445056 ) ) ( not ( = ?auto_445049 ?auto_445057 ) ) ( not ( = ?auto_445049 ?auto_445058 ) ) ( not ( = ?auto_445050 ?auto_445051 ) ) ( not ( = ?auto_445050 ?auto_445052 ) ) ( not ( = ?auto_445050 ?auto_445053 ) ) ( not ( = ?auto_445050 ?auto_445054 ) ) ( not ( = ?auto_445050 ?auto_445055 ) ) ( not ( = ?auto_445050 ?auto_445056 ) ) ( not ( = ?auto_445050 ?auto_445057 ) ) ( not ( = ?auto_445050 ?auto_445058 ) ) ( not ( = ?auto_445051 ?auto_445052 ) ) ( not ( = ?auto_445051 ?auto_445053 ) ) ( not ( = ?auto_445051 ?auto_445054 ) ) ( not ( = ?auto_445051 ?auto_445055 ) ) ( not ( = ?auto_445051 ?auto_445056 ) ) ( not ( = ?auto_445051 ?auto_445057 ) ) ( not ( = ?auto_445051 ?auto_445058 ) ) ( not ( = ?auto_445052 ?auto_445053 ) ) ( not ( = ?auto_445052 ?auto_445054 ) ) ( not ( = ?auto_445052 ?auto_445055 ) ) ( not ( = ?auto_445052 ?auto_445056 ) ) ( not ( = ?auto_445052 ?auto_445057 ) ) ( not ( = ?auto_445052 ?auto_445058 ) ) ( not ( = ?auto_445053 ?auto_445054 ) ) ( not ( = ?auto_445053 ?auto_445055 ) ) ( not ( = ?auto_445053 ?auto_445056 ) ) ( not ( = ?auto_445053 ?auto_445057 ) ) ( not ( = ?auto_445053 ?auto_445058 ) ) ( not ( = ?auto_445054 ?auto_445055 ) ) ( not ( = ?auto_445054 ?auto_445056 ) ) ( not ( = ?auto_445054 ?auto_445057 ) ) ( not ( = ?auto_445054 ?auto_445058 ) ) ( not ( = ?auto_445055 ?auto_445056 ) ) ( not ( = ?auto_445055 ?auto_445057 ) ) ( not ( = ?auto_445055 ?auto_445058 ) ) ( not ( = ?auto_445056 ?auto_445057 ) ) ( not ( = ?auto_445056 ?auto_445058 ) ) ( not ( = ?auto_445057 ?auto_445058 ) ) ( ON ?auto_445056 ?auto_445057 ) ( CLEAR ?auto_445054 ) ( ON ?auto_445055 ?auto_445056 ) ( CLEAR ?auto_445055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_445049 ?auto_445050 ?auto_445051 ?auto_445052 ?auto_445053 ?auto_445054 ?auto_445055 )
      ( MAKE-9PILE ?auto_445049 ?auto_445050 ?auto_445051 ?auto_445052 ?auto_445053 ?auto_445054 ?auto_445055 ?auto_445056 ?auto_445057 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_445087 - BLOCK
      ?auto_445088 - BLOCK
      ?auto_445089 - BLOCK
      ?auto_445090 - BLOCK
      ?auto_445091 - BLOCK
      ?auto_445092 - BLOCK
      ?auto_445093 - BLOCK
      ?auto_445094 - BLOCK
      ?auto_445095 - BLOCK
    )
    :vars
    (
      ?auto_445096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445095 ?auto_445096 ) ( ON-TABLE ?auto_445087 ) ( ON ?auto_445088 ?auto_445087 ) ( ON ?auto_445089 ?auto_445088 ) ( ON ?auto_445090 ?auto_445089 ) ( ON ?auto_445091 ?auto_445090 ) ( not ( = ?auto_445087 ?auto_445088 ) ) ( not ( = ?auto_445087 ?auto_445089 ) ) ( not ( = ?auto_445087 ?auto_445090 ) ) ( not ( = ?auto_445087 ?auto_445091 ) ) ( not ( = ?auto_445087 ?auto_445092 ) ) ( not ( = ?auto_445087 ?auto_445093 ) ) ( not ( = ?auto_445087 ?auto_445094 ) ) ( not ( = ?auto_445087 ?auto_445095 ) ) ( not ( = ?auto_445087 ?auto_445096 ) ) ( not ( = ?auto_445088 ?auto_445089 ) ) ( not ( = ?auto_445088 ?auto_445090 ) ) ( not ( = ?auto_445088 ?auto_445091 ) ) ( not ( = ?auto_445088 ?auto_445092 ) ) ( not ( = ?auto_445088 ?auto_445093 ) ) ( not ( = ?auto_445088 ?auto_445094 ) ) ( not ( = ?auto_445088 ?auto_445095 ) ) ( not ( = ?auto_445088 ?auto_445096 ) ) ( not ( = ?auto_445089 ?auto_445090 ) ) ( not ( = ?auto_445089 ?auto_445091 ) ) ( not ( = ?auto_445089 ?auto_445092 ) ) ( not ( = ?auto_445089 ?auto_445093 ) ) ( not ( = ?auto_445089 ?auto_445094 ) ) ( not ( = ?auto_445089 ?auto_445095 ) ) ( not ( = ?auto_445089 ?auto_445096 ) ) ( not ( = ?auto_445090 ?auto_445091 ) ) ( not ( = ?auto_445090 ?auto_445092 ) ) ( not ( = ?auto_445090 ?auto_445093 ) ) ( not ( = ?auto_445090 ?auto_445094 ) ) ( not ( = ?auto_445090 ?auto_445095 ) ) ( not ( = ?auto_445090 ?auto_445096 ) ) ( not ( = ?auto_445091 ?auto_445092 ) ) ( not ( = ?auto_445091 ?auto_445093 ) ) ( not ( = ?auto_445091 ?auto_445094 ) ) ( not ( = ?auto_445091 ?auto_445095 ) ) ( not ( = ?auto_445091 ?auto_445096 ) ) ( not ( = ?auto_445092 ?auto_445093 ) ) ( not ( = ?auto_445092 ?auto_445094 ) ) ( not ( = ?auto_445092 ?auto_445095 ) ) ( not ( = ?auto_445092 ?auto_445096 ) ) ( not ( = ?auto_445093 ?auto_445094 ) ) ( not ( = ?auto_445093 ?auto_445095 ) ) ( not ( = ?auto_445093 ?auto_445096 ) ) ( not ( = ?auto_445094 ?auto_445095 ) ) ( not ( = ?auto_445094 ?auto_445096 ) ) ( not ( = ?auto_445095 ?auto_445096 ) ) ( ON ?auto_445094 ?auto_445095 ) ( ON ?auto_445093 ?auto_445094 ) ( CLEAR ?auto_445091 ) ( ON ?auto_445092 ?auto_445093 ) ( CLEAR ?auto_445092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_445087 ?auto_445088 ?auto_445089 ?auto_445090 ?auto_445091 ?auto_445092 )
      ( MAKE-9PILE ?auto_445087 ?auto_445088 ?auto_445089 ?auto_445090 ?auto_445091 ?auto_445092 ?auto_445093 ?auto_445094 ?auto_445095 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_445125 - BLOCK
      ?auto_445126 - BLOCK
      ?auto_445127 - BLOCK
      ?auto_445128 - BLOCK
      ?auto_445129 - BLOCK
      ?auto_445130 - BLOCK
      ?auto_445131 - BLOCK
      ?auto_445132 - BLOCK
      ?auto_445133 - BLOCK
    )
    :vars
    (
      ?auto_445134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445133 ?auto_445134 ) ( ON-TABLE ?auto_445125 ) ( ON ?auto_445126 ?auto_445125 ) ( ON ?auto_445127 ?auto_445126 ) ( ON ?auto_445128 ?auto_445127 ) ( not ( = ?auto_445125 ?auto_445126 ) ) ( not ( = ?auto_445125 ?auto_445127 ) ) ( not ( = ?auto_445125 ?auto_445128 ) ) ( not ( = ?auto_445125 ?auto_445129 ) ) ( not ( = ?auto_445125 ?auto_445130 ) ) ( not ( = ?auto_445125 ?auto_445131 ) ) ( not ( = ?auto_445125 ?auto_445132 ) ) ( not ( = ?auto_445125 ?auto_445133 ) ) ( not ( = ?auto_445125 ?auto_445134 ) ) ( not ( = ?auto_445126 ?auto_445127 ) ) ( not ( = ?auto_445126 ?auto_445128 ) ) ( not ( = ?auto_445126 ?auto_445129 ) ) ( not ( = ?auto_445126 ?auto_445130 ) ) ( not ( = ?auto_445126 ?auto_445131 ) ) ( not ( = ?auto_445126 ?auto_445132 ) ) ( not ( = ?auto_445126 ?auto_445133 ) ) ( not ( = ?auto_445126 ?auto_445134 ) ) ( not ( = ?auto_445127 ?auto_445128 ) ) ( not ( = ?auto_445127 ?auto_445129 ) ) ( not ( = ?auto_445127 ?auto_445130 ) ) ( not ( = ?auto_445127 ?auto_445131 ) ) ( not ( = ?auto_445127 ?auto_445132 ) ) ( not ( = ?auto_445127 ?auto_445133 ) ) ( not ( = ?auto_445127 ?auto_445134 ) ) ( not ( = ?auto_445128 ?auto_445129 ) ) ( not ( = ?auto_445128 ?auto_445130 ) ) ( not ( = ?auto_445128 ?auto_445131 ) ) ( not ( = ?auto_445128 ?auto_445132 ) ) ( not ( = ?auto_445128 ?auto_445133 ) ) ( not ( = ?auto_445128 ?auto_445134 ) ) ( not ( = ?auto_445129 ?auto_445130 ) ) ( not ( = ?auto_445129 ?auto_445131 ) ) ( not ( = ?auto_445129 ?auto_445132 ) ) ( not ( = ?auto_445129 ?auto_445133 ) ) ( not ( = ?auto_445129 ?auto_445134 ) ) ( not ( = ?auto_445130 ?auto_445131 ) ) ( not ( = ?auto_445130 ?auto_445132 ) ) ( not ( = ?auto_445130 ?auto_445133 ) ) ( not ( = ?auto_445130 ?auto_445134 ) ) ( not ( = ?auto_445131 ?auto_445132 ) ) ( not ( = ?auto_445131 ?auto_445133 ) ) ( not ( = ?auto_445131 ?auto_445134 ) ) ( not ( = ?auto_445132 ?auto_445133 ) ) ( not ( = ?auto_445132 ?auto_445134 ) ) ( not ( = ?auto_445133 ?auto_445134 ) ) ( ON ?auto_445132 ?auto_445133 ) ( ON ?auto_445131 ?auto_445132 ) ( ON ?auto_445130 ?auto_445131 ) ( CLEAR ?auto_445128 ) ( ON ?auto_445129 ?auto_445130 ) ( CLEAR ?auto_445129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_445125 ?auto_445126 ?auto_445127 ?auto_445128 ?auto_445129 )
      ( MAKE-9PILE ?auto_445125 ?auto_445126 ?auto_445127 ?auto_445128 ?auto_445129 ?auto_445130 ?auto_445131 ?auto_445132 ?auto_445133 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_445163 - BLOCK
      ?auto_445164 - BLOCK
      ?auto_445165 - BLOCK
      ?auto_445166 - BLOCK
      ?auto_445167 - BLOCK
      ?auto_445168 - BLOCK
      ?auto_445169 - BLOCK
      ?auto_445170 - BLOCK
      ?auto_445171 - BLOCK
    )
    :vars
    (
      ?auto_445172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445171 ?auto_445172 ) ( ON-TABLE ?auto_445163 ) ( ON ?auto_445164 ?auto_445163 ) ( ON ?auto_445165 ?auto_445164 ) ( not ( = ?auto_445163 ?auto_445164 ) ) ( not ( = ?auto_445163 ?auto_445165 ) ) ( not ( = ?auto_445163 ?auto_445166 ) ) ( not ( = ?auto_445163 ?auto_445167 ) ) ( not ( = ?auto_445163 ?auto_445168 ) ) ( not ( = ?auto_445163 ?auto_445169 ) ) ( not ( = ?auto_445163 ?auto_445170 ) ) ( not ( = ?auto_445163 ?auto_445171 ) ) ( not ( = ?auto_445163 ?auto_445172 ) ) ( not ( = ?auto_445164 ?auto_445165 ) ) ( not ( = ?auto_445164 ?auto_445166 ) ) ( not ( = ?auto_445164 ?auto_445167 ) ) ( not ( = ?auto_445164 ?auto_445168 ) ) ( not ( = ?auto_445164 ?auto_445169 ) ) ( not ( = ?auto_445164 ?auto_445170 ) ) ( not ( = ?auto_445164 ?auto_445171 ) ) ( not ( = ?auto_445164 ?auto_445172 ) ) ( not ( = ?auto_445165 ?auto_445166 ) ) ( not ( = ?auto_445165 ?auto_445167 ) ) ( not ( = ?auto_445165 ?auto_445168 ) ) ( not ( = ?auto_445165 ?auto_445169 ) ) ( not ( = ?auto_445165 ?auto_445170 ) ) ( not ( = ?auto_445165 ?auto_445171 ) ) ( not ( = ?auto_445165 ?auto_445172 ) ) ( not ( = ?auto_445166 ?auto_445167 ) ) ( not ( = ?auto_445166 ?auto_445168 ) ) ( not ( = ?auto_445166 ?auto_445169 ) ) ( not ( = ?auto_445166 ?auto_445170 ) ) ( not ( = ?auto_445166 ?auto_445171 ) ) ( not ( = ?auto_445166 ?auto_445172 ) ) ( not ( = ?auto_445167 ?auto_445168 ) ) ( not ( = ?auto_445167 ?auto_445169 ) ) ( not ( = ?auto_445167 ?auto_445170 ) ) ( not ( = ?auto_445167 ?auto_445171 ) ) ( not ( = ?auto_445167 ?auto_445172 ) ) ( not ( = ?auto_445168 ?auto_445169 ) ) ( not ( = ?auto_445168 ?auto_445170 ) ) ( not ( = ?auto_445168 ?auto_445171 ) ) ( not ( = ?auto_445168 ?auto_445172 ) ) ( not ( = ?auto_445169 ?auto_445170 ) ) ( not ( = ?auto_445169 ?auto_445171 ) ) ( not ( = ?auto_445169 ?auto_445172 ) ) ( not ( = ?auto_445170 ?auto_445171 ) ) ( not ( = ?auto_445170 ?auto_445172 ) ) ( not ( = ?auto_445171 ?auto_445172 ) ) ( ON ?auto_445170 ?auto_445171 ) ( ON ?auto_445169 ?auto_445170 ) ( ON ?auto_445168 ?auto_445169 ) ( ON ?auto_445167 ?auto_445168 ) ( CLEAR ?auto_445165 ) ( ON ?auto_445166 ?auto_445167 ) ( CLEAR ?auto_445166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_445163 ?auto_445164 ?auto_445165 ?auto_445166 )
      ( MAKE-9PILE ?auto_445163 ?auto_445164 ?auto_445165 ?auto_445166 ?auto_445167 ?auto_445168 ?auto_445169 ?auto_445170 ?auto_445171 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_445201 - BLOCK
      ?auto_445202 - BLOCK
      ?auto_445203 - BLOCK
      ?auto_445204 - BLOCK
      ?auto_445205 - BLOCK
      ?auto_445206 - BLOCK
      ?auto_445207 - BLOCK
      ?auto_445208 - BLOCK
      ?auto_445209 - BLOCK
    )
    :vars
    (
      ?auto_445210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445209 ?auto_445210 ) ( ON-TABLE ?auto_445201 ) ( ON ?auto_445202 ?auto_445201 ) ( not ( = ?auto_445201 ?auto_445202 ) ) ( not ( = ?auto_445201 ?auto_445203 ) ) ( not ( = ?auto_445201 ?auto_445204 ) ) ( not ( = ?auto_445201 ?auto_445205 ) ) ( not ( = ?auto_445201 ?auto_445206 ) ) ( not ( = ?auto_445201 ?auto_445207 ) ) ( not ( = ?auto_445201 ?auto_445208 ) ) ( not ( = ?auto_445201 ?auto_445209 ) ) ( not ( = ?auto_445201 ?auto_445210 ) ) ( not ( = ?auto_445202 ?auto_445203 ) ) ( not ( = ?auto_445202 ?auto_445204 ) ) ( not ( = ?auto_445202 ?auto_445205 ) ) ( not ( = ?auto_445202 ?auto_445206 ) ) ( not ( = ?auto_445202 ?auto_445207 ) ) ( not ( = ?auto_445202 ?auto_445208 ) ) ( not ( = ?auto_445202 ?auto_445209 ) ) ( not ( = ?auto_445202 ?auto_445210 ) ) ( not ( = ?auto_445203 ?auto_445204 ) ) ( not ( = ?auto_445203 ?auto_445205 ) ) ( not ( = ?auto_445203 ?auto_445206 ) ) ( not ( = ?auto_445203 ?auto_445207 ) ) ( not ( = ?auto_445203 ?auto_445208 ) ) ( not ( = ?auto_445203 ?auto_445209 ) ) ( not ( = ?auto_445203 ?auto_445210 ) ) ( not ( = ?auto_445204 ?auto_445205 ) ) ( not ( = ?auto_445204 ?auto_445206 ) ) ( not ( = ?auto_445204 ?auto_445207 ) ) ( not ( = ?auto_445204 ?auto_445208 ) ) ( not ( = ?auto_445204 ?auto_445209 ) ) ( not ( = ?auto_445204 ?auto_445210 ) ) ( not ( = ?auto_445205 ?auto_445206 ) ) ( not ( = ?auto_445205 ?auto_445207 ) ) ( not ( = ?auto_445205 ?auto_445208 ) ) ( not ( = ?auto_445205 ?auto_445209 ) ) ( not ( = ?auto_445205 ?auto_445210 ) ) ( not ( = ?auto_445206 ?auto_445207 ) ) ( not ( = ?auto_445206 ?auto_445208 ) ) ( not ( = ?auto_445206 ?auto_445209 ) ) ( not ( = ?auto_445206 ?auto_445210 ) ) ( not ( = ?auto_445207 ?auto_445208 ) ) ( not ( = ?auto_445207 ?auto_445209 ) ) ( not ( = ?auto_445207 ?auto_445210 ) ) ( not ( = ?auto_445208 ?auto_445209 ) ) ( not ( = ?auto_445208 ?auto_445210 ) ) ( not ( = ?auto_445209 ?auto_445210 ) ) ( ON ?auto_445208 ?auto_445209 ) ( ON ?auto_445207 ?auto_445208 ) ( ON ?auto_445206 ?auto_445207 ) ( ON ?auto_445205 ?auto_445206 ) ( ON ?auto_445204 ?auto_445205 ) ( CLEAR ?auto_445202 ) ( ON ?auto_445203 ?auto_445204 ) ( CLEAR ?auto_445203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_445201 ?auto_445202 ?auto_445203 )
      ( MAKE-9PILE ?auto_445201 ?auto_445202 ?auto_445203 ?auto_445204 ?auto_445205 ?auto_445206 ?auto_445207 ?auto_445208 ?auto_445209 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_445239 - BLOCK
      ?auto_445240 - BLOCK
      ?auto_445241 - BLOCK
      ?auto_445242 - BLOCK
      ?auto_445243 - BLOCK
      ?auto_445244 - BLOCK
      ?auto_445245 - BLOCK
      ?auto_445246 - BLOCK
      ?auto_445247 - BLOCK
    )
    :vars
    (
      ?auto_445248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445247 ?auto_445248 ) ( ON-TABLE ?auto_445239 ) ( not ( = ?auto_445239 ?auto_445240 ) ) ( not ( = ?auto_445239 ?auto_445241 ) ) ( not ( = ?auto_445239 ?auto_445242 ) ) ( not ( = ?auto_445239 ?auto_445243 ) ) ( not ( = ?auto_445239 ?auto_445244 ) ) ( not ( = ?auto_445239 ?auto_445245 ) ) ( not ( = ?auto_445239 ?auto_445246 ) ) ( not ( = ?auto_445239 ?auto_445247 ) ) ( not ( = ?auto_445239 ?auto_445248 ) ) ( not ( = ?auto_445240 ?auto_445241 ) ) ( not ( = ?auto_445240 ?auto_445242 ) ) ( not ( = ?auto_445240 ?auto_445243 ) ) ( not ( = ?auto_445240 ?auto_445244 ) ) ( not ( = ?auto_445240 ?auto_445245 ) ) ( not ( = ?auto_445240 ?auto_445246 ) ) ( not ( = ?auto_445240 ?auto_445247 ) ) ( not ( = ?auto_445240 ?auto_445248 ) ) ( not ( = ?auto_445241 ?auto_445242 ) ) ( not ( = ?auto_445241 ?auto_445243 ) ) ( not ( = ?auto_445241 ?auto_445244 ) ) ( not ( = ?auto_445241 ?auto_445245 ) ) ( not ( = ?auto_445241 ?auto_445246 ) ) ( not ( = ?auto_445241 ?auto_445247 ) ) ( not ( = ?auto_445241 ?auto_445248 ) ) ( not ( = ?auto_445242 ?auto_445243 ) ) ( not ( = ?auto_445242 ?auto_445244 ) ) ( not ( = ?auto_445242 ?auto_445245 ) ) ( not ( = ?auto_445242 ?auto_445246 ) ) ( not ( = ?auto_445242 ?auto_445247 ) ) ( not ( = ?auto_445242 ?auto_445248 ) ) ( not ( = ?auto_445243 ?auto_445244 ) ) ( not ( = ?auto_445243 ?auto_445245 ) ) ( not ( = ?auto_445243 ?auto_445246 ) ) ( not ( = ?auto_445243 ?auto_445247 ) ) ( not ( = ?auto_445243 ?auto_445248 ) ) ( not ( = ?auto_445244 ?auto_445245 ) ) ( not ( = ?auto_445244 ?auto_445246 ) ) ( not ( = ?auto_445244 ?auto_445247 ) ) ( not ( = ?auto_445244 ?auto_445248 ) ) ( not ( = ?auto_445245 ?auto_445246 ) ) ( not ( = ?auto_445245 ?auto_445247 ) ) ( not ( = ?auto_445245 ?auto_445248 ) ) ( not ( = ?auto_445246 ?auto_445247 ) ) ( not ( = ?auto_445246 ?auto_445248 ) ) ( not ( = ?auto_445247 ?auto_445248 ) ) ( ON ?auto_445246 ?auto_445247 ) ( ON ?auto_445245 ?auto_445246 ) ( ON ?auto_445244 ?auto_445245 ) ( ON ?auto_445243 ?auto_445244 ) ( ON ?auto_445242 ?auto_445243 ) ( ON ?auto_445241 ?auto_445242 ) ( CLEAR ?auto_445239 ) ( ON ?auto_445240 ?auto_445241 ) ( CLEAR ?auto_445240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_445239 ?auto_445240 )
      ( MAKE-9PILE ?auto_445239 ?auto_445240 ?auto_445241 ?auto_445242 ?auto_445243 ?auto_445244 ?auto_445245 ?auto_445246 ?auto_445247 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_445277 - BLOCK
      ?auto_445278 - BLOCK
      ?auto_445279 - BLOCK
      ?auto_445280 - BLOCK
      ?auto_445281 - BLOCK
      ?auto_445282 - BLOCK
      ?auto_445283 - BLOCK
      ?auto_445284 - BLOCK
      ?auto_445285 - BLOCK
    )
    :vars
    (
      ?auto_445286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445285 ?auto_445286 ) ( not ( = ?auto_445277 ?auto_445278 ) ) ( not ( = ?auto_445277 ?auto_445279 ) ) ( not ( = ?auto_445277 ?auto_445280 ) ) ( not ( = ?auto_445277 ?auto_445281 ) ) ( not ( = ?auto_445277 ?auto_445282 ) ) ( not ( = ?auto_445277 ?auto_445283 ) ) ( not ( = ?auto_445277 ?auto_445284 ) ) ( not ( = ?auto_445277 ?auto_445285 ) ) ( not ( = ?auto_445277 ?auto_445286 ) ) ( not ( = ?auto_445278 ?auto_445279 ) ) ( not ( = ?auto_445278 ?auto_445280 ) ) ( not ( = ?auto_445278 ?auto_445281 ) ) ( not ( = ?auto_445278 ?auto_445282 ) ) ( not ( = ?auto_445278 ?auto_445283 ) ) ( not ( = ?auto_445278 ?auto_445284 ) ) ( not ( = ?auto_445278 ?auto_445285 ) ) ( not ( = ?auto_445278 ?auto_445286 ) ) ( not ( = ?auto_445279 ?auto_445280 ) ) ( not ( = ?auto_445279 ?auto_445281 ) ) ( not ( = ?auto_445279 ?auto_445282 ) ) ( not ( = ?auto_445279 ?auto_445283 ) ) ( not ( = ?auto_445279 ?auto_445284 ) ) ( not ( = ?auto_445279 ?auto_445285 ) ) ( not ( = ?auto_445279 ?auto_445286 ) ) ( not ( = ?auto_445280 ?auto_445281 ) ) ( not ( = ?auto_445280 ?auto_445282 ) ) ( not ( = ?auto_445280 ?auto_445283 ) ) ( not ( = ?auto_445280 ?auto_445284 ) ) ( not ( = ?auto_445280 ?auto_445285 ) ) ( not ( = ?auto_445280 ?auto_445286 ) ) ( not ( = ?auto_445281 ?auto_445282 ) ) ( not ( = ?auto_445281 ?auto_445283 ) ) ( not ( = ?auto_445281 ?auto_445284 ) ) ( not ( = ?auto_445281 ?auto_445285 ) ) ( not ( = ?auto_445281 ?auto_445286 ) ) ( not ( = ?auto_445282 ?auto_445283 ) ) ( not ( = ?auto_445282 ?auto_445284 ) ) ( not ( = ?auto_445282 ?auto_445285 ) ) ( not ( = ?auto_445282 ?auto_445286 ) ) ( not ( = ?auto_445283 ?auto_445284 ) ) ( not ( = ?auto_445283 ?auto_445285 ) ) ( not ( = ?auto_445283 ?auto_445286 ) ) ( not ( = ?auto_445284 ?auto_445285 ) ) ( not ( = ?auto_445284 ?auto_445286 ) ) ( not ( = ?auto_445285 ?auto_445286 ) ) ( ON ?auto_445284 ?auto_445285 ) ( ON ?auto_445283 ?auto_445284 ) ( ON ?auto_445282 ?auto_445283 ) ( ON ?auto_445281 ?auto_445282 ) ( ON ?auto_445280 ?auto_445281 ) ( ON ?auto_445279 ?auto_445280 ) ( ON ?auto_445278 ?auto_445279 ) ( ON ?auto_445277 ?auto_445278 ) ( CLEAR ?auto_445277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_445277 )
      ( MAKE-9PILE ?auto_445277 ?auto_445278 ?auto_445279 ?auto_445280 ?auto_445281 ?auto_445282 ?auto_445283 ?auto_445284 ?auto_445285 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_445316 - BLOCK
      ?auto_445317 - BLOCK
      ?auto_445318 - BLOCK
      ?auto_445319 - BLOCK
      ?auto_445320 - BLOCK
      ?auto_445321 - BLOCK
      ?auto_445322 - BLOCK
      ?auto_445323 - BLOCK
      ?auto_445324 - BLOCK
      ?auto_445325 - BLOCK
    )
    :vars
    (
      ?auto_445326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_445324 ) ( ON ?auto_445325 ?auto_445326 ) ( CLEAR ?auto_445325 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_445316 ) ( ON ?auto_445317 ?auto_445316 ) ( ON ?auto_445318 ?auto_445317 ) ( ON ?auto_445319 ?auto_445318 ) ( ON ?auto_445320 ?auto_445319 ) ( ON ?auto_445321 ?auto_445320 ) ( ON ?auto_445322 ?auto_445321 ) ( ON ?auto_445323 ?auto_445322 ) ( ON ?auto_445324 ?auto_445323 ) ( not ( = ?auto_445316 ?auto_445317 ) ) ( not ( = ?auto_445316 ?auto_445318 ) ) ( not ( = ?auto_445316 ?auto_445319 ) ) ( not ( = ?auto_445316 ?auto_445320 ) ) ( not ( = ?auto_445316 ?auto_445321 ) ) ( not ( = ?auto_445316 ?auto_445322 ) ) ( not ( = ?auto_445316 ?auto_445323 ) ) ( not ( = ?auto_445316 ?auto_445324 ) ) ( not ( = ?auto_445316 ?auto_445325 ) ) ( not ( = ?auto_445316 ?auto_445326 ) ) ( not ( = ?auto_445317 ?auto_445318 ) ) ( not ( = ?auto_445317 ?auto_445319 ) ) ( not ( = ?auto_445317 ?auto_445320 ) ) ( not ( = ?auto_445317 ?auto_445321 ) ) ( not ( = ?auto_445317 ?auto_445322 ) ) ( not ( = ?auto_445317 ?auto_445323 ) ) ( not ( = ?auto_445317 ?auto_445324 ) ) ( not ( = ?auto_445317 ?auto_445325 ) ) ( not ( = ?auto_445317 ?auto_445326 ) ) ( not ( = ?auto_445318 ?auto_445319 ) ) ( not ( = ?auto_445318 ?auto_445320 ) ) ( not ( = ?auto_445318 ?auto_445321 ) ) ( not ( = ?auto_445318 ?auto_445322 ) ) ( not ( = ?auto_445318 ?auto_445323 ) ) ( not ( = ?auto_445318 ?auto_445324 ) ) ( not ( = ?auto_445318 ?auto_445325 ) ) ( not ( = ?auto_445318 ?auto_445326 ) ) ( not ( = ?auto_445319 ?auto_445320 ) ) ( not ( = ?auto_445319 ?auto_445321 ) ) ( not ( = ?auto_445319 ?auto_445322 ) ) ( not ( = ?auto_445319 ?auto_445323 ) ) ( not ( = ?auto_445319 ?auto_445324 ) ) ( not ( = ?auto_445319 ?auto_445325 ) ) ( not ( = ?auto_445319 ?auto_445326 ) ) ( not ( = ?auto_445320 ?auto_445321 ) ) ( not ( = ?auto_445320 ?auto_445322 ) ) ( not ( = ?auto_445320 ?auto_445323 ) ) ( not ( = ?auto_445320 ?auto_445324 ) ) ( not ( = ?auto_445320 ?auto_445325 ) ) ( not ( = ?auto_445320 ?auto_445326 ) ) ( not ( = ?auto_445321 ?auto_445322 ) ) ( not ( = ?auto_445321 ?auto_445323 ) ) ( not ( = ?auto_445321 ?auto_445324 ) ) ( not ( = ?auto_445321 ?auto_445325 ) ) ( not ( = ?auto_445321 ?auto_445326 ) ) ( not ( = ?auto_445322 ?auto_445323 ) ) ( not ( = ?auto_445322 ?auto_445324 ) ) ( not ( = ?auto_445322 ?auto_445325 ) ) ( not ( = ?auto_445322 ?auto_445326 ) ) ( not ( = ?auto_445323 ?auto_445324 ) ) ( not ( = ?auto_445323 ?auto_445325 ) ) ( not ( = ?auto_445323 ?auto_445326 ) ) ( not ( = ?auto_445324 ?auto_445325 ) ) ( not ( = ?auto_445324 ?auto_445326 ) ) ( not ( = ?auto_445325 ?auto_445326 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_445325 ?auto_445326 )
      ( !STACK ?auto_445325 ?auto_445324 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_445358 - BLOCK
      ?auto_445359 - BLOCK
      ?auto_445360 - BLOCK
      ?auto_445361 - BLOCK
      ?auto_445362 - BLOCK
      ?auto_445363 - BLOCK
      ?auto_445364 - BLOCK
      ?auto_445365 - BLOCK
      ?auto_445366 - BLOCK
      ?auto_445367 - BLOCK
    )
    :vars
    (
      ?auto_445368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445367 ?auto_445368 ) ( ON-TABLE ?auto_445358 ) ( ON ?auto_445359 ?auto_445358 ) ( ON ?auto_445360 ?auto_445359 ) ( ON ?auto_445361 ?auto_445360 ) ( ON ?auto_445362 ?auto_445361 ) ( ON ?auto_445363 ?auto_445362 ) ( ON ?auto_445364 ?auto_445363 ) ( ON ?auto_445365 ?auto_445364 ) ( not ( = ?auto_445358 ?auto_445359 ) ) ( not ( = ?auto_445358 ?auto_445360 ) ) ( not ( = ?auto_445358 ?auto_445361 ) ) ( not ( = ?auto_445358 ?auto_445362 ) ) ( not ( = ?auto_445358 ?auto_445363 ) ) ( not ( = ?auto_445358 ?auto_445364 ) ) ( not ( = ?auto_445358 ?auto_445365 ) ) ( not ( = ?auto_445358 ?auto_445366 ) ) ( not ( = ?auto_445358 ?auto_445367 ) ) ( not ( = ?auto_445358 ?auto_445368 ) ) ( not ( = ?auto_445359 ?auto_445360 ) ) ( not ( = ?auto_445359 ?auto_445361 ) ) ( not ( = ?auto_445359 ?auto_445362 ) ) ( not ( = ?auto_445359 ?auto_445363 ) ) ( not ( = ?auto_445359 ?auto_445364 ) ) ( not ( = ?auto_445359 ?auto_445365 ) ) ( not ( = ?auto_445359 ?auto_445366 ) ) ( not ( = ?auto_445359 ?auto_445367 ) ) ( not ( = ?auto_445359 ?auto_445368 ) ) ( not ( = ?auto_445360 ?auto_445361 ) ) ( not ( = ?auto_445360 ?auto_445362 ) ) ( not ( = ?auto_445360 ?auto_445363 ) ) ( not ( = ?auto_445360 ?auto_445364 ) ) ( not ( = ?auto_445360 ?auto_445365 ) ) ( not ( = ?auto_445360 ?auto_445366 ) ) ( not ( = ?auto_445360 ?auto_445367 ) ) ( not ( = ?auto_445360 ?auto_445368 ) ) ( not ( = ?auto_445361 ?auto_445362 ) ) ( not ( = ?auto_445361 ?auto_445363 ) ) ( not ( = ?auto_445361 ?auto_445364 ) ) ( not ( = ?auto_445361 ?auto_445365 ) ) ( not ( = ?auto_445361 ?auto_445366 ) ) ( not ( = ?auto_445361 ?auto_445367 ) ) ( not ( = ?auto_445361 ?auto_445368 ) ) ( not ( = ?auto_445362 ?auto_445363 ) ) ( not ( = ?auto_445362 ?auto_445364 ) ) ( not ( = ?auto_445362 ?auto_445365 ) ) ( not ( = ?auto_445362 ?auto_445366 ) ) ( not ( = ?auto_445362 ?auto_445367 ) ) ( not ( = ?auto_445362 ?auto_445368 ) ) ( not ( = ?auto_445363 ?auto_445364 ) ) ( not ( = ?auto_445363 ?auto_445365 ) ) ( not ( = ?auto_445363 ?auto_445366 ) ) ( not ( = ?auto_445363 ?auto_445367 ) ) ( not ( = ?auto_445363 ?auto_445368 ) ) ( not ( = ?auto_445364 ?auto_445365 ) ) ( not ( = ?auto_445364 ?auto_445366 ) ) ( not ( = ?auto_445364 ?auto_445367 ) ) ( not ( = ?auto_445364 ?auto_445368 ) ) ( not ( = ?auto_445365 ?auto_445366 ) ) ( not ( = ?auto_445365 ?auto_445367 ) ) ( not ( = ?auto_445365 ?auto_445368 ) ) ( not ( = ?auto_445366 ?auto_445367 ) ) ( not ( = ?auto_445366 ?auto_445368 ) ) ( not ( = ?auto_445367 ?auto_445368 ) ) ( CLEAR ?auto_445365 ) ( ON ?auto_445366 ?auto_445367 ) ( CLEAR ?auto_445366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_445358 ?auto_445359 ?auto_445360 ?auto_445361 ?auto_445362 ?auto_445363 ?auto_445364 ?auto_445365 ?auto_445366 )
      ( MAKE-10PILE ?auto_445358 ?auto_445359 ?auto_445360 ?auto_445361 ?auto_445362 ?auto_445363 ?auto_445364 ?auto_445365 ?auto_445366 ?auto_445367 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_445400 - BLOCK
      ?auto_445401 - BLOCK
      ?auto_445402 - BLOCK
      ?auto_445403 - BLOCK
      ?auto_445404 - BLOCK
      ?auto_445405 - BLOCK
      ?auto_445406 - BLOCK
      ?auto_445407 - BLOCK
      ?auto_445408 - BLOCK
      ?auto_445409 - BLOCK
    )
    :vars
    (
      ?auto_445410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445409 ?auto_445410 ) ( ON-TABLE ?auto_445400 ) ( ON ?auto_445401 ?auto_445400 ) ( ON ?auto_445402 ?auto_445401 ) ( ON ?auto_445403 ?auto_445402 ) ( ON ?auto_445404 ?auto_445403 ) ( ON ?auto_445405 ?auto_445404 ) ( ON ?auto_445406 ?auto_445405 ) ( not ( = ?auto_445400 ?auto_445401 ) ) ( not ( = ?auto_445400 ?auto_445402 ) ) ( not ( = ?auto_445400 ?auto_445403 ) ) ( not ( = ?auto_445400 ?auto_445404 ) ) ( not ( = ?auto_445400 ?auto_445405 ) ) ( not ( = ?auto_445400 ?auto_445406 ) ) ( not ( = ?auto_445400 ?auto_445407 ) ) ( not ( = ?auto_445400 ?auto_445408 ) ) ( not ( = ?auto_445400 ?auto_445409 ) ) ( not ( = ?auto_445400 ?auto_445410 ) ) ( not ( = ?auto_445401 ?auto_445402 ) ) ( not ( = ?auto_445401 ?auto_445403 ) ) ( not ( = ?auto_445401 ?auto_445404 ) ) ( not ( = ?auto_445401 ?auto_445405 ) ) ( not ( = ?auto_445401 ?auto_445406 ) ) ( not ( = ?auto_445401 ?auto_445407 ) ) ( not ( = ?auto_445401 ?auto_445408 ) ) ( not ( = ?auto_445401 ?auto_445409 ) ) ( not ( = ?auto_445401 ?auto_445410 ) ) ( not ( = ?auto_445402 ?auto_445403 ) ) ( not ( = ?auto_445402 ?auto_445404 ) ) ( not ( = ?auto_445402 ?auto_445405 ) ) ( not ( = ?auto_445402 ?auto_445406 ) ) ( not ( = ?auto_445402 ?auto_445407 ) ) ( not ( = ?auto_445402 ?auto_445408 ) ) ( not ( = ?auto_445402 ?auto_445409 ) ) ( not ( = ?auto_445402 ?auto_445410 ) ) ( not ( = ?auto_445403 ?auto_445404 ) ) ( not ( = ?auto_445403 ?auto_445405 ) ) ( not ( = ?auto_445403 ?auto_445406 ) ) ( not ( = ?auto_445403 ?auto_445407 ) ) ( not ( = ?auto_445403 ?auto_445408 ) ) ( not ( = ?auto_445403 ?auto_445409 ) ) ( not ( = ?auto_445403 ?auto_445410 ) ) ( not ( = ?auto_445404 ?auto_445405 ) ) ( not ( = ?auto_445404 ?auto_445406 ) ) ( not ( = ?auto_445404 ?auto_445407 ) ) ( not ( = ?auto_445404 ?auto_445408 ) ) ( not ( = ?auto_445404 ?auto_445409 ) ) ( not ( = ?auto_445404 ?auto_445410 ) ) ( not ( = ?auto_445405 ?auto_445406 ) ) ( not ( = ?auto_445405 ?auto_445407 ) ) ( not ( = ?auto_445405 ?auto_445408 ) ) ( not ( = ?auto_445405 ?auto_445409 ) ) ( not ( = ?auto_445405 ?auto_445410 ) ) ( not ( = ?auto_445406 ?auto_445407 ) ) ( not ( = ?auto_445406 ?auto_445408 ) ) ( not ( = ?auto_445406 ?auto_445409 ) ) ( not ( = ?auto_445406 ?auto_445410 ) ) ( not ( = ?auto_445407 ?auto_445408 ) ) ( not ( = ?auto_445407 ?auto_445409 ) ) ( not ( = ?auto_445407 ?auto_445410 ) ) ( not ( = ?auto_445408 ?auto_445409 ) ) ( not ( = ?auto_445408 ?auto_445410 ) ) ( not ( = ?auto_445409 ?auto_445410 ) ) ( ON ?auto_445408 ?auto_445409 ) ( CLEAR ?auto_445406 ) ( ON ?auto_445407 ?auto_445408 ) ( CLEAR ?auto_445407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_445400 ?auto_445401 ?auto_445402 ?auto_445403 ?auto_445404 ?auto_445405 ?auto_445406 ?auto_445407 )
      ( MAKE-10PILE ?auto_445400 ?auto_445401 ?auto_445402 ?auto_445403 ?auto_445404 ?auto_445405 ?auto_445406 ?auto_445407 ?auto_445408 ?auto_445409 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_445442 - BLOCK
      ?auto_445443 - BLOCK
      ?auto_445444 - BLOCK
      ?auto_445445 - BLOCK
      ?auto_445446 - BLOCK
      ?auto_445447 - BLOCK
      ?auto_445448 - BLOCK
      ?auto_445449 - BLOCK
      ?auto_445450 - BLOCK
      ?auto_445451 - BLOCK
    )
    :vars
    (
      ?auto_445452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445451 ?auto_445452 ) ( ON-TABLE ?auto_445442 ) ( ON ?auto_445443 ?auto_445442 ) ( ON ?auto_445444 ?auto_445443 ) ( ON ?auto_445445 ?auto_445444 ) ( ON ?auto_445446 ?auto_445445 ) ( ON ?auto_445447 ?auto_445446 ) ( not ( = ?auto_445442 ?auto_445443 ) ) ( not ( = ?auto_445442 ?auto_445444 ) ) ( not ( = ?auto_445442 ?auto_445445 ) ) ( not ( = ?auto_445442 ?auto_445446 ) ) ( not ( = ?auto_445442 ?auto_445447 ) ) ( not ( = ?auto_445442 ?auto_445448 ) ) ( not ( = ?auto_445442 ?auto_445449 ) ) ( not ( = ?auto_445442 ?auto_445450 ) ) ( not ( = ?auto_445442 ?auto_445451 ) ) ( not ( = ?auto_445442 ?auto_445452 ) ) ( not ( = ?auto_445443 ?auto_445444 ) ) ( not ( = ?auto_445443 ?auto_445445 ) ) ( not ( = ?auto_445443 ?auto_445446 ) ) ( not ( = ?auto_445443 ?auto_445447 ) ) ( not ( = ?auto_445443 ?auto_445448 ) ) ( not ( = ?auto_445443 ?auto_445449 ) ) ( not ( = ?auto_445443 ?auto_445450 ) ) ( not ( = ?auto_445443 ?auto_445451 ) ) ( not ( = ?auto_445443 ?auto_445452 ) ) ( not ( = ?auto_445444 ?auto_445445 ) ) ( not ( = ?auto_445444 ?auto_445446 ) ) ( not ( = ?auto_445444 ?auto_445447 ) ) ( not ( = ?auto_445444 ?auto_445448 ) ) ( not ( = ?auto_445444 ?auto_445449 ) ) ( not ( = ?auto_445444 ?auto_445450 ) ) ( not ( = ?auto_445444 ?auto_445451 ) ) ( not ( = ?auto_445444 ?auto_445452 ) ) ( not ( = ?auto_445445 ?auto_445446 ) ) ( not ( = ?auto_445445 ?auto_445447 ) ) ( not ( = ?auto_445445 ?auto_445448 ) ) ( not ( = ?auto_445445 ?auto_445449 ) ) ( not ( = ?auto_445445 ?auto_445450 ) ) ( not ( = ?auto_445445 ?auto_445451 ) ) ( not ( = ?auto_445445 ?auto_445452 ) ) ( not ( = ?auto_445446 ?auto_445447 ) ) ( not ( = ?auto_445446 ?auto_445448 ) ) ( not ( = ?auto_445446 ?auto_445449 ) ) ( not ( = ?auto_445446 ?auto_445450 ) ) ( not ( = ?auto_445446 ?auto_445451 ) ) ( not ( = ?auto_445446 ?auto_445452 ) ) ( not ( = ?auto_445447 ?auto_445448 ) ) ( not ( = ?auto_445447 ?auto_445449 ) ) ( not ( = ?auto_445447 ?auto_445450 ) ) ( not ( = ?auto_445447 ?auto_445451 ) ) ( not ( = ?auto_445447 ?auto_445452 ) ) ( not ( = ?auto_445448 ?auto_445449 ) ) ( not ( = ?auto_445448 ?auto_445450 ) ) ( not ( = ?auto_445448 ?auto_445451 ) ) ( not ( = ?auto_445448 ?auto_445452 ) ) ( not ( = ?auto_445449 ?auto_445450 ) ) ( not ( = ?auto_445449 ?auto_445451 ) ) ( not ( = ?auto_445449 ?auto_445452 ) ) ( not ( = ?auto_445450 ?auto_445451 ) ) ( not ( = ?auto_445450 ?auto_445452 ) ) ( not ( = ?auto_445451 ?auto_445452 ) ) ( ON ?auto_445450 ?auto_445451 ) ( ON ?auto_445449 ?auto_445450 ) ( CLEAR ?auto_445447 ) ( ON ?auto_445448 ?auto_445449 ) ( CLEAR ?auto_445448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_445442 ?auto_445443 ?auto_445444 ?auto_445445 ?auto_445446 ?auto_445447 ?auto_445448 )
      ( MAKE-10PILE ?auto_445442 ?auto_445443 ?auto_445444 ?auto_445445 ?auto_445446 ?auto_445447 ?auto_445448 ?auto_445449 ?auto_445450 ?auto_445451 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_445484 - BLOCK
      ?auto_445485 - BLOCK
      ?auto_445486 - BLOCK
      ?auto_445487 - BLOCK
      ?auto_445488 - BLOCK
      ?auto_445489 - BLOCK
      ?auto_445490 - BLOCK
      ?auto_445491 - BLOCK
      ?auto_445492 - BLOCK
      ?auto_445493 - BLOCK
    )
    :vars
    (
      ?auto_445494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445493 ?auto_445494 ) ( ON-TABLE ?auto_445484 ) ( ON ?auto_445485 ?auto_445484 ) ( ON ?auto_445486 ?auto_445485 ) ( ON ?auto_445487 ?auto_445486 ) ( ON ?auto_445488 ?auto_445487 ) ( not ( = ?auto_445484 ?auto_445485 ) ) ( not ( = ?auto_445484 ?auto_445486 ) ) ( not ( = ?auto_445484 ?auto_445487 ) ) ( not ( = ?auto_445484 ?auto_445488 ) ) ( not ( = ?auto_445484 ?auto_445489 ) ) ( not ( = ?auto_445484 ?auto_445490 ) ) ( not ( = ?auto_445484 ?auto_445491 ) ) ( not ( = ?auto_445484 ?auto_445492 ) ) ( not ( = ?auto_445484 ?auto_445493 ) ) ( not ( = ?auto_445484 ?auto_445494 ) ) ( not ( = ?auto_445485 ?auto_445486 ) ) ( not ( = ?auto_445485 ?auto_445487 ) ) ( not ( = ?auto_445485 ?auto_445488 ) ) ( not ( = ?auto_445485 ?auto_445489 ) ) ( not ( = ?auto_445485 ?auto_445490 ) ) ( not ( = ?auto_445485 ?auto_445491 ) ) ( not ( = ?auto_445485 ?auto_445492 ) ) ( not ( = ?auto_445485 ?auto_445493 ) ) ( not ( = ?auto_445485 ?auto_445494 ) ) ( not ( = ?auto_445486 ?auto_445487 ) ) ( not ( = ?auto_445486 ?auto_445488 ) ) ( not ( = ?auto_445486 ?auto_445489 ) ) ( not ( = ?auto_445486 ?auto_445490 ) ) ( not ( = ?auto_445486 ?auto_445491 ) ) ( not ( = ?auto_445486 ?auto_445492 ) ) ( not ( = ?auto_445486 ?auto_445493 ) ) ( not ( = ?auto_445486 ?auto_445494 ) ) ( not ( = ?auto_445487 ?auto_445488 ) ) ( not ( = ?auto_445487 ?auto_445489 ) ) ( not ( = ?auto_445487 ?auto_445490 ) ) ( not ( = ?auto_445487 ?auto_445491 ) ) ( not ( = ?auto_445487 ?auto_445492 ) ) ( not ( = ?auto_445487 ?auto_445493 ) ) ( not ( = ?auto_445487 ?auto_445494 ) ) ( not ( = ?auto_445488 ?auto_445489 ) ) ( not ( = ?auto_445488 ?auto_445490 ) ) ( not ( = ?auto_445488 ?auto_445491 ) ) ( not ( = ?auto_445488 ?auto_445492 ) ) ( not ( = ?auto_445488 ?auto_445493 ) ) ( not ( = ?auto_445488 ?auto_445494 ) ) ( not ( = ?auto_445489 ?auto_445490 ) ) ( not ( = ?auto_445489 ?auto_445491 ) ) ( not ( = ?auto_445489 ?auto_445492 ) ) ( not ( = ?auto_445489 ?auto_445493 ) ) ( not ( = ?auto_445489 ?auto_445494 ) ) ( not ( = ?auto_445490 ?auto_445491 ) ) ( not ( = ?auto_445490 ?auto_445492 ) ) ( not ( = ?auto_445490 ?auto_445493 ) ) ( not ( = ?auto_445490 ?auto_445494 ) ) ( not ( = ?auto_445491 ?auto_445492 ) ) ( not ( = ?auto_445491 ?auto_445493 ) ) ( not ( = ?auto_445491 ?auto_445494 ) ) ( not ( = ?auto_445492 ?auto_445493 ) ) ( not ( = ?auto_445492 ?auto_445494 ) ) ( not ( = ?auto_445493 ?auto_445494 ) ) ( ON ?auto_445492 ?auto_445493 ) ( ON ?auto_445491 ?auto_445492 ) ( ON ?auto_445490 ?auto_445491 ) ( CLEAR ?auto_445488 ) ( ON ?auto_445489 ?auto_445490 ) ( CLEAR ?auto_445489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_445484 ?auto_445485 ?auto_445486 ?auto_445487 ?auto_445488 ?auto_445489 )
      ( MAKE-10PILE ?auto_445484 ?auto_445485 ?auto_445486 ?auto_445487 ?auto_445488 ?auto_445489 ?auto_445490 ?auto_445491 ?auto_445492 ?auto_445493 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_445526 - BLOCK
      ?auto_445527 - BLOCK
      ?auto_445528 - BLOCK
      ?auto_445529 - BLOCK
      ?auto_445530 - BLOCK
      ?auto_445531 - BLOCK
      ?auto_445532 - BLOCK
      ?auto_445533 - BLOCK
      ?auto_445534 - BLOCK
      ?auto_445535 - BLOCK
    )
    :vars
    (
      ?auto_445536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445535 ?auto_445536 ) ( ON-TABLE ?auto_445526 ) ( ON ?auto_445527 ?auto_445526 ) ( ON ?auto_445528 ?auto_445527 ) ( ON ?auto_445529 ?auto_445528 ) ( not ( = ?auto_445526 ?auto_445527 ) ) ( not ( = ?auto_445526 ?auto_445528 ) ) ( not ( = ?auto_445526 ?auto_445529 ) ) ( not ( = ?auto_445526 ?auto_445530 ) ) ( not ( = ?auto_445526 ?auto_445531 ) ) ( not ( = ?auto_445526 ?auto_445532 ) ) ( not ( = ?auto_445526 ?auto_445533 ) ) ( not ( = ?auto_445526 ?auto_445534 ) ) ( not ( = ?auto_445526 ?auto_445535 ) ) ( not ( = ?auto_445526 ?auto_445536 ) ) ( not ( = ?auto_445527 ?auto_445528 ) ) ( not ( = ?auto_445527 ?auto_445529 ) ) ( not ( = ?auto_445527 ?auto_445530 ) ) ( not ( = ?auto_445527 ?auto_445531 ) ) ( not ( = ?auto_445527 ?auto_445532 ) ) ( not ( = ?auto_445527 ?auto_445533 ) ) ( not ( = ?auto_445527 ?auto_445534 ) ) ( not ( = ?auto_445527 ?auto_445535 ) ) ( not ( = ?auto_445527 ?auto_445536 ) ) ( not ( = ?auto_445528 ?auto_445529 ) ) ( not ( = ?auto_445528 ?auto_445530 ) ) ( not ( = ?auto_445528 ?auto_445531 ) ) ( not ( = ?auto_445528 ?auto_445532 ) ) ( not ( = ?auto_445528 ?auto_445533 ) ) ( not ( = ?auto_445528 ?auto_445534 ) ) ( not ( = ?auto_445528 ?auto_445535 ) ) ( not ( = ?auto_445528 ?auto_445536 ) ) ( not ( = ?auto_445529 ?auto_445530 ) ) ( not ( = ?auto_445529 ?auto_445531 ) ) ( not ( = ?auto_445529 ?auto_445532 ) ) ( not ( = ?auto_445529 ?auto_445533 ) ) ( not ( = ?auto_445529 ?auto_445534 ) ) ( not ( = ?auto_445529 ?auto_445535 ) ) ( not ( = ?auto_445529 ?auto_445536 ) ) ( not ( = ?auto_445530 ?auto_445531 ) ) ( not ( = ?auto_445530 ?auto_445532 ) ) ( not ( = ?auto_445530 ?auto_445533 ) ) ( not ( = ?auto_445530 ?auto_445534 ) ) ( not ( = ?auto_445530 ?auto_445535 ) ) ( not ( = ?auto_445530 ?auto_445536 ) ) ( not ( = ?auto_445531 ?auto_445532 ) ) ( not ( = ?auto_445531 ?auto_445533 ) ) ( not ( = ?auto_445531 ?auto_445534 ) ) ( not ( = ?auto_445531 ?auto_445535 ) ) ( not ( = ?auto_445531 ?auto_445536 ) ) ( not ( = ?auto_445532 ?auto_445533 ) ) ( not ( = ?auto_445532 ?auto_445534 ) ) ( not ( = ?auto_445532 ?auto_445535 ) ) ( not ( = ?auto_445532 ?auto_445536 ) ) ( not ( = ?auto_445533 ?auto_445534 ) ) ( not ( = ?auto_445533 ?auto_445535 ) ) ( not ( = ?auto_445533 ?auto_445536 ) ) ( not ( = ?auto_445534 ?auto_445535 ) ) ( not ( = ?auto_445534 ?auto_445536 ) ) ( not ( = ?auto_445535 ?auto_445536 ) ) ( ON ?auto_445534 ?auto_445535 ) ( ON ?auto_445533 ?auto_445534 ) ( ON ?auto_445532 ?auto_445533 ) ( ON ?auto_445531 ?auto_445532 ) ( CLEAR ?auto_445529 ) ( ON ?auto_445530 ?auto_445531 ) ( CLEAR ?auto_445530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_445526 ?auto_445527 ?auto_445528 ?auto_445529 ?auto_445530 )
      ( MAKE-10PILE ?auto_445526 ?auto_445527 ?auto_445528 ?auto_445529 ?auto_445530 ?auto_445531 ?auto_445532 ?auto_445533 ?auto_445534 ?auto_445535 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_445568 - BLOCK
      ?auto_445569 - BLOCK
      ?auto_445570 - BLOCK
      ?auto_445571 - BLOCK
      ?auto_445572 - BLOCK
      ?auto_445573 - BLOCK
      ?auto_445574 - BLOCK
      ?auto_445575 - BLOCK
      ?auto_445576 - BLOCK
      ?auto_445577 - BLOCK
    )
    :vars
    (
      ?auto_445578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445577 ?auto_445578 ) ( ON-TABLE ?auto_445568 ) ( ON ?auto_445569 ?auto_445568 ) ( ON ?auto_445570 ?auto_445569 ) ( not ( = ?auto_445568 ?auto_445569 ) ) ( not ( = ?auto_445568 ?auto_445570 ) ) ( not ( = ?auto_445568 ?auto_445571 ) ) ( not ( = ?auto_445568 ?auto_445572 ) ) ( not ( = ?auto_445568 ?auto_445573 ) ) ( not ( = ?auto_445568 ?auto_445574 ) ) ( not ( = ?auto_445568 ?auto_445575 ) ) ( not ( = ?auto_445568 ?auto_445576 ) ) ( not ( = ?auto_445568 ?auto_445577 ) ) ( not ( = ?auto_445568 ?auto_445578 ) ) ( not ( = ?auto_445569 ?auto_445570 ) ) ( not ( = ?auto_445569 ?auto_445571 ) ) ( not ( = ?auto_445569 ?auto_445572 ) ) ( not ( = ?auto_445569 ?auto_445573 ) ) ( not ( = ?auto_445569 ?auto_445574 ) ) ( not ( = ?auto_445569 ?auto_445575 ) ) ( not ( = ?auto_445569 ?auto_445576 ) ) ( not ( = ?auto_445569 ?auto_445577 ) ) ( not ( = ?auto_445569 ?auto_445578 ) ) ( not ( = ?auto_445570 ?auto_445571 ) ) ( not ( = ?auto_445570 ?auto_445572 ) ) ( not ( = ?auto_445570 ?auto_445573 ) ) ( not ( = ?auto_445570 ?auto_445574 ) ) ( not ( = ?auto_445570 ?auto_445575 ) ) ( not ( = ?auto_445570 ?auto_445576 ) ) ( not ( = ?auto_445570 ?auto_445577 ) ) ( not ( = ?auto_445570 ?auto_445578 ) ) ( not ( = ?auto_445571 ?auto_445572 ) ) ( not ( = ?auto_445571 ?auto_445573 ) ) ( not ( = ?auto_445571 ?auto_445574 ) ) ( not ( = ?auto_445571 ?auto_445575 ) ) ( not ( = ?auto_445571 ?auto_445576 ) ) ( not ( = ?auto_445571 ?auto_445577 ) ) ( not ( = ?auto_445571 ?auto_445578 ) ) ( not ( = ?auto_445572 ?auto_445573 ) ) ( not ( = ?auto_445572 ?auto_445574 ) ) ( not ( = ?auto_445572 ?auto_445575 ) ) ( not ( = ?auto_445572 ?auto_445576 ) ) ( not ( = ?auto_445572 ?auto_445577 ) ) ( not ( = ?auto_445572 ?auto_445578 ) ) ( not ( = ?auto_445573 ?auto_445574 ) ) ( not ( = ?auto_445573 ?auto_445575 ) ) ( not ( = ?auto_445573 ?auto_445576 ) ) ( not ( = ?auto_445573 ?auto_445577 ) ) ( not ( = ?auto_445573 ?auto_445578 ) ) ( not ( = ?auto_445574 ?auto_445575 ) ) ( not ( = ?auto_445574 ?auto_445576 ) ) ( not ( = ?auto_445574 ?auto_445577 ) ) ( not ( = ?auto_445574 ?auto_445578 ) ) ( not ( = ?auto_445575 ?auto_445576 ) ) ( not ( = ?auto_445575 ?auto_445577 ) ) ( not ( = ?auto_445575 ?auto_445578 ) ) ( not ( = ?auto_445576 ?auto_445577 ) ) ( not ( = ?auto_445576 ?auto_445578 ) ) ( not ( = ?auto_445577 ?auto_445578 ) ) ( ON ?auto_445576 ?auto_445577 ) ( ON ?auto_445575 ?auto_445576 ) ( ON ?auto_445574 ?auto_445575 ) ( ON ?auto_445573 ?auto_445574 ) ( ON ?auto_445572 ?auto_445573 ) ( CLEAR ?auto_445570 ) ( ON ?auto_445571 ?auto_445572 ) ( CLEAR ?auto_445571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_445568 ?auto_445569 ?auto_445570 ?auto_445571 )
      ( MAKE-10PILE ?auto_445568 ?auto_445569 ?auto_445570 ?auto_445571 ?auto_445572 ?auto_445573 ?auto_445574 ?auto_445575 ?auto_445576 ?auto_445577 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_445610 - BLOCK
      ?auto_445611 - BLOCK
      ?auto_445612 - BLOCK
      ?auto_445613 - BLOCK
      ?auto_445614 - BLOCK
      ?auto_445615 - BLOCK
      ?auto_445616 - BLOCK
      ?auto_445617 - BLOCK
      ?auto_445618 - BLOCK
      ?auto_445619 - BLOCK
    )
    :vars
    (
      ?auto_445620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445619 ?auto_445620 ) ( ON-TABLE ?auto_445610 ) ( ON ?auto_445611 ?auto_445610 ) ( not ( = ?auto_445610 ?auto_445611 ) ) ( not ( = ?auto_445610 ?auto_445612 ) ) ( not ( = ?auto_445610 ?auto_445613 ) ) ( not ( = ?auto_445610 ?auto_445614 ) ) ( not ( = ?auto_445610 ?auto_445615 ) ) ( not ( = ?auto_445610 ?auto_445616 ) ) ( not ( = ?auto_445610 ?auto_445617 ) ) ( not ( = ?auto_445610 ?auto_445618 ) ) ( not ( = ?auto_445610 ?auto_445619 ) ) ( not ( = ?auto_445610 ?auto_445620 ) ) ( not ( = ?auto_445611 ?auto_445612 ) ) ( not ( = ?auto_445611 ?auto_445613 ) ) ( not ( = ?auto_445611 ?auto_445614 ) ) ( not ( = ?auto_445611 ?auto_445615 ) ) ( not ( = ?auto_445611 ?auto_445616 ) ) ( not ( = ?auto_445611 ?auto_445617 ) ) ( not ( = ?auto_445611 ?auto_445618 ) ) ( not ( = ?auto_445611 ?auto_445619 ) ) ( not ( = ?auto_445611 ?auto_445620 ) ) ( not ( = ?auto_445612 ?auto_445613 ) ) ( not ( = ?auto_445612 ?auto_445614 ) ) ( not ( = ?auto_445612 ?auto_445615 ) ) ( not ( = ?auto_445612 ?auto_445616 ) ) ( not ( = ?auto_445612 ?auto_445617 ) ) ( not ( = ?auto_445612 ?auto_445618 ) ) ( not ( = ?auto_445612 ?auto_445619 ) ) ( not ( = ?auto_445612 ?auto_445620 ) ) ( not ( = ?auto_445613 ?auto_445614 ) ) ( not ( = ?auto_445613 ?auto_445615 ) ) ( not ( = ?auto_445613 ?auto_445616 ) ) ( not ( = ?auto_445613 ?auto_445617 ) ) ( not ( = ?auto_445613 ?auto_445618 ) ) ( not ( = ?auto_445613 ?auto_445619 ) ) ( not ( = ?auto_445613 ?auto_445620 ) ) ( not ( = ?auto_445614 ?auto_445615 ) ) ( not ( = ?auto_445614 ?auto_445616 ) ) ( not ( = ?auto_445614 ?auto_445617 ) ) ( not ( = ?auto_445614 ?auto_445618 ) ) ( not ( = ?auto_445614 ?auto_445619 ) ) ( not ( = ?auto_445614 ?auto_445620 ) ) ( not ( = ?auto_445615 ?auto_445616 ) ) ( not ( = ?auto_445615 ?auto_445617 ) ) ( not ( = ?auto_445615 ?auto_445618 ) ) ( not ( = ?auto_445615 ?auto_445619 ) ) ( not ( = ?auto_445615 ?auto_445620 ) ) ( not ( = ?auto_445616 ?auto_445617 ) ) ( not ( = ?auto_445616 ?auto_445618 ) ) ( not ( = ?auto_445616 ?auto_445619 ) ) ( not ( = ?auto_445616 ?auto_445620 ) ) ( not ( = ?auto_445617 ?auto_445618 ) ) ( not ( = ?auto_445617 ?auto_445619 ) ) ( not ( = ?auto_445617 ?auto_445620 ) ) ( not ( = ?auto_445618 ?auto_445619 ) ) ( not ( = ?auto_445618 ?auto_445620 ) ) ( not ( = ?auto_445619 ?auto_445620 ) ) ( ON ?auto_445618 ?auto_445619 ) ( ON ?auto_445617 ?auto_445618 ) ( ON ?auto_445616 ?auto_445617 ) ( ON ?auto_445615 ?auto_445616 ) ( ON ?auto_445614 ?auto_445615 ) ( ON ?auto_445613 ?auto_445614 ) ( CLEAR ?auto_445611 ) ( ON ?auto_445612 ?auto_445613 ) ( CLEAR ?auto_445612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_445610 ?auto_445611 ?auto_445612 )
      ( MAKE-10PILE ?auto_445610 ?auto_445611 ?auto_445612 ?auto_445613 ?auto_445614 ?auto_445615 ?auto_445616 ?auto_445617 ?auto_445618 ?auto_445619 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_445652 - BLOCK
      ?auto_445653 - BLOCK
      ?auto_445654 - BLOCK
      ?auto_445655 - BLOCK
      ?auto_445656 - BLOCK
      ?auto_445657 - BLOCK
      ?auto_445658 - BLOCK
      ?auto_445659 - BLOCK
      ?auto_445660 - BLOCK
      ?auto_445661 - BLOCK
    )
    :vars
    (
      ?auto_445662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445661 ?auto_445662 ) ( ON-TABLE ?auto_445652 ) ( not ( = ?auto_445652 ?auto_445653 ) ) ( not ( = ?auto_445652 ?auto_445654 ) ) ( not ( = ?auto_445652 ?auto_445655 ) ) ( not ( = ?auto_445652 ?auto_445656 ) ) ( not ( = ?auto_445652 ?auto_445657 ) ) ( not ( = ?auto_445652 ?auto_445658 ) ) ( not ( = ?auto_445652 ?auto_445659 ) ) ( not ( = ?auto_445652 ?auto_445660 ) ) ( not ( = ?auto_445652 ?auto_445661 ) ) ( not ( = ?auto_445652 ?auto_445662 ) ) ( not ( = ?auto_445653 ?auto_445654 ) ) ( not ( = ?auto_445653 ?auto_445655 ) ) ( not ( = ?auto_445653 ?auto_445656 ) ) ( not ( = ?auto_445653 ?auto_445657 ) ) ( not ( = ?auto_445653 ?auto_445658 ) ) ( not ( = ?auto_445653 ?auto_445659 ) ) ( not ( = ?auto_445653 ?auto_445660 ) ) ( not ( = ?auto_445653 ?auto_445661 ) ) ( not ( = ?auto_445653 ?auto_445662 ) ) ( not ( = ?auto_445654 ?auto_445655 ) ) ( not ( = ?auto_445654 ?auto_445656 ) ) ( not ( = ?auto_445654 ?auto_445657 ) ) ( not ( = ?auto_445654 ?auto_445658 ) ) ( not ( = ?auto_445654 ?auto_445659 ) ) ( not ( = ?auto_445654 ?auto_445660 ) ) ( not ( = ?auto_445654 ?auto_445661 ) ) ( not ( = ?auto_445654 ?auto_445662 ) ) ( not ( = ?auto_445655 ?auto_445656 ) ) ( not ( = ?auto_445655 ?auto_445657 ) ) ( not ( = ?auto_445655 ?auto_445658 ) ) ( not ( = ?auto_445655 ?auto_445659 ) ) ( not ( = ?auto_445655 ?auto_445660 ) ) ( not ( = ?auto_445655 ?auto_445661 ) ) ( not ( = ?auto_445655 ?auto_445662 ) ) ( not ( = ?auto_445656 ?auto_445657 ) ) ( not ( = ?auto_445656 ?auto_445658 ) ) ( not ( = ?auto_445656 ?auto_445659 ) ) ( not ( = ?auto_445656 ?auto_445660 ) ) ( not ( = ?auto_445656 ?auto_445661 ) ) ( not ( = ?auto_445656 ?auto_445662 ) ) ( not ( = ?auto_445657 ?auto_445658 ) ) ( not ( = ?auto_445657 ?auto_445659 ) ) ( not ( = ?auto_445657 ?auto_445660 ) ) ( not ( = ?auto_445657 ?auto_445661 ) ) ( not ( = ?auto_445657 ?auto_445662 ) ) ( not ( = ?auto_445658 ?auto_445659 ) ) ( not ( = ?auto_445658 ?auto_445660 ) ) ( not ( = ?auto_445658 ?auto_445661 ) ) ( not ( = ?auto_445658 ?auto_445662 ) ) ( not ( = ?auto_445659 ?auto_445660 ) ) ( not ( = ?auto_445659 ?auto_445661 ) ) ( not ( = ?auto_445659 ?auto_445662 ) ) ( not ( = ?auto_445660 ?auto_445661 ) ) ( not ( = ?auto_445660 ?auto_445662 ) ) ( not ( = ?auto_445661 ?auto_445662 ) ) ( ON ?auto_445660 ?auto_445661 ) ( ON ?auto_445659 ?auto_445660 ) ( ON ?auto_445658 ?auto_445659 ) ( ON ?auto_445657 ?auto_445658 ) ( ON ?auto_445656 ?auto_445657 ) ( ON ?auto_445655 ?auto_445656 ) ( ON ?auto_445654 ?auto_445655 ) ( CLEAR ?auto_445652 ) ( ON ?auto_445653 ?auto_445654 ) ( CLEAR ?auto_445653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_445652 ?auto_445653 )
      ( MAKE-10PILE ?auto_445652 ?auto_445653 ?auto_445654 ?auto_445655 ?auto_445656 ?auto_445657 ?auto_445658 ?auto_445659 ?auto_445660 ?auto_445661 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_445694 - BLOCK
      ?auto_445695 - BLOCK
      ?auto_445696 - BLOCK
      ?auto_445697 - BLOCK
      ?auto_445698 - BLOCK
      ?auto_445699 - BLOCK
      ?auto_445700 - BLOCK
      ?auto_445701 - BLOCK
      ?auto_445702 - BLOCK
      ?auto_445703 - BLOCK
    )
    :vars
    (
      ?auto_445704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445703 ?auto_445704 ) ( not ( = ?auto_445694 ?auto_445695 ) ) ( not ( = ?auto_445694 ?auto_445696 ) ) ( not ( = ?auto_445694 ?auto_445697 ) ) ( not ( = ?auto_445694 ?auto_445698 ) ) ( not ( = ?auto_445694 ?auto_445699 ) ) ( not ( = ?auto_445694 ?auto_445700 ) ) ( not ( = ?auto_445694 ?auto_445701 ) ) ( not ( = ?auto_445694 ?auto_445702 ) ) ( not ( = ?auto_445694 ?auto_445703 ) ) ( not ( = ?auto_445694 ?auto_445704 ) ) ( not ( = ?auto_445695 ?auto_445696 ) ) ( not ( = ?auto_445695 ?auto_445697 ) ) ( not ( = ?auto_445695 ?auto_445698 ) ) ( not ( = ?auto_445695 ?auto_445699 ) ) ( not ( = ?auto_445695 ?auto_445700 ) ) ( not ( = ?auto_445695 ?auto_445701 ) ) ( not ( = ?auto_445695 ?auto_445702 ) ) ( not ( = ?auto_445695 ?auto_445703 ) ) ( not ( = ?auto_445695 ?auto_445704 ) ) ( not ( = ?auto_445696 ?auto_445697 ) ) ( not ( = ?auto_445696 ?auto_445698 ) ) ( not ( = ?auto_445696 ?auto_445699 ) ) ( not ( = ?auto_445696 ?auto_445700 ) ) ( not ( = ?auto_445696 ?auto_445701 ) ) ( not ( = ?auto_445696 ?auto_445702 ) ) ( not ( = ?auto_445696 ?auto_445703 ) ) ( not ( = ?auto_445696 ?auto_445704 ) ) ( not ( = ?auto_445697 ?auto_445698 ) ) ( not ( = ?auto_445697 ?auto_445699 ) ) ( not ( = ?auto_445697 ?auto_445700 ) ) ( not ( = ?auto_445697 ?auto_445701 ) ) ( not ( = ?auto_445697 ?auto_445702 ) ) ( not ( = ?auto_445697 ?auto_445703 ) ) ( not ( = ?auto_445697 ?auto_445704 ) ) ( not ( = ?auto_445698 ?auto_445699 ) ) ( not ( = ?auto_445698 ?auto_445700 ) ) ( not ( = ?auto_445698 ?auto_445701 ) ) ( not ( = ?auto_445698 ?auto_445702 ) ) ( not ( = ?auto_445698 ?auto_445703 ) ) ( not ( = ?auto_445698 ?auto_445704 ) ) ( not ( = ?auto_445699 ?auto_445700 ) ) ( not ( = ?auto_445699 ?auto_445701 ) ) ( not ( = ?auto_445699 ?auto_445702 ) ) ( not ( = ?auto_445699 ?auto_445703 ) ) ( not ( = ?auto_445699 ?auto_445704 ) ) ( not ( = ?auto_445700 ?auto_445701 ) ) ( not ( = ?auto_445700 ?auto_445702 ) ) ( not ( = ?auto_445700 ?auto_445703 ) ) ( not ( = ?auto_445700 ?auto_445704 ) ) ( not ( = ?auto_445701 ?auto_445702 ) ) ( not ( = ?auto_445701 ?auto_445703 ) ) ( not ( = ?auto_445701 ?auto_445704 ) ) ( not ( = ?auto_445702 ?auto_445703 ) ) ( not ( = ?auto_445702 ?auto_445704 ) ) ( not ( = ?auto_445703 ?auto_445704 ) ) ( ON ?auto_445702 ?auto_445703 ) ( ON ?auto_445701 ?auto_445702 ) ( ON ?auto_445700 ?auto_445701 ) ( ON ?auto_445699 ?auto_445700 ) ( ON ?auto_445698 ?auto_445699 ) ( ON ?auto_445697 ?auto_445698 ) ( ON ?auto_445696 ?auto_445697 ) ( ON ?auto_445695 ?auto_445696 ) ( ON ?auto_445694 ?auto_445695 ) ( CLEAR ?auto_445694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_445694 )
      ( MAKE-10PILE ?auto_445694 ?auto_445695 ?auto_445696 ?auto_445697 ?auto_445698 ?auto_445699 ?auto_445700 ?auto_445701 ?auto_445702 ?auto_445703 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_445737 - BLOCK
      ?auto_445738 - BLOCK
      ?auto_445739 - BLOCK
      ?auto_445740 - BLOCK
      ?auto_445741 - BLOCK
      ?auto_445742 - BLOCK
      ?auto_445743 - BLOCK
      ?auto_445744 - BLOCK
      ?auto_445745 - BLOCK
      ?auto_445746 - BLOCK
      ?auto_445747 - BLOCK
    )
    :vars
    (
      ?auto_445748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_445746 ) ( ON ?auto_445747 ?auto_445748 ) ( CLEAR ?auto_445747 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_445737 ) ( ON ?auto_445738 ?auto_445737 ) ( ON ?auto_445739 ?auto_445738 ) ( ON ?auto_445740 ?auto_445739 ) ( ON ?auto_445741 ?auto_445740 ) ( ON ?auto_445742 ?auto_445741 ) ( ON ?auto_445743 ?auto_445742 ) ( ON ?auto_445744 ?auto_445743 ) ( ON ?auto_445745 ?auto_445744 ) ( ON ?auto_445746 ?auto_445745 ) ( not ( = ?auto_445737 ?auto_445738 ) ) ( not ( = ?auto_445737 ?auto_445739 ) ) ( not ( = ?auto_445737 ?auto_445740 ) ) ( not ( = ?auto_445737 ?auto_445741 ) ) ( not ( = ?auto_445737 ?auto_445742 ) ) ( not ( = ?auto_445737 ?auto_445743 ) ) ( not ( = ?auto_445737 ?auto_445744 ) ) ( not ( = ?auto_445737 ?auto_445745 ) ) ( not ( = ?auto_445737 ?auto_445746 ) ) ( not ( = ?auto_445737 ?auto_445747 ) ) ( not ( = ?auto_445737 ?auto_445748 ) ) ( not ( = ?auto_445738 ?auto_445739 ) ) ( not ( = ?auto_445738 ?auto_445740 ) ) ( not ( = ?auto_445738 ?auto_445741 ) ) ( not ( = ?auto_445738 ?auto_445742 ) ) ( not ( = ?auto_445738 ?auto_445743 ) ) ( not ( = ?auto_445738 ?auto_445744 ) ) ( not ( = ?auto_445738 ?auto_445745 ) ) ( not ( = ?auto_445738 ?auto_445746 ) ) ( not ( = ?auto_445738 ?auto_445747 ) ) ( not ( = ?auto_445738 ?auto_445748 ) ) ( not ( = ?auto_445739 ?auto_445740 ) ) ( not ( = ?auto_445739 ?auto_445741 ) ) ( not ( = ?auto_445739 ?auto_445742 ) ) ( not ( = ?auto_445739 ?auto_445743 ) ) ( not ( = ?auto_445739 ?auto_445744 ) ) ( not ( = ?auto_445739 ?auto_445745 ) ) ( not ( = ?auto_445739 ?auto_445746 ) ) ( not ( = ?auto_445739 ?auto_445747 ) ) ( not ( = ?auto_445739 ?auto_445748 ) ) ( not ( = ?auto_445740 ?auto_445741 ) ) ( not ( = ?auto_445740 ?auto_445742 ) ) ( not ( = ?auto_445740 ?auto_445743 ) ) ( not ( = ?auto_445740 ?auto_445744 ) ) ( not ( = ?auto_445740 ?auto_445745 ) ) ( not ( = ?auto_445740 ?auto_445746 ) ) ( not ( = ?auto_445740 ?auto_445747 ) ) ( not ( = ?auto_445740 ?auto_445748 ) ) ( not ( = ?auto_445741 ?auto_445742 ) ) ( not ( = ?auto_445741 ?auto_445743 ) ) ( not ( = ?auto_445741 ?auto_445744 ) ) ( not ( = ?auto_445741 ?auto_445745 ) ) ( not ( = ?auto_445741 ?auto_445746 ) ) ( not ( = ?auto_445741 ?auto_445747 ) ) ( not ( = ?auto_445741 ?auto_445748 ) ) ( not ( = ?auto_445742 ?auto_445743 ) ) ( not ( = ?auto_445742 ?auto_445744 ) ) ( not ( = ?auto_445742 ?auto_445745 ) ) ( not ( = ?auto_445742 ?auto_445746 ) ) ( not ( = ?auto_445742 ?auto_445747 ) ) ( not ( = ?auto_445742 ?auto_445748 ) ) ( not ( = ?auto_445743 ?auto_445744 ) ) ( not ( = ?auto_445743 ?auto_445745 ) ) ( not ( = ?auto_445743 ?auto_445746 ) ) ( not ( = ?auto_445743 ?auto_445747 ) ) ( not ( = ?auto_445743 ?auto_445748 ) ) ( not ( = ?auto_445744 ?auto_445745 ) ) ( not ( = ?auto_445744 ?auto_445746 ) ) ( not ( = ?auto_445744 ?auto_445747 ) ) ( not ( = ?auto_445744 ?auto_445748 ) ) ( not ( = ?auto_445745 ?auto_445746 ) ) ( not ( = ?auto_445745 ?auto_445747 ) ) ( not ( = ?auto_445745 ?auto_445748 ) ) ( not ( = ?auto_445746 ?auto_445747 ) ) ( not ( = ?auto_445746 ?auto_445748 ) ) ( not ( = ?auto_445747 ?auto_445748 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_445747 ?auto_445748 )
      ( !STACK ?auto_445747 ?auto_445746 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_445783 - BLOCK
      ?auto_445784 - BLOCK
      ?auto_445785 - BLOCK
      ?auto_445786 - BLOCK
      ?auto_445787 - BLOCK
      ?auto_445788 - BLOCK
      ?auto_445789 - BLOCK
      ?auto_445790 - BLOCK
      ?auto_445791 - BLOCK
      ?auto_445792 - BLOCK
      ?auto_445793 - BLOCK
    )
    :vars
    (
      ?auto_445794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445793 ?auto_445794 ) ( ON-TABLE ?auto_445783 ) ( ON ?auto_445784 ?auto_445783 ) ( ON ?auto_445785 ?auto_445784 ) ( ON ?auto_445786 ?auto_445785 ) ( ON ?auto_445787 ?auto_445786 ) ( ON ?auto_445788 ?auto_445787 ) ( ON ?auto_445789 ?auto_445788 ) ( ON ?auto_445790 ?auto_445789 ) ( ON ?auto_445791 ?auto_445790 ) ( not ( = ?auto_445783 ?auto_445784 ) ) ( not ( = ?auto_445783 ?auto_445785 ) ) ( not ( = ?auto_445783 ?auto_445786 ) ) ( not ( = ?auto_445783 ?auto_445787 ) ) ( not ( = ?auto_445783 ?auto_445788 ) ) ( not ( = ?auto_445783 ?auto_445789 ) ) ( not ( = ?auto_445783 ?auto_445790 ) ) ( not ( = ?auto_445783 ?auto_445791 ) ) ( not ( = ?auto_445783 ?auto_445792 ) ) ( not ( = ?auto_445783 ?auto_445793 ) ) ( not ( = ?auto_445783 ?auto_445794 ) ) ( not ( = ?auto_445784 ?auto_445785 ) ) ( not ( = ?auto_445784 ?auto_445786 ) ) ( not ( = ?auto_445784 ?auto_445787 ) ) ( not ( = ?auto_445784 ?auto_445788 ) ) ( not ( = ?auto_445784 ?auto_445789 ) ) ( not ( = ?auto_445784 ?auto_445790 ) ) ( not ( = ?auto_445784 ?auto_445791 ) ) ( not ( = ?auto_445784 ?auto_445792 ) ) ( not ( = ?auto_445784 ?auto_445793 ) ) ( not ( = ?auto_445784 ?auto_445794 ) ) ( not ( = ?auto_445785 ?auto_445786 ) ) ( not ( = ?auto_445785 ?auto_445787 ) ) ( not ( = ?auto_445785 ?auto_445788 ) ) ( not ( = ?auto_445785 ?auto_445789 ) ) ( not ( = ?auto_445785 ?auto_445790 ) ) ( not ( = ?auto_445785 ?auto_445791 ) ) ( not ( = ?auto_445785 ?auto_445792 ) ) ( not ( = ?auto_445785 ?auto_445793 ) ) ( not ( = ?auto_445785 ?auto_445794 ) ) ( not ( = ?auto_445786 ?auto_445787 ) ) ( not ( = ?auto_445786 ?auto_445788 ) ) ( not ( = ?auto_445786 ?auto_445789 ) ) ( not ( = ?auto_445786 ?auto_445790 ) ) ( not ( = ?auto_445786 ?auto_445791 ) ) ( not ( = ?auto_445786 ?auto_445792 ) ) ( not ( = ?auto_445786 ?auto_445793 ) ) ( not ( = ?auto_445786 ?auto_445794 ) ) ( not ( = ?auto_445787 ?auto_445788 ) ) ( not ( = ?auto_445787 ?auto_445789 ) ) ( not ( = ?auto_445787 ?auto_445790 ) ) ( not ( = ?auto_445787 ?auto_445791 ) ) ( not ( = ?auto_445787 ?auto_445792 ) ) ( not ( = ?auto_445787 ?auto_445793 ) ) ( not ( = ?auto_445787 ?auto_445794 ) ) ( not ( = ?auto_445788 ?auto_445789 ) ) ( not ( = ?auto_445788 ?auto_445790 ) ) ( not ( = ?auto_445788 ?auto_445791 ) ) ( not ( = ?auto_445788 ?auto_445792 ) ) ( not ( = ?auto_445788 ?auto_445793 ) ) ( not ( = ?auto_445788 ?auto_445794 ) ) ( not ( = ?auto_445789 ?auto_445790 ) ) ( not ( = ?auto_445789 ?auto_445791 ) ) ( not ( = ?auto_445789 ?auto_445792 ) ) ( not ( = ?auto_445789 ?auto_445793 ) ) ( not ( = ?auto_445789 ?auto_445794 ) ) ( not ( = ?auto_445790 ?auto_445791 ) ) ( not ( = ?auto_445790 ?auto_445792 ) ) ( not ( = ?auto_445790 ?auto_445793 ) ) ( not ( = ?auto_445790 ?auto_445794 ) ) ( not ( = ?auto_445791 ?auto_445792 ) ) ( not ( = ?auto_445791 ?auto_445793 ) ) ( not ( = ?auto_445791 ?auto_445794 ) ) ( not ( = ?auto_445792 ?auto_445793 ) ) ( not ( = ?auto_445792 ?auto_445794 ) ) ( not ( = ?auto_445793 ?auto_445794 ) ) ( CLEAR ?auto_445791 ) ( ON ?auto_445792 ?auto_445793 ) ( CLEAR ?auto_445792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_445783 ?auto_445784 ?auto_445785 ?auto_445786 ?auto_445787 ?auto_445788 ?auto_445789 ?auto_445790 ?auto_445791 ?auto_445792 )
      ( MAKE-11PILE ?auto_445783 ?auto_445784 ?auto_445785 ?auto_445786 ?auto_445787 ?auto_445788 ?auto_445789 ?auto_445790 ?auto_445791 ?auto_445792 ?auto_445793 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_445829 - BLOCK
      ?auto_445830 - BLOCK
      ?auto_445831 - BLOCK
      ?auto_445832 - BLOCK
      ?auto_445833 - BLOCK
      ?auto_445834 - BLOCK
      ?auto_445835 - BLOCK
      ?auto_445836 - BLOCK
      ?auto_445837 - BLOCK
      ?auto_445838 - BLOCK
      ?auto_445839 - BLOCK
    )
    :vars
    (
      ?auto_445840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445839 ?auto_445840 ) ( ON-TABLE ?auto_445829 ) ( ON ?auto_445830 ?auto_445829 ) ( ON ?auto_445831 ?auto_445830 ) ( ON ?auto_445832 ?auto_445831 ) ( ON ?auto_445833 ?auto_445832 ) ( ON ?auto_445834 ?auto_445833 ) ( ON ?auto_445835 ?auto_445834 ) ( ON ?auto_445836 ?auto_445835 ) ( not ( = ?auto_445829 ?auto_445830 ) ) ( not ( = ?auto_445829 ?auto_445831 ) ) ( not ( = ?auto_445829 ?auto_445832 ) ) ( not ( = ?auto_445829 ?auto_445833 ) ) ( not ( = ?auto_445829 ?auto_445834 ) ) ( not ( = ?auto_445829 ?auto_445835 ) ) ( not ( = ?auto_445829 ?auto_445836 ) ) ( not ( = ?auto_445829 ?auto_445837 ) ) ( not ( = ?auto_445829 ?auto_445838 ) ) ( not ( = ?auto_445829 ?auto_445839 ) ) ( not ( = ?auto_445829 ?auto_445840 ) ) ( not ( = ?auto_445830 ?auto_445831 ) ) ( not ( = ?auto_445830 ?auto_445832 ) ) ( not ( = ?auto_445830 ?auto_445833 ) ) ( not ( = ?auto_445830 ?auto_445834 ) ) ( not ( = ?auto_445830 ?auto_445835 ) ) ( not ( = ?auto_445830 ?auto_445836 ) ) ( not ( = ?auto_445830 ?auto_445837 ) ) ( not ( = ?auto_445830 ?auto_445838 ) ) ( not ( = ?auto_445830 ?auto_445839 ) ) ( not ( = ?auto_445830 ?auto_445840 ) ) ( not ( = ?auto_445831 ?auto_445832 ) ) ( not ( = ?auto_445831 ?auto_445833 ) ) ( not ( = ?auto_445831 ?auto_445834 ) ) ( not ( = ?auto_445831 ?auto_445835 ) ) ( not ( = ?auto_445831 ?auto_445836 ) ) ( not ( = ?auto_445831 ?auto_445837 ) ) ( not ( = ?auto_445831 ?auto_445838 ) ) ( not ( = ?auto_445831 ?auto_445839 ) ) ( not ( = ?auto_445831 ?auto_445840 ) ) ( not ( = ?auto_445832 ?auto_445833 ) ) ( not ( = ?auto_445832 ?auto_445834 ) ) ( not ( = ?auto_445832 ?auto_445835 ) ) ( not ( = ?auto_445832 ?auto_445836 ) ) ( not ( = ?auto_445832 ?auto_445837 ) ) ( not ( = ?auto_445832 ?auto_445838 ) ) ( not ( = ?auto_445832 ?auto_445839 ) ) ( not ( = ?auto_445832 ?auto_445840 ) ) ( not ( = ?auto_445833 ?auto_445834 ) ) ( not ( = ?auto_445833 ?auto_445835 ) ) ( not ( = ?auto_445833 ?auto_445836 ) ) ( not ( = ?auto_445833 ?auto_445837 ) ) ( not ( = ?auto_445833 ?auto_445838 ) ) ( not ( = ?auto_445833 ?auto_445839 ) ) ( not ( = ?auto_445833 ?auto_445840 ) ) ( not ( = ?auto_445834 ?auto_445835 ) ) ( not ( = ?auto_445834 ?auto_445836 ) ) ( not ( = ?auto_445834 ?auto_445837 ) ) ( not ( = ?auto_445834 ?auto_445838 ) ) ( not ( = ?auto_445834 ?auto_445839 ) ) ( not ( = ?auto_445834 ?auto_445840 ) ) ( not ( = ?auto_445835 ?auto_445836 ) ) ( not ( = ?auto_445835 ?auto_445837 ) ) ( not ( = ?auto_445835 ?auto_445838 ) ) ( not ( = ?auto_445835 ?auto_445839 ) ) ( not ( = ?auto_445835 ?auto_445840 ) ) ( not ( = ?auto_445836 ?auto_445837 ) ) ( not ( = ?auto_445836 ?auto_445838 ) ) ( not ( = ?auto_445836 ?auto_445839 ) ) ( not ( = ?auto_445836 ?auto_445840 ) ) ( not ( = ?auto_445837 ?auto_445838 ) ) ( not ( = ?auto_445837 ?auto_445839 ) ) ( not ( = ?auto_445837 ?auto_445840 ) ) ( not ( = ?auto_445838 ?auto_445839 ) ) ( not ( = ?auto_445838 ?auto_445840 ) ) ( not ( = ?auto_445839 ?auto_445840 ) ) ( ON ?auto_445838 ?auto_445839 ) ( CLEAR ?auto_445836 ) ( ON ?auto_445837 ?auto_445838 ) ( CLEAR ?auto_445837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_445829 ?auto_445830 ?auto_445831 ?auto_445832 ?auto_445833 ?auto_445834 ?auto_445835 ?auto_445836 ?auto_445837 )
      ( MAKE-11PILE ?auto_445829 ?auto_445830 ?auto_445831 ?auto_445832 ?auto_445833 ?auto_445834 ?auto_445835 ?auto_445836 ?auto_445837 ?auto_445838 ?auto_445839 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_445875 - BLOCK
      ?auto_445876 - BLOCK
      ?auto_445877 - BLOCK
      ?auto_445878 - BLOCK
      ?auto_445879 - BLOCK
      ?auto_445880 - BLOCK
      ?auto_445881 - BLOCK
      ?auto_445882 - BLOCK
      ?auto_445883 - BLOCK
      ?auto_445884 - BLOCK
      ?auto_445885 - BLOCK
    )
    :vars
    (
      ?auto_445886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445885 ?auto_445886 ) ( ON-TABLE ?auto_445875 ) ( ON ?auto_445876 ?auto_445875 ) ( ON ?auto_445877 ?auto_445876 ) ( ON ?auto_445878 ?auto_445877 ) ( ON ?auto_445879 ?auto_445878 ) ( ON ?auto_445880 ?auto_445879 ) ( ON ?auto_445881 ?auto_445880 ) ( not ( = ?auto_445875 ?auto_445876 ) ) ( not ( = ?auto_445875 ?auto_445877 ) ) ( not ( = ?auto_445875 ?auto_445878 ) ) ( not ( = ?auto_445875 ?auto_445879 ) ) ( not ( = ?auto_445875 ?auto_445880 ) ) ( not ( = ?auto_445875 ?auto_445881 ) ) ( not ( = ?auto_445875 ?auto_445882 ) ) ( not ( = ?auto_445875 ?auto_445883 ) ) ( not ( = ?auto_445875 ?auto_445884 ) ) ( not ( = ?auto_445875 ?auto_445885 ) ) ( not ( = ?auto_445875 ?auto_445886 ) ) ( not ( = ?auto_445876 ?auto_445877 ) ) ( not ( = ?auto_445876 ?auto_445878 ) ) ( not ( = ?auto_445876 ?auto_445879 ) ) ( not ( = ?auto_445876 ?auto_445880 ) ) ( not ( = ?auto_445876 ?auto_445881 ) ) ( not ( = ?auto_445876 ?auto_445882 ) ) ( not ( = ?auto_445876 ?auto_445883 ) ) ( not ( = ?auto_445876 ?auto_445884 ) ) ( not ( = ?auto_445876 ?auto_445885 ) ) ( not ( = ?auto_445876 ?auto_445886 ) ) ( not ( = ?auto_445877 ?auto_445878 ) ) ( not ( = ?auto_445877 ?auto_445879 ) ) ( not ( = ?auto_445877 ?auto_445880 ) ) ( not ( = ?auto_445877 ?auto_445881 ) ) ( not ( = ?auto_445877 ?auto_445882 ) ) ( not ( = ?auto_445877 ?auto_445883 ) ) ( not ( = ?auto_445877 ?auto_445884 ) ) ( not ( = ?auto_445877 ?auto_445885 ) ) ( not ( = ?auto_445877 ?auto_445886 ) ) ( not ( = ?auto_445878 ?auto_445879 ) ) ( not ( = ?auto_445878 ?auto_445880 ) ) ( not ( = ?auto_445878 ?auto_445881 ) ) ( not ( = ?auto_445878 ?auto_445882 ) ) ( not ( = ?auto_445878 ?auto_445883 ) ) ( not ( = ?auto_445878 ?auto_445884 ) ) ( not ( = ?auto_445878 ?auto_445885 ) ) ( not ( = ?auto_445878 ?auto_445886 ) ) ( not ( = ?auto_445879 ?auto_445880 ) ) ( not ( = ?auto_445879 ?auto_445881 ) ) ( not ( = ?auto_445879 ?auto_445882 ) ) ( not ( = ?auto_445879 ?auto_445883 ) ) ( not ( = ?auto_445879 ?auto_445884 ) ) ( not ( = ?auto_445879 ?auto_445885 ) ) ( not ( = ?auto_445879 ?auto_445886 ) ) ( not ( = ?auto_445880 ?auto_445881 ) ) ( not ( = ?auto_445880 ?auto_445882 ) ) ( not ( = ?auto_445880 ?auto_445883 ) ) ( not ( = ?auto_445880 ?auto_445884 ) ) ( not ( = ?auto_445880 ?auto_445885 ) ) ( not ( = ?auto_445880 ?auto_445886 ) ) ( not ( = ?auto_445881 ?auto_445882 ) ) ( not ( = ?auto_445881 ?auto_445883 ) ) ( not ( = ?auto_445881 ?auto_445884 ) ) ( not ( = ?auto_445881 ?auto_445885 ) ) ( not ( = ?auto_445881 ?auto_445886 ) ) ( not ( = ?auto_445882 ?auto_445883 ) ) ( not ( = ?auto_445882 ?auto_445884 ) ) ( not ( = ?auto_445882 ?auto_445885 ) ) ( not ( = ?auto_445882 ?auto_445886 ) ) ( not ( = ?auto_445883 ?auto_445884 ) ) ( not ( = ?auto_445883 ?auto_445885 ) ) ( not ( = ?auto_445883 ?auto_445886 ) ) ( not ( = ?auto_445884 ?auto_445885 ) ) ( not ( = ?auto_445884 ?auto_445886 ) ) ( not ( = ?auto_445885 ?auto_445886 ) ) ( ON ?auto_445884 ?auto_445885 ) ( ON ?auto_445883 ?auto_445884 ) ( CLEAR ?auto_445881 ) ( ON ?auto_445882 ?auto_445883 ) ( CLEAR ?auto_445882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_445875 ?auto_445876 ?auto_445877 ?auto_445878 ?auto_445879 ?auto_445880 ?auto_445881 ?auto_445882 )
      ( MAKE-11PILE ?auto_445875 ?auto_445876 ?auto_445877 ?auto_445878 ?auto_445879 ?auto_445880 ?auto_445881 ?auto_445882 ?auto_445883 ?auto_445884 ?auto_445885 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_445921 - BLOCK
      ?auto_445922 - BLOCK
      ?auto_445923 - BLOCK
      ?auto_445924 - BLOCK
      ?auto_445925 - BLOCK
      ?auto_445926 - BLOCK
      ?auto_445927 - BLOCK
      ?auto_445928 - BLOCK
      ?auto_445929 - BLOCK
      ?auto_445930 - BLOCK
      ?auto_445931 - BLOCK
    )
    :vars
    (
      ?auto_445932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445931 ?auto_445932 ) ( ON-TABLE ?auto_445921 ) ( ON ?auto_445922 ?auto_445921 ) ( ON ?auto_445923 ?auto_445922 ) ( ON ?auto_445924 ?auto_445923 ) ( ON ?auto_445925 ?auto_445924 ) ( ON ?auto_445926 ?auto_445925 ) ( not ( = ?auto_445921 ?auto_445922 ) ) ( not ( = ?auto_445921 ?auto_445923 ) ) ( not ( = ?auto_445921 ?auto_445924 ) ) ( not ( = ?auto_445921 ?auto_445925 ) ) ( not ( = ?auto_445921 ?auto_445926 ) ) ( not ( = ?auto_445921 ?auto_445927 ) ) ( not ( = ?auto_445921 ?auto_445928 ) ) ( not ( = ?auto_445921 ?auto_445929 ) ) ( not ( = ?auto_445921 ?auto_445930 ) ) ( not ( = ?auto_445921 ?auto_445931 ) ) ( not ( = ?auto_445921 ?auto_445932 ) ) ( not ( = ?auto_445922 ?auto_445923 ) ) ( not ( = ?auto_445922 ?auto_445924 ) ) ( not ( = ?auto_445922 ?auto_445925 ) ) ( not ( = ?auto_445922 ?auto_445926 ) ) ( not ( = ?auto_445922 ?auto_445927 ) ) ( not ( = ?auto_445922 ?auto_445928 ) ) ( not ( = ?auto_445922 ?auto_445929 ) ) ( not ( = ?auto_445922 ?auto_445930 ) ) ( not ( = ?auto_445922 ?auto_445931 ) ) ( not ( = ?auto_445922 ?auto_445932 ) ) ( not ( = ?auto_445923 ?auto_445924 ) ) ( not ( = ?auto_445923 ?auto_445925 ) ) ( not ( = ?auto_445923 ?auto_445926 ) ) ( not ( = ?auto_445923 ?auto_445927 ) ) ( not ( = ?auto_445923 ?auto_445928 ) ) ( not ( = ?auto_445923 ?auto_445929 ) ) ( not ( = ?auto_445923 ?auto_445930 ) ) ( not ( = ?auto_445923 ?auto_445931 ) ) ( not ( = ?auto_445923 ?auto_445932 ) ) ( not ( = ?auto_445924 ?auto_445925 ) ) ( not ( = ?auto_445924 ?auto_445926 ) ) ( not ( = ?auto_445924 ?auto_445927 ) ) ( not ( = ?auto_445924 ?auto_445928 ) ) ( not ( = ?auto_445924 ?auto_445929 ) ) ( not ( = ?auto_445924 ?auto_445930 ) ) ( not ( = ?auto_445924 ?auto_445931 ) ) ( not ( = ?auto_445924 ?auto_445932 ) ) ( not ( = ?auto_445925 ?auto_445926 ) ) ( not ( = ?auto_445925 ?auto_445927 ) ) ( not ( = ?auto_445925 ?auto_445928 ) ) ( not ( = ?auto_445925 ?auto_445929 ) ) ( not ( = ?auto_445925 ?auto_445930 ) ) ( not ( = ?auto_445925 ?auto_445931 ) ) ( not ( = ?auto_445925 ?auto_445932 ) ) ( not ( = ?auto_445926 ?auto_445927 ) ) ( not ( = ?auto_445926 ?auto_445928 ) ) ( not ( = ?auto_445926 ?auto_445929 ) ) ( not ( = ?auto_445926 ?auto_445930 ) ) ( not ( = ?auto_445926 ?auto_445931 ) ) ( not ( = ?auto_445926 ?auto_445932 ) ) ( not ( = ?auto_445927 ?auto_445928 ) ) ( not ( = ?auto_445927 ?auto_445929 ) ) ( not ( = ?auto_445927 ?auto_445930 ) ) ( not ( = ?auto_445927 ?auto_445931 ) ) ( not ( = ?auto_445927 ?auto_445932 ) ) ( not ( = ?auto_445928 ?auto_445929 ) ) ( not ( = ?auto_445928 ?auto_445930 ) ) ( not ( = ?auto_445928 ?auto_445931 ) ) ( not ( = ?auto_445928 ?auto_445932 ) ) ( not ( = ?auto_445929 ?auto_445930 ) ) ( not ( = ?auto_445929 ?auto_445931 ) ) ( not ( = ?auto_445929 ?auto_445932 ) ) ( not ( = ?auto_445930 ?auto_445931 ) ) ( not ( = ?auto_445930 ?auto_445932 ) ) ( not ( = ?auto_445931 ?auto_445932 ) ) ( ON ?auto_445930 ?auto_445931 ) ( ON ?auto_445929 ?auto_445930 ) ( ON ?auto_445928 ?auto_445929 ) ( CLEAR ?auto_445926 ) ( ON ?auto_445927 ?auto_445928 ) ( CLEAR ?auto_445927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_445921 ?auto_445922 ?auto_445923 ?auto_445924 ?auto_445925 ?auto_445926 ?auto_445927 )
      ( MAKE-11PILE ?auto_445921 ?auto_445922 ?auto_445923 ?auto_445924 ?auto_445925 ?auto_445926 ?auto_445927 ?auto_445928 ?auto_445929 ?auto_445930 ?auto_445931 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_445967 - BLOCK
      ?auto_445968 - BLOCK
      ?auto_445969 - BLOCK
      ?auto_445970 - BLOCK
      ?auto_445971 - BLOCK
      ?auto_445972 - BLOCK
      ?auto_445973 - BLOCK
      ?auto_445974 - BLOCK
      ?auto_445975 - BLOCK
      ?auto_445976 - BLOCK
      ?auto_445977 - BLOCK
    )
    :vars
    (
      ?auto_445978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_445977 ?auto_445978 ) ( ON-TABLE ?auto_445967 ) ( ON ?auto_445968 ?auto_445967 ) ( ON ?auto_445969 ?auto_445968 ) ( ON ?auto_445970 ?auto_445969 ) ( ON ?auto_445971 ?auto_445970 ) ( not ( = ?auto_445967 ?auto_445968 ) ) ( not ( = ?auto_445967 ?auto_445969 ) ) ( not ( = ?auto_445967 ?auto_445970 ) ) ( not ( = ?auto_445967 ?auto_445971 ) ) ( not ( = ?auto_445967 ?auto_445972 ) ) ( not ( = ?auto_445967 ?auto_445973 ) ) ( not ( = ?auto_445967 ?auto_445974 ) ) ( not ( = ?auto_445967 ?auto_445975 ) ) ( not ( = ?auto_445967 ?auto_445976 ) ) ( not ( = ?auto_445967 ?auto_445977 ) ) ( not ( = ?auto_445967 ?auto_445978 ) ) ( not ( = ?auto_445968 ?auto_445969 ) ) ( not ( = ?auto_445968 ?auto_445970 ) ) ( not ( = ?auto_445968 ?auto_445971 ) ) ( not ( = ?auto_445968 ?auto_445972 ) ) ( not ( = ?auto_445968 ?auto_445973 ) ) ( not ( = ?auto_445968 ?auto_445974 ) ) ( not ( = ?auto_445968 ?auto_445975 ) ) ( not ( = ?auto_445968 ?auto_445976 ) ) ( not ( = ?auto_445968 ?auto_445977 ) ) ( not ( = ?auto_445968 ?auto_445978 ) ) ( not ( = ?auto_445969 ?auto_445970 ) ) ( not ( = ?auto_445969 ?auto_445971 ) ) ( not ( = ?auto_445969 ?auto_445972 ) ) ( not ( = ?auto_445969 ?auto_445973 ) ) ( not ( = ?auto_445969 ?auto_445974 ) ) ( not ( = ?auto_445969 ?auto_445975 ) ) ( not ( = ?auto_445969 ?auto_445976 ) ) ( not ( = ?auto_445969 ?auto_445977 ) ) ( not ( = ?auto_445969 ?auto_445978 ) ) ( not ( = ?auto_445970 ?auto_445971 ) ) ( not ( = ?auto_445970 ?auto_445972 ) ) ( not ( = ?auto_445970 ?auto_445973 ) ) ( not ( = ?auto_445970 ?auto_445974 ) ) ( not ( = ?auto_445970 ?auto_445975 ) ) ( not ( = ?auto_445970 ?auto_445976 ) ) ( not ( = ?auto_445970 ?auto_445977 ) ) ( not ( = ?auto_445970 ?auto_445978 ) ) ( not ( = ?auto_445971 ?auto_445972 ) ) ( not ( = ?auto_445971 ?auto_445973 ) ) ( not ( = ?auto_445971 ?auto_445974 ) ) ( not ( = ?auto_445971 ?auto_445975 ) ) ( not ( = ?auto_445971 ?auto_445976 ) ) ( not ( = ?auto_445971 ?auto_445977 ) ) ( not ( = ?auto_445971 ?auto_445978 ) ) ( not ( = ?auto_445972 ?auto_445973 ) ) ( not ( = ?auto_445972 ?auto_445974 ) ) ( not ( = ?auto_445972 ?auto_445975 ) ) ( not ( = ?auto_445972 ?auto_445976 ) ) ( not ( = ?auto_445972 ?auto_445977 ) ) ( not ( = ?auto_445972 ?auto_445978 ) ) ( not ( = ?auto_445973 ?auto_445974 ) ) ( not ( = ?auto_445973 ?auto_445975 ) ) ( not ( = ?auto_445973 ?auto_445976 ) ) ( not ( = ?auto_445973 ?auto_445977 ) ) ( not ( = ?auto_445973 ?auto_445978 ) ) ( not ( = ?auto_445974 ?auto_445975 ) ) ( not ( = ?auto_445974 ?auto_445976 ) ) ( not ( = ?auto_445974 ?auto_445977 ) ) ( not ( = ?auto_445974 ?auto_445978 ) ) ( not ( = ?auto_445975 ?auto_445976 ) ) ( not ( = ?auto_445975 ?auto_445977 ) ) ( not ( = ?auto_445975 ?auto_445978 ) ) ( not ( = ?auto_445976 ?auto_445977 ) ) ( not ( = ?auto_445976 ?auto_445978 ) ) ( not ( = ?auto_445977 ?auto_445978 ) ) ( ON ?auto_445976 ?auto_445977 ) ( ON ?auto_445975 ?auto_445976 ) ( ON ?auto_445974 ?auto_445975 ) ( ON ?auto_445973 ?auto_445974 ) ( CLEAR ?auto_445971 ) ( ON ?auto_445972 ?auto_445973 ) ( CLEAR ?auto_445972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_445967 ?auto_445968 ?auto_445969 ?auto_445970 ?auto_445971 ?auto_445972 )
      ( MAKE-11PILE ?auto_445967 ?auto_445968 ?auto_445969 ?auto_445970 ?auto_445971 ?auto_445972 ?auto_445973 ?auto_445974 ?auto_445975 ?auto_445976 ?auto_445977 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_446013 - BLOCK
      ?auto_446014 - BLOCK
      ?auto_446015 - BLOCK
      ?auto_446016 - BLOCK
      ?auto_446017 - BLOCK
      ?auto_446018 - BLOCK
      ?auto_446019 - BLOCK
      ?auto_446020 - BLOCK
      ?auto_446021 - BLOCK
      ?auto_446022 - BLOCK
      ?auto_446023 - BLOCK
    )
    :vars
    (
      ?auto_446024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446023 ?auto_446024 ) ( ON-TABLE ?auto_446013 ) ( ON ?auto_446014 ?auto_446013 ) ( ON ?auto_446015 ?auto_446014 ) ( ON ?auto_446016 ?auto_446015 ) ( not ( = ?auto_446013 ?auto_446014 ) ) ( not ( = ?auto_446013 ?auto_446015 ) ) ( not ( = ?auto_446013 ?auto_446016 ) ) ( not ( = ?auto_446013 ?auto_446017 ) ) ( not ( = ?auto_446013 ?auto_446018 ) ) ( not ( = ?auto_446013 ?auto_446019 ) ) ( not ( = ?auto_446013 ?auto_446020 ) ) ( not ( = ?auto_446013 ?auto_446021 ) ) ( not ( = ?auto_446013 ?auto_446022 ) ) ( not ( = ?auto_446013 ?auto_446023 ) ) ( not ( = ?auto_446013 ?auto_446024 ) ) ( not ( = ?auto_446014 ?auto_446015 ) ) ( not ( = ?auto_446014 ?auto_446016 ) ) ( not ( = ?auto_446014 ?auto_446017 ) ) ( not ( = ?auto_446014 ?auto_446018 ) ) ( not ( = ?auto_446014 ?auto_446019 ) ) ( not ( = ?auto_446014 ?auto_446020 ) ) ( not ( = ?auto_446014 ?auto_446021 ) ) ( not ( = ?auto_446014 ?auto_446022 ) ) ( not ( = ?auto_446014 ?auto_446023 ) ) ( not ( = ?auto_446014 ?auto_446024 ) ) ( not ( = ?auto_446015 ?auto_446016 ) ) ( not ( = ?auto_446015 ?auto_446017 ) ) ( not ( = ?auto_446015 ?auto_446018 ) ) ( not ( = ?auto_446015 ?auto_446019 ) ) ( not ( = ?auto_446015 ?auto_446020 ) ) ( not ( = ?auto_446015 ?auto_446021 ) ) ( not ( = ?auto_446015 ?auto_446022 ) ) ( not ( = ?auto_446015 ?auto_446023 ) ) ( not ( = ?auto_446015 ?auto_446024 ) ) ( not ( = ?auto_446016 ?auto_446017 ) ) ( not ( = ?auto_446016 ?auto_446018 ) ) ( not ( = ?auto_446016 ?auto_446019 ) ) ( not ( = ?auto_446016 ?auto_446020 ) ) ( not ( = ?auto_446016 ?auto_446021 ) ) ( not ( = ?auto_446016 ?auto_446022 ) ) ( not ( = ?auto_446016 ?auto_446023 ) ) ( not ( = ?auto_446016 ?auto_446024 ) ) ( not ( = ?auto_446017 ?auto_446018 ) ) ( not ( = ?auto_446017 ?auto_446019 ) ) ( not ( = ?auto_446017 ?auto_446020 ) ) ( not ( = ?auto_446017 ?auto_446021 ) ) ( not ( = ?auto_446017 ?auto_446022 ) ) ( not ( = ?auto_446017 ?auto_446023 ) ) ( not ( = ?auto_446017 ?auto_446024 ) ) ( not ( = ?auto_446018 ?auto_446019 ) ) ( not ( = ?auto_446018 ?auto_446020 ) ) ( not ( = ?auto_446018 ?auto_446021 ) ) ( not ( = ?auto_446018 ?auto_446022 ) ) ( not ( = ?auto_446018 ?auto_446023 ) ) ( not ( = ?auto_446018 ?auto_446024 ) ) ( not ( = ?auto_446019 ?auto_446020 ) ) ( not ( = ?auto_446019 ?auto_446021 ) ) ( not ( = ?auto_446019 ?auto_446022 ) ) ( not ( = ?auto_446019 ?auto_446023 ) ) ( not ( = ?auto_446019 ?auto_446024 ) ) ( not ( = ?auto_446020 ?auto_446021 ) ) ( not ( = ?auto_446020 ?auto_446022 ) ) ( not ( = ?auto_446020 ?auto_446023 ) ) ( not ( = ?auto_446020 ?auto_446024 ) ) ( not ( = ?auto_446021 ?auto_446022 ) ) ( not ( = ?auto_446021 ?auto_446023 ) ) ( not ( = ?auto_446021 ?auto_446024 ) ) ( not ( = ?auto_446022 ?auto_446023 ) ) ( not ( = ?auto_446022 ?auto_446024 ) ) ( not ( = ?auto_446023 ?auto_446024 ) ) ( ON ?auto_446022 ?auto_446023 ) ( ON ?auto_446021 ?auto_446022 ) ( ON ?auto_446020 ?auto_446021 ) ( ON ?auto_446019 ?auto_446020 ) ( ON ?auto_446018 ?auto_446019 ) ( CLEAR ?auto_446016 ) ( ON ?auto_446017 ?auto_446018 ) ( CLEAR ?auto_446017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_446013 ?auto_446014 ?auto_446015 ?auto_446016 ?auto_446017 )
      ( MAKE-11PILE ?auto_446013 ?auto_446014 ?auto_446015 ?auto_446016 ?auto_446017 ?auto_446018 ?auto_446019 ?auto_446020 ?auto_446021 ?auto_446022 ?auto_446023 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_446059 - BLOCK
      ?auto_446060 - BLOCK
      ?auto_446061 - BLOCK
      ?auto_446062 - BLOCK
      ?auto_446063 - BLOCK
      ?auto_446064 - BLOCK
      ?auto_446065 - BLOCK
      ?auto_446066 - BLOCK
      ?auto_446067 - BLOCK
      ?auto_446068 - BLOCK
      ?auto_446069 - BLOCK
    )
    :vars
    (
      ?auto_446070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446069 ?auto_446070 ) ( ON-TABLE ?auto_446059 ) ( ON ?auto_446060 ?auto_446059 ) ( ON ?auto_446061 ?auto_446060 ) ( not ( = ?auto_446059 ?auto_446060 ) ) ( not ( = ?auto_446059 ?auto_446061 ) ) ( not ( = ?auto_446059 ?auto_446062 ) ) ( not ( = ?auto_446059 ?auto_446063 ) ) ( not ( = ?auto_446059 ?auto_446064 ) ) ( not ( = ?auto_446059 ?auto_446065 ) ) ( not ( = ?auto_446059 ?auto_446066 ) ) ( not ( = ?auto_446059 ?auto_446067 ) ) ( not ( = ?auto_446059 ?auto_446068 ) ) ( not ( = ?auto_446059 ?auto_446069 ) ) ( not ( = ?auto_446059 ?auto_446070 ) ) ( not ( = ?auto_446060 ?auto_446061 ) ) ( not ( = ?auto_446060 ?auto_446062 ) ) ( not ( = ?auto_446060 ?auto_446063 ) ) ( not ( = ?auto_446060 ?auto_446064 ) ) ( not ( = ?auto_446060 ?auto_446065 ) ) ( not ( = ?auto_446060 ?auto_446066 ) ) ( not ( = ?auto_446060 ?auto_446067 ) ) ( not ( = ?auto_446060 ?auto_446068 ) ) ( not ( = ?auto_446060 ?auto_446069 ) ) ( not ( = ?auto_446060 ?auto_446070 ) ) ( not ( = ?auto_446061 ?auto_446062 ) ) ( not ( = ?auto_446061 ?auto_446063 ) ) ( not ( = ?auto_446061 ?auto_446064 ) ) ( not ( = ?auto_446061 ?auto_446065 ) ) ( not ( = ?auto_446061 ?auto_446066 ) ) ( not ( = ?auto_446061 ?auto_446067 ) ) ( not ( = ?auto_446061 ?auto_446068 ) ) ( not ( = ?auto_446061 ?auto_446069 ) ) ( not ( = ?auto_446061 ?auto_446070 ) ) ( not ( = ?auto_446062 ?auto_446063 ) ) ( not ( = ?auto_446062 ?auto_446064 ) ) ( not ( = ?auto_446062 ?auto_446065 ) ) ( not ( = ?auto_446062 ?auto_446066 ) ) ( not ( = ?auto_446062 ?auto_446067 ) ) ( not ( = ?auto_446062 ?auto_446068 ) ) ( not ( = ?auto_446062 ?auto_446069 ) ) ( not ( = ?auto_446062 ?auto_446070 ) ) ( not ( = ?auto_446063 ?auto_446064 ) ) ( not ( = ?auto_446063 ?auto_446065 ) ) ( not ( = ?auto_446063 ?auto_446066 ) ) ( not ( = ?auto_446063 ?auto_446067 ) ) ( not ( = ?auto_446063 ?auto_446068 ) ) ( not ( = ?auto_446063 ?auto_446069 ) ) ( not ( = ?auto_446063 ?auto_446070 ) ) ( not ( = ?auto_446064 ?auto_446065 ) ) ( not ( = ?auto_446064 ?auto_446066 ) ) ( not ( = ?auto_446064 ?auto_446067 ) ) ( not ( = ?auto_446064 ?auto_446068 ) ) ( not ( = ?auto_446064 ?auto_446069 ) ) ( not ( = ?auto_446064 ?auto_446070 ) ) ( not ( = ?auto_446065 ?auto_446066 ) ) ( not ( = ?auto_446065 ?auto_446067 ) ) ( not ( = ?auto_446065 ?auto_446068 ) ) ( not ( = ?auto_446065 ?auto_446069 ) ) ( not ( = ?auto_446065 ?auto_446070 ) ) ( not ( = ?auto_446066 ?auto_446067 ) ) ( not ( = ?auto_446066 ?auto_446068 ) ) ( not ( = ?auto_446066 ?auto_446069 ) ) ( not ( = ?auto_446066 ?auto_446070 ) ) ( not ( = ?auto_446067 ?auto_446068 ) ) ( not ( = ?auto_446067 ?auto_446069 ) ) ( not ( = ?auto_446067 ?auto_446070 ) ) ( not ( = ?auto_446068 ?auto_446069 ) ) ( not ( = ?auto_446068 ?auto_446070 ) ) ( not ( = ?auto_446069 ?auto_446070 ) ) ( ON ?auto_446068 ?auto_446069 ) ( ON ?auto_446067 ?auto_446068 ) ( ON ?auto_446066 ?auto_446067 ) ( ON ?auto_446065 ?auto_446066 ) ( ON ?auto_446064 ?auto_446065 ) ( ON ?auto_446063 ?auto_446064 ) ( CLEAR ?auto_446061 ) ( ON ?auto_446062 ?auto_446063 ) ( CLEAR ?auto_446062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_446059 ?auto_446060 ?auto_446061 ?auto_446062 )
      ( MAKE-11PILE ?auto_446059 ?auto_446060 ?auto_446061 ?auto_446062 ?auto_446063 ?auto_446064 ?auto_446065 ?auto_446066 ?auto_446067 ?auto_446068 ?auto_446069 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_446105 - BLOCK
      ?auto_446106 - BLOCK
      ?auto_446107 - BLOCK
      ?auto_446108 - BLOCK
      ?auto_446109 - BLOCK
      ?auto_446110 - BLOCK
      ?auto_446111 - BLOCK
      ?auto_446112 - BLOCK
      ?auto_446113 - BLOCK
      ?auto_446114 - BLOCK
      ?auto_446115 - BLOCK
    )
    :vars
    (
      ?auto_446116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446115 ?auto_446116 ) ( ON-TABLE ?auto_446105 ) ( ON ?auto_446106 ?auto_446105 ) ( not ( = ?auto_446105 ?auto_446106 ) ) ( not ( = ?auto_446105 ?auto_446107 ) ) ( not ( = ?auto_446105 ?auto_446108 ) ) ( not ( = ?auto_446105 ?auto_446109 ) ) ( not ( = ?auto_446105 ?auto_446110 ) ) ( not ( = ?auto_446105 ?auto_446111 ) ) ( not ( = ?auto_446105 ?auto_446112 ) ) ( not ( = ?auto_446105 ?auto_446113 ) ) ( not ( = ?auto_446105 ?auto_446114 ) ) ( not ( = ?auto_446105 ?auto_446115 ) ) ( not ( = ?auto_446105 ?auto_446116 ) ) ( not ( = ?auto_446106 ?auto_446107 ) ) ( not ( = ?auto_446106 ?auto_446108 ) ) ( not ( = ?auto_446106 ?auto_446109 ) ) ( not ( = ?auto_446106 ?auto_446110 ) ) ( not ( = ?auto_446106 ?auto_446111 ) ) ( not ( = ?auto_446106 ?auto_446112 ) ) ( not ( = ?auto_446106 ?auto_446113 ) ) ( not ( = ?auto_446106 ?auto_446114 ) ) ( not ( = ?auto_446106 ?auto_446115 ) ) ( not ( = ?auto_446106 ?auto_446116 ) ) ( not ( = ?auto_446107 ?auto_446108 ) ) ( not ( = ?auto_446107 ?auto_446109 ) ) ( not ( = ?auto_446107 ?auto_446110 ) ) ( not ( = ?auto_446107 ?auto_446111 ) ) ( not ( = ?auto_446107 ?auto_446112 ) ) ( not ( = ?auto_446107 ?auto_446113 ) ) ( not ( = ?auto_446107 ?auto_446114 ) ) ( not ( = ?auto_446107 ?auto_446115 ) ) ( not ( = ?auto_446107 ?auto_446116 ) ) ( not ( = ?auto_446108 ?auto_446109 ) ) ( not ( = ?auto_446108 ?auto_446110 ) ) ( not ( = ?auto_446108 ?auto_446111 ) ) ( not ( = ?auto_446108 ?auto_446112 ) ) ( not ( = ?auto_446108 ?auto_446113 ) ) ( not ( = ?auto_446108 ?auto_446114 ) ) ( not ( = ?auto_446108 ?auto_446115 ) ) ( not ( = ?auto_446108 ?auto_446116 ) ) ( not ( = ?auto_446109 ?auto_446110 ) ) ( not ( = ?auto_446109 ?auto_446111 ) ) ( not ( = ?auto_446109 ?auto_446112 ) ) ( not ( = ?auto_446109 ?auto_446113 ) ) ( not ( = ?auto_446109 ?auto_446114 ) ) ( not ( = ?auto_446109 ?auto_446115 ) ) ( not ( = ?auto_446109 ?auto_446116 ) ) ( not ( = ?auto_446110 ?auto_446111 ) ) ( not ( = ?auto_446110 ?auto_446112 ) ) ( not ( = ?auto_446110 ?auto_446113 ) ) ( not ( = ?auto_446110 ?auto_446114 ) ) ( not ( = ?auto_446110 ?auto_446115 ) ) ( not ( = ?auto_446110 ?auto_446116 ) ) ( not ( = ?auto_446111 ?auto_446112 ) ) ( not ( = ?auto_446111 ?auto_446113 ) ) ( not ( = ?auto_446111 ?auto_446114 ) ) ( not ( = ?auto_446111 ?auto_446115 ) ) ( not ( = ?auto_446111 ?auto_446116 ) ) ( not ( = ?auto_446112 ?auto_446113 ) ) ( not ( = ?auto_446112 ?auto_446114 ) ) ( not ( = ?auto_446112 ?auto_446115 ) ) ( not ( = ?auto_446112 ?auto_446116 ) ) ( not ( = ?auto_446113 ?auto_446114 ) ) ( not ( = ?auto_446113 ?auto_446115 ) ) ( not ( = ?auto_446113 ?auto_446116 ) ) ( not ( = ?auto_446114 ?auto_446115 ) ) ( not ( = ?auto_446114 ?auto_446116 ) ) ( not ( = ?auto_446115 ?auto_446116 ) ) ( ON ?auto_446114 ?auto_446115 ) ( ON ?auto_446113 ?auto_446114 ) ( ON ?auto_446112 ?auto_446113 ) ( ON ?auto_446111 ?auto_446112 ) ( ON ?auto_446110 ?auto_446111 ) ( ON ?auto_446109 ?auto_446110 ) ( ON ?auto_446108 ?auto_446109 ) ( CLEAR ?auto_446106 ) ( ON ?auto_446107 ?auto_446108 ) ( CLEAR ?auto_446107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_446105 ?auto_446106 ?auto_446107 )
      ( MAKE-11PILE ?auto_446105 ?auto_446106 ?auto_446107 ?auto_446108 ?auto_446109 ?auto_446110 ?auto_446111 ?auto_446112 ?auto_446113 ?auto_446114 ?auto_446115 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_446151 - BLOCK
      ?auto_446152 - BLOCK
      ?auto_446153 - BLOCK
      ?auto_446154 - BLOCK
      ?auto_446155 - BLOCK
      ?auto_446156 - BLOCK
      ?auto_446157 - BLOCK
      ?auto_446158 - BLOCK
      ?auto_446159 - BLOCK
      ?auto_446160 - BLOCK
      ?auto_446161 - BLOCK
    )
    :vars
    (
      ?auto_446162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446161 ?auto_446162 ) ( ON-TABLE ?auto_446151 ) ( not ( = ?auto_446151 ?auto_446152 ) ) ( not ( = ?auto_446151 ?auto_446153 ) ) ( not ( = ?auto_446151 ?auto_446154 ) ) ( not ( = ?auto_446151 ?auto_446155 ) ) ( not ( = ?auto_446151 ?auto_446156 ) ) ( not ( = ?auto_446151 ?auto_446157 ) ) ( not ( = ?auto_446151 ?auto_446158 ) ) ( not ( = ?auto_446151 ?auto_446159 ) ) ( not ( = ?auto_446151 ?auto_446160 ) ) ( not ( = ?auto_446151 ?auto_446161 ) ) ( not ( = ?auto_446151 ?auto_446162 ) ) ( not ( = ?auto_446152 ?auto_446153 ) ) ( not ( = ?auto_446152 ?auto_446154 ) ) ( not ( = ?auto_446152 ?auto_446155 ) ) ( not ( = ?auto_446152 ?auto_446156 ) ) ( not ( = ?auto_446152 ?auto_446157 ) ) ( not ( = ?auto_446152 ?auto_446158 ) ) ( not ( = ?auto_446152 ?auto_446159 ) ) ( not ( = ?auto_446152 ?auto_446160 ) ) ( not ( = ?auto_446152 ?auto_446161 ) ) ( not ( = ?auto_446152 ?auto_446162 ) ) ( not ( = ?auto_446153 ?auto_446154 ) ) ( not ( = ?auto_446153 ?auto_446155 ) ) ( not ( = ?auto_446153 ?auto_446156 ) ) ( not ( = ?auto_446153 ?auto_446157 ) ) ( not ( = ?auto_446153 ?auto_446158 ) ) ( not ( = ?auto_446153 ?auto_446159 ) ) ( not ( = ?auto_446153 ?auto_446160 ) ) ( not ( = ?auto_446153 ?auto_446161 ) ) ( not ( = ?auto_446153 ?auto_446162 ) ) ( not ( = ?auto_446154 ?auto_446155 ) ) ( not ( = ?auto_446154 ?auto_446156 ) ) ( not ( = ?auto_446154 ?auto_446157 ) ) ( not ( = ?auto_446154 ?auto_446158 ) ) ( not ( = ?auto_446154 ?auto_446159 ) ) ( not ( = ?auto_446154 ?auto_446160 ) ) ( not ( = ?auto_446154 ?auto_446161 ) ) ( not ( = ?auto_446154 ?auto_446162 ) ) ( not ( = ?auto_446155 ?auto_446156 ) ) ( not ( = ?auto_446155 ?auto_446157 ) ) ( not ( = ?auto_446155 ?auto_446158 ) ) ( not ( = ?auto_446155 ?auto_446159 ) ) ( not ( = ?auto_446155 ?auto_446160 ) ) ( not ( = ?auto_446155 ?auto_446161 ) ) ( not ( = ?auto_446155 ?auto_446162 ) ) ( not ( = ?auto_446156 ?auto_446157 ) ) ( not ( = ?auto_446156 ?auto_446158 ) ) ( not ( = ?auto_446156 ?auto_446159 ) ) ( not ( = ?auto_446156 ?auto_446160 ) ) ( not ( = ?auto_446156 ?auto_446161 ) ) ( not ( = ?auto_446156 ?auto_446162 ) ) ( not ( = ?auto_446157 ?auto_446158 ) ) ( not ( = ?auto_446157 ?auto_446159 ) ) ( not ( = ?auto_446157 ?auto_446160 ) ) ( not ( = ?auto_446157 ?auto_446161 ) ) ( not ( = ?auto_446157 ?auto_446162 ) ) ( not ( = ?auto_446158 ?auto_446159 ) ) ( not ( = ?auto_446158 ?auto_446160 ) ) ( not ( = ?auto_446158 ?auto_446161 ) ) ( not ( = ?auto_446158 ?auto_446162 ) ) ( not ( = ?auto_446159 ?auto_446160 ) ) ( not ( = ?auto_446159 ?auto_446161 ) ) ( not ( = ?auto_446159 ?auto_446162 ) ) ( not ( = ?auto_446160 ?auto_446161 ) ) ( not ( = ?auto_446160 ?auto_446162 ) ) ( not ( = ?auto_446161 ?auto_446162 ) ) ( ON ?auto_446160 ?auto_446161 ) ( ON ?auto_446159 ?auto_446160 ) ( ON ?auto_446158 ?auto_446159 ) ( ON ?auto_446157 ?auto_446158 ) ( ON ?auto_446156 ?auto_446157 ) ( ON ?auto_446155 ?auto_446156 ) ( ON ?auto_446154 ?auto_446155 ) ( ON ?auto_446153 ?auto_446154 ) ( CLEAR ?auto_446151 ) ( ON ?auto_446152 ?auto_446153 ) ( CLEAR ?auto_446152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_446151 ?auto_446152 )
      ( MAKE-11PILE ?auto_446151 ?auto_446152 ?auto_446153 ?auto_446154 ?auto_446155 ?auto_446156 ?auto_446157 ?auto_446158 ?auto_446159 ?auto_446160 ?auto_446161 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_446197 - BLOCK
      ?auto_446198 - BLOCK
      ?auto_446199 - BLOCK
      ?auto_446200 - BLOCK
      ?auto_446201 - BLOCK
      ?auto_446202 - BLOCK
      ?auto_446203 - BLOCK
      ?auto_446204 - BLOCK
      ?auto_446205 - BLOCK
      ?auto_446206 - BLOCK
      ?auto_446207 - BLOCK
    )
    :vars
    (
      ?auto_446208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446207 ?auto_446208 ) ( not ( = ?auto_446197 ?auto_446198 ) ) ( not ( = ?auto_446197 ?auto_446199 ) ) ( not ( = ?auto_446197 ?auto_446200 ) ) ( not ( = ?auto_446197 ?auto_446201 ) ) ( not ( = ?auto_446197 ?auto_446202 ) ) ( not ( = ?auto_446197 ?auto_446203 ) ) ( not ( = ?auto_446197 ?auto_446204 ) ) ( not ( = ?auto_446197 ?auto_446205 ) ) ( not ( = ?auto_446197 ?auto_446206 ) ) ( not ( = ?auto_446197 ?auto_446207 ) ) ( not ( = ?auto_446197 ?auto_446208 ) ) ( not ( = ?auto_446198 ?auto_446199 ) ) ( not ( = ?auto_446198 ?auto_446200 ) ) ( not ( = ?auto_446198 ?auto_446201 ) ) ( not ( = ?auto_446198 ?auto_446202 ) ) ( not ( = ?auto_446198 ?auto_446203 ) ) ( not ( = ?auto_446198 ?auto_446204 ) ) ( not ( = ?auto_446198 ?auto_446205 ) ) ( not ( = ?auto_446198 ?auto_446206 ) ) ( not ( = ?auto_446198 ?auto_446207 ) ) ( not ( = ?auto_446198 ?auto_446208 ) ) ( not ( = ?auto_446199 ?auto_446200 ) ) ( not ( = ?auto_446199 ?auto_446201 ) ) ( not ( = ?auto_446199 ?auto_446202 ) ) ( not ( = ?auto_446199 ?auto_446203 ) ) ( not ( = ?auto_446199 ?auto_446204 ) ) ( not ( = ?auto_446199 ?auto_446205 ) ) ( not ( = ?auto_446199 ?auto_446206 ) ) ( not ( = ?auto_446199 ?auto_446207 ) ) ( not ( = ?auto_446199 ?auto_446208 ) ) ( not ( = ?auto_446200 ?auto_446201 ) ) ( not ( = ?auto_446200 ?auto_446202 ) ) ( not ( = ?auto_446200 ?auto_446203 ) ) ( not ( = ?auto_446200 ?auto_446204 ) ) ( not ( = ?auto_446200 ?auto_446205 ) ) ( not ( = ?auto_446200 ?auto_446206 ) ) ( not ( = ?auto_446200 ?auto_446207 ) ) ( not ( = ?auto_446200 ?auto_446208 ) ) ( not ( = ?auto_446201 ?auto_446202 ) ) ( not ( = ?auto_446201 ?auto_446203 ) ) ( not ( = ?auto_446201 ?auto_446204 ) ) ( not ( = ?auto_446201 ?auto_446205 ) ) ( not ( = ?auto_446201 ?auto_446206 ) ) ( not ( = ?auto_446201 ?auto_446207 ) ) ( not ( = ?auto_446201 ?auto_446208 ) ) ( not ( = ?auto_446202 ?auto_446203 ) ) ( not ( = ?auto_446202 ?auto_446204 ) ) ( not ( = ?auto_446202 ?auto_446205 ) ) ( not ( = ?auto_446202 ?auto_446206 ) ) ( not ( = ?auto_446202 ?auto_446207 ) ) ( not ( = ?auto_446202 ?auto_446208 ) ) ( not ( = ?auto_446203 ?auto_446204 ) ) ( not ( = ?auto_446203 ?auto_446205 ) ) ( not ( = ?auto_446203 ?auto_446206 ) ) ( not ( = ?auto_446203 ?auto_446207 ) ) ( not ( = ?auto_446203 ?auto_446208 ) ) ( not ( = ?auto_446204 ?auto_446205 ) ) ( not ( = ?auto_446204 ?auto_446206 ) ) ( not ( = ?auto_446204 ?auto_446207 ) ) ( not ( = ?auto_446204 ?auto_446208 ) ) ( not ( = ?auto_446205 ?auto_446206 ) ) ( not ( = ?auto_446205 ?auto_446207 ) ) ( not ( = ?auto_446205 ?auto_446208 ) ) ( not ( = ?auto_446206 ?auto_446207 ) ) ( not ( = ?auto_446206 ?auto_446208 ) ) ( not ( = ?auto_446207 ?auto_446208 ) ) ( ON ?auto_446206 ?auto_446207 ) ( ON ?auto_446205 ?auto_446206 ) ( ON ?auto_446204 ?auto_446205 ) ( ON ?auto_446203 ?auto_446204 ) ( ON ?auto_446202 ?auto_446203 ) ( ON ?auto_446201 ?auto_446202 ) ( ON ?auto_446200 ?auto_446201 ) ( ON ?auto_446199 ?auto_446200 ) ( ON ?auto_446198 ?auto_446199 ) ( ON ?auto_446197 ?auto_446198 ) ( CLEAR ?auto_446197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_446197 )
      ( MAKE-11PILE ?auto_446197 ?auto_446198 ?auto_446199 ?auto_446200 ?auto_446201 ?auto_446202 ?auto_446203 ?auto_446204 ?auto_446205 ?auto_446206 ?auto_446207 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_446244 - BLOCK
      ?auto_446245 - BLOCK
      ?auto_446246 - BLOCK
      ?auto_446247 - BLOCK
      ?auto_446248 - BLOCK
      ?auto_446249 - BLOCK
      ?auto_446250 - BLOCK
      ?auto_446251 - BLOCK
      ?auto_446252 - BLOCK
      ?auto_446253 - BLOCK
      ?auto_446254 - BLOCK
      ?auto_446255 - BLOCK
    )
    :vars
    (
      ?auto_446256 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_446254 ) ( ON ?auto_446255 ?auto_446256 ) ( CLEAR ?auto_446255 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_446244 ) ( ON ?auto_446245 ?auto_446244 ) ( ON ?auto_446246 ?auto_446245 ) ( ON ?auto_446247 ?auto_446246 ) ( ON ?auto_446248 ?auto_446247 ) ( ON ?auto_446249 ?auto_446248 ) ( ON ?auto_446250 ?auto_446249 ) ( ON ?auto_446251 ?auto_446250 ) ( ON ?auto_446252 ?auto_446251 ) ( ON ?auto_446253 ?auto_446252 ) ( ON ?auto_446254 ?auto_446253 ) ( not ( = ?auto_446244 ?auto_446245 ) ) ( not ( = ?auto_446244 ?auto_446246 ) ) ( not ( = ?auto_446244 ?auto_446247 ) ) ( not ( = ?auto_446244 ?auto_446248 ) ) ( not ( = ?auto_446244 ?auto_446249 ) ) ( not ( = ?auto_446244 ?auto_446250 ) ) ( not ( = ?auto_446244 ?auto_446251 ) ) ( not ( = ?auto_446244 ?auto_446252 ) ) ( not ( = ?auto_446244 ?auto_446253 ) ) ( not ( = ?auto_446244 ?auto_446254 ) ) ( not ( = ?auto_446244 ?auto_446255 ) ) ( not ( = ?auto_446244 ?auto_446256 ) ) ( not ( = ?auto_446245 ?auto_446246 ) ) ( not ( = ?auto_446245 ?auto_446247 ) ) ( not ( = ?auto_446245 ?auto_446248 ) ) ( not ( = ?auto_446245 ?auto_446249 ) ) ( not ( = ?auto_446245 ?auto_446250 ) ) ( not ( = ?auto_446245 ?auto_446251 ) ) ( not ( = ?auto_446245 ?auto_446252 ) ) ( not ( = ?auto_446245 ?auto_446253 ) ) ( not ( = ?auto_446245 ?auto_446254 ) ) ( not ( = ?auto_446245 ?auto_446255 ) ) ( not ( = ?auto_446245 ?auto_446256 ) ) ( not ( = ?auto_446246 ?auto_446247 ) ) ( not ( = ?auto_446246 ?auto_446248 ) ) ( not ( = ?auto_446246 ?auto_446249 ) ) ( not ( = ?auto_446246 ?auto_446250 ) ) ( not ( = ?auto_446246 ?auto_446251 ) ) ( not ( = ?auto_446246 ?auto_446252 ) ) ( not ( = ?auto_446246 ?auto_446253 ) ) ( not ( = ?auto_446246 ?auto_446254 ) ) ( not ( = ?auto_446246 ?auto_446255 ) ) ( not ( = ?auto_446246 ?auto_446256 ) ) ( not ( = ?auto_446247 ?auto_446248 ) ) ( not ( = ?auto_446247 ?auto_446249 ) ) ( not ( = ?auto_446247 ?auto_446250 ) ) ( not ( = ?auto_446247 ?auto_446251 ) ) ( not ( = ?auto_446247 ?auto_446252 ) ) ( not ( = ?auto_446247 ?auto_446253 ) ) ( not ( = ?auto_446247 ?auto_446254 ) ) ( not ( = ?auto_446247 ?auto_446255 ) ) ( not ( = ?auto_446247 ?auto_446256 ) ) ( not ( = ?auto_446248 ?auto_446249 ) ) ( not ( = ?auto_446248 ?auto_446250 ) ) ( not ( = ?auto_446248 ?auto_446251 ) ) ( not ( = ?auto_446248 ?auto_446252 ) ) ( not ( = ?auto_446248 ?auto_446253 ) ) ( not ( = ?auto_446248 ?auto_446254 ) ) ( not ( = ?auto_446248 ?auto_446255 ) ) ( not ( = ?auto_446248 ?auto_446256 ) ) ( not ( = ?auto_446249 ?auto_446250 ) ) ( not ( = ?auto_446249 ?auto_446251 ) ) ( not ( = ?auto_446249 ?auto_446252 ) ) ( not ( = ?auto_446249 ?auto_446253 ) ) ( not ( = ?auto_446249 ?auto_446254 ) ) ( not ( = ?auto_446249 ?auto_446255 ) ) ( not ( = ?auto_446249 ?auto_446256 ) ) ( not ( = ?auto_446250 ?auto_446251 ) ) ( not ( = ?auto_446250 ?auto_446252 ) ) ( not ( = ?auto_446250 ?auto_446253 ) ) ( not ( = ?auto_446250 ?auto_446254 ) ) ( not ( = ?auto_446250 ?auto_446255 ) ) ( not ( = ?auto_446250 ?auto_446256 ) ) ( not ( = ?auto_446251 ?auto_446252 ) ) ( not ( = ?auto_446251 ?auto_446253 ) ) ( not ( = ?auto_446251 ?auto_446254 ) ) ( not ( = ?auto_446251 ?auto_446255 ) ) ( not ( = ?auto_446251 ?auto_446256 ) ) ( not ( = ?auto_446252 ?auto_446253 ) ) ( not ( = ?auto_446252 ?auto_446254 ) ) ( not ( = ?auto_446252 ?auto_446255 ) ) ( not ( = ?auto_446252 ?auto_446256 ) ) ( not ( = ?auto_446253 ?auto_446254 ) ) ( not ( = ?auto_446253 ?auto_446255 ) ) ( not ( = ?auto_446253 ?auto_446256 ) ) ( not ( = ?auto_446254 ?auto_446255 ) ) ( not ( = ?auto_446254 ?auto_446256 ) ) ( not ( = ?auto_446255 ?auto_446256 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_446255 ?auto_446256 )
      ( !STACK ?auto_446255 ?auto_446254 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_446294 - BLOCK
      ?auto_446295 - BLOCK
      ?auto_446296 - BLOCK
      ?auto_446297 - BLOCK
      ?auto_446298 - BLOCK
      ?auto_446299 - BLOCK
      ?auto_446300 - BLOCK
      ?auto_446301 - BLOCK
      ?auto_446302 - BLOCK
      ?auto_446303 - BLOCK
      ?auto_446304 - BLOCK
      ?auto_446305 - BLOCK
    )
    :vars
    (
      ?auto_446306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446305 ?auto_446306 ) ( ON-TABLE ?auto_446294 ) ( ON ?auto_446295 ?auto_446294 ) ( ON ?auto_446296 ?auto_446295 ) ( ON ?auto_446297 ?auto_446296 ) ( ON ?auto_446298 ?auto_446297 ) ( ON ?auto_446299 ?auto_446298 ) ( ON ?auto_446300 ?auto_446299 ) ( ON ?auto_446301 ?auto_446300 ) ( ON ?auto_446302 ?auto_446301 ) ( ON ?auto_446303 ?auto_446302 ) ( not ( = ?auto_446294 ?auto_446295 ) ) ( not ( = ?auto_446294 ?auto_446296 ) ) ( not ( = ?auto_446294 ?auto_446297 ) ) ( not ( = ?auto_446294 ?auto_446298 ) ) ( not ( = ?auto_446294 ?auto_446299 ) ) ( not ( = ?auto_446294 ?auto_446300 ) ) ( not ( = ?auto_446294 ?auto_446301 ) ) ( not ( = ?auto_446294 ?auto_446302 ) ) ( not ( = ?auto_446294 ?auto_446303 ) ) ( not ( = ?auto_446294 ?auto_446304 ) ) ( not ( = ?auto_446294 ?auto_446305 ) ) ( not ( = ?auto_446294 ?auto_446306 ) ) ( not ( = ?auto_446295 ?auto_446296 ) ) ( not ( = ?auto_446295 ?auto_446297 ) ) ( not ( = ?auto_446295 ?auto_446298 ) ) ( not ( = ?auto_446295 ?auto_446299 ) ) ( not ( = ?auto_446295 ?auto_446300 ) ) ( not ( = ?auto_446295 ?auto_446301 ) ) ( not ( = ?auto_446295 ?auto_446302 ) ) ( not ( = ?auto_446295 ?auto_446303 ) ) ( not ( = ?auto_446295 ?auto_446304 ) ) ( not ( = ?auto_446295 ?auto_446305 ) ) ( not ( = ?auto_446295 ?auto_446306 ) ) ( not ( = ?auto_446296 ?auto_446297 ) ) ( not ( = ?auto_446296 ?auto_446298 ) ) ( not ( = ?auto_446296 ?auto_446299 ) ) ( not ( = ?auto_446296 ?auto_446300 ) ) ( not ( = ?auto_446296 ?auto_446301 ) ) ( not ( = ?auto_446296 ?auto_446302 ) ) ( not ( = ?auto_446296 ?auto_446303 ) ) ( not ( = ?auto_446296 ?auto_446304 ) ) ( not ( = ?auto_446296 ?auto_446305 ) ) ( not ( = ?auto_446296 ?auto_446306 ) ) ( not ( = ?auto_446297 ?auto_446298 ) ) ( not ( = ?auto_446297 ?auto_446299 ) ) ( not ( = ?auto_446297 ?auto_446300 ) ) ( not ( = ?auto_446297 ?auto_446301 ) ) ( not ( = ?auto_446297 ?auto_446302 ) ) ( not ( = ?auto_446297 ?auto_446303 ) ) ( not ( = ?auto_446297 ?auto_446304 ) ) ( not ( = ?auto_446297 ?auto_446305 ) ) ( not ( = ?auto_446297 ?auto_446306 ) ) ( not ( = ?auto_446298 ?auto_446299 ) ) ( not ( = ?auto_446298 ?auto_446300 ) ) ( not ( = ?auto_446298 ?auto_446301 ) ) ( not ( = ?auto_446298 ?auto_446302 ) ) ( not ( = ?auto_446298 ?auto_446303 ) ) ( not ( = ?auto_446298 ?auto_446304 ) ) ( not ( = ?auto_446298 ?auto_446305 ) ) ( not ( = ?auto_446298 ?auto_446306 ) ) ( not ( = ?auto_446299 ?auto_446300 ) ) ( not ( = ?auto_446299 ?auto_446301 ) ) ( not ( = ?auto_446299 ?auto_446302 ) ) ( not ( = ?auto_446299 ?auto_446303 ) ) ( not ( = ?auto_446299 ?auto_446304 ) ) ( not ( = ?auto_446299 ?auto_446305 ) ) ( not ( = ?auto_446299 ?auto_446306 ) ) ( not ( = ?auto_446300 ?auto_446301 ) ) ( not ( = ?auto_446300 ?auto_446302 ) ) ( not ( = ?auto_446300 ?auto_446303 ) ) ( not ( = ?auto_446300 ?auto_446304 ) ) ( not ( = ?auto_446300 ?auto_446305 ) ) ( not ( = ?auto_446300 ?auto_446306 ) ) ( not ( = ?auto_446301 ?auto_446302 ) ) ( not ( = ?auto_446301 ?auto_446303 ) ) ( not ( = ?auto_446301 ?auto_446304 ) ) ( not ( = ?auto_446301 ?auto_446305 ) ) ( not ( = ?auto_446301 ?auto_446306 ) ) ( not ( = ?auto_446302 ?auto_446303 ) ) ( not ( = ?auto_446302 ?auto_446304 ) ) ( not ( = ?auto_446302 ?auto_446305 ) ) ( not ( = ?auto_446302 ?auto_446306 ) ) ( not ( = ?auto_446303 ?auto_446304 ) ) ( not ( = ?auto_446303 ?auto_446305 ) ) ( not ( = ?auto_446303 ?auto_446306 ) ) ( not ( = ?auto_446304 ?auto_446305 ) ) ( not ( = ?auto_446304 ?auto_446306 ) ) ( not ( = ?auto_446305 ?auto_446306 ) ) ( CLEAR ?auto_446303 ) ( ON ?auto_446304 ?auto_446305 ) ( CLEAR ?auto_446304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_446294 ?auto_446295 ?auto_446296 ?auto_446297 ?auto_446298 ?auto_446299 ?auto_446300 ?auto_446301 ?auto_446302 ?auto_446303 ?auto_446304 )
      ( MAKE-12PILE ?auto_446294 ?auto_446295 ?auto_446296 ?auto_446297 ?auto_446298 ?auto_446299 ?auto_446300 ?auto_446301 ?auto_446302 ?auto_446303 ?auto_446304 ?auto_446305 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_446344 - BLOCK
      ?auto_446345 - BLOCK
      ?auto_446346 - BLOCK
      ?auto_446347 - BLOCK
      ?auto_446348 - BLOCK
      ?auto_446349 - BLOCK
      ?auto_446350 - BLOCK
      ?auto_446351 - BLOCK
      ?auto_446352 - BLOCK
      ?auto_446353 - BLOCK
      ?auto_446354 - BLOCK
      ?auto_446355 - BLOCK
    )
    :vars
    (
      ?auto_446356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446355 ?auto_446356 ) ( ON-TABLE ?auto_446344 ) ( ON ?auto_446345 ?auto_446344 ) ( ON ?auto_446346 ?auto_446345 ) ( ON ?auto_446347 ?auto_446346 ) ( ON ?auto_446348 ?auto_446347 ) ( ON ?auto_446349 ?auto_446348 ) ( ON ?auto_446350 ?auto_446349 ) ( ON ?auto_446351 ?auto_446350 ) ( ON ?auto_446352 ?auto_446351 ) ( not ( = ?auto_446344 ?auto_446345 ) ) ( not ( = ?auto_446344 ?auto_446346 ) ) ( not ( = ?auto_446344 ?auto_446347 ) ) ( not ( = ?auto_446344 ?auto_446348 ) ) ( not ( = ?auto_446344 ?auto_446349 ) ) ( not ( = ?auto_446344 ?auto_446350 ) ) ( not ( = ?auto_446344 ?auto_446351 ) ) ( not ( = ?auto_446344 ?auto_446352 ) ) ( not ( = ?auto_446344 ?auto_446353 ) ) ( not ( = ?auto_446344 ?auto_446354 ) ) ( not ( = ?auto_446344 ?auto_446355 ) ) ( not ( = ?auto_446344 ?auto_446356 ) ) ( not ( = ?auto_446345 ?auto_446346 ) ) ( not ( = ?auto_446345 ?auto_446347 ) ) ( not ( = ?auto_446345 ?auto_446348 ) ) ( not ( = ?auto_446345 ?auto_446349 ) ) ( not ( = ?auto_446345 ?auto_446350 ) ) ( not ( = ?auto_446345 ?auto_446351 ) ) ( not ( = ?auto_446345 ?auto_446352 ) ) ( not ( = ?auto_446345 ?auto_446353 ) ) ( not ( = ?auto_446345 ?auto_446354 ) ) ( not ( = ?auto_446345 ?auto_446355 ) ) ( not ( = ?auto_446345 ?auto_446356 ) ) ( not ( = ?auto_446346 ?auto_446347 ) ) ( not ( = ?auto_446346 ?auto_446348 ) ) ( not ( = ?auto_446346 ?auto_446349 ) ) ( not ( = ?auto_446346 ?auto_446350 ) ) ( not ( = ?auto_446346 ?auto_446351 ) ) ( not ( = ?auto_446346 ?auto_446352 ) ) ( not ( = ?auto_446346 ?auto_446353 ) ) ( not ( = ?auto_446346 ?auto_446354 ) ) ( not ( = ?auto_446346 ?auto_446355 ) ) ( not ( = ?auto_446346 ?auto_446356 ) ) ( not ( = ?auto_446347 ?auto_446348 ) ) ( not ( = ?auto_446347 ?auto_446349 ) ) ( not ( = ?auto_446347 ?auto_446350 ) ) ( not ( = ?auto_446347 ?auto_446351 ) ) ( not ( = ?auto_446347 ?auto_446352 ) ) ( not ( = ?auto_446347 ?auto_446353 ) ) ( not ( = ?auto_446347 ?auto_446354 ) ) ( not ( = ?auto_446347 ?auto_446355 ) ) ( not ( = ?auto_446347 ?auto_446356 ) ) ( not ( = ?auto_446348 ?auto_446349 ) ) ( not ( = ?auto_446348 ?auto_446350 ) ) ( not ( = ?auto_446348 ?auto_446351 ) ) ( not ( = ?auto_446348 ?auto_446352 ) ) ( not ( = ?auto_446348 ?auto_446353 ) ) ( not ( = ?auto_446348 ?auto_446354 ) ) ( not ( = ?auto_446348 ?auto_446355 ) ) ( not ( = ?auto_446348 ?auto_446356 ) ) ( not ( = ?auto_446349 ?auto_446350 ) ) ( not ( = ?auto_446349 ?auto_446351 ) ) ( not ( = ?auto_446349 ?auto_446352 ) ) ( not ( = ?auto_446349 ?auto_446353 ) ) ( not ( = ?auto_446349 ?auto_446354 ) ) ( not ( = ?auto_446349 ?auto_446355 ) ) ( not ( = ?auto_446349 ?auto_446356 ) ) ( not ( = ?auto_446350 ?auto_446351 ) ) ( not ( = ?auto_446350 ?auto_446352 ) ) ( not ( = ?auto_446350 ?auto_446353 ) ) ( not ( = ?auto_446350 ?auto_446354 ) ) ( not ( = ?auto_446350 ?auto_446355 ) ) ( not ( = ?auto_446350 ?auto_446356 ) ) ( not ( = ?auto_446351 ?auto_446352 ) ) ( not ( = ?auto_446351 ?auto_446353 ) ) ( not ( = ?auto_446351 ?auto_446354 ) ) ( not ( = ?auto_446351 ?auto_446355 ) ) ( not ( = ?auto_446351 ?auto_446356 ) ) ( not ( = ?auto_446352 ?auto_446353 ) ) ( not ( = ?auto_446352 ?auto_446354 ) ) ( not ( = ?auto_446352 ?auto_446355 ) ) ( not ( = ?auto_446352 ?auto_446356 ) ) ( not ( = ?auto_446353 ?auto_446354 ) ) ( not ( = ?auto_446353 ?auto_446355 ) ) ( not ( = ?auto_446353 ?auto_446356 ) ) ( not ( = ?auto_446354 ?auto_446355 ) ) ( not ( = ?auto_446354 ?auto_446356 ) ) ( not ( = ?auto_446355 ?auto_446356 ) ) ( ON ?auto_446354 ?auto_446355 ) ( CLEAR ?auto_446352 ) ( ON ?auto_446353 ?auto_446354 ) ( CLEAR ?auto_446353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_446344 ?auto_446345 ?auto_446346 ?auto_446347 ?auto_446348 ?auto_446349 ?auto_446350 ?auto_446351 ?auto_446352 ?auto_446353 )
      ( MAKE-12PILE ?auto_446344 ?auto_446345 ?auto_446346 ?auto_446347 ?auto_446348 ?auto_446349 ?auto_446350 ?auto_446351 ?auto_446352 ?auto_446353 ?auto_446354 ?auto_446355 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_446394 - BLOCK
      ?auto_446395 - BLOCK
      ?auto_446396 - BLOCK
      ?auto_446397 - BLOCK
      ?auto_446398 - BLOCK
      ?auto_446399 - BLOCK
      ?auto_446400 - BLOCK
      ?auto_446401 - BLOCK
      ?auto_446402 - BLOCK
      ?auto_446403 - BLOCK
      ?auto_446404 - BLOCK
      ?auto_446405 - BLOCK
    )
    :vars
    (
      ?auto_446406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446405 ?auto_446406 ) ( ON-TABLE ?auto_446394 ) ( ON ?auto_446395 ?auto_446394 ) ( ON ?auto_446396 ?auto_446395 ) ( ON ?auto_446397 ?auto_446396 ) ( ON ?auto_446398 ?auto_446397 ) ( ON ?auto_446399 ?auto_446398 ) ( ON ?auto_446400 ?auto_446399 ) ( ON ?auto_446401 ?auto_446400 ) ( not ( = ?auto_446394 ?auto_446395 ) ) ( not ( = ?auto_446394 ?auto_446396 ) ) ( not ( = ?auto_446394 ?auto_446397 ) ) ( not ( = ?auto_446394 ?auto_446398 ) ) ( not ( = ?auto_446394 ?auto_446399 ) ) ( not ( = ?auto_446394 ?auto_446400 ) ) ( not ( = ?auto_446394 ?auto_446401 ) ) ( not ( = ?auto_446394 ?auto_446402 ) ) ( not ( = ?auto_446394 ?auto_446403 ) ) ( not ( = ?auto_446394 ?auto_446404 ) ) ( not ( = ?auto_446394 ?auto_446405 ) ) ( not ( = ?auto_446394 ?auto_446406 ) ) ( not ( = ?auto_446395 ?auto_446396 ) ) ( not ( = ?auto_446395 ?auto_446397 ) ) ( not ( = ?auto_446395 ?auto_446398 ) ) ( not ( = ?auto_446395 ?auto_446399 ) ) ( not ( = ?auto_446395 ?auto_446400 ) ) ( not ( = ?auto_446395 ?auto_446401 ) ) ( not ( = ?auto_446395 ?auto_446402 ) ) ( not ( = ?auto_446395 ?auto_446403 ) ) ( not ( = ?auto_446395 ?auto_446404 ) ) ( not ( = ?auto_446395 ?auto_446405 ) ) ( not ( = ?auto_446395 ?auto_446406 ) ) ( not ( = ?auto_446396 ?auto_446397 ) ) ( not ( = ?auto_446396 ?auto_446398 ) ) ( not ( = ?auto_446396 ?auto_446399 ) ) ( not ( = ?auto_446396 ?auto_446400 ) ) ( not ( = ?auto_446396 ?auto_446401 ) ) ( not ( = ?auto_446396 ?auto_446402 ) ) ( not ( = ?auto_446396 ?auto_446403 ) ) ( not ( = ?auto_446396 ?auto_446404 ) ) ( not ( = ?auto_446396 ?auto_446405 ) ) ( not ( = ?auto_446396 ?auto_446406 ) ) ( not ( = ?auto_446397 ?auto_446398 ) ) ( not ( = ?auto_446397 ?auto_446399 ) ) ( not ( = ?auto_446397 ?auto_446400 ) ) ( not ( = ?auto_446397 ?auto_446401 ) ) ( not ( = ?auto_446397 ?auto_446402 ) ) ( not ( = ?auto_446397 ?auto_446403 ) ) ( not ( = ?auto_446397 ?auto_446404 ) ) ( not ( = ?auto_446397 ?auto_446405 ) ) ( not ( = ?auto_446397 ?auto_446406 ) ) ( not ( = ?auto_446398 ?auto_446399 ) ) ( not ( = ?auto_446398 ?auto_446400 ) ) ( not ( = ?auto_446398 ?auto_446401 ) ) ( not ( = ?auto_446398 ?auto_446402 ) ) ( not ( = ?auto_446398 ?auto_446403 ) ) ( not ( = ?auto_446398 ?auto_446404 ) ) ( not ( = ?auto_446398 ?auto_446405 ) ) ( not ( = ?auto_446398 ?auto_446406 ) ) ( not ( = ?auto_446399 ?auto_446400 ) ) ( not ( = ?auto_446399 ?auto_446401 ) ) ( not ( = ?auto_446399 ?auto_446402 ) ) ( not ( = ?auto_446399 ?auto_446403 ) ) ( not ( = ?auto_446399 ?auto_446404 ) ) ( not ( = ?auto_446399 ?auto_446405 ) ) ( not ( = ?auto_446399 ?auto_446406 ) ) ( not ( = ?auto_446400 ?auto_446401 ) ) ( not ( = ?auto_446400 ?auto_446402 ) ) ( not ( = ?auto_446400 ?auto_446403 ) ) ( not ( = ?auto_446400 ?auto_446404 ) ) ( not ( = ?auto_446400 ?auto_446405 ) ) ( not ( = ?auto_446400 ?auto_446406 ) ) ( not ( = ?auto_446401 ?auto_446402 ) ) ( not ( = ?auto_446401 ?auto_446403 ) ) ( not ( = ?auto_446401 ?auto_446404 ) ) ( not ( = ?auto_446401 ?auto_446405 ) ) ( not ( = ?auto_446401 ?auto_446406 ) ) ( not ( = ?auto_446402 ?auto_446403 ) ) ( not ( = ?auto_446402 ?auto_446404 ) ) ( not ( = ?auto_446402 ?auto_446405 ) ) ( not ( = ?auto_446402 ?auto_446406 ) ) ( not ( = ?auto_446403 ?auto_446404 ) ) ( not ( = ?auto_446403 ?auto_446405 ) ) ( not ( = ?auto_446403 ?auto_446406 ) ) ( not ( = ?auto_446404 ?auto_446405 ) ) ( not ( = ?auto_446404 ?auto_446406 ) ) ( not ( = ?auto_446405 ?auto_446406 ) ) ( ON ?auto_446404 ?auto_446405 ) ( ON ?auto_446403 ?auto_446404 ) ( CLEAR ?auto_446401 ) ( ON ?auto_446402 ?auto_446403 ) ( CLEAR ?auto_446402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_446394 ?auto_446395 ?auto_446396 ?auto_446397 ?auto_446398 ?auto_446399 ?auto_446400 ?auto_446401 ?auto_446402 )
      ( MAKE-12PILE ?auto_446394 ?auto_446395 ?auto_446396 ?auto_446397 ?auto_446398 ?auto_446399 ?auto_446400 ?auto_446401 ?auto_446402 ?auto_446403 ?auto_446404 ?auto_446405 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_446444 - BLOCK
      ?auto_446445 - BLOCK
      ?auto_446446 - BLOCK
      ?auto_446447 - BLOCK
      ?auto_446448 - BLOCK
      ?auto_446449 - BLOCK
      ?auto_446450 - BLOCK
      ?auto_446451 - BLOCK
      ?auto_446452 - BLOCK
      ?auto_446453 - BLOCK
      ?auto_446454 - BLOCK
      ?auto_446455 - BLOCK
    )
    :vars
    (
      ?auto_446456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446455 ?auto_446456 ) ( ON-TABLE ?auto_446444 ) ( ON ?auto_446445 ?auto_446444 ) ( ON ?auto_446446 ?auto_446445 ) ( ON ?auto_446447 ?auto_446446 ) ( ON ?auto_446448 ?auto_446447 ) ( ON ?auto_446449 ?auto_446448 ) ( ON ?auto_446450 ?auto_446449 ) ( not ( = ?auto_446444 ?auto_446445 ) ) ( not ( = ?auto_446444 ?auto_446446 ) ) ( not ( = ?auto_446444 ?auto_446447 ) ) ( not ( = ?auto_446444 ?auto_446448 ) ) ( not ( = ?auto_446444 ?auto_446449 ) ) ( not ( = ?auto_446444 ?auto_446450 ) ) ( not ( = ?auto_446444 ?auto_446451 ) ) ( not ( = ?auto_446444 ?auto_446452 ) ) ( not ( = ?auto_446444 ?auto_446453 ) ) ( not ( = ?auto_446444 ?auto_446454 ) ) ( not ( = ?auto_446444 ?auto_446455 ) ) ( not ( = ?auto_446444 ?auto_446456 ) ) ( not ( = ?auto_446445 ?auto_446446 ) ) ( not ( = ?auto_446445 ?auto_446447 ) ) ( not ( = ?auto_446445 ?auto_446448 ) ) ( not ( = ?auto_446445 ?auto_446449 ) ) ( not ( = ?auto_446445 ?auto_446450 ) ) ( not ( = ?auto_446445 ?auto_446451 ) ) ( not ( = ?auto_446445 ?auto_446452 ) ) ( not ( = ?auto_446445 ?auto_446453 ) ) ( not ( = ?auto_446445 ?auto_446454 ) ) ( not ( = ?auto_446445 ?auto_446455 ) ) ( not ( = ?auto_446445 ?auto_446456 ) ) ( not ( = ?auto_446446 ?auto_446447 ) ) ( not ( = ?auto_446446 ?auto_446448 ) ) ( not ( = ?auto_446446 ?auto_446449 ) ) ( not ( = ?auto_446446 ?auto_446450 ) ) ( not ( = ?auto_446446 ?auto_446451 ) ) ( not ( = ?auto_446446 ?auto_446452 ) ) ( not ( = ?auto_446446 ?auto_446453 ) ) ( not ( = ?auto_446446 ?auto_446454 ) ) ( not ( = ?auto_446446 ?auto_446455 ) ) ( not ( = ?auto_446446 ?auto_446456 ) ) ( not ( = ?auto_446447 ?auto_446448 ) ) ( not ( = ?auto_446447 ?auto_446449 ) ) ( not ( = ?auto_446447 ?auto_446450 ) ) ( not ( = ?auto_446447 ?auto_446451 ) ) ( not ( = ?auto_446447 ?auto_446452 ) ) ( not ( = ?auto_446447 ?auto_446453 ) ) ( not ( = ?auto_446447 ?auto_446454 ) ) ( not ( = ?auto_446447 ?auto_446455 ) ) ( not ( = ?auto_446447 ?auto_446456 ) ) ( not ( = ?auto_446448 ?auto_446449 ) ) ( not ( = ?auto_446448 ?auto_446450 ) ) ( not ( = ?auto_446448 ?auto_446451 ) ) ( not ( = ?auto_446448 ?auto_446452 ) ) ( not ( = ?auto_446448 ?auto_446453 ) ) ( not ( = ?auto_446448 ?auto_446454 ) ) ( not ( = ?auto_446448 ?auto_446455 ) ) ( not ( = ?auto_446448 ?auto_446456 ) ) ( not ( = ?auto_446449 ?auto_446450 ) ) ( not ( = ?auto_446449 ?auto_446451 ) ) ( not ( = ?auto_446449 ?auto_446452 ) ) ( not ( = ?auto_446449 ?auto_446453 ) ) ( not ( = ?auto_446449 ?auto_446454 ) ) ( not ( = ?auto_446449 ?auto_446455 ) ) ( not ( = ?auto_446449 ?auto_446456 ) ) ( not ( = ?auto_446450 ?auto_446451 ) ) ( not ( = ?auto_446450 ?auto_446452 ) ) ( not ( = ?auto_446450 ?auto_446453 ) ) ( not ( = ?auto_446450 ?auto_446454 ) ) ( not ( = ?auto_446450 ?auto_446455 ) ) ( not ( = ?auto_446450 ?auto_446456 ) ) ( not ( = ?auto_446451 ?auto_446452 ) ) ( not ( = ?auto_446451 ?auto_446453 ) ) ( not ( = ?auto_446451 ?auto_446454 ) ) ( not ( = ?auto_446451 ?auto_446455 ) ) ( not ( = ?auto_446451 ?auto_446456 ) ) ( not ( = ?auto_446452 ?auto_446453 ) ) ( not ( = ?auto_446452 ?auto_446454 ) ) ( not ( = ?auto_446452 ?auto_446455 ) ) ( not ( = ?auto_446452 ?auto_446456 ) ) ( not ( = ?auto_446453 ?auto_446454 ) ) ( not ( = ?auto_446453 ?auto_446455 ) ) ( not ( = ?auto_446453 ?auto_446456 ) ) ( not ( = ?auto_446454 ?auto_446455 ) ) ( not ( = ?auto_446454 ?auto_446456 ) ) ( not ( = ?auto_446455 ?auto_446456 ) ) ( ON ?auto_446454 ?auto_446455 ) ( ON ?auto_446453 ?auto_446454 ) ( ON ?auto_446452 ?auto_446453 ) ( CLEAR ?auto_446450 ) ( ON ?auto_446451 ?auto_446452 ) ( CLEAR ?auto_446451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_446444 ?auto_446445 ?auto_446446 ?auto_446447 ?auto_446448 ?auto_446449 ?auto_446450 ?auto_446451 )
      ( MAKE-12PILE ?auto_446444 ?auto_446445 ?auto_446446 ?auto_446447 ?auto_446448 ?auto_446449 ?auto_446450 ?auto_446451 ?auto_446452 ?auto_446453 ?auto_446454 ?auto_446455 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_446494 - BLOCK
      ?auto_446495 - BLOCK
      ?auto_446496 - BLOCK
      ?auto_446497 - BLOCK
      ?auto_446498 - BLOCK
      ?auto_446499 - BLOCK
      ?auto_446500 - BLOCK
      ?auto_446501 - BLOCK
      ?auto_446502 - BLOCK
      ?auto_446503 - BLOCK
      ?auto_446504 - BLOCK
      ?auto_446505 - BLOCK
    )
    :vars
    (
      ?auto_446506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446505 ?auto_446506 ) ( ON-TABLE ?auto_446494 ) ( ON ?auto_446495 ?auto_446494 ) ( ON ?auto_446496 ?auto_446495 ) ( ON ?auto_446497 ?auto_446496 ) ( ON ?auto_446498 ?auto_446497 ) ( ON ?auto_446499 ?auto_446498 ) ( not ( = ?auto_446494 ?auto_446495 ) ) ( not ( = ?auto_446494 ?auto_446496 ) ) ( not ( = ?auto_446494 ?auto_446497 ) ) ( not ( = ?auto_446494 ?auto_446498 ) ) ( not ( = ?auto_446494 ?auto_446499 ) ) ( not ( = ?auto_446494 ?auto_446500 ) ) ( not ( = ?auto_446494 ?auto_446501 ) ) ( not ( = ?auto_446494 ?auto_446502 ) ) ( not ( = ?auto_446494 ?auto_446503 ) ) ( not ( = ?auto_446494 ?auto_446504 ) ) ( not ( = ?auto_446494 ?auto_446505 ) ) ( not ( = ?auto_446494 ?auto_446506 ) ) ( not ( = ?auto_446495 ?auto_446496 ) ) ( not ( = ?auto_446495 ?auto_446497 ) ) ( not ( = ?auto_446495 ?auto_446498 ) ) ( not ( = ?auto_446495 ?auto_446499 ) ) ( not ( = ?auto_446495 ?auto_446500 ) ) ( not ( = ?auto_446495 ?auto_446501 ) ) ( not ( = ?auto_446495 ?auto_446502 ) ) ( not ( = ?auto_446495 ?auto_446503 ) ) ( not ( = ?auto_446495 ?auto_446504 ) ) ( not ( = ?auto_446495 ?auto_446505 ) ) ( not ( = ?auto_446495 ?auto_446506 ) ) ( not ( = ?auto_446496 ?auto_446497 ) ) ( not ( = ?auto_446496 ?auto_446498 ) ) ( not ( = ?auto_446496 ?auto_446499 ) ) ( not ( = ?auto_446496 ?auto_446500 ) ) ( not ( = ?auto_446496 ?auto_446501 ) ) ( not ( = ?auto_446496 ?auto_446502 ) ) ( not ( = ?auto_446496 ?auto_446503 ) ) ( not ( = ?auto_446496 ?auto_446504 ) ) ( not ( = ?auto_446496 ?auto_446505 ) ) ( not ( = ?auto_446496 ?auto_446506 ) ) ( not ( = ?auto_446497 ?auto_446498 ) ) ( not ( = ?auto_446497 ?auto_446499 ) ) ( not ( = ?auto_446497 ?auto_446500 ) ) ( not ( = ?auto_446497 ?auto_446501 ) ) ( not ( = ?auto_446497 ?auto_446502 ) ) ( not ( = ?auto_446497 ?auto_446503 ) ) ( not ( = ?auto_446497 ?auto_446504 ) ) ( not ( = ?auto_446497 ?auto_446505 ) ) ( not ( = ?auto_446497 ?auto_446506 ) ) ( not ( = ?auto_446498 ?auto_446499 ) ) ( not ( = ?auto_446498 ?auto_446500 ) ) ( not ( = ?auto_446498 ?auto_446501 ) ) ( not ( = ?auto_446498 ?auto_446502 ) ) ( not ( = ?auto_446498 ?auto_446503 ) ) ( not ( = ?auto_446498 ?auto_446504 ) ) ( not ( = ?auto_446498 ?auto_446505 ) ) ( not ( = ?auto_446498 ?auto_446506 ) ) ( not ( = ?auto_446499 ?auto_446500 ) ) ( not ( = ?auto_446499 ?auto_446501 ) ) ( not ( = ?auto_446499 ?auto_446502 ) ) ( not ( = ?auto_446499 ?auto_446503 ) ) ( not ( = ?auto_446499 ?auto_446504 ) ) ( not ( = ?auto_446499 ?auto_446505 ) ) ( not ( = ?auto_446499 ?auto_446506 ) ) ( not ( = ?auto_446500 ?auto_446501 ) ) ( not ( = ?auto_446500 ?auto_446502 ) ) ( not ( = ?auto_446500 ?auto_446503 ) ) ( not ( = ?auto_446500 ?auto_446504 ) ) ( not ( = ?auto_446500 ?auto_446505 ) ) ( not ( = ?auto_446500 ?auto_446506 ) ) ( not ( = ?auto_446501 ?auto_446502 ) ) ( not ( = ?auto_446501 ?auto_446503 ) ) ( not ( = ?auto_446501 ?auto_446504 ) ) ( not ( = ?auto_446501 ?auto_446505 ) ) ( not ( = ?auto_446501 ?auto_446506 ) ) ( not ( = ?auto_446502 ?auto_446503 ) ) ( not ( = ?auto_446502 ?auto_446504 ) ) ( not ( = ?auto_446502 ?auto_446505 ) ) ( not ( = ?auto_446502 ?auto_446506 ) ) ( not ( = ?auto_446503 ?auto_446504 ) ) ( not ( = ?auto_446503 ?auto_446505 ) ) ( not ( = ?auto_446503 ?auto_446506 ) ) ( not ( = ?auto_446504 ?auto_446505 ) ) ( not ( = ?auto_446504 ?auto_446506 ) ) ( not ( = ?auto_446505 ?auto_446506 ) ) ( ON ?auto_446504 ?auto_446505 ) ( ON ?auto_446503 ?auto_446504 ) ( ON ?auto_446502 ?auto_446503 ) ( ON ?auto_446501 ?auto_446502 ) ( CLEAR ?auto_446499 ) ( ON ?auto_446500 ?auto_446501 ) ( CLEAR ?auto_446500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_446494 ?auto_446495 ?auto_446496 ?auto_446497 ?auto_446498 ?auto_446499 ?auto_446500 )
      ( MAKE-12PILE ?auto_446494 ?auto_446495 ?auto_446496 ?auto_446497 ?auto_446498 ?auto_446499 ?auto_446500 ?auto_446501 ?auto_446502 ?auto_446503 ?auto_446504 ?auto_446505 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_446544 - BLOCK
      ?auto_446545 - BLOCK
      ?auto_446546 - BLOCK
      ?auto_446547 - BLOCK
      ?auto_446548 - BLOCK
      ?auto_446549 - BLOCK
      ?auto_446550 - BLOCK
      ?auto_446551 - BLOCK
      ?auto_446552 - BLOCK
      ?auto_446553 - BLOCK
      ?auto_446554 - BLOCK
      ?auto_446555 - BLOCK
    )
    :vars
    (
      ?auto_446556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446555 ?auto_446556 ) ( ON-TABLE ?auto_446544 ) ( ON ?auto_446545 ?auto_446544 ) ( ON ?auto_446546 ?auto_446545 ) ( ON ?auto_446547 ?auto_446546 ) ( ON ?auto_446548 ?auto_446547 ) ( not ( = ?auto_446544 ?auto_446545 ) ) ( not ( = ?auto_446544 ?auto_446546 ) ) ( not ( = ?auto_446544 ?auto_446547 ) ) ( not ( = ?auto_446544 ?auto_446548 ) ) ( not ( = ?auto_446544 ?auto_446549 ) ) ( not ( = ?auto_446544 ?auto_446550 ) ) ( not ( = ?auto_446544 ?auto_446551 ) ) ( not ( = ?auto_446544 ?auto_446552 ) ) ( not ( = ?auto_446544 ?auto_446553 ) ) ( not ( = ?auto_446544 ?auto_446554 ) ) ( not ( = ?auto_446544 ?auto_446555 ) ) ( not ( = ?auto_446544 ?auto_446556 ) ) ( not ( = ?auto_446545 ?auto_446546 ) ) ( not ( = ?auto_446545 ?auto_446547 ) ) ( not ( = ?auto_446545 ?auto_446548 ) ) ( not ( = ?auto_446545 ?auto_446549 ) ) ( not ( = ?auto_446545 ?auto_446550 ) ) ( not ( = ?auto_446545 ?auto_446551 ) ) ( not ( = ?auto_446545 ?auto_446552 ) ) ( not ( = ?auto_446545 ?auto_446553 ) ) ( not ( = ?auto_446545 ?auto_446554 ) ) ( not ( = ?auto_446545 ?auto_446555 ) ) ( not ( = ?auto_446545 ?auto_446556 ) ) ( not ( = ?auto_446546 ?auto_446547 ) ) ( not ( = ?auto_446546 ?auto_446548 ) ) ( not ( = ?auto_446546 ?auto_446549 ) ) ( not ( = ?auto_446546 ?auto_446550 ) ) ( not ( = ?auto_446546 ?auto_446551 ) ) ( not ( = ?auto_446546 ?auto_446552 ) ) ( not ( = ?auto_446546 ?auto_446553 ) ) ( not ( = ?auto_446546 ?auto_446554 ) ) ( not ( = ?auto_446546 ?auto_446555 ) ) ( not ( = ?auto_446546 ?auto_446556 ) ) ( not ( = ?auto_446547 ?auto_446548 ) ) ( not ( = ?auto_446547 ?auto_446549 ) ) ( not ( = ?auto_446547 ?auto_446550 ) ) ( not ( = ?auto_446547 ?auto_446551 ) ) ( not ( = ?auto_446547 ?auto_446552 ) ) ( not ( = ?auto_446547 ?auto_446553 ) ) ( not ( = ?auto_446547 ?auto_446554 ) ) ( not ( = ?auto_446547 ?auto_446555 ) ) ( not ( = ?auto_446547 ?auto_446556 ) ) ( not ( = ?auto_446548 ?auto_446549 ) ) ( not ( = ?auto_446548 ?auto_446550 ) ) ( not ( = ?auto_446548 ?auto_446551 ) ) ( not ( = ?auto_446548 ?auto_446552 ) ) ( not ( = ?auto_446548 ?auto_446553 ) ) ( not ( = ?auto_446548 ?auto_446554 ) ) ( not ( = ?auto_446548 ?auto_446555 ) ) ( not ( = ?auto_446548 ?auto_446556 ) ) ( not ( = ?auto_446549 ?auto_446550 ) ) ( not ( = ?auto_446549 ?auto_446551 ) ) ( not ( = ?auto_446549 ?auto_446552 ) ) ( not ( = ?auto_446549 ?auto_446553 ) ) ( not ( = ?auto_446549 ?auto_446554 ) ) ( not ( = ?auto_446549 ?auto_446555 ) ) ( not ( = ?auto_446549 ?auto_446556 ) ) ( not ( = ?auto_446550 ?auto_446551 ) ) ( not ( = ?auto_446550 ?auto_446552 ) ) ( not ( = ?auto_446550 ?auto_446553 ) ) ( not ( = ?auto_446550 ?auto_446554 ) ) ( not ( = ?auto_446550 ?auto_446555 ) ) ( not ( = ?auto_446550 ?auto_446556 ) ) ( not ( = ?auto_446551 ?auto_446552 ) ) ( not ( = ?auto_446551 ?auto_446553 ) ) ( not ( = ?auto_446551 ?auto_446554 ) ) ( not ( = ?auto_446551 ?auto_446555 ) ) ( not ( = ?auto_446551 ?auto_446556 ) ) ( not ( = ?auto_446552 ?auto_446553 ) ) ( not ( = ?auto_446552 ?auto_446554 ) ) ( not ( = ?auto_446552 ?auto_446555 ) ) ( not ( = ?auto_446552 ?auto_446556 ) ) ( not ( = ?auto_446553 ?auto_446554 ) ) ( not ( = ?auto_446553 ?auto_446555 ) ) ( not ( = ?auto_446553 ?auto_446556 ) ) ( not ( = ?auto_446554 ?auto_446555 ) ) ( not ( = ?auto_446554 ?auto_446556 ) ) ( not ( = ?auto_446555 ?auto_446556 ) ) ( ON ?auto_446554 ?auto_446555 ) ( ON ?auto_446553 ?auto_446554 ) ( ON ?auto_446552 ?auto_446553 ) ( ON ?auto_446551 ?auto_446552 ) ( ON ?auto_446550 ?auto_446551 ) ( CLEAR ?auto_446548 ) ( ON ?auto_446549 ?auto_446550 ) ( CLEAR ?auto_446549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_446544 ?auto_446545 ?auto_446546 ?auto_446547 ?auto_446548 ?auto_446549 )
      ( MAKE-12PILE ?auto_446544 ?auto_446545 ?auto_446546 ?auto_446547 ?auto_446548 ?auto_446549 ?auto_446550 ?auto_446551 ?auto_446552 ?auto_446553 ?auto_446554 ?auto_446555 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_446594 - BLOCK
      ?auto_446595 - BLOCK
      ?auto_446596 - BLOCK
      ?auto_446597 - BLOCK
      ?auto_446598 - BLOCK
      ?auto_446599 - BLOCK
      ?auto_446600 - BLOCK
      ?auto_446601 - BLOCK
      ?auto_446602 - BLOCK
      ?auto_446603 - BLOCK
      ?auto_446604 - BLOCK
      ?auto_446605 - BLOCK
    )
    :vars
    (
      ?auto_446606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446605 ?auto_446606 ) ( ON-TABLE ?auto_446594 ) ( ON ?auto_446595 ?auto_446594 ) ( ON ?auto_446596 ?auto_446595 ) ( ON ?auto_446597 ?auto_446596 ) ( not ( = ?auto_446594 ?auto_446595 ) ) ( not ( = ?auto_446594 ?auto_446596 ) ) ( not ( = ?auto_446594 ?auto_446597 ) ) ( not ( = ?auto_446594 ?auto_446598 ) ) ( not ( = ?auto_446594 ?auto_446599 ) ) ( not ( = ?auto_446594 ?auto_446600 ) ) ( not ( = ?auto_446594 ?auto_446601 ) ) ( not ( = ?auto_446594 ?auto_446602 ) ) ( not ( = ?auto_446594 ?auto_446603 ) ) ( not ( = ?auto_446594 ?auto_446604 ) ) ( not ( = ?auto_446594 ?auto_446605 ) ) ( not ( = ?auto_446594 ?auto_446606 ) ) ( not ( = ?auto_446595 ?auto_446596 ) ) ( not ( = ?auto_446595 ?auto_446597 ) ) ( not ( = ?auto_446595 ?auto_446598 ) ) ( not ( = ?auto_446595 ?auto_446599 ) ) ( not ( = ?auto_446595 ?auto_446600 ) ) ( not ( = ?auto_446595 ?auto_446601 ) ) ( not ( = ?auto_446595 ?auto_446602 ) ) ( not ( = ?auto_446595 ?auto_446603 ) ) ( not ( = ?auto_446595 ?auto_446604 ) ) ( not ( = ?auto_446595 ?auto_446605 ) ) ( not ( = ?auto_446595 ?auto_446606 ) ) ( not ( = ?auto_446596 ?auto_446597 ) ) ( not ( = ?auto_446596 ?auto_446598 ) ) ( not ( = ?auto_446596 ?auto_446599 ) ) ( not ( = ?auto_446596 ?auto_446600 ) ) ( not ( = ?auto_446596 ?auto_446601 ) ) ( not ( = ?auto_446596 ?auto_446602 ) ) ( not ( = ?auto_446596 ?auto_446603 ) ) ( not ( = ?auto_446596 ?auto_446604 ) ) ( not ( = ?auto_446596 ?auto_446605 ) ) ( not ( = ?auto_446596 ?auto_446606 ) ) ( not ( = ?auto_446597 ?auto_446598 ) ) ( not ( = ?auto_446597 ?auto_446599 ) ) ( not ( = ?auto_446597 ?auto_446600 ) ) ( not ( = ?auto_446597 ?auto_446601 ) ) ( not ( = ?auto_446597 ?auto_446602 ) ) ( not ( = ?auto_446597 ?auto_446603 ) ) ( not ( = ?auto_446597 ?auto_446604 ) ) ( not ( = ?auto_446597 ?auto_446605 ) ) ( not ( = ?auto_446597 ?auto_446606 ) ) ( not ( = ?auto_446598 ?auto_446599 ) ) ( not ( = ?auto_446598 ?auto_446600 ) ) ( not ( = ?auto_446598 ?auto_446601 ) ) ( not ( = ?auto_446598 ?auto_446602 ) ) ( not ( = ?auto_446598 ?auto_446603 ) ) ( not ( = ?auto_446598 ?auto_446604 ) ) ( not ( = ?auto_446598 ?auto_446605 ) ) ( not ( = ?auto_446598 ?auto_446606 ) ) ( not ( = ?auto_446599 ?auto_446600 ) ) ( not ( = ?auto_446599 ?auto_446601 ) ) ( not ( = ?auto_446599 ?auto_446602 ) ) ( not ( = ?auto_446599 ?auto_446603 ) ) ( not ( = ?auto_446599 ?auto_446604 ) ) ( not ( = ?auto_446599 ?auto_446605 ) ) ( not ( = ?auto_446599 ?auto_446606 ) ) ( not ( = ?auto_446600 ?auto_446601 ) ) ( not ( = ?auto_446600 ?auto_446602 ) ) ( not ( = ?auto_446600 ?auto_446603 ) ) ( not ( = ?auto_446600 ?auto_446604 ) ) ( not ( = ?auto_446600 ?auto_446605 ) ) ( not ( = ?auto_446600 ?auto_446606 ) ) ( not ( = ?auto_446601 ?auto_446602 ) ) ( not ( = ?auto_446601 ?auto_446603 ) ) ( not ( = ?auto_446601 ?auto_446604 ) ) ( not ( = ?auto_446601 ?auto_446605 ) ) ( not ( = ?auto_446601 ?auto_446606 ) ) ( not ( = ?auto_446602 ?auto_446603 ) ) ( not ( = ?auto_446602 ?auto_446604 ) ) ( not ( = ?auto_446602 ?auto_446605 ) ) ( not ( = ?auto_446602 ?auto_446606 ) ) ( not ( = ?auto_446603 ?auto_446604 ) ) ( not ( = ?auto_446603 ?auto_446605 ) ) ( not ( = ?auto_446603 ?auto_446606 ) ) ( not ( = ?auto_446604 ?auto_446605 ) ) ( not ( = ?auto_446604 ?auto_446606 ) ) ( not ( = ?auto_446605 ?auto_446606 ) ) ( ON ?auto_446604 ?auto_446605 ) ( ON ?auto_446603 ?auto_446604 ) ( ON ?auto_446602 ?auto_446603 ) ( ON ?auto_446601 ?auto_446602 ) ( ON ?auto_446600 ?auto_446601 ) ( ON ?auto_446599 ?auto_446600 ) ( CLEAR ?auto_446597 ) ( ON ?auto_446598 ?auto_446599 ) ( CLEAR ?auto_446598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_446594 ?auto_446595 ?auto_446596 ?auto_446597 ?auto_446598 )
      ( MAKE-12PILE ?auto_446594 ?auto_446595 ?auto_446596 ?auto_446597 ?auto_446598 ?auto_446599 ?auto_446600 ?auto_446601 ?auto_446602 ?auto_446603 ?auto_446604 ?auto_446605 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_446644 - BLOCK
      ?auto_446645 - BLOCK
      ?auto_446646 - BLOCK
      ?auto_446647 - BLOCK
      ?auto_446648 - BLOCK
      ?auto_446649 - BLOCK
      ?auto_446650 - BLOCK
      ?auto_446651 - BLOCK
      ?auto_446652 - BLOCK
      ?auto_446653 - BLOCK
      ?auto_446654 - BLOCK
      ?auto_446655 - BLOCK
    )
    :vars
    (
      ?auto_446656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446655 ?auto_446656 ) ( ON-TABLE ?auto_446644 ) ( ON ?auto_446645 ?auto_446644 ) ( ON ?auto_446646 ?auto_446645 ) ( not ( = ?auto_446644 ?auto_446645 ) ) ( not ( = ?auto_446644 ?auto_446646 ) ) ( not ( = ?auto_446644 ?auto_446647 ) ) ( not ( = ?auto_446644 ?auto_446648 ) ) ( not ( = ?auto_446644 ?auto_446649 ) ) ( not ( = ?auto_446644 ?auto_446650 ) ) ( not ( = ?auto_446644 ?auto_446651 ) ) ( not ( = ?auto_446644 ?auto_446652 ) ) ( not ( = ?auto_446644 ?auto_446653 ) ) ( not ( = ?auto_446644 ?auto_446654 ) ) ( not ( = ?auto_446644 ?auto_446655 ) ) ( not ( = ?auto_446644 ?auto_446656 ) ) ( not ( = ?auto_446645 ?auto_446646 ) ) ( not ( = ?auto_446645 ?auto_446647 ) ) ( not ( = ?auto_446645 ?auto_446648 ) ) ( not ( = ?auto_446645 ?auto_446649 ) ) ( not ( = ?auto_446645 ?auto_446650 ) ) ( not ( = ?auto_446645 ?auto_446651 ) ) ( not ( = ?auto_446645 ?auto_446652 ) ) ( not ( = ?auto_446645 ?auto_446653 ) ) ( not ( = ?auto_446645 ?auto_446654 ) ) ( not ( = ?auto_446645 ?auto_446655 ) ) ( not ( = ?auto_446645 ?auto_446656 ) ) ( not ( = ?auto_446646 ?auto_446647 ) ) ( not ( = ?auto_446646 ?auto_446648 ) ) ( not ( = ?auto_446646 ?auto_446649 ) ) ( not ( = ?auto_446646 ?auto_446650 ) ) ( not ( = ?auto_446646 ?auto_446651 ) ) ( not ( = ?auto_446646 ?auto_446652 ) ) ( not ( = ?auto_446646 ?auto_446653 ) ) ( not ( = ?auto_446646 ?auto_446654 ) ) ( not ( = ?auto_446646 ?auto_446655 ) ) ( not ( = ?auto_446646 ?auto_446656 ) ) ( not ( = ?auto_446647 ?auto_446648 ) ) ( not ( = ?auto_446647 ?auto_446649 ) ) ( not ( = ?auto_446647 ?auto_446650 ) ) ( not ( = ?auto_446647 ?auto_446651 ) ) ( not ( = ?auto_446647 ?auto_446652 ) ) ( not ( = ?auto_446647 ?auto_446653 ) ) ( not ( = ?auto_446647 ?auto_446654 ) ) ( not ( = ?auto_446647 ?auto_446655 ) ) ( not ( = ?auto_446647 ?auto_446656 ) ) ( not ( = ?auto_446648 ?auto_446649 ) ) ( not ( = ?auto_446648 ?auto_446650 ) ) ( not ( = ?auto_446648 ?auto_446651 ) ) ( not ( = ?auto_446648 ?auto_446652 ) ) ( not ( = ?auto_446648 ?auto_446653 ) ) ( not ( = ?auto_446648 ?auto_446654 ) ) ( not ( = ?auto_446648 ?auto_446655 ) ) ( not ( = ?auto_446648 ?auto_446656 ) ) ( not ( = ?auto_446649 ?auto_446650 ) ) ( not ( = ?auto_446649 ?auto_446651 ) ) ( not ( = ?auto_446649 ?auto_446652 ) ) ( not ( = ?auto_446649 ?auto_446653 ) ) ( not ( = ?auto_446649 ?auto_446654 ) ) ( not ( = ?auto_446649 ?auto_446655 ) ) ( not ( = ?auto_446649 ?auto_446656 ) ) ( not ( = ?auto_446650 ?auto_446651 ) ) ( not ( = ?auto_446650 ?auto_446652 ) ) ( not ( = ?auto_446650 ?auto_446653 ) ) ( not ( = ?auto_446650 ?auto_446654 ) ) ( not ( = ?auto_446650 ?auto_446655 ) ) ( not ( = ?auto_446650 ?auto_446656 ) ) ( not ( = ?auto_446651 ?auto_446652 ) ) ( not ( = ?auto_446651 ?auto_446653 ) ) ( not ( = ?auto_446651 ?auto_446654 ) ) ( not ( = ?auto_446651 ?auto_446655 ) ) ( not ( = ?auto_446651 ?auto_446656 ) ) ( not ( = ?auto_446652 ?auto_446653 ) ) ( not ( = ?auto_446652 ?auto_446654 ) ) ( not ( = ?auto_446652 ?auto_446655 ) ) ( not ( = ?auto_446652 ?auto_446656 ) ) ( not ( = ?auto_446653 ?auto_446654 ) ) ( not ( = ?auto_446653 ?auto_446655 ) ) ( not ( = ?auto_446653 ?auto_446656 ) ) ( not ( = ?auto_446654 ?auto_446655 ) ) ( not ( = ?auto_446654 ?auto_446656 ) ) ( not ( = ?auto_446655 ?auto_446656 ) ) ( ON ?auto_446654 ?auto_446655 ) ( ON ?auto_446653 ?auto_446654 ) ( ON ?auto_446652 ?auto_446653 ) ( ON ?auto_446651 ?auto_446652 ) ( ON ?auto_446650 ?auto_446651 ) ( ON ?auto_446649 ?auto_446650 ) ( ON ?auto_446648 ?auto_446649 ) ( CLEAR ?auto_446646 ) ( ON ?auto_446647 ?auto_446648 ) ( CLEAR ?auto_446647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_446644 ?auto_446645 ?auto_446646 ?auto_446647 )
      ( MAKE-12PILE ?auto_446644 ?auto_446645 ?auto_446646 ?auto_446647 ?auto_446648 ?auto_446649 ?auto_446650 ?auto_446651 ?auto_446652 ?auto_446653 ?auto_446654 ?auto_446655 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_446694 - BLOCK
      ?auto_446695 - BLOCK
      ?auto_446696 - BLOCK
      ?auto_446697 - BLOCK
      ?auto_446698 - BLOCK
      ?auto_446699 - BLOCK
      ?auto_446700 - BLOCK
      ?auto_446701 - BLOCK
      ?auto_446702 - BLOCK
      ?auto_446703 - BLOCK
      ?auto_446704 - BLOCK
      ?auto_446705 - BLOCK
    )
    :vars
    (
      ?auto_446706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446705 ?auto_446706 ) ( ON-TABLE ?auto_446694 ) ( ON ?auto_446695 ?auto_446694 ) ( not ( = ?auto_446694 ?auto_446695 ) ) ( not ( = ?auto_446694 ?auto_446696 ) ) ( not ( = ?auto_446694 ?auto_446697 ) ) ( not ( = ?auto_446694 ?auto_446698 ) ) ( not ( = ?auto_446694 ?auto_446699 ) ) ( not ( = ?auto_446694 ?auto_446700 ) ) ( not ( = ?auto_446694 ?auto_446701 ) ) ( not ( = ?auto_446694 ?auto_446702 ) ) ( not ( = ?auto_446694 ?auto_446703 ) ) ( not ( = ?auto_446694 ?auto_446704 ) ) ( not ( = ?auto_446694 ?auto_446705 ) ) ( not ( = ?auto_446694 ?auto_446706 ) ) ( not ( = ?auto_446695 ?auto_446696 ) ) ( not ( = ?auto_446695 ?auto_446697 ) ) ( not ( = ?auto_446695 ?auto_446698 ) ) ( not ( = ?auto_446695 ?auto_446699 ) ) ( not ( = ?auto_446695 ?auto_446700 ) ) ( not ( = ?auto_446695 ?auto_446701 ) ) ( not ( = ?auto_446695 ?auto_446702 ) ) ( not ( = ?auto_446695 ?auto_446703 ) ) ( not ( = ?auto_446695 ?auto_446704 ) ) ( not ( = ?auto_446695 ?auto_446705 ) ) ( not ( = ?auto_446695 ?auto_446706 ) ) ( not ( = ?auto_446696 ?auto_446697 ) ) ( not ( = ?auto_446696 ?auto_446698 ) ) ( not ( = ?auto_446696 ?auto_446699 ) ) ( not ( = ?auto_446696 ?auto_446700 ) ) ( not ( = ?auto_446696 ?auto_446701 ) ) ( not ( = ?auto_446696 ?auto_446702 ) ) ( not ( = ?auto_446696 ?auto_446703 ) ) ( not ( = ?auto_446696 ?auto_446704 ) ) ( not ( = ?auto_446696 ?auto_446705 ) ) ( not ( = ?auto_446696 ?auto_446706 ) ) ( not ( = ?auto_446697 ?auto_446698 ) ) ( not ( = ?auto_446697 ?auto_446699 ) ) ( not ( = ?auto_446697 ?auto_446700 ) ) ( not ( = ?auto_446697 ?auto_446701 ) ) ( not ( = ?auto_446697 ?auto_446702 ) ) ( not ( = ?auto_446697 ?auto_446703 ) ) ( not ( = ?auto_446697 ?auto_446704 ) ) ( not ( = ?auto_446697 ?auto_446705 ) ) ( not ( = ?auto_446697 ?auto_446706 ) ) ( not ( = ?auto_446698 ?auto_446699 ) ) ( not ( = ?auto_446698 ?auto_446700 ) ) ( not ( = ?auto_446698 ?auto_446701 ) ) ( not ( = ?auto_446698 ?auto_446702 ) ) ( not ( = ?auto_446698 ?auto_446703 ) ) ( not ( = ?auto_446698 ?auto_446704 ) ) ( not ( = ?auto_446698 ?auto_446705 ) ) ( not ( = ?auto_446698 ?auto_446706 ) ) ( not ( = ?auto_446699 ?auto_446700 ) ) ( not ( = ?auto_446699 ?auto_446701 ) ) ( not ( = ?auto_446699 ?auto_446702 ) ) ( not ( = ?auto_446699 ?auto_446703 ) ) ( not ( = ?auto_446699 ?auto_446704 ) ) ( not ( = ?auto_446699 ?auto_446705 ) ) ( not ( = ?auto_446699 ?auto_446706 ) ) ( not ( = ?auto_446700 ?auto_446701 ) ) ( not ( = ?auto_446700 ?auto_446702 ) ) ( not ( = ?auto_446700 ?auto_446703 ) ) ( not ( = ?auto_446700 ?auto_446704 ) ) ( not ( = ?auto_446700 ?auto_446705 ) ) ( not ( = ?auto_446700 ?auto_446706 ) ) ( not ( = ?auto_446701 ?auto_446702 ) ) ( not ( = ?auto_446701 ?auto_446703 ) ) ( not ( = ?auto_446701 ?auto_446704 ) ) ( not ( = ?auto_446701 ?auto_446705 ) ) ( not ( = ?auto_446701 ?auto_446706 ) ) ( not ( = ?auto_446702 ?auto_446703 ) ) ( not ( = ?auto_446702 ?auto_446704 ) ) ( not ( = ?auto_446702 ?auto_446705 ) ) ( not ( = ?auto_446702 ?auto_446706 ) ) ( not ( = ?auto_446703 ?auto_446704 ) ) ( not ( = ?auto_446703 ?auto_446705 ) ) ( not ( = ?auto_446703 ?auto_446706 ) ) ( not ( = ?auto_446704 ?auto_446705 ) ) ( not ( = ?auto_446704 ?auto_446706 ) ) ( not ( = ?auto_446705 ?auto_446706 ) ) ( ON ?auto_446704 ?auto_446705 ) ( ON ?auto_446703 ?auto_446704 ) ( ON ?auto_446702 ?auto_446703 ) ( ON ?auto_446701 ?auto_446702 ) ( ON ?auto_446700 ?auto_446701 ) ( ON ?auto_446699 ?auto_446700 ) ( ON ?auto_446698 ?auto_446699 ) ( ON ?auto_446697 ?auto_446698 ) ( CLEAR ?auto_446695 ) ( ON ?auto_446696 ?auto_446697 ) ( CLEAR ?auto_446696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_446694 ?auto_446695 ?auto_446696 )
      ( MAKE-12PILE ?auto_446694 ?auto_446695 ?auto_446696 ?auto_446697 ?auto_446698 ?auto_446699 ?auto_446700 ?auto_446701 ?auto_446702 ?auto_446703 ?auto_446704 ?auto_446705 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_446744 - BLOCK
      ?auto_446745 - BLOCK
      ?auto_446746 - BLOCK
      ?auto_446747 - BLOCK
      ?auto_446748 - BLOCK
      ?auto_446749 - BLOCK
      ?auto_446750 - BLOCK
      ?auto_446751 - BLOCK
      ?auto_446752 - BLOCK
      ?auto_446753 - BLOCK
      ?auto_446754 - BLOCK
      ?auto_446755 - BLOCK
    )
    :vars
    (
      ?auto_446756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446755 ?auto_446756 ) ( ON-TABLE ?auto_446744 ) ( not ( = ?auto_446744 ?auto_446745 ) ) ( not ( = ?auto_446744 ?auto_446746 ) ) ( not ( = ?auto_446744 ?auto_446747 ) ) ( not ( = ?auto_446744 ?auto_446748 ) ) ( not ( = ?auto_446744 ?auto_446749 ) ) ( not ( = ?auto_446744 ?auto_446750 ) ) ( not ( = ?auto_446744 ?auto_446751 ) ) ( not ( = ?auto_446744 ?auto_446752 ) ) ( not ( = ?auto_446744 ?auto_446753 ) ) ( not ( = ?auto_446744 ?auto_446754 ) ) ( not ( = ?auto_446744 ?auto_446755 ) ) ( not ( = ?auto_446744 ?auto_446756 ) ) ( not ( = ?auto_446745 ?auto_446746 ) ) ( not ( = ?auto_446745 ?auto_446747 ) ) ( not ( = ?auto_446745 ?auto_446748 ) ) ( not ( = ?auto_446745 ?auto_446749 ) ) ( not ( = ?auto_446745 ?auto_446750 ) ) ( not ( = ?auto_446745 ?auto_446751 ) ) ( not ( = ?auto_446745 ?auto_446752 ) ) ( not ( = ?auto_446745 ?auto_446753 ) ) ( not ( = ?auto_446745 ?auto_446754 ) ) ( not ( = ?auto_446745 ?auto_446755 ) ) ( not ( = ?auto_446745 ?auto_446756 ) ) ( not ( = ?auto_446746 ?auto_446747 ) ) ( not ( = ?auto_446746 ?auto_446748 ) ) ( not ( = ?auto_446746 ?auto_446749 ) ) ( not ( = ?auto_446746 ?auto_446750 ) ) ( not ( = ?auto_446746 ?auto_446751 ) ) ( not ( = ?auto_446746 ?auto_446752 ) ) ( not ( = ?auto_446746 ?auto_446753 ) ) ( not ( = ?auto_446746 ?auto_446754 ) ) ( not ( = ?auto_446746 ?auto_446755 ) ) ( not ( = ?auto_446746 ?auto_446756 ) ) ( not ( = ?auto_446747 ?auto_446748 ) ) ( not ( = ?auto_446747 ?auto_446749 ) ) ( not ( = ?auto_446747 ?auto_446750 ) ) ( not ( = ?auto_446747 ?auto_446751 ) ) ( not ( = ?auto_446747 ?auto_446752 ) ) ( not ( = ?auto_446747 ?auto_446753 ) ) ( not ( = ?auto_446747 ?auto_446754 ) ) ( not ( = ?auto_446747 ?auto_446755 ) ) ( not ( = ?auto_446747 ?auto_446756 ) ) ( not ( = ?auto_446748 ?auto_446749 ) ) ( not ( = ?auto_446748 ?auto_446750 ) ) ( not ( = ?auto_446748 ?auto_446751 ) ) ( not ( = ?auto_446748 ?auto_446752 ) ) ( not ( = ?auto_446748 ?auto_446753 ) ) ( not ( = ?auto_446748 ?auto_446754 ) ) ( not ( = ?auto_446748 ?auto_446755 ) ) ( not ( = ?auto_446748 ?auto_446756 ) ) ( not ( = ?auto_446749 ?auto_446750 ) ) ( not ( = ?auto_446749 ?auto_446751 ) ) ( not ( = ?auto_446749 ?auto_446752 ) ) ( not ( = ?auto_446749 ?auto_446753 ) ) ( not ( = ?auto_446749 ?auto_446754 ) ) ( not ( = ?auto_446749 ?auto_446755 ) ) ( not ( = ?auto_446749 ?auto_446756 ) ) ( not ( = ?auto_446750 ?auto_446751 ) ) ( not ( = ?auto_446750 ?auto_446752 ) ) ( not ( = ?auto_446750 ?auto_446753 ) ) ( not ( = ?auto_446750 ?auto_446754 ) ) ( not ( = ?auto_446750 ?auto_446755 ) ) ( not ( = ?auto_446750 ?auto_446756 ) ) ( not ( = ?auto_446751 ?auto_446752 ) ) ( not ( = ?auto_446751 ?auto_446753 ) ) ( not ( = ?auto_446751 ?auto_446754 ) ) ( not ( = ?auto_446751 ?auto_446755 ) ) ( not ( = ?auto_446751 ?auto_446756 ) ) ( not ( = ?auto_446752 ?auto_446753 ) ) ( not ( = ?auto_446752 ?auto_446754 ) ) ( not ( = ?auto_446752 ?auto_446755 ) ) ( not ( = ?auto_446752 ?auto_446756 ) ) ( not ( = ?auto_446753 ?auto_446754 ) ) ( not ( = ?auto_446753 ?auto_446755 ) ) ( not ( = ?auto_446753 ?auto_446756 ) ) ( not ( = ?auto_446754 ?auto_446755 ) ) ( not ( = ?auto_446754 ?auto_446756 ) ) ( not ( = ?auto_446755 ?auto_446756 ) ) ( ON ?auto_446754 ?auto_446755 ) ( ON ?auto_446753 ?auto_446754 ) ( ON ?auto_446752 ?auto_446753 ) ( ON ?auto_446751 ?auto_446752 ) ( ON ?auto_446750 ?auto_446751 ) ( ON ?auto_446749 ?auto_446750 ) ( ON ?auto_446748 ?auto_446749 ) ( ON ?auto_446747 ?auto_446748 ) ( ON ?auto_446746 ?auto_446747 ) ( CLEAR ?auto_446744 ) ( ON ?auto_446745 ?auto_446746 ) ( CLEAR ?auto_446745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_446744 ?auto_446745 )
      ( MAKE-12PILE ?auto_446744 ?auto_446745 ?auto_446746 ?auto_446747 ?auto_446748 ?auto_446749 ?auto_446750 ?auto_446751 ?auto_446752 ?auto_446753 ?auto_446754 ?auto_446755 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_446794 - BLOCK
      ?auto_446795 - BLOCK
      ?auto_446796 - BLOCK
      ?auto_446797 - BLOCK
      ?auto_446798 - BLOCK
      ?auto_446799 - BLOCK
      ?auto_446800 - BLOCK
      ?auto_446801 - BLOCK
      ?auto_446802 - BLOCK
      ?auto_446803 - BLOCK
      ?auto_446804 - BLOCK
      ?auto_446805 - BLOCK
    )
    :vars
    (
      ?auto_446806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446805 ?auto_446806 ) ( not ( = ?auto_446794 ?auto_446795 ) ) ( not ( = ?auto_446794 ?auto_446796 ) ) ( not ( = ?auto_446794 ?auto_446797 ) ) ( not ( = ?auto_446794 ?auto_446798 ) ) ( not ( = ?auto_446794 ?auto_446799 ) ) ( not ( = ?auto_446794 ?auto_446800 ) ) ( not ( = ?auto_446794 ?auto_446801 ) ) ( not ( = ?auto_446794 ?auto_446802 ) ) ( not ( = ?auto_446794 ?auto_446803 ) ) ( not ( = ?auto_446794 ?auto_446804 ) ) ( not ( = ?auto_446794 ?auto_446805 ) ) ( not ( = ?auto_446794 ?auto_446806 ) ) ( not ( = ?auto_446795 ?auto_446796 ) ) ( not ( = ?auto_446795 ?auto_446797 ) ) ( not ( = ?auto_446795 ?auto_446798 ) ) ( not ( = ?auto_446795 ?auto_446799 ) ) ( not ( = ?auto_446795 ?auto_446800 ) ) ( not ( = ?auto_446795 ?auto_446801 ) ) ( not ( = ?auto_446795 ?auto_446802 ) ) ( not ( = ?auto_446795 ?auto_446803 ) ) ( not ( = ?auto_446795 ?auto_446804 ) ) ( not ( = ?auto_446795 ?auto_446805 ) ) ( not ( = ?auto_446795 ?auto_446806 ) ) ( not ( = ?auto_446796 ?auto_446797 ) ) ( not ( = ?auto_446796 ?auto_446798 ) ) ( not ( = ?auto_446796 ?auto_446799 ) ) ( not ( = ?auto_446796 ?auto_446800 ) ) ( not ( = ?auto_446796 ?auto_446801 ) ) ( not ( = ?auto_446796 ?auto_446802 ) ) ( not ( = ?auto_446796 ?auto_446803 ) ) ( not ( = ?auto_446796 ?auto_446804 ) ) ( not ( = ?auto_446796 ?auto_446805 ) ) ( not ( = ?auto_446796 ?auto_446806 ) ) ( not ( = ?auto_446797 ?auto_446798 ) ) ( not ( = ?auto_446797 ?auto_446799 ) ) ( not ( = ?auto_446797 ?auto_446800 ) ) ( not ( = ?auto_446797 ?auto_446801 ) ) ( not ( = ?auto_446797 ?auto_446802 ) ) ( not ( = ?auto_446797 ?auto_446803 ) ) ( not ( = ?auto_446797 ?auto_446804 ) ) ( not ( = ?auto_446797 ?auto_446805 ) ) ( not ( = ?auto_446797 ?auto_446806 ) ) ( not ( = ?auto_446798 ?auto_446799 ) ) ( not ( = ?auto_446798 ?auto_446800 ) ) ( not ( = ?auto_446798 ?auto_446801 ) ) ( not ( = ?auto_446798 ?auto_446802 ) ) ( not ( = ?auto_446798 ?auto_446803 ) ) ( not ( = ?auto_446798 ?auto_446804 ) ) ( not ( = ?auto_446798 ?auto_446805 ) ) ( not ( = ?auto_446798 ?auto_446806 ) ) ( not ( = ?auto_446799 ?auto_446800 ) ) ( not ( = ?auto_446799 ?auto_446801 ) ) ( not ( = ?auto_446799 ?auto_446802 ) ) ( not ( = ?auto_446799 ?auto_446803 ) ) ( not ( = ?auto_446799 ?auto_446804 ) ) ( not ( = ?auto_446799 ?auto_446805 ) ) ( not ( = ?auto_446799 ?auto_446806 ) ) ( not ( = ?auto_446800 ?auto_446801 ) ) ( not ( = ?auto_446800 ?auto_446802 ) ) ( not ( = ?auto_446800 ?auto_446803 ) ) ( not ( = ?auto_446800 ?auto_446804 ) ) ( not ( = ?auto_446800 ?auto_446805 ) ) ( not ( = ?auto_446800 ?auto_446806 ) ) ( not ( = ?auto_446801 ?auto_446802 ) ) ( not ( = ?auto_446801 ?auto_446803 ) ) ( not ( = ?auto_446801 ?auto_446804 ) ) ( not ( = ?auto_446801 ?auto_446805 ) ) ( not ( = ?auto_446801 ?auto_446806 ) ) ( not ( = ?auto_446802 ?auto_446803 ) ) ( not ( = ?auto_446802 ?auto_446804 ) ) ( not ( = ?auto_446802 ?auto_446805 ) ) ( not ( = ?auto_446802 ?auto_446806 ) ) ( not ( = ?auto_446803 ?auto_446804 ) ) ( not ( = ?auto_446803 ?auto_446805 ) ) ( not ( = ?auto_446803 ?auto_446806 ) ) ( not ( = ?auto_446804 ?auto_446805 ) ) ( not ( = ?auto_446804 ?auto_446806 ) ) ( not ( = ?auto_446805 ?auto_446806 ) ) ( ON ?auto_446804 ?auto_446805 ) ( ON ?auto_446803 ?auto_446804 ) ( ON ?auto_446802 ?auto_446803 ) ( ON ?auto_446801 ?auto_446802 ) ( ON ?auto_446800 ?auto_446801 ) ( ON ?auto_446799 ?auto_446800 ) ( ON ?auto_446798 ?auto_446799 ) ( ON ?auto_446797 ?auto_446798 ) ( ON ?auto_446796 ?auto_446797 ) ( ON ?auto_446795 ?auto_446796 ) ( ON ?auto_446794 ?auto_446795 ) ( CLEAR ?auto_446794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_446794 )
      ( MAKE-12PILE ?auto_446794 ?auto_446795 ?auto_446796 ?auto_446797 ?auto_446798 ?auto_446799 ?auto_446800 ?auto_446801 ?auto_446802 ?auto_446803 ?auto_446804 ?auto_446805 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_446845 - BLOCK
      ?auto_446846 - BLOCK
      ?auto_446847 - BLOCK
      ?auto_446848 - BLOCK
      ?auto_446849 - BLOCK
      ?auto_446850 - BLOCK
      ?auto_446851 - BLOCK
      ?auto_446852 - BLOCK
      ?auto_446853 - BLOCK
      ?auto_446854 - BLOCK
      ?auto_446855 - BLOCK
      ?auto_446856 - BLOCK
      ?auto_446857 - BLOCK
    )
    :vars
    (
      ?auto_446858 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_446856 ) ( ON ?auto_446857 ?auto_446858 ) ( CLEAR ?auto_446857 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_446845 ) ( ON ?auto_446846 ?auto_446845 ) ( ON ?auto_446847 ?auto_446846 ) ( ON ?auto_446848 ?auto_446847 ) ( ON ?auto_446849 ?auto_446848 ) ( ON ?auto_446850 ?auto_446849 ) ( ON ?auto_446851 ?auto_446850 ) ( ON ?auto_446852 ?auto_446851 ) ( ON ?auto_446853 ?auto_446852 ) ( ON ?auto_446854 ?auto_446853 ) ( ON ?auto_446855 ?auto_446854 ) ( ON ?auto_446856 ?auto_446855 ) ( not ( = ?auto_446845 ?auto_446846 ) ) ( not ( = ?auto_446845 ?auto_446847 ) ) ( not ( = ?auto_446845 ?auto_446848 ) ) ( not ( = ?auto_446845 ?auto_446849 ) ) ( not ( = ?auto_446845 ?auto_446850 ) ) ( not ( = ?auto_446845 ?auto_446851 ) ) ( not ( = ?auto_446845 ?auto_446852 ) ) ( not ( = ?auto_446845 ?auto_446853 ) ) ( not ( = ?auto_446845 ?auto_446854 ) ) ( not ( = ?auto_446845 ?auto_446855 ) ) ( not ( = ?auto_446845 ?auto_446856 ) ) ( not ( = ?auto_446845 ?auto_446857 ) ) ( not ( = ?auto_446845 ?auto_446858 ) ) ( not ( = ?auto_446846 ?auto_446847 ) ) ( not ( = ?auto_446846 ?auto_446848 ) ) ( not ( = ?auto_446846 ?auto_446849 ) ) ( not ( = ?auto_446846 ?auto_446850 ) ) ( not ( = ?auto_446846 ?auto_446851 ) ) ( not ( = ?auto_446846 ?auto_446852 ) ) ( not ( = ?auto_446846 ?auto_446853 ) ) ( not ( = ?auto_446846 ?auto_446854 ) ) ( not ( = ?auto_446846 ?auto_446855 ) ) ( not ( = ?auto_446846 ?auto_446856 ) ) ( not ( = ?auto_446846 ?auto_446857 ) ) ( not ( = ?auto_446846 ?auto_446858 ) ) ( not ( = ?auto_446847 ?auto_446848 ) ) ( not ( = ?auto_446847 ?auto_446849 ) ) ( not ( = ?auto_446847 ?auto_446850 ) ) ( not ( = ?auto_446847 ?auto_446851 ) ) ( not ( = ?auto_446847 ?auto_446852 ) ) ( not ( = ?auto_446847 ?auto_446853 ) ) ( not ( = ?auto_446847 ?auto_446854 ) ) ( not ( = ?auto_446847 ?auto_446855 ) ) ( not ( = ?auto_446847 ?auto_446856 ) ) ( not ( = ?auto_446847 ?auto_446857 ) ) ( not ( = ?auto_446847 ?auto_446858 ) ) ( not ( = ?auto_446848 ?auto_446849 ) ) ( not ( = ?auto_446848 ?auto_446850 ) ) ( not ( = ?auto_446848 ?auto_446851 ) ) ( not ( = ?auto_446848 ?auto_446852 ) ) ( not ( = ?auto_446848 ?auto_446853 ) ) ( not ( = ?auto_446848 ?auto_446854 ) ) ( not ( = ?auto_446848 ?auto_446855 ) ) ( not ( = ?auto_446848 ?auto_446856 ) ) ( not ( = ?auto_446848 ?auto_446857 ) ) ( not ( = ?auto_446848 ?auto_446858 ) ) ( not ( = ?auto_446849 ?auto_446850 ) ) ( not ( = ?auto_446849 ?auto_446851 ) ) ( not ( = ?auto_446849 ?auto_446852 ) ) ( not ( = ?auto_446849 ?auto_446853 ) ) ( not ( = ?auto_446849 ?auto_446854 ) ) ( not ( = ?auto_446849 ?auto_446855 ) ) ( not ( = ?auto_446849 ?auto_446856 ) ) ( not ( = ?auto_446849 ?auto_446857 ) ) ( not ( = ?auto_446849 ?auto_446858 ) ) ( not ( = ?auto_446850 ?auto_446851 ) ) ( not ( = ?auto_446850 ?auto_446852 ) ) ( not ( = ?auto_446850 ?auto_446853 ) ) ( not ( = ?auto_446850 ?auto_446854 ) ) ( not ( = ?auto_446850 ?auto_446855 ) ) ( not ( = ?auto_446850 ?auto_446856 ) ) ( not ( = ?auto_446850 ?auto_446857 ) ) ( not ( = ?auto_446850 ?auto_446858 ) ) ( not ( = ?auto_446851 ?auto_446852 ) ) ( not ( = ?auto_446851 ?auto_446853 ) ) ( not ( = ?auto_446851 ?auto_446854 ) ) ( not ( = ?auto_446851 ?auto_446855 ) ) ( not ( = ?auto_446851 ?auto_446856 ) ) ( not ( = ?auto_446851 ?auto_446857 ) ) ( not ( = ?auto_446851 ?auto_446858 ) ) ( not ( = ?auto_446852 ?auto_446853 ) ) ( not ( = ?auto_446852 ?auto_446854 ) ) ( not ( = ?auto_446852 ?auto_446855 ) ) ( not ( = ?auto_446852 ?auto_446856 ) ) ( not ( = ?auto_446852 ?auto_446857 ) ) ( not ( = ?auto_446852 ?auto_446858 ) ) ( not ( = ?auto_446853 ?auto_446854 ) ) ( not ( = ?auto_446853 ?auto_446855 ) ) ( not ( = ?auto_446853 ?auto_446856 ) ) ( not ( = ?auto_446853 ?auto_446857 ) ) ( not ( = ?auto_446853 ?auto_446858 ) ) ( not ( = ?auto_446854 ?auto_446855 ) ) ( not ( = ?auto_446854 ?auto_446856 ) ) ( not ( = ?auto_446854 ?auto_446857 ) ) ( not ( = ?auto_446854 ?auto_446858 ) ) ( not ( = ?auto_446855 ?auto_446856 ) ) ( not ( = ?auto_446855 ?auto_446857 ) ) ( not ( = ?auto_446855 ?auto_446858 ) ) ( not ( = ?auto_446856 ?auto_446857 ) ) ( not ( = ?auto_446856 ?auto_446858 ) ) ( not ( = ?auto_446857 ?auto_446858 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_446857 ?auto_446858 )
      ( !STACK ?auto_446857 ?auto_446856 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_446899 - BLOCK
      ?auto_446900 - BLOCK
      ?auto_446901 - BLOCK
      ?auto_446902 - BLOCK
      ?auto_446903 - BLOCK
      ?auto_446904 - BLOCK
      ?auto_446905 - BLOCK
      ?auto_446906 - BLOCK
      ?auto_446907 - BLOCK
      ?auto_446908 - BLOCK
      ?auto_446909 - BLOCK
      ?auto_446910 - BLOCK
      ?auto_446911 - BLOCK
    )
    :vars
    (
      ?auto_446912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446911 ?auto_446912 ) ( ON-TABLE ?auto_446899 ) ( ON ?auto_446900 ?auto_446899 ) ( ON ?auto_446901 ?auto_446900 ) ( ON ?auto_446902 ?auto_446901 ) ( ON ?auto_446903 ?auto_446902 ) ( ON ?auto_446904 ?auto_446903 ) ( ON ?auto_446905 ?auto_446904 ) ( ON ?auto_446906 ?auto_446905 ) ( ON ?auto_446907 ?auto_446906 ) ( ON ?auto_446908 ?auto_446907 ) ( ON ?auto_446909 ?auto_446908 ) ( not ( = ?auto_446899 ?auto_446900 ) ) ( not ( = ?auto_446899 ?auto_446901 ) ) ( not ( = ?auto_446899 ?auto_446902 ) ) ( not ( = ?auto_446899 ?auto_446903 ) ) ( not ( = ?auto_446899 ?auto_446904 ) ) ( not ( = ?auto_446899 ?auto_446905 ) ) ( not ( = ?auto_446899 ?auto_446906 ) ) ( not ( = ?auto_446899 ?auto_446907 ) ) ( not ( = ?auto_446899 ?auto_446908 ) ) ( not ( = ?auto_446899 ?auto_446909 ) ) ( not ( = ?auto_446899 ?auto_446910 ) ) ( not ( = ?auto_446899 ?auto_446911 ) ) ( not ( = ?auto_446899 ?auto_446912 ) ) ( not ( = ?auto_446900 ?auto_446901 ) ) ( not ( = ?auto_446900 ?auto_446902 ) ) ( not ( = ?auto_446900 ?auto_446903 ) ) ( not ( = ?auto_446900 ?auto_446904 ) ) ( not ( = ?auto_446900 ?auto_446905 ) ) ( not ( = ?auto_446900 ?auto_446906 ) ) ( not ( = ?auto_446900 ?auto_446907 ) ) ( not ( = ?auto_446900 ?auto_446908 ) ) ( not ( = ?auto_446900 ?auto_446909 ) ) ( not ( = ?auto_446900 ?auto_446910 ) ) ( not ( = ?auto_446900 ?auto_446911 ) ) ( not ( = ?auto_446900 ?auto_446912 ) ) ( not ( = ?auto_446901 ?auto_446902 ) ) ( not ( = ?auto_446901 ?auto_446903 ) ) ( not ( = ?auto_446901 ?auto_446904 ) ) ( not ( = ?auto_446901 ?auto_446905 ) ) ( not ( = ?auto_446901 ?auto_446906 ) ) ( not ( = ?auto_446901 ?auto_446907 ) ) ( not ( = ?auto_446901 ?auto_446908 ) ) ( not ( = ?auto_446901 ?auto_446909 ) ) ( not ( = ?auto_446901 ?auto_446910 ) ) ( not ( = ?auto_446901 ?auto_446911 ) ) ( not ( = ?auto_446901 ?auto_446912 ) ) ( not ( = ?auto_446902 ?auto_446903 ) ) ( not ( = ?auto_446902 ?auto_446904 ) ) ( not ( = ?auto_446902 ?auto_446905 ) ) ( not ( = ?auto_446902 ?auto_446906 ) ) ( not ( = ?auto_446902 ?auto_446907 ) ) ( not ( = ?auto_446902 ?auto_446908 ) ) ( not ( = ?auto_446902 ?auto_446909 ) ) ( not ( = ?auto_446902 ?auto_446910 ) ) ( not ( = ?auto_446902 ?auto_446911 ) ) ( not ( = ?auto_446902 ?auto_446912 ) ) ( not ( = ?auto_446903 ?auto_446904 ) ) ( not ( = ?auto_446903 ?auto_446905 ) ) ( not ( = ?auto_446903 ?auto_446906 ) ) ( not ( = ?auto_446903 ?auto_446907 ) ) ( not ( = ?auto_446903 ?auto_446908 ) ) ( not ( = ?auto_446903 ?auto_446909 ) ) ( not ( = ?auto_446903 ?auto_446910 ) ) ( not ( = ?auto_446903 ?auto_446911 ) ) ( not ( = ?auto_446903 ?auto_446912 ) ) ( not ( = ?auto_446904 ?auto_446905 ) ) ( not ( = ?auto_446904 ?auto_446906 ) ) ( not ( = ?auto_446904 ?auto_446907 ) ) ( not ( = ?auto_446904 ?auto_446908 ) ) ( not ( = ?auto_446904 ?auto_446909 ) ) ( not ( = ?auto_446904 ?auto_446910 ) ) ( not ( = ?auto_446904 ?auto_446911 ) ) ( not ( = ?auto_446904 ?auto_446912 ) ) ( not ( = ?auto_446905 ?auto_446906 ) ) ( not ( = ?auto_446905 ?auto_446907 ) ) ( not ( = ?auto_446905 ?auto_446908 ) ) ( not ( = ?auto_446905 ?auto_446909 ) ) ( not ( = ?auto_446905 ?auto_446910 ) ) ( not ( = ?auto_446905 ?auto_446911 ) ) ( not ( = ?auto_446905 ?auto_446912 ) ) ( not ( = ?auto_446906 ?auto_446907 ) ) ( not ( = ?auto_446906 ?auto_446908 ) ) ( not ( = ?auto_446906 ?auto_446909 ) ) ( not ( = ?auto_446906 ?auto_446910 ) ) ( not ( = ?auto_446906 ?auto_446911 ) ) ( not ( = ?auto_446906 ?auto_446912 ) ) ( not ( = ?auto_446907 ?auto_446908 ) ) ( not ( = ?auto_446907 ?auto_446909 ) ) ( not ( = ?auto_446907 ?auto_446910 ) ) ( not ( = ?auto_446907 ?auto_446911 ) ) ( not ( = ?auto_446907 ?auto_446912 ) ) ( not ( = ?auto_446908 ?auto_446909 ) ) ( not ( = ?auto_446908 ?auto_446910 ) ) ( not ( = ?auto_446908 ?auto_446911 ) ) ( not ( = ?auto_446908 ?auto_446912 ) ) ( not ( = ?auto_446909 ?auto_446910 ) ) ( not ( = ?auto_446909 ?auto_446911 ) ) ( not ( = ?auto_446909 ?auto_446912 ) ) ( not ( = ?auto_446910 ?auto_446911 ) ) ( not ( = ?auto_446910 ?auto_446912 ) ) ( not ( = ?auto_446911 ?auto_446912 ) ) ( CLEAR ?auto_446909 ) ( ON ?auto_446910 ?auto_446911 ) ( CLEAR ?auto_446910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_446899 ?auto_446900 ?auto_446901 ?auto_446902 ?auto_446903 ?auto_446904 ?auto_446905 ?auto_446906 ?auto_446907 ?auto_446908 ?auto_446909 ?auto_446910 )
      ( MAKE-13PILE ?auto_446899 ?auto_446900 ?auto_446901 ?auto_446902 ?auto_446903 ?auto_446904 ?auto_446905 ?auto_446906 ?auto_446907 ?auto_446908 ?auto_446909 ?auto_446910 ?auto_446911 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_446953 - BLOCK
      ?auto_446954 - BLOCK
      ?auto_446955 - BLOCK
      ?auto_446956 - BLOCK
      ?auto_446957 - BLOCK
      ?auto_446958 - BLOCK
      ?auto_446959 - BLOCK
      ?auto_446960 - BLOCK
      ?auto_446961 - BLOCK
      ?auto_446962 - BLOCK
      ?auto_446963 - BLOCK
      ?auto_446964 - BLOCK
      ?auto_446965 - BLOCK
    )
    :vars
    (
      ?auto_446966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_446965 ?auto_446966 ) ( ON-TABLE ?auto_446953 ) ( ON ?auto_446954 ?auto_446953 ) ( ON ?auto_446955 ?auto_446954 ) ( ON ?auto_446956 ?auto_446955 ) ( ON ?auto_446957 ?auto_446956 ) ( ON ?auto_446958 ?auto_446957 ) ( ON ?auto_446959 ?auto_446958 ) ( ON ?auto_446960 ?auto_446959 ) ( ON ?auto_446961 ?auto_446960 ) ( ON ?auto_446962 ?auto_446961 ) ( not ( = ?auto_446953 ?auto_446954 ) ) ( not ( = ?auto_446953 ?auto_446955 ) ) ( not ( = ?auto_446953 ?auto_446956 ) ) ( not ( = ?auto_446953 ?auto_446957 ) ) ( not ( = ?auto_446953 ?auto_446958 ) ) ( not ( = ?auto_446953 ?auto_446959 ) ) ( not ( = ?auto_446953 ?auto_446960 ) ) ( not ( = ?auto_446953 ?auto_446961 ) ) ( not ( = ?auto_446953 ?auto_446962 ) ) ( not ( = ?auto_446953 ?auto_446963 ) ) ( not ( = ?auto_446953 ?auto_446964 ) ) ( not ( = ?auto_446953 ?auto_446965 ) ) ( not ( = ?auto_446953 ?auto_446966 ) ) ( not ( = ?auto_446954 ?auto_446955 ) ) ( not ( = ?auto_446954 ?auto_446956 ) ) ( not ( = ?auto_446954 ?auto_446957 ) ) ( not ( = ?auto_446954 ?auto_446958 ) ) ( not ( = ?auto_446954 ?auto_446959 ) ) ( not ( = ?auto_446954 ?auto_446960 ) ) ( not ( = ?auto_446954 ?auto_446961 ) ) ( not ( = ?auto_446954 ?auto_446962 ) ) ( not ( = ?auto_446954 ?auto_446963 ) ) ( not ( = ?auto_446954 ?auto_446964 ) ) ( not ( = ?auto_446954 ?auto_446965 ) ) ( not ( = ?auto_446954 ?auto_446966 ) ) ( not ( = ?auto_446955 ?auto_446956 ) ) ( not ( = ?auto_446955 ?auto_446957 ) ) ( not ( = ?auto_446955 ?auto_446958 ) ) ( not ( = ?auto_446955 ?auto_446959 ) ) ( not ( = ?auto_446955 ?auto_446960 ) ) ( not ( = ?auto_446955 ?auto_446961 ) ) ( not ( = ?auto_446955 ?auto_446962 ) ) ( not ( = ?auto_446955 ?auto_446963 ) ) ( not ( = ?auto_446955 ?auto_446964 ) ) ( not ( = ?auto_446955 ?auto_446965 ) ) ( not ( = ?auto_446955 ?auto_446966 ) ) ( not ( = ?auto_446956 ?auto_446957 ) ) ( not ( = ?auto_446956 ?auto_446958 ) ) ( not ( = ?auto_446956 ?auto_446959 ) ) ( not ( = ?auto_446956 ?auto_446960 ) ) ( not ( = ?auto_446956 ?auto_446961 ) ) ( not ( = ?auto_446956 ?auto_446962 ) ) ( not ( = ?auto_446956 ?auto_446963 ) ) ( not ( = ?auto_446956 ?auto_446964 ) ) ( not ( = ?auto_446956 ?auto_446965 ) ) ( not ( = ?auto_446956 ?auto_446966 ) ) ( not ( = ?auto_446957 ?auto_446958 ) ) ( not ( = ?auto_446957 ?auto_446959 ) ) ( not ( = ?auto_446957 ?auto_446960 ) ) ( not ( = ?auto_446957 ?auto_446961 ) ) ( not ( = ?auto_446957 ?auto_446962 ) ) ( not ( = ?auto_446957 ?auto_446963 ) ) ( not ( = ?auto_446957 ?auto_446964 ) ) ( not ( = ?auto_446957 ?auto_446965 ) ) ( not ( = ?auto_446957 ?auto_446966 ) ) ( not ( = ?auto_446958 ?auto_446959 ) ) ( not ( = ?auto_446958 ?auto_446960 ) ) ( not ( = ?auto_446958 ?auto_446961 ) ) ( not ( = ?auto_446958 ?auto_446962 ) ) ( not ( = ?auto_446958 ?auto_446963 ) ) ( not ( = ?auto_446958 ?auto_446964 ) ) ( not ( = ?auto_446958 ?auto_446965 ) ) ( not ( = ?auto_446958 ?auto_446966 ) ) ( not ( = ?auto_446959 ?auto_446960 ) ) ( not ( = ?auto_446959 ?auto_446961 ) ) ( not ( = ?auto_446959 ?auto_446962 ) ) ( not ( = ?auto_446959 ?auto_446963 ) ) ( not ( = ?auto_446959 ?auto_446964 ) ) ( not ( = ?auto_446959 ?auto_446965 ) ) ( not ( = ?auto_446959 ?auto_446966 ) ) ( not ( = ?auto_446960 ?auto_446961 ) ) ( not ( = ?auto_446960 ?auto_446962 ) ) ( not ( = ?auto_446960 ?auto_446963 ) ) ( not ( = ?auto_446960 ?auto_446964 ) ) ( not ( = ?auto_446960 ?auto_446965 ) ) ( not ( = ?auto_446960 ?auto_446966 ) ) ( not ( = ?auto_446961 ?auto_446962 ) ) ( not ( = ?auto_446961 ?auto_446963 ) ) ( not ( = ?auto_446961 ?auto_446964 ) ) ( not ( = ?auto_446961 ?auto_446965 ) ) ( not ( = ?auto_446961 ?auto_446966 ) ) ( not ( = ?auto_446962 ?auto_446963 ) ) ( not ( = ?auto_446962 ?auto_446964 ) ) ( not ( = ?auto_446962 ?auto_446965 ) ) ( not ( = ?auto_446962 ?auto_446966 ) ) ( not ( = ?auto_446963 ?auto_446964 ) ) ( not ( = ?auto_446963 ?auto_446965 ) ) ( not ( = ?auto_446963 ?auto_446966 ) ) ( not ( = ?auto_446964 ?auto_446965 ) ) ( not ( = ?auto_446964 ?auto_446966 ) ) ( not ( = ?auto_446965 ?auto_446966 ) ) ( ON ?auto_446964 ?auto_446965 ) ( CLEAR ?auto_446962 ) ( ON ?auto_446963 ?auto_446964 ) ( CLEAR ?auto_446963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_446953 ?auto_446954 ?auto_446955 ?auto_446956 ?auto_446957 ?auto_446958 ?auto_446959 ?auto_446960 ?auto_446961 ?auto_446962 ?auto_446963 )
      ( MAKE-13PILE ?auto_446953 ?auto_446954 ?auto_446955 ?auto_446956 ?auto_446957 ?auto_446958 ?auto_446959 ?auto_446960 ?auto_446961 ?auto_446962 ?auto_446963 ?auto_446964 ?auto_446965 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_447007 - BLOCK
      ?auto_447008 - BLOCK
      ?auto_447009 - BLOCK
      ?auto_447010 - BLOCK
      ?auto_447011 - BLOCK
      ?auto_447012 - BLOCK
      ?auto_447013 - BLOCK
      ?auto_447014 - BLOCK
      ?auto_447015 - BLOCK
      ?auto_447016 - BLOCK
      ?auto_447017 - BLOCK
      ?auto_447018 - BLOCK
      ?auto_447019 - BLOCK
    )
    :vars
    (
      ?auto_447020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447019 ?auto_447020 ) ( ON-TABLE ?auto_447007 ) ( ON ?auto_447008 ?auto_447007 ) ( ON ?auto_447009 ?auto_447008 ) ( ON ?auto_447010 ?auto_447009 ) ( ON ?auto_447011 ?auto_447010 ) ( ON ?auto_447012 ?auto_447011 ) ( ON ?auto_447013 ?auto_447012 ) ( ON ?auto_447014 ?auto_447013 ) ( ON ?auto_447015 ?auto_447014 ) ( not ( = ?auto_447007 ?auto_447008 ) ) ( not ( = ?auto_447007 ?auto_447009 ) ) ( not ( = ?auto_447007 ?auto_447010 ) ) ( not ( = ?auto_447007 ?auto_447011 ) ) ( not ( = ?auto_447007 ?auto_447012 ) ) ( not ( = ?auto_447007 ?auto_447013 ) ) ( not ( = ?auto_447007 ?auto_447014 ) ) ( not ( = ?auto_447007 ?auto_447015 ) ) ( not ( = ?auto_447007 ?auto_447016 ) ) ( not ( = ?auto_447007 ?auto_447017 ) ) ( not ( = ?auto_447007 ?auto_447018 ) ) ( not ( = ?auto_447007 ?auto_447019 ) ) ( not ( = ?auto_447007 ?auto_447020 ) ) ( not ( = ?auto_447008 ?auto_447009 ) ) ( not ( = ?auto_447008 ?auto_447010 ) ) ( not ( = ?auto_447008 ?auto_447011 ) ) ( not ( = ?auto_447008 ?auto_447012 ) ) ( not ( = ?auto_447008 ?auto_447013 ) ) ( not ( = ?auto_447008 ?auto_447014 ) ) ( not ( = ?auto_447008 ?auto_447015 ) ) ( not ( = ?auto_447008 ?auto_447016 ) ) ( not ( = ?auto_447008 ?auto_447017 ) ) ( not ( = ?auto_447008 ?auto_447018 ) ) ( not ( = ?auto_447008 ?auto_447019 ) ) ( not ( = ?auto_447008 ?auto_447020 ) ) ( not ( = ?auto_447009 ?auto_447010 ) ) ( not ( = ?auto_447009 ?auto_447011 ) ) ( not ( = ?auto_447009 ?auto_447012 ) ) ( not ( = ?auto_447009 ?auto_447013 ) ) ( not ( = ?auto_447009 ?auto_447014 ) ) ( not ( = ?auto_447009 ?auto_447015 ) ) ( not ( = ?auto_447009 ?auto_447016 ) ) ( not ( = ?auto_447009 ?auto_447017 ) ) ( not ( = ?auto_447009 ?auto_447018 ) ) ( not ( = ?auto_447009 ?auto_447019 ) ) ( not ( = ?auto_447009 ?auto_447020 ) ) ( not ( = ?auto_447010 ?auto_447011 ) ) ( not ( = ?auto_447010 ?auto_447012 ) ) ( not ( = ?auto_447010 ?auto_447013 ) ) ( not ( = ?auto_447010 ?auto_447014 ) ) ( not ( = ?auto_447010 ?auto_447015 ) ) ( not ( = ?auto_447010 ?auto_447016 ) ) ( not ( = ?auto_447010 ?auto_447017 ) ) ( not ( = ?auto_447010 ?auto_447018 ) ) ( not ( = ?auto_447010 ?auto_447019 ) ) ( not ( = ?auto_447010 ?auto_447020 ) ) ( not ( = ?auto_447011 ?auto_447012 ) ) ( not ( = ?auto_447011 ?auto_447013 ) ) ( not ( = ?auto_447011 ?auto_447014 ) ) ( not ( = ?auto_447011 ?auto_447015 ) ) ( not ( = ?auto_447011 ?auto_447016 ) ) ( not ( = ?auto_447011 ?auto_447017 ) ) ( not ( = ?auto_447011 ?auto_447018 ) ) ( not ( = ?auto_447011 ?auto_447019 ) ) ( not ( = ?auto_447011 ?auto_447020 ) ) ( not ( = ?auto_447012 ?auto_447013 ) ) ( not ( = ?auto_447012 ?auto_447014 ) ) ( not ( = ?auto_447012 ?auto_447015 ) ) ( not ( = ?auto_447012 ?auto_447016 ) ) ( not ( = ?auto_447012 ?auto_447017 ) ) ( not ( = ?auto_447012 ?auto_447018 ) ) ( not ( = ?auto_447012 ?auto_447019 ) ) ( not ( = ?auto_447012 ?auto_447020 ) ) ( not ( = ?auto_447013 ?auto_447014 ) ) ( not ( = ?auto_447013 ?auto_447015 ) ) ( not ( = ?auto_447013 ?auto_447016 ) ) ( not ( = ?auto_447013 ?auto_447017 ) ) ( not ( = ?auto_447013 ?auto_447018 ) ) ( not ( = ?auto_447013 ?auto_447019 ) ) ( not ( = ?auto_447013 ?auto_447020 ) ) ( not ( = ?auto_447014 ?auto_447015 ) ) ( not ( = ?auto_447014 ?auto_447016 ) ) ( not ( = ?auto_447014 ?auto_447017 ) ) ( not ( = ?auto_447014 ?auto_447018 ) ) ( not ( = ?auto_447014 ?auto_447019 ) ) ( not ( = ?auto_447014 ?auto_447020 ) ) ( not ( = ?auto_447015 ?auto_447016 ) ) ( not ( = ?auto_447015 ?auto_447017 ) ) ( not ( = ?auto_447015 ?auto_447018 ) ) ( not ( = ?auto_447015 ?auto_447019 ) ) ( not ( = ?auto_447015 ?auto_447020 ) ) ( not ( = ?auto_447016 ?auto_447017 ) ) ( not ( = ?auto_447016 ?auto_447018 ) ) ( not ( = ?auto_447016 ?auto_447019 ) ) ( not ( = ?auto_447016 ?auto_447020 ) ) ( not ( = ?auto_447017 ?auto_447018 ) ) ( not ( = ?auto_447017 ?auto_447019 ) ) ( not ( = ?auto_447017 ?auto_447020 ) ) ( not ( = ?auto_447018 ?auto_447019 ) ) ( not ( = ?auto_447018 ?auto_447020 ) ) ( not ( = ?auto_447019 ?auto_447020 ) ) ( ON ?auto_447018 ?auto_447019 ) ( ON ?auto_447017 ?auto_447018 ) ( CLEAR ?auto_447015 ) ( ON ?auto_447016 ?auto_447017 ) ( CLEAR ?auto_447016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_447007 ?auto_447008 ?auto_447009 ?auto_447010 ?auto_447011 ?auto_447012 ?auto_447013 ?auto_447014 ?auto_447015 ?auto_447016 )
      ( MAKE-13PILE ?auto_447007 ?auto_447008 ?auto_447009 ?auto_447010 ?auto_447011 ?auto_447012 ?auto_447013 ?auto_447014 ?auto_447015 ?auto_447016 ?auto_447017 ?auto_447018 ?auto_447019 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_447061 - BLOCK
      ?auto_447062 - BLOCK
      ?auto_447063 - BLOCK
      ?auto_447064 - BLOCK
      ?auto_447065 - BLOCK
      ?auto_447066 - BLOCK
      ?auto_447067 - BLOCK
      ?auto_447068 - BLOCK
      ?auto_447069 - BLOCK
      ?auto_447070 - BLOCK
      ?auto_447071 - BLOCK
      ?auto_447072 - BLOCK
      ?auto_447073 - BLOCK
    )
    :vars
    (
      ?auto_447074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447073 ?auto_447074 ) ( ON-TABLE ?auto_447061 ) ( ON ?auto_447062 ?auto_447061 ) ( ON ?auto_447063 ?auto_447062 ) ( ON ?auto_447064 ?auto_447063 ) ( ON ?auto_447065 ?auto_447064 ) ( ON ?auto_447066 ?auto_447065 ) ( ON ?auto_447067 ?auto_447066 ) ( ON ?auto_447068 ?auto_447067 ) ( not ( = ?auto_447061 ?auto_447062 ) ) ( not ( = ?auto_447061 ?auto_447063 ) ) ( not ( = ?auto_447061 ?auto_447064 ) ) ( not ( = ?auto_447061 ?auto_447065 ) ) ( not ( = ?auto_447061 ?auto_447066 ) ) ( not ( = ?auto_447061 ?auto_447067 ) ) ( not ( = ?auto_447061 ?auto_447068 ) ) ( not ( = ?auto_447061 ?auto_447069 ) ) ( not ( = ?auto_447061 ?auto_447070 ) ) ( not ( = ?auto_447061 ?auto_447071 ) ) ( not ( = ?auto_447061 ?auto_447072 ) ) ( not ( = ?auto_447061 ?auto_447073 ) ) ( not ( = ?auto_447061 ?auto_447074 ) ) ( not ( = ?auto_447062 ?auto_447063 ) ) ( not ( = ?auto_447062 ?auto_447064 ) ) ( not ( = ?auto_447062 ?auto_447065 ) ) ( not ( = ?auto_447062 ?auto_447066 ) ) ( not ( = ?auto_447062 ?auto_447067 ) ) ( not ( = ?auto_447062 ?auto_447068 ) ) ( not ( = ?auto_447062 ?auto_447069 ) ) ( not ( = ?auto_447062 ?auto_447070 ) ) ( not ( = ?auto_447062 ?auto_447071 ) ) ( not ( = ?auto_447062 ?auto_447072 ) ) ( not ( = ?auto_447062 ?auto_447073 ) ) ( not ( = ?auto_447062 ?auto_447074 ) ) ( not ( = ?auto_447063 ?auto_447064 ) ) ( not ( = ?auto_447063 ?auto_447065 ) ) ( not ( = ?auto_447063 ?auto_447066 ) ) ( not ( = ?auto_447063 ?auto_447067 ) ) ( not ( = ?auto_447063 ?auto_447068 ) ) ( not ( = ?auto_447063 ?auto_447069 ) ) ( not ( = ?auto_447063 ?auto_447070 ) ) ( not ( = ?auto_447063 ?auto_447071 ) ) ( not ( = ?auto_447063 ?auto_447072 ) ) ( not ( = ?auto_447063 ?auto_447073 ) ) ( not ( = ?auto_447063 ?auto_447074 ) ) ( not ( = ?auto_447064 ?auto_447065 ) ) ( not ( = ?auto_447064 ?auto_447066 ) ) ( not ( = ?auto_447064 ?auto_447067 ) ) ( not ( = ?auto_447064 ?auto_447068 ) ) ( not ( = ?auto_447064 ?auto_447069 ) ) ( not ( = ?auto_447064 ?auto_447070 ) ) ( not ( = ?auto_447064 ?auto_447071 ) ) ( not ( = ?auto_447064 ?auto_447072 ) ) ( not ( = ?auto_447064 ?auto_447073 ) ) ( not ( = ?auto_447064 ?auto_447074 ) ) ( not ( = ?auto_447065 ?auto_447066 ) ) ( not ( = ?auto_447065 ?auto_447067 ) ) ( not ( = ?auto_447065 ?auto_447068 ) ) ( not ( = ?auto_447065 ?auto_447069 ) ) ( not ( = ?auto_447065 ?auto_447070 ) ) ( not ( = ?auto_447065 ?auto_447071 ) ) ( not ( = ?auto_447065 ?auto_447072 ) ) ( not ( = ?auto_447065 ?auto_447073 ) ) ( not ( = ?auto_447065 ?auto_447074 ) ) ( not ( = ?auto_447066 ?auto_447067 ) ) ( not ( = ?auto_447066 ?auto_447068 ) ) ( not ( = ?auto_447066 ?auto_447069 ) ) ( not ( = ?auto_447066 ?auto_447070 ) ) ( not ( = ?auto_447066 ?auto_447071 ) ) ( not ( = ?auto_447066 ?auto_447072 ) ) ( not ( = ?auto_447066 ?auto_447073 ) ) ( not ( = ?auto_447066 ?auto_447074 ) ) ( not ( = ?auto_447067 ?auto_447068 ) ) ( not ( = ?auto_447067 ?auto_447069 ) ) ( not ( = ?auto_447067 ?auto_447070 ) ) ( not ( = ?auto_447067 ?auto_447071 ) ) ( not ( = ?auto_447067 ?auto_447072 ) ) ( not ( = ?auto_447067 ?auto_447073 ) ) ( not ( = ?auto_447067 ?auto_447074 ) ) ( not ( = ?auto_447068 ?auto_447069 ) ) ( not ( = ?auto_447068 ?auto_447070 ) ) ( not ( = ?auto_447068 ?auto_447071 ) ) ( not ( = ?auto_447068 ?auto_447072 ) ) ( not ( = ?auto_447068 ?auto_447073 ) ) ( not ( = ?auto_447068 ?auto_447074 ) ) ( not ( = ?auto_447069 ?auto_447070 ) ) ( not ( = ?auto_447069 ?auto_447071 ) ) ( not ( = ?auto_447069 ?auto_447072 ) ) ( not ( = ?auto_447069 ?auto_447073 ) ) ( not ( = ?auto_447069 ?auto_447074 ) ) ( not ( = ?auto_447070 ?auto_447071 ) ) ( not ( = ?auto_447070 ?auto_447072 ) ) ( not ( = ?auto_447070 ?auto_447073 ) ) ( not ( = ?auto_447070 ?auto_447074 ) ) ( not ( = ?auto_447071 ?auto_447072 ) ) ( not ( = ?auto_447071 ?auto_447073 ) ) ( not ( = ?auto_447071 ?auto_447074 ) ) ( not ( = ?auto_447072 ?auto_447073 ) ) ( not ( = ?auto_447072 ?auto_447074 ) ) ( not ( = ?auto_447073 ?auto_447074 ) ) ( ON ?auto_447072 ?auto_447073 ) ( ON ?auto_447071 ?auto_447072 ) ( ON ?auto_447070 ?auto_447071 ) ( CLEAR ?auto_447068 ) ( ON ?auto_447069 ?auto_447070 ) ( CLEAR ?auto_447069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_447061 ?auto_447062 ?auto_447063 ?auto_447064 ?auto_447065 ?auto_447066 ?auto_447067 ?auto_447068 ?auto_447069 )
      ( MAKE-13PILE ?auto_447061 ?auto_447062 ?auto_447063 ?auto_447064 ?auto_447065 ?auto_447066 ?auto_447067 ?auto_447068 ?auto_447069 ?auto_447070 ?auto_447071 ?auto_447072 ?auto_447073 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_447115 - BLOCK
      ?auto_447116 - BLOCK
      ?auto_447117 - BLOCK
      ?auto_447118 - BLOCK
      ?auto_447119 - BLOCK
      ?auto_447120 - BLOCK
      ?auto_447121 - BLOCK
      ?auto_447122 - BLOCK
      ?auto_447123 - BLOCK
      ?auto_447124 - BLOCK
      ?auto_447125 - BLOCK
      ?auto_447126 - BLOCK
      ?auto_447127 - BLOCK
    )
    :vars
    (
      ?auto_447128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447127 ?auto_447128 ) ( ON-TABLE ?auto_447115 ) ( ON ?auto_447116 ?auto_447115 ) ( ON ?auto_447117 ?auto_447116 ) ( ON ?auto_447118 ?auto_447117 ) ( ON ?auto_447119 ?auto_447118 ) ( ON ?auto_447120 ?auto_447119 ) ( ON ?auto_447121 ?auto_447120 ) ( not ( = ?auto_447115 ?auto_447116 ) ) ( not ( = ?auto_447115 ?auto_447117 ) ) ( not ( = ?auto_447115 ?auto_447118 ) ) ( not ( = ?auto_447115 ?auto_447119 ) ) ( not ( = ?auto_447115 ?auto_447120 ) ) ( not ( = ?auto_447115 ?auto_447121 ) ) ( not ( = ?auto_447115 ?auto_447122 ) ) ( not ( = ?auto_447115 ?auto_447123 ) ) ( not ( = ?auto_447115 ?auto_447124 ) ) ( not ( = ?auto_447115 ?auto_447125 ) ) ( not ( = ?auto_447115 ?auto_447126 ) ) ( not ( = ?auto_447115 ?auto_447127 ) ) ( not ( = ?auto_447115 ?auto_447128 ) ) ( not ( = ?auto_447116 ?auto_447117 ) ) ( not ( = ?auto_447116 ?auto_447118 ) ) ( not ( = ?auto_447116 ?auto_447119 ) ) ( not ( = ?auto_447116 ?auto_447120 ) ) ( not ( = ?auto_447116 ?auto_447121 ) ) ( not ( = ?auto_447116 ?auto_447122 ) ) ( not ( = ?auto_447116 ?auto_447123 ) ) ( not ( = ?auto_447116 ?auto_447124 ) ) ( not ( = ?auto_447116 ?auto_447125 ) ) ( not ( = ?auto_447116 ?auto_447126 ) ) ( not ( = ?auto_447116 ?auto_447127 ) ) ( not ( = ?auto_447116 ?auto_447128 ) ) ( not ( = ?auto_447117 ?auto_447118 ) ) ( not ( = ?auto_447117 ?auto_447119 ) ) ( not ( = ?auto_447117 ?auto_447120 ) ) ( not ( = ?auto_447117 ?auto_447121 ) ) ( not ( = ?auto_447117 ?auto_447122 ) ) ( not ( = ?auto_447117 ?auto_447123 ) ) ( not ( = ?auto_447117 ?auto_447124 ) ) ( not ( = ?auto_447117 ?auto_447125 ) ) ( not ( = ?auto_447117 ?auto_447126 ) ) ( not ( = ?auto_447117 ?auto_447127 ) ) ( not ( = ?auto_447117 ?auto_447128 ) ) ( not ( = ?auto_447118 ?auto_447119 ) ) ( not ( = ?auto_447118 ?auto_447120 ) ) ( not ( = ?auto_447118 ?auto_447121 ) ) ( not ( = ?auto_447118 ?auto_447122 ) ) ( not ( = ?auto_447118 ?auto_447123 ) ) ( not ( = ?auto_447118 ?auto_447124 ) ) ( not ( = ?auto_447118 ?auto_447125 ) ) ( not ( = ?auto_447118 ?auto_447126 ) ) ( not ( = ?auto_447118 ?auto_447127 ) ) ( not ( = ?auto_447118 ?auto_447128 ) ) ( not ( = ?auto_447119 ?auto_447120 ) ) ( not ( = ?auto_447119 ?auto_447121 ) ) ( not ( = ?auto_447119 ?auto_447122 ) ) ( not ( = ?auto_447119 ?auto_447123 ) ) ( not ( = ?auto_447119 ?auto_447124 ) ) ( not ( = ?auto_447119 ?auto_447125 ) ) ( not ( = ?auto_447119 ?auto_447126 ) ) ( not ( = ?auto_447119 ?auto_447127 ) ) ( not ( = ?auto_447119 ?auto_447128 ) ) ( not ( = ?auto_447120 ?auto_447121 ) ) ( not ( = ?auto_447120 ?auto_447122 ) ) ( not ( = ?auto_447120 ?auto_447123 ) ) ( not ( = ?auto_447120 ?auto_447124 ) ) ( not ( = ?auto_447120 ?auto_447125 ) ) ( not ( = ?auto_447120 ?auto_447126 ) ) ( not ( = ?auto_447120 ?auto_447127 ) ) ( not ( = ?auto_447120 ?auto_447128 ) ) ( not ( = ?auto_447121 ?auto_447122 ) ) ( not ( = ?auto_447121 ?auto_447123 ) ) ( not ( = ?auto_447121 ?auto_447124 ) ) ( not ( = ?auto_447121 ?auto_447125 ) ) ( not ( = ?auto_447121 ?auto_447126 ) ) ( not ( = ?auto_447121 ?auto_447127 ) ) ( not ( = ?auto_447121 ?auto_447128 ) ) ( not ( = ?auto_447122 ?auto_447123 ) ) ( not ( = ?auto_447122 ?auto_447124 ) ) ( not ( = ?auto_447122 ?auto_447125 ) ) ( not ( = ?auto_447122 ?auto_447126 ) ) ( not ( = ?auto_447122 ?auto_447127 ) ) ( not ( = ?auto_447122 ?auto_447128 ) ) ( not ( = ?auto_447123 ?auto_447124 ) ) ( not ( = ?auto_447123 ?auto_447125 ) ) ( not ( = ?auto_447123 ?auto_447126 ) ) ( not ( = ?auto_447123 ?auto_447127 ) ) ( not ( = ?auto_447123 ?auto_447128 ) ) ( not ( = ?auto_447124 ?auto_447125 ) ) ( not ( = ?auto_447124 ?auto_447126 ) ) ( not ( = ?auto_447124 ?auto_447127 ) ) ( not ( = ?auto_447124 ?auto_447128 ) ) ( not ( = ?auto_447125 ?auto_447126 ) ) ( not ( = ?auto_447125 ?auto_447127 ) ) ( not ( = ?auto_447125 ?auto_447128 ) ) ( not ( = ?auto_447126 ?auto_447127 ) ) ( not ( = ?auto_447126 ?auto_447128 ) ) ( not ( = ?auto_447127 ?auto_447128 ) ) ( ON ?auto_447126 ?auto_447127 ) ( ON ?auto_447125 ?auto_447126 ) ( ON ?auto_447124 ?auto_447125 ) ( ON ?auto_447123 ?auto_447124 ) ( CLEAR ?auto_447121 ) ( ON ?auto_447122 ?auto_447123 ) ( CLEAR ?auto_447122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_447115 ?auto_447116 ?auto_447117 ?auto_447118 ?auto_447119 ?auto_447120 ?auto_447121 ?auto_447122 )
      ( MAKE-13PILE ?auto_447115 ?auto_447116 ?auto_447117 ?auto_447118 ?auto_447119 ?auto_447120 ?auto_447121 ?auto_447122 ?auto_447123 ?auto_447124 ?auto_447125 ?auto_447126 ?auto_447127 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_447169 - BLOCK
      ?auto_447170 - BLOCK
      ?auto_447171 - BLOCK
      ?auto_447172 - BLOCK
      ?auto_447173 - BLOCK
      ?auto_447174 - BLOCK
      ?auto_447175 - BLOCK
      ?auto_447176 - BLOCK
      ?auto_447177 - BLOCK
      ?auto_447178 - BLOCK
      ?auto_447179 - BLOCK
      ?auto_447180 - BLOCK
      ?auto_447181 - BLOCK
    )
    :vars
    (
      ?auto_447182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447181 ?auto_447182 ) ( ON-TABLE ?auto_447169 ) ( ON ?auto_447170 ?auto_447169 ) ( ON ?auto_447171 ?auto_447170 ) ( ON ?auto_447172 ?auto_447171 ) ( ON ?auto_447173 ?auto_447172 ) ( ON ?auto_447174 ?auto_447173 ) ( not ( = ?auto_447169 ?auto_447170 ) ) ( not ( = ?auto_447169 ?auto_447171 ) ) ( not ( = ?auto_447169 ?auto_447172 ) ) ( not ( = ?auto_447169 ?auto_447173 ) ) ( not ( = ?auto_447169 ?auto_447174 ) ) ( not ( = ?auto_447169 ?auto_447175 ) ) ( not ( = ?auto_447169 ?auto_447176 ) ) ( not ( = ?auto_447169 ?auto_447177 ) ) ( not ( = ?auto_447169 ?auto_447178 ) ) ( not ( = ?auto_447169 ?auto_447179 ) ) ( not ( = ?auto_447169 ?auto_447180 ) ) ( not ( = ?auto_447169 ?auto_447181 ) ) ( not ( = ?auto_447169 ?auto_447182 ) ) ( not ( = ?auto_447170 ?auto_447171 ) ) ( not ( = ?auto_447170 ?auto_447172 ) ) ( not ( = ?auto_447170 ?auto_447173 ) ) ( not ( = ?auto_447170 ?auto_447174 ) ) ( not ( = ?auto_447170 ?auto_447175 ) ) ( not ( = ?auto_447170 ?auto_447176 ) ) ( not ( = ?auto_447170 ?auto_447177 ) ) ( not ( = ?auto_447170 ?auto_447178 ) ) ( not ( = ?auto_447170 ?auto_447179 ) ) ( not ( = ?auto_447170 ?auto_447180 ) ) ( not ( = ?auto_447170 ?auto_447181 ) ) ( not ( = ?auto_447170 ?auto_447182 ) ) ( not ( = ?auto_447171 ?auto_447172 ) ) ( not ( = ?auto_447171 ?auto_447173 ) ) ( not ( = ?auto_447171 ?auto_447174 ) ) ( not ( = ?auto_447171 ?auto_447175 ) ) ( not ( = ?auto_447171 ?auto_447176 ) ) ( not ( = ?auto_447171 ?auto_447177 ) ) ( not ( = ?auto_447171 ?auto_447178 ) ) ( not ( = ?auto_447171 ?auto_447179 ) ) ( not ( = ?auto_447171 ?auto_447180 ) ) ( not ( = ?auto_447171 ?auto_447181 ) ) ( not ( = ?auto_447171 ?auto_447182 ) ) ( not ( = ?auto_447172 ?auto_447173 ) ) ( not ( = ?auto_447172 ?auto_447174 ) ) ( not ( = ?auto_447172 ?auto_447175 ) ) ( not ( = ?auto_447172 ?auto_447176 ) ) ( not ( = ?auto_447172 ?auto_447177 ) ) ( not ( = ?auto_447172 ?auto_447178 ) ) ( not ( = ?auto_447172 ?auto_447179 ) ) ( not ( = ?auto_447172 ?auto_447180 ) ) ( not ( = ?auto_447172 ?auto_447181 ) ) ( not ( = ?auto_447172 ?auto_447182 ) ) ( not ( = ?auto_447173 ?auto_447174 ) ) ( not ( = ?auto_447173 ?auto_447175 ) ) ( not ( = ?auto_447173 ?auto_447176 ) ) ( not ( = ?auto_447173 ?auto_447177 ) ) ( not ( = ?auto_447173 ?auto_447178 ) ) ( not ( = ?auto_447173 ?auto_447179 ) ) ( not ( = ?auto_447173 ?auto_447180 ) ) ( not ( = ?auto_447173 ?auto_447181 ) ) ( not ( = ?auto_447173 ?auto_447182 ) ) ( not ( = ?auto_447174 ?auto_447175 ) ) ( not ( = ?auto_447174 ?auto_447176 ) ) ( not ( = ?auto_447174 ?auto_447177 ) ) ( not ( = ?auto_447174 ?auto_447178 ) ) ( not ( = ?auto_447174 ?auto_447179 ) ) ( not ( = ?auto_447174 ?auto_447180 ) ) ( not ( = ?auto_447174 ?auto_447181 ) ) ( not ( = ?auto_447174 ?auto_447182 ) ) ( not ( = ?auto_447175 ?auto_447176 ) ) ( not ( = ?auto_447175 ?auto_447177 ) ) ( not ( = ?auto_447175 ?auto_447178 ) ) ( not ( = ?auto_447175 ?auto_447179 ) ) ( not ( = ?auto_447175 ?auto_447180 ) ) ( not ( = ?auto_447175 ?auto_447181 ) ) ( not ( = ?auto_447175 ?auto_447182 ) ) ( not ( = ?auto_447176 ?auto_447177 ) ) ( not ( = ?auto_447176 ?auto_447178 ) ) ( not ( = ?auto_447176 ?auto_447179 ) ) ( not ( = ?auto_447176 ?auto_447180 ) ) ( not ( = ?auto_447176 ?auto_447181 ) ) ( not ( = ?auto_447176 ?auto_447182 ) ) ( not ( = ?auto_447177 ?auto_447178 ) ) ( not ( = ?auto_447177 ?auto_447179 ) ) ( not ( = ?auto_447177 ?auto_447180 ) ) ( not ( = ?auto_447177 ?auto_447181 ) ) ( not ( = ?auto_447177 ?auto_447182 ) ) ( not ( = ?auto_447178 ?auto_447179 ) ) ( not ( = ?auto_447178 ?auto_447180 ) ) ( not ( = ?auto_447178 ?auto_447181 ) ) ( not ( = ?auto_447178 ?auto_447182 ) ) ( not ( = ?auto_447179 ?auto_447180 ) ) ( not ( = ?auto_447179 ?auto_447181 ) ) ( not ( = ?auto_447179 ?auto_447182 ) ) ( not ( = ?auto_447180 ?auto_447181 ) ) ( not ( = ?auto_447180 ?auto_447182 ) ) ( not ( = ?auto_447181 ?auto_447182 ) ) ( ON ?auto_447180 ?auto_447181 ) ( ON ?auto_447179 ?auto_447180 ) ( ON ?auto_447178 ?auto_447179 ) ( ON ?auto_447177 ?auto_447178 ) ( ON ?auto_447176 ?auto_447177 ) ( CLEAR ?auto_447174 ) ( ON ?auto_447175 ?auto_447176 ) ( CLEAR ?auto_447175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_447169 ?auto_447170 ?auto_447171 ?auto_447172 ?auto_447173 ?auto_447174 ?auto_447175 )
      ( MAKE-13PILE ?auto_447169 ?auto_447170 ?auto_447171 ?auto_447172 ?auto_447173 ?auto_447174 ?auto_447175 ?auto_447176 ?auto_447177 ?auto_447178 ?auto_447179 ?auto_447180 ?auto_447181 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_447223 - BLOCK
      ?auto_447224 - BLOCK
      ?auto_447225 - BLOCK
      ?auto_447226 - BLOCK
      ?auto_447227 - BLOCK
      ?auto_447228 - BLOCK
      ?auto_447229 - BLOCK
      ?auto_447230 - BLOCK
      ?auto_447231 - BLOCK
      ?auto_447232 - BLOCK
      ?auto_447233 - BLOCK
      ?auto_447234 - BLOCK
      ?auto_447235 - BLOCK
    )
    :vars
    (
      ?auto_447236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447235 ?auto_447236 ) ( ON-TABLE ?auto_447223 ) ( ON ?auto_447224 ?auto_447223 ) ( ON ?auto_447225 ?auto_447224 ) ( ON ?auto_447226 ?auto_447225 ) ( ON ?auto_447227 ?auto_447226 ) ( not ( = ?auto_447223 ?auto_447224 ) ) ( not ( = ?auto_447223 ?auto_447225 ) ) ( not ( = ?auto_447223 ?auto_447226 ) ) ( not ( = ?auto_447223 ?auto_447227 ) ) ( not ( = ?auto_447223 ?auto_447228 ) ) ( not ( = ?auto_447223 ?auto_447229 ) ) ( not ( = ?auto_447223 ?auto_447230 ) ) ( not ( = ?auto_447223 ?auto_447231 ) ) ( not ( = ?auto_447223 ?auto_447232 ) ) ( not ( = ?auto_447223 ?auto_447233 ) ) ( not ( = ?auto_447223 ?auto_447234 ) ) ( not ( = ?auto_447223 ?auto_447235 ) ) ( not ( = ?auto_447223 ?auto_447236 ) ) ( not ( = ?auto_447224 ?auto_447225 ) ) ( not ( = ?auto_447224 ?auto_447226 ) ) ( not ( = ?auto_447224 ?auto_447227 ) ) ( not ( = ?auto_447224 ?auto_447228 ) ) ( not ( = ?auto_447224 ?auto_447229 ) ) ( not ( = ?auto_447224 ?auto_447230 ) ) ( not ( = ?auto_447224 ?auto_447231 ) ) ( not ( = ?auto_447224 ?auto_447232 ) ) ( not ( = ?auto_447224 ?auto_447233 ) ) ( not ( = ?auto_447224 ?auto_447234 ) ) ( not ( = ?auto_447224 ?auto_447235 ) ) ( not ( = ?auto_447224 ?auto_447236 ) ) ( not ( = ?auto_447225 ?auto_447226 ) ) ( not ( = ?auto_447225 ?auto_447227 ) ) ( not ( = ?auto_447225 ?auto_447228 ) ) ( not ( = ?auto_447225 ?auto_447229 ) ) ( not ( = ?auto_447225 ?auto_447230 ) ) ( not ( = ?auto_447225 ?auto_447231 ) ) ( not ( = ?auto_447225 ?auto_447232 ) ) ( not ( = ?auto_447225 ?auto_447233 ) ) ( not ( = ?auto_447225 ?auto_447234 ) ) ( not ( = ?auto_447225 ?auto_447235 ) ) ( not ( = ?auto_447225 ?auto_447236 ) ) ( not ( = ?auto_447226 ?auto_447227 ) ) ( not ( = ?auto_447226 ?auto_447228 ) ) ( not ( = ?auto_447226 ?auto_447229 ) ) ( not ( = ?auto_447226 ?auto_447230 ) ) ( not ( = ?auto_447226 ?auto_447231 ) ) ( not ( = ?auto_447226 ?auto_447232 ) ) ( not ( = ?auto_447226 ?auto_447233 ) ) ( not ( = ?auto_447226 ?auto_447234 ) ) ( not ( = ?auto_447226 ?auto_447235 ) ) ( not ( = ?auto_447226 ?auto_447236 ) ) ( not ( = ?auto_447227 ?auto_447228 ) ) ( not ( = ?auto_447227 ?auto_447229 ) ) ( not ( = ?auto_447227 ?auto_447230 ) ) ( not ( = ?auto_447227 ?auto_447231 ) ) ( not ( = ?auto_447227 ?auto_447232 ) ) ( not ( = ?auto_447227 ?auto_447233 ) ) ( not ( = ?auto_447227 ?auto_447234 ) ) ( not ( = ?auto_447227 ?auto_447235 ) ) ( not ( = ?auto_447227 ?auto_447236 ) ) ( not ( = ?auto_447228 ?auto_447229 ) ) ( not ( = ?auto_447228 ?auto_447230 ) ) ( not ( = ?auto_447228 ?auto_447231 ) ) ( not ( = ?auto_447228 ?auto_447232 ) ) ( not ( = ?auto_447228 ?auto_447233 ) ) ( not ( = ?auto_447228 ?auto_447234 ) ) ( not ( = ?auto_447228 ?auto_447235 ) ) ( not ( = ?auto_447228 ?auto_447236 ) ) ( not ( = ?auto_447229 ?auto_447230 ) ) ( not ( = ?auto_447229 ?auto_447231 ) ) ( not ( = ?auto_447229 ?auto_447232 ) ) ( not ( = ?auto_447229 ?auto_447233 ) ) ( not ( = ?auto_447229 ?auto_447234 ) ) ( not ( = ?auto_447229 ?auto_447235 ) ) ( not ( = ?auto_447229 ?auto_447236 ) ) ( not ( = ?auto_447230 ?auto_447231 ) ) ( not ( = ?auto_447230 ?auto_447232 ) ) ( not ( = ?auto_447230 ?auto_447233 ) ) ( not ( = ?auto_447230 ?auto_447234 ) ) ( not ( = ?auto_447230 ?auto_447235 ) ) ( not ( = ?auto_447230 ?auto_447236 ) ) ( not ( = ?auto_447231 ?auto_447232 ) ) ( not ( = ?auto_447231 ?auto_447233 ) ) ( not ( = ?auto_447231 ?auto_447234 ) ) ( not ( = ?auto_447231 ?auto_447235 ) ) ( not ( = ?auto_447231 ?auto_447236 ) ) ( not ( = ?auto_447232 ?auto_447233 ) ) ( not ( = ?auto_447232 ?auto_447234 ) ) ( not ( = ?auto_447232 ?auto_447235 ) ) ( not ( = ?auto_447232 ?auto_447236 ) ) ( not ( = ?auto_447233 ?auto_447234 ) ) ( not ( = ?auto_447233 ?auto_447235 ) ) ( not ( = ?auto_447233 ?auto_447236 ) ) ( not ( = ?auto_447234 ?auto_447235 ) ) ( not ( = ?auto_447234 ?auto_447236 ) ) ( not ( = ?auto_447235 ?auto_447236 ) ) ( ON ?auto_447234 ?auto_447235 ) ( ON ?auto_447233 ?auto_447234 ) ( ON ?auto_447232 ?auto_447233 ) ( ON ?auto_447231 ?auto_447232 ) ( ON ?auto_447230 ?auto_447231 ) ( ON ?auto_447229 ?auto_447230 ) ( CLEAR ?auto_447227 ) ( ON ?auto_447228 ?auto_447229 ) ( CLEAR ?auto_447228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_447223 ?auto_447224 ?auto_447225 ?auto_447226 ?auto_447227 ?auto_447228 )
      ( MAKE-13PILE ?auto_447223 ?auto_447224 ?auto_447225 ?auto_447226 ?auto_447227 ?auto_447228 ?auto_447229 ?auto_447230 ?auto_447231 ?auto_447232 ?auto_447233 ?auto_447234 ?auto_447235 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_447277 - BLOCK
      ?auto_447278 - BLOCK
      ?auto_447279 - BLOCK
      ?auto_447280 - BLOCK
      ?auto_447281 - BLOCK
      ?auto_447282 - BLOCK
      ?auto_447283 - BLOCK
      ?auto_447284 - BLOCK
      ?auto_447285 - BLOCK
      ?auto_447286 - BLOCK
      ?auto_447287 - BLOCK
      ?auto_447288 - BLOCK
      ?auto_447289 - BLOCK
    )
    :vars
    (
      ?auto_447290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447289 ?auto_447290 ) ( ON-TABLE ?auto_447277 ) ( ON ?auto_447278 ?auto_447277 ) ( ON ?auto_447279 ?auto_447278 ) ( ON ?auto_447280 ?auto_447279 ) ( not ( = ?auto_447277 ?auto_447278 ) ) ( not ( = ?auto_447277 ?auto_447279 ) ) ( not ( = ?auto_447277 ?auto_447280 ) ) ( not ( = ?auto_447277 ?auto_447281 ) ) ( not ( = ?auto_447277 ?auto_447282 ) ) ( not ( = ?auto_447277 ?auto_447283 ) ) ( not ( = ?auto_447277 ?auto_447284 ) ) ( not ( = ?auto_447277 ?auto_447285 ) ) ( not ( = ?auto_447277 ?auto_447286 ) ) ( not ( = ?auto_447277 ?auto_447287 ) ) ( not ( = ?auto_447277 ?auto_447288 ) ) ( not ( = ?auto_447277 ?auto_447289 ) ) ( not ( = ?auto_447277 ?auto_447290 ) ) ( not ( = ?auto_447278 ?auto_447279 ) ) ( not ( = ?auto_447278 ?auto_447280 ) ) ( not ( = ?auto_447278 ?auto_447281 ) ) ( not ( = ?auto_447278 ?auto_447282 ) ) ( not ( = ?auto_447278 ?auto_447283 ) ) ( not ( = ?auto_447278 ?auto_447284 ) ) ( not ( = ?auto_447278 ?auto_447285 ) ) ( not ( = ?auto_447278 ?auto_447286 ) ) ( not ( = ?auto_447278 ?auto_447287 ) ) ( not ( = ?auto_447278 ?auto_447288 ) ) ( not ( = ?auto_447278 ?auto_447289 ) ) ( not ( = ?auto_447278 ?auto_447290 ) ) ( not ( = ?auto_447279 ?auto_447280 ) ) ( not ( = ?auto_447279 ?auto_447281 ) ) ( not ( = ?auto_447279 ?auto_447282 ) ) ( not ( = ?auto_447279 ?auto_447283 ) ) ( not ( = ?auto_447279 ?auto_447284 ) ) ( not ( = ?auto_447279 ?auto_447285 ) ) ( not ( = ?auto_447279 ?auto_447286 ) ) ( not ( = ?auto_447279 ?auto_447287 ) ) ( not ( = ?auto_447279 ?auto_447288 ) ) ( not ( = ?auto_447279 ?auto_447289 ) ) ( not ( = ?auto_447279 ?auto_447290 ) ) ( not ( = ?auto_447280 ?auto_447281 ) ) ( not ( = ?auto_447280 ?auto_447282 ) ) ( not ( = ?auto_447280 ?auto_447283 ) ) ( not ( = ?auto_447280 ?auto_447284 ) ) ( not ( = ?auto_447280 ?auto_447285 ) ) ( not ( = ?auto_447280 ?auto_447286 ) ) ( not ( = ?auto_447280 ?auto_447287 ) ) ( not ( = ?auto_447280 ?auto_447288 ) ) ( not ( = ?auto_447280 ?auto_447289 ) ) ( not ( = ?auto_447280 ?auto_447290 ) ) ( not ( = ?auto_447281 ?auto_447282 ) ) ( not ( = ?auto_447281 ?auto_447283 ) ) ( not ( = ?auto_447281 ?auto_447284 ) ) ( not ( = ?auto_447281 ?auto_447285 ) ) ( not ( = ?auto_447281 ?auto_447286 ) ) ( not ( = ?auto_447281 ?auto_447287 ) ) ( not ( = ?auto_447281 ?auto_447288 ) ) ( not ( = ?auto_447281 ?auto_447289 ) ) ( not ( = ?auto_447281 ?auto_447290 ) ) ( not ( = ?auto_447282 ?auto_447283 ) ) ( not ( = ?auto_447282 ?auto_447284 ) ) ( not ( = ?auto_447282 ?auto_447285 ) ) ( not ( = ?auto_447282 ?auto_447286 ) ) ( not ( = ?auto_447282 ?auto_447287 ) ) ( not ( = ?auto_447282 ?auto_447288 ) ) ( not ( = ?auto_447282 ?auto_447289 ) ) ( not ( = ?auto_447282 ?auto_447290 ) ) ( not ( = ?auto_447283 ?auto_447284 ) ) ( not ( = ?auto_447283 ?auto_447285 ) ) ( not ( = ?auto_447283 ?auto_447286 ) ) ( not ( = ?auto_447283 ?auto_447287 ) ) ( not ( = ?auto_447283 ?auto_447288 ) ) ( not ( = ?auto_447283 ?auto_447289 ) ) ( not ( = ?auto_447283 ?auto_447290 ) ) ( not ( = ?auto_447284 ?auto_447285 ) ) ( not ( = ?auto_447284 ?auto_447286 ) ) ( not ( = ?auto_447284 ?auto_447287 ) ) ( not ( = ?auto_447284 ?auto_447288 ) ) ( not ( = ?auto_447284 ?auto_447289 ) ) ( not ( = ?auto_447284 ?auto_447290 ) ) ( not ( = ?auto_447285 ?auto_447286 ) ) ( not ( = ?auto_447285 ?auto_447287 ) ) ( not ( = ?auto_447285 ?auto_447288 ) ) ( not ( = ?auto_447285 ?auto_447289 ) ) ( not ( = ?auto_447285 ?auto_447290 ) ) ( not ( = ?auto_447286 ?auto_447287 ) ) ( not ( = ?auto_447286 ?auto_447288 ) ) ( not ( = ?auto_447286 ?auto_447289 ) ) ( not ( = ?auto_447286 ?auto_447290 ) ) ( not ( = ?auto_447287 ?auto_447288 ) ) ( not ( = ?auto_447287 ?auto_447289 ) ) ( not ( = ?auto_447287 ?auto_447290 ) ) ( not ( = ?auto_447288 ?auto_447289 ) ) ( not ( = ?auto_447288 ?auto_447290 ) ) ( not ( = ?auto_447289 ?auto_447290 ) ) ( ON ?auto_447288 ?auto_447289 ) ( ON ?auto_447287 ?auto_447288 ) ( ON ?auto_447286 ?auto_447287 ) ( ON ?auto_447285 ?auto_447286 ) ( ON ?auto_447284 ?auto_447285 ) ( ON ?auto_447283 ?auto_447284 ) ( ON ?auto_447282 ?auto_447283 ) ( CLEAR ?auto_447280 ) ( ON ?auto_447281 ?auto_447282 ) ( CLEAR ?auto_447281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_447277 ?auto_447278 ?auto_447279 ?auto_447280 ?auto_447281 )
      ( MAKE-13PILE ?auto_447277 ?auto_447278 ?auto_447279 ?auto_447280 ?auto_447281 ?auto_447282 ?auto_447283 ?auto_447284 ?auto_447285 ?auto_447286 ?auto_447287 ?auto_447288 ?auto_447289 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_447331 - BLOCK
      ?auto_447332 - BLOCK
      ?auto_447333 - BLOCK
      ?auto_447334 - BLOCK
      ?auto_447335 - BLOCK
      ?auto_447336 - BLOCK
      ?auto_447337 - BLOCK
      ?auto_447338 - BLOCK
      ?auto_447339 - BLOCK
      ?auto_447340 - BLOCK
      ?auto_447341 - BLOCK
      ?auto_447342 - BLOCK
      ?auto_447343 - BLOCK
    )
    :vars
    (
      ?auto_447344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447343 ?auto_447344 ) ( ON-TABLE ?auto_447331 ) ( ON ?auto_447332 ?auto_447331 ) ( ON ?auto_447333 ?auto_447332 ) ( not ( = ?auto_447331 ?auto_447332 ) ) ( not ( = ?auto_447331 ?auto_447333 ) ) ( not ( = ?auto_447331 ?auto_447334 ) ) ( not ( = ?auto_447331 ?auto_447335 ) ) ( not ( = ?auto_447331 ?auto_447336 ) ) ( not ( = ?auto_447331 ?auto_447337 ) ) ( not ( = ?auto_447331 ?auto_447338 ) ) ( not ( = ?auto_447331 ?auto_447339 ) ) ( not ( = ?auto_447331 ?auto_447340 ) ) ( not ( = ?auto_447331 ?auto_447341 ) ) ( not ( = ?auto_447331 ?auto_447342 ) ) ( not ( = ?auto_447331 ?auto_447343 ) ) ( not ( = ?auto_447331 ?auto_447344 ) ) ( not ( = ?auto_447332 ?auto_447333 ) ) ( not ( = ?auto_447332 ?auto_447334 ) ) ( not ( = ?auto_447332 ?auto_447335 ) ) ( not ( = ?auto_447332 ?auto_447336 ) ) ( not ( = ?auto_447332 ?auto_447337 ) ) ( not ( = ?auto_447332 ?auto_447338 ) ) ( not ( = ?auto_447332 ?auto_447339 ) ) ( not ( = ?auto_447332 ?auto_447340 ) ) ( not ( = ?auto_447332 ?auto_447341 ) ) ( not ( = ?auto_447332 ?auto_447342 ) ) ( not ( = ?auto_447332 ?auto_447343 ) ) ( not ( = ?auto_447332 ?auto_447344 ) ) ( not ( = ?auto_447333 ?auto_447334 ) ) ( not ( = ?auto_447333 ?auto_447335 ) ) ( not ( = ?auto_447333 ?auto_447336 ) ) ( not ( = ?auto_447333 ?auto_447337 ) ) ( not ( = ?auto_447333 ?auto_447338 ) ) ( not ( = ?auto_447333 ?auto_447339 ) ) ( not ( = ?auto_447333 ?auto_447340 ) ) ( not ( = ?auto_447333 ?auto_447341 ) ) ( not ( = ?auto_447333 ?auto_447342 ) ) ( not ( = ?auto_447333 ?auto_447343 ) ) ( not ( = ?auto_447333 ?auto_447344 ) ) ( not ( = ?auto_447334 ?auto_447335 ) ) ( not ( = ?auto_447334 ?auto_447336 ) ) ( not ( = ?auto_447334 ?auto_447337 ) ) ( not ( = ?auto_447334 ?auto_447338 ) ) ( not ( = ?auto_447334 ?auto_447339 ) ) ( not ( = ?auto_447334 ?auto_447340 ) ) ( not ( = ?auto_447334 ?auto_447341 ) ) ( not ( = ?auto_447334 ?auto_447342 ) ) ( not ( = ?auto_447334 ?auto_447343 ) ) ( not ( = ?auto_447334 ?auto_447344 ) ) ( not ( = ?auto_447335 ?auto_447336 ) ) ( not ( = ?auto_447335 ?auto_447337 ) ) ( not ( = ?auto_447335 ?auto_447338 ) ) ( not ( = ?auto_447335 ?auto_447339 ) ) ( not ( = ?auto_447335 ?auto_447340 ) ) ( not ( = ?auto_447335 ?auto_447341 ) ) ( not ( = ?auto_447335 ?auto_447342 ) ) ( not ( = ?auto_447335 ?auto_447343 ) ) ( not ( = ?auto_447335 ?auto_447344 ) ) ( not ( = ?auto_447336 ?auto_447337 ) ) ( not ( = ?auto_447336 ?auto_447338 ) ) ( not ( = ?auto_447336 ?auto_447339 ) ) ( not ( = ?auto_447336 ?auto_447340 ) ) ( not ( = ?auto_447336 ?auto_447341 ) ) ( not ( = ?auto_447336 ?auto_447342 ) ) ( not ( = ?auto_447336 ?auto_447343 ) ) ( not ( = ?auto_447336 ?auto_447344 ) ) ( not ( = ?auto_447337 ?auto_447338 ) ) ( not ( = ?auto_447337 ?auto_447339 ) ) ( not ( = ?auto_447337 ?auto_447340 ) ) ( not ( = ?auto_447337 ?auto_447341 ) ) ( not ( = ?auto_447337 ?auto_447342 ) ) ( not ( = ?auto_447337 ?auto_447343 ) ) ( not ( = ?auto_447337 ?auto_447344 ) ) ( not ( = ?auto_447338 ?auto_447339 ) ) ( not ( = ?auto_447338 ?auto_447340 ) ) ( not ( = ?auto_447338 ?auto_447341 ) ) ( not ( = ?auto_447338 ?auto_447342 ) ) ( not ( = ?auto_447338 ?auto_447343 ) ) ( not ( = ?auto_447338 ?auto_447344 ) ) ( not ( = ?auto_447339 ?auto_447340 ) ) ( not ( = ?auto_447339 ?auto_447341 ) ) ( not ( = ?auto_447339 ?auto_447342 ) ) ( not ( = ?auto_447339 ?auto_447343 ) ) ( not ( = ?auto_447339 ?auto_447344 ) ) ( not ( = ?auto_447340 ?auto_447341 ) ) ( not ( = ?auto_447340 ?auto_447342 ) ) ( not ( = ?auto_447340 ?auto_447343 ) ) ( not ( = ?auto_447340 ?auto_447344 ) ) ( not ( = ?auto_447341 ?auto_447342 ) ) ( not ( = ?auto_447341 ?auto_447343 ) ) ( not ( = ?auto_447341 ?auto_447344 ) ) ( not ( = ?auto_447342 ?auto_447343 ) ) ( not ( = ?auto_447342 ?auto_447344 ) ) ( not ( = ?auto_447343 ?auto_447344 ) ) ( ON ?auto_447342 ?auto_447343 ) ( ON ?auto_447341 ?auto_447342 ) ( ON ?auto_447340 ?auto_447341 ) ( ON ?auto_447339 ?auto_447340 ) ( ON ?auto_447338 ?auto_447339 ) ( ON ?auto_447337 ?auto_447338 ) ( ON ?auto_447336 ?auto_447337 ) ( ON ?auto_447335 ?auto_447336 ) ( CLEAR ?auto_447333 ) ( ON ?auto_447334 ?auto_447335 ) ( CLEAR ?auto_447334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_447331 ?auto_447332 ?auto_447333 ?auto_447334 )
      ( MAKE-13PILE ?auto_447331 ?auto_447332 ?auto_447333 ?auto_447334 ?auto_447335 ?auto_447336 ?auto_447337 ?auto_447338 ?auto_447339 ?auto_447340 ?auto_447341 ?auto_447342 ?auto_447343 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_447385 - BLOCK
      ?auto_447386 - BLOCK
      ?auto_447387 - BLOCK
      ?auto_447388 - BLOCK
      ?auto_447389 - BLOCK
      ?auto_447390 - BLOCK
      ?auto_447391 - BLOCK
      ?auto_447392 - BLOCK
      ?auto_447393 - BLOCK
      ?auto_447394 - BLOCK
      ?auto_447395 - BLOCK
      ?auto_447396 - BLOCK
      ?auto_447397 - BLOCK
    )
    :vars
    (
      ?auto_447398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447397 ?auto_447398 ) ( ON-TABLE ?auto_447385 ) ( ON ?auto_447386 ?auto_447385 ) ( not ( = ?auto_447385 ?auto_447386 ) ) ( not ( = ?auto_447385 ?auto_447387 ) ) ( not ( = ?auto_447385 ?auto_447388 ) ) ( not ( = ?auto_447385 ?auto_447389 ) ) ( not ( = ?auto_447385 ?auto_447390 ) ) ( not ( = ?auto_447385 ?auto_447391 ) ) ( not ( = ?auto_447385 ?auto_447392 ) ) ( not ( = ?auto_447385 ?auto_447393 ) ) ( not ( = ?auto_447385 ?auto_447394 ) ) ( not ( = ?auto_447385 ?auto_447395 ) ) ( not ( = ?auto_447385 ?auto_447396 ) ) ( not ( = ?auto_447385 ?auto_447397 ) ) ( not ( = ?auto_447385 ?auto_447398 ) ) ( not ( = ?auto_447386 ?auto_447387 ) ) ( not ( = ?auto_447386 ?auto_447388 ) ) ( not ( = ?auto_447386 ?auto_447389 ) ) ( not ( = ?auto_447386 ?auto_447390 ) ) ( not ( = ?auto_447386 ?auto_447391 ) ) ( not ( = ?auto_447386 ?auto_447392 ) ) ( not ( = ?auto_447386 ?auto_447393 ) ) ( not ( = ?auto_447386 ?auto_447394 ) ) ( not ( = ?auto_447386 ?auto_447395 ) ) ( not ( = ?auto_447386 ?auto_447396 ) ) ( not ( = ?auto_447386 ?auto_447397 ) ) ( not ( = ?auto_447386 ?auto_447398 ) ) ( not ( = ?auto_447387 ?auto_447388 ) ) ( not ( = ?auto_447387 ?auto_447389 ) ) ( not ( = ?auto_447387 ?auto_447390 ) ) ( not ( = ?auto_447387 ?auto_447391 ) ) ( not ( = ?auto_447387 ?auto_447392 ) ) ( not ( = ?auto_447387 ?auto_447393 ) ) ( not ( = ?auto_447387 ?auto_447394 ) ) ( not ( = ?auto_447387 ?auto_447395 ) ) ( not ( = ?auto_447387 ?auto_447396 ) ) ( not ( = ?auto_447387 ?auto_447397 ) ) ( not ( = ?auto_447387 ?auto_447398 ) ) ( not ( = ?auto_447388 ?auto_447389 ) ) ( not ( = ?auto_447388 ?auto_447390 ) ) ( not ( = ?auto_447388 ?auto_447391 ) ) ( not ( = ?auto_447388 ?auto_447392 ) ) ( not ( = ?auto_447388 ?auto_447393 ) ) ( not ( = ?auto_447388 ?auto_447394 ) ) ( not ( = ?auto_447388 ?auto_447395 ) ) ( not ( = ?auto_447388 ?auto_447396 ) ) ( not ( = ?auto_447388 ?auto_447397 ) ) ( not ( = ?auto_447388 ?auto_447398 ) ) ( not ( = ?auto_447389 ?auto_447390 ) ) ( not ( = ?auto_447389 ?auto_447391 ) ) ( not ( = ?auto_447389 ?auto_447392 ) ) ( not ( = ?auto_447389 ?auto_447393 ) ) ( not ( = ?auto_447389 ?auto_447394 ) ) ( not ( = ?auto_447389 ?auto_447395 ) ) ( not ( = ?auto_447389 ?auto_447396 ) ) ( not ( = ?auto_447389 ?auto_447397 ) ) ( not ( = ?auto_447389 ?auto_447398 ) ) ( not ( = ?auto_447390 ?auto_447391 ) ) ( not ( = ?auto_447390 ?auto_447392 ) ) ( not ( = ?auto_447390 ?auto_447393 ) ) ( not ( = ?auto_447390 ?auto_447394 ) ) ( not ( = ?auto_447390 ?auto_447395 ) ) ( not ( = ?auto_447390 ?auto_447396 ) ) ( not ( = ?auto_447390 ?auto_447397 ) ) ( not ( = ?auto_447390 ?auto_447398 ) ) ( not ( = ?auto_447391 ?auto_447392 ) ) ( not ( = ?auto_447391 ?auto_447393 ) ) ( not ( = ?auto_447391 ?auto_447394 ) ) ( not ( = ?auto_447391 ?auto_447395 ) ) ( not ( = ?auto_447391 ?auto_447396 ) ) ( not ( = ?auto_447391 ?auto_447397 ) ) ( not ( = ?auto_447391 ?auto_447398 ) ) ( not ( = ?auto_447392 ?auto_447393 ) ) ( not ( = ?auto_447392 ?auto_447394 ) ) ( not ( = ?auto_447392 ?auto_447395 ) ) ( not ( = ?auto_447392 ?auto_447396 ) ) ( not ( = ?auto_447392 ?auto_447397 ) ) ( not ( = ?auto_447392 ?auto_447398 ) ) ( not ( = ?auto_447393 ?auto_447394 ) ) ( not ( = ?auto_447393 ?auto_447395 ) ) ( not ( = ?auto_447393 ?auto_447396 ) ) ( not ( = ?auto_447393 ?auto_447397 ) ) ( not ( = ?auto_447393 ?auto_447398 ) ) ( not ( = ?auto_447394 ?auto_447395 ) ) ( not ( = ?auto_447394 ?auto_447396 ) ) ( not ( = ?auto_447394 ?auto_447397 ) ) ( not ( = ?auto_447394 ?auto_447398 ) ) ( not ( = ?auto_447395 ?auto_447396 ) ) ( not ( = ?auto_447395 ?auto_447397 ) ) ( not ( = ?auto_447395 ?auto_447398 ) ) ( not ( = ?auto_447396 ?auto_447397 ) ) ( not ( = ?auto_447396 ?auto_447398 ) ) ( not ( = ?auto_447397 ?auto_447398 ) ) ( ON ?auto_447396 ?auto_447397 ) ( ON ?auto_447395 ?auto_447396 ) ( ON ?auto_447394 ?auto_447395 ) ( ON ?auto_447393 ?auto_447394 ) ( ON ?auto_447392 ?auto_447393 ) ( ON ?auto_447391 ?auto_447392 ) ( ON ?auto_447390 ?auto_447391 ) ( ON ?auto_447389 ?auto_447390 ) ( ON ?auto_447388 ?auto_447389 ) ( CLEAR ?auto_447386 ) ( ON ?auto_447387 ?auto_447388 ) ( CLEAR ?auto_447387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_447385 ?auto_447386 ?auto_447387 )
      ( MAKE-13PILE ?auto_447385 ?auto_447386 ?auto_447387 ?auto_447388 ?auto_447389 ?auto_447390 ?auto_447391 ?auto_447392 ?auto_447393 ?auto_447394 ?auto_447395 ?auto_447396 ?auto_447397 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_447439 - BLOCK
      ?auto_447440 - BLOCK
      ?auto_447441 - BLOCK
      ?auto_447442 - BLOCK
      ?auto_447443 - BLOCK
      ?auto_447444 - BLOCK
      ?auto_447445 - BLOCK
      ?auto_447446 - BLOCK
      ?auto_447447 - BLOCK
      ?auto_447448 - BLOCK
      ?auto_447449 - BLOCK
      ?auto_447450 - BLOCK
      ?auto_447451 - BLOCK
    )
    :vars
    (
      ?auto_447452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447451 ?auto_447452 ) ( ON-TABLE ?auto_447439 ) ( not ( = ?auto_447439 ?auto_447440 ) ) ( not ( = ?auto_447439 ?auto_447441 ) ) ( not ( = ?auto_447439 ?auto_447442 ) ) ( not ( = ?auto_447439 ?auto_447443 ) ) ( not ( = ?auto_447439 ?auto_447444 ) ) ( not ( = ?auto_447439 ?auto_447445 ) ) ( not ( = ?auto_447439 ?auto_447446 ) ) ( not ( = ?auto_447439 ?auto_447447 ) ) ( not ( = ?auto_447439 ?auto_447448 ) ) ( not ( = ?auto_447439 ?auto_447449 ) ) ( not ( = ?auto_447439 ?auto_447450 ) ) ( not ( = ?auto_447439 ?auto_447451 ) ) ( not ( = ?auto_447439 ?auto_447452 ) ) ( not ( = ?auto_447440 ?auto_447441 ) ) ( not ( = ?auto_447440 ?auto_447442 ) ) ( not ( = ?auto_447440 ?auto_447443 ) ) ( not ( = ?auto_447440 ?auto_447444 ) ) ( not ( = ?auto_447440 ?auto_447445 ) ) ( not ( = ?auto_447440 ?auto_447446 ) ) ( not ( = ?auto_447440 ?auto_447447 ) ) ( not ( = ?auto_447440 ?auto_447448 ) ) ( not ( = ?auto_447440 ?auto_447449 ) ) ( not ( = ?auto_447440 ?auto_447450 ) ) ( not ( = ?auto_447440 ?auto_447451 ) ) ( not ( = ?auto_447440 ?auto_447452 ) ) ( not ( = ?auto_447441 ?auto_447442 ) ) ( not ( = ?auto_447441 ?auto_447443 ) ) ( not ( = ?auto_447441 ?auto_447444 ) ) ( not ( = ?auto_447441 ?auto_447445 ) ) ( not ( = ?auto_447441 ?auto_447446 ) ) ( not ( = ?auto_447441 ?auto_447447 ) ) ( not ( = ?auto_447441 ?auto_447448 ) ) ( not ( = ?auto_447441 ?auto_447449 ) ) ( not ( = ?auto_447441 ?auto_447450 ) ) ( not ( = ?auto_447441 ?auto_447451 ) ) ( not ( = ?auto_447441 ?auto_447452 ) ) ( not ( = ?auto_447442 ?auto_447443 ) ) ( not ( = ?auto_447442 ?auto_447444 ) ) ( not ( = ?auto_447442 ?auto_447445 ) ) ( not ( = ?auto_447442 ?auto_447446 ) ) ( not ( = ?auto_447442 ?auto_447447 ) ) ( not ( = ?auto_447442 ?auto_447448 ) ) ( not ( = ?auto_447442 ?auto_447449 ) ) ( not ( = ?auto_447442 ?auto_447450 ) ) ( not ( = ?auto_447442 ?auto_447451 ) ) ( not ( = ?auto_447442 ?auto_447452 ) ) ( not ( = ?auto_447443 ?auto_447444 ) ) ( not ( = ?auto_447443 ?auto_447445 ) ) ( not ( = ?auto_447443 ?auto_447446 ) ) ( not ( = ?auto_447443 ?auto_447447 ) ) ( not ( = ?auto_447443 ?auto_447448 ) ) ( not ( = ?auto_447443 ?auto_447449 ) ) ( not ( = ?auto_447443 ?auto_447450 ) ) ( not ( = ?auto_447443 ?auto_447451 ) ) ( not ( = ?auto_447443 ?auto_447452 ) ) ( not ( = ?auto_447444 ?auto_447445 ) ) ( not ( = ?auto_447444 ?auto_447446 ) ) ( not ( = ?auto_447444 ?auto_447447 ) ) ( not ( = ?auto_447444 ?auto_447448 ) ) ( not ( = ?auto_447444 ?auto_447449 ) ) ( not ( = ?auto_447444 ?auto_447450 ) ) ( not ( = ?auto_447444 ?auto_447451 ) ) ( not ( = ?auto_447444 ?auto_447452 ) ) ( not ( = ?auto_447445 ?auto_447446 ) ) ( not ( = ?auto_447445 ?auto_447447 ) ) ( not ( = ?auto_447445 ?auto_447448 ) ) ( not ( = ?auto_447445 ?auto_447449 ) ) ( not ( = ?auto_447445 ?auto_447450 ) ) ( not ( = ?auto_447445 ?auto_447451 ) ) ( not ( = ?auto_447445 ?auto_447452 ) ) ( not ( = ?auto_447446 ?auto_447447 ) ) ( not ( = ?auto_447446 ?auto_447448 ) ) ( not ( = ?auto_447446 ?auto_447449 ) ) ( not ( = ?auto_447446 ?auto_447450 ) ) ( not ( = ?auto_447446 ?auto_447451 ) ) ( not ( = ?auto_447446 ?auto_447452 ) ) ( not ( = ?auto_447447 ?auto_447448 ) ) ( not ( = ?auto_447447 ?auto_447449 ) ) ( not ( = ?auto_447447 ?auto_447450 ) ) ( not ( = ?auto_447447 ?auto_447451 ) ) ( not ( = ?auto_447447 ?auto_447452 ) ) ( not ( = ?auto_447448 ?auto_447449 ) ) ( not ( = ?auto_447448 ?auto_447450 ) ) ( not ( = ?auto_447448 ?auto_447451 ) ) ( not ( = ?auto_447448 ?auto_447452 ) ) ( not ( = ?auto_447449 ?auto_447450 ) ) ( not ( = ?auto_447449 ?auto_447451 ) ) ( not ( = ?auto_447449 ?auto_447452 ) ) ( not ( = ?auto_447450 ?auto_447451 ) ) ( not ( = ?auto_447450 ?auto_447452 ) ) ( not ( = ?auto_447451 ?auto_447452 ) ) ( ON ?auto_447450 ?auto_447451 ) ( ON ?auto_447449 ?auto_447450 ) ( ON ?auto_447448 ?auto_447449 ) ( ON ?auto_447447 ?auto_447448 ) ( ON ?auto_447446 ?auto_447447 ) ( ON ?auto_447445 ?auto_447446 ) ( ON ?auto_447444 ?auto_447445 ) ( ON ?auto_447443 ?auto_447444 ) ( ON ?auto_447442 ?auto_447443 ) ( ON ?auto_447441 ?auto_447442 ) ( CLEAR ?auto_447439 ) ( ON ?auto_447440 ?auto_447441 ) ( CLEAR ?auto_447440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_447439 ?auto_447440 )
      ( MAKE-13PILE ?auto_447439 ?auto_447440 ?auto_447441 ?auto_447442 ?auto_447443 ?auto_447444 ?auto_447445 ?auto_447446 ?auto_447447 ?auto_447448 ?auto_447449 ?auto_447450 ?auto_447451 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_447493 - BLOCK
      ?auto_447494 - BLOCK
      ?auto_447495 - BLOCK
      ?auto_447496 - BLOCK
      ?auto_447497 - BLOCK
      ?auto_447498 - BLOCK
      ?auto_447499 - BLOCK
      ?auto_447500 - BLOCK
      ?auto_447501 - BLOCK
      ?auto_447502 - BLOCK
      ?auto_447503 - BLOCK
      ?auto_447504 - BLOCK
      ?auto_447505 - BLOCK
    )
    :vars
    (
      ?auto_447506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447505 ?auto_447506 ) ( not ( = ?auto_447493 ?auto_447494 ) ) ( not ( = ?auto_447493 ?auto_447495 ) ) ( not ( = ?auto_447493 ?auto_447496 ) ) ( not ( = ?auto_447493 ?auto_447497 ) ) ( not ( = ?auto_447493 ?auto_447498 ) ) ( not ( = ?auto_447493 ?auto_447499 ) ) ( not ( = ?auto_447493 ?auto_447500 ) ) ( not ( = ?auto_447493 ?auto_447501 ) ) ( not ( = ?auto_447493 ?auto_447502 ) ) ( not ( = ?auto_447493 ?auto_447503 ) ) ( not ( = ?auto_447493 ?auto_447504 ) ) ( not ( = ?auto_447493 ?auto_447505 ) ) ( not ( = ?auto_447493 ?auto_447506 ) ) ( not ( = ?auto_447494 ?auto_447495 ) ) ( not ( = ?auto_447494 ?auto_447496 ) ) ( not ( = ?auto_447494 ?auto_447497 ) ) ( not ( = ?auto_447494 ?auto_447498 ) ) ( not ( = ?auto_447494 ?auto_447499 ) ) ( not ( = ?auto_447494 ?auto_447500 ) ) ( not ( = ?auto_447494 ?auto_447501 ) ) ( not ( = ?auto_447494 ?auto_447502 ) ) ( not ( = ?auto_447494 ?auto_447503 ) ) ( not ( = ?auto_447494 ?auto_447504 ) ) ( not ( = ?auto_447494 ?auto_447505 ) ) ( not ( = ?auto_447494 ?auto_447506 ) ) ( not ( = ?auto_447495 ?auto_447496 ) ) ( not ( = ?auto_447495 ?auto_447497 ) ) ( not ( = ?auto_447495 ?auto_447498 ) ) ( not ( = ?auto_447495 ?auto_447499 ) ) ( not ( = ?auto_447495 ?auto_447500 ) ) ( not ( = ?auto_447495 ?auto_447501 ) ) ( not ( = ?auto_447495 ?auto_447502 ) ) ( not ( = ?auto_447495 ?auto_447503 ) ) ( not ( = ?auto_447495 ?auto_447504 ) ) ( not ( = ?auto_447495 ?auto_447505 ) ) ( not ( = ?auto_447495 ?auto_447506 ) ) ( not ( = ?auto_447496 ?auto_447497 ) ) ( not ( = ?auto_447496 ?auto_447498 ) ) ( not ( = ?auto_447496 ?auto_447499 ) ) ( not ( = ?auto_447496 ?auto_447500 ) ) ( not ( = ?auto_447496 ?auto_447501 ) ) ( not ( = ?auto_447496 ?auto_447502 ) ) ( not ( = ?auto_447496 ?auto_447503 ) ) ( not ( = ?auto_447496 ?auto_447504 ) ) ( not ( = ?auto_447496 ?auto_447505 ) ) ( not ( = ?auto_447496 ?auto_447506 ) ) ( not ( = ?auto_447497 ?auto_447498 ) ) ( not ( = ?auto_447497 ?auto_447499 ) ) ( not ( = ?auto_447497 ?auto_447500 ) ) ( not ( = ?auto_447497 ?auto_447501 ) ) ( not ( = ?auto_447497 ?auto_447502 ) ) ( not ( = ?auto_447497 ?auto_447503 ) ) ( not ( = ?auto_447497 ?auto_447504 ) ) ( not ( = ?auto_447497 ?auto_447505 ) ) ( not ( = ?auto_447497 ?auto_447506 ) ) ( not ( = ?auto_447498 ?auto_447499 ) ) ( not ( = ?auto_447498 ?auto_447500 ) ) ( not ( = ?auto_447498 ?auto_447501 ) ) ( not ( = ?auto_447498 ?auto_447502 ) ) ( not ( = ?auto_447498 ?auto_447503 ) ) ( not ( = ?auto_447498 ?auto_447504 ) ) ( not ( = ?auto_447498 ?auto_447505 ) ) ( not ( = ?auto_447498 ?auto_447506 ) ) ( not ( = ?auto_447499 ?auto_447500 ) ) ( not ( = ?auto_447499 ?auto_447501 ) ) ( not ( = ?auto_447499 ?auto_447502 ) ) ( not ( = ?auto_447499 ?auto_447503 ) ) ( not ( = ?auto_447499 ?auto_447504 ) ) ( not ( = ?auto_447499 ?auto_447505 ) ) ( not ( = ?auto_447499 ?auto_447506 ) ) ( not ( = ?auto_447500 ?auto_447501 ) ) ( not ( = ?auto_447500 ?auto_447502 ) ) ( not ( = ?auto_447500 ?auto_447503 ) ) ( not ( = ?auto_447500 ?auto_447504 ) ) ( not ( = ?auto_447500 ?auto_447505 ) ) ( not ( = ?auto_447500 ?auto_447506 ) ) ( not ( = ?auto_447501 ?auto_447502 ) ) ( not ( = ?auto_447501 ?auto_447503 ) ) ( not ( = ?auto_447501 ?auto_447504 ) ) ( not ( = ?auto_447501 ?auto_447505 ) ) ( not ( = ?auto_447501 ?auto_447506 ) ) ( not ( = ?auto_447502 ?auto_447503 ) ) ( not ( = ?auto_447502 ?auto_447504 ) ) ( not ( = ?auto_447502 ?auto_447505 ) ) ( not ( = ?auto_447502 ?auto_447506 ) ) ( not ( = ?auto_447503 ?auto_447504 ) ) ( not ( = ?auto_447503 ?auto_447505 ) ) ( not ( = ?auto_447503 ?auto_447506 ) ) ( not ( = ?auto_447504 ?auto_447505 ) ) ( not ( = ?auto_447504 ?auto_447506 ) ) ( not ( = ?auto_447505 ?auto_447506 ) ) ( ON ?auto_447504 ?auto_447505 ) ( ON ?auto_447503 ?auto_447504 ) ( ON ?auto_447502 ?auto_447503 ) ( ON ?auto_447501 ?auto_447502 ) ( ON ?auto_447500 ?auto_447501 ) ( ON ?auto_447499 ?auto_447500 ) ( ON ?auto_447498 ?auto_447499 ) ( ON ?auto_447497 ?auto_447498 ) ( ON ?auto_447496 ?auto_447497 ) ( ON ?auto_447495 ?auto_447496 ) ( ON ?auto_447494 ?auto_447495 ) ( ON ?auto_447493 ?auto_447494 ) ( CLEAR ?auto_447493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_447493 )
      ( MAKE-13PILE ?auto_447493 ?auto_447494 ?auto_447495 ?auto_447496 ?auto_447497 ?auto_447498 ?auto_447499 ?auto_447500 ?auto_447501 ?auto_447502 ?auto_447503 ?auto_447504 ?auto_447505 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_447548 - BLOCK
      ?auto_447549 - BLOCK
      ?auto_447550 - BLOCK
      ?auto_447551 - BLOCK
      ?auto_447552 - BLOCK
      ?auto_447553 - BLOCK
      ?auto_447554 - BLOCK
      ?auto_447555 - BLOCK
      ?auto_447556 - BLOCK
      ?auto_447557 - BLOCK
      ?auto_447558 - BLOCK
      ?auto_447559 - BLOCK
      ?auto_447560 - BLOCK
      ?auto_447561 - BLOCK
    )
    :vars
    (
      ?auto_447562 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_447560 ) ( ON ?auto_447561 ?auto_447562 ) ( CLEAR ?auto_447561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_447548 ) ( ON ?auto_447549 ?auto_447548 ) ( ON ?auto_447550 ?auto_447549 ) ( ON ?auto_447551 ?auto_447550 ) ( ON ?auto_447552 ?auto_447551 ) ( ON ?auto_447553 ?auto_447552 ) ( ON ?auto_447554 ?auto_447553 ) ( ON ?auto_447555 ?auto_447554 ) ( ON ?auto_447556 ?auto_447555 ) ( ON ?auto_447557 ?auto_447556 ) ( ON ?auto_447558 ?auto_447557 ) ( ON ?auto_447559 ?auto_447558 ) ( ON ?auto_447560 ?auto_447559 ) ( not ( = ?auto_447548 ?auto_447549 ) ) ( not ( = ?auto_447548 ?auto_447550 ) ) ( not ( = ?auto_447548 ?auto_447551 ) ) ( not ( = ?auto_447548 ?auto_447552 ) ) ( not ( = ?auto_447548 ?auto_447553 ) ) ( not ( = ?auto_447548 ?auto_447554 ) ) ( not ( = ?auto_447548 ?auto_447555 ) ) ( not ( = ?auto_447548 ?auto_447556 ) ) ( not ( = ?auto_447548 ?auto_447557 ) ) ( not ( = ?auto_447548 ?auto_447558 ) ) ( not ( = ?auto_447548 ?auto_447559 ) ) ( not ( = ?auto_447548 ?auto_447560 ) ) ( not ( = ?auto_447548 ?auto_447561 ) ) ( not ( = ?auto_447548 ?auto_447562 ) ) ( not ( = ?auto_447549 ?auto_447550 ) ) ( not ( = ?auto_447549 ?auto_447551 ) ) ( not ( = ?auto_447549 ?auto_447552 ) ) ( not ( = ?auto_447549 ?auto_447553 ) ) ( not ( = ?auto_447549 ?auto_447554 ) ) ( not ( = ?auto_447549 ?auto_447555 ) ) ( not ( = ?auto_447549 ?auto_447556 ) ) ( not ( = ?auto_447549 ?auto_447557 ) ) ( not ( = ?auto_447549 ?auto_447558 ) ) ( not ( = ?auto_447549 ?auto_447559 ) ) ( not ( = ?auto_447549 ?auto_447560 ) ) ( not ( = ?auto_447549 ?auto_447561 ) ) ( not ( = ?auto_447549 ?auto_447562 ) ) ( not ( = ?auto_447550 ?auto_447551 ) ) ( not ( = ?auto_447550 ?auto_447552 ) ) ( not ( = ?auto_447550 ?auto_447553 ) ) ( not ( = ?auto_447550 ?auto_447554 ) ) ( not ( = ?auto_447550 ?auto_447555 ) ) ( not ( = ?auto_447550 ?auto_447556 ) ) ( not ( = ?auto_447550 ?auto_447557 ) ) ( not ( = ?auto_447550 ?auto_447558 ) ) ( not ( = ?auto_447550 ?auto_447559 ) ) ( not ( = ?auto_447550 ?auto_447560 ) ) ( not ( = ?auto_447550 ?auto_447561 ) ) ( not ( = ?auto_447550 ?auto_447562 ) ) ( not ( = ?auto_447551 ?auto_447552 ) ) ( not ( = ?auto_447551 ?auto_447553 ) ) ( not ( = ?auto_447551 ?auto_447554 ) ) ( not ( = ?auto_447551 ?auto_447555 ) ) ( not ( = ?auto_447551 ?auto_447556 ) ) ( not ( = ?auto_447551 ?auto_447557 ) ) ( not ( = ?auto_447551 ?auto_447558 ) ) ( not ( = ?auto_447551 ?auto_447559 ) ) ( not ( = ?auto_447551 ?auto_447560 ) ) ( not ( = ?auto_447551 ?auto_447561 ) ) ( not ( = ?auto_447551 ?auto_447562 ) ) ( not ( = ?auto_447552 ?auto_447553 ) ) ( not ( = ?auto_447552 ?auto_447554 ) ) ( not ( = ?auto_447552 ?auto_447555 ) ) ( not ( = ?auto_447552 ?auto_447556 ) ) ( not ( = ?auto_447552 ?auto_447557 ) ) ( not ( = ?auto_447552 ?auto_447558 ) ) ( not ( = ?auto_447552 ?auto_447559 ) ) ( not ( = ?auto_447552 ?auto_447560 ) ) ( not ( = ?auto_447552 ?auto_447561 ) ) ( not ( = ?auto_447552 ?auto_447562 ) ) ( not ( = ?auto_447553 ?auto_447554 ) ) ( not ( = ?auto_447553 ?auto_447555 ) ) ( not ( = ?auto_447553 ?auto_447556 ) ) ( not ( = ?auto_447553 ?auto_447557 ) ) ( not ( = ?auto_447553 ?auto_447558 ) ) ( not ( = ?auto_447553 ?auto_447559 ) ) ( not ( = ?auto_447553 ?auto_447560 ) ) ( not ( = ?auto_447553 ?auto_447561 ) ) ( not ( = ?auto_447553 ?auto_447562 ) ) ( not ( = ?auto_447554 ?auto_447555 ) ) ( not ( = ?auto_447554 ?auto_447556 ) ) ( not ( = ?auto_447554 ?auto_447557 ) ) ( not ( = ?auto_447554 ?auto_447558 ) ) ( not ( = ?auto_447554 ?auto_447559 ) ) ( not ( = ?auto_447554 ?auto_447560 ) ) ( not ( = ?auto_447554 ?auto_447561 ) ) ( not ( = ?auto_447554 ?auto_447562 ) ) ( not ( = ?auto_447555 ?auto_447556 ) ) ( not ( = ?auto_447555 ?auto_447557 ) ) ( not ( = ?auto_447555 ?auto_447558 ) ) ( not ( = ?auto_447555 ?auto_447559 ) ) ( not ( = ?auto_447555 ?auto_447560 ) ) ( not ( = ?auto_447555 ?auto_447561 ) ) ( not ( = ?auto_447555 ?auto_447562 ) ) ( not ( = ?auto_447556 ?auto_447557 ) ) ( not ( = ?auto_447556 ?auto_447558 ) ) ( not ( = ?auto_447556 ?auto_447559 ) ) ( not ( = ?auto_447556 ?auto_447560 ) ) ( not ( = ?auto_447556 ?auto_447561 ) ) ( not ( = ?auto_447556 ?auto_447562 ) ) ( not ( = ?auto_447557 ?auto_447558 ) ) ( not ( = ?auto_447557 ?auto_447559 ) ) ( not ( = ?auto_447557 ?auto_447560 ) ) ( not ( = ?auto_447557 ?auto_447561 ) ) ( not ( = ?auto_447557 ?auto_447562 ) ) ( not ( = ?auto_447558 ?auto_447559 ) ) ( not ( = ?auto_447558 ?auto_447560 ) ) ( not ( = ?auto_447558 ?auto_447561 ) ) ( not ( = ?auto_447558 ?auto_447562 ) ) ( not ( = ?auto_447559 ?auto_447560 ) ) ( not ( = ?auto_447559 ?auto_447561 ) ) ( not ( = ?auto_447559 ?auto_447562 ) ) ( not ( = ?auto_447560 ?auto_447561 ) ) ( not ( = ?auto_447560 ?auto_447562 ) ) ( not ( = ?auto_447561 ?auto_447562 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_447561 ?auto_447562 )
      ( !STACK ?auto_447561 ?auto_447560 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_447606 - BLOCK
      ?auto_447607 - BLOCK
      ?auto_447608 - BLOCK
      ?auto_447609 - BLOCK
      ?auto_447610 - BLOCK
      ?auto_447611 - BLOCK
      ?auto_447612 - BLOCK
      ?auto_447613 - BLOCK
      ?auto_447614 - BLOCK
      ?auto_447615 - BLOCK
      ?auto_447616 - BLOCK
      ?auto_447617 - BLOCK
      ?auto_447618 - BLOCK
      ?auto_447619 - BLOCK
    )
    :vars
    (
      ?auto_447620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447619 ?auto_447620 ) ( ON-TABLE ?auto_447606 ) ( ON ?auto_447607 ?auto_447606 ) ( ON ?auto_447608 ?auto_447607 ) ( ON ?auto_447609 ?auto_447608 ) ( ON ?auto_447610 ?auto_447609 ) ( ON ?auto_447611 ?auto_447610 ) ( ON ?auto_447612 ?auto_447611 ) ( ON ?auto_447613 ?auto_447612 ) ( ON ?auto_447614 ?auto_447613 ) ( ON ?auto_447615 ?auto_447614 ) ( ON ?auto_447616 ?auto_447615 ) ( ON ?auto_447617 ?auto_447616 ) ( not ( = ?auto_447606 ?auto_447607 ) ) ( not ( = ?auto_447606 ?auto_447608 ) ) ( not ( = ?auto_447606 ?auto_447609 ) ) ( not ( = ?auto_447606 ?auto_447610 ) ) ( not ( = ?auto_447606 ?auto_447611 ) ) ( not ( = ?auto_447606 ?auto_447612 ) ) ( not ( = ?auto_447606 ?auto_447613 ) ) ( not ( = ?auto_447606 ?auto_447614 ) ) ( not ( = ?auto_447606 ?auto_447615 ) ) ( not ( = ?auto_447606 ?auto_447616 ) ) ( not ( = ?auto_447606 ?auto_447617 ) ) ( not ( = ?auto_447606 ?auto_447618 ) ) ( not ( = ?auto_447606 ?auto_447619 ) ) ( not ( = ?auto_447606 ?auto_447620 ) ) ( not ( = ?auto_447607 ?auto_447608 ) ) ( not ( = ?auto_447607 ?auto_447609 ) ) ( not ( = ?auto_447607 ?auto_447610 ) ) ( not ( = ?auto_447607 ?auto_447611 ) ) ( not ( = ?auto_447607 ?auto_447612 ) ) ( not ( = ?auto_447607 ?auto_447613 ) ) ( not ( = ?auto_447607 ?auto_447614 ) ) ( not ( = ?auto_447607 ?auto_447615 ) ) ( not ( = ?auto_447607 ?auto_447616 ) ) ( not ( = ?auto_447607 ?auto_447617 ) ) ( not ( = ?auto_447607 ?auto_447618 ) ) ( not ( = ?auto_447607 ?auto_447619 ) ) ( not ( = ?auto_447607 ?auto_447620 ) ) ( not ( = ?auto_447608 ?auto_447609 ) ) ( not ( = ?auto_447608 ?auto_447610 ) ) ( not ( = ?auto_447608 ?auto_447611 ) ) ( not ( = ?auto_447608 ?auto_447612 ) ) ( not ( = ?auto_447608 ?auto_447613 ) ) ( not ( = ?auto_447608 ?auto_447614 ) ) ( not ( = ?auto_447608 ?auto_447615 ) ) ( not ( = ?auto_447608 ?auto_447616 ) ) ( not ( = ?auto_447608 ?auto_447617 ) ) ( not ( = ?auto_447608 ?auto_447618 ) ) ( not ( = ?auto_447608 ?auto_447619 ) ) ( not ( = ?auto_447608 ?auto_447620 ) ) ( not ( = ?auto_447609 ?auto_447610 ) ) ( not ( = ?auto_447609 ?auto_447611 ) ) ( not ( = ?auto_447609 ?auto_447612 ) ) ( not ( = ?auto_447609 ?auto_447613 ) ) ( not ( = ?auto_447609 ?auto_447614 ) ) ( not ( = ?auto_447609 ?auto_447615 ) ) ( not ( = ?auto_447609 ?auto_447616 ) ) ( not ( = ?auto_447609 ?auto_447617 ) ) ( not ( = ?auto_447609 ?auto_447618 ) ) ( not ( = ?auto_447609 ?auto_447619 ) ) ( not ( = ?auto_447609 ?auto_447620 ) ) ( not ( = ?auto_447610 ?auto_447611 ) ) ( not ( = ?auto_447610 ?auto_447612 ) ) ( not ( = ?auto_447610 ?auto_447613 ) ) ( not ( = ?auto_447610 ?auto_447614 ) ) ( not ( = ?auto_447610 ?auto_447615 ) ) ( not ( = ?auto_447610 ?auto_447616 ) ) ( not ( = ?auto_447610 ?auto_447617 ) ) ( not ( = ?auto_447610 ?auto_447618 ) ) ( not ( = ?auto_447610 ?auto_447619 ) ) ( not ( = ?auto_447610 ?auto_447620 ) ) ( not ( = ?auto_447611 ?auto_447612 ) ) ( not ( = ?auto_447611 ?auto_447613 ) ) ( not ( = ?auto_447611 ?auto_447614 ) ) ( not ( = ?auto_447611 ?auto_447615 ) ) ( not ( = ?auto_447611 ?auto_447616 ) ) ( not ( = ?auto_447611 ?auto_447617 ) ) ( not ( = ?auto_447611 ?auto_447618 ) ) ( not ( = ?auto_447611 ?auto_447619 ) ) ( not ( = ?auto_447611 ?auto_447620 ) ) ( not ( = ?auto_447612 ?auto_447613 ) ) ( not ( = ?auto_447612 ?auto_447614 ) ) ( not ( = ?auto_447612 ?auto_447615 ) ) ( not ( = ?auto_447612 ?auto_447616 ) ) ( not ( = ?auto_447612 ?auto_447617 ) ) ( not ( = ?auto_447612 ?auto_447618 ) ) ( not ( = ?auto_447612 ?auto_447619 ) ) ( not ( = ?auto_447612 ?auto_447620 ) ) ( not ( = ?auto_447613 ?auto_447614 ) ) ( not ( = ?auto_447613 ?auto_447615 ) ) ( not ( = ?auto_447613 ?auto_447616 ) ) ( not ( = ?auto_447613 ?auto_447617 ) ) ( not ( = ?auto_447613 ?auto_447618 ) ) ( not ( = ?auto_447613 ?auto_447619 ) ) ( not ( = ?auto_447613 ?auto_447620 ) ) ( not ( = ?auto_447614 ?auto_447615 ) ) ( not ( = ?auto_447614 ?auto_447616 ) ) ( not ( = ?auto_447614 ?auto_447617 ) ) ( not ( = ?auto_447614 ?auto_447618 ) ) ( not ( = ?auto_447614 ?auto_447619 ) ) ( not ( = ?auto_447614 ?auto_447620 ) ) ( not ( = ?auto_447615 ?auto_447616 ) ) ( not ( = ?auto_447615 ?auto_447617 ) ) ( not ( = ?auto_447615 ?auto_447618 ) ) ( not ( = ?auto_447615 ?auto_447619 ) ) ( not ( = ?auto_447615 ?auto_447620 ) ) ( not ( = ?auto_447616 ?auto_447617 ) ) ( not ( = ?auto_447616 ?auto_447618 ) ) ( not ( = ?auto_447616 ?auto_447619 ) ) ( not ( = ?auto_447616 ?auto_447620 ) ) ( not ( = ?auto_447617 ?auto_447618 ) ) ( not ( = ?auto_447617 ?auto_447619 ) ) ( not ( = ?auto_447617 ?auto_447620 ) ) ( not ( = ?auto_447618 ?auto_447619 ) ) ( not ( = ?auto_447618 ?auto_447620 ) ) ( not ( = ?auto_447619 ?auto_447620 ) ) ( CLEAR ?auto_447617 ) ( ON ?auto_447618 ?auto_447619 ) ( CLEAR ?auto_447618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_447606 ?auto_447607 ?auto_447608 ?auto_447609 ?auto_447610 ?auto_447611 ?auto_447612 ?auto_447613 ?auto_447614 ?auto_447615 ?auto_447616 ?auto_447617 ?auto_447618 )
      ( MAKE-14PILE ?auto_447606 ?auto_447607 ?auto_447608 ?auto_447609 ?auto_447610 ?auto_447611 ?auto_447612 ?auto_447613 ?auto_447614 ?auto_447615 ?auto_447616 ?auto_447617 ?auto_447618 ?auto_447619 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_447664 - BLOCK
      ?auto_447665 - BLOCK
      ?auto_447666 - BLOCK
      ?auto_447667 - BLOCK
      ?auto_447668 - BLOCK
      ?auto_447669 - BLOCK
      ?auto_447670 - BLOCK
      ?auto_447671 - BLOCK
      ?auto_447672 - BLOCK
      ?auto_447673 - BLOCK
      ?auto_447674 - BLOCK
      ?auto_447675 - BLOCK
      ?auto_447676 - BLOCK
      ?auto_447677 - BLOCK
    )
    :vars
    (
      ?auto_447678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447677 ?auto_447678 ) ( ON-TABLE ?auto_447664 ) ( ON ?auto_447665 ?auto_447664 ) ( ON ?auto_447666 ?auto_447665 ) ( ON ?auto_447667 ?auto_447666 ) ( ON ?auto_447668 ?auto_447667 ) ( ON ?auto_447669 ?auto_447668 ) ( ON ?auto_447670 ?auto_447669 ) ( ON ?auto_447671 ?auto_447670 ) ( ON ?auto_447672 ?auto_447671 ) ( ON ?auto_447673 ?auto_447672 ) ( ON ?auto_447674 ?auto_447673 ) ( not ( = ?auto_447664 ?auto_447665 ) ) ( not ( = ?auto_447664 ?auto_447666 ) ) ( not ( = ?auto_447664 ?auto_447667 ) ) ( not ( = ?auto_447664 ?auto_447668 ) ) ( not ( = ?auto_447664 ?auto_447669 ) ) ( not ( = ?auto_447664 ?auto_447670 ) ) ( not ( = ?auto_447664 ?auto_447671 ) ) ( not ( = ?auto_447664 ?auto_447672 ) ) ( not ( = ?auto_447664 ?auto_447673 ) ) ( not ( = ?auto_447664 ?auto_447674 ) ) ( not ( = ?auto_447664 ?auto_447675 ) ) ( not ( = ?auto_447664 ?auto_447676 ) ) ( not ( = ?auto_447664 ?auto_447677 ) ) ( not ( = ?auto_447664 ?auto_447678 ) ) ( not ( = ?auto_447665 ?auto_447666 ) ) ( not ( = ?auto_447665 ?auto_447667 ) ) ( not ( = ?auto_447665 ?auto_447668 ) ) ( not ( = ?auto_447665 ?auto_447669 ) ) ( not ( = ?auto_447665 ?auto_447670 ) ) ( not ( = ?auto_447665 ?auto_447671 ) ) ( not ( = ?auto_447665 ?auto_447672 ) ) ( not ( = ?auto_447665 ?auto_447673 ) ) ( not ( = ?auto_447665 ?auto_447674 ) ) ( not ( = ?auto_447665 ?auto_447675 ) ) ( not ( = ?auto_447665 ?auto_447676 ) ) ( not ( = ?auto_447665 ?auto_447677 ) ) ( not ( = ?auto_447665 ?auto_447678 ) ) ( not ( = ?auto_447666 ?auto_447667 ) ) ( not ( = ?auto_447666 ?auto_447668 ) ) ( not ( = ?auto_447666 ?auto_447669 ) ) ( not ( = ?auto_447666 ?auto_447670 ) ) ( not ( = ?auto_447666 ?auto_447671 ) ) ( not ( = ?auto_447666 ?auto_447672 ) ) ( not ( = ?auto_447666 ?auto_447673 ) ) ( not ( = ?auto_447666 ?auto_447674 ) ) ( not ( = ?auto_447666 ?auto_447675 ) ) ( not ( = ?auto_447666 ?auto_447676 ) ) ( not ( = ?auto_447666 ?auto_447677 ) ) ( not ( = ?auto_447666 ?auto_447678 ) ) ( not ( = ?auto_447667 ?auto_447668 ) ) ( not ( = ?auto_447667 ?auto_447669 ) ) ( not ( = ?auto_447667 ?auto_447670 ) ) ( not ( = ?auto_447667 ?auto_447671 ) ) ( not ( = ?auto_447667 ?auto_447672 ) ) ( not ( = ?auto_447667 ?auto_447673 ) ) ( not ( = ?auto_447667 ?auto_447674 ) ) ( not ( = ?auto_447667 ?auto_447675 ) ) ( not ( = ?auto_447667 ?auto_447676 ) ) ( not ( = ?auto_447667 ?auto_447677 ) ) ( not ( = ?auto_447667 ?auto_447678 ) ) ( not ( = ?auto_447668 ?auto_447669 ) ) ( not ( = ?auto_447668 ?auto_447670 ) ) ( not ( = ?auto_447668 ?auto_447671 ) ) ( not ( = ?auto_447668 ?auto_447672 ) ) ( not ( = ?auto_447668 ?auto_447673 ) ) ( not ( = ?auto_447668 ?auto_447674 ) ) ( not ( = ?auto_447668 ?auto_447675 ) ) ( not ( = ?auto_447668 ?auto_447676 ) ) ( not ( = ?auto_447668 ?auto_447677 ) ) ( not ( = ?auto_447668 ?auto_447678 ) ) ( not ( = ?auto_447669 ?auto_447670 ) ) ( not ( = ?auto_447669 ?auto_447671 ) ) ( not ( = ?auto_447669 ?auto_447672 ) ) ( not ( = ?auto_447669 ?auto_447673 ) ) ( not ( = ?auto_447669 ?auto_447674 ) ) ( not ( = ?auto_447669 ?auto_447675 ) ) ( not ( = ?auto_447669 ?auto_447676 ) ) ( not ( = ?auto_447669 ?auto_447677 ) ) ( not ( = ?auto_447669 ?auto_447678 ) ) ( not ( = ?auto_447670 ?auto_447671 ) ) ( not ( = ?auto_447670 ?auto_447672 ) ) ( not ( = ?auto_447670 ?auto_447673 ) ) ( not ( = ?auto_447670 ?auto_447674 ) ) ( not ( = ?auto_447670 ?auto_447675 ) ) ( not ( = ?auto_447670 ?auto_447676 ) ) ( not ( = ?auto_447670 ?auto_447677 ) ) ( not ( = ?auto_447670 ?auto_447678 ) ) ( not ( = ?auto_447671 ?auto_447672 ) ) ( not ( = ?auto_447671 ?auto_447673 ) ) ( not ( = ?auto_447671 ?auto_447674 ) ) ( not ( = ?auto_447671 ?auto_447675 ) ) ( not ( = ?auto_447671 ?auto_447676 ) ) ( not ( = ?auto_447671 ?auto_447677 ) ) ( not ( = ?auto_447671 ?auto_447678 ) ) ( not ( = ?auto_447672 ?auto_447673 ) ) ( not ( = ?auto_447672 ?auto_447674 ) ) ( not ( = ?auto_447672 ?auto_447675 ) ) ( not ( = ?auto_447672 ?auto_447676 ) ) ( not ( = ?auto_447672 ?auto_447677 ) ) ( not ( = ?auto_447672 ?auto_447678 ) ) ( not ( = ?auto_447673 ?auto_447674 ) ) ( not ( = ?auto_447673 ?auto_447675 ) ) ( not ( = ?auto_447673 ?auto_447676 ) ) ( not ( = ?auto_447673 ?auto_447677 ) ) ( not ( = ?auto_447673 ?auto_447678 ) ) ( not ( = ?auto_447674 ?auto_447675 ) ) ( not ( = ?auto_447674 ?auto_447676 ) ) ( not ( = ?auto_447674 ?auto_447677 ) ) ( not ( = ?auto_447674 ?auto_447678 ) ) ( not ( = ?auto_447675 ?auto_447676 ) ) ( not ( = ?auto_447675 ?auto_447677 ) ) ( not ( = ?auto_447675 ?auto_447678 ) ) ( not ( = ?auto_447676 ?auto_447677 ) ) ( not ( = ?auto_447676 ?auto_447678 ) ) ( not ( = ?auto_447677 ?auto_447678 ) ) ( ON ?auto_447676 ?auto_447677 ) ( CLEAR ?auto_447674 ) ( ON ?auto_447675 ?auto_447676 ) ( CLEAR ?auto_447675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_447664 ?auto_447665 ?auto_447666 ?auto_447667 ?auto_447668 ?auto_447669 ?auto_447670 ?auto_447671 ?auto_447672 ?auto_447673 ?auto_447674 ?auto_447675 )
      ( MAKE-14PILE ?auto_447664 ?auto_447665 ?auto_447666 ?auto_447667 ?auto_447668 ?auto_447669 ?auto_447670 ?auto_447671 ?auto_447672 ?auto_447673 ?auto_447674 ?auto_447675 ?auto_447676 ?auto_447677 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_447722 - BLOCK
      ?auto_447723 - BLOCK
      ?auto_447724 - BLOCK
      ?auto_447725 - BLOCK
      ?auto_447726 - BLOCK
      ?auto_447727 - BLOCK
      ?auto_447728 - BLOCK
      ?auto_447729 - BLOCK
      ?auto_447730 - BLOCK
      ?auto_447731 - BLOCK
      ?auto_447732 - BLOCK
      ?auto_447733 - BLOCK
      ?auto_447734 - BLOCK
      ?auto_447735 - BLOCK
    )
    :vars
    (
      ?auto_447736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447735 ?auto_447736 ) ( ON-TABLE ?auto_447722 ) ( ON ?auto_447723 ?auto_447722 ) ( ON ?auto_447724 ?auto_447723 ) ( ON ?auto_447725 ?auto_447724 ) ( ON ?auto_447726 ?auto_447725 ) ( ON ?auto_447727 ?auto_447726 ) ( ON ?auto_447728 ?auto_447727 ) ( ON ?auto_447729 ?auto_447728 ) ( ON ?auto_447730 ?auto_447729 ) ( ON ?auto_447731 ?auto_447730 ) ( not ( = ?auto_447722 ?auto_447723 ) ) ( not ( = ?auto_447722 ?auto_447724 ) ) ( not ( = ?auto_447722 ?auto_447725 ) ) ( not ( = ?auto_447722 ?auto_447726 ) ) ( not ( = ?auto_447722 ?auto_447727 ) ) ( not ( = ?auto_447722 ?auto_447728 ) ) ( not ( = ?auto_447722 ?auto_447729 ) ) ( not ( = ?auto_447722 ?auto_447730 ) ) ( not ( = ?auto_447722 ?auto_447731 ) ) ( not ( = ?auto_447722 ?auto_447732 ) ) ( not ( = ?auto_447722 ?auto_447733 ) ) ( not ( = ?auto_447722 ?auto_447734 ) ) ( not ( = ?auto_447722 ?auto_447735 ) ) ( not ( = ?auto_447722 ?auto_447736 ) ) ( not ( = ?auto_447723 ?auto_447724 ) ) ( not ( = ?auto_447723 ?auto_447725 ) ) ( not ( = ?auto_447723 ?auto_447726 ) ) ( not ( = ?auto_447723 ?auto_447727 ) ) ( not ( = ?auto_447723 ?auto_447728 ) ) ( not ( = ?auto_447723 ?auto_447729 ) ) ( not ( = ?auto_447723 ?auto_447730 ) ) ( not ( = ?auto_447723 ?auto_447731 ) ) ( not ( = ?auto_447723 ?auto_447732 ) ) ( not ( = ?auto_447723 ?auto_447733 ) ) ( not ( = ?auto_447723 ?auto_447734 ) ) ( not ( = ?auto_447723 ?auto_447735 ) ) ( not ( = ?auto_447723 ?auto_447736 ) ) ( not ( = ?auto_447724 ?auto_447725 ) ) ( not ( = ?auto_447724 ?auto_447726 ) ) ( not ( = ?auto_447724 ?auto_447727 ) ) ( not ( = ?auto_447724 ?auto_447728 ) ) ( not ( = ?auto_447724 ?auto_447729 ) ) ( not ( = ?auto_447724 ?auto_447730 ) ) ( not ( = ?auto_447724 ?auto_447731 ) ) ( not ( = ?auto_447724 ?auto_447732 ) ) ( not ( = ?auto_447724 ?auto_447733 ) ) ( not ( = ?auto_447724 ?auto_447734 ) ) ( not ( = ?auto_447724 ?auto_447735 ) ) ( not ( = ?auto_447724 ?auto_447736 ) ) ( not ( = ?auto_447725 ?auto_447726 ) ) ( not ( = ?auto_447725 ?auto_447727 ) ) ( not ( = ?auto_447725 ?auto_447728 ) ) ( not ( = ?auto_447725 ?auto_447729 ) ) ( not ( = ?auto_447725 ?auto_447730 ) ) ( not ( = ?auto_447725 ?auto_447731 ) ) ( not ( = ?auto_447725 ?auto_447732 ) ) ( not ( = ?auto_447725 ?auto_447733 ) ) ( not ( = ?auto_447725 ?auto_447734 ) ) ( not ( = ?auto_447725 ?auto_447735 ) ) ( not ( = ?auto_447725 ?auto_447736 ) ) ( not ( = ?auto_447726 ?auto_447727 ) ) ( not ( = ?auto_447726 ?auto_447728 ) ) ( not ( = ?auto_447726 ?auto_447729 ) ) ( not ( = ?auto_447726 ?auto_447730 ) ) ( not ( = ?auto_447726 ?auto_447731 ) ) ( not ( = ?auto_447726 ?auto_447732 ) ) ( not ( = ?auto_447726 ?auto_447733 ) ) ( not ( = ?auto_447726 ?auto_447734 ) ) ( not ( = ?auto_447726 ?auto_447735 ) ) ( not ( = ?auto_447726 ?auto_447736 ) ) ( not ( = ?auto_447727 ?auto_447728 ) ) ( not ( = ?auto_447727 ?auto_447729 ) ) ( not ( = ?auto_447727 ?auto_447730 ) ) ( not ( = ?auto_447727 ?auto_447731 ) ) ( not ( = ?auto_447727 ?auto_447732 ) ) ( not ( = ?auto_447727 ?auto_447733 ) ) ( not ( = ?auto_447727 ?auto_447734 ) ) ( not ( = ?auto_447727 ?auto_447735 ) ) ( not ( = ?auto_447727 ?auto_447736 ) ) ( not ( = ?auto_447728 ?auto_447729 ) ) ( not ( = ?auto_447728 ?auto_447730 ) ) ( not ( = ?auto_447728 ?auto_447731 ) ) ( not ( = ?auto_447728 ?auto_447732 ) ) ( not ( = ?auto_447728 ?auto_447733 ) ) ( not ( = ?auto_447728 ?auto_447734 ) ) ( not ( = ?auto_447728 ?auto_447735 ) ) ( not ( = ?auto_447728 ?auto_447736 ) ) ( not ( = ?auto_447729 ?auto_447730 ) ) ( not ( = ?auto_447729 ?auto_447731 ) ) ( not ( = ?auto_447729 ?auto_447732 ) ) ( not ( = ?auto_447729 ?auto_447733 ) ) ( not ( = ?auto_447729 ?auto_447734 ) ) ( not ( = ?auto_447729 ?auto_447735 ) ) ( not ( = ?auto_447729 ?auto_447736 ) ) ( not ( = ?auto_447730 ?auto_447731 ) ) ( not ( = ?auto_447730 ?auto_447732 ) ) ( not ( = ?auto_447730 ?auto_447733 ) ) ( not ( = ?auto_447730 ?auto_447734 ) ) ( not ( = ?auto_447730 ?auto_447735 ) ) ( not ( = ?auto_447730 ?auto_447736 ) ) ( not ( = ?auto_447731 ?auto_447732 ) ) ( not ( = ?auto_447731 ?auto_447733 ) ) ( not ( = ?auto_447731 ?auto_447734 ) ) ( not ( = ?auto_447731 ?auto_447735 ) ) ( not ( = ?auto_447731 ?auto_447736 ) ) ( not ( = ?auto_447732 ?auto_447733 ) ) ( not ( = ?auto_447732 ?auto_447734 ) ) ( not ( = ?auto_447732 ?auto_447735 ) ) ( not ( = ?auto_447732 ?auto_447736 ) ) ( not ( = ?auto_447733 ?auto_447734 ) ) ( not ( = ?auto_447733 ?auto_447735 ) ) ( not ( = ?auto_447733 ?auto_447736 ) ) ( not ( = ?auto_447734 ?auto_447735 ) ) ( not ( = ?auto_447734 ?auto_447736 ) ) ( not ( = ?auto_447735 ?auto_447736 ) ) ( ON ?auto_447734 ?auto_447735 ) ( ON ?auto_447733 ?auto_447734 ) ( CLEAR ?auto_447731 ) ( ON ?auto_447732 ?auto_447733 ) ( CLEAR ?auto_447732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_447722 ?auto_447723 ?auto_447724 ?auto_447725 ?auto_447726 ?auto_447727 ?auto_447728 ?auto_447729 ?auto_447730 ?auto_447731 ?auto_447732 )
      ( MAKE-14PILE ?auto_447722 ?auto_447723 ?auto_447724 ?auto_447725 ?auto_447726 ?auto_447727 ?auto_447728 ?auto_447729 ?auto_447730 ?auto_447731 ?auto_447732 ?auto_447733 ?auto_447734 ?auto_447735 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_447780 - BLOCK
      ?auto_447781 - BLOCK
      ?auto_447782 - BLOCK
      ?auto_447783 - BLOCK
      ?auto_447784 - BLOCK
      ?auto_447785 - BLOCK
      ?auto_447786 - BLOCK
      ?auto_447787 - BLOCK
      ?auto_447788 - BLOCK
      ?auto_447789 - BLOCK
      ?auto_447790 - BLOCK
      ?auto_447791 - BLOCK
      ?auto_447792 - BLOCK
      ?auto_447793 - BLOCK
    )
    :vars
    (
      ?auto_447794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447793 ?auto_447794 ) ( ON-TABLE ?auto_447780 ) ( ON ?auto_447781 ?auto_447780 ) ( ON ?auto_447782 ?auto_447781 ) ( ON ?auto_447783 ?auto_447782 ) ( ON ?auto_447784 ?auto_447783 ) ( ON ?auto_447785 ?auto_447784 ) ( ON ?auto_447786 ?auto_447785 ) ( ON ?auto_447787 ?auto_447786 ) ( ON ?auto_447788 ?auto_447787 ) ( not ( = ?auto_447780 ?auto_447781 ) ) ( not ( = ?auto_447780 ?auto_447782 ) ) ( not ( = ?auto_447780 ?auto_447783 ) ) ( not ( = ?auto_447780 ?auto_447784 ) ) ( not ( = ?auto_447780 ?auto_447785 ) ) ( not ( = ?auto_447780 ?auto_447786 ) ) ( not ( = ?auto_447780 ?auto_447787 ) ) ( not ( = ?auto_447780 ?auto_447788 ) ) ( not ( = ?auto_447780 ?auto_447789 ) ) ( not ( = ?auto_447780 ?auto_447790 ) ) ( not ( = ?auto_447780 ?auto_447791 ) ) ( not ( = ?auto_447780 ?auto_447792 ) ) ( not ( = ?auto_447780 ?auto_447793 ) ) ( not ( = ?auto_447780 ?auto_447794 ) ) ( not ( = ?auto_447781 ?auto_447782 ) ) ( not ( = ?auto_447781 ?auto_447783 ) ) ( not ( = ?auto_447781 ?auto_447784 ) ) ( not ( = ?auto_447781 ?auto_447785 ) ) ( not ( = ?auto_447781 ?auto_447786 ) ) ( not ( = ?auto_447781 ?auto_447787 ) ) ( not ( = ?auto_447781 ?auto_447788 ) ) ( not ( = ?auto_447781 ?auto_447789 ) ) ( not ( = ?auto_447781 ?auto_447790 ) ) ( not ( = ?auto_447781 ?auto_447791 ) ) ( not ( = ?auto_447781 ?auto_447792 ) ) ( not ( = ?auto_447781 ?auto_447793 ) ) ( not ( = ?auto_447781 ?auto_447794 ) ) ( not ( = ?auto_447782 ?auto_447783 ) ) ( not ( = ?auto_447782 ?auto_447784 ) ) ( not ( = ?auto_447782 ?auto_447785 ) ) ( not ( = ?auto_447782 ?auto_447786 ) ) ( not ( = ?auto_447782 ?auto_447787 ) ) ( not ( = ?auto_447782 ?auto_447788 ) ) ( not ( = ?auto_447782 ?auto_447789 ) ) ( not ( = ?auto_447782 ?auto_447790 ) ) ( not ( = ?auto_447782 ?auto_447791 ) ) ( not ( = ?auto_447782 ?auto_447792 ) ) ( not ( = ?auto_447782 ?auto_447793 ) ) ( not ( = ?auto_447782 ?auto_447794 ) ) ( not ( = ?auto_447783 ?auto_447784 ) ) ( not ( = ?auto_447783 ?auto_447785 ) ) ( not ( = ?auto_447783 ?auto_447786 ) ) ( not ( = ?auto_447783 ?auto_447787 ) ) ( not ( = ?auto_447783 ?auto_447788 ) ) ( not ( = ?auto_447783 ?auto_447789 ) ) ( not ( = ?auto_447783 ?auto_447790 ) ) ( not ( = ?auto_447783 ?auto_447791 ) ) ( not ( = ?auto_447783 ?auto_447792 ) ) ( not ( = ?auto_447783 ?auto_447793 ) ) ( not ( = ?auto_447783 ?auto_447794 ) ) ( not ( = ?auto_447784 ?auto_447785 ) ) ( not ( = ?auto_447784 ?auto_447786 ) ) ( not ( = ?auto_447784 ?auto_447787 ) ) ( not ( = ?auto_447784 ?auto_447788 ) ) ( not ( = ?auto_447784 ?auto_447789 ) ) ( not ( = ?auto_447784 ?auto_447790 ) ) ( not ( = ?auto_447784 ?auto_447791 ) ) ( not ( = ?auto_447784 ?auto_447792 ) ) ( not ( = ?auto_447784 ?auto_447793 ) ) ( not ( = ?auto_447784 ?auto_447794 ) ) ( not ( = ?auto_447785 ?auto_447786 ) ) ( not ( = ?auto_447785 ?auto_447787 ) ) ( not ( = ?auto_447785 ?auto_447788 ) ) ( not ( = ?auto_447785 ?auto_447789 ) ) ( not ( = ?auto_447785 ?auto_447790 ) ) ( not ( = ?auto_447785 ?auto_447791 ) ) ( not ( = ?auto_447785 ?auto_447792 ) ) ( not ( = ?auto_447785 ?auto_447793 ) ) ( not ( = ?auto_447785 ?auto_447794 ) ) ( not ( = ?auto_447786 ?auto_447787 ) ) ( not ( = ?auto_447786 ?auto_447788 ) ) ( not ( = ?auto_447786 ?auto_447789 ) ) ( not ( = ?auto_447786 ?auto_447790 ) ) ( not ( = ?auto_447786 ?auto_447791 ) ) ( not ( = ?auto_447786 ?auto_447792 ) ) ( not ( = ?auto_447786 ?auto_447793 ) ) ( not ( = ?auto_447786 ?auto_447794 ) ) ( not ( = ?auto_447787 ?auto_447788 ) ) ( not ( = ?auto_447787 ?auto_447789 ) ) ( not ( = ?auto_447787 ?auto_447790 ) ) ( not ( = ?auto_447787 ?auto_447791 ) ) ( not ( = ?auto_447787 ?auto_447792 ) ) ( not ( = ?auto_447787 ?auto_447793 ) ) ( not ( = ?auto_447787 ?auto_447794 ) ) ( not ( = ?auto_447788 ?auto_447789 ) ) ( not ( = ?auto_447788 ?auto_447790 ) ) ( not ( = ?auto_447788 ?auto_447791 ) ) ( not ( = ?auto_447788 ?auto_447792 ) ) ( not ( = ?auto_447788 ?auto_447793 ) ) ( not ( = ?auto_447788 ?auto_447794 ) ) ( not ( = ?auto_447789 ?auto_447790 ) ) ( not ( = ?auto_447789 ?auto_447791 ) ) ( not ( = ?auto_447789 ?auto_447792 ) ) ( not ( = ?auto_447789 ?auto_447793 ) ) ( not ( = ?auto_447789 ?auto_447794 ) ) ( not ( = ?auto_447790 ?auto_447791 ) ) ( not ( = ?auto_447790 ?auto_447792 ) ) ( not ( = ?auto_447790 ?auto_447793 ) ) ( not ( = ?auto_447790 ?auto_447794 ) ) ( not ( = ?auto_447791 ?auto_447792 ) ) ( not ( = ?auto_447791 ?auto_447793 ) ) ( not ( = ?auto_447791 ?auto_447794 ) ) ( not ( = ?auto_447792 ?auto_447793 ) ) ( not ( = ?auto_447792 ?auto_447794 ) ) ( not ( = ?auto_447793 ?auto_447794 ) ) ( ON ?auto_447792 ?auto_447793 ) ( ON ?auto_447791 ?auto_447792 ) ( ON ?auto_447790 ?auto_447791 ) ( CLEAR ?auto_447788 ) ( ON ?auto_447789 ?auto_447790 ) ( CLEAR ?auto_447789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_447780 ?auto_447781 ?auto_447782 ?auto_447783 ?auto_447784 ?auto_447785 ?auto_447786 ?auto_447787 ?auto_447788 ?auto_447789 )
      ( MAKE-14PILE ?auto_447780 ?auto_447781 ?auto_447782 ?auto_447783 ?auto_447784 ?auto_447785 ?auto_447786 ?auto_447787 ?auto_447788 ?auto_447789 ?auto_447790 ?auto_447791 ?auto_447792 ?auto_447793 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_447838 - BLOCK
      ?auto_447839 - BLOCK
      ?auto_447840 - BLOCK
      ?auto_447841 - BLOCK
      ?auto_447842 - BLOCK
      ?auto_447843 - BLOCK
      ?auto_447844 - BLOCK
      ?auto_447845 - BLOCK
      ?auto_447846 - BLOCK
      ?auto_447847 - BLOCK
      ?auto_447848 - BLOCK
      ?auto_447849 - BLOCK
      ?auto_447850 - BLOCK
      ?auto_447851 - BLOCK
    )
    :vars
    (
      ?auto_447852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447851 ?auto_447852 ) ( ON-TABLE ?auto_447838 ) ( ON ?auto_447839 ?auto_447838 ) ( ON ?auto_447840 ?auto_447839 ) ( ON ?auto_447841 ?auto_447840 ) ( ON ?auto_447842 ?auto_447841 ) ( ON ?auto_447843 ?auto_447842 ) ( ON ?auto_447844 ?auto_447843 ) ( ON ?auto_447845 ?auto_447844 ) ( not ( = ?auto_447838 ?auto_447839 ) ) ( not ( = ?auto_447838 ?auto_447840 ) ) ( not ( = ?auto_447838 ?auto_447841 ) ) ( not ( = ?auto_447838 ?auto_447842 ) ) ( not ( = ?auto_447838 ?auto_447843 ) ) ( not ( = ?auto_447838 ?auto_447844 ) ) ( not ( = ?auto_447838 ?auto_447845 ) ) ( not ( = ?auto_447838 ?auto_447846 ) ) ( not ( = ?auto_447838 ?auto_447847 ) ) ( not ( = ?auto_447838 ?auto_447848 ) ) ( not ( = ?auto_447838 ?auto_447849 ) ) ( not ( = ?auto_447838 ?auto_447850 ) ) ( not ( = ?auto_447838 ?auto_447851 ) ) ( not ( = ?auto_447838 ?auto_447852 ) ) ( not ( = ?auto_447839 ?auto_447840 ) ) ( not ( = ?auto_447839 ?auto_447841 ) ) ( not ( = ?auto_447839 ?auto_447842 ) ) ( not ( = ?auto_447839 ?auto_447843 ) ) ( not ( = ?auto_447839 ?auto_447844 ) ) ( not ( = ?auto_447839 ?auto_447845 ) ) ( not ( = ?auto_447839 ?auto_447846 ) ) ( not ( = ?auto_447839 ?auto_447847 ) ) ( not ( = ?auto_447839 ?auto_447848 ) ) ( not ( = ?auto_447839 ?auto_447849 ) ) ( not ( = ?auto_447839 ?auto_447850 ) ) ( not ( = ?auto_447839 ?auto_447851 ) ) ( not ( = ?auto_447839 ?auto_447852 ) ) ( not ( = ?auto_447840 ?auto_447841 ) ) ( not ( = ?auto_447840 ?auto_447842 ) ) ( not ( = ?auto_447840 ?auto_447843 ) ) ( not ( = ?auto_447840 ?auto_447844 ) ) ( not ( = ?auto_447840 ?auto_447845 ) ) ( not ( = ?auto_447840 ?auto_447846 ) ) ( not ( = ?auto_447840 ?auto_447847 ) ) ( not ( = ?auto_447840 ?auto_447848 ) ) ( not ( = ?auto_447840 ?auto_447849 ) ) ( not ( = ?auto_447840 ?auto_447850 ) ) ( not ( = ?auto_447840 ?auto_447851 ) ) ( not ( = ?auto_447840 ?auto_447852 ) ) ( not ( = ?auto_447841 ?auto_447842 ) ) ( not ( = ?auto_447841 ?auto_447843 ) ) ( not ( = ?auto_447841 ?auto_447844 ) ) ( not ( = ?auto_447841 ?auto_447845 ) ) ( not ( = ?auto_447841 ?auto_447846 ) ) ( not ( = ?auto_447841 ?auto_447847 ) ) ( not ( = ?auto_447841 ?auto_447848 ) ) ( not ( = ?auto_447841 ?auto_447849 ) ) ( not ( = ?auto_447841 ?auto_447850 ) ) ( not ( = ?auto_447841 ?auto_447851 ) ) ( not ( = ?auto_447841 ?auto_447852 ) ) ( not ( = ?auto_447842 ?auto_447843 ) ) ( not ( = ?auto_447842 ?auto_447844 ) ) ( not ( = ?auto_447842 ?auto_447845 ) ) ( not ( = ?auto_447842 ?auto_447846 ) ) ( not ( = ?auto_447842 ?auto_447847 ) ) ( not ( = ?auto_447842 ?auto_447848 ) ) ( not ( = ?auto_447842 ?auto_447849 ) ) ( not ( = ?auto_447842 ?auto_447850 ) ) ( not ( = ?auto_447842 ?auto_447851 ) ) ( not ( = ?auto_447842 ?auto_447852 ) ) ( not ( = ?auto_447843 ?auto_447844 ) ) ( not ( = ?auto_447843 ?auto_447845 ) ) ( not ( = ?auto_447843 ?auto_447846 ) ) ( not ( = ?auto_447843 ?auto_447847 ) ) ( not ( = ?auto_447843 ?auto_447848 ) ) ( not ( = ?auto_447843 ?auto_447849 ) ) ( not ( = ?auto_447843 ?auto_447850 ) ) ( not ( = ?auto_447843 ?auto_447851 ) ) ( not ( = ?auto_447843 ?auto_447852 ) ) ( not ( = ?auto_447844 ?auto_447845 ) ) ( not ( = ?auto_447844 ?auto_447846 ) ) ( not ( = ?auto_447844 ?auto_447847 ) ) ( not ( = ?auto_447844 ?auto_447848 ) ) ( not ( = ?auto_447844 ?auto_447849 ) ) ( not ( = ?auto_447844 ?auto_447850 ) ) ( not ( = ?auto_447844 ?auto_447851 ) ) ( not ( = ?auto_447844 ?auto_447852 ) ) ( not ( = ?auto_447845 ?auto_447846 ) ) ( not ( = ?auto_447845 ?auto_447847 ) ) ( not ( = ?auto_447845 ?auto_447848 ) ) ( not ( = ?auto_447845 ?auto_447849 ) ) ( not ( = ?auto_447845 ?auto_447850 ) ) ( not ( = ?auto_447845 ?auto_447851 ) ) ( not ( = ?auto_447845 ?auto_447852 ) ) ( not ( = ?auto_447846 ?auto_447847 ) ) ( not ( = ?auto_447846 ?auto_447848 ) ) ( not ( = ?auto_447846 ?auto_447849 ) ) ( not ( = ?auto_447846 ?auto_447850 ) ) ( not ( = ?auto_447846 ?auto_447851 ) ) ( not ( = ?auto_447846 ?auto_447852 ) ) ( not ( = ?auto_447847 ?auto_447848 ) ) ( not ( = ?auto_447847 ?auto_447849 ) ) ( not ( = ?auto_447847 ?auto_447850 ) ) ( not ( = ?auto_447847 ?auto_447851 ) ) ( not ( = ?auto_447847 ?auto_447852 ) ) ( not ( = ?auto_447848 ?auto_447849 ) ) ( not ( = ?auto_447848 ?auto_447850 ) ) ( not ( = ?auto_447848 ?auto_447851 ) ) ( not ( = ?auto_447848 ?auto_447852 ) ) ( not ( = ?auto_447849 ?auto_447850 ) ) ( not ( = ?auto_447849 ?auto_447851 ) ) ( not ( = ?auto_447849 ?auto_447852 ) ) ( not ( = ?auto_447850 ?auto_447851 ) ) ( not ( = ?auto_447850 ?auto_447852 ) ) ( not ( = ?auto_447851 ?auto_447852 ) ) ( ON ?auto_447850 ?auto_447851 ) ( ON ?auto_447849 ?auto_447850 ) ( ON ?auto_447848 ?auto_447849 ) ( ON ?auto_447847 ?auto_447848 ) ( CLEAR ?auto_447845 ) ( ON ?auto_447846 ?auto_447847 ) ( CLEAR ?auto_447846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_447838 ?auto_447839 ?auto_447840 ?auto_447841 ?auto_447842 ?auto_447843 ?auto_447844 ?auto_447845 ?auto_447846 )
      ( MAKE-14PILE ?auto_447838 ?auto_447839 ?auto_447840 ?auto_447841 ?auto_447842 ?auto_447843 ?auto_447844 ?auto_447845 ?auto_447846 ?auto_447847 ?auto_447848 ?auto_447849 ?auto_447850 ?auto_447851 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_447896 - BLOCK
      ?auto_447897 - BLOCK
      ?auto_447898 - BLOCK
      ?auto_447899 - BLOCK
      ?auto_447900 - BLOCK
      ?auto_447901 - BLOCK
      ?auto_447902 - BLOCK
      ?auto_447903 - BLOCK
      ?auto_447904 - BLOCK
      ?auto_447905 - BLOCK
      ?auto_447906 - BLOCK
      ?auto_447907 - BLOCK
      ?auto_447908 - BLOCK
      ?auto_447909 - BLOCK
    )
    :vars
    (
      ?auto_447910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447909 ?auto_447910 ) ( ON-TABLE ?auto_447896 ) ( ON ?auto_447897 ?auto_447896 ) ( ON ?auto_447898 ?auto_447897 ) ( ON ?auto_447899 ?auto_447898 ) ( ON ?auto_447900 ?auto_447899 ) ( ON ?auto_447901 ?auto_447900 ) ( ON ?auto_447902 ?auto_447901 ) ( not ( = ?auto_447896 ?auto_447897 ) ) ( not ( = ?auto_447896 ?auto_447898 ) ) ( not ( = ?auto_447896 ?auto_447899 ) ) ( not ( = ?auto_447896 ?auto_447900 ) ) ( not ( = ?auto_447896 ?auto_447901 ) ) ( not ( = ?auto_447896 ?auto_447902 ) ) ( not ( = ?auto_447896 ?auto_447903 ) ) ( not ( = ?auto_447896 ?auto_447904 ) ) ( not ( = ?auto_447896 ?auto_447905 ) ) ( not ( = ?auto_447896 ?auto_447906 ) ) ( not ( = ?auto_447896 ?auto_447907 ) ) ( not ( = ?auto_447896 ?auto_447908 ) ) ( not ( = ?auto_447896 ?auto_447909 ) ) ( not ( = ?auto_447896 ?auto_447910 ) ) ( not ( = ?auto_447897 ?auto_447898 ) ) ( not ( = ?auto_447897 ?auto_447899 ) ) ( not ( = ?auto_447897 ?auto_447900 ) ) ( not ( = ?auto_447897 ?auto_447901 ) ) ( not ( = ?auto_447897 ?auto_447902 ) ) ( not ( = ?auto_447897 ?auto_447903 ) ) ( not ( = ?auto_447897 ?auto_447904 ) ) ( not ( = ?auto_447897 ?auto_447905 ) ) ( not ( = ?auto_447897 ?auto_447906 ) ) ( not ( = ?auto_447897 ?auto_447907 ) ) ( not ( = ?auto_447897 ?auto_447908 ) ) ( not ( = ?auto_447897 ?auto_447909 ) ) ( not ( = ?auto_447897 ?auto_447910 ) ) ( not ( = ?auto_447898 ?auto_447899 ) ) ( not ( = ?auto_447898 ?auto_447900 ) ) ( not ( = ?auto_447898 ?auto_447901 ) ) ( not ( = ?auto_447898 ?auto_447902 ) ) ( not ( = ?auto_447898 ?auto_447903 ) ) ( not ( = ?auto_447898 ?auto_447904 ) ) ( not ( = ?auto_447898 ?auto_447905 ) ) ( not ( = ?auto_447898 ?auto_447906 ) ) ( not ( = ?auto_447898 ?auto_447907 ) ) ( not ( = ?auto_447898 ?auto_447908 ) ) ( not ( = ?auto_447898 ?auto_447909 ) ) ( not ( = ?auto_447898 ?auto_447910 ) ) ( not ( = ?auto_447899 ?auto_447900 ) ) ( not ( = ?auto_447899 ?auto_447901 ) ) ( not ( = ?auto_447899 ?auto_447902 ) ) ( not ( = ?auto_447899 ?auto_447903 ) ) ( not ( = ?auto_447899 ?auto_447904 ) ) ( not ( = ?auto_447899 ?auto_447905 ) ) ( not ( = ?auto_447899 ?auto_447906 ) ) ( not ( = ?auto_447899 ?auto_447907 ) ) ( not ( = ?auto_447899 ?auto_447908 ) ) ( not ( = ?auto_447899 ?auto_447909 ) ) ( not ( = ?auto_447899 ?auto_447910 ) ) ( not ( = ?auto_447900 ?auto_447901 ) ) ( not ( = ?auto_447900 ?auto_447902 ) ) ( not ( = ?auto_447900 ?auto_447903 ) ) ( not ( = ?auto_447900 ?auto_447904 ) ) ( not ( = ?auto_447900 ?auto_447905 ) ) ( not ( = ?auto_447900 ?auto_447906 ) ) ( not ( = ?auto_447900 ?auto_447907 ) ) ( not ( = ?auto_447900 ?auto_447908 ) ) ( not ( = ?auto_447900 ?auto_447909 ) ) ( not ( = ?auto_447900 ?auto_447910 ) ) ( not ( = ?auto_447901 ?auto_447902 ) ) ( not ( = ?auto_447901 ?auto_447903 ) ) ( not ( = ?auto_447901 ?auto_447904 ) ) ( not ( = ?auto_447901 ?auto_447905 ) ) ( not ( = ?auto_447901 ?auto_447906 ) ) ( not ( = ?auto_447901 ?auto_447907 ) ) ( not ( = ?auto_447901 ?auto_447908 ) ) ( not ( = ?auto_447901 ?auto_447909 ) ) ( not ( = ?auto_447901 ?auto_447910 ) ) ( not ( = ?auto_447902 ?auto_447903 ) ) ( not ( = ?auto_447902 ?auto_447904 ) ) ( not ( = ?auto_447902 ?auto_447905 ) ) ( not ( = ?auto_447902 ?auto_447906 ) ) ( not ( = ?auto_447902 ?auto_447907 ) ) ( not ( = ?auto_447902 ?auto_447908 ) ) ( not ( = ?auto_447902 ?auto_447909 ) ) ( not ( = ?auto_447902 ?auto_447910 ) ) ( not ( = ?auto_447903 ?auto_447904 ) ) ( not ( = ?auto_447903 ?auto_447905 ) ) ( not ( = ?auto_447903 ?auto_447906 ) ) ( not ( = ?auto_447903 ?auto_447907 ) ) ( not ( = ?auto_447903 ?auto_447908 ) ) ( not ( = ?auto_447903 ?auto_447909 ) ) ( not ( = ?auto_447903 ?auto_447910 ) ) ( not ( = ?auto_447904 ?auto_447905 ) ) ( not ( = ?auto_447904 ?auto_447906 ) ) ( not ( = ?auto_447904 ?auto_447907 ) ) ( not ( = ?auto_447904 ?auto_447908 ) ) ( not ( = ?auto_447904 ?auto_447909 ) ) ( not ( = ?auto_447904 ?auto_447910 ) ) ( not ( = ?auto_447905 ?auto_447906 ) ) ( not ( = ?auto_447905 ?auto_447907 ) ) ( not ( = ?auto_447905 ?auto_447908 ) ) ( not ( = ?auto_447905 ?auto_447909 ) ) ( not ( = ?auto_447905 ?auto_447910 ) ) ( not ( = ?auto_447906 ?auto_447907 ) ) ( not ( = ?auto_447906 ?auto_447908 ) ) ( not ( = ?auto_447906 ?auto_447909 ) ) ( not ( = ?auto_447906 ?auto_447910 ) ) ( not ( = ?auto_447907 ?auto_447908 ) ) ( not ( = ?auto_447907 ?auto_447909 ) ) ( not ( = ?auto_447907 ?auto_447910 ) ) ( not ( = ?auto_447908 ?auto_447909 ) ) ( not ( = ?auto_447908 ?auto_447910 ) ) ( not ( = ?auto_447909 ?auto_447910 ) ) ( ON ?auto_447908 ?auto_447909 ) ( ON ?auto_447907 ?auto_447908 ) ( ON ?auto_447906 ?auto_447907 ) ( ON ?auto_447905 ?auto_447906 ) ( ON ?auto_447904 ?auto_447905 ) ( CLEAR ?auto_447902 ) ( ON ?auto_447903 ?auto_447904 ) ( CLEAR ?auto_447903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_447896 ?auto_447897 ?auto_447898 ?auto_447899 ?auto_447900 ?auto_447901 ?auto_447902 ?auto_447903 )
      ( MAKE-14PILE ?auto_447896 ?auto_447897 ?auto_447898 ?auto_447899 ?auto_447900 ?auto_447901 ?auto_447902 ?auto_447903 ?auto_447904 ?auto_447905 ?auto_447906 ?auto_447907 ?auto_447908 ?auto_447909 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_447954 - BLOCK
      ?auto_447955 - BLOCK
      ?auto_447956 - BLOCK
      ?auto_447957 - BLOCK
      ?auto_447958 - BLOCK
      ?auto_447959 - BLOCK
      ?auto_447960 - BLOCK
      ?auto_447961 - BLOCK
      ?auto_447962 - BLOCK
      ?auto_447963 - BLOCK
      ?auto_447964 - BLOCK
      ?auto_447965 - BLOCK
      ?auto_447966 - BLOCK
      ?auto_447967 - BLOCK
    )
    :vars
    (
      ?auto_447968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_447967 ?auto_447968 ) ( ON-TABLE ?auto_447954 ) ( ON ?auto_447955 ?auto_447954 ) ( ON ?auto_447956 ?auto_447955 ) ( ON ?auto_447957 ?auto_447956 ) ( ON ?auto_447958 ?auto_447957 ) ( ON ?auto_447959 ?auto_447958 ) ( not ( = ?auto_447954 ?auto_447955 ) ) ( not ( = ?auto_447954 ?auto_447956 ) ) ( not ( = ?auto_447954 ?auto_447957 ) ) ( not ( = ?auto_447954 ?auto_447958 ) ) ( not ( = ?auto_447954 ?auto_447959 ) ) ( not ( = ?auto_447954 ?auto_447960 ) ) ( not ( = ?auto_447954 ?auto_447961 ) ) ( not ( = ?auto_447954 ?auto_447962 ) ) ( not ( = ?auto_447954 ?auto_447963 ) ) ( not ( = ?auto_447954 ?auto_447964 ) ) ( not ( = ?auto_447954 ?auto_447965 ) ) ( not ( = ?auto_447954 ?auto_447966 ) ) ( not ( = ?auto_447954 ?auto_447967 ) ) ( not ( = ?auto_447954 ?auto_447968 ) ) ( not ( = ?auto_447955 ?auto_447956 ) ) ( not ( = ?auto_447955 ?auto_447957 ) ) ( not ( = ?auto_447955 ?auto_447958 ) ) ( not ( = ?auto_447955 ?auto_447959 ) ) ( not ( = ?auto_447955 ?auto_447960 ) ) ( not ( = ?auto_447955 ?auto_447961 ) ) ( not ( = ?auto_447955 ?auto_447962 ) ) ( not ( = ?auto_447955 ?auto_447963 ) ) ( not ( = ?auto_447955 ?auto_447964 ) ) ( not ( = ?auto_447955 ?auto_447965 ) ) ( not ( = ?auto_447955 ?auto_447966 ) ) ( not ( = ?auto_447955 ?auto_447967 ) ) ( not ( = ?auto_447955 ?auto_447968 ) ) ( not ( = ?auto_447956 ?auto_447957 ) ) ( not ( = ?auto_447956 ?auto_447958 ) ) ( not ( = ?auto_447956 ?auto_447959 ) ) ( not ( = ?auto_447956 ?auto_447960 ) ) ( not ( = ?auto_447956 ?auto_447961 ) ) ( not ( = ?auto_447956 ?auto_447962 ) ) ( not ( = ?auto_447956 ?auto_447963 ) ) ( not ( = ?auto_447956 ?auto_447964 ) ) ( not ( = ?auto_447956 ?auto_447965 ) ) ( not ( = ?auto_447956 ?auto_447966 ) ) ( not ( = ?auto_447956 ?auto_447967 ) ) ( not ( = ?auto_447956 ?auto_447968 ) ) ( not ( = ?auto_447957 ?auto_447958 ) ) ( not ( = ?auto_447957 ?auto_447959 ) ) ( not ( = ?auto_447957 ?auto_447960 ) ) ( not ( = ?auto_447957 ?auto_447961 ) ) ( not ( = ?auto_447957 ?auto_447962 ) ) ( not ( = ?auto_447957 ?auto_447963 ) ) ( not ( = ?auto_447957 ?auto_447964 ) ) ( not ( = ?auto_447957 ?auto_447965 ) ) ( not ( = ?auto_447957 ?auto_447966 ) ) ( not ( = ?auto_447957 ?auto_447967 ) ) ( not ( = ?auto_447957 ?auto_447968 ) ) ( not ( = ?auto_447958 ?auto_447959 ) ) ( not ( = ?auto_447958 ?auto_447960 ) ) ( not ( = ?auto_447958 ?auto_447961 ) ) ( not ( = ?auto_447958 ?auto_447962 ) ) ( not ( = ?auto_447958 ?auto_447963 ) ) ( not ( = ?auto_447958 ?auto_447964 ) ) ( not ( = ?auto_447958 ?auto_447965 ) ) ( not ( = ?auto_447958 ?auto_447966 ) ) ( not ( = ?auto_447958 ?auto_447967 ) ) ( not ( = ?auto_447958 ?auto_447968 ) ) ( not ( = ?auto_447959 ?auto_447960 ) ) ( not ( = ?auto_447959 ?auto_447961 ) ) ( not ( = ?auto_447959 ?auto_447962 ) ) ( not ( = ?auto_447959 ?auto_447963 ) ) ( not ( = ?auto_447959 ?auto_447964 ) ) ( not ( = ?auto_447959 ?auto_447965 ) ) ( not ( = ?auto_447959 ?auto_447966 ) ) ( not ( = ?auto_447959 ?auto_447967 ) ) ( not ( = ?auto_447959 ?auto_447968 ) ) ( not ( = ?auto_447960 ?auto_447961 ) ) ( not ( = ?auto_447960 ?auto_447962 ) ) ( not ( = ?auto_447960 ?auto_447963 ) ) ( not ( = ?auto_447960 ?auto_447964 ) ) ( not ( = ?auto_447960 ?auto_447965 ) ) ( not ( = ?auto_447960 ?auto_447966 ) ) ( not ( = ?auto_447960 ?auto_447967 ) ) ( not ( = ?auto_447960 ?auto_447968 ) ) ( not ( = ?auto_447961 ?auto_447962 ) ) ( not ( = ?auto_447961 ?auto_447963 ) ) ( not ( = ?auto_447961 ?auto_447964 ) ) ( not ( = ?auto_447961 ?auto_447965 ) ) ( not ( = ?auto_447961 ?auto_447966 ) ) ( not ( = ?auto_447961 ?auto_447967 ) ) ( not ( = ?auto_447961 ?auto_447968 ) ) ( not ( = ?auto_447962 ?auto_447963 ) ) ( not ( = ?auto_447962 ?auto_447964 ) ) ( not ( = ?auto_447962 ?auto_447965 ) ) ( not ( = ?auto_447962 ?auto_447966 ) ) ( not ( = ?auto_447962 ?auto_447967 ) ) ( not ( = ?auto_447962 ?auto_447968 ) ) ( not ( = ?auto_447963 ?auto_447964 ) ) ( not ( = ?auto_447963 ?auto_447965 ) ) ( not ( = ?auto_447963 ?auto_447966 ) ) ( not ( = ?auto_447963 ?auto_447967 ) ) ( not ( = ?auto_447963 ?auto_447968 ) ) ( not ( = ?auto_447964 ?auto_447965 ) ) ( not ( = ?auto_447964 ?auto_447966 ) ) ( not ( = ?auto_447964 ?auto_447967 ) ) ( not ( = ?auto_447964 ?auto_447968 ) ) ( not ( = ?auto_447965 ?auto_447966 ) ) ( not ( = ?auto_447965 ?auto_447967 ) ) ( not ( = ?auto_447965 ?auto_447968 ) ) ( not ( = ?auto_447966 ?auto_447967 ) ) ( not ( = ?auto_447966 ?auto_447968 ) ) ( not ( = ?auto_447967 ?auto_447968 ) ) ( ON ?auto_447966 ?auto_447967 ) ( ON ?auto_447965 ?auto_447966 ) ( ON ?auto_447964 ?auto_447965 ) ( ON ?auto_447963 ?auto_447964 ) ( ON ?auto_447962 ?auto_447963 ) ( ON ?auto_447961 ?auto_447962 ) ( CLEAR ?auto_447959 ) ( ON ?auto_447960 ?auto_447961 ) ( CLEAR ?auto_447960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_447954 ?auto_447955 ?auto_447956 ?auto_447957 ?auto_447958 ?auto_447959 ?auto_447960 )
      ( MAKE-14PILE ?auto_447954 ?auto_447955 ?auto_447956 ?auto_447957 ?auto_447958 ?auto_447959 ?auto_447960 ?auto_447961 ?auto_447962 ?auto_447963 ?auto_447964 ?auto_447965 ?auto_447966 ?auto_447967 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_448012 - BLOCK
      ?auto_448013 - BLOCK
      ?auto_448014 - BLOCK
      ?auto_448015 - BLOCK
      ?auto_448016 - BLOCK
      ?auto_448017 - BLOCK
      ?auto_448018 - BLOCK
      ?auto_448019 - BLOCK
      ?auto_448020 - BLOCK
      ?auto_448021 - BLOCK
      ?auto_448022 - BLOCK
      ?auto_448023 - BLOCK
      ?auto_448024 - BLOCK
      ?auto_448025 - BLOCK
    )
    :vars
    (
      ?auto_448026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448025 ?auto_448026 ) ( ON-TABLE ?auto_448012 ) ( ON ?auto_448013 ?auto_448012 ) ( ON ?auto_448014 ?auto_448013 ) ( ON ?auto_448015 ?auto_448014 ) ( ON ?auto_448016 ?auto_448015 ) ( not ( = ?auto_448012 ?auto_448013 ) ) ( not ( = ?auto_448012 ?auto_448014 ) ) ( not ( = ?auto_448012 ?auto_448015 ) ) ( not ( = ?auto_448012 ?auto_448016 ) ) ( not ( = ?auto_448012 ?auto_448017 ) ) ( not ( = ?auto_448012 ?auto_448018 ) ) ( not ( = ?auto_448012 ?auto_448019 ) ) ( not ( = ?auto_448012 ?auto_448020 ) ) ( not ( = ?auto_448012 ?auto_448021 ) ) ( not ( = ?auto_448012 ?auto_448022 ) ) ( not ( = ?auto_448012 ?auto_448023 ) ) ( not ( = ?auto_448012 ?auto_448024 ) ) ( not ( = ?auto_448012 ?auto_448025 ) ) ( not ( = ?auto_448012 ?auto_448026 ) ) ( not ( = ?auto_448013 ?auto_448014 ) ) ( not ( = ?auto_448013 ?auto_448015 ) ) ( not ( = ?auto_448013 ?auto_448016 ) ) ( not ( = ?auto_448013 ?auto_448017 ) ) ( not ( = ?auto_448013 ?auto_448018 ) ) ( not ( = ?auto_448013 ?auto_448019 ) ) ( not ( = ?auto_448013 ?auto_448020 ) ) ( not ( = ?auto_448013 ?auto_448021 ) ) ( not ( = ?auto_448013 ?auto_448022 ) ) ( not ( = ?auto_448013 ?auto_448023 ) ) ( not ( = ?auto_448013 ?auto_448024 ) ) ( not ( = ?auto_448013 ?auto_448025 ) ) ( not ( = ?auto_448013 ?auto_448026 ) ) ( not ( = ?auto_448014 ?auto_448015 ) ) ( not ( = ?auto_448014 ?auto_448016 ) ) ( not ( = ?auto_448014 ?auto_448017 ) ) ( not ( = ?auto_448014 ?auto_448018 ) ) ( not ( = ?auto_448014 ?auto_448019 ) ) ( not ( = ?auto_448014 ?auto_448020 ) ) ( not ( = ?auto_448014 ?auto_448021 ) ) ( not ( = ?auto_448014 ?auto_448022 ) ) ( not ( = ?auto_448014 ?auto_448023 ) ) ( not ( = ?auto_448014 ?auto_448024 ) ) ( not ( = ?auto_448014 ?auto_448025 ) ) ( not ( = ?auto_448014 ?auto_448026 ) ) ( not ( = ?auto_448015 ?auto_448016 ) ) ( not ( = ?auto_448015 ?auto_448017 ) ) ( not ( = ?auto_448015 ?auto_448018 ) ) ( not ( = ?auto_448015 ?auto_448019 ) ) ( not ( = ?auto_448015 ?auto_448020 ) ) ( not ( = ?auto_448015 ?auto_448021 ) ) ( not ( = ?auto_448015 ?auto_448022 ) ) ( not ( = ?auto_448015 ?auto_448023 ) ) ( not ( = ?auto_448015 ?auto_448024 ) ) ( not ( = ?auto_448015 ?auto_448025 ) ) ( not ( = ?auto_448015 ?auto_448026 ) ) ( not ( = ?auto_448016 ?auto_448017 ) ) ( not ( = ?auto_448016 ?auto_448018 ) ) ( not ( = ?auto_448016 ?auto_448019 ) ) ( not ( = ?auto_448016 ?auto_448020 ) ) ( not ( = ?auto_448016 ?auto_448021 ) ) ( not ( = ?auto_448016 ?auto_448022 ) ) ( not ( = ?auto_448016 ?auto_448023 ) ) ( not ( = ?auto_448016 ?auto_448024 ) ) ( not ( = ?auto_448016 ?auto_448025 ) ) ( not ( = ?auto_448016 ?auto_448026 ) ) ( not ( = ?auto_448017 ?auto_448018 ) ) ( not ( = ?auto_448017 ?auto_448019 ) ) ( not ( = ?auto_448017 ?auto_448020 ) ) ( not ( = ?auto_448017 ?auto_448021 ) ) ( not ( = ?auto_448017 ?auto_448022 ) ) ( not ( = ?auto_448017 ?auto_448023 ) ) ( not ( = ?auto_448017 ?auto_448024 ) ) ( not ( = ?auto_448017 ?auto_448025 ) ) ( not ( = ?auto_448017 ?auto_448026 ) ) ( not ( = ?auto_448018 ?auto_448019 ) ) ( not ( = ?auto_448018 ?auto_448020 ) ) ( not ( = ?auto_448018 ?auto_448021 ) ) ( not ( = ?auto_448018 ?auto_448022 ) ) ( not ( = ?auto_448018 ?auto_448023 ) ) ( not ( = ?auto_448018 ?auto_448024 ) ) ( not ( = ?auto_448018 ?auto_448025 ) ) ( not ( = ?auto_448018 ?auto_448026 ) ) ( not ( = ?auto_448019 ?auto_448020 ) ) ( not ( = ?auto_448019 ?auto_448021 ) ) ( not ( = ?auto_448019 ?auto_448022 ) ) ( not ( = ?auto_448019 ?auto_448023 ) ) ( not ( = ?auto_448019 ?auto_448024 ) ) ( not ( = ?auto_448019 ?auto_448025 ) ) ( not ( = ?auto_448019 ?auto_448026 ) ) ( not ( = ?auto_448020 ?auto_448021 ) ) ( not ( = ?auto_448020 ?auto_448022 ) ) ( not ( = ?auto_448020 ?auto_448023 ) ) ( not ( = ?auto_448020 ?auto_448024 ) ) ( not ( = ?auto_448020 ?auto_448025 ) ) ( not ( = ?auto_448020 ?auto_448026 ) ) ( not ( = ?auto_448021 ?auto_448022 ) ) ( not ( = ?auto_448021 ?auto_448023 ) ) ( not ( = ?auto_448021 ?auto_448024 ) ) ( not ( = ?auto_448021 ?auto_448025 ) ) ( not ( = ?auto_448021 ?auto_448026 ) ) ( not ( = ?auto_448022 ?auto_448023 ) ) ( not ( = ?auto_448022 ?auto_448024 ) ) ( not ( = ?auto_448022 ?auto_448025 ) ) ( not ( = ?auto_448022 ?auto_448026 ) ) ( not ( = ?auto_448023 ?auto_448024 ) ) ( not ( = ?auto_448023 ?auto_448025 ) ) ( not ( = ?auto_448023 ?auto_448026 ) ) ( not ( = ?auto_448024 ?auto_448025 ) ) ( not ( = ?auto_448024 ?auto_448026 ) ) ( not ( = ?auto_448025 ?auto_448026 ) ) ( ON ?auto_448024 ?auto_448025 ) ( ON ?auto_448023 ?auto_448024 ) ( ON ?auto_448022 ?auto_448023 ) ( ON ?auto_448021 ?auto_448022 ) ( ON ?auto_448020 ?auto_448021 ) ( ON ?auto_448019 ?auto_448020 ) ( ON ?auto_448018 ?auto_448019 ) ( CLEAR ?auto_448016 ) ( ON ?auto_448017 ?auto_448018 ) ( CLEAR ?auto_448017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_448012 ?auto_448013 ?auto_448014 ?auto_448015 ?auto_448016 ?auto_448017 )
      ( MAKE-14PILE ?auto_448012 ?auto_448013 ?auto_448014 ?auto_448015 ?auto_448016 ?auto_448017 ?auto_448018 ?auto_448019 ?auto_448020 ?auto_448021 ?auto_448022 ?auto_448023 ?auto_448024 ?auto_448025 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_448070 - BLOCK
      ?auto_448071 - BLOCK
      ?auto_448072 - BLOCK
      ?auto_448073 - BLOCK
      ?auto_448074 - BLOCK
      ?auto_448075 - BLOCK
      ?auto_448076 - BLOCK
      ?auto_448077 - BLOCK
      ?auto_448078 - BLOCK
      ?auto_448079 - BLOCK
      ?auto_448080 - BLOCK
      ?auto_448081 - BLOCK
      ?auto_448082 - BLOCK
      ?auto_448083 - BLOCK
    )
    :vars
    (
      ?auto_448084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448083 ?auto_448084 ) ( ON-TABLE ?auto_448070 ) ( ON ?auto_448071 ?auto_448070 ) ( ON ?auto_448072 ?auto_448071 ) ( ON ?auto_448073 ?auto_448072 ) ( not ( = ?auto_448070 ?auto_448071 ) ) ( not ( = ?auto_448070 ?auto_448072 ) ) ( not ( = ?auto_448070 ?auto_448073 ) ) ( not ( = ?auto_448070 ?auto_448074 ) ) ( not ( = ?auto_448070 ?auto_448075 ) ) ( not ( = ?auto_448070 ?auto_448076 ) ) ( not ( = ?auto_448070 ?auto_448077 ) ) ( not ( = ?auto_448070 ?auto_448078 ) ) ( not ( = ?auto_448070 ?auto_448079 ) ) ( not ( = ?auto_448070 ?auto_448080 ) ) ( not ( = ?auto_448070 ?auto_448081 ) ) ( not ( = ?auto_448070 ?auto_448082 ) ) ( not ( = ?auto_448070 ?auto_448083 ) ) ( not ( = ?auto_448070 ?auto_448084 ) ) ( not ( = ?auto_448071 ?auto_448072 ) ) ( not ( = ?auto_448071 ?auto_448073 ) ) ( not ( = ?auto_448071 ?auto_448074 ) ) ( not ( = ?auto_448071 ?auto_448075 ) ) ( not ( = ?auto_448071 ?auto_448076 ) ) ( not ( = ?auto_448071 ?auto_448077 ) ) ( not ( = ?auto_448071 ?auto_448078 ) ) ( not ( = ?auto_448071 ?auto_448079 ) ) ( not ( = ?auto_448071 ?auto_448080 ) ) ( not ( = ?auto_448071 ?auto_448081 ) ) ( not ( = ?auto_448071 ?auto_448082 ) ) ( not ( = ?auto_448071 ?auto_448083 ) ) ( not ( = ?auto_448071 ?auto_448084 ) ) ( not ( = ?auto_448072 ?auto_448073 ) ) ( not ( = ?auto_448072 ?auto_448074 ) ) ( not ( = ?auto_448072 ?auto_448075 ) ) ( not ( = ?auto_448072 ?auto_448076 ) ) ( not ( = ?auto_448072 ?auto_448077 ) ) ( not ( = ?auto_448072 ?auto_448078 ) ) ( not ( = ?auto_448072 ?auto_448079 ) ) ( not ( = ?auto_448072 ?auto_448080 ) ) ( not ( = ?auto_448072 ?auto_448081 ) ) ( not ( = ?auto_448072 ?auto_448082 ) ) ( not ( = ?auto_448072 ?auto_448083 ) ) ( not ( = ?auto_448072 ?auto_448084 ) ) ( not ( = ?auto_448073 ?auto_448074 ) ) ( not ( = ?auto_448073 ?auto_448075 ) ) ( not ( = ?auto_448073 ?auto_448076 ) ) ( not ( = ?auto_448073 ?auto_448077 ) ) ( not ( = ?auto_448073 ?auto_448078 ) ) ( not ( = ?auto_448073 ?auto_448079 ) ) ( not ( = ?auto_448073 ?auto_448080 ) ) ( not ( = ?auto_448073 ?auto_448081 ) ) ( not ( = ?auto_448073 ?auto_448082 ) ) ( not ( = ?auto_448073 ?auto_448083 ) ) ( not ( = ?auto_448073 ?auto_448084 ) ) ( not ( = ?auto_448074 ?auto_448075 ) ) ( not ( = ?auto_448074 ?auto_448076 ) ) ( not ( = ?auto_448074 ?auto_448077 ) ) ( not ( = ?auto_448074 ?auto_448078 ) ) ( not ( = ?auto_448074 ?auto_448079 ) ) ( not ( = ?auto_448074 ?auto_448080 ) ) ( not ( = ?auto_448074 ?auto_448081 ) ) ( not ( = ?auto_448074 ?auto_448082 ) ) ( not ( = ?auto_448074 ?auto_448083 ) ) ( not ( = ?auto_448074 ?auto_448084 ) ) ( not ( = ?auto_448075 ?auto_448076 ) ) ( not ( = ?auto_448075 ?auto_448077 ) ) ( not ( = ?auto_448075 ?auto_448078 ) ) ( not ( = ?auto_448075 ?auto_448079 ) ) ( not ( = ?auto_448075 ?auto_448080 ) ) ( not ( = ?auto_448075 ?auto_448081 ) ) ( not ( = ?auto_448075 ?auto_448082 ) ) ( not ( = ?auto_448075 ?auto_448083 ) ) ( not ( = ?auto_448075 ?auto_448084 ) ) ( not ( = ?auto_448076 ?auto_448077 ) ) ( not ( = ?auto_448076 ?auto_448078 ) ) ( not ( = ?auto_448076 ?auto_448079 ) ) ( not ( = ?auto_448076 ?auto_448080 ) ) ( not ( = ?auto_448076 ?auto_448081 ) ) ( not ( = ?auto_448076 ?auto_448082 ) ) ( not ( = ?auto_448076 ?auto_448083 ) ) ( not ( = ?auto_448076 ?auto_448084 ) ) ( not ( = ?auto_448077 ?auto_448078 ) ) ( not ( = ?auto_448077 ?auto_448079 ) ) ( not ( = ?auto_448077 ?auto_448080 ) ) ( not ( = ?auto_448077 ?auto_448081 ) ) ( not ( = ?auto_448077 ?auto_448082 ) ) ( not ( = ?auto_448077 ?auto_448083 ) ) ( not ( = ?auto_448077 ?auto_448084 ) ) ( not ( = ?auto_448078 ?auto_448079 ) ) ( not ( = ?auto_448078 ?auto_448080 ) ) ( not ( = ?auto_448078 ?auto_448081 ) ) ( not ( = ?auto_448078 ?auto_448082 ) ) ( not ( = ?auto_448078 ?auto_448083 ) ) ( not ( = ?auto_448078 ?auto_448084 ) ) ( not ( = ?auto_448079 ?auto_448080 ) ) ( not ( = ?auto_448079 ?auto_448081 ) ) ( not ( = ?auto_448079 ?auto_448082 ) ) ( not ( = ?auto_448079 ?auto_448083 ) ) ( not ( = ?auto_448079 ?auto_448084 ) ) ( not ( = ?auto_448080 ?auto_448081 ) ) ( not ( = ?auto_448080 ?auto_448082 ) ) ( not ( = ?auto_448080 ?auto_448083 ) ) ( not ( = ?auto_448080 ?auto_448084 ) ) ( not ( = ?auto_448081 ?auto_448082 ) ) ( not ( = ?auto_448081 ?auto_448083 ) ) ( not ( = ?auto_448081 ?auto_448084 ) ) ( not ( = ?auto_448082 ?auto_448083 ) ) ( not ( = ?auto_448082 ?auto_448084 ) ) ( not ( = ?auto_448083 ?auto_448084 ) ) ( ON ?auto_448082 ?auto_448083 ) ( ON ?auto_448081 ?auto_448082 ) ( ON ?auto_448080 ?auto_448081 ) ( ON ?auto_448079 ?auto_448080 ) ( ON ?auto_448078 ?auto_448079 ) ( ON ?auto_448077 ?auto_448078 ) ( ON ?auto_448076 ?auto_448077 ) ( ON ?auto_448075 ?auto_448076 ) ( CLEAR ?auto_448073 ) ( ON ?auto_448074 ?auto_448075 ) ( CLEAR ?auto_448074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_448070 ?auto_448071 ?auto_448072 ?auto_448073 ?auto_448074 )
      ( MAKE-14PILE ?auto_448070 ?auto_448071 ?auto_448072 ?auto_448073 ?auto_448074 ?auto_448075 ?auto_448076 ?auto_448077 ?auto_448078 ?auto_448079 ?auto_448080 ?auto_448081 ?auto_448082 ?auto_448083 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_448128 - BLOCK
      ?auto_448129 - BLOCK
      ?auto_448130 - BLOCK
      ?auto_448131 - BLOCK
      ?auto_448132 - BLOCK
      ?auto_448133 - BLOCK
      ?auto_448134 - BLOCK
      ?auto_448135 - BLOCK
      ?auto_448136 - BLOCK
      ?auto_448137 - BLOCK
      ?auto_448138 - BLOCK
      ?auto_448139 - BLOCK
      ?auto_448140 - BLOCK
      ?auto_448141 - BLOCK
    )
    :vars
    (
      ?auto_448142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448141 ?auto_448142 ) ( ON-TABLE ?auto_448128 ) ( ON ?auto_448129 ?auto_448128 ) ( ON ?auto_448130 ?auto_448129 ) ( not ( = ?auto_448128 ?auto_448129 ) ) ( not ( = ?auto_448128 ?auto_448130 ) ) ( not ( = ?auto_448128 ?auto_448131 ) ) ( not ( = ?auto_448128 ?auto_448132 ) ) ( not ( = ?auto_448128 ?auto_448133 ) ) ( not ( = ?auto_448128 ?auto_448134 ) ) ( not ( = ?auto_448128 ?auto_448135 ) ) ( not ( = ?auto_448128 ?auto_448136 ) ) ( not ( = ?auto_448128 ?auto_448137 ) ) ( not ( = ?auto_448128 ?auto_448138 ) ) ( not ( = ?auto_448128 ?auto_448139 ) ) ( not ( = ?auto_448128 ?auto_448140 ) ) ( not ( = ?auto_448128 ?auto_448141 ) ) ( not ( = ?auto_448128 ?auto_448142 ) ) ( not ( = ?auto_448129 ?auto_448130 ) ) ( not ( = ?auto_448129 ?auto_448131 ) ) ( not ( = ?auto_448129 ?auto_448132 ) ) ( not ( = ?auto_448129 ?auto_448133 ) ) ( not ( = ?auto_448129 ?auto_448134 ) ) ( not ( = ?auto_448129 ?auto_448135 ) ) ( not ( = ?auto_448129 ?auto_448136 ) ) ( not ( = ?auto_448129 ?auto_448137 ) ) ( not ( = ?auto_448129 ?auto_448138 ) ) ( not ( = ?auto_448129 ?auto_448139 ) ) ( not ( = ?auto_448129 ?auto_448140 ) ) ( not ( = ?auto_448129 ?auto_448141 ) ) ( not ( = ?auto_448129 ?auto_448142 ) ) ( not ( = ?auto_448130 ?auto_448131 ) ) ( not ( = ?auto_448130 ?auto_448132 ) ) ( not ( = ?auto_448130 ?auto_448133 ) ) ( not ( = ?auto_448130 ?auto_448134 ) ) ( not ( = ?auto_448130 ?auto_448135 ) ) ( not ( = ?auto_448130 ?auto_448136 ) ) ( not ( = ?auto_448130 ?auto_448137 ) ) ( not ( = ?auto_448130 ?auto_448138 ) ) ( not ( = ?auto_448130 ?auto_448139 ) ) ( not ( = ?auto_448130 ?auto_448140 ) ) ( not ( = ?auto_448130 ?auto_448141 ) ) ( not ( = ?auto_448130 ?auto_448142 ) ) ( not ( = ?auto_448131 ?auto_448132 ) ) ( not ( = ?auto_448131 ?auto_448133 ) ) ( not ( = ?auto_448131 ?auto_448134 ) ) ( not ( = ?auto_448131 ?auto_448135 ) ) ( not ( = ?auto_448131 ?auto_448136 ) ) ( not ( = ?auto_448131 ?auto_448137 ) ) ( not ( = ?auto_448131 ?auto_448138 ) ) ( not ( = ?auto_448131 ?auto_448139 ) ) ( not ( = ?auto_448131 ?auto_448140 ) ) ( not ( = ?auto_448131 ?auto_448141 ) ) ( not ( = ?auto_448131 ?auto_448142 ) ) ( not ( = ?auto_448132 ?auto_448133 ) ) ( not ( = ?auto_448132 ?auto_448134 ) ) ( not ( = ?auto_448132 ?auto_448135 ) ) ( not ( = ?auto_448132 ?auto_448136 ) ) ( not ( = ?auto_448132 ?auto_448137 ) ) ( not ( = ?auto_448132 ?auto_448138 ) ) ( not ( = ?auto_448132 ?auto_448139 ) ) ( not ( = ?auto_448132 ?auto_448140 ) ) ( not ( = ?auto_448132 ?auto_448141 ) ) ( not ( = ?auto_448132 ?auto_448142 ) ) ( not ( = ?auto_448133 ?auto_448134 ) ) ( not ( = ?auto_448133 ?auto_448135 ) ) ( not ( = ?auto_448133 ?auto_448136 ) ) ( not ( = ?auto_448133 ?auto_448137 ) ) ( not ( = ?auto_448133 ?auto_448138 ) ) ( not ( = ?auto_448133 ?auto_448139 ) ) ( not ( = ?auto_448133 ?auto_448140 ) ) ( not ( = ?auto_448133 ?auto_448141 ) ) ( not ( = ?auto_448133 ?auto_448142 ) ) ( not ( = ?auto_448134 ?auto_448135 ) ) ( not ( = ?auto_448134 ?auto_448136 ) ) ( not ( = ?auto_448134 ?auto_448137 ) ) ( not ( = ?auto_448134 ?auto_448138 ) ) ( not ( = ?auto_448134 ?auto_448139 ) ) ( not ( = ?auto_448134 ?auto_448140 ) ) ( not ( = ?auto_448134 ?auto_448141 ) ) ( not ( = ?auto_448134 ?auto_448142 ) ) ( not ( = ?auto_448135 ?auto_448136 ) ) ( not ( = ?auto_448135 ?auto_448137 ) ) ( not ( = ?auto_448135 ?auto_448138 ) ) ( not ( = ?auto_448135 ?auto_448139 ) ) ( not ( = ?auto_448135 ?auto_448140 ) ) ( not ( = ?auto_448135 ?auto_448141 ) ) ( not ( = ?auto_448135 ?auto_448142 ) ) ( not ( = ?auto_448136 ?auto_448137 ) ) ( not ( = ?auto_448136 ?auto_448138 ) ) ( not ( = ?auto_448136 ?auto_448139 ) ) ( not ( = ?auto_448136 ?auto_448140 ) ) ( not ( = ?auto_448136 ?auto_448141 ) ) ( not ( = ?auto_448136 ?auto_448142 ) ) ( not ( = ?auto_448137 ?auto_448138 ) ) ( not ( = ?auto_448137 ?auto_448139 ) ) ( not ( = ?auto_448137 ?auto_448140 ) ) ( not ( = ?auto_448137 ?auto_448141 ) ) ( not ( = ?auto_448137 ?auto_448142 ) ) ( not ( = ?auto_448138 ?auto_448139 ) ) ( not ( = ?auto_448138 ?auto_448140 ) ) ( not ( = ?auto_448138 ?auto_448141 ) ) ( not ( = ?auto_448138 ?auto_448142 ) ) ( not ( = ?auto_448139 ?auto_448140 ) ) ( not ( = ?auto_448139 ?auto_448141 ) ) ( not ( = ?auto_448139 ?auto_448142 ) ) ( not ( = ?auto_448140 ?auto_448141 ) ) ( not ( = ?auto_448140 ?auto_448142 ) ) ( not ( = ?auto_448141 ?auto_448142 ) ) ( ON ?auto_448140 ?auto_448141 ) ( ON ?auto_448139 ?auto_448140 ) ( ON ?auto_448138 ?auto_448139 ) ( ON ?auto_448137 ?auto_448138 ) ( ON ?auto_448136 ?auto_448137 ) ( ON ?auto_448135 ?auto_448136 ) ( ON ?auto_448134 ?auto_448135 ) ( ON ?auto_448133 ?auto_448134 ) ( ON ?auto_448132 ?auto_448133 ) ( CLEAR ?auto_448130 ) ( ON ?auto_448131 ?auto_448132 ) ( CLEAR ?auto_448131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_448128 ?auto_448129 ?auto_448130 ?auto_448131 )
      ( MAKE-14PILE ?auto_448128 ?auto_448129 ?auto_448130 ?auto_448131 ?auto_448132 ?auto_448133 ?auto_448134 ?auto_448135 ?auto_448136 ?auto_448137 ?auto_448138 ?auto_448139 ?auto_448140 ?auto_448141 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_448186 - BLOCK
      ?auto_448187 - BLOCK
      ?auto_448188 - BLOCK
      ?auto_448189 - BLOCK
      ?auto_448190 - BLOCK
      ?auto_448191 - BLOCK
      ?auto_448192 - BLOCK
      ?auto_448193 - BLOCK
      ?auto_448194 - BLOCK
      ?auto_448195 - BLOCK
      ?auto_448196 - BLOCK
      ?auto_448197 - BLOCK
      ?auto_448198 - BLOCK
      ?auto_448199 - BLOCK
    )
    :vars
    (
      ?auto_448200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448199 ?auto_448200 ) ( ON-TABLE ?auto_448186 ) ( ON ?auto_448187 ?auto_448186 ) ( not ( = ?auto_448186 ?auto_448187 ) ) ( not ( = ?auto_448186 ?auto_448188 ) ) ( not ( = ?auto_448186 ?auto_448189 ) ) ( not ( = ?auto_448186 ?auto_448190 ) ) ( not ( = ?auto_448186 ?auto_448191 ) ) ( not ( = ?auto_448186 ?auto_448192 ) ) ( not ( = ?auto_448186 ?auto_448193 ) ) ( not ( = ?auto_448186 ?auto_448194 ) ) ( not ( = ?auto_448186 ?auto_448195 ) ) ( not ( = ?auto_448186 ?auto_448196 ) ) ( not ( = ?auto_448186 ?auto_448197 ) ) ( not ( = ?auto_448186 ?auto_448198 ) ) ( not ( = ?auto_448186 ?auto_448199 ) ) ( not ( = ?auto_448186 ?auto_448200 ) ) ( not ( = ?auto_448187 ?auto_448188 ) ) ( not ( = ?auto_448187 ?auto_448189 ) ) ( not ( = ?auto_448187 ?auto_448190 ) ) ( not ( = ?auto_448187 ?auto_448191 ) ) ( not ( = ?auto_448187 ?auto_448192 ) ) ( not ( = ?auto_448187 ?auto_448193 ) ) ( not ( = ?auto_448187 ?auto_448194 ) ) ( not ( = ?auto_448187 ?auto_448195 ) ) ( not ( = ?auto_448187 ?auto_448196 ) ) ( not ( = ?auto_448187 ?auto_448197 ) ) ( not ( = ?auto_448187 ?auto_448198 ) ) ( not ( = ?auto_448187 ?auto_448199 ) ) ( not ( = ?auto_448187 ?auto_448200 ) ) ( not ( = ?auto_448188 ?auto_448189 ) ) ( not ( = ?auto_448188 ?auto_448190 ) ) ( not ( = ?auto_448188 ?auto_448191 ) ) ( not ( = ?auto_448188 ?auto_448192 ) ) ( not ( = ?auto_448188 ?auto_448193 ) ) ( not ( = ?auto_448188 ?auto_448194 ) ) ( not ( = ?auto_448188 ?auto_448195 ) ) ( not ( = ?auto_448188 ?auto_448196 ) ) ( not ( = ?auto_448188 ?auto_448197 ) ) ( not ( = ?auto_448188 ?auto_448198 ) ) ( not ( = ?auto_448188 ?auto_448199 ) ) ( not ( = ?auto_448188 ?auto_448200 ) ) ( not ( = ?auto_448189 ?auto_448190 ) ) ( not ( = ?auto_448189 ?auto_448191 ) ) ( not ( = ?auto_448189 ?auto_448192 ) ) ( not ( = ?auto_448189 ?auto_448193 ) ) ( not ( = ?auto_448189 ?auto_448194 ) ) ( not ( = ?auto_448189 ?auto_448195 ) ) ( not ( = ?auto_448189 ?auto_448196 ) ) ( not ( = ?auto_448189 ?auto_448197 ) ) ( not ( = ?auto_448189 ?auto_448198 ) ) ( not ( = ?auto_448189 ?auto_448199 ) ) ( not ( = ?auto_448189 ?auto_448200 ) ) ( not ( = ?auto_448190 ?auto_448191 ) ) ( not ( = ?auto_448190 ?auto_448192 ) ) ( not ( = ?auto_448190 ?auto_448193 ) ) ( not ( = ?auto_448190 ?auto_448194 ) ) ( not ( = ?auto_448190 ?auto_448195 ) ) ( not ( = ?auto_448190 ?auto_448196 ) ) ( not ( = ?auto_448190 ?auto_448197 ) ) ( not ( = ?auto_448190 ?auto_448198 ) ) ( not ( = ?auto_448190 ?auto_448199 ) ) ( not ( = ?auto_448190 ?auto_448200 ) ) ( not ( = ?auto_448191 ?auto_448192 ) ) ( not ( = ?auto_448191 ?auto_448193 ) ) ( not ( = ?auto_448191 ?auto_448194 ) ) ( not ( = ?auto_448191 ?auto_448195 ) ) ( not ( = ?auto_448191 ?auto_448196 ) ) ( not ( = ?auto_448191 ?auto_448197 ) ) ( not ( = ?auto_448191 ?auto_448198 ) ) ( not ( = ?auto_448191 ?auto_448199 ) ) ( not ( = ?auto_448191 ?auto_448200 ) ) ( not ( = ?auto_448192 ?auto_448193 ) ) ( not ( = ?auto_448192 ?auto_448194 ) ) ( not ( = ?auto_448192 ?auto_448195 ) ) ( not ( = ?auto_448192 ?auto_448196 ) ) ( not ( = ?auto_448192 ?auto_448197 ) ) ( not ( = ?auto_448192 ?auto_448198 ) ) ( not ( = ?auto_448192 ?auto_448199 ) ) ( not ( = ?auto_448192 ?auto_448200 ) ) ( not ( = ?auto_448193 ?auto_448194 ) ) ( not ( = ?auto_448193 ?auto_448195 ) ) ( not ( = ?auto_448193 ?auto_448196 ) ) ( not ( = ?auto_448193 ?auto_448197 ) ) ( not ( = ?auto_448193 ?auto_448198 ) ) ( not ( = ?auto_448193 ?auto_448199 ) ) ( not ( = ?auto_448193 ?auto_448200 ) ) ( not ( = ?auto_448194 ?auto_448195 ) ) ( not ( = ?auto_448194 ?auto_448196 ) ) ( not ( = ?auto_448194 ?auto_448197 ) ) ( not ( = ?auto_448194 ?auto_448198 ) ) ( not ( = ?auto_448194 ?auto_448199 ) ) ( not ( = ?auto_448194 ?auto_448200 ) ) ( not ( = ?auto_448195 ?auto_448196 ) ) ( not ( = ?auto_448195 ?auto_448197 ) ) ( not ( = ?auto_448195 ?auto_448198 ) ) ( not ( = ?auto_448195 ?auto_448199 ) ) ( not ( = ?auto_448195 ?auto_448200 ) ) ( not ( = ?auto_448196 ?auto_448197 ) ) ( not ( = ?auto_448196 ?auto_448198 ) ) ( not ( = ?auto_448196 ?auto_448199 ) ) ( not ( = ?auto_448196 ?auto_448200 ) ) ( not ( = ?auto_448197 ?auto_448198 ) ) ( not ( = ?auto_448197 ?auto_448199 ) ) ( not ( = ?auto_448197 ?auto_448200 ) ) ( not ( = ?auto_448198 ?auto_448199 ) ) ( not ( = ?auto_448198 ?auto_448200 ) ) ( not ( = ?auto_448199 ?auto_448200 ) ) ( ON ?auto_448198 ?auto_448199 ) ( ON ?auto_448197 ?auto_448198 ) ( ON ?auto_448196 ?auto_448197 ) ( ON ?auto_448195 ?auto_448196 ) ( ON ?auto_448194 ?auto_448195 ) ( ON ?auto_448193 ?auto_448194 ) ( ON ?auto_448192 ?auto_448193 ) ( ON ?auto_448191 ?auto_448192 ) ( ON ?auto_448190 ?auto_448191 ) ( ON ?auto_448189 ?auto_448190 ) ( CLEAR ?auto_448187 ) ( ON ?auto_448188 ?auto_448189 ) ( CLEAR ?auto_448188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_448186 ?auto_448187 ?auto_448188 )
      ( MAKE-14PILE ?auto_448186 ?auto_448187 ?auto_448188 ?auto_448189 ?auto_448190 ?auto_448191 ?auto_448192 ?auto_448193 ?auto_448194 ?auto_448195 ?auto_448196 ?auto_448197 ?auto_448198 ?auto_448199 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_448244 - BLOCK
      ?auto_448245 - BLOCK
      ?auto_448246 - BLOCK
      ?auto_448247 - BLOCK
      ?auto_448248 - BLOCK
      ?auto_448249 - BLOCK
      ?auto_448250 - BLOCK
      ?auto_448251 - BLOCK
      ?auto_448252 - BLOCK
      ?auto_448253 - BLOCK
      ?auto_448254 - BLOCK
      ?auto_448255 - BLOCK
      ?auto_448256 - BLOCK
      ?auto_448257 - BLOCK
    )
    :vars
    (
      ?auto_448258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448257 ?auto_448258 ) ( ON-TABLE ?auto_448244 ) ( not ( = ?auto_448244 ?auto_448245 ) ) ( not ( = ?auto_448244 ?auto_448246 ) ) ( not ( = ?auto_448244 ?auto_448247 ) ) ( not ( = ?auto_448244 ?auto_448248 ) ) ( not ( = ?auto_448244 ?auto_448249 ) ) ( not ( = ?auto_448244 ?auto_448250 ) ) ( not ( = ?auto_448244 ?auto_448251 ) ) ( not ( = ?auto_448244 ?auto_448252 ) ) ( not ( = ?auto_448244 ?auto_448253 ) ) ( not ( = ?auto_448244 ?auto_448254 ) ) ( not ( = ?auto_448244 ?auto_448255 ) ) ( not ( = ?auto_448244 ?auto_448256 ) ) ( not ( = ?auto_448244 ?auto_448257 ) ) ( not ( = ?auto_448244 ?auto_448258 ) ) ( not ( = ?auto_448245 ?auto_448246 ) ) ( not ( = ?auto_448245 ?auto_448247 ) ) ( not ( = ?auto_448245 ?auto_448248 ) ) ( not ( = ?auto_448245 ?auto_448249 ) ) ( not ( = ?auto_448245 ?auto_448250 ) ) ( not ( = ?auto_448245 ?auto_448251 ) ) ( not ( = ?auto_448245 ?auto_448252 ) ) ( not ( = ?auto_448245 ?auto_448253 ) ) ( not ( = ?auto_448245 ?auto_448254 ) ) ( not ( = ?auto_448245 ?auto_448255 ) ) ( not ( = ?auto_448245 ?auto_448256 ) ) ( not ( = ?auto_448245 ?auto_448257 ) ) ( not ( = ?auto_448245 ?auto_448258 ) ) ( not ( = ?auto_448246 ?auto_448247 ) ) ( not ( = ?auto_448246 ?auto_448248 ) ) ( not ( = ?auto_448246 ?auto_448249 ) ) ( not ( = ?auto_448246 ?auto_448250 ) ) ( not ( = ?auto_448246 ?auto_448251 ) ) ( not ( = ?auto_448246 ?auto_448252 ) ) ( not ( = ?auto_448246 ?auto_448253 ) ) ( not ( = ?auto_448246 ?auto_448254 ) ) ( not ( = ?auto_448246 ?auto_448255 ) ) ( not ( = ?auto_448246 ?auto_448256 ) ) ( not ( = ?auto_448246 ?auto_448257 ) ) ( not ( = ?auto_448246 ?auto_448258 ) ) ( not ( = ?auto_448247 ?auto_448248 ) ) ( not ( = ?auto_448247 ?auto_448249 ) ) ( not ( = ?auto_448247 ?auto_448250 ) ) ( not ( = ?auto_448247 ?auto_448251 ) ) ( not ( = ?auto_448247 ?auto_448252 ) ) ( not ( = ?auto_448247 ?auto_448253 ) ) ( not ( = ?auto_448247 ?auto_448254 ) ) ( not ( = ?auto_448247 ?auto_448255 ) ) ( not ( = ?auto_448247 ?auto_448256 ) ) ( not ( = ?auto_448247 ?auto_448257 ) ) ( not ( = ?auto_448247 ?auto_448258 ) ) ( not ( = ?auto_448248 ?auto_448249 ) ) ( not ( = ?auto_448248 ?auto_448250 ) ) ( not ( = ?auto_448248 ?auto_448251 ) ) ( not ( = ?auto_448248 ?auto_448252 ) ) ( not ( = ?auto_448248 ?auto_448253 ) ) ( not ( = ?auto_448248 ?auto_448254 ) ) ( not ( = ?auto_448248 ?auto_448255 ) ) ( not ( = ?auto_448248 ?auto_448256 ) ) ( not ( = ?auto_448248 ?auto_448257 ) ) ( not ( = ?auto_448248 ?auto_448258 ) ) ( not ( = ?auto_448249 ?auto_448250 ) ) ( not ( = ?auto_448249 ?auto_448251 ) ) ( not ( = ?auto_448249 ?auto_448252 ) ) ( not ( = ?auto_448249 ?auto_448253 ) ) ( not ( = ?auto_448249 ?auto_448254 ) ) ( not ( = ?auto_448249 ?auto_448255 ) ) ( not ( = ?auto_448249 ?auto_448256 ) ) ( not ( = ?auto_448249 ?auto_448257 ) ) ( not ( = ?auto_448249 ?auto_448258 ) ) ( not ( = ?auto_448250 ?auto_448251 ) ) ( not ( = ?auto_448250 ?auto_448252 ) ) ( not ( = ?auto_448250 ?auto_448253 ) ) ( not ( = ?auto_448250 ?auto_448254 ) ) ( not ( = ?auto_448250 ?auto_448255 ) ) ( not ( = ?auto_448250 ?auto_448256 ) ) ( not ( = ?auto_448250 ?auto_448257 ) ) ( not ( = ?auto_448250 ?auto_448258 ) ) ( not ( = ?auto_448251 ?auto_448252 ) ) ( not ( = ?auto_448251 ?auto_448253 ) ) ( not ( = ?auto_448251 ?auto_448254 ) ) ( not ( = ?auto_448251 ?auto_448255 ) ) ( not ( = ?auto_448251 ?auto_448256 ) ) ( not ( = ?auto_448251 ?auto_448257 ) ) ( not ( = ?auto_448251 ?auto_448258 ) ) ( not ( = ?auto_448252 ?auto_448253 ) ) ( not ( = ?auto_448252 ?auto_448254 ) ) ( not ( = ?auto_448252 ?auto_448255 ) ) ( not ( = ?auto_448252 ?auto_448256 ) ) ( not ( = ?auto_448252 ?auto_448257 ) ) ( not ( = ?auto_448252 ?auto_448258 ) ) ( not ( = ?auto_448253 ?auto_448254 ) ) ( not ( = ?auto_448253 ?auto_448255 ) ) ( not ( = ?auto_448253 ?auto_448256 ) ) ( not ( = ?auto_448253 ?auto_448257 ) ) ( not ( = ?auto_448253 ?auto_448258 ) ) ( not ( = ?auto_448254 ?auto_448255 ) ) ( not ( = ?auto_448254 ?auto_448256 ) ) ( not ( = ?auto_448254 ?auto_448257 ) ) ( not ( = ?auto_448254 ?auto_448258 ) ) ( not ( = ?auto_448255 ?auto_448256 ) ) ( not ( = ?auto_448255 ?auto_448257 ) ) ( not ( = ?auto_448255 ?auto_448258 ) ) ( not ( = ?auto_448256 ?auto_448257 ) ) ( not ( = ?auto_448256 ?auto_448258 ) ) ( not ( = ?auto_448257 ?auto_448258 ) ) ( ON ?auto_448256 ?auto_448257 ) ( ON ?auto_448255 ?auto_448256 ) ( ON ?auto_448254 ?auto_448255 ) ( ON ?auto_448253 ?auto_448254 ) ( ON ?auto_448252 ?auto_448253 ) ( ON ?auto_448251 ?auto_448252 ) ( ON ?auto_448250 ?auto_448251 ) ( ON ?auto_448249 ?auto_448250 ) ( ON ?auto_448248 ?auto_448249 ) ( ON ?auto_448247 ?auto_448248 ) ( ON ?auto_448246 ?auto_448247 ) ( CLEAR ?auto_448244 ) ( ON ?auto_448245 ?auto_448246 ) ( CLEAR ?auto_448245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_448244 ?auto_448245 )
      ( MAKE-14PILE ?auto_448244 ?auto_448245 ?auto_448246 ?auto_448247 ?auto_448248 ?auto_448249 ?auto_448250 ?auto_448251 ?auto_448252 ?auto_448253 ?auto_448254 ?auto_448255 ?auto_448256 ?auto_448257 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_448302 - BLOCK
      ?auto_448303 - BLOCK
      ?auto_448304 - BLOCK
      ?auto_448305 - BLOCK
      ?auto_448306 - BLOCK
      ?auto_448307 - BLOCK
      ?auto_448308 - BLOCK
      ?auto_448309 - BLOCK
      ?auto_448310 - BLOCK
      ?auto_448311 - BLOCK
      ?auto_448312 - BLOCK
      ?auto_448313 - BLOCK
      ?auto_448314 - BLOCK
      ?auto_448315 - BLOCK
    )
    :vars
    (
      ?auto_448316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448315 ?auto_448316 ) ( not ( = ?auto_448302 ?auto_448303 ) ) ( not ( = ?auto_448302 ?auto_448304 ) ) ( not ( = ?auto_448302 ?auto_448305 ) ) ( not ( = ?auto_448302 ?auto_448306 ) ) ( not ( = ?auto_448302 ?auto_448307 ) ) ( not ( = ?auto_448302 ?auto_448308 ) ) ( not ( = ?auto_448302 ?auto_448309 ) ) ( not ( = ?auto_448302 ?auto_448310 ) ) ( not ( = ?auto_448302 ?auto_448311 ) ) ( not ( = ?auto_448302 ?auto_448312 ) ) ( not ( = ?auto_448302 ?auto_448313 ) ) ( not ( = ?auto_448302 ?auto_448314 ) ) ( not ( = ?auto_448302 ?auto_448315 ) ) ( not ( = ?auto_448302 ?auto_448316 ) ) ( not ( = ?auto_448303 ?auto_448304 ) ) ( not ( = ?auto_448303 ?auto_448305 ) ) ( not ( = ?auto_448303 ?auto_448306 ) ) ( not ( = ?auto_448303 ?auto_448307 ) ) ( not ( = ?auto_448303 ?auto_448308 ) ) ( not ( = ?auto_448303 ?auto_448309 ) ) ( not ( = ?auto_448303 ?auto_448310 ) ) ( not ( = ?auto_448303 ?auto_448311 ) ) ( not ( = ?auto_448303 ?auto_448312 ) ) ( not ( = ?auto_448303 ?auto_448313 ) ) ( not ( = ?auto_448303 ?auto_448314 ) ) ( not ( = ?auto_448303 ?auto_448315 ) ) ( not ( = ?auto_448303 ?auto_448316 ) ) ( not ( = ?auto_448304 ?auto_448305 ) ) ( not ( = ?auto_448304 ?auto_448306 ) ) ( not ( = ?auto_448304 ?auto_448307 ) ) ( not ( = ?auto_448304 ?auto_448308 ) ) ( not ( = ?auto_448304 ?auto_448309 ) ) ( not ( = ?auto_448304 ?auto_448310 ) ) ( not ( = ?auto_448304 ?auto_448311 ) ) ( not ( = ?auto_448304 ?auto_448312 ) ) ( not ( = ?auto_448304 ?auto_448313 ) ) ( not ( = ?auto_448304 ?auto_448314 ) ) ( not ( = ?auto_448304 ?auto_448315 ) ) ( not ( = ?auto_448304 ?auto_448316 ) ) ( not ( = ?auto_448305 ?auto_448306 ) ) ( not ( = ?auto_448305 ?auto_448307 ) ) ( not ( = ?auto_448305 ?auto_448308 ) ) ( not ( = ?auto_448305 ?auto_448309 ) ) ( not ( = ?auto_448305 ?auto_448310 ) ) ( not ( = ?auto_448305 ?auto_448311 ) ) ( not ( = ?auto_448305 ?auto_448312 ) ) ( not ( = ?auto_448305 ?auto_448313 ) ) ( not ( = ?auto_448305 ?auto_448314 ) ) ( not ( = ?auto_448305 ?auto_448315 ) ) ( not ( = ?auto_448305 ?auto_448316 ) ) ( not ( = ?auto_448306 ?auto_448307 ) ) ( not ( = ?auto_448306 ?auto_448308 ) ) ( not ( = ?auto_448306 ?auto_448309 ) ) ( not ( = ?auto_448306 ?auto_448310 ) ) ( not ( = ?auto_448306 ?auto_448311 ) ) ( not ( = ?auto_448306 ?auto_448312 ) ) ( not ( = ?auto_448306 ?auto_448313 ) ) ( not ( = ?auto_448306 ?auto_448314 ) ) ( not ( = ?auto_448306 ?auto_448315 ) ) ( not ( = ?auto_448306 ?auto_448316 ) ) ( not ( = ?auto_448307 ?auto_448308 ) ) ( not ( = ?auto_448307 ?auto_448309 ) ) ( not ( = ?auto_448307 ?auto_448310 ) ) ( not ( = ?auto_448307 ?auto_448311 ) ) ( not ( = ?auto_448307 ?auto_448312 ) ) ( not ( = ?auto_448307 ?auto_448313 ) ) ( not ( = ?auto_448307 ?auto_448314 ) ) ( not ( = ?auto_448307 ?auto_448315 ) ) ( not ( = ?auto_448307 ?auto_448316 ) ) ( not ( = ?auto_448308 ?auto_448309 ) ) ( not ( = ?auto_448308 ?auto_448310 ) ) ( not ( = ?auto_448308 ?auto_448311 ) ) ( not ( = ?auto_448308 ?auto_448312 ) ) ( not ( = ?auto_448308 ?auto_448313 ) ) ( not ( = ?auto_448308 ?auto_448314 ) ) ( not ( = ?auto_448308 ?auto_448315 ) ) ( not ( = ?auto_448308 ?auto_448316 ) ) ( not ( = ?auto_448309 ?auto_448310 ) ) ( not ( = ?auto_448309 ?auto_448311 ) ) ( not ( = ?auto_448309 ?auto_448312 ) ) ( not ( = ?auto_448309 ?auto_448313 ) ) ( not ( = ?auto_448309 ?auto_448314 ) ) ( not ( = ?auto_448309 ?auto_448315 ) ) ( not ( = ?auto_448309 ?auto_448316 ) ) ( not ( = ?auto_448310 ?auto_448311 ) ) ( not ( = ?auto_448310 ?auto_448312 ) ) ( not ( = ?auto_448310 ?auto_448313 ) ) ( not ( = ?auto_448310 ?auto_448314 ) ) ( not ( = ?auto_448310 ?auto_448315 ) ) ( not ( = ?auto_448310 ?auto_448316 ) ) ( not ( = ?auto_448311 ?auto_448312 ) ) ( not ( = ?auto_448311 ?auto_448313 ) ) ( not ( = ?auto_448311 ?auto_448314 ) ) ( not ( = ?auto_448311 ?auto_448315 ) ) ( not ( = ?auto_448311 ?auto_448316 ) ) ( not ( = ?auto_448312 ?auto_448313 ) ) ( not ( = ?auto_448312 ?auto_448314 ) ) ( not ( = ?auto_448312 ?auto_448315 ) ) ( not ( = ?auto_448312 ?auto_448316 ) ) ( not ( = ?auto_448313 ?auto_448314 ) ) ( not ( = ?auto_448313 ?auto_448315 ) ) ( not ( = ?auto_448313 ?auto_448316 ) ) ( not ( = ?auto_448314 ?auto_448315 ) ) ( not ( = ?auto_448314 ?auto_448316 ) ) ( not ( = ?auto_448315 ?auto_448316 ) ) ( ON ?auto_448314 ?auto_448315 ) ( ON ?auto_448313 ?auto_448314 ) ( ON ?auto_448312 ?auto_448313 ) ( ON ?auto_448311 ?auto_448312 ) ( ON ?auto_448310 ?auto_448311 ) ( ON ?auto_448309 ?auto_448310 ) ( ON ?auto_448308 ?auto_448309 ) ( ON ?auto_448307 ?auto_448308 ) ( ON ?auto_448306 ?auto_448307 ) ( ON ?auto_448305 ?auto_448306 ) ( ON ?auto_448304 ?auto_448305 ) ( ON ?auto_448303 ?auto_448304 ) ( ON ?auto_448302 ?auto_448303 ) ( CLEAR ?auto_448302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_448302 )
      ( MAKE-14PILE ?auto_448302 ?auto_448303 ?auto_448304 ?auto_448305 ?auto_448306 ?auto_448307 ?auto_448308 ?auto_448309 ?auto_448310 ?auto_448311 ?auto_448312 ?auto_448313 ?auto_448314 ?auto_448315 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448361 - BLOCK
      ?auto_448362 - BLOCK
      ?auto_448363 - BLOCK
      ?auto_448364 - BLOCK
      ?auto_448365 - BLOCK
      ?auto_448366 - BLOCK
      ?auto_448367 - BLOCK
      ?auto_448368 - BLOCK
      ?auto_448369 - BLOCK
      ?auto_448370 - BLOCK
      ?auto_448371 - BLOCK
      ?auto_448372 - BLOCK
      ?auto_448373 - BLOCK
      ?auto_448374 - BLOCK
      ?auto_448375 - BLOCK
    )
    :vars
    (
      ?auto_448376 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_448374 ) ( ON ?auto_448375 ?auto_448376 ) ( CLEAR ?auto_448375 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_448361 ) ( ON ?auto_448362 ?auto_448361 ) ( ON ?auto_448363 ?auto_448362 ) ( ON ?auto_448364 ?auto_448363 ) ( ON ?auto_448365 ?auto_448364 ) ( ON ?auto_448366 ?auto_448365 ) ( ON ?auto_448367 ?auto_448366 ) ( ON ?auto_448368 ?auto_448367 ) ( ON ?auto_448369 ?auto_448368 ) ( ON ?auto_448370 ?auto_448369 ) ( ON ?auto_448371 ?auto_448370 ) ( ON ?auto_448372 ?auto_448371 ) ( ON ?auto_448373 ?auto_448372 ) ( ON ?auto_448374 ?auto_448373 ) ( not ( = ?auto_448361 ?auto_448362 ) ) ( not ( = ?auto_448361 ?auto_448363 ) ) ( not ( = ?auto_448361 ?auto_448364 ) ) ( not ( = ?auto_448361 ?auto_448365 ) ) ( not ( = ?auto_448361 ?auto_448366 ) ) ( not ( = ?auto_448361 ?auto_448367 ) ) ( not ( = ?auto_448361 ?auto_448368 ) ) ( not ( = ?auto_448361 ?auto_448369 ) ) ( not ( = ?auto_448361 ?auto_448370 ) ) ( not ( = ?auto_448361 ?auto_448371 ) ) ( not ( = ?auto_448361 ?auto_448372 ) ) ( not ( = ?auto_448361 ?auto_448373 ) ) ( not ( = ?auto_448361 ?auto_448374 ) ) ( not ( = ?auto_448361 ?auto_448375 ) ) ( not ( = ?auto_448361 ?auto_448376 ) ) ( not ( = ?auto_448362 ?auto_448363 ) ) ( not ( = ?auto_448362 ?auto_448364 ) ) ( not ( = ?auto_448362 ?auto_448365 ) ) ( not ( = ?auto_448362 ?auto_448366 ) ) ( not ( = ?auto_448362 ?auto_448367 ) ) ( not ( = ?auto_448362 ?auto_448368 ) ) ( not ( = ?auto_448362 ?auto_448369 ) ) ( not ( = ?auto_448362 ?auto_448370 ) ) ( not ( = ?auto_448362 ?auto_448371 ) ) ( not ( = ?auto_448362 ?auto_448372 ) ) ( not ( = ?auto_448362 ?auto_448373 ) ) ( not ( = ?auto_448362 ?auto_448374 ) ) ( not ( = ?auto_448362 ?auto_448375 ) ) ( not ( = ?auto_448362 ?auto_448376 ) ) ( not ( = ?auto_448363 ?auto_448364 ) ) ( not ( = ?auto_448363 ?auto_448365 ) ) ( not ( = ?auto_448363 ?auto_448366 ) ) ( not ( = ?auto_448363 ?auto_448367 ) ) ( not ( = ?auto_448363 ?auto_448368 ) ) ( not ( = ?auto_448363 ?auto_448369 ) ) ( not ( = ?auto_448363 ?auto_448370 ) ) ( not ( = ?auto_448363 ?auto_448371 ) ) ( not ( = ?auto_448363 ?auto_448372 ) ) ( not ( = ?auto_448363 ?auto_448373 ) ) ( not ( = ?auto_448363 ?auto_448374 ) ) ( not ( = ?auto_448363 ?auto_448375 ) ) ( not ( = ?auto_448363 ?auto_448376 ) ) ( not ( = ?auto_448364 ?auto_448365 ) ) ( not ( = ?auto_448364 ?auto_448366 ) ) ( not ( = ?auto_448364 ?auto_448367 ) ) ( not ( = ?auto_448364 ?auto_448368 ) ) ( not ( = ?auto_448364 ?auto_448369 ) ) ( not ( = ?auto_448364 ?auto_448370 ) ) ( not ( = ?auto_448364 ?auto_448371 ) ) ( not ( = ?auto_448364 ?auto_448372 ) ) ( not ( = ?auto_448364 ?auto_448373 ) ) ( not ( = ?auto_448364 ?auto_448374 ) ) ( not ( = ?auto_448364 ?auto_448375 ) ) ( not ( = ?auto_448364 ?auto_448376 ) ) ( not ( = ?auto_448365 ?auto_448366 ) ) ( not ( = ?auto_448365 ?auto_448367 ) ) ( not ( = ?auto_448365 ?auto_448368 ) ) ( not ( = ?auto_448365 ?auto_448369 ) ) ( not ( = ?auto_448365 ?auto_448370 ) ) ( not ( = ?auto_448365 ?auto_448371 ) ) ( not ( = ?auto_448365 ?auto_448372 ) ) ( not ( = ?auto_448365 ?auto_448373 ) ) ( not ( = ?auto_448365 ?auto_448374 ) ) ( not ( = ?auto_448365 ?auto_448375 ) ) ( not ( = ?auto_448365 ?auto_448376 ) ) ( not ( = ?auto_448366 ?auto_448367 ) ) ( not ( = ?auto_448366 ?auto_448368 ) ) ( not ( = ?auto_448366 ?auto_448369 ) ) ( not ( = ?auto_448366 ?auto_448370 ) ) ( not ( = ?auto_448366 ?auto_448371 ) ) ( not ( = ?auto_448366 ?auto_448372 ) ) ( not ( = ?auto_448366 ?auto_448373 ) ) ( not ( = ?auto_448366 ?auto_448374 ) ) ( not ( = ?auto_448366 ?auto_448375 ) ) ( not ( = ?auto_448366 ?auto_448376 ) ) ( not ( = ?auto_448367 ?auto_448368 ) ) ( not ( = ?auto_448367 ?auto_448369 ) ) ( not ( = ?auto_448367 ?auto_448370 ) ) ( not ( = ?auto_448367 ?auto_448371 ) ) ( not ( = ?auto_448367 ?auto_448372 ) ) ( not ( = ?auto_448367 ?auto_448373 ) ) ( not ( = ?auto_448367 ?auto_448374 ) ) ( not ( = ?auto_448367 ?auto_448375 ) ) ( not ( = ?auto_448367 ?auto_448376 ) ) ( not ( = ?auto_448368 ?auto_448369 ) ) ( not ( = ?auto_448368 ?auto_448370 ) ) ( not ( = ?auto_448368 ?auto_448371 ) ) ( not ( = ?auto_448368 ?auto_448372 ) ) ( not ( = ?auto_448368 ?auto_448373 ) ) ( not ( = ?auto_448368 ?auto_448374 ) ) ( not ( = ?auto_448368 ?auto_448375 ) ) ( not ( = ?auto_448368 ?auto_448376 ) ) ( not ( = ?auto_448369 ?auto_448370 ) ) ( not ( = ?auto_448369 ?auto_448371 ) ) ( not ( = ?auto_448369 ?auto_448372 ) ) ( not ( = ?auto_448369 ?auto_448373 ) ) ( not ( = ?auto_448369 ?auto_448374 ) ) ( not ( = ?auto_448369 ?auto_448375 ) ) ( not ( = ?auto_448369 ?auto_448376 ) ) ( not ( = ?auto_448370 ?auto_448371 ) ) ( not ( = ?auto_448370 ?auto_448372 ) ) ( not ( = ?auto_448370 ?auto_448373 ) ) ( not ( = ?auto_448370 ?auto_448374 ) ) ( not ( = ?auto_448370 ?auto_448375 ) ) ( not ( = ?auto_448370 ?auto_448376 ) ) ( not ( = ?auto_448371 ?auto_448372 ) ) ( not ( = ?auto_448371 ?auto_448373 ) ) ( not ( = ?auto_448371 ?auto_448374 ) ) ( not ( = ?auto_448371 ?auto_448375 ) ) ( not ( = ?auto_448371 ?auto_448376 ) ) ( not ( = ?auto_448372 ?auto_448373 ) ) ( not ( = ?auto_448372 ?auto_448374 ) ) ( not ( = ?auto_448372 ?auto_448375 ) ) ( not ( = ?auto_448372 ?auto_448376 ) ) ( not ( = ?auto_448373 ?auto_448374 ) ) ( not ( = ?auto_448373 ?auto_448375 ) ) ( not ( = ?auto_448373 ?auto_448376 ) ) ( not ( = ?auto_448374 ?auto_448375 ) ) ( not ( = ?auto_448374 ?auto_448376 ) ) ( not ( = ?auto_448375 ?auto_448376 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_448375 ?auto_448376 )
      ( !STACK ?auto_448375 ?auto_448374 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448392 - BLOCK
      ?auto_448393 - BLOCK
      ?auto_448394 - BLOCK
      ?auto_448395 - BLOCK
      ?auto_448396 - BLOCK
      ?auto_448397 - BLOCK
      ?auto_448398 - BLOCK
      ?auto_448399 - BLOCK
      ?auto_448400 - BLOCK
      ?auto_448401 - BLOCK
      ?auto_448402 - BLOCK
      ?auto_448403 - BLOCK
      ?auto_448404 - BLOCK
      ?auto_448405 - BLOCK
      ?auto_448406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_448405 ) ( ON-TABLE ?auto_448406 ) ( CLEAR ?auto_448406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_448392 ) ( ON ?auto_448393 ?auto_448392 ) ( ON ?auto_448394 ?auto_448393 ) ( ON ?auto_448395 ?auto_448394 ) ( ON ?auto_448396 ?auto_448395 ) ( ON ?auto_448397 ?auto_448396 ) ( ON ?auto_448398 ?auto_448397 ) ( ON ?auto_448399 ?auto_448398 ) ( ON ?auto_448400 ?auto_448399 ) ( ON ?auto_448401 ?auto_448400 ) ( ON ?auto_448402 ?auto_448401 ) ( ON ?auto_448403 ?auto_448402 ) ( ON ?auto_448404 ?auto_448403 ) ( ON ?auto_448405 ?auto_448404 ) ( not ( = ?auto_448392 ?auto_448393 ) ) ( not ( = ?auto_448392 ?auto_448394 ) ) ( not ( = ?auto_448392 ?auto_448395 ) ) ( not ( = ?auto_448392 ?auto_448396 ) ) ( not ( = ?auto_448392 ?auto_448397 ) ) ( not ( = ?auto_448392 ?auto_448398 ) ) ( not ( = ?auto_448392 ?auto_448399 ) ) ( not ( = ?auto_448392 ?auto_448400 ) ) ( not ( = ?auto_448392 ?auto_448401 ) ) ( not ( = ?auto_448392 ?auto_448402 ) ) ( not ( = ?auto_448392 ?auto_448403 ) ) ( not ( = ?auto_448392 ?auto_448404 ) ) ( not ( = ?auto_448392 ?auto_448405 ) ) ( not ( = ?auto_448392 ?auto_448406 ) ) ( not ( = ?auto_448393 ?auto_448394 ) ) ( not ( = ?auto_448393 ?auto_448395 ) ) ( not ( = ?auto_448393 ?auto_448396 ) ) ( not ( = ?auto_448393 ?auto_448397 ) ) ( not ( = ?auto_448393 ?auto_448398 ) ) ( not ( = ?auto_448393 ?auto_448399 ) ) ( not ( = ?auto_448393 ?auto_448400 ) ) ( not ( = ?auto_448393 ?auto_448401 ) ) ( not ( = ?auto_448393 ?auto_448402 ) ) ( not ( = ?auto_448393 ?auto_448403 ) ) ( not ( = ?auto_448393 ?auto_448404 ) ) ( not ( = ?auto_448393 ?auto_448405 ) ) ( not ( = ?auto_448393 ?auto_448406 ) ) ( not ( = ?auto_448394 ?auto_448395 ) ) ( not ( = ?auto_448394 ?auto_448396 ) ) ( not ( = ?auto_448394 ?auto_448397 ) ) ( not ( = ?auto_448394 ?auto_448398 ) ) ( not ( = ?auto_448394 ?auto_448399 ) ) ( not ( = ?auto_448394 ?auto_448400 ) ) ( not ( = ?auto_448394 ?auto_448401 ) ) ( not ( = ?auto_448394 ?auto_448402 ) ) ( not ( = ?auto_448394 ?auto_448403 ) ) ( not ( = ?auto_448394 ?auto_448404 ) ) ( not ( = ?auto_448394 ?auto_448405 ) ) ( not ( = ?auto_448394 ?auto_448406 ) ) ( not ( = ?auto_448395 ?auto_448396 ) ) ( not ( = ?auto_448395 ?auto_448397 ) ) ( not ( = ?auto_448395 ?auto_448398 ) ) ( not ( = ?auto_448395 ?auto_448399 ) ) ( not ( = ?auto_448395 ?auto_448400 ) ) ( not ( = ?auto_448395 ?auto_448401 ) ) ( not ( = ?auto_448395 ?auto_448402 ) ) ( not ( = ?auto_448395 ?auto_448403 ) ) ( not ( = ?auto_448395 ?auto_448404 ) ) ( not ( = ?auto_448395 ?auto_448405 ) ) ( not ( = ?auto_448395 ?auto_448406 ) ) ( not ( = ?auto_448396 ?auto_448397 ) ) ( not ( = ?auto_448396 ?auto_448398 ) ) ( not ( = ?auto_448396 ?auto_448399 ) ) ( not ( = ?auto_448396 ?auto_448400 ) ) ( not ( = ?auto_448396 ?auto_448401 ) ) ( not ( = ?auto_448396 ?auto_448402 ) ) ( not ( = ?auto_448396 ?auto_448403 ) ) ( not ( = ?auto_448396 ?auto_448404 ) ) ( not ( = ?auto_448396 ?auto_448405 ) ) ( not ( = ?auto_448396 ?auto_448406 ) ) ( not ( = ?auto_448397 ?auto_448398 ) ) ( not ( = ?auto_448397 ?auto_448399 ) ) ( not ( = ?auto_448397 ?auto_448400 ) ) ( not ( = ?auto_448397 ?auto_448401 ) ) ( not ( = ?auto_448397 ?auto_448402 ) ) ( not ( = ?auto_448397 ?auto_448403 ) ) ( not ( = ?auto_448397 ?auto_448404 ) ) ( not ( = ?auto_448397 ?auto_448405 ) ) ( not ( = ?auto_448397 ?auto_448406 ) ) ( not ( = ?auto_448398 ?auto_448399 ) ) ( not ( = ?auto_448398 ?auto_448400 ) ) ( not ( = ?auto_448398 ?auto_448401 ) ) ( not ( = ?auto_448398 ?auto_448402 ) ) ( not ( = ?auto_448398 ?auto_448403 ) ) ( not ( = ?auto_448398 ?auto_448404 ) ) ( not ( = ?auto_448398 ?auto_448405 ) ) ( not ( = ?auto_448398 ?auto_448406 ) ) ( not ( = ?auto_448399 ?auto_448400 ) ) ( not ( = ?auto_448399 ?auto_448401 ) ) ( not ( = ?auto_448399 ?auto_448402 ) ) ( not ( = ?auto_448399 ?auto_448403 ) ) ( not ( = ?auto_448399 ?auto_448404 ) ) ( not ( = ?auto_448399 ?auto_448405 ) ) ( not ( = ?auto_448399 ?auto_448406 ) ) ( not ( = ?auto_448400 ?auto_448401 ) ) ( not ( = ?auto_448400 ?auto_448402 ) ) ( not ( = ?auto_448400 ?auto_448403 ) ) ( not ( = ?auto_448400 ?auto_448404 ) ) ( not ( = ?auto_448400 ?auto_448405 ) ) ( not ( = ?auto_448400 ?auto_448406 ) ) ( not ( = ?auto_448401 ?auto_448402 ) ) ( not ( = ?auto_448401 ?auto_448403 ) ) ( not ( = ?auto_448401 ?auto_448404 ) ) ( not ( = ?auto_448401 ?auto_448405 ) ) ( not ( = ?auto_448401 ?auto_448406 ) ) ( not ( = ?auto_448402 ?auto_448403 ) ) ( not ( = ?auto_448402 ?auto_448404 ) ) ( not ( = ?auto_448402 ?auto_448405 ) ) ( not ( = ?auto_448402 ?auto_448406 ) ) ( not ( = ?auto_448403 ?auto_448404 ) ) ( not ( = ?auto_448403 ?auto_448405 ) ) ( not ( = ?auto_448403 ?auto_448406 ) ) ( not ( = ?auto_448404 ?auto_448405 ) ) ( not ( = ?auto_448404 ?auto_448406 ) ) ( not ( = ?auto_448405 ?auto_448406 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_448406 )
      ( !STACK ?auto_448406 ?auto_448405 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448422 - BLOCK
      ?auto_448423 - BLOCK
      ?auto_448424 - BLOCK
      ?auto_448425 - BLOCK
      ?auto_448426 - BLOCK
      ?auto_448427 - BLOCK
      ?auto_448428 - BLOCK
      ?auto_448429 - BLOCK
      ?auto_448430 - BLOCK
      ?auto_448431 - BLOCK
      ?auto_448432 - BLOCK
      ?auto_448433 - BLOCK
      ?auto_448434 - BLOCK
      ?auto_448435 - BLOCK
      ?auto_448436 - BLOCK
    )
    :vars
    (
      ?auto_448437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448436 ?auto_448437 ) ( ON-TABLE ?auto_448422 ) ( ON ?auto_448423 ?auto_448422 ) ( ON ?auto_448424 ?auto_448423 ) ( ON ?auto_448425 ?auto_448424 ) ( ON ?auto_448426 ?auto_448425 ) ( ON ?auto_448427 ?auto_448426 ) ( ON ?auto_448428 ?auto_448427 ) ( ON ?auto_448429 ?auto_448428 ) ( ON ?auto_448430 ?auto_448429 ) ( ON ?auto_448431 ?auto_448430 ) ( ON ?auto_448432 ?auto_448431 ) ( ON ?auto_448433 ?auto_448432 ) ( ON ?auto_448434 ?auto_448433 ) ( not ( = ?auto_448422 ?auto_448423 ) ) ( not ( = ?auto_448422 ?auto_448424 ) ) ( not ( = ?auto_448422 ?auto_448425 ) ) ( not ( = ?auto_448422 ?auto_448426 ) ) ( not ( = ?auto_448422 ?auto_448427 ) ) ( not ( = ?auto_448422 ?auto_448428 ) ) ( not ( = ?auto_448422 ?auto_448429 ) ) ( not ( = ?auto_448422 ?auto_448430 ) ) ( not ( = ?auto_448422 ?auto_448431 ) ) ( not ( = ?auto_448422 ?auto_448432 ) ) ( not ( = ?auto_448422 ?auto_448433 ) ) ( not ( = ?auto_448422 ?auto_448434 ) ) ( not ( = ?auto_448422 ?auto_448435 ) ) ( not ( = ?auto_448422 ?auto_448436 ) ) ( not ( = ?auto_448422 ?auto_448437 ) ) ( not ( = ?auto_448423 ?auto_448424 ) ) ( not ( = ?auto_448423 ?auto_448425 ) ) ( not ( = ?auto_448423 ?auto_448426 ) ) ( not ( = ?auto_448423 ?auto_448427 ) ) ( not ( = ?auto_448423 ?auto_448428 ) ) ( not ( = ?auto_448423 ?auto_448429 ) ) ( not ( = ?auto_448423 ?auto_448430 ) ) ( not ( = ?auto_448423 ?auto_448431 ) ) ( not ( = ?auto_448423 ?auto_448432 ) ) ( not ( = ?auto_448423 ?auto_448433 ) ) ( not ( = ?auto_448423 ?auto_448434 ) ) ( not ( = ?auto_448423 ?auto_448435 ) ) ( not ( = ?auto_448423 ?auto_448436 ) ) ( not ( = ?auto_448423 ?auto_448437 ) ) ( not ( = ?auto_448424 ?auto_448425 ) ) ( not ( = ?auto_448424 ?auto_448426 ) ) ( not ( = ?auto_448424 ?auto_448427 ) ) ( not ( = ?auto_448424 ?auto_448428 ) ) ( not ( = ?auto_448424 ?auto_448429 ) ) ( not ( = ?auto_448424 ?auto_448430 ) ) ( not ( = ?auto_448424 ?auto_448431 ) ) ( not ( = ?auto_448424 ?auto_448432 ) ) ( not ( = ?auto_448424 ?auto_448433 ) ) ( not ( = ?auto_448424 ?auto_448434 ) ) ( not ( = ?auto_448424 ?auto_448435 ) ) ( not ( = ?auto_448424 ?auto_448436 ) ) ( not ( = ?auto_448424 ?auto_448437 ) ) ( not ( = ?auto_448425 ?auto_448426 ) ) ( not ( = ?auto_448425 ?auto_448427 ) ) ( not ( = ?auto_448425 ?auto_448428 ) ) ( not ( = ?auto_448425 ?auto_448429 ) ) ( not ( = ?auto_448425 ?auto_448430 ) ) ( not ( = ?auto_448425 ?auto_448431 ) ) ( not ( = ?auto_448425 ?auto_448432 ) ) ( not ( = ?auto_448425 ?auto_448433 ) ) ( not ( = ?auto_448425 ?auto_448434 ) ) ( not ( = ?auto_448425 ?auto_448435 ) ) ( not ( = ?auto_448425 ?auto_448436 ) ) ( not ( = ?auto_448425 ?auto_448437 ) ) ( not ( = ?auto_448426 ?auto_448427 ) ) ( not ( = ?auto_448426 ?auto_448428 ) ) ( not ( = ?auto_448426 ?auto_448429 ) ) ( not ( = ?auto_448426 ?auto_448430 ) ) ( not ( = ?auto_448426 ?auto_448431 ) ) ( not ( = ?auto_448426 ?auto_448432 ) ) ( not ( = ?auto_448426 ?auto_448433 ) ) ( not ( = ?auto_448426 ?auto_448434 ) ) ( not ( = ?auto_448426 ?auto_448435 ) ) ( not ( = ?auto_448426 ?auto_448436 ) ) ( not ( = ?auto_448426 ?auto_448437 ) ) ( not ( = ?auto_448427 ?auto_448428 ) ) ( not ( = ?auto_448427 ?auto_448429 ) ) ( not ( = ?auto_448427 ?auto_448430 ) ) ( not ( = ?auto_448427 ?auto_448431 ) ) ( not ( = ?auto_448427 ?auto_448432 ) ) ( not ( = ?auto_448427 ?auto_448433 ) ) ( not ( = ?auto_448427 ?auto_448434 ) ) ( not ( = ?auto_448427 ?auto_448435 ) ) ( not ( = ?auto_448427 ?auto_448436 ) ) ( not ( = ?auto_448427 ?auto_448437 ) ) ( not ( = ?auto_448428 ?auto_448429 ) ) ( not ( = ?auto_448428 ?auto_448430 ) ) ( not ( = ?auto_448428 ?auto_448431 ) ) ( not ( = ?auto_448428 ?auto_448432 ) ) ( not ( = ?auto_448428 ?auto_448433 ) ) ( not ( = ?auto_448428 ?auto_448434 ) ) ( not ( = ?auto_448428 ?auto_448435 ) ) ( not ( = ?auto_448428 ?auto_448436 ) ) ( not ( = ?auto_448428 ?auto_448437 ) ) ( not ( = ?auto_448429 ?auto_448430 ) ) ( not ( = ?auto_448429 ?auto_448431 ) ) ( not ( = ?auto_448429 ?auto_448432 ) ) ( not ( = ?auto_448429 ?auto_448433 ) ) ( not ( = ?auto_448429 ?auto_448434 ) ) ( not ( = ?auto_448429 ?auto_448435 ) ) ( not ( = ?auto_448429 ?auto_448436 ) ) ( not ( = ?auto_448429 ?auto_448437 ) ) ( not ( = ?auto_448430 ?auto_448431 ) ) ( not ( = ?auto_448430 ?auto_448432 ) ) ( not ( = ?auto_448430 ?auto_448433 ) ) ( not ( = ?auto_448430 ?auto_448434 ) ) ( not ( = ?auto_448430 ?auto_448435 ) ) ( not ( = ?auto_448430 ?auto_448436 ) ) ( not ( = ?auto_448430 ?auto_448437 ) ) ( not ( = ?auto_448431 ?auto_448432 ) ) ( not ( = ?auto_448431 ?auto_448433 ) ) ( not ( = ?auto_448431 ?auto_448434 ) ) ( not ( = ?auto_448431 ?auto_448435 ) ) ( not ( = ?auto_448431 ?auto_448436 ) ) ( not ( = ?auto_448431 ?auto_448437 ) ) ( not ( = ?auto_448432 ?auto_448433 ) ) ( not ( = ?auto_448432 ?auto_448434 ) ) ( not ( = ?auto_448432 ?auto_448435 ) ) ( not ( = ?auto_448432 ?auto_448436 ) ) ( not ( = ?auto_448432 ?auto_448437 ) ) ( not ( = ?auto_448433 ?auto_448434 ) ) ( not ( = ?auto_448433 ?auto_448435 ) ) ( not ( = ?auto_448433 ?auto_448436 ) ) ( not ( = ?auto_448433 ?auto_448437 ) ) ( not ( = ?auto_448434 ?auto_448435 ) ) ( not ( = ?auto_448434 ?auto_448436 ) ) ( not ( = ?auto_448434 ?auto_448437 ) ) ( not ( = ?auto_448435 ?auto_448436 ) ) ( not ( = ?auto_448435 ?auto_448437 ) ) ( not ( = ?auto_448436 ?auto_448437 ) ) ( CLEAR ?auto_448434 ) ( ON ?auto_448435 ?auto_448436 ) ( CLEAR ?auto_448435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_448422 ?auto_448423 ?auto_448424 ?auto_448425 ?auto_448426 ?auto_448427 ?auto_448428 ?auto_448429 ?auto_448430 ?auto_448431 ?auto_448432 ?auto_448433 ?auto_448434 ?auto_448435 )
      ( MAKE-15PILE ?auto_448422 ?auto_448423 ?auto_448424 ?auto_448425 ?auto_448426 ?auto_448427 ?auto_448428 ?auto_448429 ?auto_448430 ?auto_448431 ?auto_448432 ?auto_448433 ?auto_448434 ?auto_448435 ?auto_448436 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448453 - BLOCK
      ?auto_448454 - BLOCK
      ?auto_448455 - BLOCK
      ?auto_448456 - BLOCK
      ?auto_448457 - BLOCK
      ?auto_448458 - BLOCK
      ?auto_448459 - BLOCK
      ?auto_448460 - BLOCK
      ?auto_448461 - BLOCK
      ?auto_448462 - BLOCK
      ?auto_448463 - BLOCK
      ?auto_448464 - BLOCK
      ?auto_448465 - BLOCK
      ?auto_448466 - BLOCK
      ?auto_448467 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_448467 ) ( ON-TABLE ?auto_448453 ) ( ON ?auto_448454 ?auto_448453 ) ( ON ?auto_448455 ?auto_448454 ) ( ON ?auto_448456 ?auto_448455 ) ( ON ?auto_448457 ?auto_448456 ) ( ON ?auto_448458 ?auto_448457 ) ( ON ?auto_448459 ?auto_448458 ) ( ON ?auto_448460 ?auto_448459 ) ( ON ?auto_448461 ?auto_448460 ) ( ON ?auto_448462 ?auto_448461 ) ( ON ?auto_448463 ?auto_448462 ) ( ON ?auto_448464 ?auto_448463 ) ( ON ?auto_448465 ?auto_448464 ) ( not ( = ?auto_448453 ?auto_448454 ) ) ( not ( = ?auto_448453 ?auto_448455 ) ) ( not ( = ?auto_448453 ?auto_448456 ) ) ( not ( = ?auto_448453 ?auto_448457 ) ) ( not ( = ?auto_448453 ?auto_448458 ) ) ( not ( = ?auto_448453 ?auto_448459 ) ) ( not ( = ?auto_448453 ?auto_448460 ) ) ( not ( = ?auto_448453 ?auto_448461 ) ) ( not ( = ?auto_448453 ?auto_448462 ) ) ( not ( = ?auto_448453 ?auto_448463 ) ) ( not ( = ?auto_448453 ?auto_448464 ) ) ( not ( = ?auto_448453 ?auto_448465 ) ) ( not ( = ?auto_448453 ?auto_448466 ) ) ( not ( = ?auto_448453 ?auto_448467 ) ) ( not ( = ?auto_448454 ?auto_448455 ) ) ( not ( = ?auto_448454 ?auto_448456 ) ) ( not ( = ?auto_448454 ?auto_448457 ) ) ( not ( = ?auto_448454 ?auto_448458 ) ) ( not ( = ?auto_448454 ?auto_448459 ) ) ( not ( = ?auto_448454 ?auto_448460 ) ) ( not ( = ?auto_448454 ?auto_448461 ) ) ( not ( = ?auto_448454 ?auto_448462 ) ) ( not ( = ?auto_448454 ?auto_448463 ) ) ( not ( = ?auto_448454 ?auto_448464 ) ) ( not ( = ?auto_448454 ?auto_448465 ) ) ( not ( = ?auto_448454 ?auto_448466 ) ) ( not ( = ?auto_448454 ?auto_448467 ) ) ( not ( = ?auto_448455 ?auto_448456 ) ) ( not ( = ?auto_448455 ?auto_448457 ) ) ( not ( = ?auto_448455 ?auto_448458 ) ) ( not ( = ?auto_448455 ?auto_448459 ) ) ( not ( = ?auto_448455 ?auto_448460 ) ) ( not ( = ?auto_448455 ?auto_448461 ) ) ( not ( = ?auto_448455 ?auto_448462 ) ) ( not ( = ?auto_448455 ?auto_448463 ) ) ( not ( = ?auto_448455 ?auto_448464 ) ) ( not ( = ?auto_448455 ?auto_448465 ) ) ( not ( = ?auto_448455 ?auto_448466 ) ) ( not ( = ?auto_448455 ?auto_448467 ) ) ( not ( = ?auto_448456 ?auto_448457 ) ) ( not ( = ?auto_448456 ?auto_448458 ) ) ( not ( = ?auto_448456 ?auto_448459 ) ) ( not ( = ?auto_448456 ?auto_448460 ) ) ( not ( = ?auto_448456 ?auto_448461 ) ) ( not ( = ?auto_448456 ?auto_448462 ) ) ( not ( = ?auto_448456 ?auto_448463 ) ) ( not ( = ?auto_448456 ?auto_448464 ) ) ( not ( = ?auto_448456 ?auto_448465 ) ) ( not ( = ?auto_448456 ?auto_448466 ) ) ( not ( = ?auto_448456 ?auto_448467 ) ) ( not ( = ?auto_448457 ?auto_448458 ) ) ( not ( = ?auto_448457 ?auto_448459 ) ) ( not ( = ?auto_448457 ?auto_448460 ) ) ( not ( = ?auto_448457 ?auto_448461 ) ) ( not ( = ?auto_448457 ?auto_448462 ) ) ( not ( = ?auto_448457 ?auto_448463 ) ) ( not ( = ?auto_448457 ?auto_448464 ) ) ( not ( = ?auto_448457 ?auto_448465 ) ) ( not ( = ?auto_448457 ?auto_448466 ) ) ( not ( = ?auto_448457 ?auto_448467 ) ) ( not ( = ?auto_448458 ?auto_448459 ) ) ( not ( = ?auto_448458 ?auto_448460 ) ) ( not ( = ?auto_448458 ?auto_448461 ) ) ( not ( = ?auto_448458 ?auto_448462 ) ) ( not ( = ?auto_448458 ?auto_448463 ) ) ( not ( = ?auto_448458 ?auto_448464 ) ) ( not ( = ?auto_448458 ?auto_448465 ) ) ( not ( = ?auto_448458 ?auto_448466 ) ) ( not ( = ?auto_448458 ?auto_448467 ) ) ( not ( = ?auto_448459 ?auto_448460 ) ) ( not ( = ?auto_448459 ?auto_448461 ) ) ( not ( = ?auto_448459 ?auto_448462 ) ) ( not ( = ?auto_448459 ?auto_448463 ) ) ( not ( = ?auto_448459 ?auto_448464 ) ) ( not ( = ?auto_448459 ?auto_448465 ) ) ( not ( = ?auto_448459 ?auto_448466 ) ) ( not ( = ?auto_448459 ?auto_448467 ) ) ( not ( = ?auto_448460 ?auto_448461 ) ) ( not ( = ?auto_448460 ?auto_448462 ) ) ( not ( = ?auto_448460 ?auto_448463 ) ) ( not ( = ?auto_448460 ?auto_448464 ) ) ( not ( = ?auto_448460 ?auto_448465 ) ) ( not ( = ?auto_448460 ?auto_448466 ) ) ( not ( = ?auto_448460 ?auto_448467 ) ) ( not ( = ?auto_448461 ?auto_448462 ) ) ( not ( = ?auto_448461 ?auto_448463 ) ) ( not ( = ?auto_448461 ?auto_448464 ) ) ( not ( = ?auto_448461 ?auto_448465 ) ) ( not ( = ?auto_448461 ?auto_448466 ) ) ( not ( = ?auto_448461 ?auto_448467 ) ) ( not ( = ?auto_448462 ?auto_448463 ) ) ( not ( = ?auto_448462 ?auto_448464 ) ) ( not ( = ?auto_448462 ?auto_448465 ) ) ( not ( = ?auto_448462 ?auto_448466 ) ) ( not ( = ?auto_448462 ?auto_448467 ) ) ( not ( = ?auto_448463 ?auto_448464 ) ) ( not ( = ?auto_448463 ?auto_448465 ) ) ( not ( = ?auto_448463 ?auto_448466 ) ) ( not ( = ?auto_448463 ?auto_448467 ) ) ( not ( = ?auto_448464 ?auto_448465 ) ) ( not ( = ?auto_448464 ?auto_448466 ) ) ( not ( = ?auto_448464 ?auto_448467 ) ) ( not ( = ?auto_448465 ?auto_448466 ) ) ( not ( = ?auto_448465 ?auto_448467 ) ) ( not ( = ?auto_448466 ?auto_448467 ) ) ( CLEAR ?auto_448465 ) ( ON ?auto_448466 ?auto_448467 ) ( CLEAR ?auto_448466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_448453 ?auto_448454 ?auto_448455 ?auto_448456 ?auto_448457 ?auto_448458 ?auto_448459 ?auto_448460 ?auto_448461 ?auto_448462 ?auto_448463 ?auto_448464 ?auto_448465 ?auto_448466 )
      ( MAKE-15PILE ?auto_448453 ?auto_448454 ?auto_448455 ?auto_448456 ?auto_448457 ?auto_448458 ?auto_448459 ?auto_448460 ?auto_448461 ?auto_448462 ?auto_448463 ?auto_448464 ?auto_448465 ?auto_448466 ?auto_448467 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448483 - BLOCK
      ?auto_448484 - BLOCK
      ?auto_448485 - BLOCK
      ?auto_448486 - BLOCK
      ?auto_448487 - BLOCK
      ?auto_448488 - BLOCK
      ?auto_448489 - BLOCK
      ?auto_448490 - BLOCK
      ?auto_448491 - BLOCK
      ?auto_448492 - BLOCK
      ?auto_448493 - BLOCK
      ?auto_448494 - BLOCK
      ?auto_448495 - BLOCK
      ?auto_448496 - BLOCK
      ?auto_448497 - BLOCK
    )
    :vars
    (
      ?auto_448498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448497 ?auto_448498 ) ( ON-TABLE ?auto_448483 ) ( ON ?auto_448484 ?auto_448483 ) ( ON ?auto_448485 ?auto_448484 ) ( ON ?auto_448486 ?auto_448485 ) ( ON ?auto_448487 ?auto_448486 ) ( ON ?auto_448488 ?auto_448487 ) ( ON ?auto_448489 ?auto_448488 ) ( ON ?auto_448490 ?auto_448489 ) ( ON ?auto_448491 ?auto_448490 ) ( ON ?auto_448492 ?auto_448491 ) ( ON ?auto_448493 ?auto_448492 ) ( ON ?auto_448494 ?auto_448493 ) ( not ( = ?auto_448483 ?auto_448484 ) ) ( not ( = ?auto_448483 ?auto_448485 ) ) ( not ( = ?auto_448483 ?auto_448486 ) ) ( not ( = ?auto_448483 ?auto_448487 ) ) ( not ( = ?auto_448483 ?auto_448488 ) ) ( not ( = ?auto_448483 ?auto_448489 ) ) ( not ( = ?auto_448483 ?auto_448490 ) ) ( not ( = ?auto_448483 ?auto_448491 ) ) ( not ( = ?auto_448483 ?auto_448492 ) ) ( not ( = ?auto_448483 ?auto_448493 ) ) ( not ( = ?auto_448483 ?auto_448494 ) ) ( not ( = ?auto_448483 ?auto_448495 ) ) ( not ( = ?auto_448483 ?auto_448496 ) ) ( not ( = ?auto_448483 ?auto_448497 ) ) ( not ( = ?auto_448483 ?auto_448498 ) ) ( not ( = ?auto_448484 ?auto_448485 ) ) ( not ( = ?auto_448484 ?auto_448486 ) ) ( not ( = ?auto_448484 ?auto_448487 ) ) ( not ( = ?auto_448484 ?auto_448488 ) ) ( not ( = ?auto_448484 ?auto_448489 ) ) ( not ( = ?auto_448484 ?auto_448490 ) ) ( not ( = ?auto_448484 ?auto_448491 ) ) ( not ( = ?auto_448484 ?auto_448492 ) ) ( not ( = ?auto_448484 ?auto_448493 ) ) ( not ( = ?auto_448484 ?auto_448494 ) ) ( not ( = ?auto_448484 ?auto_448495 ) ) ( not ( = ?auto_448484 ?auto_448496 ) ) ( not ( = ?auto_448484 ?auto_448497 ) ) ( not ( = ?auto_448484 ?auto_448498 ) ) ( not ( = ?auto_448485 ?auto_448486 ) ) ( not ( = ?auto_448485 ?auto_448487 ) ) ( not ( = ?auto_448485 ?auto_448488 ) ) ( not ( = ?auto_448485 ?auto_448489 ) ) ( not ( = ?auto_448485 ?auto_448490 ) ) ( not ( = ?auto_448485 ?auto_448491 ) ) ( not ( = ?auto_448485 ?auto_448492 ) ) ( not ( = ?auto_448485 ?auto_448493 ) ) ( not ( = ?auto_448485 ?auto_448494 ) ) ( not ( = ?auto_448485 ?auto_448495 ) ) ( not ( = ?auto_448485 ?auto_448496 ) ) ( not ( = ?auto_448485 ?auto_448497 ) ) ( not ( = ?auto_448485 ?auto_448498 ) ) ( not ( = ?auto_448486 ?auto_448487 ) ) ( not ( = ?auto_448486 ?auto_448488 ) ) ( not ( = ?auto_448486 ?auto_448489 ) ) ( not ( = ?auto_448486 ?auto_448490 ) ) ( not ( = ?auto_448486 ?auto_448491 ) ) ( not ( = ?auto_448486 ?auto_448492 ) ) ( not ( = ?auto_448486 ?auto_448493 ) ) ( not ( = ?auto_448486 ?auto_448494 ) ) ( not ( = ?auto_448486 ?auto_448495 ) ) ( not ( = ?auto_448486 ?auto_448496 ) ) ( not ( = ?auto_448486 ?auto_448497 ) ) ( not ( = ?auto_448486 ?auto_448498 ) ) ( not ( = ?auto_448487 ?auto_448488 ) ) ( not ( = ?auto_448487 ?auto_448489 ) ) ( not ( = ?auto_448487 ?auto_448490 ) ) ( not ( = ?auto_448487 ?auto_448491 ) ) ( not ( = ?auto_448487 ?auto_448492 ) ) ( not ( = ?auto_448487 ?auto_448493 ) ) ( not ( = ?auto_448487 ?auto_448494 ) ) ( not ( = ?auto_448487 ?auto_448495 ) ) ( not ( = ?auto_448487 ?auto_448496 ) ) ( not ( = ?auto_448487 ?auto_448497 ) ) ( not ( = ?auto_448487 ?auto_448498 ) ) ( not ( = ?auto_448488 ?auto_448489 ) ) ( not ( = ?auto_448488 ?auto_448490 ) ) ( not ( = ?auto_448488 ?auto_448491 ) ) ( not ( = ?auto_448488 ?auto_448492 ) ) ( not ( = ?auto_448488 ?auto_448493 ) ) ( not ( = ?auto_448488 ?auto_448494 ) ) ( not ( = ?auto_448488 ?auto_448495 ) ) ( not ( = ?auto_448488 ?auto_448496 ) ) ( not ( = ?auto_448488 ?auto_448497 ) ) ( not ( = ?auto_448488 ?auto_448498 ) ) ( not ( = ?auto_448489 ?auto_448490 ) ) ( not ( = ?auto_448489 ?auto_448491 ) ) ( not ( = ?auto_448489 ?auto_448492 ) ) ( not ( = ?auto_448489 ?auto_448493 ) ) ( not ( = ?auto_448489 ?auto_448494 ) ) ( not ( = ?auto_448489 ?auto_448495 ) ) ( not ( = ?auto_448489 ?auto_448496 ) ) ( not ( = ?auto_448489 ?auto_448497 ) ) ( not ( = ?auto_448489 ?auto_448498 ) ) ( not ( = ?auto_448490 ?auto_448491 ) ) ( not ( = ?auto_448490 ?auto_448492 ) ) ( not ( = ?auto_448490 ?auto_448493 ) ) ( not ( = ?auto_448490 ?auto_448494 ) ) ( not ( = ?auto_448490 ?auto_448495 ) ) ( not ( = ?auto_448490 ?auto_448496 ) ) ( not ( = ?auto_448490 ?auto_448497 ) ) ( not ( = ?auto_448490 ?auto_448498 ) ) ( not ( = ?auto_448491 ?auto_448492 ) ) ( not ( = ?auto_448491 ?auto_448493 ) ) ( not ( = ?auto_448491 ?auto_448494 ) ) ( not ( = ?auto_448491 ?auto_448495 ) ) ( not ( = ?auto_448491 ?auto_448496 ) ) ( not ( = ?auto_448491 ?auto_448497 ) ) ( not ( = ?auto_448491 ?auto_448498 ) ) ( not ( = ?auto_448492 ?auto_448493 ) ) ( not ( = ?auto_448492 ?auto_448494 ) ) ( not ( = ?auto_448492 ?auto_448495 ) ) ( not ( = ?auto_448492 ?auto_448496 ) ) ( not ( = ?auto_448492 ?auto_448497 ) ) ( not ( = ?auto_448492 ?auto_448498 ) ) ( not ( = ?auto_448493 ?auto_448494 ) ) ( not ( = ?auto_448493 ?auto_448495 ) ) ( not ( = ?auto_448493 ?auto_448496 ) ) ( not ( = ?auto_448493 ?auto_448497 ) ) ( not ( = ?auto_448493 ?auto_448498 ) ) ( not ( = ?auto_448494 ?auto_448495 ) ) ( not ( = ?auto_448494 ?auto_448496 ) ) ( not ( = ?auto_448494 ?auto_448497 ) ) ( not ( = ?auto_448494 ?auto_448498 ) ) ( not ( = ?auto_448495 ?auto_448496 ) ) ( not ( = ?auto_448495 ?auto_448497 ) ) ( not ( = ?auto_448495 ?auto_448498 ) ) ( not ( = ?auto_448496 ?auto_448497 ) ) ( not ( = ?auto_448496 ?auto_448498 ) ) ( not ( = ?auto_448497 ?auto_448498 ) ) ( ON ?auto_448496 ?auto_448497 ) ( CLEAR ?auto_448494 ) ( ON ?auto_448495 ?auto_448496 ) ( CLEAR ?auto_448495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_448483 ?auto_448484 ?auto_448485 ?auto_448486 ?auto_448487 ?auto_448488 ?auto_448489 ?auto_448490 ?auto_448491 ?auto_448492 ?auto_448493 ?auto_448494 ?auto_448495 )
      ( MAKE-15PILE ?auto_448483 ?auto_448484 ?auto_448485 ?auto_448486 ?auto_448487 ?auto_448488 ?auto_448489 ?auto_448490 ?auto_448491 ?auto_448492 ?auto_448493 ?auto_448494 ?auto_448495 ?auto_448496 ?auto_448497 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448514 - BLOCK
      ?auto_448515 - BLOCK
      ?auto_448516 - BLOCK
      ?auto_448517 - BLOCK
      ?auto_448518 - BLOCK
      ?auto_448519 - BLOCK
      ?auto_448520 - BLOCK
      ?auto_448521 - BLOCK
      ?auto_448522 - BLOCK
      ?auto_448523 - BLOCK
      ?auto_448524 - BLOCK
      ?auto_448525 - BLOCK
      ?auto_448526 - BLOCK
      ?auto_448527 - BLOCK
      ?auto_448528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_448528 ) ( ON-TABLE ?auto_448514 ) ( ON ?auto_448515 ?auto_448514 ) ( ON ?auto_448516 ?auto_448515 ) ( ON ?auto_448517 ?auto_448516 ) ( ON ?auto_448518 ?auto_448517 ) ( ON ?auto_448519 ?auto_448518 ) ( ON ?auto_448520 ?auto_448519 ) ( ON ?auto_448521 ?auto_448520 ) ( ON ?auto_448522 ?auto_448521 ) ( ON ?auto_448523 ?auto_448522 ) ( ON ?auto_448524 ?auto_448523 ) ( ON ?auto_448525 ?auto_448524 ) ( not ( = ?auto_448514 ?auto_448515 ) ) ( not ( = ?auto_448514 ?auto_448516 ) ) ( not ( = ?auto_448514 ?auto_448517 ) ) ( not ( = ?auto_448514 ?auto_448518 ) ) ( not ( = ?auto_448514 ?auto_448519 ) ) ( not ( = ?auto_448514 ?auto_448520 ) ) ( not ( = ?auto_448514 ?auto_448521 ) ) ( not ( = ?auto_448514 ?auto_448522 ) ) ( not ( = ?auto_448514 ?auto_448523 ) ) ( not ( = ?auto_448514 ?auto_448524 ) ) ( not ( = ?auto_448514 ?auto_448525 ) ) ( not ( = ?auto_448514 ?auto_448526 ) ) ( not ( = ?auto_448514 ?auto_448527 ) ) ( not ( = ?auto_448514 ?auto_448528 ) ) ( not ( = ?auto_448515 ?auto_448516 ) ) ( not ( = ?auto_448515 ?auto_448517 ) ) ( not ( = ?auto_448515 ?auto_448518 ) ) ( not ( = ?auto_448515 ?auto_448519 ) ) ( not ( = ?auto_448515 ?auto_448520 ) ) ( not ( = ?auto_448515 ?auto_448521 ) ) ( not ( = ?auto_448515 ?auto_448522 ) ) ( not ( = ?auto_448515 ?auto_448523 ) ) ( not ( = ?auto_448515 ?auto_448524 ) ) ( not ( = ?auto_448515 ?auto_448525 ) ) ( not ( = ?auto_448515 ?auto_448526 ) ) ( not ( = ?auto_448515 ?auto_448527 ) ) ( not ( = ?auto_448515 ?auto_448528 ) ) ( not ( = ?auto_448516 ?auto_448517 ) ) ( not ( = ?auto_448516 ?auto_448518 ) ) ( not ( = ?auto_448516 ?auto_448519 ) ) ( not ( = ?auto_448516 ?auto_448520 ) ) ( not ( = ?auto_448516 ?auto_448521 ) ) ( not ( = ?auto_448516 ?auto_448522 ) ) ( not ( = ?auto_448516 ?auto_448523 ) ) ( not ( = ?auto_448516 ?auto_448524 ) ) ( not ( = ?auto_448516 ?auto_448525 ) ) ( not ( = ?auto_448516 ?auto_448526 ) ) ( not ( = ?auto_448516 ?auto_448527 ) ) ( not ( = ?auto_448516 ?auto_448528 ) ) ( not ( = ?auto_448517 ?auto_448518 ) ) ( not ( = ?auto_448517 ?auto_448519 ) ) ( not ( = ?auto_448517 ?auto_448520 ) ) ( not ( = ?auto_448517 ?auto_448521 ) ) ( not ( = ?auto_448517 ?auto_448522 ) ) ( not ( = ?auto_448517 ?auto_448523 ) ) ( not ( = ?auto_448517 ?auto_448524 ) ) ( not ( = ?auto_448517 ?auto_448525 ) ) ( not ( = ?auto_448517 ?auto_448526 ) ) ( not ( = ?auto_448517 ?auto_448527 ) ) ( not ( = ?auto_448517 ?auto_448528 ) ) ( not ( = ?auto_448518 ?auto_448519 ) ) ( not ( = ?auto_448518 ?auto_448520 ) ) ( not ( = ?auto_448518 ?auto_448521 ) ) ( not ( = ?auto_448518 ?auto_448522 ) ) ( not ( = ?auto_448518 ?auto_448523 ) ) ( not ( = ?auto_448518 ?auto_448524 ) ) ( not ( = ?auto_448518 ?auto_448525 ) ) ( not ( = ?auto_448518 ?auto_448526 ) ) ( not ( = ?auto_448518 ?auto_448527 ) ) ( not ( = ?auto_448518 ?auto_448528 ) ) ( not ( = ?auto_448519 ?auto_448520 ) ) ( not ( = ?auto_448519 ?auto_448521 ) ) ( not ( = ?auto_448519 ?auto_448522 ) ) ( not ( = ?auto_448519 ?auto_448523 ) ) ( not ( = ?auto_448519 ?auto_448524 ) ) ( not ( = ?auto_448519 ?auto_448525 ) ) ( not ( = ?auto_448519 ?auto_448526 ) ) ( not ( = ?auto_448519 ?auto_448527 ) ) ( not ( = ?auto_448519 ?auto_448528 ) ) ( not ( = ?auto_448520 ?auto_448521 ) ) ( not ( = ?auto_448520 ?auto_448522 ) ) ( not ( = ?auto_448520 ?auto_448523 ) ) ( not ( = ?auto_448520 ?auto_448524 ) ) ( not ( = ?auto_448520 ?auto_448525 ) ) ( not ( = ?auto_448520 ?auto_448526 ) ) ( not ( = ?auto_448520 ?auto_448527 ) ) ( not ( = ?auto_448520 ?auto_448528 ) ) ( not ( = ?auto_448521 ?auto_448522 ) ) ( not ( = ?auto_448521 ?auto_448523 ) ) ( not ( = ?auto_448521 ?auto_448524 ) ) ( not ( = ?auto_448521 ?auto_448525 ) ) ( not ( = ?auto_448521 ?auto_448526 ) ) ( not ( = ?auto_448521 ?auto_448527 ) ) ( not ( = ?auto_448521 ?auto_448528 ) ) ( not ( = ?auto_448522 ?auto_448523 ) ) ( not ( = ?auto_448522 ?auto_448524 ) ) ( not ( = ?auto_448522 ?auto_448525 ) ) ( not ( = ?auto_448522 ?auto_448526 ) ) ( not ( = ?auto_448522 ?auto_448527 ) ) ( not ( = ?auto_448522 ?auto_448528 ) ) ( not ( = ?auto_448523 ?auto_448524 ) ) ( not ( = ?auto_448523 ?auto_448525 ) ) ( not ( = ?auto_448523 ?auto_448526 ) ) ( not ( = ?auto_448523 ?auto_448527 ) ) ( not ( = ?auto_448523 ?auto_448528 ) ) ( not ( = ?auto_448524 ?auto_448525 ) ) ( not ( = ?auto_448524 ?auto_448526 ) ) ( not ( = ?auto_448524 ?auto_448527 ) ) ( not ( = ?auto_448524 ?auto_448528 ) ) ( not ( = ?auto_448525 ?auto_448526 ) ) ( not ( = ?auto_448525 ?auto_448527 ) ) ( not ( = ?auto_448525 ?auto_448528 ) ) ( not ( = ?auto_448526 ?auto_448527 ) ) ( not ( = ?auto_448526 ?auto_448528 ) ) ( not ( = ?auto_448527 ?auto_448528 ) ) ( ON ?auto_448527 ?auto_448528 ) ( CLEAR ?auto_448525 ) ( ON ?auto_448526 ?auto_448527 ) ( CLEAR ?auto_448526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_448514 ?auto_448515 ?auto_448516 ?auto_448517 ?auto_448518 ?auto_448519 ?auto_448520 ?auto_448521 ?auto_448522 ?auto_448523 ?auto_448524 ?auto_448525 ?auto_448526 )
      ( MAKE-15PILE ?auto_448514 ?auto_448515 ?auto_448516 ?auto_448517 ?auto_448518 ?auto_448519 ?auto_448520 ?auto_448521 ?auto_448522 ?auto_448523 ?auto_448524 ?auto_448525 ?auto_448526 ?auto_448527 ?auto_448528 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448544 - BLOCK
      ?auto_448545 - BLOCK
      ?auto_448546 - BLOCK
      ?auto_448547 - BLOCK
      ?auto_448548 - BLOCK
      ?auto_448549 - BLOCK
      ?auto_448550 - BLOCK
      ?auto_448551 - BLOCK
      ?auto_448552 - BLOCK
      ?auto_448553 - BLOCK
      ?auto_448554 - BLOCK
      ?auto_448555 - BLOCK
      ?auto_448556 - BLOCK
      ?auto_448557 - BLOCK
      ?auto_448558 - BLOCK
    )
    :vars
    (
      ?auto_448559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448558 ?auto_448559 ) ( ON-TABLE ?auto_448544 ) ( ON ?auto_448545 ?auto_448544 ) ( ON ?auto_448546 ?auto_448545 ) ( ON ?auto_448547 ?auto_448546 ) ( ON ?auto_448548 ?auto_448547 ) ( ON ?auto_448549 ?auto_448548 ) ( ON ?auto_448550 ?auto_448549 ) ( ON ?auto_448551 ?auto_448550 ) ( ON ?auto_448552 ?auto_448551 ) ( ON ?auto_448553 ?auto_448552 ) ( ON ?auto_448554 ?auto_448553 ) ( not ( = ?auto_448544 ?auto_448545 ) ) ( not ( = ?auto_448544 ?auto_448546 ) ) ( not ( = ?auto_448544 ?auto_448547 ) ) ( not ( = ?auto_448544 ?auto_448548 ) ) ( not ( = ?auto_448544 ?auto_448549 ) ) ( not ( = ?auto_448544 ?auto_448550 ) ) ( not ( = ?auto_448544 ?auto_448551 ) ) ( not ( = ?auto_448544 ?auto_448552 ) ) ( not ( = ?auto_448544 ?auto_448553 ) ) ( not ( = ?auto_448544 ?auto_448554 ) ) ( not ( = ?auto_448544 ?auto_448555 ) ) ( not ( = ?auto_448544 ?auto_448556 ) ) ( not ( = ?auto_448544 ?auto_448557 ) ) ( not ( = ?auto_448544 ?auto_448558 ) ) ( not ( = ?auto_448544 ?auto_448559 ) ) ( not ( = ?auto_448545 ?auto_448546 ) ) ( not ( = ?auto_448545 ?auto_448547 ) ) ( not ( = ?auto_448545 ?auto_448548 ) ) ( not ( = ?auto_448545 ?auto_448549 ) ) ( not ( = ?auto_448545 ?auto_448550 ) ) ( not ( = ?auto_448545 ?auto_448551 ) ) ( not ( = ?auto_448545 ?auto_448552 ) ) ( not ( = ?auto_448545 ?auto_448553 ) ) ( not ( = ?auto_448545 ?auto_448554 ) ) ( not ( = ?auto_448545 ?auto_448555 ) ) ( not ( = ?auto_448545 ?auto_448556 ) ) ( not ( = ?auto_448545 ?auto_448557 ) ) ( not ( = ?auto_448545 ?auto_448558 ) ) ( not ( = ?auto_448545 ?auto_448559 ) ) ( not ( = ?auto_448546 ?auto_448547 ) ) ( not ( = ?auto_448546 ?auto_448548 ) ) ( not ( = ?auto_448546 ?auto_448549 ) ) ( not ( = ?auto_448546 ?auto_448550 ) ) ( not ( = ?auto_448546 ?auto_448551 ) ) ( not ( = ?auto_448546 ?auto_448552 ) ) ( not ( = ?auto_448546 ?auto_448553 ) ) ( not ( = ?auto_448546 ?auto_448554 ) ) ( not ( = ?auto_448546 ?auto_448555 ) ) ( not ( = ?auto_448546 ?auto_448556 ) ) ( not ( = ?auto_448546 ?auto_448557 ) ) ( not ( = ?auto_448546 ?auto_448558 ) ) ( not ( = ?auto_448546 ?auto_448559 ) ) ( not ( = ?auto_448547 ?auto_448548 ) ) ( not ( = ?auto_448547 ?auto_448549 ) ) ( not ( = ?auto_448547 ?auto_448550 ) ) ( not ( = ?auto_448547 ?auto_448551 ) ) ( not ( = ?auto_448547 ?auto_448552 ) ) ( not ( = ?auto_448547 ?auto_448553 ) ) ( not ( = ?auto_448547 ?auto_448554 ) ) ( not ( = ?auto_448547 ?auto_448555 ) ) ( not ( = ?auto_448547 ?auto_448556 ) ) ( not ( = ?auto_448547 ?auto_448557 ) ) ( not ( = ?auto_448547 ?auto_448558 ) ) ( not ( = ?auto_448547 ?auto_448559 ) ) ( not ( = ?auto_448548 ?auto_448549 ) ) ( not ( = ?auto_448548 ?auto_448550 ) ) ( not ( = ?auto_448548 ?auto_448551 ) ) ( not ( = ?auto_448548 ?auto_448552 ) ) ( not ( = ?auto_448548 ?auto_448553 ) ) ( not ( = ?auto_448548 ?auto_448554 ) ) ( not ( = ?auto_448548 ?auto_448555 ) ) ( not ( = ?auto_448548 ?auto_448556 ) ) ( not ( = ?auto_448548 ?auto_448557 ) ) ( not ( = ?auto_448548 ?auto_448558 ) ) ( not ( = ?auto_448548 ?auto_448559 ) ) ( not ( = ?auto_448549 ?auto_448550 ) ) ( not ( = ?auto_448549 ?auto_448551 ) ) ( not ( = ?auto_448549 ?auto_448552 ) ) ( not ( = ?auto_448549 ?auto_448553 ) ) ( not ( = ?auto_448549 ?auto_448554 ) ) ( not ( = ?auto_448549 ?auto_448555 ) ) ( not ( = ?auto_448549 ?auto_448556 ) ) ( not ( = ?auto_448549 ?auto_448557 ) ) ( not ( = ?auto_448549 ?auto_448558 ) ) ( not ( = ?auto_448549 ?auto_448559 ) ) ( not ( = ?auto_448550 ?auto_448551 ) ) ( not ( = ?auto_448550 ?auto_448552 ) ) ( not ( = ?auto_448550 ?auto_448553 ) ) ( not ( = ?auto_448550 ?auto_448554 ) ) ( not ( = ?auto_448550 ?auto_448555 ) ) ( not ( = ?auto_448550 ?auto_448556 ) ) ( not ( = ?auto_448550 ?auto_448557 ) ) ( not ( = ?auto_448550 ?auto_448558 ) ) ( not ( = ?auto_448550 ?auto_448559 ) ) ( not ( = ?auto_448551 ?auto_448552 ) ) ( not ( = ?auto_448551 ?auto_448553 ) ) ( not ( = ?auto_448551 ?auto_448554 ) ) ( not ( = ?auto_448551 ?auto_448555 ) ) ( not ( = ?auto_448551 ?auto_448556 ) ) ( not ( = ?auto_448551 ?auto_448557 ) ) ( not ( = ?auto_448551 ?auto_448558 ) ) ( not ( = ?auto_448551 ?auto_448559 ) ) ( not ( = ?auto_448552 ?auto_448553 ) ) ( not ( = ?auto_448552 ?auto_448554 ) ) ( not ( = ?auto_448552 ?auto_448555 ) ) ( not ( = ?auto_448552 ?auto_448556 ) ) ( not ( = ?auto_448552 ?auto_448557 ) ) ( not ( = ?auto_448552 ?auto_448558 ) ) ( not ( = ?auto_448552 ?auto_448559 ) ) ( not ( = ?auto_448553 ?auto_448554 ) ) ( not ( = ?auto_448553 ?auto_448555 ) ) ( not ( = ?auto_448553 ?auto_448556 ) ) ( not ( = ?auto_448553 ?auto_448557 ) ) ( not ( = ?auto_448553 ?auto_448558 ) ) ( not ( = ?auto_448553 ?auto_448559 ) ) ( not ( = ?auto_448554 ?auto_448555 ) ) ( not ( = ?auto_448554 ?auto_448556 ) ) ( not ( = ?auto_448554 ?auto_448557 ) ) ( not ( = ?auto_448554 ?auto_448558 ) ) ( not ( = ?auto_448554 ?auto_448559 ) ) ( not ( = ?auto_448555 ?auto_448556 ) ) ( not ( = ?auto_448555 ?auto_448557 ) ) ( not ( = ?auto_448555 ?auto_448558 ) ) ( not ( = ?auto_448555 ?auto_448559 ) ) ( not ( = ?auto_448556 ?auto_448557 ) ) ( not ( = ?auto_448556 ?auto_448558 ) ) ( not ( = ?auto_448556 ?auto_448559 ) ) ( not ( = ?auto_448557 ?auto_448558 ) ) ( not ( = ?auto_448557 ?auto_448559 ) ) ( not ( = ?auto_448558 ?auto_448559 ) ) ( ON ?auto_448557 ?auto_448558 ) ( ON ?auto_448556 ?auto_448557 ) ( CLEAR ?auto_448554 ) ( ON ?auto_448555 ?auto_448556 ) ( CLEAR ?auto_448555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_448544 ?auto_448545 ?auto_448546 ?auto_448547 ?auto_448548 ?auto_448549 ?auto_448550 ?auto_448551 ?auto_448552 ?auto_448553 ?auto_448554 ?auto_448555 )
      ( MAKE-15PILE ?auto_448544 ?auto_448545 ?auto_448546 ?auto_448547 ?auto_448548 ?auto_448549 ?auto_448550 ?auto_448551 ?auto_448552 ?auto_448553 ?auto_448554 ?auto_448555 ?auto_448556 ?auto_448557 ?auto_448558 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448575 - BLOCK
      ?auto_448576 - BLOCK
      ?auto_448577 - BLOCK
      ?auto_448578 - BLOCK
      ?auto_448579 - BLOCK
      ?auto_448580 - BLOCK
      ?auto_448581 - BLOCK
      ?auto_448582 - BLOCK
      ?auto_448583 - BLOCK
      ?auto_448584 - BLOCK
      ?auto_448585 - BLOCK
      ?auto_448586 - BLOCK
      ?auto_448587 - BLOCK
      ?auto_448588 - BLOCK
      ?auto_448589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_448589 ) ( ON-TABLE ?auto_448575 ) ( ON ?auto_448576 ?auto_448575 ) ( ON ?auto_448577 ?auto_448576 ) ( ON ?auto_448578 ?auto_448577 ) ( ON ?auto_448579 ?auto_448578 ) ( ON ?auto_448580 ?auto_448579 ) ( ON ?auto_448581 ?auto_448580 ) ( ON ?auto_448582 ?auto_448581 ) ( ON ?auto_448583 ?auto_448582 ) ( ON ?auto_448584 ?auto_448583 ) ( ON ?auto_448585 ?auto_448584 ) ( not ( = ?auto_448575 ?auto_448576 ) ) ( not ( = ?auto_448575 ?auto_448577 ) ) ( not ( = ?auto_448575 ?auto_448578 ) ) ( not ( = ?auto_448575 ?auto_448579 ) ) ( not ( = ?auto_448575 ?auto_448580 ) ) ( not ( = ?auto_448575 ?auto_448581 ) ) ( not ( = ?auto_448575 ?auto_448582 ) ) ( not ( = ?auto_448575 ?auto_448583 ) ) ( not ( = ?auto_448575 ?auto_448584 ) ) ( not ( = ?auto_448575 ?auto_448585 ) ) ( not ( = ?auto_448575 ?auto_448586 ) ) ( not ( = ?auto_448575 ?auto_448587 ) ) ( not ( = ?auto_448575 ?auto_448588 ) ) ( not ( = ?auto_448575 ?auto_448589 ) ) ( not ( = ?auto_448576 ?auto_448577 ) ) ( not ( = ?auto_448576 ?auto_448578 ) ) ( not ( = ?auto_448576 ?auto_448579 ) ) ( not ( = ?auto_448576 ?auto_448580 ) ) ( not ( = ?auto_448576 ?auto_448581 ) ) ( not ( = ?auto_448576 ?auto_448582 ) ) ( not ( = ?auto_448576 ?auto_448583 ) ) ( not ( = ?auto_448576 ?auto_448584 ) ) ( not ( = ?auto_448576 ?auto_448585 ) ) ( not ( = ?auto_448576 ?auto_448586 ) ) ( not ( = ?auto_448576 ?auto_448587 ) ) ( not ( = ?auto_448576 ?auto_448588 ) ) ( not ( = ?auto_448576 ?auto_448589 ) ) ( not ( = ?auto_448577 ?auto_448578 ) ) ( not ( = ?auto_448577 ?auto_448579 ) ) ( not ( = ?auto_448577 ?auto_448580 ) ) ( not ( = ?auto_448577 ?auto_448581 ) ) ( not ( = ?auto_448577 ?auto_448582 ) ) ( not ( = ?auto_448577 ?auto_448583 ) ) ( not ( = ?auto_448577 ?auto_448584 ) ) ( not ( = ?auto_448577 ?auto_448585 ) ) ( not ( = ?auto_448577 ?auto_448586 ) ) ( not ( = ?auto_448577 ?auto_448587 ) ) ( not ( = ?auto_448577 ?auto_448588 ) ) ( not ( = ?auto_448577 ?auto_448589 ) ) ( not ( = ?auto_448578 ?auto_448579 ) ) ( not ( = ?auto_448578 ?auto_448580 ) ) ( not ( = ?auto_448578 ?auto_448581 ) ) ( not ( = ?auto_448578 ?auto_448582 ) ) ( not ( = ?auto_448578 ?auto_448583 ) ) ( not ( = ?auto_448578 ?auto_448584 ) ) ( not ( = ?auto_448578 ?auto_448585 ) ) ( not ( = ?auto_448578 ?auto_448586 ) ) ( not ( = ?auto_448578 ?auto_448587 ) ) ( not ( = ?auto_448578 ?auto_448588 ) ) ( not ( = ?auto_448578 ?auto_448589 ) ) ( not ( = ?auto_448579 ?auto_448580 ) ) ( not ( = ?auto_448579 ?auto_448581 ) ) ( not ( = ?auto_448579 ?auto_448582 ) ) ( not ( = ?auto_448579 ?auto_448583 ) ) ( not ( = ?auto_448579 ?auto_448584 ) ) ( not ( = ?auto_448579 ?auto_448585 ) ) ( not ( = ?auto_448579 ?auto_448586 ) ) ( not ( = ?auto_448579 ?auto_448587 ) ) ( not ( = ?auto_448579 ?auto_448588 ) ) ( not ( = ?auto_448579 ?auto_448589 ) ) ( not ( = ?auto_448580 ?auto_448581 ) ) ( not ( = ?auto_448580 ?auto_448582 ) ) ( not ( = ?auto_448580 ?auto_448583 ) ) ( not ( = ?auto_448580 ?auto_448584 ) ) ( not ( = ?auto_448580 ?auto_448585 ) ) ( not ( = ?auto_448580 ?auto_448586 ) ) ( not ( = ?auto_448580 ?auto_448587 ) ) ( not ( = ?auto_448580 ?auto_448588 ) ) ( not ( = ?auto_448580 ?auto_448589 ) ) ( not ( = ?auto_448581 ?auto_448582 ) ) ( not ( = ?auto_448581 ?auto_448583 ) ) ( not ( = ?auto_448581 ?auto_448584 ) ) ( not ( = ?auto_448581 ?auto_448585 ) ) ( not ( = ?auto_448581 ?auto_448586 ) ) ( not ( = ?auto_448581 ?auto_448587 ) ) ( not ( = ?auto_448581 ?auto_448588 ) ) ( not ( = ?auto_448581 ?auto_448589 ) ) ( not ( = ?auto_448582 ?auto_448583 ) ) ( not ( = ?auto_448582 ?auto_448584 ) ) ( not ( = ?auto_448582 ?auto_448585 ) ) ( not ( = ?auto_448582 ?auto_448586 ) ) ( not ( = ?auto_448582 ?auto_448587 ) ) ( not ( = ?auto_448582 ?auto_448588 ) ) ( not ( = ?auto_448582 ?auto_448589 ) ) ( not ( = ?auto_448583 ?auto_448584 ) ) ( not ( = ?auto_448583 ?auto_448585 ) ) ( not ( = ?auto_448583 ?auto_448586 ) ) ( not ( = ?auto_448583 ?auto_448587 ) ) ( not ( = ?auto_448583 ?auto_448588 ) ) ( not ( = ?auto_448583 ?auto_448589 ) ) ( not ( = ?auto_448584 ?auto_448585 ) ) ( not ( = ?auto_448584 ?auto_448586 ) ) ( not ( = ?auto_448584 ?auto_448587 ) ) ( not ( = ?auto_448584 ?auto_448588 ) ) ( not ( = ?auto_448584 ?auto_448589 ) ) ( not ( = ?auto_448585 ?auto_448586 ) ) ( not ( = ?auto_448585 ?auto_448587 ) ) ( not ( = ?auto_448585 ?auto_448588 ) ) ( not ( = ?auto_448585 ?auto_448589 ) ) ( not ( = ?auto_448586 ?auto_448587 ) ) ( not ( = ?auto_448586 ?auto_448588 ) ) ( not ( = ?auto_448586 ?auto_448589 ) ) ( not ( = ?auto_448587 ?auto_448588 ) ) ( not ( = ?auto_448587 ?auto_448589 ) ) ( not ( = ?auto_448588 ?auto_448589 ) ) ( ON ?auto_448588 ?auto_448589 ) ( ON ?auto_448587 ?auto_448588 ) ( CLEAR ?auto_448585 ) ( ON ?auto_448586 ?auto_448587 ) ( CLEAR ?auto_448586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_448575 ?auto_448576 ?auto_448577 ?auto_448578 ?auto_448579 ?auto_448580 ?auto_448581 ?auto_448582 ?auto_448583 ?auto_448584 ?auto_448585 ?auto_448586 )
      ( MAKE-15PILE ?auto_448575 ?auto_448576 ?auto_448577 ?auto_448578 ?auto_448579 ?auto_448580 ?auto_448581 ?auto_448582 ?auto_448583 ?auto_448584 ?auto_448585 ?auto_448586 ?auto_448587 ?auto_448588 ?auto_448589 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448605 - BLOCK
      ?auto_448606 - BLOCK
      ?auto_448607 - BLOCK
      ?auto_448608 - BLOCK
      ?auto_448609 - BLOCK
      ?auto_448610 - BLOCK
      ?auto_448611 - BLOCK
      ?auto_448612 - BLOCK
      ?auto_448613 - BLOCK
      ?auto_448614 - BLOCK
      ?auto_448615 - BLOCK
      ?auto_448616 - BLOCK
      ?auto_448617 - BLOCK
      ?auto_448618 - BLOCK
      ?auto_448619 - BLOCK
    )
    :vars
    (
      ?auto_448620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448619 ?auto_448620 ) ( ON-TABLE ?auto_448605 ) ( ON ?auto_448606 ?auto_448605 ) ( ON ?auto_448607 ?auto_448606 ) ( ON ?auto_448608 ?auto_448607 ) ( ON ?auto_448609 ?auto_448608 ) ( ON ?auto_448610 ?auto_448609 ) ( ON ?auto_448611 ?auto_448610 ) ( ON ?auto_448612 ?auto_448611 ) ( ON ?auto_448613 ?auto_448612 ) ( ON ?auto_448614 ?auto_448613 ) ( not ( = ?auto_448605 ?auto_448606 ) ) ( not ( = ?auto_448605 ?auto_448607 ) ) ( not ( = ?auto_448605 ?auto_448608 ) ) ( not ( = ?auto_448605 ?auto_448609 ) ) ( not ( = ?auto_448605 ?auto_448610 ) ) ( not ( = ?auto_448605 ?auto_448611 ) ) ( not ( = ?auto_448605 ?auto_448612 ) ) ( not ( = ?auto_448605 ?auto_448613 ) ) ( not ( = ?auto_448605 ?auto_448614 ) ) ( not ( = ?auto_448605 ?auto_448615 ) ) ( not ( = ?auto_448605 ?auto_448616 ) ) ( not ( = ?auto_448605 ?auto_448617 ) ) ( not ( = ?auto_448605 ?auto_448618 ) ) ( not ( = ?auto_448605 ?auto_448619 ) ) ( not ( = ?auto_448605 ?auto_448620 ) ) ( not ( = ?auto_448606 ?auto_448607 ) ) ( not ( = ?auto_448606 ?auto_448608 ) ) ( not ( = ?auto_448606 ?auto_448609 ) ) ( not ( = ?auto_448606 ?auto_448610 ) ) ( not ( = ?auto_448606 ?auto_448611 ) ) ( not ( = ?auto_448606 ?auto_448612 ) ) ( not ( = ?auto_448606 ?auto_448613 ) ) ( not ( = ?auto_448606 ?auto_448614 ) ) ( not ( = ?auto_448606 ?auto_448615 ) ) ( not ( = ?auto_448606 ?auto_448616 ) ) ( not ( = ?auto_448606 ?auto_448617 ) ) ( not ( = ?auto_448606 ?auto_448618 ) ) ( not ( = ?auto_448606 ?auto_448619 ) ) ( not ( = ?auto_448606 ?auto_448620 ) ) ( not ( = ?auto_448607 ?auto_448608 ) ) ( not ( = ?auto_448607 ?auto_448609 ) ) ( not ( = ?auto_448607 ?auto_448610 ) ) ( not ( = ?auto_448607 ?auto_448611 ) ) ( not ( = ?auto_448607 ?auto_448612 ) ) ( not ( = ?auto_448607 ?auto_448613 ) ) ( not ( = ?auto_448607 ?auto_448614 ) ) ( not ( = ?auto_448607 ?auto_448615 ) ) ( not ( = ?auto_448607 ?auto_448616 ) ) ( not ( = ?auto_448607 ?auto_448617 ) ) ( not ( = ?auto_448607 ?auto_448618 ) ) ( not ( = ?auto_448607 ?auto_448619 ) ) ( not ( = ?auto_448607 ?auto_448620 ) ) ( not ( = ?auto_448608 ?auto_448609 ) ) ( not ( = ?auto_448608 ?auto_448610 ) ) ( not ( = ?auto_448608 ?auto_448611 ) ) ( not ( = ?auto_448608 ?auto_448612 ) ) ( not ( = ?auto_448608 ?auto_448613 ) ) ( not ( = ?auto_448608 ?auto_448614 ) ) ( not ( = ?auto_448608 ?auto_448615 ) ) ( not ( = ?auto_448608 ?auto_448616 ) ) ( not ( = ?auto_448608 ?auto_448617 ) ) ( not ( = ?auto_448608 ?auto_448618 ) ) ( not ( = ?auto_448608 ?auto_448619 ) ) ( not ( = ?auto_448608 ?auto_448620 ) ) ( not ( = ?auto_448609 ?auto_448610 ) ) ( not ( = ?auto_448609 ?auto_448611 ) ) ( not ( = ?auto_448609 ?auto_448612 ) ) ( not ( = ?auto_448609 ?auto_448613 ) ) ( not ( = ?auto_448609 ?auto_448614 ) ) ( not ( = ?auto_448609 ?auto_448615 ) ) ( not ( = ?auto_448609 ?auto_448616 ) ) ( not ( = ?auto_448609 ?auto_448617 ) ) ( not ( = ?auto_448609 ?auto_448618 ) ) ( not ( = ?auto_448609 ?auto_448619 ) ) ( not ( = ?auto_448609 ?auto_448620 ) ) ( not ( = ?auto_448610 ?auto_448611 ) ) ( not ( = ?auto_448610 ?auto_448612 ) ) ( not ( = ?auto_448610 ?auto_448613 ) ) ( not ( = ?auto_448610 ?auto_448614 ) ) ( not ( = ?auto_448610 ?auto_448615 ) ) ( not ( = ?auto_448610 ?auto_448616 ) ) ( not ( = ?auto_448610 ?auto_448617 ) ) ( not ( = ?auto_448610 ?auto_448618 ) ) ( not ( = ?auto_448610 ?auto_448619 ) ) ( not ( = ?auto_448610 ?auto_448620 ) ) ( not ( = ?auto_448611 ?auto_448612 ) ) ( not ( = ?auto_448611 ?auto_448613 ) ) ( not ( = ?auto_448611 ?auto_448614 ) ) ( not ( = ?auto_448611 ?auto_448615 ) ) ( not ( = ?auto_448611 ?auto_448616 ) ) ( not ( = ?auto_448611 ?auto_448617 ) ) ( not ( = ?auto_448611 ?auto_448618 ) ) ( not ( = ?auto_448611 ?auto_448619 ) ) ( not ( = ?auto_448611 ?auto_448620 ) ) ( not ( = ?auto_448612 ?auto_448613 ) ) ( not ( = ?auto_448612 ?auto_448614 ) ) ( not ( = ?auto_448612 ?auto_448615 ) ) ( not ( = ?auto_448612 ?auto_448616 ) ) ( not ( = ?auto_448612 ?auto_448617 ) ) ( not ( = ?auto_448612 ?auto_448618 ) ) ( not ( = ?auto_448612 ?auto_448619 ) ) ( not ( = ?auto_448612 ?auto_448620 ) ) ( not ( = ?auto_448613 ?auto_448614 ) ) ( not ( = ?auto_448613 ?auto_448615 ) ) ( not ( = ?auto_448613 ?auto_448616 ) ) ( not ( = ?auto_448613 ?auto_448617 ) ) ( not ( = ?auto_448613 ?auto_448618 ) ) ( not ( = ?auto_448613 ?auto_448619 ) ) ( not ( = ?auto_448613 ?auto_448620 ) ) ( not ( = ?auto_448614 ?auto_448615 ) ) ( not ( = ?auto_448614 ?auto_448616 ) ) ( not ( = ?auto_448614 ?auto_448617 ) ) ( not ( = ?auto_448614 ?auto_448618 ) ) ( not ( = ?auto_448614 ?auto_448619 ) ) ( not ( = ?auto_448614 ?auto_448620 ) ) ( not ( = ?auto_448615 ?auto_448616 ) ) ( not ( = ?auto_448615 ?auto_448617 ) ) ( not ( = ?auto_448615 ?auto_448618 ) ) ( not ( = ?auto_448615 ?auto_448619 ) ) ( not ( = ?auto_448615 ?auto_448620 ) ) ( not ( = ?auto_448616 ?auto_448617 ) ) ( not ( = ?auto_448616 ?auto_448618 ) ) ( not ( = ?auto_448616 ?auto_448619 ) ) ( not ( = ?auto_448616 ?auto_448620 ) ) ( not ( = ?auto_448617 ?auto_448618 ) ) ( not ( = ?auto_448617 ?auto_448619 ) ) ( not ( = ?auto_448617 ?auto_448620 ) ) ( not ( = ?auto_448618 ?auto_448619 ) ) ( not ( = ?auto_448618 ?auto_448620 ) ) ( not ( = ?auto_448619 ?auto_448620 ) ) ( ON ?auto_448618 ?auto_448619 ) ( ON ?auto_448617 ?auto_448618 ) ( ON ?auto_448616 ?auto_448617 ) ( CLEAR ?auto_448614 ) ( ON ?auto_448615 ?auto_448616 ) ( CLEAR ?auto_448615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_448605 ?auto_448606 ?auto_448607 ?auto_448608 ?auto_448609 ?auto_448610 ?auto_448611 ?auto_448612 ?auto_448613 ?auto_448614 ?auto_448615 )
      ( MAKE-15PILE ?auto_448605 ?auto_448606 ?auto_448607 ?auto_448608 ?auto_448609 ?auto_448610 ?auto_448611 ?auto_448612 ?auto_448613 ?auto_448614 ?auto_448615 ?auto_448616 ?auto_448617 ?auto_448618 ?auto_448619 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448636 - BLOCK
      ?auto_448637 - BLOCK
      ?auto_448638 - BLOCK
      ?auto_448639 - BLOCK
      ?auto_448640 - BLOCK
      ?auto_448641 - BLOCK
      ?auto_448642 - BLOCK
      ?auto_448643 - BLOCK
      ?auto_448644 - BLOCK
      ?auto_448645 - BLOCK
      ?auto_448646 - BLOCK
      ?auto_448647 - BLOCK
      ?auto_448648 - BLOCK
      ?auto_448649 - BLOCK
      ?auto_448650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_448650 ) ( ON-TABLE ?auto_448636 ) ( ON ?auto_448637 ?auto_448636 ) ( ON ?auto_448638 ?auto_448637 ) ( ON ?auto_448639 ?auto_448638 ) ( ON ?auto_448640 ?auto_448639 ) ( ON ?auto_448641 ?auto_448640 ) ( ON ?auto_448642 ?auto_448641 ) ( ON ?auto_448643 ?auto_448642 ) ( ON ?auto_448644 ?auto_448643 ) ( ON ?auto_448645 ?auto_448644 ) ( not ( = ?auto_448636 ?auto_448637 ) ) ( not ( = ?auto_448636 ?auto_448638 ) ) ( not ( = ?auto_448636 ?auto_448639 ) ) ( not ( = ?auto_448636 ?auto_448640 ) ) ( not ( = ?auto_448636 ?auto_448641 ) ) ( not ( = ?auto_448636 ?auto_448642 ) ) ( not ( = ?auto_448636 ?auto_448643 ) ) ( not ( = ?auto_448636 ?auto_448644 ) ) ( not ( = ?auto_448636 ?auto_448645 ) ) ( not ( = ?auto_448636 ?auto_448646 ) ) ( not ( = ?auto_448636 ?auto_448647 ) ) ( not ( = ?auto_448636 ?auto_448648 ) ) ( not ( = ?auto_448636 ?auto_448649 ) ) ( not ( = ?auto_448636 ?auto_448650 ) ) ( not ( = ?auto_448637 ?auto_448638 ) ) ( not ( = ?auto_448637 ?auto_448639 ) ) ( not ( = ?auto_448637 ?auto_448640 ) ) ( not ( = ?auto_448637 ?auto_448641 ) ) ( not ( = ?auto_448637 ?auto_448642 ) ) ( not ( = ?auto_448637 ?auto_448643 ) ) ( not ( = ?auto_448637 ?auto_448644 ) ) ( not ( = ?auto_448637 ?auto_448645 ) ) ( not ( = ?auto_448637 ?auto_448646 ) ) ( not ( = ?auto_448637 ?auto_448647 ) ) ( not ( = ?auto_448637 ?auto_448648 ) ) ( not ( = ?auto_448637 ?auto_448649 ) ) ( not ( = ?auto_448637 ?auto_448650 ) ) ( not ( = ?auto_448638 ?auto_448639 ) ) ( not ( = ?auto_448638 ?auto_448640 ) ) ( not ( = ?auto_448638 ?auto_448641 ) ) ( not ( = ?auto_448638 ?auto_448642 ) ) ( not ( = ?auto_448638 ?auto_448643 ) ) ( not ( = ?auto_448638 ?auto_448644 ) ) ( not ( = ?auto_448638 ?auto_448645 ) ) ( not ( = ?auto_448638 ?auto_448646 ) ) ( not ( = ?auto_448638 ?auto_448647 ) ) ( not ( = ?auto_448638 ?auto_448648 ) ) ( not ( = ?auto_448638 ?auto_448649 ) ) ( not ( = ?auto_448638 ?auto_448650 ) ) ( not ( = ?auto_448639 ?auto_448640 ) ) ( not ( = ?auto_448639 ?auto_448641 ) ) ( not ( = ?auto_448639 ?auto_448642 ) ) ( not ( = ?auto_448639 ?auto_448643 ) ) ( not ( = ?auto_448639 ?auto_448644 ) ) ( not ( = ?auto_448639 ?auto_448645 ) ) ( not ( = ?auto_448639 ?auto_448646 ) ) ( not ( = ?auto_448639 ?auto_448647 ) ) ( not ( = ?auto_448639 ?auto_448648 ) ) ( not ( = ?auto_448639 ?auto_448649 ) ) ( not ( = ?auto_448639 ?auto_448650 ) ) ( not ( = ?auto_448640 ?auto_448641 ) ) ( not ( = ?auto_448640 ?auto_448642 ) ) ( not ( = ?auto_448640 ?auto_448643 ) ) ( not ( = ?auto_448640 ?auto_448644 ) ) ( not ( = ?auto_448640 ?auto_448645 ) ) ( not ( = ?auto_448640 ?auto_448646 ) ) ( not ( = ?auto_448640 ?auto_448647 ) ) ( not ( = ?auto_448640 ?auto_448648 ) ) ( not ( = ?auto_448640 ?auto_448649 ) ) ( not ( = ?auto_448640 ?auto_448650 ) ) ( not ( = ?auto_448641 ?auto_448642 ) ) ( not ( = ?auto_448641 ?auto_448643 ) ) ( not ( = ?auto_448641 ?auto_448644 ) ) ( not ( = ?auto_448641 ?auto_448645 ) ) ( not ( = ?auto_448641 ?auto_448646 ) ) ( not ( = ?auto_448641 ?auto_448647 ) ) ( not ( = ?auto_448641 ?auto_448648 ) ) ( not ( = ?auto_448641 ?auto_448649 ) ) ( not ( = ?auto_448641 ?auto_448650 ) ) ( not ( = ?auto_448642 ?auto_448643 ) ) ( not ( = ?auto_448642 ?auto_448644 ) ) ( not ( = ?auto_448642 ?auto_448645 ) ) ( not ( = ?auto_448642 ?auto_448646 ) ) ( not ( = ?auto_448642 ?auto_448647 ) ) ( not ( = ?auto_448642 ?auto_448648 ) ) ( not ( = ?auto_448642 ?auto_448649 ) ) ( not ( = ?auto_448642 ?auto_448650 ) ) ( not ( = ?auto_448643 ?auto_448644 ) ) ( not ( = ?auto_448643 ?auto_448645 ) ) ( not ( = ?auto_448643 ?auto_448646 ) ) ( not ( = ?auto_448643 ?auto_448647 ) ) ( not ( = ?auto_448643 ?auto_448648 ) ) ( not ( = ?auto_448643 ?auto_448649 ) ) ( not ( = ?auto_448643 ?auto_448650 ) ) ( not ( = ?auto_448644 ?auto_448645 ) ) ( not ( = ?auto_448644 ?auto_448646 ) ) ( not ( = ?auto_448644 ?auto_448647 ) ) ( not ( = ?auto_448644 ?auto_448648 ) ) ( not ( = ?auto_448644 ?auto_448649 ) ) ( not ( = ?auto_448644 ?auto_448650 ) ) ( not ( = ?auto_448645 ?auto_448646 ) ) ( not ( = ?auto_448645 ?auto_448647 ) ) ( not ( = ?auto_448645 ?auto_448648 ) ) ( not ( = ?auto_448645 ?auto_448649 ) ) ( not ( = ?auto_448645 ?auto_448650 ) ) ( not ( = ?auto_448646 ?auto_448647 ) ) ( not ( = ?auto_448646 ?auto_448648 ) ) ( not ( = ?auto_448646 ?auto_448649 ) ) ( not ( = ?auto_448646 ?auto_448650 ) ) ( not ( = ?auto_448647 ?auto_448648 ) ) ( not ( = ?auto_448647 ?auto_448649 ) ) ( not ( = ?auto_448647 ?auto_448650 ) ) ( not ( = ?auto_448648 ?auto_448649 ) ) ( not ( = ?auto_448648 ?auto_448650 ) ) ( not ( = ?auto_448649 ?auto_448650 ) ) ( ON ?auto_448649 ?auto_448650 ) ( ON ?auto_448648 ?auto_448649 ) ( ON ?auto_448647 ?auto_448648 ) ( CLEAR ?auto_448645 ) ( ON ?auto_448646 ?auto_448647 ) ( CLEAR ?auto_448646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_448636 ?auto_448637 ?auto_448638 ?auto_448639 ?auto_448640 ?auto_448641 ?auto_448642 ?auto_448643 ?auto_448644 ?auto_448645 ?auto_448646 )
      ( MAKE-15PILE ?auto_448636 ?auto_448637 ?auto_448638 ?auto_448639 ?auto_448640 ?auto_448641 ?auto_448642 ?auto_448643 ?auto_448644 ?auto_448645 ?auto_448646 ?auto_448647 ?auto_448648 ?auto_448649 ?auto_448650 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448666 - BLOCK
      ?auto_448667 - BLOCK
      ?auto_448668 - BLOCK
      ?auto_448669 - BLOCK
      ?auto_448670 - BLOCK
      ?auto_448671 - BLOCK
      ?auto_448672 - BLOCK
      ?auto_448673 - BLOCK
      ?auto_448674 - BLOCK
      ?auto_448675 - BLOCK
      ?auto_448676 - BLOCK
      ?auto_448677 - BLOCK
      ?auto_448678 - BLOCK
      ?auto_448679 - BLOCK
      ?auto_448680 - BLOCK
    )
    :vars
    (
      ?auto_448681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448680 ?auto_448681 ) ( ON-TABLE ?auto_448666 ) ( ON ?auto_448667 ?auto_448666 ) ( ON ?auto_448668 ?auto_448667 ) ( ON ?auto_448669 ?auto_448668 ) ( ON ?auto_448670 ?auto_448669 ) ( ON ?auto_448671 ?auto_448670 ) ( ON ?auto_448672 ?auto_448671 ) ( ON ?auto_448673 ?auto_448672 ) ( ON ?auto_448674 ?auto_448673 ) ( not ( = ?auto_448666 ?auto_448667 ) ) ( not ( = ?auto_448666 ?auto_448668 ) ) ( not ( = ?auto_448666 ?auto_448669 ) ) ( not ( = ?auto_448666 ?auto_448670 ) ) ( not ( = ?auto_448666 ?auto_448671 ) ) ( not ( = ?auto_448666 ?auto_448672 ) ) ( not ( = ?auto_448666 ?auto_448673 ) ) ( not ( = ?auto_448666 ?auto_448674 ) ) ( not ( = ?auto_448666 ?auto_448675 ) ) ( not ( = ?auto_448666 ?auto_448676 ) ) ( not ( = ?auto_448666 ?auto_448677 ) ) ( not ( = ?auto_448666 ?auto_448678 ) ) ( not ( = ?auto_448666 ?auto_448679 ) ) ( not ( = ?auto_448666 ?auto_448680 ) ) ( not ( = ?auto_448666 ?auto_448681 ) ) ( not ( = ?auto_448667 ?auto_448668 ) ) ( not ( = ?auto_448667 ?auto_448669 ) ) ( not ( = ?auto_448667 ?auto_448670 ) ) ( not ( = ?auto_448667 ?auto_448671 ) ) ( not ( = ?auto_448667 ?auto_448672 ) ) ( not ( = ?auto_448667 ?auto_448673 ) ) ( not ( = ?auto_448667 ?auto_448674 ) ) ( not ( = ?auto_448667 ?auto_448675 ) ) ( not ( = ?auto_448667 ?auto_448676 ) ) ( not ( = ?auto_448667 ?auto_448677 ) ) ( not ( = ?auto_448667 ?auto_448678 ) ) ( not ( = ?auto_448667 ?auto_448679 ) ) ( not ( = ?auto_448667 ?auto_448680 ) ) ( not ( = ?auto_448667 ?auto_448681 ) ) ( not ( = ?auto_448668 ?auto_448669 ) ) ( not ( = ?auto_448668 ?auto_448670 ) ) ( not ( = ?auto_448668 ?auto_448671 ) ) ( not ( = ?auto_448668 ?auto_448672 ) ) ( not ( = ?auto_448668 ?auto_448673 ) ) ( not ( = ?auto_448668 ?auto_448674 ) ) ( not ( = ?auto_448668 ?auto_448675 ) ) ( not ( = ?auto_448668 ?auto_448676 ) ) ( not ( = ?auto_448668 ?auto_448677 ) ) ( not ( = ?auto_448668 ?auto_448678 ) ) ( not ( = ?auto_448668 ?auto_448679 ) ) ( not ( = ?auto_448668 ?auto_448680 ) ) ( not ( = ?auto_448668 ?auto_448681 ) ) ( not ( = ?auto_448669 ?auto_448670 ) ) ( not ( = ?auto_448669 ?auto_448671 ) ) ( not ( = ?auto_448669 ?auto_448672 ) ) ( not ( = ?auto_448669 ?auto_448673 ) ) ( not ( = ?auto_448669 ?auto_448674 ) ) ( not ( = ?auto_448669 ?auto_448675 ) ) ( not ( = ?auto_448669 ?auto_448676 ) ) ( not ( = ?auto_448669 ?auto_448677 ) ) ( not ( = ?auto_448669 ?auto_448678 ) ) ( not ( = ?auto_448669 ?auto_448679 ) ) ( not ( = ?auto_448669 ?auto_448680 ) ) ( not ( = ?auto_448669 ?auto_448681 ) ) ( not ( = ?auto_448670 ?auto_448671 ) ) ( not ( = ?auto_448670 ?auto_448672 ) ) ( not ( = ?auto_448670 ?auto_448673 ) ) ( not ( = ?auto_448670 ?auto_448674 ) ) ( not ( = ?auto_448670 ?auto_448675 ) ) ( not ( = ?auto_448670 ?auto_448676 ) ) ( not ( = ?auto_448670 ?auto_448677 ) ) ( not ( = ?auto_448670 ?auto_448678 ) ) ( not ( = ?auto_448670 ?auto_448679 ) ) ( not ( = ?auto_448670 ?auto_448680 ) ) ( not ( = ?auto_448670 ?auto_448681 ) ) ( not ( = ?auto_448671 ?auto_448672 ) ) ( not ( = ?auto_448671 ?auto_448673 ) ) ( not ( = ?auto_448671 ?auto_448674 ) ) ( not ( = ?auto_448671 ?auto_448675 ) ) ( not ( = ?auto_448671 ?auto_448676 ) ) ( not ( = ?auto_448671 ?auto_448677 ) ) ( not ( = ?auto_448671 ?auto_448678 ) ) ( not ( = ?auto_448671 ?auto_448679 ) ) ( not ( = ?auto_448671 ?auto_448680 ) ) ( not ( = ?auto_448671 ?auto_448681 ) ) ( not ( = ?auto_448672 ?auto_448673 ) ) ( not ( = ?auto_448672 ?auto_448674 ) ) ( not ( = ?auto_448672 ?auto_448675 ) ) ( not ( = ?auto_448672 ?auto_448676 ) ) ( not ( = ?auto_448672 ?auto_448677 ) ) ( not ( = ?auto_448672 ?auto_448678 ) ) ( not ( = ?auto_448672 ?auto_448679 ) ) ( not ( = ?auto_448672 ?auto_448680 ) ) ( not ( = ?auto_448672 ?auto_448681 ) ) ( not ( = ?auto_448673 ?auto_448674 ) ) ( not ( = ?auto_448673 ?auto_448675 ) ) ( not ( = ?auto_448673 ?auto_448676 ) ) ( not ( = ?auto_448673 ?auto_448677 ) ) ( not ( = ?auto_448673 ?auto_448678 ) ) ( not ( = ?auto_448673 ?auto_448679 ) ) ( not ( = ?auto_448673 ?auto_448680 ) ) ( not ( = ?auto_448673 ?auto_448681 ) ) ( not ( = ?auto_448674 ?auto_448675 ) ) ( not ( = ?auto_448674 ?auto_448676 ) ) ( not ( = ?auto_448674 ?auto_448677 ) ) ( not ( = ?auto_448674 ?auto_448678 ) ) ( not ( = ?auto_448674 ?auto_448679 ) ) ( not ( = ?auto_448674 ?auto_448680 ) ) ( not ( = ?auto_448674 ?auto_448681 ) ) ( not ( = ?auto_448675 ?auto_448676 ) ) ( not ( = ?auto_448675 ?auto_448677 ) ) ( not ( = ?auto_448675 ?auto_448678 ) ) ( not ( = ?auto_448675 ?auto_448679 ) ) ( not ( = ?auto_448675 ?auto_448680 ) ) ( not ( = ?auto_448675 ?auto_448681 ) ) ( not ( = ?auto_448676 ?auto_448677 ) ) ( not ( = ?auto_448676 ?auto_448678 ) ) ( not ( = ?auto_448676 ?auto_448679 ) ) ( not ( = ?auto_448676 ?auto_448680 ) ) ( not ( = ?auto_448676 ?auto_448681 ) ) ( not ( = ?auto_448677 ?auto_448678 ) ) ( not ( = ?auto_448677 ?auto_448679 ) ) ( not ( = ?auto_448677 ?auto_448680 ) ) ( not ( = ?auto_448677 ?auto_448681 ) ) ( not ( = ?auto_448678 ?auto_448679 ) ) ( not ( = ?auto_448678 ?auto_448680 ) ) ( not ( = ?auto_448678 ?auto_448681 ) ) ( not ( = ?auto_448679 ?auto_448680 ) ) ( not ( = ?auto_448679 ?auto_448681 ) ) ( not ( = ?auto_448680 ?auto_448681 ) ) ( ON ?auto_448679 ?auto_448680 ) ( ON ?auto_448678 ?auto_448679 ) ( ON ?auto_448677 ?auto_448678 ) ( ON ?auto_448676 ?auto_448677 ) ( CLEAR ?auto_448674 ) ( ON ?auto_448675 ?auto_448676 ) ( CLEAR ?auto_448675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_448666 ?auto_448667 ?auto_448668 ?auto_448669 ?auto_448670 ?auto_448671 ?auto_448672 ?auto_448673 ?auto_448674 ?auto_448675 )
      ( MAKE-15PILE ?auto_448666 ?auto_448667 ?auto_448668 ?auto_448669 ?auto_448670 ?auto_448671 ?auto_448672 ?auto_448673 ?auto_448674 ?auto_448675 ?auto_448676 ?auto_448677 ?auto_448678 ?auto_448679 ?auto_448680 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448697 - BLOCK
      ?auto_448698 - BLOCK
      ?auto_448699 - BLOCK
      ?auto_448700 - BLOCK
      ?auto_448701 - BLOCK
      ?auto_448702 - BLOCK
      ?auto_448703 - BLOCK
      ?auto_448704 - BLOCK
      ?auto_448705 - BLOCK
      ?auto_448706 - BLOCK
      ?auto_448707 - BLOCK
      ?auto_448708 - BLOCK
      ?auto_448709 - BLOCK
      ?auto_448710 - BLOCK
      ?auto_448711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_448711 ) ( ON-TABLE ?auto_448697 ) ( ON ?auto_448698 ?auto_448697 ) ( ON ?auto_448699 ?auto_448698 ) ( ON ?auto_448700 ?auto_448699 ) ( ON ?auto_448701 ?auto_448700 ) ( ON ?auto_448702 ?auto_448701 ) ( ON ?auto_448703 ?auto_448702 ) ( ON ?auto_448704 ?auto_448703 ) ( ON ?auto_448705 ?auto_448704 ) ( not ( = ?auto_448697 ?auto_448698 ) ) ( not ( = ?auto_448697 ?auto_448699 ) ) ( not ( = ?auto_448697 ?auto_448700 ) ) ( not ( = ?auto_448697 ?auto_448701 ) ) ( not ( = ?auto_448697 ?auto_448702 ) ) ( not ( = ?auto_448697 ?auto_448703 ) ) ( not ( = ?auto_448697 ?auto_448704 ) ) ( not ( = ?auto_448697 ?auto_448705 ) ) ( not ( = ?auto_448697 ?auto_448706 ) ) ( not ( = ?auto_448697 ?auto_448707 ) ) ( not ( = ?auto_448697 ?auto_448708 ) ) ( not ( = ?auto_448697 ?auto_448709 ) ) ( not ( = ?auto_448697 ?auto_448710 ) ) ( not ( = ?auto_448697 ?auto_448711 ) ) ( not ( = ?auto_448698 ?auto_448699 ) ) ( not ( = ?auto_448698 ?auto_448700 ) ) ( not ( = ?auto_448698 ?auto_448701 ) ) ( not ( = ?auto_448698 ?auto_448702 ) ) ( not ( = ?auto_448698 ?auto_448703 ) ) ( not ( = ?auto_448698 ?auto_448704 ) ) ( not ( = ?auto_448698 ?auto_448705 ) ) ( not ( = ?auto_448698 ?auto_448706 ) ) ( not ( = ?auto_448698 ?auto_448707 ) ) ( not ( = ?auto_448698 ?auto_448708 ) ) ( not ( = ?auto_448698 ?auto_448709 ) ) ( not ( = ?auto_448698 ?auto_448710 ) ) ( not ( = ?auto_448698 ?auto_448711 ) ) ( not ( = ?auto_448699 ?auto_448700 ) ) ( not ( = ?auto_448699 ?auto_448701 ) ) ( not ( = ?auto_448699 ?auto_448702 ) ) ( not ( = ?auto_448699 ?auto_448703 ) ) ( not ( = ?auto_448699 ?auto_448704 ) ) ( not ( = ?auto_448699 ?auto_448705 ) ) ( not ( = ?auto_448699 ?auto_448706 ) ) ( not ( = ?auto_448699 ?auto_448707 ) ) ( not ( = ?auto_448699 ?auto_448708 ) ) ( not ( = ?auto_448699 ?auto_448709 ) ) ( not ( = ?auto_448699 ?auto_448710 ) ) ( not ( = ?auto_448699 ?auto_448711 ) ) ( not ( = ?auto_448700 ?auto_448701 ) ) ( not ( = ?auto_448700 ?auto_448702 ) ) ( not ( = ?auto_448700 ?auto_448703 ) ) ( not ( = ?auto_448700 ?auto_448704 ) ) ( not ( = ?auto_448700 ?auto_448705 ) ) ( not ( = ?auto_448700 ?auto_448706 ) ) ( not ( = ?auto_448700 ?auto_448707 ) ) ( not ( = ?auto_448700 ?auto_448708 ) ) ( not ( = ?auto_448700 ?auto_448709 ) ) ( not ( = ?auto_448700 ?auto_448710 ) ) ( not ( = ?auto_448700 ?auto_448711 ) ) ( not ( = ?auto_448701 ?auto_448702 ) ) ( not ( = ?auto_448701 ?auto_448703 ) ) ( not ( = ?auto_448701 ?auto_448704 ) ) ( not ( = ?auto_448701 ?auto_448705 ) ) ( not ( = ?auto_448701 ?auto_448706 ) ) ( not ( = ?auto_448701 ?auto_448707 ) ) ( not ( = ?auto_448701 ?auto_448708 ) ) ( not ( = ?auto_448701 ?auto_448709 ) ) ( not ( = ?auto_448701 ?auto_448710 ) ) ( not ( = ?auto_448701 ?auto_448711 ) ) ( not ( = ?auto_448702 ?auto_448703 ) ) ( not ( = ?auto_448702 ?auto_448704 ) ) ( not ( = ?auto_448702 ?auto_448705 ) ) ( not ( = ?auto_448702 ?auto_448706 ) ) ( not ( = ?auto_448702 ?auto_448707 ) ) ( not ( = ?auto_448702 ?auto_448708 ) ) ( not ( = ?auto_448702 ?auto_448709 ) ) ( not ( = ?auto_448702 ?auto_448710 ) ) ( not ( = ?auto_448702 ?auto_448711 ) ) ( not ( = ?auto_448703 ?auto_448704 ) ) ( not ( = ?auto_448703 ?auto_448705 ) ) ( not ( = ?auto_448703 ?auto_448706 ) ) ( not ( = ?auto_448703 ?auto_448707 ) ) ( not ( = ?auto_448703 ?auto_448708 ) ) ( not ( = ?auto_448703 ?auto_448709 ) ) ( not ( = ?auto_448703 ?auto_448710 ) ) ( not ( = ?auto_448703 ?auto_448711 ) ) ( not ( = ?auto_448704 ?auto_448705 ) ) ( not ( = ?auto_448704 ?auto_448706 ) ) ( not ( = ?auto_448704 ?auto_448707 ) ) ( not ( = ?auto_448704 ?auto_448708 ) ) ( not ( = ?auto_448704 ?auto_448709 ) ) ( not ( = ?auto_448704 ?auto_448710 ) ) ( not ( = ?auto_448704 ?auto_448711 ) ) ( not ( = ?auto_448705 ?auto_448706 ) ) ( not ( = ?auto_448705 ?auto_448707 ) ) ( not ( = ?auto_448705 ?auto_448708 ) ) ( not ( = ?auto_448705 ?auto_448709 ) ) ( not ( = ?auto_448705 ?auto_448710 ) ) ( not ( = ?auto_448705 ?auto_448711 ) ) ( not ( = ?auto_448706 ?auto_448707 ) ) ( not ( = ?auto_448706 ?auto_448708 ) ) ( not ( = ?auto_448706 ?auto_448709 ) ) ( not ( = ?auto_448706 ?auto_448710 ) ) ( not ( = ?auto_448706 ?auto_448711 ) ) ( not ( = ?auto_448707 ?auto_448708 ) ) ( not ( = ?auto_448707 ?auto_448709 ) ) ( not ( = ?auto_448707 ?auto_448710 ) ) ( not ( = ?auto_448707 ?auto_448711 ) ) ( not ( = ?auto_448708 ?auto_448709 ) ) ( not ( = ?auto_448708 ?auto_448710 ) ) ( not ( = ?auto_448708 ?auto_448711 ) ) ( not ( = ?auto_448709 ?auto_448710 ) ) ( not ( = ?auto_448709 ?auto_448711 ) ) ( not ( = ?auto_448710 ?auto_448711 ) ) ( ON ?auto_448710 ?auto_448711 ) ( ON ?auto_448709 ?auto_448710 ) ( ON ?auto_448708 ?auto_448709 ) ( ON ?auto_448707 ?auto_448708 ) ( CLEAR ?auto_448705 ) ( ON ?auto_448706 ?auto_448707 ) ( CLEAR ?auto_448706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_448697 ?auto_448698 ?auto_448699 ?auto_448700 ?auto_448701 ?auto_448702 ?auto_448703 ?auto_448704 ?auto_448705 ?auto_448706 )
      ( MAKE-15PILE ?auto_448697 ?auto_448698 ?auto_448699 ?auto_448700 ?auto_448701 ?auto_448702 ?auto_448703 ?auto_448704 ?auto_448705 ?auto_448706 ?auto_448707 ?auto_448708 ?auto_448709 ?auto_448710 ?auto_448711 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448727 - BLOCK
      ?auto_448728 - BLOCK
      ?auto_448729 - BLOCK
      ?auto_448730 - BLOCK
      ?auto_448731 - BLOCK
      ?auto_448732 - BLOCK
      ?auto_448733 - BLOCK
      ?auto_448734 - BLOCK
      ?auto_448735 - BLOCK
      ?auto_448736 - BLOCK
      ?auto_448737 - BLOCK
      ?auto_448738 - BLOCK
      ?auto_448739 - BLOCK
      ?auto_448740 - BLOCK
      ?auto_448741 - BLOCK
    )
    :vars
    (
      ?auto_448742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448741 ?auto_448742 ) ( ON-TABLE ?auto_448727 ) ( ON ?auto_448728 ?auto_448727 ) ( ON ?auto_448729 ?auto_448728 ) ( ON ?auto_448730 ?auto_448729 ) ( ON ?auto_448731 ?auto_448730 ) ( ON ?auto_448732 ?auto_448731 ) ( ON ?auto_448733 ?auto_448732 ) ( ON ?auto_448734 ?auto_448733 ) ( not ( = ?auto_448727 ?auto_448728 ) ) ( not ( = ?auto_448727 ?auto_448729 ) ) ( not ( = ?auto_448727 ?auto_448730 ) ) ( not ( = ?auto_448727 ?auto_448731 ) ) ( not ( = ?auto_448727 ?auto_448732 ) ) ( not ( = ?auto_448727 ?auto_448733 ) ) ( not ( = ?auto_448727 ?auto_448734 ) ) ( not ( = ?auto_448727 ?auto_448735 ) ) ( not ( = ?auto_448727 ?auto_448736 ) ) ( not ( = ?auto_448727 ?auto_448737 ) ) ( not ( = ?auto_448727 ?auto_448738 ) ) ( not ( = ?auto_448727 ?auto_448739 ) ) ( not ( = ?auto_448727 ?auto_448740 ) ) ( not ( = ?auto_448727 ?auto_448741 ) ) ( not ( = ?auto_448727 ?auto_448742 ) ) ( not ( = ?auto_448728 ?auto_448729 ) ) ( not ( = ?auto_448728 ?auto_448730 ) ) ( not ( = ?auto_448728 ?auto_448731 ) ) ( not ( = ?auto_448728 ?auto_448732 ) ) ( not ( = ?auto_448728 ?auto_448733 ) ) ( not ( = ?auto_448728 ?auto_448734 ) ) ( not ( = ?auto_448728 ?auto_448735 ) ) ( not ( = ?auto_448728 ?auto_448736 ) ) ( not ( = ?auto_448728 ?auto_448737 ) ) ( not ( = ?auto_448728 ?auto_448738 ) ) ( not ( = ?auto_448728 ?auto_448739 ) ) ( not ( = ?auto_448728 ?auto_448740 ) ) ( not ( = ?auto_448728 ?auto_448741 ) ) ( not ( = ?auto_448728 ?auto_448742 ) ) ( not ( = ?auto_448729 ?auto_448730 ) ) ( not ( = ?auto_448729 ?auto_448731 ) ) ( not ( = ?auto_448729 ?auto_448732 ) ) ( not ( = ?auto_448729 ?auto_448733 ) ) ( not ( = ?auto_448729 ?auto_448734 ) ) ( not ( = ?auto_448729 ?auto_448735 ) ) ( not ( = ?auto_448729 ?auto_448736 ) ) ( not ( = ?auto_448729 ?auto_448737 ) ) ( not ( = ?auto_448729 ?auto_448738 ) ) ( not ( = ?auto_448729 ?auto_448739 ) ) ( not ( = ?auto_448729 ?auto_448740 ) ) ( not ( = ?auto_448729 ?auto_448741 ) ) ( not ( = ?auto_448729 ?auto_448742 ) ) ( not ( = ?auto_448730 ?auto_448731 ) ) ( not ( = ?auto_448730 ?auto_448732 ) ) ( not ( = ?auto_448730 ?auto_448733 ) ) ( not ( = ?auto_448730 ?auto_448734 ) ) ( not ( = ?auto_448730 ?auto_448735 ) ) ( not ( = ?auto_448730 ?auto_448736 ) ) ( not ( = ?auto_448730 ?auto_448737 ) ) ( not ( = ?auto_448730 ?auto_448738 ) ) ( not ( = ?auto_448730 ?auto_448739 ) ) ( not ( = ?auto_448730 ?auto_448740 ) ) ( not ( = ?auto_448730 ?auto_448741 ) ) ( not ( = ?auto_448730 ?auto_448742 ) ) ( not ( = ?auto_448731 ?auto_448732 ) ) ( not ( = ?auto_448731 ?auto_448733 ) ) ( not ( = ?auto_448731 ?auto_448734 ) ) ( not ( = ?auto_448731 ?auto_448735 ) ) ( not ( = ?auto_448731 ?auto_448736 ) ) ( not ( = ?auto_448731 ?auto_448737 ) ) ( not ( = ?auto_448731 ?auto_448738 ) ) ( not ( = ?auto_448731 ?auto_448739 ) ) ( not ( = ?auto_448731 ?auto_448740 ) ) ( not ( = ?auto_448731 ?auto_448741 ) ) ( not ( = ?auto_448731 ?auto_448742 ) ) ( not ( = ?auto_448732 ?auto_448733 ) ) ( not ( = ?auto_448732 ?auto_448734 ) ) ( not ( = ?auto_448732 ?auto_448735 ) ) ( not ( = ?auto_448732 ?auto_448736 ) ) ( not ( = ?auto_448732 ?auto_448737 ) ) ( not ( = ?auto_448732 ?auto_448738 ) ) ( not ( = ?auto_448732 ?auto_448739 ) ) ( not ( = ?auto_448732 ?auto_448740 ) ) ( not ( = ?auto_448732 ?auto_448741 ) ) ( not ( = ?auto_448732 ?auto_448742 ) ) ( not ( = ?auto_448733 ?auto_448734 ) ) ( not ( = ?auto_448733 ?auto_448735 ) ) ( not ( = ?auto_448733 ?auto_448736 ) ) ( not ( = ?auto_448733 ?auto_448737 ) ) ( not ( = ?auto_448733 ?auto_448738 ) ) ( not ( = ?auto_448733 ?auto_448739 ) ) ( not ( = ?auto_448733 ?auto_448740 ) ) ( not ( = ?auto_448733 ?auto_448741 ) ) ( not ( = ?auto_448733 ?auto_448742 ) ) ( not ( = ?auto_448734 ?auto_448735 ) ) ( not ( = ?auto_448734 ?auto_448736 ) ) ( not ( = ?auto_448734 ?auto_448737 ) ) ( not ( = ?auto_448734 ?auto_448738 ) ) ( not ( = ?auto_448734 ?auto_448739 ) ) ( not ( = ?auto_448734 ?auto_448740 ) ) ( not ( = ?auto_448734 ?auto_448741 ) ) ( not ( = ?auto_448734 ?auto_448742 ) ) ( not ( = ?auto_448735 ?auto_448736 ) ) ( not ( = ?auto_448735 ?auto_448737 ) ) ( not ( = ?auto_448735 ?auto_448738 ) ) ( not ( = ?auto_448735 ?auto_448739 ) ) ( not ( = ?auto_448735 ?auto_448740 ) ) ( not ( = ?auto_448735 ?auto_448741 ) ) ( not ( = ?auto_448735 ?auto_448742 ) ) ( not ( = ?auto_448736 ?auto_448737 ) ) ( not ( = ?auto_448736 ?auto_448738 ) ) ( not ( = ?auto_448736 ?auto_448739 ) ) ( not ( = ?auto_448736 ?auto_448740 ) ) ( not ( = ?auto_448736 ?auto_448741 ) ) ( not ( = ?auto_448736 ?auto_448742 ) ) ( not ( = ?auto_448737 ?auto_448738 ) ) ( not ( = ?auto_448737 ?auto_448739 ) ) ( not ( = ?auto_448737 ?auto_448740 ) ) ( not ( = ?auto_448737 ?auto_448741 ) ) ( not ( = ?auto_448737 ?auto_448742 ) ) ( not ( = ?auto_448738 ?auto_448739 ) ) ( not ( = ?auto_448738 ?auto_448740 ) ) ( not ( = ?auto_448738 ?auto_448741 ) ) ( not ( = ?auto_448738 ?auto_448742 ) ) ( not ( = ?auto_448739 ?auto_448740 ) ) ( not ( = ?auto_448739 ?auto_448741 ) ) ( not ( = ?auto_448739 ?auto_448742 ) ) ( not ( = ?auto_448740 ?auto_448741 ) ) ( not ( = ?auto_448740 ?auto_448742 ) ) ( not ( = ?auto_448741 ?auto_448742 ) ) ( ON ?auto_448740 ?auto_448741 ) ( ON ?auto_448739 ?auto_448740 ) ( ON ?auto_448738 ?auto_448739 ) ( ON ?auto_448737 ?auto_448738 ) ( ON ?auto_448736 ?auto_448737 ) ( CLEAR ?auto_448734 ) ( ON ?auto_448735 ?auto_448736 ) ( CLEAR ?auto_448735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_448727 ?auto_448728 ?auto_448729 ?auto_448730 ?auto_448731 ?auto_448732 ?auto_448733 ?auto_448734 ?auto_448735 )
      ( MAKE-15PILE ?auto_448727 ?auto_448728 ?auto_448729 ?auto_448730 ?auto_448731 ?auto_448732 ?auto_448733 ?auto_448734 ?auto_448735 ?auto_448736 ?auto_448737 ?auto_448738 ?auto_448739 ?auto_448740 ?auto_448741 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448758 - BLOCK
      ?auto_448759 - BLOCK
      ?auto_448760 - BLOCK
      ?auto_448761 - BLOCK
      ?auto_448762 - BLOCK
      ?auto_448763 - BLOCK
      ?auto_448764 - BLOCK
      ?auto_448765 - BLOCK
      ?auto_448766 - BLOCK
      ?auto_448767 - BLOCK
      ?auto_448768 - BLOCK
      ?auto_448769 - BLOCK
      ?auto_448770 - BLOCK
      ?auto_448771 - BLOCK
      ?auto_448772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_448772 ) ( ON-TABLE ?auto_448758 ) ( ON ?auto_448759 ?auto_448758 ) ( ON ?auto_448760 ?auto_448759 ) ( ON ?auto_448761 ?auto_448760 ) ( ON ?auto_448762 ?auto_448761 ) ( ON ?auto_448763 ?auto_448762 ) ( ON ?auto_448764 ?auto_448763 ) ( ON ?auto_448765 ?auto_448764 ) ( not ( = ?auto_448758 ?auto_448759 ) ) ( not ( = ?auto_448758 ?auto_448760 ) ) ( not ( = ?auto_448758 ?auto_448761 ) ) ( not ( = ?auto_448758 ?auto_448762 ) ) ( not ( = ?auto_448758 ?auto_448763 ) ) ( not ( = ?auto_448758 ?auto_448764 ) ) ( not ( = ?auto_448758 ?auto_448765 ) ) ( not ( = ?auto_448758 ?auto_448766 ) ) ( not ( = ?auto_448758 ?auto_448767 ) ) ( not ( = ?auto_448758 ?auto_448768 ) ) ( not ( = ?auto_448758 ?auto_448769 ) ) ( not ( = ?auto_448758 ?auto_448770 ) ) ( not ( = ?auto_448758 ?auto_448771 ) ) ( not ( = ?auto_448758 ?auto_448772 ) ) ( not ( = ?auto_448759 ?auto_448760 ) ) ( not ( = ?auto_448759 ?auto_448761 ) ) ( not ( = ?auto_448759 ?auto_448762 ) ) ( not ( = ?auto_448759 ?auto_448763 ) ) ( not ( = ?auto_448759 ?auto_448764 ) ) ( not ( = ?auto_448759 ?auto_448765 ) ) ( not ( = ?auto_448759 ?auto_448766 ) ) ( not ( = ?auto_448759 ?auto_448767 ) ) ( not ( = ?auto_448759 ?auto_448768 ) ) ( not ( = ?auto_448759 ?auto_448769 ) ) ( not ( = ?auto_448759 ?auto_448770 ) ) ( not ( = ?auto_448759 ?auto_448771 ) ) ( not ( = ?auto_448759 ?auto_448772 ) ) ( not ( = ?auto_448760 ?auto_448761 ) ) ( not ( = ?auto_448760 ?auto_448762 ) ) ( not ( = ?auto_448760 ?auto_448763 ) ) ( not ( = ?auto_448760 ?auto_448764 ) ) ( not ( = ?auto_448760 ?auto_448765 ) ) ( not ( = ?auto_448760 ?auto_448766 ) ) ( not ( = ?auto_448760 ?auto_448767 ) ) ( not ( = ?auto_448760 ?auto_448768 ) ) ( not ( = ?auto_448760 ?auto_448769 ) ) ( not ( = ?auto_448760 ?auto_448770 ) ) ( not ( = ?auto_448760 ?auto_448771 ) ) ( not ( = ?auto_448760 ?auto_448772 ) ) ( not ( = ?auto_448761 ?auto_448762 ) ) ( not ( = ?auto_448761 ?auto_448763 ) ) ( not ( = ?auto_448761 ?auto_448764 ) ) ( not ( = ?auto_448761 ?auto_448765 ) ) ( not ( = ?auto_448761 ?auto_448766 ) ) ( not ( = ?auto_448761 ?auto_448767 ) ) ( not ( = ?auto_448761 ?auto_448768 ) ) ( not ( = ?auto_448761 ?auto_448769 ) ) ( not ( = ?auto_448761 ?auto_448770 ) ) ( not ( = ?auto_448761 ?auto_448771 ) ) ( not ( = ?auto_448761 ?auto_448772 ) ) ( not ( = ?auto_448762 ?auto_448763 ) ) ( not ( = ?auto_448762 ?auto_448764 ) ) ( not ( = ?auto_448762 ?auto_448765 ) ) ( not ( = ?auto_448762 ?auto_448766 ) ) ( not ( = ?auto_448762 ?auto_448767 ) ) ( not ( = ?auto_448762 ?auto_448768 ) ) ( not ( = ?auto_448762 ?auto_448769 ) ) ( not ( = ?auto_448762 ?auto_448770 ) ) ( not ( = ?auto_448762 ?auto_448771 ) ) ( not ( = ?auto_448762 ?auto_448772 ) ) ( not ( = ?auto_448763 ?auto_448764 ) ) ( not ( = ?auto_448763 ?auto_448765 ) ) ( not ( = ?auto_448763 ?auto_448766 ) ) ( not ( = ?auto_448763 ?auto_448767 ) ) ( not ( = ?auto_448763 ?auto_448768 ) ) ( not ( = ?auto_448763 ?auto_448769 ) ) ( not ( = ?auto_448763 ?auto_448770 ) ) ( not ( = ?auto_448763 ?auto_448771 ) ) ( not ( = ?auto_448763 ?auto_448772 ) ) ( not ( = ?auto_448764 ?auto_448765 ) ) ( not ( = ?auto_448764 ?auto_448766 ) ) ( not ( = ?auto_448764 ?auto_448767 ) ) ( not ( = ?auto_448764 ?auto_448768 ) ) ( not ( = ?auto_448764 ?auto_448769 ) ) ( not ( = ?auto_448764 ?auto_448770 ) ) ( not ( = ?auto_448764 ?auto_448771 ) ) ( not ( = ?auto_448764 ?auto_448772 ) ) ( not ( = ?auto_448765 ?auto_448766 ) ) ( not ( = ?auto_448765 ?auto_448767 ) ) ( not ( = ?auto_448765 ?auto_448768 ) ) ( not ( = ?auto_448765 ?auto_448769 ) ) ( not ( = ?auto_448765 ?auto_448770 ) ) ( not ( = ?auto_448765 ?auto_448771 ) ) ( not ( = ?auto_448765 ?auto_448772 ) ) ( not ( = ?auto_448766 ?auto_448767 ) ) ( not ( = ?auto_448766 ?auto_448768 ) ) ( not ( = ?auto_448766 ?auto_448769 ) ) ( not ( = ?auto_448766 ?auto_448770 ) ) ( not ( = ?auto_448766 ?auto_448771 ) ) ( not ( = ?auto_448766 ?auto_448772 ) ) ( not ( = ?auto_448767 ?auto_448768 ) ) ( not ( = ?auto_448767 ?auto_448769 ) ) ( not ( = ?auto_448767 ?auto_448770 ) ) ( not ( = ?auto_448767 ?auto_448771 ) ) ( not ( = ?auto_448767 ?auto_448772 ) ) ( not ( = ?auto_448768 ?auto_448769 ) ) ( not ( = ?auto_448768 ?auto_448770 ) ) ( not ( = ?auto_448768 ?auto_448771 ) ) ( not ( = ?auto_448768 ?auto_448772 ) ) ( not ( = ?auto_448769 ?auto_448770 ) ) ( not ( = ?auto_448769 ?auto_448771 ) ) ( not ( = ?auto_448769 ?auto_448772 ) ) ( not ( = ?auto_448770 ?auto_448771 ) ) ( not ( = ?auto_448770 ?auto_448772 ) ) ( not ( = ?auto_448771 ?auto_448772 ) ) ( ON ?auto_448771 ?auto_448772 ) ( ON ?auto_448770 ?auto_448771 ) ( ON ?auto_448769 ?auto_448770 ) ( ON ?auto_448768 ?auto_448769 ) ( ON ?auto_448767 ?auto_448768 ) ( CLEAR ?auto_448765 ) ( ON ?auto_448766 ?auto_448767 ) ( CLEAR ?auto_448766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_448758 ?auto_448759 ?auto_448760 ?auto_448761 ?auto_448762 ?auto_448763 ?auto_448764 ?auto_448765 ?auto_448766 )
      ( MAKE-15PILE ?auto_448758 ?auto_448759 ?auto_448760 ?auto_448761 ?auto_448762 ?auto_448763 ?auto_448764 ?auto_448765 ?auto_448766 ?auto_448767 ?auto_448768 ?auto_448769 ?auto_448770 ?auto_448771 ?auto_448772 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448788 - BLOCK
      ?auto_448789 - BLOCK
      ?auto_448790 - BLOCK
      ?auto_448791 - BLOCK
      ?auto_448792 - BLOCK
      ?auto_448793 - BLOCK
      ?auto_448794 - BLOCK
      ?auto_448795 - BLOCK
      ?auto_448796 - BLOCK
      ?auto_448797 - BLOCK
      ?auto_448798 - BLOCK
      ?auto_448799 - BLOCK
      ?auto_448800 - BLOCK
      ?auto_448801 - BLOCK
      ?auto_448802 - BLOCK
    )
    :vars
    (
      ?auto_448803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448802 ?auto_448803 ) ( ON-TABLE ?auto_448788 ) ( ON ?auto_448789 ?auto_448788 ) ( ON ?auto_448790 ?auto_448789 ) ( ON ?auto_448791 ?auto_448790 ) ( ON ?auto_448792 ?auto_448791 ) ( ON ?auto_448793 ?auto_448792 ) ( ON ?auto_448794 ?auto_448793 ) ( not ( = ?auto_448788 ?auto_448789 ) ) ( not ( = ?auto_448788 ?auto_448790 ) ) ( not ( = ?auto_448788 ?auto_448791 ) ) ( not ( = ?auto_448788 ?auto_448792 ) ) ( not ( = ?auto_448788 ?auto_448793 ) ) ( not ( = ?auto_448788 ?auto_448794 ) ) ( not ( = ?auto_448788 ?auto_448795 ) ) ( not ( = ?auto_448788 ?auto_448796 ) ) ( not ( = ?auto_448788 ?auto_448797 ) ) ( not ( = ?auto_448788 ?auto_448798 ) ) ( not ( = ?auto_448788 ?auto_448799 ) ) ( not ( = ?auto_448788 ?auto_448800 ) ) ( not ( = ?auto_448788 ?auto_448801 ) ) ( not ( = ?auto_448788 ?auto_448802 ) ) ( not ( = ?auto_448788 ?auto_448803 ) ) ( not ( = ?auto_448789 ?auto_448790 ) ) ( not ( = ?auto_448789 ?auto_448791 ) ) ( not ( = ?auto_448789 ?auto_448792 ) ) ( not ( = ?auto_448789 ?auto_448793 ) ) ( not ( = ?auto_448789 ?auto_448794 ) ) ( not ( = ?auto_448789 ?auto_448795 ) ) ( not ( = ?auto_448789 ?auto_448796 ) ) ( not ( = ?auto_448789 ?auto_448797 ) ) ( not ( = ?auto_448789 ?auto_448798 ) ) ( not ( = ?auto_448789 ?auto_448799 ) ) ( not ( = ?auto_448789 ?auto_448800 ) ) ( not ( = ?auto_448789 ?auto_448801 ) ) ( not ( = ?auto_448789 ?auto_448802 ) ) ( not ( = ?auto_448789 ?auto_448803 ) ) ( not ( = ?auto_448790 ?auto_448791 ) ) ( not ( = ?auto_448790 ?auto_448792 ) ) ( not ( = ?auto_448790 ?auto_448793 ) ) ( not ( = ?auto_448790 ?auto_448794 ) ) ( not ( = ?auto_448790 ?auto_448795 ) ) ( not ( = ?auto_448790 ?auto_448796 ) ) ( not ( = ?auto_448790 ?auto_448797 ) ) ( not ( = ?auto_448790 ?auto_448798 ) ) ( not ( = ?auto_448790 ?auto_448799 ) ) ( not ( = ?auto_448790 ?auto_448800 ) ) ( not ( = ?auto_448790 ?auto_448801 ) ) ( not ( = ?auto_448790 ?auto_448802 ) ) ( not ( = ?auto_448790 ?auto_448803 ) ) ( not ( = ?auto_448791 ?auto_448792 ) ) ( not ( = ?auto_448791 ?auto_448793 ) ) ( not ( = ?auto_448791 ?auto_448794 ) ) ( not ( = ?auto_448791 ?auto_448795 ) ) ( not ( = ?auto_448791 ?auto_448796 ) ) ( not ( = ?auto_448791 ?auto_448797 ) ) ( not ( = ?auto_448791 ?auto_448798 ) ) ( not ( = ?auto_448791 ?auto_448799 ) ) ( not ( = ?auto_448791 ?auto_448800 ) ) ( not ( = ?auto_448791 ?auto_448801 ) ) ( not ( = ?auto_448791 ?auto_448802 ) ) ( not ( = ?auto_448791 ?auto_448803 ) ) ( not ( = ?auto_448792 ?auto_448793 ) ) ( not ( = ?auto_448792 ?auto_448794 ) ) ( not ( = ?auto_448792 ?auto_448795 ) ) ( not ( = ?auto_448792 ?auto_448796 ) ) ( not ( = ?auto_448792 ?auto_448797 ) ) ( not ( = ?auto_448792 ?auto_448798 ) ) ( not ( = ?auto_448792 ?auto_448799 ) ) ( not ( = ?auto_448792 ?auto_448800 ) ) ( not ( = ?auto_448792 ?auto_448801 ) ) ( not ( = ?auto_448792 ?auto_448802 ) ) ( not ( = ?auto_448792 ?auto_448803 ) ) ( not ( = ?auto_448793 ?auto_448794 ) ) ( not ( = ?auto_448793 ?auto_448795 ) ) ( not ( = ?auto_448793 ?auto_448796 ) ) ( not ( = ?auto_448793 ?auto_448797 ) ) ( not ( = ?auto_448793 ?auto_448798 ) ) ( not ( = ?auto_448793 ?auto_448799 ) ) ( not ( = ?auto_448793 ?auto_448800 ) ) ( not ( = ?auto_448793 ?auto_448801 ) ) ( not ( = ?auto_448793 ?auto_448802 ) ) ( not ( = ?auto_448793 ?auto_448803 ) ) ( not ( = ?auto_448794 ?auto_448795 ) ) ( not ( = ?auto_448794 ?auto_448796 ) ) ( not ( = ?auto_448794 ?auto_448797 ) ) ( not ( = ?auto_448794 ?auto_448798 ) ) ( not ( = ?auto_448794 ?auto_448799 ) ) ( not ( = ?auto_448794 ?auto_448800 ) ) ( not ( = ?auto_448794 ?auto_448801 ) ) ( not ( = ?auto_448794 ?auto_448802 ) ) ( not ( = ?auto_448794 ?auto_448803 ) ) ( not ( = ?auto_448795 ?auto_448796 ) ) ( not ( = ?auto_448795 ?auto_448797 ) ) ( not ( = ?auto_448795 ?auto_448798 ) ) ( not ( = ?auto_448795 ?auto_448799 ) ) ( not ( = ?auto_448795 ?auto_448800 ) ) ( not ( = ?auto_448795 ?auto_448801 ) ) ( not ( = ?auto_448795 ?auto_448802 ) ) ( not ( = ?auto_448795 ?auto_448803 ) ) ( not ( = ?auto_448796 ?auto_448797 ) ) ( not ( = ?auto_448796 ?auto_448798 ) ) ( not ( = ?auto_448796 ?auto_448799 ) ) ( not ( = ?auto_448796 ?auto_448800 ) ) ( not ( = ?auto_448796 ?auto_448801 ) ) ( not ( = ?auto_448796 ?auto_448802 ) ) ( not ( = ?auto_448796 ?auto_448803 ) ) ( not ( = ?auto_448797 ?auto_448798 ) ) ( not ( = ?auto_448797 ?auto_448799 ) ) ( not ( = ?auto_448797 ?auto_448800 ) ) ( not ( = ?auto_448797 ?auto_448801 ) ) ( not ( = ?auto_448797 ?auto_448802 ) ) ( not ( = ?auto_448797 ?auto_448803 ) ) ( not ( = ?auto_448798 ?auto_448799 ) ) ( not ( = ?auto_448798 ?auto_448800 ) ) ( not ( = ?auto_448798 ?auto_448801 ) ) ( not ( = ?auto_448798 ?auto_448802 ) ) ( not ( = ?auto_448798 ?auto_448803 ) ) ( not ( = ?auto_448799 ?auto_448800 ) ) ( not ( = ?auto_448799 ?auto_448801 ) ) ( not ( = ?auto_448799 ?auto_448802 ) ) ( not ( = ?auto_448799 ?auto_448803 ) ) ( not ( = ?auto_448800 ?auto_448801 ) ) ( not ( = ?auto_448800 ?auto_448802 ) ) ( not ( = ?auto_448800 ?auto_448803 ) ) ( not ( = ?auto_448801 ?auto_448802 ) ) ( not ( = ?auto_448801 ?auto_448803 ) ) ( not ( = ?auto_448802 ?auto_448803 ) ) ( ON ?auto_448801 ?auto_448802 ) ( ON ?auto_448800 ?auto_448801 ) ( ON ?auto_448799 ?auto_448800 ) ( ON ?auto_448798 ?auto_448799 ) ( ON ?auto_448797 ?auto_448798 ) ( ON ?auto_448796 ?auto_448797 ) ( CLEAR ?auto_448794 ) ( ON ?auto_448795 ?auto_448796 ) ( CLEAR ?auto_448795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_448788 ?auto_448789 ?auto_448790 ?auto_448791 ?auto_448792 ?auto_448793 ?auto_448794 ?auto_448795 )
      ( MAKE-15PILE ?auto_448788 ?auto_448789 ?auto_448790 ?auto_448791 ?auto_448792 ?auto_448793 ?auto_448794 ?auto_448795 ?auto_448796 ?auto_448797 ?auto_448798 ?auto_448799 ?auto_448800 ?auto_448801 ?auto_448802 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448819 - BLOCK
      ?auto_448820 - BLOCK
      ?auto_448821 - BLOCK
      ?auto_448822 - BLOCK
      ?auto_448823 - BLOCK
      ?auto_448824 - BLOCK
      ?auto_448825 - BLOCK
      ?auto_448826 - BLOCK
      ?auto_448827 - BLOCK
      ?auto_448828 - BLOCK
      ?auto_448829 - BLOCK
      ?auto_448830 - BLOCK
      ?auto_448831 - BLOCK
      ?auto_448832 - BLOCK
      ?auto_448833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_448833 ) ( ON-TABLE ?auto_448819 ) ( ON ?auto_448820 ?auto_448819 ) ( ON ?auto_448821 ?auto_448820 ) ( ON ?auto_448822 ?auto_448821 ) ( ON ?auto_448823 ?auto_448822 ) ( ON ?auto_448824 ?auto_448823 ) ( ON ?auto_448825 ?auto_448824 ) ( not ( = ?auto_448819 ?auto_448820 ) ) ( not ( = ?auto_448819 ?auto_448821 ) ) ( not ( = ?auto_448819 ?auto_448822 ) ) ( not ( = ?auto_448819 ?auto_448823 ) ) ( not ( = ?auto_448819 ?auto_448824 ) ) ( not ( = ?auto_448819 ?auto_448825 ) ) ( not ( = ?auto_448819 ?auto_448826 ) ) ( not ( = ?auto_448819 ?auto_448827 ) ) ( not ( = ?auto_448819 ?auto_448828 ) ) ( not ( = ?auto_448819 ?auto_448829 ) ) ( not ( = ?auto_448819 ?auto_448830 ) ) ( not ( = ?auto_448819 ?auto_448831 ) ) ( not ( = ?auto_448819 ?auto_448832 ) ) ( not ( = ?auto_448819 ?auto_448833 ) ) ( not ( = ?auto_448820 ?auto_448821 ) ) ( not ( = ?auto_448820 ?auto_448822 ) ) ( not ( = ?auto_448820 ?auto_448823 ) ) ( not ( = ?auto_448820 ?auto_448824 ) ) ( not ( = ?auto_448820 ?auto_448825 ) ) ( not ( = ?auto_448820 ?auto_448826 ) ) ( not ( = ?auto_448820 ?auto_448827 ) ) ( not ( = ?auto_448820 ?auto_448828 ) ) ( not ( = ?auto_448820 ?auto_448829 ) ) ( not ( = ?auto_448820 ?auto_448830 ) ) ( not ( = ?auto_448820 ?auto_448831 ) ) ( not ( = ?auto_448820 ?auto_448832 ) ) ( not ( = ?auto_448820 ?auto_448833 ) ) ( not ( = ?auto_448821 ?auto_448822 ) ) ( not ( = ?auto_448821 ?auto_448823 ) ) ( not ( = ?auto_448821 ?auto_448824 ) ) ( not ( = ?auto_448821 ?auto_448825 ) ) ( not ( = ?auto_448821 ?auto_448826 ) ) ( not ( = ?auto_448821 ?auto_448827 ) ) ( not ( = ?auto_448821 ?auto_448828 ) ) ( not ( = ?auto_448821 ?auto_448829 ) ) ( not ( = ?auto_448821 ?auto_448830 ) ) ( not ( = ?auto_448821 ?auto_448831 ) ) ( not ( = ?auto_448821 ?auto_448832 ) ) ( not ( = ?auto_448821 ?auto_448833 ) ) ( not ( = ?auto_448822 ?auto_448823 ) ) ( not ( = ?auto_448822 ?auto_448824 ) ) ( not ( = ?auto_448822 ?auto_448825 ) ) ( not ( = ?auto_448822 ?auto_448826 ) ) ( not ( = ?auto_448822 ?auto_448827 ) ) ( not ( = ?auto_448822 ?auto_448828 ) ) ( not ( = ?auto_448822 ?auto_448829 ) ) ( not ( = ?auto_448822 ?auto_448830 ) ) ( not ( = ?auto_448822 ?auto_448831 ) ) ( not ( = ?auto_448822 ?auto_448832 ) ) ( not ( = ?auto_448822 ?auto_448833 ) ) ( not ( = ?auto_448823 ?auto_448824 ) ) ( not ( = ?auto_448823 ?auto_448825 ) ) ( not ( = ?auto_448823 ?auto_448826 ) ) ( not ( = ?auto_448823 ?auto_448827 ) ) ( not ( = ?auto_448823 ?auto_448828 ) ) ( not ( = ?auto_448823 ?auto_448829 ) ) ( not ( = ?auto_448823 ?auto_448830 ) ) ( not ( = ?auto_448823 ?auto_448831 ) ) ( not ( = ?auto_448823 ?auto_448832 ) ) ( not ( = ?auto_448823 ?auto_448833 ) ) ( not ( = ?auto_448824 ?auto_448825 ) ) ( not ( = ?auto_448824 ?auto_448826 ) ) ( not ( = ?auto_448824 ?auto_448827 ) ) ( not ( = ?auto_448824 ?auto_448828 ) ) ( not ( = ?auto_448824 ?auto_448829 ) ) ( not ( = ?auto_448824 ?auto_448830 ) ) ( not ( = ?auto_448824 ?auto_448831 ) ) ( not ( = ?auto_448824 ?auto_448832 ) ) ( not ( = ?auto_448824 ?auto_448833 ) ) ( not ( = ?auto_448825 ?auto_448826 ) ) ( not ( = ?auto_448825 ?auto_448827 ) ) ( not ( = ?auto_448825 ?auto_448828 ) ) ( not ( = ?auto_448825 ?auto_448829 ) ) ( not ( = ?auto_448825 ?auto_448830 ) ) ( not ( = ?auto_448825 ?auto_448831 ) ) ( not ( = ?auto_448825 ?auto_448832 ) ) ( not ( = ?auto_448825 ?auto_448833 ) ) ( not ( = ?auto_448826 ?auto_448827 ) ) ( not ( = ?auto_448826 ?auto_448828 ) ) ( not ( = ?auto_448826 ?auto_448829 ) ) ( not ( = ?auto_448826 ?auto_448830 ) ) ( not ( = ?auto_448826 ?auto_448831 ) ) ( not ( = ?auto_448826 ?auto_448832 ) ) ( not ( = ?auto_448826 ?auto_448833 ) ) ( not ( = ?auto_448827 ?auto_448828 ) ) ( not ( = ?auto_448827 ?auto_448829 ) ) ( not ( = ?auto_448827 ?auto_448830 ) ) ( not ( = ?auto_448827 ?auto_448831 ) ) ( not ( = ?auto_448827 ?auto_448832 ) ) ( not ( = ?auto_448827 ?auto_448833 ) ) ( not ( = ?auto_448828 ?auto_448829 ) ) ( not ( = ?auto_448828 ?auto_448830 ) ) ( not ( = ?auto_448828 ?auto_448831 ) ) ( not ( = ?auto_448828 ?auto_448832 ) ) ( not ( = ?auto_448828 ?auto_448833 ) ) ( not ( = ?auto_448829 ?auto_448830 ) ) ( not ( = ?auto_448829 ?auto_448831 ) ) ( not ( = ?auto_448829 ?auto_448832 ) ) ( not ( = ?auto_448829 ?auto_448833 ) ) ( not ( = ?auto_448830 ?auto_448831 ) ) ( not ( = ?auto_448830 ?auto_448832 ) ) ( not ( = ?auto_448830 ?auto_448833 ) ) ( not ( = ?auto_448831 ?auto_448832 ) ) ( not ( = ?auto_448831 ?auto_448833 ) ) ( not ( = ?auto_448832 ?auto_448833 ) ) ( ON ?auto_448832 ?auto_448833 ) ( ON ?auto_448831 ?auto_448832 ) ( ON ?auto_448830 ?auto_448831 ) ( ON ?auto_448829 ?auto_448830 ) ( ON ?auto_448828 ?auto_448829 ) ( ON ?auto_448827 ?auto_448828 ) ( CLEAR ?auto_448825 ) ( ON ?auto_448826 ?auto_448827 ) ( CLEAR ?auto_448826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_448819 ?auto_448820 ?auto_448821 ?auto_448822 ?auto_448823 ?auto_448824 ?auto_448825 ?auto_448826 )
      ( MAKE-15PILE ?auto_448819 ?auto_448820 ?auto_448821 ?auto_448822 ?auto_448823 ?auto_448824 ?auto_448825 ?auto_448826 ?auto_448827 ?auto_448828 ?auto_448829 ?auto_448830 ?auto_448831 ?auto_448832 ?auto_448833 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448849 - BLOCK
      ?auto_448850 - BLOCK
      ?auto_448851 - BLOCK
      ?auto_448852 - BLOCK
      ?auto_448853 - BLOCK
      ?auto_448854 - BLOCK
      ?auto_448855 - BLOCK
      ?auto_448856 - BLOCK
      ?auto_448857 - BLOCK
      ?auto_448858 - BLOCK
      ?auto_448859 - BLOCK
      ?auto_448860 - BLOCK
      ?auto_448861 - BLOCK
      ?auto_448862 - BLOCK
      ?auto_448863 - BLOCK
    )
    :vars
    (
      ?auto_448864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448863 ?auto_448864 ) ( ON-TABLE ?auto_448849 ) ( ON ?auto_448850 ?auto_448849 ) ( ON ?auto_448851 ?auto_448850 ) ( ON ?auto_448852 ?auto_448851 ) ( ON ?auto_448853 ?auto_448852 ) ( ON ?auto_448854 ?auto_448853 ) ( not ( = ?auto_448849 ?auto_448850 ) ) ( not ( = ?auto_448849 ?auto_448851 ) ) ( not ( = ?auto_448849 ?auto_448852 ) ) ( not ( = ?auto_448849 ?auto_448853 ) ) ( not ( = ?auto_448849 ?auto_448854 ) ) ( not ( = ?auto_448849 ?auto_448855 ) ) ( not ( = ?auto_448849 ?auto_448856 ) ) ( not ( = ?auto_448849 ?auto_448857 ) ) ( not ( = ?auto_448849 ?auto_448858 ) ) ( not ( = ?auto_448849 ?auto_448859 ) ) ( not ( = ?auto_448849 ?auto_448860 ) ) ( not ( = ?auto_448849 ?auto_448861 ) ) ( not ( = ?auto_448849 ?auto_448862 ) ) ( not ( = ?auto_448849 ?auto_448863 ) ) ( not ( = ?auto_448849 ?auto_448864 ) ) ( not ( = ?auto_448850 ?auto_448851 ) ) ( not ( = ?auto_448850 ?auto_448852 ) ) ( not ( = ?auto_448850 ?auto_448853 ) ) ( not ( = ?auto_448850 ?auto_448854 ) ) ( not ( = ?auto_448850 ?auto_448855 ) ) ( not ( = ?auto_448850 ?auto_448856 ) ) ( not ( = ?auto_448850 ?auto_448857 ) ) ( not ( = ?auto_448850 ?auto_448858 ) ) ( not ( = ?auto_448850 ?auto_448859 ) ) ( not ( = ?auto_448850 ?auto_448860 ) ) ( not ( = ?auto_448850 ?auto_448861 ) ) ( not ( = ?auto_448850 ?auto_448862 ) ) ( not ( = ?auto_448850 ?auto_448863 ) ) ( not ( = ?auto_448850 ?auto_448864 ) ) ( not ( = ?auto_448851 ?auto_448852 ) ) ( not ( = ?auto_448851 ?auto_448853 ) ) ( not ( = ?auto_448851 ?auto_448854 ) ) ( not ( = ?auto_448851 ?auto_448855 ) ) ( not ( = ?auto_448851 ?auto_448856 ) ) ( not ( = ?auto_448851 ?auto_448857 ) ) ( not ( = ?auto_448851 ?auto_448858 ) ) ( not ( = ?auto_448851 ?auto_448859 ) ) ( not ( = ?auto_448851 ?auto_448860 ) ) ( not ( = ?auto_448851 ?auto_448861 ) ) ( not ( = ?auto_448851 ?auto_448862 ) ) ( not ( = ?auto_448851 ?auto_448863 ) ) ( not ( = ?auto_448851 ?auto_448864 ) ) ( not ( = ?auto_448852 ?auto_448853 ) ) ( not ( = ?auto_448852 ?auto_448854 ) ) ( not ( = ?auto_448852 ?auto_448855 ) ) ( not ( = ?auto_448852 ?auto_448856 ) ) ( not ( = ?auto_448852 ?auto_448857 ) ) ( not ( = ?auto_448852 ?auto_448858 ) ) ( not ( = ?auto_448852 ?auto_448859 ) ) ( not ( = ?auto_448852 ?auto_448860 ) ) ( not ( = ?auto_448852 ?auto_448861 ) ) ( not ( = ?auto_448852 ?auto_448862 ) ) ( not ( = ?auto_448852 ?auto_448863 ) ) ( not ( = ?auto_448852 ?auto_448864 ) ) ( not ( = ?auto_448853 ?auto_448854 ) ) ( not ( = ?auto_448853 ?auto_448855 ) ) ( not ( = ?auto_448853 ?auto_448856 ) ) ( not ( = ?auto_448853 ?auto_448857 ) ) ( not ( = ?auto_448853 ?auto_448858 ) ) ( not ( = ?auto_448853 ?auto_448859 ) ) ( not ( = ?auto_448853 ?auto_448860 ) ) ( not ( = ?auto_448853 ?auto_448861 ) ) ( not ( = ?auto_448853 ?auto_448862 ) ) ( not ( = ?auto_448853 ?auto_448863 ) ) ( not ( = ?auto_448853 ?auto_448864 ) ) ( not ( = ?auto_448854 ?auto_448855 ) ) ( not ( = ?auto_448854 ?auto_448856 ) ) ( not ( = ?auto_448854 ?auto_448857 ) ) ( not ( = ?auto_448854 ?auto_448858 ) ) ( not ( = ?auto_448854 ?auto_448859 ) ) ( not ( = ?auto_448854 ?auto_448860 ) ) ( not ( = ?auto_448854 ?auto_448861 ) ) ( not ( = ?auto_448854 ?auto_448862 ) ) ( not ( = ?auto_448854 ?auto_448863 ) ) ( not ( = ?auto_448854 ?auto_448864 ) ) ( not ( = ?auto_448855 ?auto_448856 ) ) ( not ( = ?auto_448855 ?auto_448857 ) ) ( not ( = ?auto_448855 ?auto_448858 ) ) ( not ( = ?auto_448855 ?auto_448859 ) ) ( not ( = ?auto_448855 ?auto_448860 ) ) ( not ( = ?auto_448855 ?auto_448861 ) ) ( not ( = ?auto_448855 ?auto_448862 ) ) ( not ( = ?auto_448855 ?auto_448863 ) ) ( not ( = ?auto_448855 ?auto_448864 ) ) ( not ( = ?auto_448856 ?auto_448857 ) ) ( not ( = ?auto_448856 ?auto_448858 ) ) ( not ( = ?auto_448856 ?auto_448859 ) ) ( not ( = ?auto_448856 ?auto_448860 ) ) ( not ( = ?auto_448856 ?auto_448861 ) ) ( not ( = ?auto_448856 ?auto_448862 ) ) ( not ( = ?auto_448856 ?auto_448863 ) ) ( not ( = ?auto_448856 ?auto_448864 ) ) ( not ( = ?auto_448857 ?auto_448858 ) ) ( not ( = ?auto_448857 ?auto_448859 ) ) ( not ( = ?auto_448857 ?auto_448860 ) ) ( not ( = ?auto_448857 ?auto_448861 ) ) ( not ( = ?auto_448857 ?auto_448862 ) ) ( not ( = ?auto_448857 ?auto_448863 ) ) ( not ( = ?auto_448857 ?auto_448864 ) ) ( not ( = ?auto_448858 ?auto_448859 ) ) ( not ( = ?auto_448858 ?auto_448860 ) ) ( not ( = ?auto_448858 ?auto_448861 ) ) ( not ( = ?auto_448858 ?auto_448862 ) ) ( not ( = ?auto_448858 ?auto_448863 ) ) ( not ( = ?auto_448858 ?auto_448864 ) ) ( not ( = ?auto_448859 ?auto_448860 ) ) ( not ( = ?auto_448859 ?auto_448861 ) ) ( not ( = ?auto_448859 ?auto_448862 ) ) ( not ( = ?auto_448859 ?auto_448863 ) ) ( not ( = ?auto_448859 ?auto_448864 ) ) ( not ( = ?auto_448860 ?auto_448861 ) ) ( not ( = ?auto_448860 ?auto_448862 ) ) ( not ( = ?auto_448860 ?auto_448863 ) ) ( not ( = ?auto_448860 ?auto_448864 ) ) ( not ( = ?auto_448861 ?auto_448862 ) ) ( not ( = ?auto_448861 ?auto_448863 ) ) ( not ( = ?auto_448861 ?auto_448864 ) ) ( not ( = ?auto_448862 ?auto_448863 ) ) ( not ( = ?auto_448862 ?auto_448864 ) ) ( not ( = ?auto_448863 ?auto_448864 ) ) ( ON ?auto_448862 ?auto_448863 ) ( ON ?auto_448861 ?auto_448862 ) ( ON ?auto_448860 ?auto_448861 ) ( ON ?auto_448859 ?auto_448860 ) ( ON ?auto_448858 ?auto_448859 ) ( ON ?auto_448857 ?auto_448858 ) ( ON ?auto_448856 ?auto_448857 ) ( CLEAR ?auto_448854 ) ( ON ?auto_448855 ?auto_448856 ) ( CLEAR ?auto_448855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_448849 ?auto_448850 ?auto_448851 ?auto_448852 ?auto_448853 ?auto_448854 ?auto_448855 )
      ( MAKE-15PILE ?auto_448849 ?auto_448850 ?auto_448851 ?auto_448852 ?auto_448853 ?auto_448854 ?auto_448855 ?auto_448856 ?auto_448857 ?auto_448858 ?auto_448859 ?auto_448860 ?auto_448861 ?auto_448862 ?auto_448863 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448880 - BLOCK
      ?auto_448881 - BLOCK
      ?auto_448882 - BLOCK
      ?auto_448883 - BLOCK
      ?auto_448884 - BLOCK
      ?auto_448885 - BLOCK
      ?auto_448886 - BLOCK
      ?auto_448887 - BLOCK
      ?auto_448888 - BLOCK
      ?auto_448889 - BLOCK
      ?auto_448890 - BLOCK
      ?auto_448891 - BLOCK
      ?auto_448892 - BLOCK
      ?auto_448893 - BLOCK
      ?auto_448894 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_448894 ) ( ON-TABLE ?auto_448880 ) ( ON ?auto_448881 ?auto_448880 ) ( ON ?auto_448882 ?auto_448881 ) ( ON ?auto_448883 ?auto_448882 ) ( ON ?auto_448884 ?auto_448883 ) ( ON ?auto_448885 ?auto_448884 ) ( not ( = ?auto_448880 ?auto_448881 ) ) ( not ( = ?auto_448880 ?auto_448882 ) ) ( not ( = ?auto_448880 ?auto_448883 ) ) ( not ( = ?auto_448880 ?auto_448884 ) ) ( not ( = ?auto_448880 ?auto_448885 ) ) ( not ( = ?auto_448880 ?auto_448886 ) ) ( not ( = ?auto_448880 ?auto_448887 ) ) ( not ( = ?auto_448880 ?auto_448888 ) ) ( not ( = ?auto_448880 ?auto_448889 ) ) ( not ( = ?auto_448880 ?auto_448890 ) ) ( not ( = ?auto_448880 ?auto_448891 ) ) ( not ( = ?auto_448880 ?auto_448892 ) ) ( not ( = ?auto_448880 ?auto_448893 ) ) ( not ( = ?auto_448880 ?auto_448894 ) ) ( not ( = ?auto_448881 ?auto_448882 ) ) ( not ( = ?auto_448881 ?auto_448883 ) ) ( not ( = ?auto_448881 ?auto_448884 ) ) ( not ( = ?auto_448881 ?auto_448885 ) ) ( not ( = ?auto_448881 ?auto_448886 ) ) ( not ( = ?auto_448881 ?auto_448887 ) ) ( not ( = ?auto_448881 ?auto_448888 ) ) ( not ( = ?auto_448881 ?auto_448889 ) ) ( not ( = ?auto_448881 ?auto_448890 ) ) ( not ( = ?auto_448881 ?auto_448891 ) ) ( not ( = ?auto_448881 ?auto_448892 ) ) ( not ( = ?auto_448881 ?auto_448893 ) ) ( not ( = ?auto_448881 ?auto_448894 ) ) ( not ( = ?auto_448882 ?auto_448883 ) ) ( not ( = ?auto_448882 ?auto_448884 ) ) ( not ( = ?auto_448882 ?auto_448885 ) ) ( not ( = ?auto_448882 ?auto_448886 ) ) ( not ( = ?auto_448882 ?auto_448887 ) ) ( not ( = ?auto_448882 ?auto_448888 ) ) ( not ( = ?auto_448882 ?auto_448889 ) ) ( not ( = ?auto_448882 ?auto_448890 ) ) ( not ( = ?auto_448882 ?auto_448891 ) ) ( not ( = ?auto_448882 ?auto_448892 ) ) ( not ( = ?auto_448882 ?auto_448893 ) ) ( not ( = ?auto_448882 ?auto_448894 ) ) ( not ( = ?auto_448883 ?auto_448884 ) ) ( not ( = ?auto_448883 ?auto_448885 ) ) ( not ( = ?auto_448883 ?auto_448886 ) ) ( not ( = ?auto_448883 ?auto_448887 ) ) ( not ( = ?auto_448883 ?auto_448888 ) ) ( not ( = ?auto_448883 ?auto_448889 ) ) ( not ( = ?auto_448883 ?auto_448890 ) ) ( not ( = ?auto_448883 ?auto_448891 ) ) ( not ( = ?auto_448883 ?auto_448892 ) ) ( not ( = ?auto_448883 ?auto_448893 ) ) ( not ( = ?auto_448883 ?auto_448894 ) ) ( not ( = ?auto_448884 ?auto_448885 ) ) ( not ( = ?auto_448884 ?auto_448886 ) ) ( not ( = ?auto_448884 ?auto_448887 ) ) ( not ( = ?auto_448884 ?auto_448888 ) ) ( not ( = ?auto_448884 ?auto_448889 ) ) ( not ( = ?auto_448884 ?auto_448890 ) ) ( not ( = ?auto_448884 ?auto_448891 ) ) ( not ( = ?auto_448884 ?auto_448892 ) ) ( not ( = ?auto_448884 ?auto_448893 ) ) ( not ( = ?auto_448884 ?auto_448894 ) ) ( not ( = ?auto_448885 ?auto_448886 ) ) ( not ( = ?auto_448885 ?auto_448887 ) ) ( not ( = ?auto_448885 ?auto_448888 ) ) ( not ( = ?auto_448885 ?auto_448889 ) ) ( not ( = ?auto_448885 ?auto_448890 ) ) ( not ( = ?auto_448885 ?auto_448891 ) ) ( not ( = ?auto_448885 ?auto_448892 ) ) ( not ( = ?auto_448885 ?auto_448893 ) ) ( not ( = ?auto_448885 ?auto_448894 ) ) ( not ( = ?auto_448886 ?auto_448887 ) ) ( not ( = ?auto_448886 ?auto_448888 ) ) ( not ( = ?auto_448886 ?auto_448889 ) ) ( not ( = ?auto_448886 ?auto_448890 ) ) ( not ( = ?auto_448886 ?auto_448891 ) ) ( not ( = ?auto_448886 ?auto_448892 ) ) ( not ( = ?auto_448886 ?auto_448893 ) ) ( not ( = ?auto_448886 ?auto_448894 ) ) ( not ( = ?auto_448887 ?auto_448888 ) ) ( not ( = ?auto_448887 ?auto_448889 ) ) ( not ( = ?auto_448887 ?auto_448890 ) ) ( not ( = ?auto_448887 ?auto_448891 ) ) ( not ( = ?auto_448887 ?auto_448892 ) ) ( not ( = ?auto_448887 ?auto_448893 ) ) ( not ( = ?auto_448887 ?auto_448894 ) ) ( not ( = ?auto_448888 ?auto_448889 ) ) ( not ( = ?auto_448888 ?auto_448890 ) ) ( not ( = ?auto_448888 ?auto_448891 ) ) ( not ( = ?auto_448888 ?auto_448892 ) ) ( not ( = ?auto_448888 ?auto_448893 ) ) ( not ( = ?auto_448888 ?auto_448894 ) ) ( not ( = ?auto_448889 ?auto_448890 ) ) ( not ( = ?auto_448889 ?auto_448891 ) ) ( not ( = ?auto_448889 ?auto_448892 ) ) ( not ( = ?auto_448889 ?auto_448893 ) ) ( not ( = ?auto_448889 ?auto_448894 ) ) ( not ( = ?auto_448890 ?auto_448891 ) ) ( not ( = ?auto_448890 ?auto_448892 ) ) ( not ( = ?auto_448890 ?auto_448893 ) ) ( not ( = ?auto_448890 ?auto_448894 ) ) ( not ( = ?auto_448891 ?auto_448892 ) ) ( not ( = ?auto_448891 ?auto_448893 ) ) ( not ( = ?auto_448891 ?auto_448894 ) ) ( not ( = ?auto_448892 ?auto_448893 ) ) ( not ( = ?auto_448892 ?auto_448894 ) ) ( not ( = ?auto_448893 ?auto_448894 ) ) ( ON ?auto_448893 ?auto_448894 ) ( ON ?auto_448892 ?auto_448893 ) ( ON ?auto_448891 ?auto_448892 ) ( ON ?auto_448890 ?auto_448891 ) ( ON ?auto_448889 ?auto_448890 ) ( ON ?auto_448888 ?auto_448889 ) ( ON ?auto_448887 ?auto_448888 ) ( CLEAR ?auto_448885 ) ( ON ?auto_448886 ?auto_448887 ) ( CLEAR ?auto_448886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_448880 ?auto_448881 ?auto_448882 ?auto_448883 ?auto_448884 ?auto_448885 ?auto_448886 )
      ( MAKE-15PILE ?auto_448880 ?auto_448881 ?auto_448882 ?auto_448883 ?auto_448884 ?auto_448885 ?auto_448886 ?auto_448887 ?auto_448888 ?auto_448889 ?auto_448890 ?auto_448891 ?auto_448892 ?auto_448893 ?auto_448894 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448910 - BLOCK
      ?auto_448911 - BLOCK
      ?auto_448912 - BLOCK
      ?auto_448913 - BLOCK
      ?auto_448914 - BLOCK
      ?auto_448915 - BLOCK
      ?auto_448916 - BLOCK
      ?auto_448917 - BLOCK
      ?auto_448918 - BLOCK
      ?auto_448919 - BLOCK
      ?auto_448920 - BLOCK
      ?auto_448921 - BLOCK
      ?auto_448922 - BLOCK
      ?auto_448923 - BLOCK
      ?auto_448924 - BLOCK
    )
    :vars
    (
      ?auto_448925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448924 ?auto_448925 ) ( ON-TABLE ?auto_448910 ) ( ON ?auto_448911 ?auto_448910 ) ( ON ?auto_448912 ?auto_448911 ) ( ON ?auto_448913 ?auto_448912 ) ( ON ?auto_448914 ?auto_448913 ) ( not ( = ?auto_448910 ?auto_448911 ) ) ( not ( = ?auto_448910 ?auto_448912 ) ) ( not ( = ?auto_448910 ?auto_448913 ) ) ( not ( = ?auto_448910 ?auto_448914 ) ) ( not ( = ?auto_448910 ?auto_448915 ) ) ( not ( = ?auto_448910 ?auto_448916 ) ) ( not ( = ?auto_448910 ?auto_448917 ) ) ( not ( = ?auto_448910 ?auto_448918 ) ) ( not ( = ?auto_448910 ?auto_448919 ) ) ( not ( = ?auto_448910 ?auto_448920 ) ) ( not ( = ?auto_448910 ?auto_448921 ) ) ( not ( = ?auto_448910 ?auto_448922 ) ) ( not ( = ?auto_448910 ?auto_448923 ) ) ( not ( = ?auto_448910 ?auto_448924 ) ) ( not ( = ?auto_448910 ?auto_448925 ) ) ( not ( = ?auto_448911 ?auto_448912 ) ) ( not ( = ?auto_448911 ?auto_448913 ) ) ( not ( = ?auto_448911 ?auto_448914 ) ) ( not ( = ?auto_448911 ?auto_448915 ) ) ( not ( = ?auto_448911 ?auto_448916 ) ) ( not ( = ?auto_448911 ?auto_448917 ) ) ( not ( = ?auto_448911 ?auto_448918 ) ) ( not ( = ?auto_448911 ?auto_448919 ) ) ( not ( = ?auto_448911 ?auto_448920 ) ) ( not ( = ?auto_448911 ?auto_448921 ) ) ( not ( = ?auto_448911 ?auto_448922 ) ) ( not ( = ?auto_448911 ?auto_448923 ) ) ( not ( = ?auto_448911 ?auto_448924 ) ) ( not ( = ?auto_448911 ?auto_448925 ) ) ( not ( = ?auto_448912 ?auto_448913 ) ) ( not ( = ?auto_448912 ?auto_448914 ) ) ( not ( = ?auto_448912 ?auto_448915 ) ) ( not ( = ?auto_448912 ?auto_448916 ) ) ( not ( = ?auto_448912 ?auto_448917 ) ) ( not ( = ?auto_448912 ?auto_448918 ) ) ( not ( = ?auto_448912 ?auto_448919 ) ) ( not ( = ?auto_448912 ?auto_448920 ) ) ( not ( = ?auto_448912 ?auto_448921 ) ) ( not ( = ?auto_448912 ?auto_448922 ) ) ( not ( = ?auto_448912 ?auto_448923 ) ) ( not ( = ?auto_448912 ?auto_448924 ) ) ( not ( = ?auto_448912 ?auto_448925 ) ) ( not ( = ?auto_448913 ?auto_448914 ) ) ( not ( = ?auto_448913 ?auto_448915 ) ) ( not ( = ?auto_448913 ?auto_448916 ) ) ( not ( = ?auto_448913 ?auto_448917 ) ) ( not ( = ?auto_448913 ?auto_448918 ) ) ( not ( = ?auto_448913 ?auto_448919 ) ) ( not ( = ?auto_448913 ?auto_448920 ) ) ( not ( = ?auto_448913 ?auto_448921 ) ) ( not ( = ?auto_448913 ?auto_448922 ) ) ( not ( = ?auto_448913 ?auto_448923 ) ) ( not ( = ?auto_448913 ?auto_448924 ) ) ( not ( = ?auto_448913 ?auto_448925 ) ) ( not ( = ?auto_448914 ?auto_448915 ) ) ( not ( = ?auto_448914 ?auto_448916 ) ) ( not ( = ?auto_448914 ?auto_448917 ) ) ( not ( = ?auto_448914 ?auto_448918 ) ) ( not ( = ?auto_448914 ?auto_448919 ) ) ( not ( = ?auto_448914 ?auto_448920 ) ) ( not ( = ?auto_448914 ?auto_448921 ) ) ( not ( = ?auto_448914 ?auto_448922 ) ) ( not ( = ?auto_448914 ?auto_448923 ) ) ( not ( = ?auto_448914 ?auto_448924 ) ) ( not ( = ?auto_448914 ?auto_448925 ) ) ( not ( = ?auto_448915 ?auto_448916 ) ) ( not ( = ?auto_448915 ?auto_448917 ) ) ( not ( = ?auto_448915 ?auto_448918 ) ) ( not ( = ?auto_448915 ?auto_448919 ) ) ( not ( = ?auto_448915 ?auto_448920 ) ) ( not ( = ?auto_448915 ?auto_448921 ) ) ( not ( = ?auto_448915 ?auto_448922 ) ) ( not ( = ?auto_448915 ?auto_448923 ) ) ( not ( = ?auto_448915 ?auto_448924 ) ) ( not ( = ?auto_448915 ?auto_448925 ) ) ( not ( = ?auto_448916 ?auto_448917 ) ) ( not ( = ?auto_448916 ?auto_448918 ) ) ( not ( = ?auto_448916 ?auto_448919 ) ) ( not ( = ?auto_448916 ?auto_448920 ) ) ( not ( = ?auto_448916 ?auto_448921 ) ) ( not ( = ?auto_448916 ?auto_448922 ) ) ( not ( = ?auto_448916 ?auto_448923 ) ) ( not ( = ?auto_448916 ?auto_448924 ) ) ( not ( = ?auto_448916 ?auto_448925 ) ) ( not ( = ?auto_448917 ?auto_448918 ) ) ( not ( = ?auto_448917 ?auto_448919 ) ) ( not ( = ?auto_448917 ?auto_448920 ) ) ( not ( = ?auto_448917 ?auto_448921 ) ) ( not ( = ?auto_448917 ?auto_448922 ) ) ( not ( = ?auto_448917 ?auto_448923 ) ) ( not ( = ?auto_448917 ?auto_448924 ) ) ( not ( = ?auto_448917 ?auto_448925 ) ) ( not ( = ?auto_448918 ?auto_448919 ) ) ( not ( = ?auto_448918 ?auto_448920 ) ) ( not ( = ?auto_448918 ?auto_448921 ) ) ( not ( = ?auto_448918 ?auto_448922 ) ) ( not ( = ?auto_448918 ?auto_448923 ) ) ( not ( = ?auto_448918 ?auto_448924 ) ) ( not ( = ?auto_448918 ?auto_448925 ) ) ( not ( = ?auto_448919 ?auto_448920 ) ) ( not ( = ?auto_448919 ?auto_448921 ) ) ( not ( = ?auto_448919 ?auto_448922 ) ) ( not ( = ?auto_448919 ?auto_448923 ) ) ( not ( = ?auto_448919 ?auto_448924 ) ) ( not ( = ?auto_448919 ?auto_448925 ) ) ( not ( = ?auto_448920 ?auto_448921 ) ) ( not ( = ?auto_448920 ?auto_448922 ) ) ( not ( = ?auto_448920 ?auto_448923 ) ) ( not ( = ?auto_448920 ?auto_448924 ) ) ( not ( = ?auto_448920 ?auto_448925 ) ) ( not ( = ?auto_448921 ?auto_448922 ) ) ( not ( = ?auto_448921 ?auto_448923 ) ) ( not ( = ?auto_448921 ?auto_448924 ) ) ( not ( = ?auto_448921 ?auto_448925 ) ) ( not ( = ?auto_448922 ?auto_448923 ) ) ( not ( = ?auto_448922 ?auto_448924 ) ) ( not ( = ?auto_448922 ?auto_448925 ) ) ( not ( = ?auto_448923 ?auto_448924 ) ) ( not ( = ?auto_448923 ?auto_448925 ) ) ( not ( = ?auto_448924 ?auto_448925 ) ) ( ON ?auto_448923 ?auto_448924 ) ( ON ?auto_448922 ?auto_448923 ) ( ON ?auto_448921 ?auto_448922 ) ( ON ?auto_448920 ?auto_448921 ) ( ON ?auto_448919 ?auto_448920 ) ( ON ?auto_448918 ?auto_448919 ) ( ON ?auto_448917 ?auto_448918 ) ( ON ?auto_448916 ?auto_448917 ) ( CLEAR ?auto_448914 ) ( ON ?auto_448915 ?auto_448916 ) ( CLEAR ?auto_448915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_448910 ?auto_448911 ?auto_448912 ?auto_448913 ?auto_448914 ?auto_448915 )
      ( MAKE-15PILE ?auto_448910 ?auto_448911 ?auto_448912 ?auto_448913 ?auto_448914 ?auto_448915 ?auto_448916 ?auto_448917 ?auto_448918 ?auto_448919 ?auto_448920 ?auto_448921 ?auto_448922 ?auto_448923 ?auto_448924 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448941 - BLOCK
      ?auto_448942 - BLOCK
      ?auto_448943 - BLOCK
      ?auto_448944 - BLOCK
      ?auto_448945 - BLOCK
      ?auto_448946 - BLOCK
      ?auto_448947 - BLOCK
      ?auto_448948 - BLOCK
      ?auto_448949 - BLOCK
      ?auto_448950 - BLOCK
      ?auto_448951 - BLOCK
      ?auto_448952 - BLOCK
      ?auto_448953 - BLOCK
      ?auto_448954 - BLOCK
      ?auto_448955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_448955 ) ( ON-TABLE ?auto_448941 ) ( ON ?auto_448942 ?auto_448941 ) ( ON ?auto_448943 ?auto_448942 ) ( ON ?auto_448944 ?auto_448943 ) ( ON ?auto_448945 ?auto_448944 ) ( not ( = ?auto_448941 ?auto_448942 ) ) ( not ( = ?auto_448941 ?auto_448943 ) ) ( not ( = ?auto_448941 ?auto_448944 ) ) ( not ( = ?auto_448941 ?auto_448945 ) ) ( not ( = ?auto_448941 ?auto_448946 ) ) ( not ( = ?auto_448941 ?auto_448947 ) ) ( not ( = ?auto_448941 ?auto_448948 ) ) ( not ( = ?auto_448941 ?auto_448949 ) ) ( not ( = ?auto_448941 ?auto_448950 ) ) ( not ( = ?auto_448941 ?auto_448951 ) ) ( not ( = ?auto_448941 ?auto_448952 ) ) ( not ( = ?auto_448941 ?auto_448953 ) ) ( not ( = ?auto_448941 ?auto_448954 ) ) ( not ( = ?auto_448941 ?auto_448955 ) ) ( not ( = ?auto_448942 ?auto_448943 ) ) ( not ( = ?auto_448942 ?auto_448944 ) ) ( not ( = ?auto_448942 ?auto_448945 ) ) ( not ( = ?auto_448942 ?auto_448946 ) ) ( not ( = ?auto_448942 ?auto_448947 ) ) ( not ( = ?auto_448942 ?auto_448948 ) ) ( not ( = ?auto_448942 ?auto_448949 ) ) ( not ( = ?auto_448942 ?auto_448950 ) ) ( not ( = ?auto_448942 ?auto_448951 ) ) ( not ( = ?auto_448942 ?auto_448952 ) ) ( not ( = ?auto_448942 ?auto_448953 ) ) ( not ( = ?auto_448942 ?auto_448954 ) ) ( not ( = ?auto_448942 ?auto_448955 ) ) ( not ( = ?auto_448943 ?auto_448944 ) ) ( not ( = ?auto_448943 ?auto_448945 ) ) ( not ( = ?auto_448943 ?auto_448946 ) ) ( not ( = ?auto_448943 ?auto_448947 ) ) ( not ( = ?auto_448943 ?auto_448948 ) ) ( not ( = ?auto_448943 ?auto_448949 ) ) ( not ( = ?auto_448943 ?auto_448950 ) ) ( not ( = ?auto_448943 ?auto_448951 ) ) ( not ( = ?auto_448943 ?auto_448952 ) ) ( not ( = ?auto_448943 ?auto_448953 ) ) ( not ( = ?auto_448943 ?auto_448954 ) ) ( not ( = ?auto_448943 ?auto_448955 ) ) ( not ( = ?auto_448944 ?auto_448945 ) ) ( not ( = ?auto_448944 ?auto_448946 ) ) ( not ( = ?auto_448944 ?auto_448947 ) ) ( not ( = ?auto_448944 ?auto_448948 ) ) ( not ( = ?auto_448944 ?auto_448949 ) ) ( not ( = ?auto_448944 ?auto_448950 ) ) ( not ( = ?auto_448944 ?auto_448951 ) ) ( not ( = ?auto_448944 ?auto_448952 ) ) ( not ( = ?auto_448944 ?auto_448953 ) ) ( not ( = ?auto_448944 ?auto_448954 ) ) ( not ( = ?auto_448944 ?auto_448955 ) ) ( not ( = ?auto_448945 ?auto_448946 ) ) ( not ( = ?auto_448945 ?auto_448947 ) ) ( not ( = ?auto_448945 ?auto_448948 ) ) ( not ( = ?auto_448945 ?auto_448949 ) ) ( not ( = ?auto_448945 ?auto_448950 ) ) ( not ( = ?auto_448945 ?auto_448951 ) ) ( not ( = ?auto_448945 ?auto_448952 ) ) ( not ( = ?auto_448945 ?auto_448953 ) ) ( not ( = ?auto_448945 ?auto_448954 ) ) ( not ( = ?auto_448945 ?auto_448955 ) ) ( not ( = ?auto_448946 ?auto_448947 ) ) ( not ( = ?auto_448946 ?auto_448948 ) ) ( not ( = ?auto_448946 ?auto_448949 ) ) ( not ( = ?auto_448946 ?auto_448950 ) ) ( not ( = ?auto_448946 ?auto_448951 ) ) ( not ( = ?auto_448946 ?auto_448952 ) ) ( not ( = ?auto_448946 ?auto_448953 ) ) ( not ( = ?auto_448946 ?auto_448954 ) ) ( not ( = ?auto_448946 ?auto_448955 ) ) ( not ( = ?auto_448947 ?auto_448948 ) ) ( not ( = ?auto_448947 ?auto_448949 ) ) ( not ( = ?auto_448947 ?auto_448950 ) ) ( not ( = ?auto_448947 ?auto_448951 ) ) ( not ( = ?auto_448947 ?auto_448952 ) ) ( not ( = ?auto_448947 ?auto_448953 ) ) ( not ( = ?auto_448947 ?auto_448954 ) ) ( not ( = ?auto_448947 ?auto_448955 ) ) ( not ( = ?auto_448948 ?auto_448949 ) ) ( not ( = ?auto_448948 ?auto_448950 ) ) ( not ( = ?auto_448948 ?auto_448951 ) ) ( not ( = ?auto_448948 ?auto_448952 ) ) ( not ( = ?auto_448948 ?auto_448953 ) ) ( not ( = ?auto_448948 ?auto_448954 ) ) ( not ( = ?auto_448948 ?auto_448955 ) ) ( not ( = ?auto_448949 ?auto_448950 ) ) ( not ( = ?auto_448949 ?auto_448951 ) ) ( not ( = ?auto_448949 ?auto_448952 ) ) ( not ( = ?auto_448949 ?auto_448953 ) ) ( not ( = ?auto_448949 ?auto_448954 ) ) ( not ( = ?auto_448949 ?auto_448955 ) ) ( not ( = ?auto_448950 ?auto_448951 ) ) ( not ( = ?auto_448950 ?auto_448952 ) ) ( not ( = ?auto_448950 ?auto_448953 ) ) ( not ( = ?auto_448950 ?auto_448954 ) ) ( not ( = ?auto_448950 ?auto_448955 ) ) ( not ( = ?auto_448951 ?auto_448952 ) ) ( not ( = ?auto_448951 ?auto_448953 ) ) ( not ( = ?auto_448951 ?auto_448954 ) ) ( not ( = ?auto_448951 ?auto_448955 ) ) ( not ( = ?auto_448952 ?auto_448953 ) ) ( not ( = ?auto_448952 ?auto_448954 ) ) ( not ( = ?auto_448952 ?auto_448955 ) ) ( not ( = ?auto_448953 ?auto_448954 ) ) ( not ( = ?auto_448953 ?auto_448955 ) ) ( not ( = ?auto_448954 ?auto_448955 ) ) ( ON ?auto_448954 ?auto_448955 ) ( ON ?auto_448953 ?auto_448954 ) ( ON ?auto_448952 ?auto_448953 ) ( ON ?auto_448951 ?auto_448952 ) ( ON ?auto_448950 ?auto_448951 ) ( ON ?auto_448949 ?auto_448950 ) ( ON ?auto_448948 ?auto_448949 ) ( ON ?auto_448947 ?auto_448948 ) ( CLEAR ?auto_448945 ) ( ON ?auto_448946 ?auto_448947 ) ( CLEAR ?auto_448946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_448941 ?auto_448942 ?auto_448943 ?auto_448944 ?auto_448945 ?auto_448946 )
      ( MAKE-15PILE ?auto_448941 ?auto_448942 ?auto_448943 ?auto_448944 ?auto_448945 ?auto_448946 ?auto_448947 ?auto_448948 ?auto_448949 ?auto_448950 ?auto_448951 ?auto_448952 ?auto_448953 ?auto_448954 ?auto_448955 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_448971 - BLOCK
      ?auto_448972 - BLOCK
      ?auto_448973 - BLOCK
      ?auto_448974 - BLOCK
      ?auto_448975 - BLOCK
      ?auto_448976 - BLOCK
      ?auto_448977 - BLOCK
      ?auto_448978 - BLOCK
      ?auto_448979 - BLOCK
      ?auto_448980 - BLOCK
      ?auto_448981 - BLOCK
      ?auto_448982 - BLOCK
      ?auto_448983 - BLOCK
      ?auto_448984 - BLOCK
      ?auto_448985 - BLOCK
    )
    :vars
    (
      ?auto_448986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_448985 ?auto_448986 ) ( ON-TABLE ?auto_448971 ) ( ON ?auto_448972 ?auto_448971 ) ( ON ?auto_448973 ?auto_448972 ) ( ON ?auto_448974 ?auto_448973 ) ( not ( = ?auto_448971 ?auto_448972 ) ) ( not ( = ?auto_448971 ?auto_448973 ) ) ( not ( = ?auto_448971 ?auto_448974 ) ) ( not ( = ?auto_448971 ?auto_448975 ) ) ( not ( = ?auto_448971 ?auto_448976 ) ) ( not ( = ?auto_448971 ?auto_448977 ) ) ( not ( = ?auto_448971 ?auto_448978 ) ) ( not ( = ?auto_448971 ?auto_448979 ) ) ( not ( = ?auto_448971 ?auto_448980 ) ) ( not ( = ?auto_448971 ?auto_448981 ) ) ( not ( = ?auto_448971 ?auto_448982 ) ) ( not ( = ?auto_448971 ?auto_448983 ) ) ( not ( = ?auto_448971 ?auto_448984 ) ) ( not ( = ?auto_448971 ?auto_448985 ) ) ( not ( = ?auto_448971 ?auto_448986 ) ) ( not ( = ?auto_448972 ?auto_448973 ) ) ( not ( = ?auto_448972 ?auto_448974 ) ) ( not ( = ?auto_448972 ?auto_448975 ) ) ( not ( = ?auto_448972 ?auto_448976 ) ) ( not ( = ?auto_448972 ?auto_448977 ) ) ( not ( = ?auto_448972 ?auto_448978 ) ) ( not ( = ?auto_448972 ?auto_448979 ) ) ( not ( = ?auto_448972 ?auto_448980 ) ) ( not ( = ?auto_448972 ?auto_448981 ) ) ( not ( = ?auto_448972 ?auto_448982 ) ) ( not ( = ?auto_448972 ?auto_448983 ) ) ( not ( = ?auto_448972 ?auto_448984 ) ) ( not ( = ?auto_448972 ?auto_448985 ) ) ( not ( = ?auto_448972 ?auto_448986 ) ) ( not ( = ?auto_448973 ?auto_448974 ) ) ( not ( = ?auto_448973 ?auto_448975 ) ) ( not ( = ?auto_448973 ?auto_448976 ) ) ( not ( = ?auto_448973 ?auto_448977 ) ) ( not ( = ?auto_448973 ?auto_448978 ) ) ( not ( = ?auto_448973 ?auto_448979 ) ) ( not ( = ?auto_448973 ?auto_448980 ) ) ( not ( = ?auto_448973 ?auto_448981 ) ) ( not ( = ?auto_448973 ?auto_448982 ) ) ( not ( = ?auto_448973 ?auto_448983 ) ) ( not ( = ?auto_448973 ?auto_448984 ) ) ( not ( = ?auto_448973 ?auto_448985 ) ) ( not ( = ?auto_448973 ?auto_448986 ) ) ( not ( = ?auto_448974 ?auto_448975 ) ) ( not ( = ?auto_448974 ?auto_448976 ) ) ( not ( = ?auto_448974 ?auto_448977 ) ) ( not ( = ?auto_448974 ?auto_448978 ) ) ( not ( = ?auto_448974 ?auto_448979 ) ) ( not ( = ?auto_448974 ?auto_448980 ) ) ( not ( = ?auto_448974 ?auto_448981 ) ) ( not ( = ?auto_448974 ?auto_448982 ) ) ( not ( = ?auto_448974 ?auto_448983 ) ) ( not ( = ?auto_448974 ?auto_448984 ) ) ( not ( = ?auto_448974 ?auto_448985 ) ) ( not ( = ?auto_448974 ?auto_448986 ) ) ( not ( = ?auto_448975 ?auto_448976 ) ) ( not ( = ?auto_448975 ?auto_448977 ) ) ( not ( = ?auto_448975 ?auto_448978 ) ) ( not ( = ?auto_448975 ?auto_448979 ) ) ( not ( = ?auto_448975 ?auto_448980 ) ) ( not ( = ?auto_448975 ?auto_448981 ) ) ( not ( = ?auto_448975 ?auto_448982 ) ) ( not ( = ?auto_448975 ?auto_448983 ) ) ( not ( = ?auto_448975 ?auto_448984 ) ) ( not ( = ?auto_448975 ?auto_448985 ) ) ( not ( = ?auto_448975 ?auto_448986 ) ) ( not ( = ?auto_448976 ?auto_448977 ) ) ( not ( = ?auto_448976 ?auto_448978 ) ) ( not ( = ?auto_448976 ?auto_448979 ) ) ( not ( = ?auto_448976 ?auto_448980 ) ) ( not ( = ?auto_448976 ?auto_448981 ) ) ( not ( = ?auto_448976 ?auto_448982 ) ) ( not ( = ?auto_448976 ?auto_448983 ) ) ( not ( = ?auto_448976 ?auto_448984 ) ) ( not ( = ?auto_448976 ?auto_448985 ) ) ( not ( = ?auto_448976 ?auto_448986 ) ) ( not ( = ?auto_448977 ?auto_448978 ) ) ( not ( = ?auto_448977 ?auto_448979 ) ) ( not ( = ?auto_448977 ?auto_448980 ) ) ( not ( = ?auto_448977 ?auto_448981 ) ) ( not ( = ?auto_448977 ?auto_448982 ) ) ( not ( = ?auto_448977 ?auto_448983 ) ) ( not ( = ?auto_448977 ?auto_448984 ) ) ( not ( = ?auto_448977 ?auto_448985 ) ) ( not ( = ?auto_448977 ?auto_448986 ) ) ( not ( = ?auto_448978 ?auto_448979 ) ) ( not ( = ?auto_448978 ?auto_448980 ) ) ( not ( = ?auto_448978 ?auto_448981 ) ) ( not ( = ?auto_448978 ?auto_448982 ) ) ( not ( = ?auto_448978 ?auto_448983 ) ) ( not ( = ?auto_448978 ?auto_448984 ) ) ( not ( = ?auto_448978 ?auto_448985 ) ) ( not ( = ?auto_448978 ?auto_448986 ) ) ( not ( = ?auto_448979 ?auto_448980 ) ) ( not ( = ?auto_448979 ?auto_448981 ) ) ( not ( = ?auto_448979 ?auto_448982 ) ) ( not ( = ?auto_448979 ?auto_448983 ) ) ( not ( = ?auto_448979 ?auto_448984 ) ) ( not ( = ?auto_448979 ?auto_448985 ) ) ( not ( = ?auto_448979 ?auto_448986 ) ) ( not ( = ?auto_448980 ?auto_448981 ) ) ( not ( = ?auto_448980 ?auto_448982 ) ) ( not ( = ?auto_448980 ?auto_448983 ) ) ( not ( = ?auto_448980 ?auto_448984 ) ) ( not ( = ?auto_448980 ?auto_448985 ) ) ( not ( = ?auto_448980 ?auto_448986 ) ) ( not ( = ?auto_448981 ?auto_448982 ) ) ( not ( = ?auto_448981 ?auto_448983 ) ) ( not ( = ?auto_448981 ?auto_448984 ) ) ( not ( = ?auto_448981 ?auto_448985 ) ) ( not ( = ?auto_448981 ?auto_448986 ) ) ( not ( = ?auto_448982 ?auto_448983 ) ) ( not ( = ?auto_448982 ?auto_448984 ) ) ( not ( = ?auto_448982 ?auto_448985 ) ) ( not ( = ?auto_448982 ?auto_448986 ) ) ( not ( = ?auto_448983 ?auto_448984 ) ) ( not ( = ?auto_448983 ?auto_448985 ) ) ( not ( = ?auto_448983 ?auto_448986 ) ) ( not ( = ?auto_448984 ?auto_448985 ) ) ( not ( = ?auto_448984 ?auto_448986 ) ) ( not ( = ?auto_448985 ?auto_448986 ) ) ( ON ?auto_448984 ?auto_448985 ) ( ON ?auto_448983 ?auto_448984 ) ( ON ?auto_448982 ?auto_448983 ) ( ON ?auto_448981 ?auto_448982 ) ( ON ?auto_448980 ?auto_448981 ) ( ON ?auto_448979 ?auto_448980 ) ( ON ?auto_448978 ?auto_448979 ) ( ON ?auto_448977 ?auto_448978 ) ( ON ?auto_448976 ?auto_448977 ) ( CLEAR ?auto_448974 ) ( ON ?auto_448975 ?auto_448976 ) ( CLEAR ?auto_448975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_448971 ?auto_448972 ?auto_448973 ?auto_448974 ?auto_448975 )
      ( MAKE-15PILE ?auto_448971 ?auto_448972 ?auto_448973 ?auto_448974 ?auto_448975 ?auto_448976 ?auto_448977 ?auto_448978 ?auto_448979 ?auto_448980 ?auto_448981 ?auto_448982 ?auto_448983 ?auto_448984 ?auto_448985 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_449002 - BLOCK
      ?auto_449003 - BLOCK
      ?auto_449004 - BLOCK
      ?auto_449005 - BLOCK
      ?auto_449006 - BLOCK
      ?auto_449007 - BLOCK
      ?auto_449008 - BLOCK
      ?auto_449009 - BLOCK
      ?auto_449010 - BLOCK
      ?auto_449011 - BLOCK
      ?auto_449012 - BLOCK
      ?auto_449013 - BLOCK
      ?auto_449014 - BLOCK
      ?auto_449015 - BLOCK
      ?auto_449016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_449016 ) ( ON-TABLE ?auto_449002 ) ( ON ?auto_449003 ?auto_449002 ) ( ON ?auto_449004 ?auto_449003 ) ( ON ?auto_449005 ?auto_449004 ) ( not ( = ?auto_449002 ?auto_449003 ) ) ( not ( = ?auto_449002 ?auto_449004 ) ) ( not ( = ?auto_449002 ?auto_449005 ) ) ( not ( = ?auto_449002 ?auto_449006 ) ) ( not ( = ?auto_449002 ?auto_449007 ) ) ( not ( = ?auto_449002 ?auto_449008 ) ) ( not ( = ?auto_449002 ?auto_449009 ) ) ( not ( = ?auto_449002 ?auto_449010 ) ) ( not ( = ?auto_449002 ?auto_449011 ) ) ( not ( = ?auto_449002 ?auto_449012 ) ) ( not ( = ?auto_449002 ?auto_449013 ) ) ( not ( = ?auto_449002 ?auto_449014 ) ) ( not ( = ?auto_449002 ?auto_449015 ) ) ( not ( = ?auto_449002 ?auto_449016 ) ) ( not ( = ?auto_449003 ?auto_449004 ) ) ( not ( = ?auto_449003 ?auto_449005 ) ) ( not ( = ?auto_449003 ?auto_449006 ) ) ( not ( = ?auto_449003 ?auto_449007 ) ) ( not ( = ?auto_449003 ?auto_449008 ) ) ( not ( = ?auto_449003 ?auto_449009 ) ) ( not ( = ?auto_449003 ?auto_449010 ) ) ( not ( = ?auto_449003 ?auto_449011 ) ) ( not ( = ?auto_449003 ?auto_449012 ) ) ( not ( = ?auto_449003 ?auto_449013 ) ) ( not ( = ?auto_449003 ?auto_449014 ) ) ( not ( = ?auto_449003 ?auto_449015 ) ) ( not ( = ?auto_449003 ?auto_449016 ) ) ( not ( = ?auto_449004 ?auto_449005 ) ) ( not ( = ?auto_449004 ?auto_449006 ) ) ( not ( = ?auto_449004 ?auto_449007 ) ) ( not ( = ?auto_449004 ?auto_449008 ) ) ( not ( = ?auto_449004 ?auto_449009 ) ) ( not ( = ?auto_449004 ?auto_449010 ) ) ( not ( = ?auto_449004 ?auto_449011 ) ) ( not ( = ?auto_449004 ?auto_449012 ) ) ( not ( = ?auto_449004 ?auto_449013 ) ) ( not ( = ?auto_449004 ?auto_449014 ) ) ( not ( = ?auto_449004 ?auto_449015 ) ) ( not ( = ?auto_449004 ?auto_449016 ) ) ( not ( = ?auto_449005 ?auto_449006 ) ) ( not ( = ?auto_449005 ?auto_449007 ) ) ( not ( = ?auto_449005 ?auto_449008 ) ) ( not ( = ?auto_449005 ?auto_449009 ) ) ( not ( = ?auto_449005 ?auto_449010 ) ) ( not ( = ?auto_449005 ?auto_449011 ) ) ( not ( = ?auto_449005 ?auto_449012 ) ) ( not ( = ?auto_449005 ?auto_449013 ) ) ( not ( = ?auto_449005 ?auto_449014 ) ) ( not ( = ?auto_449005 ?auto_449015 ) ) ( not ( = ?auto_449005 ?auto_449016 ) ) ( not ( = ?auto_449006 ?auto_449007 ) ) ( not ( = ?auto_449006 ?auto_449008 ) ) ( not ( = ?auto_449006 ?auto_449009 ) ) ( not ( = ?auto_449006 ?auto_449010 ) ) ( not ( = ?auto_449006 ?auto_449011 ) ) ( not ( = ?auto_449006 ?auto_449012 ) ) ( not ( = ?auto_449006 ?auto_449013 ) ) ( not ( = ?auto_449006 ?auto_449014 ) ) ( not ( = ?auto_449006 ?auto_449015 ) ) ( not ( = ?auto_449006 ?auto_449016 ) ) ( not ( = ?auto_449007 ?auto_449008 ) ) ( not ( = ?auto_449007 ?auto_449009 ) ) ( not ( = ?auto_449007 ?auto_449010 ) ) ( not ( = ?auto_449007 ?auto_449011 ) ) ( not ( = ?auto_449007 ?auto_449012 ) ) ( not ( = ?auto_449007 ?auto_449013 ) ) ( not ( = ?auto_449007 ?auto_449014 ) ) ( not ( = ?auto_449007 ?auto_449015 ) ) ( not ( = ?auto_449007 ?auto_449016 ) ) ( not ( = ?auto_449008 ?auto_449009 ) ) ( not ( = ?auto_449008 ?auto_449010 ) ) ( not ( = ?auto_449008 ?auto_449011 ) ) ( not ( = ?auto_449008 ?auto_449012 ) ) ( not ( = ?auto_449008 ?auto_449013 ) ) ( not ( = ?auto_449008 ?auto_449014 ) ) ( not ( = ?auto_449008 ?auto_449015 ) ) ( not ( = ?auto_449008 ?auto_449016 ) ) ( not ( = ?auto_449009 ?auto_449010 ) ) ( not ( = ?auto_449009 ?auto_449011 ) ) ( not ( = ?auto_449009 ?auto_449012 ) ) ( not ( = ?auto_449009 ?auto_449013 ) ) ( not ( = ?auto_449009 ?auto_449014 ) ) ( not ( = ?auto_449009 ?auto_449015 ) ) ( not ( = ?auto_449009 ?auto_449016 ) ) ( not ( = ?auto_449010 ?auto_449011 ) ) ( not ( = ?auto_449010 ?auto_449012 ) ) ( not ( = ?auto_449010 ?auto_449013 ) ) ( not ( = ?auto_449010 ?auto_449014 ) ) ( not ( = ?auto_449010 ?auto_449015 ) ) ( not ( = ?auto_449010 ?auto_449016 ) ) ( not ( = ?auto_449011 ?auto_449012 ) ) ( not ( = ?auto_449011 ?auto_449013 ) ) ( not ( = ?auto_449011 ?auto_449014 ) ) ( not ( = ?auto_449011 ?auto_449015 ) ) ( not ( = ?auto_449011 ?auto_449016 ) ) ( not ( = ?auto_449012 ?auto_449013 ) ) ( not ( = ?auto_449012 ?auto_449014 ) ) ( not ( = ?auto_449012 ?auto_449015 ) ) ( not ( = ?auto_449012 ?auto_449016 ) ) ( not ( = ?auto_449013 ?auto_449014 ) ) ( not ( = ?auto_449013 ?auto_449015 ) ) ( not ( = ?auto_449013 ?auto_449016 ) ) ( not ( = ?auto_449014 ?auto_449015 ) ) ( not ( = ?auto_449014 ?auto_449016 ) ) ( not ( = ?auto_449015 ?auto_449016 ) ) ( ON ?auto_449015 ?auto_449016 ) ( ON ?auto_449014 ?auto_449015 ) ( ON ?auto_449013 ?auto_449014 ) ( ON ?auto_449012 ?auto_449013 ) ( ON ?auto_449011 ?auto_449012 ) ( ON ?auto_449010 ?auto_449011 ) ( ON ?auto_449009 ?auto_449010 ) ( ON ?auto_449008 ?auto_449009 ) ( ON ?auto_449007 ?auto_449008 ) ( CLEAR ?auto_449005 ) ( ON ?auto_449006 ?auto_449007 ) ( CLEAR ?auto_449006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_449002 ?auto_449003 ?auto_449004 ?auto_449005 ?auto_449006 )
      ( MAKE-15PILE ?auto_449002 ?auto_449003 ?auto_449004 ?auto_449005 ?auto_449006 ?auto_449007 ?auto_449008 ?auto_449009 ?auto_449010 ?auto_449011 ?auto_449012 ?auto_449013 ?auto_449014 ?auto_449015 ?auto_449016 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_449032 - BLOCK
      ?auto_449033 - BLOCK
      ?auto_449034 - BLOCK
      ?auto_449035 - BLOCK
      ?auto_449036 - BLOCK
      ?auto_449037 - BLOCK
      ?auto_449038 - BLOCK
      ?auto_449039 - BLOCK
      ?auto_449040 - BLOCK
      ?auto_449041 - BLOCK
      ?auto_449042 - BLOCK
      ?auto_449043 - BLOCK
      ?auto_449044 - BLOCK
      ?auto_449045 - BLOCK
      ?auto_449046 - BLOCK
    )
    :vars
    (
      ?auto_449047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449046 ?auto_449047 ) ( ON-TABLE ?auto_449032 ) ( ON ?auto_449033 ?auto_449032 ) ( ON ?auto_449034 ?auto_449033 ) ( not ( = ?auto_449032 ?auto_449033 ) ) ( not ( = ?auto_449032 ?auto_449034 ) ) ( not ( = ?auto_449032 ?auto_449035 ) ) ( not ( = ?auto_449032 ?auto_449036 ) ) ( not ( = ?auto_449032 ?auto_449037 ) ) ( not ( = ?auto_449032 ?auto_449038 ) ) ( not ( = ?auto_449032 ?auto_449039 ) ) ( not ( = ?auto_449032 ?auto_449040 ) ) ( not ( = ?auto_449032 ?auto_449041 ) ) ( not ( = ?auto_449032 ?auto_449042 ) ) ( not ( = ?auto_449032 ?auto_449043 ) ) ( not ( = ?auto_449032 ?auto_449044 ) ) ( not ( = ?auto_449032 ?auto_449045 ) ) ( not ( = ?auto_449032 ?auto_449046 ) ) ( not ( = ?auto_449032 ?auto_449047 ) ) ( not ( = ?auto_449033 ?auto_449034 ) ) ( not ( = ?auto_449033 ?auto_449035 ) ) ( not ( = ?auto_449033 ?auto_449036 ) ) ( not ( = ?auto_449033 ?auto_449037 ) ) ( not ( = ?auto_449033 ?auto_449038 ) ) ( not ( = ?auto_449033 ?auto_449039 ) ) ( not ( = ?auto_449033 ?auto_449040 ) ) ( not ( = ?auto_449033 ?auto_449041 ) ) ( not ( = ?auto_449033 ?auto_449042 ) ) ( not ( = ?auto_449033 ?auto_449043 ) ) ( not ( = ?auto_449033 ?auto_449044 ) ) ( not ( = ?auto_449033 ?auto_449045 ) ) ( not ( = ?auto_449033 ?auto_449046 ) ) ( not ( = ?auto_449033 ?auto_449047 ) ) ( not ( = ?auto_449034 ?auto_449035 ) ) ( not ( = ?auto_449034 ?auto_449036 ) ) ( not ( = ?auto_449034 ?auto_449037 ) ) ( not ( = ?auto_449034 ?auto_449038 ) ) ( not ( = ?auto_449034 ?auto_449039 ) ) ( not ( = ?auto_449034 ?auto_449040 ) ) ( not ( = ?auto_449034 ?auto_449041 ) ) ( not ( = ?auto_449034 ?auto_449042 ) ) ( not ( = ?auto_449034 ?auto_449043 ) ) ( not ( = ?auto_449034 ?auto_449044 ) ) ( not ( = ?auto_449034 ?auto_449045 ) ) ( not ( = ?auto_449034 ?auto_449046 ) ) ( not ( = ?auto_449034 ?auto_449047 ) ) ( not ( = ?auto_449035 ?auto_449036 ) ) ( not ( = ?auto_449035 ?auto_449037 ) ) ( not ( = ?auto_449035 ?auto_449038 ) ) ( not ( = ?auto_449035 ?auto_449039 ) ) ( not ( = ?auto_449035 ?auto_449040 ) ) ( not ( = ?auto_449035 ?auto_449041 ) ) ( not ( = ?auto_449035 ?auto_449042 ) ) ( not ( = ?auto_449035 ?auto_449043 ) ) ( not ( = ?auto_449035 ?auto_449044 ) ) ( not ( = ?auto_449035 ?auto_449045 ) ) ( not ( = ?auto_449035 ?auto_449046 ) ) ( not ( = ?auto_449035 ?auto_449047 ) ) ( not ( = ?auto_449036 ?auto_449037 ) ) ( not ( = ?auto_449036 ?auto_449038 ) ) ( not ( = ?auto_449036 ?auto_449039 ) ) ( not ( = ?auto_449036 ?auto_449040 ) ) ( not ( = ?auto_449036 ?auto_449041 ) ) ( not ( = ?auto_449036 ?auto_449042 ) ) ( not ( = ?auto_449036 ?auto_449043 ) ) ( not ( = ?auto_449036 ?auto_449044 ) ) ( not ( = ?auto_449036 ?auto_449045 ) ) ( not ( = ?auto_449036 ?auto_449046 ) ) ( not ( = ?auto_449036 ?auto_449047 ) ) ( not ( = ?auto_449037 ?auto_449038 ) ) ( not ( = ?auto_449037 ?auto_449039 ) ) ( not ( = ?auto_449037 ?auto_449040 ) ) ( not ( = ?auto_449037 ?auto_449041 ) ) ( not ( = ?auto_449037 ?auto_449042 ) ) ( not ( = ?auto_449037 ?auto_449043 ) ) ( not ( = ?auto_449037 ?auto_449044 ) ) ( not ( = ?auto_449037 ?auto_449045 ) ) ( not ( = ?auto_449037 ?auto_449046 ) ) ( not ( = ?auto_449037 ?auto_449047 ) ) ( not ( = ?auto_449038 ?auto_449039 ) ) ( not ( = ?auto_449038 ?auto_449040 ) ) ( not ( = ?auto_449038 ?auto_449041 ) ) ( not ( = ?auto_449038 ?auto_449042 ) ) ( not ( = ?auto_449038 ?auto_449043 ) ) ( not ( = ?auto_449038 ?auto_449044 ) ) ( not ( = ?auto_449038 ?auto_449045 ) ) ( not ( = ?auto_449038 ?auto_449046 ) ) ( not ( = ?auto_449038 ?auto_449047 ) ) ( not ( = ?auto_449039 ?auto_449040 ) ) ( not ( = ?auto_449039 ?auto_449041 ) ) ( not ( = ?auto_449039 ?auto_449042 ) ) ( not ( = ?auto_449039 ?auto_449043 ) ) ( not ( = ?auto_449039 ?auto_449044 ) ) ( not ( = ?auto_449039 ?auto_449045 ) ) ( not ( = ?auto_449039 ?auto_449046 ) ) ( not ( = ?auto_449039 ?auto_449047 ) ) ( not ( = ?auto_449040 ?auto_449041 ) ) ( not ( = ?auto_449040 ?auto_449042 ) ) ( not ( = ?auto_449040 ?auto_449043 ) ) ( not ( = ?auto_449040 ?auto_449044 ) ) ( not ( = ?auto_449040 ?auto_449045 ) ) ( not ( = ?auto_449040 ?auto_449046 ) ) ( not ( = ?auto_449040 ?auto_449047 ) ) ( not ( = ?auto_449041 ?auto_449042 ) ) ( not ( = ?auto_449041 ?auto_449043 ) ) ( not ( = ?auto_449041 ?auto_449044 ) ) ( not ( = ?auto_449041 ?auto_449045 ) ) ( not ( = ?auto_449041 ?auto_449046 ) ) ( not ( = ?auto_449041 ?auto_449047 ) ) ( not ( = ?auto_449042 ?auto_449043 ) ) ( not ( = ?auto_449042 ?auto_449044 ) ) ( not ( = ?auto_449042 ?auto_449045 ) ) ( not ( = ?auto_449042 ?auto_449046 ) ) ( not ( = ?auto_449042 ?auto_449047 ) ) ( not ( = ?auto_449043 ?auto_449044 ) ) ( not ( = ?auto_449043 ?auto_449045 ) ) ( not ( = ?auto_449043 ?auto_449046 ) ) ( not ( = ?auto_449043 ?auto_449047 ) ) ( not ( = ?auto_449044 ?auto_449045 ) ) ( not ( = ?auto_449044 ?auto_449046 ) ) ( not ( = ?auto_449044 ?auto_449047 ) ) ( not ( = ?auto_449045 ?auto_449046 ) ) ( not ( = ?auto_449045 ?auto_449047 ) ) ( not ( = ?auto_449046 ?auto_449047 ) ) ( ON ?auto_449045 ?auto_449046 ) ( ON ?auto_449044 ?auto_449045 ) ( ON ?auto_449043 ?auto_449044 ) ( ON ?auto_449042 ?auto_449043 ) ( ON ?auto_449041 ?auto_449042 ) ( ON ?auto_449040 ?auto_449041 ) ( ON ?auto_449039 ?auto_449040 ) ( ON ?auto_449038 ?auto_449039 ) ( ON ?auto_449037 ?auto_449038 ) ( ON ?auto_449036 ?auto_449037 ) ( CLEAR ?auto_449034 ) ( ON ?auto_449035 ?auto_449036 ) ( CLEAR ?auto_449035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_449032 ?auto_449033 ?auto_449034 ?auto_449035 )
      ( MAKE-15PILE ?auto_449032 ?auto_449033 ?auto_449034 ?auto_449035 ?auto_449036 ?auto_449037 ?auto_449038 ?auto_449039 ?auto_449040 ?auto_449041 ?auto_449042 ?auto_449043 ?auto_449044 ?auto_449045 ?auto_449046 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_449063 - BLOCK
      ?auto_449064 - BLOCK
      ?auto_449065 - BLOCK
      ?auto_449066 - BLOCK
      ?auto_449067 - BLOCK
      ?auto_449068 - BLOCK
      ?auto_449069 - BLOCK
      ?auto_449070 - BLOCK
      ?auto_449071 - BLOCK
      ?auto_449072 - BLOCK
      ?auto_449073 - BLOCK
      ?auto_449074 - BLOCK
      ?auto_449075 - BLOCK
      ?auto_449076 - BLOCK
      ?auto_449077 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_449077 ) ( ON-TABLE ?auto_449063 ) ( ON ?auto_449064 ?auto_449063 ) ( ON ?auto_449065 ?auto_449064 ) ( not ( = ?auto_449063 ?auto_449064 ) ) ( not ( = ?auto_449063 ?auto_449065 ) ) ( not ( = ?auto_449063 ?auto_449066 ) ) ( not ( = ?auto_449063 ?auto_449067 ) ) ( not ( = ?auto_449063 ?auto_449068 ) ) ( not ( = ?auto_449063 ?auto_449069 ) ) ( not ( = ?auto_449063 ?auto_449070 ) ) ( not ( = ?auto_449063 ?auto_449071 ) ) ( not ( = ?auto_449063 ?auto_449072 ) ) ( not ( = ?auto_449063 ?auto_449073 ) ) ( not ( = ?auto_449063 ?auto_449074 ) ) ( not ( = ?auto_449063 ?auto_449075 ) ) ( not ( = ?auto_449063 ?auto_449076 ) ) ( not ( = ?auto_449063 ?auto_449077 ) ) ( not ( = ?auto_449064 ?auto_449065 ) ) ( not ( = ?auto_449064 ?auto_449066 ) ) ( not ( = ?auto_449064 ?auto_449067 ) ) ( not ( = ?auto_449064 ?auto_449068 ) ) ( not ( = ?auto_449064 ?auto_449069 ) ) ( not ( = ?auto_449064 ?auto_449070 ) ) ( not ( = ?auto_449064 ?auto_449071 ) ) ( not ( = ?auto_449064 ?auto_449072 ) ) ( not ( = ?auto_449064 ?auto_449073 ) ) ( not ( = ?auto_449064 ?auto_449074 ) ) ( not ( = ?auto_449064 ?auto_449075 ) ) ( not ( = ?auto_449064 ?auto_449076 ) ) ( not ( = ?auto_449064 ?auto_449077 ) ) ( not ( = ?auto_449065 ?auto_449066 ) ) ( not ( = ?auto_449065 ?auto_449067 ) ) ( not ( = ?auto_449065 ?auto_449068 ) ) ( not ( = ?auto_449065 ?auto_449069 ) ) ( not ( = ?auto_449065 ?auto_449070 ) ) ( not ( = ?auto_449065 ?auto_449071 ) ) ( not ( = ?auto_449065 ?auto_449072 ) ) ( not ( = ?auto_449065 ?auto_449073 ) ) ( not ( = ?auto_449065 ?auto_449074 ) ) ( not ( = ?auto_449065 ?auto_449075 ) ) ( not ( = ?auto_449065 ?auto_449076 ) ) ( not ( = ?auto_449065 ?auto_449077 ) ) ( not ( = ?auto_449066 ?auto_449067 ) ) ( not ( = ?auto_449066 ?auto_449068 ) ) ( not ( = ?auto_449066 ?auto_449069 ) ) ( not ( = ?auto_449066 ?auto_449070 ) ) ( not ( = ?auto_449066 ?auto_449071 ) ) ( not ( = ?auto_449066 ?auto_449072 ) ) ( not ( = ?auto_449066 ?auto_449073 ) ) ( not ( = ?auto_449066 ?auto_449074 ) ) ( not ( = ?auto_449066 ?auto_449075 ) ) ( not ( = ?auto_449066 ?auto_449076 ) ) ( not ( = ?auto_449066 ?auto_449077 ) ) ( not ( = ?auto_449067 ?auto_449068 ) ) ( not ( = ?auto_449067 ?auto_449069 ) ) ( not ( = ?auto_449067 ?auto_449070 ) ) ( not ( = ?auto_449067 ?auto_449071 ) ) ( not ( = ?auto_449067 ?auto_449072 ) ) ( not ( = ?auto_449067 ?auto_449073 ) ) ( not ( = ?auto_449067 ?auto_449074 ) ) ( not ( = ?auto_449067 ?auto_449075 ) ) ( not ( = ?auto_449067 ?auto_449076 ) ) ( not ( = ?auto_449067 ?auto_449077 ) ) ( not ( = ?auto_449068 ?auto_449069 ) ) ( not ( = ?auto_449068 ?auto_449070 ) ) ( not ( = ?auto_449068 ?auto_449071 ) ) ( not ( = ?auto_449068 ?auto_449072 ) ) ( not ( = ?auto_449068 ?auto_449073 ) ) ( not ( = ?auto_449068 ?auto_449074 ) ) ( not ( = ?auto_449068 ?auto_449075 ) ) ( not ( = ?auto_449068 ?auto_449076 ) ) ( not ( = ?auto_449068 ?auto_449077 ) ) ( not ( = ?auto_449069 ?auto_449070 ) ) ( not ( = ?auto_449069 ?auto_449071 ) ) ( not ( = ?auto_449069 ?auto_449072 ) ) ( not ( = ?auto_449069 ?auto_449073 ) ) ( not ( = ?auto_449069 ?auto_449074 ) ) ( not ( = ?auto_449069 ?auto_449075 ) ) ( not ( = ?auto_449069 ?auto_449076 ) ) ( not ( = ?auto_449069 ?auto_449077 ) ) ( not ( = ?auto_449070 ?auto_449071 ) ) ( not ( = ?auto_449070 ?auto_449072 ) ) ( not ( = ?auto_449070 ?auto_449073 ) ) ( not ( = ?auto_449070 ?auto_449074 ) ) ( not ( = ?auto_449070 ?auto_449075 ) ) ( not ( = ?auto_449070 ?auto_449076 ) ) ( not ( = ?auto_449070 ?auto_449077 ) ) ( not ( = ?auto_449071 ?auto_449072 ) ) ( not ( = ?auto_449071 ?auto_449073 ) ) ( not ( = ?auto_449071 ?auto_449074 ) ) ( not ( = ?auto_449071 ?auto_449075 ) ) ( not ( = ?auto_449071 ?auto_449076 ) ) ( not ( = ?auto_449071 ?auto_449077 ) ) ( not ( = ?auto_449072 ?auto_449073 ) ) ( not ( = ?auto_449072 ?auto_449074 ) ) ( not ( = ?auto_449072 ?auto_449075 ) ) ( not ( = ?auto_449072 ?auto_449076 ) ) ( not ( = ?auto_449072 ?auto_449077 ) ) ( not ( = ?auto_449073 ?auto_449074 ) ) ( not ( = ?auto_449073 ?auto_449075 ) ) ( not ( = ?auto_449073 ?auto_449076 ) ) ( not ( = ?auto_449073 ?auto_449077 ) ) ( not ( = ?auto_449074 ?auto_449075 ) ) ( not ( = ?auto_449074 ?auto_449076 ) ) ( not ( = ?auto_449074 ?auto_449077 ) ) ( not ( = ?auto_449075 ?auto_449076 ) ) ( not ( = ?auto_449075 ?auto_449077 ) ) ( not ( = ?auto_449076 ?auto_449077 ) ) ( ON ?auto_449076 ?auto_449077 ) ( ON ?auto_449075 ?auto_449076 ) ( ON ?auto_449074 ?auto_449075 ) ( ON ?auto_449073 ?auto_449074 ) ( ON ?auto_449072 ?auto_449073 ) ( ON ?auto_449071 ?auto_449072 ) ( ON ?auto_449070 ?auto_449071 ) ( ON ?auto_449069 ?auto_449070 ) ( ON ?auto_449068 ?auto_449069 ) ( ON ?auto_449067 ?auto_449068 ) ( CLEAR ?auto_449065 ) ( ON ?auto_449066 ?auto_449067 ) ( CLEAR ?auto_449066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_449063 ?auto_449064 ?auto_449065 ?auto_449066 )
      ( MAKE-15PILE ?auto_449063 ?auto_449064 ?auto_449065 ?auto_449066 ?auto_449067 ?auto_449068 ?auto_449069 ?auto_449070 ?auto_449071 ?auto_449072 ?auto_449073 ?auto_449074 ?auto_449075 ?auto_449076 ?auto_449077 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_449093 - BLOCK
      ?auto_449094 - BLOCK
      ?auto_449095 - BLOCK
      ?auto_449096 - BLOCK
      ?auto_449097 - BLOCK
      ?auto_449098 - BLOCK
      ?auto_449099 - BLOCK
      ?auto_449100 - BLOCK
      ?auto_449101 - BLOCK
      ?auto_449102 - BLOCK
      ?auto_449103 - BLOCK
      ?auto_449104 - BLOCK
      ?auto_449105 - BLOCK
      ?auto_449106 - BLOCK
      ?auto_449107 - BLOCK
    )
    :vars
    (
      ?auto_449108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449107 ?auto_449108 ) ( ON-TABLE ?auto_449093 ) ( ON ?auto_449094 ?auto_449093 ) ( not ( = ?auto_449093 ?auto_449094 ) ) ( not ( = ?auto_449093 ?auto_449095 ) ) ( not ( = ?auto_449093 ?auto_449096 ) ) ( not ( = ?auto_449093 ?auto_449097 ) ) ( not ( = ?auto_449093 ?auto_449098 ) ) ( not ( = ?auto_449093 ?auto_449099 ) ) ( not ( = ?auto_449093 ?auto_449100 ) ) ( not ( = ?auto_449093 ?auto_449101 ) ) ( not ( = ?auto_449093 ?auto_449102 ) ) ( not ( = ?auto_449093 ?auto_449103 ) ) ( not ( = ?auto_449093 ?auto_449104 ) ) ( not ( = ?auto_449093 ?auto_449105 ) ) ( not ( = ?auto_449093 ?auto_449106 ) ) ( not ( = ?auto_449093 ?auto_449107 ) ) ( not ( = ?auto_449093 ?auto_449108 ) ) ( not ( = ?auto_449094 ?auto_449095 ) ) ( not ( = ?auto_449094 ?auto_449096 ) ) ( not ( = ?auto_449094 ?auto_449097 ) ) ( not ( = ?auto_449094 ?auto_449098 ) ) ( not ( = ?auto_449094 ?auto_449099 ) ) ( not ( = ?auto_449094 ?auto_449100 ) ) ( not ( = ?auto_449094 ?auto_449101 ) ) ( not ( = ?auto_449094 ?auto_449102 ) ) ( not ( = ?auto_449094 ?auto_449103 ) ) ( not ( = ?auto_449094 ?auto_449104 ) ) ( not ( = ?auto_449094 ?auto_449105 ) ) ( not ( = ?auto_449094 ?auto_449106 ) ) ( not ( = ?auto_449094 ?auto_449107 ) ) ( not ( = ?auto_449094 ?auto_449108 ) ) ( not ( = ?auto_449095 ?auto_449096 ) ) ( not ( = ?auto_449095 ?auto_449097 ) ) ( not ( = ?auto_449095 ?auto_449098 ) ) ( not ( = ?auto_449095 ?auto_449099 ) ) ( not ( = ?auto_449095 ?auto_449100 ) ) ( not ( = ?auto_449095 ?auto_449101 ) ) ( not ( = ?auto_449095 ?auto_449102 ) ) ( not ( = ?auto_449095 ?auto_449103 ) ) ( not ( = ?auto_449095 ?auto_449104 ) ) ( not ( = ?auto_449095 ?auto_449105 ) ) ( not ( = ?auto_449095 ?auto_449106 ) ) ( not ( = ?auto_449095 ?auto_449107 ) ) ( not ( = ?auto_449095 ?auto_449108 ) ) ( not ( = ?auto_449096 ?auto_449097 ) ) ( not ( = ?auto_449096 ?auto_449098 ) ) ( not ( = ?auto_449096 ?auto_449099 ) ) ( not ( = ?auto_449096 ?auto_449100 ) ) ( not ( = ?auto_449096 ?auto_449101 ) ) ( not ( = ?auto_449096 ?auto_449102 ) ) ( not ( = ?auto_449096 ?auto_449103 ) ) ( not ( = ?auto_449096 ?auto_449104 ) ) ( not ( = ?auto_449096 ?auto_449105 ) ) ( not ( = ?auto_449096 ?auto_449106 ) ) ( not ( = ?auto_449096 ?auto_449107 ) ) ( not ( = ?auto_449096 ?auto_449108 ) ) ( not ( = ?auto_449097 ?auto_449098 ) ) ( not ( = ?auto_449097 ?auto_449099 ) ) ( not ( = ?auto_449097 ?auto_449100 ) ) ( not ( = ?auto_449097 ?auto_449101 ) ) ( not ( = ?auto_449097 ?auto_449102 ) ) ( not ( = ?auto_449097 ?auto_449103 ) ) ( not ( = ?auto_449097 ?auto_449104 ) ) ( not ( = ?auto_449097 ?auto_449105 ) ) ( not ( = ?auto_449097 ?auto_449106 ) ) ( not ( = ?auto_449097 ?auto_449107 ) ) ( not ( = ?auto_449097 ?auto_449108 ) ) ( not ( = ?auto_449098 ?auto_449099 ) ) ( not ( = ?auto_449098 ?auto_449100 ) ) ( not ( = ?auto_449098 ?auto_449101 ) ) ( not ( = ?auto_449098 ?auto_449102 ) ) ( not ( = ?auto_449098 ?auto_449103 ) ) ( not ( = ?auto_449098 ?auto_449104 ) ) ( not ( = ?auto_449098 ?auto_449105 ) ) ( not ( = ?auto_449098 ?auto_449106 ) ) ( not ( = ?auto_449098 ?auto_449107 ) ) ( not ( = ?auto_449098 ?auto_449108 ) ) ( not ( = ?auto_449099 ?auto_449100 ) ) ( not ( = ?auto_449099 ?auto_449101 ) ) ( not ( = ?auto_449099 ?auto_449102 ) ) ( not ( = ?auto_449099 ?auto_449103 ) ) ( not ( = ?auto_449099 ?auto_449104 ) ) ( not ( = ?auto_449099 ?auto_449105 ) ) ( not ( = ?auto_449099 ?auto_449106 ) ) ( not ( = ?auto_449099 ?auto_449107 ) ) ( not ( = ?auto_449099 ?auto_449108 ) ) ( not ( = ?auto_449100 ?auto_449101 ) ) ( not ( = ?auto_449100 ?auto_449102 ) ) ( not ( = ?auto_449100 ?auto_449103 ) ) ( not ( = ?auto_449100 ?auto_449104 ) ) ( not ( = ?auto_449100 ?auto_449105 ) ) ( not ( = ?auto_449100 ?auto_449106 ) ) ( not ( = ?auto_449100 ?auto_449107 ) ) ( not ( = ?auto_449100 ?auto_449108 ) ) ( not ( = ?auto_449101 ?auto_449102 ) ) ( not ( = ?auto_449101 ?auto_449103 ) ) ( not ( = ?auto_449101 ?auto_449104 ) ) ( not ( = ?auto_449101 ?auto_449105 ) ) ( not ( = ?auto_449101 ?auto_449106 ) ) ( not ( = ?auto_449101 ?auto_449107 ) ) ( not ( = ?auto_449101 ?auto_449108 ) ) ( not ( = ?auto_449102 ?auto_449103 ) ) ( not ( = ?auto_449102 ?auto_449104 ) ) ( not ( = ?auto_449102 ?auto_449105 ) ) ( not ( = ?auto_449102 ?auto_449106 ) ) ( not ( = ?auto_449102 ?auto_449107 ) ) ( not ( = ?auto_449102 ?auto_449108 ) ) ( not ( = ?auto_449103 ?auto_449104 ) ) ( not ( = ?auto_449103 ?auto_449105 ) ) ( not ( = ?auto_449103 ?auto_449106 ) ) ( not ( = ?auto_449103 ?auto_449107 ) ) ( not ( = ?auto_449103 ?auto_449108 ) ) ( not ( = ?auto_449104 ?auto_449105 ) ) ( not ( = ?auto_449104 ?auto_449106 ) ) ( not ( = ?auto_449104 ?auto_449107 ) ) ( not ( = ?auto_449104 ?auto_449108 ) ) ( not ( = ?auto_449105 ?auto_449106 ) ) ( not ( = ?auto_449105 ?auto_449107 ) ) ( not ( = ?auto_449105 ?auto_449108 ) ) ( not ( = ?auto_449106 ?auto_449107 ) ) ( not ( = ?auto_449106 ?auto_449108 ) ) ( not ( = ?auto_449107 ?auto_449108 ) ) ( ON ?auto_449106 ?auto_449107 ) ( ON ?auto_449105 ?auto_449106 ) ( ON ?auto_449104 ?auto_449105 ) ( ON ?auto_449103 ?auto_449104 ) ( ON ?auto_449102 ?auto_449103 ) ( ON ?auto_449101 ?auto_449102 ) ( ON ?auto_449100 ?auto_449101 ) ( ON ?auto_449099 ?auto_449100 ) ( ON ?auto_449098 ?auto_449099 ) ( ON ?auto_449097 ?auto_449098 ) ( ON ?auto_449096 ?auto_449097 ) ( CLEAR ?auto_449094 ) ( ON ?auto_449095 ?auto_449096 ) ( CLEAR ?auto_449095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_449093 ?auto_449094 ?auto_449095 )
      ( MAKE-15PILE ?auto_449093 ?auto_449094 ?auto_449095 ?auto_449096 ?auto_449097 ?auto_449098 ?auto_449099 ?auto_449100 ?auto_449101 ?auto_449102 ?auto_449103 ?auto_449104 ?auto_449105 ?auto_449106 ?auto_449107 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_449124 - BLOCK
      ?auto_449125 - BLOCK
      ?auto_449126 - BLOCK
      ?auto_449127 - BLOCK
      ?auto_449128 - BLOCK
      ?auto_449129 - BLOCK
      ?auto_449130 - BLOCK
      ?auto_449131 - BLOCK
      ?auto_449132 - BLOCK
      ?auto_449133 - BLOCK
      ?auto_449134 - BLOCK
      ?auto_449135 - BLOCK
      ?auto_449136 - BLOCK
      ?auto_449137 - BLOCK
      ?auto_449138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_449138 ) ( ON-TABLE ?auto_449124 ) ( ON ?auto_449125 ?auto_449124 ) ( not ( = ?auto_449124 ?auto_449125 ) ) ( not ( = ?auto_449124 ?auto_449126 ) ) ( not ( = ?auto_449124 ?auto_449127 ) ) ( not ( = ?auto_449124 ?auto_449128 ) ) ( not ( = ?auto_449124 ?auto_449129 ) ) ( not ( = ?auto_449124 ?auto_449130 ) ) ( not ( = ?auto_449124 ?auto_449131 ) ) ( not ( = ?auto_449124 ?auto_449132 ) ) ( not ( = ?auto_449124 ?auto_449133 ) ) ( not ( = ?auto_449124 ?auto_449134 ) ) ( not ( = ?auto_449124 ?auto_449135 ) ) ( not ( = ?auto_449124 ?auto_449136 ) ) ( not ( = ?auto_449124 ?auto_449137 ) ) ( not ( = ?auto_449124 ?auto_449138 ) ) ( not ( = ?auto_449125 ?auto_449126 ) ) ( not ( = ?auto_449125 ?auto_449127 ) ) ( not ( = ?auto_449125 ?auto_449128 ) ) ( not ( = ?auto_449125 ?auto_449129 ) ) ( not ( = ?auto_449125 ?auto_449130 ) ) ( not ( = ?auto_449125 ?auto_449131 ) ) ( not ( = ?auto_449125 ?auto_449132 ) ) ( not ( = ?auto_449125 ?auto_449133 ) ) ( not ( = ?auto_449125 ?auto_449134 ) ) ( not ( = ?auto_449125 ?auto_449135 ) ) ( not ( = ?auto_449125 ?auto_449136 ) ) ( not ( = ?auto_449125 ?auto_449137 ) ) ( not ( = ?auto_449125 ?auto_449138 ) ) ( not ( = ?auto_449126 ?auto_449127 ) ) ( not ( = ?auto_449126 ?auto_449128 ) ) ( not ( = ?auto_449126 ?auto_449129 ) ) ( not ( = ?auto_449126 ?auto_449130 ) ) ( not ( = ?auto_449126 ?auto_449131 ) ) ( not ( = ?auto_449126 ?auto_449132 ) ) ( not ( = ?auto_449126 ?auto_449133 ) ) ( not ( = ?auto_449126 ?auto_449134 ) ) ( not ( = ?auto_449126 ?auto_449135 ) ) ( not ( = ?auto_449126 ?auto_449136 ) ) ( not ( = ?auto_449126 ?auto_449137 ) ) ( not ( = ?auto_449126 ?auto_449138 ) ) ( not ( = ?auto_449127 ?auto_449128 ) ) ( not ( = ?auto_449127 ?auto_449129 ) ) ( not ( = ?auto_449127 ?auto_449130 ) ) ( not ( = ?auto_449127 ?auto_449131 ) ) ( not ( = ?auto_449127 ?auto_449132 ) ) ( not ( = ?auto_449127 ?auto_449133 ) ) ( not ( = ?auto_449127 ?auto_449134 ) ) ( not ( = ?auto_449127 ?auto_449135 ) ) ( not ( = ?auto_449127 ?auto_449136 ) ) ( not ( = ?auto_449127 ?auto_449137 ) ) ( not ( = ?auto_449127 ?auto_449138 ) ) ( not ( = ?auto_449128 ?auto_449129 ) ) ( not ( = ?auto_449128 ?auto_449130 ) ) ( not ( = ?auto_449128 ?auto_449131 ) ) ( not ( = ?auto_449128 ?auto_449132 ) ) ( not ( = ?auto_449128 ?auto_449133 ) ) ( not ( = ?auto_449128 ?auto_449134 ) ) ( not ( = ?auto_449128 ?auto_449135 ) ) ( not ( = ?auto_449128 ?auto_449136 ) ) ( not ( = ?auto_449128 ?auto_449137 ) ) ( not ( = ?auto_449128 ?auto_449138 ) ) ( not ( = ?auto_449129 ?auto_449130 ) ) ( not ( = ?auto_449129 ?auto_449131 ) ) ( not ( = ?auto_449129 ?auto_449132 ) ) ( not ( = ?auto_449129 ?auto_449133 ) ) ( not ( = ?auto_449129 ?auto_449134 ) ) ( not ( = ?auto_449129 ?auto_449135 ) ) ( not ( = ?auto_449129 ?auto_449136 ) ) ( not ( = ?auto_449129 ?auto_449137 ) ) ( not ( = ?auto_449129 ?auto_449138 ) ) ( not ( = ?auto_449130 ?auto_449131 ) ) ( not ( = ?auto_449130 ?auto_449132 ) ) ( not ( = ?auto_449130 ?auto_449133 ) ) ( not ( = ?auto_449130 ?auto_449134 ) ) ( not ( = ?auto_449130 ?auto_449135 ) ) ( not ( = ?auto_449130 ?auto_449136 ) ) ( not ( = ?auto_449130 ?auto_449137 ) ) ( not ( = ?auto_449130 ?auto_449138 ) ) ( not ( = ?auto_449131 ?auto_449132 ) ) ( not ( = ?auto_449131 ?auto_449133 ) ) ( not ( = ?auto_449131 ?auto_449134 ) ) ( not ( = ?auto_449131 ?auto_449135 ) ) ( not ( = ?auto_449131 ?auto_449136 ) ) ( not ( = ?auto_449131 ?auto_449137 ) ) ( not ( = ?auto_449131 ?auto_449138 ) ) ( not ( = ?auto_449132 ?auto_449133 ) ) ( not ( = ?auto_449132 ?auto_449134 ) ) ( not ( = ?auto_449132 ?auto_449135 ) ) ( not ( = ?auto_449132 ?auto_449136 ) ) ( not ( = ?auto_449132 ?auto_449137 ) ) ( not ( = ?auto_449132 ?auto_449138 ) ) ( not ( = ?auto_449133 ?auto_449134 ) ) ( not ( = ?auto_449133 ?auto_449135 ) ) ( not ( = ?auto_449133 ?auto_449136 ) ) ( not ( = ?auto_449133 ?auto_449137 ) ) ( not ( = ?auto_449133 ?auto_449138 ) ) ( not ( = ?auto_449134 ?auto_449135 ) ) ( not ( = ?auto_449134 ?auto_449136 ) ) ( not ( = ?auto_449134 ?auto_449137 ) ) ( not ( = ?auto_449134 ?auto_449138 ) ) ( not ( = ?auto_449135 ?auto_449136 ) ) ( not ( = ?auto_449135 ?auto_449137 ) ) ( not ( = ?auto_449135 ?auto_449138 ) ) ( not ( = ?auto_449136 ?auto_449137 ) ) ( not ( = ?auto_449136 ?auto_449138 ) ) ( not ( = ?auto_449137 ?auto_449138 ) ) ( ON ?auto_449137 ?auto_449138 ) ( ON ?auto_449136 ?auto_449137 ) ( ON ?auto_449135 ?auto_449136 ) ( ON ?auto_449134 ?auto_449135 ) ( ON ?auto_449133 ?auto_449134 ) ( ON ?auto_449132 ?auto_449133 ) ( ON ?auto_449131 ?auto_449132 ) ( ON ?auto_449130 ?auto_449131 ) ( ON ?auto_449129 ?auto_449130 ) ( ON ?auto_449128 ?auto_449129 ) ( ON ?auto_449127 ?auto_449128 ) ( CLEAR ?auto_449125 ) ( ON ?auto_449126 ?auto_449127 ) ( CLEAR ?auto_449126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_449124 ?auto_449125 ?auto_449126 )
      ( MAKE-15PILE ?auto_449124 ?auto_449125 ?auto_449126 ?auto_449127 ?auto_449128 ?auto_449129 ?auto_449130 ?auto_449131 ?auto_449132 ?auto_449133 ?auto_449134 ?auto_449135 ?auto_449136 ?auto_449137 ?auto_449138 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_449154 - BLOCK
      ?auto_449155 - BLOCK
      ?auto_449156 - BLOCK
      ?auto_449157 - BLOCK
      ?auto_449158 - BLOCK
      ?auto_449159 - BLOCK
      ?auto_449160 - BLOCK
      ?auto_449161 - BLOCK
      ?auto_449162 - BLOCK
      ?auto_449163 - BLOCK
      ?auto_449164 - BLOCK
      ?auto_449165 - BLOCK
      ?auto_449166 - BLOCK
      ?auto_449167 - BLOCK
      ?auto_449168 - BLOCK
    )
    :vars
    (
      ?auto_449169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449168 ?auto_449169 ) ( ON-TABLE ?auto_449154 ) ( not ( = ?auto_449154 ?auto_449155 ) ) ( not ( = ?auto_449154 ?auto_449156 ) ) ( not ( = ?auto_449154 ?auto_449157 ) ) ( not ( = ?auto_449154 ?auto_449158 ) ) ( not ( = ?auto_449154 ?auto_449159 ) ) ( not ( = ?auto_449154 ?auto_449160 ) ) ( not ( = ?auto_449154 ?auto_449161 ) ) ( not ( = ?auto_449154 ?auto_449162 ) ) ( not ( = ?auto_449154 ?auto_449163 ) ) ( not ( = ?auto_449154 ?auto_449164 ) ) ( not ( = ?auto_449154 ?auto_449165 ) ) ( not ( = ?auto_449154 ?auto_449166 ) ) ( not ( = ?auto_449154 ?auto_449167 ) ) ( not ( = ?auto_449154 ?auto_449168 ) ) ( not ( = ?auto_449154 ?auto_449169 ) ) ( not ( = ?auto_449155 ?auto_449156 ) ) ( not ( = ?auto_449155 ?auto_449157 ) ) ( not ( = ?auto_449155 ?auto_449158 ) ) ( not ( = ?auto_449155 ?auto_449159 ) ) ( not ( = ?auto_449155 ?auto_449160 ) ) ( not ( = ?auto_449155 ?auto_449161 ) ) ( not ( = ?auto_449155 ?auto_449162 ) ) ( not ( = ?auto_449155 ?auto_449163 ) ) ( not ( = ?auto_449155 ?auto_449164 ) ) ( not ( = ?auto_449155 ?auto_449165 ) ) ( not ( = ?auto_449155 ?auto_449166 ) ) ( not ( = ?auto_449155 ?auto_449167 ) ) ( not ( = ?auto_449155 ?auto_449168 ) ) ( not ( = ?auto_449155 ?auto_449169 ) ) ( not ( = ?auto_449156 ?auto_449157 ) ) ( not ( = ?auto_449156 ?auto_449158 ) ) ( not ( = ?auto_449156 ?auto_449159 ) ) ( not ( = ?auto_449156 ?auto_449160 ) ) ( not ( = ?auto_449156 ?auto_449161 ) ) ( not ( = ?auto_449156 ?auto_449162 ) ) ( not ( = ?auto_449156 ?auto_449163 ) ) ( not ( = ?auto_449156 ?auto_449164 ) ) ( not ( = ?auto_449156 ?auto_449165 ) ) ( not ( = ?auto_449156 ?auto_449166 ) ) ( not ( = ?auto_449156 ?auto_449167 ) ) ( not ( = ?auto_449156 ?auto_449168 ) ) ( not ( = ?auto_449156 ?auto_449169 ) ) ( not ( = ?auto_449157 ?auto_449158 ) ) ( not ( = ?auto_449157 ?auto_449159 ) ) ( not ( = ?auto_449157 ?auto_449160 ) ) ( not ( = ?auto_449157 ?auto_449161 ) ) ( not ( = ?auto_449157 ?auto_449162 ) ) ( not ( = ?auto_449157 ?auto_449163 ) ) ( not ( = ?auto_449157 ?auto_449164 ) ) ( not ( = ?auto_449157 ?auto_449165 ) ) ( not ( = ?auto_449157 ?auto_449166 ) ) ( not ( = ?auto_449157 ?auto_449167 ) ) ( not ( = ?auto_449157 ?auto_449168 ) ) ( not ( = ?auto_449157 ?auto_449169 ) ) ( not ( = ?auto_449158 ?auto_449159 ) ) ( not ( = ?auto_449158 ?auto_449160 ) ) ( not ( = ?auto_449158 ?auto_449161 ) ) ( not ( = ?auto_449158 ?auto_449162 ) ) ( not ( = ?auto_449158 ?auto_449163 ) ) ( not ( = ?auto_449158 ?auto_449164 ) ) ( not ( = ?auto_449158 ?auto_449165 ) ) ( not ( = ?auto_449158 ?auto_449166 ) ) ( not ( = ?auto_449158 ?auto_449167 ) ) ( not ( = ?auto_449158 ?auto_449168 ) ) ( not ( = ?auto_449158 ?auto_449169 ) ) ( not ( = ?auto_449159 ?auto_449160 ) ) ( not ( = ?auto_449159 ?auto_449161 ) ) ( not ( = ?auto_449159 ?auto_449162 ) ) ( not ( = ?auto_449159 ?auto_449163 ) ) ( not ( = ?auto_449159 ?auto_449164 ) ) ( not ( = ?auto_449159 ?auto_449165 ) ) ( not ( = ?auto_449159 ?auto_449166 ) ) ( not ( = ?auto_449159 ?auto_449167 ) ) ( not ( = ?auto_449159 ?auto_449168 ) ) ( not ( = ?auto_449159 ?auto_449169 ) ) ( not ( = ?auto_449160 ?auto_449161 ) ) ( not ( = ?auto_449160 ?auto_449162 ) ) ( not ( = ?auto_449160 ?auto_449163 ) ) ( not ( = ?auto_449160 ?auto_449164 ) ) ( not ( = ?auto_449160 ?auto_449165 ) ) ( not ( = ?auto_449160 ?auto_449166 ) ) ( not ( = ?auto_449160 ?auto_449167 ) ) ( not ( = ?auto_449160 ?auto_449168 ) ) ( not ( = ?auto_449160 ?auto_449169 ) ) ( not ( = ?auto_449161 ?auto_449162 ) ) ( not ( = ?auto_449161 ?auto_449163 ) ) ( not ( = ?auto_449161 ?auto_449164 ) ) ( not ( = ?auto_449161 ?auto_449165 ) ) ( not ( = ?auto_449161 ?auto_449166 ) ) ( not ( = ?auto_449161 ?auto_449167 ) ) ( not ( = ?auto_449161 ?auto_449168 ) ) ( not ( = ?auto_449161 ?auto_449169 ) ) ( not ( = ?auto_449162 ?auto_449163 ) ) ( not ( = ?auto_449162 ?auto_449164 ) ) ( not ( = ?auto_449162 ?auto_449165 ) ) ( not ( = ?auto_449162 ?auto_449166 ) ) ( not ( = ?auto_449162 ?auto_449167 ) ) ( not ( = ?auto_449162 ?auto_449168 ) ) ( not ( = ?auto_449162 ?auto_449169 ) ) ( not ( = ?auto_449163 ?auto_449164 ) ) ( not ( = ?auto_449163 ?auto_449165 ) ) ( not ( = ?auto_449163 ?auto_449166 ) ) ( not ( = ?auto_449163 ?auto_449167 ) ) ( not ( = ?auto_449163 ?auto_449168 ) ) ( not ( = ?auto_449163 ?auto_449169 ) ) ( not ( = ?auto_449164 ?auto_449165 ) ) ( not ( = ?auto_449164 ?auto_449166 ) ) ( not ( = ?auto_449164 ?auto_449167 ) ) ( not ( = ?auto_449164 ?auto_449168 ) ) ( not ( = ?auto_449164 ?auto_449169 ) ) ( not ( = ?auto_449165 ?auto_449166 ) ) ( not ( = ?auto_449165 ?auto_449167 ) ) ( not ( = ?auto_449165 ?auto_449168 ) ) ( not ( = ?auto_449165 ?auto_449169 ) ) ( not ( = ?auto_449166 ?auto_449167 ) ) ( not ( = ?auto_449166 ?auto_449168 ) ) ( not ( = ?auto_449166 ?auto_449169 ) ) ( not ( = ?auto_449167 ?auto_449168 ) ) ( not ( = ?auto_449167 ?auto_449169 ) ) ( not ( = ?auto_449168 ?auto_449169 ) ) ( ON ?auto_449167 ?auto_449168 ) ( ON ?auto_449166 ?auto_449167 ) ( ON ?auto_449165 ?auto_449166 ) ( ON ?auto_449164 ?auto_449165 ) ( ON ?auto_449163 ?auto_449164 ) ( ON ?auto_449162 ?auto_449163 ) ( ON ?auto_449161 ?auto_449162 ) ( ON ?auto_449160 ?auto_449161 ) ( ON ?auto_449159 ?auto_449160 ) ( ON ?auto_449158 ?auto_449159 ) ( ON ?auto_449157 ?auto_449158 ) ( ON ?auto_449156 ?auto_449157 ) ( CLEAR ?auto_449154 ) ( ON ?auto_449155 ?auto_449156 ) ( CLEAR ?auto_449155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_449154 ?auto_449155 )
      ( MAKE-15PILE ?auto_449154 ?auto_449155 ?auto_449156 ?auto_449157 ?auto_449158 ?auto_449159 ?auto_449160 ?auto_449161 ?auto_449162 ?auto_449163 ?auto_449164 ?auto_449165 ?auto_449166 ?auto_449167 ?auto_449168 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_449185 - BLOCK
      ?auto_449186 - BLOCK
      ?auto_449187 - BLOCK
      ?auto_449188 - BLOCK
      ?auto_449189 - BLOCK
      ?auto_449190 - BLOCK
      ?auto_449191 - BLOCK
      ?auto_449192 - BLOCK
      ?auto_449193 - BLOCK
      ?auto_449194 - BLOCK
      ?auto_449195 - BLOCK
      ?auto_449196 - BLOCK
      ?auto_449197 - BLOCK
      ?auto_449198 - BLOCK
      ?auto_449199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_449199 ) ( ON-TABLE ?auto_449185 ) ( not ( = ?auto_449185 ?auto_449186 ) ) ( not ( = ?auto_449185 ?auto_449187 ) ) ( not ( = ?auto_449185 ?auto_449188 ) ) ( not ( = ?auto_449185 ?auto_449189 ) ) ( not ( = ?auto_449185 ?auto_449190 ) ) ( not ( = ?auto_449185 ?auto_449191 ) ) ( not ( = ?auto_449185 ?auto_449192 ) ) ( not ( = ?auto_449185 ?auto_449193 ) ) ( not ( = ?auto_449185 ?auto_449194 ) ) ( not ( = ?auto_449185 ?auto_449195 ) ) ( not ( = ?auto_449185 ?auto_449196 ) ) ( not ( = ?auto_449185 ?auto_449197 ) ) ( not ( = ?auto_449185 ?auto_449198 ) ) ( not ( = ?auto_449185 ?auto_449199 ) ) ( not ( = ?auto_449186 ?auto_449187 ) ) ( not ( = ?auto_449186 ?auto_449188 ) ) ( not ( = ?auto_449186 ?auto_449189 ) ) ( not ( = ?auto_449186 ?auto_449190 ) ) ( not ( = ?auto_449186 ?auto_449191 ) ) ( not ( = ?auto_449186 ?auto_449192 ) ) ( not ( = ?auto_449186 ?auto_449193 ) ) ( not ( = ?auto_449186 ?auto_449194 ) ) ( not ( = ?auto_449186 ?auto_449195 ) ) ( not ( = ?auto_449186 ?auto_449196 ) ) ( not ( = ?auto_449186 ?auto_449197 ) ) ( not ( = ?auto_449186 ?auto_449198 ) ) ( not ( = ?auto_449186 ?auto_449199 ) ) ( not ( = ?auto_449187 ?auto_449188 ) ) ( not ( = ?auto_449187 ?auto_449189 ) ) ( not ( = ?auto_449187 ?auto_449190 ) ) ( not ( = ?auto_449187 ?auto_449191 ) ) ( not ( = ?auto_449187 ?auto_449192 ) ) ( not ( = ?auto_449187 ?auto_449193 ) ) ( not ( = ?auto_449187 ?auto_449194 ) ) ( not ( = ?auto_449187 ?auto_449195 ) ) ( not ( = ?auto_449187 ?auto_449196 ) ) ( not ( = ?auto_449187 ?auto_449197 ) ) ( not ( = ?auto_449187 ?auto_449198 ) ) ( not ( = ?auto_449187 ?auto_449199 ) ) ( not ( = ?auto_449188 ?auto_449189 ) ) ( not ( = ?auto_449188 ?auto_449190 ) ) ( not ( = ?auto_449188 ?auto_449191 ) ) ( not ( = ?auto_449188 ?auto_449192 ) ) ( not ( = ?auto_449188 ?auto_449193 ) ) ( not ( = ?auto_449188 ?auto_449194 ) ) ( not ( = ?auto_449188 ?auto_449195 ) ) ( not ( = ?auto_449188 ?auto_449196 ) ) ( not ( = ?auto_449188 ?auto_449197 ) ) ( not ( = ?auto_449188 ?auto_449198 ) ) ( not ( = ?auto_449188 ?auto_449199 ) ) ( not ( = ?auto_449189 ?auto_449190 ) ) ( not ( = ?auto_449189 ?auto_449191 ) ) ( not ( = ?auto_449189 ?auto_449192 ) ) ( not ( = ?auto_449189 ?auto_449193 ) ) ( not ( = ?auto_449189 ?auto_449194 ) ) ( not ( = ?auto_449189 ?auto_449195 ) ) ( not ( = ?auto_449189 ?auto_449196 ) ) ( not ( = ?auto_449189 ?auto_449197 ) ) ( not ( = ?auto_449189 ?auto_449198 ) ) ( not ( = ?auto_449189 ?auto_449199 ) ) ( not ( = ?auto_449190 ?auto_449191 ) ) ( not ( = ?auto_449190 ?auto_449192 ) ) ( not ( = ?auto_449190 ?auto_449193 ) ) ( not ( = ?auto_449190 ?auto_449194 ) ) ( not ( = ?auto_449190 ?auto_449195 ) ) ( not ( = ?auto_449190 ?auto_449196 ) ) ( not ( = ?auto_449190 ?auto_449197 ) ) ( not ( = ?auto_449190 ?auto_449198 ) ) ( not ( = ?auto_449190 ?auto_449199 ) ) ( not ( = ?auto_449191 ?auto_449192 ) ) ( not ( = ?auto_449191 ?auto_449193 ) ) ( not ( = ?auto_449191 ?auto_449194 ) ) ( not ( = ?auto_449191 ?auto_449195 ) ) ( not ( = ?auto_449191 ?auto_449196 ) ) ( not ( = ?auto_449191 ?auto_449197 ) ) ( not ( = ?auto_449191 ?auto_449198 ) ) ( not ( = ?auto_449191 ?auto_449199 ) ) ( not ( = ?auto_449192 ?auto_449193 ) ) ( not ( = ?auto_449192 ?auto_449194 ) ) ( not ( = ?auto_449192 ?auto_449195 ) ) ( not ( = ?auto_449192 ?auto_449196 ) ) ( not ( = ?auto_449192 ?auto_449197 ) ) ( not ( = ?auto_449192 ?auto_449198 ) ) ( not ( = ?auto_449192 ?auto_449199 ) ) ( not ( = ?auto_449193 ?auto_449194 ) ) ( not ( = ?auto_449193 ?auto_449195 ) ) ( not ( = ?auto_449193 ?auto_449196 ) ) ( not ( = ?auto_449193 ?auto_449197 ) ) ( not ( = ?auto_449193 ?auto_449198 ) ) ( not ( = ?auto_449193 ?auto_449199 ) ) ( not ( = ?auto_449194 ?auto_449195 ) ) ( not ( = ?auto_449194 ?auto_449196 ) ) ( not ( = ?auto_449194 ?auto_449197 ) ) ( not ( = ?auto_449194 ?auto_449198 ) ) ( not ( = ?auto_449194 ?auto_449199 ) ) ( not ( = ?auto_449195 ?auto_449196 ) ) ( not ( = ?auto_449195 ?auto_449197 ) ) ( not ( = ?auto_449195 ?auto_449198 ) ) ( not ( = ?auto_449195 ?auto_449199 ) ) ( not ( = ?auto_449196 ?auto_449197 ) ) ( not ( = ?auto_449196 ?auto_449198 ) ) ( not ( = ?auto_449196 ?auto_449199 ) ) ( not ( = ?auto_449197 ?auto_449198 ) ) ( not ( = ?auto_449197 ?auto_449199 ) ) ( not ( = ?auto_449198 ?auto_449199 ) ) ( ON ?auto_449198 ?auto_449199 ) ( ON ?auto_449197 ?auto_449198 ) ( ON ?auto_449196 ?auto_449197 ) ( ON ?auto_449195 ?auto_449196 ) ( ON ?auto_449194 ?auto_449195 ) ( ON ?auto_449193 ?auto_449194 ) ( ON ?auto_449192 ?auto_449193 ) ( ON ?auto_449191 ?auto_449192 ) ( ON ?auto_449190 ?auto_449191 ) ( ON ?auto_449189 ?auto_449190 ) ( ON ?auto_449188 ?auto_449189 ) ( ON ?auto_449187 ?auto_449188 ) ( CLEAR ?auto_449185 ) ( ON ?auto_449186 ?auto_449187 ) ( CLEAR ?auto_449186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_449185 ?auto_449186 )
      ( MAKE-15PILE ?auto_449185 ?auto_449186 ?auto_449187 ?auto_449188 ?auto_449189 ?auto_449190 ?auto_449191 ?auto_449192 ?auto_449193 ?auto_449194 ?auto_449195 ?auto_449196 ?auto_449197 ?auto_449198 ?auto_449199 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_449215 - BLOCK
      ?auto_449216 - BLOCK
      ?auto_449217 - BLOCK
      ?auto_449218 - BLOCK
      ?auto_449219 - BLOCK
      ?auto_449220 - BLOCK
      ?auto_449221 - BLOCK
      ?auto_449222 - BLOCK
      ?auto_449223 - BLOCK
      ?auto_449224 - BLOCK
      ?auto_449225 - BLOCK
      ?auto_449226 - BLOCK
      ?auto_449227 - BLOCK
      ?auto_449228 - BLOCK
      ?auto_449229 - BLOCK
    )
    :vars
    (
      ?auto_449230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449229 ?auto_449230 ) ( not ( = ?auto_449215 ?auto_449216 ) ) ( not ( = ?auto_449215 ?auto_449217 ) ) ( not ( = ?auto_449215 ?auto_449218 ) ) ( not ( = ?auto_449215 ?auto_449219 ) ) ( not ( = ?auto_449215 ?auto_449220 ) ) ( not ( = ?auto_449215 ?auto_449221 ) ) ( not ( = ?auto_449215 ?auto_449222 ) ) ( not ( = ?auto_449215 ?auto_449223 ) ) ( not ( = ?auto_449215 ?auto_449224 ) ) ( not ( = ?auto_449215 ?auto_449225 ) ) ( not ( = ?auto_449215 ?auto_449226 ) ) ( not ( = ?auto_449215 ?auto_449227 ) ) ( not ( = ?auto_449215 ?auto_449228 ) ) ( not ( = ?auto_449215 ?auto_449229 ) ) ( not ( = ?auto_449215 ?auto_449230 ) ) ( not ( = ?auto_449216 ?auto_449217 ) ) ( not ( = ?auto_449216 ?auto_449218 ) ) ( not ( = ?auto_449216 ?auto_449219 ) ) ( not ( = ?auto_449216 ?auto_449220 ) ) ( not ( = ?auto_449216 ?auto_449221 ) ) ( not ( = ?auto_449216 ?auto_449222 ) ) ( not ( = ?auto_449216 ?auto_449223 ) ) ( not ( = ?auto_449216 ?auto_449224 ) ) ( not ( = ?auto_449216 ?auto_449225 ) ) ( not ( = ?auto_449216 ?auto_449226 ) ) ( not ( = ?auto_449216 ?auto_449227 ) ) ( not ( = ?auto_449216 ?auto_449228 ) ) ( not ( = ?auto_449216 ?auto_449229 ) ) ( not ( = ?auto_449216 ?auto_449230 ) ) ( not ( = ?auto_449217 ?auto_449218 ) ) ( not ( = ?auto_449217 ?auto_449219 ) ) ( not ( = ?auto_449217 ?auto_449220 ) ) ( not ( = ?auto_449217 ?auto_449221 ) ) ( not ( = ?auto_449217 ?auto_449222 ) ) ( not ( = ?auto_449217 ?auto_449223 ) ) ( not ( = ?auto_449217 ?auto_449224 ) ) ( not ( = ?auto_449217 ?auto_449225 ) ) ( not ( = ?auto_449217 ?auto_449226 ) ) ( not ( = ?auto_449217 ?auto_449227 ) ) ( not ( = ?auto_449217 ?auto_449228 ) ) ( not ( = ?auto_449217 ?auto_449229 ) ) ( not ( = ?auto_449217 ?auto_449230 ) ) ( not ( = ?auto_449218 ?auto_449219 ) ) ( not ( = ?auto_449218 ?auto_449220 ) ) ( not ( = ?auto_449218 ?auto_449221 ) ) ( not ( = ?auto_449218 ?auto_449222 ) ) ( not ( = ?auto_449218 ?auto_449223 ) ) ( not ( = ?auto_449218 ?auto_449224 ) ) ( not ( = ?auto_449218 ?auto_449225 ) ) ( not ( = ?auto_449218 ?auto_449226 ) ) ( not ( = ?auto_449218 ?auto_449227 ) ) ( not ( = ?auto_449218 ?auto_449228 ) ) ( not ( = ?auto_449218 ?auto_449229 ) ) ( not ( = ?auto_449218 ?auto_449230 ) ) ( not ( = ?auto_449219 ?auto_449220 ) ) ( not ( = ?auto_449219 ?auto_449221 ) ) ( not ( = ?auto_449219 ?auto_449222 ) ) ( not ( = ?auto_449219 ?auto_449223 ) ) ( not ( = ?auto_449219 ?auto_449224 ) ) ( not ( = ?auto_449219 ?auto_449225 ) ) ( not ( = ?auto_449219 ?auto_449226 ) ) ( not ( = ?auto_449219 ?auto_449227 ) ) ( not ( = ?auto_449219 ?auto_449228 ) ) ( not ( = ?auto_449219 ?auto_449229 ) ) ( not ( = ?auto_449219 ?auto_449230 ) ) ( not ( = ?auto_449220 ?auto_449221 ) ) ( not ( = ?auto_449220 ?auto_449222 ) ) ( not ( = ?auto_449220 ?auto_449223 ) ) ( not ( = ?auto_449220 ?auto_449224 ) ) ( not ( = ?auto_449220 ?auto_449225 ) ) ( not ( = ?auto_449220 ?auto_449226 ) ) ( not ( = ?auto_449220 ?auto_449227 ) ) ( not ( = ?auto_449220 ?auto_449228 ) ) ( not ( = ?auto_449220 ?auto_449229 ) ) ( not ( = ?auto_449220 ?auto_449230 ) ) ( not ( = ?auto_449221 ?auto_449222 ) ) ( not ( = ?auto_449221 ?auto_449223 ) ) ( not ( = ?auto_449221 ?auto_449224 ) ) ( not ( = ?auto_449221 ?auto_449225 ) ) ( not ( = ?auto_449221 ?auto_449226 ) ) ( not ( = ?auto_449221 ?auto_449227 ) ) ( not ( = ?auto_449221 ?auto_449228 ) ) ( not ( = ?auto_449221 ?auto_449229 ) ) ( not ( = ?auto_449221 ?auto_449230 ) ) ( not ( = ?auto_449222 ?auto_449223 ) ) ( not ( = ?auto_449222 ?auto_449224 ) ) ( not ( = ?auto_449222 ?auto_449225 ) ) ( not ( = ?auto_449222 ?auto_449226 ) ) ( not ( = ?auto_449222 ?auto_449227 ) ) ( not ( = ?auto_449222 ?auto_449228 ) ) ( not ( = ?auto_449222 ?auto_449229 ) ) ( not ( = ?auto_449222 ?auto_449230 ) ) ( not ( = ?auto_449223 ?auto_449224 ) ) ( not ( = ?auto_449223 ?auto_449225 ) ) ( not ( = ?auto_449223 ?auto_449226 ) ) ( not ( = ?auto_449223 ?auto_449227 ) ) ( not ( = ?auto_449223 ?auto_449228 ) ) ( not ( = ?auto_449223 ?auto_449229 ) ) ( not ( = ?auto_449223 ?auto_449230 ) ) ( not ( = ?auto_449224 ?auto_449225 ) ) ( not ( = ?auto_449224 ?auto_449226 ) ) ( not ( = ?auto_449224 ?auto_449227 ) ) ( not ( = ?auto_449224 ?auto_449228 ) ) ( not ( = ?auto_449224 ?auto_449229 ) ) ( not ( = ?auto_449224 ?auto_449230 ) ) ( not ( = ?auto_449225 ?auto_449226 ) ) ( not ( = ?auto_449225 ?auto_449227 ) ) ( not ( = ?auto_449225 ?auto_449228 ) ) ( not ( = ?auto_449225 ?auto_449229 ) ) ( not ( = ?auto_449225 ?auto_449230 ) ) ( not ( = ?auto_449226 ?auto_449227 ) ) ( not ( = ?auto_449226 ?auto_449228 ) ) ( not ( = ?auto_449226 ?auto_449229 ) ) ( not ( = ?auto_449226 ?auto_449230 ) ) ( not ( = ?auto_449227 ?auto_449228 ) ) ( not ( = ?auto_449227 ?auto_449229 ) ) ( not ( = ?auto_449227 ?auto_449230 ) ) ( not ( = ?auto_449228 ?auto_449229 ) ) ( not ( = ?auto_449228 ?auto_449230 ) ) ( not ( = ?auto_449229 ?auto_449230 ) ) ( ON ?auto_449228 ?auto_449229 ) ( ON ?auto_449227 ?auto_449228 ) ( ON ?auto_449226 ?auto_449227 ) ( ON ?auto_449225 ?auto_449226 ) ( ON ?auto_449224 ?auto_449225 ) ( ON ?auto_449223 ?auto_449224 ) ( ON ?auto_449222 ?auto_449223 ) ( ON ?auto_449221 ?auto_449222 ) ( ON ?auto_449220 ?auto_449221 ) ( ON ?auto_449219 ?auto_449220 ) ( ON ?auto_449218 ?auto_449219 ) ( ON ?auto_449217 ?auto_449218 ) ( ON ?auto_449216 ?auto_449217 ) ( ON ?auto_449215 ?auto_449216 ) ( CLEAR ?auto_449215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449215 )
      ( MAKE-15PILE ?auto_449215 ?auto_449216 ?auto_449217 ?auto_449218 ?auto_449219 ?auto_449220 ?auto_449221 ?auto_449222 ?auto_449223 ?auto_449224 ?auto_449225 ?auto_449226 ?auto_449227 ?auto_449228 ?auto_449229 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_449246 - BLOCK
      ?auto_449247 - BLOCK
      ?auto_449248 - BLOCK
      ?auto_449249 - BLOCK
      ?auto_449250 - BLOCK
      ?auto_449251 - BLOCK
      ?auto_449252 - BLOCK
      ?auto_449253 - BLOCK
      ?auto_449254 - BLOCK
      ?auto_449255 - BLOCK
      ?auto_449256 - BLOCK
      ?auto_449257 - BLOCK
      ?auto_449258 - BLOCK
      ?auto_449259 - BLOCK
      ?auto_449260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_449260 ) ( not ( = ?auto_449246 ?auto_449247 ) ) ( not ( = ?auto_449246 ?auto_449248 ) ) ( not ( = ?auto_449246 ?auto_449249 ) ) ( not ( = ?auto_449246 ?auto_449250 ) ) ( not ( = ?auto_449246 ?auto_449251 ) ) ( not ( = ?auto_449246 ?auto_449252 ) ) ( not ( = ?auto_449246 ?auto_449253 ) ) ( not ( = ?auto_449246 ?auto_449254 ) ) ( not ( = ?auto_449246 ?auto_449255 ) ) ( not ( = ?auto_449246 ?auto_449256 ) ) ( not ( = ?auto_449246 ?auto_449257 ) ) ( not ( = ?auto_449246 ?auto_449258 ) ) ( not ( = ?auto_449246 ?auto_449259 ) ) ( not ( = ?auto_449246 ?auto_449260 ) ) ( not ( = ?auto_449247 ?auto_449248 ) ) ( not ( = ?auto_449247 ?auto_449249 ) ) ( not ( = ?auto_449247 ?auto_449250 ) ) ( not ( = ?auto_449247 ?auto_449251 ) ) ( not ( = ?auto_449247 ?auto_449252 ) ) ( not ( = ?auto_449247 ?auto_449253 ) ) ( not ( = ?auto_449247 ?auto_449254 ) ) ( not ( = ?auto_449247 ?auto_449255 ) ) ( not ( = ?auto_449247 ?auto_449256 ) ) ( not ( = ?auto_449247 ?auto_449257 ) ) ( not ( = ?auto_449247 ?auto_449258 ) ) ( not ( = ?auto_449247 ?auto_449259 ) ) ( not ( = ?auto_449247 ?auto_449260 ) ) ( not ( = ?auto_449248 ?auto_449249 ) ) ( not ( = ?auto_449248 ?auto_449250 ) ) ( not ( = ?auto_449248 ?auto_449251 ) ) ( not ( = ?auto_449248 ?auto_449252 ) ) ( not ( = ?auto_449248 ?auto_449253 ) ) ( not ( = ?auto_449248 ?auto_449254 ) ) ( not ( = ?auto_449248 ?auto_449255 ) ) ( not ( = ?auto_449248 ?auto_449256 ) ) ( not ( = ?auto_449248 ?auto_449257 ) ) ( not ( = ?auto_449248 ?auto_449258 ) ) ( not ( = ?auto_449248 ?auto_449259 ) ) ( not ( = ?auto_449248 ?auto_449260 ) ) ( not ( = ?auto_449249 ?auto_449250 ) ) ( not ( = ?auto_449249 ?auto_449251 ) ) ( not ( = ?auto_449249 ?auto_449252 ) ) ( not ( = ?auto_449249 ?auto_449253 ) ) ( not ( = ?auto_449249 ?auto_449254 ) ) ( not ( = ?auto_449249 ?auto_449255 ) ) ( not ( = ?auto_449249 ?auto_449256 ) ) ( not ( = ?auto_449249 ?auto_449257 ) ) ( not ( = ?auto_449249 ?auto_449258 ) ) ( not ( = ?auto_449249 ?auto_449259 ) ) ( not ( = ?auto_449249 ?auto_449260 ) ) ( not ( = ?auto_449250 ?auto_449251 ) ) ( not ( = ?auto_449250 ?auto_449252 ) ) ( not ( = ?auto_449250 ?auto_449253 ) ) ( not ( = ?auto_449250 ?auto_449254 ) ) ( not ( = ?auto_449250 ?auto_449255 ) ) ( not ( = ?auto_449250 ?auto_449256 ) ) ( not ( = ?auto_449250 ?auto_449257 ) ) ( not ( = ?auto_449250 ?auto_449258 ) ) ( not ( = ?auto_449250 ?auto_449259 ) ) ( not ( = ?auto_449250 ?auto_449260 ) ) ( not ( = ?auto_449251 ?auto_449252 ) ) ( not ( = ?auto_449251 ?auto_449253 ) ) ( not ( = ?auto_449251 ?auto_449254 ) ) ( not ( = ?auto_449251 ?auto_449255 ) ) ( not ( = ?auto_449251 ?auto_449256 ) ) ( not ( = ?auto_449251 ?auto_449257 ) ) ( not ( = ?auto_449251 ?auto_449258 ) ) ( not ( = ?auto_449251 ?auto_449259 ) ) ( not ( = ?auto_449251 ?auto_449260 ) ) ( not ( = ?auto_449252 ?auto_449253 ) ) ( not ( = ?auto_449252 ?auto_449254 ) ) ( not ( = ?auto_449252 ?auto_449255 ) ) ( not ( = ?auto_449252 ?auto_449256 ) ) ( not ( = ?auto_449252 ?auto_449257 ) ) ( not ( = ?auto_449252 ?auto_449258 ) ) ( not ( = ?auto_449252 ?auto_449259 ) ) ( not ( = ?auto_449252 ?auto_449260 ) ) ( not ( = ?auto_449253 ?auto_449254 ) ) ( not ( = ?auto_449253 ?auto_449255 ) ) ( not ( = ?auto_449253 ?auto_449256 ) ) ( not ( = ?auto_449253 ?auto_449257 ) ) ( not ( = ?auto_449253 ?auto_449258 ) ) ( not ( = ?auto_449253 ?auto_449259 ) ) ( not ( = ?auto_449253 ?auto_449260 ) ) ( not ( = ?auto_449254 ?auto_449255 ) ) ( not ( = ?auto_449254 ?auto_449256 ) ) ( not ( = ?auto_449254 ?auto_449257 ) ) ( not ( = ?auto_449254 ?auto_449258 ) ) ( not ( = ?auto_449254 ?auto_449259 ) ) ( not ( = ?auto_449254 ?auto_449260 ) ) ( not ( = ?auto_449255 ?auto_449256 ) ) ( not ( = ?auto_449255 ?auto_449257 ) ) ( not ( = ?auto_449255 ?auto_449258 ) ) ( not ( = ?auto_449255 ?auto_449259 ) ) ( not ( = ?auto_449255 ?auto_449260 ) ) ( not ( = ?auto_449256 ?auto_449257 ) ) ( not ( = ?auto_449256 ?auto_449258 ) ) ( not ( = ?auto_449256 ?auto_449259 ) ) ( not ( = ?auto_449256 ?auto_449260 ) ) ( not ( = ?auto_449257 ?auto_449258 ) ) ( not ( = ?auto_449257 ?auto_449259 ) ) ( not ( = ?auto_449257 ?auto_449260 ) ) ( not ( = ?auto_449258 ?auto_449259 ) ) ( not ( = ?auto_449258 ?auto_449260 ) ) ( not ( = ?auto_449259 ?auto_449260 ) ) ( ON ?auto_449259 ?auto_449260 ) ( ON ?auto_449258 ?auto_449259 ) ( ON ?auto_449257 ?auto_449258 ) ( ON ?auto_449256 ?auto_449257 ) ( ON ?auto_449255 ?auto_449256 ) ( ON ?auto_449254 ?auto_449255 ) ( ON ?auto_449253 ?auto_449254 ) ( ON ?auto_449252 ?auto_449253 ) ( ON ?auto_449251 ?auto_449252 ) ( ON ?auto_449250 ?auto_449251 ) ( ON ?auto_449249 ?auto_449250 ) ( ON ?auto_449248 ?auto_449249 ) ( ON ?auto_449247 ?auto_449248 ) ( ON ?auto_449246 ?auto_449247 ) ( CLEAR ?auto_449246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449246 )
      ( MAKE-15PILE ?auto_449246 ?auto_449247 ?auto_449248 ?auto_449249 ?auto_449250 ?auto_449251 ?auto_449252 ?auto_449253 ?auto_449254 ?auto_449255 ?auto_449256 ?auto_449257 ?auto_449258 ?auto_449259 ?auto_449260 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_449276 - BLOCK
      ?auto_449277 - BLOCK
      ?auto_449278 - BLOCK
      ?auto_449279 - BLOCK
      ?auto_449280 - BLOCK
      ?auto_449281 - BLOCK
      ?auto_449282 - BLOCK
      ?auto_449283 - BLOCK
      ?auto_449284 - BLOCK
      ?auto_449285 - BLOCK
      ?auto_449286 - BLOCK
      ?auto_449287 - BLOCK
      ?auto_449288 - BLOCK
      ?auto_449289 - BLOCK
      ?auto_449290 - BLOCK
    )
    :vars
    (
      ?auto_449291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_449276 ?auto_449277 ) ) ( not ( = ?auto_449276 ?auto_449278 ) ) ( not ( = ?auto_449276 ?auto_449279 ) ) ( not ( = ?auto_449276 ?auto_449280 ) ) ( not ( = ?auto_449276 ?auto_449281 ) ) ( not ( = ?auto_449276 ?auto_449282 ) ) ( not ( = ?auto_449276 ?auto_449283 ) ) ( not ( = ?auto_449276 ?auto_449284 ) ) ( not ( = ?auto_449276 ?auto_449285 ) ) ( not ( = ?auto_449276 ?auto_449286 ) ) ( not ( = ?auto_449276 ?auto_449287 ) ) ( not ( = ?auto_449276 ?auto_449288 ) ) ( not ( = ?auto_449276 ?auto_449289 ) ) ( not ( = ?auto_449276 ?auto_449290 ) ) ( not ( = ?auto_449277 ?auto_449278 ) ) ( not ( = ?auto_449277 ?auto_449279 ) ) ( not ( = ?auto_449277 ?auto_449280 ) ) ( not ( = ?auto_449277 ?auto_449281 ) ) ( not ( = ?auto_449277 ?auto_449282 ) ) ( not ( = ?auto_449277 ?auto_449283 ) ) ( not ( = ?auto_449277 ?auto_449284 ) ) ( not ( = ?auto_449277 ?auto_449285 ) ) ( not ( = ?auto_449277 ?auto_449286 ) ) ( not ( = ?auto_449277 ?auto_449287 ) ) ( not ( = ?auto_449277 ?auto_449288 ) ) ( not ( = ?auto_449277 ?auto_449289 ) ) ( not ( = ?auto_449277 ?auto_449290 ) ) ( not ( = ?auto_449278 ?auto_449279 ) ) ( not ( = ?auto_449278 ?auto_449280 ) ) ( not ( = ?auto_449278 ?auto_449281 ) ) ( not ( = ?auto_449278 ?auto_449282 ) ) ( not ( = ?auto_449278 ?auto_449283 ) ) ( not ( = ?auto_449278 ?auto_449284 ) ) ( not ( = ?auto_449278 ?auto_449285 ) ) ( not ( = ?auto_449278 ?auto_449286 ) ) ( not ( = ?auto_449278 ?auto_449287 ) ) ( not ( = ?auto_449278 ?auto_449288 ) ) ( not ( = ?auto_449278 ?auto_449289 ) ) ( not ( = ?auto_449278 ?auto_449290 ) ) ( not ( = ?auto_449279 ?auto_449280 ) ) ( not ( = ?auto_449279 ?auto_449281 ) ) ( not ( = ?auto_449279 ?auto_449282 ) ) ( not ( = ?auto_449279 ?auto_449283 ) ) ( not ( = ?auto_449279 ?auto_449284 ) ) ( not ( = ?auto_449279 ?auto_449285 ) ) ( not ( = ?auto_449279 ?auto_449286 ) ) ( not ( = ?auto_449279 ?auto_449287 ) ) ( not ( = ?auto_449279 ?auto_449288 ) ) ( not ( = ?auto_449279 ?auto_449289 ) ) ( not ( = ?auto_449279 ?auto_449290 ) ) ( not ( = ?auto_449280 ?auto_449281 ) ) ( not ( = ?auto_449280 ?auto_449282 ) ) ( not ( = ?auto_449280 ?auto_449283 ) ) ( not ( = ?auto_449280 ?auto_449284 ) ) ( not ( = ?auto_449280 ?auto_449285 ) ) ( not ( = ?auto_449280 ?auto_449286 ) ) ( not ( = ?auto_449280 ?auto_449287 ) ) ( not ( = ?auto_449280 ?auto_449288 ) ) ( not ( = ?auto_449280 ?auto_449289 ) ) ( not ( = ?auto_449280 ?auto_449290 ) ) ( not ( = ?auto_449281 ?auto_449282 ) ) ( not ( = ?auto_449281 ?auto_449283 ) ) ( not ( = ?auto_449281 ?auto_449284 ) ) ( not ( = ?auto_449281 ?auto_449285 ) ) ( not ( = ?auto_449281 ?auto_449286 ) ) ( not ( = ?auto_449281 ?auto_449287 ) ) ( not ( = ?auto_449281 ?auto_449288 ) ) ( not ( = ?auto_449281 ?auto_449289 ) ) ( not ( = ?auto_449281 ?auto_449290 ) ) ( not ( = ?auto_449282 ?auto_449283 ) ) ( not ( = ?auto_449282 ?auto_449284 ) ) ( not ( = ?auto_449282 ?auto_449285 ) ) ( not ( = ?auto_449282 ?auto_449286 ) ) ( not ( = ?auto_449282 ?auto_449287 ) ) ( not ( = ?auto_449282 ?auto_449288 ) ) ( not ( = ?auto_449282 ?auto_449289 ) ) ( not ( = ?auto_449282 ?auto_449290 ) ) ( not ( = ?auto_449283 ?auto_449284 ) ) ( not ( = ?auto_449283 ?auto_449285 ) ) ( not ( = ?auto_449283 ?auto_449286 ) ) ( not ( = ?auto_449283 ?auto_449287 ) ) ( not ( = ?auto_449283 ?auto_449288 ) ) ( not ( = ?auto_449283 ?auto_449289 ) ) ( not ( = ?auto_449283 ?auto_449290 ) ) ( not ( = ?auto_449284 ?auto_449285 ) ) ( not ( = ?auto_449284 ?auto_449286 ) ) ( not ( = ?auto_449284 ?auto_449287 ) ) ( not ( = ?auto_449284 ?auto_449288 ) ) ( not ( = ?auto_449284 ?auto_449289 ) ) ( not ( = ?auto_449284 ?auto_449290 ) ) ( not ( = ?auto_449285 ?auto_449286 ) ) ( not ( = ?auto_449285 ?auto_449287 ) ) ( not ( = ?auto_449285 ?auto_449288 ) ) ( not ( = ?auto_449285 ?auto_449289 ) ) ( not ( = ?auto_449285 ?auto_449290 ) ) ( not ( = ?auto_449286 ?auto_449287 ) ) ( not ( = ?auto_449286 ?auto_449288 ) ) ( not ( = ?auto_449286 ?auto_449289 ) ) ( not ( = ?auto_449286 ?auto_449290 ) ) ( not ( = ?auto_449287 ?auto_449288 ) ) ( not ( = ?auto_449287 ?auto_449289 ) ) ( not ( = ?auto_449287 ?auto_449290 ) ) ( not ( = ?auto_449288 ?auto_449289 ) ) ( not ( = ?auto_449288 ?auto_449290 ) ) ( not ( = ?auto_449289 ?auto_449290 ) ) ( ON ?auto_449276 ?auto_449291 ) ( not ( = ?auto_449290 ?auto_449291 ) ) ( not ( = ?auto_449289 ?auto_449291 ) ) ( not ( = ?auto_449288 ?auto_449291 ) ) ( not ( = ?auto_449287 ?auto_449291 ) ) ( not ( = ?auto_449286 ?auto_449291 ) ) ( not ( = ?auto_449285 ?auto_449291 ) ) ( not ( = ?auto_449284 ?auto_449291 ) ) ( not ( = ?auto_449283 ?auto_449291 ) ) ( not ( = ?auto_449282 ?auto_449291 ) ) ( not ( = ?auto_449281 ?auto_449291 ) ) ( not ( = ?auto_449280 ?auto_449291 ) ) ( not ( = ?auto_449279 ?auto_449291 ) ) ( not ( = ?auto_449278 ?auto_449291 ) ) ( not ( = ?auto_449277 ?auto_449291 ) ) ( not ( = ?auto_449276 ?auto_449291 ) ) ( ON ?auto_449277 ?auto_449276 ) ( ON ?auto_449278 ?auto_449277 ) ( ON ?auto_449279 ?auto_449278 ) ( ON ?auto_449280 ?auto_449279 ) ( ON ?auto_449281 ?auto_449280 ) ( ON ?auto_449282 ?auto_449281 ) ( ON ?auto_449283 ?auto_449282 ) ( ON ?auto_449284 ?auto_449283 ) ( ON ?auto_449285 ?auto_449284 ) ( ON ?auto_449286 ?auto_449285 ) ( ON ?auto_449287 ?auto_449286 ) ( ON ?auto_449288 ?auto_449287 ) ( ON ?auto_449289 ?auto_449288 ) ( ON ?auto_449290 ?auto_449289 ) ( CLEAR ?auto_449290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_449290 ?auto_449289 ?auto_449288 ?auto_449287 ?auto_449286 ?auto_449285 ?auto_449284 ?auto_449283 ?auto_449282 ?auto_449281 ?auto_449280 ?auto_449279 ?auto_449278 ?auto_449277 ?auto_449276 )
      ( MAKE-15PILE ?auto_449276 ?auto_449277 ?auto_449278 ?auto_449279 ?auto_449280 ?auto_449281 ?auto_449282 ?auto_449283 ?auto_449284 ?auto_449285 ?auto_449286 ?auto_449287 ?auto_449288 ?auto_449289 ?auto_449290 ) )
  )

)
