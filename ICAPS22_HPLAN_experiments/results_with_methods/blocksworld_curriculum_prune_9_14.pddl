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
      ?auto_66081 - BLOCK
    )
    :vars
    (
      ?auto_66082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66081 ?auto_66082 ) ( CLEAR ?auto_66081 ) ( HAND-EMPTY ) ( not ( = ?auto_66081 ?auto_66082 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66081 ?auto_66082 )
      ( !PUTDOWN ?auto_66081 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66088 - BLOCK
      ?auto_66089 - BLOCK
    )
    :vars
    (
      ?auto_66090 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66088 ) ( ON ?auto_66089 ?auto_66090 ) ( CLEAR ?auto_66089 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66088 ) ( not ( = ?auto_66088 ?auto_66089 ) ) ( not ( = ?auto_66088 ?auto_66090 ) ) ( not ( = ?auto_66089 ?auto_66090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66089 ?auto_66090 )
      ( !STACK ?auto_66089 ?auto_66088 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66098 - BLOCK
      ?auto_66099 - BLOCK
    )
    :vars
    (
      ?auto_66100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66099 ?auto_66100 ) ( not ( = ?auto_66098 ?auto_66099 ) ) ( not ( = ?auto_66098 ?auto_66100 ) ) ( not ( = ?auto_66099 ?auto_66100 ) ) ( ON ?auto_66098 ?auto_66099 ) ( CLEAR ?auto_66098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66098 )
      ( MAKE-2PILE ?auto_66098 ?auto_66099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66109 - BLOCK
      ?auto_66110 - BLOCK
      ?auto_66111 - BLOCK
    )
    :vars
    (
      ?auto_66112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66110 ) ( ON ?auto_66111 ?auto_66112 ) ( CLEAR ?auto_66111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66109 ) ( ON ?auto_66110 ?auto_66109 ) ( not ( = ?auto_66109 ?auto_66110 ) ) ( not ( = ?auto_66109 ?auto_66111 ) ) ( not ( = ?auto_66109 ?auto_66112 ) ) ( not ( = ?auto_66110 ?auto_66111 ) ) ( not ( = ?auto_66110 ?auto_66112 ) ) ( not ( = ?auto_66111 ?auto_66112 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66111 ?auto_66112 )
      ( !STACK ?auto_66111 ?auto_66110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66123 - BLOCK
      ?auto_66124 - BLOCK
      ?auto_66125 - BLOCK
    )
    :vars
    (
      ?auto_66126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66125 ?auto_66126 ) ( ON-TABLE ?auto_66123 ) ( not ( = ?auto_66123 ?auto_66124 ) ) ( not ( = ?auto_66123 ?auto_66125 ) ) ( not ( = ?auto_66123 ?auto_66126 ) ) ( not ( = ?auto_66124 ?auto_66125 ) ) ( not ( = ?auto_66124 ?auto_66126 ) ) ( not ( = ?auto_66125 ?auto_66126 ) ) ( CLEAR ?auto_66123 ) ( ON ?auto_66124 ?auto_66125 ) ( CLEAR ?auto_66124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66123 ?auto_66124 )
      ( MAKE-3PILE ?auto_66123 ?auto_66124 ?auto_66125 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_66137 - BLOCK
      ?auto_66138 - BLOCK
      ?auto_66139 - BLOCK
    )
    :vars
    (
      ?auto_66140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66139 ?auto_66140 ) ( not ( = ?auto_66137 ?auto_66138 ) ) ( not ( = ?auto_66137 ?auto_66139 ) ) ( not ( = ?auto_66137 ?auto_66140 ) ) ( not ( = ?auto_66138 ?auto_66139 ) ) ( not ( = ?auto_66138 ?auto_66140 ) ) ( not ( = ?auto_66139 ?auto_66140 ) ) ( ON ?auto_66138 ?auto_66139 ) ( ON ?auto_66137 ?auto_66138 ) ( CLEAR ?auto_66137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66137 )
      ( MAKE-3PILE ?auto_66137 ?auto_66138 ?auto_66139 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66152 - BLOCK
      ?auto_66153 - BLOCK
      ?auto_66154 - BLOCK
      ?auto_66155 - BLOCK
    )
    :vars
    (
      ?auto_66156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66154 ) ( ON ?auto_66155 ?auto_66156 ) ( CLEAR ?auto_66155 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66152 ) ( ON ?auto_66153 ?auto_66152 ) ( ON ?auto_66154 ?auto_66153 ) ( not ( = ?auto_66152 ?auto_66153 ) ) ( not ( = ?auto_66152 ?auto_66154 ) ) ( not ( = ?auto_66152 ?auto_66155 ) ) ( not ( = ?auto_66152 ?auto_66156 ) ) ( not ( = ?auto_66153 ?auto_66154 ) ) ( not ( = ?auto_66153 ?auto_66155 ) ) ( not ( = ?auto_66153 ?auto_66156 ) ) ( not ( = ?auto_66154 ?auto_66155 ) ) ( not ( = ?auto_66154 ?auto_66156 ) ) ( not ( = ?auto_66155 ?auto_66156 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66155 ?auto_66156 )
      ( !STACK ?auto_66155 ?auto_66154 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66170 - BLOCK
      ?auto_66171 - BLOCK
      ?auto_66172 - BLOCK
      ?auto_66173 - BLOCK
    )
    :vars
    (
      ?auto_66174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66173 ?auto_66174 ) ( ON-TABLE ?auto_66170 ) ( ON ?auto_66171 ?auto_66170 ) ( not ( = ?auto_66170 ?auto_66171 ) ) ( not ( = ?auto_66170 ?auto_66172 ) ) ( not ( = ?auto_66170 ?auto_66173 ) ) ( not ( = ?auto_66170 ?auto_66174 ) ) ( not ( = ?auto_66171 ?auto_66172 ) ) ( not ( = ?auto_66171 ?auto_66173 ) ) ( not ( = ?auto_66171 ?auto_66174 ) ) ( not ( = ?auto_66172 ?auto_66173 ) ) ( not ( = ?auto_66172 ?auto_66174 ) ) ( not ( = ?auto_66173 ?auto_66174 ) ) ( CLEAR ?auto_66171 ) ( ON ?auto_66172 ?auto_66173 ) ( CLEAR ?auto_66172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66170 ?auto_66171 ?auto_66172 )
      ( MAKE-4PILE ?auto_66170 ?auto_66171 ?auto_66172 ?auto_66173 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66188 - BLOCK
      ?auto_66189 - BLOCK
      ?auto_66190 - BLOCK
      ?auto_66191 - BLOCK
    )
    :vars
    (
      ?auto_66192 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66191 ?auto_66192 ) ( ON-TABLE ?auto_66188 ) ( not ( = ?auto_66188 ?auto_66189 ) ) ( not ( = ?auto_66188 ?auto_66190 ) ) ( not ( = ?auto_66188 ?auto_66191 ) ) ( not ( = ?auto_66188 ?auto_66192 ) ) ( not ( = ?auto_66189 ?auto_66190 ) ) ( not ( = ?auto_66189 ?auto_66191 ) ) ( not ( = ?auto_66189 ?auto_66192 ) ) ( not ( = ?auto_66190 ?auto_66191 ) ) ( not ( = ?auto_66190 ?auto_66192 ) ) ( not ( = ?auto_66191 ?auto_66192 ) ) ( ON ?auto_66190 ?auto_66191 ) ( CLEAR ?auto_66188 ) ( ON ?auto_66189 ?auto_66190 ) ( CLEAR ?auto_66189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66188 ?auto_66189 )
      ( MAKE-4PILE ?auto_66188 ?auto_66189 ?auto_66190 ?auto_66191 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_66206 - BLOCK
      ?auto_66207 - BLOCK
      ?auto_66208 - BLOCK
      ?auto_66209 - BLOCK
    )
    :vars
    (
      ?auto_66210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66209 ?auto_66210 ) ( not ( = ?auto_66206 ?auto_66207 ) ) ( not ( = ?auto_66206 ?auto_66208 ) ) ( not ( = ?auto_66206 ?auto_66209 ) ) ( not ( = ?auto_66206 ?auto_66210 ) ) ( not ( = ?auto_66207 ?auto_66208 ) ) ( not ( = ?auto_66207 ?auto_66209 ) ) ( not ( = ?auto_66207 ?auto_66210 ) ) ( not ( = ?auto_66208 ?auto_66209 ) ) ( not ( = ?auto_66208 ?auto_66210 ) ) ( not ( = ?auto_66209 ?auto_66210 ) ) ( ON ?auto_66208 ?auto_66209 ) ( ON ?auto_66207 ?auto_66208 ) ( ON ?auto_66206 ?auto_66207 ) ( CLEAR ?auto_66206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66206 )
      ( MAKE-4PILE ?auto_66206 ?auto_66207 ?auto_66208 ?auto_66209 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66225 - BLOCK
      ?auto_66226 - BLOCK
      ?auto_66227 - BLOCK
      ?auto_66228 - BLOCK
      ?auto_66229 - BLOCK
    )
    :vars
    (
      ?auto_66230 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66228 ) ( ON ?auto_66229 ?auto_66230 ) ( CLEAR ?auto_66229 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66225 ) ( ON ?auto_66226 ?auto_66225 ) ( ON ?auto_66227 ?auto_66226 ) ( ON ?auto_66228 ?auto_66227 ) ( not ( = ?auto_66225 ?auto_66226 ) ) ( not ( = ?auto_66225 ?auto_66227 ) ) ( not ( = ?auto_66225 ?auto_66228 ) ) ( not ( = ?auto_66225 ?auto_66229 ) ) ( not ( = ?auto_66225 ?auto_66230 ) ) ( not ( = ?auto_66226 ?auto_66227 ) ) ( not ( = ?auto_66226 ?auto_66228 ) ) ( not ( = ?auto_66226 ?auto_66229 ) ) ( not ( = ?auto_66226 ?auto_66230 ) ) ( not ( = ?auto_66227 ?auto_66228 ) ) ( not ( = ?auto_66227 ?auto_66229 ) ) ( not ( = ?auto_66227 ?auto_66230 ) ) ( not ( = ?auto_66228 ?auto_66229 ) ) ( not ( = ?auto_66228 ?auto_66230 ) ) ( not ( = ?auto_66229 ?auto_66230 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66229 ?auto_66230 )
      ( !STACK ?auto_66229 ?auto_66228 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66247 - BLOCK
      ?auto_66248 - BLOCK
      ?auto_66249 - BLOCK
      ?auto_66250 - BLOCK
      ?auto_66251 - BLOCK
    )
    :vars
    (
      ?auto_66252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66251 ?auto_66252 ) ( ON-TABLE ?auto_66247 ) ( ON ?auto_66248 ?auto_66247 ) ( ON ?auto_66249 ?auto_66248 ) ( not ( = ?auto_66247 ?auto_66248 ) ) ( not ( = ?auto_66247 ?auto_66249 ) ) ( not ( = ?auto_66247 ?auto_66250 ) ) ( not ( = ?auto_66247 ?auto_66251 ) ) ( not ( = ?auto_66247 ?auto_66252 ) ) ( not ( = ?auto_66248 ?auto_66249 ) ) ( not ( = ?auto_66248 ?auto_66250 ) ) ( not ( = ?auto_66248 ?auto_66251 ) ) ( not ( = ?auto_66248 ?auto_66252 ) ) ( not ( = ?auto_66249 ?auto_66250 ) ) ( not ( = ?auto_66249 ?auto_66251 ) ) ( not ( = ?auto_66249 ?auto_66252 ) ) ( not ( = ?auto_66250 ?auto_66251 ) ) ( not ( = ?auto_66250 ?auto_66252 ) ) ( not ( = ?auto_66251 ?auto_66252 ) ) ( CLEAR ?auto_66249 ) ( ON ?auto_66250 ?auto_66251 ) ( CLEAR ?auto_66250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66247 ?auto_66248 ?auto_66249 ?auto_66250 )
      ( MAKE-5PILE ?auto_66247 ?auto_66248 ?auto_66249 ?auto_66250 ?auto_66251 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66269 - BLOCK
      ?auto_66270 - BLOCK
      ?auto_66271 - BLOCK
      ?auto_66272 - BLOCK
      ?auto_66273 - BLOCK
    )
    :vars
    (
      ?auto_66274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66273 ?auto_66274 ) ( ON-TABLE ?auto_66269 ) ( ON ?auto_66270 ?auto_66269 ) ( not ( = ?auto_66269 ?auto_66270 ) ) ( not ( = ?auto_66269 ?auto_66271 ) ) ( not ( = ?auto_66269 ?auto_66272 ) ) ( not ( = ?auto_66269 ?auto_66273 ) ) ( not ( = ?auto_66269 ?auto_66274 ) ) ( not ( = ?auto_66270 ?auto_66271 ) ) ( not ( = ?auto_66270 ?auto_66272 ) ) ( not ( = ?auto_66270 ?auto_66273 ) ) ( not ( = ?auto_66270 ?auto_66274 ) ) ( not ( = ?auto_66271 ?auto_66272 ) ) ( not ( = ?auto_66271 ?auto_66273 ) ) ( not ( = ?auto_66271 ?auto_66274 ) ) ( not ( = ?auto_66272 ?auto_66273 ) ) ( not ( = ?auto_66272 ?auto_66274 ) ) ( not ( = ?auto_66273 ?auto_66274 ) ) ( ON ?auto_66272 ?auto_66273 ) ( CLEAR ?auto_66270 ) ( ON ?auto_66271 ?auto_66272 ) ( CLEAR ?auto_66271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66269 ?auto_66270 ?auto_66271 )
      ( MAKE-5PILE ?auto_66269 ?auto_66270 ?auto_66271 ?auto_66272 ?auto_66273 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66291 - BLOCK
      ?auto_66292 - BLOCK
      ?auto_66293 - BLOCK
      ?auto_66294 - BLOCK
      ?auto_66295 - BLOCK
    )
    :vars
    (
      ?auto_66296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66295 ?auto_66296 ) ( ON-TABLE ?auto_66291 ) ( not ( = ?auto_66291 ?auto_66292 ) ) ( not ( = ?auto_66291 ?auto_66293 ) ) ( not ( = ?auto_66291 ?auto_66294 ) ) ( not ( = ?auto_66291 ?auto_66295 ) ) ( not ( = ?auto_66291 ?auto_66296 ) ) ( not ( = ?auto_66292 ?auto_66293 ) ) ( not ( = ?auto_66292 ?auto_66294 ) ) ( not ( = ?auto_66292 ?auto_66295 ) ) ( not ( = ?auto_66292 ?auto_66296 ) ) ( not ( = ?auto_66293 ?auto_66294 ) ) ( not ( = ?auto_66293 ?auto_66295 ) ) ( not ( = ?auto_66293 ?auto_66296 ) ) ( not ( = ?auto_66294 ?auto_66295 ) ) ( not ( = ?auto_66294 ?auto_66296 ) ) ( not ( = ?auto_66295 ?auto_66296 ) ) ( ON ?auto_66294 ?auto_66295 ) ( ON ?auto_66293 ?auto_66294 ) ( CLEAR ?auto_66291 ) ( ON ?auto_66292 ?auto_66293 ) ( CLEAR ?auto_66292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66291 ?auto_66292 )
      ( MAKE-5PILE ?auto_66291 ?auto_66292 ?auto_66293 ?auto_66294 ?auto_66295 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_66313 - BLOCK
      ?auto_66314 - BLOCK
      ?auto_66315 - BLOCK
      ?auto_66316 - BLOCK
      ?auto_66317 - BLOCK
    )
    :vars
    (
      ?auto_66318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66317 ?auto_66318 ) ( not ( = ?auto_66313 ?auto_66314 ) ) ( not ( = ?auto_66313 ?auto_66315 ) ) ( not ( = ?auto_66313 ?auto_66316 ) ) ( not ( = ?auto_66313 ?auto_66317 ) ) ( not ( = ?auto_66313 ?auto_66318 ) ) ( not ( = ?auto_66314 ?auto_66315 ) ) ( not ( = ?auto_66314 ?auto_66316 ) ) ( not ( = ?auto_66314 ?auto_66317 ) ) ( not ( = ?auto_66314 ?auto_66318 ) ) ( not ( = ?auto_66315 ?auto_66316 ) ) ( not ( = ?auto_66315 ?auto_66317 ) ) ( not ( = ?auto_66315 ?auto_66318 ) ) ( not ( = ?auto_66316 ?auto_66317 ) ) ( not ( = ?auto_66316 ?auto_66318 ) ) ( not ( = ?auto_66317 ?auto_66318 ) ) ( ON ?auto_66316 ?auto_66317 ) ( ON ?auto_66315 ?auto_66316 ) ( ON ?auto_66314 ?auto_66315 ) ( ON ?auto_66313 ?auto_66314 ) ( CLEAR ?auto_66313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66313 )
      ( MAKE-5PILE ?auto_66313 ?auto_66314 ?auto_66315 ?auto_66316 ?auto_66317 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66336 - BLOCK
      ?auto_66337 - BLOCK
      ?auto_66338 - BLOCK
      ?auto_66339 - BLOCK
      ?auto_66340 - BLOCK
      ?auto_66341 - BLOCK
    )
    :vars
    (
      ?auto_66342 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66340 ) ( ON ?auto_66341 ?auto_66342 ) ( CLEAR ?auto_66341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66336 ) ( ON ?auto_66337 ?auto_66336 ) ( ON ?auto_66338 ?auto_66337 ) ( ON ?auto_66339 ?auto_66338 ) ( ON ?auto_66340 ?auto_66339 ) ( not ( = ?auto_66336 ?auto_66337 ) ) ( not ( = ?auto_66336 ?auto_66338 ) ) ( not ( = ?auto_66336 ?auto_66339 ) ) ( not ( = ?auto_66336 ?auto_66340 ) ) ( not ( = ?auto_66336 ?auto_66341 ) ) ( not ( = ?auto_66336 ?auto_66342 ) ) ( not ( = ?auto_66337 ?auto_66338 ) ) ( not ( = ?auto_66337 ?auto_66339 ) ) ( not ( = ?auto_66337 ?auto_66340 ) ) ( not ( = ?auto_66337 ?auto_66341 ) ) ( not ( = ?auto_66337 ?auto_66342 ) ) ( not ( = ?auto_66338 ?auto_66339 ) ) ( not ( = ?auto_66338 ?auto_66340 ) ) ( not ( = ?auto_66338 ?auto_66341 ) ) ( not ( = ?auto_66338 ?auto_66342 ) ) ( not ( = ?auto_66339 ?auto_66340 ) ) ( not ( = ?auto_66339 ?auto_66341 ) ) ( not ( = ?auto_66339 ?auto_66342 ) ) ( not ( = ?auto_66340 ?auto_66341 ) ) ( not ( = ?auto_66340 ?auto_66342 ) ) ( not ( = ?auto_66341 ?auto_66342 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66341 ?auto_66342 )
      ( !STACK ?auto_66341 ?auto_66340 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66362 - BLOCK
      ?auto_66363 - BLOCK
      ?auto_66364 - BLOCK
      ?auto_66365 - BLOCK
      ?auto_66366 - BLOCK
      ?auto_66367 - BLOCK
    )
    :vars
    (
      ?auto_66368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66367 ?auto_66368 ) ( ON-TABLE ?auto_66362 ) ( ON ?auto_66363 ?auto_66362 ) ( ON ?auto_66364 ?auto_66363 ) ( ON ?auto_66365 ?auto_66364 ) ( not ( = ?auto_66362 ?auto_66363 ) ) ( not ( = ?auto_66362 ?auto_66364 ) ) ( not ( = ?auto_66362 ?auto_66365 ) ) ( not ( = ?auto_66362 ?auto_66366 ) ) ( not ( = ?auto_66362 ?auto_66367 ) ) ( not ( = ?auto_66362 ?auto_66368 ) ) ( not ( = ?auto_66363 ?auto_66364 ) ) ( not ( = ?auto_66363 ?auto_66365 ) ) ( not ( = ?auto_66363 ?auto_66366 ) ) ( not ( = ?auto_66363 ?auto_66367 ) ) ( not ( = ?auto_66363 ?auto_66368 ) ) ( not ( = ?auto_66364 ?auto_66365 ) ) ( not ( = ?auto_66364 ?auto_66366 ) ) ( not ( = ?auto_66364 ?auto_66367 ) ) ( not ( = ?auto_66364 ?auto_66368 ) ) ( not ( = ?auto_66365 ?auto_66366 ) ) ( not ( = ?auto_66365 ?auto_66367 ) ) ( not ( = ?auto_66365 ?auto_66368 ) ) ( not ( = ?auto_66366 ?auto_66367 ) ) ( not ( = ?auto_66366 ?auto_66368 ) ) ( not ( = ?auto_66367 ?auto_66368 ) ) ( CLEAR ?auto_66365 ) ( ON ?auto_66366 ?auto_66367 ) ( CLEAR ?auto_66366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66362 ?auto_66363 ?auto_66364 ?auto_66365 ?auto_66366 )
      ( MAKE-6PILE ?auto_66362 ?auto_66363 ?auto_66364 ?auto_66365 ?auto_66366 ?auto_66367 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66388 - BLOCK
      ?auto_66389 - BLOCK
      ?auto_66390 - BLOCK
      ?auto_66391 - BLOCK
      ?auto_66392 - BLOCK
      ?auto_66393 - BLOCK
    )
    :vars
    (
      ?auto_66394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66393 ?auto_66394 ) ( ON-TABLE ?auto_66388 ) ( ON ?auto_66389 ?auto_66388 ) ( ON ?auto_66390 ?auto_66389 ) ( not ( = ?auto_66388 ?auto_66389 ) ) ( not ( = ?auto_66388 ?auto_66390 ) ) ( not ( = ?auto_66388 ?auto_66391 ) ) ( not ( = ?auto_66388 ?auto_66392 ) ) ( not ( = ?auto_66388 ?auto_66393 ) ) ( not ( = ?auto_66388 ?auto_66394 ) ) ( not ( = ?auto_66389 ?auto_66390 ) ) ( not ( = ?auto_66389 ?auto_66391 ) ) ( not ( = ?auto_66389 ?auto_66392 ) ) ( not ( = ?auto_66389 ?auto_66393 ) ) ( not ( = ?auto_66389 ?auto_66394 ) ) ( not ( = ?auto_66390 ?auto_66391 ) ) ( not ( = ?auto_66390 ?auto_66392 ) ) ( not ( = ?auto_66390 ?auto_66393 ) ) ( not ( = ?auto_66390 ?auto_66394 ) ) ( not ( = ?auto_66391 ?auto_66392 ) ) ( not ( = ?auto_66391 ?auto_66393 ) ) ( not ( = ?auto_66391 ?auto_66394 ) ) ( not ( = ?auto_66392 ?auto_66393 ) ) ( not ( = ?auto_66392 ?auto_66394 ) ) ( not ( = ?auto_66393 ?auto_66394 ) ) ( ON ?auto_66392 ?auto_66393 ) ( CLEAR ?auto_66390 ) ( ON ?auto_66391 ?auto_66392 ) ( CLEAR ?auto_66391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66388 ?auto_66389 ?auto_66390 ?auto_66391 )
      ( MAKE-6PILE ?auto_66388 ?auto_66389 ?auto_66390 ?auto_66391 ?auto_66392 ?auto_66393 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66414 - BLOCK
      ?auto_66415 - BLOCK
      ?auto_66416 - BLOCK
      ?auto_66417 - BLOCK
      ?auto_66418 - BLOCK
      ?auto_66419 - BLOCK
    )
    :vars
    (
      ?auto_66420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66419 ?auto_66420 ) ( ON-TABLE ?auto_66414 ) ( ON ?auto_66415 ?auto_66414 ) ( not ( = ?auto_66414 ?auto_66415 ) ) ( not ( = ?auto_66414 ?auto_66416 ) ) ( not ( = ?auto_66414 ?auto_66417 ) ) ( not ( = ?auto_66414 ?auto_66418 ) ) ( not ( = ?auto_66414 ?auto_66419 ) ) ( not ( = ?auto_66414 ?auto_66420 ) ) ( not ( = ?auto_66415 ?auto_66416 ) ) ( not ( = ?auto_66415 ?auto_66417 ) ) ( not ( = ?auto_66415 ?auto_66418 ) ) ( not ( = ?auto_66415 ?auto_66419 ) ) ( not ( = ?auto_66415 ?auto_66420 ) ) ( not ( = ?auto_66416 ?auto_66417 ) ) ( not ( = ?auto_66416 ?auto_66418 ) ) ( not ( = ?auto_66416 ?auto_66419 ) ) ( not ( = ?auto_66416 ?auto_66420 ) ) ( not ( = ?auto_66417 ?auto_66418 ) ) ( not ( = ?auto_66417 ?auto_66419 ) ) ( not ( = ?auto_66417 ?auto_66420 ) ) ( not ( = ?auto_66418 ?auto_66419 ) ) ( not ( = ?auto_66418 ?auto_66420 ) ) ( not ( = ?auto_66419 ?auto_66420 ) ) ( ON ?auto_66418 ?auto_66419 ) ( ON ?auto_66417 ?auto_66418 ) ( CLEAR ?auto_66415 ) ( ON ?auto_66416 ?auto_66417 ) ( CLEAR ?auto_66416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66414 ?auto_66415 ?auto_66416 )
      ( MAKE-6PILE ?auto_66414 ?auto_66415 ?auto_66416 ?auto_66417 ?auto_66418 ?auto_66419 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66440 - BLOCK
      ?auto_66441 - BLOCK
      ?auto_66442 - BLOCK
      ?auto_66443 - BLOCK
      ?auto_66444 - BLOCK
      ?auto_66445 - BLOCK
    )
    :vars
    (
      ?auto_66446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66445 ?auto_66446 ) ( ON-TABLE ?auto_66440 ) ( not ( = ?auto_66440 ?auto_66441 ) ) ( not ( = ?auto_66440 ?auto_66442 ) ) ( not ( = ?auto_66440 ?auto_66443 ) ) ( not ( = ?auto_66440 ?auto_66444 ) ) ( not ( = ?auto_66440 ?auto_66445 ) ) ( not ( = ?auto_66440 ?auto_66446 ) ) ( not ( = ?auto_66441 ?auto_66442 ) ) ( not ( = ?auto_66441 ?auto_66443 ) ) ( not ( = ?auto_66441 ?auto_66444 ) ) ( not ( = ?auto_66441 ?auto_66445 ) ) ( not ( = ?auto_66441 ?auto_66446 ) ) ( not ( = ?auto_66442 ?auto_66443 ) ) ( not ( = ?auto_66442 ?auto_66444 ) ) ( not ( = ?auto_66442 ?auto_66445 ) ) ( not ( = ?auto_66442 ?auto_66446 ) ) ( not ( = ?auto_66443 ?auto_66444 ) ) ( not ( = ?auto_66443 ?auto_66445 ) ) ( not ( = ?auto_66443 ?auto_66446 ) ) ( not ( = ?auto_66444 ?auto_66445 ) ) ( not ( = ?auto_66444 ?auto_66446 ) ) ( not ( = ?auto_66445 ?auto_66446 ) ) ( ON ?auto_66444 ?auto_66445 ) ( ON ?auto_66443 ?auto_66444 ) ( ON ?auto_66442 ?auto_66443 ) ( CLEAR ?auto_66440 ) ( ON ?auto_66441 ?auto_66442 ) ( CLEAR ?auto_66441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66440 ?auto_66441 )
      ( MAKE-6PILE ?auto_66440 ?auto_66441 ?auto_66442 ?auto_66443 ?auto_66444 ?auto_66445 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_66466 - BLOCK
      ?auto_66467 - BLOCK
      ?auto_66468 - BLOCK
      ?auto_66469 - BLOCK
      ?auto_66470 - BLOCK
      ?auto_66471 - BLOCK
    )
    :vars
    (
      ?auto_66472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66471 ?auto_66472 ) ( not ( = ?auto_66466 ?auto_66467 ) ) ( not ( = ?auto_66466 ?auto_66468 ) ) ( not ( = ?auto_66466 ?auto_66469 ) ) ( not ( = ?auto_66466 ?auto_66470 ) ) ( not ( = ?auto_66466 ?auto_66471 ) ) ( not ( = ?auto_66466 ?auto_66472 ) ) ( not ( = ?auto_66467 ?auto_66468 ) ) ( not ( = ?auto_66467 ?auto_66469 ) ) ( not ( = ?auto_66467 ?auto_66470 ) ) ( not ( = ?auto_66467 ?auto_66471 ) ) ( not ( = ?auto_66467 ?auto_66472 ) ) ( not ( = ?auto_66468 ?auto_66469 ) ) ( not ( = ?auto_66468 ?auto_66470 ) ) ( not ( = ?auto_66468 ?auto_66471 ) ) ( not ( = ?auto_66468 ?auto_66472 ) ) ( not ( = ?auto_66469 ?auto_66470 ) ) ( not ( = ?auto_66469 ?auto_66471 ) ) ( not ( = ?auto_66469 ?auto_66472 ) ) ( not ( = ?auto_66470 ?auto_66471 ) ) ( not ( = ?auto_66470 ?auto_66472 ) ) ( not ( = ?auto_66471 ?auto_66472 ) ) ( ON ?auto_66470 ?auto_66471 ) ( ON ?auto_66469 ?auto_66470 ) ( ON ?auto_66468 ?auto_66469 ) ( ON ?auto_66467 ?auto_66468 ) ( ON ?auto_66466 ?auto_66467 ) ( CLEAR ?auto_66466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66466 )
      ( MAKE-6PILE ?auto_66466 ?auto_66467 ?auto_66468 ?auto_66469 ?auto_66470 ?auto_66471 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_66493 - BLOCK
      ?auto_66494 - BLOCK
      ?auto_66495 - BLOCK
      ?auto_66496 - BLOCK
      ?auto_66497 - BLOCK
      ?auto_66498 - BLOCK
      ?auto_66499 - BLOCK
    )
    :vars
    (
      ?auto_66500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66498 ) ( ON ?auto_66499 ?auto_66500 ) ( CLEAR ?auto_66499 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66493 ) ( ON ?auto_66494 ?auto_66493 ) ( ON ?auto_66495 ?auto_66494 ) ( ON ?auto_66496 ?auto_66495 ) ( ON ?auto_66497 ?auto_66496 ) ( ON ?auto_66498 ?auto_66497 ) ( not ( = ?auto_66493 ?auto_66494 ) ) ( not ( = ?auto_66493 ?auto_66495 ) ) ( not ( = ?auto_66493 ?auto_66496 ) ) ( not ( = ?auto_66493 ?auto_66497 ) ) ( not ( = ?auto_66493 ?auto_66498 ) ) ( not ( = ?auto_66493 ?auto_66499 ) ) ( not ( = ?auto_66493 ?auto_66500 ) ) ( not ( = ?auto_66494 ?auto_66495 ) ) ( not ( = ?auto_66494 ?auto_66496 ) ) ( not ( = ?auto_66494 ?auto_66497 ) ) ( not ( = ?auto_66494 ?auto_66498 ) ) ( not ( = ?auto_66494 ?auto_66499 ) ) ( not ( = ?auto_66494 ?auto_66500 ) ) ( not ( = ?auto_66495 ?auto_66496 ) ) ( not ( = ?auto_66495 ?auto_66497 ) ) ( not ( = ?auto_66495 ?auto_66498 ) ) ( not ( = ?auto_66495 ?auto_66499 ) ) ( not ( = ?auto_66495 ?auto_66500 ) ) ( not ( = ?auto_66496 ?auto_66497 ) ) ( not ( = ?auto_66496 ?auto_66498 ) ) ( not ( = ?auto_66496 ?auto_66499 ) ) ( not ( = ?auto_66496 ?auto_66500 ) ) ( not ( = ?auto_66497 ?auto_66498 ) ) ( not ( = ?auto_66497 ?auto_66499 ) ) ( not ( = ?auto_66497 ?auto_66500 ) ) ( not ( = ?auto_66498 ?auto_66499 ) ) ( not ( = ?auto_66498 ?auto_66500 ) ) ( not ( = ?auto_66499 ?auto_66500 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66499 ?auto_66500 )
      ( !STACK ?auto_66499 ?auto_66498 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_66523 - BLOCK
      ?auto_66524 - BLOCK
      ?auto_66525 - BLOCK
      ?auto_66526 - BLOCK
      ?auto_66527 - BLOCK
      ?auto_66528 - BLOCK
      ?auto_66529 - BLOCK
    )
    :vars
    (
      ?auto_66530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66529 ?auto_66530 ) ( ON-TABLE ?auto_66523 ) ( ON ?auto_66524 ?auto_66523 ) ( ON ?auto_66525 ?auto_66524 ) ( ON ?auto_66526 ?auto_66525 ) ( ON ?auto_66527 ?auto_66526 ) ( not ( = ?auto_66523 ?auto_66524 ) ) ( not ( = ?auto_66523 ?auto_66525 ) ) ( not ( = ?auto_66523 ?auto_66526 ) ) ( not ( = ?auto_66523 ?auto_66527 ) ) ( not ( = ?auto_66523 ?auto_66528 ) ) ( not ( = ?auto_66523 ?auto_66529 ) ) ( not ( = ?auto_66523 ?auto_66530 ) ) ( not ( = ?auto_66524 ?auto_66525 ) ) ( not ( = ?auto_66524 ?auto_66526 ) ) ( not ( = ?auto_66524 ?auto_66527 ) ) ( not ( = ?auto_66524 ?auto_66528 ) ) ( not ( = ?auto_66524 ?auto_66529 ) ) ( not ( = ?auto_66524 ?auto_66530 ) ) ( not ( = ?auto_66525 ?auto_66526 ) ) ( not ( = ?auto_66525 ?auto_66527 ) ) ( not ( = ?auto_66525 ?auto_66528 ) ) ( not ( = ?auto_66525 ?auto_66529 ) ) ( not ( = ?auto_66525 ?auto_66530 ) ) ( not ( = ?auto_66526 ?auto_66527 ) ) ( not ( = ?auto_66526 ?auto_66528 ) ) ( not ( = ?auto_66526 ?auto_66529 ) ) ( not ( = ?auto_66526 ?auto_66530 ) ) ( not ( = ?auto_66527 ?auto_66528 ) ) ( not ( = ?auto_66527 ?auto_66529 ) ) ( not ( = ?auto_66527 ?auto_66530 ) ) ( not ( = ?auto_66528 ?auto_66529 ) ) ( not ( = ?auto_66528 ?auto_66530 ) ) ( not ( = ?auto_66529 ?auto_66530 ) ) ( CLEAR ?auto_66527 ) ( ON ?auto_66528 ?auto_66529 ) ( CLEAR ?auto_66528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66523 ?auto_66524 ?auto_66525 ?auto_66526 ?auto_66527 ?auto_66528 )
      ( MAKE-7PILE ?auto_66523 ?auto_66524 ?auto_66525 ?auto_66526 ?auto_66527 ?auto_66528 ?auto_66529 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_66553 - BLOCK
      ?auto_66554 - BLOCK
      ?auto_66555 - BLOCK
      ?auto_66556 - BLOCK
      ?auto_66557 - BLOCK
      ?auto_66558 - BLOCK
      ?auto_66559 - BLOCK
    )
    :vars
    (
      ?auto_66560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66559 ?auto_66560 ) ( ON-TABLE ?auto_66553 ) ( ON ?auto_66554 ?auto_66553 ) ( ON ?auto_66555 ?auto_66554 ) ( ON ?auto_66556 ?auto_66555 ) ( not ( = ?auto_66553 ?auto_66554 ) ) ( not ( = ?auto_66553 ?auto_66555 ) ) ( not ( = ?auto_66553 ?auto_66556 ) ) ( not ( = ?auto_66553 ?auto_66557 ) ) ( not ( = ?auto_66553 ?auto_66558 ) ) ( not ( = ?auto_66553 ?auto_66559 ) ) ( not ( = ?auto_66553 ?auto_66560 ) ) ( not ( = ?auto_66554 ?auto_66555 ) ) ( not ( = ?auto_66554 ?auto_66556 ) ) ( not ( = ?auto_66554 ?auto_66557 ) ) ( not ( = ?auto_66554 ?auto_66558 ) ) ( not ( = ?auto_66554 ?auto_66559 ) ) ( not ( = ?auto_66554 ?auto_66560 ) ) ( not ( = ?auto_66555 ?auto_66556 ) ) ( not ( = ?auto_66555 ?auto_66557 ) ) ( not ( = ?auto_66555 ?auto_66558 ) ) ( not ( = ?auto_66555 ?auto_66559 ) ) ( not ( = ?auto_66555 ?auto_66560 ) ) ( not ( = ?auto_66556 ?auto_66557 ) ) ( not ( = ?auto_66556 ?auto_66558 ) ) ( not ( = ?auto_66556 ?auto_66559 ) ) ( not ( = ?auto_66556 ?auto_66560 ) ) ( not ( = ?auto_66557 ?auto_66558 ) ) ( not ( = ?auto_66557 ?auto_66559 ) ) ( not ( = ?auto_66557 ?auto_66560 ) ) ( not ( = ?auto_66558 ?auto_66559 ) ) ( not ( = ?auto_66558 ?auto_66560 ) ) ( not ( = ?auto_66559 ?auto_66560 ) ) ( ON ?auto_66558 ?auto_66559 ) ( CLEAR ?auto_66556 ) ( ON ?auto_66557 ?auto_66558 ) ( CLEAR ?auto_66557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66553 ?auto_66554 ?auto_66555 ?auto_66556 ?auto_66557 )
      ( MAKE-7PILE ?auto_66553 ?auto_66554 ?auto_66555 ?auto_66556 ?auto_66557 ?auto_66558 ?auto_66559 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_66583 - BLOCK
      ?auto_66584 - BLOCK
      ?auto_66585 - BLOCK
      ?auto_66586 - BLOCK
      ?auto_66587 - BLOCK
      ?auto_66588 - BLOCK
      ?auto_66589 - BLOCK
    )
    :vars
    (
      ?auto_66590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66589 ?auto_66590 ) ( ON-TABLE ?auto_66583 ) ( ON ?auto_66584 ?auto_66583 ) ( ON ?auto_66585 ?auto_66584 ) ( not ( = ?auto_66583 ?auto_66584 ) ) ( not ( = ?auto_66583 ?auto_66585 ) ) ( not ( = ?auto_66583 ?auto_66586 ) ) ( not ( = ?auto_66583 ?auto_66587 ) ) ( not ( = ?auto_66583 ?auto_66588 ) ) ( not ( = ?auto_66583 ?auto_66589 ) ) ( not ( = ?auto_66583 ?auto_66590 ) ) ( not ( = ?auto_66584 ?auto_66585 ) ) ( not ( = ?auto_66584 ?auto_66586 ) ) ( not ( = ?auto_66584 ?auto_66587 ) ) ( not ( = ?auto_66584 ?auto_66588 ) ) ( not ( = ?auto_66584 ?auto_66589 ) ) ( not ( = ?auto_66584 ?auto_66590 ) ) ( not ( = ?auto_66585 ?auto_66586 ) ) ( not ( = ?auto_66585 ?auto_66587 ) ) ( not ( = ?auto_66585 ?auto_66588 ) ) ( not ( = ?auto_66585 ?auto_66589 ) ) ( not ( = ?auto_66585 ?auto_66590 ) ) ( not ( = ?auto_66586 ?auto_66587 ) ) ( not ( = ?auto_66586 ?auto_66588 ) ) ( not ( = ?auto_66586 ?auto_66589 ) ) ( not ( = ?auto_66586 ?auto_66590 ) ) ( not ( = ?auto_66587 ?auto_66588 ) ) ( not ( = ?auto_66587 ?auto_66589 ) ) ( not ( = ?auto_66587 ?auto_66590 ) ) ( not ( = ?auto_66588 ?auto_66589 ) ) ( not ( = ?auto_66588 ?auto_66590 ) ) ( not ( = ?auto_66589 ?auto_66590 ) ) ( ON ?auto_66588 ?auto_66589 ) ( ON ?auto_66587 ?auto_66588 ) ( CLEAR ?auto_66585 ) ( ON ?auto_66586 ?auto_66587 ) ( CLEAR ?auto_66586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66583 ?auto_66584 ?auto_66585 ?auto_66586 )
      ( MAKE-7PILE ?auto_66583 ?auto_66584 ?auto_66585 ?auto_66586 ?auto_66587 ?auto_66588 ?auto_66589 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_66613 - BLOCK
      ?auto_66614 - BLOCK
      ?auto_66615 - BLOCK
      ?auto_66616 - BLOCK
      ?auto_66617 - BLOCK
      ?auto_66618 - BLOCK
      ?auto_66619 - BLOCK
    )
    :vars
    (
      ?auto_66620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66619 ?auto_66620 ) ( ON-TABLE ?auto_66613 ) ( ON ?auto_66614 ?auto_66613 ) ( not ( = ?auto_66613 ?auto_66614 ) ) ( not ( = ?auto_66613 ?auto_66615 ) ) ( not ( = ?auto_66613 ?auto_66616 ) ) ( not ( = ?auto_66613 ?auto_66617 ) ) ( not ( = ?auto_66613 ?auto_66618 ) ) ( not ( = ?auto_66613 ?auto_66619 ) ) ( not ( = ?auto_66613 ?auto_66620 ) ) ( not ( = ?auto_66614 ?auto_66615 ) ) ( not ( = ?auto_66614 ?auto_66616 ) ) ( not ( = ?auto_66614 ?auto_66617 ) ) ( not ( = ?auto_66614 ?auto_66618 ) ) ( not ( = ?auto_66614 ?auto_66619 ) ) ( not ( = ?auto_66614 ?auto_66620 ) ) ( not ( = ?auto_66615 ?auto_66616 ) ) ( not ( = ?auto_66615 ?auto_66617 ) ) ( not ( = ?auto_66615 ?auto_66618 ) ) ( not ( = ?auto_66615 ?auto_66619 ) ) ( not ( = ?auto_66615 ?auto_66620 ) ) ( not ( = ?auto_66616 ?auto_66617 ) ) ( not ( = ?auto_66616 ?auto_66618 ) ) ( not ( = ?auto_66616 ?auto_66619 ) ) ( not ( = ?auto_66616 ?auto_66620 ) ) ( not ( = ?auto_66617 ?auto_66618 ) ) ( not ( = ?auto_66617 ?auto_66619 ) ) ( not ( = ?auto_66617 ?auto_66620 ) ) ( not ( = ?auto_66618 ?auto_66619 ) ) ( not ( = ?auto_66618 ?auto_66620 ) ) ( not ( = ?auto_66619 ?auto_66620 ) ) ( ON ?auto_66618 ?auto_66619 ) ( ON ?auto_66617 ?auto_66618 ) ( ON ?auto_66616 ?auto_66617 ) ( CLEAR ?auto_66614 ) ( ON ?auto_66615 ?auto_66616 ) ( CLEAR ?auto_66615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66613 ?auto_66614 ?auto_66615 )
      ( MAKE-7PILE ?auto_66613 ?auto_66614 ?auto_66615 ?auto_66616 ?auto_66617 ?auto_66618 ?auto_66619 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_66643 - BLOCK
      ?auto_66644 - BLOCK
      ?auto_66645 - BLOCK
      ?auto_66646 - BLOCK
      ?auto_66647 - BLOCK
      ?auto_66648 - BLOCK
      ?auto_66649 - BLOCK
    )
    :vars
    (
      ?auto_66650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66649 ?auto_66650 ) ( ON-TABLE ?auto_66643 ) ( not ( = ?auto_66643 ?auto_66644 ) ) ( not ( = ?auto_66643 ?auto_66645 ) ) ( not ( = ?auto_66643 ?auto_66646 ) ) ( not ( = ?auto_66643 ?auto_66647 ) ) ( not ( = ?auto_66643 ?auto_66648 ) ) ( not ( = ?auto_66643 ?auto_66649 ) ) ( not ( = ?auto_66643 ?auto_66650 ) ) ( not ( = ?auto_66644 ?auto_66645 ) ) ( not ( = ?auto_66644 ?auto_66646 ) ) ( not ( = ?auto_66644 ?auto_66647 ) ) ( not ( = ?auto_66644 ?auto_66648 ) ) ( not ( = ?auto_66644 ?auto_66649 ) ) ( not ( = ?auto_66644 ?auto_66650 ) ) ( not ( = ?auto_66645 ?auto_66646 ) ) ( not ( = ?auto_66645 ?auto_66647 ) ) ( not ( = ?auto_66645 ?auto_66648 ) ) ( not ( = ?auto_66645 ?auto_66649 ) ) ( not ( = ?auto_66645 ?auto_66650 ) ) ( not ( = ?auto_66646 ?auto_66647 ) ) ( not ( = ?auto_66646 ?auto_66648 ) ) ( not ( = ?auto_66646 ?auto_66649 ) ) ( not ( = ?auto_66646 ?auto_66650 ) ) ( not ( = ?auto_66647 ?auto_66648 ) ) ( not ( = ?auto_66647 ?auto_66649 ) ) ( not ( = ?auto_66647 ?auto_66650 ) ) ( not ( = ?auto_66648 ?auto_66649 ) ) ( not ( = ?auto_66648 ?auto_66650 ) ) ( not ( = ?auto_66649 ?auto_66650 ) ) ( ON ?auto_66648 ?auto_66649 ) ( ON ?auto_66647 ?auto_66648 ) ( ON ?auto_66646 ?auto_66647 ) ( ON ?auto_66645 ?auto_66646 ) ( CLEAR ?auto_66643 ) ( ON ?auto_66644 ?auto_66645 ) ( CLEAR ?auto_66644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66643 ?auto_66644 )
      ( MAKE-7PILE ?auto_66643 ?auto_66644 ?auto_66645 ?auto_66646 ?auto_66647 ?auto_66648 ?auto_66649 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_66673 - BLOCK
      ?auto_66674 - BLOCK
      ?auto_66675 - BLOCK
      ?auto_66676 - BLOCK
      ?auto_66677 - BLOCK
      ?auto_66678 - BLOCK
      ?auto_66679 - BLOCK
    )
    :vars
    (
      ?auto_66680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66679 ?auto_66680 ) ( not ( = ?auto_66673 ?auto_66674 ) ) ( not ( = ?auto_66673 ?auto_66675 ) ) ( not ( = ?auto_66673 ?auto_66676 ) ) ( not ( = ?auto_66673 ?auto_66677 ) ) ( not ( = ?auto_66673 ?auto_66678 ) ) ( not ( = ?auto_66673 ?auto_66679 ) ) ( not ( = ?auto_66673 ?auto_66680 ) ) ( not ( = ?auto_66674 ?auto_66675 ) ) ( not ( = ?auto_66674 ?auto_66676 ) ) ( not ( = ?auto_66674 ?auto_66677 ) ) ( not ( = ?auto_66674 ?auto_66678 ) ) ( not ( = ?auto_66674 ?auto_66679 ) ) ( not ( = ?auto_66674 ?auto_66680 ) ) ( not ( = ?auto_66675 ?auto_66676 ) ) ( not ( = ?auto_66675 ?auto_66677 ) ) ( not ( = ?auto_66675 ?auto_66678 ) ) ( not ( = ?auto_66675 ?auto_66679 ) ) ( not ( = ?auto_66675 ?auto_66680 ) ) ( not ( = ?auto_66676 ?auto_66677 ) ) ( not ( = ?auto_66676 ?auto_66678 ) ) ( not ( = ?auto_66676 ?auto_66679 ) ) ( not ( = ?auto_66676 ?auto_66680 ) ) ( not ( = ?auto_66677 ?auto_66678 ) ) ( not ( = ?auto_66677 ?auto_66679 ) ) ( not ( = ?auto_66677 ?auto_66680 ) ) ( not ( = ?auto_66678 ?auto_66679 ) ) ( not ( = ?auto_66678 ?auto_66680 ) ) ( not ( = ?auto_66679 ?auto_66680 ) ) ( ON ?auto_66678 ?auto_66679 ) ( ON ?auto_66677 ?auto_66678 ) ( ON ?auto_66676 ?auto_66677 ) ( ON ?auto_66675 ?auto_66676 ) ( ON ?auto_66674 ?auto_66675 ) ( ON ?auto_66673 ?auto_66674 ) ( CLEAR ?auto_66673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66673 )
      ( MAKE-7PILE ?auto_66673 ?auto_66674 ?auto_66675 ?auto_66676 ?auto_66677 ?auto_66678 ?auto_66679 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_66704 - BLOCK
      ?auto_66705 - BLOCK
      ?auto_66706 - BLOCK
      ?auto_66707 - BLOCK
      ?auto_66708 - BLOCK
      ?auto_66709 - BLOCK
      ?auto_66710 - BLOCK
      ?auto_66711 - BLOCK
    )
    :vars
    (
      ?auto_66712 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66710 ) ( ON ?auto_66711 ?auto_66712 ) ( CLEAR ?auto_66711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66704 ) ( ON ?auto_66705 ?auto_66704 ) ( ON ?auto_66706 ?auto_66705 ) ( ON ?auto_66707 ?auto_66706 ) ( ON ?auto_66708 ?auto_66707 ) ( ON ?auto_66709 ?auto_66708 ) ( ON ?auto_66710 ?auto_66709 ) ( not ( = ?auto_66704 ?auto_66705 ) ) ( not ( = ?auto_66704 ?auto_66706 ) ) ( not ( = ?auto_66704 ?auto_66707 ) ) ( not ( = ?auto_66704 ?auto_66708 ) ) ( not ( = ?auto_66704 ?auto_66709 ) ) ( not ( = ?auto_66704 ?auto_66710 ) ) ( not ( = ?auto_66704 ?auto_66711 ) ) ( not ( = ?auto_66704 ?auto_66712 ) ) ( not ( = ?auto_66705 ?auto_66706 ) ) ( not ( = ?auto_66705 ?auto_66707 ) ) ( not ( = ?auto_66705 ?auto_66708 ) ) ( not ( = ?auto_66705 ?auto_66709 ) ) ( not ( = ?auto_66705 ?auto_66710 ) ) ( not ( = ?auto_66705 ?auto_66711 ) ) ( not ( = ?auto_66705 ?auto_66712 ) ) ( not ( = ?auto_66706 ?auto_66707 ) ) ( not ( = ?auto_66706 ?auto_66708 ) ) ( not ( = ?auto_66706 ?auto_66709 ) ) ( not ( = ?auto_66706 ?auto_66710 ) ) ( not ( = ?auto_66706 ?auto_66711 ) ) ( not ( = ?auto_66706 ?auto_66712 ) ) ( not ( = ?auto_66707 ?auto_66708 ) ) ( not ( = ?auto_66707 ?auto_66709 ) ) ( not ( = ?auto_66707 ?auto_66710 ) ) ( not ( = ?auto_66707 ?auto_66711 ) ) ( not ( = ?auto_66707 ?auto_66712 ) ) ( not ( = ?auto_66708 ?auto_66709 ) ) ( not ( = ?auto_66708 ?auto_66710 ) ) ( not ( = ?auto_66708 ?auto_66711 ) ) ( not ( = ?auto_66708 ?auto_66712 ) ) ( not ( = ?auto_66709 ?auto_66710 ) ) ( not ( = ?auto_66709 ?auto_66711 ) ) ( not ( = ?auto_66709 ?auto_66712 ) ) ( not ( = ?auto_66710 ?auto_66711 ) ) ( not ( = ?auto_66710 ?auto_66712 ) ) ( not ( = ?auto_66711 ?auto_66712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66711 ?auto_66712 )
      ( !STACK ?auto_66711 ?auto_66710 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_66738 - BLOCK
      ?auto_66739 - BLOCK
      ?auto_66740 - BLOCK
      ?auto_66741 - BLOCK
      ?auto_66742 - BLOCK
      ?auto_66743 - BLOCK
      ?auto_66744 - BLOCK
      ?auto_66745 - BLOCK
    )
    :vars
    (
      ?auto_66746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66745 ?auto_66746 ) ( ON-TABLE ?auto_66738 ) ( ON ?auto_66739 ?auto_66738 ) ( ON ?auto_66740 ?auto_66739 ) ( ON ?auto_66741 ?auto_66740 ) ( ON ?auto_66742 ?auto_66741 ) ( ON ?auto_66743 ?auto_66742 ) ( not ( = ?auto_66738 ?auto_66739 ) ) ( not ( = ?auto_66738 ?auto_66740 ) ) ( not ( = ?auto_66738 ?auto_66741 ) ) ( not ( = ?auto_66738 ?auto_66742 ) ) ( not ( = ?auto_66738 ?auto_66743 ) ) ( not ( = ?auto_66738 ?auto_66744 ) ) ( not ( = ?auto_66738 ?auto_66745 ) ) ( not ( = ?auto_66738 ?auto_66746 ) ) ( not ( = ?auto_66739 ?auto_66740 ) ) ( not ( = ?auto_66739 ?auto_66741 ) ) ( not ( = ?auto_66739 ?auto_66742 ) ) ( not ( = ?auto_66739 ?auto_66743 ) ) ( not ( = ?auto_66739 ?auto_66744 ) ) ( not ( = ?auto_66739 ?auto_66745 ) ) ( not ( = ?auto_66739 ?auto_66746 ) ) ( not ( = ?auto_66740 ?auto_66741 ) ) ( not ( = ?auto_66740 ?auto_66742 ) ) ( not ( = ?auto_66740 ?auto_66743 ) ) ( not ( = ?auto_66740 ?auto_66744 ) ) ( not ( = ?auto_66740 ?auto_66745 ) ) ( not ( = ?auto_66740 ?auto_66746 ) ) ( not ( = ?auto_66741 ?auto_66742 ) ) ( not ( = ?auto_66741 ?auto_66743 ) ) ( not ( = ?auto_66741 ?auto_66744 ) ) ( not ( = ?auto_66741 ?auto_66745 ) ) ( not ( = ?auto_66741 ?auto_66746 ) ) ( not ( = ?auto_66742 ?auto_66743 ) ) ( not ( = ?auto_66742 ?auto_66744 ) ) ( not ( = ?auto_66742 ?auto_66745 ) ) ( not ( = ?auto_66742 ?auto_66746 ) ) ( not ( = ?auto_66743 ?auto_66744 ) ) ( not ( = ?auto_66743 ?auto_66745 ) ) ( not ( = ?auto_66743 ?auto_66746 ) ) ( not ( = ?auto_66744 ?auto_66745 ) ) ( not ( = ?auto_66744 ?auto_66746 ) ) ( not ( = ?auto_66745 ?auto_66746 ) ) ( CLEAR ?auto_66743 ) ( ON ?auto_66744 ?auto_66745 ) ( CLEAR ?auto_66744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_66738 ?auto_66739 ?auto_66740 ?auto_66741 ?auto_66742 ?auto_66743 ?auto_66744 )
      ( MAKE-8PILE ?auto_66738 ?auto_66739 ?auto_66740 ?auto_66741 ?auto_66742 ?auto_66743 ?auto_66744 ?auto_66745 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_66772 - BLOCK
      ?auto_66773 - BLOCK
      ?auto_66774 - BLOCK
      ?auto_66775 - BLOCK
      ?auto_66776 - BLOCK
      ?auto_66777 - BLOCK
      ?auto_66778 - BLOCK
      ?auto_66779 - BLOCK
    )
    :vars
    (
      ?auto_66780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66779 ?auto_66780 ) ( ON-TABLE ?auto_66772 ) ( ON ?auto_66773 ?auto_66772 ) ( ON ?auto_66774 ?auto_66773 ) ( ON ?auto_66775 ?auto_66774 ) ( ON ?auto_66776 ?auto_66775 ) ( not ( = ?auto_66772 ?auto_66773 ) ) ( not ( = ?auto_66772 ?auto_66774 ) ) ( not ( = ?auto_66772 ?auto_66775 ) ) ( not ( = ?auto_66772 ?auto_66776 ) ) ( not ( = ?auto_66772 ?auto_66777 ) ) ( not ( = ?auto_66772 ?auto_66778 ) ) ( not ( = ?auto_66772 ?auto_66779 ) ) ( not ( = ?auto_66772 ?auto_66780 ) ) ( not ( = ?auto_66773 ?auto_66774 ) ) ( not ( = ?auto_66773 ?auto_66775 ) ) ( not ( = ?auto_66773 ?auto_66776 ) ) ( not ( = ?auto_66773 ?auto_66777 ) ) ( not ( = ?auto_66773 ?auto_66778 ) ) ( not ( = ?auto_66773 ?auto_66779 ) ) ( not ( = ?auto_66773 ?auto_66780 ) ) ( not ( = ?auto_66774 ?auto_66775 ) ) ( not ( = ?auto_66774 ?auto_66776 ) ) ( not ( = ?auto_66774 ?auto_66777 ) ) ( not ( = ?auto_66774 ?auto_66778 ) ) ( not ( = ?auto_66774 ?auto_66779 ) ) ( not ( = ?auto_66774 ?auto_66780 ) ) ( not ( = ?auto_66775 ?auto_66776 ) ) ( not ( = ?auto_66775 ?auto_66777 ) ) ( not ( = ?auto_66775 ?auto_66778 ) ) ( not ( = ?auto_66775 ?auto_66779 ) ) ( not ( = ?auto_66775 ?auto_66780 ) ) ( not ( = ?auto_66776 ?auto_66777 ) ) ( not ( = ?auto_66776 ?auto_66778 ) ) ( not ( = ?auto_66776 ?auto_66779 ) ) ( not ( = ?auto_66776 ?auto_66780 ) ) ( not ( = ?auto_66777 ?auto_66778 ) ) ( not ( = ?auto_66777 ?auto_66779 ) ) ( not ( = ?auto_66777 ?auto_66780 ) ) ( not ( = ?auto_66778 ?auto_66779 ) ) ( not ( = ?auto_66778 ?auto_66780 ) ) ( not ( = ?auto_66779 ?auto_66780 ) ) ( ON ?auto_66778 ?auto_66779 ) ( CLEAR ?auto_66776 ) ( ON ?auto_66777 ?auto_66778 ) ( CLEAR ?auto_66777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_66772 ?auto_66773 ?auto_66774 ?auto_66775 ?auto_66776 ?auto_66777 )
      ( MAKE-8PILE ?auto_66772 ?auto_66773 ?auto_66774 ?auto_66775 ?auto_66776 ?auto_66777 ?auto_66778 ?auto_66779 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_66806 - BLOCK
      ?auto_66807 - BLOCK
      ?auto_66808 - BLOCK
      ?auto_66809 - BLOCK
      ?auto_66810 - BLOCK
      ?auto_66811 - BLOCK
      ?auto_66812 - BLOCK
      ?auto_66813 - BLOCK
    )
    :vars
    (
      ?auto_66814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66813 ?auto_66814 ) ( ON-TABLE ?auto_66806 ) ( ON ?auto_66807 ?auto_66806 ) ( ON ?auto_66808 ?auto_66807 ) ( ON ?auto_66809 ?auto_66808 ) ( not ( = ?auto_66806 ?auto_66807 ) ) ( not ( = ?auto_66806 ?auto_66808 ) ) ( not ( = ?auto_66806 ?auto_66809 ) ) ( not ( = ?auto_66806 ?auto_66810 ) ) ( not ( = ?auto_66806 ?auto_66811 ) ) ( not ( = ?auto_66806 ?auto_66812 ) ) ( not ( = ?auto_66806 ?auto_66813 ) ) ( not ( = ?auto_66806 ?auto_66814 ) ) ( not ( = ?auto_66807 ?auto_66808 ) ) ( not ( = ?auto_66807 ?auto_66809 ) ) ( not ( = ?auto_66807 ?auto_66810 ) ) ( not ( = ?auto_66807 ?auto_66811 ) ) ( not ( = ?auto_66807 ?auto_66812 ) ) ( not ( = ?auto_66807 ?auto_66813 ) ) ( not ( = ?auto_66807 ?auto_66814 ) ) ( not ( = ?auto_66808 ?auto_66809 ) ) ( not ( = ?auto_66808 ?auto_66810 ) ) ( not ( = ?auto_66808 ?auto_66811 ) ) ( not ( = ?auto_66808 ?auto_66812 ) ) ( not ( = ?auto_66808 ?auto_66813 ) ) ( not ( = ?auto_66808 ?auto_66814 ) ) ( not ( = ?auto_66809 ?auto_66810 ) ) ( not ( = ?auto_66809 ?auto_66811 ) ) ( not ( = ?auto_66809 ?auto_66812 ) ) ( not ( = ?auto_66809 ?auto_66813 ) ) ( not ( = ?auto_66809 ?auto_66814 ) ) ( not ( = ?auto_66810 ?auto_66811 ) ) ( not ( = ?auto_66810 ?auto_66812 ) ) ( not ( = ?auto_66810 ?auto_66813 ) ) ( not ( = ?auto_66810 ?auto_66814 ) ) ( not ( = ?auto_66811 ?auto_66812 ) ) ( not ( = ?auto_66811 ?auto_66813 ) ) ( not ( = ?auto_66811 ?auto_66814 ) ) ( not ( = ?auto_66812 ?auto_66813 ) ) ( not ( = ?auto_66812 ?auto_66814 ) ) ( not ( = ?auto_66813 ?auto_66814 ) ) ( ON ?auto_66812 ?auto_66813 ) ( ON ?auto_66811 ?auto_66812 ) ( CLEAR ?auto_66809 ) ( ON ?auto_66810 ?auto_66811 ) ( CLEAR ?auto_66810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_66806 ?auto_66807 ?auto_66808 ?auto_66809 ?auto_66810 )
      ( MAKE-8PILE ?auto_66806 ?auto_66807 ?auto_66808 ?auto_66809 ?auto_66810 ?auto_66811 ?auto_66812 ?auto_66813 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_66840 - BLOCK
      ?auto_66841 - BLOCK
      ?auto_66842 - BLOCK
      ?auto_66843 - BLOCK
      ?auto_66844 - BLOCK
      ?auto_66845 - BLOCK
      ?auto_66846 - BLOCK
      ?auto_66847 - BLOCK
    )
    :vars
    (
      ?auto_66848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66847 ?auto_66848 ) ( ON-TABLE ?auto_66840 ) ( ON ?auto_66841 ?auto_66840 ) ( ON ?auto_66842 ?auto_66841 ) ( not ( = ?auto_66840 ?auto_66841 ) ) ( not ( = ?auto_66840 ?auto_66842 ) ) ( not ( = ?auto_66840 ?auto_66843 ) ) ( not ( = ?auto_66840 ?auto_66844 ) ) ( not ( = ?auto_66840 ?auto_66845 ) ) ( not ( = ?auto_66840 ?auto_66846 ) ) ( not ( = ?auto_66840 ?auto_66847 ) ) ( not ( = ?auto_66840 ?auto_66848 ) ) ( not ( = ?auto_66841 ?auto_66842 ) ) ( not ( = ?auto_66841 ?auto_66843 ) ) ( not ( = ?auto_66841 ?auto_66844 ) ) ( not ( = ?auto_66841 ?auto_66845 ) ) ( not ( = ?auto_66841 ?auto_66846 ) ) ( not ( = ?auto_66841 ?auto_66847 ) ) ( not ( = ?auto_66841 ?auto_66848 ) ) ( not ( = ?auto_66842 ?auto_66843 ) ) ( not ( = ?auto_66842 ?auto_66844 ) ) ( not ( = ?auto_66842 ?auto_66845 ) ) ( not ( = ?auto_66842 ?auto_66846 ) ) ( not ( = ?auto_66842 ?auto_66847 ) ) ( not ( = ?auto_66842 ?auto_66848 ) ) ( not ( = ?auto_66843 ?auto_66844 ) ) ( not ( = ?auto_66843 ?auto_66845 ) ) ( not ( = ?auto_66843 ?auto_66846 ) ) ( not ( = ?auto_66843 ?auto_66847 ) ) ( not ( = ?auto_66843 ?auto_66848 ) ) ( not ( = ?auto_66844 ?auto_66845 ) ) ( not ( = ?auto_66844 ?auto_66846 ) ) ( not ( = ?auto_66844 ?auto_66847 ) ) ( not ( = ?auto_66844 ?auto_66848 ) ) ( not ( = ?auto_66845 ?auto_66846 ) ) ( not ( = ?auto_66845 ?auto_66847 ) ) ( not ( = ?auto_66845 ?auto_66848 ) ) ( not ( = ?auto_66846 ?auto_66847 ) ) ( not ( = ?auto_66846 ?auto_66848 ) ) ( not ( = ?auto_66847 ?auto_66848 ) ) ( ON ?auto_66846 ?auto_66847 ) ( ON ?auto_66845 ?auto_66846 ) ( ON ?auto_66844 ?auto_66845 ) ( CLEAR ?auto_66842 ) ( ON ?auto_66843 ?auto_66844 ) ( CLEAR ?auto_66843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_66840 ?auto_66841 ?auto_66842 ?auto_66843 )
      ( MAKE-8PILE ?auto_66840 ?auto_66841 ?auto_66842 ?auto_66843 ?auto_66844 ?auto_66845 ?auto_66846 ?auto_66847 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_66874 - BLOCK
      ?auto_66875 - BLOCK
      ?auto_66876 - BLOCK
      ?auto_66877 - BLOCK
      ?auto_66878 - BLOCK
      ?auto_66879 - BLOCK
      ?auto_66880 - BLOCK
      ?auto_66881 - BLOCK
    )
    :vars
    (
      ?auto_66882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66881 ?auto_66882 ) ( ON-TABLE ?auto_66874 ) ( ON ?auto_66875 ?auto_66874 ) ( not ( = ?auto_66874 ?auto_66875 ) ) ( not ( = ?auto_66874 ?auto_66876 ) ) ( not ( = ?auto_66874 ?auto_66877 ) ) ( not ( = ?auto_66874 ?auto_66878 ) ) ( not ( = ?auto_66874 ?auto_66879 ) ) ( not ( = ?auto_66874 ?auto_66880 ) ) ( not ( = ?auto_66874 ?auto_66881 ) ) ( not ( = ?auto_66874 ?auto_66882 ) ) ( not ( = ?auto_66875 ?auto_66876 ) ) ( not ( = ?auto_66875 ?auto_66877 ) ) ( not ( = ?auto_66875 ?auto_66878 ) ) ( not ( = ?auto_66875 ?auto_66879 ) ) ( not ( = ?auto_66875 ?auto_66880 ) ) ( not ( = ?auto_66875 ?auto_66881 ) ) ( not ( = ?auto_66875 ?auto_66882 ) ) ( not ( = ?auto_66876 ?auto_66877 ) ) ( not ( = ?auto_66876 ?auto_66878 ) ) ( not ( = ?auto_66876 ?auto_66879 ) ) ( not ( = ?auto_66876 ?auto_66880 ) ) ( not ( = ?auto_66876 ?auto_66881 ) ) ( not ( = ?auto_66876 ?auto_66882 ) ) ( not ( = ?auto_66877 ?auto_66878 ) ) ( not ( = ?auto_66877 ?auto_66879 ) ) ( not ( = ?auto_66877 ?auto_66880 ) ) ( not ( = ?auto_66877 ?auto_66881 ) ) ( not ( = ?auto_66877 ?auto_66882 ) ) ( not ( = ?auto_66878 ?auto_66879 ) ) ( not ( = ?auto_66878 ?auto_66880 ) ) ( not ( = ?auto_66878 ?auto_66881 ) ) ( not ( = ?auto_66878 ?auto_66882 ) ) ( not ( = ?auto_66879 ?auto_66880 ) ) ( not ( = ?auto_66879 ?auto_66881 ) ) ( not ( = ?auto_66879 ?auto_66882 ) ) ( not ( = ?auto_66880 ?auto_66881 ) ) ( not ( = ?auto_66880 ?auto_66882 ) ) ( not ( = ?auto_66881 ?auto_66882 ) ) ( ON ?auto_66880 ?auto_66881 ) ( ON ?auto_66879 ?auto_66880 ) ( ON ?auto_66878 ?auto_66879 ) ( ON ?auto_66877 ?auto_66878 ) ( CLEAR ?auto_66875 ) ( ON ?auto_66876 ?auto_66877 ) ( CLEAR ?auto_66876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_66874 ?auto_66875 ?auto_66876 )
      ( MAKE-8PILE ?auto_66874 ?auto_66875 ?auto_66876 ?auto_66877 ?auto_66878 ?auto_66879 ?auto_66880 ?auto_66881 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_66908 - BLOCK
      ?auto_66909 - BLOCK
      ?auto_66910 - BLOCK
      ?auto_66911 - BLOCK
      ?auto_66912 - BLOCK
      ?auto_66913 - BLOCK
      ?auto_66914 - BLOCK
      ?auto_66915 - BLOCK
    )
    :vars
    (
      ?auto_66916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66915 ?auto_66916 ) ( ON-TABLE ?auto_66908 ) ( not ( = ?auto_66908 ?auto_66909 ) ) ( not ( = ?auto_66908 ?auto_66910 ) ) ( not ( = ?auto_66908 ?auto_66911 ) ) ( not ( = ?auto_66908 ?auto_66912 ) ) ( not ( = ?auto_66908 ?auto_66913 ) ) ( not ( = ?auto_66908 ?auto_66914 ) ) ( not ( = ?auto_66908 ?auto_66915 ) ) ( not ( = ?auto_66908 ?auto_66916 ) ) ( not ( = ?auto_66909 ?auto_66910 ) ) ( not ( = ?auto_66909 ?auto_66911 ) ) ( not ( = ?auto_66909 ?auto_66912 ) ) ( not ( = ?auto_66909 ?auto_66913 ) ) ( not ( = ?auto_66909 ?auto_66914 ) ) ( not ( = ?auto_66909 ?auto_66915 ) ) ( not ( = ?auto_66909 ?auto_66916 ) ) ( not ( = ?auto_66910 ?auto_66911 ) ) ( not ( = ?auto_66910 ?auto_66912 ) ) ( not ( = ?auto_66910 ?auto_66913 ) ) ( not ( = ?auto_66910 ?auto_66914 ) ) ( not ( = ?auto_66910 ?auto_66915 ) ) ( not ( = ?auto_66910 ?auto_66916 ) ) ( not ( = ?auto_66911 ?auto_66912 ) ) ( not ( = ?auto_66911 ?auto_66913 ) ) ( not ( = ?auto_66911 ?auto_66914 ) ) ( not ( = ?auto_66911 ?auto_66915 ) ) ( not ( = ?auto_66911 ?auto_66916 ) ) ( not ( = ?auto_66912 ?auto_66913 ) ) ( not ( = ?auto_66912 ?auto_66914 ) ) ( not ( = ?auto_66912 ?auto_66915 ) ) ( not ( = ?auto_66912 ?auto_66916 ) ) ( not ( = ?auto_66913 ?auto_66914 ) ) ( not ( = ?auto_66913 ?auto_66915 ) ) ( not ( = ?auto_66913 ?auto_66916 ) ) ( not ( = ?auto_66914 ?auto_66915 ) ) ( not ( = ?auto_66914 ?auto_66916 ) ) ( not ( = ?auto_66915 ?auto_66916 ) ) ( ON ?auto_66914 ?auto_66915 ) ( ON ?auto_66913 ?auto_66914 ) ( ON ?auto_66912 ?auto_66913 ) ( ON ?auto_66911 ?auto_66912 ) ( ON ?auto_66910 ?auto_66911 ) ( CLEAR ?auto_66908 ) ( ON ?auto_66909 ?auto_66910 ) ( CLEAR ?auto_66909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_66908 ?auto_66909 )
      ( MAKE-8PILE ?auto_66908 ?auto_66909 ?auto_66910 ?auto_66911 ?auto_66912 ?auto_66913 ?auto_66914 ?auto_66915 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_66942 - BLOCK
      ?auto_66943 - BLOCK
      ?auto_66944 - BLOCK
      ?auto_66945 - BLOCK
      ?auto_66946 - BLOCK
      ?auto_66947 - BLOCK
      ?auto_66948 - BLOCK
      ?auto_66949 - BLOCK
    )
    :vars
    (
      ?auto_66950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_66949 ?auto_66950 ) ( not ( = ?auto_66942 ?auto_66943 ) ) ( not ( = ?auto_66942 ?auto_66944 ) ) ( not ( = ?auto_66942 ?auto_66945 ) ) ( not ( = ?auto_66942 ?auto_66946 ) ) ( not ( = ?auto_66942 ?auto_66947 ) ) ( not ( = ?auto_66942 ?auto_66948 ) ) ( not ( = ?auto_66942 ?auto_66949 ) ) ( not ( = ?auto_66942 ?auto_66950 ) ) ( not ( = ?auto_66943 ?auto_66944 ) ) ( not ( = ?auto_66943 ?auto_66945 ) ) ( not ( = ?auto_66943 ?auto_66946 ) ) ( not ( = ?auto_66943 ?auto_66947 ) ) ( not ( = ?auto_66943 ?auto_66948 ) ) ( not ( = ?auto_66943 ?auto_66949 ) ) ( not ( = ?auto_66943 ?auto_66950 ) ) ( not ( = ?auto_66944 ?auto_66945 ) ) ( not ( = ?auto_66944 ?auto_66946 ) ) ( not ( = ?auto_66944 ?auto_66947 ) ) ( not ( = ?auto_66944 ?auto_66948 ) ) ( not ( = ?auto_66944 ?auto_66949 ) ) ( not ( = ?auto_66944 ?auto_66950 ) ) ( not ( = ?auto_66945 ?auto_66946 ) ) ( not ( = ?auto_66945 ?auto_66947 ) ) ( not ( = ?auto_66945 ?auto_66948 ) ) ( not ( = ?auto_66945 ?auto_66949 ) ) ( not ( = ?auto_66945 ?auto_66950 ) ) ( not ( = ?auto_66946 ?auto_66947 ) ) ( not ( = ?auto_66946 ?auto_66948 ) ) ( not ( = ?auto_66946 ?auto_66949 ) ) ( not ( = ?auto_66946 ?auto_66950 ) ) ( not ( = ?auto_66947 ?auto_66948 ) ) ( not ( = ?auto_66947 ?auto_66949 ) ) ( not ( = ?auto_66947 ?auto_66950 ) ) ( not ( = ?auto_66948 ?auto_66949 ) ) ( not ( = ?auto_66948 ?auto_66950 ) ) ( not ( = ?auto_66949 ?auto_66950 ) ) ( ON ?auto_66948 ?auto_66949 ) ( ON ?auto_66947 ?auto_66948 ) ( ON ?auto_66946 ?auto_66947 ) ( ON ?auto_66945 ?auto_66946 ) ( ON ?auto_66944 ?auto_66945 ) ( ON ?auto_66943 ?auto_66944 ) ( ON ?auto_66942 ?auto_66943 ) ( CLEAR ?auto_66942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66942 )
      ( MAKE-8PILE ?auto_66942 ?auto_66943 ?auto_66944 ?auto_66945 ?auto_66946 ?auto_66947 ?auto_66948 ?auto_66949 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_66977 - BLOCK
      ?auto_66978 - BLOCK
      ?auto_66979 - BLOCK
      ?auto_66980 - BLOCK
      ?auto_66981 - BLOCK
      ?auto_66982 - BLOCK
      ?auto_66983 - BLOCK
      ?auto_66984 - BLOCK
      ?auto_66985 - BLOCK
    )
    :vars
    (
      ?auto_66986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66984 ) ( ON ?auto_66985 ?auto_66986 ) ( CLEAR ?auto_66985 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66977 ) ( ON ?auto_66978 ?auto_66977 ) ( ON ?auto_66979 ?auto_66978 ) ( ON ?auto_66980 ?auto_66979 ) ( ON ?auto_66981 ?auto_66980 ) ( ON ?auto_66982 ?auto_66981 ) ( ON ?auto_66983 ?auto_66982 ) ( ON ?auto_66984 ?auto_66983 ) ( not ( = ?auto_66977 ?auto_66978 ) ) ( not ( = ?auto_66977 ?auto_66979 ) ) ( not ( = ?auto_66977 ?auto_66980 ) ) ( not ( = ?auto_66977 ?auto_66981 ) ) ( not ( = ?auto_66977 ?auto_66982 ) ) ( not ( = ?auto_66977 ?auto_66983 ) ) ( not ( = ?auto_66977 ?auto_66984 ) ) ( not ( = ?auto_66977 ?auto_66985 ) ) ( not ( = ?auto_66977 ?auto_66986 ) ) ( not ( = ?auto_66978 ?auto_66979 ) ) ( not ( = ?auto_66978 ?auto_66980 ) ) ( not ( = ?auto_66978 ?auto_66981 ) ) ( not ( = ?auto_66978 ?auto_66982 ) ) ( not ( = ?auto_66978 ?auto_66983 ) ) ( not ( = ?auto_66978 ?auto_66984 ) ) ( not ( = ?auto_66978 ?auto_66985 ) ) ( not ( = ?auto_66978 ?auto_66986 ) ) ( not ( = ?auto_66979 ?auto_66980 ) ) ( not ( = ?auto_66979 ?auto_66981 ) ) ( not ( = ?auto_66979 ?auto_66982 ) ) ( not ( = ?auto_66979 ?auto_66983 ) ) ( not ( = ?auto_66979 ?auto_66984 ) ) ( not ( = ?auto_66979 ?auto_66985 ) ) ( not ( = ?auto_66979 ?auto_66986 ) ) ( not ( = ?auto_66980 ?auto_66981 ) ) ( not ( = ?auto_66980 ?auto_66982 ) ) ( not ( = ?auto_66980 ?auto_66983 ) ) ( not ( = ?auto_66980 ?auto_66984 ) ) ( not ( = ?auto_66980 ?auto_66985 ) ) ( not ( = ?auto_66980 ?auto_66986 ) ) ( not ( = ?auto_66981 ?auto_66982 ) ) ( not ( = ?auto_66981 ?auto_66983 ) ) ( not ( = ?auto_66981 ?auto_66984 ) ) ( not ( = ?auto_66981 ?auto_66985 ) ) ( not ( = ?auto_66981 ?auto_66986 ) ) ( not ( = ?auto_66982 ?auto_66983 ) ) ( not ( = ?auto_66982 ?auto_66984 ) ) ( not ( = ?auto_66982 ?auto_66985 ) ) ( not ( = ?auto_66982 ?auto_66986 ) ) ( not ( = ?auto_66983 ?auto_66984 ) ) ( not ( = ?auto_66983 ?auto_66985 ) ) ( not ( = ?auto_66983 ?auto_66986 ) ) ( not ( = ?auto_66984 ?auto_66985 ) ) ( not ( = ?auto_66984 ?auto_66986 ) ) ( not ( = ?auto_66985 ?auto_66986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_66985 ?auto_66986 )
      ( !STACK ?auto_66985 ?auto_66984 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_66996 - BLOCK
      ?auto_66997 - BLOCK
      ?auto_66998 - BLOCK
      ?auto_66999 - BLOCK
      ?auto_67000 - BLOCK
      ?auto_67001 - BLOCK
      ?auto_67002 - BLOCK
      ?auto_67003 - BLOCK
      ?auto_67004 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_67003 ) ( ON-TABLE ?auto_67004 ) ( CLEAR ?auto_67004 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66996 ) ( ON ?auto_66997 ?auto_66996 ) ( ON ?auto_66998 ?auto_66997 ) ( ON ?auto_66999 ?auto_66998 ) ( ON ?auto_67000 ?auto_66999 ) ( ON ?auto_67001 ?auto_67000 ) ( ON ?auto_67002 ?auto_67001 ) ( ON ?auto_67003 ?auto_67002 ) ( not ( = ?auto_66996 ?auto_66997 ) ) ( not ( = ?auto_66996 ?auto_66998 ) ) ( not ( = ?auto_66996 ?auto_66999 ) ) ( not ( = ?auto_66996 ?auto_67000 ) ) ( not ( = ?auto_66996 ?auto_67001 ) ) ( not ( = ?auto_66996 ?auto_67002 ) ) ( not ( = ?auto_66996 ?auto_67003 ) ) ( not ( = ?auto_66996 ?auto_67004 ) ) ( not ( = ?auto_66997 ?auto_66998 ) ) ( not ( = ?auto_66997 ?auto_66999 ) ) ( not ( = ?auto_66997 ?auto_67000 ) ) ( not ( = ?auto_66997 ?auto_67001 ) ) ( not ( = ?auto_66997 ?auto_67002 ) ) ( not ( = ?auto_66997 ?auto_67003 ) ) ( not ( = ?auto_66997 ?auto_67004 ) ) ( not ( = ?auto_66998 ?auto_66999 ) ) ( not ( = ?auto_66998 ?auto_67000 ) ) ( not ( = ?auto_66998 ?auto_67001 ) ) ( not ( = ?auto_66998 ?auto_67002 ) ) ( not ( = ?auto_66998 ?auto_67003 ) ) ( not ( = ?auto_66998 ?auto_67004 ) ) ( not ( = ?auto_66999 ?auto_67000 ) ) ( not ( = ?auto_66999 ?auto_67001 ) ) ( not ( = ?auto_66999 ?auto_67002 ) ) ( not ( = ?auto_66999 ?auto_67003 ) ) ( not ( = ?auto_66999 ?auto_67004 ) ) ( not ( = ?auto_67000 ?auto_67001 ) ) ( not ( = ?auto_67000 ?auto_67002 ) ) ( not ( = ?auto_67000 ?auto_67003 ) ) ( not ( = ?auto_67000 ?auto_67004 ) ) ( not ( = ?auto_67001 ?auto_67002 ) ) ( not ( = ?auto_67001 ?auto_67003 ) ) ( not ( = ?auto_67001 ?auto_67004 ) ) ( not ( = ?auto_67002 ?auto_67003 ) ) ( not ( = ?auto_67002 ?auto_67004 ) ) ( not ( = ?auto_67003 ?auto_67004 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_67004 )
      ( !STACK ?auto_67004 ?auto_67003 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67014 - BLOCK
      ?auto_67015 - BLOCK
      ?auto_67016 - BLOCK
      ?auto_67017 - BLOCK
      ?auto_67018 - BLOCK
      ?auto_67019 - BLOCK
      ?auto_67020 - BLOCK
      ?auto_67021 - BLOCK
      ?auto_67022 - BLOCK
    )
    :vars
    (
      ?auto_67023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67022 ?auto_67023 ) ( ON-TABLE ?auto_67014 ) ( ON ?auto_67015 ?auto_67014 ) ( ON ?auto_67016 ?auto_67015 ) ( ON ?auto_67017 ?auto_67016 ) ( ON ?auto_67018 ?auto_67017 ) ( ON ?auto_67019 ?auto_67018 ) ( ON ?auto_67020 ?auto_67019 ) ( not ( = ?auto_67014 ?auto_67015 ) ) ( not ( = ?auto_67014 ?auto_67016 ) ) ( not ( = ?auto_67014 ?auto_67017 ) ) ( not ( = ?auto_67014 ?auto_67018 ) ) ( not ( = ?auto_67014 ?auto_67019 ) ) ( not ( = ?auto_67014 ?auto_67020 ) ) ( not ( = ?auto_67014 ?auto_67021 ) ) ( not ( = ?auto_67014 ?auto_67022 ) ) ( not ( = ?auto_67014 ?auto_67023 ) ) ( not ( = ?auto_67015 ?auto_67016 ) ) ( not ( = ?auto_67015 ?auto_67017 ) ) ( not ( = ?auto_67015 ?auto_67018 ) ) ( not ( = ?auto_67015 ?auto_67019 ) ) ( not ( = ?auto_67015 ?auto_67020 ) ) ( not ( = ?auto_67015 ?auto_67021 ) ) ( not ( = ?auto_67015 ?auto_67022 ) ) ( not ( = ?auto_67015 ?auto_67023 ) ) ( not ( = ?auto_67016 ?auto_67017 ) ) ( not ( = ?auto_67016 ?auto_67018 ) ) ( not ( = ?auto_67016 ?auto_67019 ) ) ( not ( = ?auto_67016 ?auto_67020 ) ) ( not ( = ?auto_67016 ?auto_67021 ) ) ( not ( = ?auto_67016 ?auto_67022 ) ) ( not ( = ?auto_67016 ?auto_67023 ) ) ( not ( = ?auto_67017 ?auto_67018 ) ) ( not ( = ?auto_67017 ?auto_67019 ) ) ( not ( = ?auto_67017 ?auto_67020 ) ) ( not ( = ?auto_67017 ?auto_67021 ) ) ( not ( = ?auto_67017 ?auto_67022 ) ) ( not ( = ?auto_67017 ?auto_67023 ) ) ( not ( = ?auto_67018 ?auto_67019 ) ) ( not ( = ?auto_67018 ?auto_67020 ) ) ( not ( = ?auto_67018 ?auto_67021 ) ) ( not ( = ?auto_67018 ?auto_67022 ) ) ( not ( = ?auto_67018 ?auto_67023 ) ) ( not ( = ?auto_67019 ?auto_67020 ) ) ( not ( = ?auto_67019 ?auto_67021 ) ) ( not ( = ?auto_67019 ?auto_67022 ) ) ( not ( = ?auto_67019 ?auto_67023 ) ) ( not ( = ?auto_67020 ?auto_67021 ) ) ( not ( = ?auto_67020 ?auto_67022 ) ) ( not ( = ?auto_67020 ?auto_67023 ) ) ( not ( = ?auto_67021 ?auto_67022 ) ) ( not ( = ?auto_67021 ?auto_67023 ) ) ( not ( = ?auto_67022 ?auto_67023 ) ) ( CLEAR ?auto_67020 ) ( ON ?auto_67021 ?auto_67022 ) ( CLEAR ?auto_67021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_67014 ?auto_67015 ?auto_67016 ?auto_67017 ?auto_67018 ?auto_67019 ?auto_67020 ?auto_67021 )
      ( MAKE-9PILE ?auto_67014 ?auto_67015 ?auto_67016 ?auto_67017 ?auto_67018 ?auto_67019 ?auto_67020 ?auto_67021 ?auto_67022 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67033 - BLOCK
      ?auto_67034 - BLOCK
      ?auto_67035 - BLOCK
      ?auto_67036 - BLOCK
      ?auto_67037 - BLOCK
      ?auto_67038 - BLOCK
      ?auto_67039 - BLOCK
      ?auto_67040 - BLOCK
      ?auto_67041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67041 ) ( ON-TABLE ?auto_67033 ) ( ON ?auto_67034 ?auto_67033 ) ( ON ?auto_67035 ?auto_67034 ) ( ON ?auto_67036 ?auto_67035 ) ( ON ?auto_67037 ?auto_67036 ) ( ON ?auto_67038 ?auto_67037 ) ( ON ?auto_67039 ?auto_67038 ) ( not ( = ?auto_67033 ?auto_67034 ) ) ( not ( = ?auto_67033 ?auto_67035 ) ) ( not ( = ?auto_67033 ?auto_67036 ) ) ( not ( = ?auto_67033 ?auto_67037 ) ) ( not ( = ?auto_67033 ?auto_67038 ) ) ( not ( = ?auto_67033 ?auto_67039 ) ) ( not ( = ?auto_67033 ?auto_67040 ) ) ( not ( = ?auto_67033 ?auto_67041 ) ) ( not ( = ?auto_67034 ?auto_67035 ) ) ( not ( = ?auto_67034 ?auto_67036 ) ) ( not ( = ?auto_67034 ?auto_67037 ) ) ( not ( = ?auto_67034 ?auto_67038 ) ) ( not ( = ?auto_67034 ?auto_67039 ) ) ( not ( = ?auto_67034 ?auto_67040 ) ) ( not ( = ?auto_67034 ?auto_67041 ) ) ( not ( = ?auto_67035 ?auto_67036 ) ) ( not ( = ?auto_67035 ?auto_67037 ) ) ( not ( = ?auto_67035 ?auto_67038 ) ) ( not ( = ?auto_67035 ?auto_67039 ) ) ( not ( = ?auto_67035 ?auto_67040 ) ) ( not ( = ?auto_67035 ?auto_67041 ) ) ( not ( = ?auto_67036 ?auto_67037 ) ) ( not ( = ?auto_67036 ?auto_67038 ) ) ( not ( = ?auto_67036 ?auto_67039 ) ) ( not ( = ?auto_67036 ?auto_67040 ) ) ( not ( = ?auto_67036 ?auto_67041 ) ) ( not ( = ?auto_67037 ?auto_67038 ) ) ( not ( = ?auto_67037 ?auto_67039 ) ) ( not ( = ?auto_67037 ?auto_67040 ) ) ( not ( = ?auto_67037 ?auto_67041 ) ) ( not ( = ?auto_67038 ?auto_67039 ) ) ( not ( = ?auto_67038 ?auto_67040 ) ) ( not ( = ?auto_67038 ?auto_67041 ) ) ( not ( = ?auto_67039 ?auto_67040 ) ) ( not ( = ?auto_67039 ?auto_67041 ) ) ( not ( = ?auto_67040 ?auto_67041 ) ) ( CLEAR ?auto_67039 ) ( ON ?auto_67040 ?auto_67041 ) ( CLEAR ?auto_67040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_67033 ?auto_67034 ?auto_67035 ?auto_67036 ?auto_67037 ?auto_67038 ?auto_67039 ?auto_67040 )
      ( MAKE-9PILE ?auto_67033 ?auto_67034 ?auto_67035 ?auto_67036 ?auto_67037 ?auto_67038 ?auto_67039 ?auto_67040 ?auto_67041 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67051 - BLOCK
      ?auto_67052 - BLOCK
      ?auto_67053 - BLOCK
      ?auto_67054 - BLOCK
      ?auto_67055 - BLOCK
      ?auto_67056 - BLOCK
      ?auto_67057 - BLOCK
      ?auto_67058 - BLOCK
      ?auto_67059 - BLOCK
    )
    :vars
    (
      ?auto_67060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67059 ?auto_67060 ) ( ON-TABLE ?auto_67051 ) ( ON ?auto_67052 ?auto_67051 ) ( ON ?auto_67053 ?auto_67052 ) ( ON ?auto_67054 ?auto_67053 ) ( ON ?auto_67055 ?auto_67054 ) ( ON ?auto_67056 ?auto_67055 ) ( not ( = ?auto_67051 ?auto_67052 ) ) ( not ( = ?auto_67051 ?auto_67053 ) ) ( not ( = ?auto_67051 ?auto_67054 ) ) ( not ( = ?auto_67051 ?auto_67055 ) ) ( not ( = ?auto_67051 ?auto_67056 ) ) ( not ( = ?auto_67051 ?auto_67057 ) ) ( not ( = ?auto_67051 ?auto_67058 ) ) ( not ( = ?auto_67051 ?auto_67059 ) ) ( not ( = ?auto_67051 ?auto_67060 ) ) ( not ( = ?auto_67052 ?auto_67053 ) ) ( not ( = ?auto_67052 ?auto_67054 ) ) ( not ( = ?auto_67052 ?auto_67055 ) ) ( not ( = ?auto_67052 ?auto_67056 ) ) ( not ( = ?auto_67052 ?auto_67057 ) ) ( not ( = ?auto_67052 ?auto_67058 ) ) ( not ( = ?auto_67052 ?auto_67059 ) ) ( not ( = ?auto_67052 ?auto_67060 ) ) ( not ( = ?auto_67053 ?auto_67054 ) ) ( not ( = ?auto_67053 ?auto_67055 ) ) ( not ( = ?auto_67053 ?auto_67056 ) ) ( not ( = ?auto_67053 ?auto_67057 ) ) ( not ( = ?auto_67053 ?auto_67058 ) ) ( not ( = ?auto_67053 ?auto_67059 ) ) ( not ( = ?auto_67053 ?auto_67060 ) ) ( not ( = ?auto_67054 ?auto_67055 ) ) ( not ( = ?auto_67054 ?auto_67056 ) ) ( not ( = ?auto_67054 ?auto_67057 ) ) ( not ( = ?auto_67054 ?auto_67058 ) ) ( not ( = ?auto_67054 ?auto_67059 ) ) ( not ( = ?auto_67054 ?auto_67060 ) ) ( not ( = ?auto_67055 ?auto_67056 ) ) ( not ( = ?auto_67055 ?auto_67057 ) ) ( not ( = ?auto_67055 ?auto_67058 ) ) ( not ( = ?auto_67055 ?auto_67059 ) ) ( not ( = ?auto_67055 ?auto_67060 ) ) ( not ( = ?auto_67056 ?auto_67057 ) ) ( not ( = ?auto_67056 ?auto_67058 ) ) ( not ( = ?auto_67056 ?auto_67059 ) ) ( not ( = ?auto_67056 ?auto_67060 ) ) ( not ( = ?auto_67057 ?auto_67058 ) ) ( not ( = ?auto_67057 ?auto_67059 ) ) ( not ( = ?auto_67057 ?auto_67060 ) ) ( not ( = ?auto_67058 ?auto_67059 ) ) ( not ( = ?auto_67058 ?auto_67060 ) ) ( not ( = ?auto_67059 ?auto_67060 ) ) ( ON ?auto_67058 ?auto_67059 ) ( CLEAR ?auto_67056 ) ( ON ?auto_67057 ?auto_67058 ) ( CLEAR ?auto_67057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_67051 ?auto_67052 ?auto_67053 ?auto_67054 ?auto_67055 ?auto_67056 ?auto_67057 )
      ( MAKE-9PILE ?auto_67051 ?auto_67052 ?auto_67053 ?auto_67054 ?auto_67055 ?auto_67056 ?auto_67057 ?auto_67058 ?auto_67059 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67070 - BLOCK
      ?auto_67071 - BLOCK
      ?auto_67072 - BLOCK
      ?auto_67073 - BLOCK
      ?auto_67074 - BLOCK
      ?auto_67075 - BLOCK
      ?auto_67076 - BLOCK
      ?auto_67077 - BLOCK
      ?auto_67078 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67078 ) ( ON-TABLE ?auto_67070 ) ( ON ?auto_67071 ?auto_67070 ) ( ON ?auto_67072 ?auto_67071 ) ( ON ?auto_67073 ?auto_67072 ) ( ON ?auto_67074 ?auto_67073 ) ( ON ?auto_67075 ?auto_67074 ) ( not ( = ?auto_67070 ?auto_67071 ) ) ( not ( = ?auto_67070 ?auto_67072 ) ) ( not ( = ?auto_67070 ?auto_67073 ) ) ( not ( = ?auto_67070 ?auto_67074 ) ) ( not ( = ?auto_67070 ?auto_67075 ) ) ( not ( = ?auto_67070 ?auto_67076 ) ) ( not ( = ?auto_67070 ?auto_67077 ) ) ( not ( = ?auto_67070 ?auto_67078 ) ) ( not ( = ?auto_67071 ?auto_67072 ) ) ( not ( = ?auto_67071 ?auto_67073 ) ) ( not ( = ?auto_67071 ?auto_67074 ) ) ( not ( = ?auto_67071 ?auto_67075 ) ) ( not ( = ?auto_67071 ?auto_67076 ) ) ( not ( = ?auto_67071 ?auto_67077 ) ) ( not ( = ?auto_67071 ?auto_67078 ) ) ( not ( = ?auto_67072 ?auto_67073 ) ) ( not ( = ?auto_67072 ?auto_67074 ) ) ( not ( = ?auto_67072 ?auto_67075 ) ) ( not ( = ?auto_67072 ?auto_67076 ) ) ( not ( = ?auto_67072 ?auto_67077 ) ) ( not ( = ?auto_67072 ?auto_67078 ) ) ( not ( = ?auto_67073 ?auto_67074 ) ) ( not ( = ?auto_67073 ?auto_67075 ) ) ( not ( = ?auto_67073 ?auto_67076 ) ) ( not ( = ?auto_67073 ?auto_67077 ) ) ( not ( = ?auto_67073 ?auto_67078 ) ) ( not ( = ?auto_67074 ?auto_67075 ) ) ( not ( = ?auto_67074 ?auto_67076 ) ) ( not ( = ?auto_67074 ?auto_67077 ) ) ( not ( = ?auto_67074 ?auto_67078 ) ) ( not ( = ?auto_67075 ?auto_67076 ) ) ( not ( = ?auto_67075 ?auto_67077 ) ) ( not ( = ?auto_67075 ?auto_67078 ) ) ( not ( = ?auto_67076 ?auto_67077 ) ) ( not ( = ?auto_67076 ?auto_67078 ) ) ( not ( = ?auto_67077 ?auto_67078 ) ) ( ON ?auto_67077 ?auto_67078 ) ( CLEAR ?auto_67075 ) ( ON ?auto_67076 ?auto_67077 ) ( CLEAR ?auto_67076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_67070 ?auto_67071 ?auto_67072 ?auto_67073 ?auto_67074 ?auto_67075 ?auto_67076 )
      ( MAKE-9PILE ?auto_67070 ?auto_67071 ?auto_67072 ?auto_67073 ?auto_67074 ?auto_67075 ?auto_67076 ?auto_67077 ?auto_67078 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67088 - BLOCK
      ?auto_67089 - BLOCK
      ?auto_67090 - BLOCK
      ?auto_67091 - BLOCK
      ?auto_67092 - BLOCK
      ?auto_67093 - BLOCK
      ?auto_67094 - BLOCK
      ?auto_67095 - BLOCK
      ?auto_67096 - BLOCK
    )
    :vars
    (
      ?auto_67097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67096 ?auto_67097 ) ( ON-TABLE ?auto_67088 ) ( ON ?auto_67089 ?auto_67088 ) ( ON ?auto_67090 ?auto_67089 ) ( ON ?auto_67091 ?auto_67090 ) ( ON ?auto_67092 ?auto_67091 ) ( not ( = ?auto_67088 ?auto_67089 ) ) ( not ( = ?auto_67088 ?auto_67090 ) ) ( not ( = ?auto_67088 ?auto_67091 ) ) ( not ( = ?auto_67088 ?auto_67092 ) ) ( not ( = ?auto_67088 ?auto_67093 ) ) ( not ( = ?auto_67088 ?auto_67094 ) ) ( not ( = ?auto_67088 ?auto_67095 ) ) ( not ( = ?auto_67088 ?auto_67096 ) ) ( not ( = ?auto_67088 ?auto_67097 ) ) ( not ( = ?auto_67089 ?auto_67090 ) ) ( not ( = ?auto_67089 ?auto_67091 ) ) ( not ( = ?auto_67089 ?auto_67092 ) ) ( not ( = ?auto_67089 ?auto_67093 ) ) ( not ( = ?auto_67089 ?auto_67094 ) ) ( not ( = ?auto_67089 ?auto_67095 ) ) ( not ( = ?auto_67089 ?auto_67096 ) ) ( not ( = ?auto_67089 ?auto_67097 ) ) ( not ( = ?auto_67090 ?auto_67091 ) ) ( not ( = ?auto_67090 ?auto_67092 ) ) ( not ( = ?auto_67090 ?auto_67093 ) ) ( not ( = ?auto_67090 ?auto_67094 ) ) ( not ( = ?auto_67090 ?auto_67095 ) ) ( not ( = ?auto_67090 ?auto_67096 ) ) ( not ( = ?auto_67090 ?auto_67097 ) ) ( not ( = ?auto_67091 ?auto_67092 ) ) ( not ( = ?auto_67091 ?auto_67093 ) ) ( not ( = ?auto_67091 ?auto_67094 ) ) ( not ( = ?auto_67091 ?auto_67095 ) ) ( not ( = ?auto_67091 ?auto_67096 ) ) ( not ( = ?auto_67091 ?auto_67097 ) ) ( not ( = ?auto_67092 ?auto_67093 ) ) ( not ( = ?auto_67092 ?auto_67094 ) ) ( not ( = ?auto_67092 ?auto_67095 ) ) ( not ( = ?auto_67092 ?auto_67096 ) ) ( not ( = ?auto_67092 ?auto_67097 ) ) ( not ( = ?auto_67093 ?auto_67094 ) ) ( not ( = ?auto_67093 ?auto_67095 ) ) ( not ( = ?auto_67093 ?auto_67096 ) ) ( not ( = ?auto_67093 ?auto_67097 ) ) ( not ( = ?auto_67094 ?auto_67095 ) ) ( not ( = ?auto_67094 ?auto_67096 ) ) ( not ( = ?auto_67094 ?auto_67097 ) ) ( not ( = ?auto_67095 ?auto_67096 ) ) ( not ( = ?auto_67095 ?auto_67097 ) ) ( not ( = ?auto_67096 ?auto_67097 ) ) ( ON ?auto_67095 ?auto_67096 ) ( ON ?auto_67094 ?auto_67095 ) ( CLEAR ?auto_67092 ) ( ON ?auto_67093 ?auto_67094 ) ( CLEAR ?auto_67093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67088 ?auto_67089 ?auto_67090 ?auto_67091 ?auto_67092 ?auto_67093 )
      ( MAKE-9PILE ?auto_67088 ?auto_67089 ?auto_67090 ?auto_67091 ?auto_67092 ?auto_67093 ?auto_67094 ?auto_67095 ?auto_67096 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67107 - BLOCK
      ?auto_67108 - BLOCK
      ?auto_67109 - BLOCK
      ?auto_67110 - BLOCK
      ?auto_67111 - BLOCK
      ?auto_67112 - BLOCK
      ?auto_67113 - BLOCK
      ?auto_67114 - BLOCK
      ?auto_67115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67115 ) ( ON-TABLE ?auto_67107 ) ( ON ?auto_67108 ?auto_67107 ) ( ON ?auto_67109 ?auto_67108 ) ( ON ?auto_67110 ?auto_67109 ) ( ON ?auto_67111 ?auto_67110 ) ( not ( = ?auto_67107 ?auto_67108 ) ) ( not ( = ?auto_67107 ?auto_67109 ) ) ( not ( = ?auto_67107 ?auto_67110 ) ) ( not ( = ?auto_67107 ?auto_67111 ) ) ( not ( = ?auto_67107 ?auto_67112 ) ) ( not ( = ?auto_67107 ?auto_67113 ) ) ( not ( = ?auto_67107 ?auto_67114 ) ) ( not ( = ?auto_67107 ?auto_67115 ) ) ( not ( = ?auto_67108 ?auto_67109 ) ) ( not ( = ?auto_67108 ?auto_67110 ) ) ( not ( = ?auto_67108 ?auto_67111 ) ) ( not ( = ?auto_67108 ?auto_67112 ) ) ( not ( = ?auto_67108 ?auto_67113 ) ) ( not ( = ?auto_67108 ?auto_67114 ) ) ( not ( = ?auto_67108 ?auto_67115 ) ) ( not ( = ?auto_67109 ?auto_67110 ) ) ( not ( = ?auto_67109 ?auto_67111 ) ) ( not ( = ?auto_67109 ?auto_67112 ) ) ( not ( = ?auto_67109 ?auto_67113 ) ) ( not ( = ?auto_67109 ?auto_67114 ) ) ( not ( = ?auto_67109 ?auto_67115 ) ) ( not ( = ?auto_67110 ?auto_67111 ) ) ( not ( = ?auto_67110 ?auto_67112 ) ) ( not ( = ?auto_67110 ?auto_67113 ) ) ( not ( = ?auto_67110 ?auto_67114 ) ) ( not ( = ?auto_67110 ?auto_67115 ) ) ( not ( = ?auto_67111 ?auto_67112 ) ) ( not ( = ?auto_67111 ?auto_67113 ) ) ( not ( = ?auto_67111 ?auto_67114 ) ) ( not ( = ?auto_67111 ?auto_67115 ) ) ( not ( = ?auto_67112 ?auto_67113 ) ) ( not ( = ?auto_67112 ?auto_67114 ) ) ( not ( = ?auto_67112 ?auto_67115 ) ) ( not ( = ?auto_67113 ?auto_67114 ) ) ( not ( = ?auto_67113 ?auto_67115 ) ) ( not ( = ?auto_67114 ?auto_67115 ) ) ( ON ?auto_67114 ?auto_67115 ) ( ON ?auto_67113 ?auto_67114 ) ( CLEAR ?auto_67111 ) ( ON ?auto_67112 ?auto_67113 ) ( CLEAR ?auto_67112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_67107 ?auto_67108 ?auto_67109 ?auto_67110 ?auto_67111 ?auto_67112 )
      ( MAKE-9PILE ?auto_67107 ?auto_67108 ?auto_67109 ?auto_67110 ?auto_67111 ?auto_67112 ?auto_67113 ?auto_67114 ?auto_67115 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67125 - BLOCK
      ?auto_67126 - BLOCK
      ?auto_67127 - BLOCK
      ?auto_67128 - BLOCK
      ?auto_67129 - BLOCK
      ?auto_67130 - BLOCK
      ?auto_67131 - BLOCK
      ?auto_67132 - BLOCK
      ?auto_67133 - BLOCK
    )
    :vars
    (
      ?auto_67134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67133 ?auto_67134 ) ( ON-TABLE ?auto_67125 ) ( ON ?auto_67126 ?auto_67125 ) ( ON ?auto_67127 ?auto_67126 ) ( ON ?auto_67128 ?auto_67127 ) ( not ( = ?auto_67125 ?auto_67126 ) ) ( not ( = ?auto_67125 ?auto_67127 ) ) ( not ( = ?auto_67125 ?auto_67128 ) ) ( not ( = ?auto_67125 ?auto_67129 ) ) ( not ( = ?auto_67125 ?auto_67130 ) ) ( not ( = ?auto_67125 ?auto_67131 ) ) ( not ( = ?auto_67125 ?auto_67132 ) ) ( not ( = ?auto_67125 ?auto_67133 ) ) ( not ( = ?auto_67125 ?auto_67134 ) ) ( not ( = ?auto_67126 ?auto_67127 ) ) ( not ( = ?auto_67126 ?auto_67128 ) ) ( not ( = ?auto_67126 ?auto_67129 ) ) ( not ( = ?auto_67126 ?auto_67130 ) ) ( not ( = ?auto_67126 ?auto_67131 ) ) ( not ( = ?auto_67126 ?auto_67132 ) ) ( not ( = ?auto_67126 ?auto_67133 ) ) ( not ( = ?auto_67126 ?auto_67134 ) ) ( not ( = ?auto_67127 ?auto_67128 ) ) ( not ( = ?auto_67127 ?auto_67129 ) ) ( not ( = ?auto_67127 ?auto_67130 ) ) ( not ( = ?auto_67127 ?auto_67131 ) ) ( not ( = ?auto_67127 ?auto_67132 ) ) ( not ( = ?auto_67127 ?auto_67133 ) ) ( not ( = ?auto_67127 ?auto_67134 ) ) ( not ( = ?auto_67128 ?auto_67129 ) ) ( not ( = ?auto_67128 ?auto_67130 ) ) ( not ( = ?auto_67128 ?auto_67131 ) ) ( not ( = ?auto_67128 ?auto_67132 ) ) ( not ( = ?auto_67128 ?auto_67133 ) ) ( not ( = ?auto_67128 ?auto_67134 ) ) ( not ( = ?auto_67129 ?auto_67130 ) ) ( not ( = ?auto_67129 ?auto_67131 ) ) ( not ( = ?auto_67129 ?auto_67132 ) ) ( not ( = ?auto_67129 ?auto_67133 ) ) ( not ( = ?auto_67129 ?auto_67134 ) ) ( not ( = ?auto_67130 ?auto_67131 ) ) ( not ( = ?auto_67130 ?auto_67132 ) ) ( not ( = ?auto_67130 ?auto_67133 ) ) ( not ( = ?auto_67130 ?auto_67134 ) ) ( not ( = ?auto_67131 ?auto_67132 ) ) ( not ( = ?auto_67131 ?auto_67133 ) ) ( not ( = ?auto_67131 ?auto_67134 ) ) ( not ( = ?auto_67132 ?auto_67133 ) ) ( not ( = ?auto_67132 ?auto_67134 ) ) ( not ( = ?auto_67133 ?auto_67134 ) ) ( ON ?auto_67132 ?auto_67133 ) ( ON ?auto_67131 ?auto_67132 ) ( ON ?auto_67130 ?auto_67131 ) ( CLEAR ?auto_67128 ) ( ON ?auto_67129 ?auto_67130 ) ( CLEAR ?auto_67129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67125 ?auto_67126 ?auto_67127 ?auto_67128 ?auto_67129 )
      ( MAKE-9PILE ?auto_67125 ?auto_67126 ?auto_67127 ?auto_67128 ?auto_67129 ?auto_67130 ?auto_67131 ?auto_67132 ?auto_67133 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67144 - BLOCK
      ?auto_67145 - BLOCK
      ?auto_67146 - BLOCK
      ?auto_67147 - BLOCK
      ?auto_67148 - BLOCK
      ?auto_67149 - BLOCK
      ?auto_67150 - BLOCK
      ?auto_67151 - BLOCK
      ?auto_67152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67152 ) ( ON-TABLE ?auto_67144 ) ( ON ?auto_67145 ?auto_67144 ) ( ON ?auto_67146 ?auto_67145 ) ( ON ?auto_67147 ?auto_67146 ) ( not ( = ?auto_67144 ?auto_67145 ) ) ( not ( = ?auto_67144 ?auto_67146 ) ) ( not ( = ?auto_67144 ?auto_67147 ) ) ( not ( = ?auto_67144 ?auto_67148 ) ) ( not ( = ?auto_67144 ?auto_67149 ) ) ( not ( = ?auto_67144 ?auto_67150 ) ) ( not ( = ?auto_67144 ?auto_67151 ) ) ( not ( = ?auto_67144 ?auto_67152 ) ) ( not ( = ?auto_67145 ?auto_67146 ) ) ( not ( = ?auto_67145 ?auto_67147 ) ) ( not ( = ?auto_67145 ?auto_67148 ) ) ( not ( = ?auto_67145 ?auto_67149 ) ) ( not ( = ?auto_67145 ?auto_67150 ) ) ( not ( = ?auto_67145 ?auto_67151 ) ) ( not ( = ?auto_67145 ?auto_67152 ) ) ( not ( = ?auto_67146 ?auto_67147 ) ) ( not ( = ?auto_67146 ?auto_67148 ) ) ( not ( = ?auto_67146 ?auto_67149 ) ) ( not ( = ?auto_67146 ?auto_67150 ) ) ( not ( = ?auto_67146 ?auto_67151 ) ) ( not ( = ?auto_67146 ?auto_67152 ) ) ( not ( = ?auto_67147 ?auto_67148 ) ) ( not ( = ?auto_67147 ?auto_67149 ) ) ( not ( = ?auto_67147 ?auto_67150 ) ) ( not ( = ?auto_67147 ?auto_67151 ) ) ( not ( = ?auto_67147 ?auto_67152 ) ) ( not ( = ?auto_67148 ?auto_67149 ) ) ( not ( = ?auto_67148 ?auto_67150 ) ) ( not ( = ?auto_67148 ?auto_67151 ) ) ( not ( = ?auto_67148 ?auto_67152 ) ) ( not ( = ?auto_67149 ?auto_67150 ) ) ( not ( = ?auto_67149 ?auto_67151 ) ) ( not ( = ?auto_67149 ?auto_67152 ) ) ( not ( = ?auto_67150 ?auto_67151 ) ) ( not ( = ?auto_67150 ?auto_67152 ) ) ( not ( = ?auto_67151 ?auto_67152 ) ) ( ON ?auto_67151 ?auto_67152 ) ( ON ?auto_67150 ?auto_67151 ) ( ON ?auto_67149 ?auto_67150 ) ( CLEAR ?auto_67147 ) ( ON ?auto_67148 ?auto_67149 ) ( CLEAR ?auto_67148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_67144 ?auto_67145 ?auto_67146 ?auto_67147 ?auto_67148 )
      ( MAKE-9PILE ?auto_67144 ?auto_67145 ?auto_67146 ?auto_67147 ?auto_67148 ?auto_67149 ?auto_67150 ?auto_67151 ?auto_67152 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67162 - BLOCK
      ?auto_67163 - BLOCK
      ?auto_67164 - BLOCK
      ?auto_67165 - BLOCK
      ?auto_67166 - BLOCK
      ?auto_67167 - BLOCK
      ?auto_67168 - BLOCK
      ?auto_67169 - BLOCK
      ?auto_67170 - BLOCK
    )
    :vars
    (
      ?auto_67171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67170 ?auto_67171 ) ( ON-TABLE ?auto_67162 ) ( ON ?auto_67163 ?auto_67162 ) ( ON ?auto_67164 ?auto_67163 ) ( not ( = ?auto_67162 ?auto_67163 ) ) ( not ( = ?auto_67162 ?auto_67164 ) ) ( not ( = ?auto_67162 ?auto_67165 ) ) ( not ( = ?auto_67162 ?auto_67166 ) ) ( not ( = ?auto_67162 ?auto_67167 ) ) ( not ( = ?auto_67162 ?auto_67168 ) ) ( not ( = ?auto_67162 ?auto_67169 ) ) ( not ( = ?auto_67162 ?auto_67170 ) ) ( not ( = ?auto_67162 ?auto_67171 ) ) ( not ( = ?auto_67163 ?auto_67164 ) ) ( not ( = ?auto_67163 ?auto_67165 ) ) ( not ( = ?auto_67163 ?auto_67166 ) ) ( not ( = ?auto_67163 ?auto_67167 ) ) ( not ( = ?auto_67163 ?auto_67168 ) ) ( not ( = ?auto_67163 ?auto_67169 ) ) ( not ( = ?auto_67163 ?auto_67170 ) ) ( not ( = ?auto_67163 ?auto_67171 ) ) ( not ( = ?auto_67164 ?auto_67165 ) ) ( not ( = ?auto_67164 ?auto_67166 ) ) ( not ( = ?auto_67164 ?auto_67167 ) ) ( not ( = ?auto_67164 ?auto_67168 ) ) ( not ( = ?auto_67164 ?auto_67169 ) ) ( not ( = ?auto_67164 ?auto_67170 ) ) ( not ( = ?auto_67164 ?auto_67171 ) ) ( not ( = ?auto_67165 ?auto_67166 ) ) ( not ( = ?auto_67165 ?auto_67167 ) ) ( not ( = ?auto_67165 ?auto_67168 ) ) ( not ( = ?auto_67165 ?auto_67169 ) ) ( not ( = ?auto_67165 ?auto_67170 ) ) ( not ( = ?auto_67165 ?auto_67171 ) ) ( not ( = ?auto_67166 ?auto_67167 ) ) ( not ( = ?auto_67166 ?auto_67168 ) ) ( not ( = ?auto_67166 ?auto_67169 ) ) ( not ( = ?auto_67166 ?auto_67170 ) ) ( not ( = ?auto_67166 ?auto_67171 ) ) ( not ( = ?auto_67167 ?auto_67168 ) ) ( not ( = ?auto_67167 ?auto_67169 ) ) ( not ( = ?auto_67167 ?auto_67170 ) ) ( not ( = ?auto_67167 ?auto_67171 ) ) ( not ( = ?auto_67168 ?auto_67169 ) ) ( not ( = ?auto_67168 ?auto_67170 ) ) ( not ( = ?auto_67168 ?auto_67171 ) ) ( not ( = ?auto_67169 ?auto_67170 ) ) ( not ( = ?auto_67169 ?auto_67171 ) ) ( not ( = ?auto_67170 ?auto_67171 ) ) ( ON ?auto_67169 ?auto_67170 ) ( ON ?auto_67168 ?auto_67169 ) ( ON ?auto_67167 ?auto_67168 ) ( ON ?auto_67166 ?auto_67167 ) ( CLEAR ?auto_67164 ) ( ON ?auto_67165 ?auto_67166 ) ( CLEAR ?auto_67165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67162 ?auto_67163 ?auto_67164 ?auto_67165 )
      ( MAKE-9PILE ?auto_67162 ?auto_67163 ?auto_67164 ?auto_67165 ?auto_67166 ?auto_67167 ?auto_67168 ?auto_67169 ?auto_67170 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67181 - BLOCK
      ?auto_67182 - BLOCK
      ?auto_67183 - BLOCK
      ?auto_67184 - BLOCK
      ?auto_67185 - BLOCK
      ?auto_67186 - BLOCK
      ?auto_67187 - BLOCK
      ?auto_67188 - BLOCK
      ?auto_67189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67189 ) ( ON-TABLE ?auto_67181 ) ( ON ?auto_67182 ?auto_67181 ) ( ON ?auto_67183 ?auto_67182 ) ( not ( = ?auto_67181 ?auto_67182 ) ) ( not ( = ?auto_67181 ?auto_67183 ) ) ( not ( = ?auto_67181 ?auto_67184 ) ) ( not ( = ?auto_67181 ?auto_67185 ) ) ( not ( = ?auto_67181 ?auto_67186 ) ) ( not ( = ?auto_67181 ?auto_67187 ) ) ( not ( = ?auto_67181 ?auto_67188 ) ) ( not ( = ?auto_67181 ?auto_67189 ) ) ( not ( = ?auto_67182 ?auto_67183 ) ) ( not ( = ?auto_67182 ?auto_67184 ) ) ( not ( = ?auto_67182 ?auto_67185 ) ) ( not ( = ?auto_67182 ?auto_67186 ) ) ( not ( = ?auto_67182 ?auto_67187 ) ) ( not ( = ?auto_67182 ?auto_67188 ) ) ( not ( = ?auto_67182 ?auto_67189 ) ) ( not ( = ?auto_67183 ?auto_67184 ) ) ( not ( = ?auto_67183 ?auto_67185 ) ) ( not ( = ?auto_67183 ?auto_67186 ) ) ( not ( = ?auto_67183 ?auto_67187 ) ) ( not ( = ?auto_67183 ?auto_67188 ) ) ( not ( = ?auto_67183 ?auto_67189 ) ) ( not ( = ?auto_67184 ?auto_67185 ) ) ( not ( = ?auto_67184 ?auto_67186 ) ) ( not ( = ?auto_67184 ?auto_67187 ) ) ( not ( = ?auto_67184 ?auto_67188 ) ) ( not ( = ?auto_67184 ?auto_67189 ) ) ( not ( = ?auto_67185 ?auto_67186 ) ) ( not ( = ?auto_67185 ?auto_67187 ) ) ( not ( = ?auto_67185 ?auto_67188 ) ) ( not ( = ?auto_67185 ?auto_67189 ) ) ( not ( = ?auto_67186 ?auto_67187 ) ) ( not ( = ?auto_67186 ?auto_67188 ) ) ( not ( = ?auto_67186 ?auto_67189 ) ) ( not ( = ?auto_67187 ?auto_67188 ) ) ( not ( = ?auto_67187 ?auto_67189 ) ) ( not ( = ?auto_67188 ?auto_67189 ) ) ( ON ?auto_67188 ?auto_67189 ) ( ON ?auto_67187 ?auto_67188 ) ( ON ?auto_67186 ?auto_67187 ) ( ON ?auto_67185 ?auto_67186 ) ( CLEAR ?auto_67183 ) ( ON ?auto_67184 ?auto_67185 ) ( CLEAR ?auto_67184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_67181 ?auto_67182 ?auto_67183 ?auto_67184 )
      ( MAKE-9PILE ?auto_67181 ?auto_67182 ?auto_67183 ?auto_67184 ?auto_67185 ?auto_67186 ?auto_67187 ?auto_67188 ?auto_67189 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67199 - BLOCK
      ?auto_67200 - BLOCK
      ?auto_67201 - BLOCK
      ?auto_67202 - BLOCK
      ?auto_67203 - BLOCK
      ?auto_67204 - BLOCK
      ?auto_67205 - BLOCK
      ?auto_67206 - BLOCK
      ?auto_67207 - BLOCK
    )
    :vars
    (
      ?auto_67208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67207 ?auto_67208 ) ( ON-TABLE ?auto_67199 ) ( ON ?auto_67200 ?auto_67199 ) ( not ( = ?auto_67199 ?auto_67200 ) ) ( not ( = ?auto_67199 ?auto_67201 ) ) ( not ( = ?auto_67199 ?auto_67202 ) ) ( not ( = ?auto_67199 ?auto_67203 ) ) ( not ( = ?auto_67199 ?auto_67204 ) ) ( not ( = ?auto_67199 ?auto_67205 ) ) ( not ( = ?auto_67199 ?auto_67206 ) ) ( not ( = ?auto_67199 ?auto_67207 ) ) ( not ( = ?auto_67199 ?auto_67208 ) ) ( not ( = ?auto_67200 ?auto_67201 ) ) ( not ( = ?auto_67200 ?auto_67202 ) ) ( not ( = ?auto_67200 ?auto_67203 ) ) ( not ( = ?auto_67200 ?auto_67204 ) ) ( not ( = ?auto_67200 ?auto_67205 ) ) ( not ( = ?auto_67200 ?auto_67206 ) ) ( not ( = ?auto_67200 ?auto_67207 ) ) ( not ( = ?auto_67200 ?auto_67208 ) ) ( not ( = ?auto_67201 ?auto_67202 ) ) ( not ( = ?auto_67201 ?auto_67203 ) ) ( not ( = ?auto_67201 ?auto_67204 ) ) ( not ( = ?auto_67201 ?auto_67205 ) ) ( not ( = ?auto_67201 ?auto_67206 ) ) ( not ( = ?auto_67201 ?auto_67207 ) ) ( not ( = ?auto_67201 ?auto_67208 ) ) ( not ( = ?auto_67202 ?auto_67203 ) ) ( not ( = ?auto_67202 ?auto_67204 ) ) ( not ( = ?auto_67202 ?auto_67205 ) ) ( not ( = ?auto_67202 ?auto_67206 ) ) ( not ( = ?auto_67202 ?auto_67207 ) ) ( not ( = ?auto_67202 ?auto_67208 ) ) ( not ( = ?auto_67203 ?auto_67204 ) ) ( not ( = ?auto_67203 ?auto_67205 ) ) ( not ( = ?auto_67203 ?auto_67206 ) ) ( not ( = ?auto_67203 ?auto_67207 ) ) ( not ( = ?auto_67203 ?auto_67208 ) ) ( not ( = ?auto_67204 ?auto_67205 ) ) ( not ( = ?auto_67204 ?auto_67206 ) ) ( not ( = ?auto_67204 ?auto_67207 ) ) ( not ( = ?auto_67204 ?auto_67208 ) ) ( not ( = ?auto_67205 ?auto_67206 ) ) ( not ( = ?auto_67205 ?auto_67207 ) ) ( not ( = ?auto_67205 ?auto_67208 ) ) ( not ( = ?auto_67206 ?auto_67207 ) ) ( not ( = ?auto_67206 ?auto_67208 ) ) ( not ( = ?auto_67207 ?auto_67208 ) ) ( ON ?auto_67206 ?auto_67207 ) ( ON ?auto_67205 ?auto_67206 ) ( ON ?auto_67204 ?auto_67205 ) ( ON ?auto_67203 ?auto_67204 ) ( ON ?auto_67202 ?auto_67203 ) ( CLEAR ?auto_67200 ) ( ON ?auto_67201 ?auto_67202 ) ( CLEAR ?auto_67201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67199 ?auto_67200 ?auto_67201 )
      ( MAKE-9PILE ?auto_67199 ?auto_67200 ?auto_67201 ?auto_67202 ?auto_67203 ?auto_67204 ?auto_67205 ?auto_67206 ?auto_67207 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67218 - BLOCK
      ?auto_67219 - BLOCK
      ?auto_67220 - BLOCK
      ?auto_67221 - BLOCK
      ?auto_67222 - BLOCK
      ?auto_67223 - BLOCK
      ?auto_67224 - BLOCK
      ?auto_67225 - BLOCK
      ?auto_67226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67226 ) ( ON-TABLE ?auto_67218 ) ( ON ?auto_67219 ?auto_67218 ) ( not ( = ?auto_67218 ?auto_67219 ) ) ( not ( = ?auto_67218 ?auto_67220 ) ) ( not ( = ?auto_67218 ?auto_67221 ) ) ( not ( = ?auto_67218 ?auto_67222 ) ) ( not ( = ?auto_67218 ?auto_67223 ) ) ( not ( = ?auto_67218 ?auto_67224 ) ) ( not ( = ?auto_67218 ?auto_67225 ) ) ( not ( = ?auto_67218 ?auto_67226 ) ) ( not ( = ?auto_67219 ?auto_67220 ) ) ( not ( = ?auto_67219 ?auto_67221 ) ) ( not ( = ?auto_67219 ?auto_67222 ) ) ( not ( = ?auto_67219 ?auto_67223 ) ) ( not ( = ?auto_67219 ?auto_67224 ) ) ( not ( = ?auto_67219 ?auto_67225 ) ) ( not ( = ?auto_67219 ?auto_67226 ) ) ( not ( = ?auto_67220 ?auto_67221 ) ) ( not ( = ?auto_67220 ?auto_67222 ) ) ( not ( = ?auto_67220 ?auto_67223 ) ) ( not ( = ?auto_67220 ?auto_67224 ) ) ( not ( = ?auto_67220 ?auto_67225 ) ) ( not ( = ?auto_67220 ?auto_67226 ) ) ( not ( = ?auto_67221 ?auto_67222 ) ) ( not ( = ?auto_67221 ?auto_67223 ) ) ( not ( = ?auto_67221 ?auto_67224 ) ) ( not ( = ?auto_67221 ?auto_67225 ) ) ( not ( = ?auto_67221 ?auto_67226 ) ) ( not ( = ?auto_67222 ?auto_67223 ) ) ( not ( = ?auto_67222 ?auto_67224 ) ) ( not ( = ?auto_67222 ?auto_67225 ) ) ( not ( = ?auto_67222 ?auto_67226 ) ) ( not ( = ?auto_67223 ?auto_67224 ) ) ( not ( = ?auto_67223 ?auto_67225 ) ) ( not ( = ?auto_67223 ?auto_67226 ) ) ( not ( = ?auto_67224 ?auto_67225 ) ) ( not ( = ?auto_67224 ?auto_67226 ) ) ( not ( = ?auto_67225 ?auto_67226 ) ) ( ON ?auto_67225 ?auto_67226 ) ( ON ?auto_67224 ?auto_67225 ) ( ON ?auto_67223 ?auto_67224 ) ( ON ?auto_67222 ?auto_67223 ) ( ON ?auto_67221 ?auto_67222 ) ( CLEAR ?auto_67219 ) ( ON ?auto_67220 ?auto_67221 ) ( CLEAR ?auto_67220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_67218 ?auto_67219 ?auto_67220 )
      ( MAKE-9PILE ?auto_67218 ?auto_67219 ?auto_67220 ?auto_67221 ?auto_67222 ?auto_67223 ?auto_67224 ?auto_67225 ?auto_67226 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67236 - BLOCK
      ?auto_67237 - BLOCK
      ?auto_67238 - BLOCK
      ?auto_67239 - BLOCK
      ?auto_67240 - BLOCK
      ?auto_67241 - BLOCK
      ?auto_67242 - BLOCK
      ?auto_67243 - BLOCK
      ?auto_67244 - BLOCK
    )
    :vars
    (
      ?auto_67245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67244 ?auto_67245 ) ( ON-TABLE ?auto_67236 ) ( not ( = ?auto_67236 ?auto_67237 ) ) ( not ( = ?auto_67236 ?auto_67238 ) ) ( not ( = ?auto_67236 ?auto_67239 ) ) ( not ( = ?auto_67236 ?auto_67240 ) ) ( not ( = ?auto_67236 ?auto_67241 ) ) ( not ( = ?auto_67236 ?auto_67242 ) ) ( not ( = ?auto_67236 ?auto_67243 ) ) ( not ( = ?auto_67236 ?auto_67244 ) ) ( not ( = ?auto_67236 ?auto_67245 ) ) ( not ( = ?auto_67237 ?auto_67238 ) ) ( not ( = ?auto_67237 ?auto_67239 ) ) ( not ( = ?auto_67237 ?auto_67240 ) ) ( not ( = ?auto_67237 ?auto_67241 ) ) ( not ( = ?auto_67237 ?auto_67242 ) ) ( not ( = ?auto_67237 ?auto_67243 ) ) ( not ( = ?auto_67237 ?auto_67244 ) ) ( not ( = ?auto_67237 ?auto_67245 ) ) ( not ( = ?auto_67238 ?auto_67239 ) ) ( not ( = ?auto_67238 ?auto_67240 ) ) ( not ( = ?auto_67238 ?auto_67241 ) ) ( not ( = ?auto_67238 ?auto_67242 ) ) ( not ( = ?auto_67238 ?auto_67243 ) ) ( not ( = ?auto_67238 ?auto_67244 ) ) ( not ( = ?auto_67238 ?auto_67245 ) ) ( not ( = ?auto_67239 ?auto_67240 ) ) ( not ( = ?auto_67239 ?auto_67241 ) ) ( not ( = ?auto_67239 ?auto_67242 ) ) ( not ( = ?auto_67239 ?auto_67243 ) ) ( not ( = ?auto_67239 ?auto_67244 ) ) ( not ( = ?auto_67239 ?auto_67245 ) ) ( not ( = ?auto_67240 ?auto_67241 ) ) ( not ( = ?auto_67240 ?auto_67242 ) ) ( not ( = ?auto_67240 ?auto_67243 ) ) ( not ( = ?auto_67240 ?auto_67244 ) ) ( not ( = ?auto_67240 ?auto_67245 ) ) ( not ( = ?auto_67241 ?auto_67242 ) ) ( not ( = ?auto_67241 ?auto_67243 ) ) ( not ( = ?auto_67241 ?auto_67244 ) ) ( not ( = ?auto_67241 ?auto_67245 ) ) ( not ( = ?auto_67242 ?auto_67243 ) ) ( not ( = ?auto_67242 ?auto_67244 ) ) ( not ( = ?auto_67242 ?auto_67245 ) ) ( not ( = ?auto_67243 ?auto_67244 ) ) ( not ( = ?auto_67243 ?auto_67245 ) ) ( not ( = ?auto_67244 ?auto_67245 ) ) ( ON ?auto_67243 ?auto_67244 ) ( ON ?auto_67242 ?auto_67243 ) ( ON ?auto_67241 ?auto_67242 ) ( ON ?auto_67240 ?auto_67241 ) ( ON ?auto_67239 ?auto_67240 ) ( ON ?auto_67238 ?auto_67239 ) ( CLEAR ?auto_67236 ) ( ON ?auto_67237 ?auto_67238 ) ( CLEAR ?auto_67237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67236 ?auto_67237 )
      ( MAKE-9PILE ?auto_67236 ?auto_67237 ?auto_67238 ?auto_67239 ?auto_67240 ?auto_67241 ?auto_67242 ?auto_67243 ?auto_67244 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67255 - BLOCK
      ?auto_67256 - BLOCK
      ?auto_67257 - BLOCK
      ?auto_67258 - BLOCK
      ?auto_67259 - BLOCK
      ?auto_67260 - BLOCK
      ?auto_67261 - BLOCK
      ?auto_67262 - BLOCK
      ?auto_67263 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67263 ) ( ON-TABLE ?auto_67255 ) ( not ( = ?auto_67255 ?auto_67256 ) ) ( not ( = ?auto_67255 ?auto_67257 ) ) ( not ( = ?auto_67255 ?auto_67258 ) ) ( not ( = ?auto_67255 ?auto_67259 ) ) ( not ( = ?auto_67255 ?auto_67260 ) ) ( not ( = ?auto_67255 ?auto_67261 ) ) ( not ( = ?auto_67255 ?auto_67262 ) ) ( not ( = ?auto_67255 ?auto_67263 ) ) ( not ( = ?auto_67256 ?auto_67257 ) ) ( not ( = ?auto_67256 ?auto_67258 ) ) ( not ( = ?auto_67256 ?auto_67259 ) ) ( not ( = ?auto_67256 ?auto_67260 ) ) ( not ( = ?auto_67256 ?auto_67261 ) ) ( not ( = ?auto_67256 ?auto_67262 ) ) ( not ( = ?auto_67256 ?auto_67263 ) ) ( not ( = ?auto_67257 ?auto_67258 ) ) ( not ( = ?auto_67257 ?auto_67259 ) ) ( not ( = ?auto_67257 ?auto_67260 ) ) ( not ( = ?auto_67257 ?auto_67261 ) ) ( not ( = ?auto_67257 ?auto_67262 ) ) ( not ( = ?auto_67257 ?auto_67263 ) ) ( not ( = ?auto_67258 ?auto_67259 ) ) ( not ( = ?auto_67258 ?auto_67260 ) ) ( not ( = ?auto_67258 ?auto_67261 ) ) ( not ( = ?auto_67258 ?auto_67262 ) ) ( not ( = ?auto_67258 ?auto_67263 ) ) ( not ( = ?auto_67259 ?auto_67260 ) ) ( not ( = ?auto_67259 ?auto_67261 ) ) ( not ( = ?auto_67259 ?auto_67262 ) ) ( not ( = ?auto_67259 ?auto_67263 ) ) ( not ( = ?auto_67260 ?auto_67261 ) ) ( not ( = ?auto_67260 ?auto_67262 ) ) ( not ( = ?auto_67260 ?auto_67263 ) ) ( not ( = ?auto_67261 ?auto_67262 ) ) ( not ( = ?auto_67261 ?auto_67263 ) ) ( not ( = ?auto_67262 ?auto_67263 ) ) ( ON ?auto_67262 ?auto_67263 ) ( ON ?auto_67261 ?auto_67262 ) ( ON ?auto_67260 ?auto_67261 ) ( ON ?auto_67259 ?auto_67260 ) ( ON ?auto_67258 ?auto_67259 ) ( ON ?auto_67257 ?auto_67258 ) ( CLEAR ?auto_67255 ) ( ON ?auto_67256 ?auto_67257 ) ( CLEAR ?auto_67256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_67255 ?auto_67256 )
      ( MAKE-9PILE ?auto_67255 ?auto_67256 ?auto_67257 ?auto_67258 ?auto_67259 ?auto_67260 ?auto_67261 ?auto_67262 ?auto_67263 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67273 - BLOCK
      ?auto_67274 - BLOCK
      ?auto_67275 - BLOCK
      ?auto_67276 - BLOCK
      ?auto_67277 - BLOCK
      ?auto_67278 - BLOCK
      ?auto_67279 - BLOCK
      ?auto_67280 - BLOCK
      ?auto_67281 - BLOCK
    )
    :vars
    (
      ?auto_67282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_67281 ?auto_67282 ) ( not ( = ?auto_67273 ?auto_67274 ) ) ( not ( = ?auto_67273 ?auto_67275 ) ) ( not ( = ?auto_67273 ?auto_67276 ) ) ( not ( = ?auto_67273 ?auto_67277 ) ) ( not ( = ?auto_67273 ?auto_67278 ) ) ( not ( = ?auto_67273 ?auto_67279 ) ) ( not ( = ?auto_67273 ?auto_67280 ) ) ( not ( = ?auto_67273 ?auto_67281 ) ) ( not ( = ?auto_67273 ?auto_67282 ) ) ( not ( = ?auto_67274 ?auto_67275 ) ) ( not ( = ?auto_67274 ?auto_67276 ) ) ( not ( = ?auto_67274 ?auto_67277 ) ) ( not ( = ?auto_67274 ?auto_67278 ) ) ( not ( = ?auto_67274 ?auto_67279 ) ) ( not ( = ?auto_67274 ?auto_67280 ) ) ( not ( = ?auto_67274 ?auto_67281 ) ) ( not ( = ?auto_67274 ?auto_67282 ) ) ( not ( = ?auto_67275 ?auto_67276 ) ) ( not ( = ?auto_67275 ?auto_67277 ) ) ( not ( = ?auto_67275 ?auto_67278 ) ) ( not ( = ?auto_67275 ?auto_67279 ) ) ( not ( = ?auto_67275 ?auto_67280 ) ) ( not ( = ?auto_67275 ?auto_67281 ) ) ( not ( = ?auto_67275 ?auto_67282 ) ) ( not ( = ?auto_67276 ?auto_67277 ) ) ( not ( = ?auto_67276 ?auto_67278 ) ) ( not ( = ?auto_67276 ?auto_67279 ) ) ( not ( = ?auto_67276 ?auto_67280 ) ) ( not ( = ?auto_67276 ?auto_67281 ) ) ( not ( = ?auto_67276 ?auto_67282 ) ) ( not ( = ?auto_67277 ?auto_67278 ) ) ( not ( = ?auto_67277 ?auto_67279 ) ) ( not ( = ?auto_67277 ?auto_67280 ) ) ( not ( = ?auto_67277 ?auto_67281 ) ) ( not ( = ?auto_67277 ?auto_67282 ) ) ( not ( = ?auto_67278 ?auto_67279 ) ) ( not ( = ?auto_67278 ?auto_67280 ) ) ( not ( = ?auto_67278 ?auto_67281 ) ) ( not ( = ?auto_67278 ?auto_67282 ) ) ( not ( = ?auto_67279 ?auto_67280 ) ) ( not ( = ?auto_67279 ?auto_67281 ) ) ( not ( = ?auto_67279 ?auto_67282 ) ) ( not ( = ?auto_67280 ?auto_67281 ) ) ( not ( = ?auto_67280 ?auto_67282 ) ) ( not ( = ?auto_67281 ?auto_67282 ) ) ( ON ?auto_67280 ?auto_67281 ) ( ON ?auto_67279 ?auto_67280 ) ( ON ?auto_67278 ?auto_67279 ) ( ON ?auto_67277 ?auto_67278 ) ( ON ?auto_67276 ?auto_67277 ) ( ON ?auto_67275 ?auto_67276 ) ( ON ?auto_67274 ?auto_67275 ) ( ON ?auto_67273 ?auto_67274 ) ( CLEAR ?auto_67273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67273 )
      ( MAKE-9PILE ?auto_67273 ?auto_67274 ?auto_67275 ?auto_67276 ?auto_67277 ?auto_67278 ?auto_67279 ?auto_67280 ?auto_67281 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67292 - BLOCK
      ?auto_67293 - BLOCK
      ?auto_67294 - BLOCK
      ?auto_67295 - BLOCK
      ?auto_67296 - BLOCK
      ?auto_67297 - BLOCK
      ?auto_67298 - BLOCK
      ?auto_67299 - BLOCK
      ?auto_67300 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_67300 ) ( not ( = ?auto_67292 ?auto_67293 ) ) ( not ( = ?auto_67292 ?auto_67294 ) ) ( not ( = ?auto_67292 ?auto_67295 ) ) ( not ( = ?auto_67292 ?auto_67296 ) ) ( not ( = ?auto_67292 ?auto_67297 ) ) ( not ( = ?auto_67292 ?auto_67298 ) ) ( not ( = ?auto_67292 ?auto_67299 ) ) ( not ( = ?auto_67292 ?auto_67300 ) ) ( not ( = ?auto_67293 ?auto_67294 ) ) ( not ( = ?auto_67293 ?auto_67295 ) ) ( not ( = ?auto_67293 ?auto_67296 ) ) ( not ( = ?auto_67293 ?auto_67297 ) ) ( not ( = ?auto_67293 ?auto_67298 ) ) ( not ( = ?auto_67293 ?auto_67299 ) ) ( not ( = ?auto_67293 ?auto_67300 ) ) ( not ( = ?auto_67294 ?auto_67295 ) ) ( not ( = ?auto_67294 ?auto_67296 ) ) ( not ( = ?auto_67294 ?auto_67297 ) ) ( not ( = ?auto_67294 ?auto_67298 ) ) ( not ( = ?auto_67294 ?auto_67299 ) ) ( not ( = ?auto_67294 ?auto_67300 ) ) ( not ( = ?auto_67295 ?auto_67296 ) ) ( not ( = ?auto_67295 ?auto_67297 ) ) ( not ( = ?auto_67295 ?auto_67298 ) ) ( not ( = ?auto_67295 ?auto_67299 ) ) ( not ( = ?auto_67295 ?auto_67300 ) ) ( not ( = ?auto_67296 ?auto_67297 ) ) ( not ( = ?auto_67296 ?auto_67298 ) ) ( not ( = ?auto_67296 ?auto_67299 ) ) ( not ( = ?auto_67296 ?auto_67300 ) ) ( not ( = ?auto_67297 ?auto_67298 ) ) ( not ( = ?auto_67297 ?auto_67299 ) ) ( not ( = ?auto_67297 ?auto_67300 ) ) ( not ( = ?auto_67298 ?auto_67299 ) ) ( not ( = ?auto_67298 ?auto_67300 ) ) ( not ( = ?auto_67299 ?auto_67300 ) ) ( ON ?auto_67299 ?auto_67300 ) ( ON ?auto_67298 ?auto_67299 ) ( ON ?auto_67297 ?auto_67298 ) ( ON ?auto_67296 ?auto_67297 ) ( ON ?auto_67295 ?auto_67296 ) ( ON ?auto_67294 ?auto_67295 ) ( ON ?auto_67293 ?auto_67294 ) ( ON ?auto_67292 ?auto_67293 ) ( CLEAR ?auto_67292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_67292 )
      ( MAKE-9PILE ?auto_67292 ?auto_67293 ?auto_67294 ?auto_67295 ?auto_67296 ?auto_67297 ?auto_67298 ?auto_67299 ?auto_67300 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_67310 - BLOCK
      ?auto_67311 - BLOCK
      ?auto_67312 - BLOCK
      ?auto_67313 - BLOCK
      ?auto_67314 - BLOCK
      ?auto_67315 - BLOCK
      ?auto_67316 - BLOCK
      ?auto_67317 - BLOCK
      ?auto_67318 - BLOCK
    )
    :vars
    (
      ?auto_67319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_67310 ?auto_67311 ) ) ( not ( = ?auto_67310 ?auto_67312 ) ) ( not ( = ?auto_67310 ?auto_67313 ) ) ( not ( = ?auto_67310 ?auto_67314 ) ) ( not ( = ?auto_67310 ?auto_67315 ) ) ( not ( = ?auto_67310 ?auto_67316 ) ) ( not ( = ?auto_67310 ?auto_67317 ) ) ( not ( = ?auto_67310 ?auto_67318 ) ) ( not ( = ?auto_67311 ?auto_67312 ) ) ( not ( = ?auto_67311 ?auto_67313 ) ) ( not ( = ?auto_67311 ?auto_67314 ) ) ( not ( = ?auto_67311 ?auto_67315 ) ) ( not ( = ?auto_67311 ?auto_67316 ) ) ( not ( = ?auto_67311 ?auto_67317 ) ) ( not ( = ?auto_67311 ?auto_67318 ) ) ( not ( = ?auto_67312 ?auto_67313 ) ) ( not ( = ?auto_67312 ?auto_67314 ) ) ( not ( = ?auto_67312 ?auto_67315 ) ) ( not ( = ?auto_67312 ?auto_67316 ) ) ( not ( = ?auto_67312 ?auto_67317 ) ) ( not ( = ?auto_67312 ?auto_67318 ) ) ( not ( = ?auto_67313 ?auto_67314 ) ) ( not ( = ?auto_67313 ?auto_67315 ) ) ( not ( = ?auto_67313 ?auto_67316 ) ) ( not ( = ?auto_67313 ?auto_67317 ) ) ( not ( = ?auto_67313 ?auto_67318 ) ) ( not ( = ?auto_67314 ?auto_67315 ) ) ( not ( = ?auto_67314 ?auto_67316 ) ) ( not ( = ?auto_67314 ?auto_67317 ) ) ( not ( = ?auto_67314 ?auto_67318 ) ) ( not ( = ?auto_67315 ?auto_67316 ) ) ( not ( = ?auto_67315 ?auto_67317 ) ) ( not ( = ?auto_67315 ?auto_67318 ) ) ( not ( = ?auto_67316 ?auto_67317 ) ) ( not ( = ?auto_67316 ?auto_67318 ) ) ( not ( = ?auto_67317 ?auto_67318 ) ) ( ON ?auto_67310 ?auto_67319 ) ( not ( = ?auto_67318 ?auto_67319 ) ) ( not ( = ?auto_67317 ?auto_67319 ) ) ( not ( = ?auto_67316 ?auto_67319 ) ) ( not ( = ?auto_67315 ?auto_67319 ) ) ( not ( = ?auto_67314 ?auto_67319 ) ) ( not ( = ?auto_67313 ?auto_67319 ) ) ( not ( = ?auto_67312 ?auto_67319 ) ) ( not ( = ?auto_67311 ?auto_67319 ) ) ( not ( = ?auto_67310 ?auto_67319 ) ) ( ON ?auto_67311 ?auto_67310 ) ( ON ?auto_67312 ?auto_67311 ) ( ON ?auto_67313 ?auto_67312 ) ( ON ?auto_67314 ?auto_67313 ) ( ON ?auto_67315 ?auto_67314 ) ( ON ?auto_67316 ?auto_67315 ) ( ON ?auto_67317 ?auto_67316 ) ( ON ?auto_67318 ?auto_67317 ) ( CLEAR ?auto_67318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_67318 ?auto_67317 ?auto_67316 ?auto_67315 ?auto_67314 ?auto_67313 ?auto_67312 ?auto_67311 ?auto_67310 )
      ( MAKE-9PILE ?auto_67310 ?auto_67311 ?auto_67312 ?auto_67313 ?auto_67314 ?auto_67315 ?auto_67316 ?auto_67317 ?auto_67318 ) )
  )

)
