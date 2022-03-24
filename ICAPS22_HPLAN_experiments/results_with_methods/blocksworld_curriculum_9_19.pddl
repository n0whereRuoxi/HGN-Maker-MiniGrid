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
      ?auto_72281 - BLOCK
    )
    :vars
    (
      ?auto_72282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72281 ?auto_72282 ) ( CLEAR ?auto_72281 ) ( HAND-EMPTY ) ( not ( = ?auto_72281 ?auto_72282 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72281 ?auto_72282 )
      ( !PUTDOWN ?auto_72281 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72284 - BLOCK
    )
    :vars
    (
      ?auto_72285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72284 ?auto_72285 ) ( CLEAR ?auto_72284 ) ( HAND-EMPTY ) ( not ( = ?auto_72284 ?auto_72285 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72284 ?auto_72285 )
      ( !PUTDOWN ?auto_72284 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72288 - BLOCK
      ?auto_72289 - BLOCK
    )
    :vars
    (
      ?auto_72290 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72288 ) ( ON ?auto_72289 ?auto_72290 ) ( CLEAR ?auto_72289 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72288 ) ( not ( = ?auto_72288 ?auto_72289 ) ) ( not ( = ?auto_72288 ?auto_72290 ) ) ( not ( = ?auto_72289 ?auto_72290 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72289 ?auto_72290 )
      ( !STACK ?auto_72289 ?auto_72288 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72293 - BLOCK
      ?auto_72294 - BLOCK
    )
    :vars
    (
      ?auto_72295 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72293 ) ( ON ?auto_72294 ?auto_72295 ) ( CLEAR ?auto_72294 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72293 ) ( not ( = ?auto_72293 ?auto_72294 ) ) ( not ( = ?auto_72293 ?auto_72295 ) ) ( not ( = ?auto_72294 ?auto_72295 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72294 ?auto_72295 )
      ( !STACK ?auto_72294 ?auto_72293 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72298 - BLOCK
      ?auto_72299 - BLOCK
    )
    :vars
    (
      ?auto_72300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72299 ?auto_72300 ) ( not ( = ?auto_72298 ?auto_72299 ) ) ( not ( = ?auto_72298 ?auto_72300 ) ) ( not ( = ?auto_72299 ?auto_72300 ) ) ( ON ?auto_72298 ?auto_72299 ) ( CLEAR ?auto_72298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72298 )
      ( MAKE-2PILE ?auto_72298 ?auto_72299 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72303 - BLOCK
      ?auto_72304 - BLOCK
    )
    :vars
    (
      ?auto_72305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72304 ?auto_72305 ) ( not ( = ?auto_72303 ?auto_72304 ) ) ( not ( = ?auto_72303 ?auto_72305 ) ) ( not ( = ?auto_72304 ?auto_72305 ) ) ( ON ?auto_72303 ?auto_72304 ) ( CLEAR ?auto_72303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72303 )
      ( MAKE-2PILE ?auto_72303 ?auto_72304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72309 - BLOCK
      ?auto_72310 - BLOCK
      ?auto_72311 - BLOCK
    )
    :vars
    (
      ?auto_72312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72310 ) ( ON ?auto_72311 ?auto_72312 ) ( CLEAR ?auto_72311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72309 ) ( ON ?auto_72310 ?auto_72309 ) ( not ( = ?auto_72309 ?auto_72310 ) ) ( not ( = ?auto_72309 ?auto_72311 ) ) ( not ( = ?auto_72309 ?auto_72312 ) ) ( not ( = ?auto_72310 ?auto_72311 ) ) ( not ( = ?auto_72310 ?auto_72312 ) ) ( not ( = ?auto_72311 ?auto_72312 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72311 ?auto_72312 )
      ( !STACK ?auto_72311 ?auto_72310 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72316 - BLOCK
      ?auto_72317 - BLOCK
      ?auto_72318 - BLOCK
    )
    :vars
    (
      ?auto_72319 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72317 ) ( ON ?auto_72318 ?auto_72319 ) ( CLEAR ?auto_72318 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72316 ) ( ON ?auto_72317 ?auto_72316 ) ( not ( = ?auto_72316 ?auto_72317 ) ) ( not ( = ?auto_72316 ?auto_72318 ) ) ( not ( = ?auto_72316 ?auto_72319 ) ) ( not ( = ?auto_72317 ?auto_72318 ) ) ( not ( = ?auto_72317 ?auto_72319 ) ) ( not ( = ?auto_72318 ?auto_72319 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72318 ?auto_72319 )
      ( !STACK ?auto_72318 ?auto_72317 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72323 - BLOCK
      ?auto_72324 - BLOCK
      ?auto_72325 - BLOCK
    )
    :vars
    (
      ?auto_72326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72325 ?auto_72326 ) ( ON-TABLE ?auto_72323 ) ( not ( = ?auto_72323 ?auto_72324 ) ) ( not ( = ?auto_72323 ?auto_72325 ) ) ( not ( = ?auto_72323 ?auto_72326 ) ) ( not ( = ?auto_72324 ?auto_72325 ) ) ( not ( = ?auto_72324 ?auto_72326 ) ) ( not ( = ?auto_72325 ?auto_72326 ) ) ( CLEAR ?auto_72323 ) ( ON ?auto_72324 ?auto_72325 ) ( CLEAR ?auto_72324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72323 ?auto_72324 )
      ( MAKE-3PILE ?auto_72323 ?auto_72324 ?auto_72325 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72330 - BLOCK
      ?auto_72331 - BLOCK
      ?auto_72332 - BLOCK
    )
    :vars
    (
      ?auto_72333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72332 ?auto_72333 ) ( ON-TABLE ?auto_72330 ) ( not ( = ?auto_72330 ?auto_72331 ) ) ( not ( = ?auto_72330 ?auto_72332 ) ) ( not ( = ?auto_72330 ?auto_72333 ) ) ( not ( = ?auto_72331 ?auto_72332 ) ) ( not ( = ?auto_72331 ?auto_72333 ) ) ( not ( = ?auto_72332 ?auto_72333 ) ) ( CLEAR ?auto_72330 ) ( ON ?auto_72331 ?auto_72332 ) ( CLEAR ?auto_72331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72330 ?auto_72331 )
      ( MAKE-3PILE ?auto_72330 ?auto_72331 ?auto_72332 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72337 - BLOCK
      ?auto_72338 - BLOCK
      ?auto_72339 - BLOCK
    )
    :vars
    (
      ?auto_72340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72339 ?auto_72340 ) ( not ( = ?auto_72337 ?auto_72338 ) ) ( not ( = ?auto_72337 ?auto_72339 ) ) ( not ( = ?auto_72337 ?auto_72340 ) ) ( not ( = ?auto_72338 ?auto_72339 ) ) ( not ( = ?auto_72338 ?auto_72340 ) ) ( not ( = ?auto_72339 ?auto_72340 ) ) ( ON ?auto_72338 ?auto_72339 ) ( ON ?auto_72337 ?auto_72338 ) ( CLEAR ?auto_72337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72337 )
      ( MAKE-3PILE ?auto_72337 ?auto_72338 ?auto_72339 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72344 - BLOCK
      ?auto_72345 - BLOCK
      ?auto_72346 - BLOCK
    )
    :vars
    (
      ?auto_72347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72346 ?auto_72347 ) ( not ( = ?auto_72344 ?auto_72345 ) ) ( not ( = ?auto_72344 ?auto_72346 ) ) ( not ( = ?auto_72344 ?auto_72347 ) ) ( not ( = ?auto_72345 ?auto_72346 ) ) ( not ( = ?auto_72345 ?auto_72347 ) ) ( not ( = ?auto_72346 ?auto_72347 ) ) ( ON ?auto_72345 ?auto_72346 ) ( ON ?auto_72344 ?auto_72345 ) ( CLEAR ?auto_72344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72344 )
      ( MAKE-3PILE ?auto_72344 ?auto_72345 ?auto_72346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72352 - BLOCK
      ?auto_72353 - BLOCK
      ?auto_72354 - BLOCK
      ?auto_72355 - BLOCK
    )
    :vars
    (
      ?auto_72356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72354 ) ( ON ?auto_72355 ?auto_72356 ) ( CLEAR ?auto_72355 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72352 ) ( ON ?auto_72353 ?auto_72352 ) ( ON ?auto_72354 ?auto_72353 ) ( not ( = ?auto_72352 ?auto_72353 ) ) ( not ( = ?auto_72352 ?auto_72354 ) ) ( not ( = ?auto_72352 ?auto_72355 ) ) ( not ( = ?auto_72352 ?auto_72356 ) ) ( not ( = ?auto_72353 ?auto_72354 ) ) ( not ( = ?auto_72353 ?auto_72355 ) ) ( not ( = ?auto_72353 ?auto_72356 ) ) ( not ( = ?auto_72354 ?auto_72355 ) ) ( not ( = ?auto_72354 ?auto_72356 ) ) ( not ( = ?auto_72355 ?auto_72356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72355 ?auto_72356 )
      ( !STACK ?auto_72355 ?auto_72354 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72361 - BLOCK
      ?auto_72362 - BLOCK
      ?auto_72363 - BLOCK
      ?auto_72364 - BLOCK
    )
    :vars
    (
      ?auto_72365 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72363 ) ( ON ?auto_72364 ?auto_72365 ) ( CLEAR ?auto_72364 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72361 ) ( ON ?auto_72362 ?auto_72361 ) ( ON ?auto_72363 ?auto_72362 ) ( not ( = ?auto_72361 ?auto_72362 ) ) ( not ( = ?auto_72361 ?auto_72363 ) ) ( not ( = ?auto_72361 ?auto_72364 ) ) ( not ( = ?auto_72361 ?auto_72365 ) ) ( not ( = ?auto_72362 ?auto_72363 ) ) ( not ( = ?auto_72362 ?auto_72364 ) ) ( not ( = ?auto_72362 ?auto_72365 ) ) ( not ( = ?auto_72363 ?auto_72364 ) ) ( not ( = ?auto_72363 ?auto_72365 ) ) ( not ( = ?auto_72364 ?auto_72365 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72364 ?auto_72365 )
      ( !STACK ?auto_72364 ?auto_72363 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72370 - BLOCK
      ?auto_72371 - BLOCK
      ?auto_72372 - BLOCK
      ?auto_72373 - BLOCK
    )
    :vars
    (
      ?auto_72374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72373 ?auto_72374 ) ( ON-TABLE ?auto_72370 ) ( ON ?auto_72371 ?auto_72370 ) ( not ( = ?auto_72370 ?auto_72371 ) ) ( not ( = ?auto_72370 ?auto_72372 ) ) ( not ( = ?auto_72370 ?auto_72373 ) ) ( not ( = ?auto_72370 ?auto_72374 ) ) ( not ( = ?auto_72371 ?auto_72372 ) ) ( not ( = ?auto_72371 ?auto_72373 ) ) ( not ( = ?auto_72371 ?auto_72374 ) ) ( not ( = ?auto_72372 ?auto_72373 ) ) ( not ( = ?auto_72372 ?auto_72374 ) ) ( not ( = ?auto_72373 ?auto_72374 ) ) ( CLEAR ?auto_72371 ) ( ON ?auto_72372 ?auto_72373 ) ( CLEAR ?auto_72372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72370 ?auto_72371 ?auto_72372 )
      ( MAKE-4PILE ?auto_72370 ?auto_72371 ?auto_72372 ?auto_72373 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72379 - BLOCK
      ?auto_72380 - BLOCK
      ?auto_72381 - BLOCK
      ?auto_72382 - BLOCK
    )
    :vars
    (
      ?auto_72383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72382 ?auto_72383 ) ( ON-TABLE ?auto_72379 ) ( ON ?auto_72380 ?auto_72379 ) ( not ( = ?auto_72379 ?auto_72380 ) ) ( not ( = ?auto_72379 ?auto_72381 ) ) ( not ( = ?auto_72379 ?auto_72382 ) ) ( not ( = ?auto_72379 ?auto_72383 ) ) ( not ( = ?auto_72380 ?auto_72381 ) ) ( not ( = ?auto_72380 ?auto_72382 ) ) ( not ( = ?auto_72380 ?auto_72383 ) ) ( not ( = ?auto_72381 ?auto_72382 ) ) ( not ( = ?auto_72381 ?auto_72383 ) ) ( not ( = ?auto_72382 ?auto_72383 ) ) ( CLEAR ?auto_72380 ) ( ON ?auto_72381 ?auto_72382 ) ( CLEAR ?auto_72381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72379 ?auto_72380 ?auto_72381 )
      ( MAKE-4PILE ?auto_72379 ?auto_72380 ?auto_72381 ?auto_72382 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72388 - BLOCK
      ?auto_72389 - BLOCK
      ?auto_72390 - BLOCK
      ?auto_72391 - BLOCK
    )
    :vars
    (
      ?auto_72392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72391 ?auto_72392 ) ( ON-TABLE ?auto_72388 ) ( not ( = ?auto_72388 ?auto_72389 ) ) ( not ( = ?auto_72388 ?auto_72390 ) ) ( not ( = ?auto_72388 ?auto_72391 ) ) ( not ( = ?auto_72388 ?auto_72392 ) ) ( not ( = ?auto_72389 ?auto_72390 ) ) ( not ( = ?auto_72389 ?auto_72391 ) ) ( not ( = ?auto_72389 ?auto_72392 ) ) ( not ( = ?auto_72390 ?auto_72391 ) ) ( not ( = ?auto_72390 ?auto_72392 ) ) ( not ( = ?auto_72391 ?auto_72392 ) ) ( ON ?auto_72390 ?auto_72391 ) ( CLEAR ?auto_72388 ) ( ON ?auto_72389 ?auto_72390 ) ( CLEAR ?auto_72389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72388 ?auto_72389 )
      ( MAKE-4PILE ?auto_72388 ?auto_72389 ?auto_72390 ?auto_72391 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72397 - BLOCK
      ?auto_72398 - BLOCK
      ?auto_72399 - BLOCK
      ?auto_72400 - BLOCK
    )
    :vars
    (
      ?auto_72401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72400 ?auto_72401 ) ( ON-TABLE ?auto_72397 ) ( not ( = ?auto_72397 ?auto_72398 ) ) ( not ( = ?auto_72397 ?auto_72399 ) ) ( not ( = ?auto_72397 ?auto_72400 ) ) ( not ( = ?auto_72397 ?auto_72401 ) ) ( not ( = ?auto_72398 ?auto_72399 ) ) ( not ( = ?auto_72398 ?auto_72400 ) ) ( not ( = ?auto_72398 ?auto_72401 ) ) ( not ( = ?auto_72399 ?auto_72400 ) ) ( not ( = ?auto_72399 ?auto_72401 ) ) ( not ( = ?auto_72400 ?auto_72401 ) ) ( ON ?auto_72399 ?auto_72400 ) ( CLEAR ?auto_72397 ) ( ON ?auto_72398 ?auto_72399 ) ( CLEAR ?auto_72398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72397 ?auto_72398 )
      ( MAKE-4PILE ?auto_72397 ?auto_72398 ?auto_72399 ?auto_72400 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72406 - BLOCK
      ?auto_72407 - BLOCK
      ?auto_72408 - BLOCK
      ?auto_72409 - BLOCK
    )
    :vars
    (
      ?auto_72410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72409 ?auto_72410 ) ( not ( = ?auto_72406 ?auto_72407 ) ) ( not ( = ?auto_72406 ?auto_72408 ) ) ( not ( = ?auto_72406 ?auto_72409 ) ) ( not ( = ?auto_72406 ?auto_72410 ) ) ( not ( = ?auto_72407 ?auto_72408 ) ) ( not ( = ?auto_72407 ?auto_72409 ) ) ( not ( = ?auto_72407 ?auto_72410 ) ) ( not ( = ?auto_72408 ?auto_72409 ) ) ( not ( = ?auto_72408 ?auto_72410 ) ) ( not ( = ?auto_72409 ?auto_72410 ) ) ( ON ?auto_72408 ?auto_72409 ) ( ON ?auto_72407 ?auto_72408 ) ( ON ?auto_72406 ?auto_72407 ) ( CLEAR ?auto_72406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72406 )
      ( MAKE-4PILE ?auto_72406 ?auto_72407 ?auto_72408 ?auto_72409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72415 - BLOCK
      ?auto_72416 - BLOCK
      ?auto_72417 - BLOCK
      ?auto_72418 - BLOCK
    )
    :vars
    (
      ?auto_72419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72418 ?auto_72419 ) ( not ( = ?auto_72415 ?auto_72416 ) ) ( not ( = ?auto_72415 ?auto_72417 ) ) ( not ( = ?auto_72415 ?auto_72418 ) ) ( not ( = ?auto_72415 ?auto_72419 ) ) ( not ( = ?auto_72416 ?auto_72417 ) ) ( not ( = ?auto_72416 ?auto_72418 ) ) ( not ( = ?auto_72416 ?auto_72419 ) ) ( not ( = ?auto_72417 ?auto_72418 ) ) ( not ( = ?auto_72417 ?auto_72419 ) ) ( not ( = ?auto_72418 ?auto_72419 ) ) ( ON ?auto_72417 ?auto_72418 ) ( ON ?auto_72416 ?auto_72417 ) ( ON ?auto_72415 ?auto_72416 ) ( CLEAR ?auto_72415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72415 )
      ( MAKE-4PILE ?auto_72415 ?auto_72416 ?auto_72417 ?auto_72418 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72425 - BLOCK
      ?auto_72426 - BLOCK
      ?auto_72427 - BLOCK
      ?auto_72428 - BLOCK
      ?auto_72429 - BLOCK
    )
    :vars
    (
      ?auto_72430 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72428 ) ( ON ?auto_72429 ?auto_72430 ) ( CLEAR ?auto_72429 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72425 ) ( ON ?auto_72426 ?auto_72425 ) ( ON ?auto_72427 ?auto_72426 ) ( ON ?auto_72428 ?auto_72427 ) ( not ( = ?auto_72425 ?auto_72426 ) ) ( not ( = ?auto_72425 ?auto_72427 ) ) ( not ( = ?auto_72425 ?auto_72428 ) ) ( not ( = ?auto_72425 ?auto_72429 ) ) ( not ( = ?auto_72425 ?auto_72430 ) ) ( not ( = ?auto_72426 ?auto_72427 ) ) ( not ( = ?auto_72426 ?auto_72428 ) ) ( not ( = ?auto_72426 ?auto_72429 ) ) ( not ( = ?auto_72426 ?auto_72430 ) ) ( not ( = ?auto_72427 ?auto_72428 ) ) ( not ( = ?auto_72427 ?auto_72429 ) ) ( not ( = ?auto_72427 ?auto_72430 ) ) ( not ( = ?auto_72428 ?auto_72429 ) ) ( not ( = ?auto_72428 ?auto_72430 ) ) ( not ( = ?auto_72429 ?auto_72430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72429 ?auto_72430 )
      ( !STACK ?auto_72429 ?auto_72428 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72436 - BLOCK
      ?auto_72437 - BLOCK
      ?auto_72438 - BLOCK
      ?auto_72439 - BLOCK
      ?auto_72440 - BLOCK
    )
    :vars
    (
      ?auto_72441 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72439 ) ( ON ?auto_72440 ?auto_72441 ) ( CLEAR ?auto_72440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72436 ) ( ON ?auto_72437 ?auto_72436 ) ( ON ?auto_72438 ?auto_72437 ) ( ON ?auto_72439 ?auto_72438 ) ( not ( = ?auto_72436 ?auto_72437 ) ) ( not ( = ?auto_72436 ?auto_72438 ) ) ( not ( = ?auto_72436 ?auto_72439 ) ) ( not ( = ?auto_72436 ?auto_72440 ) ) ( not ( = ?auto_72436 ?auto_72441 ) ) ( not ( = ?auto_72437 ?auto_72438 ) ) ( not ( = ?auto_72437 ?auto_72439 ) ) ( not ( = ?auto_72437 ?auto_72440 ) ) ( not ( = ?auto_72437 ?auto_72441 ) ) ( not ( = ?auto_72438 ?auto_72439 ) ) ( not ( = ?auto_72438 ?auto_72440 ) ) ( not ( = ?auto_72438 ?auto_72441 ) ) ( not ( = ?auto_72439 ?auto_72440 ) ) ( not ( = ?auto_72439 ?auto_72441 ) ) ( not ( = ?auto_72440 ?auto_72441 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72440 ?auto_72441 )
      ( !STACK ?auto_72440 ?auto_72439 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72447 - BLOCK
      ?auto_72448 - BLOCK
      ?auto_72449 - BLOCK
      ?auto_72450 - BLOCK
      ?auto_72451 - BLOCK
    )
    :vars
    (
      ?auto_72452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72451 ?auto_72452 ) ( ON-TABLE ?auto_72447 ) ( ON ?auto_72448 ?auto_72447 ) ( ON ?auto_72449 ?auto_72448 ) ( not ( = ?auto_72447 ?auto_72448 ) ) ( not ( = ?auto_72447 ?auto_72449 ) ) ( not ( = ?auto_72447 ?auto_72450 ) ) ( not ( = ?auto_72447 ?auto_72451 ) ) ( not ( = ?auto_72447 ?auto_72452 ) ) ( not ( = ?auto_72448 ?auto_72449 ) ) ( not ( = ?auto_72448 ?auto_72450 ) ) ( not ( = ?auto_72448 ?auto_72451 ) ) ( not ( = ?auto_72448 ?auto_72452 ) ) ( not ( = ?auto_72449 ?auto_72450 ) ) ( not ( = ?auto_72449 ?auto_72451 ) ) ( not ( = ?auto_72449 ?auto_72452 ) ) ( not ( = ?auto_72450 ?auto_72451 ) ) ( not ( = ?auto_72450 ?auto_72452 ) ) ( not ( = ?auto_72451 ?auto_72452 ) ) ( CLEAR ?auto_72449 ) ( ON ?auto_72450 ?auto_72451 ) ( CLEAR ?auto_72450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72447 ?auto_72448 ?auto_72449 ?auto_72450 )
      ( MAKE-5PILE ?auto_72447 ?auto_72448 ?auto_72449 ?auto_72450 ?auto_72451 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72458 - BLOCK
      ?auto_72459 - BLOCK
      ?auto_72460 - BLOCK
      ?auto_72461 - BLOCK
      ?auto_72462 - BLOCK
    )
    :vars
    (
      ?auto_72463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72462 ?auto_72463 ) ( ON-TABLE ?auto_72458 ) ( ON ?auto_72459 ?auto_72458 ) ( ON ?auto_72460 ?auto_72459 ) ( not ( = ?auto_72458 ?auto_72459 ) ) ( not ( = ?auto_72458 ?auto_72460 ) ) ( not ( = ?auto_72458 ?auto_72461 ) ) ( not ( = ?auto_72458 ?auto_72462 ) ) ( not ( = ?auto_72458 ?auto_72463 ) ) ( not ( = ?auto_72459 ?auto_72460 ) ) ( not ( = ?auto_72459 ?auto_72461 ) ) ( not ( = ?auto_72459 ?auto_72462 ) ) ( not ( = ?auto_72459 ?auto_72463 ) ) ( not ( = ?auto_72460 ?auto_72461 ) ) ( not ( = ?auto_72460 ?auto_72462 ) ) ( not ( = ?auto_72460 ?auto_72463 ) ) ( not ( = ?auto_72461 ?auto_72462 ) ) ( not ( = ?auto_72461 ?auto_72463 ) ) ( not ( = ?auto_72462 ?auto_72463 ) ) ( CLEAR ?auto_72460 ) ( ON ?auto_72461 ?auto_72462 ) ( CLEAR ?auto_72461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72458 ?auto_72459 ?auto_72460 ?auto_72461 )
      ( MAKE-5PILE ?auto_72458 ?auto_72459 ?auto_72460 ?auto_72461 ?auto_72462 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72469 - BLOCK
      ?auto_72470 - BLOCK
      ?auto_72471 - BLOCK
      ?auto_72472 - BLOCK
      ?auto_72473 - BLOCK
    )
    :vars
    (
      ?auto_72474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72473 ?auto_72474 ) ( ON-TABLE ?auto_72469 ) ( ON ?auto_72470 ?auto_72469 ) ( not ( = ?auto_72469 ?auto_72470 ) ) ( not ( = ?auto_72469 ?auto_72471 ) ) ( not ( = ?auto_72469 ?auto_72472 ) ) ( not ( = ?auto_72469 ?auto_72473 ) ) ( not ( = ?auto_72469 ?auto_72474 ) ) ( not ( = ?auto_72470 ?auto_72471 ) ) ( not ( = ?auto_72470 ?auto_72472 ) ) ( not ( = ?auto_72470 ?auto_72473 ) ) ( not ( = ?auto_72470 ?auto_72474 ) ) ( not ( = ?auto_72471 ?auto_72472 ) ) ( not ( = ?auto_72471 ?auto_72473 ) ) ( not ( = ?auto_72471 ?auto_72474 ) ) ( not ( = ?auto_72472 ?auto_72473 ) ) ( not ( = ?auto_72472 ?auto_72474 ) ) ( not ( = ?auto_72473 ?auto_72474 ) ) ( ON ?auto_72472 ?auto_72473 ) ( CLEAR ?auto_72470 ) ( ON ?auto_72471 ?auto_72472 ) ( CLEAR ?auto_72471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72469 ?auto_72470 ?auto_72471 )
      ( MAKE-5PILE ?auto_72469 ?auto_72470 ?auto_72471 ?auto_72472 ?auto_72473 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72480 - BLOCK
      ?auto_72481 - BLOCK
      ?auto_72482 - BLOCK
      ?auto_72483 - BLOCK
      ?auto_72484 - BLOCK
    )
    :vars
    (
      ?auto_72485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72484 ?auto_72485 ) ( ON-TABLE ?auto_72480 ) ( ON ?auto_72481 ?auto_72480 ) ( not ( = ?auto_72480 ?auto_72481 ) ) ( not ( = ?auto_72480 ?auto_72482 ) ) ( not ( = ?auto_72480 ?auto_72483 ) ) ( not ( = ?auto_72480 ?auto_72484 ) ) ( not ( = ?auto_72480 ?auto_72485 ) ) ( not ( = ?auto_72481 ?auto_72482 ) ) ( not ( = ?auto_72481 ?auto_72483 ) ) ( not ( = ?auto_72481 ?auto_72484 ) ) ( not ( = ?auto_72481 ?auto_72485 ) ) ( not ( = ?auto_72482 ?auto_72483 ) ) ( not ( = ?auto_72482 ?auto_72484 ) ) ( not ( = ?auto_72482 ?auto_72485 ) ) ( not ( = ?auto_72483 ?auto_72484 ) ) ( not ( = ?auto_72483 ?auto_72485 ) ) ( not ( = ?auto_72484 ?auto_72485 ) ) ( ON ?auto_72483 ?auto_72484 ) ( CLEAR ?auto_72481 ) ( ON ?auto_72482 ?auto_72483 ) ( CLEAR ?auto_72482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72480 ?auto_72481 ?auto_72482 )
      ( MAKE-5PILE ?auto_72480 ?auto_72481 ?auto_72482 ?auto_72483 ?auto_72484 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72491 - BLOCK
      ?auto_72492 - BLOCK
      ?auto_72493 - BLOCK
      ?auto_72494 - BLOCK
      ?auto_72495 - BLOCK
    )
    :vars
    (
      ?auto_72496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72495 ?auto_72496 ) ( ON-TABLE ?auto_72491 ) ( not ( = ?auto_72491 ?auto_72492 ) ) ( not ( = ?auto_72491 ?auto_72493 ) ) ( not ( = ?auto_72491 ?auto_72494 ) ) ( not ( = ?auto_72491 ?auto_72495 ) ) ( not ( = ?auto_72491 ?auto_72496 ) ) ( not ( = ?auto_72492 ?auto_72493 ) ) ( not ( = ?auto_72492 ?auto_72494 ) ) ( not ( = ?auto_72492 ?auto_72495 ) ) ( not ( = ?auto_72492 ?auto_72496 ) ) ( not ( = ?auto_72493 ?auto_72494 ) ) ( not ( = ?auto_72493 ?auto_72495 ) ) ( not ( = ?auto_72493 ?auto_72496 ) ) ( not ( = ?auto_72494 ?auto_72495 ) ) ( not ( = ?auto_72494 ?auto_72496 ) ) ( not ( = ?auto_72495 ?auto_72496 ) ) ( ON ?auto_72494 ?auto_72495 ) ( ON ?auto_72493 ?auto_72494 ) ( CLEAR ?auto_72491 ) ( ON ?auto_72492 ?auto_72493 ) ( CLEAR ?auto_72492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72491 ?auto_72492 )
      ( MAKE-5PILE ?auto_72491 ?auto_72492 ?auto_72493 ?auto_72494 ?auto_72495 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72502 - BLOCK
      ?auto_72503 - BLOCK
      ?auto_72504 - BLOCK
      ?auto_72505 - BLOCK
      ?auto_72506 - BLOCK
    )
    :vars
    (
      ?auto_72507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72506 ?auto_72507 ) ( ON-TABLE ?auto_72502 ) ( not ( = ?auto_72502 ?auto_72503 ) ) ( not ( = ?auto_72502 ?auto_72504 ) ) ( not ( = ?auto_72502 ?auto_72505 ) ) ( not ( = ?auto_72502 ?auto_72506 ) ) ( not ( = ?auto_72502 ?auto_72507 ) ) ( not ( = ?auto_72503 ?auto_72504 ) ) ( not ( = ?auto_72503 ?auto_72505 ) ) ( not ( = ?auto_72503 ?auto_72506 ) ) ( not ( = ?auto_72503 ?auto_72507 ) ) ( not ( = ?auto_72504 ?auto_72505 ) ) ( not ( = ?auto_72504 ?auto_72506 ) ) ( not ( = ?auto_72504 ?auto_72507 ) ) ( not ( = ?auto_72505 ?auto_72506 ) ) ( not ( = ?auto_72505 ?auto_72507 ) ) ( not ( = ?auto_72506 ?auto_72507 ) ) ( ON ?auto_72505 ?auto_72506 ) ( ON ?auto_72504 ?auto_72505 ) ( CLEAR ?auto_72502 ) ( ON ?auto_72503 ?auto_72504 ) ( CLEAR ?auto_72503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72502 ?auto_72503 )
      ( MAKE-5PILE ?auto_72502 ?auto_72503 ?auto_72504 ?auto_72505 ?auto_72506 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72513 - BLOCK
      ?auto_72514 - BLOCK
      ?auto_72515 - BLOCK
      ?auto_72516 - BLOCK
      ?auto_72517 - BLOCK
    )
    :vars
    (
      ?auto_72518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72517 ?auto_72518 ) ( not ( = ?auto_72513 ?auto_72514 ) ) ( not ( = ?auto_72513 ?auto_72515 ) ) ( not ( = ?auto_72513 ?auto_72516 ) ) ( not ( = ?auto_72513 ?auto_72517 ) ) ( not ( = ?auto_72513 ?auto_72518 ) ) ( not ( = ?auto_72514 ?auto_72515 ) ) ( not ( = ?auto_72514 ?auto_72516 ) ) ( not ( = ?auto_72514 ?auto_72517 ) ) ( not ( = ?auto_72514 ?auto_72518 ) ) ( not ( = ?auto_72515 ?auto_72516 ) ) ( not ( = ?auto_72515 ?auto_72517 ) ) ( not ( = ?auto_72515 ?auto_72518 ) ) ( not ( = ?auto_72516 ?auto_72517 ) ) ( not ( = ?auto_72516 ?auto_72518 ) ) ( not ( = ?auto_72517 ?auto_72518 ) ) ( ON ?auto_72516 ?auto_72517 ) ( ON ?auto_72515 ?auto_72516 ) ( ON ?auto_72514 ?auto_72515 ) ( ON ?auto_72513 ?auto_72514 ) ( CLEAR ?auto_72513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72513 )
      ( MAKE-5PILE ?auto_72513 ?auto_72514 ?auto_72515 ?auto_72516 ?auto_72517 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72524 - BLOCK
      ?auto_72525 - BLOCK
      ?auto_72526 - BLOCK
      ?auto_72527 - BLOCK
      ?auto_72528 - BLOCK
    )
    :vars
    (
      ?auto_72529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72528 ?auto_72529 ) ( not ( = ?auto_72524 ?auto_72525 ) ) ( not ( = ?auto_72524 ?auto_72526 ) ) ( not ( = ?auto_72524 ?auto_72527 ) ) ( not ( = ?auto_72524 ?auto_72528 ) ) ( not ( = ?auto_72524 ?auto_72529 ) ) ( not ( = ?auto_72525 ?auto_72526 ) ) ( not ( = ?auto_72525 ?auto_72527 ) ) ( not ( = ?auto_72525 ?auto_72528 ) ) ( not ( = ?auto_72525 ?auto_72529 ) ) ( not ( = ?auto_72526 ?auto_72527 ) ) ( not ( = ?auto_72526 ?auto_72528 ) ) ( not ( = ?auto_72526 ?auto_72529 ) ) ( not ( = ?auto_72527 ?auto_72528 ) ) ( not ( = ?auto_72527 ?auto_72529 ) ) ( not ( = ?auto_72528 ?auto_72529 ) ) ( ON ?auto_72527 ?auto_72528 ) ( ON ?auto_72526 ?auto_72527 ) ( ON ?auto_72525 ?auto_72526 ) ( ON ?auto_72524 ?auto_72525 ) ( CLEAR ?auto_72524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72524 )
      ( MAKE-5PILE ?auto_72524 ?auto_72525 ?auto_72526 ?auto_72527 ?auto_72528 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72536 - BLOCK
      ?auto_72537 - BLOCK
      ?auto_72538 - BLOCK
      ?auto_72539 - BLOCK
      ?auto_72540 - BLOCK
      ?auto_72541 - BLOCK
    )
    :vars
    (
      ?auto_72542 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72540 ) ( ON ?auto_72541 ?auto_72542 ) ( CLEAR ?auto_72541 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72536 ) ( ON ?auto_72537 ?auto_72536 ) ( ON ?auto_72538 ?auto_72537 ) ( ON ?auto_72539 ?auto_72538 ) ( ON ?auto_72540 ?auto_72539 ) ( not ( = ?auto_72536 ?auto_72537 ) ) ( not ( = ?auto_72536 ?auto_72538 ) ) ( not ( = ?auto_72536 ?auto_72539 ) ) ( not ( = ?auto_72536 ?auto_72540 ) ) ( not ( = ?auto_72536 ?auto_72541 ) ) ( not ( = ?auto_72536 ?auto_72542 ) ) ( not ( = ?auto_72537 ?auto_72538 ) ) ( not ( = ?auto_72537 ?auto_72539 ) ) ( not ( = ?auto_72537 ?auto_72540 ) ) ( not ( = ?auto_72537 ?auto_72541 ) ) ( not ( = ?auto_72537 ?auto_72542 ) ) ( not ( = ?auto_72538 ?auto_72539 ) ) ( not ( = ?auto_72538 ?auto_72540 ) ) ( not ( = ?auto_72538 ?auto_72541 ) ) ( not ( = ?auto_72538 ?auto_72542 ) ) ( not ( = ?auto_72539 ?auto_72540 ) ) ( not ( = ?auto_72539 ?auto_72541 ) ) ( not ( = ?auto_72539 ?auto_72542 ) ) ( not ( = ?auto_72540 ?auto_72541 ) ) ( not ( = ?auto_72540 ?auto_72542 ) ) ( not ( = ?auto_72541 ?auto_72542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72541 ?auto_72542 )
      ( !STACK ?auto_72541 ?auto_72540 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72549 - BLOCK
      ?auto_72550 - BLOCK
      ?auto_72551 - BLOCK
      ?auto_72552 - BLOCK
      ?auto_72553 - BLOCK
      ?auto_72554 - BLOCK
    )
    :vars
    (
      ?auto_72555 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72553 ) ( ON ?auto_72554 ?auto_72555 ) ( CLEAR ?auto_72554 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72549 ) ( ON ?auto_72550 ?auto_72549 ) ( ON ?auto_72551 ?auto_72550 ) ( ON ?auto_72552 ?auto_72551 ) ( ON ?auto_72553 ?auto_72552 ) ( not ( = ?auto_72549 ?auto_72550 ) ) ( not ( = ?auto_72549 ?auto_72551 ) ) ( not ( = ?auto_72549 ?auto_72552 ) ) ( not ( = ?auto_72549 ?auto_72553 ) ) ( not ( = ?auto_72549 ?auto_72554 ) ) ( not ( = ?auto_72549 ?auto_72555 ) ) ( not ( = ?auto_72550 ?auto_72551 ) ) ( not ( = ?auto_72550 ?auto_72552 ) ) ( not ( = ?auto_72550 ?auto_72553 ) ) ( not ( = ?auto_72550 ?auto_72554 ) ) ( not ( = ?auto_72550 ?auto_72555 ) ) ( not ( = ?auto_72551 ?auto_72552 ) ) ( not ( = ?auto_72551 ?auto_72553 ) ) ( not ( = ?auto_72551 ?auto_72554 ) ) ( not ( = ?auto_72551 ?auto_72555 ) ) ( not ( = ?auto_72552 ?auto_72553 ) ) ( not ( = ?auto_72552 ?auto_72554 ) ) ( not ( = ?auto_72552 ?auto_72555 ) ) ( not ( = ?auto_72553 ?auto_72554 ) ) ( not ( = ?auto_72553 ?auto_72555 ) ) ( not ( = ?auto_72554 ?auto_72555 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72554 ?auto_72555 )
      ( !STACK ?auto_72554 ?auto_72553 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72562 - BLOCK
      ?auto_72563 - BLOCK
      ?auto_72564 - BLOCK
      ?auto_72565 - BLOCK
      ?auto_72566 - BLOCK
      ?auto_72567 - BLOCK
    )
    :vars
    (
      ?auto_72568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72567 ?auto_72568 ) ( ON-TABLE ?auto_72562 ) ( ON ?auto_72563 ?auto_72562 ) ( ON ?auto_72564 ?auto_72563 ) ( ON ?auto_72565 ?auto_72564 ) ( not ( = ?auto_72562 ?auto_72563 ) ) ( not ( = ?auto_72562 ?auto_72564 ) ) ( not ( = ?auto_72562 ?auto_72565 ) ) ( not ( = ?auto_72562 ?auto_72566 ) ) ( not ( = ?auto_72562 ?auto_72567 ) ) ( not ( = ?auto_72562 ?auto_72568 ) ) ( not ( = ?auto_72563 ?auto_72564 ) ) ( not ( = ?auto_72563 ?auto_72565 ) ) ( not ( = ?auto_72563 ?auto_72566 ) ) ( not ( = ?auto_72563 ?auto_72567 ) ) ( not ( = ?auto_72563 ?auto_72568 ) ) ( not ( = ?auto_72564 ?auto_72565 ) ) ( not ( = ?auto_72564 ?auto_72566 ) ) ( not ( = ?auto_72564 ?auto_72567 ) ) ( not ( = ?auto_72564 ?auto_72568 ) ) ( not ( = ?auto_72565 ?auto_72566 ) ) ( not ( = ?auto_72565 ?auto_72567 ) ) ( not ( = ?auto_72565 ?auto_72568 ) ) ( not ( = ?auto_72566 ?auto_72567 ) ) ( not ( = ?auto_72566 ?auto_72568 ) ) ( not ( = ?auto_72567 ?auto_72568 ) ) ( CLEAR ?auto_72565 ) ( ON ?auto_72566 ?auto_72567 ) ( CLEAR ?auto_72566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72562 ?auto_72563 ?auto_72564 ?auto_72565 ?auto_72566 )
      ( MAKE-6PILE ?auto_72562 ?auto_72563 ?auto_72564 ?auto_72565 ?auto_72566 ?auto_72567 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72575 - BLOCK
      ?auto_72576 - BLOCK
      ?auto_72577 - BLOCK
      ?auto_72578 - BLOCK
      ?auto_72579 - BLOCK
      ?auto_72580 - BLOCK
    )
    :vars
    (
      ?auto_72581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72580 ?auto_72581 ) ( ON-TABLE ?auto_72575 ) ( ON ?auto_72576 ?auto_72575 ) ( ON ?auto_72577 ?auto_72576 ) ( ON ?auto_72578 ?auto_72577 ) ( not ( = ?auto_72575 ?auto_72576 ) ) ( not ( = ?auto_72575 ?auto_72577 ) ) ( not ( = ?auto_72575 ?auto_72578 ) ) ( not ( = ?auto_72575 ?auto_72579 ) ) ( not ( = ?auto_72575 ?auto_72580 ) ) ( not ( = ?auto_72575 ?auto_72581 ) ) ( not ( = ?auto_72576 ?auto_72577 ) ) ( not ( = ?auto_72576 ?auto_72578 ) ) ( not ( = ?auto_72576 ?auto_72579 ) ) ( not ( = ?auto_72576 ?auto_72580 ) ) ( not ( = ?auto_72576 ?auto_72581 ) ) ( not ( = ?auto_72577 ?auto_72578 ) ) ( not ( = ?auto_72577 ?auto_72579 ) ) ( not ( = ?auto_72577 ?auto_72580 ) ) ( not ( = ?auto_72577 ?auto_72581 ) ) ( not ( = ?auto_72578 ?auto_72579 ) ) ( not ( = ?auto_72578 ?auto_72580 ) ) ( not ( = ?auto_72578 ?auto_72581 ) ) ( not ( = ?auto_72579 ?auto_72580 ) ) ( not ( = ?auto_72579 ?auto_72581 ) ) ( not ( = ?auto_72580 ?auto_72581 ) ) ( CLEAR ?auto_72578 ) ( ON ?auto_72579 ?auto_72580 ) ( CLEAR ?auto_72579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72575 ?auto_72576 ?auto_72577 ?auto_72578 ?auto_72579 )
      ( MAKE-6PILE ?auto_72575 ?auto_72576 ?auto_72577 ?auto_72578 ?auto_72579 ?auto_72580 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72588 - BLOCK
      ?auto_72589 - BLOCK
      ?auto_72590 - BLOCK
      ?auto_72591 - BLOCK
      ?auto_72592 - BLOCK
      ?auto_72593 - BLOCK
    )
    :vars
    (
      ?auto_72594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72593 ?auto_72594 ) ( ON-TABLE ?auto_72588 ) ( ON ?auto_72589 ?auto_72588 ) ( ON ?auto_72590 ?auto_72589 ) ( not ( = ?auto_72588 ?auto_72589 ) ) ( not ( = ?auto_72588 ?auto_72590 ) ) ( not ( = ?auto_72588 ?auto_72591 ) ) ( not ( = ?auto_72588 ?auto_72592 ) ) ( not ( = ?auto_72588 ?auto_72593 ) ) ( not ( = ?auto_72588 ?auto_72594 ) ) ( not ( = ?auto_72589 ?auto_72590 ) ) ( not ( = ?auto_72589 ?auto_72591 ) ) ( not ( = ?auto_72589 ?auto_72592 ) ) ( not ( = ?auto_72589 ?auto_72593 ) ) ( not ( = ?auto_72589 ?auto_72594 ) ) ( not ( = ?auto_72590 ?auto_72591 ) ) ( not ( = ?auto_72590 ?auto_72592 ) ) ( not ( = ?auto_72590 ?auto_72593 ) ) ( not ( = ?auto_72590 ?auto_72594 ) ) ( not ( = ?auto_72591 ?auto_72592 ) ) ( not ( = ?auto_72591 ?auto_72593 ) ) ( not ( = ?auto_72591 ?auto_72594 ) ) ( not ( = ?auto_72592 ?auto_72593 ) ) ( not ( = ?auto_72592 ?auto_72594 ) ) ( not ( = ?auto_72593 ?auto_72594 ) ) ( ON ?auto_72592 ?auto_72593 ) ( CLEAR ?auto_72590 ) ( ON ?auto_72591 ?auto_72592 ) ( CLEAR ?auto_72591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72588 ?auto_72589 ?auto_72590 ?auto_72591 )
      ( MAKE-6PILE ?auto_72588 ?auto_72589 ?auto_72590 ?auto_72591 ?auto_72592 ?auto_72593 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72601 - BLOCK
      ?auto_72602 - BLOCK
      ?auto_72603 - BLOCK
      ?auto_72604 - BLOCK
      ?auto_72605 - BLOCK
      ?auto_72606 - BLOCK
    )
    :vars
    (
      ?auto_72607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72606 ?auto_72607 ) ( ON-TABLE ?auto_72601 ) ( ON ?auto_72602 ?auto_72601 ) ( ON ?auto_72603 ?auto_72602 ) ( not ( = ?auto_72601 ?auto_72602 ) ) ( not ( = ?auto_72601 ?auto_72603 ) ) ( not ( = ?auto_72601 ?auto_72604 ) ) ( not ( = ?auto_72601 ?auto_72605 ) ) ( not ( = ?auto_72601 ?auto_72606 ) ) ( not ( = ?auto_72601 ?auto_72607 ) ) ( not ( = ?auto_72602 ?auto_72603 ) ) ( not ( = ?auto_72602 ?auto_72604 ) ) ( not ( = ?auto_72602 ?auto_72605 ) ) ( not ( = ?auto_72602 ?auto_72606 ) ) ( not ( = ?auto_72602 ?auto_72607 ) ) ( not ( = ?auto_72603 ?auto_72604 ) ) ( not ( = ?auto_72603 ?auto_72605 ) ) ( not ( = ?auto_72603 ?auto_72606 ) ) ( not ( = ?auto_72603 ?auto_72607 ) ) ( not ( = ?auto_72604 ?auto_72605 ) ) ( not ( = ?auto_72604 ?auto_72606 ) ) ( not ( = ?auto_72604 ?auto_72607 ) ) ( not ( = ?auto_72605 ?auto_72606 ) ) ( not ( = ?auto_72605 ?auto_72607 ) ) ( not ( = ?auto_72606 ?auto_72607 ) ) ( ON ?auto_72605 ?auto_72606 ) ( CLEAR ?auto_72603 ) ( ON ?auto_72604 ?auto_72605 ) ( CLEAR ?auto_72604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72601 ?auto_72602 ?auto_72603 ?auto_72604 )
      ( MAKE-6PILE ?auto_72601 ?auto_72602 ?auto_72603 ?auto_72604 ?auto_72605 ?auto_72606 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72614 - BLOCK
      ?auto_72615 - BLOCK
      ?auto_72616 - BLOCK
      ?auto_72617 - BLOCK
      ?auto_72618 - BLOCK
      ?auto_72619 - BLOCK
    )
    :vars
    (
      ?auto_72620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72619 ?auto_72620 ) ( ON-TABLE ?auto_72614 ) ( ON ?auto_72615 ?auto_72614 ) ( not ( = ?auto_72614 ?auto_72615 ) ) ( not ( = ?auto_72614 ?auto_72616 ) ) ( not ( = ?auto_72614 ?auto_72617 ) ) ( not ( = ?auto_72614 ?auto_72618 ) ) ( not ( = ?auto_72614 ?auto_72619 ) ) ( not ( = ?auto_72614 ?auto_72620 ) ) ( not ( = ?auto_72615 ?auto_72616 ) ) ( not ( = ?auto_72615 ?auto_72617 ) ) ( not ( = ?auto_72615 ?auto_72618 ) ) ( not ( = ?auto_72615 ?auto_72619 ) ) ( not ( = ?auto_72615 ?auto_72620 ) ) ( not ( = ?auto_72616 ?auto_72617 ) ) ( not ( = ?auto_72616 ?auto_72618 ) ) ( not ( = ?auto_72616 ?auto_72619 ) ) ( not ( = ?auto_72616 ?auto_72620 ) ) ( not ( = ?auto_72617 ?auto_72618 ) ) ( not ( = ?auto_72617 ?auto_72619 ) ) ( not ( = ?auto_72617 ?auto_72620 ) ) ( not ( = ?auto_72618 ?auto_72619 ) ) ( not ( = ?auto_72618 ?auto_72620 ) ) ( not ( = ?auto_72619 ?auto_72620 ) ) ( ON ?auto_72618 ?auto_72619 ) ( ON ?auto_72617 ?auto_72618 ) ( CLEAR ?auto_72615 ) ( ON ?auto_72616 ?auto_72617 ) ( CLEAR ?auto_72616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72614 ?auto_72615 ?auto_72616 )
      ( MAKE-6PILE ?auto_72614 ?auto_72615 ?auto_72616 ?auto_72617 ?auto_72618 ?auto_72619 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72627 - BLOCK
      ?auto_72628 - BLOCK
      ?auto_72629 - BLOCK
      ?auto_72630 - BLOCK
      ?auto_72631 - BLOCK
      ?auto_72632 - BLOCK
    )
    :vars
    (
      ?auto_72633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72632 ?auto_72633 ) ( ON-TABLE ?auto_72627 ) ( ON ?auto_72628 ?auto_72627 ) ( not ( = ?auto_72627 ?auto_72628 ) ) ( not ( = ?auto_72627 ?auto_72629 ) ) ( not ( = ?auto_72627 ?auto_72630 ) ) ( not ( = ?auto_72627 ?auto_72631 ) ) ( not ( = ?auto_72627 ?auto_72632 ) ) ( not ( = ?auto_72627 ?auto_72633 ) ) ( not ( = ?auto_72628 ?auto_72629 ) ) ( not ( = ?auto_72628 ?auto_72630 ) ) ( not ( = ?auto_72628 ?auto_72631 ) ) ( not ( = ?auto_72628 ?auto_72632 ) ) ( not ( = ?auto_72628 ?auto_72633 ) ) ( not ( = ?auto_72629 ?auto_72630 ) ) ( not ( = ?auto_72629 ?auto_72631 ) ) ( not ( = ?auto_72629 ?auto_72632 ) ) ( not ( = ?auto_72629 ?auto_72633 ) ) ( not ( = ?auto_72630 ?auto_72631 ) ) ( not ( = ?auto_72630 ?auto_72632 ) ) ( not ( = ?auto_72630 ?auto_72633 ) ) ( not ( = ?auto_72631 ?auto_72632 ) ) ( not ( = ?auto_72631 ?auto_72633 ) ) ( not ( = ?auto_72632 ?auto_72633 ) ) ( ON ?auto_72631 ?auto_72632 ) ( ON ?auto_72630 ?auto_72631 ) ( CLEAR ?auto_72628 ) ( ON ?auto_72629 ?auto_72630 ) ( CLEAR ?auto_72629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72627 ?auto_72628 ?auto_72629 )
      ( MAKE-6PILE ?auto_72627 ?auto_72628 ?auto_72629 ?auto_72630 ?auto_72631 ?auto_72632 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72640 - BLOCK
      ?auto_72641 - BLOCK
      ?auto_72642 - BLOCK
      ?auto_72643 - BLOCK
      ?auto_72644 - BLOCK
      ?auto_72645 - BLOCK
    )
    :vars
    (
      ?auto_72646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72645 ?auto_72646 ) ( ON-TABLE ?auto_72640 ) ( not ( = ?auto_72640 ?auto_72641 ) ) ( not ( = ?auto_72640 ?auto_72642 ) ) ( not ( = ?auto_72640 ?auto_72643 ) ) ( not ( = ?auto_72640 ?auto_72644 ) ) ( not ( = ?auto_72640 ?auto_72645 ) ) ( not ( = ?auto_72640 ?auto_72646 ) ) ( not ( = ?auto_72641 ?auto_72642 ) ) ( not ( = ?auto_72641 ?auto_72643 ) ) ( not ( = ?auto_72641 ?auto_72644 ) ) ( not ( = ?auto_72641 ?auto_72645 ) ) ( not ( = ?auto_72641 ?auto_72646 ) ) ( not ( = ?auto_72642 ?auto_72643 ) ) ( not ( = ?auto_72642 ?auto_72644 ) ) ( not ( = ?auto_72642 ?auto_72645 ) ) ( not ( = ?auto_72642 ?auto_72646 ) ) ( not ( = ?auto_72643 ?auto_72644 ) ) ( not ( = ?auto_72643 ?auto_72645 ) ) ( not ( = ?auto_72643 ?auto_72646 ) ) ( not ( = ?auto_72644 ?auto_72645 ) ) ( not ( = ?auto_72644 ?auto_72646 ) ) ( not ( = ?auto_72645 ?auto_72646 ) ) ( ON ?auto_72644 ?auto_72645 ) ( ON ?auto_72643 ?auto_72644 ) ( ON ?auto_72642 ?auto_72643 ) ( CLEAR ?auto_72640 ) ( ON ?auto_72641 ?auto_72642 ) ( CLEAR ?auto_72641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72640 ?auto_72641 )
      ( MAKE-6PILE ?auto_72640 ?auto_72641 ?auto_72642 ?auto_72643 ?auto_72644 ?auto_72645 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72653 - BLOCK
      ?auto_72654 - BLOCK
      ?auto_72655 - BLOCK
      ?auto_72656 - BLOCK
      ?auto_72657 - BLOCK
      ?auto_72658 - BLOCK
    )
    :vars
    (
      ?auto_72659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72658 ?auto_72659 ) ( ON-TABLE ?auto_72653 ) ( not ( = ?auto_72653 ?auto_72654 ) ) ( not ( = ?auto_72653 ?auto_72655 ) ) ( not ( = ?auto_72653 ?auto_72656 ) ) ( not ( = ?auto_72653 ?auto_72657 ) ) ( not ( = ?auto_72653 ?auto_72658 ) ) ( not ( = ?auto_72653 ?auto_72659 ) ) ( not ( = ?auto_72654 ?auto_72655 ) ) ( not ( = ?auto_72654 ?auto_72656 ) ) ( not ( = ?auto_72654 ?auto_72657 ) ) ( not ( = ?auto_72654 ?auto_72658 ) ) ( not ( = ?auto_72654 ?auto_72659 ) ) ( not ( = ?auto_72655 ?auto_72656 ) ) ( not ( = ?auto_72655 ?auto_72657 ) ) ( not ( = ?auto_72655 ?auto_72658 ) ) ( not ( = ?auto_72655 ?auto_72659 ) ) ( not ( = ?auto_72656 ?auto_72657 ) ) ( not ( = ?auto_72656 ?auto_72658 ) ) ( not ( = ?auto_72656 ?auto_72659 ) ) ( not ( = ?auto_72657 ?auto_72658 ) ) ( not ( = ?auto_72657 ?auto_72659 ) ) ( not ( = ?auto_72658 ?auto_72659 ) ) ( ON ?auto_72657 ?auto_72658 ) ( ON ?auto_72656 ?auto_72657 ) ( ON ?auto_72655 ?auto_72656 ) ( CLEAR ?auto_72653 ) ( ON ?auto_72654 ?auto_72655 ) ( CLEAR ?auto_72654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72653 ?auto_72654 )
      ( MAKE-6PILE ?auto_72653 ?auto_72654 ?auto_72655 ?auto_72656 ?auto_72657 ?auto_72658 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72666 - BLOCK
      ?auto_72667 - BLOCK
      ?auto_72668 - BLOCK
      ?auto_72669 - BLOCK
      ?auto_72670 - BLOCK
      ?auto_72671 - BLOCK
    )
    :vars
    (
      ?auto_72672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72671 ?auto_72672 ) ( not ( = ?auto_72666 ?auto_72667 ) ) ( not ( = ?auto_72666 ?auto_72668 ) ) ( not ( = ?auto_72666 ?auto_72669 ) ) ( not ( = ?auto_72666 ?auto_72670 ) ) ( not ( = ?auto_72666 ?auto_72671 ) ) ( not ( = ?auto_72666 ?auto_72672 ) ) ( not ( = ?auto_72667 ?auto_72668 ) ) ( not ( = ?auto_72667 ?auto_72669 ) ) ( not ( = ?auto_72667 ?auto_72670 ) ) ( not ( = ?auto_72667 ?auto_72671 ) ) ( not ( = ?auto_72667 ?auto_72672 ) ) ( not ( = ?auto_72668 ?auto_72669 ) ) ( not ( = ?auto_72668 ?auto_72670 ) ) ( not ( = ?auto_72668 ?auto_72671 ) ) ( not ( = ?auto_72668 ?auto_72672 ) ) ( not ( = ?auto_72669 ?auto_72670 ) ) ( not ( = ?auto_72669 ?auto_72671 ) ) ( not ( = ?auto_72669 ?auto_72672 ) ) ( not ( = ?auto_72670 ?auto_72671 ) ) ( not ( = ?auto_72670 ?auto_72672 ) ) ( not ( = ?auto_72671 ?auto_72672 ) ) ( ON ?auto_72670 ?auto_72671 ) ( ON ?auto_72669 ?auto_72670 ) ( ON ?auto_72668 ?auto_72669 ) ( ON ?auto_72667 ?auto_72668 ) ( ON ?auto_72666 ?auto_72667 ) ( CLEAR ?auto_72666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72666 )
      ( MAKE-6PILE ?auto_72666 ?auto_72667 ?auto_72668 ?auto_72669 ?auto_72670 ?auto_72671 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72679 - BLOCK
      ?auto_72680 - BLOCK
      ?auto_72681 - BLOCK
      ?auto_72682 - BLOCK
      ?auto_72683 - BLOCK
      ?auto_72684 - BLOCK
    )
    :vars
    (
      ?auto_72685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72684 ?auto_72685 ) ( not ( = ?auto_72679 ?auto_72680 ) ) ( not ( = ?auto_72679 ?auto_72681 ) ) ( not ( = ?auto_72679 ?auto_72682 ) ) ( not ( = ?auto_72679 ?auto_72683 ) ) ( not ( = ?auto_72679 ?auto_72684 ) ) ( not ( = ?auto_72679 ?auto_72685 ) ) ( not ( = ?auto_72680 ?auto_72681 ) ) ( not ( = ?auto_72680 ?auto_72682 ) ) ( not ( = ?auto_72680 ?auto_72683 ) ) ( not ( = ?auto_72680 ?auto_72684 ) ) ( not ( = ?auto_72680 ?auto_72685 ) ) ( not ( = ?auto_72681 ?auto_72682 ) ) ( not ( = ?auto_72681 ?auto_72683 ) ) ( not ( = ?auto_72681 ?auto_72684 ) ) ( not ( = ?auto_72681 ?auto_72685 ) ) ( not ( = ?auto_72682 ?auto_72683 ) ) ( not ( = ?auto_72682 ?auto_72684 ) ) ( not ( = ?auto_72682 ?auto_72685 ) ) ( not ( = ?auto_72683 ?auto_72684 ) ) ( not ( = ?auto_72683 ?auto_72685 ) ) ( not ( = ?auto_72684 ?auto_72685 ) ) ( ON ?auto_72683 ?auto_72684 ) ( ON ?auto_72682 ?auto_72683 ) ( ON ?auto_72681 ?auto_72682 ) ( ON ?auto_72680 ?auto_72681 ) ( ON ?auto_72679 ?auto_72680 ) ( CLEAR ?auto_72679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72679 )
      ( MAKE-6PILE ?auto_72679 ?auto_72680 ?auto_72681 ?auto_72682 ?auto_72683 ?auto_72684 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72693 - BLOCK
      ?auto_72694 - BLOCK
      ?auto_72695 - BLOCK
      ?auto_72696 - BLOCK
      ?auto_72697 - BLOCK
      ?auto_72698 - BLOCK
      ?auto_72699 - BLOCK
    )
    :vars
    (
      ?auto_72700 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72698 ) ( ON ?auto_72699 ?auto_72700 ) ( CLEAR ?auto_72699 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72693 ) ( ON ?auto_72694 ?auto_72693 ) ( ON ?auto_72695 ?auto_72694 ) ( ON ?auto_72696 ?auto_72695 ) ( ON ?auto_72697 ?auto_72696 ) ( ON ?auto_72698 ?auto_72697 ) ( not ( = ?auto_72693 ?auto_72694 ) ) ( not ( = ?auto_72693 ?auto_72695 ) ) ( not ( = ?auto_72693 ?auto_72696 ) ) ( not ( = ?auto_72693 ?auto_72697 ) ) ( not ( = ?auto_72693 ?auto_72698 ) ) ( not ( = ?auto_72693 ?auto_72699 ) ) ( not ( = ?auto_72693 ?auto_72700 ) ) ( not ( = ?auto_72694 ?auto_72695 ) ) ( not ( = ?auto_72694 ?auto_72696 ) ) ( not ( = ?auto_72694 ?auto_72697 ) ) ( not ( = ?auto_72694 ?auto_72698 ) ) ( not ( = ?auto_72694 ?auto_72699 ) ) ( not ( = ?auto_72694 ?auto_72700 ) ) ( not ( = ?auto_72695 ?auto_72696 ) ) ( not ( = ?auto_72695 ?auto_72697 ) ) ( not ( = ?auto_72695 ?auto_72698 ) ) ( not ( = ?auto_72695 ?auto_72699 ) ) ( not ( = ?auto_72695 ?auto_72700 ) ) ( not ( = ?auto_72696 ?auto_72697 ) ) ( not ( = ?auto_72696 ?auto_72698 ) ) ( not ( = ?auto_72696 ?auto_72699 ) ) ( not ( = ?auto_72696 ?auto_72700 ) ) ( not ( = ?auto_72697 ?auto_72698 ) ) ( not ( = ?auto_72697 ?auto_72699 ) ) ( not ( = ?auto_72697 ?auto_72700 ) ) ( not ( = ?auto_72698 ?auto_72699 ) ) ( not ( = ?auto_72698 ?auto_72700 ) ) ( not ( = ?auto_72699 ?auto_72700 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72699 ?auto_72700 )
      ( !STACK ?auto_72699 ?auto_72698 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72708 - BLOCK
      ?auto_72709 - BLOCK
      ?auto_72710 - BLOCK
      ?auto_72711 - BLOCK
      ?auto_72712 - BLOCK
      ?auto_72713 - BLOCK
      ?auto_72714 - BLOCK
    )
    :vars
    (
      ?auto_72715 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72713 ) ( ON ?auto_72714 ?auto_72715 ) ( CLEAR ?auto_72714 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72708 ) ( ON ?auto_72709 ?auto_72708 ) ( ON ?auto_72710 ?auto_72709 ) ( ON ?auto_72711 ?auto_72710 ) ( ON ?auto_72712 ?auto_72711 ) ( ON ?auto_72713 ?auto_72712 ) ( not ( = ?auto_72708 ?auto_72709 ) ) ( not ( = ?auto_72708 ?auto_72710 ) ) ( not ( = ?auto_72708 ?auto_72711 ) ) ( not ( = ?auto_72708 ?auto_72712 ) ) ( not ( = ?auto_72708 ?auto_72713 ) ) ( not ( = ?auto_72708 ?auto_72714 ) ) ( not ( = ?auto_72708 ?auto_72715 ) ) ( not ( = ?auto_72709 ?auto_72710 ) ) ( not ( = ?auto_72709 ?auto_72711 ) ) ( not ( = ?auto_72709 ?auto_72712 ) ) ( not ( = ?auto_72709 ?auto_72713 ) ) ( not ( = ?auto_72709 ?auto_72714 ) ) ( not ( = ?auto_72709 ?auto_72715 ) ) ( not ( = ?auto_72710 ?auto_72711 ) ) ( not ( = ?auto_72710 ?auto_72712 ) ) ( not ( = ?auto_72710 ?auto_72713 ) ) ( not ( = ?auto_72710 ?auto_72714 ) ) ( not ( = ?auto_72710 ?auto_72715 ) ) ( not ( = ?auto_72711 ?auto_72712 ) ) ( not ( = ?auto_72711 ?auto_72713 ) ) ( not ( = ?auto_72711 ?auto_72714 ) ) ( not ( = ?auto_72711 ?auto_72715 ) ) ( not ( = ?auto_72712 ?auto_72713 ) ) ( not ( = ?auto_72712 ?auto_72714 ) ) ( not ( = ?auto_72712 ?auto_72715 ) ) ( not ( = ?auto_72713 ?auto_72714 ) ) ( not ( = ?auto_72713 ?auto_72715 ) ) ( not ( = ?auto_72714 ?auto_72715 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72714 ?auto_72715 )
      ( !STACK ?auto_72714 ?auto_72713 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72723 - BLOCK
      ?auto_72724 - BLOCK
      ?auto_72725 - BLOCK
      ?auto_72726 - BLOCK
      ?auto_72727 - BLOCK
      ?auto_72728 - BLOCK
      ?auto_72729 - BLOCK
    )
    :vars
    (
      ?auto_72730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72729 ?auto_72730 ) ( ON-TABLE ?auto_72723 ) ( ON ?auto_72724 ?auto_72723 ) ( ON ?auto_72725 ?auto_72724 ) ( ON ?auto_72726 ?auto_72725 ) ( ON ?auto_72727 ?auto_72726 ) ( not ( = ?auto_72723 ?auto_72724 ) ) ( not ( = ?auto_72723 ?auto_72725 ) ) ( not ( = ?auto_72723 ?auto_72726 ) ) ( not ( = ?auto_72723 ?auto_72727 ) ) ( not ( = ?auto_72723 ?auto_72728 ) ) ( not ( = ?auto_72723 ?auto_72729 ) ) ( not ( = ?auto_72723 ?auto_72730 ) ) ( not ( = ?auto_72724 ?auto_72725 ) ) ( not ( = ?auto_72724 ?auto_72726 ) ) ( not ( = ?auto_72724 ?auto_72727 ) ) ( not ( = ?auto_72724 ?auto_72728 ) ) ( not ( = ?auto_72724 ?auto_72729 ) ) ( not ( = ?auto_72724 ?auto_72730 ) ) ( not ( = ?auto_72725 ?auto_72726 ) ) ( not ( = ?auto_72725 ?auto_72727 ) ) ( not ( = ?auto_72725 ?auto_72728 ) ) ( not ( = ?auto_72725 ?auto_72729 ) ) ( not ( = ?auto_72725 ?auto_72730 ) ) ( not ( = ?auto_72726 ?auto_72727 ) ) ( not ( = ?auto_72726 ?auto_72728 ) ) ( not ( = ?auto_72726 ?auto_72729 ) ) ( not ( = ?auto_72726 ?auto_72730 ) ) ( not ( = ?auto_72727 ?auto_72728 ) ) ( not ( = ?auto_72727 ?auto_72729 ) ) ( not ( = ?auto_72727 ?auto_72730 ) ) ( not ( = ?auto_72728 ?auto_72729 ) ) ( not ( = ?auto_72728 ?auto_72730 ) ) ( not ( = ?auto_72729 ?auto_72730 ) ) ( CLEAR ?auto_72727 ) ( ON ?auto_72728 ?auto_72729 ) ( CLEAR ?auto_72728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72723 ?auto_72724 ?auto_72725 ?auto_72726 ?auto_72727 ?auto_72728 )
      ( MAKE-7PILE ?auto_72723 ?auto_72724 ?auto_72725 ?auto_72726 ?auto_72727 ?auto_72728 ?auto_72729 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72738 - BLOCK
      ?auto_72739 - BLOCK
      ?auto_72740 - BLOCK
      ?auto_72741 - BLOCK
      ?auto_72742 - BLOCK
      ?auto_72743 - BLOCK
      ?auto_72744 - BLOCK
    )
    :vars
    (
      ?auto_72745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72744 ?auto_72745 ) ( ON-TABLE ?auto_72738 ) ( ON ?auto_72739 ?auto_72738 ) ( ON ?auto_72740 ?auto_72739 ) ( ON ?auto_72741 ?auto_72740 ) ( ON ?auto_72742 ?auto_72741 ) ( not ( = ?auto_72738 ?auto_72739 ) ) ( not ( = ?auto_72738 ?auto_72740 ) ) ( not ( = ?auto_72738 ?auto_72741 ) ) ( not ( = ?auto_72738 ?auto_72742 ) ) ( not ( = ?auto_72738 ?auto_72743 ) ) ( not ( = ?auto_72738 ?auto_72744 ) ) ( not ( = ?auto_72738 ?auto_72745 ) ) ( not ( = ?auto_72739 ?auto_72740 ) ) ( not ( = ?auto_72739 ?auto_72741 ) ) ( not ( = ?auto_72739 ?auto_72742 ) ) ( not ( = ?auto_72739 ?auto_72743 ) ) ( not ( = ?auto_72739 ?auto_72744 ) ) ( not ( = ?auto_72739 ?auto_72745 ) ) ( not ( = ?auto_72740 ?auto_72741 ) ) ( not ( = ?auto_72740 ?auto_72742 ) ) ( not ( = ?auto_72740 ?auto_72743 ) ) ( not ( = ?auto_72740 ?auto_72744 ) ) ( not ( = ?auto_72740 ?auto_72745 ) ) ( not ( = ?auto_72741 ?auto_72742 ) ) ( not ( = ?auto_72741 ?auto_72743 ) ) ( not ( = ?auto_72741 ?auto_72744 ) ) ( not ( = ?auto_72741 ?auto_72745 ) ) ( not ( = ?auto_72742 ?auto_72743 ) ) ( not ( = ?auto_72742 ?auto_72744 ) ) ( not ( = ?auto_72742 ?auto_72745 ) ) ( not ( = ?auto_72743 ?auto_72744 ) ) ( not ( = ?auto_72743 ?auto_72745 ) ) ( not ( = ?auto_72744 ?auto_72745 ) ) ( CLEAR ?auto_72742 ) ( ON ?auto_72743 ?auto_72744 ) ( CLEAR ?auto_72743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72738 ?auto_72739 ?auto_72740 ?auto_72741 ?auto_72742 ?auto_72743 )
      ( MAKE-7PILE ?auto_72738 ?auto_72739 ?auto_72740 ?auto_72741 ?auto_72742 ?auto_72743 ?auto_72744 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72753 - BLOCK
      ?auto_72754 - BLOCK
      ?auto_72755 - BLOCK
      ?auto_72756 - BLOCK
      ?auto_72757 - BLOCK
      ?auto_72758 - BLOCK
      ?auto_72759 - BLOCK
    )
    :vars
    (
      ?auto_72760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72759 ?auto_72760 ) ( ON-TABLE ?auto_72753 ) ( ON ?auto_72754 ?auto_72753 ) ( ON ?auto_72755 ?auto_72754 ) ( ON ?auto_72756 ?auto_72755 ) ( not ( = ?auto_72753 ?auto_72754 ) ) ( not ( = ?auto_72753 ?auto_72755 ) ) ( not ( = ?auto_72753 ?auto_72756 ) ) ( not ( = ?auto_72753 ?auto_72757 ) ) ( not ( = ?auto_72753 ?auto_72758 ) ) ( not ( = ?auto_72753 ?auto_72759 ) ) ( not ( = ?auto_72753 ?auto_72760 ) ) ( not ( = ?auto_72754 ?auto_72755 ) ) ( not ( = ?auto_72754 ?auto_72756 ) ) ( not ( = ?auto_72754 ?auto_72757 ) ) ( not ( = ?auto_72754 ?auto_72758 ) ) ( not ( = ?auto_72754 ?auto_72759 ) ) ( not ( = ?auto_72754 ?auto_72760 ) ) ( not ( = ?auto_72755 ?auto_72756 ) ) ( not ( = ?auto_72755 ?auto_72757 ) ) ( not ( = ?auto_72755 ?auto_72758 ) ) ( not ( = ?auto_72755 ?auto_72759 ) ) ( not ( = ?auto_72755 ?auto_72760 ) ) ( not ( = ?auto_72756 ?auto_72757 ) ) ( not ( = ?auto_72756 ?auto_72758 ) ) ( not ( = ?auto_72756 ?auto_72759 ) ) ( not ( = ?auto_72756 ?auto_72760 ) ) ( not ( = ?auto_72757 ?auto_72758 ) ) ( not ( = ?auto_72757 ?auto_72759 ) ) ( not ( = ?auto_72757 ?auto_72760 ) ) ( not ( = ?auto_72758 ?auto_72759 ) ) ( not ( = ?auto_72758 ?auto_72760 ) ) ( not ( = ?auto_72759 ?auto_72760 ) ) ( ON ?auto_72758 ?auto_72759 ) ( CLEAR ?auto_72756 ) ( ON ?auto_72757 ?auto_72758 ) ( CLEAR ?auto_72757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72753 ?auto_72754 ?auto_72755 ?auto_72756 ?auto_72757 )
      ( MAKE-7PILE ?auto_72753 ?auto_72754 ?auto_72755 ?auto_72756 ?auto_72757 ?auto_72758 ?auto_72759 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72768 - BLOCK
      ?auto_72769 - BLOCK
      ?auto_72770 - BLOCK
      ?auto_72771 - BLOCK
      ?auto_72772 - BLOCK
      ?auto_72773 - BLOCK
      ?auto_72774 - BLOCK
    )
    :vars
    (
      ?auto_72775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72774 ?auto_72775 ) ( ON-TABLE ?auto_72768 ) ( ON ?auto_72769 ?auto_72768 ) ( ON ?auto_72770 ?auto_72769 ) ( ON ?auto_72771 ?auto_72770 ) ( not ( = ?auto_72768 ?auto_72769 ) ) ( not ( = ?auto_72768 ?auto_72770 ) ) ( not ( = ?auto_72768 ?auto_72771 ) ) ( not ( = ?auto_72768 ?auto_72772 ) ) ( not ( = ?auto_72768 ?auto_72773 ) ) ( not ( = ?auto_72768 ?auto_72774 ) ) ( not ( = ?auto_72768 ?auto_72775 ) ) ( not ( = ?auto_72769 ?auto_72770 ) ) ( not ( = ?auto_72769 ?auto_72771 ) ) ( not ( = ?auto_72769 ?auto_72772 ) ) ( not ( = ?auto_72769 ?auto_72773 ) ) ( not ( = ?auto_72769 ?auto_72774 ) ) ( not ( = ?auto_72769 ?auto_72775 ) ) ( not ( = ?auto_72770 ?auto_72771 ) ) ( not ( = ?auto_72770 ?auto_72772 ) ) ( not ( = ?auto_72770 ?auto_72773 ) ) ( not ( = ?auto_72770 ?auto_72774 ) ) ( not ( = ?auto_72770 ?auto_72775 ) ) ( not ( = ?auto_72771 ?auto_72772 ) ) ( not ( = ?auto_72771 ?auto_72773 ) ) ( not ( = ?auto_72771 ?auto_72774 ) ) ( not ( = ?auto_72771 ?auto_72775 ) ) ( not ( = ?auto_72772 ?auto_72773 ) ) ( not ( = ?auto_72772 ?auto_72774 ) ) ( not ( = ?auto_72772 ?auto_72775 ) ) ( not ( = ?auto_72773 ?auto_72774 ) ) ( not ( = ?auto_72773 ?auto_72775 ) ) ( not ( = ?auto_72774 ?auto_72775 ) ) ( ON ?auto_72773 ?auto_72774 ) ( CLEAR ?auto_72771 ) ( ON ?auto_72772 ?auto_72773 ) ( CLEAR ?auto_72772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72768 ?auto_72769 ?auto_72770 ?auto_72771 ?auto_72772 )
      ( MAKE-7PILE ?auto_72768 ?auto_72769 ?auto_72770 ?auto_72771 ?auto_72772 ?auto_72773 ?auto_72774 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72783 - BLOCK
      ?auto_72784 - BLOCK
      ?auto_72785 - BLOCK
      ?auto_72786 - BLOCK
      ?auto_72787 - BLOCK
      ?auto_72788 - BLOCK
      ?auto_72789 - BLOCK
    )
    :vars
    (
      ?auto_72790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72789 ?auto_72790 ) ( ON-TABLE ?auto_72783 ) ( ON ?auto_72784 ?auto_72783 ) ( ON ?auto_72785 ?auto_72784 ) ( not ( = ?auto_72783 ?auto_72784 ) ) ( not ( = ?auto_72783 ?auto_72785 ) ) ( not ( = ?auto_72783 ?auto_72786 ) ) ( not ( = ?auto_72783 ?auto_72787 ) ) ( not ( = ?auto_72783 ?auto_72788 ) ) ( not ( = ?auto_72783 ?auto_72789 ) ) ( not ( = ?auto_72783 ?auto_72790 ) ) ( not ( = ?auto_72784 ?auto_72785 ) ) ( not ( = ?auto_72784 ?auto_72786 ) ) ( not ( = ?auto_72784 ?auto_72787 ) ) ( not ( = ?auto_72784 ?auto_72788 ) ) ( not ( = ?auto_72784 ?auto_72789 ) ) ( not ( = ?auto_72784 ?auto_72790 ) ) ( not ( = ?auto_72785 ?auto_72786 ) ) ( not ( = ?auto_72785 ?auto_72787 ) ) ( not ( = ?auto_72785 ?auto_72788 ) ) ( not ( = ?auto_72785 ?auto_72789 ) ) ( not ( = ?auto_72785 ?auto_72790 ) ) ( not ( = ?auto_72786 ?auto_72787 ) ) ( not ( = ?auto_72786 ?auto_72788 ) ) ( not ( = ?auto_72786 ?auto_72789 ) ) ( not ( = ?auto_72786 ?auto_72790 ) ) ( not ( = ?auto_72787 ?auto_72788 ) ) ( not ( = ?auto_72787 ?auto_72789 ) ) ( not ( = ?auto_72787 ?auto_72790 ) ) ( not ( = ?auto_72788 ?auto_72789 ) ) ( not ( = ?auto_72788 ?auto_72790 ) ) ( not ( = ?auto_72789 ?auto_72790 ) ) ( ON ?auto_72788 ?auto_72789 ) ( ON ?auto_72787 ?auto_72788 ) ( CLEAR ?auto_72785 ) ( ON ?auto_72786 ?auto_72787 ) ( CLEAR ?auto_72786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72783 ?auto_72784 ?auto_72785 ?auto_72786 )
      ( MAKE-7PILE ?auto_72783 ?auto_72784 ?auto_72785 ?auto_72786 ?auto_72787 ?auto_72788 ?auto_72789 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72798 - BLOCK
      ?auto_72799 - BLOCK
      ?auto_72800 - BLOCK
      ?auto_72801 - BLOCK
      ?auto_72802 - BLOCK
      ?auto_72803 - BLOCK
      ?auto_72804 - BLOCK
    )
    :vars
    (
      ?auto_72805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72804 ?auto_72805 ) ( ON-TABLE ?auto_72798 ) ( ON ?auto_72799 ?auto_72798 ) ( ON ?auto_72800 ?auto_72799 ) ( not ( = ?auto_72798 ?auto_72799 ) ) ( not ( = ?auto_72798 ?auto_72800 ) ) ( not ( = ?auto_72798 ?auto_72801 ) ) ( not ( = ?auto_72798 ?auto_72802 ) ) ( not ( = ?auto_72798 ?auto_72803 ) ) ( not ( = ?auto_72798 ?auto_72804 ) ) ( not ( = ?auto_72798 ?auto_72805 ) ) ( not ( = ?auto_72799 ?auto_72800 ) ) ( not ( = ?auto_72799 ?auto_72801 ) ) ( not ( = ?auto_72799 ?auto_72802 ) ) ( not ( = ?auto_72799 ?auto_72803 ) ) ( not ( = ?auto_72799 ?auto_72804 ) ) ( not ( = ?auto_72799 ?auto_72805 ) ) ( not ( = ?auto_72800 ?auto_72801 ) ) ( not ( = ?auto_72800 ?auto_72802 ) ) ( not ( = ?auto_72800 ?auto_72803 ) ) ( not ( = ?auto_72800 ?auto_72804 ) ) ( not ( = ?auto_72800 ?auto_72805 ) ) ( not ( = ?auto_72801 ?auto_72802 ) ) ( not ( = ?auto_72801 ?auto_72803 ) ) ( not ( = ?auto_72801 ?auto_72804 ) ) ( not ( = ?auto_72801 ?auto_72805 ) ) ( not ( = ?auto_72802 ?auto_72803 ) ) ( not ( = ?auto_72802 ?auto_72804 ) ) ( not ( = ?auto_72802 ?auto_72805 ) ) ( not ( = ?auto_72803 ?auto_72804 ) ) ( not ( = ?auto_72803 ?auto_72805 ) ) ( not ( = ?auto_72804 ?auto_72805 ) ) ( ON ?auto_72803 ?auto_72804 ) ( ON ?auto_72802 ?auto_72803 ) ( CLEAR ?auto_72800 ) ( ON ?auto_72801 ?auto_72802 ) ( CLEAR ?auto_72801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72798 ?auto_72799 ?auto_72800 ?auto_72801 )
      ( MAKE-7PILE ?auto_72798 ?auto_72799 ?auto_72800 ?auto_72801 ?auto_72802 ?auto_72803 ?auto_72804 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72813 - BLOCK
      ?auto_72814 - BLOCK
      ?auto_72815 - BLOCK
      ?auto_72816 - BLOCK
      ?auto_72817 - BLOCK
      ?auto_72818 - BLOCK
      ?auto_72819 - BLOCK
    )
    :vars
    (
      ?auto_72820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72819 ?auto_72820 ) ( ON-TABLE ?auto_72813 ) ( ON ?auto_72814 ?auto_72813 ) ( not ( = ?auto_72813 ?auto_72814 ) ) ( not ( = ?auto_72813 ?auto_72815 ) ) ( not ( = ?auto_72813 ?auto_72816 ) ) ( not ( = ?auto_72813 ?auto_72817 ) ) ( not ( = ?auto_72813 ?auto_72818 ) ) ( not ( = ?auto_72813 ?auto_72819 ) ) ( not ( = ?auto_72813 ?auto_72820 ) ) ( not ( = ?auto_72814 ?auto_72815 ) ) ( not ( = ?auto_72814 ?auto_72816 ) ) ( not ( = ?auto_72814 ?auto_72817 ) ) ( not ( = ?auto_72814 ?auto_72818 ) ) ( not ( = ?auto_72814 ?auto_72819 ) ) ( not ( = ?auto_72814 ?auto_72820 ) ) ( not ( = ?auto_72815 ?auto_72816 ) ) ( not ( = ?auto_72815 ?auto_72817 ) ) ( not ( = ?auto_72815 ?auto_72818 ) ) ( not ( = ?auto_72815 ?auto_72819 ) ) ( not ( = ?auto_72815 ?auto_72820 ) ) ( not ( = ?auto_72816 ?auto_72817 ) ) ( not ( = ?auto_72816 ?auto_72818 ) ) ( not ( = ?auto_72816 ?auto_72819 ) ) ( not ( = ?auto_72816 ?auto_72820 ) ) ( not ( = ?auto_72817 ?auto_72818 ) ) ( not ( = ?auto_72817 ?auto_72819 ) ) ( not ( = ?auto_72817 ?auto_72820 ) ) ( not ( = ?auto_72818 ?auto_72819 ) ) ( not ( = ?auto_72818 ?auto_72820 ) ) ( not ( = ?auto_72819 ?auto_72820 ) ) ( ON ?auto_72818 ?auto_72819 ) ( ON ?auto_72817 ?auto_72818 ) ( ON ?auto_72816 ?auto_72817 ) ( CLEAR ?auto_72814 ) ( ON ?auto_72815 ?auto_72816 ) ( CLEAR ?auto_72815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72813 ?auto_72814 ?auto_72815 )
      ( MAKE-7PILE ?auto_72813 ?auto_72814 ?auto_72815 ?auto_72816 ?auto_72817 ?auto_72818 ?auto_72819 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72828 - BLOCK
      ?auto_72829 - BLOCK
      ?auto_72830 - BLOCK
      ?auto_72831 - BLOCK
      ?auto_72832 - BLOCK
      ?auto_72833 - BLOCK
      ?auto_72834 - BLOCK
    )
    :vars
    (
      ?auto_72835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72834 ?auto_72835 ) ( ON-TABLE ?auto_72828 ) ( ON ?auto_72829 ?auto_72828 ) ( not ( = ?auto_72828 ?auto_72829 ) ) ( not ( = ?auto_72828 ?auto_72830 ) ) ( not ( = ?auto_72828 ?auto_72831 ) ) ( not ( = ?auto_72828 ?auto_72832 ) ) ( not ( = ?auto_72828 ?auto_72833 ) ) ( not ( = ?auto_72828 ?auto_72834 ) ) ( not ( = ?auto_72828 ?auto_72835 ) ) ( not ( = ?auto_72829 ?auto_72830 ) ) ( not ( = ?auto_72829 ?auto_72831 ) ) ( not ( = ?auto_72829 ?auto_72832 ) ) ( not ( = ?auto_72829 ?auto_72833 ) ) ( not ( = ?auto_72829 ?auto_72834 ) ) ( not ( = ?auto_72829 ?auto_72835 ) ) ( not ( = ?auto_72830 ?auto_72831 ) ) ( not ( = ?auto_72830 ?auto_72832 ) ) ( not ( = ?auto_72830 ?auto_72833 ) ) ( not ( = ?auto_72830 ?auto_72834 ) ) ( not ( = ?auto_72830 ?auto_72835 ) ) ( not ( = ?auto_72831 ?auto_72832 ) ) ( not ( = ?auto_72831 ?auto_72833 ) ) ( not ( = ?auto_72831 ?auto_72834 ) ) ( not ( = ?auto_72831 ?auto_72835 ) ) ( not ( = ?auto_72832 ?auto_72833 ) ) ( not ( = ?auto_72832 ?auto_72834 ) ) ( not ( = ?auto_72832 ?auto_72835 ) ) ( not ( = ?auto_72833 ?auto_72834 ) ) ( not ( = ?auto_72833 ?auto_72835 ) ) ( not ( = ?auto_72834 ?auto_72835 ) ) ( ON ?auto_72833 ?auto_72834 ) ( ON ?auto_72832 ?auto_72833 ) ( ON ?auto_72831 ?auto_72832 ) ( CLEAR ?auto_72829 ) ( ON ?auto_72830 ?auto_72831 ) ( CLEAR ?auto_72830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72828 ?auto_72829 ?auto_72830 )
      ( MAKE-7PILE ?auto_72828 ?auto_72829 ?auto_72830 ?auto_72831 ?auto_72832 ?auto_72833 ?auto_72834 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72843 - BLOCK
      ?auto_72844 - BLOCK
      ?auto_72845 - BLOCK
      ?auto_72846 - BLOCK
      ?auto_72847 - BLOCK
      ?auto_72848 - BLOCK
      ?auto_72849 - BLOCK
    )
    :vars
    (
      ?auto_72850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72849 ?auto_72850 ) ( ON-TABLE ?auto_72843 ) ( not ( = ?auto_72843 ?auto_72844 ) ) ( not ( = ?auto_72843 ?auto_72845 ) ) ( not ( = ?auto_72843 ?auto_72846 ) ) ( not ( = ?auto_72843 ?auto_72847 ) ) ( not ( = ?auto_72843 ?auto_72848 ) ) ( not ( = ?auto_72843 ?auto_72849 ) ) ( not ( = ?auto_72843 ?auto_72850 ) ) ( not ( = ?auto_72844 ?auto_72845 ) ) ( not ( = ?auto_72844 ?auto_72846 ) ) ( not ( = ?auto_72844 ?auto_72847 ) ) ( not ( = ?auto_72844 ?auto_72848 ) ) ( not ( = ?auto_72844 ?auto_72849 ) ) ( not ( = ?auto_72844 ?auto_72850 ) ) ( not ( = ?auto_72845 ?auto_72846 ) ) ( not ( = ?auto_72845 ?auto_72847 ) ) ( not ( = ?auto_72845 ?auto_72848 ) ) ( not ( = ?auto_72845 ?auto_72849 ) ) ( not ( = ?auto_72845 ?auto_72850 ) ) ( not ( = ?auto_72846 ?auto_72847 ) ) ( not ( = ?auto_72846 ?auto_72848 ) ) ( not ( = ?auto_72846 ?auto_72849 ) ) ( not ( = ?auto_72846 ?auto_72850 ) ) ( not ( = ?auto_72847 ?auto_72848 ) ) ( not ( = ?auto_72847 ?auto_72849 ) ) ( not ( = ?auto_72847 ?auto_72850 ) ) ( not ( = ?auto_72848 ?auto_72849 ) ) ( not ( = ?auto_72848 ?auto_72850 ) ) ( not ( = ?auto_72849 ?auto_72850 ) ) ( ON ?auto_72848 ?auto_72849 ) ( ON ?auto_72847 ?auto_72848 ) ( ON ?auto_72846 ?auto_72847 ) ( ON ?auto_72845 ?auto_72846 ) ( CLEAR ?auto_72843 ) ( ON ?auto_72844 ?auto_72845 ) ( CLEAR ?auto_72844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72843 ?auto_72844 )
      ( MAKE-7PILE ?auto_72843 ?auto_72844 ?auto_72845 ?auto_72846 ?auto_72847 ?auto_72848 ?auto_72849 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72858 - BLOCK
      ?auto_72859 - BLOCK
      ?auto_72860 - BLOCK
      ?auto_72861 - BLOCK
      ?auto_72862 - BLOCK
      ?auto_72863 - BLOCK
      ?auto_72864 - BLOCK
    )
    :vars
    (
      ?auto_72865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72864 ?auto_72865 ) ( ON-TABLE ?auto_72858 ) ( not ( = ?auto_72858 ?auto_72859 ) ) ( not ( = ?auto_72858 ?auto_72860 ) ) ( not ( = ?auto_72858 ?auto_72861 ) ) ( not ( = ?auto_72858 ?auto_72862 ) ) ( not ( = ?auto_72858 ?auto_72863 ) ) ( not ( = ?auto_72858 ?auto_72864 ) ) ( not ( = ?auto_72858 ?auto_72865 ) ) ( not ( = ?auto_72859 ?auto_72860 ) ) ( not ( = ?auto_72859 ?auto_72861 ) ) ( not ( = ?auto_72859 ?auto_72862 ) ) ( not ( = ?auto_72859 ?auto_72863 ) ) ( not ( = ?auto_72859 ?auto_72864 ) ) ( not ( = ?auto_72859 ?auto_72865 ) ) ( not ( = ?auto_72860 ?auto_72861 ) ) ( not ( = ?auto_72860 ?auto_72862 ) ) ( not ( = ?auto_72860 ?auto_72863 ) ) ( not ( = ?auto_72860 ?auto_72864 ) ) ( not ( = ?auto_72860 ?auto_72865 ) ) ( not ( = ?auto_72861 ?auto_72862 ) ) ( not ( = ?auto_72861 ?auto_72863 ) ) ( not ( = ?auto_72861 ?auto_72864 ) ) ( not ( = ?auto_72861 ?auto_72865 ) ) ( not ( = ?auto_72862 ?auto_72863 ) ) ( not ( = ?auto_72862 ?auto_72864 ) ) ( not ( = ?auto_72862 ?auto_72865 ) ) ( not ( = ?auto_72863 ?auto_72864 ) ) ( not ( = ?auto_72863 ?auto_72865 ) ) ( not ( = ?auto_72864 ?auto_72865 ) ) ( ON ?auto_72863 ?auto_72864 ) ( ON ?auto_72862 ?auto_72863 ) ( ON ?auto_72861 ?auto_72862 ) ( ON ?auto_72860 ?auto_72861 ) ( CLEAR ?auto_72858 ) ( ON ?auto_72859 ?auto_72860 ) ( CLEAR ?auto_72859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72858 ?auto_72859 )
      ( MAKE-7PILE ?auto_72858 ?auto_72859 ?auto_72860 ?auto_72861 ?auto_72862 ?auto_72863 ?auto_72864 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72873 - BLOCK
      ?auto_72874 - BLOCK
      ?auto_72875 - BLOCK
      ?auto_72876 - BLOCK
      ?auto_72877 - BLOCK
      ?auto_72878 - BLOCK
      ?auto_72879 - BLOCK
    )
    :vars
    (
      ?auto_72880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72879 ?auto_72880 ) ( not ( = ?auto_72873 ?auto_72874 ) ) ( not ( = ?auto_72873 ?auto_72875 ) ) ( not ( = ?auto_72873 ?auto_72876 ) ) ( not ( = ?auto_72873 ?auto_72877 ) ) ( not ( = ?auto_72873 ?auto_72878 ) ) ( not ( = ?auto_72873 ?auto_72879 ) ) ( not ( = ?auto_72873 ?auto_72880 ) ) ( not ( = ?auto_72874 ?auto_72875 ) ) ( not ( = ?auto_72874 ?auto_72876 ) ) ( not ( = ?auto_72874 ?auto_72877 ) ) ( not ( = ?auto_72874 ?auto_72878 ) ) ( not ( = ?auto_72874 ?auto_72879 ) ) ( not ( = ?auto_72874 ?auto_72880 ) ) ( not ( = ?auto_72875 ?auto_72876 ) ) ( not ( = ?auto_72875 ?auto_72877 ) ) ( not ( = ?auto_72875 ?auto_72878 ) ) ( not ( = ?auto_72875 ?auto_72879 ) ) ( not ( = ?auto_72875 ?auto_72880 ) ) ( not ( = ?auto_72876 ?auto_72877 ) ) ( not ( = ?auto_72876 ?auto_72878 ) ) ( not ( = ?auto_72876 ?auto_72879 ) ) ( not ( = ?auto_72876 ?auto_72880 ) ) ( not ( = ?auto_72877 ?auto_72878 ) ) ( not ( = ?auto_72877 ?auto_72879 ) ) ( not ( = ?auto_72877 ?auto_72880 ) ) ( not ( = ?auto_72878 ?auto_72879 ) ) ( not ( = ?auto_72878 ?auto_72880 ) ) ( not ( = ?auto_72879 ?auto_72880 ) ) ( ON ?auto_72878 ?auto_72879 ) ( ON ?auto_72877 ?auto_72878 ) ( ON ?auto_72876 ?auto_72877 ) ( ON ?auto_72875 ?auto_72876 ) ( ON ?auto_72874 ?auto_72875 ) ( ON ?auto_72873 ?auto_72874 ) ( CLEAR ?auto_72873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72873 )
      ( MAKE-7PILE ?auto_72873 ?auto_72874 ?auto_72875 ?auto_72876 ?auto_72877 ?auto_72878 ?auto_72879 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72888 - BLOCK
      ?auto_72889 - BLOCK
      ?auto_72890 - BLOCK
      ?auto_72891 - BLOCK
      ?auto_72892 - BLOCK
      ?auto_72893 - BLOCK
      ?auto_72894 - BLOCK
    )
    :vars
    (
      ?auto_72895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72894 ?auto_72895 ) ( not ( = ?auto_72888 ?auto_72889 ) ) ( not ( = ?auto_72888 ?auto_72890 ) ) ( not ( = ?auto_72888 ?auto_72891 ) ) ( not ( = ?auto_72888 ?auto_72892 ) ) ( not ( = ?auto_72888 ?auto_72893 ) ) ( not ( = ?auto_72888 ?auto_72894 ) ) ( not ( = ?auto_72888 ?auto_72895 ) ) ( not ( = ?auto_72889 ?auto_72890 ) ) ( not ( = ?auto_72889 ?auto_72891 ) ) ( not ( = ?auto_72889 ?auto_72892 ) ) ( not ( = ?auto_72889 ?auto_72893 ) ) ( not ( = ?auto_72889 ?auto_72894 ) ) ( not ( = ?auto_72889 ?auto_72895 ) ) ( not ( = ?auto_72890 ?auto_72891 ) ) ( not ( = ?auto_72890 ?auto_72892 ) ) ( not ( = ?auto_72890 ?auto_72893 ) ) ( not ( = ?auto_72890 ?auto_72894 ) ) ( not ( = ?auto_72890 ?auto_72895 ) ) ( not ( = ?auto_72891 ?auto_72892 ) ) ( not ( = ?auto_72891 ?auto_72893 ) ) ( not ( = ?auto_72891 ?auto_72894 ) ) ( not ( = ?auto_72891 ?auto_72895 ) ) ( not ( = ?auto_72892 ?auto_72893 ) ) ( not ( = ?auto_72892 ?auto_72894 ) ) ( not ( = ?auto_72892 ?auto_72895 ) ) ( not ( = ?auto_72893 ?auto_72894 ) ) ( not ( = ?auto_72893 ?auto_72895 ) ) ( not ( = ?auto_72894 ?auto_72895 ) ) ( ON ?auto_72893 ?auto_72894 ) ( ON ?auto_72892 ?auto_72893 ) ( ON ?auto_72891 ?auto_72892 ) ( ON ?auto_72890 ?auto_72891 ) ( ON ?auto_72889 ?auto_72890 ) ( ON ?auto_72888 ?auto_72889 ) ( CLEAR ?auto_72888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72888 )
      ( MAKE-7PILE ?auto_72888 ?auto_72889 ?auto_72890 ?auto_72891 ?auto_72892 ?auto_72893 ?auto_72894 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_72904 - BLOCK
      ?auto_72905 - BLOCK
      ?auto_72906 - BLOCK
      ?auto_72907 - BLOCK
      ?auto_72908 - BLOCK
      ?auto_72909 - BLOCK
      ?auto_72910 - BLOCK
      ?auto_72911 - BLOCK
    )
    :vars
    (
      ?auto_72912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72910 ) ( ON ?auto_72911 ?auto_72912 ) ( CLEAR ?auto_72911 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72904 ) ( ON ?auto_72905 ?auto_72904 ) ( ON ?auto_72906 ?auto_72905 ) ( ON ?auto_72907 ?auto_72906 ) ( ON ?auto_72908 ?auto_72907 ) ( ON ?auto_72909 ?auto_72908 ) ( ON ?auto_72910 ?auto_72909 ) ( not ( = ?auto_72904 ?auto_72905 ) ) ( not ( = ?auto_72904 ?auto_72906 ) ) ( not ( = ?auto_72904 ?auto_72907 ) ) ( not ( = ?auto_72904 ?auto_72908 ) ) ( not ( = ?auto_72904 ?auto_72909 ) ) ( not ( = ?auto_72904 ?auto_72910 ) ) ( not ( = ?auto_72904 ?auto_72911 ) ) ( not ( = ?auto_72904 ?auto_72912 ) ) ( not ( = ?auto_72905 ?auto_72906 ) ) ( not ( = ?auto_72905 ?auto_72907 ) ) ( not ( = ?auto_72905 ?auto_72908 ) ) ( not ( = ?auto_72905 ?auto_72909 ) ) ( not ( = ?auto_72905 ?auto_72910 ) ) ( not ( = ?auto_72905 ?auto_72911 ) ) ( not ( = ?auto_72905 ?auto_72912 ) ) ( not ( = ?auto_72906 ?auto_72907 ) ) ( not ( = ?auto_72906 ?auto_72908 ) ) ( not ( = ?auto_72906 ?auto_72909 ) ) ( not ( = ?auto_72906 ?auto_72910 ) ) ( not ( = ?auto_72906 ?auto_72911 ) ) ( not ( = ?auto_72906 ?auto_72912 ) ) ( not ( = ?auto_72907 ?auto_72908 ) ) ( not ( = ?auto_72907 ?auto_72909 ) ) ( not ( = ?auto_72907 ?auto_72910 ) ) ( not ( = ?auto_72907 ?auto_72911 ) ) ( not ( = ?auto_72907 ?auto_72912 ) ) ( not ( = ?auto_72908 ?auto_72909 ) ) ( not ( = ?auto_72908 ?auto_72910 ) ) ( not ( = ?auto_72908 ?auto_72911 ) ) ( not ( = ?auto_72908 ?auto_72912 ) ) ( not ( = ?auto_72909 ?auto_72910 ) ) ( not ( = ?auto_72909 ?auto_72911 ) ) ( not ( = ?auto_72909 ?auto_72912 ) ) ( not ( = ?auto_72910 ?auto_72911 ) ) ( not ( = ?auto_72910 ?auto_72912 ) ) ( not ( = ?auto_72911 ?auto_72912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72911 ?auto_72912 )
      ( !STACK ?auto_72911 ?auto_72910 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_72921 - BLOCK
      ?auto_72922 - BLOCK
      ?auto_72923 - BLOCK
      ?auto_72924 - BLOCK
      ?auto_72925 - BLOCK
      ?auto_72926 - BLOCK
      ?auto_72927 - BLOCK
      ?auto_72928 - BLOCK
    )
    :vars
    (
      ?auto_72929 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72927 ) ( ON ?auto_72928 ?auto_72929 ) ( CLEAR ?auto_72928 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72921 ) ( ON ?auto_72922 ?auto_72921 ) ( ON ?auto_72923 ?auto_72922 ) ( ON ?auto_72924 ?auto_72923 ) ( ON ?auto_72925 ?auto_72924 ) ( ON ?auto_72926 ?auto_72925 ) ( ON ?auto_72927 ?auto_72926 ) ( not ( = ?auto_72921 ?auto_72922 ) ) ( not ( = ?auto_72921 ?auto_72923 ) ) ( not ( = ?auto_72921 ?auto_72924 ) ) ( not ( = ?auto_72921 ?auto_72925 ) ) ( not ( = ?auto_72921 ?auto_72926 ) ) ( not ( = ?auto_72921 ?auto_72927 ) ) ( not ( = ?auto_72921 ?auto_72928 ) ) ( not ( = ?auto_72921 ?auto_72929 ) ) ( not ( = ?auto_72922 ?auto_72923 ) ) ( not ( = ?auto_72922 ?auto_72924 ) ) ( not ( = ?auto_72922 ?auto_72925 ) ) ( not ( = ?auto_72922 ?auto_72926 ) ) ( not ( = ?auto_72922 ?auto_72927 ) ) ( not ( = ?auto_72922 ?auto_72928 ) ) ( not ( = ?auto_72922 ?auto_72929 ) ) ( not ( = ?auto_72923 ?auto_72924 ) ) ( not ( = ?auto_72923 ?auto_72925 ) ) ( not ( = ?auto_72923 ?auto_72926 ) ) ( not ( = ?auto_72923 ?auto_72927 ) ) ( not ( = ?auto_72923 ?auto_72928 ) ) ( not ( = ?auto_72923 ?auto_72929 ) ) ( not ( = ?auto_72924 ?auto_72925 ) ) ( not ( = ?auto_72924 ?auto_72926 ) ) ( not ( = ?auto_72924 ?auto_72927 ) ) ( not ( = ?auto_72924 ?auto_72928 ) ) ( not ( = ?auto_72924 ?auto_72929 ) ) ( not ( = ?auto_72925 ?auto_72926 ) ) ( not ( = ?auto_72925 ?auto_72927 ) ) ( not ( = ?auto_72925 ?auto_72928 ) ) ( not ( = ?auto_72925 ?auto_72929 ) ) ( not ( = ?auto_72926 ?auto_72927 ) ) ( not ( = ?auto_72926 ?auto_72928 ) ) ( not ( = ?auto_72926 ?auto_72929 ) ) ( not ( = ?auto_72927 ?auto_72928 ) ) ( not ( = ?auto_72927 ?auto_72929 ) ) ( not ( = ?auto_72928 ?auto_72929 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72928 ?auto_72929 )
      ( !STACK ?auto_72928 ?auto_72927 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_72938 - BLOCK
      ?auto_72939 - BLOCK
      ?auto_72940 - BLOCK
      ?auto_72941 - BLOCK
      ?auto_72942 - BLOCK
      ?auto_72943 - BLOCK
      ?auto_72944 - BLOCK
      ?auto_72945 - BLOCK
    )
    :vars
    (
      ?auto_72946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72945 ?auto_72946 ) ( ON-TABLE ?auto_72938 ) ( ON ?auto_72939 ?auto_72938 ) ( ON ?auto_72940 ?auto_72939 ) ( ON ?auto_72941 ?auto_72940 ) ( ON ?auto_72942 ?auto_72941 ) ( ON ?auto_72943 ?auto_72942 ) ( not ( = ?auto_72938 ?auto_72939 ) ) ( not ( = ?auto_72938 ?auto_72940 ) ) ( not ( = ?auto_72938 ?auto_72941 ) ) ( not ( = ?auto_72938 ?auto_72942 ) ) ( not ( = ?auto_72938 ?auto_72943 ) ) ( not ( = ?auto_72938 ?auto_72944 ) ) ( not ( = ?auto_72938 ?auto_72945 ) ) ( not ( = ?auto_72938 ?auto_72946 ) ) ( not ( = ?auto_72939 ?auto_72940 ) ) ( not ( = ?auto_72939 ?auto_72941 ) ) ( not ( = ?auto_72939 ?auto_72942 ) ) ( not ( = ?auto_72939 ?auto_72943 ) ) ( not ( = ?auto_72939 ?auto_72944 ) ) ( not ( = ?auto_72939 ?auto_72945 ) ) ( not ( = ?auto_72939 ?auto_72946 ) ) ( not ( = ?auto_72940 ?auto_72941 ) ) ( not ( = ?auto_72940 ?auto_72942 ) ) ( not ( = ?auto_72940 ?auto_72943 ) ) ( not ( = ?auto_72940 ?auto_72944 ) ) ( not ( = ?auto_72940 ?auto_72945 ) ) ( not ( = ?auto_72940 ?auto_72946 ) ) ( not ( = ?auto_72941 ?auto_72942 ) ) ( not ( = ?auto_72941 ?auto_72943 ) ) ( not ( = ?auto_72941 ?auto_72944 ) ) ( not ( = ?auto_72941 ?auto_72945 ) ) ( not ( = ?auto_72941 ?auto_72946 ) ) ( not ( = ?auto_72942 ?auto_72943 ) ) ( not ( = ?auto_72942 ?auto_72944 ) ) ( not ( = ?auto_72942 ?auto_72945 ) ) ( not ( = ?auto_72942 ?auto_72946 ) ) ( not ( = ?auto_72943 ?auto_72944 ) ) ( not ( = ?auto_72943 ?auto_72945 ) ) ( not ( = ?auto_72943 ?auto_72946 ) ) ( not ( = ?auto_72944 ?auto_72945 ) ) ( not ( = ?auto_72944 ?auto_72946 ) ) ( not ( = ?auto_72945 ?auto_72946 ) ) ( CLEAR ?auto_72943 ) ( ON ?auto_72944 ?auto_72945 ) ( CLEAR ?auto_72944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_72938 ?auto_72939 ?auto_72940 ?auto_72941 ?auto_72942 ?auto_72943 ?auto_72944 )
      ( MAKE-8PILE ?auto_72938 ?auto_72939 ?auto_72940 ?auto_72941 ?auto_72942 ?auto_72943 ?auto_72944 ?auto_72945 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_72955 - BLOCK
      ?auto_72956 - BLOCK
      ?auto_72957 - BLOCK
      ?auto_72958 - BLOCK
      ?auto_72959 - BLOCK
      ?auto_72960 - BLOCK
      ?auto_72961 - BLOCK
      ?auto_72962 - BLOCK
    )
    :vars
    (
      ?auto_72963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72962 ?auto_72963 ) ( ON-TABLE ?auto_72955 ) ( ON ?auto_72956 ?auto_72955 ) ( ON ?auto_72957 ?auto_72956 ) ( ON ?auto_72958 ?auto_72957 ) ( ON ?auto_72959 ?auto_72958 ) ( ON ?auto_72960 ?auto_72959 ) ( not ( = ?auto_72955 ?auto_72956 ) ) ( not ( = ?auto_72955 ?auto_72957 ) ) ( not ( = ?auto_72955 ?auto_72958 ) ) ( not ( = ?auto_72955 ?auto_72959 ) ) ( not ( = ?auto_72955 ?auto_72960 ) ) ( not ( = ?auto_72955 ?auto_72961 ) ) ( not ( = ?auto_72955 ?auto_72962 ) ) ( not ( = ?auto_72955 ?auto_72963 ) ) ( not ( = ?auto_72956 ?auto_72957 ) ) ( not ( = ?auto_72956 ?auto_72958 ) ) ( not ( = ?auto_72956 ?auto_72959 ) ) ( not ( = ?auto_72956 ?auto_72960 ) ) ( not ( = ?auto_72956 ?auto_72961 ) ) ( not ( = ?auto_72956 ?auto_72962 ) ) ( not ( = ?auto_72956 ?auto_72963 ) ) ( not ( = ?auto_72957 ?auto_72958 ) ) ( not ( = ?auto_72957 ?auto_72959 ) ) ( not ( = ?auto_72957 ?auto_72960 ) ) ( not ( = ?auto_72957 ?auto_72961 ) ) ( not ( = ?auto_72957 ?auto_72962 ) ) ( not ( = ?auto_72957 ?auto_72963 ) ) ( not ( = ?auto_72958 ?auto_72959 ) ) ( not ( = ?auto_72958 ?auto_72960 ) ) ( not ( = ?auto_72958 ?auto_72961 ) ) ( not ( = ?auto_72958 ?auto_72962 ) ) ( not ( = ?auto_72958 ?auto_72963 ) ) ( not ( = ?auto_72959 ?auto_72960 ) ) ( not ( = ?auto_72959 ?auto_72961 ) ) ( not ( = ?auto_72959 ?auto_72962 ) ) ( not ( = ?auto_72959 ?auto_72963 ) ) ( not ( = ?auto_72960 ?auto_72961 ) ) ( not ( = ?auto_72960 ?auto_72962 ) ) ( not ( = ?auto_72960 ?auto_72963 ) ) ( not ( = ?auto_72961 ?auto_72962 ) ) ( not ( = ?auto_72961 ?auto_72963 ) ) ( not ( = ?auto_72962 ?auto_72963 ) ) ( CLEAR ?auto_72960 ) ( ON ?auto_72961 ?auto_72962 ) ( CLEAR ?auto_72961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_72955 ?auto_72956 ?auto_72957 ?auto_72958 ?auto_72959 ?auto_72960 ?auto_72961 )
      ( MAKE-8PILE ?auto_72955 ?auto_72956 ?auto_72957 ?auto_72958 ?auto_72959 ?auto_72960 ?auto_72961 ?auto_72962 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_72972 - BLOCK
      ?auto_72973 - BLOCK
      ?auto_72974 - BLOCK
      ?auto_72975 - BLOCK
      ?auto_72976 - BLOCK
      ?auto_72977 - BLOCK
      ?auto_72978 - BLOCK
      ?auto_72979 - BLOCK
    )
    :vars
    (
      ?auto_72980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72979 ?auto_72980 ) ( ON-TABLE ?auto_72972 ) ( ON ?auto_72973 ?auto_72972 ) ( ON ?auto_72974 ?auto_72973 ) ( ON ?auto_72975 ?auto_72974 ) ( ON ?auto_72976 ?auto_72975 ) ( not ( = ?auto_72972 ?auto_72973 ) ) ( not ( = ?auto_72972 ?auto_72974 ) ) ( not ( = ?auto_72972 ?auto_72975 ) ) ( not ( = ?auto_72972 ?auto_72976 ) ) ( not ( = ?auto_72972 ?auto_72977 ) ) ( not ( = ?auto_72972 ?auto_72978 ) ) ( not ( = ?auto_72972 ?auto_72979 ) ) ( not ( = ?auto_72972 ?auto_72980 ) ) ( not ( = ?auto_72973 ?auto_72974 ) ) ( not ( = ?auto_72973 ?auto_72975 ) ) ( not ( = ?auto_72973 ?auto_72976 ) ) ( not ( = ?auto_72973 ?auto_72977 ) ) ( not ( = ?auto_72973 ?auto_72978 ) ) ( not ( = ?auto_72973 ?auto_72979 ) ) ( not ( = ?auto_72973 ?auto_72980 ) ) ( not ( = ?auto_72974 ?auto_72975 ) ) ( not ( = ?auto_72974 ?auto_72976 ) ) ( not ( = ?auto_72974 ?auto_72977 ) ) ( not ( = ?auto_72974 ?auto_72978 ) ) ( not ( = ?auto_72974 ?auto_72979 ) ) ( not ( = ?auto_72974 ?auto_72980 ) ) ( not ( = ?auto_72975 ?auto_72976 ) ) ( not ( = ?auto_72975 ?auto_72977 ) ) ( not ( = ?auto_72975 ?auto_72978 ) ) ( not ( = ?auto_72975 ?auto_72979 ) ) ( not ( = ?auto_72975 ?auto_72980 ) ) ( not ( = ?auto_72976 ?auto_72977 ) ) ( not ( = ?auto_72976 ?auto_72978 ) ) ( not ( = ?auto_72976 ?auto_72979 ) ) ( not ( = ?auto_72976 ?auto_72980 ) ) ( not ( = ?auto_72977 ?auto_72978 ) ) ( not ( = ?auto_72977 ?auto_72979 ) ) ( not ( = ?auto_72977 ?auto_72980 ) ) ( not ( = ?auto_72978 ?auto_72979 ) ) ( not ( = ?auto_72978 ?auto_72980 ) ) ( not ( = ?auto_72979 ?auto_72980 ) ) ( ON ?auto_72978 ?auto_72979 ) ( CLEAR ?auto_72976 ) ( ON ?auto_72977 ?auto_72978 ) ( CLEAR ?auto_72977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72972 ?auto_72973 ?auto_72974 ?auto_72975 ?auto_72976 ?auto_72977 )
      ( MAKE-8PILE ?auto_72972 ?auto_72973 ?auto_72974 ?auto_72975 ?auto_72976 ?auto_72977 ?auto_72978 ?auto_72979 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_72989 - BLOCK
      ?auto_72990 - BLOCK
      ?auto_72991 - BLOCK
      ?auto_72992 - BLOCK
      ?auto_72993 - BLOCK
      ?auto_72994 - BLOCK
      ?auto_72995 - BLOCK
      ?auto_72996 - BLOCK
    )
    :vars
    (
      ?auto_72997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72996 ?auto_72997 ) ( ON-TABLE ?auto_72989 ) ( ON ?auto_72990 ?auto_72989 ) ( ON ?auto_72991 ?auto_72990 ) ( ON ?auto_72992 ?auto_72991 ) ( ON ?auto_72993 ?auto_72992 ) ( not ( = ?auto_72989 ?auto_72990 ) ) ( not ( = ?auto_72989 ?auto_72991 ) ) ( not ( = ?auto_72989 ?auto_72992 ) ) ( not ( = ?auto_72989 ?auto_72993 ) ) ( not ( = ?auto_72989 ?auto_72994 ) ) ( not ( = ?auto_72989 ?auto_72995 ) ) ( not ( = ?auto_72989 ?auto_72996 ) ) ( not ( = ?auto_72989 ?auto_72997 ) ) ( not ( = ?auto_72990 ?auto_72991 ) ) ( not ( = ?auto_72990 ?auto_72992 ) ) ( not ( = ?auto_72990 ?auto_72993 ) ) ( not ( = ?auto_72990 ?auto_72994 ) ) ( not ( = ?auto_72990 ?auto_72995 ) ) ( not ( = ?auto_72990 ?auto_72996 ) ) ( not ( = ?auto_72990 ?auto_72997 ) ) ( not ( = ?auto_72991 ?auto_72992 ) ) ( not ( = ?auto_72991 ?auto_72993 ) ) ( not ( = ?auto_72991 ?auto_72994 ) ) ( not ( = ?auto_72991 ?auto_72995 ) ) ( not ( = ?auto_72991 ?auto_72996 ) ) ( not ( = ?auto_72991 ?auto_72997 ) ) ( not ( = ?auto_72992 ?auto_72993 ) ) ( not ( = ?auto_72992 ?auto_72994 ) ) ( not ( = ?auto_72992 ?auto_72995 ) ) ( not ( = ?auto_72992 ?auto_72996 ) ) ( not ( = ?auto_72992 ?auto_72997 ) ) ( not ( = ?auto_72993 ?auto_72994 ) ) ( not ( = ?auto_72993 ?auto_72995 ) ) ( not ( = ?auto_72993 ?auto_72996 ) ) ( not ( = ?auto_72993 ?auto_72997 ) ) ( not ( = ?auto_72994 ?auto_72995 ) ) ( not ( = ?auto_72994 ?auto_72996 ) ) ( not ( = ?auto_72994 ?auto_72997 ) ) ( not ( = ?auto_72995 ?auto_72996 ) ) ( not ( = ?auto_72995 ?auto_72997 ) ) ( not ( = ?auto_72996 ?auto_72997 ) ) ( ON ?auto_72995 ?auto_72996 ) ( CLEAR ?auto_72993 ) ( ON ?auto_72994 ?auto_72995 ) ( CLEAR ?auto_72994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72989 ?auto_72990 ?auto_72991 ?auto_72992 ?auto_72993 ?auto_72994 )
      ( MAKE-8PILE ?auto_72989 ?auto_72990 ?auto_72991 ?auto_72992 ?auto_72993 ?auto_72994 ?auto_72995 ?auto_72996 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_73006 - BLOCK
      ?auto_73007 - BLOCK
      ?auto_73008 - BLOCK
      ?auto_73009 - BLOCK
      ?auto_73010 - BLOCK
      ?auto_73011 - BLOCK
      ?auto_73012 - BLOCK
      ?auto_73013 - BLOCK
    )
    :vars
    (
      ?auto_73014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73013 ?auto_73014 ) ( ON-TABLE ?auto_73006 ) ( ON ?auto_73007 ?auto_73006 ) ( ON ?auto_73008 ?auto_73007 ) ( ON ?auto_73009 ?auto_73008 ) ( not ( = ?auto_73006 ?auto_73007 ) ) ( not ( = ?auto_73006 ?auto_73008 ) ) ( not ( = ?auto_73006 ?auto_73009 ) ) ( not ( = ?auto_73006 ?auto_73010 ) ) ( not ( = ?auto_73006 ?auto_73011 ) ) ( not ( = ?auto_73006 ?auto_73012 ) ) ( not ( = ?auto_73006 ?auto_73013 ) ) ( not ( = ?auto_73006 ?auto_73014 ) ) ( not ( = ?auto_73007 ?auto_73008 ) ) ( not ( = ?auto_73007 ?auto_73009 ) ) ( not ( = ?auto_73007 ?auto_73010 ) ) ( not ( = ?auto_73007 ?auto_73011 ) ) ( not ( = ?auto_73007 ?auto_73012 ) ) ( not ( = ?auto_73007 ?auto_73013 ) ) ( not ( = ?auto_73007 ?auto_73014 ) ) ( not ( = ?auto_73008 ?auto_73009 ) ) ( not ( = ?auto_73008 ?auto_73010 ) ) ( not ( = ?auto_73008 ?auto_73011 ) ) ( not ( = ?auto_73008 ?auto_73012 ) ) ( not ( = ?auto_73008 ?auto_73013 ) ) ( not ( = ?auto_73008 ?auto_73014 ) ) ( not ( = ?auto_73009 ?auto_73010 ) ) ( not ( = ?auto_73009 ?auto_73011 ) ) ( not ( = ?auto_73009 ?auto_73012 ) ) ( not ( = ?auto_73009 ?auto_73013 ) ) ( not ( = ?auto_73009 ?auto_73014 ) ) ( not ( = ?auto_73010 ?auto_73011 ) ) ( not ( = ?auto_73010 ?auto_73012 ) ) ( not ( = ?auto_73010 ?auto_73013 ) ) ( not ( = ?auto_73010 ?auto_73014 ) ) ( not ( = ?auto_73011 ?auto_73012 ) ) ( not ( = ?auto_73011 ?auto_73013 ) ) ( not ( = ?auto_73011 ?auto_73014 ) ) ( not ( = ?auto_73012 ?auto_73013 ) ) ( not ( = ?auto_73012 ?auto_73014 ) ) ( not ( = ?auto_73013 ?auto_73014 ) ) ( ON ?auto_73012 ?auto_73013 ) ( ON ?auto_73011 ?auto_73012 ) ( CLEAR ?auto_73009 ) ( ON ?auto_73010 ?auto_73011 ) ( CLEAR ?auto_73010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73006 ?auto_73007 ?auto_73008 ?auto_73009 ?auto_73010 )
      ( MAKE-8PILE ?auto_73006 ?auto_73007 ?auto_73008 ?auto_73009 ?auto_73010 ?auto_73011 ?auto_73012 ?auto_73013 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_73023 - BLOCK
      ?auto_73024 - BLOCK
      ?auto_73025 - BLOCK
      ?auto_73026 - BLOCK
      ?auto_73027 - BLOCK
      ?auto_73028 - BLOCK
      ?auto_73029 - BLOCK
      ?auto_73030 - BLOCK
    )
    :vars
    (
      ?auto_73031 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73030 ?auto_73031 ) ( ON-TABLE ?auto_73023 ) ( ON ?auto_73024 ?auto_73023 ) ( ON ?auto_73025 ?auto_73024 ) ( ON ?auto_73026 ?auto_73025 ) ( not ( = ?auto_73023 ?auto_73024 ) ) ( not ( = ?auto_73023 ?auto_73025 ) ) ( not ( = ?auto_73023 ?auto_73026 ) ) ( not ( = ?auto_73023 ?auto_73027 ) ) ( not ( = ?auto_73023 ?auto_73028 ) ) ( not ( = ?auto_73023 ?auto_73029 ) ) ( not ( = ?auto_73023 ?auto_73030 ) ) ( not ( = ?auto_73023 ?auto_73031 ) ) ( not ( = ?auto_73024 ?auto_73025 ) ) ( not ( = ?auto_73024 ?auto_73026 ) ) ( not ( = ?auto_73024 ?auto_73027 ) ) ( not ( = ?auto_73024 ?auto_73028 ) ) ( not ( = ?auto_73024 ?auto_73029 ) ) ( not ( = ?auto_73024 ?auto_73030 ) ) ( not ( = ?auto_73024 ?auto_73031 ) ) ( not ( = ?auto_73025 ?auto_73026 ) ) ( not ( = ?auto_73025 ?auto_73027 ) ) ( not ( = ?auto_73025 ?auto_73028 ) ) ( not ( = ?auto_73025 ?auto_73029 ) ) ( not ( = ?auto_73025 ?auto_73030 ) ) ( not ( = ?auto_73025 ?auto_73031 ) ) ( not ( = ?auto_73026 ?auto_73027 ) ) ( not ( = ?auto_73026 ?auto_73028 ) ) ( not ( = ?auto_73026 ?auto_73029 ) ) ( not ( = ?auto_73026 ?auto_73030 ) ) ( not ( = ?auto_73026 ?auto_73031 ) ) ( not ( = ?auto_73027 ?auto_73028 ) ) ( not ( = ?auto_73027 ?auto_73029 ) ) ( not ( = ?auto_73027 ?auto_73030 ) ) ( not ( = ?auto_73027 ?auto_73031 ) ) ( not ( = ?auto_73028 ?auto_73029 ) ) ( not ( = ?auto_73028 ?auto_73030 ) ) ( not ( = ?auto_73028 ?auto_73031 ) ) ( not ( = ?auto_73029 ?auto_73030 ) ) ( not ( = ?auto_73029 ?auto_73031 ) ) ( not ( = ?auto_73030 ?auto_73031 ) ) ( ON ?auto_73029 ?auto_73030 ) ( ON ?auto_73028 ?auto_73029 ) ( CLEAR ?auto_73026 ) ( ON ?auto_73027 ?auto_73028 ) ( CLEAR ?auto_73027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73023 ?auto_73024 ?auto_73025 ?auto_73026 ?auto_73027 )
      ( MAKE-8PILE ?auto_73023 ?auto_73024 ?auto_73025 ?auto_73026 ?auto_73027 ?auto_73028 ?auto_73029 ?auto_73030 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_73040 - BLOCK
      ?auto_73041 - BLOCK
      ?auto_73042 - BLOCK
      ?auto_73043 - BLOCK
      ?auto_73044 - BLOCK
      ?auto_73045 - BLOCK
      ?auto_73046 - BLOCK
      ?auto_73047 - BLOCK
    )
    :vars
    (
      ?auto_73048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73047 ?auto_73048 ) ( ON-TABLE ?auto_73040 ) ( ON ?auto_73041 ?auto_73040 ) ( ON ?auto_73042 ?auto_73041 ) ( not ( = ?auto_73040 ?auto_73041 ) ) ( not ( = ?auto_73040 ?auto_73042 ) ) ( not ( = ?auto_73040 ?auto_73043 ) ) ( not ( = ?auto_73040 ?auto_73044 ) ) ( not ( = ?auto_73040 ?auto_73045 ) ) ( not ( = ?auto_73040 ?auto_73046 ) ) ( not ( = ?auto_73040 ?auto_73047 ) ) ( not ( = ?auto_73040 ?auto_73048 ) ) ( not ( = ?auto_73041 ?auto_73042 ) ) ( not ( = ?auto_73041 ?auto_73043 ) ) ( not ( = ?auto_73041 ?auto_73044 ) ) ( not ( = ?auto_73041 ?auto_73045 ) ) ( not ( = ?auto_73041 ?auto_73046 ) ) ( not ( = ?auto_73041 ?auto_73047 ) ) ( not ( = ?auto_73041 ?auto_73048 ) ) ( not ( = ?auto_73042 ?auto_73043 ) ) ( not ( = ?auto_73042 ?auto_73044 ) ) ( not ( = ?auto_73042 ?auto_73045 ) ) ( not ( = ?auto_73042 ?auto_73046 ) ) ( not ( = ?auto_73042 ?auto_73047 ) ) ( not ( = ?auto_73042 ?auto_73048 ) ) ( not ( = ?auto_73043 ?auto_73044 ) ) ( not ( = ?auto_73043 ?auto_73045 ) ) ( not ( = ?auto_73043 ?auto_73046 ) ) ( not ( = ?auto_73043 ?auto_73047 ) ) ( not ( = ?auto_73043 ?auto_73048 ) ) ( not ( = ?auto_73044 ?auto_73045 ) ) ( not ( = ?auto_73044 ?auto_73046 ) ) ( not ( = ?auto_73044 ?auto_73047 ) ) ( not ( = ?auto_73044 ?auto_73048 ) ) ( not ( = ?auto_73045 ?auto_73046 ) ) ( not ( = ?auto_73045 ?auto_73047 ) ) ( not ( = ?auto_73045 ?auto_73048 ) ) ( not ( = ?auto_73046 ?auto_73047 ) ) ( not ( = ?auto_73046 ?auto_73048 ) ) ( not ( = ?auto_73047 ?auto_73048 ) ) ( ON ?auto_73046 ?auto_73047 ) ( ON ?auto_73045 ?auto_73046 ) ( ON ?auto_73044 ?auto_73045 ) ( CLEAR ?auto_73042 ) ( ON ?auto_73043 ?auto_73044 ) ( CLEAR ?auto_73043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73040 ?auto_73041 ?auto_73042 ?auto_73043 )
      ( MAKE-8PILE ?auto_73040 ?auto_73041 ?auto_73042 ?auto_73043 ?auto_73044 ?auto_73045 ?auto_73046 ?auto_73047 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_73057 - BLOCK
      ?auto_73058 - BLOCK
      ?auto_73059 - BLOCK
      ?auto_73060 - BLOCK
      ?auto_73061 - BLOCK
      ?auto_73062 - BLOCK
      ?auto_73063 - BLOCK
      ?auto_73064 - BLOCK
    )
    :vars
    (
      ?auto_73065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73064 ?auto_73065 ) ( ON-TABLE ?auto_73057 ) ( ON ?auto_73058 ?auto_73057 ) ( ON ?auto_73059 ?auto_73058 ) ( not ( = ?auto_73057 ?auto_73058 ) ) ( not ( = ?auto_73057 ?auto_73059 ) ) ( not ( = ?auto_73057 ?auto_73060 ) ) ( not ( = ?auto_73057 ?auto_73061 ) ) ( not ( = ?auto_73057 ?auto_73062 ) ) ( not ( = ?auto_73057 ?auto_73063 ) ) ( not ( = ?auto_73057 ?auto_73064 ) ) ( not ( = ?auto_73057 ?auto_73065 ) ) ( not ( = ?auto_73058 ?auto_73059 ) ) ( not ( = ?auto_73058 ?auto_73060 ) ) ( not ( = ?auto_73058 ?auto_73061 ) ) ( not ( = ?auto_73058 ?auto_73062 ) ) ( not ( = ?auto_73058 ?auto_73063 ) ) ( not ( = ?auto_73058 ?auto_73064 ) ) ( not ( = ?auto_73058 ?auto_73065 ) ) ( not ( = ?auto_73059 ?auto_73060 ) ) ( not ( = ?auto_73059 ?auto_73061 ) ) ( not ( = ?auto_73059 ?auto_73062 ) ) ( not ( = ?auto_73059 ?auto_73063 ) ) ( not ( = ?auto_73059 ?auto_73064 ) ) ( not ( = ?auto_73059 ?auto_73065 ) ) ( not ( = ?auto_73060 ?auto_73061 ) ) ( not ( = ?auto_73060 ?auto_73062 ) ) ( not ( = ?auto_73060 ?auto_73063 ) ) ( not ( = ?auto_73060 ?auto_73064 ) ) ( not ( = ?auto_73060 ?auto_73065 ) ) ( not ( = ?auto_73061 ?auto_73062 ) ) ( not ( = ?auto_73061 ?auto_73063 ) ) ( not ( = ?auto_73061 ?auto_73064 ) ) ( not ( = ?auto_73061 ?auto_73065 ) ) ( not ( = ?auto_73062 ?auto_73063 ) ) ( not ( = ?auto_73062 ?auto_73064 ) ) ( not ( = ?auto_73062 ?auto_73065 ) ) ( not ( = ?auto_73063 ?auto_73064 ) ) ( not ( = ?auto_73063 ?auto_73065 ) ) ( not ( = ?auto_73064 ?auto_73065 ) ) ( ON ?auto_73063 ?auto_73064 ) ( ON ?auto_73062 ?auto_73063 ) ( ON ?auto_73061 ?auto_73062 ) ( CLEAR ?auto_73059 ) ( ON ?auto_73060 ?auto_73061 ) ( CLEAR ?auto_73060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73057 ?auto_73058 ?auto_73059 ?auto_73060 )
      ( MAKE-8PILE ?auto_73057 ?auto_73058 ?auto_73059 ?auto_73060 ?auto_73061 ?auto_73062 ?auto_73063 ?auto_73064 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_73074 - BLOCK
      ?auto_73075 - BLOCK
      ?auto_73076 - BLOCK
      ?auto_73077 - BLOCK
      ?auto_73078 - BLOCK
      ?auto_73079 - BLOCK
      ?auto_73080 - BLOCK
      ?auto_73081 - BLOCK
    )
    :vars
    (
      ?auto_73082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73081 ?auto_73082 ) ( ON-TABLE ?auto_73074 ) ( ON ?auto_73075 ?auto_73074 ) ( not ( = ?auto_73074 ?auto_73075 ) ) ( not ( = ?auto_73074 ?auto_73076 ) ) ( not ( = ?auto_73074 ?auto_73077 ) ) ( not ( = ?auto_73074 ?auto_73078 ) ) ( not ( = ?auto_73074 ?auto_73079 ) ) ( not ( = ?auto_73074 ?auto_73080 ) ) ( not ( = ?auto_73074 ?auto_73081 ) ) ( not ( = ?auto_73074 ?auto_73082 ) ) ( not ( = ?auto_73075 ?auto_73076 ) ) ( not ( = ?auto_73075 ?auto_73077 ) ) ( not ( = ?auto_73075 ?auto_73078 ) ) ( not ( = ?auto_73075 ?auto_73079 ) ) ( not ( = ?auto_73075 ?auto_73080 ) ) ( not ( = ?auto_73075 ?auto_73081 ) ) ( not ( = ?auto_73075 ?auto_73082 ) ) ( not ( = ?auto_73076 ?auto_73077 ) ) ( not ( = ?auto_73076 ?auto_73078 ) ) ( not ( = ?auto_73076 ?auto_73079 ) ) ( not ( = ?auto_73076 ?auto_73080 ) ) ( not ( = ?auto_73076 ?auto_73081 ) ) ( not ( = ?auto_73076 ?auto_73082 ) ) ( not ( = ?auto_73077 ?auto_73078 ) ) ( not ( = ?auto_73077 ?auto_73079 ) ) ( not ( = ?auto_73077 ?auto_73080 ) ) ( not ( = ?auto_73077 ?auto_73081 ) ) ( not ( = ?auto_73077 ?auto_73082 ) ) ( not ( = ?auto_73078 ?auto_73079 ) ) ( not ( = ?auto_73078 ?auto_73080 ) ) ( not ( = ?auto_73078 ?auto_73081 ) ) ( not ( = ?auto_73078 ?auto_73082 ) ) ( not ( = ?auto_73079 ?auto_73080 ) ) ( not ( = ?auto_73079 ?auto_73081 ) ) ( not ( = ?auto_73079 ?auto_73082 ) ) ( not ( = ?auto_73080 ?auto_73081 ) ) ( not ( = ?auto_73080 ?auto_73082 ) ) ( not ( = ?auto_73081 ?auto_73082 ) ) ( ON ?auto_73080 ?auto_73081 ) ( ON ?auto_73079 ?auto_73080 ) ( ON ?auto_73078 ?auto_73079 ) ( ON ?auto_73077 ?auto_73078 ) ( CLEAR ?auto_73075 ) ( ON ?auto_73076 ?auto_73077 ) ( CLEAR ?auto_73076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73074 ?auto_73075 ?auto_73076 )
      ( MAKE-8PILE ?auto_73074 ?auto_73075 ?auto_73076 ?auto_73077 ?auto_73078 ?auto_73079 ?auto_73080 ?auto_73081 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_73091 - BLOCK
      ?auto_73092 - BLOCK
      ?auto_73093 - BLOCK
      ?auto_73094 - BLOCK
      ?auto_73095 - BLOCK
      ?auto_73096 - BLOCK
      ?auto_73097 - BLOCK
      ?auto_73098 - BLOCK
    )
    :vars
    (
      ?auto_73099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73098 ?auto_73099 ) ( ON-TABLE ?auto_73091 ) ( ON ?auto_73092 ?auto_73091 ) ( not ( = ?auto_73091 ?auto_73092 ) ) ( not ( = ?auto_73091 ?auto_73093 ) ) ( not ( = ?auto_73091 ?auto_73094 ) ) ( not ( = ?auto_73091 ?auto_73095 ) ) ( not ( = ?auto_73091 ?auto_73096 ) ) ( not ( = ?auto_73091 ?auto_73097 ) ) ( not ( = ?auto_73091 ?auto_73098 ) ) ( not ( = ?auto_73091 ?auto_73099 ) ) ( not ( = ?auto_73092 ?auto_73093 ) ) ( not ( = ?auto_73092 ?auto_73094 ) ) ( not ( = ?auto_73092 ?auto_73095 ) ) ( not ( = ?auto_73092 ?auto_73096 ) ) ( not ( = ?auto_73092 ?auto_73097 ) ) ( not ( = ?auto_73092 ?auto_73098 ) ) ( not ( = ?auto_73092 ?auto_73099 ) ) ( not ( = ?auto_73093 ?auto_73094 ) ) ( not ( = ?auto_73093 ?auto_73095 ) ) ( not ( = ?auto_73093 ?auto_73096 ) ) ( not ( = ?auto_73093 ?auto_73097 ) ) ( not ( = ?auto_73093 ?auto_73098 ) ) ( not ( = ?auto_73093 ?auto_73099 ) ) ( not ( = ?auto_73094 ?auto_73095 ) ) ( not ( = ?auto_73094 ?auto_73096 ) ) ( not ( = ?auto_73094 ?auto_73097 ) ) ( not ( = ?auto_73094 ?auto_73098 ) ) ( not ( = ?auto_73094 ?auto_73099 ) ) ( not ( = ?auto_73095 ?auto_73096 ) ) ( not ( = ?auto_73095 ?auto_73097 ) ) ( not ( = ?auto_73095 ?auto_73098 ) ) ( not ( = ?auto_73095 ?auto_73099 ) ) ( not ( = ?auto_73096 ?auto_73097 ) ) ( not ( = ?auto_73096 ?auto_73098 ) ) ( not ( = ?auto_73096 ?auto_73099 ) ) ( not ( = ?auto_73097 ?auto_73098 ) ) ( not ( = ?auto_73097 ?auto_73099 ) ) ( not ( = ?auto_73098 ?auto_73099 ) ) ( ON ?auto_73097 ?auto_73098 ) ( ON ?auto_73096 ?auto_73097 ) ( ON ?auto_73095 ?auto_73096 ) ( ON ?auto_73094 ?auto_73095 ) ( CLEAR ?auto_73092 ) ( ON ?auto_73093 ?auto_73094 ) ( CLEAR ?auto_73093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73091 ?auto_73092 ?auto_73093 )
      ( MAKE-8PILE ?auto_73091 ?auto_73092 ?auto_73093 ?auto_73094 ?auto_73095 ?auto_73096 ?auto_73097 ?auto_73098 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_73108 - BLOCK
      ?auto_73109 - BLOCK
      ?auto_73110 - BLOCK
      ?auto_73111 - BLOCK
      ?auto_73112 - BLOCK
      ?auto_73113 - BLOCK
      ?auto_73114 - BLOCK
      ?auto_73115 - BLOCK
    )
    :vars
    (
      ?auto_73116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73115 ?auto_73116 ) ( ON-TABLE ?auto_73108 ) ( not ( = ?auto_73108 ?auto_73109 ) ) ( not ( = ?auto_73108 ?auto_73110 ) ) ( not ( = ?auto_73108 ?auto_73111 ) ) ( not ( = ?auto_73108 ?auto_73112 ) ) ( not ( = ?auto_73108 ?auto_73113 ) ) ( not ( = ?auto_73108 ?auto_73114 ) ) ( not ( = ?auto_73108 ?auto_73115 ) ) ( not ( = ?auto_73108 ?auto_73116 ) ) ( not ( = ?auto_73109 ?auto_73110 ) ) ( not ( = ?auto_73109 ?auto_73111 ) ) ( not ( = ?auto_73109 ?auto_73112 ) ) ( not ( = ?auto_73109 ?auto_73113 ) ) ( not ( = ?auto_73109 ?auto_73114 ) ) ( not ( = ?auto_73109 ?auto_73115 ) ) ( not ( = ?auto_73109 ?auto_73116 ) ) ( not ( = ?auto_73110 ?auto_73111 ) ) ( not ( = ?auto_73110 ?auto_73112 ) ) ( not ( = ?auto_73110 ?auto_73113 ) ) ( not ( = ?auto_73110 ?auto_73114 ) ) ( not ( = ?auto_73110 ?auto_73115 ) ) ( not ( = ?auto_73110 ?auto_73116 ) ) ( not ( = ?auto_73111 ?auto_73112 ) ) ( not ( = ?auto_73111 ?auto_73113 ) ) ( not ( = ?auto_73111 ?auto_73114 ) ) ( not ( = ?auto_73111 ?auto_73115 ) ) ( not ( = ?auto_73111 ?auto_73116 ) ) ( not ( = ?auto_73112 ?auto_73113 ) ) ( not ( = ?auto_73112 ?auto_73114 ) ) ( not ( = ?auto_73112 ?auto_73115 ) ) ( not ( = ?auto_73112 ?auto_73116 ) ) ( not ( = ?auto_73113 ?auto_73114 ) ) ( not ( = ?auto_73113 ?auto_73115 ) ) ( not ( = ?auto_73113 ?auto_73116 ) ) ( not ( = ?auto_73114 ?auto_73115 ) ) ( not ( = ?auto_73114 ?auto_73116 ) ) ( not ( = ?auto_73115 ?auto_73116 ) ) ( ON ?auto_73114 ?auto_73115 ) ( ON ?auto_73113 ?auto_73114 ) ( ON ?auto_73112 ?auto_73113 ) ( ON ?auto_73111 ?auto_73112 ) ( ON ?auto_73110 ?auto_73111 ) ( CLEAR ?auto_73108 ) ( ON ?auto_73109 ?auto_73110 ) ( CLEAR ?auto_73109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73108 ?auto_73109 )
      ( MAKE-8PILE ?auto_73108 ?auto_73109 ?auto_73110 ?auto_73111 ?auto_73112 ?auto_73113 ?auto_73114 ?auto_73115 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_73125 - BLOCK
      ?auto_73126 - BLOCK
      ?auto_73127 - BLOCK
      ?auto_73128 - BLOCK
      ?auto_73129 - BLOCK
      ?auto_73130 - BLOCK
      ?auto_73131 - BLOCK
      ?auto_73132 - BLOCK
    )
    :vars
    (
      ?auto_73133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73132 ?auto_73133 ) ( ON-TABLE ?auto_73125 ) ( not ( = ?auto_73125 ?auto_73126 ) ) ( not ( = ?auto_73125 ?auto_73127 ) ) ( not ( = ?auto_73125 ?auto_73128 ) ) ( not ( = ?auto_73125 ?auto_73129 ) ) ( not ( = ?auto_73125 ?auto_73130 ) ) ( not ( = ?auto_73125 ?auto_73131 ) ) ( not ( = ?auto_73125 ?auto_73132 ) ) ( not ( = ?auto_73125 ?auto_73133 ) ) ( not ( = ?auto_73126 ?auto_73127 ) ) ( not ( = ?auto_73126 ?auto_73128 ) ) ( not ( = ?auto_73126 ?auto_73129 ) ) ( not ( = ?auto_73126 ?auto_73130 ) ) ( not ( = ?auto_73126 ?auto_73131 ) ) ( not ( = ?auto_73126 ?auto_73132 ) ) ( not ( = ?auto_73126 ?auto_73133 ) ) ( not ( = ?auto_73127 ?auto_73128 ) ) ( not ( = ?auto_73127 ?auto_73129 ) ) ( not ( = ?auto_73127 ?auto_73130 ) ) ( not ( = ?auto_73127 ?auto_73131 ) ) ( not ( = ?auto_73127 ?auto_73132 ) ) ( not ( = ?auto_73127 ?auto_73133 ) ) ( not ( = ?auto_73128 ?auto_73129 ) ) ( not ( = ?auto_73128 ?auto_73130 ) ) ( not ( = ?auto_73128 ?auto_73131 ) ) ( not ( = ?auto_73128 ?auto_73132 ) ) ( not ( = ?auto_73128 ?auto_73133 ) ) ( not ( = ?auto_73129 ?auto_73130 ) ) ( not ( = ?auto_73129 ?auto_73131 ) ) ( not ( = ?auto_73129 ?auto_73132 ) ) ( not ( = ?auto_73129 ?auto_73133 ) ) ( not ( = ?auto_73130 ?auto_73131 ) ) ( not ( = ?auto_73130 ?auto_73132 ) ) ( not ( = ?auto_73130 ?auto_73133 ) ) ( not ( = ?auto_73131 ?auto_73132 ) ) ( not ( = ?auto_73131 ?auto_73133 ) ) ( not ( = ?auto_73132 ?auto_73133 ) ) ( ON ?auto_73131 ?auto_73132 ) ( ON ?auto_73130 ?auto_73131 ) ( ON ?auto_73129 ?auto_73130 ) ( ON ?auto_73128 ?auto_73129 ) ( ON ?auto_73127 ?auto_73128 ) ( CLEAR ?auto_73125 ) ( ON ?auto_73126 ?auto_73127 ) ( CLEAR ?auto_73126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73125 ?auto_73126 )
      ( MAKE-8PILE ?auto_73125 ?auto_73126 ?auto_73127 ?auto_73128 ?auto_73129 ?auto_73130 ?auto_73131 ?auto_73132 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_73142 - BLOCK
      ?auto_73143 - BLOCK
      ?auto_73144 - BLOCK
      ?auto_73145 - BLOCK
      ?auto_73146 - BLOCK
      ?auto_73147 - BLOCK
      ?auto_73148 - BLOCK
      ?auto_73149 - BLOCK
    )
    :vars
    (
      ?auto_73150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73149 ?auto_73150 ) ( not ( = ?auto_73142 ?auto_73143 ) ) ( not ( = ?auto_73142 ?auto_73144 ) ) ( not ( = ?auto_73142 ?auto_73145 ) ) ( not ( = ?auto_73142 ?auto_73146 ) ) ( not ( = ?auto_73142 ?auto_73147 ) ) ( not ( = ?auto_73142 ?auto_73148 ) ) ( not ( = ?auto_73142 ?auto_73149 ) ) ( not ( = ?auto_73142 ?auto_73150 ) ) ( not ( = ?auto_73143 ?auto_73144 ) ) ( not ( = ?auto_73143 ?auto_73145 ) ) ( not ( = ?auto_73143 ?auto_73146 ) ) ( not ( = ?auto_73143 ?auto_73147 ) ) ( not ( = ?auto_73143 ?auto_73148 ) ) ( not ( = ?auto_73143 ?auto_73149 ) ) ( not ( = ?auto_73143 ?auto_73150 ) ) ( not ( = ?auto_73144 ?auto_73145 ) ) ( not ( = ?auto_73144 ?auto_73146 ) ) ( not ( = ?auto_73144 ?auto_73147 ) ) ( not ( = ?auto_73144 ?auto_73148 ) ) ( not ( = ?auto_73144 ?auto_73149 ) ) ( not ( = ?auto_73144 ?auto_73150 ) ) ( not ( = ?auto_73145 ?auto_73146 ) ) ( not ( = ?auto_73145 ?auto_73147 ) ) ( not ( = ?auto_73145 ?auto_73148 ) ) ( not ( = ?auto_73145 ?auto_73149 ) ) ( not ( = ?auto_73145 ?auto_73150 ) ) ( not ( = ?auto_73146 ?auto_73147 ) ) ( not ( = ?auto_73146 ?auto_73148 ) ) ( not ( = ?auto_73146 ?auto_73149 ) ) ( not ( = ?auto_73146 ?auto_73150 ) ) ( not ( = ?auto_73147 ?auto_73148 ) ) ( not ( = ?auto_73147 ?auto_73149 ) ) ( not ( = ?auto_73147 ?auto_73150 ) ) ( not ( = ?auto_73148 ?auto_73149 ) ) ( not ( = ?auto_73148 ?auto_73150 ) ) ( not ( = ?auto_73149 ?auto_73150 ) ) ( ON ?auto_73148 ?auto_73149 ) ( ON ?auto_73147 ?auto_73148 ) ( ON ?auto_73146 ?auto_73147 ) ( ON ?auto_73145 ?auto_73146 ) ( ON ?auto_73144 ?auto_73145 ) ( ON ?auto_73143 ?auto_73144 ) ( ON ?auto_73142 ?auto_73143 ) ( CLEAR ?auto_73142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73142 )
      ( MAKE-8PILE ?auto_73142 ?auto_73143 ?auto_73144 ?auto_73145 ?auto_73146 ?auto_73147 ?auto_73148 ?auto_73149 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_73159 - BLOCK
      ?auto_73160 - BLOCK
      ?auto_73161 - BLOCK
      ?auto_73162 - BLOCK
      ?auto_73163 - BLOCK
      ?auto_73164 - BLOCK
      ?auto_73165 - BLOCK
      ?auto_73166 - BLOCK
    )
    :vars
    (
      ?auto_73167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73166 ?auto_73167 ) ( not ( = ?auto_73159 ?auto_73160 ) ) ( not ( = ?auto_73159 ?auto_73161 ) ) ( not ( = ?auto_73159 ?auto_73162 ) ) ( not ( = ?auto_73159 ?auto_73163 ) ) ( not ( = ?auto_73159 ?auto_73164 ) ) ( not ( = ?auto_73159 ?auto_73165 ) ) ( not ( = ?auto_73159 ?auto_73166 ) ) ( not ( = ?auto_73159 ?auto_73167 ) ) ( not ( = ?auto_73160 ?auto_73161 ) ) ( not ( = ?auto_73160 ?auto_73162 ) ) ( not ( = ?auto_73160 ?auto_73163 ) ) ( not ( = ?auto_73160 ?auto_73164 ) ) ( not ( = ?auto_73160 ?auto_73165 ) ) ( not ( = ?auto_73160 ?auto_73166 ) ) ( not ( = ?auto_73160 ?auto_73167 ) ) ( not ( = ?auto_73161 ?auto_73162 ) ) ( not ( = ?auto_73161 ?auto_73163 ) ) ( not ( = ?auto_73161 ?auto_73164 ) ) ( not ( = ?auto_73161 ?auto_73165 ) ) ( not ( = ?auto_73161 ?auto_73166 ) ) ( not ( = ?auto_73161 ?auto_73167 ) ) ( not ( = ?auto_73162 ?auto_73163 ) ) ( not ( = ?auto_73162 ?auto_73164 ) ) ( not ( = ?auto_73162 ?auto_73165 ) ) ( not ( = ?auto_73162 ?auto_73166 ) ) ( not ( = ?auto_73162 ?auto_73167 ) ) ( not ( = ?auto_73163 ?auto_73164 ) ) ( not ( = ?auto_73163 ?auto_73165 ) ) ( not ( = ?auto_73163 ?auto_73166 ) ) ( not ( = ?auto_73163 ?auto_73167 ) ) ( not ( = ?auto_73164 ?auto_73165 ) ) ( not ( = ?auto_73164 ?auto_73166 ) ) ( not ( = ?auto_73164 ?auto_73167 ) ) ( not ( = ?auto_73165 ?auto_73166 ) ) ( not ( = ?auto_73165 ?auto_73167 ) ) ( not ( = ?auto_73166 ?auto_73167 ) ) ( ON ?auto_73165 ?auto_73166 ) ( ON ?auto_73164 ?auto_73165 ) ( ON ?auto_73163 ?auto_73164 ) ( ON ?auto_73162 ?auto_73163 ) ( ON ?auto_73161 ?auto_73162 ) ( ON ?auto_73160 ?auto_73161 ) ( ON ?auto_73159 ?auto_73160 ) ( CLEAR ?auto_73159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73159 )
      ( MAKE-8PILE ?auto_73159 ?auto_73160 ?auto_73161 ?auto_73162 ?auto_73163 ?auto_73164 ?auto_73165 ?auto_73166 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73177 - BLOCK
      ?auto_73178 - BLOCK
      ?auto_73179 - BLOCK
      ?auto_73180 - BLOCK
      ?auto_73181 - BLOCK
      ?auto_73182 - BLOCK
      ?auto_73183 - BLOCK
      ?auto_73184 - BLOCK
      ?auto_73185 - BLOCK
    )
    :vars
    (
      ?auto_73186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73184 ) ( ON ?auto_73185 ?auto_73186 ) ( CLEAR ?auto_73185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73177 ) ( ON ?auto_73178 ?auto_73177 ) ( ON ?auto_73179 ?auto_73178 ) ( ON ?auto_73180 ?auto_73179 ) ( ON ?auto_73181 ?auto_73180 ) ( ON ?auto_73182 ?auto_73181 ) ( ON ?auto_73183 ?auto_73182 ) ( ON ?auto_73184 ?auto_73183 ) ( not ( = ?auto_73177 ?auto_73178 ) ) ( not ( = ?auto_73177 ?auto_73179 ) ) ( not ( = ?auto_73177 ?auto_73180 ) ) ( not ( = ?auto_73177 ?auto_73181 ) ) ( not ( = ?auto_73177 ?auto_73182 ) ) ( not ( = ?auto_73177 ?auto_73183 ) ) ( not ( = ?auto_73177 ?auto_73184 ) ) ( not ( = ?auto_73177 ?auto_73185 ) ) ( not ( = ?auto_73177 ?auto_73186 ) ) ( not ( = ?auto_73178 ?auto_73179 ) ) ( not ( = ?auto_73178 ?auto_73180 ) ) ( not ( = ?auto_73178 ?auto_73181 ) ) ( not ( = ?auto_73178 ?auto_73182 ) ) ( not ( = ?auto_73178 ?auto_73183 ) ) ( not ( = ?auto_73178 ?auto_73184 ) ) ( not ( = ?auto_73178 ?auto_73185 ) ) ( not ( = ?auto_73178 ?auto_73186 ) ) ( not ( = ?auto_73179 ?auto_73180 ) ) ( not ( = ?auto_73179 ?auto_73181 ) ) ( not ( = ?auto_73179 ?auto_73182 ) ) ( not ( = ?auto_73179 ?auto_73183 ) ) ( not ( = ?auto_73179 ?auto_73184 ) ) ( not ( = ?auto_73179 ?auto_73185 ) ) ( not ( = ?auto_73179 ?auto_73186 ) ) ( not ( = ?auto_73180 ?auto_73181 ) ) ( not ( = ?auto_73180 ?auto_73182 ) ) ( not ( = ?auto_73180 ?auto_73183 ) ) ( not ( = ?auto_73180 ?auto_73184 ) ) ( not ( = ?auto_73180 ?auto_73185 ) ) ( not ( = ?auto_73180 ?auto_73186 ) ) ( not ( = ?auto_73181 ?auto_73182 ) ) ( not ( = ?auto_73181 ?auto_73183 ) ) ( not ( = ?auto_73181 ?auto_73184 ) ) ( not ( = ?auto_73181 ?auto_73185 ) ) ( not ( = ?auto_73181 ?auto_73186 ) ) ( not ( = ?auto_73182 ?auto_73183 ) ) ( not ( = ?auto_73182 ?auto_73184 ) ) ( not ( = ?auto_73182 ?auto_73185 ) ) ( not ( = ?auto_73182 ?auto_73186 ) ) ( not ( = ?auto_73183 ?auto_73184 ) ) ( not ( = ?auto_73183 ?auto_73185 ) ) ( not ( = ?auto_73183 ?auto_73186 ) ) ( not ( = ?auto_73184 ?auto_73185 ) ) ( not ( = ?auto_73184 ?auto_73186 ) ) ( not ( = ?auto_73185 ?auto_73186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73185 ?auto_73186 )
      ( !STACK ?auto_73185 ?auto_73184 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73196 - BLOCK
      ?auto_73197 - BLOCK
      ?auto_73198 - BLOCK
      ?auto_73199 - BLOCK
      ?auto_73200 - BLOCK
      ?auto_73201 - BLOCK
      ?auto_73202 - BLOCK
      ?auto_73203 - BLOCK
      ?auto_73204 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73203 ) ( ON-TABLE ?auto_73204 ) ( CLEAR ?auto_73204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73196 ) ( ON ?auto_73197 ?auto_73196 ) ( ON ?auto_73198 ?auto_73197 ) ( ON ?auto_73199 ?auto_73198 ) ( ON ?auto_73200 ?auto_73199 ) ( ON ?auto_73201 ?auto_73200 ) ( ON ?auto_73202 ?auto_73201 ) ( ON ?auto_73203 ?auto_73202 ) ( not ( = ?auto_73196 ?auto_73197 ) ) ( not ( = ?auto_73196 ?auto_73198 ) ) ( not ( = ?auto_73196 ?auto_73199 ) ) ( not ( = ?auto_73196 ?auto_73200 ) ) ( not ( = ?auto_73196 ?auto_73201 ) ) ( not ( = ?auto_73196 ?auto_73202 ) ) ( not ( = ?auto_73196 ?auto_73203 ) ) ( not ( = ?auto_73196 ?auto_73204 ) ) ( not ( = ?auto_73197 ?auto_73198 ) ) ( not ( = ?auto_73197 ?auto_73199 ) ) ( not ( = ?auto_73197 ?auto_73200 ) ) ( not ( = ?auto_73197 ?auto_73201 ) ) ( not ( = ?auto_73197 ?auto_73202 ) ) ( not ( = ?auto_73197 ?auto_73203 ) ) ( not ( = ?auto_73197 ?auto_73204 ) ) ( not ( = ?auto_73198 ?auto_73199 ) ) ( not ( = ?auto_73198 ?auto_73200 ) ) ( not ( = ?auto_73198 ?auto_73201 ) ) ( not ( = ?auto_73198 ?auto_73202 ) ) ( not ( = ?auto_73198 ?auto_73203 ) ) ( not ( = ?auto_73198 ?auto_73204 ) ) ( not ( = ?auto_73199 ?auto_73200 ) ) ( not ( = ?auto_73199 ?auto_73201 ) ) ( not ( = ?auto_73199 ?auto_73202 ) ) ( not ( = ?auto_73199 ?auto_73203 ) ) ( not ( = ?auto_73199 ?auto_73204 ) ) ( not ( = ?auto_73200 ?auto_73201 ) ) ( not ( = ?auto_73200 ?auto_73202 ) ) ( not ( = ?auto_73200 ?auto_73203 ) ) ( not ( = ?auto_73200 ?auto_73204 ) ) ( not ( = ?auto_73201 ?auto_73202 ) ) ( not ( = ?auto_73201 ?auto_73203 ) ) ( not ( = ?auto_73201 ?auto_73204 ) ) ( not ( = ?auto_73202 ?auto_73203 ) ) ( not ( = ?auto_73202 ?auto_73204 ) ) ( not ( = ?auto_73203 ?auto_73204 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_73204 )
      ( !STACK ?auto_73204 ?auto_73203 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73214 - BLOCK
      ?auto_73215 - BLOCK
      ?auto_73216 - BLOCK
      ?auto_73217 - BLOCK
      ?auto_73218 - BLOCK
      ?auto_73219 - BLOCK
      ?auto_73220 - BLOCK
      ?auto_73221 - BLOCK
      ?auto_73222 - BLOCK
    )
    :vars
    (
      ?auto_73223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73222 ?auto_73223 ) ( ON-TABLE ?auto_73214 ) ( ON ?auto_73215 ?auto_73214 ) ( ON ?auto_73216 ?auto_73215 ) ( ON ?auto_73217 ?auto_73216 ) ( ON ?auto_73218 ?auto_73217 ) ( ON ?auto_73219 ?auto_73218 ) ( ON ?auto_73220 ?auto_73219 ) ( not ( = ?auto_73214 ?auto_73215 ) ) ( not ( = ?auto_73214 ?auto_73216 ) ) ( not ( = ?auto_73214 ?auto_73217 ) ) ( not ( = ?auto_73214 ?auto_73218 ) ) ( not ( = ?auto_73214 ?auto_73219 ) ) ( not ( = ?auto_73214 ?auto_73220 ) ) ( not ( = ?auto_73214 ?auto_73221 ) ) ( not ( = ?auto_73214 ?auto_73222 ) ) ( not ( = ?auto_73214 ?auto_73223 ) ) ( not ( = ?auto_73215 ?auto_73216 ) ) ( not ( = ?auto_73215 ?auto_73217 ) ) ( not ( = ?auto_73215 ?auto_73218 ) ) ( not ( = ?auto_73215 ?auto_73219 ) ) ( not ( = ?auto_73215 ?auto_73220 ) ) ( not ( = ?auto_73215 ?auto_73221 ) ) ( not ( = ?auto_73215 ?auto_73222 ) ) ( not ( = ?auto_73215 ?auto_73223 ) ) ( not ( = ?auto_73216 ?auto_73217 ) ) ( not ( = ?auto_73216 ?auto_73218 ) ) ( not ( = ?auto_73216 ?auto_73219 ) ) ( not ( = ?auto_73216 ?auto_73220 ) ) ( not ( = ?auto_73216 ?auto_73221 ) ) ( not ( = ?auto_73216 ?auto_73222 ) ) ( not ( = ?auto_73216 ?auto_73223 ) ) ( not ( = ?auto_73217 ?auto_73218 ) ) ( not ( = ?auto_73217 ?auto_73219 ) ) ( not ( = ?auto_73217 ?auto_73220 ) ) ( not ( = ?auto_73217 ?auto_73221 ) ) ( not ( = ?auto_73217 ?auto_73222 ) ) ( not ( = ?auto_73217 ?auto_73223 ) ) ( not ( = ?auto_73218 ?auto_73219 ) ) ( not ( = ?auto_73218 ?auto_73220 ) ) ( not ( = ?auto_73218 ?auto_73221 ) ) ( not ( = ?auto_73218 ?auto_73222 ) ) ( not ( = ?auto_73218 ?auto_73223 ) ) ( not ( = ?auto_73219 ?auto_73220 ) ) ( not ( = ?auto_73219 ?auto_73221 ) ) ( not ( = ?auto_73219 ?auto_73222 ) ) ( not ( = ?auto_73219 ?auto_73223 ) ) ( not ( = ?auto_73220 ?auto_73221 ) ) ( not ( = ?auto_73220 ?auto_73222 ) ) ( not ( = ?auto_73220 ?auto_73223 ) ) ( not ( = ?auto_73221 ?auto_73222 ) ) ( not ( = ?auto_73221 ?auto_73223 ) ) ( not ( = ?auto_73222 ?auto_73223 ) ) ( CLEAR ?auto_73220 ) ( ON ?auto_73221 ?auto_73222 ) ( CLEAR ?auto_73221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_73214 ?auto_73215 ?auto_73216 ?auto_73217 ?auto_73218 ?auto_73219 ?auto_73220 ?auto_73221 )
      ( MAKE-9PILE ?auto_73214 ?auto_73215 ?auto_73216 ?auto_73217 ?auto_73218 ?auto_73219 ?auto_73220 ?auto_73221 ?auto_73222 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73233 - BLOCK
      ?auto_73234 - BLOCK
      ?auto_73235 - BLOCK
      ?auto_73236 - BLOCK
      ?auto_73237 - BLOCK
      ?auto_73238 - BLOCK
      ?auto_73239 - BLOCK
      ?auto_73240 - BLOCK
      ?auto_73241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73241 ) ( ON-TABLE ?auto_73233 ) ( ON ?auto_73234 ?auto_73233 ) ( ON ?auto_73235 ?auto_73234 ) ( ON ?auto_73236 ?auto_73235 ) ( ON ?auto_73237 ?auto_73236 ) ( ON ?auto_73238 ?auto_73237 ) ( ON ?auto_73239 ?auto_73238 ) ( not ( = ?auto_73233 ?auto_73234 ) ) ( not ( = ?auto_73233 ?auto_73235 ) ) ( not ( = ?auto_73233 ?auto_73236 ) ) ( not ( = ?auto_73233 ?auto_73237 ) ) ( not ( = ?auto_73233 ?auto_73238 ) ) ( not ( = ?auto_73233 ?auto_73239 ) ) ( not ( = ?auto_73233 ?auto_73240 ) ) ( not ( = ?auto_73233 ?auto_73241 ) ) ( not ( = ?auto_73234 ?auto_73235 ) ) ( not ( = ?auto_73234 ?auto_73236 ) ) ( not ( = ?auto_73234 ?auto_73237 ) ) ( not ( = ?auto_73234 ?auto_73238 ) ) ( not ( = ?auto_73234 ?auto_73239 ) ) ( not ( = ?auto_73234 ?auto_73240 ) ) ( not ( = ?auto_73234 ?auto_73241 ) ) ( not ( = ?auto_73235 ?auto_73236 ) ) ( not ( = ?auto_73235 ?auto_73237 ) ) ( not ( = ?auto_73235 ?auto_73238 ) ) ( not ( = ?auto_73235 ?auto_73239 ) ) ( not ( = ?auto_73235 ?auto_73240 ) ) ( not ( = ?auto_73235 ?auto_73241 ) ) ( not ( = ?auto_73236 ?auto_73237 ) ) ( not ( = ?auto_73236 ?auto_73238 ) ) ( not ( = ?auto_73236 ?auto_73239 ) ) ( not ( = ?auto_73236 ?auto_73240 ) ) ( not ( = ?auto_73236 ?auto_73241 ) ) ( not ( = ?auto_73237 ?auto_73238 ) ) ( not ( = ?auto_73237 ?auto_73239 ) ) ( not ( = ?auto_73237 ?auto_73240 ) ) ( not ( = ?auto_73237 ?auto_73241 ) ) ( not ( = ?auto_73238 ?auto_73239 ) ) ( not ( = ?auto_73238 ?auto_73240 ) ) ( not ( = ?auto_73238 ?auto_73241 ) ) ( not ( = ?auto_73239 ?auto_73240 ) ) ( not ( = ?auto_73239 ?auto_73241 ) ) ( not ( = ?auto_73240 ?auto_73241 ) ) ( CLEAR ?auto_73239 ) ( ON ?auto_73240 ?auto_73241 ) ( CLEAR ?auto_73240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_73233 ?auto_73234 ?auto_73235 ?auto_73236 ?auto_73237 ?auto_73238 ?auto_73239 ?auto_73240 )
      ( MAKE-9PILE ?auto_73233 ?auto_73234 ?auto_73235 ?auto_73236 ?auto_73237 ?auto_73238 ?auto_73239 ?auto_73240 ?auto_73241 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73251 - BLOCK
      ?auto_73252 - BLOCK
      ?auto_73253 - BLOCK
      ?auto_73254 - BLOCK
      ?auto_73255 - BLOCK
      ?auto_73256 - BLOCK
      ?auto_73257 - BLOCK
      ?auto_73258 - BLOCK
      ?auto_73259 - BLOCK
    )
    :vars
    (
      ?auto_73260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73259 ?auto_73260 ) ( ON-TABLE ?auto_73251 ) ( ON ?auto_73252 ?auto_73251 ) ( ON ?auto_73253 ?auto_73252 ) ( ON ?auto_73254 ?auto_73253 ) ( ON ?auto_73255 ?auto_73254 ) ( ON ?auto_73256 ?auto_73255 ) ( not ( = ?auto_73251 ?auto_73252 ) ) ( not ( = ?auto_73251 ?auto_73253 ) ) ( not ( = ?auto_73251 ?auto_73254 ) ) ( not ( = ?auto_73251 ?auto_73255 ) ) ( not ( = ?auto_73251 ?auto_73256 ) ) ( not ( = ?auto_73251 ?auto_73257 ) ) ( not ( = ?auto_73251 ?auto_73258 ) ) ( not ( = ?auto_73251 ?auto_73259 ) ) ( not ( = ?auto_73251 ?auto_73260 ) ) ( not ( = ?auto_73252 ?auto_73253 ) ) ( not ( = ?auto_73252 ?auto_73254 ) ) ( not ( = ?auto_73252 ?auto_73255 ) ) ( not ( = ?auto_73252 ?auto_73256 ) ) ( not ( = ?auto_73252 ?auto_73257 ) ) ( not ( = ?auto_73252 ?auto_73258 ) ) ( not ( = ?auto_73252 ?auto_73259 ) ) ( not ( = ?auto_73252 ?auto_73260 ) ) ( not ( = ?auto_73253 ?auto_73254 ) ) ( not ( = ?auto_73253 ?auto_73255 ) ) ( not ( = ?auto_73253 ?auto_73256 ) ) ( not ( = ?auto_73253 ?auto_73257 ) ) ( not ( = ?auto_73253 ?auto_73258 ) ) ( not ( = ?auto_73253 ?auto_73259 ) ) ( not ( = ?auto_73253 ?auto_73260 ) ) ( not ( = ?auto_73254 ?auto_73255 ) ) ( not ( = ?auto_73254 ?auto_73256 ) ) ( not ( = ?auto_73254 ?auto_73257 ) ) ( not ( = ?auto_73254 ?auto_73258 ) ) ( not ( = ?auto_73254 ?auto_73259 ) ) ( not ( = ?auto_73254 ?auto_73260 ) ) ( not ( = ?auto_73255 ?auto_73256 ) ) ( not ( = ?auto_73255 ?auto_73257 ) ) ( not ( = ?auto_73255 ?auto_73258 ) ) ( not ( = ?auto_73255 ?auto_73259 ) ) ( not ( = ?auto_73255 ?auto_73260 ) ) ( not ( = ?auto_73256 ?auto_73257 ) ) ( not ( = ?auto_73256 ?auto_73258 ) ) ( not ( = ?auto_73256 ?auto_73259 ) ) ( not ( = ?auto_73256 ?auto_73260 ) ) ( not ( = ?auto_73257 ?auto_73258 ) ) ( not ( = ?auto_73257 ?auto_73259 ) ) ( not ( = ?auto_73257 ?auto_73260 ) ) ( not ( = ?auto_73258 ?auto_73259 ) ) ( not ( = ?auto_73258 ?auto_73260 ) ) ( not ( = ?auto_73259 ?auto_73260 ) ) ( ON ?auto_73258 ?auto_73259 ) ( CLEAR ?auto_73256 ) ( ON ?auto_73257 ?auto_73258 ) ( CLEAR ?auto_73257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_73251 ?auto_73252 ?auto_73253 ?auto_73254 ?auto_73255 ?auto_73256 ?auto_73257 )
      ( MAKE-9PILE ?auto_73251 ?auto_73252 ?auto_73253 ?auto_73254 ?auto_73255 ?auto_73256 ?auto_73257 ?auto_73258 ?auto_73259 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73270 - BLOCK
      ?auto_73271 - BLOCK
      ?auto_73272 - BLOCK
      ?auto_73273 - BLOCK
      ?auto_73274 - BLOCK
      ?auto_73275 - BLOCK
      ?auto_73276 - BLOCK
      ?auto_73277 - BLOCK
      ?auto_73278 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73278 ) ( ON-TABLE ?auto_73270 ) ( ON ?auto_73271 ?auto_73270 ) ( ON ?auto_73272 ?auto_73271 ) ( ON ?auto_73273 ?auto_73272 ) ( ON ?auto_73274 ?auto_73273 ) ( ON ?auto_73275 ?auto_73274 ) ( not ( = ?auto_73270 ?auto_73271 ) ) ( not ( = ?auto_73270 ?auto_73272 ) ) ( not ( = ?auto_73270 ?auto_73273 ) ) ( not ( = ?auto_73270 ?auto_73274 ) ) ( not ( = ?auto_73270 ?auto_73275 ) ) ( not ( = ?auto_73270 ?auto_73276 ) ) ( not ( = ?auto_73270 ?auto_73277 ) ) ( not ( = ?auto_73270 ?auto_73278 ) ) ( not ( = ?auto_73271 ?auto_73272 ) ) ( not ( = ?auto_73271 ?auto_73273 ) ) ( not ( = ?auto_73271 ?auto_73274 ) ) ( not ( = ?auto_73271 ?auto_73275 ) ) ( not ( = ?auto_73271 ?auto_73276 ) ) ( not ( = ?auto_73271 ?auto_73277 ) ) ( not ( = ?auto_73271 ?auto_73278 ) ) ( not ( = ?auto_73272 ?auto_73273 ) ) ( not ( = ?auto_73272 ?auto_73274 ) ) ( not ( = ?auto_73272 ?auto_73275 ) ) ( not ( = ?auto_73272 ?auto_73276 ) ) ( not ( = ?auto_73272 ?auto_73277 ) ) ( not ( = ?auto_73272 ?auto_73278 ) ) ( not ( = ?auto_73273 ?auto_73274 ) ) ( not ( = ?auto_73273 ?auto_73275 ) ) ( not ( = ?auto_73273 ?auto_73276 ) ) ( not ( = ?auto_73273 ?auto_73277 ) ) ( not ( = ?auto_73273 ?auto_73278 ) ) ( not ( = ?auto_73274 ?auto_73275 ) ) ( not ( = ?auto_73274 ?auto_73276 ) ) ( not ( = ?auto_73274 ?auto_73277 ) ) ( not ( = ?auto_73274 ?auto_73278 ) ) ( not ( = ?auto_73275 ?auto_73276 ) ) ( not ( = ?auto_73275 ?auto_73277 ) ) ( not ( = ?auto_73275 ?auto_73278 ) ) ( not ( = ?auto_73276 ?auto_73277 ) ) ( not ( = ?auto_73276 ?auto_73278 ) ) ( not ( = ?auto_73277 ?auto_73278 ) ) ( ON ?auto_73277 ?auto_73278 ) ( CLEAR ?auto_73275 ) ( ON ?auto_73276 ?auto_73277 ) ( CLEAR ?auto_73276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_73270 ?auto_73271 ?auto_73272 ?auto_73273 ?auto_73274 ?auto_73275 ?auto_73276 )
      ( MAKE-9PILE ?auto_73270 ?auto_73271 ?auto_73272 ?auto_73273 ?auto_73274 ?auto_73275 ?auto_73276 ?auto_73277 ?auto_73278 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73288 - BLOCK
      ?auto_73289 - BLOCK
      ?auto_73290 - BLOCK
      ?auto_73291 - BLOCK
      ?auto_73292 - BLOCK
      ?auto_73293 - BLOCK
      ?auto_73294 - BLOCK
      ?auto_73295 - BLOCK
      ?auto_73296 - BLOCK
    )
    :vars
    (
      ?auto_73297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73296 ?auto_73297 ) ( ON-TABLE ?auto_73288 ) ( ON ?auto_73289 ?auto_73288 ) ( ON ?auto_73290 ?auto_73289 ) ( ON ?auto_73291 ?auto_73290 ) ( ON ?auto_73292 ?auto_73291 ) ( not ( = ?auto_73288 ?auto_73289 ) ) ( not ( = ?auto_73288 ?auto_73290 ) ) ( not ( = ?auto_73288 ?auto_73291 ) ) ( not ( = ?auto_73288 ?auto_73292 ) ) ( not ( = ?auto_73288 ?auto_73293 ) ) ( not ( = ?auto_73288 ?auto_73294 ) ) ( not ( = ?auto_73288 ?auto_73295 ) ) ( not ( = ?auto_73288 ?auto_73296 ) ) ( not ( = ?auto_73288 ?auto_73297 ) ) ( not ( = ?auto_73289 ?auto_73290 ) ) ( not ( = ?auto_73289 ?auto_73291 ) ) ( not ( = ?auto_73289 ?auto_73292 ) ) ( not ( = ?auto_73289 ?auto_73293 ) ) ( not ( = ?auto_73289 ?auto_73294 ) ) ( not ( = ?auto_73289 ?auto_73295 ) ) ( not ( = ?auto_73289 ?auto_73296 ) ) ( not ( = ?auto_73289 ?auto_73297 ) ) ( not ( = ?auto_73290 ?auto_73291 ) ) ( not ( = ?auto_73290 ?auto_73292 ) ) ( not ( = ?auto_73290 ?auto_73293 ) ) ( not ( = ?auto_73290 ?auto_73294 ) ) ( not ( = ?auto_73290 ?auto_73295 ) ) ( not ( = ?auto_73290 ?auto_73296 ) ) ( not ( = ?auto_73290 ?auto_73297 ) ) ( not ( = ?auto_73291 ?auto_73292 ) ) ( not ( = ?auto_73291 ?auto_73293 ) ) ( not ( = ?auto_73291 ?auto_73294 ) ) ( not ( = ?auto_73291 ?auto_73295 ) ) ( not ( = ?auto_73291 ?auto_73296 ) ) ( not ( = ?auto_73291 ?auto_73297 ) ) ( not ( = ?auto_73292 ?auto_73293 ) ) ( not ( = ?auto_73292 ?auto_73294 ) ) ( not ( = ?auto_73292 ?auto_73295 ) ) ( not ( = ?auto_73292 ?auto_73296 ) ) ( not ( = ?auto_73292 ?auto_73297 ) ) ( not ( = ?auto_73293 ?auto_73294 ) ) ( not ( = ?auto_73293 ?auto_73295 ) ) ( not ( = ?auto_73293 ?auto_73296 ) ) ( not ( = ?auto_73293 ?auto_73297 ) ) ( not ( = ?auto_73294 ?auto_73295 ) ) ( not ( = ?auto_73294 ?auto_73296 ) ) ( not ( = ?auto_73294 ?auto_73297 ) ) ( not ( = ?auto_73295 ?auto_73296 ) ) ( not ( = ?auto_73295 ?auto_73297 ) ) ( not ( = ?auto_73296 ?auto_73297 ) ) ( ON ?auto_73295 ?auto_73296 ) ( ON ?auto_73294 ?auto_73295 ) ( CLEAR ?auto_73292 ) ( ON ?auto_73293 ?auto_73294 ) ( CLEAR ?auto_73293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73288 ?auto_73289 ?auto_73290 ?auto_73291 ?auto_73292 ?auto_73293 )
      ( MAKE-9PILE ?auto_73288 ?auto_73289 ?auto_73290 ?auto_73291 ?auto_73292 ?auto_73293 ?auto_73294 ?auto_73295 ?auto_73296 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73307 - BLOCK
      ?auto_73308 - BLOCK
      ?auto_73309 - BLOCK
      ?auto_73310 - BLOCK
      ?auto_73311 - BLOCK
      ?auto_73312 - BLOCK
      ?auto_73313 - BLOCK
      ?auto_73314 - BLOCK
      ?auto_73315 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73315 ) ( ON-TABLE ?auto_73307 ) ( ON ?auto_73308 ?auto_73307 ) ( ON ?auto_73309 ?auto_73308 ) ( ON ?auto_73310 ?auto_73309 ) ( ON ?auto_73311 ?auto_73310 ) ( not ( = ?auto_73307 ?auto_73308 ) ) ( not ( = ?auto_73307 ?auto_73309 ) ) ( not ( = ?auto_73307 ?auto_73310 ) ) ( not ( = ?auto_73307 ?auto_73311 ) ) ( not ( = ?auto_73307 ?auto_73312 ) ) ( not ( = ?auto_73307 ?auto_73313 ) ) ( not ( = ?auto_73307 ?auto_73314 ) ) ( not ( = ?auto_73307 ?auto_73315 ) ) ( not ( = ?auto_73308 ?auto_73309 ) ) ( not ( = ?auto_73308 ?auto_73310 ) ) ( not ( = ?auto_73308 ?auto_73311 ) ) ( not ( = ?auto_73308 ?auto_73312 ) ) ( not ( = ?auto_73308 ?auto_73313 ) ) ( not ( = ?auto_73308 ?auto_73314 ) ) ( not ( = ?auto_73308 ?auto_73315 ) ) ( not ( = ?auto_73309 ?auto_73310 ) ) ( not ( = ?auto_73309 ?auto_73311 ) ) ( not ( = ?auto_73309 ?auto_73312 ) ) ( not ( = ?auto_73309 ?auto_73313 ) ) ( not ( = ?auto_73309 ?auto_73314 ) ) ( not ( = ?auto_73309 ?auto_73315 ) ) ( not ( = ?auto_73310 ?auto_73311 ) ) ( not ( = ?auto_73310 ?auto_73312 ) ) ( not ( = ?auto_73310 ?auto_73313 ) ) ( not ( = ?auto_73310 ?auto_73314 ) ) ( not ( = ?auto_73310 ?auto_73315 ) ) ( not ( = ?auto_73311 ?auto_73312 ) ) ( not ( = ?auto_73311 ?auto_73313 ) ) ( not ( = ?auto_73311 ?auto_73314 ) ) ( not ( = ?auto_73311 ?auto_73315 ) ) ( not ( = ?auto_73312 ?auto_73313 ) ) ( not ( = ?auto_73312 ?auto_73314 ) ) ( not ( = ?auto_73312 ?auto_73315 ) ) ( not ( = ?auto_73313 ?auto_73314 ) ) ( not ( = ?auto_73313 ?auto_73315 ) ) ( not ( = ?auto_73314 ?auto_73315 ) ) ( ON ?auto_73314 ?auto_73315 ) ( ON ?auto_73313 ?auto_73314 ) ( CLEAR ?auto_73311 ) ( ON ?auto_73312 ?auto_73313 ) ( CLEAR ?auto_73312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73307 ?auto_73308 ?auto_73309 ?auto_73310 ?auto_73311 ?auto_73312 )
      ( MAKE-9PILE ?auto_73307 ?auto_73308 ?auto_73309 ?auto_73310 ?auto_73311 ?auto_73312 ?auto_73313 ?auto_73314 ?auto_73315 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73325 - BLOCK
      ?auto_73326 - BLOCK
      ?auto_73327 - BLOCK
      ?auto_73328 - BLOCK
      ?auto_73329 - BLOCK
      ?auto_73330 - BLOCK
      ?auto_73331 - BLOCK
      ?auto_73332 - BLOCK
      ?auto_73333 - BLOCK
    )
    :vars
    (
      ?auto_73334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73333 ?auto_73334 ) ( ON-TABLE ?auto_73325 ) ( ON ?auto_73326 ?auto_73325 ) ( ON ?auto_73327 ?auto_73326 ) ( ON ?auto_73328 ?auto_73327 ) ( not ( = ?auto_73325 ?auto_73326 ) ) ( not ( = ?auto_73325 ?auto_73327 ) ) ( not ( = ?auto_73325 ?auto_73328 ) ) ( not ( = ?auto_73325 ?auto_73329 ) ) ( not ( = ?auto_73325 ?auto_73330 ) ) ( not ( = ?auto_73325 ?auto_73331 ) ) ( not ( = ?auto_73325 ?auto_73332 ) ) ( not ( = ?auto_73325 ?auto_73333 ) ) ( not ( = ?auto_73325 ?auto_73334 ) ) ( not ( = ?auto_73326 ?auto_73327 ) ) ( not ( = ?auto_73326 ?auto_73328 ) ) ( not ( = ?auto_73326 ?auto_73329 ) ) ( not ( = ?auto_73326 ?auto_73330 ) ) ( not ( = ?auto_73326 ?auto_73331 ) ) ( not ( = ?auto_73326 ?auto_73332 ) ) ( not ( = ?auto_73326 ?auto_73333 ) ) ( not ( = ?auto_73326 ?auto_73334 ) ) ( not ( = ?auto_73327 ?auto_73328 ) ) ( not ( = ?auto_73327 ?auto_73329 ) ) ( not ( = ?auto_73327 ?auto_73330 ) ) ( not ( = ?auto_73327 ?auto_73331 ) ) ( not ( = ?auto_73327 ?auto_73332 ) ) ( not ( = ?auto_73327 ?auto_73333 ) ) ( not ( = ?auto_73327 ?auto_73334 ) ) ( not ( = ?auto_73328 ?auto_73329 ) ) ( not ( = ?auto_73328 ?auto_73330 ) ) ( not ( = ?auto_73328 ?auto_73331 ) ) ( not ( = ?auto_73328 ?auto_73332 ) ) ( not ( = ?auto_73328 ?auto_73333 ) ) ( not ( = ?auto_73328 ?auto_73334 ) ) ( not ( = ?auto_73329 ?auto_73330 ) ) ( not ( = ?auto_73329 ?auto_73331 ) ) ( not ( = ?auto_73329 ?auto_73332 ) ) ( not ( = ?auto_73329 ?auto_73333 ) ) ( not ( = ?auto_73329 ?auto_73334 ) ) ( not ( = ?auto_73330 ?auto_73331 ) ) ( not ( = ?auto_73330 ?auto_73332 ) ) ( not ( = ?auto_73330 ?auto_73333 ) ) ( not ( = ?auto_73330 ?auto_73334 ) ) ( not ( = ?auto_73331 ?auto_73332 ) ) ( not ( = ?auto_73331 ?auto_73333 ) ) ( not ( = ?auto_73331 ?auto_73334 ) ) ( not ( = ?auto_73332 ?auto_73333 ) ) ( not ( = ?auto_73332 ?auto_73334 ) ) ( not ( = ?auto_73333 ?auto_73334 ) ) ( ON ?auto_73332 ?auto_73333 ) ( ON ?auto_73331 ?auto_73332 ) ( ON ?auto_73330 ?auto_73331 ) ( CLEAR ?auto_73328 ) ( ON ?auto_73329 ?auto_73330 ) ( CLEAR ?auto_73329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73325 ?auto_73326 ?auto_73327 ?auto_73328 ?auto_73329 )
      ( MAKE-9PILE ?auto_73325 ?auto_73326 ?auto_73327 ?auto_73328 ?auto_73329 ?auto_73330 ?auto_73331 ?auto_73332 ?auto_73333 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73344 - BLOCK
      ?auto_73345 - BLOCK
      ?auto_73346 - BLOCK
      ?auto_73347 - BLOCK
      ?auto_73348 - BLOCK
      ?auto_73349 - BLOCK
      ?auto_73350 - BLOCK
      ?auto_73351 - BLOCK
      ?auto_73352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73352 ) ( ON-TABLE ?auto_73344 ) ( ON ?auto_73345 ?auto_73344 ) ( ON ?auto_73346 ?auto_73345 ) ( ON ?auto_73347 ?auto_73346 ) ( not ( = ?auto_73344 ?auto_73345 ) ) ( not ( = ?auto_73344 ?auto_73346 ) ) ( not ( = ?auto_73344 ?auto_73347 ) ) ( not ( = ?auto_73344 ?auto_73348 ) ) ( not ( = ?auto_73344 ?auto_73349 ) ) ( not ( = ?auto_73344 ?auto_73350 ) ) ( not ( = ?auto_73344 ?auto_73351 ) ) ( not ( = ?auto_73344 ?auto_73352 ) ) ( not ( = ?auto_73345 ?auto_73346 ) ) ( not ( = ?auto_73345 ?auto_73347 ) ) ( not ( = ?auto_73345 ?auto_73348 ) ) ( not ( = ?auto_73345 ?auto_73349 ) ) ( not ( = ?auto_73345 ?auto_73350 ) ) ( not ( = ?auto_73345 ?auto_73351 ) ) ( not ( = ?auto_73345 ?auto_73352 ) ) ( not ( = ?auto_73346 ?auto_73347 ) ) ( not ( = ?auto_73346 ?auto_73348 ) ) ( not ( = ?auto_73346 ?auto_73349 ) ) ( not ( = ?auto_73346 ?auto_73350 ) ) ( not ( = ?auto_73346 ?auto_73351 ) ) ( not ( = ?auto_73346 ?auto_73352 ) ) ( not ( = ?auto_73347 ?auto_73348 ) ) ( not ( = ?auto_73347 ?auto_73349 ) ) ( not ( = ?auto_73347 ?auto_73350 ) ) ( not ( = ?auto_73347 ?auto_73351 ) ) ( not ( = ?auto_73347 ?auto_73352 ) ) ( not ( = ?auto_73348 ?auto_73349 ) ) ( not ( = ?auto_73348 ?auto_73350 ) ) ( not ( = ?auto_73348 ?auto_73351 ) ) ( not ( = ?auto_73348 ?auto_73352 ) ) ( not ( = ?auto_73349 ?auto_73350 ) ) ( not ( = ?auto_73349 ?auto_73351 ) ) ( not ( = ?auto_73349 ?auto_73352 ) ) ( not ( = ?auto_73350 ?auto_73351 ) ) ( not ( = ?auto_73350 ?auto_73352 ) ) ( not ( = ?auto_73351 ?auto_73352 ) ) ( ON ?auto_73351 ?auto_73352 ) ( ON ?auto_73350 ?auto_73351 ) ( ON ?auto_73349 ?auto_73350 ) ( CLEAR ?auto_73347 ) ( ON ?auto_73348 ?auto_73349 ) ( CLEAR ?auto_73348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73344 ?auto_73345 ?auto_73346 ?auto_73347 ?auto_73348 )
      ( MAKE-9PILE ?auto_73344 ?auto_73345 ?auto_73346 ?auto_73347 ?auto_73348 ?auto_73349 ?auto_73350 ?auto_73351 ?auto_73352 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73362 - BLOCK
      ?auto_73363 - BLOCK
      ?auto_73364 - BLOCK
      ?auto_73365 - BLOCK
      ?auto_73366 - BLOCK
      ?auto_73367 - BLOCK
      ?auto_73368 - BLOCK
      ?auto_73369 - BLOCK
      ?auto_73370 - BLOCK
    )
    :vars
    (
      ?auto_73371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73370 ?auto_73371 ) ( ON-TABLE ?auto_73362 ) ( ON ?auto_73363 ?auto_73362 ) ( ON ?auto_73364 ?auto_73363 ) ( not ( = ?auto_73362 ?auto_73363 ) ) ( not ( = ?auto_73362 ?auto_73364 ) ) ( not ( = ?auto_73362 ?auto_73365 ) ) ( not ( = ?auto_73362 ?auto_73366 ) ) ( not ( = ?auto_73362 ?auto_73367 ) ) ( not ( = ?auto_73362 ?auto_73368 ) ) ( not ( = ?auto_73362 ?auto_73369 ) ) ( not ( = ?auto_73362 ?auto_73370 ) ) ( not ( = ?auto_73362 ?auto_73371 ) ) ( not ( = ?auto_73363 ?auto_73364 ) ) ( not ( = ?auto_73363 ?auto_73365 ) ) ( not ( = ?auto_73363 ?auto_73366 ) ) ( not ( = ?auto_73363 ?auto_73367 ) ) ( not ( = ?auto_73363 ?auto_73368 ) ) ( not ( = ?auto_73363 ?auto_73369 ) ) ( not ( = ?auto_73363 ?auto_73370 ) ) ( not ( = ?auto_73363 ?auto_73371 ) ) ( not ( = ?auto_73364 ?auto_73365 ) ) ( not ( = ?auto_73364 ?auto_73366 ) ) ( not ( = ?auto_73364 ?auto_73367 ) ) ( not ( = ?auto_73364 ?auto_73368 ) ) ( not ( = ?auto_73364 ?auto_73369 ) ) ( not ( = ?auto_73364 ?auto_73370 ) ) ( not ( = ?auto_73364 ?auto_73371 ) ) ( not ( = ?auto_73365 ?auto_73366 ) ) ( not ( = ?auto_73365 ?auto_73367 ) ) ( not ( = ?auto_73365 ?auto_73368 ) ) ( not ( = ?auto_73365 ?auto_73369 ) ) ( not ( = ?auto_73365 ?auto_73370 ) ) ( not ( = ?auto_73365 ?auto_73371 ) ) ( not ( = ?auto_73366 ?auto_73367 ) ) ( not ( = ?auto_73366 ?auto_73368 ) ) ( not ( = ?auto_73366 ?auto_73369 ) ) ( not ( = ?auto_73366 ?auto_73370 ) ) ( not ( = ?auto_73366 ?auto_73371 ) ) ( not ( = ?auto_73367 ?auto_73368 ) ) ( not ( = ?auto_73367 ?auto_73369 ) ) ( not ( = ?auto_73367 ?auto_73370 ) ) ( not ( = ?auto_73367 ?auto_73371 ) ) ( not ( = ?auto_73368 ?auto_73369 ) ) ( not ( = ?auto_73368 ?auto_73370 ) ) ( not ( = ?auto_73368 ?auto_73371 ) ) ( not ( = ?auto_73369 ?auto_73370 ) ) ( not ( = ?auto_73369 ?auto_73371 ) ) ( not ( = ?auto_73370 ?auto_73371 ) ) ( ON ?auto_73369 ?auto_73370 ) ( ON ?auto_73368 ?auto_73369 ) ( ON ?auto_73367 ?auto_73368 ) ( ON ?auto_73366 ?auto_73367 ) ( CLEAR ?auto_73364 ) ( ON ?auto_73365 ?auto_73366 ) ( CLEAR ?auto_73365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73362 ?auto_73363 ?auto_73364 ?auto_73365 )
      ( MAKE-9PILE ?auto_73362 ?auto_73363 ?auto_73364 ?auto_73365 ?auto_73366 ?auto_73367 ?auto_73368 ?auto_73369 ?auto_73370 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73381 - BLOCK
      ?auto_73382 - BLOCK
      ?auto_73383 - BLOCK
      ?auto_73384 - BLOCK
      ?auto_73385 - BLOCK
      ?auto_73386 - BLOCK
      ?auto_73387 - BLOCK
      ?auto_73388 - BLOCK
      ?auto_73389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73389 ) ( ON-TABLE ?auto_73381 ) ( ON ?auto_73382 ?auto_73381 ) ( ON ?auto_73383 ?auto_73382 ) ( not ( = ?auto_73381 ?auto_73382 ) ) ( not ( = ?auto_73381 ?auto_73383 ) ) ( not ( = ?auto_73381 ?auto_73384 ) ) ( not ( = ?auto_73381 ?auto_73385 ) ) ( not ( = ?auto_73381 ?auto_73386 ) ) ( not ( = ?auto_73381 ?auto_73387 ) ) ( not ( = ?auto_73381 ?auto_73388 ) ) ( not ( = ?auto_73381 ?auto_73389 ) ) ( not ( = ?auto_73382 ?auto_73383 ) ) ( not ( = ?auto_73382 ?auto_73384 ) ) ( not ( = ?auto_73382 ?auto_73385 ) ) ( not ( = ?auto_73382 ?auto_73386 ) ) ( not ( = ?auto_73382 ?auto_73387 ) ) ( not ( = ?auto_73382 ?auto_73388 ) ) ( not ( = ?auto_73382 ?auto_73389 ) ) ( not ( = ?auto_73383 ?auto_73384 ) ) ( not ( = ?auto_73383 ?auto_73385 ) ) ( not ( = ?auto_73383 ?auto_73386 ) ) ( not ( = ?auto_73383 ?auto_73387 ) ) ( not ( = ?auto_73383 ?auto_73388 ) ) ( not ( = ?auto_73383 ?auto_73389 ) ) ( not ( = ?auto_73384 ?auto_73385 ) ) ( not ( = ?auto_73384 ?auto_73386 ) ) ( not ( = ?auto_73384 ?auto_73387 ) ) ( not ( = ?auto_73384 ?auto_73388 ) ) ( not ( = ?auto_73384 ?auto_73389 ) ) ( not ( = ?auto_73385 ?auto_73386 ) ) ( not ( = ?auto_73385 ?auto_73387 ) ) ( not ( = ?auto_73385 ?auto_73388 ) ) ( not ( = ?auto_73385 ?auto_73389 ) ) ( not ( = ?auto_73386 ?auto_73387 ) ) ( not ( = ?auto_73386 ?auto_73388 ) ) ( not ( = ?auto_73386 ?auto_73389 ) ) ( not ( = ?auto_73387 ?auto_73388 ) ) ( not ( = ?auto_73387 ?auto_73389 ) ) ( not ( = ?auto_73388 ?auto_73389 ) ) ( ON ?auto_73388 ?auto_73389 ) ( ON ?auto_73387 ?auto_73388 ) ( ON ?auto_73386 ?auto_73387 ) ( ON ?auto_73385 ?auto_73386 ) ( CLEAR ?auto_73383 ) ( ON ?auto_73384 ?auto_73385 ) ( CLEAR ?auto_73384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73381 ?auto_73382 ?auto_73383 ?auto_73384 )
      ( MAKE-9PILE ?auto_73381 ?auto_73382 ?auto_73383 ?auto_73384 ?auto_73385 ?auto_73386 ?auto_73387 ?auto_73388 ?auto_73389 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73399 - BLOCK
      ?auto_73400 - BLOCK
      ?auto_73401 - BLOCK
      ?auto_73402 - BLOCK
      ?auto_73403 - BLOCK
      ?auto_73404 - BLOCK
      ?auto_73405 - BLOCK
      ?auto_73406 - BLOCK
      ?auto_73407 - BLOCK
    )
    :vars
    (
      ?auto_73408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73407 ?auto_73408 ) ( ON-TABLE ?auto_73399 ) ( ON ?auto_73400 ?auto_73399 ) ( not ( = ?auto_73399 ?auto_73400 ) ) ( not ( = ?auto_73399 ?auto_73401 ) ) ( not ( = ?auto_73399 ?auto_73402 ) ) ( not ( = ?auto_73399 ?auto_73403 ) ) ( not ( = ?auto_73399 ?auto_73404 ) ) ( not ( = ?auto_73399 ?auto_73405 ) ) ( not ( = ?auto_73399 ?auto_73406 ) ) ( not ( = ?auto_73399 ?auto_73407 ) ) ( not ( = ?auto_73399 ?auto_73408 ) ) ( not ( = ?auto_73400 ?auto_73401 ) ) ( not ( = ?auto_73400 ?auto_73402 ) ) ( not ( = ?auto_73400 ?auto_73403 ) ) ( not ( = ?auto_73400 ?auto_73404 ) ) ( not ( = ?auto_73400 ?auto_73405 ) ) ( not ( = ?auto_73400 ?auto_73406 ) ) ( not ( = ?auto_73400 ?auto_73407 ) ) ( not ( = ?auto_73400 ?auto_73408 ) ) ( not ( = ?auto_73401 ?auto_73402 ) ) ( not ( = ?auto_73401 ?auto_73403 ) ) ( not ( = ?auto_73401 ?auto_73404 ) ) ( not ( = ?auto_73401 ?auto_73405 ) ) ( not ( = ?auto_73401 ?auto_73406 ) ) ( not ( = ?auto_73401 ?auto_73407 ) ) ( not ( = ?auto_73401 ?auto_73408 ) ) ( not ( = ?auto_73402 ?auto_73403 ) ) ( not ( = ?auto_73402 ?auto_73404 ) ) ( not ( = ?auto_73402 ?auto_73405 ) ) ( not ( = ?auto_73402 ?auto_73406 ) ) ( not ( = ?auto_73402 ?auto_73407 ) ) ( not ( = ?auto_73402 ?auto_73408 ) ) ( not ( = ?auto_73403 ?auto_73404 ) ) ( not ( = ?auto_73403 ?auto_73405 ) ) ( not ( = ?auto_73403 ?auto_73406 ) ) ( not ( = ?auto_73403 ?auto_73407 ) ) ( not ( = ?auto_73403 ?auto_73408 ) ) ( not ( = ?auto_73404 ?auto_73405 ) ) ( not ( = ?auto_73404 ?auto_73406 ) ) ( not ( = ?auto_73404 ?auto_73407 ) ) ( not ( = ?auto_73404 ?auto_73408 ) ) ( not ( = ?auto_73405 ?auto_73406 ) ) ( not ( = ?auto_73405 ?auto_73407 ) ) ( not ( = ?auto_73405 ?auto_73408 ) ) ( not ( = ?auto_73406 ?auto_73407 ) ) ( not ( = ?auto_73406 ?auto_73408 ) ) ( not ( = ?auto_73407 ?auto_73408 ) ) ( ON ?auto_73406 ?auto_73407 ) ( ON ?auto_73405 ?auto_73406 ) ( ON ?auto_73404 ?auto_73405 ) ( ON ?auto_73403 ?auto_73404 ) ( ON ?auto_73402 ?auto_73403 ) ( CLEAR ?auto_73400 ) ( ON ?auto_73401 ?auto_73402 ) ( CLEAR ?auto_73401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73399 ?auto_73400 ?auto_73401 )
      ( MAKE-9PILE ?auto_73399 ?auto_73400 ?auto_73401 ?auto_73402 ?auto_73403 ?auto_73404 ?auto_73405 ?auto_73406 ?auto_73407 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73418 - BLOCK
      ?auto_73419 - BLOCK
      ?auto_73420 - BLOCK
      ?auto_73421 - BLOCK
      ?auto_73422 - BLOCK
      ?auto_73423 - BLOCK
      ?auto_73424 - BLOCK
      ?auto_73425 - BLOCK
      ?auto_73426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73426 ) ( ON-TABLE ?auto_73418 ) ( ON ?auto_73419 ?auto_73418 ) ( not ( = ?auto_73418 ?auto_73419 ) ) ( not ( = ?auto_73418 ?auto_73420 ) ) ( not ( = ?auto_73418 ?auto_73421 ) ) ( not ( = ?auto_73418 ?auto_73422 ) ) ( not ( = ?auto_73418 ?auto_73423 ) ) ( not ( = ?auto_73418 ?auto_73424 ) ) ( not ( = ?auto_73418 ?auto_73425 ) ) ( not ( = ?auto_73418 ?auto_73426 ) ) ( not ( = ?auto_73419 ?auto_73420 ) ) ( not ( = ?auto_73419 ?auto_73421 ) ) ( not ( = ?auto_73419 ?auto_73422 ) ) ( not ( = ?auto_73419 ?auto_73423 ) ) ( not ( = ?auto_73419 ?auto_73424 ) ) ( not ( = ?auto_73419 ?auto_73425 ) ) ( not ( = ?auto_73419 ?auto_73426 ) ) ( not ( = ?auto_73420 ?auto_73421 ) ) ( not ( = ?auto_73420 ?auto_73422 ) ) ( not ( = ?auto_73420 ?auto_73423 ) ) ( not ( = ?auto_73420 ?auto_73424 ) ) ( not ( = ?auto_73420 ?auto_73425 ) ) ( not ( = ?auto_73420 ?auto_73426 ) ) ( not ( = ?auto_73421 ?auto_73422 ) ) ( not ( = ?auto_73421 ?auto_73423 ) ) ( not ( = ?auto_73421 ?auto_73424 ) ) ( not ( = ?auto_73421 ?auto_73425 ) ) ( not ( = ?auto_73421 ?auto_73426 ) ) ( not ( = ?auto_73422 ?auto_73423 ) ) ( not ( = ?auto_73422 ?auto_73424 ) ) ( not ( = ?auto_73422 ?auto_73425 ) ) ( not ( = ?auto_73422 ?auto_73426 ) ) ( not ( = ?auto_73423 ?auto_73424 ) ) ( not ( = ?auto_73423 ?auto_73425 ) ) ( not ( = ?auto_73423 ?auto_73426 ) ) ( not ( = ?auto_73424 ?auto_73425 ) ) ( not ( = ?auto_73424 ?auto_73426 ) ) ( not ( = ?auto_73425 ?auto_73426 ) ) ( ON ?auto_73425 ?auto_73426 ) ( ON ?auto_73424 ?auto_73425 ) ( ON ?auto_73423 ?auto_73424 ) ( ON ?auto_73422 ?auto_73423 ) ( ON ?auto_73421 ?auto_73422 ) ( CLEAR ?auto_73419 ) ( ON ?auto_73420 ?auto_73421 ) ( CLEAR ?auto_73420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73418 ?auto_73419 ?auto_73420 )
      ( MAKE-9PILE ?auto_73418 ?auto_73419 ?auto_73420 ?auto_73421 ?auto_73422 ?auto_73423 ?auto_73424 ?auto_73425 ?auto_73426 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73436 - BLOCK
      ?auto_73437 - BLOCK
      ?auto_73438 - BLOCK
      ?auto_73439 - BLOCK
      ?auto_73440 - BLOCK
      ?auto_73441 - BLOCK
      ?auto_73442 - BLOCK
      ?auto_73443 - BLOCK
      ?auto_73444 - BLOCK
    )
    :vars
    (
      ?auto_73445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73444 ?auto_73445 ) ( ON-TABLE ?auto_73436 ) ( not ( = ?auto_73436 ?auto_73437 ) ) ( not ( = ?auto_73436 ?auto_73438 ) ) ( not ( = ?auto_73436 ?auto_73439 ) ) ( not ( = ?auto_73436 ?auto_73440 ) ) ( not ( = ?auto_73436 ?auto_73441 ) ) ( not ( = ?auto_73436 ?auto_73442 ) ) ( not ( = ?auto_73436 ?auto_73443 ) ) ( not ( = ?auto_73436 ?auto_73444 ) ) ( not ( = ?auto_73436 ?auto_73445 ) ) ( not ( = ?auto_73437 ?auto_73438 ) ) ( not ( = ?auto_73437 ?auto_73439 ) ) ( not ( = ?auto_73437 ?auto_73440 ) ) ( not ( = ?auto_73437 ?auto_73441 ) ) ( not ( = ?auto_73437 ?auto_73442 ) ) ( not ( = ?auto_73437 ?auto_73443 ) ) ( not ( = ?auto_73437 ?auto_73444 ) ) ( not ( = ?auto_73437 ?auto_73445 ) ) ( not ( = ?auto_73438 ?auto_73439 ) ) ( not ( = ?auto_73438 ?auto_73440 ) ) ( not ( = ?auto_73438 ?auto_73441 ) ) ( not ( = ?auto_73438 ?auto_73442 ) ) ( not ( = ?auto_73438 ?auto_73443 ) ) ( not ( = ?auto_73438 ?auto_73444 ) ) ( not ( = ?auto_73438 ?auto_73445 ) ) ( not ( = ?auto_73439 ?auto_73440 ) ) ( not ( = ?auto_73439 ?auto_73441 ) ) ( not ( = ?auto_73439 ?auto_73442 ) ) ( not ( = ?auto_73439 ?auto_73443 ) ) ( not ( = ?auto_73439 ?auto_73444 ) ) ( not ( = ?auto_73439 ?auto_73445 ) ) ( not ( = ?auto_73440 ?auto_73441 ) ) ( not ( = ?auto_73440 ?auto_73442 ) ) ( not ( = ?auto_73440 ?auto_73443 ) ) ( not ( = ?auto_73440 ?auto_73444 ) ) ( not ( = ?auto_73440 ?auto_73445 ) ) ( not ( = ?auto_73441 ?auto_73442 ) ) ( not ( = ?auto_73441 ?auto_73443 ) ) ( not ( = ?auto_73441 ?auto_73444 ) ) ( not ( = ?auto_73441 ?auto_73445 ) ) ( not ( = ?auto_73442 ?auto_73443 ) ) ( not ( = ?auto_73442 ?auto_73444 ) ) ( not ( = ?auto_73442 ?auto_73445 ) ) ( not ( = ?auto_73443 ?auto_73444 ) ) ( not ( = ?auto_73443 ?auto_73445 ) ) ( not ( = ?auto_73444 ?auto_73445 ) ) ( ON ?auto_73443 ?auto_73444 ) ( ON ?auto_73442 ?auto_73443 ) ( ON ?auto_73441 ?auto_73442 ) ( ON ?auto_73440 ?auto_73441 ) ( ON ?auto_73439 ?auto_73440 ) ( ON ?auto_73438 ?auto_73439 ) ( CLEAR ?auto_73436 ) ( ON ?auto_73437 ?auto_73438 ) ( CLEAR ?auto_73437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73436 ?auto_73437 )
      ( MAKE-9PILE ?auto_73436 ?auto_73437 ?auto_73438 ?auto_73439 ?auto_73440 ?auto_73441 ?auto_73442 ?auto_73443 ?auto_73444 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73455 - BLOCK
      ?auto_73456 - BLOCK
      ?auto_73457 - BLOCK
      ?auto_73458 - BLOCK
      ?auto_73459 - BLOCK
      ?auto_73460 - BLOCK
      ?auto_73461 - BLOCK
      ?auto_73462 - BLOCK
      ?auto_73463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73463 ) ( ON-TABLE ?auto_73455 ) ( not ( = ?auto_73455 ?auto_73456 ) ) ( not ( = ?auto_73455 ?auto_73457 ) ) ( not ( = ?auto_73455 ?auto_73458 ) ) ( not ( = ?auto_73455 ?auto_73459 ) ) ( not ( = ?auto_73455 ?auto_73460 ) ) ( not ( = ?auto_73455 ?auto_73461 ) ) ( not ( = ?auto_73455 ?auto_73462 ) ) ( not ( = ?auto_73455 ?auto_73463 ) ) ( not ( = ?auto_73456 ?auto_73457 ) ) ( not ( = ?auto_73456 ?auto_73458 ) ) ( not ( = ?auto_73456 ?auto_73459 ) ) ( not ( = ?auto_73456 ?auto_73460 ) ) ( not ( = ?auto_73456 ?auto_73461 ) ) ( not ( = ?auto_73456 ?auto_73462 ) ) ( not ( = ?auto_73456 ?auto_73463 ) ) ( not ( = ?auto_73457 ?auto_73458 ) ) ( not ( = ?auto_73457 ?auto_73459 ) ) ( not ( = ?auto_73457 ?auto_73460 ) ) ( not ( = ?auto_73457 ?auto_73461 ) ) ( not ( = ?auto_73457 ?auto_73462 ) ) ( not ( = ?auto_73457 ?auto_73463 ) ) ( not ( = ?auto_73458 ?auto_73459 ) ) ( not ( = ?auto_73458 ?auto_73460 ) ) ( not ( = ?auto_73458 ?auto_73461 ) ) ( not ( = ?auto_73458 ?auto_73462 ) ) ( not ( = ?auto_73458 ?auto_73463 ) ) ( not ( = ?auto_73459 ?auto_73460 ) ) ( not ( = ?auto_73459 ?auto_73461 ) ) ( not ( = ?auto_73459 ?auto_73462 ) ) ( not ( = ?auto_73459 ?auto_73463 ) ) ( not ( = ?auto_73460 ?auto_73461 ) ) ( not ( = ?auto_73460 ?auto_73462 ) ) ( not ( = ?auto_73460 ?auto_73463 ) ) ( not ( = ?auto_73461 ?auto_73462 ) ) ( not ( = ?auto_73461 ?auto_73463 ) ) ( not ( = ?auto_73462 ?auto_73463 ) ) ( ON ?auto_73462 ?auto_73463 ) ( ON ?auto_73461 ?auto_73462 ) ( ON ?auto_73460 ?auto_73461 ) ( ON ?auto_73459 ?auto_73460 ) ( ON ?auto_73458 ?auto_73459 ) ( ON ?auto_73457 ?auto_73458 ) ( CLEAR ?auto_73455 ) ( ON ?auto_73456 ?auto_73457 ) ( CLEAR ?auto_73456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73455 ?auto_73456 )
      ( MAKE-9PILE ?auto_73455 ?auto_73456 ?auto_73457 ?auto_73458 ?auto_73459 ?auto_73460 ?auto_73461 ?auto_73462 ?auto_73463 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73473 - BLOCK
      ?auto_73474 - BLOCK
      ?auto_73475 - BLOCK
      ?auto_73476 - BLOCK
      ?auto_73477 - BLOCK
      ?auto_73478 - BLOCK
      ?auto_73479 - BLOCK
      ?auto_73480 - BLOCK
      ?auto_73481 - BLOCK
    )
    :vars
    (
      ?auto_73482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73481 ?auto_73482 ) ( not ( = ?auto_73473 ?auto_73474 ) ) ( not ( = ?auto_73473 ?auto_73475 ) ) ( not ( = ?auto_73473 ?auto_73476 ) ) ( not ( = ?auto_73473 ?auto_73477 ) ) ( not ( = ?auto_73473 ?auto_73478 ) ) ( not ( = ?auto_73473 ?auto_73479 ) ) ( not ( = ?auto_73473 ?auto_73480 ) ) ( not ( = ?auto_73473 ?auto_73481 ) ) ( not ( = ?auto_73473 ?auto_73482 ) ) ( not ( = ?auto_73474 ?auto_73475 ) ) ( not ( = ?auto_73474 ?auto_73476 ) ) ( not ( = ?auto_73474 ?auto_73477 ) ) ( not ( = ?auto_73474 ?auto_73478 ) ) ( not ( = ?auto_73474 ?auto_73479 ) ) ( not ( = ?auto_73474 ?auto_73480 ) ) ( not ( = ?auto_73474 ?auto_73481 ) ) ( not ( = ?auto_73474 ?auto_73482 ) ) ( not ( = ?auto_73475 ?auto_73476 ) ) ( not ( = ?auto_73475 ?auto_73477 ) ) ( not ( = ?auto_73475 ?auto_73478 ) ) ( not ( = ?auto_73475 ?auto_73479 ) ) ( not ( = ?auto_73475 ?auto_73480 ) ) ( not ( = ?auto_73475 ?auto_73481 ) ) ( not ( = ?auto_73475 ?auto_73482 ) ) ( not ( = ?auto_73476 ?auto_73477 ) ) ( not ( = ?auto_73476 ?auto_73478 ) ) ( not ( = ?auto_73476 ?auto_73479 ) ) ( not ( = ?auto_73476 ?auto_73480 ) ) ( not ( = ?auto_73476 ?auto_73481 ) ) ( not ( = ?auto_73476 ?auto_73482 ) ) ( not ( = ?auto_73477 ?auto_73478 ) ) ( not ( = ?auto_73477 ?auto_73479 ) ) ( not ( = ?auto_73477 ?auto_73480 ) ) ( not ( = ?auto_73477 ?auto_73481 ) ) ( not ( = ?auto_73477 ?auto_73482 ) ) ( not ( = ?auto_73478 ?auto_73479 ) ) ( not ( = ?auto_73478 ?auto_73480 ) ) ( not ( = ?auto_73478 ?auto_73481 ) ) ( not ( = ?auto_73478 ?auto_73482 ) ) ( not ( = ?auto_73479 ?auto_73480 ) ) ( not ( = ?auto_73479 ?auto_73481 ) ) ( not ( = ?auto_73479 ?auto_73482 ) ) ( not ( = ?auto_73480 ?auto_73481 ) ) ( not ( = ?auto_73480 ?auto_73482 ) ) ( not ( = ?auto_73481 ?auto_73482 ) ) ( ON ?auto_73480 ?auto_73481 ) ( ON ?auto_73479 ?auto_73480 ) ( ON ?auto_73478 ?auto_73479 ) ( ON ?auto_73477 ?auto_73478 ) ( ON ?auto_73476 ?auto_73477 ) ( ON ?auto_73475 ?auto_73476 ) ( ON ?auto_73474 ?auto_73475 ) ( ON ?auto_73473 ?auto_73474 ) ( CLEAR ?auto_73473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73473 )
      ( MAKE-9PILE ?auto_73473 ?auto_73474 ?auto_73475 ?auto_73476 ?auto_73477 ?auto_73478 ?auto_73479 ?auto_73480 ?auto_73481 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73492 - BLOCK
      ?auto_73493 - BLOCK
      ?auto_73494 - BLOCK
      ?auto_73495 - BLOCK
      ?auto_73496 - BLOCK
      ?auto_73497 - BLOCK
      ?auto_73498 - BLOCK
      ?auto_73499 - BLOCK
      ?auto_73500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73500 ) ( not ( = ?auto_73492 ?auto_73493 ) ) ( not ( = ?auto_73492 ?auto_73494 ) ) ( not ( = ?auto_73492 ?auto_73495 ) ) ( not ( = ?auto_73492 ?auto_73496 ) ) ( not ( = ?auto_73492 ?auto_73497 ) ) ( not ( = ?auto_73492 ?auto_73498 ) ) ( not ( = ?auto_73492 ?auto_73499 ) ) ( not ( = ?auto_73492 ?auto_73500 ) ) ( not ( = ?auto_73493 ?auto_73494 ) ) ( not ( = ?auto_73493 ?auto_73495 ) ) ( not ( = ?auto_73493 ?auto_73496 ) ) ( not ( = ?auto_73493 ?auto_73497 ) ) ( not ( = ?auto_73493 ?auto_73498 ) ) ( not ( = ?auto_73493 ?auto_73499 ) ) ( not ( = ?auto_73493 ?auto_73500 ) ) ( not ( = ?auto_73494 ?auto_73495 ) ) ( not ( = ?auto_73494 ?auto_73496 ) ) ( not ( = ?auto_73494 ?auto_73497 ) ) ( not ( = ?auto_73494 ?auto_73498 ) ) ( not ( = ?auto_73494 ?auto_73499 ) ) ( not ( = ?auto_73494 ?auto_73500 ) ) ( not ( = ?auto_73495 ?auto_73496 ) ) ( not ( = ?auto_73495 ?auto_73497 ) ) ( not ( = ?auto_73495 ?auto_73498 ) ) ( not ( = ?auto_73495 ?auto_73499 ) ) ( not ( = ?auto_73495 ?auto_73500 ) ) ( not ( = ?auto_73496 ?auto_73497 ) ) ( not ( = ?auto_73496 ?auto_73498 ) ) ( not ( = ?auto_73496 ?auto_73499 ) ) ( not ( = ?auto_73496 ?auto_73500 ) ) ( not ( = ?auto_73497 ?auto_73498 ) ) ( not ( = ?auto_73497 ?auto_73499 ) ) ( not ( = ?auto_73497 ?auto_73500 ) ) ( not ( = ?auto_73498 ?auto_73499 ) ) ( not ( = ?auto_73498 ?auto_73500 ) ) ( not ( = ?auto_73499 ?auto_73500 ) ) ( ON ?auto_73499 ?auto_73500 ) ( ON ?auto_73498 ?auto_73499 ) ( ON ?auto_73497 ?auto_73498 ) ( ON ?auto_73496 ?auto_73497 ) ( ON ?auto_73495 ?auto_73496 ) ( ON ?auto_73494 ?auto_73495 ) ( ON ?auto_73493 ?auto_73494 ) ( ON ?auto_73492 ?auto_73493 ) ( CLEAR ?auto_73492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73492 )
      ( MAKE-9PILE ?auto_73492 ?auto_73493 ?auto_73494 ?auto_73495 ?auto_73496 ?auto_73497 ?auto_73498 ?auto_73499 ?auto_73500 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_73510 - BLOCK
      ?auto_73511 - BLOCK
      ?auto_73512 - BLOCK
      ?auto_73513 - BLOCK
      ?auto_73514 - BLOCK
      ?auto_73515 - BLOCK
      ?auto_73516 - BLOCK
      ?auto_73517 - BLOCK
      ?auto_73518 - BLOCK
    )
    :vars
    (
      ?auto_73519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73510 ?auto_73511 ) ) ( not ( = ?auto_73510 ?auto_73512 ) ) ( not ( = ?auto_73510 ?auto_73513 ) ) ( not ( = ?auto_73510 ?auto_73514 ) ) ( not ( = ?auto_73510 ?auto_73515 ) ) ( not ( = ?auto_73510 ?auto_73516 ) ) ( not ( = ?auto_73510 ?auto_73517 ) ) ( not ( = ?auto_73510 ?auto_73518 ) ) ( not ( = ?auto_73511 ?auto_73512 ) ) ( not ( = ?auto_73511 ?auto_73513 ) ) ( not ( = ?auto_73511 ?auto_73514 ) ) ( not ( = ?auto_73511 ?auto_73515 ) ) ( not ( = ?auto_73511 ?auto_73516 ) ) ( not ( = ?auto_73511 ?auto_73517 ) ) ( not ( = ?auto_73511 ?auto_73518 ) ) ( not ( = ?auto_73512 ?auto_73513 ) ) ( not ( = ?auto_73512 ?auto_73514 ) ) ( not ( = ?auto_73512 ?auto_73515 ) ) ( not ( = ?auto_73512 ?auto_73516 ) ) ( not ( = ?auto_73512 ?auto_73517 ) ) ( not ( = ?auto_73512 ?auto_73518 ) ) ( not ( = ?auto_73513 ?auto_73514 ) ) ( not ( = ?auto_73513 ?auto_73515 ) ) ( not ( = ?auto_73513 ?auto_73516 ) ) ( not ( = ?auto_73513 ?auto_73517 ) ) ( not ( = ?auto_73513 ?auto_73518 ) ) ( not ( = ?auto_73514 ?auto_73515 ) ) ( not ( = ?auto_73514 ?auto_73516 ) ) ( not ( = ?auto_73514 ?auto_73517 ) ) ( not ( = ?auto_73514 ?auto_73518 ) ) ( not ( = ?auto_73515 ?auto_73516 ) ) ( not ( = ?auto_73515 ?auto_73517 ) ) ( not ( = ?auto_73515 ?auto_73518 ) ) ( not ( = ?auto_73516 ?auto_73517 ) ) ( not ( = ?auto_73516 ?auto_73518 ) ) ( not ( = ?auto_73517 ?auto_73518 ) ) ( ON ?auto_73510 ?auto_73519 ) ( not ( = ?auto_73518 ?auto_73519 ) ) ( not ( = ?auto_73517 ?auto_73519 ) ) ( not ( = ?auto_73516 ?auto_73519 ) ) ( not ( = ?auto_73515 ?auto_73519 ) ) ( not ( = ?auto_73514 ?auto_73519 ) ) ( not ( = ?auto_73513 ?auto_73519 ) ) ( not ( = ?auto_73512 ?auto_73519 ) ) ( not ( = ?auto_73511 ?auto_73519 ) ) ( not ( = ?auto_73510 ?auto_73519 ) ) ( ON ?auto_73511 ?auto_73510 ) ( ON ?auto_73512 ?auto_73511 ) ( ON ?auto_73513 ?auto_73512 ) ( ON ?auto_73514 ?auto_73513 ) ( ON ?auto_73515 ?auto_73514 ) ( ON ?auto_73516 ?auto_73515 ) ( ON ?auto_73517 ?auto_73516 ) ( ON ?auto_73518 ?auto_73517 ) ( CLEAR ?auto_73518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_73518 ?auto_73517 ?auto_73516 ?auto_73515 ?auto_73514 ?auto_73513 ?auto_73512 ?auto_73511 ?auto_73510 )
      ( MAKE-9PILE ?auto_73510 ?auto_73511 ?auto_73512 ?auto_73513 ?auto_73514 ?auto_73515 ?auto_73516 ?auto_73517 ?auto_73518 ) )
  )

)

