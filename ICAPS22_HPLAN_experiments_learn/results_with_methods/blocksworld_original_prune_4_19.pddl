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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15272 - BLOCK
      ?auto_15273 - BLOCK
      ?auto_15274 - BLOCK
      ?auto_15275 - BLOCK
    )
    :vars
    (
      ?auto_15276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15276 ?auto_15275 ) ( CLEAR ?auto_15276 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15272 ) ( ON ?auto_15273 ?auto_15272 ) ( ON ?auto_15274 ?auto_15273 ) ( ON ?auto_15275 ?auto_15274 ) ( not ( = ?auto_15272 ?auto_15273 ) ) ( not ( = ?auto_15272 ?auto_15274 ) ) ( not ( = ?auto_15272 ?auto_15275 ) ) ( not ( = ?auto_15272 ?auto_15276 ) ) ( not ( = ?auto_15273 ?auto_15274 ) ) ( not ( = ?auto_15273 ?auto_15275 ) ) ( not ( = ?auto_15273 ?auto_15276 ) ) ( not ( = ?auto_15274 ?auto_15275 ) ) ( not ( = ?auto_15274 ?auto_15276 ) ) ( not ( = ?auto_15275 ?auto_15276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15276 ?auto_15275 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15278 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15278 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15278 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15279 - BLOCK
    )
    :vars
    (
      ?auto_15280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15279 ?auto_15280 ) ( CLEAR ?auto_15279 ) ( HAND-EMPTY ) ( not ( = ?auto_15279 ?auto_15280 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15279 ?auto_15280 )
      ( MAKE-1PILE ?auto_15279 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15284 - BLOCK
      ?auto_15285 - BLOCK
      ?auto_15286 - BLOCK
    )
    :vars
    (
      ?auto_15287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15287 ?auto_15286 ) ( CLEAR ?auto_15287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15284 ) ( ON ?auto_15285 ?auto_15284 ) ( ON ?auto_15286 ?auto_15285 ) ( not ( = ?auto_15284 ?auto_15285 ) ) ( not ( = ?auto_15284 ?auto_15286 ) ) ( not ( = ?auto_15284 ?auto_15287 ) ) ( not ( = ?auto_15285 ?auto_15286 ) ) ( not ( = ?auto_15285 ?auto_15287 ) ) ( not ( = ?auto_15286 ?auto_15287 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15287 ?auto_15286 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15288 - BLOCK
      ?auto_15289 - BLOCK
      ?auto_15290 - BLOCK
    )
    :vars
    (
      ?auto_15291 - BLOCK
      ?auto_15292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15291 ?auto_15290 ) ( CLEAR ?auto_15291 ) ( ON-TABLE ?auto_15288 ) ( ON ?auto_15289 ?auto_15288 ) ( ON ?auto_15290 ?auto_15289 ) ( not ( = ?auto_15288 ?auto_15289 ) ) ( not ( = ?auto_15288 ?auto_15290 ) ) ( not ( = ?auto_15288 ?auto_15291 ) ) ( not ( = ?auto_15289 ?auto_15290 ) ) ( not ( = ?auto_15289 ?auto_15291 ) ) ( not ( = ?auto_15290 ?auto_15291 ) ) ( HOLDING ?auto_15292 ) ( not ( = ?auto_15288 ?auto_15292 ) ) ( not ( = ?auto_15289 ?auto_15292 ) ) ( not ( = ?auto_15290 ?auto_15292 ) ) ( not ( = ?auto_15291 ?auto_15292 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15292 )
      ( MAKE-3PILE ?auto_15288 ?auto_15289 ?auto_15290 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15293 - BLOCK
      ?auto_15294 - BLOCK
      ?auto_15295 - BLOCK
    )
    :vars
    (
      ?auto_15296 - BLOCK
      ?auto_15297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15296 ?auto_15295 ) ( ON-TABLE ?auto_15293 ) ( ON ?auto_15294 ?auto_15293 ) ( ON ?auto_15295 ?auto_15294 ) ( not ( = ?auto_15293 ?auto_15294 ) ) ( not ( = ?auto_15293 ?auto_15295 ) ) ( not ( = ?auto_15293 ?auto_15296 ) ) ( not ( = ?auto_15294 ?auto_15295 ) ) ( not ( = ?auto_15294 ?auto_15296 ) ) ( not ( = ?auto_15295 ?auto_15296 ) ) ( not ( = ?auto_15293 ?auto_15297 ) ) ( not ( = ?auto_15294 ?auto_15297 ) ) ( not ( = ?auto_15295 ?auto_15297 ) ) ( not ( = ?auto_15296 ?auto_15297 ) ) ( ON ?auto_15297 ?auto_15296 ) ( CLEAR ?auto_15297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15293 ?auto_15294 ?auto_15295 ?auto_15296 )
      ( MAKE-3PILE ?auto_15293 ?auto_15294 ?auto_15295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15300 - BLOCK
      ?auto_15301 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15301 ) ( CLEAR ?auto_15300 ) ( ON-TABLE ?auto_15300 ) ( not ( = ?auto_15300 ?auto_15301 ) ) )
    :subtasks
    ( ( !STACK ?auto_15301 ?auto_15300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15302 - BLOCK
      ?auto_15303 - BLOCK
    )
    :vars
    (
      ?auto_15304 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15302 ) ( ON-TABLE ?auto_15302 ) ( not ( = ?auto_15302 ?auto_15303 ) ) ( ON ?auto_15303 ?auto_15304 ) ( CLEAR ?auto_15303 ) ( HAND-EMPTY ) ( not ( = ?auto_15302 ?auto_15304 ) ) ( not ( = ?auto_15303 ?auto_15304 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15303 ?auto_15304 )
      ( MAKE-2PILE ?auto_15302 ?auto_15303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15305 - BLOCK
      ?auto_15306 - BLOCK
    )
    :vars
    (
      ?auto_15307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15305 ?auto_15306 ) ) ( ON ?auto_15306 ?auto_15307 ) ( CLEAR ?auto_15306 ) ( not ( = ?auto_15305 ?auto_15307 ) ) ( not ( = ?auto_15306 ?auto_15307 ) ) ( HOLDING ?auto_15305 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15305 )
      ( MAKE-2PILE ?auto_15305 ?auto_15306 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15308 - BLOCK
      ?auto_15309 - BLOCK
    )
    :vars
    (
      ?auto_15310 - BLOCK
      ?auto_15311 - BLOCK
      ?auto_15312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15308 ?auto_15309 ) ) ( ON ?auto_15309 ?auto_15310 ) ( not ( = ?auto_15308 ?auto_15310 ) ) ( not ( = ?auto_15309 ?auto_15310 ) ) ( ON ?auto_15308 ?auto_15309 ) ( CLEAR ?auto_15308 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15311 ) ( ON ?auto_15312 ?auto_15311 ) ( ON ?auto_15310 ?auto_15312 ) ( not ( = ?auto_15311 ?auto_15312 ) ) ( not ( = ?auto_15311 ?auto_15310 ) ) ( not ( = ?auto_15311 ?auto_15309 ) ) ( not ( = ?auto_15311 ?auto_15308 ) ) ( not ( = ?auto_15312 ?auto_15310 ) ) ( not ( = ?auto_15312 ?auto_15309 ) ) ( not ( = ?auto_15312 ?auto_15308 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15311 ?auto_15312 ?auto_15310 ?auto_15309 )
      ( MAKE-2PILE ?auto_15308 ?auto_15309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15315 - BLOCK
      ?auto_15316 - BLOCK
    )
    :vars
    (
      ?auto_15317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15317 ?auto_15316 ) ( CLEAR ?auto_15317 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15315 ) ( ON ?auto_15316 ?auto_15315 ) ( not ( = ?auto_15315 ?auto_15316 ) ) ( not ( = ?auto_15315 ?auto_15317 ) ) ( not ( = ?auto_15316 ?auto_15317 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15317 ?auto_15316 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15318 - BLOCK
      ?auto_15319 - BLOCK
    )
    :vars
    (
      ?auto_15320 - BLOCK
      ?auto_15321 - BLOCK
      ?auto_15322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15320 ?auto_15319 ) ( CLEAR ?auto_15320 ) ( ON-TABLE ?auto_15318 ) ( ON ?auto_15319 ?auto_15318 ) ( not ( = ?auto_15318 ?auto_15319 ) ) ( not ( = ?auto_15318 ?auto_15320 ) ) ( not ( = ?auto_15319 ?auto_15320 ) ) ( HOLDING ?auto_15321 ) ( CLEAR ?auto_15322 ) ( not ( = ?auto_15318 ?auto_15321 ) ) ( not ( = ?auto_15318 ?auto_15322 ) ) ( not ( = ?auto_15319 ?auto_15321 ) ) ( not ( = ?auto_15319 ?auto_15322 ) ) ( not ( = ?auto_15320 ?auto_15321 ) ) ( not ( = ?auto_15320 ?auto_15322 ) ) ( not ( = ?auto_15321 ?auto_15322 ) ) )
    :subtasks
    ( ( !STACK ?auto_15321 ?auto_15322 )
      ( MAKE-2PILE ?auto_15318 ?auto_15319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15518 - BLOCK
      ?auto_15519 - BLOCK
    )
    :vars
    (
      ?auto_15521 - BLOCK
      ?auto_15520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15521 ?auto_15519 ) ( ON-TABLE ?auto_15518 ) ( ON ?auto_15519 ?auto_15518 ) ( not ( = ?auto_15518 ?auto_15519 ) ) ( not ( = ?auto_15518 ?auto_15521 ) ) ( not ( = ?auto_15519 ?auto_15521 ) ) ( not ( = ?auto_15518 ?auto_15520 ) ) ( not ( = ?auto_15519 ?auto_15520 ) ) ( not ( = ?auto_15521 ?auto_15520 ) ) ( ON ?auto_15520 ?auto_15521 ) ( CLEAR ?auto_15520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15518 ?auto_15519 ?auto_15521 )
      ( MAKE-2PILE ?auto_15518 ?auto_15519 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15328 - BLOCK
      ?auto_15329 - BLOCK
    )
    :vars
    (
      ?auto_15332 - BLOCK
      ?auto_15331 - BLOCK
      ?auto_15330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15332 ?auto_15329 ) ( ON-TABLE ?auto_15328 ) ( ON ?auto_15329 ?auto_15328 ) ( not ( = ?auto_15328 ?auto_15329 ) ) ( not ( = ?auto_15328 ?auto_15332 ) ) ( not ( = ?auto_15329 ?auto_15332 ) ) ( not ( = ?auto_15328 ?auto_15331 ) ) ( not ( = ?auto_15328 ?auto_15330 ) ) ( not ( = ?auto_15329 ?auto_15331 ) ) ( not ( = ?auto_15329 ?auto_15330 ) ) ( not ( = ?auto_15332 ?auto_15331 ) ) ( not ( = ?auto_15332 ?auto_15330 ) ) ( not ( = ?auto_15331 ?auto_15330 ) ) ( ON ?auto_15331 ?auto_15332 ) ( CLEAR ?auto_15331 ) ( HOLDING ?auto_15330 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15330 )
      ( MAKE-2PILE ?auto_15328 ?auto_15329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15333 - BLOCK
      ?auto_15334 - BLOCK
    )
    :vars
    (
      ?auto_15337 - BLOCK
      ?auto_15335 - BLOCK
      ?auto_15336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15337 ?auto_15334 ) ( ON-TABLE ?auto_15333 ) ( ON ?auto_15334 ?auto_15333 ) ( not ( = ?auto_15333 ?auto_15334 ) ) ( not ( = ?auto_15333 ?auto_15337 ) ) ( not ( = ?auto_15334 ?auto_15337 ) ) ( not ( = ?auto_15333 ?auto_15335 ) ) ( not ( = ?auto_15333 ?auto_15336 ) ) ( not ( = ?auto_15334 ?auto_15335 ) ) ( not ( = ?auto_15334 ?auto_15336 ) ) ( not ( = ?auto_15337 ?auto_15335 ) ) ( not ( = ?auto_15337 ?auto_15336 ) ) ( not ( = ?auto_15335 ?auto_15336 ) ) ( ON ?auto_15335 ?auto_15337 ) ( ON ?auto_15336 ?auto_15335 ) ( CLEAR ?auto_15336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15333 ?auto_15334 ?auto_15337 ?auto_15335 )
      ( MAKE-2PILE ?auto_15333 ?auto_15334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15341 - BLOCK
      ?auto_15342 - BLOCK
      ?auto_15343 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15343 ) ( CLEAR ?auto_15342 ) ( ON-TABLE ?auto_15341 ) ( ON ?auto_15342 ?auto_15341 ) ( not ( = ?auto_15341 ?auto_15342 ) ) ( not ( = ?auto_15341 ?auto_15343 ) ) ( not ( = ?auto_15342 ?auto_15343 ) ) )
    :subtasks
    ( ( !STACK ?auto_15343 ?auto_15342 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15344 - BLOCK
      ?auto_15345 - BLOCK
      ?auto_15346 - BLOCK
    )
    :vars
    (
      ?auto_15347 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15345 ) ( ON-TABLE ?auto_15344 ) ( ON ?auto_15345 ?auto_15344 ) ( not ( = ?auto_15344 ?auto_15345 ) ) ( not ( = ?auto_15344 ?auto_15346 ) ) ( not ( = ?auto_15345 ?auto_15346 ) ) ( ON ?auto_15346 ?auto_15347 ) ( CLEAR ?auto_15346 ) ( HAND-EMPTY ) ( not ( = ?auto_15344 ?auto_15347 ) ) ( not ( = ?auto_15345 ?auto_15347 ) ) ( not ( = ?auto_15346 ?auto_15347 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15346 ?auto_15347 )
      ( MAKE-3PILE ?auto_15344 ?auto_15345 ?auto_15346 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15348 - BLOCK
      ?auto_15349 - BLOCK
      ?auto_15350 - BLOCK
    )
    :vars
    (
      ?auto_15351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15348 ) ( not ( = ?auto_15348 ?auto_15349 ) ) ( not ( = ?auto_15348 ?auto_15350 ) ) ( not ( = ?auto_15349 ?auto_15350 ) ) ( ON ?auto_15350 ?auto_15351 ) ( CLEAR ?auto_15350 ) ( not ( = ?auto_15348 ?auto_15351 ) ) ( not ( = ?auto_15349 ?auto_15351 ) ) ( not ( = ?auto_15350 ?auto_15351 ) ) ( HOLDING ?auto_15349 ) ( CLEAR ?auto_15348 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15348 ?auto_15349 )
      ( MAKE-3PILE ?auto_15348 ?auto_15349 ?auto_15350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15352 - BLOCK
      ?auto_15353 - BLOCK
      ?auto_15354 - BLOCK
    )
    :vars
    (
      ?auto_15355 - BLOCK
      ?auto_15356 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15352 ) ( not ( = ?auto_15352 ?auto_15353 ) ) ( not ( = ?auto_15352 ?auto_15354 ) ) ( not ( = ?auto_15353 ?auto_15354 ) ) ( ON ?auto_15354 ?auto_15355 ) ( not ( = ?auto_15352 ?auto_15355 ) ) ( not ( = ?auto_15353 ?auto_15355 ) ) ( not ( = ?auto_15354 ?auto_15355 ) ) ( CLEAR ?auto_15352 ) ( ON ?auto_15353 ?auto_15354 ) ( CLEAR ?auto_15353 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15356 ) ( ON ?auto_15355 ?auto_15356 ) ( not ( = ?auto_15356 ?auto_15355 ) ) ( not ( = ?auto_15356 ?auto_15354 ) ) ( not ( = ?auto_15356 ?auto_15353 ) ) ( not ( = ?auto_15352 ?auto_15356 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15356 ?auto_15355 ?auto_15354 )
      ( MAKE-3PILE ?auto_15352 ?auto_15353 ?auto_15354 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15357 - BLOCK
      ?auto_15358 - BLOCK
      ?auto_15359 - BLOCK
    )
    :vars
    (
      ?auto_15361 - BLOCK
      ?auto_15360 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15357 ?auto_15358 ) ) ( not ( = ?auto_15357 ?auto_15359 ) ) ( not ( = ?auto_15358 ?auto_15359 ) ) ( ON ?auto_15359 ?auto_15361 ) ( not ( = ?auto_15357 ?auto_15361 ) ) ( not ( = ?auto_15358 ?auto_15361 ) ) ( not ( = ?auto_15359 ?auto_15361 ) ) ( ON ?auto_15358 ?auto_15359 ) ( CLEAR ?auto_15358 ) ( ON-TABLE ?auto_15360 ) ( ON ?auto_15361 ?auto_15360 ) ( not ( = ?auto_15360 ?auto_15361 ) ) ( not ( = ?auto_15360 ?auto_15359 ) ) ( not ( = ?auto_15360 ?auto_15358 ) ) ( not ( = ?auto_15357 ?auto_15360 ) ) ( HOLDING ?auto_15357 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15357 )
      ( MAKE-3PILE ?auto_15357 ?auto_15358 ?auto_15359 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15362 - BLOCK
      ?auto_15363 - BLOCK
      ?auto_15364 - BLOCK
    )
    :vars
    (
      ?auto_15366 - BLOCK
      ?auto_15365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15362 ?auto_15363 ) ) ( not ( = ?auto_15362 ?auto_15364 ) ) ( not ( = ?auto_15363 ?auto_15364 ) ) ( ON ?auto_15364 ?auto_15366 ) ( not ( = ?auto_15362 ?auto_15366 ) ) ( not ( = ?auto_15363 ?auto_15366 ) ) ( not ( = ?auto_15364 ?auto_15366 ) ) ( ON ?auto_15363 ?auto_15364 ) ( ON-TABLE ?auto_15365 ) ( ON ?auto_15366 ?auto_15365 ) ( not ( = ?auto_15365 ?auto_15366 ) ) ( not ( = ?auto_15365 ?auto_15364 ) ) ( not ( = ?auto_15365 ?auto_15363 ) ) ( not ( = ?auto_15362 ?auto_15365 ) ) ( ON ?auto_15362 ?auto_15363 ) ( CLEAR ?auto_15362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15365 ?auto_15366 ?auto_15364 ?auto_15363 )
      ( MAKE-3PILE ?auto_15362 ?auto_15363 ?auto_15364 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15368 - BLOCK
    )
    :vars
    (
      ?auto_15369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15369 ?auto_15368 ) ( CLEAR ?auto_15369 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15368 ) ( not ( = ?auto_15368 ?auto_15369 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15369 ?auto_15368 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15370 - BLOCK
    )
    :vars
    (
      ?auto_15371 - BLOCK
      ?auto_15372 - BLOCK
      ?auto_15373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15371 ?auto_15370 ) ( CLEAR ?auto_15371 ) ( ON-TABLE ?auto_15370 ) ( not ( = ?auto_15370 ?auto_15371 ) ) ( HOLDING ?auto_15372 ) ( CLEAR ?auto_15373 ) ( not ( = ?auto_15370 ?auto_15372 ) ) ( not ( = ?auto_15370 ?auto_15373 ) ) ( not ( = ?auto_15371 ?auto_15372 ) ) ( not ( = ?auto_15371 ?auto_15373 ) ) ( not ( = ?auto_15372 ?auto_15373 ) ) )
    :subtasks
    ( ( !STACK ?auto_15372 ?auto_15373 )
      ( MAKE-1PILE ?auto_15370 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15374 - BLOCK
    )
    :vars
    (
      ?auto_15377 - BLOCK
      ?auto_15375 - BLOCK
      ?auto_15376 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15377 ?auto_15374 ) ( ON-TABLE ?auto_15374 ) ( not ( = ?auto_15374 ?auto_15377 ) ) ( CLEAR ?auto_15375 ) ( not ( = ?auto_15374 ?auto_15376 ) ) ( not ( = ?auto_15374 ?auto_15375 ) ) ( not ( = ?auto_15377 ?auto_15376 ) ) ( not ( = ?auto_15377 ?auto_15375 ) ) ( not ( = ?auto_15376 ?auto_15375 ) ) ( ON ?auto_15376 ?auto_15377 ) ( CLEAR ?auto_15376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15374 ?auto_15377 )
      ( MAKE-1PILE ?auto_15374 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15378 - BLOCK
    )
    :vars
    (
      ?auto_15381 - BLOCK
      ?auto_15380 - BLOCK
      ?auto_15379 - BLOCK
      ?auto_15382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15381 ?auto_15378 ) ( ON-TABLE ?auto_15378 ) ( not ( = ?auto_15378 ?auto_15381 ) ) ( not ( = ?auto_15378 ?auto_15380 ) ) ( not ( = ?auto_15378 ?auto_15379 ) ) ( not ( = ?auto_15381 ?auto_15380 ) ) ( not ( = ?auto_15381 ?auto_15379 ) ) ( not ( = ?auto_15380 ?auto_15379 ) ) ( ON ?auto_15380 ?auto_15381 ) ( CLEAR ?auto_15380 ) ( HOLDING ?auto_15379 ) ( CLEAR ?auto_15382 ) ( ON-TABLE ?auto_15382 ) ( not ( = ?auto_15382 ?auto_15379 ) ) ( not ( = ?auto_15378 ?auto_15382 ) ) ( not ( = ?auto_15381 ?auto_15382 ) ) ( not ( = ?auto_15380 ?auto_15382 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15382 ?auto_15379 )
      ( MAKE-1PILE ?auto_15378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15606 - BLOCK
    )
    :vars
    (
      ?auto_15607 - BLOCK
      ?auto_15609 - BLOCK
      ?auto_15608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15607 ?auto_15606 ) ( ON-TABLE ?auto_15606 ) ( not ( = ?auto_15606 ?auto_15607 ) ) ( not ( = ?auto_15606 ?auto_15609 ) ) ( not ( = ?auto_15606 ?auto_15608 ) ) ( not ( = ?auto_15607 ?auto_15609 ) ) ( not ( = ?auto_15607 ?auto_15608 ) ) ( not ( = ?auto_15609 ?auto_15608 ) ) ( ON ?auto_15609 ?auto_15607 ) ( ON ?auto_15608 ?auto_15609 ) ( CLEAR ?auto_15608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15606 ?auto_15607 ?auto_15609 )
      ( MAKE-1PILE ?auto_15606 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15388 - BLOCK
    )
    :vars
    (
      ?auto_15389 - BLOCK
      ?auto_15392 - BLOCK
      ?auto_15391 - BLOCK
      ?auto_15390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15389 ?auto_15388 ) ( ON-TABLE ?auto_15388 ) ( not ( = ?auto_15388 ?auto_15389 ) ) ( not ( = ?auto_15388 ?auto_15392 ) ) ( not ( = ?auto_15388 ?auto_15391 ) ) ( not ( = ?auto_15389 ?auto_15392 ) ) ( not ( = ?auto_15389 ?auto_15391 ) ) ( not ( = ?auto_15392 ?auto_15391 ) ) ( ON ?auto_15392 ?auto_15389 ) ( not ( = ?auto_15390 ?auto_15391 ) ) ( not ( = ?auto_15388 ?auto_15390 ) ) ( not ( = ?auto_15389 ?auto_15390 ) ) ( not ( = ?auto_15392 ?auto_15390 ) ) ( ON ?auto_15391 ?auto_15392 ) ( CLEAR ?auto_15391 ) ( HOLDING ?auto_15390 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15390 )
      ( MAKE-1PILE ?auto_15388 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15393 - BLOCK
    )
    :vars
    (
      ?auto_15394 - BLOCK
      ?auto_15397 - BLOCK
      ?auto_15395 - BLOCK
      ?auto_15396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15394 ?auto_15393 ) ( ON-TABLE ?auto_15393 ) ( not ( = ?auto_15393 ?auto_15394 ) ) ( not ( = ?auto_15393 ?auto_15397 ) ) ( not ( = ?auto_15393 ?auto_15395 ) ) ( not ( = ?auto_15394 ?auto_15397 ) ) ( not ( = ?auto_15394 ?auto_15395 ) ) ( not ( = ?auto_15397 ?auto_15395 ) ) ( ON ?auto_15397 ?auto_15394 ) ( not ( = ?auto_15396 ?auto_15395 ) ) ( not ( = ?auto_15393 ?auto_15396 ) ) ( not ( = ?auto_15394 ?auto_15396 ) ) ( not ( = ?auto_15397 ?auto_15396 ) ) ( ON ?auto_15395 ?auto_15397 ) ( ON ?auto_15396 ?auto_15395 ) ( CLEAR ?auto_15396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15393 ?auto_15394 ?auto_15397 ?auto_15395 )
      ( MAKE-1PILE ?auto_15393 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15402 - BLOCK
      ?auto_15403 - BLOCK
      ?auto_15404 - BLOCK
      ?auto_15405 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15405 ) ( CLEAR ?auto_15404 ) ( ON-TABLE ?auto_15402 ) ( ON ?auto_15403 ?auto_15402 ) ( ON ?auto_15404 ?auto_15403 ) ( not ( = ?auto_15402 ?auto_15403 ) ) ( not ( = ?auto_15402 ?auto_15404 ) ) ( not ( = ?auto_15402 ?auto_15405 ) ) ( not ( = ?auto_15403 ?auto_15404 ) ) ( not ( = ?auto_15403 ?auto_15405 ) ) ( not ( = ?auto_15404 ?auto_15405 ) ) )
    :subtasks
    ( ( !STACK ?auto_15405 ?auto_15404 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15406 - BLOCK
      ?auto_15407 - BLOCK
      ?auto_15408 - BLOCK
      ?auto_15409 - BLOCK
    )
    :vars
    (
      ?auto_15410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15408 ) ( ON-TABLE ?auto_15406 ) ( ON ?auto_15407 ?auto_15406 ) ( ON ?auto_15408 ?auto_15407 ) ( not ( = ?auto_15406 ?auto_15407 ) ) ( not ( = ?auto_15406 ?auto_15408 ) ) ( not ( = ?auto_15406 ?auto_15409 ) ) ( not ( = ?auto_15407 ?auto_15408 ) ) ( not ( = ?auto_15407 ?auto_15409 ) ) ( not ( = ?auto_15408 ?auto_15409 ) ) ( ON ?auto_15409 ?auto_15410 ) ( CLEAR ?auto_15409 ) ( HAND-EMPTY ) ( not ( = ?auto_15406 ?auto_15410 ) ) ( not ( = ?auto_15407 ?auto_15410 ) ) ( not ( = ?auto_15408 ?auto_15410 ) ) ( not ( = ?auto_15409 ?auto_15410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15409 ?auto_15410 )
      ( MAKE-4PILE ?auto_15406 ?auto_15407 ?auto_15408 ?auto_15409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15411 - BLOCK
      ?auto_15412 - BLOCK
      ?auto_15413 - BLOCK
      ?auto_15414 - BLOCK
    )
    :vars
    (
      ?auto_15415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15411 ) ( ON ?auto_15412 ?auto_15411 ) ( not ( = ?auto_15411 ?auto_15412 ) ) ( not ( = ?auto_15411 ?auto_15413 ) ) ( not ( = ?auto_15411 ?auto_15414 ) ) ( not ( = ?auto_15412 ?auto_15413 ) ) ( not ( = ?auto_15412 ?auto_15414 ) ) ( not ( = ?auto_15413 ?auto_15414 ) ) ( ON ?auto_15414 ?auto_15415 ) ( CLEAR ?auto_15414 ) ( not ( = ?auto_15411 ?auto_15415 ) ) ( not ( = ?auto_15412 ?auto_15415 ) ) ( not ( = ?auto_15413 ?auto_15415 ) ) ( not ( = ?auto_15414 ?auto_15415 ) ) ( HOLDING ?auto_15413 ) ( CLEAR ?auto_15412 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15411 ?auto_15412 ?auto_15413 )
      ( MAKE-4PILE ?auto_15411 ?auto_15412 ?auto_15413 ?auto_15414 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15416 - BLOCK
      ?auto_15417 - BLOCK
      ?auto_15418 - BLOCK
      ?auto_15419 - BLOCK
    )
    :vars
    (
      ?auto_15420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15416 ) ( ON ?auto_15417 ?auto_15416 ) ( not ( = ?auto_15416 ?auto_15417 ) ) ( not ( = ?auto_15416 ?auto_15418 ) ) ( not ( = ?auto_15416 ?auto_15419 ) ) ( not ( = ?auto_15417 ?auto_15418 ) ) ( not ( = ?auto_15417 ?auto_15419 ) ) ( not ( = ?auto_15418 ?auto_15419 ) ) ( ON ?auto_15419 ?auto_15420 ) ( not ( = ?auto_15416 ?auto_15420 ) ) ( not ( = ?auto_15417 ?auto_15420 ) ) ( not ( = ?auto_15418 ?auto_15420 ) ) ( not ( = ?auto_15419 ?auto_15420 ) ) ( CLEAR ?auto_15417 ) ( ON ?auto_15418 ?auto_15419 ) ( CLEAR ?auto_15418 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15420 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15420 ?auto_15419 )
      ( MAKE-4PILE ?auto_15416 ?auto_15417 ?auto_15418 ?auto_15419 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15421 - BLOCK
      ?auto_15422 - BLOCK
      ?auto_15423 - BLOCK
      ?auto_15424 - BLOCK
    )
    :vars
    (
      ?auto_15425 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15421 ) ( not ( = ?auto_15421 ?auto_15422 ) ) ( not ( = ?auto_15421 ?auto_15423 ) ) ( not ( = ?auto_15421 ?auto_15424 ) ) ( not ( = ?auto_15422 ?auto_15423 ) ) ( not ( = ?auto_15422 ?auto_15424 ) ) ( not ( = ?auto_15423 ?auto_15424 ) ) ( ON ?auto_15424 ?auto_15425 ) ( not ( = ?auto_15421 ?auto_15425 ) ) ( not ( = ?auto_15422 ?auto_15425 ) ) ( not ( = ?auto_15423 ?auto_15425 ) ) ( not ( = ?auto_15424 ?auto_15425 ) ) ( ON ?auto_15423 ?auto_15424 ) ( CLEAR ?auto_15423 ) ( ON-TABLE ?auto_15425 ) ( HOLDING ?auto_15422 ) ( CLEAR ?auto_15421 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15421 ?auto_15422 )
      ( MAKE-4PILE ?auto_15421 ?auto_15422 ?auto_15423 ?auto_15424 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15426 - BLOCK
      ?auto_15427 - BLOCK
      ?auto_15428 - BLOCK
      ?auto_15429 - BLOCK
    )
    :vars
    (
      ?auto_15430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15426 ) ( not ( = ?auto_15426 ?auto_15427 ) ) ( not ( = ?auto_15426 ?auto_15428 ) ) ( not ( = ?auto_15426 ?auto_15429 ) ) ( not ( = ?auto_15427 ?auto_15428 ) ) ( not ( = ?auto_15427 ?auto_15429 ) ) ( not ( = ?auto_15428 ?auto_15429 ) ) ( ON ?auto_15429 ?auto_15430 ) ( not ( = ?auto_15426 ?auto_15430 ) ) ( not ( = ?auto_15427 ?auto_15430 ) ) ( not ( = ?auto_15428 ?auto_15430 ) ) ( not ( = ?auto_15429 ?auto_15430 ) ) ( ON ?auto_15428 ?auto_15429 ) ( ON-TABLE ?auto_15430 ) ( CLEAR ?auto_15426 ) ( ON ?auto_15427 ?auto_15428 ) ( CLEAR ?auto_15427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15430 ?auto_15429 ?auto_15428 )
      ( MAKE-4PILE ?auto_15426 ?auto_15427 ?auto_15428 ?auto_15429 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15431 - BLOCK
      ?auto_15432 - BLOCK
      ?auto_15433 - BLOCK
      ?auto_15434 - BLOCK
    )
    :vars
    (
      ?auto_15435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15431 ?auto_15432 ) ) ( not ( = ?auto_15431 ?auto_15433 ) ) ( not ( = ?auto_15431 ?auto_15434 ) ) ( not ( = ?auto_15432 ?auto_15433 ) ) ( not ( = ?auto_15432 ?auto_15434 ) ) ( not ( = ?auto_15433 ?auto_15434 ) ) ( ON ?auto_15434 ?auto_15435 ) ( not ( = ?auto_15431 ?auto_15435 ) ) ( not ( = ?auto_15432 ?auto_15435 ) ) ( not ( = ?auto_15433 ?auto_15435 ) ) ( not ( = ?auto_15434 ?auto_15435 ) ) ( ON ?auto_15433 ?auto_15434 ) ( ON-TABLE ?auto_15435 ) ( ON ?auto_15432 ?auto_15433 ) ( CLEAR ?auto_15432 ) ( HOLDING ?auto_15431 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15431 )
      ( MAKE-4PILE ?auto_15431 ?auto_15432 ?auto_15433 ?auto_15434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15436 - BLOCK
      ?auto_15437 - BLOCK
      ?auto_15438 - BLOCK
      ?auto_15439 - BLOCK
    )
    :vars
    (
      ?auto_15440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15436 ?auto_15437 ) ) ( not ( = ?auto_15436 ?auto_15438 ) ) ( not ( = ?auto_15436 ?auto_15439 ) ) ( not ( = ?auto_15437 ?auto_15438 ) ) ( not ( = ?auto_15437 ?auto_15439 ) ) ( not ( = ?auto_15438 ?auto_15439 ) ) ( ON ?auto_15439 ?auto_15440 ) ( not ( = ?auto_15436 ?auto_15440 ) ) ( not ( = ?auto_15437 ?auto_15440 ) ) ( not ( = ?auto_15438 ?auto_15440 ) ) ( not ( = ?auto_15439 ?auto_15440 ) ) ( ON ?auto_15438 ?auto_15439 ) ( ON-TABLE ?auto_15440 ) ( ON ?auto_15437 ?auto_15438 ) ( ON ?auto_15436 ?auto_15437 ) ( CLEAR ?auto_15436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15440 ?auto_15439 ?auto_15438 ?auto_15437 )
      ( MAKE-4PILE ?auto_15436 ?auto_15437 ?auto_15438 ?auto_15439 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15481 - BLOCK
    )
    :vars
    (
      ?auto_15482 - BLOCK
      ?auto_15483 - BLOCK
      ?auto_15484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15481 ?auto_15482 ) ( CLEAR ?auto_15481 ) ( not ( = ?auto_15481 ?auto_15482 ) ) ( HOLDING ?auto_15483 ) ( CLEAR ?auto_15484 ) ( not ( = ?auto_15481 ?auto_15483 ) ) ( not ( = ?auto_15481 ?auto_15484 ) ) ( not ( = ?auto_15482 ?auto_15483 ) ) ( not ( = ?auto_15482 ?auto_15484 ) ) ( not ( = ?auto_15483 ?auto_15484 ) ) )
    :subtasks
    ( ( !STACK ?auto_15483 ?auto_15484 )
      ( MAKE-1PILE ?auto_15481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15485 - BLOCK
    )
    :vars
    (
      ?auto_15487 - BLOCK
      ?auto_15486 - BLOCK
      ?auto_15488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15485 ?auto_15487 ) ( not ( = ?auto_15485 ?auto_15487 ) ) ( CLEAR ?auto_15486 ) ( not ( = ?auto_15485 ?auto_15488 ) ) ( not ( = ?auto_15485 ?auto_15486 ) ) ( not ( = ?auto_15487 ?auto_15488 ) ) ( not ( = ?auto_15487 ?auto_15486 ) ) ( not ( = ?auto_15488 ?auto_15486 ) ) ( ON ?auto_15488 ?auto_15485 ) ( CLEAR ?auto_15488 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15487 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15487 ?auto_15485 )
      ( MAKE-1PILE ?auto_15485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15489 - BLOCK
    )
    :vars
    (
      ?auto_15490 - BLOCK
      ?auto_15491 - BLOCK
      ?auto_15492 - BLOCK
      ?auto_15493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15489 ?auto_15490 ) ( not ( = ?auto_15489 ?auto_15490 ) ) ( not ( = ?auto_15489 ?auto_15491 ) ) ( not ( = ?auto_15489 ?auto_15492 ) ) ( not ( = ?auto_15490 ?auto_15491 ) ) ( not ( = ?auto_15490 ?auto_15492 ) ) ( not ( = ?auto_15491 ?auto_15492 ) ) ( ON ?auto_15491 ?auto_15489 ) ( CLEAR ?auto_15491 ) ( ON-TABLE ?auto_15490 ) ( HOLDING ?auto_15492 ) ( CLEAR ?auto_15493 ) ( ON-TABLE ?auto_15493 ) ( not ( = ?auto_15493 ?auto_15492 ) ) ( not ( = ?auto_15489 ?auto_15493 ) ) ( not ( = ?auto_15490 ?auto_15493 ) ) ( not ( = ?auto_15491 ?auto_15493 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15493 ?auto_15492 )
      ( MAKE-1PILE ?auto_15489 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15494 - BLOCK
    )
    :vars
    (
      ?auto_15498 - BLOCK
      ?auto_15497 - BLOCK
      ?auto_15495 - BLOCK
      ?auto_15496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15494 ?auto_15498 ) ( not ( = ?auto_15494 ?auto_15498 ) ) ( not ( = ?auto_15494 ?auto_15497 ) ) ( not ( = ?auto_15494 ?auto_15495 ) ) ( not ( = ?auto_15498 ?auto_15497 ) ) ( not ( = ?auto_15498 ?auto_15495 ) ) ( not ( = ?auto_15497 ?auto_15495 ) ) ( ON ?auto_15497 ?auto_15494 ) ( ON-TABLE ?auto_15498 ) ( CLEAR ?auto_15496 ) ( ON-TABLE ?auto_15496 ) ( not ( = ?auto_15496 ?auto_15495 ) ) ( not ( = ?auto_15494 ?auto_15496 ) ) ( not ( = ?auto_15498 ?auto_15496 ) ) ( not ( = ?auto_15497 ?auto_15496 ) ) ( ON ?auto_15495 ?auto_15497 ) ( CLEAR ?auto_15495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15498 ?auto_15494 ?auto_15497 )
      ( MAKE-1PILE ?auto_15494 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15499 - BLOCK
    )
    :vars
    (
      ?auto_15500 - BLOCK
      ?auto_15501 - BLOCK
      ?auto_15502 - BLOCK
      ?auto_15503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15499 ?auto_15500 ) ( not ( = ?auto_15499 ?auto_15500 ) ) ( not ( = ?auto_15499 ?auto_15501 ) ) ( not ( = ?auto_15499 ?auto_15502 ) ) ( not ( = ?auto_15500 ?auto_15501 ) ) ( not ( = ?auto_15500 ?auto_15502 ) ) ( not ( = ?auto_15501 ?auto_15502 ) ) ( ON ?auto_15501 ?auto_15499 ) ( ON-TABLE ?auto_15500 ) ( not ( = ?auto_15503 ?auto_15502 ) ) ( not ( = ?auto_15499 ?auto_15503 ) ) ( not ( = ?auto_15500 ?auto_15503 ) ) ( not ( = ?auto_15501 ?auto_15503 ) ) ( ON ?auto_15502 ?auto_15501 ) ( CLEAR ?auto_15502 ) ( HOLDING ?auto_15503 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15503 )
      ( MAKE-1PILE ?auto_15499 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15504 - BLOCK
    )
    :vars
    (
      ?auto_15508 - BLOCK
      ?auto_15506 - BLOCK
      ?auto_15505 - BLOCK
      ?auto_15507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15504 ?auto_15508 ) ( not ( = ?auto_15504 ?auto_15508 ) ) ( not ( = ?auto_15504 ?auto_15506 ) ) ( not ( = ?auto_15504 ?auto_15505 ) ) ( not ( = ?auto_15508 ?auto_15506 ) ) ( not ( = ?auto_15508 ?auto_15505 ) ) ( not ( = ?auto_15506 ?auto_15505 ) ) ( ON ?auto_15506 ?auto_15504 ) ( ON-TABLE ?auto_15508 ) ( not ( = ?auto_15507 ?auto_15505 ) ) ( not ( = ?auto_15504 ?auto_15507 ) ) ( not ( = ?auto_15508 ?auto_15507 ) ) ( not ( = ?auto_15506 ?auto_15507 ) ) ( ON ?auto_15505 ?auto_15506 ) ( ON ?auto_15507 ?auto_15505 ) ( CLEAR ?auto_15507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15508 ?auto_15504 ?auto_15506 ?auto_15505 )
      ( MAKE-1PILE ?auto_15504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15514 - BLOCK
      ?auto_15515 - BLOCK
    )
    :vars
    (
      ?auto_15516 - BLOCK
      ?auto_15517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15516 ?auto_15515 ) ( CLEAR ?auto_15516 ) ( ON-TABLE ?auto_15514 ) ( ON ?auto_15515 ?auto_15514 ) ( not ( = ?auto_15514 ?auto_15515 ) ) ( not ( = ?auto_15514 ?auto_15516 ) ) ( not ( = ?auto_15515 ?auto_15516 ) ) ( HOLDING ?auto_15517 ) ( not ( = ?auto_15514 ?auto_15517 ) ) ( not ( = ?auto_15515 ?auto_15517 ) ) ( not ( = ?auto_15516 ?auto_15517 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15517 )
      ( MAKE-2PILE ?auto_15514 ?auto_15515 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15551 - BLOCK
      ?auto_15552 - BLOCK
    )
    :vars
    (
      ?auto_15553 - BLOCK
      ?auto_15554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15551 ?auto_15552 ) ) ( ON ?auto_15552 ?auto_15553 ) ( not ( = ?auto_15551 ?auto_15553 ) ) ( not ( = ?auto_15552 ?auto_15553 ) ) ( ON ?auto_15551 ?auto_15552 ) ( CLEAR ?auto_15551 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15554 ) ( ON ?auto_15553 ?auto_15554 ) ( not ( = ?auto_15554 ?auto_15553 ) ) ( not ( = ?auto_15554 ?auto_15552 ) ) ( not ( = ?auto_15554 ?auto_15551 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15554 ?auto_15553 ?auto_15552 )
      ( MAKE-2PILE ?auto_15551 ?auto_15552 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15557 - BLOCK
      ?auto_15558 - BLOCK
    )
    :vars
    (
      ?auto_15559 - BLOCK
      ?auto_15560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15557 ?auto_15558 ) ) ( ON ?auto_15558 ?auto_15559 ) ( CLEAR ?auto_15558 ) ( not ( = ?auto_15557 ?auto_15559 ) ) ( not ( = ?auto_15558 ?auto_15559 ) ) ( ON ?auto_15557 ?auto_15560 ) ( CLEAR ?auto_15557 ) ( HAND-EMPTY ) ( not ( = ?auto_15557 ?auto_15560 ) ) ( not ( = ?auto_15558 ?auto_15560 ) ) ( not ( = ?auto_15559 ?auto_15560 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15557 ?auto_15560 )
      ( MAKE-2PILE ?auto_15557 ?auto_15558 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15561 - BLOCK
      ?auto_15562 - BLOCK
    )
    :vars
    (
      ?auto_15564 - BLOCK
      ?auto_15563 - BLOCK
      ?auto_15565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15561 ?auto_15562 ) ) ( not ( = ?auto_15561 ?auto_15564 ) ) ( not ( = ?auto_15562 ?auto_15564 ) ) ( ON ?auto_15561 ?auto_15563 ) ( CLEAR ?auto_15561 ) ( not ( = ?auto_15561 ?auto_15563 ) ) ( not ( = ?auto_15562 ?auto_15563 ) ) ( not ( = ?auto_15564 ?auto_15563 ) ) ( HOLDING ?auto_15562 ) ( CLEAR ?auto_15564 ) ( ON-TABLE ?auto_15565 ) ( ON ?auto_15564 ?auto_15565 ) ( not ( = ?auto_15565 ?auto_15564 ) ) ( not ( = ?auto_15565 ?auto_15562 ) ) ( not ( = ?auto_15561 ?auto_15565 ) ) ( not ( = ?auto_15563 ?auto_15565 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15565 ?auto_15564 ?auto_15562 )
      ( MAKE-2PILE ?auto_15561 ?auto_15562 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15566 - BLOCK
      ?auto_15567 - BLOCK
    )
    :vars
    (
      ?auto_15568 - BLOCK
      ?auto_15569 - BLOCK
      ?auto_15570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15566 ?auto_15567 ) ) ( not ( = ?auto_15566 ?auto_15568 ) ) ( not ( = ?auto_15567 ?auto_15568 ) ) ( ON ?auto_15566 ?auto_15569 ) ( not ( = ?auto_15566 ?auto_15569 ) ) ( not ( = ?auto_15567 ?auto_15569 ) ) ( not ( = ?auto_15568 ?auto_15569 ) ) ( CLEAR ?auto_15568 ) ( ON-TABLE ?auto_15570 ) ( ON ?auto_15568 ?auto_15570 ) ( not ( = ?auto_15570 ?auto_15568 ) ) ( not ( = ?auto_15570 ?auto_15567 ) ) ( not ( = ?auto_15566 ?auto_15570 ) ) ( not ( = ?auto_15569 ?auto_15570 ) ) ( ON ?auto_15567 ?auto_15566 ) ( CLEAR ?auto_15567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15569 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15569 ?auto_15566 )
      ( MAKE-2PILE ?auto_15566 ?auto_15567 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15571 - BLOCK
      ?auto_15572 - BLOCK
    )
    :vars
    (
      ?auto_15574 - BLOCK
      ?auto_15573 - BLOCK
      ?auto_15575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15571 ?auto_15572 ) ) ( not ( = ?auto_15571 ?auto_15574 ) ) ( not ( = ?auto_15572 ?auto_15574 ) ) ( ON ?auto_15571 ?auto_15573 ) ( not ( = ?auto_15571 ?auto_15573 ) ) ( not ( = ?auto_15572 ?auto_15573 ) ) ( not ( = ?auto_15574 ?auto_15573 ) ) ( ON-TABLE ?auto_15575 ) ( not ( = ?auto_15575 ?auto_15574 ) ) ( not ( = ?auto_15575 ?auto_15572 ) ) ( not ( = ?auto_15571 ?auto_15575 ) ) ( not ( = ?auto_15573 ?auto_15575 ) ) ( ON ?auto_15572 ?auto_15571 ) ( CLEAR ?auto_15572 ) ( ON-TABLE ?auto_15573 ) ( HOLDING ?auto_15574 ) ( CLEAR ?auto_15575 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15575 ?auto_15574 )
      ( MAKE-2PILE ?auto_15571 ?auto_15572 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15576 - BLOCK
      ?auto_15577 - BLOCK
    )
    :vars
    (
      ?auto_15578 - BLOCK
      ?auto_15579 - BLOCK
      ?auto_15580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15576 ?auto_15577 ) ) ( not ( = ?auto_15576 ?auto_15578 ) ) ( not ( = ?auto_15577 ?auto_15578 ) ) ( ON ?auto_15576 ?auto_15579 ) ( not ( = ?auto_15576 ?auto_15579 ) ) ( not ( = ?auto_15577 ?auto_15579 ) ) ( not ( = ?auto_15578 ?auto_15579 ) ) ( ON-TABLE ?auto_15580 ) ( not ( = ?auto_15580 ?auto_15578 ) ) ( not ( = ?auto_15580 ?auto_15577 ) ) ( not ( = ?auto_15576 ?auto_15580 ) ) ( not ( = ?auto_15579 ?auto_15580 ) ) ( ON ?auto_15577 ?auto_15576 ) ( ON-TABLE ?auto_15579 ) ( CLEAR ?auto_15580 ) ( ON ?auto_15578 ?auto_15577 ) ( CLEAR ?auto_15578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15579 ?auto_15576 ?auto_15577 )
      ( MAKE-2PILE ?auto_15576 ?auto_15577 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15581 - BLOCK
      ?auto_15582 - BLOCK
    )
    :vars
    (
      ?auto_15585 - BLOCK
      ?auto_15583 - BLOCK
      ?auto_15584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15581 ?auto_15582 ) ) ( not ( = ?auto_15581 ?auto_15585 ) ) ( not ( = ?auto_15582 ?auto_15585 ) ) ( ON ?auto_15581 ?auto_15583 ) ( not ( = ?auto_15581 ?auto_15583 ) ) ( not ( = ?auto_15582 ?auto_15583 ) ) ( not ( = ?auto_15585 ?auto_15583 ) ) ( not ( = ?auto_15584 ?auto_15585 ) ) ( not ( = ?auto_15584 ?auto_15582 ) ) ( not ( = ?auto_15581 ?auto_15584 ) ) ( not ( = ?auto_15583 ?auto_15584 ) ) ( ON ?auto_15582 ?auto_15581 ) ( ON-TABLE ?auto_15583 ) ( ON ?auto_15585 ?auto_15582 ) ( CLEAR ?auto_15585 ) ( HOLDING ?auto_15584 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15584 )
      ( MAKE-2PILE ?auto_15581 ?auto_15582 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15586 - BLOCK
      ?auto_15587 - BLOCK
    )
    :vars
    (
      ?auto_15590 - BLOCK
      ?auto_15589 - BLOCK
      ?auto_15588 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15586 ?auto_15587 ) ) ( not ( = ?auto_15586 ?auto_15590 ) ) ( not ( = ?auto_15587 ?auto_15590 ) ) ( ON ?auto_15586 ?auto_15589 ) ( not ( = ?auto_15586 ?auto_15589 ) ) ( not ( = ?auto_15587 ?auto_15589 ) ) ( not ( = ?auto_15590 ?auto_15589 ) ) ( not ( = ?auto_15588 ?auto_15590 ) ) ( not ( = ?auto_15588 ?auto_15587 ) ) ( not ( = ?auto_15586 ?auto_15588 ) ) ( not ( = ?auto_15589 ?auto_15588 ) ) ( ON ?auto_15587 ?auto_15586 ) ( ON-TABLE ?auto_15589 ) ( ON ?auto_15590 ?auto_15587 ) ( ON ?auto_15588 ?auto_15590 ) ( CLEAR ?auto_15588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15589 ?auto_15586 ?auto_15587 ?auto_15590 )
      ( MAKE-2PILE ?auto_15586 ?auto_15587 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15602 - BLOCK
    )
    :vars
    (
      ?auto_15605 - BLOCK
      ?auto_15603 - BLOCK
      ?auto_15604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15605 ?auto_15602 ) ( ON-TABLE ?auto_15602 ) ( not ( = ?auto_15602 ?auto_15605 ) ) ( not ( = ?auto_15602 ?auto_15603 ) ) ( not ( = ?auto_15602 ?auto_15604 ) ) ( not ( = ?auto_15605 ?auto_15603 ) ) ( not ( = ?auto_15605 ?auto_15604 ) ) ( not ( = ?auto_15603 ?auto_15604 ) ) ( ON ?auto_15603 ?auto_15605 ) ( CLEAR ?auto_15603 ) ( HOLDING ?auto_15604 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15604 )
      ( MAKE-1PILE ?auto_15602 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15635 - BLOCK
      ?auto_15636 - BLOCK
      ?auto_15637 - BLOCK
    )
    :vars
    (
      ?auto_15638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15635 ) ( not ( = ?auto_15635 ?auto_15636 ) ) ( not ( = ?auto_15635 ?auto_15637 ) ) ( not ( = ?auto_15636 ?auto_15637 ) ) ( ON ?auto_15637 ?auto_15638 ) ( not ( = ?auto_15635 ?auto_15638 ) ) ( not ( = ?auto_15636 ?auto_15638 ) ) ( not ( = ?auto_15637 ?auto_15638 ) ) ( CLEAR ?auto_15635 ) ( ON ?auto_15636 ?auto_15637 ) ( CLEAR ?auto_15636 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15638 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15638 ?auto_15637 )
      ( MAKE-3PILE ?auto_15635 ?auto_15636 ?auto_15637 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15639 - BLOCK
      ?auto_15640 - BLOCK
      ?auto_15641 - BLOCK
    )
    :vars
    (
      ?auto_15642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15639 ?auto_15640 ) ) ( not ( = ?auto_15639 ?auto_15641 ) ) ( not ( = ?auto_15640 ?auto_15641 ) ) ( ON ?auto_15641 ?auto_15642 ) ( not ( = ?auto_15639 ?auto_15642 ) ) ( not ( = ?auto_15640 ?auto_15642 ) ) ( not ( = ?auto_15641 ?auto_15642 ) ) ( ON ?auto_15640 ?auto_15641 ) ( CLEAR ?auto_15640 ) ( ON-TABLE ?auto_15642 ) ( HOLDING ?auto_15639 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15639 )
      ( MAKE-3PILE ?auto_15639 ?auto_15640 ?auto_15641 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15643 - BLOCK
      ?auto_15644 - BLOCK
      ?auto_15645 - BLOCK
    )
    :vars
    (
      ?auto_15646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15643 ?auto_15644 ) ) ( not ( = ?auto_15643 ?auto_15645 ) ) ( not ( = ?auto_15644 ?auto_15645 ) ) ( ON ?auto_15645 ?auto_15646 ) ( not ( = ?auto_15643 ?auto_15646 ) ) ( not ( = ?auto_15644 ?auto_15646 ) ) ( not ( = ?auto_15645 ?auto_15646 ) ) ( ON ?auto_15644 ?auto_15645 ) ( ON-TABLE ?auto_15646 ) ( ON ?auto_15643 ?auto_15644 ) ( CLEAR ?auto_15643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15646 ?auto_15645 ?auto_15644 )
      ( MAKE-3PILE ?auto_15643 ?auto_15644 ?auto_15645 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15650 - BLOCK
      ?auto_15651 - BLOCK
      ?auto_15652 - BLOCK
    )
    :vars
    (
      ?auto_15653 - BLOCK
      ?auto_15654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15650 ?auto_15651 ) ) ( not ( = ?auto_15650 ?auto_15652 ) ) ( not ( = ?auto_15651 ?auto_15652 ) ) ( ON ?auto_15652 ?auto_15653 ) ( not ( = ?auto_15650 ?auto_15653 ) ) ( not ( = ?auto_15651 ?auto_15653 ) ) ( not ( = ?auto_15652 ?auto_15653 ) ) ( ON ?auto_15651 ?auto_15652 ) ( CLEAR ?auto_15651 ) ( ON-TABLE ?auto_15653 ) ( ON ?auto_15650 ?auto_15654 ) ( CLEAR ?auto_15650 ) ( HAND-EMPTY ) ( not ( = ?auto_15650 ?auto_15654 ) ) ( not ( = ?auto_15651 ?auto_15654 ) ) ( not ( = ?auto_15652 ?auto_15654 ) ) ( not ( = ?auto_15653 ?auto_15654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15650 ?auto_15654 )
      ( MAKE-3PILE ?auto_15650 ?auto_15651 ?auto_15652 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15655 - BLOCK
      ?auto_15656 - BLOCK
      ?auto_15657 - BLOCK
    )
    :vars
    (
      ?auto_15659 - BLOCK
      ?auto_15658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15655 ?auto_15656 ) ) ( not ( = ?auto_15655 ?auto_15657 ) ) ( not ( = ?auto_15656 ?auto_15657 ) ) ( ON ?auto_15657 ?auto_15659 ) ( not ( = ?auto_15655 ?auto_15659 ) ) ( not ( = ?auto_15656 ?auto_15659 ) ) ( not ( = ?auto_15657 ?auto_15659 ) ) ( ON-TABLE ?auto_15659 ) ( ON ?auto_15655 ?auto_15658 ) ( CLEAR ?auto_15655 ) ( not ( = ?auto_15655 ?auto_15658 ) ) ( not ( = ?auto_15656 ?auto_15658 ) ) ( not ( = ?auto_15657 ?auto_15658 ) ) ( not ( = ?auto_15659 ?auto_15658 ) ) ( HOLDING ?auto_15656 ) ( CLEAR ?auto_15657 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15659 ?auto_15657 ?auto_15656 )
      ( MAKE-3PILE ?auto_15655 ?auto_15656 ?auto_15657 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15660 - BLOCK
      ?auto_15661 - BLOCK
      ?auto_15662 - BLOCK
    )
    :vars
    (
      ?auto_15664 - BLOCK
      ?auto_15663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15660 ?auto_15661 ) ) ( not ( = ?auto_15660 ?auto_15662 ) ) ( not ( = ?auto_15661 ?auto_15662 ) ) ( ON ?auto_15662 ?auto_15664 ) ( not ( = ?auto_15660 ?auto_15664 ) ) ( not ( = ?auto_15661 ?auto_15664 ) ) ( not ( = ?auto_15662 ?auto_15664 ) ) ( ON-TABLE ?auto_15664 ) ( ON ?auto_15660 ?auto_15663 ) ( not ( = ?auto_15660 ?auto_15663 ) ) ( not ( = ?auto_15661 ?auto_15663 ) ) ( not ( = ?auto_15662 ?auto_15663 ) ) ( not ( = ?auto_15664 ?auto_15663 ) ) ( CLEAR ?auto_15662 ) ( ON ?auto_15661 ?auto_15660 ) ( CLEAR ?auto_15661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15663 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15663 ?auto_15660 )
      ( MAKE-3PILE ?auto_15660 ?auto_15661 ?auto_15662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15665 - BLOCK
      ?auto_15666 - BLOCK
      ?auto_15667 - BLOCK
    )
    :vars
    (
      ?auto_15668 - BLOCK
      ?auto_15669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15665 ?auto_15666 ) ) ( not ( = ?auto_15665 ?auto_15667 ) ) ( not ( = ?auto_15666 ?auto_15667 ) ) ( not ( = ?auto_15665 ?auto_15668 ) ) ( not ( = ?auto_15666 ?auto_15668 ) ) ( not ( = ?auto_15667 ?auto_15668 ) ) ( ON-TABLE ?auto_15668 ) ( ON ?auto_15665 ?auto_15669 ) ( not ( = ?auto_15665 ?auto_15669 ) ) ( not ( = ?auto_15666 ?auto_15669 ) ) ( not ( = ?auto_15667 ?auto_15669 ) ) ( not ( = ?auto_15668 ?auto_15669 ) ) ( ON ?auto_15666 ?auto_15665 ) ( CLEAR ?auto_15666 ) ( ON-TABLE ?auto_15669 ) ( HOLDING ?auto_15667 ) ( CLEAR ?auto_15668 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15668 ?auto_15667 )
      ( MAKE-3PILE ?auto_15665 ?auto_15666 ?auto_15667 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15670 - BLOCK
      ?auto_15671 - BLOCK
      ?auto_15672 - BLOCK
    )
    :vars
    (
      ?auto_15673 - BLOCK
      ?auto_15674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15670 ?auto_15671 ) ) ( not ( = ?auto_15670 ?auto_15672 ) ) ( not ( = ?auto_15671 ?auto_15672 ) ) ( not ( = ?auto_15670 ?auto_15673 ) ) ( not ( = ?auto_15671 ?auto_15673 ) ) ( not ( = ?auto_15672 ?auto_15673 ) ) ( ON-TABLE ?auto_15673 ) ( ON ?auto_15670 ?auto_15674 ) ( not ( = ?auto_15670 ?auto_15674 ) ) ( not ( = ?auto_15671 ?auto_15674 ) ) ( not ( = ?auto_15672 ?auto_15674 ) ) ( not ( = ?auto_15673 ?auto_15674 ) ) ( ON ?auto_15671 ?auto_15670 ) ( ON-TABLE ?auto_15674 ) ( CLEAR ?auto_15673 ) ( ON ?auto_15672 ?auto_15671 ) ( CLEAR ?auto_15672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15674 ?auto_15670 ?auto_15671 )
      ( MAKE-3PILE ?auto_15670 ?auto_15671 ?auto_15672 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15675 - BLOCK
      ?auto_15676 - BLOCK
      ?auto_15677 - BLOCK
    )
    :vars
    (
      ?auto_15678 - BLOCK
      ?auto_15679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15675 ?auto_15676 ) ) ( not ( = ?auto_15675 ?auto_15677 ) ) ( not ( = ?auto_15676 ?auto_15677 ) ) ( not ( = ?auto_15675 ?auto_15678 ) ) ( not ( = ?auto_15676 ?auto_15678 ) ) ( not ( = ?auto_15677 ?auto_15678 ) ) ( ON ?auto_15675 ?auto_15679 ) ( not ( = ?auto_15675 ?auto_15679 ) ) ( not ( = ?auto_15676 ?auto_15679 ) ) ( not ( = ?auto_15677 ?auto_15679 ) ) ( not ( = ?auto_15678 ?auto_15679 ) ) ( ON ?auto_15676 ?auto_15675 ) ( ON-TABLE ?auto_15679 ) ( ON ?auto_15677 ?auto_15676 ) ( CLEAR ?auto_15677 ) ( HOLDING ?auto_15678 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15678 )
      ( MAKE-3PILE ?auto_15675 ?auto_15676 ?auto_15677 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15680 - BLOCK
      ?auto_15681 - BLOCK
      ?auto_15682 - BLOCK
    )
    :vars
    (
      ?auto_15683 - BLOCK
      ?auto_15684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15680 ?auto_15681 ) ) ( not ( = ?auto_15680 ?auto_15682 ) ) ( not ( = ?auto_15681 ?auto_15682 ) ) ( not ( = ?auto_15680 ?auto_15683 ) ) ( not ( = ?auto_15681 ?auto_15683 ) ) ( not ( = ?auto_15682 ?auto_15683 ) ) ( ON ?auto_15680 ?auto_15684 ) ( not ( = ?auto_15680 ?auto_15684 ) ) ( not ( = ?auto_15681 ?auto_15684 ) ) ( not ( = ?auto_15682 ?auto_15684 ) ) ( not ( = ?auto_15683 ?auto_15684 ) ) ( ON ?auto_15681 ?auto_15680 ) ( ON-TABLE ?auto_15684 ) ( ON ?auto_15682 ?auto_15681 ) ( ON ?auto_15683 ?auto_15682 ) ( CLEAR ?auto_15683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15684 ?auto_15680 ?auto_15681 ?auto_15682 )
      ( MAKE-3PILE ?auto_15680 ?auto_15681 ?auto_15682 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15693 - BLOCK
      ?auto_15694 - BLOCK
      ?auto_15695 - BLOCK
      ?auto_15696 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15695 ) ( ON-TABLE ?auto_15693 ) ( ON ?auto_15694 ?auto_15693 ) ( ON ?auto_15695 ?auto_15694 ) ( not ( = ?auto_15693 ?auto_15694 ) ) ( not ( = ?auto_15693 ?auto_15695 ) ) ( not ( = ?auto_15693 ?auto_15696 ) ) ( not ( = ?auto_15694 ?auto_15695 ) ) ( not ( = ?auto_15694 ?auto_15696 ) ) ( not ( = ?auto_15695 ?auto_15696 ) ) ( ON-TABLE ?auto_15696 ) ( CLEAR ?auto_15696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_15696 )
      ( MAKE-4PILE ?auto_15693 ?auto_15694 ?auto_15695 ?auto_15696 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15697 - BLOCK
      ?auto_15698 - BLOCK
      ?auto_15699 - BLOCK
      ?auto_15700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15697 ) ( ON ?auto_15698 ?auto_15697 ) ( not ( = ?auto_15697 ?auto_15698 ) ) ( not ( = ?auto_15697 ?auto_15699 ) ) ( not ( = ?auto_15697 ?auto_15700 ) ) ( not ( = ?auto_15698 ?auto_15699 ) ) ( not ( = ?auto_15698 ?auto_15700 ) ) ( not ( = ?auto_15699 ?auto_15700 ) ) ( ON-TABLE ?auto_15700 ) ( CLEAR ?auto_15700 ) ( HOLDING ?auto_15699 ) ( CLEAR ?auto_15698 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15697 ?auto_15698 ?auto_15699 )
      ( MAKE-4PILE ?auto_15697 ?auto_15698 ?auto_15699 ?auto_15700 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15701 - BLOCK
      ?auto_15702 - BLOCK
      ?auto_15703 - BLOCK
      ?auto_15704 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15701 ) ( ON ?auto_15702 ?auto_15701 ) ( not ( = ?auto_15701 ?auto_15702 ) ) ( not ( = ?auto_15701 ?auto_15703 ) ) ( not ( = ?auto_15701 ?auto_15704 ) ) ( not ( = ?auto_15702 ?auto_15703 ) ) ( not ( = ?auto_15702 ?auto_15704 ) ) ( not ( = ?auto_15703 ?auto_15704 ) ) ( ON-TABLE ?auto_15704 ) ( CLEAR ?auto_15702 ) ( ON ?auto_15703 ?auto_15704 ) ( CLEAR ?auto_15703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15704 )
      ( MAKE-4PILE ?auto_15701 ?auto_15702 ?auto_15703 ?auto_15704 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15705 - BLOCK
      ?auto_15706 - BLOCK
      ?auto_15707 - BLOCK
      ?auto_15708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15705 ) ( not ( = ?auto_15705 ?auto_15706 ) ) ( not ( = ?auto_15705 ?auto_15707 ) ) ( not ( = ?auto_15705 ?auto_15708 ) ) ( not ( = ?auto_15706 ?auto_15707 ) ) ( not ( = ?auto_15706 ?auto_15708 ) ) ( not ( = ?auto_15707 ?auto_15708 ) ) ( ON-TABLE ?auto_15708 ) ( ON ?auto_15707 ?auto_15708 ) ( CLEAR ?auto_15707 ) ( HOLDING ?auto_15706 ) ( CLEAR ?auto_15705 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15705 ?auto_15706 )
      ( MAKE-4PILE ?auto_15705 ?auto_15706 ?auto_15707 ?auto_15708 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15709 - BLOCK
      ?auto_15710 - BLOCK
      ?auto_15711 - BLOCK
      ?auto_15712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15709 ) ( not ( = ?auto_15709 ?auto_15710 ) ) ( not ( = ?auto_15709 ?auto_15711 ) ) ( not ( = ?auto_15709 ?auto_15712 ) ) ( not ( = ?auto_15710 ?auto_15711 ) ) ( not ( = ?auto_15710 ?auto_15712 ) ) ( not ( = ?auto_15711 ?auto_15712 ) ) ( ON-TABLE ?auto_15712 ) ( ON ?auto_15711 ?auto_15712 ) ( CLEAR ?auto_15709 ) ( ON ?auto_15710 ?auto_15711 ) ( CLEAR ?auto_15710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15712 ?auto_15711 )
      ( MAKE-4PILE ?auto_15709 ?auto_15710 ?auto_15711 ?auto_15712 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15713 - BLOCK
      ?auto_15714 - BLOCK
      ?auto_15715 - BLOCK
      ?auto_15716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15713 ?auto_15714 ) ) ( not ( = ?auto_15713 ?auto_15715 ) ) ( not ( = ?auto_15713 ?auto_15716 ) ) ( not ( = ?auto_15714 ?auto_15715 ) ) ( not ( = ?auto_15714 ?auto_15716 ) ) ( not ( = ?auto_15715 ?auto_15716 ) ) ( ON-TABLE ?auto_15716 ) ( ON ?auto_15715 ?auto_15716 ) ( ON ?auto_15714 ?auto_15715 ) ( CLEAR ?auto_15714 ) ( HOLDING ?auto_15713 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15713 )
      ( MAKE-4PILE ?auto_15713 ?auto_15714 ?auto_15715 ?auto_15716 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15717 - BLOCK
      ?auto_15718 - BLOCK
      ?auto_15719 - BLOCK
      ?auto_15720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15717 ?auto_15718 ) ) ( not ( = ?auto_15717 ?auto_15719 ) ) ( not ( = ?auto_15717 ?auto_15720 ) ) ( not ( = ?auto_15718 ?auto_15719 ) ) ( not ( = ?auto_15718 ?auto_15720 ) ) ( not ( = ?auto_15719 ?auto_15720 ) ) ( ON-TABLE ?auto_15720 ) ( ON ?auto_15719 ?auto_15720 ) ( ON ?auto_15718 ?auto_15719 ) ( ON ?auto_15717 ?auto_15718 ) ( CLEAR ?auto_15717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15720 ?auto_15719 ?auto_15718 )
      ( MAKE-4PILE ?auto_15717 ?auto_15718 ?auto_15719 ?auto_15720 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15725 - BLOCK
      ?auto_15726 - BLOCK
      ?auto_15727 - BLOCK
      ?auto_15728 - BLOCK
    )
    :vars
    (
      ?auto_15729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15725 ?auto_15726 ) ) ( not ( = ?auto_15725 ?auto_15727 ) ) ( not ( = ?auto_15725 ?auto_15728 ) ) ( not ( = ?auto_15726 ?auto_15727 ) ) ( not ( = ?auto_15726 ?auto_15728 ) ) ( not ( = ?auto_15727 ?auto_15728 ) ) ( ON-TABLE ?auto_15728 ) ( ON ?auto_15727 ?auto_15728 ) ( ON ?auto_15726 ?auto_15727 ) ( CLEAR ?auto_15726 ) ( ON ?auto_15725 ?auto_15729 ) ( CLEAR ?auto_15725 ) ( HAND-EMPTY ) ( not ( = ?auto_15725 ?auto_15729 ) ) ( not ( = ?auto_15726 ?auto_15729 ) ) ( not ( = ?auto_15727 ?auto_15729 ) ) ( not ( = ?auto_15728 ?auto_15729 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15725 ?auto_15729 )
      ( MAKE-4PILE ?auto_15725 ?auto_15726 ?auto_15727 ?auto_15728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15730 - BLOCK
      ?auto_15731 - BLOCK
      ?auto_15732 - BLOCK
      ?auto_15733 - BLOCK
    )
    :vars
    (
      ?auto_15734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15730 ?auto_15731 ) ) ( not ( = ?auto_15730 ?auto_15732 ) ) ( not ( = ?auto_15730 ?auto_15733 ) ) ( not ( = ?auto_15731 ?auto_15732 ) ) ( not ( = ?auto_15731 ?auto_15733 ) ) ( not ( = ?auto_15732 ?auto_15733 ) ) ( ON-TABLE ?auto_15733 ) ( ON ?auto_15732 ?auto_15733 ) ( ON ?auto_15730 ?auto_15734 ) ( CLEAR ?auto_15730 ) ( not ( = ?auto_15730 ?auto_15734 ) ) ( not ( = ?auto_15731 ?auto_15734 ) ) ( not ( = ?auto_15732 ?auto_15734 ) ) ( not ( = ?auto_15733 ?auto_15734 ) ) ( HOLDING ?auto_15731 ) ( CLEAR ?auto_15732 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15733 ?auto_15732 ?auto_15731 )
      ( MAKE-4PILE ?auto_15730 ?auto_15731 ?auto_15732 ?auto_15733 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15735 - BLOCK
      ?auto_15736 - BLOCK
      ?auto_15737 - BLOCK
      ?auto_15738 - BLOCK
    )
    :vars
    (
      ?auto_15739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15735 ?auto_15736 ) ) ( not ( = ?auto_15735 ?auto_15737 ) ) ( not ( = ?auto_15735 ?auto_15738 ) ) ( not ( = ?auto_15736 ?auto_15737 ) ) ( not ( = ?auto_15736 ?auto_15738 ) ) ( not ( = ?auto_15737 ?auto_15738 ) ) ( ON-TABLE ?auto_15738 ) ( ON ?auto_15737 ?auto_15738 ) ( ON ?auto_15735 ?auto_15739 ) ( not ( = ?auto_15735 ?auto_15739 ) ) ( not ( = ?auto_15736 ?auto_15739 ) ) ( not ( = ?auto_15737 ?auto_15739 ) ) ( not ( = ?auto_15738 ?auto_15739 ) ) ( CLEAR ?auto_15737 ) ( ON ?auto_15736 ?auto_15735 ) ( CLEAR ?auto_15736 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15739 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15739 ?auto_15735 )
      ( MAKE-4PILE ?auto_15735 ?auto_15736 ?auto_15737 ?auto_15738 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15740 - BLOCK
      ?auto_15741 - BLOCK
      ?auto_15742 - BLOCK
      ?auto_15743 - BLOCK
    )
    :vars
    (
      ?auto_15744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15740 ?auto_15741 ) ) ( not ( = ?auto_15740 ?auto_15742 ) ) ( not ( = ?auto_15740 ?auto_15743 ) ) ( not ( = ?auto_15741 ?auto_15742 ) ) ( not ( = ?auto_15741 ?auto_15743 ) ) ( not ( = ?auto_15742 ?auto_15743 ) ) ( ON-TABLE ?auto_15743 ) ( ON ?auto_15740 ?auto_15744 ) ( not ( = ?auto_15740 ?auto_15744 ) ) ( not ( = ?auto_15741 ?auto_15744 ) ) ( not ( = ?auto_15742 ?auto_15744 ) ) ( not ( = ?auto_15743 ?auto_15744 ) ) ( ON ?auto_15741 ?auto_15740 ) ( CLEAR ?auto_15741 ) ( ON-TABLE ?auto_15744 ) ( HOLDING ?auto_15742 ) ( CLEAR ?auto_15743 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15743 ?auto_15742 )
      ( MAKE-4PILE ?auto_15740 ?auto_15741 ?auto_15742 ?auto_15743 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15745 - BLOCK
      ?auto_15746 - BLOCK
      ?auto_15747 - BLOCK
      ?auto_15748 - BLOCK
    )
    :vars
    (
      ?auto_15749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15745 ?auto_15746 ) ) ( not ( = ?auto_15745 ?auto_15747 ) ) ( not ( = ?auto_15745 ?auto_15748 ) ) ( not ( = ?auto_15746 ?auto_15747 ) ) ( not ( = ?auto_15746 ?auto_15748 ) ) ( not ( = ?auto_15747 ?auto_15748 ) ) ( ON-TABLE ?auto_15748 ) ( ON ?auto_15745 ?auto_15749 ) ( not ( = ?auto_15745 ?auto_15749 ) ) ( not ( = ?auto_15746 ?auto_15749 ) ) ( not ( = ?auto_15747 ?auto_15749 ) ) ( not ( = ?auto_15748 ?auto_15749 ) ) ( ON ?auto_15746 ?auto_15745 ) ( ON-TABLE ?auto_15749 ) ( CLEAR ?auto_15748 ) ( ON ?auto_15747 ?auto_15746 ) ( CLEAR ?auto_15747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15749 ?auto_15745 ?auto_15746 )
      ( MAKE-4PILE ?auto_15745 ?auto_15746 ?auto_15747 ?auto_15748 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15750 - BLOCK
      ?auto_15751 - BLOCK
      ?auto_15752 - BLOCK
      ?auto_15753 - BLOCK
    )
    :vars
    (
      ?auto_15754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15750 ?auto_15751 ) ) ( not ( = ?auto_15750 ?auto_15752 ) ) ( not ( = ?auto_15750 ?auto_15753 ) ) ( not ( = ?auto_15751 ?auto_15752 ) ) ( not ( = ?auto_15751 ?auto_15753 ) ) ( not ( = ?auto_15752 ?auto_15753 ) ) ( ON ?auto_15750 ?auto_15754 ) ( not ( = ?auto_15750 ?auto_15754 ) ) ( not ( = ?auto_15751 ?auto_15754 ) ) ( not ( = ?auto_15752 ?auto_15754 ) ) ( not ( = ?auto_15753 ?auto_15754 ) ) ( ON ?auto_15751 ?auto_15750 ) ( ON-TABLE ?auto_15754 ) ( ON ?auto_15752 ?auto_15751 ) ( CLEAR ?auto_15752 ) ( HOLDING ?auto_15753 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15753 )
      ( MAKE-4PILE ?auto_15750 ?auto_15751 ?auto_15752 ?auto_15753 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15755 - BLOCK
      ?auto_15756 - BLOCK
      ?auto_15757 - BLOCK
      ?auto_15758 - BLOCK
    )
    :vars
    (
      ?auto_15759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15755 ?auto_15756 ) ) ( not ( = ?auto_15755 ?auto_15757 ) ) ( not ( = ?auto_15755 ?auto_15758 ) ) ( not ( = ?auto_15756 ?auto_15757 ) ) ( not ( = ?auto_15756 ?auto_15758 ) ) ( not ( = ?auto_15757 ?auto_15758 ) ) ( ON ?auto_15755 ?auto_15759 ) ( not ( = ?auto_15755 ?auto_15759 ) ) ( not ( = ?auto_15756 ?auto_15759 ) ) ( not ( = ?auto_15757 ?auto_15759 ) ) ( not ( = ?auto_15758 ?auto_15759 ) ) ( ON ?auto_15756 ?auto_15755 ) ( ON-TABLE ?auto_15759 ) ( ON ?auto_15757 ?auto_15756 ) ( ON ?auto_15758 ?auto_15757 ) ( CLEAR ?auto_15758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15759 ?auto_15755 ?auto_15756 ?auto_15757 )
      ( MAKE-4PILE ?auto_15755 ?auto_15756 ?auto_15757 ?auto_15758 ) )
  )

)

