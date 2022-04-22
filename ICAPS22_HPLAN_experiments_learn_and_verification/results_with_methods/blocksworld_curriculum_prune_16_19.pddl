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
      ?auto_584128 - BLOCK
    )
    :vars
    (
      ?auto_584129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584128 ?auto_584129 ) ( CLEAR ?auto_584128 ) ( HAND-EMPTY ) ( not ( = ?auto_584128 ?auto_584129 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_584128 ?auto_584129 )
      ( !PUTDOWN ?auto_584128 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_584135 - BLOCK
      ?auto_584136 - BLOCK
    )
    :vars
    (
      ?auto_584137 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_584135 ) ( ON ?auto_584136 ?auto_584137 ) ( CLEAR ?auto_584136 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_584135 ) ( not ( = ?auto_584135 ?auto_584136 ) ) ( not ( = ?auto_584135 ?auto_584137 ) ) ( not ( = ?auto_584136 ?auto_584137 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_584136 ?auto_584137 )
      ( !STACK ?auto_584136 ?auto_584135 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_584145 - BLOCK
      ?auto_584146 - BLOCK
    )
    :vars
    (
      ?auto_584147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584146 ?auto_584147 ) ( not ( = ?auto_584145 ?auto_584146 ) ) ( not ( = ?auto_584145 ?auto_584147 ) ) ( not ( = ?auto_584146 ?auto_584147 ) ) ( ON ?auto_584145 ?auto_584146 ) ( CLEAR ?auto_584145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_584145 )
      ( MAKE-2PILE ?auto_584145 ?auto_584146 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_584156 - BLOCK
      ?auto_584157 - BLOCK
      ?auto_584158 - BLOCK
    )
    :vars
    (
      ?auto_584159 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_584157 ) ( ON ?auto_584158 ?auto_584159 ) ( CLEAR ?auto_584158 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_584156 ) ( ON ?auto_584157 ?auto_584156 ) ( not ( = ?auto_584156 ?auto_584157 ) ) ( not ( = ?auto_584156 ?auto_584158 ) ) ( not ( = ?auto_584156 ?auto_584159 ) ) ( not ( = ?auto_584157 ?auto_584158 ) ) ( not ( = ?auto_584157 ?auto_584159 ) ) ( not ( = ?auto_584158 ?auto_584159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_584158 ?auto_584159 )
      ( !STACK ?auto_584158 ?auto_584157 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_584170 - BLOCK
      ?auto_584171 - BLOCK
      ?auto_584172 - BLOCK
    )
    :vars
    (
      ?auto_584173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584172 ?auto_584173 ) ( ON-TABLE ?auto_584170 ) ( not ( = ?auto_584170 ?auto_584171 ) ) ( not ( = ?auto_584170 ?auto_584172 ) ) ( not ( = ?auto_584170 ?auto_584173 ) ) ( not ( = ?auto_584171 ?auto_584172 ) ) ( not ( = ?auto_584171 ?auto_584173 ) ) ( not ( = ?auto_584172 ?auto_584173 ) ) ( CLEAR ?auto_584170 ) ( ON ?auto_584171 ?auto_584172 ) ( CLEAR ?auto_584171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_584170 ?auto_584171 )
      ( MAKE-3PILE ?auto_584170 ?auto_584171 ?auto_584172 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_584184 - BLOCK
      ?auto_584185 - BLOCK
      ?auto_584186 - BLOCK
    )
    :vars
    (
      ?auto_584187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584186 ?auto_584187 ) ( not ( = ?auto_584184 ?auto_584185 ) ) ( not ( = ?auto_584184 ?auto_584186 ) ) ( not ( = ?auto_584184 ?auto_584187 ) ) ( not ( = ?auto_584185 ?auto_584186 ) ) ( not ( = ?auto_584185 ?auto_584187 ) ) ( not ( = ?auto_584186 ?auto_584187 ) ) ( ON ?auto_584185 ?auto_584186 ) ( ON ?auto_584184 ?auto_584185 ) ( CLEAR ?auto_584184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_584184 )
      ( MAKE-3PILE ?auto_584184 ?auto_584185 ?auto_584186 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_584199 - BLOCK
      ?auto_584200 - BLOCK
      ?auto_584201 - BLOCK
      ?auto_584202 - BLOCK
    )
    :vars
    (
      ?auto_584203 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_584201 ) ( ON ?auto_584202 ?auto_584203 ) ( CLEAR ?auto_584202 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_584199 ) ( ON ?auto_584200 ?auto_584199 ) ( ON ?auto_584201 ?auto_584200 ) ( not ( = ?auto_584199 ?auto_584200 ) ) ( not ( = ?auto_584199 ?auto_584201 ) ) ( not ( = ?auto_584199 ?auto_584202 ) ) ( not ( = ?auto_584199 ?auto_584203 ) ) ( not ( = ?auto_584200 ?auto_584201 ) ) ( not ( = ?auto_584200 ?auto_584202 ) ) ( not ( = ?auto_584200 ?auto_584203 ) ) ( not ( = ?auto_584201 ?auto_584202 ) ) ( not ( = ?auto_584201 ?auto_584203 ) ) ( not ( = ?auto_584202 ?auto_584203 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_584202 ?auto_584203 )
      ( !STACK ?auto_584202 ?auto_584201 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_584217 - BLOCK
      ?auto_584218 - BLOCK
      ?auto_584219 - BLOCK
      ?auto_584220 - BLOCK
    )
    :vars
    (
      ?auto_584221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584220 ?auto_584221 ) ( ON-TABLE ?auto_584217 ) ( ON ?auto_584218 ?auto_584217 ) ( not ( = ?auto_584217 ?auto_584218 ) ) ( not ( = ?auto_584217 ?auto_584219 ) ) ( not ( = ?auto_584217 ?auto_584220 ) ) ( not ( = ?auto_584217 ?auto_584221 ) ) ( not ( = ?auto_584218 ?auto_584219 ) ) ( not ( = ?auto_584218 ?auto_584220 ) ) ( not ( = ?auto_584218 ?auto_584221 ) ) ( not ( = ?auto_584219 ?auto_584220 ) ) ( not ( = ?auto_584219 ?auto_584221 ) ) ( not ( = ?auto_584220 ?auto_584221 ) ) ( CLEAR ?auto_584218 ) ( ON ?auto_584219 ?auto_584220 ) ( CLEAR ?auto_584219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_584217 ?auto_584218 ?auto_584219 )
      ( MAKE-4PILE ?auto_584217 ?auto_584218 ?auto_584219 ?auto_584220 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_584235 - BLOCK
      ?auto_584236 - BLOCK
      ?auto_584237 - BLOCK
      ?auto_584238 - BLOCK
    )
    :vars
    (
      ?auto_584239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584238 ?auto_584239 ) ( ON-TABLE ?auto_584235 ) ( not ( = ?auto_584235 ?auto_584236 ) ) ( not ( = ?auto_584235 ?auto_584237 ) ) ( not ( = ?auto_584235 ?auto_584238 ) ) ( not ( = ?auto_584235 ?auto_584239 ) ) ( not ( = ?auto_584236 ?auto_584237 ) ) ( not ( = ?auto_584236 ?auto_584238 ) ) ( not ( = ?auto_584236 ?auto_584239 ) ) ( not ( = ?auto_584237 ?auto_584238 ) ) ( not ( = ?auto_584237 ?auto_584239 ) ) ( not ( = ?auto_584238 ?auto_584239 ) ) ( ON ?auto_584237 ?auto_584238 ) ( CLEAR ?auto_584235 ) ( ON ?auto_584236 ?auto_584237 ) ( CLEAR ?auto_584236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_584235 ?auto_584236 )
      ( MAKE-4PILE ?auto_584235 ?auto_584236 ?auto_584237 ?auto_584238 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_584253 - BLOCK
      ?auto_584254 - BLOCK
      ?auto_584255 - BLOCK
      ?auto_584256 - BLOCK
    )
    :vars
    (
      ?auto_584257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584256 ?auto_584257 ) ( not ( = ?auto_584253 ?auto_584254 ) ) ( not ( = ?auto_584253 ?auto_584255 ) ) ( not ( = ?auto_584253 ?auto_584256 ) ) ( not ( = ?auto_584253 ?auto_584257 ) ) ( not ( = ?auto_584254 ?auto_584255 ) ) ( not ( = ?auto_584254 ?auto_584256 ) ) ( not ( = ?auto_584254 ?auto_584257 ) ) ( not ( = ?auto_584255 ?auto_584256 ) ) ( not ( = ?auto_584255 ?auto_584257 ) ) ( not ( = ?auto_584256 ?auto_584257 ) ) ( ON ?auto_584255 ?auto_584256 ) ( ON ?auto_584254 ?auto_584255 ) ( ON ?auto_584253 ?auto_584254 ) ( CLEAR ?auto_584253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_584253 )
      ( MAKE-4PILE ?auto_584253 ?auto_584254 ?auto_584255 ?auto_584256 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_584272 - BLOCK
      ?auto_584273 - BLOCK
      ?auto_584274 - BLOCK
      ?auto_584275 - BLOCK
      ?auto_584276 - BLOCK
    )
    :vars
    (
      ?auto_584277 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_584275 ) ( ON ?auto_584276 ?auto_584277 ) ( CLEAR ?auto_584276 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_584272 ) ( ON ?auto_584273 ?auto_584272 ) ( ON ?auto_584274 ?auto_584273 ) ( ON ?auto_584275 ?auto_584274 ) ( not ( = ?auto_584272 ?auto_584273 ) ) ( not ( = ?auto_584272 ?auto_584274 ) ) ( not ( = ?auto_584272 ?auto_584275 ) ) ( not ( = ?auto_584272 ?auto_584276 ) ) ( not ( = ?auto_584272 ?auto_584277 ) ) ( not ( = ?auto_584273 ?auto_584274 ) ) ( not ( = ?auto_584273 ?auto_584275 ) ) ( not ( = ?auto_584273 ?auto_584276 ) ) ( not ( = ?auto_584273 ?auto_584277 ) ) ( not ( = ?auto_584274 ?auto_584275 ) ) ( not ( = ?auto_584274 ?auto_584276 ) ) ( not ( = ?auto_584274 ?auto_584277 ) ) ( not ( = ?auto_584275 ?auto_584276 ) ) ( not ( = ?auto_584275 ?auto_584277 ) ) ( not ( = ?auto_584276 ?auto_584277 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_584276 ?auto_584277 )
      ( !STACK ?auto_584276 ?auto_584275 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_584294 - BLOCK
      ?auto_584295 - BLOCK
      ?auto_584296 - BLOCK
      ?auto_584297 - BLOCK
      ?auto_584298 - BLOCK
    )
    :vars
    (
      ?auto_584299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584298 ?auto_584299 ) ( ON-TABLE ?auto_584294 ) ( ON ?auto_584295 ?auto_584294 ) ( ON ?auto_584296 ?auto_584295 ) ( not ( = ?auto_584294 ?auto_584295 ) ) ( not ( = ?auto_584294 ?auto_584296 ) ) ( not ( = ?auto_584294 ?auto_584297 ) ) ( not ( = ?auto_584294 ?auto_584298 ) ) ( not ( = ?auto_584294 ?auto_584299 ) ) ( not ( = ?auto_584295 ?auto_584296 ) ) ( not ( = ?auto_584295 ?auto_584297 ) ) ( not ( = ?auto_584295 ?auto_584298 ) ) ( not ( = ?auto_584295 ?auto_584299 ) ) ( not ( = ?auto_584296 ?auto_584297 ) ) ( not ( = ?auto_584296 ?auto_584298 ) ) ( not ( = ?auto_584296 ?auto_584299 ) ) ( not ( = ?auto_584297 ?auto_584298 ) ) ( not ( = ?auto_584297 ?auto_584299 ) ) ( not ( = ?auto_584298 ?auto_584299 ) ) ( CLEAR ?auto_584296 ) ( ON ?auto_584297 ?auto_584298 ) ( CLEAR ?auto_584297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_584294 ?auto_584295 ?auto_584296 ?auto_584297 )
      ( MAKE-5PILE ?auto_584294 ?auto_584295 ?auto_584296 ?auto_584297 ?auto_584298 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_584316 - BLOCK
      ?auto_584317 - BLOCK
      ?auto_584318 - BLOCK
      ?auto_584319 - BLOCK
      ?auto_584320 - BLOCK
    )
    :vars
    (
      ?auto_584321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584320 ?auto_584321 ) ( ON-TABLE ?auto_584316 ) ( ON ?auto_584317 ?auto_584316 ) ( not ( = ?auto_584316 ?auto_584317 ) ) ( not ( = ?auto_584316 ?auto_584318 ) ) ( not ( = ?auto_584316 ?auto_584319 ) ) ( not ( = ?auto_584316 ?auto_584320 ) ) ( not ( = ?auto_584316 ?auto_584321 ) ) ( not ( = ?auto_584317 ?auto_584318 ) ) ( not ( = ?auto_584317 ?auto_584319 ) ) ( not ( = ?auto_584317 ?auto_584320 ) ) ( not ( = ?auto_584317 ?auto_584321 ) ) ( not ( = ?auto_584318 ?auto_584319 ) ) ( not ( = ?auto_584318 ?auto_584320 ) ) ( not ( = ?auto_584318 ?auto_584321 ) ) ( not ( = ?auto_584319 ?auto_584320 ) ) ( not ( = ?auto_584319 ?auto_584321 ) ) ( not ( = ?auto_584320 ?auto_584321 ) ) ( ON ?auto_584319 ?auto_584320 ) ( CLEAR ?auto_584317 ) ( ON ?auto_584318 ?auto_584319 ) ( CLEAR ?auto_584318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_584316 ?auto_584317 ?auto_584318 )
      ( MAKE-5PILE ?auto_584316 ?auto_584317 ?auto_584318 ?auto_584319 ?auto_584320 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_584338 - BLOCK
      ?auto_584339 - BLOCK
      ?auto_584340 - BLOCK
      ?auto_584341 - BLOCK
      ?auto_584342 - BLOCK
    )
    :vars
    (
      ?auto_584343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584342 ?auto_584343 ) ( ON-TABLE ?auto_584338 ) ( not ( = ?auto_584338 ?auto_584339 ) ) ( not ( = ?auto_584338 ?auto_584340 ) ) ( not ( = ?auto_584338 ?auto_584341 ) ) ( not ( = ?auto_584338 ?auto_584342 ) ) ( not ( = ?auto_584338 ?auto_584343 ) ) ( not ( = ?auto_584339 ?auto_584340 ) ) ( not ( = ?auto_584339 ?auto_584341 ) ) ( not ( = ?auto_584339 ?auto_584342 ) ) ( not ( = ?auto_584339 ?auto_584343 ) ) ( not ( = ?auto_584340 ?auto_584341 ) ) ( not ( = ?auto_584340 ?auto_584342 ) ) ( not ( = ?auto_584340 ?auto_584343 ) ) ( not ( = ?auto_584341 ?auto_584342 ) ) ( not ( = ?auto_584341 ?auto_584343 ) ) ( not ( = ?auto_584342 ?auto_584343 ) ) ( ON ?auto_584341 ?auto_584342 ) ( ON ?auto_584340 ?auto_584341 ) ( CLEAR ?auto_584338 ) ( ON ?auto_584339 ?auto_584340 ) ( CLEAR ?auto_584339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_584338 ?auto_584339 )
      ( MAKE-5PILE ?auto_584338 ?auto_584339 ?auto_584340 ?auto_584341 ?auto_584342 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_584360 - BLOCK
      ?auto_584361 - BLOCK
      ?auto_584362 - BLOCK
      ?auto_584363 - BLOCK
      ?auto_584364 - BLOCK
    )
    :vars
    (
      ?auto_584365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584364 ?auto_584365 ) ( not ( = ?auto_584360 ?auto_584361 ) ) ( not ( = ?auto_584360 ?auto_584362 ) ) ( not ( = ?auto_584360 ?auto_584363 ) ) ( not ( = ?auto_584360 ?auto_584364 ) ) ( not ( = ?auto_584360 ?auto_584365 ) ) ( not ( = ?auto_584361 ?auto_584362 ) ) ( not ( = ?auto_584361 ?auto_584363 ) ) ( not ( = ?auto_584361 ?auto_584364 ) ) ( not ( = ?auto_584361 ?auto_584365 ) ) ( not ( = ?auto_584362 ?auto_584363 ) ) ( not ( = ?auto_584362 ?auto_584364 ) ) ( not ( = ?auto_584362 ?auto_584365 ) ) ( not ( = ?auto_584363 ?auto_584364 ) ) ( not ( = ?auto_584363 ?auto_584365 ) ) ( not ( = ?auto_584364 ?auto_584365 ) ) ( ON ?auto_584363 ?auto_584364 ) ( ON ?auto_584362 ?auto_584363 ) ( ON ?auto_584361 ?auto_584362 ) ( ON ?auto_584360 ?auto_584361 ) ( CLEAR ?auto_584360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_584360 )
      ( MAKE-5PILE ?auto_584360 ?auto_584361 ?auto_584362 ?auto_584363 ?auto_584364 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_584383 - BLOCK
      ?auto_584384 - BLOCK
      ?auto_584385 - BLOCK
      ?auto_584386 - BLOCK
      ?auto_584387 - BLOCK
      ?auto_584388 - BLOCK
    )
    :vars
    (
      ?auto_584389 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_584387 ) ( ON ?auto_584388 ?auto_584389 ) ( CLEAR ?auto_584388 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_584383 ) ( ON ?auto_584384 ?auto_584383 ) ( ON ?auto_584385 ?auto_584384 ) ( ON ?auto_584386 ?auto_584385 ) ( ON ?auto_584387 ?auto_584386 ) ( not ( = ?auto_584383 ?auto_584384 ) ) ( not ( = ?auto_584383 ?auto_584385 ) ) ( not ( = ?auto_584383 ?auto_584386 ) ) ( not ( = ?auto_584383 ?auto_584387 ) ) ( not ( = ?auto_584383 ?auto_584388 ) ) ( not ( = ?auto_584383 ?auto_584389 ) ) ( not ( = ?auto_584384 ?auto_584385 ) ) ( not ( = ?auto_584384 ?auto_584386 ) ) ( not ( = ?auto_584384 ?auto_584387 ) ) ( not ( = ?auto_584384 ?auto_584388 ) ) ( not ( = ?auto_584384 ?auto_584389 ) ) ( not ( = ?auto_584385 ?auto_584386 ) ) ( not ( = ?auto_584385 ?auto_584387 ) ) ( not ( = ?auto_584385 ?auto_584388 ) ) ( not ( = ?auto_584385 ?auto_584389 ) ) ( not ( = ?auto_584386 ?auto_584387 ) ) ( not ( = ?auto_584386 ?auto_584388 ) ) ( not ( = ?auto_584386 ?auto_584389 ) ) ( not ( = ?auto_584387 ?auto_584388 ) ) ( not ( = ?auto_584387 ?auto_584389 ) ) ( not ( = ?auto_584388 ?auto_584389 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_584388 ?auto_584389 )
      ( !STACK ?auto_584388 ?auto_584387 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_584409 - BLOCK
      ?auto_584410 - BLOCK
      ?auto_584411 - BLOCK
      ?auto_584412 - BLOCK
      ?auto_584413 - BLOCK
      ?auto_584414 - BLOCK
    )
    :vars
    (
      ?auto_584415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584414 ?auto_584415 ) ( ON-TABLE ?auto_584409 ) ( ON ?auto_584410 ?auto_584409 ) ( ON ?auto_584411 ?auto_584410 ) ( ON ?auto_584412 ?auto_584411 ) ( not ( = ?auto_584409 ?auto_584410 ) ) ( not ( = ?auto_584409 ?auto_584411 ) ) ( not ( = ?auto_584409 ?auto_584412 ) ) ( not ( = ?auto_584409 ?auto_584413 ) ) ( not ( = ?auto_584409 ?auto_584414 ) ) ( not ( = ?auto_584409 ?auto_584415 ) ) ( not ( = ?auto_584410 ?auto_584411 ) ) ( not ( = ?auto_584410 ?auto_584412 ) ) ( not ( = ?auto_584410 ?auto_584413 ) ) ( not ( = ?auto_584410 ?auto_584414 ) ) ( not ( = ?auto_584410 ?auto_584415 ) ) ( not ( = ?auto_584411 ?auto_584412 ) ) ( not ( = ?auto_584411 ?auto_584413 ) ) ( not ( = ?auto_584411 ?auto_584414 ) ) ( not ( = ?auto_584411 ?auto_584415 ) ) ( not ( = ?auto_584412 ?auto_584413 ) ) ( not ( = ?auto_584412 ?auto_584414 ) ) ( not ( = ?auto_584412 ?auto_584415 ) ) ( not ( = ?auto_584413 ?auto_584414 ) ) ( not ( = ?auto_584413 ?auto_584415 ) ) ( not ( = ?auto_584414 ?auto_584415 ) ) ( CLEAR ?auto_584412 ) ( ON ?auto_584413 ?auto_584414 ) ( CLEAR ?auto_584413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_584409 ?auto_584410 ?auto_584411 ?auto_584412 ?auto_584413 )
      ( MAKE-6PILE ?auto_584409 ?auto_584410 ?auto_584411 ?auto_584412 ?auto_584413 ?auto_584414 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_584435 - BLOCK
      ?auto_584436 - BLOCK
      ?auto_584437 - BLOCK
      ?auto_584438 - BLOCK
      ?auto_584439 - BLOCK
      ?auto_584440 - BLOCK
    )
    :vars
    (
      ?auto_584441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584440 ?auto_584441 ) ( ON-TABLE ?auto_584435 ) ( ON ?auto_584436 ?auto_584435 ) ( ON ?auto_584437 ?auto_584436 ) ( not ( = ?auto_584435 ?auto_584436 ) ) ( not ( = ?auto_584435 ?auto_584437 ) ) ( not ( = ?auto_584435 ?auto_584438 ) ) ( not ( = ?auto_584435 ?auto_584439 ) ) ( not ( = ?auto_584435 ?auto_584440 ) ) ( not ( = ?auto_584435 ?auto_584441 ) ) ( not ( = ?auto_584436 ?auto_584437 ) ) ( not ( = ?auto_584436 ?auto_584438 ) ) ( not ( = ?auto_584436 ?auto_584439 ) ) ( not ( = ?auto_584436 ?auto_584440 ) ) ( not ( = ?auto_584436 ?auto_584441 ) ) ( not ( = ?auto_584437 ?auto_584438 ) ) ( not ( = ?auto_584437 ?auto_584439 ) ) ( not ( = ?auto_584437 ?auto_584440 ) ) ( not ( = ?auto_584437 ?auto_584441 ) ) ( not ( = ?auto_584438 ?auto_584439 ) ) ( not ( = ?auto_584438 ?auto_584440 ) ) ( not ( = ?auto_584438 ?auto_584441 ) ) ( not ( = ?auto_584439 ?auto_584440 ) ) ( not ( = ?auto_584439 ?auto_584441 ) ) ( not ( = ?auto_584440 ?auto_584441 ) ) ( ON ?auto_584439 ?auto_584440 ) ( CLEAR ?auto_584437 ) ( ON ?auto_584438 ?auto_584439 ) ( CLEAR ?auto_584438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_584435 ?auto_584436 ?auto_584437 ?auto_584438 )
      ( MAKE-6PILE ?auto_584435 ?auto_584436 ?auto_584437 ?auto_584438 ?auto_584439 ?auto_584440 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_584461 - BLOCK
      ?auto_584462 - BLOCK
      ?auto_584463 - BLOCK
      ?auto_584464 - BLOCK
      ?auto_584465 - BLOCK
      ?auto_584466 - BLOCK
    )
    :vars
    (
      ?auto_584467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584466 ?auto_584467 ) ( ON-TABLE ?auto_584461 ) ( ON ?auto_584462 ?auto_584461 ) ( not ( = ?auto_584461 ?auto_584462 ) ) ( not ( = ?auto_584461 ?auto_584463 ) ) ( not ( = ?auto_584461 ?auto_584464 ) ) ( not ( = ?auto_584461 ?auto_584465 ) ) ( not ( = ?auto_584461 ?auto_584466 ) ) ( not ( = ?auto_584461 ?auto_584467 ) ) ( not ( = ?auto_584462 ?auto_584463 ) ) ( not ( = ?auto_584462 ?auto_584464 ) ) ( not ( = ?auto_584462 ?auto_584465 ) ) ( not ( = ?auto_584462 ?auto_584466 ) ) ( not ( = ?auto_584462 ?auto_584467 ) ) ( not ( = ?auto_584463 ?auto_584464 ) ) ( not ( = ?auto_584463 ?auto_584465 ) ) ( not ( = ?auto_584463 ?auto_584466 ) ) ( not ( = ?auto_584463 ?auto_584467 ) ) ( not ( = ?auto_584464 ?auto_584465 ) ) ( not ( = ?auto_584464 ?auto_584466 ) ) ( not ( = ?auto_584464 ?auto_584467 ) ) ( not ( = ?auto_584465 ?auto_584466 ) ) ( not ( = ?auto_584465 ?auto_584467 ) ) ( not ( = ?auto_584466 ?auto_584467 ) ) ( ON ?auto_584465 ?auto_584466 ) ( ON ?auto_584464 ?auto_584465 ) ( CLEAR ?auto_584462 ) ( ON ?auto_584463 ?auto_584464 ) ( CLEAR ?auto_584463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_584461 ?auto_584462 ?auto_584463 )
      ( MAKE-6PILE ?auto_584461 ?auto_584462 ?auto_584463 ?auto_584464 ?auto_584465 ?auto_584466 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_584487 - BLOCK
      ?auto_584488 - BLOCK
      ?auto_584489 - BLOCK
      ?auto_584490 - BLOCK
      ?auto_584491 - BLOCK
      ?auto_584492 - BLOCK
    )
    :vars
    (
      ?auto_584493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584492 ?auto_584493 ) ( ON-TABLE ?auto_584487 ) ( not ( = ?auto_584487 ?auto_584488 ) ) ( not ( = ?auto_584487 ?auto_584489 ) ) ( not ( = ?auto_584487 ?auto_584490 ) ) ( not ( = ?auto_584487 ?auto_584491 ) ) ( not ( = ?auto_584487 ?auto_584492 ) ) ( not ( = ?auto_584487 ?auto_584493 ) ) ( not ( = ?auto_584488 ?auto_584489 ) ) ( not ( = ?auto_584488 ?auto_584490 ) ) ( not ( = ?auto_584488 ?auto_584491 ) ) ( not ( = ?auto_584488 ?auto_584492 ) ) ( not ( = ?auto_584488 ?auto_584493 ) ) ( not ( = ?auto_584489 ?auto_584490 ) ) ( not ( = ?auto_584489 ?auto_584491 ) ) ( not ( = ?auto_584489 ?auto_584492 ) ) ( not ( = ?auto_584489 ?auto_584493 ) ) ( not ( = ?auto_584490 ?auto_584491 ) ) ( not ( = ?auto_584490 ?auto_584492 ) ) ( not ( = ?auto_584490 ?auto_584493 ) ) ( not ( = ?auto_584491 ?auto_584492 ) ) ( not ( = ?auto_584491 ?auto_584493 ) ) ( not ( = ?auto_584492 ?auto_584493 ) ) ( ON ?auto_584491 ?auto_584492 ) ( ON ?auto_584490 ?auto_584491 ) ( ON ?auto_584489 ?auto_584490 ) ( CLEAR ?auto_584487 ) ( ON ?auto_584488 ?auto_584489 ) ( CLEAR ?auto_584488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_584487 ?auto_584488 )
      ( MAKE-6PILE ?auto_584487 ?auto_584488 ?auto_584489 ?auto_584490 ?auto_584491 ?auto_584492 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_584513 - BLOCK
      ?auto_584514 - BLOCK
      ?auto_584515 - BLOCK
      ?auto_584516 - BLOCK
      ?auto_584517 - BLOCK
      ?auto_584518 - BLOCK
    )
    :vars
    (
      ?auto_584519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584518 ?auto_584519 ) ( not ( = ?auto_584513 ?auto_584514 ) ) ( not ( = ?auto_584513 ?auto_584515 ) ) ( not ( = ?auto_584513 ?auto_584516 ) ) ( not ( = ?auto_584513 ?auto_584517 ) ) ( not ( = ?auto_584513 ?auto_584518 ) ) ( not ( = ?auto_584513 ?auto_584519 ) ) ( not ( = ?auto_584514 ?auto_584515 ) ) ( not ( = ?auto_584514 ?auto_584516 ) ) ( not ( = ?auto_584514 ?auto_584517 ) ) ( not ( = ?auto_584514 ?auto_584518 ) ) ( not ( = ?auto_584514 ?auto_584519 ) ) ( not ( = ?auto_584515 ?auto_584516 ) ) ( not ( = ?auto_584515 ?auto_584517 ) ) ( not ( = ?auto_584515 ?auto_584518 ) ) ( not ( = ?auto_584515 ?auto_584519 ) ) ( not ( = ?auto_584516 ?auto_584517 ) ) ( not ( = ?auto_584516 ?auto_584518 ) ) ( not ( = ?auto_584516 ?auto_584519 ) ) ( not ( = ?auto_584517 ?auto_584518 ) ) ( not ( = ?auto_584517 ?auto_584519 ) ) ( not ( = ?auto_584518 ?auto_584519 ) ) ( ON ?auto_584517 ?auto_584518 ) ( ON ?auto_584516 ?auto_584517 ) ( ON ?auto_584515 ?auto_584516 ) ( ON ?auto_584514 ?auto_584515 ) ( ON ?auto_584513 ?auto_584514 ) ( CLEAR ?auto_584513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_584513 )
      ( MAKE-6PILE ?auto_584513 ?auto_584514 ?auto_584515 ?auto_584516 ?auto_584517 ?auto_584518 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_584540 - BLOCK
      ?auto_584541 - BLOCK
      ?auto_584542 - BLOCK
      ?auto_584543 - BLOCK
      ?auto_584544 - BLOCK
      ?auto_584545 - BLOCK
      ?auto_584546 - BLOCK
    )
    :vars
    (
      ?auto_584547 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_584545 ) ( ON ?auto_584546 ?auto_584547 ) ( CLEAR ?auto_584546 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_584540 ) ( ON ?auto_584541 ?auto_584540 ) ( ON ?auto_584542 ?auto_584541 ) ( ON ?auto_584543 ?auto_584542 ) ( ON ?auto_584544 ?auto_584543 ) ( ON ?auto_584545 ?auto_584544 ) ( not ( = ?auto_584540 ?auto_584541 ) ) ( not ( = ?auto_584540 ?auto_584542 ) ) ( not ( = ?auto_584540 ?auto_584543 ) ) ( not ( = ?auto_584540 ?auto_584544 ) ) ( not ( = ?auto_584540 ?auto_584545 ) ) ( not ( = ?auto_584540 ?auto_584546 ) ) ( not ( = ?auto_584540 ?auto_584547 ) ) ( not ( = ?auto_584541 ?auto_584542 ) ) ( not ( = ?auto_584541 ?auto_584543 ) ) ( not ( = ?auto_584541 ?auto_584544 ) ) ( not ( = ?auto_584541 ?auto_584545 ) ) ( not ( = ?auto_584541 ?auto_584546 ) ) ( not ( = ?auto_584541 ?auto_584547 ) ) ( not ( = ?auto_584542 ?auto_584543 ) ) ( not ( = ?auto_584542 ?auto_584544 ) ) ( not ( = ?auto_584542 ?auto_584545 ) ) ( not ( = ?auto_584542 ?auto_584546 ) ) ( not ( = ?auto_584542 ?auto_584547 ) ) ( not ( = ?auto_584543 ?auto_584544 ) ) ( not ( = ?auto_584543 ?auto_584545 ) ) ( not ( = ?auto_584543 ?auto_584546 ) ) ( not ( = ?auto_584543 ?auto_584547 ) ) ( not ( = ?auto_584544 ?auto_584545 ) ) ( not ( = ?auto_584544 ?auto_584546 ) ) ( not ( = ?auto_584544 ?auto_584547 ) ) ( not ( = ?auto_584545 ?auto_584546 ) ) ( not ( = ?auto_584545 ?auto_584547 ) ) ( not ( = ?auto_584546 ?auto_584547 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_584546 ?auto_584547 )
      ( !STACK ?auto_584546 ?auto_584545 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_584570 - BLOCK
      ?auto_584571 - BLOCK
      ?auto_584572 - BLOCK
      ?auto_584573 - BLOCK
      ?auto_584574 - BLOCK
      ?auto_584575 - BLOCK
      ?auto_584576 - BLOCK
    )
    :vars
    (
      ?auto_584577 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584576 ?auto_584577 ) ( ON-TABLE ?auto_584570 ) ( ON ?auto_584571 ?auto_584570 ) ( ON ?auto_584572 ?auto_584571 ) ( ON ?auto_584573 ?auto_584572 ) ( ON ?auto_584574 ?auto_584573 ) ( not ( = ?auto_584570 ?auto_584571 ) ) ( not ( = ?auto_584570 ?auto_584572 ) ) ( not ( = ?auto_584570 ?auto_584573 ) ) ( not ( = ?auto_584570 ?auto_584574 ) ) ( not ( = ?auto_584570 ?auto_584575 ) ) ( not ( = ?auto_584570 ?auto_584576 ) ) ( not ( = ?auto_584570 ?auto_584577 ) ) ( not ( = ?auto_584571 ?auto_584572 ) ) ( not ( = ?auto_584571 ?auto_584573 ) ) ( not ( = ?auto_584571 ?auto_584574 ) ) ( not ( = ?auto_584571 ?auto_584575 ) ) ( not ( = ?auto_584571 ?auto_584576 ) ) ( not ( = ?auto_584571 ?auto_584577 ) ) ( not ( = ?auto_584572 ?auto_584573 ) ) ( not ( = ?auto_584572 ?auto_584574 ) ) ( not ( = ?auto_584572 ?auto_584575 ) ) ( not ( = ?auto_584572 ?auto_584576 ) ) ( not ( = ?auto_584572 ?auto_584577 ) ) ( not ( = ?auto_584573 ?auto_584574 ) ) ( not ( = ?auto_584573 ?auto_584575 ) ) ( not ( = ?auto_584573 ?auto_584576 ) ) ( not ( = ?auto_584573 ?auto_584577 ) ) ( not ( = ?auto_584574 ?auto_584575 ) ) ( not ( = ?auto_584574 ?auto_584576 ) ) ( not ( = ?auto_584574 ?auto_584577 ) ) ( not ( = ?auto_584575 ?auto_584576 ) ) ( not ( = ?auto_584575 ?auto_584577 ) ) ( not ( = ?auto_584576 ?auto_584577 ) ) ( CLEAR ?auto_584574 ) ( ON ?auto_584575 ?auto_584576 ) ( CLEAR ?auto_584575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_584570 ?auto_584571 ?auto_584572 ?auto_584573 ?auto_584574 ?auto_584575 )
      ( MAKE-7PILE ?auto_584570 ?auto_584571 ?auto_584572 ?auto_584573 ?auto_584574 ?auto_584575 ?auto_584576 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_584600 - BLOCK
      ?auto_584601 - BLOCK
      ?auto_584602 - BLOCK
      ?auto_584603 - BLOCK
      ?auto_584604 - BLOCK
      ?auto_584605 - BLOCK
      ?auto_584606 - BLOCK
    )
    :vars
    (
      ?auto_584607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584606 ?auto_584607 ) ( ON-TABLE ?auto_584600 ) ( ON ?auto_584601 ?auto_584600 ) ( ON ?auto_584602 ?auto_584601 ) ( ON ?auto_584603 ?auto_584602 ) ( not ( = ?auto_584600 ?auto_584601 ) ) ( not ( = ?auto_584600 ?auto_584602 ) ) ( not ( = ?auto_584600 ?auto_584603 ) ) ( not ( = ?auto_584600 ?auto_584604 ) ) ( not ( = ?auto_584600 ?auto_584605 ) ) ( not ( = ?auto_584600 ?auto_584606 ) ) ( not ( = ?auto_584600 ?auto_584607 ) ) ( not ( = ?auto_584601 ?auto_584602 ) ) ( not ( = ?auto_584601 ?auto_584603 ) ) ( not ( = ?auto_584601 ?auto_584604 ) ) ( not ( = ?auto_584601 ?auto_584605 ) ) ( not ( = ?auto_584601 ?auto_584606 ) ) ( not ( = ?auto_584601 ?auto_584607 ) ) ( not ( = ?auto_584602 ?auto_584603 ) ) ( not ( = ?auto_584602 ?auto_584604 ) ) ( not ( = ?auto_584602 ?auto_584605 ) ) ( not ( = ?auto_584602 ?auto_584606 ) ) ( not ( = ?auto_584602 ?auto_584607 ) ) ( not ( = ?auto_584603 ?auto_584604 ) ) ( not ( = ?auto_584603 ?auto_584605 ) ) ( not ( = ?auto_584603 ?auto_584606 ) ) ( not ( = ?auto_584603 ?auto_584607 ) ) ( not ( = ?auto_584604 ?auto_584605 ) ) ( not ( = ?auto_584604 ?auto_584606 ) ) ( not ( = ?auto_584604 ?auto_584607 ) ) ( not ( = ?auto_584605 ?auto_584606 ) ) ( not ( = ?auto_584605 ?auto_584607 ) ) ( not ( = ?auto_584606 ?auto_584607 ) ) ( ON ?auto_584605 ?auto_584606 ) ( CLEAR ?auto_584603 ) ( ON ?auto_584604 ?auto_584605 ) ( CLEAR ?auto_584604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_584600 ?auto_584601 ?auto_584602 ?auto_584603 ?auto_584604 )
      ( MAKE-7PILE ?auto_584600 ?auto_584601 ?auto_584602 ?auto_584603 ?auto_584604 ?auto_584605 ?auto_584606 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_584630 - BLOCK
      ?auto_584631 - BLOCK
      ?auto_584632 - BLOCK
      ?auto_584633 - BLOCK
      ?auto_584634 - BLOCK
      ?auto_584635 - BLOCK
      ?auto_584636 - BLOCK
    )
    :vars
    (
      ?auto_584637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584636 ?auto_584637 ) ( ON-TABLE ?auto_584630 ) ( ON ?auto_584631 ?auto_584630 ) ( ON ?auto_584632 ?auto_584631 ) ( not ( = ?auto_584630 ?auto_584631 ) ) ( not ( = ?auto_584630 ?auto_584632 ) ) ( not ( = ?auto_584630 ?auto_584633 ) ) ( not ( = ?auto_584630 ?auto_584634 ) ) ( not ( = ?auto_584630 ?auto_584635 ) ) ( not ( = ?auto_584630 ?auto_584636 ) ) ( not ( = ?auto_584630 ?auto_584637 ) ) ( not ( = ?auto_584631 ?auto_584632 ) ) ( not ( = ?auto_584631 ?auto_584633 ) ) ( not ( = ?auto_584631 ?auto_584634 ) ) ( not ( = ?auto_584631 ?auto_584635 ) ) ( not ( = ?auto_584631 ?auto_584636 ) ) ( not ( = ?auto_584631 ?auto_584637 ) ) ( not ( = ?auto_584632 ?auto_584633 ) ) ( not ( = ?auto_584632 ?auto_584634 ) ) ( not ( = ?auto_584632 ?auto_584635 ) ) ( not ( = ?auto_584632 ?auto_584636 ) ) ( not ( = ?auto_584632 ?auto_584637 ) ) ( not ( = ?auto_584633 ?auto_584634 ) ) ( not ( = ?auto_584633 ?auto_584635 ) ) ( not ( = ?auto_584633 ?auto_584636 ) ) ( not ( = ?auto_584633 ?auto_584637 ) ) ( not ( = ?auto_584634 ?auto_584635 ) ) ( not ( = ?auto_584634 ?auto_584636 ) ) ( not ( = ?auto_584634 ?auto_584637 ) ) ( not ( = ?auto_584635 ?auto_584636 ) ) ( not ( = ?auto_584635 ?auto_584637 ) ) ( not ( = ?auto_584636 ?auto_584637 ) ) ( ON ?auto_584635 ?auto_584636 ) ( ON ?auto_584634 ?auto_584635 ) ( CLEAR ?auto_584632 ) ( ON ?auto_584633 ?auto_584634 ) ( CLEAR ?auto_584633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_584630 ?auto_584631 ?auto_584632 ?auto_584633 )
      ( MAKE-7PILE ?auto_584630 ?auto_584631 ?auto_584632 ?auto_584633 ?auto_584634 ?auto_584635 ?auto_584636 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_584660 - BLOCK
      ?auto_584661 - BLOCK
      ?auto_584662 - BLOCK
      ?auto_584663 - BLOCK
      ?auto_584664 - BLOCK
      ?auto_584665 - BLOCK
      ?auto_584666 - BLOCK
    )
    :vars
    (
      ?auto_584667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584666 ?auto_584667 ) ( ON-TABLE ?auto_584660 ) ( ON ?auto_584661 ?auto_584660 ) ( not ( = ?auto_584660 ?auto_584661 ) ) ( not ( = ?auto_584660 ?auto_584662 ) ) ( not ( = ?auto_584660 ?auto_584663 ) ) ( not ( = ?auto_584660 ?auto_584664 ) ) ( not ( = ?auto_584660 ?auto_584665 ) ) ( not ( = ?auto_584660 ?auto_584666 ) ) ( not ( = ?auto_584660 ?auto_584667 ) ) ( not ( = ?auto_584661 ?auto_584662 ) ) ( not ( = ?auto_584661 ?auto_584663 ) ) ( not ( = ?auto_584661 ?auto_584664 ) ) ( not ( = ?auto_584661 ?auto_584665 ) ) ( not ( = ?auto_584661 ?auto_584666 ) ) ( not ( = ?auto_584661 ?auto_584667 ) ) ( not ( = ?auto_584662 ?auto_584663 ) ) ( not ( = ?auto_584662 ?auto_584664 ) ) ( not ( = ?auto_584662 ?auto_584665 ) ) ( not ( = ?auto_584662 ?auto_584666 ) ) ( not ( = ?auto_584662 ?auto_584667 ) ) ( not ( = ?auto_584663 ?auto_584664 ) ) ( not ( = ?auto_584663 ?auto_584665 ) ) ( not ( = ?auto_584663 ?auto_584666 ) ) ( not ( = ?auto_584663 ?auto_584667 ) ) ( not ( = ?auto_584664 ?auto_584665 ) ) ( not ( = ?auto_584664 ?auto_584666 ) ) ( not ( = ?auto_584664 ?auto_584667 ) ) ( not ( = ?auto_584665 ?auto_584666 ) ) ( not ( = ?auto_584665 ?auto_584667 ) ) ( not ( = ?auto_584666 ?auto_584667 ) ) ( ON ?auto_584665 ?auto_584666 ) ( ON ?auto_584664 ?auto_584665 ) ( ON ?auto_584663 ?auto_584664 ) ( CLEAR ?auto_584661 ) ( ON ?auto_584662 ?auto_584663 ) ( CLEAR ?auto_584662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_584660 ?auto_584661 ?auto_584662 )
      ( MAKE-7PILE ?auto_584660 ?auto_584661 ?auto_584662 ?auto_584663 ?auto_584664 ?auto_584665 ?auto_584666 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_584690 - BLOCK
      ?auto_584691 - BLOCK
      ?auto_584692 - BLOCK
      ?auto_584693 - BLOCK
      ?auto_584694 - BLOCK
      ?auto_584695 - BLOCK
      ?auto_584696 - BLOCK
    )
    :vars
    (
      ?auto_584697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584696 ?auto_584697 ) ( ON-TABLE ?auto_584690 ) ( not ( = ?auto_584690 ?auto_584691 ) ) ( not ( = ?auto_584690 ?auto_584692 ) ) ( not ( = ?auto_584690 ?auto_584693 ) ) ( not ( = ?auto_584690 ?auto_584694 ) ) ( not ( = ?auto_584690 ?auto_584695 ) ) ( not ( = ?auto_584690 ?auto_584696 ) ) ( not ( = ?auto_584690 ?auto_584697 ) ) ( not ( = ?auto_584691 ?auto_584692 ) ) ( not ( = ?auto_584691 ?auto_584693 ) ) ( not ( = ?auto_584691 ?auto_584694 ) ) ( not ( = ?auto_584691 ?auto_584695 ) ) ( not ( = ?auto_584691 ?auto_584696 ) ) ( not ( = ?auto_584691 ?auto_584697 ) ) ( not ( = ?auto_584692 ?auto_584693 ) ) ( not ( = ?auto_584692 ?auto_584694 ) ) ( not ( = ?auto_584692 ?auto_584695 ) ) ( not ( = ?auto_584692 ?auto_584696 ) ) ( not ( = ?auto_584692 ?auto_584697 ) ) ( not ( = ?auto_584693 ?auto_584694 ) ) ( not ( = ?auto_584693 ?auto_584695 ) ) ( not ( = ?auto_584693 ?auto_584696 ) ) ( not ( = ?auto_584693 ?auto_584697 ) ) ( not ( = ?auto_584694 ?auto_584695 ) ) ( not ( = ?auto_584694 ?auto_584696 ) ) ( not ( = ?auto_584694 ?auto_584697 ) ) ( not ( = ?auto_584695 ?auto_584696 ) ) ( not ( = ?auto_584695 ?auto_584697 ) ) ( not ( = ?auto_584696 ?auto_584697 ) ) ( ON ?auto_584695 ?auto_584696 ) ( ON ?auto_584694 ?auto_584695 ) ( ON ?auto_584693 ?auto_584694 ) ( ON ?auto_584692 ?auto_584693 ) ( CLEAR ?auto_584690 ) ( ON ?auto_584691 ?auto_584692 ) ( CLEAR ?auto_584691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_584690 ?auto_584691 )
      ( MAKE-7PILE ?auto_584690 ?auto_584691 ?auto_584692 ?auto_584693 ?auto_584694 ?auto_584695 ?auto_584696 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_584720 - BLOCK
      ?auto_584721 - BLOCK
      ?auto_584722 - BLOCK
      ?auto_584723 - BLOCK
      ?auto_584724 - BLOCK
      ?auto_584725 - BLOCK
      ?auto_584726 - BLOCK
    )
    :vars
    (
      ?auto_584727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584726 ?auto_584727 ) ( not ( = ?auto_584720 ?auto_584721 ) ) ( not ( = ?auto_584720 ?auto_584722 ) ) ( not ( = ?auto_584720 ?auto_584723 ) ) ( not ( = ?auto_584720 ?auto_584724 ) ) ( not ( = ?auto_584720 ?auto_584725 ) ) ( not ( = ?auto_584720 ?auto_584726 ) ) ( not ( = ?auto_584720 ?auto_584727 ) ) ( not ( = ?auto_584721 ?auto_584722 ) ) ( not ( = ?auto_584721 ?auto_584723 ) ) ( not ( = ?auto_584721 ?auto_584724 ) ) ( not ( = ?auto_584721 ?auto_584725 ) ) ( not ( = ?auto_584721 ?auto_584726 ) ) ( not ( = ?auto_584721 ?auto_584727 ) ) ( not ( = ?auto_584722 ?auto_584723 ) ) ( not ( = ?auto_584722 ?auto_584724 ) ) ( not ( = ?auto_584722 ?auto_584725 ) ) ( not ( = ?auto_584722 ?auto_584726 ) ) ( not ( = ?auto_584722 ?auto_584727 ) ) ( not ( = ?auto_584723 ?auto_584724 ) ) ( not ( = ?auto_584723 ?auto_584725 ) ) ( not ( = ?auto_584723 ?auto_584726 ) ) ( not ( = ?auto_584723 ?auto_584727 ) ) ( not ( = ?auto_584724 ?auto_584725 ) ) ( not ( = ?auto_584724 ?auto_584726 ) ) ( not ( = ?auto_584724 ?auto_584727 ) ) ( not ( = ?auto_584725 ?auto_584726 ) ) ( not ( = ?auto_584725 ?auto_584727 ) ) ( not ( = ?auto_584726 ?auto_584727 ) ) ( ON ?auto_584725 ?auto_584726 ) ( ON ?auto_584724 ?auto_584725 ) ( ON ?auto_584723 ?auto_584724 ) ( ON ?auto_584722 ?auto_584723 ) ( ON ?auto_584721 ?auto_584722 ) ( ON ?auto_584720 ?auto_584721 ) ( CLEAR ?auto_584720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_584720 )
      ( MAKE-7PILE ?auto_584720 ?auto_584721 ?auto_584722 ?auto_584723 ?auto_584724 ?auto_584725 ?auto_584726 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_584751 - BLOCK
      ?auto_584752 - BLOCK
      ?auto_584753 - BLOCK
      ?auto_584754 - BLOCK
      ?auto_584755 - BLOCK
      ?auto_584756 - BLOCK
      ?auto_584757 - BLOCK
      ?auto_584758 - BLOCK
    )
    :vars
    (
      ?auto_584759 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_584757 ) ( ON ?auto_584758 ?auto_584759 ) ( CLEAR ?auto_584758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_584751 ) ( ON ?auto_584752 ?auto_584751 ) ( ON ?auto_584753 ?auto_584752 ) ( ON ?auto_584754 ?auto_584753 ) ( ON ?auto_584755 ?auto_584754 ) ( ON ?auto_584756 ?auto_584755 ) ( ON ?auto_584757 ?auto_584756 ) ( not ( = ?auto_584751 ?auto_584752 ) ) ( not ( = ?auto_584751 ?auto_584753 ) ) ( not ( = ?auto_584751 ?auto_584754 ) ) ( not ( = ?auto_584751 ?auto_584755 ) ) ( not ( = ?auto_584751 ?auto_584756 ) ) ( not ( = ?auto_584751 ?auto_584757 ) ) ( not ( = ?auto_584751 ?auto_584758 ) ) ( not ( = ?auto_584751 ?auto_584759 ) ) ( not ( = ?auto_584752 ?auto_584753 ) ) ( not ( = ?auto_584752 ?auto_584754 ) ) ( not ( = ?auto_584752 ?auto_584755 ) ) ( not ( = ?auto_584752 ?auto_584756 ) ) ( not ( = ?auto_584752 ?auto_584757 ) ) ( not ( = ?auto_584752 ?auto_584758 ) ) ( not ( = ?auto_584752 ?auto_584759 ) ) ( not ( = ?auto_584753 ?auto_584754 ) ) ( not ( = ?auto_584753 ?auto_584755 ) ) ( not ( = ?auto_584753 ?auto_584756 ) ) ( not ( = ?auto_584753 ?auto_584757 ) ) ( not ( = ?auto_584753 ?auto_584758 ) ) ( not ( = ?auto_584753 ?auto_584759 ) ) ( not ( = ?auto_584754 ?auto_584755 ) ) ( not ( = ?auto_584754 ?auto_584756 ) ) ( not ( = ?auto_584754 ?auto_584757 ) ) ( not ( = ?auto_584754 ?auto_584758 ) ) ( not ( = ?auto_584754 ?auto_584759 ) ) ( not ( = ?auto_584755 ?auto_584756 ) ) ( not ( = ?auto_584755 ?auto_584757 ) ) ( not ( = ?auto_584755 ?auto_584758 ) ) ( not ( = ?auto_584755 ?auto_584759 ) ) ( not ( = ?auto_584756 ?auto_584757 ) ) ( not ( = ?auto_584756 ?auto_584758 ) ) ( not ( = ?auto_584756 ?auto_584759 ) ) ( not ( = ?auto_584757 ?auto_584758 ) ) ( not ( = ?auto_584757 ?auto_584759 ) ) ( not ( = ?auto_584758 ?auto_584759 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_584758 ?auto_584759 )
      ( !STACK ?auto_584758 ?auto_584757 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_584785 - BLOCK
      ?auto_584786 - BLOCK
      ?auto_584787 - BLOCK
      ?auto_584788 - BLOCK
      ?auto_584789 - BLOCK
      ?auto_584790 - BLOCK
      ?auto_584791 - BLOCK
      ?auto_584792 - BLOCK
    )
    :vars
    (
      ?auto_584793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584792 ?auto_584793 ) ( ON-TABLE ?auto_584785 ) ( ON ?auto_584786 ?auto_584785 ) ( ON ?auto_584787 ?auto_584786 ) ( ON ?auto_584788 ?auto_584787 ) ( ON ?auto_584789 ?auto_584788 ) ( ON ?auto_584790 ?auto_584789 ) ( not ( = ?auto_584785 ?auto_584786 ) ) ( not ( = ?auto_584785 ?auto_584787 ) ) ( not ( = ?auto_584785 ?auto_584788 ) ) ( not ( = ?auto_584785 ?auto_584789 ) ) ( not ( = ?auto_584785 ?auto_584790 ) ) ( not ( = ?auto_584785 ?auto_584791 ) ) ( not ( = ?auto_584785 ?auto_584792 ) ) ( not ( = ?auto_584785 ?auto_584793 ) ) ( not ( = ?auto_584786 ?auto_584787 ) ) ( not ( = ?auto_584786 ?auto_584788 ) ) ( not ( = ?auto_584786 ?auto_584789 ) ) ( not ( = ?auto_584786 ?auto_584790 ) ) ( not ( = ?auto_584786 ?auto_584791 ) ) ( not ( = ?auto_584786 ?auto_584792 ) ) ( not ( = ?auto_584786 ?auto_584793 ) ) ( not ( = ?auto_584787 ?auto_584788 ) ) ( not ( = ?auto_584787 ?auto_584789 ) ) ( not ( = ?auto_584787 ?auto_584790 ) ) ( not ( = ?auto_584787 ?auto_584791 ) ) ( not ( = ?auto_584787 ?auto_584792 ) ) ( not ( = ?auto_584787 ?auto_584793 ) ) ( not ( = ?auto_584788 ?auto_584789 ) ) ( not ( = ?auto_584788 ?auto_584790 ) ) ( not ( = ?auto_584788 ?auto_584791 ) ) ( not ( = ?auto_584788 ?auto_584792 ) ) ( not ( = ?auto_584788 ?auto_584793 ) ) ( not ( = ?auto_584789 ?auto_584790 ) ) ( not ( = ?auto_584789 ?auto_584791 ) ) ( not ( = ?auto_584789 ?auto_584792 ) ) ( not ( = ?auto_584789 ?auto_584793 ) ) ( not ( = ?auto_584790 ?auto_584791 ) ) ( not ( = ?auto_584790 ?auto_584792 ) ) ( not ( = ?auto_584790 ?auto_584793 ) ) ( not ( = ?auto_584791 ?auto_584792 ) ) ( not ( = ?auto_584791 ?auto_584793 ) ) ( not ( = ?auto_584792 ?auto_584793 ) ) ( CLEAR ?auto_584790 ) ( ON ?auto_584791 ?auto_584792 ) ( CLEAR ?auto_584791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_584785 ?auto_584786 ?auto_584787 ?auto_584788 ?auto_584789 ?auto_584790 ?auto_584791 )
      ( MAKE-8PILE ?auto_584785 ?auto_584786 ?auto_584787 ?auto_584788 ?auto_584789 ?auto_584790 ?auto_584791 ?auto_584792 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_584819 - BLOCK
      ?auto_584820 - BLOCK
      ?auto_584821 - BLOCK
      ?auto_584822 - BLOCK
      ?auto_584823 - BLOCK
      ?auto_584824 - BLOCK
      ?auto_584825 - BLOCK
      ?auto_584826 - BLOCK
    )
    :vars
    (
      ?auto_584827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584826 ?auto_584827 ) ( ON-TABLE ?auto_584819 ) ( ON ?auto_584820 ?auto_584819 ) ( ON ?auto_584821 ?auto_584820 ) ( ON ?auto_584822 ?auto_584821 ) ( ON ?auto_584823 ?auto_584822 ) ( not ( = ?auto_584819 ?auto_584820 ) ) ( not ( = ?auto_584819 ?auto_584821 ) ) ( not ( = ?auto_584819 ?auto_584822 ) ) ( not ( = ?auto_584819 ?auto_584823 ) ) ( not ( = ?auto_584819 ?auto_584824 ) ) ( not ( = ?auto_584819 ?auto_584825 ) ) ( not ( = ?auto_584819 ?auto_584826 ) ) ( not ( = ?auto_584819 ?auto_584827 ) ) ( not ( = ?auto_584820 ?auto_584821 ) ) ( not ( = ?auto_584820 ?auto_584822 ) ) ( not ( = ?auto_584820 ?auto_584823 ) ) ( not ( = ?auto_584820 ?auto_584824 ) ) ( not ( = ?auto_584820 ?auto_584825 ) ) ( not ( = ?auto_584820 ?auto_584826 ) ) ( not ( = ?auto_584820 ?auto_584827 ) ) ( not ( = ?auto_584821 ?auto_584822 ) ) ( not ( = ?auto_584821 ?auto_584823 ) ) ( not ( = ?auto_584821 ?auto_584824 ) ) ( not ( = ?auto_584821 ?auto_584825 ) ) ( not ( = ?auto_584821 ?auto_584826 ) ) ( not ( = ?auto_584821 ?auto_584827 ) ) ( not ( = ?auto_584822 ?auto_584823 ) ) ( not ( = ?auto_584822 ?auto_584824 ) ) ( not ( = ?auto_584822 ?auto_584825 ) ) ( not ( = ?auto_584822 ?auto_584826 ) ) ( not ( = ?auto_584822 ?auto_584827 ) ) ( not ( = ?auto_584823 ?auto_584824 ) ) ( not ( = ?auto_584823 ?auto_584825 ) ) ( not ( = ?auto_584823 ?auto_584826 ) ) ( not ( = ?auto_584823 ?auto_584827 ) ) ( not ( = ?auto_584824 ?auto_584825 ) ) ( not ( = ?auto_584824 ?auto_584826 ) ) ( not ( = ?auto_584824 ?auto_584827 ) ) ( not ( = ?auto_584825 ?auto_584826 ) ) ( not ( = ?auto_584825 ?auto_584827 ) ) ( not ( = ?auto_584826 ?auto_584827 ) ) ( ON ?auto_584825 ?auto_584826 ) ( CLEAR ?auto_584823 ) ( ON ?auto_584824 ?auto_584825 ) ( CLEAR ?auto_584824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_584819 ?auto_584820 ?auto_584821 ?auto_584822 ?auto_584823 ?auto_584824 )
      ( MAKE-8PILE ?auto_584819 ?auto_584820 ?auto_584821 ?auto_584822 ?auto_584823 ?auto_584824 ?auto_584825 ?auto_584826 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_584853 - BLOCK
      ?auto_584854 - BLOCK
      ?auto_584855 - BLOCK
      ?auto_584856 - BLOCK
      ?auto_584857 - BLOCK
      ?auto_584858 - BLOCK
      ?auto_584859 - BLOCK
      ?auto_584860 - BLOCK
    )
    :vars
    (
      ?auto_584861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584860 ?auto_584861 ) ( ON-TABLE ?auto_584853 ) ( ON ?auto_584854 ?auto_584853 ) ( ON ?auto_584855 ?auto_584854 ) ( ON ?auto_584856 ?auto_584855 ) ( not ( = ?auto_584853 ?auto_584854 ) ) ( not ( = ?auto_584853 ?auto_584855 ) ) ( not ( = ?auto_584853 ?auto_584856 ) ) ( not ( = ?auto_584853 ?auto_584857 ) ) ( not ( = ?auto_584853 ?auto_584858 ) ) ( not ( = ?auto_584853 ?auto_584859 ) ) ( not ( = ?auto_584853 ?auto_584860 ) ) ( not ( = ?auto_584853 ?auto_584861 ) ) ( not ( = ?auto_584854 ?auto_584855 ) ) ( not ( = ?auto_584854 ?auto_584856 ) ) ( not ( = ?auto_584854 ?auto_584857 ) ) ( not ( = ?auto_584854 ?auto_584858 ) ) ( not ( = ?auto_584854 ?auto_584859 ) ) ( not ( = ?auto_584854 ?auto_584860 ) ) ( not ( = ?auto_584854 ?auto_584861 ) ) ( not ( = ?auto_584855 ?auto_584856 ) ) ( not ( = ?auto_584855 ?auto_584857 ) ) ( not ( = ?auto_584855 ?auto_584858 ) ) ( not ( = ?auto_584855 ?auto_584859 ) ) ( not ( = ?auto_584855 ?auto_584860 ) ) ( not ( = ?auto_584855 ?auto_584861 ) ) ( not ( = ?auto_584856 ?auto_584857 ) ) ( not ( = ?auto_584856 ?auto_584858 ) ) ( not ( = ?auto_584856 ?auto_584859 ) ) ( not ( = ?auto_584856 ?auto_584860 ) ) ( not ( = ?auto_584856 ?auto_584861 ) ) ( not ( = ?auto_584857 ?auto_584858 ) ) ( not ( = ?auto_584857 ?auto_584859 ) ) ( not ( = ?auto_584857 ?auto_584860 ) ) ( not ( = ?auto_584857 ?auto_584861 ) ) ( not ( = ?auto_584858 ?auto_584859 ) ) ( not ( = ?auto_584858 ?auto_584860 ) ) ( not ( = ?auto_584858 ?auto_584861 ) ) ( not ( = ?auto_584859 ?auto_584860 ) ) ( not ( = ?auto_584859 ?auto_584861 ) ) ( not ( = ?auto_584860 ?auto_584861 ) ) ( ON ?auto_584859 ?auto_584860 ) ( ON ?auto_584858 ?auto_584859 ) ( CLEAR ?auto_584856 ) ( ON ?auto_584857 ?auto_584858 ) ( CLEAR ?auto_584857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_584853 ?auto_584854 ?auto_584855 ?auto_584856 ?auto_584857 )
      ( MAKE-8PILE ?auto_584853 ?auto_584854 ?auto_584855 ?auto_584856 ?auto_584857 ?auto_584858 ?auto_584859 ?auto_584860 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_584887 - BLOCK
      ?auto_584888 - BLOCK
      ?auto_584889 - BLOCK
      ?auto_584890 - BLOCK
      ?auto_584891 - BLOCK
      ?auto_584892 - BLOCK
      ?auto_584893 - BLOCK
      ?auto_584894 - BLOCK
    )
    :vars
    (
      ?auto_584895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584894 ?auto_584895 ) ( ON-TABLE ?auto_584887 ) ( ON ?auto_584888 ?auto_584887 ) ( ON ?auto_584889 ?auto_584888 ) ( not ( = ?auto_584887 ?auto_584888 ) ) ( not ( = ?auto_584887 ?auto_584889 ) ) ( not ( = ?auto_584887 ?auto_584890 ) ) ( not ( = ?auto_584887 ?auto_584891 ) ) ( not ( = ?auto_584887 ?auto_584892 ) ) ( not ( = ?auto_584887 ?auto_584893 ) ) ( not ( = ?auto_584887 ?auto_584894 ) ) ( not ( = ?auto_584887 ?auto_584895 ) ) ( not ( = ?auto_584888 ?auto_584889 ) ) ( not ( = ?auto_584888 ?auto_584890 ) ) ( not ( = ?auto_584888 ?auto_584891 ) ) ( not ( = ?auto_584888 ?auto_584892 ) ) ( not ( = ?auto_584888 ?auto_584893 ) ) ( not ( = ?auto_584888 ?auto_584894 ) ) ( not ( = ?auto_584888 ?auto_584895 ) ) ( not ( = ?auto_584889 ?auto_584890 ) ) ( not ( = ?auto_584889 ?auto_584891 ) ) ( not ( = ?auto_584889 ?auto_584892 ) ) ( not ( = ?auto_584889 ?auto_584893 ) ) ( not ( = ?auto_584889 ?auto_584894 ) ) ( not ( = ?auto_584889 ?auto_584895 ) ) ( not ( = ?auto_584890 ?auto_584891 ) ) ( not ( = ?auto_584890 ?auto_584892 ) ) ( not ( = ?auto_584890 ?auto_584893 ) ) ( not ( = ?auto_584890 ?auto_584894 ) ) ( not ( = ?auto_584890 ?auto_584895 ) ) ( not ( = ?auto_584891 ?auto_584892 ) ) ( not ( = ?auto_584891 ?auto_584893 ) ) ( not ( = ?auto_584891 ?auto_584894 ) ) ( not ( = ?auto_584891 ?auto_584895 ) ) ( not ( = ?auto_584892 ?auto_584893 ) ) ( not ( = ?auto_584892 ?auto_584894 ) ) ( not ( = ?auto_584892 ?auto_584895 ) ) ( not ( = ?auto_584893 ?auto_584894 ) ) ( not ( = ?auto_584893 ?auto_584895 ) ) ( not ( = ?auto_584894 ?auto_584895 ) ) ( ON ?auto_584893 ?auto_584894 ) ( ON ?auto_584892 ?auto_584893 ) ( ON ?auto_584891 ?auto_584892 ) ( CLEAR ?auto_584889 ) ( ON ?auto_584890 ?auto_584891 ) ( CLEAR ?auto_584890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_584887 ?auto_584888 ?auto_584889 ?auto_584890 )
      ( MAKE-8PILE ?auto_584887 ?auto_584888 ?auto_584889 ?auto_584890 ?auto_584891 ?auto_584892 ?auto_584893 ?auto_584894 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_584921 - BLOCK
      ?auto_584922 - BLOCK
      ?auto_584923 - BLOCK
      ?auto_584924 - BLOCK
      ?auto_584925 - BLOCK
      ?auto_584926 - BLOCK
      ?auto_584927 - BLOCK
      ?auto_584928 - BLOCK
    )
    :vars
    (
      ?auto_584929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584928 ?auto_584929 ) ( ON-TABLE ?auto_584921 ) ( ON ?auto_584922 ?auto_584921 ) ( not ( = ?auto_584921 ?auto_584922 ) ) ( not ( = ?auto_584921 ?auto_584923 ) ) ( not ( = ?auto_584921 ?auto_584924 ) ) ( not ( = ?auto_584921 ?auto_584925 ) ) ( not ( = ?auto_584921 ?auto_584926 ) ) ( not ( = ?auto_584921 ?auto_584927 ) ) ( not ( = ?auto_584921 ?auto_584928 ) ) ( not ( = ?auto_584921 ?auto_584929 ) ) ( not ( = ?auto_584922 ?auto_584923 ) ) ( not ( = ?auto_584922 ?auto_584924 ) ) ( not ( = ?auto_584922 ?auto_584925 ) ) ( not ( = ?auto_584922 ?auto_584926 ) ) ( not ( = ?auto_584922 ?auto_584927 ) ) ( not ( = ?auto_584922 ?auto_584928 ) ) ( not ( = ?auto_584922 ?auto_584929 ) ) ( not ( = ?auto_584923 ?auto_584924 ) ) ( not ( = ?auto_584923 ?auto_584925 ) ) ( not ( = ?auto_584923 ?auto_584926 ) ) ( not ( = ?auto_584923 ?auto_584927 ) ) ( not ( = ?auto_584923 ?auto_584928 ) ) ( not ( = ?auto_584923 ?auto_584929 ) ) ( not ( = ?auto_584924 ?auto_584925 ) ) ( not ( = ?auto_584924 ?auto_584926 ) ) ( not ( = ?auto_584924 ?auto_584927 ) ) ( not ( = ?auto_584924 ?auto_584928 ) ) ( not ( = ?auto_584924 ?auto_584929 ) ) ( not ( = ?auto_584925 ?auto_584926 ) ) ( not ( = ?auto_584925 ?auto_584927 ) ) ( not ( = ?auto_584925 ?auto_584928 ) ) ( not ( = ?auto_584925 ?auto_584929 ) ) ( not ( = ?auto_584926 ?auto_584927 ) ) ( not ( = ?auto_584926 ?auto_584928 ) ) ( not ( = ?auto_584926 ?auto_584929 ) ) ( not ( = ?auto_584927 ?auto_584928 ) ) ( not ( = ?auto_584927 ?auto_584929 ) ) ( not ( = ?auto_584928 ?auto_584929 ) ) ( ON ?auto_584927 ?auto_584928 ) ( ON ?auto_584926 ?auto_584927 ) ( ON ?auto_584925 ?auto_584926 ) ( ON ?auto_584924 ?auto_584925 ) ( CLEAR ?auto_584922 ) ( ON ?auto_584923 ?auto_584924 ) ( CLEAR ?auto_584923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_584921 ?auto_584922 ?auto_584923 )
      ( MAKE-8PILE ?auto_584921 ?auto_584922 ?auto_584923 ?auto_584924 ?auto_584925 ?auto_584926 ?auto_584927 ?auto_584928 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_584955 - BLOCK
      ?auto_584956 - BLOCK
      ?auto_584957 - BLOCK
      ?auto_584958 - BLOCK
      ?auto_584959 - BLOCK
      ?auto_584960 - BLOCK
      ?auto_584961 - BLOCK
      ?auto_584962 - BLOCK
    )
    :vars
    (
      ?auto_584963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584962 ?auto_584963 ) ( ON-TABLE ?auto_584955 ) ( not ( = ?auto_584955 ?auto_584956 ) ) ( not ( = ?auto_584955 ?auto_584957 ) ) ( not ( = ?auto_584955 ?auto_584958 ) ) ( not ( = ?auto_584955 ?auto_584959 ) ) ( not ( = ?auto_584955 ?auto_584960 ) ) ( not ( = ?auto_584955 ?auto_584961 ) ) ( not ( = ?auto_584955 ?auto_584962 ) ) ( not ( = ?auto_584955 ?auto_584963 ) ) ( not ( = ?auto_584956 ?auto_584957 ) ) ( not ( = ?auto_584956 ?auto_584958 ) ) ( not ( = ?auto_584956 ?auto_584959 ) ) ( not ( = ?auto_584956 ?auto_584960 ) ) ( not ( = ?auto_584956 ?auto_584961 ) ) ( not ( = ?auto_584956 ?auto_584962 ) ) ( not ( = ?auto_584956 ?auto_584963 ) ) ( not ( = ?auto_584957 ?auto_584958 ) ) ( not ( = ?auto_584957 ?auto_584959 ) ) ( not ( = ?auto_584957 ?auto_584960 ) ) ( not ( = ?auto_584957 ?auto_584961 ) ) ( not ( = ?auto_584957 ?auto_584962 ) ) ( not ( = ?auto_584957 ?auto_584963 ) ) ( not ( = ?auto_584958 ?auto_584959 ) ) ( not ( = ?auto_584958 ?auto_584960 ) ) ( not ( = ?auto_584958 ?auto_584961 ) ) ( not ( = ?auto_584958 ?auto_584962 ) ) ( not ( = ?auto_584958 ?auto_584963 ) ) ( not ( = ?auto_584959 ?auto_584960 ) ) ( not ( = ?auto_584959 ?auto_584961 ) ) ( not ( = ?auto_584959 ?auto_584962 ) ) ( not ( = ?auto_584959 ?auto_584963 ) ) ( not ( = ?auto_584960 ?auto_584961 ) ) ( not ( = ?auto_584960 ?auto_584962 ) ) ( not ( = ?auto_584960 ?auto_584963 ) ) ( not ( = ?auto_584961 ?auto_584962 ) ) ( not ( = ?auto_584961 ?auto_584963 ) ) ( not ( = ?auto_584962 ?auto_584963 ) ) ( ON ?auto_584961 ?auto_584962 ) ( ON ?auto_584960 ?auto_584961 ) ( ON ?auto_584959 ?auto_584960 ) ( ON ?auto_584958 ?auto_584959 ) ( ON ?auto_584957 ?auto_584958 ) ( CLEAR ?auto_584955 ) ( ON ?auto_584956 ?auto_584957 ) ( CLEAR ?auto_584956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_584955 ?auto_584956 )
      ( MAKE-8PILE ?auto_584955 ?auto_584956 ?auto_584957 ?auto_584958 ?auto_584959 ?auto_584960 ?auto_584961 ?auto_584962 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_584989 - BLOCK
      ?auto_584990 - BLOCK
      ?auto_584991 - BLOCK
      ?auto_584992 - BLOCK
      ?auto_584993 - BLOCK
      ?auto_584994 - BLOCK
      ?auto_584995 - BLOCK
      ?auto_584996 - BLOCK
    )
    :vars
    (
      ?auto_584997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_584996 ?auto_584997 ) ( not ( = ?auto_584989 ?auto_584990 ) ) ( not ( = ?auto_584989 ?auto_584991 ) ) ( not ( = ?auto_584989 ?auto_584992 ) ) ( not ( = ?auto_584989 ?auto_584993 ) ) ( not ( = ?auto_584989 ?auto_584994 ) ) ( not ( = ?auto_584989 ?auto_584995 ) ) ( not ( = ?auto_584989 ?auto_584996 ) ) ( not ( = ?auto_584989 ?auto_584997 ) ) ( not ( = ?auto_584990 ?auto_584991 ) ) ( not ( = ?auto_584990 ?auto_584992 ) ) ( not ( = ?auto_584990 ?auto_584993 ) ) ( not ( = ?auto_584990 ?auto_584994 ) ) ( not ( = ?auto_584990 ?auto_584995 ) ) ( not ( = ?auto_584990 ?auto_584996 ) ) ( not ( = ?auto_584990 ?auto_584997 ) ) ( not ( = ?auto_584991 ?auto_584992 ) ) ( not ( = ?auto_584991 ?auto_584993 ) ) ( not ( = ?auto_584991 ?auto_584994 ) ) ( not ( = ?auto_584991 ?auto_584995 ) ) ( not ( = ?auto_584991 ?auto_584996 ) ) ( not ( = ?auto_584991 ?auto_584997 ) ) ( not ( = ?auto_584992 ?auto_584993 ) ) ( not ( = ?auto_584992 ?auto_584994 ) ) ( not ( = ?auto_584992 ?auto_584995 ) ) ( not ( = ?auto_584992 ?auto_584996 ) ) ( not ( = ?auto_584992 ?auto_584997 ) ) ( not ( = ?auto_584993 ?auto_584994 ) ) ( not ( = ?auto_584993 ?auto_584995 ) ) ( not ( = ?auto_584993 ?auto_584996 ) ) ( not ( = ?auto_584993 ?auto_584997 ) ) ( not ( = ?auto_584994 ?auto_584995 ) ) ( not ( = ?auto_584994 ?auto_584996 ) ) ( not ( = ?auto_584994 ?auto_584997 ) ) ( not ( = ?auto_584995 ?auto_584996 ) ) ( not ( = ?auto_584995 ?auto_584997 ) ) ( not ( = ?auto_584996 ?auto_584997 ) ) ( ON ?auto_584995 ?auto_584996 ) ( ON ?auto_584994 ?auto_584995 ) ( ON ?auto_584993 ?auto_584994 ) ( ON ?auto_584992 ?auto_584993 ) ( ON ?auto_584991 ?auto_584992 ) ( ON ?auto_584990 ?auto_584991 ) ( ON ?auto_584989 ?auto_584990 ) ( CLEAR ?auto_584989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_584989 )
      ( MAKE-8PILE ?auto_584989 ?auto_584990 ?auto_584991 ?auto_584992 ?auto_584993 ?auto_584994 ?auto_584995 ?auto_584996 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_585024 - BLOCK
      ?auto_585025 - BLOCK
      ?auto_585026 - BLOCK
      ?auto_585027 - BLOCK
      ?auto_585028 - BLOCK
      ?auto_585029 - BLOCK
      ?auto_585030 - BLOCK
      ?auto_585031 - BLOCK
      ?auto_585032 - BLOCK
    )
    :vars
    (
      ?auto_585033 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_585031 ) ( ON ?auto_585032 ?auto_585033 ) ( CLEAR ?auto_585032 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_585024 ) ( ON ?auto_585025 ?auto_585024 ) ( ON ?auto_585026 ?auto_585025 ) ( ON ?auto_585027 ?auto_585026 ) ( ON ?auto_585028 ?auto_585027 ) ( ON ?auto_585029 ?auto_585028 ) ( ON ?auto_585030 ?auto_585029 ) ( ON ?auto_585031 ?auto_585030 ) ( not ( = ?auto_585024 ?auto_585025 ) ) ( not ( = ?auto_585024 ?auto_585026 ) ) ( not ( = ?auto_585024 ?auto_585027 ) ) ( not ( = ?auto_585024 ?auto_585028 ) ) ( not ( = ?auto_585024 ?auto_585029 ) ) ( not ( = ?auto_585024 ?auto_585030 ) ) ( not ( = ?auto_585024 ?auto_585031 ) ) ( not ( = ?auto_585024 ?auto_585032 ) ) ( not ( = ?auto_585024 ?auto_585033 ) ) ( not ( = ?auto_585025 ?auto_585026 ) ) ( not ( = ?auto_585025 ?auto_585027 ) ) ( not ( = ?auto_585025 ?auto_585028 ) ) ( not ( = ?auto_585025 ?auto_585029 ) ) ( not ( = ?auto_585025 ?auto_585030 ) ) ( not ( = ?auto_585025 ?auto_585031 ) ) ( not ( = ?auto_585025 ?auto_585032 ) ) ( not ( = ?auto_585025 ?auto_585033 ) ) ( not ( = ?auto_585026 ?auto_585027 ) ) ( not ( = ?auto_585026 ?auto_585028 ) ) ( not ( = ?auto_585026 ?auto_585029 ) ) ( not ( = ?auto_585026 ?auto_585030 ) ) ( not ( = ?auto_585026 ?auto_585031 ) ) ( not ( = ?auto_585026 ?auto_585032 ) ) ( not ( = ?auto_585026 ?auto_585033 ) ) ( not ( = ?auto_585027 ?auto_585028 ) ) ( not ( = ?auto_585027 ?auto_585029 ) ) ( not ( = ?auto_585027 ?auto_585030 ) ) ( not ( = ?auto_585027 ?auto_585031 ) ) ( not ( = ?auto_585027 ?auto_585032 ) ) ( not ( = ?auto_585027 ?auto_585033 ) ) ( not ( = ?auto_585028 ?auto_585029 ) ) ( not ( = ?auto_585028 ?auto_585030 ) ) ( not ( = ?auto_585028 ?auto_585031 ) ) ( not ( = ?auto_585028 ?auto_585032 ) ) ( not ( = ?auto_585028 ?auto_585033 ) ) ( not ( = ?auto_585029 ?auto_585030 ) ) ( not ( = ?auto_585029 ?auto_585031 ) ) ( not ( = ?auto_585029 ?auto_585032 ) ) ( not ( = ?auto_585029 ?auto_585033 ) ) ( not ( = ?auto_585030 ?auto_585031 ) ) ( not ( = ?auto_585030 ?auto_585032 ) ) ( not ( = ?auto_585030 ?auto_585033 ) ) ( not ( = ?auto_585031 ?auto_585032 ) ) ( not ( = ?auto_585031 ?auto_585033 ) ) ( not ( = ?auto_585032 ?auto_585033 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_585032 ?auto_585033 )
      ( !STACK ?auto_585032 ?auto_585031 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_585062 - BLOCK
      ?auto_585063 - BLOCK
      ?auto_585064 - BLOCK
      ?auto_585065 - BLOCK
      ?auto_585066 - BLOCK
      ?auto_585067 - BLOCK
      ?auto_585068 - BLOCK
      ?auto_585069 - BLOCK
      ?auto_585070 - BLOCK
    )
    :vars
    (
      ?auto_585071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585070 ?auto_585071 ) ( ON-TABLE ?auto_585062 ) ( ON ?auto_585063 ?auto_585062 ) ( ON ?auto_585064 ?auto_585063 ) ( ON ?auto_585065 ?auto_585064 ) ( ON ?auto_585066 ?auto_585065 ) ( ON ?auto_585067 ?auto_585066 ) ( ON ?auto_585068 ?auto_585067 ) ( not ( = ?auto_585062 ?auto_585063 ) ) ( not ( = ?auto_585062 ?auto_585064 ) ) ( not ( = ?auto_585062 ?auto_585065 ) ) ( not ( = ?auto_585062 ?auto_585066 ) ) ( not ( = ?auto_585062 ?auto_585067 ) ) ( not ( = ?auto_585062 ?auto_585068 ) ) ( not ( = ?auto_585062 ?auto_585069 ) ) ( not ( = ?auto_585062 ?auto_585070 ) ) ( not ( = ?auto_585062 ?auto_585071 ) ) ( not ( = ?auto_585063 ?auto_585064 ) ) ( not ( = ?auto_585063 ?auto_585065 ) ) ( not ( = ?auto_585063 ?auto_585066 ) ) ( not ( = ?auto_585063 ?auto_585067 ) ) ( not ( = ?auto_585063 ?auto_585068 ) ) ( not ( = ?auto_585063 ?auto_585069 ) ) ( not ( = ?auto_585063 ?auto_585070 ) ) ( not ( = ?auto_585063 ?auto_585071 ) ) ( not ( = ?auto_585064 ?auto_585065 ) ) ( not ( = ?auto_585064 ?auto_585066 ) ) ( not ( = ?auto_585064 ?auto_585067 ) ) ( not ( = ?auto_585064 ?auto_585068 ) ) ( not ( = ?auto_585064 ?auto_585069 ) ) ( not ( = ?auto_585064 ?auto_585070 ) ) ( not ( = ?auto_585064 ?auto_585071 ) ) ( not ( = ?auto_585065 ?auto_585066 ) ) ( not ( = ?auto_585065 ?auto_585067 ) ) ( not ( = ?auto_585065 ?auto_585068 ) ) ( not ( = ?auto_585065 ?auto_585069 ) ) ( not ( = ?auto_585065 ?auto_585070 ) ) ( not ( = ?auto_585065 ?auto_585071 ) ) ( not ( = ?auto_585066 ?auto_585067 ) ) ( not ( = ?auto_585066 ?auto_585068 ) ) ( not ( = ?auto_585066 ?auto_585069 ) ) ( not ( = ?auto_585066 ?auto_585070 ) ) ( not ( = ?auto_585066 ?auto_585071 ) ) ( not ( = ?auto_585067 ?auto_585068 ) ) ( not ( = ?auto_585067 ?auto_585069 ) ) ( not ( = ?auto_585067 ?auto_585070 ) ) ( not ( = ?auto_585067 ?auto_585071 ) ) ( not ( = ?auto_585068 ?auto_585069 ) ) ( not ( = ?auto_585068 ?auto_585070 ) ) ( not ( = ?auto_585068 ?auto_585071 ) ) ( not ( = ?auto_585069 ?auto_585070 ) ) ( not ( = ?auto_585069 ?auto_585071 ) ) ( not ( = ?auto_585070 ?auto_585071 ) ) ( CLEAR ?auto_585068 ) ( ON ?auto_585069 ?auto_585070 ) ( CLEAR ?auto_585069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_585062 ?auto_585063 ?auto_585064 ?auto_585065 ?auto_585066 ?auto_585067 ?auto_585068 ?auto_585069 )
      ( MAKE-9PILE ?auto_585062 ?auto_585063 ?auto_585064 ?auto_585065 ?auto_585066 ?auto_585067 ?auto_585068 ?auto_585069 ?auto_585070 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_585100 - BLOCK
      ?auto_585101 - BLOCK
      ?auto_585102 - BLOCK
      ?auto_585103 - BLOCK
      ?auto_585104 - BLOCK
      ?auto_585105 - BLOCK
      ?auto_585106 - BLOCK
      ?auto_585107 - BLOCK
      ?auto_585108 - BLOCK
    )
    :vars
    (
      ?auto_585109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585108 ?auto_585109 ) ( ON-TABLE ?auto_585100 ) ( ON ?auto_585101 ?auto_585100 ) ( ON ?auto_585102 ?auto_585101 ) ( ON ?auto_585103 ?auto_585102 ) ( ON ?auto_585104 ?auto_585103 ) ( ON ?auto_585105 ?auto_585104 ) ( not ( = ?auto_585100 ?auto_585101 ) ) ( not ( = ?auto_585100 ?auto_585102 ) ) ( not ( = ?auto_585100 ?auto_585103 ) ) ( not ( = ?auto_585100 ?auto_585104 ) ) ( not ( = ?auto_585100 ?auto_585105 ) ) ( not ( = ?auto_585100 ?auto_585106 ) ) ( not ( = ?auto_585100 ?auto_585107 ) ) ( not ( = ?auto_585100 ?auto_585108 ) ) ( not ( = ?auto_585100 ?auto_585109 ) ) ( not ( = ?auto_585101 ?auto_585102 ) ) ( not ( = ?auto_585101 ?auto_585103 ) ) ( not ( = ?auto_585101 ?auto_585104 ) ) ( not ( = ?auto_585101 ?auto_585105 ) ) ( not ( = ?auto_585101 ?auto_585106 ) ) ( not ( = ?auto_585101 ?auto_585107 ) ) ( not ( = ?auto_585101 ?auto_585108 ) ) ( not ( = ?auto_585101 ?auto_585109 ) ) ( not ( = ?auto_585102 ?auto_585103 ) ) ( not ( = ?auto_585102 ?auto_585104 ) ) ( not ( = ?auto_585102 ?auto_585105 ) ) ( not ( = ?auto_585102 ?auto_585106 ) ) ( not ( = ?auto_585102 ?auto_585107 ) ) ( not ( = ?auto_585102 ?auto_585108 ) ) ( not ( = ?auto_585102 ?auto_585109 ) ) ( not ( = ?auto_585103 ?auto_585104 ) ) ( not ( = ?auto_585103 ?auto_585105 ) ) ( not ( = ?auto_585103 ?auto_585106 ) ) ( not ( = ?auto_585103 ?auto_585107 ) ) ( not ( = ?auto_585103 ?auto_585108 ) ) ( not ( = ?auto_585103 ?auto_585109 ) ) ( not ( = ?auto_585104 ?auto_585105 ) ) ( not ( = ?auto_585104 ?auto_585106 ) ) ( not ( = ?auto_585104 ?auto_585107 ) ) ( not ( = ?auto_585104 ?auto_585108 ) ) ( not ( = ?auto_585104 ?auto_585109 ) ) ( not ( = ?auto_585105 ?auto_585106 ) ) ( not ( = ?auto_585105 ?auto_585107 ) ) ( not ( = ?auto_585105 ?auto_585108 ) ) ( not ( = ?auto_585105 ?auto_585109 ) ) ( not ( = ?auto_585106 ?auto_585107 ) ) ( not ( = ?auto_585106 ?auto_585108 ) ) ( not ( = ?auto_585106 ?auto_585109 ) ) ( not ( = ?auto_585107 ?auto_585108 ) ) ( not ( = ?auto_585107 ?auto_585109 ) ) ( not ( = ?auto_585108 ?auto_585109 ) ) ( ON ?auto_585107 ?auto_585108 ) ( CLEAR ?auto_585105 ) ( ON ?auto_585106 ?auto_585107 ) ( CLEAR ?auto_585106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_585100 ?auto_585101 ?auto_585102 ?auto_585103 ?auto_585104 ?auto_585105 ?auto_585106 )
      ( MAKE-9PILE ?auto_585100 ?auto_585101 ?auto_585102 ?auto_585103 ?auto_585104 ?auto_585105 ?auto_585106 ?auto_585107 ?auto_585108 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_585138 - BLOCK
      ?auto_585139 - BLOCK
      ?auto_585140 - BLOCK
      ?auto_585141 - BLOCK
      ?auto_585142 - BLOCK
      ?auto_585143 - BLOCK
      ?auto_585144 - BLOCK
      ?auto_585145 - BLOCK
      ?auto_585146 - BLOCK
    )
    :vars
    (
      ?auto_585147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585146 ?auto_585147 ) ( ON-TABLE ?auto_585138 ) ( ON ?auto_585139 ?auto_585138 ) ( ON ?auto_585140 ?auto_585139 ) ( ON ?auto_585141 ?auto_585140 ) ( ON ?auto_585142 ?auto_585141 ) ( not ( = ?auto_585138 ?auto_585139 ) ) ( not ( = ?auto_585138 ?auto_585140 ) ) ( not ( = ?auto_585138 ?auto_585141 ) ) ( not ( = ?auto_585138 ?auto_585142 ) ) ( not ( = ?auto_585138 ?auto_585143 ) ) ( not ( = ?auto_585138 ?auto_585144 ) ) ( not ( = ?auto_585138 ?auto_585145 ) ) ( not ( = ?auto_585138 ?auto_585146 ) ) ( not ( = ?auto_585138 ?auto_585147 ) ) ( not ( = ?auto_585139 ?auto_585140 ) ) ( not ( = ?auto_585139 ?auto_585141 ) ) ( not ( = ?auto_585139 ?auto_585142 ) ) ( not ( = ?auto_585139 ?auto_585143 ) ) ( not ( = ?auto_585139 ?auto_585144 ) ) ( not ( = ?auto_585139 ?auto_585145 ) ) ( not ( = ?auto_585139 ?auto_585146 ) ) ( not ( = ?auto_585139 ?auto_585147 ) ) ( not ( = ?auto_585140 ?auto_585141 ) ) ( not ( = ?auto_585140 ?auto_585142 ) ) ( not ( = ?auto_585140 ?auto_585143 ) ) ( not ( = ?auto_585140 ?auto_585144 ) ) ( not ( = ?auto_585140 ?auto_585145 ) ) ( not ( = ?auto_585140 ?auto_585146 ) ) ( not ( = ?auto_585140 ?auto_585147 ) ) ( not ( = ?auto_585141 ?auto_585142 ) ) ( not ( = ?auto_585141 ?auto_585143 ) ) ( not ( = ?auto_585141 ?auto_585144 ) ) ( not ( = ?auto_585141 ?auto_585145 ) ) ( not ( = ?auto_585141 ?auto_585146 ) ) ( not ( = ?auto_585141 ?auto_585147 ) ) ( not ( = ?auto_585142 ?auto_585143 ) ) ( not ( = ?auto_585142 ?auto_585144 ) ) ( not ( = ?auto_585142 ?auto_585145 ) ) ( not ( = ?auto_585142 ?auto_585146 ) ) ( not ( = ?auto_585142 ?auto_585147 ) ) ( not ( = ?auto_585143 ?auto_585144 ) ) ( not ( = ?auto_585143 ?auto_585145 ) ) ( not ( = ?auto_585143 ?auto_585146 ) ) ( not ( = ?auto_585143 ?auto_585147 ) ) ( not ( = ?auto_585144 ?auto_585145 ) ) ( not ( = ?auto_585144 ?auto_585146 ) ) ( not ( = ?auto_585144 ?auto_585147 ) ) ( not ( = ?auto_585145 ?auto_585146 ) ) ( not ( = ?auto_585145 ?auto_585147 ) ) ( not ( = ?auto_585146 ?auto_585147 ) ) ( ON ?auto_585145 ?auto_585146 ) ( ON ?auto_585144 ?auto_585145 ) ( CLEAR ?auto_585142 ) ( ON ?auto_585143 ?auto_585144 ) ( CLEAR ?auto_585143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_585138 ?auto_585139 ?auto_585140 ?auto_585141 ?auto_585142 ?auto_585143 )
      ( MAKE-9PILE ?auto_585138 ?auto_585139 ?auto_585140 ?auto_585141 ?auto_585142 ?auto_585143 ?auto_585144 ?auto_585145 ?auto_585146 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_585176 - BLOCK
      ?auto_585177 - BLOCK
      ?auto_585178 - BLOCK
      ?auto_585179 - BLOCK
      ?auto_585180 - BLOCK
      ?auto_585181 - BLOCK
      ?auto_585182 - BLOCK
      ?auto_585183 - BLOCK
      ?auto_585184 - BLOCK
    )
    :vars
    (
      ?auto_585185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585184 ?auto_585185 ) ( ON-TABLE ?auto_585176 ) ( ON ?auto_585177 ?auto_585176 ) ( ON ?auto_585178 ?auto_585177 ) ( ON ?auto_585179 ?auto_585178 ) ( not ( = ?auto_585176 ?auto_585177 ) ) ( not ( = ?auto_585176 ?auto_585178 ) ) ( not ( = ?auto_585176 ?auto_585179 ) ) ( not ( = ?auto_585176 ?auto_585180 ) ) ( not ( = ?auto_585176 ?auto_585181 ) ) ( not ( = ?auto_585176 ?auto_585182 ) ) ( not ( = ?auto_585176 ?auto_585183 ) ) ( not ( = ?auto_585176 ?auto_585184 ) ) ( not ( = ?auto_585176 ?auto_585185 ) ) ( not ( = ?auto_585177 ?auto_585178 ) ) ( not ( = ?auto_585177 ?auto_585179 ) ) ( not ( = ?auto_585177 ?auto_585180 ) ) ( not ( = ?auto_585177 ?auto_585181 ) ) ( not ( = ?auto_585177 ?auto_585182 ) ) ( not ( = ?auto_585177 ?auto_585183 ) ) ( not ( = ?auto_585177 ?auto_585184 ) ) ( not ( = ?auto_585177 ?auto_585185 ) ) ( not ( = ?auto_585178 ?auto_585179 ) ) ( not ( = ?auto_585178 ?auto_585180 ) ) ( not ( = ?auto_585178 ?auto_585181 ) ) ( not ( = ?auto_585178 ?auto_585182 ) ) ( not ( = ?auto_585178 ?auto_585183 ) ) ( not ( = ?auto_585178 ?auto_585184 ) ) ( not ( = ?auto_585178 ?auto_585185 ) ) ( not ( = ?auto_585179 ?auto_585180 ) ) ( not ( = ?auto_585179 ?auto_585181 ) ) ( not ( = ?auto_585179 ?auto_585182 ) ) ( not ( = ?auto_585179 ?auto_585183 ) ) ( not ( = ?auto_585179 ?auto_585184 ) ) ( not ( = ?auto_585179 ?auto_585185 ) ) ( not ( = ?auto_585180 ?auto_585181 ) ) ( not ( = ?auto_585180 ?auto_585182 ) ) ( not ( = ?auto_585180 ?auto_585183 ) ) ( not ( = ?auto_585180 ?auto_585184 ) ) ( not ( = ?auto_585180 ?auto_585185 ) ) ( not ( = ?auto_585181 ?auto_585182 ) ) ( not ( = ?auto_585181 ?auto_585183 ) ) ( not ( = ?auto_585181 ?auto_585184 ) ) ( not ( = ?auto_585181 ?auto_585185 ) ) ( not ( = ?auto_585182 ?auto_585183 ) ) ( not ( = ?auto_585182 ?auto_585184 ) ) ( not ( = ?auto_585182 ?auto_585185 ) ) ( not ( = ?auto_585183 ?auto_585184 ) ) ( not ( = ?auto_585183 ?auto_585185 ) ) ( not ( = ?auto_585184 ?auto_585185 ) ) ( ON ?auto_585183 ?auto_585184 ) ( ON ?auto_585182 ?auto_585183 ) ( ON ?auto_585181 ?auto_585182 ) ( CLEAR ?auto_585179 ) ( ON ?auto_585180 ?auto_585181 ) ( CLEAR ?auto_585180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_585176 ?auto_585177 ?auto_585178 ?auto_585179 ?auto_585180 )
      ( MAKE-9PILE ?auto_585176 ?auto_585177 ?auto_585178 ?auto_585179 ?auto_585180 ?auto_585181 ?auto_585182 ?auto_585183 ?auto_585184 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_585214 - BLOCK
      ?auto_585215 - BLOCK
      ?auto_585216 - BLOCK
      ?auto_585217 - BLOCK
      ?auto_585218 - BLOCK
      ?auto_585219 - BLOCK
      ?auto_585220 - BLOCK
      ?auto_585221 - BLOCK
      ?auto_585222 - BLOCK
    )
    :vars
    (
      ?auto_585223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585222 ?auto_585223 ) ( ON-TABLE ?auto_585214 ) ( ON ?auto_585215 ?auto_585214 ) ( ON ?auto_585216 ?auto_585215 ) ( not ( = ?auto_585214 ?auto_585215 ) ) ( not ( = ?auto_585214 ?auto_585216 ) ) ( not ( = ?auto_585214 ?auto_585217 ) ) ( not ( = ?auto_585214 ?auto_585218 ) ) ( not ( = ?auto_585214 ?auto_585219 ) ) ( not ( = ?auto_585214 ?auto_585220 ) ) ( not ( = ?auto_585214 ?auto_585221 ) ) ( not ( = ?auto_585214 ?auto_585222 ) ) ( not ( = ?auto_585214 ?auto_585223 ) ) ( not ( = ?auto_585215 ?auto_585216 ) ) ( not ( = ?auto_585215 ?auto_585217 ) ) ( not ( = ?auto_585215 ?auto_585218 ) ) ( not ( = ?auto_585215 ?auto_585219 ) ) ( not ( = ?auto_585215 ?auto_585220 ) ) ( not ( = ?auto_585215 ?auto_585221 ) ) ( not ( = ?auto_585215 ?auto_585222 ) ) ( not ( = ?auto_585215 ?auto_585223 ) ) ( not ( = ?auto_585216 ?auto_585217 ) ) ( not ( = ?auto_585216 ?auto_585218 ) ) ( not ( = ?auto_585216 ?auto_585219 ) ) ( not ( = ?auto_585216 ?auto_585220 ) ) ( not ( = ?auto_585216 ?auto_585221 ) ) ( not ( = ?auto_585216 ?auto_585222 ) ) ( not ( = ?auto_585216 ?auto_585223 ) ) ( not ( = ?auto_585217 ?auto_585218 ) ) ( not ( = ?auto_585217 ?auto_585219 ) ) ( not ( = ?auto_585217 ?auto_585220 ) ) ( not ( = ?auto_585217 ?auto_585221 ) ) ( not ( = ?auto_585217 ?auto_585222 ) ) ( not ( = ?auto_585217 ?auto_585223 ) ) ( not ( = ?auto_585218 ?auto_585219 ) ) ( not ( = ?auto_585218 ?auto_585220 ) ) ( not ( = ?auto_585218 ?auto_585221 ) ) ( not ( = ?auto_585218 ?auto_585222 ) ) ( not ( = ?auto_585218 ?auto_585223 ) ) ( not ( = ?auto_585219 ?auto_585220 ) ) ( not ( = ?auto_585219 ?auto_585221 ) ) ( not ( = ?auto_585219 ?auto_585222 ) ) ( not ( = ?auto_585219 ?auto_585223 ) ) ( not ( = ?auto_585220 ?auto_585221 ) ) ( not ( = ?auto_585220 ?auto_585222 ) ) ( not ( = ?auto_585220 ?auto_585223 ) ) ( not ( = ?auto_585221 ?auto_585222 ) ) ( not ( = ?auto_585221 ?auto_585223 ) ) ( not ( = ?auto_585222 ?auto_585223 ) ) ( ON ?auto_585221 ?auto_585222 ) ( ON ?auto_585220 ?auto_585221 ) ( ON ?auto_585219 ?auto_585220 ) ( ON ?auto_585218 ?auto_585219 ) ( CLEAR ?auto_585216 ) ( ON ?auto_585217 ?auto_585218 ) ( CLEAR ?auto_585217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_585214 ?auto_585215 ?auto_585216 ?auto_585217 )
      ( MAKE-9PILE ?auto_585214 ?auto_585215 ?auto_585216 ?auto_585217 ?auto_585218 ?auto_585219 ?auto_585220 ?auto_585221 ?auto_585222 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_585252 - BLOCK
      ?auto_585253 - BLOCK
      ?auto_585254 - BLOCK
      ?auto_585255 - BLOCK
      ?auto_585256 - BLOCK
      ?auto_585257 - BLOCK
      ?auto_585258 - BLOCK
      ?auto_585259 - BLOCK
      ?auto_585260 - BLOCK
    )
    :vars
    (
      ?auto_585261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585260 ?auto_585261 ) ( ON-TABLE ?auto_585252 ) ( ON ?auto_585253 ?auto_585252 ) ( not ( = ?auto_585252 ?auto_585253 ) ) ( not ( = ?auto_585252 ?auto_585254 ) ) ( not ( = ?auto_585252 ?auto_585255 ) ) ( not ( = ?auto_585252 ?auto_585256 ) ) ( not ( = ?auto_585252 ?auto_585257 ) ) ( not ( = ?auto_585252 ?auto_585258 ) ) ( not ( = ?auto_585252 ?auto_585259 ) ) ( not ( = ?auto_585252 ?auto_585260 ) ) ( not ( = ?auto_585252 ?auto_585261 ) ) ( not ( = ?auto_585253 ?auto_585254 ) ) ( not ( = ?auto_585253 ?auto_585255 ) ) ( not ( = ?auto_585253 ?auto_585256 ) ) ( not ( = ?auto_585253 ?auto_585257 ) ) ( not ( = ?auto_585253 ?auto_585258 ) ) ( not ( = ?auto_585253 ?auto_585259 ) ) ( not ( = ?auto_585253 ?auto_585260 ) ) ( not ( = ?auto_585253 ?auto_585261 ) ) ( not ( = ?auto_585254 ?auto_585255 ) ) ( not ( = ?auto_585254 ?auto_585256 ) ) ( not ( = ?auto_585254 ?auto_585257 ) ) ( not ( = ?auto_585254 ?auto_585258 ) ) ( not ( = ?auto_585254 ?auto_585259 ) ) ( not ( = ?auto_585254 ?auto_585260 ) ) ( not ( = ?auto_585254 ?auto_585261 ) ) ( not ( = ?auto_585255 ?auto_585256 ) ) ( not ( = ?auto_585255 ?auto_585257 ) ) ( not ( = ?auto_585255 ?auto_585258 ) ) ( not ( = ?auto_585255 ?auto_585259 ) ) ( not ( = ?auto_585255 ?auto_585260 ) ) ( not ( = ?auto_585255 ?auto_585261 ) ) ( not ( = ?auto_585256 ?auto_585257 ) ) ( not ( = ?auto_585256 ?auto_585258 ) ) ( not ( = ?auto_585256 ?auto_585259 ) ) ( not ( = ?auto_585256 ?auto_585260 ) ) ( not ( = ?auto_585256 ?auto_585261 ) ) ( not ( = ?auto_585257 ?auto_585258 ) ) ( not ( = ?auto_585257 ?auto_585259 ) ) ( not ( = ?auto_585257 ?auto_585260 ) ) ( not ( = ?auto_585257 ?auto_585261 ) ) ( not ( = ?auto_585258 ?auto_585259 ) ) ( not ( = ?auto_585258 ?auto_585260 ) ) ( not ( = ?auto_585258 ?auto_585261 ) ) ( not ( = ?auto_585259 ?auto_585260 ) ) ( not ( = ?auto_585259 ?auto_585261 ) ) ( not ( = ?auto_585260 ?auto_585261 ) ) ( ON ?auto_585259 ?auto_585260 ) ( ON ?auto_585258 ?auto_585259 ) ( ON ?auto_585257 ?auto_585258 ) ( ON ?auto_585256 ?auto_585257 ) ( ON ?auto_585255 ?auto_585256 ) ( CLEAR ?auto_585253 ) ( ON ?auto_585254 ?auto_585255 ) ( CLEAR ?auto_585254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_585252 ?auto_585253 ?auto_585254 )
      ( MAKE-9PILE ?auto_585252 ?auto_585253 ?auto_585254 ?auto_585255 ?auto_585256 ?auto_585257 ?auto_585258 ?auto_585259 ?auto_585260 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_585290 - BLOCK
      ?auto_585291 - BLOCK
      ?auto_585292 - BLOCK
      ?auto_585293 - BLOCK
      ?auto_585294 - BLOCK
      ?auto_585295 - BLOCK
      ?auto_585296 - BLOCK
      ?auto_585297 - BLOCK
      ?auto_585298 - BLOCK
    )
    :vars
    (
      ?auto_585299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585298 ?auto_585299 ) ( ON-TABLE ?auto_585290 ) ( not ( = ?auto_585290 ?auto_585291 ) ) ( not ( = ?auto_585290 ?auto_585292 ) ) ( not ( = ?auto_585290 ?auto_585293 ) ) ( not ( = ?auto_585290 ?auto_585294 ) ) ( not ( = ?auto_585290 ?auto_585295 ) ) ( not ( = ?auto_585290 ?auto_585296 ) ) ( not ( = ?auto_585290 ?auto_585297 ) ) ( not ( = ?auto_585290 ?auto_585298 ) ) ( not ( = ?auto_585290 ?auto_585299 ) ) ( not ( = ?auto_585291 ?auto_585292 ) ) ( not ( = ?auto_585291 ?auto_585293 ) ) ( not ( = ?auto_585291 ?auto_585294 ) ) ( not ( = ?auto_585291 ?auto_585295 ) ) ( not ( = ?auto_585291 ?auto_585296 ) ) ( not ( = ?auto_585291 ?auto_585297 ) ) ( not ( = ?auto_585291 ?auto_585298 ) ) ( not ( = ?auto_585291 ?auto_585299 ) ) ( not ( = ?auto_585292 ?auto_585293 ) ) ( not ( = ?auto_585292 ?auto_585294 ) ) ( not ( = ?auto_585292 ?auto_585295 ) ) ( not ( = ?auto_585292 ?auto_585296 ) ) ( not ( = ?auto_585292 ?auto_585297 ) ) ( not ( = ?auto_585292 ?auto_585298 ) ) ( not ( = ?auto_585292 ?auto_585299 ) ) ( not ( = ?auto_585293 ?auto_585294 ) ) ( not ( = ?auto_585293 ?auto_585295 ) ) ( not ( = ?auto_585293 ?auto_585296 ) ) ( not ( = ?auto_585293 ?auto_585297 ) ) ( not ( = ?auto_585293 ?auto_585298 ) ) ( not ( = ?auto_585293 ?auto_585299 ) ) ( not ( = ?auto_585294 ?auto_585295 ) ) ( not ( = ?auto_585294 ?auto_585296 ) ) ( not ( = ?auto_585294 ?auto_585297 ) ) ( not ( = ?auto_585294 ?auto_585298 ) ) ( not ( = ?auto_585294 ?auto_585299 ) ) ( not ( = ?auto_585295 ?auto_585296 ) ) ( not ( = ?auto_585295 ?auto_585297 ) ) ( not ( = ?auto_585295 ?auto_585298 ) ) ( not ( = ?auto_585295 ?auto_585299 ) ) ( not ( = ?auto_585296 ?auto_585297 ) ) ( not ( = ?auto_585296 ?auto_585298 ) ) ( not ( = ?auto_585296 ?auto_585299 ) ) ( not ( = ?auto_585297 ?auto_585298 ) ) ( not ( = ?auto_585297 ?auto_585299 ) ) ( not ( = ?auto_585298 ?auto_585299 ) ) ( ON ?auto_585297 ?auto_585298 ) ( ON ?auto_585296 ?auto_585297 ) ( ON ?auto_585295 ?auto_585296 ) ( ON ?auto_585294 ?auto_585295 ) ( ON ?auto_585293 ?auto_585294 ) ( ON ?auto_585292 ?auto_585293 ) ( CLEAR ?auto_585290 ) ( ON ?auto_585291 ?auto_585292 ) ( CLEAR ?auto_585291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_585290 ?auto_585291 )
      ( MAKE-9PILE ?auto_585290 ?auto_585291 ?auto_585292 ?auto_585293 ?auto_585294 ?auto_585295 ?auto_585296 ?auto_585297 ?auto_585298 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_585328 - BLOCK
      ?auto_585329 - BLOCK
      ?auto_585330 - BLOCK
      ?auto_585331 - BLOCK
      ?auto_585332 - BLOCK
      ?auto_585333 - BLOCK
      ?auto_585334 - BLOCK
      ?auto_585335 - BLOCK
      ?auto_585336 - BLOCK
    )
    :vars
    (
      ?auto_585337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585336 ?auto_585337 ) ( not ( = ?auto_585328 ?auto_585329 ) ) ( not ( = ?auto_585328 ?auto_585330 ) ) ( not ( = ?auto_585328 ?auto_585331 ) ) ( not ( = ?auto_585328 ?auto_585332 ) ) ( not ( = ?auto_585328 ?auto_585333 ) ) ( not ( = ?auto_585328 ?auto_585334 ) ) ( not ( = ?auto_585328 ?auto_585335 ) ) ( not ( = ?auto_585328 ?auto_585336 ) ) ( not ( = ?auto_585328 ?auto_585337 ) ) ( not ( = ?auto_585329 ?auto_585330 ) ) ( not ( = ?auto_585329 ?auto_585331 ) ) ( not ( = ?auto_585329 ?auto_585332 ) ) ( not ( = ?auto_585329 ?auto_585333 ) ) ( not ( = ?auto_585329 ?auto_585334 ) ) ( not ( = ?auto_585329 ?auto_585335 ) ) ( not ( = ?auto_585329 ?auto_585336 ) ) ( not ( = ?auto_585329 ?auto_585337 ) ) ( not ( = ?auto_585330 ?auto_585331 ) ) ( not ( = ?auto_585330 ?auto_585332 ) ) ( not ( = ?auto_585330 ?auto_585333 ) ) ( not ( = ?auto_585330 ?auto_585334 ) ) ( not ( = ?auto_585330 ?auto_585335 ) ) ( not ( = ?auto_585330 ?auto_585336 ) ) ( not ( = ?auto_585330 ?auto_585337 ) ) ( not ( = ?auto_585331 ?auto_585332 ) ) ( not ( = ?auto_585331 ?auto_585333 ) ) ( not ( = ?auto_585331 ?auto_585334 ) ) ( not ( = ?auto_585331 ?auto_585335 ) ) ( not ( = ?auto_585331 ?auto_585336 ) ) ( not ( = ?auto_585331 ?auto_585337 ) ) ( not ( = ?auto_585332 ?auto_585333 ) ) ( not ( = ?auto_585332 ?auto_585334 ) ) ( not ( = ?auto_585332 ?auto_585335 ) ) ( not ( = ?auto_585332 ?auto_585336 ) ) ( not ( = ?auto_585332 ?auto_585337 ) ) ( not ( = ?auto_585333 ?auto_585334 ) ) ( not ( = ?auto_585333 ?auto_585335 ) ) ( not ( = ?auto_585333 ?auto_585336 ) ) ( not ( = ?auto_585333 ?auto_585337 ) ) ( not ( = ?auto_585334 ?auto_585335 ) ) ( not ( = ?auto_585334 ?auto_585336 ) ) ( not ( = ?auto_585334 ?auto_585337 ) ) ( not ( = ?auto_585335 ?auto_585336 ) ) ( not ( = ?auto_585335 ?auto_585337 ) ) ( not ( = ?auto_585336 ?auto_585337 ) ) ( ON ?auto_585335 ?auto_585336 ) ( ON ?auto_585334 ?auto_585335 ) ( ON ?auto_585333 ?auto_585334 ) ( ON ?auto_585332 ?auto_585333 ) ( ON ?auto_585331 ?auto_585332 ) ( ON ?auto_585330 ?auto_585331 ) ( ON ?auto_585329 ?auto_585330 ) ( ON ?auto_585328 ?auto_585329 ) ( CLEAR ?auto_585328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_585328 )
      ( MAKE-9PILE ?auto_585328 ?auto_585329 ?auto_585330 ?auto_585331 ?auto_585332 ?auto_585333 ?auto_585334 ?auto_585335 ?auto_585336 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_585367 - BLOCK
      ?auto_585368 - BLOCK
      ?auto_585369 - BLOCK
      ?auto_585370 - BLOCK
      ?auto_585371 - BLOCK
      ?auto_585372 - BLOCK
      ?auto_585373 - BLOCK
      ?auto_585374 - BLOCK
      ?auto_585375 - BLOCK
      ?auto_585376 - BLOCK
    )
    :vars
    (
      ?auto_585377 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_585375 ) ( ON ?auto_585376 ?auto_585377 ) ( CLEAR ?auto_585376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_585367 ) ( ON ?auto_585368 ?auto_585367 ) ( ON ?auto_585369 ?auto_585368 ) ( ON ?auto_585370 ?auto_585369 ) ( ON ?auto_585371 ?auto_585370 ) ( ON ?auto_585372 ?auto_585371 ) ( ON ?auto_585373 ?auto_585372 ) ( ON ?auto_585374 ?auto_585373 ) ( ON ?auto_585375 ?auto_585374 ) ( not ( = ?auto_585367 ?auto_585368 ) ) ( not ( = ?auto_585367 ?auto_585369 ) ) ( not ( = ?auto_585367 ?auto_585370 ) ) ( not ( = ?auto_585367 ?auto_585371 ) ) ( not ( = ?auto_585367 ?auto_585372 ) ) ( not ( = ?auto_585367 ?auto_585373 ) ) ( not ( = ?auto_585367 ?auto_585374 ) ) ( not ( = ?auto_585367 ?auto_585375 ) ) ( not ( = ?auto_585367 ?auto_585376 ) ) ( not ( = ?auto_585367 ?auto_585377 ) ) ( not ( = ?auto_585368 ?auto_585369 ) ) ( not ( = ?auto_585368 ?auto_585370 ) ) ( not ( = ?auto_585368 ?auto_585371 ) ) ( not ( = ?auto_585368 ?auto_585372 ) ) ( not ( = ?auto_585368 ?auto_585373 ) ) ( not ( = ?auto_585368 ?auto_585374 ) ) ( not ( = ?auto_585368 ?auto_585375 ) ) ( not ( = ?auto_585368 ?auto_585376 ) ) ( not ( = ?auto_585368 ?auto_585377 ) ) ( not ( = ?auto_585369 ?auto_585370 ) ) ( not ( = ?auto_585369 ?auto_585371 ) ) ( not ( = ?auto_585369 ?auto_585372 ) ) ( not ( = ?auto_585369 ?auto_585373 ) ) ( not ( = ?auto_585369 ?auto_585374 ) ) ( not ( = ?auto_585369 ?auto_585375 ) ) ( not ( = ?auto_585369 ?auto_585376 ) ) ( not ( = ?auto_585369 ?auto_585377 ) ) ( not ( = ?auto_585370 ?auto_585371 ) ) ( not ( = ?auto_585370 ?auto_585372 ) ) ( not ( = ?auto_585370 ?auto_585373 ) ) ( not ( = ?auto_585370 ?auto_585374 ) ) ( not ( = ?auto_585370 ?auto_585375 ) ) ( not ( = ?auto_585370 ?auto_585376 ) ) ( not ( = ?auto_585370 ?auto_585377 ) ) ( not ( = ?auto_585371 ?auto_585372 ) ) ( not ( = ?auto_585371 ?auto_585373 ) ) ( not ( = ?auto_585371 ?auto_585374 ) ) ( not ( = ?auto_585371 ?auto_585375 ) ) ( not ( = ?auto_585371 ?auto_585376 ) ) ( not ( = ?auto_585371 ?auto_585377 ) ) ( not ( = ?auto_585372 ?auto_585373 ) ) ( not ( = ?auto_585372 ?auto_585374 ) ) ( not ( = ?auto_585372 ?auto_585375 ) ) ( not ( = ?auto_585372 ?auto_585376 ) ) ( not ( = ?auto_585372 ?auto_585377 ) ) ( not ( = ?auto_585373 ?auto_585374 ) ) ( not ( = ?auto_585373 ?auto_585375 ) ) ( not ( = ?auto_585373 ?auto_585376 ) ) ( not ( = ?auto_585373 ?auto_585377 ) ) ( not ( = ?auto_585374 ?auto_585375 ) ) ( not ( = ?auto_585374 ?auto_585376 ) ) ( not ( = ?auto_585374 ?auto_585377 ) ) ( not ( = ?auto_585375 ?auto_585376 ) ) ( not ( = ?auto_585375 ?auto_585377 ) ) ( not ( = ?auto_585376 ?auto_585377 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_585376 ?auto_585377 )
      ( !STACK ?auto_585376 ?auto_585375 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_585409 - BLOCK
      ?auto_585410 - BLOCK
      ?auto_585411 - BLOCK
      ?auto_585412 - BLOCK
      ?auto_585413 - BLOCK
      ?auto_585414 - BLOCK
      ?auto_585415 - BLOCK
      ?auto_585416 - BLOCK
      ?auto_585417 - BLOCK
      ?auto_585418 - BLOCK
    )
    :vars
    (
      ?auto_585419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585418 ?auto_585419 ) ( ON-TABLE ?auto_585409 ) ( ON ?auto_585410 ?auto_585409 ) ( ON ?auto_585411 ?auto_585410 ) ( ON ?auto_585412 ?auto_585411 ) ( ON ?auto_585413 ?auto_585412 ) ( ON ?auto_585414 ?auto_585413 ) ( ON ?auto_585415 ?auto_585414 ) ( ON ?auto_585416 ?auto_585415 ) ( not ( = ?auto_585409 ?auto_585410 ) ) ( not ( = ?auto_585409 ?auto_585411 ) ) ( not ( = ?auto_585409 ?auto_585412 ) ) ( not ( = ?auto_585409 ?auto_585413 ) ) ( not ( = ?auto_585409 ?auto_585414 ) ) ( not ( = ?auto_585409 ?auto_585415 ) ) ( not ( = ?auto_585409 ?auto_585416 ) ) ( not ( = ?auto_585409 ?auto_585417 ) ) ( not ( = ?auto_585409 ?auto_585418 ) ) ( not ( = ?auto_585409 ?auto_585419 ) ) ( not ( = ?auto_585410 ?auto_585411 ) ) ( not ( = ?auto_585410 ?auto_585412 ) ) ( not ( = ?auto_585410 ?auto_585413 ) ) ( not ( = ?auto_585410 ?auto_585414 ) ) ( not ( = ?auto_585410 ?auto_585415 ) ) ( not ( = ?auto_585410 ?auto_585416 ) ) ( not ( = ?auto_585410 ?auto_585417 ) ) ( not ( = ?auto_585410 ?auto_585418 ) ) ( not ( = ?auto_585410 ?auto_585419 ) ) ( not ( = ?auto_585411 ?auto_585412 ) ) ( not ( = ?auto_585411 ?auto_585413 ) ) ( not ( = ?auto_585411 ?auto_585414 ) ) ( not ( = ?auto_585411 ?auto_585415 ) ) ( not ( = ?auto_585411 ?auto_585416 ) ) ( not ( = ?auto_585411 ?auto_585417 ) ) ( not ( = ?auto_585411 ?auto_585418 ) ) ( not ( = ?auto_585411 ?auto_585419 ) ) ( not ( = ?auto_585412 ?auto_585413 ) ) ( not ( = ?auto_585412 ?auto_585414 ) ) ( not ( = ?auto_585412 ?auto_585415 ) ) ( not ( = ?auto_585412 ?auto_585416 ) ) ( not ( = ?auto_585412 ?auto_585417 ) ) ( not ( = ?auto_585412 ?auto_585418 ) ) ( not ( = ?auto_585412 ?auto_585419 ) ) ( not ( = ?auto_585413 ?auto_585414 ) ) ( not ( = ?auto_585413 ?auto_585415 ) ) ( not ( = ?auto_585413 ?auto_585416 ) ) ( not ( = ?auto_585413 ?auto_585417 ) ) ( not ( = ?auto_585413 ?auto_585418 ) ) ( not ( = ?auto_585413 ?auto_585419 ) ) ( not ( = ?auto_585414 ?auto_585415 ) ) ( not ( = ?auto_585414 ?auto_585416 ) ) ( not ( = ?auto_585414 ?auto_585417 ) ) ( not ( = ?auto_585414 ?auto_585418 ) ) ( not ( = ?auto_585414 ?auto_585419 ) ) ( not ( = ?auto_585415 ?auto_585416 ) ) ( not ( = ?auto_585415 ?auto_585417 ) ) ( not ( = ?auto_585415 ?auto_585418 ) ) ( not ( = ?auto_585415 ?auto_585419 ) ) ( not ( = ?auto_585416 ?auto_585417 ) ) ( not ( = ?auto_585416 ?auto_585418 ) ) ( not ( = ?auto_585416 ?auto_585419 ) ) ( not ( = ?auto_585417 ?auto_585418 ) ) ( not ( = ?auto_585417 ?auto_585419 ) ) ( not ( = ?auto_585418 ?auto_585419 ) ) ( CLEAR ?auto_585416 ) ( ON ?auto_585417 ?auto_585418 ) ( CLEAR ?auto_585417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_585409 ?auto_585410 ?auto_585411 ?auto_585412 ?auto_585413 ?auto_585414 ?auto_585415 ?auto_585416 ?auto_585417 )
      ( MAKE-10PILE ?auto_585409 ?auto_585410 ?auto_585411 ?auto_585412 ?auto_585413 ?auto_585414 ?auto_585415 ?auto_585416 ?auto_585417 ?auto_585418 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_585451 - BLOCK
      ?auto_585452 - BLOCK
      ?auto_585453 - BLOCK
      ?auto_585454 - BLOCK
      ?auto_585455 - BLOCK
      ?auto_585456 - BLOCK
      ?auto_585457 - BLOCK
      ?auto_585458 - BLOCK
      ?auto_585459 - BLOCK
      ?auto_585460 - BLOCK
    )
    :vars
    (
      ?auto_585461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585460 ?auto_585461 ) ( ON-TABLE ?auto_585451 ) ( ON ?auto_585452 ?auto_585451 ) ( ON ?auto_585453 ?auto_585452 ) ( ON ?auto_585454 ?auto_585453 ) ( ON ?auto_585455 ?auto_585454 ) ( ON ?auto_585456 ?auto_585455 ) ( ON ?auto_585457 ?auto_585456 ) ( not ( = ?auto_585451 ?auto_585452 ) ) ( not ( = ?auto_585451 ?auto_585453 ) ) ( not ( = ?auto_585451 ?auto_585454 ) ) ( not ( = ?auto_585451 ?auto_585455 ) ) ( not ( = ?auto_585451 ?auto_585456 ) ) ( not ( = ?auto_585451 ?auto_585457 ) ) ( not ( = ?auto_585451 ?auto_585458 ) ) ( not ( = ?auto_585451 ?auto_585459 ) ) ( not ( = ?auto_585451 ?auto_585460 ) ) ( not ( = ?auto_585451 ?auto_585461 ) ) ( not ( = ?auto_585452 ?auto_585453 ) ) ( not ( = ?auto_585452 ?auto_585454 ) ) ( not ( = ?auto_585452 ?auto_585455 ) ) ( not ( = ?auto_585452 ?auto_585456 ) ) ( not ( = ?auto_585452 ?auto_585457 ) ) ( not ( = ?auto_585452 ?auto_585458 ) ) ( not ( = ?auto_585452 ?auto_585459 ) ) ( not ( = ?auto_585452 ?auto_585460 ) ) ( not ( = ?auto_585452 ?auto_585461 ) ) ( not ( = ?auto_585453 ?auto_585454 ) ) ( not ( = ?auto_585453 ?auto_585455 ) ) ( not ( = ?auto_585453 ?auto_585456 ) ) ( not ( = ?auto_585453 ?auto_585457 ) ) ( not ( = ?auto_585453 ?auto_585458 ) ) ( not ( = ?auto_585453 ?auto_585459 ) ) ( not ( = ?auto_585453 ?auto_585460 ) ) ( not ( = ?auto_585453 ?auto_585461 ) ) ( not ( = ?auto_585454 ?auto_585455 ) ) ( not ( = ?auto_585454 ?auto_585456 ) ) ( not ( = ?auto_585454 ?auto_585457 ) ) ( not ( = ?auto_585454 ?auto_585458 ) ) ( not ( = ?auto_585454 ?auto_585459 ) ) ( not ( = ?auto_585454 ?auto_585460 ) ) ( not ( = ?auto_585454 ?auto_585461 ) ) ( not ( = ?auto_585455 ?auto_585456 ) ) ( not ( = ?auto_585455 ?auto_585457 ) ) ( not ( = ?auto_585455 ?auto_585458 ) ) ( not ( = ?auto_585455 ?auto_585459 ) ) ( not ( = ?auto_585455 ?auto_585460 ) ) ( not ( = ?auto_585455 ?auto_585461 ) ) ( not ( = ?auto_585456 ?auto_585457 ) ) ( not ( = ?auto_585456 ?auto_585458 ) ) ( not ( = ?auto_585456 ?auto_585459 ) ) ( not ( = ?auto_585456 ?auto_585460 ) ) ( not ( = ?auto_585456 ?auto_585461 ) ) ( not ( = ?auto_585457 ?auto_585458 ) ) ( not ( = ?auto_585457 ?auto_585459 ) ) ( not ( = ?auto_585457 ?auto_585460 ) ) ( not ( = ?auto_585457 ?auto_585461 ) ) ( not ( = ?auto_585458 ?auto_585459 ) ) ( not ( = ?auto_585458 ?auto_585460 ) ) ( not ( = ?auto_585458 ?auto_585461 ) ) ( not ( = ?auto_585459 ?auto_585460 ) ) ( not ( = ?auto_585459 ?auto_585461 ) ) ( not ( = ?auto_585460 ?auto_585461 ) ) ( ON ?auto_585459 ?auto_585460 ) ( CLEAR ?auto_585457 ) ( ON ?auto_585458 ?auto_585459 ) ( CLEAR ?auto_585458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_585451 ?auto_585452 ?auto_585453 ?auto_585454 ?auto_585455 ?auto_585456 ?auto_585457 ?auto_585458 )
      ( MAKE-10PILE ?auto_585451 ?auto_585452 ?auto_585453 ?auto_585454 ?auto_585455 ?auto_585456 ?auto_585457 ?auto_585458 ?auto_585459 ?auto_585460 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_585493 - BLOCK
      ?auto_585494 - BLOCK
      ?auto_585495 - BLOCK
      ?auto_585496 - BLOCK
      ?auto_585497 - BLOCK
      ?auto_585498 - BLOCK
      ?auto_585499 - BLOCK
      ?auto_585500 - BLOCK
      ?auto_585501 - BLOCK
      ?auto_585502 - BLOCK
    )
    :vars
    (
      ?auto_585503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585502 ?auto_585503 ) ( ON-TABLE ?auto_585493 ) ( ON ?auto_585494 ?auto_585493 ) ( ON ?auto_585495 ?auto_585494 ) ( ON ?auto_585496 ?auto_585495 ) ( ON ?auto_585497 ?auto_585496 ) ( ON ?auto_585498 ?auto_585497 ) ( not ( = ?auto_585493 ?auto_585494 ) ) ( not ( = ?auto_585493 ?auto_585495 ) ) ( not ( = ?auto_585493 ?auto_585496 ) ) ( not ( = ?auto_585493 ?auto_585497 ) ) ( not ( = ?auto_585493 ?auto_585498 ) ) ( not ( = ?auto_585493 ?auto_585499 ) ) ( not ( = ?auto_585493 ?auto_585500 ) ) ( not ( = ?auto_585493 ?auto_585501 ) ) ( not ( = ?auto_585493 ?auto_585502 ) ) ( not ( = ?auto_585493 ?auto_585503 ) ) ( not ( = ?auto_585494 ?auto_585495 ) ) ( not ( = ?auto_585494 ?auto_585496 ) ) ( not ( = ?auto_585494 ?auto_585497 ) ) ( not ( = ?auto_585494 ?auto_585498 ) ) ( not ( = ?auto_585494 ?auto_585499 ) ) ( not ( = ?auto_585494 ?auto_585500 ) ) ( not ( = ?auto_585494 ?auto_585501 ) ) ( not ( = ?auto_585494 ?auto_585502 ) ) ( not ( = ?auto_585494 ?auto_585503 ) ) ( not ( = ?auto_585495 ?auto_585496 ) ) ( not ( = ?auto_585495 ?auto_585497 ) ) ( not ( = ?auto_585495 ?auto_585498 ) ) ( not ( = ?auto_585495 ?auto_585499 ) ) ( not ( = ?auto_585495 ?auto_585500 ) ) ( not ( = ?auto_585495 ?auto_585501 ) ) ( not ( = ?auto_585495 ?auto_585502 ) ) ( not ( = ?auto_585495 ?auto_585503 ) ) ( not ( = ?auto_585496 ?auto_585497 ) ) ( not ( = ?auto_585496 ?auto_585498 ) ) ( not ( = ?auto_585496 ?auto_585499 ) ) ( not ( = ?auto_585496 ?auto_585500 ) ) ( not ( = ?auto_585496 ?auto_585501 ) ) ( not ( = ?auto_585496 ?auto_585502 ) ) ( not ( = ?auto_585496 ?auto_585503 ) ) ( not ( = ?auto_585497 ?auto_585498 ) ) ( not ( = ?auto_585497 ?auto_585499 ) ) ( not ( = ?auto_585497 ?auto_585500 ) ) ( not ( = ?auto_585497 ?auto_585501 ) ) ( not ( = ?auto_585497 ?auto_585502 ) ) ( not ( = ?auto_585497 ?auto_585503 ) ) ( not ( = ?auto_585498 ?auto_585499 ) ) ( not ( = ?auto_585498 ?auto_585500 ) ) ( not ( = ?auto_585498 ?auto_585501 ) ) ( not ( = ?auto_585498 ?auto_585502 ) ) ( not ( = ?auto_585498 ?auto_585503 ) ) ( not ( = ?auto_585499 ?auto_585500 ) ) ( not ( = ?auto_585499 ?auto_585501 ) ) ( not ( = ?auto_585499 ?auto_585502 ) ) ( not ( = ?auto_585499 ?auto_585503 ) ) ( not ( = ?auto_585500 ?auto_585501 ) ) ( not ( = ?auto_585500 ?auto_585502 ) ) ( not ( = ?auto_585500 ?auto_585503 ) ) ( not ( = ?auto_585501 ?auto_585502 ) ) ( not ( = ?auto_585501 ?auto_585503 ) ) ( not ( = ?auto_585502 ?auto_585503 ) ) ( ON ?auto_585501 ?auto_585502 ) ( ON ?auto_585500 ?auto_585501 ) ( CLEAR ?auto_585498 ) ( ON ?auto_585499 ?auto_585500 ) ( CLEAR ?auto_585499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_585493 ?auto_585494 ?auto_585495 ?auto_585496 ?auto_585497 ?auto_585498 ?auto_585499 )
      ( MAKE-10PILE ?auto_585493 ?auto_585494 ?auto_585495 ?auto_585496 ?auto_585497 ?auto_585498 ?auto_585499 ?auto_585500 ?auto_585501 ?auto_585502 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_585535 - BLOCK
      ?auto_585536 - BLOCK
      ?auto_585537 - BLOCK
      ?auto_585538 - BLOCK
      ?auto_585539 - BLOCK
      ?auto_585540 - BLOCK
      ?auto_585541 - BLOCK
      ?auto_585542 - BLOCK
      ?auto_585543 - BLOCK
      ?auto_585544 - BLOCK
    )
    :vars
    (
      ?auto_585545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585544 ?auto_585545 ) ( ON-TABLE ?auto_585535 ) ( ON ?auto_585536 ?auto_585535 ) ( ON ?auto_585537 ?auto_585536 ) ( ON ?auto_585538 ?auto_585537 ) ( ON ?auto_585539 ?auto_585538 ) ( not ( = ?auto_585535 ?auto_585536 ) ) ( not ( = ?auto_585535 ?auto_585537 ) ) ( not ( = ?auto_585535 ?auto_585538 ) ) ( not ( = ?auto_585535 ?auto_585539 ) ) ( not ( = ?auto_585535 ?auto_585540 ) ) ( not ( = ?auto_585535 ?auto_585541 ) ) ( not ( = ?auto_585535 ?auto_585542 ) ) ( not ( = ?auto_585535 ?auto_585543 ) ) ( not ( = ?auto_585535 ?auto_585544 ) ) ( not ( = ?auto_585535 ?auto_585545 ) ) ( not ( = ?auto_585536 ?auto_585537 ) ) ( not ( = ?auto_585536 ?auto_585538 ) ) ( not ( = ?auto_585536 ?auto_585539 ) ) ( not ( = ?auto_585536 ?auto_585540 ) ) ( not ( = ?auto_585536 ?auto_585541 ) ) ( not ( = ?auto_585536 ?auto_585542 ) ) ( not ( = ?auto_585536 ?auto_585543 ) ) ( not ( = ?auto_585536 ?auto_585544 ) ) ( not ( = ?auto_585536 ?auto_585545 ) ) ( not ( = ?auto_585537 ?auto_585538 ) ) ( not ( = ?auto_585537 ?auto_585539 ) ) ( not ( = ?auto_585537 ?auto_585540 ) ) ( not ( = ?auto_585537 ?auto_585541 ) ) ( not ( = ?auto_585537 ?auto_585542 ) ) ( not ( = ?auto_585537 ?auto_585543 ) ) ( not ( = ?auto_585537 ?auto_585544 ) ) ( not ( = ?auto_585537 ?auto_585545 ) ) ( not ( = ?auto_585538 ?auto_585539 ) ) ( not ( = ?auto_585538 ?auto_585540 ) ) ( not ( = ?auto_585538 ?auto_585541 ) ) ( not ( = ?auto_585538 ?auto_585542 ) ) ( not ( = ?auto_585538 ?auto_585543 ) ) ( not ( = ?auto_585538 ?auto_585544 ) ) ( not ( = ?auto_585538 ?auto_585545 ) ) ( not ( = ?auto_585539 ?auto_585540 ) ) ( not ( = ?auto_585539 ?auto_585541 ) ) ( not ( = ?auto_585539 ?auto_585542 ) ) ( not ( = ?auto_585539 ?auto_585543 ) ) ( not ( = ?auto_585539 ?auto_585544 ) ) ( not ( = ?auto_585539 ?auto_585545 ) ) ( not ( = ?auto_585540 ?auto_585541 ) ) ( not ( = ?auto_585540 ?auto_585542 ) ) ( not ( = ?auto_585540 ?auto_585543 ) ) ( not ( = ?auto_585540 ?auto_585544 ) ) ( not ( = ?auto_585540 ?auto_585545 ) ) ( not ( = ?auto_585541 ?auto_585542 ) ) ( not ( = ?auto_585541 ?auto_585543 ) ) ( not ( = ?auto_585541 ?auto_585544 ) ) ( not ( = ?auto_585541 ?auto_585545 ) ) ( not ( = ?auto_585542 ?auto_585543 ) ) ( not ( = ?auto_585542 ?auto_585544 ) ) ( not ( = ?auto_585542 ?auto_585545 ) ) ( not ( = ?auto_585543 ?auto_585544 ) ) ( not ( = ?auto_585543 ?auto_585545 ) ) ( not ( = ?auto_585544 ?auto_585545 ) ) ( ON ?auto_585543 ?auto_585544 ) ( ON ?auto_585542 ?auto_585543 ) ( ON ?auto_585541 ?auto_585542 ) ( CLEAR ?auto_585539 ) ( ON ?auto_585540 ?auto_585541 ) ( CLEAR ?auto_585540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_585535 ?auto_585536 ?auto_585537 ?auto_585538 ?auto_585539 ?auto_585540 )
      ( MAKE-10PILE ?auto_585535 ?auto_585536 ?auto_585537 ?auto_585538 ?auto_585539 ?auto_585540 ?auto_585541 ?auto_585542 ?auto_585543 ?auto_585544 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_585577 - BLOCK
      ?auto_585578 - BLOCK
      ?auto_585579 - BLOCK
      ?auto_585580 - BLOCK
      ?auto_585581 - BLOCK
      ?auto_585582 - BLOCK
      ?auto_585583 - BLOCK
      ?auto_585584 - BLOCK
      ?auto_585585 - BLOCK
      ?auto_585586 - BLOCK
    )
    :vars
    (
      ?auto_585587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585586 ?auto_585587 ) ( ON-TABLE ?auto_585577 ) ( ON ?auto_585578 ?auto_585577 ) ( ON ?auto_585579 ?auto_585578 ) ( ON ?auto_585580 ?auto_585579 ) ( not ( = ?auto_585577 ?auto_585578 ) ) ( not ( = ?auto_585577 ?auto_585579 ) ) ( not ( = ?auto_585577 ?auto_585580 ) ) ( not ( = ?auto_585577 ?auto_585581 ) ) ( not ( = ?auto_585577 ?auto_585582 ) ) ( not ( = ?auto_585577 ?auto_585583 ) ) ( not ( = ?auto_585577 ?auto_585584 ) ) ( not ( = ?auto_585577 ?auto_585585 ) ) ( not ( = ?auto_585577 ?auto_585586 ) ) ( not ( = ?auto_585577 ?auto_585587 ) ) ( not ( = ?auto_585578 ?auto_585579 ) ) ( not ( = ?auto_585578 ?auto_585580 ) ) ( not ( = ?auto_585578 ?auto_585581 ) ) ( not ( = ?auto_585578 ?auto_585582 ) ) ( not ( = ?auto_585578 ?auto_585583 ) ) ( not ( = ?auto_585578 ?auto_585584 ) ) ( not ( = ?auto_585578 ?auto_585585 ) ) ( not ( = ?auto_585578 ?auto_585586 ) ) ( not ( = ?auto_585578 ?auto_585587 ) ) ( not ( = ?auto_585579 ?auto_585580 ) ) ( not ( = ?auto_585579 ?auto_585581 ) ) ( not ( = ?auto_585579 ?auto_585582 ) ) ( not ( = ?auto_585579 ?auto_585583 ) ) ( not ( = ?auto_585579 ?auto_585584 ) ) ( not ( = ?auto_585579 ?auto_585585 ) ) ( not ( = ?auto_585579 ?auto_585586 ) ) ( not ( = ?auto_585579 ?auto_585587 ) ) ( not ( = ?auto_585580 ?auto_585581 ) ) ( not ( = ?auto_585580 ?auto_585582 ) ) ( not ( = ?auto_585580 ?auto_585583 ) ) ( not ( = ?auto_585580 ?auto_585584 ) ) ( not ( = ?auto_585580 ?auto_585585 ) ) ( not ( = ?auto_585580 ?auto_585586 ) ) ( not ( = ?auto_585580 ?auto_585587 ) ) ( not ( = ?auto_585581 ?auto_585582 ) ) ( not ( = ?auto_585581 ?auto_585583 ) ) ( not ( = ?auto_585581 ?auto_585584 ) ) ( not ( = ?auto_585581 ?auto_585585 ) ) ( not ( = ?auto_585581 ?auto_585586 ) ) ( not ( = ?auto_585581 ?auto_585587 ) ) ( not ( = ?auto_585582 ?auto_585583 ) ) ( not ( = ?auto_585582 ?auto_585584 ) ) ( not ( = ?auto_585582 ?auto_585585 ) ) ( not ( = ?auto_585582 ?auto_585586 ) ) ( not ( = ?auto_585582 ?auto_585587 ) ) ( not ( = ?auto_585583 ?auto_585584 ) ) ( not ( = ?auto_585583 ?auto_585585 ) ) ( not ( = ?auto_585583 ?auto_585586 ) ) ( not ( = ?auto_585583 ?auto_585587 ) ) ( not ( = ?auto_585584 ?auto_585585 ) ) ( not ( = ?auto_585584 ?auto_585586 ) ) ( not ( = ?auto_585584 ?auto_585587 ) ) ( not ( = ?auto_585585 ?auto_585586 ) ) ( not ( = ?auto_585585 ?auto_585587 ) ) ( not ( = ?auto_585586 ?auto_585587 ) ) ( ON ?auto_585585 ?auto_585586 ) ( ON ?auto_585584 ?auto_585585 ) ( ON ?auto_585583 ?auto_585584 ) ( ON ?auto_585582 ?auto_585583 ) ( CLEAR ?auto_585580 ) ( ON ?auto_585581 ?auto_585582 ) ( CLEAR ?auto_585581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_585577 ?auto_585578 ?auto_585579 ?auto_585580 ?auto_585581 )
      ( MAKE-10PILE ?auto_585577 ?auto_585578 ?auto_585579 ?auto_585580 ?auto_585581 ?auto_585582 ?auto_585583 ?auto_585584 ?auto_585585 ?auto_585586 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_585619 - BLOCK
      ?auto_585620 - BLOCK
      ?auto_585621 - BLOCK
      ?auto_585622 - BLOCK
      ?auto_585623 - BLOCK
      ?auto_585624 - BLOCK
      ?auto_585625 - BLOCK
      ?auto_585626 - BLOCK
      ?auto_585627 - BLOCK
      ?auto_585628 - BLOCK
    )
    :vars
    (
      ?auto_585629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585628 ?auto_585629 ) ( ON-TABLE ?auto_585619 ) ( ON ?auto_585620 ?auto_585619 ) ( ON ?auto_585621 ?auto_585620 ) ( not ( = ?auto_585619 ?auto_585620 ) ) ( not ( = ?auto_585619 ?auto_585621 ) ) ( not ( = ?auto_585619 ?auto_585622 ) ) ( not ( = ?auto_585619 ?auto_585623 ) ) ( not ( = ?auto_585619 ?auto_585624 ) ) ( not ( = ?auto_585619 ?auto_585625 ) ) ( not ( = ?auto_585619 ?auto_585626 ) ) ( not ( = ?auto_585619 ?auto_585627 ) ) ( not ( = ?auto_585619 ?auto_585628 ) ) ( not ( = ?auto_585619 ?auto_585629 ) ) ( not ( = ?auto_585620 ?auto_585621 ) ) ( not ( = ?auto_585620 ?auto_585622 ) ) ( not ( = ?auto_585620 ?auto_585623 ) ) ( not ( = ?auto_585620 ?auto_585624 ) ) ( not ( = ?auto_585620 ?auto_585625 ) ) ( not ( = ?auto_585620 ?auto_585626 ) ) ( not ( = ?auto_585620 ?auto_585627 ) ) ( not ( = ?auto_585620 ?auto_585628 ) ) ( not ( = ?auto_585620 ?auto_585629 ) ) ( not ( = ?auto_585621 ?auto_585622 ) ) ( not ( = ?auto_585621 ?auto_585623 ) ) ( not ( = ?auto_585621 ?auto_585624 ) ) ( not ( = ?auto_585621 ?auto_585625 ) ) ( not ( = ?auto_585621 ?auto_585626 ) ) ( not ( = ?auto_585621 ?auto_585627 ) ) ( not ( = ?auto_585621 ?auto_585628 ) ) ( not ( = ?auto_585621 ?auto_585629 ) ) ( not ( = ?auto_585622 ?auto_585623 ) ) ( not ( = ?auto_585622 ?auto_585624 ) ) ( not ( = ?auto_585622 ?auto_585625 ) ) ( not ( = ?auto_585622 ?auto_585626 ) ) ( not ( = ?auto_585622 ?auto_585627 ) ) ( not ( = ?auto_585622 ?auto_585628 ) ) ( not ( = ?auto_585622 ?auto_585629 ) ) ( not ( = ?auto_585623 ?auto_585624 ) ) ( not ( = ?auto_585623 ?auto_585625 ) ) ( not ( = ?auto_585623 ?auto_585626 ) ) ( not ( = ?auto_585623 ?auto_585627 ) ) ( not ( = ?auto_585623 ?auto_585628 ) ) ( not ( = ?auto_585623 ?auto_585629 ) ) ( not ( = ?auto_585624 ?auto_585625 ) ) ( not ( = ?auto_585624 ?auto_585626 ) ) ( not ( = ?auto_585624 ?auto_585627 ) ) ( not ( = ?auto_585624 ?auto_585628 ) ) ( not ( = ?auto_585624 ?auto_585629 ) ) ( not ( = ?auto_585625 ?auto_585626 ) ) ( not ( = ?auto_585625 ?auto_585627 ) ) ( not ( = ?auto_585625 ?auto_585628 ) ) ( not ( = ?auto_585625 ?auto_585629 ) ) ( not ( = ?auto_585626 ?auto_585627 ) ) ( not ( = ?auto_585626 ?auto_585628 ) ) ( not ( = ?auto_585626 ?auto_585629 ) ) ( not ( = ?auto_585627 ?auto_585628 ) ) ( not ( = ?auto_585627 ?auto_585629 ) ) ( not ( = ?auto_585628 ?auto_585629 ) ) ( ON ?auto_585627 ?auto_585628 ) ( ON ?auto_585626 ?auto_585627 ) ( ON ?auto_585625 ?auto_585626 ) ( ON ?auto_585624 ?auto_585625 ) ( ON ?auto_585623 ?auto_585624 ) ( CLEAR ?auto_585621 ) ( ON ?auto_585622 ?auto_585623 ) ( CLEAR ?auto_585622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_585619 ?auto_585620 ?auto_585621 ?auto_585622 )
      ( MAKE-10PILE ?auto_585619 ?auto_585620 ?auto_585621 ?auto_585622 ?auto_585623 ?auto_585624 ?auto_585625 ?auto_585626 ?auto_585627 ?auto_585628 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_585661 - BLOCK
      ?auto_585662 - BLOCK
      ?auto_585663 - BLOCK
      ?auto_585664 - BLOCK
      ?auto_585665 - BLOCK
      ?auto_585666 - BLOCK
      ?auto_585667 - BLOCK
      ?auto_585668 - BLOCK
      ?auto_585669 - BLOCK
      ?auto_585670 - BLOCK
    )
    :vars
    (
      ?auto_585671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585670 ?auto_585671 ) ( ON-TABLE ?auto_585661 ) ( ON ?auto_585662 ?auto_585661 ) ( not ( = ?auto_585661 ?auto_585662 ) ) ( not ( = ?auto_585661 ?auto_585663 ) ) ( not ( = ?auto_585661 ?auto_585664 ) ) ( not ( = ?auto_585661 ?auto_585665 ) ) ( not ( = ?auto_585661 ?auto_585666 ) ) ( not ( = ?auto_585661 ?auto_585667 ) ) ( not ( = ?auto_585661 ?auto_585668 ) ) ( not ( = ?auto_585661 ?auto_585669 ) ) ( not ( = ?auto_585661 ?auto_585670 ) ) ( not ( = ?auto_585661 ?auto_585671 ) ) ( not ( = ?auto_585662 ?auto_585663 ) ) ( not ( = ?auto_585662 ?auto_585664 ) ) ( not ( = ?auto_585662 ?auto_585665 ) ) ( not ( = ?auto_585662 ?auto_585666 ) ) ( not ( = ?auto_585662 ?auto_585667 ) ) ( not ( = ?auto_585662 ?auto_585668 ) ) ( not ( = ?auto_585662 ?auto_585669 ) ) ( not ( = ?auto_585662 ?auto_585670 ) ) ( not ( = ?auto_585662 ?auto_585671 ) ) ( not ( = ?auto_585663 ?auto_585664 ) ) ( not ( = ?auto_585663 ?auto_585665 ) ) ( not ( = ?auto_585663 ?auto_585666 ) ) ( not ( = ?auto_585663 ?auto_585667 ) ) ( not ( = ?auto_585663 ?auto_585668 ) ) ( not ( = ?auto_585663 ?auto_585669 ) ) ( not ( = ?auto_585663 ?auto_585670 ) ) ( not ( = ?auto_585663 ?auto_585671 ) ) ( not ( = ?auto_585664 ?auto_585665 ) ) ( not ( = ?auto_585664 ?auto_585666 ) ) ( not ( = ?auto_585664 ?auto_585667 ) ) ( not ( = ?auto_585664 ?auto_585668 ) ) ( not ( = ?auto_585664 ?auto_585669 ) ) ( not ( = ?auto_585664 ?auto_585670 ) ) ( not ( = ?auto_585664 ?auto_585671 ) ) ( not ( = ?auto_585665 ?auto_585666 ) ) ( not ( = ?auto_585665 ?auto_585667 ) ) ( not ( = ?auto_585665 ?auto_585668 ) ) ( not ( = ?auto_585665 ?auto_585669 ) ) ( not ( = ?auto_585665 ?auto_585670 ) ) ( not ( = ?auto_585665 ?auto_585671 ) ) ( not ( = ?auto_585666 ?auto_585667 ) ) ( not ( = ?auto_585666 ?auto_585668 ) ) ( not ( = ?auto_585666 ?auto_585669 ) ) ( not ( = ?auto_585666 ?auto_585670 ) ) ( not ( = ?auto_585666 ?auto_585671 ) ) ( not ( = ?auto_585667 ?auto_585668 ) ) ( not ( = ?auto_585667 ?auto_585669 ) ) ( not ( = ?auto_585667 ?auto_585670 ) ) ( not ( = ?auto_585667 ?auto_585671 ) ) ( not ( = ?auto_585668 ?auto_585669 ) ) ( not ( = ?auto_585668 ?auto_585670 ) ) ( not ( = ?auto_585668 ?auto_585671 ) ) ( not ( = ?auto_585669 ?auto_585670 ) ) ( not ( = ?auto_585669 ?auto_585671 ) ) ( not ( = ?auto_585670 ?auto_585671 ) ) ( ON ?auto_585669 ?auto_585670 ) ( ON ?auto_585668 ?auto_585669 ) ( ON ?auto_585667 ?auto_585668 ) ( ON ?auto_585666 ?auto_585667 ) ( ON ?auto_585665 ?auto_585666 ) ( ON ?auto_585664 ?auto_585665 ) ( CLEAR ?auto_585662 ) ( ON ?auto_585663 ?auto_585664 ) ( CLEAR ?auto_585663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_585661 ?auto_585662 ?auto_585663 )
      ( MAKE-10PILE ?auto_585661 ?auto_585662 ?auto_585663 ?auto_585664 ?auto_585665 ?auto_585666 ?auto_585667 ?auto_585668 ?auto_585669 ?auto_585670 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_585703 - BLOCK
      ?auto_585704 - BLOCK
      ?auto_585705 - BLOCK
      ?auto_585706 - BLOCK
      ?auto_585707 - BLOCK
      ?auto_585708 - BLOCK
      ?auto_585709 - BLOCK
      ?auto_585710 - BLOCK
      ?auto_585711 - BLOCK
      ?auto_585712 - BLOCK
    )
    :vars
    (
      ?auto_585713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585712 ?auto_585713 ) ( ON-TABLE ?auto_585703 ) ( not ( = ?auto_585703 ?auto_585704 ) ) ( not ( = ?auto_585703 ?auto_585705 ) ) ( not ( = ?auto_585703 ?auto_585706 ) ) ( not ( = ?auto_585703 ?auto_585707 ) ) ( not ( = ?auto_585703 ?auto_585708 ) ) ( not ( = ?auto_585703 ?auto_585709 ) ) ( not ( = ?auto_585703 ?auto_585710 ) ) ( not ( = ?auto_585703 ?auto_585711 ) ) ( not ( = ?auto_585703 ?auto_585712 ) ) ( not ( = ?auto_585703 ?auto_585713 ) ) ( not ( = ?auto_585704 ?auto_585705 ) ) ( not ( = ?auto_585704 ?auto_585706 ) ) ( not ( = ?auto_585704 ?auto_585707 ) ) ( not ( = ?auto_585704 ?auto_585708 ) ) ( not ( = ?auto_585704 ?auto_585709 ) ) ( not ( = ?auto_585704 ?auto_585710 ) ) ( not ( = ?auto_585704 ?auto_585711 ) ) ( not ( = ?auto_585704 ?auto_585712 ) ) ( not ( = ?auto_585704 ?auto_585713 ) ) ( not ( = ?auto_585705 ?auto_585706 ) ) ( not ( = ?auto_585705 ?auto_585707 ) ) ( not ( = ?auto_585705 ?auto_585708 ) ) ( not ( = ?auto_585705 ?auto_585709 ) ) ( not ( = ?auto_585705 ?auto_585710 ) ) ( not ( = ?auto_585705 ?auto_585711 ) ) ( not ( = ?auto_585705 ?auto_585712 ) ) ( not ( = ?auto_585705 ?auto_585713 ) ) ( not ( = ?auto_585706 ?auto_585707 ) ) ( not ( = ?auto_585706 ?auto_585708 ) ) ( not ( = ?auto_585706 ?auto_585709 ) ) ( not ( = ?auto_585706 ?auto_585710 ) ) ( not ( = ?auto_585706 ?auto_585711 ) ) ( not ( = ?auto_585706 ?auto_585712 ) ) ( not ( = ?auto_585706 ?auto_585713 ) ) ( not ( = ?auto_585707 ?auto_585708 ) ) ( not ( = ?auto_585707 ?auto_585709 ) ) ( not ( = ?auto_585707 ?auto_585710 ) ) ( not ( = ?auto_585707 ?auto_585711 ) ) ( not ( = ?auto_585707 ?auto_585712 ) ) ( not ( = ?auto_585707 ?auto_585713 ) ) ( not ( = ?auto_585708 ?auto_585709 ) ) ( not ( = ?auto_585708 ?auto_585710 ) ) ( not ( = ?auto_585708 ?auto_585711 ) ) ( not ( = ?auto_585708 ?auto_585712 ) ) ( not ( = ?auto_585708 ?auto_585713 ) ) ( not ( = ?auto_585709 ?auto_585710 ) ) ( not ( = ?auto_585709 ?auto_585711 ) ) ( not ( = ?auto_585709 ?auto_585712 ) ) ( not ( = ?auto_585709 ?auto_585713 ) ) ( not ( = ?auto_585710 ?auto_585711 ) ) ( not ( = ?auto_585710 ?auto_585712 ) ) ( not ( = ?auto_585710 ?auto_585713 ) ) ( not ( = ?auto_585711 ?auto_585712 ) ) ( not ( = ?auto_585711 ?auto_585713 ) ) ( not ( = ?auto_585712 ?auto_585713 ) ) ( ON ?auto_585711 ?auto_585712 ) ( ON ?auto_585710 ?auto_585711 ) ( ON ?auto_585709 ?auto_585710 ) ( ON ?auto_585708 ?auto_585709 ) ( ON ?auto_585707 ?auto_585708 ) ( ON ?auto_585706 ?auto_585707 ) ( ON ?auto_585705 ?auto_585706 ) ( CLEAR ?auto_585703 ) ( ON ?auto_585704 ?auto_585705 ) ( CLEAR ?auto_585704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_585703 ?auto_585704 )
      ( MAKE-10PILE ?auto_585703 ?auto_585704 ?auto_585705 ?auto_585706 ?auto_585707 ?auto_585708 ?auto_585709 ?auto_585710 ?auto_585711 ?auto_585712 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_585745 - BLOCK
      ?auto_585746 - BLOCK
      ?auto_585747 - BLOCK
      ?auto_585748 - BLOCK
      ?auto_585749 - BLOCK
      ?auto_585750 - BLOCK
      ?auto_585751 - BLOCK
      ?auto_585752 - BLOCK
      ?auto_585753 - BLOCK
      ?auto_585754 - BLOCK
    )
    :vars
    (
      ?auto_585755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585754 ?auto_585755 ) ( not ( = ?auto_585745 ?auto_585746 ) ) ( not ( = ?auto_585745 ?auto_585747 ) ) ( not ( = ?auto_585745 ?auto_585748 ) ) ( not ( = ?auto_585745 ?auto_585749 ) ) ( not ( = ?auto_585745 ?auto_585750 ) ) ( not ( = ?auto_585745 ?auto_585751 ) ) ( not ( = ?auto_585745 ?auto_585752 ) ) ( not ( = ?auto_585745 ?auto_585753 ) ) ( not ( = ?auto_585745 ?auto_585754 ) ) ( not ( = ?auto_585745 ?auto_585755 ) ) ( not ( = ?auto_585746 ?auto_585747 ) ) ( not ( = ?auto_585746 ?auto_585748 ) ) ( not ( = ?auto_585746 ?auto_585749 ) ) ( not ( = ?auto_585746 ?auto_585750 ) ) ( not ( = ?auto_585746 ?auto_585751 ) ) ( not ( = ?auto_585746 ?auto_585752 ) ) ( not ( = ?auto_585746 ?auto_585753 ) ) ( not ( = ?auto_585746 ?auto_585754 ) ) ( not ( = ?auto_585746 ?auto_585755 ) ) ( not ( = ?auto_585747 ?auto_585748 ) ) ( not ( = ?auto_585747 ?auto_585749 ) ) ( not ( = ?auto_585747 ?auto_585750 ) ) ( not ( = ?auto_585747 ?auto_585751 ) ) ( not ( = ?auto_585747 ?auto_585752 ) ) ( not ( = ?auto_585747 ?auto_585753 ) ) ( not ( = ?auto_585747 ?auto_585754 ) ) ( not ( = ?auto_585747 ?auto_585755 ) ) ( not ( = ?auto_585748 ?auto_585749 ) ) ( not ( = ?auto_585748 ?auto_585750 ) ) ( not ( = ?auto_585748 ?auto_585751 ) ) ( not ( = ?auto_585748 ?auto_585752 ) ) ( not ( = ?auto_585748 ?auto_585753 ) ) ( not ( = ?auto_585748 ?auto_585754 ) ) ( not ( = ?auto_585748 ?auto_585755 ) ) ( not ( = ?auto_585749 ?auto_585750 ) ) ( not ( = ?auto_585749 ?auto_585751 ) ) ( not ( = ?auto_585749 ?auto_585752 ) ) ( not ( = ?auto_585749 ?auto_585753 ) ) ( not ( = ?auto_585749 ?auto_585754 ) ) ( not ( = ?auto_585749 ?auto_585755 ) ) ( not ( = ?auto_585750 ?auto_585751 ) ) ( not ( = ?auto_585750 ?auto_585752 ) ) ( not ( = ?auto_585750 ?auto_585753 ) ) ( not ( = ?auto_585750 ?auto_585754 ) ) ( not ( = ?auto_585750 ?auto_585755 ) ) ( not ( = ?auto_585751 ?auto_585752 ) ) ( not ( = ?auto_585751 ?auto_585753 ) ) ( not ( = ?auto_585751 ?auto_585754 ) ) ( not ( = ?auto_585751 ?auto_585755 ) ) ( not ( = ?auto_585752 ?auto_585753 ) ) ( not ( = ?auto_585752 ?auto_585754 ) ) ( not ( = ?auto_585752 ?auto_585755 ) ) ( not ( = ?auto_585753 ?auto_585754 ) ) ( not ( = ?auto_585753 ?auto_585755 ) ) ( not ( = ?auto_585754 ?auto_585755 ) ) ( ON ?auto_585753 ?auto_585754 ) ( ON ?auto_585752 ?auto_585753 ) ( ON ?auto_585751 ?auto_585752 ) ( ON ?auto_585750 ?auto_585751 ) ( ON ?auto_585749 ?auto_585750 ) ( ON ?auto_585748 ?auto_585749 ) ( ON ?auto_585747 ?auto_585748 ) ( ON ?auto_585746 ?auto_585747 ) ( ON ?auto_585745 ?auto_585746 ) ( CLEAR ?auto_585745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_585745 )
      ( MAKE-10PILE ?auto_585745 ?auto_585746 ?auto_585747 ?auto_585748 ?auto_585749 ?auto_585750 ?auto_585751 ?auto_585752 ?auto_585753 ?auto_585754 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_585788 - BLOCK
      ?auto_585789 - BLOCK
      ?auto_585790 - BLOCK
      ?auto_585791 - BLOCK
      ?auto_585792 - BLOCK
      ?auto_585793 - BLOCK
      ?auto_585794 - BLOCK
      ?auto_585795 - BLOCK
      ?auto_585796 - BLOCK
      ?auto_585797 - BLOCK
      ?auto_585798 - BLOCK
    )
    :vars
    (
      ?auto_585799 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_585797 ) ( ON ?auto_585798 ?auto_585799 ) ( CLEAR ?auto_585798 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_585788 ) ( ON ?auto_585789 ?auto_585788 ) ( ON ?auto_585790 ?auto_585789 ) ( ON ?auto_585791 ?auto_585790 ) ( ON ?auto_585792 ?auto_585791 ) ( ON ?auto_585793 ?auto_585792 ) ( ON ?auto_585794 ?auto_585793 ) ( ON ?auto_585795 ?auto_585794 ) ( ON ?auto_585796 ?auto_585795 ) ( ON ?auto_585797 ?auto_585796 ) ( not ( = ?auto_585788 ?auto_585789 ) ) ( not ( = ?auto_585788 ?auto_585790 ) ) ( not ( = ?auto_585788 ?auto_585791 ) ) ( not ( = ?auto_585788 ?auto_585792 ) ) ( not ( = ?auto_585788 ?auto_585793 ) ) ( not ( = ?auto_585788 ?auto_585794 ) ) ( not ( = ?auto_585788 ?auto_585795 ) ) ( not ( = ?auto_585788 ?auto_585796 ) ) ( not ( = ?auto_585788 ?auto_585797 ) ) ( not ( = ?auto_585788 ?auto_585798 ) ) ( not ( = ?auto_585788 ?auto_585799 ) ) ( not ( = ?auto_585789 ?auto_585790 ) ) ( not ( = ?auto_585789 ?auto_585791 ) ) ( not ( = ?auto_585789 ?auto_585792 ) ) ( not ( = ?auto_585789 ?auto_585793 ) ) ( not ( = ?auto_585789 ?auto_585794 ) ) ( not ( = ?auto_585789 ?auto_585795 ) ) ( not ( = ?auto_585789 ?auto_585796 ) ) ( not ( = ?auto_585789 ?auto_585797 ) ) ( not ( = ?auto_585789 ?auto_585798 ) ) ( not ( = ?auto_585789 ?auto_585799 ) ) ( not ( = ?auto_585790 ?auto_585791 ) ) ( not ( = ?auto_585790 ?auto_585792 ) ) ( not ( = ?auto_585790 ?auto_585793 ) ) ( not ( = ?auto_585790 ?auto_585794 ) ) ( not ( = ?auto_585790 ?auto_585795 ) ) ( not ( = ?auto_585790 ?auto_585796 ) ) ( not ( = ?auto_585790 ?auto_585797 ) ) ( not ( = ?auto_585790 ?auto_585798 ) ) ( not ( = ?auto_585790 ?auto_585799 ) ) ( not ( = ?auto_585791 ?auto_585792 ) ) ( not ( = ?auto_585791 ?auto_585793 ) ) ( not ( = ?auto_585791 ?auto_585794 ) ) ( not ( = ?auto_585791 ?auto_585795 ) ) ( not ( = ?auto_585791 ?auto_585796 ) ) ( not ( = ?auto_585791 ?auto_585797 ) ) ( not ( = ?auto_585791 ?auto_585798 ) ) ( not ( = ?auto_585791 ?auto_585799 ) ) ( not ( = ?auto_585792 ?auto_585793 ) ) ( not ( = ?auto_585792 ?auto_585794 ) ) ( not ( = ?auto_585792 ?auto_585795 ) ) ( not ( = ?auto_585792 ?auto_585796 ) ) ( not ( = ?auto_585792 ?auto_585797 ) ) ( not ( = ?auto_585792 ?auto_585798 ) ) ( not ( = ?auto_585792 ?auto_585799 ) ) ( not ( = ?auto_585793 ?auto_585794 ) ) ( not ( = ?auto_585793 ?auto_585795 ) ) ( not ( = ?auto_585793 ?auto_585796 ) ) ( not ( = ?auto_585793 ?auto_585797 ) ) ( not ( = ?auto_585793 ?auto_585798 ) ) ( not ( = ?auto_585793 ?auto_585799 ) ) ( not ( = ?auto_585794 ?auto_585795 ) ) ( not ( = ?auto_585794 ?auto_585796 ) ) ( not ( = ?auto_585794 ?auto_585797 ) ) ( not ( = ?auto_585794 ?auto_585798 ) ) ( not ( = ?auto_585794 ?auto_585799 ) ) ( not ( = ?auto_585795 ?auto_585796 ) ) ( not ( = ?auto_585795 ?auto_585797 ) ) ( not ( = ?auto_585795 ?auto_585798 ) ) ( not ( = ?auto_585795 ?auto_585799 ) ) ( not ( = ?auto_585796 ?auto_585797 ) ) ( not ( = ?auto_585796 ?auto_585798 ) ) ( not ( = ?auto_585796 ?auto_585799 ) ) ( not ( = ?auto_585797 ?auto_585798 ) ) ( not ( = ?auto_585797 ?auto_585799 ) ) ( not ( = ?auto_585798 ?auto_585799 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_585798 ?auto_585799 )
      ( !STACK ?auto_585798 ?auto_585797 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_585834 - BLOCK
      ?auto_585835 - BLOCK
      ?auto_585836 - BLOCK
      ?auto_585837 - BLOCK
      ?auto_585838 - BLOCK
      ?auto_585839 - BLOCK
      ?auto_585840 - BLOCK
      ?auto_585841 - BLOCK
      ?auto_585842 - BLOCK
      ?auto_585843 - BLOCK
      ?auto_585844 - BLOCK
    )
    :vars
    (
      ?auto_585845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585844 ?auto_585845 ) ( ON-TABLE ?auto_585834 ) ( ON ?auto_585835 ?auto_585834 ) ( ON ?auto_585836 ?auto_585835 ) ( ON ?auto_585837 ?auto_585836 ) ( ON ?auto_585838 ?auto_585837 ) ( ON ?auto_585839 ?auto_585838 ) ( ON ?auto_585840 ?auto_585839 ) ( ON ?auto_585841 ?auto_585840 ) ( ON ?auto_585842 ?auto_585841 ) ( not ( = ?auto_585834 ?auto_585835 ) ) ( not ( = ?auto_585834 ?auto_585836 ) ) ( not ( = ?auto_585834 ?auto_585837 ) ) ( not ( = ?auto_585834 ?auto_585838 ) ) ( not ( = ?auto_585834 ?auto_585839 ) ) ( not ( = ?auto_585834 ?auto_585840 ) ) ( not ( = ?auto_585834 ?auto_585841 ) ) ( not ( = ?auto_585834 ?auto_585842 ) ) ( not ( = ?auto_585834 ?auto_585843 ) ) ( not ( = ?auto_585834 ?auto_585844 ) ) ( not ( = ?auto_585834 ?auto_585845 ) ) ( not ( = ?auto_585835 ?auto_585836 ) ) ( not ( = ?auto_585835 ?auto_585837 ) ) ( not ( = ?auto_585835 ?auto_585838 ) ) ( not ( = ?auto_585835 ?auto_585839 ) ) ( not ( = ?auto_585835 ?auto_585840 ) ) ( not ( = ?auto_585835 ?auto_585841 ) ) ( not ( = ?auto_585835 ?auto_585842 ) ) ( not ( = ?auto_585835 ?auto_585843 ) ) ( not ( = ?auto_585835 ?auto_585844 ) ) ( not ( = ?auto_585835 ?auto_585845 ) ) ( not ( = ?auto_585836 ?auto_585837 ) ) ( not ( = ?auto_585836 ?auto_585838 ) ) ( not ( = ?auto_585836 ?auto_585839 ) ) ( not ( = ?auto_585836 ?auto_585840 ) ) ( not ( = ?auto_585836 ?auto_585841 ) ) ( not ( = ?auto_585836 ?auto_585842 ) ) ( not ( = ?auto_585836 ?auto_585843 ) ) ( not ( = ?auto_585836 ?auto_585844 ) ) ( not ( = ?auto_585836 ?auto_585845 ) ) ( not ( = ?auto_585837 ?auto_585838 ) ) ( not ( = ?auto_585837 ?auto_585839 ) ) ( not ( = ?auto_585837 ?auto_585840 ) ) ( not ( = ?auto_585837 ?auto_585841 ) ) ( not ( = ?auto_585837 ?auto_585842 ) ) ( not ( = ?auto_585837 ?auto_585843 ) ) ( not ( = ?auto_585837 ?auto_585844 ) ) ( not ( = ?auto_585837 ?auto_585845 ) ) ( not ( = ?auto_585838 ?auto_585839 ) ) ( not ( = ?auto_585838 ?auto_585840 ) ) ( not ( = ?auto_585838 ?auto_585841 ) ) ( not ( = ?auto_585838 ?auto_585842 ) ) ( not ( = ?auto_585838 ?auto_585843 ) ) ( not ( = ?auto_585838 ?auto_585844 ) ) ( not ( = ?auto_585838 ?auto_585845 ) ) ( not ( = ?auto_585839 ?auto_585840 ) ) ( not ( = ?auto_585839 ?auto_585841 ) ) ( not ( = ?auto_585839 ?auto_585842 ) ) ( not ( = ?auto_585839 ?auto_585843 ) ) ( not ( = ?auto_585839 ?auto_585844 ) ) ( not ( = ?auto_585839 ?auto_585845 ) ) ( not ( = ?auto_585840 ?auto_585841 ) ) ( not ( = ?auto_585840 ?auto_585842 ) ) ( not ( = ?auto_585840 ?auto_585843 ) ) ( not ( = ?auto_585840 ?auto_585844 ) ) ( not ( = ?auto_585840 ?auto_585845 ) ) ( not ( = ?auto_585841 ?auto_585842 ) ) ( not ( = ?auto_585841 ?auto_585843 ) ) ( not ( = ?auto_585841 ?auto_585844 ) ) ( not ( = ?auto_585841 ?auto_585845 ) ) ( not ( = ?auto_585842 ?auto_585843 ) ) ( not ( = ?auto_585842 ?auto_585844 ) ) ( not ( = ?auto_585842 ?auto_585845 ) ) ( not ( = ?auto_585843 ?auto_585844 ) ) ( not ( = ?auto_585843 ?auto_585845 ) ) ( not ( = ?auto_585844 ?auto_585845 ) ) ( CLEAR ?auto_585842 ) ( ON ?auto_585843 ?auto_585844 ) ( CLEAR ?auto_585843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_585834 ?auto_585835 ?auto_585836 ?auto_585837 ?auto_585838 ?auto_585839 ?auto_585840 ?auto_585841 ?auto_585842 ?auto_585843 )
      ( MAKE-11PILE ?auto_585834 ?auto_585835 ?auto_585836 ?auto_585837 ?auto_585838 ?auto_585839 ?auto_585840 ?auto_585841 ?auto_585842 ?auto_585843 ?auto_585844 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_585880 - BLOCK
      ?auto_585881 - BLOCK
      ?auto_585882 - BLOCK
      ?auto_585883 - BLOCK
      ?auto_585884 - BLOCK
      ?auto_585885 - BLOCK
      ?auto_585886 - BLOCK
      ?auto_585887 - BLOCK
      ?auto_585888 - BLOCK
      ?auto_585889 - BLOCK
      ?auto_585890 - BLOCK
    )
    :vars
    (
      ?auto_585891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585890 ?auto_585891 ) ( ON-TABLE ?auto_585880 ) ( ON ?auto_585881 ?auto_585880 ) ( ON ?auto_585882 ?auto_585881 ) ( ON ?auto_585883 ?auto_585882 ) ( ON ?auto_585884 ?auto_585883 ) ( ON ?auto_585885 ?auto_585884 ) ( ON ?auto_585886 ?auto_585885 ) ( ON ?auto_585887 ?auto_585886 ) ( not ( = ?auto_585880 ?auto_585881 ) ) ( not ( = ?auto_585880 ?auto_585882 ) ) ( not ( = ?auto_585880 ?auto_585883 ) ) ( not ( = ?auto_585880 ?auto_585884 ) ) ( not ( = ?auto_585880 ?auto_585885 ) ) ( not ( = ?auto_585880 ?auto_585886 ) ) ( not ( = ?auto_585880 ?auto_585887 ) ) ( not ( = ?auto_585880 ?auto_585888 ) ) ( not ( = ?auto_585880 ?auto_585889 ) ) ( not ( = ?auto_585880 ?auto_585890 ) ) ( not ( = ?auto_585880 ?auto_585891 ) ) ( not ( = ?auto_585881 ?auto_585882 ) ) ( not ( = ?auto_585881 ?auto_585883 ) ) ( not ( = ?auto_585881 ?auto_585884 ) ) ( not ( = ?auto_585881 ?auto_585885 ) ) ( not ( = ?auto_585881 ?auto_585886 ) ) ( not ( = ?auto_585881 ?auto_585887 ) ) ( not ( = ?auto_585881 ?auto_585888 ) ) ( not ( = ?auto_585881 ?auto_585889 ) ) ( not ( = ?auto_585881 ?auto_585890 ) ) ( not ( = ?auto_585881 ?auto_585891 ) ) ( not ( = ?auto_585882 ?auto_585883 ) ) ( not ( = ?auto_585882 ?auto_585884 ) ) ( not ( = ?auto_585882 ?auto_585885 ) ) ( not ( = ?auto_585882 ?auto_585886 ) ) ( not ( = ?auto_585882 ?auto_585887 ) ) ( not ( = ?auto_585882 ?auto_585888 ) ) ( not ( = ?auto_585882 ?auto_585889 ) ) ( not ( = ?auto_585882 ?auto_585890 ) ) ( not ( = ?auto_585882 ?auto_585891 ) ) ( not ( = ?auto_585883 ?auto_585884 ) ) ( not ( = ?auto_585883 ?auto_585885 ) ) ( not ( = ?auto_585883 ?auto_585886 ) ) ( not ( = ?auto_585883 ?auto_585887 ) ) ( not ( = ?auto_585883 ?auto_585888 ) ) ( not ( = ?auto_585883 ?auto_585889 ) ) ( not ( = ?auto_585883 ?auto_585890 ) ) ( not ( = ?auto_585883 ?auto_585891 ) ) ( not ( = ?auto_585884 ?auto_585885 ) ) ( not ( = ?auto_585884 ?auto_585886 ) ) ( not ( = ?auto_585884 ?auto_585887 ) ) ( not ( = ?auto_585884 ?auto_585888 ) ) ( not ( = ?auto_585884 ?auto_585889 ) ) ( not ( = ?auto_585884 ?auto_585890 ) ) ( not ( = ?auto_585884 ?auto_585891 ) ) ( not ( = ?auto_585885 ?auto_585886 ) ) ( not ( = ?auto_585885 ?auto_585887 ) ) ( not ( = ?auto_585885 ?auto_585888 ) ) ( not ( = ?auto_585885 ?auto_585889 ) ) ( not ( = ?auto_585885 ?auto_585890 ) ) ( not ( = ?auto_585885 ?auto_585891 ) ) ( not ( = ?auto_585886 ?auto_585887 ) ) ( not ( = ?auto_585886 ?auto_585888 ) ) ( not ( = ?auto_585886 ?auto_585889 ) ) ( not ( = ?auto_585886 ?auto_585890 ) ) ( not ( = ?auto_585886 ?auto_585891 ) ) ( not ( = ?auto_585887 ?auto_585888 ) ) ( not ( = ?auto_585887 ?auto_585889 ) ) ( not ( = ?auto_585887 ?auto_585890 ) ) ( not ( = ?auto_585887 ?auto_585891 ) ) ( not ( = ?auto_585888 ?auto_585889 ) ) ( not ( = ?auto_585888 ?auto_585890 ) ) ( not ( = ?auto_585888 ?auto_585891 ) ) ( not ( = ?auto_585889 ?auto_585890 ) ) ( not ( = ?auto_585889 ?auto_585891 ) ) ( not ( = ?auto_585890 ?auto_585891 ) ) ( ON ?auto_585889 ?auto_585890 ) ( CLEAR ?auto_585887 ) ( ON ?auto_585888 ?auto_585889 ) ( CLEAR ?auto_585888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_585880 ?auto_585881 ?auto_585882 ?auto_585883 ?auto_585884 ?auto_585885 ?auto_585886 ?auto_585887 ?auto_585888 )
      ( MAKE-11PILE ?auto_585880 ?auto_585881 ?auto_585882 ?auto_585883 ?auto_585884 ?auto_585885 ?auto_585886 ?auto_585887 ?auto_585888 ?auto_585889 ?auto_585890 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_585926 - BLOCK
      ?auto_585927 - BLOCK
      ?auto_585928 - BLOCK
      ?auto_585929 - BLOCK
      ?auto_585930 - BLOCK
      ?auto_585931 - BLOCK
      ?auto_585932 - BLOCK
      ?auto_585933 - BLOCK
      ?auto_585934 - BLOCK
      ?auto_585935 - BLOCK
      ?auto_585936 - BLOCK
    )
    :vars
    (
      ?auto_585937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585936 ?auto_585937 ) ( ON-TABLE ?auto_585926 ) ( ON ?auto_585927 ?auto_585926 ) ( ON ?auto_585928 ?auto_585927 ) ( ON ?auto_585929 ?auto_585928 ) ( ON ?auto_585930 ?auto_585929 ) ( ON ?auto_585931 ?auto_585930 ) ( ON ?auto_585932 ?auto_585931 ) ( not ( = ?auto_585926 ?auto_585927 ) ) ( not ( = ?auto_585926 ?auto_585928 ) ) ( not ( = ?auto_585926 ?auto_585929 ) ) ( not ( = ?auto_585926 ?auto_585930 ) ) ( not ( = ?auto_585926 ?auto_585931 ) ) ( not ( = ?auto_585926 ?auto_585932 ) ) ( not ( = ?auto_585926 ?auto_585933 ) ) ( not ( = ?auto_585926 ?auto_585934 ) ) ( not ( = ?auto_585926 ?auto_585935 ) ) ( not ( = ?auto_585926 ?auto_585936 ) ) ( not ( = ?auto_585926 ?auto_585937 ) ) ( not ( = ?auto_585927 ?auto_585928 ) ) ( not ( = ?auto_585927 ?auto_585929 ) ) ( not ( = ?auto_585927 ?auto_585930 ) ) ( not ( = ?auto_585927 ?auto_585931 ) ) ( not ( = ?auto_585927 ?auto_585932 ) ) ( not ( = ?auto_585927 ?auto_585933 ) ) ( not ( = ?auto_585927 ?auto_585934 ) ) ( not ( = ?auto_585927 ?auto_585935 ) ) ( not ( = ?auto_585927 ?auto_585936 ) ) ( not ( = ?auto_585927 ?auto_585937 ) ) ( not ( = ?auto_585928 ?auto_585929 ) ) ( not ( = ?auto_585928 ?auto_585930 ) ) ( not ( = ?auto_585928 ?auto_585931 ) ) ( not ( = ?auto_585928 ?auto_585932 ) ) ( not ( = ?auto_585928 ?auto_585933 ) ) ( not ( = ?auto_585928 ?auto_585934 ) ) ( not ( = ?auto_585928 ?auto_585935 ) ) ( not ( = ?auto_585928 ?auto_585936 ) ) ( not ( = ?auto_585928 ?auto_585937 ) ) ( not ( = ?auto_585929 ?auto_585930 ) ) ( not ( = ?auto_585929 ?auto_585931 ) ) ( not ( = ?auto_585929 ?auto_585932 ) ) ( not ( = ?auto_585929 ?auto_585933 ) ) ( not ( = ?auto_585929 ?auto_585934 ) ) ( not ( = ?auto_585929 ?auto_585935 ) ) ( not ( = ?auto_585929 ?auto_585936 ) ) ( not ( = ?auto_585929 ?auto_585937 ) ) ( not ( = ?auto_585930 ?auto_585931 ) ) ( not ( = ?auto_585930 ?auto_585932 ) ) ( not ( = ?auto_585930 ?auto_585933 ) ) ( not ( = ?auto_585930 ?auto_585934 ) ) ( not ( = ?auto_585930 ?auto_585935 ) ) ( not ( = ?auto_585930 ?auto_585936 ) ) ( not ( = ?auto_585930 ?auto_585937 ) ) ( not ( = ?auto_585931 ?auto_585932 ) ) ( not ( = ?auto_585931 ?auto_585933 ) ) ( not ( = ?auto_585931 ?auto_585934 ) ) ( not ( = ?auto_585931 ?auto_585935 ) ) ( not ( = ?auto_585931 ?auto_585936 ) ) ( not ( = ?auto_585931 ?auto_585937 ) ) ( not ( = ?auto_585932 ?auto_585933 ) ) ( not ( = ?auto_585932 ?auto_585934 ) ) ( not ( = ?auto_585932 ?auto_585935 ) ) ( not ( = ?auto_585932 ?auto_585936 ) ) ( not ( = ?auto_585932 ?auto_585937 ) ) ( not ( = ?auto_585933 ?auto_585934 ) ) ( not ( = ?auto_585933 ?auto_585935 ) ) ( not ( = ?auto_585933 ?auto_585936 ) ) ( not ( = ?auto_585933 ?auto_585937 ) ) ( not ( = ?auto_585934 ?auto_585935 ) ) ( not ( = ?auto_585934 ?auto_585936 ) ) ( not ( = ?auto_585934 ?auto_585937 ) ) ( not ( = ?auto_585935 ?auto_585936 ) ) ( not ( = ?auto_585935 ?auto_585937 ) ) ( not ( = ?auto_585936 ?auto_585937 ) ) ( ON ?auto_585935 ?auto_585936 ) ( ON ?auto_585934 ?auto_585935 ) ( CLEAR ?auto_585932 ) ( ON ?auto_585933 ?auto_585934 ) ( CLEAR ?auto_585933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_585926 ?auto_585927 ?auto_585928 ?auto_585929 ?auto_585930 ?auto_585931 ?auto_585932 ?auto_585933 )
      ( MAKE-11PILE ?auto_585926 ?auto_585927 ?auto_585928 ?auto_585929 ?auto_585930 ?auto_585931 ?auto_585932 ?auto_585933 ?auto_585934 ?auto_585935 ?auto_585936 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_585972 - BLOCK
      ?auto_585973 - BLOCK
      ?auto_585974 - BLOCK
      ?auto_585975 - BLOCK
      ?auto_585976 - BLOCK
      ?auto_585977 - BLOCK
      ?auto_585978 - BLOCK
      ?auto_585979 - BLOCK
      ?auto_585980 - BLOCK
      ?auto_585981 - BLOCK
      ?auto_585982 - BLOCK
    )
    :vars
    (
      ?auto_585983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_585982 ?auto_585983 ) ( ON-TABLE ?auto_585972 ) ( ON ?auto_585973 ?auto_585972 ) ( ON ?auto_585974 ?auto_585973 ) ( ON ?auto_585975 ?auto_585974 ) ( ON ?auto_585976 ?auto_585975 ) ( ON ?auto_585977 ?auto_585976 ) ( not ( = ?auto_585972 ?auto_585973 ) ) ( not ( = ?auto_585972 ?auto_585974 ) ) ( not ( = ?auto_585972 ?auto_585975 ) ) ( not ( = ?auto_585972 ?auto_585976 ) ) ( not ( = ?auto_585972 ?auto_585977 ) ) ( not ( = ?auto_585972 ?auto_585978 ) ) ( not ( = ?auto_585972 ?auto_585979 ) ) ( not ( = ?auto_585972 ?auto_585980 ) ) ( not ( = ?auto_585972 ?auto_585981 ) ) ( not ( = ?auto_585972 ?auto_585982 ) ) ( not ( = ?auto_585972 ?auto_585983 ) ) ( not ( = ?auto_585973 ?auto_585974 ) ) ( not ( = ?auto_585973 ?auto_585975 ) ) ( not ( = ?auto_585973 ?auto_585976 ) ) ( not ( = ?auto_585973 ?auto_585977 ) ) ( not ( = ?auto_585973 ?auto_585978 ) ) ( not ( = ?auto_585973 ?auto_585979 ) ) ( not ( = ?auto_585973 ?auto_585980 ) ) ( not ( = ?auto_585973 ?auto_585981 ) ) ( not ( = ?auto_585973 ?auto_585982 ) ) ( not ( = ?auto_585973 ?auto_585983 ) ) ( not ( = ?auto_585974 ?auto_585975 ) ) ( not ( = ?auto_585974 ?auto_585976 ) ) ( not ( = ?auto_585974 ?auto_585977 ) ) ( not ( = ?auto_585974 ?auto_585978 ) ) ( not ( = ?auto_585974 ?auto_585979 ) ) ( not ( = ?auto_585974 ?auto_585980 ) ) ( not ( = ?auto_585974 ?auto_585981 ) ) ( not ( = ?auto_585974 ?auto_585982 ) ) ( not ( = ?auto_585974 ?auto_585983 ) ) ( not ( = ?auto_585975 ?auto_585976 ) ) ( not ( = ?auto_585975 ?auto_585977 ) ) ( not ( = ?auto_585975 ?auto_585978 ) ) ( not ( = ?auto_585975 ?auto_585979 ) ) ( not ( = ?auto_585975 ?auto_585980 ) ) ( not ( = ?auto_585975 ?auto_585981 ) ) ( not ( = ?auto_585975 ?auto_585982 ) ) ( not ( = ?auto_585975 ?auto_585983 ) ) ( not ( = ?auto_585976 ?auto_585977 ) ) ( not ( = ?auto_585976 ?auto_585978 ) ) ( not ( = ?auto_585976 ?auto_585979 ) ) ( not ( = ?auto_585976 ?auto_585980 ) ) ( not ( = ?auto_585976 ?auto_585981 ) ) ( not ( = ?auto_585976 ?auto_585982 ) ) ( not ( = ?auto_585976 ?auto_585983 ) ) ( not ( = ?auto_585977 ?auto_585978 ) ) ( not ( = ?auto_585977 ?auto_585979 ) ) ( not ( = ?auto_585977 ?auto_585980 ) ) ( not ( = ?auto_585977 ?auto_585981 ) ) ( not ( = ?auto_585977 ?auto_585982 ) ) ( not ( = ?auto_585977 ?auto_585983 ) ) ( not ( = ?auto_585978 ?auto_585979 ) ) ( not ( = ?auto_585978 ?auto_585980 ) ) ( not ( = ?auto_585978 ?auto_585981 ) ) ( not ( = ?auto_585978 ?auto_585982 ) ) ( not ( = ?auto_585978 ?auto_585983 ) ) ( not ( = ?auto_585979 ?auto_585980 ) ) ( not ( = ?auto_585979 ?auto_585981 ) ) ( not ( = ?auto_585979 ?auto_585982 ) ) ( not ( = ?auto_585979 ?auto_585983 ) ) ( not ( = ?auto_585980 ?auto_585981 ) ) ( not ( = ?auto_585980 ?auto_585982 ) ) ( not ( = ?auto_585980 ?auto_585983 ) ) ( not ( = ?auto_585981 ?auto_585982 ) ) ( not ( = ?auto_585981 ?auto_585983 ) ) ( not ( = ?auto_585982 ?auto_585983 ) ) ( ON ?auto_585981 ?auto_585982 ) ( ON ?auto_585980 ?auto_585981 ) ( ON ?auto_585979 ?auto_585980 ) ( CLEAR ?auto_585977 ) ( ON ?auto_585978 ?auto_585979 ) ( CLEAR ?auto_585978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_585972 ?auto_585973 ?auto_585974 ?auto_585975 ?auto_585976 ?auto_585977 ?auto_585978 )
      ( MAKE-11PILE ?auto_585972 ?auto_585973 ?auto_585974 ?auto_585975 ?auto_585976 ?auto_585977 ?auto_585978 ?auto_585979 ?auto_585980 ?auto_585981 ?auto_585982 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_586018 - BLOCK
      ?auto_586019 - BLOCK
      ?auto_586020 - BLOCK
      ?auto_586021 - BLOCK
      ?auto_586022 - BLOCK
      ?auto_586023 - BLOCK
      ?auto_586024 - BLOCK
      ?auto_586025 - BLOCK
      ?auto_586026 - BLOCK
      ?auto_586027 - BLOCK
      ?auto_586028 - BLOCK
    )
    :vars
    (
      ?auto_586029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586028 ?auto_586029 ) ( ON-TABLE ?auto_586018 ) ( ON ?auto_586019 ?auto_586018 ) ( ON ?auto_586020 ?auto_586019 ) ( ON ?auto_586021 ?auto_586020 ) ( ON ?auto_586022 ?auto_586021 ) ( not ( = ?auto_586018 ?auto_586019 ) ) ( not ( = ?auto_586018 ?auto_586020 ) ) ( not ( = ?auto_586018 ?auto_586021 ) ) ( not ( = ?auto_586018 ?auto_586022 ) ) ( not ( = ?auto_586018 ?auto_586023 ) ) ( not ( = ?auto_586018 ?auto_586024 ) ) ( not ( = ?auto_586018 ?auto_586025 ) ) ( not ( = ?auto_586018 ?auto_586026 ) ) ( not ( = ?auto_586018 ?auto_586027 ) ) ( not ( = ?auto_586018 ?auto_586028 ) ) ( not ( = ?auto_586018 ?auto_586029 ) ) ( not ( = ?auto_586019 ?auto_586020 ) ) ( not ( = ?auto_586019 ?auto_586021 ) ) ( not ( = ?auto_586019 ?auto_586022 ) ) ( not ( = ?auto_586019 ?auto_586023 ) ) ( not ( = ?auto_586019 ?auto_586024 ) ) ( not ( = ?auto_586019 ?auto_586025 ) ) ( not ( = ?auto_586019 ?auto_586026 ) ) ( not ( = ?auto_586019 ?auto_586027 ) ) ( not ( = ?auto_586019 ?auto_586028 ) ) ( not ( = ?auto_586019 ?auto_586029 ) ) ( not ( = ?auto_586020 ?auto_586021 ) ) ( not ( = ?auto_586020 ?auto_586022 ) ) ( not ( = ?auto_586020 ?auto_586023 ) ) ( not ( = ?auto_586020 ?auto_586024 ) ) ( not ( = ?auto_586020 ?auto_586025 ) ) ( not ( = ?auto_586020 ?auto_586026 ) ) ( not ( = ?auto_586020 ?auto_586027 ) ) ( not ( = ?auto_586020 ?auto_586028 ) ) ( not ( = ?auto_586020 ?auto_586029 ) ) ( not ( = ?auto_586021 ?auto_586022 ) ) ( not ( = ?auto_586021 ?auto_586023 ) ) ( not ( = ?auto_586021 ?auto_586024 ) ) ( not ( = ?auto_586021 ?auto_586025 ) ) ( not ( = ?auto_586021 ?auto_586026 ) ) ( not ( = ?auto_586021 ?auto_586027 ) ) ( not ( = ?auto_586021 ?auto_586028 ) ) ( not ( = ?auto_586021 ?auto_586029 ) ) ( not ( = ?auto_586022 ?auto_586023 ) ) ( not ( = ?auto_586022 ?auto_586024 ) ) ( not ( = ?auto_586022 ?auto_586025 ) ) ( not ( = ?auto_586022 ?auto_586026 ) ) ( not ( = ?auto_586022 ?auto_586027 ) ) ( not ( = ?auto_586022 ?auto_586028 ) ) ( not ( = ?auto_586022 ?auto_586029 ) ) ( not ( = ?auto_586023 ?auto_586024 ) ) ( not ( = ?auto_586023 ?auto_586025 ) ) ( not ( = ?auto_586023 ?auto_586026 ) ) ( not ( = ?auto_586023 ?auto_586027 ) ) ( not ( = ?auto_586023 ?auto_586028 ) ) ( not ( = ?auto_586023 ?auto_586029 ) ) ( not ( = ?auto_586024 ?auto_586025 ) ) ( not ( = ?auto_586024 ?auto_586026 ) ) ( not ( = ?auto_586024 ?auto_586027 ) ) ( not ( = ?auto_586024 ?auto_586028 ) ) ( not ( = ?auto_586024 ?auto_586029 ) ) ( not ( = ?auto_586025 ?auto_586026 ) ) ( not ( = ?auto_586025 ?auto_586027 ) ) ( not ( = ?auto_586025 ?auto_586028 ) ) ( not ( = ?auto_586025 ?auto_586029 ) ) ( not ( = ?auto_586026 ?auto_586027 ) ) ( not ( = ?auto_586026 ?auto_586028 ) ) ( not ( = ?auto_586026 ?auto_586029 ) ) ( not ( = ?auto_586027 ?auto_586028 ) ) ( not ( = ?auto_586027 ?auto_586029 ) ) ( not ( = ?auto_586028 ?auto_586029 ) ) ( ON ?auto_586027 ?auto_586028 ) ( ON ?auto_586026 ?auto_586027 ) ( ON ?auto_586025 ?auto_586026 ) ( ON ?auto_586024 ?auto_586025 ) ( CLEAR ?auto_586022 ) ( ON ?auto_586023 ?auto_586024 ) ( CLEAR ?auto_586023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_586018 ?auto_586019 ?auto_586020 ?auto_586021 ?auto_586022 ?auto_586023 )
      ( MAKE-11PILE ?auto_586018 ?auto_586019 ?auto_586020 ?auto_586021 ?auto_586022 ?auto_586023 ?auto_586024 ?auto_586025 ?auto_586026 ?auto_586027 ?auto_586028 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_586064 - BLOCK
      ?auto_586065 - BLOCK
      ?auto_586066 - BLOCK
      ?auto_586067 - BLOCK
      ?auto_586068 - BLOCK
      ?auto_586069 - BLOCK
      ?auto_586070 - BLOCK
      ?auto_586071 - BLOCK
      ?auto_586072 - BLOCK
      ?auto_586073 - BLOCK
      ?auto_586074 - BLOCK
    )
    :vars
    (
      ?auto_586075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586074 ?auto_586075 ) ( ON-TABLE ?auto_586064 ) ( ON ?auto_586065 ?auto_586064 ) ( ON ?auto_586066 ?auto_586065 ) ( ON ?auto_586067 ?auto_586066 ) ( not ( = ?auto_586064 ?auto_586065 ) ) ( not ( = ?auto_586064 ?auto_586066 ) ) ( not ( = ?auto_586064 ?auto_586067 ) ) ( not ( = ?auto_586064 ?auto_586068 ) ) ( not ( = ?auto_586064 ?auto_586069 ) ) ( not ( = ?auto_586064 ?auto_586070 ) ) ( not ( = ?auto_586064 ?auto_586071 ) ) ( not ( = ?auto_586064 ?auto_586072 ) ) ( not ( = ?auto_586064 ?auto_586073 ) ) ( not ( = ?auto_586064 ?auto_586074 ) ) ( not ( = ?auto_586064 ?auto_586075 ) ) ( not ( = ?auto_586065 ?auto_586066 ) ) ( not ( = ?auto_586065 ?auto_586067 ) ) ( not ( = ?auto_586065 ?auto_586068 ) ) ( not ( = ?auto_586065 ?auto_586069 ) ) ( not ( = ?auto_586065 ?auto_586070 ) ) ( not ( = ?auto_586065 ?auto_586071 ) ) ( not ( = ?auto_586065 ?auto_586072 ) ) ( not ( = ?auto_586065 ?auto_586073 ) ) ( not ( = ?auto_586065 ?auto_586074 ) ) ( not ( = ?auto_586065 ?auto_586075 ) ) ( not ( = ?auto_586066 ?auto_586067 ) ) ( not ( = ?auto_586066 ?auto_586068 ) ) ( not ( = ?auto_586066 ?auto_586069 ) ) ( not ( = ?auto_586066 ?auto_586070 ) ) ( not ( = ?auto_586066 ?auto_586071 ) ) ( not ( = ?auto_586066 ?auto_586072 ) ) ( not ( = ?auto_586066 ?auto_586073 ) ) ( not ( = ?auto_586066 ?auto_586074 ) ) ( not ( = ?auto_586066 ?auto_586075 ) ) ( not ( = ?auto_586067 ?auto_586068 ) ) ( not ( = ?auto_586067 ?auto_586069 ) ) ( not ( = ?auto_586067 ?auto_586070 ) ) ( not ( = ?auto_586067 ?auto_586071 ) ) ( not ( = ?auto_586067 ?auto_586072 ) ) ( not ( = ?auto_586067 ?auto_586073 ) ) ( not ( = ?auto_586067 ?auto_586074 ) ) ( not ( = ?auto_586067 ?auto_586075 ) ) ( not ( = ?auto_586068 ?auto_586069 ) ) ( not ( = ?auto_586068 ?auto_586070 ) ) ( not ( = ?auto_586068 ?auto_586071 ) ) ( not ( = ?auto_586068 ?auto_586072 ) ) ( not ( = ?auto_586068 ?auto_586073 ) ) ( not ( = ?auto_586068 ?auto_586074 ) ) ( not ( = ?auto_586068 ?auto_586075 ) ) ( not ( = ?auto_586069 ?auto_586070 ) ) ( not ( = ?auto_586069 ?auto_586071 ) ) ( not ( = ?auto_586069 ?auto_586072 ) ) ( not ( = ?auto_586069 ?auto_586073 ) ) ( not ( = ?auto_586069 ?auto_586074 ) ) ( not ( = ?auto_586069 ?auto_586075 ) ) ( not ( = ?auto_586070 ?auto_586071 ) ) ( not ( = ?auto_586070 ?auto_586072 ) ) ( not ( = ?auto_586070 ?auto_586073 ) ) ( not ( = ?auto_586070 ?auto_586074 ) ) ( not ( = ?auto_586070 ?auto_586075 ) ) ( not ( = ?auto_586071 ?auto_586072 ) ) ( not ( = ?auto_586071 ?auto_586073 ) ) ( not ( = ?auto_586071 ?auto_586074 ) ) ( not ( = ?auto_586071 ?auto_586075 ) ) ( not ( = ?auto_586072 ?auto_586073 ) ) ( not ( = ?auto_586072 ?auto_586074 ) ) ( not ( = ?auto_586072 ?auto_586075 ) ) ( not ( = ?auto_586073 ?auto_586074 ) ) ( not ( = ?auto_586073 ?auto_586075 ) ) ( not ( = ?auto_586074 ?auto_586075 ) ) ( ON ?auto_586073 ?auto_586074 ) ( ON ?auto_586072 ?auto_586073 ) ( ON ?auto_586071 ?auto_586072 ) ( ON ?auto_586070 ?auto_586071 ) ( ON ?auto_586069 ?auto_586070 ) ( CLEAR ?auto_586067 ) ( ON ?auto_586068 ?auto_586069 ) ( CLEAR ?auto_586068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_586064 ?auto_586065 ?auto_586066 ?auto_586067 ?auto_586068 )
      ( MAKE-11PILE ?auto_586064 ?auto_586065 ?auto_586066 ?auto_586067 ?auto_586068 ?auto_586069 ?auto_586070 ?auto_586071 ?auto_586072 ?auto_586073 ?auto_586074 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_586110 - BLOCK
      ?auto_586111 - BLOCK
      ?auto_586112 - BLOCK
      ?auto_586113 - BLOCK
      ?auto_586114 - BLOCK
      ?auto_586115 - BLOCK
      ?auto_586116 - BLOCK
      ?auto_586117 - BLOCK
      ?auto_586118 - BLOCK
      ?auto_586119 - BLOCK
      ?auto_586120 - BLOCK
    )
    :vars
    (
      ?auto_586121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586120 ?auto_586121 ) ( ON-TABLE ?auto_586110 ) ( ON ?auto_586111 ?auto_586110 ) ( ON ?auto_586112 ?auto_586111 ) ( not ( = ?auto_586110 ?auto_586111 ) ) ( not ( = ?auto_586110 ?auto_586112 ) ) ( not ( = ?auto_586110 ?auto_586113 ) ) ( not ( = ?auto_586110 ?auto_586114 ) ) ( not ( = ?auto_586110 ?auto_586115 ) ) ( not ( = ?auto_586110 ?auto_586116 ) ) ( not ( = ?auto_586110 ?auto_586117 ) ) ( not ( = ?auto_586110 ?auto_586118 ) ) ( not ( = ?auto_586110 ?auto_586119 ) ) ( not ( = ?auto_586110 ?auto_586120 ) ) ( not ( = ?auto_586110 ?auto_586121 ) ) ( not ( = ?auto_586111 ?auto_586112 ) ) ( not ( = ?auto_586111 ?auto_586113 ) ) ( not ( = ?auto_586111 ?auto_586114 ) ) ( not ( = ?auto_586111 ?auto_586115 ) ) ( not ( = ?auto_586111 ?auto_586116 ) ) ( not ( = ?auto_586111 ?auto_586117 ) ) ( not ( = ?auto_586111 ?auto_586118 ) ) ( not ( = ?auto_586111 ?auto_586119 ) ) ( not ( = ?auto_586111 ?auto_586120 ) ) ( not ( = ?auto_586111 ?auto_586121 ) ) ( not ( = ?auto_586112 ?auto_586113 ) ) ( not ( = ?auto_586112 ?auto_586114 ) ) ( not ( = ?auto_586112 ?auto_586115 ) ) ( not ( = ?auto_586112 ?auto_586116 ) ) ( not ( = ?auto_586112 ?auto_586117 ) ) ( not ( = ?auto_586112 ?auto_586118 ) ) ( not ( = ?auto_586112 ?auto_586119 ) ) ( not ( = ?auto_586112 ?auto_586120 ) ) ( not ( = ?auto_586112 ?auto_586121 ) ) ( not ( = ?auto_586113 ?auto_586114 ) ) ( not ( = ?auto_586113 ?auto_586115 ) ) ( not ( = ?auto_586113 ?auto_586116 ) ) ( not ( = ?auto_586113 ?auto_586117 ) ) ( not ( = ?auto_586113 ?auto_586118 ) ) ( not ( = ?auto_586113 ?auto_586119 ) ) ( not ( = ?auto_586113 ?auto_586120 ) ) ( not ( = ?auto_586113 ?auto_586121 ) ) ( not ( = ?auto_586114 ?auto_586115 ) ) ( not ( = ?auto_586114 ?auto_586116 ) ) ( not ( = ?auto_586114 ?auto_586117 ) ) ( not ( = ?auto_586114 ?auto_586118 ) ) ( not ( = ?auto_586114 ?auto_586119 ) ) ( not ( = ?auto_586114 ?auto_586120 ) ) ( not ( = ?auto_586114 ?auto_586121 ) ) ( not ( = ?auto_586115 ?auto_586116 ) ) ( not ( = ?auto_586115 ?auto_586117 ) ) ( not ( = ?auto_586115 ?auto_586118 ) ) ( not ( = ?auto_586115 ?auto_586119 ) ) ( not ( = ?auto_586115 ?auto_586120 ) ) ( not ( = ?auto_586115 ?auto_586121 ) ) ( not ( = ?auto_586116 ?auto_586117 ) ) ( not ( = ?auto_586116 ?auto_586118 ) ) ( not ( = ?auto_586116 ?auto_586119 ) ) ( not ( = ?auto_586116 ?auto_586120 ) ) ( not ( = ?auto_586116 ?auto_586121 ) ) ( not ( = ?auto_586117 ?auto_586118 ) ) ( not ( = ?auto_586117 ?auto_586119 ) ) ( not ( = ?auto_586117 ?auto_586120 ) ) ( not ( = ?auto_586117 ?auto_586121 ) ) ( not ( = ?auto_586118 ?auto_586119 ) ) ( not ( = ?auto_586118 ?auto_586120 ) ) ( not ( = ?auto_586118 ?auto_586121 ) ) ( not ( = ?auto_586119 ?auto_586120 ) ) ( not ( = ?auto_586119 ?auto_586121 ) ) ( not ( = ?auto_586120 ?auto_586121 ) ) ( ON ?auto_586119 ?auto_586120 ) ( ON ?auto_586118 ?auto_586119 ) ( ON ?auto_586117 ?auto_586118 ) ( ON ?auto_586116 ?auto_586117 ) ( ON ?auto_586115 ?auto_586116 ) ( ON ?auto_586114 ?auto_586115 ) ( CLEAR ?auto_586112 ) ( ON ?auto_586113 ?auto_586114 ) ( CLEAR ?auto_586113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_586110 ?auto_586111 ?auto_586112 ?auto_586113 )
      ( MAKE-11PILE ?auto_586110 ?auto_586111 ?auto_586112 ?auto_586113 ?auto_586114 ?auto_586115 ?auto_586116 ?auto_586117 ?auto_586118 ?auto_586119 ?auto_586120 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_586156 - BLOCK
      ?auto_586157 - BLOCK
      ?auto_586158 - BLOCK
      ?auto_586159 - BLOCK
      ?auto_586160 - BLOCK
      ?auto_586161 - BLOCK
      ?auto_586162 - BLOCK
      ?auto_586163 - BLOCK
      ?auto_586164 - BLOCK
      ?auto_586165 - BLOCK
      ?auto_586166 - BLOCK
    )
    :vars
    (
      ?auto_586167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586166 ?auto_586167 ) ( ON-TABLE ?auto_586156 ) ( ON ?auto_586157 ?auto_586156 ) ( not ( = ?auto_586156 ?auto_586157 ) ) ( not ( = ?auto_586156 ?auto_586158 ) ) ( not ( = ?auto_586156 ?auto_586159 ) ) ( not ( = ?auto_586156 ?auto_586160 ) ) ( not ( = ?auto_586156 ?auto_586161 ) ) ( not ( = ?auto_586156 ?auto_586162 ) ) ( not ( = ?auto_586156 ?auto_586163 ) ) ( not ( = ?auto_586156 ?auto_586164 ) ) ( not ( = ?auto_586156 ?auto_586165 ) ) ( not ( = ?auto_586156 ?auto_586166 ) ) ( not ( = ?auto_586156 ?auto_586167 ) ) ( not ( = ?auto_586157 ?auto_586158 ) ) ( not ( = ?auto_586157 ?auto_586159 ) ) ( not ( = ?auto_586157 ?auto_586160 ) ) ( not ( = ?auto_586157 ?auto_586161 ) ) ( not ( = ?auto_586157 ?auto_586162 ) ) ( not ( = ?auto_586157 ?auto_586163 ) ) ( not ( = ?auto_586157 ?auto_586164 ) ) ( not ( = ?auto_586157 ?auto_586165 ) ) ( not ( = ?auto_586157 ?auto_586166 ) ) ( not ( = ?auto_586157 ?auto_586167 ) ) ( not ( = ?auto_586158 ?auto_586159 ) ) ( not ( = ?auto_586158 ?auto_586160 ) ) ( not ( = ?auto_586158 ?auto_586161 ) ) ( not ( = ?auto_586158 ?auto_586162 ) ) ( not ( = ?auto_586158 ?auto_586163 ) ) ( not ( = ?auto_586158 ?auto_586164 ) ) ( not ( = ?auto_586158 ?auto_586165 ) ) ( not ( = ?auto_586158 ?auto_586166 ) ) ( not ( = ?auto_586158 ?auto_586167 ) ) ( not ( = ?auto_586159 ?auto_586160 ) ) ( not ( = ?auto_586159 ?auto_586161 ) ) ( not ( = ?auto_586159 ?auto_586162 ) ) ( not ( = ?auto_586159 ?auto_586163 ) ) ( not ( = ?auto_586159 ?auto_586164 ) ) ( not ( = ?auto_586159 ?auto_586165 ) ) ( not ( = ?auto_586159 ?auto_586166 ) ) ( not ( = ?auto_586159 ?auto_586167 ) ) ( not ( = ?auto_586160 ?auto_586161 ) ) ( not ( = ?auto_586160 ?auto_586162 ) ) ( not ( = ?auto_586160 ?auto_586163 ) ) ( not ( = ?auto_586160 ?auto_586164 ) ) ( not ( = ?auto_586160 ?auto_586165 ) ) ( not ( = ?auto_586160 ?auto_586166 ) ) ( not ( = ?auto_586160 ?auto_586167 ) ) ( not ( = ?auto_586161 ?auto_586162 ) ) ( not ( = ?auto_586161 ?auto_586163 ) ) ( not ( = ?auto_586161 ?auto_586164 ) ) ( not ( = ?auto_586161 ?auto_586165 ) ) ( not ( = ?auto_586161 ?auto_586166 ) ) ( not ( = ?auto_586161 ?auto_586167 ) ) ( not ( = ?auto_586162 ?auto_586163 ) ) ( not ( = ?auto_586162 ?auto_586164 ) ) ( not ( = ?auto_586162 ?auto_586165 ) ) ( not ( = ?auto_586162 ?auto_586166 ) ) ( not ( = ?auto_586162 ?auto_586167 ) ) ( not ( = ?auto_586163 ?auto_586164 ) ) ( not ( = ?auto_586163 ?auto_586165 ) ) ( not ( = ?auto_586163 ?auto_586166 ) ) ( not ( = ?auto_586163 ?auto_586167 ) ) ( not ( = ?auto_586164 ?auto_586165 ) ) ( not ( = ?auto_586164 ?auto_586166 ) ) ( not ( = ?auto_586164 ?auto_586167 ) ) ( not ( = ?auto_586165 ?auto_586166 ) ) ( not ( = ?auto_586165 ?auto_586167 ) ) ( not ( = ?auto_586166 ?auto_586167 ) ) ( ON ?auto_586165 ?auto_586166 ) ( ON ?auto_586164 ?auto_586165 ) ( ON ?auto_586163 ?auto_586164 ) ( ON ?auto_586162 ?auto_586163 ) ( ON ?auto_586161 ?auto_586162 ) ( ON ?auto_586160 ?auto_586161 ) ( ON ?auto_586159 ?auto_586160 ) ( CLEAR ?auto_586157 ) ( ON ?auto_586158 ?auto_586159 ) ( CLEAR ?auto_586158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_586156 ?auto_586157 ?auto_586158 )
      ( MAKE-11PILE ?auto_586156 ?auto_586157 ?auto_586158 ?auto_586159 ?auto_586160 ?auto_586161 ?auto_586162 ?auto_586163 ?auto_586164 ?auto_586165 ?auto_586166 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_586202 - BLOCK
      ?auto_586203 - BLOCK
      ?auto_586204 - BLOCK
      ?auto_586205 - BLOCK
      ?auto_586206 - BLOCK
      ?auto_586207 - BLOCK
      ?auto_586208 - BLOCK
      ?auto_586209 - BLOCK
      ?auto_586210 - BLOCK
      ?auto_586211 - BLOCK
      ?auto_586212 - BLOCK
    )
    :vars
    (
      ?auto_586213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586212 ?auto_586213 ) ( ON-TABLE ?auto_586202 ) ( not ( = ?auto_586202 ?auto_586203 ) ) ( not ( = ?auto_586202 ?auto_586204 ) ) ( not ( = ?auto_586202 ?auto_586205 ) ) ( not ( = ?auto_586202 ?auto_586206 ) ) ( not ( = ?auto_586202 ?auto_586207 ) ) ( not ( = ?auto_586202 ?auto_586208 ) ) ( not ( = ?auto_586202 ?auto_586209 ) ) ( not ( = ?auto_586202 ?auto_586210 ) ) ( not ( = ?auto_586202 ?auto_586211 ) ) ( not ( = ?auto_586202 ?auto_586212 ) ) ( not ( = ?auto_586202 ?auto_586213 ) ) ( not ( = ?auto_586203 ?auto_586204 ) ) ( not ( = ?auto_586203 ?auto_586205 ) ) ( not ( = ?auto_586203 ?auto_586206 ) ) ( not ( = ?auto_586203 ?auto_586207 ) ) ( not ( = ?auto_586203 ?auto_586208 ) ) ( not ( = ?auto_586203 ?auto_586209 ) ) ( not ( = ?auto_586203 ?auto_586210 ) ) ( not ( = ?auto_586203 ?auto_586211 ) ) ( not ( = ?auto_586203 ?auto_586212 ) ) ( not ( = ?auto_586203 ?auto_586213 ) ) ( not ( = ?auto_586204 ?auto_586205 ) ) ( not ( = ?auto_586204 ?auto_586206 ) ) ( not ( = ?auto_586204 ?auto_586207 ) ) ( not ( = ?auto_586204 ?auto_586208 ) ) ( not ( = ?auto_586204 ?auto_586209 ) ) ( not ( = ?auto_586204 ?auto_586210 ) ) ( not ( = ?auto_586204 ?auto_586211 ) ) ( not ( = ?auto_586204 ?auto_586212 ) ) ( not ( = ?auto_586204 ?auto_586213 ) ) ( not ( = ?auto_586205 ?auto_586206 ) ) ( not ( = ?auto_586205 ?auto_586207 ) ) ( not ( = ?auto_586205 ?auto_586208 ) ) ( not ( = ?auto_586205 ?auto_586209 ) ) ( not ( = ?auto_586205 ?auto_586210 ) ) ( not ( = ?auto_586205 ?auto_586211 ) ) ( not ( = ?auto_586205 ?auto_586212 ) ) ( not ( = ?auto_586205 ?auto_586213 ) ) ( not ( = ?auto_586206 ?auto_586207 ) ) ( not ( = ?auto_586206 ?auto_586208 ) ) ( not ( = ?auto_586206 ?auto_586209 ) ) ( not ( = ?auto_586206 ?auto_586210 ) ) ( not ( = ?auto_586206 ?auto_586211 ) ) ( not ( = ?auto_586206 ?auto_586212 ) ) ( not ( = ?auto_586206 ?auto_586213 ) ) ( not ( = ?auto_586207 ?auto_586208 ) ) ( not ( = ?auto_586207 ?auto_586209 ) ) ( not ( = ?auto_586207 ?auto_586210 ) ) ( not ( = ?auto_586207 ?auto_586211 ) ) ( not ( = ?auto_586207 ?auto_586212 ) ) ( not ( = ?auto_586207 ?auto_586213 ) ) ( not ( = ?auto_586208 ?auto_586209 ) ) ( not ( = ?auto_586208 ?auto_586210 ) ) ( not ( = ?auto_586208 ?auto_586211 ) ) ( not ( = ?auto_586208 ?auto_586212 ) ) ( not ( = ?auto_586208 ?auto_586213 ) ) ( not ( = ?auto_586209 ?auto_586210 ) ) ( not ( = ?auto_586209 ?auto_586211 ) ) ( not ( = ?auto_586209 ?auto_586212 ) ) ( not ( = ?auto_586209 ?auto_586213 ) ) ( not ( = ?auto_586210 ?auto_586211 ) ) ( not ( = ?auto_586210 ?auto_586212 ) ) ( not ( = ?auto_586210 ?auto_586213 ) ) ( not ( = ?auto_586211 ?auto_586212 ) ) ( not ( = ?auto_586211 ?auto_586213 ) ) ( not ( = ?auto_586212 ?auto_586213 ) ) ( ON ?auto_586211 ?auto_586212 ) ( ON ?auto_586210 ?auto_586211 ) ( ON ?auto_586209 ?auto_586210 ) ( ON ?auto_586208 ?auto_586209 ) ( ON ?auto_586207 ?auto_586208 ) ( ON ?auto_586206 ?auto_586207 ) ( ON ?auto_586205 ?auto_586206 ) ( ON ?auto_586204 ?auto_586205 ) ( CLEAR ?auto_586202 ) ( ON ?auto_586203 ?auto_586204 ) ( CLEAR ?auto_586203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_586202 ?auto_586203 )
      ( MAKE-11PILE ?auto_586202 ?auto_586203 ?auto_586204 ?auto_586205 ?auto_586206 ?auto_586207 ?auto_586208 ?auto_586209 ?auto_586210 ?auto_586211 ?auto_586212 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_586248 - BLOCK
      ?auto_586249 - BLOCK
      ?auto_586250 - BLOCK
      ?auto_586251 - BLOCK
      ?auto_586252 - BLOCK
      ?auto_586253 - BLOCK
      ?auto_586254 - BLOCK
      ?auto_586255 - BLOCK
      ?auto_586256 - BLOCK
      ?auto_586257 - BLOCK
      ?auto_586258 - BLOCK
    )
    :vars
    (
      ?auto_586259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586258 ?auto_586259 ) ( not ( = ?auto_586248 ?auto_586249 ) ) ( not ( = ?auto_586248 ?auto_586250 ) ) ( not ( = ?auto_586248 ?auto_586251 ) ) ( not ( = ?auto_586248 ?auto_586252 ) ) ( not ( = ?auto_586248 ?auto_586253 ) ) ( not ( = ?auto_586248 ?auto_586254 ) ) ( not ( = ?auto_586248 ?auto_586255 ) ) ( not ( = ?auto_586248 ?auto_586256 ) ) ( not ( = ?auto_586248 ?auto_586257 ) ) ( not ( = ?auto_586248 ?auto_586258 ) ) ( not ( = ?auto_586248 ?auto_586259 ) ) ( not ( = ?auto_586249 ?auto_586250 ) ) ( not ( = ?auto_586249 ?auto_586251 ) ) ( not ( = ?auto_586249 ?auto_586252 ) ) ( not ( = ?auto_586249 ?auto_586253 ) ) ( not ( = ?auto_586249 ?auto_586254 ) ) ( not ( = ?auto_586249 ?auto_586255 ) ) ( not ( = ?auto_586249 ?auto_586256 ) ) ( not ( = ?auto_586249 ?auto_586257 ) ) ( not ( = ?auto_586249 ?auto_586258 ) ) ( not ( = ?auto_586249 ?auto_586259 ) ) ( not ( = ?auto_586250 ?auto_586251 ) ) ( not ( = ?auto_586250 ?auto_586252 ) ) ( not ( = ?auto_586250 ?auto_586253 ) ) ( not ( = ?auto_586250 ?auto_586254 ) ) ( not ( = ?auto_586250 ?auto_586255 ) ) ( not ( = ?auto_586250 ?auto_586256 ) ) ( not ( = ?auto_586250 ?auto_586257 ) ) ( not ( = ?auto_586250 ?auto_586258 ) ) ( not ( = ?auto_586250 ?auto_586259 ) ) ( not ( = ?auto_586251 ?auto_586252 ) ) ( not ( = ?auto_586251 ?auto_586253 ) ) ( not ( = ?auto_586251 ?auto_586254 ) ) ( not ( = ?auto_586251 ?auto_586255 ) ) ( not ( = ?auto_586251 ?auto_586256 ) ) ( not ( = ?auto_586251 ?auto_586257 ) ) ( not ( = ?auto_586251 ?auto_586258 ) ) ( not ( = ?auto_586251 ?auto_586259 ) ) ( not ( = ?auto_586252 ?auto_586253 ) ) ( not ( = ?auto_586252 ?auto_586254 ) ) ( not ( = ?auto_586252 ?auto_586255 ) ) ( not ( = ?auto_586252 ?auto_586256 ) ) ( not ( = ?auto_586252 ?auto_586257 ) ) ( not ( = ?auto_586252 ?auto_586258 ) ) ( not ( = ?auto_586252 ?auto_586259 ) ) ( not ( = ?auto_586253 ?auto_586254 ) ) ( not ( = ?auto_586253 ?auto_586255 ) ) ( not ( = ?auto_586253 ?auto_586256 ) ) ( not ( = ?auto_586253 ?auto_586257 ) ) ( not ( = ?auto_586253 ?auto_586258 ) ) ( not ( = ?auto_586253 ?auto_586259 ) ) ( not ( = ?auto_586254 ?auto_586255 ) ) ( not ( = ?auto_586254 ?auto_586256 ) ) ( not ( = ?auto_586254 ?auto_586257 ) ) ( not ( = ?auto_586254 ?auto_586258 ) ) ( not ( = ?auto_586254 ?auto_586259 ) ) ( not ( = ?auto_586255 ?auto_586256 ) ) ( not ( = ?auto_586255 ?auto_586257 ) ) ( not ( = ?auto_586255 ?auto_586258 ) ) ( not ( = ?auto_586255 ?auto_586259 ) ) ( not ( = ?auto_586256 ?auto_586257 ) ) ( not ( = ?auto_586256 ?auto_586258 ) ) ( not ( = ?auto_586256 ?auto_586259 ) ) ( not ( = ?auto_586257 ?auto_586258 ) ) ( not ( = ?auto_586257 ?auto_586259 ) ) ( not ( = ?auto_586258 ?auto_586259 ) ) ( ON ?auto_586257 ?auto_586258 ) ( ON ?auto_586256 ?auto_586257 ) ( ON ?auto_586255 ?auto_586256 ) ( ON ?auto_586254 ?auto_586255 ) ( ON ?auto_586253 ?auto_586254 ) ( ON ?auto_586252 ?auto_586253 ) ( ON ?auto_586251 ?auto_586252 ) ( ON ?auto_586250 ?auto_586251 ) ( ON ?auto_586249 ?auto_586250 ) ( ON ?auto_586248 ?auto_586249 ) ( CLEAR ?auto_586248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_586248 )
      ( MAKE-11PILE ?auto_586248 ?auto_586249 ?auto_586250 ?auto_586251 ?auto_586252 ?auto_586253 ?auto_586254 ?auto_586255 ?auto_586256 ?auto_586257 ?auto_586258 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_586295 - BLOCK
      ?auto_586296 - BLOCK
      ?auto_586297 - BLOCK
      ?auto_586298 - BLOCK
      ?auto_586299 - BLOCK
      ?auto_586300 - BLOCK
      ?auto_586301 - BLOCK
      ?auto_586302 - BLOCK
      ?auto_586303 - BLOCK
      ?auto_586304 - BLOCK
      ?auto_586305 - BLOCK
      ?auto_586306 - BLOCK
    )
    :vars
    (
      ?auto_586307 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_586305 ) ( ON ?auto_586306 ?auto_586307 ) ( CLEAR ?auto_586306 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_586295 ) ( ON ?auto_586296 ?auto_586295 ) ( ON ?auto_586297 ?auto_586296 ) ( ON ?auto_586298 ?auto_586297 ) ( ON ?auto_586299 ?auto_586298 ) ( ON ?auto_586300 ?auto_586299 ) ( ON ?auto_586301 ?auto_586300 ) ( ON ?auto_586302 ?auto_586301 ) ( ON ?auto_586303 ?auto_586302 ) ( ON ?auto_586304 ?auto_586303 ) ( ON ?auto_586305 ?auto_586304 ) ( not ( = ?auto_586295 ?auto_586296 ) ) ( not ( = ?auto_586295 ?auto_586297 ) ) ( not ( = ?auto_586295 ?auto_586298 ) ) ( not ( = ?auto_586295 ?auto_586299 ) ) ( not ( = ?auto_586295 ?auto_586300 ) ) ( not ( = ?auto_586295 ?auto_586301 ) ) ( not ( = ?auto_586295 ?auto_586302 ) ) ( not ( = ?auto_586295 ?auto_586303 ) ) ( not ( = ?auto_586295 ?auto_586304 ) ) ( not ( = ?auto_586295 ?auto_586305 ) ) ( not ( = ?auto_586295 ?auto_586306 ) ) ( not ( = ?auto_586295 ?auto_586307 ) ) ( not ( = ?auto_586296 ?auto_586297 ) ) ( not ( = ?auto_586296 ?auto_586298 ) ) ( not ( = ?auto_586296 ?auto_586299 ) ) ( not ( = ?auto_586296 ?auto_586300 ) ) ( not ( = ?auto_586296 ?auto_586301 ) ) ( not ( = ?auto_586296 ?auto_586302 ) ) ( not ( = ?auto_586296 ?auto_586303 ) ) ( not ( = ?auto_586296 ?auto_586304 ) ) ( not ( = ?auto_586296 ?auto_586305 ) ) ( not ( = ?auto_586296 ?auto_586306 ) ) ( not ( = ?auto_586296 ?auto_586307 ) ) ( not ( = ?auto_586297 ?auto_586298 ) ) ( not ( = ?auto_586297 ?auto_586299 ) ) ( not ( = ?auto_586297 ?auto_586300 ) ) ( not ( = ?auto_586297 ?auto_586301 ) ) ( not ( = ?auto_586297 ?auto_586302 ) ) ( not ( = ?auto_586297 ?auto_586303 ) ) ( not ( = ?auto_586297 ?auto_586304 ) ) ( not ( = ?auto_586297 ?auto_586305 ) ) ( not ( = ?auto_586297 ?auto_586306 ) ) ( not ( = ?auto_586297 ?auto_586307 ) ) ( not ( = ?auto_586298 ?auto_586299 ) ) ( not ( = ?auto_586298 ?auto_586300 ) ) ( not ( = ?auto_586298 ?auto_586301 ) ) ( not ( = ?auto_586298 ?auto_586302 ) ) ( not ( = ?auto_586298 ?auto_586303 ) ) ( not ( = ?auto_586298 ?auto_586304 ) ) ( not ( = ?auto_586298 ?auto_586305 ) ) ( not ( = ?auto_586298 ?auto_586306 ) ) ( not ( = ?auto_586298 ?auto_586307 ) ) ( not ( = ?auto_586299 ?auto_586300 ) ) ( not ( = ?auto_586299 ?auto_586301 ) ) ( not ( = ?auto_586299 ?auto_586302 ) ) ( not ( = ?auto_586299 ?auto_586303 ) ) ( not ( = ?auto_586299 ?auto_586304 ) ) ( not ( = ?auto_586299 ?auto_586305 ) ) ( not ( = ?auto_586299 ?auto_586306 ) ) ( not ( = ?auto_586299 ?auto_586307 ) ) ( not ( = ?auto_586300 ?auto_586301 ) ) ( not ( = ?auto_586300 ?auto_586302 ) ) ( not ( = ?auto_586300 ?auto_586303 ) ) ( not ( = ?auto_586300 ?auto_586304 ) ) ( not ( = ?auto_586300 ?auto_586305 ) ) ( not ( = ?auto_586300 ?auto_586306 ) ) ( not ( = ?auto_586300 ?auto_586307 ) ) ( not ( = ?auto_586301 ?auto_586302 ) ) ( not ( = ?auto_586301 ?auto_586303 ) ) ( not ( = ?auto_586301 ?auto_586304 ) ) ( not ( = ?auto_586301 ?auto_586305 ) ) ( not ( = ?auto_586301 ?auto_586306 ) ) ( not ( = ?auto_586301 ?auto_586307 ) ) ( not ( = ?auto_586302 ?auto_586303 ) ) ( not ( = ?auto_586302 ?auto_586304 ) ) ( not ( = ?auto_586302 ?auto_586305 ) ) ( not ( = ?auto_586302 ?auto_586306 ) ) ( not ( = ?auto_586302 ?auto_586307 ) ) ( not ( = ?auto_586303 ?auto_586304 ) ) ( not ( = ?auto_586303 ?auto_586305 ) ) ( not ( = ?auto_586303 ?auto_586306 ) ) ( not ( = ?auto_586303 ?auto_586307 ) ) ( not ( = ?auto_586304 ?auto_586305 ) ) ( not ( = ?auto_586304 ?auto_586306 ) ) ( not ( = ?auto_586304 ?auto_586307 ) ) ( not ( = ?auto_586305 ?auto_586306 ) ) ( not ( = ?auto_586305 ?auto_586307 ) ) ( not ( = ?auto_586306 ?auto_586307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_586306 ?auto_586307 )
      ( !STACK ?auto_586306 ?auto_586305 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_586345 - BLOCK
      ?auto_586346 - BLOCK
      ?auto_586347 - BLOCK
      ?auto_586348 - BLOCK
      ?auto_586349 - BLOCK
      ?auto_586350 - BLOCK
      ?auto_586351 - BLOCK
      ?auto_586352 - BLOCK
      ?auto_586353 - BLOCK
      ?auto_586354 - BLOCK
      ?auto_586355 - BLOCK
      ?auto_586356 - BLOCK
    )
    :vars
    (
      ?auto_586357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586356 ?auto_586357 ) ( ON-TABLE ?auto_586345 ) ( ON ?auto_586346 ?auto_586345 ) ( ON ?auto_586347 ?auto_586346 ) ( ON ?auto_586348 ?auto_586347 ) ( ON ?auto_586349 ?auto_586348 ) ( ON ?auto_586350 ?auto_586349 ) ( ON ?auto_586351 ?auto_586350 ) ( ON ?auto_586352 ?auto_586351 ) ( ON ?auto_586353 ?auto_586352 ) ( ON ?auto_586354 ?auto_586353 ) ( not ( = ?auto_586345 ?auto_586346 ) ) ( not ( = ?auto_586345 ?auto_586347 ) ) ( not ( = ?auto_586345 ?auto_586348 ) ) ( not ( = ?auto_586345 ?auto_586349 ) ) ( not ( = ?auto_586345 ?auto_586350 ) ) ( not ( = ?auto_586345 ?auto_586351 ) ) ( not ( = ?auto_586345 ?auto_586352 ) ) ( not ( = ?auto_586345 ?auto_586353 ) ) ( not ( = ?auto_586345 ?auto_586354 ) ) ( not ( = ?auto_586345 ?auto_586355 ) ) ( not ( = ?auto_586345 ?auto_586356 ) ) ( not ( = ?auto_586345 ?auto_586357 ) ) ( not ( = ?auto_586346 ?auto_586347 ) ) ( not ( = ?auto_586346 ?auto_586348 ) ) ( not ( = ?auto_586346 ?auto_586349 ) ) ( not ( = ?auto_586346 ?auto_586350 ) ) ( not ( = ?auto_586346 ?auto_586351 ) ) ( not ( = ?auto_586346 ?auto_586352 ) ) ( not ( = ?auto_586346 ?auto_586353 ) ) ( not ( = ?auto_586346 ?auto_586354 ) ) ( not ( = ?auto_586346 ?auto_586355 ) ) ( not ( = ?auto_586346 ?auto_586356 ) ) ( not ( = ?auto_586346 ?auto_586357 ) ) ( not ( = ?auto_586347 ?auto_586348 ) ) ( not ( = ?auto_586347 ?auto_586349 ) ) ( not ( = ?auto_586347 ?auto_586350 ) ) ( not ( = ?auto_586347 ?auto_586351 ) ) ( not ( = ?auto_586347 ?auto_586352 ) ) ( not ( = ?auto_586347 ?auto_586353 ) ) ( not ( = ?auto_586347 ?auto_586354 ) ) ( not ( = ?auto_586347 ?auto_586355 ) ) ( not ( = ?auto_586347 ?auto_586356 ) ) ( not ( = ?auto_586347 ?auto_586357 ) ) ( not ( = ?auto_586348 ?auto_586349 ) ) ( not ( = ?auto_586348 ?auto_586350 ) ) ( not ( = ?auto_586348 ?auto_586351 ) ) ( not ( = ?auto_586348 ?auto_586352 ) ) ( not ( = ?auto_586348 ?auto_586353 ) ) ( not ( = ?auto_586348 ?auto_586354 ) ) ( not ( = ?auto_586348 ?auto_586355 ) ) ( not ( = ?auto_586348 ?auto_586356 ) ) ( not ( = ?auto_586348 ?auto_586357 ) ) ( not ( = ?auto_586349 ?auto_586350 ) ) ( not ( = ?auto_586349 ?auto_586351 ) ) ( not ( = ?auto_586349 ?auto_586352 ) ) ( not ( = ?auto_586349 ?auto_586353 ) ) ( not ( = ?auto_586349 ?auto_586354 ) ) ( not ( = ?auto_586349 ?auto_586355 ) ) ( not ( = ?auto_586349 ?auto_586356 ) ) ( not ( = ?auto_586349 ?auto_586357 ) ) ( not ( = ?auto_586350 ?auto_586351 ) ) ( not ( = ?auto_586350 ?auto_586352 ) ) ( not ( = ?auto_586350 ?auto_586353 ) ) ( not ( = ?auto_586350 ?auto_586354 ) ) ( not ( = ?auto_586350 ?auto_586355 ) ) ( not ( = ?auto_586350 ?auto_586356 ) ) ( not ( = ?auto_586350 ?auto_586357 ) ) ( not ( = ?auto_586351 ?auto_586352 ) ) ( not ( = ?auto_586351 ?auto_586353 ) ) ( not ( = ?auto_586351 ?auto_586354 ) ) ( not ( = ?auto_586351 ?auto_586355 ) ) ( not ( = ?auto_586351 ?auto_586356 ) ) ( not ( = ?auto_586351 ?auto_586357 ) ) ( not ( = ?auto_586352 ?auto_586353 ) ) ( not ( = ?auto_586352 ?auto_586354 ) ) ( not ( = ?auto_586352 ?auto_586355 ) ) ( not ( = ?auto_586352 ?auto_586356 ) ) ( not ( = ?auto_586352 ?auto_586357 ) ) ( not ( = ?auto_586353 ?auto_586354 ) ) ( not ( = ?auto_586353 ?auto_586355 ) ) ( not ( = ?auto_586353 ?auto_586356 ) ) ( not ( = ?auto_586353 ?auto_586357 ) ) ( not ( = ?auto_586354 ?auto_586355 ) ) ( not ( = ?auto_586354 ?auto_586356 ) ) ( not ( = ?auto_586354 ?auto_586357 ) ) ( not ( = ?auto_586355 ?auto_586356 ) ) ( not ( = ?auto_586355 ?auto_586357 ) ) ( not ( = ?auto_586356 ?auto_586357 ) ) ( CLEAR ?auto_586354 ) ( ON ?auto_586355 ?auto_586356 ) ( CLEAR ?auto_586355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_586345 ?auto_586346 ?auto_586347 ?auto_586348 ?auto_586349 ?auto_586350 ?auto_586351 ?auto_586352 ?auto_586353 ?auto_586354 ?auto_586355 )
      ( MAKE-12PILE ?auto_586345 ?auto_586346 ?auto_586347 ?auto_586348 ?auto_586349 ?auto_586350 ?auto_586351 ?auto_586352 ?auto_586353 ?auto_586354 ?auto_586355 ?auto_586356 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_586395 - BLOCK
      ?auto_586396 - BLOCK
      ?auto_586397 - BLOCK
      ?auto_586398 - BLOCK
      ?auto_586399 - BLOCK
      ?auto_586400 - BLOCK
      ?auto_586401 - BLOCK
      ?auto_586402 - BLOCK
      ?auto_586403 - BLOCK
      ?auto_586404 - BLOCK
      ?auto_586405 - BLOCK
      ?auto_586406 - BLOCK
    )
    :vars
    (
      ?auto_586407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586406 ?auto_586407 ) ( ON-TABLE ?auto_586395 ) ( ON ?auto_586396 ?auto_586395 ) ( ON ?auto_586397 ?auto_586396 ) ( ON ?auto_586398 ?auto_586397 ) ( ON ?auto_586399 ?auto_586398 ) ( ON ?auto_586400 ?auto_586399 ) ( ON ?auto_586401 ?auto_586400 ) ( ON ?auto_586402 ?auto_586401 ) ( ON ?auto_586403 ?auto_586402 ) ( not ( = ?auto_586395 ?auto_586396 ) ) ( not ( = ?auto_586395 ?auto_586397 ) ) ( not ( = ?auto_586395 ?auto_586398 ) ) ( not ( = ?auto_586395 ?auto_586399 ) ) ( not ( = ?auto_586395 ?auto_586400 ) ) ( not ( = ?auto_586395 ?auto_586401 ) ) ( not ( = ?auto_586395 ?auto_586402 ) ) ( not ( = ?auto_586395 ?auto_586403 ) ) ( not ( = ?auto_586395 ?auto_586404 ) ) ( not ( = ?auto_586395 ?auto_586405 ) ) ( not ( = ?auto_586395 ?auto_586406 ) ) ( not ( = ?auto_586395 ?auto_586407 ) ) ( not ( = ?auto_586396 ?auto_586397 ) ) ( not ( = ?auto_586396 ?auto_586398 ) ) ( not ( = ?auto_586396 ?auto_586399 ) ) ( not ( = ?auto_586396 ?auto_586400 ) ) ( not ( = ?auto_586396 ?auto_586401 ) ) ( not ( = ?auto_586396 ?auto_586402 ) ) ( not ( = ?auto_586396 ?auto_586403 ) ) ( not ( = ?auto_586396 ?auto_586404 ) ) ( not ( = ?auto_586396 ?auto_586405 ) ) ( not ( = ?auto_586396 ?auto_586406 ) ) ( not ( = ?auto_586396 ?auto_586407 ) ) ( not ( = ?auto_586397 ?auto_586398 ) ) ( not ( = ?auto_586397 ?auto_586399 ) ) ( not ( = ?auto_586397 ?auto_586400 ) ) ( not ( = ?auto_586397 ?auto_586401 ) ) ( not ( = ?auto_586397 ?auto_586402 ) ) ( not ( = ?auto_586397 ?auto_586403 ) ) ( not ( = ?auto_586397 ?auto_586404 ) ) ( not ( = ?auto_586397 ?auto_586405 ) ) ( not ( = ?auto_586397 ?auto_586406 ) ) ( not ( = ?auto_586397 ?auto_586407 ) ) ( not ( = ?auto_586398 ?auto_586399 ) ) ( not ( = ?auto_586398 ?auto_586400 ) ) ( not ( = ?auto_586398 ?auto_586401 ) ) ( not ( = ?auto_586398 ?auto_586402 ) ) ( not ( = ?auto_586398 ?auto_586403 ) ) ( not ( = ?auto_586398 ?auto_586404 ) ) ( not ( = ?auto_586398 ?auto_586405 ) ) ( not ( = ?auto_586398 ?auto_586406 ) ) ( not ( = ?auto_586398 ?auto_586407 ) ) ( not ( = ?auto_586399 ?auto_586400 ) ) ( not ( = ?auto_586399 ?auto_586401 ) ) ( not ( = ?auto_586399 ?auto_586402 ) ) ( not ( = ?auto_586399 ?auto_586403 ) ) ( not ( = ?auto_586399 ?auto_586404 ) ) ( not ( = ?auto_586399 ?auto_586405 ) ) ( not ( = ?auto_586399 ?auto_586406 ) ) ( not ( = ?auto_586399 ?auto_586407 ) ) ( not ( = ?auto_586400 ?auto_586401 ) ) ( not ( = ?auto_586400 ?auto_586402 ) ) ( not ( = ?auto_586400 ?auto_586403 ) ) ( not ( = ?auto_586400 ?auto_586404 ) ) ( not ( = ?auto_586400 ?auto_586405 ) ) ( not ( = ?auto_586400 ?auto_586406 ) ) ( not ( = ?auto_586400 ?auto_586407 ) ) ( not ( = ?auto_586401 ?auto_586402 ) ) ( not ( = ?auto_586401 ?auto_586403 ) ) ( not ( = ?auto_586401 ?auto_586404 ) ) ( not ( = ?auto_586401 ?auto_586405 ) ) ( not ( = ?auto_586401 ?auto_586406 ) ) ( not ( = ?auto_586401 ?auto_586407 ) ) ( not ( = ?auto_586402 ?auto_586403 ) ) ( not ( = ?auto_586402 ?auto_586404 ) ) ( not ( = ?auto_586402 ?auto_586405 ) ) ( not ( = ?auto_586402 ?auto_586406 ) ) ( not ( = ?auto_586402 ?auto_586407 ) ) ( not ( = ?auto_586403 ?auto_586404 ) ) ( not ( = ?auto_586403 ?auto_586405 ) ) ( not ( = ?auto_586403 ?auto_586406 ) ) ( not ( = ?auto_586403 ?auto_586407 ) ) ( not ( = ?auto_586404 ?auto_586405 ) ) ( not ( = ?auto_586404 ?auto_586406 ) ) ( not ( = ?auto_586404 ?auto_586407 ) ) ( not ( = ?auto_586405 ?auto_586406 ) ) ( not ( = ?auto_586405 ?auto_586407 ) ) ( not ( = ?auto_586406 ?auto_586407 ) ) ( ON ?auto_586405 ?auto_586406 ) ( CLEAR ?auto_586403 ) ( ON ?auto_586404 ?auto_586405 ) ( CLEAR ?auto_586404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_586395 ?auto_586396 ?auto_586397 ?auto_586398 ?auto_586399 ?auto_586400 ?auto_586401 ?auto_586402 ?auto_586403 ?auto_586404 )
      ( MAKE-12PILE ?auto_586395 ?auto_586396 ?auto_586397 ?auto_586398 ?auto_586399 ?auto_586400 ?auto_586401 ?auto_586402 ?auto_586403 ?auto_586404 ?auto_586405 ?auto_586406 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_586445 - BLOCK
      ?auto_586446 - BLOCK
      ?auto_586447 - BLOCK
      ?auto_586448 - BLOCK
      ?auto_586449 - BLOCK
      ?auto_586450 - BLOCK
      ?auto_586451 - BLOCK
      ?auto_586452 - BLOCK
      ?auto_586453 - BLOCK
      ?auto_586454 - BLOCK
      ?auto_586455 - BLOCK
      ?auto_586456 - BLOCK
    )
    :vars
    (
      ?auto_586457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586456 ?auto_586457 ) ( ON-TABLE ?auto_586445 ) ( ON ?auto_586446 ?auto_586445 ) ( ON ?auto_586447 ?auto_586446 ) ( ON ?auto_586448 ?auto_586447 ) ( ON ?auto_586449 ?auto_586448 ) ( ON ?auto_586450 ?auto_586449 ) ( ON ?auto_586451 ?auto_586450 ) ( ON ?auto_586452 ?auto_586451 ) ( not ( = ?auto_586445 ?auto_586446 ) ) ( not ( = ?auto_586445 ?auto_586447 ) ) ( not ( = ?auto_586445 ?auto_586448 ) ) ( not ( = ?auto_586445 ?auto_586449 ) ) ( not ( = ?auto_586445 ?auto_586450 ) ) ( not ( = ?auto_586445 ?auto_586451 ) ) ( not ( = ?auto_586445 ?auto_586452 ) ) ( not ( = ?auto_586445 ?auto_586453 ) ) ( not ( = ?auto_586445 ?auto_586454 ) ) ( not ( = ?auto_586445 ?auto_586455 ) ) ( not ( = ?auto_586445 ?auto_586456 ) ) ( not ( = ?auto_586445 ?auto_586457 ) ) ( not ( = ?auto_586446 ?auto_586447 ) ) ( not ( = ?auto_586446 ?auto_586448 ) ) ( not ( = ?auto_586446 ?auto_586449 ) ) ( not ( = ?auto_586446 ?auto_586450 ) ) ( not ( = ?auto_586446 ?auto_586451 ) ) ( not ( = ?auto_586446 ?auto_586452 ) ) ( not ( = ?auto_586446 ?auto_586453 ) ) ( not ( = ?auto_586446 ?auto_586454 ) ) ( not ( = ?auto_586446 ?auto_586455 ) ) ( not ( = ?auto_586446 ?auto_586456 ) ) ( not ( = ?auto_586446 ?auto_586457 ) ) ( not ( = ?auto_586447 ?auto_586448 ) ) ( not ( = ?auto_586447 ?auto_586449 ) ) ( not ( = ?auto_586447 ?auto_586450 ) ) ( not ( = ?auto_586447 ?auto_586451 ) ) ( not ( = ?auto_586447 ?auto_586452 ) ) ( not ( = ?auto_586447 ?auto_586453 ) ) ( not ( = ?auto_586447 ?auto_586454 ) ) ( not ( = ?auto_586447 ?auto_586455 ) ) ( not ( = ?auto_586447 ?auto_586456 ) ) ( not ( = ?auto_586447 ?auto_586457 ) ) ( not ( = ?auto_586448 ?auto_586449 ) ) ( not ( = ?auto_586448 ?auto_586450 ) ) ( not ( = ?auto_586448 ?auto_586451 ) ) ( not ( = ?auto_586448 ?auto_586452 ) ) ( not ( = ?auto_586448 ?auto_586453 ) ) ( not ( = ?auto_586448 ?auto_586454 ) ) ( not ( = ?auto_586448 ?auto_586455 ) ) ( not ( = ?auto_586448 ?auto_586456 ) ) ( not ( = ?auto_586448 ?auto_586457 ) ) ( not ( = ?auto_586449 ?auto_586450 ) ) ( not ( = ?auto_586449 ?auto_586451 ) ) ( not ( = ?auto_586449 ?auto_586452 ) ) ( not ( = ?auto_586449 ?auto_586453 ) ) ( not ( = ?auto_586449 ?auto_586454 ) ) ( not ( = ?auto_586449 ?auto_586455 ) ) ( not ( = ?auto_586449 ?auto_586456 ) ) ( not ( = ?auto_586449 ?auto_586457 ) ) ( not ( = ?auto_586450 ?auto_586451 ) ) ( not ( = ?auto_586450 ?auto_586452 ) ) ( not ( = ?auto_586450 ?auto_586453 ) ) ( not ( = ?auto_586450 ?auto_586454 ) ) ( not ( = ?auto_586450 ?auto_586455 ) ) ( not ( = ?auto_586450 ?auto_586456 ) ) ( not ( = ?auto_586450 ?auto_586457 ) ) ( not ( = ?auto_586451 ?auto_586452 ) ) ( not ( = ?auto_586451 ?auto_586453 ) ) ( not ( = ?auto_586451 ?auto_586454 ) ) ( not ( = ?auto_586451 ?auto_586455 ) ) ( not ( = ?auto_586451 ?auto_586456 ) ) ( not ( = ?auto_586451 ?auto_586457 ) ) ( not ( = ?auto_586452 ?auto_586453 ) ) ( not ( = ?auto_586452 ?auto_586454 ) ) ( not ( = ?auto_586452 ?auto_586455 ) ) ( not ( = ?auto_586452 ?auto_586456 ) ) ( not ( = ?auto_586452 ?auto_586457 ) ) ( not ( = ?auto_586453 ?auto_586454 ) ) ( not ( = ?auto_586453 ?auto_586455 ) ) ( not ( = ?auto_586453 ?auto_586456 ) ) ( not ( = ?auto_586453 ?auto_586457 ) ) ( not ( = ?auto_586454 ?auto_586455 ) ) ( not ( = ?auto_586454 ?auto_586456 ) ) ( not ( = ?auto_586454 ?auto_586457 ) ) ( not ( = ?auto_586455 ?auto_586456 ) ) ( not ( = ?auto_586455 ?auto_586457 ) ) ( not ( = ?auto_586456 ?auto_586457 ) ) ( ON ?auto_586455 ?auto_586456 ) ( ON ?auto_586454 ?auto_586455 ) ( CLEAR ?auto_586452 ) ( ON ?auto_586453 ?auto_586454 ) ( CLEAR ?auto_586453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_586445 ?auto_586446 ?auto_586447 ?auto_586448 ?auto_586449 ?auto_586450 ?auto_586451 ?auto_586452 ?auto_586453 )
      ( MAKE-12PILE ?auto_586445 ?auto_586446 ?auto_586447 ?auto_586448 ?auto_586449 ?auto_586450 ?auto_586451 ?auto_586452 ?auto_586453 ?auto_586454 ?auto_586455 ?auto_586456 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_586495 - BLOCK
      ?auto_586496 - BLOCK
      ?auto_586497 - BLOCK
      ?auto_586498 - BLOCK
      ?auto_586499 - BLOCK
      ?auto_586500 - BLOCK
      ?auto_586501 - BLOCK
      ?auto_586502 - BLOCK
      ?auto_586503 - BLOCK
      ?auto_586504 - BLOCK
      ?auto_586505 - BLOCK
      ?auto_586506 - BLOCK
    )
    :vars
    (
      ?auto_586507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586506 ?auto_586507 ) ( ON-TABLE ?auto_586495 ) ( ON ?auto_586496 ?auto_586495 ) ( ON ?auto_586497 ?auto_586496 ) ( ON ?auto_586498 ?auto_586497 ) ( ON ?auto_586499 ?auto_586498 ) ( ON ?auto_586500 ?auto_586499 ) ( ON ?auto_586501 ?auto_586500 ) ( not ( = ?auto_586495 ?auto_586496 ) ) ( not ( = ?auto_586495 ?auto_586497 ) ) ( not ( = ?auto_586495 ?auto_586498 ) ) ( not ( = ?auto_586495 ?auto_586499 ) ) ( not ( = ?auto_586495 ?auto_586500 ) ) ( not ( = ?auto_586495 ?auto_586501 ) ) ( not ( = ?auto_586495 ?auto_586502 ) ) ( not ( = ?auto_586495 ?auto_586503 ) ) ( not ( = ?auto_586495 ?auto_586504 ) ) ( not ( = ?auto_586495 ?auto_586505 ) ) ( not ( = ?auto_586495 ?auto_586506 ) ) ( not ( = ?auto_586495 ?auto_586507 ) ) ( not ( = ?auto_586496 ?auto_586497 ) ) ( not ( = ?auto_586496 ?auto_586498 ) ) ( not ( = ?auto_586496 ?auto_586499 ) ) ( not ( = ?auto_586496 ?auto_586500 ) ) ( not ( = ?auto_586496 ?auto_586501 ) ) ( not ( = ?auto_586496 ?auto_586502 ) ) ( not ( = ?auto_586496 ?auto_586503 ) ) ( not ( = ?auto_586496 ?auto_586504 ) ) ( not ( = ?auto_586496 ?auto_586505 ) ) ( not ( = ?auto_586496 ?auto_586506 ) ) ( not ( = ?auto_586496 ?auto_586507 ) ) ( not ( = ?auto_586497 ?auto_586498 ) ) ( not ( = ?auto_586497 ?auto_586499 ) ) ( not ( = ?auto_586497 ?auto_586500 ) ) ( not ( = ?auto_586497 ?auto_586501 ) ) ( not ( = ?auto_586497 ?auto_586502 ) ) ( not ( = ?auto_586497 ?auto_586503 ) ) ( not ( = ?auto_586497 ?auto_586504 ) ) ( not ( = ?auto_586497 ?auto_586505 ) ) ( not ( = ?auto_586497 ?auto_586506 ) ) ( not ( = ?auto_586497 ?auto_586507 ) ) ( not ( = ?auto_586498 ?auto_586499 ) ) ( not ( = ?auto_586498 ?auto_586500 ) ) ( not ( = ?auto_586498 ?auto_586501 ) ) ( not ( = ?auto_586498 ?auto_586502 ) ) ( not ( = ?auto_586498 ?auto_586503 ) ) ( not ( = ?auto_586498 ?auto_586504 ) ) ( not ( = ?auto_586498 ?auto_586505 ) ) ( not ( = ?auto_586498 ?auto_586506 ) ) ( not ( = ?auto_586498 ?auto_586507 ) ) ( not ( = ?auto_586499 ?auto_586500 ) ) ( not ( = ?auto_586499 ?auto_586501 ) ) ( not ( = ?auto_586499 ?auto_586502 ) ) ( not ( = ?auto_586499 ?auto_586503 ) ) ( not ( = ?auto_586499 ?auto_586504 ) ) ( not ( = ?auto_586499 ?auto_586505 ) ) ( not ( = ?auto_586499 ?auto_586506 ) ) ( not ( = ?auto_586499 ?auto_586507 ) ) ( not ( = ?auto_586500 ?auto_586501 ) ) ( not ( = ?auto_586500 ?auto_586502 ) ) ( not ( = ?auto_586500 ?auto_586503 ) ) ( not ( = ?auto_586500 ?auto_586504 ) ) ( not ( = ?auto_586500 ?auto_586505 ) ) ( not ( = ?auto_586500 ?auto_586506 ) ) ( not ( = ?auto_586500 ?auto_586507 ) ) ( not ( = ?auto_586501 ?auto_586502 ) ) ( not ( = ?auto_586501 ?auto_586503 ) ) ( not ( = ?auto_586501 ?auto_586504 ) ) ( not ( = ?auto_586501 ?auto_586505 ) ) ( not ( = ?auto_586501 ?auto_586506 ) ) ( not ( = ?auto_586501 ?auto_586507 ) ) ( not ( = ?auto_586502 ?auto_586503 ) ) ( not ( = ?auto_586502 ?auto_586504 ) ) ( not ( = ?auto_586502 ?auto_586505 ) ) ( not ( = ?auto_586502 ?auto_586506 ) ) ( not ( = ?auto_586502 ?auto_586507 ) ) ( not ( = ?auto_586503 ?auto_586504 ) ) ( not ( = ?auto_586503 ?auto_586505 ) ) ( not ( = ?auto_586503 ?auto_586506 ) ) ( not ( = ?auto_586503 ?auto_586507 ) ) ( not ( = ?auto_586504 ?auto_586505 ) ) ( not ( = ?auto_586504 ?auto_586506 ) ) ( not ( = ?auto_586504 ?auto_586507 ) ) ( not ( = ?auto_586505 ?auto_586506 ) ) ( not ( = ?auto_586505 ?auto_586507 ) ) ( not ( = ?auto_586506 ?auto_586507 ) ) ( ON ?auto_586505 ?auto_586506 ) ( ON ?auto_586504 ?auto_586505 ) ( ON ?auto_586503 ?auto_586504 ) ( CLEAR ?auto_586501 ) ( ON ?auto_586502 ?auto_586503 ) ( CLEAR ?auto_586502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_586495 ?auto_586496 ?auto_586497 ?auto_586498 ?auto_586499 ?auto_586500 ?auto_586501 ?auto_586502 )
      ( MAKE-12PILE ?auto_586495 ?auto_586496 ?auto_586497 ?auto_586498 ?auto_586499 ?auto_586500 ?auto_586501 ?auto_586502 ?auto_586503 ?auto_586504 ?auto_586505 ?auto_586506 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_586545 - BLOCK
      ?auto_586546 - BLOCK
      ?auto_586547 - BLOCK
      ?auto_586548 - BLOCK
      ?auto_586549 - BLOCK
      ?auto_586550 - BLOCK
      ?auto_586551 - BLOCK
      ?auto_586552 - BLOCK
      ?auto_586553 - BLOCK
      ?auto_586554 - BLOCK
      ?auto_586555 - BLOCK
      ?auto_586556 - BLOCK
    )
    :vars
    (
      ?auto_586557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586556 ?auto_586557 ) ( ON-TABLE ?auto_586545 ) ( ON ?auto_586546 ?auto_586545 ) ( ON ?auto_586547 ?auto_586546 ) ( ON ?auto_586548 ?auto_586547 ) ( ON ?auto_586549 ?auto_586548 ) ( ON ?auto_586550 ?auto_586549 ) ( not ( = ?auto_586545 ?auto_586546 ) ) ( not ( = ?auto_586545 ?auto_586547 ) ) ( not ( = ?auto_586545 ?auto_586548 ) ) ( not ( = ?auto_586545 ?auto_586549 ) ) ( not ( = ?auto_586545 ?auto_586550 ) ) ( not ( = ?auto_586545 ?auto_586551 ) ) ( not ( = ?auto_586545 ?auto_586552 ) ) ( not ( = ?auto_586545 ?auto_586553 ) ) ( not ( = ?auto_586545 ?auto_586554 ) ) ( not ( = ?auto_586545 ?auto_586555 ) ) ( not ( = ?auto_586545 ?auto_586556 ) ) ( not ( = ?auto_586545 ?auto_586557 ) ) ( not ( = ?auto_586546 ?auto_586547 ) ) ( not ( = ?auto_586546 ?auto_586548 ) ) ( not ( = ?auto_586546 ?auto_586549 ) ) ( not ( = ?auto_586546 ?auto_586550 ) ) ( not ( = ?auto_586546 ?auto_586551 ) ) ( not ( = ?auto_586546 ?auto_586552 ) ) ( not ( = ?auto_586546 ?auto_586553 ) ) ( not ( = ?auto_586546 ?auto_586554 ) ) ( not ( = ?auto_586546 ?auto_586555 ) ) ( not ( = ?auto_586546 ?auto_586556 ) ) ( not ( = ?auto_586546 ?auto_586557 ) ) ( not ( = ?auto_586547 ?auto_586548 ) ) ( not ( = ?auto_586547 ?auto_586549 ) ) ( not ( = ?auto_586547 ?auto_586550 ) ) ( not ( = ?auto_586547 ?auto_586551 ) ) ( not ( = ?auto_586547 ?auto_586552 ) ) ( not ( = ?auto_586547 ?auto_586553 ) ) ( not ( = ?auto_586547 ?auto_586554 ) ) ( not ( = ?auto_586547 ?auto_586555 ) ) ( not ( = ?auto_586547 ?auto_586556 ) ) ( not ( = ?auto_586547 ?auto_586557 ) ) ( not ( = ?auto_586548 ?auto_586549 ) ) ( not ( = ?auto_586548 ?auto_586550 ) ) ( not ( = ?auto_586548 ?auto_586551 ) ) ( not ( = ?auto_586548 ?auto_586552 ) ) ( not ( = ?auto_586548 ?auto_586553 ) ) ( not ( = ?auto_586548 ?auto_586554 ) ) ( not ( = ?auto_586548 ?auto_586555 ) ) ( not ( = ?auto_586548 ?auto_586556 ) ) ( not ( = ?auto_586548 ?auto_586557 ) ) ( not ( = ?auto_586549 ?auto_586550 ) ) ( not ( = ?auto_586549 ?auto_586551 ) ) ( not ( = ?auto_586549 ?auto_586552 ) ) ( not ( = ?auto_586549 ?auto_586553 ) ) ( not ( = ?auto_586549 ?auto_586554 ) ) ( not ( = ?auto_586549 ?auto_586555 ) ) ( not ( = ?auto_586549 ?auto_586556 ) ) ( not ( = ?auto_586549 ?auto_586557 ) ) ( not ( = ?auto_586550 ?auto_586551 ) ) ( not ( = ?auto_586550 ?auto_586552 ) ) ( not ( = ?auto_586550 ?auto_586553 ) ) ( not ( = ?auto_586550 ?auto_586554 ) ) ( not ( = ?auto_586550 ?auto_586555 ) ) ( not ( = ?auto_586550 ?auto_586556 ) ) ( not ( = ?auto_586550 ?auto_586557 ) ) ( not ( = ?auto_586551 ?auto_586552 ) ) ( not ( = ?auto_586551 ?auto_586553 ) ) ( not ( = ?auto_586551 ?auto_586554 ) ) ( not ( = ?auto_586551 ?auto_586555 ) ) ( not ( = ?auto_586551 ?auto_586556 ) ) ( not ( = ?auto_586551 ?auto_586557 ) ) ( not ( = ?auto_586552 ?auto_586553 ) ) ( not ( = ?auto_586552 ?auto_586554 ) ) ( not ( = ?auto_586552 ?auto_586555 ) ) ( not ( = ?auto_586552 ?auto_586556 ) ) ( not ( = ?auto_586552 ?auto_586557 ) ) ( not ( = ?auto_586553 ?auto_586554 ) ) ( not ( = ?auto_586553 ?auto_586555 ) ) ( not ( = ?auto_586553 ?auto_586556 ) ) ( not ( = ?auto_586553 ?auto_586557 ) ) ( not ( = ?auto_586554 ?auto_586555 ) ) ( not ( = ?auto_586554 ?auto_586556 ) ) ( not ( = ?auto_586554 ?auto_586557 ) ) ( not ( = ?auto_586555 ?auto_586556 ) ) ( not ( = ?auto_586555 ?auto_586557 ) ) ( not ( = ?auto_586556 ?auto_586557 ) ) ( ON ?auto_586555 ?auto_586556 ) ( ON ?auto_586554 ?auto_586555 ) ( ON ?auto_586553 ?auto_586554 ) ( ON ?auto_586552 ?auto_586553 ) ( CLEAR ?auto_586550 ) ( ON ?auto_586551 ?auto_586552 ) ( CLEAR ?auto_586551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_586545 ?auto_586546 ?auto_586547 ?auto_586548 ?auto_586549 ?auto_586550 ?auto_586551 )
      ( MAKE-12PILE ?auto_586545 ?auto_586546 ?auto_586547 ?auto_586548 ?auto_586549 ?auto_586550 ?auto_586551 ?auto_586552 ?auto_586553 ?auto_586554 ?auto_586555 ?auto_586556 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_586595 - BLOCK
      ?auto_586596 - BLOCK
      ?auto_586597 - BLOCK
      ?auto_586598 - BLOCK
      ?auto_586599 - BLOCK
      ?auto_586600 - BLOCK
      ?auto_586601 - BLOCK
      ?auto_586602 - BLOCK
      ?auto_586603 - BLOCK
      ?auto_586604 - BLOCK
      ?auto_586605 - BLOCK
      ?auto_586606 - BLOCK
    )
    :vars
    (
      ?auto_586607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586606 ?auto_586607 ) ( ON-TABLE ?auto_586595 ) ( ON ?auto_586596 ?auto_586595 ) ( ON ?auto_586597 ?auto_586596 ) ( ON ?auto_586598 ?auto_586597 ) ( ON ?auto_586599 ?auto_586598 ) ( not ( = ?auto_586595 ?auto_586596 ) ) ( not ( = ?auto_586595 ?auto_586597 ) ) ( not ( = ?auto_586595 ?auto_586598 ) ) ( not ( = ?auto_586595 ?auto_586599 ) ) ( not ( = ?auto_586595 ?auto_586600 ) ) ( not ( = ?auto_586595 ?auto_586601 ) ) ( not ( = ?auto_586595 ?auto_586602 ) ) ( not ( = ?auto_586595 ?auto_586603 ) ) ( not ( = ?auto_586595 ?auto_586604 ) ) ( not ( = ?auto_586595 ?auto_586605 ) ) ( not ( = ?auto_586595 ?auto_586606 ) ) ( not ( = ?auto_586595 ?auto_586607 ) ) ( not ( = ?auto_586596 ?auto_586597 ) ) ( not ( = ?auto_586596 ?auto_586598 ) ) ( not ( = ?auto_586596 ?auto_586599 ) ) ( not ( = ?auto_586596 ?auto_586600 ) ) ( not ( = ?auto_586596 ?auto_586601 ) ) ( not ( = ?auto_586596 ?auto_586602 ) ) ( not ( = ?auto_586596 ?auto_586603 ) ) ( not ( = ?auto_586596 ?auto_586604 ) ) ( not ( = ?auto_586596 ?auto_586605 ) ) ( not ( = ?auto_586596 ?auto_586606 ) ) ( not ( = ?auto_586596 ?auto_586607 ) ) ( not ( = ?auto_586597 ?auto_586598 ) ) ( not ( = ?auto_586597 ?auto_586599 ) ) ( not ( = ?auto_586597 ?auto_586600 ) ) ( not ( = ?auto_586597 ?auto_586601 ) ) ( not ( = ?auto_586597 ?auto_586602 ) ) ( not ( = ?auto_586597 ?auto_586603 ) ) ( not ( = ?auto_586597 ?auto_586604 ) ) ( not ( = ?auto_586597 ?auto_586605 ) ) ( not ( = ?auto_586597 ?auto_586606 ) ) ( not ( = ?auto_586597 ?auto_586607 ) ) ( not ( = ?auto_586598 ?auto_586599 ) ) ( not ( = ?auto_586598 ?auto_586600 ) ) ( not ( = ?auto_586598 ?auto_586601 ) ) ( not ( = ?auto_586598 ?auto_586602 ) ) ( not ( = ?auto_586598 ?auto_586603 ) ) ( not ( = ?auto_586598 ?auto_586604 ) ) ( not ( = ?auto_586598 ?auto_586605 ) ) ( not ( = ?auto_586598 ?auto_586606 ) ) ( not ( = ?auto_586598 ?auto_586607 ) ) ( not ( = ?auto_586599 ?auto_586600 ) ) ( not ( = ?auto_586599 ?auto_586601 ) ) ( not ( = ?auto_586599 ?auto_586602 ) ) ( not ( = ?auto_586599 ?auto_586603 ) ) ( not ( = ?auto_586599 ?auto_586604 ) ) ( not ( = ?auto_586599 ?auto_586605 ) ) ( not ( = ?auto_586599 ?auto_586606 ) ) ( not ( = ?auto_586599 ?auto_586607 ) ) ( not ( = ?auto_586600 ?auto_586601 ) ) ( not ( = ?auto_586600 ?auto_586602 ) ) ( not ( = ?auto_586600 ?auto_586603 ) ) ( not ( = ?auto_586600 ?auto_586604 ) ) ( not ( = ?auto_586600 ?auto_586605 ) ) ( not ( = ?auto_586600 ?auto_586606 ) ) ( not ( = ?auto_586600 ?auto_586607 ) ) ( not ( = ?auto_586601 ?auto_586602 ) ) ( not ( = ?auto_586601 ?auto_586603 ) ) ( not ( = ?auto_586601 ?auto_586604 ) ) ( not ( = ?auto_586601 ?auto_586605 ) ) ( not ( = ?auto_586601 ?auto_586606 ) ) ( not ( = ?auto_586601 ?auto_586607 ) ) ( not ( = ?auto_586602 ?auto_586603 ) ) ( not ( = ?auto_586602 ?auto_586604 ) ) ( not ( = ?auto_586602 ?auto_586605 ) ) ( not ( = ?auto_586602 ?auto_586606 ) ) ( not ( = ?auto_586602 ?auto_586607 ) ) ( not ( = ?auto_586603 ?auto_586604 ) ) ( not ( = ?auto_586603 ?auto_586605 ) ) ( not ( = ?auto_586603 ?auto_586606 ) ) ( not ( = ?auto_586603 ?auto_586607 ) ) ( not ( = ?auto_586604 ?auto_586605 ) ) ( not ( = ?auto_586604 ?auto_586606 ) ) ( not ( = ?auto_586604 ?auto_586607 ) ) ( not ( = ?auto_586605 ?auto_586606 ) ) ( not ( = ?auto_586605 ?auto_586607 ) ) ( not ( = ?auto_586606 ?auto_586607 ) ) ( ON ?auto_586605 ?auto_586606 ) ( ON ?auto_586604 ?auto_586605 ) ( ON ?auto_586603 ?auto_586604 ) ( ON ?auto_586602 ?auto_586603 ) ( ON ?auto_586601 ?auto_586602 ) ( CLEAR ?auto_586599 ) ( ON ?auto_586600 ?auto_586601 ) ( CLEAR ?auto_586600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_586595 ?auto_586596 ?auto_586597 ?auto_586598 ?auto_586599 ?auto_586600 )
      ( MAKE-12PILE ?auto_586595 ?auto_586596 ?auto_586597 ?auto_586598 ?auto_586599 ?auto_586600 ?auto_586601 ?auto_586602 ?auto_586603 ?auto_586604 ?auto_586605 ?auto_586606 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_586645 - BLOCK
      ?auto_586646 - BLOCK
      ?auto_586647 - BLOCK
      ?auto_586648 - BLOCK
      ?auto_586649 - BLOCK
      ?auto_586650 - BLOCK
      ?auto_586651 - BLOCK
      ?auto_586652 - BLOCK
      ?auto_586653 - BLOCK
      ?auto_586654 - BLOCK
      ?auto_586655 - BLOCK
      ?auto_586656 - BLOCK
    )
    :vars
    (
      ?auto_586657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586656 ?auto_586657 ) ( ON-TABLE ?auto_586645 ) ( ON ?auto_586646 ?auto_586645 ) ( ON ?auto_586647 ?auto_586646 ) ( ON ?auto_586648 ?auto_586647 ) ( not ( = ?auto_586645 ?auto_586646 ) ) ( not ( = ?auto_586645 ?auto_586647 ) ) ( not ( = ?auto_586645 ?auto_586648 ) ) ( not ( = ?auto_586645 ?auto_586649 ) ) ( not ( = ?auto_586645 ?auto_586650 ) ) ( not ( = ?auto_586645 ?auto_586651 ) ) ( not ( = ?auto_586645 ?auto_586652 ) ) ( not ( = ?auto_586645 ?auto_586653 ) ) ( not ( = ?auto_586645 ?auto_586654 ) ) ( not ( = ?auto_586645 ?auto_586655 ) ) ( not ( = ?auto_586645 ?auto_586656 ) ) ( not ( = ?auto_586645 ?auto_586657 ) ) ( not ( = ?auto_586646 ?auto_586647 ) ) ( not ( = ?auto_586646 ?auto_586648 ) ) ( not ( = ?auto_586646 ?auto_586649 ) ) ( not ( = ?auto_586646 ?auto_586650 ) ) ( not ( = ?auto_586646 ?auto_586651 ) ) ( not ( = ?auto_586646 ?auto_586652 ) ) ( not ( = ?auto_586646 ?auto_586653 ) ) ( not ( = ?auto_586646 ?auto_586654 ) ) ( not ( = ?auto_586646 ?auto_586655 ) ) ( not ( = ?auto_586646 ?auto_586656 ) ) ( not ( = ?auto_586646 ?auto_586657 ) ) ( not ( = ?auto_586647 ?auto_586648 ) ) ( not ( = ?auto_586647 ?auto_586649 ) ) ( not ( = ?auto_586647 ?auto_586650 ) ) ( not ( = ?auto_586647 ?auto_586651 ) ) ( not ( = ?auto_586647 ?auto_586652 ) ) ( not ( = ?auto_586647 ?auto_586653 ) ) ( not ( = ?auto_586647 ?auto_586654 ) ) ( not ( = ?auto_586647 ?auto_586655 ) ) ( not ( = ?auto_586647 ?auto_586656 ) ) ( not ( = ?auto_586647 ?auto_586657 ) ) ( not ( = ?auto_586648 ?auto_586649 ) ) ( not ( = ?auto_586648 ?auto_586650 ) ) ( not ( = ?auto_586648 ?auto_586651 ) ) ( not ( = ?auto_586648 ?auto_586652 ) ) ( not ( = ?auto_586648 ?auto_586653 ) ) ( not ( = ?auto_586648 ?auto_586654 ) ) ( not ( = ?auto_586648 ?auto_586655 ) ) ( not ( = ?auto_586648 ?auto_586656 ) ) ( not ( = ?auto_586648 ?auto_586657 ) ) ( not ( = ?auto_586649 ?auto_586650 ) ) ( not ( = ?auto_586649 ?auto_586651 ) ) ( not ( = ?auto_586649 ?auto_586652 ) ) ( not ( = ?auto_586649 ?auto_586653 ) ) ( not ( = ?auto_586649 ?auto_586654 ) ) ( not ( = ?auto_586649 ?auto_586655 ) ) ( not ( = ?auto_586649 ?auto_586656 ) ) ( not ( = ?auto_586649 ?auto_586657 ) ) ( not ( = ?auto_586650 ?auto_586651 ) ) ( not ( = ?auto_586650 ?auto_586652 ) ) ( not ( = ?auto_586650 ?auto_586653 ) ) ( not ( = ?auto_586650 ?auto_586654 ) ) ( not ( = ?auto_586650 ?auto_586655 ) ) ( not ( = ?auto_586650 ?auto_586656 ) ) ( not ( = ?auto_586650 ?auto_586657 ) ) ( not ( = ?auto_586651 ?auto_586652 ) ) ( not ( = ?auto_586651 ?auto_586653 ) ) ( not ( = ?auto_586651 ?auto_586654 ) ) ( not ( = ?auto_586651 ?auto_586655 ) ) ( not ( = ?auto_586651 ?auto_586656 ) ) ( not ( = ?auto_586651 ?auto_586657 ) ) ( not ( = ?auto_586652 ?auto_586653 ) ) ( not ( = ?auto_586652 ?auto_586654 ) ) ( not ( = ?auto_586652 ?auto_586655 ) ) ( not ( = ?auto_586652 ?auto_586656 ) ) ( not ( = ?auto_586652 ?auto_586657 ) ) ( not ( = ?auto_586653 ?auto_586654 ) ) ( not ( = ?auto_586653 ?auto_586655 ) ) ( not ( = ?auto_586653 ?auto_586656 ) ) ( not ( = ?auto_586653 ?auto_586657 ) ) ( not ( = ?auto_586654 ?auto_586655 ) ) ( not ( = ?auto_586654 ?auto_586656 ) ) ( not ( = ?auto_586654 ?auto_586657 ) ) ( not ( = ?auto_586655 ?auto_586656 ) ) ( not ( = ?auto_586655 ?auto_586657 ) ) ( not ( = ?auto_586656 ?auto_586657 ) ) ( ON ?auto_586655 ?auto_586656 ) ( ON ?auto_586654 ?auto_586655 ) ( ON ?auto_586653 ?auto_586654 ) ( ON ?auto_586652 ?auto_586653 ) ( ON ?auto_586651 ?auto_586652 ) ( ON ?auto_586650 ?auto_586651 ) ( CLEAR ?auto_586648 ) ( ON ?auto_586649 ?auto_586650 ) ( CLEAR ?auto_586649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_586645 ?auto_586646 ?auto_586647 ?auto_586648 ?auto_586649 )
      ( MAKE-12PILE ?auto_586645 ?auto_586646 ?auto_586647 ?auto_586648 ?auto_586649 ?auto_586650 ?auto_586651 ?auto_586652 ?auto_586653 ?auto_586654 ?auto_586655 ?auto_586656 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_586695 - BLOCK
      ?auto_586696 - BLOCK
      ?auto_586697 - BLOCK
      ?auto_586698 - BLOCK
      ?auto_586699 - BLOCK
      ?auto_586700 - BLOCK
      ?auto_586701 - BLOCK
      ?auto_586702 - BLOCK
      ?auto_586703 - BLOCK
      ?auto_586704 - BLOCK
      ?auto_586705 - BLOCK
      ?auto_586706 - BLOCK
    )
    :vars
    (
      ?auto_586707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586706 ?auto_586707 ) ( ON-TABLE ?auto_586695 ) ( ON ?auto_586696 ?auto_586695 ) ( ON ?auto_586697 ?auto_586696 ) ( not ( = ?auto_586695 ?auto_586696 ) ) ( not ( = ?auto_586695 ?auto_586697 ) ) ( not ( = ?auto_586695 ?auto_586698 ) ) ( not ( = ?auto_586695 ?auto_586699 ) ) ( not ( = ?auto_586695 ?auto_586700 ) ) ( not ( = ?auto_586695 ?auto_586701 ) ) ( not ( = ?auto_586695 ?auto_586702 ) ) ( not ( = ?auto_586695 ?auto_586703 ) ) ( not ( = ?auto_586695 ?auto_586704 ) ) ( not ( = ?auto_586695 ?auto_586705 ) ) ( not ( = ?auto_586695 ?auto_586706 ) ) ( not ( = ?auto_586695 ?auto_586707 ) ) ( not ( = ?auto_586696 ?auto_586697 ) ) ( not ( = ?auto_586696 ?auto_586698 ) ) ( not ( = ?auto_586696 ?auto_586699 ) ) ( not ( = ?auto_586696 ?auto_586700 ) ) ( not ( = ?auto_586696 ?auto_586701 ) ) ( not ( = ?auto_586696 ?auto_586702 ) ) ( not ( = ?auto_586696 ?auto_586703 ) ) ( not ( = ?auto_586696 ?auto_586704 ) ) ( not ( = ?auto_586696 ?auto_586705 ) ) ( not ( = ?auto_586696 ?auto_586706 ) ) ( not ( = ?auto_586696 ?auto_586707 ) ) ( not ( = ?auto_586697 ?auto_586698 ) ) ( not ( = ?auto_586697 ?auto_586699 ) ) ( not ( = ?auto_586697 ?auto_586700 ) ) ( not ( = ?auto_586697 ?auto_586701 ) ) ( not ( = ?auto_586697 ?auto_586702 ) ) ( not ( = ?auto_586697 ?auto_586703 ) ) ( not ( = ?auto_586697 ?auto_586704 ) ) ( not ( = ?auto_586697 ?auto_586705 ) ) ( not ( = ?auto_586697 ?auto_586706 ) ) ( not ( = ?auto_586697 ?auto_586707 ) ) ( not ( = ?auto_586698 ?auto_586699 ) ) ( not ( = ?auto_586698 ?auto_586700 ) ) ( not ( = ?auto_586698 ?auto_586701 ) ) ( not ( = ?auto_586698 ?auto_586702 ) ) ( not ( = ?auto_586698 ?auto_586703 ) ) ( not ( = ?auto_586698 ?auto_586704 ) ) ( not ( = ?auto_586698 ?auto_586705 ) ) ( not ( = ?auto_586698 ?auto_586706 ) ) ( not ( = ?auto_586698 ?auto_586707 ) ) ( not ( = ?auto_586699 ?auto_586700 ) ) ( not ( = ?auto_586699 ?auto_586701 ) ) ( not ( = ?auto_586699 ?auto_586702 ) ) ( not ( = ?auto_586699 ?auto_586703 ) ) ( not ( = ?auto_586699 ?auto_586704 ) ) ( not ( = ?auto_586699 ?auto_586705 ) ) ( not ( = ?auto_586699 ?auto_586706 ) ) ( not ( = ?auto_586699 ?auto_586707 ) ) ( not ( = ?auto_586700 ?auto_586701 ) ) ( not ( = ?auto_586700 ?auto_586702 ) ) ( not ( = ?auto_586700 ?auto_586703 ) ) ( not ( = ?auto_586700 ?auto_586704 ) ) ( not ( = ?auto_586700 ?auto_586705 ) ) ( not ( = ?auto_586700 ?auto_586706 ) ) ( not ( = ?auto_586700 ?auto_586707 ) ) ( not ( = ?auto_586701 ?auto_586702 ) ) ( not ( = ?auto_586701 ?auto_586703 ) ) ( not ( = ?auto_586701 ?auto_586704 ) ) ( not ( = ?auto_586701 ?auto_586705 ) ) ( not ( = ?auto_586701 ?auto_586706 ) ) ( not ( = ?auto_586701 ?auto_586707 ) ) ( not ( = ?auto_586702 ?auto_586703 ) ) ( not ( = ?auto_586702 ?auto_586704 ) ) ( not ( = ?auto_586702 ?auto_586705 ) ) ( not ( = ?auto_586702 ?auto_586706 ) ) ( not ( = ?auto_586702 ?auto_586707 ) ) ( not ( = ?auto_586703 ?auto_586704 ) ) ( not ( = ?auto_586703 ?auto_586705 ) ) ( not ( = ?auto_586703 ?auto_586706 ) ) ( not ( = ?auto_586703 ?auto_586707 ) ) ( not ( = ?auto_586704 ?auto_586705 ) ) ( not ( = ?auto_586704 ?auto_586706 ) ) ( not ( = ?auto_586704 ?auto_586707 ) ) ( not ( = ?auto_586705 ?auto_586706 ) ) ( not ( = ?auto_586705 ?auto_586707 ) ) ( not ( = ?auto_586706 ?auto_586707 ) ) ( ON ?auto_586705 ?auto_586706 ) ( ON ?auto_586704 ?auto_586705 ) ( ON ?auto_586703 ?auto_586704 ) ( ON ?auto_586702 ?auto_586703 ) ( ON ?auto_586701 ?auto_586702 ) ( ON ?auto_586700 ?auto_586701 ) ( ON ?auto_586699 ?auto_586700 ) ( CLEAR ?auto_586697 ) ( ON ?auto_586698 ?auto_586699 ) ( CLEAR ?auto_586698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_586695 ?auto_586696 ?auto_586697 ?auto_586698 )
      ( MAKE-12PILE ?auto_586695 ?auto_586696 ?auto_586697 ?auto_586698 ?auto_586699 ?auto_586700 ?auto_586701 ?auto_586702 ?auto_586703 ?auto_586704 ?auto_586705 ?auto_586706 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_586745 - BLOCK
      ?auto_586746 - BLOCK
      ?auto_586747 - BLOCK
      ?auto_586748 - BLOCK
      ?auto_586749 - BLOCK
      ?auto_586750 - BLOCK
      ?auto_586751 - BLOCK
      ?auto_586752 - BLOCK
      ?auto_586753 - BLOCK
      ?auto_586754 - BLOCK
      ?auto_586755 - BLOCK
      ?auto_586756 - BLOCK
    )
    :vars
    (
      ?auto_586757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586756 ?auto_586757 ) ( ON-TABLE ?auto_586745 ) ( ON ?auto_586746 ?auto_586745 ) ( not ( = ?auto_586745 ?auto_586746 ) ) ( not ( = ?auto_586745 ?auto_586747 ) ) ( not ( = ?auto_586745 ?auto_586748 ) ) ( not ( = ?auto_586745 ?auto_586749 ) ) ( not ( = ?auto_586745 ?auto_586750 ) ) ( not ( = ?auto_586745 ?auto_586751 ) ) ( not ( = ?auto_586745 ?auto_586752 ) ) ( not ( = ?auto_586745 ?auto_586753 ) ) ( not ( = ?auto_586745 ?auto_586754 ) ) ( not ( = ?auto_586745 ?auto_586755 ) ) ( not ( = ?auto_586745 ?auto_586756 ) ) ( not ( = ?auto_586745 ?auto_586757 ) ) ( not ( = ?auto_586746 ?auto_586747 ) ) ( not ( = ?auto_586746 ?auto_586748 ) ) ( not ( = ?auto_586746 ?auto_586749 ) ) ( not ( = ?auto_586746 ?auto_586750 ) ) ( not ( = ?auto_586746 ?auto_586751 ) ) ( not ( = ?auto_586746 ?auto_586752 ) ) ( not ( = ?auto_586746 ?auto_586753 ) ) ( not ( = ?auto_586746 ?auto_586754 ) ) ( not ( = ?auto_586746 ?auto_586755 ) ) ( not ( = ?auto_586746 ?auto_586756 ) ) ( not ( = ?auto_586746 ?auto_586757 ) ) ( not ( = ?auto_586747 ?auto_586748 ) ) ( not ( = ?auto_586747 ?auto_586749 ) ) ( not ( = ?auto_586747 ?auto_586750 ) ) ( not ( = ?auto_586747 ?auto_586751 ) ) ( not ( = ?auto_586747 ?auto_586752 ) ) ( not ( = ?auto_586747 ?auto_586753 ) ) ( not ( = ?auto_586747 ?auto_586754 ) ) ( not ( = ?auto_586747 ?auto_586755 ) ) ( not ( = ?auto_586747 ?auto_586756 ) ) ( not ( = ?auto_586747 ?auto_586757 ) ) ( not ( = ?auto_586748 ?auto_586749 ) ) ( not ( = ?auto_586748 ?auto_586750 ) ) ( not ( = ?auto_586748 ?auto_586751 ) ) ( not ( = ?auto_586748 ?auto_586752 ) ) ( not ( = ?auto_586748 ?auto_586753 ) ) ( not ( = ?auto_586748 ?auto_586754 ) ) ( not ( = ?auto_586748 ?auto_586755 ) ) ( not ( = ?auto_586748 ?auto_586756 ) ) ( not ( = ?auto_586748 ?auto_586757 ) ) ( not ( = ?auto_586749 ?auto_586750 ) ) ( not ( = ?auto_586749 ?auto_586751 ) ) ( not ( = ?auto_586749 ?auto_586752 ) ) ( not ( = ?auto_586749 ?auto_586753 ) ) ( not ( = ?auto_586749 ?auto_586754 ) ) ( not ( = ?auto_586749 ?auto_586755 ) ) ( not ( = ?auto_586749 ?auto_586756 ) ) ( not ( = ?auto_586749 ?auto_586757 ) ) ( not ( = ?auto_586750 ?auto_586751 ) ) ( not ( = ?auto_586750 ?auto_586752 ) ) ( not ( = ?auto_586750 ?auto_586753 ) ) ( not ( = ?auto_586750 ?auto_586754 ) ) ( not ( = ?auto_586750 ?auto_586755 ) ) ( not ( = ?auto_586750 ?auto_586756 ) ) ( not ( = ?auto_586750 ?auto_586757 ) ) ( not ( = ?auto_586751 ?auto_586752 ) ) ( not ( = ?auto_586751 ?auto_586753 ) ) ( not ( = ?auto_586751 ?auto_586754 ) ) ( not ( = ?auto_586751 ?auto_586755 ) ) ( not ( = ?auto_586751 ?auto_586756 ) ) ( not ( = ?auto_586751 ?auto_586757 ) ) ( not ( = ?auto_586752 ?auto_586753 ) ) ( not ( = ?auto_586752 ?auto_586754 ) ) ( not ( = ?auto_586752 ?auto_586755 ) ) ( not ( = ?auto_586752 ?auto_586756 ) ) ( not ( = ?auto_586752 ?auto_586757 ) ) ( not ( = ?auto_586753 ?auto_586754 ) ) ( not ( = ?auto_586753 ?auto_586755 ) ) ( not ( = ?auto_586753 ?auto_586756 ) ) ( not ( = ?auto_586753 ?auto_586757 ) ) ( not ( = ?auto_586754 ?auto_586755 ) ) ( not ( = ?auto_586754 ?auto_586756 ) ) ( not ( = ?auto_586754 ?auto_586757 ) ) ( not ( = ?auto_586755 ?auto_586756 ) ) ( not ( = ?auto_586755 ?auto_586757 ) ) ( not ( = ?auto_586756 ?auto_586757 ) ) ( ON ?auto_586755 ?auto_586756 ) ( ON ?auto_586754 ?auto_586755 ) ( ON ?auto_586753 ?auto_586754 ) ( ON ?auto_586752 ?auto_586753 ) ( ON ?auto_586751 ?auto_586752 ) ( ON ?auto_586750 ?auto_586751 ) ( ON ?auto_586749 ?auto_586750 ) ( ON ?auto_586748 ?auto_586749 ) ( CLEAR ?auto_586746 ) ( ON ?auto_586747 ?auto_586748 ) ( CLEAR ?auto_586747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_586745 ?auto_586746 ?auto_586747 )
      ( MAKE-12PILE ?auto_586745 ?auto_586746 ?auto_586747 ?auto_586748 ?auto_586749 ?auto_586750 ?auto_586751 ?auto_586752 ?auto_586753 ?auto_586754 ?auto_586755 ?auto_586756 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_586795 - BLOCK
      ?auto_586796 - BLOCK
      ?auto_586797 - BLOCK
      ?auto_586798 - BLOCK
      ?auto_586799 - BLOCK
      ?auto_586800 - BLOCK
      ?auto_586801 - BLOCK
      ?auto_586802 - BLOCK
      ?auto_586803 - BLOCK
      ?auto_586804 - BLOCK
      ?auto_586805 - BLOCK
      ?auto_586806 - BLOCK
    )
    :vars
    (
      ?auto_586807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586806 ?auto_586807 ) ( ON-TABLE ?auto_586795 ) ( not ( = ?auto_586795 ?auto_586796 ) ) ( not ( = ?auto_586795 ?auto_586797 ) ) ( not ( = ?auto_586795 ?auto_586798 ) ) ( not ( = ?auto_586795 ?auto_586799 ) ) ( not ( = ?auto_586795 ?auto_586800 ) ) ( not ( = ?auto_586795 ?auto_586801 ) ) ( not ( = ?auto_586795 ?auto_586802 ) ) ( not ( = ?auto_586795 ?auto_586803 ) ) ( not ( = ?auto_586795 ?auto_586804 ) ) ( not ( = ?auto_586795 ?auto_586805 ) ) ( not ( = ?auto_586795 ?auto_586806 ) ) ( not ( = ?auto_586795 ?auto_586807 ) ) ( not ( = ?auto_586796 ?auto_586797 ) ) ( not ( = ?auto_586796 ?auto_586798 ) ) ( not ( = ?auto_586796 ?auto_586799 ) ) ( not ( = ?auto_586796 ?auto_586800 ) ) ( not ( = ?auto_586796 ?auto_586801 ) ) ( not ( = ?auto_586796 ?auto_586802 ) ) ( not ( = ?auto_586796 ?auto_586803 ) ) ( not ( = ?auto_586796 ?auto_586804 ) ) ( not ( = ?auto_586796 ?auto_586805 ) ) ( not ( = ?auto_586796 ?auto_586806 ) ) ( not ( = ?auto_586796 ?auto_586807 ) ) ( not ( = ?auto_586797 ?auto_586798 ) ) ( not ( = ?auto_586797 ?auto_586799 ) ) ( not ( = ?auto_586797 ?auto_586800 ) ) ( not ( = ?auto_586797 ?auto_586801 ) ) ( not ( = ?auto_586797 ?auto_586802 ) ) ( not ( = ?auto_586797 ?auto_586803 ) ) ( not ( = ?auto_586797 ?auto_586804 ) ) ( not ( = ?auto_586797 ?auto_586805 ) ) ( not ( = ?auto_586797 ?auto_586806 ) ) ( not ( = ?auto_586797 ?auto_586807 ) ) ( not ( = ?auto_586798 ?auto_586799 ) ) ( not ( = ?auto_586798 ?auto_586800 ) ) ( not ( = ?auto_586798 ?auto_586801 ) ) ( not ( = ?auto_586798 ?auto_586802 ) ) ( not ( = ?auto_586798 ?auto_586803 ) ) ( not ( = ?auto_586798 ?auto_586804 ) ) ( not ( = ?auto_586798 ?auto_586805 ) ) ( not ( = ?auto_586798 ?auto_586806 ) ) ( not ( = ?auto_586798 ?auto_586807 ) ) ( not ( = ?auto_586799 ?auto_586800 ) ) ( not ( = ?auto_586799 ?auto_586801 ) ) ( not ( = ?auto_586799 ?auto_586802 ) ) ( not ( = ?auto_586799 ?auto_586803 ) ) ( not ( = ?auto_586799 ?auto_586804 ) ) ( not ( = ?auto_586799 ?auto_586805 ) ) ( not ( = ?auto_586799 ?auto_586806 ) ) ( not ( = ?auto_586799 ?auto_586807 ) ) ( not ( = ?auto_586800 ?auto_586801 ) ) ( not ( = ?auto_586800 ?auto_586802 ) ) ( not ( = ?auto_586800 ?auto_586803 ) ) ( not ( = ?auto_586800 ?auto_586804 ) ) ( not ( = ?auto_586800 ?auto_586805 ) ) ( not ( = ?auto_586800 ?auto_586806 ) ) ( not ( = ?auto_586800 ?auto_586807 ) ) ( not ( = ?auto_586801 ?auto_586802 ) ) ( not ( = ?auto_586801 ?auto_586803 ) ) ( not ( = ?auto_586801 ?auto_586804 ) ) ( not ( = ?auto_586801 ?auto_586805 ) ) ( not ( = ?auto_586801 ?auto_586806 ) ) ( not ( = ?auto_586801 ?auto_586807 ) ) ( not ( = ?auto_586802 ?auto_586803 ) ) ( not ( = ?auto_586802 ?auto_586804 ) ) ( not ( = ?auto_586802 ?auto_586805 ) ) ( not ( = ?auto_586802 ?auto_586806 ) ) ( not ( = ?auto_586802 ?auto_586807 ) ) ( not ( = ?auto_586803 ?auto_586804 ) ) ( not ( = ?auto_586803 ?auto_586805 ) ) ( not ( = ?auto_586803 ?auto_586806 ) ) ( not ( = ?auto_586803 ?auto_586807 ) ) ( not ( = ?auto_586804 ?auto_586805 ) ) ( not ( = ?auto_586804 ?auto_586806 ) ) ( not ( = ?auto_586804 ?auto_586807 ) ) ( not ( = ?auto_586805 ?auto_586806 ) ) ( not ( = ?auto_586805 ?auto_586807 ) ) ( not ( = ?auto_586806 ?auto_586807 ) ) ( ON ?auto_586805 ?auto_586806 ) ( ON ?auto_586804 ?auto_586805 ) ( ON ?auto_586803 ?auto_586804 ) ( ON ?auto_586802 ?auto_586803 ) ( ON ?auto_586801 ?auto_586802 ) ( ON ?auto_586800 ?auto_586801 ) ( ON ?auto_586799 ?auto_586800 ) ( ON ?auto_586798 ?auto_586799 ) ( ON ?auto_586797 ?auto_586798 ) ( CLEAR ?auto_586795 ) ( ON ?auto_586796 ?auto_586797 ) ( CLEAR ?auto_586796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_586795 ?auto_586796 )
      ( MAKE-12PILE ?auto_586795 ?auto_586796 ?auto_586797 ?auto_586798 ?auto_586799 ?auto_586800 ?auto_586801 ?auto_586802 ?auto_586803 ?auto_586804 ?auto_586805 ?auto_586806 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_586845 - BLOCK
      ?auto_586846 - BLOCK
      ?auto_586847 - BLOCK
      ?auto_586848 - BLOCK
      ?auto_586849 - BLOCK
      ?auto_586850 - BLOCK
      ?auto_586851 - BLOCK
      ?auto_586852 - BLOCK
      ?auto_586853 - BLOCK
      ?auto_586854 - BLOCK
      ?auto_586855 - BLOCK
      ?auto_586856 - BLOCK
    )
    :vars
    (
      ?auto_586857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586856 ?auto_586857 ) ( not ( = ?auto_586845 ?auto_586846 ) ) ( not ( = ?auto_586845 ?auto_586847 ) ) ( not ( = ?auto_586845 ?auto_586848 ) ) ( not ( = ?auto_586845 ?auto_586849 ) ) ( not ( = ?auto_586845 ?auto_586850 ) ) ( not ( = ?auto_586845 ?auto_586851 ) ) ( not ( = ?auto_586845 ?auto_586852 ) ) ( not ( = ?auto_586845 ?auto_586853 ) ) ( not ( = ?auto_586845 ?auto_586854 ) ) ( not ( = ?auto_586845 ?auto_586855 ) ) ( not ( = ?auto_586845 ?auto_586856 ) ) ( not ( = ?auto_586845 ?auto_586857 ) ) ( not ( = ?auto_586846 ?auto_586847 ) ) ( not ( = ?auto_586846 ?auto_586848 ) ) ( not ( = ?auto_586846 ?auto_586849 ) ) ( not ( = ?auto_586846 ?auto_586850 ) ) ( not ( = ?auto_586846 ?auto_586851 ) ) ( not ( = ?auto_586846 ?auto_586852 ) ) ( not ( = ?auto_586846 ?auto_586853 ) ) ( not ( = ?auto_586846 ?auto_586854 ) ) ( not ( = ?auto_586846 ?auto_586855 ) ) ( not ( = ?auto_586846 ?auto_586856 ) ) ( not ( = ?auto_586846 ?auto_586857 ) ) ( not ( = ?auto_586847 ?auto_586848 ) ) ( not ( = ?auto_586847 ?auto_586849 ) ) ( not ( = ?auto_586847 ?auto_586850 ) ) ( not ( = ?auto_586847 ?auto_586851 ) ) ( not ( = ?auto_586847 ?auto_586852 ) ) ( not ( = ?auto_586847 ?auto_586853 ) ) ( not ( = ?auto_586847 ?auto_586854 ) ) ( not ( = ?auto_586847 ?auto_586855 ) ) ( not ( = ?auto_586847 ?auto_586856 ) ) ( not ( = ?auto_586847 ?auto_586857 ) ) ( not ( = ?auto_586848 ?auto_586849 ) ) ( not ( = ?auto_586848 ?auto_586850 ) ) ( not ( = ?auto_586848 ?auto_586851 ) ) ( not ( = ?auto_586848 ?auto_586852 ) ) ( not ( = ?auto_586848 ?auto_586853 ) ) ( not ( = ?auto_586848 ?auto_586854 ) ) ( not ( = ?auto_586848 ?auto_586855 ) ) ( not ( = ?auto_586848 ?auto_586856 ) ) ( not ( = ?auto_586848 ?auto_586857 ) ) ( not ( = ?auto_586849 ?auto_586850 ) ) ( not ( = ?auto_586849 ?auto_586851 ) ) ( not ( = ?auto_586849 ?auto_586852 ) ) ( not ( = ?auto_586849 ?auto_586853 ) ) ( not ( = ?auto_586849 ?auto_586854 ) ) ( not ( = ?auto_586849 ?auto_586855 ) ) ( not ( = ?auto_586849 ?auto_586856 ) ) ( not ( = ?auto_586849 ?auto_586857 ) ) ( not ( = ?auto_586850 ?auto_586851 ) ) ( not ( = ?auto_586850 ?auto_586852 ) ) ( not ( = ?auto_586850 ?auto_586853 ) ) ( not ( = ?auto_586850 ?auto_586854 ) ) ( not ( = ?auto_586850 ?auto_586855 ) ) ( not ( = ?auto_586850 ?auto_586856 ) ) ( not ( = ?auto_586850 ?auto_586857 ) ) ( not ( = ?auto_586851 ?auto_586852 ) ) ( not ( = ?auto_586851 ?auto_586853 ) ) ( not ( = ?auto_586851 ?auto_586854 ) ) ( not ( = ?auto_586851 ?auto_586855 ) ) ( not ( = ?auto_586851 ?auto_586856 ) ) ( not ( = ?auto_586851 ?auto_586857 ) ) ( not ( = ?auto_586852 ?auto_586853 ) ) ( not ( = ?auto_586852 ?auto_586854 ) ) ( not ( = ?auto_586852 ?auto_586855 ) ) ( not ( = ?auto_586852 ?auto_586856 ) ) ( not ( = ?auto_586852 ?auto_586857 ) ) ( not ( = ?auto_586853 ?auto_586854 ) ) ( not ( = ?auto_586853 ?auto_586855 ) ) ( not ( = ?auto_586853 ?auto_586856 ) ) ( not ( = ?auto_586853 ?auto_586857 ) ) ( not ( = ?auto_586854 ?auto_586855 ) ) ( not ( = ?auto_586854 ?auto_586856 ) ) ( not ( = ?auto_586854 ?auto_586857 ) ) ( not ( = ?auto_586855 ?auto_586856 ) ) ( not ( = ?auto_586855 ?auto_586857 ) ) ( not ( = ?auto_586856 ?auto_586857 ) ) ( ON ?auto_586855 ?auto_586856 ) ( ON ?auto_586854 ?auto_586855 ) ( ON ?auto_586853 ?auto_586854 ) ( ON ?auto_586852 ?auto_586853 ) ( ON ?auto_586851 ?auto_586852 ) ( ON ?auto_586850 ?auto_586851 ) ( ON ?auto_586849 ?auto_586850 ) ( ON ?auto_586848 ?auto_586849 ) ( ON ?auto_586847 ?auto_586848 ) ( ON ?auto_586846 ?auto_586847 ) ( ON ?auto_586845 ?auto_586846 ) ( CLEAR ?auto_586845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_586845 )
      ( MAKE-12PILE ?auto_586845 ?auto_586846 ?auto_586847 ?auto_586848 ?auto_586849 ?auto_586850 ?auto_586851 ?auto_586852 ?auto_586853 ?auto_586854 ?auto_586855 ?auto_586856 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_586896 - BLOCK
      ?auto_586897 - BLOCK
      ?auto_586898 - BLOCK
      ?auto_586899 - BLOCK
      ?auto_586900 - BLOCK
      ?auto_586901 - BLOCK
      ?auto_586902 - BLOCK
      ?auto_586903 - BLOCK
      ?auto_586904 - BLOCK
      ?auto_586905 - BLOCK
      ?auto_586906 - BLOCK
      ?auto_586907 - BLOCK
      ?auto_586908 - BLOCK
    )
    :vars
    (
      ?auto_586909 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_586907 ) ( ON ?auto_586908 ?auto_586909 ) ( CLEAR ?auto_586908 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_586896 ) ( ON ?auto_586897 ?auto_586896 ) ( ON ?auto_586898 ?auto_586897 ) ( ON ?auto_586899 ?auto_586898 ) ( ON ?auto_586900 ?auto_586899 ) ( ON ?auto_586901 ?auto_586900 ) ( ON ?auto_586902 ?auto_586901 ) ( ON ?auto_586903 ?auto_586902 ) ( ON ?auto_586904 ?auto_586903 ) ( ON ?auto_586905 ?auto_586904 ) ( ON ?auto_586906 ?auto_586905 ) ( ON ?auto_586907 ?auto_586906 ) ( not ( = ?auto_586896 ?auto_586897 ) ) ( not ( = ?auto_586896 ?auto_586898 ) ) ( not ( = ?auto_586896 ?auto_586899 ) ) ( not ( = ?auto_586896 ?auto_586900 ) ) ( not ( = ?auto_586896 ?auto_586901 ) ) ( not ( = ?auto_586896 ?auto_586902 ) ) ( not ( = ?auto_586896 ?auto_586903 ) ) ( not ( = ?auto_586896 ?auto_586904 ) ) ( not ( = ?auto_586896 ?auto_586905 ) ) ( not ( = ?auto_586896 ?auto_586906 ) ) ( not ( = ?auto_586896 ?auto_586907 ) ) ( not ( = ?auto_586896 ?auto_586908 ) ) ( not ( = ?auto_586896 ?auto_586909 ) ) ( not ( = ?auto_586897 ?auto_586898 ) ) ( not ( = ?auto_586897 ?auto_586899 ) ) ( not ( = ?auto_586897 ?auto_586900 ) ) ( not ( = ?auto_586897 ?auto_586901 ) ) ( not ( = ?auto_586897 ?auto_586902 ) ) ( not ( = ?auto_586897 ?auto_586903 ) ) ( not ( = ?auto_586897 ?auto_586904 ) ) ( not ( = ?auto_586897 ?auto_586905 ) ) ( not ( = ?auto_586897 ?auto_586906 ) ) ( not ( = ?auto_586897 ?auto_586907 ) ) ( not ( = ?auto_586897 ?auto_586908 ) ) ( not ( = ?auto_586897 ?auto_586909 ) ) ( not ( = ?auto_586898 ?auto_586899 ) ) ( not ( = ?auto_586898 ?auto_586900 ) ) ( not ( = ?auto_586898 ?auto_586901 ) ) ( not ( = ?auto_586898 ?auto_586902 ) ) ( not ( = ?auto_586898 ?auto_586903 ) ) ( not ( = ?auto_586898 ?auto_586904 ) ) ( not ( = ?auto_586898 ?auto_586905 ) ) ( not ( = ?auto_586898 ?auto_586906 ) ) ( not ( = ?auto_586898 ?auto_586907 ) ) ( not ( = ?auto_586898 ?auto_586908 ) ) ( not ( = ?auto_586898 ?auto_586909 ) ) ( not ( = ?auto_586899 ?auto_586900 ) ) ( not ( = ?auto_586899 ?auto_586901 ) ) ( not ( = ?auto_586899 ?auto_586902 ) ) ( not ( = ?auto_586899 ?auto_586903 ) ) ( not ( = ?auto_586899 ?auto_586904 ) ) ( not ( = ?auto_586899 ?auto_586905 ) ) ( not ( = ?auto_586899 ?auto_586906 ) ) ( not ( = ?auto_586899 ?auto_586907 ) ) ( not ( = ?auto_586899 ?auto_586908 ) ) ( not ( = ?auto_586899 ?auto_586909 ) ) ( not ( = ?auto_586900 ?auto_586901 ) ) ( not ( = ?auto_586900 ?auto_586902 ) ) ( not ( = ?auto_586900 ?auto_586903 ) ) ( not ( = ?auto_586900 ?auto_586904 ) ) ( not ( = ?auto_586900 ?auto_586905 ) ) ( not ( = ?auto_586900 ?auto_586906 ) ) ( not ( = ?auto_586900 ?auto_586907 ) ) ( not ( = ?auto_586900 ?auto_586908 ) ) ( not ( = ?auto_586900 ?auto_586909 ) ) ( not ( = ?auto_586901 ?auto_586902 ) ) ( not ( = ?auto_586901 ?auto_586903 ) ) ( not ( = ?auto_586901 ?auto_586904 ) ) ( not ( = ?auto_586901 ?auto_586905 ) ) ( not ( = ?auto_586901 ?auto_586906 ) ) ( not ( = ?auto_586901 ?auto_586907 ) ) ( not ( = ?auto_586901 ?auto_586908 ) ) ( not ( = ?auto_586901 ?auto_586909 ) ) ( not ( = ?auto_586902 ?auto_586903 ) ) ( not ( = ?auto_586902 ?auto_586904 ) ) ( not ( = ?auto_586902 ?auto_586905 ) ) ( not ( = ?auto_586902 ?auto_586906 ) ) ( not ( = ?auto_586902 ?auto_586907 ) ) ( not ( = ?auto_586902 ?auto_586908 ) ) ( not ( = ?auto_586902 ?auto_586909 ) ) ( not ( = ?auto_586903 ?auto_586904 ) ) ( not ( = ?auto_586903 ?auto_586905 ) ) ( not ( = ?auto_586903 ?auto_586906 ) ) ( not ( = ?auto_586903 ?auto_586907 ) ) ( not ( = ?auto_586903 ?auto_586908 ) ) ( not ( = ?auto_586903 ?auto_586909 ) ) ( not ( = ?auto_586904 ?auto_586905 ) ) ( not ( = ?auto_586904 ?auto_586906 ) ) ( not ( = ?auto_586904 ?auto_586907 ) ) ( not ( = ?auto_586904 ?auto_586908 ) ) ( not ( = ?auto_586904 ?auto_586909 ) ) ( not ( = ?auto_586905 ?auto_586906 ) ) ( not ( = ?auto_586905 ?auto_586907 ) ) ( not ( = ?auto_586905 ?auto_586908 ) ) ( not ( = ?auto_586905 ?auto_586909 ) ) ( not ( = ?auto_586906 ?auto_586907 ) ) ( not ( = ?auto_586906 ?auto_586908 ) ) ( not ( = ?auto_586906 ?auto_586909 ) ) ( not ( = ?auto_586907 ?auto_586908 ) ) ( not ( = ?auto_586907 ?auto_586909 ) ) ( not ( = ?auto_586908 ?auto_586909 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_586908 ?auto_586909 )
      ( !STACK ?auto_586908 ?auto_586907 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_586950 - BLOCK
      ?auto_586951 - BLOCK
      ?auto_586952 - BLOCK
      ?auto_586953 - BLOCK
      ?auto_586954 - BLOCK
      ?auto_586955 - BLOCK
      ?auto_586956 - BLOCK
      ?auto_586957 - BLOCK
      ?auto_586958 - BLOCK
      ?auto_586959 - BLOCK
      ?auto_586960 - BLOCK
      ?auto_586961 - BLOCK
      ?auto_586962 - BLOCK
    )
    :vars
    (
      ?auto_586963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_586962 ?auto_586963 ) ( ON-TABLE ?auto_586950 ) ( ON ?auto_586951 ?auto_586950 ) ( ON ?auto_586952 ?auto_586951 ) ( ON ?auto_586953 ?auto_586952 ) ( ON ?auto_586954 ?auto_586953 ) ( ON ?auto_586955 ?auto_586954 ) ( ON ?auto_586956 ?auto_586955 ) ( ON ?auto_586957 ?auto_586956 ) ( ON ?auto_586958 ?auto_586957 ) ( ON ?auto_586959 ?auto_586958 ) ( ON ?auto_586960 ?auto_586959 ) ( not ( = ?auto_586950 ?auto_586951 ) ) ( not ( = ?auto_586950 ?auto_586952 ) ) ( not ( = ?auto_586950 ?auto_586953 ) ) ( not ( = ?auto_586950 ?auto_586954 ) ) ( not ( = ?auto_586950 ?auto_586955 ) ) ( not ( = ?auto_586950 ?auto_586956 ) ) ( not ( = ?auto_586950 ?auto_586957 ) ) ( not ( = ?auto_586950 ?auto_586958 ) ) ( not ( = ?auto_586950 ?auto_586959 ) ) ( not ( = ?auto_586950 ?auto_586960 ) ) ( not ( = ?auto_586950 ?auto_586961 ) ) ( not ( = ?auto_586950 ?auto_586962 ) ) ( not ( = ?auto_586950 ?auto_586963 ) ) ( not ( = ?auto_586951 ?auto_586952 ) ) ( not ( = ?auto_586951 ?auto_586953 ) ) ( not ( = ?auto_586951 ?auto_586954 ) ) ( not ( = ?auto_586951 ?auto_586955 ) ) ( not ( = ?auto_586951 ?auto_586956 ) ) ( not ( = ?auto_586951 ?auto_586957 ) ) ( not ( = ?auto_586951 ?auto_586958 ) ) ( not ( = ?auto_586951 ?auto_586959 ) ) ( not ( = ?auto_586951 ?auto_586960 ) ) ( not ( = ?auto_586951 ?auto_586961 ) ) ( not ( = ?auto_586951 ?auto_586962 ) ) ( not ( = ?auto_586951 ?auto_586963 ) ) ( not ( = ?auto_586952 ?auto_586953 ) ) ( not ( = ?auto_586952 ?auto_586954 ) ) ( not ( = ?auto_586952 ?auto_586955 ) ) ( not ( = ?auto_586952 ?auto_586956 ) ) ( not ( = ?auto_586952 ?auto_586957 ) ) ( not ( = ?auto_586952 ?auto_586958 ) ) ( not ( = ?auto_586952 ?auto_586959 ) ) ( not ( = ?auto_586952 ?auto_586960 ) ) ( not ( = ?auto_586952 ?auto_586961 ) ) ( not ( = ?auto_586952 ?auto_586962 ) ) ( not ( = ?auto_586952 ?auto_586963 ) ) ( not ( = ?auto_586953 ?auto_586954 ) ) ( not ( = ?auto_586953 ?auto_586955 ) ) ( not ( = ?auto_586953 ?auto_586956 ) ) ( not ( = ?auto_586953 ?auto_586957 ) ) ( not ( = ?auto_586953 ?auto_586958 ) ) ( not ( = ?auto_586953 ?auto_586959 ) ) ( not ( = ?auto_586953 ?auto_586960 ) ) ( not ( = ?auto_586953 ?auto_586961 ) ) ( not ( = ?auto_586953 ?auto_586962 ) ) ( not ( = ?auto_586953 ?auto_586963 ) ) ( not ( = ?auto_586954 ?auto_586955 ) ) ( not ( = ?auto_586954 ?auto_586956 ) ) ( not ( = ?auto_586954 ?auto_586957 ) ) ( not ( = ?auto_586954 ?auto_586958 ) ) ( not ( = ?auto_586954 ?auto_586959 ) ) ( not ( = ?auto_586954 ?auto_586960 ) ) ( not ( = ?auto_586954 ?auto_586961 ) ) ( not ( = ?auto_586954 ?auto_586962 ) ) ( not ( = ?auto_586954 ?auto_586963 ) ) ( not ( = ?auto_586955 ?auto_586956 ) ) ( not ( = ?auto_586955 ?auto_586957 ) ) ( not ( = ?auto_586955 ?auto_586958 ) ) ( not ( = ?auto_586955 ?auto_586959 ) ) ( not ( = ?auto_586955 ?auto_586960 ) ) ( not ( = ?auto_586955 ?auto_586961 ) ) ( not ( = ?auto_586955 ?auto_586962 ) ) ( not ( = ?auto_586955 ?auto_586963 ) ) ( not ( = ?auto_586956 ?auto_586957 ) ) ( not ( = ?auto_586956 ?auto_586958 ) ) ( not ( = ?auto_586956 ?auto_586959 ) ) ( not ( = ?auto_586956 ?auto_586960 ) ) ( not ( = ?auto_586956 ?auto_586961 ) ) ( not ( = ?auto_586956 ?auto_586962 ) ) ( not ( = ?auto_586956 ?auto_586963 ) ) ( not ( = ?auto_586957 ?auto_586958 ) ) ( not ( = ?auto_586957 ?auto_586959 ) ) ( not ( = ?auto_586957 ?auto_586960 ) ) ( not ( = ?auto_586957 ?auto_586961 ) ) ( not ( = ?auto_586957 ?auto_586962 ) ) ( not ( = ?auto_586957 ?auto_586963 ) ) ( not ( = ?auto_586958 ?auto_586959 ) ) ( not ( = ?auto_586958 ?auto_586960 ) ) ( not ( = ?auto_586958 ?auto_586961 ) ) ( not ( = ?auto_586958 ?auto_586962 ) ) ( not ( = ?auto_586958 ?auto_586963 ) ) ( not ( = ?auto_586959 ?auto_586960 ) ) ( not ( = ?auto_586959 ?auto_586961 ) ) ( not ( = ?auto_586959 ?auto_586962 ) ) ( not ( = ?auto_586959 ?auto_586963 ) ) ( not ( = ?auto_586960 ?auto_586961 ) ) ( not ( = ?auto_586960 ?auto_586962 ) ) ( not ( = ?auto_586960 ?auto_586963 ) ) ( not ( = ?auto_586961 ?auto_586962 ) ) ( not ( = ?auto_586961 ?auto_586963 ) ) ( not ( = ?auto_586962 ?auto_586963 ) ) ( CLEAR ?auto_586960 ) ( ON ?auto_586961 ?auto_586962 ) ( CLEAR ?auto_586961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_586950 ?auto_586951 ?auto_586952 ?auto_586953 ?auto_586954 ?auto_586955 ?auto_586956 ?auto_586957 ?auto_586958 ?auto_586959 ?auto_586960 ?auto_586961 )
      ( MAKE-13PILE ?auto_586950 ?auto_586951 ?auto_586952 ?auto_586953 ?auto_586954 ?auto_586955 ?auto_586956 ?auto_586957 ?auto_586958 ?auto_586959 ?auto_586960 ?auto_586961 ?auto_586962 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_587004 - BLOCK
      ?auto_587005 - BLOCK
      ?auto_587006 - BLOCK
      ?auto_587007 - BLOCK
      ?auto_587008 - BLOCK
      ?auto_587009 - BLOCK
      ?auto_587010 - BLOCK
      ?auto_587011 - BLOCK
      ?auto_587012 - BLOCK
      ?auto_587013 - BLOCK
      ?auto_587014 - BLOCK
      ?auto_587015 - BLOCK
      ?auto_587016 - BLOCK
    )
    :vars
    (
      ?auto_587017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587016 ?auto_587017 ) ( ON-TABLE ?auto_587004 ) ( ON ?auto_587005 ?auto_587004 ) ( ON ?auto_587006 ?auto_587005 ) ( ON ?auto_587007 ?auto_587006 ) ( ON ?auto_587008 ?auto_587007 ) ( ON ?auto_587009 ?auto_587008 ) ( ON ?auto_587010 ?auto_587009 ) ( ON ?auto_587011 ?auto_587010 ) ( ON ?auto_587012 ?auto_587011 ) ( ON ?auto_587013 ?auto_587012 ) ( not ( = ?auto_587004 ?auto_587005 ) ) ( not ( = ?auto_587004 ?auto_587006 ) ) ( not ( = ?auto_587004 ?auto_587007 ) ) ( not ( = ?auto_587004 ?auto_587008 ) ) ( not ( = ?auto_587004 ?auto_587009 ) ) ( not ( = ?auto_587004 ?auto_587010 ) ) ( not ( = ?auto_587004 ?auto_587011 ) ) ( not ( = ?auto_587004 ?auto_587012 ) ) ( not ( = ?auto_587004 ?auto_587013 ) ) ( not ( = ?auto_587004 ?auto_587014 ) ) ( not ( = ?auto_587004 ?auto_587015 ) ) ( not ( = ?auto_587004 ?auto_587016 ) ) ( not ( = ?auto_587004 ?auto_587017 ) ) ( not ( = ?auto_587005 ?auto_587006 ) ) ( not ( = ?auto_587005 ?auto_587007 ) ) ( not ( = ?auto_587005 ?auto_587008 ) ) ( not ( = ?auto_587005 ?auto_587009 ) ) ( not ( = ?auto_587005 ?auto_587010 ) ) ( not ( = ?auto_587005 ?auto_587011 ) ) ( not ( = ?auto_587005 ?auto_587012 ) ) ( not ( = ?auto_587005 ?auto_587013 ) ) ( not ( = ?auto_587005 ?auto_587014 ) ) ( not ( = ?auto_587005 ?auto_587015 ) ) ( not ( = ?auto_587005 ?auto_587016 ) ) ( not ( = ?auto_587005 ?auto_587017 ) ) ( not ( = ?auto_587006 ?auto_587007 ) ) ( not ( = ?auto_587006 ?auto_587008 ) ) ( not ( = ?auto_587006 ?auto_587009 ) ) ( not ( = ?auto_587006 ?auto_587010 ) ) ( not ( = ?auto_587006 ?auto_587011 ) ) ( not ( = ?auto_587006 ?auto_587012 ) ) ( not ( = ?auto_587006 ?auto_587013 ) ) ( not ( = ?auto_587006 ?auto_587014 ) ) ( not ( = ?auto_587006 ?auto_587015 ) ) ( not ( = ?auto_587006 ?auto_587016 ) ) ( not ( = ?auto_587006 ?auto_587017 ) ) ( not ( = ?auto_587007 ?auto_587008 ) ) ( not ( = ?auto_587007 ?auto_587009 ) ) ( not ( = ?auto_587007 ?auto_587010 ) ) ( not ( = ?auto_587007 ?auto_587011 ) ) ( not ( = ?auto_587007 ?auto_587012 ) ) ( not ( = ?auto_587007 ?auto_587013 ) ) ( not ( = ?auto_587007 ?auto_587014 ) ) ( not ( = ?auto_587007 ?auto_587015 ) ) ( not ( = ?auto_587007 ?auto_587016 ) ) ( not ( = ?auto_587007 ?auto_587017 ) ) ( not ( = ?auto_587008 ?auto_587009 ) ) ( not ( = ?auto_587008 ?auto_587010 ) ) ( not ( = ?auto_587008 ?auto_587011 ) ) ( not ( = ?auto_587008 ?auto_587012 ) ) ( not ( = ?auto_587008 ?auto_587013 ) ) ( not ( = ?auto_587008 ?auto_587014 ) ) ( not ( = ?auto_587008 ?auto_587015 ) ) ( not ( = ?auto_587008 ?auto_587016 ) ) ( not ( = ?auto_587008 ?auto_587017 ) ) ( not ( = ?auto_587009 ?auto_587010 ) ) ( not ( = ?auto_587009 ?auto_587011 ) ) ( not ( = ?auto_587009 ?auto_587012 ) ) ( not ( = ?auto_587009 ?auto_587013 ) ) ( not ( = ?auto_587009 ?auto_587014 ) ) ( not ( = ?auto_587009 ?auto_587015 ) ) ( not ( = ?auto_587009 ?auto_587016 ) ) ( not ( = ?auto_587009 ?auto_587017 ) ) ( not ( = ?auto_587010 ?auto_587011 ) ) ( not ( = ?auto_587010 ?auto_587012 ) ) ( not ( = ?auto_587010 ?auto_587013 ) ) ( not ( = ?auto_587010 ?auto_587014 ) ) ( not ( = ?auto_587010 ?auto_587015 ) ) ( not ( = ?auto_587010 ?auto_587016 ) ) ( not ( = ?auto_587010 ?auto_587017 ) ) ( not ( = ?auto_587011 ?auto_587012 ) ) ( not ( = ?auto_587011 ?auto_587013 ) ) ( not ( = ?auto_587011 ?auto_587014 ) ) ( not ( = ?auto_587011 ?auto_587015 ) ) ( not ( = ?auto_587011 ?auto_587016 ) ) ( not ( = ?auto_587011 ?auto_587017 ) ) ( not ( = ?auto_587012 ?auto_587013 ) ) ( not ( = ?auto_587012 ?auto_587014 ) ) ( not ( = ?auto_587012 ?auto_587015 ) ) ( not ( = ?auto_587012 ?auto_587016 ) ) ( not ( = ?auto_587012 ?auto_587017 ) ) ( not ( = ?auto_587013 ?auto_587014 ) ) ( not ( = ?auto_587013 ?auto_587015 ) ) ( not ( = ?auto_587013 ?auto_587016 ) ) ( not ( = ?auto_587013 ?auto_587017 ) ) ( not ( = ?auto_587014 ?auto_587015 ) ) ( not ( = ?auto_587014 ?auto_587016 ) ) ( not ( = ?auto_587014 ?auto_587017 ) ) ( not ( = ?auto_587015 ?auto_587016 ) ) ( not ( = ?auto_587015 ?auto_587017 ) ) ( not ( = ?auto_587016 ?auto_587017 ) ) ( ON ?auto_587015 ?auto_587016 ) ( CLEAR ?auto_587013 ) ( ON ?auto_587014 ?auto_587015 ) ( CLEAR ?auto_587014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_587004 ?auto_587005 ?auto_587006 ?auto_587007 ?auto_587008 ?auto_587009 ?auto_587010 ?auto_587011 ?auto_587012 ?auto_587013 ?auto_587014 )
      ( MAKE-13PILE ?auto_587004 ?auto_587005 ?auto_587006 ?auto_587007 ?auto_587008 ?auto_587009 ?auto_587010 ?auto_587011 ?auto_587012 ?auto_587013 ?auto_587014 ?auto_587015 ?auto_587016 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_587058 - BLOCK
      ?auto_587059 - BLOCK
      ?auto_587060 - BLOCK
      ?auto_587061 - BLOCK
      ?auto_587062 - BLOCK
      ?auto_587063 - BLOCK
      ?auto_587064 - BLOCK
      ?auto_587065 - BLOCK
      ?auto_587066 - BLOCK
      ?auto_587067 - BLOCK
      ?auto_587068 - BLOCK
      ?auto_587069 - BLOCK
      ?auto_587070 - BLOCK
    )
    :vars
    (
      ?auto_587071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587070 ?auto_587071 ) ( ON-TABLE ?auto_587058 ) ( ON ?auto_587059 ?auto_587058 ) ( ON ?auto_587060 ?auto_587059 ) ( ON ?auto_587061 ?auto_587060 ) ( ON ?auto_587062 ?auto_587061 ) ( ON ?auto_587063 ?auto_587062 ) ( ON ?auto_587064 ?auto_587063 ) ( ON ?auto_587065 ?auto_587064 ) ( ON ?auto_587066 ?auto_587065 ) ( not ( = ?auto_587058 ?auto_587059 ) ) ( not ( = ?auto_587058 ?auto_587060 ) ) ( not ( = ?auto_587058 ?auto_587061 ) ) ( not ( = ?auto_587058 ?auto_587062 ) ) ( not ( = ?auto_587058 ?auto_587063 ) ) ( not ( = ?auto_587058 ?auto_587064 ) ) ( not ( = ?auto_587058 ?auto_587065 ) ) ( not ( = ?auto_587058 ?auto_587066 ) ) ( not ( = ?auto_587058 ?auto_587067 ) ) ( not ( = ?auto_587058 ?auto_587068 ) ) ( not ( = ?auto_587058 ?auto_587069 ) ) ( not ( = ?auto_587058 ?auto_587070 ) ) ( not ( = ?auto_587058 ?auto_587071 ) ) ( not ( = ?auto_587059 ?auto_587060 ) ) ( not ( = ?auto_587059 ?auto_587061 ) ) ( not ( = ?auto_587059 ?auto_587062 ) ) ( not ( = ?auto_587059 ?auto_587063 ) ) ( not ( = ?auto_587059 ?auto_587064 ) ) ( not ( = ?auto_587059 ?auto_587065 ) ) ( not ( = ?auto_587059 ?auto_587066 ) ) ( not ( = ?auto_587059 ?auto_587067 ) ) ( not ( = ?auto_587059 ?auto_587068 ) ) ( not ( = ?auto_587059 ?auto_587069 ) ) ( not ( = ?auto_587059 ?auto_587070 ) ) ( not ( = ?auto_587059 ?auto_587071 ) ) ( not ( = ?auto_587060 ?auto_587061 ) ) ( not ( = ?auto_587060 ?auto_587062 ) ) ( not ( = ?auto_587060 ?auto_587063 ) ) ( not ( = ?auto_587060 ?auto_587064 ) ) ( not ( = ?auto_587060 ?auto_587065 ) ) ( not ( = ?auto_587060 ?auto_587066 ) ) ( not ( = ?auto_587060 ?auto_587067 ) ) ( not ( = ?auto_587060 ?auto_587068 ) ) ( not ( = ?auto_587060 ?auto_587069 ) ) ( not ( = ?auto_587060 ?auto_587070 ) ) ( not ( = ?auto_587060 ?auto_587071 ) ) ( not ( = ?auto_587061 ?auto_587062 ) ) ( not ( = ?auto_587061 ?auto_587063 ) ) ( not ( = ?auto_587061 ?auto_587064 ) ) ( not ( = ?auto_587061 ?auto_587065 ) ) ( not ( = ?auto_587061 ?auto_587066 ) ) ( not ( = ?auto_587061 ?auto_587067 ) ) ( not ( = ?auto_587061 ?auto_587068 ) ) ( not ( = ?auto_587061 ?auto_587069 ) ) ( not ( = ?auto_587061 ?auto_587070 ) ) ( not ( = ?auto_587061 ?auto_587071 ) ) ( not ( = ?auto_587062 ?auto_587063 ) ) ( not ( = ?auto_587062 ?auto_587064 ) ) ( not ( = ?auto_587062 ?auto_587065 ) ) ( not ( = ?auto_587062 ?auto_587066 ) ) ( not ( = ?auto_587062 ?auto_587067 ) ) ( not ( = ?auto_587062 ?auto_587068 ) ) ( not ( = ?auto_587062 ?auto_587069 ) ) ( not ( = ?auto_587062 ?auto_587070 ) ) ( not ( = ?auto_587062 ?auto_587071 ) ) ( not ( = ?auto_587063 ?auto_587064 ) ) ( not ( = ?auto_587063 ?auto_587065 ) ) ( not ( = ?auto_587063 ?auto_587066 ) ) ( not ( = ?auto_587063 ?auto_587067 ) ) ( not ( = ?auto_587063 ?auto_587068 ) ) ( not ( = ?auto_587063 ?auto_587069 ) ) ( not ( = ?auto_587063 ?auto_587070 ) ) ( not ( = ?auto_587063 ?auto_587071 ) ) ( not ( = ?auto_587064 ?auto_587065 ) ) ( not ( = ?auto_587064 ?auto_587066 ) ) ( not ( = ?auto_587064 ?auto_587067 ) ) ( not ( = ?auto_587064 ?auto_587068 ) ) ( not ( = ?auto_587064 ?auto_587069 ) ) ( not ( = ?auto_587064 ?auto_587070 ) ) ( not ( = ?auto_587064 ?auto_587071 ) ) ( not ( = ?auto_587065 ?auto_587066 ) ) ( not ( = ?auto_587065 ?auto_587067 ) ) ( not ( = ?auto_587065 ?auto_587068 ) ) ( not ( = ?auto_587065 ?auto_587069 ) ) ( not ( = ?auto_587065 ?auto_587070 ) ) ( not ( = ?auto_587065 ?auto_587071 ) ) ( not ( = ?auto_587066 ?auto_587067 ) ) ( not ( = ?auto_587066 ?auto_587068 ) ) ( not ( = ?auto_587066 ?auto_587069 ) ) ( not ( = ?auto_587066 ?auto_587070 ) ) ( not ( = ?auto_587066 ?auto_587071 ) ) ( not ( = ?auto_587067 ?auto_587068 ) ) ( not ( = ?auto_587067 ?auto_587069 ) ) ( not ( = ?auto_587067 ?auto_587070 ) ) ( not ( = ?auto_587067 ?auto_587071 ) ) ( not ( = ?auto_587068 ?auto_587069 ) ) ( not ( = ?auto_587068 ?auto_587070 ) ) ( not ( = ?auto_587068 ?auto_587071 ) ) ( not ( = ?auto_587069 ?auto_587070 ) ) ( not ( = ?auto_587069 ?auto_587071 ) ) ( not ( = ?auto_587070 ?auto_587071 ) ) ( ON ?auto_587069 ?auto_587070 ) ( ON ?auto_587068 ?auto_587069 ) ( CLEAR ?auto_587066 ) ( ON ?auto_587067 ?auto_587068 ) ( CLEAR ?auto_587067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_587058 ?auto_587059 ?auto_587060 ?auto_587061 ?auto_587062 ?auto_587063 ?auto_587064 ?auto_587065 ?auto_587066 ?auto_587067 )
      ( MAKE-13PILE ?auto_587058 ?auto_587059 ?auto_587060 ?auto_587061 ?auto_587062 ?auto_587063 ?auto_587064 ?auto_587065 ?auto_587066 ?auto_587067 ?auto_587068 ?auto_587069 ?auto_587070 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_587112 - BLOCK
      ?auto_587113 - BLOCK
      ?auto_587114 - BLOCK
      ?auto_587115 - BLOCK
      ?auto_587116 - BLOCK
      ?auto_587117 - BLOCK
      ?auto_587118 - BLOCK
      ?auto_587119 - BLOCK
      ?auto_587120 - BLOCK
      ?auto_587121 - BLOCK
      ?auto_587122 - BLOCK
      ?auto_587123 - BLOCK
      ?auto_587124 - BLOCK
    )
    :vars
    (
      ?auto_587125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587124 ?auto_587125 ) ( ON-TABLE ?auto_587112 ) ( ON ?auto_587113 ?auto_587112 ) ( ON ?auto_587114 ?auto_587113 ) ( ON ?auto_587115 ?auto_587114 ) ( ON ?auto_587116 ?auto_587115 ) ( ON ?auto_587117 ?auto_587116 ) ( ON ?auto_587118 ?auto_587117 ) ( ON ?auto_587119 ?auto_587118 ) ( not ( = ?auto_587112 ?auto_587113 ) ) ( not ( = ?auto_587112 ?auto_587114 ) ) ( not ( = ?auto_587112 ?auto_587115 ) ) ( not ( = ?auto_587112 ?auto_587116 ) ) ( not ( = ?auto_587112 ?auto_587117 ) ) ( not ( = ?auto_587112 ?auto_587118 ) ) ( not ( = ?auto_587112 ?auto_587119 ) ) ( not ( = ?auto_587112 ?auto_587120 ) ) ( not ( = ?auto_587112 ?auto_587121 ) ) ( not ( = ?auto_587112 ?auto_587122 ) ) ( not ( = ?auto_587112 ?auto_587123 ) ) ( not ( = ?auto_587112 ?auto_587124 ) ) ( not ( = ?auto_587112 ?auto_587125 ) ) ( not ( = ?auto_587113 ?auto_587114 ) ) ( not ( = ?auto_587113 ?auto_587115 ) ) ( not ( = ?auto_587113 ?auto_587116 ) ) ( not ( = ?auto_587113 ?auto_587117 ) ) ( not ( = ?auto_587113 ?auto_587118 ) ) ( not ( = ?auto_587113 ?auto_587119 ) ) ( not ( = ?auto_587113 ?auto_587120 ) ) ( not ( = ?auto_587113 ?auto_587121 ) ) ( not ( = ?auto_587113 ?auto_587122 ) ) ( not ( = ?auto_587113 ?auto_587123 ) ) ( not ( = ?auto_587113 ?auto_587124 ) ) ( not ( = ?auto_587113 ?auto_587125 ) ) ( not ( = ?auto_587114 ?auto_587115 ) ) ( not ( = ?auto_587114 ?auto_587116 ) ) ( not ( = ?auto_587114 ?auto_587117 ) ) ( not ( = ?auto_587114 ?auto_587118 ) ) ( not ( = ?auto_587114 ?auto_587119 ) ) ( not ( = ?auto_587114 ?auto_587120 ) ) ( not ( = ?auto_587114 ?auto_587121 ) ) ( not ( = ?auto_587114 ?auto_587122 ) ) ( not ( = ?auto_587114 ?auto_587123 ) ) ( not ( = ?auto_587114 ?auto_587124 ) ) ( not ( = ?auto_587114 ?auto_587125 ) ) ( not ( = ?auto_587115 ?auto_587116 ) ) ( not ( = ?auto_587115 ?auto_587117 ) ) ( not ( = ?auto_587115 ?auto_587118 ) ) ( not ( = ?auto_587115 ?auto_587119 ) ) ( not ( = ?auto_587115 ?auto_587120 ) ) ( not ( = ?auto_587115 ?auto_587121 ) ) ( not ( = ?auto_587115 ?auto_587122 ) ) ( not ( = ?auto_587115 ?auto_587123 ) ) ( not ( = ?auto_587115 ?auto_587124 ) ) ( not ( = ?auto_587115 ?auto_587125 ) ) ( not ( = ?auto_587116 ?auto_587117 ) ) ( not ( = ?auto_587116 ?auto_587118 ) ) ( not ( = ?auto_587116 ?auto_587119 ) ) ( not ( = ?auto_587116 ?auto_587120 ) ) ( not ( = ?auto_587116 ?auto_587121 ) ) ( not ( = ?auto_587116 ?auto_587122 ) ) ( not ( = ?auto_587116 ?auto_587123 ) ) ( not ( = ?auto_587116 ?auto_587124 ) ) ( not ( = ?auto_587116 ?auto_587125 ) ) ( not ( = ?auto_587117 ?auto_587118 ) ) ( not ( = ?auto_587117 ?auto_587119 ) ) ( not ( = ?auto_587117 ?auto_587120 ) ) ( not ( = ?auto_587117 ?auto_587121 ) ) ( not ( = ?auto_587117 ?auto_587122 ) ) ( not ( = ?auto_587117 ?auto_587123 ) ) ( not ( = ?auto_587117 ?auto_587124 ) ) ( not ( = ?auto_587117 ?auto_587125 ) ) ( not ( = ?auto_587118 ?auto_587119 ) ) ( not ( = ?auto_587118 ?auto_587120 ) ) ( not ( = ?auto_587118 ?auto_587121 ) ) ( not ( = ?auto_587118 ?auto_587122 ) ) ( not ( = ?auto_587118 ?auto_587123 ) ) ( not ( = ?auto_587118 ?auto_587124 ) ) ( not ( = ?auto_587118 ?auto_587125 ) ) ( not ( = ?auto_587119 ?auto_587120 ) ) ( not ( = ?auto_587119 ?auto_587121 ) ) ( not ( = ?auto_587119 ?auto_587122 ) ) ( not ( = ?auto_587119 ?auto_587123 ) ) ( not ( = ?auto_587119 ?auto_587124 ) ) ( not ( = ?auto_587119 ?auto_587125 ) ) ( not ( = ?auto_587120 ?auto_587121 ) ) ( not ( = ?auto_587120 ?auto_587122 ) ) ( not ( = ?auto_587120 ?auto_587123 ) ) ( not ( = ?auto_587120 ?auto_587124 ) ) ( not ( = ?auto_587120 ?auto_587125 ) ) ( not ( = ?auto_587121 ?auto_587122 ) ) ( not ( = ?auto_587121 ?auto_587123 ) ) ( not ( = ?auto_587121 ?auto_587124 ) ) ( not ( = ?auto_587121 ?auto_587125 ) ) ( not ( = ?auto_587122 ?auto_587123 ) ) ( not ( = ?auto_587122 ?auto_587124 ) ) ( not ( = ?auto_587122 ?auto_587125 ) ) ( not ( = ?auto_587123 ?auto_587124 ) ) ( not ( = ?auto_587123 ?auto_587125 ) ) ( not ( = ?auto_587124 ?auto_587125 ) ) ( ON ?auto_587123 ?auto_587124 ) ( ON ?auto_587122 ?auto_587123 ) ( ON ?auto_587121 ?auto_587122 ) ( CLEAR ?auto_587119 ) ( ON ?auto_587120 ?auto_587121 ) ( CLEAR ?auto_587120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_587112 ?auto_587113 ?auto_587114 ?auto_587115 ?auto_587116 ?auto_587117 ?auto_587118 ?auto_587119 ?auto_587120 )
      ( MAKE-13PILE ?auto_587112 ?auto_587113 ?auto_587114 ?auto_587115 ?auto_587116 ?auto_587117 ?auto_587118 ?auto_587119 ?auto_587120 ?auto_587121 ?auto_587122 ?auto_587123 ?auto_587124 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_587166 - BLOCK
      ?auto_587167 - BLOCK
      ?auto_587168 - BLOCK
      ?auto_587169 - BLOCK
      ?auto_587170 - BLOCK
      ?auto_587171 - BLOCK
      ?auto_587172 - BLOCK
      ?auto_587173 - BLOCK
      ?auto_587174 - BLOCK
      ?auto_587175 - BLOCK
      ?auto_587176 - BLOCK
      ?auto_587177 - BLOCK
      ?auto_587178 - BLOCK
    )
    :vars
    (
      ?auto_587179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587178 ?auto_587179 ) ( ON-TABLE ?auto_587166 ) ( ON ?auto_587167 ?auto_587166 ) ( ON ?auto_587168 ?auto_587167 ) ( ON ?auto_587169 ?auto_587168 ) ( ON ?auto_587170 ?auto_587169 ) ( ON ?auto_587171 ?auto_587170 ) ( ON ?auto_587172 ?auto_587171 ) ( not ( = ?auto_587166 ?auto_587167 ) ) ( not ( = ?auto_587166 ?auto_587168 ) ) ( not ( = ?auto_587166 ?auto_587169 ) ) ( not ( = ?auto_587166 ?auto_587170 ) ) ( not ( = ?auto_587166 ?auto_587171 ) ) ( not ( = ?auto_587166 ?auto_587172 ) ) ( not ( = ?auto_587166 ?auto_587173 ) ) ( not ( = ?auto_587166 ?auto_587174 ) ) ( not ( = ?auto_587166 ?auto_587175 ) ) ( not ( = ?auto_587166 ?auto_587176 ) ) ( not ( = ?auto_587166 ?auto_587177 ) ) ( not ( = ?auto_587166 ?auto_587178 ) ) ( not ( = ?auto_587166 ?auto_587179 ) ) ( not ( = ?auto_587167 ?auto_587168 ) ) ( not ( = ?auto_587167 ?auto_587169 ) ) ( not ( = ?auto_587167 ?auto_587170 ) ) ( not ( = ?auto_587167 ?auto_587171 ) ) ( not ( = ?auto_587167 ?auto_587172 ) ) ( not ( = ?auto_587167 ?auto_587173 ) ) ( not ( = ?auto_587167 ?auto_587174 ) ) ( not ( = ?auto_587167 ?auto_587175 ) ) ( not ( = ?auto_587167 ?auto_587176 ) ) ( not ( = ?auto_587167 ?auto_587177 ) ) ( not ( = ?auto_587167 ?auto_587178 ) ) ( not ( = ?auto_587167 ?auto_587179 ) ) ( not ( = ?auto_587168 ?auto_587169 ) ) ( not ( = ?auto_587168 ?auto_587170 ) ) ( not ( = ?auto_587168 ?auto_587171 ) ) ( not ( = ?auto_587168 ?auto_587172 ) ) ( not ( = ?auto_587168 ?auto_587173 ) ) ( not ( = ?auto_587168 ?auto_587174 ) ) ( not ( = ?auto_587168 ?auto_587175 ) ) ( not ( = ?auto_587168 ?auto_587176 ) ) ( not ( = ?auto_587168 ?auto_587177 ) ) ( not ( = ?auto_587168 ?auto_587178 ) ) ( not ( = ?auto_587168 ?auto_587179 ) ) ( not ( = ?auto_587169 ?auto_587170 ) ) ( not ( = ?auto_587169 ?auto_587171 ) ) ( not ( = ?auto_587169 ?auto_587172 ) ) ( not ( = ?auto_587169 ?auto_587173 ) ) ( not ( = ?auto_587169 ?auto_587174 ) ) ( not ( = ?auto_587169 ?auto_587175 ) ) ( not ( = ?auto_587169 ?auto_587176 ) ) ( not ( = ?auto_587169 ?auto_587177 ) ) ( not ( = ?auto_587169 ?auto_587178 ) ) ( not ( = ?auto_587169 ?auto_587179 ) ) ( not ( = ?auto_587170 ?auto_587171 ) ) ( not ( = ?auto_587170 ?auto_587172 ) ) ( not ( = ?auto_587170 ?auto_587173 ) ) ( not ( = ?auto_587170 ?auto_587174 ) ) ( not ( = ?auto_587170 ?auto_587175 ) ) ( not ( = ?auto_587170 ?auto_587176 ) ) ( not ( = ?auto_587170 ?auto_587177 ) ) ( not ( = ?auto_587170 ?auto_587178 ) ) ( not ( = ?auto_587170 ?auto_587179 ) ) ( not ( = ?auto_587171 ?auto_587172 ) ) ( not ( = ?auto_587171 ?auto_587173 ) ) ( not ( = ?auto_587171 ?auto_587174 ) ) ( not ( = ?auto_587171 ?auto_587175 ) ) ( not ( = ?auto_587171 ?auto_587176 ) ) ( not ( = ?auto_587171 ?auto_587177 ) ) ( not ( = ?auto_587171 ?auto_587178 ) ) ( not ( = ?auto_587171 ?auto_587179 ) ) ( not ( = ?auto_587172 ?auto_587173 ) ) ( not ( = ?auto_587172 ?auto_587174 ) ) ( not ( = ?auto_587172 ?auto_587175 ) ) ( not ( = ?auto_587172 ?auto_587176 ) ) ( not ( = ?auto_587172 ?auto_587177 ) ) ( not ( = ?auto_587172 ?auto_587178 ) ) ( not ( = ?auto_587172 ?auto_587179 ) ) ( not ( = ?auto_587173 ?auto_587174 ) ) ( not ( = ?auto_587173 ?auto_587175 ) ) ( not ( = ?auto_587173 ?auto_587176 ) ) ( not ( = ?auto_587173 ?auto_587177 ) ) ( not ( = ?auto_587173 ?auto_587178 ) ) ( not ( = ?auto_587173 ?auto_587179 ) ) ( not ( = ?auto_587174 ?auto_587175 ) ) ( not ( = ?auto_587174 ?auto_587176 ) ) ( not ( = ?auto_587174 ?auto_587177 ) ) ( not ( = ?auto_587174 ?auto_587178 ) ) ( not ( = ?auto_587174 ?auto_587179 ) ) ( not ( = ?auto_587175 ?auto_587176 ) ) ( not ( = ?auto_587175 ?auto_587177 ) ) ( not ( = ?auto_587175 ?auto_587178 ) ) ( not ( = ?auto_587175 ?auto_587179 ) ) ( not ( = ?auto_587176 ?auto_587177 ) ) ( not ( = ?auto_587176 ?auto_587178 ) ) ( not ( = ?auto_587176 ?auto_587179 ) ) ( not ( = ?auto_587177 ?auto_587178 ) ) ( not ( = ?auto_587177 ?auto_587179 ) ) ( not ( = ?auto_587178 ?auto_587179 ) ) ( ON ?auto_587177 ?auto_587178 ) ( ON ?auto_587176 ?auto_587177 ) ( ON ?auto_587175 ?auto_587176 ) ( ON ?auto_587174 ?auto_587175 ) ( CLEAR ?auto_587172 ) ( ON ?auto_587173 ?auto_587174 ) ( CLEAR ?auto_587173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_587166 ?auto_587167 ?auto_587168 ?auto_587169 ?auto_587170 ?auto_587171 ?auto_587172 ?auto_587173 )
      ( MAKE-13PILE ?auto_587166 ?auto_587167 ?auto_587168 ?auto_587169 ?auto_587170 ?auto_587171 ?auto_587172 ?auto_587173 ?auto_587174 ?auto_587175 ?auto_587176 ?auto_587177 ?auto_587178 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_587220 - BLOCK
      ?auto_587221 - BLOCK
      ?auto_587222 - BLOCK
      ?auto_587223 - BLOCK
      ?auto_587224 - BLOCK
      ?auto_587225 - BLOCK
      ?auto_587226 - BLOCK
      ?auto_587227 - BLOCK
      ?auto_587228 - BLOCK
      ?auto_587229 - BLOCK
      ?auto_587230 - BLOCK
      ?auto_587231 - BLOCK
      ?auto_587232 - BLOCK
    )
    :vars
    (
      ?auto_587233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587232 ?auto_587233 ) ( ON-TABLE ?auto_587220 ) ( ON ?auto_587221 ?auto_587220 ) ( ON ?auto_587222 ?auto_587221 ) ( ON ?auto_587223 ?auto_587222 ) ( ON ?auto_587224 ?auto_587223 ) ( ON ?auto_587225 ?auto_587224 ) ( not ( = ?auto_587220 ?auto_587221 ) ) ( not ( = ?auto_587220 ?auto_587222 ) ) ( not ( = ?auto_587220 ?auto_587223 ) ) ( not ( = ?auto_587220 ?auto_587224 ) ) ( not ( = ?auto_587220 ?auto_587225 ) ) ( not ( = ?auto_587220 ?auto_587226 ) ) ( not ( = ?auto_587220 ?auto_587227 ) ) ( not ( = ?auto_587220 ?auto_587228 ) ) ( not ( = ?auto_587220 ?auto_587229 ) ) ( not ( = ?auto_587220 ?auto_587230 ) ) ( not ( = ?auto_587220 ?auto_587231 ) ) ( not ( = ?auto_587220 ?auto_587232 ) ) ( not ( = ?auto_587220 ?auto_587233 ) ) ( not ( = ?auto_587221 ?auto_587222 ) ) ( not ( = ?auto_587221 ?auto_587223 ) ) ( not ( = ?auto_587221 ?auto_587224 ) ) ( not ( = ?auto_587221 ?auto_587225 ) ) ( not ( = ?auto_587221 ?auto_587226 ) ) ( not ( = ?auto_587221 ?auto_587227 ) ) ( not ( = ?auto_587221 ?auto_587228 ) ) ( not ( = ?auto_587221 ?auto_587229 ) ) ( not ( = ?auto_587221 ?auto_587230 ) ) ( not ( = ?auto_587221 ?auto_587231 ) ) ( not ( = ?auto_587221 ?auto_587232 ) ) ( not ( = ?auto_587221 ?auto_587233 ) ) ( not ( = ?auto_587222 ?auto_587223 ) ) ( not ( = ?auto_587222 ?auto_587224 ) ) ( not ( = ?auto_587222 ?auto_587225 ) ) ( not ( = ?auto_587222 ?auto_587226 ) ) ( not ( = ?auto_587222 ?auto_587227 ) ) ( not ( = ?auto_587222 ?auto_587228 ) ) ( not ( = ?auto_587222 ?auto_587229 ) ) ( not ( = ?auto_587222 ?auto_587230 ) ) ( not ( = ?auto_587222 ?auto_587231 ) ) ( not ( = ?auto_587222 ?auto_587232 ) ) ( not ( = ?auto_587222 ?auto_587233 ) ) ( not ( = ?auto_587223 ?auto_587224 ) ) ( not ( = ?auto_587223 ?auto_587225 ) ) ( not ( = ?auto_587223 ?auto_587226 ) ) ( not ( = ?auto_587223 ?auto_587227 ) ) ( not ( = ?auto_587223 ?auto_587228 ) ) ( not ( = ?auto_587223 ?auto_587229 ) ) ( not ( = ?auto_587223 ?auto_587230 ) ) ( not ( = ?auto_587223 ?auto_587231 ) ) ( not ( = ?auto_587223 ?auto_587232 ) ) ( not ( = ?auto_587223 ?auto_587233 ) ) ( not ( = ?auto_587224 ?auto_587225 ) ) ( not ( = ?auto_587224 ?auto_587226 ) ) ( not ( = ?auto_587224 ?auto_587227 ) ) ( not ( = ?auto_587224 ?auto_587228 ) ) ( not ( = ?auto_587224 ?auto_587229 ) ) ( not ( = ?auto_587224 ?auto_587230 ) ) ( not ( = ?auto_587224 ?auto_587231 ) ) ( not ( = ?auto_587224 ?auto_587232 ) ) ( not ( = ?auto_587224 ?auto_587233 ) ) ( not ( = ?auto_587225 ?auto_587226 ) ) ( not ( = ?auto_587225 ?auto_587227 ) ) ( not ( = ?auto_587225 ?auto_587228 ) ) ( not ( = ?auto_587225 ?auto_587229 ) ) ( not ( = ?auto_587225 ?auto_587230 ) ) ( not ( = ?auto_587225 ?auto_587231 ) ) ( not ( = ?auto_587225 ?auto_587232 ) ) ( not ( = ?auto_587225 ?auto_587233 ) ) ( not ( = ?auto_587226 ?auto_587227 ) ) ( not ( = ?auto_587226 ?auto_587228 ) ) ( not ( = ?auto_587226 ?auto_587229 ) ) ( not ( = ?auto_587226 ?auto_587230 ) ) ( not ( = ?auto_587226 ?auto_587231 ) ) ( not ( = ?auto_587226 ?auto_587232 ) ) ( not ( = ?auto_587226 ?auto_587233 ) ) ( not ( = ?auto_587227 ?auto_587228 ) ) ( not ( = ?auto_587227 ?auto_587229 ) ) ( not ( = ?auto_587227 ?auto_587230 ) ) ( not ( = ?auto_587227 ?auto_587231 ) ) ( not ( = ?auto_587227 ?auto_587232 ) ) ( not ( = ?auto_587227 ?auto_587233 ) ) ( not ( = ?auto_587228 ?auto_587229 ) ) ( not ( = ?auto_587228 ?auto_587230 ) ) ( not ( = ?auto_587228 ?auto_587231 ) ) ( not ( = ?auto_587228 ?auto_587232 ) ) ( not ( = ?auto_587228 ?auto_587233 ) ) ( not ( = ?auto_587229 ?auto_587230 ) ) ( not ( = ?auto_587229 ?auto_587231 ) ) ( not ( = ?auto_587229 ?auto_587232 ) ) ( not ( = ?auto_587229 ?auto_587233 ) ) ( not ( = ?auto_587230 ?auto_587231 ) ) ( not ( = ?auto_587230 ?auto_587232 ) ) ( not ( = ?auto_587230 ?auto_587233 ) ) ( not ( = ?auto_587231 ?auto_587232 ) ) ( not ( = ?auto_587231 ?auto_587233 ) ) ( not ( = ?auto_587232 ?auto_587233 ) ) ( ON ?auto_587231 ?auto_587232 ) ( ON ?auto_587230 ?auto_587231 ) ( ON ?auto_587229 ?auto_587230 ) ( ON ?auto_587228 ?auto_587229 ) ( ON ?auto_587227 ?auto_587228 ) ( CLEAR ?auto_587225 ) ( ON ?auto_587226 ?auto_587227 ) ( CLEAR ?auto_587226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_587220 ?auto_587221 ?auto_587222 ?auto_587223 ?auto_587224 ?auto_587225 ?auto_587226 )
      ( MAKE-13PILE ?auto_587220 ?auto_587221 ?auto_587222 ?auto_587223 ?auto_587224 ?auto_587225 ?auto_587226 ?auto_587227 ?auto_587228 ?auto_587229 ?auto_587230 ?auto_587231 ?auto_587232 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_587274 - BLOCK
      ?auto_587275 - BLOCK
      ?auto_587276 - BLOCK
      ?auto_587277 - BLOCK
      ?auto_587278 - BLOCK
      ?auto_587279 - BLOCK
      ?auto_587280 - BLOCK
      ?auto_587281 - BLOCK
      ?auto_587282 - BLOCK
      ?auto_587283 - BLOCK
      ?auto_587284 - BLOCK
      ?auto_587285 - BLOCK
      ?auto_587286 - BLOCK
    )
    :vars
    (
      ?auto_587287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587286 ?auto_587287 ) ( ON-TABLE ?auto_587274 ) ( ON ?auto_587275 ?auto_587274 ) ( ON ?auto_587276 ?auto_587275 ) ( ON ?auto_587277 ?auto_587276 ) ( ON ?auto_587278 ?auto_587277 ) ( not ( = ?auto_587274 ?auto_587275 ) ) ( not ( = ?auto_587274 ?auto_587276 ) ) ( not ( = ?auto_587274 ?auto_587277 ) ) ( not ( = ?auto_587274 ?auto_587278 ) ) ( not ( = ?auto_587274 ?auto_587279 ) ) ( not ( = ?auto_587274 ?auto_587280 ) ) ( not ( = ?auto_587274 ?auto_587281 ) ) ( not ( = ?auto_587274 ?auto_587282 ) ) ( not ( = ?auto_587274 ?auto_587283 ) ) ( not ( = ?auto_587274 ?auto_587284 ) ) ( not ( = ?auto_587274 ?auto_587285 ) ) ( not ( = ?auto_587274 ?auto_587286 ) ) ( not ( = ?auto_587274 ?auto_587287 ) ) ( not ( = ?auto_587275 ?auto_587276 ) ) ( not ( = ?auto_587275 ?auto_587277 ) ) ( not ( = ?auto_587275 ?auto_587278 ) ) ( not ( = ?auto_587275 ?auto_587279 ) ) ( not ( = ?auto_587275 ?auto_587280 ) ) ( not ( = ?auto_587275 ?auto_587281 ) ) ( not ( = ?auto_587275 ?auto_587282 ) ) ( not ( = ?auto_587275 ?auto_587283 ) ) ( not ( = ?auto_587275 ?auto_587284 ) ) ( not ( = ?auto_587275 ?auto_587285 ) ) ( not ( = ?auto_587275 ?auto_587286 ) ) ( not ( = ?auto_587275 ?auto_587287 ) ) ( not ( = ?auto_587276 ?auto_587277 ) ) ( not ( = ?auto_587276 ?auto_587278 ) ) ( not ( = ?auto_587276 ?auto_587279 ) ) ( not ( = ?auto_587276 ?auto_587280 ) ) ( not ( = ?auto_587276 ?auto_587281 ) ) ( not ( = ?auto_587276 ?auto_587282 ) ) ( not ( = ?auto_587276 ?auto_587283 ) ) ( not ( = ?auto_587276 ?auto_587284 ) ) ( not ( = ?auto_587276 ?auto_587285 ) ) ( not ( = ?auto_587276 ?auto_587286 ) ) ( not ( = ?auto_587276 ?auto_587287 ) ) ( not ( = ?auto_587277 ?auto_587278 ) ) ( not ( = ?auto_587277 ?auto_587279 ) ) ( not ( = ?auto_587277 ?auto_587280 ) ) ( not ( = ?auto_587277 ?auto_587281 ) ) ( not ( = ?auto_587277 ?auto_587282 ) ) ( not ( = ?auto_587277 ?auto_587283 ) ) ( not ( = ?auto_587277 ?auto_587284 ) ) ( not ( = ?auto_587277 ?auto_587285 ) ) ( not ( = ?auto_587277 ?auto_587286 ) ) ( not ( = ?auto_587277 ?auto_587287 ) ) ( not ( = ?auto_587278 ?auto_587279 ) ) ( not ( = ?auto_587278 ?auto_587280 ) ) ( not ( = ?auto_587278 ?auto_587281 ) ) ( not ( = ?auto_587278 ?auto_587282 ) ) ( not ( = ?auto_587278 ?auto_587283 ) ) ( not ( = ?auto_587278 ?auto_587284 ) ) ( not ( = ?auto_587278 ?auto_587285 ) ) ( not ( = ?auto_587278 ?auto_587286 ) ) ( not ( = ?auto_587278 ?auto_587287 ) ) ( not ( = ?auto_587279 ?auto_587280 ) ) ( not ( = ?auto_587279 ?auto_587281 ) ) ( not ( = ?auto_587279 ?auto_587282 ) ) ( not ( = ?auto_587279 ?auto_587283 ) ) ( not ( = ?auto_587279 ?auto_587284 ) ) ( not ( = ?auto_587279 ?auto_587285 ) ) ( not ( = ?auto_587279 ?auto_587286 ) ) ( not ( = ?auto_587279 ?auto_587287 ) ) ( not ( = ?auto_587280 ?auto_587281 ) ) ( not ( = ?auto_587280 ?auto_587282 ) ) ( not ( = ?auto_587280 ?auto_587283 ) ) ( not ( = ?auto_587280 ?auto_587284 ) ) ( not ( = ?auto_587280 ?auto_587285 ) ) ( not ( = ?auto_587280 ?auto_587286 ) ) ( not ( = ?auto_587280 ?auto_587287 ) ) ( not ( = ?auto_587281 ?auto_587282 ) ) ( not ( = ?auto_587281 ?auto_587283 ) ) ( not ( = ?auto_587281 ?auto_587284 ) ) ( not ( = ?auto_587281 ?auto_587285 ) ) ( not ( = ?auto_587281 ?auto_587286 ) ) ( not ( = ?auto_587281 ?auto_587287 ) ) ( not ( = ?auto_587282 ?auto_587283 ) ) ( not ( = ?auto_587282 ?auto_587284 ) ) ( not ( = ?auto_587282 ?auto_587285 ) ) ( not ( = ?auto_587282 ?auto_587286 ) ) ( not ( = ?auto_587282 ?auto_587287 ) ) ( not ( = ?auto_587283 ?auto_587284 ) ) ( not ( = ?auto_587283 ?auto_587285 ) ) ( not ( = ?auto_587283 ?auto_587286 ) ) ( not ( = ?auto_587283 ?auto_587287 ) ) ( not ( = ?auto_587284 ?auto_587285 ) ) ( not ( = ?auto_587284 ?auto_587286 ) ) ( not ( = ?auto_587284 ?auto_587287 ) ) ( not ( = ?auto_587285 ?auto_587286 ) ) ( not ( = ?auto_587285 ?auto_587287 ) ) ( not ( = ?auto_587286 ?auto_587287 ) ) ( ON ?auto_587285 ?auto_587286 ) ( ON ?auto_587284 ?auto_587285 ) ( ON ?auto_587283 ?auto_587284 ) ( ON ?auto_587282 ?auto_587283 ) ( ON ?auto_587281 ?auto_587282 ) ( ON ?auto_587280 ?auto_587281 ) ( CLEAR ?auto_587278 ) ( ON ?auto_587279 ?auto_587280 ) ( CLEAR ?auto_587279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_587274 ?auto_587275 ?auto_587276 ?auto_587277 ?auto_587278 ?auto_587279 )
      ( MAKE-13PILE ?auto_587274 ?auto_587275 ?auto_587276 ?auto_587277 ?auto_587278 ?auto_587279 ?auto_587280 ?auto_587281 ?auto_587282 ?auto_587283 ?auto_587284 ?auto_587285 ?auto_587286 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_587328 - BLOCK
      ?auto_587329 - BLOCK
      ?auto_587330 - BLOCK
      ?auto_587331 - BLOCK
      ?auto_587332 - BLOCK
      ?auto_587333 - BLOCK
      ?auto_587334 - BLOCK
      ?auto_587335 - BLOCK
      ?auto_587336 - BLOCK
      ?auto_587337 - BLOCK
      ?auto_587338 - BLOCK
      ?auto_587339 - BLOCK
      ?auto_587340 - BLOCK
    )
    :vars
    (
      ?auto_587341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587340 ?auto_587341 ) ( ON-TABLE ?auto_587328 ) ( ON ?auto_587329 ?auto_587328 ) ( ON ?auto_587330 ?auto_587329 ) ( ON ?auto_587331 ?auto_587330 ) ( not ( = ?auto_587328 ?auto_587329 ) ) ( not ( = ?auto_587328 ?auto_587330 ) ) ( not ( = ?auto_587328 ?auto_587331 ) ) ( not ( = ?auto_587328 ?auto_587332 ) ) ( not ( = ?auto_587328 ?auto_587333 ) ) ( not ( = ?auto_587328 ?auto_587334 ) ) ( not ( = ?auto_587328 ?auto_587335 ) ) ( not ( = ?auto_587328 ?auto_587336 ) ) ( not ( = ?auto_587328 ?auto_587337 ) ) ( not ( = ?auto_587328 ?auto_587338 ) ) ( not ( = ?auto_587328 ?auto_587339 ) ) ( not ( = ?auto_587328 ?auto_587340 ) ) ( not ( = ?auto_587328 ?auto_587341 ) ) ( not ( = ?auto_587329 ?auto_587330 ) ) ( not ( = ?auto_587329 ?auto_587331 ) ) ( not ( = ?auto_587329 ?auto_587332 ) ) ( not ( = ?auto_587329 ?auto_587333 ) ) ( not ( = ?auto_587329 ?auto_587334 ) ) ( not ( = ?auto_587329 ?auto_587335 ) ) ( not ( = ?auto_587329 ?auto_587336 ) ) ( not ( = ?auto_587329 ?auto_587337 ) ) ( not ( = ?auto_587329 ?auto_587338 ) ) ( not ( = ?auto_587329 ?auto_587339 ) ) ( not ( = ?auto_587329 ?auto_587340 ) ) ( not ( = ?auto_587329 ?auto_587341 ) ) ( not ( = ?auto_587330 ?auto_587331 ) ) ( not ( = ?auto_587330 ?auto_587332 ) ) ( not ( = ?auto_587330 ?auto_587333 ) ) ( not ( = ?auto_587330 ?auto_587334 ) ) ( not ( = ?auto_587330 ?auto_587335 ) ) ( not ( = ?auto_587330 ?auto_587336 ) ) ( not ( = ?auto_587330 ?auto_587337 ) ) ( not ( = ?auto_587330 ?auto_587338 ) ) ( not ( = ?auto_587330 ?auto_587339 ) ) ( not ( = ?auto_587330 ?auto_587340 ) ) ( not ( = ?auto_587330 ?auto_587341 ) ) ( not ( = ?auto_587331 ?auto_587332 ) ) ( not ( = ?auto_587331 ?auto_587333 ) ) ( not ( = ?auto_587331 ?auto_587334 ) ) ( not ( = ?auto_587331 ?auto_587335 ) ) ( not ( = ?auto_587331 ?auto_587336 ) ) ( not ( = ?auto_587331 ?auto_587337 ) ) ( not ( = ?auto_587331 ?auto_587338 ) ) ( not ( = ?auto_587331 ?auto_587339 ) ) ( not ( = ?auto_587331 ?auto_587340 ) ) ( not ( = ?auto_587331 ?auto_587341 ) ) ( not ( = ?auto_587332 ?auto_587333 ) ) ( not ( = ?auto_587332 ?auto_587334 ) ) ( not ( = ?auto_587332 ?auto_587335 ) ) ( not ( = ?auto_587332 ?auto_587336 ) ) ( not ( = ?auto_587332 ?auto_587337 ) ) ( not ( = ?auto_587332 ?auto_587338 ) ) ( not ( = ?auto_587332 ?auto_587339 ) ) ( not ( = ?auto_587332 ?auto_587340 ) ) ( not ( = ?auto_587332 ?auto_587341 ) ) ( not ( = ?auto_587333 ?auto_587334 ) ) ( not ( = ?auto_587333 ?auto_587335 ) ) ( not ( = ?auto_587333 ?auto_587336 ) ) ( not ( = ?auto_587333 ?auto_587337 ) ) ( not ( = ?auto_587333 ?auto_587338 ) ) ( not ( = ?auto_587333 ?auto_587339 ) ) ( not ( = ?auto_587333 ?auto_587340 ) ) ( not ( = ?auto_587333 ?auto_587341 ) ) ( not ( = ?auto_587334 ?auto_587335 ) ) ( not ( = ?auto_587334 ?auto_587336 ) ) ( not ( = ?auto_587334 ?auto_587337 ) ) ( not ( = ?auto_587334 ?auto_587338 ) ) ( not ( = ?auto_587334 ?auto_587339 ) ) ( not ( = ?auto_587334 ?auto_587340 ) ) ( not ( = ?auto_587334 ?auto_587341 ) ) ( not ( = ?auto_587335 ?auto_587336 ) ) ( not ( = ?auto_587335 ?auto_587337 ) ) ( not ( = ?auto_587335 ?auto_587338 ) ) ( not ( = ?auto_587335 ?auto_587339 ) ) ( not ( = ?auto_587335 ?auto_587340 ) ) ( not ( = ?auto_587335 ?auto_587341 ) ) ( not ( = ?auto_587336 ?auto_587337 ) ) ( not ( = ?auto_587336 ?auto_587338 ) ) ( not ( = ?auto_587336 ?auto_587339 ) ) ( not ( = ?auto_587336 ?auto_587340 ) ) ( not ( = ?auto_587336 ?auto_587341 ) ) ( not ( = ?auto_587337 ?auto_587338 ) ) ( not ( = ?auto_587337 ?auto_587339 ) ) ( not ( = ?auto_587337 ?auto_587340 ) ) ( not ( = ?auto_587337 ?auto_587341 ) ) ( not ( = ?auto_587338 ?auto_587339 ) ) ( not ( = ?auto_587338 ?auto_587340 ) ) ( not ( = ?auto_587338 ?auto_587341 ) ) ( not ( = ?auto_587339 ?auto_587340 ) ) ( not ( = ?auto_587339 ?auto_587341 ) ) ( not ( = ?auto_587340 ?auto_587341 ) ) ( ON ?auto_587339 ?auto_587340 ) ( ON ?auto_587338 ?auto_587339 ) ( ON ?auto_587337 ?auto_587338 ) ( ON ?auto_587336 ?auto_587337 ) ( ON ?auto_587335 ?auto_587336 ) ( ON ?auto_587334 ?auto_587335 ) ( ON ?auto_587333 ?auto_587334 ) ( CLEAR ?auto_587331 ) ( ON ?auto_587332 ?auto_587333 ) ( CLEAR ?auto_587332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_587328 ?auto_587329 ?auto_587330 ?auto_587331 ?auto_587332 )
      ( MAKE-13PILE ?auto_587328 ?auto_587329 ?auto_587330 ?auto_587331 ?auto_587332 ?auto_587333 ?auto_587334 ?auto_587335 ?auto_587336 ?auto_587337 ?auto_587338 ?auto_587339 ?auto_587340 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_587382 - BLOCK
      ?auto_587383 - BLOCK
      ?auto_587384 - BLOCK
      ?auto_587385 - BLOCK
      ?auto_587386 - BLOCK
      ?auto_587387 - BLOCK
      ?auto_587388 - BLOCK
      ?auto_587389 - BLOCK
      ?auto_587390 - BLOCK
      ?auto_587391 - BLOCK
      ?auto_587392 - BLOCK
      ?auto_587393 - BLOCK
      ?auto_587394 - BLOCK
    )
    :vars
    (
      ?auto_587395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587394 ?auto_587395 ) ( ON-TABLE ?auto_587382 ) ( ON ?auto_587383 ?auto_587382 ) ( ON ?auto_587384 ?auto_587383 ) ( not ( = ?auto_587382 ?auto_587383 ) ) ( not ( = ?auto_587382 ?auto_587384 ) ) ( not ( = ?auto_587382 ?auto_587385 ) ) ( not ( = ?auto_587382 ?auto_587386 ) ) ( not ( = ?auto_587382 ?auto_587387 ) ) ( not ( = ?auto_587382 ?auto_587388 ) ) ( not ( = ?auto_587382 ?auto_587389 ) ) ( not ( = ?auto_587382 ?auto_587390 ) ) ( not ( = ?auto_587382 ?auto_587391 ) ) ( not ( = ?auto_587382 ?auto_587392 ) ) ( not ( = ?auto_587382 ?auto_587393 ) ) ( not ( = ?auto_587382 ?auto_587394 ) ) ( not ( = ?auto_587382 ?auto_587395 ) ) ( not ( = ?auto_587383 ?auto_587384 ) ) ( not ( = ?auto_587383 ?auto_587385 ) ) ( not ( = ?auto_587383 ?auto_587386 ) ) ( not ( = ?auto_587383 ?auto_587387 ) ) ( not ( = ?auto_587383 ?auto_587388 ) ) ( not ( = ?auto_587383 ?auto_587389 ) ) ( not ( = ?auto_587383 ?auto_587390 ) ) ( not ( = ?auto_587383 ?auto_587391 ) ) ( not ( = ?auto_587383 ?auto_587392 ) ) ( not ( = ?auto_587383 ?auto_587393 ) ) ( not ( = ?auto_587383 ?auto_587394 ) ) ( not ( = ?auto_587383 ?auto_587395 ) ) ( not ( = ?auto_587384 ?auto_587385 ) ) ( not ( = ?auto_587384 ?auto_587386 ) ) ( not ( = ?auto_587384 ?auto_587387 ) ) ( not ( = ?auto_587384 ?auto_587388 ) ) ( not ( = ?auto_587384 ?auto_587389 ) ) ( not ( = ?auto_587384 ?auto_587390 ) ) ( not ( = ?auto_587384 ?auto_587391 ) ) ( not ( = ?auto_587384 ?auto_587392 ) ) ( not ( = ?auto_587384 ?auto_587393 ) ) ( not ( = ?auto_587384 ?auto_587394 ) ) ( not ( = ?auto_587384 ?auto_587395 ) ) ( not ( = ?auto_587385 ?auto_587386 ) ) ( not ( = ?auto_587385 ?auto_587387 ) ) ( not ( = ?auto_587385 ?auto_587388 ) ) ( not ( = ?auto_587385 ?auto_587389 ) ) ( not ( = ?auto_587385 ?auto_587390 ) ) ( not ( = ?auto_587385 ?auto_587391 ) ) ( not ( = ?auto_587385 ?auto_587392 ) ) ( not ( = ?auto_587385 ?auto_587393 ) ) ( not ( = ?auto_587385 ?auto_587394 ) ) ( not ( = ?auto_587385 ?auto_587395 ) ) ( not ( = ?auto_587386 ?auto_587387 ) ) ( not ( = ?auto_587386 ?auto_587388 ) ) ( not ( = ?auto_587386 ?auto_587389 ) ) ( not ( = ?auto_587386 ?auto_587390 ) ) ( not ( = ?auto_587386 ?auto_587391 ) ) ( not ( = ?auto_587386 ?auto_587392 ) ) ( not ( = ?auto_587386 ?auto_587393 ) ) ( not ( = ?auto_587386 ?auto_587394 ) ) ( not ( = ?auto_587386 ?auto_587395 ) ) ( not ( = ?auto_587387 ?auto_587388 ) ) ( not ( = ?auto_587387 ?auto_587389 ) ) ( not ( = ?auto_587387 ?auto_587390 ) ) ( not ( = ?auto_587387 ?auto_587391 ) ) ( not ( = ?auto_587387 ?auto_587392 ) ) ( not ( = ?auto_587387 ?auto_587393 ) ) ( not ( = ?auto_587387 ?auto_587394 ) ) ( not ( = ?auto_587387 ?auto_587395 ) ) ( not ( = ?auto_587388 ?auto_587389 ) ) ( not ( = ?auto_587388 ?auto_587390 ) ) ( not ( = ?auto_587388 ?auto_587391 ) ) ( not ( = ?auto_587388 ?auto_587392 ) ) ( not ( = ?auto_587388 ?auto_587393 ) ) ( not ( = ?auto_587388 ?auto_587394 ) ) ( not ( = ?auto_587388 ?auto_587395 ) ) ( not ( = ?auto_587389 ?auto_587390 ) ) ( not ( = ?auto_587389 ?auto_587391 ) ) ( not ( = ?auto_587389 ?auto_587392 ) ) ( not ( = ?auto_587389 ?auto_587393 ) ) ( not ( = ?auto_587389 ?auto_587394 ) ) ( not ( = ?auto_587389 ?auto_587395 ) ) ( not ( = ?auto_587390 ?auto_587391 ) ) ( not ( = ?auto_587390 ?auto_587392 ) ) ( not ( = ?auto_587390 ?auto_587393 ) ) ( not ( = ?auto_587390 ?auto_587394 ) ) ( not ( = ?auto_587390 ?auto_587395 ) ) ( not ( = ?auto_587391 ?auto_587392 ) ) ( not ( = ?auto_587391 ?auto_587393 ) ) ( not ( = ?auto_587391 ?auto_587394 ) ) ( not ( = ?auto_587391 ?auto_587395 ) ) ( not ( = ?auto_587392 ?auto_587393 ) ) ( not ( = ?auto_587392 ?auto_587394 ) ) ( not ( = ?auto_587392 ?auto_587395 ) ) ( not ( = ?auto_587393 ?auto_587394 ) ) ( not ( = ?auto_587393 ?auto_587395 ) ) ( not ( = ?auto_587394 ?auto_587395 ) ) ( ON ?auto_587393 ?auto_587394 ) ( ON ?auto_587392 ?auto_587393 ) ( ON ?auto_587391 ?auto_587392 ) ( ON ?auto_587390 ?auto_587391 ) ( ON ?auto_587389 ?auto_587390 ) ( ON ?auto_587388 ?auto_587389 ) ( ON ?auto_587387 ?auto_587388 ) ( ON ?auto_587386 ?auto_587387 ) ( CLEAR ?auto_587384 ) ( ON ?auto_587385 ?auto_587386 ) ( CLEAR ?auto_587385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_587382 ?auto_587383 ?auto_587384 ?auto_587385 )
      ( MAKE-13PILE ?auto_587382 ?auto_587383 ?auto_587384 ?auto_587385 ?auto_587386 ?auto_587387 ?auto_587388 ?auto_587389 ?auto_587390 ?auto_587391 ?auto_587392 ?auto_587393 ?auto_587394 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_587436 - BLOCK
      ?auto_587437 - BLOCK
      ?auto_587438 - BLOCK
      ?auto_587439 - BLOCK
      ?auto_587440 - BLOCK
      ?auto_587441 - BLOCK
      ?auto_587442 - BLOCK
      ?auto_587443 - BLOCK
      ?auto_587444 - BLOCK
      ?auto_587445 - BLOCK
      ?auto_587446 - BLOCK
      ?auto_587447 - BLOCK
      ?auto_587448 - BLOCK
    )
    :vars
    (
      ?auto_587449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587448 ?auto_587449 ) ( ON-TABLE ?auto_587436 ) ( ON ?auto_587437 ?auto_587436 ) ( not ( = ?auto_587436 ?auto_587437 ) ) ( not ( = ?auto_587436 ?auto_587438 ) ) ( not ( = ?auto_587436 ?auto_587439 ) ) ( not ( = ?auto_587436 ?auto_587440 ) ) ( not ( = ?auto_587436 ?auto_587441 ) ) ( not ( = ?auto_587436 ?auto_587442 ) ) ( not ( = ?auto_587436 ?auto_587443 ) ) ( not ( = ?auto_587436 ?auto_587444 ) ) ( not ( = ?auto_587436 ?auto_587445 ) ) ( not ( = ?auto_587436 ?auto_587446 ) ) ( not ( = ?auto_587436 ?auto_587447 ) ) ( not ( = ?auto_587436 ?auto_587448 ) ) ( not ( = ?auto_587436 ?auto_587449 ) ) ( not ( = ?auto_587437 ?auto_587438 ) ) ( not ( = ?auto_587437 ?auto_587439 ) ) ( not ( = ?auto_587437 ?auto_587440 ) ) ( not ( = ?auto_587437 ?auto_587441 ) ) ( not ( = ?auto_587437 ?auto_587442 ) ) ( not ( = ?auto_587437 ?auto_587443 ) ) ( not ( = ?auto_587437 ?auto_587444 ) ) ( not ( = ?auto_587437 ?auto_587445 ) ) ( not ( = ?auto_587437 ?auto_587446 ) ) ( not ( = ?auto_587437 ?auto_587447 ) ) ( not ( = ?auto_587437 ?auto_587448 ) ) ( not ( = ?auto_587437 ?auto_587449 ) ) ( not ( = ?auto_587438 ?auto_587439 ) ) ( not ( = ?auto_587438 ?auto_587440 ) ) ( not ( = ?auto_587438 ?auto_587441 ) ) ( not ( = ?auto_587438 ?auto_587442 ) ) ( not ( = ?auto_587438 ?auto_587443 ) ) ( not ( = ?auto_587438 ?auto_587444 ) ) ( not ( = ?auto_587438 ?auto_587445 ) ) ( not ( = ?auto_587438 ?auto_587446 ) ) ( not ( = ?auto_587438 ?auto_587447 ) ) ( not ( = ?auto_587438 ?auto_587448 ) ) ( not ( = ?auto_587438 ?auto_587449 ) ) ( not ( = ?auto_587439 ?auto_587440 ) ) ( not ( = ?auto_587439 ?auto_587441 ) ) ( not ( = ?auto_587439 ?auto_587442 ) ) ( not ( = ?auto_587439 ?auto_587443 ) ) ( not ( = ?auto_587439 ?auto_587444 ) ) ( not ( = ?auto_587439 ?auto_587445 ) ) ( not ( = ?auto_587439 ?auto_587446 ) ) ( not ( = ?auto_587439 ?auto_587447 ) ) ( not ( = ?auto_587439 ?auto_587448 ) ) ( not ( = ?auto_587439 ?auto_587449 ) ) ( not ( = ?auto_587440 ?auto_587441 ) ) ( not ( = ?auto_587440 ?auto_587442 ) ) ( not ( = ?auto_587440 ?auto_587443 ) ) ( not ( = ?auto_587440 ?auto_587444 ) ) ( not ( = ?auto_587440 ?auto_587445 ) ) ( not ( = ?auto_587440 ?auto_587446 ) ) ( not ( = ?auto_587440 ?auto_587447 ) ) ( not ( = ?auto_587440 ?auto_587448 ) ) ( not ( = ?auto_587440 ?auto_587449 ) ) ( not ( = ?auto_587441 ?auto_587442 ) ) ( not ( = ?auto_587441 ?auto_587443 ) ) ( not ( = ?auto_587441 ?auto_587444 ) ) ( not ( = ?auto_587441 ?auto_587445 ) ) ( not ( = ?auto_587441 ?auto_587446 ) ) ( not ( = ?auto_587441 ?auto_587447 ) ) ( not ( = ?auto_587441 ?auto_587448 ) ) ( not ( = ?auto_587441 ?auto_587449 ) ) ( not ( = ?auto_587442 ?auto_587443 ) ) ( not ( = ?auto_587442 ?auto_587444 ) ) ( not ( = ?auto_587442 ?auto_587445 ) ) ( not ( = ?auto_587442 ?auto_587446 ) ) ( not ( = ?auto_587442 ?auto_587447 ) ) ( not ( = ?auto_587442 ?auto_587448 ) ) ( not ( = ?auto_587442 ?auto_587449 ) ) ( not ( = ?auto_587443 ?auto_587444 ) ) ( not ( = ?auto_587443 ?auto_587445 ) ) ( not ( = ?auto_587443 ?auto_587446 ) ) ( not ( = ?auto_587443 ?auto_587447 ) ) ( not ( = ?auto_587443 ?auto_587448 ) ) ( not ( = ?auto_587443 ?auto_587449 ) ) ( not ( = ?auto_587444 ?auto_587445 ) ) ( not ( = ?auto_587444 ?auto_587446 ) ) ( not ( = ?auto_587444 ?auto_587447 ) ) ( not ( = ?auto_587444 ?auto_587448 ) ) ( not ( = ?auto_587444 ?auto_587449 ) ) ( not ( = ?auto_587445 ?auto_587446 ) ) ( not ( = ?auto_587445 ?auto_587447 ) ) ( not ( = ?auto_587445 ?auto_587448 ) ) ( not ( = ?auto_587445 ?auto_587449 ) ) ( not ( = ?auto_587446 ?auto_587447 ) ) ( not ( = ?auto_587446 ?auto_587448 ) ) ( not ( = ?auto_587446 ?auto_587449 ) ) ( not ( = ?auto_587447 ?auto_587448 ) ) ( not ( = ?auto_587447 ?auto_587449 ) ) ( not ( = ?auto_587448 ?auto_587449 ) ) ( ON ?auto_587447 ?auto_587448 ) ( ON ?auto_587446 ?auto_587447 ) ( ON ?auto_587445 ?auto_587446 ) ( ON ?auto_587444 ?auto_587445 ) ( ON ?auto_587443 ?auto_587444 ) ( ON ?auto_587442 ?auto_587443 ) ( ON ?auto_587441 ?auto_587442 ) ( ON ?auto_587440 ?auto_587441 ) ( ON ?auto_587439 ?auto_587440 ) ( CLEAR ?auto_587437 ) ( ON ?auto_587438 ?auto_587439 ) ( CLEAR ?auto_587438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_587436 ?auto_587437 ?auto_587438 )
      ( MAKE-13PILE ?auto_587436 ?auto_587437 ?auto_587438 ?auto_587439 ?auto_587440 ?auto_587441 ?auto_587442 ?auto_587443 ?auto_587444 ?auto_587445 ?auto_587446 ?auto_587447 ?auto_587448 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_587490 - BLOCK
      ?auto_587491 - BLOCK
      ?auto_587492 - BLOCK
      ?auto_587493 - BLOCK
      ?auto_587494 - BLOCK
      ?auto_587495 - BLOCK
      ?auto_587496 - BLOCK
      ?auto_587497 - BLOCK
      ?auto_587498 - BLOCK
      ?auto_587499 - BLOCK
      ?auto_587500 - BLOCK
      ?auto_587501 - BLOCK
      ?auto_587502 - BLOCK
    )
    :vars
    (
      ?auto_587503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587502 ?auto_587503 ) ( ON-TABLE ?auto_587490 ) ( not ( = ?auto_587490 ?auto_587491 ) ) ( not ( = ?auto_587490 ?auto_587492 ) ) ( not ( = ?auto_587490 ?auto_587493 ) ) ( not ( = ?auto_587490 ?auto_587494 ) ) ( not ( = ?auto_587490 ?auto_587495 ) ) ( not ( = ?auto_587490 ?auto_587496 ) ) ( not ( = ?auto_587490 ?auto_587497 ) ) ( not ( = ?auto_587490 ?auto_587498 ) ) ( not ( = ?auto_587490 ?auto_587499 ) ) ( not ( = ?auto_587490 ?auto_587500 ) ) ( not ( = ?auto_587490 ?auto_587501 ) ) ( not ( = ?auto_587490 ?auto_587502 ) ) ( not ( = ?auto_587490 ?auto_587503 ) ) ( not ( = ?auto_587491 ?auto_587492 ) ) ( not ( = ?auto_587491 ?auto_587493 ) ) ( not ( = ?auto_587491 ?auto_587494 ) ) ( not ( = ?auto_587491 ?auto_587495 ) ) ( not ( = ?auto_587491 ?auto_587496 ) ) ( not ( = ?auto_587491 ?auto_587497 ) ) ( not ( = ?auto_587491 ?auto_587498 ) ) ( not ( = ?auto_587491 ?auto_587499 ) ) ( not ( = ?auto_587491 ?auto_587500 ) ) ( not ( = ?auto_587491 ?auto_587501 ) ) ( not ( = ?auto_587491 ?auto_587502 ) ) ( not ( = ?auto_587491 ?auto_587503 ) ) ( not ( = ?auto_587492 ?auto_587493 ) ) ( not ( = ?auto_587492 ?auto_587494 ) ) ( not ( = ?auto_587492 ?auto_587495 ) ) ( not ( = ?auto_587492 ?auto_587496 ) ) ( not ( = ?auto_587492 ?auto_587497 ) ) ( not ( = ?auto_587492 ?auto_587498 ) ) ( not ( = ?auto_587492 ?auto_587499 ) ) ( not ( = ?auto_587492 ?auto_587500 ) ) ( not ( = ?auto_587492 ?auto_587501 ) ) ( not ( = ?auto_587492 ?auto_587502 ) ) ( not ( = ?auto_587492 ?auto_587503 ) ) ( not ( = ?auto_587493 ?auto_587494 ) ) ( not ( = ?auto_587493 ?auto_587495 ) ) ( not ( = ?auto_587493 ?auto_587496 ) ) ( not ( = ?auto_587493 ?auto_587497 ) ) ( not ( = ?auto_587493 ?auto_587498 ) ) ( not ( = ?auto_587493 ?auto_587499 ) ) ( not ( = ?auto_587493 ?auto_587500 ) ) ( not ( = ?auto_587493 ?auto_587501 ) ) ( not ( = ?auto_587493 ?auto_587502 ) ) ( not ( = ?auto_587493 ?auto_587503 ) ) ( not ( = ?auto_587494 ?auto_587495 ) ) ( not ( = ?auto_587494 ?auto_587496 ) ) ( not ( = ?auto_587494 ?auto_587497 ) ) ( not ( = ?auto_587494 ?auto_587498 ) ) ( not ( = ?auto_587494 ?auto_587499 ) ) ( not ( = ?auto_587494 ?auto_587500 ) ) ( not ( = ?auto_587494 ?auto_587501 ) ) ( not ( = ?auto_587494 ?auto_587502 ) ) ( not ( = ?auto_587494 ?auto_587503 ) ) ( not ( = ?auto_587495 ?auto_587496 ) ) ( not ( = ?auto_587495 ?auto_587497 ) ) ( not ( = ?auto_587495 ?auto_587498 ) ) ( not ( = ?auto_587495 ?auto_587499 ) ) ( not ( = ?auto_587495 ?auto_587500 ) ) ( not ( = ?auto_587495 ?auto_587501 ) ) ( not ( = ?auto_587495 ?auto_587502 ) ) ( not ( = ?auto_587495 ?auto_587503 ) ) ( not ( = ?auto_587496 ?auto_587497 ) ) ( not ( = ?auto_587496 ?auto_587498 ) ) ( not ( = ?auto_587496 ?auto_587499 ) ) ( not ( = ?auto_587496 ?auto_587500 ) ) ( not ( = ?auto_587496 ?auto_587501 ) ) ( not ( = ?auto_587496 ?auto_587502 ) ) ( not ( = ?auto_587496 ?auto_587503 ) ) ( not ( = ?auto_587497 ?auto_587498 ) ) ( not ( = ?auto_587497 ?auto_587499 ) ) ( not ( = ?auto_587497 ?auto_587500 ) ) ( not ( = ?auto_587497 ?auto_587501 ) ) ( not ( = ?auto_587497 ?auto_587502 ) ) ( not ( = ?auto_587497 ?auto_587503 ) ) ( not ( = ?auto_587498 ?auto_587499 ) ) ( not ( = ?auto_587498 ?auto_587500 ) ) ( not ( = ?auto_587498 ?auto_587501 ) ) ( not ( = ?auto_587498 ?auto_587502 ) ) ( not ( = ?auto_587498 ?auto_587503 ) ) ( not ( = ?auto_587499 ?auto_587500 ) ) ( not ( = ?auto_587499 ?auto_587501 ) ) ( not ( = ?auto_587499 ?auto_587502 ) ) ( not ( = ?auto_587499 ?auto_587503 ) ) ( not ( = ?auto_587500 ?auto_587501 ) ) ( not ( = ?auto_587500 ?auto_587502 ) ) ( not ( = ?auto_587500 ?auto_587503 ) ) ( not ( = ?auto_587501 ?auto_587502 ) ) ( not ( = ?auto_587501 ?auto_587503 ) ) ( not ( = ?auto_587502 ?auto_587503 ) ) ( ON ?auto_587501 ?auto_587502 ) ( ON ?auto_587500 ?auto_587501 ) ( ON ?auto_587499 ?auto_587500 ) ( ON ?auto_587498 ?auto_587499 ) ( ON ?auto_587497 ?auto_587498 ) ( ON ?auto_587496 ?auto_587497 ) ( ON ?auto_587495 ?auto_587496 ) ( ON ?auto_587494 ?auto_587495 ) ( ON ?auto_587493 ?auto_587494 ) ( ON ?auto_587492 ?auto_587493 ) ( CLEAR ?auto_587490 ) ( ON ?auto_587491 ?auto_587492 ) ( CLEAR ?auto_587491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_587490 ?auto_587491 )
      ( MAKE-13PILE ?auto_587490 ?auto_587491 ?auto_587492 ?auto_587493 ?auto_587494 ?auto_587495 ?auto_587496 ?auto_587497 ?auto_587498 ?auto_587499 ?auto_587500 ?auto_587501 ?auto_587502 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_587544 - BLOCK
      ?auto_587545 - BLOCK
      ?auto_587546 - BLOCK
      ?auto_587547 - BLOCK
      ?auto_587548 - BLOCK
      ?auto_587549 - BLOCK
      ?auto_587550 - BLOCK
      ?auto_587551 - BLOCK
      ?auto_587552 - BLOCK
      ?auto_587553 - BLOCK
      ?auto_587554 - BLOCK
      ?auto_587555 - BLOCK
      ?auto_587556 - BLOCK
    )
    :vars
    (
      ?auto_587557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587556 ?auto_587557 ) ( not ( = ?auto_587544 ?auto_587545 ) ) ( not ( = ?auto_587544 ?auto_587546 ) ) ( not ( = ?auto_587544 ?auto_587547 ) ) ( not ( = ?auto_587544 ?auto_587548 ) ) ( not ( = ?auto_587544 ?auto_587549 ) ) ( not ( = ?auto_587544 ?auto_587550 ) ) ( not ( = ?auto_587544 ?auto_587551 ) ) ( not ( = ?auto_587544 ?auto_587552 ) ) ( not ( = ?auto_587544 ?auto_587553 ) ) ( not ( = ?auto_587544 ?auto_587554 ) ) ( not ( = ?auto_587544 ?auto_587555 ) ) ( not ( = ?auto_587544 ?auto_587556 ) ) ( not ( = ?auto_587544 ?auto_587557 ) ) ( not ( = ?auto_587545 ?auto_587546 ) ) ( not ( = ?auto_587545 ?auto_587547 ) ) ( not ( = ?auto_587545 ?auto_587548 ) ) ( not ( = ?auto_587545 ?auto_587549 ) ) ( not ( = ?auto_587545 ?auto_587550 ) ) ( not ( = ?auto_587545 ?auto_587551 ) ) ( not ( = ?auto_587545 ?auto_587552 ) ) ( not ( = ?auto_587545 ?auto_587553 ) ) ( not ( = ?auto_587545 ?auto_587554 ) ) ( not ( = ?auto_587545 ?auto_587555 ) ) ( not ( = ?auto_587545 ?auto_587556 ) ) ( not ( = ?auto_587545 ?auto_587557 ) ) ( not ( = ?auto_587546 ?auto_587547 ) ) ( not ( = ?auto_587546 ?auto_587548 ) ) ( not ( = ?auto_587546 ?auto_587549 ) ) ( not ( = ?auto_587546 ?auto_587550 ) ) ( not ( = ?auto_587546 ?auto_587551 ) ) ( not ( = ?auto_587546 ?auto_587552 ) ) ( not ( = ?auto_587546 ?auto_587553 ) ) ( not ( = ?auto_587546 ?auto_587554 ) ) ( not ( = ?auto_587546 ?auto_587555 ) ) ( not ( = ?auto_587546 ?auto_587556 ) ) ( not ( = ?auto_587546 ?auto_587557 ) ) ( not ( = ?auto_587547 ?auto_587548 ) ) ( not ( = ?auto_587547 ?auto_587549 ) ) ( not ( = ?auto_587547 ?auto_587550 ) ) ( not ( = ?auto_587547 ?auto_587551 ) ) ( not ( = ?auto_587547 ?auto_587552 ) ) ( not ( = ?auto_587547 ?auto_587553 ) ) ( not ( = ?auto_587547 ?auto_587554 ) ) ( not ( = ?auto_587547 ?auto_587555 ) ) ( not ( = ?auto_587547 ?auto_587556 ) ) ( not ( = ?auto_587547 ?auto_587557 ) ) ( not ( = ?auto_587548 ?auto_587549 ) ) ( not ( = ?auto_587548 ?auto_587550 ) ) ( not ( = ?auto_587548 ?auto_587551 ) ) ( not ( = ?auto_587548 ?auto_587552 ) ) ( not ( = ?auto_587548 ?auto_587553 ) ) ( not ( = ?auto_587548 ?auto_587554 ) ) ( not ( = ?auto_587548 ?auto_587555 ) ) ( not ( = ?auto_587548 ?auto_587556 ) ) ( not ( = ?auto_587548 ?auto_587557 ) ) ( not ( = ?auto_587549 ?auto_587550 ) ) ( not ( = ?auto_587549 ?auto_587551 ) ) ( not ( = ?auto_587549 ?auto_587552 ) ) ( not ( = ?auto_587549 ?auto_587553 ) ) ( not ( = ?auto_587549 ?auto_587554 ) ) ( not ( = ?auto_587549 ?auto_587555 ) ) ( not ( = ?auto_587549 ?auto_587556 ) ) ( not ( = ?auto_587549 ?auto_587557 ) ) ( not ( = ?auto_587550 ?auto_587551 ) ) ( not ( = ?auto_587550 ?auto_587552 ) ) ( not ( = ?auto_587550 ?auto_587553 ) ) ( not ( = ?auto_587550 ?auto_587554 ) ) ( not ( = ?auto_587550 ?auto_587555 ) ) ( not ( = ?auto_587550 ?auto_587556 ) ) ( not ( = ?auto_587550 ?auto_587557 ) ) ( not ( = ?auto_587551 ?auto_587552 ) ) ( not ( = ?auto_587551 ?auto_587553 ) ) ( not ( = ?auto_587551 ?auto_587554 ) ) ( not ( = ?auto_587551 ?auto_587555 ) ) ( not ( = ?auto_587551 ?auto_587556 ) ) ( not ( = ?auto_587551 ?auto_587557 ) ) ( not ( = ?auto_587552 ?auto_587553 ) ) ( not ( = ?auto_587552 ?auto_587554 ) ) ( not ( = ?auto_587552 ?auto_587555 ) ) ( not ( = ?auto_587552 ?auto_587556 ) ) ( not ( = ?auto_587552 ?auto_587557 ) ) ( not ( = ?auto_587553 ?auto_587554 ) ) ( not ( = ?auto_587553 ?auto_587555 ) ) ( not ( = ?auto_587553 ?auto_587556 ) ) ( not ( = ?auto_587553 ?auto_587557 ) ) ( not ( = ?auto_587554 ?auto_587555 ) ) ( not ( = ?auto_587554 ?auto_587556 ) ) ( not ( = ?auto_587554 ?auto_587557 ) ) ( not ( = ?auto_587555 ?auto_587556 ) ) ( not ( = ?auto_587555 ?auto_587557 ) ) ( not ( = ?auto_587556 ?auto_587557 ) ) ( ON ?auto_587555 ?auto_587556 ) ( ON ?auto_587554 ?auto_587555 ) ( ON ?auto_587553 ?auto_587554 ) ( ON ?auto_587552 ?auto_587553 ) ( ON ?auto_587551 ?auto_587552 ) ( ON ?auto_587550 ?auto_587551 ) ( ON ?auto_587549 ?auto_587550 ) ( ON ?auto_587548 ?auto_587549 ) ( ON ?auto_587547 ?auto_587548 ) ( ON ?auto_587546 ?auto_587547 ) ( ON ?auto_587545 ?auto_587546 ) ( ON ?auto_587544 ?auto_587545 ) ( CLEAR ?auto_587544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_587544 )
      ( MAKE-13PILE ?auto_587544 ?auto_587545 ?auto_587546 ?auto_587547 ?auto_587548 ?auto_587549 ?auto_587550 ?auto_587551 ?auto_587552 ?auto_587553 ?auto_587554 ?auto_587555 ?auto_587556 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_587599 - BLOCK
      ?auto_587600 - BLOCK
      ?auto_587601 - BLOCK
      ?auto_587602 - BLOCK
      ?auto_587603 - BLOCK
      ?auto_587604 - BLOCK
      ?auto_587605 - BLOCK
      ?auto_587606 - BLOCK
      ?auto_587607 - BLOCK
      ?auto_587608 - BLOCK
      ?auto_587609 - BLOCK
      ?auto_587610 - BLOCK
      ?auto_587611 - BLOCK
      ?auto_587612 - BLOCK
    )
    :vars
    (
      ?auto_587613 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_587611 ) ( ON ?auto_587612 ?auto_587613 ) ( CLEAR ?auto_587612 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_587599 ) ( ON ?auto_587600 ?auto_587599 ) ( ON ?auto_587601 ?auto_587600 ) ( ON ?auto_587602 ?auto_587601 ) ( ON ?auto_587603 ?auto_587602 ) ( ON ?auto_587604 ?auto_587603 ) ( ON ?auto_587605 ?auto_587604 ) ( ON ?auto_587606 ?auto_587605 ) ( ON ?auto_587607 ?auto_587606 ) ( ON ?auto_587608 ?auto_587607 ) ( ON ?auto_587609 ?auto_587608 ) ( ON ?auto_587610 ?auto_587609 ) ( ON ?auto_587611 ?auto_587610 ) ( not ( = ?auto_587599 ?auto_587600 ) ) ( not ( = ?auto_587599 ?auto_587601 ) ) ( not ( = ?auto_587599 ?auto_587602 ) ) ( not ( = ?auto_587599 ?auto_587603 ) ) ( not ( = ?auto_587599 ?auto_587604 ) ) ( not ( = ?auto_587599 ?auto_587605 ) ) ( not ( = ?auto_587599 ?auto_587606 ) ) ( not ( = ?auto_587599 ?auto_587607 ) ) ( not ( = ?auto_587599 ?auto_587608 ) ) ( not ( = ?auto_587599 ?auto_587609 ) ) ( not ( = ?auto_587599 ?auto_587610 ) ) ( not ( = ?auto_587599 ?auto_587611 ) ) ( not ( = ?auto_587599 ?auto_587612 ) ) ( not ( = ?auto_587599 ?auto_587613 ) ) ( not ( = ?auto_587600 ?auto_587601 ) ) ( not ( = ?auto_587600 ?auto_587602 ) ) ( not ( = ?auto_587600 ?auto_587603 ) ) ( not ( = ?auto_587600 ?auto_587604 ) ) ( not ( = ?auto_587600 ?auto_587605 ) ) ( not ( = ?auto_587600 ?auto_587606 ) ) ( not ( = ?auto_587600 ?auto_587607 ) ) ( not ( = ?auto_587600 ?auto_587608 ) ) ( not ( = ?auto_587600 ?auto_587609 ) ) ( not ( = ?auto_587600 ?auto_587610 ) ) ( not ( = ?auto_587600 ?auto_587611 ) ) ( not ( = ?auto_587600 ?auto_587612 ) ) ( not ( = ?auto_587600 ?auto_587613 ) ) ( not ( = ?auto_587601 ?auto_587602 ) ) ( not ( = ?auto_587601 ?auto_587603 ) ) ( not ( = ?auto_587601 ?auto_587604 ) ) ( not ( = ?auto_587601 ?auto_587605 ) ) ( not ( = ?auto_587601 ?auto_587606 ) ) ( not ( = ?auto_587601 ?auto_587607 ) ) ( not ( = ?auto_587601 ?auto_587608 ) ) ( not ( = ?auto_587601 ?auto_587609 ) ) ( not ( = ?auto_587601 ?auto_587610 ) ) ( not ( = ?auto_587601 ?auto_587611 ) ) ( not ( = ?auto_587601 ?auto_587612 ) ) ( not ( = ?auto_587601 ?auto_587613 ) ) ( not ( = ?auto_587602 ?auto_587603 ) ) ( not ( = ?auto_587602 ?auto_587604 ) ) ( not ( = ?auto_587602 ?auto_587605 ) ) ( not ( = ?auto_587602 ?auto_587606 ) ) ( not ( = ?auto_587602 ?auto_587607 ) ) ( not ( = ?auto_587602 ?auto_587608 ) ) ( not ( = ?auto_587602 ?auto_587609 ) ) ( not ( = ?auto_587602 ?auto_587610 ) ) ( not ( = ?auto_587602 ?auto_587611 ) ) ( not ( = ?auto_587602 ?auto_587612 ) ) ( not ( = ?auto_587602 ?auto_587613 ) ) ( not ( = ?auto_587603 ?auto_587604 ) ) ( not ( = ?auto_587603 ?auto_587605 ) ) ( not ( = ?auto_587603 ?auto_587606 ) ) ( not ( = ?auto_587603 ?auto_587607 ) ) ( not ( = ?auto_587603 ?auto_587608 ) ) ( not ( = ?auto_587603 ?auto_587609 ) ) ( not ( = ?auto_587603 ?auto_587610 ) ) ( not ( = ?auto_587603 ?auto_587611 ) ) ( not ( = ?auto_587603 ?auto_587612 ) ) ( not ( = ?auto_587603 ?auto_587613 ) ) ( not ( = ?auto_587604 ?auto_587605 ) ) ( not ( = ?auto_587604 ?auto_587606 ) ) ( not ( = ?auto_587604 ?auto_587607 ) ) ( not ( = ?auto_587604 ?auto_587608 ) ) ( not ( = ?auto_587604 ?auto_587609 ) ) ( not ( = ?auto_587604 ?auto_587610 ) ) ( not ( = ?auto_587604 ?auto_587611 ) ) ( not ( = ?auto_587604 ?auto_587612 ) ) ( not ( = ?auto_587604 ?auto_587613 ) ) ( not ( = ?auto_587605 ?auto_587606 ) ) ( not ( = ?auto_587605 ?auto_587607 ) ) ( not ( = ?auto_587605 ?auto_587608 ) ) ( not ( = ?auto_587605 ?auto_587609 ) ) ( not ( = ?auto_587605 ?auto_587610 ) ) ( not ( = ?auto_587605 ?auto_587611 ) ) ( not ( = ?auto_587605 ?auto_587612 ) ) ( not ( = ?auto_587605 ?auto_587613 ) ) ( not ( = ?auto_587606 ?auto_587607 ) ) ( not ( = ?auto_587606 ?auto_587608 ) ) ( not ( = ?auto_587606 ?auto_587609 ) ) ( not ( = ?auto_587606 ?auto_587610 ) ) ( not ( = ?auto_587606 ?auto_587611 ) ) ( not ( = ?auto_587606 ?auto_587612 ) ) ( not ( = ?auto_587606 ?auto_587613 ) ) ( not ( = ?auto_587607 ?auto_587608 ) ) ( not ( = ?auto_587607 ?auto_587609 ) ) ( not ( = ?auto_587607 ?auto_587610 ) ) ( not ( = ?auto_587607 ?auto_587611 ) ) ( not ( = ?auto_587607 ?auto_587612 ) ) ( not ( = ?auto_587607 ?auto_587613 ) ) ( not ( = ?auto_587608 ?auto_587609 ) ) ( not ( = ?auto_587608 ?auto_587610 ) ) ( not ( = ?auto_587608 ?auto_587611 ) ) ( not ( = ?auto_587608 ?auto_587612 ) ) ( not ( = ?auto_587608 ?auto_587613 ) ) ( not ( = ?auto_587609 ?auto_587610 ) ) ( not ( = ?auto_587609 ?auto_587611 ) ) ( not ( = ?auto_587609 ?auto_587612 ) ) ( not ( = ?auto_587609 ?auto_587613 ) ) ( not ( = ?auto_587610 ?auto_587611 ) ) ( not ( = ?auto_587610 ?auto_587612 ) ) ( not ( = ?auto_587610 ?auto_587613 ) ) ( not ( = ?auto_587611 ?auto_587612 ) ) ( not ( = ?auto_587611 ?auto_587613 ) ) ( not ( = ?auto_587612 ?auto_587613 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_587612 ?auto_587613 )
      ( !STACK ?auto_587612 ?auto_587611 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_587657 - BLOCK
      ?auto_587658 - BLOCK
      ?auto_587659 - BLOCK
      ?auto_587660 - BLOCK
      ?auto_587661 - BLOCK
      ?auto_587662 - BLOCK
      ?auto_587663 - BLOCK
      ?auto_587664 - BLOCK
      ?auto_587665 - BLOCK
      ?auto_587666 - BLOCK
      ?auto_587667 - BLOCK
      ?auto_587668 - BLOCK
      ?auto_587669 - BLOCK
      ?auto_587670 - BLOCK
    )
    :vars
    (
      ?auto_587671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587670 ?auto_587671 ) ( ON-TABLE ?auto_587657 ) ( ON ?auto_587658 ?auto_587657 ) ( ON ?auto_587659 ?auto_587658 ) ( ON ?auto_587660 ?auto_587659 ) ( ON ?auto_587661 ?auto_587660 ) ( ON ?auto_587662 ?auto_587661 ) ( ON ?auto_587663 ?auto_587662 ) ( ON ?auto_587664 ?auto_587663 ) ( ON ?auto_587665 ?auto_587664 ) ( ON ?auto_587666 ?auto_587665 ) ( ON ?auto_587667 ?auto_587666 ) ( ON ?auto_587668 ?auto_587667 ) ( not ( = ?auto_587657 ?auto_587658 ) ) ( not ( = ?auto_587657 ?auto_587659 ) ) ( not ( = ?auto_587657 ?auto_587660 ) ) ( not ( = ?auto_587657 ?auto_587661 ) ) ( not ( = ?auto_587657 ?auto_587662 ) ) ( not ( = ?auto_587657 ?auto_587663 ) ) ( not ( = ?auto_587657 ?auto_587664 ) ) ( not ( = ?auto_587657 ?auto_587665 ) ) ( not ( = ?auto_587657 ?auto_587666 ) ) ( not ( = ?auto_587657 ?auto_587667 ) ) ( not ( = ?auto_587657 ?auto_587668 ) ) ( not ( = ?auto_587657 ?auto_587669 ) ) ( not ( = ?auto_587657 ?auto_587670 ) ) ( not ( = ?auto_587657 ?auto_587671 ) ) ( not ( = ?auto_587658 ?auto_587659 ) ) ( not ( = ?auto_587658 ?auto_587660 ) ) ( not ( = ?auto_587658 ?auto_587661 ) ) ( not ( = ?auto_587658 ?auto_587662 ) ) ( not ( = ?auto_587658 ?auto_587663 ) ) ( not ( = ?auto_587658 ?auto_587664 ) ) ( not ( = ?auto_587658 ?auto_587665 ) ) ( not ( = ?auto_587658 ?auto_587666 ) ) ( not ( = ?auto_587658 ?auto_587667 ) ) ( not ( = ?auto_587658 ?auto_587668 ) ) ( not ( = ?auto_587658 ?auto_587669 ) ) ( not ( = ?auto_587658 ?auto_587670 ) ) ( not ( = ?auto_587658 ?auto_587671 ) ) ( not ( = ?auto_587659 ?auto_587660 ) ) ( not ( = ?auto_587659 ?auto_587661 ) ) ( not ( = ?auto_587659 ?auto_587662 ) ) ( not ( = ?auto_587659 ?auto_587663 ) ) ( not ( = ?auto_587659 ?auto_587664 ) ) ( not ( = ?auto_587659 ?auto_587665 ) ) ( not ( = ?auto_587659 ?auto_587666 ) ) ( not ( = ?auto_587659 ?auto_587667 ) ) ( not ( = ?auto_587659 ?auto_587668 ) ) ( not ( = ?auto_587659 ?auto_587669 ) ) ( not ( = ?auto_587659 ?auto_587670 ) ) ( not ( = ?auto_587659 ?auto_587671 ) ) ( not ( = ?auto_587660 ?auto_587661 ) ) ( not ( = ?auto_587660 ?auto_587662 ) ) ( not ( = ?auto_587660 ?auto_587663 ) ) ( not ( = ?auto_587660 ?auto_587664 ) ) ( not ( = ?auto_587660 ?auto_587665 ) ) ( not ( = ?auto_587660 ?auto_587666 ) ) ( not ( = ?auto_587660 ?auto_587667 ) ) ( not ( = ?auto_587660 ?auto_587668 ) ) ( not ( = ?auto_587660 ?auto_587669 ) ) ( not ( = ?auto_587660 ?auto_587670 ) ) ( not ( = ?auto_587660 ?auto_587671 ) ) ( not ( = ?auto_587661 ?auto_587662 ) ) ( not ( = ?auto_587661 ?auto_587663 ) ) ( not ( = ?auto_587661 ?auto_587664 ) ) ( not ( = ?auto_587661 ?auto_587665 ) ) ( not ( = ?auto_587661 ?auto_587666 ) ) ( not ( = ?auto_587661 ?auto_587667 ) ) ( not ( = ?auto_587661 ?auto_587668 ) ) ( not ( = ?auto_587661 ?auto_587669 ) ) ( not ( = ?auto_587661 ?auto_587670 ) ) ( not ( = ?auto_587661 ?auto_587671 ) ) ( not ( = ?auto_587662 ?auto_587663 ) ) ( not ( = ?auto_587662 ?auto_587664 ) ) ( not ( = ?auto_587662 ?auto_587665 ) ) ( not ( = ?auto_587662 ?auto_587666 ) ) ( not ( = ?auto_587662 ?auto_587667 ) ) ( not ( = ?auto_587662 ?auto_587668 ) ) ( not ( = ?auto_587662 ?auto_587669 ) ) ( not ( = ?auto_587662 ?auto_587670 ) ) ( not ( = ?auto_587662 ?auto_587671 ) ) ( not ( = ?auto_587663 ?auto_587664 ) ) ( not ( = ?auto_587663 ?auto_587665 ) ) ( not ( = ?auto_587663 ?auto_587666 ) ) ( not ( = ?auto_587663 ?auto_587667 ) ) ( not ( = ?auto_587663 ?auto_587668 ) ) ( not ( = ?auto_587663 ?auto_587669 ) ) ( not ( = ?auto_587663 ?auto_587670 ) ) ( not ( = ?auto_587663 ?auto_587671 ) ) ( not ( = ?auto_587664 ?auto_587665 ) ) ( not ( = ?auto_587664 ?auto_587666 ) ) ( not ( = ?auto_587664 ?auto_587667 ) ) ( not ( = ?auto_587664 ?auto_587668 ) ) ( not ( = ?auto_587664 ?auto_587669 ) ) ( not ( = ?auto_587664 ?auto_587670 ) ) ( not ( = ?auto_587664 ?auto_587671 ) ) ( not ( = ?auto_587665 ?auto_587666 ) ) ( not ( = ?auto_587665 ?auto_587667 ) ) ( not ( = ?auto_587665 ?auto_587668 ) ) ( not ( = ?auto_587665 ?auto_587669 ) ) ( not ( = ?auto_587665 ?auto_587670 ) ) ( not ( = ?auto_587665 ?auto_587671 ) ) ( not ( = ?auto_587666 ?auto_587667 ) ) ( not ( = ?auto_587666 ?auto_587668 ) ) ( not ( = ?auto_587666 ?auto_587669 ) ) ( not ( = ?auto_587666 ?auto_587670 ) ) ( not ( = ?auto_587666 ?auto_587671 ) ) ( not ( = ?auto_587667 ?auto_587668 ) ) ( not ( = ?auto_587667 ?auto_587669 ) ) ( not ( = ?auto_587667 ?auto_587670 ) ) ( not ( = ?auto_587667 ?auto_587671 ) ) ( not ( = ?auto_587668 ?auto_587669 ) ) ( not ( = ?auto_587668 ?auto_587670 ) ) ( not ( = ?auto_587668 ?auto_587671 ) ) ( not ( = ?auto_587669 ?auto_587670 ) ) ( not ( = ?auto_587669 ?auto_587671 ) ) ( not ( = ?auto_587670 ?auto_587671 ) ) ( CLEAR ?auto_587668 ) ( ON ?auto_587669 ?auto_587670 ) ( CLEAR ?auto_587669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_587657 ?auto_587658 ?auto_587659 ?auto_587660 ?auto_587661 ?auto_587662 ?auto_587663 ?auto_587664 ?auto_587665 ?auto_587666 ?auto_587667 ?auto_587668 ?auto_587669 )
      ( MAKE-14PILE ?auto_587657 ?auto_587658 ?auto_587659 ?auto_587660 ?auto_587661 ?auto_587662 ?auto_587663 ?auto_587664 ?auto_587665 ?auto_587666 ?auto_587667 ?auto_587668 ?auto_587669 ?auto_587670 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_587715 - BLOCK
      ?auto_587716 - BLOCK
      ?auto_587717 - BLOCK
      ?auto_587718 - BLOCK
      ?auto_587719 - BLOCK
      ?auto_587720 - BLOCK
      ?auto_587721 - BLOCK
      ?auto_587722 - BLOCK
      ?auto_587723 - BLOCK
      ?auto_587724 - BLOCK
      ?auto_587725 - BLOCK
      ?auto_587726 - BLOCK
      ?auto_587727 - BLOCK
      ?auto_587728 - BLOCK
    )
    :vars
    (
      ?auto_587729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587728 ?auto_587729 ) ( ON-TABLE ?auto_587715 ) ( ON ?auto_587716 ?auto_587715 ) ( ON ?auto_587717 ?auto_587716 ) ( ON ?auto_587718 ?auto_587717 ) ( ON ?auto_587719 ?auto_587718 ) ( ON ?auto_587720 ?auto_587719 ) ( ON ?auto_587721 ?auto_587720 ) ( ON ?auto_587722 ?auto_587721 ) ( ON ?auto_587723 ?auto_587722 ) ( ON ?auto_587724 ?auto_587723 ) ( ON ?auto_587725 ?auto_587724 ) ( not ( = ?auto_587715 ?auto_587716 ) ) ( not ( = ?auto_587715 ?auto_587717 ) ) ( not ( = ?auto_587715 ?auto_587718 ) ) ( not ( = ?auto_587715 ?auto_587719 ) ) ( not ( = ?auto_587715 ?auto_587720 ) ) ( not ( = ?auto_587715 ?auto_587721 ) ) ( not ( = ?auto_587715 ?auto_587722 ) ) ( not ( = ?auto_587715 ?auto_587723 ) ) ( not ( = ?auto_587715 ?auto_587724 ) ) ( not ( = ?auto_587715 ?auto_587725 ) ) ( not ( = ?auto_587715 ?auto_587726 ) ) ( not ( = ?auto_587715 ?auto_587727 ) ) ( not ( = ?auto_587715 ?auto_587728 ) ) ( not ( = ?auto_587715 ?auto_587729 ) ) ( not ( = ?auto_587716 ?auto_587717 ) ) ( not ( = ?auto_587716 ?auto_587718 ) ) ( not ( = ?auto_587716 ?auto_587719 ) ) ( not ( = ?auto_587716 ?auto_587720 ) ) ( not ( = ?auto_587716 ?auto_587721 ) ) ( not ( = ?auto_587716 ?auto_587722 ) ) ( not ( = ?auto_587716 ?auto_587723 ) ) ( not ( = ?auto_587716 ?auto_587724 ) ) ( not ( = ?auto_587716 ?auto_587725 ) ) ( not ( = ?auto_587716 ?auto_587726 ) ) ( not ( = ?auto_587716 ?auto_587727 ) ) ( not ( = ?auto_587716 ?auto_587728 ) ) ( not ( = ?auto_587716 ?auto_587729 ) ) ( not ( = ?auto_587717 ?auto_587718 ) ) ( not ( = ?auto_587717 ?auto_587719 ) ) ( not ( = ?auto_587717 ?auto_587720 ) ) ( not ( = ?auto_587717 ?auto_587721 ) ) ( not ( = ?auto_587717 ?auto_587722 ) ) ( not ( = ?auto_587717 ?auto_587723 ) ) ( not ( = ?auto_587717 ?auto_587724 ) ) ( not ( = ?auto_587717 ?auto_587725 ) ) ( not ( = ?auto_587717 ?auto_587726 ) ) ( not ( = ?auto_587717 ?auto_587727 ) ) ( not ( = ?auto_587717 ?auto_587728 ) ) ( not ( = ?auto_587717 ?auto_587729 ) ) ( not ( = ?auto_587718 ?auto_587719 ) ) ( not ( = ?auto_587718 ?auto_587720 ) ) ( not ( = ?auto_587718 ?auto_587721 ) ) ( not ( = ?auto_587718 ?auto_587722 ) ) ( not ( = ?auto_587718 ?auto_587723 ) ) ( not ( = ?auto_587718 ?auto_587724 ) ) ( not ( = ?auto_587718 ?auto_587725 ) ) ( not ( = ?auto_587718 ?auto_587726 ) ) ( not ( = ?auto_587718 ?auto_587727 ) ) ( not ( = ?auto_587718 ?auto_587728 ) ) ( not ( = ?auto_587718 ?auto_587729 ) ) ( not ( = ?auto_587719 ?auto_587720 ) ) ( not ( = ?auto_587719 ?auto_587721 ) ) ( not ( = ?auto_587719 ?auto_587722 ) ) ( not ( = ?auto_587719 ?auto_587723 ) ) ( not ( = ?auto_587719 ?auto_587724 ) ) ( not ( = ?auto_587719 ?auto_587725 ) ) ( not ( = ?auto_587719 ?auto_587726 ) ) ( not ( = ?auto_587719 ?auto_587727 ) ) ( not ( = ?auto_587719 ?auto_587728 ) ) ( not ( = ?auto_587719 ?auto_587729 ) ) ( not ( = ?auto_587720 ?auto_587721 ) ) ( not ( = ?auto_587720 ?auto_587722 ) ) ( not ( = ?auto_587720 ?auto_587723 ) ) ( not ( = ?auto_587720 ?auto_587724 ) ) ( not ( = ?auto_587720 ?auto_587725 ) ) ( not ( = ?auto_587720 ?auto_587726 ) ) ( not ( = ?auto_587720 ?auto_587727 ) ) ( not ( = ?auto_587720 ?auto_587728 ) ) ( not ( = ?auto_587720 ?auto_587729 ) ) ( not ( = ?auto_587721 ?auto_587722 ) ) ( not ( = ?auto_587721 ?auto_587723 ) ) ( not ( = ?auto_587721 ?auto_587724 ) ) ( not ( = ?auto_587721 ?auto_587725 ) ) ( not ( = ?auto_587721 ?auto_587726 ) ) ( not ( = ?auto_587721 ?auto_587727 ) ) ( not ( = ?auto_587721 ?auto_587728 ) ) ( not ( = ?auto_587721 ?auto_587729 ) ) ( not ( = ?auto_587722 ?auto_587723 ) ) ( not ( = ?auto_587722 ?auto_587724 ) ) ( not ( = ?auto_587722 ?auto_587725 ) ) ( not ( = ?auto_587722 ?auto_587726 ) ) ( not ( = ?auto_587722 ?auto_587727 ) ) ( not ( = ?auto_587722 ?auto_587728 ) ) ( not ( = ?auto_587722 ?auto_587729 ) ) ( not ( = ?auto_587723 ?auto_587724 ) ) ( not ( = ?auto_587723 ?auto_587725 ) ) ( not ( = ?auto_587723 ?auto_587726 ) ) ( not ( = ?auto_587723 ?auto_587727 ) ) ( not ( = ?auto_587723 ?auto_587728 ) ) ( not ( = ?auto_587723 ?auto_587729 ) ) ( not ( = ?auto_587724 ?auto_587725 ) ) ( not ( = ?auto_587724 ?auto_587726 ) ) ( not ( = ?auto_587724 ?auto_587727 ) ) ( not ( = ?auto_587724 ?auto_587728 ) ) ( not ( = ?auto_587724 ?auto_587729 ) ) ( not ( = ?auto_587725 ?auto_587726 ) ) ( not ( = ?auto_587725 ?auto_587727 ) ) ( not ( = ?auto_587725 ?auto_587728 ) ) ( not ( = ?auto_587725 ?auto_587729 ) ) ( not ( = ?auto_587726 ?auto_587727 ) ) ( not ( = ?auto_587726 ?auto_587728 ) ) ( not ( = ?auto_587726 ?auto_587729 ) ) ( not ( = ?auto_587727 ?auto_587728 ) ) ( not ( = ?auto_587727 ?auto_587729 ) ) ( not ( = ?auto_587728 ?auto_587729 ) ) ( ON ?auto_587727 ?auto_587728 ) ( CLEAR ?auto_587725 ) ( ON ?auto_587726 ?auto_587727 ) ( CLEAR ?auto_587726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_587715 ?auto_587716 ?auto_587717 ?auto_587718 ?auto_587719 ?auto_587720 ?auto_587721 ?auto_587722 ?auto_587723 ?auto_587724 ?auto_587725 ?auto_587726 )
      ( MAKE-14PILE ?auto_587715 ?auto_587716 ?auto_587717 ?auto_587718 ?auto_587719 ?auto_587720 ?auto_587721 ?auto_587722 ?auto_587723 ?auto_587724 ?auto_587725 ?auto_587726 ?auto_587727 ?auto_587728 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_587773 - BLOCK
      ?auto_587774 - BLOCK
      ?auto_587775 - BLOCK
      ?auto_587776 - BLOCK
      ?auto_587777 - BLOCK
      ?auto_587778 - BLOCK
      ?auto_587779 - BLOCK
      ?auto_587780 - BLOCK
      ?auto_587781 - BLOCK
      ?auto_587782 - BLOCK
      ?auto_587783 - BLOCK
      ?auto_587784 - BLOCK
      ?auto_587785 - BLOCK
      ?auto_587786 - BLOCK
    )
    :vars
    (
      ?auto_587787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587786 ?auto_587787 ) ( ON-TABLE ?auto_587773 ) ( ON ?auto_587774 ?auto_587773 ) ( ON ?auto_587775 ?auto_587774 ) ( ON ?auto_587776 ?auto_587775 ) ( ON ?auto_587777 ?auto_587776 ) ( ON ?auto_587778 ?auto_587777 ) ( ON ?auto_587779 ?auto_587778 ) ( ON ?auto_587780 ?auto_587779 ) ( ON ?auto_587781 ?auto_587780 ) ( ON ?auto_587782 ?auto_587781 ) ( not ( = ?auto_587773 ?auto_587774 ) ) ( not ( = ?auto_587773 ?auto_587775 ) ) ( not ( = ?auto_587773 ?auto_587776 ) ) ( not ( = ?auto_587773 ?auto_587777 ) ) ( not ( = ?auto_587773 ?auto_587778 ) ) ( not ( = ?auto_587773 ?auto_587779 ) ) ( not ( = ?auto_587773 ?auto_587780 ) ) ( not ( = ?auto_587773 ?auto_587781 ) ) ( not ( = ?auto_587773 ?auto_587782 ) ) ( not ( = ?auto_587773 ?auto_587783 ) ) ( not ( = ?auto_587773 ?auto_587784 ) ) ( not ( = ?auto_587773 ?auto_587785 ) ) ( not ( = ?auto_587773 ?auto_587786 ) ) ( not ( = ?auto_587773 ?auto_587787 ) ) ( not ( = ?auto_587774 ?auto_587775 ) ) ( not ( = ?auto_587774 ?auto_587776 ) ) ( not ( = ?auto_587774 ?auto_587777 ) ) ( not ( = ?auto_587774 ?auto_587778 ) ) ( not ( = ?auto_587774 ?auto_587779 ) ) ( not ( = ?auto_587774 ?auto_587780 ) ) ( not ( = ?auto_587774 ?auto_587781 ) ) ( not ( = ?auto_587774 ?auto_587782 ) ) ( not ( = ?auto_587774 ?auto_587783 ) ) ( not ( = ?auto_587774 ?auto_587784 ) ) ( not ( = ?auto_587774 ?auto_587785 ) ) ( not ( = ?auto_587774 ?auto_587786 ) ) ( not ( = ?auto_587774 ?auto_587787 ) ) ( not ( = ?auto_587775 ?auto_587776 ) ) ( not ( = ?auto_587775 ?auto_587777 ) ) ( not ( = ?auto_587775 ?auto_587778 ) ) ( not ( = ?auto_587775 ?auto_587779 ) ) ( not ( = ?auto_587775 ?auto_587780 ) ) ( not ( = ?auto_587775 ?auto_587781 ) ) ( not ( = ?auto_587775 ?auto_587782 ) ) ( not ( = ?auto_587775 ?auto_587783 ) ) ( not ( = ?auto_587775 ?auto_587784 ) ) ( not ( = ?auto_587775 ?auto_587785 ) ) ( not ( = ?auto_587775 ?auto_587786 ) ) ( not ( = ?auto_587775 ?auto_587787 ) ) ( not ( = ?auto_587776 ?auto_587777 ) ) ( not ( = ?auto_587776 ?auto_587778 ) ) ( not ( = ?auto_587776 ?auto_587779 ) ) ( not ( = ?auto_587776 ?auto_587780 ) ) ( not ( = ?auto_587776 ?auto_587781 ) ) ( not ( = ?auto_587776 ?auto_587782 ) ) ( not ( = ?auto_587776 ?auto_587783 ) ) ( not ( = ?auto_587776 ?auto_587784 ) ) ( not ( = ?auto_587776 ?auto_587785 ) ) ( not ( = ?auto_587776 ?auto_587786 ) ) ( not ( = ?auto_587776 ?auto_587787 ) ) ( not ( = ?auto_587777 ?auto_587778 ) ) ( not ( = ?auto_587777 ?auto_587779 ) ) ( not ( = ?auto_587777 ?auto_587780 ) ) ( not ( = ?auto_587777 ?auto_587781 ) ) ( not ( = ?auto_587777 ?auto_587782 ) ) ( not ( = ?auto_587777 ?auto_587783 ) ) ( not ( = ?auto_587777 ?auto_587784 ) ) ( not ( = ?auto_587777 ?auto_587785 ) ) ( not ( = ?auto_587777 ?auto_587786 ) ) ( not ( = ?auto_587777 ?auto_587787 ) ) ( not ( = ?auto_587778 ?auto_587779 ) ) ( not ( = ?auto_587778 ?auto_587780 ) ) ( not ( = ?auto_587778 ?auto_587781 ) ) ( not ( = ?auto_587778 ?auto_587782 ) ) ( not ( = ?auto_587778 ?auto_587783 ) ) ( not ( = ?auto_587778 ?auto_587784 ) ) ( not ( = ?auto_587778 ?auto_587785 ) ) ( not ( = ?auto_587778 ?auto_587786 ) ) ( not ( = ?auto_587778 ?auto_587787 ) ) ( not ( = ?auto_587779 ?auto_587780 ) ) ( not ( = ?auto_587779 ?auto_587781 ) ) ( not ( = ?auto_587779 ?auto_587782 ) ) ( not ( = ?auto_587779 ?auto_587783 ) ) ( not ( = ?auto_587779 ?auto_587784 ) ) ( not ( = ?auto_587779 ?auto_587785 ) ) ( not ( = ?auto_587779 ?auto_587786 ) ) ( not ( = ?auto_587779 ?auto_587787 ) ) ( not ( = ?auto_587780 ?auto_587781 ) ) ( not ( = ?auto_587780 ?auto_587782 ) ) ( not ( = ?auto_587780 ?auto_587783 ) ) ( not ( = ?auto_587780 ?auto_587784 ) ) ( not ( = ?auto_587780 ?auto_587785 ) ) ( not ( = ?auto_587780 ?auto_587786 ) ) ( not ( = ?auto_587780 ?auto_587787 ) ) ( not ( = ?auto_587781 ?auto_587782 ) ) ( not ( = ?auto_587781 ?auto_587783 ) ) ( not ( = ?auto_587781 ?auto_587784 ) ) ( not ( = ?auto_587781 ?auto_587785 ) ) ( not ( = ?auto_587781 ?auto_587786 ) ) ( not ( = ?auto_587781 ?auto_587787 ) ) ( not ( = ?auto_587782 ?auto_587783 ) ) ( not ( = ?auto_587782 ?auto_587784 ) ) ( not ( = ?auto_587782 ?auto_587785 ) ) ( not ( = ?auto_587782 ?auto_587786 ) ) ( not ( = ?auto_587782 ?auto_587787 ) ) ( not ( = ?auto_587783 ?auto_587784 ) ) ( not ( = ?auto_587783 ?auto_587785 ) ) ( not ( = ?auto_587783 ?auto_587786 ) ) ( not ( = ?auto_587783 ?auto_587787 ) ) ( not ( = ?auto_587784 ?auto_587785 ) ) ( not ( = ?auto_587784 ?auto_587786 ) ) ( not ( = ?auto_587784 ?auto_587787 ) ) ( not ( = ?auto_587785 ?auto_587786 ) ) ( not ( = ?auto_587785 ?auto_587787 ) ) ( not ( = ?auto_587786 ?auto_587787 ) ) ( ON ?auto_587785 ?auto_587786 ) ( ON ?auto_587784 ?auto_587785 ) ( CLEAR ?auto_587782 ) ( ON ?auto_587783 ?auto_587784 ) ( CLEAR ?auto_587783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_587773 ?auto_587774 ?auto_587775 ?auto_587776 ?auto_587777 ?auto_587778 ?auto_587779 ?auto_587780 ?auto_587781 ?auto_587782 ?auto_587783 )
      ( MAKE-14PILE ?auto_587773 ?auto_587774 ?auto_587775 ?auto_587776 ?auto_587777 ?auto_587778 ?auto_587779 ?auto_587780 ?auto_587781 ?auto_587782 ?auto_587783 ?auto_587784 ?auto_587785 ?auto_587786 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_587831 - BLOCK
      ?auto_587832 - BLOCK
      ?auto_587833 - BLOCK
      ?auto_587834 - BLOCK
      ?auto_587835 - BLOCK
      ?auto_587836 - BLOCK
      ?auto_587837 - BLOCK
      ?auto_587838 - BLOCK
      ?auto_587839 - BLOCK
      ?auto_587840 - BLOCK
      ?auto_587841 - BLOCK
      ?auto_587842 - BLOCK
      ?auto_587843 - BLOCK
      ?auto_587844 - BLOCK
    )
    :vars
    (
      ?auto_587845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587844 ?auto_587845 ) ( ON-TABLE ?auto_587831 ) ( ON ?auto_587832 ?auto_587831 ) ( ON ?auto_587833 ?auto_587832 ) ( ON ?auto_587834 ?auto_587833 ) ( ON ?auto_587835 ?auto_587834 ) ( ON ?auto_587836 ?auto_587835 ) ( ON ?auto_587837 ?auto_587836 ) ( ON ?auto_587838 ?auto_587837 ) ( ON ?auto_587839 ?auto_587838 ) ( not ( = ?auto_587831 ?auto_587832 ) ) ( not ( = ?auto_587831 ?auto_587833 ) ) ( not ( = ?auto_587831 ?auto_587834 ) ) ( not ( = ?auto_587831 ?auto_587835 ) ) ( not ( = ?auto_587831 ?auto_587836 ) ) ( not ( = ?auto_587831 ?auto_587837 ) ) ( not ( = ?auto_587831 ?auto_587838 ) ) ( not ( = ?auto_587831 ?auto_587839 ) ) ( not ( = ?auto_587831 ?auto_587840 ) ) ( not ( = ?auto_587831 ?auto_587841 ) ) ( not ( = ?auto_587831 ?auto_587842 ) ) ( not ( = ?auto_587831 ?auto_587843 ) ) ( not ( = ?auto_587831 ?auto_587844 ) ) ( not ( = ?auto_587831 ?auto_587845 ) ) ( not ( = ?auto_587832 ?auto_587833 ) ) ( not ( = ?auto_587832 ?auto_587834 ) ) ( not ( = ?auto_587832 ?auto_587835 ) ) ( not ( = ?auto_587832 ?auto_587836 ) ) ( not ( = ?auto_587832 ?auto_587837 ) ) ( not ( = ?auto_587832 ?auto_587838 ) ) ( not ( = ?auto_587832 ?auto_587839 ) ) ( not ( = ?auto_587832 ?auto_587840 ) ) ( not ( = ?auto_587832 ?auto_587841 ) ) ( not ( = ?auto_587832 ?auto_587842 ) ) ( not ( = ?auto_587832 ?auto_587843 ) ) ( not ( = ?auto_587832 ?auto_587844 ) ) ( not ( = ?auto_587832 ?auto_587845 ) ) ( not ( = ?auto_587833 ?auto_587834 ) ) ( not ( = ?auto_587833 ?auto_587835 ) ) ( not ( = ?auto_587833 ?auto_587836 ) ) ( not ( = ?auto_587833 ?auto_587837 ) ) ( not ( = ?auto_587833 ?auto_587838 ) ) ( not ( = ?auto_587833 ?auto_587839 ) ) ( not ( = ?auto_587833 ?auto_587840 ) ) ( not ( = ?auto_587833 ?auto_587841 ) ) ( not ( = ?auto_587833 ?auto_587842 ) ) ( not ( = ?auto_587833 ?auto_587843 ) ) ( not ( = ?auto_587833 ?auto_587844 ) ) ( not ( = ?auto_587833 ?auto_587845 ) ) ( not ( = ?auto_587834 ?auto_587835 ) ) ( not ( = ?auto_587834 ?auto_587836 ) ) ( not ( = ?auto_587834 ?auto_587837 ) ) ( not ( = ?auto_587834 ?auto_587838 ) ) ( not ( = ?auto_587834 ?auto_587839 ) ) ( not ( = ?auto_587834 ?auto_587840 ) ) ( not ( = ?auto_587834 ?auto_587841 ) ) ( not ( = ?auto_587834 ?auto_587842 ) ) ( not ( = ?auto_587834 ?auto_587843 ) ) ( not ( = ?auto_587834 ?auto_587844 ) ) ( not ( = ?auto_587834 ?auto_587845 ) ) ( not ( = ?auto_587835 ?auto_587836 ) ) ( not ( = ?auto_587835 ?auto_587837 ) ) ( not ( = ?auto_587835 ?auto_587838 ) ) ( not ( = ?auto_587835 ?auto_587839 ) ) ( not ( = ?auto_587835 ?auto_587840 ) ) ( not ( = ?auto_587835 ?auto_587841 ) ) ( not ( = ?auto_587835 ?auto_587842 ) ) ( not ( = ?auto_587835 ?auto_587843 ) ) ( not ( = ?auto_587835 ?auto_587844 ) ) ( not ( = ?auto_587835 ?auto_587845 ) ) ( not ( = ?auto_587836 ?auto_587837 ) ) ( not ( = ?auto_587836 ?auto_587838 ) ) ( not ( = ?auto_587836 ?auto_587839 ) ) ( not ( = ?auto_587836 ?auto_587840 ) ) ( not ( = ?auto_587836 ?auto_587841 ) ) ( not ( = ?auto_587836 ?auto_587842 ) ) ( not ( = ?auto_587836 ?auto_587843 ) ) ( not ( = ?auto_587836 ?auto_587844 ) ) ( not ( = ?auto_587836 ?auto_587845 ) ) ( not ( = ?auto_587837 ?auto_587838 ) ) ( not ( = ?auto_587837 ?auto_587839 ) ) ( not ( = ?auto_587837 ?auto_587840 ) ) ( not ( = ?auto_587837 ?auto_587841 ) ) ( not ( = ?auto_587837 ?auto_587842 ) ) ( not ( = ?auto_587837 ?auto_587843 ) ) ( not ( = ?auto_587837 ?auto_587844 ) ) ( not ( = ?auto_587837 ?auto_587845 ) ) ( not ( = ?auto_587838 ?auto_587839 ) ) ( not ( = ?auto_587838 ?auto_587840 ) ) ( not ( = ?auto_587838 ?auto_587841 ) ) ( not ( = ?auto_587838 ?auto_587842 ) ) ( not ( = ?auto_587838 ?auto_587843 ) ) ( not ( = ?auto_587838 ?auto_587844 ) ) ( not ( = ?auto_587838 ?auto_587845 ) ) ( not ( = ?auto_587839 ?auto_587840 ) ) ( not ( = ?auto_587839 ?auto_587841 ) ) ( not ( = ?auto_587839 ?auto_587842 ) ) ( not ( = ?auto_587839 ?auto_587843 ) ) ( not ( = ?auto_587839 ?auto_587844 ) ) ( not ( = ?auto_587839 ?auto_587845 ) ) ( not ( = ?auto_587840 ?auto_587841 ) ) ( not ( = ?auto_587840 ?auto_587842 ) ) ( not ( = ?auto_587840 ?auto_587843 ) ) ( not ( = ?auto_587840 ?auto_587844 ) ) ( not ( = ?auto_587840 ?auto_587845 ) ) ( not ( = ?auto_587841 ?auto_587842 ) ) ( not ( = ?auto_587841 ?auto_587843 ) ) ( not ( = ?auto_587841 ?auto_587844 ) ) ( not ( = ?auto_587841 ?auto_587845 ) ) ( not ( = ?auto_587842 ?auto_587843 ) ) ( not ( = ?auto_587842 ?auto_587844 ) ) ( not ( = ?auto_587842 ?auto_587845 ) ) ( not ( = ?auto_587843 ?auto_587844 ) ) ( not ( = ?auto_587843 ?auto_587845 ) ) ( not ( = ?auto_587844 ?auto_587845 ) ) ( ON ?auto_587843 ?auto_587844 ) ( ON ?auto_587842 ?auto_587843 ) ( ON ?auto_587841 ?auto_587842 ) ( CLEAR ?auto_587839 ) ( ON ?auto_587840 ?auto_587841 ) ( CLEAR ?auto_587840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_587831 ?auto_587832 ?auto_587833 ?auto_587834 ?auto_587835 ?auto_587836 ?auto_587837 ?auto_587838 ?auto_587839 ?auto_587840 )
      ( MAKE-14PILE ?auto_587831 ?auto_587832 ?auto_587833 ?auto_587834 ?auto_587835 ?auto_587836 ?auto_587837 ?auto_587838 ?auto_587839 ?auto_587840 ?auto_587841 ?auto_587842 ?auto_587843 ?auto_587844 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_587889 - BLOCK
      ?auto_587890 - BLOCK
      ?auto_587891 - BLOCK
      ?auto_587892 - BLOCK
      ?auto_587893 - BLOCK
      ?auto_587894 - BLOCK
      ?auto_587895 - BLOCK
      ?auto_587896 - BLOCK
      ?auto_587897 - BLOCK
      ?auto_587898 - BLOCK
      ?auto_587899 - BLOCK
      ?auto_587900 - BLOCK
      ?auto_587901 - BLOCK
      ?auto_587902 - BLOCK
    )
    :vars
    (
      ?auto_587903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587902 ?auto_587903 ) ( ON-TABLE ?auto_587889 ) ( ON ?auto_587890 ?auto_587889 ) ( ON ?auto_587891 ?auto_587890 ) ( ON ?auto_587892 ?auto_587891 ) ( ON ?auto_587893 ?auto_587892 ) ( ON ?auto_587894 ?auto_587893 ) ( ON ?auto_587895 ?auto_587894 ) ( ON ?auto_587896 ?auto_587895 ) ( not ( = ?auto_587889 ?auto_587890 ) ) ( not ( = ?auto_587889 ?auto_587891 ) ) ( not ( = ?auto_587889 ?auto_587892 ) ) ( not ( = ?auto_587889 ?auto_587893 ) ) ( not ( = ?auto_587889 ?auto_587894 ) ) ( not ( = ?auto_587889 ?auto_587895 ) ) ( not ( = ?auto_587889 ?auto_587896 ) ) ( not ( = ?auto_587889 ?auto_587897 ) ) ( not ( = ?auto_587889 ?auto_587898 ) ) ( not ( = ?auto_587889 ?auto_587899 ) ) ( not ( = ?auto_587889 ?auto_587900 ) ) ( not ( = ?auto_587889 ?auto_587901 ) ) ( not ( = ?auto_587889 ?auto_587902 ) ) ( not ( = ?auto_587889 ?auto_587903 ) ) ( not ( = ?auto_587890 ?auto_587891 ) ) ( not ( = ?auto_587890 ?auto_587892 ) ) ( not ( = ?auto_587890 ?auto_587893 ) ) ( not ( = ?auto_587890 ?auto_587894 ) ) ( not ( = ?auto_587890 ?auto_587895 ) ) ( not ( = ?auto_587890 ?auto_587896 ) ) ( not ( = ?auto_587890 ?auto_587897 ) ) ( not ( = ?auto_587890 ?auto_587898 ) ) ( not ( = ?auto_587890 ?auto_587899 ) ) ( not ( = ?auto_587890 ?auto_587900 ) ) ( not ( = ?auto_587890 ?auto_587901 ) ) ( not ( = ?auto_587890 ?auto_587902 ) ) ( not ( = ?auto_587890 ?auto_587903 ) ) ( not ( = ?auto_587891 ?auto_587892 ) ) ( not ( = ?auto_587891 ?auto_587893 ) ) ( not ( = ?auto_587891 ?auto_587894 ) ) ( not ( = ?auto_587891 ?auto_587895 ) ) ( not ( = ?auto_587891 ?auto_587896 ) ) ( not ( = ?auto_587891 ?auto_587897 ) ) ( not ( = ?auto_587891 ?auto_587898 ) ) ( not ( = ?auto_587891 ?auto_587899 ) ) ( not ( = ?auto_587891 ?auto_587900 ) ) ( not ( = ?auto_587891 ?auto_587901 ) ) ( not ( = ?auto_587891 ?auto_587902 ) ) ( not ( = ?auto_587891 ?auto_587903 ) ) ( not ( = ?auto_587892 ?auto_587893 ) ) ( not ( = ?auto_587892 ?auto_587894 ) ) ( not ( = ?auto_587892 ?auto_587895 ) ) ( not ( = ?auto_587892 ?auto_587896 ) ) ( not ( = ?auto_587892 ?auto_587897 ) ) ( not ( = ?auto_587892 ?auto_587898 ) ) ( not ( = ?auto_587892 ?auto_587899 ) ) ( not ( = ?auto_587892 ?auto_587900 ) ) ( not ( = ?auto_587892 ?auto_587901 ) ) ( not ( = ?auto_587892 ?auto_587902 ) ) ( not ( = ?auto_587892 ?auto_587903 ) ) ( not ( = ?auto_587893 ?auto_587894 ) ) ( not ( = ?auto_587893 ?auto_587895 ) ) ( not ( = ?auto_587893 ?auto_587896 ) ) ( not ( = ?auto_587893 ?auto_587897 ) ) ( not ( = ?auto_587893 ?auto_587898 ) ) ( not ( = ?auto_587893 ?auto_587899 ) ) ( not ( = ?auto_587893 ?auto_587900 ) ) ( not ( = ?auto_587893 ?auto_587901 ) ) ( not ( = ?auto_587893 ?auto_587902 ) ) ( not ( = ?auto_587893 ?auto_587903 ) ) ( not ( = ?auto_587894 ?auto_587895 ) ) ( not ( = ?auto_587894 ?auto_587896 ) ) ( not ( = ?auto_587894 ?auto_587897 ) ) ( not ( = ?auto_587894 ?auto_587898 ) ) ( not ( = ?auto_587894 ?auto_587899 ) ) ( not ( = ?auto_587894 ?auto_587900 ) ) ( not ( = ?auto_587894 ?auto_587901 ) ) ( not ( = ?auto_587894 ?auto_587902 ) ) ( not ( = ?auto_587894 ?auto_587903 ) ) ( not ( = ?auto_587895 ?auto_587896 ) ) ( not ( = ?auto_587895 ?auto_587897 ) ) ( not ( = ?auto_587895 ?auto_587898 ) ) ( not ( = ?auto_587895 ?auto_587899 ) ) ( not ( = ?auto_587895 ?auto_587900 ) ) ( not ( = ?auto_587895 ?auto_587901 ) ) ( not ( = ?auto_587895 ?auto_587902 ) ) ( not ( = ?auto_587895 ?auto_587903 ) ) ( not ( = ?auto_587896 ?auto_587897 ) ) ( not ( = ?auto_587896 ?auto_587898 ) ) ( not ( = ?auto_587896 ?auto_587899 ) ) ( not ( = ?auto_587896 ?auto_587900 ) ) ( not ( = ?auto_587896 ?auto_587901 ) ) ( not ( = ?auto_587896 ?auto_587902 ) ) ( not ( = ?auto_587896 ?auto_587903 ) ) ( not ( = ?auto_587897 ?auto_587898 ) ) ( not ( = ?auto_587897 ?auto_587899 ) ) ( not ( = ?auto_587897 ?auto_587900 ) ) ( not ( = ?auto_587897 ?auto_587901 ) ) ( not ( = ?auto_587897 ?auto_587902 ) ) ( not ( = ?auto_587897 ?auto_587903 ) ) ( not ( = ?auto_587898 ?auto_587899 ) ) ( not ( = ?auto_587898 ?auto_587900 ) ) ( not ( = ?auto_587898 ?auto_587901 ) ) ( not ( = ?auto_587898 ?auto_587902 ) ) ( not ( = ?auto_587898 ?auto_587903 ) ) ( not ( = ?auto_587899 ?auto_587900 ) ) ( not ( = ?auto_587899 ?auto_587901 ) ) ( not ( = ?auto_587899 ?auto_587902 ) ) ( not ( = ?auto_587899 ?auto_587903 ) ) ( not ( = ?auto_587900 ?auto_587901 ) ) ( not ( = ?auto_587900 ?auto_587902 ) ) ( not ( = ?auto_587900 ?auto_587903 ) ) ( not ( = ?auto_587901 ?auto_587902 ) ) ( not ( = ?auto_587901 ?auto_587903 ) ) ( not ( = ?auto_587902 ?auto_587903 ) ) ( ON ?auto_587901 ?auto_587902 ) ( ON ?auto_587900 ?auto_587901 ) ( ON ?auto_587899 ?auto_587900 ) ( ON ?auto_587898 ?auto_587899 ) ( CLEAR ?auto_587896 ) ( ON ?auto_587897 ?auto_587898 ) ( CLEAR ?auto_587897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_587889 ?auto_587890 ?auto_587891 ?auto_587892 ?auto_587893 ?auto_587894 ?auto_587895 ?auto_587896 ?auto_587897 )
      ( MAKE-14PILE ?auto_587889 ?auto_587890 ?auto_587891 ?auto_587892 ?auto_587893 ?auto_587894 ?auto_587895 ?auto_587896 ?auto_587897 ?auto_587898 ?auto_587899 ?auto_587900 ?auto_587901 ?auto_587902 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_587947 - BLOCK
      ?auto_587948 - BLOCK
      ?auto_587949 - BLOCK
      ?auto_587950 - BLOCK
      ?auto_587951 - BLOCK
      ?auto_587952 - BLOCK
      ?auto_587953 - BLOCK
      ?auto_587954 - BLOCK
      ?auto_587955 - BLOCK
      ?auto_587956 - BLOCK
      ?auto_587957 - BLOCK
      ?auto_587958 - BLOCK
      ?auto_587959 - BLOCK
      ?auto_587960 - BLOCK
    )
    :vars
    (
      ?auto_587961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_587960 ?auto_587961 ) ( ON-TABLE ?auto_587947 ) ( ON ?auto_587948 ?auto_587947 ) ( ON ?auto_587949 ?auto_587948 ) ( ON ?auto_587950 ?auto_587949 ) ( ON ?auto_587951 ?auto_587950 ) ( ON ?auto_587952 ?auto_587951 ) ( ON ?auto_587953 ?auto_587952 ) ( not ( = ?auto_587947 ?auto_587948 ) ) ( not ( = ?auto_587947 ?auto_587949 ) ) ( not ( = ?auto_587947 ?auto_587950 ) ) ( not ( = ?auto_587947 ?auto_587951 ) ) ( not ( = ?auto_587947 ?auto_587952 ) ) ( not ( = ?auto_587947 ?auto_587953 ) ) ( not ( = ?auto_587947 ?auto_587954 ) ) ( not ( = ?auto_587947 ?auto_587955 ) ) ( not ( = ?auto_587947 ?auto_587956 ) ) ( not ( = ?auto_587947 ?auto_587957 ) ) ( not ( = ?auto_587947 ?auto_587958 ) ) ( not ( = ?auto_587947 ?auto_587959 ) ) ( not ( = ?auto_587947 ?auto_587960 ) ) ( not ( = ?auto_587947 ?auto_587961 ) ) ( not ( = ?auto_587948 ?auto_587949 ) ) ( not ( = ?auto_587948 ?auto_587950 ) ) ( not ( = ?auto_587948 ?auto_587951 ) ) ( not ( = ?auto_587948 ?auto_587952 ) ) ( not ( = ?auto_587948 ?auto_587953 ) ) ( not ( = ?auto_587948 ?auto_587954 ) ) ( not ( = ?auto_587948 ?auto_587955 ) ) ( not ( = ?auto_587948 ?auto_587956 ) ) ( not ( = ?auto_587948 ?auto_587957 ) ) ( not ( = ?auto_587948 ?auto_587958 ) ) ( not ( = ?auto_587948 ?auto_587959 ) ) ( not ( = ?auto_587948 ?auto_587960 ) ) ( not ( = ?auto_587948 ?auto_587961 ) ) ( not ( = ?auto_587949 ?auto_587950 ) ) ( not ( = ?auto_587949 ?auto_587951 ) ) ( not ( = ?auto_587949 ?auto_587952 ) ) ( not ( = ?auto_587949 ?auto_587953 ) ) ( not ( = ?auto_587949 ?auto_587954 ) ) ( not ( = ?auto_587949 ?auto_587955 ) ) ( not ( = ?auto_587949 ?auto_587956 ) ) ( not ( = ?auto_587949 ?auto_587957 ) ) ( not ( = ?auto_587949 ?auto_587958 ) ) ( not ( = ?auto_587949 ?auto_587959 ) ) ( not ( = ?auto_587949 ?auto_587960 ) ) ( not ( = ?auto_587949 ?auto_587961 ) ) ( not ( = ?auto_587950 ?auto_587951 ) ) ( not ( = ?auto_587950 ?auto_587952 ) ) ( not ( = ?auto_587950 ?auto_587953 ) ) ( not ( = ?auto_587950 ?auto_587954 ) ) ( not ( = ?auto_587950 ?auto_587955 ) ) ( not ( = ?auto_587950 ?auto_587956 ) ) ( not ( = ?auto_587950 ?auto_587957 ) ) ( not ( = ?auto_587950 ?auto_587958 ) ) ( not ( = ?auto_587950 ?auto_587959 ) ) ( not ( = ?auto_587950 ?auto_587960 ) ) ( not ( = ?auto_587950 ?auto_587961 ) ) ( not ( = ?auto_587951 ?auto_587952 ) ) ( not ( = ?auto_587951 ?auto_587953 ) ) ( not ( = ?auto_587951 ?auto_587954 ) ) ( not ( = ?auto_587951 ?auto_587955 ) ) ( not ( = ?auto_587951 ?auto_587956 ) ) ( not ( = ?auto_587951 ?auto_587957 ) ) ( not ( = ?auto_587951 ?auto_587958 ) ) ( not ( = ?auto_587951 ?auto_587959 ) ) ( not ( = ?auto_587951 ?auto_587960 ) ) ( not ( = ?auto_587951 ?auto_587961 ) ) ( not ( = ?auto_587952 ?auto_587953 ) ) ( not ( = ?auto_587952 ?auto_587954 ) ) ( not ( = ?auto_587952 ?auto_587955 ) ) ( not ( = ?auto_587952 ?auto_587956 ) ) ( not ( = ?auto_587952 ?auto_587957 ) ) ( not ( = ?auto_587952 ?auto_587958 ) ) ( not ( = ?auto_587952 ?auto_587959 ) ) ( not ( = ?auto_587952 ?auto_587960 ) ) ( not ( = ?auto_587952 ?auto_587961 ) ) ( not ( = ?auto_587953 ?auto_587954 ) ) ( not ( = ?auto_587953 ?auto_587955 ) ) ( not ( = ?auto_587953 ?auto_587956 ) ) ( not ( = ?auto_587953 ?auto_587957 ) ) ( not ( = ?auto_587953 ?auto_587958 ) ) ( not ( = ?auto_587953 ?auto_587959 ) ) ( not ( = ?auto_587953 ?auto_587960 ) ) ( not ( = ?auto_587953 ?auto_587961 ) ) ( not ( = ?auto_587954 ?auto_587955 ) ) ( not ( = ?auto_587954 ?auto_587956 ) ) ( not ( = ?auto_587954 ?auto_587957 ) ) ( not ( = ?auto_587954 ?auto_587958 ) ) ( not ( = ?auto_587954 ?auto_587959 ) ) ( not ( = ?auto_587954 ?auto_587960 ) ) ( not ( = ?auto_587954 ?auto_587961 ) ) ( not ( = ?auto_587955 ?auto_587956 ) ) ( not ( = ?auto_587955 ?auto_587957 ) ) ( not ( = ?auto_587955 ?auto_587958 ) ) ( not ( = ?auto_587955 ?auto_587959 ) ) ( not ( = ?auto_587955 ?auto_587960 ) ) ( not ( = ?auto_587955 ?auto_587961 ) ) ( not ( = ?auto_587956 ?auto_587957 ) ) ( not ( = ?auto_587956 ?auto_587958 ) ) ( not ( = ?auto_587956 ?auto_587959 ) ) ( not ( = ?auto_587956 ?auto_587960 ) ) ( not ( = ?auto_587956 ?auto_587961 ) ) ( not ( = ?auto_587957 ?auto_587958 ) ) ( not ( = ?auto_587957 ?auto_587959 ) ) ( not ( = ?auto_587957 ?auto_587960 ) ) ( not ( = ?auto_587957 ?auto_587961 ) ) ( not ( = ?auto_587958 ?auto_587959 ) ) ( not ( = ?auto_587958 ?auto_587960 ) ) ( not ( = ?auto_587958 ?auto_587961 ) ) ( not ( = ?auto_587959 ?auto_587960 ) ) ( not ( = ?auto_587959 ?auto_587961 ) ) ( not ( = ?auto_587960 ?auto_587961 ) ) ( ON ?auto_587959 ?auto_587960 ) ( ON ?auto_587958 ?auto_587959 ) ( ON ?auto_587957 ?auto_587958 ) ( ON ?auto_587956 ?auto_587957 ) ( ON ?auto_587955 ?auto_587956 ) ( CLEAR ?auto_587953 ) ( ON ?auto_587954 ?auto_587955 ) ( CLEAR ?auto_587954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_587947 ?auto_587948 ?auto_587949 ?auto_587950 ?auto_587951 ?auto_587952 ?auto_587953 ?auto_587954 )
      ( MAKE-14PILE ?auto_587947 ?auto_587948 ?auto_587949 ?auto_587950 ?auto_587951 ?auto_587952 ?auto_587953 ?auto_587954 ?auto_587955 ?auto_587956 ?auto_587957 ?auto_587958 ?auto_587959 ?auto_587960 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_588005 - BLOCK
      ?auto_588006 - BLOCK
      ?auto_588007 - BLOCK
      ?auto_588008 - BLOCK
      ?auto_588009 - BLOCK
      ?auto_588010 - BLOCK
      ?auto_588011 - BLOCK
      ?auto_588012 - BLOCK
      ?auto_588013 - BLOCK
      ?auto_588014 - BLOCK
      ?auto_588015 - BLOCK
      ?auto_588016 - BLOCK
      ?auto_588017 - BLOCK
      ?auto_588018 - BLOCK
    )
    :vars
    (
      ?auto_588019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588018 ?auto_588019 ) ( ON-TABLE ?auto_588005 ) ( ON ?auto_588006 ?auto_588005 ) ( ON ?auto_588007 ?auto_588006 ) ( ON ?auto_588008 ?auto_588007 ) ( ON ?auto_588009 ?auto_588008 ) ( ON ?auto_588010 ?auto_588009 ) ( not ( = ?auto_588005 ?auto_588006 ) ) ( not ( = ?auto_588005 ?auto_588007 ) ) ( not ( = ?auto_588005 ?auto_588008 ) ) ( not ( = ?auto_588005 ?auto_588009 ) ) ( not ( = ?auto_588005 ?auto_588010 ) ) ( not ( = ?auto_588005 ?auto_588011 ) ) ( not ( = ?auto_588005 ?auto_588012 ) ) ( not ( = ?auto_588005 ?auto_588013 ) ) ( not ( = ?auto_588005 ?auto_588014 ) ) ( not ( = ?auto_588005 ?auto_588015 ) ) ( not ( = ?auto_588005 ?auto_588016 ) ) ( not ( = ?auto_588005 ?auto_588017 ) ) ( not ( = ?auto_588005 ?auto_588018 ) ) ( not ( = ?auto_588005 ?auto_588019 ) ) ( not ( = ?auto_588006 ?auto_588007 ) ) ( not ( = ?auto_588006 ?auto_588008 ) ) ( not ( = ?auto_588006 ?auto_588009 ) ) ( not ( = ?auto_588006 ?auto_588010 ) ) ( not ( = ?auto_588006 ?auto_588011 ) ) ( not ( = ?auto_588006 ?auto_588012 ) ) ( not ( = ?auto_588006 ?auto_588013 ) ) ( not ( = ?auto_588006 ?auto_588014 ) ) ( not ( = ?auto_588006 ?auto_588015 ) ) ( not ( = ?auto_588006 ?auto_588016 ) ) ( not ( = ?auto_588006 ?auto_588017 ) ) ( not ( = ?auto_588006 ?auto_588018 ) ) ( not ( = ?auto_588006 ?auto_588019 ) ) ( not ( = ?auto_588007 ?auto_588008 ) ) ( not ( = ?auto_588007 ?auto_588009 ) ) ( not ( = ?auto_588007 ?auto_588010 ) ) ( not ( = ?auto_588007 ?auto_588011 ) ) ( not ( = ?auto_588007 ?auto_588012 ) ) ( not ( = ?auto_588007 ?auto_588013 ) ) ( not ( = ?auto_588007 ?auto_588014 ) ) ( not ( = ?auto_588007 ?auto_588015 ) ) ( not ( = ?auto_588007 ?auto_588016 ) ) ( not ( = ?auto_588007 ?auto_588017 ) ) ( not ( = ?auto_588007 ?auto_588018 ) ) ( not ( = ?auto_588007 ?auto_588019 ) ) ( not ( = ?auto_588008 ?auto_588009 ) ) ( not ( = ?auto_588008 ?auto_588010 ) ) ( not ( = ?auto_588008 ?auto_588011 ) ) ( not ( = ?auto_588008 ?auto_588012 ) ) ( not ( = ?auto_588008 ?auto_588013 ) ) ( not ( = ?auto_588008 ?auto_588014 ) ) ( not ( = ?auto_588008 ?auto_588015 ) ) ( not ( = ?auto_588008 ?auto_588016 ) ) ( not ( = ?auto_588008 ?auto_588017 ) ) ( not ( = ?auto_588008 ?auto_588018 ) ) ( not ( = ?auto_588008 ?auto_588019 ) ) ( not ( = ?auto_588009 ?auto_588010 ) ) ( not ( = ?auto_588009 ?auto_588011 ) ) ( not ( = ?auto_588009 ?auto_588012 ) ) ( not ( = ?auto_588009 ?auto_588013 ) ) ( not ( = ?auto_588009 ?auto_588014 ) ) ( not ( = ?auto_588009 ?auto_588015 ) ) ( not ( = ?auto_588009 ?auto_588016 ) ) ( not ( = ?auto_588009 ?auto_588017 ) ) ( not ( = ?auto_588009 ?auto_588018 ) ) ( not ( = ?auto_588009 ?auto_588019 ) ) ( not ( = ?auto_588010 ?auto_588011 ) ) ( not ( = ?auto_588010 ?auto_588012 ) ) ( not ( = ?auto_588010 ?auto_588013 ) ) ( not ( = ?auto_588010 ?auto_588014 ) ) ( not ( = ?auto_588010 ?auto_588015 ) ) ( not ( = ?auto_588010 ?auto_588016 ) ) ( not ( = ?auto_588010 ?auto_588017 ) ) ( not ( = ?auto_588010 ?auto_588018 ) ) ( not ( = ?auto_588010 ?auto_588019 ) ) ( not ( = ?auto_588011 ?auto_588012 ) ) ( not ( = ?auto_588011 ?auto_588013 ) ) ( not ( = ?auto_588011 ?auto_588014 ) ) ( not ( = ?auto_588011 ?auto_588015 ) ) ( not ( = ?auto_588011 ?auto_588016 ) ) ( not ( = ?auto_588011 ?auto_588017 ) ) ( not ( = ?auto_588011 ?auto_588018 ) ) ( not ( = ?auto_588011 ?auto_588019 ) ) ( not ( = ?auto_588012 ?auto_588013 ) ) ( not ( = ?auto_588012 ?auto_588014 ) ) ( not ( = ?auto_588012 ?auto_588015 ) ) ( not ( = ?auto_588012 ?auto_588016 ) ) ( not ( = ?auto_588012 ?auto_588017 ) ) ( not ( = ?auto_588012 ?auto_588018 ) ) ( not ( = ?auto_588012 ?auto_588019 ) ) ( not ( = ?auto_588013 ?auto_588014 ) ) ( not ( = ?auto_588013 ?auto_588015 ) ) ( not ( = ?auto_588013 ?auto_588016 ) ) ( not ( = ?auto_588013 ?auto_588017 ) ) ( not ( = ?auto_588013 ?auto_588018 ) ) ( not ( = ?auto_588013 ?auto_588019 ) ) ( not ( = ?auto_588014 ?auto_588015 ) ) ( not ( = ?auto_588014 ?auto_588016 ) ) ( not ( = ?auto_588014 ?auto_588017 ) ) ( not ( = ?auto_588014 ?auto_588018 ) ) ( not ( = ?auto_588014 ?auto_588019 ) ) ( not ( = ?auto_588015 ?auto_588016 ) ) ( not ( = ?auto_588015 ?auto_588017 ) ) ( not ( = ?auto_588015 ?auto_588018 ) ) ( not ( = ?auto_588015 ?auto_588019 ) ) ( not ( = ?auto_588016 ?auto_588017 ) ) ( not ( = ?auto_588016 ?auto_588018 ) ) ( not ( = ?auto_588016 ?auto_588019 ) ) ( not ( = ?auto_588017 ?auto_588018 ) ) ( not ( = ?auto_588017 ?auto_588019 ) ) ( not ( = ?auto_588018 ?auto_588019 ) ) ( ON ?auto_588017 ?auto_588018 ) ( ON ?auto_588016 ?auto_588017 ) ( ON ?auto_588015 ?auto_588016 ) ( ON ?auto_588014 ?auto_588015 ) ( ON ?auto_588013 ?auto_588014 ) ( ON ?auto_588012 ?auto_588013 ) ( CLEAR ?auto_588010 ) ( ON ?auto_588011 ?auto_588012 ) ( CLEAR ?auto_588011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_588005 ?auto_588006 ?auto_588007 ?auto_588008 ?auto_588009 ?auto_588010 ?auto_588011 )
      ( MAKE-14PILE ?auto_588005 ?auto_588006 ?auto_588007 ?auto_588008 ?auto_588009 ?auto_588010 ?auto_588011 ?auto_588012 ?auto_588013 ?auto_588014 ?auto_588015 ?auto_588016 ?auto_588017 ?auto_588018 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_588063 - BLOCK
      ?auto_588064 - BLOCK
      ?auto_588065 - BLOCK
      ?auto_588066 - BLOCK
      ?auto_588067 - BLOCK
      ?auto_588068 - BLOCK
      ?auto_588069 - BLOCK
      ?auto_588070 - BLOCK
      ?auto_588071 - BLOCK
      ?auto_588072 - BLOCK
      ?auto_588073 - BLOCK
      ?auto_588074 - BLOCK
      ?auto_588075 - BLOCK
      ?auto_588076 - BLOCK
    )
    :vars
    (
      ?auto_588077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588076 ?auto_588077 ) ( ON-TABLE ?auto_588063 ) ( ON ?auto_588064 ?auto_588063 ) ( ON ?auto_588065 ?auto_588064 ) ( ON ?auto_588066 ?auto_588065 ) ( ON ?auto_588067 ?auto_588066 ) ( not ( = ?auto_588063 ?auto_588064 ) ) ( not ( = ?auto_588063 ?auto_588065 ) ) ( not ( = ?auto_588063 ?auto_588066 ) ) ( not ( = ?auto_588063 ?auto_588067 ) ) ( not ( = ?auto_588063 ?auto_588068 ) ) ( not ( = ?auto_588063 ?auto_588069 ) ) ( not ( = ?auto_588063 ?auto_588070 ) ) ( not ( = ?auto_588063 ?auto_588071 ) ) ( not ( = ?auto_588063 ?auto_588072 ) ) ( not ( = ?auto_588063 ?auto_588073 ) ) ( not ( = ?auto_588063 ?auto_588074 ) ) ( not ( = ?auto_588063 ?auto_588075 ) ) ( not ( = ?auto_588063 ?auto_588076 ) ) ( not ( = ?auto_588063 ?auto_588077 ) ) ( not ( = ?auto_588064 ?auto_588065 ) ) ( not ( = ?auto_588064 ?auto_588066 ) ) ( not ( = ?auto_588064 ?auto_588067 ) ) ( not ( = ?auto_588064 ?auto_588068 ) ) ( not ( = ?auto_588064 ?auto_588069 ) ) ( not ( = ?auto_588064 ?auto_588070 ) ) ( not ( = ?auto_588064 ?auto_588071 ) ) ( not ( = ?auto_588064 ?auto_588072 ) ) ( not ( = ?auto_588064 ?auto_588073 ) ) ( not ( = ?auto_588064 ?auto_588074 ) ) ( not ( = ?auto_588064 ?auto_588075 ) ) ( not ( = ?auto_588064 ?auto_588076 ) ) ( not ( = ?auto_588064 ?auto_588077 ) ) ( not ( = ?auto_588065 ?auto_588066 ) ) ( not ( = ?auto_588065 ?auto_588067 ) ) ( not ( = ?auto_588065 ?auto_588068 ) ) ( not ( = ?auto_588065 ?auto_588069 ) ) ( not ( = ?auto_588065 ?auto_588070 ) ) ( not ( = ?auto_588065 ?auto_588071 ) ) ( not ( = ?auto_588065 ?auto_588072 ) ) ( not ( = ?auto_588065 ?auto_588073 ) ) ( not ( = ?auto_588065 ?auto_588074 ) ) ( not ( = ?auto_588065 ?auto_588075 ) ) ( not ( = ?auto_588065 ?auto_588076 ) ) ( not ( = ?auto_588065 ?auto_588077 ) ) ( not ( = ?auto_588066 ?auto_588067 ) ) ( not ( = ?auto_588066 ?auto_588068 ) ) ( not ( = ?auto_588066 ?auto_588069 ) ) ( not ( = ?auto_588066 ?auto_588070 ) ) ( not ( = ?auto_588066 ?auto_588071 ) ) ( not ( = ?auto_588066 ?auto_588072 ) ) ( not ( = ?auto_588066 ?auto_588073 ) ) ( not ( = ?auto_588066 ?auto_588074 ) ) ( not ( = ?auto_588066 ?auto_588075 ) ) ( not ( = ?auto_588066 ?auto_588076 ) ) ( not ( = ?auto_588066 ?auto_588077 ) ) ( not ( = ?auto_588067 ?auto_588068 ) ) ( not ( = ?auto_588067 ?auto_588069 ) ) ( not ( = ?auto_588067 ?auto_588070 ) ) ( not ( = ?auto_588067 ?auto_588071 ) ) ( not ( = ?auto_588067 ?auto_588072 ) ) ( not ( = ?auto_588067 ?auto_588073 ) ) ( not ( = ?auto_588067 ?auto_588074 ) ) ( not ( = ?auto_588067 ?auto_588075 ) ) ( not ( = ?auto_588067 ?auto_588076 ) ) ( not ( = ?auto_588067 ?auto_588077 ) ) ( not ( = ?auto_588068 ?auto_588069 ) ) ( not ( = ?auto_588068 ?auto_588070 ) ) ( not ( = ?auto_588068 ?auto_588071 ) ) ( not ( = ?auto_588068 ?auto_588072 ) ) ( not ( = ?auto_588068 ?auto_588073 ) ) ( not ( = ?auto_588068 ?auto_588074 ) ) ( not ( = ?auto_588068 ?auto_588075 ) ) ( not ( = ?auto_588068 ?auto_588076 ) ) ( not ( = ?auto_588068 ?auto_588077 ) ) ( not ( = ?auto_588069 ?auto_588070 ) ) ( not ( = ?auto_588069 ?auto_588071 ) ) ( not ( = ?auto_588069 ?auto_588072 ) ) ( not ( = ?auto_588069 ?auto_588073 ) ) ( not ( = ?auto_588069 ?auto_588074 ) ) ( not ( = ?auto_588069 ?auto_588075 ) ) ( not ( = ?auto_588069 ?auto_588076 ) ) ( not ( = ?auto_588069 ?auto_588077 ) ) ( not ( = ?auto_588070 ?auto_588071 ) ) ( not ( = ?auto_588070 ?auto_588072 ) ) ( not ( = ?auto_588070 ?auto_588073 ) ) ( not ( = ?auto_588070 ?auto_588074 ) ) ( not ( = ?auto_588070 ?auto_588075 ) ) ( not ( = ?auto_588070 ?auto_588076 ) ) ( not ( = ?auto_588070 ?auto_588077 ) ) ( not ( = ?auto_588071 ?auto_588072 ) ) ( not ( = ?auto_588071 ?auto_588073 ) ) ( not ( = ?auto_588071 ?auto_588074 ) ) ( not ( = ?auto_588071 ?auto_588075 ) ) ( not ( = ?auto_588071 ?auto_588076 ) ) ( not ( = ?auto_588071 ?auto_588077 ) ) ( not ( = ?auto_588072 ?auto_588073 ) ) ( not ( = ?auto_588072 ?auto_588074 ) ) ( not ( = ?auto_588072 ?auto_588075 ) ) ( not ( = ?auto_588072 ?auto_588076 ) ) ( not ( = ?auto_588072 ?auto_588077 ) ) ( not ( = ?auto_588073 ?auto_588074 ) ) ( not ( = ?auto_588073 ?auto_588075 ) ) ( not ( = ?auto_588073 ?auto_588076 ) ) ( not ( = ?auto_588073 ?auto_588077 ) ) ( not ( = ?auto_588074 ?auto_588075 ) ) ( not ( = ?auto_588074 ?auto_588076 ) ) ( not ( = ?auto_588074 ?auto_588077 ) ) ( not ( = ?auto_588075 ?auto_588076 ) ) ( not ( = ?auto_588075 ?auto_588077 ) ) ( not ( = ?auto_588076 ?auto_588077 ) ) ( ON ?auto_588075 ?auto_588076 ) ( ON ?auto_588074 ?auto_588075 ) ( ON ?auto_588073 ?auto_588074 ) ( ON ?auto_588072 ?auto_588073 ) ( ON ?auto_588071 ?auto_588072 ) ( ON ?auto_588070 ?auto_588071 ) ( ON ?auto_588069 ?auto_588070 ) ( CLEAR ?auto_588067 ) ( ON ?auto_588068 ?auto_588069 ) ( CLEAR ?auto_588068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_588063 ?auto_588064 ?auto_588065 ?auto_588066 ?auto_588067 ?auto_588068 )
      ( MAKE-14PILE ?auto_588063 ?auto_588064 ?auto_588065 ?auto_588066 ?auto_588067 ?auto_588068 ?auto_588069 ?auto_588070 ?auto_588071 ?auto_588072 ?auto_588073 ?auto_588074 ?auto_588075 ?auto_588076 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_588121 - BLOCK
      ?auto_588122 - BLOCK
      ?auto_588123 - BLOCK
      ?auto_588124 - BLOCK
      ?auto_588125 - BLOCK
      ?auto_588126 - BLOCK
      ?auto_588127 - BLOCK
      ?auto_588128 - BLOCK
      ?auto_588129 - BLOCK
      ?auto_588130 - BLOCK
      ?auto_588131 - BLOCK
      ?auto_588132 - BLOCK
      ?auto_588133 - BLOCK
      ?auto_588134 - BLOCK
    )
    :vars
    (
      ?auto_588135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588134 ?auto_588135 ) ( ON-TABLE ?auto_588121 ) ( ON ?auto_588122 ?auto_588121 ) ( ON ?auto_588123 ?auto_588122 ) ( ON ?auto_588124 ?auto_588123 ) ( not ( = ?auto_588121 ?auto_588122 ) ) ( not ( = ?auto_588121 ?auto_588123 ) ) ( not ( = ?auto_588121 ?auto_588124 ) ) ( not ( = ?auto_588121 ?auto_588125 ) ) ( not ( = ?auto_588121 ?auto_588126 ) ) ( not ( = ?auto_588121 ?auto_588127 ) ) ( not ( = ?auto_588121 ?auto_588128 ) ) ( not ( = ?auto_588121 ?auto_588129 ) ) ( not ( = ?auto_588121 ?auto_588130 ) ) ( not ( = ?auto_588121 ?auto_588131 ) ) ( not ( = ?auto_588121 ?auto_588132 ) ) ( not ( = ?auto_588121 ?auto_588133 ) ) ( not ( = ?auto_588121 ?auto_588134 ) ) ( not ( = ?auto_588121 ?auto_588135 ) ) ( not ( = ?auto_588122 ?auto_588123 ) ) ( not ( = ?auto_588122 ?auto_588124 ) ) ( not ( = ?auto_588122 ?auto_588125 ) ) ( not ( = ?auto_588122 ?auto_588126 ) ) ( not ( = ?auto_588122 ?auto_588127 ) ) ( not ( = ?auto_588122 ?auto_588128 ) ) ( not ( = ?auto_588122 ?auto_588129 ) ) ( not ( = ?auto_588122 ?auto_588130 ) ) ( not ( = ?auto_588122 ?auto_588131 ) ) ( not ( = ?auto_588122 ?auto_588132 ) ) ( not ( = ?auto_588122 ?auto_588133 ) ) ( not ( = ?auto_588122 ?auto_588134 ) ) ( not ( = ?auto_588122 ?auto_588135 ) ) ( not ( = ?auto_588123 ?auto_588124 ) ) ( not ( = ?auto_588123 ?auto_588125 ) ) ( not ( = ?auto_588123 ?auto_588126 ) ) ( not ( = ?auto_588123 ?auto_588127 ) ) ( not ( = ?auto_588123 ?auto_588128 ) ) ( not ( = ?auto_588123 ?auto_588129 ) ) ( not ( = ?auto_588123 ?auto_588130 ) ) ( not ( = ?auto_588123 ?auto_588131 ) ) ( not ( = ?auto_588123 ?auto_588132 ) ) ( not ( = ?auto_588123 ?auto_588133 ) ) ( not ( = ?auto_588123 ?auto_588134 ) ) ( not ( = ?auto_588123 ?auto_588135 ) ) ( not ( = ?auto_588124 ?auto_588125 ) ) ( not ( = ?auto_588124 ?auto_588126 ) ) ( not ( = ?auto_588124 ?auto_588127 ) ) ( not ( = ?auto_588124 ?auto_588128 ) ) ( not ( = ?auto_588124 ?auto_588129 ) ) ( not ( = ?auto_588124 ?auto_588130 ) ) ( not ( = ?auto_588124 ?auto_588131 ) ) ( not ( = ?auto_588124 ?auto_588132 ) ) ( not ( = ?auto_588124 ?auto_588133 ) ) ( not ( = ?auto_588124 ?auto_588134 ) ) ( not ( = ?auto_588124 ?auto_588135 ) ) ( not ( = ?auto_588125 ?auto_588126 ) ) ( not ( = ?auto_588125 ?auto_588127 ) ) ( not ( = ?auto_588125 ?auto_588128 ) ) ( not ( = ?auto_588125 ?auto_588129 ) ) ( not ( = ?auto_588125 ?auto_588130 ) ) ( not ( = ?auto_588125 ?auto_588131 ) ) ( not ( = ?auto_588125 ?auto_588132 ) ) ( not ( = ?auto_588125 ?auto_588133 ) ) ( not ( = ?auto_588125 ?auto_588134 ) ) ( not ( = ?auto_588125 ?auto_588135 ) ) ( not ( = ?auto_588126 ?auto_588127 ) ) ( not ( = ?auto_588126 ?auto_588128 ) ) ( not ( = ?auto_588126 ?auto_588129 ) ) ( not ( = ?auto_588126 ?auto_588130 ) ) ( not ( = ?auto_588126 ?auto_588131 ) ) ( not ( = ?auto_588126 ?auto_588132 ) ) ( not ( = ?auto_588126 ?auto_588133 ) ) ( not ( = ?auto_588126 ?auto_588134 ) ) ( not ( = ?auto_588126 ?auto_588135 ) ) ( not ( = ?auto_588127 ?auto_588128 ) ) ( not ( = ?auto_588127 ?auto_588129 ) ) ( not ( = ?auto_588127 ?auto_588130 ) ) ( not ( = ?auto_588127 ?auto_588131 ) ) ( not ( = ?auto_588127 ?auto_588132 ) ) ( not ( = ?auto_588127 ?auto_588133 ) ) ( not ( = ?auto_588127 ?auto_588134 ) ) ( not ( = ?auto_588127 ?auto_588135 ) ) ( not ( = ?auto_588128 ?auto_588129 ) ) ( not ( = ?auto_588128 ?auto_588130 ) ) ( not ( = ?auto_588128 ?auto_588131 ) ) ( not ( = ?auto_588128 ?auto_588132 ) ) ( not ( = ?auto_588128 ?auto_588133 ) ) ( not ( = ?auto_588128 ?auto_588134 ) ) ( not ( = ?auto_588128 ?auto_588135 ) ) ( not ( = ?auto_588129 ?auto_588130 ) ) ( not ( = ?auto_588129 ?auto_588131 ) ) ( not ( = ?auto_588129 ?auto_588132 ) ) ( not ( = ?auto_588129 ?auto_588133 ) ) ( not ( = ?auto_588129 ?auto_588134 ) ) ( not ( = ?auto_588129 ?auto_588135 ) ) ( not ( = ?auto_588130 ?auto_588131 ) ) ( not ( = ?auto_588130 ?auto_588132 ) ) ( not ( = ?auto_588130 ?auto_588133 ) ) ( not ( = ?auto_588130 ?auto_588134 ) ) ( not ( = ?auto_588130 ?auto_588135 ) ) ( not ( = ?auto_588131 ?auto_588132 ) ) ( not ( = ?auto_588131 ?auto_588133 ) ) ( not ( = ?auto_588131 ?auto_588134 ) ) ( not ( = ?auto_588131 ?auto_588135 ) ) ( not ( = ?auto_588132 ?auto_588133 ) ) ( not ( = ?auto_588132 ?auto_588134 ) ) ( not ( = ?auto_588132 ?auto_588135 ) ) ( not ( = ?auto_588133 ?auto_588134 ) ) ( not ( = ?auto_588133 ?auto_588135 ) ) ( not ( = ?auto_588134 ?auto_588135 ) ) ( ON ?auto_588133 ?auto_588134 ) ( ON ?auto_588132 ?auto_588133 ) ( ON ?auto_588131 ?auto_588132 ) ( ON ?auto_588130 ?auto_588131 ) ( ON ?auto_588129 ?auto_588130 ) ( ON ?auto_588128 ?auto_588129 ) ( ON ?auto_588127 ?auto_588128 ) ( ON ?auto_588126 ?auto_588127 ) ( CLEAR ?auto_588124 ) ( ON ?auto_588125 ?auto_588126 ) ( CLEAR ?auto_588125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_588121 ?auto_588122 ?auto_588123 ?auto_588124 ?auto_588125 )
      ( MAKE-14PILE ?auto_588121 ?auto_588122 ?auto_588123 ?auto_588124 ?auto_588125 ?auto_588126 ?auto_588127 ?auto_588128 ?auto_588129 ?auto_588130 ?auto_588131 ?auto_588132 ?auto_588133 ?auto_588134 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_588179 - BLOCK
      ?auto_588180 - BLOCK
      ?auto_588181 - BLOCK
      ?auto_588182 - BLOCK
      ?auto_588183 - BLOCK
      ?auto_588184 - BLOCK
      ?auto_588185 - BLOCK
      ?auto_588186 - BLOCK
      ?auto_588187 - BLOCK
      ?auto_588188 - BLOCK
      ?auto_588189 - BLOCK
      ?auto_588190 - BLOCK
      ?auto_588191 - BLOCK
      ?auto_588192 - BLOCK
    )
    :vars
    (
      ?auto_588193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588192 ?auto_588193 ) ( ON-TABLE ?auto_588179 ) ( ON ?auto_588180 ?auto_588179 ) ( ON ?auto_588181 ?auto_588180 ) ( not ( = ?auto_588179 ?auto_588180 ) ) ( not ( = ?auto_588179 ?auto_588181 ) ) ( not ( = ?auto_588179 ?auto_588182 ) ) ( not ( = ?auto_588179 ?auto_588183 ) ) ( not ( = ?auto_588179 ?auto_588184 ) ) ( not ( = ?auto_588179 ?auto_588185 ) ) ( not ( = ?auto_588179 ?auto_588186 ) ) ( not ( = ?auto_588179 ?auto_588187 ) ) ( not ( = ?auto_588179 ?auto_588188 ) ) ( not ( = ?auto_588179 ?auto_588189 ) ) ( not ( = ?auto_588179 ?auto_588190 ) ) ( not ( = ?auto_588179 ?auto_588191 ) ) ( not ( = ?auto_588179 ?auto_588192 ) ) ( not ( = ?auto_588179 ?auto_588193 ) ) ( not ( = ?auto_588180 ?auto_588181 ) ) ( not ( = ?auto_588180 ?auto_588182 ) ) ( not ( = ?auto_588180 ?auto_588183 ) ) ( not ( = ?auto_588180 ?auto_588184 ) ) ( not ( = ?auto_588180 ?auto_588185 ) ) ( not ( = ?auto_588180 ?auto_588186 ) ) ( not ( = ?auto_588180 ?auto_588187 ) ) ( not ( = ?auto_588180 ?auto_588188 ) ) ( not ( = ?auto_588180 ?auto_588189 ) ) ( not ( = ?auto_588180 ?auto_588190 ) ) ( not ( = ?auto_588180 ?auto_588191 ) ) ( not ( = ?auto_588180 ?auto_588192 ) ) ( not ( = ?auto_588180 ?auto_588193 ) ) ( not ( = ?auto_588181 ?auto_588182 ) ) ( not ( = ?auto_588181 ?auto_588183 ) ) ( not ( = ?auto_588181 ?auto_588184 ) ) ( not ( = ?auto_588181 ?auto_588185 ) ) ( not ( = ?auto_588181 ?auto_588186 ) ) ( not ( = ?auto_588181 ?auto_588187 ) ) ( not ( = ?auto_588181 ?auto_588188 ) ) ( not ( = ?auto_588181 ?auto_588189 ) ) ( not ( = ?auto_588181 ?auto_588190 ) ) ( not ( = ?auto_588181 ?auto_588191 ) ) ( not ( = ?auto_588181 ?auto_588192 ) ) ( not ( = ?auto_588181 ?auto_588193 ) ) ( not ( = ?auto_588182 ?auto_588183 ) ) ( not ( = ?auto_588182 ?auto_588184 ) ) ( not ( = ?auto_588182 ?auto_588185 ) ) ( not ( = ?auto_588182 ?auto_588186 ) ) ( not ( = ?auto_588182 ?auto_588187 ) ) ( not ( = ?auto_588182 ?auto_588188 ) ) ( not ( = ?auto_588182 ?auto_588189 ) ) ( not ( = ?auto_588182 ?auto_588190 ) ) ( not ( = ?auto_588182 ?auto_588191 ) ) ( not ( = ?auto_588182 ?auto_588192 ) ) ( not ( = ?auto_588182 ?auto_588193 ) ) ( not ( = ?auto_588183 ?auto_588184 ) ) ( not ( = ?auto_588183 ?auto_588185 ) ) ( not ( = ?auto_588183 ?auto_588186 ) ) ( not ( = ?auto_588183 ?auto_588187 ) ) ( not ( = ?auto_588183 ?auto_588188 ) ) ( not ( = ?auto_588183 ?auto_588189 ) ) ( not ( = ?auto_588183 ?auto_588190 ) ) ( not ( = ?auto_588183 ?auto_588191 ) ) ( not ( = ?auto_588183 ?auto_588192 ) ) ( not ( = ?auto_588183 ?auto_588193 ) ) ( not ( = ?auto_588184 ?auto_588185 ) ) ( not ( = ?auto_588184 ?auto_588186 ) ) ( not ( = ?auto_588184 ?auto_588187 ) ) ( not ( = ?auto_588184 ?auto_588188 ) ) ( not ( = ?auto_588184 ?auto_588189 ) ) ( not ( = ?auto_588184 ?auto_588190 ) ) ( not ( = ?auto_588184 ?auto_588191 ) ) ( not ( = ?auto_588184 ?auto_588192 ) ) ( not ( = ?auto_588184 ?auto_588193 ) ) ( not ( = ?auto_588185 ?auto_588186 ) ) ( not ( = ?auto_588185 ?auto_588187 ) ) ( not ( = ?auto_588185 ?auto_588188 ) ) ( not ( = ?auto_588185 ?auto_588189 ) ) ( not ( = ?auto_588185 ?auto_588190 ) ) ( not ( = ?auto_588185 ?auto_588191 ) ) ( not ( = ?auto_588185 ?auto_588192 ) ) ( not ( = ?auto_588185 ?auto_588193 ) ) ( not ( = ?auto_588186 ?auto_588187 ) ) ( not ( = ?auto_588186 ?auto_588188 ) ) ( not ( = ?auto_588186 ?auto_588189 ) ) ( not ( = ?auto_588186 ?auto_588190 ) ) ( not ( = ?auto_588186 ?auto_588191 ) ) ( not ( = ?auto_588186 ?auto_588192 ) ) ( not ( = ?auto_588186 ?auto_588193 ) ) ( not ( = ?auto_588187 ?auto_588188 ) ) ( not ( = ?auto_588187 ?auto_588189 ) ) ( not ( = ?auto_588187 ?auto_588190 ) ) ( not ( = ?auto_588187 ?auto_588191 ) ) ( not ( = ?auto_588187 ?auto_588192 ) ) ( not ( = ?auto_588187 ?auto_588193 ) ) ( not ( = ?auto_588188 ?auto_588189 ) ) ( not ( = ?auto_588188 ?auto_588190 ) ) ( not ( = ?auto_588188 ?auto_588191 ) ) ( not ( = ?auto_588188 ?auto_588192 ) ) ( not ( = ?auto_588188 ?auto_588193 ) ) ( not ( = ?auto_588189 ?auto_588190 ) ) ( not ( = ?auto_588189 ?auto_588191 ) ) ( not ( = ?auto_588189 ?auto_588192 ) ) ( not ( = ?auto_588189 ?auto_588193 ) ) ( not ( = ?auto_588190 ?auto_588191 ) ) ( not ( = ?auto_588190 ?auto_588192 ) ) ( not ( = ?auto_588190 ?auto_588193 ) ) ( not ( = ?auto_588191 ?auto_588192 ) ) ( not ( = ?auto_588191 ?auto_588193 ) ) ( not ( = ?auto_588192 ?auto_588193 ) ) ( ON ?auto_588191 ?auto_588192 ) ( ON ?auto_588190 ?auto_588191 ) ( ON ?auto_588189 ?auto_588190 ) ( ON ?auto_588188 ?auto_588189 ) ( ON ?auto_588187 ?auto_588188 ) ( ON ?auto_588186 ?auto_588187 ) ( ON ?auto_588185 ?auto_588186 ) ( ON ?auto_588184 ?auto_588185 ) ( ON ?auto_588183 ?auto_588184 ) ( CLEAR ?auto_588181 ) ( ON ?auto_588182 ?auto_588183 ) ( CLEAR ?auto_588182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_588179 ?auto_588180 ?auto_588181 ?auto_588182 )
      ( MAKE-14PILE ?auto_588179 ?auto_588180 ?auto_588181 ?auto_588182 ?auto_588183 ?auto_588184 ?auto_588185 ?auto_588186 ?auto_588187 ?auto_588188 ?auto_588189 ?auto_588190 ?auto_588191 ?auto_588192 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_588237 - BLOCK
      ?auto_588238 - BLOCK
      ?auto_588239 - BLOCK
      ?auto_588240 - BLOCK
      ?auto_588241 - BLOCK
      ?auto_588242 - BLOCK
      ?auto_588243 - BLOCK
      ?auto_588244 - BLOCK
      ?auto_588245 - BLOCK
      ?auto_588246 - BLOCK
      ?auto_588247 - BLOCK
      ?auto_588248 - BLOCK
      ?auto_588249 - BLOCK
      ?auto_588250 - BLOCK
    )
    :vars
    (
      ?auto_588251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588250 ?auto_588251 ) ( ON-TABLE ?auto_588237 ) ( ON ?auto_588238 ?auto_588237 ) ( not ( = ?auto_588237 ?auto_588238 ) ) ( not ( = ?auto_588237 ?auto_588239 ) ) ( not ( = ?auto_588237 ?auto_588240 ) ) ( not ( = ?auto_588237 ?auto_588241 ) ) ( not ( = ?auto_588237 ?auto_588242 ) ) ( not ( = ?auto_588237 ?auto_588243 ) ) ( not ( = ?auto_588237 ?auto_588244 ) ) ( not ( = ?auto_588237 ?auto_588245 ) ) ( not ( = ?auto_588237 ?auto_588246 ) ) ( not ( = ?auto_588237 ?auto_588247 ) ) ( not ( = ?auto_588237 ?auto_588248 ) ) ( not ( = ?auto_588237 ?auto_588249 ) ) ( not ( = ?auto_588237 ?auto_588250 ) ) ( not ( = ?auto_588237 ?auto_588251 ) ) ( not ( = ?auto_588238 ?auto_588239 ) ) ( not ( = ?auto_588238 ?auto_588240 ) ) ( not ( = ?auto_588238 ?auto_588241 ) ) ( not ( = ?auto_588238 ?auto_588242 ) ) ( not ( = ?auto_588238 ?auto_588243 ) ) ( not ( = ?auto_588238 ?auto_588244 ) ) ( not ( = ?auto_588238 ?auto_588245 ) ) ( not ( = ?auto_588238 ?auto_588246 ) ) ( not ( = ?auto_588238 ?auto_588247 ) ) ( not ( = ?auto_588238 ?auto_588248 ) ) ( not ( = ?auto_588238 ?auto_588249 ) ) ( not ( = ?auto_588238 ?auto_588250 ) ) ( not ( = ?auto_588238 ?auto_588251 ) ) ( not ( = ?auto_588239 ?auto_588240 ) ) ( not ( = ?auto_588239 ?auto_588241 ) ) ( not ( = ?auto_588239 ?auto_588242 ) ) ( not ( = ?auto_588239 ?auto_588243 ) ) ( not ( = ?auto_588239 ?auto_588244 ) ) ( not ( = ?auto_588239 ?auto_588245 ) ) ( not ( = ?auto_588239 ?auto_588246 ) ) ( not ( = ?auto_588239 ?auto_588247 ) ) ( not ( = ?auto_588239 ?auto_588248 ) ) ( not ( = ?auto_588239 ?auto_588249 ) ) ( not ( = ?auto_588239 ?auto_588250 ) ) ( not ( = ?auto_588239 ?auto_588251 ) ) ( not ( = ?auto_588240 ?auto_588241 ) ) ( not ( = ?auto_588240 ?auto_588242 ) ) ( not ( = ?auto_588240 ?auto_588243 ) ) ( not ( = ?auto_588240 ?auto_588244 ) ) ( not ( = ?auto_588240 ?auto_588245 ) ) ( not ( = ?auto_588240 ?auto_588246 ) ) ( not ( = ?auto_588240 ?auto_588247 ) ) ( not ( = ?auto_588240 ?auto_588248 ) ) ( not ( = ?auto_588240 ?auto_588249 ) ) ( not ( = ?auto_588240 ?auto_588250 ) ) ( not ( = ?auto_588240 ?auto_588251 ) ) ( not ( = ?auto_588241 ?auto_588242 ) ) ( not ( = ?auto_588241 ?auto_588243 ) ) ( not ( = ?auto_588241 ?auto_588244 ) ) ( not ( = ?auto_588241 ?auto_588245 ) ) ( not ( = ?auto_588241 ?auto_588246 ) ) ( not ( = ?auto_588241 ?auto_588247 ) ) ( not ( = ?auto_588241 ?auto_588248 ) ) ( not ( = ?auto_588241 ?auto_588249 ) ) ( not ( = ?auto_588241 ?auto_588250 ) ) ( not ( = ?auto_588241 ?auto_588251 ) ) ( not ( = ?auto_588242 ?auto_588243 ) ) ( not ( = ?auto_588242 ?auto_588244 ) ) ( not ( = ?auto_588242 ?auto_588245 ) ) ( not ( = ?auto_588242 ?auto_588246 ) ) ( not ( = ?auto_588242 ?auto_588247 ) ) ( not ( = ?auto_588242 ?auto_588248 ) ) ( not ( = ?auto_588242 ?auto_588249 ) ) ( not ( = ?auto_588242 ?auto_588250 ) ) ( not ( = ?auto_588242 ?auto_588251 ) ) ( not ( = ?auto_588243 ?auto_588244 ) ) ( not ( = ?auto_588243 ?auto_588245 ) ) ( not ( = ?auto_588243 ?auto_588246 ) ) ( not ( = ?auto_588243 ?auto_588247 ) ) ( not ( = ?auto_588243 ?auto_588248 ) ) ( not ( = ?auto_588243 ?auto_588249 ) ) ( not ( = ?auto_588243 ?auto_588250 ) ) ( not ( = ?auto_588243 ?auto_588251 ) ) ( not ( = ?auto_588244 ?auto_588245 ) ) ( not ( = ?auto_588244 ?auto_588246 ) ) ( not ( = ?auto_588244 ?auto_588247 ) ) ( not ( = ?auto_588244 ?auto_588248 ) ) ( not ( = ?auto_588244 ?auto_588249 ) ) ( not ( = ?auto_588244 ?auto_588250 ) ) ( not ( = ?auto_588244 ?auto_588251 ) ) ( not ( = ?auto_588245 ?auto_588246 ) ) ( not ( = ?auto_588245 ?auto_588247 ) ) ( not ( = ?auto_588245 ?auto_588248 ) ) ( not ( = ?auto_588245 ?auto_588249 ) ) ( not ( = ?auto_588245 ?auto_588250 ) ) ( not ( = ?auto_588245 ?auto_588251 ) ) ( not ( = ?auto_588246 ?auto_588247 ) ) ( not ( = ?auto_588246 ?auto_588248 ) ) ( not ( = ?auto_588246 ?auto_588249 ) ) ( not ( = ?auto_588246 ?auto_588250 ) ) ( not ( = ?auto_588246 ?auto_588251 ) ) ( not ( = ?auto_588247 ?auto_588248 ) ) ( not ( = ?auto_588247 ?auto_588249 ) ) ( not ( = ?auto_588247 ?auto_588250 ) ) ( not ( = ?auto_588247 ?auto_588251 ) ) ( not ( = ?auto_588248 ?auto_588249 ) ) ( not ( = ?auto_588248 ?auto_588250 ) ) ( not ( = ?auto_588248 ?auto_588251 ) ) ( not ( = ?auto_588249 ?auto_588250 ) ) ( not ( = ?auto_588249 ?auto_588251 ) ) ( not ( = ?auto_588250 ?auto_588251 ) ) ( ON ?auto_588249 ?auto_588250 ) ( ON ?auto_588248 ?auto_588249 ) ( ON ?auto_588247 ?auto_588248 ) ( ON ?auto_588246 ?auto_588247 ) ( ON ?auto_588245 ?auto_588246 ) ( ON ?auto_588244 ?auto_588245 ) ( ON ?auto_588243 ?auto_588244 ) ( ON ?auto_588242 ?auto_588243 ) ( ON ?auto_588241 ?auto_588242 ) ( ON ?auto_588240 ?auto_588241 ) ( CLEAR ?auto_588238 ) ( ON ?auto_588239 ?auto_588240 ) ( CLEAR ?auto_588239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_588237 ?auto_588238 ?auto_588239 )
      ( MAKE-14PILE ?auto_588237 ?auto_588238 ?auto_588239 ?auto_588240 ?auto_588241 ?auto_588242 ?auto_588243 ?auto_588244 ?auto_588245 ?auto_588246 ?auto_588247 ?auto_588248 ?auto_588249 ?auto_588250 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_588295 - BLOCK
      ?auto_588296 - BLOCK
      ?auto_588297 - BLOCK
      ?auto_588298 - BLOCK
      ?auto_588299 - BLOCK
      ?auto_588300 - BLOCK
      ?auto_588301 - BLOCK
      ?auto_588302 - BLOCK
      ?auto_588303 - BLOCK
      ?auto_588304 - BLOCK
      ?auto_588305 - BLOCK
      ?auto_588306 - BLOCK
      ?auto_588307 - BLOCK
      ?auto_588308 - BLOCK
    )
    :vars
    (
      ?auto_588309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588308 ?auto_588309 ) ( ON-TABLE ?auto_588295 ) ( not ( = ?auto_588295 ?auto_588296 ) ) ( not ( = ?auto_588295 ?auto_588297 ) ) ( not ( = ?auto_588295 ?auto_588298 ) ) ( not ( = ?auto_588295 ?auto_588299 ) ) ( not ( = ?auto_588295 ?auto_588300 ) ) ( not ( = ?auto_588295 ?auto_588301 ) ) ( not ( = ?auto_588295 ?auto_588302 ) ) ( not ( = ?auto_588295 ?auto_588303 ) ) ( not ( = ?auto_588295 ?auto_588304 ) ) ( not ( = ?auto_588295 ?auto_588305 ) ) ( not ( = ?auto_588295 ?auto_588306 ) ) ( not ( = ?auto_588295 ?auto_588307 ) ) ( not ( = ?auto_588295 ?auto_588308 ) ) ( not ( = ?auto_588295 ?auto_588309 ) ) ( not ( = ?auto_588296 ?auto_588297 ) ) ( not ( = ?auto_588296 ?auto_588298 ) ) ( not ( = ?auto_588296 ?auto_588299 ) ) ( not ( = ?auto_588296 ?auto_588300 ) ) ( not ( = ?auto_588296 ?auto_588301 ) ) ( not ( = ?auto_588296 ?auto_588302 ) ) ( not ( = ?auto_588296 ?auto_588303 ) ) ( not ( = ?auto_588296 ?auto_588304 ) ) ( not ( = ?auto_588296 ?auto_588305 ) ) ( not ( = ?auto_588296 ?auto_588306 ) ) ( not ( = ?auto_588296 ?auto_588307 ) ) ( not ( = ?auto_588296 ?auto_588308 ) ) ( not ( = ?auto_588296 ?auto_588309 ) ) ( not ( = ?auto_588297 ?auto_588298 ) ) ( not ( = ?auto_588297 ?auto_588299 ) ) ( not ( = ?auto_588297 ?auto_588300 ) ) ( not ( = ?auto_588297 ?auto_588301 ) ) ( not ( = ?auto_588297 ?auto_588302 ) ) ( not ( = ?auto_588297 ?auto_588303 ) ) ( not ( = ?auto_588297 ?auto_588304 ) ) ( not ( = ?auto_588297 ?auto_588305 ) ) ( not ( = ?auto_588297 ?auto_588306 ) ) ( not ( = ?auto_588297 ?auto_588307 ) ) ( not ( = ?auto_588297 ?auto_588308 ) ) ( not ( = ?auto_588297 ?auto_588309 ) ) ( not ( = ?auto_588298 ?auto_588299 ) ) ( not ( = ?auto_588298 ?auto_588300 ) ) ( not ( = ?auto_588298 ?auto_588301 ) ) ( not ( = ?auto_588298 ?auto_588302 ) ) ( not ( = ?auto_588298 ?auto_588303 ) ) ( not ( = ?auto_588298 ?auto_588304 ) ) ( not ( = ?auto_588298 ?auto_588305 ) ) ( not ( = ?auto_588298 ?auto_588306 ) ) ( not ( = ?auto_588298 ?auto_588307 ) ) ( not ( = ?auto_588298 ?auto_588308 ) ) ( not ( = ?auto_588298 ?auto_588309 ) ) ( not ( = ?auto_588299 ?auto_588300 ) ) ( not ( = ?auto_588299 ?auto_588301 ) ) ( not ( = ?auto_588299 ?auto_588302 ) ) ( not ( = ?auto_588299 ?auto_588303 ) ) ( not ( = ?auto_588299 ?auto_588304 ) ) ( not ( = ?auto_588299 ?auto_588305 ) ) ( not ( = ?auto_588299 ?auto_588306 ) ) ( not ( = ?auto_588299 ?auto_588307 ) ) ( not ( = ?auto_588299 ?auto_588308 ) ) ( not ( = ?auto_588299 ?auto_588309 ) ) ( not ( = ?auto_588300 ?auto_588301 ) ) ( not ( = ?auto_588300 ?auto_588302 ) ) ( not ( = ?auto_588300 ?auto_588303 ) ) ( not ( = ?auto_588300 ?auto_588304 ) ) ( not ( = ?auto_588300 ?auto_588305 ) ) ( not ( = ?auto_588300 ?auto_588306 ) ) ( not ( = ?auto_588300 ?auto_588307 ) ) ( not ( = ?auto_588300 ?auto_588308 ) ) ( not ( = ?auto_588300 ?auto_588309 ) ) ( not ( = ?auto_588301 ?auto_588302 ) ) ( not ( = ?auto_588301 ?auto_588303 ) ) ( not ( = ?auto_588301 ?auto_588304 ) ) ( not ( = ?auto_588301 ?auto_588305 ) ) ( not ( = ?auto_588301 ?auto_588306 ) ) ( not ( = ?auto_588301 ?auto_588307 ) ) ( not ( = ?auto_588301 ?auto_588308 ) ) ( not ( = ?auto_588301 ?auto_588309 ) ) ( not ( = ?auto_588302 ?auto_588303 ) ) ( not ( = ?auto_588302 ?auto_588304 ) ) ( not ( = ?auto_588302 ?auto_588305 ) ) ( not ( = ?auto_588302 ?auto_588306 ) ) ( not ( = ?auto_588302 ?auto_588307 ) ) ( not ( = ?auto_588302 ?auto_588308 ) ) ( not ( = ?auto_588302 ?auto_588309 ) ) ( not ( = ?auto_588303 ?auto_588304 ) ) ( not ( = ?auto_588303 ?auto_588305 ) ) ( not ( = ?auto_588303 ?auto_588306 ) ) ( not ( = ?auto_588303 ?auto_588307 ) ) ( not ( = ?auto_588303 ?auto_588308 ) ) ( not ( = ?auto_588303 ?auto_588309 ) ) ( not ( = ?auto_588304 ?auto_588305 ) ) ( not ( = ?auto_588304 ?auto_588306 ) ) ( not ( = ?auto_588304 ?auto_588307 ) ) ( not ( = ?auto_588304 ?auto_588308 ) ) ( not ( = ?auto_588304 ?auto_588309 ) ) ( not ( = ?auto_588305 ?auto_588306 ) ) ( not ( = ?auto_588305 ?auto_588307 ) ) ( not ( = ?auto_588305 ?auto_588308 ) ) ( not ( = ?auto_588305 ?auto_588309 ) ) ( not ( = ?auto_588306 ?auto_588307 ) ) ( not ( = ?auto_588306 ?auto_588308 ) ) ( not ( = ?auto_588306 ?auto_588309 ) ) ( not ( = ?auto_588307 ?auto_588308 ) ) ( not ( = ?auto_588307 ?auto_588309 ) ) ( not ( = ?auto_588308 ?auto_588309 ) ) ( ON ?auto_588307 ?auto_588308 ) ( ON ?auto_588306 ?auto_588307 ) ( ON ?auto_588305 ?auto_588306 ) ( ON ?auto_588304 ?auto_588305 ) ( ON ?auto_588303 ?auto_588304 ) ( ON ?auto_588302 ?auto_588303 ) ( ON ?auto_588301 ?auto_588302 ) ( ON ?auto_588300 ?auto_588301 ) ( ON ?auto_588299 ?auto_588300 ) ( ON ?auto_588298 ?auto_588299 ) ( ON ?auto_588297 ?auto_588298 ) ( CLEAR ?auto_588295 ) ( ON ?auto_588296 ?auto_588297 ) ( CLEAR ?auto_588296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_588295 ?auto_588296 )
      ( MAKE-14PILE ?auto_588295 ?auto_588296 ?auto_588297 ?auto_588298 ?auto_588299 ?auto_588300 ?auto_588301 ?auto_588302 ?auto_588303 ?auto_588304 ?auto_588305 ?auto_588306 ?auto_588307 ?auto_588308 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_588353 - BLOCK
      ?auto_588354 - BLOCK
      ?auto_588355 - BLOCK
      ?auto_588356 - BLOCK
      ?auto_588357 - BLOCK
      ?auto_588358 - BLOCK
      ?auto_588359 - BLOCK
      ?auto_588360 - BLOCK
      ?auto_588361 - BLOCK
      ?auto_588362 - BLOCK
      ?auto_588363 - BLOCK
      ?auto_588364 - BLOCK
      ?auto_588365 - BLOCK
      ?auto_588366 - BLOCK
    )
    :vars
    (
      ?auto_588367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588366 ?auto_588367 ) ( not ( = ?auto_588353 ?auto_588354 ) ) ( not ( = ?auto_588353 ?auto_588355 ) ) ( not ( = ?auto_588353 ?auto_588356 ) ) ( not ( = ?auto_588353 ?auto_588357 ) ) ( not ( = ?auto_588353 ?auto_588358 ) ) ( not ( = ?auto_588353 ?auto_588359 ) ) ( not ( = ?auto_588353 ?auto_588360 ) ) ( not ( = ?auto_588353 ?auto_588361 ) ) ( not ( = ?auto_588353 ?auto_588362 ) ) ( not ( = ?auto_588353 ?auto_588363 ) ) ( not ( = ?auto_588353 ?auto_588364 ) ) ( not ( = ?auto_588353 ?auto_588365 ) ) ( not ( = ?auto_588353 ?auto_588366 ) ) ( not ( = ?auto_588353 ?auto_588367 ) ) ( not ( = ?auto_588354 ?auto_588355 ) ) ( not ( = ?auto_588354 ?auto_588356 ) ) ( not ( = ?auto_588354 ?auto_588357 ) ) ( not ( = ?auto_588354 ?auto_588358 ) ) ( not ( = ?auto_588354 ?auto_588359 ) ) ( not ( = ?auto_588354 ?auto_588360 ) ) ( not ( = ?auto_588354 ?auto_588361 ) ) ( not ( = ?auto_588354 ?auto_588362 ) ) ( not ( = ?auto_588354 ?auto_588363 ) ) ( not ( = ?auto_588354 ?auto_588364 ) ) ( not ( = ?auto_588354 ?auto_588365 ) ) ( not ( = ?auto_588354 ?auto_588366 ) ) ( not ( = ?auto_588354 ?auto_588367 ) ) ( not ( = ?auto_588355 ?auto_588356 ) ) ( not ( = ?auto_588355 ?auto_588357 ) ) ( not ( = ?auto_588355 ?auto_588358 ) ) ( not ( = ?auto_588355 ?auto_588359 ) ) ( not ( = ?auto_588355 ?auto_588360 ) ) ( not ( = ?auto_588355 ?auto_588361 ) ) ( not ( = ?auto_588355 ?auto_588362 ) ) ( not ( = ?auto_588355 ?auto_588363 ) ) ( not ( = ?auto_588355 ?auto_588364 ) ) ( not ( = ?auto_588355 ?auto_588365 ) ) ( not ( = ?auto_588355 ?auto_588366 ) ) ( not ( = ?auto_588355 ?auto_588367 ) ) ( not ( = ?auto_588356 ?auto_588357 ) ) ( not ( = ?auto_588356 ?auto_588358 ) ) ( not ( = ?auto_588356 ?auto_588359 ) ) ( not ( = ?auto_588356 ?auto_588360 ) ) ( not ( = ?auto_588356 ?auto_588361 ) ) ( not ( = ?auto_588356 ?auto_588362 ) ) ( not ( = ?auto_588356 ?auto_588363 ) ) ( not ( = ?auto_588356 ?auto_588364 ) ) ( not ( = ?auto_588356 ?auto_588365 ) ) ( not ( = ?auto_588356 ?auto_588366 ) ) ( not ( = ?auto_588356 ?auto_588367 ) ) ( not ( = ?auto_588357 ?auto_588358 ) ) ( not ( = ?auto_588357 ?auto_588359 ) ) ( not ( = ?auto_588357 ?auto_588360 ) ) ( not ( = ?auto_588357 ?auto_588361 ) ) ( not ( = ?auto_588357 ?auto_588362 ) ) ( not ( = ?auto_588357 ?auto_588363 ) ) ( not ( = ?auto_588357 ?auto_588364 ) ) ( not ( = ?auto_588357 ?auto_588365 ) ) ( not ( = ?auto_588357 ?auto_588366 ) ) ( not ( = ?auto_588357 ?auto_588367 ) ) ( not ( = ?auto_588358 ?auto_588359 ) ) ( not ( = ?auto_588358 ?auto_588360 ) ) ( not ( = ?auto_588358 ?auto_588361 ) ) ( not ( = ?auto_588358 ?auto_588362 ) ) ( not ( = ?auto_588358 ?auto_588363 ) ) ( not ( = ?auto_588358 ?auto_588364 ) ) ( not ( = ?auto_588358 ?auto_588365 ) ) ( not ( = ?auto_588358 ?auto_588366 ) ) ( not ( = ?auto_588358 ?auto_588367 ) ) ( not ( = ?auto_588359 ?auto_588360 ) ) ( not ( = ?auto_588359 ?auto_588361 ) ) ( not ( = ?auto_588359 ?auto_588362 ) ) ( not ( = ?auto_588359 ?auto_588363 ) ) ( not ( = ?auto_588359 ?auto_588364 ) ) ( not ( = ?auto_588359 ?auto_588365 ) ) ( not ( = ?auto_588359 ?auto_588366 ) ) ( not ( = ?auto_588359 ?auto_588367 ) ) ( not ( = ?auto_588360 ?auto_588361 ) ) ( not ( = ?auto_588360 ?auto_588362 ) ) ( not ( = ?auto_588360 ?auto_588363 ) ) ( not ( = ?auto_588360 ?auto_588364 ) ) ( not ( = ?auto_588360 ?auto_588365 ) ) ( not ( = ?auto_588360 ?auto_588366 ) ) ( not ( = ?auto_588360 ?auto_588367 ) ) ( not ( = ?auto_588361 ?auto_588362 ) ) ( not ( = ?auto_588361 ?auto_588363 ) ) ( not ( = ?auto_588361 ?auto_588364 ) ) ( not ( = ?auto_588361 ?auto_588365 ) ) ( not ( = ?auto_588361 ?auto_588366 ) ) ( not ( = ?auto_588361 ?auto_588367 ) ) ( not ( = ?auto_588362 ?auto_588363 ) ) ( not ( = ?auto_588362 ?auto_588364 ) ) ( not ( = ?auto_588362 ?auto_588365 ) ) ( not ( = ?auto_588362 ?auto_588366 ) ) ( not ( = ?auto_588362 ?auto_588367 ) ) ( not ( = ?auto_588363 ?auto_588364 ) ) ( not ( = ?auto_588363 ?auto_588365 ) ) ( not ( = ?auto_588363 ?auto_588366 ) ) ( not ( = ?auto_588363 ?auto_588367 ) ) ( not ( = ?auto_588364 ?auto_588365 ) ) ( not ( = ?auto_588364 ?auto_588366 ) ) ( not ( = ?auto_588364 ?auto_588367 ) ) ( not ( = ?auto_588365 ?auto_588366 ) ) ( not ( = ?auto_588365 ?auto_588367 ) ) ( not ( = ?auto_588366 ?auto_588367 ) ) ( ON ?auto_588365 ?auto_588366 ) ( ON ?auto_588364 ?auto_588365 ) ( ON ?auto_588363 ?auto_588364 ) ( ON ?auto_588362 ?auto_588363 ) ( ON ?auto_588361 ?auto_588362 ) ( ON ?auto_588360 ?auto_588361 ) ( ON ?auto_588359 ?auto_588360 ) ( ON ?auto_588358 ?auto_588359 ) ( ON ?auto_588357 ?auto_588358 ) ( ON ?auto_588356 ?auto_588357 ) ( ON ?auto_588355 ?auto_588356 ) ( ON ?auto_588354 ?auto_588355 ) ( ON ?auto_588353 ?auto_588354 ) ( CLEAR ?auto_588353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_588353 )
      ( MAKE-14PILE ?auto_588353 ?auto_588354 ?auto_588355 ?auto_588356 ?auto_588357 ?auto_588358 ?auto_588359 ?auto_588360 ?auto_588361 ?auto_588362 ?auto_588363 ?auto_588364 ?auto_588365 ?auto_588366 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_588412 - BLOCK
      ?auto_588413 - BLOCK
      ?auto_588414 - BLOCK
      ?auto_588415 - BLOCK
      ?auto_588416 - BLOCK
      ?auto_588417 - BLOCK
      ?auto_588418 - BLOCK
      ?auto_588419 - BLOCK
      ?auto_588420 - BLOCK
      ?auto_588421 - BLOCK
      ?auto_588422 - BLOCK
      ?auto_588423 - BLOCK
      ?auto_588424 - BLOCK
      ?auto_588425 - BLOCK
      ?auto_588426 - BLOCK
    )
    :vars
    (
      ?auto_588427 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_588425 ) ( ON ?auto_588426 ?auto_588427 ) ( CLEAR ?auto_588426 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_588412 ) ( ON ?auto_588413 ?auto_588412 ) ( ON ?auto_588414 ?auto_588413 ) ( ON ?auto_588415 ?auto_588414 ) ( ON ?auto_588416 ?auto_588415 ) ( ON ?auto_588417 ?auto_588416 ) ( ON ?auto_588418 ?auto_588417 ) ( ON ?auto_588419 ?auto_588418 ) ( ON ?auto_588420 ?auto_588419 ) ( ON ?auto_588421 ?auto_588420 ) ( ON ?auto_588422 ?auto_588421 ) ( ON ?auto_588423 ?auto_588422 ) ( ON ?auto_588424 ?auto_588423 ) ( ON ?auto_588425 ?auto_588424 ) ( not ( = ?auto_588412 ?auto_588413 ) ) ( not ( = ?auto_588412 ?auto_588414 ) ) ( not ( = ?auto_588412 ?auto_588415 ) ) ( not ( = ?auto_588412 ?auto_588416 ) ) ( not ( = ?auto_588412 ?auto_588417 ) ) ( not ( = ?auto_588412 ?auto_588418 ) ) ( not ( = ?auto_588412 ?auto_588419 ) ) ( not ( = ?auto_588412 ?auto_588420 ) ) ( not ( = ?auto_588412 ?auto_588421 ) ) ( not ( = ?auto_588412 ?auto_588422 ) ) ( not ( = ?auto_588412 ?auto_588423 ) ) ( not ( = ?auto_588412 ?auto_588424 ) ) ( not ( = ?auto_588412 ?auto_588425 ) ) ( not ( = ?auto_588412 ?auto_588426 ) ) ( not ( = ?auto_588412 ?auto_588427 ) ) ( not ( = ?auto_588413 ?auto_588414 ) ) ( not ( = ?auto_588413 ?auto_588415 ) ) ( not ( = ?auto_588413 ?auto_588416 ) ) ( not ( = ?auto_588413 ?auto_588417 ) ) ( not ( = ?auto_588413 ?auto_588418 ) ) ( not ( = ?auto_588413 ?auto_588419 ) ) ( not ( = ?auto_588413 ?auto_588420 ) ) ( not ( = ?auto_588413 ?auto_588421 ) ) ( not ( = ?auto_588413 ?auto_588422 ) ) ( not ( = ?auto_588413 ?auto_588423 ) ) ( not ( = ?auto_588413 ?auto_588424 ) ) ( not ( = ?auto_588413 ?auto_588425 ) ) ( not ( = ?auto_588413 ?auto_588426 ) ) ( not ( = ?auto_588413 ?auto_588427 ) ) ( not ( = ?auto_588414 ?auto_588415 ) ) ( not ( = ?auto_588414 ?auto_588416 ) ) ( not ( = ?auto_588414 ?auto_588417 ) ) ( not ( = ?auto_588414 ?auto_588418 ) ) ( not ( = ?auto_588414 ?auto_588419 ) ) ( not ( = ?auto_588414 ?auto_588420 ) ) ( not ( = ?auto_588414 ?auto_588421 ) ) ( not ( = ?auto_588414 ?auto_588422 ) ) ( not ( = ?auto_588414 ?auto_588423 ) ) ( not ( = ?auto_588414 ?auto_588424 ) ) ( not ( = ?auto_588414 ?auto_588425 ) ) ( not ( = ?auto_588414 ?auto_588426 ) ) ( not ( = ?auto_588414 ?auto_588427 ) ) ( not ( = ?auto_588415 ?auto_588416 ) ) ( not ( = ?auto_588415 ?auto_588417 ) ) ( not ( = ?auto_588415 ?auto_588418 ) ) ( not ( = ?auto_588415 ?auto_588419 ) ) ( not ( = ?auto_588415 ?auto_588420 ) ) ( not ( = ?auto_588415 ?auto_588421 ) ) ( not ( = ?auto_588415 ?auto_588422 ) ) ( not ( = ?auto_588415 ?auto_588423 ) ) ( not ( = ?auto_588415 ?auto_588424 ) ) ( not ( = ?auto_588415 ?auto_588425 ) ) ( not ( = ?auto_588415 ?auto_588426 ) ) ( not ( = ?auto_588415 ?auto_588427 ) ) ( not ( = ?auto_588416 ?auto_588417 ) ) ( not ( = ?auto_588416 ?auto_588418 ) ) ( not ( = ?auto_588416 ?auto_588419 ) ) ( not ( = ?auto_588416 ?auto_588420 ) ) ( not ( = ?auto_588416 ?auto_588421 ) ) ( not ( = ?auto_588416 ?auto_588422 ) ) ( not ( = ?auto_588416 ?auto_588423 ) ) ( not ( = ?auto_588416 ?auto_588424 ) ) ( not ( = ?auto_588416 ?auto_588425 ) ) ( not ( = ?auto_588416 ?auto_588426 ) ) ( not ( = ?auto_588416 ?auto_588427 ) ) ( not ( = ?auto_588417 ?auto_588418 ) ) ( not ( = ?auto_588417 ?auto_588419 ) ) ( not ( = ?auto_588417 ?auto_588420 ) ) ( not ( = ?auto_588417 ?auto_588421 ) ) ( not ( = ?auto_588417 ?auto_588422 ) ) ( not ( = ?auto_588417 ?auto_588423 ) ) ( not ( = ?auto_588417 ?auto_588424 ) ) ( not ( = ?auto_588417 ?auto_588425 ) ) ( not ( = ?auto_588417 ?auto_588426 ) ) ( not ( = ?auto_588417 ?auto_588427 ) ) ( not ( = ?auto_588418 ?auto_588419 ) ) ( not ( = ?auto_588418 ?auto_588420 ) ) ( not ( = ?auto_588418 ?auto_588421 ) ) ( not ( = ?auto_588418 ?auto_588422 ) ) ( not ( = ?auto_588418 ?auto_588423 ) ) ( not ( = ?auto_588418 ?auto_588424 ) ) ( not ( = ?auto_588418 ?auto_588425 ) ) ( not ( = ?auto_588418 ?auto_588426 ) ) ( not ( = ?auto_588418 ?auto_588427 ) ) ( not ( = ?auto_588419 ?auto_588420 ) ) ( not ( = ?auto_588419 ?auto_588421 ) ) ( not ( = ?auto_588419 ?auto_588422 ) ) ( not ( = ?auto_588419 ?auto_588423 ) ) ( not ( = ?auto_588419 ?auto_588424 ) ) ( not ( = ?auto_588419 ?auto_588425 ) ) ( not ( = ?auto_588419 ?auto_588426 ) ) ( not ( = ?auto_588419 ?auto_588427 ) ) ( not ( = ?auto_588420 ?auto_588421 ) ) ( not ( = ?auto_588420 ?auto_588422 ) ) ( not ( = ?auto_588420 ?auto_588423 ) ) ( not ( = ?auto_588420 ?auto_588424 ) ) ( not ( = ?auto_588420 ?auto_588425 ) ) ( not ( = ?auto_588420 ?auto_588426 ) ) ( not ( = ?auto_588420 ?auto_588427 ) ) ( not ( = ?auto_588421 ?auto_588422 ) ) ( not ( = ?auto_588421 ?auto_588423 ) ) ( not ( = ?auto_588421 ?auto_588424 ) ) ( not ( = ?auto_588421 ?auto_588425 ) ) ( not ( = ?auto_588421 ?auto_588426 ) ) ( not ( = ?auto_588421 ?auto_588427 ) ) ( not ( = ?auto_588422 ?auto_588423 ) ) ( not ( = ?auto_588422 ?auto_588424 ) ) ( not ( = ?auto_588422 ?auto_588425 ) ) ( not ( = ?auto_588422 ?auto_588426 ) ) ( not ( = ?auto_588422 ?auto_588427 ) ) ( not ( = ?auto_588423 ?auto_588424 ) ) ( not ( = ?auto_588423 ?auto_588425 ) ) ( not ( = ?auto_588423 ?auto_588426 ) ) ( not ( = ?auto_588423 ?auto_588427 ) ) ( not ( = ?auto_588424 ?auto_588425 ) ) ( not ( = ?auto_588424 ?auto_588426 ) ) ( not ( = ?auto_588424 ?auto_588427 ) ) ( not ( = ?auto_588425 ?auto_588426 ) ) ( not ( = ?auto_588425 ?auto_588427 ) ) ( not ( = ?auto_588426 ?auto_588427 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_588426 ?auto_588427 )
      ( !STACK ?auto_588426 ?auto_588425 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_588474 - BLOCK
      ?auto_588475 - BLOCK
      ?auto_588476 - BLOCK
      ?auto_588477 - BLOCK
      ?auto_588478 - BLOCK
      ?auto_588479 - BLOCK
      ?auto_588480 - BLOCK
      ?auto_588481 - BLOCK
      ?auto_588482 - BLOCK
      ?auto_588483 - BLOCK
      ?auto_588484 - BLOCK
      ?auto_588485 - BLOCK
      ?auto_588486 - BLOCK
      ?auto_588487 - BLOCK
      ?auto_588488 - BLOCK
    )
    :vars
    (
      ?auto_588489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588488 ?auto_588489 ) ( ON-TABLE ?auto_588474 ) ( ON ?auto_588475 ?auto_588474 ) ( ON ?auto_588476 ?auto_588475 ) ( ON ?auto_588477 ?auto_588476 ) ( ON ?auto_588478 ?auto_588477 ) ( ON ?auto_588479 ?auto_588478 ) ( ON ?auto_588480 ?auto_588479 ) ( ON ?auto_588481 ?auto_588480 ) ( ON ?auto_588482 ?auto_588481 ) ( ON ?auto_588483 ?auto_588482 ) ( ON ?auto_588484 ?auto_588483 ) ( ON ?auto_588485 ?auto_588484 ) ( ON ?auto_588486 ?auto_588485 ) ( not ( = ?auto_588474 ?auto_588475 ) ) ( not ( = ?auto_588474 ?auto_588476 ) ) ( not ( = ?auto_588474 ?auto_588477 ) ) ( not ( = ?auto_588474 ?auto_588478 ) ) ( not ( = ?auto_588474 ?auto_588479 ) ) ( not ( = ?auto_588474 ?auto_588480 ) ) ( not ( = ?auto_588474 ?auto_588481 ) ) ( not ( = ?auto_588474 ?auto_588482 ) ) ( not ( = ?auto_588474 ?auto_588483 ) ) ( not ( = ?auto_588474 ?auto_588484 ) ) ( not ( = ?auto_588474 ?auto_588485 ) ) ( not ( = ?auto_588474 ?auto_588486 ) ) ( not ( = ?auto_588474 ?auto_588487 ) ) ( not ( = ?auto_588474 ?auto_588488 ) ) ( not ( = ?auto_588474 ?auto_588489 ) ) ( not ( = ?auto_588475 ?auto_588476 ) ) ( not ( = ?auto_588475 ?auto_588477 ) ) ( not ( = ?auto_588475 ?auto_588478 ) ) ( not ( = ?auto_588475 ?auto_588479 ) ) ( not ( = ?auto_588475 ?auto_588480 ) ) ( not ( = ?auto_588475 ?auto_588481 ) ) ( not ( = ?auto_588475 ?auto_588482 ) ) ( not ( = ?auto_588475 ?auto_588483 ) ) ( not ( = ?auto_588475 ?auto_588484 ) ) ( not ( = ?auto_588475 ?auto_588485 ) ) ( not ( = ?auto_588475 ?auto_588486 ) ) ( not ( = ?auto_588475 ?auto_588487 ) ) ( not ( = ?auto_588475 ?auto_588488 ) ) ( not ( = ?auto_588475 ?auto_588489 ) ) ( not ( = ?auto_588476 ?auto_588477 ) ) ( not ( = ?auto_588476 ?auto_588478 ) ) ( not ( = ?auto_588476 ?auto_588479 ) ) ( not ( = ?auto_588476 ?auto_588480 ) ) ( not ( = ?auto_588476 ?auto_588481 ) ) ( not ( = ?auto_588476 ?auto_588482 ) ) ( not ( = ?auto_588476 ?auto_588483 ) ) ( not ( = ?auto_588476 ?auto_588484 ) ) ( not ( = ?auto_588476 ?auto_588485 ) ) ( not ( = ?auto_588476 ?auto_588486 ) ) ( not ( = ?auto_588476 ?auto_588487 ) ) ( not ( = ?auto_588476 ?auto_588488 ) ) ( not ( = ?auto_588476 ?auto_588489 ) ) ( not ( = ?auto_588477 ?auto_588478 ) ) ( not ( = ?auto_588477 ?auto_588479 ) ) ( not ( = ?auto_588477 ?auto_588480 ) ) ( not ( = ?auto_588477 ?auto_588481 ) ) ( not ( = ?auto_588477 ?auto_588482 ) ) ( not ( = ?auto_588477 ?auto_588483 ) ) ( not ( = ?auto_588477 ?auto_588484 ) ) ( not ( = ?auto_588477 ?auto_588485 ) ) ( not ( = ?auto_588477 ?auto_588486 ) ) ( not ( = ?auto_588477 ?auto_588487 ) ) ( not ( = ?auto_588477 ?auto_588488 ) ) ( not ( = ?auto_588477 ?auto_588489 ) ) ( not ( = ?auto_588478 ?auto_588479 ) ) ( not ( = ?auto_588478 ?auto_588480 ) ) ( not ( = ?auto_588478 ?auto_588481 ) ) ( not ( = ?auto_588478 ?auto_588482 ) ) ( not ( = ?auto_588478 ?auto_588483 ) ) ( not ( = ?auto_588478 ?auto_588484 ) ) ( not ( = ?auto_588478 ?auto_588485 ) ) ( not ( = ?auto_588478 ?auto_588486 ) ) ( not ( = ?auto_588478 ?auto_588487 ) ) ( not ( = ?auto_588478 ?auto_588488 ) ) ( not ( = ?auto_588478 ?auto_588489 ) ) ( not ( = ?auto_588479 ?auto_588480 ) ) ( not ( = ?auto_588479 ?auto_588481 ) ) ( not ( = ?auto_588479 ?auto_588482 ) ) ( not ( = ?auto_588479 ?auto_588483 ) ) ( not ( = ?auto_588479 ?auto_588484 ) ) ( not ( = ?auto_588479 ?auto_588485 ) ) ( not ( = ?auto_588479 ?auto_588486 ) ) ( not ( = ?auto_588479 ?auto_588487 ) ) ( not ( = ?auto_588479 ?auto_588488 ) ) ( not ( = ?auto_588479 ?auto_588489 ) ) ( not ( = ?auto_588480 ?auto_588481 ) ) ( not ( = ?auto_588480 ?auto_588482 ) ) ( not ( = ?auto_588480 ?auto_588483 ) ) ( not ( = ?auto_588480 ?auto_588484 ) ) ( not ( = ?auto_588480 ?auto_588485 ) ) ( not ( = ?auto_588480 ?auto_588486 ) ) ( not ( = ?auto_588480 ?auto_588487 ) ) ( not ( = ?auto_588480 ?auto_588488 ) ) ( not ( = ?auto_588480 ?auto_588489 ) ) ( not ( = ?auto_588481 ?auto_588482 ) ) ( not ( = ?auto_588481 ?auto_588483 ) ) ( not ( = ?auto_588481 ?auto_588484 ) ) ( not ( = ?auto_588481 ?auto_588485 ) ) ( not ( = ?auto_588481 ?auto_588486 ) ) ( not ( = ?auto_588481 ?auto_588487 ) ) ( not ( = ?auto_588481 ?auto_588488 ) ) ( not ( = ?auto_588481 ?auto_588489 ) ) ( not ( = ?auto_588482 ?auto_588483 ) ) ( not ( = ?auto_588482 ?auto_588484 ) ) ( not ( = ?auto_588482 ?auto_588485 ) ) ( not ( = ?auto_588482 ?auto_588486 ) ) ( not ( = ?auto_588482 ?auto_588487 ) ) ( not ( = ?auto_588482 ?auto_588488 ) ) ( not ( = ?auto_588482 ?auto_588489 ) ) ( not ( = ?auto_588483 ?auto_588484 ) ) ( not ( = ?auto_588483 ?auto_588485 ) ) ( not ( = ?auto_588483 ?auto_588486 ) ) ( not ( = ?auto_588483 ?auto_588487 ) ) ( not ( = ?auto_588483 ?auto_588488 ) ) ( not ( = ?auto_588483 ?auto_588489 ) ) ( not ( = ?auto_588484 ?auto_588485 ) ) ( not ( = ?auto_588484 ?auto_588486 ) ) ( not ( = ?auto_588484 ?auto_588487 ) ) ( not ( = ?auto_588484 ?auto_588488 ) ) ( not ( = ?auto_588484 ?auto_588489 ) ) ( not ( = ?auto_588485 ?auto_588486 ) ) ( not ( = ?auto_588485 ?auto_588487 ) ) ( not ( = ?auto_588485 ?auto_588488 ) ) ( not ( = ?auto_588485 ?auto_588489 ) ) ( not ( = ?auto_588486 ?auto_588487 ) ) ( not ( = ?auto_588486 ?auto_588488 ) ) ( not ( = ?auto_588486 ?auto_588489 ) ) ( not ( = ?auto_588487 ?auto_588488 ) ) ( not ( = ?auto_588487 ?auto_588489 ) ) ( not ( = ?auto_588488 ?auto_588489 ) ) ( CLEAR ?auto_588486 ) ( ON ?auto_588487 ?auto_588488 ) ( CLEAR ?auto_588487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_588474 ?auto_588475 ?auto_588476 ?auto_588477 ?auto_588478 ?auto_588479 ?auto_588480 ?auto_588481 ?auto_588482 ?auto_588483 ?auto_588484 ?auto_588485 ?auto_588486 ?auto_588487 )
      ( MAKE-15PILE ?auto_588474 ?auto_588475 ?auto_588476 ?auto_588477 ?auto_588478 ?auto_588479 ?auto_588480 ?auto_588481 ?auto_588482 ?auto_588483 ?auto_588484 ?auto_588485 ?auto_588486 ?auto_588487 ?auto_588488 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_588536 - BLOCK
      ?auto_588537 - BLOCK
      ?auto_588538 - BLOCK
      ?auto_588539 - BLOCK
      ?auto_588540 - BLOCK
      ?auto_588541 - BLOCK
      ?auto_588542 - BLOCK
      ?auto_588543 - BLOCK
      ?auto_588544 - BLOCK
      ?auto_588545 - BLOCK
      ?auto_588546 - BLOCK
      ?auto_588547 - BLOCK
      ?auto_588548 - BLOCK
      ?auto_588549 - BLOCK
      ?auto_588550 - BLOCK
    )
    :vars
    (
      ?auto_588551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588550 ?auto_588551 ) ( ON-TABLE ?auto_588536 ) ( ON ?auto_588537 ?auto_588536 ) ( ON ?auto_588538 ?auto_588537 ) ( ON ?auto_588539 ?auto_588538 ) ( ON ?auto_588540 ?auto_588539 ) ( ON ?auto_588541 ?auto_588540 ) ( ON ?auto_588542 ?auto_588541 ) ( ON ?auto_588543 ?auto_588542 ) ( ON ?auto_588544 ?auto_588543 ) ( ON ?auto_588545 ?auto_588544 ) ( ON ?auto_588546 ?auto_588545 ) ( ON ?auto_588547 ?auto_588546 ) ( not ( = ?auto_588536 ?auto_588537 ) ) ( not ( = ?auto_588536 ?auto_588538 ) ) ( not ( = ?auto_588536 ?auto_588539 ) ) ( not ( = ?auto_588536 ?auto_588540 ) ) ( not ( = ?auto_588536 ?auto_588541 ) ) ( not ( = ?auto_588536 ?auto_588542 ) ) ( not ( = ?auto_588536 ?auto_588543 ) ) ( not ( = ?auto_588536 ?auto_588544 ) ) ( not ( = ?auto_588536 ?auto_588545 ) ) ( not ( = ?auto_588536 ?auto_588546 ) ) ( not ( = ?auto_588536 ?auto_588547 ) ) ( not ( = ?auto_588536 ?auto_588548 ) ) ( not ( = ?auto_588536 ?auto_588549 ) ) ( not ( = ?auto_588536 ?auto_588550 ) ) ( not ( = ?auto_588536 ?auto_588551 ) ) ( not ( = ?auto_588537 ?auto_588538 ) ) ( not ( = ?auto_588537 ?auto_588539 ) ) ( not ( = ?auto_588537 ?auto_588540 ) ) ( not ( = ?auto_588537 ?auto_588541 ) ) ( not ( = ?auto_588537 ?auto_588542 ) ) ( not ( = ?auto_588537 ?auto_588543 ) ) ( not ( = ?auto_588537 ?auto_588544 ) ) ( not ( = ?auto_588537 ?auto_588545 ) ) ( not ( = ?auto_588537 ?auto_588546 ) ) ( not ( = ?auto_588537 ?auto_588547 ) ) ( not ( = ?auto_588537 ?auto_588548 ) ) ( not ( = ?auto_588537 ?auto_588549 ) ) ( not ( = ?auto_588537 ?auto_588550 ) ) ( not ( = ?auto_588537 ?auto_588551 ) ) ( not ( = ?auto_588538 ?auto_588539 ) ) ( not ( = ?auto_588538 ?auto_588540 ) ) ( not ( = ?auto_588538 ?auto_588541 ) ) ( not ( = ?auto_588538 ?auto_588542 ) ) ( not ( = ?auto_588538 ?auto_588543 ) ) ( not ( = ?auto_588538 ?auto_588544 ) ) ( not ( = ?auto_588538 ?auto_588545 ) ) ( not ( = ?auto_588538 ?auto_588546 ) ) ( not ( = ?auto_588538 ?auto_588547 ) ) ( not ( = ?auto_588538 ?auto_588548 ) ) ( not ( = ?auto_588538 ?auto_588549 ) ) ( not ( = ?auto_588538 ?auto_588550 ) ) ( not ( = ?auto_588538 ?auto_588551 ) ) ( not ( = ?auto_588539 ?auto_588540 ) ) ( not ( = ?auto_588539 ?auto_588541 ) ) ( not ( = ?auto_588539 ?auto_588542 ) ) ( not ( = ?auto_588539 ?auto_588543 ) ) ( not ( = ?auto_588539 ?auto_588544 ) ) ( not ( = ?auto_588539 ?auto_588545 ) ) ( not ( = ?auto_588539 ?auto_588546 ) ) ( not ( = ?auto_588539 ?auto_588547 ) ) ( not ( = ?auto_588539 ?auto_588548 ) ) ( not ( = ?auto_588539 ?auto_588549 ) ) ( not ( = ?auto_588539 ?auto_588550 ) ) ( not ( = ?auto_588539 ?auto_588551 ) ) ( not ( = ?auto_588540 ?auto_588541 ) ) ( not ( = ?auto_588540 ?auto_588542 ) ) ( not ( = ?auto_588540 ?auto_588543 ) ) ( not ( = ?auto_588540 ?auto_588544 ) ) ( not ( = ?auto_588540 ?auto_588545 ) ) ( not ( = ?auto_588540 ?auto_588546 ) ) ( not ( = ?auto_588540 ?auto_588547 ) ) ( not ( = ?auto_588540 ?auto_588548 ) ) ( not ( = ?auto_588540 ?auto_588549 ) ) ( not ( = ?auto_588540 ?auto_588550 ) ) ( not ( = ?auto_588540 ?auto_588551 ) ) ( not ( = ?auto_588541 ?auto_588542 ) ) ( not ( = ?auto_588541 ?auto_588543 ) ) ( not ( = ?auto_588541 ?auto_588544 ) ) ( not ( = ?auto_588541 ?auto_588545 ) ) ( not ( = ?auto_588541 ?auto_588546 ) ) ( not ( = ?auto_588541 ?auto_588547 ) ) ( not ( = ?auto_588541 ?auto_588548 ) ) ( not ( = ?auto_588541 ?auto_588549 ) ) ( not ( = ?auto_588541 ?auto_588550 ) ) ( not ( = ?auto_588541 ?auto_588551 ) ) ( not ( = ?auto_588542 ?auto_588543 ) ) ( not ( = ?auto_588542 ?auto_588544 ) ) ( not ( = ?auto_588542 ?auto_588545 ) ) ( not ( = ?auto_588542 ?auto_588546 ) ) ( not ( = ?auto_588542 ?auto_588547 ) ) ( not ( = ?auto_588542 ?auto_588548 ) ) ( not ( = ?auto_588542 ?auto_588549 ) ) ( not ( = ?auto_588542 ?auto_588550 ) ) ( not ( = ?auto_588542 ?auto_588551 ) ) ( not ( = ?auto_588543 ?auto_588544 ) ) ( not ( = ?auto_588543 ?auto_588545 ) ) ( not ( = ?auto_588543 ?auto_588546 ) ) ( not ( = ?auto_588543 ?auto_588547 ) ) ( not ( = ?auto_588543 ?auto_588548 ) ) ( not ( = ?auto_588543 ?auto_588549 ) ) ( not ( = ?auto_588543 ?auto_588550 ) ) ( not ( = ?auto_588543 ?auto_588551 ) ) ( not ( = ?auto_588544 ?auto_588545 ) ) ( not ( = ?auto_588544 ?auto_588546 ) ) ( not ( = ?auto_588544 ?auto_588547 ) ) ( not ( = ?auto_588544 ?auto_588548 ) ) ( not ( = ?auto_588544 ?auto_588549 ) ) ( not ( = ?auto_588544 ?auto_588550 ) ) ( not ( = ?auto_588544 ?auto_588551 ) ) ( not ( = ?auto_588545 ?auto_588546 ) ) ( not ( = ?auto_588545 ?auto_588547 ) ) ( not ( = ?auto_588545 ?auto_588548 ) ) ( not ( = ?auto_588545 ?auto_588549 ) ) ( not ( = ?auto_588545 ?auto_588550 ) ) ( not ( = ?auto_588545 ?auto_588551 ) ) ( not ( = ?auto_588546 ?auto_588547 ) ) ( not ( = ?auto_588546 ?auto_588548 ) ) ( not ( = ?auto_588546 ?auto_588549 ) ) ( not ( = ?auto_588546 ?auto_588550 ) ) ( not ( = ?auto_588546 ?auto_588551 ) ) ( not ( = ?auto_588547 ?auto_588548 ) ) ( not ( = ?auto_588547 ?auto_588549 ) ) ( not ( = ?auto_588547 ?auto_588550 ) ) ( not ( = ?auto_588547 ?auto_588551 ) ) ( not ( = ?auto_588548 ?auto_588549 ) ) ( not ( = ?auto_588548 ?auto_588550 ) ) ( not ( = ?auto_588548 ?auto_588551 ) ) ( not ( = ?auto_588549 ?auto_588550 ) ) ( not ( = ?auto_588549 ?auto_588551 ) ) ( not ( = ?auto_588550 ?auto_588551 ) ) ( ON ?auto_588549 ?auto_588550 ) ( CLEAR ?auto_588547 ) ( ON ?auto_588548 ?auto_588549 ) ( CLEAR ?auto_588548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_588536 ?auto_588537 ?auto_588538 ?auto_588539 ?auto_588540 ?auto_588541 ?auto_588542 ?auto_588543 ?auto_588544 ?auto_588545 ?auto_588546 ?auto_588547 ?auto_588548 )
      ( MAKE-15PILE ?auto_588536 ?auto_588537 ?auto_588538 ?auto_588539 ?auto_588540 ?auto_588541 ?auto_588542 ?auto_588543 ?auto_588544 ?auto_588545 ?auto_588546 ?auto_588547 ?auto_588548 ?auto_588549 ?auto_588550 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_588598 - BLOCK
      ?auto_588599 - BLOCK
      ?auto_588600 - BLOCK
      ?auto_588601 - BLOCK
      ?auto_588602 - BLOCK
      ?auto_588603 - BLOCK
      ?auto_588604 - BLOCK
      ?auto_588605 - BLOCK
      ?auto_588606 - BLOCK
      ?auto_588607 - BLOCK
      ?auto_588608 - BLOCK
      ?auto_588609 - BLOCK
      ?auto_588610 - BLOCK
      ?auto_588611 - BLOCK
      ?auto_588612 - BLOCK
    )
    :vars
    (
      ?auto_588613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588612 ?auto_588613 ) ( ON-TABLE ?auto_588598 ) ( ON ?auto_588599 ?auto_588598 ) ( ON ?auto_588600 ?auto_588599 ) ( ON ?auto_588601 ?auto_588600 ) ( ON ?auto_588602 ?auto_588601 ) ( ON ?auto_588603 ?auto_588602 ) ( ON ?auto_588604 ?auto_588603 ) ( ON ?auto_588605 ?auto_588604 ) ( ON ?auto_588606 ?auto_588605 ) ( ON ?auto_588607 ?auto_588606 ) ( ON ?auto_588608 ?auto_588607 ) ( not ( = ?auto_588598 ?auto_588599 ) ) ( not ( = ?auto_588598 ?auto_588600 ) ) ( not ( = ?auto_588598 ?auto_588601 ) ) ( not ( = ?auto_588598 ?auto_588602 ) ) ( not ( = ?auto_588598 ?auto_588603 ) ) ( not ( = ?auto_588598 ?auto_588604 ) ) ( not ( = ?auto_588598 ?auto_588605 ) ) ( not ( = ?auto_588598 ?auto_588606 ) ) ( not ( = ?auto_588598 ?auto_588607 ) ) ( not ( = ?auto_588598 ?auto_588608 ) ) ( not ( = ?auto_588598 ?auto_588609 ) ) ( not ( = ?auto_588598 ?auto_588610 ) ) ( not ( = ?auto_588598 ?auto_588611 ) ) ( not ( = ?auto_588598 ?auto_588612 ) ) ( not ( = ?auto_588598 ?auto_588613 ) ) ( not ( = ?auto_588599 ?auto_588600 ) ) ( not ( = ?auto_588599 ?auto_588601 ) ) ( not ( = ?auto_588599 ?auto_588602 ) ) ( not ( = ?auto_588599 ?auto_588603 ) ) ( not ( = ?auto_588599 ?auto_588604 ) ) ( not ( = ?auto_588599 ?auto_588605 ) ) ( not ( = ?auto_588599 ?auto_588606 ) ) ( not ( = ?auto_588599 ?auto_588607 ) ) ( not ( = ?auto_588599 ?auto_588608 ) ) ( not ( = ?auto_588599 ?auto_588609 ) ) ( not ( = ?auto_588599 ?auto_588610 ) ) ( not ( = ?auto_588599 ?auto_588611 ) ) ( not ( = ?auto_588599 ?auto_588612 ) ) ( not ( = ?auto_588599 ?auto_588613 ) ) ( not ( = ?auto_588600 ?auto_588601 ) ) ( not ( = ?auto_588600 ?auto_588602 ) ) ( not ( = ?auto_588600 ?auto_588603 ) ) ( not ( = ?auto_588600 ?auto_588604 ) ) ( not ( = ?auto_588600 ?auto_588605 ) ) ( not ( = ?auto_588600 ?auto_588606 ) ) ( not ( = ?auto_588600 ?auto_588607 ) ) ( not ( = ?auto_588600 ?auto_588608 ) ) ( not ( = ?auto_588600 ?auto_588609 ) ) ( not ( = ?auto_588600 ?auto_588610 ) ) ( not ( = ?auto_588600 ?auto_588611 ) ) ( not ( = ?auto_588600 ?auto_588612 ) ) ( not ( = ?auto_588600 ?auto_588613 ) ) ( not ( = ?auto_588601 ?auto_588602 ) ) ( not ( = ?auto_588601 ?auto_588603 ) ) ( not ( = ?auto_588601 ?auto_588604 ) ) ( not ( = ?auto_588601 ?auto_588605 ) ) ( not ( = ?auto_588601 ?auto_588606 ) ) ( not ( = ?auto_588601 ?auto_588607 ) ) ( not ( = ?auto_588601 ?auto_588608 ) ) ( not ( = ?auto_588601 ?auto_588609 ) ) ( not ( = ?auto_588601 ?auto_588610 ) ) ( not ( = ?auto_588601 ?auto_588611 ) ) ( not ( = ?auto_588601 ?auto_588612 ) ) ( not ( = ?auto_588601 ?auto_588613 ) ) ( not ( = ?auto_588602 ?auto_588603 ) ) ( not ( = ?auto_588602 ?auto_588604 ) ) ( not ( = ?auto_588602 ?auto_588605 ) ) ( not ( = ?auto_588602 ?auto_588606 ) ) ( not ( = ?auto_588602 ?auto_588607 ) ) ( not ( = ?auto_588602 ?auto_588608 ) ) ( not ( = ?auto_588602 ?auto_588609 ) ) ( not ( = ?auto_588602 ?auto_588610 ) ) ( not ( = ?auto_588602 ?auto_588611 ) ) ( not ( = ?auto_588602 ?auto_588612 ) ) ( not ( = ?auto_588602 ?auto_588613 ) ) ( not ( = ?auto_588603 ?auto_588604 ) ) ( not ( = ?auto_588603 ?auto_588605 ) ) ( not ( = ?auto_588603 ?auto_588606 ) ) ( not ( = ?auto_588603 ?auto_588607 ) ) ( not ( = ?auto_588603 ?auto_588608 ) ) ( not ( = ?auto_588603 ?auto_588609 ) ) ( not ( = ?auto_588603 ?auto_588610 ) ) ( not ( = ?auto_588603 ?auto_588611 ) ) ( not ( = ?auto_588603 ?auto_588612 ) ) ( not ( = ?auto_588603 ?auto_588613 ) ) ( not ( = ?auto_588604 ?auto_588605 ) ) ( not ( = ?auto_588604 ?auto_588606 ) ) ( not ( = ?auto_588604 ?auto_588607 ) ) ( not ( = ?auto_588604 ?auto_588608 ) ) ( not ( = ?auto_588604 ?auto_588609 ) ) ( not ( = ?auto_588604 ?auto_588610 ) ) ( not ( = ?auto_588604 ?auto_588611 ) ) ( not ( = ?auto_588604 ?auto_588612 ) ) ( not ( = ?auto_588604 ?auto_588613 ) ) ( not ( = ?auto_588605 ?auto_588606 ) ) ( not ( = ?auto_588605 ?auto_588607 ) ) ( not ( = ?auto_588605 ?auto_588608 ) ) ( not ( = ?auto_588605 ?auto_588609 ) ) ( not ( = ?auto_588605 ?auto_588610 ) ) ( not ( = ?auto_588605 ?auto_588611 ) ) ( not ( = ?auto_588605 ?auto_588612 ) ) ( not ( = ?auto_588605 ?auto_588613 ) ) ( not ( = ?auto_588606 ?auto_588607 ) ) ( not ( = ?auto_588606 ?auto_588608 ) ) ( not ( = ?auto_588606 ?auto_588609 ) ) ( not ( = ?auto_588606 ?auto_588610 ) ) ( not ( = ?auto_588606 ?auto_588611 ) ) ( not ( = ?auto_588606 ?auto_588612 ) ) ( not ( = ?auto_588606 ?auto_588613 ) ) ( not ( = ?auto_588607 ?auto_588608 ) ) ( not ( = ?auto_588607 ?auto_588609 ) ) ( not ( = ?auto_588607 ?auto_588610 ) ) ( not ( = ?auto_588607 ?auto_588611 ) ) ( not ( = ?auto_588607 ?auto_588612 ) ) ( not ( = ?auto_588607 ?auto_588613 ) ) ( not ( = ?auto_588608 ?auto_588609 ) ) ( not ( = ?auto_588608 ?auto_588610 ) ) ( not ( = ?auto_588608 ?auto_588611 ) ) ( not ( = ?auto_588608 ?auto_588612 ) ) ( not ( = ?auto_588608 ?auto_588613 ) ) ( not ( = ?auto_588609 ?auto_588610 ) ) ( not ( = ?auto_588609 ?auto_588611 ) ) ( not ( = ?auto_588609 ?auto_588612 ) ) ( not ( = ?auto_588609 ?auto_588613 ) ) ( not ( = ?auto_588610 ?auto_588611 ) ) ( not ( = ?auto_588610 ?auto_588612 ) ) ( not ( = ?auto_588610 ?auto_588613 ) ) ( not ( = ?auto_588611 ?auto_588612 ) ) ( not ( = ?auto_588611 ?auto_588613 ) ) ( not ( = ?auto_588612 ?auto_588613 ) ) ( ON ?auto_588611 ?auto_588612 ) ( ON ?auto_588610 ?auto_588611 ) ( CLEAR ?auto_588608 ) ( ON ?auto_588609 ?auto_588610 ) ( CLEAR ?auto_588609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_588598 ?auto_588599 ?auto_588600 ?auto_588601 ?auto_588602 ?auto_588603 ?auto_588604 ?auto_588605 ?auto_588606 ?auto_588607 ?auto_588608 ?auto_588609 )
      ( MAKE-15PILE ?auto_588598 ?auto_588599 ?auto_588600 ?auto_588601 ?auto_588602 ?auto_588603 ?auto_588604 ?auto_588605 ?auto_588606 ?auto_588607 ?auto_588608 ?auto_588609 ?auto_588610 ?auto_588611 ?auto_588612 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_588660 - BLOCK
      ?auto_588661 - BLOCK
      ?auto_588662 - BLOCK
      ?auto_588663 - BLOCK
      ?auto_588664 - BLOCK
      ?auto_588665 - BLOCK
      ?auto_588666 - BLOCK
      ?auto_588667 - BLOCK
      ?auto_588668 - BLOCK
      ?auto_588669 - BLOCK
      ?auto_588670 - BLOCK
      ?auto_588671 - BLOCK
      ?auto_588672 - BLOCK
      ?auto_588673 - BLOCK
      ?auto_588674 - BLOCK
    )
    :vars
    (
      ?auto_588675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588674 ?auto_588675 ) ( ON-TABLE ?auto_588660 ) ( ON ?auto_588661 ?auto_588660 ) ( ON ?auto_588662 ?auto_588661 ) ( ON ?auto_588663 ?auto_588662 ) ( ON ?auto_588664 ?auto_588663 ) ( ON ?auto_588665 ?auto_588664 ) ( ON ?auto_588666 ?auto_588665 ) ( ON ?auto_588667 ?auto_588666 ) ( ON ?auto_588668 ?auto_588667 ) ( ON ?auto_588669 ?auto_588668 ) ( not ( = ?auto_588660 ?auto_588661 ) ) ( not ( = ?auto_588660 ?auto_588662 ) ) ( not ( = ?auto_588660 ?auto_588663 ) ) ( not ( = ?auto_588660 ?auto_588664 ) ) ( not ( = ?auto_588660 ?auto_588665 ) ) ( not ( = ?auto_588660 ?auto_588666 ) ) ( not ( = ?auto_588660 ?auto_588667 ) ) ( not ( = ?auto_588660 ?auto_588668 ) ) ( not ( = ?auto_588660 ?auto_588669 ) ) ( not ( = ?auto_588660 ?auto_588670 ) ) ( not ( = ?auto_588660 ?auto_588671 ) ) ( not ( = ?auto_588660 ?auto_588672 ) ) ( not ( = ?auto_588660 ?auto_588673 ) ) ( not ( = ?auto_588660 ?auto_588674 ) ) ( not ( = ?auto_588660 ?auto_588675 ) ) ( not ( = ?auto_588661 ?auto_588662 ) ) ( not ( = ?auto_588661 ?auto_588663 ) ) ( not ( = ?auto_588661 ?auto_588664 ) ) ( not ( = ?auto_588661 ?auto_588665 ) ) ( not ( = ?auto_588661 ?auto_588666 ) ) ( not ( = ?auto_588661 ?auto_588667 ) ) ( not ( = ?auto_588661 ?auto_588668 ) ) ( not ( = ?auto_588661 ?auto_588669 ) ) ( not ( = ?auto_588661 ?auto_588670 ) ) ( not ( = ?auto_588661 ?auto_588671 ) ) ( not ( = ?auto_588661 ?auto_588672 ) ) ( not ( = ?auto_588661 ?auto_588673 ) ) ( not ( = ?auto_588661 ?auto_588674 ) ) ( not ( = ?auto_588661 ?auto_588675 ) ) ( not ( = ?auto_588662 ?auto_588663 ) ) ( not ( = ?auto_588662 ?auto_588664 ) ) ( not ( = ?auto_588662 ?auto_588665 ) ) ( not ( = ?auto_588662 ?auto_588666 ) ) ( not ( = ?auto_588662 ?auto_588667 ) ) ( not ( = ?auto_588662 ?auto_588668 ) ) ( not ( = ?auto_588662 ?auto_588669 ) ) ( not ( = ?auto_588662 ?auto_588670 ) ) ( not ( = ?auto_588662 ?auto_588671 ) ) ( not ( = ?auto_588662 ?auto_588672 ) ) ( not ( = ?auto_588662 ?auto_588673 ) ) ( not ( = ?auto_588662 ?auto_588674 ) ) ( not ( = ?auto_588662 ?auto_588675 ) ) ( not ( = ?auto_588663 ?auto_588664 ) ) ( not ( = ?auto_588663 ?auto_588665 ) ) ( not ( = ?auto_588663 ?auto_588666 ) ) ( not ( = ?auto_588663 ?auto_588667 ) ) ( not ( = ?auto_588663 ?auto_588668 ) ) ( not ( = ?auto_588663 ?auto_588669 ) ) ( not ( = ?auto_588663 ?auto_588670 ) ) ( not ( = ?auto_588663 ?auto_588671 ) ) ( not ( = ?auto_588663 ?auto_588672 ) ) ( not ( = ?auto_588663 ?auto_588673 ) ) ( not ( = ?auto_588663 ?auto_588674 ) ) ( not ( = ?auto_588663 ?auto_588675 ) ) ( not ( = ?auto_588664 ?auto_588665 ) ) ( not ( = ?auto_588664 ?auto_588666 ) ) ( not ( = ?auto_588664 ?auto_588667 ) ) ( not ( = ?auto_588664 ?auto_588668 ) ) ( not ( = ?auto_588664 ?auto_588669 ) ) ( not ( = ?auto_588664 ?auto_588670 ) ) ( not ( = ?auto_588664 ?auto_588671 ) ) ( not ( = ?auto_588664 ?auto_588672 ) ) ( not ( = ?auto_588664 ?auto_588673 ) ) ( not ( = ?auto_588664 ?auto_588674 ) ) ( not ( = ?auto_588664 ?auto_588675 ) ) ( not ( = ?auto_588665 ?auto_588666 ) ) ( not ( = ?auto_588665 ?auto_588667 ) ) ( not ( = ?auto_588665 ?auto_588668 ) ) ( not ( = ?auto_588665 ?auto_588669 ) ) ( not ( = ?auto_588665 ?auto_588670 ) ) ( not ( = ?auto_588665 ?auto_588671 ) ) ( not ( = ?auto_588665 ?auto_588672 ) ) ( not ( = ?auto_588665 ?auto_588673 ) ) ( not ( = ?auto_588665 ?auto_588674 ) ) ( not ( = ?auto_588665 ?auto_588675 ) ) ( not ( = ?auto_588666 ?auto_588667 ) ) ( not ( = ?auto_588666 ?auto_588668 ) ) ( not ( = ?auto_588666 ?auto_588669 ) ) ( not ( = ?auto_588666 ?auto_588670 ) ) ( not ( = ?auto_588666 ?auto_588671 ) ) ( not ( = ?auto_588666 ?auto_588672 ) ) ( not ( = ?auto_588666 ?auto_588673 ) ) ( not ( = ?auto_588666 ?auto_588674 ) ) ( not ( = ?auto_588666 ?auto_588675 ) ) ( not ( = ?auto_588667 ?auto_588668 ) ) ( not ( = ?auto_588667 ?auto_588669 ) ) ( not ( = ?auto_588667 ?auto_588670 ) ) ( not ( = ?auto_588667 ?auto_588671 ) ) ( not ( = ?auto_588667 ?auto_588672 ) ) ( not ( = ?auto_588667 ?auto_588673 ) ) ( not ( = ?auto_588667 ?auto_588674 ) ) ( not ( = ?auto_588667 ?auto_588675 ) ) ( not ( = ?auto_588668 ?auto_588669 ) ) ( not ( = ?auto_588668 ?auto_588670 ) ) ( not ( = ?auto_588668 ?auto_588671 ) ) ( not ( = ?auto_588668 ?auto_588672 ) ) ( not ( = ?auto_588668 ?auto_588673 ) ) ( not ( = ?auto_588668 ?auto_588674 ) ) ( not ( = ?auto_588668 ?auto_588675 ) ) ( not ( = ?auto_588669 ?auto_588670 ) ) ( not ( = ?auto_588669 ?auto_588671 ) ) ( not ( = ?auto_588669 ?auto_588672 ) ) ( not ( = ?auto_588669 ?auto_588673 ) ) ( not ( = ?auto_588669 ?auto_588674 ) ) ( not ( = ?auto_588669 ?auto_588675 ) ) ( not ( = ?auto_588670 ?auto_588671 ) ) ( not ( = ?auto_588670 ?auto_588672 ) ) ( not ( = ?auto_588670 ?auto_588673 ) ) ( not ( = ?auto_588670 ?auto_588674 ) ) ( not ( = ?auto_588670 ?auto_588675 ) ) ( not ( = ?auto_588671 ?auto_588672 ) ) ( not ( = ?auto_588671 ?auto_588673 ) ) ( not ( = ?auto_588671 ?auto_588674 ) ) ( not ( = ?auto_588671 ?auto_588675 ) ) ( not ( = ?auto_588672 ?auto_588673 ) ) ( not ( = ?auto_588672 ?auto_588674 ) ) ( not ( = ?auto_588672 ?auto_588675 ) ) ( not ( = ?auto_588673 ?auto_588674 ) ) ( not ( = ?auto_588673 ?auto_588675 ) ) ( not ( = ?auto_588674 ?auto_588675 ) ) ( ON ?auto_588673 ?auto_588674 ) ( ON ?auto_588672 ?auto_588673 ) ( ON ?auto_588671 ?auto_588672 ) ( CLEAR ?auto_588669 ) ( ON ?auto_588670 ?auto_588671 ) ( CLEAR ?auto_588670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_588660 ?auto_588661 ?auto_588662 ?auto_588663 ?auto_588664 ?auto_588665 ?auto_588666 ?auto_588667 ?auto_588668 ?auto_588669 ?auto_588670 )
      ( MAKE-15PILE ?auto_588660 ?auto_588661 ?auto_588662 ?auto_588663 ?auto_588664 ?auto_588665 ?auto_588666 ?auto_588667 ?auto_588668 ?auto_588669 ?auto_588670 ?auto_588671 ?auto_588672 ?auto_588673 ?auto_588674 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_588722 - BLOCK
      ?auto_588723 - BLOCK
      ?auto_588724 - BLOCK
      ?auto_588725 - BLOCK
      ?auto_588726 - BLOCK
      ?auto_588727 - BLOCK
      ?auto_588728 - BLOCK
      ?auto_588729 - BLOCK
      ?auto_588730 - BLOCK
      ?auto_588731 - BLOCK
      ?auto_588732 - BLOCK
      ?auto_588733 - BLOCK
      ?auto_588734 - BLOCK
      ?auto_588735 - BLOCK
      ?auto_588736 - BLOCK
    )
    :vars
    (
      ?auto_588737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588736 ?auto_588737 ) ( ON-TABLE ?auto_588722 ) ( ON ?auto_588723 ?auto_588722 ) ( ON ?auto_588724 ?auto_588723 ) ( ON ?auto_588725 ?auto_588724 ) ( ON ?auto_588726 ?auto_588725 ) ( ON ?auto_588727 ?auto_588726 ) ( ON ?auto_588728 ?auto_588727 ) ( ON ?auto_588729 ?auto_588728 ) ( ON ?auto_588730 ?auto_588729 ) ( not ( = ?auto_588722 ?auto_588723 ) ) ( not ( = ?auto_588722 ?auto_588724 ) ) ( not ( = ?auto_588722 ?auto_588725 ) ) ( not ( = ?auto_588722 ?auto_588726 ) ) ( not ( = ?auto_588722 ?auto_588727 ) ) ( not ( = ?auto_588722 ?auto_588728 ) ) ( not ( = ?auto_588722 ?auto_588729 ) ) ( not ( = ?auto_588722 ?auto_588730 ) ) ( not ( = ?auto_588722 ?auto_588731 ) ) ( not ( = ?auto_588722 ?auto_588732 ) ) ( not ( = ?auto_588722 ?auto_588733 ) ) ( not ( = ?auto_588722 ?auto_588734 ) ) ( not ( = ?auto_588722 ?auto_588735 ) ) ( not ( = ?auto_588722 ?auto_588736 ) ) ( not ( = ?auto_588722 ?auto_588737 ) ) ( not ( = ?auto_588723 ?auto_588724 ) ) ( not ( = ?auto_588723 ?auto_588725 ) ) ( not ( = ?auto_588723 ?auto_588726 ) ) ( not ( = ?auto_588723 ?auto_588727 ) ) ( not ( = ?auto_588723 ?auto_588728 ) ) ( not ( = ?auto_588723 ?auto_588729 ) ) ( not ( = ?auto_588723 ?auto_588730 ) ) ( not ( = ?auto_588723 ?auto_588731 ) ) ( not ( = ?auto_588723 ?auto_588732 ) ) ( not ( = ?auto_588723 ?auto_588733 ) ) ( not ( = ?auto_588723 ?auto_588734 ) ) ( not ( = ?auto_588723 ?auto_588735 ) ) ( not ( = ?auto_588723 ?auto_588736 ) ) ( not ( = ?auto_588723 ?auto_588737 ) ) ( not ( = ?auto_588724 ?auto_588725 ) ) ( not ( = ?auto_588724 ?auto_588726 ) ) ( not ( = ?auto_588724 ?auto_588727 ) ) ( not ( = ?auto_588724 ?auto_588728 ) ) ( not ( = ?auto_588724 ?auto_588729 ) ) ( not ( = ?auto_588724 ?auto_588730 ) ) ( not ( = ?auto_588724 ?auto_588731 ) ) ( not ( = ?auto_588724 ?auto_588732 ) ) ( not ( = ?auto_588724 ?auto_588733 ) ) ( not ( = ?auto_588724 ?auto_588734 ) ) ( not ( = ?auto_588724 ?auto_588735 ) ) ( not ( = ?auto_588724 ?auto_588736 ) ) ( not ( = ?auto_588724 ?auto_588737 ) ) ( not ( = ?auto_588725 ?auto_588726 ) ) ( not ( = ?auto_588725 ?auto_588727 ) ) ( not ( = ?auto_588725 ?auto_588728 ) ) ( not ( = ?auto_588725 ?auto_588729 ) ) ( not ( = ?auto_588725 ?auto_588730 ) ) ( not ( = ?auto_588725 ?auto_588731 ) ) ( not ( = ?auto_588725 ?auto_588732 ) ) ( not ( = ?auto_588725 ?auto_588733 ) ) ( not ( = ?auto_588725 ?auto_588734 ) ) ( not ( = ?auto_588725 ?auto_588735 ) ) ( not ( = ?auto_588725 ?auto_588736 ) ) ( not ( = ?auto_588725 ?auto_588737 ) ) ( not ( = ?auto_588726 ?auto_588727 ) ) ( not ( = ?auto_588726 ?auto_588728 ) ) ( not ( = ?auto_588726 ?auto_588729 ) ) ( not ( = ?auto_588726 ?auto_588730 ) ) ( not ( = ?auto_588726 ?auto_588731 ) ) ( not ( = ?auto_588726 ?auto_588732 ) ) ( not ( = ?auto_588726 ?auto_588733 ) ) ( not ( = ?auto_588726 ?auto_588734 ) ) ( not ( = ?auto_588726 ?auto_588735 ) ) ( not ( = ?auto_588726 ?auto_588736 ) ) ( not ( = ?auto_588726 ?auto_588737 ) ) ( not ( = ?auto_588727 ?auto_588728 ) ) ( not ( = ?auto_588727 ?auto_588729 ) ) ( not ( = ?auto_588727 ?auto_588730 ) ) ( not ( = ?auto_588727 ?auto_588731 ) ) ( not ( = ?auto_588727 ?auto_588732 ) ) ( not ( = ?auto_588727 ?auto_588733 ) ) ( not ( = ?auto_588727 ?auto_588734 ) ) ( not ( = ?auto_588727 ?auto_588735 ) ) ( not ( = ?auto_588727 ?auto_588736 ) ) ( not ( = ?auto_588727 ?auto_588737 ) ) ( not ( = ?auto_588728 ?auto_588729 ) ) ( not ( = ?auto_588728 ?auto_588730 ) ) ( not ( = ?auto_588728 ?auto_588731 ) ) ( not ( = ?auto_588728 ?auto_588732 ) ) ( not ( = ?auto_588728 ?auto_588733 ) ) ( not ( = ?auto_588728 ?auto_588734 ) ) ( not ( = ?auto_588728 ?auto_588735 ) ) ( not ( = ?auto_588728 ?auto_588736 ) ) ( not ( = ?auto_588728 ?auto_588737 ) ) ( not ( = ?auto_588729 ?auto_588730 ) ) ( not ( = ?auto_588729 ?auto_588731 ) ) ( not ( = ?auto_588729 ?auto_588732 ) ) ( not ( = ?auto_588729 ?auto_588733 ) ) ( not ( = ?auto_588729 ?auto_588734 ) ) ( not ( = ?auto_588729 ?auto_588735 ) ) ( not ( = ?auto_588729 ?auto_588736 ) ) ( not ( = ?auto_588729 ?auto_588737 ) ) ( not ( = ?auto_588730 ?auto_588731 ) ) ( not ( = ?auto_588730 ?auto_588732 ) ) ( not ( = ?auto_588730 ?auto_588733 ) ) ( not ( = ?auto_588730 ?auto_588734 ) ) ( not ( = ?auto_588730 ?auto_588735 ) ) ( not ( = ?auto_588730 ?auto_588736 ) ) ( not ( = ?auto_588730 ?auto_588737 ) ) ( not ( = ?auto_588731 ?auto_588732 ) ) ( not ( = ?auto_588731 ?auto_588733 ) ) ( not ( = ?auto_588731 ?auto_588734 ) ) ( not ( = ?auto_588731 ?auto_588735 ) ) ( not ( = ?auto_588731 ?auto_588736 ) ) ( not ( = ?auto_588731 ?auto_588737 ) ) ( not ( = ?auto_588732 ?auto_588733 ) ) ( not ( = ?auto_588732 ?auto_588734 ) ) ( not ( = ?auto_588732 ?auto_588735 ) ) ( not ( = ?auto_588732 ?auto_588736 ) ) ( not ( = ?auto_588732 ?auto_588737 ) ) ( not ( = ?auto_588733 ?auto_588734 ) ) ( not ( = ?auto_588733 ?auto_588735 ) ) ( not ( = ?auto_588733 ?auto_588736 ) ) ( not ( = ?auto_588733 ?auto_588737 ) ) ( not ( = ?auto_588734 ?auto_588735 ) ) ( not ( = ?auto_588734 ?auto_588736 ) ) ( not ( = ?auto_588734 ?auto_588737 ) ) ( not ( = ?auto_588735 ?auto_588736 ) ) ( not ( = ?auto_588735 ?auto_588737 ) ) ( not ( = ?auto_588736 ?auto_588737 ) ) ( ON ?auto_588735 ?auto_588736 ) ( ON ?auto_588734 ?auto_588735 ) ( ON ?auto_588733 ?auto_588734 ) ( ON ?auto_588732 ?auto_588733 ) ( CLEAR ?auto_588730 ) ( ON ?auto_588731 ?auto_588732 ) ( CLEAR ?auto_588731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_588722 ?auto_588723 ?auto_588724 ?auto_588725 ?auto_588726 ?auto_588727 ?auto_588728 ?auto_588729 ?auto_588730 ?auto_588731 )
      ( MAKE-15PILE ?auto_588722 ?auto_588723 ?auto_588724 ?auto_588725 ?auto_588726 ?auto_588727 ?auto_588728 ?auto_588729 ?auto_588730 ?auto_588731 ?auto_588732 ?auto_588733 ?auto_588734 ?auto_588735 ?auto_588736 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_588784 - BLOCK
      ?auto_588785 - BLOCK
      ?auto_588786 - BLOCK
      ?auto_588787 - BLOCK
      ?auto_588788 - BLOCK
      ?auto_588789 - BLOCK
      ?auto_588790 - BLOCK
      ?auto_588791 - BLOCK
      ?auto_588792 - BLOCK
      ?auto_588793 - BLOCK
      ?auto_588794 - BLOCK
      ?auto_588795 - BLOCK
      ?auto_588796 - BLOCK
      ?auto_588797 - BLOCK
      ?auto_588798 - BLOCK
    )
    :vars
    (
      ?auto_588799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588798 ?auto_588799 ) ( ON-TABLE ?auto_588784 ) ( ON ?auto_588785 ?auto_588784 ) ( ON ?auto_588786 ?auto_588785 ) ( ON ?auto_588787 ?auto_588786 ) ( ON ?auto_588788 ?auto_588787 ) ( ON ?auto_588789 ?auto_588788 ) ( ON ?auto_588790 ?auto_588789 ) ( ON ?auto_588791 ?auto_588790 ) ( not ( = ?auto_588784 ?auto_588785 ) ) ( not ( = ?auto_588784 ?auto_588786 ) ) ( not ( = ?auto_588784 ?auto_588787 ) ) ( not ( = ?auto_588784 ?auto_588788 ) ) ( not ( = ?auto_588784 ?auto_588789 ) ) ( not ( = ?auto_588784 ?auto_588790 ) ) ( not ( = ?auto_588784 ?auto_588791 ) ) ( not ( = ?auto_588784 ?auto_588792 ) ) ( not ( = ?auto_588784 ?auto_588793 ) ) ( not ( = ?auto_588784 ?auto_588794 ) ) ( not ( = ?auto_588784 ?auto_588795 ) ) ( not ( = ?auto_588784 ?auto_588796 ) ) ( not ( = ?auto_588784 ?auto_588797 ) ) ( not ( = ?auto_588784 ?auto_588798 ) ) ( not ( = ?auto_588784 ?auto_588799 ) ) ( not ( = ?auto_588785 ?auto_588786 ) ) ( not ( = ?auto_588785 ?auto_588787 ) ) ( not ( = ?auto_588785 ?auto_588788 ) ) ( not ( = ?auto_588785 ?auto_588789 ) ) ( not ( = ?auto_588785 ?auto_588790 ) ) ( not ( = ?auto_588785 ?auto_588791 ) ) ( not ( = ?auto_588785 ?auto_588792 ) ) ( not ( = ?auto_588785 ?auto_588793 ) ) ( not ( = ?auto_588785 ?auto_588794 ) ) ( not ( = ?auto_588785 ?auto_588795 ) ) ( not ( = ?auto_588785 ?auto_588796 ) ) ( not ( = ?auto_588785 ?auto_588797 ) ) ( not ( = ?auto_588785 ?auto_588798 ) ) ( not ( = ?auto_588785 ?auto_588799 ) ) ( not ( = ?auto_588786 ?auto_588787 ) ) ( not ( = ?auto_588786 ?auto_588788 ) ) ( not ( = ?auto_588786 ?auto_588789 ) ) ( not ( = ?auto_588786 ?auto_588790 ) ) ( not ( = ?auto_588786 ?auto_588791 ) ) ( not ( = ?auto_588786 ?auto_588792 ) ) ( not ( = ?auto_588786 ?auto_588793 ) ) ( not ( = ?auto_588786 ?auto_588794 ) ) ( not ( = ?auto_588786 ?auto_588795 ) ) ( not ( = ?auto_588786 ?auto_588796 ) ) ( not ( = ?auto_588786 ?auto_588797 ) ) ( not ( = ?auto_588786 ?auto_588798 ) ) ( not ( = ?auto_588786 ?auto_588799 ) ) ( not ( = ?auto_588787 ?auto_588788 ) ) ( not ( = ?auto_588787 ?auto_588789 ) ) ( not ( = ?auto_588787 ?auto_588790 ) ) ( not ( = ?auto_588787 ?auto_588791 ) ) ( not ( = ?auto_588787 ?auto_588792 ) ) ( not ( = ?auto_588787 ?auto_588793 ) ) ( not ( = ?auto_588787 ?auto_588794 ) ) ( not ( = ?auto_588787 ?auto_588795 ) ) ( not ( = ?auto_588787 ?auto_588796 ) ) ( not ( = ?auto_588787 ?auto_588797 ) ) ( not ( = ?auto_588787 ?auto_588798 ) ) ( not ( = ?auto_588787 ?auto_588799 ) ) ( not ( = ?auto_588788 ?auto_588789 ) ) ( not ( = ?auto_588788 ?auto_588790 ) ) ( not ( = ?auto_588788 ?auto_588791 ) ) ( not ( = ?auto_588788 ?auto_588792 ) ) ( not ( = ?auto_588788 ?auto_588793 ) ) ( not ( = ?auto_588788 ?auto_588794 ) ) ( not ( = ?auto_588788 ?auto_588795 ) ) ( not ( = ?auto_588788 ?auto_588796 ) ) ( not ( = ?auto_588788 ?auto_588797 ) ) ( not ( = ?auto_588788 ?auto_588798 ) ) ( not ( = ?auto_588788 ?auto_588799 ) ) ( not ( = ?auto_588789 ?auto_588790 ) ) ( not ( = ?auto_588789 ?auto_588791 ) ) ( not ( = ?auto_588789 ?auto_588792 ) ) ( not ( = ?auto_588789 ?auto_588793 ) ) ( not ( = ?auto_588789 ?auto_588794 ) ) ( not ( = ?auto_588789 ?auto_588795 ) ) ( not ( = ?auto_588789 ?auto_588796 ) ) ( not ( = ?auto_588789 ?auto_588797 ) ) ( not ( = ?auto_588789 ?auto_588798 ) ) ( not ( = ?auto_588789 ?auto_588799 ) ) ( not ( = ?auto_588790 ?auto_588791 ) ) ( not ( = ?auto_588790 ?auto_588792 ) ) ( not ( = ?auto_588790 ?auto_588793 ) ) ( not ( = ?auto_588790 ?auto_588794 ) ) ( not ( = ?auto_588790 ?auto_588795 ) ) ( not ( = ?auto_588790 ?auto_588796 ) ) ( not ( = ?auto_588790 ?auto_588797 ) ) ( not ( = ?auto_588790 ?auto_588798 ) ) ( not ( = ?auto_588790 ?auto_588799 ) ) ( not ( = ?auto_588791 ?auto_588792 ) ) ( not ( = ?auto_588791 ?auto_588793 ) ) ( not ( = ?auto_588791 ?auto_588794 ) ) ( not ( = ?auto_588791 ?auto_588795 ) ) ( not ( = ?auto_588791 ?auto_588796 ) ) ( not ( = ?auto_588791 ?auto_588797 ) ) ( not ( = ?auto_588791 ?auto_588798 ) ) ( not ( = ?auto_588791 ?auto_588799 ) ) ( not ( = ?auto_588792 ?auto_588793 ) ) ( not ( = ?auto_588792 ?auto_588794 ) ) ( not ( = ?auto_588792 ?auto_588795 ) ) ( not ( = ?auto_588792 ?auto_588796 ) ) ( not ( = ?auto_588792 ?auto_588797 ) ) ( not ( = ?auto_588792 ?auto_588798 ) ) ( not ( = ?auto_588792 ?auto_588799 ) ) ( not ( = ?auto_588793 ?auto_588794 ) ) ( not ( = ?auto_588793 ?auto_588795 ) ) ( not ( = ?auto_588793 ?auto_588796 ) ) ( not ( = ?auto_588793 ?auto_588797 ) ) ( not ( = ?auto_588793 ?auto_588798 ) ) ( not ( = ?auto_588793 ?auto_588799 ) ) ( not ( = ?auto_588794 ?auto_588795 ) ) ( not ( = ?auto_588794 ?auto_588796 ) ) ( not ( = ?auto_588794 ?auto_588797 ) ) ( not ( = ?auto_588794 ?auto_588798 ) ) ( not ( = ?auto_588794 ?auto_588799 ) ) ( not ( = ?auto_588795 ?auto_588796 ) ) ( not ( = ?auto_588795 ?auto_588797 ) ) ( not ( = ?auto_588795 ?auto_588798 ) ) ( not ( = ?auto_588795 ?auto_588799 ) ) ( not ( = ?auto_588796 ?auto_588797 ) ) ( not ( = ?auto_588796 ?auto_588798 ) ) ( not ( = ?auto_588796 ?auto_588799 ) ) ( not ( = ?auto_588797 ?auto_588798 ) ) ( not ( = ?auto_588797 ?auto_588799 ) ) ( not ( = ?auto_588798 ?auto_588799 ) ) ( ON ?auto_588797 ?auto_588798 ) ( ON ?auto_588796 ?auto_588797 ) ( ON ?auto_588795 ?auto_588796 ) ( ON ?auto_588794 ?auto_588795 ) ( ON ?auto_588793 ?auto_588794 ) ( CLEAR ?auto_588791 ) ( ON ?auto_588792 ?auto_588793 ) ( CLEAR ?auto_588792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_588784 ?auto_588785 ?auto_588786 ?auto_588787 ?auto_588788 ?auto_588789 ?auto_588790 ?auto_588791 ?auto_588792 )
      ( MAKE-15PILE ?auto_588784 ?auto_588785 ?auto_588786 ?auto_588787 ?auto_588788 ?auto_588789 ?auto_588790 ?auto_588791 ?auto_588792 ?auto_588793 ?auto_588794 ?auto_588795 ?auto_588796 ?auto_588797 ?auto_588798 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_588846 - BLOCK
      ?auto_588847 - BLOCK
      ?auto_588848 - BLOCK
      ?auto_588849 - BLOCK
      ?auto_588850 - BLOCK
      ?auto_588851 - BLOCK
      ?auto_588852 - BLOCK
      ?auto_588853 - BLOCK
      ?auto_588854 - BLOCK
      ?auto_588855 - BLOCK
      ?auto_588856 - BLOCK
      ?auto_588857 - BLOCK
      ?auto_588858 - BLOCK
      ?auto_588859 - BLOCK
      ?auto_588860 - BLOCK
    )
    :vars
    (
      ?auto_588861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588860 ?auto_588861 ) ( ON-TABLE ?auto_588846 ) ( ON ?auto_588847 ?auto_588846 ) ( ON ?auto_588848 ?auto_588847 ) ( ON ?auto_588849 ?auto_588848 ) ( ON ?auto_588850 ?auto_588849 ) ( ON ?auto_588851 ?auto_588850 ) ( ON ?auto_588852 ?auto_588851 ) ( not ( = ?auto_588846 ?auto_588847 ) ) ( not ( = ?auto_588846 ?auto_588848 ) ) ( not ( = ?auto_588846 ?auto_588849 ) ) ( not ( = ?auto_588846 ?auto_588850 ) ) ( not ( = ?auto_588846 ?auto_588851 ) ) ( not ( = ?auto_588846 ?auto_588852 ) ) ( not ( = ?auto_588846 ?auto_588853 ) ) ( not ( = ?auto_588846 ?auto_588854 ) ) ( not ( = ?auto_588846 ?auto_588855 ) ) ( not ( = ?auto_588846 ?auto_588856 ) ) ( not ( = ?auto_588846 ?auto_588857 ) ) ( not ( = ?auto_588846 ?auto_588858 ) ) ( not ( = ?auto_588846 ?auto_588859 ) ) ( not ( = ?auto_588846 ?auto_588860 ) ) ( not ( = ?auto_588846 ?auto_588861 ) ) ( not ( = ?auto_588847 ?auto_588848 ) ) ( not ( = ?auto_588847 ?auto_588849 ) ) ( not ( = ?auto_588847 ?auto_588850 ) ) ( not ( = ?auto_588847 ?auto_588851 ) ) ( not ( = ?auto_588847 ?auto_588852 ) ) ( not ( = ?auto_588847 ?auto_588853 ) ) ( not ( = ?auto_588847 ?auto_588854 ) ) ( not ( = ?auto_588847 ?auto_588855 ) ) ( not ( = ?auto_588847 ?auto_588856 ) ) ( not ( = ?auto_588847 ?auto_588857 ) ) ( not ( = ?auto_588847 ?auto_588858 ) ) ( not ( = ?auto_588847 ?auto_588859 ) ) ( not ( = ?auto_588847 ?auto_588860 ) ) ( not ( = ?auto_588847 ?auto_588861 ) ) ( not ( = ?auto_588848 ?auto_588849 ) ) ( not ( = ?auto_588848 ?auto_588850 ) ) ( not ( = ?auto_588848 ?auto_588851 ) ) ( not ( = ?auto_588848 ?auto_588852 ) ) ( not ( = ?auto_588848 ?auto_588853 ) ) ( not ( = ?auto_588848 ?auto_588854 ) ) ( not ( = ?auto_588848 ?auto_588855 ) ) ( not ( = ?auto_588848 ?auto_588856 ) ) ( not ( = ?auto_588848 ?auto_588857 ) ) ( not ( = ?auto_588848 ?auto_588858 ) ) ( not ( = ?auto_588848 ?auto_588859 ) ) ( not ( = ?auto_588848 ?auto_588860 ) ) ( not ( = ?auto_588848 ?auto_588861 ) ) ( not ( = ?auto_588849 ?auto_588850 ) ) ( not ( = ?auto_588849 ?auto_588851 ) ) ( not ( = ?auto_588849 ?auto_588852 ) ) ( not ( = ?auto_588849 ?auto_588853 ) ) ( not ( = ?auto_588849 ?auto_588854 ) ) ( not ( = ?auto_588849 ?auto_588855 ) ) ( not ( = ?auto_588849 ?auto_588856 ) ) ( not ( = ?auto_588849 ?auto_588857 ) ) ( not ( = ?auto_588849 ?auto_588858 ) ) ( not ( = ?auto_588849 ?auto_588859 ) ) ( not ( = ?auto_588849 ?auto_588860 ) ) ( not ( = ?auto_588849 ?auto_588861 ) ) ( not ( = ?auto_588850 ?auto_588851 ) ) ( not ( = ?auto_588850 ?auto_588852 ) ) ( not ( = ?auto_588850 ?auto_588853 ) ) ( not ( = ?auto_588850 ?auto_588854 ) ) ( not ( = ?auto_588850 ?auto_588855 ) ) ( not ( = ?auto_588850 ?auto_588856 ) ) ( not ( = ?auto_588850 ?auto_588857 ) ) ( not ( = ?auto_588850 ?auto_588858 ) ) ( not ( = ?auto_588850 ?auto_588859 ) ) ( not ( = ?auto_588850 ?auto_588860 ) ) ( not ( = ?auto_588850 ?auto_588861 ) ) ( not ( = ?auto_588851 ?auto_588852 ) ) ( not ( = ?auto_588851 ?auto_588853 ) ) ( not ( = ?auto_588851 ?auto_588854 ) ) ( not ( = ?auto_588851 ?auto_588855 ) ) ( not ( = ?auto_588851 ?auto_588856 ) ) ( not ( = ?auto_588851 ?auto_588857 ) ) ( not ( = ?auto_588851 ?auto_588858 ) ) ( not ( = ?auto_588851 ?auto_588859 ) ) ( not ( = ?auto_588851 ?auto_588860 ) ) ( not ( = ?auto_588851 ?auto_588861 ) ) ( not ( = ?auto_588852 ?auto_588853 ) ) ( not ( = ?auto_588852 ?auto_588854 ) ) ( not ( = ?auto_588852 ?auto_588855 ) ) ( not ( = ?auto_588852 ?auto_588856 ) ) ( not ( = ?auto_588852 ?auto_588857 ) ) ( not ( = ?auto_588852 ?auto_588858 ) ) ( not ( = ?auto_588852 ?auto_588859 ) ) ( not ( = ?auto_588852 ?auto_588860 ) ) ( not ( = ?auto_588852 ?auto_588861 ) ) ( not ( = ?auto_588853 ?auto_588854 ) ) ( not ( = ?auto_588853 ?auto_588855 ) ) ( not ( = ?auto_588853 ?auto_588856 ) ) ( not ( = ?auto_588853 ?auto_588857 ) ) ( not ( = ?auto_588853 ?auto_588858 ) ) ( not ( = ?auto_588853 ?auto_588859 ) ) ( not ( = ?auto_588853 ?auto_588860 ) ) ( not ( = ?auto_588853 ?auto_588861 ) ) ( not ( = ?auto_588854 ?auto_588855 ) ) ( not ( = ?auto_588854 ?auto_588856 ) ) ( not ( = ?auto_588854 ?auto_588857 ) ) ( not ( = ?auto_588854 ?auto_588858 ) ) ( not ( = ?auto_588854 ?auto_588859 ) ) ( not ( = ?auto_588854 ?auto_588860 ) ) ( not ( = ?auto_588854 ?auto_588861 ) ) ( not ( = ?auto_588855 ?auto_588856 ) ) ( not ( = ?auto_588855 ?auto_588857 ) ) ( not ( = ?auto_588855 ?auto_588858 ) ) ( not ( = ?auto_588855 ?auto_588859 ) ) ( not ( = ?auto_588855 ?auto_588860 ) ) ( not ( = ?auto_588855 ?auto_588861 ) ) ( not ( = ?auto_588856 ?auto_588857 ) ) ( not ( = ?auto_588856 ?auto_588858 ) ) ( not ( = ?auto_588856 ?auto_588859 ) ) ( not ( = ?auto_588856 ?auto_588860 ) ) ( not ( = ?auto_588856 ?auto_588861 ) ) ( not ( = ?auto_588857 ?auto_588858 ) ) ( not ( = ?auto_588857 ?auto_588859 ) ) ( not ( = ?auto_588857 ?auto_588860 ) ) ( not ( = ?auto_588857 ?auto_588861 ) ) ( not ( = ?auto_588858 ?auto_588859 ) ) ( not ( = ?auto_588858 ?auto_588860 ) ) ( not ( = ?auto_588858 ?auto_588861 ) ) ( not ( = ?auto_588859 ?auto_588860 ) ) ( not ( = ?auto_588859 ?auto_588861 ) ) ( not ( = ?auto_588860 ?auto_588861 ) ) ( ON ?auto_588859 ?auto_588860 ) ( ON ?auto_588858 ?auto_588859 ) ( ON ?auto_588857 ?auto_588858 ) ( ON ?auto_588856 ?auto_588857 ) ( ON ?auto_588855 ?auto_588856 ) ( ON ?auto_588854 ?auto_588855 ) ( CLEAR ?auto_588852 ) ( ON ?auto_588853 ?auto_588854 ) ( CLEAR ?auto_588853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_588846 ?auto_588847 ?auto_588848 ?auto_588849 ?auto_588850 ?auto_588851 ?auto_588852 ?auto_588853 )
      ( MAKE-15PILE ?auto_588846 ?auto_588847 ?auto_588848 ?auto_588849 ?auto_588850 ?auto_588851 ?auto_588852 ?auto_588853 ?auto_588854 ?auto_588855 ?auto_588856 ?auto_588857 ?auto_588858 ?auto_588859 ?auto_588860 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_588908 - BLOCK
      ?auto_588909 - BLOCK
      ?auto_588910 - BLOCK
      ?auto_588911 - BLOCK
      ?auto_588912 - BLOCK
      ?auto_588913 - BLOCK
      ?auto_588914 - BLOCK
      ?auto_588915 - BLOCK
      ?auto_588916 - BLOCK
      ?auto_588917 - BLOCK
      ?auto_588918 - BLOCK
      ?auto_588919 - BLOCK
      ?auto_588920 - BLOCK
      ?auto_588921 - BLOCK
      ?auto_588922 - BLOCK
    )
    :vars
    (
      ?auto_588923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588922 ?auto_588923 ) ( ON-TABLE ?auto_588908 ) ( ON ?auto_588909 ?auto_588908 ) ( ON ?auto_588910 ?auto_588909 ) ( ON ?auto_588911 ?auto_588910 ) ( ON ?auto_588912 ?auto_588911 ) ( ON ?auto_588913 ?auto_588912 ) ( not ( = ?auto_588908 ?auto_588909 ) ) ( not ( = ?auto_588908 ?auto_588910 ) ) ( not ( = ?auto_588908 ?auto_588911 ) ) ( not ( = ?auto_588908 ?auto_588912 ) ) ( not ( = ?auto_588908 ?auto_588913 ) ) ( not ( = ?auto_588908 ?auto_588914 ) ) ( not ( = ?auto_588908 ?auto_588915 ) ) ( not ( = ?auto_588908 ?auto_588916 ) ) ( not ( = ?auto_588908 ?auto_588917 ) ) ( not ( = ?auto_588908 ?auto_588918 ) ) ( not ( = ?auto_588908 ?auto_588919 ) ) ( not ( = ?auto_588908 ?auto_588920 ) ) ( not ( = ?auto_588908 ?auto_588921 ) ) ( not ( = ?auto_588908 ?auto_588922 ) ) ( not ( = ?auto_588908 ?auto_588923 ) ) ( not ( = ?auto_588909 ?auto_588910 ) ) ( not ( = ?auto_588909 ?auto_588911 ) ) ( not ( = ?auto_588909 ?auto_588912 ) ) ( not ( = ?auto_588909 ?auto_588913 ) ) ( not ( = ?auto_588909 ?auto_588914 ) ) ( not ( = ?auto_588909 ?auto_588915 ) ) ( not ( = ?auto_588909 ?auto_588916 ) ) ( not ( = ?auto_588909 ?auto_588917 ) ) ( not ( = ?auto_588909 ?auto_588918 ) ) ( not ( = ?auto_588909 ?auto_588919 ) ) ( not ( = ?auto_588909 ?auto_588920 ) ) ( not ( = ?auto_588909 ?auto_588921 ) ) ( not ( = ?auto_588909 ?auto_588922 ) ) ( not ( = ?auto_588909 ?auto_588923 ) ) ( not ( = ?auto_588910 ?auto_588911 ) ) ( not ( = ?auto_588910 ?auto_588912 ) ) ( not ( = ?auto_588910 ?auto_588913 ) ) ( not ( = ?auto_588910 ?auto_588914 ) ) ( not ( = ?auto_588910 ?auto_588915 ) ) ( not ( = ?auto_588910 ?auto_588916 ) ) ( not ( = ?auto_588910 ?auto_588917 ) ) ( not ( = ?auto_588910 ?auto_588918 ) ) ( not ( = ?auto_588910 ?auto_588919 ) ) ( not ( = ?auto_588910 ?auto_588920 ) ) ( not ( = ?auto_588910 ?auto_588921 ) ) ( not ( = ?auto_588910 ?auto_588922 ) ) ( not ( = ?auto_588910 ?auto_588923 ) ) ( not ( = ?auto_588911 ?auto_588912 ) ) ( not ( = ?auto_588911 ?auto_588913 ) ) ( not ( = ?auto_588911 ?auto_588914 ) ) ( not ( = ?auto_588911 ?auto_588915 ) ) ( not ( = ?auto_588911 ?auto_588916 ) ) ( not ( = ?auto_588911 ?auto_588917 ) ) ( not ( = ?auto_588911 ?auto_588918 ) ) ( not ( = ?auto_588911 ?auto_588919 ) ) ( not ( = ?auto_588911 ?auto_588920 ) ) ( not ( = ?auto_588911 ?auto_588921 ) ) ( not ( = ?auto_588911 ?auto_588922 ) ) ( not ( = ?auto_588911 ?auto_588923 ) ) ( not ( = ?auto_588912 ?auto_588913 ) ) ( not ( = ?auto_588912 ?auto_588914 ) ) ( not ( = ?auto_588912 ?auto_588915 ) ) ( not ( = ?auto_588912 ?auto_588916 ) ) ( not ( = ?auto_588912 ?auto_588917 ) ) ( not ( = ?auto_588912 ?auto_588918 ) ) ( not ( = ?auto_588912 ?auto_588919 ) ) ( not ( = ?auto_588912 ?auto_588920 ) ) ( not ( = ?auto_588912 ?auto_588921 ) ) ( not ( = ?auto_588912 ?auto_588922 ) ) ( not ( = ?auto_588912 ?auto_588923 ) ) ( not ( = ?auto_588913 ?auto_588914 ) ) ( not ( = ?auto_588913 ?auto_588915 ) ) ( not ( = ?auto_588913 ?auto_588916 ) ) ( not ( = ?auto_588913 ?auto_588917 ) ) ( not ( = ?auto_588913 ?auto_588918 ) ) ( not ( = ?auto_588913 ?auto_588919 ) ) ( not ( = ?auto_588913 ?auto_588920 ) ) ( not ( = ?auto_588913 ?auto_588921 ) ) ( not ( = ?auto_588913 ?auto_588922 ) ) ( not ( = ?auto_588913 ?auto_588923 ) ) ( not ( = ?auto_588914 ?auto_588915 ) ) ( not ( = ?auto_588914 ?auto_588916 ) ) ( not ( = ?auto_588914 ?auto_588917 ) ) ( not ( = ?auto_588914 ?auto_588918 ) ) ( not ( = ?auto_588914 ?auto_588919 ) ) ( not ( = ?auto_588914 ?auto_588920 ) ) ( not ( = ?auto_588914 ?auto_588921 ) ) ( not ( = ?auto_588914 ?auto_588922 ) ) ( not ( = ?auto_588914 ?auto_588923 ) ) ( not ( = ?auto_588915 ?auto_588916 ) ) ( not ( = ?auto_588915 ?auto_588917 ) ) ( not ( = ?auto_588915 ?auto_588918 ) ) ( not ( = ?auto_588915 ?auto_588919 ) ) ( not ( = ?auto_588915 ?auto_588920 ) ) ( not ( = ?auto_588915 ?auto_588921 ) ) ( not ( = ?auto_588915 ?auto_588922 ) ) ( not ( = ?auto_588915 ?auto_588923 ) ) ( not ( = ?auto_588916 ?auto_588917 ) ) ( not ( = ?auto_588916 ?auto_588918 ) ) ( not ( = ?auto_588916 ?auto_588919 ) ) ( not ( = ?auto_588916 ?auto_588920 ) ) ( not ( = ?auto_588916 ?auto_588921 ) ) ( not ( = ?auto_588916 ?auto_588922 ) ) ( not ( = ?auto_588916 ?auto_588923 ) ) ( not ( = ?auto_588917 ?auto_588918 ) ) ( not ( = ?auto_588917 ?auto_588919 ) ) ( not ( = ?auto_588917 ?auto_588920 ) ) ( not ( = ?auto_588917 ?auto_588921 ) ) ( not ( = ?auto_588917 ?auto_588922 ) ) ( not ( = ?auto_588917 ?auto_588923 ) ) ( not ( = ?auto_588918 ?auto_588919 ) ) ( not ( = ?auto_588918 ?auto_588920 ) ) ( not ( = ?auto_588918 ?auto_588921 ) ) ( not ( = ?auto_588918 ?auto_588922 ) ) ( not ( = ?auto_588918 ?auto_588923 ) ) ( not ( = ?auto_588919 ?auto_588920 ) ) ( not ( = ?auto_588919 ?auto_588921 ) ) ( not ( = ?auto_588919 ?auto_588922 ) ) ( not ( = ?auto_588919 ?auto_588923 ) ) ( not ( = ?auto_588920 ?auto_588921 ) ) ( not ( = ?auto_588920 ?auto_588922 ) ) ( not ( = ?auto_588920 ?auto_588923 ) ) ( not ( = ?auto_588921 ?auto_588922 ) ) ( not ( = ?auto_588921 ?auto_588923 ) ) ( not ( = ?auto_588922 ?auto_588923 ) ) ( ON ?auto_588921 ?auto_588922 ) ( ON ?auto_588920 ?auto_588921 ) ( ON ?auto_588919 ?auto_588920 ) ( ON ?auto_588918 ?auto_588919 ) ( ON ?auto_588917 ?auto_588918 ) ( ON ?auto_588916 ?auto_588917 ) ( ON ?auto_588915 ?auto_588916 ) ( CLEAR ?auto_588913 ) ( ON ?auto_588914 ?auto_588915 ) ( CLEAR ?auto_588914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_588908 ?auto_588909 ?auto_588910 ?auto_588911 ?auto_588912 ?auto_588913 ?auto_588914 )
      ( MAKE-15PILE ?auto_588908 ?auto_588909 ?auto_588910 ?auto_588911 ?auto_588912 ?auto_588913 ?auto_588914 ?auto_588915 ?auto_588916 ?auto_588917 ?auto_588918 ?auto_588919 ?auto_588920 ?auto_588921 ?auto_588922 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_588970 - BLOCK
      ?auto_588971 - BLOCK
      ?auto_588972 - BLOCK
      ?auto_588973 - BLOCK
      ?auto_588974 - BLOCK
      ?auto_588975 - BLOCK
      ?auto_588976 - BLOCK
      ?auto_588977 - BLOCK
      ?auto_588978 - BLOCK
      ?auto_588979 - BLOCK
      ?auto_588980 - BLOCK
      ?auto_588981 - BLOCK
      ?auto_588982 - BLOCK
      ?auto_588983 - BLOCK
      ?auto_588984 - BLOCK
    )
    :vars
    (
      ?auto_588985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_588984 ?auto_588985 ) ( ON-TABLE ?auto_588970 ) ( ON ?auto_588971 ?auto_588970 ) ( ON ?auto_588972 ?auto_588971 ) ( ON ?auto_588973 ?auto_588972 ) ( ON ?auto_588974 ?auto_588973 ) ( not ( = ?auto_588970 ?auto_588971 ) ) ( not ( = ?auto_588970 ?auto_588972 ) ) ( not ( = ?auto_588970 ?auto_588973 ) ) ( not ( = ?auto_588970 ?auto_588974 ) ) ( not ( = ?auto_588970 ?auto_588975 ) ) ( not ( = ?auto_588970 ?auto_588976 ) ) ( not ( = ?auto_588970 ?auto_588977 ) ) ( not ( = ?auto_588970 ?auto_588978 ) ) ( not ( = ?auto_588970 ?auto_588979 ) ) ( not ( = ?auto_588970 ?auto_588980 ) ) ( not ( = ?auto_588970 ?auto_588981 ) ) ( not ( = ?auto_588970 ?auto_588982 ) ) ( not ( = ?auto_588970 ?auto_588983 ) ) ( not ( = ?auto_588970 ?auto_588984 ) ) ( not ( = ?auto_588970 ?auto_588985 ) ) ( not ( = ?auto_588971 ?auto_588972 ) ) ( not ( = ?auto_588971 ?auto_588973 ) ) ( not ( = ?auto_588971 ?auto_588974 ) ) ( not ( = ?auto_588971 ?auto_588975 ) ) ( not ( = ?auto_588971 ?auto_588976 ) ) ( not ( = ?auto_588971 ?auto_588977 ) ) ( not ( = ?auto_588971 ?auto_588978 ) ) ( not ( = ?auto_588971 ?auto_588979 ) ) ( not ( = ?auto_588971 ?auto_588980 ) ) ( not ( = ?auto_588971 ?auto_588981 ) ) ( not ( = ?auto_588971 ?auto_588982 ) ) ( not ( = ?auto_588971 ?auto_588983 ) ) ( not ( = ?auto_588971 ?auto_588984 ) ) ( not ( = ?auto_588971 ?auto_588985 ) ) ( not ( = ?auto_588972 ?auto_588973 ) ) ( not ( = ?auto_588972 ?auto_588974 ) ) ( not ( = ?auto_588972 ?auto_588975 ) ) ( not ( = ?auto_588972 ?auto_588976 ) ) ( not ( = ?auto_588972 ?auto_588977 ) ) ( not ( = ?auto_588972 ?auto_588978 ) ) ( not ( = ?auto_588972 ?auto_588979 ) ) ( not ( = ?auto_588972 ?auto_588980 ) ) ( not ( = ?auto_588972 ?auto_588981 ) ) ( not ( = ?auto_588972 ?auto_588982 ) ) ( not ( = ?auto_588972 ?auto_588983 ) ) ( not ( = ?auto_588972 ?auto_588984 ) ) ( not ( = ?auto_588972 ?auto_588985 ) ) ( not ( = ?auto_588973 ?auto_588974 ) ) ( not ( = ?auto_588973 ?auto_588975 ) ) ( not ( = ?auto_588973 ?auto_588976 ) ) ( not ( = ?auto_588973 ?auto_588977 ) ) ( not ( = ?auto_588973 ?auto_588978 ) ) ( not ( = ?auto_588973 ?auto_588979 ) ) ( not ( = ?auto_588973 ?auto_588980 ) ) ( not ( = ?auto_588973 ?auto_588981 ) ) ( not ( = ?auto_588973 ?auto_588982 ) ) ( not ( = ?auto_588973 ?auto_588983 ) ) ( not ( = ?auto_588973 ?auto_588984 ) ) ( not ( = ?auto_588973 ?auto_588985 ) ) ( not ( = ?auto_588974 ?auto_588975 ) ) ( not ( = ?auto_588974 ?auto_588976 ) ) ( not ( = ?auto_588974 ?auto_588977 ) ) ( not ( = ?auto_588974 ?auto_588978 ) ) ( not ( = ?auto_588974 ?auto_588979 ) ) ( not ( = ?auto_588974 ?auto_588980 ) ) ( not ( = ?auto_588974 ?auto_588981 ) ) ( not ( = ?auto_588974 ?auto_588982 ) ) ( not ( = ?auto_588974 ?auto_588983 ) ) ( not ( = ?auto_588974 ?auto_588984 ) ) ( not ( = ?auto_588974 ?auto_588985 ) ) ( not ( = ?auto_588975 ?auto_588976 ) ) ( not ( = ?auto_588975 ?auto_588977 ) ) ( not ( = ?auto_588975 ?auto_588978 ) ) ( not ( = ?auto_588975 ?auto_588979 ) ) ( not ( = ?auto_588975 ?auto_588980 ) ) ( not ( = ?auto_588975 ?auto_588981 ) ) ( not ( = ?auto_588975 ?auto_588982 ) ) ( not ( = ?auto_588975 ?auto_588983 ) ) ( not ( = ?auto_588975 ?auto_588984 ) ) ( not ( = ?auto_588975 ?auto_588985 ) ) ( not ( = ?auto_588976 ?auto_588977 ) ) ( not ( = ?auto_588976 ?auto_588978 ) ) ( not ( = ?auto_588976 ?auto_588979 ) ) ( not ( = ?auto_588976 ?auto_588980 ) ) ( not ( = ?auto_588976 ?auto_588981 ) ) ( not ( = ?auto_588976 ?auto_588982 ) ) ( not ( = ?auto_588976 ?auto_588983 ) ) ( not ( = ?auto_588976 ?auto_588984 ) ) ( not ( = ?auto_588976 ?auto_588985 ) ) ( not ( = ?auto_588977 ?auto_588978 ) ) ( not ( = ?auto_588977 ?auto_588979 ) ) ( not ( = ?auto_588977 ?auto_588980 ) ) ( not ( = ?auto_588977 ?auto_588981 ) ) ( not ( = ?auto_588977 ?auto_588982 ) ) ( not ( = ?auto_588977 ?auto_588983 ) ) ( not ( = ?auto_588977 ?auto_588984 ) ) ( not ( = ?auto_588977 ?auto_588985 ) ) ( not ( = ?auto_588978 ?auto_588979 ) ) ( not ( = ?auto_588978 ?auto_588980 ) ) ( not ( = ?auto_588978 ?auto_588981 ) ) ( not ( = ?auto_588978 ?auto_588982 ) ) ( not ( = ?auto_588978 ?auto_588983 ) ) ( not ( = ?auto_588978 ?auto_588984 ) ) ( not ( = ?auto_588978 ?auto_588985 ) ) ( not ( = ?auto_588979 ?auto_588980 ) ) ( not ( = ?auto_588979 ?auto_588981 ) ) ( not ( = ?auto_588979 ?auto_588982 ) ) ( not ( = ?auto_588979 ?auto_588983 ) ) ( not ( = ?auto_588979 ?auto_588984 ) ) ( not ( = ?auto_588979 ?auto_588985 ) ) ( not ( = ?auto_588980 ?auto_588981 ) ) ( not ( = ?auto_588980 ?auto_588982 ) ) ( not ( = ?auto_588980 ?auto_588983 ) ) ( not ( = ?auto_588980 ?auto_588984 ) ) ( not ( = ?auto_588980 ?auto_588985 ) ) ( not ( = ?auto_588981 ?auto_588982 ) ) ( not ( = ?auto_588981 ?auto_588983 ) ) ( not ( = ?auto_588981 ?auto_588984 ) ) ( not ( = ?auto_588981 ?auto_588985 ) ) ( not ( = ?auto_588982 ?auto_588983 ) ) ( not ( = ?auto_588982 ?auto_588984 ) ) ( not ( = ?auto_588982 ?auto_588985 ) ) ( not ( = ?auto_588983 ?auto_588984 ) ) ( not ( = ?auto_588983 ?auto_588985 ) ) ( not ( = ?auto_588984 ?auto_588985 ) ) ( ON ?auto_588983 ?auto_588984 ) ( ON ?auto_588982 ?auto_588983 ) ( ON ?auto_588981 ?auto_588982 ) ( ON ?auto_588980 ?auto_588981 ) ( ON ?auto_588979 ?auto_588980 ) ( ON ?auto_588978 ?auto_588979 ) ( ON ?auto_588977 ?auto_588978 ) ( ON ?auto_588976 ?auto_588977 ) ( CLEAR ?auto_588974 ) ( ON ?auto_588975 ?auto_588976 ) ( CLEAR ?auto_588975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_588970 ?auto_588971 ?auto_588972 ?auto_588973 ?auto_588974 ?auto_588975 )
      ( MAKE-15PILE ?auto_588970 ?auto_588971 ?auto_588972 ?auto_588973 ?auto_588974 ?auto_588975 ?auto_588976 ?auto_588977 ?auto_588978 ?auto_588979 ?auto_588980 ?auto_588981 ?auto_588982 ?auto_588983 ?auto_588984 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_589032 - BLOCK
      ?auto_589033 - BLOCK
      ?auto_589034 - BLOCK
      ?auto_589035 - BLOCK
      ?auto_589036 - BLOCK
      ?auto_589037 - BLOCK
      ?auto_589038 - BLOCK
      ?auto_589039 - BLOCK
      ?auto_589040 - BLOCK
      ?auto_589041 - BLOCK
      ?auto_589042 - BLOCK
      ?auto_589043 - BLOCK
      ?auto_589044 - BLOCK
      ?auto_589045 - BLOCK
      ?auto_589046 - BLOCK
    )
    :vars
    (
      ?auto_589047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589046 ?auto_589047 ) ( ON-TABLE ?auto_589032 ) ( ON ?auto_589033 ?auto_589032 ) ( ON ?auto_589034 ?auto_589033 ) ( ON ?auto_589035 ?auto_589034 ) ( not ( = ?auto_589032 ?auto_589033 ) ) ( not ( = ?auto_589032 ?auto_589034 ) ) ( not ( = ?auto_589032 ?auto_589035 ) ) ( not ( = ?auto_589032 ?auto_589036 ) ) ( not ( = ?auto_589032 ?auto_589037 ) ) ( not ( = ?auto_589032 ?auto_589038 ) ) ( not ( = ?auto_589032 ?auto_589039 ) ) ( not ( = ?auto_589032 ?auto_589040 ) ) ( not ( = ?auto_589032 ?auto_589041 ) ) ( not ( = ?auto_589032 ?auto_589042 ) ) ( not ( = ?auto_589032 ?auto_589043 ) ) ( not ( = ?auto_589032 ?auto_589044 ) ) ( not ( = ?auto_589032 ?auto_589045 ) ) ( not ( = ?auto_589032 ?auto_589046 ) ) ( not ( = ?auto_589032 ?auto_589047 ) ) ( not ( = ?auto_589033 ?auto_589034 ) ) ( not ( = ?auto_589033 ?auto_589035 ) ) ( not ( = ?auto_589033 ?auto_589036 ) ) ( not ( = ?auto_589033 ?auto_589037 ) ) ( not ( = ?auto_589033 ?auto_589038 ) ) ( not ( = ?auto_589033 ?auto_589039 ) ) ( not ( = ?auto_589033 ?auto_589040 ) ) ( not ( = ?auto_589033 ?auto_589041 ) ) ( not ( = ?auto_589033 ?auto_589042 ) ) ( not ( = ?auto_589033 ?auto_589043 ) ) ( not ( = ?auto_589033 ?auto_589044 ) ) ( not ( = ?auto_589033 ?auto_589045 ) ) ( not ( = ?auto_589033 ?auto_589046 ) ) ( not ( = ?auto_589033 ?auto_589047 ) ) ( not ( = ?auto_589034 ?auto_589035 ) ) ( not ( = ?auto_589034 ?auto_589036 ) ) ( not ( = ?auto_589034 ?auto_589037 ) ) ( not ( = ?auto_589034 ?auto_589038 ) ) ( not ( = ?auto_589034 ?auto_589039 ) ) ( not ( = ?auto_589034 ?auto_589040 ) ) ( not ( = ?auto_589034 ?auto_589041 ) ) ( not ( = ?auto_589034 ?auto_589042 ) ) ( not ( = ?auto_589034 ?auto_589043 ) ) ( not ( = ?auto_589034 ?auto_589044 ) ) ( not ( = ?auto_589034 ?auto_589045 ) ) ( not ( = ?auto_589034 ?auto_589046 ) ) ( not ( = ?auto_589034 ?auto_589047 ) ) ( not ( = ?auto_589035 ?auto_589036 ) ) ( not ( = ?auto_589035 ?auto_589037 ) ) ( not ( = ?auto_589035 ?auto_589038 ) ) ( not ( = ?auto_589035 ?auto_589039 ) ) ( not ( = ?auto_589035 ?auto_589040 ) ) ( not ( = ?auto_589035 ?auto_589041 ) ) ( not ( = ?auto_589035 ?auto_589042 ) ) ( not ( = ?auto_589035 ?auto_589043 ) ) ( not ( = ?auto_589035 ?auto_589044 ) ) ( not ( = ?auto_589035 ?auto_589045 ) ) ( not ( = ?auto_589035 ?auto_589046 ) ) ( not ( = ?auto_589035 ?auto_589047 ) ) ( not ( = ?auto_589036 ?auto_589037 ) ) ( not ( = ?auto_589036 ?auto_589038 ) ) ( not ( = ?auto_589036 ?auto_589039 ) ) ( not ( = ?auto_589036 ?auto_589040 ) ) ( not ( = ?auto_589036 ?auto_589041 ) ) ( not ( = ?auto_589036 ?auto_589042 ) ) ( not ( = ?auto_589036 ?auto_589043 ) ) ( not ( = ?auto_589036 ?auto_589044 ) ) ( not ( = ?auto_589036 ?auto_589045 ) ) ( not ( = ?auto_589036 ?auto_589046 ) ) ( not ( = ?auto_589036 ?auto_589047 ) ) ( not ( = ?auto_589037 ?auto_589038 ) ) ( not ( = ?auto_589037 ?auto_589039 ) ) ( not ( = ?auto_589037 ?auto_589040 ) ) ( not ( = ?auto_589037 ?auto_589041 ) ) ( not ( = ?auto_589037 ?auto_589042 ) ) ( not ( = ?auto_589037 ?auto_589043 ) ) ( not ( = ?auto_589037 ?auto_589044 ) ) ( not ( = ?auto_589037 ?auto_589045 ) ) ( not ( = ?auto_589037 ?auto_589046 ) ) ( not ( = ?auto_589037 ?auto_589047 ) ) ( not ( = ?auto_589038 ?auto_589039 ) ) ( not ( = ?auto_589038 ?auto_589040 ) ) ( not ( = ?auto_589038 ?auto_589041 ) ) ( not ( = ?auto_589038 ?auto_589042 ) ) ( not ( = ?auto_589038 ?auto_589043 ) ) ( not ( = ?auto_589038 ?auto_589044 ) ) ( not ( = ?auto_589038 ?auto_589045 ) ) ( not ( = ?auto_589038 ?auto_589046 ) ) ( not ( = ?auto_589038 ?auto_589047 ) ) ( not ( = ?auto_589039 ?auto_589040 ) ) ( not ( = ?auto_589039 ?auto_589041 ) ) ( not ( = ?auto_589039 ?auto_589042 ) ) ( not ( = ?auto_589039 ?auto_589043 ) ) ( not ( = ?auto_589039 ?auto_589044 ) ) ( not ( = ?auto_589039 ?auto_589045 ) ) ( not ( = ?auto_589039 ?auto_589046 ) ) ( not ( = ?auto_589039 ?auto_589047 ) ) ( not ( = ?auto_589040 ?auto_589041 ) ) ( not ( = ?auto_589040 ?auto_589042 ) ) ( not ( = ?auto_589040 ?auto_589043 ) ) ( not ( = ?auto_589040 ?auto_589044 ) ) ( not ( = ?auto_589040 ?auto_589045 ) ) ( not ( = ?auto_589040 ?auto_589046 ) ) ( not ( = ?auto_589040 ?auto_589047 ) ) ( not ( = ?auto_589041 ?auto_589042 ) ) ( not ( = ?auto_589041 ?auto_589043 ) ) ( not ( = ?auto_589041 ?auto_589044 ) ) ( not ( = ?auto_589041 ?auto_589045 ) ) ( not ( = ?auto_589041 ?auto_589046 ) ) ( not ( = ?auto_589041 ?auto_589047 ) ) ( not ( = ?auto_589042 ?auto_589043 ) ) ( not ( = ?auto_589042 ?auto_589044 ) ) ( not ( = ?auto_589042 ?auto_589045 ) ) ( not ( = ?auto_589042 ?auto_589046 ) ) ( not ( = ?auto_589042 ?auto_589047 ) ) ( not ( = ?auto_589043 ?auto_589044 ) ) ( not ( = ?auto_589043 ?auto_589045 ) ) ( not ( = ?auto_589043 ?auto_589046 ) ) ( not ( = ?auto_589043 ?auto_589047 ) ) ( not ( = ?auto_589044 ?auto_589045 ) ) ( not ( = ?auto_589044 ?auto_589046 ) ) ( not ( = ?auto_589044 ?auto_589047 ) ) ( not ( = ?auto_589045 ?auto_589046 ) ) ( not ( = ?auto_589045 ?auto_589047 ) ) ( not ( = ?auto_589046 ?auto_589047 ) ) ( ON ?auto_589045 ?auto_589046 ) ( ON ?auto_589044 ?auto_589045 ) ( ON ?auto_589043 ?auto_589044 ) ( ON ?auto_589042 ?auto_589043 ) ( ON ?auto_589041 ?auto_589042 ) ( ON ?auto_589040 ?auto_589041 ) ( ON ?auto_589039 ?auto_589040 ) ( ON ?auto_589038 ?auto_589039 ) ( ON ?auto_589037 ?auto_589038 ) ( CLEAR ?auto_589035 ) ( ON ?auto_589036 ?auto_589037 ) ( CLEAR ?auto_589036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_589032 ?auto_589033 ?auto_589034 ?auto_589035 ?auto_589036 )
      ( MAKE-15PILE ?auto_589032 ?auto_589033 ?auto_589034 ?auto_589035 ?auto_589036 ?auto_589037 ?auto_589038 ?auto_589039 ?auto_589040 ?auto_589041 ?auto_589042 ?auto_589043 ?auto_589044 ?auto_589045 ?auto_589046 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_589094 - BLOCK
      ?auto_589095 - BLOCK
      ?auto_589096 - BLOCK
      ?auto_589097 - BLOCK
      ?auto_589098 - BLOCK
      ?auto_589099 - BLOCK
      ?auto_589100 - BLOCK
      ?auto_589101 - BLOCK
      ?auto_589102 - BLOCK
      ?auto_589103 - BLOCK
      ?auto_589104 - BLOCK
      ?auto_589105 - BLOCK
      ?auto_589106 - BLOCK
      ?auto_589107 - BLOCK
      ?auto_589108 - BLOCK
    )
    :vars
    (
      ?auto_589109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589108 ?auto_589109 ) ( ON-TABLE ?auto_589094 ) ( ON ?auto_589095 ?auto_589094 ) ( ON ?auto_589096 ?auto_589095 ) ( not ( = ?auto_589094 ?auto_589095 ) ) ( not ( = ?auto_589094 ?auto_589096 ) ) ( not ( = ?auto_589094 ?auto_589097 ) ) ( not ( = ?auto_589094 ?auto_589098 ) ) ( not ( = ?auto_589094 ?auto_589099 ) ) ( not ( = ?auto_589094 ?auto_589100 ) ) ( not ( = ?auto_589094 ?auto_589101 ) ) ( not ( = ?auto_589094 ?auto_589102 ) ) ( not ( = ?auto_589094 ?auto_589103 ) ) ( not ( = ?auto_589094 ?auto_589104 ) ) ( not ( = ?auto_589094 ?auto_589105 ) ) ( not ( = ?auto_589094 ?auto_589106 ) ) ( not ( = ?auto_589094 ?auto_589107 ) ) ( not ( = ?auto_589094 ?auto_589108 ) ) ( not ( = ?auto_589094 ?auto_589109 ) ) ( not ( = ?auto_589095 ?auto_589096 ) ) ( not ( = ?auto_589095 ?auto_589097 ) ) ( not ( = ?auto_589095 ?auto_589098 ) ) ( not ( = ?auto_589095 ?auto_589099 ) ) ( not ( = ?auto_589095 ?auto_589100 ) ) ( not ( = ?auto_589095 ?auto_589101 ) ) ( not ( = ?auto_589095 ?auto_589102 ) ) ( not ( = ?auto_589095 ?auto_589103 ) ) ( not ( = ?auto_589095 ?auto_589104 ) ) ( not ( = ?auto_589095 ?auto_589105 ) ) ( not ( = ?auto_589095 ?auto_589106 ) ) ( not ( = ?auto_589095 ?auto_589107 ) ) ( not ( = ?auto_589095 ?auto_589108 ) ) ( not ( = ?auto_589095 ?auto_589109 ) ) ( not ( = ?auto_589096 ?auto_589097 ) ) ( not ( = ?auto_589096 ?auto_589098 ) ) ( not ( = ?auto_589096 ?auto_589099 ) ) ( not ( = ?auto_589096 ?auto_589100 ) ) ( not ( = ?auto_589096 ?auto_589101 ) ) ( not ( = ?auto_589096 ?auto_589102 ) ) ( not ( = ?auto_589096 ?auto_589103 ) ) ( not ( = ?auto_589096 ?auto_589104 ) ) ( not ( = ?auto_589096 ?auto_589105 ) ) ( not ( = ?auto_589096 ?auto_589106 ) ) ( not ( = ?auto_589096 ?auto_589107 ) ) ( not ( = ?auto_589096 ?auto_589108 ) ) ( not ( = ?auto_589096 ?auto_589109 ) ) ( not ( = ?auto_589097 ?auto_589098 ) ) ( not ( = ?auto_589097 ?auto_589099 ) ) ( not ( = ?auto_589097 ?auto_589100 ) ) ( not ( = ?auto_589097 ?auto_589101 ) ) ( not ( = ?auto_589097 ?auto_589102 ) ) ( not ( = ?auto_589097 ?auto_589103 ) ) ( not ( = ?auto_589097 ?auto_589104 ) ) ( not ( = ?auto_589097 ?auto_589105 ) ) ( not ( = ?auto_589097 ?auto_589106 ) ) ( not ( = ?auto_589097 ?auto_589107 ) ) ( not ( = ?auto_589097 ?auto_589108 ) ) ( not ( = ?auto_589097 ?auto_589109 ) ) ( not ( = ?auto_589098 ?auto_589099 ) ) ( not ( = ?auto_589098 ?auto_589100 ) ) ( not ( = ?auto_589098 ?auto_589101 ) ) ( not ( = ?auto_589098 ?auto_589102 ) ) ( not ( = ?auto_589098 ?auto_589103 ) ) ( not ( = ?auto_589098 ?auto_589104 ) ) ( not ( = ?auto_589098 ?auto_589105 ) ) ( not ( = ?auto_589098 ?auto_589106 ) ) ( not ( = ?auto_589098 ?auto_589107 ) ) ( not ( = ?auto_589098 ?auto_589108 ) ) ( not ( = ?auto_589098 ?auto_589109 ) ) ( not ( = ?auto_589099 ?auto_589100 ) ) ( not ( = ?auto_589099 ?auto_589101 ) ) ( not ( = ?auto_589099 ?auto_589102 ) ) ( not ( = ?auto_589099 ?auto_589103 ) ) ( not ( = ?auto_589099 ?auto_589104 ) ) ( not ( = ?auto_589099 ?auto_589105 ) ) ( not ( = ?auto_589099 ?auto_589106 ) ) ( not ( = ?auto_589099 ?auto_589107 ) ) ( not ( = ?auto_589099 ?auto_589108 ) ) ( not ( = ?auto_589099 ?auto_589109 ) ) ( not ( = ?auto_589100 ?auto_589101 ) ) ( not ( = ?auto_589100 ?auto_589102 ) ) ( not ( = ?auto_589100 ?auto_589103 ) ) ( not ( = ?auto_589100 ?auto_589104 ) ) ( not ( = ?auto_589100 ?auto_589105 ) ) ( not ( = ?auto_589100 ?auto_589106 ) ) ( not ( = ?auto_589100 ?auto_589107 ) ) ( not ( = ?auto_589100 ?auto_589108 ) ) ( not ( = ?auto_589100 ?auto_589109 ) ) ( not ( = ?auto_589101 ?auto_589102 ) ) ( not ( = ?auto_589101 ?auto_589103 ) ) ( not ( = ?auto_589101 ?auto_589104 ) ) ( not ( = ?auto_589101 ?auto_589105 ) ) ( not ( = ?auto_589101 ?auto_589106 ) ) ( not ( = ?auto_589101 ?auto_589107 ) ) ( not ( = ?auto_589101 ?auto_589108 ) ) ( not ( = ?auto_589101 ?auto_589109 ) ) ( not ( = ?auto_589102 ?auto_589103 ) ) ( not ( = ?auto_589102 ?auto_589104 ) ) ( not ( = ?auto_589102 ?auto_589105 ) ) ( not ( = ?auto_589102 ?auto_589106 ) ) ( not ( = ?auto_589102 ?auto_589107 ) ) ( not ( = ?auto_589102 ?auto_589108 ) ) ( not ( = ?auto_589102 ?auto_589109 ) ) ( not ( = ?auto_589103 ?auto_589104 ) ) ( not ( = ?auto_589103 ?auto_589105 ) ) ( not ( = ?auto_589103 ?auto_589106 ) ) ( not ( = ?auto_589103 ?auto_589107 ) ) ( not ( = ?auto_589103 ?auto_589108 ) ) ( not ( = ?auto_589103 ?auto_589109 ) ) ( not ( = ?auto_589104 ?auto_589105 ) ) ( not ( = ?auto_589104 ?auto_589106 ) ) ( not ( = ?auto_589104 ?auto_589107 ) ) ( not ( = ?auto_589104 ?auto_589108 ) ) ( not ( = ?auto_589104 ?auto_589109 ) ) ( not ( = ?auto_589105 ?auto_589106 ) ) ( not ( = ?auto_589105 ?auto_589107 ) ) ( not ( = ?auto_589105 ?auto_589108 ) ) ( not ( = ?auto_589105 ?auto_589109 ) ) ( not ( = ?auto_589106 ?auto_589107 ) ) ( not ( = ?auto_589106 ?auto_589108 ) ) ( not ( = ?auto_589106 ?auto_589109 ) ) ( not ( = ?auto_589107 ?auto_589108 ) ) ( not ( = ?auto_589107 ?auto_589109 ) ) ( not ( = ?auto_589108 ?auto_589109 ) ) ( ON ?auto_589107 ?auto_589108 ) ( ON ?auto_589106 ?auto_589107 ) ( ON ?auto_589105 ?auto_589106 ) ( ON ?auto_589104 ?auto_589105 ) ( ON ?auto_589103 ?auto_589104 ) ( ON ?auto_589102 ?auto_589103 ) ( ON ?auto_589101 ?auto_589102 ) ( ON ?auto_589100 ?auto_589101 ) ( ON ?auto_589099 ?auto_589100 ) ( ON ?auto_589098 ?auto_589099 ) ( CLEAR ?auto_589096 ) ( ON ?auto_589097 ?auto_589098 ) ( CLEAR ?auto_589097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_589094 ?auto_589095 ?auto_589096 ?auto_589097 )
      ( MAKE-15PILE ?auto_589094 ?auto_589095 ?auto_589096 ?auto_589097 ?auto_589098 ?auto_589099 ?auto_589100 ?auto_589101 ?auto_589102 ?auto_589103 ?auto_589104 ?auto_589105 ?auto_589106 ?auto_589107 ?auto_589108 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_589156 - BLOCK
      ?auto_589157 - BLOCK
      ?auto_589158 - BLOCK
      ?auto_589159 - BLOCK
      ?auto_589160 - BLOCK
      ?auto_589161 - BLOCK
      ?auto_589162 - BLOCK
      ?auto_589163 - BLOCK
      ?auto_589164 - BLOCK
      ?auto_589165 - BLOCK
      ?auto_589166 - BLOCK
      ?auto_589167 - BLOCK
      ?auto_589168 - BLOCK
      ?auto_589169 - BLOCK
      ?auto_589170 - BLOCK
    )
    :vars
    (
      ?auto_589171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589170 ?auto_589171 ) ( ON-TABLE ?auto_589156 ) ( ON ?auto_589157 ?auto_589156 ) ( not ( = ?auto_589156 ?auto_589157 ) ) ( not ( = ?auto_589156 ?auto_589158 ) ) ( not ( = ?auto_589156 ?auto_589159 ) ) ( not ( = ?auto_589156 ?auto_589160 ) ) ( not ( = ?auto_589156 ?auto_589161 ) ) ( not ( = ?auto_589156 ?auto_589162 ) ) ( not ( = ?auto_589156 ?auto_589163 ) ) ( not ( = ?auto_589156 ?auto_589164 ) ) ( not ( = ?auto_589156 ?auto_589165 ) ) ( not ( = ?auto_589156 ?auto_589166 ) ) ( not ( = ?auto_589156 ?auto_589167 ) ) ( not ( = ?auto_589156 ?auto_589168 ) ) ( not ( = ?auto_589156 ?auto_589169 ) ) ( not ( = ?auto_589156 ?auto_589170 ) ) ( not ( = ?auto_589156 ?auto_589171 ) ) ( not ( = ?auto_589157 ?auto_589158 ) ) ( not ( = ?auto_589157 ?auto_589159 ) ) ( not ( = ?auto_589157 ?auto_589160 ) ) ( not ( = ?auto_589157 ?auto_589161 ) ) ( not ( = ?auto_589157 ?auto_589162 ) ) ( not ( = ?auto_589157 ?auto_589163 ) ) ( not ( = ?auto_589157 ?auto_589164 ) ) ( not ( = ?auto_589157 ?auto_589165 ) ) ( not ( = ?auto_589157 ?auto_589166 ) ) ( not ( = ?auto_589157 ?auto_589167 ) ) ( not ( = ?auto_589157 ?auto_589168 ) ) ( not ( = ?auto_589157 ?auto_589169 ) ) ( not ( = ?auto_589157 ?auto_589170 ) ) ( not ( = ?auto_589157 ?auto_589171 ) ) ( not ( = ?auto_589158 ?auto_589159 ) ) ( not ( = ?auto_589158 ?auto_589160 ) ) ( not ( = ?auto_589158 ?auto_589161 ) ) ( not ( = ?auto_589158 ?auto_589162 ) ) ( not ( = ?auto_589158 ?auto_589163 ) ) ( not ( = ?auto_589158 ?auto_589164 ) ) ( not ( = ?auto_589158 ?auto_589165 ) ) ( not ( = ?auto_589158 ?auto_589166 ) ) ( not ( = ?auto_589158 ?auto_589167 ) ) ( not ( = ?auto_589158 ?auto_589168 ) ) ( not ( = ?auto_589158 ?auto_589169 ) ) ( not ( = ?auto_589158 ?auto_589170 ) ) ( not ( = ?auto_589158 ?auto_589171 ) ) ( not ( = ?auto_589159 ?auto_589160 ) ) ( not ( = ?auto_589159 ?auto_589161 ) ) ( not ( = ?auto_589159 ?auto_589162 ) ) ( not ( = ?auto_589159 ?auto_589163 ) ) ( not ( = ?auto_589159 ?auto_589164 ) ) ( not ( = ?auto_589159 ?auto_589165 ) ) ( not ( = ?auto_589159 ?auto_589166 ) ) ( not ( = ?auto_589159 ?auto_589167 ) ) ( not ( = ?auto_589159 ?auto_589168 ) ) ( not ( = ?auto_589159 ?auto_589169 ) ) ( not ( = ?auto_589159 ?auto_589170 ) ) ( not ( = ?auto_589159 ?auto_589171 ) ) ( not ( = ?auto_589160 ?auto_589161 ) ) ( not ( = ?auto_589160 ?auto_589162 ) ) ( not ( = ?auto_589160 ?auto_589163 ) ) ( not ( = ?auto_589160 ?auto_589164 ) ) ( not ( = ?auto_589160 ?auto_589165 ) ) ( not ( = ?auto_589160 ?auto_589166 ) ) ( not ( = ?auto_589160 ?auto_589167 ) ) ( not ( = ?auto_589160 ?auto_589168 ) ) ( not ( = ?auto_589160 ?auto_589169 ) ) ( not ( = ?auto_589160 ?auto_589170 ) ) ( not ( = ?auto_589160 ?auto_589171 ) ) ( not ( = ?auto_589161 ?auto_589162 ) ) ( not ( = ?auto_589161 ?auto_589163 ) ) ( not ( = ?auto_589161 ?auto_589164 ) ) ( not ( = ?auto_589161 ?auto_589165 ) ) ( not ( = ?auto_589161 ?auto_589166 ) ) ( not ( = ?auto_589161 ?auto_589167 ) ) ( not ( = ?auto_589161 ?auto_589168 ) ) ( not ( = ?auto_589161 ?auto_589169 ) ) ( not ( = ?auto_589161 ?auto_589170 ) ) ( not ( = ?auto_589161 ?auto_589171 ) ) ( not ( = ?auto_589162 ?auto_589163 ) ) ( not ( = ?auto_589162 ?auto_589164 ) ) ( not ( = ?auto_589162 ?auto_589165 ) ) ( not ( = ?auto_589162 ?auto_589166 ) ) ( not ( = ?auto_589162 ?auto_589167 ) ) ( not ( = ?auto_589162 ?auto_589168 ) ) ( not ( = ?auto_589162 ?auto_589169 ) ) ( not ( = ?auto_589162 ?auto_589170 ) ) ( not ( = ?auto_589162 ?auto_589171 ) ) ( not ( = ?auto_589163 ?auto_589164 ) ) ( not ( = ?auto_589163 ?auto_589165 ) ) ( not ( = ?auto_589163 ?auto_589166 ) ) ( not ( = ?auto_589163 ?auto_589167 ) ) ( not ( = ?auto_589163 ?auto_589168 ) ) ( not ( = ?auto_589163 ?auto_589169 ) ) ( not ( = ?auto_589163 ?auto_589170 ) ) ( not ( = ?auto_589163 ?auto_589171 ) ) ( not ( = ?auto_589164 ?auto_589165 ) ) ( not ( = ?auto_589164 ?auto_589166 ) ) ( not ( = ?auto_589164 ?auto_589167 ) ) ( not ( = ?auto_589164 ?auto_589168 ) ) ( not ( = ?auto_589164 ?auto_589169 ) ) ( not ( = ?auto_589164 ?auto_589170 ) ) ( not ( = ?auto_589164 ?auto_589171 ) ) ( not ( = ?auto_589165 ?auto_589166 ) ) ( not ( = ?auto_589165 ?auto_589167 ) ) ( not ( = ?auto_589165 ?auto_589168 ) ) ( not ( = ?auto_589165 ?auto_589169 ) ) ( not ( = ?auto_589165 ?auto_589170 ) ) ( not ( = ?auto_589165 ?auto_589171 ) ) ( not ( = ?auto_589166 ?auto_589167 ) ) ( not ( = ?auto_589166 ?auto_589168 ) ) ( not ( = ?auto_589166 ?auto_589169 ) ) ( not ( = ?auto_589166 ?auto_589170 ) ) ( not ( = ?auto_589166 ?auto_589171 ) ) ( not ( = ?auto_589167 ?auto_589168 ) ) ( not ( = ?auto_589167 ?auto_589169 ) ) ( not ( = ?auto_589167 ?auto_589170 ) ) ( not ( = ?auto_589167 ?auto_589171 ) ) ( not ( = ?auto_589168 ?auto_589169 ) ) ( not ( = ?auto_589168 ?auto_589170 ) ) ( not ( = ?auto_589168 ?auto_589171 ) ) ( not ( = ?auto_589169 ?auto_589170 ) ) ( not ( = ?auto_589169 ?auto_589171 ) ) ( not ( = ?auto_589170 ?auto_589171 ) ) ( ON ?auto_589169 ?auto_589170 ) ( ON ?auto_589168 ?auto_589169 ) ( ON ?auto_589167 ?auto_589168 ) ( ON ?auto_589166 ?auto_589167 ) ( ON ?auto_589165 ?auto_589166 ) ( ON ?auto_589164 ?auto_589165 ) ( ON ?auto_589163 ?auto_589164 ) ( ON ?auto_589162 ?auto_589163 ) ( ON ?auto_589161 ?auto_589162 ) ( ON ?auto_589160 ?auto_589161 ) ( ON ?auto_589159 ?auto_589160 ) ( CLEAR ?auto_589157 ) ( ON ?auto_589158 ?auto_589159 ) ( CLEAR ?auto_589158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_589156 ?auto_589157 ?auto_589158 )
      ( MAKE-15PILE ?auto_589156 ?auto_589157 ?auto_589158 ?auto_589159 ?auto_589160 ?auto_589161 ?auto_589162 ?auto_589163 ?auto_589164 ?auto_589165 ?auto_589166 ?auto_589167 ?auto_589168 ?auto_589169 ?auto_589170 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_589218 - BLOCK
      ?auto_589219 - BLOCK
      ?auto_589220 - BLOCK
      ?auto_589221 - BLOCK
      ?auto_589222 - BLOCK
      ?auto_589223 - BLOCK
      ?auto_589224 - BLOCK
      ?auto_589225 - BLOCK
      ?auto_589226 - BLOCK
      ?auto_589227 - BLOCK
      ?auto_589228 - BLOCK
      ?auto_589229 - BLOCK
      ?auto_589230 - BLOCK
      ?auto_589231 - BLOCK
      ?auto_589232 - BLOCK
    )
    :vars
    (
      ?auto_589233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589232 ?auto_589233 ) ( ON-TABLE ?auto_589218 ) ( not ( = ?auto_589218 ?auto_589219 ) ) ( not ( = ?auto_589218 ?auto_589220 ) ) ( not ( = ?auto_589218 ?auto_589221 ) ) ( not ( = ?auto_589218 ?auto_589222 ) ) ( not ( = ?auto_589218 ?auto_589223 ) ) ( not ( = ?auto_589218 ?auto_589224 ) ) ( not ( = ?auto_589218 ?auto_589225 ) ) ( not ( = ?auto_589218 ?auto_589226 ) ) ( not ( = ?auto_589218 ?auto_589227 ) ) ( not ( = ?auto_589218 ?auto_589228 ) ) ( not ( = ?auto_589218 ?auto_589229 ) ) ( not ( = ?auto_589218 ?auto_589230 ) ) ( not ( = ?auto_589218 ?auto_589231 ) ) ( not ( = ?auto_589218 ?auto_589232 ) ) ( not ( = ?auto_589218 ?auto_589233 ) ) ( not ( = ?auto_589219 ?auto_589220 ) ) ( not ( = ?auto_589219 ?auto_589221 ) ) ( not ( = ?auto_589219 ?auto_589222 ) ) ( not ( = ?auto_589219 ?auto_589223 ) ) ( not ( = ?auto_589219 ?auto_589224 ) ) ( not ( = ?auto_589219 ?auto_589225 ) ) ( not ( = ?auto_589219 ?auto_589226 ) ) ( not ( = ?auto_589219 ?auto_589227 ) ) ( not ( = ?auto_589219 ?auto_589228 ) ) ( not ( = ?auto_589219 ?auto_589229 ) ) ( not ( = ?auto_589219 ?auto_589230 ) ) ( not ( = ?auto_589219 ?auto_589231 ) ) ( not ( = ?auto_589219 ?auto_589232 ) ) ( not ( = ?auto_589219 ?auto_589233 ) ) ( not ( = ?auto_589220 ?auto_589221 ) ) ( not ( = ?auto_589220 ?auto_589222 ) ) ( not ( = ?auto_589220 ?auto_589223 ) ) ( not ( = ?auto_589220 ?auto_589224 ) ) ( not ( = ?auto_589220 ?auto_589225 ) ) ( not ( = ?auto_589220 ?auto_589226 ) ) ( not ( = ?auto_589220 ?auto_589227 ) ) ( not ( = ?auto_589220 ?auto_589228 ) ) ( not ( = ?auto_589220 ?auto_589229 ) ) ( not ( = ?auto_589220 ?auto_589230 ) ) ( not ( = ?auto_589220 ?auto_589231 ) ) ( not ( = ?auto_589220 ?auto_589232 ) ) ( not ( = ?auto_589220 ?auto_589233 ) ) ( not ( = ?auto_589221 ?auto_589222 ) ) ( not ( = ?auto_589221 ?auto_589223 ) ) ( not ( = ?auto_589221 ?auto_589224 ) ) ( not ( = ?auto_589221 ?auto_589225 ) ) ( not ( = ?auto_589221 ?auto_589226 ) ) ( not ( = ?auto_589221 ?auto_589227 ) ) ( not ( = ?auto_589221 ?auto_589228 ) ) ( not ( = ?auto_589221 ?auto_589229 ) ) ( not ( = ?auto_589221 ?auto_589230 ) ) ( not ( = ?auto_589221 ?auto_589231 ) ) ( not ( = ?auto_589221 ?auto_589232 ) ) ( not ( = ?auto_589221 ?auto_589233 ) ) ( not ( = ?auto_589222 ?auto_589223 ) ) ( not ( = ?auto_589222 ?auto_589224 ) ) ( not ( = ?auto_589222 ?auto_589225 ) ) ( not ( = ?auto_589222 ?auto_589226 ) ) ( not ( = ?auto_589222 ?auto_589227 ) ) ( not ( = ?auto_589222 ?auto_589228 ) ) ( not ( = ?auto_589222 ?auto_589229 ) ) ( not ( = ?auto_589222 ?auto_589230 ) ) ( not ( = ?auto_589222 ?auto_589231 ) ) ( not ( = ?auto_589222 ?auto_589232 ) ) ( not ( = ?auto_589222 ?auto_589233 ) ) ( not ( = ?auto_589223 ?auto_589224 ) ) ( not ( = ?auto_589223 ?auto_589225 ) ) ( not ( = ?auto_589223 ?auto_589226 ) ) ( not ( = ?auto_589223 ?auto_589227 ) ) ( not ( = ?auto_589223 ?auto_589228 ) ) ( not ( = ?auto_589223 ?auto_589229 ) ) ( not ( = ?auto_589223 ?auto_589230 ) ) ( not ( = ?auto_589223 ?auto_589231 ) ) ( not ( = ?auto_589223 ?auto_589232 ) ) ( not ( = ?auto_589223 ?auto_589233 ) ) ( not ( = ?auto_589224 ?auto_589225 ) ) ( not ( = ?auto_589224 ?auto_589226 ) ) ( not ( = ?auto_589224 ?auto_589227 ) ) ( not ( = ?auto_589224 ?auto_589228 ) ) ( not ( = ?auto_589224 ?auto_589229 ) ) ( not ( = ?auto_589224 ?auto_589230 ) ) ( not ( = ?auto_589224 ?auto_589231 ) ) ( not ( = ?auto_589224 ?auto_589232 ) ) ( not ( = ?auto_589224 ?auto_589233 ) ) ( not ( = ?auto_589225 ?auto_589226 ) ) ( not ( = ?auto_589225 ?auto_589227 ) ) ( not ( = ?auto_589225 ?auto_589228 ) ) ( not ( = ?auto_589225 ?auto_589229 ) ) ( not ( = ?auto_589225 ?auto_589230 ) ) ( not ( = ?auto_589225 ?auto_589231 ) ) ( not ( = ?auto_589225 ?auto_589232 ) ) ( not ( = ?auto_589225 ?auto_589233 ) ) ( not ( = ?auto_589226 ?auto_589227 ) ) ( not ( = ?auto_589226 ?auto_589228 ) ) ( not ( = ?auto_589226 ?auto_589229 ) ) ( not ( = ?auto_589226 ?auto_589230 ) ) ( not ( = ?auto_589226 ?auto_589231 ) ) ( not ( = ?auto_589226 ?auto_589232 ) ) ( not ( = ?auto_589226 ?auto_589233 ) ) ( not ( = ?auto_589227 ?auto_589228 ) ) ( not ( = ?auto_589227 ?auto_589229 ) ) ( not ( = ?auto_589227 ?auto_589230 ) ) ( not ( = ?auto_589227 ?auto_589231 ) ) ( not ( = ?auto_589227 ?auto_589232 ) ) ( not ( = ?auto_589227 ?auto_589233 ) ) ( not ( = ?auto_589228 ?auto_589229 ) ) ( not ( = ?auto_589228 ?auto_589230 ) ) ( not ( = ?auto_589228 ?auto_589231 ) ) ( not ( = ?auto_589228 ?auto_589232 ) ) ( not ( = ?auto_589228 ?auto_589233 ) ) ( not ( = ?auto_589229 ?auto_589230 ) ) ( not ( = ?auto_589229 ?auto_589231 ) ) ( not ( = ?auto_589229 ?auto_589232 ) ) ( not ( = ?auto_589229 ?auto_589233 ) ) ( not ( = ?auto_589230 ?auto_589231 ) ) ( not ( = ?auto_589230 ?auto_589232 ) ) ( not ( = ?auto_589230 ?auto_589233 ) ) ( not ( = ?auto_589231 ?auto_589232 ) ) ( not ( = ?auto_589231 ?auto_589233 ) ) ( not ( = ?auto_589232 ?auto_589233 ) ) ( ON ?auto_589231 ?auto_589232 ) ( ON ?auto_589230 ?auto_589231 ) ( ON ?auto_589229 ?auto_589230 ) ( ON ?auto_589228 ?auto_589229 ) ( ON ?auto_589227 ?auto_589228 ) ( ON ?auto_589226 ?auto_589227 ) ( ON ?auto_589225 ?auto_589226 ) ( ON ?auto_589224 ?auto_589225 ) ( ON ?auto_589223 ?auto_589224 ) ( ON ?auto_589222 ?auto_589223 ) ( ON ?auto_589221 ?auto_589222 ) ( ON ?auto_589220 ?auto_589221 ) ( CLEAR ?auto_589218 ) ( ON ?auto_589219 ?auto_589220 ) ( CLEAR ?auto_589219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_589218 ?auto_589219 )
      ( MAKE-15PILE ?auto_589218 ?auto_589219 ?auto_589220 ?auto_589221 ?auto_589222 ?auto_589223 ?auto_589224 ?auto_589225 ?auto_589226 ?auto_589227 ?auto_589228 ?auto_589229 ?auto_589230 ?auto_589231 ?auto_589232 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_589280 - BLOCK
      ?auto_589281 - BLOCK
      ?auto_589282 - BLOCK
      ?auto_589283 - BLOCK
      ?auto_589284 - BLOCK
      ?auto_589285 - BLOCK
      ?auto_589286 - BLOCK
      ?auto_589287 - BLOCK
      ?auto_589288 - BLOCK
      ?auto_589289 - BLOCK
      ?auto_589290 - BLOCK
      ?auto_589291 - BLOCK
      ?auto_589292 - BLOCK
      ?auto_589293 - BLOCK
      ?auto_589294 - BLOCK
    )
    :vars
    (
      ?auto_589295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589294 ?auto_589295 ) ( not ( = ?auto_589280 ?auto_589281 ) ) ( not ( = ?auto_589280 ?auto_589282 ) ) ( not ( = ?auto_589280 ?auto_589283 ) ) ( not ( = ?auto_589280 ?auto_589284 ) ) ( not ( = ?auto_589280 ?auto_589285 ) ) ( not ( = ?auto_589280 ?auto_589286 ) ) ( not ( = ?auto_589280 ?auto_589287 ) ) ( not ( = ?auto_589280 ?auto_589288 ) ) ( not ( = ?auto_589280 ?auto_589289 ) ) ( not ( = ?auto_589280 ?auto_589290 ) ) ( not ( = ?auto_589280 ?auto_589291 ) ) ( not ( = ?auto_589280 ?auto_589292 ) ) ( not ( = ?auto_589280 ?auto_589293 ) ) ( not ( = ?auto_589280 ?auto_589294 ) ) ( not ( = ?auto_589280 ?auto_589295 ) ) ( not ( = ?auto_589281 ?auto_589282 ) ) ( not ( = ?auto_589281 ?auto_589283 ) ) ( not ( = ?auto_589281 ?auto_589284 ) ) ( not ( = ?auto_589281 ?auto_589285 ) ) ( not ( = ?auto_589281 ?auto_589286 ) ) ( not ( = ?auto_589281 ?auto_589287 ) ) ( not ( = ?auto_589281 ?auto_589288 ) ) ( not ( = ?auto_589281 ?auto_589289 ) ) ( not ( = ?auto_589281 ?auto_589290 ) ) ( not ( = ?auto_589281 ?auto_589291 ) ) ( not ( = ?auto_589281 ?auto_589292 ) ) ( not ( = ?auto_589281 ?auto_589293 ) ) ( not ( = ?auto_589281 ?auto_589294 ) ) ( not ( = ?auto_589281 ?auto_589295 ) ) ( not ( = ?auto_589282 ?auto_589283 ) ) ( not ( = ?auto_589282 ?auto_589284 ) ) ( not ( = ?auto_589282 ?auto_589285 ) ) ( not ( = ?auto_589282 ?auto_589286 ) ) ( not ( = ?auto_589282 ?auto_589287 ) ) ( not ( = ?auto_589282 ?auto_589288 ) ) ( not ( = ?auto_589282 ?auto_589289 ) ) ( not ( = ?auto_589282 ?auto_589290 ) ) ( not ( = ?auto_589282 ?auto_589291 ) ) ( not ( = ?auto_589282 ?auto_589292 ) ) ( not ( = ?auto_589282 ?auto_589293 ) ) ( not ( = ?auto_589282 ?auto_589294 ) ) ( not ( = ?auto_589282 ?auto_589295 ) ) ( not ( = ?auto_589283 ?auto_589284 ) ) ( not ( = ?auto_589283 ?auto_589285 ) ) ( not ( = ?auto_589283 ?auto_589286 ) ) ( not ( = ?auto_589283 ?auto_589287 ) ) ( not ( = ?auto_589283 ?auto_589288 ) ) ( not ( = ?auto_589283 ?auto_589289 ) ) ( not ( = ?auto_589283 ?auto_589290 ) ) ( not ( = ?auto_589283 ?auto_589291 ) ) ( not ( = ?auto_589283 ?auto_589292 ) ) ( not ( = ?auto_589283 ?auto_589293 ) ) ( not ( = ?auto_589283 ?auto_589294 ) ) ( not ( = ?auto_589283 ?auto_589295 ) ) ( not ( = ?auto_589284 ?auto_589285 ) ) ( not ( = ?auto_589284 ?auto_589286 ) ) ( not ( = ?auto_589284 ?auto_589287 ) ) ( not ( = ?auto_589284 ?auto_589288 ) ) ( not ( = ?auto_589284 ?auto_589289 ) ) ( not ( = ?auto_589284 ?auto_589290 ) ) ( not ( = ?auto_589284 ?auto_589291 ) ) ( not ( = ?auto_589284 ?auto_589292 ) ) ( not ( = ?auto_589284 ?auto_589293 ) ) ( not ( = ?auto_589284 ?auto_589294 ) ) ( not ( = ?auto_589284 ?auto_589295 ) ) ( not ( = ?auto_589285 ?auto_589286 ) ) ( not ( = ?auto_589285 ?auto_589287 ) ) ( not ( = ?auto_589285 ?auto_589288 ) ) ( not ( = ?auto_589285 ?auto_589289 ) ) ( not ( = ?auto_589285 ?auto_589290 ) ) ( not ( = ?auto_589285 ?auto_589291 ) ) ( not ( = ?auto_589285 ?auto_589292 ) ) ( not ( = ?auto_589285 ?auto_589293 ) ) ( not ( = ?auto_589285 ?auto_589294 ) ) ( not ( = ?auto_589285 ?auto_589295 ) ) ( not ( = ?auto_589286 ?auto_589287 ) ) ( not ( = ?auto_589286 ?auto_589288 ) ) ( not ( = ?auto_589286 ?auto_589289 ) ) ( not ( = ?auto_589286 ?auto_589290 ) ) ( not ( = ?auto_589286 ?auto_589291 ) ) ( not ( = ?auto_589286 ?auto_589292 ) ) ( not ( = ?auto_589286 ?auto_589293 ) ) ( not ( = ?auto_589286 ?auto_589294 ) ) ( not ( = ?auto_589286 ?auto_589295 ) ) ( not ( = ?auto_589287 ?auto_589288 ) ) ( not ( = ?auto_589287 ?auto_589289 ) ) ( not ( = ?auto_589287 ?auto_589290 ) ) ( not ( = ?auto_589287 ?auto_589291 ) ) ( not ( = ?auto_589287 ?auto_589292 ) ) ( not ( = ?auto_589287 ?auto_589293 ) ) ( not ( = ?auto_589287 ?auto_589294 ) ) ( not ( = ?auto_589287 ?auto_589295 ) ) ( not ( = ?auto_589288 ?auto_589289 ) ) ( not ( = ?auto_589288 ?auto_589290 ) ) ( not ( = ?auto_589288 ?auto_589291 ) ) ( not ( = ?auto_589288 ?auto_589292 ) ) ( not ( = ?auto_589288 ?auto_589293 ) ) ( not ( = ?auto_589288 ?auto_589294 ) ) ( not ( = ?auto_589288 ?auto_589295 ) ) ( not ( = ?auto_589289 ?auto_589290 ) ) ( not ( = ?auto_589289 ?auto_589291 ) ) ( not ( = ?auto_589289 ?auto_589292 ) ) ( not ( = ?auto_589289 ?auto_589293 ) ) ( not ( = ?auto_589289 ?auto_589294 ) ) ( not ( = ?auto_589289 ?auto_589295 ) ) ( not ( = ?auto_589290 ?auto_589291 ) ) ( not ( = ?auto_589290 ?auto_589292 ) ) ( not ( = ?auto_589290 ?auto_589293 ) ) ( not ( = ?auto_589290 ?auto_589294 ) ) ( not ( = ?auto_589290 ?auto_589295 ) ) ( not ( = ?auto_589291 ?auto_589292 ) ) ( not ( = ?auto_589291 ?auto_589293 ) ) ( not ( = ?auto_589291 ?auto_589294 ) ) ( not ( = ?auto_589291 ?auto_589295 ) ) ( not ( = ?auto_589292 ?auto_589293 ) ) ( not ( = ?auto_589292 ?auto_589294 ) ) ( not ( = ?auto_589292 ?auto_589295 ) ) ( not ( = ?auto_589293 ?auto_589294 ) ) ( not ( = ?auto_589293 ?auto_589295 ) ) ( not ( = ?auto_589294 ?auto_589295 ) ) ( ON ?auto_589293 ?auto_589294 ) ( ON ?auto_589292 ?auto_589293 ) ( ON ?auto_589291 ?auto_589292 ) ( ON ?auto_589290 ?auto_589291 ) ( ON ?auto_589289 ?auto_589290 ) ( ON ?auto_589288 ?auto_589289 ) ( ON ?auto_589287 ?auto_589288 ) ( ON ?auto_589286 ?auto_589287 ) ( ON ?auto_589285 ?auto_589286 ) ( ON ?auto_589284 ?auto_589285 ) ( ON ?auto_589283 ?auto_589284 ) ( ON ?auto_589282 ?auto_589283 ) ( ON ?auto_589281 ?auto_589282 ) ( ON ?auto_589280 ?auto_589281 ) ( CLEAR ?auto_589280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_589280 )
      ( MAKE-15PILE ?auto_589280 ?auto_589281 ?auto_589282 ?auto_589283 ?auto_589284 ?auto_589285 ?auto_589286 ?auto_589287 ?auto_589288 ?auto_589289 ?auto_589290 ?auto_589291 ?auto_589292 ?auto_589293 ?auto_589294 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589343 - BLOCK
      ?auto_589344 - BLOCK
      ?auto_589345 - BLOCK
      ?auto_589346 - BLOCK
      ?auto_589347 - BLOCK
      ?auto_589348 - BLOCK
      ?auto_589349 - BLOCK
      ?auto_589350 - BLOCK
      ?auto_589351 - BLOCK
      ?auto_589352 - BLOCK
      ?auto_589353 - BLOCK
      ?auto_589354 - BLOCK
      ?auto_589355 - BLOCK
      ?auto_589356 - BLOCK
      ?auto_589357 - BLOCK
      ?auto_589358 - BLOCK
    )
    :vars
    (
      ?auto_589359 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_589357 ) ( ON ?auto_589358 ?auto_589359 ) ( CLEAR ?auto_589358 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_589343 ) ( ON ?auto_589344 ?auto_589343 ) ( ON ?auto_589345 ?auto_589344 ) ( ON ?auto_589346 ?auto_589345 ) ( ON ?auto_589347 ?auto_589346 ) ( ON ?auto_589348 ?auto_589347 ) ( ON ?auto_589349 ?auto_589348 ) ( ON ?auto_589350 ?auto_589349 ) ( ON ?auto_589351 ?auto_589350 ) ( ON ?auto_589352 ?auto_589351 ) ( ON ?auto_589353 ?auto_589352 ) ( ON ?auto_589354 ?auto_589353 ) ( ON ?auto_589355 ?auto_589354 ) ( ON ?auto_589356 ?auto_589355 ) ( ON ?auto_589357 ?auto_589356 ) ( not ( = ?auto_589343 ?auto_589344 ) ) ( not ( = ?auto_589343 ?auto_589345 ) ) ( not ( = ?auto_589343 ?auto_589346 ) ) ( not ( = ?auto_589343 ?auto_589347 ) ) ( not ( = ?auto_589343 ?auto_589348 ) ) ( not ( = ?auto_589343 ?auto_589349 ) ) ( not ( = ?auto_589343 ?auto_589350 ) ) ( not ( = ?auto_589343 ?auto_589351 ) ) ( not ( = ?auto_589343 ?auto_589352 ) ) ( not ( = ?auto_589343 ?auto_589353 ) ) ( not ( = ?auto_589343 ?auto_589354 ) ) ( not ( = ?auto_589343 ?auto_589355 ) ) ( not ( = ?auto_589343 ?auto_589356 ) ) ( not ( = ?auto_589343 ?auto_589357 ) ) ( not ( = ?auto_589343 ?auto_589358 ) ) ( not ( = ?auto_589343 ?auto_589359 ) ) ( not ( = ?auto_589344 ?auto_589345 ) ) ( not ( = ?auto_589344 ?auto_589346 ) ) ( not ( = ?auto_589344 ?auto_589347 ) ) ( not ( = ?auto_589344 ?auto_589348 ) ) ( not ( = ?auto_589344 ?auto_589349 ) ) ( not ( = ?auto_589344 ?auto_589350 ) ) ( not ( = ?auto_589344 ?auto_589351 ) ) ( not ( = ?auto_589344 ?auto_589352 ) ) ( not ( = ?auto_589344 ?auto_589353 ) ) ( not ( = ?auto_589344 ?auto_589354 ) ) ( not ( = ?auto_589344 ?auto_589355 ) ) ( not ( = ?auto_589344 ?auto_589356 ) ) ( not ( = ?auto_589344 ?auto_589357 ) ) ( not ( = ?auto_589344 ?auto_589358 ) ) ( not ( = ?auto_589344 ?auto_589359 ) ) ( not ( = ?auto_589345 ?auto_589346 ) ) ( not ( = ?auto_589345 ?auto_589347 ) ) ( not ( = ?auto_589345 ?auto_589348 ) ) ( not ( = ?auto_589345 ?auto_589349 ) ) ( not ( = ?auto_589345 ?auto_589350 ) ) ( not ( = ?auto_589345 ?auto_589351 ) ) ( not ( = ?auto_589345 ?auto_589352 ) ) ( not ( = ?auto_589345 ?auto_589353 ) ) ( not ( = ?auto_589345 ?auto_589354 ) ) ( not ( = ?auto_589345 ?auto_589355 ) ) ( not ( = ?auto_589345 ?auto_589356 ) ) ( not ( = ?auto_589345 ?auto_589357 ) ) ( not ( = ?auto_589345 ?auto_589358 ) ) ( not ( = ?auto_589345 ?auto_589359 ) ) ( not ( = ?auto_589346 ?auto_589347 ) ) ( not ( = ?auto_589346 ?auto_589348 ) ) ( not ( = ?auto_589346 ?auto_589349 ) ) ( not ( = ?auto_589346 ?auto_589350 ) ) ( not ( = ?auto_589346 ?auto_589351 ) ) ( not ( = ?auto_589346 ?auto_589352 ) ) ( not ( = ?auto_589346 ?auto_589353 ) ) ( not ( = ?auto_589346 ?auto_589354 ) ) ( not ( = ?auto_589346 ?auto_589355 ) ) ( not ( = ?auto_589346 ?auto_589356 ) ) ( not ( = ?auto_589346 ?auto_589357 ) ) ( not ( = ?auto_589346 ?auto_589358 ) ) ( not ( = ?auto_589346 ?auto_589359 ) ) ( not ( = ?auto_589347 ?auto_589348 ) ) ( not ( = ?auto_589347 ?auto_589349 ) ) ( not ( = ?auto_589347 ?auto_589350 ) ) ( not ( = ?auto_589347 ?auto_589351 ) ) ( not ( = ?auto_589347 ?auto_589352 ) ) ( not ( = ?auto_589347 ?auto_589353 ) ) ( not ( = ?auto_589347 ?auto_589354 ) ) ( not ( = ?auto_589347 ?auto_589355 ) ) ( not ( = ?auto_589347 ?auto_589356 ) ) ( not ( = ?auto_589347 ?auto_589357 ) ) ( not ( = ?auto_589347 ?auto_589358 ) ) ( not ( = ?auto_589347 ?auto_589359 ) ) ( not ( = ?auto_589348 ?auto_589349 ) ) ( not ( = ?auto_589348 ?auto_589350 ) ) ( not ( = ?auto_589348 ?auto_589351 ) ) ( not ( = ?auto_589348 ?auto_589352 ) ) ( not ( = ?auto_589348 ?auto_589353 ) ) ( not ( = ?auto_589348 ?auto_589354 ) ) ( not ( = ?auto_589348 ?auto_589355 ) ) ( not ( = ?auto_589348 ?auto_589356 ) ) ( not ( = ?auto_589348 ?auto_589357 ) ) ( not ( = ?auto_589348 ?auto_589358 ) ) ( not ( = ?auto_589348 ?auto_589359 ) ) ( not ( = ?auto_589349 ?auto_589350 ) ) ( not ( = ?auto_589349 ?auto_589351 ) ) ( not ( = ?auto_589349 ?auto_589352 ) ) ( not ( = ?auto_589349 ?auto_589353 ) ) ( not ( = ?auto_589349 ?auto_589354 ) ) ( not ( = ?auto_589349 ?auto_589355 ) ) ( not ( = ?auto_589349 ?auto_589356 ) ) ( not ( = ?auto_589349 ?auto_589357 ) ) ( not ( = ?auto_589349 ?auto_589358 ) ) ( not ( = ?auto_589349 ?auto_589359 ) ) ( not ( = ?auto_589350 ?auto_589351 ) ) ( not ( = ?auto_589350 ?auto_589352 ) ) ( not ( = ?auto_589350 ?auto_589353 ) ) ( not ( = ?auto_589350 ?auto_589354 ) ) ( not ( = ?auto_589350 ?auto_589355 ) ) ( not ( = ?auto_589350 ?auto_589356 ) ) ( not ( = ?auto_589350 ?auto_589357 ) ) ( not ( = ?auto_589350 ?auto_589358 ) ) ( not ( = ?auto_589350 ?auto_589359 ) ) ( not ( = ?auto_589351 ?auto_589352 ) ) ( not ( = ?auto_589351 ?auto_589353 ) ) ( not ( = ?auto_589351 ?auto_589354 ) ) ( not ( = ?auto_589351 ?auto_589355 ) ) ( not ( = ?auto_589351 ?auto_589356 ) ) ( not ( = ?auto_589351 ?auto_589357 ) ) ( not ( = ?auto_589351 ?auto_589358 ) ) ( not ( = ?auto_589351 ?auto_589359 ) ) ( not ( = ?auto_589352 ?auto_589353 ) ) ( not ( = ?auto_589352 ?auto_589354 ) ) ( not ( = ?auto_589352 ?auto_589355 ) ) ( not ( = ?auto_589352 ?auto_589356 ) ) ( not ( = ?auto_589352 ?auto_589357 ) ) ( not ( = ?auto_589352 ?auto_589358 ) ) ( not ( = ?auto_589352 ?auto_589359 ) ) ( not ( = ?auto_589353 ?auto_589354 ) ) ( not ( = ?auto_589353 ?auto_589355 ) ) ( not ( = ?auto_589353 ?auto_589356 ) ) ( not ( = ?auto_589353 ?auto_589357 ) ) ( not ( = ?auto_589353 ?auto_589358 ) ) ( not ( = ?auto_589353 ?auto_589359 ) ) ( not ( = ?auto_589354 ?auto_589355 ) ) ( not ( = ?auto_589354 ?auto_589356 ) ) ( not ( = ?auto_589354 ?auto_589357 ) ) ( not ( = ?auto_589354 ?auto_589358 ) ) ( not ( = ?auto_589354 ?auto_589359 ) ) ( not ( = ?auto_589355 ?auto_589356 ) ) ( not ( = ?auto_589355 ?auto_589357 ) ) ( not ( = ?auto_589355 ?auto_589358 ) ) ( not ( = ?auto_589355 ?auto_589359 ) ) ( not ( = ?auto_589356 ?auto_589357 ) ) ( not ( = ?auto_589356 ?auto_589358 ) ) ( not ( = ?auto_589356 ?auto_589359 ) ) ( not ( = ?auto_589357 ?auto_589358 ) ) ( not ( = ?auto_589357 ?auto_589359 ) ) ( not ( = ?auto_589358 ?auto_589359 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_589358 ?auto_589359 )
      ( !STACK ?auto_589358 ?auto_589357 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589376 - BLOCK
      ?auto_589377 - BLOCK
      ?auto_589378 - BLOCK
      ?auto_589379 - BLOCK
      ?auto_589380 - BLOCK
      ?auto_589381 - BLOCK
      ?auto_589382 - BLOCK
      ?auto_589383 - BLOCK
      ?auto_589384 - BLOCK
      ?auto_589385 - BLOCK
      ?auto_589386 - BLOCK
      ?auto_589387 - BLOCK
      ?auto_589388 - BLOCK
      ?auto_589389 - BLOCK
      ?auto_589390 - BLOCK
      ?auto_589391 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_589390 ) ( ON-TABLE ?auto_589391 ) ( CLEAR ?auto_589391 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_589376 ) ( ON ?auto_589377 ?auto_589376 ) ( ON ?auto_589378 ?auto_589377 ) ( ON ?auto_589379 ?auto_589378 ) ( ON ?auto_589380 ?auto_589379 ) ( ON ?auto_589381 ?auto_589380 ) ( ON ?auto_589382 ?auto_589381 ) ( ON ?auto_589383 ?auto_589382 ) ( ON ?auto_589384 ?auto_589383 ) ( ON ?auto_589385 ?auto_589384 ) ( ON ?auto_589386 ?auto_589385 ) ( ON ?auto_589387 ?auto_589386 ) ( ON ?auto_589388 ?auto_589387 ) ( ON ?auto_589389 ?auto_589388 ) ( ON ?auto_589390 ?auto_589389 ) ( not ( = ?auto_589376 ?auto_589377 ) ) ( not ( = ?auto_589376 ?auto_589378 ) ) ( not ( = ?auto_589376 ?auto_589379 ) ) ( not ( = ?auto_589376 ?auto_589380 ) ) ( not ( = ?auto_589376 ?auto_589381 ) ) ( not ( = ?auto_589376 ?auto_589382 ) ) ( not ( = ?auto_589376 ?auto_589383 ) ) ( not ( = ?auto_589376 ?auto_589384 ) ) ( not ( = ?auto_589376 ?auto_589385 ) ) ( not ( = ?auto_589376 ?auto_589386 ) ) ( not ( = ?auto_589376 ?auto_589387 ) ) ( not ( = ?auto_589376 ?auto_589388 ) ) ( not ( = ?auto_589376 ?auto_589389 ) ) ( not ( = ?auto_589376 ?auto_589390 ) ) ( not ( = ?auto_589376 ?auto_589391 ) ) ( not ( = ?auto_589377 ?auto_589378 ) ) ( not ( = ?auto_589377 ?auto_589379 ) ) ( not ( = ?auto_589377 ?auto_589380 ) ) ( not ( = ?auto_589377 ?auto_589381 ) ) ( not ( = ?auto_589377 ?auto_589382 ) ) ( not ( = ?auto_589377 ?auto_589383 ) ) ( not ( = ?auto_589377 ?auto_589384 ) ) ( not ( = ?auto_589377 ?auto_589385 ) ) ( not ( = ?auto_589377 ?auto_589386 ) ) ( not ( = ?auto_589377 ?auto_589387 ) ) ( not ( = ?auto_589377 ?auto_589388 ) ) ( not ( = ?auto_589377 ?auto_589389 ) ) ( not ( = ?auto_589377 ?auto_589390 ) ) ( not ( = ?auto_589377 ?auto_589391 ) ) ( not ( = ?auto_589378 ?auto_589379 ) ) ( not ( = ?auto_589378 ?auto_589380 ) ) ( not ( = ?auto_589378 ?auto_589381 ) ) ( not ( = ?auto_589378 ?auto_589382 ) ) ( not ( = ?auto_589378 ?auto_589383 ) ) ( not ( = ?auto_589378 ?auto_589384 ) ) ( not ( = ?auto_589378 ?auto_589385 ) ) ( not ( = ?auto_589378 ?auto_589386 ) ) ( not ( = ?auto_589378 ?auto_589387 ) ) ( not ( = ?auto_589378 ?auto_589388 ) ) ( not ( = ?auto_589378 ?auto_589389 ) ) ( not ( = ?auto_589378 ?auto_589390 ) ) ( not ( = ?auto_589378 ?auto_589391 ) ) ( not ( = ?auto_589379 ?auto_589380 ) ) ( not ( = ?auto_589379 ?auto_589381 ) ) ( not ( = ?auto_589379 ?auto_589382 ) ) ( not ( = ?auto_589379 ?auto_589383 ) ) ( not ( = ?auto_589379 ?auto_589384 ) ) ( not ( = ?auto_589379 ?auto_589385 ) ) ( not ( = ?auto_589379 ?auto_589386 ) ) ( not ( = ?auto_589379 ?auto_589387 ) ) ( not ( = ?auto_589379 ?auto_589388 ) ) ( not ( = ?auto_589379 ?auto_589389 ) ) ( not ( = ?auto_589379 ?auto_589390 ) ) ( not ( = ?auto_589379 ?auto_589391 ) ) ( not ( = ?auto_589380 ?auto_589381 ) ) ( not ( = ?auto_589380 ?auto_589382 ) ) ( not ( = ?auto_589380 ?auto_589383 ) ) ( not ( = ?auto_589380 ?auto_589384 ) ) ( not ( = ?auto_589380 ?auto_589385 ) ) ( not ( = ?auto_589380 ?auto_589386 ) ) ( not ( = ?auto_589380 ?auto_589387 ) ) ( not ( = ?auto_589380 ?auto_589388 ) ) ( not ( = ?auto_589380 ?auto_589389 ) ) ( not ( = ?auto_589380 ?auto_589390 ) ) ( not ( = ?auto_589380 ?auto_589391 ) ) ( not ( = ?auto_589381 ?auto_589382 ) ) ( not ( = ?auto_589381 ?auto_589383 ) ) ( not ( = ?auto_589381 ?auto_589384 ) ) ( not ( = ?auto_589381 ?auto_589385 ) ) ( not ( = ?auto_589381 ?auto_589386 ) ) ( not ( = ?auto_589381 ?auto_589387 ) ) ( not ( = ?auto_589381 ?auto_589388 ) ) ( not ( = ?auto_589381 ?auto_589389 ) ) ( not ( = ?auto_589381 ?auto_589390 ) ) ( not ( = ?auto_589381 ?auto_589391 ) ) ( not ( = ?auto_589382 ?auto_589383 ) ) ( not ( = ?auto_589382 ?auto_589384 ) ) ( not ( = ?auto_589382 ?auto_589385 ) ) ( not ( = ?auto_589382 ?auto_589386 ) ) ( not ( = ?auto_589382 ?auto_589387 ) ) ( not ( = ?auto_589382 ?auto_589388 ) ) ( not ( = ?auto_589382 ?auto_589389 ) ) ( not ( = ?auto_589382 ?auto_589390 ) ) ( not ( = ?auto_589382 ?auto_589391 ) ) ( not ( = ?auto_589383 ?auto_589384 ) ) ( not ( = ?auto_589383 ?auto_589385 ) ) ( not ( = ?auto_589383 ?auto_589386 ) ) ( not ( = ?auto_589383 ?auto_589387 ) ) ( not ( = ?auto_589383 ?auto_589388 ) ) ( not ( = ?auto_589383 ?auto_589389 ) ) ( not ( = ?auto_589383 ?auto_589390 ) ) ( not ( = ?auto_589383 ?auto_589391 ) ) ( not ( = ?auto_589384 ?auto_589385 ) ) ( not ( = ?auto_589384 ?auto_589386 ) ) ( not ( = ?auto_589384 ?auto_589387 ) ) ( not ( = ?auto_589384 ?auto_589388 ) ) ( not ( = ?auto_589384 ?auto_589389 ) ) ( not ( = ?auto_589384 ?auto_589390 ) ) ( not ( = ?auto_589384 ?auto_589391 ) ) ( not ( = ?auto_589385 ?auto_589386 ) ) ( not ( = ?auto_589385 ?auto_589387 ) ) ( not ( = ?auto_589385 ?auto_589388 ) ) ( not ( = ?auto_589385 ?auto_589389 ) ) ( not ( = ?auto_589385 ?auto_589390 ) ) ( not ( = ?auto_589385 ?auto_589391 ) ) ( not ( = ?auto_589386 ?auto_589387 ) ) ( not ( = ?auto_589386 ?auto_589388 ) ) ( not ( = ?auto_589386 ?auto_589389 ) ) ( not ( = ?auto_589386 ?auto_589390 ) ) ( not ( = ?auto_589386 ?auto_589391 ) ) ( not ( = ?auto_589387 ?auto_589388 ) ) ( not ( = ?auto_589387 ?auto_589389 ) ) ( not ( = ?auto_589387 ?auto_589390 ) ) ( not ( = ?auto_589387 ?auto_589391 ) ) ( not ( = ?auto_589388 ?auto_589389 ) ) ( not ( = ?auto_589388 ?auto_589390 ) ) ( not ( = ?auto_589388 ?auto_589391 ) ) ( not ( = ?auto_589389 ?auto_589390 ) ) ( not ( = ?auto_589389 ?auto_589391 ) ) ( not ( = ?auto_589390 ?auto_589391 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_589391 )
      ( !STACK ?auto_589391 ?auto_589390 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589408 - BLOCK
      ?auto_589409 - BLOCK
      ?auto_589410 - BLOCK
      ?auto_589411 - BLOCK
      ?auto_589412 - BLOCK
      ?auto_589413 - BLOCK
      ?auto_589414 - BLOCK
      ?auto_589415 - BLOCK
      ?auto_589416 - BLOCK
      ?auto_589417 - BLOCK
      ?auto_589418 - BLOCK
      ?auto_589419 - BLOCK
      ?auto_589420 - BLOCK
      ?auto_589421 - BLOCK
      ?auto_589422 - BLOCK
      ?auto_589423 - BLOCK
    )
    :vars
    (
      ?auto_589424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589423 ?auto_589424 ) ( ON-TABLE ?auto_589408 ) ( ON ?auto_589409 ?auto_589408 ) ( ON ?auto_589410 ?auto_589409 ) ( ON ?auto_589411 ?auto_589410 ) ( ON ?auto_589412 ?auto_589411 ) ( ON ?auto_589413 ?auto_589412 ) ( ON ?auto_589414 ?auto_589413 ) ( ON ?auto_589415 ?auto_589414 ) ( ON ?auto_589416 ?auto_589415 ) ( ON ?auto_589417 ?auto_589416 ) ( ON ?auto_589418 ?auto_589417 ) ( ON ?auto_589419 ?auto_589418 ) ( ON ?auto_589420 ?auto_589419 ) ( ON ?auto_589421 ?auto_589420 ) ( not ( = ?auto_589408 ?auto_589409 ) ) ( not ( = ?auto_589408 ?auto_589410 ) ) ( not ( = ?auto_589408 ?auto_589411 ) ) ( not ( = ?auto_589408 ?auto_589412 ) ) ( not ( = ?auto_589408 ?auto_589413 ) ) ( not ( = ?auto_589408 ?auto_589414 ) ) ( not ( = ?auto_589408 ?auto_589415 ) ) ( not ( = ?auto_589408 ?auto_589416 ) ) ( not ( = ?auto_589408 ?auto_589417 ) ) ( not ( = ?auto_589408 ?auto_589418 ) ) ( not ( = ?auto_589408 ?auto_589419 ) ) ( not ( = ?auto_589408 ?auto_589420 ) ) ( not ( = ?auto_589408 ?auto_589421 ) ) ( not ( = ?auto_589408 ?auto_589422 ) ) ( not ( = ?auto_589408 ?auto_589423 ) ) ( not ( = ?auto_589408 ?auto_589424 ) ) ( not ( = ?auto_589409 ?auto_589410 ) ) ( not ( = ?auto_589409 ?auto_589411 ) ) ( not ( = ?auto_589409 ?auto_589412 ) ) ( not ( = ?auto_589409 ?auto_589413 ) ) ( not ( = ?auto_589409 ?auto_589414 ) ) ( not ( = ?auto_589409 ?auto_589415 ) ) ( not ( = ?auto_589409 ?auto_589416 ) ) ( not ( = ?auto_589409 ?auto_589417 ) ) ( not ( = ?auto_589409 ?auto_589418 ) ) ( not ( = ?auto_589409 ?auto_589419 ) ) ( not ( = ?auto_589409 ?auto_589420 ) ) ( not ( = ?auto_589409 ?auto_589421 ) ) ( not ( = ?auto_589409 ?auto_589422 ) ) ( not ( = ?auto_589409 ?auto_589423 ) ) ( not ( = ?auto_589409 ?auto_589424 ) ) ( not ( = ?auto_589410 ?auto_589411 ) ) ( not ( = ?auto_589410 ?auto_589412 ) ) ( not ( = ?auto_589410 ?auto_589413 ) ) ( not ( = ?auto_589410 ?auto_589414 ) ) ( not ( = ?auto_589410 ?auto_589415 ) ) ( not ( = ?auto_589410 ?auto_589416 ) ) ( not ( = ?auto_589410 ?auto_589417 ) ) ( not ( = ?auto_589410 ?auto_589418 ) ) ( not ( = ?auto_589410 ?auto_589419 ) ) ( not ( = ?auto_589410 ?auto_589420 ) ) ( not ( = ?auto_589410 ?auto_589421 ) ) ( not ( = ?auto_589410 ?auto_589422 ) ) ( not ( = ?auto_589410 ?auto_589423 ) ) ( not ( = ?auto_589410 ?auto_589424 ) ) ( not ( = ?auto_589411 ?auto_589412 ) ) ( not ( = ?auto_589411 ?auto_589413 ) ) ( not ( = ?auto_589411 ?auto_589414 ) ) ( not ( = ?auto_589411 ?auto_589415 ) ) ( not ( = ?auto_589411 ?auto_589416 ) ) ( not ( = ?auto_589411 ?auto_589417 ) ) ( not ( = ?auto_589411 ?auto_589418 ) ) ( not ( = ?auto_589411 ?auto_589419 ) ) ( not ( = ?auto_589411 ?auto_589420 ) ) ( not ( = ?auto_589411 ?auto_589421 ) ) ( not ( = ?auto_589411 ?auto_589422 ) ) ( not ( = ?auto_589411 ?auto_589423 ) ) ( not ( = ?auto_589411 ?auto_589424 ) ) ( not ( = ?auto_589412 ?auto_589413 ) ) ( not ( = ?auto_589412 ?auto_589414 ) ) ( not ( = ?auto_589412 ?auto_589415 ) ) ( not ( = ?auto_589412 ?auto_589416 ) ) ( not ( = ?auto_589412 ?auto_589417 ) ) ( not ( = ?auto_589412 ?auto_589418 ) ) ( not ( = ?auto_589412 ?auto_589419 ) ) ( not ( = ?auto_589412 ?auto_589420 ) ) ( not ( = ?auto_589412 ?auto_589421 ) ) ( not ( = ?auto_589412 ?auto_589422 ) ) ( not ( = ?auto_589412 ?auto_589423 ) ) ( not ( = ?auto_589412 ?auto_589424 ) ) ( not ( = ?auto_589413 ?auto_589414 ) ) ( not ( = ?auto_589413 ?auto_589415 ) ) ( not ( = ?auto_589413 ?auto_589416 ) ) ( not ( = ?auto_589413 ?auto_589417 ) ) ( not ( = ?auto_589413 ?auto_589418 ) ) ( not ( = ?auto_589413 ?auto_589419 ) ) ( not ( = ?auto_589413 ?auto_589420 ) ) ( not ( = ?auto_589413 ?auto_589421 ) ) ( not ( = ?auto_589413 ?auto_589422 ) ) ( not ( = ?auto_589413 ?auto_589423 ) ) ( not ( = ?auto_589413 ?auto_589424 ) ) ( not ( = ?auto_589414 ?auto_589415 ) ) ( not ( = ?auto_589414 ?auto_589416 ) ) ( not ( = ?auto_589414 ?auto_589417 ) ) ( not ( = ?auto_589414 ?auto_589418 ) ) ( not ( = ?auto_589414 ?auto_589419 ) ) ( not ( = ?auto_589414 ?auto_589420 ) ) ( not ( = ?auto_589414 ?auto_589421 ) ) ( not ( = ?auto_589414 ?auto_589422 ) ) ( not ( = ?auto_589414 ?auto_589423 ) ) ( not ( = ?auto_589414 ?auto_589424 ) ) ( not ( = ?auto_589415 ?auto_589416 ) ) ( not ( = ?auto_589415 ?auto_589417 ) ) ( not ( = ?auto_589415 ?auto_589418 ) ) ( not ( = ?auto_589415 ?auto_589419 ) ) ( not ( = ?auto_589415 ?auto_589420 ) ) ( not ( = ?auto_589415 ?auto_589421 ) ) ( not ( = ?auto_589415 ?auto_589422 ) ) ( not ( = ?auto_589415 ?auto_589423 ) ) ( not ( = ?auto_589415 ?auto_589424 ) ) ( not ( = ?auto_589416 ?auto_589417 ) ) ( not ( = ?auto_589416 ?auto_589418 ) ) ( not ( = ?auto_589416 ?auto_589419 ) ) ( not ( = ?auto_589416 ?auto_589420 ) ) ( not ( = ?auto_589416 ?auto_589421 ) ) ( not ( = ?auto_589416 ?auto_589422 ) ) ( not ( = ?auto_589416 ?auto_589423 ) ) ( not ( = ?auto_589416 ?auto_589424 ) ) ( not ( = ?auto_589417 ?auto_589418 ) ) ( not ( = ?auto_589417 ?auto_589419 ) ) ( not ( = ?auto_589417 ?auto_589420 ) ) ( not ( = ?auto_589417 ?auto_589421 ) ) ( not ( = ?auto_589417 ?auto_589422 ) ) ( not ( = ?auto_589417 ?auto_589423 ) ) ( not ( = ?auto_589417 ?auto_589424 ) ) ( not ( = ?auto_589418 ?auto_589419 ) ) ( not ( = ?auto_589418 ?auto_589420 ) ) ( not ( = ?auto_589418 ?auto_589421 ) ) ( not ( = ?auto_589418 ?auto_589422 ) ) ( not ( = ?auto_589418 ?auto_589423 ) ) ( not ( = ?auto_589418 ?auto_589424 ) ) ( not ( = ?auto_589419 ?auto_589420 ) ) ( not ( = ?auto_589419 ?auto_589421 ) ) ( not ( = ?auto_589419 ?auto_589422 ) ) ( not ( = ?auto_589419 ?auto_589423 ) ) ( not ( = ?auto_589419 ?auto_589424 ) ) ( not ( = ?auto_589420 ?auto_589421 ) ) ( not ( = ?auto_589420 ?auto_589422 ) ) ( not ( = ?auto_589420 ?auto_589423 ) ) ( not ( = ?auto_589420 ?auto_589424 ) ) ( not ( = ?auto_589421 ?auto_589422 ) ) ( not ( = ?auto_589421 ?auto_589423 ) ) ( not ( = ?auto_589421 ?auto_589424 ) ) ( not ( = ?auto_589422 ?auto_589423 ) ) ( not ( = ?auto_589422 ?auto_589424 ) ) ( not ( = ?auto_589423 ?auto_589424 ) ) ( CLEAR ?auto_589421 ) ( ON ?auto_589422 ?auto_589423 ) ( CLEAR ?auto_589422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_589408 ?auto_589409 ?auto_589410 ?auto_589411 ?auto_589412 ?auto_589413 ?auto_589414 ?auto_589415 ?auto_589416 ?auto_589417 ?auto_589418 ?auto_589419 ?auto_589420 ?auto_589421 ?auto_589422 )
      ( MAKE-16PILE ?auto_589408 ?auto_589409 ?auto_589410 ?auto_589411 ?auto_589412 ?auto_589413 ?auto_589414 ?auto_589415 ?auto_589416 ?auto_589417 ?auto_589418 ?auto_589419 ?auto_589420 ?auto_589421 ?auto_589422 ?auto_589423 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589441 - BLOCK
      ?auto_589442 - BLOCK
      ?auto_589443 - BLOCK
      ?auto_589444 - BLOCK
      ?auto_589445 - BLOCK
      ?auto_589446 - BLOCK
      ?auto_589447 - BLOCK
      ?auto_589448 - BLOCK
      ?auto_589449 - BLOCK
      ?auto_589450 - BLOCK
      ?auto_589451 - BLOCK
      ?auto_589452 - BLOCK
      ?auto_589453 - BLOCK
      ?auto_589454 - BLOCK
      ?auto_589455 - BLOCK
      ?auto_589456 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_589456 ) ( ON-TABLE ?auto_589441 ) ( ON ?auto_589442 ?auto_589441 ) ( ON ?auto_589443 ?auto_589442 ) ( ON ?auto_589444 ?auto_589443 ) ( ON ?auto_589445 ?auto_589444 ) ( ON ?auto_589446 ?auto_589445 ) ( ON ?auto_589447 ?auto_589446 ) ( ON ?auto_589448 ?auto_589447 ) ( ON ?auto_589449 ?auto_589448 ) ( ON ?auto_589450 ?auto_589449 ) ( ON ?auto_589451 ?auto_589450 ) ( ON ?auto_589452 ?auto_589451 ) ( ON ?auto_589453 ?auto_589452 ) ( ON ?auto_589454 ?auto_589453 ) ( not ( = ?auto_589441 ?auto_589442 ) ) ( not ( = ?auto_589441 ?auto_589443 ) ) ( not ( = ?auto_589441 ?auto_589444 ) ) ( not ( = ?auto_589441 ?auto_589445 ) ) ( not ( = ?auto_589441 ?auto_589446 ) ) ( not ( = ?auto_589441 ?auto_589447 ) ) ( not ( = ?auto_589441 ?auto_589448 ) ) ( not ( = ?auto_589441 ?auto_589449 ) ) ( not ( = ?auto_589441 ?auto_589450 ) ) ( not ( = ?auto_589441 ?auto_589451 ) ) ( not ( = ?auto_589441 ?auto_589452 ) ) ( not ( = ?auto_589441 ?auto_589453 ) ) ( not ( = ?auto_589441 ?auto_589454 ) ) ( not ( = ?auto_589441 ?auto_589455 ) ) ( not ( = ?auto_589441 ?auto_589456 ) ) ( not ( = ?auto_589442 ?auto_589443 ) ) ( not ( = ?auto_589442 ?auto_589444 ) ) ( not ( = ?auto_589442 ?auto_589445 ) ) ( not ( = ?auto_589442 ?auto_589446 ) ) ( not ( = ?auto_589442 ?auto_589447 ) ) ( not ( = ?auto_589442 ?auto_589448 ) ) ( not ( = ?auto_589442 ?auto_589449 ) ) ( not ( = ?auto_589442 ?auto_589450 ) ) ( not ( = ?auto_589442 ?auto_589451 ) ) ( not ( = ?auto_589442 ?auto_589452 ) ) ( not ( = ?auto_589442 ?auto_589453 ) ) ( not ( = ?auto_589442 ?auto_589454 ) ) ( not ( = ?auto_589442 ?auto_589455 ) ) ( not ( = ?auto_589442 ?auto_589456 ) ) ( not ( = ?auto_589443 ?auto_589444 ) ) ( not ( = ?auto_589443 ?auto_589445 ) ) ( not ( = ?auto_589443 ?auto_589446 ) ) ( not ( = ?auto_589443 ?auto_589447 ) ) ( not ( = ?auto_589443 ?auto_589448 ) ) ( not ( = ?auto_589443 ?auto_589449 ) ) ( not ( = ?auto_589443 ?auto_589450 ) ) ( not ( = ?auto_589443 ?auto_589451 ) ) ( not ( = ?auto_589443 ?auto_589452 ) ) ( not ( = ?auto_589443 ?auto_589453 ) ) ( not ( = ?auto_589443 ?auto_589454 ) ) ( not ( = ?auto_589443 ?auto_589455 ) ) ( not ( = ?auto_589443 ?auto_589456 ) ) ( not ( = ?auto_589444 ?auto_589445 ) ) ( not ( = ?auto_589444 ?auto_589446 ) ) ( not ( = ?auto_589444 ?auto_589447 ) ) ( not ( = ?auto_589444 ?auto_589448 ) ) ( not ( = ?auto_589444 ?auto_589449 ) ) ( not ( = ?auto_589444 ?auto_589450 ) ) ( not ( = ?auto_589444 ?auto_589451 ) ) ( not ( = ?auto_589444 ?auto_589452 ) ) ( not ( = ?auto_589444 ?auto_589453 ) ) ( not ( = ?auto_589444 ?auto_589454 ) ) ( not ( = ?auto_589444 ?auto_589455 ) ) ( not ( = ?auto_589444 ?auto_589456 ) ) ( not ( = ?auto_589445 ?auto_589446 ) ) ( not ( = ?auto_589445 ?auto_589447 ) ) ( not ( = ?auto_589445 ?auto_589448 ) ) ( not ( = ?auto_589445 ?auto_589449 ) ) ( not ( = ?auto_589445 ?auto_589450 ) ) ( not ( = ?auto_589445 ?auto_589451 ) ) ( not ( = ?auto_589445 ?auto_589452 ) ) ( not ( = ?auto_589445 ?auto_589453 ) ) ( not ( = ?auto_589445 ?auto_589454 ) ) ( not ( = ?auto_589445 ?auto_589455 ) ) ( not ( = ?auto_589445 ?auto_589456 ) ) ( not ( = ?auto_589446 ?auto_589447 ) ) ( not ( = ?auto_589446 ?auto_589448 ) ) ( not ( = ?auto_589446 ?auto_589449 ) ) ( not ( = ?auto_589446 ?auto_589450 ) ) ( not ( = ?auto_589446 ?auto_589451 ) ) ( not ( = ?auto_589446 ?auto_589452 ) ) ( not ( = ?auto_589446 ?auto_589453 ) ) ( not ( = ?auto_589446 ?auto_589454 ) ) ( not ( = ?auto_589446 ?auto_589455 ) ) ( not ( = ?auto_589446 ?auto_589456 ) ) ( not ( = ?auto_589447 ?auto_589448 ) ) ( not ( = ?auto_589447 ?auto_589449 ) ) ( not ( = ?auto_589447 ?auto_589450 ) ) ( not ( = ?auto_589447 ?auto_589451 ) ) ( not ( = ?auto_589447 ?auto_589452 ) ) ( not ( = ?auto_589447 ?auto_589453 ) ) ( not ( = ?auto_589447 ?auto_589454 ) ) ( not ( = ?auto_589447 ?auto_589455 ) ) ( not ( = ?auto_589447 ?auto_589456 ) ) ( not ( = ?auto_589448 ?auto_589449 ) ) ( not ( = ?auto_589448 ?auto_589450 ) ) ( not ( = ?auto_589448 ?auto_589451 ) ) ( not ( = ?auto_589448 ?auto_589452 ) ) ( not ( = ?auto_589448 ?auto_589453 ) ) ( not ( = ?auto_589448 ?auto_589454 ) ) ( not ( = ?auto_589448 ?auto_589455 ) ) ( not ( = ?auto_589448 ?auto_589456 ) ) ( not ( = ?auto_589449 ?auto_589450 ) ) ( not ( = ?auto_589449 ?auto_589451 ) ) ( not ( = ?auto_589449 ?auto_589452 ) ) ( not ( = ?auto_589449 ?auto_589453 ) ) ( not ( = ?auto_589449 ?auto_589454 ) ) ( not ( = ?auto_589449 ?auto_589455 ) ) ( not ( = ?auto_589449 ?auto_589456 ) ) ( not ( = ?auto_589450 ?auto_589451 ) ) ( not ( = ?auto_589450 ?auto_589452 ) ) ( not ( = ?auto_589450 ?auto_589453 ) ) ( not ( = ?auto_589450 ?auto_589454 ) ) ( not ( = ?auto_589450 ?auto_589455 ) ) ( not ( = ?auto_589450 ?auto_589456 ) ) ( not ( = ?auto_589451 ?auto_589452 ) ) ( not ( = ?auto_589451 ?auto_589453 ) ) ( not ( = ?auto_589451 ?auto_589454 ) ) ( not ( = ?auto_589451 ?auto_589455 ) ) ( not ( = ?auto_589451 ?auto_589456 ) ) ( not ( = ?auto_589452 ?auto_589453 ) ) ( not ( = ?auto_589452 ?auto_589454 ) ) ( not ( = ?auto_589452 ?auto_589455 ) ) ( not ( = ?auto_589452 ?auto_589456 ) ) ( not ( = ?auto_589453 ?auto_589454 ) ) ( not ( = ?auto_589453 ?auto_589455 ) ) ( not ( = ?auto_589453 ?auto_589456 ) ) ( not ( = ?auto_589454 ?auto_589455 ) ) ( not ( = ?auto_589454 ?auto_589456 ) ) ( not ( = ?auto_589455 ?auto_589456 ) ) ( CLEAR ?auto_589454 ) ( ON ?auto_589455 ?auto_589456 ) ( CLEAR ?auto_589455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_589441 ?auto_589442 ?auto_589443 ?auto_589444 ?auto_589445 ?auto_589446 ?auto_589447 ?auto_589448 ?auto_589449 ?auto_589450 ?auto_589451 ?auto_589452 ?auto_589453 ?auto_589454 ?auto_589455 )
      ( MAKE-16PILE ?auto_589441 ?auto_589442 ?auto_589443 ?auto_589444 ?auto_589445 ?auto_589446 ?auto_589447 ?auto_589448 ?auto_589449 ?auto_589450 ?auto_589451 ?auto_589452 ?auto_589453 ?auto_589454 ?auto_589455 ?auto_589456 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589473 - BLOCK
      ?auto_589474 - BLOCK
      ?auto_589475 - BLOCK
      ?auto_589476 - BLOCK
      ?auto_589477 - BLOCK
      ?auto_589478 - BLOCK
      ?auto_589479 - BLOCK
      ?auto_589480 - BLOCK
      ?auto_589481 - BLOCK
      ?auto_589482 - BLOCK
      ?auto_589483 - BLOCK
      ?auto_589484 - BLOCK
      ?auto_589485 - BLOCK
      ?auto_589486 - BLOCK
      ?auto_589487 - BLOCK
      ?auto_589488 - BLOCK
    )
    :vars
    (
      ?auto_589489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589488 ?auto_589489 ) ( ON-TABLE ?auto_589473 ) ( ON ?auto_589474 ?auto_589473 ) ( ON ?auto_589475 ?auto_589474 ) ( ON ?auto_589476 ?auto_589475 ) ( ON ?auto_589477 ?auto_589476 ) ( ON ?auto_589478 ?auto_589477 ) ( ON ?auto_589479 ?auto_589478 ) ( ON ?auto_589480 ?auto_589479 ) ( ON ?auto_589481 ?auto_589480 ) ( ON ?auto_589482 ?auto_589481 ) ( ON ?auto_589483 ?auto_589482 ) ( ON ?auto_589484 ?auto_589483 ) ( ON ?auto_589485 ?auto_589484 ) ( not ( = ?auto_589473 ?auto_589474 ) ) ( not ( = ?auto_589473 ?auto_589475 ) ) ( not ( = ?auto_589473 ?auto_589476 ) ) ( not ( = ?auto_589473 ?auto_589477 ) ) ( not ( = ?auto_589473 ?auto_589478 ) ) ( not ( = ?auto_589473 ?auto_589479 ) ) ( not ( = ?auto_589473 ?auto_589480 ) ) ( not ( = ?auto_589473 ?auto_589481 ) ) ( not ( = ?auto_589473 ?auto_589482 ) ) ( not ( = ?auto_589473 ?auto_589483 ) ) ( not ( = ?auto_589473 ?auto_589484 ) ) ( not ( = ?auto_589473 ?auto_589485 ) ) ( not ( = ?auto_589473 ?auto_589486 ) ) ( not ( = ?auto_589473 ?auto_589487 ) ) ( not ( = ?auto_589473 ?auto_589488 ) ) ( not ( = ?auto_589473 ?auto_589489 ) ) ( not ( = ?auto_589474 ?auto_589475 ) ) ( not ( = ?auto_589474 ?auto_589476 ) ) ( not ( = ?auto_589474 ?auto_589477 ) ) ( not ( = ?auto_589474 ?auto_589478 ) ) ( not ( = ?auto_589474 ?auto_589479 ) ) ( not ( = ?auto_589474 ?auto_589480 ) ) ( not ( = ?auto_589474 ?auto_589481 ) ) ( not ( = ?auto_589474 ?auto_589482 ) ) ( not ( = ?auto_589474 ?auto_589483 ) ) ( not ( = ?auto_589474 ?auto_589484 ) ) ( not ( = ?auto_589474 ?auto_589485 ) ) ( not ( = ?auto_589474 ?auto_589486 ) ) ( not ( = ?auto_589474 ?auto_589487 ) ) ( not ( = ?auto_589474 ?auto_589488 ) ) ( not ( = ?auto_589474 ?auto_589489 ) ) ( not ( = ?auto_589475 ?auto_589476 ) ) ( not ( = ?auto_589475 ?auto_589477 ) ) ( not ( = ?auto_589475 ?auto_589478 ) ) ( not ( = ?auto_589475 ?auto_589479 ) ) ( not ( = ?auto_589475 ?auto_589480 ) ) ( not ( = ?auto_589475 ?auto_589481 ) ) ( not ( = ?auto_589475 ?auto_589482 ) ) ( not ( = ?auto_589475 ?auto_589483 ) ) ( not ( = ?auto_589475 ?auto_589484 ) ) ( not ( = ?auto_589475 ?auto_589485 ) ) ( not ( = ?auto_589475 ?auto_589486 ) ) ( not ( = ?auto_589475 ?auto_589487 ) ) ( not ( = ?auto_589475 ?auto_589488 ) ) ( not ( = ?auto_589475 ?auto_589489 ) ) ( not ( = ?auto_589476 ?auto_589477 ) ) ( not ( = ?auto_589476 ?auto_589478 ) ) ( not ( = ?auto_589476 ?auto_589479 ) ) ( not ( = ?auto_589476 ?auto_589480 ) ) ( not ( = ?auto_589476 ?auto_589481 ) ) ( not ( = ?auto_589476 ?auto_589482 ) ) ( not ( = ?auto_589476 ?auto_589483 ) ) ( not ( = ?auto_589476 ?auto_589484 ) ) ( not ( = ?auto_589476 ?auto_589485 ) ) ( not ( = ?auto_589476 ?auto_589486 ) ) ( not ( = ?auto_589476 ?auto_589487 ) ) ( not ( = ?auto_589476 ?auto_589488 ) ) ( not ( = ?auto_589476 ?auto_589489 ) ) ( not ( = ?auto_589477 ?auto_589478 ) ) ( not ( = ?auto_589477 ?auto_589479 ) ) ( not ( = ?auto_589477 ?auto_589480 ) ) ( not ( = ?auto_589477 ?auto_589481 ) ) ( not ( = ?auto_589477 ?auto_589482 ) ) ( not ( = ?auto_589477 ?auto_589483 ) ) ( not ( = ?auto_589477 ?auto_589484 ) ) ( not ( = ?auto_589477 ?auto_589485 ) ) ( not ( = ?auto_589477 ?auto_589486 ) ) ( not ( = ?auto_589477 ?auto_589487 ) ) ( not ( = ?auto_589477 ?auto_589488 ) ) ( not ( = ?auto_589477 ?auto_589489 ) ) ( not ( = ?auto_589478 ?auto_589479 ) ) ( not ( = ?auto_589478 ?auto_589480 ) ) ( not ( = ?auto_589478 ?auto_589481 ) ) ( not ( = ?auto_589478 ?auto_589482 ) ) ( not ( = ?auto_589478 ?auto_589483 ) ) ( not ( = ?auto_589478 ?auto_589484 ) ) ( not ( = ?auto_589478 ?auto_589485 ) ) ( not ( = ?auto_589478 ?auto_589486 ) ) ( not ( = ?auto_589478 ?auto_589487 ) ) ( not ( = ?auto_589478 ?auto_589488 ) ) ( not ( = ?auto_589478 ?auto_589489 ) ) ( not ( = ?auto_589479 ?auto_589480 ) ) ( not ( = ?auto_589479 ?auto_589481 ) ) ( not ( = ?auto_589479 ?auto_589482 ) ) ( not ( = ?auto_589479 ?auto_589483 ) ) ( not ( = ?auto_589479 ?auto_589484 ) ) ( not ( = ?auto_589479 ?auto_589485 ) ) ( not ( = ?auto_589479 ?auto_589486 ) ) ( not ( = ?auto_589479 ?auto_589487 ) ) ( not ( = ?auto_589479 ?auto_589488 ) ) ( not ( = ?auto_589479 ?auto_589489 ) ) ( not ( = ?auto_589480 ?auto_589481 ) ) ( not ( = ?auto_589480 ?auto_589482 ) ) ( not ( = ?auto_589480 ?auto_589483 ) ) ( not ( = ?auto_589480 ?auto_589484 ) ) ( not ( = ?auto_589480 ?auto_589485 ) ) ( not ( = ?auto_589480 ?auto_589486 ) ) ( not ( = ?auto_589480 ?auto_589487 ) ) ( not ( = ?auto_589480 ?auto_589488 ) ) ( not ( = ?auto_589480 ?auto_589489 ) ) ( not ( = ?auto_589481 ?auto_589482 ) ) ( not ( = ?auto_589481 ?auto_589483 ) ) ( not ( = ?auto_589481 ?auto_589484 ) ) ( not ( = ?auto_589481 ?auto_589485 ) ) ( not ( = ?auto_589481 ?auto_589486 ) ) ( not ( = ?auto_589481 ?auto_589487 ) ) ( not ( = ?auto_589481 ?auto_589488 ) ) ( not ( = ?auto_589481 ?auto_589489 ) ) ( not ( = ?auto_589482 ?auto_589483 ) ) ( not ( = ?auto_589482 ?auto_589484 ) ) ( not ( = ?auto_589482 ?auto_589485 ) ) ( not ( = ?auto_589482 ?auto_589486 ) ) ( not ( = ?auto_589482 ?auto_589487 ) ) ( not ( = ?auto_589482 ?auto_589488 ) ) ( not ( = ?auto_589482 ?auto_589489 ) ) ( not ( = ?auto_589483 ?auto_589484 ) ) ( not ( = ?auto_589483 ?auto_589485 ) ) ( not ( = ?auto_589483 ?auto_589486 ) ) ( not ( = ?auto_589483 ?auto_589487 ) ) ( not ( = ?auto_589483 ?auto_589488 ) ) ( not ( = ?auto_589483 ?auto_589489 ) ) ( not ( = ?auto_589484 ?auto_589485 ) ) ( not ( = ?auto_589484 ?auto_589486 ) ) ( not ( = ?auto_589484 ?auto_589487 ) ) ( not ( = ?auto_589484 ?auto_589488 ) ) ( not ( = ?auto_589484 ?auto_589489 ) ) ( not ( = ?auto_589485 ?auto_589486 ) ) ( not ( = ?auto_589485 ?auto_589487 ) ) ( not ( = ?auto_589485 ?auto_589488 ) ) ( not ( = ?auto_589485 ?auto_589489 ) ) ( not ( = ?auto_589486 ?auto_589487 ) ) ( not ( = ?auto_589486 ?auto_589488 ) ) ( not ( = ?auto_589486 ?auto_589489 ) ) ( not ( = ?auto_589487 ?auto_589488 ) ) ( not ( = ?auto_589487 ?auto_589489 ) ) ( not ( = ?auto_589488 ?auto_589489 ) ) ( ON ?auto_589487 ?auto_589488 ) ( CLEAR ?auto_589485 ) ( ON ?auto_589486 ?auto_589487 ) ( CLEAR ?auto_589486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_589473 ?auto_589474 ?auto_589475 ?auto_589476 ?auto_589477 ?auto_589478 ?auto_589479 ?auto_589480 ?auto_589481 ?auto_589482 ?auto_589483 ?auto_589484 ?auto_589485 ?auto_589486 )
      ( MAKE-16PILE ?auto_589473 ?auto_589474 ?auto_589475 ?auto_589476 ?auto_589477 ?auto_589478 ?auto_589479 ?auto_589480 ?auto_589481 ?auto_589482 ?auto_589483 ?auto_589484 ?auto_589485 ?auto_589486 ?auto_589487 ?auto_589488 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589506 - BLOCK
      ?auto_589507 - BLOCK
      ?auto_589508 - BLOCK
      ?auto_589509 - BLOCK
      ?auto_589510 - BLOCK
      ?auto_589511 - BLOCK
      ?auto_589512 - BLOCK
      ?auto_589513 - BLOCK
      ?auto_589514 - BLOCK
      ?auto_589515 - BLOCK
      ?auto_589516 - BLOCK
      ?auto_589517 - BLOCK
      ?auto_589518 - BLOCK
      ?auto_589519 - BLOCK
      ?auto_589520 - BLOCK
      ?auto_589521 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_589521 ) ( ON-TABLE ?auto_589506 ) ( ON ?auto_589507 ?auto_589506 ) ( ON ?auto_589508 ?auto_589507 ) ( ON ?auto_589509 ?auto_589508 ) ( ON ?auto_589510 ?auto_589509 ) ( ON ?auto_589511 ?auto_589510 ) ( ON ?auto_589512 ?auto_589511 ) ( ON ?auto_589513 ?auto_589512 ) ( ON ?auto_589514 ?auto_589513 ) ( ON ?auto_589515 ?auto_589514 ) ( ON ?auto_589516 ?auto_589515 ) ( ON ?auto_589517 ?auto_589516 ) ( ON ?auto_589518 ?auto_589517 ) ( not ( = ?auto_589506 ?auto_589507 ) ) ( not ( = ?auto_589506 ?auto_589508 ) ) ( not ( = ?auto_589506 ?auto_589509 ) ) ( not ( = ?auto_589506 ?auto_589510 ) ) ( not ( = ?auto_589506 ?auto_589511 ) ) ( not ( = ?auto_589506 ?auto_589512 ) ) ( not ( = ?auto_589506 ?auto_589513 ) ) ( not ( = ?auto_589506 ?auto_589514 ) ) ( not ( = ?auto_589506 ?auto_589515 ) ) ( not ( = ?auto_589506 ?auto_589516 ) ) ( not ( = ?auto_589506 ?auto_589517 ) ) ( not ( = ?auto_589506 ?auto_589518 ) ) ( not ( = ?auto_589506 ?auto_589519 ) ) ( not ( = ?auto_589506 ?auto_589520 ) ) ( not ( = ?auto_589506 ?auto_589521 ) ) ( not ( = ?auto_589507 ?auto_589508 ) ) ( not ( = ?auto_589507 ?auto_589509 ) ) ( not ( = ?auto_589507 ?auto_589510 ) ) ( not ( = ?auto_589507 ?auto_589511 ) ) ( not ( = ?auto_589507 ?auto_589512 ) ) ( not ( = ?auto_589507 ?auto_589513 ) ) ( not ( = ?auto_589507 ?auto_589514 ) ) ( not ( = ?auto_589507 ?auto_589515 ) ) ( not ( = ?auto_589507 ?auto_589516 ) ) ( not ( = ?auto_589507 ?auto_589517 ) ) ( not ( = ?auto_589507 ?auto_589518 ) ) ( not ( = ?auto_589507 ?auto_589519 ) ) ( not ( = ?auto_589507 ?auto_589520 ) ) ( not ( = ?auto_589507 ?auto_589521 ) ) ( not ( = ?auto_589508 ?auto_589509 ) ) ( not ( = ?auto_589508 ?auto_589510 ) ) ( not ( = ?auto_589508 ?auto_589511 ) ) ( not ( = ?auto_589508 ?auto_589512 ) ) ( not ( = ?auto_589508 ?auto_589513 ) ) ( not ( = ?auto_589508 ?auto_589514 ) ) ( not ( = ?auto_589508 ?auto_589515 ) ) ( not ( = ?auto_589508 ?auto_589516 ) ) ( not ( = ?auto_589508 ?auto_589517 ) ) ( not ( = ?auto_589508 ?auto_589518 ) ) ( not ( = ?auto_589508 ?auto_589519 ) ) ( not ( = ?auto_589508 ?auto_589520 ) ) ( not ( = ?auto_589508 ?auto_589521 ) ) ( not ( = ?auto_589509 ?auto_589510 ) ) ( not ( = ?auto_589509 ?auto_589511 ) ) ( not ( = ?auto_589509 ?auto_589512 ) ) ( not ( = ?auto_589509 ?auto_589513 ) ) ( not ( = ?auto_589509 ?auto_589514 ) ) ( not ( = ?auto_589509 ?auto_589515 ) ) ( not ( = ?auto_589509 ?auto_589516 ) ) ( not ( = ?auto_589509 ?auto_589517 ) ) ( not ( = ?auto_589509 ?auto_589518 ) ) ( not ( = ?auto_589509 ?auto_589519 ) ) ( not ( = ?auto_589509 ?auto_589520 ) ) ( not ( = ?auto_589509 ?auto_589521 ) ) ( not ( = ?auto_589510 ?auto_589511 ) ) ( not ( = ?auto_589510 ?auto_589512 ) ) ( not ( = ?auto_589510 ?auto_589513 ) ) ( not ( = ?auto_589510 ?auto_589514 ) ) ( not ( = ?auto_589510 ?auto_589515 ) ) ( not ( = ?auto_589510 ?auto_589516 ) ) ( not ( = ?auto_589510 ?auto_589517 ) ) ( not ( = ?auto_589510 ?auto_589518 ) ) ( not ( = ?auto_589510 ?auto_589519 ) ) ( not ( = ?auto_589510 ?auto_589520 ) ) ( not ( = ?auto_589510 ?auto_589521 ) ) ( not ( = ?auto_589511 ?auto_589512 ) ) ( not ( = ?auto_589511 ?auto_589513 ) ) ( not ( = ?auto_589511 ?auto_589514 ) ) ( not ( = ?auto_589511 ?auto_589515 ) ) ( not ( = ?auto_589511 ?auto_589516 ) ) ( not ( = ?auto_589511 ?auto_589517 ) ) ( not ( = ?auto_589511 ?auto_589518 ) ) ( not ( = ?auto_589511 ?auto_589519 ) ) ( not ( = ?auto_589511 ?auto_589520 ) ) ( not ( = ?auto_589511 ?auto_589521 ) ) ( not ( = ?auto_589512 ?auto_589513 ) ) ( not ( = ?auto_589512 ?auto_589514 ) ) ( not ( = ?auto_589512 ?auto_589515 ) ) ( not ( = ?auto_589512 ?auto_589516 ) ) ( not ( = ?auto_589512 ?auto_589517 ) ) ( not ( = ?auto_589512 ?auto_589518 ) ) ( not ( = ?auto_589512 ?auto_589519 ) ) ( not ( = ?auto_589512 ?auto_589520 ) ) ( not ( = ?auto_589512 ?auto_589521 ) ) ( not ( = ?auto_589513 ?auto_589514 ) ) ( not ( = ?auto_589513 ?auto_589515 ) ) ( not ( = ?auto_589513 ?auto_589516 ) ) ( not ( = ?auto_589513 ?auto_589517 ) ) ( not ( = ?auto_589513 ?auto_589518 ) ) ( not ( = ?auto_589513 ?auto_589519 ) ) ( not ( = ?auto_589513 ?auto_589520 ) ) ( not ( = ?auto_589513 ?auto_589521 ) ) ( not ( = ?auto_589514 ?auto_589515 ) ) ( not ( = ?auto_589514 ?auto_589516 ) ) ( not ( = ?auto_589514 ?auto_589517 ) ) ( not ( = ?auto_589514 ?auto_589518 ) ) ( not ( = ?auto_589514 ?auto_589519 ) ) ( not ( = ?auto_589514 ?auto_589520 ) ) ( not ( = ?auto_589514 ?auto_589521 ) ) ( not ( = ?auto_589515 ?auto_589516 ) ) ( not ( = ?auto_589515 ?auto_589517 ) ) ( not ( = ?auto_589515 ?auto_589518 ) ) ( not ( = ?auto_589515 ?auto_589519 ) ) ( not ( = ?auto_589515 ?auto_589520 ) ) ( not ( = ?auto_589515 ?auto_589521 ) ) ( not ( = ?auto_589516 ?auto_589517 ) ) ( not ( = ?auto_589516 ?auto_589518 ) ) ( not ( = ?auto_589516 ?auto_589519 ) ) ( not ( = ?auto_589516 ?auto_589520 ) ) ( not ( = ?auto_589516 ?auto_589521 ) ) ( not ( = ?auto_589517 ?auto_589518 ) ) ( not ( = ?auto_589517 ?auto_589519 ) ) ( not ( = ?auto_589517 ?auto_589520 ) ) ( not ( = ?auto_589517 ?auto_589521 ) ) ( not ( = ?auto_589518 ?auto_589519 ) ) ( not ( = ?auto_589518 ?auto_589520 ) ) ( not ( = ?auto_589518 ?auto_589521 ) ) ( not ( = ?auto_589519 ?auto_589520 ) ) ( not ( = ?auto_589519 ?auto_589521 ) ) ( not ( = ?auto_589520 ?auto_589521 ) ) ( ON ?auto_589520 ?auto_589521 ) ( CLEAR ?auto_589518 ) ( ON ?auto_589519 ?auto_589520 ) ( CLEAR ?auto_589519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_589506 ?auto_589507 ?auto_589508 ?auto_589509 ?auto_589510 ?auto_589511 ?auto_589512 ?auto_589513 ?auto_589514 ?auto_589515 ?auto_589516 ?auto_589517 ?auto_589518 ?auto_589519 )
      ( MAKE-16PILE ?auto_589506 ?auto_589507 ?auto_589508 ?auto_589509 ?auto_589510 ?auto_589511 ?auto_589512 ?auto_589513 ?auto_589514 ?auto_589515 ?auto_589516 ?auto_589517 ?auto_589518 ?auto_589519 ?auto_589520 ?auto_589521 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589538 - BLOCK
      ?auto_589539 - BLOCK
      ?auto_589540 - BLOCK
      ?auto_589541 - BLOCK
      ?auto_589542 - BLOCK
      ?auto_589543 - BLOCK
      ?auto_589544 - BLOCK
      ?auto_589545 - BLOCK
      ?auto_589546 - BLOCK
      ?auto_589547 - BLOCK
      ?auto_589548 - BLOCK
      ?auto_589549 - BLOCK
      ?auto_589550 - BLOCK
      ?auto_589551 - BLOCK
      ?auto_589552 - BLOCK
      ?auto_589553 - BLOCK
    )
    :vars
    (
      ?auto_589554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589553 ?auto_589554 ) ( ON-TABLE ?auto_589538 ) ( ON ?auto_589539 ?auto_589538 ) ( ON ?auto_589540 ?auto_589539 ) ( ON ?auto_589541 ?auto_589540 ) ( ON ?auto_589542 ?auto_589541 ) ( ON ?auto_589543 ?auto_589542 ) ( ON ?auto_589544 ?auto_589543 ) ( ON ?auto_589545 ?auto_589544 ) ( ON ?auto_589546 ?auto_589545 ) ( ON ?auto_589547 ?auto_589546 ) ( ON ?auto_589548 ?auto_589547 ) ( ON ?auto_589549 ?auto_589548 ) ( not ( = ?auto_589538 ?auto_589539 ) ) ( not ( = ?auto_589538 ?auto_589540 ) ) ( not ( = ?auto_589538 ?auto_589541 ) ) ( not ( = ?auto_589538 ?auto_589542 ) ) ( not ( = ?auto_589538 ?auto_589543 ) ) ( not ( = ?auto_589538 ?auto_589544 ) ) ( not ( = ?auto_589538 ?auto_589545 ) ) ( not ( = ?auto_589538 ?auto_589546 ) ) ( not ( = ?auto_589538 ?auto_589547 ) ) ( not ( = ?auto_589538 ?auto_589548 ) ) ( not ( = ?auto_589538 ?auto_589549 ) ) ( not ( = ?auto_589538 ?auto_589550 ) ) ( not ( = ?auto_589538 ?auto_589551 ) ) ( not ( = ?auto_589538 ?auto_589552 ) ) ( not ( = ?auto_589538 ?auto_589553 ) ) ( not ( = ?auto_589538 ?auto_589554 ) ) ( not ( = ?auto_589539 ?auto_589540 ) ) ( not ( = ?auto_589539 ?auto_589541 ) ) ( not ( = ?auto_589539 ?auto_589542 ) ) ( not ( = ?auto_589539 ?auto_589543 ) ) ( not ( = ?auto_589539 ?auto_589544 ) ) ( not ( = ?auto_589539 ?auto_589545 ) ) ( not ( = ?auto_589539 ?auto_589546 ) ) ( not ( = ?auto_589539 ?auto_589547 ) ) ( not ( = ?auto_589539 ?auto_589548 ) ) ( not ( = ?auto_589539 ?auto_589549 ) ) ( not ( = ?auto_589539 ?auto_589550 ) ) ( not ( = ?auto_589539 ?auto_589551 ) ) ( not ( = ?auto_589539 ?auto_589552 ) ) ( not ( = ?auto_589539 ?auto_589553 ) ) ( not ( = ?auto_589539 ?auto_589554 ) ) ( not ( = ?auto_589540 ?auto_589541 ) ) ( not ( = ?auto_589540 ?auto_589542 ) ) ( not ( = ?auto_589540 ?auto_589543 ) ) ( not ( = ?auto_589540 ?auto_589544 ) ) ( not ( = ?auto_589540 ?auto_589545 ) ) ( not ( = ?auto_589540 ?auto_589546 ) ) ( not ( = ?auto_589540 ?auto_589547 ) ) ( not ( = ?auto_589540 ?auto_589548 ) ) ( not ( = ?auto_589540 ?auto_589549 ) ) ( not ( = ?auto_589540 ?auto_589550 ) ) ( not ( = ?auto_589540 ?auto_589551 ) ) ( not ( = ?auto_589540 ?auto_589552 ) ) ( not ( = ?auto_589540 ?auto_589553 ) ) ( not ( = ?auto_589540 ?auto_589554 ) ) ( not ( = ?auto_589541 ?auto_589542 ) ) ( not ( = ?auto_589541 ?auto_589543 ) ) ( not ( = ?auto_589541 ?auto_589544 ) ) ( not ( = ?auto_589541 ?auto_589545 ) ) ( not ( = ?auto_589541 ?auto_589546 ) ) ( not ( = ?auto_589541 ?auto_589547 ) ) ( not ( = ?auto_589541 ?auto_589548 ) ) ( not ( = ?auto_589541 ?auto_589549 ) ) ( not ( = ?auto_589541 ?auto_589550 ) ) ( not ( = ?auto_589541 ?auto_589551 ) ) ( not ( = ?auto_589541 ?auto_589552 ) ) ( not ( = ?auto_589541 ?auto_589553 ) ) ( not ( = ?auto_589541 ?auto_589554 ) ) ( not ( = ?auto_589542 ?auto_589543 ) ) ( not ( = ?auto_589542 ?auto_589544 ) ) ( not ( = ?auto_589542 ?auto_589545 ) ) ( not ( = ?auto_589542 ?auto_589546 ) ) ( not ( = ?auto_589542 ?auto_589547 ) ) ( not ( = ?auto_589542 ?auto_589548 ) ) ( not ( = ?auto_589542 ?auto_589549 ) ) ( not ( = ?auto_589542 ?auto_589550 ) ) ( not ( = ?auto_589542 ?auto_589551 ) ) ( not ( = ?auto_589542 ?auto_589552 ) ) ( not ( = ?auto_589542 ?auto_589553 ) ) ( not ( = ?auto_589542 ?auto_589554 ) ) ( not ( = ?auto_589543 ?auto_589544 ) ) ( not ( = ?auto_589543 ?auto_589545 ) ) ( not ( = ?auto_589543 ?auto_589546 ) ) ( not ( = ?auto_589543 ?auto_589547 ) ) ( not ( = ?auto_589543 ?auto_589548 ) ) ( not ( = ?auto_589543 ?auto_589549 ) ) ( not ( = ?auto_589543 ?auto_589550 ) ) ( not ( = ?auto_589543 ?auto_589551 ) ) ( not ( = ?auto_589543 ?auto_589552 ) ) ( not ( = ?auto_589543 ?auto_589553 ) ) ( not ( = ?auto_589543 ?auto_589554 ) ) ( not ( = ?auto_589544 ?auto_589545 ) ) ( not ( = ?auto_589544 ?auto_589546 ) ) ( not ( = ?auto_589544 ?auto_589547 ) ) ( not ( = ?auto_589544 ?auto_589548 ) ) ( not ( = ?auto_589544 ?auto_589549 ) ) ( not ( = ?auto_589544 ?auto_589550 ) ) ( not ( = ?auto_589544 ?auto_589551 ) ) ( not ( = ?auto_589544 ?auto_589552 ) ) ( not ( = ?auto_589544 ?auto_589553 ) ) ( not ( = ?auto_589544 ?auto_589554 ) ) ( not ( = ?auto_589545 ?auto_589546 ) ) ( not ( = ?auto_589545 ?auto_589547 ) ) ( not ( = ?auto_589545 ?auto_589548 ) ) ( not ( = ?auto_589545 ?auto_589549 ) ) ( not ( = ?auto_589545 ?auto_589550 ) ) ( not ( = ?auto_589545 ?auto_589551 ) ) ( not ( = ?auto_589545 ?auto_589552 ) ) ( not ( = ?auto_589545 ?auto_589553 ) ) ( not ( = ?auto_589545 ?auto_589554 ) ) ( not ( = ?auto_589546 ?auto_589547 ) ) ( not ( = ?auto_589546 ?auto_589548 ) ) ( not ( = ?auto_589546 ?auto_589549 ) ) ( not ( = ?auto_589546 ?auto_589550 ) ) ( not ( = ?auto_589546 ?auto_589551 ) ) ( not ( = ?auto_589546 ?auto_589552 ) ) ( not ( = ?auto_589546 ?auto_589553 ) ) ( not ( = ?auto_589546 ?auto_589554 ) ) ( not ( = ?auto_589547 ?auto_589548 ) ) ( not ( = ?auto_589547 ?auto_589549 ) ) ( not ( = ?auto_589547 ?auto_589550 ) ) ( not ( = ?auto_589547 ?auto_589551 ) ) ( not ( = ?auto_589547 ?auto_589552 ) ) ( not ( = ?auto_589547 ?auto_589553 ) ) ( not ( = ?auto_589547 ?auto_589554 ) ) ( not ( = ?auto_589548 ?auto_589549 ) ) ( not ( = ?auto_589548 ?auto_589550 ) ) ( not ( = ?auto_589548 ?auto_589551 ) ) ( not ( = ?auto_589548 ?auto_589552 ) ) ( not ( = ?auto_589548 ?auto_589553 ) ) ( not ( = ?auto_589548 ?auto_589554 ) ) ( not ( = ?auto_589549 ?auto_589550 ) ) ( not ( = ?auto_589549 ?auto_589551 ) ) ( not ( = ?auto_589549 ?auto_589552 ) ) ( not ( = ?auto_589549 ?auto_589553 ) ) ( not ( = ?auto_589549 ?auto_589554 ) ) ( not ( = ?auto_589550 ?auto_589551 ) ) ( not ( = ?auto_589550 ?auto_589552 ) ) ( not ( = ?auto_589550 ?auto_589553 ) ) ( not ( = ?auto_589550 ?auto_589554 ) ) ( not ( = ?auto_589551 ?auto_589552 ) ) ( not ( = ?auto_589551 ?auto_589553 ) ) ( not ( = ?auto_589551 ?auto_589554 ) ) ( not ( = ?auto_589552 ?auto_589553 ) ) ( not ( = ?auto_589552 ?auto_589554 ) ) ( not ( = ?auto_589553 ?auto_589554 ) ) ( ON ?auto_589552 ?auto_589553 ) ( ON ?auto_589551 ?auto_589552 ) ( CLEAR ?auto_589549 ) ( ON ?auto_589550 ?auto_589551 ) ( CLEAR ?auto_589550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_589538 ?auto_589539 ?auto_589540 ?auto_589541 ?auto_589542 ?auto_589543 ?auto_589544 ?auto_589545 ?auto_589546 ?auto_589547 ?auto_589548 ?auto_589549 ?auto_589550 )
      ( MAKE-16PILE ?auto_589538 ?auto_589539 ?auto_589540 ?auto_589541 ?auto_589542 ?auto_589543 ?auto_589544 ?auto_589545 ?auto_589546 ?auto_589547 ?auto_589548 ?auto_589549 ?auto_589550 ?auto_589551 ?auto_589552 ?auto_589553 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589571 - BLOCK
      ?auto_589572 - BLOCK
      ?auto_589573 - BLOCK
      ?auto_589574 - BLOCK
      ?auto_589575 - BLOCK
      ?auto_589576 - BLOCK
      ?auto_589577 - BLOCK
      ?auto_589578 - BLOCK
      ?auto_589579 - BLOCK
      ?auto_589580 - BLOCK
      ?auto_589581 - BLOCK
      ?auto_589582 - BLOCK
      ?auto_589583 - BLOCK
      ?auto_589584 - BLOCK
      ?auto_589585 - BLOCK
      ?auto_589586 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_589586 ) ( ON-TABLE ?auto_589571 ) ( ON ?auto_589572 ?auto_589571 ) ( ON ?auto_589573 ?auto_589572 ) ( ON ?auto_589574 ?auto_589573 ) ( ON ?auto_589575 ?auto_589574 ) ( ON ?auto_589576 ?auto_589575 ) ( ON ?auto_589577 ?auto_589576 ) ( ON ?auto_589578 ?auto_589577 ) ( ON ?auto_589579 ?auto_589578 ) ( ON ?auto_589580 ?auto_589579 ) ( ON ?auto_589581 ?auto_589580 ) ( ON ?auto_589582 ?auto_589581 ) ( not ( = ?auto_589571 ?auto_589572 ) ) ( not ( = ?auto_589571 ?auto_589573 ) ) ( not ( = ?auto_589571 ?auto_589574 ) ) ( not ( = ?auto_589571 ?auto_589575 ) ) ( not ( = ?auto_589571 ?auto_589576 ) ) ( not ( = ?auto_589571 ?auto_589577 ) ) ( not ( = ?auto_589571 ?auto_589578 ) ) ( not ( = ?auto_589571 ?auto_589579 ) ) ( not ( = ?auto_589571 ?auto_589580 ) ) ( not ( = ?auto_589571 ?auto_589581 ) ) ( not ( = ?auto_589571 ?auto_589582 ) ) ( not ( = ?auto_589571 ?auto_589583 ) ) ( not ( = ?auto_589571 ?auto_589584 ) ) ( not ( = ?auto_589571 ?auto_589585 ) ) ( not ( = ?auto_589571 ?auto_589586 ) ) ( not ( = ?auto_589572 ?auto_589573 ) ) ( not ( = ?auto_589572 ?auto_589574 ) ) ( not ( = ?auto_589572 ?auto_589575 ) ) ( not ( = ?auto_589572 ?auto_589576 ) ) ( not ( = ?auto_589572 ?auto_589577 ) ) ( not ( = ?auto_589572 ?auto_589578 ) ) ( not ( = ?auto_589572 ?auto_589579 ) ) ( not ( = ?auto_589572 ?auto_589580 ) ) ( not ( = ?auto_589572 ?auto_589581 ) ) ( not ( = ?auto_589572 ?auto_589582 ) ) ( not ( = ?auto_589572 ?auto_589583 ) ) ( not ( = ?auto_589572 ?auto_589584 ) ) ( not ( = ?auto_589572 ?auto_589585 ) ) ( not ( = ?auto_589572 ?auto_589586 ) ) ( not ( = ?auto_589573 ?auto_589574 ) ) ( not ( = ?auto_589573 ?auto_589575 ) ) ( not ( = ?auto_589573 ?auto_589576 ) ) ( not ( = ?auto_589573 ?auto_589577 ) ) ( not ( = ?auto_589573 ?auto_589578 ) ) ( not ( = ?auto_589573 ?auto_589579 ) ) ( not ( = ?auto_589573 ?auto_589580 ) ) ( not ( = ?auto_589573 ?auto_589581 ) ) ( not ( = ?auto_589573 ?auto_589582 ) ) ( not ( = ?auto_589573 ?auto_589583 ) ) ( not ( = ?auto_589573 ?auto_589584 ) ) ( not ( = ?auto_589573 ?auto_589585 ) ) ( not ( = ?auto_589573 ?auto_589586 ) ) ( not ( = ?auto_589574 ?auto_589575 ) ) ( not ( = ?auto_589574 ?auto_589576 ) ) ( not ( = ?auto_589574 ?auto_589577 ) ) ( not ( = ?auto_589574 ?auto_589578 ) ) ( not ( = ?auto_589574 ?auto_589579 ) ) ( not ( = ?auto_589574 ?auto_589580 ) ) ( not ( = ?auto_589574 ?auto_589581 ) ) ( not ( = ?auto_589574 ?auto_589582 ) ) ( not ( = ?auto_589574 ?auto_589583 ) ) ( not ( = ?auto_589574 ?auto_589584 ) ) ( not ( = ?auto_589574 ?auto_589585 ) ) ( not ( = ?auto_589574 ?auto_589586 ) ) ( not ( = ?auto_589575 ?auto_589576 ) ) ( not ( = ?auto_589575 ?auto_589577 ) ) ( not ( = ?auto_589575 ?auto_589578 ) ) ( not ( = ?auto_589575 ?auto_589579 ) ) ( not ( = ?auto_589575 ?auto_589580 ) ) ( not ( = ?auto_589575 ?auto_589581 ) ) ( not ( = ?auto_589575 ?auto_589582 ) ) ( not ( = ?auto_589575 ?auto_589583 ) ) ( not ( = ?auto_589575 ?auto_589584 ) ) ( not ( = ?auto_589575 ?auto_589585 ) ) ( not ( = ?auto_589575 ?auto_589586 ) ) ( not ( = ?auto_589576 ?auto_589577 ) ) ( not ( = ?auto_589576 ?auto_589578 ) ) ( not ( = ?auto_589576 ?auto_589579 ) ) ( not ( = ?auto_589576 ?auto_589580 ) ) ( not ( = ?auto_589576 ?auto_589581 ) ) ( not ( = ?auto_589576 ?auto_589582 ) ) ( not ( = ?auto_589576 ?auto_589583 ) ) ( not ( = ?auto_589576 ?auto_589584 ) ) ( not ( = ?auto_589576 ?auto_589585 ) ) ( not ( = ?auto_589576 ?auto_589586 ) ) ( not ( = ?auto_589577 ?auto_589578 ) ) ( not ( = ?auto_589577 ?auto_589579 ) ) ( not ( = ?auto_589577 ?auto_589580 ) ) ( not ( = ?auto_589577 ?auto_589581 ) ) ( not ( = ?auto_589577 ?auto_589582 ) ) ( not ( = ?auto_589577 ?auto_589583 ) ) ( not ( = ?auto_589577 ?auto_589584 ) ) ( not ( = ?auto_589577 ?auto_589585 ) ) ( not ( = ?auto_589577 ?auto_589586 ) ) ( not ( = ?auto_589578 ?auto_589579 ) ) ( not ( = ?auto_589578 ?auto_589580 ) ) ( not ( = ?auto_589578 ?auto_589581 ) ) ( not ( = ?auto_589578 ?auto_589582 ) ) ( not ( = ?auto_589578 ?auto_589583 ) ) ( not ( = ?auto_589578 ?auto_589584 ) ) ( not ( = ?auto_589578 ?auto_589585 ) ) ( not ( = ?auto_589578 ?auto_589586 ) ) ( not ( = ?auto_589579 ?auto_589580 ) ) ( not ( = ?auto_589579 ?auto_589581 ) ) ( not ( = ?auto_589579 ?auto_589582 ) ) ( not ( = ?auto_589579 ?auto_589583 ) ) ( not ( = ?auto_589579 ?auto_589584 ) ) ( not ( = ?auto_589579 ?auto_589585 ) ) ( not ( = ?auto_589579 ?auto_589586 ) ) ( not ( = ?auto_589580 ?auto_589581 ) ) ( not ( = ?auto_589580 ?auto_589582 ) ) ( not ( = ?auto_589580 ?auto_589583 ) ) ( not ( = ?auto_589580 ?auto_589584 ) ) ( not ( = ?auto_589580 ?auto_589585 ) ) ( not ( = ?auto_589580 ?auto_589586 ) ) ( not ( = ?auto_589581 ?auto_589582 ) ) ( not ( = ?auto_589581 ?auto_589583 ) ) ( not ( = ?auto_589581 ?auto_589584 ) ) ( not ( = ?auto_589581 ?auto_589585 ) ) ( not ( = ?auto_589581 ?auto_589586 ) ) ( not ( = ?auto_589582 ?auto_589583 ) ) ( not ( = ?auto_589582 ?auto_589584 ) ) ( not ( = ?auto_589582 ?auto_589585 ) ) ( not ( = ?auto_589582 ?auto_589586 ) ) ( not ( = ?auto_589583 ?auto_589584 ) ) ( not ( = ?auto_589583 ?auto_589585 ) ) ( not ( = ?auto_589583 ?auto_589586 ) ) ( not ( = ?auto_589584 ?auto_589585 ) ) ( not ( = ?auto_589584 ?auto_589586 ) ) ( not ( = ?auto_589585 ?auto_589586 ) ) ( ON ?auto_589585 ?auto_589586 ) ( ON ?auto_589584 ?auto_589585 ) ( CLEAR ?auto_589582 ) ( ON ?auto_589583 ?auto_589584 ) ( CLEAR ?auto_589583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_589571 ?auto_589572 ?auto_589573 ?auto_589574 ?auto_589575 ?auto_589576 ?auto_589577 ?auto_589578 ?auto_589579 ?auto_589580 ?auto_589581 ?auto_589582 ?auto_589583 )
      ( MAKE-16PILE ?auto_589571 ?auto_589572 ?auto_589573 ?auto_589574 ?auto_589575 ?auto_589576 ?auto_589577 ?auto_589578 ?auto_589579 ?auto_589580 ?auto_589581 ?auto_589582 ?auto_589583 ?auto_589584 ?auto_589585 ?auto_589586 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589603 - BLOCK
      ?auto_589604 - BLOCK
      ?auto_589605 - BLOCK
      ?auto_589606 - BLOCK
      ?auto_589607 - BLOCK
      ?auto_589608 - BLOCK
      ?auto_589609 - BLOCK
      ?auto_589610 - BLOCK
      ?auto_589611 - BLOCK
      ?auto_589612 - BLOCK
      ?auto_589613 - BLOCK
      ?auto_589614 - BLOCK
      ?auto_589615 - BLOCK
      ?auto_589616 - BLOCK
      ?auto_589617 - BLOCK
      ?auto_589618 - BLOCK
    )
    :vars
    (
      ?auto_589619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589618 ?auto_589619 ) ( ON-TABLE ?auto_589603 ) ( ON ?auto_589604 ?auto_589603 ) ( ON ?auto_589605 ?auto_589604 ) ( ON ?auto_589606 ?auto_589605 ) ( ON ?auto_589607 ?auto_589606 ) ( ON ?auto_589608 ?auto_589607 ) ( ON ?auto_589609 ?auto_589608 ) ( ON ?auto_589610 ?auto_589609 ) ( ON ?auto_589611 ?auto_589610 ) ( ON ?auto_589612 ?auto_589611 ) ( ON ?auto_589613 ?auto_589612 ) ( not ( = ?auto_589603 ?auto_589604 ) ) ( not ( = ?auto_589603 ?auto_589605 ) ) ( not ( = ?auto_589603 ?auto_589606 ) ) ( not ( = ?auto_589603 ?auto_589607 ) ) ( not ( = ?auto_589603 ?auto_589608 ) ) ( not ( = ?auto_589603 ?auto_589609 ) ) ( not ( = ?auto_589603 ?auto_589610 ) ) ( not ( = ?auto_589603 ?auto_589611 ) ) ( not ( = ?auto_589603 ?auto_589612 ) ) ( not ( = ?auto_589603 ?auto_589613 ) ) ( not ( = ?auto_589603 ?auto_589614 ) ) ( not ( = ?auto_589603 ?auto_589615 ) ) ( not ( = ?auto_589603 ?auto_589616 ) ) ( not ( = ?auto_589603 ?auto_589617 ) ) ( not ( = ?auto_589603 ?auto_589618 ) ) ( not ( = ?auto_589603 ?auto_589619 ) ) ( not ( = ?auto_589604 ?auto_589605 ) ) ( not ( = ?auto_589604 ?auto_589606 ) ) ( not ( = ?auto_589604 ?auto_589607 ) ) ( not ( = ?auto_589604 ?auto_589608 ) ) ( not ( = ?auto_589604 ?auto_589609 ) ) ( not ( = ?auto_589604 ?auto_589610 ) ) ( not ( = ?auto_589604 ?auto_589611 ) ) ( not ( = ?auto_589604 ?auto_589612 ) ) ( not ( = ?auto_589604 ?auto_589613 ) ) ( not ( = ?auto_589604 ?auto_589614 ) ) ( not ( = ?auto_589604 ?auto_589615 ) ) ( not ( = ?auto_589604 ?auto_589616 ) ) ( not ( = ?auto_589604 ?auto_589617 ) ) ( not ( = ?auto_589604 ?auto_589618 ) ) ( not ( = ?auto_589604 ?auto_589619 ) ) ( not ( = ?auto_589605 ?auto_589606 ) ) ( not ( = ?auto_589605 ?auto_589607 ) ) ( not ( = ?auto_589605 ?auto_589608 ) ) ( not ( = ?auto_589605 ?auto_589609 ) ) ( not ( = ?auto_589605 ?auto_589610 ) ) ( not ( = ?auto_589605 ?auto_589611 ) ) ( not ( = ?auto_589605 ?auto_589612 ) ) ( not ( = ?auto_589605 ?auto_589613 ) ) ( not ( = ?auto_589605 ?auto_589614 ) ) ( not ( = ?auto_589605 ?auto_589615 ) ) ( not ( = ?auto_589605 ?auto_589616 ) ) ( not ( = ?auto_589605 ?auto_589617 ) ) ( not ( = ?auto_589605 ?auto_589618 ) ) ( not ( = ?auto_589605 ?auto_589619 ) ) ( not ( = ?auto_589606 ?auto_589607 ) ) ( not ( = ?auto_589606 ?auto_589608 ) ) ( not ( = ?auto_589606 ?auto_589609 ) ) ( not ( = ?auto_589606 ?auto_589610 ) ) ( not ( = ?auto_589606 ?auto_589611 ) ) ( not ( = ?auto_589606 ?auto_589612 ) ) ( not ( = ?auto_589606 ?auto_589613 ) ) ( not ( = ?auto_589606 ?auto_589614 ) ) ( not ( = ?auto_589606 ?auto_589615 ) ) ( not ( = ?auto_589606 ?auto_589616 ) ) ( not ( = ?auto_589606 ?auto_589617 ) ) ( not ( = ?auto_589606 ?auto_589618 ) ) ( not ( = ?auto_589606 ?auto_589619 ) ) ( not ( = ?auto_589607 ?auto_589608 ) ) ( not ( = ?auto_589607 ?auto_589609 ) ) ( not ( = ?auto_589607 ?auto_589610 ) ) ( not ( = ?auto_589607 ?auto_589611 ) ) ( not ( = ?auto_589607 ?auto_589612 ) ) ( not ( = ?auto_589607 ?auto_589613 ) ) ( not ( = ?auto_589607 ?auto_589614 ) ) ( not ( = ?auto_589607 ?auto_589615 ) ) ( not ( = ?auto_589607 ?auto_589616 ) ) ( not ( = ?auto_589607 ?auto_589617 ) ) ( not ( = ?auto_589607 ?auto_589618 ) ) ( not ( = ?auto_589607 ?auto_589619 ) ) ( not ( = ?auto_589608 ?auto_589609 ) ) ( not ( = ?auto_589608 ?auto_589610 ) ) ( not ( = ?auto_589608 ?auto_589611 ) ) ( not ( = ?auto_589608 ?auto_589612 ) ) ( not ( = ?auto_589608 ?auto_589613 ) ) ( not ( = ?auto_589608 ?auto_589614 ) ) ( not ( = ?auto_589608 ?auto_589615 ) ) ( not ( = ?auto_589608 ?auto_589616 ) ) ( not ( = ?auto_589608 ?auto_589617 ) ) ( not ( = ?auto_589608 ?auto_589618 ) ) ( not ( = ?auto_589608 ?auto_589619 ) ) ( not ( = ?auto_589609 ?auto_589610 ) ) ( not ( = ?auto_589609 ?auto_589611 ) ) ( not ( = ?auto_589609 ?auto_589612 ) ) ( not ( = ?auto_589609 ?auto_589613 ) ) ( not ( = ?auto_589609 ?auto_589614 ) ) ( not ( = ?auto_589609 ?auto_589615 ) ) ( not ( = ?auto_589609 ?auto_589616 ) ) ( not ( = ?auto_589609 ?auto_589617 ) ) ( not ( = ?auto_589609 ?auto_589618 ) ) ( not ( = ?auto_589609 ?auto_589619 ) ) ( not ( = ?auto_589610 ?auto_589611 ) ) ( not ( = ?auto_589610 ?auto_589612 ) ) ( not ( = ?auto_589610 ?auto_589613 ) ) ( not ( = ?auto_589610 ?auto_589614 ) ) ( not ( = ?auto_589610 ?auto_589615 ) ) ( not ( = ?auto_589610 ?auto_589616 ) ) ( not ( = ?auto_589610 ?auto_589617 ) ) ( not ( = ?auto_589610 ?auto_589618 ) ) ( not ( = ?auto_589610 ?auto_589619 ) ) ( not ( = ?auto_589611 ?auto_589612 ) ) ( not ( = ?auto_589611 ?auto_589613 ) ) ( not ( = ?auto_589611 ?auto_589614 ) ) ( not ( = ?auto_589611 ?auto_589615 ) ) ( not ( = ?auto_589611 ?auto_589616 ) ) ( not ( = ?auto_589611 ?auto_589617 ) ) ( not ( = ?auto_589611 ?auto_589618 ) ) ( not ( = ?auto_589611 ?auto_589619 ) ) ( not ( = ?auto_589612 ?auto_589613 ) ) ( not ( = ?auto_589612 ?auto_589614 ) ) ( not ( = ?auto_589612 ?auto_589615 ) ) ( not ( = ?auto_589612 ?auto_589616 ) ) ( not ( = ?auto_589612 ?auto_589617 ) ) ( not ( = ?auto_589612 ?auto_589618 ) ) ( not ( = ?auto_589612 ?auto_589619 ) ) ( not ( = ?auto_589613 ?auto_589614 ) ) ( not ( = ?auto_589613 ?auto_589615 ) ) ( not ( = ?auto_589613 ?auto_589616 ) ) ( not ( = ?auto_589613 ?auto_589617 ) ) ( not ( = ?auto_589613 ?auto_589618 ) ) ( not ( = ?auto_589613 ?auto_589619 ) ) ( not ( = ?auto_589614 ?auto_589615 ) ) ( not ( = ?auto_589614 ?auto_589616 ) ) ( not ( = ?auto_589614 ?auto_589617 ) ) ( not ( = ?auto_589614 ?auto_589618 ) ) ( not ( = ?auto_589614 ?auto_589619 ) ) ( not ( = ?auto_589615 ?auto_589616 ) ) ( not ( = ?auto_589615 ?auto_589617 ) ) ( not ( = ?auto_589615 ?auto_589618 ) ) ( not ( = ?auto_589615 ?auto_589619 ) ) ( not ( = ?auto_589616 ?auto_589617 ) ) ( not ( = ?auto_589616 ?auto_589618 ) ) ( not ( = ?auto_589616 ?auto_589619 ) ) ( not ( = ?auto_589617 ?auto_589618 ) ) ( not ( = ?auto_589617 ?auto_589619 ) ) ( not ( = ?auto_589618 ?auto_589619 ) ) ( ON ?auto_589617 ?auto_589618 ) ( ON ?auto_589616 ?auto_589617 ) ( ON ?auto_589615 ?auto_589616 ) ( CLEAR ?auto_589613 ) ( ON ?auto_589614 ?auto_589615 ) ( CLEAR ?auto_589614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_589603 ?auto_589604 ?auto_589605 ?auto_589606 ?auto_589607 ?auto_589608 ?auto_589609 ?auto_589610 ?auto_589611 ?auto_589612 ?auto_589613 ?auto_589614 )
      ( MAKE-16PILE ?auto_589603 ?auto_589604 ?auto_589605 ?auto_589606 ?auto_589607 ?auto_589608 ?auto_589609 ?auto_589610 ?auto_589611 ?auto_589612 ?auto_589613 ?auto_589614 ?auto_589615 ?auto_589616 ?auto_589617 ?auto_589618 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589636 - BLOCK
      ?auto_589637 - BLOCK
      ?auto_589638 - BLOCK
      ?auto_589639 - BLOCK
      ?auto_589640 - BLOCK
      ?auto_589641 - BLOCK
      ?auto_589642 - BLOCK
      ?auto_589643 - BLOCK
      ?auto_589644 - BLOCK
      ?auto_589645 - BLOCK
      ?auto_589646 - BLOCK
      ?auto_589647 - BLOCK
      ?auto_589648 - BLOCK
      ?auto_589649 - BLOCK
      ?auto_589650 - BLOCK
      ?auto_589651 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_589651 ) ( ON-TABLE ?auto_589636 ) ( ON ?auto_589637 ?auto_589636 ) ( ON ?auto_589638 ?auto_589637 ) ( ON ?auto_589639 ?auto_589638 ) ( ON ?auto_589640 ?auto_589639 ) ( ON ?auto_589641 ?auto_589640 ) ( ON ?auto_589642 ?auto_589641 ) ( ON ?auto_589643 ?auto_589642 ) ( ON ?auto_589644 ?auto_589643 ) ( ON ?auto_589645 ?auto_589644 ) ( ON ?auto_589646 ?auto_589645 ) ( not ( = ?auto_589636 ?auto_589637 ) ) ( not ( = ?auto_589636 ?auto_589638 ) ) ( not ( = ?auto_589636 ?auto_589639 ) ) ( not ( = ?auto_589636 ?auto_589640 ) ) ( not ( = ?auto_589636 ?auto_589641 ) ) ( not ( = ?auto_589636 ?auto_589642 ) ) ( not ( = ?auto_589636 ?auto_589643 ) ) ( not ( = ?auto_589636 ?auto_589644 ) ) ( not ( = ?auto_589636 ?auto_589645 ) ) ( not ( = ?auto_589636 ?auto_589646 ) ) ( not ( = ?auto_589636 ?auto_589647 ) ) ( not ( = ?auto_589636 ?auto_589648 ) ) ( not ( = ?auto_589636 ?auto_589649 ) ) ( not ( = ?auto_589636 ?auto_589650 ) ) ( not ( = ?auto_589636 ?auto_589651 ) ) ( not ( = ?auto_589637 ?auto_589638 ) ) ( not ( = ?auto_589637 ?auto_589639 ) ) ( not ( = ?auto_589637 ?auto_589640 ) ) ( not ( = ?auto_589637 ?auto_589641 ) ) ( not ( = ?auto_589637 ?auto_589642 ) ) ( not ( = ?auto_589637 ?auto_589643 ) ) ( not ( = ?auto_589637 ?auto_589644 ) ) ( not ( = ?auto_589637 ?auto_589645 ) ) ( not ( = ?auto_589637 ?auto_589646 ) ) ( not ( = ?auto_589637 ?auto_589647 ) ) ( not ( = ?auto_589637 ?auto_589648 ) ) ( not ( = ?auto_589637 ?auto_589649 ) ) ( not ( = ?auto_589637 ?auto_589650 ) ) ( not ( = ?auto_589637 ?auto_589651 ) ) ( not ( = ?auto_589638 ?auto_589639 ) ) ( not ( = ?auto_589638 ?auto_589640 ) ) ( not ( = ?auto_589638 ?auto_589641 ) ) ( not ( = ?auto_589638 ?auto_589642 ) ) ( not ( = ?auto_589638 ?auto_589643 ) ) ( not ( = ?auto_589638 ?auto_589644 ) ) ( not ( = ?auto_589638 ?auto_589645 ) ) ( not ( = ?auto_589638 ?auto_589646 ) ) ( not ( = ?auto_589638 ?auto_589647 ) ) ( not ( = ?auto_589638 ?auto_589648 ) ) ( not ( = ?auto_589638 ?auto_589649 ) ) ( not ( = ?auto_589638 ?auto_589650 ) ) ( not ( = ?auto_589638 ?auto_589651 ) ) ( not ( = ?auto_589639 ?auto_589640 ) ) ( not ( = ?auto_589639 ?auto_589641 ) ) ( not ( = ?auto_589639 ?auto_589642 ) ) ( not ( = ?auto_589639 ?auto_589643 ) ) ( not ( = ?auto_589639 ?auto_589644 ) ) ( not ( = ?auto_589639 ?auto_589645 ) ) ( not ( = ?auto_589639 ?auto_589646 ) ) ( not ( = ?auto_589639 ?auto_589647 ) ) ( not ( = ?auto_589639 ?auto_589648 ) ) ( not ( = ?auto_589639 ?auto_589649 ) ) ( not ( = ?auto_589639 ?auto_589650 ) ) ( not ( = ?auto_589639 ?auto_589651 ) ) ( not ( = ?auto_589640 ?auto_589641 ) ) ( not ( = ?auto_589640 ?auto_589642 ) ) ( not ( = ?auto_589640 ?auto_589643 ) ) ( not ( = ?auto_589640 ?auto_589644 ) ) ( not ( = ?auto_589640 ?auto_589645 ) ) ( not ( = ?auto_589640 ?auto_589646 ) ) ( not ( = ?auto_589640 ?auto_589647 ) ) ( not ( = ?auto_589640 ?auto_589648 ) ) ( not ( = ?auto_589640 ?auto_589649 ) ) ( not ( = ?auto_589640 ?auto_589650 ) ) ( not ( = ?auto_589640 ?auto_589651 ) ) ( not ( = ?auto_589641 ?auto_589642 ) ) ( not ( = ?auto_589641 ?auto_589643 ) ) ( not ( = ?auto_589641 ?auto_589644 ) ) ( not ( = ?auto_589641 ?auto_589645 ) ) ( not ( = ?auto_589641 ?auto_589646 ) ) ( not ( = ?auto_589641 ?auto_589647 ) ) ( not ( = ?auto_589641 ?auto_589648 ) ) ( not ( = ?auto_589641 ?auto_589649 ) ) ( not ( = ?auto_589641 ?auto_589650 ) ) ( not ( = ?auto_589641 ?auto_589651 ) ) ( not ( = ?auto_589642 ?auto_589643 ) ) ( not ( = ?auto_589642 ?auto_589644 ) ) ( not ( = ?auto_589642 ?auto_589645 ) ) ( not ( = ?auto_589642 ?auto_589646 ) ) ( not ( = ?auto_589642 ?auto_589647 ) ) ( not ( = ?auto_589642 ?auto_589648 ) ) ( not ( = ?auto_589642 ?auto_589649 ) ) ( not ( = ?auto_589642 ?auto_589650 ) ) ( not ( = ?auto_589642 ?auto_589651 ) ) ( not ( = ?auto_589643 ?auto_589644 ) ) ( not ( = ?auto_589643 ?auto_589645 ) ) ( not ( = ?auto_589643 ?auto_589646 ) ) ( not ( = ?auto_589643 ?auto_589647 ) ) ( not ( = ?auto_589643 ?auto_589648 ) ) ( not ( = ?auto_589643 ?auto_589649 ) ) ( not ( = ?auto_589643 ?auto_589650 ) ) ( not ( = ?auto_589643 ?auto_589651 ) ) ( not ( = ?auto_589644 ?auto_589645 ) ) ( not ( = ?auto_589644 ?auto_589646 ) ) ( not ( = ?auto_589644 ?auto_589647 ) ) ( not ( = ?auto_589644 ?auto_589648 ) ) ( not ( = ?auto_589644 ?auto_589649 ) ) ( not ( = ?auto_589644 ?auto_589650 ) ) ( not ( = ?auto_589644 ?auto_589651 ) ) ( not ( = ?auto_589645 ?auto_589646 ) ) ( not ( = ?auto_589645 ?auto_589647 ) ) ( not ( = ?auto_589645 ?auto_589648 ) ) ( not ( = ?auto_589645 ?auto_589649 ) ) ( not ( = ?auto_589645 ?auto_589650 ) ) ( not ( = ?auto_589645 ?auto_589651 ) ) ( not ( = ?auto_589646 ?auto_589647 ) ) ( not ( = ?auto_589646 ?auto_589648 ) ) ( not ( = ?auto_589646 ?auto_589649 ) ) ( not ( = ?auto_589646 ?auto_589650 ) ) ( not ( = ?auto_589646 ?auto_589651 ) ) ( not ( = ?auto_589647 ?auto_589648 ) ) ( not ( = ?auto_589647 ?auto_589649 ) ) ( not ( = ?auto_589647 ?auto_589650 ) ) ( not ( = ?auto_589647 ?auto_589651 ) ) ( not ( = ?auto_589648 ?auto_589649 ) ) ( not ( = ?auto_589648 ?auto_589650 ) ) ( not ( = ?auto_589648 ?auto_589651 ) ) ( not ( = ?auto_589649 ?auto_589650 ) ) ( not ( = ?auto_589649 ?auto_589651 ) ) ( not ( = ?auto_589650 ?auto_589651 ) ) ( ON ?auto_589650 ?auto_589651 ) ( ON ?auto_589649 ?auto_589650 ) ( ON ?auto_589648 ?auto_589649 ) ( CLEAR ?auto_589646 ) ( ON ?auto_589647 ?auto_589648 ) ( CLEAR ?auto_589647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_589636 ?auto_589637 ?auto_589638 ?auto_589639 ?auto_589640 ?auto_589641 ?auto_589642 ?auto_589643 ?auto_589644 ?auto_589645 ?auto_589646 ?auto_589647 )
      ( MAKE-16PILE ?auto_589636 ?auto_589637 ?auto_589638 ?auto_589639 ?auto_589640 ?auto_589641 ?auto_589642 ?auto_589643 ?auto_589644 ?auto_589645 ?auto_589646 ?auto_589647 ?auto_589648 ?auto_589649 ?auto_589650 ?auto_589651 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589668 - BLOCK
      ?auto_589669 - BLOCK
      ?auto_589670 - BLOCK
      ?auto_589671 - BLOCK
      ?auto_589672 - BLOCK
      ?auto_589673 - BLOCK
      ?auto_589674 - BLOCK
      ?auto_589675 - BLOCK
      ?auto_589676 - BLOCK
      ?auto_589677 - BLOCK
      ?auto_589678 - BLOCK
      ?auto_589679 - BLOCK
      ?auto_589680 - BLOCK
      ?auto_589681 - BLOCK
      ?auto_589682 - BLOCK
      ?auto_589683 - BLOCK
    )
    :vars
    (
      ?auto_589684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589683 ?auto_589684 ) ( ON-TABLE ?auto_589668 ) ( ON ?auto_589669 ?auto_589668 ) ( ON ?auto_589670 ?auto_589669 ) ( ON ?auto_589671 ?auto_589670 ) ( ON ?auto_589672 ?auto_589671 ) ( ON ?auto_589673 ?auto_589672 ) ( ON ?auto_589674 ?auto_589673 ) ( ON ?auto_589675 ?auto_589674 ) ( ON ?auto_589676 ?auto_589675 ) ( ON ?auto_589677 ?auto_589676 ) ( not ( = ?auto_589668 ?auto_589669 ) ) ( not ( = ?auto_589668 ?auto_589670 ) ) ( not ( = ?auto_589668 ?auto_589671 ) ) ( not ( = ?auto_589668 ?auto_589672 ) ) ( not ( = ?auto_589668 ?auto_589673 ) ) ( not ( = ?auto_589668 ?auto_589674 ) ) ( not ( = ?auto_589668 ?auto_589675 ) ) ( not ( = ?auto_589668 ?auto_589676 ) ) ( not ( = ?auto_589668 ?auto_589677 ) ) ( not ( = ?auto_589668 ?auto_589678 ) ) ( not ( = ?auto_589668 ?auto_589679 ) ) ( not ( = ?auto_589668 ?auto_589680 ) ) ( not ( = ?auto_589668 ?auto_589681 ) ) ( not ( = ?auto_589668 ?auto_589682 ) ) ( not ( = ?auto_589668 ?auto_589683 ) ) ( not ( = ?auto_589668 ?auto_589684 ) ) ( not ( = ?auto_589669 ?auto_589670 ) ) ( not ( = ?auto_589669 ?auto_589671 ) ) ( not ( = ?auto_589669 ?auto_589672 ) ) ( not ( = ?auto_589669 ?auto_589673 ) ) ( not ( = ?auto_589669 ?auto_589674 ) ) ( not ( = ?auto_589669 ?auto_589675 ) ) ( not ( = ?auto_589669 ?auto_589676 ) ) ( not ( = ?auto_589669 ?auto_589677 ) ) ( not ( = ?auto_589669 ?auto_589678 ) ) ( not ( = ?auto_589669 ?auto_589679 ) ) ( not ( = ?auto_589669 ?auto_589680 ) ) ( not ( = ?auto_589669 ?auto_589681 ) ) ( not ( = ?auto_589669 ?auto_589682 ) ) ( not ( = ?auto_589669 ?auto_589683 ) ) ( not ( = ?auto_589669 ?auto_589684 ) ) ( not ( = ?auto_589670 ?auto_589671 ) ) ( not ( = ?auto_589670 ?auto_589672 ) ) ( not ( = ?auto_589670 ?auto_589673 ) ) ( not ( = ?auto_589670 ?auto_589674 ) ) ( not ( = ?auto_589670 ?auto_589675 ) ) ( not ( = ?auto_589670 ?auto_589676 ) ) ( not ( = ?auto_589670 ?auto_589677 ) ) ( not ( = ?auto_589670 ?auto_589678 ) ) ( not ( = ?auto_589670 ?auto_589679 ) ) ( not ( = ?auto_589670 ?auto_589680 ) ) ( not ( = ?auto_589670 ?auto_589681 ) ) ( not ( = ?auto_589670 ?auto_589682 ) ) ( not ( = ?auto_589670 ?auto_589683 ) ) ( not ( = ?auto_589670 ?auto_589684 ) ) ( not ( = ?auto_589671 ?auto_589672 ) ) ( not ( = ?auto_589671 ?auto_589673 ) ) ( not ( = ?auto_589671 ?auto_589674 ) ) ( not ( = ?auto_589671 ?auto_589675 ) ) ( not ( = ?auto_589671 ?auto_589676 ) ) ( not ( = ?auto_589671 ?auto_589677 ) ) ( not ( = ?auto_589671 ?auto_589678 ) ) ( not ( = ?auto_589671 ?auto_589679 ) ) ( not ( = ?auto_589671 ?auto_589680 ) ) ( not ( = ?auto_589671 ?auto_589681 ) ) ( not ( = ?auto_589671 ?auto_589682 ) ) ( not ( = ?auto_589671 ?auto_589683 ) ) ( not ( = ?auto_589671 ?auto_589684 ) ) ( not ( = ?auto_589672 ?auto_589673 ) ) ( not ( = ?auto_589672 ?auto_589674 ) ) ( not ( = ?auto_589672 ?auto_589675 ) ) ( not ( = ?auto_589672 ?auto_589676 ) ) ( not ( = ?auto_589672 ?auto_589677 ) ) ( not ( = ?auto_589672 ?auto_589678 ) ) ( not ( = ?auto_589672 ?auto_589679 ) ) ( not ( = ?auto_589672 ?auto_589680 ) ) ( not ( = ?auto_589672 ?auto_589681 ) ) ( not ( = ?auto_589672 ?auto_589682 ) ) ( not ( = ?auto_589672 ?auto_589683 ) ) ( not ( = ?auto_589672 ?auto_589684 ) ) ( not ( = ?auto_589673 ?auto_589674 ) ) ( not ( = ?auto_589673 ?auto_589675 ) ) ( not ( = ?auto_589673 ?auto_589676 ) ) ( not ( = ?auto_589673 ?auto_589677 ) ) ( not ( = ?auto_589673 ?auto_589678 ) ) ( not ( = ?auto_589673 ?auto_589679 ) ) ( not ( = ?auto_589673 ?auto_589680 ) ) ( not ( = ?auto_589673 ?auto_589681 ) ) ( not ( = ?auto_589673 ?auto_589682 ) ) ( not ( = ?auto_589673 ?auto_589683 ) ) ( not ( = ?auto_589673 ?auto_589684 ) ) ( not ( = ?auto_589674 ?auto_589675 ) ) ( not ( = ?auto_589674 ?auto_589676 ) ) ( not ( = ?auto_589674 ?auto_589677 ) ) ( not ( = ?auto_589674 ?auto_589678 ) ) ( not ( = ?auto_589674 ?auto_589679 ) ) ( not ( = ?auto_589674 ?auto_589680 ) ) ( not ( = ?auto_589674 ?auto_589681 ) ) ( not ( = ?auto_589674 ?auto_589682 ) ) ( not ( = ?auto_589674 ?auto_589683 ) ) ( not ( = ?auto_589674 ?auto_589684 ) ) ( not ( = ?auto_589675 ?auto_589676 ) ) ( not ( = ?auto_589675 ?auto_589677 ) ) ( not ( = ?auto_589675 ?auto_589678 ) ) ( not ( = ?auto_589675 ?auto_589679 ) ) ( not ( = ?auto_589675 ?auto_589680 ) ) ( not ( = ?auto_589675 ?auto_589681 ) ) ( not ( = ?auto_589675 ?auto_589682 ) ) ( not ( = ?auto_589675 ?auto_589683 ) ) ( not ( = ?auto_589675 ?auto_589684 ) ) ( not ( = ?auto_589676 ?auto_589677 ) ) ( not ( = ?auto_589676 ?auto_589678 ) ) ( not ( = ?auto_589676 ?auto_589679 ) ) ( not ( = ?auto_589676 ?auto_589680 ) ) ( not ( = ?auto_589676 ?auto_589681 ) ) ( not ( = ?auto_589676 ?auto_589682 ) ) ( not ( = ?auto_589676 ?auto_589683 ) ) ( not ( = ?auto_589676 ?auto_589684 ) ) ( not ( = ?auto_589677 ?auto_589678 ) ) ( not ( = ?auto_589677 ?auto_589679 ) ) ( not ( = ?auto_589677 ?auto_589680 ) ) ( not ( = ?auto_589677 ?auto_589681 ) ) ( not ( = ?auto_589677 ?auto_589682 ) ) ( not ( = ?auto_589677 ?auto_589683 ) ) ( not ( = ?auto_589677 ?auto_589684 ) ) ( not ( = ?auto_589678 ?auto_589679 ) ) ( not ( = ?auto_589678 ?auto_589680 ) ) ( not ( = ?auto_589678 ?auto_589681 ) ) ( not ( = ?auto_589678 ?auto_589682 ) ) ( not ( = ?auto_589678 ?auto_589683 ) ) ( not ( = ?auto_589678 ?auto_589684 ) ) ( not ( = ?auto_589679 ?auto_589680 ) ) ( not ( = ?auto_589679 ?auto_589681 ) ) ( not ( = ?auto_589679 ?auto_589682 ) ) ( not ( = ?auto_589679 ?auto_589683 ) ) ( not ( = ?auto_589679 ?auto_589684 ) ) ( not ( = ?auto_589680 ?auto_589681 ) ) ( not ( = ?auto_589680 ?auto_589682 ) ) ( not ( = ?auto_589680 ?auto_589683 ) ) ( not ( = ?auto_589680 ?auto_589684 ) ) ( not ( = ?auto_589681 ?auto_589682 ) ) ( not ( = ?auto_589681 ?auto_589683 ) ) ( not ( = ?auto_589681 ?auto_589684 ) ) ( not ( = ?auto_589682 ?auto_589683 ) ) ( not ( = ?auto_589682 ?auto_589684 ) ) ( not ( = ?auto_589683 ?auto_589684 ) ) ( ON ?auto_589682 ?auto_589683 ) ( ON ?auto_589681 ?auto_589682 ) ( ON ?auto_589680 ?auto_589681 ) ( ON ?auto_589679 ?auto_589680 ) ( CLEAR ?auto_589677 ) ( ON ?auto_589678 ?auto_589679 ) ( CLEAR ?auto_589678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_589668 ?auto_589669 ?auto_589670 ?auto_589671 ?auto_589672 ?auto_589673 ?auto_589674 ?auto_589675 ?auto_589676 ?auto_589677 ?auto_589678 )
      ( MAKE-16PILE ?auto_589668 ?auto_589669 ?auto_589670 ?auto_589671 ?auto_589672 ?auto_589673 ?auto_589674 ?auto_589675 ?auto_589676 ?auto_589677 ?auto_589678 ?auto_589679 ?auto_589680 ?auto_589681 ?auto_589682 ?auto_589683 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589701 - BLOCK
      ?auto_589702 - BLOCK
      ?auto_589703 - BLOCK
      ?auto_589704 - BLOCK
      ?auto_589705 - BLOCK
      ?auto_589706 - BLOCK
      ?auto_589707 - BLOCK
      ?auto_589708 - BLOCK
      ?auto_589709 - BLOCK
      ?auto_589710 - BLOCK
      ?auto_589711 - BLOCK
      ?auto_589712 - BLOCK
      ?auto_589713 - BLOCK
      ?auto_589714 - BLOCK
      ?auto_589715 - BLOCK
      ?auto_589716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_589716 ) ( ON-TABLE ?auto_589701 ) ( ON ?auto_589702 ?auto_589701 ) ( ON ?auto_589703 ?auto_589702 ) ( ON ?auto_589704 ?auto_589703 ) ( ON ?auto_589705 ?auto_589704 ) ( ON ?auto_589706 ?auto_589705 ) ( ON ?auto_589707 ?auto_589706 ) ( ON ?auto_589708 ?auto_589707 ) ( ON ?auto_589709 ?auto_589708 ) ( ON ?auto_589710 ?auto_589709 ) ( not ( = ?auto_589701 ?auto_589702 ) ) ( not ( = ?auto_589701 ?auto_589703 ) ) ( not ( = ?auto_589701 ?auto_589704 ) ) ( not ( = ?auto_589701 ?auto_589705 ) ) ( not ( = ?auto_589701 ?auto_589706 ) ) ( not ( = ?auto_589701 ?auto_589707 ) ) ( not ( = ?auto_589701 ?auto_589708 ) ) ( not ( = ?auto_589701 ?auto_589709 ) ) ( not ( = ?auto_589701 ?auto_589710 ) ) ( not ( = ?auto_589701 ?auto_589711 ) ) ( not ( = ?auto_589701 ?auto_589712 ) ) ( not ( = ?auto_589701 ?auto_589713 ) ) ( not ( = ?auto_589701 ?auto_589714 ) ) ( not ( = ?auto_589701 ?auto_589715 ) ) ( not ( = ?auto_589701 ?auto_589716 ) ) ( not ( = ?auto_589702 ?auto_589703 ) ) ( not ( = ?auto_589702 ?auto_589704 ) ) ( not ( = ?auto_589702 ?auto_589705 ) ) ( not ( = ?auto_589702 ?auto_589706 ) ) ( not ( = ?auto_589702 ?auto_589707 ) ) ( not ( = ?auto_589702 ?auto_589708 ) ) ( not ( = ?auto_589702 ?auto_589709 ) ) ( not ( = ?auto_589702 ?auto_589710 ) ) ( not ( = ?auto_589702 ?auto_589711 ) ) ( not ( = ?auto_589702 ?auto_589712 ) ) ( not ( = ?auto_589702 ?auto_589713 ) ) ( not ( = ?auto_589702 ?auto_589714 ) ) ( not ( = ?auto_589702 ?auto_589715 ) ) ( not ( = ?auto_589702 ?auto_589716 ) ) ( not ( = ?auto_589703 ?auto_589704 ) ) ( not ( = ?auto_589703 ?auto_589705 ) ) ( not ( = ?auto_589703 ?auto_589706 ) ) ( not ( = ?auto_589703 ?auto_589707 ) ) ( not ( = ?auto_589703 ?auto_589708 ) ) ( not ( = ?auto_589703 ?auto_589709 ) ) ( not ( = ?auto_589703 ?auto_589710 ) ) ( not ( = ?auto_589703 ?auto_589711 ) ) ( not ( = ?auto_589703 ?auto_589712 ) ) ( not ( = ?auto_589703 ?auto_589713 ) ) ( not ( = ?auto_589703 ?auto_589714 ) ) ( not ( = ?auto_589703 ?auto_589715 ) ) ( not ( = ?auto_589703 ?auto_589716 ) ) ( not ( = ?auto_589704 ?auto_589705 ) ) ( not ( = ?auto_589704 ?auto_589706 ) ) ( not ( = ?auto_589704 ?auto_589707 ) ) ( not ( = ?auto_589704 ?auto_589708 ) ) ( not ( = ?auto_589704 ?auto_589709 ) ) ( not ( = ?auto_589704 ?auto_589710 ) ) ( not ( = ?auto_589704 ?auto_589711 ) ) ( not ( = ?auto_589704 ?auto_589712 ) ) ( not ( = ?auto_589704 ?auto_589713 ) ) ( not ( = ?auto_589704 ?auto_589714 ) ) ( not ( = ?auto_589704 ?auto_589715 ) ) ( not ( = ?auto_589704 ?auto_589716 ) ) ( not ( = ?auto_589705 ?auto_589706 ) ) ( not ( = ?auto_589705 ?auto_589707 ) ) ( not ( = ?auto_589705 ?auto_589708 ) ) ( not ( = ?auto_589705 ?auto_589709 ) ) ( not ( = ?auto_589705 ?auto_589710 ) ) ( not ( = ?auto_589705 ?auto_589711 ) ) ( not ( = ?auto_589705 ?auto_589712 ) ) ( not ( = ?auto_589705 ?auto_589713 ) ) ( not ( = ?auto_589705 ?auto_589714 ) ) ( not ( = ?auto_589705 ?auto_589715 ) ) ( not ( = ?auto_589705 ?auto_589716 ) ) ( not ( = ?auto_589706 ?auto_589707 ) ) ( not ( = ?auto_589706 ?auto_589708 ) ) ( not ( = ?auto_589706 ?auto_589709 ) ) ( not ( = ?auto_589706 ?auto_589710 ) ) ( not ( = ?auto_589706 ?auto_589711 ) ) ( not ( = ?auto_589706 ?auto_589712 ) ) ( not ( = ?auto_589706 ?auto_589713 ) ) ( not ( = ?auto_589706 ?auto_589714 ) ) ( not ( = ?auto_589706 ?auto_589715 ) ) ( not ( = ?auto_589706 ?auto_589716 ) ) ( not ( = ?auto_589707 ?auto_589708 ) ) ( not ( = ?auto_589707 ?auto_589709 ) ) ( not ( = ?auto_589707 ?auto_589710 ) ) ( not ( = ?auto_589707 ?auto_589711 ) ) ( not ( = ?auto_589707 ?auto_589712 ) ) ( not ( = ?auto_589707 ?auto_589713 ) ) ( not ( = ?auto_589707 ?auto_589714 ) ) ( not ( = ?auto_589707 ?auto_589715 ) ) ( not ( = ?auto_589707 ?auto_589716 ) ) ( not ( = ?auto_589708 ?auto_589709 ) ) ( not ( = ?auto_589708 ?auto_589710 ) ) ( not ( = ?auto_589708 ?auto_589711 ) ) ( not ( = ?auto_589708 ?auto_589712 ) ) ( not ( = ?auto_589708 ?auto_589713 ) ) ( not ( = ?auto_589708 ?auto_589714 ) ) ( not ( = ?auto_589708 ?auto_589715 ) ) ( not ( = ?auto_589708 ?auto_589716 ) ) ( not ( = ?auto_589709 ?auto_589710 ) ) ( not ( = ?auto_589709 ?auto_589711 ) ) ( not ( = ?auto_589709 ?auto_589712 ) ) ( not ( = ?auto_589709 ?auto_589713 ) ) ( not ( = ?auto_589709 ?auto_589714 ) ) ( not ( = ?auto_589709 ?auto_589715 ) ) ( not ( = ?auto_589709 ?auto_589716 ) ) ( not ( = ?auto_589710 ?auto_589711 ) ) ( not ( = ?auto_589710 ?auto_589712 ) ) ( not ( = ?auto_589710 ?auto_589713 ) ) ( not ( = ?auto_589710 ?auto_589714 ) ) ( not ( = ?auto_589710 ?auto_589715 ) ) ( not ( = ?auto_589710 ?auto_589716 ) ) ( not ( = ?auto_589711 ?auto_589712 ) ) ( not ( = ?auto_589711 ?auto_589713 ) ) ( not ( = ?auto_589711 ?auto_589714 ) ) ( not ( = ?auto_589711 ?auto_589715 ) ) ( not ( = ?auto_589711 ?auto_589716 ) ) ( not ( = ?auto_589712 ?auto_589713 ) ) ( not ( = ?auto_589712 ?auto_589714 ) ) ( not ( = ?auto_589712 ?auto_589715 ) ) ( not ( = ?auto_589712 ?auto_589716 ) ) ( not ( = ?auto_589713 ?auto_589714 ) ) ( not ( = ?auto_589713 ?auto_589715 ) ) ( not ( = ?auto_589713 ?auto_589716 ) ) ( not ( = ?auto_589714 ?auto_589715 ) ) ( not ( = ?auto_589714 ?auto_589716 ) ) ( not ( = ?auto_589715 ?auto_589716 ) ) ( ON ?auto_589715 ?auto_589716 ) ( ON ?auto_589714 ?auto_589715 ) ( ON ?auto_589713 ?auto_589714 ) ( ON ?auto_589712 ?auto_589713 ) ( CLEAR ?auto_589710 ) ( ON ?auto_589711 ?auto_589712 ) ( CLEAR ?auto_589711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_589701 ?auto_589702 ?auto_589703 ?auto_589704 ?auto_589705 ?auto_589706 ?auto_589707 ?auto_589708 ?auto_589709 ?auto_589710 ?auto_589711 )
      ( MAKE-16PILE ?auto_589701 ?auto_589702 ?auto_589703 ?auto_589704 ?auto_589705 ?auto_589706 ?auto_589707 ?auto_589708 ?auto_589709 ?auto_589710 ?auto_589711 ?auto_589712 ?auto_589713 ?auto_589714 ?auto_589715 ?auto_589716 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589733 - BLOCK
      ?auto_589734 - BLOCK
      ?auto_589735 - BLOCK
      ?auto_589736 - BLOCK
      ?auto_589737 - BLOCK
      ?auto_589738 - BLOCK
      ?auto_589739 - BLOCK
      ?auto_589740 - BLOCK
      ?auto_589741 - BLOCK
      ?auto_589742 - BLOCK
      ?auto_589743 - BLOCK
      ?auto_589744 - BLOCK
      ?auto_589745 - BLOCK
      ?auto_589746 - BLOCK
      ?auto_589747 - BLOCK
      ?auto_589748 - BLOCK
    )
    :vars
    (
      ?auto_589749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589748 ?auto_589749 ) ( ON-TABLE ?auto_589733 ) ( ON ?auto_589734 ?auto_589733 ) ( ON ?auto_589735 ?auto_589734 ) ( ON ?auto_589736 ?auto_589735 ) ( ON ?auto_589737 ?auto_589736 ) ( ON ?auto_589738 ?auto_589737 ) ( ON ?auto_589739 ?auto_589738 ) ( ON ?auto_589740 ?auto_589739 ) ( ON ?auto_589741 ?auto_589740 ) ( not ( = ?auto_589733 ?auto_589734 ) ) ( not ( = ?auto_589733 ?auto_589735 ) ) ( not ( = ?auto_589733 ?auto_589736 ) ) ( not ( = ?auto_589733 ?auto_589737 ) ) ( not ( = ?auto_589733 ?auto_589738 ) ) ( not ( = ?auto_589733 ?auto_589739 ) ) ( not ( = ?auto_589733 ?auto_589740 ) ) ( not ( = ?auto_589733 ?auto_589741 ) ) ( not ( = ?auto_589733 ?auto_589742 ) ) ( not ( = ?auto_589733 ?auto_589743 ) ) ( not ( = ?auto_589733 ?auto_589744 ) ) ( not ( = ?auto_589733 ?auto_589745 ) ) ( not ( = ?auto_589733 ?auto_589746 ) ) ( not ( = ?auto_589733 ?auto_589747 ) ) ( not ( = ?auto_589733 ?auto_589748 ) ) ( not ( = ?auto_589733 ?auto_589749 ) ) ( not ( = ?auto_589734 ?auto_589735 ) ) ( not ( = ?auto_589734 ?auto_589736 ) ) ( not ( = ?auto_589734 ?auto_589737 ) ) ( not ( = ?auto_589734 ?auto_589738 ) ) ( not ( = ?auto_589734 ?auto_589739 ) ) ( not ( = ?auto_589734 ?auto_589740 ) ) ( not ( = ?auto_589734 ?auto_589741 ) ) ( not ( = ?auto_589734 ?auto_589742 ) ) ( not ( = ?auto_589734 ?auto_589743 ) ) ( not ( = ?auto_589734 ?auto_589744 ) ) ( not ( = ?auto_589734 ?auto_589745 ) ) ( not ( = ?auto_589734 ?auto_589746 ) ) ( not ( = ?auto_589734 ?auto_589747 ) ) ( not ( = ?auto_589734 ?auto_589748 ) ) ( not ( = ?auto_589734 ?auto_589749 ) ) ( not ( = ?auto_589735 ?auto_589736 ) ) ( not ( = ?auto_589735 ?auto_589737 ) ) ( not ( = ?auto_589735 ?auto_589738 ) ) ( not ( = ?auto_589735 ?auto_589739 ) ) ( not ( = ?auto_589735 ?auto_589740 ) ) ( not ( = ?auto_589735 ?auto_589741 ) ) ( not ( = ?auto_589735 ?auto_589742 ) ) ( not ( = ?auto_589735 ?auto_589743 ) ) ( not ( = ?auto_589735 ?auto_589744 ) ) ( not ( = ?auto_589735 ?auto_589745 ) ) ( not ( = ?auto_589735 ?auto_589746 ) ) ( not ( = ?auto_589735 ?auto_589747 ) ) ( not ( = ?auto_589735 ?auto_589748 ) ) ( not ( = ?auto_589735 ?auto_589749 ) ) ( not ( = ?auto_589736 ?auto_589737 ) ) ( not ( = ?auto_589736 ?auto_589738 ) ) ( not ( = ?auto_589736 ?auto_589739 ) ) ( not ( = ?auto_589736 ?auto_589740 ) ) ( not ( = ?auto_589736 ?auto_589741 ) ) ( not ( = ?auto_589736 ?auto_589742 ) ) ( not ( = ?auto_589736 ?auto_589743 ) ) ( not ( = ?auto_589736 ?auto_589744 ) ) ( not ( = ?auto_589736 ?auto_589745 ) ) ( not ( = ?auto_589736 ?auto_589746 ) ) ( not ( = ?auto_589736 ?auto_589747 ) ) ( not ( = ?auto_589736 ?auto_589748 ) ) ( not ( = ?auto_589736 ?auto_589749 ) ) ( not ( = ?auto_589737 ?auto_589738 ) ) ( not ( = ?auto_589737 ?auto_589739 ) ) ( not ( = ?auto_589737 ?auto_589740 ) ) ( not ( = ?auto_589737 ?auto_589741 ) ) ( not ( = ?auto_589737 ?auto_589742 ) ) ( not ( = ?auto_589737 ?auto_589743 ) ) ( not ( = ?auto_589737 ?auto_589744 ) ) ( not ( = ?auto_589737 ?auto_589745 ) ) ( not ( = ?auto_589737 ?auto_589746 ) ) ( not ( = ?auto_589737 ?auto_589747 ) ) ( not ( = ?auto_589737 ?auto_589748 ) ) ( not ( = ?auto_589737 ?auto_589749 ) ) ( not ( = ?auto_589738 ?auto_589739 ) ) ( not ( = ?auto_589738 ?auto_589740 ) ) ( not ( = ?auto_589738 ?auto_589741 ) ) ( not ( = ?auto_589738 ?auto_589742 ) ) ( not ( = ?auto_589738 ?auto_589743 ) ) ( not ( = ?auto_589738 ?auto_589744 ) ) ( not ( = ?auto_589738 ?auto_589745 ) ) ( not ( = ?auto_589738 ?auto_589746 ) ) ( not ( = ?auto_589738 ?auto_589747 ) ) ( not ( = ?auto_589738 ?auto_589748 ) ) ( not ( = ?auto_589738 ?auto_589749 ) ) ( not ( = ?auto_589739 ?auto_589740 ) ) ( not ( = ?auto_589739 ?auto_589741 ) ) ( not ( = ?auto_589739 ?auto_589742 ) ) ( not ( = ?auto_589739 ?auto_589743 ) ) ( not ( = ?auto_589739 ?auto_589744 ) ) ( not ( = ?auto_589739 ?auto_589745 ) ) ( not ( = ?auto_589739 ?auto_589746 ) ) ( not ( = ?auto_589739 ?auto_589747 ) ) ( not ( = ?auto_589739 ?auto_589748 ) ) ( not ( = ?auto_589739 ?auto_589749 ) ) ( not ( = ?auto_589740 ?auto_589741 ) ) ( not ( = ?auto_589740 ?auto_589742 ) ) ( not ( = ?auto_589740 ?auto_589743 ) ) ( not ( = ?auto_589740 ?auto_589744 ) ) ( not ( = ?auto_589740 ?auto_589745 ) ) ( not ( = ?auto_589740 ?auto_589746 ) ) ( not ( = ?auto_589740 ?auto_589747 ) ) ( not ( = ?auto_589740 ?auto_589748 ) ) ( not ( = ?auto_589740 ?auto_589749 ) ) ( not ( = ?auto_589741 ?auto_589742 ) ) ( not ( = ?auto_589741 ?auto_589743 ) ) ( not ( = ?auto_589741 ?auto_589744 ) ) ( not ( = ?auto_589741 ?auto_589745 ) ) ( not ( = ?auto_589741 ?auto_589746 ) ) ( not ( = ?auto_589741 ?auto_589747 ) ) ( not ( = ?auto_589741 ?auto_589748 ) ) ( not ( = ?auto_589741 ?auto_589749 ) ) ( not ( = ?auto_589742 ?auto_589743 ) ) ( not ( = ?auto_589742 ?auto_589744 ) ) ( not ( = ?auto_589742 ?auto_589745 ) ) ( not ( = ?auto_589742 ?auto_589746 ) ) ( not ( = ?auto_589742 ?auto_589747 ) ) ( not ( = ?auto_589742 ?auto_589748 ) ) ( not ( = ?auto_589742 ?auto_589749 ) ) ( not ( = ?auto_589743 ?auto_589744 ) ) ( not ( = ?auto_589743 ?auto_589745 ) ) ( not ( = ?auto_589743 ?auto_589746 ) ) ( not ( = ?auto_589743 ?auto_589747 ) ) ( not ( = ?auto_589743 ?auto_589748 ) ) ( not ( = ?auto_589743 ?auto_589749 ) ) ( not ( = ?auto_589744 ?auto_589745 ) ) ( not ( = ?auto_589744 ?auto_589746 ) ) ( not ( = ?auto_589744 ?auto_589747 ) ) ( not ( = ?auto_589744 ?auto_589748 ) ) ( not ( = ?auto_589744 ?auto_589749 ) ) ( not ( = ?auto_589745 ?auto_589746 ) ) ( not ( = ?auto_589745 ?auto_589747 ) ) ( not ( = ?auto_589745 ?auto_589748 ) ) ( not ( = ?auto_589745 ?auto_589749 ) ) ( not ( = ?auto_589746 ?auto_589747 ) ) ( not ( = ?auto_589746 ?auto_589748 ) ) ( not ( = ?auto_589746 ?auto_589749 ) ) ( not ( = ?auto_589747 ?auto_589748 ) ) ( not ( = ?auto_589747 ?auto_589749 ) ) ( not ( = ?auto_589748 ?auto_589749 ) ) ( ON ?auto_589747 ?auto_589748 ) ( ON ?auto_589746 ?auto_589747 ) ( ON ?auto_589745 ?auto_589746 ) ( ON ?auto_589744 ?auto_589745 ) ( ON ?auto_589743 ?auto_589744 ) ( CLEAR ?auto_589741 ) ( ON ?auto_589742 ?auto_589743 ) ( CLEAR ?auto_589742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_589733 ?auto_589734 ?auto_589735 ?auto_589736 ?auto_589737 ?auto_589738 ?auto_589739 ?auto_589740 ?auto_589741 ?auto_589742 )
      ( MAKE-16PILE ?auto_589733 ?auto_589734 ?auto_589735 ?auto_589736 ?auto_589737 ?auto_589738 ?auto_589739 ?auto_589740 ?auto_589741 ?auto_589742 ?auto_589743 ?auto_589744 ?auto_589745 ?auto_589746 ?auto_589747 ?auto_589748 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589766 - BLOCK
      ?auto_589767 - BLOCK
      ?auto_589768 - BLOCK
      ?auto_589769 - BLOCK
      ?auto_589770 - BLOCK
      ?auto_589771 - BLOCK
      ?auto_589772 - BLOCK
      ?auto_589773 - BLOCK
      ?auto_589774 - BLOCK
      ?auto_589775 - BLOCK
      ?auto_589776 - BLOCK
      ?auto_589777 - BLOCK
      ?auto_589778 - BLOCK
      ?auto_589779 - BLOCK
      ?auto_589780 - BLOCK
      ?auto_589781 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_589781 ) ( ON-TABLE ?auto_589766 ) ( ON ?auto_589767 ?auto_589766 ) ( ON ?auto_589768 ?auto_589767 ) ( ON ?auto_589769 ?auto_589768 ) ( ON ?auto_589770 ?auto_589769 ) ( ON ?auto_589771 ?auto_589770 ) ( ON ?auto_589772 ?auto_589771 ) ( ON ?auto_589773 ?auto_589772 ) ( ON ?auto_589774 ?auto_589773 ) ( not ( = ?auto_589766 ?auto_589767 ) ) ( not ( = ?auto_589766 ?auto_589768 ) ) ( not ( = ?auto_589766 ?auto_589769 ) ) ( not ( = ?auto_589766 ?auto_589770 ) ) ( not ( = ?auto_589766 ?auto_589771 ) ) ( not ( = ?auto_589766 ?auto_589772 ) ) ( not ( = ?auto_589766 ?auto_589773 ) ) ( not ( = ?auto_589766 ?auto_589774 ) ) ( not ( = ?auto_589766 ?auto_589775 ) ) ( not ( = ?auto_589766 ?auto_589776 ) ) ( not ( = ?auto_589766 ?auto_589777 ) ) ( not ( = ?auto_589766 ?auto_589778 ) ) ( not ( = ?auto_589766 ?auto_589779 ) ) ( not ( = ?auto_589766 ?auto_589780 ) ) ( not ( = ?auto_589766 ?auto_589781 ) ) ( not ( = ?auto_589767 ?auto_589768 ) ) ( not ( = ?auto_589767 ?auto_589769 ) ) ( not ( = ?auto_589767 ?auto_589770 ) ) ( not ( = ?auto_589767 ?auto_589771 ) ) ( not ( = ?auto_589767 ?auto_589772 ) ) ( not ( = ?auto_589767 ?auto_589773 ) ) ( not ( = ?auto_589767 ?auto_589774 ) ) ( not ( = ?auto_589767 ?auto_589775 ) ) ( not ( = ?auto_589767 ?auto_589776 ) ) ( not ( = ?auto_589767 ?auto_589777 ) ) ( not ( = ?auto_589767 ?auto_589778 ) ) ( not ( = ?auto_589767 ?auto_589779 ) ) ( not ( = ?auto_589767 ?auto_589780 ) ) ( not ( = ?auto_589767 ?auto_589781 ) ) ( not ( = ?auto_589768 ?auto_589769 ) ) ( not ( = ?auto_589768 ?auto_589770 ) ) ( not ( = ?auto_589768 ?auto_589771 ) ) ( not ( = ?auto_589768 ?auto_589772 ) ) ( not ( = ?auto_589768 ?auto_589773 ) ) ( not ( = ?auto_589768 ?auto_589774 ) ) ( not ( = ?auto_589768 ?auto_589775 ) ) ( not ( = ?auto_589768 ?auto_589776 ) ) ( not ( = ?auto_589768 ?auto_589777 ) ) ( not ( = ?auto_589768 ?auto_589778 ) ) ( not ( = ?auto_589768 ?auto_589779 ) ) ( not ( = ?auto_589768 ?auto_589780 ) ) ( not ( = ?auto_589768 ?auto_589781 ) ) ( not ( = ?auto_589769 ?auto_589770 ) ) ( not ( = ?auto_589769 ?auto_589771 ) ) ( not ( = ?auto_589769 ?auto_589772 ) ) ( not ( = ?auto_589769 ?auto_589773 ) ) ( not ( = ?auto_589769 ?auto_589774 ) ) ( not ( = ?auto_589769 ?auto_589775 ) ) ( not ( = ?auto_589769 ?auto_589776 ) ) ( not ( = ?auto_589769 ?auto_589777 ) ) ( not ( = ?auto_589769 ?auto_589778 ) ) ( not ( = ?auto_589769 ?auto_589779 ) ) ( not ( = ?auto_589769 ?auto_589780 ) ) ( not ( = ?auto_589769 ?auto_589781 ) ) ( not ( = ?auto_589770 ?auto_589771 ) ) ( not ( = ?auto_589770 ?auto_589772 ) ) ( not ( = ?auto_589770 ?auto_589773 ) ) ( not ( = ?auto_589770 ?auto_589774 ) ) ( not ( = ?auto_589770 ?auto_589775 ) ) ( not ( = ?auto_589770 ?auto_589776 ) ) ( not ( = ?auto_589770 ?auto_589777 ) ) ( not ( = ?auto_589770 ?auto_589778 ) ) ( not ( = ?auto_589770 ?auto_589779 ) ) ( not ( = ?auto_589770 ?auto_589780 ) ) ( not ( = ?auto_589770 ?auto_589781 ) ) ( not ( = ?auto_589771 ?auto_589772 ) ) ( not ( = ?auto_589771 ?auto_589773 ) ) ( not ( = ?auto_589771 ?auto_589774 ) ) ( not ( = ?auto_589771 ?auto_589775 ) ) ( not ( = ?auto_589771 ?auto_589776 ) ) ( not ( = ?auto_589771 ?auto_589777 ) ) ( not ( = ?auto_589771 ?auto_589778 ) ) ( not ( = ?auto_589771 ?auto_589779 ) ) ( not ( = ?auto_589771 ?auto_589780 ) ) ( not ( = ?auto_589771 ?auto_589781 ) ) ( not ( = ?auto_589772 ?auto_589773 ) ) ( not ( = ?auto_589772 ?auto_589774 ) ) ( not ( = ?auto_589772 ?auto_589775 ) ) ( not ( = ?auto_589772 ?auto_589776 ) ) ( not ( = ?auto_589772 ?auto_589777 ) ) ( not ( = ?auto_589772 ?auto_589778 ) ) ( not ( = ?auto_589772 ?auto_589779 ) ) ( not ( = ?auto_589772 ?auto_589780 ) ) ( not ( = ?auto_589772 ?auto_589781 ) ) ( not ( = ?auto_589773 ?auto_589774 ) ) ( not ( = ?auto_589773 ?auto_589775 ) ) ( not ( = ?auto_589773 ?auto_589776 ) ) ( not ( = ?auto_589773 ?auto_589777 ) ) ( not ( = ?auto_589773 ?auto_589778 ) ) ( not ( = ?auto_589773 ?auto_589779 ) ) ( not ( = ?auto_589773 ?auto_589780 ) ) ( not ( = ?auto_589773 ?auto_589781 ) ) ( not ( = ?auto_589774 ?auto_589775 ) ) ( not ( = ?auto_589774 ?auto_589776 ) ) ( not ( = ?auto_589774 ?auto_589777 ) ) ( not ( = ?auto_589774 ?auto_589778 ) ) ( not ( = ?auto_589774 ?auto_589779 ) ) ( not ( = ?auto_589774 ?auto_589780 ) ) ( not ( = ?auto_589774 ?auto_589781 ) ) ( not ( = ?auto_589775 ?auto_589776 ) ) ( not ( = ?auto_589775 ?auto_589777 ) ) ( not ( = ?auto_589775 ?auto_589778 ) ) ( not ( = ?auto_589775 ?auto_589779 ) ) ( not ( = ?auto_589775 ?auto_589780 ) ) ( not ( = ?auto_589775 ?auto_589781 ) ) ( not ( = ?auto_589776 ?auto_589777 ) ) ( not ( = ?auto_589776 ?auto_589778 ) ) ( not ( = ?auto_589776 ?auto_589779 ) ) ( not ( = ?auto_589776 ?auto_589780 ) ) ( not ( = ?auto_589776 ?auto_589781 ) ) ( not ( = ?auto_589777 ?auto_589778 ) ) ( not ( = ?auto_589777 ?auto_589779 ) ) ( not ( = ?auto_589777 ?auto_589780 ) ) ( not ( = ?auto_589777 ?auto_589781 ) ) ( not ( = ?auto_589778 ?auto_589779 ) ) ( not ( = ?auto_589778 ?auto_589780 ) ) ( not ( = ?auto_589778 ?auto_589781 ) ) ( not ( = ?auto_589779 ?auto_589780 ) ) ( not ( = ?auto_589779 ?auto_589781 ) ) ( not ( = ?auto_589780 ?auto_589781 ) ) ( ON ?auto_589780 ?auto_589781 ) ( ON ?auto_589779 ?auto_589780 ) ( ON ?auto_589778 ?auto_589779 ) ( ON ?auto_589777 ?auto_589778 ) ( ON ?auto_589776 ?auto_589777 ) ( CLEAR ?auto_589774 ) ( ON ?auto_589775 ?auto_589776 ) ( CLEAR ?auto_589775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_589766 ?auto_589767 ?auto_589768 ?auto_589769 ?auto_589770 ?auto_589771 ?auto_589772 ?auto_589773 ?auto_589774 ?auto_589775 )
      ( MAKE-16PILE ?auto_589766 ?auto_589767 ?auto_589768 ?auto_589769 ?auto_589770 ?auto_589771 ?auto_589772 ?auto_589773 ?auto_589774 ?auto_589775 ?auto_589776 ?auto_589777 ?auto_589778 ?auto_589779 ?auto_589780 ?auto_589781 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589798 - BLOCK
      ?auto_589799 - BLOCK
      ?auto_589800 - BLOCK
      ?auto_589801 - BLOCK
      ?auto_589802 - BLOCK
      ?auto_589803 - BLOCK
      ?auto_589804 - BLOCK
      ?auto_589805 - BLOCK
      ?auto_589806 - BLOCK
      ?auto_589807 - BLOCK
      ?auto_589808 - BLOCK
      ?auto_589809 - BLOCK
      ?auto_589810 - BLOCK
      ?auto_589811 - BLOCK
      ?auto_589812 - BLOCK
      ?auto_589813 - BLOCK
    )
    :vars
    (
      ?auto_589814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589813 ?auto_589814 ) ( ON-TABLE ?auto_589798 ) ( ON ?auto_589799 ?auto_589798 ) ( ON ?auto_589800 ?auto_589799 ) ( ON ?auto_589801 ?auto_589800 ) ( ON ?auto_589802 ?auto_589801 ) ( ON ?auto_589803 ?auto_589802 ) ( ON ?auto_589804 ?auto_589803 ) ( ON ?auto_589805 ?auto_589804 ) ( not ( = ?auto_589798 ?auto_589799 ) ) ( not ( = ?auto_589798 ?auto_589800 ) ) ( not ( = ?auto_589798 ?auto_589801 ) ) ( not ( = ?auto_589798 ?auto_589802 ) ) ( not ( = ?auto_589798 ?auto_589803 ) ) ( not ( = ?auto_589798 ?auto_589804 ) ) ( not ( = ?auto_589798 ?auto_589805 ) ) ( not ( = ?auto_589798 ?auto_589806 ) ) ( not ( = ?auto_589798 ?auto_589807 ) ) ( not ( = ?auto_589798 ?auto_589808 ) ) ( not ( = ?auto_589798 ?auto_589809 ) ) ( not ( = ?auto_589798 ?auto_589810 ) ) ( not ( = ?auto_589798 ?auto_589811 ) ) ( not ( = ?auto_589798 ?auto_589812 ) ) ( not ( = ?auto_589798 ?auto_589813 ) ) ( not ( = ?auto_589798 ?auto_589814 ) ) ( not ( = ?auto_589799 ?auto_589800 ) ) ( not ( = ?auto_589799 ?auto_589801 ) ) ( not ( = ?auto_589799 ?auto_589802 ) ) ( not ( = ?auto_589799 ?auto_589803 ) ) ( not ( = ?auto_589799 ?auto_589804 ) ) ( not ( = ?auto_589799 ?auto_589805 ) ) ( not ( = ?auto_589799 ?auto_589806 ) ) ( not ( = ?auto_589799 ?auto_589807 ) ) ( not ( = ?auto_589799 ?auto_589808 ) ) ( not ( = ?auto_589799 ?auto_589809 ) ) ( not ( = ?auto_589799 ?auto_589810 ) ) ( not ( = ?auto_589799 ?auto_589811 ) ) ( not ( = ?auto_589799 ?auto_589812 ) ) ( not ( = ?auto_589799 ?auto_589813 ) ) ( not ( = ?auto_589799 ?auto_589814 ) ) ( not ( = ?auto_589800 ?auto_589801 ) ) ( not ( = ?auto_589800 ?auto_589802 ) ) ( not ( = ?auto_589800 ?auto_589803 ) ) ( not ( = ?auto_589800 ?auto_589804 ) ) ( not ( = ?auto_589800 ?auto_589805 ) ) ( not ( = ?auto_589800 ?auto_589806 ) ) ( not ( = ?auto_589800 ?auto_589807 ) ) ( not ( = ?auto_589800 ?auto_589808 ) ) ( not ( = ?auto_589800 ?auto_589809 ) ) ( not ( = ?auto_589800 ?auto_589810 ) ) ( not ( = ?auto_589800 ?auto_589811 ) ) ( not ( = ?auto_589800 ?auto_589812 ) ) ( not ( = ?auto_589800 ?auto_589813 ) ) ( not ( = ?auto_589800 ?auto_589814 ) ) ( not ( = ?auto_589801 ?auto_589802 ) ) ( not ( = ?auto_589801 ?auto_589803 ) ) ( not ( = ?auto_589801 ?auto_589804 ) ) ( not ( = ?auto_589801 ?auto_589805 ) ) ( not ( = ?auto_589801 ?auto_589806 ) ) ( not ( = ?auto_589801 ?auto_589807 ) ) ( not ( = ?auto_589801 ?auto_589808 ) ) ( not ( = ?auto_589801 ?auto_589809 ) ) ( not ( = ?auto_589801 ?auto_589810 ) ) ( not ( = ?auto_589801 ?auto_589811 ) ) ( not ( = ?auto_589801 ?auto_589812 ) ) ( not ( = ?auto_589801 ?auto_589813 ) ) ( not ( = ?auto_589801 ?auto_589814 ) ) ( not ( = ?auto_589802 ?auto_589803 ) ) ( not ( = ?auto_589802 ?auto_589804 ) ) ( not ( = ?auto_589802 ?auto_589805 ) ) ( not ( = ?auto_589802 ?auto_589806 ) ) ( not ( = ?auto_589802 ?auto_589807 ) ) ( not ( = ?auto_589802 ?auto_589808 ) ) ( not ( = ?auto_589802 ?auto_589809 ) ) ( not ( = ?auto_589802 ?auto_589810 ) ) ( not ( = ?auto_589802 ?auto_589811 ) ) ( not ( = ?auto_589802 ?auto_589812 ) ) ( not ( = ?auto_589802 ?auto_589813 ) ) ( not ( = ?auto_589802 ?auto_589814 ) ) ( not ( = ?auto_589803 ?auto_589804 ) ) ( not ( = ?auto_589803 ?auto_589805 ) ) ( not ( = ?auto_589803 ?auto_589806 ) ) ( not ( = ?auto_589803 ?auto_589807 ) ) ( not ( = ?auto_589803 ?auto_589808 ) ) ( not ( = ?auto_589803 ?auto_589809 ) ) ( not ( = ?auto_589803 ?auto_589810 ) ) ( not ( = ?auto_589803 ?auto_589811 ) ) ( not ( = ?auto_589803 ?auto_589812 ) ) ( not ( = ?auto_589803 ?auto_589813 ) ) ( not ( = ?auto_589803 ?auto_589814 ) ) ( not ( = ?auto_589804 ?auto_589805 ) ) ( not ( = ?auto_589804 ?auto_589806 ) ) ( not ( = ?auto_589804 ?auto_589807 ) ) ( not ( = ?auto_589804 ?auto_589808 ) ) ( not ( = ?auto_589804 ?auto_589809 ) ) ( not ( = ?auto_589804 ?auto_589810 ) ) ( not ( = ?auto_589804 ?auto_589811 ) ) ( not ( = ?auto_589804 ?auto_589812 ) ) ( not ( = ?auto_589804 ?auto_589813 ) ) ( not ( = ?auto_589804 ?auto_589814 ) ) ( not ( = ?auto_589805 ?auto_589806 ) ) ( not ( = ?auto_589805 ?auto_589807 ) ) ( not ( = ?auto_589805 ?auto_589808 ) ) ( not ( = ?auto_589805 ?auto_589809 ) ) ( not ( = ?auto_589805 ?auto_589810 ) ) ( not ( = ?auto_589805 ?auto_589811 ) ) ( not ( = ?auto_589805 ?auto_589812 ) ) ( not ( = ?auto_589805 ?auto_589813 ) ) ( not ( = ?auto_589805 ?auto_589814 ) ) ( not ( = ?auto_589806 ?auto_589807 ) ) ( not ( = ?auto_589806 ?auto_589808 ) ) ( not ( = ?auto_589806 ?auto_589809 ) ) ( not ( = ?auto_589806 ?auto_589810 ) ) ( not ( = ?auto_589806 ?auto_589811 ) ) ( not ( = ?auto_589806 ?auto_589812 ) ) ( not ( = ?auto_589806 ?auto_589813 ) ) ( not ( = ?auto_589806 ?auto_589814 ) ) ( not ( = ?auto_589807 ?auto_589808 ) ) ( not ( = ?auto_589807 ?auto_589809 ) ) ( not ( = ?auto_589807 ?auto_589810 ) ) ( not ( = ?auto_589807 ?auto_589811 ) ) ( not ( = ?auto_589807 ?auto_589812 ) ) ( not ( = ?auto_589807 ?auto_589813 ) ) ( not ( = ?auto_589807 ?auto_589814 ) ) ( not ( = ?auto_589808 ?auto_589809 ) ) ( not ( = ?auto_589808 ?auto_589810 ) ) ( not ( = ?auto_589808 ?auto_589811 ) ) ( not ( = ?auto_589808 ?auto_589812 ) ) ( not ( = ?auto_589808 ?auto_589813 ) ) ( not ( = ?auto_589808 ?auto_589814 ) ) ( not ( = ?auto_589809 ?auto_589810 ) ) ( not ( = ?auto_589809 ?auto_589811 ) ) ( not ( = ?auto_589809 ?auto_589812 ) ) ( not ( = ?auto_589809 ?auto_589813 ) ) ( not ( = ?auto_589809 ?auto_589814 ) ) ( not ( = ?auto_589810 ?auto_589811 ) ) ( not ( = ?auto_589810 ?auto_589812 ) ) ( not ( = ?auto_589810 ?auto_589813 ) ) ( not ( = ?auto_589810 ?auto_589814 ) ) ( not ( = ?auto_589811 ?auto_589812 ) ) ( not ( = ?auto_589811 ?auto_589813 ) ) ( not ( = ?auto_589811 ?auto_589814 ) ) ( not ( = ?auto_589812 ?auto_589813 ) ) ( not ( = ?auto_589812 ?auto_589814 ) ) ( not ( = ?auto_589813 ?auto_589814 ) ) ( ON ?auto_589812 ?auto_589813 ) ( ON ?auto_589811 ?auto_589812 ) ( ON ?auto_589810 ?auto_589811 ) ( ON ?auto_589809 ?auto_589810 ) ( ON ?auto_589808 ?auto_589809 ) ( ON ?auto_589807 ?auto_589808 ) ( CLEAR ?auto_589805 ) ( ON ?auto_589806 ?auto_589807 ) ( CLEAR ?auto_589806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_589798 ?auto_589799 ?auto_589800 ?auto_589801 ?auto_589802 ?auto_589803 ?auto_589804 ?auto_589805 ?auto_589806 )
      ( MAKE-16PILE ?auto_589798 ?auto_589799 ?auto_589800 ?auto_589801 ?auto_589802 ?auto_589803 ?auto_589804 ?auto_589805 ?auto_589806 ?auto_589807 ?auto_589808 ?auto_589809 ?auto_589810 ?auto_589811 ?auto_589812 ?auto_589813 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589831 - BLOCK
      ?auto_589832 - BLOCK
      ?auto_589833 - BLOCK
      ?auto_589834 - BLOCK
      ?auto_589835 - BLOCK
      ?auto_589836 - BLOCK
      ?auto_589837 - BLOCK
      ?auto_589838 - BLOCK
      ?auto_589839 - BLOCK
      ?auto_589840 - BLOCK
      ?auto_589841 - BLOCK
      ?auto_589842 - BLOCK
      ?auto_589843 - BLOCK
      ?auto_589844 - BLOCK
      ?auto_589845 - BLOCK
      ?auto_589846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_589846 ) ( ON-TABLE ?auto_589831 ) ( ON ?auto_589832 ?auto_589831 ) ( ON ?auto_589833 ?auto_589832 ) ( ON ?auto_589834 ?auto_589833 ) ( ON ?auto_589835 ?auto_589834 ) ( ON ?auto_589836 ?auto_589835 ) ( ON ?auto_589837 ?auto_589836 ) ( ON ?auto_589838 ?auto_589837 ) ( not ( = ?auto_589831 ?auto_589832 ) ) ( not ( = ?auto_589831 ?auto_589833 ) ) ( not ( = ?auto_589831 ?auto_589834 ) ) ( not ( = ?auto_589831 ?auto_589835 ) ) ( not ( = ?auto_589831 ?auto_589836 ) ) ( not ( = ?auto_589831 ?auto_589837 ) ) ( not ( = ?auto_589831 ?auto_589838 ) ) ( not ( = ?auto_589831 ?auto_589839 ) ) ( not ( = ?auto_589831 ?auto_589840 ) ) ( not ( = ?auto_589831 ?auto_589841 ) ) ( not ( = ?auto_589831 ?auto_589842 ) ) ( not ( = ?auto_589831 ?auto_589843 ) ) ( not ( = ?auto_589831 ?auto_589844 ) ) ( not ( = ?auto_589831 ?auto_589845 ) ) ( not ( = ?auto_589831 ?auto_589846 ) ) ( not ( = ?auto_589832 ?auto_589833 ) ) ( not ( = ?auto_589832 ?auto_589834 ) ) ( not ( = ?auto_589832 ?auto_589835 ) ) ( not ( = ?auto_589832 ?auto_589836 ) ) ( not ( = ?auto_589832 ?auto_589837 ) ) ( not ( = ?auto_589832 ?auto_589838 ) ) ( not ( = ?auto_589832 ?auto_589839 ) ) ( not ( = ?auto_589832 ?auto_589840 ) ) ( not ( = ?auto_589832 ?auto_589841 ) ) ( not ( = ?auto_589832 ?auto_589842 ) ) ( not ( = ?auto_589832 ?auto_589843 ) ) ( not ( = ?auto_589832 ?auto_589844 ) ) ( not ( = ?auto_589832 ?auto_589845 ) ) ( not ( = ?auto_589832 ?auto_589846 ) ) ( not ( = ?auto_589833 ?auto_589834 ) ) ( not ( = ?auto_589833 ?auto_589835 ) ) ( not ( = ?auto_589833 ?auto_589836 ) ) ( not ( = ?auto_589833 ?auto_589837 ) ) ( not ( = ?auto_589833 ?auto_589838 ) ) ( not ( = ?auto_589833 ?auto_589839 ) ) ( not ( = ?auto_589833 ?auto_589840 ) ) ( not ( = ?auto_589833 ?auto_589841 ) ) ( not ( = ?auto_589833 ?auto_589842 ) ) ( not ( = ?auto_589833 ?auto_589843 ) ) ( not ( = ?auto_589833 ?auto_589844 ) ) ( not ( = ?auto_589833 ?auto_589845 ) ) ( not ( = ?auto_589833 ?auto_589846 ) ) ( not ( = ?auto_589834 ?auto_589835 ) ) ( not ( = ?auto_589834 ?auto_589836 ) ) ( not ( = ?auto_589834 ?auto_589837 ) ) ( not ( = ?auto_589834 ?auto_589838 ) ) ( not ( = ?auto_589834 ?auto_589839 ) ) ( not ( = ?auto_589834 ?auto_589840 ) ) ( not ( = ?auto_589834 ?auto_589841 ) ) ( not ( = ?auto_589834 ?auto_589842 ) ) ( not ( = ?auto_589834 ?auto_589843 ) ) ( not ( = ?auto_589834 ?auto_589844 ) ) ( not ( = ?auto_589834 ?auto_589845 ) ) ( not ( = ?auto_589834 ?auto_589846 ) ) ( not ( = ?auto_589835 ?auto_589836 ) ) ( not ( = ?auto_589835 ?auto_589837 ) ) ( not ( = ?auto_589835 ?auto_589838 ) ) ( not ( = ?auto_589835 ?auto_589839 ) ) ( not ( = ?auto_589835 ?auto_589840 ) ) ( not ( = ?auto_589835 ?auto_589841 ) ) ( not ( = ?auto_589835 ?auto_589842 ) ) ( not ( = ?auto_589835 ?auto_589843 ) ) ( not ( = ?auto_589835 ?auto_589844 ) ) ( not ( = ?auto_589835 ?auto_589845 ) ) ( not ( = ?auto_589835 ?auto_589846 ) ) ( not ( = ?auto_589836 ?auto_589837 ) ) ( not ( = ?auto_589836 ?auto_589838 ) ) ( not ( = ?auto_589836 ?auto_589839 ) ) ( not ( = ?auto_589836 ?auto_589840 ) ) ( not ( = ?auto_589836 ?auto_589841 ) ) ( not ( = ?auto_589836 ?auto_589842 ) ) ( not ( = ?auto_589836 ?auto_589843 ) ) ( not ( = ?auto_589836 ?auto_589844 ) ) ( not ( = ?auto_589836 ?auto_589845 ) ) ( not ( = ?auto_589836 ?auto_589846 ) ) ( not ( = ?auto_589837 ?auto_589838 ) ) ( not ( = ?auto_589837 ?auto_589839 ) ) ( not ( = ?auto_589837 ?auto_589840 ) ) ( not ( = ?auto_589837 ?auto_589841 ) ) ( not ( = ?auto_589837 ?auto_589842 ) ) ( not ( = ?auto_589837 ?auto_589843 ) ) ( not ( = ?auto_589837 ?auto_589844 ) ) ( not ( = ?auto_589837 ?auto_589845 ) ) ( not ( = ?auto_589837 ?auto_589846 ) ) ( not ( = ?auto_589838 ?auto_589839 ) ) ( not ( = ?auto_589838 ?auto_589840 ) ) ( not ( = ?auto_589838 ?auto_589841 ) ) ( not ( = ?auto_589838 ?auto_589842 ) ) ( not ( = ?auto_589838 ?auto_589843 ) ) ( not ( = ?auto_589838 ?auto_589844 ) ) ( not ( = ?auto_589838 ?auto_589845 ) ) ( not ( = ?auto_589838 ?auto_589846 ) ) ( not ( = ?auto_589839 ?auto_589840 ) ) ( not ( = ?auto_589839 ?auto_589841 ) ) ( not ( = ?auto_589839 ?auto_589842 ) ) ( not ( = ?auto_589839 ?auto_589843 ) ) ( not ( = ?auto_589839 ?auto_589844 ) ) ( not ( = ?auto_589839 ?auto_589845 ) ) ( not ( = ?auto_589839 ?auto_589846 ) ) ( not ( = ?auto_589840 ?auto_589841 ) ) ( not ( = ?auto_589840 ?auto_589842 ) ) ( not ( = ?auto_589840 ?auto_589843 ) ) ( not ( = ?auto_589840 ?auto_589844 ) ) ( not ( = ?auto_589840 ?auto_589845 ) ) ( not ( = ?auto_589840 ?auto_589846 ) ) ( not ( = ?auto_589841 ?auto_589842 ) ) ( not ( = ?auto_589841 ?auto_589843 ) ) ( not ( = ?auto_589841 ?auto_589844 ) ) ( not ( = ?auto_589841 ?auto_589845 ) ) ( not ( = ?auto_589841 ?auto_589846 ) ) ( not ( = ?auto_589842 ?auto_589843 ) ) ( not ( = ?auto_589842 ?auto_589844 ) ) ( not ( = ?auto_589842 ?auto_589845 ) ) ( not ( = ?auto_589842 ?auto_589846 ) ) ( not ( = ?auto_589843 ?auto_589844 ) ) ( not ( = ?auto_589843 ?auto_589845 ) ) ( not ( = ?auto_589843 ?auto_589846 ) ) ( not ( = ?auto_589844 ?auto_589845 ) ) ( not ( = ?auto_589844 ?auto_589846 ) ) ( not ( = ?auto_589845 ?auto_589846 ) ) ( ON ?auto_589845 ?auto_589846 ) ( ON ?auto_589844 ?auto_589845 ) ( ON ?auto_589843 ?auto_589844 ) ( ON ?auto_589842 ?auto_589843 ) ( ON ?auto_589841 ?auto_589842 ) ( ON ?auto_589840 ?auto_589841 ) ( CLEAR ?auto_589838 ) ( ON ?auto_589839 ?auto_589840 ) ( CLEAR ?auto_589839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_589831 ?auto_589832 ?auto_589833 ?auto_589834 ?auto_589835 ?auto_589836 ?auto_589837 ?auto_589838 ?auto_589839 )
      ( MAKE-16PILE ?auto_589831 ?auto_589832 ?auto_589833 ?auto_589834 ?auto_589835 ?auto_589836 ?auto_589837 ?auto_589838 ?auto_589839 ?auto_589840 ?auto_589841 ?auto_589842 ?auto_589843 ?auto_589844 ?auto_589845 ?auto_589846 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589863 - BLOCK
      ?auto_589864 - BLOCK
      ?auto_589865 - BLOCK
      ?auto_589866 - BLOCK
      ?auto_589867 - BLOCK
      ?auto_589868 - BLOCK
      ?auto_589869 - BLOCK
      ?auto_589870 - BLOCK
      ?auto_589871 - BLOCK
      ?auto_589872 - BLOCK
      ?auto_589873 - BLOCK
      ?auto_589874 - BLOCK
      ?auto_589875 - BLOCK
      ?auto_589876 - BLOCK
      ?auto_589877 - BLOCK
      ?auto_589878 - BLOCK
    )
    :vars
    (
      ?auto_589879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589878 ?auto_589879 ) ( ON-TABLE ?auto_589863 ) ( ON ?auto_589864 ?auto_589863 ) ( ON ?auto_589865 ?auto_589864 ) ( ON ?auto_589866 ?auto_589865 ) ( ON ?auto_589867 ?auto_589866 ) ( ON ?auto_589868 ?auto_589867 ) ( ON ?auto_589869 ?auto_589868 ) ( not ( = ?auto_589863 ?auto_589864 ) ) ( not ( = ?auto_589863 ?auto_589865 ) ) ( not ( = ?auto_589863 ?auto_589866 ) ) ( not ( = ?auto_589863 ?auto_589867 ) ) ( not ( = ?auto_589863 ?auto_589868 ) ) ( not ( = ?auto_589863 ?auto_589869 ) ) ( not ( = ?auto_589863 ?auto_589870 ) ) ( not ( = ?auto_589863 ?auto_589871 ) ) ( not ( = ?auto_589863 ?auto_589872 ) ) ( not ( = ?auto_589863 ?auto_589873 ) ) ( not ( = ?auto_589863 ?auto_589874 ) ) ( not ( = ?auto_589863 ?auto_589875 ) ) ( not ( = ?auto_589863 ?auto_589876 ) ) ( not ( = ?auto_589863 ?auto_589877 ) ) ( not ( = ?auto_589863 ?auto_589878 ) ) ( not ( = ?auto_589863 ?auto_589879 ) ) ( not ( = ?auto_589864 ?auto_589865 ) ) ( not ( = ?auto_589864 ?auto_589866 ) ) ( not ( = ?auto_589864 ?auto_589867 ) ) ( not ( = ?auto_589864 ?auto_589868 ) ) ( not ( = ?auto_589864 ?auto_589869 ) ) ( not ( = ?auto_589864 ?auto_589870 ) ) ( not ( = ?auto_589864 ?auto_589871 ) ) ( not ( = ?auto_589864 ?auto_589872 ) ) ( not ( = ?auto_589864 ?auto_589873 ) ) ( not ( = ?auto_589864 ?auto_589874 ) ) ( not ( = ?auto_589864 ?auto_589875 ) ) ( not ( = ?auto_589864 ?auto_589876 ) ) ( not ( = ?auto_589864 ?auto_589877 ) ) ( not ( = ?auto_589864 ?auto_589878 ) ) ( not ( = ?auto_589864 ?auto_589879 ) ) ( not ( = ?auto_589865 ?auto_589866 ) ) ( not ( = ?auto_589865 ?auto_589867 ) ) ( not ( = ?auto_589865 ?auto_589868 ) ) ( not ( = ?auto_589865 ?auto_589869 ) ) ( not ( = ?auto_589865 ?auto_589870 ) ) ( not ( = ?auto_589865 ?auto_589871 ) ) ( not ( = ?auto_589865 ?auto_589872 ) ) ( not ( = ?auto_589865 ?auto_589873 ) ) ( not ( = ?auto_589865 ?auto_589874 ) ) ( not ( = ?auto_589865 ?auto_589875 ) ) ( not ( = ?auto_589865 ?auto_589876 ) ) ( not ( = ?auto_589865 ?auto_589877 ) ) ( not ( = ?auto_589865 ?auto_589878 ) ) ( not ( = ?auto_589865 ?auto_589879 ) ) ( not ( = ?auto_589866 ?auto_589867 ) ) ( not ( = ?auto_589866 ?auto_589868 ) ) ( not ( = ?auto_589866 ?auto_589869 ) ) ( not ( = ?auto_589866 ?auto_589870 ) ) ( not ( = ?auto_589866 ?auto_589871 ) ) ( not ( = ?auto_589866 ?auto_589872 ) ) ( not ( = ?auto_589866 ?auto_589873 ) ) ( not ( = ?auto_589866 ?auto_589874 ) ) ( not ( = ?auto_589866 ?auto_589875 ) ) ( not ( = ?auto_589866 ?auto_589876 ) ) ( not ( = ?auto_589866 ?auto_589877 ) ) ( not ( = ?auto_589866 ?auto_589878 ) ) ( not ( = ?auto_589866 ?auto_589879 ) ) ( not ( = ?auto_589867 ?auto_589868 ) ) ( not ( = ?auto_589867 ?auto_589869 ) ) ( not ( = ?auto_589867 ?auto_589870 ) ) ( not ( = ?auto_589867 ?auto_589871 ) ) ( not ( = ?auto_589867 ?auto_589872 ) ) ( not ( = ?auto_589867 ?auto_589873 ) ) ( not ( = ?auto_589867 ?auto_589874 ) ) ( not ( = ?auto_589867 ?auto_589875 ) ) ( not ( = ?auto_589867 ?auto_589876 ) ) ( not ( = ?auto_589867 ?auto_589877 ) ) ( not ( = ?auto_589867 ?auto_589878 ) ) ( not ( = ?auto_589867 ?auto_589879 ) ) ( not ( = ?auto_589868 ?auto_589869 ) ) ( not ( = ?auto_589868 ?auto_589870 ) ) ( not ( = ?auto_589868 ?auto_589871 ) ) ( not ( = ?auto_589868 ?auto_589872 ) ) ( not ( = ?auto_589868 ?auto_589873 ) ) ( not ( = ?auto_589868 ?auto_589874 ) ) ( not ( = ?auto_589868 ?auto_589875 ) ) ( not ( = ?auto_589868 ?auto_589876 ) ) ( not ( = ?auto_589868 ?auto_589877 ) ) ( not ( = ?auto_589868 ?auto_589878 ) ) ( not ( = ?auto_589868 ?auto_589879 ) ) ( not ( = ?auto_589869 ?auto_589870 ) ) ( not ( = ?auto_589869 ?auto_589871 ) ) ( not ( = ?auto_589869 ?auto_589872 ) ) ( not ( = ?auto_589869 ?auto_589873 ) ) ( not ( = ?auto_589869 ?auto_589874 ) ) ( not ( = ?auto_589869 ?auto_589875 ) ) ( not ( = ?auto_589869 ?auto_589876 ) ) ( not ( = ?auto_589869 ?auto_589877 ) ) ( not ( = ?auto_589869 ?auto_589878 ) ) ( not ( = ?auto_589869 ?auto_589879 ) ) ( not ( = ?auto_589870 ?auto_589871 ) ) ( not ( = ?auto_589870 ?auto_589872 ) ) ( not ( = ?auto_589870 ?auto_589873 ) ) ( not ( = ?auto_589870 ?auto_589874 ) ) ( not ( = ?auto_589870 ?auto_589875 ) ) ( not ( = ?auto_589870 ?auto_589876 ) ) ( not ( = ?auto_589870 ?auto_589877 ) ) ( not ( = ?auto_589870 ?auto_589878 ) ) ( not ( = ?auto_589870 ?auto_589879 ) ) ( not ( = ?auto_589871 ?auto_589872 ) ) ( not ( = ?auto_589871 ?auto_589873 ) ) ( not ( = ?auto_589871 ?auto_589874 ) ) ( not ( = ?auto_589871 ?auto_589875 ) ) ( not ( = ?auto_589871 ?auto_589876 ) ) ( not ( = ?auto_589871 ?auto_589877 ) ) ( not ( = ?auto_589871 ?auto_589878 ) ) ( not ( = ?auto_589871 ?auto_589879 ) ) ( not ( = ?auto_589872 ?auto_589873 ) ) ( not ( = ?auto_589872 ?auto_589874 ) ) ( not ( = ?auto_589872 ?auto_589875 ) ) ( not ( = ?auto_589872 ?auto_589876 ) ) ( not ( = ?auto_589872 ?auto_589877 ) ) ( not ( = ?auto_589872 ?auto_589878 ) ) ( not ( = ?auto_589872 ?auto_589879 ) ) ( not ( = ?auto_589873 ?auto_589874 ) ) ( not ( = ?auto_589873 ?auto_589875 ) ) ( not ( = ?auto_589873 ?auto_589876 ) ) ( not ( = ?auto_589873 ?auto_589877 ) ) ( not ( = ?auto_589873 ?auto_589878 ) ) ( not ( = ?auto_589873 ?auto_589879 ) ) ( not ( = ?auto_589874 ?auto_589875 ) ) ( not ( = ?auto_589874 ?auto_589876 ) ) ( not ( = ?auto_589874 ?auto_589877 ) ) ( not ( = ?auto_589874 ?auto_589878 ) ) ( not ( = ?auto_589874 ?auto_589879 ) ) ( not ( = ?auto_589875 ?auto_589876 ) ) ( not ( = ?auto_589875 ?auto_589877 ) ) ( not ( = ?auto_589875 ?auto_589878 ) ) ( not ( = ?auto_589875 ?auto_589879 ) ) ( not ( = ?auto_589876 ?auto_589877 ) ) ( not ( = ?auto_589876 ?auto_589878 ) ) ( not ( = ?auto_589876 ?auto_589879 ) ) ( not ( = ?auto_589877 ?auto_589878 ) ) ( not ( = ?auto_589877 ?auto_589879 ) ) ( not ( = ?auto_589878 ?auto_589879 ) ) ( ON ?auto_589877 ?auto_589878 ) ( ON ?auto_589876 ?auto_589877 ) ( ON ?auto_589875 ?auto_589876 ) ( ON ?auto_589874 ?auto_589875 ) ( ON ?auto_589873 ?auto_589874 ) ( ON ?auto_589872 ?auto_589873 ) ( ON ?auto_589871 ?auto_589872 ) ( CLEAR ?auto_589869 ) ( ON ?auto_589870 ?auto_589871 ) ( CLEAR ?auto_589870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_589863 ?auto_589864 ?auto_589865 ?auto_589866 ?auto_589867 ?auto_589868 ?auto_589869 ?auto_589870 )
      ( MAKE-16PILE ?auto_589863 ?auto_589864 ?auto_589865 ?auto_589866 ?auto_589867 ?auto_589868 ?auto_589869 ?auto_589870 ?auto_589871 ?auto_589872 ?auto_589873 ?auto_589874 ?auto_589875 ?auto_589876 ?auto_589877 ?auto_589878 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589896 - BLOCK
      ?auto_589897 - BLOCK
      ?auto_589898 - BLOCK
      ?auto_589899 - BLOCK
      ?auto_589900 - BLOCK
      ?auto_589901 - BLOCK
      ?auto_589902 - BLOCK
      ?auto_589903 - BLOCK
      ?auto_589904 - BLOCK
      ?auto_589905 - BLOCK
      ?auto_589906 - BLOCK
      ?auto_589907 - BLOCK
      ?auto_589908 - BLOCK
      ?auto_589909 - BLOCK
      ?auto_589910 - BLOCK
      ?auto_589911 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_589911 ) ( ON-TABLE ?auto_589896 ) ( ON ?auto_589897 ?auto_589896 ) ( ON ?auto_589898 ?auto_589897 ) ( ON ?auto_589899 ?auto_589898 ) ( ON ?auto_589900 ?auto_589899 ) ( ON ?auto_589901 ?auto_589900 ) ( ON ?auto_589902 ?auto_589901 ) ( not ( = ?auto_589896 ?auto_589897 ) ) ( not ( = ?auto_589896 ?auto_589898 ) ) ( not ( = ?auto_589896 ?auto_589899 ) ) ( not ( = ?auto_589896 ?auto_589900 ) ) ( not ( = ?auto_589896 ?auto_589901 ) ) ( not ( = ?auto_589896 ?auto_589902 ) ) ( not ( = ?auto_589896 ?auto_589903 ) ) ( not ( = ?auto_589896 ?auto_589904 ) ) ( not ( = ?auto_589896 ?auto_589905 ) ) ( not ( = ?auto_589896 ?auto_589906 ) ) ( not ( = ?auto_589896 ?auto_589907 ) ) ( not ( = ?auto_589896 ?auto_589908 ) ) ( not ( = ?auto_589896 ?auto_589909 ) ) ( not ( = ?auto_589896 ?auto_589910 ) ) ( not ( = ?auto_589896 ?auto_589911 ) ) ( not ( = ?auto_589897 ?auto_589898 ) ) ( not ( = ?auto_589897 ?auto_589899 ) ) ( not ( = ?auto_589897 ?auto_589900 ) ) ( not ( = ?auto_589897 ?auto_589901 ) ) ( not ( = ?auto_589897 ?auto_589902 ) ) ( not ( = ?auto_589897 ?auto_589903 ) ) ( not ( = ?auto_589897 ?auto_589904 ) ) ( not ( = ?auto_589897 ?auto_589905 ) ) ( not ( = ?auto_589897 ?auto_589906 ) ) ( not ( = ?auto_589897 ?auto_589907 ) ) ( not ( = ?auto_589897 ?auto_589908 ) ) ( not ( = ?auto_589897 ?auto_589909 ) ) ( not ( = ?auto_589897 ?auto_589910 ) ) ( not ( = ?auto_589897 ?auto_589911 ) ) ( not ( = ?auto_589898 ?auto_589899 ) ) ( not ( = ?auto_589898 ?auto_589900 ) ) ( not ( = ?auto_589898 ?auto_589901 ) ) ( not ( = ?auto_589898 ?auto_589902 ) ) ( not ( = ?auto_589898 ?auto_589903 ) ) ( not ( = ?auto_589898 ?auto_589904 ) ) ( not ( = ?auto_589898 ?auto_589905 ) ) ( not ( = ?auto_589898 ?auto_589906 ) ) ( not ( = ?auto_589898 ?auto_589907 ) ) ( not ( = ?auto_589898 ?auto_589908 ) ) ( not ( = ?auto_589898 ?auto_589909 ) ) ( not ( = ?auto_589898 ?auto_589910 ) ) ( not ( = ?auto_589898 ?auto_589911 ) ) ( not ( = ?auto_589899 ?auto_589900 ) ) ( not ( = ?auto_589899 ?auto_589901 ) ) ( not ( = ?auto_589899 ?auto_589902 ) ) ( not ( = ?auto_589899 ?auto_589903 ) ) ( not ( = ?auto_589899 ?auto_589904 ) ) ( not ( = ?auto_589899 ?auto_589905 ) ) ( not ( = ?auto_589899 ?auto_589906 ) ) ( not ( = ?auto_589899 ?auto_589907 ) ) ( not ( = ?auto_589899 ?auto_589908 ) ) ( not ( = ?auto_589899 ?auto_589909 ) ) ( not ( = ?auto_589899 ?auto_589910 ) ) ( not ( = ?auto_589899 ?auto_589911 ) ) ( not ( = ?auto_589900 ?auto_589901 ) ) ( not ( = ?auto_589900 ?auto_589902 ) ) ( not ( = ?auto_589900 ?auto_589903 ) ) ( not ( = ?auto_589900 ?auto_589904 ) ) ( not ( = ?auto_589900 ?auto_589905 ) ) ( not ( = ?auto_589900 ?auto_589906 ) ) ( not ( = ?auto_589900 ?auto_589907 ) ) ( not ( = ?auto_589900 ?auto_589908 ) ) ( not ( = ?auto_589900 ?auto_589909 ) ) ( not ( = ?auto_589900 ?auto_589910 ) ) ( not ( = ?auto_589900 ?auto_589911 ) ) ( not ( = ?auto_589901 ?auto_589902 ) ) ( not ( = ?auto_589901 ?auto_589903 ) ) ( not ( = ?auto_589901 ?auto_589904 ) ) ( not ( = ?auto_589901 ?auto_589905 ) ) ( not ( = ?auto_589901 ?auto_589906 ) ) ( not ( = ?auto_589901 ?auto_589907 ) ) ( not ( = ?auto_589901 ?auto_589908 ) ) ( not ( = ?auto_589901 ?auto_589909 ) ) ( not ( = ?auto_589901 ?auto_589910 ) ) ( not ( = ?auto_589901 ?auto_589911 ) ) ( not ( = ?auto_589902 ?auto_589903 ) ) ( not ( = ?auto_589902 ?auto_589904 ) ) ( not ( = ?auto_589902 ?auto_589905 ) ) ( not ( = ?auto_589902 ?auto_589906 ) ) ( not ( = ?auto_589902 ?auto_589907 ) ) ( not ( = ?auto_589902 ?auto_589908 ) ) ( not ( = ?auto_589902 ?auto_589909 ) ) ( not ( = ?auto_589902 ?auto_589910 ) ) ( not ( = ?auto_589902 ?auto_589911 ) ) ( not ( = ?auto_589903 ?auto_589904 ) ) ( not ( = ?auto_589903 ?auto_589905 ) ) ( not ( = ?auto_589903 ?auto_589906 ) ) ( not ( = ?auto_589903 ?auto_589907 ) ) ( not ( = ?auto_589903 ?auto_589908 ) ) ( not ( = ?auto_589903 ?auto_589909 ) ) ( not ( = ?auto_589903 ?auto_589910 ) ) ( not ( = ?auto_589903 ?auto_589911 ) ) ( not ( = ?auto_589904 ?auto_589905 ) ) ( not ( = ?auto_589904 ?auto_589906 ) ) ( not ( = ?auto_589904 ?auto_589907 ) ) ( not ( = ?auto_589904 ?auto_589908 ) ) ( not ( = ?auto_589904 ?auto_589909 ) ) ( not ( = ?auto_589904 ?auto_589910 ) ) ( not ( = ?auto_589904 ?auto_589911 ) ) ( not ( = ?auto_589905 ?auto_589906 ) ) ( not ( = ?auto_589905 ?auto_589907 ) ) ( not ( = ?auto_589905 ?auto_589908 ) ) ( not ( = ?auto_589905 ?auto_589909 ) ) ( not ( = ?auto_589905 ?auto_589910 ) ) ( not ( = ?auto_589905 ?auto_589911 ) ) ( not ( = ?auto_589906 ?auto_589907 ) ) ( not ( = ?auto_589906 ?auto_589908 ) ) ( not ( = ?auto_589906 ?auto_589909 ) ) ( not ( = ?auto_589906 ?auto_589910 ) ) ( not ( = ?auto_589906 ?auto_589911 ) ) ( not ( = ?auto_589907 ?auto_589908 ) ) ( not ( = ?auto_589907 ?auto_589909 ) ) ( not ( = ?auto_589907 ?auto_589910 ) ) ( not ( = ?auto_589907 ?auto_589911 ) ) ( not ( = ?auto_589908 ?auto_589909 ) ) ( not ( = ?auto_589908 ?auto_589910 ) ) ( not ( = ?auto_589908 ?auto_589911 ) ) ( not ( = ?auto_589909 ?auto_589910 ) ) ( not ( = ?auto_589909 ?auto_589911 ) ) ( not ( = ?auto_589910 ?auto_589911 ) ) ( ON ?auto_589910 ?auto_589911 ) ( ON ?auto_589909 ?auto_589910 ) ( ON ?auto_589908 ?auto_589909 ) ( ON ?auto_589907 ?auto_589908 ) ( ON ?auto_589906 ?auto_589907 ) ( ON ?auto_589905 ?auto_589906 ) ( ON ?auto_589904 ?auto_589905 ) ( CLEAR ?auto_589902 ) ( ON ?auto_589903 ?auto_589904 ) ( CLEAR ?auto_589903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_589896 ?auto_589897 ?auto_589898 ?auto_589899 ?auto_589900 ?auto_589901 ?auto_589902 ?auto_589903 )
      ( MAKE-16PILE ?auto_589896 ?auto_589897 ?auto_589898 ?auto_589899 ?auto_589900 ?auto_589901 ?auto_589902 ?auto_589903 ?auto_589904 ?auto_589905 ?auto_589906 ?auto_589907 ?auto_589908 ?auto_589909 ?auto_589910 ?auto_589911 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589928 - BLOCK
      ?auto_589929 - BLOCK
      ?auto_589930 - BLOCK
      ?auto_589931 - BLOCK
      ?auto_589932 - BLOCK
      ?auto_589933 - BLOCK
      ?auto_589934 - BLOCK
      ?auto_589935 - BLOCK
      ?auto_589936 - BLOCK
      ?auto_589937 - BLOCK
      ?auto_589938 - BLOCK
      ?auto_589939 - BLOCK
      ?auto_589940 - BLOCK
      ?auto_589941 - BLOCK
      ?auto_589942 - BLOCK
      ?auto_589943 - BLOCK
    )
    :vars
    (
      ?auto_589944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_589943 ?auto_589944 ) ( ON-TABLE ?auto_589928 ) ( ON ?auto_589929 ?auto_589928 ) ( ON ?auto_589930 ?auto_589929 ) ( ON ?auto_589931 ?auto_589930 ) ( ON ?auto_589932 ?auto_589931 ) ( ON ?auto_589933 ?auto_589932 ) ( not ( = ?auto_589928 ?auto_589929 ) ) ( not ( = ?auto_589928 ?auto_589930 ) ) ( not ( = ?auto_589928 ?auto_589931 ) ) ( not ( = ?auto_589928 ?auto_589932 ) ) ( not ( = ?auto_589928 ?auto_589933 ) ) ( not ( = ?auto_589928 ?auto_589934 ) ) ( not ( = ?auto_589928 ?auto_589935 ) ) ( not ( = ?auto_589928 ?auto_589936 ) ) ( not ( = ?auto_589928 ?auto_589937 ) ) ( not ( = ?auto_589928 ?auto_589938 ) ) ( not ( = ?auto_589928 ?auto_589939 ) ) ( not ( = ?auto_589928 ?auto_589940 ) ) ( not ( = ?auto_589928 ?auto_589941 ) ) ( not ( = ?auto_589928 ?auto_589942 ) ) ( not ( = ?auto_589928 ?auto_589943 ) ) ( not ( = ?auto_589928 ?auto_589944 ) ) ( not ( = ?auto_589929 ?auto_589930 ) ) ( not ( = ?auto_589929 ?auto_589931 ) ) ( not ( = ?auto_589929 ?auto_589932 ) ) ( not ( = ?auto_589929 ?auto_589933 ) ) ( not ( = ?auto_589929 ?auto_589934 ) ) ( not ( = ?auto_589929 ?auto_589935 ) ) ( not ( = ?auto_589929 ?auto_589936 ) ) ( not ( = ?auto_589929 ?auto_589937 ) ) ( not ( = ?auto_589929 ?auto_589938 ) ) ( not ( = ?auto_589929 ?auto_589939 ) ) ( not ( = ?auto_589929 ?auto_589940 ) ) ( not ( = ?auto_589929 ?auto_589941 ) ) ( not ( = ?auto_589929 ?auto_589942 ) ) ( not ( = ?auto_589929 ?auto_589943 ) ) ( not ( = ?auto_589929 ?auto_589944 ) ) ( not ( = ?auto_589930 ?auto_589931 ) ) ( not ( = ?auto_589930 ?auto_589932 ) ) ( not ( = ?auto_589930 ?auto_589933 ) ) ( not ( = ?auto_589930 ?auto_589934 ) ) ( not ( = ?auto_589930 ?auto_589935 ) ) ( not ( = ?auto_589930 ?auto_589936 ) ) ( not ( = ?auto_589930 ?auto_589937 ) ) ( not ( = ?auto_589930 ?auto_589938 ) ) ( not ( = ?auto_589930 ?auto_589939 ) ) ( not ( = ?auto_589930 ?auto_589940 ) ) ( not ( = ?auto_589930 ?auto_589941 ) ) ( not ( = ?auto_589930 ?auto_589942 ) ) ( not ( = ?auto_589930 ?auto_589943 ) ) ( not ( = ?auto_589930 ?auto_589944 ) ) ( not ( = ?auto_589931 ?auto_589932 ) ) ( not ( = ?auto_589931 ?auto_589933 ) ) ( not ( = ?auto_589931 ?auto_589934 ) ) ( not ( = ?auto_589931 ?auto_589935 ) ) ( not ( = ?auto_589931 ?auto_589936 ) ) ( not ( = ?auto_589931 ?auto_589937 ) ) ( not ( = ?auto_589931 ?auto_589938 ) ) ( not ( = ?auto_589931 ?auto_589939 ) ) ( not ( = ?auto_589931 ?auto_589940 ) ) ( not ( = ?auto_589931 ?auto_589941 ) ) ( not ( = ?auto_589931 ?auto_589942 ) ) ( not ( = ?auto_589931 ?auto_589943 ) ) ( not ( = ?auto_589931 ?auto_589944 ) ) ( not ( = ?auto_589932 ?auto_589933 ) ) ( not ( = ?auto_589932 ?auto_589934 ) ) ( not ( = ?auto_589932 ?auto_589935 ) ) ( not ( = ?auto_589932 ?auto_589936 ) ) ( not ( = ?auto_589932 ?auto_589937 ) ) ( not ( = ?auto_589932 ?auto_589938 ) ) ( not ( = ?auto_589932 ?auto_589939 ) ) ( not ( = ?auto_589932 ?auto_589940 ) ) ( not ( = ?auto_589932 ?auto_589941 ) ) ( not ( = ?auto_589932 ?auto_589942 ) ) ( not ( = ?auto_589932 ?auto_589943 ) ) ( not ( = ?auto_589932 ?auto_589944 ) ) ( not ( = ?auto_589933 ?auto_589934 ) ) ( not ( = ?auto_589933 ?auto_589935 ) ) ( not ( = ?auto_589933 ?auto_589936 ) ) ( not ( = ?auto_589933 ?auto_589937 ) ) ( not ( = ?auto_589933 ?auto_589938 ) ) ( not ( = ?auto_589933 ?auto_589939 ) ) ( not ( = ?auto_589933 ?auto_589940 ) ) ( not ( = ?auto_589933 ?auto_589941 ) ) ( not ( = ?auto_589933 ?auto_589942 ) ) ( not ( = ?auto_589933 ?auto_589943 ) ) ( not ( = ?auto_589933 ?auto_589944 ) ) ( not ( = ?auto_589934 ?auto_589935 ) ) ( not ( = ?auto_589934 ?auto_589936 ) ) ( not ( = ?auto_589934 ?auto_589937 ) ) ( not ( = ?auto_589934 ?auto_589938 ) ) ( not ( = ?auto_589934 ?auto_589939 ) ) ( not ( = ?auto_589934 ?auto_589940 ) ) ( not ( = ?auto_589934 ?auto_589941 ) ) ( not ( = ?auto_589934 ?auto_589942 ) ) ( not ( = ?auto_589934 ?auto_589943 ) ) ( not ( = ?auto_589934 ?auto_589944 ) ) ( not ( = ?auto_589935 ?auto_589936 ) ) ( not ( = ?auto_589935 ?auto_589937 ) ) ( not ( = ?auto_589935 ?auto_589938 ) ) ( not ( = ?auto_589935 ?auto_589939 ) ) ( not ( = ?auto_589935 ?auto_589940 ) ) ( not ( = ?auto_589935 ?auto_589941 ) ) ( not ( = ?auto_589935 ?auto_589942 ) ) ( not ( = ?auto_589935 ?auto_589943 ) ) ( not ( = ?auto_589935 ?auto_589944 ) ) ( not ( = ?auto_589936 ?auto_589937 ) ) ( not ( = ?auto_589936 ?auto_589938 ) ) ( not ( = ?auto_589936 ?auto_589939 ) ) ( not ( = ?auto_589936 ?auto_589940 ) ) ( not ( = ?auto_589936 ?auto_589941 ) ) ( not ( = ?auto_589936 ?auto_589942 ) ) ( not ( = ?auto_589936 ?auto_589943 ) ) ( not ( = ?auto_589936 ?auto_589944 ) ) ( not ( = ?auto_589937 ?auto_589938 ) ) ( not ( = ?auto_589937 ?auto_589939 ) ) ( not ( = ?auto_589937 ?auto_589940 ) ) ( not ( = ?auto_589937 ?auto_589941 ) ) ( not ( = ?auto_589937 ?auto_589942 ) ) ( not ( = ?auto_589937 ?auto_589943 ) ) ( not ( = ?auto_589937 ?auto_589944 ) ) ( not ( = ?auto_589938 ?auto_589939 ) ) ( not ( = ?auto_589938 ?auto_589940 ) ) ( not ( = ?auto_589938 ?auto_589941 ) ) ( not ( = ?auto_589938 ?auto_589942 ) ) ( not ( = ?auto_589938 ?auto_589943 ) ) ( not ( = ?auto_589938 ?auto_589944 ) ) ( not ( = ?auto_589939 ?auto_589940 ) ) ( not ( = ?auto_589939 ?auto_589941 ) ) ( not ( = ?auto_589939 ?auto_589942 ) ) ( not ( = ?auto_589939 ?auto_589943 ) ) ( not ( = ?auto_589939 ?auto_589944 ) ) ( not ( = ?auto_589940 ?auto_589941 ) ) ( not ( = ?auto_589940 ?auto_589942 ) ) ( not ( = ?auto_589940 ?auto_589943 ) ) ( not ( = ?auto_589940 ?auto_589944 ) ) ( not ( = ?auto_589941 ?auto_589942 ) ) ( not ( = ?auto_589941 ?auto_589943 ) ) ( not ( = ?auto_589941 ?auto_589944 ) ) ( not ( = ?auto_589942 ?auto_589943 ) ) ( not ( = ?auto_589942 ?auto_589944 ) ) ( not ( = ?auto_589943 ?auto_589944 ) ) ( ON ?auto_589942 ?auto_589943 ) ( ON ?auto_589941 ?auto_589942 ) ( ON ?auto_589940 ?auto_589941 ) ( ON ?auto_589939 ?auto_589940 ) ( ON ?auto_589938 ?auto_589939 ) ( ON ?auto_589937 ?auto_589938 ) ( ON ?auto_589936 ?auto_589937 ) ( ON ?auto_589935 ?auto_589936 ) ( CLEAR ?auto_589933 ) ( ON ?auto_589934 ?auto_589935 ) ( CLEAR ?auto_589934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_589928 ?auto_589929 ?auto_589930 ?auto_589931 ?auto_589932 ?auto_589933 ?auto_589934 )
      ( MAKE-16PILE ?auto_589928 ?auto_589929 ?auto_589930 ?auto_589931 ?auto_589932 ?auto_589933 ?auto_589934 ?auto_589935 ?auto_589936 ?auto_589937 ?auto_589938 ?auto_589939 ?auto_589940 ?auto_589941 ?auto_589942 ?auto_589943 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589961 - BLOCK
      ?auto_589962 - BLOCK
      ?auto_589963 - BLOCK
      ?auto_589964 - BLOCK
      ?auto_589965 - BLOCK
      ?auto_589966 - BLOCK
      ?auto_589967 - BLOCK
      ?auto_589968 - BLOCK
      ?auto_589969 - BLOCK
      ?auto_589970 - BLOCK
      ?auto_589971 - BLOCK
      ?auto_589972 - BLOCK
      ?auto_589973 - BLOCK
      ?auto_589974 - BLOCK
      ?auto_589975 - BLOCK
      ?auto_589976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_589976 ) ( ON-TABLE ?auto_589961 ) ( ON ?auto_589962 ?auto_589961 ) ( ON ?auto_589963 ?auto_589962 ) ( ON ?auto_589964 ?auto_589963 ) ( ON ?auto_589965 ?auto_589964 ) ( ON ?auto_589966 ?auto_589965 ) ( not ( = ?auto_589961 ?auto_589962 ) ) ( not ( = ?auto_589961 ?auto_589963 ) ) ( not ( = ?auto_589961 ?auto_589964 ) ) ( not ( = ?auto_589961 ?auto_589965 ) ) ( not ( = ?auto_589961 ?auto_589966 ) ) ( not ( = ?auto_589961 ?auto_589967 ) ) ( not ( = ?auto_589961 ?auto_589968 ) ) ( not ( = ?auto_589961 ?auto_589969 ) ) ( not ( = ?auto_589961 ?auto_589970 ) ) ( not ( = ?auto_589961 ?auto_589971 ) ) ( not ( = ?auto_589961 ?auto_589972 ) ) ( not ( = ?auto_589961 ?auto_589973 ) ) ( not ( = ?auto_589961 ?auto_589974 ) ) ( not ( = ?auto_589961 ?auto_589975 ) ) ( not ( = ?auto_589961 ?auto_589976 ) ) ( not ( = ?auto_589962 ?auto_589963 ) ) ( not ( = ?auto_589962 ?auto_589964 ) ) ( not ( = ?auto_589962 ?auto_589965 ) ) ( not ( = ?auto_589962 ?auto_589966 ) ) ( not ( = ?auto_589962 ?auto_589967 ) ) ( not ( = ?auto_589962 ?auto_589968 ) ) ( not ( = ?auto_589962 ?auto_589969 ) ) ( not ( = ?auto_589962 ?auto_589970 ) ) ( not ( = ?auto_589962 ?auto_589971 ) ) ( not ( = ?auto_589962 ?auto_589972 ) ) ( not ( = ?auto_589962 ?auto_589973 ) ) ( not ( = ?auto_589962 ?auto_589974 ) ) ( not ( = ?auto_589962 ?auto_589975 ) ) ( not ( = ?auto_589962 ?auto_589976 ) ) ( not ( = ?auto_589963 ?auto_589964 ) ) ( not ( = ?auto_589963 ?auto_589965 ) ) ( not ( = ?auto_589963 ?auto_589966 ) ) ( not ( = ?auto_589963 ?auto_589967 ) ) ( not ( = ?auto_589963 ?auto_589968 ) ) ( not ( = ?auto_589963 ?auto_589969 ) ) ( not ( = ?auto_589963 ?auto_589970 ) ) ( not ( = ?auto_589963 ?auto_589971 ) ) ( not ( = ?auto_589963 ?auto_589972 ) ) ( not ( = ?auto_589963 ?auto_589973 ) ) ( not ( = ?auto_589963 ?auto_589974 ) ) ( not ( = ?auto_589963 ?auto_589975 ) ) ( not ( = ?auto_589963 ?auto_589976 ) ) ( not ( = ?auto_589964 ?auto_589965 ) ) ( not ( = ?auto_589964 ?auto_589966 ) ) ( not ( = ?auto_589964 ?auto_589967 ) ) ( not ( = ?auto_589964 ?auto_589968 ) ) ( not ( = ?auto_589964 ?auto_589969 ) ) ( not ( = ?auto_589964 ?auto_589970 ) ) ( not ( = ?auto_589964 ?auto_589971 ) ) ( not ( = ?auto_589964 ?auto_589972 ) ) ( not ( = ?auto_589964 ?auto_589973 ) ) ( not ( = ?auto_589964 ?auto_589974 ) ) ( not ( = ?auto_589964 ?auto_589975 ) ) ( not ( = ?auto_589964 ?auto_589976 ) ) ( not ( = ?auto_589965 ?auto_589966 ) ) ( not ( = ?auto_589965 ?auto_589967 ) ) ( not ( = ?auto_589965 ?auto_589968 ) ) ( not ( = ?auto_589965 ?auto_589969 ) ) ( not ( = ?auto_589965 ?auto_589970 ) ) ( not ( = ?auto_589965 ?auto_589971 ) ) ( not ( = ?auto_589965 ?auto_589972 ) ) ( not ( = ?auto_589965 ?auto_589973 ) ) ( not ( = ?auto_589965 ?auto_589974 ) ) ( not ( = ?auto_589965 ?auto_589975 ) ) ( not ( = ?auto_589965 ?auto_589976 ) ) ( not ( = ?auto_589966 ?auto_589967 ) ) ( not ( = ?auto_589966 ?auto_589968 ) ) ( not ( = ?auto_589966 ?auto_589969 ) ) ( not ( = ?auto_589966 ?auto_589970 ) ) ( not ( = ?auto_589966 ?auto_589971 ) ) ( not ( = ?auto_589966 ?auto_589972 ) ) ( not ( = ?auto_589966 ?auto_589973 ) ) ( not ( = ?auto_589966 ?auto_589974 ) ) ( not ( = ?auto_589966 ?auto_589975 ) ) ( not ( = ?auto_589966 ?auto_589976 ) ) ( not ( = ?auto_589967 ?auto_589968 ) ) ( not ( = ?auto_589967 ?auto_589969 ) ) ( not ( = ?auto_589967 ?auto_589970 ) ) ( not ( = ?auto_589967 ?auto_589971 ) ) ( not ( = ?auto_589967 ?auto_589972 ) ) ( not ( = ?auto_589967 ?auto_589973 ) ) ( not ( = ?auto_589967 ?auto_589974 ) ) ( not ( = ?auto_589967 ?auto_589975 ) ) ( not ( = ?auto_589967 ?auto_589976 ) ) ( not ( = ?auto_589968 ?auto_589969 ) ) ( not ( = ?auto_589968 ?auto_589970 ) ) ( not ( = ?auto_589968 ?auto_589971 ) ) ( not ( = ?auto_589968 ?auto_589972 ) ) ( not ( = ?auto_589968 ?auto_589973 ) ) ( not ( = ?auto_589968 ?auto_589974 ) ) ( not ( = ?auto_589968 ?auto_589975 ) ) ( not ( = ?auto_589968 ?auto_589976 ) ) ( not ( = ?auto_589969 ?auto_589970 ) ) ( not ( = ?auto_589969 ?auto_589971 ) ) ( not ( = ?auto_589969 ?auto_589972 ) ) ( not ( = ?auto_589969 ?auto_589973 ) ) ( not ( = ?auto_589969 ?auto_589974 ) ) ( not ( = ?auto_589969 ?auto_589975 ) ) ( not ( = ?auto_589969 ?auto_589976 ) ) ( not ( = ?auto_589970 ?auto_589971 ) ) ( not ( = ?auto_589970 ?auto_589972 ) ) ( not ( = ?auto_589970 ?auto_589973 ) ) ( not ( = ?auto_589970 ?auto_589974 ) ) ( not ( = ?auto_589970 ?auto_589975 ) ) ( not ( = ?auto_589970 ?auto_589976 ) ) ( not ( = ?auto_589971 ?auto_589972 ) ) ( not ( = ?auto_589971 ?auto_589973 ) ) ( not ( = ?auto_589971 ?auto_589974 ) ) ( not ( = ?auto_589971 ?auto_589975 ) ) ( not ( = ?auto_589971 ?auto_589976 ) ) ( not ( = ?auto_589972 ?auto_589973 ) ) ( not ( = ?auto_589972 ?auto_589974 ) ) ( not ( = ?auto_589972 ?auto_589975 ) ) ( not ( = ?auto_589972 ?auto_589976 ) ) ( not ( = ?auto_589973 ?auto_589974 ) ) ( not ( = ?auto_589973 ?auto_589975 ) ) ( not ( = ?auto_589973 ?auto_589976 ) ) ( not ( = ?auto_589974 ?auto_589975 ) ) ( not ( = ?auto_589974 ?auto_589976 ) ) ( not ( = ?auto_589975 ?auto_589976 ) ) ( ON ?auto_589975 ?auto_589976 ) ( ON ?auto_589974 ?auto_589975 ) ( ON ?auto_589973 ?auto_589974 ) ( ON ?auto_589972 ?auto_589973 ) ( ON ?auto_589971 ?auto_589972 ) ( ON ?auto_589970 ?auto_589971 ) ( ON ?auto_589969 ?auto_589970 ) ( ON ?auto_589968 ?auto_589969 ) ( CLEAR ?auto_589966 ) ( ON ?auto_589967 ?auto_589968 ) ( CLEAR ?auto_589967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_589961 ?auto_589962 ?auto_589963 ?auto_589964 ?auto_589965 ?auto_589966 ?auto_589967 )
      ( MAKE-16PILE ?auto_589961 ?auto_589962 ?auto_589963 ?auto_589964 ?auto_589965 ?auto_589966 ?auto_589967 ?auto_589968 ?auto_589969 ?auto_589970 ?auto_589971 ?auto_589972 ?auto_589973 ?auto_589974 ?auto_589975 ?auto_589976 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_589993 - BLOCK
      ?auto_589994 - BLOCK
      ?auto_589995 - BLOCK
      ?auto_589996 - BLOCK
      ?auto_589997 - BLOCK
      ?auto_589998 - BLOCK
      ?auto_589999 - BLOCK
      ?auto_590000 - BLOCK
      ?auto_590001 - BLOCK
      ?auto_590002 - BLOCK
      ?auto_590003 - BLOCK
      ?auto_590004 - BLOCK
      ?auto_590005 - BLOCK
      ?auto_590006 - BLOCK
      ?auto_590007 - BLOCK
      ?auto_590008 - BLOCK
    )
    :vars
    (
      ?auto_590009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590008 ?auto_590009 ) ( ON-TABLE ?auto_589993 ) ( ON ?auto_589994 ?auto_589993 ) ( ON ?auto_589995 ?auto_589994 ) ( ON ?auto_589996 ?auto_589995 ) ( ON ?auto_589997 ?auto_589996 ) ( not ( = ?auto_589993 ?auto_589994 ) ) ( not ( = ?auto_589993 ?auto_589995 ) ) ( not ( = ?auto_589993 ?auto_589996 ) ) ( not ( = ?auto_589993 ?auto_589997 ) ) ( not ( = ?auto_589993 ?auto_589998 ) ) ( not ( = ?auto_589993 ?auto_589999 ) ) ( not ( = ?auto_589993 ?auto_590000 ) ) ( not ( = ?auto_589993 ?auto_590001 ) ) ( not ( = ?auto_589993 ?auto_590002 ) ) ( not ( = ?auto_589993 ?auto_590003 ) ) ( not ( = ?auto_589993 ?auto_590004 ) ) ( not ( = ?auto_589993 ?auto_590005 ) ) ( not ( = ?auto_589993 ?auto_590006 ) ) ( not ( = ?auto_589993 ?auto_590007 ) ) ( not ( = ?auto_589993 ?auto_590008 ) ) ( not ( = ?auto_589993 ?auto_590009 ) ) ( not ( = ?auto_589994 ?auto_589995 ) ) ( not ( = ?auto_589994 ?auto_589996 ) ) ( not ( = ?auto_589994 ?auto_589997 ) ) ( not ( = ?auto_589994 ?auto_589998 ) ) ( not ( = ?auto_589994 ?auto_589999 ) ) ( not ( = ?auto_589994 ?auto_590000 ) ) ( not ( = ?auto_589994 ?auto_590001 ) ) ( not ( = ?auto_589994 ?auto_590002 ) ) ( not ( = ?auto_589994 ?auto_590003 ) ) ( not ( = ?auto_589994 ?auto_590004 ) ) ( not ( = ?auto_589994 ?auto_590005 ) ) ( not ( = ?auto_589994 ?auto_590006 ) ) ( not ( = ?auto_589994 ?auto_590007 ) ) ( not ( = ?auto_589994 ?auto_590008 ) ) ( not ( = ?auto_589994 ?auto_590009 ) ) ( not ( = ?auto_589995 ?auto_589996 ) ) ( not ( = ?auto_589995 ?auto_589997 ) ) ( not ( = ?auto_589995 ?auto_589998 ) ) ( not ( = ?auto_589995 ?auto_589999 ) ) ( not ( = ?auto_589995 ?auto_590000 ) ) ( not ( = ?auto_589995 ?auto_590001 ) ) ( not ( = ?auto_589995 ?auto_590002 ) ) ( not ( = ?auto_589995 ?auto_590003 ) ) ( not ( = ?auto_589995 ?auto_590004 ) ) ( not ( = ?auto_589995 ?auto_590005 ) ) ( not ( = ?auto_589995 ?auto_590006 ) ) ( not ( = ?auto_589995 ?auto_590007 ) ) ( not ( = ?auto_589995 ?auto_590008 ) ) ( not ( = ?auto_589995 ?auto_590009 ) ) ( not ( = ?auto_589996 ?auto_589997 ) ) ( not ( = ?auto_589996 ?auto_589998 ) ) ( not ( = ?auto_589996 ?auto_589999 ) ) ( not ( = ?auto_589996 ?auto_590000 ) ) ( not ( = ?auto_589996 ?auto_590001 ) ) ( not ( = ?auto_589996 ?auto_590002 ) ) ( not ( = ?auto_589996 ?auto_590003 ) ) ( not ( = ?auto_589996 ?auto_590004 ) ) ( not ( = ?auto_589996 ?auto_590005 ) ) ( not ( = ?auto_589996 ?auto_590006 ) ) ( not ( = ?auto_589996 ?auto_590007 ) ) ( not ( = ?auto_589996 ?auto_590008 ) ) ( not ( = ?auto_589996 ?auto_590009 ) ) ( not ( = ?auto_589997 ?auto_589998 ) ) ( not ( = ?auto_589997 ?auto_589999 ) ) ( not ( = ?auto_589997 ?auto_590000 ) ) ( not ( = ?auto_589997 ?auto_590001 ) ) ( not ( = ?auto_589997 ?auto_590002 ) ) ( not ( = ?auto_589997 ?auto_590003 ) ) ( not ( = ?auto_589997 ?auto_590004 ) ) ( not ( = ?auto_589997 ?auto_590005 ) ) ( not ( = ?auto_589997 ?auto_590006 ) ) ( not ( = ?auto_589997 ?auto_590007 ) ) ( not ( = ?auto_589997 ?auto_590008 ) ) ( not ( = ?auto_589997 ?auto_590009 ) ) ( not ( = ?auto_589998 ?auto_589999 ) ) ( not ( = ?auto_589998 ?auto_590000 ) ) ( not ( = ?auto_589998 ?auto_590001 ) ) ( not ( = ?auto_589998 ?auto_590002 ) ) ( not ( = ?auto_589998 ?auto_590003 ) ) ( not ( = ?auto_589998 ?auto_590004 ) ) ( not ( = ?auto_589998 ?auto_590005 ) ) ( not ( = ?auto_589998 ?auto_590006 ) ) ( not ( = ?auto_589998 ?auto_590007 ) ) ( not ( = ?auto_589998 ?auto_590008 ) ) ( not ( = ?auto_589998 ?auto_590009 ) ) ( not ( = ?auto_589999 ?auto_590000 ) ) ( not ( = ?auto_589999 ?auto_590001 ) ) ( not ( = ?auto_589999 ?auto_590002 ) ) ( not ( = ?auto_589999 ?auto_590003 ) ) ( not ( = ?auto_589999 ?auto_590004 ) ) ( not ( = ?auto_589999 ?auto_590005 ) ) ( not ( = ?auto_589999 ?auto_590006 ) ) ( not ( = ?auto_589999 ?auto_590007 ) ) ( not ( = ?auto_589999 ?auto_590008 ) ) ( not ( = ?auto_589999 ?auto_590009 ) ) ( not ( = ?auto_590000 ?auto_590001 ) ) ( not ( = ?auto_590000 ?auto_590002 ) ) ( not ( = ?auto_590000 ?auto_590003 ) ) ( not ( = ?auto_590000 ?auto_590004 ) ) ( not ( = ?auto_590000 ?auto_590005 ) ) ( not ( = ?auto_590000 ?auto_590006 ) ) ( not ( = ?auto_590000 ?auto_590007 ) ) ( not ( = ?auto_590000 ?auto_590008 ) ) ( not ( = ?auto_590000 ?auto_590009 ) ) ( not ( = ?auto_590001 ?auto_590002 ) ) ( not ( = ?auto_590001 ?auto_590003 ) ) ( not ( = ?auto_590001 ?auto_590004 ) ) ( not ( = ?auto_590001 ?auto_590005 ) ) ( not ( = ?auto_590001 ?auto_590006 ) ) ( not ( = ?auto_590001 ?auto_590007 ) ) ( not ( = ?auto_590001 ?auto_590008 ) ) ( not ( = ?auto_590001 ?auto_590009 ) ) ( not ( = ?auto_590002 ?auto_590003 ) ) ( not ( = ?auto_590002 ?auto_590004 ) ) ( not ( = ?auto_590002 ?auto_590005 ) ) ( not ( = ?auto_590002 ?auto_590006 ) ) ( not ( = ?auto_590002 ?auto_590007 ) ) ( not ( = ?auto_590002 ?auto_590008 ) ) ( not ( = ?auto_590002 ?auto_590009 ) ) ( not ( = ?auto_590003 ?auto_590004 ) ) ( not ( = ?auto_590003 ?auto_590005 ) ) ( not ( = ?auto_590003 ?auto_590006 ) ) ( not ( = ?auto_590003 ?auto_590007 ) ) ( not ( = ?auto_590003 ?auto_590008 ) ) ( not ( = ?auto_590003 ?auto_590009 ) ) ( not ( = ?auto_590004 ?auto_590005 ) ) ( not ( = ?auto_590004 ?auto_590006 ) ) ( not ( = ?auto_590004 ?auto_590007 ) ) ( not ( = ?auto_590004 ?auto_590008 ) ) ( not ( = ?auto_590004 ?auto_590009 ) ) ( not ( = ?auto_590005 ?auto_590006 ) ) ( not ( = ?auto_590005 ?auto_590007 ) ) ( not ( = ?auto_590005 ?auto_590008 ) ) ( not ( = ?auto_590005 ?auto_590009 ) ) ( not ( = ?auto_590006 ?auto_590007 ) ) ( not ( = ?auto_590006 ?auto_590008 ) ) ( not ( = ?auto_590006 ?auto_590009 ) ) ( not ( = ?auto_590007 ?auto_590008 ) ) ( not ( = ?auto_590007 ?auto_590009 ) ) ( not ( = ?auto_590008 ?auto_590009 ) ) ( ON ?auto_590007 ?auto_590008 ) ( ON ?auto_590006 ?auto_590007 ) ( ON ?auto_590005 ?auto_590006 ) ( ON ?auto_590004 ?auto_590005 ) ( ON ?auto_590003 ?auto_590004 ) ( ON ?auto_590002 ?auto_590003 ) ( ON ?auto_590001 ?auto_590002 ) ( ON ?auto_590000 ?auto_590001 ) ( ON ?auto_589999 ?auto_590000 ) ( CLEAR ?auto_589997 ) ( ON ?auto_589998 ?auto_589999 ) ( CLEAR ?auto_589998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_589993 ?auto_589994 ?auto_589995 ?auto_589996 ?auto_589997 ?auto_589998 )
      ( MAKE-16PILE ?auto_589993 ?auto_589994 ?auto_589995 ?auto_589996 ?auto_589997 ?auto_589998 ?auto_589999 ?auto_590000 ?auto_590001 ?auto_590002 ?auto_590003 ?auto_590004 ?auto_590005 ?auto_590006 ?auto_590007 ?auto_590008 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_590026 - BLOCK
      ?auto_590027 - BLOCK
      ?auto_590028 - BLOCK
      ?auto_590029 - BLOCK
      ?auto_590030 - BLOCK
      ?auto_590031 - BLOCK
      ?auto_590032 - BLOCK
      ?auto_590033 - BLOCK
      ?auto_590034 - BLOCK
      ?auto_590035 - BLOCK
      ?auto_590036 - BLOCK
      ?auto_590037 - BLOCK
      ?auto_590038 - BLOCK
      ?auto_590039 - BLOCK
      ?auto_590040 - BLOCK
      ?auto_590041 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_590041 ) ( ON-TABLE ?auto_590026 ) ( ON ?auto_590027 ?auto_590026 ) ( ON ?auto_590028 ?auto_590027 ) ( ON ?auto_590029 ?auto_590028 ) ( ON ?auto_590030 ?auto_590029 ) ( not ( = ?auto_590026 ?auto_590027 ) ) ( not ( = ?auto_590026 ?auto_590028 ) ) ( not ( = ?auto_590026 ?auto_590029 ) ) ( not ( = ?auto_590026 ?auto_590030 ) ) ( not ( = ?auto_590026 ?auto_590031 ) ) ( not ( = ?auto_590026 ?auto_590032 ) ) ( not ( = ?auto_590026 ?auto_590033 ) ) ( not ( = ?auto_590026 ?auto_590034 ) ) ( not ( = ?auto_590026 ?auto_590035 ) ) ( not ( = ?auto_590026 ?auto_590036 ) ) ( not ( = ?auto_590026 ?auto_590037 ) ) ( not ( = ?auto_590026 ?auto_590038 ) ) ( not ( = ?auto_590026 ?auto_590039 ) ) ( not ( = ?auto_590026 ?auto_590040 ) ) ( not ( = ?auto_590026 ?auto_590041 ) ) ( not ( = ?auto_590027 ?auto_590028 ) ) ( not ( = ?auto_590027 ?auto_590029 ) ) ( not ( = ?auto_590027 ?auto_590030 ) ) ( not ( = ?auto_590027 ?auto_590031 ) ) ( not ( = ?auto_590027 ?auto_590032 ) ) ( not ( = ?auto_590027 ?auto_590033 ) ) ( not ( = ?auto_590027 ?auto_590034 ) ) ( not ( = ?auto_590027 ?auto_590035 ) ) ( not ( = ?auto_590027 ?auto_590036 ) ) ( not ( = ?auto_590027 ?auto_590037 ) ) ( not ( = ?auto_590027 ?auto_590038 ) ) ( not ( = ?auto_590027 ?auto_590039 ) ) ( not ( = ?auto_590027 ?auto_590040 ) ) ( not ( = ?auto_590027 ?auto_590041 ) ) ( not ( = ?auto_590028 ?auto_590029 ) ) ( not ( = ?auto_590028 ?auto_590030 ) ) ( not ( = ?auto_590028 ?auto_590031 ) ) ( not ( = ?auto_590028 ?auto_590032 ) ) ( not ( = ?auto_590028 ?auto_590033 ) ) ( not ( = ?auto_590028 ?auto_590034 ) ) ( not ( = ?auto_590028 ?auto_590035 ) ) ( not ( = ?auto_590028 ?auto_590036 ) ) ( not ( = ?auto_590028 ?auto_590037 ) ) ( not ( = ?auto_590028 ?auto_590038 ) ) ( not ( = ?auto_590028 ?auto_590039 ) ) ( not ( = ?auto_590028 ?auto_590040 ) ) ( not ( = ?auto_590028 ?auto_590041 ) ) ( not ( = ?auto_590029 ?auto_590030 ) ) ( not ( = ?auto_590029 ?auto_590031 ) ) ( not ( = ?auto_590029 ?auto_590032 ) ) ( not ( = ?auto_590029 ?auto_590033 ) ) ( not ( = ?auto_590029 ?auto_590034 ) ) ( not ( = ?auto_590029 ?auto_590035 ) ) ( not ( = ?auto_590029 ?auto_590036 ) ) ( not ( = ?auto_590029 ?auto_590037 ) ) ( not ( = ?auto_590029 ?auto_590038 ) ) ( not ( = ?auto_590029 ?auto_590039 ) ) ( not ( = ?auto_590029 ?auto_590040 ) ) ( not ( = ?auto_590029 ?auto_590041 ) ) ( not ( = ?auto_590030 ?auto_590031 ) ) ( not ( = ?auto_590030 ?auto_590032 ) ) ( not ( = ?auto_590030 ?auto_590033 ) ) ( not ( = ?auto_590030 ?auto_590034 ) ) ( not ( = ?auto_590030 ?auto_590035 ) ) ( not ( = ?auto_590030 ?auto_590036 ) ) ( not ( = ?auto_590030 ?auto_590037 ) ) ( not ( = ?auto_590030 ?auto_590038 ) ) ( not ( = ?auto_590030 ?auto_590039 ) ) ( not ( = ?auto_590030 ?auto_590040 ) ) ( not ( = ?auto_590030 ?auto_590041 ) ) ( not ( = ?auto_590031 ?auto_590032 ) ) ( not ( = ?auto_590031 ?auto_590033 ) ) ( not ( = ?auto_590031 ?auto_590034 ) ) ( not ( = ?auto_590031 ?auto_590035 ) ) ( not ( = ?auto_590031 ?auto_590036 ) ) ( not ( = ?auto_590031 ?auto_590037 ) ) ( not ( = ?auto_590031 ?auto_590038 ) ) ( not ( = ?auto_590031 ?auto_590039 ) ) ( not ( = ?auto_590031 ?auto_590040 ) ) ( not ( = ?auto_590031 ?auto_590041 ) ) ( not ( = ?auto_590032 ?auto_590033 ) ) ( not ( = ?auto_590032 ?auto_590034 ) ) ( not ( = ?auto_590032 ?auto_590035 ) ) ( not ( = ?auto_590032 ?auto_590036 ) ) ( not ( = ?auto_590032 ?auto_590037 ) ) ( not ( = ?auto_590032 ?auto_590038 ) ) ( not ( = ?auto_590032 ?auto_590039 ) ) ( not ( = ?auto_590032 ?auto_590040 ) ) ( not ( = ?auto_590032 ?auto_590041 ) ) ( not ( = ?auto_590033 ?auto_590034 ) ) ( not ( = ?auto_590033 ?auto_590035 ) ) ( not ( = ?auto_590033 ?auto_590036 ) ) ( not ( = ?auto_590033 ?auto_590037 ) ) ( not ( = ?auto_590033 ?auto_590038 ) ) ( not ( = ?auto_590033 ?auto_590039 ) ) ( not ( = ?auto_590033 ?auto_590040 ) ) ( not ( = ?auto_590033 ?auto_590041 ) ) ( not ( = ?auto_590034 ?auto_590035 ) ) ( not ( = ?auto_590034 ?auto_590036 ) ) ( not ( = ?auto_590034 ?auto_590037 ) ) ( not ( = ?auto_590034 ?auto_590038 ) ) ( not ( = ?auto_590034 ?auto_590039 ) ) ( not ( = ?auto_590034 ?auto_590040 ) ) ( not ( = ?auto_590034 ?auto_590041 ) ) ( not ( = ?auto_590035 ?auto_590036 ) ) ( not ( = ?auto_590035 ?auto_590037 ) ) ( not ( = ?auto_590035 ?auto_590038 ) ) ( not ( = ?auto_590035 ?auto_590039 ) ) ( not ( = ?auto_590035 ?auto_590040 ) ) ( not ( = ?auto_590035 ?auto_590041 ) ) ( not ( = ?auto_590036 ?auto_590037 ) ) ( not ( = ?auto_590036 ?auto_590038 ) ) ( not ( = ?auto_590036 ?auto_590039 ) ) ( not ( = ?auto_590036 ?auto_590040 ) ) ( not ( = ?auto_590036 ?auto_590041 ) ) ( not ( = ?auto_590037 ?auto_590038 ) ) ( not ( = ?auto_590037 ?auto_590039 ) ) ( not ( = ?auto_590037 ?auto_590040 ) ) ( not ( = ?auto_590037 ?auto_590041 ) ) ( not ( = ?auto_590038 ?auto_590039 ) ) ( not ( = ?auto_590038 ?auto_590040 ) ) ( not ( = ?auto_590038 ?auto_590041 ) ) ( not ( = ?auto_590039 ?auto_590040 ) ) ( not ( = ?auto_590039 ?auto_590041 ) ) ( not ( = ?auto_590040 ?auto_590041 ) ) ( ON ?auto_590040 ?auto_590041 ) ( ON ?auto_590039 ?auto_590040 ) ( ON ?auto_590038 ?auto_590039 ) ( ON ?auto_590037 ?auto_590038 ) ( ON ?auto_590036 ?auto_590037 ) ( ON ?auto_590035 ?auto_590036 ) ( ON ?auto_590034 ?auto_590035 ) ( ON ?auto_590033 ?auto_590034 ) ( ON ?auto_590032 ?auto_590033 ) ( CLEAR ?auto_590030 ) ( ON ?auto_590031 ?auto_590032 ) ( CLEAR ?auto_590031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_590026 ?auto_590027 ?auto_590028 ?auto_590029 ?auto_590030 ?auto_590031 )
      ( MAKE-16PILE ?auto_590026 ?auto_590027 ?auto_590028 ?auto_590029 ?auto_590030 ?auto_590031 ?auto_590032 ?auto_590033 ?auto_590034 ?auto_590035 ?auto_590036 ?auto_590037 ?auto_590038 ?auto_590039 ?auto_590040 ?auto_590041 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_590058 - BLOCK
      ?auto_590059 - BLOCK
      ?auto_590060 - BLOCK
      ?auto_590061 - BLOCK
      ?auto_590062 - BLOCK
      ?auto_590063 - BLOCK
      ?auto_590064 - BLOCK
      ?auto_590065 - BLOCK
      ?auto_590066 - BLOCK
      ?auto_590067 - BLOCK
      ?auto_590068 - BLOCK
      ?auto_590069 - BLOCK
      ?auto_590070 - BLOCK
      ?auto_590071 - BLOCK
      ?auto_590072 - BLOCK
      ?auto_590073 - BLOCK
    )
    :vars
    (
      ?auto_590074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590073 ?auto_590074 ) ( ON-TABLE ?auto_590058 ) ( ON ?auto_590059 ?auto_590058 ) ( ON ?auto_590060 ?auto_590059 ) ( ON ?auto_590061 ?auto_590060 ) ( not ( = ?auto_590058 ?auto_590059 ) ) ( not ( = ?auto_590058 ?auto_590060 ) ) ( not ( = ?auto_590058 ?auto_590061 ) ) ( not ( = ?auto_590058 ?auto_590062 ) ) ( not ( = ?auto_590058 ?auto_590063 ) ) ( not ( = ?auto_590058 ?auto_590064 ) ) ( not ( = ?auto_590058 ?auto_590065 ) ) ( not ( = ?auto_590058 ?auto_590066 ) ) ( not ( = ?auto_590058 ?auto_590067 ) ) ( not ( = ?auto_590058 ?auto_590068 ) ) ( not ( = ?auto_590058 ?auto_590069 ) ) ( not ( = ?auto_590058 ?auto_590070 ) ) ( not ( = ?auto_590058 ?auto_590071 ) ) ( not ( = ?auto_590058 ?auto_590072 ) ) ( not ( = ?auto_590058 ?auto_590073 ) ) ( not ( = ?auto_590058 ?auto_590074 ) ) ( not ( = ?auto_590059 ?auto_590060 ) ) ( not ( = ?auto_590059 ?auto_590061 ) ) ( not ( = ?auto_590059 ?auto_590062 ) ) ( not ( = ?auto_590059 ?auto_590063 ) ) ( not ( = ?auto_590059 ?auto_590064 ) ) ( not ( = ?auto_590059 ?auto_590065 ) ) ( not ( = ?auto_590059 ?auto_590066 ) ) ( not ( = ?auto_590059 ?auto_590067 ) ) ( not ( = ?auto_590059 ?auto_590068 ) ) ( not ( = ?auto_590059 ?auto_590069 ) ) ( not ( = ?auto_590059 ?auto_590070 ) ) ( not ( = ?auto_590059 ?auto_590071 ) ) ( not ( = ?auto_590059 ?auto_590072 ) ) ( not ( = ?auto_590059 ?auto_590073 ) ) ( not ( = ?auto_590059 ?auto_590074 ) ) ( not ( = ?auto_590060 ?auto_590061 ) ) ( not ( = ?auto_590060 ?auto_590062 ) ) ( not ( = ?auto_590060 ?auto_590063 ) ) ( not ( = ?auto_590060 ?auto_590064 ) ) ( not ( = ?auto_590060 ?auto_590065 ) ) ( not ( = ?auto_590060 ?auto_590066 ) ) ( not ( = ?auto_590060 ?auto_590067 ) ) ( not ( = ?auto_590060 ?auto_590068 ) ) ( not ( = ?auto_590060 ?auto_590069 ) ) ( not ( = ?auto_590060 ?auto_590070 ) ) ( not ( = ?auto_590060 ?auto_590071 ) ) ( not ( = ?auto_590060 ?auto_590072 ) ) ( not ( = ?auto_590060 ?auto_590073 ) ) ( not ( = ?auto_590060 ?auto_590074 ) ) ( not ( = ?auto_590061 ?auto_590062 ) ) ( not ( = ?auto_590061 ?auto_590063 ) ) ( not ( = ?auto_590061 ?auto_590064 ) ) ( not ( = ?auto_590061 ?auto_590065 ) ) ( not ( = ?auto_590061 ?auto_590066 ) ) ( not ( = ?auto_590061 ?auto_590067 ) ) ( not ( = ?auto_590061 ?auto_590068 ) ) ( not ( = ?auto_590061 ?auto_590069 ) ) ( not ( = ?auto_590061 ?auto_590070 ) ) ( not ( = ?auto_590061 ?auto_590071 ) ) ( not ( = ?auto_590061 ?auto_590072 ) ) ( not ( = ?auto_590061 ?auto_590073 ) ) ( not ( = ?auto_590061 ?auto_590074 ) ) ( not ( = ?auto_590062 ?auto_590063 ) ) ( not ( = ?auto_590062 ?auto_590064 ) ) ( not ( = ?auto_590062 ?auto_590065 ) ) ( not ( = ?auto_590062 ?auto_590066 ) ) ( not ( = ?auto_590062 ?auto_590067 ) ) ( not ( = ?auto_590062 ?auto_590068 ) ) ( not ( = ?auto_590062 ?auto_590069 ) ) ( not ( = ?auto_590062 ?auto_590070 ) ) ( not ( = ?auto_590062 ?auto_590071 ) ) ( not ( = ?auto_590062 ?auto_590072 ) ) ( not ( = ?auto_590062 ?auto_590073 ) ) ( not ( = ?auto_590062 ?auto_590074 ) ) ( not ( = ?auto_590063 ?auto_590064 ) ) ( not ( = ?auto_590063 ?auto_590065 ) ) ( not ( = ?auto_590063 ?auto_590066 ) ) ( not ( = ?auto_590063 ?auto_590067 ) ) ( not ( = ?auto_590063 ?auto_590068 ) ) ( not ( = ?auto_590063 ?auto_590069 ) ) ( not ( = ?auto_590063 ?auto_590070 ) ) ( not ( = ?auto_590063 ?auto_590071 ) ) ( not ( = ?auto_590063 ?auto_590072 ) ) ( not ( = ?auto_590063 ?auto_590073 ) ) ( not ( = ?auto_590063 ?auto_590074 ) ) ( not ( = ?auto_590064 ?auto_590065 ) ) ( not ( = ?auto_590064 ?auto_590066 ) ) ( not ( = ?auto_590064 ?auto_590067 ) ) ( not ( = ?auto_590064 ?auto_590068 ) ) ( not ( = ?auto_590064 ?auto_590069 ) ) ( not ( = ?auto_590064 ?auto_590070 ) ) ( not ( = ?auto_590064 ?auto_590071 ) ) ( not ( = ?auto_590064 ?auto_590072 ) ) ( not ( = ?auto_590064 ?auto_590073 ) ) ( not ( = ?auto_590064 ?auto_590074 ) ) ( not ( = ?auto_590065 ?auto_590066 ) ) ( not ( = ?auto_590065 ?auto_590067 ) ) ( not ( = ?auto_590065 ?auto_590068 ) ) ( not ( = ?auto_590065 ?auto_590069 ) ) ( not ( = ?auto_590065 ?auto_590070 ) ) ( not ( = ?auto_590065 ?auto_590071 ) ) ( not ( = ?auto_590065 ?auto_590072 ) ) ( not ( = ?auto_590065 ?auto_590073 ) ) ( not ( = ?auto_590065 ?auto_590074 ) ) ( not ( = ?auto_590066 ?auto_590067 ) ) ( not ( = ?auto_590066 ?auto_590068 ) ) ( not ( = ?auto_590066 ?auto_590069 ) ) ( not ( = ?auto_590066 ?auto_590070 ) ) ( not ( = ?auto_590066 ?auto_590071 ) ) ( not ( = ?auto_590066 ?auto_590072 ) ) ( not ( = ?auto_590066 ?auto_590073 ) ) ( not ( = ?auto_590066 ?auto_590074 ) ) ( not ( = ?auto_590067 ?auto_590068 ) ) ( not ( = ?auto_590067 ?auto_590069 ) ) ( not ( = ?auto_590067 ?auto_590070 ) ) ( not ( = ?auto_590067 ?auto_590071 ) ) ( not ( = ?auto_590067 ?auto_590072 ) ) ( not ( = ?auto_590067 ?auto_590073 ) ) ( not ( = ?auto_590067 ?auto_590074 ) ) ( not ( = ?auto_590068 ?auto_590069 ) ) ( not ( = ?auto_590068 ?auto_590070 ) ) ( not ( = ?auto_590068 ?auto_590071 ) ) ( not ( = ?auto_590068 ?auto_590072 ) ) ( not ( = ?auto_590068 ?auto_590073 ) ) ( not ( = ?auto_590068 ?auto_590074 ) ) ( not ( = ?auto_590069 ?auto_590070 ) ) ( not ( = ?auto_590069 ?auto_590071 ) ) ( not ( = ?auto_590069 ?auto_590072 ) ) ( not ( = ?auto_590069 ?auto_590073 ) ) ( not ( = ?auto_590069 ?auto_590074 ) ) ( not ( = ?auto_590070 ?auto_590071 ) ) ( not ( = ?auto_590070 ?auto_590072 ) ) ( not ( = ?auto_590070 ?auto_590073 ) ) ( not ( = ?auto_590070 ?auto_590074 ) ) ( not ( = ?auto_590071 ?auto_590072 ) ) ( not ( = ?auto_590071 ?auto_590073 ) ) ( not ( = ?auto_590071 ?auto_590074 ) ) ( not ( = ?auto_590072 ?auto_590073 ) ) ( not ( = ?auto_590072 ?auto_590074 ) ) ( not ( = ?auto_590073 ?auto_590074 ) ) ( ON ?auto_590072 ?auto_590073 ) ( ON ?auto_590071 ?auto_590072 ) ( ON ?auto_590070 ?auto_590071 ) ( ON ?auto_590069 ?auto_590070 ) ( ON ?auto_590068 ?auto_590069 ) ( ON ?auto_590067 ?auto_590068 ) ( ON ?auto_590066 ?auto_590067 ) ( ON ?auto_590065 ?auto_590066 ) ( ON ?auto_590064 ?auto_590065 ) ( ON ?auto_590063 ?auto_590064 ) ( CLEAR ?auto_590061 ) ( ON ?auto_590062 ?auto_590063 ) ( CLEAR ?auto_590062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_590058 ?auto_590059 ?auto_590060 ?auto_590061 ?auto_590062 )
      ( MAKE-16PILE ?auto_590058 ?auto_590059 ?auto_590060 ?auto_590061 ?auto_590062 ?auto_590063 ?auto_590064 ?auto_590065 ?auto_590066 ?auto_590067 ?auto_590068 ?auto_590069 ?auto_590070 ?auto_590071 ?auto_590072 ?auto_590073 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_590091 - BLOCK
      ?auto_590092 - BLOCK
      ?auto_590093 - BLOCK
      ?auto_590094 - BLOCK
      ?auto_590095 - BLOCK
      ?auto_590096 - BLOCK
      ?auto_590097 - BLOCK
      ?auto_590098 - BLOCK
      ?auto_590099 - BLOCK
      ?auto_590100 - BLOCK
      ?auto_590101 - BLOCK
      ?auto_590102 - BLOCK
      ?auto_590103 - BLOCK
      ?auto_590104 - BLOCK
      ?auto_590105 - BLOCK
      ?auto_590106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_590106 ) ( ON-TABLE ?auto_590091 ) ( ON ?auto_590092 ?auto_590091 ) ( ON ?auto_590093 ?auto_590092 ) ( ON ?auto_590094 ?auto_590093 ) ( not ( = ?auto_590091 ?auto_590092 ) ) ( not ( = ?auto_590091 ?auto_590093 ) ) ( not ( = ?auto_590091 ?auto_590094 ) ) ( not ( = ?auto_590091 ?auto_590095 ) ) ( not ( = ?auto_590091 ?auto_590096 ) ) ( not ( = ?auto_590091 ?auto_590097 ) ) ( not ( = ?auto_590091 ?auto_590098 ) ) ( not ( = ?auto_590091 ?auto_590099 ) ) ( not ( = ?auto_590091 ?auto_590100 ) ) ( not ( = ?auto_590091 ?auto_590101 ) ) ( not ( = ?auto_590091 ?auto_590102 ) ) ( not ( = ?auto_590091 ?auto_590103 ) ) ( not ( = ?auto_590091 ?auto_590104 ) ) ( not ( = ?auto_590091 ?auto_590105 ) ) ( not ( = ?auto_590091 ?auto_590106 ) ) ( not ( = ?auto_590092 ?auto_590093 ) ) ( not ( = ?auto_590092 ?auto_590094 ) ) ( not ( = ?auto_590092 ?auto_590095 ) ) ( not ( = ?auto_590092 ?auto_590096 ) ) ( not ( = ?auto_590092 ?auto_590097 ) ) ( not ( = ?auto_590092 ?auto_590098 ) ) ( not ( = ?auto_590092 ?auto_590099 ) ) ( not ( = ?auto_590092 ?auto_590100 ) ) ( not ( = ?auto_590092 ?auto_590101 ) ) ( not ( = ?auto_590092 ?auto_590102 ) ) ( not ( = ?auto_590092 ?auto_590103 ) ) ( not ( = ?auto_590092 ?auto_590104 ) ) ( not ( = ?auto_590092 ?auto_590105 ) ) ( not ( = ?auto_590092 ?auto_590106 ) ) ( not ( = ?auto_590093 ?auto_590094 ) ) ( not ( = ?auto_590093 ?auto_590095 ) ) ( not ( = ?auto_590093 ?auto_590096 ) ) ( not ( = ?auto_590093 ?auto_590097 ) ) ( not ( = ?auto_590093 ?auto_590098 ) ) ( not ( = ?auto_590093 ?auto_590099 ) ) ( not ( = ?auto_590093 ?auto_590100 ) ) ( not ( = ?auto_590093 ?auto_590101 ) ) ( not ( = ?auto_590093 ?auto_590102 ) ) ( not ( = ?auto_590093 ?auto_590103 ) ) ( not ( = ?auto_590093 ?auto_590104 ) ) ( not ( = ?auto_590093 ?auto_590105 ) ) ( not ( = ?auto_590093 ?auto_590106 ) ) ( not ( = ?auto_590094 ?auto_590095 ) ) ( not ( = ?auto_590094 ?auto_590096 ) ) ( not ( = ?auto_590094 ?auto_590097 ) ) ( not ( = ?auto_590094 ?auto_590098 ) ) ( not ( = ?auto_590094 ?auto_590099 ) ) ( not ( = ?auto_590094 ?auto_590100 ) ) ( not ( = ?auto_590094 ?auto_590101 ) ) ( not ( = ?auto_590094 ?auto_590102 ) ) ( not ( = ?auto_590094 ?auto_590103 ) ) ( not ( = ?auto_590094 ?auto_590104 ) ) ( not ( = ?auto_590094 ?auto_590105 ) ) ( not ( = ?auto_590094 ?auto_590106 ) ) ( not ( = ?auto_590095 ?auto_590096 ) ) ( not ( = ?auto_590095 ?auto_590097 ) ) ( not ( = ?auto_590095 ?auto_590098 ) ) ( not ( = ?auto_590095 ?auto_590099 ) ) ( not ( = ?auto_590095 ?auto_590100 ) ) ( not ( = ?auto_590095 ?auto_590101 ) ) ( not ( = ?auto_590095 ?auto_590102 ) ) ( not ( = ?auto_590095 ?auto_590103 ) ) ( not ( = ?auto_590095 ?auto_590104 ) ) ( not ( = ?auto_590095 ?auto_590105 ) ) ( not ( = ?auto_590095 ?auto_590106 ) ) ( not ( = ?auto_590096 ?auto_590097 ) ) ( not ( = ?auto_590096 ?auto_590098 ) ) ( not ( = ?auto_590096 ?auto_590099 ) ) ( not ( = ?auto_590096 ?auto_590100 ) ) ( not ( = ?auto_590096 ?auto_590101 ) ) ( not ( = ?auto_590096 ?auto_590102 ) ) ( not ( = ?auto_590096 ?auto_590103 ) ) ( not ( = ?auto_590096 ?auto_590104 ) ) ( not ( = ?auto_590096 ?auto_590105 ) ) ( not ( = ?auto_590096 ?auto_590106 ) ) ( not ( = ?auto_590097 ?auto_590098 ) ) ( not ( = ?auto_590097 ?auto_590099 ) ) ( not ( = ?auto_590097 ?auto_590100 ) ) ( not ( = ?auto_590097 ?auto_590101 ) ) ( not ( = ?auto_590097 ?auto_590102 ) ) ( not ( = ?auto_590097 ?auto_590103 ) ) ( not ( = ?auto_590097 ?auto_590104 ) ) ( not ( = ?auto_590097 ?auto_590105 ) ) ( not ( = ?auto_590097 ?auto_590106 ) ) ( not ( = ?auto_590098 ?auto_590099 ) ) ( not ( = ?auto_590098 ?auto_590100 ) ) ( not ( = ?auto_590098 ?auto_590101 ) ) ( not ( = ?auto_590098 ?auto_590102 ) ) ( not ( = ?auto_590098 ?auto_590103 ) ) ( not ( = ?auto_590098 ?auto_590104 ) ) ( not ( = ?auto_590098 ?auto_590105 ) ) ( not ( = ?auto_590098 ?auto_590106 ) ) ( not ( = ?auto_590099 ?auto_590100 ) ) ( not ( = ?auto_590099 ?auto_590101 ) ) ( not ( = ?auto_590099 ?auto_590102 ) ) ( not ( = ?auto_590099 ?auto_590103 ) ) ( not ( = ?auto_590099 ?auto_590104 ) ) ( not ( = ?auto_590099 ?auto_590105 ) ) ( not ( = ?auto_590099 ?auto_590106 ) ) ( not ( = ?auto_590100 ?auto_590101 ) ) ( not ( = ?auto_590100 ?auto_590102 ) ) ( not ( = ?auto_590100 ?auto_590103 ) ) ( not ( = ?auto_590100 ?auto_590104 ) ) ( not ( = ?auto_590100 ?auto_590105 ) ) ( not ( = ?auto_590100 ?auto_590106 ) ) ( not ( = ?auto_590101 ?auto_590102 ) ) ( not ( = ?auto_590101 ?auto_590103 ) ) ( not ( = ?auto_590101 ?auto_590104 ) ) ( not ( = ?auto_590101 ?auto_590105 ) ) ( not ( = ?auto_590101 ?auto_590106 ) ) ( not ( = ?auto_590102 ?auto_590103 ) ) ( not ( = ?auto_590102 ?auto_590104 ) ) ( not ( = ?auto_590102 ?auto_590105 ) ) ( not ( = ?auto_590102 ?auto_590106 ) ) ( not ( = ?auto_590103 ?auto_590104 ) ) ( not ( = ?auto_590103 ?auto_590105 ) ) ( not ( = ?auto_590103 ?auto_590106 ) ) ( not ( = ?auto_590104 ?auto_590105 ) ) ( not ( = ?auto_590104 ?auto_590106 ) ) ( not ( = ?auto_590105 ?auto_590106 ) ) ( ON ?auto_590105 ?auto_590106 ) ( ON ?auto_590104 ?auto_590105 ) ( ON ?auto_590103 ?auto_590104 ) ( ON ?auto_590102 ?auto_590103 ) ( ON ?auto_590101 ?auto_590102 ) ( ON ?auto_590100 ?auto_590101 ) ( ON ?auto_590099 ?auto_590100 ) ( ON ?auto_590098 ?auto_590099 ) ( ON ?auto_590097 ?auto_590098 ) ( ON ?auto_590096 ?auto_590097 ) ( CLEAR ?auto_590094 ) ( ON ?auto_590095 ?auto_590096 ) ( CLEAR ?auto_590095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_590091 ?auto_590092 ?auto_590093 ?auto_590094 ?auto_590095 )
      ( MAKE-16PILE ?auto_590091 ?auto_590092 ?auto_590093 ?auto_590094 ?auto_590095 ?auto_590096 ?auto_590097 ?auto_590098 ?auto_590099 ?auto_590100 ?auto_590101 ?auto_590102 ?auto_590103 ?auto_590104 ?auto_590105 ?auto_590106 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_590123 - BLOCK
      ?auto_590124 - BLOCK
      ?auto_590125 - BLOCK
      ?auto_590126 - BLOCK
      ?auto_590127 - BLOCK
      ?auto_590128 - BLOCK
      ?auto_590129 - BLOCK
      ?auto_590130 - BLOCK
      ?auto_590131 - BLOCK
      ?auto_590132 - BLOCK
      ?auto_590133 - BLOCK
      ?auto_590134 - BLOCK
      ?auto_590135 - BLOCK
      ?auto_590136 - BLOCK
      ?auto_590137 - BLOCK
      ?auto_590138 - BLOCK
    )
    :vars
    (
      ?auto_590139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590138 ?auto_590139 ) ( ON-TABLE ?auto_590123 ) ( ON ?auto_590124 ?auto_590123 ) ( ON ?auto_590125 ?auto_590124 ) ( not ( = ?auto_590123 ?auto_590124 ) ) ( not ( = ?auto_590123 ?auto_590125 ) ) ( not ( = ?auto_590123 ?auto_590126 ) ) ( not ( = ?auto_590123 ?auto_590127 ) ) ( not ( = ?auto_590123 ?auto_590128 ) ) ( not ( = ?auto_590123 ?auto_590129 ) ) ( not ( = ?auto_590123 ?auto_590130 ) ) ( not ( = ?auto_590123 ?auto_590131 ) ) ( not ( = ?auto_590123 ?auto_590132 ) ) ( not ( = ?auto_590123 ?auto_590133 ) ) ( not ( = ?auto_590123 ?auto_590134 ) ) ( not ( = ?auto_590123 ?auto_590135 ) ) ( not ( = ?auto_590123 ?auto_590136 ) ) ( not ( = ?auto_590123 ?auto_590137 ) ) ( not ( = ?auto_590123 ?auto_590138 ) ) ( not ( = ?auto_590123 ?auto_590139 ) ) ( not ( = ?auto_590124 ?auto_590125 ) ) ( not ( = ?auto_590124 ?auto_590126 ) ) ( not ( = ?auto_590124 ?auto_590127 ) ) ( not ( = ?auto_590124 ?auto_590128 ) ) ( not ( = ?auto_590124 ?auto_590129 ) ) ( not ( = ?auto_590124 ?auto_590130 ) ) ( not ( = ?auto_590124 ?auto_590131 ) ) ( not ( = ?auto_590124 ?auto_590132 ) ) ( not ( = ?auto_590124 ?auto_590133 ) ) ( not ( = ?auto_590124 ?auto_590134 ) ) ( not ( = ?auto_590124 ?auto_590135 ) ) ( not ( = ?auto_590124 ?auto_590136 ) ) ( not ( = ?auto_590124 ?auto_590137 ) ) ( not ( = ?auto_590124 ?auto_590138 ) ) ( not ( = ?auto_590124 ?auto_590139 ) ) ( not ( = ?auto_590125 ?auto_590126 ) ) ( not ( = ?auto_590125 ?auto_590127 ) ) ( not ( = ?auto_590125 ?auto_590128 ) ) ( not ( = ?auto_590125 ?auto_590129 ) ) ( not ( = ?auto_590125 ?auto_590130 ) ) ( not ( = ?auto_590125 ?auto_590131 ) ) ( not ( = ?auto_590125 ?auto_590132 ) ) ( not ( = ?auto_590125 ?auto_590133 ) ) ( not ( = ?auto_590125 ?auto_590134 ) ) ( not ( = ?auto_590125 ?auto_590135 ) ) ( not ( = ?auto_590125 ?auto_590136 ) ) ( not ( = ?auto_590125 ?auto_590137 ) ) ( not ( = ?auto_590125 ?auto_590138 ) ) ( not ( = ?auto_590125 ?auto_590139 ) ) ( not ( = ?auto_590126 ?auto_590127 ) ) ( not ( = ?auto_590126 ?auto_590128 ) ) ( not ( = ?auto_590126 ?auto_590129 ) ) ( not ( = ?auto_590126 ?auto_590130 ) ) ( not ( = ?auto_590126 ?auto_590131 ) ) ( not ( = ?auto_590126 ?auto_590132 ) ) ( not ( = ?auto_590126 ?auto_590133 ) ) ( not ( = ?auto_590126 ?auto_590134 ) ) ( not ( = ?auto_590126 ?auto_590135 ) ) ( not ( = ?auto_590126 ?auto_590136 ) ) ( not ( = ?auto_590126 ?auto_590137 ) ) ( not ( = ?auto_590126 ?auto_590138 ) ) ( not ( = ?auto_590126 ?auto_590139 ) ) ( not ( = ?auto_590127 ?auto_590128 ) ) ( not ( = ?auto_590127 ?auto_590129 ) ) ( not ( = ?auto_590127 ?auto_590130 ) ) ( not ( = ?auto_590127 ?auto_590131 ) ) ( not ( = ?auto_590127 ?auto_590132 ) ) ( not ( = ?auto_590127 ?auto_590133 ) ) ( not ( = ?auto_590127 ?auto_590134 ) ) ( not ( = ?auto_590127 ?auto_590135 ) ) ( not ( = ?auto_590127 ?auto_590136 ) ) ( not ( = ?auto_590127 ?auto_590137 ) ) ( not ( = ?auto_590127 ?auto_590138 ) ) ( not ( = ?auto_590127 ?auto_590139 ) ) ( not ( = ?auto_590128 ?auto_590129 ) ) ( not ( = ?auto_590128 ?auto_590130 ) ) ( not ( = ?auto_590128 ?auto_590131 ) ) ( not ( = ?auto_590128 ?auto_590132 ) ) ( not ( = ?auto_590128 ?auto_590133 ) ) ( not ( = ?auto_590128 ?auto_590134 ) ) ( not ( = ?auto_590128 ?auto_590135 ) ) ( not ( = ?auto_590128 ?auto_590136 ) ) ( not ( = ?auto_590128 ?auto_590137 ) ) ( not ( = ?auto_590128 ?auto_590138 ) ) ( not ( = ?auto_590128 ?auto_590139 ) ) ( not ( = ?auto_590129 ?auto_590130 ) ) ( not ( = ?auto_590129 ?auto_590131 ) ) ( not ( = ?auto_590129 ?auto_590132 ) ) ( not ( = ?auto_590129 ?auto_590133 ) ) ( not ( = ?auto_590129 ?auto_590134 ) ) ( not ( = ?auto_590129 ?auto_590135 ) ) ( not ( = ?auto_590129 ?auto_590136 ) ) ( not ( = ?auto_590129 ?auto_590137 ) ) ( not ( = ?auto_590129 ?auto_590138 ) ) ( not ( = ?auto_590129 ?auto_590139 ) ) ( not ( = ?auto_590130 ?auto_590131 ) ) ( not ( = ?auto_590130 ?auto_590132 ) ) ( not ( = ?auto_590130 ?auto_590133 ) ) ( not ( = ?auto_590130 ?auto_590134 ) ) ( not ( = ?auto_590130 ?auto_590135 ) ) ( not ( = ?auto_590130 ?auto_590136 ) ) ( not ( = ?auto_590130 ?auto_590137 ) ) ( not ( = ?auto_590130 ?auto_590138 ) ) ( not ( = ?auto_590130 ?auto_590139 ) ) ( not ( = ?auto_590131 ?auto_590132 ) ) ( not ( = ?auto_590131 ?auto_590133 ) ) ( not ( = ?auto_590131 ?auto_590134 ) ) ( not ( = ?auto_590131 ?auto_590135 ) ) ( not ( = ?auto_590131 ?auto_590136 ) ) ( not ( = ?auto_590131 ?auto_590137 ) ) ( not ( = ?auto_590131 ?auto_590138 ) ) ( not ( = ?auto_590131 ?auto_590139 ) ) ( not ( = ?auto_590132 ?auto_590133 ) ) ( not ( = ?auto_590132 ?auto_590134 ) ) ( not ( = ?auto_590132 ?auto_590135 ) ) ( not ( = ?auto_590132 ?auto_590136 ) ) ( not ( = ?auto_590132 ?auto_590137 ) ) ( not ( = ?auto_590132 ?auto_590138 ) ) ( not ( = ?auto_590132 ?auto_590139 ) ) ( not ( = ?auto_590133 ?auto_590134 ) ) ( not ( = ?auto_590133 ?auto_590135 ) ) ( not ( = ?auto_590133 ?auto_590136 ) ) ( not ( = ?auto_590133 ?auto_590137 ) ) ( not ( = ?auto_590133 ?auto_590138 ) ) ( not ( = ?auto_590133 ?auto_590139 ) ) ( not ( = ?auto_590134 ?auto_590135 ) ) ( not ( = ?auto_590134 ?auto_590136 ) ) ( not ( = ?auto_590134 ?auto_590137 ) ) ( not ( = ?auto_590134 ?auto_590138 ) ) ( not ( = ?auto_590134 ?auto_590139 ) ) ( not ( = ?auto_590135 ?auto_590136 ) ) ( not ( = ?auto_590135 ?auto_590137 ) ) ( not ( = ?auto_590135 ?auto_590138 ) ) ( not ( = ?auto_590135 ?auto_590139 ) ) ( not ( = ?auto_590136 ?auto_590137 ) ) ( not ( = ?auto_590136 ?auto_590138 ) ) ( not ( = ?auto_590136 ?auto_590139 ) ) ( not ( = ?auto_590137 ?auto_590138 ) ) ( not ( = ?auto_590137 ?auto_590139 ) ) ( not ( = ?auto_590138 ?auto_590139 ) ) ( ON ?auto_590137 ?auto_590138 ) ( ON ?auto_590136 ?auto_590137 ) ( ON ?auto_590135 ?auto_590136 ) ( ON ?auto_590134 ?auto_590135 ) ( ON ?auto_590133 ?auto_590134 ) ( ON ?auto_590132 ?auto_590133 ) ( ON ?auto_590131 ?auto_590132 ) ( ON ?auto_590130 ?auto_590131 ) ( ON ?auto_590129 ?auto_590130 ) ( ON ?auto_590128 ?auto_590129 ) ( ON ?auto_590127 ?auto_590128 ) ( CLEAR ?auto_590125 ) ( ON ?auto_590126 ?auto_590127 ) ( CLEAR ?auto_590126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_590123 ?auto_590124 ?auto_590125 ?auto_590126 )
      ( MAKE-16PILE ?auto_590123 ?auto_590124 ?auto_590125 ?auto_590126 ?auto_590127 ?auto_590128 ?auto_590129 ?auto_590130 ?auto_590131 ?auto_590132 ?auto_590133 ?auto_590134 ?auto_590135 ?auto_590136 ?auto_590137 ?auto_590138 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_590156 - BLOCK
      ?auto_590157 - BLOCK
      ?auto_590158 - BLOCK
      ?auto_590159 - BLOCK
      ?auto_590160 - BLOCK
      ?auto_590161 - BLOCK
      ?auto_590162 - BLOCK
      ?auto_590163 - BLOCK
      ?auto_590164 - BLOCK
      ?auto_590165 - BLOCK
      ?auto_590166 - BLOCK
      ?auto_590167 - BLOCK
      ?auto_590168 - BLOCK
      ?auto_590169 - BLOCK
      ?auto_590170 - BLOCK
      ?auto_590171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_590171 ) ( ON-TABLE ?auto_590156 ) ( ON ?auto_590157 ?auto_590156 ) ( ON ?auto_590158 ?auto_590157 ) ( not ( = ?auto_590156 ?auto_590157 ) ) ( not ( = ?auto_590156 ?auto_590158 ) ) ( not ( = ?auto_590156 ?auto_590159 ) ) ( not ( = ?auto_590156 ?auto_590160 ) ) ( not ( = ?auto_590156 ?auto_590161 ) ) ( not ( = ?auto_590156 ?auto_590162 ) ) ( not ( = ?auto_590156 ?auto_590163 ) ) ( not ( = ?auto_590156 ?auto_590164 ) ) ( not ( = ?auto_590156 ?auto_590165 ) ) ( not ( = ?auto_590156 ?auto_590166 ) ) ( not ( = ?auto_590156 ?auto_590167 ) ) ( not ( = ?auto_590156 ?auto_590168 ) ) ( not ( = ?auto_590156 ?auto_590169 ) ) ( not ( = ?auto_590156 ?auto_590170 ) ) ( not ( = ?auto_590156 ?auto_590171 ) ) ( not ( = ?auto_590157 ?auto_590158 ) ) ( not ( = ?auto_590157 ?auto_590159 ) ) ( not ( = ?auto_590157 ?auto_590160 ) ) ( not ( = ?auto_590157 ?auto_590161 ) ) ( not ( = ?auto_590157 ?auto_590162 ) ) ( not ( = ?auto_590157 ?auto_590163 ) ) ( not ( = ?auto_590157 ?auto_590164 ) ) ( not ( = ?auto_590157 ?auto_590165 ) ) ( not ( = ?auto_590157 ?auto_590166 ) ) ( not ( = ?auto_590157 ?auto_590167 ) ) ( not ( = ?auto_590157 ?auto_590168 ) ) ( not ( = ?auto_590157 ?auto_590169 ) ) ( not ( = ?auto_590157 ?auto_590170 ) ) ( not ( = ?auto_590157 ?auto_590171 ) ) ( not ( = ?auto_590158 ?auto_590159 ) ) ( not ( = ?auto_590158 ?auto_590160 ) ) ( not ( = ?auto_590158 ?auto_590161 ) ) ( not ( = ?auto_590158 ?auto_590162 ) ) ( not ( = ?auto_590158 ?auto_590163 ) ) ( not ( = ?auto_590158 ?auto_590164 ) ) ( not ( = ?auto_590158 ?auto_590165 ) ) ( not ( = ?auto_590158 ?auto_590166 ) ) ( not ( = ?auto_590158 ?auto_590167 ) ) ( not ( = ?auto_590158 ?auto_590168 ) ) ( not ( = ?auto_590158 ?auto_590169 ) ) ( not ( = ?auto_590158 ?auto_590170 ) ) ( not ( = ?auto_590158 ?auto_590171 ) ) ( not ( = ?auto_590159 ?auto_590160 ) ) ( not ( = ?auto_590159 ?auto_590161 ) ) ( not ( = ?auto_590159 ?auto_590162 ) ) ( not ( = ?auto_590159 ?auto_590163 ) ) ( not ( = ?auto_590159 ?auto_590164 ) ) ( not ( = ?auto_590159 ?auto_590165 ) ) ( not ( = ?auto_590159 ?auto_590166 ) ) ( not ( = ?auto_590159 ?auto_590167 ) ) ( not ( = ?auto_590159 ?auto_590168 ) ) ( not ( = ?auto_590159 ?auto_590169 ) ) ( not ( = ?auto_590159 ?auto_590170 ) ) ( not ( = ?auto_590159 ?auto_590171 ) ) ( not ( = ?auto_590160 ?auto_590161 ) ) ( not ( = ?auto_590160 ?auto_590162 ) ) ( not ( = ?auto_590160 ?auto_590163 ) ) ( not ( = ?auto_590160 ?auto_590164 ) ) ( not ( = ?auto_590160 ?auto_590165 ) ) ( not ( = ?auto_590160 ?auto_590166 ) ) ( not ( = ?auto_590160 ?auto_590167 ) ) ( not ( = ?auto_590160 ?auto_590168 ) ) ( not ( = ?auto_590160 ?auto_590169 ) ) ( not ( = ?auto_590160 ?auto_590170 ) ) ( not ( = ?auto_590160 ?auto_590171 ) ) ( not ( = ?auto_590161 ?auto_590162 ) ) ( not ( = ?auto_590161 ?auto_590163 ) ) ( not ( = ?auto_590161 ?auto_590164 ) ) ( not ( = ?auto_590161 ?auto_590165 ) ) ( not ( = ?auto_590161 ?auto_590166 ) ) ( not ( = ?auto_590161 ?auto_590167 ) ) ( not ( = ?auto_590161 ?auto_590168 ) ) ( not ( = ?auto_590161 ?auto_590169 ) ) ( not ( = ?auto_590161 ?auto_590170 ) ) ( not ( = ?auto_590161 ?auto_590171 ) ) ( not ( = ?auto_590162 ?auto_590163 ) ) ( not ( = ?auto_590162 ?auto_590164 ) ) ( not ( = ?auto_590162 ?auto_590165 ) ) ( not ( = ?auto_590162 ?auto_590166 ) ) ( not ( = ?auto_590162 ?auto_590167 ) ) ( not ( = ?auto_590162 ?auto_590168 ) ) ( not ( = ?auto_590162 ?auto_590169 ) ) ( not ( = ?auto_590162 ?auto_590170 ) ) ( not ( = ?auto_590162 ?auto_590171 ) ) ( not ( = ?auto_590163 ?auto_590164 ) ) ( not ( = ?auto_590163 ?auto_590165 ) ) ( not ( = ?auto_590163 ?auto_590166 ) ) ( not ( = ?auto_590163 ?auto_590167 ) ) ( not ( = ?auto_590163 ?auto_590168 ) ) ( not ( = ?auto_590163 ?auto_590169 ) ) ( not ( = ?auto_590163 ?auto_590170 ) ) ( not ( = ?auto_590163 ?auto_590171 ) ) ( not ( = ?auto_590164 ?auto_590165 ) ) ( not ( = ?auto_590164 ?auto_590166 ) ) ( not ( = ?auto_590164 ?auto_590167 ) ) ( not ( = ?auto_590164 ?auto_590168 ) ) ( not ( = ?auto_590164 ?auto_590169 ) ) ( not ( = ?auto_590164 ?auto_590170 ) ) ( not ( = ?auto_590164 ?auto_590171 ) ) ( not ( = ?auto_590165 ?auto_590166 ) ) ( not ( = ?auto_590165 ?auto_590167 ) ) ( not ( = ?auto_590165 ?auto_590168 ) ) ( not ( = ?auto_590165 ?auto_590169 ) ) ( not ( = ?auto_590165 ?auto_590170 ) ) ( not ( = ?auto_590165 ?auto_590171 ) ) ( not ( = ?auto_590166 ?auto_590167 ) ) ( not ( = ?auto_590166 ?auto_590168 ) ) ( not ( = ?auto_590166 ?auto_590169 ) ) ( not ( = ?auto_590166 ?auto_590170 ) ) ( not ( = ?auto_590166 ?auto_590171 ) ) ( not ( = ?auto_590167 ?auto_590168 ) ) ( not ( = ?auto_590167 ?auto_590169 ) ) ( not ( = ?auto_590167 ?auto_590170 ) ) ( not ( = ?auto_590167 ?auto_590171 ) ) ( not ( = ?auto_590168 ?auto_590169 ) ) ( not ( = ?auto_590168 ?auto_590170 ) ) ( not ( = ?auto_590168 ?auto_590171 ) ) ( not ( = ?auto_590169 ?auto_590170 ) ) ( not ( = ?auto_590169 ?auto_590171 ) ) ( not ( = ?auto_590170 ?auto_590171 ) ) ( ON ?auto_590170 ?auto_590171 ) ( ON ?auto_590169 ?auto_590170 ) ( ON ?auto_590168 ?auto_590169 ) ( ON ?auto_590167 ?auto_590168 ) ( ON ?auto_590166 ?auto_590167 ) ( ON ?auto_590165 ?auto_590166 ) ( ON ?auto_590164 ?auto_590165 ) ( ON ?auto_590163 ?auto_590164 ) ( ON ?auto_590162 ?auto_590163 ) ( ON ?auto_590161 ?auto_590162 ) ( ON ?auto_590160 ?auto_590161 ) ( CLEAR ?auto_590158 ) ( ON ?auto_590159 ?auto_590160 ) ( CLEAR ?auto_590159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_590156 ?auto_590157 ?auto_590158 ?auto_590159 )
      ( MAKE-16PILE ?auto_590156 ?auto_590157 ?auto_590158 ?auto_590159 ?auto_590160 ?auto_590161 ?auto_590162 ?auto_590163 ?auto_590164 ?auto_590165 ?auto_590166 ?auto_590167 ?auto_590168 ?auto_590169 ?auto_590170 ?auto_590171 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_590188 - BLOCK
      ?auto_590189 - BLOCK
      ?auto_590190 - BLOCK
      ?auto_590191 - BLOCK
      ?auto_590192 - BLOCK
      ?auto_590193 - BLOCK
      ?auto_590194 - BLOCK
      ?auto_590195 - BLOCK
      ?auto_590196 - BLOCK
      ?auto_590197 - BLOCK
      ?auto_590198 - BLOCK
      ?auto_590199 - BLOCK
      ?auto_590200 - BLOCK
      ?auto_590201 - BLOCK
      ?auto_590202 - BLOCK
      ?auto_590203 - BLOCK
    )
    :vars
    (
      ?auto_590204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590203 ?auto_590204 ) ( ON-TABLE ?auto_590188 ) ( ON ?auto_590189 ?auto_590188 ) ( not ( = ?auto_590188 ?auto_590189 ) ) ( not ( = ?auto_590188 ?auto_590190 ) ) ( not ( = ?auto_590188 ?auto_590191 ) ) ( not ( = ?auto_590188 ?auto_590192 ) ) ( not ( = ?auto_590188 ?auto_590193 ) ) ( not ( = ?auto_590188 ?auto_590194 ) ) ( not ( = ?auto_590188 ?auto_590195 ) ) ( not ( = ?auto_590188 ?auto_590196 ) ) ( not ( = ?auto_590188 ?auto_590197 ) ) ( not ( = ?auto_590188 ?auto_590198 ) ) ( not ( = ?auto_590188 ?auto_590199 ) ) ( not ( = ?auto_590188 ?auto_590200 ) ) ( not ( = ?auto_590188 ?auto_590201 ) ) ( not ( = ?auto_590188 ?auto_590202 ) ) ( not ( = ?auto_590188 ?auto_590203 ) ) ( not ( = ?auto_590188 ?auto_590204 ) ) ( not ( = ?auto_590189 ?auto_590190 ) ) ( not ( = ?auto_590189 ?auto_590191 ) ) ( not ( = ?auto_590189 ?auto_590192 ) ) ( not ( = ?auto_590189 ?auto_590193 ) ) ( not ( = ?auto_590189 ?auto_590194 ) ) ( not ( = ?auto_590189 ?auto_590195 ) ) ( not ( = ?auto_590189 ?auto_590196 ) ) ( not ( = ?auto_590189 ?auto_590197 ) ) ( not ( = ?auto_590189 ?auto_590198 ) ) ( not ( = ?auto_590189 ?auto_590199 ) ) ( not ( = ?auto_590189 ?auto_590200 ) ) ( not ( = ?auto_590189 ?auto_590201 ) ) ( not ( = ?auto_590189 ?auto_590202 ) ) ( not ( = ?auto_590189 ?auto_590203 ) ) ( not ( = ?auto_590189 ?auto_590204 ) ) ( not ( = ?auto_590190 ?auto_590191 ) ) ( not ( = ?auto_590190 ?auto_590192 ) ) ( not ( = ?auto_590190 ?auto_590193 ) ) ( not ( = ?auto_590190 ?auto_590194 ) ) ( not ( = ?auto_590190 ?auto_590195 ) ) ( not ( = ?auto_590190 ?auto_590196 ) ) ( not ( = ?auto_590190 ?auto_590197 ) ) ( not ( = ?auto_590190 ?auto_590198 ) ) ( not ( = ?auto_590190 ?auto_590199 ) ) ( not ( = ?auto_590190 ?auto_590200 ) ) ( not ( = ?auto_590190 ?auto_590201 ) ) ( not ( = ?auto_590190 ?auto_590202 ) ) ( not ( = ?auto_590190 ?auto_590203 ) ) ( not ( = ?auto_590190 ?auto_590204 ) ) ( not ( = ?auto_590191 ?auto_590192 ) ) ( not ( = ?auto_590191 ?auto_590193 ) ) ( not ( = ?auto_590191 ?auto_590194 ) ) ( not ( = ?auto_590191 ?auto_590195 ) ) ( not ( = ?auto_590191 ?auto_590196 ) ) ( not ( = ?auto_590191 ?auto_590197 ) ) ( not ( = ?auto_590191 ?auto_590198 ) ) ( not ( = ?auto_590191 ?auto_590199 ) ) ( not ( = ?auto_590191 ?auto_590200 ) ) ( not ( = ?auto_590191 ?auto_590201 ) ) ( not ( = ?auto_590191 ?auto_590202 ) ) ( not ( = ?auto_590191 ?auto_590203 ) ) ( not ( = ?auto_590191 ?auto_590204 ) ) ( not ( = ?auto_590192 ?auto_590193 ) ) ( not ( = ?auto_590192 ?auto_590194 ) ) ( not ( = ?auto_590192 ?auto_590195 ) ) ( not ( = ?auto_590192 ?auto_590196 ) ) ( not ( = ?auto_590192 ?auto_590197 ) ) ( not ( = ?auto_590192 ?auto_590198 ) ) ( not ( = ?auto_590192 ?auto_590199 ) ) ( not ( = ?auto_590192 ?auto_590200 ) ) ( not ( = ?auto_590192 ?auto_590201 ) ) ( not ( = ?auto_590192 ?auto_590202 ) ) ( not ( = ?auto_590192 ?auto_590203 ) ) ( not ( = ?auto_590192 ?auto_590204 ) ) ( not ( = ?auto_590193 ?auto_590194 ) ) ( not ( = ?auto_590193 ?auto_590195 ) ) ( not ( = ?auto_590193 ?auto_590196 ) ) ( not ( = ?auto_590193 ?auto_590197 ) ) ( not ( = ?auto_590193 ?auto_590198 ) ) ( not ( = ?auto_590193 ?auto_590199 ) ) ( not ( = ?auto_590193 ?auto_590200 ) ) ( not ( = ?auto_590193 ?auto_590201 ) ) ( not ( = ?auto_590193 ?auto_590202 ) ) ( not ( = ?auto_590193 ?auto_590203 ) ) ( not ( = ?auto_590193 ?auto_590204 ) ) ( not ( = ?auto_590194 ?auto_590195 ) ) ( not ( = ?auto_590194 ?auto_590196 ) ) ( not ( = ?auto_590194 ?auto_590197 ) ) ( not ( = ?auto_590194 ?auto_590198 ) ) ( not ( = ?auto_590194 ?auto_590199 ) ) ( not ( = ?auto_590194 ?auto_590200 ) ) ( not ( = ?auto_590194 ?auto_590201 ) ) ( not ( = ?auto_590194 ?auto_590202 ) ) ( not ( = ?auto_590194 ?auto_590203 ) ) ( not ( = ?auto_590194 ?auto_590204 ) ) ( not ( = ?auto_590195 ?auto_590196 ) ) ( not ( = ?auto_590195 ?auto_590197 ) ) ( not ( = ?auto_590195 ?auto_590198 ) ) ( not ( = ?auto_590195 ?auto_590199 ) ) ( not ( = ?auto_590195 ?auto_590200 ) ) ( not ( = ?auto_590195 ?auto_590201 ) ) ( not ( = ?auto_590195 ?auto_590202 ) ) ( not ( = ?auto_590195 ?auto_590203 ) ) ( not ( = ?auto_590195 ?auto_590204 ) ) ( not ( = ?auto_590196 ?auto_590197 ) ) ( not ( = ?auto_590196 ?auto_590198 ) ) ( not ( = ?auto_590196 ?auto_590199 ) ) ( not ( = ?auto_590196 ?auto_590200 ) ) ( not ( = ?auto_590196 ?auto_590201 ) ) ( not ( = ?auto_590196 ?auto_590202 ) ) ( not ( = ?auto_590196 ?auto_590203 ) ) ( not ( = ?auto_590196 ?auto_590204 ) ) ( not ( = ?auto_590197 ?auto_590198 ) ) ( not ( = ?auto_590197 ?auto_590199 ) ) ( not ( = ?auto_590197 ?auto_590200 ) ) ( not ( = ?auto_590197 ?auto_590201 ) ) ( not ( = ?auto_590197 ?auto_590202 ) ) ( not ( = ?auto_590197 ?auto_590203 ) ) ( not ( = ?auto_590197 ?auto_590204 ) ) ( not ( = ?auto_590198 ?auto_590199 ) ) ( not ( = ?auto_590198 ?auto_590200 ) ) ( not ( = ?auto_590198 ?auto_590201 ) ) ( not ( = ?auto_590198 ?auto_590202 ) ) ( not ( = ?auto_590198 ?auto_590203 ) ) ( not ( = ?auto_590198 ?auto_590204 ) ) ( not ( = ?auto_590199 ?auto_590200 ) ) ( not ( = ?auto_590199 ?auto_590201 ) ) ( not ( = ?auto_590199 ?auto_590202 ) ) ( not ( = ?auto_590199 ?auto_590203 ) ) ( not ( = ?auto_590199 ?auto_590204 ) ) ( not ( = ?auto_590200 ?auto_590201 ) ) ( not ( = ?auto_590200 ?auto_590202 ) ) ( not ( = ?auto_590200 ?auto_590203 ) ) ( not ( = ?auto_590200 ?auto_590204 ) ) ( not ( = ?auto_590201 ?auto_590202 ) ) ( not ( = ?auto_590201 ?auto_590203 ) ) ( not ( = ?auto_590201 ?auto_590204 ) ) ( not ( = ?auto_590202 ?auto_590203 ) ) ( not ( = ?auto_590202 ?auto_590204 ) ) ( not ( = ?auto_590203 ?auto_590204 ) ) ( ON ?auto_590202 ?auto_590203 ) ( ON ?auto_590201 ?auto_590202 ) ( ON ?auto_590200 ?auto_590201 ) ( ON ?auto_590199 ?auto_590200 ) ( ON ?auto_590198 ?auto_590199 ) ( ON ?auto_590197 ?auto_590198 ) ( ON ?auto_590196 ?auto_590197 ) ( ON ?auto_590195 ?auto_590196 ) ( ON ?auto_590194 ?auto_590195 ) ( ON ?auto_590193 ?auto_590194 ) ( ON ?auto_590192 ?auto_590193 ) ( ON ?auto_590191 ?auto_590192 ) ( CLEAR ?auto_590189 ) ( ON ?auto_590190 ?auto_590191 ) ( CLEAR ?auto_590190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_590188 ?auto_590189 ?auto_590190 )
      ( MAKE-16PILE ?auto_590188 ?auto_590189 ?auto_590190 ?auto_590191 ?auto_590192 ?auto_590193 ?auto_590194 ?auto_590195 ?auto_590196 ?auto_590197 ?auto_590198 ?auto_590199 ?auto_590200 ?auto_590201 ?auto_590202 ?auto_590203 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_590221 - BLOCK
      ?auto_590222 - BLOCK
      ?auto_590223 - BLOCK
      ?auto_590224 - BLOCK
      ?auto_590225 - BLOCK
      ?auto_590226 - BLOCK
      ?auto_590227 - BLOCK
      ?auto_590228 - BLOCK
      ?auto_590229 - BLOCK
      ?auto_590230 - BLOCK
      ?auto_590231 - BLOCK
      ?auto_590232 - BLOCK
      ?auto_590233 - BLOCK
      ?auto_590234 - BLOCK
      ?auto_590235 - BLOCK
      ?auto_590236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_590236 ) ( ON-TABLE ?auto_590221 ) ( ON ?auto_590222 ?auto_590221 ) ( not ( = ?auto_590221 ?auto_590222 ) ) ( not ( = ?auto_590221 ?auto_590223 ) ) ( not ( = ?auto_590221 ?auto_590224 ) ) ( not ( = ?auto_590221 ?auto_590225 ) ) ( not ( = ?auto_590221 ?auto_590226 ) ) ( not ( = ?auto_590221 ?auto_590227 ) ) ( not ( = ?auto_590221 ?auto_590228 ) ) ( not ( = ?auto_590221 ?auto_590229 ) ) ( not ( = ?auto_590221 ?auto_590230 ) ) ( not ( = ?auto_590221 ?auto_590231 ) ) ( not ( = ?auto_590221 ?auto_590232 ) ) ( not ( = ?auto_590221 ?auto_590233 ) ) ( not ( = ?auto_590221 ?auto_590234 ) ) ( not ( = ?auto_590221 ?auto_590235 ) ) ( not ( = ?auto_590221 ?auto_590236 ) ) ( not ( = ?auto_590222 ?auto_590223 ) ) ( not ( = ?auto_590222 ?auto_590224 ) ) ( not ( = ?auto_590222 ?auto_590225 ) ) ( not ( = ?auto_590222 ?auto_590226 ) ) ( not ( = ?auto_590222 ?auto_590227 ) ) ( not ( = ?auto_590222 ?auto_590228 ) ) ( not ( = ?auto_590222 ?auto_590229 ) ) ( not ( = ?auto_590222 ?auto_590230 ) ) ( not ( = ?auto_590222 ?auto_590231 ) ) ( not ( = ?auto_590222 ?auto_590232 ) ) ( not ( = ?auto_590222 ?auto_590233 ) ) ( not ( = ?auto_590222 ?auto_590234 ) ) ( not ( = ?auto_590222 ?auto_590235 ) ) ( not ( = ?auto_590222 ?auto_590236 ) ) ( not ( = ?auto_590223 ?auto_590224 ) ) ( not ( = ?auto_590223 ?auto_590225 ) ) ( not ( = ?auto_590223 ?auto_590226 ) ) ( not ( = ?auto_590223 ?auto_590227 ) ) ( not ( = ?auto_590223 ?auto_590228 ) ) ( not ( = ?auto_590223 ?auto_590229 ) ) ( not ( = ?auto_590223 ?auto_590230 ) ) ( not ( = ?auto_590223 ?auto_590231 ) ) ( not ( = ?auto_590223 ?auto_590232 ) ) ( not ( = ?auto_590223 ?auto_590233 ) ) ( not ( = ?auto_590223 ?auto_590234 ) ) ( not ( = ?auto_590223 ?auto_590235 ) ) ( not ( = ?auto_590223 ?auto_590236 ) ) ( not ( = ?auto_590224 ?auto_590225 ) ) ( not ( = ?auto_590224 ?auto_590226 ) ) ( not ( = ?auto_590224 ?auto_590227 ) ) ( not ( = ?auto_590224 ?auto_590228 ) ) ( not ( = ?auto_590224 ?auto_590229 ) ) ( not ( = ?auto_590224 ?auto_590230 ) ) ( not ( = ?auto_590224 ?auto_590231 ) ) ( not ( = ?auto_590224 ?auto_590232 ) ) ( not ( = ?auto_590224 ?auto_590233 ) ) ( not ( = ?auto_590224 ?auto_590234 ) ) ( not ( = ?auto_590224 ?auto_590235 ) ) ( not ( = ?auto_590224 ?auto_590236 ) ) ( not ( = ?auto_590225 ?auto_590226 ) ) ( not ( = ?auto_590225 ?auto_590227 ) ) ( not ( = ?auto_590225 ?auto_590228 ) ) ( not ( = ?auto_590225 ?auto_590229 ) ) ( not ( = ?auto_590225 ?auto_590230 ) ) ( not ( = ?auto_590225 ?auto_590231 ) ) ( not ( = ?auto_590225 ?auto_590232 ) ) ( not ( = ?auto_590225 ?auto_590233 ) ) ( not ( = ?auto_590225 ?auto_590234 ) ) ( not ( = ?auto_590225 ?auto_590235 ) ) ( not ( = ?auto_590225 ?auto_590236 ) ) ( not ( = ?auto_590226 ?auto_590227 ) ) ( not ( = ?auto_590226 ?auto_590228 ) ) ( not ( = ?auto_590226 ?auto_590229 ) ) ( not ( = ?auto_590226 ?auto_590230 ) ) ( not ( = ?auto_590226 ?auto_590231 ) ) ( not ( = ?auto_590226 ?auto_590232 ) ) ( not ( = ?auto_590226 ?auto_590233 ) ) ( not ( = ?auto_590226 ?auto_590234 ) ) ( not ( = ?auto_590226 ?auto_590235 ) ) ( not ( = ?auto_590226 ?auto_590236 ) ) ( not ( = ?auto_590227 ?auto_590228 ) ) ( not ( = ?auto_590227 ?auto_590229 ) ) ( not ( = ?auto_590227 ?auto_590230 ) ) ( not ( = ?auto_590227 ?auto_590231 ) ) ( not ( = ?auto_590227 ?auto_590232 ) ) ( not ( = ?auto_590227 ?auto_590233 ) ) ( not ( = ?auto_590227 ?auto_590234 ) ) ( not ( = ?auto_590227 ?auto_590235 ) ) ( not ( = ?auto_590227 ?auto_590236 ) ) ( not ( = ?auto_590228 ?auto_590229 ) ) ( not ( = ?auto_590228 ?auto_590230 ) ) ( not ( = ?auto_590228 ?auto_590231 ) ) ( not ( = ?auto_590228 ?auto_590232 ) ) ( not ( = ?auto_590228 ?auto_590233 ) ) ( not ( = ?auto_590228 ?auto_590234 ) ) ( not ( = ?auto_590228 ?auto_590235 ) ) ( not ( = ?auto_590228 ?auto_590236 ) ) ( not ( = ?auto_590229 ?auto_590230 ) ) ( not ( = ?auto_590229 ?auto_590231 ) ) ( not ( = ?auto_590229 ?auto_590232 ) ) ( not ( = ?auto_590229 ?auto_590233 ) ) ( not ( = ?auto_590229 ?auto_590234 ) ) ( not ( = ?auto_590229 ?auto_590235 ) ) ( not ( = ?auto_590229 ?auto_590236 ) ) ( not ( = ?auto_590230 ?auto_590231 ) ) ( not ( = ?auto_590230 ?auto_590232 ) ) ( not ( = ?auto_590230 ?auto_590233 ) ) ( not ( = ?auto_590230 ?auto_590234 ) ) ( not ( = ?auto_590230 ?auto_590235 ) ) ( not ( = ?auto_590230 ?auto_590236 ) ) ( not ( = ?auto_590231 ?auto_590232 ) ) ( not ( = ?auto_590231 ?auto_590233 ) ) ( not ( = ?auto_590231 ?auto_590234 ) ) ( not ( = ?auto_590231 ?auto_590235 ) ) ( not ( = ?auto_590231 ?auto_590236 ) ) ( not ( = ?auto_590232 ?auto_590233 ) ) ( not ( = ?auto_590232 ?auto_590234 ) ) ( not ( = ?auto_590232 ?auto_590235 ) ) ( not ( = ?auto_590232 ?auto_590236 ) ) ( not ( = ?auto_590233 ?auto_590234 ) ) ( not ( = ?auto_590233 ?auto_590235 ) ) ( not ( = ?auto_590233 ?auto_590236 ) ) ( not ( = ?auto_590234 ?auto_590235 ) ) ( not ( = ?auto_590234 ?auto_590236 ) ) ( not ( = ?auto_590235 ?auto_590236 ) ) ( ON ?auto_590235 ?auto_590236 ) ( ON ?auto_590234 ?auto_590235 ) ( ON ?auto_590233 ?auto_590234 ) ( ON ?auto_590232 ?auto_590233 ) ( ON ?auto_590231 ?auto_590232 ) ( ON ?auto_590230 ?auto_590231 ) ( ON ?auto_590229 ?auto_590230 ) ( ON ?auto_590228 ?auto_590229 ) ( ON ?auto_590227 ?auto_590228 ) ( ON ?auto_590226 ?auto_590227 ) ( ON ?auto_590225 ?auto_590226 ) ( ON ?auto_590224 ?auto_590225 ) ( CLEAR ?auto_590222 ) ( ON ?auto_590223 ?auto_590224 ) ( CLEAR ?auto_590223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_590221 ?auto_590222 ?auto_590223 )
      ( MAKE-16PILE ?auto_590221 ?auto_590222 ?auto_590223 ?auto_590224 ?auto_590225 ?auto_590226 ?auto_590227 ?auto_590228 ?auto_590229 ?auto_590230 ?auto_590231 ?auto_590232 ?auto_590233 ?auto_590234 ?auto_590235 ?auto_590236 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_590253 - BLOCK
      ?auto_590254 - BLOCK
      ?auto_590255 - BLOCK
      ?auto_590256 - BLOCK
      ?auto_590257 - BLOCK
      ?auto_590258 - BLOCK
      ?auto_590259 - BLOCK
      ?auto_590260 - BLOCK
      ?auto_590261 - BLOCK
      ?auto_590262 - BLOCK
      ?auto_590263 - BLOCK
      ?auto_590264 - BLOCK
      ?auto_590265 - BLOCK
      ?auto_590266 - BLOCK
      ?auto_590267 - BLOCK
      ?auto_590268 - BLOCK
    )
    :vars
    (
      ?auto_590269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590268 ?auto_590269 ) ( ON-TABLE ?auto_590253 ) ( not ( = ?auto_590253 ?auto_590254 ) ) ( not ( = ?auto_590253 ?auto_590255 ) ) ( not ( = ?auto_590253 ?auto_590256 ) ) ( not ( = ?auto_590253 ?auto_590257 ) ) ( not ( = ?auto_590253 ?auto_590258 ) ) ( not ( = ?auto_590253 ?auto_590259 ) ) ( not ( = ?auto_590253 ?auto_590260 ) ) ( not ( = ?auto_590253 ?auto_590261 ) ) ( not ( = ?auto_590253 ?auto_590262 ) ) ( not ( = ?auto_590253 ?auto_590263 ) ) ( not ( = ?auto_590253 ?auto_590264 ) ) ( not ( = ?auto_590253 ?auto_590265 ) ) ( not ( = ?auto_590253 ?auto_590266 ) ) ( not ( = ?auto_590253 ?auto_590267 ) ) ( not ( = ?auto_590253 ?auto_590268 ) ) ( not ( = ?auto_590253 ?auto_590269 ) ) ( not ( = ?auto_590254 ?auto_590255 ) ) ( not ( = ?auto_590254 ?auto_590256 ) ) ( not ( = ?auto_590254 ?auto_590257 ) ) ( not ( = ?auto_590254 ?auto_590258 ) ) ( not ( = ?auto_590254 ?auto_590259 ) ) ( not ( = ?auto_590254 ?auto_590260 ) ) ( not ( = ?auto_590254 ?auto_590261 ) ) ( not ( = ?auto_590254 ?auto_590262 ) ) ( not ( = ?auto_590254 ?auto_590263 ) ) ( not ( = ?auto_590254 ?auto_590264 ) ) ( not ( = ?auto_590254 ?auto_590265 ) ) ( not ( = ?auto_590254 ?auto_590266 ) ) ( not ( = ?auto_590254 ?auto_590267 ) ) ( not ( = ?auto_590254 ?auto_590268 ) ) ( not ( = ?auto_590254 ?auto_590269 ) ) ( not ( = ?auto_590255 ?auto_590256 ) ) ( not ( = ?auto_590255 ?auto_590257 ) ) ( not ( = ?auto_590255 ?auto_590258 ) ) ( not ( = ?auto_590255 ?auto_590259 ) ) ( not ( = ?auto_590255 ?auto_590260 ) ) ( not ( = ?auto_590255 ?auto_590261 ) ) ( not ( = ?auto_590255 ?auto_590262 ) ) ( not ( = ?auto_590255 ?auto_590263 ) ) ( not ( = ?auto_590255 ?auto_590264 ) ) ( not ( = ?auto_590255 ?auto_590265 ) ) ( not ( = ?auto_590255 ?auto_590266 ) ) ( not ( = ?auto_590255 ?auto_590267 ) ) ( not ( = ?auto_590255 ?auto_590268 ) ) ( not ( = ?auto_590255 ?auto_590269 ) ) ( not ( = ?auto_590256 ?auto_590257 ) ) ( not ( = ?auto_590256 ?auto_590258 ) ) ( not ( = ?auto_590256 ?auto_590259 ) ) ( not ( = ?auto_590256 ?auto_590260 ) ) ( not ( = ?auto_590256 ?auto_590261 ) ) ( not ( = ?auto_590256 ?auto_590262 ) ) ( not ( = ?auto_590256 ?auto_590263 ) ) ( not ( = ?auto_590256 ?auto_590264 ) ) ( not ( = ?auto_590256 ?auto_590265 ) ) ( not ( = ?auto_590256 ?auto_590266 ) ) ( not ( = ?auto_590256 ?auto_590267 ) ) ( not ( = ?auto_590256 ?auto_590268 ) ) ( not ( = ?auto_590256 ?auto_590269 ) ) ( not ( = ?auto_590257 ?auto_590258 ) ) ( not ( = ?auto_590257 ?auto_590259 ) ) ( not ( = ?auto_590257 ?auto_590260 ) ) ( not ( = ?auto_590257 ?auto_590261 ) ) ( not ( = ?auto_590257 ?auto_590262 ) ) ( not ( = ?auto_590257 ?auto_590263 ) ) ( not ( = ?auto_590257 ?auto_590264 ) ) ( not ( = ?auto_590257 ?auto_590265 ) ) ( not ( = ?auto_590257 ?auto_590266 ) ) ( not ( = ?auto_590257 ?auto_590267 ) ) ( not ( = ?auto_590257 ?auto_590268 ) ) ( not ( = ?auto_590257 ?auto_590269 ) ) ( not ( = ?auto_590258 ?auto_590259 ) ) ( not ( = ?auto_590258 ?auto_590260 ) ) ( not ( = ?auto_590258 ?auto_590261 ) ) ( not ( = ?auto_590258 ?auto_590262 ) ) ( not ( = ?auto_590258 ?auto_590263 ) ) ( not ( = ?auto_590258 ?auto_590264 ) ) ( not ( = ?auto_590258 ?auto_590265 ) ) ( not ( = ?auto_590258 ?auto_590266 ) ) ( not ( = ?auto_590258 ?auto_590267 ) ) ( not ( = ?auto_590258 ?auto_590268 ) ) ( not ( = ?auto_590258 ?auto_590269 ) ) ( not ( = ?auto_590259 ?auto_590260 ) ) ( not ( = ?auto_590259 ?auto_590261 ) ) ( not ( = ?auto_590259 ?auto_590262 ) ) ( not ( = ?auto_590259 ?auto_590263 ) ) ( not ( = ?auto_590259 ?auto_590264 ) ) ( not ( = ?auto_590259 ?auto_590265 ) ) ( not ( = ?auto_590259 ?auto_590266 ) ) ( not ( = ?auto_590259 ?auto_590267 ) ) ( not ( = ?auto_590259 ?auto_590268 ) ) ( not ( = ?auto_590259 ?auto_590269 ) ) ( not ( = ?auto_590260 ?auto_590261 ) ) ( not ( = ?auto_590260 ?auto_590262 ) ) ( not ( = ?auto_590260 ?auto_590263 ) ) ( not ( = ?auto_590260 ?auto_590264 ) ) ( not ( = ?auto_590260 ?auto_590265 ) ) ( not ( = ?auto_590260 ?auto_590266 ) ) ( not ( = ?auto_590260 ?auto_590267 ) ) ( not ( = ?auto_590260 ?auto_590268 ) ) ( not ( = ?auto_590260 ?auto_590269 ) ) ( not ( = ?auto_590261 ?auto_590262 ) ) ( not ( = ?auto_590261 ?auto_590263 ) ) ( not ( = ?auto_590261 ?auto_590264 ) ) ( not ( = ?auto_590261 ?auto_590265 ) ) ( not ( = ?auto_590261 ?auto_590266 ) ) ( not ( = ?auto_590261 ?auto_590267 ) ) ( not ( = ?auto_590261 ?auto_590268 ) ) ( not ( = ?auto_590261 ?auto_590269 ) ) ( not ( = ?auto_590262 ?auto_590263 ) ) ( not ( = ?auto_590262 ?auto_590264 ) ) ( not ( = ?auto_590262 ?auto_590265 ) ) ( not ( = ?auto_590262 ?auto_590266 ) ) ( not ( = ?auto_590262 ?auto_590267 ) ) ( not ( = ?auto_590262 ?auto_590268 ) ) ( not ( = ?auto_590262 ?auto_590269 ) ) ( not ( = ?auto_590263 ?auto_590264 ) ) ( not ( = ?auto_590263 ?auto_590265 ) ) ( not ( = ?auto_590263 ?auto_590266 ) ) ( not ( = ?auto_590263 ?auto_590267 ) ) ( not ( = ?auto_590263 ?auto_590268 ) ) ( not ( = ?auto_590263 ?auto_590269 ) ) ( not ( = ?auto_590264 ?auto_590265 ) ) ( not ( = ?auto_590264 ?auto_590266 ) ) ( not ( = ?auto_590264 ?auto_590267 ) ) ( not ( = ?auto_590264 ?auto_590268 ) ) ( not ( = ?auto_590264 ?auto_590269 ) ) ( not ( = ?auto_590265 ?auto_590266 ) ) ( not ( = ?auto_590265 ?auto_590267 ) ) ( not ( = ?auto_590265 ?auto_590268 ) ) ( not ( = ?auto_590265 ?auto_590269 ) ) ( not ( = ?auto_590266 ?auto_590267 ) ) ( not ( = ?auto_590266 ?auto_590268 ) ) ( not ( = ?auto_590266 ?auto_590269 ) ) ( not ( = ?auto_590267 ?auto_590268 ) ) ( not ( = ?auto_590267 ?auto_590269 ) ) ( not ( = ?auto_590268 ?auto_590269 ) ) ( ON ?auto_590267 ?auto_590268 ) ( ON ?auto_590266 ?auto_590267 ) ( ON ?auto_590265 ?auto_590266 ) ( ON ?auto_590264 ?auto_590265 ) ( ON ?auto_590263 ?auto_590264 ) ( ON ?auto_590262 ?auto_590263 ) ( ON ?auto_590261 ?auto_590262 ) ( ON ?auto_590260 ?auto_590261 ) ( ON ?auto_590259 ?auto_590260 ) ( ON ?auto_590258 ?auto_590259 ) ( ON ?auto_590257 ?auto_590258 ) ( ON ?auto_590256 ?auto_590257 ) ( ON ?auto_590255 ?auto_590256 ) ( CLEAR ?auto_590253 ) ( ON ?auto_590254 ?auto_590255 ) ( CLEAR ?auto_590254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_590253 ?auto_590254 )
      ( MAKE-16PILE ?auto_590253 ?auto_590254 ?auto_590255 ?auto_590256 ?auto_590257 ?auto_590258 ?auto_590259 ?auto_590260 ?auto_590261 ?auto_590262 ?auto_590263 ?auto_590264 ?auto_590265 ?auto_590266 ?auto_590267 ?auto_590268 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_590286 - BLOCK
      ?auto_590287 - BLOCK
      ?auto_590288 - BLOCK
      ?auto_590289 - BLOCK
      ?auto_590290 - BLOCK
      ?auto_590291 - BLOCK
      ?auto_590292 - BLOCK
      ?auto_590293 - BLOCK
      ?auto_590294 - BLOCK
      ?auto_590295 - BLOCK
      ?auto_590296 - BLOCK
      ?auto_590297 - BLOCK
      ?auto_590298 - BLOCK
      ?auto_590299 - BLOCK
      ?auto_590300 - BLOCK
      ?auto_590301 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_590301 ) ( ON-TABLE ?auto_590286 ) ( not ( = ?auto_590286 ?auto_590287 ) ) ( not ( = ?auto_590286 ?auto_590288 ) ) ( not ( = ?auto_590286 ?auto_590289 ) ) ( not ( = ?auto_590286 ?auto_590290 ) ) ( not ( = ?auto_590286 ?auto_590291 ) ) ( not ( = ?auto_590286 ?auto_590292 ) ) ( not ( = ?auto_590286 ?auto_590293 ) ) ( not ( = ?auto_590286 ?auto_590294 ) ) ( not ( = ?auto_590286 ?auto_590295 ) ) ( not ( = ?auto_590286 ?auto_590296 ) ) ( not ( = ?auto_590286 ?auto_590297 ) ) ( not ( = ?auto_590286 ?auto_590298 ) ) ( not ( = ?auto_590286 ?auto_590299 ) ) ( not ( = ?auto_590286 ?auto_590300 ) ) ( not ( = ?auto_590286 ?auto_590301 ) ) ( not ( = ?auto_590287 ?auto_590288 ) ) ( not ( = ?auto_590287 ?auto_590289 ) ) ( not ( = ?auto_590287 ?auto_590290 ) ) ( not ( = ?auto_590287 ?auto_590291 ) ) ( not ( = ?auto_590287 ?auto_590292 ) ) ( not ( = ?auto_590287 ?auto_590293 ) ) ( not ( = ?auto_590287 ?auto_590294 ) ) ( not ( = ?auto_590287 ?auto_590295 ) ) ( not ( = ?auto_590287 ?auto_590296 ) ) ( not ( = ?auto_590287 ?auto_590297 ) ) ( not ( = ?auto_590287 ?auto_590298 ) ) ( not ( = ?auto_590287 ?auto_590299 ) ) ( not ( = ?auto_590287 ?auto_590300 ) ) ( not ( = ?auto_590287 ?auto_590301 ) ) ( not ( = ?auto_590288 ?auto_590289 ) ) ( not ( = ?auto_590288 ?auto_590290 ) ) ( not ( = ?auto_590288 ?auto_590291 ) ) ( not ( = ?auto_590288 ?auto_590292 ) ) ( not ( = ?auto_590288 ?auto_590293 ) ) ( not ( = ?auto_590288 ?auto_590294 ) ) ( not ( = ?auto_590288 ?auto_590295 ) ) ( not ( = ?auto_590288 ?auto_590296 ) ) ( not ( = ?auto_590288 ?auto_590297 ) ) ( not ( = ?auto_590288 ?auto_590298 ) ) ( not ( = ?auto_590288 ?auto_590299 ) ) ( not ( = ?auto_590288 ?auto_590300 ) ) ( not ( = ?auto_590288 ?auto_590301 ) ) ( not ( = ?auto_590289 ?auto_590290 ) ) ( not ( = ?auto_590289 ?auto_590291 ) ) ( not ( = ?auto_590289 ?auto_590292 ) ) ( not ( = ?auto_590289 ?auto_590293 ) ) ( not ( = ?auto_590289 ?auto_590294 ) ) ( not ( = ?auto_590289 ?auto_590295 ) ) ( not ( = ?auto_590289 ?auto_590296 ) ) ( not ( = ?auto_590289 ?auto_590297 ) ) ( not ( = ?auto_590289 ?auto_590298 ) ) ( not ( = ?auto_590289 ?auto_590299 ) ) ( not ( = ?auto_590289 ?auto_590300 ) ) ( not ( = ?auto_590289 ?auto_590301 ) ) ( not ( = ?auto_590290 ?auto_590291 ) ) ( not ( = ?auto_590290 ?auto_590292 ) ) ( not ( = ?auto_590290 ?auto_590293 ) ) ( not ( = ?auto_590290 ?auto_590294 ) ) ( not ( = ?auto_590290 ?auto_590295 ) ) ( not ( = ?auto_590290 ?auto_590296 ) ) ( not ( = ?auto_590290 ?auto_590297 ) ) ( not ( = ?auto_590290 ?auto_590298 ) ) ( not ( = ?auto_590290 ?auto_590299 ) ) ( not ( = ?auto_590290 ?auto_590300 ) ) ( not ( = ?auto_590290 ?auto_590301 ) ) ( not ( = ?auto_590291 ?auto_590292 ) ) ( not ( = ?auto_590291 ?auto_590293 ) ) ( not ( = ?auto_590291 ?auto_590294 ) ) ( not ( = ?auto_590291 ?auto_590295 ) ) ( not ( = ?auto_590291 ?auto_590296 ) ) ( not ( = ?auto_590291 ?auto_590297 ) ) ( not ( = ?auto_590291 ?auto_590298 ) ) ( not ( = ?auto_590291 ?auto_590299 ) ) ( not ( = ?auto_590291 ?auto_590300 ) ) ( not ( = ?auto_590291 ?auto_590301 ) ) ( not ( = ?auto_590292 ?auto_590293 ) ) ( not ( = ?auto_590292 ?auto_590294 ) ) ( not ( = ?auto_590292 ?auto_590295 ) ) ( not ( = ?auto_590292 ?auto_590296 ) ) ( not ( = ?auto_590292 ?auto_590297 ) ) ( not ( = ?auto_590292 ?auto_590298 ) ) ( not ( = ?auto_590292 ?auto_590299 ) ) ( not ( = ?auto_590292 ?auto_590300 ) ) ( not ( = ?auto_590292 ?auto_590301 ) ) ( not ( = ?auto_590293 ?auto_590294 ) ) ( not ( = ?auto_590293 ?auto_590295 ) ) ( not ( = ?auto_590293 ?auto_590296 ) ) ( not ( = ?auto_590293 ?auto_590297 ) ) ( not ( = ?auto_590293 ?auto_590298 ) ) ( not ( = ?auto_590293 ?auto_590299 ) ) ( not ( = ?auto_590293 ?auto_590300 ) ) ( not ( = ?auto_590293 ?auto_590301 ) ) ( not ( = ?auto_590294 ?auto_590295 ) ) ( not ( = ?auto_590294 ?auto_590296 ) ) ( not ( = ?auto_590294 ?auto_590297 ) ) ( not ( = ?auto_590294 ?auto_590298 ) ) ( not ( = ?auto_590294 ?auto_590299 ) ) ( not ( = ?auto_590294 ?auto_590300 ) ) ( not ( = ?auto_590294 ?auto_590301 ) ) ( not ( = ?auto_590295 ?auto_590296 ) ) ( not ( = ?auto_590295 ?auto_590297 ) ) ( not ( = ?auto_590295 ?auto_590298 ) ) ( not ( = ?auto_590295 ?auto_590299 ) ) ( not ( = ?auto_590295 ?auto_590300 ) ) ( not ( = ?auto_590295 ?auto_590301 ) ) ( not ( = ?auto_590296 ?auto_590297 ) ) ( not ( = ?auto_590296 ?auto_590298 ) ) ( not ( = ?auto_590296 ?auto_590299 ) ) ( not ( = ?auto_590296 ?auto_590300 ) ) ( not ( = ?auto_590296 ?auto_590301 ) ) ( not ( = ?auto_590297 ?auto_590298 ) ) ( not ( = ?auto_590297 ?auto_590299 ) ) ( not ( = ?auto_590297 ?auto_590300 ) ) ( not ( = ?auto_590297 ?auto_590301 ) ) ( not ( = ?auto_590298 ?auto_590299 ) ) ( not ( = ?auto_590298 ?auto_590300 ) ) ( not ( = ?auto_590298 ?auto_590301 ) ) ( not ( = ?auto_590299 ?auto_590300 ) ) ( not ( = ?auto_590299 ?auto_590301 ) ) ( not ( = ?auto_590300 ?auto_590301 ) ) ( ON ?auto_590300 ?auto_590301 ) ( ON ?auto_590299 ?auto_590300 ) ( ON ?auto_590298 ?auto_590299 ) ( ON ?auto_590297 ?auto_590298 ) ( ON ?auto_590296 ?auto_590297 ) ( ON ?auto_590295 ?auto_590296 ) ( ON ?auto_590294 ?auto_590295 ) ( ON ?auto_590293 ?auto_590294 ) ( ON ?auto_590292 ?auto_590293 ) ( ON ?auto_590291 ?auto_590292 ) ( ON ?auto_590290 ?auto_590291 ) ( ON ?auto_590289 ?auto_590290 ) ( ON ?auto_590288 ?auto_590289 ) ( CLEAR ?auto_590286 ) ( ON ?auto_590287 ?auto_590288 ) ( CLEAR ?auto_590287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_590286 ?auto_590287 )
      ( MAKE-16PILE ?auto_590286 ?auto_590287 ?auto_590288 ?auto_590289 ?auto_590290 ?auto_590291 ?auto_590292 ?auto_590293 ?auto_590294 ?auto_590295 ?auto_590296 ?auto_590297 ?auto_590298 ?auto_590299 ?auto_590300 ?auto_590301 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_590318 - BLOCK
      ?auto_590319 - BLOCK
      ?auto_590320 - BLOCK
      ?auto_590321 - BLOCK
      ?auto_590322 - BLOCK
      ?auto_590323 - BLOCK
      ?auto_590324 - BLOCK
      ?auto_590325 - BLOCK
      ?auto_590326 - BLOCK
      ?auto_590327 - BLOCK
      ?auto_590328 - BLOCK
      ?auto_590329 - BLOCK
      ?auto_590330 - BLOCK
      ?auto_590331 - BLOCK
      ?auto_590332 - BLOCK
      ?auto_590333 - BLOCK
    )
    :vars
    (
      ?auto_590334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590333 ?auto_590334 ) ( not ( = ?auto_590318 ?auto_590319 ) ) ( not ( = ?auto_590318 ?auto_590320 ) ) ( not ( = ?auto_590318 ?auto_590321 ) ) ( not ( = ?auto_590318 ?auto_590322 ) ) ( not ( = ?auto_590318 ?auto_590323 ) ) ( not ( = ?auto_590318 ?auto_590324 ) ) ( not ( = ?auto_590318 ?auto_590325 ) ) ( not ( = ?auto_590318 ?auto_590326 ) ) ( not ( = ?auto_590318 ?auto_590327 ) ) ( not ( = ?auto_590318 ?auto_590328 ) ) ( not ( = ?auto_590318 ?auto_590329 ) ) ( not ( = ?auto_590318 ?auto_590330 ) ) ( not ( = ?auto_590318 ?auto_590331 ) ) ( not ( = ?auto_590318 ?auto_590332 ) ) ( not ( = ?auto_590318 ?auto_590333 ) ) ( not ( = ?auto_590318 ?auto_590334 ) ) ( not ( = ?auto_590319 ?auto_590320 ) ) ( not ( = ?auto_590319 ?auto_590321 ) ) ( not ( = ?auto_590319 ?auto_590322 ) ) ( not ( = ?auto_590319 ?auto_590323 ) ) ( not ( = ?auto_590319 ?auto_590324 ) ) ( not ( = ?auto_590319 ?auto_590325 ) ) ( not ( = ?auto_590319 ?auto_590326 ) ) ( not ( = ?auto_590319 ?auto_590327 ) ) ( not ( = ?auto_590319 ?auto_590328 ) ) ( not ( = ?auto_590319 ?auto_590329 ) ) ( not ( = ?auto_590319 ?auto_590330 ) ) ( not ( = ?auto_590319 ?auto_590331 ) ) ( not ( = ?auto_590319 ?auto_590332 ) ) ( not ( = ?auto_590319 ?auto_590333 ) ) ( not ( = ?auto_590319 ?auto_590334 ) ) ( not ( = ?auto_590320 ?auto_590321 ) ) ( not ( = ?auto_590320 ?auto_590322 ) ) ( not ( = ?auto_590320 ?auto_590323 ) ) ( not ( = ?auto_590320 ?auto_590324 ) ) ( not ( = ?auto_590320 ?auto_590325 ) ) ( not ( = ?auto_590320 ?auto_590326 ) ) ( not ( = ?auto_590320 ?auto_590327 ) ) ( not ( = ?auto_590320 ?auto_590328 ) ) ( not ( = ?auto_590320 ?auto_590329 ) ) ( not ( = ?auto_590320 ?auto_590330 ) ) ( not ( = ?auto_590320 ?auto_590331 ) ) ( not ( = ?auto_590320 ?auto_590332 ) ) ( not ( = ?auto_590320 ?auto_590333 ) ) ( not ( = ?auto_590320 ?auto_590334 ) ) ( not ( = ?auto_590321 ?auto_590322 ) ) ( not ( = ?auto_590321 ?auto_590323 ) ) ( not ( = ?auto_590321 ?auto_590324 ) ) ( not ( = ?auto_590321 ?auto_590325 ) ) ( not ( = ?auto_590321 ?auto_590326 ) ) ( not ( = ?auto_590321 ?auto_590327 ) ) ( not ( = ?auto_590321 ?auto_590328 ) ) ( not ( = ?auto_590321 ?auto_590329 ) ) ( not ( = ?auto_590321 ?auto_590330 ) ) ( not ( = ?auto_590321 ?auto_590331 ) ) ( not ( = ?auto_590321 ?auto_590332 ) ) ( not ( = ?auto_590321 ?auto_590333 ) ) ( not ( = ?auto_590321 ?auto_590334 ) ) ( not ( = ?auto_590322 ?auto_590323 ) ) ( not ( = ?auto_590322 ?auto_590324 ) ) ( not ( = ?auto_590322 ?auto_590325 ) ) ( not ( = ?auto_590322 ?auto_590326 ) ) ( not ( = ?auto_590322 ?auto_590327 ) ) ( not ( = ?auto_590322 ?auto_590328 ) ) ( not ( = ?auto_590322 ?auto_590329 ) ) ( not ( = ?auto_590322 ?auto_590330 ) ) ( not ( = ?auto_590322 ?auto_590331 ) ) ( not ( = ?auto_590322 ?auto_590332 ) ) ( not ( = ?auto_590322 ?auto_590333 ) ) ( not ( = ?auto_590322 ?auto_590334 ) ) ( not ( = ?auto_590323 ?auto_590324 ) ) ( not ( = ?auto_590323 ?auto_590325 ) ) ( not ( = ?auto_590323 ?auto_590326 ) ) ( not ( = ?auto_590323 ?auto_590327 ) ) ( not ( = ?auto_590323 ?auto_590328 ) ) ( not ( = ?auto_590323 ?auto_590329 ) ) ( not ( = ?auto_590323 ?auto_590330 ) ) ( not ( = ?auto_590323 ?auto_590331 ) ) ( not ( = ?auto_590323 ?auto_590332 ) ) ( not ( = ?auto_590323 ?auto_590333 ) ) ( not ( = ?auto_590323 ?auto_590334 ) ) ( not ( = ?auto_590324 ?auto_590325 ) ) ( not ( = ?auto_590324 ?auto_590326 ) ) ( not ( = ?auto_590324 ?auto_590327 ) ) ( not ( = ?auto_590324 ?auto_590328 ) ) ( not ( = ?auto_590324 ?auto_590329 ) ) ( not ( = ?auto_590324 ?auto_590330 ) ) ( not ( = ?auto_590324 ?auto_590331 ) ) ( not ( = ?auto_590324 ?auto_590332 ) ) ( not ( = ?auto_590324 ?auto_590333 ) ) ( not ( = ?auto_590324 ?auto_590334 ) ) ( not ( = ?auto_590325 ?auto_590326 ) ) ( not ( = ?auto_590325 ?auto_590327 ) ) ( not ( = ?auto_590325 ?auto_590328 ) ) ( not ( = ?auto_590325 ?auto_590329 ) ) ( not ( = ?auto_590325 ?auto_590330 ) ) ( not ( = ?auto_590325 ?auto_590331 ) ) ( not ( = ?auto_590325 ?auto_590332 ) ) ( not ( = ?auto_590325 ?auto_590333 ) ) ( not ( = ?auto_590325 ?auto_590334 ) ) ( not ( = ?auto_590326 ?auto_590327 ) ) ( not ( = ?auto_590326 ?auto_590328 ) ) ( not ( = ?auto_590326 ?auto_590329 ) ) ( not ( = ?auto_590326 ?auto_590330 ) ) ( not ( = ?auto_590326 ?auto_590331 ) ) ( not ( = ?auto_590326 ?auto_590332 ) ) ( not ( = ?auto_590326 ?auto_590333 ) ) ( not ( = ?auto_590326 ?auto_590334 ) ) ( not ( = ?auto_590327 ?auto_590328 ) ) ( not ( = ?auto_590327 ?auto_590329 ) ) ( not ( = ?auto_590327 ?auto_590330 ) ) ( not ( = ?auto_590327 ?auto_590331 ) ) ( not ( = ?auto_590327 ?auto_590332 ) ) ( not ( = ?auto_590327 ?auto_590333 ) ) ( not ( = ?auto_590327 ?auto_590334 ) ) ( not ( = ?auto_590328 ?auto_590329 ) ) ( not ( = ?auto_590328 ?auto_590330 ) ) ( not ( = ?auto_590328 ?auto_590331 ) ) ( not ( = ?auto_590328 ?auto_590332 ) ) ( not ( = ?auto_590328 ?auto_590333 ) ) ( not ( = ?auto_590328 ?auto_590334 ) ) ( not ( = ?auto_590329 ?auto_590330 ) ) ( not ( = ?auto_590329 ?auto_590331 ) ) ( not ( = ?auto_590329 ?auto_590332 ) ) ( not ( = ?auto_590329 ?auto_590333 ) ) ( not ( = ?auto_590329 ?auto_590334 ) ) ( not ( = ?auto_590330 ?auto_590331 ) ) ( not ( = ?auto_590330 ?auto_590332 ) ) ( not ( = ?auto_590330 ?auto_590333 ) ) ( not ( = ?auto_590330 ?auto_590334 ) ) ( not ( = ?auto_590331 ?auto_590332 ) ) ( not ( = ?auto_590331 ?auto_590333 ) ) ( not ( = ?auto_590331 ?auto_590334 ) ) ( not ( = ?auto_590332 ?auto_590333 ) ) ( not ( = ?auto_590332 ?auto_590334 ) ) ( not ( = ?auto_590333 ?auto_590334 ) ) ( ON ?auto_590332 ?auto_590333 ) ( ON ?auto_590331 ?auto_590332 ) ( ON ?auto_590330 ?auto_590331 ) ( ON ?auto_590329 ?auto_590330 ) ( ON ?auto_590328 ?auto_590329 ) ( ON ?auto_590327 ?auto_590328 ) ( ON ?auto_590326 ?auto_590327 ) ( ON ?auto_590325 ?auto_590326 ) ( ON ?auto_590324 ?auto_590325 ) ( ON ?auto_590323 ?auto_590324 ) ( ON ?auto_590322 ?auto_590323 ) ( ON ?auto_590321 ?auto_590322 ) ( ON ?auto_590320 ?auto_590321 ) ( ON ?auto_590319 ?auto_590320 ) ( ON ?auto_590318 ?auto_590319 ) ( CLEAR ?auto_590318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_590318 )
      ( MAKE-16PILE ?auto_590318 ?auto_590319 ?auto_590320 ?auto_590321 ?auto_590322 ?auto_590323 ?auto_590324 ?auto_590325 ?auto_590326 ?auto_590327 ?auto_590328 ?auto_590329 ?auto_590330 ?auto_590331 ?auto_590332 ?auto_590333 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_590351 - BLOCK
      ?auto_590352 - BLOCK
      ?auto_590353 - BLOCK
      ?auto_590354 - BLOCK
      ?auto_590355 - BLOCK
      ?auto_590356 - BLOCK
      ?auto_590357 - BLOCK
      ?auto_590358 - BLOCK
      ?auto_590359 - BLOCK
      ?auto_590360 - BLOCK
      ?auto_590361 - BLOCK
      ?auto_590362 - BLOCK
      ?auto_590363 - BLOCK
      ?auto_590364 - BLOCK
      ?auto_590365 - BLOCK
      ?auto_590366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_590366 ) ( not ( = ?auto_590351 ?auto_590352 ) ) ( not ( = ?auto_590351 ?auto_590353 ) ) ( not ( = ?auto_590351 ?auto_590354 ) ) ( not ( = ?auto_590351 ?auto_590355 ) ) ( not ( = ?auto_590351 ?auto_590356 ) ) ( not ( = ?auto_590351 ?auto_590357 ) ) ( not ( = ?auto_590351 ?auto_590358 ) ) ( not ( = ?auto_590351 ?auto_590359 ) ) ( not ( = ?auto_590351 ?auto_590360 ) ) ( not ( = ?auto_590351 ?auto_590361 ) ) ( not ( = ?auto_590351 ?auto_590362 ) ) ( not ( = ?auto_590351 ?auto_590363 ) ) ( not ( = ?auto_590351 ?auto_590364 ) ) ( not ( = ?auto_590351 ?auto_590365 ) ) ( not ( = ?auto_590351 ?auto_590366 ) ) ( not ( = ?auto_590352 ?auto_590353 ) ) ( not ( = ?auto_590352 ?auto_590354 ) ) ( not ( = ?auto_590352 ?auto_590355 ) ) ( not ( = ?auto_590352 ?auto_590356 ) ) ( not ( = ?auto_590352 ?auto_590357 ) ) ( not ( = ?auto_590352 ?auto_590358 ) ) ( not ( = ?auto_590352 ?auto_590359 ) ) ( not ( = ?auto_590352 ?auto_590360 ) ) ( not ( = ?auto_590352 ?auto_590361 ) ) ( not ( = ?auto_590352 ?auto_590362 ) ) ( not ( = ?auto_590352 ?auto_590363 ) ) ( not ( = ?auto_590352 ?auto_590364 ) ) ( not ( = ?auto_590352 ?auto_590365 ) ) ( not ( = ?auto_590352 ?auto_590366 ) ) ( not ( = ?auto_590353 ?auto_590354 ) ) ( not ( = ?auto_590353 ?auto_590355 ) ) ( not ( = ?auto_590353 ?auto_590356 ) ) ( not ( = ?auto_590353 ?auto_590357 ) ) ( not ( = ?auto_590353 ?auto_590358 ) ) ( not ( = ?auto_590353 ?auto_590359 ) ) ( not ( = ?auto_590353 ?auto_590360 ) ) ( not ( = ?auto_590353 ?auto_590361 ) ) ( not ( = ?auto_590353 ?auto_590362 ) ) ( not ( = ?auto_590353 ?auto_590363 ) ) ( not ( = ?auto_590353 ?auto_590364 ) ) ( not ( = ?auto_590353 ?auto_590365 ) ) ( not ( = ?auto_590353 ?auto_590366 ) ) ( not ( = ?auto_590354 ?auto_590355 ) ) ( not ( = ?auto_590354 ?auto_590356 ) ) ( not ( = ?auto_590354 ?auto_590357 ) ) ( not ( = ?auto_590354 ?auto_590358 ) ) ( not ( = ?auto_590354 ?auto_590359 ) ) ( not ( = ?auto_590354 ?auto_590360 ) ) ( not ( = ?auto_590354 ?auto_590361 ) ) ( not ( = ?auto_590354 ?auto_590362 ) ) ( not ( = ?auto_590354 ?auto_590363 ) ) ( not ( = ?auto_590354 ?auto_590364 ) ) ( not ( = ?auto_590354 ?auto_590365 ) ) ( not ( = ?auto_590354 ?auto_590366 ) ) ( not ( = ?auto_590355 ?auto_590356 ) ) ( not ( = ?auto_590355 ?auto_590357 ) ) ( not ( = ?auto_590355 ?auto_590358 ) ) ( not ( = ?auto_590355 ?auto_590359 ) ) ( not ( = ?auto_590355 ?auto_590360 ) ) ( not ( = ?auto_590355 ?auto_590361 ) ) ( not ( = ?auto_590355 ?auto_590362 ) ) ( not ( = ?auto_590355 ?auto_590363 ) ) ( not ( = ?auto_590355 ?auto_590364 ) ) ( not ( = ?auto_590355 ?auto_590365 ) ) ( not ( = ?auto_590355 ?auto_590366 ) ) ( not ( = ?auto_590356 ?auto_590357 ) ) ( not ( = ?auto_590356 ?auto_590358 ) ) ( not ( = ?auto_590356 ?auto_590359 ) ) ( not ( = ?auto_590356 ?auto_590360 ) ) ( not ( = ?auto_590356 ?auto_590361 ) ) ( not ( = ?auto_590356 ?auto_590362 ) ) ( not ( = ?auto_590356 ?auto_590363 ) ) ( not ( = ?auto_590356 ?auto_590364 ) ) ( not ( = ?auto_590356 ?auto_590365 ) ) ( not ( = ?auto_590356 ?auto_590366 ) ) ( not ( = ?auto_590357 ?auto_590358 ) ) ( not ( = ?auto_590357 ?auto_590359 ) ) ( not ( = ?auto_590357 ?auto_590360 ) ) ( not ( = ?auto_590357 ?auto_590361 ) ) ( not ( = ?auto_590357 ?auto_590362 ) ) ( not ( = ?auto_590357 ?auto_590363 ) ) ( not ( = ?auto_590357 ?auto_590364 ) ) ( not ( = ?auto_590357 ?auto_590365 ) ) ( not ( = ?auto_590357 ?auto_590366 ) ) ( not ( = ?auto_590358 ?auto_590359 ) ) ( not ( = ?auto_590358 ?auto_590360 ) ) ( not ( = ?auto_590358 ?auto_590361 ) ) ( not ( = ?auto_590358 ?auto_590362 ) ) ( not ( = ?auto_590358 ?auto_590363 ) ) ( not ( = ?auto_590358 ?auto_590364 ) ) ( not ( = ?auto_590358 ?auto_590365 ) ) ( not ( = ?auto_590358 ?auto_590366 ) ) ( not ( = ?auto_590359 ?auto_590360 ) ) ( not ( = ?auto_590359 ?auto_590361 ) ) ( not ( = ?auto_590359 ?auto_590362 ) ) ( not ( = ?auto_590359 ?auto_590363 ) ) ( not ( = ?auto_590359 ?auto_590364 ) ) ( not ( = ?auto_590359 ?auto_590365 ) ) ( not ( = ?auto_590359 ?auto_590366 ) ) ( not ( = ?auto_590360 ?auto_590361 ) ) ( not ( = ?auto_590360 ?auto_590362 ) ) ( not ( = ?auto_590360 ?auto_590363 ) ) ( not ( = ?auto_590360 ?auto_590364 ) ) ( not ( = ?auto_590360 ?auto_590365 ) ) ( not ( = ?auto_590360 ?auto_590366 ) ) ( not ( = ?auto_590361 ?auto_590362 ) ) ( not ( = ?auto_590361 ?auto_590363 ) ) ( not ( = ?auto_590361 ?auto_590364 ) ) ( not ( = ?auto_590361 ?auto_590365 ) ) ( not ( = ?auto_590361 ?auto_590366 ) ) ( not ( = ?auto_590362 ?auto_590363 ) ) ( not ( = ?auto_590362 ?auto_590364 ) ) ( not ( = ?auto_590362 ?auto_590365 ) ) ( not ( = ?auto_590362 ?auto_590366 ) ) ( not ( = ?auto_590363 ?auto_590364 ) ) ( not ( = ?auto_590363 ?auto_590365 ) ) ( not ( = ?auto_590363 ?auto_590366 ) ) ( not ( = ?auto_590364 ?auto_590365 ) ) ( not ( = ?auto_590364 ?auto_590366 ) ) ( not ( = ?auto_590365 ?auto_590366 ) ) ( ON ?auto_590365 ?auto_590366 ) ( ON ?auto_590364 ?auto_590365 ) ( ON ?auto_590363 ?auto_590364 ) ( ON ?auto_590362 ?auto_590363 ) ( ON ?auto_590361 ?auto_590362 ) ( ON ?auto_590360 ?auto_590361 ) ( ON ?auto_590359 ?auto_590360 ) ( ON ?auto_590358 ?auto_590359 ) ( ON ?auto_590357 ?auto_590358 ) ( ON ?auto_590356 ?auto_590357 ) ( ON ?auto_590355 ?auto_590356 ) ( ON ?auto_590354 ?auto_590355 ) ( ON ?auto_590353 ?auto_590354 ) ( ON ?auto_590352 ?auto_590353 ) ( ON ?auto_590351 ?auto_590352 ) ( CLEAR ?auto_590351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_590351 )
      ( MAKE-16PILE ?auto_590351 ?auto_590352 ?auto_590353 ?auto_590354 ?auto_590355 ?auto_590356 ?auto_590357 ?auto_590358 ?auto_590359 ?auto_590360 ?auto_590361 ?auto_590362 ?auto_590363 ?auto_590364 ?auto_590365 ?auto_590366 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_590383 - BLOCK
      ?auto_590384 - BLOCK
      ?auto_590385 - BLOCK
      ?auto_590386 - BLOCK
      ?auto_590387 - BLOCK
      ?auto_590388 - BLOCK
      ?auto_590389 - BLOCK
      ?auto_590390 - BLOCK
      ?auto_590391 - BLOCK
      ?auto_590392 - BLOCK
      ?auto_590393 - BLOCK
      ?auto_590394 - BLOCK
      ?auto_590395 - BLOCK
      ?auto_590396 - BLOCK
      ?auto_590397 - BLOCK
      ?auto_590398 - BLOCK
    )
    :vars
    (
      ?auto_590399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_590383 ?auto_590384 ) ) ( not ( = ?auto_590383 ?auto_590385 ) ) ( not ( = ?auto_590383 ?auto_590386 ) ) ( not ( = ?auto_590383 ?auto_590387 ) ) ( not ( = ?auto_590383 ?auto_590388 ) ) ( not ( = ?auto_590383 ?auto_590389 ) ) ( not ( = ?auto_590383 ?auto_590390 ) ) ( not ( = ?auto_590383 ?auto_590391 ) ) ( not ( = ?auto_590383 ?auto_590392 ) ) ( not ( = ?auto_590383 ?auto_590393 ) ) ( not ( = ?auto_590383 ?auto_590394 ) ) ( not ( = ?auto_590383 ?auto_590395 ) ) ( not ( = ?auto_590383 ?auto_590396 ) ) ( not ( = ?auto_590383 ?auto_590397 ) ) ( not ( = ?auto_590383 ?auto_590398 ) ) ( not ( = ?auto_590384 ?auto_590385 ) ) ( not ( = ?auto_590384 ?auto_590386 ) ) ( not ( = ?auto_590384 ?auto_590387 ) ) ( not ( = ?auto_590384 ?auto_590388 ) ) ( not ( = ?auto_590384 ?auto_590389 ) ) ( not ( = ?auto_590384 ?auto_590390 ) ) ( not ( = ?auto_590384 ?auto_590391 ) ) ( not ( = ?auto_590384 ?auto_590392 ) ) ( not ( = ?auto_590384 ?auto_590393 ) ) ( not ( = ?auto_590384 ?auto_590394 ) ) ( not ( = ?auto_590384 ?auto_590395 ) ) ( not ( = ?auto_590384 ?auto_590396 ) ) ( not ( = ?auto_590384 ?auto_590397 ) ) ( not ( = ?auto_590384 ?auto_590398 ) ) ( not ( = ?auto_590385 ?auto_590386 ) ) ( not ( = ?auto_590385 ?auto_590387 ) ) ( not ( = ?auto_590385 ?auto_590388 ) ) ( not ( = ?auto_590385 ?auto_590389 ) ) ( not ( = ?auto_590385 ?auto_590390 ) ) ( not ( = ?auto_590385 ?auto_590391 ) ) ( not ( = ?auto_590385 ?auto_590392 ) ) ( not ( = ?auto_590385 ?auto_590393 ) ) ( not ( = ?auto_590385 ?auto_590394 ) ) ( not ( = ?auto_590385 ?auto_590395 ) ) ( not ( = ?auto_590385 ?auto_590396 ) ) ( not ( = ?auto_590385 ?auto_590397 ) ) ( not ( = ?auto_590385 ?auto_590398 ) ) ( not ( = ?auto_590386 ?auto_590387 ) ) ( not ( = ?auto_590386 ?auto_590388 ) ) ( not ( = ?auto_590386 ?auto_590389 ) ) ( not ( = ?auto_590386 ?auto_590390 ) ) ( not ( = ?auto_590386 ?auto_590391 ) ) ( not ( = ?auto_590386 ?auto_590392 ) ) ( not ( = ?auto_590386 ?auto_590393 ) ) ( not ( = ?auto_590386 ?auto_590394 ) ) ( not ( = ?auto_590386 ?auto_590395 ) ) ( not ( = ?auto_590386 ?auto_590396 ) ) ( not ( = ?auto_590386 ?auto_590397 ) ) ( not ( = ?auto_590386 ?auto_590398 ) ) ( not ( = ?auto_590387 ?auto_590388 ) ) ( not ( = ?auto_590387 ?auto_590389 ) ) ( not ( = ?auto_590387 ?auto_590390 ) ) ( not ( = ?auto_590387 ?auto_590391 ) ) ( not ( = ?auto_590387 ?auto_590392 ) ) ( not ( = ?auto_590387 ?auto_590393 ) ) ( not ( = ?auto_590387 ?auto_590394 ) ) ( not ( = ?auto_590387 ?auto_590395 ) ) ( not ( = ?auto_590387 ?auto_590396 ) ) ( not ( = ?auto_590387 ?auto_590397 ) ) ( not ( = ?auto_590387 ?auto_590398 ) ) ( not ( = ?auto_590388 ?auto_590389 ) ) ( not ( = ?auto_590388 ?auto_590390 ) ) ( not ( = ?auto_590388 ?auto_590391 ) ) ( not ( = ?auto_590388 ?auto_590392 ) ) ( not ( = ?auto_590388 ?auto_590393 ) ) ( not ( = ?auto_590388 ?auto_590394 ) ) ( not ( = ?auto_590388 ?auto_590395 ) ) ( not ( = ?auto_590388 ?auto_590396 ) ) ( not ( = ?auto_590388 ?auto_590397 ) ) ( not ( = ?auto_590388 ?auto_590398 ) ) ( not ( = ?auto_590389 ?auto_590390 ) ) ( not ( = ?auto_590389 ?auto_590391 ) ) ( not ( = ?auto_590389 ?auto_590392 ) ) ( not ( = ?auto_590389 ?auto_590393 ) ) ( not ( = ?auto_590389 ?auto_590394 ) ) ( not ( = ?auto_590389 ?auto_590395 ) ) ( not ( = ?auto_590389 ?auto_590396 ) ) ( not ( = ?auto_590389 ?auto_590397 ) ) ( not ( = ?auto_590389 ?auto_590398 ) ) ( not ( = ?auto_590390 ?auto_590391 ) ) ( not ( = ?auto_590390 ?auto_590392 ) ) ( not ( = ?auto_590390 ?auto_590393 ) ) ( not ( = ?auto_590390 ?auto_590394 ) ) ( not ( = ?auto_590390 ?auto_590395 ) ) ( not ( = ?auto_590390 ?auto_590396 ) ) ( not ( = ?auto_590390 ?auto_590397 ) ) ( not ( = ?auto_590390 ?auto_590398 ) ) ( not ( = ?auto_590391 ?auto_590392 ) ) ( not ( = ?auto_590391 ?auto_590393 ) ) ( not ( = ?auto_590391 ?auto_590394 ) ) ( not ( = ?auto_590391 ?auto_590395 ) ) ( not ( = ?auto_590391 ?auto_590396 ) ) ( not ( = ?auto_590391 ?auto_590397 ) ) ( not ( = ?auto_590391 ?auto_590398 ) ) ( not ( = ?auto_590392 ?auto_590393 ) ) ( not ( = ?auto_590392 ?auto_590394 ) ) ( not ( = ?auto_590392 ?auto_590395 ) ) ( not ( = ?auto_590392 ?auto_590396 ) ) ( not ( = ?auto_590392 ?auto_590397 ) ) ( not ( = ?auto_590392 ?auto_590398 ) ) ( not ( = ?auto_590393 ?auto_590394 ) ) ( not ( = ?auto_590393 ?auto_590395 ) ) ( not ( = ?auto_590393 ?auto_590396 ) ) ( not ( = ?auto_590393 ?auto_590397 ) ) ( not ( = ?auto_590393 ?auto_590398 ) ) ( not ( = ?auto_590394 ?auto_590395 ) ) ( not ( = ?auto_590394 ?auto_590396 ) ) ( not ( = ?auto_590394 ?auto_590397 ) ) ( not ( = ?auto_590394 ?auto_590398 ) ) ( not ( = ?auto_590395 ?auto_590396 ) ) ( not ( = ?auto_590395 ?auto_590397 ) ) ( not ( = ?auto_590395 ?auto_590398 ) ) ( not ( = ?auto_590396 ?auto_590397 ) ) ( not ( = ?auto_590396 ?auto_590398 ) ) ( not ( = ?auto_590397 ?auto_590398 ) ) ( ON ?auto_590383 ?auto_590399 ) ( not ( = ?auto_590398 ?auto_590399 ) ) ( not ( = ?auto_590397 ?auto_590399 ) ) ( not ( = ?auto_590396 ?auto_590399 ) ) ( not ( = ?auto_590395 ?auto_590399 ) ) ( not ( = ?auto_590394 ?auto_590399 ) ) ( not ( = ?auto_590393 ?auto_590399 ) ) ( not ( = ?auto_590392 ?auto_590399 ) ) ( not ( = ?auto_590391 ?auto_590399 ) ) ( not ( = ?auto_590390 ?auto_590399 ) ) ( not ( = ?auto_590389 ?auto_590399 ) ) ( not ( = ?auto_590388 ?auto_590399 ) ) ( not ( = ?auto_590387 ?auto_590399 ) ) ( not ( = ?auto_590386 ?auto_590399 ) ) ( not ( = ?auto_590385 ?auto_590399 ) ) ( not ( = ?auto_590384 ?auto_590399 ) ) ( not ( = ?auto_590383 ?auto_590399 ) ) ( ON ?auto_590384 ?auto_590383 ) ( ON ?auto_590385 ?auto_590384 ) ( ON ?auto_590386 ?auto_590385 ) ( ON ?auto_590387 ?auto_590386 ) ( ON ?auto_590388 ?auto_590387 ) ( ON ?auto_590389 ?auto_590388 ) ( ON ?auto_590390 ?auto_590389 ) ( ON ?auto_590391 ?auto_590390 ) ( ON ?auto_590392 ?auto_590391 ) ( ON ?auto_590393 ?auto_590392 ) ( ON ?auto_590394 ?auto_590393 ) ( ON ?auto_590395 ?auto_590394 ) ( ON ?auto_590396 ?auto_590395 ) ( ON ?auto_590397 ?auto_590396 ) ( ON ?auto_590398 ?auto_590397 ) ( CLEAR ?auto_590398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_590398 ?auto_590397 ?auto_590396 ?auto_590395 ?auto_590394 ?auto_590393 ?auto_590392 ?auto_590391 ?auto_590390 ?auto_590389 ?auto_590388 ?auto_590387 ?auto_590386 ?auto_590385 ?auto_590384 ?auto_590383 )
      ( MAKE-16PILE ?auto_590383 ?auto_590384 ?auto_590385 ?auto_590386 ?auto_590387 ?auto_590388 ?auto_590389 ?auto_590390 ?auto_590391 ?auto_590392 ?auto_590393 ?auto_590394 ?auto_590395 ?auto_590396 ?auto_590397 ?auto_590398 ) )
  )

)

