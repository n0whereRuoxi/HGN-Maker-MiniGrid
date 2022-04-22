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

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_298 - BLOCK
      ?auto_299 - BLOCK
    )
    :vars
    (
      ?auto_300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_300 ?auto_299 ) ( CLEAR ?auto_300 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_298 ) ( ON ?auto_299 ?auto_298 ) ( not ( = ?auto_298 ?auto_299 ) ) ( not ( = ?auto_298 ?auto_300 ) ) ( not ( = ?auto_299 ?auto_300 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_300 ?auto_299 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_302 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_302 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_302 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_303 - BLOCK
    )
    :vars
    (
      ?auto_304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_303 ?auto_304 ) ( CLEAR ?auto_303 ) ( HAND-EMPTY ) ( not ( = ?auto_303 ?auto_304 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_303 ?auto_304 )
      ( MAKE-1PILE ?auto_303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_306 - BLOCK
    )
    :vars
    (
      ?auto_307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_307 ?auto_306 ) ( CLEAR ?auto_307 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_306 ) ( not ( = ?auto_306 ?auto_307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_307 ?auto_306 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_308 - BLOCK
    )
    :vars
    (
      ?auto_309 - BLOCK
      ?auto_310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_309 ?auto_308 ) ( CLEAR ?auto_309 ) ( ON-TABLE ?auto_308 ) ( not ( = ?auto_308 ?auto_309 ) ) ( HOLDING ?auto_310 ) ( not ( = ?auto_308 ?auto_310 ) ) ( not ( = ?auto_309 ?auto_310 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_310 )
      ( MAKE-1PILE ?auto_308 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_311 - BLOCK
    )
    :vars
    (
      ?auto_313 - BLOCK
      ?auto_312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_313 ?auto_311 ) ( ON-TABLE ?auto_311 ) ( not ( = ?auto_311 ?auto_313 ) ) ( not ( = ?auto_311 ?auto_312 ) ) ( not ( = ?auto_313 ?auto_312 ) ) ( ON ?auto_312 ?auto_313 ) ( CLEAR ?auto_312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_311 ?auto_313 )
      ( MAKE-1PILE ?auto_311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_316 - BLOCK
      ?auto_317 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_317 ) ( CLEAR ?auto_316 ) ( ON-TABLE ?auto_316 ) ( not ( = ?auto_316 ?auto_317 ) ) )
    :subtasks
    ( ( !STACK ?auto_317 ?auto_316 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_318 - BLOCK
      ?auto_319 - BLOCK
    )
    :vars
    (
      ?auto_320 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_318 ) ( ON-TABLE ?auto_318 ) ( not ( = ?auto_318 ?auto_319 ) ) ( ON ?auto_319 ?auto_320 ) ( CLEAR ?auto_319 ) ( HAND-EMPTY ) ( not ( = ?auto_318 ?auto_320 ) ) ( not ( = ?auto_319 ?auto_320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_319 ?auto_320 )
      ( MAKE-2PILE ?auto_318 ?auto_319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_321 - BLOCK
      ?auto_322 - BLOCK
    )
    :vars
    (
      ?auto_323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_321 ?auto_322 ) ) ( ON ?auto_322 ?auto_323 ) ( CLEAR ?auto_322 ) ( not ( = ?auto_321 ?auto_323 ) ) ( not ( = ?auto_322 ?auto_323 ) ) ( HOLDING ?auto_321 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_321 )
      ( MAKE-2PILE ?auto_321 ?auto_322 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_324 - BLOCK
      ?auto_325 - BLOCK
    )
    :vars
    (
      ?auto_326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_324 ?auto_325 ) ) ( ON ?auto_325 ?auto_326 ) ( not ( = ?auto_324 ?auto_326 ) ) ( not ( = ?auto_325 ?auto_326 ) ) ( ON ?auto_324 ?auto_325 ) ( CLEAR ?auto_324 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_326 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_326 ?auto_325 )
      ( MAKE-2PILE ?auto_324 ?auto_325 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_343 - BLOCK
    )
    :vars
    (
      ?auto_344 - BLOCK
      ?auto_345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_343 ?auto_344 ) ( CLEAR ?auto_343 ) ( not ( = ?auto_343 ?auto_344 ) ) ( HOLDING ?auto_345 ) ( not ( = ?auto_343 ?auto_345 ) ) ( not ( = ?auto_344 ?auto_345 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_345 )
      ( MAKE-1PILE ?auto_343 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_346 - BLOCK
    )
    :vars
    (
      ?auto_347 - BLOCK
      ?auto_348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_346 ?auto_347 ) ( not ( = ?auto_346 ?auto_347 ) ) ( not ( = ?auto_346 ?auto_348 ) ) ( not ( = ?auto_347 ?auto_348 ) ) ( ON ?auto_348 ?auto_346 ) ( CLEAR ?auto_348 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_347 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_347 ?auto_346 )
      ( MAKE-1PILE ?auto_346 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_353 - BLOCK
      ?auto_354 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_353 ) ( ON-TABLE ?auto_353 ) ( not ( = ?auto_353 ?auto_354 ) ) ( ON-TABLE ?auto_354 ) ( CLEAR ?auto_354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_354 )
      ( MAKE-2PILE ?auto_353 ?auto_354 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_355 - BLOCK
      ?auto_356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_355 ?auto_356 ) ) ( ON-TABLE ?auto_356 ) ( CLEAR ?auto_356 ) ( HOLDING ?auto_355 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_355 )
      ( MAKE-2PILE ?auto_355 ?auto_356 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_357 - BLOCK
      ?auto_358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_357 ?auto_358 ) ) ( ON-TABLE ?auto_358 ) ( ON ?auto_357 ?auto_358 ) ( CLEAR ?auto_357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_358 )
      ( MAKE-2PILE ?auto_357 ?auto_358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_361 - BLOCK
      ?auto_362 - BLOCK
    )
    :vars
    (
      ?auto_363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_361 ?auto_362 ) ) ( ON-TABLE ?auto_362 ) ( CLEAR ?auto_362 ) ( ON ?auto_361 ?auto_363 ) ( CLEAR ?auto_361 ) ( HAND-EMPTY ) ( not ( = ?auto_361 ?auto_363 ) ) ( not ( = ?auto_362 ?auto_363 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_361 ?auto_363 )
      ( MAKE-2PILE ?auto_361 ?auto_362 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_364 - BLOCK
      ?auto_365 - BLOCK
    )
    :vars
    (
      ?auto_366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_364 ?auto_365 ) ) ( ON ?auto_364 ?auto_366 ) ( CLEAR ?auto_364 ) ( not ( = ?auto_364 ?auto_366 ) ) ( not ( = ?auto_365 ?auto_366 ) ) ( HOLDING ?auto_365 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_365 )
      ( MAKE-2PILE ?auto_364 ?auto_365 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_367 - BLOCK
      ?auto_368 - BLOCK
    )
    :vars
    (
      ?auto_369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_367 ?auto_368 ) ) ( ON ?auto_367 ?auto_369 ) ( not ( = ?auto_367 ?auto_369 ) ) ( not ( = ?auto_368 ?auto_369 ) ) ( ON ?auto_368 ?auto_367 ) ( CLEAR ?auto_368 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_369 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_369 ?auto_367 )
      ( MAKE-2PILE ?auto_367 ?auto_368 ) )
  )

)

