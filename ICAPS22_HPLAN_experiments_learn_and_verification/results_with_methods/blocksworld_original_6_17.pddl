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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70289 - BLOCK
      ?auto_70290 - BLOCK
      ?auto_70291 - BLOCK
      ?auto_70292 - BLOCK
      ?auto_70293 - BLOCK
      ?auto_70294 - BLOCK
    )
    :vars
    (
      ?auto_70295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70295 ?auto_70294 ) ( CLEAR ?auto_70295 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70289 ) ( ON ?auto_70290 ?auto_70289 ) ( ON ?auto_70291 ?auto_70290 ) ( ON ?auto_70292 ?auto_70291 ) ( ON ?auto_70293 ?auto_70292 ) ( ON ?auto_70294 ?auto_70293 ) ( not ( = ?auto_70289 ?auto_70290 ) ) ( not ( = ?auto_70289 ?auto_70291 ) ) ( not ( = ?auto_70289 ?auto_70292 ) ) ( not ( = ?auto_70289 ?auto_70293 ) ) ( not ( = ?auto_70289 ?auto_70294 ) ) ( not ( = ?auto_70289 ?auto_70295 ) ) ( not ( = ?auto_70290 ?auto_70291 ) ) ( not ( = ?auto_70290 ?auto_70292 ) ) ( not ( = ?auto_70290 ?auto_70293 ) ) ( not ( = ?auto_70290 ?auto_70294 ) ) ( not ( = ?auto_70290 ?auto_70295 ) ) ( not ( = ?auto_70291 ?auto_70292 ) ) ( not ( = ?auto_70291 ?auto_70293 ) ) ( not ( = ?auto_70291 ?auto_70294 ) ) ( not ( = ?auto_70291 ?auto_70295 ) ) ( not ( = ?auto_70292 ?auto_70293 ) ) ( not ( = ?auto_70292 ?auto_70294 ) ) ( not ( = ?auto_70292 ?auto_70295 ) ) ( not ( = ?auto_70293 ?auto_70294 ) ) ( not ( = ?auto_70293 ?auto_70295 ) ) ( not ( = ?auto_70294 ?auto_70295 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70295 ?auto_70294 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70297 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_70297 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_70297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70298 - BLOCK
    )
    :vars
    (
      ?auto_70299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70298 ?auto_70299 ) ( CLEAR ?auto_70298 ) ( HAND-EMPTY ) ( not ( = ?auto_70298 ?auto_70299 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70298 ?auto_70299 )
      ( MAKE-1PILE ?auto_70298 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70305 - BLOCK
      ?auto_70306 - BLOCK
      ?auto_70307 - BLOCK
      ?auto_70308 - BLOCK
      ?auto_70309 - BLOCK
    )
    :vars
    (
      ?auto_70310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70310 ?auto_70309 ) ( CLEAR ?auto_70310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70305 ) ( ON ?auto_70306 ?auto_70305 ) ( ON ?auto_70307 ?auto_70306 ) ( ON ?auto_70308 ?auto_70307 ) ( ON ?auto_70309 ?auto_70308 ) ( not ( = ?auto_70305 ?auto_70306 ) ) ( not ( = ?auto_70305 ?auto_70307 ) ) ( not ( = ?auto_70305 ?auto_70308 ) ) ( not ( = ?auto_70305 ?auto_70309 ) ) ( not ( = ?auto_70305 ?auto_70310 ) ) ( not ( = ?auto_70306 ?auto_70307 ) ) ( not ( = ?auto_70306 ?auto_70308 ) ) ( not ( = ?auto_70306 ?auto_70309 ) ) ( not ( = ?auto_70306 ?auto_70310 ) ) ( not ( = ?auto_70307 ?auto_70308 ) ) ( not ( = ?auto_70307 ?auto_70309 ) ) ( not ( = ?auto_70307 ?auto_70310 ) ) ( not ( = ?auto_70308 ?auto_70309 ) ) ( not ( = ?auto_70308 ?auto_70310 ) ) ( not ( = ?auto_70309 ?auto_70310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70310 ?auto_70309 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70311 - BLOCK
      ?auto_70312 - BLOCK
      ?auto_70313 - BLOCK
      ?auto_70314 - BLOCK
      ?auto_70315 - BLOCK
    )
    :vars
    (
      ?auto_70316 - BLOCK
      ?auto_70317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70316 ?auto_70315 ) ( CLEAR ?auto_70316 ) ( ON-TABLE ?auto_70311 ) ( ON ?auto_70312 ?auto_70311 ) ( ON ?auto_70313 ?auto_70312 ) ( ON ?auto_70314 ?auto_70313 ) ( ON ?auto_70315 ?auto_70314 ) ( not ( = ?auto_70311 ?auto_70312 ) ) ( not ( = ?auto_70311 ?auto_70313 ) ) ( not ( = ?auto_70311 ?auto_70314 ) ) ( not ( = ?auto_70311 ?auto_70315 ) ) ( not ( = ?auto_70311 ?auto_70316 ) ) ( not ( = ?auto_70312 ?auto_70313 ) ) ( not ( = ?auto_70312 ?auto_70314 ) ) ( not ( = ?auto_70312 ?auto_70315 ) ) ( not ( = ?auto_70312 ?auto_70316 ) ) ( not ( = ?auto_70313 ?auto_70314 ) ) ( not ( = ?auto_70313 ?auto_70315 ) ) ( not ( = ?auto_70313 ?auto_70316 ) ) ( not ( = ?auto_70314 ?auto_70315 ) ) ( not ( = ?auto_70314 ?auto_70316 ) ) ( not ( = ?auto_70315 ?auto_70316 ) ) ( HOLDING ?auto_70317 ) ( not ( = ?auto_70311 ?auto_70317 ) ) ( not ( = ?auto_70312 ?auto_70317 ) ) ( not ( = ?auto_70313 ?auto_70317 ) ) ( not ( = ?auto_70314 ?auto_70317 ) ) ( not ( = ?auto_70315 ?auto_70317 ) ) ( not ( = ?auto_70316 ?auto_70317 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_70317 )
      ( MAKE-5PILE ?auto_70311 ?auto_70312 ?auto_70313 ?auto_70314 ?auto_70315 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70318 - BLOCK
      ?auto_70319 - BLOCK
      ?auto_70320 - BLOCK
      ?auto_70321 - BLOCK
      ?auto_70322 - BLOCK
    )
    :vars
    (
      ?auto_70324 - BLOCK
      ?auto_70323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70324 ?auto_70322 ) ( ON-TABLE ?auto_70318 ) ( ON ?auto_70319 ?auto_70318 ) ( ON ?auto_70320 ?auto_70319 ) ( ON ?auto_70321 ?auto_70320 ) ( ON ?auto_70322 ?auto_70321 ) ( not ( = ?auto_70318 ?auto_70319 ) ) ( not ( = ?auto_70318 ?auto_70320 ) ) ( not ( = ?auto_70318 ?auto_70321 ) ) ( not ( = ?auto_70318 ?auto_70322 ) ) ( not ( = ?auto_70318 ?auto_70324 ) ) ( not ( = ?auto_70319 ?auto_70320 ) ) ( not ( = ?auto_70319 ?auto_70321 ) ) ( not ( = ?auto_70319 ?auto_70322 ) ) ( not ( = ?auto_70319 ?auto_70324 ) ) ( not ( = ?auto_70320 ?auto_70321 ) ) ( not ( = ?auto_70320 ?auto_70322 ) ) ( not ( = ?auto_70320 ?auto_70324 ) ) ( not ( = ?auto_70321 ?auto_70322 ) ) ( not ( = ?auto_70321 ?auto_70324 ) ) ( not ( = ?auto_70322 ?auto_70324 ) ) ( not ( = ?auto_70318 ?auto_70323 ) ) ( not ( = ?auto_70319 ?auto_70323 ) ) ( not ( = ?auto_70320 ?auto_70323 ) ) ( not ( = ?auto_70321 ?auto_70323 ) ) ( not ( = ?auto_70322 ?auto_70323 ) ) ( not ( = ?auto_70324 ?auto_70323 ) ) ( ON ?auto_70323 ?auto_70324 ) ( CLEAR ?auto_70323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70318 ?auto_70319 ?auto_70320 ?auto_70321 ?auto_70322 ?auto_70324 )
      ( MAKE-5PILE ?auto_70318 ?auto_70319 ?auto_70320 ?auto_70321 ?auto_70322 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70327 - BLOCK
      ?auto_70328 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_70328 ) ( CLEAR ?auto_70327 ) ( ON-TABLE ?auto_70327 ) ( not ( = ?auto_70327 ?auto_70328 ) ) )
    :subtasks
    ( ( !STACK ?auto_70328 ?auto_70327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70329 - BLOCK
      ?auto_70330 - BLOCK
    )
    :vars
    (
      ?auto_70331 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70329 ) ( ON-TABLE ?auto_70329 ) ( not ( = ?auto_70329 ?auto_70330 ) ) ( ON ?auto_70330 ?auto_70331 ) ( CLEAR ?auto_70330 ) ( HAND-EMPTY ) ( not ( = ?auto_70329 ?auto_70331 ) ) ( not ( = ?auto_70330 ?auto_70331 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70330 ?auto_70331 )
      ( MAKE-2PILE ?auto_70329 ?auto_70330 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70332 - BLOCK
      ?auto_70333 - BLOCK
    )
    :vars
    (
      ?auto_70334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70332 ?auto_70333 ) ) ( ON ?auto_70333 ?auto_70334 ) ( CLEAR ?auto_70333 ) ( not ( = ?auto_70332 ?auto_70334 ) ) ( not ( = ?auto_70333 ?auto_70334 ) ) ( HOLDING ?auto_70332 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70332 )
      ( MAKE-2PILE ?auto_70332 ?auto_70333 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70335 - BLOCK
      ?auto_70336 - BLOCK
    )
    :vars
    (
      ?auto_70337 - BLOCK
      ?auto_70341 - BLOCK
      ?auto_70339 - BLOCK
      ?auto_70338 - BLOCK
      ?auto_70340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70335 ?auto_70336 ) ) ( ON ?auto_70336 ?auto_70337 ) ( not ( = ?auto_70335 ?auto_70337 ) ) ( not ( = ?auto_70336 ?auto_70337 ) ) ( ON ?auto_70335 ?auto_70336 ) ( CLEAR ?auto_70335 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70341 ) ( ON ?auto_70339 ?auto_70341 ) ( ON ?auto_70338 ?auto_70339 ) ( ON ?auto_70340 ?auto_70338 ) ( ON ?auto_70337 ?auto_70340 ) ( not ( = ?auto_70341 ?auto_70339 ) ) ( not ( = ?auto_70341 ?auto_70338 ) ) ( not ( = ?auto_70341 ?auto_70340 ) ) ( not ( = ?auto_70341 ?auto_70337 ) ) ( not ( = ?auto_70341 ?auto_70336 ) ) ( not ( = ?auto_70341 ?auto_70335 ) ) ( not ( = ?auto_70339 ?auto_70338 ) ) ( not ( = ?auto_70339 ?auto_70340 ) ) ( not ( = ?auto_70339 ?auto_70337 ) ) ( not ( = ?auto_70339 ?auto_70336 ) ) ( not ( = ?auto_70339 ?auto_70335 ) ) ( not ( = ?auto_70338 ?auto_70340 ) ) ( not ( = ?auto_70338 ?auto_70337 ) ) ( not ( = ?auto_70338 ?auto_70336 ) ) ( not ( = ?auto_70338 ?auto_70335 ) ) ( not ( = ?auto_70340 ?auto_70337 ) ) ( not ( = ?auto_70340 ?auto_70336 ) ) ( not ( = ?auto_70340 ?auto_70335 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70341 ?auto_70339 ?auto_70338 ?auto_70340 ?auto_70337 ?auto_70336 )
      ( MAKE-2PILE ?auto_70335 ?auto_70336 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70346 - BLOCK
      ?auto_70347 - BLOCK
      ?auto_70348 - BLOCK
      ?auto_70349 - BLOCK
    )
    :vars
    (
      ?auto_70350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70350 ?auto_70349 ) ( CLEAR ?auto_70350 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70346 ) ( ON ?auto_70347 ?auto_70346 ) ( ON ?auto_70348 ?auto_70347 ) ( ON ?auto_70349 ?auto_70348 ) ( not ( = ?auto_70346 ?auto_70347 ) ) ( not ( = ?auto_70346 ?auto_70348 ) ) ( not ( = ?auto_70346 ?auto_70349 ) ) ( not ( = ?auto_70346 ?auto_70350 ) ) ( not ( = ?auto_70347 ?auto_70348 ) ) ( not ( = ?auto_70347 ?auto_70349 ) ) ( not ( = ?auto_70347 ?auto_70350 ) ) ( not ( = ?auto_70348 ?auto_70349 ) ) ( not ( = ?auto_70348 ?auto_70350 ) ) ( not ( = ?auto_70349 ?auto_70350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70350 ?auto_70349 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70351 - BLOCK
      ?auto_70352 - BLOCK
      ?auto_70353 - BLOCK
      ?auto_70354 - BLOCK
    )
    :vars
    (
      ?auto_70355 - BLOCK
      ?auto_70356 - BLOCK
      ?auto_70357 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70355 ?auto_70354 ) ( CLEAR ?auto_70355 ) ( ON-TABLE ?auto_70351 ) ( ON ?auto_70352 ?auto_70351 ) ( ON ?auto_70353 ?auto_70352 ) ( ON ?auto_70354 ?auto_70353 ) ( not ( = ?auto_70351 ?auto_70352 ) ) ( not ( = ?auto_70351 ?auto_70353 ) ) ( not ( = ?auto_70351 ?auto_70354 ) ) ( not ( = ?auto_70351 ?auto_70355 ) ) ( not ( = ?auto_70352 ?auto_70353 ) ) ( not ( = ?auto_70352 ?auto_70354 ) ) ( not ( = ?auto_70352 ?auto_70355 ) ) ( not ( = ?auto_70353 ?auto_70354 ) ) ( not ( = ?auto_70353 ?auto_70355 ) ) ( not ( = ?auto_70354 ?auto_70355 ) ) ( HOLDING ?auto_70356 ) ( CLEAR ?auto_70357 ) ( not ( = ?auto_70351 ?auto_70356 ) ) ( not ( = ?auto_70351 ?auto_70357 ) ) ( not ( = ?auto_70352 ?auto_70356 ) ) ( not ( = ?auto_70352 ?auto_70357 ) ) ( not ( = ?auto_70353 ?auto_70356 ) ) ( not ( = ?auto_70353 ?auto_70357 ) ) ( not ( = ?auto_70354 ?auto_70356 ) ) ( not ( = ?auto_70354 ?auto_70357 ) ) ( not ( = ?auto_70355 ?auto_70356 ) ) ( not ( = ?auto_70355 ?auto_70357 ) ) ( not ( = ?auto_70356 ?auto_70357 ) ) )
    :subtasks
    ( ( !STACK ?auto_70356 ?auto_70357 )
      ( MAKE-4PILE ?auto_70351 ?auto_70352 ?auto_70353 ?auto_70354 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70358 - BLOCK
      ?auto_70359 - BLOCK
      ?auto_70360 - BLOCK
      ?auto_70361 - BLOCK
    )
    :vars
    (
      ?auto_70362 - BLOCK
      ?auto_70364 - BLOCK
      ?auto_70363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70362 ?auto_70361 ) ( ON-TABLE ?auto_70358 ) ( ON ?auto_70359 ?auto_70358 ) ( ON ?auto_70360 ?auto_70359 ) ( ON ?auto_70361 ?auto_70360 ) ( not ( = ?auto_70358 ?auto_70359 ) ) ( not ( = ?auto_70358 ?auto_70360 ) ) ( not ( = ?auto_70358 ?auto_70361 ) ) ( not ( = ?auto_70358 ?auto_70362 ) ) ( not ( = ?auto_70359 ?auto_70360 ) ) ( not ( = ?auto_70359 ?auto_70361 ) ) ( not ( = ?auto_70359 ?auto_70362 ) ) ( not ( = ?auto_70360 ?auto_70361 ) ) ( not ( = ?auto_70360 ?auto_70362 ) ) ( not ( = ?auto_70361 ?auto_70362 ) ) ( CLEAR ?auto_70364 ) ( not ( = ?auto_70358 ?auto_70363 ) ) ( not ( = ?auto_70358 ?auto_70364 ) ) ( not ( = ?auto_70359 ?auto_70363 ) ) ( not ( = ?auto_70359 ?auto_70364 ) ) ( not ( = ?auto_70360 ?auto_70363 ) ) ( not ( = ?auto_70360 ?auto_70364 ) ) ( not ( = ?auto_70361 ?auto_70363 ) ) ( not ( = ?auto_70361 ?auto_70364 ) ) ( not ( = ?auto_70362 ?auto_70363 ) ) ( not ( = ?auto_70362 ?auto_70364 ) ) ( not ( = ?auto_70363 ?auto_70364 ) ) ( ON ?auto_70363 ?auto_70362 ) ( CLEAR ?auto_70363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70358 ?auto_70359 ?auto_70360 ?auto_70361 ?auto_70362 )
      ( MAKE-4PILE ?auto_70358 ?auto_70359 ?auto_70360 ?auto_70361 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70365 - BLOCK
      ?auto_70366 - BLOCK
      ?auto_70367 - BLOCK
      ?auto_70368 - BLOCK
    )
    :vars
    (
      ?auto_70370 - BLOCK
      ?auto_70371 - BLOCK
      ?auto_70369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70370 ?auto_70368 ) ( ON-TABLE ?auto_70365 ) ( ON ?auto_70366 ?auto_70365 ) ( ON ?auto_70367 ?auto_70366 ) ( ON ?auto_70368 ?auto_70367 ) ( not ( = ?auto_70365 ?auto_70366 ) ) ( not ( = ?auto_70365 ?auto_70367 ) ) ( not ( = ?auto_70365 ?auto_70368 ) ) ( not ( = ?auto_70365 ?auto_70370 ) ) ( not ( = ?auto_70366 ?auto_70367 ) ) ( not ( = ?auto_70366 ?auto_70368 ) ) ( not ( = ?auto_70366 ?auto_70370 ) ) ( not ( = ?auto_70367 ?auto_70368 ) ) ( not ( = ?auto_70367 ?auto_70370 ) ) ( not ( = ?auto_70368 ?auto_70370 ) ) ( not ( = ?auto_70365 ?auto_70371 ) ) ( not ( = ?auto_70365 ?auto_70369 ) ) ( not ( = ?auto_70366 ?auto_70371 ) ) ( not ( = ?auto_70366 ?auto_70369 ) ) ( not ( = ?auto_70367 ?auto_70371 ) ) ( not ( = ?auto_70367 ?auto_70369 ) ) ( not ( = ?auto_70368 ?auto_70371 ) ) ( not ( = ?auto_70368 ?auto_70369 ) ) ( not ( = ?auto_70370 ?auto_70371 ) ) ( not ( = ?auto_70370 ?auto_70369 ) ) ( not ( = ?auto_70371 ?auto_70369 ) ) ( ON ?auto_70371 ?auto_70370 ) ( CLEAR ?auto_70371 ) ( HOLDING ?auto_70369 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70369 )
      ( MAKE-4PILE ?auto_70365 ?auto_70366 ?auto_70367 ?auto_70368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70372 - BLOCK
      ?auto_70373 - BLOCK
      ?auto_70374 - BLOCK
      ?auto_70375 - BLOCK
    )
    :vars
    (
      ?auto_70377 - BLOCK
      ?auto_70376 - BLOCK
      ?auto_70378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70377 ?auto_70375 ) ( ON-TABLE ?auto_70372 ) ( ON ?auto_70373 ?auto_70372 ) ( ON ?auto_70374 ?auto_70373 ) ( ON ?auto_70375 ?auto_70374 ) ( not ( = ?auto_70372 ?auto_70373 ) ) ( not ( = ?auto_70372 ?auto_70374 ) ) ( not ( = ?auto_70372 ?auto_70375 ) ) ( not ( = ?auto_70372 ?auto_70377 ) ) ( not ( = ?auto_70373 ?auto_70374 ) ) ( not ( = ?auto_70373 ?auto_70375 ) ) ( not ( = ?auto_70373 ?auto_70377 ) ) ( not ( = ?auto_70374 ?auto_70375 ) ) ( not ( = ?auto_70374 ?auto_70377 ) ) ( not ( = ?auto_70375 ?auto_70377 ) ) ( not ( = ?auto_70372 ?auto_70376 ) ) ( not ( = ?auto_70372 ?auto_70378 ) ) ( not ( = ?auto_70373 ?auto_70376 ) ) ( not ( = ?auto_70373 ?auto_70378 ) ) ( not ( = ?auto_70374 ?auto_70376 ) ) ( not ( = ?auto_70374 ?auto_70378 ) ) ( not ( = ?auto_70375 ?auto_70376 ) ) ( not ( = ?auto_70375 ?auto_70378 ) ) ( not ( = ?auto_70377 ?auto_70376 ) ) ( not ( = ?auto_70377 ?auto_70378 ) ) ( not ( = ?auto_70376 ?auto_70378 ) ) ( ON ?auto_70376 ?auto_70377 ) ( ON ?auto_70378 ?auto_70376 ) ( CLEAR ?auto_70378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70372 ?auto_70373 ?auto_70374 ?auto_70375 ?auto_70377 ?auto_70376 )
      ( MAKE-4PILE ?auto_70372 ?auto_70373 ?auto_70374 ?auto_70375 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70382 - BLOCK
      ?auto_70383 - BLOCK
      ?auto_70384 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_70384 ) ( CLEAR ?auto_70383 ) ( ON-TABLE ?auto_70382 ) ( ON ?auto_70383 ?auto_70382 ) ( not ( = ?auto_70382 ?auto_70383 ) ) ( not ( = ?auto_70382 ?auto_70384 ) ) ( not ( = ?auto_70383 ?auto_70384 ) ) )
    :subtasks
    ( ( !STACK ?auto_70384 ?auto_70383 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70385 - BLOCK
      ?auto_70386 - BLOCK
      ?auto_70387 - BLOCK
    )
    :vars
    (
      ?auto_70388 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70386 ) ( ON-TABLE ?auto_70385 ) ( ON ?auto_70386 ?auto_70385 ) ( not ( = ?auto_70385 ?auto_70386 ) ) ( not ( = ?auto_70385 ?auto_70387 ) ) ( not ( = ?auto_70386 ?auto_70387 ) ) ( ON ?auto_70387 ?auto_70388 ) ( CLEAR ?auto_70387 ) ( HAND-EMPTY ) ( not ( = ?auto_70385 ?auto_70388 ) ) ( not ( = ?auto_70386 ?auto_70388 ) ) ( not ( = ?auto_70387 ?auto_70388 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70387 ?auto_70388 )
      ( MAKE-3PILE ?auto_70385 ?auto_70386 ?auto_70387 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70389 - BLOCK
      ?auto_70390 - BLOCK
      ?auto_70391 - BLOCK
    )
    :vars
    (
      ?auto_70392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70389 ) ( not ( = ?auto_70389 ?auto_70390 ) ) ( not ( = ?auto_70389 ?auto_70391 ) ) ( not ( = ?auto_70390 ?auto_70391 ) ) ( ON ?auto_70391 ?auto_70392 ) ( CLEAR ?auto_70391 ) ( not ( = ?auto_70389 ?auto_70392 ) ) ( not ( = ?auto_70390 ?auto_70392 ) ) ( not ( = ?auto_70391 ?auto_70392 ) ) ( HOLDING ?auto_70390 ) ( CLEAR ?auto_70389 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70389 ?auto_70390 )
      ( MAKE-3PILE ?auto_70389 ?auto_70390 ?auto_70391 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70393 - BLOCK
      ?auto_70394 - BLOCK
      ?auto_70395 - BLOCK
    )
    :vars
    (
      ?auto_70396 - BLOCK
      ?auto_70398 - BLOCK
      ?auto_70399 - BLOCK
      ?auto_70397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70393 ) ( not ( = ?auto_70393 ?auto_70394 ) ) ( not ( = ?auto_70393 ?auto_70395 ) ) ( not ( = ?auto_70394 ?auto_70395 ) ) ( ON ?auto_70395 ?auto_70396 ) ( not ( = ?auto_70393 ?auto_70396 ) ) ( not ( = ?auto_70394 ?auto_70396 ) ) ( not ( = ?auto_70395 ?auto_70396 ) ) ( CLEAR ?auto_70393 ) ( ON ?auto_70394 ?auto_70395 ) ( CLEAR ?auto_70394 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70398 ) ( ON ?auto_70399 ?auto_70398 ) ( ON ?auto_70397 ?auto_70399 ) ( ON ?auto_70396 ?auto_70397 ) ( not ( = ?auto_70398 ?auto_70399 ) ) ( not ( = ?auto_70398 ?auto_70397 ) ) ( not ( = ?auto_70398 ?auto_70396 ) ) ( not ( = ?auto_70398 ?auto_70395 ) ) ( not ( = ?auto_70398 ?auto_70394 ) ) ( not ( = ?auto_70399 ?auto_70397 ) ) ( not ( = ?auto_70399 ?auto_70396 ) ) ( not ( = ?auto_70399 ?auto_70395 ) ) ( not ( = ?auto_70399 ?auto_70394 ) ) ( not ( = ?auto_70397 ?auto_70396 ) ) ( not ( = ?auto_70397 ?auto_70395 ) ) ( not ( = ?auto_70397 ?auto_70394 ) ) ( not ( = ?auto_70393 ?auto_70398 ) ) ( not ( = ?auto_70393 ?auto_70399 ) ) ( not ( = ?auto_70393 ?auto_70397 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70398 ?auto_70399 ?auto_70397 ?auto_70396 ?auto_70395 )
      ( MAKE-3PILE ?auto_70393 ?auto_70394 ?auto_70395 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70400 - BLOCK
      ?auto_70401 - BLOCK
      ?auto_70402 - BLOCK
    )
    :vars
    (
      ?auto_70403 - BLOCK
      ?auto_70405 - BLOCK
      ?auto_70404 - BLOCK
      ?auto_70406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70400 ?auto_70401 ) ) ( not ( = ?auto_70400 ?auto_70402 ) ) ( not ( = ?auto_70401 ?auto_70402 ) ) ( ON ?auto_70402 ?auto_70403 ) ( not ( = ?auto_70400 ?auto_70403 ) ) ( not ( = ?auto_70401 ?auto_70403 ) ) ( not ( = ?auto_70402 ?auto_70403 ) ) ( ON ?auto_70401 ?auto_70402 ) ( CLEAR ?auto_70401 ) ( ON-TABLE ?auto_70405 ) ( ON ?auto_70404 ?auto_70405 ) ( ON ?auto_70406 ?auto_70404 ) ( ON ?auto_70403 ?auto_70406 ) ( not ( = ?auto_70405 ?auto_70404 ) ) ( not ( = ?auto_70405 ?auto_70406 ) ) ( not ( = ?auto_70405 ?auto_70403 ) ) ( not ( = ?auto_70405 ?auto_70402 ) ) ( not ( = ?auto_70405 ?auto_70401 ) ) ( not ( = ?auto_70404 ?auto_70406 ) ) ( not ( = ?auto_70404 ?auto_70403 ) ) ( not ( = ?auto_70404 ?auto_70402 ) ) ( not ( = ?auto_70404 ?auto_70401 ) ) ( not ( = ?auto_70406 ?auto_70403 ) ) ( not ( = ?auto_70406 ?auto_70402 ) ) ( not ( = ?auto_70406 ?auto_70401 ) ) ( not ( = ?auto_70400 ?auto_70405 ) ) ( not ( = ?auto_70400 ?auto_70404 ) ) ( not ( = ?auto_70400 ?auto_70406 ) ) ( HOLDING ?auto_70400 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70400 )
      ( MAKE-3PILE ?auto_70400 ?auto_70401 ?auto_70402 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70407 - BLOCK
      ?auto_70408 - BLOCK
      ?auto_70409 - BLOCK
    )
    :vars
    (
      ?auto_70413 - BLOCK
      ?auto_70410 - BLOCK
      ?auto_70411 - BLOCK
      ?auto_70412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70407 ?auto_70408 ) ) ( not ( = ?auto_70407 ?auto_70409 ) ) ( not ( = ?auto_70408 ?auto_70409 ) ) ( ON ?auto_70409 ?auto_70413 ) ( not ( = ?auto_70407 ?auto_70413 ) ) ( not ( = ?auto_70408 ?auto_70413 ) ) ( not ( = ?auto_70409 ?auto_70413 ) ) ( ON ?auto_70408 ?auto_70409 ) ( ON-TABLE ?auto_70410 ) ( ON ?auto_70411 ?auto_70410 ) ( ON ?auto_70412 ?auto_70411 ) ( ON ?auto_70413 ?auto_70412 ) ( not ( = ?auto_70410 ?auto_70411 ) ) ( not ( = ?auto_70410 ?auto_70412 ) ) ( not ( = ?auto_70410 ?auto_70413 ) ) ( not ( = ?auto_70410 ?auto_70409 ) ) ( not ( = ?auto_70410 ?auto_70408 ) ) ( not ( = ?auto_70411 ?auto_70412 ) ) ( not ( = ?auto_70411 ?auto_70413 ) ) ( not ( = ?auto_70411 ?auto_70409 ) ) ( not ( = ?auto_70411 ?auto_70408 ) ) ( not ( = ?auto_70412 ?auto_70413 ) ) ( not ( = ?auto_70412 ?auto_70409 ) ) ( not ( = ?auto_70412 ?auto_70408 ) ) ( not ( = ?auto_70407 ?auto_70410 ) ) ( not ( = ?auto_70407 ?auto_70411 ) ) ( not ( = ?auto_70407 ?auto_70412 ) ) ( ON ?auto_70407 ?auto_70408 ) ( CLEAR ?auto_70407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70410 ?auto_70411 ?auto_70412 ?auto_70413 ?auto_70409 ?auto_70408 )
      ( MAKE-3PILE ?auto_70407 ?auto_70408 ?auto_70409 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70417 - BLOCK
      ?auto_70418 - BLOCK
      ?auto_70419 - BLOCK
    )
    :vars
    (
      ?auto_70420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70420 ?auto_70419 ) ( CLEAR ?auto_70420 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70417 ) ( ON ?auto_70418 ?auto_70417 ) ( ON ?auto_70419 ?auto_70418 ) ( not ( = ?auto_70417 ?auto_70418 ) ) ( not ( = ?auto_70417 ?auto_70419 ) ) ( not ( = ?auto_70417 ?auto_70420 ) ) ( not ( = ?auto_70418 ?auto_70419 ) ) ( not ( = ?auto_70418 ?auto_70420 ) ) ( not ( = ?auto_70419 ?auto_70420 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70420 ?auto_70419 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70421 - BLOCK
      ?auto_70422 - BLOCK
      ?auto_70423 - BLOCK
    )
    :vars
    (
      ?auto_70424 - BLOCK
      ?auto_70425 - BLOCK
      ?auto_70426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70424 ?auto_70423 ) ( CLEAR ?auto_70424 ) ( ON-TABLE ?auto_70421 ) ( ON ?auto_70422 ?auto_70421 ) ( ON ?auto_70423 ?auto_70422 ) ( not ( = ?auto_70421 ?auto_70422 ) ) ( not ( = ?auto_70421 ?auto_70423 ) ) ( not ( = ?auto_70421 ?auto_70424 ) ) ( not ( = ?auto_70422 ?auto_70423 ) ) ( not ( = ?auto_70422 ?auto_70424 ) ) ( not ( = ?auto_70423 ?auto_70424 ) ) ( HOLDING ?auto_70425 ) ( CLEAR ?auto_70426 ) ( not ( = ?auto_70421 ?auto_70425 ) ) ( not ( = ?auto_70421 ?auto_70426 ) ) ( not ( = ?auto_70422 ?auto_70425 ) ) ( not ( = ?auto_70422 ?auto_70426 ) ) ( not ( = ?auto_70423 ?auto_70425 ) ) ( not ( = ?auto_70423 ?auto_70426 ) ) ( not ( = ?auto_70424 ?auto_70425 ) ) ( not ( = ?auto_70424 ?auto_70426 ) ) ( not ( = ?auto_70425 ?auto_70426 ) ) )
    :subtasks
    ( ( !STACK ?auto_70425 ?auto_70426 )
      ( MAKE-3PILE ?auto_70421 ?auto_70422 ?auto_70423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70427 - BLOCK
      ?auto_70428 - BLOCK
      ?auto_70429 - BLOCK
    )
    :vars
    (
      ?auto_70432 - BLOCK
      ?auto_70430 - BLOCK
      ?auto_70431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70432 ?auto_70429 ) ( ON-TABLE ?auto_70427 ) ( ON ?auto_70428 ?auto_70427 ) ( ON ?auto_70429 ?auto_70428 ) ( not ( = ?auto_70427 ?auto_70428 ) ) ( not ( = ?auto_70427 ?auto_70429 ) ) ( not ( = ?auto_70427 ?auto_70432 ) ) ( not ( = ?auto_70428 ?auto_70429 ) ) ( not ( = ?auto_70428 ?auto_70432 ) ) ( not ( = ?auto_70429 ?auto_70432 ) ) ( CLEAR ?auto_70430 ) ( not ( = ?auto_70427 ?auto_70431 ) ) ( not ( = ?auto_70427 ?auto_70430 ) ) ( not ( = ?auto_70428 ?auto_70431 ) ) ( not ( = ?auto_70428 ?auto_70430 ) ) ( not ( = ?auto_70429 ?auto_70431 ) ) ( not ( = ?auto_70429 ?auto_70430 ) ) ( not ( = ?auto_70432 ?auto_70431 ) ) ( not ( = ?auto_70432 ?auto_70430 ) ) ( not ( = ?auto_70431 ?auto_70430 ) ) ( ON ?auto_70431 ?auto_70432 ) ( CLEAR ?auto_70431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70427 ?auto_70428 ?auto_70429 ?auto_70432 )
      ( MAKE-3PILE ?auto_70427 ?auto_70428 ?auto_70429 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70433 - BLOCK
      ?auto_70434 - BLOCK
      ?auto_70435 - BLOCK
    )
    :vars
    (
      ?auto_70436 - BLOCK
      ?auto_70437 - BLOCK
      ?auto_70438 - BLOCK
      ?auto_70439 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70436 ?auto_70435 ) ( ON-TABLE ?auto_70433 ) ( ON ?auto_70434 ?auto_70433 ) ( ON ?auto_70435 ?auto_70434 ) ( not ( = ?auto_70433 ?auto_70434 ) ) ( not ( = ?auto_70433 ?auto_70435 ) ) ( not ( = ?auto_70433 ?auto_70436 ) ) ( not ( = ?auto_70434 ?auto_70435 ) ) ( not ( = ?auto_70434 ?auto_70436 ) ) ( not ( = ?auto_70435 ?auto_70436 ) ) ( not ( = ?auto_70433 ?auto_70437 ) ) ( not ( = ?auto_70433 ?auto_70438 ) ) ( not ( = ?auto_70434 ?auto_70437 ) ) ( not ( = ?auto_70434 ?auto_70438 ) ) ( not ( = ?auto_70435 ?auto_70437 ) ) ( not ( = ?auto_70435 ?auto_70438 ) ) ( not ( = ?auto_70436 ?auto_70437 ) ) ( not ( = ?auto_70436 ?auto_70438 ) ) ( not ( = ?auto_70437 ?auto_70438 ) ) ( ON ?auto_70437 ?auto_70436 ) ( CLEAR ?auto_70437 ) ( HOLDING ?auto_70438 ) ( CLEAR ?auto_70439 ) ( ON-TABLE ?auto_70439 ) ( not ( = ?auto_70439 ?auto_70438 ) ) ( not ( = ?auto_70433 ?auto_70439 ) ) ( not ( = ?auto_70434 ?auto_70439 ) ) ( not ( = ?auto_70435 ?auto_70439 ) ) ( not ( = ?auto_70436 ?auto_70439 ) ) ( not ( = ?auto_70437 ?auto_70439 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70439 ?auto_70438 )
      ( MAKE-3PILE ?auto_70433 ?auto_70434 ?auto_70435 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70440 - BLOCK
      ?auto_70441 - BLOCK
      ?auto_70442 - BLOCK
    )
    :vars
    (
      ?auto_70445 - BLOCK
      ?auto_70444 - BLOCK
      ?auto_70446 - BLOCK
      ?auto_70443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70445 ?auto_70442 ) ( ON-TABLE ?auto_70440 ) ( ON ?auto_70441 ?auto_70440 ) ( ON ?auto_70442 ?auto_70441 ) ( not ( = ?auto_70440 ?auto_70441 ) ) ( not ( = ?auto_70440 ?auto_70442 ) ) ( not ( = ?auto_70440 ?auto_70445 ) ) ( not ( = ?auto_70441 ?auto_70442 ) ) ( not ( = ?auto_70441 ?auto_70445 ) ) ( not ( = ?auto_70442 ?auto_70445 ) ) ( not ( = ?auto_70440 ?auto_70444 ) ) ( not ( = ?auto_70440 ?auto_70446 ) ) ( not ( = ?auto_70441 ?auto_70444 ) ) ( not ( = ?auto_70441 ?auto_70446 ) ) ( not ( = ?auto_70442 ?auto_70444 ) ) ( not ( = ?auto_70442 ?auto_70446 ) ) ( not ( = ?auto_70445 ?auto_70444 ) ) ( not ( = ?auto_70445 ?auto_70446 ) ) ( not ( = ?auto_70444 ?auto_70446 ) ) ( ON ?auto_70444 ?auto_70445 ) ( CLEAR ?auto_70443 ) ( ON-TABLE ?auto_70443 ) ( not ( = ?auto_70443 ?auto_70446 ) ) ( not ( = ?auto_70440 ?auto_70443 ) ) ( not ( = ?auto_70441 ?auto_70443 ) ) ( not ( = ?auto_70442 ?auto_70443 ) ) ( not ( = ?auto_70445 ?auto_70443 ) ) ( not ( = ?auto_70444 ?auto_70443 ) ) ( ON ?auto_70446 ?auto_70444 ) ( CLEAR ?auto_70446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70440 ?auto_70441 ?auto_70442 ?auto_70445 ?auto_70444 )
      ( MAKE-3PILE ?auto_70440 ?auto_70441 ?auto_70442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70447 - BLOCK
      ?auto_70448 - BLOCK
      ?auto_70449 - BLOCK
    )
    :vars
    (
      ?auto_70453 - BLOCK
      ?auto_70451 - BLOCK
      ?auto_70452 - BLOCK
      ?auto_70450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70453 ?auto_70449 ) ( ON-TABLE ?auto_70447 ) ( ON ?auto_70448 ?auto_70447 ) ( ON ?auto_70449 ?auto_70448 ) ( not ( = ?auto_70447 ?auto_70448 ) ) ( not ( = ?auto_70447 ?auto_70449 ) ) ( not ( = ?auto_70447 ?auto_70453 ) ) ( not ( = ?auto_70448 ?auto_70449 ) ) ( not ( = ?auto_70448 ?auto_70453 ) ) ( not ( = ?auto_70449 ?auto_70453 ) ) ( not ( = ?auto_70447 ?auto_70451 ) ) ( not ( = ?auto_70447 ?auto_70452 ) ) ( not ( = ?auto_70448 ?auto_70451 ) ) ( not ( = ?auto_70448 ?auto_70452 ) ) ( not ( = ?auto_70449 ?auto_70451 ) ) ( not ( = ?auto_70449 ?auto_70452 ) ) ( not ( = ?auto_70453 ?auto_70451 ) ) ( not ( = ?auto_70453 ?auto_70452 ) ) ( not ( = ?auto_70451 ?auto_70452 ) ) ( ON ?auto_70451 ?auto_70453 ) ( not ( = ?auto_70450 ?auto_70452 ) ) ( not ( = ?auto_70447 ?auto_70450 ) ) ( not ( = ?auto_70448 ?auto_70450 ) ) ( not ( = ?auto_70449 ?auto_70450 ) ) ( not ( = ?auto_70453 ?auto_70450 ) ) ( not ( = ?auto_70451 ?auto_70450 ) ) ( ON ?auto_70452 ?auto_70451 ) ( CLEAR ?auto_70452 ) ( HOLDING ?auto_70450 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70450 )
      ( MAKE-3PILE ?auto_70447 ?auto_70448 ?auto_70449 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_70454 - BLOCK
      ?auto_70455 - BLOCK
      ?auto_70456 - BLOCK
    )
    :vars
    (
      ?auto_70458 - BLOCK
      ?auto_70459 - BLOCK
      ?auto_70457 - BLOCK
      ?auto_70460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70458 ?auto_70456 ) ( ON-TABLE ?auto_70454 ) ( ON ?auto_70455 ?auto_70454 ) ( ON ?auto_70456 ?auto_70455 ) ( not ( = ?auto_70454 ?auto_70455 ) ) ( not ( = ?auto_70454 ?auto_70456 ) ) ( not ( = ?auto_70454 ?auto_70458 ) ) ( not ( = ?auto_70455 ?auto_70456 ) ) ( not ( = ?auto_70455 ?auto_70458 ) ) ( not ( = ?auto_70456 ?auto_70458 ) ) ( not ( = ?auto_70454 ?auto_70459 ) ) ( not ( = ?auto_70454 ?auto_70457 ) ) ( not ( = ?auto_70455 ?auto_70459 ) ) ( not ( = ?auto_70455 ?auto_70457 ) ) ( not ( = ?auto_70456 ?auto_70459 ) ) ( not ( = ?auto_70456 ?auto_70457 ) ) ( not ( = ?auto_70458 ?auto_70459 ) ) ( not ( = ?auto_70458 ?auto_70457 ) ) ( not ( = ?auto_70459 ?auto_70457 ) ) ( ON ?auto_70459 ?auto_70458 ) ( not ( = ?auto_70460 ?auto_70457 ) ) ( not ( = ?auto_70454 ?auto_70460 ) ) ( not ( = ?auto_70455 ?auto_70460 ) ) ( not ( = ?auto_70456 ?auto_70460 ) ) ( not ( = ?auto_70458 ?auto_70460 ) ) ( not ( = ?auto_70459 ?auto_70460 ) ) ( ON ?auto_70457 ?auto_70459 ) ( ON ?auto_70460 ?auto_70457 ) ( CLEAR ?auto_70460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70454 ?auto_70455 ?auto_70456 ?auto_70458 ?auto_70459 ?auto_70457 )
      ( MAKE-3PILE ?auto_70454 ?auto_70455 ?auto_70456 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70465 - BLOCK
      ?auto_70466 - BLOCK
      ?auto_70467 - BLOCK
      ?auto_70468 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_70468 ) ( CLEAR ?auto_70467 ) ( ON-TABLE ?auto_70465 ) ( ON ?auto_70466 ?auto_70465 ) ( ON ?auto_70467 ?auto_70466 ) ( not ( = ?auto_70465 ?auto_70466 ) ) ( not ( = ?auto_70465 ?auto_70467 ) ) ( not ( = ?auto_70465 ?auto_70468 ) ) ( not ( = ?auto_70466 ?auto_70467 ) ) ( not ( = ?auto_70466 ?auto_70468 ) ) ( not ( = ?auto_70467 ?auto_70468 ) ) )
    :subtasks
    ( ( !STACK ?auto_70468 ?auto_70467 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70469 - BLOCK
      ?auto_70470 - BLOCK
      ?auto_70471 - BLOCK
      ?auto_70472 - BLOCK
    )
    :vars
    (
      ?auto_70473 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70471 ) ( ON-TABLE ?auto_70469 ) ( ON ?auto_70470 ?auto_70469 ) ( ON ?auto_70471 ?auto_70470 ) ( not ( = ?auto_70469 ?auto_70470 ) ) ( not ( = ?auto_70469 ?auto_70471 ) ) ( not ( = ?auto_70469 ?auto_70472 ) ) ( not ( = ?auto_70470 ?auto_70471 ) ) ( not ( = ?auto_70470 ?auto_70472 ) ) ( not ( = ?auto_70471 ?auto_70472 ) ) ( ON ?auto_70472 ?auto_70473 ) ( CLEAR ?auto_70472 ) ( HAND-EMPTY ) ( not ( = ?auto_70469 ?auto_70473 ) ) ( not ( = ?auto_70470 ?auto_70473 ) ) ( not ( = ?auto_70471 ?auto_70473 ) ) ( not ( = ?auto_70472 ?auto_70473 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70472 ?auto_70473 )
      ( MAKE-4PILE ?auto_70469 ?auto_70470 ?auto_70471 ?auto_70472 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70474 - BLOCK
      ?auto_70475 - BLOCK
      ?auto_70476 - BLOCK
      ?auto_70477 - BLOCK
    )
    :vars
    (
      ?auto_70478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70474 ) ( ON ?auto_70475 ?auto_70474 ) ( not ( = ?auto_70474 ?auto_70475 ) ) ( not ( = ?auto_70474 ?auto_70476 ) ) ( not ( = ?auto_70474 ?auto_70477 ) ) ( not ( = ?auto_70475 ?auto_70476 ) ) ( not ( = ?auto_70475 ?auto_70477 ) ) ( not ( = ?auto_70476 ?auto_70477 ) ) ( ON ?auto_70477 ?auto_70478 ) ( CLEAR ?auto_70477 ) ( not ( = ?auto_70474 ?auto_70478 ) ) ( not ( = ?auto_70475 ?auto_70478 ) ) ( not ( = ?auto_70476 ?auto_70478 ) ) ( not ( = ?auto_70477 ?auto_70478 ) ) ( HOLDING ?auto_70476 ) ( CLEAR ?auto_70475 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70474 ?auto_70475 ?auto_70476 )
      ( MAKE-4PILE ?auto_70474 ?auto_70475 ?auto_70476 ?auto_70477 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70479 - BLOCK
      ?auto_70480 - BLOCK
      ?auto_70481 - BLOCK
      ?auto_70482 - BLOCK
    )
    :vars
    (
      ?auto_70483 - BLOCK
      ?auto_70484 - BLOCK
      ?auto_70485 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70479 ) ( ON ?auto_70480 ?auto_70479 ) ( not ( = ?auto_70479 ?auto_70480 ) ) ( not ( = ?auto_70479 ?auto_70481 ) ) ( not ( = ?auto_70479 ?auto_70482 ) ) ( not ( = ?auto_70480 ?auto_70481 ) ) ( not ( = ?auto_70480 ?auto_70482 ) ) ( not ( = ?auto_70481 ?auto_70482 ) ) ( ON ?auto_70482 ?auto_70483 ) ( not ( = ?auto_70479 ?auto_70483 ) ) ( not ( = ?auto_70480 ?auto_70483 ) ) ( not ( = ?auto_70481 ?auto_70483 ) ) ( not ( = ?auto_70482 ?auto_70483 ) ) ( CLEAR ?auto_70480 ) ( ON ?auto_70481 ?auto_70482 ) ( CLEAR ?auto_70481 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70484 ) ( ON ?auto_70485 ?auto_70484 ) ( ON ?auto_70483 ?auto_70485 ) ( not ( = ?auto_70484 ?auto_70485 ) ) ( not ( = ?auto_70484 ?auto_70483 ) ) ( not ( = ?auto_70484 ?auto_70482 ) ) ( not ( = ?auto_70484 ?auto_70481 ) ) ( not ( = ?auto_70485 ?auto_70483 ) ) ( not ( = ?auto_70485 ?auto_70482 ) ) ( not ( = ?auto_70485 ?auto_70481 ) ) ( not ( = ?auto_70479 ?auto_70484 ) ) ( not ( = ?auto_70479 ?auto_70485 ) ) ( not ( = ?auto_70480 ?auto_70484 ) ) ( not ( = ?auto_70480 ?auto_70485 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70484 ?auto_70485 ?auto_70483 ?auto_70482 )
      ( MAKE-4PILE ?auto_70479 ?auto_70480 ?auto_70481 ?auto_70482 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70486 - BLOCK
      ?auto_70487 - BLOCK
      ?auto_70488 - BLOCK
      ?auto_70489 - BLOCK
    )
    :vars
    (
      ?auto_70492 - BLOCK
      ?auto_70490 - BLOCK
      ?auto_70491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70486 ) ( not ( = ?auto_70486 ?auto_70487 ) ) ( not ( = ?auto_70486 ?auto_70488 ) ) ( not ( = ?auto_70486 ?auto_70489 ) ) ( not ( = ?auto_70487 ?auto_70488 ) ) ( not ( = ?auto_70487 ?auto_70489 ) ) ( not ( = ?auto_70488 ?auto_70489 ) ) ( ON ?auto_70489 ?auto_70492 ) ( not ( = ?auto_70486 ?auto_70492 ) ) ( not ( = ?auto_70487 ?auto_70492 ) ) ( not ( = ?auto_70488 ?auto_70492 ) ) ( not ( = ?auto_70489 ?auto_70492 ) ) ( ON ?auto_70488 ?auto_70489 ) ( CLEAR ?auto_70488 ) ( ON-TABLE ?auto_70490 ) ( ON ?auto_70491 ?auto_70490 ) ( ON ?auto_70492 ?auto_70491 ) ( not ( = ?auto_70490 ?auto_70491 ) ) ( not ( = ?auto_70490 ?auto_70492 ) ) ( not ( = ?auto_70490 ?auto_70489 ) ) ( not ( = ?auto_70490 ?auto_70488 ) ) ( not ( = ?auto_70491 ?auto_70492 ) ) ( not ( = ?auto_70491 ?auto_70489 ) ) ( not ( = ?auto_70491 ?auto_70488 ) ) ( not ( = ?auto_70486 ?auto_70490 ) ) ( not ( = ?auto_70486 ?auto_70491 ) ) ( not ( = ?auto_70487 ?auto_70490 ) ) ( not ( = ?auto_70487 ?auto_70491 ) ) ( HOLDING ?auto_70487 ) ( CLEAR ?auto_70486 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70486 ?auto_70487 )
      ( MAKE-4PILE ?auto_70486 ?auto_70487 ?auto_70488 ?auto_70489 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70493 - BLOCK
      ?auto_70494 - BLOCK
      ?auto_70495 - BLOCK
      ?auto_70496 - BLOCK
    )
    :vars
    (
      ?auto_70497 - BLOCK
      ?auto_70499 - BLOCK
      ?auto_70498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70493 ) ( not ( = ?auto_70493 ?auto_70494 ) ) ( not ( = ?auto_70493 ?auto_70495 ) ) ( not ( = ?auto_70493 ?auto_70496 ) ) ( not ( = ?auto_70494 ?auto_70495 ) ) ( not ( = ?auto_70494 ?auto_70496 ) ) ( not ( = ?auto_70495 ?auto_70496 ) ) ( ON ?auto_70496 ?auto_70497 ) ( not ( = ?auto_70493 ?auto_70497 ) ) ( not ( = ?auto_70494 ?auto_70497 ) ) ( not ( = ?auto_70495 ?auto_70497 ) ) ( not ( = ?auto_70496 ?auto_70497 ) ) ( ON ?auto_70495 ?auto_70496 ) ( ON-TABLE ?auto_70499 ) ( ON ?auto_70498 ?auto_70499 ) ( ON ?auto_70497 ?auto_70498 ) ( not ( = ?auto_70499 ?auto_70498 ) ) ( not ( = ?auto_70499 ?auto_70497 ) ) ( not ( = ?auto_70499 ?auto_70496 ) ) ( not ( = ?auto_70499 ?auto_70495 ) ) ( not ( = ?auto_70498 ?auto_70497 ) ) ( not ( = ?auto_70498 ?auto_70496 ) ) ( not ( = ?auto_70498 ?auto_70495 ) ) ( not ( = ?auto_70493 ?auto_70499 ) ) ( not ( = ?auto_70493 ?auto_70498 ) ) ( not ( = ?auto_70494 ?auto_70499 ) ) ( not ( = ?auto_70494 ?auto_70498 ) ) ( CLEAR ?auto_70493 ) ( ON ?auto_70494 ?auto_70495 ) ( CLEAR ?auto_70494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70499 ?auto_70498 ?auto_70497 ?auto_70496 ?auto_70495 )
      ( MAKE-4PILE ?auto_70493 ?auto_70494 ?auto_70495 ?auto_70496 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70500 - BLOCK
      ?auto_70501 - BLOCK
      ?auto_70502 - BLOCK
      ?auto_70503 - BLOCK
    )
    :vars
    (
      ?auto_70505 - BLOCK
      ?auto_70504 - BLOCK
      ?auto_70506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70500 ?auto_70501 ) ) ( not ( = ?auto_70500 ?auto_70502 ) ) ( not ( = ?auto_70500 ?auto_70503 ) ) ( not ( = ?auto_70501 ?auto_70502 ) ) ( not ( = ?auto_70501 ?auto_70503 ) ) ( not ( = ?auto_70502 ?auto_70503 ) ) ( ON ?auto_70503 ?auto_70505 ) ( not ( = ?auto_70500 ?auto_70505 ) ) ( not ( = ?auto_70501 ?auto_70505 ) ) ( not ( = ?auto_70502 ?auto_70505 ) ) ( not ( = ?auto_70503 ?auto_70505 ) ) ( ON ?auto_70502 ?auto_70503 ) ( ON-TABLE ?auto_70504 ) ( ON ?auto_70506 ?auto_70504 ) ( ON ?auto_70505 ?auto_70506 ) ( not ( = ?auto_70504 ?auto_70506 ) ) ( not ( = ?auto_70504 ?auto_70505 ) ) ( not ( = ?auto_70504 ?auto_70503 ) ) ( not ( = ?auto_70504 ?auto_70502 ) ) ( not ( = ?auto_70506 ?auto_70505 ) ) ( not ( = ?auto_70506 ?auto_70503 ) ) ( not ( = ?auto_70506 ?auto_70502 ) ) ( not ( = ?auto_70500 ?auto_70504 ) ) ( not ( = ?auto_70500 ?auto_70506 ) ) ( not ( = ?auto_70501 ?auto_70504 ) ) ( not ( = ?auto_70501 ?auto_70506 ) ) ( ON ?auto_70501 ?auto_70502 ) ( CLEAR ?auto_70501 ) ( HOLDING ?auto_70500 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70500 )
      ( MAKE-4PILE ?auto_70500 ?auto_70501 ?auto_70502 ?auto_70503 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70507 - BLOCK
      ?auto_70508 - BLOCK
      ?auto_70509 - BLOCK
      ?auto_70510 - BLOCK
    )
    :vars
    (
      ?auto_70511 - BLOCK
      ?auto_70513 - BLOCK
      ?auto_70512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70507 ?auto_70508 ) ) ( not ( = ?auto_70507 ?auto_70509 ) ) ( not ( = ?auto_70507 ?auto_70510 ) ) ( not ( = ?auto_70508 ?auto_70509 ) ) ( not ( = ?auto_70508 ?auto_70510 ) ) ( not ( = ?auto_70509 ?auto_70510 ) ) ( ON ?auto_70510 ?auto_70511 ) ( not ( = ?auto_70507 ?auto_70511 ) ) ( not ( = ?auto_70508 ?auto_70511 ) ) ( not ( = ?auto_70509 ?auto_70511 ) ) ( not ( = ?auto_70510 ?auto_70511 ) ) ( ON ?auto_70509 ?auto_70510 ) ( ON-TABLE ?auto_70513 ) ( ON ?auto_70512 ?auto_70513 ) ( ON ?auto_70511 ?auto_70512 ) ( not ( = ?auto_70513 ?auto_70512 ) ) ( not ( = ?auto_70513 ?auto_70511 ) ) ( not ( = ?auto_70513 ?auto_70510 ) ) ( not ( = ?auto_70513 ?auto_70509 ) ) ( not ( = ?auto_70512 ?auto_70511 ) ) ( not ( = ?auto_70512 ?auto_70510 ) ) ( not ( = ?auto_70512 ?auto_70509 ) ) ( not ( = ?auto_70507 ?auto_70513 ) ) ( not ( = ?auto_70507 ?auto_70512 ) ) ( not ( = ?auto_70508 ?auto_70513 ) ) ( not ( = ?auto_70508 ?auto_70512 ) ) ( ON ?auto_70508 ?auto_70509 ) ( ON ?auto_70507 ?auto_70508 ) ( CLEAR ?auto_70507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70513 ?auto_70512 ?auto_70511 ?auto_70510 ?auto_70509 ?auto_70508 )
      ( MAKE-4PILE ?auto_70507 ?auto_70508 ?auto_70509 ?auto_70510 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70516 - BLOCK
      ?auto_70517 - BLOCK
    )
    :vars
    (
      ?auto_70518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70518 ?auto_70517 ) ( CLEAR ?auto_70518 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70516 ) ( ON ?auto_70517 ?auto_70516 ) ( not ( = ?auto_70516 ?auto_70517 ) ) ( not ( = ?auto_70516 ?auto_70518 ) ) ( not ( = ?auto_70517 ?auto_70518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70518 ?auto_70517 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70519 - BLOCK
      ?auto_70520 - BLOCK
    )
    :vars
    (
      ?auto_70521 - BLOCK
      ?auto_70522 - BLOCK
      ?auto_70523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70521 ?auto_70520 ) ( CLEAR ?auto_70521 ) ( ON-TABLE ?auto_70519 ) ( ON ?auto_70520 ?auto_70519 ) ( not ( = ?auto_70519 ?auto_70520 ) ) ( not ( = ?auto_70519 ?auto_70521 ) ) ( not ( = ?auto_70520 ?auto_70521 ) ) ( HOLDING ?auto_70522 ) ( CLEAR ?auto_70523 ) ( not ( = ?auto_70519 ?auto_70522 ) ) ( not ( = ?auto_70519 ?auto_70523 ) ) ( not ( = ?auto_70520 ?auto_70522 ) ) ( not ( = ?auto_70520 ?auto_70523 ) ) ( not ( = ?auto_70521 ?auto_70522 ) ) ( not ( = ?auto_70521 ?auto_70523 ) ) ( not ( = ?auto_70522 ?auto_70523 ) ) )
    :subtasks
    ( ( !STACK ?auto_70522 ?auto_70523 )
      ( MAKE-2PILE ?auto_70519 ?auto_70520 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70524 - BLOCK
      ?auto_70525 - BLOCK
    )
    :vars
    (
      ?auto_70528 - BLOCK
      ?auto_70527 - BLOCK
      ?auto_70526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70528 ?auto_70525 ) ( ON-TABLE ?auto_70524 ) ( ON ?auto_70525 ?auto_70524 ) ( not ( = ?auto_70524 ?auto_70525 ) ) ( not ( = ?auto_70524 ?auto_70528 ) ) ( not ( = ?auto_70525 ?auto_70528 ) ) ( CLEAR ?auto_70527 ) ( not ( = ?auto_70524 ?auto_70526 ) ) ( not ( = ?auto_70524 ?auto_70527 ) ) ( not ( = ?auto_70525 ?auto_70526 ) ) ( not ( = ?auto_70525 ?auto_70527 ) ) ( not ( = ?auto_70528 ?auto_70526 ) ) ( not ( = ?auto_70528 ?auto_70527 ) ) ( not ( = ?auto_70526 ?auto_70527 ) ) ( ON ?auto_70526 ?auto_70528 ) ( CLEAR ?auto_70526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70524 ?auto_70525 ?auto_70528 )
      ( MAKE-2PILE ?auto_70524 ?auto_70525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70529 - BLOCK
      ?auto_70530 - BLOCK
    )
    :vars
    (
      ?auto_70533 - BLOCK
      ?auto_70531 - BLOCK
      ?auto_70532 - BLOCK
      ?auto_70534 - BLOCK
      ?auto_70535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70533 ?auto_70530 ) ( ON-TABLE ?auto_70529 ) ( ON ?auto_70530 ?auto_70529 ) ( not ( = ?auto_70529 ?auto_70530 ) ) ( not ( = ?auto_70529 ?auto_70533 ) ) ( not ( = ?auto_70530 ?auto_70533 ) ) ( not ( = ?auto_70529 ?auto_70531 ) ) ( not ( = ?auto_70529 ?auto_70532 ) ) ( not ( = ?auto_70530 ?auto_70531 ) ) ( not ( = ?auto_70530 ?auto_70532 ) ) ( not ( = ?auto_70533 ?auto_70531 ) ) ( not ( = ?auto_70533 ?auto_70532 ) ) ( not ( = ?auto_70531 ?auto_70532 ) ) ( ON ?auto_70531 ?auto_70533 ) ( CLEAR ?auto_70531 ) ( HOLDING ?auto_70532 ) ( CLEAR ?auto_70534 ) ( ON-TABLE ?auto_70535 ) ( ON ?auto_70534 ?auto_70535 ) ( not ( = ?auto_70535 ?auto_70534 ) ) ( not ( = ?auto_70535 ?auto_70532 ) ) ( not ( = ?auto_70534 ?auto_70532 ) ) ( not ( = ?auto_70529 ?auto_70534 ) ) ( not ( = ?auto_70529 ?auto_70535 ) ) ( not ( = ?auto_70530 ?auto_70534 ) ) ( not ( = ?auto_70530 ?auto_70535 ) ) ( not ( = ?auto_70533 ?auto_70534 ) ) ( not ( = ?auto_70533 ?auto_70535 ) ) ( not ( = ?auto_70531 ?auto_70534 ) ) ( not ( = ?auto_70531 ?auto_70535 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70535 ?auto_70534 ?auto_70532 )
      ( MAKE-2PILE ?auto_70529 ?auto_70530 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70536 - BLOCK
      ?auto_70537 - BLOCK
    )
    :vars
    (
      ?auto_70539 - BLOCK
      ?auto_70541 - BLOCK
      ?auto_70542 - BLOCK
      ?auto_70538 - BLOCK
      ?auto_70540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70539 ?auto_70537 ) ( ON-TABLE ?auto_70536 ) ( ON ?auto_70537 ?auto_70536 ) ( not ( = ?auto_70536 ?auto_70537 ) ) ( not ( = ?auto_70536 ?auto_70539 ) ) ( not ( = ?auto_70537 ?auto_70539 ) ) ( not ( = ?auto_70536 ?auto_70541 ) ) ( not ( = ?auto_70536 ?auto_70542 ) ) ( not ( = ?auto_70537 ?auto_70541 ) ) ( not ( = ?auto_70537 ?auto_70542 ) ) ( not ( = ?auto_70539 ?auto_70541 ) ) ( not ( = ?auto_70539 ?auto_70542 ) ) ( not ( = ?auto_70541 ?auto_70542 ) ) ( ON ?auto_70541 ?auto_70539 ) ( CLEAR ?auto_70538 ) ( ON-TABLE ?auto_70540 ) ( ON ?auto_70538 ?auto_70540 ) ( not ( = ?auto_70540 ?auto_70538 ) ) ( not ( = ?auto_70540 ?auto_70542 ) ) ( not ( = ?auto_70538 ?auto_70542 ) ) ( not ( = ?auto_70536 ?auto_70538 ) ) ( not ( = ?auto_70536 ?auto_70540 ) ) ( not ( = ?auto_70537 ?auto_70538 ) ) ( not ( = ?auto_70537 ?auto_70540 ) ) ( not ( = ?auto_70539 ?auto_70538 ) ) ( not ( = ?auto_70539 ?auto_70540 ) ) ( not ( = ?auto_70541 ?auto_70538 ) ) ( not ( = ?auto_70541 ?auto_70540 ) ) ( ON ?auto_70542 ?auto_70541 ) ( CLEAR ?auto_70542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70536 ?auto_70537 ?auto_70539 ?auto_70541 )
      ( MAKE-2PILE ?auto_70536 ?auto_70537 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70543 - BLOCK
      ?auto_70544 - BLOCK
    )
    :vars
    (
      ?auto_70549 - BLOCK
      ?auto_70548 - BLOCK
      ?auto_70547 - BLOCK
      ?auto_70545 - BLOCK
      ?auto_70546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70549 ?auto_70544 ) ( ON-TABLE ?auto_70543 ) ( ON ?auto_70544 ?auto_70543 ) ( not ( = ?auto_70543 ?auto_70544 ) ) ( not ( = ?auto_70543 ?auto_70549 ) ) ( not ( = ?auto_70544 ?auto_70549 ) ) ( not ( = ?auto_70543 ?auto_70548 ) ) ( not ( = ?auto_70543 ?auto_70547 ) ) ( not ( = ?auto_70544 ?auto_70548 ) ) ( not ( = ?auto_70544 ?auto_70547 ) ) ( not ( = ?auto_70549 ?auto_70548 ) ) ( not ( = ?auto_70549 ?auto_70547 ) ) ( not ( = ?auto_70548 ?auto_70547 ) ) ( ON ?auto_70548 ?auto_70549 ) ( ON-TABLE ?auto_70545 ) ( not ( = ?auto_70545 ?auto_70546 ) ) ( not ( = ?auto_70545 ?auto_70547 ) ) ( not ( = ?auto_70546 ?auto_70547 ) ) ( not ( = ?auto_70543 ?auto_70546 ) ) ( not ( = ?auto_70543 ?auto_70545 ) ) ( not ( = ?auto_70544 ?auto_70546 ) ) ( not ( = ?auto_70544 ?auto_70545 ) ) ( not ( = ?auto_70549 ?auto_70546 ) ) ( not ( = ?auto_70549 ?auto_70545 ) ) ( not ( = ?auto_70548 ?auto_70546 ) ) ( not ( = ?auto_70548 ?auto_70545 ) ) ( ON ?auto_70547 ?auto_70548 ) ( CLEAR ?auto_70547 ) ( HOLDING ?auto_70546 ) ( CLEAR ?auto_70545 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70545 ?auto_70546 )
      ( MAKE-2PILE ?auto_70543 ?auto_70544 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70550 - BLOCK
      ?auto_70551 - BLOCK
    )
    :vars
    (
      ?auto_70556 - BLOCK
      ?auto_70552 - BLOCK
      ?auto_70555 - BLOCK
      ?auto_70554 - BLOCK
      ?auto_70553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70556 ?auto_70551 ) ( ON-TABLE ?auto_70550 ) ( ON ?auto_70551 ?auto_70550 ) ( not ( = ?auto_70550 ?auto_70551 ) ) ( not ( = ?auto_70550 ?auto_70556 ) ) ( not ( = ?auto_70551 ?auto_70556 ) ) ( not ( = ?auto_70550 ?auto_70552 ) ) ( not ( = ?auto_70550 ?auto_70555 ) ) ( not ( = ?auto_70551 ?auto_70552 ) ) ( not ( = ?auto_70551 ?auto_70555 ) ) ( not ( = ?auto_70556 ?auto_70552 ) ) ( not ( = ?auto_70556 ?auto_70555 ) ) ( not ( = ?auto_70552 ?auto_70555 ) ) ( ON ?auto_70552 ?auto_70556 ) ( ON-TABLE ?auto_70554 ) ( not ( = ?auto_70554 ?auto_70553 ) ) ( not ( = ?auto_70554 ?auto_70555 ) ) ( not ( = ?auto_70553 ?auto_70555 ) ) ( not ( = ?auto_70550 ?auto_70553 ) ) ( not ( = ?auto_70550 ?auto_70554 ) ) ( not ( = ?auto_70551 ?auto_70553 ) ) ( not ( = ?auto_70551 ?auto_70554 ) ) ( not ( = ?auto_70556 ?auto_70553 ) ) ( not ( = ?auto_70556 ?auto_70554 ) ) ( not ( = ?auto_70552 ?auto_70553 ) ) ( not ( = ?auto_70552 ?auto_70554 ) ) ( ON ?auto_70555 ?auto_70552 ) ( CLEAR ?auto_70554 ) ( ON ?auto_70553 ?auto_70555 ) ( CLEAR ?auto_70553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70550 ?auto_70551 ?auto_70556 ?auto_70552 ?auto_70555 )
      ( MAKE-2PILE ?auto_70550 ?auto_70551 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70557 - BLOCK
      ?auto_70558 - BLOCK
    )
    :vars
    (
      ?auto_70561 - BLOCK
      ?auto_70559 - BLOCK
      ?auto_70563 - BLOCK
      ?auto_70560 - BLOCK
      ?auto_70562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70561 ?auto_70558 ) ( ON-TABLE ?auto_70557 ) ( ON ?auto_70558 ?auto_70557 ) ( not ( = ?auto_70557 ?auto_70558 ) ) ( not ( = ?auto_70557 ?auto_70561 ) ) ( not ( = ?auto_70558 ?auto_70561 ) ) ( not ( = ?auto_70557 ?auto_70559 ) ) ( not ( = ?auto_70557 ?auto_70563 ) ) ( not ( = ?auto_70558 ?auto_70559 ) ) ( not ( = ?auto_70558 ?auto_70563 ) ) ( not ( = ?auto_70561 ?auto_70559 ) ) ( not ( = ?auto_70561 ?auto_70563 ) ) ( not ( = ?auto_70559 ?auto_70563 ) ) ( ON ?auto_70559 ?auto_70561 ) ( not ( = ?auto_70560 ?auto_70562 ) ) ( not ( = ?auto_70560 ?auto_70563 ) ) ( not ( = ?auto_70562 ?auto_70563 ) ) ( not ( = ?auto_70557 ?auto_70562 ) ) ( not ( = ?auto_70557 ?auto_70560 ) ) ( not ( = ?auto_70558 ?auto_70562 ) ) ( not ( = ?auto_70558 ?auto_70560 ) ) ( not ( = ?auto_70561 ?auto_70562 ) ) ( not ( = ?auto_70561 ?auto_70560 ) ) ( not ( = ?auto_70559 ?auto_70562 ) ) ( not ( = ?auto_70559 ?auto_70560 ) ) ( ON ?auto_70563 ?auto_70559 ) ( ON ?auto_70562 ?auto_70563 ) ( CLEAR ?auto_70562 ) ( HOLDING ?auto_70560 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70560 )
      ( MAKE-2PILE ?auto_70557 ?auto_70558 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70564 - BLOCK
      ?auto_70565 - BLOCK
    )
    :vars
    (
      ?auto_70569 - BLOCK
      ?auto_70566 - BLOCK
      ?auto_70568 - BLOCK
      ?auto_70570 - BLOCK
      ?auto_70567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70569 ?auto_70565 ) ( ON-TABLE ?auto_70564 ) ( ON ?auto_70565 ?auto_70564 ) ( not ( = ?auto_70564 ?auto_70565 ) ) ( not ( = ?auto_70564 ?auto_70569 ) ) ( not ( = ?auto_70565 ?auto_70569 ) ) ( not ( = ?auto_70564 ?auto_70566 ) ) ( not ( = ?auto_70564 ?auto_70568 ) ) ( not ( = ?auto_70565 ?auto_70566 ) ) ( not ( = ?auto_70565 ?auto_70568 ) ) ( not ( = ?auto_70569 ?auto_70566 ) ) ( not ( = ?auto_70569 ?auto_70568 ) ) ( not ( = ?auto_70566 ?auto_70568 ) ) ( ON ?auto_70566 ?auto_70569 ) ( not ( = ?auto_70570 ?auto_70567 ) ) ( not ( = ?auto_70570 ?auto_70568 ) ) ( not ( = ?auto_70567 ?auto_70568 ) ) ( not ( = ?auto_70564 ?auto_70567 ) ) ( not ( = ?auto_70564 ?auto_70570 ) ) ( not ( = ?auto_70565 ?auto_70567 ) ) ( not ( = ?auto_70565 ?auto_70570 ) ) ( not ( = ?auto_70569 ?auto_70567 ) ) ( not ( = ?auto_70569 ?auto_70570 ) ) ( not ( = ?auto_70566 ?auto_70567 ) ) ( not ( = ?auto_70566 ?auto_70570 ) ) ( ON ?auto_70568 ?auto_70566 ) ( ON ?auto_70567 ?auto_70568 ) ( ON ?auto_70570 ?auto_70567 ) ( CLEAR ?auto_70570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70564 ?auto_70565 ?auto_70569 ?auto_70566 ?auto_70568 ?auto_70567 )
      ( MAKE-2PILE ?auto_70564 ?auto_70565 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70576 - BLOCK
      ?auto_70577 - BLOCK
      ?auto_70578 - BLOCK
      ?auto_70579 - BLOCK
      ?auto_70580 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_70580 ) ( CLEAR ?auto_70579 ) ( ON-TABLE ?auto_70576 ) ( ON ?auto_70577 ?auto_70576 ) ( ON ?auto_70578 ?auto_70577 ) ( ON ?auto_70579 ?auto_70578 ) ( not ( = ?auto_70576 ?auto_70577 ) ) ( not ( = ?auto_70576 ?auto_70578 ) ) ( not ( = ?auto_70576 ?auto_70579 ) ) ( not ( = ?auto_70576 ?auto_70580 ) ) ( not ( = ?auto_70577 ?auto_70578 ) ) ( not ( = ?auto_70577 ?auto_70579 ) ) ( not ( = ?auto_70577 ?auto_70580 ) ) ( not ( = ?auto_70578 ?auto_70579 ) ) ( not ( = ?auto_70578 ?auto_70580 ) ) ( not ( = ?auto_70579 ?auto_70580 ) ) )
    :subtasks
    ( ( !STACK ?auto_70580 ?auto_70579 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70581 - BLOCK
      ?auto_70582 - BLOCK
      ?auto_70583 - BLOCK
      ?auto_70584 - BLOCK
      ?auto_70585 - BLOCK
    )
    :vars
    (
      ?auto_70586 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70584 ) ( ON-TABLE ?auto_70581 ) ( ON ?auto_70582 ?auto_70581 ) ( ON ?auto_70583 ?auto_70582 ) ( ON ?auto_70584 ?auto_70583 ) ( not ( = ?auto_70581 ?auto_70582 ) ) ( not ( = ?auto_70581 ?auto_70583 ) ) ( not ( = ?auto_70581 ?auto_70584 ) ) ( not ( = ?auto_70581 ?auto_70585 ) ) ( not ( = ?auto_70582 ?auto_70583 ) ) ( not ( = ?auto_70582 ?auto_70584 ) ) ( not ( = ?auto_70582 ?auto_70585 ) ) ( not ( = ?auto_70583 ?auto_70584 ) ) ( not ( = ?auto_70583 ?auto_70585 ) ) ( not ( = ?auto_70584 ?auto_70585 ) ) ( ON ?auto_70585 ?auto_70586 ) ( CLEAR ?auto_70585 ) ( HAND-EMPTY ) ( not ( = ?auto_70581 ?auto_70586 ) ) ( not ( = ?auto_70582 ?auto_70586 ) ) ( not ( = ?auto_70583 ?auto_70586 ) ) ( not ( = ?auto_70584 ?auto_70586 ) ) ( not ( = ?auto_70585 ?auto_70586 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70585 ?auto_70586 )
      ( MAKE-5PILE ?auto_70581 ?auto_70582 ?auto_70583 ?auto_70584 ?auto_70585 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70587 - BLOCK
      ?auto_70588 - BLOCK
      ?auto_70589 - BLOCK
      ?auto_70590 - BLOCK
      ?auto_70591 - BLOCK
    )
    :vars
    (
      ?auto_70592 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70587 ) ( ON ?auto_70588 ?auto_70587 ) ( ON ?auto_70589 ?auto_70588 ) ( not ( = ?auto_70587 ?auto_70588 ) ) ( not ( = ?auto_70587 ?auto_70589 ) ) ( not ( = ?auto_70587 ?auto_70590 ) ) ( not ( = ?auto_70587 ?auto_70591 ) ) ( not ( = ?auto_70588 ?auto_70589 ) ) ( not ( = ?auto_70588 ?auto_70590 ) ) ( not ( = ?auto_70588 ?auto_70591 ) ) ( not ( = ?auto_70589 ?auto_70590 ) ) ( not ( = ?auto_70589 ?auto_70591 ) ) ( not ( = ?auto_70590 ?auto_70591 ) ) ( ON ?auto_70591 ?auto_70592 ) ( CLEAR ?auto_70591 ) ( not ( = ?auto_70587 ?auto_70592 ) ) ( not ( = ?auto_70588 ?auto_70592 ) ) ( not ( = ?auto_70589 ?auto_70592 ) ) ( not ( = ?auto_70590 ?auto_70592 ) ) ( not ( = ?auto_70591 ?auto_70592 ) ) ( HOLDING ?auto_70590 ) ( CLEAR ?auto_70589 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70587 ?auto_70588 ?auto_70589 ?auto_70590 )
      ( MAKE-5PILE ?auto_70587 ?auto_70588 ?auto_70589 ?auto_70590 ?auto_70591 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70593 - BLOCK
      ?auto_70594 - BLOCK
      ?auto_70595 - BLOCK
      ?auto_70596 - BLOCK
      ?auto_70597 - BLOCK
    )
    :vars
    (
      ?auto_70598 - BLOCK
      ?auto_70599 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70593 ) ( ON ?auto_70594 ?auto_70593 ) ( ON ?auto_70595 ?auto_70594 ) ( not ( = ?auto_70593 ?auto_70594 ) ) ( not ( = ?auto_70593 ?auto_70595 ) ) ( not ( = ?auto_70593 ?auto_70596 ) ) ( not ( = ?auto_70593 ?auto_70597 ) ) ( not ( = ?auto_70594 ?auto_70595 ) ) ( not ( = ?auto_70594 ?auto_70596 ) ) ( not ( = ?auto_70594 ?auto_70597 ) ) ( not ( = ?auto_70595 ?auto_70596 ) ) ( not ( = ?auto_70595 ?auto_70597 ) ) ( not ( = ?auto_70596 ?auto_70597 ) ) ( ON ?auto_70597 ?auto_70598 ) ( not ( = ?auto_70593 ?auto_70598 ) ) ( not ( = ?auto_70594 ?auto_70598 ) ) ( not ( = ?auto_70595 ?auto_70598 ) ) ( not ( = ?auto_70596 ?auto_70598 ) ) ( not ( = ?auto_70597 ?auto_70598 ) ) ( CLEAR ?auto_70595 ) ( ON ?auto_70596 ?auto_70597 ) ( CLEAR ?auto_70596 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70599 ) ( ON ?auto_70598 ?auto_70599 ) ( not ( = ?auto_70599 ?auto_70598 ) ) ( not ( = ?auto_70599 ?auto_70597 ) ) ( not ( = ?auto_70599 ?auto_70596 ) ) ( not ( = ?auto_70593 ?auto_70599 ) ) ( not ( = ?auto_70594 ?auto_70599 ) ) ( not ( = ?auto_70595 ?auto_70599 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70599 ?auto_70598 ?auto_70597 )
      ( MAKE-5PILE ?auto_70593 ?auto_70594 ?auto_70595 ?auto_70596 ?auto_70597 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70600 - BLOCK
      ?auto_70601 - BLOCK
      ?auto_70602 - BLOCK
      ?auto_70603 - BLOCK
      ?auto_70604 - BLOCK
    )
    :vars
    (
      ?auto_70605 - BLOCK
      ?auto_70606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70600 ) ( ON ?auto_70601 ?auto_70600 ) ( not ( = ?auto_70600 ?auto_70601 ) ) ( not ( = ?auto_70600 ?auto_70602 ) ) ( not ( = ?auto_70600 ?auto_70603 ) ) ( not ( = ?auto_70600 ?auto_70604 ) ) ( not ( = ?auto_70601 ?auto_70602 ) ) ( not ( = ?auto_70601 ?auto_70603 ) ) ( not ( = ?auto_70601 ?auto_70604 ) ) ( not ( = ?auto_70602 ?auto_70603 ) ) ( not ( = ?auto_70602 ?auto_70604 ) ) ( not ( = ?auto_70603 ?auto_70604 ) ) ( ON ?auto_70604 ?auto_70605 ) ( not ( = ?auto_70600 ?auto_70605 ) ) ( not ( = ?auto_70601 ?auto_70605 ) ) ( not ( = ?auto_70602 ?auto_70605 ) ) ( not ( = ?auto_70603 ?auto_70605 ) ) ( not ( = ?auto_70604 ?auto_70605 ) ) ( ON ?auto_70603 ?auto_70604 ) ( CLEAR ?auto_70603 ) ( ON-TABLE ?auto_70606 ) ( ON ?auto_70605 ?auto_70606 ) ( not ( = ?auto_70606 ?auto_70605 ) ) ( not ( = ?auto_70606 ?auto_70604 ) ) ( not ( = ?auto_70606 ?auto_70603 ) ) ( not ( = ?auto_70600 ?auto_70606 ) ) ( not ( = ?auto_70601 ?auto_70606 ) ) ( not ( = ?auto_70602 ?auto_70606 ) ) ( HOLDING ?auto_70602 ) ( CLEAR ?auto_70601 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70600 ?auto_70601 ?auto_70602 )
      ( MAKE-5PILE ?auto_70600 ?auto_70601 ?auto_70602 ?auto_70603 ?auto_70604 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70607 - BLOCK
      ?auto_70608 - BLOCK
      ?auto_70609 - BLOCK
      ?auto_70610 - BLOCK
      ?auto_70611 - BLOCK
    )
    :vars
    (
      ?auto_70613 - BLOCK
      ?auto_70612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70607 ) ( ON ?auto_70608 ?auto_70607 ) ( not ( = ?auto_70607 ?auto_70608 ) ) ( not ( = ?auto_70607 ?auto_70609 ) ) ( not ( = ?auto_70607 ?auto_70610 ) ) ( not ( = ?auto_70607 ?auto_70611 ) ) ( not ( = ?auto_70608 ?auto_70609 ) ) ( not ( = ?auto_70608 ?auto_70610 ) ) ( not ( = ?auto_70608 ?auto_70611 ) ) ( not ( = ?auto_70609 ?auto_70610 ) ) ( not ( = ?auto_70609 ?auto_70611 ) ) ( not ( = ?auto_70610 ?auto_70611 ) ) ( ON ?auto_70611 ?auto_70613 ) ( not ( = ?auto_70607 ?auto_70613 ) ) ( not ( = ?auto_70608 ?auto_70613 ) ) ( not ( = ?auto_70609 ?auto_70613 ) ) ( not ( = ?auto_70610 ?auto_70613 ) ) ( not ( = ?auto_70611 ?auto_70613 ) ) ( ON ?auto_70610 ?auto_70611 ) ( ON-TABLE ?auto_70612 ) ( ON ?auto_70613 ?auto_70612 ) ( not ( = ?auto_70612 ?auto_70613 ) ) ( not ( = ?auto_70612 ?auto_70611 ) ) ( not ( = ?auto_70612 ?auto_70610 ) ) ( not ( = ?auto_70607 ?auto_70612 ) ) ( not ( = ?auto_70608 ?auto_70612 ) ) ( not ( = ?auto_70609 ?auto_70612 ) ) ( CLEAR ?auto_70608 ) ( ON ?auto_70609 ?auto_70610 ) ( CLEAR ?auto_70609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70612 ?auto_70613 ?auto_70611 ?auto_70610 )
      ( MAKE-5PILE ?auto_70607 ?auto_70608 ?auto_70609 ?auto_70610 ?auto_70611 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70614 - BLOCK
      ?auto_70615 - BLOCK
      ?auto_70616 - BLOCK
      ?auto_70617 - BLOCK
      ?auto_70618 - BLOCK
    )
    :vars
    (
      ?auto_70620 - BLOCK
      ?auto_70619 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70614 ) ( not ( = ?auto_70614 ?auto_70615 ) ) ( not ( = ?auto_70614 ?auto_70616 ) ) ( not ( = ?auto_70614 ?auto_70617 ) ) ( not ( = ?auto_70614 ?auto_70618 ) ) ( not ( = ?auto_70615 ?auto_70616 ) ) ( not ( = ?auto_70615 ?auto_70617 ) ) ( not ( = ?auto_70615 ?auto_70618 ) ) ( not ( = ?auto_70616 ?auto_70617 ) ) ( not ( = ?auto_70616 ?auto_70618 ) ) ( not ( = ?auto_70617 ?auto_70618 ) ) ( ON ?auto_70618 ?auto_70620 ) ( not ( = ?auto_70614 ?auto_70620 ) ) ( not ( = ?auto_70615 ?auto_70620 ) ) ( not ( = ?auto_70616 ?auto_70620 ) ) ( not ( = ?auto_70617 ?auto_70620 ) ) ( not ( = ?auto_70618 ?auto_70620 ) ) ( ON ?auto_70617 ?auto_70618 ) ( ON-TABLE ?auto_70619 ) ( ON ?auto_70620 ?auto_70619 ) ( not ( = ?auto_70619 ?auto_70620 ) ) ( not ( = ?auto_70619 ?auto_70618 ) ) ( not ( = ?auto_70619 ?auto_70617 ) ) ( not ( = ?auto_70614 ?auto_70619 ) ) ( not ( = ?auto_70615 ?auto_70619 ) ) ( not ( = ?auto_70616 ?auto_70619 ) ) ( ON ?auto_70616 ?auto_70617 ) ( CLEAR ?auto_70616 ) ( HOLDING ?auto_70615 ) ( CLEAR ?auto_70614 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70614 ?auto_70615 )
      ( MAKE-5PILE ?auto_70614 ?auto_70615 ?auto_70616 ?auto_70617 ?auto_70618 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70621 - BLOCK
      ?auto_70622 - BLOCK
      ?auto_70623 - BLOCK
      ?auto_70624 - BLOCK
      ?auto_70625 - BLOCK
    )
    :vars
    (
      ?auto_70626 - BLOCK
      ?auto_70627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70621 ) ( not ( = ?auto_70621 ?auto_70622 ) ) ( not ( = ?auto_70621 ?auto_70623 ) ) ( not ( = ?auto_70621 ?auto_70624 ) ) ( not ( = ?auto_70621 ?auto_70625 ) ) ( not ( = ?auto_70622 ?auto_70623 ) ) ( not ( = ?auto_70622 ?auto_70624 ) ) ( not ( = ?auto_70622 ?auto_70625 ) ) ( not ( = ?auto_70623 ?auto_70624 ) ) ( not ( = ?auto_70623 ?auto_70625 ) ) ( not ( = ?auto_70624 ?auto_70625 ) ) ( ON ?auto_70625 ?auto_70626 ) ( not ( = ?auto_70621 ?auto_70626 ) ) ( not ( = ?auto_70622 ?auto_70626 ) ) ( not ( = ?auto_70623 ?auto_70626 ) ) ( not ( = ?auto_70624 ?auto_70626 ) ) ( not ( = ?auto_70625 ?auto_70626 ) ) ( ON ?auto_70624 ?auto_70625 ) ( ON-TABLE ?auto_70627 ) ( ON ?auto_70626 ?auto_70627 ) ( not ( = ?auto_70627 ?auto_70626 ) ) ( not ( = ?auto_70627 ?auto_70625 ) ) ( not ( = ?auto_70627 ?auto_70624 ) ) ( not ( = ?auto_70621 ?auto_70627 ) ) ( not ( = ?auto_70622 ?auto_70627 ) ) ( not ( = ?auto_70623 ?auto_70627 ) ) ( ON ?auto_70623 ?auto_70624 ) ( CLEAR ?auto_70621 ) ( ON ?auto_70622 ?auto_70623 ) ( CLEAR ?auto_70622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70627 ?auto_70626 ?auto_70625 ?auto_70624 ?auto_70623 )
      ( MAKE-5PILE ?auto_70621 ?auto_70622 ?auto_70623 ?auto_70624 ?auto_70625 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70628 - BLOCK
      ?auto_70629 - BLOCK
      ?auto_70630 - BLOCK
      ?auto_70631 - BLOCK
      ?auto_70632 - BLOCK
    )
    :vars
    (
      ?auto_70633 - BLOCK
      ?auto_70634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70628 ?auto_70629 ) ) ( not ( = ?auto_70628 ?auto_70630 ) ) ( not ( = ?auto_70628 ?auto_70631 ) ) ( not ( = ?auto_70628 ?auto_70632 ) ) ( not ( = ?auto_70629 ?auto_70630 ) ) ( not ( = ?auto_70629 ?auto_70631 ) ) ( not ( = ?auto_70629 ?auto_70632 ) ) ( not ( = ?auto_70630 ?auto_70631 ) ) ( not ( = ?auto_70630 ?auto_70632 ) ) ( not ( = ?auto_70631 ?auto_70632 ) ) ( ON ?auto_70632 ?auto_70633 ) ( not ( = ?auto_70628 ?auto_70633 ) ) ( not ( = ?auto_70629 ?auto_70633 ) ) ( not ( = ?auto_70630 ?auto_70633 ) ) ( not ( = ?auto_70631 ?auto_70633 ) ) ( not ( = ?auto_70632 ?auto_70633 ) ) ( ON ?auto_70631 ?auto_70632 ) ( ON-TABLE ?auto_70634 ) ( ON ?auto_70633 ?auto_70634 ) ( not ( = ?auto_70634 ?auto_70633 ) ) ( not ( = ?auto_70634 ?auto_70632 ) ) ( not ( = ?auto_70634 ?auto_70631 ) ) ( not ( = ?auto_70628 ?auto_70634 ) ) ( not ( = ?auto_70629 ?auto_70634 ) ) ( not ( = ?auto_70630 ?auto_70634 ) ) ( ON ?auto_70630 ?auto_70631 ) ( ON ?auto_70629 ?auto_70630 ) ( CLEAR ?auto_70629 ) ( HOLDING ?auto_70628 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70628 )
      ( MAKE-5PILE ?auto_70628 ?auto_70629 ?auto_70630 ?auto_70631 ?auto_70632 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70635 - BLOCK
      ?auto_70636 - BLOCK
      ?auto_70637 - BLOCK
      ?auto_70638 - BLOCK
      ?auto_70639 - BLOCK
    )
    :vars
    (
      ?auto_70640 - BLOCK
      ?auto_70641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70635 ?auto_70636 ) ) ( not ( = ?auto_70635 ?auto_70637 ) ) ( not ( = ?auto_70635 ?auto_70638 ) ) ( not ( = ?auto_70635 ?auto_70639 ) ) ( not ( = ?auto_70636 ?auto_70637 ) ) ( not ( = ?auto_70636 ?auto_70638 ) ) ( not ( = ?auto_70636 ?auto_70639 ) ) ( not ( = ?auto_70637 ?auto_70638 ) ) ( not ( = ?auto_70637 ?auto_70639 ) ) ( not ( = ?auto_70638 ?auto_70639 ) ) ( ON ?auto_70639 ?auto_70640 ) ( not ( = ?auto_70635 ?auto_70640 ) ) ( not ( = ?auto_70636 ?auto_70640 ) ) ( not ( = ?auto_70637 ?auto_70640 ) ) ( not ( = ?auto_70638 ?auto_70640 ) ) ( not ( = ?auto_70639 ?auto_70640 ) ) ( ON ?auto_70638 ?auto_70639 ) ( ON-TABLE ?auto_70641 ) ( ON ?auto_70640 ?auto_70641 ) ( not ( = ?auto_70641 ?auto_70640 ) ) ( not ( = ?auto_70641 ?auto_70639 ) ) ( not ( = ?auto_70641 ?auto_70638 ) ) ( not ( = ?auto_70635 ?auto_70641 ) ) ( not ( = ?auto_70636 ?auto_70641 ) ) ( not ( = ?auto_70637 ?auto_70641 ) ) ( ON ?auto_70637 ?auto_70638 ) ( ON ?auto_70636 ?auto_70637 ) ( ON ?auto_70635 ?auto_70636 ) ( CLEAR ?auto_70635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70641 ?auto_70640 ?auto_70639 ?auto_70638 ?auto_70637 ?auto_70636 )
      ( MAKE-5PILE ?auto_70635 ?auto_70636 ?auto_70637 ?auto_70638 ?auto_70639 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70643 - BLOCK
    )
    :vars
    (
      ?auto_70644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70644 ?auto_70643 ) ( CLEAR ?auto_70644 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70643 ) ( not ( = ?auto_70643 ?auto_70644 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70644 ?auto_70643 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70645 - BLOCK
    )
    :vars
    (
      ?auto_70646 - BLOCK
      ?auto_70647 - BLOCK
      ?auto_70648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70646 ?auto_70645 ) ( CLEAR ?auto_70646 ) ( ON-TABLE ?auto_70645 ) ( not ( = ?auto_70645 ?auto_70646 ) ) ( HOLDING ?auto_70647 ) ( CLEAR ?auto_70648 ) ( not ( = ?auto_70645 ?auto_70647 ) ) ( not ( = ?auto_70645 ?auto_70648 ) ) ( not ( = ?auto_70646 ?auto_70647 ) ) ( not ( = ?auto_70646 ?auto_70648 ) ) ( not ( = ?auto_70647 ?auto_70648 ) ) )
    :subtasks
    ( ( !STACK ?auto_70647 ?auto_70648 )
      ( MAKE-1PILE ?auto_70645 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70649 - BLOCK
    )
    :vars
    (
      ?auto_70651 - BLOCK
      ?auto_70652 - BLOCK
      ?auto_70650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70651 ?auto_70649 ) ( ON-TABLE ?auto_70649 ) ( not ( = ?auto_70649 ?auto_70651 ) ) ( CLEAR ?auto_70652 ) ( not ( = ?auto_70649 ?auto_70650 ) ) ( not ( = ?auto_70649 ?auto_70652 ) ) ( not ( = ?auto_70651 ?auto_70650 ) ) ( not ( = ?auto_70651 ?auto_70652 ) ) ( not ( = ?auto_70650 ?auto_70652 ) ) ( ON ?auto_70650 ?auto_70651 ) ( CLEAR ?auto_70650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70649 ?auto_70651 )
      ( MAKE-1PILE ?auto_70649 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70653 - BLOCK
    )
    :vars
    (
      ?auto_70656 - BLOCK
      ?auto_70654 - BLOCK
      ?auto_70655 - BLOCK
      ?auto_70657 - BLOCK
      ?auto_70658 - BLOCK
      ?auto_70659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70656 ?auto_70653 ) ( ON-TABLE ?auto_70653 ) ( not ( = ?auto_70653 ?auto_70656 ) ) ( not ( = ?auto_70653 ?auto_70654 ) ) ( not ( = ?auto_70653 ?auto_70655 ) ) ( not ( = ?auto_70656 ?auto_70654 ) ) ( not ( = ?auto_70656 ?auto_70655 ) ) ( not ( = ?auto_70654 ?auto_70655 ) ) ( ON ?auto_70654 ?auto_70656 ) ( CLEAR ?auto_70654 ) ( HOLDING ?auto_70655 ) ( CLEAR ?auto_70657 ) ( ON-TABLE ?auto_70658 ) ( ON ?auto_70659 ?auto_70658 ) ( ON ?auto_70657 ?auto_70659 ) ( not ( = ?auto_70658 ?auto_70659 ) ) ( not ( = ?auto_70658 ?auto_70657 ) ) ( not ( = ?auto_70658 ?auto_70655 ) ) ( not ( = ?auto_70659 ?auto_70657 ) ) ( not ( = ?auto_70659 ?auto_70655 ) ) ( not ( = ?auto_70657 ?auto_70655 ) ) ( not ( = ?auto_70653 ?auto_70657 ) ) ( not ( = ?auto_70653 ?auto_70658 ) ) ( not ( = ?auto_70653 ?auto_70659 ) ) ( not ( = ?auto_70656 ?auto_70657 ) ) ( not ( = ?auto_70656 ?auto_70658 ) ) ( not ( = ?auto_70656 ?auto_70659 ) ) ( not ( = ?auto_70654 ?auto_70657 ) ) ( not ( = ?auto_70654 ?auto_70658 ) ) ( not ( = ?auto_70654 ?auto_70659 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70658 ?auto_70659 ?auto_70657 ?auto_70655 )
      ( MAKE-1PILE ?auto_70653 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70660 - BLOCK
    )
    :vars
    (
      ?auto_70661 - BLOCK
      ?auto_70662 - BLOCK
      ?auto_70663 - BLOCK
      ?auto_70666 - BLOCK
      ?auto_70664 - BLOCK
      ?auto_70665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70661 ?auto_70660 ) ( ON-TABLE ?auto_70660 ) ( not ( = ?auto_70660 ?auto_70661 ) ) ( not ( = ?auto_70660 ?auto_70662 ) ) ( not ( = ?auto_70660 ?auto_70663 ) ) ( not ( = ?auto_70661 ?auto_70662 ) ) ( not ( = ?auto_70661 ?auto_70663 ) ) ( not ( = ?auto_70662 ?auto_70663 ) ) ( ON ?auto_70662 ?auto_70661 ) ( CLEAR ?auto_70666 ) ( ON-TABLE ?auto_70664 ) ( ON ?auto_70665 ?auto_70664 ) ( ON ?auto_70666 ?auto_70665 ) ( not ( = ?auto_70664 ?auto_70665 ) ) ( not ( = ?auto_70664 ?auto_70666 ) ) ( not ( = ?auto_70664 ?auto_70663 ) ) ( not ( = ?auto_70665 ?auto_70666 ) ) ( not ( = ?auto_70665 ?auto_70663 ) ) ( not ( = ?auto_70666 ?auto_70663 ) ) ( not ( = ?auto_70660 ?auto_70666 ) ) ( not ( = ?auto_70660 ?auto_70664 ) ) ( not ( = ?auto_70660 ?auto_70665 ) ) ( not ( = ?auto_70661 ?auto_70666 ) ) ( not ( = ?auto_70661 ?auto_70664 ) ) ( not ( = ?auto_70661 ?auto_70665 ) ) ( not ( = ?auto_70662 ?auto_70666 ) ) ( not ( = ?auto_70662 ?auto_70664 ) ) ( not ( = ?auto_70662 ?auto_70665 ) ) ( ON ?auto_70663 ?auto_70662 ) ( CLEAR ?auto_70663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70660 ?auto_70661 ?auto_70662 )
      ( MAKE-1PILE ?auto_70660 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70667 - BLOCK
    )
    :vars
    (
      ?auto_70673 - BLOCK
      ?auto_70670 - BLOCK
      ?auto_70671 - BLOCK
      ?auto_70669 - BLOCK
      ?auto_70668 - BLOCK
      ?auto_70672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70673 ?auto_70667 ) ( ON-TABLE ?auto_70667 ) ( not ( = ?auto_70667 ?auto_70673 ) ) ( not ( = ?auto_70667 ?auto_70670 ) ) ( not ( = ?auto_70667 ?auto_70671 ) ) ( not ( = ?auto_70673 ?auto_70670 ) ) ( not ( = ?auto_70673 ?auto_70671 ) ) ( not ( = ?auto_70670 ?auto_70671 ) ) ( ON ?auto_70670 ?auto_70673 ) ( ON-TABLE ?auto_70669 ) ( ON ?auto_70668 ?auto_70669 ) ( not ( = ?auto_70669 ?auto_70668 ) ) ( not ( = ?auto_70669 ?auto_70672 ) ) ( not ( = ?auto_70669 ?auto_70671 ) ) ( not ( = ?auto_70668 ?auto_70672 ) ) ( not ( = ?auto_70668 ?auto_70671 ) ) ( not ( = ?auto_70672 ?auto_70671 ) ) ( not ( = ?auto_70667 ?auto_70672 ) ) ( not ( = ?auto_70667 ?auto_70669 ) ) ( not ( = ?auto_70667 ?auto_70668 ) ) ( not ( = ?auto_70673 ?auto_70672 ) ) ( not ( = ?auto_70673 ?auto_70669 ) ) ( not ( = ?auto_70673 ?auto_70668 ) ) ( not ( = ?auto_70670 ?auto_70672 ) ) ( not ( = ?auto_70670 ?auto_70669 ) ) ( not ( = ?auto_70670 ?auto_70668 ) ) ( ON ?auto_70671 ?auto_70670 ) ( CLEAR ?auto_70671 ) ( HOLDING ?auto_70672 ) ( CLEAR ?auto_70668 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70669 ?auto_70668 ?auto_70672 )
      ( MAKE-1PILE ?auto_70667 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70674 - BLOCK
    )
    :vars
    (
      ?auto_70680 - BLOCK
      ?auto_70678 - BLOCK
      ?auto_70679 - BLOCK
      ?auto_70677 - BLOCK
      ?auto_70676 - BLOCK
      ?auto_70675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70680 ?auto_70674 ) ( ON-TABLE ?auto_70674 ) ( not ( = ?auto_70674 ?auto_70680 ) ) ( not ( = ?auto_70674 ?auto_70678 ) ) ( not ( = ?auto_70674 ?auto_70679 ) ) ( not ( = ?auto_70680 ?auto_70678 ) ) ( not ( = ?auto_70680 ?auto_70679 ) ) ( not ( = ?auto_70678 ?auto_70679 ) ) ( ON ?auto_70678 ?auto_70680 ) ( ON-TABLE ?auto_70677 ) ( ON ?auto_70676 ?auto_70677 ) ( not ( = ?auto_70677 ?auto_70676 ) ) ( not ( = ?auto_70677 ?auto_70675 ) ) ( not ( = ?auto_70677 ?auto_70679 ) ) ( not ( = ?auto_70676 ?auto_70675 ) ) ( not ( = ?auto_70676 ?auto_70679 ) ) ( not ( = ?auto_70675 ?auto_70679 ) ) ( not ( = ?auto_70674 ?auto_70675 ) ) ( not ( = ?auto_70674 ?auto_70677 ) ) ( not ( = ?auto_70674 ?auto_70676 ) ) ( not ( = ?auto_70680 ?auto_70675 ) ) ( not ( = ?auto_70680 ?auto_70677 ) ) ( not ( = ?auto_70680 ?auto_70676 ) ) ( not ( = ?auto_70678 ?auto_70675 ) ) ( not ( = ?auto_70678 ?auto_70677 ) ) ( not ( = ?auto_70678 ?auto_70676 ) ) ( ON ?auto_70679 ?auto_70678 ) ( CLEAR ?auto_70676 ) ( ON ?auto_70675 ?auto_70679 ) ( CLEAR ?auto_70675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70674 ?auto_70680 ?auto_70678 ?auto_70679 )
      ( MAKE-1PILE ?auto_70674 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70681 - BLOCK
    )
    :vars
    (
      ?auto_70682 - BLOCK
      ?auto_70685 - BLOCK
      ?auto_70684 - BLOCK
      ?auto_70687 - BLOCK
      ?auto_70686 - BLOCK
      ?auto_70683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70682 ?auto_70681 ) ( ON-TABLE ?auto_70681 ) ( not ( = ?auto_70681 ?auto_70682 ) ) ( not ( = ?auto_70681 ?auto_70685 ) ) ( not ( = ?auto_70681 ?auto_70684 ) ) ( not ( = ?auto_70682 ?auto_70685 ) ) ( not ( = ?auto_70682 ?auto_70684 ) ) ( not ( = ?auto_70685 ?auto_70684 ) ) ( ON ?auto_70685 ?auto_70682 ) ( ON-TABLE ?auto_70687 ) ( not ( = ?auto_70687 ?auto_70686 ) ) ( not ( = ?auto_70687 ?auto_70683 ) ) ( not ( = ?auto_70687 ?auto_70684 ) ) ( not ( = ?auto_70686 ?auto_70683 ) ) ( not ( = ?auto_70686 ?auto_70684 ) ) ( not ( = ?auto_70683 ?auto_70684 ) ) ( not ( = ?auto_70681 ?auto_70683 ) ) ( not ( = ?auto_70681 ?auto_70687 ) ) ( not ( = ?auto_70681 ?auto_70686 ) ) ( not ( = ?auto_70682 ?auto_70683 ) ) ( not ( = ?auto_70682 ?auto_70687 ) ) ( not ( = ?auto_70682 ?auto_70686 ) ) ( not ( = ?auto_70685 ?auto_70683 ) ) ( not ( = ?auto_70685 ?auto_70687 ) ) ( not ( = ?auto_70685 ?auto_70686 ) ) ( ON ?auto_70684 ?auto_70685 ) ( ON ?auto_70683 ?auto_70684 ) ( CLEAR ?auto_70683 ) ( HOLDING ?auto_70686 ) ( CLEAR ?auto_70687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70687 ?auto_70686 )
      ( MAKE-1PILE ?auto_70681 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70688 - BLOCK
    )
    :vars
    (
      ?auto_70690 - BLOCK
      ?auto_70689 - BLOCK
      ?auto_70694 - BLOCK
      ?auto_70691 - BLOCK
      ?auto_70692 - BLOCK
      ?auto_70693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70690 ?auto_70688 ) ( ON-TABLE ?auto_70688 ) ( not ( = ?auto_70688 ?auto_70690 ) ) ( not ( = ?auto_70688 ?auto_70689 ) ) ( not ( = ?auto_70688 ?auto_70694 ) ) ( not ( = ?auto_70690 ?auto_70689 ) ) ( not ( = ?auto_70690 ?auto_70694 ) ) ( not ( = ?auto_70689 ?auto_70694 ) ) ( ON ?auto_70689 ?auto_70690 ) ( ON-TABLE ?auto_70691 ) ( not ( = ?auto_70691 ?auto_70692 ) ) ( not ( = ?auto_70691 ?auto_70693 ) ) ( not ( = ?auto_70691 ?auto_70694 ) ) ( not ( = ?auto_70692 ?auto_70693 ) ) ( not ( = ?auto_70692 ?auto_70694 ) ) ( not ( = ?auto_70693 ?auto_70694 ) ) ( not ( = ?auto_70688 ?auto_70693 ) ) ( not ( = ?auto_70688 ?auto_70691 ) ) ( not ( = ?auto_70688 ?auto_70692 ) ) ( not ( = ?auto_70690 ?auto_70693 ) ) ( not ( = ?auto_70690 ?auto_70691 ) ) ( not ( = ?auto_70690 ?auto_70692 ) ) ( not ( = ?auto_70689 ?auto_70693 ) ) ( not ( = ?auto_70689 ?auto_70691 ) ) ( not ( = ?auto_70689 ?auto_70692 ) ) ( ON ?auto_70694 ?auto_70689 ) ( ON ?auto_70693 ?auto_70694 ) ( CLEAR ?auto_70691 ) ( ON ?auto_70692 ?auto_70693 ) ( CLEAR ?auto_70692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70688 ?auto_70690 ?auto_70689 ?auto_70694 ?auto_70693 )
      ( MAKE-1PILE ?auto_70688 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70695 - BLOCK
    )
    :vars
    (
      ?auto_70701 - BLOCK
      ?auto_70699 - BLOCK
      ?auto_70700 - BLOCK
      ?auto_70697 - BLOCK
      ?auto_70698 - BLOCK
      ?auto_70696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70701 ?auto_70695 ) ( ON-TABLE ?auto_70695 ) ( not ( = ?auto_70695 ?auto_70701 ) ) ( not ( = ?auto_70695 ?auto_70699 ) ) ( not ( = ?auto_70695 ?auto_70700 ) ) ( not ( = ?auto_70701 ?auto_70699 ) ) ( not ( = ?auto_70701 ?auto_70700 ) ) ( not ( = ?auto_70699 ?auto_70700 ) ) ( ON ?auto_70699 ?auto_70701 ) ( not ( = ?auto_70697 ?auto_70698 ) ) ( not ( = ?auto_70697 ?auto_70696 ) ) ( not ( = ?auto_70697 ?auto_70700 ) ) ( not ( = ?auto_70698 ?auto_70696 ) ) ( not ( = ?auto_70698 ?auto_70700 ) ) ( not ( = ?auto_70696 ?auto_70700 ) ) ( not ( = ?auto_70695 ?auto_70696 ) ) ( not ( = ?auto_70695 ?auto_70697 ) ) ( not ( = ?auto_70695 ?auto_70698 ) ) ( not ( = ?auto_70701 ?auto_70696 ) ) ( not ( = ?auto_70701 ?auto_70697 ) ) ( not ( = ?auto_70701 ?auto_70698 ) ) ( not ( = ?auto_70699 ?auto_70696 ) ) ( not ( = ?auto_70699 ?auto_70697 ) ) ( not ( = ?auto_70699 ?auto_70698 ) ) ( ON ?auto_70700 ?auto_70699 ) ( ON ?auto_70696 ?auto_70700 ) ( ON ?auto_70698 ?auto_70696 ) ( CLEAR ?auto_70698 ) ( HOLDING ?auto_70697 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70697 )
      ( MAKE-1PILE ?auto_70695 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70702 - BLOCK
    )
    :vars
    (
      ?auto_70707 - BLOCK
      ?auto_70706 - BLOCK
      ?auto_70703 - BLOCK
      ?auto_70704 - BLOCK
      ?auto_70705 - BLOCK
      ?auto_70708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70707 ?auto_70702 ) ( ON-TABLE ?auto_70702 ) ( not ( = ?auto_70702 ?auto_70707 ) ) ( not ( = ?auto_70702 ?auto_70706 ) ) ( not ( = ?auto_70702 ?auto_70703 ) ) ( not ( = ?auto_70707 ?auto_70706 ) ) ( not ( = ?auto_70707 ?auto_70703 ) ) ( not ( = ?auto_70706 ?auto_70703 ) ) ( ON ?auto_70706 ?auto_70707 ) ( not ( = ?auto_70704 ?auto_70705 ) ) ( not ( = ?auto_70704 ?auto_70708 ) ) ( not ( = ?auto_70704 ?auto_70703 ) ) ( not ( = ?auto_70705 ?auto_70708 ) ) ( not ( = ?auto_70705 ?auto_70703 ) ) ( not ( = ?auto_70708 ?auto_70703 ) ) ( not ( = ?auto_70702 ?auto_70708 ) ) ( not ( = ?auto_70702 ?auto_70704 ) ) ( not ( = ?auto_70702 ?auto_70705 ) ) ( not ( = ?auto_70707 ?auto_70708 ) ) ( not ( = ?auto_70707 ?auto_70704 ) ) ( not ( = ?auto_70707 ?auto_70705 ) ) ( not ( = ?auto_70706 ?auto_70708 ) ) ( not ( = ?auto_70706 ?auto_70704 ) ) ( not ( = ?auto_70706 ?auto_70705 ) ) ( ON ?auto_70703 ?auto_70706 ) ( ON ?auto_70708 ?auto_70703 ) ( ON ?auto_70705 ?auto_70708 ) ( ON ?auto_70704 ?auto_70705 ) ( CLEAR ?auto_70704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70702 ?auto_70707 ?auto_70706 ?auto_70703 ?auto_70708 ?auto_70705 )
      ( MAKE-1PILE ?auto_70702 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70715 - BLOCK
      ?auto_70716 - BLOCK
      ?auto_70717 - BLOCK
      ?auto_70718 - BLOCK
      ?auto_70719 - BLOCK
      ?auto_70720 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_70720 ) ( CLEAR ?auto_70719 ) ( ON-TABLE ?auto_70715 ) ( ON ?auto_70716 ?auto_70715 ) ( ON ?auto_70717 ?auto_70716 ) ( ON ?auto_70718 ?auto_70717 ) ( ON ?auto_70719 ?auto_70718 ) ( not ( = ?auto_70715 ?auto_70716 ) ) ( not ( = ?auto_70715 ?auto_70717 ) ) ( not ( = ?auto_70715 ?auto_70718 ) ) ( not ( = ?auto_70715 ?auto_70719 ) ) ( not ( = ?auto_70715 ?auto_70720 ) ) ( not ( = ?auto_70716 ?auto_70717 ) ) ( not ( = ?auto_70716 ?auto_70718 ) ) ( not ( = ?auto_70716 ?auto_70719 ) ) ( not ( = ?auto_70716 ?auto_70720 ) ) ( not ( = ?auto_70717 ?auto_70718 ) ) ( not ( = ?auto_70717 ?auto_70719 ) ) ( not ( = ?auto_70717 ?auto_70720 ) ) ( not ( = ?auto_70718 ?auto_70719 ) ) ( not ( = ?auto_70718 ?auto_70720 ) ) ( not ( = ?auto_70719 ?auto_70720 ) ) )
    :subtasks
    ( ( !STACK ?auto_70720 ?auto_70719 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70721 - BLOCK
      ?auto_70722 - BLOCK
      ?auto_70723 - BLOCK
      ?auto_70724 - BLOCK
      ?auto_70725 - BLOCK
      ?auto_70726 - BLOCK
    )
    :vars
    (
      ?auto_70727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70725 ) ( ON-TABLE ?auto_70721 ) ( ON ?auto_70722 ?auto_70721 ) ( ON ?auto_70723 ?auto_70722 ) ( ON ?auto_70724 ?auto_70723 ) ( ON ?auto_70725 ?auto_70724 ) ( not ( = ?auto_70721 ?auto_70722 ) ) ( not ( = ?auto_70721 ?auto_70723 ) ) ( not ( = ?auto_70721 ?auto_70724 ) ) ( not ( = ?auto_70721 ?auto_70725 ) ) ( not ( = ?auto_70721 ?auto_70726 ) ) ( not ( = ?auto_70722 ?auto_70723 ) ) ( not ( = ?auto_70722 ?auto_70724 ) ) ( not ( = ?auto_70722 ?auto_70725 ) ) ( not ( = ?auto_70722 ?auto_70726 ) ) ( not ( = ?auto_70723 ?auto_70724 ) ) ( not ( = ?auto_70723 ?auto_70725 ) ) ( not ( = ?auto_70723 ?auto_70726 ) ) ( not ( = ?auto_70724 ?auto_70725 ) ) ( not ( = ?auto_70724 ?auto_70726 ) ) ( not ( = ?auto_70725 ?auto_70726 ) ) ( ON ?auto_70726 ?auto_70727 ) ( CLEAR ?auto_70726 ) ( HAND-EMPTY ) ( not ( = ?auto_70721 ?auto_70727 ) ) ( not ( = ?auto_70722 ?auto_70727 ) ) ( not ( = ?auto_70723 ?auto_70727 ) ) ( not ( = ?auto_70724 ?auto_70727 ) ) ( not ( = ?auto_70725 ?auto_70727 ) ) ( not ( = ?auto_70726 ?auto_70727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70726 ?auto_70727 )
      ( MAKE-6PILE ?auto_70721 ?auto_70722 ?auto_70723 ?auto_70724 ?auto_70725 ?auto_70726 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70728 - BLOCK
      ?auto_70729 - BLOCK
      ?auto_70730 - BLOCK
      ?auto_70731 - BLOCK
      ?auto_70732 - BLOCK
      ?auto_70733 - BLOCK
    )
    :vars
    (
      ?auto_70734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70728 ) ( ON ?auto_70729 ?auto_70728 ) ( ON ?auto_70730 ?auto_70729 ) ( ON ?auto_70731 ?auto_70730 ) ( not ( = ?auto_70728 ?auto_70729 ) ) ( not ( = ?auto_70728 ?auto_70730 ) ) ( not ( = ?auto_70728 ?auto_70731 ) ) ( not ( = ?auto_70728 ?auto_70732 ) ) ( not ( = ?auto_70728 ?auto_70733 ) ) ( not ( = ?auto_70729 ?auto_70730 ) ) ( not ( = ?auto_70729 ?auto_70731 ) ) ( not ( = ?auto_70729 ?auto_70732 ) ) ( not ( = ?auto_70729 ?auto_70733 ) ) ( not ( = ?auto_70730 ?auto_70731 ) ) ( not ( = ?auto_70730 ?auto_70732 ) ) ( not ( = ?auto_70730 ?auto_70733 ) ) ( not ( = ?auto_70731 ?auto_70732 ) ) ( not ( = ?auto_70731 ?auto_70733 ) ) ( not ( = ?auto_70732 ?auto_70733 ) ) ( ON ?auto_70733 ?auto_70734 ) ( CLEAR ?auto_70733 ) ( not ( = ?auto_70728 ?auto_70734 ) ) ( not ( = ?auto_70729 ?auto_70734 ) ) ( not ( = ?auto_70730 ?auto_70734 ) ) ( not ( = ?auto_70731 ?auto_70734 ) ) ( not ( = ?auto_70732 ?auto_70734 ) ) ( not ( = ?auto_70733 ?auto_70734 ) ) ( HOLDING ?auto_70732 ) ( CLEAR ?auto_70731 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70728 ?auto_70729 ?auto_70730 ?auto_70731 ?auto_70732 )
      ( MAKE-6PILE ?auto_70728 ?auto_70729 ?auto_70730 ?auto_70731 ?auto_70732 ?auto_70733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70735 - BLOCK
      ?auto_70736 - BLOCK
      ?auto_70737 - BLOCK
      ?auto_70738 - BLOCK
      ?auto_70739 - BLOCK
      ?auto_70740 - BLOCK
    )
    :vars
    (
      ?auto_70741 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70735 ) ( ON ?auto_70736 ?auto_70735 ) ( ON ?auto_70737 ?auto_70736 ) ( ON ?auto_70738 ?auto_70737 ) ( not ( = ?auto_70735 ?auto_70736 ) ) ( not ( = ?auto_70735 ?auto_70737 ) ) ( not ( = ?auto_70735 ?auto_70738 ) ) ( not ( = ?auto_70735 ?auto_70739 ) ) ( not ( = ?auto_70735 ?auto_70740 ) ) ( not ( = ?auto_70736 ?auto_70737 ) ) ( not ( = ?auto_70736 ?auto_70738 ) ) ( not ( = ?auto_70736 ?auto_70739 ) ) ( not ( = ?auto_70736 ?auto_70740 ) ) ( not ( = ?auto_70737 ?auto_70738 ) ) ( not ( = ?auto_70737 ?auto_70739 ) ) ( not ( = ?auto_70737 ?auto_70740 ) ) ( not ( = ?auto_70738 ?auto_70739 ) ) ( not ( = ?auto_70738 ?auto_70740 ) ) ( not ( = ?auto_70739 ?auto_70740 ) ) ( ON ?auto_70740 ?auto_70741 ) ( not ( = ?auto_70735 ?auto_70741 ) ) ( not ( = ?auto_70736 ?auto_70741 ) ) ( not ( = ?auto_70737 ?auto_70741 ) ) ( not ( = ?auto_70738 ?auto_70741 ) ) ( not ( = ?auto_70739 ?auto_70741 ) ) ( not ( = ?auto_70740 ?auto_70741 ) ) ( CLEAR ?auto_70738 ) ( ON ?auto_70739 ?auto_70740 ) ( CLEAR ?auto_70739 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70741 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70741 ?auto_70740 )
      ( MAKE-6PILE ?auto_70735 ?auto_70736 ?auto_70737 ?auto_70738 ?auto_70739 ?auto_70740 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70742 - BLOCK
      ?auto_70743 - BLOCK
      ?auto_70744 - BLOCK
      ?auto_70745 - BLOCK
      ?auto_70746 - BLOCK
      ?auto_70747 - BLOCK
    )
    :vars
    (
      ?auto_70748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70742 ) ( ON ?auto_70743 ?auto_70742 ) ( ON ?auto_70744 ?auto_70743 ) ( not ( = ?auto_70742 ?auto_70743 ) ) ( not ( = ?auto_70742 ?auto_70744 ) ) ( not ( = ?auto_70742 ?auto_70745 ) ) ( not ( = ?auto_70742 ?auto_70746 ) ) ( not ( = ?auto_70742 ?auto_70747 ) ) ( not ( = ?auto_70743 ?auto_70744 ) ) ( not ( = ?auto_70743 ?auto_70745 ) ) ( not ( = ?auto_70743 ?auto_70746 ) ) ( not ( = ?auto_70743 ?auto_70747 ) ) ( not ( = ?auto_70744 ?auto_70745 ) ) ( not ( = ?auto_70744 ?auto_70746 ) ) ( not ( = ?auto_70744 ?auto_70747 ) ) ( not ( = ?auto_70745 ?auto_70746 ) ) ( not ( = ?auto_70745 ?auto_70747 ) ) ( not ( = ?auto_70746 ?auto_70747 ) ) ( ON ?auto_70747 ?auto_70748 ) ( not ( = ?auto_70742 ?auto_70748 ) ) ( not ( = ?auto_70743 ?auto_70748 ) ) ( not ( = ?auto_70744 ?auto_70748 ) ) ( not ( = ?auto_70745 ?auto_70748 ) ) ( not ( = ?auto_70746 ?auto_70748 ) ) ( not ( = ?auto_70747 ?auto_70748 ) ) ( ON ?auto_70746 ?auto_70747 ) ( CLEAR ?auto_70746 ) ( ON-TABLE ?auto_70748 ) ( HOLDING ?auto_70745 ) ( CLEAR ?auto_70744 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70742 ?auto_70743 ?auto_70744 ?auto_70745 )
      ( MAKE-6PILE ?auto_70742 ?auto_70743 ?auto_70744 ?auto_70745 ?auto_70746 ?auto_70747 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70749 - BLOCK
      ?auto_70750 - BLOCK
      ?auto_70751 - BLOCK
      ?auto_70752 - BLOCK
      ?auto_70753 - BLOCK
      ?auto_70754 - BLOCK
    )
    :vars
    (
      ?auto_70755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70749 ) ( ON ?auto_70750 ?auto_70749 ) ( ON ?auto_70751 ?auto_70750 ) ( not ( = ?auto_70749 ?auto_70750 ) ) ( not ( = ?auto_70749 ?auto_70751 ) ) ( not ( = ?auto_70749 ?auto_70752 ) ) ( not ( = ?auto_70749 ?auto_70753 ) ) ( not ( = ?auto_70749 ?auto_70754 ) ) ( not ( = ?auto_70750 ?auto_70751 ) ) ( not ( = ?auto_70750 ?auto_70752 ) ) ( not ( = ?auto_70750 ?auto_70753 ) ) ( not ( = ?auto_70750 ?auto_70754 ) ) ( not ( = ?auto_70751 ?auto_70752 ) ) ( not ( = ?auto_70751 ?auto_70753 ) ) ( not ( = ?auto_70751 ?auto_70754 ) ) ( not ( = ?auto_70752 ?auto_70753 ) ) ( not ( = ?auto_70752 ?auto_70754 ) ) ( not ( = ?auto_70753 ?auto_70754 ) ) ( ON ?auto_70754 ?auto_70755 ) ( not ( = ?auto_70749 ?auto_70755 ) ) ( not ( = ?auto_70750 ?auto_70755 ) ) ( not ( = ?auto_70751 ?auto_70755 ) ) ( not ( = ?auto_70752 ?auto_70755 ) ) ( not ( = ?auto_70753 ?auto_70755 ) ) ( not ( = ?auto_70754 ?auto_70755 ) ) ( ON ?auto_70753 ?auto_70754 ) ( ON-TABLE ?auto_70755 ) ( CLEAR ?auto_70751 ) ( ON ?auto_70752 ?auto_70753 ) ( CLEAR ?auto_70752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70755 ?auto_70754 ?auto_70753 )
      ( MAKE-6PILE ?auto_70749 ?auto_70750 ?auto_70751 ?auto_70752 ?auto_70753 ?auto_70754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70756 - BLOCK
      ?auto_70757 - BLOCK
      ?auto_70758 - BLOCK
      ?auto_70759 - BLOCK
      ?auto_70760 - BLOCK
      ?auto_70761 - BLOCK
    )
    :vars
    (
      ?auto_70762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70756 ) ( ON ?auto_70757 ?auto_70756 ) ( not ( = ?auto_70756 ?auto_70757 ) ) ( not ( = ?auto_70756 ?auto_70758 ) ) ( not ( = ?auto_70756 ?auto_70759 ) ) ( not ( = ?auto_70756 ?auto_70760 ) ) ( not ( = ?auto_70756 ?auto_70761 ) ) ( not ( = ?auto_70757 ?auto_70758 ) ) ( not ( = ?auto_70757 ?auto_70759 ) ) ( not ( = ?auto_70757 ?auto_70760 ) ) ( not ( = ?auto_70757 ?auto_70761 ) ) ( not ( = ?auto_70758 ?auto_70759 ) ) ( not ( = ?auto_70758 ?auto_70760 ) ) ( not ( = ?auto_70758 ?auto_70761 ) ) ( not ( = ?auto_70759 ?auto_70760 ) ) ( not ( = ?auto_70759 ?auto_70761 ) ) ( not ( = ?auto_70760 ?auto_70761 ) ) ( ON ?auto_70761 ?auto_70762 ) ( not ( = ?auto_70756 ?auto_70762 ) ) ( not ( = ?auto_70757 ?auto_70762 ) ) ( not ( = ?auto_70758 ?auto_70762 ) ) ( not ( = ?auto_70759 ?auto_70762 ) ) ( not ( = ?auto_70760 ?auto_70762 ) ) ( not ( = ?auto_70761 ?auto_70762 ) ) ( ON ?auto_70760 ?auto_70761 ) ( ON-TABLE ?auto_70762 ) ( ON ?auto_70759 ?auto_70760 ) ( CLEAR ?auto_70759 ) ( HOLDING ?auto_70758 ) ( CLEAR ?auto_70757 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70756 ?auto_70757 ?auto_70758 )
      ( MAKE-6PILE ?auto_70756 ?auto_70757 ?auto_70758 ?auto_70759 ?auto_70760 ?auto_70761 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70763 - BLOCK
      ?auto_70764 - BLOCK
      ?auto_70765 - BLOCK
      ?auto_70766 - BLOCK
      ?auto_70767 - BLOCK
      ?auto_70768 - BLOCK
    )
    :vars
    (
      ?auto_70769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70763 ) ( ON ?auto_70764 ?auto_70763 ) ( not ( = ?auto_70763 ?auto_70764 ) ) ( not ( = ?auto_70763 ?auto_70765 ) ) ( not ( = ?auto_70763 ?auto_70766 ) ) ( not ( = ?auto_70763 ?auto_70767 ) ) ( not ( = ?auto_70763 ?auto_70768 ) ) ( not ( = ?auto_70764 ?auto_70765 ) ) ( not ( = ?auto_70764 ?auto_70766 ) ) ( not ( = ?auto_70764 ?auto_70767 ) ) ( not ( = ?auto_70764 ?auto_70768 ) ) ( not ( = ?auto_70765 ?auto_70766 ) ) ( not ( = ?auto_70765 ?auto_70767 ) ) ( not ( = ?auto_70765 ?auto_70768 ) ) ( not ( = ?auto_70766 ?auto_70767 ) ) ( not ( = ?auto_70766 ?auto_70768 ) ) ( not ( = ?auto_70767 ?auto_70768 ) ) ( ON ?auto_70768 ?auto_70769 ) ( not ( = ?auto_70763 ?auto_70769 ) ) ( not ( = ?auto_70764 ?auto_70769 ) ) ( not ( = ?auto_70765 ?auto_70769 ) ) ( not ( = ?auto_70766 ?auto_70769 ) ) ( not ( = ?auto_70767 ?auto_70769 ) ) ( not ( = ?auto_70768 ?auto_70769 ) ) ( ON ?auto_70767 ?auto_70768 ) ( ON-TABLE ?auto_70769 ) ( ON ?auto_70766 ?auto_70767 ) ( CLEAR ?auto_70764 ) ( ON ?auto_70765 ?auto_70766 ) ( CLEAR ?auto_70765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70769 ?auto_70768 ?auto_70767 ?auto_70766 )
      ( MAKE-6PILE ?auto_70763 ?auto_70764 ?auto_70765 ?auto_70766 ?auto_70767 ?auto_70768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70770 - BLOCK
      ?auto_70771 - BLOCK
      ?auto_70772 - BLOCK
      ?auto_70773 - BLOCK
      ?auto_70774 - BLOCK
      ?auto_70775 - BLOCK
    )
    :vars
    (
      ?auto_70776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70770 ) ( not ( = ?auto_70770 ?auto_70771 ) ) ( not ( = ?auto_70770 ?auto_70772 ) ) ( not ( = ?auto_70770 ?auto_70773 ) ) ( not ( = ?auto_70770 ?auto_70774 ) ) ( not ( = ?auto_70770 ?auto_70775 ) ) ( not ( = ?auto_70771 ?auto_70772 ) ) ( not ( = ?auto_70771 ?auto_70773 ) ) ( not ( = ?auto_70771 ?auto_70774 ) ) ( not ( = ?auto_70771 ?auto_70775 ) ) ( not ( = ?auto_70772 ?auto_70773 ) ) ( not ( = ?auto_70772 ?auto_70774 ) ) ( not ( = ?auto_70772 ?auto_70775 ) ) ( not ( = ?auto_70773 ?auto_70774 ) ) ( not ( = ?auto_70773 ?auto_70775 ) ) ( not ( = ?auto_70774 ?auto_70775 ) ) ( ON ?auto_70775 ?auto_70776 ) ( not ( = ?auto_70770 ?auto_70776 ) ) ( not ( = ?auto_70771 ?auto_70776 ) ) ( not ( = ?auto_70772 ?auto_70776 ) ) ( not ( = ?auto_70773 ?auto_70776 ) ) ( not ( = ?auto_70774 ?auto_70776 ) ) ( not ( = ?auto_70775 ?auto_70776 ) ) ( ON ?auto_70774 ?auto_70775 ) ( ON-TABLE ?auto_70776 ) ( ON ?auto_70773 ?auto_70774 ) ( ON ?auto_70772 ?auto_70773 ) ( CLEAR ?auto_70772 ) ( HOLDING ?auto_70771 ) ( CLEAR ?auto_70770 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70770 ?auto_70771 )
      ( MAKE-6PILE ?auto_70770 ?auto_70771 ?auto_70772 ?auto_70773 ?auto_70774 ?auto_70775 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70777 - BLOCK
      ?auto_70778 - BLOCK
      ?auto_70779 - BLOCK
      ?auto_70780 - BLOCK
      ?auto_70781 - BLOCK
      ?auto_70782 - BLOCK
    )
    :vars
    (
      ?auto_70783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70777 ) ( not ( = ?auto_70777 ?auto_70778 ) ) ( not ( = ?auto_70777 ?auto_70779 ) ) ( not ( = ?auto_70777 ?auto_70780 ) ) ( not ( = ?auto_70777 ?auto_70781 ) ) ( not ( = ?auto_70777 ?auto_70782 ) ) ( not ( = ?auto_70778 ?auto_70779 ) ) ( not ( = ?auto_70778 ?auto_70780 ) ) ( not ( = ?auto_70778 ?auto_70781 ) ) ( not ( = ?auto_70778 ?auto_70782 ) ) ( not ( = ?auto_70779 ?auto_70780 ) ) ( not ( = ?auto_70779 ?auto_70781 ) ) ( not ( = ?auto_70779 ?auto_70782 ) ) ( not ( = ?auto_70780 ?auto_70781 ) ) ( not ( = ?auto_70780 ?auto_70782 ) ) ( not ( = ?auto_70781 ?auto_70782 ) ) ( ON ?auto_70782 ?auto_70783 ) ( not ( = ?auto_70777 ?auto_70783 ) ) ( not ( = ?auto_70778 ?auto_70783 ) ) ( not ( = ?auto_70779 ?auto_70783 ) ) ( not ( = ?auto_70780 ?auto_70783 ) ) ( not ( = ?auto_70781 ?auto_70783 ) ) ( not ( = ?auto_70782 ?auto_70783 ) ) ( ON ?auto_70781 ?auto_70782 ) ( ON-TABLE ?auto_70783 ) ( ON ?auto_70780 ?auto_70781 ) ( ON ?auto_70779 ?auto_70780 ) ( CLEAR ?auto_70777 ) ( ON ?auto_70778 ?auto_70779 ) ( CLEAR ?auto_70778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70783 ?auto_70782 ?auto_70781 ?auto_70780 ?auto_70779 )
      ( MAKE-6PILE ?auto_70777 ?auto_70778 ?auto_70779 ?auto_70780 ?auto_70781 ?auto_70782 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70784 - BLOCK
      ?auto_70785 - BLOCK
      ?auto_70786 - BLOCK
      ?auto_70787 - BLOCK
      ?auto_70788 - BLOCK
      ?auto_70789 - BLOCK
    )
    :vars
    (
      ?auto_70790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70784 ?auto_70785 ) ) ( not ( = ?auto_70784 ?auto_70786 ) ) ( not ( = ?auto_70784 ?auto_70787 ) ) ( not ( = ?auto_70784 ?auto_70788 ) ) ( not ( = ?auto_70784 ?auto_70789 ) ) ( not ( = ?auto_70785 ?auto_70786 ) ) ( not ( = ?auto_70785 ?auto_70787 ) ) ( not ( = ?auto_70785 ?auto_70788 ) ) ( not ( = ?auto_70785 ?auto_70789 ) ) ( not ( = ?auto_70786 ?auto_70787 ) ) ( not ( = ?auto_70786 ?auto_70788 ) ) ( not ( = ?auto_70786 ?auto_70789 ) ) ( not ( = ?auto_70787 ?auto_70788 ) ) ( not ( = ?auto_70787 ?auto_70789 ) ) ( not ( = ?auto_70788 ?auto_70789 ) ) ( ON ?auto_70789 ?auto_70790 ) ( not ( = ?auto_70784 ?auto_70790 ) ) ( not ( = ?auto_70785 ?auto_70790 ) ) ( not ( = ?auto_70786 ?auto_70790 ) ) ( not ( = ?auto_70787 ?auto_70790 ) ) ( not ( = ?auto_70788 ?auto_70790 ) ) ( not ( = ?auto_70789 ?auto_70790 ) ) ( ON ?auto_70788 ?auto_70789 ) ( ON-TABLE ?auto_70790 ) ( ON ?auto_70787 ?auto_70788 ) ( ON ?auto_70786 ?auto_70787 ) ( ON ?auto_70785 ?auto_70786 ) ( CLEAR ?auto_70785 ) ( HOLDING ?auto_70784 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70784 )
      ( MAKE-6PILE ?auto_70784 ?auto_70785 ?auto_70786 ?auto_70787 ?auto_70788 ?auto_70789 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70791 - BLOCK
      ?auto_70792 - BLOCK
      ?auto_70793 - BLOCK
      ?auto_70794 - BLOCK
      ?auto_70795 - BLOCK
      ?auto_70796 - BLOCK
    )
    :vars
    (
      ?auto_70797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70791 ?auto_70792 ) ) ( not ( = ?auto_70791 ?auto_70793 ) ) ( not ( = ?auto_70791 ?auto_70794 ) ) ( not ( = ?auto_70791 ?auto_70795 ) ) ( not ( = ?auto_70791 ?auto_70796 ) ) ( not ( = ?auto_70792 ?auto_70793 ) ) ( not ( = ?auto_70792 ?auto_70794 ) ) ( not ( = ?auto_70792 ?auto_70795 ) ) ( not ( = ?auto_70792 ?auto_70796 ) ) ( not ( = ?auto_70793 ?auto_70794 ) ) ( not ( = ?auto_70793 ?auto_70795 ) ) ( not ( = ?auto_70793 ?auto_70796 ) ) ( not ( = ?auto_70794 ?auto_70795 ) ) ( not ( = ?auto_70794 ?auto_70796 ) ) ( not ( = ?auto_70795 ?auto_70796 ) ) ( ON ?auto_70796 ?auto_70797 ) ( not ( = ?auto_70791 ?auto_70797 ) ) ( not ( = ?auto_70792 ?auto_70797 ) ) ( not ( = ?auto_70793 ?auto_70797 ) ) ( not ( = ?auto_70794 ?auto_70797 ) ) ( not ( = ?auto_70795 ?auto_70797 ) ) ( not ( = ?auto_70796 ?auto_70797 ) ) ( ON ?auto_70795 ?auto_70796 ) ( ON-TABLE ?auto_70797 ) ( ON ?auto_70794 ?auto_70795 ) ( ON ?auto_70793 ?auto_70794 ) ( ON ?auto_70792 ?auto_70793 ) ( ON ?auto_70791 ?auto_70792 ) ( CLEAR ?auto_70791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70797 ?auto_70796 ?auto_70795 ?auto_70794 ?auto_70793 ?auto_70792 )
      ( MAKE-6PILE ?auto_70791 ?auto_70792 ?auto_70793 ?auto_70794 ?auto_70795 ?auto_70796 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70803 - BLOCK
      ?auto_70804 - BLOCK
      ?auto_70805 - BLOCK
      ?auto_70806 - BLOCK
      ?auto_70807 - BLOCK
    )
    :vars
    (
      ?auto_70808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70808 ?auto_70807 ) ( CLEAR ?auto_70808 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70803 ) ( ON ?auto_70804 ?auto_70803 ) ( ON ?auto_70805 ?auto_70804 ) ( ON ?auto_70806 ?auto_70805 ) ( ON ?auto_70807 ?auto_70806 ) ( not ( = ?auto_70803 ?auto_70804 ) ) ( not ( = ?auto_70803 ?auto_70805 ) ) ( not ( = ?auto_70803 ?auto_70806 ) ) ( not ( = ?auto_70803 ?auto_70807 ) ) ( not ( = ?auto_70803 ?auto_70808 ) ) ( not ( = ?auto_70804 ?auto_70805 ) ) ( not ( = ?auto_70804 ?auto_70806 ) ) ( not ( = ?auto_70804 ?auto_70807 ) ) ( not ( = ?auto_70804 ?auto_70808 ) ) ( not ( = ?auto_70805 ?auto_70806 ) ) ( not ( = ?auto_70805 ?auto_70807 ) ) ( not ( = ?auto_70805 ?auto_70808 ) ) ( not ( = ?auto_70806 ?auto_70807 ) ) ( not ( = ?auto_70806 ?auto_70808 ) ) ( not ( = ?auto_70807 ?auto_70808 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70808 ?auto_70807 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70822 - BLOCK
      ?auto_70823 - BLOCK
      ?auto_70824 - BLOCK
      ?auto_70825 - BLOCK
      ?auto_70826 - BLOCK
    )
    :vars
    (
      ?auto_70827 - BLOCK
      ?auto_70828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70822 ) ( ON ?auto_70823 ?auto_70822 ) ( ON ?auto_70824 ?auto_70823 ) ( ON ?auto_70825 ?auto_70824 ) ( not ( = ?auto_70822 ?auto_70823 ) ) ( not ( = ?auto_70822 ?auto_70824 ) ) ( not ( = ?auto_70822 ?auto_70825 ) ) ( not ( = ?auto_70822 ?auto_70826 ) ) ( not ( = ?auto_70822 ?auto_70827 ) ) ( not ( = ?auto_70823 ?auto_70824 ) ) ( not ( = ?auto_70823 ?auto_70825 ) ) ( not ( = ?auto_70823 ?auto_70826 ) ) ( not ( = ?auto_70823 ?auto_70827 ) ) ( not ( = ?auto_70824 ?auto_70825 ) ) ( not ( = ?auto_70824 ?auto_70826 ) ) ( not ( = ?auto_70824 ?auto_70827 ) ) ( not ( = ?auto_70825 ?auto_70826 ) ) ( not ( = ?auto_70825 ?auto_70827 ) ) ( not ( = ?auto_70826 ?auto_70827 ) ) ( ON ?auto_70827 ?auto_70828 ) ( CLEAR ?auto_70827 ) ( not ( = ?auto_70822 ?auto_70828 ) ) ( not ( = ?auto_70823 ?auto_70828 ) ) ( not ( = ?auto_70824 ?auto_70828 ) ) ( not ( = ?auto_70825 ?auto_70828 ) ) ( not ( = ?auto_70826 ?auto_70828 ) ) ( not ( = ?auto_70827 ?auto_70828 ) ) ( HOLDING ?auto_70826 ) ( CLEAR ?auto_70825 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70822 ?auto_70823 ?auto_70824 ?auto_70825 ?auto_70826 ?auto_70827 )
      ( MAKE-5PILE ?auto_70822 ?auto_70823 ?auto_70824 ?auto_70825 ?auto_70826 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70829 - BLOCK
      ?auto_70830 - BLOCK
      ?auto_70831 - BLOCK
      ?auto_70832 - BLOCK
      ?auto_70833 - BLOCK
    )
    :vars
    (
      ?auto_70834 - BLOCK
      ?auto_70835 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70829 ) ( ON ?auto_70830 ?auto_70829 ) ( ON ?auto_70831 ?auto_70830 ) ( ON ?auto_70832 ?auto_70831 ) ( not ( = ?auto_70829 ?auto_70830 ) ) ( not ( = ?auto_70829 ?auto_70831 ) ) ( not ( = ?auto_70829 ?auto_70832 ) ) ( not ( = ?auto_70829 ?auto_70833 ) ) ( not ( = ?auto_70829 ?auto_70834 ) ) ( not ( = ?auto_70830 ?auto_70831 ) ) ( not ( = ?auto_70830 ?auto_70832 ) ) ( not ( = ?auto_70830 ?auto_70833 ) ) ( not ( = ?auto_70830 ?auto_70834 ) ) ( not ( = ?auto_70831 ?auto_70832 ) ) ( not ( = ?auto_70831 ?auto_70833 ) ) ( not ( = ?auto_70831 ?auto_70834 ) ) ( not ( = ?auto_70832 ?auto_70833 ) ) ( not ( = ?auto_70832 ?auto_70834 ) ) ( not ( = ?auto_70833 ?auto_70834 ) ) ( ON ?auto_70834 ?auto_70835 ) ( not ( = ?auto_70829 ?auto_70835 ) ) ( not ( = ?auto_70830 ?auto_70835 ) ) ( not ( = ?auto_70831 ?auto_70835 ) ) ( not ( = ?auto_70832 ?auto_70835 ) ) ( not ( = ?auto_70833 ?auto_70835 ) ) ( not ( = ?auto_70834 ?auto_70835 ) ) ( CLEAR ?auto_70832 ) ( ON ?auto_70833 ?auto_70834 ) ( CLEAR ?auto_70833 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70835 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70835 ?auto_70834 )
      ( MAKE-5PILE ?auto_70829 ?auto_70830 ?auto_70831 ?auto_70832 ?auto_70833 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70836 - BLOCK
      ?auto_70837 - BLOCK
      ?auto_70838 - BLOCK
      ?auto_70839 - BLOCK
      ?auto_70840 - BLOCK
    )
    :vars
    (
      ?auto_70841 - BLOCK
      ?auto_70842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70836 ) ( ON ?auto_70837 ?auto_70836 ) ( ON ?auto_70838 ?auto_70837 ) ( not ( = ?auto_70836 ?auto_70837 ) ) ( not ( = ?auto_70836 ?auto_70838 ) ) ( not ( = ?auto_70836 ?auto_70839 ) ) ( not ( = ?auto_70836 ?auto_70840 ) ) ( not ( = ?auto_70836 ?auto_70841 ) ) ( not ( = ?auto_70837 ?auto_70838 ) ) ( not ( = ?auto_70837 ?auto_70839 ) ) ( not ( = ?auto_70837 ?auto_70840 ) ) ( not ( = ?auto_70837 ?auto_70841 ) ) ( not ( = ?auto_70838 ?auto_70839 ) ) ( not ( = ?auto_70838 ?auto_70840 ) ) ( not ( = ?auto_70838 ?auto_70841 ) ) ( not ( = ?auto_70839 ?auto_70840 ) ) ( not ( = ?auto_70839 ?auto_70841 ) ) ( not ( = ?auto_70840 ?auto_70841 ) ) ( ON ?auto_70841 ?auto_70842 ) ( not ( = ?auto_70836 ?auto_70842 ) ) ( not ( = ?auto_70837 ?auto_70842 ) ) ( not ( = ?auto_70838 ?auto_70842 ) ) ( not ( = ?auto_70839 ?auto_70842 ) ) ( not ( = ?auto_70840 ?auto_70842 ) ) ( not ( = ?auto_70841 ?auto_70842 ) ) ( ON ?auto_70840 ?auto_70841 ) ( CLEAR ?auto_70840 ) ( ON-TABLE ?auto_70842 ) ( HOLDING ?auto_70839 ) ( CLEAR ?auto_70838 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70836 ?auto_70837 ?auto_70838 ?auto_70839 )
      ( MAKE-5PILE ?auto_70836 ?auto_70837 ?auto_70838 ?auto_70839 ?auto_70840 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70843 - BLOCK
      ?auto_70844 - BLOCK
      ?auto_70845 - BLOCK
      ?auto_70846 - BLOCK
      ?auto_70847 - BLOCK
    )
    :vars
    (
      ?auto_70849 - BLOCK
      ?auto_70848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70843 ) ( ON ?auto_70844 ?auto_70843 ) ( ON ?auto_70845 ?auto_70844 ) ( not ( = ?auto_70843 ?auto_70844 ) ) ( not ( = ?auto_70843 ?auto_70845 ) ) ( not ( = ?auto_70843 ?auto_70846 ) ) ( not ( = ?auto_70843 ?auto_70847 ) ) ( not ( = ?auto_70843 ?auto_70849 ) ) ( not ( = ?auto_70844 ?auto_70845 ) ) ( not ( = ?auto_70844 ?auto_70846 ) ) ( not ( = ?auto_70844 ?auto_70847 ) ) ( not ( = ?auto_70844 ?auto_70849 ) ) ( not ( = ?auto_70845 ?auto_70846 ) ) ( not ( = ?auto_70845 ?auto_70847 ) ) ( not ( = ?auto_70845 ?auto_70849 ) ) ( not ( = ?auto_70846 ?auto_70847 ) ) ( not ( = ?auto_70846 ?auto_70849 ) ) ( not ( = ?auto_70847 ?auto_70849 ) ) ( ON ?auto_70849 ?auto_70848 ) ( not ( = ?auto_70843 ?auto_70848 ) ) ( not ( = ?auto_70844 ?auto_70848 ) ) ( not ( = ?auto_70845 ?auto_70848 ) ) ( not ( = ?auto_70846 ?auto_70848 ) ) ( not ( = ?auto_70847 ?auto_70848 ) ) ( not ( = ?auto_70849 ?auto_70848 ) ) ( ON ?auto_70847 ?auto_70849 ) ( ON-TABLE ?auto_70848 ) ( CLEAR ?auto_70845 ) ( ON ?auto_70846 ?auto_70847 ) ( CLEAR ?auto_70846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70848 ?auto_70849 ?auto_70847 )
      ( MAKE-5PILE ?auto_70843 ?auto_70844 ?auto_70845 ?auto_70846 ?auto_70847 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70850 - BLOCK
      ?auto_70851 - BLOCK
      ?auto_70852 - BLOCK
      ?auto_70853 - BLOCK
      ?auto_70854 - BLOCK
    )
    :vars
    (
      ?auto_70855 - BLOCK
      ?auto_70856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70850 ) ( ON ?auto_70851 ?auto_70850 ) ( not ( = ?auto_70850 ?auto_70851 ) ) ( not ( = ?auto_70850 ?auto_70852 ) ) ( not ( = ?auto_70850 ?auto_70853 ) ) ( not ( = ?auto_70850 ?auto_70854 ) ) ( not ( = ?auto_70850 ?auto_70855 ) ) ( not ( = ?auto_70851 ?auto_70852 ) ) ( not ( = ?auto_70851 ?auto_70853 ) ) ( not ( = ?auto_70851 ?auto_70854 ) ) ( not ( = ?auto_70851 ?auto_70855 ) ) ( not ( = ?auto_70852 ?auto_70853 ) ) ( not ( = ?auto_70852 ?auto_70854 ) ) ( not ( = ?auto_70852 ?auto_70855 ) ) ( not ( = ?auto_70853 ?auto_70854 ) ) ( not ( = ?auto_70853 ?auto_70855 ) ) ( not ( = ?auto_70854 ?auto_70855 ) ) ( ON ?auto_70855 ?auto_70856 ) ( not ( = ?auto_70850 ?auto_70856 ) ) ( not ( = ?auto_70851 ?auto_70856 ) ) ( not ( = ?auto_70852 ?auto_70856 ) ) ( not ( = ?auto_70853 ?auto_70856 ) ) ( not ( = ?auto_70854 ?auto_70856 ) ) ( not ( = ?auto_70855 ?auto_70856 ) ) ( ON ?auto_70854 ?auto_70855 ) ( ON-TABLE ?auto_70856 ) ( ON ?auto_70853 ?auto_70854 ) ( CLEAR ?auto_70853 ) ( HOLDING ?auto_70852 ) ( CLEAR ?auto_70851 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70850 ?auto_70851 ?auto_70852 )
      ( MAKE-5PILE ?auto_70850 ?auto_70851 ?auto_70852 ?auto_70853 ?auto_70854 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70857 - BLOCK
      ?auto_70858 - BLOCK
      ?auto_70859 - BLOCK
      ?auto_70860 - BLOCK
      ?auto_70861 - BLOCK
    )
    :vars
    (
      ?auto_70862 - BLOCK
      ?auto_70863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70857 ) ( ON ?auto_70858 ?auto_70857 ) ( not ( = ?auto_70857 ?auto_70858 ) ) ( not ( = ?auto_70857 ?auto_70859 ) ) ( not ( = ?auto_70857 ?auto_70860 ) ) ( not ( = ?auto_70857 ?auto_70861 ) ) ( not ( = ?auto_70857 ?auto_70862 ) ) ( not ( = ?auto_70858 ?auto_70859 ) ) ( not ( = ?auto_70858 ?auto_70860 ) ) ( not ( = ?auto_70858 ?auto_70861 ) ) ( not ( = ?auto_70858 ?auto_70862 ) ) ( not ( = ?auto_70859 ?auto_70860 ) ) ( not ( = ?auto_70859 ?auto_70861 ) ) ( not ( = ?auto_70859 ?auto_70862 ) ) ( not ( = ?auto_70860 ?auto_70861 ) ) ( not ( = ?auto_70860 ?auto_70862 ) ) ( not ( = ?auto_70861 ?auto_70862 ) ) ( ON ?auto_70862 ?auto_70863 ) ( not ( = ?auto_70857 ?auto_70863 ) ) ( not ( = ?auto_70858 ?auto_70863 ) ) ( not ( = ?auto_70859 ?auto_70863 ) ) ( not ( = ?auto_70860 ?auto_70863 ) ) ( not ( = ?auto_70861 ?auto_70863 ) ) ( not ( = ?auto_70862 ?auto_70863 ) ) ( ON ?auto_70861 ?auto_70862 ) ( ON-TABLE ?auto_70863 ) ( ON ?auto_70860 ?auto_70861 ) ( CLEAR ?auto_70858 ) ( ON ?auto_70859 ?auto_70860 ) ( CLEAR ?auto_70859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70863 ?auto_70862 ?auto_70861 ?auto_70860 )
      ( MAKE-5PILE ?auto_70857 ?auto_70858 ?auto_70859 ?auto_70860 ?auto_70861 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70864 - BLOCK
      ?auto_70865 - BLOCK
      ?auto_70866 - BLOCK
      ?auto_70867 - BLOCK
      ?auto_70868 - BLOCK
    )
    :vars
    (
      ?auto_70870 - BLOCK
      ?auto_70869 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70864 ) ( not ( = ?auto_70864 ?auto_70865 ) ) ( not ( = ?auto_70864 ?auto_70866 ) ) ( not ( = ?auto_70864 ?auto_70867 ) ) ( not ( = ?auto_70864 ?auto_70868 ) ) ( not ( = ?auto_70864 ?auto_70870 ) ) ( not ( = ?auto_70865 ?auto_70866 ) ) ( not ( = ?auto_70865 ?auto_70867 ) ) ( not ( = ?auto_70865 ?auto_70868 ) ) ( not ( = ?auto_70865 ?auto_70870 ) ) ( not ( = ?auto_70866 ?auto_70867 ) ) ( not ( = ?auto_70866 ?auto_70868 ) ) ( not ( = ?auto_70866 ?auto_70870 ) ) ( not ( = ?auto_70867 ?auto_70868 ) ) ( not ( = ?auto_70867 ?auto_70870 ) ) ( not ( = ?auto_70868 ?auto_70870 ) ) ( ON ?auto_70870 ?auto_70869 ) ( not ( = ?auto_70864 ?auto_70869 ) ) ( not ( = ?auto_70865 ?auto_70869 ) ) ( not ( = ?auto_70866 ?auto_70869 ) ) ( not ( = ?auto_70867 ?auto_70869 ) ) ( not ( = ?auto_70868 ?auto_70869 ) ) ( not ( = ?auto_70870 ?auto_70869 ) ) ( ON ?auto_70868 ?auto_70870 ) ( ON-TABLE ?auto_70869 ) ( ON ?auto_70867 ?auto_70868 ) ( ON ?auto_70866 ?auto_70867 ) ( CLEAR ?auto_70866 ) ( HOLDING ?auto_70865 ) ( CLEAR ?auto_70864 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70864 ?auto_70865 )
      ( MAKE-5PILE ?auto_70864 ?auto_70865 ?auto_70866 ?auto_70867 ?auto_70868 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70871 - BLOCK
      ?auto_70872 - BLOCK
      ?auto_70873 - BLOCK
      ?auto_70874 - BLOCK
      ?auto_70875 - BLOCK
    )
    :vars
    (
      ?auto_70877 - BLOCK
      ?auto_70876 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70871 ) ( not ( = ?auto_70871 ?auto_70872 ) ) ( not ( = ?auto_70871 ?auto_70873 ) ) ( not ( = ?auto_70871 ?auto_70874 ) ) ( not ( = ?auto_70871 ?auto_70875 ) ) ( not ( = ?auto_70871 ?auto_70877 ) ) ( not ( = ?auto_70872 ?auto_70873 ) ) ( not ( = ?auto_70872 ?auto_70874 ) ) ( not ( = ?auto_70872 ?auto_70875 ) ) ( not ( = ?auto_70872 ?auto_70877 ) ) ( not ( = ?auto_70873 ?auto_70874 ) ) ( not ( = ?auto_70873 ?auto_70875 ) ) ( not ( = ?auto_70873 ?auto_70877 ) ) ( not ( = ?auto_70874 ?auto_70875 ) ) ( not ( = ?auto_70874 ?auto_70877 ) ) ( not ( = ?auto_70875 ?auto_70877 ) ) ( ON ?auto_70877 ?auto_70876 ) ( not ( = ?auto_70871 ?auto_70876 ) ) ( not ( = ?auto_70872 ?auto_70876 ) ) ( not ( = ?auto_70873 ?auto_70876 ) ) ( not ( = ?auto_70874 ?auto_70876 ) ) ( not ( = ?auto_70875 ?auto_70876 ) ) ( not ( = ?auto_70877 ?auto_70876 ) ) ( ON ?auto_70875 ?auto_70877 ) ( ON-TABLE ?auto_70876 ) ( ON ?auto_70874 ?auto_70875 ) ( ON ?auto_70873 ?auto_70874 ) ( CLEAR ?auto_70871 ) ( ON ?auto_70872 ?auto_70873 ) ( CLEAR ?auto_70872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70876 ?auto_70877 ?auto_70875 ?auto_70874 ?auto_70873 )
      ( MAKE-5PILE ?auto_70871 ?auto_70872 ?auto_70873 ?auto_70874 ?auto_70875 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70878 - BLOCK
      ?auto_70879 - BLOCK
      ?auto_70880 - BLOCK
      ?auto_70881 - BLOCK
      ?auto_70882 - BLOCK
    )
    :vars
    (
      ?auto_70884 - BLOCK
      ?auto_70883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70878 ?auto_70879 ) ) ( not ( = ?auto_70878 ?auto_70880 ) ) ( not ( = ?auto_70878 ?auto_70881 ) ) ( not ( = ?auto_70878 ?auto_70882 ) ) ( not ( = ?auto_70878 ?auto_70884 ) ) ( not ( = ?auto_70879 ?auto_70880 ) ) ( not ( = ?auto_70879 ?auto_70881 ) ) ( not ( = ?auto_70879 ?auto_70882 ) ) ( not ( = ?auto_70879 ?auto_70884 ) ) ( not ( = ?auto_70880 ?auto_70881 ) ) ( not ( = ?auto_70880 ?auto_70882 ) ) ( not ( = ?auto_70880 ?auto_70884 ) ) ( not ( = ?auto_70881 ?auto_70882 ) ) ( not ( = ?auto_70881 ?auto_70884 ) ) ( not ( = ?auto_70882 ?auto_70884 ) ) ( ON ?auto_70884 ?auto_70883 ) ( not ( = ?auto_70878 ?auto_70883 ) ) ( not ( = ?auto_70879 ?auto_70883 ) ) ( not ( = ?auto_70880 ?auto_70883 ) ) ( not ( = ?auto_70881 ?auto_70883 ) ) ( not ( = ?auto_70882 ?auto_70883 ) ) ( not ( = ?auto_70884 ?auto_70883 ) ) ( ON ?auto_70882 ?auto_70884 ) ( ON-TABLE ?auto_70883 ) ( ON ?auto_70881 ?auto_70882 ) ( ON ?auto_70880 ?auto_70881 ) ( ON ?auto_70879 ?auto_70880 ) ( CLEAR ?auto_70879 ) ( HOLDING ?auto_70878 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70878 )
      ( MAKE-5PILE ?auto_70878 ?auto_70879 ?auto_70880 ?auto_70881 ?auto_70882 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70885 - BLOCK
      ?auto_70886 - BLOCK
      ?auto_70887 - BLOCK
      ?auto_70888 - BLOCK
      ?auto_70889 - BLOCK
    )
    :vars
    (
      ?auto_70891 - BLOCK
      ?auto_70890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70885 ?auto_70886 ) ) ( not ( = ?auto_70885 ?auto_70887 ) ) ( not ( = ?auto_70885 ?auto_70888 ) ) ( not ( = ?auto_70885 ?auto_70889 ) ) ( not ( = ?auto_70885 ?auto_70891 ) ) ( not ( = ?auto_70886 ?auto_70887 ) ) ( not ( = ?auto_70886 ?auto_70888 ) ) ( not ( = ?auto_70886 ?auto_70889 ) ) ( not ( = ?auto_70886 ?auto_70891 ) ) ( not ( = ?auto_70887 ?auto_70888 ) ) ( not ( = ?auto_70887 ?auto_70889 ) ) ( not ( = ?auto_70887 ?auto_70891 ) ) ( not ( = ?auto_70888 ?auto_70889 ) ) ( not ( = ?auto_70888 ?auto_70891 ) ) ( not ( = ?auto_70889 ?auto_70891 ) ) ( ON ?auto_70891 ?auto_70890 ) ( not ( = ?auto_70885 ?auto_70890 ) ) ( not ( = ?auto_70886 ?auto_70890 ) ) ( not ( = ?auto_70887 ?auto_70890 ) ) ( not ( = ?auto_70888 ?auto_70890 ) ) ( not ( = ?auto_70889 ?auto_70890 ) ) ( not ( = ?auto_70891 ?auto_70890 ) ) ( ON ?auto_70889 ?auto_70891 ) ( ON-TABLE ?auto_70890 ) ( ON ?auto_70888 ?auto_70889 ) ( ON ?auto_70887 ?auto_70888 ) ( ON ?auto_70886 ?auto_70887 ) ( ON ?auto_70885 ?auto_70886 ) ( CLEAR ?auto_70885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70890 ?auto_70891 ?auto_70889 ?auto_70888 ?auto_70887 ?auto_70886 )
      ( MAKE-5PILE ?auto_70885 ?auto_70886 ?auto_70887 ?auto_70888 ?auto_70889 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70893 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_70893 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_70893 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70894 - BLOCK
    )
    :vars
    (
      ?auto_70895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70894 ?auto_70895 ) ( CLEAR ?auto_70894 ) ( HAND-EMPTY ) ( not ( = ?auto_70894 ?auto_70895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70894 ?auto_70895 )
      ( MAKE-1PILE ?auto_70894 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70896 - BLOCK
    )
    :vars
    (
      ?auto_70897 - BLOCK
      ?auto_70901 - BLOCK
      ?auto_70899 - BLOCK
      ?auto_70900 - BLOCK
      ?auto_70898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70896 ?auto_70897 ) ) ( HOLDING ?auto_70896 ) ( CLEAR ?auto_70897 ) ( ON-TABLE ?auto_70901 ) ( ON ?auto_70899 ?auto_70901 ) ( ON ?auto_70900 ?auto_70899 ) ( ON ?auto_70898 ?auto_70900 ) ( ON ?auto_70897 ?auto_70898 ) ( not ( = ?auto_70901 ?auto_70899 ) ) ( not ( = ?auto_70901 ?auto_70900 ) ) ( not ( = ?auto_70901 ?auto_70898 ) ) ( not ( = ?auto_70901 ?auto_70897 ) ) ( not ( = ?auto_70901 ?auto_70896 ) ) ( not ( = ?auto_70899 ?auto_70900 ) ) ( not ( = ?auto_70899 ?auto_70898 ) ) ( not ( = ?auto_70899 ?auto_70897 ) ) ( not ( = ?auto_70899 ?auto_70896 ) ) ( not ( = ?auto_70900 ?auto_70898 ) ) ( not ( = ?auto_70900 ?auto_70897 ) ) ( not ( = ?auto_70900 ?auto_70896 ) ) ( not ( = ?auto_70898 ?auto_70897 ) ) ( not ( = ?auto_70898 ?auto_70896 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70901 ?auto_70899 ?auto_70900 ?auto_70898 ?auto_70897 ?auto_70896 )
      ( MAKE-1PILE ?auto_70896 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70902 - BLOCK
    )
    :vars
    (
      ?auto_70904 - BLOCK
      ?auto_70905 - BLOCK
      ?auto_70903 - BLOCK
      ?auto_70907 - BLOCK
      ?auto_70906 - BLOCK
      ?auto_70908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70902 ?auto_70904 ) ) ( CLEAR ?auto_70904 ) ( ON-TABLE ?auto_70905 ) ( ON ?auto_70903 ?auto_70905 ) ( ON ?auto_70907 ?auto_70903 ) ( ON ?auto_70906 ?auto_70907 ) ( ON ?auto_70904 ?auto_70906 ) ( not ( = ?auto_70905 ?auto_70903 ) ) ( not ( = ?auto_70905 ?auto_70907 ) ) ( not ( = ?auto_70905 ?auto_70906 ) ) ( not ( = ?auto_70905 ?auto_70904 ) ) ( not ( = ?auto_70905 ?auto_70902 ) ) ( not ( = ?auto_70903 ?auto_70907 ) ) ( not ( = ?auto_70903 ?auto_70906 ) ) ( not ( = ?auto_70903 ?auto_70904 ) ) ( not ( = ?auto_70903 ?auto_70902 ) ) ( not ( = ?auto_70907 ?auto_70906 ) ) ( not ( = ?auto_70907 ?auto_70904 ) ) ( not ( = ?auto_70907 ?auto_70902 ) ) ( not ( = ?auto_70906 ?auto_70904 ) ) ( not ( = ?auto_70906 ?auto_70902 ) ) ( ON ?auto_70902 ?auto_70908 ) ( CLEAR ?auto_70902 ) ( HAND-EMPTY ) ( not ( = ?auto_70902 ?auto_70908 ) ) ( not ( = ?auto_70904 ?auto_70908 ) ) ( not ( = ?auto_70905 ?auto_70908 ) ) ( not ( = ?auto_70903 ?auto_70908 ) ) ( not ( = ?auto_70907 ?auto_70908 ) ) ( not ( = ?auto_70906 ?auto_70908 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70902 ?auto_70908 )
      ( MAKE-1PILE ?auto_70902 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70909 - BLOCK
    )
    :vars
    (
      ?auto_70912 - BLOCK
      ?auto_70913 - BLOCK
      ?auto_70911 - BLOCK
      ?auto_70915 - BLOCK
      ?auto_70914 - BLOCK
      ?auto_70910 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70909 ?auto_70912 ) ) ( ON-TABLE ?auto_70913 ) ( ON ?auto_70911 ?auto_70913 ) ( ON ?auto_70915 ?auto_70911 ) ( ON ?auto_70914 ?auto_70915 ) ( not ( = ?auto_70913 ?auto_70911 ) ) ( not ( = ?auto_70913 ?auto_70915 ) ) ( not ( = ?auto_70913 ?auto_70914 ) ) ( not ( = ?auto_70913 ?auto_70912 ) ) ( not ( = ?auto_70913 ?auto_70909 ) ) ( not ( = ?auto_70911 ?auto_70915 ) ) ( not ( = ?auto_70911 ?auto_70914 ) ) ( not ( = ?auto_70911 ?auto_70912 ) ) ( not ( = ?auto_70911 ?auto_70909 ) ) ( not ( = ?auto_70915 ?auto_70914 ) ) ( not ( = ?auto_70915 ?auto_70912 ) ) ( not ( = ?auto_70915 ?auto_70909 ) ) ( not ( = ?auto_70914 ?auto_70912 ) ) ( not ( = ?auto_70914 ?auto_70909 ) ) ( ON ?auto_70909 ?auto_70910 ) ( CLEAR ?auto_70909 ) ( not ( = ?auto_70909 ?auto_70910 ) ) ( not ( = ?auto_70912 ?auto_70910 ) ) ( not ( = ?auto_70913 ?auto_70910 ) ) ( not ( = ?auto_70911 ?auto_70910 ) ) ( not ( = ?auto_70915 ?auto_70910 ) ) ( not ( = ?auto_70914 ?auto_70910 ) ) ( HOLDING ?auto_70912 ) ( CLEAR ?auto_70914 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70913 ?auto_70911 ?auto_70915 ?auto_70914 ?auto_70912 )
      ( MAKE-1PILE ?auto_70909 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70916 - BLOCK
    )
    :vars
    (
      ?auto_70918 - BLOCK
      ?auto_70920 - BLOCK
      ?auto_70921 - BLOCK
      ?auto_70917 - BLOCK
      ?auto_70922 - BLOCK
      ?auto_70919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70916 ?auto_70918 ) ) ( ON-TABLE ?auto_70920 ) ( ON ?auto_70921 ?auto_70920 ) ( ON ?auto_70917 ?auto_70921 ) ( ON ?auto_70922 ?auto_70917 ) ( not ( = ?auto_70920 ?auto_70921 ) ) ( not ( = ?auto_70920 ?auto_70917 ) ) ( not ( = ?auto_70920 ?auto_70922 ) ) ( not ( = ?auto_70920 ?auto_70918 ) ) ( not ( = ?auto_70920 ?auto_70916 ) ) ( not ( = ?auto_70921 ?auto_70917 ) ) ( not ( = ?auto_70921 ?auto_70922 ) ) ( not ( = ?auto_70921 ?auto_70918 ) ) ( not ( = ?auto_70921 ?auto_70916 ) ) ( not ( = ?auto_70917 ?auto_70922 ) ) ( not ( = ?auto_70917 ?auto_70918 ) ) ( not ( = ?auto_70917 ?auto_70916 ) ) ( not ( = ?auto_70922 ?auto_70918 ) ) ( not ( = ?auto_70922 ?auto_70916 ) ) ( ON ?auto_70916 ?auto_70919 ) ( not ( = ?auto_70916 ?auto_70919 ) ) ( not ( = ?auto_70918 ?auto_70919 ) ) ( not ( = ?auto_70920 ?auto_70919 ) ) ( not ( = ?auto_70921 ?auto_70919 ) ) ( not ( = ?auto_70917 ?auto_70919 ) ) ( not ( = ?auto_70922 ?auto_70919 ) ) ( CLEAR ?auto_70922 ) ( ON ?auto_70918 ?auto_70916 ) ( CLEAR ?auto_70918 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70919 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70919 ?auto_70916 )
      ( MAKE-1PILE ?auto_70916 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70923 - BLOCK
    )
    :vars
    (
      ?auto_70926 - BLOCK
      ?auto_70927 - BLOCK
      ?auto_70924 - BLOCK
      ?auto_70925 - BLOCK
      ?auto_70929 - BLOCK
      ?auto_70928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70923 ?auto_70926 ) ) ( ON-TABLE ?auto_70927 ) ( ON ?auto_70924 ?auto_70927 ) ( ON ?auto_70925 ?auto_70924 ) ( not ( = ?auto_70927 ?auto_70924 ) ) ( not ( = ?auto_70927 ?auto_70925 ) ) ( not ( = ?auto_70927 ?auto_70929 ) ) ( not ( = ?auto_70927 ?auto_70926 ) ) ( not ( = ?auto_70927 ?auto_70923 ) ) ( not ( = ?auto_70924 ?auto_70925 ) ) ( not ( = ?auto_70924 ?auto_70929 ) ) ( not ( = ?auto_70924 ?auto_70926 ) ) ( not ( = ?auto_70924 ?auto_70923 ) ) ( not ( = ?auto_70925 ?auto_70929 ) ) ( not ( = ?auto_70925 ?auto_70926 ) ) ( not ( = ?auto_70925 ?auto_70923 ) ) ( not ( = ?auto_70929 ?auto_70926 ) ) ( not ( = ?auto_70929 ?auto_70923 ) ) ( ON ?auto_70923 ?auto_70928 ) ( not ( = ?auto_70923 ?auto_70928 ) ) ( not ( = ?auto_70926 ?auto_70928 ) ) ( not ( = ?auto_70927 ?auto_70928 ) ) ( not ( = ?auto_70924 ?auto_70928 ) ) ( not ( = ?auto_70925 ?auto_70928 ) ) ( not ( = ?auto_70929 ?auto_70928 ) ) ( ON ?auto_70926 ?auto_70923 ) ( CLEAR ?auto_70926 ) ( ON-TABLE ?auto_70928 ) ( HOLDING ?auto_70929 ) ( CLEAR ?auto_70925 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70927 ?auto_70924 ?auto_70925 ?auto_70929 )
      ( MAKE-1PILE ?auto_70923 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70930 - BLOCK
    )
    :vars
    (
      ?auto_70934 - BLOCK
      ?auto_70933 - BLOCK
      ?auto_70932 - BLOCK
      ?auto_70935 - BLOCK
      ?auto_70931 - BLOCK
      ?auto_70936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70930 ?auto_70934 ) ) ( ON-TABLE ?auto_70933 ) ( ON ?auto_70932 ?auto_70933 ) ( ON ?auto_70935 ?auto_70932 ) ( not ( = ?auto_70933 ?auto_70932 ) ) ( not ( = ?auto_70933 ?auto_70935 ) ) ( not ( = ?auto_70933 ?auto_70931 ) ) ( not ( = ?auto_70933 ?auto_70934 ) ) ( not ( = ?auto_70933 ?auto_70930 ) ) ( not ( = ?auto_70932 ?auto_70935 ) ) ( not ( = ?auto_70932 ?auto_70931 ) ) ( not ( = ?auto_70932 ?auto_70934 ) ) ( not ( = ?auto_70932 ?auto_70930 ) ) ( not ( = ?auto_70935 ?auto_70931 ) ) ( not ( = ?auto_70935 ?auto_70934 ) ) ( not ( = ?auto_70935 ?auto_70930 ) ) ( not ( = ?auto_70931 ?auto_70934 ) ) ( not ( = ?auto_70931 ?auto_70930 ) ) ( ON ?auto_70930 ?auto_70936 ) ( not ( = ?auto_70930 ?auto_70936 ) ) ( not ( = ?auto_70934 ?auto_70936 ) ) ( not ( = ?auto_70933 ?auto_70936 ) ) ( not ( = ?auto_70932 ?auto_70936 ) ) ( not ( = ?auto_70935 ?auto_70936 ) ) ( not ( = ?auto_70931 ?auto_70936 ) ) ( ON ?auto_70934 ?auto_70930 ) ( ON-TABLE ?auto_70936 ) ( CLEAR ?auto_70935 ) ( ON ?auto_70931 ?auto_70934 ) ( CLEAR ?auto_70931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70936 ?auto_70930 ?auto_70934 )
      ( MAKE-1PILE ?auto_70930 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70937 - BLOCK
    )
    :vars
    (
      ?auto_70940 - BLOCK
      ?auto_70938 - BLOCK
      ?auto_70943 - BLOCK
      ?auto_70941 - BLOCK
      ?auto_70942 - BLOCK
      ?auto_70939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70937 ?auto_70940 ) ) ( ON-TABLE ?auto_70938 ) ( ON ?auto_70943 ?auto_70938 ) ( not ( = ?auto_70938 ?auto_70943 ) ) ( not ( = ?auto_70938 ?auto_70941 ) ) ( not ( = ?auto_70938 ?auto_70942 ) ) ( not ( = ?auto_70938 ?auto_70940 ) ) ( not ( = ?auto_70938 ?auto_70937 ) ) ( not ( = ?auto_70943 ?auto_70941 ) ) ( not ( = ?auto_70943 ?auto_70942 ) ) ( not ( = ?auto_70943 ?auto_70940 ) ) ( not ( = ?auto_70943 ?auto_70937 ) ) ( not ( = ?auto_70941 ?auto_70942 ) ) ( not ( = ?auto_70941 ?auto_70940 ) ) ( not ( = ?auto_70941 ?auto_70937 ) ) ( not ( = ?auto_70942 ?auto_70940 ) ) ( not ( = ?auto_70942 ?auto_70937 ) ) ( ON ?auto_70937 ?auto_70939 ) ( not ( = ?auto_70937 ?auto_70939 ) ) ( not ( = ?auto_70940 ?auto_70939 ) ) ( not ( = ?auto_70938 ?auto_70939 ) ) ( not ( = ?auto_70943 ?auto_70939 ) ) ( not ( = ?auto_70941 ?auto_70939 ) ) ( not ( = ?auto_70942 ?auto_70939 ) ) ( ON ?auto_70940 ?auto_70937 ) ( ON-TABLE ?auto_70939 ) ( ON ?auto_70942 ?auto_70940 ) ( CLEAR ?auto_70942 ) ( HOLDING ?auto_70941 ) ( CLEAR ?auto_70943 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70938 ?auto_70943 ?auto_70941 )
      ( MAKE-1PILE ?auto_70937 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70944 - BLOCK
    )
    :vars
    (
      ?auto_70950 - BLOCK
      ?auto_70947 - BLOCK
      ?auto_70946 - BLOCK
      ?auto_70948 - BLOCK
      ?auto_70945 - BLOCK
      ?auto_70949 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70944 ?auto_70950 ) ) ( ON-TABLE ?auto_70947 ) ( ON ?auto_70946 ?auto_70947 ) ( not ( = ?auto_70947 ?auto_70946 ) ) ( not ( = ?auto_70947 ?auto_70948 ) ) ( not ( = ?auto_70947 ?auto_70945 ) ) ( not ( = ?auto_70947 ?auto_70950 ) ) ( not ( = ?auto_70947 ?auto_70944 ) ) ( not ( = ?auto_70946 ?auto_70948 ) ) ( not ( = ?auto_70946 ?auto_70945 ) ) ( not ( = ?auto_70946 ?auto_70950 ) ) ( not ( = ?auto_70946 ?auto_70944 ) ) ( not ( = ?auto_70948 ?auto_70945 ) ) ( not ( = ?auto_70948 ?auto_70950 ) ) ( not ( = ?auto_70948 ?auto_70944 ) ) ( not ( = ?auto_70945 ?auto_70950 ) ) ( not ( = ?auto_70945 ?auto_70944 ) ) ( ON ?auto_70944 ?auto_70949 ) ( not ( = ?auto_70944 ?auto_70949 ) ) ( not ( = ?auto_70950 ?auto_70949 ) ) ( not ( = ?auto_70947 ?auto_70949 ) ) ( not ( = ?auto_70946 ?auto_70949 ) ) ( not ( = ?auto_70948 ?auto_70949 ) ) ( not ( = ?auto_70945 ?auto_70949 ) ) ( ON ?auto_70950 ?auto_70944 ) ( ON-TABLE ?auto_70949 ) ( ON ?auto_70945 ?auto_70950 ) ( CLEAR ?auto_70946 ) ( ON ?auto_70948 ?auto_70945 ) ( CLEAR ?auto_70948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70949 ?auto_70944 ?auto_70950 ?auto_70945 )
      ( MAKE-1PILE ?auto_70944 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70951 - BLOCK
    )
    :vars
    (
      ?auto_70955 - BLOCK
      ?auto_70954 - BLOCK
      ?auto_70952 - BLOCK
      ?auto_70953 - BLOCK
      ?auto_70957 - BLOCK
      ?auto_70956 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70951 ?auto_70955 ) ) ( ON-TABLE ?auto_70954 ) ( not ( = ?auto_70954 ?auto_70952 ) ) ( not ( = ?auto_70954 ?auto_70953 ) ) ( not ( = ?auto_70954 ?auto_70957 ) ) ( not ( = ?auto_70954 ?auto_70955 ) ) ( not ( = ?auto_70954 ?auto_70951 ) ) ( not ( = ?auto_70952 ?auto_70953 ) ) ( not ( = ?auto_70952 ?auto_70957 ) ) ( not ( = ?auto_70952 ?auto_70955 ) ) ( not ( = ?auto_70952 ?auto_70951 ) ) ( not ( = ?auto_70953 ?auto_70957 ) ) ( not ( = ?auto_70953 ?auto_70955 ) ) ( not ( = ?auto_70953 ?auto_70951 ) ) ( not ( = ?auto_70957 ?auto_70955 ) ) ( not ( = ?auto_70957 ?auto_70951 ) ) ( ON ?auto_70951 ?auto_70956 ) ( not ( = ?auto_70951 ?auto_70956 ) ) ( not ( = ?auto_70955 ?auto_70956 ) ) ( not ( = ?auto_70954 ?auto_70956 ) ) ( not ( = ?auto_70952 ?auto_70956 ) ) ( not ( = ?auto_70953 ?auto_70956 ) ) ( not ( = ?auto_70957 ?auto_70956 ) ) ( ON ?auto_70955 ?auto_70951 ) ( ON-TABLE ?auto_70956 ) ( ON ?auto_70957 ?auto_70955 ) ( ON ?auto_70953 ?auto_70957 ) ( CLEAR ?auto_70953 ) ( HOLDING ?auto_70952 ) ( CLEAR ?auto_70954 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70954 ?auto_70952 )
      ( MAKE-1PILE ?auto_70951 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70958 - BLOCK
    )
    :vars
    (
      ?auto_70960 - BLOCK
      ?auto_70964 - BLOCK
      ?auto_70961 - BLOCK
      ?auto_70963 - BLOCK
      ?auto_70959 - BLOCK
      ?auto_70962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70958 ?auto_70960 ) ) ( ON-TABLE ?auto_70964 ) ( not ( = ?auto_70964 ?auto_70961 ) ) ( not ( = ?auto_70964 ?auto_70963 ) ) ( not ( = ?auto_70964 ?auto_70959 ) ) ( not ( = ?auto_70964 ?auto_70960 ) ) ( not ( = ?auto_70964 ?auto_70958 ) ) ( not ( = ?auto_70961 ?auto_70963 ) ) ( not ( = ?auto_70961 ?auto_70959 ) ) ( not ( = ?auto_70961 ?auto_70960 ) ) ( not ( = ?auto_70961 ?auto_70958 ) ) ( not ( = ?auto_70963 ?auto_70959 ) ) ( not ( = ?auto_70963 ?auto_70960 ) ) ( not ( = ?auto_70963 ?auto_70958 ) ) ( not ( = ?auto_70959 ?auto_70960 ) ) ( not ( = ?auto_70959 ?auto_70958 ) ) ( ON ?auto_70958 ?auto_70962 ) ( not ( = ?auto_70958 ?auto_70962 ) ) ( not ( = ?auto_70960 ?auto_70962 ) ) ( not ( = ?auto_70964 ?auto_70962 ) ) ( not ( = ?auto_70961 ?auto_70962 ) ) ( not ( = ?auto_70963 ?auto_70962 ) ) ( not ( = ?auto_70959 ?auto_70962 ) ) ( ON ?auto_70960 ?auto_70958 ) ( ON-TABLE ?auto_70962 ) ( ON ?auto_70959 ?auto_70960 ) ( ON ?auto_70963 ?auto_70959 ) ( CLEAR ?auto_70964 ) ( ON ?auto_70961 ?auto_70963 ) ( CLEAR ?auto_70961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70962 ?auto_70958 ?auto_70960 ?auto_70959 ?auto_70963 )
      ( MAKE-1PILE ?auto_70958 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70965 - BLOCK
    )
    :vars
    (
      ?auto_70967 - BLOCK
      ?auto_70969 - BLOCK
      ?auto_70968 - BLOCK
      ?auto_70971 - BLOCK
      ?auto_70966 - BLOCK
      ?auto_70970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70965 ?auto_70967 ) ) ( not ( = ?auto_70969 ?auto_70968 ) ) ( not ( = ?auto_70969 ?auto_70971 ) ) ( not ( = ?auto_70969 ?auto_70966 ) ) ( not ( = ?auto_70969 ?auto_70967 ) ) ( not ( = ?auto_70969 ?auto_70965 ) ) ( not ( = ?auto_70968 ?auto_70971 ) ) ( not ( = ?auto_70968 ?auto_70966 ) ) ( not ( = ?auto_70968 ?auto_70967 ) ) ( not ( = ?auto_70968 ?auto_70965 ) ) ( not ( = ?auto_70971 ?auto_70966 ) ) ( not ( = ?auto_70971 ?auto_70967 ) ) ( not ( = ?auto_70971 ?auto_70965 ) ) ( not ( = ?auto_70966 ?auto_70967 ) ) ( not ( = ?auto_70966 ?auto_70965 ) ) ( ON ?auto_70965 ?auto_70970 ) ( not ( = ?auto_70965 ?auto_70970 ) ) ( not ( = ?auto_70967 ?auto_70970 ) ) ( not ( = ?auto_70969 ?auto_70970 ) ) ( not ( = ?auto_70968 ?auto_70970 ) ) ( not ( = ?auto_70971 ?auto_70970 ) ) ( not ( = ?auto_70966 ?auto_70970 ) ) ( ON ?auto_70967 ?auto_70965 ) ( ON-TABLE ?auto_70970 ) ( ON ?auto_70966 ?auto_70967 ) ( ON ?auto_70971 ?auto_70966 ) ( ON ?auto_70968 ?auto_70971 ) ( CLEAR ?auto_70968 ) ( HOLDING ?auto_70969 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70969 )
      ( MAKE-1PILE ?auto_70965 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_70972 - BLOCK
    )
    :vars
    (
      ?auto_70975 - BLOCK
      ?auto_70974 - BLOCK
      ?auto_70977 - BLOCK
      ?auto_70978 - BLOCK
      ?auto_70976 - BLOCK
      ?auto_70973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70972 ?auto_70975 ) ) ( not ( = ?auto_70974 ?auto_70977 ) ) ( not ( = ?auto_70974 ?auto_70978 ) ) ( not ( = ?auto_70974 ?auto_70976 ) ) ( not ( = ?auto_70974 ?auto_70975 ) ) ( not ( = ?auto_70974 ?auto_70972 ) ) ( not ( = ?auto_70977 ?auto_70978 ) ) ( not ( = ?auto_70977 ?auto_70976 ) ) ( not ( = ?auto_70977 ?auto_70975 ) ) ( not ( = ?auto_70977 ?auto_70972 ) ) ( not ( = ?auto_70978 ?auto_70976 ) ) ( not ( = ?auto_70978 ?auto_70975 ) ) ( not ( = ?auto_70978 ?auto_70972 ) ) ( not ( = ?auto_70976 ?auto_70975 ) ) ( not ( = ?auto_70976 ?auto_70972 ) ) ( ON ?auto_70972 ?auto_70973 ) ( not ( = ?auto_70972 ?auto_70973 ) ) ( not ( = ?auto_70975 ?auto_70973 ) ) ( not ( = ?auto_70974 ?auto_70973 ) ) ( not ( = ?auto_70977 ?auto_70973 ) ) ( not ( = ?auto_70978 ?auto_70973 ) ) ( not ( = ?auto_70976 ?auto_70973 ) ) ( ON ?auto_70975 ?auto_70972 ) ( ON-TABLE ?auto_70973 ) ( ON ?auto_70976 ?auto_70975 ) ( ON ?auto_70978 ?auto_70976 ) ( ON ?auto_70977 ?auto_70978 ) ( ON ?auto_70974 ?auto_70977 ) ( CLEAR ?auto_70974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70973 ?auto_70972 ?auto_70975 ?auto_70976 ?auto_70978 ?auto_70977 )
      ( MAKE-1PILE ?auto_70972 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70983 - BLOCK
      ?auto_70984 - BLOCK
      ?auto_70985 - BLOCK
      ?auto_70986 - BLOCK
    )
    :vars
    (
      ?auto_70987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70987 ?auto_70986 ) ( CLEAR ?auto_70987 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70983 ) ( ON ?auto_70984 ?auto_70983 ) ( ON ?auto_70985 ?auto_70984 ) ( ON ?auto_70986 ?auto_70985 ) ( not ( = ?auto_70983 ?auto_70984 ) ) ( not ( = ?auto_70983 ?auto_70985 ) ) ( not ( = ?auto_70983 ?auto_70986 ) ) ( not ( = ?auto_70983 ?auto_70987 ) ) ( not ( = ?auto_70984 ?auto_70985 ) ) ( not ( = ?auto_70984 ?auto_70986 ) ) ( not ( = ?auto_70984 ?auto_70987 ) ) ( not ( = ?auto_70985 ?auto_70986 ) ) ( not ( = ?auto_70985 ?auto_70987 ) ) ( not ( = ?auto_70986 ?auto_70987 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70987 ?auto_70986 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70988 - BLOCK
      ?auto_70989 - BLOCK
      ?auto_70990 - BLOCK
      ?auto_70991 - BLOCK
    )
    :vars
    (
      ?auto_70992 - BLOCK
      ?auto_70993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70992 ?auto_70991 ) ( CLEAR ?auto_70992 ) ( ON-TABLE ?auto_70988 ) ( ON ?auto_70989 ?auto_70988 ) ( ON ?auto_70990 ?auto_70989 ) ( ON ?auto_70991 ?auto_70990 ) ( not ( = ?auto_70988 ?auto_70989 ) ) ( not ( = ?auto_70988 ?auto_70990 ) ) ( not ( = ?auto_70988 ?auto_70991 ) ) ( not ( = ?auto_70988 ?auto_70992 ) ) ( not ( = ?auto_70989 ?auto_70990 ) ) ( not ( = ?auto_70989 ?auto_70991 ) ) ( not ( = ?auto_70989 ?auto_70992 ) ) ( not ( = ?auto_70990 ?auto_70991 ) ) ( not ( = ?auto_70990 ?auto_70992 ) ) ( not ( = ?auto_70991 ?auto_70992 ) ) ( HOLDING ?auto_70993 ) ( not ( = ?auto_70988 ?auto_70993 ) ) ( not ( = ?auto_70989 ?auto_70993 ) ) ( not ( = ?auto_70990 ?auto_70993 ) ) ( not ( = ?auto_70991 ?auto_70993 ) ) ( not ( = ?auto_70992 ?auto_70993 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_70993 )
      ( MAKE-4PILE ?auto_70988 ?auto_70989 ?auto_70990 ?auto_70991 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_70994 - BLOCK
      ?auto_70995 - BLOCK
      ?auto_70996 - BLOCK
      ?auto_70997 - BLOCK
    )
    :vars
    (
      ?auto_70999 - BLOCK
      ?auto_70998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_70999 ?auto_70997 ) ( ON-TABLE ?auto_70994 ) ( ON ?auto_70995 ?auto_70994 ) ( ON ?auto_70996 ?auto_70995 ) ( ON ?auto_70997 ?auto_70996 ) ( not ( = ?auto_70994 ?auto_70995 ) ) ( not ( = ?auto_70994 ?auto_70996 ) ) ( not ( = ?auto_70994 ?auto_70997 ) ) ( not ( = ?auto_70994 ?auto_70999 ) ) ( not ( = ?auto_70995 ?auto_70996 ) ) ( not ( = ?auto_70995 ?auto_70997 ) ) ( not ( = ?auto_70995 ?auto_70999 ) ) ( not ( = ?auto_70996 ?auto_70997 ) ) ( not ( = ?auto_70996 ?auto_70999 ) ) ( not ( = ?auto_70997 ?auto_70999 ) ) ( not ( = ?auto_70994 ?auto_70998 ) ) ( not ( = ?auto_70995 ?auto_70998 ) ) ( not ( = ?auto_70996 ?auto_70998 ) ) ( not ( = ?auto_70997 ?auto_70998 ) ) ( not ( = ?auto_70999 ?auto_70998 ) ) ( ON ?auto_70998 ?auto_70999 ) ( CLEAR ?auto_70998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70994 ?auto_70995 ?auto_70996 ?auto_70997 ?auto_70999 )
      ( MAKE-4PILE ?auto_70994 ?auto_70995 ?auto_70996 ?auto_70997 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71000 - BLOCK
      ?auto_71001 - BLOCK
      ?auto_71002 - BLOCK
      ?auto_71003 - BLOCK
    )
    :vars
    (
      ?auto_71005 - BLOCK
      ?auto_71004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71005 ?auto_71003 ) ( ON-TABLE ?auto_71000 ) ( ON ?auto_71001 ?auto_71000 ) ( ON ?auto_71002 ?auto_71001 ) ( ON ?auto_71003 ?auto_71002 ) ( not ( = ?auto_71000 ?auto_71001 ) ) ( not ( = ?auto_71000 ?auto_71002 ) ) ( not ( = ?auto_71000 ?auto_71003 ) ) ( not ( = ?auto_71000 ?auto_71005 ) ) ( not ( = ?auto_71001 ?auto_71002 ) ) ( not ( = ?auto_71001 ?auto_71003 ) ) ( not ( = ?auto_71001 ?auto_71005 ) ) ( not ( = ?auto_71002 ?auto_71003 ) ) ( not ( = ?auto_71002 ?auto_71005 ) ) ( not ( = ?auto_71003 ?auto_71005 ) ) ( not ( = ?auto_71000 ?auto_71004 ) ) ( not ( = ?auto_71001 ?auto_71004 ) ) ( not ( = ?auto_71002 ?auto_71004 ) ) ( not ( = ?auto_71003 ?auto_71004 ) ) ( not ( = ?auto_71005 ?auto_71004 ) ) ( HOLDING ?auto_71004 ) ( CLEAR ?auto_71005 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71000 ?auto_71001 ?auto_71002 ?auto_71003 ?auto_71005 ?auto_71004 )
      ( MAKE-4PILE ?auto_71000 ?auto_71001 ?auto_71002 ?auto_71003 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71006 - BLOCK
      ?auto_71007 - BLOCK
      ?auto_71008 - BLOCK
      ?auto_71009 - BLOCK
    )
    :vars
    (
      ?auto_71011 - BLOCK
      ?auto_71010 - BLOCK
      ?auto_71012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71011 ?auto_71009 ) ( ON-TABLE ?auto_71006 ) ( ON ?auto_71007 ?auto_71006 ) ( ON ?auto_71008 ?auto_71007 ) ( ON ?auto_71009 ?auto_71008 ) ( not ( = ?auto_71006 ?auto_71007 ) ) ( not ( = ?auto_71006 ?auto_71008 ) ) ( not ( = ?auto_71006 ?auto_71009 ) ) ( not ( = ?auto_71006 ?auto_71011 ) ) ( not ( = ?auto_71007 ?auto_71008 ) ) ( not ( = ?auto_71007 ?auto_71009 ) ) ( not ( = ?auto_71007 ?auto_71011 ) ) ( not ( = ?auto_71008 ?auto_71009 ) ) ( not ( = ?auto_71008 ?auto_71011 ) ) ( not ( = ?auto_71009 ?auto_71011 ) ) ( not ( = ?auto_71006 ?auto_71010 ) ) ( not ( = ?auto_71007 ?auto_71010 ) ) ( not ( = ?auto_71008 ?auto_71010 ) ) ( not ( = ?auto_71009 ?auto_71010 ) ) ( not ( = ?auto_71011 ?auto_71010 ) ) ( CLEAR ?auto_71011 ) ( ON ?auto_71010 ?auto_71012 ) ( CLEAR ?auto_71010 ) ( HAND-EMPTY ) ( not ( = ?auto_71006 ?auto_71012 ) ) ( not ( = ?auto_71007 ?auto_71012 ) ) ( not ( = ?auto_71008 ?auto_71012 ) ) ( not ( = ?auto_71009 ?auto_71012 ) ) ( not ( = ?auto_71011 ?auto_71012 ) ) ( not ( = ?auto_71010 ?auto_71012 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71010 ?auto_71012 )
      ( MAKE-4PILE ?auto_71006 ?auto_71007 ?auto_71008 ?auto_71009 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71027 - BLOCK
      ?auto_71028 - BLOCK
      ?auto_71029 - BLOCK
      ?auto_71030 - BLOCK
    )
    :vars
    (
      ?auto_71031 - BLOCK
      ?auto_71032 - BLOCK
      ?auto_71033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71027 ) ( ON ?auto_71028 ?auto_71027 ) ( ON ?auto_71029 ?auto_71028 ) ( not ( = ?auto_71027 ?auto_71028 ) ) ( not ( = ?auto_71027 ?auto_71029 ) ) ( not ( = ?auto_71027 ?auto_71030 ) ) ( not ( = ?auto_71027 ?auto_71031 ) ) ( not ( = ?auto_71028 ?auto_71029 ) ) ( not ( = ?auto_71028 ?auto_71030 ) ) ( not ( = ?auto_71028 ?auto_71031 ) ) ( not ( = ?auto_71029 ?auto_71030 ) ) ( not ( = ?auto_71029 ?auto_71031 ) ) ( not ( = ?auto_71030 ?auto_71031 ) ) ( not ( = ?auto_71027 ?auto_71032 ) ) ( not ( = ?auto_71028 ?auto_71032 ) ) ( not ( = ?auto_71029 ?auto_71032 ) ) ( not ( = ?auto_71030 ?auto_71032 ) ) ( not ( = ?auto_71031 ?auto_71032 ) ) ( ON ?auto_71032 ?auto_71033 ) ( not ( = ?auto_71027 ?auto_71033 ) ) ( not ( = ?auto_71028 ?auto_71033 ) ) ( not ( = ?auto_71029 ?auto_71033 ) ) ( not ( = ?auto_71030 ?auto_71033 ) ) ( not ( = ?auto_71031 ?auto_71033 ) ) ( not ( = ?auto_71032 ?auto_71033 ) ) ( ON ?auto_71031 ?auto_71032 ) ( CLEAR ?auto_71031 ) ( HOLDING ?auto_71030 ) ( CLEAR ?auto_71029 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71027 ?auto_71028 ?auto_71029 ?auto_71030 ?auto_71031 )
      ( MAKE-4PILE ?auto_71027 ?auto_71028 ?auto_71029 ?auto_71030 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71034 - BLOCK
      ?auto_71035 - BLOCK
      ?auto_71036 - BLOCK
      ?auto_71037 - BLOCK
    )
    :vars
    (
      ?auto_71038 - BLOCK
      ?auto_71039 - BLOCK
      ?auto_71040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71034 ) ( ON ?auto_71035 ?auto_71034 ) ( ON ?auto_71036 ?auto_71035 ) ( not ( = ?auto_71034 ?auto_71035 ) ) ( not ( = ?auto_71034 ?auto_71036 ) ) ( not ( = ?auto_71034 ?auto_71037 ) ) ( not ( = ?auto_71034 ?auto_71038 ) ) ( not ( = ?auto_71035 ?auto_71036 ) ) ( not ( = ?auto_71035 ?auto_71037 ) ) ( not ( = ?auto_71035 ?auto_71038 ) ) ( not ( = ?auto_71036 ?auto_71037 ) ) ( not ( = ?auto_71036 ?auto_71038 ) ) ( not ( = ?auto_71037 ?auto_71038 ) ) ( not ( = ?auto_71034 ?auto_71039 ) ) ( not ( = ?auto_71035 ?auto_71039 ) ) ( not ( = ?auto_71036 ?auto_71039 ) ) ( not ( = ?auto_71037 ?auto_71039 ) ) ( not ( = ?auto_71038 ?auto_71039 ) ) ( ON ?auto_71039 ?auto_71040 ) ( not ( = ?auto_71034 ?auto_71040 ) ) ( not ( = ?auto_71035 ?auto_71040 ) ) ( not ( = ?auto_71036 ?auto_71040 ) ) ( not ( = ?auto_71037 ?auto_71040 ) ) ( not ( = ?auto_71038 ?auto_71040 ) ) ( not ( = ?auto_71039 ?auto_71040 ) ) ( ON ?auto_71038 ?auto_71039 ) ( CLEAR ?auto_71036 ) ( ON ?auto_71037 ?auto_71038 ) ( CLEAR ?auto_71037 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71040 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71040 ?auto_71039 ?auto_71038 )
      ( MAKE-4PILE ?auto_71034 ?auto_71035 ?auto_71036 ?auto_71037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71041 - BLOCK
      ?auto_71042 - BLOCK
      ?auto_71043 - BLOCK
      ?auto_71044 - BLOCK
    )
    :vars
    (
      ?auto_71045 - BLOCK
      ?auto_71046 - BLOCK
      ?auto_71047 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71041 ) ( ON ?auto_71042 ?auto_71041 ) ( not ( = ?auto_71041 ?auto_71042 ) ) ( not ( = ?auto_71041 ?auto_71043 ) ) ( not ( = ?auto_71041 ?auto_71044 ) ) ( not ( = ?auto_71041 ?auto_71045 ) ) ( not ( = ?auto_71042 ?auto_71043 ) ) ( not ( = ?auto_71042 ?auto_71044 ) ) ( not ( = ?auto_71042 ?auto_71045 ) ) ( not ( = ?auto_71043 ?auto_71044 ) ) ( not ( = ?auto_71043 ?auto_71045 ) ) ( not ( = ?auto_71044 ?auto_71045 ) ) ( not ( = ?auto_71041 ?auto_71046 ) ) ( not ( = ?auto_71042 ?auto_71046 ) ) ( not ( = ?auto_71043 ?auto_71046 ) ) ( not ( = ?auto_71044 ?auto_71046 ) ) ( not ( = ?auto_71045 ?auto_71046 ) ) ( ON ?auto_71046 ?auto_71047 ) ( not ( = ?auto_71041 ?auto_71047 ) ) ( not ( = ?auto_71042 ?auto_71047 ) ) ( not ( = ?auto_71043 ?auto_71047 ) ) ( not ( = ?auto_71044 ?auto_71047 ) ) ( not ( = ?auto_71045 ?auto_71047 ) ) ( not ( = ?auto_71046 ?auto_71047 ) ) ( ON ?auto_71045 ?auto_71046 ) ( ON ?auto_71044 ?auto_71045 ) ( CLEAR ?auto_71044 ) ( ON-TABLE ?auto_71047 ) ( HOLDING ?auto_71043 ) ( CLEAR ?auto_71042 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71041 ?auto_71042 ?auto_71043 )
      ( MAKE-4PILE ?auto_71041 ?auto_71042 ?auto_71043 ?auto_71044 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71048 - BLOCK
      ?auto_71049 - BLOCK
      ?auto_71050 - BLOCK
      ?auto_71051 - BLOCK
    )
    :vars
    (
      ?auto_71052 - BLOCK
      ?auto_71054 - BLOCK
      ?auto_71053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71048 ) ( ON ?auto_71049 ?auto_71048 ) ( not ( = ?auto_71048 ?auto_71049 ) ) ( not ( = ?auto_71048 ?auto_71050 ) ) ( not ( = ?auto_71048 ?auto_71051 ) ) ( not ( = ?auto_71048 ?auto_71052 ) ) ( not ( = ?auto_71049 ?auto_71050 ) ) ( not ( = ?auto_71049 ?auto_71051 ) ) ( not ( = ?auto_71049 ?auto_71052 ) ) ( not ( = ?auto_71050 ?auto_71051 ) ) ( not ( = ?auto_71050 ?auto_71052 ) ) ( not ( = ?auto_71051 ?auto_71052 ) ) ( not ( = ?auto_71048 ?auto_71054 ) ) ( not ( = ?auto_71049 ?auto_71054 ) ) ( not ( = ?auto_71050 ?auto_71054 ) ) ( not ( = ?auto_71051 ?auto_71054 ) ) ( not ( = ?auto_71052 ?auto_71054 ) ) ( ON ?auto_71054 ?auto_71053 ) ( not ( = ?auto_71048 ?auto_71053 ) ) ( not ( = ?auto_71049 ?auto_71053 ) ) ( not ( = ?auto_71050 ?auto_71053 ) ) ( not ( = ?auto_71051 ?auto_71053 ) ) ( not ( = ?auto_71052 ?auto_71053 ) ) ( not ( = ?auto_71054 ?auto_71053 ) ) ( ON ?auto_71052 ?auto_71054 ) ( ON ?auto_71051 ?auto_71052 ) ( ON-TABLE ?auto_71053 ) ( CLEAR ?auto_71049 ) ( ON ?auto_71050 ?auto_71051 ) ( CLEAR ?auto_71050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71053 ?auto_71054 ?auto_71052 ?auto_71051 )
      ( MAKE-4PILE ?auto_71048 ?auto_71049 ?auto_71050 ?auto_71051 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71055 - BLOCK
      ?auto_71056 - BLOCK
      ?auto_71057 - BLOCK
      ?auto_71058 - BLOCK
    )
    :vars
    (
      ?auto_71060 - BLOCK
      ?auto_71061 - BLOCK
      ?auto_71059 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71055 ) ( not ( = ?auto_71055 ?auto_71056 ) ) ( not ( = ?auto_71055 ?auto_71057 ) ) ( not ( = ?auto_71055 ?auto_71058 ) ) ( not ( = ?auto_71055 ?auto_71060 ) ) ( not ( = ?auto_71056 ?auto_71057 ) ) ( not ( = ?auto_71056 ?auto_71058 ) ) ( not ( = ?auto_71056 ?auto_71060 ) ) ( not ( = ?auto_71057 ?auto_71058 ) ) ( not ( = ?auto_71057 ?auto_71060 ) ) ( not ( = ?auto_71058 ?auto_71060 ) ) ( not ( = ?auto_71055 ?auto_71061 ) ) ( not ( = ?auto_71056 ?auto_71061 ) ) ( not ( = ?auto_71057 ?auto_71061 ) ) ( not ( = ?auto_71058 ?auto_71061 ) ) ( not ( = ?auto_71060 ?auto_71061 ) ) ( ON ?auto_71061 ?auto_71059 ) ( not ( = ?auto_71055 ?auto_71059 ) ) ( not ( = ?auto_71056 ?auto_71059 ) ) ( not ( = ?auto_71057 ?auto_71059 ) ) ( not ( = ?auto_71058 ?auto_71059 ) ) ( not ( = ?auto_71060 ?auto_71059 ) ) ( not ( = ?auto_71061 ?auto_71059 ) ) ( ON ?auto_71060 ?auto_71061 ) ( ON ?auto_71058 ?auto_71060 ) ( ON-TABLE ?auto_71059 ) ( ON ?auto_71057 ?auto_71058 ) ( CLEAR ?auto_71057 ) ( HOLDING ?auto_71056 ) ( CLEAR ?auto_71055 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71055 ?auto_71056 )
      ( MAKE-4PILE ?auto_71055 ?auto_71056 ?auto_71057 ?auto_71058 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71062 - BLOCK
      ?auto_71063 - BLOCK
      ?auto_71064 - BLOCK
      ?auto_71065 - BLOCK
    )
    :vars
    (
      ?auto_71068 - BLOCK
      ?auto_71066 - BLOCK
      ?auto_71067 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71062 ) ( not ( = ?auto_71062 ?auto_71063 ) ) ( not ( = ?auto_71062 ?auto_71064 ) ) ( not ( = ?auto_71062 ?auto_71065 ) ) ( not ( = ?auto_71062 ?auto_71068 ) ) ( not ( = ?auto_71063 ?auto_71064 ) ) ( not ( = ?auto_71063 ?auto_71065 ) ) ( not ( = ?auto_71063 ?auto_71068 ) ) ( not ( = ?auto_71064 ?auto_71065 ) ) ( not ( = ?auto_71064 ?auto_71068 ) ) ( not ( = ?auto_71065 ?auto_71068 ) ) ( not ( = ?auto_71062 ?auto_71066 ) ) ( not ( = ?auto_71063 ?auto_71066 ) ) ( not ( = ?auto_71064 ?auto_71066 ) ) ( not ( = ?auto_71065 ?auto_71066 ) ) ( not ( = ?auto_71068 ?auto_71066 ) ) ( ON ?auto_71066 ?auto_71067 ) ( not ( = ?auto_71062 ?auto_71067 ) ) ( not ( = ?auto_71063 ?auto_71067 ) ) ( not ( = ?auto_71064 ?auto_71067 ) ) ( not ( = ?auto_71065 ?auto_71067 ) ) ( not ( = ?auto_71068 ?auto_71067 ) ) ( not ( = ?auto_71066 ?auto_71067 ) ) ( ON ?auto_71068 ?auto_71066 ) ( ON ?auto_71065 ?auto_71068 ) ( ON-TABLE ?auto_71067 ) ( ON ?auto_71064 ?auto_71065 ) ( CLEAR ?auto_71062 ) ( ON ?auto_71063 ?auto_71064 ) ( CLEAR ?auto_71063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71067 ?auto_71066 ?auto_71068 ?auto_71065 ?auto_71064 )
      ( MAKE-4PILE ?auto_71062 ?auto_71063 ?auto_71064 ?auto_71065 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71069 - BLOCK
      ?auto_71070 - BLOCK
      ?auto_71071 - BLOCK
      ?auto_71072 - BLOCK
    )
    :vars
    (
      ?auto_71075 - BLOCK
      ?auto_71073 - BLOCK
      ?auto_71074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71069 ?auto_71070 ) ) ( not ( = ?auto_71069 ?auto_71071 ) ) ( not ( = ?auto_71069 ?auto_71072 ) ) ( not ( = ?auto_71069 ?auto_71075 ) ) ( not ( = ?auto_71070 ?auto_71071 ) ) ( not ( = ?auto_71070 ?auto_71072 ) ) ( not ( = ?auto_71070 ?auto_71075 ) ) ( not ( = ?auto_71071 ?auto_71072 ) ) ( not ( = ?auto_71071 ?auto_71075 ) ) ( not ( = ?auto_71072 ?auto_71075 ) ) ( not ( = ?auto_71069 ?auto_71073 ) ) ( not ( = ?auto_71070 ?auto_71073 ) ) ( not ( = ?auto_71071 ?auto_71073 ) ) ( not ( = ?auto_71072 ?auto_71073 ) ) ( not ( = ?auto_71075 ?auto_71073 ) ) ( ON ?auto_71073 ?auto_71074 ) ( not ( = ?auto_71069 ?auto_71074 ) ) ( not ( = ?auto_71070 ?auto_71074 ) ) ( not ( = ?auto_71071 ?auto_71074 ) ) ( not ( = ?auto_71072 ?auto_71074 ) ) ( not ( = ?auto_71075 ?auto_71074 ) ) ( not ( = ?auto_71073 ?auto_71074 ) ) ( ON ?auto_71075 ?auto_71073 ) ( ON ?auto_71072 ?auto_71075 ) ( ON-TABLE ?auto_71074 ) ( ON ?auto_71071 ?auto_71072 ) ( ON ?auto_71070 ?auto_71071 ) ( CLEAR ?auto_71070 ) ( HOLDING ?auto_71069 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71069 )
      ( MAKE-4PILE ?auto_71069 ?auto_71070 ?auto_71071 ?auto_71072 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71076 - BLOCK
      ?auto_71077 - BLOCK
      ?auto_71078 - BLOCK
      ?auto_71079 - BLOCK
    )
    :vars
    (
      ?auto_71082 - BLOCK
      ?auto_71080 - BLOCK
      ?auto_71081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71076 ?auto_71077 ) ) ( not ( = ?auto_71076 ?auto_71078 ) ) ( not ( = ?auto_71076 ?auto_71079 ) ) ( not ( = ?auto_71076 ?auto_71082 ) ) ( not ( = ?auto_71077 ?auto_71078 ) ) ( not ( = ?auto_71077 ?auto_71079 ) ) ( not ( = ?auto_71077 ?auto_71082 ) ) ( not ( = ?auto_71078 ?auto_71079 ) ) ( not ( = ?auto_71078 ?auto_71082 ) ) ( not ( = ?auto_71079 ?auto_71082 ) ) ( not ( = ?auto_71076 ?auto_71080 ) ) ( not ( = ?auto_71077 ?auto_71080 ) ) ( not ( = ?auto_71078 ?auto_71080 ) ) ( not ( = ?auto_71079 ?auto_71080 ) ) ( not ( = ?auto_71082 ?auto_71080 ) ) ( ON ?auto_71080 ?auto_71081 ) ( not ( = ?auto_71076 ?auto_71081 ) ) ( not ( = ?auto_71077 ?auto_71081 ) ) ( not ( = ?auto_71078 ?auto_71081 ) ) ( not ( = ?auto_71079 ?auto_71081 ) ) ( not ( = ?auto_71082 ?auto_71081 ) ) ( not ( = ?auto_71080 ?auto_71081 ) ) ( ON ?auto_71082 ?auto_71080 ) ( ON ?auto_71079 ?auto_71082 ) ( ON-TABLE ?auto_71081 ) ( ON ?auto_71078 ?auto_71079 ) ( ON ?auto_71077 ?auto_71078 ) ( ON ?auto_71076 ?auto_71077 ) ( CLEAR ?auto_71076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71081 ?auto_71080 ?auto_71082 ?auto_71079 ?auto_71078 ?auto_71077 )
      ( MAKE-4PILE ?auto_71076 ?auto_71077 ?auto_71078 ?auto_71079 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71085 - BLOCK
      ?auto_71086 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_71086 ) ( CLEAR ?auto_71085 ) ( ON-TABLE ?auto_71085 ) ( not ( = ?auto_71085 ?auto_71086 ) ) )
    :subtasks
    ( ( !STACK ?auto_71086 ?auto_71085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71087 - BLOCK
      ?auto_71088 - BLOCK
    )
    :vars
    (
      ?auto_71089 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71087 ) ( ON-TABLE ?auto_71087 ) ( not ( = ?auto_71087 ?auto_71088 ) ) ( ON ?auto_71088 ?auto_71089 ) ( CLEAR ?auto_71088 ) ( HAND-EMPTY ) ( not ( = ?auto_71087 ?auto_71089 ) ) ( not ( = ?auto_71088 ?auto_71089 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71088 ?auto_71089 )
      ( MAKE-2PILE ?auto_71087 ?auto_71088 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71090 - BLOCK
      ?auto_71091 - BLOCK
    )
    :vars
    (
      ?auto_71092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71090 ?auto_71091 ) ) ( ON ?auto_71091 ?auto_71092 ) ( CLEAR ?auto_71091 ) ( not ( = ?auto_71090 ?auto_71092 ) ) ( not ( = ?auto_71091 ?auto_71092 ) ) ( HOLDING ?auto_71090 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71090 )
      ( MAKE-2PILE ?auto_71090 ?auto_71091 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71093 - BLOCK
      ?auto_71094 - BLOCK
    )
    :vars
    (
      ?auto_71095 - BLOCK
      ?auto_71098 - BLOCK
      ?auto_71096 - BLOCK
      ?auto_71097 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71093 ?auto_71094 ) ) ( ON ?auto_71094 ?auto_71095 ) ( not ( = ?auto_71093 ?auto_71095 ) ) ( not ( = ?auto_71094 ?auto_71095 ) ) ( ON ?auto_71093 ?auto_71094 ) ( CLEAR ?auto_71093 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71098 ) ( ON ?auto_71096 ?auto_71098 ) ( ON ?auto_71097 ?auto_71096 ) ( ON ?auto_71095 ?auto_71097 ) ( not ( = ?auto_71098 ?auto_71096 ) ) ( not ( = ?auto_71098 ?auto_71097 ) ) ( not ( = ?auto_71098 ?auto_71095 ) ) ( not ( = ?auto_71098 ?auto_71094 ) ) ( not ( = ?auto_71098 ?auto_71093 ) ) ( not ( = ?auto_71096 ?auto_71097 ) ) ( not ( = ?auto_71096 ?auto_71095 ) ) ( not ( = ?auto_71096 ?auto_71094 ) ) ( not ( = ?auto_71096 ?auto_71093 ) ) ( not ( = ?auto_71097 ?auto_71095 ) ) ( not ( = ?auto_71097 ?auto_71094 ) ) ( not ( = ?auto_71097 ?auto_71093 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71098 ?auto_71096 ?auto_71097 ?auto_71095 ?auto_71094 )
      ( MAKE-2PILE ?auto_71093 ?auto_71094 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71099 - BLOCK
      ?auto_71100 - BLOCK
    )
    :vars
    (
      ?auto_71104 - BLOCK
      ?auto_71103 - BLOCK
      ?auto_71102 - BLOCK
      ?auto_71101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71099 ?auto_71100 ) ) ( ON ?auto_71100 ?auto_71104 ) ( not ( = ?auto_71099 ?auto_71104 ) ) ( not ( = ?auto_71100 ?auto_71104 ) ) ( ON-TABLE ?auto_71103 ) ( ON ?auto_71102 ?auto_71103 ) ( ON ?auto_71101 ?auto_71102 ) ( ON ?auto_71104 ?auto_71101 ) ( not ( = ?auto_71103 ?auto_71102 ) ) ( not ( = ?auto_71103 ?auto_71101 ) ) ( not ( = ?auto_71103 ?auto_71104 ) ) ( not ( = ?auto_71103 ?auto_71100 ) ) ( not ( = ?auto_71103 ?auto_71099 ) ) ( not ( = ?auto_71102 ?auto_71101 ) ) ( not ( = ?auto_71102 ?auto_71104 ) ) ( not ( = ?auto_71102 ?auto_71100 ) ) ( not ( = ?auto_71102 ?auto_71099 ) ) ( not ( = ?auto_71101 ?auto_71104 ) ) ( not ( = ?auto_71101 ?auto_71100 ) ) ( not ( = ?auto_71101 ?auto_71099 ) ) ( HOLDING ?auto_71099 ) ( CLEAR ?auto_71100 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71103 ?auto_71102 ?auto_71101 ?auto_71104 ?auto_71100 ?auto_71099 )
      ( MAKE-2PILE ?auto_71099 ?auto_71100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71105 - BLOCK
      ?auto_71106 - BLOCK
    )
    :vars
    (
      ?auto_71107 - BLOCK
      ?auto_71109 - BLOCK
      ?auto_71110 - BLOCK
      ?auto_71108 - BLOCK
      ?auto_71111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71105 ?auto_71106 ) ) ( ON ?auto_71106 ?auto_71107 ) ( not ( = ?auto_71105 ?auto_71107 ) ) ( not ( = ?auto_71106 ?auto_71107 ) ) ( ON-TABLE ?auto_71109 ) ( ON ?auto_71110 ?auto_71109 ) ( ON ?auto_71108 ?auto_71110 ) ( ON ?auto_71107 ?auto_71108 ) ( not ( = ?auto_71109 ?auto_71110 ) ) ( not ( = ?auto_71109 ?auto_71108 ) ) ( not ( = ?auto_71109 ?auto_71107 ) ) ( not ( = ?auto_71109 ?auto_71106 ) ) ( not ( = ?auto_71109 ?auto_71105 ) ) ( not ( = ?auto_71110 ?auto_71108 ) ) ( not ( = ?auto_71110 ?auto_71107 ) ) ( not ( = ?auto_71110 ?auto_71106 ) ) ( not ( = ?auto_71110 ?auto_71105 ) ) ( not ( = ?auto_71108 ?auto_71107 ) ) ( not ( = ?auto_71108 ?auto_71106 ) ) ( not ( = ?auto_71108 ?auto_71105 ) ) ( CLEAR ?auto_71106 ) ( ON ?auto_71105 ?auto_71111 ) ( CLEAR ?auto_71105 ) ( HAND-EMPTY ) ( not ( = ?auto_71105 ?auto_71111 ) ) ( not ( = ?auto_71106 ?auto_71111 ) ) ( not ( = ?auto_71107 ?auto_71111 ) ) ( not ( = ?auto_71109 ?auto_71111 ) ) ( not ( = ?auto_71110 ?auto_71111 ) ) ( not ( = ?auto_71108 ?auto_71111 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71105 ?auto_71111 )
      ( MAKE-2PILE ?auto_71105 ?auto_71106 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71112 - BLOCK
      ?auto_71113 - BLOCK
    )
    :vars
    (
      ?auto_71118 - BLOCK
      ?auto_71116 - BLOCK
      ?auto_71117 - BLOCK
      ?auto_71115 - BLOCK
      ?auto_71114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71112 ?auto_71113 ) ) ( not ( = ?auto_71112 ?auto_71118 ) ) ( not ( = ?auto_71113 ?auto_71118 ) ) ( ON-TABLE ?auto_71116 ) ( ON ?auto_71117 ?auto_71116 ) ( ON ?auto_71115 ?auto_71117 ) ( ON ?auto_71118 ?auto_71115 ) ( not ( = ?auto_71116 ?auto_71117 ) ) ( not ( = ?auto_71116 ?auto_71115 ) ) ( not ( = ?auto_71116 ?auto_71118 ) ) ( not ( = ?auto_71116 ?auto_71113 ) ) ( not ( = ?auto_71116 ?auto_71112 ) ) ( not ( = ?auto_71117 ?auto_71115 ) ) ( not ( = ?auto_71117 ?auto_71118 ) ) ( not ( = ?auto_71117 ?auto_71113 ) ) ( not ( = ?auto_71117 ?auto_71112 ) ) ( not ( = ?auto_71115 ?auto_71118 ) ) ( not ( = ?auto_71115 ?auto_71113 ) ) ( not ( = ?auto_71115 ?auto_71112 ) ) ( ON ?auto_71112 ?auto_71114 ) ( CLEAR ?auto_71112 ) ( not ( = ?auto_71112 ?auto_71114 ) ) ( not ( = ?auto_71113 ?auto_71114 ) ) ( not ( = ?auto_71118 ?auto_71114 ) ) ( not ( = ?auto_71116 ?auto_71114 ) ) ( not ( = ?auto_71117 ?auto_71114 ) ) ( not ( = ?auto_71115 ?auto_71114 ) ) ( HOLDING ?auto_71113 ) ( CLEAR ?auto_71118 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71116 ?auto_71117 ?auto_71115 ?auto_71118 ?auto_71113 )
      ( MAKE-2PILE ?auto_71112 ?auto_71113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71119 - BLOCK
      ?auto_71120 - BLOCK
    )
    :vars
    (
      ?auto_71122 - BLOCK
      ?auto_71125 - BLOCK
      ?auto_71121 - BLOCK
      ?auto_71123 - BLOCK
      ?auto_71124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71119 ?auto_71120 ) ) ( not ( = ?auto_71119 ?auto_71122 ) ) ( not ( = ?auto_71120 ?auto_71122 ) ) ( ON-TABLE ?auto_71125 ) ( ON ?auto_71121 ?auto_71125 ) ( ON ?auto_71123 ?auto_71121 ) ( ON ?auto_71122 ?auto_71123 ) ( not ( = ?auto_71125 ?auto_71121 ) ) ( not ( = ?auto_71125 ?auto_71123 ) ) ( not ( = ?auto_71125 ?auto_71122 ) ) ( not ( = ?auto_71125 ?auto_71120 ) ) ( not ( = ?auto_71125 ?auto_71119 ) ) ( not ( = ?auto_71121 ?auto_71123 ) ) ( not ( = ?auto_71121 ?auto_71122 ) ) ( not ( = ?auto_71121 ?auto_71120 ) ) ( not ( = ?auto_71121 ?auto_71119 ) ) ( not ( = ?auto_71123 ?auto_71122 ) ) ( not ( = ?auto_71123 ?auto_71120 ) ) ( not ( = ?auto_71123 ?auto_71119 ) ) ( ON ?auto_71119 ?auto_71124 ) ( not ( = ?auto_71119 ?auto_71124 ) ) ( not ( = ?auto_71120 ?auto_71124 ) ) ( not ( = ?auto_71122 ?auto_71124 ) ) ( not ( = ?auto_71125 ?auto_71124 ) ) ( not ( = ?auto_71121 ?auto_71124 ) ) ( not ( = ?auto_71123 ?auto_71124 ) ) ( CLEAR ?auto_71122 ) ( ON ?auto_71120 ?auto_71119 ) ( CLEAR ?auto_71120 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71124 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71124 ?auto_71119 )
      ( MAKE-2PILE ?auto_71119 ?auto_71120 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71126 - BLOCK
      ?auto_71127 - BLOCK
    )
    :vars
    (
      ?auto_71129 - BLOCK
      ?auto_71130 - BLOCK
      ?auto_71132 - BLOCK
      ?auto_71128 - BLOCK
      ?auto_71131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71126 ?auto_71127 ) ) ( not ( = ?auto_71126 ?auto_71129 ) ) ( not ( = ?auto_71127 ?auto_71129 ) ) ( ON-TABLE ?auto_71130 ) ( ON ?auto_71132 ?auto_71130 ) ( ON ?auto_71128 ?auto_71132 ) ( not ( = ?auto_71130 ?auto_71132 ) ) ( not ( = ?auto_71130 ?auto_71128 ) ) ( not ( = ?auto_71130 ?auto_71129 ) ) ( not ( = ?auto_71130 ?auto_71127 ) ) ( not ( = ?auto_71130 ?auto_71126 ) ) ( not ( = ?auto_71132 ?auto_71128 ) ) ( not ( = ?auto_71132 ?auto_71129 ) ) ( not ( = ?auto_71132 ?auto_71127 ) ) ( not ( = ?auto_71132 ?auto_71126 ) ) ( not ( = ?auto_71128 ?auto_71129 ) ) ( not ( = ?auto_71128 ?auto_71127 ) ) ( not ( = ?auto_71128 ?auto_71126 ) ) ( ON ?auto_71126 ?auto_71131 ) ( not ( = ?auto_71126 ?auto_71131 ) ) ( not ( = ?auto_71127 ?auto_71131 ) ) ( not ( = ?auto_71129 ?auto_71131 ) ) ( not ( = ?auto_71130 ?auto_71131 ) ) ( not ( = ?auto_71132 ?auto_71131 ) ) ( not ( = ?auto_71128 ?auto_71131 ) ) ( ON ?auto_71127 ?auto_71126 ) ( CLEAR ?auto_71127 ) ( ON-TABLE ?auto_71131 ) ( HOLDING ?auto_71129 ) ( CLEAR ?auto_71128 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71130 ?auto_71132 ?auto_71128 ?auto_71129 )
      ( MAKE-2PILE ?auto_71126 ?auto_71127 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71133 - BLOCK
      ?auto_71134 - BLOCK
    )
    :vars
    (
      ?auto_71137 - BLOCK
      ?auto_71136 - BLOCK
      ?auto_71135 - BLOCK
      ?auto_71138 - BLOCK
      ?auto_71139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71133 ?auto_71134 ) ) ( not ( = ?auto_71133 ?auto_71137 ) ) ( not ( = ?auto_71134 ?auto_71137 ) ) ( ON-TABLE ?auto_71136 ) ( ON ?auto_71135 ?auto_71136 ) ( ON ?auto_71138 ?auto_71135 ) ( not ( = ?auto_71136 ?auto_71135 ) ) ( not ( = ?auto_71136 ?auto_71138 ) ) ( not ( = ?auto_71136 ?auto_71137 ) ) ( not ( = ?auto_71136 ?auto_71134 ) ) ( not ( = ?auto_71136 ?auto_71133 ) ) ( not ( = ?auto_71135 ?auto_71138 ) ) ( not ( = ?auto_71135 ?auto_71137 ) ) ( not ( = ?auto_71135 ?auto_71134 ) ) ( not ( = ?auto_71135 ?auto_71133 ) ) ( not ( = ?auto_71138 ?auto_71137 ) ) ( not ( = ?auto_71138 ?auto_71134 ) ) ( not ( = ?auto_71138 ?auto_71133 ) ) ( ON ?auto_71133 ?auto_71139 ) ( not ( = ?auto_71133 ?auto_71139 ) ) ( not ( = ?auto_71134 ?auto_71139 ) ) ( not ( = ?auto_71137 ?auto_71139 ) ) ( not ( = ?auto_71136 ?auto_71139 ) ) ( not ( = ?auto_71135 ?auto_71139 ) ) ( not ( = ?auto_71138 ?auto_71139 ) ) ( ON ?auto_71134 ?auto_71133 ) ( ON-TABLE ?auto_71139 ) ( CLEAR ?auto_71138 ) ( ON ?auto_71137 ?auto_71134 ) ( CLEAR ?auto_71137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71139 ?auto_71133 ?auto_71134 )
      ( MAKE-2PILE ?auto_71133 ?auto_71134 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71140 - BLOCK
      ?auto_71141 - BLOCK
    )
    :vars
    (
      ?auto_71142 - BLOCK
      ?auto_71144 - BLOCK
      ?auto_71143 - BLOCK
      ?auto_71146 - BLOCK
      ?auto_71145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71140 ?auto_71141 ) ) ( not ( = ?auto_71140 ?auto_71142 ) ) ( not ( = ?auto_71141 ?auto_71142 ) ) ( ON-TABLE ?auto_71144 ) ( ON ?auto_71143 ?auto_71144 ) ( not ( = ?auto_71144 ?auto_71143 ) ) ( not ( = ?auto_71144 ?auto_71146 ) ) ( not ( = ?auto_71144 ?auto_71142 ) ) ( not ( = ?auto_71144 ?auto_71141 ) ) ( not ( = ?auto_71144 ?auto_71140 ) ) ( not ( = ?auto_71143 ?auto_71146 ) ) ( not ( = ?auto_71143 ?auto_71142 ) ) ( not ( = ?auto_71143 ?auto_71141 ) ) ( not ( = ?auto_71143 ?auto_71140 ) ) ( not ( = ?auto_71146 ?auto_71142 ) ) ( not ( = ?auto_71146 ?auto_71141 ) ) ( not ( = ?auto_71146 ?auto_71140 ) ) ( ON ?auto_71140 ?auto_71145 ) ( not ( = ?auto_71140 ?auto_71145 ) ) ( not ( = ?auto_71141 ?auto_71145 ) ) ( not ( = ?auto_71142 ?auto_71145 ) ) ( not ( = ?auto_71144 ?auto_71145 ) ) ( not ( = ?auto_71143 ?auto_71145 ) ) ( not ( = ?auto_71146 ?auto_71145 ) ) ( ON ?auto_71141 ?auto_71140 ) ( ON-TABLE ?auto_71145 ) ( ON ?auto_71142 ?auto_71141 ) ( CLEAR ?auto_71142 ) ( HOLDING ?auto_71146 ) ( CLEAR ?auto_71143 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71144 ?auto_71143 ?auto_71146 )
      ( MAKE-2PILE ?auto_71140 ?auto_71141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71147 - BLOCK
      ?auto_71148 - BLOCK
    )
    :vars
    (
      ?auto_71152 - BLOCK
      ?auto_71150 - BLOCK
      ?auto_71149 - BLOCK
      ?auto_71153 - BLOCK
      ?auto_71151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71147 ?auto_71148 ) ) ( not ( = ?auto_71147 ?auto_71152 ) ) ( not ( = ?auto_71148 ?auto_71152 ) ) ( ON-TABLE ?auto_71150 ) ( ON ?auto_71149 ?auto_71150 ) ( not ( = ?auto_71150 ?auto_71149 ) ) ( not ( = ?auto_71150 ?auto_71153 ) ) ( not ( = ?auto_71150 ?auto_71152 ) ) ( not ( = ?auto_71150 ?auto_71148 ) ) ( not ( = ?auto_71150 ?auto_71147 ) ) ( not ( = ?auto_71149 ?auto_71153 ) ) ( not ( = ?auto_71149 ?auto_71152 ) ) ( not ( = ?auto_71149 ?auto_71148 ) ) ( not ( = ?auto_71149 ?auto_71147 ) ) ( not ( = ?auto_71153 ?auto_71152 ) ) ( not ( = ?auto_71153 ?auto_71148 ) ) ( not ( = ?auto_71153 ?auto_71147 ) ) ( ON ?auto_71147 ?auto_71151 ) ( not ( = ?auto_71147 ?auto_71151 ) ) ( not ( = ?auto_71148 ?auto_71151 ) ) ( not ( = ?auto_71152 ?auto_71151 ) ) ( not ( = ?auto_71150 ?auto_71151 ) ) ( not ( = ?auto_71149 ?auto_71151 ) ) ( not ( = ?auto_71153 ?auto_71151 ) ) ( ON ?auto_71148 ?auto_71147 ) ( ON-TABLE ?auto_71151 ) ( ON ?auto_71152 ?auto_71148 ) ( CLEAR ?auto_71149 ) ( ON ?auto_71153 ?auto_71152 ) ( CLEAR ?auto_71153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71151 ?auto_71147 ?auto_71148 ?auto_71152 )
      ( MAKE-2PILE ?auto_71147 ?auto_71148 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71154 - BLOCK
      ?auto_71155 - BLOCK
    )
    :vars
    (
      ?auto_71157 - BLOCK
      ?auto_71156 - BLOCK
      ?auto_71158 - BLOCK
      ?auto_71160 - BLOCK
      ?auto_71159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71154 ?auto_71155 ) ) ( not ( = ?auto_71154 ?auto_71157 ) ) ( not ( = ?auto_71155 ?auto_71157 ) ) ( ON-TABLE ?auto_71156 ) ( not ( = ?auto_71156 ?auto_71158 ) ) ( not ( = ?auto_71156 ?auto_71160 ) ) ( not ( = ?auto_71156 ?auto_71157 ) ) ( not ( = ?auto_71156 ?auto_71155 ) ) ( not ( = ?auto_71156 ?auto_71154 ) ) ( not ( = ?auto_71158 ?auto_71160 ) ) ( not ( = ?auto_71158 ?auto_71157 ) ) ( not ( = ?auto_71158 ?auto_71155 ) ) ( not ( = ?auto_71158 ?auto_71154 ) ) ( not ( = ?auto_71160 ?auto_71157 ) ) ( not ( = ?auto_71160 ?auto_71155 ) ) ( not ( = ?auto_71160 ?auto_71154 ) ) ( ON ?auto_71154 ?auto_71159 ) ( not ( = ?auto_71154 ?auto_71159 ) ) ( not ( = ?auto_71155 ?auto_71159 ) ) ( not ( = ?auto_71157 ?auto_71159 ) ) ( not ( = ?auto_71156 ?auto_71159 ) ) ( not ( = ?auto_71158 ?auto_71159 ) ) ( not ( = ?auto_71160 ?auto_71159 ) ) ( ON ?auto_71155 ?auto_71154 ) ( ON-TABLE ?auto_71159 ) ( ON ?auto_71157 ?auto_71155 ) ( ON ?auto_71160 ?auto_71157 ) ( CLEAR ?auto_71160 ) ( HOLDING ?auto_71158 ) ( CLEAR ?auto_71156 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71156 ?auto_71158 )
      ( MAKE-2PILE ?auto_71154 ?auto_71155 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71161 - BLOCK
      ?auto_71162 - BLOCK
    )
    :vars
    (
      ?auto_71163 - BLOCK
      ?auto_71166 - BLOCK
      ?auto_71165 - BLOCK
      ?auto_71164 - BLOCK
      ?auto_71167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71161 ?auto_71162 ) ) ( not ( = ?auto_71161 ?auto_71163 ) ) ( not ( = ?auto_71162 ?auto_71163 ) ) ( ON-TABLE ?auto_71166 ) ( not ( = ?auto_71166 ?auto_71165 ) ) ( not ( = ?auto_71166 ?auto_71164 ) ) ( not ( = ?auto_71166 ?auto_71163 ) ) ( not ( = ?auto_71166 ?auto_71162 ) ) ( not ( = ?auto_71166 ?auto_71161 ) ) ( not ( = ?auto_71165 ?auto_71164 ) ) ( not ( = ?auto_71165 ?auto_71163 ) ) ( not ( = ?auto_71165 ?auto_71162 ) ) ( not ( = ?auto_71165 ?auto_71161 ) ) ( not ( = ?auto_71164 ?auto_71163 ) ) ( not ( = ?auto_71164 ?auto_71162 ) ) ( not ( = ?auto_71164 ?auto_71161 ) ) ( ON ?auto_71161 ?auto_71167 ) ( not ( = ?auto_71161 ?auto_71167 ) ) ( not ( = ?auto_71162 ?auto_71167 ) ) ( not ( = ?auto_71163 ?auto_71167 ) ) ( not ( = ?auto_71166 ?auto_71167 ) ) ( not ( = ?auto_71165 ?auto_71167 ) ) ( not ( = ?auto_71164 ?auto_71167 ) ) ( ON ?auto_71162 ?auto_71161 ) ( ON-TABLE ?auto_71167 ) ( ON ?auto_71163 ?auto_71162 ) ( ON ?auto_71164 ?auto_71163 ) ( CLEAR ?auto_71166 ) ( ON ?auto_71165 ?auto_71164 ) ( CLEAR ?auto_71165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71167 ?auto_71161 ?auto_71162 ?auto_71163 ?auto_71164 )
      ( MAKE-2PILE ?auto_71161 ?auto_71162 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71168 - BLOCK
      ?auto_71169 - BLOCK
    )
    :vars
    (
      ?auto_71171 - BLOCK
      ?auto_71172 - BLOCK
      ?auto_71173 - BLOCK
      ?auto_71170 - BLOCK
      ?auto_71174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71168 ?auto_71169 ) ) ( not ( = ?auto_71168 ?auto_71171 ) ) ( not ( = ?auto_71169 ?auto_71171 ) ) ( not ( = ?auto_71172 ?auto_71173 ) ) ( not ( = ?auto_71172 ?auto_71170 ) ) ( not ( = ?auto_71172 ?auto_71171 ) ) ( not ( = ?auto_71172 ?auto_71169 ) ) ( not ( = ?auto_71172 ?auto_71168 ) ) ( not ( = ?auto_71173 ?auto_71170 ) ) ( not ( = ?auto_71173 ?auto_71171 ) ) ( not ( = ?auto_71173 ?auto_71169 ) ) ( not ( = ?auto_71173 ?auto_71168 ) ) ( not ( = ?auto_71170 ?auto_71171 ) ) ( not ( = ?auto_71170 ?auto_71169 ) ) ( not ( = ?auto_71170 ?auto_71168 ) ) ( ON ?auto_71168 ?auto_71174 ) ( not ( = ?auto_71168 ?auto_71174 ) ) ( not ( = ?auto_71169 ?auto_71174 ) ) ( not ( = ?auto_71171 ?auto_71174 ) ) ( not ( = ?auto_71172 ?auto_71174 ) ) ( not ( = ?auto_71173 ?auto_71174 ) ) ( not ( = ?auto_71170 ?auto_71174 ) ) ( ON ?auto_71169 ?auto_71168 ) ( ON-TABLE ?auto_71174 ) ( ON ?auto_71171 ?auto_71169 ) ( ON ?auto_71170 ?auto_71171 ) ( ON ?auto_71173 ?auto_71170 ) ( CLEAR ?auto_71173 ) ( HOLDING ?auto_71172 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71172 )
      ( MAKE-2PILE ?auto_71168 ?auto_71169 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71175 - BLOCK
      ?auto_71176 - BLOCK
    )
    :vars
    (
      ?auto_71177 - BLOCK
      ?auto_71179 - BLOCK
      ?auto_71181 - BLOCK
      ?auto_71180 - BLOCK
      ?auto_71178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71175 ?auto_71176 ) ) ( not ( = ?auto_71175 ?auto_71177 ) ) ( not ( = ?auto_71176 ?auto_71177 ) ) ( not ( = ?auto_71179 ?auto_71181 ) ) ( not ( = ?auto_71179 ?auto_71180 ) ) ( not ( = ?auto_71179 ?auto_71177 ) ) ( not ( = ?auto_71179 ?auto_71176 ) ) ( not ( = ?auto_71179 ?auto_71175 ) ) ( not ( = ?auto_71181 ?auto_71180 ) ) ( not ( = ?auto_71181 ?auto_71177 ) ) ( not ( = ?auto_71181 ?auto_71176 ) ) ( not ( = ?auto_71181 ?auto_71175 ) ) ( not ( = ?auto_71180 ?auto_71177 ) ) ( not ( = ?auto_71180 ?auto_71176 ) ) ( not ( = ?auto_71180 ?auto_71175 ) ) ( ON ?auto_71175 ?auto_71178 ) ( not ( = ?auto_71175 ?auto_71178 ) ) ( not ( = ?auto_71176 ?auto_71178 ) ) ( not ( = ?auto_71177 ?auto_71178 ) ) ( not ( = ?auto_71179 ?auto_71178 ) ) ( not ( = ?auto_71181 ?auto_71178 ) ) ( not ( = ?auto_71180 ?auto_71178 ) ) ( ON ?auto_71176 ?auto_71175 ) ( ON-TABLE ?auto_71178 ) ( ON ?auto_71177 ?auto_71176 ) ( ON ?auto_71180 ?auto_71177 ) ( ON ?auto_71181 ?auto_71180 ) ( ON ?auto_71179 ?auto_71181 ) ( CLEAR ?auto_71179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71178 ?auto_71175 ?auto_71176 ?auto_71177 ?auto_71180 ?auto_71181 )
      ( MAKE-2PILE ?auto_71175 ?auto_71176 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71185 - BLOCK
      ?auto_71186 - BLOCK
      ?auto_71187 - BLOCK
    )
    :vars
    (
      ?auto_71188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71188 ?auto_71187 ) ( CLEAR ?auto_71188 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71185 ) ( ON ?auto_71186 ?auto_71185 ) ( ON ?auto_71187 ?auto_71186 ) ( not ( = ?auto_71185 ?auto_71186 ) ) ( not ( = ?auto_71185 ?auto_71187 ) ) ( not ( = ?auto_71185 ?auto_71188 ) ) ( not ( = ?auto_71186 ?auto_71187 ) ) ( not ( = ?auto_71186 ?auto_71188 ) ) ( not ( = ?auto_71187 ?auto_71188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71188 ?auto_71187 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71189 - BLOCK
      ?auto_71190 - BLOCK
      ?auto_71191 - BLOCK
    )
    :vars
    (
      ?auto_71192 - BLOCK
      ?auto_71193 - BLOCK
      ?auto_71194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71192 ?auto_71191 ) ( CLEAR ?auto_71192 ) ( ON-TABLE ?auto_71189 ) ( ON ?auto_71190 ?auto_71189 ) ( ON ?auto_71191 ?auto_71190 ) ( not ( = ?auto_71189 ?auto_71190 ) ) ( not ( = ?auto_71189 ?auto_71191 ) ) ( not ( = ?auto_71189 ?auto_71192 ) ) ( not ( = ?auto_71190 ?auto_71191 ) ) ( not ( = ?auto_71190 ?auto_71192 ) ) ( not ( = ?auto_71191 ?auto_71192 ) ) ( HOLDING ?auto_71193 ) ( CLEAR ?auto_71194 ) ( not ( = ?auto_71189 ?auto_71193 ) ) ( not ( = ?auto_71189 ?auto_71194 ) ) ( not ( = ?auto_71190 ?auto_71193 ) ) ( not ( = ?auto_71190 ?auto_71194 ) ) ( not ( = ?auto_71191 ?auto_71193 ) ) ( not ( = ?auto_71191 ?auto_71194 ) ) ( not ( = ?auto_71192 ?auto_71193 ) ) ( not ( = ?auto_71192 ?auto_71194 ) ) ( not ( = ?auto_71193 ?auto_71194 ) ) )
    :subtasks
    ( ( !STACK ?auto_71193 ?auto_71194 )
      ( MAKE-3PILE ?auto_71189 ?auto_71190 ?auto_71191 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71195 - BLOCK
      ?auto_71196 - BLOCK
      ?auto_71197 - BLOCK
    )
    :vars
    (
      ?auto_71200 - BLOCK
      ?auto_71198 - BLOCK
      ?auto_71199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71200 ?auto_71197 ) ( ON-TABLE ?auto_71195 ) ( ON ?auto_71196 ?auto_71195 ) ( ON ?auto_71197 ?auto_71196 ) ( not ( = ?auto_71195 ?auto_71196 ) ) ( not ( = ?auto_71195 ?auto_71197 ) ) ( not ( = ?auto_71195 ?auto_71200 ) ) ( not ( = ?auto_71196 ?auto_71197 ) ) ( not ( = ?auto_71196 ?auto_71200 ) ) ( not ( = ?auto_71197 ?auto_71200 ) ) ( CLEAR ?auto_71198 ) ( not ( = ?auto_71195 ?auto_71199 ) ) ( not ( = ?auto_71195 ?auto_71198 ) ) ( not ( = ?auto_71196 ?auto_71199 ) ) ( not ( = ?auto_71196 ?auto_71198 ) ) ( not ( = ?auto_71197 ?auto_71199 ) ) ( not ( = ?auto_71197 ?auto_71198 ) ) ( not ( = ?auto_71200 ?auto_71199 ) ) ( not ( = ?auto_71200 ?auto_71198 ) ) ( not ( = ?auto_71199 ?auto_71198 ) ) ( ON ?auto_71199 ?auto_71200 ) ( CLEAR ?auto_71199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71195 ?auto_71196 ?auto_71197 ?auto_71200 )
      ( MAKE-3PILE ?auto_71195 ?auto_71196 ?auto_71197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71201 - BLOCK
      ?auto_71202 - BLOCK
      ?auto_71203 - BLOCK
    )
    :vars
    (
      ?auto_71206 - BLOCK
      ?auto_71205 - BLOCK
      ?auto_71204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71206 ?auto_71203 ) ( ON-TABLE ?auto_71201 ) ( ON ?auto_71202 ?auto_71201 ) ( ON ?auto_71203 ?auto_71202 ) ( not ( = ?auto_71201 ?auto_71202 ) ) ( not ( = ?auto_71201 ?auto_71203 ) ) ( not ( = ?auto_71201 ?auto_71206 ) ) ( not ( = ?auto_71202 ?auto_71203 ) ) ( not ( = ?auto_71202 ?auto_71206 ) ) ( not ( = ?auto_71203 ?auto_71206 ) ) ( not ( = ?auto_71201 ?auto_71205 ) ) ( not ( = ?auto_71201 ?auto_71204 ) ) ( not ( = ?auto_71202 ?auto_71205 ) ) ( not ( = ?auto_71202 ?auto_71204 ) ) ( not ( = ?auto_71203 ?auto_71205 ) ) ( not ( = ?auto_71203 ?auto_71204 ) ) ( not ( = ?auto_71206 ?auto_71205 ) ) ( not ( = ?auto_71206 ?auto_71204 ) ) ( not ( = ?auto_71205 ?auto_71204 ) ) ( ON ?auto_71205 ?auto_71206 ) ( CLEAR ?auto_71205 ) ( HOLDING ?auto_71204 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71204 )
      ( MAKE-3PILE ?auto_71201 ?auto_71202 ?auto_71203 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71207 - BLOCK
      ?auto_71208 - BLOCK
      ?auto_71209 - BLOCK
    )
    :vars
    (
      ?auto_71212 - BLOCK
      ?auto_71210 - BLOCK
      ?auto_71211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71212 ?auto_71209 ) ( ON-TABLE ?auto_71207 ) ( ON ?auto_71208 ?auto_71207 ) ( ON ?auto_71209 ?auto_71208 ) ( not ( = ?auto_71207 ?auto_71208 ) ) ( not ( = ?auto_71207 ?auto_71209 ) ) ( not ( = ?auto_71207 ?auto_71212 ) ) ( not ( = ?auto_71208 ?auto_71209 ) ) ( not ( = ?auto_71208 ?auto_71212 ) ) ( not ( = ?auto_71209 ?auto_71212 ) ) ( not ( = ?auto_71207 ?auto_71210 ) ) ( not ( = ?auto_71207 ?auto_71211 ) ) ( not ( = ?auto_71208 ?auto_71210 ) ) ( not ( = ?auto_71208 ?auto_71211 ) ) ( not ( = ?auto_71209 ?auto_71210 ) ) ( not ( = ?auto_71209 ?auto_71211 ) ) ( not ( = ?auto_71212 ?auto_71210 ) ) ( not ( = ?auto_71212 ?auto_71211 ) ) ( not ( = ?auto_71210 ?auto_71211 ) ) ( ON ?auto_71210 ?auto_71212 ) ( ON ?auto_71211 ?auto_71210 ) ( CLEAR ?auto_71211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71207 ?auto_71208 ?auto_71209 ?auto_71212 ?auto_71210 )
      ( MAKE-3PILE ?auto_71207 ?auto_71208 ?auto_71209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71213 - BLOCK
      ?auto_71214 - BLOCK
      ?auto_71215 - BLOCK
    )
    :vars
    (
      ?auto_71217 - BLOCK
      ?auto_71216 - BLOCK
      ?auto_71218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71217 ?auto_71215 ) ( ON-TABLE ?auto_71213 ) ( ON ?auto_71214 ?auto_71213 ) ( ON ?auto_71215 ?auto_71214 ) ( not ( = ?auto_71213 ?auto_71214 ) ) ( not ( = ?auto_71213 ?auto_71215 ) ) ( not ( = ?auto_71213 ?auto_71217 ) ) ( not ( = ?auto_71214 ?auto_71215 ) ) ( not ( = ?auto_71214 ?auto_71217 ) ) ( not ( = ?auto_71215 ?auto_71217 ) ) ( not ( = ?auto_71213 ?auto_71216 ) ) ( not ( = ?auto_71213 ?auto_71218 ) ) ( not ( = ?auto_71214 ?auto_71216 ) ) ( not ( = ?auto_71214 ?auto_71218 ) ) ( not ( = ?auto_71215 ?auto_71216 ) ) ( not ( = ?auto_71215 ?auto_71218 ) ) ( not ( = ?auto_71217 ?auto_71216 ) ) ( not ( = ?auto_71217 ?auto_71218 ) ) ( not ( = ?auto_71216 ?auto_71218 ) ) ( ON ?auto_71216 ?auto_71217 ) ( HOLDING ?auto_71218 ) ( CLEAR ?auto_71216 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71213 ?auto_71214 ?auto_71215 ?auto_71217 ?auto_71216 ?auto_71218 )
      ( MAKE-3PILE ?auto_71213 ?auto_71214 ?auto_71215 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71219 - BLOCK
      ?auto_71220 - BLOCK
      ?auto_71221 - BLOCK
    )
    :vars
    (
      ?auto_71224 - BLOCK
      ?auto_71223 - BLOCK
      ?auto_71222 - BLOCK
      ?auto_71225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71224 ?auto_71221 ) ( ON-TABLE ?auto_71219 ) ( ON ?auto_71220 ?auto_71219 ) ( ON ?auto_71221 ?auto_71220 ) ( not ( = ?auto_71219 ?auto_71220 ) ) ( not ( = ?auto_71219 ?auto_71221 ) ) ( not ( = ?auto_71219 ?auto_71224 ) ) ( not ( = ?auto_71220 ?auto_71221 ) ) ( not ( = ?auto_71220 ?auto_71224 ) ) ( not ( = ?auto_71221 ?auto_71224 ) ) ( not ( = ?auto_71219 ?auto_71223 ) ) ( not ( = ?auto_71219 ?auto_71222 ) ) ( not ( = ?auto_71220 ?auto_71223 ) ) ( not ( = ?auto_71220 ?auto_71222 ) ) ( not ( = ?auto_71221 ?auto_71223 ) ) ( not ( = ?auto_71221 ?auto_71222 ) ) ( not ( = ?auto_71224 ?auto_71223 ) ) ( not ( = ?auto_71224 ?auto_71222 ) ) ( not ( = ?auto_71223 ?auto_71222 ) ) ( ON ?auto_71223 ?auto_71224 ) ( CLEAR ?auto_71223 ) ( ON ?auto_71222 ?auto_71225 ) ( CLEAR ?auto_71222 ) ( HAND-EMPTY ) ( not ( = ?auto_71219 ?auto_71225 ) ) ( not ( = ?auto_71220 ?auto_71225 ) ) ( not ( = ?auto_71221 ?auto_71225 ) ) ( not ( = ?auto_71224 ?auto_71225 ) ) ( not ( = ?auto_71223 ?auto_71225 ) ) ( not ( = ?auto_71222 ?auto_71225 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71222 ?auto_71225 )
      ( MAKE-3PILE ?auto_71219 ?auto_71220 ?auto_71221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71226 - BLOCK
      ?auto_71227 - BLOCK
      ?auto_71228 - BLOCK
    )
    :vars
    (
      ?auto_71231 - BLOCK
      ?auto_71232 - BLOCK
      ?auto_71230 - BLOCK
      ?auto_71229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71231 ?auto_71228 ) ( ON-TABLE ?auto_71226 ) ( ON ?auto_71227 ?auto_71226 ) ( ON ?auto_71228 ?auto_71227 ) ( not ( = ?auto_71226 ?auto_71227 ) ) ( not ( = ?auto_71226 ?auto_71228 ) ) ( not ( = ?auto_71226 ?auto_71231 ) ) ( not ( = ?auto_71227 ?auto_71228 ) ) ( not ( = ?auto_71227 ?auto_71231 ) ) ( not ( = ?auto_71228 ?auto_71231 ) ) ( not ( = ?auto_71226 ?auto_71232 ) ) ( not ( = ?auto_71226 ?auto_71230 ) ) ( not ( = ?auto_71227 ?auto_71232 ) ) ( not ( = ?auto_71227 ?auto_71230 ) ) ( not ( = ?auto_71228 ?auto_71232 ) ) ( not ( = ?auto_71228 ?auto_71230 ) ) ( not ( = ?auto_71231 ?auto_71232 ) ) ( not ( = ?auto_71231 ?auto_71230 ) ) ( not ( = ?auto_71232 ?auto_71230 ) ) ( ON ?auto_71230 ?auto_71229 ) ( CLEAR ?auto_71230 ) ( not ( = ?auto_71226 ?auto_71229 ) ) ( not ( = ?auto_71227 ?auto_71229 ) ) ( not ( = ?auto_71228 ?auto_71229 ) ) ( not ( = ?auto_71231 ?auto_71229 ) ) ( not ( = ?auto_71232 ?auto_71229 ) ) ( not ( = ?auto_71230 ?auto_71229 ) ) ( HOLDING ?auto_71232 ) ( CLEAR ?auto_71231 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71226 ?auto_71227 ?auto_71228 ?auto_71231 ?auto_71232 )
      ( MAKE-3PILE ?auto_71226 ?auto_71227 ?auto_71228 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71233 - BLOCK
      ?auto_71234 - BLOCK
      ?auto_71235 - BLOCK
    )
    :vars
    (
      ?auto_71239 - BLOCK
      ?auto_71236 - BLOCK
      ?auto_71238 - BLOCK
      ?auto_71237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71239 ?auto_71235 ) ( ON-TABLE ?auto_71233 ) ( ON ?auto_71234 ?auto_71233 ) ( ON ?auto_71235 ?auto_71234 ) ( not ( = ?auto_71233 ?auto_71234 ) ) ( not ( = ?auto_71233 ?auto_71235 ) ) ( not ( = ?auto_71233 ?auto_71239 ) ) ( not ( = ?auto_71234 ?auto_71235 ) ) ( not ( = ?auto_71234 ?auto_71239 ) ) ( not ( = ?auto_71235 ?auto_71239 ) ) ( not ( = ?auto_71233 ?auto_71236 ) ) ( not ( = ?auto_71233 ?auto_71238 ) ) ( not ( = ?auto_71234 ?auto_71236 ) ) ( not ( = ?auto_71234 ?auto_71238 ) ) ( not ( = ?auto_71235 ?auto_71236 ) ) ( not ( = ?auto_71235 ?auto_71238 ) ) ( not ( = ?auto_71239 ?auto_71236 ) ) ( not ( = ?auto_71239 ?auto_71238 ) ) ( not ( = ?auto_71236 ?auto_71238 ) ) ( ON ?auto_71238 ?auto_71237 ) ( not ( = ?auto_71233 ?auto_71237 ) ) ( not ( = ?auto_71234 ?auto_71237 ) ) ( not ( = ?auto_71235 ?auto_71237 ) ) ( not ( = ?auto_71239 ?auto_71237 ) ) ( not ( = ?auto_71236 ?auto_71237 ) ) ( not ( = ?auto_71238 ?auto_71237 ) ) ( CLEAR ?auto_71239 ) ( ON ?auto_71236 ?auto_71238 ) ( CLEAR ?auto_71236 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71237 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71237 ?auto_71238 )
      ( MAKE-3PILE ?auto_71233 ?auto_71234 ?auto_71235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71254 - BLOCK
      ?auto_71255 - BLOCK
      ?auto_71256 - BLOCK
    )
    :vars
    (
      ?auto_71259 - BLOCK
      ?auto_71257 - BLOCK
      ?auto_71258 - BLOCK
      ?auto_71260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71254 ) ( ON ?auto_71255 ?auto_71254 ) ( not ( = ?auto_71254 ?auto_71255 ) ) ( not ( = ?auto_71254 ?auto_71256 ) ) ( not ( = ?auto_71254 ?auto_71259 ) ) ( not ( = ?auto_71255 ?auto_71256 ) ) ( not ( = ?auto_71255 ?auto_71259 ) ) ( not ( = ?auto_71256 ?auto_71259 ) ) ( not ( = ?auto_71254 ?auto_71257 ) ) ( not ( = ?auto_71254 ?auto_71258 ) ) ( not ( = ?auto_71255 ?auto_71257 ) ) ( not ( = ?auto_71255 ?auto_71258 ) ) ( not ( = ?auto_71256 ?auto_71257 ) ) ( not ( = ?auto_71256 ?auto_71258 ) ) ( not ( = ?auto_71259 ?auto_71257 ) ) ( not ( = ?auto_71259 ?auto_71258 ) ) ( not ( = ?auto_71257 ?auto_71258 ) ) ( ON ?auto_71258 ?auto_71260 ) ( not ( = ?auto_71254 ?auto_71260 ) ) ( not ( = ?auto_71255 ?auto_71260 ) ) ( not ( = ?auto_71256 ?auto_71260 ) ) ( not ( = ?auto_71259 ?auto_71260 ) ) ( not ( = ?auto_71257 ?auto_71260 ) ) ( not ( = ?auto_71258 ?auto_71260 ) ) ( ON ?auto_71257 ?auto_71258 ) ( ON-TABLE ?auto_71260 ) ( ON ?auto_71259 ?auto_71257 ) ( CLEAR ?auto_71259 ) ( HOLDING ?auto_71256 ) ( CLEAR ?auto_71255 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71254 ?auto_71255 ?auto_71256 ?auto_71259 )
      ( MAKE-3PILE ?auto_71254 ?auto_71255 ?auto_71256 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71261 - BLOCK
      ?auto_71262 - BLOCK
      ?auto_71263 - BLOCK
    )
    :vars
    (
      ?auto_71267 - BLOCK
      ?auto_71265 - BLOCK
      ?auto_71264 - BLOCK
      ?auto_71266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71261 ) ( ON ?auto_71262 ?auto_71261 ) ( not ( = ?auto_71261 ?auto_71262 ) ) ( not ( = ?auto_71261 ?auto_71263 ) ) ( not ( = ?auto_71261 ?auto_71267 ) ) ( not ( = ?auto_71262 ?auto_71263 ) ) ( not ( = ?auto_71262 ?auto_71267 ) ) ( not ( = ?auto_71263 ?auto_71267 ) ) ( not ( = ?auto_71261 ?auto_71265 ) ) ( not ( = ?auto_71261 ?auto_71264 ) ) ( not ( = ?auto_71262 ?auto_71265 ) ) ( not ( = ?auto_71262 ?auto_71264 ) ) ( not ( = ?auto_71263 ?auto_71265 ) ) ( not ( = ?auto_71263 ?auto_71264 ) ) ( not ( = ?auto_71267 ?auto_71265 ) ) ( not ( = ?auto_71267 ?auto_71264 ) ) ( not ( = ?auto_71265 ?auto_71264 ) ) ( ON ?auto_71264 ?auto_71266 ) ( not ( = ?auto_71261 ?auto_71266 ) ) ( not ( = ?auto_71262 ?auto_71266 ) ) ( not ( = ?auto_71263 ?auto_71266 ) ) ( not ( = ?auto_71267 ?auto_71266 ) ) ( not ( = ?auto_71265 ?auto_71266 ) ) ( not ( = ?auto_71264 ?auto_71266 ) ) ( ON ?auto_71265 ?auto_71264 ) ( ON-TABLE ?auto_71266 ) ( ON ?auto_71267 ?auto_71265 ) ( CLEAR ?auto_71262 ) ( ON ?auto_71263 ?auto_71267 ) ( CLEAR ?auto_71263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71266 ?auto_71264 ?auto_71265 ?auto_71267 )
      ( MAKE-3PILE ?auto_71261 ?auto_71262 ?auto_71263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71268 - BLOCK
      ?auto_71269 - BLOCK
      ?auto_71270 - BLOCK
    )
    :vars
    (
      ?auto_71274 - BLOCK
      ?auto_71272 - BLOCK
      ?auto_71271 - BLOCK
      ?auto_71273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71268 ) ( not ( = ?auto_71268 ?auto_71269 ) ) ( not ( = ?auto_71268 ?auto_71270 ) ) ( not ( = ?auto_71268 ?auto_71274 ) ) ( not ( = ?auto_71269 ?auto_71270 ) ) ( not ( = ?auto_71269 ?auto_71274 ) ) ( not ( = ?auto_71270 ?auto_71274 ) ) ( not ( = ?auto_71268 ?auto_71272 ) ) ( not ( = ?auto_71268 ?auto_71271 ) ) ( not ( = ?auto_71269 ?auto_71272 ) ) ( not ( = ?auto_71269 ?auto_71271 ) ) ( not ( = ?auto_71270 ?auto_71272 ) ) ( not ( = ?auto_71270 ?auto_71271 ) ) ( not ( = ?auto_71274 ?auto_71272 ) ) ( not ( = ?auto_71274 ?auto_71271 ) ) ( not ( = ?auto_71272 ?auto_71271 ) ) ( ON ?auto_71271 ?auto_71273 ) ( not ( = ?auto_71268 ?auto_71273 ) ) ( not ( = ?auto_71269 ?auto_71273 ) ) ( not ( = ?auto_71270 ?auto_71273 ) ) ( not ( = ?auto_71274 ?auto_71273 ) ) ( not ( = ?auto_71272 ?auto_71273 ) ) ( not ( = ?auto_71271 ?auto_71273 ) ) ( ON ?auto_71272 ?auto_71271 ) ( ON-TABLE ?auto_71273 ) ( ON ?auto_71274 ?auto_71272 ) ( ON ?auto_71270 ?auto_71274 ) ( CLEAR ?auto_71270 ) ( HOLDING ?auto_71269 ) ( CLEAR ?auto_71268 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71268 ?auto_71269 )
      ( MAKE-3PILE ?auto_71268 ?auto_71269 ?auto_71270 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71275 - BLOCK
      ?auto_71276 - BLOCK
      ?auto_71277 - BLOCK
    )
    :vars
    (
      ?auto_71280 - BLOCK
      ?auto_71279 - BLOCK
      ?auto_71281 - BLOCK
      ?auto_71278 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71275 ) ( not ( = ?auto_71275 ?auto_71276 ) ) ( not ( = ?auto_71275 ?auto_71277 ) ) ( not ( = ?auto_71275 ?auto_71280 ) ) ( not ( = ?auto_71276 ?auto_71277 ) ) ( not ( = ?auto_71276 ?auto_71280 ) ) ( not ( = ?auto_71277 ?auto_71280 ) ) ( not ( = ?auto_71275 ?auto_71279 ) ) ( not ( = ?auto_71275 ?auto_71281 ) ) ( not ( = ?auto_71276 ?auto_71279 ) ) ( not ( = ?auto_71276 ?auto_71281 ) ) ( not ( = ?auto_71277 ?auto_71279 ) ) ( not ( = ?auto_71277 ?auto_71281 ) ) ( not ( = ?auto_71280 ?auto_71279 ) ) ( not ( = ?auto_71280 ?auto_71281 ) ) ( not ( = ?auto_71279 ?auto_71281 ) ) ( ON ?auto_71281 ?auto_71278 ) ( not ( = ?auto_71275 ?auto_71278 ) ) ( not ( = ?auto_71276 ?auto_71278 ) ) ( not ( = ?auto_71277 ?auto_71278 ) ) ( not ( = ?auto_71280 ?auto_71278 ) ) ( not ( = ?auto_71279 ?auto_71278 ) ) ( not ( = ?auto_71281 ?auto_71278 ) ) ( ON ?auto_71279 ?auto_71281 ) ( ON-TABLE ?auto_71278 ) ( ON ?auto_71280 ?auto_71279 ) ( ON ?auto_71277 ?auto_71280 ) ( CLEAR ?auto_71275 ) ( ON ?auto_71276 ?auto_71277 ) ( CLEAR ?auto_71276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71278 ?auto_71281 ?auto_71279 ?auto_71280 ?auto_71277 )
      ( MAKE-3PILE ?auto_71275 ?auto_71276 ?auto_71277 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71282 - BLOCK
      ?auto_71283 - BLOCK
      ?auto_71284 - BLOCK
    )
    :vars
    (
      ?auto_71287 - BLOCK
      ?auto_71285 - BLOCK
      ?auto_71288 - BLOCK
      ?auto_71286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71282 ?auto_71283 ) ) ( not ( = ?auto_71282 ?auto_71284 ) ) ( not ( = ?auto_71282 ?auto_71287 ) ) ( not ( = ?auto_71283 ?auto_71284 ) ) ( not ( = ?auto_71283 ?auto_71287 ) ) ( not ( = ?auto_71284 ?auto_71287 ) ) ( not ( = ?auto_71282 ?auto_71285 ) ) ( not ( = ?auto_71282 ?auto_71288 ) ) ( not ( = ?auto_71283 ?auto_71285 ) ) ( not ( = ?auto_71283 ?auto_71288 ) ) ( not ( = ?auto_71284 ?auto_71285 ) ) ( not ( = ?auto_71284 ?auto_71288 ) ) ( not ( = ?auto_71287 ?auto_71285 ) ) ( not ( = ?auto_71287 ?auto_71288 ) ) ( not ( = ?auto_71285 ?auto_71288 ) ) ( ON ?auto_71288 ?auto_71286 ) ( not ( = ?auto_71282 ?auto_71286 ) ) ( not ( = ?auto_71283 ?auto_71286 ) ) ( not ( = ?auto_71284 ?auto_71286 ) ) ( not ( = ?auto_71287 ?auto_71286 ) ) ( not ( = ?auto_71285 ?auto_71286 ) ) ( not ( = ?auto_71288 ?auto_71286 ) ) ( ON ?auto_71285 ?auto_71288 ) ( ON-TABLE ?auto_71286 ) ( ON ?auto_71287 ?auto_71285 ) ( ON ?auto_71284 ?auto_71287 ) ( ON ?auto_71283 ?auto_71284 ) ( CLEAR ?auto_71283 ) ( HOLDING ?auto_71282 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71282 )
      ( MAKE-3PILE ?auto_71282 ?auto_71283 ?auto_71284 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71289 - BLOCK
      ?auto_71290 - BLOCK
      ?auto_71291 - BLOCK
    )
    :vars
    (
      ?auto_71295 - BLOCK
      ?auto_71292 - BLOCK
      ?auto_71293 - BLOCK
      ?auto_71294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71289 ?auto_71290 ) ) ( not ( = ?auto_71289 ?auto_71291 ) ) ( not ( = ?auto_71289 ?auto_71295 ) ) ( not ( = ?auto_71290 ?auto_71291 ) ) ( not ( = ?auto_71290 ?auto_71295 ) ) ( not ( = ?auto_71291 ?auto_71295 ) ) ( not ( = ?auto_71289 ?auto_71292 ) ) ( not ( = ?auto_71289 ?auto_71293 ) ) ( not ( = ?auto_71290 ?auto_71292 ) ) ( not ( = ?auto_71290 ?auto_71293 ) ) ( not ( = ?auto_71291 ?auto_71292 ) ) ( not ( = ?auto_71291 ?auto_71293 ) ) ( not ( = ?auto_71295 ?auto_71292 ) ) ( not ( = ?auto_71295 ?auto_71293 ) ) ( not ( = ?auto_71292 ?auto_71293 ) ) ( ON ?auto_71293 ?auto_71294 ) ( not ( = ?auto_71289 ?auto_71294 ) ) ( not ( = ?auto_71290 ?auto_71294 ) ) ( not ( = ?auto_71291 ?auto_71294 ) ) ( not ( = ?auto_71295 ?auto_71294 ) ) ( not ( = ?auto_71292 ?auto_71294 ) ) ( not ( = ?auto_71293 ?auto_71294 ) ) ( ON ?auto_71292 ?auto_71293 ) ( ON-TABLE ?auto_71294 ) ( ON ?auto_71295 ?auto_71292 ) ( ON ?auto_71291 ?auto_71295 ) ( ON ?auto_71290 ?auto_71291 ) ( ON ?auto_71289 ?auto_71290 ) ( CLEAR ?auto_71289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71294 ?auto_71293 ?auto_71292 ?auto_71295 ?auto_71291 ?auto_71290 )
      ( MAKE-3PILE ?auto_71289 ?auto_71290 ?auto_71291 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71299 - BLOCK
      ?auto_71300 - BLOCK
      ?auto_71301 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_71301 ) ( CLEAR ?auto_71300 ) ( ON-TABLE ?auto_71299 ) ( ON ?auto_71300 ?auto_71299 ) ( not ( = ?auto_71299 ?auto_71300 ) ) ( not ( = ?auto_71299 ?auto_71301 ) ) ( not ( = ?auto_71300 ?auto_71301 ) ) )
    :subtasks
    ( ( !STACK ?auto_71301 ?auto_71300 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71302 - BLOCK
      ?auto_71303 - BLOCK
      ?auto_71304 - BLOCK
    )
    :vars
    (
      ?auto_71305 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71303 ) ( ON-TABLE ?auto_71302 ) ( ON ?auto_71303 ?auto_71302 ) ( not ( = ?auto_71302 ?auto_71303 ) ) ( not ( = ?auto_71302 ?auto_71304 ) ) ( not ( = ?auto_71303 ?auto_71304 ) ) ( ON ?auto_71304 ?auto_71305 ) ( CLEAR ?auto_71304 ) ( HAND-EMPTY ) ( not ( = ?auto_71302 ?auto_71305 ) ) ( not ( = ?auto_71303 ?auto_71305 ) ) ( not ( = ?auto_71304 ?auto_71305 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71304 ?auto_71305 )
      ( MAKE-3PILE ?auto_71302 ?auto_71303 ?auto_71304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71306 - BLOCK
      ?auto_71307 - BLOCK
      ?auto_71308 - BLOCK
    )
    :vars
    (
      ?auto_71309 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71306 ) ( not ( = ?auto_71306 ?auto_71307 ) ) ( not ( = ?auto_71306 ?auto_71308 ) ) ( not ( = ?auto_71307 ?auto_71308 ) ) ( ON ?auto_71308 ?auto_71309 ) ( CLEAR ?auto_71308 ) ( not ( = ?auto_71306 ?auto_71309 ) ) ( not ( = ?auto_71307 ?auto_71309 ) ) ( not ( = ?auto_71308 ?auto_71309 ) ) ( HOLDING ?auto_71307 ) ( CLEAR ?auto_71306 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71306 ?auto_71307 )
      ( MAKE-3PILE ?auto_71306 ?auto_71307 ?auto_71308 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71310 - BLOCK
      ?auto_71311 - BLOCK
      ?auto_71312 - BLOCK
    )
    :vars
    (
      ?auto_71313 - BLOCK
      ?auto_71315 - BLOCK
      ?auto_71314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71310 ) ( not ( = ?auto_71310 ?auto_71311 ) ) ( not ( = ?auto_71310 ?auto_71312 ) ) ( not ( = ?auto_71311 ?auto_71312 ) ) ( ON ?auto_71312 ?auto_71313 ) ( not ( = ?auto_71310 ?auto_71313 ) ) ( not ( = ?auto_71311 ?auto_71313 ) ) ( not ( = ?auto_71312 ?auto_71313 ) ) ( CLEAR ?auto_71310 ) ( ON ?auto_71311 ?auto_71312 ) ( CLEAR ?auto_71311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71315 ) ( ON ?auto_71314 ?auto_71315 ) ( ON ?auto_71313 ?auto_71314 ) ( not ( = ?auto_71315 ?auto_71314 ) ) ( not ( = ?auto_71315 ?auto_71313 ) ) ( not ( = ?auto_71315 ?auto_71312 ) ) ( not ( = ?auto_71315 ?auto_71311 ) ) ( not ( = ?auto_71314 ?auto_71313 ) ) ( not ( = ?auto_71314 ?auto_71312 ) ) ( not ( = ?auto_71314 ?auto_71311 ) ) ( not ( = ?auto_71310 ?auto_71315 ) ) ( not ( = ?auto_71310 ?auto_71314 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71315 ?auto_71314 ?auto_71313 ?auto_71312 )
      ( MAKE-3PILE ?auto_71310 ?auto_71311 ?auto_71312 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71316 - BLOCK
      ?auto_71317 - BLOCK
      ?auto_71318 - BLOCK
    )
    :vars
    (
      ?auto_71321 - BLOCK
      ?auto_71319 - BLOCK
      ?auto_71320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71316 ?auto_71317 ) ) ( not ( = ?auto_71316 ?auto_71318 ) ) ( not ( = ?auto_71317 ?auto_71318 ) ) ( ON ?auto_71318 ?auto_71321 ) ( not ( = ?auto_71316 ?auto_71321 ) ) ( not ( = ?auto_71317 ?auto_71321 ) ) ( not ( = ?auto_71318 ?auto_71321 ) ) ( ON ?auto_71317 ?auto_71318 ) ( CLEAR ?auto_71317 ) ( ON-TABLE ?auto_71319 ) ( ON ?auto_71320 ?auto_71319 ) ( ON ?auto_71321 ?auto_71320 ) ( not ( = ?auto_71319 ?auto_71320 ) ) ( not ( = ?auto_71319 ?auto_71321 ) ) ( not ( = ?auto_71319 ?auto_71318 ) ) ( not ( = ?auto_71319 ?auto_71317 ) ) ( not ( = ?auto_71320 ?auto_71321 ) ) ( not ( = ?auto_71320 ?auto_71318 ) ) ( not ( = ?auto_71320 ?auto_71317 ) ) ( not ( = ?auto_71316 ?auto_71319 ) ) ( not ( = ?auto_71316 ?auto_71320 ) ) ( HOLDING ?auto_71316 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71316 )
      ( MAKE-3PILE ?auto_71316 ?auto_71317 ?auto_71318 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71322 - BLOCK
      ?auto_71323 - BLOCK
      ?auto_71324 - BLOCK
    )
    :vars
    (
      ?auto_71327 - BLOCK
      ?auto_71325 - BLOCK
      ?auto_71326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71322 ?auto_71323 ) ) ( not ( = ?auto_71322 ?auto_71324 ) ) ( not ( = ?auto_71323 ?auto_71324 ) ) ( ON ?auto_71324 ?auto_71327 ) ( not ( = ?auto_71322 ?auto_71327 ) ) ( not ( = ?auto_71323 ?auto_71327 ) ) ( not ( = ?auto_71324 ?auto_71327 ) ) ( ON ?auto_71323 ?auto_71324 ) ( ON-TABLE ?auto_71325 ) ( ON ?auto_71326 ?auto_71325 ) ( ON ?auto_71327 ?auto_71326 ) ( not ( = ?auto_71325 ?auto_71326 ) ) ( not ( = ?auto_71325 ?auto_71327 ) ) ( not ( = ?auto_71325 ?auto_71324 ) ) ( not ( = ?auto_71325 ?auto_71323 ) ) ( not ( = ?auto_71326 ?auto_71327 ) ) ( not ( = ?auto_71326 ?auto_71324 ) ) ( not ( = ?auto_71326 ?auto_71323 ) ) ( not ( = ?auto_71322 ?auto_71325 ) ) ( not ( = ?auto_71322 ?auto_71326 ) ) ( ON ?auto_71322 ?auto_71323 ) ( CLEAR ?auto_71322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71325 ?auto_71326 ?auto_71327 ?auto_71324 ?auto_71323 )
      ( MAKE-3PILE ?auto_71322 ?auto_71323 ?auto_71324 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71328 - BLOCK
      ?auto_71329 - BLOCK
      ?auto_71330 - BLOCK
    )
    :vars
    (
      ?auto_71331 - BLOCK
      ?auto_71333 - BLOCK
      ?auto_71332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71328 ?auto_71329 ) ) ( not ( = ?auto_71328 ?auto_71330 ) ) ( not ( = ?auto_71329 ?auto_71330 ) ) ( ON ?auto_71330 ?auto_71331 ) ( not ( = ?auto_71328 ?auto_71331 ) ) ( not ( = ?auto_71329 ?auto_71331 ) ) ( not ( = ?auto_71330 ?auto_71331 ) ) ( ON ?auto_71329 ?auto_71330 ) ( ON-TABLE ?auto_71333 ) ( ON ?auto_71332 ?auto_71333 ) ( ON ?auto_71331 ?auto_71332 ) ( not ( = ?auto_71333 ?auto_71332 ) ) ( not ( = ?auto_71333 ?auto_71331 ) ) ( not ( = ?auto_71333 ?auto_71330 ) ) ( not ( = ?auto_71333 ?auto_71329 ) ) ( not ( = ?auto_71332 ?auto_71331 ) ) ( not ( = ?auto_71332 ?auto_71330 ) ) ( not ( = ?auto_71332 ?auto_71329 ) ) ( not ( = ?auto_71328 ?auto_71333 ) ) ( not ( = ?auto_71328 ?auto_71332 ) ) ( HOLDING ?auto_71328 ) ( CLEAR ?auto_71329 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71333 ?auto_71332 ?auto_71331 ?auto_71330 ?auto_71329 ?auto_71328 )
      ( MAKE-3PILE ?auto_71328 ?auto_71329 ?auto_71330 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71334 - BLOCK
      ?auto_71335 - BLOCK
      ?auto_71336 - BLOCK
    )
    :vars
    (
      ?auto_71339 - BLOCK
      ?auto_71337 - BLOCK
      ?auto_71338 - BLOCK
      ?auto_71340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71334 ?auto_71335 ) ) ( not ( = ?auto_71334 ?auto_71336 ) ) ( not ( = ?auto_71335 ?auto_71336 ) ) ( ON ?auto_71336 ?auto_71339 ) ( not ( = ?auto_71334 ?auto_71339 ) ) ( not ( = ?auto_71335 ?auto_71339 ) ) ( not ( = ?auto_71336 ?auto_71339 ) ) ( ON ?auto_71335 ?auto_71336 ) ( ON-TABLE ?auto_71337 ) ( ON ?auto_71338 ?auto_71337 ) ( ON ?auto_71339 ?auto_71338 ) ( not ( = ?auto_71337 ?auto_71338 ) ) ( not ( = ?auto_71337 ?auto_71339 ) ) ( not ( = ?auto_71337 ?auto_71336 ) ) ( not ( = ?auto_71337 ?auto_71335 ) ) ( not ( = ?auto_71338 ?auto_71339 ) ) ( not ( = ?auto_71338 ?auto_71336 ) ) ( not ( = ?auto_71338 ?auto_71335 ) ) ( not ( = ?auto_71334 ?auto_71337 ) ) ( not ( = ?auto_71334 ?auto_71338 ) ) ( CLEAR ?auto_71335 ) ( ON ?auto_71334 ?auto_71340 ) ( CLEAR ?auto_71334 ) ( HAND-EMPTY ) ( not ( = ?auto_71334 ?auto_71340 ) ) ( not ( = ?auto_71335 ?auto_71340 ) ) ( not ( = ?auto_71336 ?auto_71340 ) ) ( not ( = ?auto_71339 ?auto_71340 ) ) ( not ( = ?auto_71337 ?auto_71340 ) ) ( not ( = ?auto_71338 ?auto_71340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71334 ?auto_71340 )
      ( MAKE-3PILE ?auto_71334 ?auto_71335 ?auto_71336 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71341 - BLOCK
      ?auto_71342 - BLOCK
      ?auto_71343 - BLOCK
    )
    :vars
    (
      ?auto_71345 - BLOCK
      ?auto_71344 - BLOCK
      ?auto_71346 - BLOCK
      ?auto_71347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71341 ?auto_71342 ) ) ( not ( = ?auto_71341 ?auto_71343 ) ) ( not ( = ?auto_71342 ?auto_71343 ) ) ( ON ?auto_71343 ?auto_71345 ) ( not ( = ?auto_71341 ?auto_71345 ) ) ( not ( = ?auto_71342 ?auto_71345 ) ) ( not ( = ?auto_71343 ?auto_71345 ) ) ( ON-TABLE ?auto_71344 ) ( ON ?auto_71346 ?auto_71344 ) ( ON ?auto_71345 ?auto_71346 ) ( not ( = ?auto_71344 ?auto_71346 ) ) ( not ( = ?auto_71344 ?auto_71345 ) ) ( not ( = ?auto_71344 ?auto_71343 ) ) ( not ( = ?auto_71344 ?auto_71342 ) ) ( not ( = ?auto_71346 ?auto_71345 ) ) ( not ( = ?auto_71346 ?auto_71343 ) ) ( not ( = ?auto_71346 ?auto_71342 ) ) ( not ( = ?auto_71341 ?auto_71344 ) ) ( not ( = ?auto_71341 ?auto_71346 ) ) ( ON ?auto_71341 ?auto_71347 ) ( CLEAR ?auto_71341 ) ( not ( = ?auto_71341 ?auto_71347 ) ) ( not ( = ?auto_71342 ?auto_71347 ) ) ( not ( = ?auto_71343 ?auto_71347 ) ) ( not ( = ?auto_71345 ?auto_71347 ) ) ( not ( = ?auto_71344 ?auto_71347 ) ) ( not ( = ?auto_71346 ?auto_71347 ) ) ( HOLDING ?auto_71342 ) ( CLEAR ?auto_71343 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71344 ?auto_71346 ?auto_71345 ?auto_71343 ?auto_71342 )
      ( MAKE-3PILE ?auto_71341 ?auto_71342 ?auto_71343 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71348 - BLOCK
      ?auto_71349 - BLOCK
      ?auto_71350 - BLOCK
    )
    :vars
    (
      ?auto_71351 - BLOCK
      ?auto_71353 - BLOCK
      ?auto_71354 - BLOCK
      ?auto_71352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71348 ?auto_71349 ) ) ( not ( = ?auto_71348 ?auto_71350 ) ) ( not ( = ?auto_71349 ?auto_71350 ) ) ( ON ?auto_71350 ?auto_71351 ) ( not ( = ?auto_71348 ?auto_71351 ) ) ( not ( = ?auto_71349 ?auto_71351 ) ) ( not ( = ?auto_71350 ?auto_71351 ) ) ( ON-TABLE ?auto_71353 ) ( ON ?auto_71354 ?auto_71353 ) ( ON ?auto_71351 ?auto_71354 ) ( not ( = ?auto_71353 ?auto_71354 ) ) ( not ( = ?auto_71353 ?auto_71351 ) ) ( not ( = ?auto_71353 ?auto_71350 ) ) ( not ( = ?auto_71353 ?auto_71349 ) ) ( not ( = ?auto_71354 ?auto_71351 ) ) ( not ( = ?auto_71354 ?auto_71350 ) ) ( not ( = ?auto_71354 ?auto_71349 ) ) ( not ( = ?auto_71348 ?auto_71353 ) ) ( not ( = ?auto_71348 ?auto_71354 ) ) ( ON ?auto_71348 ?auto_71352 ) ( not ( = ?auto_71348 ?auto_71352 ) ) ( not ( = ?auto_71349 ?auto_71352 ) ) ( not ( = ?auto_71350 ?auto_71352 ) ) ( not ( = ?auto_71351 ?auto_71352 ) ) ( not ( = ?auto_71353 ?auto_71352 ) ) ( not ( = ?auto_71354 ?auto_71352 ) ) ( CLEAR ?auto_71350 ) ( ON ?auto_71349 ?auto_71348 ) ( CLEAR ?auto_71349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71352 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71352 ?auto_71348 )
      ( MAKE-3PILE ?auto_71348 ?auto_71349 ?auto_71350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71355 - BLOCK
      ?auto_71356 - BLOCK
      ?auto_71357 - BLOCK
    )
    :vars
    (
      ?auto_71360 - BLOCK
      ?auto_71361 - BLOCK
      ?auto_71359 - BLOCK
      ?auto_71358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71355 ?auto_71356 ) ) ( not ( = ?auto_71355 ?auto_71357 ) ) ( not ( = ?auto_71356 ?auto_71357 ) ) ( not ( = ?auto_71355 ?auto_71360 ) ) ( not ( = ?auto_71356 ?auto_71360 ) ) ( not ( = ?auto_71357 ?auto_71360 ) ) ( ON-TABLE ?auto_71361 ) ( ON ?auto_71359 ?auto_71361 ) ( ON ?auto_71360 ?auto_71359 ) ( not ( = ?auto_71361 ?auto_71359 ) ) ( not ( = ?auto_71361 ?auto_71360 ) ) ( not ( = ?auto_71361 ?auto_71357 ) ) ( not ( = ?auto_71361 ?auto_71356 ) ) ( not ( = ?auto_71359 ?auto_71360 ) ) ( not ( = ?auto_71359 ?auto_71357 ) ) ( not ( = ?auto_71359 ?auto_71356 ) ) ( not ( = ?auto_71355 ?auto_71361 ) ) ( not ( = ?auto_71355 ?auto_71359 ) ) ( ON ?auto_71355 ?auto_71358 ) ( not ( = ?auto_71355 ?auto_71358 ) ) ( not ( = ?auto_71356 ?auto_71358 ) ) ( not ( = ?auto_71357 ?auto_71358 ) ) ( not ( = ?auto_71360 ?auto_71358 ) ) ( not ( = ?auto_71361 ?auto_71358 ) ) ( not ( = ?auto_71359 ?auto_71358 ) ) ( ON ?auto_71356 ?auto_71355 ) ( CLEAR ?auto_71356 ) ( ON-TABLE ?auto_71358 ) ( HOLDING ?auto_71357 ) ( CLEAR ?auto_71360 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71361 ?auto_71359 ?auto_71360 ?auto_71357 )
      ( MAKE-3PILE ?auto_71355 ?auto_71356 ?auto_71357 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71362 - BLOCK
      ?auto_71363 - BLOCK
      ?auto_71364 - BLOCK
    )
    :vars
    (
      ?auto_71365 - BLOCK
      ?auto_71367 - BLOCK
      ?auto_71368 - BLOCK
      ?auto_71366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71362 ?auto_71363 ) ) ( not ( = ?auto_71362 ?auto_71364 ) ) ( not ( = ?auto_71363 ?auto_71364 ) ) ( not ( = ?auto_71362 ?auto_71365 ) ) ( not ( = ?auto_71363 ?auto_71365 ) ) ( not ( = ?auto_71364 ?auto_71365 ) ) ( ON-TABLE ?auto_71367 ) ( ON ?auto_71368 ?auto_71367 ) ( ON ?auto_71365 ?auto_71368 ) ( not ( = ?auto_71367 ?auto_71368 ) ) ( not ( = ?auto_71367 ?auto_71365 ) ) ( not ( = ?auto_71367 ?auto_71364 ) ) ( not ( = ?auto_71367 ?auto_71363 ) ) ( not ( = ?auto_71368 ?auto_71365 ) ) ( not ( = ?auto_71368 ?auto_71364 ) ) ( not ( = ?auto_71368 ?auto_71363 ) ) ( not ( = ?auto_71362 ?auto_71367 ) ) ( not ( = ?auto_71362 ?auto_71368 ) ) ( ON ?auto_71362 ?auto_71366 ) ( not ( = ?auto_71362 ?auto_71366 ) ) ( not ( = ?auto_71363 ?auto_71366 ) ) ( not ( = ?auto_71364 ?auto_71366 ) ) ( not ( = ?auto_71365 ?auto_71366 ) ) ( not ( = ?auto_71367 ?auto_71366 ) ) ( not ( = ?auto_71368 ?auto_71366 ) ) ( ON ?auto_71363 ?auto_71362 ) ( ON-TABLE ?auto_71366 ) ( CLEAR ?auto_71365 ) ( ON ?auto_71364 ?auto_71363 ) ( CLEAR ?auto_71364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71366 ?auto_71362 ?auto_71363 )
      ( MAKE-3PILE ?auto_71362 ?auto_71363 ?auto_71364 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71369 - BLOCK
      ?auto_71370 - BLOCK
      ?auto_71371 - BLOCK
    )
    :vars
    (
      ?auto_71374 - BLOCK
      ?auto_71372 - BLOCK
      ?auto_71373 - BLOCK
      ?auto_71375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71369 ?auto_71370 ) ) ( not ( = ?auto_71369 ?auto_71371 ) ) ( not ( = ?auto_71370 ?auto_71371 ) ) ( not ( = ?auto_71369 ?auto_71374 ) ) ( not ( = ?auto_71370 ?auto_71374 ) ) ( not ( = ?auto_71371 ?auto_71374 ) ) ( ON-TABLE ?auto_71372 ) ( ON ?auto_71373 ?auto_71372 ) ( not ( = ?auto_71372 ?auto_71373 ) ) ( not ( = ?auto_71372 ?auto_71374 ) ) ( not ( = ?auto_71372 ?auto_71371 ) ) ( not ( = ?auto_71372 ?auto_71370 ) ) ( not ( = ?auto_71373 ?auto_71374 ) ) ( not ( = ?auto_71373 ?auto_71371 ) ) ( not ( = ?auto_71373 ?auto_71370 ) ) ( not ( = ?auto_71369 ?auto_71372 ) ) ( not ( = ?auto_71369 ?auto_71373 ) ) ( ON ?auto_71369 ?auto_71375 ) ( not ( = ?auto_71369 ?auto_71375 ) ) ( not ( = ?auto_71370 ?auto_71375 ) ) ( not ( = ?auto_71371 ?auto_71375 ) ) ( not ( = ?auto_71374 ?auto_71375 ) ) ( not ( = ?auto_71372 ?auto_71375 ) ) ( not ( = ?auto_71373 ?auto_71375 ) ) ( ON ?auto_71370 ?auto_71369 ) ( ON-TABLE ?auto_71375 ) ( ON ?auto_71371 ?auto_71370 ) ( CLEAR ?auto_71371 ) ( HOLDING ?auto_71374 ) ( CLEAR ?auto_71373 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71372 ?auto_71373 ?auto_71374 )
      ( MAKE-3PILE ?auto_71369 ?auto_71370 ?auto_71371 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71376 - BLOCK
      ?auto_71377 - BLOCK
      ?auto_71378 - BLOCK
    )
    :vars
    (
      ?auto_71380 - BLOCK
      ?auto_71382 - BLOCK
      ?auto_71379 - BLOCK
      ?auto_71381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71376 ?auto_71377 ) ) ( not ( = ?auto_71376 ?auto_71378 ) ) ( not ( = ?auto_71377 ?auto_71378 ) ) ( not ( = ?auto_71376 ?auto_71380 ) ) ( not ( = ?auto_71377 ?auto_71380 ) ) ( not ( = ?auto_71378 ?auto_71380 ) ) ( ON-TABLE ?auto_71382 ) ( ON ?auto_71379 ?auto_71382 ) ( not ( = ?auto_71382 ?auto_71379 ) ) ( not ( = ?auto_71382 ?auto_71380 ) ) ( not ( = ?auto_71382 ?auto_71378 ) ) ( not ( = ?auto_71382 ?auto_71377 ) ) ( not ( = ?auto_71379 ?auto_71380 ) ) ( not ( = ?auto_71379 ?auto_71378 ) ) ( not ( = ?auto_71379 ?auto_71377 ) ) ( not ( = ?auto_71376 ?auto_71382 ) ) ( not ( = ?auto_71376 ?auto_71379 ) ) ( ON ?auto_71376 ?auto_71381 ) ( not ( = ?auto_71376 ?auto_71381 ) ) ( not ( = ?auto_71377 ?auto_71381 ) ) ( not ( = ?auto_71378 ?auto_71381 ) ) ( not ( = ?auto_71380 ?auto_71381 ) ) ( not ( = ?auto_71382 ?auto_71381 ) ) ( not ( = ?auto_71379 ?auto_71381 ) ) ( ON ?auto_71377 ?auto_71376 ) ( ON-TABLE ?auto_71381 ) ( ON ?auto_71378 ?auto_71377 ) ( CLEAR ?auto_71379 ) ( ON ?auto_71380 ?auto_71378 ) ( CLEAR ?auto_71380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71381 ?auto_71376 ?auto_71377 ?auto_71378 )
      ( MAKE-3PILE ?auto_71376 ?auto_71377 ?auto_71378 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71383 - BLOCK
      ?auto_71384 - BLOCK
      ?auto_71385 - BLOCK
    )
    :vars
    (
      ?auto_71387 - BLOCK
      ?auto_71386 - BLOCK
      ?auto_71388 - BLOCK
      ?auto_71389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71383 ?auto_71384 ) ) ( not ( = ?auto_71383 ?auto_71385 ) ) ( not ( = ?auto_71384 ?auto_71385 ) ) ( not ( = ?auto_71383 ?auto_71387 ) ) ( not ( = ?auto_71384 ?auto_71387 ) ) ( not ( = ?auto_71385 ?auto_71387 ) ) ( ON-TABLE ?auto_71386 ) ( not ( = ?auto_71386 ?auto_71388 ) ) ( not ( = ?auto_71386 ?auto_71387 ) ) ( not ( = ?auto_71386 ?auto_71385 ) ) ( not ( = ?auto_71386 ?auto_71384 ) ) ( not ( = ?auto_71388 ?auto_71387 ) ) ( not ( = ?auto_71388 ?auto_71385 ) ) ( not ( = ?auto_71388 ?auto_71384 ) ) ( not ( = ?auto_71383 ?auto_71386 ) ) ( not ( = ?auto_71383 ?auto_71388 ) ) ( ON ?auto_71383 ?auto_71389 ) ( not ( = ?auto_71383 ?auto_71389 ) ) ( not ( = ?auto_71384 ?auto_71389 ) ) ( not ( = ?auto_71385 ?auto_71389 ) ) ( not ( = ?auto_71387 ?auto_71389 ) ) ( not ( = ?auto_71386 ?auto_71389 ) ) ( not ( = ?auto_71388 ?auto_71389 ) ) ( ON ?auto_71384 ?auto_71383 ) ( ON-TABLE ?auto_71389 ) ( ON ?auto_71385 ?auto_71384 ) ( ON ?auto_71387 ?auto_71385 ) ( CLEAR ?auto_71387 ) ( HOLDING ?auto_71388 ) ( CLEAR ?auto_71386 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71386 ?auto_71388 )
      ( MAKE-3PILE ?auto_71383 ?auto_71384 ?auto_71385 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71390 - BLOCK
      ?auto_71391 - BLOCK
      ?auto_71392 - BLOCK
    )
    :vars
    (
      ?auto_71394 - BLOCK
      ?auto_71396 - BLOCK
      ?auto_71393 - BLOCK
      ?auto_71395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71390 ?auto_71391 ) ) ( not ( = ?auto_71390 ?auto_71392 ) ) ( not ( = ?auto_71391 ?auto_71392 ) ) ( not ( = ?auto_71390 ?auto_71394 ) ) ( not ( = ?auto_71391 ?auto_71394 ) ) ( not ( = ?auto_71392 ?auto_71394 ) ) ( ON-TABLE ?auto_71396 ) ( not ( = ?auto_71396 ?auto_71393 ) ) ( not ( = ?auto_71396 ?auto_71394 ) ) ( not ( = ?auto_71396 ?auto_71392 ) ) ( not ( = ?auto_71396 ?auto_71391 ) ) ( not ( = ?auto_71393 ?auto_71394 ) ) ( not ( = ?auto_71393 ?auto_71392 ) ) ( not ( = ?auto_71393 ?auto_71391 ) ) ( not ( = ?auto_71390 ?auto_71396 ) ) ( not ( = ?auto_71390 ?auto_71393 ) ) ( ON ?auto_71390 ?auto_71395 ) ( not ( = ?auto_71390 ?auto_71395 ) ) ( not ( = ?auto_71391 ?auto_71395 ) ) ( not ( = ?auto_71392 ?auto_71395 ) ) ( not ( = ?auto_71394 ?auto_71395 ) ) ( not ( = ?auto_71396 ?auto_71395 ) ) ( not ( = ?auto_71393 ?auto_71395 ) ) ( ON ?auto_71391 ?auto_71390 ) ( ON-TABLE ?auto_71395 ) ( ON ?auto_71392 ?auto_71391 ) ( ON ?auto_71394 ?auto_71392 ) ( CLEAR ?auto_71396 ) ( ON ?auto_71393 ?auto_71394 ) ( CLEAR ?auto_71393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71395 ?auto_71390 ?auto_71391 ?auto_71392 ?auto_71394 )
      ( MAKE-3PILE ?auto_71390 ?auto_71391 ?auto_71392 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71397 - BLOCK
      ?auto_71398 - BLOCK
      ?auto_71399 - BLOCK
    )
    :vars
    (
      ?auto_71400 - BLOCK
      ?auto_71402 - BLOCK
      ?auto_71401 - BLOCK
      ?auto_71403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71397 ?auto_71398 ) ) ( not ( = ?auto_71397 ?auto_71399 ) ) ( not ( = ?auto_71398 ?auto_71399 ) ) ( not ( = ?auto_71397 ?auto_71400 ) ) ( not ( = ?auto_71398 ?auto_71400 ) ) ( not ( = ?auto_71399 ?auto_71400 ) ) ( not ( = ?auto_71402 ?auto_71401 ) ) ( not ( = ?auto_71402 ?auto_71400 ) ) ( not ( = ?auto_71402 ?auto_71399 ) ) ( not ( = ?auto_71402 ?auto_71398 ) ) ( not ( = ?auto_71401 ?auto_71400 ) ) ( not ( = ?auto_71401 ?auto_71399 ) ) ( not ( = ?auto_71401 ?auto_71398 ) ) ( not ( = ?auto_71397 ?auto_71402 ) ) ( not ( = ?auto_71397 ?auto_71401 ) ) ( ON ?auto_71397 ?auto_71403 ) ( not ( = ?auto_71397 ?auto_71403 ) ) ( not ( = ?auto_71398 ?auto_71403 ) ) ( not ( = ?auto_71399 ?auto_71403 ) ) ( not ( = ?auto_71400 ?auto_71403 ) ) ( not ( = ?auto_71402 ?auto_71403 ) ) ( not ( = ?auto_71401 ?auto_71403 ) ) ( ON ?auto_71398 ?auto_71397 ) ( ON-TABLE ?auto_71403 ) ( ON ?auto_71399 ?auto_71398 ) ( ON ?auto_71400 ?auto_71399 ) ( ON ?auto_71401 ?auto_71400 ) ( CLEAR ?auto_71401 ) ( HOLDING ?auto_71402 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71402 )
      ( MAKE-3PILE ?auto_71397 ?auto_71398 ?auto_71399 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71404 - BLOCK
      ?auto_71405 - BLOCK
      ?auto_71406 - BLOCK
    )
    :vars
    (
      ?auto_71407 - BLOCK
      ?auto_71409 - BLOCK
      ?auto_71410 - BLOCK
      ?auto_71408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71404 ?auto_71405 ) ) ( not ( = ?auto_71404 ?auto_71406 ) ) ( not ( = ?auto_71405 ?auto_71406 ) ) ( not ( = ?auto_71404 ?auto_71407 ) ) ( not ( = ?auto_71405 ?auto_71407 ) ) ( not ( = ?auto_71406 ?auto_71407 ) ) ( not ( = ?auto_71409 ?auto_71410 ) ) ( not ( = ?auto_71409 ?auto_71407 ) ) ( not ( = ?auto_71409 ?auto_71406 ) ) ( not ( = ?auto_71409 ?auto_71405 ) ) ( not ( = ?auto_71410 ?auto_71407 ) ) ( not ( = ?auto_71410 ?auto_71406 ) ) ( not ( = ?auto_71410 ?auto_71405 ) ) ( not ( = ?auto_71404 ?auto_71409 ) ) ( not ( = ?auto_71404 ?auto_71410 ) ) ( ON ?auto_71404 ?auto_71408 ) ( not ( = ?auto_71404 ?auto_71408 ) ) ( not ( = ?auto_71405 ?auto_71408 ) ) ( not ( = ?auto_71406 ?auto_71408 ) ) ( not ( = ?auto_71407 ?auto_71408 ) ) ( not ( = ?auto_71409 ?auto_71408 ) ) ( not ( = ?auto_71410 ?auto_71408 ) ) ( ON ?auto_71405 ?auto_71404 ) ( ON-TABLE ?auto_71408 ) ( ON ?auto_71406 ?auto_71405 ) ( ON ?auto_71407 ?auto_71406 ) ( ON ?auto_71410 ?auto_71407 ) ( ON ?auto_71409 ?auto_71410 ) ( CLEAR ?auto_71409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71408 ?auto_71404 ?auto_71405 ?auto_71406 ?auto_71407 ?auto_71410 )
      ( MAKE-3PILE ?auto_71404 ?auto_71405 ?auto_71406 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71413 - BLOCK
      ?auto_71414 - BLOCK
    )
    :vars
    (
      ?auto_71415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71415 ?auto_71414 ) ( CLEAR ?auto_71415 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71413 ) ( ON ?auto_71414 ?auto_71413 ) ( not ( = ?auto_71413 ?auto_71414 ) ) ( not ( = ?auto_71413 ?auto_71415 ) ) ( not ( = ?auto_71414 ?auto_71415 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71415 ?auto_71414 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71416 - BLOCK
      ?auto_71417 - BLOCK
    )
    :vars
    (
      ?auto_71418 - BLOCK
      ?auto_71419 - BLOCK
      ?auto_71420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71418 ?auto_71417 ) ( CLEAR ?auto_71418 ) ( ON-TABLE ?auto_71416 ) ( ON ?auto_71417 ?auto_71416 ) ( not ( = ?auto_71416 ?auto_71417 ) ) ( not ( = ?auto_71416 ?auto_71418 ) ) ( not ( = ?auto_71417 ?auto_71418 ) ) ( HOLDING ?auto_71419 ) ( CLEAR ?auto_71420 ) ( not ( = ?auto_71416 ?auto_71419 ) ) ( not ( = ?auto_71416 ?auto_71420 ) ) ( not ( = ?auto_71417 ?auto_71419 ) ) ( not ( = ?auto_71417 ?auto_71420 ) ) ( not ( = ?auto_71418 ?auto_71419 ) ) ( not ( = ?auto_71418 ?auto_71420 ) ) ( not ( = ?auto_71419 ?auto_71420 ) ) )
    :subtasks
    ( ( !STACK ?auto_71419 ?auto_71420 )
      ( MAKE-2PILE ?auto_71416 ?auto_71417 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71421 - BLOCK
      ?auto_71422 - BLOCK
    )
    :vars
    (
      ?auto_71424 - BLOCK
      ?auto_71423 - BLOCK
      ?auto_71425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71424 ?auto_71422 ) ( ON-TABLE ?auto_71421 ) ( ON ?auto_71422 ?auto_71421 ) ( not ( = ?auto_71421 ?auto_71422 ) ) ( not ( = ?auto_71421 ?auto_71424 ) ) ( not ( = ?auto_71422 ?auto_71424 ) ) ( CLEAR ?auto_71423 ) ( not ( = ?auto_71421 ?auto_71425 ) ) ( not ( = ?auto_71421 ?auto_71423 ) ) ( not ( = ?auto_71422 ?auto_71425 ) ) ( not ( = ?auto_71422 ?auto_71423 ) ) ( not ( = ?auto_71424 ?auto_71425 ) ) ( not ( = ?auto_71424 ?auto_71423 ) ) ( not ( = ?auto_71425 ?auto_71423 ) ) ( ON ?auto_71425 ?auto_71424 ) ( CLEAR ?auto_71425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71421 ?auto_71422 ?auto_71424 )
      ( MAKE-2PILE ?auto_71421 ?auto_71422 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71426 - BLOCK
      ?auto_71427 - BLOCK
    )
    :vars
    (
      ?auto_71430 - BLOCK
      ?auto_71428 - BLOCK
      ?auto_71429 - BLOCK
      ?auto_71431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71430 ?auto_71427 ) ( ON-TABLE ?auto_71426 ) ( ON ?auto_71427 ?auto_71426 ) ( not ( = ?auto_71426 ?auto_71427 ) ) ( not ( = ?auto_71426 ?auto_71430 ) ) ( not ( = ?auto_71427 ?auto_71430 ) ) ( not ( = ?auto_71426 ?auto_71428 ) ) ( not ( = ?auto_71426 ?auto_71429 ) ) ( not ( = ?auto_71427 ?auto_71428 ) ) ( not ( = ?auto_71427 ?auto_71429 ) ) ( not ( = ?auto_71430 ?auto_71428 ) ) ( not ( = ?auto_71430 ?auto_71429 ) ) ( not ( = ?auto_71428 ?auto_71429 ) ) ( ON ?auto_71428 ?auto_71430 ) ( CLEAR ?auto_71428 ) ( HOLDING ?auto_71429 ) ( CLEAR ?auto_71431 ) ( ON-TABLE ?auto_71431 ) ( not ( = ?auto_71431 ?auto_71429 ) ) ( not ( = ?auto_71426 ?auto_71431 ) ) ( not ( = ?auto_71427 ?auto_71431 ) ) ( not ( = ?auto_71430 ?auto_71431 ) ) ( not ( = ?auto_71428 ?auto_71431 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71431 ?auto_71429 )
      ( MAKE-2PILE ?auto_71426 ?auto_71427 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71432 - BLOCK
      ?auto_71433 - BLOCK
    )
    :vars
    (
      ?auto_71435 - BLOCK
      ?auto_71434 - BLOCK
      ?auto_71437 - BLOCK
      ?auto_71436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71435 ?auto_71433 ) ( ON-TABLE ?auto_71432 ) ( ON ?auto_71433 ?auto_71432 ) ( not ( = ?auto_71432 ?auto_71433 ) ) ( not ( = ?auto_71432 ?auto_71435 ) ) ( not ( = ?auto_71433 ?auto_71435 ) ) ( not ( = ?auto_71432 ?auto_71434 ) ) ( not ( = ?auto_71432 ?auto_71437 ) ) ( not ( = ?auto_71433 ?auto_71434 ) ) ( not ( = ?auto_71433 ?auto_71437 ) ) ( not ( = ?auto_71435 ?auto_71434 ) ) ( not ( = ?auto_71435 ?auto_71437 ) ) ( not ( = ?auto_71434 ?auto_71437 ) ) ( ON ?auto_71434 ?auto_71435 ) ( CLEAR ?auto_71436 ) ( ON-TABLE ?auto_71436 ) ( not ( = ?auto_71436 ?auto_71437 ) ) ( not ( = ?auto_71432 ?auto_71436 ) ) ( not ( = ?auto_71433 ?auto_71436 ) ) ( not ( = ?auto_71435 ?auto_71436 ) ) ( not ( = ?auto_71434 ?auto_71436 ) ) ( ON ?auto_71437 ?auto_71434 ) ( CLEAR ?auto_71437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71432 ?auto_71433 ?auto_71435 ?auto_71434 )
      ( MAKE-2PILE ?auto_71432 ?auto_71433 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71438 - BLOCK
      ?auto_71439 - BLOCK
    )
    :vars
    (
      ?auto_71442 - BLOCK
      ?auto_71440 - BLOCK
      ?auto_71441 - BLOCK
      ?auto_71443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71442 ?auto_71439 ) ( ON-TABLE ?auto_71438 ) ( ON ?auto_71439 ?auto_71438 ) ( not ( = ?auto_71438 ?auto_71439 ) ) ( not ( = ?auto_71438 ?auto_71442 ) ) ( not ( = ?auto_71439 ?auto_71442 ) ) ( not ( = ?auto_71438 ?auto_71440 ) ) ( not ( = ?auto_71438 ?auto_71441 ) ) ( not ( = ?auto_71439 ?auto_71440 ) ) ( not ( = ?auto_71439 ?auto_71441 ) ) ( not ( = ?auto_71442 ?auto_71440 ) ) ( not ( = ?auto_71442 ?auto_71441 ) ) ( not ( = ?auto_71440 ?auto_71441 ) ) ( ON ?auto_71440 ?auto_71442 ) ( not ( = ?auto_71443 ?auto_71441 ) ) ( not ( = ?auto_71438 ?auto_71443 ) ) ( not ( = ?auto_71439 ?auto_71443 ) ) ( not ( = ?auto_71442 ?auto_71443 ) ) ( not ( = ?auto_71440 ?auto_71443 ) ) ( ON ?auto_71441 ?auto_71440 ) ( CLEAR ?auto_71441 ) ( HOLDING ?auto_71443 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71443 )
      ( MAKE-2PILE ?auto_71438 ?auto_71439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71444 - BLOCK
      ?auto_71445 - BLOCK
    )
    :vars
    (
      ?auto_71449 - BLOCK
      ?auto_71448 - BLOCK
      ?auto_71447 - BLOCK
      ?auto_71446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71449 ?auto_71445 ) ( ON-TABLE ?auto_71444 ) ( ON ?auto_71445 ?auto_71444 ) ( not ( = ?auto_71444 ?auto_71445 ) ) ( not ( = ?auto_71444 ?auto_71449 ) ) ( not ( = ?auto_71445 ?auto_71449 ) ) ( not ( = ?auto_71444 ?auto_71448 ) ) ( not ( = ?auto_71444 ?auto_71447 ) ) ( not ( = ?auto_71445 ?auto_71448 ) ) ( not ( = ?auto_71445 ?auto_71447 ) ) ( not ( = ?auto_71449 ?auto_71448 ) ) ( not ( = ?auto_71449 ?auto_71447 ) ) ( not ( = ?auto_71448 ?auto_71447 ) ) ( ON ?auto_71448 ?auto_71449 ) ( not ( = ?auto_71446 ?auto_71447 ) ) ( not ( = ?auto_71444 ?auto_71446 ) ) ( not ( = ?auto_71445 ?auto_71446 ) ) ( not ( = ?auto_71449 ?auto_71446 ) ) ( not ( = ?auto_71448 ?auto_71446 ) ) ( ON ?auto_71447 ?auto_71448 ) ( ON ?auto_71446 ?auto_71447 ) ( CLEAR ?auto_71446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71444 ?auto_71445 ?auto_71449 ?auto_71448 ?auto_71447 )
      ( MAKE-2PILE ?auto_71444 ?auto_71445 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71450 - BLOCK
      ?auto_71451 - BLOCK
    )
    :vars
    (
      ?auto_71452 - BLOCK
      ?auto_71454 - BLOCK
      ?auto_71455 - BLOCK
      ?auto_71453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71452 ?auto_71451 ) ( ON-TABLE ?auto_71450 ) ( ON ?auto_71451 ?auto_71450 ) ( not ( = ?auto_71450 ?auto_71451 ) ) ( not ( = ?auto_71450 ?auto_71452 ) ) ( not ( = ?auto_71451 ?auto_71452 ) ) ( not ( = ?auto_71450 ?auto_71454 ) ) ( not ( = ?auto_71450 ?auto_71455 ) ) ( not ( = ?auto_71451 ?auto_71454 ) ) ( not ( = ?auto_71451 ?auto_71455 ) ) ( not ( = ?auto_71452 ?auto_71454 ) ) ( not ( = ?auto_71452 ?auto_71455 ) ) ( not ( = ?auto_71454 ?auto_71455 ) ) ( ON ?auto_71454 ?auto_71452 ) ( not ( = ?auto_71453 ?auto_71455 ) ) ( not ( = ?auto_71450 ?auto_71453 ) ) ( not ( = ?auto_71451 ?auto_71453 ) ) ( not ( = ?auto_71452 ?auto_71453 ) ) ( not ( = ?auto_71454 ?auto_71453 ) ) ( ON ?auto_71455 ?auto_71454 ) ( HOLDING ?auto_71453 ) ( CLEAR ?auto_71455 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71450 ?auto_71451 ?auto_71452 ?auto_71454 ?auto_71455 ?auto_71453 )
      ( MAKE-2PILE ?auto_71450 ?auto_71451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71456 - BLOCK
      ?auto_71457 - BLOCK
    )
    :vars
    (
      ?auto_71459 - BLOCK
      ?auto_71458 - BLOCK
      ?auto_71461 - BLOCK
      ?auto_71460 - BLOCK
      ?auto_71462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71459 ?auto_71457 ) ( ON-TABLE ?auto_71456 ) ( ON ?auto_71457 ?auto_71456 ) ( not ( = ?auto_71456 ?auto_71457 ) ) ( not ( = ?auto_71456 ?auto_71459 ) ) ( not ( = ?auto_71457 ?auto_71459 ) ) ( not ( = ?auto_71456 ?auto_71458 ) ) ( not ( = ?auto_71456 ?auto_71461 ) ) ( not ( = ?auto_71457 ?auto_71458 ) ) ( not ( = ?auto_71457 ?auto_71461 ) ) ( not ( = ?auto_71459 ?auto_71458 ) ) ( not ( = ?auto_71459 ?auto_71461 ) ) ( not ( = ?auto_71458 ?auto_71461 ) ) ( ON ?auto_71458 ?auto_71459 ) ( not ( = ?auto_71460 ?auto_71461 ) ) ( not ( = ?auto_71456 ?auto_71460 ) ) ( not ( = ?auto_71457 ?auto_71460 ) ) ( not ( = ?auto_71459 ?auto_71460 ) ) ( not ( = ?auto_71458 ?auto_71460 ) ) ( ON ?auto_71461 ?auto_71458 ) ( CLEAR ?auto_71461 ) ( ON ?auto_71460 ?auto_71462 ) ( CLEAR ?auto_71460 ) ( HAND-EMPTY ) ( not ( = ?auto_71456 ?auto_71462 ) ) ( not ( = ?auto_71457 ?auto_71462 ) ) ( not ( = ?auto_71459 ?auto_71462 ) ) ( not ( = ?auto_71458 ?auto_71462 ) ) ( not ( = ?auto_71461 ?auto_71462 ) ) ( not ( = ?auto_71460 ?auto_71462 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71460 ?auto_71462 )
      ( MAKE-2PILE ?auto_71456 ?auto_71457 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71463 - BLOCK
      ?auto_71464 - BLOCK
    )
    :vars
    (
      ?auto_71468 - BLOCK
      ?auto_71467 - BLOCK
      ?auto_71469 - BLOCK
      ?auto_71466 - BLOCK
      ?auto_71465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71468 ?auto_71464 ) ( ON-TABLE ?auto_71463 ) ( ON ?auto_71464 ?auto_71463 ) ( not ( = ?auto_71463 ?auto_71464 ) ) ( not ( = ?auto_71463 ?auto_71468 ) ) ( not ( = ?auto_71464 ?auto_71468 ) ) ( not ( = ?auto_71463 ?auto_71467 ) ) ( not ( = ?auto_71463 ?auto_71469 ) ) ( not ( = ?auto_71464 ?auto_71467 ) ) ( not ( = ?auto_71464 ?auto_71469 ) ) ( not ( = ?auto_71468 ?auto_71467 ) ) ( not ( = ?auto_71468 ?auto_71469 ) ) ( not ( = ?auto_71467 ?auto_71469 ) ) ( ON ?auto_71467 ?auto_71468 ) ( not ( = ?auto_71466 ?auto_71469 ) ) ( not ( = ?auto_71463 ?auto_71466 ) ) ( not ( = ?auto_71464 ?auto_71466 ) ) ( not ( = ?auto_71468 ?auto_71466 ) ) ( not ( = ?auto_71467 ?auto_71466 ) ) ( ON ?auto_71466 ?auto_71465 ) ( CLEAR ?auto_71466 ) ( not ( = ?auto_71463 ?auto_71465 ) ) ( not ( = ?auto_71464 ?auto_71465 ) ) ( not ( = ?auto_71468 ?auto_71465 ) ) ( not ( = ?auto_71467 ?auto_71465 ) ) ( not ( = ?auto_71469 ?auto_71465 ) ) ( not ( = ?auto_71466 ?auto_71465 ) ) ( HOLDING ?auto_71469 ) ( CLEAR ?auto_71467 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71463 ?auto_71464 ?auto_71468 ?auto_71467 ?auto_71469 )
      ( MAKE-2PILE ?auto_71463 ?auto_71464 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71470 - BLOCK
      ?auto_71471 - BLOCK
    )
    :vars
    (
      ?auto_71472 - BLOCK
      ?auto_71473 - BLOCK
      ?auto_71474 - BLOCK
      ?auto_71476 - BLOCK
      ?auto_71475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71472 ?auto_71471 ) ( ON-TABLE ?auto_71470 ) ( ON ?auto_71471 ?auto_71470 ) ( not ( = ?auto_71470 ?auto_71471 ) ) ( not ( = ?auto_71470 ?auto_71472 ) ) ( not ( = ?auto_71471 ?auto_71472 ) ) ( not ( = ?auto_71470 ?auto_71473 ) ) ( not ( = ?auto_71470 ?auto_71474 ) ) ( not ( = ?auto_71471 ?auto_71473 ) ) ( not ( = ?auto_71471 ?auto_71474 ) ) ( not ( = ?auto_71472 ?auto_71473 ) ) ( not ( = ?auto_71472 ?auto_71474 ) ) ( not ( = ?auto_71473 ?auto_71474 ) ) ( ON ?auto_71473 ?auto_71472 ) ( not ( = ?auto_71476 ?auto_71474 ) ) ( not ( = ?auto_71470 ?auto_71476 ) ) ( not ( = ?auto_71471 ?auto_71476 ) ) ( not ( = ?auto_71472 ?auto_71476 ) ) ( not ( = ?auto_71473 ?auto_71476 ) ) ( ON ?auto_71476 ?auto_71475 ) ( not ( = ?auto_71470 ?auto_71475 ) ) ( not ( = ?auto_71471 ?auto_71475 ) ) ( not ( = ?auto_71472 ?auto_71475 ) ) ( not ( = ?auto_71473 ?auto_71475 ) ) ( not ( = ?auto_71474 ?auto_71475 ) ) ( not ( = ?auto_71476 ?auto_71475 ) ) ( CLEAR ?auto_71473 ) ( ON ?auto_71474 ?auto_71476 ) ( CLEAR ?auto_71474 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71475 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71475 ?auto_71476 )
      ( MAKE-2PILE ?auto_71470 ?auto_71471 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71477 - BLOCK
      ?auto_71478 - BLOCK
    )
    :vars
    (
      ?auto_71479 - BLOCK
      ?auto_71480 - BLOCK
      ?auto_71481 - BLOCK
      ?auto_71483 - BLOCK
      ?auto_71482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71479 ?auto_71478 ) ( ON-TABLE ?auto_71477 ) ( ON ?auto_71478 ?auto_71477 ) ( not ( = ?auto_71477 ?auto_71478 ) ) ( not ( = ?auto_71477 ?auto_71479 ) ) ( not ( = ?auto_71478 ?auto_71479 ) ) ( not ( = ?auto_71477 ?auto_71480 ) ) ( not ( = ?auto_71477 ?auto_71481 ) ) ( not ( = ?auto_71478 ?auto_71480 ) ) ( not ( = ?auto_71478 ?auto_71481 ) ) ( not ( = ?auto_71479 ?auto_71480 ) ) ( not ( = ?auto_71479 ?auto_71481 ) ) ( not ( = ?auto_71480 ?auto_71481 ) ) ( not ( = ?auto_71483 ?auto_71481 ) ) ( not ( = ?auto_71477 ?auto_71483 ) ) ( not ( = ?auto_71478 ?auto_71483 ) ) ( not ( = ?auto_71479 ?auto_71483 ) ) ( not ( = ?auto_71480 ?auto_71483 ) ) ( ON ?auto_71483 ?auto_71482 ) ( not ( = ?auto_71477 ?auto_71482 ) ) ( not ( = ?auto_71478 ?auto_71482 ) ) ( not ( = ?auto_71479 ?auto_71482 ) ) ( not ( = ?auto_71480 ?auto_71482 ) ) ( not ( = ?auto_71481 ?auto_71482 ) ) ( not ( = ?auto_71483 ?auto_71482 ) ) ( ON ?auto_71481 ?auto_71483 ) ( CLEAR ?auto_71481 ) ( ON-TABLE ?auto_71482 ) ( HOLDING ?auto_71480 ) ( CLEAR ?auto_71479 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71477 ?auto_71478 ?auto_71479 ?auto_71480 )
      ( MAKE-2PILE ?auto_71477 ?auto_71478 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71484 - BLOCK
      ?auto_71485 - BLOCK
    )
    :vars
    (
      ?auto_71486 - BLOCK
      ?auto_71488 - BLOCK
      ?auto_71487 - BLOCK
      ?auto_71490 - BLOCK
      ?auto_71489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71486 ?auto_71485 ) ( ON-TABLE ?auto_71484 ) ( ON ?auto_71485 ?auto_71484 ) ( not ( = ?auto_71484 ?auto_71485 ) ) ( not ( = ?auto_71484 ?auto_71486 ) ) ( not ( = ?auto_71485 ?auto_71486 ) ) ( not ( = ?auto_71484 ?auto_71488 ) ) ( not ( = ?auto_71484 ?auto_71487 ) ) ( not ( = ?auto_71485 ?auto_71488 ) ) ( not ( = ?auto_71485 ?auto_71487 ) ) ( not ( = ?auto_71486 ?auto_71488 ) ) ( not ( = ?auto_71486 ?auto_71487 ) ) ( not ( = ?auto_71488 ?auto_71487 ) ) ( not ( = ?auto_71490 ?auto_71487 ) ) ( not ( = ?auto_71484 ?auto_71490 ) ) ( not ( = ?auto_71485 ?auto_71490 ) ) ( not ( = ?auto_71486 ?auto_71490 ) ) ( not ( = ?auto_71488 ?auto_71490 ) ) ( ON ?auto_71490 ?auto_71489 ) ( not ( = ?auto_71484 ?auto_71489 ) ) ( not ( = ?auto_71485 ?auto_71489 ) ) ( not ( = ?auto_71486 ?auto_71489 ) ) ( not ( = ?auto_71488 ?auto_71489 ) ) ( not ( = ?auto_71487 ?auto_71489 ) ) ( not ( = ?auto_71490 ?auto_71489 ) ) ( ON ?auto_71487 ?auto_71490 ) ( ON-TABLE ?auto_71489 ) ( CLEAR ?auto_71486 ) ( ON ?auto_71488 ?auto_71487 ) ( CLEAR ?auto_71488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71489 ?auto_71490 ?auto_71487 )
      ( MAKE-2PILE ?auto_71484 ?auto_71485 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71505 - BLOCK
      ?auto_71506 - BLOCK
    )
    :vars
    (
      ?auto_71509 - BLOCK
      ?auto_71510 - BLOCK
      ?auto_71507 - BLOCK
      ?auto_71508 - BLOCK
      ?auto_71511 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71505 ) ( not ( = ?auto_71505 ?auto_71506 ) ) ( not ( = ?auto_71505 ?auto_71509 ) ) ( not ( = ?auto_71506 ?auto_71509 ) ) ( not ( = ?auto_71505 ?auto_71510 ) ) ( not ( = ?auto_71505 ?auto_71507 ) ) ( not ( = ?auto_71506 ?auto_71510 ) ) ( not ( = ?auto_71506 ?auto_71507 ) ) ( not ( = ?auto_71509 ?auto_71510 ) ) ( not ( = ?auto_71509 ?auto_71507 ) ) ( not ( = ?auto_71510 ?auto_71507 ) ) ( not ( = ?auto_71508 ?auto_71507 ) ) ( not ( = ?auto_71505 ?auto_71508 ) ) ( not ( = ?auto_71506 ?auto_71508 ) ) ( not ( = ?auto_71509 ?auto_71508 ) ) ( not ( = ?auto_71510 ?auto_71508 ) ) ( ON ?auto_71508 ?auto_71511 ) ( not ( = ?auto_71505 ?auto_71511 ) ) ( not ( = ?auto_71506 ?auto_71511 ) ) ( not ( = ?auto_71509 ?auto_71511 ) ) ( not ( = ?auto_71510 ?auto_71511 ) ) ( not ( = ?auto_71507 ?auto_71511 ) ) ( not ( = ?auto_71508 ?auto_71511 ) ) ( ON ?auto_71507 ?auto_71508 ) ( ON-TABLE ?auto_71511 ) ( ON ?auto_71510 ?auto_71507 ) ( ON ?auto_71509 ?auto_71510 ) ( CLEAR ?auto_71509 ) ( HOLDING ?auto_71506 ) ( CLEAR ?auto_71505 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71505 ?auto_71506 ?auto_71509 )
      ( MAKE-2PILE ?auto_71505 ?auto_71506 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71512 - BLOCK
      ?auto_71513 - BLOCK
    )
    :vars
    (
      ?auto_71515 - BLOCK
      ?auto_71514 - BLOCK
      ?auto_71518 - BLOCK
      ?auto_71516 - BLOCK
      ?auto_71517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71512 ) ( not ( = ?auto_71512 ?auto_71513 ) ) ( not ( = ?auto_71512 ?auto_71515 ) ) ( not ( = ?auto_71513 ?auto_71515 ) ) ( not ( = ?auto_71512 ?auto_71514 ) ) ( not ( = ?auto_71512 ?auto_71518 ) ) ( not ( = ?auto_71513 ?auto_71514 ) ) ( not ( = ?auto_71513 ?auto_71518 ) ) ( not ( = ?auto_71515 ?auto_71514 ) ) ( not ( = ?auto_71515 ?auto_71518 ) ) ( not ( = ?auto_71514 ?auto_71518 ) ) ( not ( = ?auto_71516 ?auto_71518 ) ) ( not ( = ?auto_71512 ?auto_71516 ) ) ( not ( = ?auto_71513 ?auto_71516 ) ) ( not ( = ?auto_71515 ?auto_71516 ) ) ( not ( = ?auto_71514 ?auto_71516 ) ) ( ON ?auto_71516 ?auto_71517 ) ( not ( = ?auto_71512 ?auto_71517 ) ) ( not ( = ?auto_71513 ?auto_71517 ) ) ( not ( = ?auto_71515 ?auto_71517 ) ) ( not ( = ?auto_71514 ?auto_71517 ) ) ( not ( = ?auto_71518 ?auto_71517 ) ) ( not ( = ?auto_71516 ?auto_71517 ) ) ( ON ?auto_71518 ?auto_71516 ) ( ON-TABLE ?auto_71517 ) ( ON ?auto_71514 ?auto_71518 ) ( ON ?auto_71515 ?auto_71514 ) ( CLEAR ?auto_71512 ) ( ON ?auto_71513 ?auto_71515 ) ( CLEAR ?auto_71513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71517 ?auto_71516 ?auto_71518 ?auto_71514 ?auto_71515 )
      ( MAKE-2PILE ?auto_71512 ?auto_71513 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71519 - BLOCK
      ?auto_71520 - BLOCK
    )
    :vars
    (
      ?auto_71521 - BLOCK
      ?auto_71524 - BLOCK
      ?auto_71525 - BLOCK
      ?auto_71523 - BLOCK
      ?auto_71522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71519 ?auto_71520 ) ) ( not ( = ?auto_71519 ?auto_71521 ) ) ( not ( = ?auto_71520 ?auto_71521 ) ) ( not ( = ?auto_71519 ?auto_71524 ) ) ( not ( = ?auto_71519 ?auto_71525 ) ) ( not ( = ?auto_71520 ?auto_71524 ) ) ( not ( = ?auto_71520 ?auto_71525 ) ) ( not ( = ?auto_71521 ?auto_71524 ) ) ( not ( = ?auto_71521 ?auto_71525 ) ) ( not ( = ?auto_71524 ?auto_71525 ) ) ( not ( = ?auto_71523 ?auto_71525 ) ) ( not ( = ?auto_71519 ?auto_71523 ) ) ( not ( = ?auto_71520 ?auto_71523 ) ) ( not ( = ?auto_71521 ?auto_71523 ) ) ( not ( = ?auto_71524 ?auto_71523 ) ) ( ON ?auto_71523 ?auto_71522 ) ( not ( = ?auto_71519 ?auto_71522 ) ) ( not ( = ?auto_71520 ?auto_71522 ) ) ( not ( = ?auto_71521 ?auto_71522 ) ) ( not ( = ?auto_71524 ?auto_71522 ) ) ( not ( = ?auto_71525 ?auto_71522 ) ) ( not ( = ?auto_71523 ?auto_71522 ) ) ( ON ?auto_71525 ?auto_71523 ) ( ON-TABLE ?auto_71522 ) ( ON ?auto_71524 ?auto_71525 ) ( ON ?auto_71521 ?auto_71524 ) ( ON ?auto_71520 ?auto_71521 ) ( CLEAR ?auto_71520 ) ( HOLDING ?auto_71519 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71519 )
      ( MAKE-2PILE ?auto_71519 ?auto_71520 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71526 - BLOCK
      ?auto_71527 - BLOCK
    )
    :vars
    (
      ?auto_71528 - BLOCK
      ?auto_71530 - BLOCK
      ?auto_71531 - BLOCK
      ?auto_71529 - BLOCK
      ?auto_71532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71526 ?auto_71527 ) ) ( not ( = ?auto_71526 ?auto_71528 ) ) ( not ( = ?auto_71527 ?auto_71528 ) ) ( not ( = ?auto_71526 ?auto_71530 ) ) ( not ( = ?auto_71526 ?auto_71531 ) ) ( not ( = ?auto_71527 ?auto_71530 ) ) ( not ( = ?auto_71527 ?auto_71531 ) ) ( not ( = ?auto_71528 ?auto_71530 ) ) ( not ( = ?auto_71528 ?auto_71531 ) ) ( not ( = ?auto_71530 ?auto_71531 ) ) ( not ( = ?auto_71529 ?auto_71531 ) ) ( not ( = ?auto_71526 ?auto_71529 ) ) ( not ( = ?auto_71527 ?auto_71529 ) ) ( not ( = ?auto_71528 ?auto_71529 ) ) ( not ( = ?auto_71530 ?auto_71529 ) ) ( ON ?auto_71529 ?auto_71532 ) ( not ( = ?auto_71526 ?auto_71532 ) ) ( not ( = ?auto_71527 ?auto_71532 ) ) ( not ( = ?auto_71528 ?auto_71532 ) ) ( not ( = ?auto_71530 ?auto_71532 ) ) ( not ( = ?auto_71531 ?auto_71532 ) ) ( not ( = ?auto_71529 ?auto_71532 ) ) ( ON ?auto_71531 ?auto_71529 ) ( ON-TABLE ?auto_71532 ) ( ON ?auto_71530 ?auto_71531 ) ( ON ?auto_71528 ?auto_71530 ) ( ON ?auto_71527 ?auto_71528 ) ( ON ?auto_71526 ?auto_71527 ) ( CLEAR ?auto_71526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71532 ?auto_71529 ?auto_71531 ?auto_71530 ?auto_71528 ?auto_71527 )
      ( MAKE-2PILE ?auto_71526 ?auto_71527 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71537 - BLOCK
      ?auto_71538 - BLOCK
      ?auto_71539 - BLOCK
      ?auto_71540 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_71540 ) ( CLEAR ?auto_71539 ) ( ON-TABLE ?auto_71537 ) ( ON ?auto_71538 ?auto_71537 ) ( ON ?auto_71539 ?auto_71538 ) ( not ( = ?auto_71537 ?auto_71538 ) ) ( not ( = ?auto_71537 ?auto_71539 ) ) ( not ( = ?auto_71537 ?auto_71540 ) ) ( not ( = ?auto_71538 ?auto_71539 ) ) ( not ( = ?auto_71538 ?auto_71540 ) ) ( not ( = ?auto_71539 ?auto_71540 ) ) )
    :subtasks
    ( ( !STACK ?auto_71540 ?auto_71539 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71541 - BLOCK
      ?auto_71542 - BLOCK
      ?auto_71543 - BLOCK
      ?auto_71544 - BLOCK
    )
    :vars
    (
      ?auto_71545 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71543 ) ( ON-TABLE ?auto_71541 ) ( ON ?auto_71542 ?auto_71541 ) ( ON ?auto_71543 ?auto_71542 ) ( not ( = ?auto_71541 ?auto_71542 ) ) ( not ( = ?auto_71541 ?auto_71543 ) ) ( not ( = ?auto_71541 ?auto_71544 ) ) ( not ( = ?auto_71542 ?auto_71543 ) ) ( not ( = ?auto_71542 ?auto_71544 ) ) ( not ( = ?auto_71543 ?auto_71544 ) ) ( ON ?auto_71544 ?auto_71545 ) ( CLEAR ?auto_71544 ) ( HAND-EMPTY ) ( not ( = ?auto_71541 ?auto_71545 ) ) ( not ( = ?auto_71542 ?auto_71545 ) ) ( not ( = ?auto_71543 ?auto_71545 ) ) ( not ( = ?auto_71544 ?auto_71545 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71544 ?auto_71545 )
      ( MAKE-4PILE ?auto_71541 ?auto_71542 ?auto_71543 ?auto_71544 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71546 - BLOCK
      ?auto_71547 - BLOCK
      ?auto_71548 - BLOCK
      ?auto_71549 - BLOCK
    )
    :vars
    (
      ?auto_71550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71546 ) ( ON ?auto_71547 ?auto_71546 ) ( not ( = ?auto_71546 ?auto_71547 ) ) ( not ( = ?auto_71546 ?auto_71548 ) ) ( not ( = ?auto_71546 ?auto_71549 ) ) ( not ( = ?auto_71547 ?auto_71548 ) ) ( not ( = ?auto_71547 ?auto_71549 ) ) ( not ( = ?auto_71548 ?auto_71549 ) ) ( ON ?auto_71549 ?auto_71550 ) ( CLEAR ?auto_71549 ) ( not ( = ?auto_71546 ?auto_71550 ) ) ( not ( = ?auto_71547 ?auto_71550 ) ) ( not ( = ?auto_71548 ?auto_71550 ) ) ( not ( = ?auto_71549 ?auto_71550 ) ) ( HOLDING ?auto_71548 ) ( CLEAR ?auto_71547 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71546 ?auto_71547 ?auto_71548 )
      ( MAKE-4PILE ?auto_71546 ?auto_71547 ?auto_71548 ?auto_71549 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71551 - BLOCK
      ?auto_71552 - BLOCK
      ?auto_71553 - BLOCK
      ?auto_71554 - BLOCK
    )
    :vars
    (
      ?auto_71555 - BLOCK
      ?auto_71556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71551 ) ( ON ?auto_71552 ?auto_71551 ) ( not ( = ?auto_71551 ?auto_71552 ) ) ( not ( = ?auto_71551 ?auto_71553 ) ) ( not ( = ?auto_71551 ?auto_71554 ) ) ( not ( = ?auto_71552 ?auto_71553 ) ) ( not ( = ?auto_71552 ?auto_71554 ) ) ( not ( = ?auto_71553 ?auto_71554 ) ) ( ON ?auto_71554 ?auto_71555 ) ( not ( = ?auto_71551 ?auto_71555 ) ) ( not ( = ?auto_71552 ?auto_71555 ) ) ( not ( = ?auto_71553 ?auto_71555 ) ) ( not ( = ?auto_71554 ?auto_71555 ) ) ( CLEAR ?auto_71552 ) ( ON ?auto_71553 ?auto_71554 ) ( CLEAR ?auto_71553 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71556 ) ( ON ?auto_71555 ?auto_71556 ) ( not ( = ?auto_71556 ?auto_71555 ) ) ( not ( = ?auto_71556 ?auto_71554 ) ) ( not ( = ?auto_71556 ?auto_71553 ) ) ( not ( = ?auto_71551 ?auto_71556 ) ) ( not ( = ?auto_71552 ?auto_71556 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71556 ?auto_71555 ?auto_71554 )
      ( MAKE-4PILE ?auto_71551 ?auto_71552 ?auto_71553 ?auto_71554 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71557 - BLOCK
      ?auto_71558 - BLOCK
      ?auto_71559 - BLOCK
      ?auto_71560 - BLOCK
    )
    :vars
    (
      ?auto_71561 - BLOCK
      ?auto_71562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71557 ) ( not ( = ?auto_71557 ?auto_71558 ) ) ( not ( = ?auto_71557 ?auto_71559 ) ) ( not ( = ?auto_71557 ?auto_71560 ) ) ( not ( = ?auto_71558 ?auto_71559 ) ) ( not ( = ?auto_71558 ?auto_71560 ) ) ( not ( = ?auto_71559 ?auto_71560 ) ) ( ON ?auto_71560 ?auto_71561 ) ( not ( = ?auto_71557 ?auto_71561 ) ) ( not ( = ?auto_71558 ?auto_71561 ) ) ( not ( = ?auto_71559 ?auto_71561 ) ) ( not ( = ?auto_71560 ?auto_71561 ) ) ( ON ?auto_71559 ?auto_71560 ) ( CLEAR ?auto_71559 ) ( ON-TABLE ?auto_71562 ) ( ON ?auto_71561 ?auto_71562 ) ( not ( = ?auto_71562 ?auto_71561 ) ) ( not ( = ?auto_71562 ?auto_71560 ) ) ( not ( = ?auto_71562 ?auto_71559 ) ) ( not ( = ?auto_71557 ?auto_71562 ) ) ( not ( = ?auto_71558 ?auto_71562 ) ) ( HOLDING ?auto_71558 ) ( CLEAR ?auto_71557 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71557 ?auto_71558 )
      ( MAKE-4PILE ?auto_71557 ?auto_71558 ?auto_71559 ?auto_71560 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71563 - BLOCK
      ?auto_71564 - BLOCK
      ?auto_71565 - BLOCK
      ?auto_71566 - BLOCK
    )
    :vars
    (
      ?auto_71568 - BLOCK
      ?auto_71567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71563 ) ( not ( = ?auto_71563 ?auto_71564 ) ) ( not ( = ?auto_71563 ?auto_71565 ) ) ( not ( = ?auto_71563 ?auto_71566 ) ) ( not ( = ?auto_71564 ?auto_71565 ) ) ( not ( = ?auto_71564 ?auto_71566 ) ) ( not ( = ?auto_71565 ?auto_71566 ) ) ( ON ?auto_71566 ?auto_71568 ) ( not ( = ?auto_71563 ?auto_71568 ) ) ( not ( = ?auto_71564 ?auto_71568 ) ) ( not ( = ?auto_71565 ?auto_71568 ) ) ( not ( = ?auto_71566 ?auto_71568 ) ) ( ON ?auto_71565 ?auto_71566 ) ( ON-TABLE ?auto_71567 ) ( ON ?auto_71568 ?auto_71567 ) ( not ( = ?auto_71567 ?auto_71568 ) ) ( not ( = ?auto_71567 ?auto_71566 ) ) ( not ( = ?auto_71567 ?auto_71565 ) ) ( not ( = ?auto_71563 ?auto_71567 ) ) ( not ( = ?auto_71564 ?auto_71567 ) ) ( CLEAR ?auto_71563 ) ( ON ?auto_71564 ?auto_71565 ) ( CLEAR ?auto_71564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71567 ?auto_71568 ?auto_71566 ?auto_71565 )
      ( MAKE-4PILE ?auto_71563 ?auto_71564 ?auto_71565 ?auto_71566 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71569 - BLOCK
      ?auto_71570 - BLOCK
      ?auto_71571 - BLOCK
      ?auto_71572 - BLOCK
    )
    :vars
    (
      ?auto_71574 - BLOCK
      ?auto_71573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71569 ?auto_71570 ) ) ( not ( = ?auto_71569 ?auto_71571 ) ) ( not ( = ?auto_71569 ?auto_71572 ) ) ( not ( = ?auto_71570 ?auto_71571 ) ) ( not ( = ?auto_71570 ?auto_71572 ) ) ( not ( = ?auto_71571 ?auto_71572 ) ) ( ON ?auto_71572 ?auto_71574 ) ( not ( = ?auto_71569 ?auto_71574 ) ) ( not ( = ?auto_71570 ?auto_71574 ) ) ( not ( = ?auto_71571 ?auto_71574 ) ) ( not ( = ?auto_71572 ?auto_71574 ) ) ( ON ?auto_71571 ?auto_71572 ) ( ON-TABLE ?auto_71573 ) ( ON ?auto_71574 ?auto_71573 ) ( not ( = ?auto_71573 ?auto_71574 ) ) ( not ( = ?auto_71573 ?auto_71572 ) ) ( not ( = ?auto_71573 ?auto_71571 ) ) ( not ( = ?auto_71569 ?auto_71573 ) ) ( not ( = ?auto_71570 ?auto_71573 ) ) ( ON ?auto_71570 ?auto_71571 ) ( CLEAR ?auto_71570 ) ( HOLDING ?auto_71569 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71569 )
      ( MAKE-4PILE ?auto_71569 ?auto_71570 ?auto_71571 ?auto_71572 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71575 - BLOCK
      ?auto_71576 - BLOCK
      ?auto_71577 - BLOCK
      ?auto_71578 - BLOCK
    )
    :vars
    (
      ?auto_71580 - BLOCK
      ?auto_71579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71575 ?auto_71576 ) ) ( not ( = ?auto_71575 ?auto_71577 ) ) ( not ( = ?auto_71575 ?auto_71578 ) ) ( not ( = ?auto_71576 ?auto_71577 ) ) ( not ( = ?auto_71576 ?auto_71578 ) ) ( not ( = ?auto_71577 ?auto_71578 ) ) ( ON ?auto_71578 ?auto_71580 ) ( not ( = ?auto_71575 ?auto_71580 ) ) ( not ( = ?auto_71576 ?auto_71580 ) ) ( not ( = ?auto_71577 ?auto_71580 ) ) ( not ( = ?auto_71578 ?auto_71580 ) ) ( ON ?auto_71577 ?auto_71578 ) ( ON-TABLE ?auto_71579 ) ( ON ?auto_71580 ?auto_71579 ) ( not ( = ?auto_71579 ?auto_71580 ) ) ( not ( = ?auto_71579 ?auto_71578 ) ) ( not ( = ?auto_71579 ?auto_71577 ) ) ( not ( = ?auto_71575 ?auto_71579 ) ) ( not ( = ?auto_71576 ?auto_71579 ) ) ( ON ?auto_71576 ?auto_71577 ) ( ON ?auto_71575 ?auto_71576 ) ( CLEAR ?auto_71575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71579 ?auto_71580 ?auto_71578 ?auto_71577 ?auto_71576 )
      ( MAKE-4PILE ?auto_71575 ?auto_71576 ?auto_71577 ?auto_71578 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71581 - BLOCK
      ?auto_71582 - BLOCK
      ?auto_71583 - BLOCK
      ?auto_71584 - BLOCK
    )
    :vars
    (
      ?auto_71585 - BLOCK
      ?auto_71586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71581 ?auto_71582 ) ) ( not ( = ?auto_71581 ?auto_71583 ) ) ( not ( = ?auto_71581 ?auto_71584 ) ) ( not ( = ?auto_71582 ?auto_71583 ) ) ( not ( = ?auto_71582 ?auto_71584 ) ) ( not ( = ?auto_71583 ?auto_71584 ) ) ( ON ?auto_71584 ?auto_71585 ) ( not ( = ?auto_71581 ?auto_71585 ) ) ( not ( = ?auto_71582 ?auto_71585 ) ) ( not ( = ?auto_71583 ?auto_71585 ) ) ( not ( = ?auto_71584 ?auto_71585 ) ) ( ON ?auto_71583 ?auto_71584 ) ( ON-TABLE ?auto_71586 ) ( ON ?auto_71585 ?auto_71586 ) ( not ( = ?auto_71586 ?auto_71585 ) ) ( not ( = ?auto_71586 ?auto_71584 ) ) ( not ( = ?auto_71586 ?auto_71583 ) ) ( not ( = ?auto_71581 ?auto_71586 ) ) ( not ( = ?auto_71582 ?auto_71586 ) ) ( ON ?auto_71582 ?auto_71583 ) ( HOLDING ?auto_71581 ) ( CLEAR ?auto_71582 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71586 ?auto_71585 ?auto_71584 ?auto_71583 ?auto_71582 ?auto_71581 )
      ( MAKE-4PILE ?auto_71581 ?auto_71582 ?auto_71583 ?auto_71584 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71587 - BLOCK
      ?auto_71588 - BLOCK
      ?auto_71589 - BLOCK
      ?auto_71590 - BLOCK
    )
    :vars
    (
      ?auto_71591 - BLOCK
      ?auto_71592 - BLOCK
      ?auto_71593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71587 ?auto_71588 ) ) ( not ( = ?auto_71587 ?auto_71589 ) ) ( not ( = ?auto_71587 ?auto_71590 ) ) ( not ( = ?auto_71588 ?auto_71589 ) ) ( not ( = ?auto_71588 ?auto_71590 ) ) ( not ( = ?auto_71589 ?auto_71590 ) ) ( ON ?auto_71590 ?auto_71591 ) ( not ( = ?auto_71587 ?auto_71591 ) ) ( not ( = ?auto_71588 ?auto_71591 ) ) ( not ( = ?auto_71589 ?auto_71591 ) ) ( not ( = ?auto_71590 ?auto_71591 ) ) ( ON ?auto_71589 ?auto_71590 ) ( ON-TABLE ?auto_71592 ) ( ON ?auto_71591 ?auto_71592 ) ( not ( = ?auto_71592 ?auto_71591 ) ) ( not ( = ?auto_71592 ?auto_71590 ) ) ( not ( = ?auto_71592 ?auto_71589 ) ) ( not ( = ?auto_71587 ?auto_71592 ) ) ( not ( = ?auto_71588 ?auto_71592 ) ) ( ON ?auto_71588 ?auto_71589 ) ( CLEAR ?auto_71588 ) ( ON ?auto_71587 ?auto_71593 ) ( CLEAR ?auto_71587 ) ( HAND-EMPTY ) ( not ( = ?auto_71587 ?auto_71593 ) ) ( not ( = ?auto_71588 ?auto_71593 ) ) ( not ( = ?auto_71589 ?auto_71593 ) ) ( not ( = ?auto_71590 ?auto_71593 ) ) ( not ( = ?auto_71591 ?auto_71593 ) ) ( not ( = ?auto_71592 ?auto_71593 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71587 ?auto_71593 )
      ( MAKE-4PILE ?auto_71587 ?auto_71588 ?auto_71589 ?auto_71590 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71594 - BLOCK
      ?auto_71595 - BLOCK
      ?auto_71596 - BLOCK
      ?auto_71597 - BLOCK
    )
    :vars
    (
      ?auto_71600 - BLOCK
      ?auto_71599 - BLOCK
      ?auto_71598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71594 ?auto_71595 ) ) ( not ( = ?auto_71594 ?auto_71596 ) ) ( not ( = ?auto_71594 ?auto_71597 ) ) ( not ( = ?auto_71595 ?auto_71596 ) ) ( not ( = ?auto_71595 ?auto_71597 ) ) ( not ( = ?auto_71596 ?auto_71597 ) ) ( ON ?auto_71597 ?auto_71600 ) ( not ( = ?auto_71594 ?auto_71600 ) ) ( not ( = ?auto_71595 ?auto_71600 ) ) ( not ( = ?auto_71596 ?auto_71600 ) ) ( not ( = ?auto_71597 ?auto_71600 ) ) ( ON ?auto_71596 ?auto_71597 ) ( ON-TABLE ?auto_71599 ) ( ON ?auto_71600 ?auto_71599 ) ( not ( = ?auto_71599 ?auto_71600 ) ) ( not ( = ?auto_71599 ?auto_71597 ) ) ( not ( = ?auto_71599 ?auto_71596 ) ) ( not ( = ?auto_71594 ?auto_71599 ) ) ( not ( = ?auto_71595 ?auto_71599 ) ) ( ON ?auto_71594 ?auto_71598 ) ( CLEAR ?auto_71594 ) ( not ( = ?auto_71594 ?auto_71598 ) ) ( not ( = ?auto_71595 ?auto_71598 ) ) ( not ( = ?auto_71596 ?auto_71598 ) ) ( not ( = ?auto_71597 ?auto_71598 ) ) ( not ( = ?auto_71600 ?auto_71598 ) ) ( not ( = ?auto_71599 ?auto_71598 ) ) ( HOLDING ?auto_71595 ) ( CLEAR ?auto_71596 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71599 ?auto_71600 ?auto_71597 ?auto_71596 ?auto_71595 )
      ( MAKE-4PILE ?auto_71594 ?auto_71595 ?auto_71596 ?auto_71597 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71601 - BLOCK
      ?auto_71602 - BLOCK
      ?auto_71603 - BLOCK
      ?auto_71604 - BLOCK
    )
    :vars
    (
      ?auto_71607 - BLOCK
      ?auto_71606 - BLOCK
      ?auto_71605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71601 ?auto_71602 ) ) ( not ( = ?auto_71601 ?auto_71603 ) ) ( not ( = ?auto_71601 ?auto_71604 ) ) ( not ( = ?auto_71602 ?auto_71603 ) ) ( not ( = ?auto_71602 ?auto_71604 ) ) ( not ( = ?auto_71603 ?auto_71604 ) ) ( ON ?auto_71604 ?auto_71607 ) ( not ( = ?auto_71601 ?auto_71607 ) ) ( not ( = ?auto_71602 ?auto_71607 ) ) ( not ( = ?auto_71603 ?auto_71607 ) ) ( not ( = ?auto_71604 ?auto_71607 ) ) ( ON ?auto_71603 ?auto_71604 ) ( ON-TABLE ?auto_71606 ) ( ON ?auto_71607 ?auto_71606 ) ( not ( = ?auto_71606 ?auto_71607 ) ) ( not ( = ?auto_71606 ?auto_71604 ) ) ( not ( = ?auto_71606 ?auto_71603 ) ) ( not ( = ?auto_71601 ?auto_71606 ) ) ( not ( = ?auto_71602 ?auto_71606 ) ) ( ON ?auto_71601 ?auto_71605 ) ( not ( = ?auto_71601 ?auto_71605 ) ) ( not ( = ?auto_71602 ?auto_71605 ) ) ( not ( = ?auto_71603 ?auto_71605 ) ) ( not ( = ?auto_71604 ?auto_71605 ) ) ( not ( = ?auto_71607 ?auto_71605 ) ) ( not ( = ?auto_71606 ?auto_71605 ) ) ( CLEAR ?auto_71603 ) ( ON ?auto_71602 ?auto_71601 ) ( CLEAR ?auto_71602 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71605 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71605 ?auto_71601 )
      ( MAKE-4PILE ?auto_71601 ?auto_71602 ?auto_71603 ?auto_71604 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71608 - BLOCK
      ?auto_71609 - BLOCK
      ?auto_71610 - BLOCK
      ?auto_71611 - BLOCK
    )
    :vars
    (
      ?auto_71612 - BLOCK
      ?auto_71613 - BLOCK
      ?auto_71614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71608 ?auto_71609 ) ) ( not ( = ?auto_71608 ?auto_71610 ) ) ( not ( = ?auto_71608 ?auto_71611 ) ) ( not ( = ?auto_71609 ?auto_71610 ) ) ( not ( = ?auto_71609 ?auto_71611 ) ) ( not ( = ?auto_71610 ?auto_71611 ) ) ( ON ?auto_71611 ?auto_71612 ) ( not ( = ?auto_71608 ?auto_71612 ) ) ( not ( = ?auto_71609 ?auto_71612 ) ) ( not ( = ?auto_71610 ?auto_71612 ) ) ( not ( = ?auto_71611 ?auto_71612 ) ) ( ON-TABLE ?auto_71613 ) ( ON ?auto_71612 ?auto_71613 ) ( not ( = ?auto_71613 ?auto_71612 ) ) ( not ( = ?auto_71613 ?auto_71611 ) ) ( not ( = ?auto_71613 ?auto_71610 ) ) ( not ( = ?auto_71608 ?auto_71613 ) ) ( not ( = ?auto_71609 ?auto_71613 ) ) ( ON ?auto_71608 ?auto_71614 ) ( not ( = ?auto_71608 ?auto_71614 ) ) ( not ( = ?auto_71609 ?auto_71614 ) ) ( not ( = ?auto_71610 ?auto_71614 ) ) ( not ( = ?auto_71611 ?auto_71614 ) ) ( not ( = ?auto_71612 ?auto_71614 ) ) ( not ( = ?auto_71613 ?auto_71614 ) ) ( ON ?auto_71609 ?auto_71608 ) ( CLEAR ?auto_71609 ) ( ON-TABLE ?auto_71614 ) ( HOLDING ?auto_71610 ) ( CLEAR ?auto_71611 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71613 ?auto_71612 ?auto_71611 ?auto_71610 )
      ( MAKE-4PILE ?auto_71608 ?auto_71609 ?auto_71610 ?auto_71611 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71615 - BLOCK
      ?auto_71616 - BLOCK
      ?auto_71617 - BLOCK
      ?auto_71618 - BLOCK
    )
    :vars
    (
      ?auto_71619 - BLOCK
      ?auto_71621 - BLOCK
      ?auto_71620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71615 ?auto_71616 ) ) ( not ( = ?auto_71615 ?auto_71617 ) ) ( not ( = ?auto_71615 ?auto_71618 ) ) ( not ( = ?auto_71616 ?auto_71617 ) ) ( not ( = ?auto_71616 ?auto_71618 ) ) ( not ( = ?auto_71617 ?auto_71618 ) ) ( ON ?auto_71618 ?auto_71619 ) ( not ( = ?auto_71615 ?auto_71619 ) ) ( not ( = ?auto_71616 ?auto_71619 ) ) ( not ( = ?auto_71617 ?auto_71619 ) ) ( not ( = ?auto_71618 ?auto_71619 ) ) ( ON-TABLE ?auto_71621 ) ( ON ?auto_71619 ?auto_71621 ) ( not ( = ?auto_71621 ?auto_71619 ) ) ( not ( = ?auto_71621 ?auto_71618 ) ) ( not ( = ?auto_71621 ?auto_71617 ) ) ( not ( = ?auto_71615 ?auto_71621 ) ) ( not ( = ?auto_71616 ?auto_71621 ) ) ( ON ?auto_71615 ?auto_71620 ) ( not ( = ?auto_71615 ?auto_71620 ) ) ( not ( = ?auto_71616 ?auto_71620 ) ) ( not ( = ?auto_71617 ?auto_71620 ) ) ( not ( = ?auto_71618 ?auto_71620 ) ) ( not ( = ?auto_71619 ?auto_71620 ) ) ( not ( = ?auto_71621 ?auto_71620 ) ) ( ON ?auto_71616 ?auto_71615 ) ( ON-TABLE ?auto_71620 ) ( CLEAR ?auto_71618 ) ( ON ?auto_71617 ?auto_71616 ) ( CLEAR ?auto_71617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71620 ?auto_71615 ?auto_71616 )
      ( MAKE-4PILE ?auto_71615 ?auto_71616 ?auto_71617 ?auto_71618 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71622 - BLOCK
      ?auto_71623 - BLOCK
      ?auto_71624 - BLOCK
      ?auto_71625 - BLOCK
    )
    :vars
    (
      ?auto_71628 - BLOCK
      ?auto_71627 - BLOCK
      ?auto_71626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71622 ?auto_71623 ) ) ( not ( = ?auto_71622 ?auto_71624 ) ) ( not ( = ?auto_71622 ?auto_71625 ) ) ( not ( = ?auto_71623 ?auto_71624 ) ) ( not ( = ?auto_71623 ?auto_71625 ) ) ( not ( = ?auto_71624 ?auto_71625 ) ) ( not ( = ?auto_71622 ?auto_71628 ) ) ( not ( = ?auto_71623 ?auto_71628 ) ) ( not ( = ?auto_71624 ?auto_71628 ) ) ( not ( = ?auto_71625 ?auto_71628 ) ) ( ON-TABLE ?auto_71627 ) ( ON ?auto_71628 ?auto_71627 ) ( not ( = ?auto_71627 ?auto_71628 ) ) ( not ( = ?auto_71627 ?auto_71625 ) ) ( not ( = ?auto_71627 ?auto_71624 ) ) ( not ( = ?auto_71622 ?auto_71627 ) ) ( not ( = ?auto_71623 ?auto_71627 ) ) ( ON ?auto_71622 ?auto_71626 ) ( not ( = ?auto_71622 ?auto_71626 ) ) ( not ( = ?auto_71623 ?auto_71626 ) ) ( not ( = ?auto_71624 ?auto_71626 ) ) ( not ( = ?auto_71625 ?auto_71626 ) ) ( not ( = ?auto_71628 ?auto_71626 ) ) ( not ( = ?auto_71627 ?auto_71626 ) ) ( ON ?auto_71623 ?auto_71622 ) ( ON-TABLE ?auto_71626 ) ( ON ?auto_71624 ?auto_71623 ) ( CLEAR ?auto_71624 ) ( HOLDING ?auto_71625 ) ( CLEAR ?auto_71628 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71627 ?auto_71628 ?auto_71625 )
      ( MAKE-4PILE ?auto_71622 ?auto_71623 ?auto_71624 ?auto_71625 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71629 - BLOCK
      ?auto_71630 - BLOCK
      ?auto_71631 - BLOCK
      ?auto_71632 - BLOCK
    )
    :vars
    (
      ?auto_71634 - BLOCK
      ?auto_71633 - BLOCK
      ?auto_71635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71629 ?auto_71630 ) ) ( not ( = ?auto_71629 ?auto_71631 ) ) ( not ( = ?auto_71629 ?auto_71632 ) ) ( not ( = ?auto_71630 ?auto_71631 ) ) ( not ( = ?auto_71630 ?auto_71632 ) ) ( not ( = ?auto_71631 ?auto_71632 ) ) ( not ( = ?auto_71629 ?auto_71634 ) ) ( not ( = ?auto_71630 ?auto_71634 ) ) ( not ( = ?auto_71631 ?auto_71634 ) ) ( not ( = ?auto_71632 ?auto_71634 ) ) ( ON-TABLE ?auto_71633 ) ( ON ?auto_71634 ?auto_71633 ) ( not ( = ?auto_71633 ?auto_71634 ) ) ( not ( = ?auto_71633 ?auto_71632 ) ) ( not ( = ?auto_71633 ?auto_71631 ) ) ( not ( = ?auto_71629 ?auto_71633 ) ) ( not ( = ?auto_71630 ?auto_71633 ) ) ( ON ?auto_71629 ?auto_71635 ) ( not ( = ?auto_71629 ?auto_71635 ) ) ( not ( = ?auto_71630 ?auto_71635 ) ) ( not ( = ?auto_71631 ?auto_71635 ) ) ( not ( = ?auto_71632 ?auto_71635 ) ) ( not ( = ?auto_71634 ?auto_71635 ) ) ( not ( = ?auto_71633 ?auto_71635 ) ) ( ON ?auto_71630 ?auto_71629 ) ( ON-TABLE ?auto_71635 ) ( ON ?auto_71631 ?auto_71630 ) ( CLEAR ?auto_71634 ) ( ON ?auto_71632 ?auto_71631 ) ( CLEAR ?auto_71632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71635 ?auto_71629 ?auto_71630 ?auto_71631 )
      ( MAKE-4PILE ?auto_71629 ?auto_71630 ?auto_71631 ?auto_71632 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71636 - BLOCK
      ?auto_71637 - BLOCK
      ?auto_71638 - BLOCK
      ?auto_71639 - BLOCK
    )
    :vars
    (
      ?auto_71642 - BLOCK
      ?auto_71640 - BLOCK
      ?auto_71641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71636 ?auto_71637 ) ) ( not ( = ?auto_71636 ?auto_71638 ) ) ( not ( = ?auto_71636 ?auto_71639 ) ) ( not ( = ?auto_71637 ?auto_71638 ) ) ( not ( = ?auto_71637 ?auto_71639 ) ) ( not ( = ?auto_71638 ?auto_71639 ) ) ( not ( = ?auto_71636 ?auto_71642 ) ) ( not ( = ?auto_71637 ?auto_71642 ) ) ( not ( = ?auto_71638 ?auto_71642 ) ) ( not ( = ?auto_71639 ?auto_71642 ) ) ( ON-TABLE ?auto_71640 ) ( not ( = ?auto_71640 ?auto_71642 ) ) ( not ( = ?auto_71640 ?auto_71639 ) ) ( not ( = ?auto_71640 ?auto_71638 ) ) ( not ( = ?auto_71636 ?auto_71640 ) ) ( not ( = ?auto_71637 ?auto_71640 ) ) ( ON ?auto_71636 ?auto_71641 ) ( not ( = ?auto_71636 ?auto_71641 ) ) ( not ( = ?auto_71637 ?auto_71641 ) ) ( not ( = ?auto_71638 ?auto_71641 ) ) ( not ( = ?auto_71639 ?auto_71641 ) ) ( not ( = ?auto_71642 ?auto_71641 ) ) ( not ( = ?auto_71640 ?auto_71641 ) ) ( ON ?auto_71637 ?auto_71636 ) ( ON-TABLE ?auto_71641 ) ( ON ?auto_71638 ?auto_71637 ) ( ON ?auto_71639 ?auto_71638 ) ( CLEAR ?auto_71639 ) ( HOLDING ?auto_71642 ) ( CLEAR ?auto_71640 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71640 ?auto_71642 )
      ( MAKE-4PILE ?auto_71636 ?auto_71637 ?auto_71638 ?auto_71639 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71643 - BLOCK
      ?auto_71644 - BLOCK
      ?auto_71645 - BLOCK
      ?auto_71646 - BLOCK
    )
    :vars
    (
      ?auto_71648 - BLOCK
      ?auto_71647 - BLOCK
      ?auto_71649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71643 ?auto_71644 ) ) ( not ( = ?auto_71643 ?auto_71645 ) ) ( not ( = ?auto_71643 ?auto_71646 ) ) ( not ( = ?auto_71644 ?auto_71645 ) ) ( not ( = ?auto_71644 ?auto_71646 ) ) ( not ( = ?auto_71645 ?auto_71646 ) ) ( not ( = ?auto_71643 ?auto_71648 ) ) ( not ( = ?auto_71644 ?auto_71648 ) ) ( not ( = ?auto_71645 ?auto_71648 ) ) ( not ( = ?auto_71646 ?auto_71648 ) ) ( ON-TABLE ?auto_71647 ) ( not ( = ?auto_71647 ?auto_71648 ) ) ( not ( = ?auto_71647 ?auto_71646 ) ) ( not ( = ?auto_71647 ?auto_71645 ) ) ( not ( = ?auto_71643 ?auto_71647 ) ) ( not ( = ?auto_71644 ?auto_71647 ) ) ( ON ?auto_71643 ?auto_71649 ) ( not ( = ?auto_71643 ?auto_71649 ) ) ( not ( = ?auto_71644 ?auto_71649 ) ) ( not ( = ?auto_71645 ?auto_71649 ) ) ( not ( = ?auto_71646 ?auto_71649 ) ) ( not ( = ?auto_71648 ?auto_71649 ) ) ( not ( = ?auto_71647 ?auto_71649 ) ) ( ON ?auto_71644 ?auto_71643 ) ( ON-TABLE ?auto_71649 ) ( ON ?auto_71645 ?auto_71644 ) ( ON ?auto_71646 ?auto_71645 ) ( CLEAR ?auto_71647 ) ( ON ?auto_71648 ?auto_71646 ) ( CLEAR ?auto_71648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71649 ?auto_71643 ?auto_71644 ?auto_71645 ?auto_71646 )
      ( MAKE-4PILE ?auto_71643 ?auto_71644 ?auto_71645 ?auto_71646 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71650 - BLOCK
      ?auto_71651 - BLOCK
      ?auto_71652 - BLOCK
      ?auto_71653 - BLOCK
    )
    :vars
    (
      ?auto_71656 - BLOCK
      ?auto_71654 - BLOCK
      ?auto_71655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71650 ?auto_71651 ) ) ( not ( = ?auto_71650 ?auto_71652 ) ) ( not ( = ?auto_71650 ?auto_71653 ) ) ( not ( = ?auto_71651 ?auto_71652 ) ) ( not ( = ?auto_71651 ?auto_71653 ) ) ( not ( = ?auto_71652 ?auto_71653 ) ) ( not ( = ?auto_71650 ?auto_71656 ) ) ( not ( = ?auto_71651 ?auto_71656 ) ) ( not ( = ?auto_71652 ?auto_71656 ) ) ( not ( = ?auto_71653 ?auto_71656 ) ) ( not ( = ?auto_71654 ?auto_71656 ) ) ( not ( = ?auto_71654 ?auto_71653 ) ) ( not ( = ?auto_71654 ?auto_71652 ) ) ( not ( = ?auto_71650 ?auto_71654 ) ) ( not ( = ?auto_71651 ?auto_71654 ) ) ( ON ?auto_71650 ?auto_71655 ) ( not ( = ?auto_71650 ?auto_71655 ) ) ( not ( = ?auto_71651 ?auto_71655 ) ) ( not ( = ?auto_71652 ?auto_71655 ) ) ( not ( = ?auto_71653 ?auto_71655 ) ) ( not ( = ?auto_71656 ?auto_71655 ) ) ( not ( = ?auto_71654 ?auto_71655 ) ) ( ON ?auto_71651 ?auto_71650 ) ( ON-TABLE ?auto_71655 ) ( ON ?auto_71652 ?auto_71651 ) ( ON ?auto_71653 ?auto_71652 ) ( ON ?auto_71656 ?auto_71653 ) ( CLEAR ?auto_71656 ) ( HOLDING ?auto_71654 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71654 )
      ( MAKE-4PILE ?auto_71650 ?auto_71651 ?auto_71652 ?auto_71653 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71657 - BLOCK
      ?auto_71658 - BLOCK
      ?auto_71659 - BLOCK
      ?auto_71660 - BLOCK
    )
    :vars
    (
      ?auto_71661 - BLOCK
      ?auto_71662 - BLOCK
      ?auto_71663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71657 ?auto_71658 ) ) ( not ( = ?auto_71657 ?auto_71659 ) ) ( not ( = ?auto_71657 ?auto_71660 ) ) ( not ( = ?auto_71658 ?auto_71659 ) ) ( not ( = ?auto_71658 ?auto_71660 ) ) ( not ( = ?auto_71659 ?auto_71660 ) ) ( not ( = ?auto_71657 ?auto_71661 ) ) ( not ( = ?auto_71658 ?auto_71661 ) ) ( not ( = ?auto_71659 ?auto_71661 ) ) ( not ( = ?auto_71660 ?auto_71661 ) ) ( not ( = ?auto_71662 ?auto_71661 ) ) ( not ( = ?auto_71662 ?auto_71660 ) ) ( not ( = ?auto_71662 ?auto_71659 ) ) ( not ( = ?auto_71657 ?auto_71662 ) ) ( not ( = ?auto_71658 ?auto_71662 ) ) ( ON ?auto_71657 ?auto_71663 ) ( not ( = ?auto_71657 ?auto_71663 ) ) ( not ( = ?auto_71658 ?auto_71663 ) ) ( not ( = ?auto_71659 ?auto_71663 ) ) ( not ( = ?auto_71660 ?auto_71663 ) ) ( not ( = ?auto_71661 ?auto_71663 ) ) ( not ( = ?auto_71662 ?auto_71663 ) ) ( ON ?auto_71658 ?auto_71657 ) ( ON-TABLE ?auto_71663 ) ( ON ?auto_71659 ?auto_71658 ) ( ON ?auto_71660 ?auto_71659 ) ( ON ?auto_71661 ?auto_71660 ) ( ON ?auto_71662 ?auto_71661 ) ( CLEAR ?auto_71662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71663 ?auto_71657 ?auto_71658 ?auto_71659 ?auto_71660 ?auto_71661 )
      ( MAKE-4PILE ?auto_71657 ?auto_71658 ?auto_71659 ?auto_71660 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71665 - BLOCK
    )
    :vars
    (
      ?auto_71666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71666 ?auto_71665 ) ( CLEAR ?auto_71666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71665 ) ( not ( = ?auto_71665 ?auto_71666 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71666 ?auto_71665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71667 - BLOCK
    )
    :vars
    (
      ?auto_71668 - BLOCK
      ?auto_71669 - BLOCK
      ?auto_71670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71668 ?auto_71667 ) ( CLEAR ?auto_71668 ) ( ON-TABLE ?auto_71667 ) ( not ( = ?auto_71667 ?auto_71668 ) ) ( HOLDING ?auto_71669 ) ( CLEAR ?auto_71670 ) ( not ( = ?auto_71667 ?auto_71669 ) ) ( not ( = ?auto_71667 ?auto_71670 ) ) ( not ( = ?auto_71668 ?auto_71669 ) ) ( not ( = ?auto_71668 ?auto_71670 ) ) ( not ( = ?auto_71669 ?auto_71670 ) ) )
    :subtasks
    ( ( !STACK ?auto_71669 ?auto_71670 )
      ( MAKE-1PILE ?auto_71667 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71671 - BLOCK
    )
    :vars
    (
      ?auto_71674 - BLOCK
      ?auto_71672 - BLOCK
      ?auto_71673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71674 ?auto_71671 ) ( ON-TABLE ?auto_71671 ) ( not ( = ?auto_71671 ?auto_71674 ) ) ( CLEAR ?auto_71672 ) ( not ( = ?auto_71671 ?auto_71673 ) ) ( not ( = ?auto_71671 ?auto_71672 ) ) ( not ( = ?auto_71674 ?auto_71673 ) ) ( not ( = ?auto_71674 ?auto_71672 ) ) ( not ( = ?auto_71673 ?auto_71672 ) ) ( ON ?auto_71673 ?auto_71674 ) ( CLEAR ?auto_71673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71671 ?auto_71674 )
      ( MAKE-1PILE ?auto_71671 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71675 - BLOCK
    )
    :vars
    (
      ?auto_71676 - BLOCK
      ?auto_71677 - BLOCK
      ?auto_71678 - BLOCK
      ?auto_71680 - BLOCK
      ?auto_71679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71676 ?auto_71675 ) ( ON-TABLE ?auto_71675 ) ( not ( = ?auto_71675 ?auto_71676 ) ) ( not ( = ?auto_71675 ?auto_71677 ) ) ( not ( = ?auto_71675 ?auto_71678 ) ) ( not ( = ?auto_71676 ?auto_71677 ) ) ( not ( = ?auto_71676 ?auto_71678 ) ) ( not ( = ?auto_71677 ?auto_71678 ) ) ( ON ?auto_71677 ?auto_71676 ) ( CLEAR ?auto_71677 ) ( HOLDING ?auto_71678 ) ( CLEAR ?auto_71680 ) ( ON-TABLE ?auto_71679 ) ( ON ?auto_71680 ?auto_71679 ) ( not ( = ?auto_71679 ?auto_71680 ) ) ( not ( = ?auto_71679 ?auto_71678 ) ) ( not ( = ?auto_71680 ?auto_71678 ) ) ( not ( = ?auto_71675 ?auto_71680 ) ) ( not ( = ?auto_71675 ?auto_71679 ) ) ( not ( = ?auto_71676 ?auto_71680 ) ) ( not ( = ?auto_71676 ?auto_71679 ) ) ( not ( = ?auto_71677 ?auto_71680 ) ) ( not ( = ?auto_71677 ?auto_71679 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71679 ?auto_71680 ?auto_71678 )
      ( MAKE-1PILE ?auto_71675 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71681 - BLOCK
    )
    :vars
    (
      ?auto_71683 - BLOCK
      ?auto_71682 - BLOCK
      ?auto_71686 - BLOCK
      ?auto_71685 - BLOCK
      ?auto_71684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71683 ?auto_71681 ) ( ON-TABLE ?auto_71681 ) ( not ( = ?auto_71681 ?auto_71683 ) ) ( not ( = ?auto_71681 ?auto_71682 ) ) ( not ( = ?auto_71681 ?auto_71686 ) ) ( not ( = ?auto_71683 ?auto_71682 ) ) ( not ( = ?auto_71683 ?auto_71686 ) ) ( not ( = ?auto_71682 ?auto_71686 ) ) ( ON ?auto_71682 ?auto_71683 ) ( CLEAR ?auto_71685 ) ( ON-TABLE ?auto_71684 ) ( ON ?auto_71685 ?auto_71684 ) ( not ( = ?auto_71684 ?auto_71685 ) ) ( not ( = ?auto_71684 ?auto_71686 ) ) ( not ( = ?auto_71685 ?auto_71686 ) ) ( not ( = ?auto_71681 ?auto_71685 ) ) ( not ( = ?auto_71681 ?auto_71684 ) ) ( not ( = ?auto_71683 ?auto_71685 ) ) ( not ( = ?auto_71683 ?auto_71684 ) ) ( not ( = ?auto_71682 ?auto_71685 ) ) ( not ( = ?auto_71682 ?auto_71684 ) ) ( ON ?auto_71686 ?auto_71682 ) ( CLEAR ?auto_71686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71681 ?auto_71683 ?auto_71682 )
      ( MAKE-1PILE ?auto_71681 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71687 - BLOCK
    )
    :vars
    (
      ?auto_71692 - BLOCK
      ?auto_71689 - BLOCK
      ?auto_71690 - BLOCK
      ?auto_71691 - BLOCK
      ?auto_71688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71692 ?auto_71687 ) ( ON-TABLE ?auto_71687 ) ( not ( = ?auto_71687 ?auto_71692 ) ) ( not ( = ?auto_71687 ?auto_71689 ) ) ( not ( = ?auto_71687 ?auto_71690 ) ) ( not ( = ?auto_71692 ?auto_71689 ) ) ( not ( = ?auto_71692 ?auto_71690 ) ) ( not ( = ?auto_71689 ?auto_71690 ) ) ( ON ?auto_71689 ?auto_71692 ) ( ON-TABLE ?auto_71691 ) ( not ( = ?auto_71691 ?auto_71688 ) ) ( not ( = ?auto_71691 ?auto_71690 ) ) ( not ( = ?auto_71688 ?auto_71690 ) ) ( not ( = ?auto_71687 ?auto_71688 ) ) ( not ( = ?auto_71687 ?auto_71691 ) ) ( not ( = ?auto_71692 ?auto_71688 ) ) ( not ( = ?auto_71692 ?auto_71691 ) ) ( not ( = ?auto_71689 ?auto_71688 ) ) ( not ( = ?auto_71689 ?auto_71691 ) ) ( ON ?auto_71690 ?auto_71689 ) ( CLEAR ?auto_71690 ) ( HOLDING ?auto_71688 ) ( CLEAR ?auto_71691 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71691 ?auto_71688 )
      ( MAKE-1PILE ?auto_71687 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71693 - BLOCK
    )
    :vars
    (
      ?auto_71696 - BLOCK
      ?auto_71697 - BLOCK
      ?auto_71695 - BLOCK
      ?auto_71694 - BLOCK
      ?auto_71698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71696 ?auto_71693 ) ( ON-TABLE ?auto_71693 ) ( not ( = ?auto_71693 ?auto_71696 ) ) ( not ( = ?auto_71693 ?auto_71697 ) ) ( not ( = ?auto_71693 ?auto_71695 ) ) ( not ( = ?auto_71696 ?auto_71697 ) ) ( not ( = ?auto_71696 ?auto_71695 ) ) ( not ( = ?auto_71697 ?auto_71695 ) ) ( ON ?auto_71697 ?auto_71696 ) ( ON-TABLE ?auto_71694 ) ( not ( = ?auto_71694 ?auto_71698 ) ) ( not ( = ?auto_71694 ?auto_71695 ) ) ( not ( = ?auto_71698 ?auto_71695 ) ) ( not ( = ?auto_71693 ?auto_71698 ) ) ( not ( = ?auto_71693 ?auto_71694 ) ) ( not ( = ?auto_71696 ?auto_71698 ) ) ( not ( = ?auto_71696 ?auto_71694 ) ) ( not ( = ?auto_71697 ?auto_71698 ) ) ( not ( = ?auto_71697 ?auto_71694 ) ) ( ON ?auto_71695 ?auto_71697 ) ( CLEAR ?auto_71694 ) ( ON ?auto_71698 ?auto_71695 ) ( CLEAR ?auto_71698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71693 ?auto_71696 ?auto_71697 ?auto_71695 )
      ( MAKE-1PILE ?auto_71693 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71699 - BLOCK
    )
    :vars
    (
      ?auto_71704 - BLOCK
      ?auto_71700 - BLOCK
      ?auto_71703 - BLOCK
      ?auto_71702 - BLOCK
      ?auto_71701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71704 ?auto_71699 ) ( ON-TABLE ?auto_71699 ) ( not ( = ?auto_71699 ?auto_71704 ) ) ( not ( = ?auto_71699 ?auto_71700 ) ) ( not ( = ?auto_71699 ?auto_71703 ) ) ( not ( = ?auto_71704 ?auto_71700 ) ) ( not ( = ?auto_71704 ?auto_71703 ) ) ( not ( = ?auto_71700 ?auto_71703 ) ) ( ON ?auto_71700 ?auto_71704 ) ( not ( = ?auto_71702 ?auto_71701 ) ) ( not ( = ?auto_71702 ?auto_71703 ) ) ( not ( = ?auto_71701 ?auto_71703 ) ) ( not ( = ?auto_71699 ?auto_71701 ) ) ( not ( = ?auto_71699 ?auto_71702 ) ) ( not ( = ?auto_71704 ?auto_71701 ) ) ( not ( = ?auto_71704 ?auto_71702 ) ) ( not ( = ?auto_71700 ?auto_71701 ) ) ( not ( = ?auto_71700 ?auto_71702 ) ) ( ON ?auto_71703 ?auto_71700 ) ( ON ?auto_71701 ?auto_71703 ) ( CLEAR ?auto_71701 ) ( HOLDING ?auto_71702 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71702 )
      ( MAKE-1PILE ?auto_71699 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71705 - BLOCK
    )
    :vars
    (
      ?auto_71709 - BLOCK
      ?auto_71710 - BLOCK
      ?auto_71708 - BLOCK
      ?auto_71706 - BLOCK
      ?auto_71707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71709 ?auto_71705 ) ( ON-TABLE ?auto_71705 ) ( not ( = ?auto_71705 ?auto_71709 ) ) ( not ( = ?auto_71705 ?auto_71710 ) ) ( not ( = ?auto_71705 ?auto_71708 ) ) ( not ( = ?auto_71709 ?auto_71710 ) ) ( not ( = ?auto_71709 ?auto_71708 ) ) ( not ( = ?auto_71710 ?auto_71708 ) ) ( ON ?auto_71710 ?auto_71709 ) ( not ( = ?auto_71706 ?auto_71707 ) ) ( not ( = ?auto_71706 ?auto_71708 ) ) ( not ( = ?auto_71707 ?auto_71708 ) ) ( not ( = ?auto_71705 ?auto_71707 ) ) ( not ( = ?auto_71705 ?auto_71706 ) ) ( not ( = ?auto_71709 ?auto_71707 ) ) ( not ( = ?auto_71709 ?auto_71706 ) ) ( not ( = ?auto_71710 ?auto_71707 ) ) ( not ( = ?auto_71710 ?auto_71706 ) ) ( ON ?auto_71708 ?auto_71710 ) ( ON ?auto_71707 ?auto_71708 ) ( ON ?auto_71706 ?auto_71707 ) ( CLEAR ?auto_71706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71705 ?auto_71709 ?auto_71710 ?auto_71708 ?auto_71707 )
      ( MAKE-1PILE ?auto_71705 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71711 - BLOCK
    )
    :vars
    (
      ?auto_71713 - BLOCK
      ?auto_71712 - BLOCK
      ?auto_71714 - BLOCK
      ?auto_71716 - BLOCK
      ?auto_71715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71713 ?auto_71711 ) ( ON-TABLE ?auto_71711 ) ( not ( = ?auto_71711 ?auto_71713 ) ) ( not ( = ?auto_71711 ?auto_71712 ) ) ( not ( = ?auto_71711 ?auto_71714 ) ) ( not ( = ?auto_71713 ?auto_71712 ) ) ( not ( = ?auto_71713 ?auto_71714 ) ) ( not ( = ?auto_71712 ?auto_71714 ) ) ( ON ?auto_71712 ?auto_71713 ) ( not ( = ?auto_71716 ?auto_71715 ) ) ( not ( = ?auto_71716 ?auto_71714 ) ) ( not ( = ?auto_71715 ?auto_71714 ) ) ( not ( = ?auto_71711 ?auto_71715 ) ) ( not ( = ?auto_71711 ?auto_71716 ) ) ( not ( = ?auto_71713 ?auto_71715 ) ) ( not ( = ?auto_71713 ?auto_71716 ) ) ( not ( = ?auto_71712 ?auto_71715 ) ) ( not ( = ?auto_71712 ?auto_71716 ) ) ( ON ?auto_71714 ?auto_71712 ) ( ON ?auto_71715 ?auto_71714 ) ( HOLDING ?auto_71716 ) ( CLEAR ?auto_71715 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71711 ?auto_71713 ?auto_71712 ?auto_71714 ?auto_71715 ?auto_71716 )
      ( MAKE-1PILE ?auto_71711 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71717 - BLOCK
    )
    :vars
    (
      ?auto_71721 - BLOCK
      ?auto_71718 - BLOCK
      ?auto_71720 - BLOCK
      ?auto_71722 - BLOCK
      ?auto_71719 - BLOCK
      ?auto_71723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71721 ?auto_71717 ) ( ON-TABLE ?auto_71717 ) ( not ( = ?auto_71717 ?auto_71721 ) ) ( not ( = ?auto_71717 ?auto_71718 ) ) ( not ( = ?auto_71717 ?auto_71720 ) ) ( not ( = ?auto_71721 ?auto_71718 ) ) ( not ( = ?auto_71721 ?auto_71720 ) ) ( not ( = ?auto_71718 ?auto_71720 ) ) ( ON ?auto_71718 ?auto_71721 ) ( not ( = ?auto_71722 ?auto_71719 ) ) ( not ( = ?auto_71722 ?auto_71720 ) ) ( not ( = ?auto_71719 ?auto_71720 ) ) ( not ( = ?auto_71717 ?auto_71719 ) ) ( not ( = ?auto_71717 ?auto_71722 ) ) ( not ( = ?auto_71721 ?auto_71719 ) ) ( not ( = ?auto_71721 ?auto_71722 ) ) ( not ( = ?auto_71718 ?auto_71719 ) ) ( not ( = ?auto_71718 ?auto_71722 ) ) ( ON ?auto_71720 ?auto_71718 ) ( ON ?auto_71719 ?auto_71720 ) ( CLEAR ?auto_71719 ) ( ON ?auto_71722 ?auto_71723 ) ( CLEAR ?auto_71722 ) ( HAND-EMPTY ) ( not ( = ?auto_71717 ?auto_71723 ) ) ( not ( = ?auto_71721 ?auto_71723 ) ) ( not ( = ?auto_71718 ?auto_71723 ) ) ( not ( = ?auto_71720 ?auto_71723 ) ) ( not ( = ?auto_71722 ?auto_71723 ) ) ( not ( = ?auto_71719 ?auto_71723 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71722 ?auto_71723 )
      ( MAKE-1PILE ?auto_71717 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71724 - BLOCK
    )
    :vars
    (
      ?auto_71729 - BLOCK
      ?auto_71727 - BLOCK
      ?auto_71725 - BLOCK
      ?auto_71730 - BLOCK
      ?auto_71728 - BLOCK
      ?auto_71726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71729 ?auto_71724 ) ( ON-TABLE ?auto_71724 ) ( not ( = ?auto_71724 ?auto_71729 ) ) ( not ( = ?auto_71724 ?auto_71727 ) ) ( not ( = ?auto_71724 ?auto_71725 ) ) ( not ( = ?auto_71729 ?auto_71727 ) ) ( not ( = ?auto_71729 ?auto_71725 ) ) ( not ( = ?auto_71727 ?auto_71725 ) ) ( ON ?auto_71727 ?auto_71729 ) ( not ( = ?auto_71730 ?auto_71728 ) ) ( not ( = ?auto_71730 ?auto_71725 ) ) ( not ( = ?auto_71728 ?auto_71725 ) ) ( not ( = ?auto_71724 ?auto_71728 ) ) ( not ( = ?auto_71724 ?auto_71730 ) ) ( not ( = ?auto_71729 ?auto_71728 ) ) ( not ( = ?auto_71729 ?auto_71730 ) ) ( not ( = ?auto_71727 ?auto_71728 ) ) ( not ( = ?auto_71727 ?auto_71730 ) ) ( ON ?auto_71725 ?auto_71727 ) ( ON ?auto_71730 ?auto_71726 ) ( CLEAR ?auto_71730 ) ( not ( = ?auto_71724 ?auto_71726 ) ) ( not ( = ?auto_71729 ?auto_71726 ) ) ( not ( = ?auto_71727 ?auto_71726 ) ) ( not ( = ?auto_71725 ?auto_71726 ) ) ( not ( = ?auto_71730 ?auto_71726 ) ) ( not ( = ?auto_71728 ?auto_71726 ) ) ( HOLDING ?auto_71728 ) ( CLEAR ?auto_71725 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71724 ?auto_71729 ?auto_71727 ?auto_71725 ?auto_71728 )
      ( MAKE-1PILE ?auto_71724 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71731 - BLOCK
    )
    :vars
    (
      ?auto_71737 - BLOCK
      ?auto_71735 - BLOCK
      ?auto_71732 - BLOCK
      ?auto_71734 - BLOCK
      ?auto_71736 - BLOCK
      ?auto_71733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71737 ?auto_71731 ) ( ON-TABLE ?auto_71731 ) ( not ( = ?auto_71731 ?auto_71737 ) ) ( not ( = ?auto_71731 ?auto_71735 ) ) ( not ( = ?auto_71731 ?auto_71732 ) ) ( not ( = ?auto_71737 ?auto_71735 ) ) ( not ( = ?auto_71737 ?auto_71732 ) ) ( not ( = ?auto_71735 ?auto_71732 ) ) ( ON ?auto_71735 ?auto_71737 ) ( not ( = ?auto_71734 ?auto_71736 ) ) ( not ( = ?auto_71734 ?auto_71732 ) ) ( not ( = ?auto_71736 ?auto_71732 ) ) ( not ( = ?auto_71731 ?auto_71736 ) ) ( not ( = ?auto_71731 ?auto_71734 ) ) ( not ( = ?auto_71737 ?auto_71736 ) ) ( not ( = ?auto_71737 ?auto_71734 ) ) ( not ( = ?auto_71735 ?auto_71736 ) ) ( not ( = ?auto_71735 ?auto_71734 ) ) ( ON ?auto_71732 ?auto_71735 ) ( ON ?auto_71734 ?auto_71733 ) ( not ( = ?auto_71731 ?auto_71733 ) ) ( not ( = ?auto_71737 ?auto_71733 ) ) ( not ( = ?auto_71735 ?auto_71733 ) ) ( not ( = ?auto_71732 ?auto_71733 ) ) ( not ( = ?auto_71734 ?auto_71733 ) ) ( not ( = ?auto_71736 ?auto_71733 ) ) ( CLEAR ?auto_71732 ) ( ON ?auto_71736 ?auto_71734 ) ( CLEAR ?auto_71736 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71733 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71733 ?auto_71734 )
      ( MAKE-1PILE ?auto_71731 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71738 - BLOCK
    )
    :vars
    (
      ?auto_71743 - BLOCK
      ?auto_71741 - BLOCK
      ?auto_71742 - BLOCK
      ?auto_71739 - BLOCK
      ?auto_71744 - BLOCK
      ?auto_71740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71743 ?auto_71738 ) ( ON-TABLE ?auto_71738 ) ( not ( = ?auto_71738 ?auto_71743 ) ) ( not ( = ?auto_71738 ?auto_71741 ) ) ( not ( = ?auto_71738 ?auto_71742 ) ) ( not ( = ?auto_71743 ?auto_71741 ) ) ( not ( = ?auto_71743 ?auto_71742 ) ) ( not ( = ?auto_71741 ?auto_71742 ) ) ( ON ?auto_71741 ?auto_71743 ) ( not ( = ?auto_71739 ?auto_71744 ) ) ( not ( = ?auto_71739 ?auto_71742 ) ) ( not ( = ?auto_71744 ?auto_71742 ) ) ( not ( = ?auto_71738 ?auto_71744 ) ) ( not ( = ?auto_71738 ?auto_71739 ) ) ( not ( = ?auto_71743 ?auto_71744 ) ) ( not ( = ?auto_71743 ?auto_71739 ) ) ( not ( = ?auto_71741 ?auto_71744 ) ) ( not ( = ?auto_71741 ?auto_71739 ) ) ( ON ?auto_71739 ?auto_71740 ) ( not ( = ?auto_71738 ?auto_71740 ) ) ( not ( = ?auto_71743 ?auto_71740 ) ) ( not ( = ?auto_71741 ?auto_71740 ) ) ( not ( = ?auto_71742 ?auto_71740 ) ) ( not ( = ?auto_71739 ?auto_71740 ) ) ( not ( = ?auto_71744 ?auto_71740 ) ) ( ON ?auto_71744 ?auto_71739 ) ( CLEAR ?auto_71744 ) ( ON-TABLE ?auto_71740 ) ( HOLDING ?auto_71742 ) ( CLEAR ?auto_71741 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71738 ?auto_71743 ?auto_71741 ?auto_71742 )
      ( MAKE-1PILE ?auto_71738 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71745 - BLOCK
    )
    :vars
    (
      ?auto_71751 - BLOCK
      ?auto_71749 - BLOCK
      ?auto_71747 - BLOCK
      ?auto_71750 - BLOCK
      ?auto_71746 - BLOCK
      ?auto_71748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71751 ?auto_71745 ) ( ON-TABLE ?auto_71745 ) ( not ( = ?auto_71745 ?auto_71751 ) ) ( not ( = ?auto_71745 ?auto_71749 ) ) ( not ( = ?auto_71745 ?auto_71747 ) ) ( not ( = ?auto_71751 ?auto_71749 ) ) ( not ( = ?auto_71751 ?auto_71747 ) ) ( not ( = ?auto_71749 ?auto_71747 ) ) ( ON ?auto_71749 ?auto_71751 ) ( not ( = ?auto_71750 ?auto_71746 ) ) ( not ( = ?auto_71750 ?auto_71747 ) ) ( not ( = ?auto_71746 ?auto_71747 ) ) ( not ( = ?auto_71745 ?auto_71746 ) ) ( not ( = ?auto_71745 ?auto_71750 ) ) ( not ( = ?auto_71751 ?auto_71746 ) ) ( not ( = ?auto_71751 ?auto_71750 ) ) ( not ( = ?auto_71749 ?auto_71746 ) ) ( not ( = ?auto_71749 ?auto_71750 ) ) ( ON ?auto_71750 ?auto_71748 ) ( not ( = ?auto_71745 ?auto_71748 ) ) ( not ( = ?auto_71751 ?auto_71748 ) ) ( not ( = ?auto_71749 ?auto_71748 ) ) ( not ( = ?auto_71747 ?auto_71748 ) ) ( not ( = ?auto_71750 ?auto_71748 ) ) ( not ( = ?auto_71746 ?auto_71748 ) ) ( ON ?auto_71746 ?auto_71750 ) ( ON-TABLE ?auto_71748 ) ( CLEAR ?auto_71749 ) ( ON ?auto_71747 ?auto_71746 ) ( CLEAR ?auto_71747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71748 ?auto_71750 ?auto_71746 )
      ( MAKE-1PILE ?auto_71745 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71752 - BLOCK
    )
    :vars
    (
      ?auto_71756 - BLOCK
      ?auto_71755 - BLOCK
      ?auto_71754 - BLOCK
      ?auto_71753 - BLOCK
      ?auto_71757 - BLOCK
      ?auto_71758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71756 ?auto_71752 ) ( ON-TABLE ?auto_71752 ) ( not ( = ?auto_71752 ?auto_71756 ) ) ( not ( = ?auto_71752 ?auto_71755 ) ) ( not ( = ?auto_71752 ?auto_71754 ) ) ( not ( = ?auto_71756 ?auto_71755 ) ) ( not ( = ?auto_71756 ?auto_71754 ) ) ( not ( = ?auto_71755 ?auto_71754 ) ) ( not ( = ?auto_71753 ?auto_71757 ) ) ( not ( = ?auto_71753 ?auto_71754 ) ) ( not ( = ?auto_71757 ?auto_71754 ) ) ( not ( = ?auto_71752 ?auto_71757 ) ) ( not ( = ?auto_71752 ?auto_71753 ) ) ( not ( = ?auto_71756 ?auto_71757 ) ) ( not ( = ?auto_71756 ?auto_71753 ) ) ( not ( = ?auto_71755 ?auto_71757 ) ) ( not ( = ?auto_71755 ?auto_71753 ) ) ( ON ?auto_71753 ?auto_71758 ) ( not ( = ?auto_71752 ?auto_71758 ) ) ( not ( = ?auto_71756 ?auto_71758 ) ) ( not ( = ?auto_71755 ?auto_71758 ) ) ( not ( = ?auto_71754 ?auto_71758 ) ) ( not ( = ?auto_71753 ?auto_71758 ) ) ( not ( = ?auto_71757 ?auto_71758 ) ) ( ON ?auto_71757 ?auto_71753 ) ( ON-TABLE ?auto_71758 ) ( ON ?auto_71754 ?auto_71757 ) ( CLEAR ?auto_71754 ) ( HOLDING ?auto_71755 ) ( CLEAR ?auto_71756 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71752 ?auto_71756 ?auto_71755 )
      ( MAKE-1PILE ?auto_71752 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71759 - BLOCK
    )
    :vars
    (
      ?auto_71764 - BLOCK
      ?auto_71762 - BLOCK
      ?auto_71763 - BLOCK
      ?auto_71760 - BLOCK
      ?auto_71765 - BLOCK
      ?auto_71761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71764 ?auto_71759 ) ( ON-TABLE ?auto_71759 ) ( not ( = ?auto_71759 ?auto_71764 ) ) ( not ( = ?auto_71759 ?auto_71762 ) ) ( not ( = ?auto_71759 ?auto_71763 ) ) ( not ( = ?auto_71764 ?auto_71762 ) ) ( not ( = ?auto_71764 ?auto_71763 ) ) ( not ( = ?auto_71762 ?auto_71763 ) ) ( not ( = ?auto_71760 ?auto_71765 ) ) ( not ( = ?auto_71760 ?auto_71763 ) ) ( not ( = ?auto_71765 ?auto_71763 ) ) ( not ( = ?auto_71759 ?auto_71765 ) ) ( not ( = ?auto_71759 ?auto_71760 ) ) ( not ( = ?auto_71764 ?auto_71765 ) ) ( not ( = ?auto_71764 ?auto_71760 ) ) ( not ( = ?auto_71762 ?auto_71765 ) ) ( not ( = ?auto_71762 ?auto_71760 ) ) ( ON ?auto_71760 ?auto_71761 ) ( not ( = ?auto_71759 ?auto_71761 ) ) ( not ( = ?auto_71764 ?auto_71761 ) ) ( not ( = ?auto_71762 ?auto_71761 ) ) ( not ( = ?auto_71763 ?auto_71761 ) ) ( not ( = ?auto_71760 ?auto_71761 ) ) ( not ( = ?auto_71765 ?auto_71761 ) ) ( ON ?auto_71765 ?auto_71760 ) ( ON-TABLE ?auto_71761 ) ( ON ?auto_71763 ?auto_71765 ) ( CLEAR ?auto_71764 ) ( ON ?auto_71762 ?auto_71763 ) ( CLEAR ?auto_71762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71761 ?auto_71760 ?auto_71765 ?auto_71763 )
      ( MAKE-1PILE ?auto_71759 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71780 - BLOCK
    )
    :vars
    (
      ?auto_71784 - BLOCK
      ?auto_71786 - BLOCK
      ?auto_71785 - BLOCK
      ?auto_71783 - BLOCK
      ?auto_71782 - BLOCK
      ?auto_71781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71780 ?auto_71784 ) ) ( not ( = ?auto_71780 ?auto_71786 ) ) ( not ( = ?auto_71780 ?auto_71785 ) ) ( not ( = ?auto_71784 ?auto_71786 ) ) ( not ( = ?auto_71784 ?auto_71785 ) ) ( not ( = ?auto_71786 ?auto_71785 ) ) ( not ( = ?auto_71783 ?auto_71782 ) ) ( not ( = ?auto_71783 ?auto_71785 ) ) ( not ( = ?auto_71782 ?auto_71785 ) ) ( not ( = ?auto_71780 ?auto_71782 ) ) ( not ( = ?auto_71780 ?auto_71783 ) ) ( not ( = ?auto_71784 ?auto_71782 ) ) ( not ( = ?auto_71784 ?auto_71783 ) ) ( not ( = ?auto_71786 ?auto_71782 ) ) ( not ( = ?auto_71786 ?auto_71783 ) ) ( ON ?auto_71783 ?auto_71781 ) ( not ( = ?auto_71780 ?auto_71781 ) ) ( not ( = ?auto_71784 ?auto_71781 ) ) ( not ( = ?auto_71786 ?auto_71781 ) ) ( not ( = ?auto_71785 ?auto_71781 ) ) ( not ( = ?auto_71783 ?auto_71781 ) ) ( not ( = ?auto_71782 ?auto_71781 ) ) ( ON ?auto_71782 ?auto_71783 ) ( ON-TABLE ?auto_71781 ) ( ON ?auto_71785 ?auto_71782 ) ( ON ?auto_71786 ?auto_71785 ) ( ON ?auto_71784 ?auto_71786 ) ( CLEAR ?auto_71784 ) ( HOLDING ?auto_71780 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71780 ?auto_71784 )
      ( MAKE-1PILE ?auto_71780 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71787 - BLOCK
    )
    :vars
    (
      ?auto_71790 - BLOCK
      ?auto_71789 - BLOCK
      ?auto_71792 - BLOCK
      ?auto_71791 - BLOCK
      ?auto_71788 - BLOCK
      ?auto_71793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71787 ?auto_71790 ) ) ( not ( = ?auto_71787 ?auto_71789 ) ) ( not ( = ?auto_71787 ?auto_71792 ) ) ( not ( = ?auto_71790 ?auto_71789 ) ) ( not ( = ?auto_71790 ?auto_71792 ) ) ( not ( = ?auto_71789 ?auto_71792 ) ) ( not ( = ?auto_71791 ?auto_71788 ) ) ( not ( = ?auto_71791 ?auto_71792 ) ) ( not ( = ?auto_71788 ?auto_71792 ) ) ( not ( = ?auto_71787 ?auto_71788 ) ) ( not ( = ?auto_71787 ?auto_71791 ) ) ( not ( = ?auto_71790 ?auto_71788 ) ) ( not ( = ?auto_71790 ?auto_71791 ) ) ( not ( = ?auto_71789 ?auto_71788 ) ) ( not ( = ?auto_71789 ?auto_71791 ) ) ( ON ?auto_71791 ?auto_71793 ) ( not ( = ?auto_71787 ?auto_71793 ) ) ( not ( = ?auto_71790 ?auto_71793 ) ) ( not ( = ?auto_71789 ?auto_71793 ) ) ( not ( = ?auto_71792 ?auto_71793 ) ) ( not ( = ?auto_71791 ?auto_71793 ) ) ( not ( = ?auto_71788 ?auto_71793 ) ) ( ON ?auto_71788 ?auto_71791 ) ( ON-TABLE ?auto_71793 ) ( ON ?auto_71792 ?auto_71788 ) ( ON ?auto_71789 ?auto_71792 ) ( ON ?auto_71790 ?auto_71789 ) ( ON ?auto_71787 ?auto_71790 ) ( CLEAR ?auto_71787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71793 ?auto_71791 ?auto_71788 ?auto_71792 ?auto_71789 ?auto_71790 )
      ( MAKE-1PILE ?auto_71787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71799 - BLOCK
      ?auto_71800 - BLOCK
      ?auto_71801 - BLOCK
      ?auto_71802 - BLOCK
      ?auto_71803 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_71803 ) ( CLEAR ?auto_71802 ) ( ON-TABLE ?auto_71799 ) ( ON ?auto_71800 ?auto_71799 ) ( ON ?auto_71801 ?auto_71800 ) ( ON ?auto_71802 ?auto_71801 ) ( not ( = ?auto_71799 ?auto_71800 ) ) ( not ( = ?auto_71799 ?auto_71801 ) ) ( not ( = ?auto_71799 ?auto_71802 ) ) ( not ( = ?auto_71799 ?auto_71803 ) ) ( not ( = ?auto_71800 ?auto_71801 ) ) ( not ( = ?auto_71800 ?auto_71802 ) ) ( not ( = ?auto_71800 ?auto_71803 ) ) ( not ( = ?auto_71801 ?auto_71802 ) ) ( not ( = ?auto_71801 ?auto_71803 ) ) ( not ( = ?auto_71802 ?auto_71803 ) ) )
    :subtasks
    ( ( !STACK ?auto_71803 ?auto_71802 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71804 - BLOCK
      ?auto_71805 - BLOCK
      ?auto_71806 - BLOCK
      ?auto_71807 - BLOCK
      ?auto_71808 - BLOCK
    )
    :vars
    (
      ?auto_71809 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71807 ) ( ON-TABLE ?auto_71804 ) ( ON ?auto_71805 ?auto_71804 ) ( ON ?auto_71806 ?auto_71805 ) ( ON ?auto_71807 ?auto_71806 ) ( not ( = ?auto_71804 ?auto_71805 ) ) ( not ( = ?auto_71804 ?auto_71806 ) ) ( not ( = ?auto_71804 ?auto_71807 ) ) ( not ( = ?auto_71804 ?auto_71808 ) ) ( not ( = ?auto_71805 ?auto_71806 ) ) ( not ( = ?auto_71805 ?auto_71807 ) ) ( not ( = ?auto_71805 ?auto_71808 ) ) ( not ( = ?auto_71806 ?auto_71807 ) ) ( not ( = ?auto_71806 ?auto_71808 ) ) ( not ( = ?auto_71807 ?auto_71808 ) ) ( ON ?auto_71808 ?auto_71809 ) ( CLEAR ?auto_71808 ) ( HAND-EMPTY ) ( not ( = ?auto_71804 ?auto_71809 ) ) ( not ( = ?auto_71805 ?auto_71809 ) ) ( not ( = ?auto_71806 ?auto_71809 ) ) ( not ( = ?auto_71807 ?auto_71809 ) ) ( not ( = ?auto_71808 ?auto_71809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71808 ?auto_71809 )
      ( MAKE-5PILE ?auto_71804 ?auto_71805 ?auto_71806 ?auto_71807 ?auto_71808 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71810 - BLOCK
      ?auto_71811 - BLOCK
      ?auto_71812 - BLOCK
      ?auto_71813 - BLOCK
      ?auto_71814 - BLOCK
    )
    :vars
    (
      ?auto_71815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71810 ) ( ON ?auto_71811 ?auto_71810 ) ( ON ?auto_71812 ?auto_71811 ) ( not ( = ?auto_71810 ?auto_71811 ) ) ( not ( = ?auto_71810 ?auto_71812 ) ) ( not ( = ?auto_71810 ?auto_71813 ) ) ( not ( = ?auto_71810 ?auto_71814 ) ) ( not ( = ?auto_71811 ?auto_71812 ) ) ( not ( = ?auto_71811 ?auto_71813 ) ) ( not ( = ?auto_71811 ?auto_71814 ) ) ( not ( = ?auto_71812 ?auto_71813 ) ) ( not ( = ?auto_71812 ?auto_71814 ) ) ( not ( = ?auto_71813 ?auto_71814 ) ) ( ON ?auto_71814 ?auto_71815 ) ( CLEAR ?auto_71814 ) ( not ( = ?auto_71810 ?auto_71815 ) ) ( not ( = ?auto_71811 ?auto_71815 ) ) ( not ( = ?auto_71812 ?auto_71815 ) ) ( not ( = ?auto_71813 ?auto_71815 ) ) ( not ( = ?auto_71814 ?auto_71815 ) ) ( HOLDING ?auto_71813 ) ( CLEAR ?auto_71812 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71810 ?auto_71811 ?auto_71812 ?auto_71813 )
      ( MAKE-5PILE ?auto_71810 ?auto_71811 ?auto_71812 ?auto_71813 ?auto_71814 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71816 - BLOCK
      ?auto_71817 - BLOCK
      ?auto_71818 - BLOCK
      ?auto_71819 - BLOCK
      ?auto_71820 - BLOCK
    )
    :vars
    (
      ?auto_71821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71816 ) ( ON ?auto_71817 ?auto_71816 ) ( ON ?auto_71818 ?auto_71817 ) ( not ( = ?auto_71816 ?auto_71817 ) ) ( not ( = ?auto_71816 ?auto_71818 ) ) ( not ( = ?auto_71816 ?auto_71819 ) ) ( not ( = ?auto_71816 ?auto_71820 ) ) ( not ( = ?auto_71817 ?auto_71818 ) ) ( not ( = ?auto_71817 ?auto_71819 ) ) ( not ( = ?auto_71817 ?auto_71820 ) ) ( not ( = ?auto_71818 ?auto_71819 ) ) ( not ( = ?auto_71818 ?auto_71820 ) ) ( not ( = ?auto_71819 ?auto_71820 ) ) ( ON ?auto_71820 ?auto_71821 ) ( not ( = ?auto_71816 ?auto_71821 ) ) ( not ( = ?auto_71817 ?auto_71821 ) ) ( not ( = ?auto_71818 ?auto_71821 ) ) ( not ( = ?auto_71819 ?auto_71821 ) ) ( not ( = ?auto_71820 ?auto_71821 ) ) ( CLEAR ?auto_71818 ) ( ON ?auto_71819 ?auto_71820 ) ( CLEAR ?auto_71819 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71821 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71821 ?auto_71820 )
      ( MAKE-5PILE ?auto_71816 ?auto_71817 ?auto_71818 ?auto_71819 ?auto_71820 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71822 - BLOCK
      ?auto_71823 - BLOCK
      ?auto_71824 - BLOCK
      ?auto_71825 - BLOCK
      ?auto_71826 - BLOCK
    )
    :vars
    (
      ?auto_71827 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71822 ) ( ON ?auto_71823 ?auto_71822 ) ( not ( = ?auto_71822 ?auto_71823 ) ) ( not ( = ?auto_71822 ?auto_71824 ) ) ( not ( = ?auto_71822 ?auto_71825 ) ) ( not ( = ?auto_71822 ?auto_71826 ) ) ( not ( = ?auto_71823 ?auto_71824 ) ) ( not ( = ?auto_71823 ?auto_71825 ) ) ( not ( = ?auto_71823 ?auto_71826 ) ) ( not ( = ?auto_71824 ?auto_71825 ) ) ( not ( = ?auto_71824 ?auto_71826 ) ) ( not ( = ?auto_71825 ?auto_71826 ) ) ( ON ?auto_71826 ?auto_71827 ) ( not ( = ?auto_71822 ?auto_71827 ) ) ( not ( = ?auto_71823 ?auto_71827 ) ) ( not ( = ?auto_71824 ?auto_71827 ) ) ( not ( = ?auto_71825 ?auto_71827 ) ) ( not ( = ?auto_71826 ?auto_71827 ) ) ( ON ?auto_71825 ?auto_71826 ) ( CLEAR ?auto_71825 ) ( ON-TABLE ?auto_71827 ) ( HOLDING ?auto_71824 ) ( CLEAR ?auto_71823 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71822 ?auto_71823 ?auto_71824 )
      ( MAKE-5PILE ?auto_71822 ?auto_71823 ?auto_71824 ?auto_71825 ?auto_71826 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71828 - BLOCK
      ?auto_71829 - BLOCK
      ?auto_71830 - BLOCK
      ?auto_71831 - BLOCK
      ?auto_71832 - BLOCK
    )
    :vars
    (
      ?auto_71833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71828 ) ( ON ?auto_71829 ?auto_71828 ) ( not ( = ?auto_71828 ?auto_71829 ) ) ( not ( = ?auto_71828 ?auto_71830 ) ) ( not ( = ?auto_71828 ?auto_71831 ) ) ( not ( = ?auto_71828 ?auto_71832 ) ) ( not ( = ?auto_71829 ?auto_71830 ) ) ( not ( = ?auto_71829 ?auto_71831 ) ) ( not ( = ?auto_71829 ?auto_71832 ) ) ( not ( = ?auto_71830 ?auto_71831 ) ) ( not ( = ?auto_71830 ?auto_71832 ) ) ( not ( = ?auto_71831 ?auto_71832 ) ) ( ON ?auto_71832 ?auto_71833 ) ( not ( = ?auto_71828 ?auto_71833 ) ) ( not ( = ?auto_71829 ?auto_71833 ) ) ( not ( = ?auto_71830 ?auto_71833 ) ) ( not ( = ?auto_71831 ?auto_71833 ) ) ( not ( = ?auto_71832 ?auto_71833 ) ) ( ON ?auto_71831 ?auto_71832 ) ( ON-TABLE ?auto_71833 ) ( CLEAR ?auto_71829 ) ( ON ?auto_71830 ?auto_71831 ) ( CLEAR ?auto_71830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71833 ?auto_71832 ?auto_71831 )
      ( MAKE-5PILE ?auto_71828 ?auto_71829 ?auto_71830 ?auto_71831 ?auto_71832 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71834 - BLOCK
      ?auto_71835 - BLOCK
      ?auto_71836 - BLOCK
      ?auto_71837 - BLOCK
      ?auto_71838 - BLOCK
    )
    :vars
    (
      ?auto_71839 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71834 ) ( not ( = ?auto_71834 ?auto_71835 ) ) ( not ( = ?auto_71834 ?auto_71836 ) ) ( not ( = ?auto_71834 ?auto_71837 ) ) ( not ( = ?auto_71834 ?auto_71838 ) ) ( not ( = ?auto_71835 ?auto_71836 ) ) ( not ( = ?auto_71835 ?auto_71837 ) ) ( not ( = ?auto_71835 ?auto_71838 ) ) ( not ( = ?auto_71836 ?auto_71837 ) ) ( not ( = ?auto_71836 ?auto_71838 ) ) ( not ( = ?auto_71837 ?auto_71838 ) ) ( ON ?auto_71838 ?auto_71839 ) ( not ( = ?auto_71834 ?auto_71839 ) ) ( not ( = ?auto_71835 ?auto_71839 ) ) ( not ( = ?auto_71836 ?auto_71839 ) ) ( not ( = ?auto_71837 ?auto_71839 ) ) ( not ( = ?auto_71838 ?auto_71839 ) ) ( ON ?auto_71837 ?auto_71838 ) ( ON-TABLE ?auto_71839 ) ( ON ?auto_71836 ?auto_71837 ) ( CLEAR ?auto_71836 ) ( HOLDING ?auto_71835 ) ( CLEAR ?auto_71834 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71834 ?auto_71835 )
      ( MAKE-5PILE ?auto_71834 ?auto_71835 ?auto_71836 ?auto_71837 ?auto_71838 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71840 - BLOCK
      ?auto_71841 - BLOCK
      ?auto_71842 - BLOCK
      ?auto_71843 - BLOCK
      ?auto_71844 - BLOCK
    )
    :vars
    (
      ?auto_71845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71840 ) ( not ( = ?auto_71840 ?auto_71841 ) ) ( not ( = ?auto_71840 ?auto_71842 ) ) ( not ( = ?auto_71840 ?auto_71843 ) ) ( not ( = ?auto_71840 ?auto_71844 ) ) ( not ( = ?auto_71841 ?auto_71842 ) ) ( not ( = ?auto_71841 ?auto_71843 ) ) ( not ( = ?auto_71841 ?auto_71844 ) ) ( not ( = ?auto_71842 ?auto_71843 ) ) ( not ( = ?auto_71842 ?auto_71844 ) ) ( not ( = ?auto_71843 ?auto_71844 ) ) ( ON ?auto_71844 ?auto_71845 ) ( not ( = ?auto_71840 ?auto_71845 ) ) ( not ( = ?auto_71841 ?auto_71845 ) ) ( not ( = ?auto_71842 ?auto_71845 ) ) ( not ( = ?auto_71843 ?auto_71845 ) ) ( not ( = ?auto_71844 ?auto_71845 ) ) ( ON ?auto_71843 ?auto_71844 ) ( ON-TABLE ?auto_71845 ) ( ON ?auto_71842 ?auto_71843 ) ( CLEAR ?auto_71840 ) ( ON ?auto_71841 ?auto_71842 ) ( CLEAR ?auto_71841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71845 ?auto_71844 ?auto_71843 ?auto_71842 )
      ( MAKE-5PILE ?auto_71840 ?auto_71841 ?auto_71842 ?auto_71843 ?auto_71844 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71846 - BLOCK
      ?auto_71847 - BLOCK
      ?auto_71848 - BLOCK
      ?auto_71849 - BLOCK
      ?auto_71850 - BLOCK
    )
    :vars
    (
      ?auto_71851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71846 ?auto_71847 ) ) ( not ( = ?auto_71846 ?auto_71848 ) ) ( not ( = ?auto_71846 ?auto_71849 ) ) ( not ( = ?auto_71846 ?auto_71850 ) ) ( not ( = ?auto_71847 ?auto_71848 ) ) ( not ( = ?auto_71847 ?auto_71849 ) ) ( not ( = ?auto_71847 ?auto_71850 ) ) ( not ( = ?auto_71848 ?auto_71849 ) ) ( not ( = ?auto_71848 ?auto_71850 ) ) ( not ( = ?auto_71849 ?auto_71850 ) ) ( ON ?auto_71850 ?auto_71851 ) ( not ( = ?auto_71846 ?auto_71851 ) ) ( not ( = ?auto_71847 ?auto_71851 ) ) ( not ( = ?auto_71848 ?auto_71851 ) ) ( not ( = ?auto_71849 ?auto_71851 ) ) ( not ( = ?auto_71850 ?auto_71851 ) ) ( ON ?auto_71849 ?auto_71850 ) ( ON-TABLE ?auto_71851 ) ( ON ?auto_71848 ?auto_71849 ) ( ON ?auto_71847 ?auto_71848 ) ( CLEAR ?auto_71847 ) ( HOLDING ?auto_71846 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71846 )
      ( MAKE-5PILE ?auto_71846 ?auto_71847 ?auto_71848 ?auto_71849 ?auto_71850 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71852 - BLOCK
      ?auto_71853 - BLOCK
      ?auto_71854 - BLOCK
      ?auto_71855 - BLOCK
      ?auto_71856 - BLOCK
    )
    :vars
    (
      ?auto_71857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71852 ?auto_71853 ) ) ( not ( = ?auto_71852 ?auto_71854 ) ) ( not ( = ?auto_71852 ?auto_71855 ) ) ( not ( = ?auto_71852 ?auto_71856 ) ) ( not ( = ?auto_71853 ?auto_71854 ) ) ( not ( = ?auto_71853 ?auto_71855 ) ) ( not ( = ?auto_71853 ?auto_71856 ) ) ( not ( = ?auto_71854 ?auto_71855 ) ) ( not ( = ?auto_71854 ?auto_71856 ) ) ( not ( = ?auto_71855 ?auto_71856 ) ) ( ON ?auto_71856 ?auto_71857 ) ( not ( = ?auto_71852 ?auto_71857 ) ) ( not ( = ?auto_71853 ?auto_71857 ) ) ( not ( = ?auto_71854 ?auto_71857 ) ) ( not ( = ?auto_71855 ?auto_71857 ) ) ( not ( = ?auto_71856 ?auto_71857 ) ) ( ON ?auto_71855 ?auto_71856 ) ( ON-TABLE ?auto_71857 ) ( ON ?auto_71854 ?auto_71855 ) ( ON ?auto_71853 ?auto_71854 ) ( ON ?auto_71852 ?auto_71853 ) ( CLEAR ?auto_71852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71857 ?auto_71856 ?auto_71855 ?auto_71854 ?auto_71853 )
      ( MAKE-5PILE ?auto_71852 ?auto_71853 ?auto_71854 ?auto_71855 ?auto_71856 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71858 - BLOCK
      ?auto_71859 - BLOCK
      ?auto_71860 - BLOCK
      ?auto_71861 - BLOCK
      ?auto_71862 - BLOCK
    )
    :vars
    (
      ?auto_71863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71858 ?auto_71859 ) ) ( not ( = ?auto_71858 ?auto_71860 ) ) ( not ( = ?auto_71858 ?auto_71861 ) ) ( not ( = ?auto_71858 ?auto_71862 ) ) ( not ( = ?auto_71859 ?auto_71860 ) ) ( not ( = ?auto_71859 ?auto_71861 ) ) ( not ( = ?auto_71859 ?auto_71862 ) ) ( not ( = ?auto_71860 ?auto_71861 ) ) ( not ( = ?auto_71860 ?auto_71862 ) ) ( not ( = ?auto_71861 ?auto_71862 ) ) ( ON ?auto_71862 ?auto_71863 ) ( not ( = ?auto_71858 ?auto_71863 ) ) ( not ( = ?auto_71859 ?auto_71863 ) ) ( not ( = ?auto_71860 ?auto_71863 ) ) ( not ( = ?auto_71861 ?auto_71863 ) ) ( not ( = ?auto_71862 ?auto_71863 ) ) ( ON ?auto_71861 ?auto_71862 ) ( ON-TABLE ?auto_71863 ) ( ON ?auto_71860 ?auto_71861 ) ( ON ?auto_71859 ?auto_71860 ) ( HOLDING ?auto_71858 ) ( CLEAR ?auto_71859 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71863 ?auto_71862 ?auto_71861 ?auto_71860 ?auto_71859 ?auto_71858 )
      ( MAKE-5PILE ?auto_71858 ?auto_71859 ?auto_71860 ?auto_71861 ?auto_71862 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71864 - BLOCK
      ?auto_71865 - BLOCK
      ?auto_71866 - BLOCK
      ?auto_71867 - BLOCK
      ?auto_71868 - BLOCK
    )
    :vars
    (
      ?auto_71869 - BLOCK
      ?auto_71870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71864 ?auto_71865 ) ) ( not ( = ?auto_71864 ?auto_71866 ) ) ( not ( = ?auto_71864 ?auto_71867 ) ) ( not ( = ?auto_71864 ?auto_71868 ) ) ( not ( = ?auto_71865 ?auto_71866 ) ) ( not ( = ?auto_71865 ?auto_71867 ) ) ( not ( = ?auto_71865 ?auto_71868 ) ) ( not ( = ?auto_71866 ?auto_71867 ) ) ( not ( = ?auto_71866 ?auto_71868 ) ) ( not ( = ?auto_71867 ?auto_71868 ) ) ( ON ?auto_71868 ?auto_71869 ) ( not ( = ?auto_71864 ?auto_71869 ) ) ( not ( = ?auto_71865 ?auto_71869 ) ) ( not ( = ?auto_71866 ?auto_71869 ) ) ( not ( = ?auto_71867 ?auto_71869 ) ) ( not ( = ?auto_71868 ?auto_71869 ) ) ( ON ?auto_71867 ?auto_71868 ) ( ON-TABLE ?auto_71869 ) ( ON ?auto_71866 ?auto_71867 ) ( ON ?auto_71865 ?auto_71866 ) ( CLEAR ?auto_71865 ) ( ON ?auto_71864 ?auto_71870 ) ( CLEAR ?auto_71864 ) ( HAND-EMPTY ) ( not ( = ?auto_71864 ?auto_71870 ) ) ( not ( = ?auto_71865 ?auto_71870 ) ) ( not ( = ?auto_71866 ?auto_71870 ) ) ( not ( = ?auto_71867 ?auto_71870 ) ) ( not ( = ?auto_71868 ?auto_71870 ) ) ( not ( = ?auto_71869 ?auto_71870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71864 ?auto_71870 )
      ( MAKE-5PILE ?auto_71864 ?auto_71865 ?auto_71866 ?auto_71867 ?auto_71868 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71871 - BLOCK
      ?auto_71872 - BLOCK
      ?auto_71873 - BLOCK
      ?auto_71874 - BLOCK
      ?auto_71875 - BLOCK
    )
    :vars
    (
      ?auto_71877 - BLOCK
      ?auto_71876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71871 ?auto_71872 ) ) ( not ( = ?auto_71871 ?auto_71873 ) ) ( not ( = ?auto_71871 ?auto_71874 ) ) ( not ( = ?auto_71871 ?auto_71875 ) ) ( not ( = ?auto_71872 ?auto_71873 ) ) ( not ( = ?auto_71872 ?auto_71874 ) ) ( not ( = ?auto_71872 ?auto_71875 ) ) ( not ( = ?auto_71873 ?auto_71874 ) ) ( not ( = ?auto_71873 ?auto_71875 ) ) ( not ( = ?auto_71874 ?auto_71875 ) ) ( ON ?auto_71875 ?auto_71877 ) ( not ( = ?auto_71871 ?auto_71877 ) ) ( not ( = ?auto_71872 ?auto_71877 ) ) ( not ( = ?auto_71873 ?auto_71877 ) ) ( not ( = ?auto_71874 ?auto_71877 ) ) ( not ( = ?auto_71875 ?auto_71877 ) ) ( ON ?auto_71874 ?auto_71875 ) ( ON-TABLE ?auto_71877 ) ( ON ?auto_71873 ?auto_71874 ) ( ON ?auto_71871 ?auto_71876 ) ( CLEAR ?auto_71871 ) ( not ( = ?auto_71871 ?auto_71876 ) ) ( not ( = ?auto_71872 ?auto_71876 ) ) ( not ( = ?auto_71873 ?auto_71876 ) ) ( not ( = ?auto_71874 ?auto_71876 ) ) ( not ( = ?auto_71875 ?auto_71876 ) ) ( not ( = ?auto_71877 ?auto_71876 ) ) ( HOLDING ?auto_71872 ) ( CLEAR ?auto_71873 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71877 ?auto_71875 ?auto_71874 ?auto_71873 ?auto_71872 )
      ( MAKE-5PILE ?auto_71871 ?auto_71872 ?auto_71873 ?auto_71874 ?auto_71875 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71878 - BLOCK
      ?auto_71879 - BLOCK
      ?auto_71880 - BLOCK
      ?auto_71881 - BLOCK
      ?auto_71882 - BLOCK
    )
    :vars
    (
      ?auto_71884 - BLOCK
      ?auto_71883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71878 ?auto_71879 ) ) ( not ( = ?auto_71878 ?auto_71880 ) ) ( not ( = ?auto_71878 ?auto_71881 ) ) ( not ( = ?auto_71878 ?auto_71882 ) ) ( not ( = ?auto_71879 ?auto_71880 ) ) ( not ( = ?auto_71879 ?auto_71881 ) ) ( not ( = ?auto_71879 ?auto_71882 ) ) ( not ( = ?auto_71880 ?auto_71881 ) ) ( not ( = ?auto_71880 ?auto_71882 ) ) ( not ( = ?auto_71881 ?auto_71882 ) ) ( ON ?auto_71882 ?auto_71884 ) ( not ( = ?auto_71878 ?auto_71884 ) ) ( not ( = ?auto_71879 ?auto_71884 ) ) ( not ( = ?auto_71880 ?auto_71884 ) ) ( not ( = ?auto_71881 ?auto_71884 ) ) ( not ( = ?auto_71882 ?auto_71884 ) ) ( ON ?auto_71881 ?auto_71882 ) ( ON-TABLE ?auto_71884 ) ( ON ?auto_71880 ?auto_71881 ) ( ON ?auto_71878 ?auto_71883 ) ( not ( = ?auto_71878 ?auto_71883 ) ) ( not ( = ?auto_71879 ?auto_71883 ) ) ( not ( = ?auto_71880 ?auto_71883 ) ) ( not ( = ?auto_71881 ?auto_71883 ) ) ( not ( = ?auto_71882 ?auto_71883 ) ) ( not ( = ?auto_71884 ?auto_71883 ) ) ( CLEAR ?auto_71880 ) ( ON ?auto_71879 ?auto_71878 ) ( CLEAR ?auto_71879 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71883 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71883 ?auto_71878 )
      ( MAKE-5PILE ?auto_71878 ?auto_71879 ?auto_71880 ?auto_71881 ?auto_71882 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71885 - BLOCK
      ?auto_71886 - BLOCK
      ?auto_71887 - BLOCK
      ?auto_71888 - BLOCK
      ?auto_71889 - BLOCK
    )
    :vars
    (
      ?auto_71891 - BLOCK
      ?auto_71890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71885 ?auto_71886 ) ) ( not ( = ?auto_71885 ?auto_71887 ) ) ( not ( = ?auto_71885 ?auto_71888 ) ) ( not ( = ?auto_71885 ?auto_71889 ) ) ( not ( = ?auto_71886 ?auto_71887 ) ) ( not ( = ?auto_71886 ?auto_71888 ) ) ( not ( = ?auto_71886 ?auto_71889 ) ) ( not ( = ?auto_71887 ?auto_71888 ) ) ( not ( = ?auto_71887 ?auto_71889 ) ) ( not ( = ?auto_71888 ?auto_71889 ) ) ( ON ?auto_71889 ?auto_71891 ) ( not ( = ?auto_71885 ?auto_71891 ) ) ( not ( = ?auto_71886 ?auto_71891 ) ) ( not ( = ?auto_71887 ?auto_71891 ) ) ( not ( = ?auto_71888 ?auto_71891 ) ) ( not ( = ?auto_71889 ?auto_71891 ) ) ( ON ?auto_71888 ?auto_71889 ) ( ON-TABLE ?auto_71891 ) ( ON ?auto_71885 ?auto_71890 ) ( not ( = ?auto_71885 ?auto_71890 ) ) ( not ( = ?auto_71886 ?auto_71890 ) ) ( not ( = ?auto_71887 ?auto_71890 ) ) ( not ( = ?auto_71888 ?auto_71890 ) ) ( not ( = ?auto_71889 ?auto_71890 ) ) ( not ( = ?auto_71891 ?auto_71890 ) ) ( ON ?auto_71886 ?auto_71885 ) ( CLEAR ?auto_71886 ) ( ON-TABLE ?auto_71890 ) ( HOLDING ?auto_71887 ) ( CLEAR ?auto_71888 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71891 ?auto_71889 ?auto_71888 ?auto_71887 )
      ( MAKE-5PILE ?auto_71885 ?auto_71886 ?auto_71887 ?auto_71888 ?auto_71889 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71892 - BLOCK
      ?auto_71893 - BLOCK
      ?auto_71894 - BLOCK
      ?auto_71895 - BLOCK
      ?auto_71896 - BLOCK
    )
    :vars
    (
      ?auto_71898 - BLOCK
      ?auto_71897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71892 ?auto_71893 ) ) ( not ( = ?auto_71892 ?auto_71894 ) ) ( not ( = ?auto_71892 ?auto_71895 ) ) ( not ( = ?auto_71892 ?auto_71896 ) ) ( not ( = ?auto_71893 ?auto_71894 ) ) ( not ( = ?auto_71893 ?auto_71895 ) ) ( not ( = ?auto_71893 ?auto_71896 ) ) ( not ( = ?auto_71894 ?auto_71895 ) ) ( not ( = ?auto_71894 ?auto_71896 ) ) ( not ( = ?auto_71895 ?auto_71896 ) ) ( ON ?auto_71896 ?auto_71898 ) ( not ( = ?auto_71892 ?auto_71898 ) ) ( not ( = ?auto_71893 ?auto_71898 ) ) ( not ( = ?auto_71894 ?auto_71898 ) ) ( not ( = ?auto_71895 ?auto_71898 ) ) ( not ( = ?auto_71896 ?auto_71898 ) ) ( ON ?auto_71895 ?auto_71896 ) ( ON-TABLE ?auto_71898 ) ( ON ?auto_71892 ?auto_71897 ) ( not ( = ?auto_71892 ?auto_71897 ) ) ( not ( = ?auto_71893 ?auto_71897 ) ) ( not ( = ?auto_71894 ?auto_71897 ) ) ( not ( = ?auto_71895 ?auto_71897 ) ) ( not ( = ?auto_71896 ?auto_71897 ) ) ( not ( = ?auto_71898 ?auto_71897 ) ) ( ON ?auto_71893 ?auto_71892 ) ( ON-TABLE ?auto_71897 ) ( CLEAR ?auto_71895 ) ( ON ?auto_71894 ?auto_71893 ) ( CLEAR ?auto_71894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71897 ?auto_71892 ?auto_71893 )
      ( MAKE-5PILE ?auto_71892 ?auto_71893 ?auto_71894 ?auto_71895 ?auto_71896 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71899 - BLOCK
      ?auto_71900 - BLOCK
      ?auto_71901 - BLOCK
      ?auto_71902 - BLOCK
      ?auto_71903 - BLOCK
    )
    :vars
    (
      ?auto_71904 - BLOCK
      ?auto_71905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71899 ?auto_71900 ) ) ( not ( = ?auto_71899 ?auto_71901 ) ) ( not ( = ?auto_71899 ?auto_71902 ) ) ( not ( = ?auto_71899 ?auto_71903 ) ) ( not ( = ?auto_71900 ?auto_71901 ) ) ( not ( = ?auto_71900 ?auto_71902 ) ) ( not ( = ?auto_71900 ?auto_71903 ) ) ( not ( = ?auto_71901 ?auto_71902 ) ) ( not ( = ?auto_71901 ?auto_71903 ) ) ( not ( = ?auto_71902 ?auto_71903 ) ) ( ON ?auto_71903 ?auto_71904 ) ( not ( = ?auto_71899 ?auto_71904 ) ) ( not ( = ?auto_71900 ?auto_71904 ) ) ( not ( = ?auto_71901 ?auto_71904 ) ) ( not ( = ?auto_71902 ?auto_71904 ) ) ( not ( = ?auto_71903 ?auto_71904 ) ) ( ON-TABLE ?auto_71904 ) ( ON ?auto_71899 ?auto_71905 ) ( not ( = ?auto_71899 ?auto_71905 ) ) ( not ( = ?auto_71900 ?auto_71905 ) ) ( not ( = ?auto_71901 ?auto_71905 ) ) ( not ( = ?auto_71902 ?auto_71905 ) ) ( not ( = ?auto_71903 ?auto_71905 ) ) ( not ( = ?auto_71904 ?auto_71905 ) ) ( ON ?auto_71900 ?auto_71899 ) ( ON-TABLE ?auto_71905 ) ( ON ?auto_71901 ?auto_71900 ) ( CLEAR ?auto_71901 ) ( HOLDING ?auto_71902 ) ( CLEAR ?auto_71903 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71904 ?auto_71903 ?auto_71902 )
      ( MAKE-5PILE ?auto_71899 ?auto_71900 ?auto_71901 ?auto_71902 ?auto_71903 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71906 - BLOCK
      ?auto_71907 - BLOCK
      ?auto_71908 - BLOCK
      ?auto_71909 - BLOCK
      ?auto_71910 - BLOCK
    )
    :vars
    (
      ?auto_71911 - BLOCK
      ?auto_71912 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71906 ?auto_71907 ) ) ( not ( = ?auto_71906 ?auto_71908 ) ) ( not ( = ?auto_71906 ?auto_71909 ) ) ( not ( = ?auto_71906 ?auto_71910 ) ) ( not ( = ?auto_71907 ?auto_71908 ) ) ( not ( = ?auto_71907 ?auto_71909 ) ) ( not ( = ?auto_71907 ?auto_71910 ) ) ( not ( = ?auto_71908 ?auto_71909 ) ) ( not ( = ?auto_71908 ?auto_71910 ) ) ( not ( = ?auto_71909 ?auto_71910 ) ) ( ON ?auto_71910 ?auto_71911 ) ( not ( = ?auto_71906 ?auto_71911 ) ) ( not ( = ?auto_71907 ?auto_71911 ) ) ( not ( = ?auto_71908 ?auto_71911 ) ) ( not ( = ?auto_71909 ?auto_71911 ) ) ( not ( = ?auto_71910 ?auto_71911 ) ) ( ON-TABLE ?auto_71911 ) ( ON ?auto_71906 ?auto_71912 ) ( not ( = ?auto_71906 ?auto_71912 ) ) ( not ( = ?auto_71907 ?auto_71912 ) ) ( not ( = ?auto_71908 ?auto_71912 ) ) ( not ( = ?auto_71909 ?auto_71912 ) ) ( not ( = ?auto_71910 ?auto_71912 ) ) ( not ( = ?auto_71911 ?auto_71912 ) ) ( ON ?auto_71907 ?auto_71906 ) ( ON-TABLE ?auto_71912 ) ( ON ?auto_71908 ?auto_71907 ) ( CLEAR ?auto_71910 ) ( ON ?auto_71909 ?auto_71908 ) ( CLEAR ?auto_71909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71912 ?auto_71906 ?auto_71907 ?auto_71908 )
      ( MAKE-5PILE ?auto_71906 ?auto_71907 ?auto_71908 ?auto_71909 ?auto_71910 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71913 - BLOCK
      ?auto_71914 - BLOCK
      ?auto_71915 - BLOCK
      ?auto_71916 - BLOCK
      ?auto_71917 - BLOCK
    )
    :vars
    (
      ?auto_71918 - BLOCK
      ?auto_71919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71913 ?auto_71914 ) ) ( not ( = ?auto_71913 ?auto_71915 ) ) ( not ( = ?auto_71913 ?auto_71916 ) ) ( not ( = ?auto_71913 ?auto_71917 ) ) ( not ( = ?auto_71914 ?auto_71915 ) ) ( not ( = ?auto_71914 ?auto_71916 ) ) ( not ( = ?auto_71914 ?auto_71917 ) ) ( not ( = ?auto_71915 ?auto_71916 ) ) ( not ( = ?auto_71915 ?auto_71917 ) ) ( not ( = ?auto_71916 ?auto_71917 ) ) ( not ( = ?auto_71913 ?auto_71918 ) ) ( not ( = ?auto_71914 ?auto_71918 ) ) ( not ( = ?auto_71915 ?auto_71918 ) ) ( not ( = ?auto_71916 ?auto_71918 ) ) ( not ( = ?auto_71917 ?auto_71918 ) ) ( ON-TABLE ?auto_71918 ) ( ON ?auto_71913 ?auto_71919 ) ( not ( = ?auto_71913 ?auto_71919 ) ) ( not ( = ?auto_71914 ?auto_71919 ) ) ( not ( = ?auto_71915 ?auto_71919 ) ) ( not ( = ?auto_71916 ?auto_71919 ) ) ( not ( = ?auto_71917 ?auto_71919 ) ) ( not ( = ?auto_71918 ?auto_71919 ) ) ( ON ?auto_71914 ?auto_71913 ) ( ON-TABLE ?auto_71919 ) ( ON ?auto_71915 ?auto_71914 ) ( ON ?auto_71916 ?auto_71915 ) ( CLEAR ?auto_71916 ) ( HOLDING ?auto_71917 ) ( CLEAR ?auto_71918 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71918 ?auto_71917 )
      ( MAKE-5PILE ?auto_71913 ?auto_71914 ?auto_71915 ?auto_71916 ?auto_71917 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71920 - BLOCK
      ?auto_71921 - BLOCK
      ?auto_71922 - BLOCK
      ?auto_71923 - BLOCK
      ?auto_71924 - BLOCK
    )
    :vars
    (
      ?auto_71925 - BLOCK
      ?auto_71926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71920 ?auto_71921 ) ) ( not ( = ?auto_71920 ?auto_71922 ) ) ( not ( = ?auto_71920 ?auto_71923 ) ) ( not ( = ?auto_71920 ?auto_71924 ) ) ( not ( = ?auto_71921 ?auto_71922 ) ) ( not ( = ?auto_71921 ?auto_71923 ) ) ( not ( = ?auto_71921 ?auto_71924 ) ) ( not ( = ?auto_71922 ?auto_71923 ) ) ( not ( = ?auto_71922 ?auto_71924 ) ) ( not ( = ?auto_71923 ?auto_71924 ) ) ( not ( = ?auto_71920 ?auto_71925 ) ) ( not ( = ?auto_71921 ?auto_71925 ) ) ( not ( = ?auto_71922 ?auto_71925 ) ) ( not ( = ?auto_71923 ?auto_71925 ) ) ( not ( = ?auto_71924 ?auto_71925 ) ) ( ON-TABLE ?auto_71925 ) ( ON ?auto_71920 ?auto_71926 ) ( not ( = ?auto_71920 ?auto_71926 ) ) ( not ( = ?auto_71921 ?auto_71926 ) ) ( not ( = ?auto_71922 ?auto_71926 ) ) ( not ( = ?auto_71923 ?auto_71926 ) ) ( not ( = ?auto_71924 ?auto_71926 ) ) ( not ( = ?auto_71925 ?auto_71926 ) ) ( ON ?auto_71921 ?auto_71920 ) ( ON-TABLE ?auto_71926 ) ( ON ?auto_71922 ?auto_71921 ) ( ON ?auto_71923 ?auto_71922 ) ( CLEAR ?auto_71925 ) ( ON ?auto_71924 ?auto_71923 ) ( CLEAR ?auto_71924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71926 ?auto_71920 ?auto_71921 ?auto_71922 ?auto_71923 )
      ( MAKE-5PILE ?auto_71920 ?auto_71921 ?auto_71922 ?auto_71923 ?auto_71924 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71927 - BLOCK
      ?auto_71928 - BLOCK
      ?auto_71929 - BLOCK
      ?auto_71930 - BLOCK
      ?auto_71931 - BLOCK
    )
    :vars
    (
      ?auto_71933 - BLOCK
      ?auto_71932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71927 ?auto_71928 ) ) ( not ( = ?auto_71927 ?auto_71929 ) ) ( not ( = ?auto_71927 ?auto_71930 ) ) ( not ( = ?auto_71927 ?auto_71931 ) ) ( not ( = ?auto_71928 ?auto_71929 ) ) ( not ( = ?auto_71928 ?auto_71930 ) ) ( not ( = ?auto_71928 ?auto_71931 ) ) ( not ( = ?auto_71929 ?auto_71930 ) ) ( not ( = ?auto_71929 ?auto_71931 ) ) ( not ( = ?auto_71930 ?auto_71931 ) ) ( not ( = ?auto_71927 ?auto_71933 ) ) ( not ( = ?auto_71928 ?auto_71933 ) ) ( not ( = ?auto_71929 ?auto_71933 ) ) ( not ( = ?auto_71930 ?auto_71933 ) ) ( not ( = ?auto_71931 ?auto_71933 ) ) ( ON ?auto_71927 ?auto_71932 ) ( not ( = ?auto_71927 ?auto_71932 ) ) ( not ( = ?auto_71928 ?auto_71932 ) ) ( not ( = ?auto_71929 ?auto_71932 ) ) ( not ( = ?auto_71930 ?auto_71932 ) ) ( not ( = ?auto_71931 ?auto_71932 ) ) ( not ( = ?auto_71933 ?auto_71932 ) ) ( ON ?auto_71928 ?auto_71927 ) ( ON-TABLE ?auto_71932 ) ( ON ?auto_71929 ?auto_71928 ) ( ON ?auto_71930 ?auto_71929 ) ( ON ?auto_71931 ?auto_71930 ) ( CLEAR ?auto_71931 ) ( HOLDING ?auto_71933 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71933 )
      ( MAKE-5PILE ?auto_71927 ?auto_71928 ?auto_71929 ?auto_71930 ?auto_71931 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71934 - BLOCK
      ?auto_71935 - BLOCK
      ?auto_71936 - BLOCK
      ?auto_71937 - BLOCK
      ?auto_71938 - BLOCK
    )
    :vars
    (
      ?auto_71940 - BLOCK
      ?auto_71939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71934 ?auto_71935 ) ) ( not ( = ?auto_71934 ?auto_71936 ) ) ( not ( = ?auto_71934 ?auto_71937 ) ) ( not ( = ?auto_71934 ?auto_71938 ) ) ( not ( = ?auto_71935 ?auto_71936 ) ) ( not ( = ?auto_71935 ?auto_71937 ) ) ( not ( = ?auto_71935 ?auto_71938 ) ) ( not ( = ?auto_71936 ?auto_71937 ) ) ( not ( = ?auto_71936 ?auto_71938 ) ) ( not ( = ?auto_71937 ?auto_71938 ) ) ( not ( = ?auto_71934 ?auto_71940 ) ) ( not ( = ?auto_71935 ?auto_71940 ) ) ( not ( = ?auto_71936 ?auto_71940 ) ) ( not ( = ?auto_71937 ?auto_71940 ) ) ( not ( = ?auto_71938 ?auto_71940 ) ) ( ON ?auto_71934 ?auto_71939 ) ( not ( = ?auto_71934 ?auto_71939 ) ) ( not ( = ?auto_71935 ?auto_71939 ) ) ( not ( = ?auto_71936 ?auto_71939 ) ) ( not ( = ?auto_71937 ?auto_71939 ) ) ( not ( = ?auto_71938 ?auto_71939 ) ) ( not ( = ?auto_71940 ?auto_71939 ) ) ( ON ?auto_71935 ?auto_71934 ) ( ON-TABLE ?auto_71939 ) ( ON ?auto_71936 ?auto_71935 ) ( ON ?auto_71937 ?auto_71936 ) ( ON ?auto_71938 ?auto_71937 ) ( ON ?auto_71940 ?auto_71938 ) ( CLEAR ?auto_71940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71939 ?auto_71934 ?auto_71935 ?auto_71936 ?auto_71937 ?auto_71938 )
      ( MAKE-5PILE ?auto_71934 ?auto_71935 ?auto_71936 ?auto_71937 ?auto_71938 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71947 - BLOCK
      ?auto_71948 - BLOCK
      ?auto_71949 - BLOCK
      ?auto_71950 - BLOCK
      ?auto_71951 - BLOCK
      ?auto_71952 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_71952 ) ( CLEAR ?auto_71951 ) ( ON-TABLE ?auto_71947 ) ( ON ?auto_71948 ?auto_71947 ) ( ON ?auto_71949 ?auto_71948 ) ( ON ?auto_71950 ?auto_71949 ) ( ON ?auto_71951 ?auto_71950 ) ( not ( = ?auto_71947 ?auto_71948 ) ) ( not ( = ?auto_71947 ?auto_71949 ) ) ( not ( = ?auto_71947 ?auto_71950 ) ) ( not ( = ?auto_71947 ?auto_71951 ) ) ( not ( = ?auto_71947 ?auto_71952 ) ) ( not ( = ?auto_71948 ?auto_71949 ) ) ( not ( = ?auto_71948 ?auto_71950 ) ) ( not ( = ?auto_71948 ?auto_71951 ) ) ( not ( = ?auto_71948 ?auto_71952 ) ) ( not ( = ?auto_71949 ?auto_71950 ) ) ( not ( = ?auto_71949 ?auto_71951 ) ) ( not ( = ?auto_71949 ?auto_71952 ) ) ( not ( = ?auto_71950 ?auto_71951 ) ) ( not ( = ?auto_71950 ?auto_71952 ) ) ( not ( = ?auto_71951 ?auto_71952 ) ) )
    :subtasks
    ( ( !STACK ?auto_71952 ?auto_71951 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71953 - BLOCK
      ?auto_71954 - BLOCK
      ?auto_71955 - BLOCK
      ?auto_71956 - BLOCK
      ?auto_71957 - BLOCK
      ?auto_71958 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71957 ) ( ON-TABLE ?auto_71953 ) ( ON ?auto_71954 ?auto_71953 ) ( ON ?auto_71955 ?auto_71954 ) ( ON ?auto_71956 ?auto_71955 ) ( ON ?auto_71957 ?auto_71956 ) ( not ( = ?auto_71953 ?auto_71954 ) ) ( not ( = ?auto_71953 ?auto_71955 ) ) ( not ( = ?auto_71953 ?auto_71956 ) ) ( not ( = ?auto_71953 ?auto_71957 ) ) ( not ( = ?auto_71953 ?auto_71958 ) ) ( not ( = ?auto_71954 ?auto_71955 ) ) ( not ( = ?auto_71954 ?auto_71956 ) ) ( not ( = ?auto_71954 ?auto_71957 ) ) ( not ( = ?auto_71954 ?auto_71958 ) ) ( not ( = ?auto_71955 ?auto_71956 ) ) ( not ( = ?auto_71955 ?auto_71957 ) ) ( not ( = ?auto_71955 ?auto_71958 ) ) ( not ( = ?auto_71956 ?auto_71957 ) ) ( not ( = ?auto_71956 ?auto_71958 ) ) ( not ( = ?auto_71957 ?auto_71958 ) ) ( ON-TABLE ?auto_71958 ) ( CLEAR ?auto_71958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_71958 )
      ( MAKE-6PILE ?auto_71953 ?auto_71954 ?auto_71955 ?auto_71956 ?auto_71957 ?auto_71958 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71959 - BLOCK
      ?auto_71960 - BLOCK
      ?auto_71961 - BLOCK
      ?auto_71962 - BLOCK
      ?auto_71963 - BLOCK
      ?auto_71964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71959 ) ( ON ?auto_71960 ?auto_71959 ) ( ON ?auto_71961 ?auto_71960 ) ( ON ?auto_71962 ?auto_71961 ) ( not ( = ?auto_71959 ?auto_71960 ) ) ( not ( = ?auto_71959 ?auto_71961 ) ) ( not ( = ?auto_71959 ?auto_71962 ) ) ( not ( = ?auto_71959 ?auto_71963 ) ) ( not ( = ?auto_71959 ?auto_71964 ) ) ( not ( = ?auto_71960 ?auto_71961 ) ) ( not ( = ?auto_71960 ?auto_71962 ) ) ( not ( = ?auto_71960 ?auto_71963 ) ) ( not ( = ?auto_71960 ?auto_71964 ) ) ( not ( = ?auto_71961 ?auto_71962 ) ) ( not ( = ?auto_71961 ?auto_71963 ) ) ( not ( = ?auto_71961 ?auto_71964 ) ) ( not ( = ?auto_71962 ?auto_71963 ) ) ( not ( = ?auto_71962 ?auto_71964 ) ) ( not ( = ?auto_71963 ?auto_71964 ) ) ( ON-TABLE ?auto_71964 ) ( CLEAR ?auto_71964 ) ( HOLDING ?auto_71963 ) ( CLEAR ?auto_71962 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71959 ?auto_71960 ?auto_71961 ?auto_71962 ?auto_71963 )
      ( MAKE-6PILE ?auto_71959 ?auto_71960 ?auto_71961 ?auto_71962 ?auto_71963 ?auto_71964 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71965 - BLOCK
      ?auto_71966 - BLOCK
      ?auto_71967 - BLOCK
      ?auto_71968 - BLOCK
      ?auto_71969 - BLOCK
      ?auto_71970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71965 ) ( ON ?auto_71966 ?auto_71965 ) ( ON ?auto_71967 ?auto_71966 ) ( ON ?auto_71968 ?auto_71967 ) ( not ( = ?auto_71965 ?auto_71966 ) ) ( not ( = ?auto_71965 ?auto_71967 ) ) ( not ( = ?auto_71965 ?auto_71968 ) ) ( not ( = ?auto_71965 ?auto_71969 ) ) ( not ( = ?auto_71965 ?auto_71970 ) ) ( not ( = ?auto_71966 ?auto_71967 ) ) ( not ( = ?auto_71966 ?auto_71968 ) ) ( not ( = ?auto_71966 ?auto_71969 ) ) ( not ( = ?auto_71966 ?auto_71970 ) ) ( not ( = ?auto_71967 ?auto_71968 ) ) ( not ( = ?auto_71967 ?auto_71969 ) ) ( not ( = ?auto_71967 ?auto_71970 ) ) ( not ( = ?auto_71968 ?auto_71969 ) ) ( not ( = ?auto_71968 ?auto_71970 ) ) ( not ( = ?auto_71969 ?auto_71970 ) ) ( ON-TABLE ?auto_71970 ) ( CLEAR ?auto_71968 ) ( ON ?auto_71969 ?auto_71970 ) ( CLEAR ?auto_71969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71970 )
      ( MAKE-6PILE ?auto_71965 ?auto_71966 ?auto_71967 ?auto_71968 ?auto_71969 ?auto_71970 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71971 - BLOCK
      ?auto_71972 - BLOCK
      ?auto_71973 - BLOCK
      ?auto_71974 - BLOCK
      ?auto_71975 - BLOCK
      ?auto_71976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71971 ) ( ON ?auto_71972 ?auto_71971 ) ( ON ?auto_71973 ?auto_71972 ) ( not ( = ?auto_71971 ?auto_71972 ) ) ( not ( = ?auto_71971 ?auto_71973 ) ) ( not ( = ?auto_71971 ?auto_71974 ) ) ( not ( = ?auto_71971 ?auto_71975 ) ) ( not ( = ?auto_71971 ?auto_71976 ) ) ( not ( = ?auto_71972 ?auto_71973 ) ) ( not ( = ?auto_71972 ?auto_71974 ) ) ( not ( = ?auto_71972 ?auto_71975 ) ) ( not ( = ?auto_71972 ?auto_71976 ) ) ( not ( = ?auto_71973 ?auto_71974 ) ) ( not ( = ?auto_71973 ?auto_71975 ) ) ( not ( = ?auto_71973 ?auto_71976 ) ) ( not ( = ?auto_71974 ?auto_71975 ) ) ( not ( = ?auto_71974 ?auto_71976 ) ) ( not ( = ?auto_71975 ?auto_71976 ) ) ( ON-TABLE ?auto_71976 ) ( ON ?auto_71975 ?auto_71976 ) ( CLEAR ?auto_71975 ) ( HOLDING ?auto_71974 ) ( CLEAR ?auto_71973 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71971 ?auto_71972 ?auto_71973 ?auto_71974 )
      ( MAKE-6PILE ?auto_71971 ?auto_71972 ?auto_71973 ?auto_71974 ?auto_71975 ?auto_71976 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71977 - BLOCK
      ?auto_71978 - BLOCK
      ?auto_71979 - BLOCK
      ?auto_71980 - BLOCK
      ?auto_71981 - BLOCK
      ?auto_71982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71977 ) ( ON ?auto_71978 ?auto_71977 ) ( ON ?auto_71979 ?auto_71978 ) ( not ( = ?auto_71977 ?auto_71978 ) ) ( not ( = ?auto_71977 ?auto_71979 ) ) ( not ( = ?auto_71977 ?auto_71980 ) ) ( not ( = ?auto_71977 ?auto_71981 ) ) ( not ( = ?auto_71977 ?auto_71982 ) ) ( not ( = ?auto_71978 ?auto_71979 ) ) ( not ( = ?auto_71978 ?auto_71980 ) ) ( not ( = ?auto_71978 ?auto_71981 ) ) ( not ( = ?auto_71978 ?auto_71982 ) ) ( not ( = ?auto_71979 ?auto_71980 ) ) ( not ( = ?auto_71979 ?auto_71981 ) ) ( not ( = ?auto_71979 ?auto_71982 ) ) ( not ( = ?auto_71980 ?auto_71981 ) ) ( not ( = ?auto_71980 ?auto_71982 ) ) ( not ( = ?auto_71981 ?auto_71982 ) ) ( ON-TABLE ?auto_71982 ) ( ON ?auto_71981 ?auto_71982 ) ( CLEAR ?auto_71979 ) ( ON ?auto_71980 ?auto_71981 ) ( CLEAR ?auto_71980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71982 ?auto_71981 )
      ( MAKE-6PILE ?auto_71977 ?auto_71978 ?auto_71979 ?auto_71980 ?auto_71981 ?auto_71982 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71983 - BLOCK
      ?auto_71984 - BLOCK
      ?auto_71985 - BLOCK
      ?auto_71986 - BLOCK
      ?auto_71987 - BLOCK
      ?auto_71988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71983 ) ( ON ?auto_71984 ?auto_71983 ) ( not ( = ?auto_71983 ?auto_71984 ) ) ( not ( = ?auto_71983 ?auto_71985 ) ) ( not ( = ?auto_71983 ?auto_71986 ) ) ( not ( = ?auto_71983 ?auto_71987 ) ) ( not ( = ?auto_71983 ?auto_71988 ) ) ( not ( = ?auto_71984 ?auto_71985 ) ) ( not ( = ?auto_71984 ?auto_71986 ) ) ( not ( = ?auto_71984 ?auto_71987 ) ) ( not ( = ?auto_71984 ?auto_71988 ) ) ( not ( = ?auto_71985 ?auto_71986 ) ) ( not ( = ?auto_71985 ?auto_71987 ) ) ( not ( = ?auto_71985 ?auto_71988 ) ) ( not ( = ?auto_71986 ?auto_71987 ) ) ( not ( = ?auto_71986 ?auto_71988 ) ) ( not ( = ?auto_71987 ?auto_71988 ) ) ( ON-TABLE ?auto_71988 ) ( ON ?auto_71987 ?auto_71988 ) ( ON ?auto_71986 ?auto_71987 ) ( CLEAR ?auto_71986 ) ( HOLDING ?auto_71985 ) ( CLEAR ?auto_71984 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71983 ?auto_71984 ?auto_71985 )
      ( MAKE-6PILE ?auto_71983 ?auto_71984 ?auto_71985 ?auto_71986 ?auto_71987 ?auto_71988 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71989 - BLOCK
      ?auto_71990 - BLOCK
      ?auto_71991 - BLOCK
      ?auto_71992 - BLOCK
      ?auto_71993 - BLOCK
      ?auto_71994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71989 ) ( ON ?auto_71990 ?auto_71989 ) ( not ( = ?auto_71989 ?auto_71990 ) ) ( not ( = ?auto_71989 ?auto_71991 ) ) ( not ( = ?auto_71989 ?auto_71992 ) ) ( not ( = ?auto_71989 ?auto_71993 ) ) ( not ( = ?auto_71989 ?auto_71994 ) ) ( not ( = ?auto_71990 ?auto_71991 ) ) ( not ( = ?auto_71990 ?auto_71992 ) ) ( not ( = ?auto_71990 ?auto_71993 ) ) ( not ( = ?auto_71990 ?auto_71994 ) ) ( not ( = ?auto_71991 ?auto_71992 ) ) ( not ( = ?auto_71991 ?auto_71993 ) ) ( not ( = ?auto_71991 ?auto_71994 ) ) ( not ( = ?auto_71992 ?auto_71993 ) ) ( not ( = ?auto_71992 ?auto_71994 ) ) ( not ( = ?auto_71993 ?auto_71994 ) ) ( ON-TABLE ?auto_71994 ) ( ON ?auto_71993 ?auto_71994 ) ( ON ?auto_71992 ?auto_71993 ) ( CLEAR ?auto_71990 ) ( ON ?auto_71991 ?auto_71992 ) ( CLEAR ?auto_71991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71994 ?auto_71993 ?auto_71992 )
      ( MAKE-6PILE ?auto_71989 ?auto_71990 ?auto_71991 ?auto_71992 ?auto_71993 ?auto_71994 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71995 - BLOCK
      ?auto_71996 - BLOCK
      ?auto_71997 - BLOCK
      ?auto_71998 - BLOCK
      ?auto_71999 - BLOCK
      ?auto_72000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71995 ) ( not ( = ?auto_71995 ?auto_71996 ) ) ( not ( = ?auto_71995 ?auto_71997 ) ) ( not ( = ?auto_71995 ?auto_71998 ) ) ( not ( = ?auto_71995 ?auto_71999 ) ) ( not ( = ?auto_71995 ?auto_72000 ) ) ( not ( = ?auto_71996 ?auto_71997 ) ) ( not ( = ?auto_71996 ?auto_71998 ) ) ( not ( = ?auto_71996 ?auto_71999 ) ) ( not ( = ?auto_71996 ?auto_72000 ) ) ( not ( = ?auto_71997 ?auto_71998 ) ) ( not ( = ?auto_71997 ?auto_71999 ) ) ( not ( = ?auto_71997 ?auto_72000 ) ) ( not ( = ?auto_71998 ?auto_71999 ) ) ( not ( = ?auto_71998 ?auto_72000 ) ) ( not ( = ?auto_71999 ?auto_72000 ) ) ( ON-TABLE ?auto_72000 ) ( ON ?auto_71999 ?auto_72000 ) ( ON ?auto_71998 ?auto_71999 ) ( ON ?auto_71997 ?auto_71998 ) ( CLEAR ?auto_71997 ) ( HOLDING ?auto_71996 ) ( CLEAR ?auto_71995 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71995 ?auto_71996 )
      ( MAKE-6PILE ?auto_71995 ?auto_71996 ?auto_71997 ?auto_71998 ?auto_71999 ?auto_72000 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72001 - BLOCK
      ?auto_72002 - BLOCK
      ?auto_72003 - BLOCK
      ?auto_72004 - BLOCK
      ?auto_72005 - BLOCK
      ?auto_72006 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72001 ) ( not ( = ?auto_72001 ?auto_72002 ) ) ( not ( = ?auto_72001 ?auto_72003 ) ) ( not ( = ?auto_72001 ?auto_72004 ) ) ( not ( = ?auto_72001 ?auto_72005 ) ) ( not ( = ?auto_72001 ?auto_72006 ) ) ( not ( = ?auto_72002 ?auto_72003 ) ) ( not ( = ?auto_72002 ?auto_72004 ) ) ( not ( = ?auto_72002 ?auto_72005 ) ) ( not ( = ?auto_72002 ?auto_72006 ) ) ( not ( = ?auto_72003 ?auto_72004 ) ) ( not ( = ?auto_72003 ?auto_72005 ) ) ( not ( = ?auto_72003 ?auto_72006 ) ) ( not ( = ?auto_72004 ?auto_72005 ) ) ( not ( = ?auto_72004 ?auto_72006 ) ) ( not ( = ?auto_72005 ?auto_72006 ) ) ( ON-TABLE ?auto_72006 ) ( ON ?auto_72005 ?auto_72006 ) ( ON ?auto_72004 ?auto_72005 ) ( ON ?auto_72003 ?auto_72004 ) ( CLEAR ?auto_72001 ) ( ON ?auto_72002 ?auto_72003 ) ( CLEAR ?auto_72002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72006 ?auto_72005 ?auto_72004 ?auto_72003 )
      ( MAKE-6PILE ?auto_72001 ?auto_72002 ?auto_72003 ?auto_72004 ?auto_72005 ?auto_72006 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72007 - BLOCK
      ?auto_72008 - BLOCK
      ?auto_72009 - BLOCK
      ?auto_72010 - BLOCK
      ?auto_72011 - BLOCK
      ?auto_72012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72007 ?auto_72008 ) ) ( not ( = ?auto_72007 ?auto_72009 ) ) ( not ( = ?auto_72007 ?auto_72010 ) ) ( not ( = ?auto_72007 ?auto_72011 ) ) ( not ( = ?auto_72007 ?auto_72012 ) ) ( not ( = ?auto_72008 ?auto_72009 ) ) ( not ( = ?auto_72008 ?auto_72010 ) ) ( not ( = ?auto_72008 ?auto_72011 ) ) ( not ( = ?auto_72008 ?auto_72012 ) ) ( not ( = ?auto_72009 ?auto_72010 ) ) ( not ( = ?auto_72009 ?auto_72011 ) ) ( not ( = ?auto_72009 ?auto_72012 ) ) ( not ( = ?auto_72010 ?auto_72011 ) ) ( not ( = ?auto_72010 ?auto_72012 ) ) ( not ( = ?auto_72011 ?auto_72012 ) ) ( ON-TABLE ?auto_72012 ) ( ON ?auto_72011 ?auto_72012 ) ( ON ?auto_72010 ?auto_72011 ) ( ON ?auto_72009 ?auto_72010 ) ( ON ?auto_72008 ?auto_72009 ) ( CLEAR ?auto_72008 ) ( HOLDING ?auto_72007 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72007 )
      ( MAKE-6PILE ?auto_72007 ?auto_72008 ?auto_72009 ?auto_72010 ?auto_72011 ?auto_72012 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72013 - BLOCK
      ?auto_72014 - BLOCK
      ?auto_72015 - BLOCK
      ?auto_72016 - BLOCK
      ?auto_72017 - BLOCK
      ?auto_72018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72013 ?auto_72014 ) ) ( not ( = ?auto_72013 ?auto_72015 ) ) ( not ( = ?auto_72013 ?auto_72016 ) ) ( not ( = ?auto_72013 ?auto_72017 ) ) ( not ( = ?auto_72013 ?auto_72018 ) ) ( not ( = ?auto_72014 ?auto_72015 ) ) ( not ( = ?auto_72014 ?auto_72016 ) ) ( not ( = ?auto_72014 ?auto_72017 ) ) ( not ( = ?auto_72014 ?auto_72018 ) ) ( not ( = ?auto_72015 ?auto_72016 ) ) ( not ( = ?auto_72015 ?auto_72017 ) ) ( not ( = ?auto_72015 ?auto_72018 ) ) ( not ( = ?auto_72016 ?auto_72017 ) ) ( not ( = ?auto_72016 ?auto_72018 ) ) ( not ( = ?auto_72017 ?auto_72018 ) ) ( ON-TABLE ?auto_72018 ) ( ON ?auto_72017 ?auto_72018 ) ( ON ?auto_72016 ?auto_72017 ) ( ON ?auto_72015 ?auto_72016 ) ( ON ?auto_72014 ?auto_72015 ) ( ON ?auto_72013 ?auto_72014 ) ( CLEAR ?auto_72013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72018 ?auto_72017 ?auto_72016 ?auto_72015 ?auto_72014 )
      ( MAKE-6PILE ?auto_72013 ?auto_72014 ?auto_72015 ?auto_72016 ?auto_72017 ?auto_72018 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72019 - BLOCK
      ?auto_72020 - BLOCK
      ?auto_72021 - BLOCK
      ?auto_72022 - BLOCK
      ?auto_72023 - BLOCK
      ?auto_72024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72019 ?auto_72020 ) ) ( not ( = ?auto_72019 ?auto_72021 ) ) ( not ( = ?auto_72019 ?auto_72022 ) ) ( not ( = ?auto_72019 ?auto_72023 ) ) ( not ( = ?auto_72019 ?auto_72024 ) ) ( not ( = ?auto_72020 ?auto_72021 ) ) ( not ( = ?auto_72020 ?auto_72022 ) ) ( not ( = ?auto_72020 ?auto_72023 ) ) ( not ( = ?auto_72020 ?auto_72024 ) ) ( not ( = ?auto_72021 ?auto_72022 ) ) ( not ( = ?auto_72021 ?auto_72023 ) ) ( not ( = ?auto_72021 ?auto_72024 ) ) ( not ( = ?auto_72022 ?auto_72023 ) ) ( not ( = ?auto_72022 ?auto_72024 ) ) ( not ( = ?auto_72023 ?auto_72024 ) ) ( ON-TABLE ?auto_72024 ) ( ON ?auto_72023 ?auto_72024 ) ( ON ?auto_72022 ?auto_72023 ) ( ON ?auto_72021 ?auto_72022 ) ( ON ?auto_72020 ?auto_72021 ) ( HOLDING ?auto_72019 ) ( CLEAR ?auto_72020 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72024 ?auto_72023 ?auto_72022 ?auto_72021 ?auto_72020 ?auto_72019 )
      ( MAKE-6PILE ?auto_72019 ?auto_72020 ?auto_72021 ?auto_72022 ?auto_72023 ?auto_72024 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72025 - BLOCK
      ?auto_72026 - BLOCK
      ?auto_72027 - BLOCK
      ?auto_72028 - BLOCK
      ?auto_72029 - BLOCK
      ?auto_72030 - BLOCK
    )
    :vars
    (
      ?auto_72031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72025 ?auto_72026 ) ) ( not ( = ?auto_72025 ?auto_72027 ) ) ( not ( = ?auto_72025 ?auto_72028 ) ) ( not ( = ?auto_72025 ?auto_72029 ) ) ( not ( = ?auto_72025 ?auto_72030 ) ) ( not ( = ?auto_72026 ?auto_72027 ) ) ( not ( = ?auto_72026 ?auto_72028 ) ) ( not ( = ?auto_72026 ?auto_72029 ) ) ( not ( = ?auto_72026 ?auto_72030 ) ) ( not ( = ?auto_72027 ?auto_72028 ) ) ( not ( = ?auto_72027 ?auto_72029 ) ) ( not ( = ?auto_72027 ?auto_72030 ) ) ( not ( = ?auto_72028 ?auto_72029 ) ) ( not ( = ?auto_72028 ?auto_72030 ) ) ( not ( = ?auto_72029 ?auto_72030 ) ) ( ON-TABLE ?auto_72030 ) ( ON ?auto_72029 ?auto_72030 ) ( ON ?auto_72028 ?auto_72029 ) ( ON ?auto_72027 ?auto_72028 ) ( ON ?auto_72026 ?auto_72027 ) ( CLEAR ?auto_72026 ) ( ON ?auto_72025 ?auto_72031 ) ( CLEAR ?auto_72025 ) ( HAND-EMPTY ) ( not ( = ?auto_72025 ?auto_72031 ) ) ( not ( = ?auto_72026 ?auto_72031 ) ) ( not ( = ?auto_72027 ?auto_72031 ) ) ( not ( = ?auto_72028 ?auto_72031 ) ) ( not ( = ?auto_72029 ?auto_72031 ) ) ( not ( = ?auto_72030 ?auto_72031 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72025 ?auto_72031 )
      ( MAKE-6PILE ?auto_72025 ?auto_72026 ?auto_72027 ?auto_72028 ?auto_72029 ?auto_72030 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72032 - BLOCK
      ?auto_72033 - BLOCK
      ?auto_72034 - BLOCK
      ?auto_72035 - BLOCK
      ?auto_72036 - BLOCK
      ?auto_72037 - BLOCK
    )
    :vars
    (
      ?auto_72038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72032 ?auto_72033 ) ) ( not ( = ?auto_72032 ?auto_72034 ) ) ( not ( = ?auto_72032 ?auto_72035 ) ) ( not ( = ?auto_72032 ?auto_72036 ) ) ( not ( = ?auto_72032 ?auto_72037 ) ) ( not ( = ?auto_72033 ?auto_72034 ) ) ( not ( = ?auto_72033 ?auto_72035 ) ) ( not ( = ?auto_72033 ?auto_72036 ) ) ( not ( = ?auto_72033 ?auto_72037 ) ) ( not ( = ?auto_72034 ?auto_72035 ) ) ( not ( = ?auto_72034 ?auto_72036 ) ) ( not ( = ?auto_72034 ?auto_72037 ) ) ( not ( = ?auto_72035 ?auto_72036 ) ) ( not ( = ?auto_72035 ?auto_72037 ) ) ( not ( = ?auto_72036 ?auto_72037 ) ) ( ON-TABLE ?auto_72037 ) ( ON ?auto_72036 ?auto_72037 ) ( ON ?auto_72035 ?auto_72036 ) ( ON ?auto_72034 ?auto_72035 ) ( ON ?auto_72032 ?auto_72038 ) ( CLEAR ?auto_72032 ) ( not ( = ?auto_72032 ?auto_72038 ) ) ( not ( = ?auto_72033 ?auto_72038 ) ) ( not ( = ?auto_72034 ?auto_72038 ) ) ( not ( = ?auto_72035 ?auto_72038 ) ) ( not ( = ?auto_72036 ?auto_72038 ) ) ( not ( = ?auto_72037 ?auto_72038 ) ) ( HOLDING ?auto_72033 ) ( CLEAR ?auto_72034 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72037 ?auto_72036 ?auto_72035 ?auto_72034 ?auto_72033 )
      ( MAKE-6PILE ?auto_72032 ?auto_72033 ?auto_72034 ?auto_72035 ?auto_72036 ?auto_72037 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72039 - BLOCK
      ?auto_72040 - BLOCK
      ?auto_72041 - BLOCK
      ?auto_72042 - BLOCK
      ?auto_72043 - BLOCK
      ?auto_72044 - BLOCK
    )
    :vars
    (
      ?auto_72045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72039 ?auto_72040 ) ) ( not ( = ?auto_72039 ?auto_72041 ) ) ( not ( = ?auto_72039 ?auto_72042 ) ) ( not ( = ?auto_72039 ?auto_72043 ) ) ( not ( = ?auto_72039 ?auto_72044 ) ) ( not ( = ?auto_72040 ?auto_72041 ) ) ( not ( = ?auto_72040 ?auto_72042 ) ) ( not ( = ?auto_72040 ?auto_72043 ) ) ( not ( = ?auto_72040 ?auto_72044 ) ) ( not ( = ?auto_72041 ?auto_72042 ) ) ( not ( = ?auto_72041 ?auto_72043 ) ) ( not ( = ?auto_72041 ?auto_72044 ) ) ( not ( = ?auto_72042 ?auto_72043 ) ) ( not ( = ?auto_72042 ?auto_72044 ) ) ( not ( = ?auto_72043 ?auto_72044 ) ) ( ON-TABLE ?auto_72044 ) ( ON ?auto_72043 ?auto_72044 ) ( ON ?auto_72042 ?auto_72043 ) ( ON ?auto_72041 ?auto_72042 ) ( ON ?auto_72039 ?auto_72045 ) ( not ( = ?auto_72039 ?auto_72045 ) ) ( not ( = ?auto_72040 ?auto_72045 ) ) ( not ( = ?auto_72041 ?auto_72045 ) ) ( not ( = ?auto_72042 ?auto_72045 ) ) ( not ( = ?auto_72043 ?auto_72045 ) ) ( not ( = ?auto_72044 ?auto_72045 ) ) ( CLEAR ?auto_72041 ) ( ON ?auto_72040 ?auto_72039 ) ( CLEAR ?auto_72040 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72045 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72045 ?auto_72039 )
      ( MAKE-6PILE ?auto_72039 ?auto_72040 ?auto_72041 ?auto_72042 ?auto_72043 ?auto_72044 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72046 - BLOCK
      ?auto_72047 - BLOCK
      ?auto_72048 - BLOCK
      ?auto_72049 - BLOCK
      ?auto_72050 - BLOCK
      ?auto_72051 - BLOCK
    )
    :vars
    (
      ?auto_72052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72046 ?auto_72047 ) ) ( not ( = ?auto_72046 ?auto_72048 ) ) ( not ( = ?auto_72046 ?auto_72049 ) ) ( not ( = ?auto_72046 ?auto_72050 ) ) ( not ( = ?auto_72046 ?auto_72051 ) ) ( not ( = ?auto_72047 ?auto_72048 ) ) ( not ( = ?auto_72047 ?auto_72049 ) ) ( not ( = ?auto_72047 ?auto_72050 ) ) ( not ( = ?auto_72047 ?auto_72051 ) ) ( not ( = ?auto_72048 ?auto_72049 ) ) ( not ( = ?auto_72048 ?auto_72050 ) ) ( not ( = ?auto_72048 ?auto_72051 ) ) ( not ( = ?auto_72049 ?auto_72050 ) ) ( not ( = ?auto_72049 ?auto_72051 ) ) ( not ( = ?auto_72050 ?auto_72051 ) ) ( ON-TABLE ?auto_72051 ) ( ON ?auto_72050 ?auto_72051 ) ( ON ?auto_72049 ?auto_72050 ) ( ON ?auto_72046 ?auto_72052 ) ( not ( = ?auto_72046 ?auto_72052 ) ) ( not ( = ?auto_72047 ?auto_72052 ) ) ( not ( = ?auto_72048 ?auto_72052 ) ) ( not ( = ?auto_72049 ?auto_72052 ) ) ( not ( = ?auto_72050 ?auto_72052 ) ) ( not ( = ?auto_72051 ?auto_72052 ) ) ( ON ?auto_72047 ?auto_72046 ) ( CLEAR ?auto_72047 ) ( ON-TABLE ?auto_72052 ) ( HOLDING ?auto_72048 ) ( CLEAR ?auto_72049 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72051 ?auto_72050 ?auto_72049 ?auto_72048 )
      ( MAKE-6PILE ?auto_72046 ?auto_72047 ?auto_72048 ?auto_72049 ?auto_72050 ?auto_72051 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72053 - BLOCK
      ?auto_72054 - BLOCK
      ?auto_72055 - BLOCK
      ?auto_72056 - BLOCK
      ?auto_72057 - BLOCK
      ?auto_72058 - BLOCK
    )
    :vars
    (
      ?auto_72059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72053 ?auto_72054 ) ) ( not ( = ?auto_72053 ?auto_72055 ) ) ( not ( = ?auto_72053 ?auto_72056 ) ) ( not ( = ?auto_72053 ?auto_72057 ) ) ( not ( = ?auto_72053 ?auto_72058 ) ) ( not ( = ?auto_72054 ?auto_72055 ) ) ( not ( = ?auto_72054 ?auto_72056 ) ) ( not ( = ?auto_72054 ?auto_72057 ) ) ( not ( = ?auto_72054 ?auto_72058 ) ) ( not ( = ?auto_72055 ?auto_72056 ) ) ( not ( = ?auto_72055 ?auto_72057 ) ) ( not ( = ?auto_72055 ?auto_72058 ) ) ( not ( = ?auto_72056 ?auto_72057 ) ) ( not ( = ?auto_72056 ?auto_72058 ) ) ( not ( = ?auto_72057 ?auto_72058 ) ) ( ON-TABLE ?auto_72058 ) ( ON ?auto_72057 ?auto_72058 ) ( ON ?auto_72056 ?auto_72057 ) ( ON ?auto_72053 ?auto_72059 ) ( not ( = ?auto_72053 ?auto_72059 ) ) ( not ( = ?auto_72054 ?auto_72059 ) ) ( not ( = ?auto_72055 ?auto_72059 ) ) ( not ( = ?auto_72056 ?auto_72059 ) ) ( not ( = ?auto_72057 ?auto_72059 ) ) ( not ( = ?auto_72058 ?auto_72059 ) ) ( ON ?auto_72054 ?auto_72053 ) ( ON-TABLE ?auto_72059 ) ( CLEAR ?auto_72056 ) ( ON ?auto_72055 ?auto_72054 ) ( CLEAR ?auto_72055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72059 ?auto_72053 ?auto_72054 )
      ( MAKE-6PILE ?auto_72053 ?auto_72054 ?auto_72055 ?auto_72056 ?auto_72057 ?auto_72058 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72060 - BLOCK
      ?auto_72061 - BLOCK
      ?auto_72062 - BLOCK
      ?auto_72063 - BLOCK
      ?auto_72064 - BLOCK
      ?auto_72065 - BLOCK
    )
    :vars
    (
      ?auto_72066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72060 ?auto_72061 ) ) ( not ( = ?auto_72060 ?auto_72062 ) ) ( not ( = ?auto_72060 ?auto_72063 ) ) ( not ( = ?auto_72060 ?auto_72064 ) ) ( not ( = ?auto_72060 ?auto_72065 ) ) ( not ( = ?auto_72061 ?auto_72062 ) ) ( not ( = ?auto_72061 ?auto_72063 ) ) ( not ( = ?auto_72061 ?auto_72064 ) ) ( not ( = ?auto_72061 ?auto_72065 ) ) ( not ( = ?auto_72062 ?auto_72063 ) ) ( not ( = ?auto_72062 ?auto_72064 ) ) ( not ( = ?auto_72062 ?auto_72065 ) ) ( not ( = ?auto_72063 ?auto_72064 ) ) ( not ( = ?auto_72063 ?auto_72065 ) ) ( not ( = ?auto_72064 ?auto_72065 ) ) ( ON-TABLE ?auto_72065 ) ( ON ?auto_72064 ?auto_72065 ) ( ON ?auto_72060 ?auto_72066 ) ( not ( = ?auto_72060 ?auto_72066 ) ) ( not ( = ?auto_72061 ?auto_72066 ) ) ( not ( = ?auto_72062 ?auto_72066 ) ) ( not ( = ?auto_72063 ?auto_72066 ) ) ( not ( = ?auto_72064 ?auto_72066 ) ) ( not ( = ?auto_72065 ?auto_72066 ) ) ( ON ?auto_72061 ?auto_72060 ) ( ON-TABLE ?auto_72066 ) ( ON ?auto_72062 ?auto_72061 ) ( CLEAR ?auto_72062 ) ( HOLDING ?auto_72063 ) ( CLEAR ?auto_72064 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72065 ?auto_72064 ?auto_72063 )
      ( MAKE-6PILE ?auto_72060 ?auto_72061 ?auto_72062 ?auto_72063 ?auto_72064 ?auto_72065 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72067 - BLOCK
      ?auto_72068 - BLOCK
      ?auto_72069 - BLOCK
      ?auto_72070 - BLOCK
      ?auto_72071 - BLOCK
      ?auto_72072 - BLOCK
    )
    :vars
    (
      ?auto_72073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72067 ?auto_72068 ) ) ( not ( = ?auto_72067 ?auto_72069 ) ) ( not ( = ?auto_72067 ?auto_72070 ) ) ( not ( = ?auto_72067 ?auto_72071 ) ) ( not ( = ?auto_72067 ?auto_72072 ) ) ( not ( = ?auto_72068 ?auto_72069 ) ) ( not ( = ?auto_72068 ?auto_72070 ) ) ( not ( = ?auto_72068 ?auto_72071 ) ) ( not ( = ?auto_72068 ?auto_72072 ) ) ( not ( = ?auto_72069 ?auto_72070 ) ) ( not ( = ?auto_72069 ?auto_72071 ) ) ( not ( = ?auto_72069 ?auto_72072 ) ) ( not ( = ?auto_72070 ?auto_72071 ) ) ( not ( = ?auto_72070 ?auto_72072 ) ) ( not ( = ?auto_72071 ?auto_72072 ) ) ( ON-TABLE ?auto_72072 ) ( ON ?auto_72071 ?auto_72072 ) ( ON ?auto_72067 ?auto_72073 ) ( not ( = ?auto_72067 ?auto_72073 ) ) ( not ( = ?auto_72068 ?auto_72073 ) ) ( not ( = ?auto_72069 ?auto_72073 ) ) ( not ( = ?auto_72070 ?auto_72073 ) ) ( not ( = ?auto_72071 ?auto_72073 ) ) ( not ( = ?auto_72072 ?auto_72073 ) ) ( ON ?auto_72068 ?auto_72067 ) ( ON-TABLE ?auto_72073 ) ( ON ?auto_72069 ?auto_72068 ) ( CLEAR ?auto_72071 ) ( ON ?auto_72070 ?auto_72069 ) ( CLEAR ?auto_72070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72073 ?auto_72067 ?auto_72068 ?auto_72069 )
      ( MAKE-6PILE ?auto_72067 ?auto_72068 ?auto_72069 ?auto_72070 ?auto_72071 ?auto_72072 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72074 - BLOCK
      ?auto_72075 - BLOCK
      ?auto_72076 - BLOCK
      ?auto_72077 - BLOCK
      ?auto_72078 - BLOCK
      ?auto_72079 - BLOCK
    )
    :vars
    (
      ?auto_72080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72074 ?auto_72075 ) ) ( not ( = ?auto_72074 ?auto_72076 ) ) ( not ( = ?auto_72074 ?auto_72077 ) ) ( not ( = ?auto_72074 ?auto_72078 ) ) ( not ( = ?auto_72074 ?auto_72079 ) ) ( not ( = ?auto_72075 ?auto_72076 ) ) ( not ( = ?auto_72075 ?auto_72077 ) ) ( not ( = ?auto_72075 ?auto_72078 ) ) ( not ( = ?auto_72075 ?auto_72079 ) ) ( not ( = ?auto_72076 ?auto_72077 ) ) ( not ( = ?auto_72076 ?auto_72078 ) ) ( not ( = ?auto_72076 ?auto_72079 ) ) ( not ( = ?auto_72077 ?auto_72078 ) ) ( not ( = ?auto_72077 ?auto_72079 ) ) ( not ( = ?auto_72078 ?auto_72079 ) ) ( ON-TABLE ?auto_72079 ) ( ON ?auto_72074 ?auto_72080 ) ( not ( = ?auto_72074 ?auto_72080 ) ) ( not ( = ?auto_72075 ?auto_72080 ) ) ( not ( = ?auto_72076 ?auto_72080 ) ) ( not ( = ?auto_72077 ?auto_72080 ) ) ( not ( = ?auto_72078 ?auto_72080 ) ) ( not ( = ?auto_72079 ?auto_72080 ) ) ( ON ?auto_72075 ?auto_72074 ) ( ON-TABLE ?auto_72080 ) ( ON ?auto_72076 ?auto_72075 ) ( ON ?auto_72077 ?auto_72076 ) ( CLEAR ?auto_72077 ) ( HOLDING ?auto_72078 ) ( CLEAR ?auto_72079 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72079 ?auto_72078 )
      ( MAKE-6PILE ?auto_72074 ?auto_72075 ?auto_72076 ?auto_72077 ?auto_72078 ?auto_72079 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72081 - BLOCK
      ?auto_72082 - BLOCK
      ?auto_72083 - BLOCK
      ?auto_72084 - BLOCK
      ?auto_72085 - BLOCK
      ?auto_72086 - BLOCK
    )
    :vars
    (
      ?auto_72087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72081 ?auto_72082 ) ) ( not ( = ?auto_72081 ?auto_72083 ) ) ( not ( = ?auto_72081 ?auto_72084 ) ) ( not ( = ?auto_72081 ?auto_72085 ) ) ( not ( = ?auto_72081 ?auto_72086 ) ) ( not ( = ?auto_72082 ?auto_72083 ) ) ( not ( = ?auto_72082 ?auto_72084 ) ) ( not ( = ?auto_72082 ?auto_72085 ) ) ( not ( = ?auto_72082 ?auto_72086 ) ) ( not ( = ?auto_72083 ?auto_72084 ) ) ( not ( = ?auto_72083 ?auto_72085 ) ) ( not ( = ?auto_72083 ?auto_72086 ) ) ( not ( = ?auto_72084 ?auto_72085 ) ) ( not ( = ?auto_72084 ?auto_72086 ) ) ( not ( = ?auto_72085 ?auto_72086 ) ) ( ON-TABLE ?auto_72086 ) ( ON ?auto_72081 ?auto_72087 ) ( not ( = ?auto_72081 ?auto_72087 ) ) ( not ( = ?auto_72082 ?auto_72087 ) ) ( not ( = ?auto_72083 ?auto_72087 ) ) ( not ( = ?auto_72084 ?auto_72087 ) ) ( not ( = ?auto_72085 ?auto_72087 ) ) ( not ( = ?auto_72086 ?auto_72087 ) ) ( ON ?auto_72082 ?auto_72081 ) ( ON-TABLE ?auto_72087 ) ( ON ?auto_72083 ?auto_72082 ) ( ON ?auto_72084 ?auto_72083 ) ( CLEAR ?auto_72086 ) ( ON ?auto_72085 ?auto_72084 ) ( CLEAR ?auto_72085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72087 ?auto_72081 ?auto_72082 ?auto_72083 ?auto_72084 )
      ( MAKE-6PILE ?auto_72081 ?auto_72082 ?auto_72083 ?auto_72084 ?auto_72085 ?auto_72086 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72088 - BLOCK
      ?auto_72089 - BLOCK
      ?auto_72090 - BLOCK
      ?auto_72091 - BLOCK
      ?auto_72092 - BLOCK
      ?auto_72093 - BLOCK
    )
    :vars
    (
      ?auto_72094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72088 ?auto_72089 ) ) ( not ( = ?auto_72088 ?auto_72090 ) ) ( not ( = ?auto_72088 ?auto_72091 ) ) ( not ( = ?auto_72088 ?auto_72092 ) ) ( not ( = ?auto_72088 ?auto_72093 ) ) ( not ( = ?auto_72089 ?auto_72090 ) ) ( not ( = ?auto_72089 ?auto_72091 ) ) ( not ( = ?auto_72089 ?auto_72092 ) ) ( not ( = ?auto_72089 ?auto_72093 ) ) ( not ( = ?auto_72090 ?auto_72091 ) ) ( not ( = ?auto_72090 ?auto_72092 ) ) ( not ( = ?auto_72090 ?auto_72093 ) ) ( not ( = ?auto_72091 ?auto_72092 ) ) ( not ( = ?auto_72091 ?auto_72093 ) ) ( not ( = ?auto_72092 ?auto_72093 ) ) ( ON ?auto_72088 ?auto_72094 ) ( not ( = ?auto_72088 ?auto_72094 ) ) ( not ( = ?auto_72089 ?auto_72094 ) ) ( not ( = ?auto_72090 ?auto_72094 ) ) ( not ( = ?auto_72091 ?auto_72094 ) ) ( not ( = ?auto_72092 ?auto_72094 ) ) ( not ( = ?auto_72093 ?auto_72094 ) ) ( ON ?auto_72089 ?auto_72088 ) ( ON-TABLE ?auto_72094 ) ( ON ?auto_72090 ?auto_72089 ) ( ON ?auto_72091 ?auto_72090 ) ( ON ?auto_72092 ?auto_72091 ) ( CLEAR ?auto_72092 ) ( HOLDING ?auto_72093 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72093 )
      ( MAKE-6PILE ?auto_72088 ?auto_72089 ?auto_72090 ?auto_72091 ?auto_72092 ?auto_72093 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72095 - BLOCK
      ?auto_72096 - BLOCK
      ?auto_72097 - BLOCK
      ?auto_72098 - BLOCK
      ?auto_72099 - BLOCK
      ?auto_72100 - BLOCK
    )
    :vars
    (
      ?auto_72101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72095 ?auto_72096 ) ) ( not ( = ?auto_72095 ?auto_72097 ) ) ( not ( = ?auto_72095 ?auto_72098 ) ) ( not ( = ?auto_72095 ?auto_72099 ) ) ( not ( = ?auto_72095 ?auto_72100 ) ) ( not ( = ?auto_72096 ?auto_72097 ) ) ( not ( = ?auto_72096 ?auto_72098 ) ) ( not ( = ?auto_72096 ?auto_72099 ) ) ( not ( = ?auto_72096 ?auto_72100 ) ) ( not ( = ?auto_72097 ?auto_72098 ) ) ( not ( = ?auto_72097 ?auto_72099 ) ) ( not ( = ?auto_72097 ?auto_72100 ) ) ( not ( = ?auto_72098 ?auto_72099 ) ) ( not ( = ?auto_72098 ?auto_72100 ) ) ( not ( = ?auto_72099 ?auto_72100 ) ) ( ON ?auto_72095 ?auto_72101 ) ( not ( = ?auto_72095 ?auto_72101 ) ) ( not ( = ?auto_72096 ?auto_72101 ) ) ( not ( = ?auto_72097 ?auto_72101 ) ) ( not ( = ?auto_72098 ?auto_72101 ) ) ( not ( = ?auto_72099 ?auto_72101 ) ) ( not ( = ?auto_72100 ?auto_72101 ) ) ( ON ?auto_72096 ?auto_72095 ) ( ON-TABLE ?auto_72101 ) ( ON ?auto_72097 ?auto_72096 ) ( ON ?auto_72098 ?auto_72097 ) ( ON ?auto_72099 ?auto_72098 ) ( ON ?auto_72100 ?auto_72099 ) ( CLEAR ?auto_72100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72101 ?auto_72095 ?auto_72096 ?auto_72097 ?auto_72098 ?auto_72099 )
      ( MAKE-6PILE ?auto_72095 ?auto_72096 ?auto_72097 ?auto_72098 ?auto_72099 ?auto_72100 ) )
  )

)

