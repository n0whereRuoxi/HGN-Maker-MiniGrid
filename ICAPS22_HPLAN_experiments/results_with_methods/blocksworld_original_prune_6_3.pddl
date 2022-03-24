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
      ?auto_39297 - BLOCK
      ?auto_39298 - BLOCK
      ?auto_39299 - BLOCK
      ?auto_39300 - BLOCK
      ?auto_39301 - BLOCK
      ?auto_39302 - BLOCK
    )
    :vars
    (
      ?auto_39303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39303 ?auto_39302 ) ( CLEAR ?auto_39303 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39297 ) ( ON ?auto_39298 ?auto_39297 ) ( ON ?auto_39299 ?auto_39298 ) ( ON ?auto_39300 ?auto_39299 ) ( ON ?auto_39301 ?auto_39300 ) ( ON ?auto_39302 ?auto_39301 ) ( not ( = ?auto_39297 ?auto_39298 ) ) ( not ( = ?auto_39297 ?auto_39299 ) ) ( not ( = ?auto_39297 ?auto_39300 ) ) ( not ( = ?auto_39297 ?auto_39301 ) ) ( not ( = ?auto_39297 ?auto_39302 ) ) ( not ( = ?auto_39297 ?auto_39303 ) ) ( not ( = ?auto_39298 ?auto_39299 ) ) ( not ( = ?auto_39298 ?auto_39300 ) ) ( not ( = ?auto_39298 ?auto_39301 ) ) ( not ( = ?auto_39298 ?auto_39302 ) ) ( not ( = ?auto_39298 ?auto_39303 ) ) ( not ( = ?auto_39299 ?auto_39300 ) ) ( not ( = ?auto_39299 ?auto_39301 ) ) ( not ( = ?auto_39299 ?auto_39302 ) ) ( not ( = ?auto_39299 ?auto_39303 ) ) ( not ( = ?auto_39300 ?auto_39301 ) ) ( not ( = ?auto_39300 ?auto_39302 ) ) ( not ( = ?auto_39300 ?auto_39303 ) ) ( not ( = ?auto_39301 ?auto_39302 ) ) ( not ( = ?auto_39301 ?auto_39303 ) ) ( not ( = ?auto_39302 ?auto_39303 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39303 ?auto_39302 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39305 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39305 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_39305 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39306 - BLOCK
    )
    :vars
    (
      ?auto_39307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39306 ?auto_39307 ) ( CLEAR ?auto_39306 ) ( HAND-EMPTY ) ( not ( = ?auto_39306 ?auto_39307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39306 ?auto_39307 )
      ( MAKE-1PILE ?auto_39306 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39313 - BLOCK
      ?auto_39314 - BLOCK
      ?auto_39315 - BLOCK
      ?auto_39316 - BLOCK
      ?auto_39317 - BLOCK
    )
    :vars
    (
      ?auto_39318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39318 ?auto_39317 ) ( CLEAR ?auto_39318 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39313 ) ( ON ?auto_39314 ?auto_39313 ) ( ON ?auto_39315 ?auto_39314 ) ( ON ?auto_39316 ?auto_39315 ) ( ON ?auto_39317 ?auto_39316 ) ( not ( = ?auto_39313 ?auto_39314 ) ) ( not ( = ?auto_39313 ?auto_39315 ) ) ( not ( = ?auto_39313 ?auto_39316 ) ) ( not ( = ?auto_39313 ?auto_39317 ) ) ( not ( = ?auto_39313 ?auto_39318 ) ) ( not ( = ?auto_39314 ?auto_39315 ) ) ( not ( = ?auto_39314 ?auto_39316 ) ) ( not ( = ?auto_39314 ?auto_39317 ) ) ( not ( = ?auto_39314 ?auto_39318 ) ) ( not ( = ?auto_39315 ?auto_39316 ) ) ( not ( = ?auto_39315 ?auto_39317 ) ) ( not ( = ?auto_39315 ?auto_39318 ) ) ( not ( = ?auto_39316 ?auto_39317 ) ) ( not ( = ?auto_39316 ?auto_39318 ) ) ( not ( = ?auto_39317 ?auto_39318 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39318 ?auto_39317 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39319 - BLOCK
      ?auto_39320 - BLOCK
      ?auto_39321 - BLOCK
      ?auto_39322 - BLOCK
      ?auto_39323 - BLOCK
    )
    :vars
    (
      ?auto_39324 - BLOCK
      ?auto_39325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39324 ?auto_39323 ) ( CLEAR ?auto_39324 ) ( ON-TABLE ?auto_39319 ) ( ON ?auto_39320 ?auto_39319 ) ( ON ?auto_39321 ?auto_39320 ) ( ON ?auto_39322 ?auto_39321 ) ( ON ?auto_39323 ?auto_39322 ) ( not ( = ?auto_39319 ?auto_39320 ) ) ( not ( = ?auto_39319 ?auto_39321 ) ) ( not ( = ?auto_39319 ?auto_39322 ) ) ( not ( = ?auto_39319 ?auto_39323 ) ) ( not ( = ?auto_39319 ?auto_39324 ) ) ( not ( = ?auto_39320 ?auto_39321 ) ) ( not ( = ?auto_39320 ?auto_39322 ) ) ( not ( = ?auto_39320 ?auto_39323 ) ) ( not ( = ?auto_39320 ?auto_39324 ) ) ( not ( = ?auto_39321 ?auto_39322 ) ) ( not ( = ?auto_39321 ?auto_39323 ) ) ( not ( = ?auto_39321 ?auto_39324 ) ) ( not ( = ?auto_39322 ?auto_39323 ) ) ( not ( = ?auto_39322 ?auto_39324 ) ) ( not ( = ?auto_39323 ?auto_39324 ) ) ( HOLDING ?auto_39325 ) ( not ( = ?auto_39319 ?auto_39325 ) ) ( not ( = ?auto_39320 ?auto_39325 ) ) ( not ( = ?auto_39321 ?auto_39325 ) ) ( not ( = ?auto_39322 ?auto_39325 ) ) ( not ( = ?auto_39323 ?auto_39325 ) ) ( not ( = ?auto_39324 ?auto_39325 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_39325 )
      ( MAKE-5PILE ?auto_39319 ?auto_39320 ?auto_39321 ?auto_39322 ?auto_39323 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39326 - BLOCK
      ?auto_39327 - BLOCK
      ?auto_39328 - BLOCK
      ?auto_39329 - BLOCK
      ?auto_39330 - BLOCK
    )
    :vars
    (
      ?auto_39331 - BLOCK
      ?auto_39332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39331 ?auto_39330 ) ( ON-TABLE ?auto_39326 ) ( ON ?auto_39327 ?auto_39326 ) ( ON ?auto_39328 ?auto_39327 ) ( ON ?auto_39329 ?auto_39328 ) ( ON ?auto_39330 ?auto_39329 ) ( not ( = ?auto_39326 ?auto_39327 ) ) ( not ( = ?auto_39326 ?auto_39328 ) ) ( not ( = ?auto_39326 ?auto_39329 ) ) ( not ( = ?auto_39326 ?auto_39330 ) ) ( not ( = ?auto_39326 ?auto_39331 ) ) ( not ( = ?auto_39327 ?auto_39328 ) ) ( not ( = ?auto_39327 ?auto_39329 ) ) ( not ( = ?auto_39327 ?auto_39330 ) ) ( not ( = ?auto_39327 ?auto_39331 ) ) ( not ( = ?auto_39328 ?auto_39329 ) ) ( not ( = ?auto_39328 ?auto_39330 ) ) ( not ( = ?auto_39328 ?auto_39331 ) ) ( not ( = ?auto_39329 ?auto_39330 ) ) ( not ( = ?auto_39329 ?auto_39331 ) ) ( not ( = ?auto_39330 ?auto_39331 ) ) ( not ( = ?auto_39326 ?auto_39332 ) ) ( not ( = ?auto_39327 ?auto_39332 ) ) ( not ( = ?auto_39328 ?auto_39332 ) ) ( not ( = ?auto_39329 ?auto_39332 ) ) ( not ( = ?auto_39330 ?auto_39332 ) ) ( not ( = ?auto_39331 ?auto_39332 ) ) ( ON ?auto_39332 ?auto_39331 ) ( CLEAR ?auto_39332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39326 ?auto_39327 ?auto_39328 ?auto_39329 ?auto_39330 ?auto_39331 )
      ( MAKE-5PILE ?auto_39326 ?auto_39327 ?auto_39328 ?auto_39329 ?auto_39330 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39335 - BLOCK
      ?auto_39336 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39336 ) ( CLEAR ?auto_39335 ) ( ON-TABLE ?auto_39335 ) ( not ( = ?auto_39335 ?auto_39336 ) ) )
    :subtasks
    ( ( !STACK ?auto_39336 ?auto_39335 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39337 - BLOCK
      ?auto_39338 - BLOCK
    )
    :vars
    (
      ?auto_39339 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39337 ) ( ON-TABLE ?auto_39337 ) ( not ( = ?auto_39337 ?auto_39338 ) ) ( ON ?auto_39338 ?auto_39339 ) ( CLEAR ?auto_39338 ) ( HAND-EMPTY ) ( not ( = ?auto_39337 ?auto_39339 ) ) ( not ( = ?auto_39338 ?auto_39339 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39338 ?auto_39339 )
      ( MAKE-2PILE ?auto_39337 ?auto_39338 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39340 - BLOCK
      ?auto_39341 - BLOCK
    )
    :vars
    (
      ?auto_39342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39340 ?auto_39341 ) ) ( ON ?auto_39341 ?auto_39342 ) ( CLEAR ?auto_39341 ) ( not ( = ?auto_39340 ?auto_39342 ) ) ( not ( = ?auto_39341 ?auto_39342 ) ) ( HOLDING ?auto_39340 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39340 )
      ( MAKE-2PILE ?auto_39340 ?auto_39341 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39343 - BLOCK
      ?auto_39344 - BLOCK
    )
    :vars
    (
      ?auto_39345 - BLOCK
      ?auto_39348 - BLOCK
      ?auto_39346 - BLOCK
      ?auto_39347 - BLOCK
      ?auto_39349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39343 ?auto_39344 ) ) ( ON ?auto_39344 ?auto_39345 ) ( not ( = ?auto_39343 ?auto_39345 ) ) ( not ( = ?auto_39344 ?auto_39345 ) ) ( ON ?auto_39343 ?auto_39344 ) ( CLEAR ?auto_39343 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39348 ) ( ON ?auto_39346 ?auto_39348 ) ( ON ?auto_39347 ?auto_39346 ) ( ON ?auto_39349 ?auto_39347 ) ( ON ?auto_39345 ?auto_39349 ) ( not ( = ?auto_39348 ?auto_39346 ) ) ( not ( = ?auto_39348 ?auto_39347 ) ) ( not ( = ?auto_39348 ?auto_39349 ) ) ( not ( = ?auto_39348 ?auto_39345 ) ) ( not ( = ?auto_39348 ?auto_39344 ) ) ( not ( = ?auto_39348 ?auto_39343 ) ) ( not ( = ?auto_39346 ?auto_39347 ) ) ( not ( = ?auto_39346 ?auto_39349 ) ) ( not ( = ?auto_39346 ?auto_39345 ) ) ( not ( = ?auto_39346 ?auto_39344 ) ) ( not ( = ?auto_39346 ?auto_39343 ) ) ( not ( = ?auto_39347 ?auto_39349 ) ) ( not ( = ?auto_39347 ?auto_39345 ) ) ( not ( = ?auto_39347 ?auto_39344 ) ) ( not ( = ?auto_39347 ?auto_39343 ) ) ( not ( = ?auto_39349 ?auto_39345 ) ) ( not ( = ?auto_39349 ?auto_39344 ) ) ( not ( = ?auto_39349 ?auto_39343 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39348 ?auto_39346 ?auto_39347 ?auto_39349 ?auto_39345 ?auto_39344 )
      ( MAKE-2PILE ?auto_39343 ?auto_39344 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39354 - BLOCK
      ?auto_39355 - BLOCK
      ?auto_39356 - BLOCK
      ?auto_39357 - BLOCK
    )
    :vars
    (
      ?auto_39358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39358 ?auto_39357 ) ( CLEAR ?auto_39358 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39354 ) ( ON ?auto_39355 ?auto_39354 ) ( ON ?auto_39356 ?auto_39355 ) ( ON ?auto_39357 ?auto_39356 ) ( not ( = ?auto_39354 ?auto_39355 ) ) ( not ( = ?auto_39354 ?auto_39356 ) ) ( not ( = ?auto_39354 ?auto_39357 ) ) ( not ( = ?auto_39354 ?auto_39358 ) ) ( not ( = ?auto_39355 ?auto_39356 ) ) ( not ( = ?auto_39355 ?auto_39357 ) ) ( not ( = ?auto_39355 ?auto_39358 ) ) ( not ( = ?auto_39356 ?auto_39357 ) ) ( not ( = ?auto_39356 ?auto_39358 ) ) ( not ( = ?auto_39357 ?auto_39358 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39358 ?auto_39357 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39359 - BLOCK
      ?auto_39360 - BLOCK
      ?auto_39361 - BLOCK
      ?auto_39362 - BLOCK
    )
    :vars
    (
      ?auto_39363 - BLOCK
      ?auto_39364 - BLOCK
      ?auto_39365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39363 ?auto_39362 ) ( CLEAR ?auto_39363 ) ( ON-TABLE ?auto_39359 ) ( ON ?auto_39360 ?auto_39359 ) ( ON ?auto_39361 ?auto_39360 ) ( ON ?auto_39362 ?auto_39361 ) ( not ( = ?auto_39359 ?auto_39360 ) ) ( not ( = ?auto_39359 ?auto_39361 ) ) ( not ( = ?auto_39359 ?auto_39362 ) ) ( not ( = ?auto_39359 ?auto_39363 ) ) ( not ( = ?auto_39360 ?auto_39361 ) ) ( not ( = ?auto_39360 ?auto_39362 ) ) ( not ( = ?auto_39360 ?auto_39363 ) ) ( not ( = ?auto_39361 ?auto_39362 ) ) ( not ( = ?auto_39361 ?auto_39363 ) ) ( not ( = ?auto_39362 ?auto_39363 ) ) ( HOLDING ?auto_39364 ) ( CLEAR ?auto_39365 ) ( not ( = ?auto_39359 ?auto_39364 ) ) ( not ( = ?auto_39359 ?auto_39365 ) ) ( not ( = ?auto_39360 ?auto_39364 ) ) ( not ( = ?auto_39360 ?auto_39365 ) ) ( not ( = ?auto_39361 ?auto_39364 ) ) ( not ( = ?auto_39361 ?auto_39365 ) ) ( not ( = ?auto_39362 ?auto_39364 ) ) ( not ( = ?auto_39362 ?auto_39365 ) ) ( not ( = ?auto_39363 ?auto_39364 ) ) ( not ( = ?auto_39363 ?auto_39365 ) ) ( not ( = ?auto_39364 ?auto_39365 ) ) )
    :subtasks
    ( ( !STACK ?auto_39364 ?auto_39365 )
      ( MAKE-4PILE ?auto_39359 ?auto_39360 ?auto_39361 ?auto_39362 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39965 - BLOCK
      ?auto_39966 - BLOCK
      ?auto_39967 - BLOCK
      ?auto_39968 - BLOCK
    )
    :vars
    (
      ?auto_39970 - BLOCK
      ?auto_39969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39970 ?auto_39968 ) ( ON-TABLE ?auto_39965 ) ( ON ?auto_39966 ?auto_39965 ) ( ON ?auto_39967 ?auto_39966 ) ( ON ?auto_39968 ?auto_39967 ) ( not ( = ?auto_39965 ?auto_39966 ) ) ( not ( = ?auto_39965 ?auto_39967 ) ) ( not ( = ?auto_39965 ?auto_39968 ) ) ( not ( = ?auto_39965 ?auto_39970 ) ) ( not ( = ?auto_39966 ?auto_39967 ) ) ( not ( = ?auto_39966 ?auto_39968 ) ) ( not ( = ?auto_39966 ?auto_39970 ) ) ( not ( = ?auto_39967 ?auto_39968 ) ) ( not ( = ?auto_39967 ?auto_39970 ) ) ( not ( = ?auto_39968 ?auto_39970 ) ) ( not ( = ?auto_39965 ?auto_39969 ) ) ( not ( = ?auto_39966 ?auto_39969 ) ) ( not ( = ?auto_39967 ?auto_39969 ) ) ( not ( = ?auto_39968 ?auto_39969 ) ) ( not ( = ?auto_39970 ?auto_39969 ) ) ( ON ?auto_39969 ?auto_39970 ) ( CLEAR ?auto_39969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39965 ?auto_39966 ?auto_39967 ?auto_39968 ?auto_39970 )
      ( MAKE-4PILE ?auto_39965 ?auto_39966 ?auto_39967 ?auto_39968 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39373 - BLOCK
      ?auto_39374 - BLOCK
      ?auto_39375 - BLOCK
      ?auto_39376 - BLOCK
    )
    :vars
    (
      ?auto_39379 - BLOCK
      ?auto_39377 - BLOCK
      ?auto_39378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39379 ?auto_39376 ) ( ON-TABLE ?auto_39373 ) ( ON ?auto_39374 ?auto_39373 ) ( ON ?auto_39375 ?auto_39374 ) ( ON ?auto_39376 ?auto_39375 ) ( not ( = ?auto_39373 ?auto_39374 ) ) ( not ( = ?auto_39373 ?auto_39375 ) ) ( not ( = ?auto_39373 ?auto_39376 ) ) ( not ( = ?auto_39373 ?auto_39379 ) ) ( not ( = ?auto_39374 ?auto_39375 ) ) ( not ( = ?auto_39374 ?auto_39376 ) ) ( not ( = ?auto_39374 ?auto_39379 ) ) ( not ( = ?auto_39375 ?auto_39376 ) ) ( not ( = ?auto_39375 ?auto_39379 ) ) ( not ( = ?auto_39376 ?auto_39379 ) ) ( not ( = ?auto_39373 ?auto_39377 ) ) ( not ( = ?auto_39373 ?auto_39378 ) ) ( not ( = ?auto_39374 ?auto_39377 ) ) ( not ( = ?auto_39374 ?auto_39378 ) ) ( not ( = ?auto_39375 ?auto_39377 ) ) ( not ( = ?auto_39375 ?auto_39378 ) ) ( not ( = ?auto_39376 ?auto_39377 ) ) ( not ( = ?auto_39376 ?auto_39378 ) ) ( not ( = ?auto_39379 ?auto_39377 ) ) ( not ( = ?auto_39379 ?auto_39378 ) ) ( not ( = ?auto_39377 ?auto_39378 ) ) ( ON ?auto_39377 ?auto_39379 ) ( CLEAR ?auto_39377 ) ( HOLDING ?auto_39378 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39378 )
      ( MAKE-4PILE ?auto_39373 ?auto_39374 ?auto_39375 ?auto_39376 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39380 - BLOCK
      ?auto_39381 - BLOCK
      ?auto_39382 - BLOCK
      ?auto_39383 - BLOCK
    )
    :vars
    (
      ?auto_39386 - BLOCK
      ?auto_39384 - BLOCK
      ?auto_39385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39386 ?auto_39383 ) ( ON-TABLE ?auto_39380 ) ( ON ?auto_39381 ?auto_39380 ) ( ON ?auto_39382 ?auto_39381 ) ( ON ?auto_39383 ?auto_39382 ) ( not ( = ?auto_39380 ?auto_39381 ) ) ( not ( = ?auto_39380 ?auto_39382 ) ) ( not ( = ?auto_39380 ?auto_39383 ) ) ( not ( = ?auto_39380 ?auto_39386 ) ) ( not ( = ?auto_39381 ?auto_39382 ) ) ( not ( = ?auto_39381 ?auto_39383 ) ) ( not ( = ?auto_39381 ?auto_39386 ) ) ( not ( = ?auto_39382 ?auto_39383 ) ) ( not ( = ?auto_39382 ?auto_39386 ) ) ( not ( = ?auto_39383 ?auto_39386 ) ) ( not ( = ?auto_39380 ?auto_39384 ) ) ( not ( = ?auto_39380 ?auto_39385 ) ) ( not ( = ?auto_39381 ?auto_39384 ) ) ( not ( = ?auto_39381 ?auto_39385 ) ) ( not ( = ?auto_39382 ?auto_39384 ) ) ( not ( = ?auto_39382 ?auto_39385 ) ) ( not ( = ?auto_39383 ?auto_39384 ) ) ( not ( = ?auto_39383 ?auto_39385 ) ) ( not ( = ?auto_39386 ?auto_39384 ) ) ( not ( = ?auto_39386 ?auto_39385 ) ) ( not ( = ?auto_39384 ?auto_39385 ) ) ( ON ?auto_39384 ?auto_39386 ) ( ON ?auto_39385 ?auto_39384 ) ( CLEAR ?auto_39385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39380 ?auto_39381 ?auto_39382 ?auto_39383 ?auto_39386 ?auto_39384 )
      ( MAKE-4PILE ?auto_39380 ?auto_39381 ?auto_39382 ?auto_39383 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39390 - BLOCK
      ?auto_39391 - BLOCK
      ?auto_39392 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39392 ) ( CLEAR ?auto_39391 ) ( ON-TABLE ?auto_39390 ) ( ON ?auto_39391 ?auto_39390 ) ( not ( = ?auto_39390 ?auto_39391 ) ) ( not ( = ?auto_39390 ?auto_39392 ) ) ( not ( = ?auto_39391 ?auto_39392 ) ) )
    :subtasks
    ( ( !STACK ?auto_39392 ?auto_39391 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39393 - BLOCK
      ?auto_39394 - BLOCK
      ?auto_39395 - BLOCK
    )
    :vars
    (
      ?auto_39396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39394 ) ( ON-TABLE ?auto_39393 ) ( ON ?auto_39394 ?auto_39393 ) ( not ( = ?auto_39393 ?auto_39394 ) ) ( not ( = ?auto_39393 ?auto_39395 ) ) ( not ( = ?auto_39394 ?auto_39395 ) ) ( ON ?auto_39395 ?auto_39396 ) ( CLEAR ?auto_39395 ) ( HAND-EMPTY ) ( not ( = ?auto_39393 ?auto_39396 ) ) ( not ( = ?auto_39394 ?auto_39396 ) ) ( not ( = ?auto_39395 ?auto_39396 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39395 ?auto_39396 )
      ( MAKE-3PILE ?auto_39393 ?auto_39394 ?auto_39395 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39397 - BLOCK
      ?auto_39398 - BLOCK
      ?auto_39399 - BLOCK
    )
    :vars
    (
      ?auto_39400 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39397 ) ( not ( = ?auto_39397 ?auto_39398 ) ) ( not ( = ?auto_39397 ?auto_39399 ) ) ( not ( = ?auto_39398 ?auto_39399 ) ) ( ON ?auto_39399 ?auto_39400 ) ( CLEAR ?auto_39399 ) ( not ( = ?auto_39397 ?auto_39400 ) ) ( not ( = ?auto_39398 ?auto_39400 ) ) ( not ( = ?auto_39399 ?auto_39400 ) ) ( HOLDING ?auto_39398 ) ( CLEAR ?auto_39397 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39397 ?auto_39398 )
      ( MAKE-3PILE ?auto_39397 ?auto_39398 ?auto_39399 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39401 - BLOCK
      ?auto_39402 - BLOCK
      ?auto_39403 - BLOCK
    )
    :vars
    (
      ?auto_39404 - BLOCK
      ?auto_39406 - BLOCK
      ?auto_39405 - BLOCK
      ?auto_39407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39401 ) ( not ( = ?auto_39401 ?auto_39402 ) ) ( not ( = ?auto_39401 ?auto_39403 ) ) ( not ( = ?auto_39402 ?auto_39403 ) ) ( ON ?auto_39403 ?auto_39404 ) ( not ( = ?auto_39401 ?auto_39404 ) ) ( not ( = ?auto_39402 ?auto_39404 ) ) ( not ( = ?auto_39403 ?auto_39404 ) ) ( CLEAR ?auto_39401 ) ( ON ?auto_39402 ?auto_39403 ) ( CLEAR ?auto_39402 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39406 ) ( ON ?auto_39405 ?auto_39406 ) ( ON ?auto_39407 ?auto_39405 ) ( ON ?auto_39404 ?auto_39407 ) ( not ( = ?auto_39406 ?auto_39405 ) ) ( not ( = ?auto_39406 ?auto_39407 ) ) ( not ( = ?auto_39406 ?auto_39404 ) ) ( not ( = ?auto_39406 ?auto_39403 ) ) ( not ( = ?auto_39406 ?auto_39402 ) ) ( not ( = ?auto_39405 ?auto_39407 ) ) ( not ( = ?auto_39405 ?auto_39404 ) ) ( not ( = ?auto_39405 ?auto_39403 ) ) ( not ( = ?auto_39405 ?auto_39402 ) ) ( not ( = ?auto_39407 ?auto_39404 ) ) ( not ( = ?auto_39407 ?auto_39403 ) ) ( not ( = ?auto_39407 ?auto_39402 ) ) ( not ( = ?auto_39401 ?auto_39406 ) ) ( not ( = ?auto_39401 ?auto_39405 ) ) ( not ( = ?auto_39401 ?auto_39407 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39406 ?auto_39405 ?auto_39407 ?auto_39404 ?auto_39403 )
      ( MAKE-3PILE ?auto_39401 ?auto_39402 ?auto_39403 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39408 - BLOCK
      ?auto_39409 - BLOCK
      ?auto_39410 - BLOCK
    )
    :vars
    (
      ?auto_39413 - BLOCK
      ?auto_39412 - BLOCK
      ?auto_39414 - BLOCK
      ?auto_39411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39408 ?auto_39409 ) ) ( not ( = ?auto_39408 ?auto_39410 ) ) ( not ( = ?auto_39409 ?auto_39410 ) ) ( ON ?auto_39410 ?auto_39413 ) ( not ( = ?auto_39408 ?auto_39413 ) ) ( not ( = ?auto_39409 ?auto_39413 ) ) ( not ( = ?auto_39410 ?auto_39413 ) ) ( ON ?auto_39409 ?auto_39410 ) ( CLEAR ?auto_39409 ) ( ON-TABLE ?auto_39412 ) ( ON ?auto_39414 ?auto_39412 ) ( ON ?auto_39411 ?auto_39414 ) ( ON ?auto_39413 ?auto_39411 ) ( not ( = ?auto_39412 ?auto_39414 ) ) ( not ( = ?auto_39412 ?auto_39411 ) ) ( not ( = ?auto_39412 ?auto_39413 ) ) ( not ( = ?auto_39412 ?auto_39410 ) ) ( not ( = ?auto_39412 ?auto_39409 ) ) ( not ( = ?auto_39414 ?auto_39411 ) ) ( not ( = ?auto_39414 ?auto_39413 ) ) ( not ( = ?auto_39414 ?auto_39410 ) ) ( not ( = ?auto_39414 ?auto_39409 ) ) ( not ( = ?auto_39411 ?auto_39413 ) ) ( not ( = ?auto_39411 ?auto_39410 ) ) ( not ( = ?auto_39411 ?auto_39409 ) ) ( not ( = ?auto_39408 ?auto_39412 ) ) ( not ( = ?auto_39408 ?auto_39414 ) ) ( not ( = ?auto_39408 ?auto_39411 ) ) ( HOLDING ?auto_39408 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39408 )
      ( MAKE-3PILE ?auto_39408 ?auto_39409 ?auto_39410 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39415 - BLOCK
      ?auto_39416 - BLOCK
      ?auto_39417 - BLOCK
    )
    :vars
    (
      ?auto_39418 - BLOCK
      ?auto_39421 - BLOCK
      ?auto_39420 - BLOCK
      ?auto_39419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39415 ?auto_39416 ) ) ( not ( = ?auto_39415 ?auto_39417 ) ) ( not ( = ?auto_39416 ?auto_39417 ) ) ( ON ?auto_39417 ?auto_39418 ) ( not ( = ?auto_39415 ?auto_39418 ) ) ( not ( = ?auto_39416 ?auto_39418 ) ) ( not ( = ?auto_39417 ?auto_39418 ) ) ( ON ?auto_39416 ?auto_39417 ) ( ON-TABLE ?auto_39421 ) ( ON ?auto_39420 ?auto_39421 ) ( ON ?auto_39419 ?auto_39420 ) ( ON ?auto_39418 ?auto_39419 ) ( not ( = ?auto_39421 ?auto_39420 ) ) ( not ( = ?auto_39421 ?auto_39419 ) ) ( not ( = ?auto_39421 ?auto_39418 ) ) ( not ( = ?auto_39421 ?auto_39417 ) ) ( not ( = ?auto_39421 ?auto_39416 ) ) ( not ( = ?auto_39420 ?auto_39419 ) ) ( not ( = ?auto_39420 ?auto_39418 ) ) ( not ( = ?auto_39420 ?auto_39417 ) ) ( not ( = ?auto_39420 ?auto_39416 ) ) ( not ( = ?auto_39419 ?auto_39418 ) ) ( not ( = ?auto_39419 ?auto_39417 ) ) ( not ( = ?auto_39419 ?auto_39416 ) ) ( not ( = ?auto_39415 ?auto_39421 ) ) ( not ( = ?auto_39415 ?auto_39420 ) ) ( not ( = ?auto_39415 ?auto_39419 ) ) ( ON ?auto_39415 ?auto_39416 ) ( CLEAR ?auto_39415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39421 ?auto_39420 ?auto_39419 ?auto_39418 ?auto_39417 ?auto_39416 )
      ( MAKE-3PILE ?auto_39415 ?auto_39416 ?auto_39417 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39425 - BLOCK
      ?auto_39426 - BLOCK
      ?auto_39427 - BLOCK
    )
    :vars
    (
      ?auto_39428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39428 ?auto_39427 ) ( CLEAR ?auto_39428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39425 ) ( ON ?auto_39426 ?auto_39425 ) ( ON ?auto_39427 ?auto_39426 ) ( not ( = ?auto_39425 ?auto_39426 ) ) ( not ( = ?auto_39425 ?auto_39427 ) ) ( not ( = ?auto_39425 ?auto_39428 ) ) ( not ( = ?auto_39426 ?auto_39427 ) ) ( not ( = ?auto_39426 ?auto_39428 ) ) ( not ( = ?auto_39427 ?auto_39428 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39428 ?auto_39427 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39429 - BLOCK
      ?auto_39430 - BLOCK
      ?auto_39431 - BLOCK
    )
    :vars
    (
      ?auto_39432 - BLOCK
      ?auto_39433 - BLOCK
      ?auto_39434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39432 ?auto_39431 ) ( CLEAR ?auto_39432 ) ( ON-TABLE ?auto_39429 ) ( ON ?auto_39430 ?auto_39429 ) ( ON ?auto_39431 ?auto_39430 ) ( not ( = ?auto_39429 ?auto_39430 ) ) ( not ( = ?auto_39429 ?auto_39431 ) ) ( not ( = ?auto_39429 ?auto_39432 ) ) ( not ( = ?auto_39430 ?auto_39431 ) ) ( not ( = ?auto_39430 ?auto_39432 ) ) ( not ( = ?auto_39431 ?auto_39432 ) ) ( HOLDING ?auto_39433 ) ( CLEAR ?auto_39434 ) ( not ( = ?auto_39429 ?auto_39433 ) ) ( not ( = ?auto_39429 ?auto_39434 ) ) ( not ( = ?auto_39430 ?auto_39433 ) ) ( not ( = ?auto_39430 ?auto_39434 ) ) ( not ( = ?auto_39431 ?auto_39433 ) ) ( not ( = ?auto_39431 ?auto_39434 ) ) ( not ( = ?auto_39432 ?auto_39433 ) ) ( not ( = ?auto_39432 ?auto_39434 ) ) ( not ( = ?auto_39433 ?auto_39434 ) ) )
    :subtasks
    ( ( !STACK ?auto_39433 ?auto_39434 )
      ( MAKE-3PILE ?auto_39429 ?auto_39430 ?auto_39431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39435 - BLOCK
      ?auto_39436 - BLOCK
      ?auto_39437 - BLOCK
    )
    :vars
    (
      ?auto_39438 - BLOCK
      ?auto_39439 - BLOCK
      ?auto_39440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39438 ?auto_39437 ) ( ON-TABLE ?auto_39435 ) ( ON ?auto_39436 ?auto_39435 ) ( ON ?auto_39437 ?auto_39436 ) ( not ( = ?auto_39435 ?auto_39436 ) ) ( not ( = ?auto_39435 ?auto_39437 ) ) ( not ( = ?auto_39435 ?auto_39438 ) ) ( not ( = ?auto_39436 ?auto_39437 ) ) ( not ( = ?auto_39436 ?auto_39438 ) ) ( not ( = ?auto_39437 ?auto_39438 ) ) ( CLEAR ?auto_39439 ) ( not ( = ?auto_39435 ?auto_39440 ) ) ( not ( = ?auto_39435 ?auto_39439 ) ) ( not ( = ?auto_39436 ?auto_39440 ) ) ( not ( = ?auto_39436 ?auto_39439 ) ) ( not ( = ?auto_39437 ?auto_39440 ) ) ( not ( = ?auto_39437 ?auto_39439 ) ) ( not ( = ?auto_39438 ?auto_39440 ) ) ( not ( = ?auto_39438 ?auto_39439 ) ) ( not ( = ?auto_39440 ?auto_39439 ) ) ( ON ?auto_39440 ?auto_39438 ) ( CLEAR ?auto_39440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39435 ?auto_39436 ?auto_39437 ?auto_39438 )
      ( MAKE-3PILE ?auto_39435 ?auto_39436 ?auto_39437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39441 - BLOCK
      ?auto_39442 - BLOCK
      ?auto_39443 - BLOCK
    )
    :vars
    (
      ?auto_39445 - BLOCK
      ?auto_39446 - BLOCK
      ?auto_39444 - BLOCK
      ?auto_39447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39445 ?auto_39443 ) ( ON-TABLE ?auto_39441 ) ( ON ?auto_39442 ?auto_39441 ) ( ON ?auto_39443 ?auto_39442 ) ( not ( = ?auto_39441 ?auto_39442 ) ) ( not ( = ?auto_39441 ?auto_39443 ) ) ( not ( = ?auto_39441 ?auto_39445 ) ) ( not ( = ?auto_39442 ?auto_39443 ) ) ( not ( = ?auto_39442 ?auto_39445 ) ) ( not ( = ?auto_39443 ?auto_39445 ) ) ( not ( = ?auto_39441 ?auto_39446 ) ) ( not ( = ?auto_39441 ?auto_39444 ) ) ( not ( = ?auto_39442 ?auto_39446 ) ) ( not ( = ?auto_39442 ?auto_39444 ) ) ( not ( = ?auto_39443 ?auto_39446 ) ) ( not ( = ?auto_39443 ?auto_39444 ) ) ( not ( = ?auto_39445 ?auto_39446 ) ) ( not ( = ?auto_39445 ?auto_39444 ) ) ( not ( = ?auto_39446 ?auto_39444 ) ) ( ON ?auto_39446 ?auto_39445 ) ( CLEAR ?auto_39446 ) ( HOLDING ?auto_39444 ) ( CLEAR ?auto_39447 ) ( ON-TABLE ?auto_39447 ) ( not ( = ?auto_39447 ?auto_39444 ) ) ( not ( = ?auto_39441 ?auto_39447 ) ) ( not ( = ?auto_39442 ?auto_39447 ) ) ( not ( = ?auto_39443 ?auto_39447 ) ) ( not ( = ?auto_39445 ?auto_39447 ) ) ( not ( = ?auto_39446 ?auto_39447 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39447 ?auto_39444 )
      ( MAKE-3PILE ?auto_39441 ?auto_39442 ?auto_39443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40139 - BLOCK
      ?auto_40140 - BLOCK
      ?auto_40141 - BLOCK
    )
    :vars
    (
      ?auto_40142 - BLOCK
      ?auto_40143 - BLOCK
      ?auto_40144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40142 ?auto_40141 ) ( ON-TABLE ?auto_40139 ) ( ON ?auto_40140 ?auto_40139 ) ( ON ?auto_40141 ?auto_40140 ) ( not ( = ?auto_40139 ?auto_40140 ) ) ( not ( = ?auto_40139 ?auto_40141 ) ) ( not ( = ?auto_40139 ?auto_40142 ) ) ( not ( = ?auto_40140 ?auto_40141 ) ) ( not ( = ?auto_40140 ?auto_40142 ) ) ( not ( = ?auto_40141 ?auto_40142 ) ) ( not ( = ?auto_40139 ?auto_40143 ) ) ( not ( = ?auto_40139 ?auto_40144 ) ) ( not ( = ?auto_40140 ?auto_40143 ) ) ( not ( = ?auto_40140 ?auto_40144 ) ) ( not ( = ?auto_40141 ?auto_40143 ) ) ( not ( = ?auto_40141 ?auto_40144 ) ) ( not ( = ?auto_40142 ?auto_40143 ) ) ( not ( = ?auto_40142 ?auto_40144 ) ) ( not ( = ?auto_40143 ?auto_40144 ) ) ( ON ?auto_40143 ?auto_40142 ) ( ON ?auto_40144 ?auto_40143 ) ( CLEAR ?auto_40144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40139 ?auto_40140 ?auto_40141 ?auto_40142 ?auto_40143 )
      ( MAKE-3PILE ?auto_40139 ?auto_40140 ?auto_40141 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39455 - BLOCK
      ?auto_39456 - BLOCK
      ?auto_39457 - BLOCK
    )
    :vars
    (
      ?auto_39461 - BLOCK
      ?auto_39459 - BLOCK
      ?auto_39458 - BLOCK
      ?auto_39460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39461 ?auto_39457 ) ( ON-TABLE ?auto_39455 ) ( ON ?auto_39456 ?auto_39455 ) ( ON ?auto_39457 ?auto_39456 ) ( not ( = ?auto_39455 ?auto_39456 ) ) ( not ( = ?auto_39455 ?auto_39457 ) ) ( not ( = ?auto_39455 ?auto_39461 ) ) ( not ( = ?auto_39456 ?auto_39457 ) ) ( not ( = ?auto_39456 ?auto_39461 ) ) ( not ( = ?auto_39457 ?auto_39461 ) ) ( not ( = ?auto_39455 ?auto_39459 ) ) ( not ( = ?auto_39455 ?auto_39458 ) ) ( not ( = ?auto_39456 ?auto_39459 ) ) ( not ( = ?auto_39456 ?auto_39458 ) ) ( not ( = ?auto_39457 ?auto_39459 ) ) ( not ( = ?auto_39457 ?auto_39458 ) ) ( not ( = ?auto_39461 ?auto_39459 ) ) ( not ( = ?auto_39461 ?auto_39458 ) ) ( not ( = ?auto_39459 ?auto_39458 ) ) ( ON ?auto_39459 ?auto_39461 ) ( not ( = ?auto_39460 ?auto_39458 ) ) ( not ( = ?auto_39455 ?auto_39460 ) ) ( not ( = ?auto_39456 ?auto_39460 ) ) ( not ( = ?auto_39457 ?auto_39460 ) ) ( not ( = ?auto_39461 ?auto_39460 ) ) ( not ( = ?auto_39459 ?auto_39460 ) ) ( ON ?auto_39458 ?auto_39459 ) ( CLEAR ?auto_39458 ) ( HOLDING ?auto_39460 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39460 )
      ( MAKE-3PILE ?auto_39455 ?auto_39456 ?auto_39457 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_39462 - BLOCK
      ?auto_39463 - BLOCK
      ?auto_39464 - BLOCK
    )
    :vars
    (
      ?auto_39468 - BLOCK
      ?auto_39466 - BLOCK
      ?auto_39467 - BLOCK
      ?auto_39465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39468 ?auto_39464 ) ( ON-TABLE ?auto_39462 ) ( ON ?auto_39463 ?auto_39462 ) ( ON ?auto_39464 ?auto_39463 ) ( not ( = ?auto_39462 ?auto_39463 ) ) ( not ( = ?auto_39462 ?auto_39464 ) ) ( not ( = ?auto_39462 ?auto_39468 ) ) ( not ( = ?auto_39463 ?auto_39464 ) ) ( not ( = ?auto_39463 ?auto_39468 ) ) ( not ( = ?auto_39464 ?auto_39468 ) ) ( not ( = ?auto_39462 ?auto_39466 ) ) ( not ( = ?auto_39462 ?auto_39467 ) ) ( not ( = ?auto_39463 ?auto_39466 ) ) ( not ( = ?auto_39463 ?auto_39467 ) ) ( not ( = ?auto_39464 ?auto_39466 ) ) ( not ( = ?auto_39464 ?auto_39467 ) ) ( not ( = ?auto_39468 ?auto_39466 ) ) ( not ( = ?auto_39468 ?auto_39467 ) ) ( not ( = ?auto_39466 ?auto_39467 ) ) ( ON ?auto_39466 ?auto_39468 ) ( not ( = ?auto_39465 ?auto_39467 ) ) ( not ( = ?auto_39462 ?auto_39465 ) ) ( not ( = ?auto_39463 ?auto_39465 ) ) ( not ( = ?auto_39464 ?auto_39465 ) ) ( not ( = ?auto_39468 ?auto_39465 ) ) ( not ( = ?auto_39466 ?auto_39465 ) ) ( ON ?auto_39467 ?auto_39466 ) ( ON ?auto_39465 ?auto_39467 ) ( CLEAR ?auto_39465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39462 ?auto_39463 ?auto_39464 ?auto_39468 ?auto_39466 ?auto_39467 )
      ( MAKE-3PILE ?auto_39462 ?auto_39463 ?auto_39464 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39473 - BLOCK
      ?auto_39474 - BLOCK
      ?auto_39475 - BLOCK
      ?auto_39476 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39476 ) ( CLEAR ?auto_39475 ) ( ON-TABLE ?auto_39473 ) ( ON ?auto_39474 ?auto_39473 ) ( ON ?auto_39475 ?auto_39474 ) ( not ( = ?auto_39473 ?auto_39474 ) ) ( not ( = ?auto_39473 ?auto_39475 ) ) ( not ( = ?auto_39473 ?auto_39476 ) ) ( not ( = ?auto_39474 ?auto_39475 ) ) ( not ( = ?auto_39474 ?auto_39476 ) ) ( not ( = ?auto_39475 ?auto_39476 ) ) )
    :subtasks
    ( ( !STACK ?auto_39476 ?auto_39475 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39477 - BLOCK
      ?auto_39478 - BLOCK
      ?auto_39479 - BLOCK
      ?auto_39480 - BLOCK
    )
    :vars
    (
      ?auto_39481 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39479 ) ( ON-TABLE ?auto_39477 ) ( ON ?auto_39478 ?auto_39477 ) ( ON ?auto_39479 ?auto_39478 ) ( not ( = ?auto_39477 ?auto_39478 ) ) ( not ( = ?auto_39477 ?auto_39479 ) ) ( not ( = ?auto_39477 ?auto_39480 ) ) ( not ( = ?auto_39478 ?auto_39479 ) ) ( not ( = ?auto_39478 ?auto_39480 ) ) ( not ( = ?auto_39479 ?auto_39480 ) ) ( ON ?auto_39480 ?auto_39481 ) ( CLEAR ?auto_39480 ) ( HAND-EMPTY ) ( not ( = ?auto_39477 ?auto_39481 ) ) ( not ( = ?auto_39478 ?auto_39481 ) ) ( not ( = ?auto_39479 ?auto_39481 ) ) ( not ( = ?auto_39480 ?auto_39481 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39480 ?auto_39481 )
      ( MAKE-4PILE ?auto_39477 ?auto_39478 ?auto_39479 ?auto_39480 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39482 - BLOCK
      ?auto_39483 - BLOCK
      ?auto_39484 - BLOCK
      ?auto_39485 - BLOCK
    )
    :vars
    (
      ?auto_39486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39482 ) ( ON ?auto_39483 ?auto_39482 ) ( not ( = ?auto_39482 ?auto_39483 ) ) ( not ( = ?auto_39482 ?auto_39484 ) ) ( not ( = ?auto_39482 ?auto_39485 ) ) ( not ( = ?auto_39483 ?auto_39484 ) ) ( not ( = ?auto_39483 ?auto_39485 ) ) ( not ( = ?auto_39484 ?auto_39485 ) ) ( ON ?auto_39485 ?auto_39486 ) ( CLEAR ?auto_39485 ) ( not ( = ?auto_39482 ?auto_39486 ) ) ( not ( = ?auto_39483 ?auto_39486 ) ) ( not ( = ?auto_39484 ?auto_39486 ) ) ( not ( = ?auto_39485 ?auto_39486 ) ) ( HOLDING ?auto_39484 ) ( CLEAR ?auto_39483 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39482 ?auto_39483 ?auto_39484 )
      ( MAKE-4PILE ?auto_39482 ?auto_39483 ?auto_39484 ?auto_39485 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39487 - BLOCK
      ?auto_39488 - BLOCK
      ?auto_39489 - BLOCK
      ?auto_39490 - BLOCK
    )
    :vars
    (
      ?auto_39491 - BLOCK
      ?auto_39492 - BLOCK
      ?auto_39493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39487 ) ( ON ?auto_39488 ?auto_39487 ) ( not ( = ?auto_39487 ?auto_39488 ) ) ( not ( = ?auto_39487 ?auto_39489 ) ) ( not ( = ?auto_39487 ?auto_39490 ) ) ( not ( = ?auto_39488 ?auto_39489 ) ) ( not ( = ?auto_39488 ?auto_39490 ) ) ( not ( = ?auto_39489 ?auto_39490 ) ) ( ON ?auto_39490 ?auto_39491 ) ( not ( = ?auto_39487 ?auto_39491 ) ) ( not ( = ?auto_39488 ?auto_39491 ) ) ( not ( = ?auto_39489 ?auto_39491 ) ) ( not ( = ?auto_39490 ?auto_39491 ) ) ( CLEAR ?auto_39488 ) ( ON ?auto_39489 ?auto_39490 ) ( CLEAR ?auto_39489 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39492 ) ( ON ?auto_39493 ?auto_39492 ) ( ON ?auto_39491 ?auto_39493 ) ( not ( = ?auto_39492 ?auto_39493 ) ) ( not ( = ?auto_39492 ?auto_39491 ) ) ( not ( = ?auto_39492 ?auto_39490 ) ) ( not ( = ?auto_39492 ?auto_39489 ) ) ( not ( = ?auto_39493 ?auto_39491 ) ) ( not ( = ?auto_39493 ?auto_39490 ) ) ( not ( = ?auto_39493 ?auto_39489 ) ) ( not ( = ?auto_39487 ?auto_39492 ) ) ( not ( = ?auto_39487 ?auto_39493 ) ) ( not ( = ?auto_39488 ?auto_39492 ) ) ( not ( = ?auto_39488 ?auto_39493 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39492 ?auto_39493 ?auto_39491 ?auto_39490 )
      ( MAKE-4PILE ?auto_39487 ?auto_39488 ?auto_39489 ?auto_39490 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39494 - BLOCK
      ?auto_39495 - BLOCK
      ?auto_39496 - BLOCK
      ?auto_39497 - BLOCK
    )
    :vars
    (
      ?auto_39498 - BLOCK
      ?auto_39499 - BLOCK
      ?auto_39500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39494 ) ( not ( = ?auto_39494 ?auto_39495 ) ) ( not ( = ?auto_39494 ?auto_39496 ) ) ( not ( = ?auto_39494 ?auto_39497 ) ) ( not ( = ?auto_39495 ?auto_39496 ) ) ( not ( = ?auto_39495 ?auto_39497 ) ) ( not ( = ?auto_39496 ?auto_39497 ) ) ( ON ?auto_39497 ?auto_39498 ) ( not ( = ?auto_39494 ?auto_39498 ) ) ( not ( = ?auto_39495 ?auto_39498 ) ) ( not ( = ?auto_39496 ?auto_39498 ) ) ( not ( = ?auto_39497 ?auto_39498 ) ) ( ON ?auto_39496 ?auto_39497 ) ( CLEAR ?auto_39496 ) ( ON-TABLE ?auto_39499 ) ( ON ?auto_39500 ?auto_39499 ) ( ON ?auto_39498 ?auto_39500 ) ( not ( = ?auto_39499 ?auto_39500 ) ) ( not ( = ?auto_39499 ?auto_39498 ) ) ( not ( = ?auto_39499 ?auto_39497 ) ) ( not ( = ?auto_39499 ?auto_39496 ) ) ( not ( = ?auto_39500 ?auto_39498 ) ) ( not ( = ?auto_39500 ?auto_39497 ) ) ( not ( = ?auto_39500 ?auto_39496 ) ) ( not ( = ?auto_39494 ?auto_39499 ) ) ( not ( = ?auto_39494 ?auto_39500 ) ) ( not ( = ?auto_39495 ?auto_39499 ) ) ( not ( = ?auto_39495 ?auto_39500 ) ) ( HOLDING ?auto_39495 ) ( CLEAR ?auto_39494 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39494 ?auto_39495 )
      ( MAKE-4PILE ?auto_39494 ?auto_39495 ?auto_39496 ?auto_39497 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39501 - BLOCK
      ?auto_39502 - BLOCK
      ?auto_39503 - BLOCK
      ?auto_39504 - BLOCK
    )
    :vars
    (
      ?auto_39505 - BLOCK
      ?auto_39506 - BLOCK
      ?auto_39507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39501 ) ( not ( = ?auto_39501 ?auto_39502 ) ) ( not ( = ?auto_39501 ?auto_39503 ) ) ( not ( = ?auto_39501 ?auto_39504 ) ) ( not ( = ?auto_39502 ?auto_39503 ) ) ( not ( = ?auto_39502 ?auto_39504 ) ) ( not ( = ?auto_39503 ?auto_39504 ) ) ( ON ?auto_39504 ?auto_39505 ) ( not ( = ?auto_39501 ?auto_39505 ) ) ( not ( = ?auto_39502 ?auto_39505 ) ) ( not ( = ?auto_39503 ?auto_39505 ) ) ( not ( = ?auto_39504 ?auto_39505 ) ) ( ON ?auto_39503 ?auto_39504 ) ( ON-TABLE ?auto_39506 ) ( ON ?auto_39507 ?auto_39506 ) ( ON ?auto_39505 ?auto_39507 ) ( not ( = ?auto_39506 ?auto_39507 ) ) ( not ( = ?auto_39506 ?auto_39505 ) ) ( not ( = ?auto_39506 ?auto_39504 ) ) ( not ( = ?auto_39506 ?auto_39503 ) ) ( not ( = ?auto_39507 ?auto_39505 ) ) ( not ( = ?auto_39507 ?auto_39504 ) ) ( not ( = ?auto_39507 ?auto_39503 ) ) ( not ( = ?auto_39501 ?auto_39506 ) ) ( not ( = ?auto_39501 ?auto_39507 ) ) ( not ( = ?auto_39502 ?auto_39506 ) ) ( not ( = ?auto_39502 ?auto_39507 ) ) ( CLEAR ?auto_39501 ) ( ON ?auto_39502 ?auto_39503 ) ( CLEAR ?auto_39502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39506 ?auto_39507 ?auto_39505 ?auto_39504 ?auto_39503 )
      ( MAKE-4PILE ?auto_39501 ?auto_39502 ?auto_39503 ?auto_39504 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39508 - BLOCK
      ?auto_39509 - BLOCK
      ?auto_39510 - BLOCK
      ?auto_39511 - BLOCK
    )
    :vars
    (
      ?auto_39513 - BLOCK
      ?auto_39514 - BLOCK
      ?auto_39512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39508 ?auto_39509 ) ) ( not ( = ?auto_39508 ?auto_39510 ) ) ( not ( = ?auto_39508 ?auto_39511 ) ) ( not ( = ?auto_39509 ?auto_39510 ) ) ( not ( = ?auto_39509 ?auto_39511 ) ) ( not ( = ?auto_39510 ?auto_39511 ) ) ( ON ?auto_39511 ?auto_39513 ) ( not ( = ?auto_39508 ?auto_39513 ) ) ( not ( = ?auto_39509 ?auto_39513 ) ) ( not ( = ?auto_39510 ?auto_39513 ) ) ( not ( = ?auto_39511 ?auto_39513 ) ) ( ON ?auto_39510 ?auto_39511 ) ( ON-TABLE ?auto_39514 ) ( ON ?auto_39512 ?auto_39514 ) ( ON ?auto_39513 ?auto_39512 ) ( not ( = ?auto_39514 ?auto_39512 ) ) ( not ( = ?auto_39514 ?auto_39513 ) ) ( not ( = ?auto_39514 ?auto_39511 ) ) ( not ( = ?auto_39514 ?auto_39510 ) ) ( not ( = ?auto_39512 ?auto_39513 ) ) ( not ( = ?auto_39512 ?auto_39511 ) ) ( not ( = ?auto_39512 ?auto_39510 ) ) ( not ( = ?auto_39508 ?auto_39514 ) ) ( not ( = ?auto_39508 ?auto_39512 ) ) ( not ( = ?auto_39509 ?auto_39514 ) ) ( not ( = ?auto_39509 ?auto_39512 ) ) ( ON ?auto_39509 ?auto_39510 ) ( CLEAR ?auto_39509 ) ( HOLDING ?auto_39508 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39508 )
      ( MAKE-4PILE ?auto_39508 ?auto_39509 ?auto_39510 ?auto_39511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39515 - BLOCK
      ?auto_39516 - BLOCK
      ?auto_39517 - BLOCK
      ?auto_39518 - BLOCK
    )
    :vars
    (
      ?auto_39520 - BLOCK
      ?auto_39519 - BLOCK
      ?auto_39521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39515 ?auto_39516 ) ) ( not ( = ?auto_39515 ?auto_39517 ) ) ( not ( = ?auto_39515 ?auto_39518 ) ) ( not ( = ?auto_39516 ?auto_39517 ) ) ( not ( = ?auto_39516 ?auto_39518 ) ) ( not ( = ?auto_39517 ?auto_39518 ) ) ( ON ?auto_39518 ?auto_39520 ) ( not ( = ?auto_39515 ?auto_39520 ) ) ( not ( = ?auto_39516 ?auto_39520 ) ) ( not ( = ?auto_39517 ?auto_39520 ) ) ( not ( = ?auto_39518 ?auto_39520 ) ) ( ON ?auto_39517 ?auto_39518 ) ( ON-TABLE ?auto_39519 ) ( ON ?auto_39521 ?auto_39519 ) ( ON ?auto_39520 ?auto_39521 ) ( not ( = ?auto_39519 ?auto_39521 ) ) ( not ( = ?auto_39519 ?auto_39520 ) ) ( not ( = ?auto_39519 ?auto_39518 ) ) ( not ( = ?auto_39519 ?auto_39517 ) ) ( not ( = ?auto_39521 ?auto_39520 ) ) ( not ( = ?auto_39521 ?auto_39518 ) ) ( not ( = ?auto_39521 ?auto_39517 ) ) ( not ( = ?auto_39515 ?auto_39519 ) ) ( not ( = ?auto_39515 ?auto_39521 ) ) ( not ( = ?auto_39516 ?auto_39519 ) ) ( not ( = ?auto_39516 ?auto_39521 ) ) ( ON ?auto_39516 ?auto_39517 ) ( ON ?auto_39515 ?auto_39516 ) ( CLEAR ?auto_39515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39519 ?auto_39521 ?auto_39520 ?auto_39518 ?auto_39517 ?auto_39516 )
      ( MAKE-4PILE ?auto_39515 ?auto_39516 ?auto_39517 ?auto_39518 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39524 - BLOCK
      ?auto_39525 - BLOCK
    )
    :vars
    (
      ?auto_39526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39526 ?auto_39525 ) ( CLEAR ?auto_39526 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39524 ) ( ON ?auto_39525 ?auto_39524 ) ( not ( = ?auto_39524 ?auto_39525 ) ) ( not ( = ?auto_39524 ?auto_39526 ) ) ( not ( = ?auto_39525 ?auto_39526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39526 ?auto_39525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39527 - BLOCK
      ?auto_39528 - BLOCK
    )
    :vars
    (
      ?auto_39529 - BLOCK
      ?auto_39530 - BLOCK
      ?auto_39531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39529 ?auto_39528 ) ( CLEAR ?auto_39529 ) ( ON-TABLE ?auto_39527 ) ( ON ?auto_39528 ?auto_39527 ) ( not ( = ?auto_39527 ?auto_39528 ) ) ( not ( = ?auto_39527 ?auto_39529 ) ) ( not ( = ?auto_39528 ?auto_39529 ) ) ( HOLDING ?auto_39530 ) ( CLEAR ?auto_39531 ) ( not ( = ?auto_39527 ?auto_39530 ) ) ( not ( = ?auto_39527 ?auto_39531 ) ) ( not ( = ?auto_39528 ?auto_39530 ) ) ( not ( = ?auto_39528 ?auto_39531 ) ) ( not ( = ?auto_39529 ?auto_39530 ) ) ( not ( = ?auto_39529 ?auto_39531 ) ) ( not ( = ?auto_39530 ?auto_39531 ) ) )
    :subtasks
    ( ( !STACK ?auto_39530 ?auto_39531 )
      ( MAKE-2PILE ?auto_39527 ?auto_39528 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39532 - BLOCK
      ?auto_39533 - BLOCK
    )
    :vars
    (
      ?auto_39535 - BLOCK
      ?auto_39534 - BLOCK
      ?auto_39536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39535 ?auto_39533 ) ( ON-TABLE ?auto_39532 ) ( ON ?auto_39533 ?auto_39532 ) ( not ( = ?auto_39532 ?auto_39533 ) ) ( not ( = ?auto_39532 ?auto_39535 ) ) ( not ( = ?auto_39533 ?auto_39535 ) ) ( CLEAR ?auto_39534 ) ( not ( = ?auto_39532 ?auto_39536 ) ) ( not ( = ?auto_39532 ?auto_39534 ) ) ( not ( = ?auto_39533 ?auto_39536 ) ) ( not ( = ?auto_39533 ?auto_39534 ) ) ( not ( = ?auto_39535 ?auto_39536 ) ) ( not ( = ?auto_39535 ?auto_39534 ) ) ( not ( = ?auto_39536 ?auto_39534 ) ) ( ON ?auto_39536 ?auto_39535 ) ( CLEAR ?auto_39536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39532 ?auto_39533 ?auto_39535 )
      ( MAKE-2PILE ?auto_39532 ?auto_39533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39537 - BLOCK
      ?auto_39538 - BLOCK
    )
    :vars
    (
      ?auto_39540 - BLOCK
      ?auto_39541 - BLOCK
      ?auto_39539 - BLOCK
      ?auto_39542 - BLOCK
      ?auto_39543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39540 ?auto_39538 ) ( ON-TABLE ?auto_39537 ) ( ON ?auto_39538 ?auto_39537 ) ( not ( = ?auto_39537 ?auto_39538 ) ) ( not ( = ?auto_39537 ?auto_39540 ) ) ( not ( = ?auto_39538 ?auto_39540 ) ) ( not ( = ?auto_39537 ?auto_39541 ) ) ( not ( = ?auto_39537 ?auto_39539 ) ) ( not ( = ?auto_39538 ?auto_39541 ) ) ( not ( = ?auto_39538 ?auto_39539 ) ) ( not ( = ?auto_39540 ?auto_39541 ) ) ( not ( = ?auto_39540 ?auto_39539 ) ) ( not ( = ?auto_39541 ?auto_39539 ) ) ( ON ?auto_39541 ?auto_39540 ) ( CLEAR ?auto_39541 ) ( HOLDING ?auto_39539 ) ( CLEAR ?auto_39542 ) ( ON-TABLE ?auto_39543 ) ( ON ?auto_39542 ?auto_39543 ) ( not ( = ?auto_39543 ?auto_39542 ) ) ( not ( = ?auto_39543 ?auto_39539 ) ) ( not ( = ?auto_39542 ?auto_39539 ) ) ( not ( = ?auto_39537 ?auto_39542 ) ) ( not ( = ?auto_39537 ?auto_39543 ) ) ( not ( = ?auto_39538 ?auto_39542 ) ) ( not ( = ?auto_39538 ?auto_39543 ) ) ( not ( = ?auto_39540 ?auto_39542 ) ) ( not ( = ?auto_39540 ?auto_39543 ) ) ( not ( = ?auto_39541 ?auto_39542 ) ) ( not ( = ?auto_39541 ?auto_39543 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39543 ?auto_39542 ?auto_39539 )
      ( MAKE-2PILE ?auto_39537 ?auto_39538 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39544 - BLOCK
      ?auto_39545 - BLOCK
    )
    :vars
    (
      ?auto_39546 - BLOCK
      ?auto_39548 - BLOCK
      ?auto_39547 - BLOCK
      ?auto_39550 - BLOCK
      ?auto_39549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39546 ?auto_39545 ) ( ON-TABLE ?auto_39544 ) ( ON ?auto_39545 ?auto_39544 ) ( not ( = ?auto_39544 ?auto_39545 ) ) ( not ( = ?auto_39544 ?auto_39546 ) ) ( not ( = ?auto_39545 ?auto_39546 ) ) ( not ( = ?auto_39544 ?auto_39548 ) ) ( not ( = ?auto_39544 ?auto_39547 ) ) ( not ( = ?auto_39545 ?auto_39548 ) ) ( not ( = ?auto_39545 ?auto_39547 ) ) ( not ( = ?auto_39546 ?auto_39548 ) ) ( not ( = ?auto_39546 ?auto_39547 ) ) ( not ( = ?auto_39548 ?auto_39547 ) ) ( ON ?auto_39548 ?auto_39546 ) ( CLEAR ?auto_39550 ) ( ON-TABLE ?auto_39549 ) ( ON ?auto_39550 ?auto_39549 ) ( not ( = ?auto_39549 ?auto_39550 ) ) ( not ( = ?auto_39549 ?auto_39547 ) ) ( not ( = ?auto_39550 ?auto_39547 ) ) ( not ( = ?auto_39544 ?auto_39550 ) ) ( not ( = ?auto_39544 ?auto_39549 ) ) ( not ( = ?auto_39545 ?auto_39550 ) ) ( not ( = ?auto_39545 ?auto_39549 ) ) ( not ( = ?auto_39546 ?auto_39550 ) ) ( not ( = ?auto_39546 ?auto_39549 ) ) ( not ( = ?auto_39548 ?auto_39550 ) ) ( not ( = ?auto_39548 ?auto_39549 ) ) ( ON ?auto_39547 ?auto_39548 ) ( CLEAR ?auto_39547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39544 ?auto_39545 ?auto_39546 ?auto_39548 )
      ( MAKE-2PILE ?auto_39544 ?auto_39545 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39551 - BLOCK
      ?auto_39552 - BLOCK
    )
    :vars
    (
      ?auto_39556 - BLOCK
      ?auto_39557 - BLOCK
      ?auto_39553 - BLOCK
      ?auto_39554 - BLOCK
      ?auto_39555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39556 ?auto_39552 ) ( ON-TABLE ?auto_39551 ) ( ON ?auto_39552 ?auto_39551 ) ( not ( = ?auto_39551 ?auto_39552 ) ) ( not ( = ?auto_39551 ?auto_39556 ) ) ( not ( = ?auto_39552 ?auto_39556 ) ) ( not ( = ?auto_39551 ?auto_39557 ) ) ( not ( = ?auto_39551 ?auto_39553 ) ) ( not ( = ?auto_39552 ?auto_39557 ) ) ( not ( = ?auto_39552 ?auto_39553 ) ) ( not ( = ?auto_39556 ?auto_39557 ) ) ( not ( = ?auto_39556 ?auto_39553 ) ) ( not ( = ?auto_39557 ?auto_39553 ) ) ( ON ?auto_39557 ?auto_39556 ) ( ON-TABLE ?auto_39554 ) ( not ( = ?auto_39554 ?auto_39555 ) ) ( not ( = ?auto_39554 ?auto_39553 ) ) ( not ( = ?auto_39555 ?auto_39553 ) ) ( not ( = ?auto_39551 ?auto_39555 ) ) ( not ( = ?auto_39551 ?auto_39554 ) ) ( not ( = ?auto_39552 ?auto_39555 ) ) ( not ( = ?auto_39552 ?auto_39554 ) ) ( not ( = ?auto_39556 ?auto_39555 ) ) ( not ( = ?auto_39556 ?auto_39554 ) ) ( not ( = ?auto_39557 ?auto_39555 ) ) ( not ( = ?auto_39557 ?auto_39554 ) ) ( ON ?auto_39553 ?auto_39557 ) ( CLEAR ?auto_39553 ) ( HOLDING ?auto_39555 ) ( CLEAR ?auto_39554 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39554 ?auto_39555 )
      ( MAKE-2PILE ?auto_39551 ?auto_39552 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40329 - BLOCK
      ?auto_40330 - BLOCK
    )
    :vars
    (
      ?auto_40332 - BLOCK
      ?auto_40333 - BLOCK
      ?auto_40334 - BLOCK
      ?auto_40331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40332 ?auto_40330 ) ( ON-TABLE ?auto_40329 ) ( ON ?auto_40330 ?auto_40329 ) ( not ( = ?auto_40329 ?auto_40330 ) ) ( not ( = ?auto_40329 ?auto_40332 ) ) ( not ( = ?auto_40330 ?auto_40332 ) ) ( not ( = ?auto_40329 ?auto_40333 ) ) ( not ( = ?auto_40329 ?auto_40334 ) ) ( not ( = ?auto_40330 ?auto_40333 ) ) ( not ( = ?auto_40330 ?auto_40334 ) ) ( not ( = ?auto_40332 ?auto_40333 ) ) ( not ( = ?auto_40332 ?auto_40334 ) ) ( not ( = ?auto_40333 ?auto_40334 ) ) ( ON ?auto_40333 ?auto_40332 ) ( not ( = ?auto_40331 ?auto_40334 ) ) ( not ( = ?auto_40329 ?auto_40331 ) ) ( not ( = ?auto_40330 ?auto_40331 ) ) ( not ( = ?auto_40332 ?auto_40331 ) ) ( not ( = ?auto_40333 ?auto_40331 ) ) ( ON ?auto_40334 ?auto_40333 ) ( ON ?auto_40331 ?auto_40334 ) ( CLEAR ?auto_40331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40329 ?auto_40330 ?auto_40332 ?auto_40333 ?auto_40334 )
      ( MAKE-2PILE ?auto_40329 ?auto_40330 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39565 - BLOCK
      ?auto_39566 - BLOCK
    )
    :vars
    (
      ?auto_39568 - BLOCK
      ?auto_39567 - BLOCK
      ?auto_39569 - BLOCK
      ?auto_39570 - BLOCK
      ?auto_39571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39568 ?auto_39566 ) ( ON-TABLE ?auto_39565 ) ( ON ?auto_39566 ?auto_39565 ) ( not ( = ?auto_39565 ?auto_39566 ) ) ( not ( = ?auto_39565 ?auto_39568 ) ) ( not ( = ?auto_39566 ?auto_39568 ) ) ( not ( = ?auto_39565 ?auto_39567 ) ) ( not ( = ?auto_39565 ?auto_39569 ) ) ( not ( = ?auto_39566 ?auto_39567 ) ) ( not ( = ?auto_39566 ?auto_39569 ) ) ( not ( = ?auto_39568 ?auto_39567 ) ) ( not ( = ?auto_39568 ?auto_39569 ) ) ( not ( = ?auto_39567 ?auto_39569 ) ) ( ON ?auto_39567 ?auto_39568 ) ( not ( = ?auto_39570 ?auto_39571 ) ) ( not ( = ?auto_39570 ?auto_39569 ) ) ( not ( = ?auto_39571 ?auto_39569 ) ) ( not ( = ?auto_39565 ?auto_39571 ) ) ( not ( = ?auto_39565 ?auto_39570 ) ) ( not ( = ?auto_39566 ?auto_39571 ) ) ( not ( = ?auto_39566 ?auto_39570 ) ) ( not ( = ?auto_39568 ?auto_39571 ) ) ( not ( = ?auto_39568 ?auto_39570 ) ) ( not ( = ?auto_39567 ?auto_39571 ) ) ( not ( = ?auto_39567 ?auto_39570 ) ) ( ON ?auto_39569 ?auto_39567 ) ( ON ?auto_39571 ?auto_39569 ) ( CLEAR ?auto_39571 ) ( HOLDING ?auto_39570 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39570 )
      ( MAKE-2PILE ?auto_39565 ?auto_39566 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_39572 - BLOCK
      ?auto_39573 - BLOCK
    )
    :vars
    (
      ?auto_39574 - BLOCK
      ?auto_39576 - BLOCK
      ?auto_39577 - BLOCK
      ?auto_39578 - BLOCK
      ?auto_39575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39574 ?auto_39573 ) ( ON-TABLE ?auto_39572 ) ( ON ?auto_39573 ?auto_39572 ) ( not ( = ?auto_39572 ?auto_39573 ) ) ( not ( = ?auto_39572 ?auto_39574 ) ) ( not ( = ?auto_39573 ?auto_39574 ) ) ( not ( = ?auto_39572 ?auto_39576 ) ) ( not ( = ?auto_39572 ?auto_39577 ) ) ( not ( = ?auto_39573 ?auto_39576 ) ) ( not ( = ?auto_39573 ?auto_39577 ) ) ( not ( = ?auto_39574 ?auto_39576 ) ) ( not ( = ?auto_39574 ?auto_39577 ) ) ( not ( = ?auto_39576 ?auto_39577 ) ) ( ON ?auto_39576 ?auto_39574 ) ( not ( = ?auto_39578 ?auto_39575 ) ) ( not ( = ?auto_39578 ?auto_39577 ) ) ( not ( = ?auto_39575 ?auto_39577 ) ) ( not ( = ?auto_39572 ?auto_39575 ) ) ( not ( = ?auto_39572 ?auto_39578 ) ) ( not ( = ?auto_39573 ?auto_39575 ) ) ( not ( = ?auto_39573 ?auto_39578 ) ) ( not ( = ?auto_39574 ?auto_39575 ) ) ( not ( = ?auto_39574 ?auto_39578 ) ) ( not ( = ?auto_39576 ?auto_39575 ) ) ( not ( = ?auto_39576 ?auto_39578 ) ) ( ON ?auto_39577 ?auto_39576 ) ( ON ?auto_39575 ?auto_39577 ) ( ON ?auto_39578 ?auto_39575 ) ( CLEAR ?auto_39578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39572 ?auto_39573 ?auto_39574 ?auto_39576 ?auto_39577 ?auto_39575 )
      ( MAKE-2PILE ?auto_39572 ?auto_39573 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39584 - BLOCK
      ?auto_39585 - BLOCK
      ?auto_39586 - BLOCK
      ?auto_39587 - BLOCK
      ?auto_39588 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39588 ) ( CLEAR ?auto_39587 ) ( ON-TABLE ?auto_39584 ) ( ON ?auto_39585 ?auto_39584 ) ( ON ?auto_39586 ?auto_39585 ) ( ON ?auto_39587 ?auto_39586 ) ( not ( = ?auto_39584 ?auto_39585 ) ) ( not ( = ?auto_39584 ?auto_39586 ) ) ( not ( = ?auto_39584 ?auto_39587 ) ) ( not ( = ?auto_39584 ?auto_39588 ) ) ( not ( = ?auto_39585 ?auto_39586 ) ) ( not ( = ?auto_39585 ?auto_39587 ) ) ( not ( = ?auto_39585 ?auto_39588 ) ) ( not ( = ?auto_39586 ?auto_39587 ) ) ( not ( = ?auto_39586 ?auto_39588 ) ) ( not ( = ?auto_39587 ?auto_39588 ) ) )
    :subtasks
    ( ( !STACK ?auto_39588 ?auto_39587 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39589 - BLOCK
      ?auto_39590 - BLOCK
      ?auto_39591 - BLOCK
      ?auto_39592 - BLOCK
      ?auto_39593 - BLOCK
    )
    :vars
    (
      ?auto_39594 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39592 ) ( ON-TABLE ?auto_39589 ) ( ON ?auto_39590 ?auto_39589 ) ( ON ?auto_39591 ?auto_39590 ) ( ON ?auto_39592 ?auto_39591 ) ( not ( = ?auto_39589 ?auto_39590 ) ) ( not ( = ?auto_39589 ?auto_39591 ) ) ( not ( = ?auto_39589 ?auto_39592 ) ) ( not ( = ?auto_39589 ?auto_39593 ) ) ( not ( = ?auto_39590 ?auto_39591 ) ) ( not ( = ?auto_39590 ?auto_39592 ) ) ( not ( = ?auto_39590 ?auto_39593 ) ) ( not ( = ?auto_39591 ?auto_39592 ) ) ( not ( = ?auto_39591 ?auto_39593 ) ) ( not ( = ?auto_39592 ?auto_39593 ) ) ( ON ?auto_39593 ?auto_39594 ) ( CLEAR ?auto_39593 ) ( HAND-EMPTY ) ( not ( = ?auto_39589 ?auto_39594 ) ) ( not ( = ?auto_39590 ?auto_39594 ) ) ( not ( = ?auto_39591 ?auto_39594 ) ) ( not ( = ?auto_39592 ?auto_39594 ) ) ( not ( = ?auto_39593 ?auto_39594 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39593 ?auto_39594 )
      ( MAKE-5PILE ?auto_39589 ?auto_39590 ?auto_39591 ?auto_39592 ?auto_39593 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39595 - BLOCK
      ?auto_39596 - BLOCK
      ?auto_39597 - BLOCK
      ?auto_39598 - BLOCK
      ?auto_39599 - BLOCK
    )
    :vars
    (
      ?auto_39600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39595 ) ( ON ?auto_39596 ?auto_39595 ) ( ON ?auto_39597 ?auto_39596 ) ( not ( = ?auto_39595 ?auto_39596 ) ) ( not ( = ?auto_39595 ?auto_39597 ) ) ( not ( = ?auto_39595 ?auto_39598 ) ) ( not ( = ?auto_39595 ?auto_39599 ) ) ( not ( = ?auto_39596 ?auto_39597 ) ) ( not ( = ?auto_39596 ?auto_39598 ) ) ( not ( = ?auto_39596 ?auto_39599 ) ) ( not ( = ?auto_39597 ?auto_39598 ) ) ( not ( = ?auto_39597 ?auto_39599 ) ) ( not ( = ?auto_39598 ?auto_39599 ) ) ( ON ?auto_39599 ?auto_39600 ) ( CLEAR ?auto_39599 ) ( not ( = ?auto_39595 ?auto_39600 ) ) ( not ( = ?auto_39596 ?auto_39600 ) ) ( not ( = ?auto_39597 ?auto_39600 ) ) ( not ( = ?auto_39598 ?auto_39600 ) ) ( not ( = ?auto_39599 ?auto_39600 ) ) ( HOLDING ?auto_39598 ) ( CLEAR ?auto_39597 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39595 ?auto_39596 ?auto_39597 ?auto_39598 )
      ( MAKE-5PILE ?auto_39595 ?auto_39596 ?auto_39597 ?auto_39598 ?auto_39599 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39601 - BLOCK
      ?auto_39602 - BLOCK
      ?auto_39603 - BLOCK
      ?auto_39604 - BLOCK
      ?auto_39605 - BLOCK
    )
    :vars
    (
      ?auto_39606 - BLOCK
      ?auto_39607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39601 ) ( ON ?auto_39602 ?auto_39601 ) ( ON ?auto_39603 ?auto_39602 ) ( not ( = ?auto_39601 ?auto_39602 ) ) ( not ( = ?auto_39601 ?auto_39603 ) ) ( not ( = ?auto_39601 ?auto_39604 ) ) ( not ( = ?auto_39601 ?auto_39605 ) ) ( not ( = ?auto_39602 ?auto_39603 ) ) ( not ( = ?auto_39602 ?auto_39604 ) ) ( not ( = ?auto_39602 ?auto_39605 ) ) ( not ( = ?auto_39603 ?auto_39604 ) ) ( not ( = ?auto_39603 ?auto_39605 ) ) ( not ( = ?auto_39604 ?auto_39605 ) ) ( ON ?auto_39605 ?auto_39606 ) ( not ( = ?auto_39601 ?auto_39606 ) ) ( not ( = ?auto_39602 ?auto_39606 ) ) ( not ( = ?auto_39603 ?auto_39606 ) ) ( not ( = ?auto_39604 ?auto_39606 ) ) ( not ( = ?auto_39605 ?auto_39606 ) ) ( CLEAR ?auto_39603 ) ( ON ?auto_39604 ?auto_39605 ) ( CLEAR ?auto_39604 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39607 ) ( ON ?auto_39606 ?auto_39607 ) ( not ( = ?auto_39607 ?auto_39606 ) ) ( not ( = ?auto_39607 ?auto_39605 ) ) ( not ( = ?auto_39607 ?auto_39604 ) ) ( not ( = ?auto_39601 ?auto_39607 ) ) ( not ( = ?auto_39602 ?auto_39607 ) ) ( not ( = ?auto_39603 ?auto_39607 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39607 ?auto_39606 ?auto_39605 )
      ( MAKE-5PILE ?auto_39601 ?auto_39602 ?auto_39603 ?auto_39604 ?auto_39605 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39608 - BLOCK
      ?auto_39609 - BLOCK
      ?auto_39610 - BLOCK
      ?auto_39611 - BLOCK
      ?auto_39612 - BLOCK
    )
    :vars
    (
      ?auto_39614 - BLOCK
      ?auto_39613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39608 ) ( ON ?auto_39609 ?auto_39608 ) ( not ( = ?auto_39608 ?auto_39609 ) ) ( not ( = ?auto_39608 ?auto_39610 ) ) ( not ( = ?auto_39608 ?auto_39611 ) ) ( not ( = ?auto_39608 ?auto_39612 ) ) ( not ( = ?auto_39609 ?auto_39610 ) ) ( not ( = ?auto_39609 ?auto_39611 ) ) ( not ( = ?auto_39609 ?auto_39612 ) ) ( not ( = ?auto_39610 ?auto_39611 ) ) ( not ( = ?auto_39610 ?auto_39612 ) ) ( not ( = ?auto_39611 ?auto_39612 ) ) ( ON ?auto_39612 ?auto_39614 ) ( not ( = ?auto_39608 ?auto_39614 ) ) ( not ( = ?auto_39609 ?auto_39614 ) ) ( not ( = ?auto_39610 ?auto_39614 ) ) ( not ( = ?auto_39611 ?auto_39614 ) ) ( not ( = ?auto_39612 ?auto_39614 ) ) ( ON ?auto_39611 ?auto_39612 ) ( CLEAR ?auto_39611 ) ( ON-TABLE ?auto_39613 ) ( ON ?auto_39614 ?auto_39613 ) ( not ( = ?auto_39613 ?auto_39614 ) ) ( not ( = ?auto_39613 ?auto_39612 ) ) ( not ( = ?auto_39613 ?auto_39611 ) ) ( not ( = ?auto_39608 ?auto_39613 ) ) ( not ( = ?auto_39609 ?auto_39613 ) ) ( not ( = ?auto_39610 ?auto_39613 ) ) ( HOLDING ?auto_39610 ) ( CLEAR ?auto_39609 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39608 ?auto_39609 ?auto_39610 )
      ( MAKE-5PILE ?auto_39608 ?auto_39609 ?auto_39610 ?auto_39611 ?auto_39612 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39615 - BLOCK
      ?auto_39616 - BLOCK
      ?auto_39617 - BLOCK
      ?auto_39618 - BLOCK
      ?auto_39619 - BLOCK
    )
    :vars
    (
      ?auto_39621 - BLOCK
      ?auto_39620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39615 ) ( ON ?auto_39616 ?auto_39615 ) ( not ( = ?auto_39615 ?auto_39616 ) ) ( not ( = ?auto_39615 ?auto_39617 ) ) ( not ( = ?auto_39615 ?auto_39618 ) ) ( not ( = ?auto_39615 ?auto_39619 ) ) ( not ( = ?auto_39616 ?auto_39617 ) ) ( not ( = ?auto_39616 ?auto_39618 ) ) ( not ( = ?auto_39616 ?auto_39619 ) ) ( not ( = ?auto_39617 ?auto_39618 ) ) ( not ( = ?auto_39617 ?auto_39619 ) ) ( not ( = ?auto_39618 ?auto_39619 ) ) ( ON ?auto_39619 ?auto_39621 ) ( not ( = ?auto_39615 ?auto_39621 ) ) ( not ( = ?auto_39616 ?auto_39621 ) ) ( not ( = ?auto_39617 ?auto_39621 ) ) ( not ( = ?auto_39618 ?auto_39621 ) ) ( not ( = ?auto_39619 ?auto_39621 ) ) ( ON ?auto_39618 ?auto_39619 ) ( ON-TABLE ?auto_39620 ) ( ON ?auto_39621 ?auto_39620 ) ( not ( = ?auto_39620 ?auto_39621 ) ) ( not ( = ?auto_39620 ?auto_39619 ) ) ( not ( = ?auto_39620 ?auto_39618 ) ) ( not ( = ?auto_39615 ?auto_39620 ) ) ( not ( = ?auto_39616 ?auto_39620 ) ) ( not ( = ?auto_39617 ?auto_39620 ) ) ( CLEAR ?auto_39616 ) ( ON ?auto_39617 ?auto_39618 ) ( CLEAR ?auto_39617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39620 ?auto_39621 ?auto_39619 ?auto_39618 )
      ( MAKE-5PILE ?auto_39615 ?auto_39616 ?auto_39617 ?auto_39618 ?auto_39619 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39622 - BLOCK
      ?auto_39623 - BLOCK
      ?auto_39624 - BLOCK
      ?auto_39625 - BLOCK
      ?auto_39626 - BLOCK
    )
    :vars
    (
      ?auto_39627 - BLOCK
      ?auto_39628 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39622 ) ( not ( = ?auto_39622 ?auto_39623 ) ) ( not ( = ?auto_39622 ?auto_39624 ) ) ( not ( = ?auto_39622 ?auto_39625 ) ) ( not ( = ?auto_39622 ?auto_39626 ) ) ( not ( = ?auto_39623 ?auto_39624 ) ) ( not ( = ?auto_39623 ?auto_39625 ) ) ( not ( = ?auto_39623 ?auto_39626 ) ) ( not ( = ?auto_39624 ?auto_39625 ) ) ( not ( = ?auto_39624 ?auto_39626 ) ) ( not ( = ?auto_39625 ?auto_39626 ) ) ( ON ?auto_39626 ?auto_39627 ) ( not ( = ?auto_39622 ?auto_39627 ) ) ( not ( = ?auto_39623 ?auto_39627 ) ) ( not ( = ?auto_39624 ?auto_39627 ) ) ( not ( = ?auto_39625 ?auto_39627 ) ) ( not ( = ?auto_39626 ?auto_39627 ) ) ( ON ?auto_39625 ?auto_39626 ) ( ON-TABLE ?auto_39628 ) ( ON ?auto_39627 ?auto_39628 ) ( not ( = ?auto_39628 ?auto_39627 ) ) ( not ( = ?auto_39628 ?auto_39626 ) ) ( not ( = ?auto_39628 ?auto_39625 ) ) ( not ( = ?auto_39622 ?auto_39628 ) ) ( not ( = ?auto_39623 ?auto_39628 ) ) ( not ( = ?auto_39624 ?auto_39628 ) ) ( ON ?auto_39624 ?auto_39625 ) ( CLEAR ?auto_39624 ) ( HOLDING ?auto_39623 ) ( CLEAR ?auto_39622 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39622 ?auto_39623 )
      ( MAKE-5PILE ?auto_39622 ?auto_39623 ?auto_39624 ?auto_39625 ?auto_39626 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39629 - BLOCK
      ?auto_39630 - BLOCK
      ?auto_39631 - BLOCK
      ?auto_39632 - BLOCK
      ?auto_39633 - BLOCK
    )
    :vars
    (
      ?auto_39635 - BLOCK
      ?auto_39634 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39629 ) ( not ( = ?auto_39629 ?auto_39630 ) ) ( not ( = ?auto_39629 ?auto_39631 ) ) ( not ( = ?auto_39629 ?auto_39632 ) ) ( not ( = ?auto_39629 ?auto_39633 ) ) ( not ( = ?auto_39630 ?auto_39631 ) ) ( not ( = ?auto_39630 ?auto_39632 ) ) ( not ( = ?auto_39630 ?auto_39633 ) ) ( not ( = ?auto_39631 ?auto_39632 ) ) ( not ( = ?auto_39631 ?auto_39633 ) ) ( not ( = ?auto_39632 ?auto_39633 ) ) ( ON ?auto_39633 ?auto_39635 ) ( not ( = ?auto_39629 ?auto_39635 ) ) ( not ( = ?auto_39630 ?auto_39635 ) ) ( not ( = ?auto_39631 ?auto_39635 ) ) ( not ( = ?auto_39632 ?auto_39635 ) ) ( not ( = ?auto_39633 ?auto_39635 ) ) ( ON ?auto_39632 ?auto_39633 ) ( ON-TABLE ?auto_39634 ) ( ON ?auto_39635 ?auto_39634 ) ( not ( = ?auto_39634 ?auto_39635 ) ) ( not ( = ?auto_39634 ?auto_39633 ) ) ( not ( = ?auto_39634 ?auto_39632 ) ) ( not ( = ?auto_39629 ?auto_39634 ) ) ( not ( = ?auto_39630 ?auto_39634 ) ) ( not ( = ?auto_39631 ?auto_39634 ) ) ( ON ?auto_39631 ?auto_39632 ) ( CLEAR ?auto_39629 ) ( ON ?auto_39630 ?auto_39631 ) ( CLEAR ?auto_39630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39634 ?auto_39635 ?auto_39633 ?auto_39632 ?auto_39631 )
      ( MAKE-5PILE ?auto_39629 ?auto_39630 ?auto_39631 ?auto_39632 ?auto_39633 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39636 - BLOCK
      ?auto_39637 - BLOCK
      ?auto_39638 - BLOCK
      ?auto_39639 - BLOCK
      ?auto_39640 - BLOCK
    )
    :vars
    (
      ?auto_39642 - BLOCK
      ?auto_39641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39636 ?auto_39637 ) ) ( not ( = ?auto_39636 ?auto_39638 ) ) ( not ( = ?auto_39636 ?auto_39639 ) ) ( not ( = ?auto_39636 ?auto_39640 ) ) ( not ( = ?auto_39637 ?auto_39638 ) ) ( not ( = ?auto_39637 ?auto_39639 ) ) ( not ( = ?auto_39637 ?auto_39640 ) ) ( not ( = ?auto_39638 ?auto_39639 ) ) ( not ( = ?auto_39638 ?auto_39640 ) ) ( not ( = ?auto_39639 ?auto_39640 ) ) ( ON ?auto_39640 ?auto_39642 ) ( not ( = ?auto_39636 ?auto_39642 ) ) ( not ( = ?auto_39637 ?auto_39642 ) ) ( not ( = ?auto_39638 ?auto_39642 ) ) ( not ( = ?auto_39639 ?auto_39642 ) ) ( not ( = ?auto_39640 ?auto_39642 ) ) ( ON ?auto_39639 ?auto_39640 ) ( ON-TABLE ?auto_39641 ) ( ON ?auto_39642 ?auto_39641 ) ( not ( = ?auto_39641 ?auto_39642 ) ) ( not ( = ?auto_39641 ?auto_39640 ) ) ( not ( = ?auto_39641 ?auto_39639 ) ) ( not ( = ?auto_39636 ?auto_39641 ) ) ( not ( = ?auto_39637 ?auto_39641 ) ) ( not ( = ?auto_39638 ?auto_39641 ) ) ( ON ?auto_39638 ?auto_39639 ) ( ON ?auto_39637 ?auto_39638 ) ( CLEAR ?auto_39637 ) ( HOLDING ?auto_39636 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39636 )
      ( MAKE-5PILE ?auto_39636 ?auto_39637 ?auto_39638 ?auto_39639 ?auto_39640 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_39643 - BLOCK
      ?auto_39644 - BLOCK
      ?auto_39645 - BLOCK
      ?auto_39646 - BLOCK
      ?auto_39647 - BLOCK
    )
    :vars
    (
      ?auto_39649 - BLOCK
      ?auto_39648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39643 ?auto_39644 ) ) ( not ( = ?auto_39643 ?auto_39645 ) ) ( not ( = ?auto_39643 ?auto_39646 ) ) ( not ( = ?auto_39643 ?auto_39647 ) ) ( not ( = ?auto_39644 ?auto_39645 ) ) ( not ( = ?auto_39644 ?auto_39646 ) ) ( not ( = ?auto_39644 ?auto_39647 ) ) ( not ( = ?auto_39645 ?auto_39646 ) ) ( not ( = ?auto_39645 ?auto_39647 ) ) ( not ( = ?auto_39646 ?auto_39647 ) ) ( ON ?auto_39647 ?auto_39649 ) ( not ( = ?auto_39643 ?auto_39649 ) ) ( not ( = ?auto_39644 ?auto_39649 ) ) ( not ( = ?auto_39645 ?auto_39649 ) ) ( not ( = ?auto_39646 ?auto_39649 ) ) ( not ( = ?auto_39647 ?auto_39649 ) ) ( ON ?auto_39646 ?auto_39647 ) ( ON-TABLE ?auto_39648 ) ( ON ?auto_39649 ?auto_39648 ) ( not ( = ?auto_39648 ?auto_39649 ) ) ( not ( = ?auto_39648 ?auto_39647 ) ) ( not ( = ?auto_39648 ?auto_39646 ) ) ( not ( = ?auto_39643 ?auto_39648 ) ) ( not ( = ?auto_39644 ?auto_39648 ) ) ( not ( = ?auto_39645 ?auto_39648 ) ) ( ON ?auto_39645 ?auto_39646 ) ( ON ?auto_39644 ?auto_39645 ) ( ON ?auto_39643 ?auto_39644 ) ( CLEAR ?auto_39643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39648 ?auto_39649 ?auto_39647 ?auto_39646 ?auto_39645 ?auto_39644 )
      ( MAKE-5PILE ?auto_39643 ?auto_39644 ?auto_39645 ?auto_39646 ?auto_39647 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39651 - BLOCK
    )
    :vars
    (
      ?auto_39652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39652 ?auto_39651 ) ( CLEAR ?auto_39652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39651 ) ( not ( = ?auto_39651 ?auto_39652 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39652 ?auto_39651 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39653 - BLOCK
    )
    :vars
    (
      ?auto_39654 - BLOCK
      ?auto_39655 - BLOCK
      ?auto_39656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39654 ?auto_39653 ) ( CLEAR ?auto_39654 ) ( ON-TABLE ?auto_39653 ) ( not ( = ?auto_39653 ?auto_39654 ) ) ( HOLDING ?auto_39655 ) ( CLEAR ?auto_39656 ) ( not ( = ?auto_39653 ?auto_39655 ) ) ( not ( = ?auto_39653 ?auto_39656 ) ) ( not ( = ?auto_39654 ?auto_39655 ) ) ( not ( = ?auto_39654 ?auto_39656 ) ) ( not ( = ?auto_39655 ?auto_39656 ) ) )
    :subtasks
    ( ( !STACK ?auto_39655 ?auto_39656 )
      ( MAKE-1PILE ?auto_39653 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39657 - BLOCK
    )
    :vars
    (
      ?auto_39658 - BLOCK
      ?auto_39660 - BLOCK
      ?auto_39659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39658 ?auto_39657 ) ( ON-TABLE ?auto_39657 ) ( not ( = ?auto_39657 ?auto_39658 ) ) ( CLEAR ?auto_39660 ) ( not ( = ?auto_39657 ?auto_39659 ) ) ( not ( = ?auto_39657 ?auto_39660 ) ) ( not ( = ?auto_39658 ?auto_39659 ) ) ( not ( = ?auto_39658 ?auto_39660 ) ) ( not ( = ?auto_39659 ?auto_39660 ) ) ( ON ?auto_39659 ?auto_39658 ) ( CLEAR ?auto_39659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39657 ?auto_39658 )
      ( MAKE-1PILE ?auto_39657 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39661 - BLOCK
    )
    :vars
    (
      ?auto_39663 - BLOCK
      ?auto_39662 - BLOCK
      ?auto_39664 - BLOCK
      ?auto_39665 - BLOCK
      ?auto_39666 - BLOCK
      ?auto_39667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39663 ?auto_39661 ) ( ON-TABLE ?auto_39661 ) ( not ( = ?auto_39661 ?auto_39663 ) ) ( not ( = ?auto_39661 ?auto_39662 ) ) ( not ( = ?auto_39661 ?auto_39664 ) ) ( not ( = ?auto_39663 ?auto_39662 ) ) ( not ( = ?auto_39663 ?auto_39664 ) ) ( not ( = ?auto_39662 ?auto_39664 ) ) ( ON ?auto_39662 ?auto_39663 ) ( CLEAR ?auto_39662 ) ( HOLDING ?auto_39664 ) ( CLEAR ?auto_39665 ) ( ON-TABLE ?auto_39666 ) ( ON ?auto_39667 ?auto_39666 ) ( ON ?auto_39665 ?auto_39667 ) ( not ( = ?auto_39666 ?auto_39667 ) ) ( not ( = ?auto_39666 ?auto_39665 ) ) ( not ( = ?auto_39666 ?auto_39664 ) ) ( not ( = ?auto_39667 ?auto_39665 ) ) ( not ( = ?auto_39667 ?auto_39664 ) ) ( not ( = ?auto_39665 ?auto_39664 ) ) ( not ( = ?auto_39661 ?auto_39665 ) ) ( not ( = ?auto_39661 ?auto_39666 ) ) ( not ( = ?auto_39661 ?auto_39667 ) ) ( not ( = ?auto_39663 ?auto_39665 ) ) ( not ( = ?auto_39663 ?auto_39666 ) ) ( not ( = ?auto_39663 ?auto_39667 ) ) ( not ( = ?auto_39662 ?auto_39665 ) ) ( not ( = ?auto_39662 ?auto_39666 ) ) ( not ( = ?auto_39662 ?auto_39667 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39666 ?auto_39667 ?auto_39665 ?auto_39664 )
      ( MAKE-1PILE ?auto_39661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39668 - BLOCK
    )
    :vars
    (
      ?auto_39673 - BLOCK
      ?auto_39672 - BLOCK
      ?auto_39674 - BLOCK
      ?auto_39670 - BLOCK
      ?auto_39671 - BLOCK
      ?auto_39669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39673 ?auto_39668 ) ( ON-TABLE ?auto_39668 ) ( not ( = ?auto_39668 ?auto_39673 ) ) ( not ( = ?auto_39668 ?auto_39672 ) ) ( not ( = ?auto_39668 ?auto_39674 ) ) ( not ( = ?auto_39673 ?auto_39672 ) ) ( not ( = ?auto_39673 ?auto_39674 ) ) ( not ( = ?auto_39672 ?auto_39674 ) ) ( ON ?auto_39672 ?auto_39673 ) ( CLEAR ?auto_39670 ) ( ON-TABLE ?auto_39671 ) ( ON ?auto_39669 ?auto_39671 ) ( ON ?auto_39670 ?auto_39669 ) ( not ( = ?auto_39671 ?auto_39669 ) ) ( not ( = ?auto_39671 ?auto_39670 ) ) ( not ( = ?auto_39671 ?auto_39674 ) ) ( not ( = ?auto_39669 ?auto_39670 ) ) ( not ( = ?auto_39669 ?auto_39674 ) ) ( not ( = ?auto_39670 ?auto_39674 ) ) ( not ( = ?auto_39668 ?auto_39670 ) ) ( not ( = ?auto_39668 ?auto_39671 ) ) ( not ( = ?auto_39668 ?auto_39669 ) ) ( not ( = ?auto_39673 ?auto_39670 ) ) ( not ( = ?auto_39673 ?auto_39671 ) ) ( not ( = ?auto_39673 ?auto_39669 ) ) ( not ( = ?auto_39672 ?auto_39670 ) ) ( not ( = ?auto_39672 ?auto_39671 ) ) ( not ( = ?auto_39672 ?auto_39669 ) ) ( ON ?auto_39674 ?auto_39672 ) ( CLEAR ?auto_39674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39668 ?auto_39673 ?auto_39672 )
      ( MAKE-1PILE ?auto_39668 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39675 - BLOCK
    )
    :vars
    (
      ?auto_39680 - BLOCK
      ?auto_39676 - BLOCK
      ?auto_39677 - BLOCK
      ?auto_39678 - BLOCK
      ?auto_39681 - BLOCK
      ?auto_39679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39680 ?auto_39675 ) ( ON-TABLE ?auto_39675 ) ( not ( = ?auto_39675 ?auto_39680 ) ) ( not ( = ?auto_39675 ?auto_39676 ) ) ( not ( = ?auto_39675 ?auto_39677 ) ) ( not ( = ?auto_39680 ?auto_39676 ) ) ( not ( = ?auto_39680 ?auto_39677 ) ) ( not ( = ?auto_39676 ?auto_39677 ) ) ( ON ?auto_39676 ?auto_39680 ) ( ON-TABLE ?auto_39678 ) ( ON ?auto_39681 ?auto_39678 ) ( not ( = ?auto_39678 ?auto_39681 ) ) ( not ( = ?auto_39678 ?auto_39679 ) ) ( not ( = ?auto_39678 ?auto_39677 ) ) ( not ( = ?auto_39681 ?auto_39679 ) ) ( not ( = ?auto_39681 ?auto_39677 ) ) ( not ( = ?auto_39679 ?auto_39677 ) ) ( not ( = ?auto_39675 ?auto_39679 ) ) ( not ( = ?auto_39675 ?auto_39678 ) ) ( not ( = ?auto_39675 ?auto_39681 ) ) ( not ( = ?auto_39680 ?auto_39679 ) ) ( not ( = ?auto_39680 ?auto_39678 ) ) ( not ( = ?auto_39680 ?auto_39681 ) ) ( not ( = ?auto_39676 ?auto_39679 ) ) ( not ( = ?auto_39676 ?auto_39678 ) ) ( not ( = ?auto_39676 ?auto_39681 ) ) ( ON ?auto_39677 ?auto_39676 ) ( CLEAR ?auto_39677 ) ( HOLDING ?auto_39679 ) ( CLEAR ?auto_39681 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39678 ?auto_39681 ?auto_39679 )
      ( MAKE-1PILE ?auto_39675 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39682 - BLOCK
    )
    :vars
    (
      ?auto_39683 - BLOCK
      ?auto_39688 - BLOCK
      ?auto_39684 - BLOCK
      ?auto_39685 - BLOCK
      ?auto_39687 - BLOCK
      ?auto_39686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39683 ?auto_39682 ) ( ON-TABLE ?auto_39682 ) ( not ( = ?auto_39682 ?auto_39683 ) ) ( not ( = ?auto_39682 ?auto_39688 ) ) ( not ( = ?auto_39682 ?auto_39684 ) ) ( not ( = ?auto_39683 ?auto_39688 ) ) ( not ( = ?auto_39683 ?auto_39684 ) ) ( not ( = ?auto_39688 ?auto_39684 ) ) ( ON ?auto_39688 ?auto_39683 ) ( ON-TABLE ?auto_39685 ) ( ON ?auto_39687 ?auto_39685 ) ( not ( = ?auto_39685 ?auto_39687 ) ) ( not ( = ?auto_39685 ?auto_39686 ) ) ( not ( = ?auto_39685 ?auto_39684 ) ) ( not ( = ?auto_39687 ?auto_39686 ) ) ( not ( = ?auto_39687 ?auto_39684 ) ) ( not ( = ?auto_39686 ?auto_39684 ) ) ( not ( = ?auto_39682 ?auto_39686 ) ) ( not ( = ?auto_39682 ?auto_39685 ) ) ( not ( = ?auto_39682 ?auto_39687 ) ) ( not ( = ?auto_39683 ?auto_39686 ) ) ( not ( = ?auto_39683 ?auto_39685 ) ) ( not ( = ?auto_39683 ?auto_39687 ) ) ( not ( = ?auto_39688 ?auto_39686 ) ) ( not ( = ?auto_39688 ?auto_39685 ) ) ( not ( = ?auto_39688 ?auto_39687 ) ) ( ON ?auto_39684 ?auto_39688 ) ( CLEAR ?auto_39687 ) ( ON ?auto_39686 ?auto_39684 ) ( CLEAR ?auto_39686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39682 ?auto_39683 ?auto_39688 ?auto_39684 )
      ( MAKE-1PILE ?auto_39682 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39689 - BLOCK
    )
    :vars
    (
      ?auto_39690 - BLOCK
      ?auto_39695 - BLOCK
      ?auto_39694 - BLOCK
      ?auto_39693 - BLOCK
      ?auto_39692 - BLOCK
      ?auto_39691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39690 ?auto_39689 ) ( ON-TABLE ?auto_39689 ) ( not ( = ?auto_39689 ?auto_39690 ) ) ( not ( = ?auto_39689 ?auto_39695 ) ) ( not ( = ?auto_39689 ?auto_39694 ) ) ( not ( = ?auto_39690 ?auto_39695 ) ) ( not ( = ?auto_39690 ?auto_39694 ) ) ( not ( = ?auto_39695 ?auto_39694 ) ) ( ON ?auto_39695 ?auto_39690 ) ( ON-TABLE ?auto_39693 ) ( not ( = ?auto_39693 ?auto_39692 ) ) ( not ( = ?auto_39693 ?auto_39691 ) ) ( not ( = ?auto_39693 ?auto_39694 ) ) ( not ( = ?auto_39692 ?auto_39691 ) ) ( not ( = ?auto_39692 ?auto_39694 ) ) ( not ( = ?auto_39691 ?auto_39694 ) ) ( not ( = ?auto_39689 ?auto_39691 ) ) ( not ( = ?auto_39689 ?auto_39693 ) ) ( not ( = ?auto_39689 ?auto_39692 ) ) ( not ( = ?auto_39690 ?auto_39691 ) ) ( not ( = ?auto_39690 ?auto_39693 ) ) ( not ( = ?auto_39690 ?auto_39692 ) ) ( not ( = ?auto_39695 ?auto_39691 ) ) ( not ( = ?auto_39695 ?auto_39693 ) ) ( not ( = ?auto_39695 ?auto_39692 ) ) ( ON ?auto_39694 ?auto_39695 ) ( ON ?auto_39691 ?auto_39694 ) ( CLEAR ?auto_39691 ) ( HOLDING ?auto_39692 ) ( CLEAR ?auto_39693 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39693 ?auto_39692 )
      ( MAKE-1PILE ?auto_39689 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40542 - BLOCK
    )
    :vars
    (
      ?auto_40545 - BLOCK
      ?auto_40543 - BLOCK
      ?auto_40547 - BLOCK
      ?auto_40544 - BLOCK
      ?auto_40546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40545 ?auto_40542 ) ( ON-TABLE ?auto_40542 ) ( not ( = ?auto_40542 ?auto_40545 ) ) ( not ( = ?auto_40542 ?auto_40543 ) ) ( not ( = ?auto_40542 ?auto_40547 ) ) ( not ( = ?auto_40545 ?auto_40543 ) ) ( not ( = ?auto_40545 ?auto_40547 ) ) ( not ( = ?auto_40543 ?auto_40547 ) ) ( ON ?auto_40543 ?auto_40545 ) ( not ( = ?auto_40544 ?auto_40546 ) ) ( not ( = ?auto_40544 ?auto_40547 ) ) ( not ( = ?auto_40546 ?auto_40547 ) ) ( not ( = ?auto_40542 ?auto_40546 ) ) ( not ( = ?auto_40542 ?auto_40544 ) ) ( not ( = ?auto_40545 ?auto_40546 ) ) ( not ( = ?auto_40545 ?auto_40544 ) ) ( not ( = ?auto_40543 ?auto_40546 ) ) ( not ( = ?auto_40543 ?auto_40544 ) ) ( ON ?auto_40547 ?auto_40543 ) ( ON ?auto_40546 ?auto_40547 ) ( ON ?auto_40544 ?auto_40546 ) ( CLEAR ?auto_40544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40542 ?auto_40545 ?auto_40543 ?auto_40547 ?auto_40546 )
      ( MAKE-1PILE ?auto_40542 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39703 - BLOCK
    )
    :vars
    (
      ?auto_39706 - BLOCK
      ?auto_39707 - BLOCK
      ?auto_39705 - BLOCK
      ?auto_39704 - BLOCK
      ?auto_39708 - BLOCK
      ?auto_39709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39706 ?auto_39703 ) ( ON-TABLE ?auto_39703 ) ( not ( = ?auto_39703 ?auto_39706 ) ) ( not ( = ?auto_39703 ?auto_39707 ) ) ( not ( = ?auto_39703 ?auto_39705 ) ) ( not ( = ?auto_39706 ?auto_39707 ) ) ( not ( = ?auto_39706 ?auto_39705 ) ) ( not ( = ?auto_39707 ?auto_39705 ) ) ( ON ?auto_39707 ?auto_39706 ) ( not ( = ?auto_39704 ?auto_39708 ) ) ( not ( = ?auto_39704 ?auto_39709 ) ) ( not ( = ?auto_39704 ?auto_39705 ) ) ( not ( = ?auto_39708 ?auto_39709 ) ) ( not ( = ?auto_39708 ?auto_39705 ) ) ( not ( = ?auto_39709 ?auto_39705 ) ) ( not ( = ?auto_39703 ?auto_39709 ) ) ( not ( = ?auto_39703 ?auto_39704 ) ) ( not ( = ?auto_39703 ?auto_39708 ) ) ( not ( = ?auto_39706 ?auto_39709 ) ) ( not ( = ?auto_39706 ?auto_39704 ) ) ( not ( = ?auto_39706 ?auto_39708 ) ) ( not ( = ?auto_39707 ?auto_39709 ) ) ( not ( = ?auto_39707 ?auto_39704 ) ) ( not ( = ?auto_39707 ?auto_39708 ) ) ( ON ?auto_39705 ?auto_39707 ) ( ON ?auto_39709 ?auto_39705 ) ( ON ?auto_39708 ?auto_39709 ) ( CLEAR ?auto_39708 ) ( HOLDING ?auto_39704 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39704 )
      ( MAKE-1PILE ?auto_39703 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39710 - BLOCK
    )
    :vars
    (
      ?auto_39715 - BLOCK
      ?auto_39713 - BLOCK
      ?auto_39716 - BLOCK
      ?auto_39711 - BLOCK
      ?auto_39712 - BLOCK
      ?auto_39714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39715 ?auto_39710 ) ( ON-TABLE ?auto_39710 ) ( not ( = ?auto_39710 ?auto_39715 ) ) ( not ( = ?auto_39710 ?auto_39713 ) ) ( not ( = ?auto_39710 ?auto_39716 ) ) ( not ( = ?auto_39715 ?auto_39713 ) ) ( not ( = ?auto_39715 ?auto_39716 ) ) ( not ( = ?auto_39713 ?auto_39716 ) ) ( ON ?auto_39713 ?auto_39715 ) ( not ( = ?auto_39711 ?auto_39712 ) ) ( not ( = ?auto_39711 ?auto_39714 ) ) ( not ( = ?auto_39711 ?auto_39716 ) ) ( not ( = ?auto_39712 ?auto_39714 ) ) ( not ( = ?auto_39712 ?auto_39716 ) ) ( not ( = ?auto_39714 ?auto_39716 ) ) ( not ( = ?auto_39710 ?auto_39714 ) ) ( not ( = ?auto_39710 ?auto_39711 ) ) ( not ( = ?auto_39710 ?auto_39712 ) ) ( not ( = ?auto_39715 ?auto_39714 ) ) ( not ( = ?auto_39715 ?auto_39711 ) ) ( not ( = ?auto_39715 ?auto_39712 ) ) ( not ( = ?auto_39713 ?auto_39714 ) ) ( not ( = ?auto_39713 ?auto_39711 ) ) ( not ( = ?auto_39713 ?auto_39712 ) ) ( ON ?auto_39716 ?auto_39713 ) ( ON ?auto_39714 ?auto_39716 ) ( ON ?auto_39712 ?auto_39714 ) ( ON ?auto_39711 ?auto_39712 ) ( CLEAR ?auto_39711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39710 ?auto_39715 ?auto_39713 ?auto_39716 ?auto_39714 ?auto_39712 )
      ( MAKE-1PILE ?auto_39710 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39723 - BLOCK
      ?auto_39724 - BLOCK
      ?auto_39725 - BLOCK
      ?auto_39726 - BLOCK
      ?auto_39727 - BLOCK
      ?auto_39728 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_39728 ) ( CLEAR ?auto_39727 ) ( ON-TABLE ?auto_39723 ) ( ON ?auto_39724 ?auto_39723 ) ( ON ?auto_39725 ?auto_39724 ) ( ON ?auto_39726 ?auto_39725 ) ( ON ?auto_39727 ?auto_39726 ) ( not ( = ?auto_39723 ?auto_39724 ) ) ( not ( = ?auto_39723 ?auto_39725 ) ) ( not ( = ?auto_39723 ?auto_39726 ) ) ( not ( = ?auto_39723 ?auto_39727 ) ) ( not ( = ?auto_39723 ?auto_39728 ) ) ( not ( = ?auto_39724 ?auto_39725 ) ) ( not ( = ?auto_39724 ?auto_39726 ) ) ( not ( = ?auto_39724 ?auto_39727 ) ) ( not ( = ?auto_39724 ?auto_39728 ) ) ( not ( = ?auto_39725 ?auto_39726 ) ) ( not ( = ?auto_39725 ?auto_39727 ) ) ( not ( = ?auto_39725 ?auto_39728 ) ) ( not ( = ?auto_39726 ?auto_39727 ) ) ( not ( = ?auto_39726 ?auto_39728 ) ) ( not ( = ?auto_39727 ?auto_39728 ) ) )
    :subtasks
    ( ( !STACK ?auto_39728 ?auto_39727 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39729 - BLOCK
      ?auto_39730 - BLOCK
      ?auto_39731 - BLOCK
      ?auto_39732 - BLOCK
      ?auto_39733 - BLOCK
      ?auto_39734 - BLOCK
    )
    :vars
    (
      ?auto_39735 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_39733 ) ( ON-TABLE ?auto_39729 ) ( ON ?auto_39730 ?auto_39729 ) ( ON ?auto_39731 ?auto_39730 ) ( ON ?auto_39732 ?auto_39731 ) ( ON ?auto_39733 ?auto_39732 ) ( not ( = ?auto_39729 ?auto_39730 ) ) ( not ( = ?auto_39729 ?auto_39731 ) ) ( not ( = ?auto_39729 ?auto_39732 ) ) ( not ( = ?auto_39729 ?auto_39733 ) ) ( not ( = ?auto_39729 ?auto_39734 ) ) ( not ( = ?auto_39730 ?auto_39731 ) ) ( not ( = ?auto_39730 ?auto_39732 ) ) ( not ( = ?auto_39730 ?auto_39733 ) ) ( not ( = ?auto_39730 ?auto_39734 ) ) ( not ( = ?auto_39731 ?auto_39732 ) ) ( not ( = ?auto_39731 ?auto_39733 ) ) ( not ( = ?auto_39731 ?auto_39734 ) ) ( not ( = ?auto_39732 ?auto_39733 ) ) ( not ( = ?auto_39732 ?auto_39734 ) ) ( not ( = ?auto_39733 ?auto_39734 ) ) ( ON ?auto_39734 ?auto_39735 ) ( CLEAR ?auto_39734 ) ( HAND-EMPTY ) ( not ( = ?auto_39729 ?auto_39735 ) ) ( not ( = ?auto_39730 ?auto_39735 ) ) ( not ( = ?auto_39731 ?auto_39735 ) ) ( not ( = ?auto_39732 ?auto_39735 ) ) ( not ( = ?auto_39733 ?auto_39735 ) ) ( not ( = ?auto_39734 ?auto_39735 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_39734 ?auto_39735 )
      ( MAKE-6PILE ?auto_39729 ?auto_39730 ?auto_39731 ?auto_39732 ?auto_39733 ?auto_39734 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39736 - BLOCK
      ?auto_39737 - BLOCK
      ?auto_39738 - BLOCK
      ?auto_39739 - BLOCK
      ?auto_39740 - BLOCK
      ?auto_39741 - BLOCK
    )
    :vars
    (
      ?auto_39742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39736 ) ( ON ?auto_39737 ?auto_39736 ) ( ON ?auto_39738 ?auto_39737 ) ( ON ?auto_39739 ?auto_39738 ) ( not ( = ?auto_39736 ?auto_39737 ) ) ( not ( = ?auto_39736 ?auto_39738 ) ) ( not ( = ?auto_39736 ?auto_39739 ) ) ( not ( = ?auto_39736 ?auto_39740 ) ) ( not ( = ?auto_39736 ?auto_39741 ) ) ( not ( = ?auto_39737 ?auto_39738 ) ) ( not ( = ?auto_39737 ?auto_39739 ) ) ( not ( = ?auto_39737 ?auto_39740 ) ) ( not ( = ?auto_39737 ?auto_39741 ) ) ( not ( = ?auto_39738 ?auto_39739 ) ) ( not ( = ?auto_39738 ?auto_39740 ) ) ( not ( = ?auto_39738 ?auto_39741 ) ) ( not ( = ?auto_39739 ?auto_39740 ) ) ( not ( = ?auto_39739 ?auto_39741 ) ) ( not ( = ?auto_39740 ?auto_39741 ) ) ( ON ?auto_39741 ?auto_39742 ) ( CLEAR ?auto_39741 ) ( not ( = ?auto_39736 ?auto_39742 ) ) ( not ( = ?auto_39737 ?auto_39742 ) ) ( not ( = ?auto_39738 ?auto_39742 ) ) ( not ( = ?auto_39739 ?auto_39742 ) ) ( not ( = ?auto_39740 ?auto_39742 ) ) ( not ( = ?auto_39741 ?auto_39742 ) ) ( HOLDING ?auto_39740 ) ( CLEAR ?auto_39739 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39736 ?auto_39737 ?auto_39738 ?auto_39739 ?auto_39740 )
      ( MAKE-6PILE ?auto_39736 ?auto_39737 ?auto_39738 ?auto_39739 ?auto_39740 ?auto_39741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39743 - BLOCK
      ?auto_39744 - BLOCK
      ?auto_39745 - BLOCK
      ?auto_39746 - BLOCK
      ?auto_39747 - BLOCK
      ?auto_39748 - BLOCK
    )
    :vars
    (
      ?auto_39749 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39743 ) ( ON ?auto_39744 ?auto_39743 ) ( ON ?auto_39745 ?auto_39744 ) ( ON ?auto_39746 ?auto_39745 ) ( not ( = ?auto_39743 ?auto_39744 ) ) ( not ( = ?auto_39743 ?auto_39745 ) ) ( not ( = ?auto_39743 ?auto_39746 ) ) ( not ( = ?auto_39743 ?auto_39747 ) ) ( not ( = ?auto_39743 ?auto_39748 ) ) ( not ( = ?auto_39744 ?auto_39745 ) ) ( not ( = ?auto_39744 ?auto_39746 ) ) ( not ( = ?auto_39744 ?auto_39747 ) ) ( not ( = ?auto_39744 ?auto_39748 ) ) ( not ( = ?auto_39745 ?auto_39746 ) ) ( not ( = ?auto_39745 ?auto_39747 ) ) ( not ( = ?auto_39745 ?auto_39748 ) ) ( not ( = ?auto_39746 ?auto_39747 ) ) ( not ( = ?auto_39746 ?auto_39748 ) ) ( not ( = ?auto_39747 ?auto_39748 ) ) ( ON ?auto_39748 ?auto_39749 ) ( not ( = ?auto_39743 ?auto_39749 ) ) ( not ( = ?auto_39744 ?auto_39749 ) ) ( not ( = ?auto_39745 ?auto_39749 ) ) ( not ( = ?auto_39746 ?auto_39749 ) ) ( not ( = ?auto_39747 ?auto_39749 ) ) ( not ( = ?auto_39748 ?auto_39749 ) ) ( CLEAR ?auto_39746 ) ( ON ?auto_39747 ?auto_39748 ) ( CLEAR ?auto_39747 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39749 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39749 ?auto_39748 )
      ( MAKE-6PILE ?auto_39743 ?auto_39744 ?auto_39745 ?auto_39746 ?auto_39747 ?auto_39748 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39750 - BLOCK
      ?auto_39751 - BLOCK
      ?auto_39752 - BLOCK
      ?auto_39753 - BLOCK
      ?auto_39754 - BLOCK
      ?auto_39755 - BLOCK
    )
    :vars
    (
      ?auto_39756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39750 ) ( ON ?auto_39751 ?auto_39750 ) ( ON ?auto_39752 ?auto_39751 ) ( not ( = ?auto_39750 ?auto_39751 ) ) ( not ( = ?auto_39750 ?auto_39752 ) ) ( not ( = ?auto_39750 ?auto_39753 ) ) ( not ( = ?auto_39750 ?auto_39754 ) ) ( not ( = ?auto_39750 ?auto_39755 ) ) ( not ( = ?auto_39751 ?auto_39752 ) ) ( not ( = ?auto_39751 ?auto_39753 ) ) ( not ( = ?auto_39751 ?auto_39754 ) ) ( not ( = ?auto_39751 ?auto_39755 ) ) ( not ( = ?auto_39752 ?auto_39753 ) ) ( not ( = ?auto_39752 ?auto_39754 ) ) ( not ( = ?auto_39752 ?auto_39755 ) ) ( not ( = ?auto_39753 ?auto_39754 ) ) ( not ( = ?auto_39753 ?auto_39755 ) ) ( not ( = ?auto_39754 ?auto_39755 ) ) ( ON ?auto_39755 ?auto_39756 ) ( not ( = ?auto_39750 ?auto_39756 ) ) ( not ( = ?auto_39751 ?auto_39756 ) ) ( not ( = ?auto_39752 ?auto_39756 ) ) ( not ( = ?auto_39753 ?auto_39756 ) ) ( not ( = ?auto_39754 ?auto_39756 ) ) ( not ( = ?auto_39755 ?auto_39756 ) ) ( ON ?auto_39754 ?auto_39755 ) ( CLEAR ?auto_39754 ) ( ON-TABLE ?auto_39756 ) ( HOLDING ?auto_39753 ) ( CLEAR ?auto_39752 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39750 ?auto_39751 ?auto_39752 ?auto_39753 )
      ( MAKE-6PILE ?auto_39750 ?auto_39751 ?auto_39752 ?auto_39753 ?auto_39754 ?auto_39755 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39757 - BLOCK
      ?auto_39758 - BLOCK
      ?auto_39759 - BLOCK
      ?auto_39760 - BLOCK
      ?auto_39761 - BLOCK
      ?auto_39762 - BLOCK
    )
    :vars
    (
      ?auto_39763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39757 ) ( ON ?auto_39758 ?auto_39757 ) ( ON ?auto_39759 ?auto_39758 ) ( not ( = ?auto_39757 ?auto_39758 ) ) ( not ( = ?auto_39757 ?auto_39759 ) ) ( not ( = ?auto_39757 ?auto_39760 ) ) ( not ( = ?auto_39757 ?auto_39761 ) ) ( not ( = ?auto_39757 ?auto_39762 ) ) ( not ( = ?auto_39758 ?auto_39759 ) ) ( not ( = ?auto_39758 ?auto_39760 ) ) ( not ( = ?auto_39758 ?auto_39761 ) ) ( not ( = ?auto_39758 ?auto_39762 ) ) ( not ( = ?auto_39759 ?auto_39760 ) ) ( not ( = ?auto_39759 ?auto_39761 ) ) ( not ( = ?auto_39759 ?auto_39762 ) ) ( not ( = ?auto_39760 ?auto_39761 ) ) ( not ( = ?auto_39760 ?auto_39762 ) ) ( not ( = ?auto_39761 ?auto_39762 ) ) ( ON ?auto_39762 ?auto_39763 ) ( not ( = ?auto_39757 ?auto_39763 ) ) ( not ( = ?auto_39758 ?auto_39763 ) ) ( not ( = ?auto_39759 ?auto_39763 ) ) ( not ( = ?auto_39760 ?auto_39763 ) ) ( not ( = ?auto_39761 ?auto_39763 ) ) ( not ( = ?auto_39762 ?auto_39763 ) ) ( ON ?auto_39761 ?auto_39762 ) ( ON-TABLE ?auto_39763 ) ( CLEAR ?auto_39759 ) ( ON ?auto_39760 ?auto_39761 ) ( CLEAR ?auto_39760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39763 ?auto_39762 ?auto_39761 )
      ( MAKE-6PILE ?auto_39757 ?auto_39758 ?auto_39759 ?auto_39760 ?auto_39761 ?auto_39762 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39764 - BLOCK
      ?auto_39765 - BLOCK
      ?auto_39766 - BLOCK
      ?auto_39767 - BLOCK
      ?auto_39768 - BLOCK
      ?auto_39769 - BLOCK
    )
    :vars
    (
      ?auto_39770 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39764 ) ( ON ?auto_39765 ?auto_39764 ) ( not ( = ?auto_39764 ?auto_39765 ) ) ( not ( = ?auto_39764 ?auto_39766 ) ) ( not ( = ?auto_39764 ?auto_39767 ) ) ( not ( = ?auto_39764 ?auto_39768 ) ) ( not ( = ?auto_39764 ?auto_39769 ) ) ( not ( = ?auto_39765 ?auto_39766 ) ) ( not ( = ?auto_39765 ?auto_39767 ) ) ( not ( = ?auto_39765 ?auto_39768 ) ) ( not ( = ?auto_39765 ?auto_39769 ) ) ( not ( = ?auto_39766 ?auto_39767 ) ) ( not ( = ?auto_39766 ?auto_39768 ) ) ( not ( = ?auto_39766 ?auto_39769 ) ) ( not ( = ?auto_39767 ?auto_39768 ) ) ( not ( = ?auto_39767 ?auto_39769 ) ) ( not ( = ?auto_39768 ?auto_39769 ) ) ( ON ?auto_39769 ?auto_39770 ) ( not ( = ?auto_39764 ?auto_39770 ) ) ( not ( = ?auto_39765 ?auto_39770 ) ) ( not ( = ?auto_39766 ?auto_39770 ) ) ( not ( = ?auto_39767 ?auto_39770 ) ) ( not ( = ?auto_39768 ?auto_39770 ) ) ( not ( = ?auto_39769 ?auto_39770 ) ) ( ON ?auto_39768 ?auto_39769 ) ( ON-TABLE ?auto_39770 ) ( ON ?auto_39767 ?auto_39768 ) ( CLEAR ?auto_39767 ) ( HOLDING ?auto_39766 ) ( CLEAR ?auto_39765 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39764 ?auto_39765 ?auto_39766 )
      ( MAKE-6PILE ?auto_39764 ?auto_39765 ?auto_39766 ?auto_39767 ?auto_39768 ?auto_39769 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39771 - BLOCK
      ?auto_39772 - BLOCK
      ?auto_39773 - BLOCK
      ?auto_39774 - BLOCK
      ?auto_39775 - BLOCK
      ?auto_39776 - BLOCK
    )
    :vars
    (
      ?auto_39777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39771 ) ( ON ?auto_39772 ?auto_39771 ) ( not ( = ?auto_39771 ?auto_39772 ) ) ( not ( = ?auto_39771 ?auto_39773 ) ) ( not ( = ?auto_39771 ?auto_39774 ) ) ( not ( = ?auto_39771 ?auto_39775 ) ) ( not ( = ?auto_39771 ?auto_39776 ) ) ( not ( = ?auto_39772 ?auto_39773 ) ) ( not ( = ?auto_39772 ?auto_39774 ) ) ( not ( = ?auto_39772 ?auto_39775 ) ) ( not ( = ?auto_39772 ?auto_39776 ) ) ( not ( = ?auto_39773 ?auto_39774 ) ) ( not ( = ?auto_39773 ?auto_39775 ) ) ( not ( = ?auto_39773 ?auto_39776 ) ) ( not ( = ?auto_39774 ?auto_39775 ) ) ( not ( = ?auto_39774 ?auto_39776 ) ) ( not ( = ?auto_39775 ?auto_39776 ) ) ( ON ?auto_39776 ?auto_39777 ) ( not ( = ?auto_39771 ?auto_39777 ) ) ( not ( = ?auto_39772 ?auto_39777 ) ) ( not ( = ?auto_39773 ?auto_39777 ) ) ( not ( = ?auto_39774 ?auto_39777 ) ) ( not ( = ?auto_39775 ?auto_39777 ) ) ( not ( = ?auto_39776 ?auto_39777 ) ) ( ON ?auto_39775 ?auto_39776 ) ( ON-TABLE ?auto_39777 ) ( ON ?auto_39774 ?auto_39775 ) ( CLEAR ?auto_39772 ) ( ON ?auto_39773 ?auto_39774 ) ( CLEAR ?auto_39773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39777 ?auto_39776 ?auto_39775 ?auto_39774 )
      ( MAKE-6PILE ?auto_39771 ?auto_39772 ?auto_39773 ?auto_39774 ?auto_39775 ?auto_39776 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39778 - BLOCK
      ?auto_39779 - BLOCK
      ?auto_39780 - BLOCK
      ?auto_39781 - BLOCK
      ?auto_39782 - BLOCK
      ?auto_39783 - BLOCK
    )
    :vars
    (
      ?auto_39784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39778 ) ( not ( = ?auto_39778 ?auto_39779 ) ) ( not ( = ?auto_39778 ?auto_39780 ) ) ( not ( = ?auto_39778 ?auto_39781 ) ) ( not ( = ?auto_39778 ?auto_39782 ) ) ( not ( = ?auto_39778 ?auto_39783 ) ) ( not ( = ?auto_39779 ?auto_39780 ) ) ( not ( = ?auto_39779 ?auto_39781 ) ) ( not ( = ?auto_39779 ?auto_39782 ) ) ( not ( = ?auto_39779 ?auto_39783 ) ) ( not ( = ?auto_39780 ?auto_39781 ) ) ( not ( = ?auto_39780 ?auto_39782 ) ) ( not ( = ?auto_39780 ?auto_39783 ) ) ( not ( = ?auto_39781 ?auto_39782 ) ) ( not ( = ?auto_39781 ?auto_39783 ) ) ( not ( = ?auto_39782 ?auto_39783 ) ) ( ON ?auto_39783 ?auto_39784 ) ( not ( = ?auto_39778 ?auto_39784 ) ) ( not ( = ?auto_39779 ?auto_39784 ) ) ( not ( = ?auto_39780 ?auto_39784 ) ) ( not ( = ?auto_39781 ?auto_39784 ) ) ( not ( = ?auto_39782 ?auto_39784 ) ) ( not ( = ?auto_39783 ?auto_39784 ) ) ( ON ?auto_39782 ?auto_39783 ) ( ON-TABLE ?auto_39784 ) ( ON ?auto_39781 ?auto_39782 ) ( ON ?auto_39780 ?auto_39781 ) ( CLEAR ?auto_39780 ) ( HOLDING ?auto_39779 ) ( CLEAR ?auto_39778 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39778 ?auto_39779 )
      ( MAKE-6PILE ?auto_39778 ?auto_39779 ?auto_39780 ?auto_39781 ?auto_39782 ?auto_39783 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39785 - BLOCK
      ?auto_39786 - BLOCK
      ?auto_39787 - BLOCK
      ?auto_39788 - BLOCK
      ?auto_39789 - BLOCK
      ?auto_39790 - BLOCK
    )
    :vars
    (
      ?auto_39791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_39785 ) ( not ( = ?auto_39785 ?auto_39786 ) ) ( not ( = ?auto_39785 ?auto_39787 ) ) ( not ( = ?auto_39785 ?auto_39788 ) ) ( not ( = ?auto_39785 ?auto_39789 ) ) ( not ( = ?auto_39785 ?auto_39790 ) ) ( not ( = ?auto_39786 ?auto_39787 ) ) ( not ( = ?auto_39786 ?auto_39788 ) ) ( not ( = ?auto_39786 ?auto_39789 ) ) ( not ( = ?auto_39786 ?auto_39790 ) ) ( not ( = ?auto_39787 ?auto_39788 ) ) ( not ( = ?auto_39787 ?auto_39789 ) ) ( not ( = ?auto_39787 ?auto_39790 ) ) ( not ( = ?auto_39788 ?auto_39789 ) ) ( not ( = ?auto_39788 ?auto_39790 ) ) ( not ( = ?auto_39789 ?auto_39790 ) ) ( ON ?auto_39790 ?auto_39791 ) ( not ( = ?auto_39785 ?auto_39791 ) ) ( not ( = ?auto_39786 ?auto_39791 ) ) ( not ( = ?auto_39787 ?auto_39791 ) ) ( not ( = ?auto_39788 ?auto_39791 ) ) ( not ( = ?auto_39789 ?auto_39791 ) ) ( not ( = ?auto_39790 ?auto_39791 ) ) ( ON ?auto_39789 ?auto_39790 ) ( ON-TABLE ?auto_39791 ) ( ON ?auto_39788 ?auto_39789 ) ( ON ?auto_39787 ?auto_39788 ) ( CLEAR ?auto_39785 ) ( ON ?auto_39786 ?auto_39787 ) ( CLEAR ?auto_39786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39791 ?auto_39790 ?auto_39789 ?auto_39788 ?auto_39787 )
      ( MAKE-6PILE ?auto_39785 ?auto_39786 ?auto_39787 ?auto_39788 ?auto_39789 ?auto_39790 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39792 - BLOCK
      ?auto_39793 - BLOCK
      ?auto_39794 - BLOCK
      ?auto_39795 - BLOCK
      ?auto_39796 - BLOCK
      ?auto_39797 - BLOCK
    )
    :vars
    (
      ?auto_39798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39792 ?auto_39793 ) ) ( not ( = ?auto_39792 ?auto_39794 ) ) ( not ( = ?auto_39792 ?auto_39795 ) ) ( not ( = ?auto_39792 ?auto_39796 ) ) ( not ( = ?auto_39792 ?auto_39797 ) ) ( not ( = ?auto_39793 ?auto_39794 ) ) ( not ( = ?auto_39793 ?auto_39795 ) ) ( not ( = ?auto_39793 ?auto_39796 ) ) ( not ( = ?auto_39793 ?auto_39797 ) ) ( not ( = ?auto_39794 ?auto_39795 ) ) ( not ( = ?auto_39794 ?auto_39796 ) ) ( not ( = ?auto_39794 ?auto_39797 ) ) ( not ( = ?auto_39795 ?auto_39796 ) ) ( not ( = ?auto_39795 ?auto_39797 ) ) ( not ( = ?auto_39796 ?auto_39797 ) ) ( ON ?auto_39797 ?auto_39798 ) ( not ( = ?auto_39792 ?auto_39798 ) ) ( not ( = ?auto_39793 ?auto_39798 ) ) ( not ( = ?auto_39794 ?auto_39798 ) ) ( not ( = ?auto_39795 ?auto_39798 ) ) ( not ( = ?auto_39796 ?auto_39798 ) ) ( not ( = ?auto_39797 ?auto_39798 ) ) ( ON ?auto_39796 ?auto_39797 ) ( ON-TABLE ?auto_39798 ) ( ON ?auto_39795 ?auto_39796 ) ( ON ?auto_39794 ?auto_39795 ) ( ON ?auto_39793 ?auto_39794 ) ( CLEAR ?auto_39793 ) ( HOLDING ?auto_39792 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39792 )
      ( MAKE-6PILE ?auto_39792 ?auto_39793 ?auto_39794 ?auto_39795 ?auto_39796 ?auto_39797 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_39799 - BLOCK
      ?auto_39800 - BLOCK
      ?auto_39801 - BLOCK
      ?auto_39802 - BLOCK
      ?auto_39803 - BLOCK
      ?auto_39804 - BLOCK
    )
    :vars
    (
      ?auto_39805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39799 ?auto_39800 ) ) ( not ( = ?auto_39799 ?auto_39801 ) ) ( not ( = ?auto_39799 ?auto_39802 ) ) ( not ( = ?auto_39799 ?auto_39803 ) ) ( not ( = ?auto_39799 ?auto_39804 ) ) ( not ( = ?auto_39800 ?auto_39801 ) ) ( not ( = ?auto_39800 ?auto_39802 ) ) ( not ( = ?auto_39800 ?auto_39803 ) ) ( not ( = ?auto_39800 ?auto_39804 ) ) ( not ( = ?auto_39801 ?auto_39802 ) ) ( not ( = ?auto_39801 ?auto_39803 ) ) ( not ( = ?auto_39801 ?auto_39804 ) ) ( not ( = ?auto_39802 ?auto_39803 ) ) ( not ( = ?auto_39802 ?auto_39804 ) ) ( not ( = ?auto_39803 ?auto_39804 ) ) ( ON ?auto_39804 ?auto_39805 ) ( not ( = ?auto_39799 ?auto_39805 ) ) ( not ( = ?auto_39800 ?auto_39805 ) ) ( not ( = ?auto_39801 ?auto_39805 ) ) ( not ( = ?auto_39802 ?auto_39805 ) ) ( not ( = ?auto_39803 ?auto_39805 ) ) ( not ( = ?auto_39804 ?auto_39805 ) ) ( ON ?auto_39803 ?auto_39804 ) ( ON-TABLE ?auto_39805 ) ( ON ?auto_39802 ?auto_39803 ) ( ON ?auto_39801 ?auto_39802 ) ( ON ?auto_39800 ?auto_39801 ) ( ON ?auto_39799 ?auto_39800 ) ( CLEAR ?auto_39799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39805 ?auto_39804 ?auto_39803 ?auto_39802 ?auto_39801 ?auto_39800 )
      ( MAKE-6PILE ?auto_39799 ?auto_39800 ?auto_39801 ?auto_39802 ?auto_39803 ?auto_39804 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39886 - BLOCK
    )
    :vars
    (
      ?auto_39887 - BLOCK
      ?auto_39888 - BLOCK
      ?auto_39889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39886 ?auto_39887 ) ( CLEAR ?auto_39886 ) ( not ( = ?auto_39886 ?auto_39887 ) ) ( HOLDING ?auto_39888 ) ( CLEAR ?auto_39889 ) ( not ( = ?auto_39886 ?auto_39888 ) ) ( not ( = ?auto_39886 ?auto_39889 ) ) ( not ( = ?auto_39887 ?auto_39888 ) ) ( not ( = ?auto_39887 ?auto_39889 ) ) ( not ( = ?auto_39888 ?auto_39889 ) ) )
    :subtasks
    ( ( !STACK ?auto_39888 ?auto_39889 )
      ( MAKE-1PILE ?auto_39886 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39890 - BLOCK
    )
    :vars
    (
      ?auto_39891 - BLOCK
      ?auto_39893 - BLOCK
      ?auto_39892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39890 ?auto_39891 ) ( not ( = ?auto_39890 ?auto_39891 ) ) ( CLEAR ?auto_39893 ) ( not ( = ?auto_39890 ?auto_39892 ) ) ( not ( = ?auto_39890 ?auto_39893 ) ) ( not ( = ?auto_39891 ?auto_39892 ) ) ( not ( = ?auto_39891 ?auto_39893 ) ) ( not ( = ?auto_39892 ?auto_39893 ) ) ( ON ?auto_39892 ?auto_39890 ) ( CLEAR ?auto_39892 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_39891 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39891 ?auto_39890 )
      ( MAKE-1PILE ?auto_39890 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39894 - BLOCK
    )
    :vars
    (
      ?auto_39896 - BLOCK
      ?auto_39895 - BLOCK
      ?auto_39897 - BLOCK
      ?auto_39898 - BLOCK
      ?auto_39899 - BLOCK
      ?auto_39900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39894 ?auto_39896 ) ( not ( = ?auto_39894 ?auto_39896 ) ) ( not ( = ?auto_39894 ?auto_39895 ) ) ( not ( = ?auto_39894 ?auto_39897 ) ) ( not ( = ?auto_39896 ?auto_39895 ) ) ( not ( = ?auto_39896 ?auto_39897 ) ) ( not ( = ?auto_39895 ?auto_39897 ) ) ( ON ?auto_39895 ?auto_39894 ) ( CLEAR ?auto_39895 ) ( ON-TABLE ?auto_39896 ) ( HOLDING ?auto_39897 ) ( CLEAR ?auto_39898 ) ( ON-TABLE ?auto_39899 ) ( ON ?auto_39900 ?auto_39899 ) ( ON ?auto_39898 ?auto_39900 ) ( not ( = ?auto_39899 ?auto_39900 ) ) ( not ( = ?auto_39899 ?auto_39898 ) ) ( not ( = ?auto_39899 ?auto_39897 ) ) ( not ( = ?auto_39900 ?auto_39898 ) ) ( not ( = ?auto_39900 ?auto_39897 ) ) ( not ( = ?auto_39898 ?auto_39897 ) ) ( not ( = ?auto_39894 ?auto_39898 ) ) ( not ( = ?auto_39894 ?auto_39899 ) ) ( not ( = ?auto_39894 ?auto_39900 ) ) ( not ( = ?auto_39896 ?auto_39898 ) ) ( not ( = ?auto_39896 ?auto_39899 ) ) ( not ( = ?auto_39896 ?auto_39900 ) ) ( not ( = ?auto_39895 ?auto_39898 ) ) ( not ( = ?auto_39895 ?auto_39899 ) ) ( not ( = ?auto_39895 ?auto_39900 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39899 ?auto_39900 ?auto_39898 ?auto_39897 )
      ( MAKE-1PILE ?auto_39894 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39901 - BLOCK
    )
    :vars
    (
      ?auto_39904 - BLOCK
      ?auto_39907 - BLOCK
      ?auto_39905 - BLOCK
      ?auto_39902 - BLOCK
      ?auto_39906 - BLOCK
      ?auto_39903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39901 ?auto_39904 ) ( not ( = ?auto_39901 ?auto_39904 ) ) ( not ( = ?auto_39901 ?auto_39907 ) ) ( not ( = ?auto_39901 ?auto_39905 ) ) ( not ( = ?auto_39904 ?auto_39907 ) ) ( not ( = ?auto_39904 ?auto_39905 ) ) ( not ( = ?auto_39907 ?auto_39905 ) ) ( ON ?auto_39907 ?auto_39901 ) ( ON-TABLE ?auto_39904 ) ( CLEAR ?auto_39902 ) ( ON-TABLE ?auto_39906 ) ( ON ?auto_39903 ?auto_39906 ) ( ON ?auto_39902 ?auto_39903 ) ( not ( = ?auto_39906 ?auto_39903 ) ) ( not ( = ?auto_39906 ?auto_39902 ) ) ( not ( = ?auto_39906 ?auto_39905 ) ) ( not ( = ?auto_39903 ?auto_39902 ) ) ( not ( = ?auto_39903 ?auto_39905 ) ) ( not ( = ?auto_39902 ?auto_39905 ) ) ( not ( = ?auto_39901 ?auto_39902 ) ) ( not ( = ?auto_39901 ?auto_39906 ) ) ( not ( = ?auto_39901 ?auto_39903 ) ) ( not ( = ?auto_39904 ?auto_39902 ) ) ( not ( = ?auto_39904 ?auto_39906 ) ) ( not ( = ?auto_39904 ?auto_39903 ) ) ( not ( = ?auto_39907 ?auto_39902 ) ) ( not ( = ?auto_39907 ?auto_39906 ) ) ( not ( = ?auto_39907 ?auto_39903 ) ) ( ON ?auto_39905 ?auto_39907 ) ( CLEAR ?auto_39905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39904 ?auto_39901 ?auto_39907 )
      ( MAKE-1PILE ?auto_39901 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39908 - BLOCK
    )
    :vars
    (
      ?auto_39912 - BLOCK
      ?auto_39914 - BLOCK
      ?auto_39911 - BLOCK
      ?auto_39910 - BLOCK
      ?auto_39913 - BLOCK
      ?auto_39909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39908 ?auto_39912 ) ( not ( = ?auto_39908 ?auto_39912 ) ) ( not ( = ?auto_39908 ?auto_39914 ) ) ( not ( = ?auto_39908 ?auto_39911 ) ) ( not ( = ?auto_39912 ?auto_39914 ) ) ( not ( = ?auto_39912 ?auto_39911 ) ) ( not ( = ?auto_39914 ?auto_39911 ) ) ( ON ?auto_39914 ?auto_39908 ) ( ON-TABLE ?auto_39912 ) ( ON-TABLE ?auto_39910 ) ( ON ?auto_39913 ?auto_39910 ) ( not ( = ?auto_39910 ?auto_39913 ) ) ( not ( = ?auto_39910 ?auto_39909 ) ) ( not ( = ?auto_39910 ?auto_39911 ) ) ( not ( = ?auto_39913 ?auto_39909 ) ) ( not ( = ?auto_39913 ?auto_39911 ) ) ( not ( = ?auto_39909 ?auto_39911 ) ) ( not ( = ?auto_39908 ?auto_39909 ) ) ( not ( = ?auto_39908 ?auto_39910 ) ) ( not ( = ?auto_39908 ?auto_39913 ) ) ( not ( = ?auto_39912 ?auto_39909 ) ) ( not ( = ?auto_39912 ?auto_39910 ) ) ( not ( = ?auto_39912 ?auto_39913 ) ) ( not ( = ?auto_39914 ?auto_39909 ) ) ( not ( = ?auto_39914 ?auto_39910 ) ) ( not ( = ?auto_39914 ?auto_39913 ) ) ( ON ?auto_39911 ?auto_39914 ) ( CLEAR ?auto_39911 ) ( HOLDING ?auto_39909 ) ( CLEAR ?auto_39913 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_39910 ?auto_39913 ?auto_39909 )
      ( MAKE-1PILE ?auto_39908 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39915 - BLOCK
    )
    :vars
    (
      ?auto_39918 - BLOCK
      ?auto_39919 - BLOCK
      ?auto_39921 - BLOCK
      ?auto_39917 - BLOCK
      ?auto_39920 - BLOCK
      ?auto_39916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39915 ?auto_39918 ) ( not ( = ?auto_39915 ?auto_39918 ) ) ( not ( = ?auto_39915 ?auto_39919 ) ) ( not ( = ?auto_39915 ?auto_39921 ) ) ( not ( = ?auto_39918 ?auto_39919 ) ) ( not ( = ?auto_39918 ?auto_39921 ) ) ( not ( = ?auto_39919 ?auto_39921 ) ) ( ON ?auto_39919 ?auto_39915 ) ( ON-TABLE ?auto_39918 ) ( ON-TABLE ?auto_39917 ) ( ON ?auto_39920 ?auto_39917 ) ( not ( = ?auto_39917 ?auto_39920 ) ) ( not ( = ?auto_39917 ?auto_39916 ) ) ( not ( = ?auto_39917 ?auto_39921 ) ) ( not ( = ?auto_39920 ?auto_39916 ) ) ( not ( = ?auto_39920 ?auto_39921 ) ) ( not ( = ?auto_39916 ?auto_39921 ) ) ( not ( = ?auto_39915 ?auto_39916 ) ) ( not ( = ?auto_39915 ?auto_39917 ) ) ( not ( = ?auto_39915 ?auto_39920 ) ) ( not ( = ?auto_39918 ?auto_39916 ) ) ( not ( = ?auto_39918 ?auto_39917 ) ) ( not ( = ?auto_39918 ?auto_39920 ) ) ( not ( = ?auto_39919 ?auto_39916 ) ) ( not ( = ?auto_39919 ?auto_39917 ) ) ( not ( = ?auto_39919 ?auto_39920 ) ) ( ON ?auto_39921 ?auto_39919 ) ( CLEAR ?auto_39920 ) ( ON ?auto_39916 ?auto_39921 ) ( CLEAR ?auto_39916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_39918 ?auto_39915 ?auto_39919 ?auto_39921 )
      ( MAKE-1PILE ?auto_39915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39922 - BLOCK
    )
    :vars
    (
      ?auto_39924 - BLOCK
      ?auto_39926 - BLOCK
      ?auto_39928 - BLOCK
      ?auto_39923 - BLOCK
      ?auto_39927 - BLOCK
      ?auto_39925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39922 ?auto_39924 ) ( not ( = ?auto_39922 ?auto_39924 ) ) ( not ( = ?auto_39922 ?auto_39926 ) ) ( not ( = ?auto_39922 ?auto_39928 ) ) ( not ( = ?auto_39924 ?auto_39926 ) ) ( not ( = ?auto_39924 ?auto_39928 ) ) ( not ( = ?auto_39926 ?auto_39928 ) ) ( ON ?auto_39926 ?auto_39922 ) ( ON-TABLE ?auto_39924 ) ( ON-TABLE ?auto_39923 ) ( not ( = ?auto_39923 ?auto_39927 ) ) ( not ( = ?auto_39923 ?auto_39925 ) ) ( not ( = ?auto_39923 ?auto_39928 ) ) ( not ( = ?auto_39927 ?auto_39925 ) ) ( not ( = ?auto_39927 ?auto_39928 ) ) ( not ( = ?auto_39925 ?auto_39928 ) ) ( not ( = ?auto_39922 ?auto_39925 ) ) ( not ( = ?auto_39922 ?auto_39923 ) ) ( not ( = ?auto_39922 ?auto_39927 ) ) ( not ( = ?auto_39924 ?auto_39925 ) ) ( not ( = ?auto_39924 ?auto_39923 ) ) ( not ( = ?auto_39924 ?auto_39927 ) ) ( not ( = ?auto_39926 ?auto_39925 ) ) ( not ( = ?auto_39926 ?auto_39923 ) ) ( not ( = ?auto_39926 ?auto_39927 ) ) ( ON ?auto_39928 ?auto_39926 ) ( ON ?auto_39925 ?auto_39928 ) ( CLEAR ?auto_39925 ) ( HOLDING ?auto_39927 ) ( CLEAR ?auto_39923 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39923 ?auto_39927 )
      ( MAKE-1PILE ?auto_39922 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39929 - BLOCK
    )
    :vars
    (
      ?auto_39935 - BLOCK
      ?auto_39931 - BLOCK
      ?auto_39934 - BLOCK
      ?auto_39932 - BLOCK
      ?auto_39933 - BLOCK
      ?auto_39930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39929 ?auto_39935 ) ( not ( = ?auto_39929 ?auto_39935 ) ) ( not ( = ?auto_39929 ?auto_39931 ) ) ( not ( = ?auto_39929 ?auto_39934 ) ) ( not ( = ?auto_39935 ?auto_39931 ) ) ( not ( = ?auto_39935 ?auto_39934 ) ) ( not ( = ?auto_39931 ?auto_39934 ) ) ( ON ?auto_39931 ?auto_39929 ) ( ON-TABLE ?auto_39935 ) ( ON-TABLE ?auto_39932 ) ( not ( = ?auto_39932 ?auto_39933 ) ) ( not ( = ?auto_39932 ?auto_39930 ) ) ( not ( = ?auto_39932 ?auto_39934 ) ) ( not ( = ?auto_39933 ?auto_39930 ) ) ( not ( = ?auto_39933 ?auto_39934 ) ) ( not ( = ?auto_39930 ?auto_39934 ) ) ( not ( = ?auto_39929 ?auto_39930 ) ) ( not ( = ?auto_39929 ?auto_39932 ) ) ( not ( = ?auto_39929 ?auto_39933 ) ) ( not ( = ?auto_39935 ?auto_39930 ) ) ( not ( = ?auto_39935 ?auto_39932 ) ) ( not ( = ?auto_39935 ?auto_39933 ) ) ( not ( = ?auto_39931 ?auto_39930 ) ) ( not ( = ?auto_39931 ?auto_39932 ) ) ( not ( = ?auto_39931 ?auto_39933 ) ) ( ON ?auto_39934 ?auto_39931 ) ( ON ?auto_39930 ?auto_39934 ) ( CLEAR ?auto_39932 ) ( ON ?auto_39933 ?auto_39930 ) ( CLEAR ?auto_39933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_39935 ?auto_39929 ?auto_39931 ?auto_39934 ?auto_39930 )
      ( MAKE-1PILE ?auto_39929 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39936 - BLOCK
    )
    :vars
    (
      ?auto_39939 - BLOCK
      ?auto_39938 - BLOCK
      ?auto_39942 - BLOCK
      ?auto_39937 - BLOCK
      ?auto_39940 - BLOCK
      ?auto_39941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39936 ?auto_39939 ) ( not ( = ?auto_39936 ?auto_39939 ) ) ( not ( = ?auto_39936 ?auto_39938 ) ) ( not ( = ?auto_39936 ?auto_39942 ) ) ( not ( = ?auto_39939 ?auto_39938 ) ) ( not ( = ?auto_39939 ?auto_39942 ) ) ( not ( = ?auto_39938 ?auto_39942 ) ) ( ON ?auto_39938 ?auto_39936 ) ( ON-TABLE ?auto_39939 ) ( not ( = ?auto_39937 ?auto_39940 ) ) ( not ( = ?auto_39937 ?auto_39941 ) ) ( not ( = ?auto_39937 ?auto_39942 ) ) ( not ( = ?auto_39940 ?auto_39941 ) ) ( not ( = ?auto_39940 ?auto_39942 ) ) ( not ( = ?auto_39941 ?auto_39942 ) ) ( not ( = ?auto_39936 ?auto_39941 ) ) ( not ( = ?auto_39936 ?auto_39937 ) ) ( not ( = ?auto_39936 ?auto_39940 ) ) ( not ( = ?auto_39939 ?auto_39941 ) ) ( not ( = ?auto_39939 ?auto_39937 ) ) ( not ( = ?auto_39939 ?auto_39940 ) ) ( not ( = ?auto_39938 ?auto_39941 ) ) ( not ( = ?auto_39938 ?auto_39937 ) ) ( not ( = ?auto_39938 ?auto_39940 ) ) ( ON ?auto_39942 ?auto_39938 ) ( ON ?auto_39941 ?auto_39942 ) ( ON ?auto_39940 ?auto_39941 ) ( CLEAR ?auto_39940 ) ( HOLDING ?auto_39937 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_39937 )
      ( MAKE-1PILE ?auto_39936 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39943 - BLOCK
    )
    :vars
    (
      ?auto_39945 - BLOCK
      ?auto_39948 - BLOCK
      ?auto_39949 - BLOCK
      ?auto_39946 - BLOCK
      ?auto_39944 - BLOCK
      ?auto_39947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39943 ?auto_39945 ) ( not ( = ?auto_39943 ?auto_39945 ) ) ( not ( = ?auto_39943 ?auto_39948 ) ) ( not ( = ?auto_39943 ?auto_39949 ) ) ( not ( = ?auto_39945 ?auto_39948 ) ) ( not ( = ?auto_39945 ?auto_39949 ) ) ( not ( = ?auto_39948 ?auto_39949 ) ) ( ON ?auto_39948 ?auto_39943 ) ( ON-TABLE ?auto_39945 ) ( not ( = ?auto_39946 ?auto_39944 ) ) ( not ( = ?auto_39946 ?auto_39947 ) ) ( not ( = ?auto_39946 ?auto_39949 ) ) ( not ( = ?auto_39944 ?auto_39947 ) ) ( not ( = ?auto_39944 ?auto_39949 ) ) ( not ( = ?auto_39947 ?auto_39949 ) ) ( not ( = ?auto_39943 ?auto_39947 ) ) ( not ( = ?auto_39943 ?auto_39946 ) ) ( not ( = ?auto_39943 ?auto_39944 ) ) ( not ( = ?auto_39945 ?auto_39947 ) ) ( not ( = ?auto_39945 ?auto_39946 ) ) ( not ( = ?auto_39945 ?auto_39944 ) ) ( not ( = ?auto_39948 ?auto_39947 ) ) ( not ( = ?auto_39948 ?auto_39946 ) ) ( not ( = ?auto_39948 ?auto_39944 ) ) ( ON ?auto_39949 ?auto_39948 ) ( ON ?auto_39947 ?auto_39949 ) ( ON ?auto_39944 ?auto_39947 ) ( ON ?auto_39946 ?auto_39944 ) ( CLEAR ?auto_39946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_39945 ?auto_39943 ?auto_39948 ?auto_39949 ?auto_39947 ?auto_39944 )
      ( MAKE-1PILE ?auto_39943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_39959 - BLOCK
      ?auto_39960 - BLOCK
      ?auto_39961 - BLOCK
      ?auto_39962 - BLOCK
    )
    :vars
    (
      ?auto_39963 - BLOCK
      ?auto_39964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_39963 ?auto_39962 ) ( CLEAR ?auto_39963 ) ( ON-TABLE ?auto_39959 ) ( ON ?auto_39960 ?auto_39959 ) ( ON ?auto_39961 ?auto_39960 ) ( ON ?auto_39962 ?auto_39961 ) ( not ( = ?auto_39959 ?auto_39960 ) ) ( not ( = ?auto_39959 ?auto_39961 ) ) ( not ( = ?auto_39959 ?auto_39962 ) ) ( not ( = ?auto_39959 ?auto_39963 ) ) ( not ( = ?auto_39960 ?auto_39961 ) ) ( not ( = ?auto_39960 ?auto_39962 ) ) ( not ( = ?auto_39960 ?auto_39963 ) ) ( not ( = ?auto_39961 ?auto_39962 ) ) ( not ( = ?auto_39961 ?auto_39963 ) ) ( not ( = ?auto_39962 ?auto_39963 ) ) ( HOLDING ?auto_39964 ) ( not ( = ?auto_39959 ?auto_39964 ) ) ( not ( = ?auto_39960 ?auto_39964 ) ) ( not ( = ?auto_39961 ?auto_39964 ) ) ( not ( = ?auto_39962 ?auto_39964 ) ) ( not ( = ?auto_39963 ?auto_39964 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_39964 )
      ( MAKE-4PILE ?auto_39959 ?auto_39960 ?auto_39961 ?auto_39962 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40032 - BLOCK
      ?auto_40033 - BLOCK
    )
    :vars
    (
      ?auto_40034 - BLOCK
      ?auto_40035 - BLOCK
      ?auto_40036 - BLOCK
      ?auto_40037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40032 ?auto_40033 ) ) ( ON ?auto_40033 ?auto_40034 ) ( not ( = ?auto_40032 ?auto_40034 ) ) ( not ( = ?auto_40033 ?auto_40034 ) ) ( ON ?auto_40032 ?auto_40033 ) ( CLEAR ?auto_40032 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40035 ) ( ON ?auto_40036 ?auto_40035 ) ( ON ?auto_40037 ?auto_40036 ) ( ON ?auto_40034 ?auto_40037 ) ( not ( = ?auto_40035 ?auto_40036 ) ) ( not ( = ?auto_40035 ?auto_40037 ) ) ( not ( = ?auto_40035 ?auto_40034 ) ) ( not ( = ?auto_40035 ?auto_40033 ) ) ( not ( = ?auto_40035 ?auto_40032 ) ) ( not ( = ?auto_40036 ?auto_40037 ) ) ( not ( = ?auto_40036 ?auto_40034 ) ) ( not ( = ?auto_40036 ?auto_40033 ) ) ( not ( = ?auto_40036 ?auto_40032 ) ) ( not ( = ?auto_40037 ?auto_40034 ) ) ( not ( = ?auto_40037 ?auto_40033 ) ) ( not ( = ?auto_40037 ?auto_40032 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40035 ?auto_40036 ?auto_40037 ?auto_40034 ?auto_40033 )
      ( MAKE-2PILE ?auto_40032 ?auto_40033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40040 - BLOCK
      ?auto_40041 - BLOCK
    )
    :vars
    (
      ?auto_40042 - BLOCK
      ?auto_40043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40040 ?auto_40041 ) ) ( ON ?auto_40041 ?auto_40042 ) ( CLEAR ?auto_40041 ) ( not ( = ?auto_40040 ?auto_40042 ) ) ( not ( = ?auto_40041 ?auto_40042 ) ) ( ON ?auto_40040 ?auto_40043 ) ( CLEAR ?auto_40040 ) ( HAND-EMPTY ) ( not ( = ?auto_40040 ?auto_40043 ) ) ( not ( = ?auto_40041 ?auto_40043 ) ) ( not ( = ?auto_40042 ?auto_40043 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40040 ?auto_40043 )
      ( MAKE-2PILE ?auto_40040 ?auto_40041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40044 - BLOCK
      ?auto_40045 - BLOCK
    )
    :vars
    (
      ?auto_40047 - BLOCK
      ?auto_40046 - BLOCK
      ?auto_40048 - BLOCK
      ?auto_40049 - BLOCK
      ?auto_40050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40044 ?auto_40045 ) ) ( not ( = ?auto_40044 ?auto_40047 ) ) ( not ( = ?auto_40045 ?auto_40047 ) ) ( ON ?auto_40044 ?auto_40046 ) ( CLEAR ?auto_40044 ) ( not ( = ?auto_40044 ?auto_40046 ) ) ( not ( = ?auto_40045 ?auto_40046 ) ) ( not ( = ?auto_40047 ?auto_40046 ) ) ( HOLDING ?auto_40045 ) ( CLEAR ?auto_40047 ) ( ON-TABLE ?auto_40048 ) ( ON ?auto_40049 ?auto_40048 ) ( ON ?auto_40050 ?auto_40049 ) ( ON ?auto_40047 ?auto_40050 ) ( not ( = ?auto_40048 ?auto_40049 ) ) ( not ( = ?auto_40048 ?auto_40050 ) ) ( not ( = ?auto_40048 ?auto_40047 ) ) ( not ( = ?auto_40048 ?auto_40045 ) ) ( not ( = ?auto_40049 ?auto_40050 ) ) ( not ( = ?auto_40049 ?auto_40047 ) ) ( not ( = ?auto_40049 ?auto_40045 ) ) ( not ( = ?auto_40050 ?auto_40047 ) ) ( not ( = ?auto_40050 ?auto_40045 ) ) ( not ( = ?auto_40044 ?auto_40048 ) ) ( not ( = ?auto_40044 ?auto_40049 ) ) ( not ( = ?auto_40044 ?auto_40050 ) ) ( not ( = ?auto_40046 ?auto_40048 ) ) ( not ( = ?auto_40046 ?auto_40049 ) ) ( not ( = ?auto_40046 ?auto_40050 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40048 ?auto_40049 ?auto_40050 ?auto_40047 ?auto_40045 )
      ( MAKE-2PILE ?auto_40044 ?auto_40045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40051 - BLOCK
      ?auto_40052 - BLOCK
    )
    :vars
    (
      ?auto_40055 - BLOCK
      ?auto_40057 - BLOCK
      ?auto_40054 - BLOCK
      ?auto_40056 - BLOCK
      ?auto_40053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40051 ?auto_40052 ) ) ( not ( = ?auto_40051 ?auto_40055 ) ) ( not ( = ?auto_40052 ?auto_40055 ) ) ( ON ?auto_40051 ?auto_40057 ) ( not ( = ?auto_40051 ?auto_40057 ) ) ( not ( = ?auto_40052 ?auto_40057 ) ) ( not ( = ?auto_40055 ?auto_40057 ) ) ( CLEAR ?auto_40055 ) ( ON-TABLE ?auto_40054 ) ( ON ?auto_40056 ?auto_40054 ) ( ON ?auto_40053 ?auto_40056 ) ( ON ?auto_40055 ?auto_40053 ) ( not ( = ?auto_40054 ?auto_40056 ) ) ( not ( = ?auto_40054 ?auto_40053 ) ) ( not ( = ?auto_40054 ?auto_40055 ) ) ( not ( = ?auto_40054 ?auto_40052 ) ) ( not ( = ?auto_40056 ?auto_40053 ) ) ( not ( = ?auto_40056 ?auto_40055 ) ) ( not ( = ?auto_40056 ?auto_40052 ) ) ( not ( = ?auto_40053 ?auto_40055 ) ) ( not ( = ?auto_40053 ?auto_40052 ) ) ( not ( = ?auto_40051 ?auto_40054 ) ) ( not ( = ?auto_40051 ?auto_40056 ) ) ( not ( = ?auto_40051 ?auto_40053 ) ) ( not ( = ?auto_40057 ?auto_40054 ) ) ( not ( = ?auto_40057 ?auto_40056 ) ) ( not ( = ?auto_40057 ?auto_40053 ) ) ( ON ?auto_40052 ?auto_40051 ) ( CLEAR ?auto_40052 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40057 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40057 ?auto_40051 )
      ( MAKE-2PILE ?auto_40051 ?auto_40052 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40058 - BLOCK
      ?auto_40059 - BLOCK
    )
    :vars
    (
      ?auto_40063 - BLOCK
      ?auto_40064 - BLOCK
      ?auto_40061 - BLOCK
      ?auto_40060 - BLOCK
      ?auto_40062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40058 ?auto_40059 ) ) ( not ( = ?auto_40058 ?auto_40063 ) ) ( not ( = ?auto_40059 ?auto_40063 ) ) ( ON ?auto_40058 ?auto_40064 ) ( not ( = ?auto_40058 ?auto_40064 ) ) ( not ( = ?auto_40059 ?auto_40064 ) ) ( not ( = ?auto_40063 ?auto_40064 ) ) ( ON-TABLE ?auto_40061 ) ( ON ?auto_40060 ?auto_40061 ) ( ON ?auto_40062 ?auto_40060 ) ( not ( = ?auto_40061 ?auto_40060 ) ) ( not ( = ?auto_40061 ?auto_40062 ) ) ( not ( = ?auto_40061 ?auto_40063 ) ) ( not ( = ?auto_40061 ?auto_40059 ) ) ( not ( = ?auto_40060 ?auto_40062 ) ) ( not ( = ?auto_40060 ?auto_40063 ) ) ( not ( = ?auto_40060 ?auto_40059 ) ) ( not ( = ?auto_40062 ?auto_40063 ) ) ( not ( = ?auto_40062 ?auto_40059 ) ) ( not ( = ?auto_40058 ?auto_40061 ) ) ( not ( = ?auto_40058 ?auto_40060 ) ) ( not ( = ?auto_40058 ?auto_40062 ) ) ( not ( = ?auto_40064 ?auto_40061 ) ) ( not ( = ?auto_40064 ?auto_40060 ) ) ( not ( = ?auto_40064 ?auto_40062 ) ) ( ON ?auto_40059 ?auto_40058 ) ( CLEAR ?auto_40059 ) ( ON-TABLE ?auto_40064 ) ( HOLDING ?auto_40063 ) ( CLEAR ?auto_40062 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40061 ?auto_40060 ?auto_40062 ?auto_40063 )
      ( MAKE-2PILE ?auto_40058 ?auto_40059 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40065 - BLOCK
      ?auto_40066 - BLOCK
    )
    :vars
    (
      ?auto_40071 - BLOCK
      ?auto_40070 - BLOCK
      ?auto_40067 - BLOCK
      ?auto_40068 - BLOCK
      ?auto_40069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40065 ?auto_40066 ) ) ( not ( = ?auto_40065 ?auto_40071 ) ) ( not ( = ?auto_40066 ?auto_40071 ) ) ( ON ?auto_40065 ?auto_40070 ) ( not ( = ?auto_40065 ?auto_40070 ) ) ( not ( = ?auto_40066 ?auto_40070 ) ) ( not ( = ?auto_40071 ?auto_40070 ) ) ( ON-TABLE ?auto_40067 ) ( ON ?auto_40068 ?auto_40067 ) ( ON ?auto_40069 ?auto_40068 ) ( not ( = ?auto_40067 ?auto_40068 ) ) ( not ( = ?auto_40067 ?auto_40069 ) ) ( not ( = ?auto_40067 ?auto_40071 ) ) ( not ( = ?auto_40067 ?auto_40066 ) ) ( not ( = ?auto_40068 ?auto_40069 ) ) ( not ( = ?auto_40068 ?auto_40071 ) ) ( not ( = ?auto_40068 ?auto_40066 ) ) ( not ( = ?auto_40069 ?auto_40071 ) ) ( not ( = ?auto_40069 ?auto_40066 ) ) ( not ( = ?auto_40065 ?auto_40067 ) ) ( not ( = ?auto_40065 ?auto_40068 ) ) ( not ( = ?auto_40065 ?auto_40069 ) ) ( not ( = ?auto_40070 ?auto_40067 ) ) ( not ( = ?auto_40070 ?auto_40068 ) ) ( not ( = ?auto_40070 ?auto_40069 ) ) ( ON ?auto_40066 ?auto_40065 ) ( ON-TABLE ?auto_40070 ) ( CLEAR ?auto_40069 ) ( ON ?auto_40071 ?auto_40066 ) ( CLEAR ?auto_40071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40070 ?auto_40065 ?auto_40066 )
      ( MAKE-2PILE ?auto_40065 ?auto_40066 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40072 - BLOCK
      ?auto_40073 - BLOCK
    )
    :vars
    (
      ?auto_40076 - BLOCK
      ?auto_40075 - BLOCK
      ?auto_40077 - BLOCK
      ?auto_40074 - BLOCK
      ?auto_40078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40072 ?auto_40073 ) ) ( not ( = ?auto_40072 ?auto_40076 ) ) ( not ( = ?auto_40073 ?auto_40076 ) ) ( ON ?auto_40072 ?auto_40075 ) ( not ( = ?auto_40072 ?auto_40075 ) ) ( not ( = ?auto_40073 ?auto_40075 ) ) ( not ( = ?auto_40076 ?auto_40075 ) ) ( ON-TABLE ?auto_40077 ) ( ON ?auto_40074 ?auto_40077 ) ( not ( = ?auto_40077 ?auto_40074 ) ) ( not ( = ?auto_40077 ?auto_40078 ) ) ( not ( = ?auto_40077 ?auto_40076 ) ) ( not ( = ?auto_40077 ?auto_40073 ) ) ( not ( = ?auto_40074 ?auto_40078 ) ) ( not ( = ?auto_40074 ?auto_40076 ) ) ( not ( = ?auto_40074 ?auto_40073 ) ) ( not ( = ?auto_40078 ?auto_40076 ) ) ( not ( = ?auto_40078 ?auto_40073 ) ) ( not ( = ?auto_40072 ?auto_40077 ) ) ( not ( = ?auto_40072 ?auto_40074 ) ) ( not ( = ?auto_40072 ?auto_40078 ) ) ( not ( = ?auto_40075 ?auto_40077 ) ) ( not ( = ?auto_40075 ?auto_40074 ) ) ( not ( = ?auto_40075 ?auto_40078 ) ) ( ON ?auto_40073 ?auto_40072 ) ( ON-TABLE ?auto_40075 ) ( ON ?auto_40076 ?auto_40073 ) ( CLEAR ?auto_40076 ) ( HOLDING ?auto_40078 ) ( CLEAR ?auto_40074 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40077 ?auto_40074 ?auto_40078 )
      ( MAKE-2PILE ?auto_40072 ?auto_40073 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40079 - BLOCK
      ?auto_40080 - BLOCK
    )
    :vars
    (
      ?auto_40085 - BLOCK
      ?auto_40084 - BLOCK
      ?auto_40082 - BLOCK
      ?auto_40083 - BLOCK
      ?auto_40081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40079 ?auto_40080 ) ) ( not ( = ?auto_40079 ?auto_40085 ) ) ( not ( = ?auto_40080 ?auto_40085 ) ) ( ON ?auto_40079 ?auto_40084 ) ( not ( = ?auto_40079 ?auto_40084 ) ) ( not ( = ?auto_40080 ?auto_40084 ) ) ( not ( = ?auto_40085 ?auto_40084 ) ) ( ON-TABLE ?auto_40082 ) ( ON ?auto_40083 ?auto_40082 ) ( not ( = ?auto_40082 ?auto_40083 ) ) ( not ( = ?auto_40082 ?auto_40081 ) ) ( not ( = ?auto_40082 ?auto_40085 ) ) ( not ( = ?auto_40082 ?auto_40080 ) ) ( not ( = ?auto_40083 ?auto_40081 ) ) ( not ( = ?auto_40083 ?auto_40085 ) ) ( not ( = ?auto_40083 ?auto_40080 ) ) ( not ( = ?auto_40081 ?auto_40085 ) ) ( not ( = ?auto_40081 ?auto_40080 ) ) ( not ( = ?auto_40079 ?auto_40082 ) ) ( not ( = ?auto_40079 ?auto_40083 ) ) ( not ( = ?auto_40079 ?auto_40081 ) ) ( not ( = ?auto_40084 ?auto_40082 ) ) ( not ( = ?auto_40084 ?auto_40083 ) ) ( not ( = ?auto_40084 ?auto_40081 ) ) ( ON ?auto_40080 ?auto_40079 ) ( ON-TABLE ?auto_40084 ) ( ON ?auto_40085 ?auto_40080 ) ( CLEAR ?auto_40083 ) ( ON ?auto_40081 ?auto_40085 ) ( CLEAR ?auto_40081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40084 ?auto_40079 ?auto_40080 ?auto_40085 )
      ( MAKE-2PILE ?auto_40079 ?auto_40080 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40086 - BLOCK
      ?auto_40087 - BLOCK
    )
    :vars
    (
      ?auto_40092 - BLOCK
      ?auto_40090 - BLOCK
      ?auto_40089 - BLOCK
      ?auto_40091 - BLOCK
      ?auto_40088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40086 ?auto_40087 ) ) ( not ( = ?auto_40086 ?auto_40092 ) ) ( not ( = ?auto_40087 ?auto_40092 ) ) ( ON ?auto_40086 ?auto_40090 ) ( not ( = ?auto_40086 ?auto_40090 ) ) ( not ( = ?auto_40087 ?auto_40090 ) ) ( not ( = ?auto_40092 ?auto_40090 ) ) ( ON-TABLE ?auto_40089 ) ( not ( = ?auto_40089 ?auto_40091 ) ) ( not ( = ?auto_40089 ?auto_40088 ) ) ( not ( = ?auto_40089 ?auto_40092 ) ) ( not ( = ?auto_40089 ?auto_40087 ) ) ( not ( = ?auto_40091 ?auto_40088 ) ) ( not ( = ?auto_40091 ?auto_40092 ) ) ( not ( = ?auto_40091 ?auto_40087 ) ) ( not ( = ?auto_40088 ?auto_40092 ) ) ( not ( = ?auto_40088 ?auto_40087 ) ) ( not ( = ?auto_40086 ?auto_40089 ) ) ( not ( = ?auto_40086 ?auto_40091 ) ) ( not ( = ?auto_40086 ?auto_40088 ) ) ( not ( = ?auto_40090 ?auto_40089 ) ) ( not ( = ?auto_40090 ?auto_40091 ) ) ( not ( = ?auto_40090 ?auto_40088 ) ) ( ON ?auto_40087 ?auto_40086 ) ( ON-TABLE ?auto_40090 ) ( ON ?auto_40092 ?auto_40087 ) ( ON ?auto_40088 ?auto_40092 ) ( CLEAR ?auto_40088 ) ( HOLDING ?auto_40091 ) ( CLEAR ?auto_40089 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40089 ?auto_40091 )
      ( MAKE-2PILE ?auto_40086 ?auto_40087 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40093 - BLOCK
      ?auto_40094 - BLOCK
    )
    :vars
    (
      ?auto_40095 - BLOCK
      ?auto_40097 - BLOCK
      ?auto_40098 - BLOCK
      ?auto_40099 - BLOCK
      ?auto_40096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40093 ?auto_40094 ) ) ( not ( = ?auto_40093 ?auto_40095 ) ) ( not ( = ?auto_40094 ?auto_40095 ) ) ( ON ?auto_40093 ?auto_40097 ) ( not ( = ?auto_40093 ?auto_40097 ) ) ( not ( = ?auto_40094 ?auto_40097 ) ) ( not ( = ?auto_40095 ?auto_40097 ) ) ( ON-TABLE ?auto_40098 ) ( not ( = ?auto_40098 ?auto_40099 ) ) ( not ( = ?auto_40098 ?auto_40096 ) ) ( not ( = ?auto_40098 ?auto_40095 ) ) ( not ( = ?auto_40098 ?auto_40094 ) ) ( not ( = ?auto_40099 ?auto_40096 ) ) ( not ( = ?auto_40099 ?auto_40095 ) ) ( not ( = ?auto_40099 ?auto_40094 ) ) ( not ( = ?auto_40096 ?auto_40095 ) ) ( not ( = ?auto_40096 ?auto_40094 ) ) ( not ( = ?auto_40093 ?auto_40098 ) ) ( not ( = ?auto_40093 ?auto_40099 ) ) ( not ( = ?auto_40093 ?auto_40096 ) ) ( not ( = ?auto_40097 ?auto_40098 ) ) ( not ( = ?auto_40097 ?auto_40099 ) ) ( not ( = ?auto_40097 ?auto_40096 ) ) ( ON ?auto_40094 ?auto_40093 ) ( ON-TABLE ?auto_40097 ) ( ON ?auto_40095 ?auto_40094 ) ( ON ?auto_40096 ?auto_40095 ) ( CLEAR ?auto_40098 ) ( ON ?auto_40099 ?auto_40096 ) ( CLEAR ?auto_40099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40097 ?auto_40093 ?auto_40094 ?auto_40095 ?auto_40096 )
      ( MAKE-2PILE ?auto_40093 ?auto_40094 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40100 - BLOCK
      ?auto_40101 - BLOCK
    )
    :vars
    (
      ?auto_40106 - BLOCK
      ?auto_40104 - BLOCK
      ?auto_40102 - BLOCK
      ?auto_40105 - BLOCK
      ?auto_40103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40100 ?auto_40101 ) ) ( not ( = ?auto_40100 ?auto_40106 ) ) ( not ( = ?auto_40101 ?auto_40106 ) ) ( ON ?auto_40100 ?auto_40104 ) ( not ( = ?auto_40100 ?auto_40104 ) ) ( not ( = ?auto_40101 ?auto_40104 ) ) ( not ( = ?auto_40106 ?auto_40104 ) ) ( not ( = ?auto_40102 ?auto_40105 ) ) ( not ( = ?auto_40102 ?auto_40103 ) ) ( not ( = ?auto_40102 ?auto_40106 ) ) ( not ( = ?auto_40102 ?auto_40101 ) ) ( not ( = ?auto_40105 ?auto_40103 ) ) ( not ( = ?auto_40105 ?auto_40106 ) ) ( not ( = ?auto_40105 ?auto_40101 ) ) ( not ( = ?auto_40103 ?auto_40106 ) ) ( not ( = ?auto_40103 ?auto_40101 ) ) ( not ( = ?auto_40100 ?auto_40102 ) ) ( not ( = ?auto_40100 ?auto_40105 ) ) ( not ( = ?auto_40100 ?auto_40103 ) ) ( not ( = ?auto_40104 ?auto_40102 ) ) ( not ( = ?auto_40104 ?auto_40105 ) ) ( not ( = ?auto_40104 ?auto_40103 ) ) ( ON ?auto_40101 ?auto_40100 ) ( ON-TABLE ?auto_40104 ) ( ON ?auto_40106 ?auto_40101 ) ( ON ?auto_40103 ?auto_40106 ) ( ON ?auto_40105 ?auto_40103 ) ( CLEAR ?auto_40105 ) ( HOLDING ?auto_40102 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40102 )
      ( MAKE-2PILE ?auto_40100 ?auto_40101 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40107 - BLOCK
      ?auto_40108 - BLOCK
    )
    :vars
    (
      ?auto_40111 - BLOCK
      ?auto_40113 - BLOCK
      ?auto_40110 - BLOCK
      ?auto_40112 - BLOCK
      ?auto_40109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40107 ?auto_40108 ) ) ( not ( = ?auto_40107 ?auto_40111 ) ) ( not ( = ?auto_40108 ?auto_40111 ) ) ( ON ?auto_40107 ?auto_40113 ) ( not ( = ?auto_40107 ?auto_40113 ) ) ( not ( = ?auto_40108 ?auto_40113 ) ) ( not ( = ?auto_40111 ?auto_40113 ) ) ( not ( = ?auto_40110 ?auto_40112 ) ) ( not ( = ?auto_40110 ?auto_40109 ) ) ( not ( = ?auto_40110 ?auto_40111 ) ) ( not ( = ?auto_40110 ?auto_40108 ) ) ( not ( = ?auto_40112 ?auto_40109 ) ) ( not ( = ?auto_40112 ?auto_40111 ) ) ( not ( = ?auto_40112 ?auto_40108 ) ) ( not ( = ?auto_40109 ?auto_40111 ) ) ( not ( = ?auto_40109 ?auto_40108 ) ) ( not ( = ?auto_40107 ?auto_40110 ) ) ( not ( = ?auto_40107 ?auto_40112 ) ) ( not ( = ?auto_40107 ?auto_40109 ) ) ( not ( = ?auto_40113 ?auto_40110 ) ) ( not ( = ?auto_40113 ?auto_40112 ) ) ( not ( = ?auto_40113 ?auto_40109 ) ) ( ON ?auto_40108 ?auto_40107 ) ( ON-TABLE ?auto_40113 ) ( ON ?auto_40111 ?auto_40108 ) ( ON ?auto_40109 ?auto_40111 ) ( ON ?auto_40112 ?auto_40109 ) ( ON ?auto_40110 ?auto_40112 ) ( CLEAR ?auto_40110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40113 ?auto_40107 ?auto_40108 ?auto_40111 ?auto_40109 ?auto_40112 )
      ( MAKE-2PILE ?auto_40107 ?auto_40108 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40133 - BLOCK
      ?auto_40134 - BLOCK
      ?auto_40135 - BLOCK
    )
    :vars
    (
      ?auto_40137 - BLOCK
      ?auto_40136 - BLOCK
      ?auto_40138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40137 ?auto_40135 ) ( ON-TABLE ?auto_40133 ) ( ON ?auto_40134 ?auto_40133 ) ( ON ?auto_40135 ?auto_40134 ) ( not ( = ?auto_40133 ?auto_40134 ) ) ( not ( = ?auto_40133 ?auto_40135 ) ) ( not ( = ?auto_40133 ?auto_40137 ) ) ( not ( = ?auto_40134 ?auto_40135 ) ) ( not ( = ?auto_40134 ?auto_40137 ) ) ( not ( = ?auto_40135 ?auto_40137 ) ) ( not ( = ?auto_40133 ?auto_40136 ) ) ( not ( = ?auto_40133 ?auto_40138 ) ) ( not ( = ?auto_40134 ?auto_40136 ) ) ( not ( = ?auto_40134 ?auto_40138 ) ) ( not ( = ?auto_40135 ?auto_40136 ) ) ( not ( = ?auto_40135 ?auto_40138 ) ) ( not ( = ?auto_40137 ?auto_40136 ) ) ( not ( = ?auto_40137 ?auto_40138 ) ) ( not ( = ?auto_40136 ?auto_40138 ) ) ( ON ?auto_40136 ?auto_40137 ) ( CLEAR ?auto_40136 ) ( HOLDING ?auto_40138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40138 )
      ( MAKE-3PILE ?auto_40133 ?auto_40134 ?auto_40135 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40198 - BLOCK
      ?auto_40199 - BLOCK
      ?auto_40200 - BLOCK
    )
    :vars
    (
      ?auto_40201 - BLOCK
      ?auto_40202 - BLOCK
      ?auto_40203 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40198 ) ( not ( = ?auto_40198 ?auto_40199 ) ) ( not ( = ?auto_40198 ?auto_40200 ) ) ( not ( = ?auto_40199 ?auto_40200 ) ) ( ON ?auto_40200 ?auto_40201 ) ( not ( = ?auto_40198 ?auto_40201 ) ) ( not ( = ?auto_40199 ?auto_40201 ) ) ( not ( = ?auto_40200 ?auto_40201 ) ) ( CLEAR ?auto_40198 ) ( ON ?auto_40199 ?auto_40200 ) ( CLEAR ?auto_40199 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40202 ) ( ON ?auto_40203 ?auto_40202 ) ( ON ?auto_40201 ?auto_40203 ) ( not ( = ?auto_40202 ?auto_40203 ) ) ( not ( = ?auto_40202 ?auto_40201 ) ) ( not ( = ?auto_40202 ?auto_40200 ) ) ( not ( = ?auto_40202 ?auto_40199 ) ) ( not ( = ?auto_40203 ?auto_40201 ) ) ( not ( = ?auto_40203 ?auto_40200 ) ) ( not ( = ?auto_40203 ?auto_40199 ) ) ( not ( = ?auto_40198 ?auto_40202 ) ) ( not ( = ?auto_40198 ?auto_40203 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40202 ?auto_40203 ?auto_40201 ?auto_40200 )
      ( MAKE-3PILE ?auto_40198 ?auto_40199 ?auto_40200 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40204 - BLOCK
      ?auto_40205 - BLOCK
      ?auto_40206 - BLOCK
    )
    :vars
    (
      ?auto_40209 - BLOCK
      ?auto_40208 - BLOCK
      ?auto_40207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40204 ?auto_40205 ) ) ( not ( = ?auto_40204 ?auto_40206 ) ) ( not ( = ?auto_40205 ?auto_40206 ) ) ( ON ?auto_40206 ?auto_40209 ) ( not ( = ?auto_40204 ?auto_40209 ) ) ( not ( = ?auto_40205 ?auto_40209 ) ) ( not ( = ?auto_40206 ?auto_40209 ) ) ( ON ?auto_40205 ?auto_40206 ) ( CLEAR ?auto_40205 ) ( ON-TABLE ?auto_40208 ) ( ON ?auto_40207 ?auto_40208 ) ( ON ?auto_40209 ?auto_40207 ) ( not ( = ?auto_40208 ?auto_40207 ) ) ( not ( = ?auto_40208 ?auto_40209 ) ) ( not ( = ?auto_40208 ?auto_40206 ) ) ( not ( = ?auto_40208 ?auto_40205 ) ) ( not ( = ?auto_40207 ?auto_40209 ) ) ( not ( = ?auto_40207 ?auto_40206 ) ) ( not ( = ?auto_40207 ?auto_40205 ) ) ( not ( = ?auto_40204 ?auto_40208 ) ) ( not ( = ?auto_40204 ?auto_40207 ) ) ( HOLDING ?auto_40204 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40204 )
      ( MAKE-3PILE ?auto_40204 ?auto_40205 ?auto_40206 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40210 - BLOCK
      ?auto_40211 - BLOCK
      ?auto_40212 - BLOCK
    )
    :vars
    (
      ?auto_40213 - BLOCK
      ?auto_40215 - BLOCK
      ?auto_40214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40210 ?auto_40211 ) ) ( not ( = ?auto_40210 ?auto_40212 ) ) ( not ( = ?auto_40211 ?auto_40212 ) ) ( ON ?auto_40212 ?auto_40213 ) ( not ( = ?auto_40210 ?auto_40213 ) ) ( not ( = ?auto_40211 ?auto_40213 ) ) ( not ( = ?auto_40212 ?auto_40213 ) ) ( ON ?auto_40211 ?auto_40212 ) ( ON-TABLE ?auto_40215 ) ( ON ?auto_40214 ?auto_40215 ) ( ON ?auto_40213 ?auto_40214 ) ( not ( = ?auto_40215 ?auto_40214 ) ) ( not ( = ?auto_40215 ?auto_40213 ) ) ( not ( = ?auto_40215 ?auto_40212 ) ) ( not ( = ?auto_40215 ?auto_40211 ) ) ( not ( = ?auto_40214 ?auto_40213 ) ) ( not ( = ?auto_40214 ?auto_40212 ) ) ( not ( = ?auto_40214 ?auto_40211 ) ) ( not ( = ?auto_40210 ?auto_40215 ) ) ( not ( = ?auto_40210 ?auto_40214 ) ) ( ON ?auto_40210 ?auto_40211 ) ( CLEAR ?auto_40210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40215 ?auto_40214 ?auto_40213 ?auto_40212 ?auto_40211 )
      ( MAKE-3PILE ?auto_40210 ?auto_40211 ?auto_40212 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40219 - BLOCK
      ?auto_40220 - BLOCK
      ?auto_40221 - BLOCK
    )
    :vars
    (
      ?auto_40224 - BLOCK
      ?auto_40223 - BLOCK
      ?auto_40222 - BLOCK
      ?auto_40225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40219 ?auto_40220 ) ) ( not ( = ?auto_40219 ?auto_40221 ) ) ( not ( = ?auto_40220 ?auto_40221 ) ) ( ON ?auto_40221 ?auto_40224 ) ( not ( = ?auto_40219 ?auto_40224 ) ) ( not ( = ?auto_40220 ?auto_40224 ) ) ( not ( = ?auto_40221 ?auto_40224 ) ) ( ON ?auto_40220 ?auto_40221 ) ( CLEAR ?auto_40220 ) ( ON-TABLE ?auto_40223 ) ( ON ?auto_40222 ?auto_40223 ) ( ON ?auto_40224 ?auto_40222 ) ( not ( = ?auto_40223 ?auto_40222 ) ) ( not ( = ?auto_40223 ?auto_40224 ) ) ( not ( = ?auto_40223 ?auto_40221 ) ) ( not ( = ?auto_40223 ?auto_40220 ) ) ( not ( = ?auto_40222 ?auto_40224 ) ) ( not ( = ?auto_40222 ?auto_40221 ) ) ( not ( = ?auto_40222 ?auto_40220 ) ) ( not ( = ?auto_40219 ?auto_40223 ) ) ( not ( = ?auto_40219 ?auto_40222 ) ) ( ON ?auto_40219 ?auto_40225 ) ( CLEAR ?auto_40219 ) ( HAND-EMPTY ) ( not ( = ?auto_40219 ?auto_40225 ) ) ( not ( = ?auto_40220 ?auto_40225 ) ) ( not ( = ?auto_40221 ?auto_40225 ) ) ( not ( = ?auto_40224 ?auto_40225 ) ) ( not ( = ?auto_40223 ?auto_40225 ) ) ( not ( = ?auto_40222 ?auto_40225 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40219 ?auto_40225 )
      ( MAKE-3PILE ?auto_40219 ?auto_40220 ?auto_40221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40226 - BLOCK
      ?auto_40227 - BLOCK
      ?auto_40228 - BLOCK
    )
    :vars
    (
      ?auto_40231 - BLOCK
      ?auto_40229 - BLOCK
      ?auto_40230 - BLOCK
      ?auto_40232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40226 ?auto_40227 ) ) ( not ( = ?auto_40226 ?auto_40228 ) ) ( not ( = ?auto_40227 ?auto_40228 ) ) ( ON ?auto_40228 ?auto_40231 ) ( not ( = ?auto_40226 ?auto_40231 ) ) ( not ( = ?auto_40227 ?auto_40231 ) ) ( not ( = ?auto_40228 ?auto_40231 ) ) ( ON-TABLE ?auto_40229 ) ( ON ?auto_40230 ?auto_40229 ) ( ON ?auto_40231 ?auto_40230 ) ( not ( = ?auto_40229 ?auto_40230 ) ) ( not ( = ?auto_40229 ?auto_40231 ) ) ( not ( = ?auto_40229 ?auto_40228 ) ) ( not ( = ?auto_40229 ?auto_40227 ) ) ( not ( = ?auto_40230 ?auto_40231 ) ) ( not ( = ?auto_40230 ?auto_40228 ) ) ( not ( = ?auto_40230 ?auto_40227 ) ) ( not ( = ?auto_40226 ?auto_40229 ) ) ( not ( = ?auto_40226 ?auto_40230 ) ) ( ON ?auto_40226 ?auto_40232 ) ( CLEAR ?auto_40226 ) ( not ( = ?auto_40226 ?auto_40232 ) ) ( not ( = ?auto_40227 ?auto_40232 ) ) ( not ( = ?auto_40228 ?auto_40232 ) ) ( not ( = ?auto_40231 ?auto_40232 ) ) ( not ( = ?auto_40229 ?auto_40232 ) ) ( not ( = ?auto_40230 ?auto_40232 ) ) ( HOLDING ?auto_40227 ) ( CLEAR ?auto_40228 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40229 ?auto_40230 ?auto_40231 ?auto_40228 ?auto_40227 )
      ( MAKE-3PILE ?auto_40226 ?auto_40227 ?auto_40228 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40233 - BLOCK
      ?auto_40234 - BLOCK
      ?auto_40235 - BLOCK
    )
    :vars
    (
      ?auto_40236 - BLOCK
      ?auto_40239 - BLOCK
      ?auto_40238 - BLOCK
      ?auto_40237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40233 ?auto_40234 ) ) ( not ( = ?auto_40233 ?auto_40235 ) ) ( not ( = ?auto_40234 ?auto_40235 ) ) ( ON ?auto_40235 ?auto_40236 ) ( not ( = ?auto_40233 ?auto_40236 ) ) ( not ( = ?auto_40234 ?auto_40236 ) ) ( not ( = ?auto_40235 ?auto_40236 ) ) ( ON-TABLE ?auto_40239 ) ( ON ?auto_40238 ?auto_40239 ) ( ON ?auto_40236 ?auto_40238 ) ( not ( = ?auto_40239 ?auto_40238 ) ) ( not ( = ?auto_40239 ?auto_40236 ) ) ( not ( = ?auto_40239 ?auto_40235 ) ) ( not ( = ?auto_40239 ?auto_40234 ) ) ( not ( = ?auto_40238 ?auto_40236 ) ) ( not ( = ?auto_40238 ?auto_40235 ) ) ( not ( = ?auto_40238 ?auto_40234 ) ) ( not ( = ?auto_40233 ?auto_40239 ) ) ( not ( = ?auto_40233 ?auto_40238 ) ) ( ON ?auto_40233 ?auto_40237 ) ( not ( = ?auto_40233 ?auto_40237 ) ) ( not ( = ?auto_40234 ?auto_40237 ) ) ( not ( = ?auto_40235 ?auto_40237 ) ) ( not ( = ?auto_40236 ?auto_40237 ) ) ( not ( = ?auto_40239 ?auto_40237 ) ) ( not ( = ?auto_40238 ?auto_40237 ) ) ( CLEAR ?auto_40235 ) ( ON ?auto_40234 ?auto_40233 ) ( CLEAR ?auto_40234 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40237 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40237 ?auto_40233 )
      ( MAKE-3PILE ?auto_40233 ?auto_40234 ?auto_40235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40240 - BLOCK
      ?auto_40241 - BLOCK
      ?auto_40242 - BLOCK
    )
    :vars
    (
      ?auto_40243 - BLOCK
      ?auto_40245 - BLOCK
      ?auto_40246 - BLOCK
      ?auto_40244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40240 ?auto_40241 ) ) ( not ( = ?auto_40240 ?auto_40242 ) ) ( not ( = ?auto_40241 ?auto_40242 ) ) ( not ( = ?auto_40240 ?auto_40243 ) ) ( not ( = ?auto_40241 ?auto_40243 ) ) ( not ( = ?auto_40242 ?auto_40243 ) ) ( ON-TABLE ?auto_40245 ) ( ON ?auto_40246 ?auto_40245 ) ( ON ?auto_40243 ?auto_40246 ) ( not ( = ?auto_40245 ?auto_40246 ) ) ( not ( = ?auto_40245 ?auto_40243 ) ) ( not ( = ?auto_40245 ?auto_40242 ) ) ( not ( = ?auto_40245 ?auto_40241 ) ) ( not ( = ?auto_40246 ?auto_40243 ) ) ( not ( = ?auto_40246 ?auto_40242 ) ) ( not ( = ?auto_40246 ?auto_40241 ) ) ( not ( = ?auto_40240 ?auto_40245 ) ) ( not ( = ?auto_40240 ?auto_40246 ) ) ( ON ?auto_40240 ?auto_40244 ) ( not ( = ?auto_40240 ?auto_40244 ) ) ( not ( = ?auto_40241 ?auto_40244 ) ) ( not ( = ?auto_40242 ?auto_40244 ) ) ( not ( = ?auto_40243 ?auto_40244 ) ) ( not ( = ?auto_40245 ?auto_40244 ) ) ( not ( = ?auto_40246 ?auto_40244 ) ) ( ON ?auto_40241 ?auto_40240 ) ( CLEAR ?auto_40241 ) ( ON-TABLE ?auto_40244 ) ( HOLDING ?auto_40242 ) ( CLEAR ?auto_40243 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40245 ?auto_40246 ?auto_40243 ?auto_40242 )
      ( MAKE-3PILE ?auto_40240 ?auto_40241 ?auto_40242 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40247 - BLOCK
      ?auto_40248 - BLOCK
      ?auto_40249 - BLOCK
    )
    :vars
    (
      ?auto_40253 - BLOCK
      ?auto_40250 - BLOCK
      ?auto_40251 - BLOCK
      ?auto_40252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40247 ?auto_40248 ) ) ( not ( = ?auto_40247 ?auto_40249 ) ) ( not ( = ?auto_40248 ?auto_40249 ) ) ( not ( = ?auto_40247 ?auto_40253 ) ) ( not ( = ?auto_40248 ?auto_40253 ) ) ( not ( = ?auto_40249 ?auto_40253 ) ) ( ON-TABLE ?auto_40250 ) ( ON ?auto_40251 ?auto_40250 ) ( ON ?auto_40253 ?auto_40251 ) ( not ( = ?auto_40250 ?auto_40251 ) ) ( not ( = ?auto_40250 ?auto_40253 ) ) ( not ( = ?auto_40250 ?auto_40249 ) ) ( not ( = ?auto_40250 ?auto_40248 ) ) ( not ( = ?auto_40251 ?auto_40253 ) ) ( not ( = ?auto_40251 ?auto_40249 ) ) ( not ( = ?auto_40251 ?auto_40248 ) ) ( not ( = ?auto_40247 ?auto_40250 ) ) ( not ( = ?auto_40247 ?auto_40251 ) ) ( ON ?auto_40247 ?auto_40252 ) ( not ( = ?auto_40247 ?auto_40252 ) ) ( not ( = ?auto_40248 ?auto_40252 ) ) ( not ( = ?auto_40249 ?auto_40252 ) ) ( not ( = ?auto_40253 ?auto_40252 ) ) ( not ( = ?auto_40250 ?auto_40252 ) ) ( not ( = ?auto_40251 ?auto_40252 ) ) ( ON ?auto_40248 ?auto_40247 ) ( ON-TABLE ?auto_40252 ) ( CLEAR ?auto_40253 ) ( ON ?auto_40249 ?auto_40248 ) ( CLEAR ?auto_40249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40252 ?auto_40247 ?auto_40248 )
      ( MAKE-3PILE ?auto_40247 ?auto_40248 ?auto_40249 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40254 - BLOCK
      ?auto_40255 - BLOCK
      ?auto_40256 - BLOCK
    )
    :vars
    (
      ?auto_40257 - BLOCK
      ?auto_40260 - BLOCK
      ?auto_40258 - BLOCK
      ?auto_40259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40254 ?auto_40255 ) ) ( not ( = ?auto_40254 ?auto_40256 ) ) ( not ( = ?auto_40255 ?auto_40256 ) ) ( not ( = ?auto_40254 ?auto_40257 ) ) ( not ( = ?auto_40255 ?auto_40257 ) ) ( not ( = ?auto_40256 ?auto_40257 ) ) ( ON-TABLE ?auto_40260 ) ( ON ?auto_40258 ?auto_40260 ) ( not ( = ?auto_40260 ?auto_40258 ) ) ( not ( = ?auto_40260 ?auto_40257 ) ) ( not ( = ?auto_40260 ?auto_40256 ) ) ( not ( = ?auto_40260 ?auto_40255 ) ) ( not ( = ?auto_40258 ?auto_40257 ) ) ( not ( = ?auto_40258 ?auto_40256 ) ) ( not ( = ?auto_40258 ?auto_40255 ) ) ( not ( = ?auto_40254 ?auto_40260 ) ) ( not ( = ?auto_40254 ?auto_40258 ) ) ( ON ?auto_40254 ?auto_40259 ) ( not ( = ?auto_40254 ?auto_40259 ) ) ( not ( = ?auto_40255 ?auto_40259 ) ) ( not ( = ?auto_40256 ?auto_40259 ) ) ( not ( = ?auto_40257 ?auto_40259 ) ) ( not ( = ?auto_40260 ?auto_40259 ) ) ( not ( = ?auto_40258 ?auto_40259 ) ) ( ON ?auto_40255 ?auto_40254 ) ( ON-TABLE ?auto_40259 ) ( ON ?auto_40256 ?auto_40255 ) ( CLEAR ?auto_40256 ) ( HOLDING ?auto_40257 ) ( CLEAR ?auto_40258 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40260 ?auto_40258 ?auto_40257 )
      ( MAKE-3PILE ?auto_40254 ?auto_40255 ?auto_40256 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40261 - BLOCK
      ?auto_40262 - BLOCK
      ?auto_40263 - BLOCK
    )
    :vars
    (
      ?auto_40265 - BLOCK
      ?auto_40264 - BLOCK
      ?auto_40266 - BLOCK
      ?auto_40267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40261 ?auto_40262 ) ) ( not ( = ?auto_40261 ?auto_40263 ) ) ( not ( = ?auto_40262 ?auto_40263 ) ) ( not ( = ?auto_40261 ?auto_40265 ) ) ( not ( = ?auto_40262 ?auto_40265 ) ) ( not ( = ?auto_40263 ?auto_40265 ) ) ( ON-TABLE ?auto_40264 ) ( ON ?auto_40266 ?auto_40264 ) ( not ( = ?auto_40264 ?auto_40266 ) ) ( not ( = ?auto_40264 ?auto_40265 ) ) ( not ( = ?auto_40264 ?auto_40263 ) ) ( not ( = ?auto_40264 ?auto_40262 ) ) ( not ( = ?auto_40266 ?auto_40265 ) ) ( not ( = ?auto_40266 ?auto_40263 ) ) ( not ( = ?auto_40266 ?auto_40262 ) ) ( not ( = ?auto_40261 ?auto_40264 ) ) ( not ( = ?auto_40261 ?auto_40266 ) ) ( ON ?auto_40261 ?auto_40267 ) ( not ( = ?auto_40261 ?auto_40267 ) ) ( not ( = ?auto_40262 ?auto_40267 ) ) ( not ( = ?auto_40263 ?auto_40267 ) ) ( not ( = ?auto_40265 ?auto_40267 ) ) ( not ( = ?auto_40264 ?auto_40267 ) ) ( not ( = ?auto_40266 ?auto_40267 ) ) ( ON ?auto_40262 ?auto_40261 ) ( ON-TABLE ?auto_40267 ) ( ON ?auto_40263 ?auto_40262 ) ( CLEAR ?auto_40266 ) ( ON ?auto_40265 ?auto_40263 ) ( CLEAR ?auto_40265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40267 ?auto_40261 ?auto_40262 ?auto_40263 )
      ( MAKE-3PILE ?auto_40261 ?auto_40262 ?auto_40263 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40268 - BLOCK
      ?auto_40269 - BLOCK
      ?auto_40270 - BLOCK
    )
    :vars
    (
      ?auto_40274 - BLOCK
      ?auto_40272 - BLOCK
      ?auto_40273 - BLOCK
      ?auto_40271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40268 ?auto_40269 ) ) ( not ( = ?auto_40268 ?auto_40270 ) ) ( not ( = ?auto_40269 ?auto_40270 ) ) ( not ( = ?auto_40268 ?auto_40274 ) ) ( not ( = ?auto_40269 ?auto_40274 ) ) ( not ( = ?auto_40270 ?auto_40274 ) ) ( ON-TABLE ?auto_40272 ) ( not ( = ?auto_40272 ?auto_40273 ) ) ( not ( = ?auto_40272 ?auto_40274 ) ) ( not ( = ?auto_40272 ?auto_40270 ) ) ( not ( = ?auto_40272 ?auto_40269 ) ) ( not ( = ?auto_40273 ?auto_40274 ) ) ( not ( = ?auto_40273 ?auto_40270 ) ) ( not ( = ?auto_40273 ?auto_40269 ) ) ( not ( = ?auto_40268 ?auto_40272 ) ) ( not ( = ?auto_40268 ?auto_40273 ) ) ( ON ?auto_40268 ?auto_40271 ) ( not ( = ?auto_40268 ?auto_40271 ) ) ( not ( = ?auto_40269 ?auto_40271 ) ) ( not ( = ?auto_40270 ?auto_40271 ) ) ( not ( = ?auto_40274 ?auto_40271 ) ) ( not ( = ?auto_40272 ?auto_40271 ) ) ( not ( = ?auto_40273 ?auto_40271 ) ) ( ON ?auto_40269 ?auto_40268 ) ( ON-TABLE ?auto_40271 ) ( ON ?auto_40270 ?auto_40269 ) ( ON ?auto_40274 ?auto_40270 ) ( CLEAR ?auto_40274 ) ( HOLDING ?auto_40273 ) ( CLEAR ?auto_40272 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40272 ?auto_40273 )
      ( MAKE-3PILE ?auto_40268 ?auto_40269 ?auto_40270 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40275 - BLOCK
      ?auto_40276 - BLOCK
      ?auto_40277 - BLOCK
    )
    :vars
    (
      ?auto_40278 - BLOCK
      ?auto_40280 - BLOCK
      ?auto_40281 - BLOCK
      ?auto_40279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40275 ?auto_40276 ) ) ( not ( = ?auto_40275 ?auto_40277 ) ) ( not ( = ?auto_40276 ?auto_40277 ) ) ( not ( = ?auto_40275 ?auto_40278 ) ) ( not ( = ?auto_40276 ?auto_40278 ) ) ( not ( = ?auto_40277 ?auto_40278 ) ) ( ON-TABLE ?auto_40280 ) ( not ( = ?auto_40280 ?auto_40281 ) ) ( not ( = ?auto_40280 ?auto_40278 ) ) ( not ( = ?auto_40280 ?auto_40277 ) ) ( not ( = ?auto_40280 ?auto_40276 ) ) ( not ( = ?auto_40281 ?auto_40278 ) ) ( not ( = ?auto_40281 ?auto_40277 ) ) ( not ( = ?auto_40281 ?auto_40276 ) ) ( not ( = ?auto_40275 ?auto_40280 ) ) ( not ( = ?auto_40275 ?auto_40281 ) ) ( ON ?auto_40275 ?auto_40279 ) ( not ( = ?auto_40275 ?auto_40279 ) ) ( not ( = ?auto_40276 ?auto_40279 ) ) ( not ( = ?auto_40277 ?auto_40279 ) ) ( not ( = ?auto_40278 ?auto_40279 ) ) ( not ( = ?auto_40280 ?auto_40279 ) ) ( not ( = ?auto_40281 ?auto_40279 ) ) ( ON ?auto_40276 ?auto_40275 ) ( ON-TABLE ?auto_40279 ) ( ON ?auto_40277 ?auto_40276 ) ( ON ?auto_40278 ?auto_40277 ) ( CLEAR ?auto_40280 ) ( ON ?auto_40281 ?auto_40278 ) ( CLEAR ?auto_40281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40279 ?auto_40275 ?auto_40276 ?auto_40277 ?auto_40278 )
      ( MAKE-3PILE ?auto_40275 ?auto_40276 ?auto_40277 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40282 - BLOCK
      ?auto_40283 - BLOCK
      ?auto_40284 - BLOCK
    )
    :vars
    (
      ?auto_40287 - BLOCK
      ?auto_40286 - BLOCK
      ?auto_40285 - BLOCK
      ?auto_40288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40282 ?auto_40283 ) ) ( not ( = ?auto_40282 ?auto_40284 ) ) ( not ( = ?auto_40283 ?auto_40284 ) ) ( not ( = ?auto_40282 ?auto_40287 ) ) ( not ( = ?auto_40283 ?auto_40287 ) ) ( not ( = ?auto_40284 ?auto_40287 ) ) ( not ( = ?auto_40286 ?auto_40285 ) ) ( not ( = ?auto_40286 ?auto_40287 ) ) ( not ( = ?auto_40286 ?auto_40284 ) ) ( not ( = ?auto_40286 ?auto_40283 ) ) ( not ( = ?auto_40285 ?auto_40287 ) ) ( not ( = ?auto_40285 ?auto_40284 ) ) ( not ( = ?auto_40285 ?auto_40283 ) ) ( not ( = ?auto_40282 ?auto_40286 ) ) ( not ( = ?auto_40282 ?auto_40285 ) ) ( ON ?auto_40282 ?auto_40288 ) ( not ( = ?auto_40282 ?auto_40288 ) ) ( not ( = ?auto_40283 ?auto_40288 ) ) ( not ( = ?auto_40284 ?auto_40288 ) ) ( not ( = ?auto_40287 ?auto_40288 ) ) ( not ( = ?auto_40286 ?auto_40288 ) ) ( not ( = ?auto_40285 ?auto_40288 ) ) ( ON ?auto_40283 ?auto_40282 ) ( ON-TABLE ?auto_40288 ) ( ON ?auto_40284 ?auto_40283 ) ( ON ?auto_40287 ?auto_40284 ) ( ON ?auto_40285 ?auto_40287 ) ( CLEAR ?auto_40285 ) ( HOLDING ?auto_40286 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40286 )
      ( MAKE-3PILE ?auto_40282 ?auto_40283 ?auto_40284 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_40289 - BLOCK
      ?auto_40290 - BLOCK
      ?auto_40291 - BLOCK
    )
    :vars
    (
      ?auto_40292 - BLOCK
      ?auto_40294 - BLOCK
      ?auto_40293 - BLOCK
      ?auto_40295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40289 ?auto_40290 ) ) ( not ( = ?auto_40289 ?auto_40291 ) ) ( not ( = ?auto_40290 ?auto_40291 ) ) ( not ( = ?auto_40289 ?auto_40292 ) ) ( not ( = ?auto_40290 ?auto_40292 ) ) ( not ( = ?auto_40291 ?auto_40292 ) ) ( not ( = ?auto_40294 ?auto_40293 ) ) ( not ( = ?auto_40294 ?auto_40292 ) ) ( not ( = ?auto_40294 ?auto_40291 ) ) ( not ( = ?auto_40294 ?auto_40290 ) ) ( not ( = ?auto_40293 ?auto_40292 ) ) ( not ( = ?auto_40293 ?auto_40291 ) ) ( not ( = ?auto_40293 ?auto_40290 ) ) ( not ( = ?auto_40289 ?auto_40294 ) ) ( not ( = ?auto_40289 ?auto_40293 ) ) ( ON ?auto_40289 ?auto_40295 ) ( not ( = ?auto_40289 ?auto_40295 ) ) ( not ( = ?auto_40290 ?auto_40295 ) ) ( not ( = ?auto_40291 ?auto_40295 ) ) ( not ( = ?auto_40292 ?auto_40295 ) ) ( not ( = ?auto_40294 ?auto_40295 ) ) ( not ( = ?auto_40293 ?auto_40295 ) ) ( ON ?auto_40290 ?auto_40289 ) ( ON-TABLE ?auto_40295 ) ( ON ?auto_40291 ?auto_40290 ) ( ON ?auto_40292 ?auto_40291 ) ( ON ?auto_40293 ?auto_40292 ) ( ON ?auto_40294 ?auto_40293 ) ( CLEAR ?auto_40294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40295 ?auto_40289 ?auto_40290 ?auto_40291 ?auto_40292 ?auto_40293 )
      ( MAKE-3PILE ?auto_40289 ?auto_40290 ?auto_40291 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40311 - BLOCK
      ?auto_40312 - BLOCK
    )
    :vars
    (
      ?auto_40315 - BLOCK
      ?auto_40314 - BLOCK
      ?auto_40313 - BLOCK
      ?auto_40316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40315 ?auto_40312 ) ( ON-TABLE ?auto_40311 ) ( ON ?auto_40312 ?auto_40311 ) ( not ( = ?auto_40311 ?auto_40312 ) ) ( not ( = ?auto_40311 ?auto_40315 ) ) ( not ( = ?auto_40312 ?auto_40315 ) ) ( not ( = ?auto_40311 ?auto_40314 ) ) ( not ( = ?auto_40311 ?auto_40313 ) ) ( not ( = ?auto_40312 ?auto_40314 ) ) ( not ( = ?auto_40312 ?auto_40313 ) ) ( not ( = ?auto_40315 ?auto_40314 ) ) ( not ( = ?auto_40315 ?auto_40313 ) ) ( not ( = ?auto_40314 ?auto_40313 ) ) ( ON ?auto_40314 ?auto_40315 ) ( CLEAR ?auto_40314 ) ( HOLDING ?auto_40313 ) ( CLEAR ?auto_40316 ) ( ON-TABLE ?auto_40316 ) ( not ( = ?auto_40316 ?auto_40313 ) ) ( not ( = ?auto_40311 ?auto_40316 ) ) ( not ( = ?auto_40312 ?auto_40316 ) ) ( not ( = ?auto_40315 ?auto_40316 ) ) ( not ( = ?auto_40314 ?auto_40316 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40316 ?auto_40313 )
      ( MAKE-2PILE ?auto_40311 ?auto_40312 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40317 - BLOCK
      ?auto_40318 - BLOCK
    )
    :vars
    (
      ?auto_40321 - BLOCK
      ?auto_40322 - BLOCK
      ?auto_40319 - BLOCK
      ?auto_40320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40321 ?auto_40318 ) ( ON-TABLE ?auto_40317 ) ( ON ?auto_40318 ?auto_40317 ) ( not ( = ?auto_40317 ?auto_40318 ) ) ( not ( = ?auto_40317 ?auto_40321 ) ) ( not ( = ?auto_40318 ?auto_40321 ) ) ( not ( = ?auto_40317 ?auto_40322 ) ) ( not ( = ?auto_40317 ?auto_40319 ) ) ( not ( = ?auto_40318 ?auto_40322 ) ) ( not ( = ?auto_40318 ?auto_40319 ) ) ( not ( = ?auto_40321 ?auto_40322 ) ) ( not ( = ?auto_40321 ?auto_40319 ) ) ( not ( = ?auto_40322 ?auto_40319 ) ) ( ON ?auto_40322 ?auto_40321 ) ( CLEAR ?auto_40320 ) ( ON-TABLE ?auto_40320 ) ( not ( = ?auto_40320 ?auto_40319 ) ) ( not ( = ?auto_40317 ?auto_40320 ) ) ( not ( = ?auto_40318 ?auto_40320 ) ) ( not ( = ?auto_40321 ?auto_40320 ) ) ( not ( = ?auto_40322 ?auto_40320 ) ) ( ON ?auto_40319 ?auto_40322 ) ( CLEAR ?auto_40319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40317 ?auto_40318 ?auto_40321 ?auto_40322 )
      ( MAKE-2PILE ?auto_40317 ?auto_40318 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40323 - BLOCK
      ?auto_40324 - BLOCK
    )
    :vars
    (
      ?auto_40326 - BLOCK
      ?auto_40327 - BLOCK
      ?auto_40328 - BLOCK
      ?auto_40325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40326 ?auto_40324 ) ( ON-TABLE ?auto_40323 ) ( ON ?auto_40324 ?auto_40323 ) ( not ( = ?auto_40323 ?auto_40324 ) ) ( not ( = ?auto_40323 ?auto_40326 ) ) ( not ( = ?auto_40324 ?auto_40326 ) ) ( not ( = ?auto_40323 ?auto_40327 ) ) ( not ( = ?auto_40323 ?auto_40328 ) ) ( not ( = ?auto_40324 ?auto_40327 ) ) ( not ( = ?auto_40324 ?auto_40328 ) ) ( not ( = ?auto_40326 ?auto_40327 ) ) ( not ( = ?auto_40326 ?auto_40328 ) ) ( not ( = ?auto_40327 ?auto_40328 ) ) ( ON ?auto_40327 ?auto_40326 ) ( not ( = ?auto_40325 ?auto_40328 ) ) ( not ( = ?auto_40323 ?auto_40325 ) ) ( not ( = ?auto_40324 ?auto_40325 ) ) ( not ( = ?auto_40326 ?auto_40325 ) ) ( not ( = ?auto_40327 ?auto_40325 ) ) ( ON ?auto_40328 ?auto_40327 ) ( CLEAR ?auto_40328 ) ( HOLDING ?auto_40325 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40325 )
      ( MAKE-2PILE ?auto_40323 ?auto_40324 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40337 - BLOCK
      ?auto_40338 - BLOCK
    )
    :vars
    (
      ?auto_40340 - BLOCK
      ?auto_40341 - BLOCK
      ?auto_40342 - BLOCK
      ?auto_40339 - BLOCK
      ?auto_40343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40340 ?auto_40338 ) ( ON-TABLE ?auto_40337 ) ( ON ?auto_40338 ?auto_40337 ) ( not ( = ?auto_40337 ?auto_40338 ) ) ( not ( = ?auto_40337 ?auto_40340 ) ) ( not ( = ?auto_40338 ?auto_40340 ) ) ( not ( = ?auto_40337 ?auto_40341 ) ) ( not ( = ?auto_40337 ?auto_40342 ) ) ( not ( = ?auto_40338 ?auto_40341 ) ) ( not ( = ?auto_40338 ?auto_40342 ) ) ( not ( = ?auto_40340 ?auto_40341 ) ) ( not ( = ?auto_40340 ?auto_40342 ) ) ( not ( = ?auto_40341 ?auto_40342 ) ) ( ON ?auto_40341 ?auto_40340 ) ( not ( = ?auto_40339 ?auto_40342 ) ) ( not ( = ?auto_40337 ?auto_40339 ) ) ( not ( = ?auto_40338 ?auto_40339 ) ) ( not ( = ?auto_40340 ?auto_40339 ) ) ( not ( = ?auto_40341 ?auto_40339 ) ) ( ON ?auto_40342 ?auto_40341 ) ( CLEAR ?auto_40342 ) ( ON ?auto_40339 ?auto_40343 ) ( CLEAR ?auto_40339 ) ( HAND-EMPTY ) ( not ( = ?auto_40337 ?auto_40343 ) ) ( not ( = ?auto_40338 ?auto_40343 ) ) ( not ( = ?auto_40340 ?auto_40343 ) ) ( not ( = ?auto_40341 ?auto_40343 ) ) ( not ( = ?auto_40342 ?auto_40343 ) ) ( not ( = ?auto_40339 ?auto_40343 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40339 ?auto_40343 )
      ( MAKE-2PILE ?auto_40337 ?auto_40338 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_40344 - BLOCK
      ?auto_40345 - BLOCK
    )
    :vars
    (
      ?auto_40347 - BLOCK
      ?auto_40348 - BLOCK
      ?auto_40349 - BLOCK
      ?auto_40350 - BLOCK
      ?auto_40346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40347 ?auto_40345 ) ( ON-TABLE ?auto_40344 ) ( ON ?auto_40345 ?auto_40344 ) ( not ( = ?auto_40344 ?auto_40345 ) ) ( not ( = ?auto_40344 ?auto_40347 ) ) ( not ( = ?auto_40345 ?auto_40347 ) ) ( not ( = ?auto_40344 ?auto_40348 ) ) ( not ( = ?auto_40344 ?auto_40349 ) ) ( not ( = ?auto_40345 ?auto_40348 ) ) ( not ( = ?auto_40345 ?auto_40349 ) ) ( not ( = ?auto_40347 ?auto_40348 ) ) ( not ( = ?auto_40347 ?auto_40349 ) ) ( not ( = ?auto_40348 ?auto_40349 ) ) ( ON ?auto_40348 ?auto_40347 ) ( not ( = ?auto_40350 ?auto_40349 ) ) ( not ( = ?auto_40344 ?auto_40350 ) ) ( not ( = ?auto_40345 ?auto_40350 ) ) ( not ( = ?auto_40347 ?auto_40350 ) ) ( not ( = ?auto_40348 ?auto_40350 ) ) ( ON ?auto_40350 ?auto_40346 ) ( CLEAR ?auto_40350 ) ( not ( = ?auto_40344 ?auto_40346 ) ) ( not ( = ?auto_40345 ?auto_40346 ) ) ( not ( = ?auto_40347 ?auto_40346 ) ) ( not ( = ?auto_40348 ?auto_40346 ) ) ( not ( = ?auto_40349 ?auto_40346 ) ) ( not ( = ?auto_40350 ?auto_40346 ) ) ( HOLDING ?auto_40349 ) ( CLEAR ?auto_40348 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40344 ?auto_40345 ?auto_40347 ?auto_40348 ?auto_40349 )
      ( MAKE-2PILE ?auto_40344 ?auto_40345 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40390 - BLOCK
      ?auto_40391 - BLOCK
      ?auto_40392 - BLOCK
      ?auto_40393 - BLOCK
    )
    :vars
    (
      ?auto_40394 - BLOCK
      ?auto_40395 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40390 ) ( ON ?auto_40391 ?auto_40390 ) ( not ( = ?auto_40390 ?auto_40391 ) ) ( not ( = ?auto_40390 ?auto_40392 ) ) ( not ( = ?auto_40390 ?auto_40393 ) ) ( not ( = ?auto_40391 ?auto_40392 ) ) ( not ( = ?auto_40391 ?auto_40393 ) ) ( not ( = ?auto_40392 ?auto_40393 ) ) ( ON ?auto_40393 ?auto_40394 ) ( not ( = ?auto_40390 ?auto_40394 ) ) ( not ( = ?auto_40391 ?auto_40394 ) ) ( not ( = ?auto_40392 ?auto_40394 ) ) ( not ( = ?auto_40393 ?auto_40394 ) ) ( CLEAR ?auto_40391 ) ( ON ?auto_40392 ?auto_40393 ) ( CLEAR ?auto_40392 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40395 ) ( ON ?auto_40394 ?auto_40395 ) ( not ( = ?auto_40395 ?auto_40394 ) ) ( not ( = ?auto_40395 ?auto_40393 ) ) ( not ( = ?auto_40395 ?auto_40392 ) ) ( not ( = ?auto_40390 ?auto_40395 ) ) ( not ( = ?auto_40391 ?auto_40395 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40395 ?auto_40394 ?auto_40393 )
      ( MAKE-4PILE ?auto_40390 ?auto_40391 ?auto_40392 ?auto_40393 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40396 - BLOCK
      ?auto_40397 - BLOCK
      ?auto_40398 - BLOCK
      ?auto_40399 - BLOCK
    )
    :vars
    (
      ?auto_40400 - BLOCK
      ?auto_40401 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40396 ) ( not ( = ?auto_40396 ?auto_40397 ) ) ( not ( = ?auto_40396 ?auto_40398 ) ) ( not ( = ?auto_40396 ?auto_40399 ) ) ( not ( = ?auto_40397 ?auto_40398 ) ) ( not ( = ?auto_40397 ?auto_40399 ) ) ( not ( = ?auto_40398 ?auto_40399 ) ) ( ON ?auto_40399 ?auto_40400 ) ( not ( = ?auto_40396 ?auto_40400 ) ) ( not ( = ?auto_40397 ?auto_40400 ) ) ( not ( = ?auto_40398 ?auto_40400 ) ) ( not ( = ?auto_40399 ?auto_40400 ) ) ( ON ?auto_40398 ?auto_40399 ) ( CLEAR ?auto_40398 ) ( ON-TABLE ?auto_40401 ) ( ON ?auto_40400 ?auto_40401 ) ( not ( = ?auto_40401 ?auto_40400 ) ) ( not ( = ?auto_40401 ?auto_40399 ) ) ( not ( = ?auto_40401 ?auto_40398 ) ) ( not ( = ?auto_40396 ?auto_40401 ) ) ( not ( = ?auto_40397 ?auto_40401 ) ) ( HOLDING ?auto_40397 ) ( CLEAR ?auto_40396 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40396 ?auto_40397 )
      ( MAKE-4PILE ?auto_40396 ?auto_40397 ?auto_40398 ?auto_40399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40402 - BLOCK
      ?auto_40403 - BLOCK
      ?auto_40404 - BLOCK
      ?auto_40405 - BLOCK
    )
    :vars
    (
      ?auto_40407 - BLOCK
      ?auto_40406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40402 ) ( not ( = ?auto_40402 ?auto_40403 ) ) ( not ( = ?auto_40402 ?auto_40404 ) ) ( not ( = ?auto_40402 ?auto_40405 ) ) ( not ( = ?auto_40403 ?auto_40404 ) ) ( not ( = ?auto_40403 ?auto_40405 ) ) ( not ( = ?auto_40404 ?auto_40405 ) ) ( ON ?auto_40405 ?auto_40407 ) ( not ( = ?auto_40402 ?auto_40407 ) ) ( not ( = ?auto_40403 ?auto_40407 ) ) ( not ( = ?auto_40404 ?auto_40407 ) ) ( not ( = ?auto_40405 ?auto_40407 ) ) ( ON ?auto_40404 ?auto_40405 ) ( ON-TABLE ?auto_40406 ) ( ON ?auto_40407 ?auto_40406 ) ( not ( = ?auto_40406 ?auto_40407 ) ) ( not ( = ?auto_40406 ?auto_40405 ) ) ( not ( = ?auto_40406 ?auto_40404 ) ) ( not ( = ?auto_40402 ?auto_40406 ) ) ( not ( = ?auto_40403 ?auto_40406 ) ) ( CLEAR ?auto_40402 ) ( ON ?auto_40403 ?auto_40404 ) ( CLEAR ?auto_40403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40406 ?auto_40407 ?auto_40405 ?auto_40404 )
      ( MAKE-4PILE ?auto_40402 ?auto_40403 ?auto_40404 ?auto_40405 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40408 - BLOCK
      ?auto_40409 - BLOCK
      ?auto_40410 - BLOCK
      ?auto_40411 - BLOCK
    )
    :vars
    (
      ?auto_40413 - BLOCK
      ?auto_40412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40408 ?auto_40409 ) ) ( not ( = ?auto_40408 ?auto_40410 ) ) ( not ( = ?auto_40408 ?auto_40411 ) ) ( not ( = ?auto_40409 ?auto_40410 ) ) ( not ( = ?auto_40409 ?auto_40411 ) ) ( not ( = ?auto_40410 ?auto_40411 ) ) ( ON ?auto_40411 ?auto_40413 ) ( not ( = ?auto_40408 ?auto_40413 ) ) ( not ( = ?auto_40409 ?auto_40413 ) ) ( not ( = ?auto_40410 ?auto_40413 ) ) ( not ( = ?auto_40411 ?auto_40413 ) ) ( ON ?auto_40410 ?auto_40411 ) ( ON-TABLE ?auto_40412 ) ( ON ?auto_40413 ?auto_40412 ) ( not ( = ?auto_40412 ?auto_40413 ) ) ( not ( = ?auto_40412 ?auto_40411 ) ) ( not ( = ?auto_40412 ?auto_40410 ) ) ( not ( = ?auto_40408 ?auto_40412 ) ) ( not ( = ?auto_40409 ?auto_40412 ) ) ( ON ?auto_40409 ?auto_40410 ) ( CLEAR ?auto_40409 ) ( HOLDING ?auto_40408 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40408 )
      ( MAKE-4PILE ?auto_40408 ?auto_40409 ?auto_40410 ?auto_40411 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40414 - BLOCK
      ?auto_40415 - BLOCK
      ?auto_40416 - BLOCK
      ?auto_40417 - BLOCK
    )
    :vars
    (
      ?auto_40418 - BLOCK
      ?auto_40419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40414 ?auto_40415 ) ) ( not ( = ?auto_40414 ?auto_40416 ) ) ( not ( = ?auto_40414 ?auto_40417 ) ) ( not ( = ?auto_40415 ?auto_40416 ) ) ( not ( = ?auto_40415 ?auto_40417 ) ) ( not ( = ?auto_40416 ?auto_40417 ) ) ( ON ?auto_40417 ?auto_40418 ) ( not ( = ?auto_40414 ?auto_40418 ) ) ( not ( = ?auto_40415 ?auto_40418 ) ) ( not ( = ?auto_40416 ?auto_40418 ) ) ( not ( = ?auto_40417 ?auto_40418 ) ) ( ON ?auto_40416 ?auto_40417 ) ( ON-TABLE ?auto_40419 ) ( ON ?auto_40418 ?auto_40419 ) ( not ( = ?auto_40419 ?auto_40418 ) ) ( not ( = ?auto_40419 ?auto_40417 ) ) ( not ( = ?auto_40419 ?auto_40416 ) ) ( not ( = ?auto_40414 ?auto_40419 ) ) ( not ( = ?auto_40415 ?auto_40419 ) ) ( ON ?auto_40415 ?auto_40416 ) ( ON ?auto_40414 ?auto_40415 ) ( CLEAR ?auto_40414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40419 ?auto_40418 ?auto_40417 ?auto_40416 ?auto_40415 )
      ( MAKE-4PILE ?auto_40414 ?auto_40415 ?auto_40416 ?auto_40417 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40424 - BLOCK
      ?auto_40425 - BLOCK
      ?auto_40426 - BLOCK
      ?auto_40427 - BLOCK
    )
    :vars
    (
      ?auto_40428 - BLOCK
      ?auto_40429 - BLOCK
      ?auto_40430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40424 ?auto_40425 ) ) ( not ( = ?auto_40424 ?auto_40426 ) ) ( not ( = ?auto_40424 ?auto_40427 ) ) ( not ( = ?auto_40425 ?auto_40426 ) ) ( not ( = ?auto_40425 ?auto_40427 ) ) ( not ( = ?auto_40426 ?auto_40427 ) ) ( ON ?auto_40427 ?auto_40428 ) ( not ( = ?auto_40424 ?auto_40428 ) ) ( not ( = ?auto_40425 ?auto_40428 ) ) ( not ( = ?auto_40426 ?auto_40428 ) ) ( not ( = ?auto_40427 ?auto_40428 ) ) ( ON ?auto_40426 ?auto_40427 ) ( ON-TABLE ?auto_40429 ) ( ON ?auto_40428 ?auto_40429 ) ( not ( = ?auto_40429 ?auto_40428 ) ) ( not ( = ?auto_40429 ?auto_40427 ) ) ( not ( = ?auto_40429 ?auto_40426 ) ) ( not ( = ?auto_40424 ?auto_40429 ) ) ( not ( = ?auto_40425 ?auto_40429 ) ) ( ON ?auto_40425 ?auto_40426 ) ( CLEAR ?auto_40425 ) ( ON ?auto_40424 ?auto_40430 ) ( CLEAR ?auto_40424 ) ( HAND-EMPTY ) ( not ( = ?auto_40424 ?auto_40430 ) ) ( not ( = ?auto_40425 ?auto_40430 ) ) ( not ( = ?auto_40426 ?auto_40430 ) ) ( not ( = ?auto_40427 ?auto_40430 ) ) ( not ( = ?auto_40428 ?auto_40430 ) ) ( not ( = ?auto_40429 ?auto_40430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40424 ?auto_40430 )
      ( MAKE-4PILE ?auto_40424 ?auto_40425 ?auto_40426 ?auto_40427 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40431 - BLOCK
      ?auto_40432 - BLOCK
      ?auto_40433 - BLOCK
      ?auto_40434 - BLOCK
    )
    :vars
    (
      ?auto_40437 - BLOCK
      ?auto_40435 - BLOCK
      ?auto_40436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40431 ?auto_40432 ) ) ( not ( = ?auto_40431 ?auto_40433 ) ) ( not ( = ?auto_40431 ?auto_40434 ) ) ( not ( = ?auto_40432 ?auto_40433 ) ) ( not ( = ?auto_40432 ?auto_40434 ) ) ( not ( = ?auto_40433 ?auto_40434 ) ) ( ON ?auto_40434 ?auto_40437 ) ( not ( = ?auto_40431 ?auto_40437 ) ) ( not ( = ?auto_40432 ?auto_40437 ) ) ( not ( = ?auto_40433 ?auto_40437 ) ) ( not ( = ?auto_40434 ?auto_40437 ) ) ( ON ?auto_40433 ?auto_40434 ) ( ON-TABLE ?auto_40435 ) ( ON ?auto_40437 ?auto_40435 ) ( not ( = ?auto_40435 ?auto_40437 ) ) ( not ( = ?auto_40435 ?auto_40434 ) ) ( not ( = ?auto_40435 ?auto_40433 ) ) ( not ( = ?auto_40431 ?auto_40435 ) ) ( not ( = ?auto_40432 ?auto_40435 ) ) ( ON ?auto_40431 ?auto_40436 ) ( CLEAR ?auto_40431 ) ( not ( = ?auto_40431 ?auto_40436 ) ) ( not ( = ?auto_40432 ?auto_40436 ) ) ( not ( = ?auto_40433 ?auto_40436 ) ) ( not ( = ?auto_40434 ?auto_40436 ) ) ( not ( = ?auto_40437 ?auto_40436 ) ) ( not ( = ?auto_40435 ?auto_40436 ) ) ( HOLDING ?auto_40432 ) ( CLEAR ?auto_40433 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40435 ?auto_40437 ?auto_40434 ?auto_40433 ?auto_40432 )
      ( MAKE-4PILE ?auto_40431 ?auto_40432 ?auto_40433 ?auto_40434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40438 - BLOCK
      ?auto_40439 - BLOCK
      ?auto_40440 - BLOCK
      ?auto_40441 - BLOCK
    )
    :vars
    (
      ?auto_40443 - BLOCK
      ?auto_40442 - BLOCK
      ?auto_40444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40438 ?auto_40439 ) ) ( not ( = ?auto_40438 ?auto_40440 ) ) ( not ( = ?auto_40438 ?auto_40441 ) ) ( not ( = ?auto_40439 ?auto_40440 ) ) ( not ( = ?auto_40439 ?auto_40441 ) ) ( not ( = ?auto_40440 ?auto_40441 ) ) ( ON ?auto_40441 ?auto_40443 ) ( not ( = ?auto_40438 ?auto_40443 ) ) ( not ( = ?auto_40439 ?auto_40443 ) ) ( not ( = ?auto_40440 ?auto_40443 ) ) ( not ( = ?auto_40441 ?auto_40443 ) ) ( ON ?auto_40440 ?auto_40441 ) ( ON-TABLE ?auto_40442 ) ( ON ?auto_40443 ?auto_40442 ) ( not ( = ?auto_40442 ?auto_40443 ) ) ( not ( = ?auto_40442 ?auto_40441 ) ) ( not ( = ?auto_40442 ?auto_40440 ) ) ( not ( = ?auto_40438 ?auto_40442 ) ) ( not ( = ?auto_40439 ?auto_40442 ) ) ( ON ?auto_40438 ?auto_40444 ) ( not ( = ?auto_40438 ?auto_40444 ) ) ( not ( = ?auto_40439 ?auto_40444 ) ) ( not ( = ?auto_40440 ?auto_40444 ) ) ( not ( = ?auto_40441 ?auto_40444 ) ) ( not ( = ?auto_40443 ?auto_40444 ) ) ( not ( = ?auto_40442 ?auto_40444 ) ) ( CLEAR ?auto_40440 ) ( ON ?auto_40439 ?auto_40438 ) ( CLEAR ?auto_40439 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40444 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40444 ?auto_40438 )
      ( MAKE-4PILE ?auto_40438 ?auto_40439 ?auto_40440 ?auto_40441 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40445 - BLOCK
      ?auto_40446 - BLOCK
      ?auto_40447 - BLOCK
      ?auto_40448 - BLOCK
    )
    :vars
    (
      ?auto_40449 - BLOCK
      ?auto_40451 - BLOCK
      ?auto_40450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40445 ?auto_40446 ) ) ( not ( = ?auto_40445 ?auto_40447 ) ) ( not ( = ?auto_40445 ?auto_40448 ) ) ( not ( = ?auto_40446 ?auto_40447 ) ) ( not ( = ?auto_40446 ?auto_40448 ) ) ( not ( = ?auto_40447 ?auto_40448 ) ) ( ON ?auto_40448 ?auto_40449 ) ( not ( = ?auto_40445 ?auto_40449 ) ) ( not ( = ?auto_40446 ?auto_40449 ) ) ( not ( = ?auto_40447 ?auto_40449 ) ) ( not ( = ?auto_40448 ?auto_40449 ) ) ( ON-TABLE ?auto_40451 ) ( ON ?auto_40449 ?auto_40451 ) ( not ( = ?auto_40451 ?auto_40449 ) ) ( not ( = ?auto_40451 ?auto_40448 ) ) ( not ( = ?auto_40451 ?auto_40447 ) ) ( not ( = ?auto_40445 ?auto_40451 ) ) ( not ( = ?auto_40446 ?auto_40451 ) ) ( ON ?auto_40445 ?auto_40450 ) ( not ( = ?auto_40445 ?auto_40450 ) ) ( not ( = ?auto_40446 ?auto_40450 ) ) ( not ( = ?auto_40447 ?auto_40450 ) ) ( not ( = ?auto_40448 ?auto_40450 ) ) ( not ( = ?auto_40449 ?auto_40450 ) ) ( not ( = ?auto_40451 ?auto_40450 ) ) ( ON ?auto_40446 ?auto_40445 ) ( CLEAR ?auto_40446 ) ( ON-TABLE ?auto_40450 ) ( HOLDING ?auto_40447 ) ( CLEAR ?auto_40448 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40451 ?auto_40449 ?auto_40448 ?auto_40447 )
      ( MAKE-4PILE ?auto_40445 ?auto_40446 ?auto_40447 ?auto_40448 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40452 - BLOCK
      ?auto_40453 - BLOCK
      ?auto_40454 - BLOCK
      ?auto_40455 - BLOCK
    )
    :vars
    (
      ?auto_40457 - BLOCK
      ?auto_40458 - BLOCK
      ?auto_40456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40452 ?auto_40453 ) ) ( not ( = ?auto_40452 ?auto_40454 ) ) ( not ( = ?auto_40452 ?auto_40455 ) ) ( not ( = ?auto_40453 ?auto_40454 ) ) ( not ( = ?auto_40453 ?auto_40455 ) ) ( not ( = ?auto_40454 ?auto_40455 ) ) ( ON ?auto_40455 ?auto_40457 ) ( not ( = ?auto_40452 ?auto_40457 ) ) ( not ( = ?auto_40453 ?auto_40457 ) ) ( not ( = ?auto_40454 ?auto_40457 ) ) ( not ( = ?auto_40455 ?auto_40457 ) ) ( ON-TABLE ?auto_40458 ) ( ON ?auto_40457 ?auto_40458 ) ( not ( = ?auto_40458 ?auto_40457 ) ) ( not ( = ?auto_40458 ?auto_40455 ) ) ( not ( = ?auto_40458 ?auto_40454 ) ) ( not ( = ?auto_40452 ?auto_40458 ) ) ( not ( = ?auto_40453 ?auto_40458 ) ) ( ON ?auto_40452 ?auto_40456 ) ( not ( = ?auto_40452 ?auto_40456 ) ) ( not ( = ?auto_40453 ?auto_40456 ) ) ( not ( = ?auto_40454 ?auto_40456 ) ) ( not ( = ?auto_40455 ?auto_40456 ) ) ( not ( = ?auto_40457 ?auto_40456 ) ) ( not ( = ?auto_40458 ?auto_40456 ) ) ( ON ?auto_40453 ?auto_40452 ) ( ON-TABLE ?auto_40456 ) ( CLEAR ?auto_40455 ) ( ON ?auto_40454 ?auto_40453 ) ( CLEAR ?auto_40454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40456 ?auto_40452 ?auto_40453 )
      ( MAKE-4PILE ?auto_40452 ?auto_40453 ?auto_40454 ?auto_40455 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40459 - BLOCK
      ?auto_40460 - BLOCK
      ?auto_40461 - BLOCK
      ?auto_40462 - BLOCK
    )
    :vars
    (
      ?auto_40464 - BLOCK
      ?auto_40465 - BLOCK
      ?auto_40463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40459 ?auto_40460 ) ) ( not ( = ?auto_40459 ?auto_40461 ) ) ( not ( = ?auto_40459 ?auto_40462 ) ) ( not ( = ?auto_40460 ?auto_40461 ) ) ( not ( = ?auto_40460 ?auto_40462 ) ) ( not ( = ?auto_40461 ?auto_40462 ) ) ( not ( = ?auto_40459 ?auto_40464 ) ) ( not ( = ?auto_40460 ?auto_40464 ) ) ( not ( = ?auto_40461 ?auto_40464 ) ) ( not ( = ?auto_40462 ?auto_40464 ) ) ( ON-TABLE ?auto_40465 ) ( ON ?auto_40464 ?auto_40465 ) ( not ( = ?auto_40465 ?auto_40464 ) ) ( not ( = ?auto_40465 ?auto_40462 ) ) ( not ( = ?auto_40465 ?auto_40461 ) ) ( not ( = ?auto_40459 ?auto_40465 ) ) ( not ( = ?auto_40460 ?auto_40465 ) ) ( ON ?auto_40459 ?auto_40463 ) ( not ( = ?auto_40459 ?auto_40463 ) ) ( not ( = ?auto_40460 ?auto_40463 ) ) ( not ( = ?auto_40461 ?auto_40463 ) ) ( not ( = ?auto_40462 ?auto_40463 ) ) ( not ( = ?auto_40464 ?auto_40463 ) ) ( not ( = ?auto_40465 ?auto_40463 ) ) ( ON ?auto_40460 ?auto_40459 ) ( ON-TABLE ?auto_40463 ) ( ON ?auto_40461 ?auto_40460 ) ( CLEAR ?auto_40461 ) ( HOLDING ?auto_40462 ) ( CLEAR ?auto_40464 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40465 ?auto_40464 ?auto_40462 )
      ( MAKE-4PILE ?auto_40459 ?auto_40460 ?auto_40461 ?auto_40462 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40466 - BLOCK
      ?auto_40467 - BLOCK
      ?auto_40468 - BLOCK
      ?auto_40469 - BLOCK
    )
    :vars
    (
      ?auto_40472 - BLOCK
      ?auto_40471 - BLOCK
      ?auto_40470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40466 ?auto_40467 ) ) ( not ( = ?auto_40466 ?auto_40468 ) ) ( not ( = ?auto_40466 ?auto_40469 ) ) ( not ( = ?auto_40467 ?auto_40468 ) ) ( not ( = ?auto_40467 ?auto_40469 ) ) ( not ( = ?auto_40468 ?auto_40469 ) ) ( not ( = ?auto_40466 ?auto_40472 ) ) ( not ( = ?auto_40467 ?auto_40472 ) ) ( not ( = ?auto_40468 ?auto_40472 ) ) ( not ( = ?auto_40469 ?auto_40472 ) ) ( ON-TABLE ?auto_40471 ) ( ON ?auto_40472 ?auto_40471 ) ( not ( = ?auto_40471 ?auto_40472 ) ) ( not ( = ?auto_40471 ?auto_40469 ) ) ( not ( = ?auto_40471 ?auto_40468 ) ) ( not ( = ?auto_40466 ?auto_40471 ) ) ( not ( = ?auto_40467 ?auto_40471 ) ) ( ON ?auto_40466 ?auto_40470 ) ( not ( = ?auto_40466 ?auto_40470 ) ) ( not ( = ?auto_40467 ?auto_40470 ) ) ( not ( = ?auto_40468 ?auto_40470 ) ) ( not ( = ?auto_40469 ?auto_40470 ) ) ( not ( = ?auto_40472 ?auto_40470 ) ) ( not ( = ?auto_40471 ?auto_40470 ) ) ( ON ?auto_40467 ?auto_40466 ) ( ON-TABLE ?auto_40470 ) ( ON ?auto_40468 ?auto_40467 ) ( CLEAR ?auto_40472 ) ( ON ?auto_40469 ?auto_40468 ) ( CLEAR ?auto_40469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40470 ?auto_40466 ?auto_40467 ?auto_40468 )
      ( MAKE-4PILE ?auto_40466 ?auto_40467 ?auto_40468 ?auto_40469 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40473 - BLOCK
      ?auto_40474 - BLOCK
      ?auto_40475 - BLOCK
      ?auto_40476 - BLOCK
    )
    :vars
    (
      ?auto_40477 - BLOCK
      ?auto_40478 - BLOCK
      ?auto_40479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40473 ?auto_40474 ) ) ( not ( = ?auto_40473 ?auto_40475 ) ) ( not ( = ?auto_40473 ?auto_40476 ) ) ( not ( = ?auto_40474 ?auto_40475 ) ) ( not ( = ?auto_40474 ?auto_40476 ) ) ( not ( = ?auto_40475 ?auto_40476 ) ) ( not ( = ?auto_40473 ?auto_40477 ) ) ( not ( = ?auto_40474 ?auto_40477 ) ) ( not ( = ?auto_40475 ?auto_40477 ) ) ( not ( = ?auto_40476 ?auto_40477 ) ) ( ON-TABLE ?auto_40478 ) ( not ( = ?auto_40478 ?auto_40477 ) ) ( not ( = ?auto_40478 ?auto_40476 ) ) ( not ( = ?auto_40478 ?auto_40475 ) ) ( not ( = ?auto_40473 ?auto_40478 ) ) ( not ( = ?auto_40474 ?auto_40478 ) ) ( ON ?auto_40473 ?auto_40479 ) ( not ( = ?auto_40473 ?auto_40479 ) ) ( not ( = ?auto_40474 ?auto_40479 ) ) ( not ( = ?auto_40475 ?auto_40479 ) ) ( not ( = ?auto_40476 ?auto_40479 ) ) ( not ( = ?auto_40477 ?auto_40479 ) ) ( not ( = ?auto_40478 ?auto_40479 ) ) ( ON ?auto_40474 ?auto_40473 ) ( ON-TABLE ?auto_40479 ) ( ON ?auto_40475 ?auto_40474 ) ( ON ?auto_40476 ?auto_40475 ) ( CLEAR ?auto_40476 ) ( HOLDING ?auto_40477 ) ( CLEAR ?auto_40478 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40478 ?auto_40477 )
      ( MAKE-4PILE ?auto_40473 ?auto_40474 ?auto_40475 ?auto_40476 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40480 - BLOCK
      ?auto_40481 - BLOCK
      ?auto_40482 - BLOCK
      ?auto_40483 - BLOCK
    )
    :vars
    (
      ?auto_40484 - BLOCK
      ?auto_40486 - BLOCK
      ?auto_40485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40480 ?auto_40481 ) ) ( not ( = ?auto_40480 ?auto_40482 ) ) ( not ( = ?auto_40480 ?auto_40483 ) ) ( not ( = ?auto_40481 ?auto_40482 ) ) ( not ( = ?auto_40481 ?auto_40483 ) ) ( not ( = ?auto_40482 ?auto_40483 ) ) ( not ( = ?auto_40480 ?auto_40484 ) ) ( not ( = ?auto_40481 ?auto_40484 ) ) ( not ( = ?auto_40482 ?auto_40484 ) ) ( not ( = ?auto_40483 ?auto_40484 ) ) ( ON-TABLE ?auto_40486 ) ( not ( = ?auto_40486 ?auto_40484 ) ) ( not ( = ?auto_40486 ?auto_40483 ) ) ( not ( = ?auto_40486 ?auto_40482 ) ) ( not ( = ?auto_40480 ?auto_40486 ) ) ( not ( = ?auto_40481 ?auto_40486 ) ) ( ON ?auto_40480 ?auto_40485 ) ( not ( = ?auto_40480 ?auto_40485 ) ) ( not ( = ?auto_40481 ?auto_40485 ) ) ( not ( = ?auto_40482 ?auto_40485 ) ) ( not ( = ?auto_40483 ?auto_40485 ) ) ( not ( = ?auto_40484 ?auto_40485 ) ) ( not ( = ?auto_40486 ?auto_40485 ) ) ( ON ?auto_40481 ?auto_40480 ) ( ON-TABLE ?auto_40485 ) ( ON ?auto_40482 ?auto_40481 ) ( ON ?auto_40483 ?auto_40482 ) ( CLEAR ?auto_40486 ) ( ON ?auto_40484 ?auto_40483 ) ( CLEAR ?auto_40484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40485 ?auto_40480 ?auto_40481 ?auto_40482 ?auto_40483 )
      ( MAKE-4PILE ?auto_40480 ?auto_40481 ?auto_40482 ?auto_40483 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40487 - BLOCK
      ?auto_40488 - BLOCK
      ?auto_40489 - BLOCK
      ?auto_40490 - BLOCK
    )
    :vars
    (
      ?auto_40492 - BLOCK
      ?auto_40493 - BLOCK
      ?auto_40491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40487 ?auto_40488 ) ) ( not ( = ?auto_40487 ?auto_40489 ) ) ( not ( = ?auto_40487 ?auto_40490 ) ) ( not ( = ?auto_40488 ?auto_40489 ) ) ( not ( = ?auto_40488 ?auto_40490 ) ) ( not ( = ?auto_40489 ?auto_40490 ) ) ( not ( = ?auto_40487 ?auto_40492 ) ) ( not ( = ?auto_40488 ?auto_40492 ) ) ( not ( = ?auto_40489 ?auto_40492 ) ) ( not ( = ?auto_40490 ?auto_40492 ) ) ( not ( = ?auto_40493 ?auto_40492 ) ) ( not ( = ?auto_40493 ?auto_40490 ) ) ( not ( = ?auto_40493 ?auto_40489 ) ) ( not ( = ?auto_40487 ?auto_40493 ) ) ( not ( = ?auto_40488 ?auto_40493 ) ) ( ON ?auto_40487 ?auto_40491 ) ( not ( = ?auto_40487 ?auto_40491 ) ) ( not ( = ?auto_40488 ?auto_40491 ) ) ( not ( = ?auto_40489 ?auto_40491 ) ) ( not ( = ?auto_40490 ?auto_40491 ) ) ( not ( = ?auto_40492 ?auto_40491 ) ) ( not ( = ?auto_40493 ?auto_40491 ) ) ( ON ?auto_40488 ?auto_40487 ) ( ON-TABLE ?auto_40491 ) ( ON ?auto_40489 ?auto_40488 ) ( ON ?auto_40490 ?auto_40489 ) ( ON ?auto_40492 ?auto_40490 ) ( CLEAR ?auto_40492 ) ( HOLDING ?auto_40493 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40493 )
      ( MAKE-4PILE ?auto_40487 ?auto_40488 ?auto_40489 ?auto_40490 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_40494 - BLOCK
      ?auto_40495 - BLOCK
      ?auto_40496 - BLOCK
      ?auto_40497 - BLOCK
    )
    :vars
    (
      ?auto_40498 - BLOCK
      ?auto_40500 - BLOCK
      ?auto_40499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40494 ?auto_40495 ) ) ( not ( = ?auto_40494 ?auto_40496 ) ) ( not ( = ?auto_40494 ?auto_40497 ) ) ( not ( = ?auto_40495 ?auto_40496 ) ) ( not ( = ?auto_40495 ?auto_40497 ) ) ( not ( = ?auto_40496 ?auto_40497 ) ) ( not ( = ?auto_40494 ?auto_40498 ) ) ( not ( = ?auto_40495 ?auto_40498 ) ) ( not ( = ?auto_40496 ?auto_40498 ) ) ( not ( = ?auto_40497 ?auto_40498 ) ) ( not ( = ?auto_40500 ?auto_40498 ) ) ( not ( = ?auto_40500 ?auto_40497 ) ) ( not ( = ?auto_40500 ?auto_40496 ) ) ( not ( = ?auto_40494 ?auto_40500 ) ) ( not ( = ?auto_40495 ?auto_40500 ) ) ( ON ?auto_40494 ?auto_40499 ) ( not ( = ?auto_40494 ?auto_40499 ) ) ( not ( = ?auto_40495 ?auto_40499 ) ) ( not ( = ?auto_40496 ?auto_40499 ) ) ( not ( = ?auto_40497 ?auto_40499 ) ) ( not ( = ?auto_40498 ?auto_40499 ) ) ( not ( = ?auto_40500 ?auto_40499 ) ) ( ON ?auto_40495 ?auto_40494 ) ( ON-TABLE ?auto_40499 ) ( ON ?auto_40496 ?auto_40495 ) ( ON ?auto_40497 ?auto_40496 ) ( ON ?auto_40498 ?auto_40497 ) ( ON ?auto_40500 ?auto_40498 ) ( CLEAR ?auto_40500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40499 ?auto_40494 ?auto_40495 ?auto_40496 ?auto_40497 ?auto_40498 )
      ( MAKE-4PILE ?auto_40494 ?auto_40495 ?auto_40496 ?auto_40497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40512 - BLOCK
    )
    :vars
    (
      ?auto_40514 - BLOCK
      ?auto_40513 - BLOCK
      ?auto_40515 - BLOCK
      ?auto_40516 - BLOCK
      ?auto_40517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40514 ?auto_40512 ) ( ON-TABLE ?auto_40512 ) ( not ( = ?auto_40512 ?auto_40514 ) ) ( not ( = ?auto_40512 ?auto_40513 ) ) ( not ( = ?auto_40512 ?auto_40515 ) ) ( not ( = ?auto_40514 ?auto_40513 ) ) ( not ( = ?auto_40514 ?auto_40515 ) ) ( not ( = ?auto_40513 ?auto_40515 ) ) ( ON ?auto_40513 ?auto_40514 ) ( CLEAR ?auto_40513 ) ( HOLDING ?auto_40515 ) ( CLEAR ?auto_40516 ) ( ON-TABLE ?auto_40517 ) ( ON ?auto_40516 ?auto_40517 ) ( not ( = ?auto_40517 ?auto_40516 ) ) ( not ( = ?auto_40517 ?auto_40515 ) ) ( not ( = ?auto_40516 ?auto_40515 ) ) ( not ( = ?auto_40512 ?auto_40516 ) ) ( not ( = ?auto_40512 ?auto_40517 ) ) ( not ( = ?auto_40514 ?auto_40516 ) ) ( not ( = ?auto_40514 ?auto_40517 ) ) ( not ( = ?auto_40513 ?auto_40516 ) ) ( not ( = ?auto_40513 ?auto_40517 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40517 ?auto_40516 ?auto_40515 )
      ( MAKE-1PILE ?auto_40512 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40518 - BLOCK
    )
    :vars
    (
      ?auto_40520 - BLOCK
      ?auto_40519 - BLOCK
      ?auto_40521 - BLOCK
      ?auto_40522 - BLOCK
      ?auto_40523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40520 ?auto_40518 ) ( ON-TABLE ?auto_40518 ) ( not ( = ?auto_40518 ?auto_40520 ) ) ( not ( = ?auto_40518 ?auto_40519 ) ) ( not ( = ?auto_40518 ?auto_40521 ) ) ( not ( = ?auto_40520 ?auto_40519 ) ) ( not ( = ?auto_40520 ?auto_40521 ) ) ( not ( = ?auto_40519 ?auto_40521 ) ) ( ON ?auto_40519 ?auto_40520 ) ( CLEAR ?auto_40522 ) ( ON-TABLE ?auto_40523 ) ( ON ?auto_40522 ?auto_40523 ) ( not ( = ?auto_40523 ?auto_40522 ) ) ( not ( = ?auto_40523 ?auto_40521 ) ) ( not ( = ?auto_40522 ?auto_40521 ) ) ( not ( = ?auto_40518 ?auto_40522 ) ) ( not ( = ?auto_40518 ?auto_40523 ) ) ( not ( = ?auto_40520 ?auto_40522 ) ) ( not ( = ?auto_40520 ?auto_40523 ) ) ( not ( = ?auto_40519 ?auto_40522 ) ) ( not ( = ?auto_40519 ?auto_40523 ) ) ( ON ?auto_40521 ?auto_40519 ) ( CLEAR ?auto_40521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40518 ?auto_40520 ?auto_40519 )
      ( MAKE-1PILE ?auto_40518 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40524 - BLOCK
    )
    :vars
    (
      ?auto_40525 - BLOCK
      ?auto_40526 - BLOCK
      ?auto_40528 - BLOCK
      ?auto_40529 - BLOCK
      ?auto_40527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40525 ?auto_40524 ) ( ON-TABLE ?auto_40524 ) ( not ( = ?auto_40524 ?auto_40525 ) ) ( not ( = ?auto_40524 ?auto_40526 ) ) ( not ( = ?auto_40524 ?auto_40528 ) ) ( not ( = ?auto_40525 ?auto_40526 ) ) ( not ( = ?auto_40525 ?auto_40528 ) ) ( not ( = ?auto_40526 ?auto_40528 ) ) ( ON ?auto_40526 ?auto_40525 ) ( ON-TABLE ?auto_40529 ) ( not ( = ?auto_40529 ?auto_40527 ) ) ( not ( = ?auto_40529 ?auto_40528 ) ) ( not ( = ?auto_40527 ?auto_40528 ) ) ( not ( = ?auto_40524 ?auto_40527 ) ) ( not ( = ?auto_40524 ?auto_40529 ) ) ( not ( = ?auto_40525 ?auto_40527 ) ) ( not ( = ?auto_40525 ?auto_40529 ) ) ( not ( = ?auto_40526 ?auto_40527 ) ) ( not ( = ?auto_40526 ?auto_40529 ) ) ( ON ?auto_40528 ?auto_40526 ) ( CLEAR ?auto_40528 ) ( HOLDING ?auto_40527 ) ( CLEAR ?auto_40529 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40529 ?auto_40527 )
      ( MAKE-1PILE ?auto_40524 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40530 - BLOCK
    )
    :vars
    (
      ?auto_40533 - BLOCK
      ?auto_40535 - BLOCK
      ?auto_40531 - BLOCK
      ?auto_40534 - BLOCK
      ?auto_40532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40533 ?auto_40530 ) ( ON-TABLE ?auto_40530 ) ( not ( = ?auto_40530 ?auto_40533 ) ) ( not ( = ?auto_40530 ?auto_40535 ) ) ( not ( = ?auto_40530 ?auto_40531 ) ) ( not ( = ?auto_40533 ?auto_40535 ) ) ( not ( = ?auto_40533 ?auto_40531 ) ) ( not ( = ?auto_40535 ?auto_40531 ) ) ( ON ?auto_40535 ?auto_40533 ) ( ON-TABLE ?auto_40534 ) ( not ( = ?auto_40534 ?auto_40532 ) ) ( not ( = ?auto_40534 ?auto_40531 ) ) ( not ( = ?auto_40532 ?auto_40531 ) ) ( not ( = ?auto_40530 ?auto_40532 ) ) ( not ( = ?auto_40530 ?auto_40534 ) ) ( not ( = ?auto_40533 ?auto_40532 ) ) ( not ( = ?auto_40533 ?auto_40534 ) ) ( not ( = ?auto_40535 ?auto_40532 ) ) ( not ( = ?auto_40535 ?auto_40534 ) ) ( ON ?auto_40531 ?auto_40535 ) ( CLEAR ?auto_40534 ) ( ON ?auto_40532 ?auto_40531 ) ( CLEAR ?auto_40532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40530 ?auto_40533 ?auto_40535 ?auto_40531 )
      ( MAKE-1PILE ?auto_40530 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40536 - BLOCK
    )
    :vars
    (
      ?auto_40539 - BLOCK
      ?auto_40538 - BLOCK
      ?auto_40540 - BLOCK
      ?auto_40541 - BLOCK
      ?auto_40537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40539 ?auto_40536 ) ( ON-TABLE ?auto_40536 ) ( not ( = ?auto_40536 ?auto_40539 ) ) ( not ( = ?auto_40536 ?auto_40538 ) ) ( not ( = ?auto_40536 ?auto_40540 ) ) ( not ( = ?auto_40539 ?auto_40538 ) ) ( not ( = ?auto_40539 ?auto_40540 ) ) ( not ( = ?auto_40538 ?auto_40540 ) ) ( ON ?auto_40538 ?auto_40539 ) ( not ( = ?auto_40541 ?auto_40537 ) ) ( not ( = ?auto_40541 ?auto_40540 ) ) ( not ( = ?auto_40537 ?auto_40540 ) ) ( not ( = ?auto_40536 ?auto_40537 ) ) ( not ( = ?auto_40536 ?auto_40541 ) ) ( not ( = ?auto_40539 ?auto_40537 ) ) ( not ( = ?auto_40539 ?auto_40541 ) ) ( not ( = ?auto_40538 ?auto_40537 ) ) ( not ( = ?auto_40538 ?auto_40541 ) ) ( ON ?auto_40540 ?auto_40538 ) ( ON ?auto_40537 ?auto_40540 ) ( CLEAR ?auto_40537 ) ( HOLDING ?auto_40541 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40541 )
      ( MAKE-1PILE ?auto_40536 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40549 - BLOCK
    )
    :vars
    (
      ?auto_40554 - BLOCK
      ?auto_40553 - BLOCK
      ?auto_40550 - BLOCK
      ?auto_40551 - BLOCK
      ?auto_40552 - BLOCK
      ?auto_40555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40554 ?auto_40549 ) ( ON-TABLE ?auto_40549 ) ( not ( = ?auto_40549 ?auto_40554 ) ) ( not ( = ?auto_40549 ?auto_40553 ) ) ( not ( = ?auto_40549 ?auto_40550 ) ) ( not ( = ?auto_40554 ?auto_40553 ) ) ( not ( = ?auto_40554 ?auto_40550 ) ) ( not ( = ?auto_40553 ?auto_40550 ) ) ( ON ?auto_40553 ?auto_40554 ) ( not ( = ?auto_40551 ?auto_40552 ) ) ( not ( = ?auto_40551 ?auto_40550 ) ) ( not ( = ?auto_40552 ?auto_40550 ) ) ( not ( = ?auto_40549 ?auto_40552 ) ) ( not ( = ?auto_40549 ?auto_40551 ) ) ( not ( = ?auto_40554 ?auto_40552 ) ) ( not ( = ?auto_40554 ?auto_40551 ) ) ( not ( = ?auto_40553 ?auto_40552 ) ) ( not ( = ?auto_40553 ?auto_40551 ) ) ( ON ?auto_40550 ?auto_40553 ) ( ON ?auto_40552 ?auto_40550 ) ( CLEAR ?auto_40552 ) ( ON ?auto_40551 ?auto_40555 ) ( CLEAR ?auto_40551 ) ( HAND-EMPTY ) ( not ( = ?auto_40549 ?auto_40555 ) ) ( not ( = ?auto_40554 ?auto_40555 ) ) ( not ( = ?auto_40553 ?auto_40555 ) ) ( not ( = ?auto_40550 ?auto_40555 ) ) ( not ( = ?auto_40551 ?auto_40555 ) ) ( not ( = ?auto_40552 ?auto_40555 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40551 ?auto_40555 )
      ( MAKE-1PILE ?auto_40549 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40556 - BLOCK
    )
    :vars
    (
      ?auto_40560 - BLOCK
      ?auto_40562 - BLOCK
      ?auto_40558 - BLOCK
      ?auto_40561 - BLOCK
      ?auto_40559 - BLOCK
      ?auto_40557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40560 ?auto_40556 ) ( ON-TABLE ?auto_40556 ) ( not ( = ?auto_40556 ?auto_40560 ) ) ( not ( = ?auto_40556 ?auto_40562 ) ) ( not ( = ?auto_40556 ?auto_40558 ) ) ( not ( = ?auto_40560 ?auto_40562 ) ) ( not ( = ?auto_40560 ?auto_40558 ) ) ( not ( = ?auto_40562 ?auto_40558 ) ) ( ON ?auto_40562 ?auto_40560 ) ( not ( = ?auto_40561 ?auto_40559 ) ) ( not ( = ?auto_40561 ?auto_40558 ) ) ( not ( = ?auto_40559 ?auto_40558 ) ) ( not ( = ?auto_40556 ?auto_40559 ) ) ( not ( = ?auto_40556 ?auto_40561 ) ) ( not ( = ?auto_40560 ?auto_40559 ) ) ( not ( = ?auto_40560 ?auto_40561 ) ) ( not ( = ?auto_40562 ?auto_40559 ) ) ( not ( = ?auto_40562 ?auto_40561 ) ) ( ON ?auto_40558 ?auto_40562 ) ( ON ?auto_40561 ?auto_40557 ) ( CLEAR ?auto_40561 ) ( not ( = ?auto_40556 ?auto_40557 ) ) ( not ( = ?auto_40560 ?auto_40557 ) ) ( not ( = ?auto_40562 ?auto_40557 ) ) ( not ( = ?auto_40558 ?auto_40557 ) ) ( not ( = ?auto_40561 ?auto_40557 ) ) ( not ( = ?auto_40559 ?auto_40557 ) ) ( HOLDING ?auto_40559 ) ( CLEAR ?auto_40558 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40556 ?auto_40560 ?auto_40562 ?auto_40558 ?auto_40559 )
      ( MAKE-1PILE ?auto_40556 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_40563 - BLOCK
    )
    :vars
    (
      ?auto_40566 - BLOCK
      ?auto_40565 - BLOCK
      ?auto_40568 - BLOCK
      ?auto_40569 - BLOCK
      ?auto_40564 - BLOCK
      ?auto_40567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_40566 ?auto_40563 ) ( ON-TABLE ?auto_40563 ) ( not ( = ?auto_40563 ?auto_40566 ) ) ( not ( = ?auto_40563 ?auto_40565 ) ) ( not ( = ?auto_40563 ?auto_40568 ) ) ( not ( = ?auto_40566 ?auto_40565 ) ) ( not ( = ?auto_40566 ?auto_40568 ) ) ( not ( = ?auto_40565 ?auto_40568 ) ) ( ON ?auto_40565 ?auto_40566 ) ( not ( = ?auto_40569 ?auto_40564 ) ) ( not ( = ?auto_40569 ?auto_40568 ) ) ( not ( = ?auto_40564 ?auto_40568 ) ) ( not ( = ?auto_40563 ?auto_40564 ) ) ( not ( = ?auto_40563 ?auto_40569 ) ) ( not ( = ?auto_40566 ?auto_40564 ) ) ( not ( = ?auto_40566 ?auto_40569 ) ) ( not ( = ?auto_40565 ?auto_40564 ) ) ( not ( = ?auto_40565 ?auto_40569 ) ) ( ON ?auto_40568 ?auto_40565 ) ( ON ?auto_40569 ?auto_40567 ) ( not ( = ?auto_40563 ?auto_40567 ) ) ( not ( = ?auto_40566 ?auto_40567 ) ) ( not ( = ?auto_40565 ?auto_40567 ) ) ( not ( = ?auto_40568 ?auto_40567 ) ) ( not ( = ?auto_40569 ?auto_40567 ) ) ( not ( = ?auto_40564 ?auto_40567 ) ) ( CLEAR ?auto_40568 ) ( ON ?auto_40564 ?auto_40569 ) ( CLEAR ?auto_40564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40567 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40567 ?auto_40569 )
      ( MAKE-1PILE ?auto_40563 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40603 - BLOCK
      ?auto_40604 - BLOCK
      ?auto_40605 - BLOCK
      ?auto_40606 - BLOCK
      ?auto_40607 - BLOCK
    )
    :vars
    (
      ?auto_40608 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40603 ) ( ON ?auto_40604 ?auto_40603 ) ( ON ?auto_40605 ?auto_40604 ) ( not ( = ?auto_40603 ?auto_40604 ) ) ( not ( = ?auto_40603 ?auto_40605 ) ) ( not ( = ?auto_40603 ?auto_40606 ) ) ( not ( = ?auto_40603 ?auto_40607 ) ) ( not ( = ?auto_40604 ?auto_40605 ) ) ( not ( = ?auto_40604 ?auto_40606 ) ) ( not ( = ?auto_40604 ?auto_40607 ) ) ( not ( = ?auto_40605 ?auto_40606 ) ) ( not ( = ?auto_40605 ?auto_40607 ) ) ( not ( = ?auto_40606 ?auto_40607 ) ) ( ON ?auto_40607 ?auto_40608 ) ( not ( = ?auto_40603 ?auto_40608 ) ) ( not ( = ?auto_40604 ?auto_40608 ) ) ( not ( = ?auto_40605 ?auto_40608 ) ) ( not ( = ?auto_40606 ?auto_40608 ) ) ( not ( = ?auto_40607 ?auto_40608 ) ) ( CLEAR ?auto_40605 ) ( ON ?auto_40606 ?auto_40607 ) ( CLEAR ?auto_40606 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40608 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40608 ?auto_40607 )
      ( MAKE-5PILE ?auto_40603 ?auto_40604 ?auto_40605 ?auto_40606 ?auto_40607 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40609 - BLOCK
      ?auto_40610 - BLOCK
      ?auto_40611 - BLOCK
      ?auto_40612 - BLOCK
      ?auto_40613 - BLOCK
    )
    :vars
    (
      ?auto_40614 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40609 ) ( ON ?auto_40610 ?auto_40609 ) ( not ( = ?auto_40609 ?auto_40610 ) ) ( not ( = ?auto_40609 ?auto_40611 ) ) ( not ( = ?auto_40609 ?auto_40612 ) ) ( not ( = ?auto_40609 ?auto_40613 ) ) ( not ( = ?auto_40610 ?auto_40611 ) ) ( not ( = ?auto_40610 ?auto_40612 ) ) ( not ( = ?auto_40610 ?auto_40613 ) ) ( not ( = ?auto_40611 ?auto_40612 ) ) ( not ( = ?auto_40611 ?auto_40613 ) ) ( not ( = ?auto_40612 ?auto_40613 ) ) ( ON ?auto_40613 ?auto_40614 ) ( not ( = ?auto_40609 ?auto_40614 ) ) ( not ( = ?auto_40610 ?auto_40614 ) ) ( not ( = ?auto_40611 ?auto_40614 ) ) ( not ( = ?auto_40612 ?auto_40614 ) ) ( not ( = ?auto_40613 ?auto_40614 ) ) ( ON ?auto_40612 ?auto_40613 ) ( CLEAR ?auto_40612 ) ( ON-TABLE ?auto_40614 ) ( HOLDING ?auto_40611 ) ( CLEAR ?auto_40610 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40609 ?auto_40610 ?auto_40611 )
      ( MAKE-5PILE ?auto_40609 ?auto_40610 ?auto_40611 ?auto_40612 ?auto_40613 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40615 - BLOCK
      ?auto_40616 - BLOCK
      ?auto_40617 - BLOCK
      ?auto_40618 - BLOCK
      ?auto_40619 - BLOCK
    )
    :vars
    (
      ?auto_40620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40615 ) ( ON ?auto_40616 ?auto_40615 ) ( not ( = ?auto_40615 ?auto_40616 ) ) ( not ( = ?auto_40615 ?auto_40617 ) ) ( not ( = ?auto_40615 ?auto_40618 ) ) ( not ( = ?auto_40615 ?auto_40619 ) ) ( not ( = ?auto_40616 ?auto_40617 ) ) ( not ( = ?auto_40616 ?auto_40618 ) ) ( not ( = ?auto_40616 ?auto_40619 ) ) ( not ( = ?auto_40617 ?auto_40618 ) ) ( not ( = ?auto_40617 ?auto_40619 ) ) ( not ( = ?auto_40618 ?auto_40619 ) ) ( ON ?auto_40619 ?auto_40620 ) ( not ( = ?auto_40615 ?auto_40620 ) ) ( not ( = ?auto_40616 ?auto_40620 ) ) ( not ( = ?auto_40617 ?auto_40620 ) ) ( not ( = ?auto_40618 ?auto_40620 ) ) ( not ( = ?auto_40619 ?auto_40620 ) ) ( ON ?auto_40618 ?auto_40619 ) ( ON-TABLE ?auto_40620 ) ( CLEAR ?auto_40616 ) ( ON ?auto_40617 ?auto_40618 ) ( CLEAR ?auto_40617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40620 ?auto_40619 ?auto_40618 )
      ( MAKE-5PILE ?auto_40615 ?auto_40616 ?auto_40617 ?auto_40618 ?auto_40619 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40621 - BLOCK
      ?auto_40622 - BLOCK
      ?auto_40623 - BLOCK
      ?auto_40624 - BLOCK
      ?auto_40625 - BLOCK
    )
    :vars
    (
      ?auto_40626 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40621 ) ( not ( = ?auto_40621 ?auto_40622 ) ) ( not ( = ?auto_40621 ?auto_40623 ) ) ( not ( = ?auto_40621 ?auto_40624 ) ) ( not ( = ?auto_40621 ?auto_40625 ) ) ( not ( = ?auto_40622 ?auto_40623 ) ) ( not ( = ?auto_40622 ?auto_40624 ) ) ( not ( = ?auto_40622 ?auto_40625 ) ) ( not ( = ?auto_40623 ?auto_40624 ) ) ( not ( = ?auto_40623 ?auto_40625 ) ) ( not ( = ?auto_40624 ?auto_40625 ) ) ( ON ?auto_40625 ?auto_40626 ) ( not ( = ?auto_40621 ?auto_40626 ) ) ( not ( = ?auto_40622 ?auto_40626 ) ) ( not ( = ?auto_40623 ?auto_40626 ) ) ( not ( = ?auto_40624 ?auto_40626 ) ) ( not ( = ?auto_40625 ?auto_40626 ) ) ( ON ?auto_40624 ?auto_40625 ) ( ON-TABLE ?auto_40626 ) ( ON ?auto_40623 ?auto_40624 ) ( CLEAR ?auto_40623 ) ( HOLDING ?auto_40622 ) ( CLEAR ?auto_40621 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40621 ?auto_40622 )
      ( MAKE-5PILE ?auto_40621 ?auto_40622 ?auto_40623 ?auto_40624 ?auto_40625 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40627 - BLOCK
      ?auto_40628 - BLOCK
      ?auto_40629 - BLOCK
      ?auto_40630 - BLOCK
      ?auto_40631 - BLOCK
    )
    :vars
    (
      ?auto_40632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40627 ) ( not ( = ?auto_40627 ?auto_40628 ) ) ( not ( = ?auto_40627 ?auto_40629 ) ) ( not ( = ?auto_40627 ?auto_40630 ) ) ( not ( = ?auto_40627 ?auto_40631 ) ) ( not ( = ?auto_40628 ?auto_40629 ) ) ( not ( = ?auto_40628 ?auto_40630 ) ) ( not ( = ?auto_40628 ?auto_40631 ) ) ( not ( = ?auto_40629 ?auto_40630 ) ) ( not ( = ?auto_40629 ?auto_40631 ) ) ( not ( = ?auto_40630 ?auto_40631 ) ) ( ON ?auto_40631 ?auto_40632 ) ( not ( = ?auto_40627 ?auto_40632 ) ) ( not ( = ?auto_40628 ?auto_40632 ) ) ( not ( = ?auto_40629 ?auto_40632 ) ) ( not ( = ?auto_40630 ?auto_40632 ) ) ( not ( = ?auto_40631 ?auto_40632 ) ) ( ON ?auto_40630 ?auto_40631 ) ( ON-TABLE ?auto_40632 ) ( ON ?auto_40629 ?auto_40630 ) ( CLEAR ?auto_40627 ) ( ON ?auto_40628 ?auto_40629 ) ( CLEAR ?auto_40628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40632 ?auto_40631 ?auto_40630 ?auto_40629 )
      ( MAKE-5PILE ?auto_40627 ?auto_40628 ?auto_40629 ?auto_40630 ?auto_40631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40633 - BLOCK
      ?auto_40634 - BLOCK
      ?auto_40635 - BLOCK
      ?auto_40636 - BLOCK
      ?auto_40637 - BLOCK
    )
    :vars
    (
      ?auto_40638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40633 ?auto_40634 ) ) ( not ( = ?auto_40633 ?auto_40635 ) ) ( not ( = ?auto_40633 ?auto_40636 ) ) ( not ( = ?auto_40633 ?auto_40637 ) ) ( not ( = ?auto_40634 ?auto_40635 ) ) ( not ( = ?auto_40634 ?auto_40636 ) ) ( not ( = ?auto_40634 ?auto_40637 ) ) ( not ( = ?auto_40635 ?auto_40636 ) ) ( not ( = ?auto_40635 ?auto_40637 ) ) ( not ( = ?auto_40636 ?auto_40637 ) ) ( ON ?auto_40637 ?auto_40638 ) ( not ( = ?auto_40633 ?auto_40638 ) ) ( not ( = ?auto_40634 ?auto_40638 ) ) ( not ( = ?auto_40635 ?auto_40638 ) ) ( not ( = ?auto_40636 ?auto_40638 ) ) ( not ( = ?auto_40637 ?auto_40638 ) ) ( ON ?auto_40636 ?auto_40637 ) ( ON-TABLE ?auto_40638 ) ( ON ?auto_40635 ?auto_40636 ) ( ON ?auto_40634 ?auto_40635 ) ( CLEAR ?auto_40634 ) ( HOLDING ?auto_40633 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40633 )
      ( MAKE-5PILE ?auto_40633 ?auto_40634 ?auto_40635 ?auto_40636 ?auto_40637 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40639 - BLOCK
      ?auto_40640 - BLOCK
      ?auto_40641 - BLOCK
      ?auto_40642 - BLOCK
      ?auto_40643 - BLOCK
    )
    :vars
    (
      ?auto_40644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40639 ?auto_40640 ) ) ( not ( = ?auto_40639 ?auto_40641 ) ) ( not ( = ?auto_40639 ?auto_40642 ) ) ( not ( = ?auto_40639 ?auto_40643 ) ) ( not ( = ?auto_40640 ?auto_40641 ) ) ( not ( = ?auto_40640 ?auto_40642 ) ) ( not ( = ?auto_40640 ?auto_40643 ) ) ( not ( = ?auto_40641 ?auto_40642 ) ) ( not ( = ?auto_40641 ?auto_40643 ) ) ( not ( = ?auto_40642 ?auto_40643 ) ) ( ON ?auto_40643 ?auto_40644 ) ( not ( = ?auto_40639 ?auto_40644 ) ) ( not ( = ?auto_40640 ?auto_40644 ) ) ( not ( = ?auto_40641 ?auto_40644 ) ) ( not ( = ?auto_40642 ?auto_40644 ) ) ( not ( = ?auto_40643 ?auto_40644 ) ) ( ON ?auto_40642 ?auto_40643 ) ( ON-TABLE ?auto_40644 ) ( ON ?auto_40641 ?auto_40642 ) ( ON ?auto_40640 ?auto_40641 ) ( ON ?auto_40639 ?auto_40640 ) ( CLEAR ?auto_40639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40644 ?auto_40643 ?auto_40642 ?auto_40641 ?auto_40640 )
      ( MAKE-5PILE ?auto_40639 ?auto_40640 ?auto_40641 ?auto_40642 ?auto_40643 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40650 - BLOCK
      ?auto_40651 - BLOCK
      ?auto_40652 - BLOCK
      ?auto_40653 - BLOCK
      ?auto_40654 - BLOCK
    )
    :vars
    (
      ?auto_40655 - BLOCK
      ?auto_40656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40650 ?auto_40651 ) ) ( not ( = ?auto_40650 ?auto_40652 ) ) ( not ( = ?auto_40650 ?auto_40653 ) ) ( not ( = ?auto_40650 ?auto_40654 ) ) ( not ( = ?auto_40651 ?auto_40652 ) ) ( not ( = ?auto_40651 ?auto_40653 ) ) ( not ( = ?auto_40651 ?auto_40654 ) ) ( not ( = ?auto_40652 ?auto_40653 ) ) ( not ( = ?auto_40652 ?auto_40654 ) ) ( not ( = ?auto_40653 ?auto_40654 ) ) ( ON ?auto_40654 ?auto_40655 ) ( not ( = ?auto_40650 ?auto_40655 ) ) ( not ( = ?auto_40651 ?auto_40655 ) ) ( not ( = ?auto_40652 ?auto_40655 ) ) ( not ( = ?auto_40653 ?auto_40655 ) ) ( not ( = ?auto_40654 ?auto_40655 ) ) ( ON ?auto_40653 ?auto_40654 ) ( ON-TABLE ?auto_40655 ) ( ON ?auto_40652 ?auto_40653 ) ( ON ?auto_40651 ?auto_40652 ) ( CLEAR ?auto_40651 ) ( ON ?auto_40650 ?auto_40656 ) ( CLEAR ?auto_40650 ) ( HAND-EMPTY ) ( not ( = ?auto_40650 ?auto_40656 ) ) ( not ( = ?auto_40651 ?auto_40656 ) ) ( not ( = ?auto_40652 ?auto_40656 ) ) ( not ( = ?auto_40653 ?auto_40656 ) ) ( not ( = ?auto_40654 ?auto_40656 ) ) ( not ( = ?auto_40655 ?auto_40656 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40650 ?auto_40656 )
      ( MAKE-5PILE ?auto_40650 ?auto_40651 ?auto_40652 ?auto_40653 ?auto_40654 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40657 - BLOCK
      ?auto_40658 - BLOCK
      ?auto_40659 - BLOCK
      ?auto_40660 - BLOCK
      ?auto_40661 - BLOCK
    )
    :vars
    (
      ?auto_40663 - BLOCK
      ?auto_40662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40657 ?auto_40658 ) ) ( not ( = ?auto_40657 ?auto_40659 ) ) ( not ( = ?auto_40657 ?auto_40660 ) ) ( not ( = ?auto_40657 ?auto_40661 ) ) ( not ( = ?auto_40658 ?auto_40659 ) ) ( not ( = ?auto_40658 ?auto_40660 ) ) ( not ( = ?auto_40658 ?auto_40661 ) ) ( not ( = ?auto_40659 ?auto_40660 ) ) ( not ( = ?auto_40659 ?auto_40661 ) ) ( not ( = ?auto_40660 ?auto_40661 ) ) ( ON ?auto_40661 ?auto_40663 ) ( not ( = ?auto_40657 ?auto_40663 ) ) ( not ( = ?auto_40658 ?auto_40663 ) ) ( not ( = ?auto_40659 ?auto_40663 ) ) ( not ( = ?auto_40660 ?auto_40663 ) ) ( not ( = ?auto_40661 ?auto_40663 ) ) ( ON ?auto_40660 ?auto_40661 ) ( ON-TABLE ?auto_40663 ) ( ON ?auto_40659 ?auto_40660 ) ( ON ?auto_40657 ?auto_40662 ) ( CLEAR ?auto_40657 ) ( not ( = ?auto_40657 ?auto_40662 ) ) ( not ( = ?auto_40658 ?auto_40662 ) ) ( not ( = ?auto_40659 ?auto_40662 ) ) ( not ( = ?auto_40660 ?auto_40662 ) ) ( not ( = ?auto_40661 ?auto_40662 ) ) ( not ( = ?auto_40663 ?auto_40662 ) ) ( HOLDING ?auto_40658 ) ( CLEAR ?auto_40659 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40663 ?auto_40661 ?auto_40660 ?auto_40659 ?auto_40658 )
      ( MAKE-5PILE ?auto_40657 ?auto_40658 ?auto_40659 ?auto_40660 ?auto_40661 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40664 - BLOCK
      ?auto_40665 - BLOCK
      ?auto_40666 - BLOCK
      ?auto_40667 - BLOCK
      ?auto_40668 - BLOCK
    )
    :vars
    (
      ?auto_40669 - BLOCK
      ?auto_40670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40664 ?auto_40665 ) ) ( not ( = ?auto_40664 ?auto_40666 ) ) ( not ( = ?auto_40664 ?auto_40667 ) ) ( not ( = ?auto_40664 ?auto_40668 ) ) ( not ( = ?auto_40665 ?auto_40666 ) ) ( not ( = ?auto_40665 ?auto_40667 ) ) ( not ( = ?auto_40665 ?auto_40668 ) ) ( not ( = ?auto_40666 ?auto_40667 ) ) ( not ( = ?auto_40666 ?auto_40668 ) ) ( not ( = ?auto_40667 ?auto_40668 ) ) ( ON ?auto_40668 ?auto_40669 ) ( not ( = ?auto_40664 ?auto_40669 ) ) ( not ( = ?auto_40665 ?auto_40669 ) ) ( not ( = ?auto_40666 ?auto_40669 ) ) ( not ( = ?auto_40667 ?auto_40669 ) ) ( not ( = ?auto_40668 ?auto_40669 ) ) ( ON ?auto_40667 ?auto_40668 ) ( ON-TABLE ?auto_40669 ) ( ON ?auto_40666 ?auto_40667 ) ( ON ?auto_40664 ?auto_40670 ) ( not ( = ?auto_40664 ?auto_40670 ) ) ( not ( = ?auto_40665 ?auto_40670 ) ) ( not ( = ?auto_40666 ?auto_40670 ) ) ( not ( = ?auto_40667 ?auto_40670 ) ) ( not ( = ?auto_40668 ?auto_40670 ) ) ( not ( = ?auto_40669 ?auto_40670 ) ) ( CLEAR ?auto_40666 ) ( ON ?auto_40665 ?auto_40664 ) ( CLEAR ?auto_40665 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40670 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40670 ?auto_40664 )
      ( MAKE-5PILE ?auto_40664 ?auto_40665 ?auto_40666 ?auto_40667 ?auto_40668 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40671 - BLOCK
      ?auto_40672 - BLOCK
      ?auto_40673 - BLOCK
      ?auto_40674 - BLOCK
      ?auto_40675 - BLOCK
    )
    :vars
    (
      ?auto_40676 - BLOCK
      ?auto_40677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40671 ?auto_40672 ) ) ( not ( = ?auto_40671 ?auto_40673 ) ) ( not ( = ?auto_40671 ?auto_40674 ) ) ( not ( = ?auto_40671 ?auto_40675 ) ) ( not ( = ?auto_40672 ?auto_40673 ) ) ( not ( = ?auto_40672 ?auto_40674 ) ) ( not ( = ?auto_40672 ?auto_40675 ) ) ( not ( = ?auto_40673 ?auto_40674 ) ) ( not ( = ?auto_40673 ?auto_40675 ) ) ( not ( = ?auto_40674 ?auto_40675 ) ) ( ON ?auto_40675 ?auto_40676 ) ( not ( = ?auto_40671 ?auto_40676 ) ) ( not ( = ?auto_40672 ?auto_40676 ) ) ( not ( = ?auto_40673 ?auto_40676 ) ) ( not ( = ?auto_40674 ?auto_40676 ) ) ( not ( = ?auto_40675 ?auto_40676 ) ) ( ON ?auto_40674 ?auto_40675 ) ( ON-TABLE ?auto_40676 ) ( ON ?auto_40671 ?auto_40677 ) ( not ( = ?auto_40671 ?auto_40677 ) ) ( not ( = ?auto_40672 ?auto_40677 ) ) ( not ( = ?auto_40673 ?auto_40677 ) ) ( not ( = ?auto_40674 ?auto_40677 ) ) ( not ( = ?auto_40675 ?auto_40677 ) ) ( not ( = ?auto_40676 ?auto_40677 ) ) ( ON ?auto_40672 ?auto_40671 ) ( CLEAR ?auto_40672 ) ( ON-TABLE ?auto_40677 ) ( HOLDING ?auto_40673 ) ( CLEAR ?auto_40674 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40676 ?auto_40675 ?auto_40674 ?auto_40673 )
      ( MAKE-5PILE ?auto_40671 ?auto_40672 ?auto_40673 ?auto_40674 ?auto_40675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40678 - BLOCK
      ?auto_40679 - BLOCK
      ?auto_40680 - BLOCK
      ?auto_40681 - BLOCK
      ?auto_40682 - BLOCK
    )
    :vars
    (
      ?auto_40684 - BLOCK
      ?auto_40683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40678 ?auto_40679 ) ) ( not ( = ?auto_40678 ?auto_40680 ) ) ( not ( = ?auto_40678 ?auto_40681 ) ) ( not ( = ?auto_40678 ?auto_40682 ) ) ( not ( = ?auto_40679 ?auto_40680 ) ) ( not ( = ?auto_40679 ?auto_40681 ) ) ( not ( = ?auto_40679 ?auto_40682 ) ) ( not ( = ?auto_40680 ?auto_40681 ) ) ( not ( = ?auto_40680 ?auto_40682 ) ) ( not ( = ?auto_40681 ?auto_40682 ) ) ( ON ?auto_40682 ?auto_40684 ) ( not ( = ?auto_40678 ?auto_40684 ) ) ( not ( = ?auto_40679 ?auto_40684 ) ) ( not ( = ?auto_40680 ?auto_40684 ) ) ( not ( = ?auto_40681 ?auto_40684 ) ) ( not ( = ?auto_40682 ?auto_40684 ) ) ( ON ?auto_40681 ?auto_40682 ) ( ON-TABLE ?auto_40684 ) ( ON ?auto_40678 ?auto_40683 ) ( not ( = ?auto_40678 ?auto_40683 ) ) ( not ( = ?auto_40679 ?auto_40683 ) ) ( not ( = ?auto_40680 ?auto_40683 ) ) ( not ( = ?auto_40681 ?auto_40683 ) ) ( not ( = ?auto_40682 ?auto_40683 ) ) ( not ( = ?auto_40684 ?auto_40683 ) ) ( ON ?auto_40679 ?auto_40678 ) ( ON-TABLE ?auto_40683 ) ( CLEAR ?auto_40681 ) ( ON ?auto_40680 ?auto_40679 ) ( CLEAR ?auto_40680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40683 ?auto_40678 ?auto_40679 )
      ( MAKE-5PILE ?auto_40678 ?auto_40679 ?auto_40680 ?auto_40681 ?auto_40682 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40685 - BLOCK
      ?auto_40686 - BLOCK
      ?auto_40687 - BLOCK
      ?auto_40688 - BLOCK
      ?auto_40689 - BLOCK
    )
    :vars
    (
      ?auto_40690 - BLOCK
      ?auto_40691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40685 ?auto_40686 ) ) ( not ( = ?auto_40685 ?auto_40687 ) ) ( not ( = ?auto_40685 ?auto_40688 ) ) ( not ( = ?auto_40685 ?auto_40689 ) ) ( not ( = ?auto_40686 ?auto_40687 ) ) ( not ( = ?auto_40686 ?auto_40688 ) ) ( not ( = ?auto_40686 ?auto_40689 ) ) ( not ( = ?auto_40687 ?auto_40688 ) ) ( not ( = ?auto_40687 ?auto_40689 ) ) ( not ( = ?auto_40688 ?auto_40689 ) ) ( ON ?auto_40689 ?auto_40690 ) ( not ( = ?auto_40685 ?auto_40690 ) ) ( not ( = ?auto_40686 ?auto_40690 ) ) ( not ( = ?auto_40687 ?auto_40690 ) ) ( not ( = ?auto_40688 ?auto_40690 ) ) ( not ( = ?auto_40689 ?auto_40690 ) ) ( ON-TABLE ?auto_40690 ) ( ON ?auto_40685 ?auto_40691 ) ( not ( = ?auto_40685 ?auto_40691 ) ) ( not ( = ?auto_40686 ?auto_40691 ) ) ( not ( = ?auto_40687 ?auto_40691 ) ) ( not ( = ?auto_40688 ?auto_40691 ) ) ( not ( = ?auto_40689 ?auto_40691 ) ) ( not ( = ?auto_40690 ?auto_40691 ) ) ( ON ?auto_40686 ?auto_40685 ) ( ON-TABLE ?auto_40691 ) ( ON ?auto_40687 ?auto_40686 ) ( CLEAR ?auto_40687 ) ( HOLDING ?auto_40688 ) ( CLEAR ?auto_40689 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40690 ?auto_40689 ?auto_40688 )
      ( MAKE-5PILE ?auto_40685 ?auto_40686 ?auto_40687 ?auto_40688 ?auto_40689 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40692 - BLOCK
      ?auto_40693 - BLOCK
      ?auto_40694 - BLOCK
      ?auto_40695 - BLOCK
      ?auto_40696 - BLOCK
    )
    :vars
    (
      ?auto_40697 - BLOCK
      ?auto_40698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40692 ?auto_40693 ) ) ( not ( = ?auto_40692 ?auto_40694 ) ) ( not ( = ?auto_40692 ?auto_40695 ) ) ( not ( = ?auto_40692 ?auto_40696 ) ) ( not ( = ?auto_40693 ?auto_40694 ) ) ( not ( = ?auto_40693 ?auto_40695 ) ) ( not ( = ?auto_40693 ?auto_40696 ) ) ( not ( = ?auto_40694 ?auto_40695 ) ) ( not ( = ?auto_40694 ?auto_40696 ) ) ( not ( = ?auto_40695 ?auto_40696 ) ) ( ON ?auto_40696 ?auto_40697 ) ( not ( = ?auto_40692 ?auto_40697 ) ) ( not ( = ?auto_40693 ?auto_40697 ) ) ( not ( = ?auto_40694 ?auto_40697 ) ) ( not ( = ?auto_40695 ?auto_40697 ) ) ( not ( = ?auto_40696 ?auto_40697 ) ) ( ON-TABLE ?auto_40697 ) ( ON ?auto_40692 ?auto_40698 ) ( not ( = ?auto_40692 ?auto_40698 ) ) ( not ( = ?auto_40693 ?auto_40698 ) ) ( not ( = ?auto_40694 ?auto_40698 ) ) ( not ( = ?auto_40695 ?auto_40698 ) ) ( not ( = ?auto_40696 ?auto_40698 ) ) ( not ( = ?auto_40697 ?auto_40698 ) ) ( ON ?auto_40693 ?auto_40692 ) ( ON-TABLE ?auto_40698 ) ( ON ?auto_40694 ?auto_40693 ) ( CLEAR ?auto_40696 ) ( ON ?auto_40695 ?auto_40694 ) ( CLEAR ?auto_40695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40698 ?auto_40692 ?auto_40693 ?auto_40694 )
      ( MAKE-5PILE ?auto_40692 ?auto_40693 ?auto_40694 ?auto_40695 ?auto_40696 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40699 - BLOCK
      ?auto_40700 - BLOCK
      ?auto_40701 - BLOCK
      ?auto_40702 - BLOCK
      ?auto_40703 - BLOCK
    )
    :vars
    (
      ?auto_40705 - BLOCK
      ?auto_40704 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40699 ?auto_40700 ) ) ( not ( = ?auto_40699 ?auto_40701 ) ) ( not ( = ?auto_40699 ?auto_40702 ) ) ( not ( = ?auto_40699 ?auto_40703 ) ) ( not ( = ?auto_40700 ?auto_40701 ) ) ( not ( = ?auto_40700 ?auto_40702 ) ) ( not ( = ?auto_40700 ?auto_40703 ) ) ( not ( = ?auto_40701 ?auto_40702 ) ) ( not ( = ?auto_40701 ?auto_40703 ) ) ( not ( = ?auto_40702 ?auto_40703 ) ) ( not ( = ?auto_40699 ?auto_40705 ) ) ( not ( = ?auto_40700 ?auto_40705 ) ) ( not ( = ?auto_40701 ?auto_40705 ) ) ( not ( = ?auto_40702 ?auto_40705 ) ) ( not ( = ?auto_40703 ?auto_40705 ) ) ( ON-TABLE ?auto_40705 ) ( ON ?auto_40699 ?auto_40704 ) ( not ( = ?auto_40699 ?auto_40704 ) ) ( not ( = ?auto_40700 ?auto_40704 ) ) ( not ( = ?auto_40701 ?auto_40704 ) ) ( not ( = ?auto_40702 ?auto_40704 ) ) ( not ( = ?auto_40703 ?auto_40704 ) ) ( not ( = ?auto_40705 ?auto_40704 ) ) ( ON ?auto_40700 ?auto_40699 ) ( ON-TABLE ?auto_40704 ) ( ON ?auto_40701 ?auto_40700 ) ( ON ?auto_40702 ?auto_40701 ) ( CLEAR ?auto_40702 ) ( HOLDING ?auto_40703 ) ( CLEAR ?auto_40705 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40705 ?auto_40703 )
      ( MAKE-5PILE ?auto_40699 ?auto_40700 ?auto_40701 ?auto_40702 ?auto_40703 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40706 - BLOCK
      ?auto_40707 - BLOCK
      ?auto_40708 - BLOCK
      ?auto_40709 - BLOCK
      ?auto_40710 - BLOCK
    )
    :vars
    (
      ?auto_40711 - BLOCK
      ?auto_40712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40706 ?auto_40707 ) ) ( not ( = ?auto_40706 ?auto_40708 ) ) ( not ( = ?auto_40706 ?auto_40709 ) ) ( not ( = ?auto_40706 ?auto_40710 ) ) ( not ( = ?auto_40707 ?auto_40708 ) ) ( not ( = ?auto_40707 ?auto_40709 ) ) ( not ( = ?auto_40707 ?auto_40710 ) ) ( not ( = ?auto_40708 ?auto_40709 ) ) ( not ( = ?auto_40708 ?auto_40710 ) ) ( not ( = ?auto_40709 ?auto_40710 ) ) ( not ( = ?auto_40706 ?auto_40711 ) ) ( not ( = ?auto_40707 ?auto_40711 ) ) ( not ( = ?auto_40708 ?auto_40711 ) ) ( not ( = ?auto_40709 ?auto_40711 ) ) ( not ( = ?auto_40710 ?auto_40711 ) ) ( ON-TABLE ?auto_40711 ) ( ON ?auto_40706 ?auto_40712 ) ( not ( = ?auto_40706 ?auto_40712 ) ) ( not ( = ?auto_40707 ?auto_40712 ) ) ( not ( = ?auto_40708 ?auto_40712 ) ) ( not ( = ?auto_40709 ?auto_40712 ) ) ( not ( = ?auto_40710 ?auto_40712 ) ) ( not ( = ?auto_40711 ?auto_40712 ) ) ( ON ?auto_40707 ?auto_40706 ) ( ON-TABLE ?auto_40712 ) ( ON ?auto_40708 ?auto_40707 ) ( ON ?auto_40709 ?auto_40708 ) ( CLEAR ?auto_40711 ) ( ON ?auto_40710 ?auto_40709 ) ( CLEAR ?auto_40710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40712 ?auto_40706 ?auto_40707 ?auto_40708 ?auto_40709 )
      ( MAKE-5PILE ?auto_40706 ?auto_40707 ?auto_40708 ?auto_40709 ?auto_40710 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40713 - BLOCK
      ?auto_40714 - BLOCK
      ?auto_40715 - BLOCK
      ?auto_40716 - BLOCK
      ?auto_40717 - BLOCK
    )
    :vars
    (
      ?auto_40718 - BLOCK
      ?auto_40719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40713 ?auto_40714 ) ) ( not ( = ?auto_40713 ?auto_40715 ) ) ( not ( = ?auto_40713 ?auto_40716 ) ) ( not ( = ?auto_40713 ?auto_40717 ) ) ( not ( = ?auto_40714 ?auto_40715 ) ) ( not ( = ?auto_40714 ?auto_40716 ) ) ( not ( = ?auto_40714 ?auto_40717 ) ) ( not ( = ?auto_40715 ?auto_40716 ) ) ( not ( = ?auto_40715 ?auto_40717 ) ) ( not ( = ?auto_40716 ?auto_40717 ) ) ( not ( = ?auto_40713 ?auto_40718 ) ) ( not ( = ?auto_40714 ?auto_40718 ) ) ( not ( = ?auto_40715 ?auto_40718 ) ) ( not ( = ?auto_40716 ?auto_40718 ) ) ( not ( = ?auto_40717 ?auto_40718 ) ) ( ON ?auto_40713 ?auto_40719 ) ( not ( = ?auto_40713 ?auto_40719 ) ) ( not ( = ?auto_40714 ?auto_40719 ) ) ( not ( = ?auto_40715 ?auto_40719 ) ) ( not ( = ?auto_40716 ?auto_40719 ) ) ( not ( = ?auto_40717 ?auto_40719 ) ) ( not ( = ?auto_40718 ?auto_40719 ) ) ( ON ?auto_40714 ?auto_40713 ) ( ON-TABLE ?auto_40719 ) ( ON ?auto_40715 ?auto_40714 ) ( ON ?auto_40716 ?auto_40715 ) ( ON ?auto_40717 ?auto_40716 ) ( CLEAR ?auto_40717 ) ( HOLDING ?auto_40718 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40718 )
      ( MAKE-5PILE ?auto_40713 ?auto_40714 ?auto_40715 ?auto_40716 ?auto_40717 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_40720 - BLOCK
      ?auto_40721 - BLOCK
      ?auto_40722 - BLOCK
      ?auto_40723 - BLOCK
      ?auto_40724 - BLOCK
    )
    :vars
    (
      ?auto_40725 - BLOCK
      ?auto_40726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40720 ?auto_40721 ) ) ( not ( = ?auto_40720 ?auto_40722 ) ) ( not ( = ?auto_40720 ?auto_40723 ) ) ( not ( = ?auto_40720 ?auto_40724 ) ) ( not ( = ?auto_40721 ?auto_40722 ) ) ( not ( = ?auto_40721 ?auto_40723 ) ) ( not ( = ?auto_40721 ?auto_40724 ) ) ( not ( = ?auto_40722 ?auto_40723 ) ) ( not ( = ?auto_40722 ?auto_40724 ) ) ( not ( = ?auto_40723 ?auto_40724 ) ) ( not ( = ?auto_40720 ?auto_40725 ) ) ( not ( = ?auto_40721 ?auto_40725 ) ) ( not ( = ?auto_40722 ?auto_40725 ) ) ( not ( = ?auto_40723 ?auto_40725 ) ) ( not ( = ?auto_40724 ?auto_40725 ) ) ( ON ?auto_40720 ?auto_40726 ) ( not ( = ?auto_40720 ?auto_40726 ) ) ( not ( = ?auto_40721 ?auto_40726 ) ) ( not ( = ?auto_40722 ?auto_40726 ) ) ( not ( = ?auto_40723 ?auto_40726 ) ) ( not ( = ?auto_40724 ?auto_40726 ) ) ( not ( = ?auto_40725 ?auto_40726 ) ) ( ON ?auto_40721 ?auto_40720 ) ( ON-TABLE ?auto_40726 ) ( ON ?auto_40722 ?auto_40721 ) ( ON ?auto_40723 ?auto_40722 ) ( ON ?auto_40724 ?auto_40723 ) ( ON ?auto_40725 ?auto_40724 ) ( CLEAR ?auto_40725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40726 ?auto_40720 ?auto_40721 ?auto_40722 ?auto_40723 ?auto_40724 )
      ( MAKE-5PILE ?auto_40720 ?auto_40721 ?auto_40722 ?auto_40723 ?auto_40724 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40739 - BLOCK
      ?auto_40740 - BLOCK
      ?auto_40741 - BLOCK
      ?auto_40742 - BLOCK
      ?auto_40743 - BLOCK
      ?auto_40744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_40743 ) ( ON-TABLE ?auto_40739 ) ( ON ?auto_40740 ?auto_40739 ) ( ON ?auto_40741 ?auto_40740 ) ( ON ?auto_40742 ?auto_40741 ) ( ON ?auto_40743 ?auto_40742 ) ( not ( = ?auto_40739 ?auto_40740 ) ) ( not ( = ?auto_40739 ?auto_40741 ) ) ( not ( = ?auto_40739 ?auto_40742 ) ) ( not ( = ?auto_40739 ?auto_40743 ) ) ( not ( = ?auto_40739 ?auto_40744 ) ) ( not ( = ?auto_40740 ?auto_40741 ) ) ( not ( = ?auto_40740 ?auto_40742 ) ) ( not ( = ?auto_40740 ?auto_40743 ) ) ( not ( = ?auto_40740 ?auto_40744 ) ) ( not ( = ?auto_40741 ?auto_40742 ) ) ( not ( = ?auto_40741 ?auto_40743 ) ) ( not ( = ?auto_40741 ?auto_40744 ) ) ( not ( = ?auto_40742 ?auto_40743 ) ) ( not ( = ?auto_40742 ?auto_40744 ) ) ( not ( = ?auto_40743 ?auto_40744 ) ) ( ON-TABLE ?auto_40744 ) ( CLEAR ?auto_40744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_40744 )
      ( MAKE-6PILE ?auto_40739 ?auto_40740 ?auto_40741 ?auto_40742 ?auto_40743 ?auto_40744 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40745 - BLOCK
      ?auto_40746 - BLOCK
      ?auto_40747 - BLOCK
      ?auto_40748 - BLOCK
      ?auto_40749 - BLOCK
      ?auto_40750 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40745 ) ( ON ?auto_40746 ?auto_40745 ) ( ON ?auto_40747 ?auto_40746 ) ( ON ?auto_40748 ?auto_40747 ) ( not ( = ?auto_40745 ?auto_40746 ) ) ( not ( = ?auto_40745 ?auto_40747 ) ) ( not ( = ?auto_40745 ?auto_40748 ) ) ( not ( = ?auto_40745 ?auto_40749 ) ) ( not ( = ?auto_40745 ?auto_40750 ) ) ( not ( = ?auto_40746 ?auto_40747 ) ) ( not ( = ?auto_40746 ?auto_40748 ) ) ( not ( = ?auto_40746 ?auto_40749 ) ) ( not ( = ?auto_40746 ?auto_40750 ) ) ( not ( = ?auto_40747 ?auto_40748 ) ) ( not ( = ?auto_40747 ?auto_40749 ) ) ( not ( = ?auto_40747 ?auto_40750 ) ) ( not ( = ?auto_40748 ?auto_40749 ) ) ( not ( = ?auto_40748 ?auto_40750 ) ) ( not ( = ?auto_40749 ?auto_40750 ) ) ( ON-TABLE ?auto_40750 ) ( CLEAR ?auto_40750 ) ( HOLDING ?auto_40749 ) ( CLEAR ?auto_40748 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40745 ?auto_40746 ?auto_40747 ?auto_40748 ?auto_40749 )
      ( MAKE-6PILE ?auto_40745 ?auto_40746 ?auto_40747 ?auto_40748 ?auto_40749 ?auto_40750 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40751 - BLOCK
      ?auto_40752 - BLOCK
      ?auto_40753 - BLOCK
      ?auto_40754 - BLOCK
      ?auto_40755 - BLOCK
      ?auto_40756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40751 ) ( ON ?auto_40752 ?auto_40751 ) ( ON ?auto_40753 ?auto_40752 ) ( ON ?auto_40754 ?auto_40753 ) ( not ( = ?auto_40751 ?auto_40752 ) ) ( not ( = ?auto_40751 ?auto_40753 ) ) ( not ( = ?auto_40751 ?auto_40754 ) ) ( not ( = ?auto_40751 ?auto_40755 ) ) ( not ( = ?auto_40751 ?auto_40756 ) ) ( not ( = ?auto_40752 ?auto_40753 ) ) ( not ( = ?auto_40752 ?auto_40754 ) ) ( not ( = ?auto_40752 ?auto_40755 ) ) ( not ( = ?auto_40752 ?auto_40756 ) ) ( not ( = ?auto_40753 ?auto_40754 ) ) ( not ( = ?auto_40753 ?auto_40755 ) ) ( not ( = ?auto_40753 ?auto_40756 ) ) ( not ( = ?auto_40754 ?auto_40755 ) ) ( not ( = ?auto_40754 ?auto_40756 ) ) ( not ( = ?auto_40755 ?auto_40756 ) ) ( ON-TABLE ?auto_40756 ) ( CLEAR ?auto_40754 ) ( ON ?auto_40755 ?auto_40756 ) ( CLEAR ?auto_40755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40756 )
      ( MAKE-6PILE ?auto_40751 ?auto_40752 ?auto_40753 ?auto_40754 ?auto_40755 ?auto_40756 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40757 - BLOCK
      ?auto_40758 - BLOCK
      ?auto_40759 - BLOCK
      ?auto_40760 - BLOCK
      ?auto_40761 - BLOCK
      ?auto_40762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40757 ) ( ON ?auto_40758 ?auto_40757 ) ( ON ?auto_40759 ?auto_40758 ) ( not ( = ?auto_40757 ?auto_40758 ) ) ( not ( = ?auto_40757 ?auto_40759 ) ) ( not ( = ?auto_40757 ?auto_40760 ) ) ( not ( = ?auto_40757 ?auto_40761 ) ) ( not ( = ?auto_40757 ?auto_40762 ) ) ( not ( = ?auto_40758 ?auto_40759 ) ) ( not ( = ?auto_40758 ?auto_40760 ) ) ( not ( = ?auto_40758 ?auto_40761 ) ) ( not ( = ?auto_40758 ?auto_40762 ) ) ( not ( = ?auto_40759 ?auto_40760 ) ) ( not ( = ?auto_40759 ?auto_40761 ) ) ( not ( = ?auto_40759 ?auto_40762 ) ) ( not ( = ?auto_40760 ?auto_40761 ) ) ( not ( = ?auto_40760 ?auto_40762 ) ) ( not ( = ?auto_40761 ?auto_40762 ) ) ( ON-TABLE ?auto_40762 ) ( ON ?auto_40761 ?auto_40762 ) ( CLEAR ?auto_40761 ) ( HOLDING ?auto_40760 ) ( CLEAR ?auto_40759 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40757 ?auto_40758 ?auto_40759 ?auto_40760 )
      ( MAKE-6PILE ?auto_40757 ?auto_40758 ?auto_40759 ?auto_40760 ?auto_40761 ?auto_40762 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40763 - BLOCK
      ?auto_40764 - BLOCK
      ?auto_40765 - BLOCK
      ?auto_40766 - BLOCK
      ?auto_40767 - BLOCK
      ?auto_40768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40763 ) ( ON ?auto_40764 ?auto_40763 ) ( ON ?auto_40765 ?auto_40764 ) ( not ( = ?auto_40763 ?auto_40764 ) ) ( not ( = ?auto_40763 ?auto_40765 ) ) ( not ( = ?auto_40763 ?auto_40766 ) ) ( not ( = ?auto_40763 ?auto_40767 ) ) ( not ( = ?auto_40763 ?auto_40768 ) ) ( not ( = ?auto_40764 ?auto_40765 ) ) ( not ( = ?auto_40764 ?auto_40766 ) ) ( not ( = ?auto_40764 ?auto_40767 ) ) ( not ( = ?auto_40764 ?auto_40768 ) ) ( not ( = ?auto_40765 ?auto_40766 ) ) ( not ( = ?auto_40765 ?auto_40767 ) ) ( not ( = ?auto_40765 ?auto_40768 ) ) ( not ( = ?auto_40766 ?auto_40767 ) ) ( not ( = ?auto_40766 ?auto_40768 ) ) ( not ( = ?auto_40767 ?auto_40768 ) ) ( ON-TABLE ?auto_40768 ) ( ON ?auto_40767 ?auto_40768 ) ( CLEAR ?auto_40765 ) ( ON ?auto_40766 ?auto_40767 ) ( CLEAR ?auto_40766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40768 ?auto_40767 )
      ( MAKE-6PILE ?auto_40763 ?auto_40764 ?auto_40765 ?auto_40766 ?auto_40767 ?auto_40768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40769 - BLOCK
      ?auto_40770 - BLOCK
      ?auto_40771 - BLOCK
      ?auto_40772 - BLOCK
      ?auto_40773 - BLOCK
      ?auto_40774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40769 ) ( ON ?auto_40770 ?auto_40769 ) ( not ( = ?auto_40769 ?auto_40770 ) ) ( not ( = ?auto_40769 ?auto_40771 ) ) ( not ( = ?auto_40769 ?auto_40772 ) ) ( not ( = ?auto_40769 ?auto_40773 ) ) ( not ( = ?auto_40769 ?auto_40774 ) ) ( not ( = ?auto_40770 ?auto_40771 ) ) ( not ( = ?auto_40770 ?auto_40772 ) ) ( not ( = ?auto_40770 ?auto_40773 ) ) ( not ( = ?auto_40770 ?auto_40774 ) ) ( not ( = ?auto_40771 ?auto_40772 ) ) ( not ( = ?auto_40771 ?auto_40773 ) ) ( not ( = ?auto_40771 ?auto_40774 ) ) ( not ( = ?auto_40772 ?auto_40773 ) ) ( not ( = ?auto_40772 ?auto_40774 ) ) ( not ( = ?auto_40773 ?auto_40774 ) ) ( ON-TABLE ?auto_40774 ) ( ON ?auto_40773 ?auto_40774 ) ( ON ?auto_40772 ?auto_40773 ) ( CLEAR ?auto_40772 ) ( HOLDING ?auto_40771 ) ( CLEAR ?auto_40770 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40769 ?auto_40770 ?auto_40771 )
      ( MAKE-6PILE ?auto_40769 ?auto_40770 ?auto_40771 ?auto_40772 ?auto_40773 ?auto_40774 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40775 - BLOCK
      ?auto_40776 - BLOCK
      ?auto_40777 - BLOCK
      ?auto_40778 - BLOCK
      ?auto_40779 - BLOCK
      ?auto_40780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40775 ) ( ON ?auto_40776 ?auto_40775 ) ( not ( = ?auto_40775 ?auto_40776 ) ) ( not ( = ?auto_40775 ?auto_40777 ) ) ( not ( = ?auto_40775 ?auto_40778 ) ) ( not ( = ?auto_40775 ?auto_40779 ) ) ( not ( = ?auto_40775 ?auto_40780 ) ) ( not ( = ?auto_40776 ?auto_40777 ) ) ( not ( = ?auto_40776 ?auto_40778 ) ) ( not ( = ?auto_40776 ?auto_40779 ) ) ( not ( = ?auto_40776 ?auto_40780 ) ) ( not ( = ?auto_40777 ?auto_40778 ) ) ( not ( = ?auto_40777 ?auto_40779 ) ) ( not ( = ?auto_40777 ?auto_40780 ) ) ( not ( = ?auto_40778 ?auto_40779 ) ) ( not ( = ?auto_40778 ?auto_40780 ) ) ( not ( = ?auto_40779 ?auto_40780 ) ) ( ON-TABLE ?auto_40780 ) ( ON ?auto_40779 ?auto_40780 ) ( ON ?auto_40778 ?auto_40779 ) ( CLEAR ?auto_40776 ) ( ON ?auto_40777 ?auto_40778 ) ( CLEAR ?auto_40777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40780 ?auto_40779 ?auto_40778 )
      ( MAKE-6PILE ?auto_40775 ?auto_40776 ?auto_40777 ?auto_40778 ?auto_40779 ?auto_40780 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40781 - BLOCK
      ?auto_40782 - BLOCK
      ?auto_40783 - BLOCK
      ?auto_40784 - BLOCK
      ?auto_40785 - BLOCK
      ?auto_40786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40781 ) ( not ( = ?auto_40781 ?auto_40782 ) ) ( not ( = ?auto_40781 ?auto_40783 ) ) ( not ( = ?auto_40781 ?auto_40784 ) ) ( not ( = ?auto_40781 ?auto_40785 ) ) ( not ( = ?auto_40781 ?auto_40786 ) ) ( not ( = ?auto_40782 ?auto_40783 ) ) ( not ( = ?auto_40782 ?auto_40784 ) ) ( not ( = ?auto_40782 ?auto_40785 ) ) ( not ( = ?auto_40782 ?auto_40786 ) ) ( not ( = ?auto_40783 ?auto_40784 ) ) ( not ( = ?auto_40783 ?auto_40785 ) ) ( not ( = ?auto_40783 ?auto_40786 ) ) ( not ( = ?auto_40784 ?auto_40785 ) ) ( not ( = ?auto_40784 ?auto_40786 ) ) ( not ( = ?auto_40785 ?auto_40786 ) ) ( ON-TABLE ?auto_40786 ) ( ON ?auto_40785 ?auto_40786 ) ( ON ?auto_40784 ?auto_40785 ) ( ON ?auto_40783 ?auto_40784 ) ( CLEAR ?auto_40783 ) ( HOLDING ?auto_40782 ) ( CLEAR ?auto_40781 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40781 ?auto_40782 )
      ( MAKE-6PILE ?auto_40781 ?auto_40782 ?auto_40783 ?auto_40784 ?auto_40785 ?auto_40786 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40787 - BLOCK
      ?auto_40788 - BLOCK
      ?auto_40789 - BLOCK
      ?auto_40790 - BLOCK
      ?auto_40791 - BLOCK
      ?auto_40792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_40787 ) ( not ( = ?auto_40787 ?auto_40788 ) ) ( not ( = ?auto_40787 ?auto_40789 ) ) ( not ( = ?auto_40787 ?auto_40790 ) ) ( not ( = ?auto_40787 ?auto_40791 ) ) ( not ( = ?auto_40787 ?auto_40792 ) ) ( not ( = ?auto_40788 ?auto_40789 ) ) ( not ( = ?auto_40788 ?auto_40790 ) ) ( not ( = ?auto_40788 ?auto_40791 ) ) ( not ( = ?auto_40788 ?auto_40792 ) ) ( not ( = ?auto_40789 ?auto_40790 ) ) ( not ( = ?auto_40789 ?auto_40791 ) ) ( not ( = ?auto_40789 ?auto_40792 ) ) ( not ( = ?auto_40790 ?auto_40791 ) ) ( not ( = ?auto_40790 ?auto_40792 ) ) ( not ( = ?auto_40791 ?auto_40792 ) ) ( ON-TABLE ?auto_40792 ) ( ON ?auto_40791 ?auto_40792 ) ( ON ?auto_40790 ?auto_40791 ) ( ON ?auto_40789 ?auto_40790 ) ( CLEAR ?auto_40787 ) ( ON ?auto_40788 ?auto_40789 ) ( CLEAR ?auto_40788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40792 ?auto_40791 ?auto_40790 ?auto_40789 )
      ( MAKE-6PILE ?auto_40787 ?auto_40788 ?auto_40789 ?auto_40790 ?auto_40791 ?auto_40792 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40793 - BLOCK
      ?auto_40794 - BLOCK
      ?auto_40795 - BLOCK
      ?auto_40796 - BLOCK
      ?auto_40797 - BLOCK
      ?auto_40798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40793 ?auto_40794 ) ) ( not ( = ?auto_40793 ?auto_40795 ) ) ( not ( = ?auto_40793 ?auto_40796 ) ) ( not ( = ?auto_40793 ?auto_40797 ) ) ( not ( = ?auto_40793 ?auto_40798 ) ) ( not ( = ?auto_40794 ?auto_40795 ) ) ( not ( = ?auto_40794 ?auto_40796 ) ) ( not ( = ?auto_40794 ?auto_40797 ) ) ( not ( = ?auto_40794 ?auto_40798 ) ) ( not ( = ?auto_40795 ?auto_40796 ) ) ( not ( = ?auto_40795 ?auto_40797 ) ) ( not ( = ?auto_40795 ?auto_40798 ) ) ( not ( = ?auto_40796 ?auto_40797 ) ) ( not ( = ?auto_40796 ?auto_40798 ) ) ( not ( = ?auto_40797 ?auto_40798 ) ) ( ON-TABLE ?auto_40798 ) ( ON ?auto_40797 ?auto_40798 ) ( ON ?auto_40796 ?auto_40797 ) ( ON ?auto_40795 ?auto_40796 ) ( ON ?auto_40794 ?auto_40795 ) ( CLEAR ?auto_40794 ) ( HOLDING ?auto_40793 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40793 )
      ( MAKE-6PILE ?auto_40793 ?auto_40794 ?auto_40795 ?auto_40796 ?auto_40797 ?auto_40798 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40799 - BLOCK
      ?auto_40800 - BLOCK
      ?auto_40801 - BLOCK
      ?auto_40802 - BLOCK
      ?auto_40803 - BLOCK
      ?auto_40804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40799 ?auto_40800 ) ) ( not ( = ?auto_40799 ?auto_40801 ) ) ( not ( = ?auto_40799 ?auto_40802 ) ) ( not ( = ?auto_40799 ?auto_40803 ) ) ( not ( = ?auto_40799 ?auto_40804 ) ) ( not ( = ?auto_40800 ?auto_40801 ) ) ( not ( = ?auto_40800 ?auto_40802 ) ) ( not ( = ?auto_40800 ?auto_40803 ) ) ( not ( = ?auto_40800 ?auto_40804 ) ) ( not ( = ?auto_40801 ?auto_40802 ) ) ( not ( = ?auto_40801 ?auto_40803 ) ) ( not ( = ?auto_40801 ?auto_40804 ) ) ( not ( = ?auto_40802 ?auto_40803 ) ) ( not ( = ?auto_40802 ?auto_40804 ) ) ( not ( = ?auto_40803 ?auto_40804 ) ) ( ON-TABLE ?auto_40804 ) ( ON ?auto_40803 ?auto_40804 ) ( ON ?auto_40802 ?auto_40803 ) ( ON ?auto_40801 ?auto_40802 ) ( ON ?auto_40800 ?auto_40801 ) ( ON ?auto_40799 ?auto_40800 ) ( CLEAR ?auto_40799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40804 ?auto_40803 ?auto_40802 ?auto_40801 ?auto_40800 )
      ( MAKE-6PILE ?auto_40799 ?auto_40800 ?auto_40801 ?auto_40802 ?auto_40803 ?auto_40804 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40811 - BLOCK
      ?auto_40812 - BLOCK
      ?auto_40813 - BLOCK
      ?auto_40814 - BLOCK
      ?auto_40815 - BLOCK
      ?auto_40816 - BLOCK
    )
    :vars
    (
      ?auto_40817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40811 ?auto_40812 ) ) ( not ( = ?auto_40811 ?auto_40813 ) ) ( not ( = ?auto_40811 ?auto_40814 ) ) ( not ( = ?auto_40811 ?auto_40815 ) ) ( not ( = ?auto_40811 ?auto_40816 ) ) ( not ( = ?auto_40812 ?auto_40813 ) ) ( not ( = ?auto_40812 ?auto_40814 ) ) ( not ( = ?auto_40812 ?auto_40815 ) ) ( not ( = ?auto_40812 ?auto_40816 ) ) ( not ( = ?auto_40813 ?auto_40814 ) ) ( not ( = ?auto_40813 ?auto_40815 ) ) ( not ( = ?auto_40813 ?auto_40816 ) ) ( not ( = ?auto_40814 ?auto_40815 ) ) ( not ( = ?auto_40814 ?auto_40816 ) ) ( not ( = ?auto_40815 ?auto_40816 ) ) ( ON-TABLE ?auto_40816 ) ( ON ?auto_40815 ?auto_40816 ) ( ON ?auto_40814 ?auto_40815 ) ( ON ?auto_40813 ?auto_40814 ) ( ON ?auto_40812 ?auto_40813 ) ( CLEAR ?auto_40812 ) ( ON ?auto_40811 ?auto_40817 ) ( CLEAR ?auto_40811 ) ( HAND-EMPTY ) ( not ( = ?auto_40811 ?auto_40817 ) ) ( not ( = ?auto_40812 ?auto_40817 ) ) ( not ( = ?auto_40813 ?auto_40817 ) ) ( not ( = ?auto_40814 ?auto_40817 ) ) ( not ( = ?auto_40815 ?auto_40817 ) ) ( not ( = ?auto_40816 ?auto_40817 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_40811 ?auto_40817 )
      ( MAKE-6PILE ?auto_40811 ?auto_40812 ?auto_40813 ?auto_40814 ?auto_40815 ?auto_40816 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40818 - BLOCK
      ?auto_40819 - BLOCK
      ?auto_40820 - BLOCK
      ?auto_40821 - BLOCK
      ?auto_40822 - BLOCK
      ?auto_40823 - BLOCK
    )
    :vars
    (
      ?auto_40824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40818 ?auto_40819 ) ) ( not ( = ?auto_40818 ?auto_40820 ) ) ( not ( = ?auto_40818 ?auto_40821 ) ) ( not ( = ?auto_40818 ?auto_40822 ) ) ( not ( = ?auto_40818 ?auto_40823 ) ) ( not ( = ?auto_40819 ?auto_40820 ) ) ( not ( = ?auto_40819 ?auto_40821 ) ) ( not ( = ?auto_40819 ?auto_40822 ) ) ( not ( = ?auto_40819 ?auto_40823 ) ) ( not ( = ?auto_40820 ?auto_40821 ) ) ( not ( = ?auto_40820 ?auto_40822 ) ) ( not ( = ?auto_40820 ?auto_40823 ) ) ( not ( = ?auto_40821 ?auto_40822 ) ) ( not ( = ?auto_40821 ?auto_40823 ) ) ( not ( = ?auto_40822 ?auto_40823 ) ) ( ON-TABLE ?auto_40823 ) ( ON ?auto_40822 ?auto_40823 ) ( ON ?auto_40821 ?auto_40822 ) ( ON ?auto_40820 ?auto_40821 ) ( ON ?auto_40818 ?auto_40824 ) ( CLEAR ?auto_40818 ) ( not ( = ?auto_40818 ?auto_40824 ) ) ( not ( = ?auto_40819 ?auto_40824 ) ) ( not ( = ?auto_40820 ?auto_40824 ) ) ( not ( = ?auto_40821 ?auto_40824 ) ) ( not ( = ?auto_40822 ?auto_40824 ) ) ( not ( = ?auto_40823 ?auto_40824 ) ) ( HOLDING ?auto_40819 ) ( CLEAR ?auto_40820 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40823 ?auto_40822 ?auto_40821 ?auto_40820 ?auto_40819 )
      ( MAKE-6PILE ?auto_40818 ?auto_40819 ?auto_40820 ?auto_40821 ?auto_40822 ?auto_40823 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40825 - BLOCK
      ?auto_40826 - BLOCK
      ?auto_40827 - BLOCK
      ?auto_40828 - BLOCK
      ?auto_40829 - BLOCK
      ?auto_40830 - BLOCK
    )
    :vars
    (
      ?auto_40831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40825 ?auto_40826 ) ) ( not ( = ?auto_40825 ?auto_40827 ) ) ( not ( = ?auto_40825 ?auto_40828 ) ) ( not ( = ?auto_40825 ?auto_40829 ) ) ( not ( = ?auto_40825 ?auto_40830 ) ) ( not ( = ?auto_40826 ?auto_40827 ) ) ( not ( = ?auto_40826 ?auto_40828 ) ) ( not ( = ?auto_40826 ?auto_40829 ) ) ( not ( = ?auto_40826 ?auto_40830 ) ) ( not ( = ?auto_40827 ?auto_40828 ) ) ( not ( = ?auto_40827 ?auto_40829 ) ) ( not ( = ?auto_40827 ?auto_40830 ) ) ( not ( = ?auto_40828 ?auto_40829 ) ) ( not ( = ?auto_40828 ?auto_40830 ) ) ( not ( = ?auto_40829 ?auto_40830 ) ) ( ON-TABLE ?auto_40830 ) ( ON ?auto_40829 ?auto_40830 ) ( ON ?auto_40828 ?auto_40829 ) ( ON ?auto_40827 ?auto_40828 ) ( ON ?auto_40825 ?auto_40831 ) ( not ( = ?auto_40825 ?auto_40831 ) ) ( not ( = ?auto_40826 ?auto_40831 ) ) ( not ( = ?auto_40827 ?auto_40831 ) ) ( not ( = ?auto_40828 ?auto_40831 ) ) ( not ( = ?auto_40829 ?auto_40831 ) ) ( not ( = ?auto_40830 ?auto_40831 ) ) ( CLEAR ?auto_40827 ) ( ON ?auto_40826 ?auto_40825 ) ( CLEAR ?auto_40826 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_40831 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40831 ?auto_40825 )
      ( MAKE-6PILE ?auto_40825 ?auto_40826 ?auto_40827 ?auto_40828 ?auto_40829 ?auto_40830 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40832 - BLOCK
      ?auto_40833 - BLOCK
      ?auto_40834 - BLOCK
      ?auto_40835 - BLOCK
      ?auto_40836 - BLOCK
      ?auto_40837 - BLOCK
    )
    :vars
    (
      ?auto_40838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40832 ?auto_40833 ) ) ( not ( = ?auto_40832 ?auto_40834 ) ) ( not ( = ?auto_40832 ?auto_40835 ) ) ( not ( = ?auto_40832 ?auto_40836 ) ) ( not ( = ?auto_40832 ?auto_40837 ) ) ( not ( = ?auto_40833 ?auto_40834 ) ) ( not ( = ?auto_40833 ?auto_40835 ) ) ( not ( = ?auto_40833 ?auto_40836 ) ) ( not ( = ?auto_40833 ?auto_40837 ) ) ( not ( = ?auto_40834 ?auto_40835 ) ) ( not ( = ?auto_40834 ?auto_40836 ) ) ( not ( = ?auto_40834 ?auto_40837 ) ) ( not ( = ?auto_40835 ?auto_40836 ) ) ( not ( = ?auto_40835 ?auto_40837 ) ) ( not ( = ?auto_40836 ?auto_40837 ) ) ( ON-TABLE ?auto_40837 ) ( ON ?auto_40836 ?auto_40837 ) ( ON ?auto_40835 ?auto_40836 ) ( ON ?auto_40832 ?auto_40838 ) ( not ( = ?auto_40832 ?auto_40838 ) ) ( not ( = ?auto_40833 ?auto_40838 ) ) ( not ( = ?auto_40834 ?auto_40838 ) ) ( not ( = ?auto_40835 ?auto_40838 ) ) ( not ( = ?auto_40836 ?auto_40838 ) ) ( not ( = ?auto_40837 ?auto_40838 ) ) ( ON ?auto_40833 ?auto_40832 ) ( CLEAR ?auto_40833 ) ( ON-TABLE ?auto_40838 ) ( HOLDING ?auto_40834 ) ( CLEAR ?auto_40835 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40837 ?auto_40836 ?auto_40835 ?auto_40834 )
      ( MAKE-6PILE ?auto_40832 ?auto_40833 ?auto_40834 ?auto_40835 ?auto_40836 ?auto_40837 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40839 - BLOCK
      ?auto_40840 - BLOCK
      ?auto_40841 - BLOCK
      ?auto_40842 - BLOCK
      ?auto_40843 - BLOCK
      ?auto_40844 - BLOCK
    )
    :vars
    (
      ?auto_40845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40839 ?auto_40840 ) ) ( not ( = ?auto_40839 ?auto_40841 ) ) ( not ( = ?auto_40839 ?auto_40842 ) ) ( not ( = ?auto_40839 ?auto_40843 ) ) ( not ( = ?auto_40839 ?auto_40844 ) ) ( not ( = ?auto_40840 ?auto_40841 ) ) ( not ( = ?auto_40840 ?auto_40842 ) ) ( not ( = ?auto_40840 ?auto_40843 ) ) ( not ( = ?auto_40840 ?auto_40844 ) ) ( not ( = ?auto_40841 ?auto_40842 ) ) ( not ( = ?auto_40841 ?auto_40843 ) ) ( not ( = ?auto_40841 ?auto_40844 ) ) ( not ( = ?auto_40842 ?auto_40843 ) ) ( not ( = ?auto_40842 ?auto_40844 ) ) ( not ( = ?auto_40843 ?auto_40844 ) ) ( ON-TABLE ?auto_40844 ) ( ON ?auto_40843 ?auto_40844 ) ( ON ?auto_40842 ?auto_40843 ) ( ON ?auto_40839 ?auto_40845 ) ( not ( = ?auto_40839 ?auto_40845 ) ) ( not ( = ?auto_40840 ?auto_40845 ) ) ( not ( = ?auto_40841 ?auto_40845 ) ) ( not ( = ?auto_40842 ?auto_40845 ) ) ( not ( = ?auto_40843 ?auto_40845 ) ) ( not ( = ?auto_40844 ?auto_40845 ) ) ( ON ?auto_40840 ?auto_40839 ) ( ON-TABLE ?auto_40845 ) ( CLEAR ?auto_40842 ) ( ON ?auto_40841 ?auto_40840 ) ( CLEAR ?auto_40841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40845 ?auto_40839 ?auto_40840 )
      ( MAKE-6PILE ?auto_40839 ?auto_40840 ?auto_40841 ?auto_40842 ?auto_40843 ?auto_40844 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40846 - BLOCK
      ?auto_40847 - BLOCK
      ?auto_40848 - BLOCK
      ?auto_40849 - BLOCK
      ?auto_40850 - BLOCK
      ?auto_40851 - BLOCK
    )
    :vars
    (
      ?auto_40852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40846 ?auto_40847 ) ) ( not ( = ?auto_40846 ?auto_40848 ) ) ( not ( = ?auto_40846 ?auto_40849 ) ) ( not ( = ?auto_40846 ?auto_40850 ) ) ( not ( = ?auto_40846 ?auto_40851 ) ) ( not ( = ?auto_40847 ?auto_40848 ) ) ( not ( = ?auto_40847 ?auto_40849 ) ) ( not ( = ?auto_40847 ?auto_40850 ) ) ( not ( = ?auto_40847 ?auto_40851 ) ) ( not ( = ?auto_40848 ?auto_40849 ) ) ( not ( = ?auto_40848 ?auto_40850 ) ) ( not ( = ?auto_40848 ?auto_40851 ) ) ( not ( = ?auto_40849 ?auto_40850 ) ) ( not ( = ?auto_40849 ?auto_40851 ) ) ( not ( = ?auto_40850 ?auto_40851 ) ) ( ON-TABLE ?auto_40851 ) ( ON ?auto_40850 ?auto_40851 ) ( ON ?auto_40846 ?auto_40852 ) ( not ( = ?auto_40846 ?auto_40852 ) ) ( not ( = ?auto_40847 ?auto_40852 ) ) ( not ( = ?auto_40848 ?auto_40852 ) ) ( not ( = ?auto_40849 ?auto_40852 ) ) ( not ( = ?auto_40850 ?auto_40852 ) ) ( not ( = ?auto_40851 ?auto_40852 ) ) ( ON ?auto_40847 ?auto_40846 ) ( ON-TABLE ?auto_40852 ) ( ON ?auto_40848 ?auto_40847 ) ( CLEAR ?auto_40848 ) ( HOLDING ?auto_40849 ) ( CLEAR ?auto_40850 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_40851 ?auto_40850 ?auto_40849 )
      ( MAKE-6PILE ?auto_40846 ?auto_40847 ?auto_40848 ?auto_40849 ?auto_40850 ?auto_40851 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40853 - BLOCK
      ?auto_40854 - BLOCK
      ?auto_40855 - BLOCK
      ?auto_40856 - BLOCK
      ?auto_40857 - BLOCK
      ?auto_40858 - BLOCK
    )
    :vars
    (
      ?auto_40859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40853 ?auto_40854 ) ) ( not ( = ?auto_40853 ?auto_40855 ) ) ( not ( = ?auto_40853 ?auto_40856 ) ) ( not ( = ?auto_40853 ?auto_40857 ) ) ( not ( = ?auto_40853 ?auto_40858 ) ) ( not ( = ?auto_40854 ?auto_40855 ) ) ( not ( = ?auto_40854 ?auto_40856 ) ) ( not ( = ?auto_40854 ?auto_40857 ) ) ( not ( = ?auto_40854 ?auto_40858 ) ) ( not ( = ?auto_40855 ?auto_40856 ) ) ( not ( = ?auto_40855 ?auto_40857 ) ) ( not ( = ?auto_40855 ?auto_40858 ) ) ( not ( = ?auto_40856 ?auto_40857 ) ) ( not ( = ?auto_40856 ?auto_40858 ) ) ( not ( = ?auto_40857 ?auto_40858 ) ) ( ON-TABLE ?auto_40858 ) ( ON ?auto_40857 ?auto_40858 ) ( ON ?auto_40853 ?auto_40859 ) ( not ( = ?auto_40853 ?auto_40859 ) ) ( not ( = ?auto_40854 ?auto_40859 ) ) ( not ( = ?auto_40855 ?auto_40859 ) ) ( not ( = ?auto_40856 ?auto_40859 ) ) ( not ( = ?auto_40857 ?auto_40859 ) ) ( not ( = ?auto_40858 ?auto_40859 ) ) ( ON ?auto_40854 ?auto_40853 ) ( ON-TABLE ?auto_40859 ) ( ON ?auto_40855 ?auto_40854 ) ( CLEAR ?auto_40857 ) ( ON ?auto_40856 ?auto_40855 ) ( CLEAR ?auto_40856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_40859 ?auto_40853 ?auto_40854 ?auto_40855 )
      ( MAKE-6PILE ?auto_40853 ?auto_40854 ?auto_40855 ?auto_40856 ?auto_40857 ?auto_40858 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40860 - BLOCK
      ?auto_40861 - BLOCK
      ?auto_40862 - BLOCK
      ?auto_40863 - BLOCK
      ?auto_40864 - BLOCK
      ?auto_40865 - BLOCK
    )
    :vars
    (
      ?auto_40866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40860 ?auto_40861 ) ) ( not ( = ?auto_40860 ?auto_40862 ) ) ( not ( = ?auto_40860 ?auto_40863 ) ) ( not ( = ?auto_40860 ?auto_40864 ) ) ( not ( = ?auto_40860 ?auto_40865 ) ) ( not ( = ?auto_40861 ?auto_40862 ) ) ( not ( = ?auto_40861 ?auto_40863 ) ) ( not ( = ?auto_40861 ?auto_40864 ) ) ( not ( = ?auto_40861 ?auto_40865 ) ) ( not ( = ?auto_40862 ?auto_40863 ) ) ( not ( = ?auto_40862 ?auto_40864 ) ) ( not ( = ?auto_40862 ?auto_40865 ) ) ( not ( = ?auto_40863 ?auto_40864 ) ) ( not ( = ?auto_40863 ?auto_40865 ) ) ( not ( = ?auto_40864 ?auto_40865 ) ) ( ON-TABLE ?auto_40865 ) ( ON ?auto_40860 ?auto_40866 ) ( not ( = ?auto_40860 ?auto_40866 ) ) ( not ( = ?auto_40861 ?auto_40866 ) ) ( not ( = ?auto_40862 ?auto_40866 ) ) ( not ( = ?auto_40863 ?auto_40866 ) ) ( not ( = ?auto_40864 ?auto_40866 ) ) ( not ( = ?auto_40865 ?auto_40866 ) ) ( ON ?auto_40861 ?auto_40860 ) ( ON-TABLE ?auto_40866 ) ( ON ?auto_40862 ?auto_40861 ) ( ON ?auto_40863 ?auto_40862 ) ( CLEAR ?auto_40863 ) ( HOLDING ?auto_40864 ) ( CLEAR ?auto_40865 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_40865 ?auto_40864 )
      ( MAKE-6PILE ?auto_40860 ?auto_40861 ?auto_40862 ?auto_40863 ?auto_40864 ?auto_40865 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40867 - BLOCK
      ?auto_40868 - BLOCK
      ?auto_40869 - BLOCK
      ?auto_40870 - BLOCK
      ?auto_40871 - BLOCK
      ?auto_40872 - BLOCK
    )
    :vars
    (
      ?auto_40873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40867 ?auto_40868 ) ) ( not ( = ?auto_40867 ?auto_40869 ) ) ( not ( = ?auto_40867 ?auto_40870 ) ) ( not ( = ?auto_40867 ?auto_40871 ) ) ( not ( = ?auto_40867 ?auto_40872 ) ) ( not ( = ?auto_40868 ?auto_40869 ) ) ( not ( = ?auto_40868 ?auto_40870 ) ) ( not ( = ?auto_40868 ?auto_40871 ) ) ( not ( = ?auto_40868 ?auto_40872 ) ) ( not ( = ?auto_40869 ?auto_40870 ) ) ( not ( = ?auto_40869 ?auto_40871 ) ) ( not ( = ?auto_40869 ?auto_40872 ) ) ( not ( = ?auto_40870 ?auto_40871 ) ) ( not ( = ?auto_40870 ?auto_40872 ) ) ( not ( = ?auto_40871 ?auto_40872 ) ) ( ON-TABLE ?auto_40872 ) ( ON ?auto_40867 ?auto_40873 ) ( not ( = ?auto_40867 ?auto_40873 ) ) ( not ( = ?auto_40868 ?auto_40873 ) ) ( not ( = ?auto_40869 ?auto_40873 ) ) ( not ( = ?auto_40870 ?auto_40873 ) ) ( not ( = ?auto_40871 ?auto_40873 ) ) ( not ( = ?auto_40872 ?auto_40873 ) ) ( ON ?auto_40868 ?auto_40867 ) ( ON-TABLE ?auto_40873 ) ( ON ?auto_40869 ?auto_40868 ) ( ON ?auto_40870 ?auto_40869 ) ( CLEAR ?auto_40872 ) ( ON ?auto_40871 ?auto_40870 ) ( CLEAR ?auto_40871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_40873 ?auto_40867 ?auto_40868 ?auto_40869 ?auto_40870 )
      ( MAKE-6PILE ?auto_40867 ?auto_40868 ?auto_40869 ?auto_40870 ?auto_40871 ?auto_40872 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40874 - BLOCK
      ?auto_40875 - BLOCK
      ?auto_40876 - BLOCK
      ?auto_40877 - BLOCK
      ?auto_40878 - BLOCK
      ?auto_40879 - BLOCK
    )
    :vars
    (
      ?auto_40880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40874 ?auto_40875 ) ) ( not ( = ?auto_40874 ?auto_40876 ) ) ( not ( = ?auto_40874 ?auto_40877 ) ) ( not ( = ?auto_40874 ?auto_40878 ) ) ( not ( = ?auto_40874 ?auto_40879 ) ) ( not ( = ?auto_40875 ?auto_40876 ) ) ( not ( = ?auto_40875 ?auto_40877 ) ) ( not ( = ?auto_40875 ?auto_40878 ) ) ( not ( = ?auto_40875 ?auto_40879 ) ) ( not ( = ?auto_40876 ?auto_40877 ) ) ( not ( = ?auto_40876 ?auto_40878 ) ) ( not ( = ?auto_40876 ?auto_40879 ) ) ( not ( = ?auto_40877 ?auto_40878 ) ) ( not ( = ?auto_40877 ?auto_40879 ) ) ( not ( = ?auto_40878 ?auto_40879 ) ) ( ON ?auto_40874 ?auto_40880 ) ( not ( = ?auto_40874 ?auto_40880 ) ) ( not ( = ?auto_40875 ?auto_40880 ) ) ( not ( = ?auto_40876 ?auto_40880 ) ) ( not ( = ?auto_40877 ?auto_40880 ) ) ( not ( = ?auto_40878 ?auto_40880 ) ) ( not ( = ?auto_40879 ?auto_40880 ) ) ( ON ?auto_40875 ?auto_40874 ) ( ON-TABLE ?auto_40880 ) ( ON ?auto_40876 ?auto_40875 ) ( ON ?auto_40877 ?auto_40876 ) ( ON ?auto_40878 ?auto_40877 ) ( CLEAR ?auto_40878 ) ( HOLDING ?auto_40879 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_40879 )
      ( MAKE-6PILE ?auto_40874 ?auto_40875 ?auto_40876 ?auto_40877 ?auto_40878 ?auto_40879 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_40881 - BLOCK
      ?auto_40882 - BLOCK
      ?auto_40883 - BLOCK
      ?auto_40884 - BLOCK
      ?auto_40885 - BLOCK
      ?auto_40886 - BLOCK
    )
    :vars
    (
      ?auto_40887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_40881 ?auto_40882 ) ) ( not ( = ?auto_40881 ?auto_40883 ) ) ( not ( = ?auto_40881 ?auto_40884 ) ) ( not ( = ?auto_40881 ?auto_40885 ) ) ( not ( = ?auto_40881 ?auto_40886 ) ) ( not ( = ?auto_40882 ?auto_40883 ) ) ( not ( = ?auto_40882 ?auto_40884 ) ) ( not ( = ?auto_40882 ?auto_40885 ) ) ( not ( = ?auto_40882 ?auto_40886 ) ) ( not ( = ?auto_40883 ?auto_40884 ) ) ( not ( = ?auto_40883 ?auto_40885 ) ) ( not ( = ?auto_40883 ?auto_40886 ) ) ( not ( = ?auto_40884 ?auto_40885 ) ) ( not ( = ?auto_40884 ?auto_40886 ) ) ( not ( = ?auto_40885 ?auto_40886 ) ) ( ON ?auto_40881 ?auto_40887 ) ( not ( = ?auto_40881 ?auto_40887 ) ) ( not ( = ?auto_40882 ?auto_40887 ) ) ( not ( = ?auto_40883 ?auto_40887 ) ) ( not ( = ?auto_40884 ?auto_40887 ) ) ( not ( = ?auto_40885 ?auto_40887 ) ) ( not ( = ?auto_40886 ?auto_40887 ) ) ( ON ?auto_40882 ?auto_40881 ) ( ON-TABLE ?auto_40887 ) ( ON ?auto_40883 ?auto_40882 ) ( ON ?auto_40884 ?auto_40883 ) ( ON ?auto_40885 ?auto_40884 ) ( ON ?auto_40886 ?auto_40885 ) ( CLEAR ?auto_40886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_40887 ?auto_40881 ?auto_40882 ?auto_40883 ?auto_40884 ?auto_40885 )
      ( MAKE-6PILE ?auto_40881 ?auto_40882 ?auto_40883 ?auto_40884 ?auto_40885 ?auto_40886 ) )
  )

)

