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
      ?auto_11280 - BLOCK
    )
    :vars
    (
      ?auto_11281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11280 ?auto_11281 ) ( CLEAR ?auto_11280 ) ( HAND-EMPTY ) ( not ( = ?auto_11280 ?auto_11281 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11280 ?auto_11281 )
      ( !PUTDOWN ?auto_11280 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_11283 - BLOCK
    )
    :vars
    (
      ?auto_11284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11283 ?auto_11284 ) ( CLEAR ?auto_11283 ) ( HAND-EMPTY ) ( not ( = ?auto_11283 ?auto_11284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11283 ?auto_11284 )
      ( !PUTDOWN ?auto_11283 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11287 - BLOCK
      ?auto_11288 - BLOCK
    )
    :vars
    (
      ?auto_11289 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11287 ) ( ON ?auto_11288 ?auto_11289 ) ( CLEAR ?auto_11288 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11287 ) ( not ( = ?auto_11287 ?auto_11288 ) ) ( not ( = ?auto_11287 ?auto_11289 ) ) ( not ( = ?auto_11288 ?auto_11289 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11288 ?auto_11289 )
      ( !STACK ?auto_11288 ?auto_11287 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11292 - BLOCK
      ?auto_11293 - BLOCK
    )
    :vars
    (
      ?auto_11294 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11292 ) ( ON ?auto_11293 ?auto_11294 ) ( CLEAR ?auto_11293 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11292 ) ( not ( = ?auto_11292 ?auto_11293 ) ) ( not ( = ?auto_11292 ?auto_11294 ) ) ( not ( = ?auto_11293 ?auto_11294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11293 ?auto_11294 )
      ( !STACK ?auto_11293 ?auto_11292 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11297 - BLOCK
      ?auto_11298 - BLOCK
    )
    :vars
    (
      ?auto_11299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11298 ?auto_11299 ) ( not ( = ?auto_11297 ?auto_11298 ) ) ( not ( = ?auto_11297 ?auto_11299 ) ) ( not ( = ?auto_11298 ?auto_11299 ) ) ( ON ?auto_11297 ?auto_11298 ) ( CLEAR ?auto_11297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11297 )
      ( MAKE-2PILE ?auto_11297 ?auto_11298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_11302 - BLOCK
      ?auto_11303 - BLOCK
    )
    :vars
    (
      ?auto_11304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11303 ?auto_11304 ) ( not ( = ?auto_11302 ?auto_11303 ) ) ( not ( = ?auto_11302 ?auto_11304 ) ) ( not ( = ?auto_11303 ?auto_11304 ) ) ( ON ?auto_11302 ?auto_11303 ) ( CLEAR ?auto_11302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11302 )
      ( MAKE-2PILE ?auto_11302 ?auto_11303 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11308 - BLOCK
      ?auto_11309 - BLOCK
      ?auto_11310 - BLOCK
    )
    :vars
    (
      ?auto_11311 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11309 ) ( ON ?auto_11310 ?auto_11311 ) ( CLEAR ?auto_11310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11308 ) ( ON ?auto_11309 ?auto_11308 ) ( not ( = ?auto_11308 ?auto_11309 ) ) ( not ( = ?auto_11308 ?auto_11310 ) ) ( not ( = ?auto_11308 ?auto_11311 ) ) ( not ( = ?auto_11309 ?auto_11310 ) ) ( not ( = ?auto_11309 ?auto_11311 ) ) ( not ( = ?auto_11310 ?auto_11311 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11310 ?auto_11311 )
      ( !STACK ?auto_11310 ?auto_11309 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11315 - BLOCK
      ?auto_11316 - BLOCK
      ?auto_11317 - BLOCK
    )
    :vars
    (
      ?auto_11318 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11316 ) ( ON ?auto_11317 ?auto_11318 ) ( CLEAR ?auto_11317 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11315 ) ( ON ?auto_11316 ?auto_11315 ) ( not ( = ?auto_11315 ?auto_11316 ) ) ( not ( = ?auto_11315 ?auto_11317 ) ) ( not ( = ?auto_11315 ?auto_11318 ) ) ( not ( = ?auto_11316 ?auto_11317 ) ) ( not ( = ?auto_11316 ?auto_11318 ) ) ( not ( = ?auto_11317 ?auto_11318 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11317 ?auto_11318 )
      ( !STACK ?auto_11317 ?auto_11316 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11322 - BLOCK
      ?auto_11323 - BLOCK
      ?auto_11324 - BLOCK
    )
    :vars
    (
      ?auto_11325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11324 ?auto_11325 ) ( ON-TABLE ?auto_11322 ) ( not ( = ?auto_11322 ?auto_11323 ) ) ( not ( = ?auto_11322 ?auto_11324 ) ) ( not ( = ?auto_11322 ?auto_11325 ) ) ( not ( = ?auto_11323 ?auto_11324 ) ) ( not ( = ?auto_11323 ?auto_11325 ) ) ( not ( = ?auto_11324 ?auto_11325 ) ) ( CLEAR ?auto_11322 ) ( ON ?auto_11323 ?auto_11324 ) ( CLEAR ?auto_11323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11322 ?auto_11323 )
      ( MAKE-3PILE ?auto_11322 ?auto_11323 ?auto_11324 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11329 - BLOCK
      ?auto_11330 - BLOCK
      ?auto_11331 - BLOCK
    )
    :vars
    (
      ?auto_11332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11331 ?auto_11332 ) ( ON-TABLE ?auto_11329 ) ( not ( = ?auto_11329 ?auto_11330 ) ) ( not ( = ?auto_11329 ?auto_11331 ) ) ( not ( = ?auto_11329 ?auto_11332 ) ) ( not ( = ?auto_11330 ?auto_11331 ) ) ( not ( = ?auto_11330 ?auto_11332 ) ) ( not ( = ?auto_11331 ?auto_11332 ) ) ( CLEAR ?auto_11329 ) ( ON ?auto_11330 ?auto_11331 ) ( CLEAR ?auto_11330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11329 ?auto_11330 )
      ( MAKE-3PILE ?auto_11329 ?auto_11330 ?auto_11331 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11336 - BLOCK
      ?auto_11337 - BLOCK
      ?auto_11338 - BLOCK
    )
    :vars
    (
      ?auto_11339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11338 ?auto_11339 ) ( not ( = ?auto_11336 ?auto_11337 ) ) ( not ( = ?auto_11336 ?auto_11338 ) ) ( not ( = ?auto_11336 ?auto_11339 ) ) ( not ( = ?auto_11337 ?auto_11338 ) ) ( not ( = ?auto_11337 ?auto_11339 ) ) ( not ( = ?auto_11338 ?auto_11339 ) ) ( ON ?auto_11337 ?auto_11338 ) ( ON ?auto_11336 ?auto_11337 ) ( CLEAR ?auto_11336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11336 )
      ( MAKE-3PILE ?auto_11336 ?auto_11337 ?auto_11338 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_11343 - BLOCK
      ?auto_11344 - BLOCK
      ?auto_11345 - BLOCK
    )
    :vars
    (
      ?auto_11346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11345 ?auto_11346 ) ( not ( = ?auto_11343 ?auto_11344 ) ) ( not ( = ?auto_11343 ?auto_11345 ) ) ( not ( = ?auto_11343 ?auto_11346 ) ) ( not ( = ?auto_11344 ?auto_11345 ) ) ( not ( = ?auto_11344 ?auto_11346 ) ) ( not ( = ?auto_11345 ?auto_11346 ) ) ( ON ?auto_11344 ?auto_11345 ) ( ON ?auto_11343 ?auto_11344 ) ( CLEAR ?auto_11343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11343 )
      ( MAKE-3PILE ?auto_11343 ?auto_11344 ?auto_11345 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11351 - BLOCK
      ?auto_11352 - BLOCK
      ?auto_11353 - BLOCK
      ?auto_11354 - BLOCK
    )
    :vars
    (
      ?auto_11355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11353 ) ( ON ?auto_11354 ?auto_11355 ) ( CLEAR ?auto_11354 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11351 ) ( ON ?auto_11352 ?auto_11351 ) ( ON ?auto_11353 ?auto_11352 ) ( not ( = ?auto_11351 ?auto_11352 ) ) ( not ( = ?auto_11351 ?auto_11353 ) ) ( not ( = ?auto_11351 ?auto_11354 ) ) ( not ( = ?auto_11351 ?auto_11355 ) ) ( not ( = ?auto_11352 ?auto_11353 ) ) ( not ( = ?auto_11352 ?auto_11354 ) ) ( not ( = ?auto_11352 ?auto_11355 ) ) ( not ( = ?auto_11353 ?auto_11354 ) ) ( not ( = ?auto_11353 ?auto_11355 ) ) ( not ( = ?auto_11354 ?auto_11355 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11354 ?auto_11355 )
      ( !STACK ?auto_11354 ?auto_11353 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11360 - BLOCK
      ?auto_11361 - BLOCK
      ?auto_11362 - BLOCK
      ?auto_11363 - BLOCK
    )
    :vars
    (
      ?auto_11364 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11362 ) ( ON ?auto_11363 ?auto_11364 ) ( CLEAR ?auto_11363 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11360 ) ( ON ?auto_11361 ?auto_11360 ) ( ON ?auto_11362 ?auto_11361 ) ( not ( = ?auto_11360 ?auto_11361 ) ) ( not ( = ?auto_11360 ?auto_11362 ) ) ( not ( = ?auto_11360 ?auto_11363 ) ) ( not ( = ?auto_11360 ?auto_11364 ) ) ( not ( = ?auto_11361 ?auto_11362 ) ) ( not ( = ?auto_11361 ?auto_11363 ) ) ( not ( = ?auto_11361 ?auto_11364 ) ) ( not ( = ?auto_11362 ?auto_11363 ) ) ( not ( = ?auto_11362 ?auto_11364 ) ) ( not ( = ?auto_11363 ?auto_11364 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11363 ?auto_11364 )
      ( !STACK ?auto_11363 ?auto_11362 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11369 - BLOCK
      ?auto_11370 - BLOCK
      ?auto_11371 - BLOCK
      ?auto_11372 - BLOCK
    )
    :vars
    (
      ?auto_11373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11372 ?auto_11373 ) ( ON-TABLE ?auto_11369 ) ( ON ?auto_11370 ?auto_11369 ) ( not ( = ?auto_11369 ?auto_11370 ) ) ( not ( = ?auto_11369 ?auto_11371 ) ) ( not ( = ?auto_11369 ?auto_11372 ) ) ( not ( = ?auto_11369 ?auto_11373 ) ) ( not ( = ?auto_11370 ?auto_11371 ) ) ( not ( = ?auto_11370 ?auto_11372 ) ) ( not ( = ?auto_11370 ?auto_11373 ) ) ( not ( = ?auto_11371 ?auto_11372 ) ) ( not ( = ?auto_11371 ?auto_11373 ) ) ( not ( = ?auto_11372 ?auto_11373 ) ) ( CLEAR ?auto_11370 ) ( ON ?auto_11371 ?auto_11372 ) ( CLEAR ?auto_11371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11369 ?auto_11370 ?auto_11371 )
      ( MAKE-4PILE ?auto_11369 ?auto_11370 ?auto_11371 ?auto_11372 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11378 - BLOCK
      ?auto_11379 - BLOCK
      ?auto_11380 - BLOCK
      ?auto_11381 - BLOCK
    )
    :vars
    (
      ?auto_11382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11381 ?auto_11382 ) ( ON-TABLE ?auto_11378 ) ( ON ?auto_11379 ?auto_11378 ) ( not ( = ?auto_11378 ?auto_11379 ) ) ( not ( = ?auto_11378 ?auto_11380 ) ) ( not ( = ?auto_11378 ?auto_11381 ) ) ( not ( = ?auto_11378 ?auto_11382 ) ) ( not ( = ?auto_11379 ?auto_11380 ) ) ( not ( = ?auto_11379 ?auto_11381 ) ) ( not ( = ?auto_11379 ?auto_11382 ) ) ( not ( = ?auto_11380 ?auto_11381 ) ) ( not ( = ?auto_11380 ?auto_11382 ) ) ( not ( = ?auto_11381 ?auto_11382 ) ) ( CLEAR ?auto_11379 ) ( ON ?auto_11380 ?auto_11381 ) ( CLEAR ?auto_11380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11378 ?auto_11379 ?auto_11380 )
      ( MAKE-4PILE ?auto_11378 ?auto_11379 ?auto_11380 ?auto_11381 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11387 - BLOCK
      ?auto_11388 - BLOCK
      ?auto_11389 - BLOCK
      ?auto_11390 - BLOCK
    )
    :vars
    (
      ?auto_11391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11390 ?auto_11391 ) ( ON-TABLE ?auto_11387 ) ( not ( = ?auto_11387 ?auto_11388 ) ) ( not ( = ?auto_11387 ?auto_11389 ) ) ( not ( = ?auto_11387 ?auto_11390 ) ) ( not ( = ?auto_11387 ?auto_11391 ) ) ( not ( = ?auto_11388 ?auto_11389 ) ) ( not ( = ?auto_11388 ?auto_11390 ) ) ( not ( = ?auto_11388 ?auto_11391 ) ) ( not ( = ?auto_11389 ?auto_11390 ) ) ( not ( = ?auto_11389 ?auto_11391 ) ) ( not ( = ?auto_11390 ?auto_11391 ) ) ( ON ?auto_11389 ?auto_11390 ) ( CLEAR ?auto_11387 ) ( ON ?auto_11388 ?auto_11389 ) ( CLEAR ?auto_11388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11387 ?auto_11388 )
      ( MAKE-4PILE ?auto_11387 ?auto_11388 ?auto_11389 ?auto_11390 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11396 - BLOCK
      ?auto_11397 - BLOCK
      ?auto_11398 - BLOCK
      ?auto_11399 - BLOCK
    )
    :vars
    (
      ?auto_11400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11399 ?auto_11400 ) ( ON-TABLE ?auto_11396 ) ( not ( = ?auto_11396 ?auto_11397 ) ) ( not ( = ?auto_11396 ?auto_11398 ) ) ( not ( = ?auto_11396 ?auto_11399 ) ) ( not ( = ?auto_11396 ?auto_11400 ) ) ( not ( = ?auto_11397 ?auto_11398 ) ) ( not ( = ?auto_11397 ?auto_11399 ) ) ( not ( = ?auto_11397 ?auto_11400 ) ) ( not ( = ?auto_11398 ?auto_11399 ) ) ( not ( = ?auto_11398 ?auto_11400 ) ) ( not ( = ?auto_11399 ?auto_11400 ) ) ( ON ?auto_11398 ?auto_11399 ) ( CLEAR ?auto_11396 ) ( ON ?auto_11397 ?auto_11398 ) ( CLEAR ?auto_11397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11396 ?auto_11397 )
      ( MAKE-4PILE ?auto_11396 ?auto_11397 ?auto_11398 ?auto_11399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11405 - BLOCK
      ?auto_11406 - BLOCK
      ?auto_11407 - BLOCK
      ?auto_11408 - BLOCK
    )
    :vars
    (
      ?auto_11409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11408 ?auto_11409 ) ( not ( = ?auto_11405 ?auto_11406 ) ) ( not ( = ?auto_11405 ?auto_11407 ) ) ( not ( = ?auto_11405 ?auto_11408 ) ) ( not ( = ?auto_11405 ?auto_11409 ) ) ( not ( = ?auto_11406 ?auto_11407 ) ) ( not ( = ?auto_11406 ?auto_11408 ) ) ( not ( = ?auto_11406 ?auto_11409 ) ) ( not ( = ?auto_11407 ?auto_11408 ) ) ( not ( = ?auto_11407 ?auto_11409 ) ) ( not ( = ?auto_11408 ?auto_11409 ) ) ( ON ?auto_11407 ?auto_11408 ) ( ON ?auto_11406 ?auto_11407 ) ( ON ?auto_11405 ?auto_11406 ) ( CLEAR ?auto_11405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11405 )
      ( MAKE-4PILE ?auto_11405 ?auto_11406 ?auto_11407 ?auto_11408 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_11414 - BLOCK
      ?auto_11415 - BLOCK
      ?auto_11416 - BLOCK
      ?auto_11417 - BLOCK
    )
    :vars
    (
      ?auto_11418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11417 ?auto_11418 ) ( not ( = ?auto_11414 ?auto_11415 ) ) ( not ( = ?auto_11414 ?auto_11416 ) ) ( not ( = ?auto_11414 ?auto_11417 ) ) ( not ( = ?auto_11414 ?auto_11418 ) ) ( not ( = ?auto_11415 ?auto_11416 ) ) ( not ( = ?auto_11415 ?auto_11417 ) ) ( not ( = ?auto_11415 ?auto_11418 ) ) ( not ( = ?auto_11416 ?auto_11417 ) ) ( not ( = ?auto_11416 ?auto_11418 ) ) ( not ( = ?auto_11417 ?auto_11418 ) ) ( ON ?auto_11416 ?auto_11417 ) ( ON ?auto_11415 ?auto_11416 ) ( ON ?auto_11414 ?auto_11415 ) ( CLEAR ?auto_11414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11414 )
      ( MAKE-4PILE ?auto_11414 ?auto_11415 ?auto_11416 ?auto_11417 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11424 - BLOCK
      ?auto_11425 - BLOCK
      ?auto_11426 - BLOCK
      ?auto_11427 - BLOCK
      ?auto_11428 - BLOCK
    )
    :vars
    (
      ?auto_11429 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11427 ) ( ON ?auto_11428 ?auto_11429 ) ( CLEAR ?auto_11428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11424 ) ( ON ?auto_11425 ?auto_11424 ) ( ON ?auto_11426 ?auto_11425 ) ( ON ?auto_11427 ?auto_11426 ) ( not ( = ?auto_11424 ?auto_11425 ) ) ( not ( = ?auto_11424 ?auto_11426 ) ) ( not ( = ?auto_11424 ?auto_11427 ) ) ( not ( = ?auto_11424 ?auto_11428 ) ) ( not ( = ?auto_11424 ?auto_11429 ) ) ( not ( = ?auto_11425 ?auto_11426 ) ) ( not ( = ?auto_11425 ?auto_11427 ) ) ( not ( = ?auto_11425 ?auto_11428 ) ) ( not ( = ?auto_11425 ?auto_11429 ) ) ( not ( = ?auto_11426 ?auto_11427 ) ) ( not ( = ?auto_11426 ?auto_11428 ) ) ( not ( = ?auto_11426 ?auto_11429 ) ) ( not ( = ?auto_11427 ?auto_11428 ) ) ( not ( = ?auto_11427 ?auto_11429 ) ) ( not ( = ?auto_11428 ?auto_11429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11428 ?auto_11429 )
      ( !STACK ?auto_11428 ?auto_11427 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11435 - BLOCK
      ?auto_11436 - BLOCK
      ?auto_11437 - BLOCK
      ?auto_11438 - BLOCK
      ?auto_11439 - BLOCK
    )
    :vars
    (
      ?auto_11440 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11438 ) ( ON ?auto_11439 ?auto_11440 ) ( CLEAR ?auto_11439 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11435 ) ( ON ?auto_11436 ?auto_11435 ) ( ON ?auto_11437 ?auto_11436 ) ( ON ?auto_11438 ?auto_11437 ) ( not ( = ?auto_11435 ?auto_11436 ) ) ( not ( = ?auto_11435 ?auto_11437 ) ) ( not ( = ?auto_11435 ?auto_11438 ) ) ( not ( = ?auto_11435 ?auto_11439 ) ) ( not ( = ?auto_11435 ?auto_11440 ) ) ( not ( = ?auto_11436 ?auto_11437 ) ) ( not ( = ?auto_11436 ?auto_11438 ) ) ( not ( = ?auto_11436 ?auto_11439 ) ) ( not ( = ?auto_11436 ?auto_11440 ) ) ( not ( = ?auto_11437 ?auto_11438 ) ) ( not ( = ?auto_11437 ?auto_11439 ) ) ( not ( = ?auto_11437 ?auto_11440 ) ) ( not ( = ?auto_11438 ?auto_11439 ) ) ( not ( = ?auto_11438 ?auto_11440 ) ) ( not ( = ?auto_11439 ?auto_11440 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11439 ?auto_11440 )
      ( !STACK ?auto_11439 ?auto_11438 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11446 - BLOCK
      ?auto_11447 - BLOCK
      ?auto_11448 - BLOCK
      ?auto_11449 - BLOCK
      ?auto_11450 - BLOCK
    )
    :vars
    (
      ?auto_11451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11450 ?auto_11451 ) ( ON-TABLE ?auto_11446 ) ( ON ?auto_11447 ?auto_11446 ) ( ON ?auto_11448 ?auto_11447 ) ( not ( = ?auto_11446 ?auto_11447 ) ) ( not ( = ?auto_11446 ?auto_11448 ) ) ( not ( = ?auto_11446 ?auto_11449 ) ) ( not ( = ?auto_11446 ?auto_11450 ) ) ( not ( = ?auto_11446 ?auto_11451 ) ) ( not ( = ?auto_11447 ?auto_11448 ) ) ( not ( = ?auto_11447 ?auto_11449 ) ) ( not ( = ?auto_11447 ?auto_11450 ) ) ( not ( = ?auto_11447 ?auto_11451 ) ) ( not ( = ?auto_11448 ?auto_11449 ) ) ( not ( = ?auto_11448 ?auto_11450 ) ) ( not ( = ?auto_11448 ?auto_11451 ) ) ( not ( = ?auto_11449 ?auto_11450 ) ) ( not ( = ?auto_11449 ?auto_11451 ) ) ( not ( = ?auto_11450 ?auto_11451 ) ) ( CLEAR ?auto_11448 ) ( ON ?auto_11449 ?auto_11450 ) ( CLEAR ?auto_11449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11446 ?auto_11447 ?auto_11448 ?auto_11449 )
      ( MAKE-5PILE ?auto_11446 ?auto_11447 ?auto_11448 ?auto_11449 ?auto_11450 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11457 - BLOCK
      ?auto_11458 - BLOCK
      ?auto_11459 - BLOCK
      ?auto_11460 - BLOCK
      ?auto_11461 - BLOCK
    )
    :vars
    (
      ?auto_11462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11461 ?auto_11462 ) ( ON-TABLE ?auto_11457 ) ( ON ?auto_11458 ?auto_11457 ) ( ON ?auto_11459 ?auto_11458 ) ( not ( = ?auto_11457 ?auto_11458 ) ) ( not ( = ?auto_11457 ?auto_11459 ) ) ( not ( = ?auto_11457 ?auto_11460 ) ) ( not ( = ?auto_11457 ?auto_11461 ) ) ( not ( = ?auto_11457 ?auto_11462 ) ) ( not ( = ?auto_11458 ?auto_11459 ) ) ( not ( = ?auto_11458 ?auto_11460 ) ) ( not ( = ?auto_11458 ?auto_11461 ) ) ( not ( = ?auto_11458 ?auto_11462 ) ) ( not ( = ?auto_11459 ?auto_11460 ) ) ( not ( = ?auto_11459 ?auto_11461 ) ) ( not ( = ?auto_11459 ?auto_11462 ) ) ( not ( = ?auto_11460 ?auto_11461 ) ) ( not ( = ?auto_11460 ?auto_11462 ) ) ( not ( = ?auto_11461 ?auto_11462 ) ) ( CLEAR ?auto_11459 ) ( ON ?auto_11460 ?auto_11461 ) ( CLEAR ?auto_11460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11457 ?auto_11458 ?auto_11459 ?auto_11460 )
      ( MAKE-5PILE ?auto_11457 ?auto_11458 ?auto_11459 ?auto_11460 ?auto_11461 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11468 - BLOCK
      ?auto_11469 - BLOCK
      ?auto_11470 - BLOCK
      ?auto_11471 - BLOCK
      ?auto_11472 - BLOCK
    )
    :vars
    (
      ?auto_11473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11472 ?auto_11473 ) ( ON-TABLE ?auto_11468 ) ( ON ?auto_11469 ?auto_11468 ) ( not ( = ?auto_11468 ?auto_11469 ) ) ( not ( = ?auto_11468 ?auto_11470 ) ) ( not ( = ?auto_11468 ?auto_11471 ) ) ( not ( = ?auto_11468 ?auto_11472 ) ) ( not ( = ?auto_11468 ?auto_11473 ) ) ( not ( = ?auto_11469 ?auto_11470 ) ) ( not ( = ?auto_11469 ?auto_11471 ) ) ( not ( = ?auto_11469 ?auto_11472 ) ) ( not ( = ?auto_11469 ?auto_11473 ) ) ( not ( = ?auto_11470 ?auto_11471 ) ) ( not ( = ?auto_11470 ?auto_11472 ) ) ( not ( = ?auto_11470 ?auto_11473 ) ) ( not ( = ?auto_11471 ?auto_11472 ) ) ( not ( = ?auto_11471 ?auto_11473 ) ) ( not ( = ?auto_11472 ?auto_11473 ) ) ( ON ?auto_11471 ?auto_11472 ) ( CLEAR ?auto_11469 ) ( ON ?auto_11470 ?auto_11471 ) ( CLEAR ?auto_11470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11468 ?auto_11469 ?auto_11470 )
      ( MAKE-5PILE ?auto_11468 ?auto_11469 ?auto_11470 ?auto_11471 ?auto_11472 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11479 - BLOCK
      ?auto_11480 - BLOCK
      ?auto_11481 - BLOCK
      ?auto_11482 - BLOCK
      ?auto_11483 - BLOCK
    )
    :vars
    (
      ?auto_11484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11483 ?auto_11484 ) ( ON-TABLE ?auto_11479 ) ( ON ?auto_11480 ?auto_11479 ) ( not ( = ?auto_11479 ?auto_11480 ) ) ( not ( = ?auto_11479 ?auto_11481 ) ) ( not ( = ?auto_11479 ?auto_11482 ) ) ( not ( = ?auto_11479 ?auto_11483 ) ) ( not ( = ?auto_11479 ?auto_11484 ) ) ( not ( = ?auto_11480 ?auto_11481 ) ) ( not ( = ?auto_11480 ?auto_11482 ) ) ( not ( = ?auto_11480 ?auto_11483 ) ) ( not ( = ?auto_11480 ?auto_11484 ) ) ( not ( = ?auto_11481 ?auto_11482 ) ) ( not ( = ?auto_11481 ?auto_11483 ) ) ( not ( = ?auto_11481 ?auto_11484 ) ) ( not ( = ?auto_11482 ?auto_11483 ) ) ( not ( = ?auto_11482 ?auto_11484 ) ) ( not ( = ?auto_11483 ?auto_11484 ) ) ( ON ?auto_11482 ?auto_11483 ) ( CLEAR ?auto_11480 ) ( ON ?auto_11481 ?auto_11482 ) ( CLEAR ?auto_11481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11479 ?auto_11480 ?auto_11481 )
      ( MAKE-5PILE ?auto_11479 ?auto_11480 ?auto_11481 ?auto_11482 ?auto_11483 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11490 - BLOCK
      ?auto_11491 - BLOCK
      ?auto_11492 - BLOCK
      ?auto_11493 - BLOCK
      ?auto_11494 - BLOCK
    )
    :vars
    (
      ?auto_11495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11494 ?auto_11495 ) ( ON-TABLE ?auto_11490 ) ( not ( = ?auto_11490 ?auto_11491 ) ) ( not ( = ?auto_11490 ?auto_11492 ) ) ( not ( = ?auto_11490 ?auto_11493 ) ) ( not ( = ?auto_11490 ?auto_11494 ) ) ( not ( = ?auto_11490 ?auto_11495 ) ) ( not ( = ?auto_11491 ?auto_11492 ) ) ( not ( = ?auto_11491 ?auto_11493 ) ) ( not ( = ?auto_11491 ?auto_11494 ) ) ( not ( = ?auto_11491 ?auto_11495 ) ) ( not ( = ?auto_11492 ?auto_11493 ) ) ( not ( = ?auto_11492 ?auto_11494 ) ) ( not ( = ?auto_11492 ?auto_11495 ) ) ( not ( = ?auto_11493 ?auto_11494 ) ) ( not ( = ?auto_11493 ?auto_11495 ) ) ( not ( = ?auto_11494 ?auto_11495 ) ) ( ON ?auto_11493 ?auto_11494 ) ( ON ?auto_11492 ?auto_11493 ) ( CLEAR ?auto_11490 ) ( ON ?auto_11491 ?auto_11492 ) ( CLEAR ?auto_11491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11490 ?auto_11491 )
      ( MAKE-5PILE ?auto_11490 ?auto_11491 ?auto_11492 ?auto_11493 ?auto_11494 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11501 - BLOCK
      ?auto_11502 - BLOCK
      ?auto_11503 - BLOCK
      ?auto_11504 - BLOCK
      ?auto_11505 - BLOCK
    )
    :vars
    (
      ?auto_11506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11505 ?auto_11506 ) ( ON-TABLE ?auto_11501 ) ( not ( = ?auto_11501 ?auto_11502 ) ) ( not ( = ?auto_11501 ?auto_11503 ) ) ( not ( = ?auto_11501 ?auto_11504 ) ) ( not ( = ?auto_11501 ?auto_11505 ) ) ( not ( = ?auto_11501 ?auto_11506 ) ) ( not ( = ?auto_11502 ?auto_11503 ) ) ( not ( = ?auto_11502 ?auto_11504 ) ) ( not ( = ?auto_11502 ?auto_11505 ) ) ( not ( = ?auto_11502 ?auto_11506 ) ) ( not ( = ?auto_11503 ?auto_11504 ) ) ( not ( = ?auto_11503 ?auto_11505 ) ) ( not ( = ?auto_11503 ?auto_11506 ) ) ( not ( = ?auto_11504 ?auto_11505 ) ) ( not ( = ?auto_11504 ?auto_11506 ) ) ( not ( = ?auto_11505 ?auto_11506 ) ) ( ON ?auto_11504 ?auto_11505 ) ( ON ?auto_11503 ?auto_11504 ) ( CLEAR ?auto_11501 ) ( ON ?auto_11502 ?auto_11503 ) ( CLEAR ?auto_11502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11501 ?auto_11502 )
      ( MAKE-5PILE ?auto_11501 ?auto_11502 ?auto_11503 ?auto_11504 ?auto_11505 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11512 - BLOCK
      ?auto_11513 - BLOCK
      ?auto_11514 - BLOCK
      ?auto_11515 - BLOCK
      ?auto_11516 - BLOCK
    )
    :vars
    (
      ?auto_11517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11516 ?auto_11517 ) ( not ( = ?auto_11512 ?auto_11513 ) ) ( not ( = ?auto_11512 ?auto_11514 ) ) ( not ( = ?auto_11512 ?auto_11515 ) ) ( not ( = ?auto_11512 ?auto_11516 ) ) ( not ( = ?auto_11512 ?auto_11517 ) ) ( not ( = ?auto_11513 ?auto_11514 ) ) ( not ( = ?auto_11513 ?auto_11515 ) ) ( not ( = ?auto_11513 ?auto_11516 ) ) ( not ( = ?auto_11513 ?auto_11517 ) ) ( not ( = ?auto_11514 ?auto_11515 ) ) ( not ( = ?auto_11514 ?auto_11516 ) ) ( not ( = ?auto_11514 ?auto_11517 ) ) ( not ( = ?auto_11515 ?auto_11516 ) ) ( not ( = ?auto_11515 ?auto_11517 ) ) ( not ( = ?auto_11516 ?auto_11517 ) ) ( ON ?auto_11515 ?auto_11516 ) ( ON ?auto_11514 ?auto_11515 ) ( ON ?auto_11513 ?auto_11514 ) ( ON ?auto_11512 ?auto_11513 ) ( CLEAR ?auto_11512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11512 )
      ( MAKE-5PILE ?auto_11512 ?auto_11513 ?auto_11514 ?auto_11515 ?auto_11516 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_11523 - BLOCK
      ?auto_11524 - BLOCK
      ?auto_11525 - BLOCK
      ?auto_11526 - BLOCK
      ?auto_11527 - BLOCK
    )
    :vars
    (
      ?auto_11528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11527 ?auto_11528 ) ( not ( = ?auto_11523 ?auto_11524 ) ) ( not ( = ?auto_11523 ?auto_11525 ) ) ( not ( = ?auto_11523 ?auto_11526 ) ) ( not ( = ?auto_11523 ?auto_11527 ) ) ( not ( = ?auto_11523 ?auto_11528 ) ) ( not ( = ?auto_11524 ?auto_11525 ) ) ( not ( = ?auto_11524 ?auto_11526 ) ) ( not ( = ?auto_11524 ?auto_11527 ) ) ( not ( = ?auto_11524 ?auto_11528 ) ) ( not ( = ?auto_11525 ?auto_11526 ) ) ( not ( = ?auto_11525 ?auto_11527 ) ) ( not ( = ?auto_11525 ?auto_11528 ) ) ( not ( = ?auto_11526 ?auto_11527 ) ) ( not ( = ?auto_11526 ?auto_11528 ) ) ( not ( = ?auto_11527 ?auto_11528 ) ) ( ON ?auto_11526 ?auto_11527 ) ( ON ?auto_11525 ?auto_11526 ) ( ON ?auto_11524 ?auto_11525 ) ( ON ?auto_11523 ?auto_11524 ) ( CLEAR ?auto_11523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11523 )
      ( MAKE-5PILE ?auto_11523 ?auto_11524 ?auto_11525 ?auto_11526 ?auto_11527 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11535 - BLOCK
      ?auto_11536 - BLOCK
      ?auto_11537 - BLOCK
      ?auto_11538 - BLOCK
      ?auto_11539 - BLOCK
      ?auto_11540 - BLOCK
    )
    :vars
    (
      ?auto_11541 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11539 ) ( ON ?auto_11540 ?auto_11541 ) ( CLEAR ?auto_11540 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11535 ) ( ON ?auto_11536 ?auto_11535 ) ( ON ?auto_11537 ?auto_11536 ) ( ON ?auto_11538 ?auto_11537 ) ( ON ?auto_11539 ?auto_11538 ) ( not ( = ?auto_11535 ?auto_11536 ) ) ( not ( = ?auto_11535 ?auto_11537 ) ) ( not ( = ?auto_11535 ?auto_11538 ) ) ( not ( = ?auto_11535 ?auto_11539 ) ) ( not ( = ?auto_11535 ?auto_11540 ) ) ( not ( = ?auto_11535 ?auto_11541 ) ) ( not ( = ?auto_11536 ?auto_11537 ) ) ( not ( = ?auto_11536 ?auto_11538 ) ) ( not ( = ?auto_11536 ?auto_11539 ) ) ( not ( = ?auto_11536 ?auto_11540 ) ) ( not ( = ?auto_11536 ?auto_11541 ) ) ( not ( = ?auto_11537 ?auto_11538 ) ) ( not ( = ?auto_11537 ?auto_11539 ) ) ( not ( = ?auto_11537 ?auto_11540 ) ) ( not ( = ?auto_11537 ?auto_11541 ) ) ( not ( = ?auto_11538 ?auto_11539 ) ) ( not ( = ?auto_11538 ?auto_11540 ) ) ( not ( = ?auto_11538 ?auto_11541 ) ) ( not ( = ?auto_11539 ?auto_11540 ) ) ( not ( = ?auto_11539 ?auto_11541 ) ) ( not ( = ?auto_11540 ?auto_11541 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11540 ?auto_11541 )
      ( !STACK ?auto_11540 ?auto_11539 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11548 - BLOCK
      ?auto_11549 - BLOCK
      ?auto_11550 - BLOCK
      ?auto_11551 - BLOCK
      ?auto_11552 - BLOCK
      ?auto_11553 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_11552 ) ( ON-TABLE ?auto_11553 ) ( CLEAR ?auto_11553 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_11548 ) ( ON ?auto_11549 ?auto_11548 ) ( ON ?auto_11550 ?auto_11549 ) ( ON ?auto_11551 ?auto_11550 ) ( ON ?auto_11552 ?auto_11551 ) ( not ( = ?auto_11548 ?auto_11549 ) ) ( not ( = ?auto_11548 ?auto_11550 ) ) ( not ( = ?auto_11548 ?auto_11551 ) ) ( not ( = ?auto_11548 ?auto_11552 ) ) ( not ( = ?auto_11548 ?auto_11553 ) ) ( not ( = ?auto_11549 ?auto_11550 ) ) ( not ( = ?auto_11549 ?auto_11551 ) ) ( not ( = ?auto_11549 ?auto_11552 ) ) ( not ( = ?auto_11549 ?auto_11553 ) ) ( not ( = ?auto_11550 ?auto_11551 ) ) ( not ( = ?auto_11550 ?auto_11552 ) ) ( not ( = ?auto_11550 ?auto_11553 ) ) ( not ( = ?auto_11551 ?auto_11552 ) ) ( not ( = ?auto_11551 ?auto_11553 ) ) ( not ( = ?auto_11552 ?auto_11553 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_11553 )
      ( !STACK ?auto_11553 ?auto_11552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11560 - BLOCK
      ?auto_11561 - BLOCK
      ?auto_11562 - BLOCK
      ?auto_11563 - BLOCK
      ?auto_11564 - BLOCK
      ?auto_11565 - BLOCK
    )
    :vars
    (
      ?auto_11566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11565 ?auto_11566 ) ( ON-TABLE ?auto_11560 ) ( ON ?auto_11561 ?auto_11560 ) ( ON ?auto_11562 ?auto_11561 ) ( ON ?auto_11563 ?auto_11562 ) ( not ( = ?auto_11560 ?auto_11561 ) ) ( not ( = ?auto_11560 ?auto_11562 ) ) ( not ( = ?auto_11560 ?auto_11563 ) ) ( not ( = ?auto_11560 ?auto_11564 ) ) ( not ( = ?auto_11560 ?auto_11565 ) ) ( not ( = ?auto_11560 ?auto_11566 ) ) ( not ( = ?auto_11561 ?auto_11562 ) ) ( not ( = ?auto_11561 ?auto_11563 ) ) ( not ( = ?auto_11561 ?auto_11564 ) ) ( not ( = ?auto_11561 ?auto_11565 ) ) ( not ( = ?auto_11561 ?auto_11566 ) ) ( not ( = ?auto_11562 ?auto_11563 ) ) ( not ( = ?auto_11562 ?auto_11564 ) ) ( not ( = ?auto_11562 ?auto_11565 ) ) ( not ( = ?auto_11562 ?auto_11566 ) ) ( not ( = ?auto_11563 ?auto_11564 ) ) ( not ( = ?auto_11563 ?auto_11565 ) ) ( not ( = ?auto_11563 ?auto_11566 ) ) ( not ( = ?auto_11564 ?auto_11565 ) ) ( not ( = ?auto_11564 ?auto_11566 ) ) ( not ( = ?auto_11565 ?auto_11566 ) ) ( CLEAR ?auto_11563 ) ( ON ?auto_11564 ?auto_11565 ) ( CLEAR ?auto_11564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_11560 ?auto_11561 ?auto_11562 ?auto_11563 ?auto_11564 )
      ( MAKE-6PILE ?auto_11560 ?auto_11561 ?auto_11562 ?auto_11563 ?auto_11564 ?auto_11565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11573 - BLOCK
      ?auto_11574 - BLOCK
      ?auto_11575 - BLOCK
      ?auto_11576 - BLOCK
      ?auto_11577 - BLOCK
      ?auto_11578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11578 ) ( ON-TABLE ?auto_11573 ) ( ON ?auto_11574 ?auto_11573 ) ( ON ?auto_11575 ?auto_11574 ) ( ON ?auto_11576 ?auto_11575 ) ( not ( = ?auto_11573 ?auto_11574 ) ) ( not ( = ?auto_11573 ?auto_11575 ) ) ( not ( = ?auto_11573 ?auto_11576 ) ) ( not ( = ?auto_11573 ?auto_11577 ) ) ( not ( = ?auto_11573 ?auto_11578 ) ) ( not ( = ?auto_11574 ?auto_11575 ) ) ( not ( = ?auto_11574 ?auto_11576 ) ) ( not ( = ?auto_11574 ?auto_11577 ) ) ( not ( = ?auto_11574 ?auto_11578 ) ) ( not ( = ?auto_11575 ?auto_11576 ) ) ( not ( = ?auto_11575 ?auto_11577 ) ) ( not ( = ?auto_11575 ?auto_11578 ) ) ( not ( = ?auto_11576 ?auto_11577 ) ) ( not ( = ?auto_11576 ?auto_11578 ) ) ( not ( = ?auto_11577 ?auto_11578 ) ) ( CLEAR ?auto_11576 ) ( ON ?auto_11577 ?auto_11578 ) ( CLEAR ?auto_11577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_11573 ?auto_11574 ?auto_11575 ?auto_11576 ?auto_11577 )
      ( MAKE-6PILE ?auto_11573 ?auto_11574 ?auto_11575 ?auto_11576 ?auto_11577 ?auto_11578 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11585 - BLOCK
      ?auto_11586 - BLOCK
      ?auto_11587 - BLOCK
      ?auto_11588 - BLOCK
      ?auto_11589 - BLOCK
      ?auto_11590 - BLOCK
    )
    :vars
    (
      ?auto_11591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11590 ?auto_11591 ) ( ON-TABLE ?auto_11585 ) ( ON ?auto_11586 ?auto_11585 ) ( ON ?auto_11587 ?auto_11586 ) ( not ( = ?auto_11585 ?auto_11586 ) ) ( not ( = ?auto_11585 ?auto_11587 ) ) ( not ( = ?auto_11585 ?auto_11588 ) ) ( not ( = ?auto_11585 ?auto_11589 ) ) ( not ( = ?auto_11585 ?auto_11590 ) ) ( not ( = ?auto_11585 ?auto_11591 ) ) ( not ( = ?auto_11586 ?auto_11587 ) ) ( not ( = ?auto_11586 ?auto_11588 ) ) ( not ( = ?auto_11586 ?auto_11589 ) ) ( not ( = ?auto_11586 ?auto_11590 ) ) ( not ( = ?auto_11586 ?auto_11591 ) ) ( not ( = ?auto_11587 ?auto_11588 ) ) ( not ( = ?auto_11587 ?auto_11589 ) ) ( not ( = ?auto_11587 ?auto_11590 ) ) ( not ( = ?auto_11587 ?auto_11591 ) ) ( not ( = ?auto_11588 ?auto_11589 ) ) ( not ( = ?auto_11588 ?auto_11590 ) ) ( not ( = ?auto_11588 ?auto_11591 ) ) ( not ( = ?auto_11589 ?auto_11590 ) ) ( not ( = ?auto_11589 ?auto_11591 ) ) ( not ( = ?auto_11590 ?auto_11591 ) ) ( ON ?auto_11589 ?auto_11590 ) ( CLEAR ?auto_11587 ) ( ON ?auto_11588 ?auto_11589 ) ( CLEAR ?auto_11588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11585 ?auto_11586 ?auto_11587 ?auto_11588 )
      ( MAKE-6PILE ?auto_11585 ?auto_11586 ?auto_11587 ?auto_11588 ?auto_11589 ?auto_11590 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11598 - BLOCK
      ?auto_11599 - BLOCK
      ?auto_11600 - BLOCK
      ?auto_11601 - BLOCK
      ?auto_11602 - BLOCK
      ?auto_11603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11603 ) ( ON-TABLE ?auto_11598 ) ( ON ?auto_11599 ?auto_11598 ) ( ON ?auto_11600 ?auto_11599 ) ( not ( = ?auto_11598 ?auto_11599 ) ) ( not ( = ?auto_11598 ?auto_11600 ) ) ( not ( = ?auto_11598 ?auto_11601 ) ) ( not ( = ?auto_11598 ?auto_11602 ) ) ( not ( = ?auto_11598 ?auto_11603 ) ) ( not ( = ?auto_11599 ?auto_11600 ) ) ( not ( = ?auto_11599 ?auto_11601 ) ) ( not ( = ?auto_11599 ?auto_11602 ) ) ( not ( = ?auto_11599 ?auto_11603 ) ) ( not ( = ?auto_11600 ?auto_11601 ) ) ( not ( = ?auto_11600 ?auto_11602 ) ) ( not ( = ?auto_11600 ?auto_11603 ) ) ( not ( = ?auto_11601 ?auto_11602 ) ) ( not ( = ?auto_11601 ?auto_11603 ) ) ( not ( = ?auto_11602 ?auto_11603 ) ) ( ON ?auto_11602 ?auto_11603 ) ( CLEAR ?auto_11600 ) ( ON ?auto_11601 ?auto_11602 ) ( CLEAR ?auto_11601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_11598 ?auto_11599 ?auto_11600 ?auto_11601 )
      ( MAKE-6PILE ?auto_11598 ?auto_11599 ?auto_11600 ?auto_11601 ?auto_11602 ?auto_11603 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11610 - BLOCK
      ?auto_11611 - BLOCK
      ?auto_11612 - BLOCK
      ?auto_11613 - BLOCK
      ?auto_11614 - BLOCK
      ?auto_11615 - BLOCK
    )
    :vars
    (
      ?auto_11616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11615 ?auto_11616 ) ( ON-TABLE ?auto_11610 ) ( ON ?auto_11611 ?auto_11610 ) ( not ( = ?auto_11610 ?auto_11611 ) ) ( not ( = ?auto_11610 ?auto_11612 ) ) ( not ( = ?auto_11610 ?auto_11613 ) ) ( not ( = ?auto_11610 ?auto_11614 ) ) ( not ( = ?auto_11610 ?auto_11615 ) ) ( not ( = ?auto_11610 ?auto_11616 ) ) ( not ( = ?auto_11611 ?auto_11612 ) ) ( not ( = ?auto_11611 ?auto_11613 ) ) ( not ( = ?auto_11611 ?auto_11614 ) ) ( not ( = ?auto_11611 ?auto_11615 ) ) ( not ( = ?auto_11611 ?auto_11616 ) ) ( not ( = ?auto_11612 ?auto_11613 ) ) ( not ( = ?auto_11612 ?auto_11614 ) ) ( not ( = ?auto_11612 ?auto_11615 ) ) ( not ( = ?auto_11612 ?auto_11616 ) ) ( not ( = ?auto_11613 ?auto_11614 ) ) ( not ( = ?auto_11613 ?auto_11615 ) ) ( not ( = ?auto_11613 ?auto_11616 ) ) ( not ( = ?auto_11614 ?auto_11615 ) ) ( not ( = ?auto_11614 ?auto_11616 ) ) ( not ( = ?auto_11615 ?auto_11616 ) ) ( ON ?auto_11614 ?auto_11615 ) ( ON ?auto_11613 ?auto_11614 ) ( CLEAR ?auto_11611 ) ( ON ?auto_11612 ?auto_11613 ) ( CLEAR ?auto_11612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11610 ?auto_11611 ?auto_11612 )
      ( MAKE-6PILE ?auto_11610 ?auto_11611 ?auto_11612 ?auto_11613 ?auto_11614 ?auto_11615 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11623 - BLOCK
      ?auto_11624 - BLOCK
      ?auto_11625 - BLOCK
      ?auto_11626 - BLOCK
      ?auto_11627 - BLOCK
      ?auto_11628 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11628 ) ( ON-TABLE ?auto_11623 ) ( ON ?auto_11624 ?auto_11623 ) ( not ( = ?auto_11623 ?auto_11624 ) ) ( not ( = ?auto_11623 ?auto_11625 ) ) ( not ( = ?auto_11623 ?auto_11626 ) ) ( not ( = ?auto_11623 ?auto_11627 ) ) ( not ( = ?auto_11623 ?auto_11628 ) ) ( not ( = ?auto_11624 ?auto_11625 ) ) ( not ( = ?auto_11624 ?auto_11626 ) ) ( not ( = ?auto_11624 ?auto_11627 ) ) ( not ( = ?auto_11624 ?auto_11628 ) ) ( not ( = ?auto_11625 ?auto_11626 ) ) ( not ( = ?auto_11625 ?auto_11627 ) ) ( not ( = ?auto_11625 ?auto_11628 ) ) ( not ( = ?auto_11626 ?auto_11627 ) ) ( not ( = ?auto_11626 ?auto_11628 ) ) ( not ( = ?auto_11627 ?auto_11628 ) ) ( ON ?auto_11627 ?auto_11628 ) ( ON ?auto_11626 ?auto_11627 ) ( CLEAR ?auto_11624 ) ( ON ?auto_11625 ?auto_11626 ) ( CLEAR ?auto_11625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_11623 ?auto_11624 ?auto_11625 )
      ( MAKE-6PILE ?auto_11623 ?auto_11624 ?auto_11625 ?auto_11626 ?auto_11627 ?auto_11628 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11635 - BLOCK
      ?auto_11636 - BLOCK
      ?auto_11637 - BLOCK
      ?auto_11638 - BLOCK
      ?auto_11639 - BLOCK
      ?auto_11640 - BLOCK
    )
    :vars
    (
      ?auto_11641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11640 ?auto_11641 ) ( ON-TABLE ?auto_11635 ) ( not ( = ?auto_11635 ?auto_11636 ) ) ( not ( = ?auto_11635 ?auto_11637 ) ) ( not ( = ?auto_11635 ?auto_11638 ) ) ( not ( = ?auto_11635 ?auto_11639 ) ) ( not ( = ?auto_11635 ?auto_11640 ) ) ( not ( = ?auto_11635 ?auto_11641 ) ) ( not ( = ?auto_11636 ?auto_11637 ) ) ( not ( = ?auto_11636 ?auto_11638 ) ) ( not ( = ?auto_11636 ?auto_11639 ) ) ( not ( = ?auto_11636 ?auto_11640 ) ) ( not ( = ?auto_11636 ?auto_11641 ) ) ( not ( = ?auto_11637 ?auto_11638 ) ) ( not ( = ?auto_11637 ?auto_11639 ) ) ( not ( = ?auto_11637 ?auto_11640 ) ) ( not ( = ?auto_11637 ?auto_11641 ) ) ( not ( = ?auto_11638 ?auto_11639 ) ) ( not ( = ?auto_11638 ?auto_11640 ) ) ( not ( = ?auto_11638 ?auto_11641 ) ) ( not ( = ?auto_11639 ?auto_11640 ) ) ( not ( = ?auto_11639 ?auto_11641 ) ) ( not ( = ?auto_11640 ?auto_11641 ) ) ( ON ?auto_11639 ?auto_11640 ) ( ON ?auto_11638 ?auto_11639 ) ( ON ?auto_11637 ?auto_11638 ) ( CLEAR ?auto_11635 ) ( ON ?auto_11636 ?auto_11637 ) ( CLEAR ?auto_11636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11635 ?auto_11636 )
      ( MAKE-6PILE ?auto_11635 ?auto_11636 ?auto_11637 ?auto_11638 ?auto_11639 ?auto_11640 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11648 - BLOCK
      ?auto_11649 - BLOCK
      ?auto_11650 - BLOCK
      ?auto_11651 - BLOCK
      ?auto_11652 - BLOCK
      ?auto_11653 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11653 ) ( ON-TABLE ?auto_11648 ) ( not ( = ?auto_11648 ?auto_11649 ) ) ( not ( = ?auto_11648 ?auto_11650 ) ) ( not ( = ?auto_11648 ?auto_11651 ) ) ( not ( = ?auto_11648 ?auto_11652 ) ) ( not ( = ?auto_11648 ?auto_11653 ) ) ( not ( = ?auto_11649 ?auto_11650 ) ) ( not ( = ?auto_11649 ?auto_11651 ) ) ( not ( = ?auto_11649 ?auto_11652 ) ) ( not ( = ?auto_11649 ?auto_11653 ) ) ( not ( = ?auto_11650 ?auto_11651 ) ) ( not ( = ?auto_11650 ?auto_11652 ) ) ( not ( = ?auto_11650 ?auto_11653 ) ) ( not ( = ?auto_11651 ?auto_11652 ) ) ( not ( = ?auto_11651 ?auto_11653 ) ) ( not ( = ?auto_11652 ?auto_11653 ) ) ( ON ?auto_11652 ?auto_11653 ) ( ON ?auto_11651 ?auto_11652 ) ( ON ?auto_11650 ?auto_11651 ) ( CLEAR ?auto_11648 ) ( ON ?auto_11649 ?auto_11650 ) ( CLEAR ?auto_11649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_11648 ?auto_11649 )
      ( MAKE-6PILE ?auto_11648 ?auto_11649 ?auto_11650 ?auto_11651 ?auto_11652 ?auto_11653 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11660 - BLOCK
      ?auto_11661 - BLOCK
      ?auto_11662 - BLOCK
      ?auto_11663 - BLOCK
      ?auto_11664 - BLOCK
      ?auto_11665 - BLOCK
    )
    :vars
    (
      ?auto_11666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11665 ?auto_11666 ) ( not ( = ?auto_11660 ?auto_11661 ) ) ( not ( = ?auto_11660 ?auto_11662 ) ) ( not ( = ?auto_11660 ?auto_11663 ) ) ( not ( = ?auto_11660 ?auto_11664 ) ) ( not ( = ?auto_11660 ?auto_11665 ) ) ( not ( = ?auto_11660 ?auto_11666 ) ) ( not ( = ?auto_11661 ?auto_11662 ) ) ( not ( = ?auto_11661 ?auto_11663 ) ) ( not ( = ?auto_11661 ?auto_11664 ) ) ( not ( = ?auto_11661 ?auto_11665 ) ) ( not ( = ?auto_11661 ?auto_11666 ) ) ( not ( = ?auto_11662 ?auto_11663 ) ) ( not ( = ?auto_11662 ?auto_11664 ) ) ( not ( = ?auto_11662 ?auto_11665 ) ) ( not ( = ?auto_11662 ?auto_11666 ) ) ( not ( = ?auto_11663 ?auto_11664 ) ) ( not ( = ?auto_11663 ?auto_11665 ) ) ( not ( = ?auto_11663 ?auto_11666 ) ) ( not ( = ?auto_11664 ?auto_11665 ) ) ( not ( = ?auto_11664 ?auto_11666 ) ) ( not ( = ?auto_11665 ?auto_11666 ) ) ( ON ?auto_11664 ?auto_11665 ) ( ON ?auto_11663 ?auto_11664 ) ( ON ?auto_11662 ?auto_11663 ) ( ON ?auto_11661 ?auto_11662 ) ( ON ?auto_11660 ?auto_11661 ) ( CLEAR ?auto_11660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11660 )
      ( MAKE-6PILE ?auto_11660 ?auto_11661 ?auto_11662 ?auto_11663 ?auto_11664 ?auto_11665 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11673 - BLOCK
      ?auto_11674 - BLOCK
      ?auto_11675 - BLOCK
      ?auto_11676 - BLOCK
      ?auto_11677 - BLOCK
      ?auto_11678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_11678 ) ( not ( = ?auto_11673 ?auto_11674 ) ) ( not ( = ?auto_11673 ?auto_11675 ) ) ( not ( = ?auto_11673 ?auto_11676 ) ) ( not ( = ?auto_11673 ?auto_11677 ) ) ( not ( = ?auto_11673 ?auto_11678 ) ) ( not ( = ?auto_11674 ?auto_11675 ) ) ( not ( = ?auto_11674 ?auto_11676 ) ) ( not ( = ?auto_11674 ?auto_11677 ) ) ( not ( = ?auto_11674 ?auto_11678 ) ) ( not ( = ?auto_11675 ?auto_11676 ) ) ( not ( = ?auto_11675 ?auto_11677 ) ) ( not ( = ?auto_11675 ?auto_11678 ) ) ( not ( = ?auto_11676 ?auto_11677 ) ) ( not ( = ?auto_11676 ?auto_11678 ) ) ( not ( = ?auto_11677 ?auto_11678 ) ) ( ON ?auto_11677 ?auto_11678 ) ( ON ?auto_11676 ?auto_11677 ) ( ON ?auto_11675 ?auto_11676 ) ( ON ?auto_11674 ?auto_11675 ) ( ON ?auto_11673 ?auto_11674 ) ( CLEAR ?auto_11673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_11673 )
      ( MAKE-6PILE ?auto_11673 ?auto_11674 ?auto_11675 ?auto_11676 ?auto_11677 ?auto_11678 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_11685 - BLOCK
      ?auto_11686 - BLOCK
      ?auto_11687 - BLOCK
      ?auto_11688 - BLOCK
      ?auto_11689 - BLOCK
      ?auto_11690 - BLOCK
    )
    :vars
    (
      ?auto_11691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_11685 ?auto_11686 ) ) ( not ( = ?auto_11685 ?auto_11687 ) ) ( not ( = ?auto_11685 ?auto_11688 ) ) ( not ( = ?auto_11685 ?auto_11689 ) ) ( not ( = ?auto_11685 ?auto_11690 ) ) ( not ( = ?auto_11686 ?auto_11687 ) ) ( not ( = ?auto_11686 ?auto_11688 ) ) ( not ( = ?auto_11686 ?auto_11689 ) ) ( not ( = ?auto_11686 ?auto_11690 ) ) ( not ( = ?auto_11687 ?auto_11688 ) ) ( not ( = ?auto_11687 ?auto_11689 ) ) ( not ( = ?auto_11687 ?auto_11690 ) ) ( not ( = ?auto_11688 ?auto_11689 ) ) ( not ( = ?auto_11688 ?auto_11690 ) ) ( not ( = ?auto_11689 ?auto_11690 ) ) ( ON ?auto_11685 ?auto_11691 ) ( not ( = ?auto_11690 ?auto_11691 ) ) ( not ( = ?auto_11689 ?auto_11691 ) ) ( not ( = ?auto_11688 ?auto_11691 ) ) ( not ( = ?auto_11687 ?auto_11691 ) ) ( not ( = ?auto_11686 ?auto_11691 ) ) ( not ( = ?auto_11685 ?auto_11691 ) ) ( ON ?auto_11686 ?auto_11685 ) ( ON ?auto_11687 ?auto_11686 ) ( ON ?auto_11688 ?auto_11687 ) ( ON ?auto_11689 ?auto_11688 ) ( ON ?auto_11690 ?auto_11689 ) ( CLEAR ?auto_11690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_11690 ?auto_11689 ?auto_11688 ?auto_11687 ?auto_11686 ?auto_11685 )
      ( MAKE-6PILE ?auto_11685 ?auto_11686 ?auto_11687 ?auto_11688 ?auto_11689 ?auto_11690 ) )
  )

)

